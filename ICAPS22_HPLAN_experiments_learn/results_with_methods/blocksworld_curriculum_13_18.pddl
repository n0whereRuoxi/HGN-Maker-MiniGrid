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
      ?auto_267977 - BLOCK
    )
    :vars
    (
      ?auto_267978 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_267977 ?auto_267978 ) ( CLEAR ?auto_267977 ) ( HAND-EMPTY ) ( not ( = ?auto_267977 ?auto_267978 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_267977 ?auto_267978 )
      ( !PUTDOWN ?auto_267977 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_267980 - BLOCK
    )
    :vars
    (
      ?auto_267981 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_267980 ?auto_267981 ) ( CLEAR ?auto_267980 ) ( HAND-EMPTY ) ( not ( = ?auto_267980 ?auto_267981 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_267980 ?auto_267981 )
      ( !PUTDOWN ?auto_267980 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_267984 - BLOCK
      ?auto_267985 - BLOCK
    )
    :vars
    (
      ?auto_267986 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_267984 ) ( ON ?auto_267985 ?auto_267986 ) ( CLEAR ?auto_267985 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_267984 ) ( not ( = ?auto_267984 ?auto_267985 ) ) ( not ( = ?auto_267984 ?auto_267986 ) ) ( not ( = ?auto_267985 ?auto_267986 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_267985 ?auto_267986 )
      ( !STACK ?auto_267985 ?auto_267984 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_267989 - BLOCK
      ?auto_267990 - BLOCK
    )
    :vars
    (
      ?auto_267991 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_267989 ) ( ON ?auto_267990 ?auto_267991 ) ( CLEAR ?auto_267990 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_267989 ) ( not ( = ?auto_267989 ?auto_267990 ) ) ( not ( = ?auto_267989 ?auto_267991 ) ) ( not ( = ?auto_267990 ?auto_267991 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_267990 ?auto_267991 )
      ( !STACK ?auto_267990 ?auto_267989 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_267994 - BLOCK
      ?auto_267995 - BLOCK
    )
    :vars
    (
      ?auto_267996 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_267995 ?auto_267996 ) ( not ( = ?auto_267994 ?auto_267995 ) ) ( not ( = ?auto_267994 ?auto_267996 ) ) ( not ( = ?auto_267995 ?auto_267996 ) ) ( ON ?auto_267994 ?auto_267995 ) ( CLEAR ?auto_267994 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_267994 )
      ( MAKE-2PILE ?auto_267994 ?auto_267995 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_267999 - BLOCK
      ?auto_268000 - BLOCK
    )
    :vars
    (
      ?auto_268001 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268000 ?auto_268001 ) ( not ( = ?auto_267999 ?auto_268000 ) ) ( not ( = ?auto_267999 ?auto_268001 ) ) ( not ( = ?auto_268000 ?auto_268001 ) ) ( ON ?auto_267999 ?auto_268000 ) ( CLEAR ?auto_267999 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_267999 )
      ( MAKE-2PILE ?auto_267999 ?auto_268000 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_268005 - BLOCK
      ?auto_268006 - BLOCK
      ?auto_268007 - BLOCK
    )
    :vars
    (
      ?auto_268008 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_268006 ) ( ON ?auto_268007 ?auto_268008 ) ( CLEAR ?auto_268007 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_268005 ) ( ON ?auto_268006 ?auto_268005 ) ( not ( = ?auto_268005 ?auto_268006 ) ) ( not ( = ?auto_268005 ?auto_268007 ) ) ( not ( = ?auto_268005 ?auto_268008 ) ) ( not ( = ?auto_268006 ?auto_268007 ) ) ( not ( = ?auto_268006 ?auto_268008 ) ) ( not ( = ?auto_268007 ?auto_268008 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_268007 ?auto_268008 )
      ( !STACK ?auto_268007 ?auto_268006 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_268012 - BLOCK
      ?auto_268013 - BLOCK
      ?auto_268014 - BLOCK
    )
    :vars
    (
      ?auto_268015 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_268013 ) ( ON ?auto_268014 ?auto_268015 ) ( CLEAR ?auto_268014 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_268012 ) ( ON ?auto_268013 ?auto_268012 ) ( not ( = ?auto_268012 ?auto_268013 ) ) ( not ( = ?auto_268012 ?auto_268014 ) ) ( not ( = ?auto_268012 ?auto_268015 ) ) ( not ( = ?auto_268013 ?auto_268014 ) ) ( not ( = ?auto_268013 ?auto_268015 ) ) ( not ( = ?auto_268014 ?auto_268015 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_268014 ?auto_268015 )
      ( !STACK ?auto_268014 ?auto_268013 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_268019 - BLOCK
      ?auto_268020 - BLOCK
      ?auto_268021 - BLOCK
    )
    :vars
    (
      ?auto_268022 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268021 ?auto_268022 ) ( ON-TABLE ?auto_268019 ) ( not ( = ?auto_268019 ?auto_268020 ) ) ( not ( = ?auto_268019 ?auto_268021 ) ) ( not ( = ?auto_268019 ?auto_268022 ) ) ( not ( = ?auto_268020 ?auto_268021 ) ) ( not ( = ?auto_268020 ?auto_268022 ) ) ( not ( = ?auto_268021 ?auto_268022 ) ) ( CLEAR ?auto_268019 ) ( ON ?auto_268020 ?auto_268021 ) ( CLEAR ?auto_268020 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_268019 ?auto_268020 )
      ( MAKE-3PILE ?auto_268019 ?auto_268020 ?auto_268021 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_268026 - BLOCK
      ?auto_268027 - BLOCK
      ?auto_268028 - BLOCK
    )
    :vars
    (
      ?auto_268029 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268028 ?auto_268029 ) ( ON-TABLE ?auto_268026 ) ( not ( = ?auto_268026 ?auto_268027 ) ) ( not ( = ?auto_268026 ?auto_268028 ) ) ( not ( = ?auto_268026 ?auto_268029 ) ) ( not ( = ?auto_268027 ?auto_268028 ) ) ( not ( = ?auto_268027 ?auto_268029 ) ) ( not ( = ?auto_268028 ?auto_268029 ) ) ( CLEAR ?auto_268026 ) ( ON ?auto_268027 ?auto_268028 ) ( CLEAR ?auto_268027 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_268026 ?auto_268027 )
      ( MAKE-3PILE ?auto_268026 ?auto_268027 ?auto_268028 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_268033 - BLOCK
      ?auto_268034 - BLOCK
      ?auto_268035 - BLOCK
    )
    :vars
    (
      ?auto_268036 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268035 ?auto_268036 ) ( not ( = ?auto_268033 ?auto_268034 ) ) ( not ( = ?auto_268033 ?auto_268035 ) ) ( not ( = ?auto_268033 ?auto_268036 ) ) ( not ( = ?auto_268034 ?auto_268035 ) ) ( not ( = ?auto_268034 ?auto_268036 ) ) ( not ( = ?auto_268035 ?auto_268036 ) ) ( ON ?auto_268034 ?auto_268035 ) ( ON ?auto_268033 ?auto_268034 ) ( CLEAR ?auto_268033 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_268033 )
      ( MAKE-3PILE ?auto_268033 ?auto_268034 ?auto_268035 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_268040 - BLOCK
      ?auto_268041 - BLOCK
      ?auto_268042 - BLOCK
    )
    :vars
    (
      ?auto_268043 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268042 ?auto_268043 ) ( not ( = ?auto_268040 ?auto_268041 ) ) ( not ( = ?auto_268040 ?auto_268042 ) ) ( not ( = ?auto_268040 ?auto_268043 ) ) ( not ( = ?auto_268041 ?auto_268042 ) ) ( not ( = ?auto_268041 ?auto_268043 ) ) ( not ( = ?auto_268042 ?auto_268043 ) ) ( ON ?auto_268041 ?auto_268042 ) ( ON ?auto_268040 ?auto_268041 ) ( CLEAR ?auto_268040 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_268040 )
      ( MAKE-3PILE ?auto_268040 ?auto_268041 ?auto_268042 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_268048 - BLOCK
      ?auto_268049 - BLOCK
      ?auto_268050 - BLOCK
      ?auto_268051 - BLOCK
    )
    :vars
    (
      ?auto_268052 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_268050 ) ( ON ?auto_268051 ?auto_268052 ) ( CLEAR ?auto_268051 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_268048 ) ( ON ?auto_268049 ?auto_268048 ) ( ON ?auto_268050 ?auto_268049 ) ( not ( = ?auto_268048 ?auto_268049 ) ) ( not ( = ?auto_268048 ?auto_268050 ) ) ( not ( = ?auto_268048 ?auto_268051 ) ) ( not ( = ?auto_268048 ?auto_268052 ) ) ( not ( = ?auto_268049 ?auto_268050 ) ) ( not ( = ?auto_268049 ?auto_268051 ) ) ( not ( = ?auto_268049 ?auto_268052 ) ) ( not ( = ?auto_268050 ?auto_268051 ) ) ( not ( = ?auto_268050 ?auto_268052 ) ) ( not ( = ?auto_268051 ?auto_268052 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_268051 ?auto_268052 )
      ( !STACK ?auto_268051 ?auto_268050 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_268057 - BLOCK
      ?auto_268058 - BLOCK
      ?auto_268059 - BLOCK
      ?auto_268060 - BLOCK
    )
    :vars
    (
      ?auto_268061 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_268059 ) ( ON ?auto_268060 ?auto_268061 ) ( CLEAR ?auto_268060 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_268057 ) ( ON ?auto_268058 ?auto_268057 ) ( ON ?auto_268059 ?auto_268058 ) ( not ( = ?auto_268057 ?auto_268058 ) ) ( not ( = ?auto_268057 ?auto_268059 ) ) ( not ( = ?auto_268057 ?auto_268060 ) ) ( not ( = ?auto_268057 ?auto_268061 ) ) ( not ( = ?auto_268058 ?auto_268059 ) ) ( not ( = ?auto_268058 ?auto_268060 ) ) ( not ( = ?auto_268058 ?auto_268061 ) ) ( not ( = ?auto_268059 ?auto_268060 ) ) ( not ( = ?auto_268059 ?auto_268061 ) ) ( not ( = ?auto_268060 ?auto_268061 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_268060 ?auto_268061 )
      ( !STACK ?auto_268060 ?auto_268059 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_268066 - BLOCK
      ?auto_268067 - BLOCK
      ?auto_268068 - BLOCK
      ?auto_268069 - BLOCK
    )
    :vars
    (
      ?auto_268070 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268069 ?auto_268070 ) ( ON-TABLE ?auto_268066 ) ( ON ?auto_268067 ?auto_268066 ) ( not ( = ?auto_268066 ?auto_268067 ) ) ( not ( = ?auto_268066 ?auto_268068 ) ) ( not ( = ?auto_268066 ?auto_268069 ) ) ( not ( = ?auto_268066 ?auto_268070 ) ) ( not ( = ?auto_268067 ?auto_268068 ) ) ( not ( = ?auto_268067 ?auto_268069 ) ) ( not ( = ?auto_268067 ?auto_268070 ) ) ( not ( = ?auto_268068 ?auto_268069 ) ) ( not ( = ?auto_268068 ?auto_268070 ) ) ( not ( = ?auto_268069 ?auto_268070 ) ) ( CLEAR ?auto_268067 ) ( ON ?auto_268068 ?auto_268069 ) ( CLEAR ?auto_268068 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_268066 ?auto_268067 ?auto_268068 )
      ( MAKE-4PILE ?auto_268066 ?auto_268067 ?auto_268068 ?auto_268069 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_268075 - BLOCK
      ?auto_268076 - BLOCK
      ?auto_268077 - BLOCK
      ?auto_268078 - BLOCK
    )
    :vars
    (
      ?auto_268079 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268078 ?auto_268079 ) ( ON-TABLE ?auto_268075 ) ( ON ?auto_268076 ?auto_268075 ) ( not ( = ?auto_268075 ?auto_268076 ) ) ( not ( = ?auto_268075 ?auto_268077 ) ) ( not ( = ?auto_268075 ?auto_268078 ) ) ( not ( = ?auto_268075 ?auto_268079 ) ) ( not ( = ?auto_268076 ?auto_268077 ) ) ( not ( = ?auto_268076 ?auto_268078 ) ) ( not ( = ?auto_268076 ?auto_268079 ) ) ( not ( = ?auto_268077 ?auto_268078 ) ) ( not ( = ?auto_268077 ?auto_268079 ) ) ( not ( = ?auto_268078 ?auto_268079 ) ) ( CLEAR ?auto_268076 ) ( ON ?auto_268077 ?auto_268078 ) ( CLEAR ?auto_268077 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_268075 ?auto_268076 ?auto_268077 )
      ( MAKE-4PILE ?auto_268075 ?auto_268076 ?auto_268077 ?auto_268078 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_268084 - BLOCK
      ?auto_268085 - BLOCK
      ?auto_268086 - BLOCK
      ?auto_268087 - BLOCK
    )
    :vars
    (
      ?auto_268088 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268087 ?auto_268088 ) ( ON-TABLE ?auto_268084 ) ( not ( = ?auto_268084 ?auto_268085 ) ) ( not ( = ?auto_268084 ?auto_268086 ) ) ( not ( = ?auto_268084 ?auto_268087 ) ) ( not ( = ?auto_268084 ?auto_268088 ) ) ( not ( = ?auto_268085 ?auto_268086 ) ) ( not ( = ?auto_268085 ?auto_268087 ) ) ( not ( = ?auto_268085 ?auto_268088 ) ) ( not ( = ?auto_268086 ?auto_268087 ) ) ( not ( = ?auto_268086 ?auto_268088 ) ) ( not ( = ?auto_268087 ?auto_268088 ) ) ( ON ?auto_268086 ?auto_268087 ) ( CLEAR ?auto_268084 ) ( ON ?auto_268085 ?auto_268086 ) ( CLEAR ?auto_268085 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_268084 ?auto_268085 )
      ( MAKE-4PILE ?auto_268084 ?auto_268085 ?auto_268086 ?auto_268087 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_268093 - BLOCK
      ?auto_268094 - BLOCK
      ?auto_268095 - BLOCK
      ?auto_268096 - BLOCK
    )
    :vars
    (
      ?auto_268097 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268096 ?auto_268097 ) ( ON-TABLE ?auto_268093 ) ( not ( = ?auto_268093 ?auto_268094 ) ) ( not ( = ?auto_268093 ?auto_268095 ) ) ( not ( = ?auto_268093 ?auto_268096 ) ) ( not ( = ?auto_268093 ?auto_268097 ) ) ( not ( = ?auto_268094 ?auto_268095 ) ) ( not ( = ?auto_268094 ?auto_268096 ) ) ( not ( = ?auto_268094 ?auto_268097 ) ) ( not ( = ?auto_268095 ?auto_268096 ) ) ( not ( = ?auto_268095 ?auto_268097 ) ) ( not ( = ?auto_268096 ?auto_268097 ) ) ( ON ?auto_268095 ?auto_268096 ) ( CLEAR ?auto_268093 ) ( ON ?auto_268094 ?auto_268095 ) ( CLEAR ?auto_268094 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_268093 ?auto_268094 )
      ( MAKE-4PILE ?auto_268093 ?auto_268094 ?auto_268095 ?auto_268096 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_268102 - BLOCK
      ?auto_268103 - BLOCK
      ?auto_268104 - BLOCK
      ?auto_268105 - BLOCK
    )
    :vars
    (
      ?auto_268106 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268105 ?auto_268106 ) ( not ( = ?auto_268102 ?auto_268103 ) ) ( not ( = ?auto_268102 ?auto_268104 ) ) ( not ( = ?auto_268102 ?auto_268105 ) ) ( not ( = ?auto_268102 ?auto_268106 ) ) ( not ( = ?auto_268103 ?auto_268104 ) ) ( not ( = ?auto_268103 ?auto_268105 ) ) ( not ( = ?auto_268103 ?auto_268106 ) ) ( not ( = ?auto_268104 ?auto_268105 ) ) ( not ( = ?auto_268104 ?auto_268106 ) ) ( not ( = ?auto_268105 ?auto_268106 ) ) ( ON ?auto_268104 ?auto_268105 ) ( ON ?auto_268103 ?auto_268104 ) ( ON ?auto_268102 ?auto_268103 ) ( CLEAR ?auto_268102 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_268102 )
      ( MAKE-4PILE ?auto_268102 ?auto_268103 ?auto_268104 ?auto_268105 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_268111 - BLOCK
      ?auto_268112 - BLOCK
      ?auto_268113 - BLOCK
      ?auto_268114 - BLOCK
    )
    :vars
    (
      ?auto_268115 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268114 ?auto_268115 ) ( not ( = ?auto_268111 ?auto_268112 ) ) ( not ( = ?auto_268111 ?auto_268113 ) ) ( not ( = ?auto_268111 ?auto_268114 ) ) ( not ( = ?auto_268111 ?auto_268115 ) ) ( not ( = ?auto_268112 ?auto_268113 ) ) ( not ( = ?auto_268112 ?auto_268114 ) ) ( not ( = ?auto_268112 ?auto_268115 ) ) ( not ( = ?auto_268113 ?auto_268114 ) ) ( not ( = ?auto_268113 ?auto_268115 ) ) ( not ( = ?auto_268114 ?auto_268115 ) ) ( ON ?auto_268113 ?auto_268114 ) ( ON ?auto_268112 ?auto_268113 ) ( ON ?auto_268111 ?auto_268112 ) ( CLEAR ?auto_268111 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_268111 )
      ( MAKE-4PILE ?auto_268111 ?auto_268112 ?auto_268113 ?auto_268114 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_268121 - BLOCK
      ?auto_268122 - BLOCK
      ?auto_268123 - BLOCK
      ?auto_268124 - BLOCK
      ?auto_268125 - BLOCK
    )
    :vars
    (
      ?auto_268126 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_268124 ) ( ON ?auto_268125 ?auto_268126 ) ( CLEAR ?auto_268125 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_268121 ) ( ON ?auto_268122 ?auto_268121 ) ( ON ?auto_268123 ?auto_268122 ) ( ON ?auto_268124 ?auto_268123 ) ( not ( = ?auto_268121 ?auto_268122 ) ) ( not ( = ?auto_268121 ?auto_268123 ) ) ( not ( = ?auto_268121 ?auto_268124 ) ) ( not ( = ?auto_268121 ?auto_268125 ) ) ( not ( = ?auto_268121 ?auto_268126 ) ) ( not ( = ?auto_268122 ?auto_268123 ) ) ( not ( = ?auto_268122 ?auto_268124 ) ) ( not ( = ?auto_268122 ?auto_268125 ) ) ( not ( = ?auto_268122 ?auto_268126 ) ) ( not ( = ?auto_268123 ?auto_268124 ) ) ( not ( = ?auto_268123 ?auto_268125 ) ) ( not ( = ?auto_268123 ?auto_268126 ) ) ( not ( = ?auto_268124 ?auto_268125 ) ) ( not ( = ?auto_268124 ?auto_268126 ) ) ( not ( = ?auto_268125 ?auto_268126 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_268125 ?auto_268126 )
      ( !STACK ?auto_268125 ?auto_268124 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_268132 - BLOCK
      ?auto_268133 - BLOCK
      ?auto_268134 - BLOCK
      ?auto_268135 - BLOCK
      ?auto_268136 - BLOCK
    )
    :vars
    (
      ?auto_268137 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_268135 ) ( ON ?auto_268136 ?auto_268137 ) ( CLEAR ?auto_268136 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_268132 ) ( ON ?auto_268133 ?auto_268132 ) ( ON ?auto_268134 ?auto_268133 ) ( ON ?auto_268135 ?auto_268134 ) ( not ( = ?auto_268132 ?auto_268133 ) ) ( not ( = ?auto_268132 ?auto_268134 ) ) ( not ( = ?auto_268132 ?auto_268135 ) ) ( not ( = ?auto_268132 ?auto_268136 ) ) ( not ( = ?auto_268132 ?auto_268137 ) ) ( not ( = ?auto_268133 ?auto_268134 ) ) ( not ( = ?auto_268133 ?auto_268135 ) ) ( not ( = ?auto_268133 ?auto_268136 ) ) ( not ( = ?auto_268133 ?auto_268137 ) ) ( not ( = ?auto_268134 ?auto_268135 ) ) ( not ( = ?auto_268134 ?auto_268136 ) ) ( not ( = ?auto_268134 ?auto_268137 ) ) ( not ( = ?auto_268135 ?auto_268136 ) ) ( not ( = ?auto_268135 ?auto_268137 ) ) ( not ( = ?auto_268136 ?auto_268137 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_268136 ?auto_268137 )
      ( !STACK ?auto_268136 ?auto_268135 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_268143 - BLOCK
      ?auto_268144 - BLOCK
      ?auto_268145 - BLOCK
      ?auto_268146 - BLOCK
      ?auto_268147 - BLOCK
    )
    :vars
    (
      ?auto_268148 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268147 ?auto_268148 ) ( ON-TABLE ?auto_268143 ) ( ON ?auto_268144 ?auto_268143 ) ( ON ?auto_268145 ?auto_268144 ) ( not ( = ?auto_268143 ?auto_268144 ) ) ( not ( = ?auto_268143 ?auto_268145 ) ) ( not ( = ?auto_268143 ?auto_268146 ) ) ( not ( = ?auto_268143 ?auto_268147 ) ) ( not ( = ?auto_268143 ?auto_268148 ) ) ( not ( = ?auto_268144 ?auto_268145 ) ) ( not ( = ?auto_268144 ?auto_268146 ) ) ( not ( = ?auto_268144 ?auto_268147 ) ) ( not ( = ?auto_268144 ?auto_268148 ) ) ( not ( = ?auto_268145 ?auto_268146 ) ) ( not ( = ?auto_268145 ?auto_268147 ) ) ( not ( = ?auto_268145 ?auto_268148 ) ) ( not ( = ?auto_268146 ?auto_268147 ) ) ( not ( = ?auto_268146 ?auto_268148 ) ) ( not ( = ?auto_268147 ?auto_268148 ) ) ( CLEAR ?auto_268145 ) ( ON ?auto_268146 ?auto_268147 ) ( CLEAR ?auto_268146 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_268143 ?auto_268144 ?auto_268145 ?auto_268146 )
      ( MAKE-5PILE ?auto_268143 ?auto_268144 ?auto_268145 ?auto_268146 ?auto_268147 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_268154 - BLOCK
      ?auto_268155 - BLOCK
      ?auto_268156 - BLOCK
      ?auto_268157 - BLOCK
      ?auto_268158 - BLOCK
    )
    :vars
    (
      ?auto_268159 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268158 ?auto_268159 ) ( ON-TABLE ?auto_268154 ) ( ON ?auto_268155 ?auto_268154 ) ( ON ?auto_268156 ?auto_268155 ) ( not ( = ?auto_268154 ?auto_268155 ) ) ( not ( = ?auto_268154 ?auto_268156 ) ) ( not ( = ?auto_268154 ?auto_268157 ) ) ( not ( = ?auto_268154 ?auto_268158 ) ) ( not ( = ?auto_268154 ?auto_268159 ) ) ( not ( = ?auto_268155 ?auto_268156 ) ) ( not ( = ?auto_268155 ?auto_268157 ) ) ( not ( = ?auto_268155 ?auto_268158 ) ) ( not ( = ?auto_268155 ?auto_268159 ) ) ( not ( = ?auto_268156 ?auto_268157 ) ) ( not ( = ?auto_268156 ?auto_268158 ) ) ( not ( = ?auto_268156 ?auto_268159 ) ) ( not ( = ?auto_268157 ?auto_268158 ) ) ( not ( = ?auto_268157 ?auto_268159 ) ) ( not ( = ?auto_268158 ?auto_268159 ) ) ( CLEAR ?auto_268156 ) ( ON ?auto_268157 ?auto_268158 ) ( CLEAR ?auto_268157 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_268154 ?auto_268155 ?auto_268156 ?auto_268157 )
      ( MAKE-5PILE ?auto_268154 ?auto_268155 ?auto_268156 ?auto_268157 ?auto_268158 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_268165 - BLOCK
      ?auto_268166 - BLOCK
      ?auto_268167 - BLOCK
      ?auto_268168 - BLOCK
      ?auto_268169 - BLOCK
    )
    :vars
    (
      ?auto_268170 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268169 ?auto_268170 ) ( ON-TABLE ?auto_268165 ) ( ON ?auto_268166 ?auto_268165 ) ( not ( = ?auto_268165 ?auto_268166 ) ) ( not ( = ?auto_268165 ?auto_268167 ) ) ( not ( = ?auto_268165 ?auto_268168 ) ) ( not ( = ?auto_268165 ?auto_268169 ) ) ( not ( = ?auto_268165 ?auto_268170 ) ) ( not ( = ?auto_268166 ?auto_268167 ) ) ( not ( = ?auto_268166 ?auto_268168 ) ) ( not ( = ?auto_268166 ?auto_268169 ) ) ( not ( = ?auto_268166 ?auto_268170 ) ) ( not ( = ?auto_268167 ?auto_268168 ) ) ( not ( = ?auto_268167 ?auto_268169 ) ) ( not ( = ?auto_268167 ?auto_268170 ) ) ( not ( = ?auto_268168 ?auto_268169 ) ) ( not ( = ?auto_268168 ?auto_268170 ) ) ( not ( = ?auto_268169 ?auto_268170 ) ) ( ON ?auto_268168 ?auto_268169 ) ( CLEAR ?auto_268166 ) ( ON ?auto_268167 ?auto_268168 ) ( CLEAR ?auto_268167 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_268165 ?auto_268166 ?auto_268167 )
      ( MAKE-5PILE ?auto_268165 ?auto_268166 ?auto_268167 ?auto_268168 ?auto_268169 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_268176 - BLOCK
      ?auto_268177 - BLOCK
      ?auto_268178 - BLOCK
      ?auto_268179 - BLOCK
      ?auto_268180 - BLOCK
    )
    :vars
    (
      ?auto_268181 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268180 ?auto_268181 ) ( ON-TABLE ?auto_268176 ) ( ON ?auto_268177 ?auto_268176 ) ( not ( = ?auto_268176 ?auto_268177 ) ) ( not ( = ?auto_268176 ?auto_268178 ) ) ( not ( = ?auto_268176 ?auto_268179 ) ) ( not ( = ?auto_268176 ?auto_268180 ) ) ( not ( = ?auto_268176 ?auto_268181 ) ) ( not ( = ?auto_268177 ?auto_268178 ) ) ( not ( = ?auto_268177 ?auto_268179 ) ) ( not ( = ?auto_268177 ?auto_268180 ) ) ( not ( = ?auto_268177 ?auto_268181 ) ) ( not ( = ?auto_268178 ?auto_268179 ) ) ( not ( = ?auto_268178 ?auto_268180 ) ) ( not ( = ?auto_268178 ?auto_268181 ) ) ( not ( = ?auto_268179 ?auto_268180 ) ) ( not ( = ?auto_268179 ?auto_268181 ) ) ( not ( = ?auto_268180 ?auto_268181 ) ) ( ON ?auto_268179 ?auto_268180 ) ( CLEAR ?auto_268177 ) ( ON ?auto_268178 ?auto_268179 ) ( CLEAR ?auto_268178 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_268176 ?auto_268177 ?auto_268178 )
      ( MAKE-5PILE ?auto_268176 ?auto_268177 ?auto_268178 ?auto_268179 ?auto_268180 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_268187 - BLOCK
      ?auto_268188 - BLOCK
      ?auto_268189 - BLOCK
      ?auto_268190 - BLOCK
      ?auto_268191 - BLOCK
    )
    :vars
    (
      ?auto_268192 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268191 ?auto_268192 ) ( ON-TABLE ?auto_268187 ) ( not ( = ?auto_268187 ?auto_268188 ) ) ( not ( = ?auto_268187 ?auto_268189 ) ) ( not ( = ?auto_268187 ?auto_268190 ) ) ( not ( = ?auto_268187 ?auto_268191 ) ) ( not ( = ?auto_268187 ?auto_268192 ) ) ( not ( = ?auto_268188 ?auto_268189 ) ) ( not ( = ?auto_268188 ?auto_268190 ) ) ( not ( = ?auto_268188 ?auto_268191 ) ) ( not ( = ?auto_268188 ?auto_268192 ) ) ( not ( = ?auto_268189 ?auto_268190 ) ) ( not ( = ?auto_268189 ?auto_268191 ) ) ( not ( = ?auto_268189 ?auto_268192 ) ) ( not ( = ?auto_268190 ?auto_268191 ) ) ( not ( = ?auto_268190 ?auto_268192 ) ) ( not ( = ?auto_268191 ?auto_268192 ) ) ( ON ?auto_268190 ?auto_268191 ) ( ON ?auto_268189 ?auto_268190 ) ( CLEAR ?auto_268187 ) ( ON ?auto_268188 ?auto_268189 ) ( CLEAR ?auto_268188 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_268187 ?auto_268188 )
      ( MAKE-5PILE ?auto_268187 ?auto_268188 ?auto_268189 ?auto_268190 ?auto_268191 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_268198 - BLOCK
      ?auto_268199 - BLOCK
      ?auto_268200 - BLOCK
      ?auto_268201 - BLOCK
      ?auto_268202 - BLOCK
    )
    :vars
    (
      ?auto_268203 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268202 ?auto_268203 ) ( ON-TABLE ?auto_268198 ) ( not ( = ?auto_268198 ?auto_268199 ) ) ( not ( = ?auto_268198 ?auto_268200 ) ) ( not ( = ?auto_268198 ?auto_268201 ) ) ( not ( = ?auto_268198 ?auto_268202 ) ) ( not ( = ?auto_268198 ?auto_268203 ) ) ( not ( = ?auto_268199 ?auto_268200 ) ) ( not ( = ?auto_268199 ?auto_268201 ) ) ( not ( = ?auto_268199 ?auto_268202 ) ) ( not ( = ?auto_268199 ?auto_268203 ) ) ( not ( = ?auto_268200 ?auto_268201 ) ) ( not ( = ?auto_268200 ?auto_268202 ) ) ( not ( = ?auto_268200 ?auto_268203 ) ) ( not ( = ?auto_268201 ?auto_268202 ) ) ( not ( = ?auto_268201 ?auto_268203 ) ) ( not ( = ?auto_268202 ?auto_268203 ) ) ( ON ?auto_268201 ?auto_268202 ) ( ON ?auto_268200 ?auto_268201 ) ( CLEAR ?auto_268198 ) ( ON ?auto_268199 ?auto_268200 ) ( CLEAR ?auto_268199 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_268198 ?auto_268199 )
      ( MAKE-5PILE ?auto_268198 ?auto_268199 ?auto_268200 ?auto_268201 ?auto_268202 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_268209 - BLOCK
      ?auto_268210 - BLOCK
      ?auto_268211 - BLOCK
      ?auto_268212 - BLOCK
      ?auto_268213 - BLOCK
    )
    :vars
    (
      ?auto_268214 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268213 ?auto_268214 ) ( not ( = ?auto_268209 ?auto_268210 ) ) ( not ( = ?auto_268209 ?auto_268211 ) ) ( not ( = ?auto_268209 ?auto_268212 ) ) ( not ( = ?auto_268209 ?auto_268213 ) ) ( not ( = ?auto_268209 ?auto_268214 ) ) ( not ( = ?auto_268210 ?auto_268211 ) ) ( not ( = ?auto_268210 ?auto_268212 ) ) ( not ( = ?auto_268210 ?auto_268213 ) ) ( not ( = ?auto_268210 ?auto_268214 ) ) ( not ( = ?auto_268211 ?auto_268212 ) ) ( not ( = ?auto_268211 ?auto_268213 ) ) ( not ( = ?auto_268211 ?auto_268214 ) ) ( not ( = ?auto_268212 ?auto_268213 ) ) ( not ( = ?auto_268212 ?auto_268214 ) ) ( not ( = ?auto_268213 ?auto_268214 ) ) ( ON ?auto_268212 ?auto_268213 ) ( ON ?auto_268211 ?auto_268212 ) ( ON ?auto_268210 ?auto_268211 ) ( ON ?auto_268209 ?auto_268210 ) ( CLEAR ?auto_268209 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_268209 )
      ( MAKE-5PILE ?auto_268209 ?auto_268210 ?auto_268211 ?auto_268212 ?auto_268213 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_268220 - BLOCK
      ?auto_268221 - BLOCK
      ?auto_268222 - BLOCK
      ?auto_268223 - BLOCK
      ?auto_268224 - BLOCK
    )
    :vars
    (
      ?auto_268225 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268224 ?auto_268225 ) ( not ( = ?auto_268220 ?auto_268221 ) ) ( not ( = ?auto_268220 ?auto_268222 ) ) ( not ( = ?auto_268220 ?auto_268223 ) ) ( not ( = ?auto_268220 ?auto_268224 ) ) ( not ( = ?auto_268220 ?auto_268225 ) ) ( not ( = ?auto_268221 ?auto_268222 ) ) ( not ( = ?auto_268221 ?auto_268223 ) ) ( not ( = ?auto_268221 ?auto_268224 ) ) ( not ( = ?auto_268221 ?auto_268225 ) ) ( not ( = ?auto_268222 ?auto_268223 ) ) ( not ( = ?auto_268222 ?auto_268224 ) ) ( not ( = ?auto_268222 ?auto_268225 ) ) ( not ( = ?auto_268223 ?auto_268224 ) ) ( not ( = ?auto_268223 ?auto_268225 ) ) ( not ( = ?auto_268224 ?auto_268225 ) ) ( ON ?auto_268223 ?auto_268224 ) ( ON ?auto_268222 ?auto_268223 ) ( ON ?auto_268221 ?auto_268222 ) ( ON ?auto_268220 ?auto_268221 ) ( CLEAR ?auto_268220 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_268220 )
      ( MAKE-5PILE ?auto_268220 ?auto_268221 ?auto_268222 ?auto_268223 ?auto_268224 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_268232 - BLOCK
      ?auto_268233 - BLOCK
      ?auto_268234 - BLOCK
      ?auto_268235 - BLOCK
      ?auto_268236 - BLOCK
      ?auto_268237 - BLOCK
    )
    :vars
    (
      ?auto_268238 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_268236 ) ( ON ?auto_268237 ?auto_268238 ) ( CLEAR ?auto_268237 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_268232 ) ( ON ?auto_268233 ?auto_268232 ) ( ON ?auto_268234 ?auto_268233 ) ( ON ?auto_268235 ?auto_268234 ) ( ON ?auto_268236 ?auto_268235 ) ( not ( = ?auto_268232 ?auto_268233 ) ) ( not ( = ?auto_268232 ?auto_268234 ) ) ( not ( = ?auto_268232 ?auto_268235 ) ) ( not ( = ?auto_268232 ?auto_268236 ) ) ( not ( = ?auto_268232 ?auto_268237 ) ) ( not ( = ?auto_268232 ?auto_268238 ) ) ( not ( = ?auto_268233 ?auto_268234 ) ) ( not ( = ?auto_268233 ?auto_268235 ) ) ( not ( = ?auto_268233 ?auto_268236 ) ) ( not ( = ?auto_268233 ?auto_268237 ) ) ( not ( = ?auto_268233 ?auto_268238 ) ) ( not ( = ?auto_268234 ?auto_268235 ) ) ( not ( = ?auto_268234 ?auto_268236 ) ) ( not ( = ?auto_268234 ?auto_268237 ) ) ( not ( = ?auto_268234 ?auto_268238 ) ) ( not ( = ?auto_268235 ?auto_268236 ) ) ( not ( = ?auto_268235 ?auto_268237 ) ) ( not ( = ?auto_268235 ?auto_268238 ) ) ( not ( = ?auto_268236 ?auto_268237 ) ) ( not ( = ?auto_268236 ?auto_268238 ) ) ( not ( = ?auto_268237 ?auto_268238 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_268237 ?auto_268238 )
      ( !STACK ?auto_268237 ?auto_268236 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_268245 - BLOCK
      ?auto_268246 - BLOCK
      ?auto_268247 - BLOCK
      ?auto_268248 - BLOCK
      ?auto_268249 - BLOCK
      ?auto_268250 - BLOCK
    )
    :vars
    (
      ?auto_268251 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_268249 ) ( ON ?auto_268250 ?auto_268251 ) ( CLEAR ?auto_268250 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_268245 ) ( ON ?auto_268246 ?auto_268245 ) ( ON ?auto_268247 ?auto_268246 ) ( ON ?auto_268248 ?auto_268247 ) ( ON ?auto_268249 ?auto_268248 ) ( not ( = ?auto_268245 ?auto_268246 ) ) ( not ( = ?auto_268245 ?auto_268247 ) ) ( not ( = ?auto_268245 ?auto_268248 ) ) ( not ( = ?auto_268245 ?auto_268249 ) ) ( not ( = ?auto_268245 ?auto_268250 ) ) ( not ( = ?auto_268245 ?auto_268251 ) ) ( not ( = ?auto_268246 ?auto_268247 ) ) ( not ( = ?auto_268246 ?auto_268248 ) ) ( not ( = ?auto_268246 ?auto_268249 ) ) ( not ( = ?auto_268246 ?auto_268250 ) ) ( not ( = ?auto_268246 ?auto_268251 ) ) ( not ( = ?auto_268247 ?auto_268248 ) ) ( not ( = ?auto_268247 ?auto_268249 ) ) ( not ( = ?auto_268247 ?auto_268250 ) ) ( not ( = ?auto_268247 ?auto_268251 ) ) ( not ( = ?auto_268248 ?auto_268249 ) ) ( not ( = ?auto_268248 ?auto_268250 ) ) ( not ( = ?auto_268248 ?auto_268251 ) ) ( not ( = ?auto_268249 ?auto_268250 ) ) ( not ( = ?auto_268249 ?auto_268251 ) ) ( not ( = ?auto_268250 ?auto_268251 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_268250 ?auto_268251 )
      ( !STACK ?auto_268250 ?auto_268249 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_268258 - BLOCK
      ?auto_268259 - BLOCK
      ?auto_268260 - BLOCK
      ?auto_268261 - BLOCK
      ?auto_268262 - BLOCK
      ?auto_268263 - BLOCK
    )
    :vars
    (
      ?auto_268264 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268263 ?auto_268264 ) ( ON-TABLE ?auto_268258 ) ( ON ?auto_268259 ?auto_268258 ) ( ON ?auto_268260 ?auto_268259 ) ( ON ?auto_268261 ?auto_268260 ) ( not ( = ?auto_268258 ?auto_268259 ) ) ( not ( = ?auto_268258 ?auto_268260 ) ) ( not ( = ?auto_268258 ?auto_268261 ) ) ( not ( = ?auto_268258 ?auto_268262 ) ) ( not ( = ?auto_268258 ?auto_268263 ) ) ( not ( = ?auto_268258 ?auto_268264 ) ) ( not ( = ?auto_268259 ?auto_268260 ) ) ( not ( = ?auto_268259 ?auto_268261 ) ) ( not ( = ?auto_268259 ?auto_268262 ) ) ( not ( = ?auto_268259 ?auto_268263 ) ) ( not ( = ?auto_268259 ?auto_268264 ) ) ( not ( = ?auto_268260 ?auto_268261 ) ) ( not ( = ?auto_268260 ?auto_268262 ) ) ( not ( = ?auto_268260 ?auto_268263 ) ) ( not ( = ?auto_268260 ?auto_268264 ) ) ( not ( = ?auto_268261 ?auto_268262 ) ) ( not ( = ?auto_268261 ?auto_268263 ) ) ( not ( = ?auto_268261 ?auto_268264 ) ) ( not ( = ?auto_268262 ?auto_268263 ) ) ( not ( = ?auto_268262 ?auto_268264 ) ) ( not ( = ?auto_268263 ?auto_268264 ) ) ( CLEAR ?auto_268261 ) ( ON ?auto_268262 ?auto_268263 ) ( CLEAR ?auto_268262 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_268258 ?auto_268259 ?auto_268260 ?auto_268261 ?auto_268262 )
      ( MAKE-6PILE ?auto_268258 ?auto_268259 ?auto_268260 ?auto_268261 ?auto_268262 ?auto_268263 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_268271 - BLOCK
      ?auto_268272 - BLOCK
      ?auto_268273 - BLOCK
      ?auto_268274 - BLOCK
      ?auto_268275 - BLOCK
      ?auto_268276 - BLOCK
    )
    :vars
    (
      ?auto_268277 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268276 ?auto_268277 ) ( ON-TABLE ?auto_268271 ) ( ON ?auto_268272 ?auto_268271 ) ( ON ?auto_268273 ?auto_268272 ) ( ON ?auto_268274 ?auto_268273 ) ( not ( = ?auto_268271 ?auto_268272 ) ) ( not ( = ?auto_268271 ?auto_268273 ) ) ( not ( = ?auto_268271 ?auto_268274 ) ) ( not ( = ?auto_268271 ?auto_268275 ) ) ( not ( = ?auto_268271 ?auto_268276 ) ) ( not ( = ?auto_268271 ?auto_268277 ) ) ( not ( = ?auto_268272 ?auto_268273 ) ) ( not ( = ?auto_268272 ?auto_268274 ) ) ( not ( = ?auto_268272 ?auto_268275 ) ) ( not ( = ?auto_268272 ?auto_268276 ) ) ( not ( = ?auto_268272 ?auto_268277 ) ) ( not ( = ?auto_268273 ?auto_268274 ) ) ( not ( = ?auto_268273 ?auto_268275 ) ) ( not ( = ?auto_268273 ?auto_268276 ) ) ( not ( = ?auto_268273 ?auto_268277 ) ) ( not ( = ?auto_268274 ?auto_268275 ) ) ( not ( = ?auto_268274 ?auto_268276 ) ) ( not ( = ?auto_268274 ?auto_268277 ) ) ( not ( = ?auto_268275 ?auto_268276 ) ) ( not ( = ?auto_268275 ?auto_268277 ) ) ( not ( = ?auto_268276 ?auto_268277 ) ) ( CLEAR ?auto_268274 ) ( ON ?auto_268275 ?auto_268276 ) ( CLEAR ?auto_268275 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_268271 ?auto_268272 ?auto_268273 ?auto_268274 ?auto_268275 )
      ( MAKE-6PILE ?auto_268271 ?auto_268272 ?auto_268273 ?auto_268274 ?auto_268275 ?auto_268276 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_268284 - BLOCK
      ?auto_268285 - BLOCK
      ?auto_268286 - BLOCK
      ?auto_268287 - BLOCK
      ?auto_268288 - BLOCK
      ?auto_268289 - BLOCK
    )
    :vars
    (
      ?auto_268290 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268289 ?auto_268290 ) ( ON-TABLE ?auto_268284 ) ( ON ?auto_268285 ?auto_268284 ) ( ON ?auto_268286 ?auto_268285 ) ( not ( = ?auto_268284 ?auto_268285 ) ) ( not ( = ?auto_268284 ?auto_268286 ) ) ( not ( = ?auto_268284 ?auto_268287 ) ) ( not ( = ?auto_268284 ?auto_268288 ) ) ( not ( = ?auto_268284 ?auto_268289 ) ) ( not ( = ?auto_268284 ?auto_268290 ) ) ( not ( = ?auto_268285 ?auto_268286 ) ) ( not ( = ?auto_268285 ?auto_268287 ) ) ( not ( = ?auto_268285 ?auto_268288 ) ) ( not ( = ?auto_268285 ?auto_268289 ) ) ( not ( = ?auto_268285 ?auto_268290 ) ) ( not ( = ?auto_268286 ?auto_268287 ) ) ( not ( = ?auto_268286 ?auto_268288 ) ) ( not ( = ?auto_268286 ?auto_268289 ) ) ( not ( = ?auto_268286 ?auto_268290 ) ) ( not ( = ?auto_268287 ?auto_268288 ) ) ( not ( = ?auto_268287 ?auto_268289 ) ) ( not ( = ?auto_268287 ?auto_268290 ) ) ( not ( = ?auto_268288 ?auto_268289 ) ) ( not ( = ?auto_268288 ?auto_268290 ) ) ( not ( = ?auto_268289 ?auto_268290 ) ) ( ON ?auto_268288 ?auto_268289 ) ( CLEAR ?auto_268286 ) ( ON ?auto_268287 ?auto_268288 ) ( CLEAR ?auto_268287 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_268284 ?auto_268285 ?auto_268286 ?auto_268287 )
      ( MAKE-6PILE ?auto_268284 ?auto_268285 ?auto_268286 ?auto_268287 ?auto_268288 ?auto_268289 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_268297 - BLOCK
      ?auto_268298 - BLOCK
      ?auto_268299 - BLOCK
      ?auto_268300 - BLOCK
      ?auto_268301 - BLOCK
      ?auto_268302 - BLOCK
    )
    :vars
    (
      ?auto_268303 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268302 ?auto_268303 ) ( ON-TABLE ?auto_268297 ) ( ON ?auto_268298 ?auto_268297 ) ( ON ?auto_268299 ?auto_268298 ) ( not ( = ?auto_268297 ?auto_268298 ) ) ( not ( = ?auto_268297 ?auto_268299 ) ) ( not ( = ?auto_268297 ?auto_268300 ) ) ( not ( = ?auto_268297 ?auto_268301 ) ) ( not ( = ?auto_268297 ?auto_268302 ) ) ( not ( = ?auto_268297 ?auto_268303 ) ) ( not ( = ?auto_268298 ?auto_268299 ) ) ( not ( = ?auto_268298 ?auto_268300 ) ) ( not ( = ?auto_268298 ?auto_268301 ) ) ( not ( = ?auto_268298 ?auto_268302 ) ) ( not ( = ?auto_268298 ?auto_268303 ) ) ( not ( = ?auto_268299 ?auto_268300 ) ) ( not ( = ?auto_268299 ?auto_268301 ) ) ( not ( = ?auto_268299 ?auto_268302 ) ) ( not ( = ?auto_268299 ?auto_268303 ) ) ( not ( = ?auto_268300 ?auto_268301 ) ) ( not ( = ?auto_268300 ?auto_268302 ) ) ( not ( = ?auto_268300 ?auto_268303 ) ) ( not ( = ?auto_268301 ?auto_268302 ) ) ( not ( = ?auto_268301 ?auto_268303 ) ) ( not ( = ?auto_268302 ?auto_268303 ) ) ( ON ?auto_268301 ?auto_268302 ) ( CLEAR ?auto_268299 ) ( ON ?auto_268300 ?auto_268301 ) ( CLEAR ?auto_268300 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_268297 ?auto_268298 ?auto_268299 ?auto_268300 )
      ( MAKE-6PILE ?auto_268297 ?auto_268298 ?auto_268299 ?auto_268300 ?auto_268301 ?auto_268302 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_268310 - BLOCK
      ?auto_268311 - BLOCK
      ?auto_268312 - BLOCK
      ?auto_268313 - BLOCK
      ?auto_268314 - BLOCK
      ?auto_268315 - BLOCK
    )
    :vars
    (
      ?auto_268316 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268315 ?auto_268316 ) ( ON-TABLE ?auto_268310 ) ( ON ?auto_268311 ?auto_268310 ) ( not ( = ?auto_268310 ?auto_268311 ) ) ( not ( = ?auto_268310 ?auto_268312 ) ) ( not ( = ?auto_268310 ?auto_268313 ) ) ( not ( = ?auto_268310 ?auto_268314 ) ) ( not ( = ?auto_268310 ?auto_268315 ) ) ( not ( = ?auto_268310 ?auto_268316 ) ) ( not ( = ?auto_268311 ?auto_268312 ) ) ( not ( = ?auto_268311 ?auto_268313 ) ) ( not ( = ?auto_268311 ?auto_268314 ) ) ( not ( = ?auto_268311 ?auto_268315 ) ) ( not ( = ?auto_268311 ?auto_268316 ) ) ( not ( = ?auto_268312 ?auto_268313 ) ) ( not ( = ?auto_268312 ?auto_268314 ) ) ( not ( = ?auto_268312 ?auto_268315 ) ) ( not ( = ?auto_268312 ?auto_268316 ) ) ( not ( = ?auto_268313 ?auto_268314 ) ) ( not ( = ?auto_268313 ?auto_268315 ) ) ( not ( = ?auto_268313 ?auto_268316 ) ) ( not ( = ?auto_268314 ?auto_268315 ) ) ( not ( = ?auto_268314 ?auto_268316 ) ) ( not ( = ?auto_268315 ?auto_268316 ) ) ( ON ?auto_268314 ?auto_268315 ) ( ON ?auto_268313 ?auto_268314 ) ( CLEAR ?auto_268311 ) ( ON ?auto_268312 ?auto_268313 ) ( CLEAR ?auto_268312 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_268310 ?auto_268311 ?auto_268312 )
      ( MAKE-6PILE ?auto_268310 ?auto_268311 ?auto_268312 ?auto_268313 ?auto_268314 ?auto_268315 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_268323 - BLOCK
      ?auto_268324 - BLOCK
      ?auto_268325 - BLOCK
      ?auto_268326 - BLOCK
      ?auto_268327 - BLOCK
      ?auto_268328 - BLOCK
    )
    :vars
    (
      ?auto_268329 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268328 ?auto_268329 ) ( ON-TABLE ?auto_268323 ) ( ON ?auto_268324 ?auto_268323 ) ( not ( = ?auto_268323 ?auto_268324 ) ) ( not ( = ?auto_268323 ?auto_268325 ) ) ( not ( = ?auto_268323 ?auto_268326 ) ) ( not ( = ?auto_268323 ?auto_268327 ) ) ( not ( = ?auto_268323 ?auto_268328 ) ) ( not ( = ?auto_268323 ?auto_268329 ) ) ( not ( = ?auto_268324 ?auto_268325 ) ) ( not ( = ?auto_268324 ?auto_268326 ) ) ( not ( = ?auto_268324 ?auto_268327 ) ) ( not ( = ?auto_268324 ?auto_268328 ) ) ( not ( = ?auto_268324 ?auto_268329 ) ) ( not ( = ?auto_268325 ?auto_268326 ) ) ( not ( = ?auto_268325 ?auto_268327 ) ) ( not ( = ?auto_268325 ?auto_268328 ) ) ( not ( = ?auto_268325 ?auto_268329 ) ) ( not ( = ?auto_268326 ?auto_268327 ) ) ( not ( = ?auto_268326 ?auto_268328 ) ) ( not ( = ?auto_268326 ?auto_268329 ) ) ( not ( = ?auto_268327 ?auto_268328 ) ) ( not ( = ?auto_268327 ?auto_268329 ) ) ( not ( = ?auto_268328 ?auto_268329 ) ) ( ON ?auto_268327 ?auto_268328 ) ( ON ?auto_268326 ?auto_268327 ) ( CLEAR ?auto_268324 ) ( ON ?auto_268325 ?auto_268326 ) ( CLEAR ?auto_268325 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_268323 ?auto_268324 ?auto_268325 )
      ( MAKE-6PILE ?auto_268323 ?auto_268324 ?auto_268325 ?auto_268326 ?auto_268327 ?auto_268328 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_268336 - BLOCK
      ?auto_268337 - BLOCK
      ?auto_268338 - BLOCK
      ?auto_268339 - BLOCK
      ?auto_268340 - BLOCK
      ?auto_268341 - BLOCK
    )
    :vars
    (
      ?auto_268342 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268341 ?auto_268342 ) ( ON-TABLE ?auto_268336 ) ( not ( = ?auto_268336 ?auto_268337 ) ) ( not ( = ?auto_268336 ?auto_268338 ) ) ( not ( = ?auto_268336 ?auto_268339 ) ) ( not ( = ?auto_268336 ?auto_268340 ) ) ( not ( = ?auto_268336 ?auto_268341 ) ) ( not ( = ?auto_268336 ?auto_268342 ) ) ( not ( = ?auto_268337 ?auto_268338 ) ) ( not ( = ?auto_268337 ?auto_268339 ) ) ( not ( = ?auto_268337 ?auto_268340 ) ) ( not ( = ?auto_268337 ?auto_268341 ) ) ( not ( = ?auto_268337 ?auto_268342 ) ) ( not ( = ?auto_268338 ?auto_268339 ) ) ( not ( = ?auto_268338 ?auto_268340 ) ) ( not ( = ?auto_268338 ?auto_268341 ) ) ( not ( = ?auto_268338 ?auto_268342 ) ) ( not ( = ?auto_268339 ?auto_268340 ) ) ( not ( = ?auto_268339 ?auto_268341 ) ) ( not ( = ?auto_268339 ?auto_268342 ) ) ( not ( = ?auto_268340 ?auto_268341 ) ) ( not ( = ?auto_268340 ?auto_268342 ) ) ( not ( = ?auto_268341 ?auto_268342 ) ) ( ON ?auto_268340 ?auto_268341 ) ( ON ?auto_268339 ?auto_268340 ) ( ON ?auto_268338 ?auto_268339 ) ( CLEAR ?auto_268336 ) ( ON ?auto_268337 ?auto_268338 ) ( CLEAR ?auto_268337 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_268336 ?auto_268337 )
      ( MAKE-6PILE ?auto_268336 ?auto_268337 ?auto_268338 ?auto_268339 ?auto_268340 ?auto_268341 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_268349 - BLOCK
      ?auto_268350 - BLOCK
      ?auto_268351 - BLOCK
      ?auto_268352 - BLOCK
      ?auto_268353 - BLOCK
      ?auto_268354 - BLOCK
    )
    :vars
    (
      ?auto_268355 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268354 ?auto_268355 ) ( ON-TABLE ?auto_268349 ) ( not ( = ?auto_268349 ?auto_268350 ) ) ( not ( = ?auto_268349 ?auto_268351 ) ) ( not ( = ?auto_268349 ?auto_268352 ) ) ( not ( = ?auto_268349 ?auto_268353 ) ) ( not ( = ?auto_268349 ?auto_268354 ) ) ( not ( = ?auto_268349 ?auto_268355 ) ) ( not ( = ?auto_268350 ?auto_268351 ) ) ( not ( = ?auto_268350 ?auto_268352 ) ) ( not ( = ?auto_268350 ?auto_268353 ) ) ( not ( = ?auto_268350 ?auto_268354 ) ) ( not ( = ?auto_268350 ?auto_268355 ) ) ( not ( = ?auto_268351 ?auto_268352 ) ) ( not ( = ?auto_268351 ?auto_268353 ) ) ( not ( = ?auto_268351 ?auto_268354 ) ) ( not ( = ?auto_268351 ?auto_268355 ) ) ( not ( = ?auto_268352 ?auto_268353 ) ) ( not ( = ?auto_268352 ?auto_268354 ) ) ( not ( = ?auto_268352 ?auto_268355 ) ) ( not ( = ?auto_268353 ?auto_268354 ) ) ( not ( = ?auto_268353 ?auto_268355 ) ) ( not ( = ?auto_268354 ?auto_268355 ) ) ( ON ?auto_268353 ?auto_268354 ) ( ON ?auto_268352 ?auto_268353 ) ( ON ?auto_268351 ?auto_268352 ) ( CLEAR ?auto_268349 ) ( ON ?auto_268350 ?auto_268351 ) ( CLEAR ?auto_268350 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_268349 ?auto_268350 )
      ( MAKE-6PILE ?auto_268349 ?auto_268350 ?auto_268351 ?auto_268352 ?auto_268353 ?auto_268354 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_268362 - BLOCK
      ?auto_268363 - BLOCK
      ?auto_268364 - BLOCK
      ?auto_268365 - BLOCK
      ?auto_268366 - BLOCK
      ?auto_268367 - BLOCK
    )
    :vars
    (
      ?auto_268368 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268367 ?auto_268368 ) ( not ( = ?auto_268362 ?auto_268363 ) ) ( not ( = ?auto_268362 ?auto_268364 ) ) ( not ( = ?auto_268362 ?auto_268365 ) ) ( not ( = ?auto_268362 ?auto_268366 ) ) ( not ( = ?auto_268362 ?auto_268367 ) ) ( not ( = ?auto_268362 ?auto_268368 ) ) ( not ( = ?auto_268363 ?auto_268364 ) ) ( not ( = ?auto_268363 ?auto_268365 ) ) ( not ( = ?auto_268363 ?auto_268366 ) ) ( not ( = ?auto_268363 ?auto_268367 ) ) ( not ( = ?auto_268363 ?auto_268368 ) ) ( not ( = ?auto_268364 ?auto_268365 ) ) ( not ( = ?auto_268364 ?auto_268366 ) ) ( not ( = ?auto_268364 ?auto_268367 ) ) ( not ( = ?auto_268364 ?auto_268368 ) ) ( not ( = ?auto_268365 ?auto_268366 ) ) ( not ( = ?auto_268365 ?auto_268367 ) ) ( not ( = ?auto_268365 ?auto_268368 ) ) ( not ( = ?auto_268366 ?auto_268367 ) ) ( not ( = ?auto_268366 ?auto_268368 ) ) ( not ( = ?auto_268367 ?auto_268368 ) ) ( ON ?auto_268366 ?auto_268367 ) ( ON ?auto_268365 ?auto_268366 ) ( ON ?auto_268364 ?auto_268365 ) ( ON ?auto_268363 ?auto_268364 ) ( ON ?auto_268362 ?auto_268363 ) ( CLEAR ?auto_268362 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_268362 )
      ( MAKE-6PILE ?auto_268362 ?auto_268363 ?auto_268364 ?auto_268365 ?auto_268366 ?auto_268367 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_268375 - BLOCK
      ?auto_268376 - BLOCK
      ?auto_268377 - BLOCK
      ?auto_268378 - BLOCK
      ?auto_268379 - BLOCK
      ?auto_268380 - BLOCK
    )
    :vars
    (
      ?auto_268381 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268380 ?auto_268381 ) ( not ( = ?auto_268375 ?auto_268376 ) ) ( not ( = ?auto_268375 ?auto_268377 ) ) ( not ( = ?auto_268375 ?auto_268378 ) ) ( not ( = ?auto_268375 ?auto_268379 ) ) ( not ( = ?auto_268375 ?auto_268380 ) ) ( not ( = ?auto_268375 ?auto_268381 ) ) ( not ( = ?auto_268376 ?auto_268377 ) ) ( not ( = ?auto_268376 ?auto_268378 ) ) ( not ( = ?auto_268376 ?auto_268379 ) ) ( not ( = ?auto_268376 ?auto_268380 ) ) ( not ( = ?auto_268376 ?auto_268381 ) ) ( not ( = ?auto_268377 ?auto_268378 ) ) ( not ( = ?auto_268377 ?auto_268379 ) ) ( not ( = ?auto_268377 ?auto_268380 ) ) ( not ( = ?auto_268377 ?auto_268381 ) ) ( not ( = ?auto_268378 ?auto_268379 ) ) ( not ( = ?auto_268378 ?auto_268380 ) ) ( not ( = ?auto_268378 ?auto_268381 ) ) ( not ( = ?auto_268379 ?auto_268380 ) ) ( not ( = ?auto_268379 ?auto_268381 ) ) ( not ( = ?auto_268380 ?auto_268381 ) ) ( ON ?auto_268379 ?auto_268380 ) ( ON ?auto_268378 ?auto_268379 ) ( ON ?auto_268377 ?auto_268378 ) ( ON ?auto_268376 ?auto_268377 ) ( ON ?auto_268375 ?auto_268376 ) ( CLEAR ?auto_268375 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_268375 )
      ( MAKE-6PILE ?auto_268375 ?auto_268376 ?auto_268377 ?auto_268378 ?auto_268379 ?auto_268380 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_268389 - BLOCK
      ?auto_268390 - BLOCK
      ?auto_268391 - BLOCK
      ?auto_268392 - BLOCK
      ?auto_268393 - BLOCK
      ?auto_268394 - BLOCK
      ?auto_268395 - BLOCK
    )
    :vars
    (
      ?auto_268396 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_268394 ) ( ON ?auto_268395 ?auto_268396 ) ( CLEAR ?auto_268395 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_268389 ) ( ON ?auto_268390 ?auto_268389 ) ( ON ?auto_268391 ?auto_268390 ) ( ON ?auto_268392 ?auto_268391 ) ( ON ?auto_268393 ?auto_268392 ) ( ON ?auto_268394 ?auto_268393 ) ( not ( = ?auto_268389 ?auto_268390 ) ) ( not ( = ?auto_268389 ?auto_268391 ) ) ( not ( = ?auto_268389 ?auto_268392 ) ) ( not ( = ?auto_268389 ?auto_268393 ) ) ( not ( = ?auto_268389 ?auto_268394 ) ) ( not ( = ?auto_268389 ?auto_268395 ) ) ( not ( = ?auto_268389 ?auto_268396 ) ) ( not ( = ?auto_268390 ?auto_268391 ) ) ( not ( = ?auto_268390 ?auto_268392 ) ) ( not ( = ?auto_268390 ?auto_268393 ) ) ( not ( = ?auto_268390 ?auto_268394 ) ) ( not ( = ?auto_268390 ?auto_268395 ) ) ( not ( = ?auto_268390 ?auto_268396 ) ) ( not ( = ?auto_268391 ?auto_268392 ) ) ( not ( = ?auto_268391 ?auto_268393 ) ) ( not ( = ?auto_268391 ?auto_268394 ) ) ( not ( = ?auto_268391 ?auto_268395 ) ) ( not ( = ?auto_268391 ?auto_268396 ) ) ( not ( = ?auto_268392 ?auto_268393 ) ) ( not ( = ?auto_268392 ?auto_268394 ) ) ( not ( = ?auto_268392 ?auto_268395 ) ) ( not ( = ?auto_268392 ?auto_268396 ) ) ( not ( = ?auto_268393 ?auto_268394 ) ) ( not ( = ?auto_268393 ?auto_268395 ) ) ( not ( = ?auto_268393 ?auto_268396 ) ) ( not ( = ?auto_268394 ?auto_268395 ) ) ( not ( = ?auto_268394 ?auto_268396 ) ) ( not ( = ?auto_268395 ?auto_268396 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_268395 ?auto_268396 )
      ( !STACK ?auto_268395 ?auto_268394 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_268404 - BLOCK
      ?auto_268405 - BLOCK
      ?auto_268406 - BLOCK
      ?auto_268407 - BLOCK
      ?auto_268408 - BLOCK
      ?auto_268409 - BLOCK
      ?auto_268410 - BLOCK
    )
    :vars
    (
      ?auto_268411 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_268409 ) ( ON ?auto_268410 ?auto_268411 ) ( CLEAR ?auto_268410 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_268404 ) ( ON ?auto_268405 ?auto_268404 ) ( ON ?auto_268406 ?auto_268405 ) ( ON ?auto_268407 ?auto_268406 ) ( ON ?auto_268408 ?auto_268407 ) ( ON ?auto_268409 ?auto_268408 ) ( not ( = ?auto_268404 ?auto_268405 ) ) ( not ( = ?auto_268404 ?auto_268406 ) ) ( not ( = ?auto_268404 ?auto_268407 ) ) ( not ( = ?auto_268404 ?auto_268408 ) ) ( not ( = ?auto_268404 ?auto_268409 ) ) ( not ( = ?auto_268404 ?auto_268410 ) ) ( not ( = ?auto_268404 ?auto_268411 ) ) ( not ( = ?auto_268405 ?auto_268406 ) ) ( not ( = ?auto_268405 ?auto_268407 ) ) ( not ( = ?auto_268405 ?auto_268408 ) ) ( not ( = ?auto_268405 ?auto_268409 ) ) ( not ( = ?auto_268405 ?auto_268410 ) ) ( not ( = ?auto_268405 ?auto_268411 ) ) ( not ( = ?auto_268406 ?auto_268407 ) ) ( not ( = ?auto_268406 ?auto_268408 ) ) ( not ( = ?auto_268406 ?auto_268409 ) ) ( not ( = ?auto_268406 ?auto_268410 ) ) ( not ( = ?auto_268406 ?auto_268411 ) ) ( not ( = ?auto_268407 ?auto_268408 ) ) ( not ( = ?auto_268407 ?auto_268409 ) ) ( not ( = ?auto_268407 ?auto_268410 ) ) ( not ( = ?auto_268407 ?auto_268411 ) ) ( not ( = ?auto_268408 ?auto_268409 ) ) ( not ( = ?auto_268408 ?auto_268410 ) ) ( not ( = ?auto_268408 ?auto_268411 ) ) ( not ( = ?auto_268409 ?auto_268410 ) ) ( not ( = ?auto_268409 ?auto_268411 ) ) ( not ( = ?auto_268410 ?auto_268411 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_268410 ?auto_268411 )
      ( !STACK ?auto_268410 ?auto_268409 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_268419 - BLOCK
      ?auto_268420 - BLOCK
      ?auto_268421 - BLOCK
      ?auto_268422 - BLOCK
      ?auto_268423 - BLOCK
      ?auto_268424 - BLOCK
      ?auto_268425 - BLOCK
    )
    :vars
    (
      ?auto_268426 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268425 ?auto_268426 ) ( ON-TABLE ?auto_268419 ) ( ON ?auto_268420 ?auto_268419 ) ( ON ?auto_268421 ?auto_268420 ) ( ON ?auto_268422 ?auto_268421 ) ( ON ?auto_268423 ?auto_268422 ) ( not ( = ?auto_268419 ?auto_268420 ) ) ( not ( = ?auto_268419 ?auto_268421 ) ) ( not ( = ?auto_268419 ?auto_268422 ) ) ( not ( = ?auto_268419 ?auto_268423 ) ) ( not ( = ?auto_268419 ?auto_268424 ) ) ( not ( = ?auto_268419 ?auto_268425 ) ) ( not ( = ?auto_268419 ?auto_268426 ) ) ( not ( = ?auto_268420 ?auto_268421 ) ) ( not ( = ?auto_268420 ?auto_268422 ) ) ( not ( = ?auto_268420 ?auto_268423 ) ) ( not ( = ?auto_268420 ?auto_268424 ) ) ( not ( = ?auto_268420 ?auto_268425 ) ) ( not ( = ?auto_268420 ?auto_268426 ) ) ( not ( = ?auto_268421 ?auto_268422 ) ) ( not ( = ?auto_268421 ?auto_268423 ) ) ( not ( = ?auto_268421 ?auto_268424 ) ) ( not ( = ?auto_268421 ?auto_268425 ) ) ( not ( = ?auto_268421 ?auto_268426 ) ) ( not ( = ?auto_268422 ?auto_268423 ) ) ( not ( = ?auto_268422 ?auto_268424 ) ) ( not ( = ?auto_268422 ?auto_268425 ) ) ( not ( = ?auto_268422 ?auto_268426 ) ) ( not ( = ?auto_268423 ?auto_268424 ) ) ( not ( = ?auto_268423 ?auto_268425 ) ) ( not ( = ?auto_268423 ?auto_268426 ) ) ( not ( = ?auto_268424 ?auto_268425 ) ) ( not ( = ?auto_268424 ?auto_268426 ) ) ( not ( = ?auto_268425 ?auto_268426 ) ) ( CLEAR ?auto_268423 ) ( ON ?auto_268424 ?auto_268425 ) ( CLEAR ?auto_268424 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_268419 ?auto_268420 ?auto_268421 ?auto_268422 ?auto_268423 ?auto_268424 )
      ( MAKE-7PILE ?auto_268419 ?auto_268420 ?auto_268421 ?auto_268422 ?auto_268423 ?auto_268424 ?auto_268425 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_268434 - BLOCK
      ?auto_268435 - BLOCK
      ?auto_268436 - BLOCK
      ?auto_268437 - BLOCK
      ?auto_268438 - BLOCK
      ?auto_268439 - BLOCK
      ?auto_268440 - BLOCK
    )
    :vars
    (
      ?auto_268441 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268440 ?auto_268441 ) ( ON-TABLE ?auto_268434 ) ( ON ?auto_268435 ?auto_268434 ) ( ON ?auto_268436 ?auto_268435 ) ( ON ?auto_268437 ?auto_268436 ) ( ON ?auto_268438 ?auto_268437 ) ( not ( = ?auto_268434 ?auto_268435 ) ) ( not ( = ?auto_268434 ?auto_268436 ) ) ( not ( = ?auto_268434 ?auto_268437 ) ) ( not ( = ?auto_268434 ?auto_268438 ) ) ( not ( = ?auto_268434 ?auto_268439 ) ) ( not ( = ?auto_268434 ?auto_268440 ) ) ( not ( = ?auto_268434 ?auto_268441 ) ) ( not ( = ?auto_268435 ?auto_268436 ) ) ( not ( = ?auto_268435 ?auto_268437 ) ) ( not ( = ?auto_268435 ?auto_268438 ) ) ( not ( = ?auto_268435 ?auto_268439 ) ) ( not ( = ?auto_268435 ?auto_268440 ) ) ( not ( = ?auto_268435 ?auto_268441 ) ) ( not ( = ?auto_268436 ?auto_268437 ) ) ( not ( = ?auto_268436 ?auto_268438 ) ) ( not ( = ?auto_268436 ?auto_268439 ) ) ( not ( = ?auto_268436 ?auto_268440 ) ) ( not ( = ?auto_268436 ?auto_268441 ) ) ( not ( = ?auto_268437 ?auto_268438 ) ) ( not ( = ?auto_268437 ?auto_268439 ) ) ( not ( = ?auto_268437 ?auto_268440 ) ) ( not ( = ?auto_268437 ?auto_268441 ) ) ( not ( = ?auto_268438 ?auto_268439 ) ) ( not ( = ?auto_268438 ?auto_268440 ) ) ( not ( = ?auto_268438 ?auto_268441 ) ) ( not ( = ?auto_268439 ?auto_268440 ) ) ( not ( = ?auto_268439 ?auto_268441 ) ) ( not ( = ?auto_268440 ?auto_268441 ) ) ( CLEAR ?auto_268438 ) ( ON ?auto_268439 ?auto_268440 ) ( CLEAR ?auto_268439 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_268434 ?auto_268435 ?auto_268436 ?auto_268437 ?auto_268438 ?auto_268439 )
      ( MAKE-7PILE ?auto_268434 ?auto_268435 ?auto_268436 ?auto_268437 ?auto_268438 ?auto_268439 ?auto_268440 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_268449 - BLOCK
      ?auto_268450 - BLOCK
      ?auto_268451 - BLOCK
      ?auto_268452 - BLOCK
      ?auto_268453 - BLOCK
      ?auto_268454 - BLOCK
      ?auto_268455 - BLOCK
    )
    :vars
    (
      ?auto_268456 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268455 ?auto_268456 ) ( ON-TABLE ?auto_268449 ) ( ON ?auto_268450 ?auto_268449 ) ( ON ?auto_268451 ?auto_268450 ) ( ON ?auto_268452 ?auto_268451 ) ( not ( = ?auto_268449 ?auto_268450 ) ) ( not ( = ?auto_268449 ?auto_268451 ) ) ( not ( = ?auto_268449 ?auto_268452 ) ) ( not ( = ?auto_268449 ?auto_268453 ) ) ( not ( = ?auto_268449 ?auto_268454 ) ) ( not ( = ?auto_268449 ?auto_268455 ) ) ( not ( = ?auto_268449 ?auto_268456 ) ) ( not ( = ?auto_268450 ?auto_268451 ) ) ( not ( = ?auto_268450 ?auto_268452 ) ) ( not ( = ?auto_268450 ?auto_268453 ) ) ( not ( = ?auto_268450 ?auto_268454 ) ) ( not ( = ?auto_268450 ?auto_268455 ) ) ( not ( = ?auto_268450 ?auto_268456 ) ) ( not ( = ?auto_268451 ?auto_268452 ) ) ( not ( = ?auto_268451 ?auto_268453 ) ) ( not ( = ?auto_268451 ?auto_268454 ) ) ( not ( = ?auto_268451 ?auto_268455 ) ) ( not ( = ?auto_268451 ?auto_268456 ) ) ( not ( = ?auto_268452 ?auto_268453 ) ) ( not ( = ?auto_268452 ?auto_268454 ) ) ( not ( = ?auto_268452 ?auto_268455 ) ) ( not ( = ?auto_268452 ?auto_268456 ) ) ( not ( = ?auto_268453 ?auto_268454 ) ) ( not ( = ?auto_268453 ?auto_268455 ) ) ( not ( = ?auto_268453 ?auto_268456 ) ) ( not ( = ?auto_268454 ?auto_268455 ) ) ( not ( = ?auto_268454 ?auto_268456 ) ) ( not ( = ?auto_268455 ?auto_268456 ) ) ( ON ?auto_268454 ?auto_268455 ) ( CLEAR ?auto_268452 ) ( ON ?auto_268453 ?auto_268454 ) ( CLEAR ?auto_268453 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_268449 ?auto_268450 ?auto_268451 ?auto_268452 ?auto_268453 )
      ( MAKE-7PILE ?auto_268449 ?auto_268450 ?auto_268451 ?auto_268452 ?auto_268453 ?auto_268454 ?auto_268455 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_268464 - BLOCK
      ?auto_268465 - BLOCK
      ?auto_268466 - BLOCK
      ?auto_268467 - BLOCK
      ?auto_268468 - BLOCK
      ?auto_268469 - BLOCK
      ?auto_268470 - BLOCK
    )
    :vars
    (
      ?auto_268471 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268470 ?auto_268471 ) ( ON-TABLE ?auto_268464 ) ( ON ?auto_268465 ?auto_268464 ) ( ON ?auto_268466 ?auto_268465 ) ( ON ?auto_268467 ?auto_268466 ) ( not ( = ?auto_268464 ?auto_268465 ) ) ( not ( = ?auto_268464 ?auto_268466 ) ) ( not ( = ?auto_268464 ?auto_268467 ) ) ( not ( = ?auto_268464 ?auto_268468 ) ) ( not ( = ?auto_268464 ?auto_268469 ) ) ( not ( = ?auto_268464 ?auto_268470 ) ) ( not ( = ?auto_268464 ?auto_268471 ) ) ( not ( = ?auto_268465 ?auto_268466 ) ) ( not ( = ?auto_268465 ?auto_268467 ) ) ( not ( = ?auto_268465 ?auto_268468 ) ) ( not ( = ?auto_268465 ?auto_268469 ) ) ( not ( = ?auto_268465 ?auto_268470 ) ) ( not ( = ?auto_268465 ?auto_268471 ) ) ( not ( = ?auto_268466 ?auto_268467 ) ) ( not ( = ?auto_268466 ?auto_268468 ) ) ( not ( = ?auto_268466 ?auto_268469 ) ) ( not ( = ?auto_268466 ?auto_268470 ) ) ( not ( = ?auto_268466 ?auto_268471 ) ) ( not ( = ?auto_268467 ?auto_268468 ) ) ( not ( = ?auto_268467 ?auto_268469 ) ) ( not ( = ?auto_268467 ?auto_268470 ) ) ( not ( = ?auto_268467 ?auto_268471 ) ) ( not ( = ?auto_268468 ?auto_268469 ) ) ( not ( = ?auto_268468 ?auto_268470 ) ) ( not ( = ?auto_268468 ?auto_268471 ) ) ( not ( = ?auto_268469 ?auto_268470 ) ) ( not ( = ?auto_268469 ?auto_268471 ) ) ( not ( = ?auto_268470 ?auto_268471 ) ) ( ON ?auto_268469 ?auto_268470 ) ( CLEAR ?auto_268467 ) ( ON ?auto_268468 ?auto_268469 ) ( CLEAR ?auto_268468 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_268464 ?auto_268465 ?auto_268466 ?auto_268467 ?auto_268468 )
      ( MAKE-7PILE ?auto_268464 ?auto_268465 ?auto_268466 ?auto_268467 ?auto_268468 ?auto_268469 ?auto_268470 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_268479 - BLOCK
      ?auto_268480 - BLOCK
      ?auto_268481 - BLOCK
      ?auto_268482 - BLOCK
      ?auto_268483 - BLOCK
      ?auto_268484 - BLOCK
      ?auto_268485 - BLOCK
    )
    :vars
    (
      ?auto_268486 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268485 ?auto_268486 ) ( ON-TABLE ?auto_268479 ) ( ON ?auto_268480 ?auto_268479 ) ( ON ?auto_268481 ?auto_268480 ) ( not ( = ?auto_268479 ?auto_268480 ) ) ( not ( = ?auto_268479 ?auto_268481 ) ) ( not ( = ?auto_268479 ?auto_268482 ) ) ( not ( = ?auto_268479 ?auto_268483 ) ) ( not ( = ?auto_268479 ?auto_268484 ) ) ( not ( = ?auto_268479 ?auto_268485 ) ) ( not ( = ?auto_268479 ?auto_268486 ) ) ( not ( = ?auto_268480 ?auto_268481 ) ) ( not ( = ?auto_268480 ?auto_268482 ) ) ( not ( = ?auto_268480 ?auto_268483 ) ) ( not ( = ?auto_268480 ?auto_268484 ) ) ( not ( = ?auto_268480 ?auto_268485 ) ) ( not ( = ?auto_268480 ?auto_268486 ) ) ( not ( = ?auto_268481 ?auto_268482 ) ) ( not ( = ?auto_268481 ?auto_268483 ) ) ( not ( = ?auto_268481 ?auto_268484 ) ) ( not ( = ?auto_268481 ?auto_268485 ) ) ( not ( = ?auto_268481 ?auto_268486 ) ) ( not ( = ?auto_268482 ?auto_268483 ) ) ( not ( = ?auto_268482 ?auto_268484 ) ) ( not ( = ?auto_268482 ?auto_268485 ) ) ( not ( = ?auto_268482 ?auto_268486 ) ) ( not ( = ?auto_268483 ?auto_268484 ) ) ( not ( = ?auto_268483 ?auto_268485 ) ) ( not ( = ?auto_268483 ?auto_268486 ) ) ( not ( = ?auto_268484 ?auto_268485 ) ) ( not ( = ?auto_268484 ?auto_268486 ) ) ( not ( = ?auto_268485 ?auto_268486 ) ) ( ON ?auto_268484 ?auto_268485 ) ( ON ?auto_268483 ?auto_268484 ) ( CLEAR ?auto_268481 ) ( ON ?auto_268482 ?auto_268483 ) ( CLEAR ?auto_268482 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_268479 ?auto_268480 ?auto_268481 ?auto_268482 )
      ( MAKE-7PILE ?auto_268479 ?auto_268480 ?auto_268481 ?auto_268482 ?auto_268483 ?auto_268484 ?auto_268485 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_268494 - BLOCK
      ?auto_268495 - BLOCK
      ?auto_268496 - BLOCK
      ?auto_268497 - BLOCK
      ?auto_268498 - BLOCK
      ?auto_268499 - BLOCK
      ?auto_268500 - BLOCK
    )
    :vars
    (
      ?auto_268501 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268500 ?auto_268501 ) ( ON-TABLE ?auto_268494 ) ( ON ?auto_268495 ?auto_268494 ) ( ON ?auto_268496 ?auto_268495 ) ( not ( = ?auto_268494 ?auto_268495 ) ) ( not ( = ?auto_268494 ?auto_268496 ) ) ( not ( = ?auto_268494 ?auto_268497 ) ) ( not ( = ?auto_268494 ?auto_268498 ) ) ( not ( = ?auto_268494 ?auto_268499 ) ) ( not ( = ?auto_268494 ?auto_268500 ) ) ( not ( = ?auto_268494 ?auto_268501 ) ) ( not ( = ?auto_268495 ?auto_268496 ) ) ( not ( = ?auto_268495 ?auto_268497 ) ) ( not ( = ?auto_268495 ?auto_268498 ) ) ( not ( = ?auto_268495 ?auto_268499 ) ) ( not ( = ?auto_268495 ?auto_268500 ) ) ( not ( = ?auto_268495 ?auto_268501 ) ) ( not ( = ?auto_268496 ?auto_268497 ) ) ( not ( = ?auto_268496 ?auto_268498 ) ) ( not ( = ?auto_268496 ?auto_268499 ) ) ( not ( = ?auto_268496 ?auto_268500 ) ) ( not ( = ?auto_268496 ?auto_268501 ) ) ( not ( = ?auto_268497 ?auto_268498 ) ) ( not ( = ?auto_268497 ?auto_268499 ) ) ( not ( = ?auto_268497 ?auto_268500 ) ) ( not ( = ?auto_268497 ?auto_268501 ) ) ( not ( = ?auto_268498 ?auto_268499 ) ) ( not ( = ?auto_268498 ?auto_268500 ) ) ( not ( = ?auto_268498 ?auto_268501 ) ) ( not ( = ?auto_268499 ?auto_268500 ) ) ( not ( = ?auto_268499 ?auto_268501 ) ) ( not ( = ?auto_268500 ?auto_268501 ) ) ( ON ?auto_268499 ?auto_268500 ) ( ON ?auto_268498 ?auto_268499 ) ( CLEAR ?auto_268496 ) ( ON ?auto_268497 ?auto_268498 ) ( CLEAR ?auto_268497 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_268494 ?auto_268495 ?auto_268496 ?auto_268497 )
      ( MAKE-7PILE ?auto_268494 ?auto_268495 ?auto_268496 ?auto_268497 ?auto_268498 ?auto_268499 ?auto_268500 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_268509 - BLOCK
      ?auto_268510 - BLOCK
      ?auto_268511 - BLOCK
      ?auto_268512 - BLOCK
      ?auto_268513 - BLOCK
      ?auto_268514 - BLOCK
      ?auto_268515 - BLOCK
    )
    :vars
    (
      ?auto_268516 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268515 ?auto_268516 ) ( ON-TABLE ?auto_268509 ) ( ON ?auto_268510 ?auto_268509 ) ( not ( = ?auto_268509 ?auto_268510 ) ) ( not ( = ?auto_268509 ?auto_268511 ) ) ( not ( = ?auto_268509 ?auto_268512 ) ) ( not ( = ?auto_268509 ?auto_268513 ) ) ( not ( = ?auto_268509 ?auto_268514 ) ) ( not ( = ?auto_268509 ?auto_268515 ) ) ( not ( = ?auto_268509 ?auto_268516 ) ) ( not ( = ?auto_268510 ?auto_268511 ) ) ( not ( = ?auto_268510 ?auto_268512 ) ) ( not ( = ?auto_268510 ?auto_268513 ) ) ( not ( = ?auto_268510 ?auto_268514 ) ) ( not ( = ?auto_268510 ?auto_268515 ) ) ( not ( = ?auto_268510 ?auto_268516 ) ) ( not ( = ?auto_268511 ?auto_268512 ) ) ( not ( = ?auto_268511 ?auto_268513 ) ) ( not ( = ?auto_268511 ?auto_268514 ) ) ( not ( = ?auto_268511 ?auto_268515 ) ) ( not ( = ?auto_268511 ?auto_268516 ) ) ( not ( = ?auto_268512 ?auto_268513 ) ) ( not ( = ?auto_268512 ?auto_268514 ) ) ( not ( = ?auto_268512 ?auto_268515 ) ) ( not ( = ?auto_268512 ?auto_268516 ) ) ( not ( = ?auto_268513 ?auto_268514 ) ) ( not ( = ?auto_268513 ?auto_268515 ) ) ( not ( = ?auto_268513 ?auto_268516 ) ) ( not ( = ?auto_268514 ?auto_268515 ) ) ( not ( = ?auto_268514 ?auto_268516 ) ) ( not ( = ?auto_268515 ?auto_268516 ) ) ( ON ?auto_268514 ?auto_268515 ) ( ON ?auto_268513 ?auto_268514 ) ( ON ?auto_268512 ?auto_268513 ) ( CLEAR ?auto_268510 ) ( ON ?auto_268511 ?auto_268512 ) ( CLEAR ?auto_268511 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_268509 ?auto_268510 ?auto_268511 )
      ( MAKE-7PILE ?auto_268509 ?auto_268510 ?auto_268511 ?auto_268512 ?auto_268513 ?auto_268514 ?auto_268515 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_268524 - BLOCK
      ?auto_268525 - BLOCK
      ?auto_268526 - BLOCK
      ?auto_268527 - BLOCK
      ?auto_268528 - BLOCK
      ?auto_268529 - BLOCK
      ?auto_268530 - BLOCK
    )
    :vars
    (
      ?auto_268531 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268530 ?auto_268531 ) ( ON-TABLE ?auto_268524 ) ( ON ?auto_268525 ?auto_268524 ) ( not ( = ?auto_268524 ?auto_268525 ) ) ( not ( = ?auto_268524 ?auto_268526 ) ) ( not ( = ?auto_268524 ?auto_268527 ) ) ( not ( = ?auto_268524 ?auto_268528 ) ) ( not ( = ?auto_268524 ?auto_268529 ) ) ( not ( = ?auto_268524 ?auto_268530 ) ) ( not ( = ?auto_268524 ?auto_268531 ) ) ( not ( = ?auto_268525 ?auto_268526 ) ) ( not ( = ?auto_268525 ?auto_268527 ) ) ( not ( = ?auto_268525 ?auto_268528 ) ) ( not ( = ?auto_268525 ?auto_268529 ) ) ( not ( = ?auto_268525 ?auto_268530 ) ) ( not ( = ?auto_268525 ?auto_268531 ) ) ( not ( = ?auto_268526 ?auto_268527 ) ) ( not ( = ?auto_268526 ?auto_268528 ) ) ( not ( = ?auto_268526 ?auto_268529 ) ) ( not ( = ?auto_268526 ?auto_268530 ) ) ( not ( = ?auto_268526 ?auto_268531 ) ) ( not ( = ?auto_268527 ?auto_268528 ) ) ( not ( = ?auto_268527 ?auto_268529 ) ) ( not ( = ?auto_268527 ?auto_268530 ) ) ( not ( = ?auto_268527 ?auto_268531 ) ) ( not ( = ?auto_268528 ?auto_268529 ) ) ( not ( = ?auto_268528 ?auto_268530 ) ) ( not ( = ?auto_268528 ?auto_268531 ) ) ( not ( = ?auto_268529 ?auto_268530 ) ) ( not ( = ?auto_268529 ?auto_268531 ) ) ( not ( = ?auto_268530 ?auto_268531 ) ) ( ON ?auto_268529 ?auto_268530 ) ( ON ?auto_268528 ?auto_268529 ) ( ON ?auto_268527 ?auto_268528 ) ( CLEAR ?auto_268525 ) ( ON ?auto_268526 ?auto_268527 ) ( CLEAR ?auto_268526 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_268524 ?auto_268525 ?auto_268526 )
      ( MAKE-7PILE ?auto_268524 ?auto_268525 ?auto_268526 ?auto_268527 ?auto_268528 ?auto_268529 ?auto_268530 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_268539 - BLOCK
      ?auto_268540 - BLOCK
      ?auto_268541 - BLOCK
      ?auto_268542 - BLOCK
      ?auto_268543 - BLOCK
      ?auto_268544 - BLOCK
      ?auto_268545 - BLOCK
    )
    :vars
    (
      ?auto_268546 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268545 ?auto_268546 ) ( ON-TABLE ?auto_268539 ) ( not ( = ?auto_268539 ?auto_268540 ) ) ( not ( = ?auto_268539 ?auto_268541 ) ) ( not ( = ?auto_268539 ?auto_268542 ) ) ( not ( = ?auto_268539 ?auto_268543 ) ) ( not ( = ?auto_268539 ?auto_268544 ) ) ( not ( = ?auto_268539 ?auto_268545 ) ) ( not ( = ?auto_268539 ?auto_268546 ) ) ( not ( = ?auto_268540 ?auto_268541 ) ) ( not ( = ?auto_268540 ?auto_268542 ) ) ( not ( = ?auto_268540 ?auto_268543 ) ) ( not ( = ?auto_268540 ?auto_268544 ) ) ( not ( = ?auto_268540 ?auto_268545 ) ) ( not ( = ?auto_268540 ?auto_268546 ) ) ( not ( = ?auto_268541 ?auto_268542 ) ) ( not ( = ?auto_268541 ?auto_268543 ) ) ( not ( = ?auto_268541 ?auto_268544 ) ) ( not ( = ?auto_268541 ?auto_268545 ) ) ( not ( = ?auto_268541 ?auto_268546 ) ) ( not ( = ?auto_268542 ?auto_268543 ) ) ( not ( = ?auto_268542 ?auto_268544 ) ) ( not ( = ?auto_268542 ?auto_268545 ) ) ( not ( = ?auto_268542 ?auto_268546 ) ) ( not ( = ?auto_268543 ?auto_268544 ) ) ( not ( = ?auto_268543 ?auto_268545 ) ) ( not ( = ?auto_268543 ?auto_268546 ) ) ( not ( = ?auto_268544 ?auto_268545 ) ) ( not ( = ?auto_268544 ?auto_268546 ) ) ( not ( = ?auto_268545 ?auto_268546 ) ) ( ON ?auto_268544 ?auto_268545 ) ( ON ?auto_268543 ?auto_268544 ) ( ON ?auto_268542 ?auto_268543 ) ( ON ?auto_268541 ?auto_268542 ) ( CLEAR ?auto_268539 ) ( ON ?auto_268540 ?auto_268541 ) ( CLEAR ?auto_268540 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_268539 ?auto_268540 )
      ( MAKE-7PILE ?auto_268539 ?auto_268540 ?auto_268541 ?auto_268542 ?auto_268543 ?auto_268544 ?auto_268545 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_268554 - BLOCK
      ?auto_268555 - BLOCK
      ?auto_268556 - BLOCK
      ?auto_268557 - BLOCK
      ?auto_268558 - BLOCK
      ?auto_268559 - BLOCK
      ?auto_268560 - BLOCK
    )
    :vars
    (
      ?auto_268561 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268560 ?auto_268561 ) ( ON-TABLE ?auto_268554 ) ( not ( = ?auto_268554 ?auto_268555 ) ) ( not ( = ?auto_268554 ?auto_268556 ) ) ( not ( = ?auto_268554 ?auto_268557 ) ) ( not ( = ?auto_268554 ?auto_268558 ) ) ( not ( = ?auto_268554 ?auto_268559 ) ) ( not ( = ?auto_268554 ?auto_268560 ) ) ( not ( = ?auto_268554 ?auto_268561 ) ) ( not ( = ?auto_268555 ?auto_268556 ) ) ( not ( = ?auto_268555 ?auto_268557 ) ) ( not ( = ?auto_268555 ?auto_268558 ) ) ( not ( = ?auto_268555 ?auto_268559 ) ) ( not ( = ?auto_268555 ?auto_268560 ) ) ( not ( = ?auto_268555 ?auto_268561 ) ) ( not ( = ?auto_268556 ?auto_268557 ) ) ( not ( = ?auto_268556 ?auto_268558 ) ) ( not ( = ?auto_268556 ?auto_268559 ) ) ( not ( = ?auto_268556 ?auto_268560 ) ) ( not ( = ?auto_268556 ?auto_268561 ) ) ( not ( = ?auto_268557 ?auto_268558 ) ) ( not ( = ?auto_268557 ?auto_268559 ) ) ( not ( = ?auto_268557 ?auto_268560 ) ) ( not ( = ?auto_268557 ?auto_268561 ) ) ( not ( = ?auto_268558 ?auto_268559 ) ) ( not ( = ?auto_268558 ?auto_268560 ) ) ( not ( = ?auto_268558 ?auto_268561 ) ) ( not ( = ?auto_268559 ?auto_268560 ) ) ( not ( = ?auto_268559 ?auto_268561 ) ) ( not ( = ?auto_268560 ?auto_268561 ) ) ( ON ?auto_268559 ?auto_268560 ) ( ON ?auto_268558 ?auto_268559 ) ( ON ?auto_268557 ?auto_268558 ) ( ON ?auto_268556 ?auto_268557 ) ( CLEAR ?auto_268554 ) ( ON ?auto_268555 ?auto_268556 ) ( CLEAR ?auto_268555 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_268554 ?auto_268555 )
      ( MAKE-7PILE ?auto_268554 ?auto_268555 ?auto_268556 ?auto_268557 ?auto_268558 ?auto_268559 ?auto_268560 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_268569 - BLOCK
      ?auto_268570 - BLOCK
      ?auto_268571 - BLOCK
      ?auto_268572 - BLOCK
      ?auto_268573 - BLOCK
      ?auto_268574 - BLOCK
      ?auto_268575 - BLOCK
    )
    :vars
    (
      ?auto_268576 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268575 ?auto_268576 ) ( not ( = ?auto_268569 ?auto_268570 ) ) ( not ( = ?auto_268569 ?auto_268571 ) ) ( not ( = ?auto_268569 ?auto_268572 ) ) ( not ( = ?auto_268569 ?auto_268573 ) ) ( not ( = ?auto_268569 ?auto_268574 ) ) ( not ( = ?auto_268569 ?auto_268575 ) ) ( not ( = ?auto_268569 ?auto_268576 ) ) ( not ( = ?auto_268570 ?auto_268571 ) ) ( not ( = ?auto_268570 ?auto_268572 ) ) ( not ( = ?auto_268570 ?auto_268573 ) ) ( not ( = ?auto_268570 ?auto_268574 ) ) ( not ( = ?auto_268570 ?auto_268575 ) ) ( not ( = ?auto_268570 ?auto_268576 ) ) ( not ( = ?auto_268571 ?auto_268572 ) ) ( not ( = ?auto_268571 ?auto_268573 ) ) ( not ( = ?auto_268571 ?auto_268574 ) ) ( not ( = ?auto_268571 ?auto_268575 ) ) ( not ( = ?auto_268571 ?auto_268576 ) ) ( not ( = ?auto_268572 ?auto_268573 ) ) ( not ( = ?auto_268572 ?auto_268574 ) ) ( not ( = ?auto_268572 ?auto_268575 ) ) ( not ( = ?auto_268572 ?auto_268576 ) ) ( not ( = ?auto_268573 ?auto_268574 ) ) ( not ( = ?auto_268573 ?auto_268575 ) ) ( not ( = ?auto_268573 ?auto_268576 ) ) ( not ( = ?auto_268574 ?auto_268575 ) ) ( not ( = ?auto_268574 ?auto_268576 ) ) ( not ( = ?auto_268575 ?auto_268576 ) ) ( ON ?auto_268574 ?auto_268575 ) ( ON ?auto_268573 ?auto_268574 ) ( ON ?auto_268572 ?auto_268573 ) ( ON ?auto_268571 ?auto_268572 ) ( ON ?auto_268570 ?auto_268571 ) ( ON ?auto_268569 ?auto_268570 ) ( CLEAR ?auto_268569 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_268569 )
      ( MAKE-7PILE ?auto_268569 ?auto_268570 ?auto_268571 ?auto_268572 ?auto_268573 ?auto_268574 ?auto_268575 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_268584 - BLOCK
      ?auto_268585 - BLOCK
      ?auto_268586 - BLOCK
      ?auto_268587 - BLOCK
      ?auto_268588 - BLOCK
      ?auto_268589 - BLOCK
      ?auto_268590 - BLOCK
    )
    :vars
    (
      ?auto_268591 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268590 ?auto_268591 ) ( not ( = ?auto_268584 ?auto_268585 ) ) ( not ( = ?auto_268584 ?auto_268586 ) ) ( not ( = ?auto_268584 ?auto_268587 ) ) ( not ( = ?auto_268584 ?auto_268588 ) ) ( not ( = ?auto_268584 ?auto_268589 ) ) ( not ( = ?auto_268584 ?auto_268590 ) ) ( not ( = ?auto_268584 ?auto_268591 ) ) ( not ( = ?auto_268585 ?auto_268586 ) ) ( not ( = ?auto_268585 ?auto_268587 ) ) ( not ( = ?auto_268585 ?auto_268588 ) ) ( not ( = ?auto_268585 ?auto_268589 ) ) ( not ( = ?auto_268585 ?auto_268590 ) ) ( not ( = ?auto_268585 ?auto_268591 ) ) ( not ( = ?auto_268586 ?auto_268587 ) ) ( not ( = ?auto_268586 ?auto_268588 ) ) ( not ( = ?auto_268586 ?auto_268589 ) ) ( not ( = ?auto_268586 ?auto_268590 ) ) ( not ( = ?auto_268586 ?auto_268591 ) ) ( not ( = ?auto_268587 ?auto_268588 ) ) ( not ( = ?auto_268587 ?auto_268589 ) ) ( not ( = ?auto_268587 ?auto_268590 ) ) ( not ( = ?auto_268587 ?auto_268591 ) ) ( not ( = ?auto_268588 ?auto_268589 ) ) ( not ( = ?auto_268588 ?auto_268590 ) ) ( not ( = ?auto_268588 ?auto_268591 ) ) ( not ( = ?auto_268589 ?auto_268590 ) ) ( not ( = ?auto_268589 ?auto_268591 ) ) ( not ( = ?auto_268590 ?auto_268591 ) ) ( ON ?auto_268589 ?auto_268590 ) ( ON ?auto_268588 ?auto_268589 ) ( ON ?auto_268587 ?auto_268588 ) ( ON ?auto_268586 ?auto_268587 ) ( ON ?auto_268585 ?auto_268586 ) ( ON ?auto_268584 ?auto_268585 ) ( CLEAR ?auto_268584 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_268584 )
      ( MAKE-7PILE ?auto_268584 ?auto_268585 ?auto_268586 ?auto_268587 ?auto_268588 ?auto_268589 ?auto_268590 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_268600 - BLOCK
      ?auto_268601 - BLOCK
      ?auto_268602 - BLOCK
      ?auto_268603 - BLOCK
      ?auto_268604 - BLOCK
      ?auto_268605 - BLOCK
      ?auto_268606 - BLOCK
      ?auto_268607 - BLOCK
    )
    :vars
    (
      ?auto_268608 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_268606 ) ( ON ?auto_268607 ?auto_268608 ) ( CLEAR ?auto_268607 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_268600 ) ( ON ?auto_268601 ?auto_268600 ) ( ON ?auto_268602 ?auto_268601 ) ( ON ?auto_268603 ?auto_268602 ) ( ON ?auto_268604 ?auto_268603 ) ( ON ?auto_268605 ?auto_268604 ) ( ON ?auto_268606 ?auto_268605 ) ( not ( = ?auto_268600 ?auto_268601 ) ) ( not ( = ?auto_268600 ?auto_268602 ) ) ( not ( = ?auto_268600 ?auto_268603 ) ) ( not ( = ?auto_268600 ?auto_268604 ) ) ( not ( = ?auto_268600 ?auto_268605 ) ) ( not ( = ?auto_268600 ?auto_268606 ) ) ( not ( = ?auto_268600 ?auto_268607 ) ) ( not ( = ?auto_268600 ?auto_268608 ) ) ( not ( = ?auto_268601 ?auto_268602 ) ) ( not ( = ?auto_268601 ?auto_268603 ) ) ( not ( = ?auto_268601 ?auto_268604 ) ) ( not ( = ?auto_268601 ?auto_268605 ) ) ( not ( = ?auto_268601 ?auto_268606 ) ) ( not ( = ?auto_268601 ?auto_268607 ) ) ( not ( = ?auto_268601 ?auto_268608 ) ) ( not ( = ?auto_268602 ?auto_268603 ) ) ( not ( = ?auto_268602 ?auto_268604 ) ) ( not ( = ?auto_268602 ?auto_268605 ) ) ( not ( = ?auto_268602 ?auto_268606 ) ) ( not ( = ?auto_268602 ?auto_268607 ) ) ( not ( = ?auto_268602 ?auto_268608 ) ) ( not ( = ?auto_268603 ?auto_268604 ) ) ( not ( = ?auto_268603 ?auto_268605 ) ) ( not ( = ?auto_268603 ?auto_268606 ) ) ( not ( = ?auto_268603 ?auto_268607 ) ) ( not ( = ?auto_268603 ?auto_268608 ) ) ( not ( = ?auto_268604 ?auto_268605 ) ) ( not ( = ?auto_268604 ?auto_268606 ) ) ( not ( = ?auto_268604 ?auto_268607 ) ) ( not ( = ?auto_268604 ?auto_268608 ) ) ( not ( = ?auto_268605 ?auto_268606 ) ) ( not ( = ?auto_268605 ?auto_268607 ) ) ( not ( = ?auto_268605 ?auto_268608 ) ) ( not ( = ?auto_268606 ?auto_268607 ) ) ( not ( = ?auto_268606 ?auto_268608 ) ) ( not ( = ?auto_268607 ?auto_268608 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_268607 ?auto_268608 )
      ( !STACK ?auto_268607 ?auto_268606 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_268617 - BLOCK
      ?auto_268618 - BLOCK
      ?auto_268619 - BLOCK
      ?auto_268620 - BLOCK
      ?auto_268621 - BLOCK
      ?auto_268622 - BLOCK
      ?auto_268623 - BLOCK
      ?auto_268624 - BLOCK
    )
    :vars
    (
      ?auto_268625 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_268623 ) ( ON ?auto_268624 ?auto_268625 ) ( CLEAR ?auto_268624 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_268617 ) ( ON ?auto_268618 ?auto_268617 ) ( ON ?auto_268619 ?auto_268618 ) ( ON ?auto_268620 ?auto_268619 ) ( ON ?auto_268621 ?auto_268620 ) ( ON ?auto_268622 ?auto_268621 ) ( ON ?auto_268623 ?auto_268622 ) ( not ( = ?auto_268617 ?auto_268618 ) ) ( not ( = ?auto_268617 ?auto_268619 ) ) ( not ( = ?auto_268617 ?auto_268620 ) ) ( not ( = ?auto_268617 ?auto_268621 ) ) ( not ( = ?auto_268617 ?auto_268622 ) ) ( not ( = ?auto_268617 ?auto_268623 ) ) ( not ( = ?auto_268617 ?auto_268624 ) ) ( not ( = ?auto_268617 ?auto_268625 ) ) ( not ( = ?auto_268618 ?auto_268619 ) ) ( not ( = ?auto_268618 ?auto_268620 ) ) ( not ( = ?auto_268618 ?auto_268621 ) ) ( not ( = ?auto_268618 ?auto_268622 ) ) ( not ( = ?auto_268618 ?auto_268623 ) ) ( not ( = ?auto_268618 ?auto_268624 ) ) ( not ( = ?auto_268618 ?auto_268625 ) ) ( not ( = ?auto_268619 ?auto_268620 ) ) ( not ( = ?auto_268619 ?auto_268621 ) ) ( not ( = ?auto_268619 ?auto_268622 ) ) ( not ( = ?auto_268619 ?auto_268623 ) ) ( not ( = ?auto_268619 ?auto_268624 ) ) ( not ( = ?auto_268619 ?auto_268625 ) ) ( not ( = ?auto_268620 ?auto_268621 ) ) ( not ( = ?auto_268620 ?auto_268622 ) ) ( not ( = ?auto_268620 ?auto_268623 ) ) ( not ( = ?auto_268620 ?auto_268624 ) ) ( not ( = ?auto_268620 ?auto_268625 ) ) ( not ( = ?auto_268621 ?auto_268622 ) ) ( not ( = ?auto_268621 ?auto_268623 ) ) ( not ( = ?auto_268621 ?auto_268624 ) ) ( not ( = ?auto_268621 ?auto_268625 ) ) ( not ( = ?auto_268622 ?auto_268623 ) ) ( not ( = ?auto_268622 ?auto_268624 ) ) ( not ( = ?auto_268622 ?auto_268625 ) ) ( not ( = ?auto_268623 ?auto_268624 ) ) ( not ( = ?auto_268623 ?auto_268625 ) ) ( not ( = ?auto_268624 ?auto_268625 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_268624 ?auto_268625 )
      ( !STACK ?auto_268624 ?auto_268623 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_268634 - BLOCK
      ?auto_268635 - BLOCK
      ?auto_268636 - BLOCK
      ?auto_268637 - BLOCK
      ?auto_268638 - BLOCK
      ?auto_268639 - BLOCK
      ?auto_268640 - BLOCK
      ?auto_268641 - BLOCK
    )
    :vars
    (
      ?auto_268642 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268641 ?auto_268642 ) ( ON-TABLE ?auto_268634 ) ( ON ?auto_268635 ?auto_268634 ) ( ON ?auto_268636 ?auto_268635 ) ( ON ?auto_268637 ?auto_268636 ) ( ON ?auto_268638 ?auto_268637 ) ( ON ?auto_268639 ?auto_268638 ) ( not ( = ?auto_268634 ?auto_268635 ) ) ( not ( = ?auto_268634 ?auto_268636 ) ) ( not ( = ?auto_268634 ?auto_268637 ) ) ( not ( = ?auto_268634 ?auto_268638 ) ) ( not ( = ?auto_268634 ?auto_268639 ) ) ( not ( = ?auto_268634 ?auto_268640 ) ) ( not ( = ?auto_268634 ?auto_268641 ) ) ( not ( = ?auto_268634 ?auto_268642 ) ) ( not ( = ?auto_268635 ?auto_268636 ) ) ( not ( = ?auto_268635 ?auto_268637 ) ) ( not ( = ?auto_268635 ?auto_268638 ) ) ( not ( = ?auto_268635 ?auto_268639 ) ) ( not ( = ?auto_268635 ?auto_268640 ) ) ( not ( = ?auto_268635 ?auto_268641 ) ) ( not ( = ?auto_268635 ?auto_268642 ) ) ( not ( = ?auto_268636 ?auto_268637 ) ) ( not ( = ?auto_268636 ?auto_268638 ) ) ( not ( = ?auto_268636 ?auto_268639 ) ) ( not ( = ?auto_268636 ?auto_268640 ) ) ( not ( = ?auto_268636 ?auto_268641 ) ) ( not ( = ?auto_268636 ?auto_268642 ) ) ( not ( = ?auto_268637 ?auto_268638 ) ) ( not ( = ?auto_268637 ?auto_268639 ) ) ( not ( = ?auto_268637 ?auto_268640 ) ) ( not ( = ?auto_268637 ?auto_268641 ) ) ( not ( = ?auto_268637 ?auto_268642 ) ) ( not ( = ?auto_268638 ?auto_268639 ) ) ( not ( = ?auto_268638 ?auto_268640 ) ) ( not ( = ?auto_268638 ?auto_268641 ) ) ( not ( = ?auto_268638 ?auto_268642 ) ) ( not ( = ?auto_268639 ?auto_268640 ) ) ( not ( = ?auto_268639 ?auto_268641 ) ) ( not ( = ?auto_268639 ?auto_268642 ) ) ( not ( = ?auto_268640 ?auto_268641 ) ) ( not ( = ?auto_268640 ?auto_268642 ) ) ( not ( = ?auto_268641 ?auto_268642 ) ) ( CLEAR ?auto_268639 ) ( ON ?auto_268640 ?auto_268641 ) ( CLEAR ?auto_268640 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_268634 ?auto_268635 ?auto_268636 ?auto_268637 ?auto_268638 ?auto_268639 ?auto_268640 )
      ( MAKE-8PILE ?auto_268634 ?auto_268635 ?auto_268636 ?auto_268637 ?auto_268638 ?auto_268639 ?auto_268640 ?auto_268641 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_268651 - BLOCK
      ?auto_268652 - BLOCK
      ?auto_268653 - BLOCK
      ?auto_268654 - BLOCK
      ?auto_268655 - BLOCK
      ?auto_268656 - BLOCK
      ?auto_268657 - BLOCK
      ?auto_268658 - BLOCK
    )
    :vars
    (
      ?auto_268659 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268658 ?auto_268659 ) ( ON-TABLE ?auto_268651 ) ( ON ?auto_268652 ?auto_268651 ) ( ON ?auto_268653 ?auto_268652 ) ( ON ?auto_268654 ?auto_268653 ) ( ON ?auto_268655 ?auto_268654 ) ( ON ?auto_268656 ?auto_268655 ) ( not ( = ?auto_268651 ?auto_268652 ) ) ( not ( = ?auto_268651 ?auto_268653 ) ) ( not ( = ?auto_268651 ?auto_268654 ) ) ( not ( = ?auto_268651 ?auto_268655 ) ) ( not ( = ?auto_268651 ?auto_268656 ) ) ( not ( = ?auto_268651 ?auto_268657 ) ) ( not ( = ?auto_268651 ?auto_268658 ) ) ( not ( = ?auto_268651 ?auto_268659 ) ) ( not ( = ?auto_268652 ?auto_268653 ) ) ( not ( = ?auto_268652 ?auto_268654 ) ) ( not ( = ?auto_268652 ?auto_268655 ) ) ( not ( = ?auto_268652 ?auto_268656 ) ) ( not ( = ?auto_268652 ?auto_268657 ) ) ( not ( = ?auto_268652 ?auto_268658 ) ) ( not ( = ?auto_268652 ?auto_268659 ) ) ( not ( = ?auto_268653 ?auto_268654 ) ) ( not ( = ?auto_268653 ?auto_268655 ) ) ( not ( = ?auto_268653 ?auto_268656 ) ) ( not ( = ?auto_268653 ?auto_268657 ) ) ( not ( = ?auto_268653 ?auto_268658 ) ) ( not ( = ?auto_268653 ?auto_268659 ) ) ( not ( = ?auto_268654 ?auto_268655 ) ) ( not ( = ?auto_268654 ?auto_268656 ) ) ( not ( = ?auto_268654 ?auto_268657 ) ) ( not ( = ?auto_268654 ?auto_268658 ) ) ( not ( = ?auto_268654 ?auto_268659 ) ) ( not ( = ?auto_268655 ?auto_268656 ) ) ( not ( = ?auto_268655 ?auto_268657 ) ) ( not ( = ?auto_268655 ?auto_268658 ) ) ( not ( = ?auto_268655 ?auto_268659 ) ) ( not ( = ?auto_268656 ?auto_268657 ) ) ( not ( = ?auto_268656 ?auto_268658 ) ) ( not ( = ?auto_268656 ?auto_268659 ) ) ( not ( = ?auto_268657 ?auto_268658 ) ) ( not ( = ?auto_268657 ?auto_268659 ) ) ( not ( = ?auto_268658 ?auto_268659 ) ) ( CLEAR ?auto_268656 ) ( ON ?auto_268657 ?auto_268658 ) ( CLEAR ?auto_268657 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_268651 ?auto_268652 ?auto_268653 ?auto_268654 ?auto_268655 ?auto_268656 ?auto_268657 )
      ( MAKE-8PILE ?auto_268651 ?auto_268652 ?auto_268653 ?auto_268654 ?auto_268655 ?auto_268656 ?auto_268657 ?auto_268658 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_268668 - BLOCK
      ?auto_268669 - BLOCK
      ?auto_268670 - BLOCK
      ?auto_268671 - BLOCK
      ?auto_268672 - BLOCK
      ?auto_268673 - BLOCK
      ?auto_268674 - BLOCK
      ?auto_268675 - BLOCK
    )
    :vars
    (
      ?auto_268676 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268675 ?auto_268676 ) ( ON-TABLE ?auto_268668 ) ( ON ?auto_268669 ?auto_268668 ) ( ON ?auto_268670 ?auto_268669 ) ( ON ?auto_268671 ?auto_268670 ) ( ON ?auto_268672 ?auto_268671 ) ( not ( = ?auto_268668 ?auto_268669 ) ) ( not ( = ?auto_268668 ?auto_268670 ) ) ( not ( = ?auto_268668 ?auto_268671 ) ) ( not ( = ?auto_268668 ?auto_268672 ) ) ( not ( = ?auto_268668 ?auto_268673 ) ) ( not ( = ?auto_268668 ?auto_268674 ) ) ( not ( = ?auto_268668 ?auto_268675 ) ) ( not ( = ?auto_268668 ?auto_268676 ) ) ( not ( = ?auto_268669 ?auto_268670 ) ) ( not ( = ?auto_268669 ?auto_268671 ) ) ( not ( = ?auto_268669 ?auto_268672 ) ) ( not ( = ?auto_268669 ?auto_268673 ) ) ( not ( = ?auto_268669 ?auto_268674 ) ) ( not ( = ?auto_268669 ?auto_268675 ) ) ( not ( = ?auto_268669 ?auto_268676 ) ) ( not ( = ?auto_268670 ?auto_268671 ) ) ( not ( = ?auto_268670 ?auto_268672 ) ) ( not ( = ?auto_268670 ?auto_268673 ) ) ( not ( = ?auto_268670 ?auto_268674 ) ) ( not ( = ?auto_268670 ?auto_268675 ) ) ( not ( = ?auto_268670 ?auto_268676 ) ) ( not ( = ?auto_268671 ?auto_268672 ) ) ( not ( = ?auto_268671 ?auto_268673 ) ) ( not ( = ?auto_268671 ?auto_268674 ) ) ( not ( = ?auto_268671 ?auto_268675 ) ) ( not ( = ?auto_268671 ?auto_268676 ) ) ( not ( = ?auto_268672 ?auto_268673 ) ) ( not ( = ?auto_268672 ?auto_268674 ) ) ( not ( = ?auto_268672 ?auto_268675 ) ) ( not ( = ?auto_268672 ?auto_268676 ) ) ( not ( = ?auto_268673 ?auto_268674 ) ) ( not ( = ?auto_268673 ?auto_268675 ) ) ( not ( = ?auto_268673 ?auto_268676 ) ) ( not ( = ?auto_268674 ?auto_268675 ) ) ( not ( = ?auto_268674 ?auto_268676 ) ) ( not ( = ?auto_268675 ?auto_268676 ) ) ( ON ?auto_268674 ?auto_268675 ) ( CLEAR ?auto_268672 ) ( ON ?auto_268673 ?auto_268674 ) ( CLEAR ?auto_268673 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_268668 ?auto_268669 ?auto_268670 ?auto_268671 ?auto_268672 ?auto_268673 )
      ( MAKE-8PILE ?auto_268668 ?auto_268669 ?auto_268670 ?auto_268671 ?auto_268672 ?auto_268673 ?auto_268674 ?auto_268675 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_268685 - BLOCK
      ?auto_268686 - BLOCK
      ?auto_268687 - BLOCK
      ?auto_268688 - BLOCK
      ?auto_268689 - BLOCK
      ?auto_268690 - BLOCK
      ?auto_268691 - BLOCK
      ?auto_268692 - BLOCK
    )
    :vars
    (
      ?auto_268693 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268692 ?auto_268693 ) ( ON-TABLE ?auto_268685 ) ( ON ?auto_268686 ?auto_268685 ) ( ON ?auto_268687 ?auto_268686 ) ( ON ?auto_268688 ?auto_268687 ) ( ON ?auto_268689 ?auto_268688 ) ( not ( = ?auto_268685 ?auto_268686 ) ) ( not ( = ?auto_268685 ?auto_268687 ) ) ( not ( = ?auto_268685 ?auto_268688 ) ) ( not ( = ?auto_268685 ?auto_268689 ) ) ( not ( = ?auto_268685 ?auto_268690 ) ) ( not ( = ?auto_268685 ?auto_268691 ) ) ( not ( = ?auto_268685 ?auto_268692 ) ) ( not ( = ?auto_268685 ?auto_268693 ) ) ( not ( = ?auto_268686 ?auto_268687 ) ) ( not ( = ?auto_268686 ?auto_268688 ) ) ( not ( = ?auto_268686 ?auto_268689 ) ) ( not ( = ?auto_268686 ?auto_268690 ) ) ( not ( = ?auto_268686 ?auto_268691 ) ) ( not ( = ?auto_268686 ?auto_268692 ) ) ( not ( = ?auto_268686 ?auto_268693 ) ) ( not ( = ?auto_268687 ?auto_268688 ) ) ( not ( = ?auto_268687 ?auto_268689 ) ) ( not ( = ?auto_268687 ?auto_268690 ) ) ( not ( = ?auto_268687 ?auto_268691 ) ) ( not ( = ?auto_268687 ?auto_268692 ) ) ( not ( = ?auto_268687 ?auto_268693 ) ) ( not ( = ?auto_268688 ?auto_268689 ) ) ( not ( = ?auto_268688 ?auto_268690 ) ) ( not ( = ?auto_268688 ?auto_268691 ) ) ( not ( = ?auto_268688 ?auto_268692 ) ) ( not ( = ?auto_268688 ?auto_268693 ) ) ( not ( = ?auto_268689 ?auto_268690 ) ) ( not ( = ?auto_268689 ?auto_268691 ) ) ( not ( = ?auto_268689 ?auto_268692 ) ) ( not ( = ?auto_268689 ?auto_268693 ) ) ( not ( = ?auto_268690 ?auto_268691 ) ) ( not ( = ?auto_268690 ?auto_268692 ) ) ( not ( = ?auto_268690 ?auto_268693 ) ) ( not ( = ?auto_268691 ?auto_268692 ) ) ( not ( = ?auto_268691 ?auto_268693 ) ) ( not ( = ?auto_268692 ?auto_268693 ) ) ( ON ?auto_268691 ?auto_268692 ) ( CLEAR ?auto_268689 ) ( ON ?auto_268690 ?auto_268691 ) ( CLEAR ?auto_268690 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_268685 ?auto_268686 ?auto_268687 ?auto_268688 ?auto_268689 ?auto_268690 )
      ( MAKE-8PILE ?auto_268685 ?auto_268686 ?auto_268687 ?auto_268688 ?auto_268689 ?auto_268690 ?auto_268691 ?auto_268692 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_268702 - BLOCK
      ?auto_268703 - BLOCK
      ?auto_268704 - BLOCK
      ?auto_268705 - BLOCK
      ?auto_268706 - BLOCK
      ?auto_268707 - BLOCK
      ?auto_268708 - BLOCK
      ?auto_268709 - BLOCK
    )
    :vars
    (
      ?auto_268710 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268709 ?auto_268710 ) ( ON-TABLE ?auto_268702 ) ( ON ?auto_268703 ?auto_268702 ) ( ON ?auto_268704 ?auto_268703 ) ( ON ?auto_268705 ?auto_268704 ) ( not ( = ?auto_268702 ?auto_268703 ) ) ( not ( = ?auto_268702 ?auto_268704 ) ) ( not ( = ?auto_268702 ?auto_268705 ) ) ( not ( = ?auto_268702 ?auto_268706 ) ) ( not ( = ?auto_268702 ?auto_268707 ) ) ( not ( = ?auto_268702 ?auto_268708 ) ) ( not ( = ?auto_268702 ?auto_268709 ) ) ( not ( = ?auto_268702 ?auto_268710 ) ) ( not ( = ?auto_268703 ?auto_268704 ) ) ( not ( = ?auto_268703 ?auto_268705 ) ) ( not ( = ?auto_268703 ?auto_268706 ) ) ( not ( = ?auto_268703 ?auto_268707 ) ) ( not ( = ?auto_268703 ?auto_268708 ) ) ( not ( = ?auto_268703 ?auto_268709 ) ) ( not ( = ?auto_268703 ?auto_268710 ) ) ( not ( = ?auto_268704 ?auto_268705 ) ) ( not ( = ?auto_268704 ?auto_268706 ) ) ( not ( = ?auto_268704 ?auto_268707 ) ) ( not ( = ?auto_268704 ?auto_268708 ) ) ( not ( = ?auto_268704 ?auto_268709 ) ) ( not ( = ?auto_268704 ?auto_268710 ) ) ( not ( = ?auto_268705 ?auto_268706 ) ) ( not ( = ?auto_268705 ?auto_268707 ) ) ( not ( = ?auto_268705 ?auto_268708 ) ) ( not ( = ?auto_268705 ?auto_268709 ) ) ( not ( = ?auto_268705 ?auto_268710 ) ) ( not ( = ?auto_268706 ?auto_268707 ) ) ( not ( = ?auto_268706 ?auto_268708 ) ) ( not ( = ?auto_268706 ?auto_268709 ) ) ( not ( = ?auto_268706 ?auto_268710 ) ) ( not ( = ?auto_268707 ?auto_268708 ) ) ( not ( = ?auto_268707 ?auto_268709 ) ) ( not ( = ?auto_268707 ?auto_268710 ) ) ( not ( = ?auto_268708 ?auto_268709 ) ) ( not ( = ?auto_268708 ?auto_268710 ) ) ( not ( = ?auto_268709 ?auto_268710 ) ) ( ON ?auto_268708 ?auto_268709 ) ( ON ?auto_268707 ?auto_268708 ) ( CLEAR ?auto_268705 ) ( ON ?auto_268706 ?auto_268707 ) ( CLEAR ?auto_268706 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_268702 ?auto_268703 ?auto_268704 ?auto_268705 ?auto_268706 )
      ( MAKE-8PILE ?auto_268702 ?auto_268703 ?auto_268704 ?auto_268705 ?auto_268706 ?auto_268707 ?auto_268708 ?auto_268709 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_268719 - BLOCK
      ?auto_268720 - BLOCK
      ?auto_268721 - BLOCK
      ?auto_268722 - BLOCK
      ?auto_268723 - BLOCK
      ?auto_268724 - BLOCK
      ?auto_268725 - BLOCK
      ?auto_268726 - BLOCK
    )
    :vars
    (
      ?auto_268727 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268726 ?auto_268727 ) ( ON-TABLE ?auto_268719 ) ( ON ?auto_268720 ?auto_268719 ) ( ON ?auto_268721 ?auto_268720 ) ( ON ?auto_268722 ?auto_268721 ) ( not ( = ?auto_268719 ?auto_268720 ) ) ( not ( = ?auto_268719 ?auto_268721 ) ) ( not ( = ?auto_268719 ?auto_268722 ) ) ( not ( = ?auto_268719 ?auto_268723 ) ) ( not ( = ?auto_268719 ?auto_268724 ) ) ( not ( = ?auto_268719 ?auto_268725 ) ) ( not ( = ?auto_268719 ?auto_268726 ) ) ( not ( = ?auto_268719 ?auto_268727 ) ) ( not ( = ?auto_268720 ?auto_268721 ) ) ( not ( = ?auto_268720 ?auto_268722 ) ) ( not ( = ?auto_268720 ?auto_268723 ) ) ( not ( = ?auto_268720 ?auto_268724 ) ) ( not ( = ?auto_268720 ?auto_268725 ) ) ( not ( = ?auto_268720 ?auto_268726 ) ) ( not ( = ?auto_268720 ?auto_268727 ) ) ( not ( = ?auto_268721 ?auto_268722 ) ) ( not ( = ?auto_268721 ?auto_268723 ) ) ( not ( = ?auto_268721 ?auto_268724 ) ) ( not ( = ?auto_268721 ?auto_268725 ) ) ( not ( = ?auto_268721 ?auto_268726 ) ) ( not ( = ?auto_268721 ?auto_268727 ) ) ( not ( = ?auto_268722 ?auto_268723 ) ) ( not ( = ?auto_268722 ?auto_268724 ) ) ( not ( = ?auto_268722 ?auto_268725 ) ) ( not ( = ?auto_268722 ?auto_268726 ) ) ( not ( = ?auto_268722 ?auto_268727 ) ) ( not ( = ?auto_268723 ?auto_268724 ) ) ( not ( = ?auto_268723 ?auto_268725 ) ) ( not ( = ?auto_268723 ?auto_268726 ) ) ( not ( = ?auto_268723 ?auto_268727 ) ) ( not ( = ?auto_268724 ?auto_268725 ) ) ( not ( = ?auto_268724 ?auto_268726 ) ) ( not ( = ?auto_268724 ?auto_268727 ) ) ( not ( = ?auto_268725 ?auto_268726 ) ) ( not ( = ?auto_268725 ?auto_268727 ) ) ( not ( = ?auto_268726 ?auto_268727 ) ) ( ON ?auto_268725 ?auto_268726 ) ( ON ?auto_268724 ?auto_268725 ) ( CLEAR ?auto_268722 ) ( ON ?auto_268723 ?auto_268724 ) ( CLEAR ?auto_268723 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_268719 ?auto_268720 ?auto_268721 ?auto_268722 ?auto_268723 )
      ( MAKE-8PILE ?auto_268719 ?auto_268720 ?auto_268721 ?auto_268722 ?auto_268723 ?auto_268724 ?auto_268725 ?auto_268726 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_268736 - BLOCK
      ?auto_268737 - BLOCK
      ?auto_268738 - BLOCK
      ?auto_268739 - BLOCK
      ?auto_268740 - BLOCK
      ?auto_268741 - BLOCK
      ?auto_268742 - BLOCK
      ?auto_268743 - BLOCK
    )
    :vars
    (
      ?auto_268744 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268743 ?auto_268744 ) ( ON-TABLE ?auto_268736 ) ( ON ?auto_268737 ?auto_268736 ) ( ON ?auto_268738 ?auto_268737 ) ( not ( = ?auto_268736 ?auto_268737 ) ) ( not ( = ?auto_268736 ?auto_268738 ) ) ( not ( = ?auto_268736 ?auto_268739 ) ) ( not ( = ?auto_268736 ?auto_268740 ) ) ( not ( = ?auto_268736 ?auto_268741 ) ) ( not ( = ?auto_268736 ?auto_268742 ) ) ( not ( = ?auto_268736 ?auto_268743 ) ) ( not ( = ?auto_268736 ?auto_268744 ) ) ( not ( = ?auto_268737 ?auto_268738 ) ) ( not ( = ?auto_268737 ?auto_268739 ) ) ( not ( = ?auto_268737 ?auto_268740 ) ) ( not ( = ?auto_268737 ?auto_268741 ) ) ( not ( = ?auto_268737 ?auto_268742 ) ) ( not ( = ?auto_268737 ?auto_268743 ) ) ( not ( = ?auto_268737 ?auto_268744 ) ) ( not ( = ?auto_268738 ?auto_268739 ) ) ( not ( = ?auto_268738 ?auto_268740 ) ) ( not ( = ?auto_268738 ?auto_268741 ) ) ( not ( = ?auto_268738 ?auto_268742 ) ) ( not ( = ?auto_268738 ?auto_268743 ) ) ( not ( = ?auto_268738 ?auto_268744 ) ) ( not ( = ?auto_268739 ?auto_268740 ) ) ( not ( = ?auto_268739 ?auto_268741 ) ) ( not ( = ?auto_268739 ?auto_268742 ) ) ( not ( = ?auto_268739 ?auto_268743 ) ) ( not ( = ?auto_268739 ?auto_268744 ) ) ( not ( = ?auto_268740 ?auto_268741 ) ) ( not ( = ?auto_268740 ?auto_268742 ) ) ( not ( = ?auto_268740 ?auto_268743 ) ) ( not ( = ?auto_268740 ?auto_268744 ) ) ( not ( = ?auto_268741 ?auto_268742 ) ) ( not ( = ?auto_268741 ?auto_268743 ) ) ( not ( = ?auto_268741 ?auto_268744 ) ) ( not ( = ?auto_268742 ?auto_268743 ) ) ( not ( = ?auto_268742 ?auto_268744 ) ) ( not ( = ?auto_268743 ?auto_268744 ) ) ( ON ?auto_268742 ?auto_268743 ) ( ON ?auto_268741 ?auto_268742 ) ( ON ?auto_268740 ?auto_268741 ) ( CLEAR ?auto_268738 ) ( ON ?auto_268739 ?auto_268740 ) ( CLEAR ?auto_268739 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_268736 ?auto_268737 ?auto_268738 ?auto_268739 )
      ( MAKE-8PILE ?auto_268736 ?auto_268737 ?auto_268738 ?auto_268739 ?auto_268740 ?auto_268741 ?auto_268742 ?auto_268743 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_268753 - BLOCK
      ?auto_268754 - BLOCK
      ?auto_268755 - BLOCK
      ?auto_268756 - BLOCK
      ?auto_268757 - BLOCK
      ?auto_268758 - BLOCK
      ?auto_268759 - BLOCK
      ?auto_268760 - BLOCK
    )
    :vars
    (
      ?auto_268761 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268760 ?auto_268761 ) ( ON-TABLE ?auto_268753 ) ( ON ?auto_268754 ?auto_268753 ) ( ON ?auto_268755 ?auto_268754 ) ( not ( = ?auto_268753 ?auto_268754 ) ) ( not ( = ?auto_268753 ?auto_268755 ) ) ( not ( = ?auto_268753 ?auto_268756 ) ) ( not ( = ?auto_268753 ?auto_268757 ) ) ( not ( = ?auto_268753 ?auto_268758 ) ) ( not ( = ?auto_268753 ?auto_268759 ) ) ( not ( = ?auto_268753 ?auto_268760 ) ) ( not ( = ?auto_268753 ?auto_268761 ) ) ( not ( = ?auto_268754 ?auto_268755 ) ) ( not ( = ?auto_268754 ?auto_268756 ) ) ( not ( = ?auto_268754 ?auto_268757 ) ) ( not ( = ?auto_268754 ?auto_268758 ) ) ( not ( = ?auto_268754 ?auto_268759 ) ) ( not ( = ?auto_268754 ?auto_268760 ) ) ( not ( = ?auto_268754 ?auto_268761 ) ) ( not ( = ?auto_268755 ?auto_268756 ) ) ( not ( = ?auto_268755 ?auto_268757 ) ) ( not ( = ?auto_268755 ?auto_268758 ) ) ( not ( = ?auto_268755 ?auto_268759 ) ) ( not ( = ?auto_268755 ?auto_268760 ) ) ( not ( = ?auto_268755 ?auto_268761 ) ) ( not ( = ?auto_268756 ?auto_268757 ) ) ( not ( = ?auto_268756 ?auto_268758 ) ) ( not ( = ?auto_268756 ?auto_268759 ) ) ( not ( = ?auto_268756 ?auto_268760 ) ) ( not ( = ?auto_268756 ?auto_268761 ) ) ( not ( = ?auto_268757 ?auto_268758 ) ) ( not ( = ?auto_268757 ?auto_268759 ) ) ( not ( = ?auto_268757 ?auto_268760 ) ) ( not ( = ?auto_268757 ?auto_268761 ) ) ( not ( = ?auto_268758 ?auto_268759 ) ) ( not ( = ?auto_268758 ?auto_268760 ) ) ( not ( = ?auto_268758 ?auto_268761 ) ) ( not ( = ?auto_268759 ?auto_268760 ) ) ( not ( = ?auto_268759 ?auto_268761 ) ) ( not ( = ?auto_268760 ?auto_268761 ) ) ( ON ?auto_268759 ?auto_268760 ) ( ON ?auto_268758 ?auto_268759 ) ( ON ?auto_268757 ?auto_268758 ) ( CLEAR ?auto_268755 ) ( ON ?auto_268756 ?auto_268757 ) ( CLEAR ?auto_268756 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_268753 ?auto_268754 ?auto_268755 ?auto_268756 )
      ( MAKE-8PILE ?auto_268753 ?auto_268754 ?auto_268755 ?auto_268756 ?auto_268757 ?auto_268758 ?auto_268759 ?auto_268760 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_268770 - BLOCK
      ?auto_268771 - BLOCK
      ?auto_268772 - BLOCK
      ?auto_268773 - BLOCK
      ?auto_268774 - BLOCK
      ?auto_268775 - BLOCK
      ?auto_268776 - BLOCK
      ?auto_268777 - BLOCK
    )
    :vars
    (
      ?auto_268778 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268777 ?auto_268778 ) ( ON-TABLE ?auto_268770 ) ( ON ?auto_268771 ?auto_268770 ) ( not ( = ?auto_268770 ?auto_268771 ) ) ( not ( = ?auto_268770 ?auto_268772 ) ) ( not ( = ?auto_268770 ?auto_268773 ) ) ( not ( = ?auto_268770 ?auto_268774 ) ) ( not ( = ?auto_268770 ?auto_268775 ) ) ( not ( = ?auto_268770 ?auto_268776 ) ) ( not ( = ?auto_268770 ?auto_268777 ) ) ( not ( = ?auto_268770 ?auto_268778 ) ) ( not ( = ?auto_268771 ?auto_268772 ) ) ( not ( = ?auto_268771 ?auto_268773 ) ) ( not ( = ?auto_268771 ?auto_268774 ) ) ( not ( = ?auto_268771 ?auto_268775 ) ) ( not ( = ?auto_268771 ?auto_268776 ) ) ( not ( = ?auto_268771 ?auto_268777 ) ) ( not ( = ?auto_268771 ?auto_268778 ) ) ( not ( = ?auto_268772 ?auto_268773 ) ) ( not ( = ?auto_268772 ?auto_268774 ) ) ( not ( = ?auto_268772 ?auto_268775 ) ) ( not ( = ?auto_268772 ?auto_268776 ) ) ( not ( = ?auto_268772 ?auto_268777 ) ) ( not ( = ?auto_268772 ?auto_268778 ) ) ( not ( = ?auto_268773 ?auto_268774 ) ) ( not ( = ?auto_268773 ?auto_268775 ) ) ( not ( = ?auto_268773 ?auto_268776 ) ) ( not ( = ?auto_268773 ?auto_268777 ) ) ( not ( = ?auto_268773 ?auto_268778 ) ) ( not ( = ?auto_268774 ?auto_268775 ) ) ( not ( = ?auto_268774 ?auto_268776 ) ) ( not ( = ?auto_268774 ?auto_268777 ) ) ( not ( = ?auto_268774 ?auto_268778 ) ) ( not ( = ?auto_268775 ?auto_268776 ) ) ( not ( = ?auto_268775 ?auto_268777 ) ) ( not ( = ?auto_268775 ?auto_268778 ) ) ( not ( = ?auto_268776 ?auto_268777 ) ) ( not ( = ?auto_268776 ?auto_268778 ) ) ( not ( = ?auto_268777 ?auto_268778 ) ) ( ON ?auto_268776 ?auto_268777 ) ( ON ?auto_268775 ?auto_268776 ) ( ON ?auto_268774 ?auto_268775 ) ( ON ?auto_268773 ?auto_268774 ) ( CLEAR ?auto_268771 ) ( ON ?auto_268772 ?auto_268773 ) ( CLEAR ?auto_268772 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_268770 ?auto_268771 ?auto_268772 )
      ( MAKE-8PILE ?auto_268770 ?auto_268771 ?auto_268772 ?auto_268773 ?auto_268774 ?auto_268775 ?auto_268776 ?auto_268777 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_268787 - BLOCK
      ?auto_268788 - BLOCK
      ?auto_268789 - BLOCK
      ?auto_268790 - BLOCK
      ?auto_268791 - BLOCK
      ?auto_268792 - BLOCK
      ?auto_268793 - BLOCK
      ?auto_268794 - BLOCK
    )
    :vars
    (
      ?auto_268795 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268794 ?auto_268795 ) ( ON-TABLE ?auto_268787 ) ( ON ?auto_268788 ?auto_268787 ) ( not ( = ?auto_268787 ?auto_268788 ) ) ( not ( = ?auto_268787 ?auto_268789 ) ) ( not ( = ?auto_268787 ?auto_268790 ) ) ( not ( = ?auto_268787 ?auto_268791 ) ) ( not ( = ?auto_268787 ?auto_268792 ) ) ( not ( = ?auto_268787 ?auto_268793 ) ) ( not ( = ?auto_268787 ?auto_268794 ) ) ( not ( = ?auto_268787 ?auto_268795 ) ) ( not ( = ?auto_268788 ?auto_268789 ) ) ( not ( = ?auto_268788 ?auto_268790 ) ) ( not ( = ?auto_268788 ?auto_268791 ) ) ( not ( = ?auto_268788 ?auto_268792 ) ) ( not ( = ?auto_268788 ?auto_268793 ) ) ( not ( = ?auto_268788 ?auto_268794 ) ) ( not ( = ?auto_268788 ?auto_268795 ) ) ( not ( = ?auto_268789 ?auto_268790 ) ) ( not ( = ?auto_268789 ?auto_268791 ) ) ( not ( = ?auto_268789 ?auto_268792 ) ) ( not ( = ?auto_268789 ?auto_268793 ) ) ( not ( = ?auto_268789 ?auto_268794 ) ) ( not ( = ?auto_268789 ?auto_268795 ) ) ( not ( = ?auto_268790 ?auto_268791 ) ) ( not ( = ?auto_268790 ?auto_268792 ) ) ( not ( = ?auto_268790 ?auto_268793 ) ) ( not ( = ?auto_268790 ?auto_268794 ) ) ( not ( = ?auto_268790 ?auto_268795 ) ) ( not ( = ?auto_268791 ?auto_268792 ) ) ( not ( = ?auto_268791 ?auto_268793 ) ) ( not ( = ?auto_268791 ?auto_268794 ) ) ( not ( = ?auto_268791 ?auto_268795 ) ) ( not ( = ?auto_268792 ?auto_268793 ) ) ( not ( = ?auto_268792 ?auto_268794 ) ) ( not ( = ?auto_268792 ?auto_268795 ) ) ( not ( = ?auto_268793 ?auto_268794 ) ) ( not ( = ?auto_268793 ?auto_268795 ) ) ( not ( = ?auto_268794 ?auto_268795 ) ) ( ON ?auto_268793 ?auto_268794 ) ( ON ?auto_268792 ?auto_268793 ) ( ON ?auto_268791 ?auto_268792 ) ( ON ?auto_268790 ?auto_268791 ) ( CLEAR ?auto_268788 ) ( ON ?auto_268789 ?auto_268790 ) ( CLEAR ?auto_268789 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_268787 ?auto_268788 ?auto_268789 )
      ( MAKE-8PILE ?auto_268787 ?auto_268788 ?auto_268789 ?auto_268790 ?auto_268791 ?auto_268792 ?auto_268793 ?auto_268794 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_268804 - BLOCK
      ?auto_268805 - BLOCK
      ?auto_268806 - BLOCK
      ?auto_268807 - BLOCK
      ?auto_268808 - BLOCK
      ?auto_268809 - BLOCK
      ?auto_268810 - BLOCK
      ?auto_268811 - BLOCK
    )
    :vars
    (
      ?auto_268812 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268811 ?auto_268812 ) ( ON-TABLE ?auto_268804 ) ( not ( = ?auto_268804 ?auto_268805 ) ) ( not ( = ?auto_268804 ?auto_268806 ) ) ( not ( = ?auto_268804 ?auto_268807 ) ) ( not ( = ?auto_268804 ?auto_268808 ) ) ( not ( = ?auto_268804 ?auto_268809 ) ) ( not ( = ?auto_268804 ?auto_268810 ) ) ( not ( = ?auto_268804 ?auto_268811 ) ) ( not ( = ?auto_268804 ?auto_268812 ) ) ( not ( = ?auto_268805 ?auto_268806 ) ) ( not ( = ?auto_268805 ?auto_268807 ) ) ( not ( = ?auto_268805 ?auto_268808 ) ) ( not ( = ?auto_268805 ?auto_268809 ) ) ( not ( = ?auto_268805 ?auto_268810 ) ) ( not ( = ?auto_268805 ?auto_268811 ) ) ( not ( = ?auto_268805 ?auto_268812 ) ) ( not ( = ?auto_268806 ?auto_268807 ) ) ( not ( = ?auto_268806 ?auto_268808 ) ) ( not ( = ?auto_268806 ?auto_268809 ) ) ( not ( = ?auto_268806 ?auto_268810 ) ) ( not ( = ?auto_268806 ?auto_268811 ) ) ( not ( = ?auto_268806 ?auto_268812 ) ) ( not ( = ?auto_268807 ?auto_268808 ) ) ( not ( = ?auto_268807 ?auto_268809 ) ) ( not ( = ?auto_268807 ?auto_268810 ) ) ( not ( = ?auto_268807 ?auto_268811 ) ) ( not ( = ?auto_268807 ?auto_268812 ) ) ( not ( = ?auto_268808 ?auto_268809 ) ) ( not ( = ?auto_268808 ?auto_268810 ) ) ( not ( = ?auto_268808 ?auto_268811 ) ) ( not ( = ?auto_268808 ?auto_268812 ) ) ( not ( = ?auto_268809 ?auto_268810 ) ) ( not ( = ?auto_268809 ?auto_268811 ) ) ( not ( = ?auto_268809 ?auto_268812 ) ) ( not ( = ?auto_268810 ?auto_268811 ) ) ( not ( = ?auto_268810 ?auto_268812 ) ) ( not ( = ?auto_268811 ?auto_268812 ) ) ( ON ?auto_268810 ?auto_268811 ) ( ON ?auto_268809 ?auto_268810 ) ( ON ?auto_268808 ?auto_268809 ) ( ON ?auto_268807 ?auto_268808 ) ( ON ?auto_268806 ?auto_268807 ) ( CLEAR ?auto_268804 ) ( ON ?auto_268805 ?auto_268806 ) ( CLEAR ?auto_268805 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_268804 ?auto_268805 )
      ( MAKE-8PILE ?auto_268804 ?auto_268805 ?auto_268806 ?auto_268807 ?auto_268808 ?auto_268809 ?auto_268810 ?auto_268811 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_268821 - BLOCK
      ?auto_268822 - BLOCK
      ?auto_268823 - BLOCK
      ?auto_268824 - BLOCK
      ?auto_268825 - BLOCK
      ?auto_268826 - BLOCK
      ?auto_268827 - BLOCK
      ?auto_268828 - BLOCK
    )
    :vars
    (
      ?auto_268829 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268828 ?auto_268829 ) ( ON-TABLE ?auto_268821 ) ( not ( = ?auto_268821 ?auto_268822 ) ) ( not ( = ?auto_268821 ?auto_268823 ) ) ( not ( = ?auto_268821 ?auto_268824 ) ) ( not ( = ?auto_268821 ?auto_268825 ) ) ( not ( = ?auto_268821 ?auto_268826 ) ) ( not ( = ?auto_268821 ?auto_268827 ) ) ( not ( = ?auto_268821 ?auto_268828 ) ) ( not ( = ?auto_268821 ?auto_268829 ) ) ( not ( = ?auto_268822 ?auto_268823 ) ) ( not ( = ?auto_268822 ?auto_268824 ) ) ( not ( = ?auto_268822 ?auto_268825 ) ) ( not ( = ?auto_268822 ?auto_268826 ) ) ( not ( = ?auto_268822 ?auto_268827 ) ) ( not ( = ?auto_268822 ?auto_268828 ) ) ( not ( = ?auto_268822 ?auto_268829 ) ) ( not ( = ?auto_268823 ?auto_268824 ) ) ( not ( = ?auto_268823 ?auto_268825 ) ) ( not ( = ?auto_268823 ?auto_268826 ) ) ( not ( = ?auto_268823 ?auto_268827 ) ) ( not ( = ?auto_268823 ?auto_268828 ) ) ( not ( = ?auto_268823 ?auto_268829 ) ) ( not ( = ?auto_268824 ?auto_268825 ) ) ( not ( = ?auto_268824 ?auto_268826 ) ) ( not ( = ?auto_268824 ?auto_268827 ) ) ( not ( = ?auto_268824 ?auto_268828 ) ) ( not ( = ?auto_268824 ?auto_268829 ) ) ( not ( = ?auto_268825 ?auto_268826 ) ) ( not ( = ?auto_268825 ?auto_268827 ) ) ( not ( = ?auto_268825 ?auto_268828 ) ) ( not ( = ?auto_268825 ?auto_268829 ) ) ( not ( = ?auto_268826 ?auto_268827 ) ) ( not ( = ?auto_268826 ?auto_268828 ) ) ( not ( = ?auto_268826 ?auto_268829 ) ) ( not ( = ?auto_268827 ?auto_268828 ) ) ( not ( = ?auto_268827 ?auto_268829 ) ) ( not ( = ?auto_268828 ?auto_268829 ) ) ( ON ?auto_268827 ?auto_268828 ) ( ON ?auto_268826 ?auto_268827 ) ( ON ?auto_268825 ?auto_268826 ) ( ON ?auto_268824 ?auto_268825 ) ( ON ?auto_268823 ?auto_268824 ) ( CLEAR ?auto_268821 ) ( ON ?auto_268822 ?auto_268823 ) ( CLEAR ?auto_268822 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_268821 ?auto_268822 )
      ( MAKE-8PILE ?auto_268821 ?auto_268822 ?auto_268823 ?auto_268824 ?auto_268825 ?auto_268826 ?auto_268827 ?auto_268828 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_268838 - BLOCK
      ?auto_268839 - BLOCK
      ?auto_268840 - BLOCK
      ?auto_268841 - BLOCK
      ?auto_268842 - BLOCK
      ?auto_268843 - BLOCK
      ?auto_268844 - BLOCK
      ?auto_268845 - BLOCK
    )
    :vars
    (
      ?auto_268846 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268845 ?auto_268846 ) ( not ( = ?auto_268838 ?auto_268839 ) ) ( not ( = ?auto_268838 ?auto_268840 ) ) ( not ( = ?auto_268838 ?auto_268841 ) ) ( not ( = ?auto_268838 ?auto_268842 ) ) ( not ( = ?auto_268838 ?auto_268843 ) ) ( not ( = ?auto_268838 ?auto_268844 ) ) ( not ( = ?auto_268838 ?auto_268845 ) ) ( not ( = ?auto_268838 ?auto_268846 ) ) ( not ( = ?auto_268839 ?auto_268840 ) ) ( not ( = ?auto_268839 ?auto_268841 ) ) ( not ( = ?auto_268839 ?auto_268842 ) ) ( not ( = ?auto_268839 ?auto_268843 ) ) ( not ( = ?auto_268839 ?auto_268844 ) ) ( not ( = ?auto_268839 ?auto_268845 ) ) ( not ( = ?auto_268839 ?auto_268846 ) ) ( not ( = ?auto_268840 ?auto_268841 ) ) ( not ( = ?auto_268840 ?auto_268842 ) ) ( not ( = ?auto_268840 ?auto_268843 ) ) ( not ( = ?auto_268840 ?auto_268844 ) ) ( not ( = ?auto_268840 ?auto_268845 ) ) ( not ( = ?auto_268840 ?auto_268846 ) ) ( not ( = ?auto_268841 ?auto_268842 ) ) ( not ( = ?auto_268841 ?auto_268843 ) ) ( not ( = ?auto_268841 ?auto_268844 ) ) ( not ( = ?auto_268841 ?auto_268845 ) ) ( not ( = ?auto_268841 ?auto_268846 ) ) ( not ( = ?auto_268842 ?auto_268843 ) ) ( not ( = ?auto_268842 ?auto_268844 ) ) ( not ( = ?auto_268842 ?auto_268845 ) ) ( not ( = ?auto_268842 ?auto_268846 ) ) ( not ( = ?auto_268843 ?auto_268844 ) ) ( not ( = ?auto_268843 ?auto_268845 ) ) ( not ( = ?auto_268843 ?auto_268846 ) ) ( not ( = ?auto_268844 ?auto_268845 ) ) ( not ( = ?auto_268844 ?auto_268846 ) ) ( not ( = ?auto_268845 ?auto_268846 ) ) ( ON ?auto_268844 ?auto_268845 ) ( ON ?auto_268843 ?auto_268844 ) ( ON ?auto_268842 ?auto_268843 ) ( ON ?auto_268841 ?auto_268842 ) ( ON ?auto_268840 ?auto_268841 ) ( ON ?auto_268839 ?auto_268840 ) ( ON ?auto_268838 ?auto_268839 ) ( CLEAR ?auto_268838 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_268838 )
      ( MAKE-8PILE ?auto_268838 ?auto_268839 ?auto_268840 ?auto_268841 ?auto_268842 ?auto_268843 ?auto_268844 ?auto_268845 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_268855 - BLOCK
      ?auto_268856 - BLOCK
      ?auto_268857 - BLOCK
      ?auto_268858 - BLOCK
      ?auto_268859 - BLOCK
      ?auto_268860 - BLOCK
      ?auto_268861 - BLOCK
      ?auto_268862 - BLOCK
    )
    :vars
    (
      ?auto_268863 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268862 ?auto_268863 ) ( not ( = ?auto_268855 ?auto_268856 ) ) ( not ( = ?auto_268855 ?auto_268857 ) ) ( not ( = ?auto_268855 ?auto_268858 ) ) ( not ( = ?auto_268855 ?auto_268859 ) ) ( not ( = ?auto_268855 ?auto_268860 ) ) ( not ( = ?auto_268855 ?auto_268861 ) ) ( not ( = ?auto_268855 ?auto_268862 ) ) ( not ( = ?auto_268855 ?auto_268863 ) ) ( not ( = ?auto_268856 ?auto_268857 ) ) ( not ( = ?auto_268856 ?auto_268858 ) ) ( not ( = ?auto_268856 ?auto_268859 ) ) ( not ( = ?auto_268856 ?auto_268860 ) ) ( not ( = ?auto_268856 ?auto_268861 ) ) ( not ( = ?auto_268856 ?auto_268862 ) ) ( not ( = ?auto_268856 ?auto_268863 ) ) ( not ( = ?auto_268857 ?auto_268858 ) ) ( not ( = ?auto_268857 ?auto_268859 ) ) ( not ( = ?auto_268857 ?auto_268860 ) ) ( not ( = ?auto_268857 ?auto_268861 ) ) ( not ( = ?auto_268857 ?auto_268862 ) ) ( not ( = ?auto_268857 ?auto_268863 ) ) ( not ( = ?auto_268858 ?auto_268859 ) ) ( not ( = ?auto_268858 ?auto_268860 ) ) ( not ( = ?auto_268858 ?auto_268861 ) ) ( not ( = ?auto_268858 ?auto_268862 ) ) ( not ( = ?auto_268858 ?auto_268863 ) ) ( not ( = ?auto_268859 ?auto_268860 ) ) ( not ( = ?auto_268859 ?auto_268861 ) ) ( not ( = ?auto_268859 ?auto_268862 ) ) ( not ( = ?auto_268859 ?auto_268863 ) ) ( not ( = ?auto_268860 ?auto_268861 ) ) ( not ( = ?auto_268860 ?auto_268862 ) ) ( not ( = ?auto_268860 ?auto_268863 ) ) ( not ( = ?auto_268861 ?auto_268862 ) ) ( not ( = ?auto_268861 ?auto_268863 ) ) ( not ( = ?auto_268862 ?auto_268863 ) ) ( ON ?auto_268861 ?auto_268862 ) ( ON ?auto_268860 ?auto_268861 ) ( ON ?auto_268859 ?auto_268860 ) ( ON ?auto_268858 ?auto_268859 ) ( ON ?auto_268857 ?auto_268858 ) ( ON ?auto_268856 ?auto_268857 ) ( ON ?auto_268855 ?auto_268856 ) ( CLEAR ?auto_268855 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_268855 )
      ( MAKE-8PILE ?auto_268855 ?auto_268856 ?auto_268857 ?auto_268858 ?auto_268859 ?auto_268860 ?auto_268861 ?auto_268862 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_268873 - BLOCK
      ?auto_268874 - BLOCK
      ?auto_268875 - BLOCK
      ?auto_268876 - BLOCK
      ?auto_268877 - BLOCK
      ?auto_268878 - BLOCK
      ?auto_268879 - BLOCK
      ?auto_268880 - BLOCK
      ?auto_268881 - BLOCK
    )
    :vars
    (
      ?auto_268882 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_268880 ) ( ON ?auto_268881 ?auto_268882 ) ( CLEAR ?auto_268881 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_268873 ) ( ON ?auto_268874 ?auto_268873 ) ( ON ?auto_268875 ?auto_268874 ) ( ON ?auto_268876 ?auto_268875 ) ( ON ?auto_268877 ?auto_268876 ) ( ON ?auto_268878 ?auto_268877 ) ( ON ?auto_268879 ?auto_268878 ) ( ON ?auto_268880 ?auto_268879 ) ( not ( = ?auto_268873 ?auto_268874 ) ) ( not ( = ?auto_268873 ?auto_268875 ) ) ( not ( = ?auto_268873 ?auto_268876 ) ) ( not ( = ?auto_268873 ?auto_268877 ) ) ( not ( = ?auto_268873 ?auto_268878 ) ) ( not ( = ?auto_268873 ?auto_268879 ) ) ( not ( = ?auto_268873 ?auto_268880 ) ) ( not ( = ?auto_268873 ?auto_268881 ) ) ( not ( = ?auto_268873 ?auto_268882 ) ) ( not ( = ?auto_268874 ?auto_268875 ) ) ( not ( = ?auto_268874 ?auto_268876 ) ) ( not ( = ?auto_268874 ?auto_268877 ) ) ( not ( = ?auto_268874 ?auto_268878 ) ) ( not ( = ?auto_268874 ?auto_268879 ) ) ( not ( = ?auto_268874 ?auto_268880 ) ) ( not ( = ?auto_268874 ?auto_268881 ) ) ( not ( = ?auto_268874 ?auto_268882 ) ) ( not ( = ?auto_268875 ?auto_268876 ) ) ( not ( = ?auto_268875 ?auto_268877 ) ) ( not ( = ?auto_268875 ?auto_268878 ) ) ( not ( = ?auto_268875 ?auto_268879 ) ) ( not ( = ?auto_268875 ?auto_268880 ) ) ( not ( = ?auto_268875 ?auto_268881 ) ) ( not ( = ?auto_268875 ?auto_268882 ) ) ( not ( = ?auto_268876 ?auto_268877 ) ) ( not ( = ?auto_268876 ?auto_268878 ) ) ( not ( = ?auto_268876 ?auto_268879 ) ) ( not ( = ?auto_268876 ?auto_268880 ) ) ( not ( = ?auto_268876 ?auto_268881 ) ) ( not ( = ?auto_268876 ?auto_268882 ) ) ( not ( = ?auto_268877 ?auto_268878 ) ) ( not ( = ?auto_268877 ?auto_268879 ) ) ( not ( = ?auto_268877 ?auto_268880 ) ) ( not ( = ?auto_268877 ?auto_268881 ) ) ( not ( = ?auto_268877 ?auto_268882 ) ) ( not ( = ?auto_268878 ?auto_268879 ) ) ( not ( = ?auto_268878 ?auto_268880 ) ) ( not ( = ?auto_268878 ?auto_268881 ) ) ( not ( = ?auto_268878 ?auto_268882 ) ) ( not ( = ?auto_268879 ?auto_268880 ) ) ( not ( = ?auto_268879 ?auto_268881 ) ) ( not ( = ?auto_268879 ?auto_268882 ) ) ( not ( = ?auto_268880 ?auto_268881 ) ) ( not ( = ?auto_268880 ?auto_268882 ) ) ( not ( = ?auto_268881 ?auto_268882 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_268881 ?auto_268882 )
      ( !STACK ?auto_268881 ?auto_268880 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_268892 - BLOCK
      ?auto_268893 - BLOCK
      ?auto_268894 - BLOCK
      ?auto_268895 - BLOCK
      ?auto_268896 - BLOCK
      ?auto_268897 - BLOCK
      ?auto_268898 - BLOCK
      ?auto_268899 - BLOCK
      ?auto_268900 - BLOCK
    )
    :vars
    (
      ?auto_268901 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_268899 ) ( ON ?auto_268900 ?auto_268901 ) ( CLEAR ?auto_268900 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_268892 ) ( ON ?auto_268893 ?auto_268892 ) ( ON ?auto_268894 ?auto_268893 ) ( ON ?auto_268895 ?auto_268894 ) ( ON ?auto_268896 ?auto_268895 ) ( ON ?auto_268897 ?auto_268896 ) ( ON ?auto_268898 ?auto_268897 ) ( ON ?auto_268899 ?auto_268898 ) ( not ( = ?auto_268892 ?auto_268893 ) ) ( not ( = ?auto_268892 ?auto_268894 ) ) ( not ( = ?auto_268892 ?auto_268895 ) ) ( not ( = ?auto_268892 ?auto_268896 ) ) ( not ( = ?auto_268892 ?auto_268897 ) ) ( not ( = ?auto_268892 ?auto_268898 ) ) ( not ( = ?auto_268892 ?auto_268899 ) ) ( not ( = ?auto_268892 ?auto_268900 ) ) ( not ( = ?auto_268892 ?auto_268901 ) ) ( not ( = ?auto_268893 ?auto_268894 ) ) ( not ( = ?auto_268893 ?auto_268895 ) ) ( not ( = ?auto_268893 ?auto_268896 ) ) ( not ( = ?auto_268893 ?auto_268897 ) ) ( not ( = ?auto_268893 ?auto_268898 ) ) ( not ( = ?auto_268893 ?auto_268899 ) ) ( not ( = ?auto_268893 ?auto_268900 ) ) ( not ( = ?auto_268893 ?auto_268901 ) ) ( not ( = ?auto_268894 ?auto_268895 ) ) ( not ( = ?auto_268894 ?auto_268896 ) ) ( not ( = ?auto_268894 ?auto_268897 ) ) ( not ( = ?auto_268894 ?auto_268898 ) ) ( not ( = ?auto_268894 ?auto_268899 ) ) ( not ( = ?auto_268894 ?auto_268900 ) ) ( not ( = ?auto_268894 ?auto_268901 ) ) ( not ( = ?auto_268895 ?auto_268896 ) ) ( not ( = ?auto_268895 ?auto_268897 ) ) ( not ( = ?auto_268895 ?auto_268898 ) ) ( not ( = ?auto_268895 ?auto_268899 ) ) ( not ( = ?auto_268895 ?auto_268900 ) ) ( not ( = ?auto_268895 ?auto_268901 ) ) ( not ( = ?auto_268896 ?auto_268897 ) ) ( not ( = ?auto_268896 ?auto_268898 ) ) ( not ( = ?auto_268896 ?auto_268899 ) ) ( not ( = ?auto_268896 ?auto_268900 ) ) ( not ( = ?auto_268896 ?auto_268901 ) ) ( not ( = ?auto_268897 ?auto_268898 ) ) ( not ( = ?auto_268897 ?auto_268899 ) ) ( not ( = ?auto_268897 ?auto_268900 ) ) ( not ( = ?auto_268897 ?auto_268901 ) ) ( not ( = ?auto_268898 ?auto_268899 ) ) ( not ( = ?auto_268898 ?auto_268900 ) ) ( not ( = ?auto_268898 ?auto_268901 ) ) ( not ( = ?auto_268899 ?auto_268900 ) ) ( not ( = ?auto_268899 ?auto_268901 ) ) ( not ( = ?auto_268900 ?auto_268901 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_268900 ?auto_268901 )
      ( !STACK ?auto_268900 ?auto_268899 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_268911 - BLOCK
      ?auto_268912 - BLOCK
      ?auto_268913 - BLOCK
      ?auto_268914 - BLOCK
      ?auto_268915 - BLOCK
      ?auto_268916 - BLOCK
      ?auto_268917 - BLOCK
      ?auto_268918 - BLOCK
      ?auto_268919 - BLOCK
    )
    :vars
    (
      ?auto_268920 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268919 ?auto_268920 ) ( ON-TABLE ?auto_268911 ) ( ON ?auto_268912 ?auto_268911 ) ( ON ?auto_268913 ?auto_268912 ) ( ON ?auto_268914 ?auto_268913 ) ( ON ?auto_268915 ?auto_268914 ) ( ON ?auto_268916 ?auto_268915 ) ( ON ?auto_268917 ?auto_268916 ) ( not ( = ?auto_268911 ?auto_268912 ) ) ( not ( = ?auto_268911 ?auto_268913 ) ) ( not ( = ?auto_268911 ?auto_268914 ) ) ( not ( = ?auto_268911 ?auto_268915 ) ) ( not ( = ?auto_268911 ?auto_268916 ) ) ( not ( = ?auto_268911 ?auto_268917 ) ) ( not ( = ?auto_268911 ?auto_268918 ) ) ( not ( = ?auto_268911 ?auto_268919 ) ) ( not ( = ?auto_268911 ?auto_268920 ) ) ( not ( = ?auto_268912 ?auto_268913 ) ) ( not ( = ?auto_268912 ?auto_268914 ) ) ( not ( = ?auto_268912 ?auto_268915 ) ) ( not ( = ?auto_268912 ?auto_268916 ) ) ( not ( = ?auto_268912 ?auto_268917 ) ) ( not ( = ?auto_268912 ?auto_268918 ) ) ( not ( = ?auto_268912 ?auto_268919 ) ) ( not ( = ?auto_268912 ?auto_268920 ) ) ( not ( = ?auto_268913 ?auto_268914 ) ) ( not ( = ?auto_268913 ?auto_268915 ) ) ( not ( = ?auto_268913 ?auto_268916 ) ) ( not ( = ?auto_268913 ?auto_268917 ) ) ( not ( = ?auto_268913 ?auto_268918 ) ) ( not ( = ?auto_268913 ?auto_268919 ) ) ( not ( = ?auto_268913 ?auto_268920 ) ) ( not ( = ?auto_268914 ?auto_268915 ) ) ( not ( = ?auto_268914 ?auto_268916 ) ) ( not ( = ?auto_268914 ?auto_268917 ) ) ( not ( = ?auto_268914 ?auto_268918 ) ) ( not ( = ?auto_268914 ?auto_268919 ) ) ( not ( = ?auto_268914 ?auto_268920 ) ) ( not ( = ?auto_268915 ?auto_268916 ) ) ( not ( = ?auto_268915 ?auto_268917 ) ) ( not ( = ?auto_268915 ?auto_268918 ) ) ( not ( = ?auto_268915 ?auto_268919 ) ) ( not ( = ?auto_268915 ?auto_268920 ) ) ( not ( = ?auto_268916 ?auto_268917 ) ) ( not ( = ?auto_268916 ?auto_268918 ) ) ( not ( = ?auto_268916 ?auto_268919 ) ) ( not ( = ?auto_268916 ?auto_268920 ) ) ( not ( = ?auto_268917 ?auto_268918 ) ) ( not ( = ?auto_268917 ?auto_268919 ) ) ( not ( = ?auto_268917 ?auto_268920 ) ) ( not ( = ?auto_268918 ?auto_268919 ) ) ( not ( = ?auto_268918 ?auto_268920 ) ) ( not ( = ?auto_268919 ?auto_268920 ) ) ( CLEAR ?auto_268917 ) ( ON ?auto_268918 ?auto_268919 ) ( CLEAR ?auto_268918 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_268911 ?auto_268912 ?auto_268913 ?auto_268914 ?auto_268915 ?auto_268916 ?auto_268917 ?auto_268918 )
      ( MAKE-9PILE ?auto_268911 ?auto_268912 ?auto_268913 ?auto_268914 ?auto_268915 ?auto_268916 ?auto_268917 ?auto_268918 ?auto_268919 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_268930 - BLOCK
      ?auto_268931 - BLOCK
      ?auto_268932 - BLOCK
      ?auto_268933 - BLOCK
      ?auto_268934 - BLOCK
      ?auto_268935 - BLOCK
      ?auto_268936 - BLOCK
      ?auto_268937 - BLOCK
      ?auto_268938 - BLOCK
    )
    :vars
    (
      ?auto_268939 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268938 ?auto_268939 ) ( ON-TABLE ?auto_268930 ) ( ON ?auto_268931 ?auto_268930 ) ( ON ?auto_268932 ?auto_268931 ) ( ON ?auto_268933 ?auto_268932 ) ( ON ?auto_268934 ?auto_268933 ) ( ON ?auto_268935 ?auto_268934 ) ( ON ?auto_268936 ?auto_268935 ) ( not ( = ?auto_268930 ?auto_268931 ) ) ( not ( = ?auto_268930 ?auto_268932 ) ) ( not ( = ?auto_268930 ?auto_268933 ) ) ( not ( = ?auto_268930 ?auto_268934 ) ) ( not ( = ?auto_268930 ?auto_268935 ) ) ( not ( = ?auto_268930 ?auto_268936 ) ) ( not ( = ?auto_268930 ?auto_268937 ) ) ( not ( = ?auto_268930 ?auto_268938 ) ) ( not ( = ?auto_268930 ?auto_268939 ) ) ( not ( = ?auto_268931 ?auto_268932 ) ) ( not ( = ?auto_268931 ?auto_268933 ) ) ( not ( = ?auto_268931 ?auto_268934 ) ) ( not ( = ?auto_268931 ?auto_268935 ) ) ( not ( = ?auto_268931 ?auto_268936 ) ) ( not ( = ?auto_268931 ?auto_268937 ) ) ( not ( = ?auto_268931 ?auto_268938 ) ) ( not ( = ?auto_268931 ?auto_268939 ) ) ( not ( = ?auto_268932 ?auto_268933 ) ) ( not ( = ?auto_268932 ?auto_268934 ) ) ( not ( = ?auto_268932 ?auto_268935 ) ) ( not ( = ?auto_268932 ?auto_268936 ) ) ( not ( = ?auto_268932 ?auto_268937 ) ) ( not ( = ?auto_268932 ?auto_268938 ) ) ( not ( = ?auto_268932 ?auto_268939 ) ) ( not ( = ?auto_268933 ?auto_268934 ) ) ( not ( = ?auto_268933 ?auto_268935 ) ) ( not ( = ?auto_268933 ?auto_268936 ) ) ( not ( = ?auto_268933 ?auto_268937 ) ) ( not ( = ?auto_268933 ?auto_268938 ) ) ( not ( = ?auto_268933 ?auto_268939 ) ) ( not ( = ?auto_268934 ?auto_268935 ) ) ( not ( = ?auto_268934 ?auto_268936 ) ) ( not ( = ?auto_268934 ?auto_268937 ) ) ( not ( = ?auto_268934 ?auto_268938 ) ) ( not ( = ?auto_268934 ?auto_268939 ) ) ( not ( = ?auto_268935 ?auto_268936 ) ) ( not ( = ?auto_268935 ?auto_268937 ) ) ( not ( = ?auto_268935 ?auto_268938 ) ) ( not ( = ?auto_268935 ?auto_268939 ) ) ( not ( = ?auto_268936 ?auto_268937 ) ) ( not ( = ?auto_268936 ?auto_268938 ) ) ( not ( = ?auto_268936 ?auto_268939 ) ) ( not ( = ?auto_268937 ?auto_268938 ) ) ( not ( = ?auto_268937 ?auto_268939 ) ) ( not ( = ?auto_268938 ?auto_268939 ) ) ( CLEAR ?auto_268936 ) ( ON ?auto_268937 ?auto_268938 ) ( CLEAR ?auto_268937 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_268930 ?auto_268931 ?auto_268932 ?auto_268933 ?auto_268934 ?auto_268935 ?auto_268936 ?auto_268937 )
      ( MAKE-9PILE ?auto_268930 ?auto_268931 ?auto_268932 ?auto_268933 ?auto_268934 ?auto_268935 ?auto_268936 ?auto_268937 ?auto_268938 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_268949 - BLOCK
      ?auto_268950 - BLOCK
      ?auto_268951 - BLOCK
      ?auto_268952 - BLOCK
      ?auto_268953 - BLOCK
      ?auto_268954 - BLOCK
      ?auto_268955 - BLOCK
      ?auto_268956 - BLOCK
      ?auto_268957 - BLOCK
    )
    :vars
    (
      ?auto_268958 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268957 ?auto_268958 ) ( ON-TABLE ?auto_268949 ) ( ON ?auto_268950 ?auto_268949 ) ( ON ?auto_268951 ?auto_268950 ) ( ON ?auto_268952 ?auto_268951 ) ( ON ?auto_268953 ?auto_268952 ) ( ON ?auto_268954 ?auto_268953 ) ( not ( = ?auto_268949 ?auto_268950 ) ) ( not ( = ?auto_268949 ?auto_268951 ) ) ( not ( = ?auto_268949 ?auto_268952 ) ) ( not ( = ?auto_268949 ?auto_268953 ) ) ( not ( = ?auto_268949 ?auto_268954 ) ) ( not ( = ?auto_268949 ?auto_268955 ) ) ( not ( = ?auto_268949 ?auto_268956 ) ) ( not ( = ?auto_268949 ?auto_268957 ) ) ( not ( = ?auto_268949 ?auto_268958 ) ) ( not ( = ?auto_268950 ?auto_268951 ) ) ( not ( = ?auto_268950 ?auto_268952 ) ) ( not ( = ?auto_268950 ?auto_268953 ) ) ( not ( = ?auto_268950 ?auto_268954 ) ) ( not ( = ?auto_268950 ?auto_268955 ) ) ( not ( = ?auto_268950 ?auto_268956 ) ) ( not ( = ?auto_268950 ?auto_268957 ) ) ( not ( = ?auto_268950 ?auto_268958 ) ) ( not ( = ?auto_268951 ?auto_268952 ) ) ( not ( = ?auto_268951 ?auto_268953 ) ) ( not ( = ?auto_268951 ?auto_268954 ) ) ( not ( = ?auto_268951 ?auto_268955 ) ) ( not ( = ?auto_268951 ?auto_268956 ) ) ( not ( = ?auto_268951 ?auto_268957 ) ) ( not ( = ?auto_268951 ?auto_268958 ) ) ( not ( = ?auto_268952 ?auto_268953 ) ) ( not ( = ?auto_268952 ?auto_268954 ) ) ( not ( = ?auto_268952 ?auto_268955 ) ) ( not ( = ?auto_268952 ?auto_268956 ) ) ( not ( = ?auto_268952 ?auto_268957 ) ) ( not ( = ?auto_268952 ?auto_268958 ) ) ( not ( = ?auto_268953 ?auto_268954 ) ) ( not ( = ?auto_268953 ?auto_268955 ) ) ( not ( = ?auto_268953 ?auto_268956 ) ) ( not ( = ?auto_268953 ?auto_268957 ) ) ( not ( = ?auto_268953 ?auto_268958 ) ) ( not ( = ?auto_268954 ?auto_268955 ) ) ( not ( = ?auto_268954 ?auto_268956 ) ) ( not ( = ?auto_268954 ?auto_268957 ) ) ( not ( = ?auto_268954 ?auto_268958 ) ) ( not ( = ?auto_268955 ?auto_268956 ) ) ( not ( = ?auto_268955 ?auto_268957 ) ) ( not ( = ?auto_268955 ?auto_268958 ) ) ( not ( = ?auto_268956 ?auto_268957 ) ) ( not ( = ?auto_268956 ?auto_268958 ) ) ( not ( = ?auto_268957 ?auto_268958 ) ) ( ON ?auto_268956 ?auto_268957 ) ( CLEAR ?auto_268954 ) ( ON ?auto_268955 ?auto_268956 ) ( CLEAR ?auto_268955 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_268949 ?auto_268950 ?auto_268951 ?auto_268952 ?auto_268953 ?auto_268954 ?auto_268955 )
      ( MAKE-9PILE ?auto_268949 ?auto_268950 ?auto_268951 ?auto_268952 ?auto_268953 ?auto_268954 ?auto_268955 ?auto_268956 ?auto_268957 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_268968 - BLOCK
      ?auto_268969 - BLOCK
      ?auto_268970 - BLOCK
      ?auto_268971 - BLOCK
      ?auto_268972 - BLOCK
      ?auto_268973 - BLOCK
      ?auto_268974 - BLOCK
      ?auto_268975 - BLOCK
      ?auto_268976 - BLOCK
    )
    :vars
    (
      ?auto_268977 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268976 ?auto_268977 ) ( ON-TABLE ?auto_268968 ) ( ON ?auto_268969 ?auto_268968 ) ( ON ?auto_268970 ?auto_268969 ) ( ON ?auto_268971 ?auto_268970 ) ( ON ?auto_268972 ?auto_268971 ) ( ON ?auto_268973 ?auto_268972 ) ( not ( = ?auto_268968 ?auto_268969 ) ) ( not ( = ?auto_268968 ?auto_268970 ) ) ( not ( = ?auto_268968 ?auto_268971 ) ) ( not ( = ?auto_268968 ?auto_268972 ) ) ( not ( = ?auto_268968 ?auto_268973 ) ) ( not ( = ?auto_268968 ?auto_268974 ) ) ( not ( = ?auto_268968 ?auto_268975 ) ) ( not ( = ?auto_268968 ?auto_268976 ) ) ( not ( = ?auto_268968 ?auto_268977 ) ) ( not ( = ?auto_268969 ?auto_268970 ) ) ( not ( = ?auto_268969 ?auto_268971 ) ) ( not ( = ?auto_268969 ?auto_268972 ) ) ( not ( = ?auto_268969 ?auto_268973 ) ) ( not ( = ?auto_268969 ?auto_268974 ) ) ( not ( = ?auto_268969 ?auto_268975 ) ) ( not ( = ?auto_268969 ?auto_268976 ) ) ( not ( = ?auto_268969 ?auto_268977 ) ) ( not ( = ?auto_268970 ?auto_268971 ) ) ( not ( = ?auto_268970 ?auto_268972 ) ) ( not ( = ?auto_268970 ?auto_268973 ) ) ( not ( = ?auto_268970 ?auto_268974 ) ) ( not ( = ?auto_268970 ?auto_268975 ) ) ( not ( = ?auto_268970 ?auto_268976 ) ) ( not ( = ?auto_268970 ?auto_268977 ) ) ( not ( = ?auto_268971 ?auto_268972 ) ) ( not ( = ?auto_268971 ?auto_268973 ) ) ( not ( = ?auto_268971 ?auto_268974 ) ) ( not ( = ?auto_268971 ?auto_268975 ) ) ( not ( = ?auto_268971 ?auto_268976 ) ) ( not ( = ?auto_268971 ?auto_268977 ) ) ( not ( = ?auto_268972 ?auto_268973 ) ) ( not ( = ?auto_268972 ?auto_268974 ) ) ( not ( = ?auto_268972 ?auto_268975 ) ) ( not ( = ?auto_268972 ?auto_268976 ) ) ( not ( = ?auto_268972 ?auto_268977 ) ) ( not ( = ?auto_268973 ?auto_268974 ) ) ( not ( = ?auto_268973 ?auto_268975 ) ) ( not ( = ?auto_268973 ?auto_268976 ) ) ( not ( = ?auto_268973 ?auto_268977 ) ) ( not ( = ?auto_268974 ?auto_268975 ) ) ( not ( = ?auto_268974 ?auto_268976 ) ) ( not ( = ?auto_268974 ?auto_268977 ) ) ( not ( = ?auto_268975 ?auto_268976 ) ) ( not ( = ?auto_268975 ?auto_268977 ) ) ( not ( = ?auto_268976 ?auto_268977 ) ) ( ON ?auto_268975 ?auto_268976 ) ( CLEAR ?auto_268973 ) ( ON ?auto_268974 ?auto_268975 ) ( CLEAR ?auto_268974 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_268968 ?auto_268969 ?auto_268970 ?auto_268971 ?auto_268972 ?auto_268973 ?auto_268974 )
      ( MAKE-9PILE ?auto_268968 ?auto_268969 ?auto_268970 ?auto_268971 ?auto_268972 ?auto_268973 ?auto_268974 ?auto_268975 ?auto_268976 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_268987 - BLOCK
      ?auto_268988 - BLOCK
      ?auto_268989 - BLOCK
      ?auto_268990 - BLOCK
      ?auto_268991 - BLOCK
      ?auto_268992 - BLOCK
      ?auto_268993 - BLOCK
      ?auto_268994 - BLOCK
      ?auto_268995 - BLOCK
    )
    :vars
    (
      ?auto_268996 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_268995 ?auto_268996 ) ( ON-TABLE ?auto_268987 ) ( ON ?auto_268988 ?auto_268987 ) ( ON ?auto_268989 ?auto_268988 ) ( ON ?auto_268990 ?auto_268989 ) ( ON ?auto_268991 ?auto_268990 ) ( not ( = ?auto_268987 ?auto_268988 ) ) ( not ( = ?auto_268987 ?auto_268989 ) ) ( not ( = ?auto_268987 ?auto_268990 ) ) ( not ( = ?auto_268987 ?auto_268991 ) ) ( not ( = ?auto_268987 ?auto_268992 ) ) ( not ( = ?auto_268987 ?auto_268993 ) ) ( not ( = ?auto_268987 ?auto_268994 ) ) ( not ( = ?auto_268987 ?auto_268995 ) ) ( not ( = ?auto_268987 ?auto_268996 ) ) ( not ( = ?auto_268988 ?auto_268989 ) ) ( not ( = ?auto_268988 ?auto_268990 ) ) ( not ( = ?auto_268988 ?auto_268991 ) ) ( not ( = ?auto_268988 ?auto_268992 ) ) ( not ( = ?auto_268988 ?auto_268993 ) ) ( not ( = ?auto_268988 ?auto_268994 ) ) ( not ( = ?auto_268988 ?auto_268995 ) ) ( not ( = ?auto_268988 ?auto_268996 ) ) ( not ( = ?auto_268989 ?auto_268990 ) ) ( not ( = ?auto_268989 ?auto_268991 ) ) ( not ( = ?auto_268989 ?auto_268992 ) ) ( not ( = ?auto_268989 ?auto_268993 ) ) ( not ( = ?auto_268989 ?auto_268994 ) ) ( not ( = ?auto_268989 ?auto_268995 ) ) ( not ( = ?auto_268989 ?auto_268996 ) ) ( not ( = ?auto_268990 ?auto_268991 ) ) ( not ( = ?auto_268990 ?auto_268992 ) ) ( not ( = ?auto_268990 ?auto_268993 ) ) ( not ( = ?auto_268990 ?auto_268994 ) ) ( not ( = ?auto_268990 ?auto_268995 ) ) ( not ( = ?auto_268990 ?auto_268996 ) ) ( not ( = ?auto_268991 ?auto_268992 ) ) ( not ( = ?auto_268991 ?auto_268993 ) ) ( not ( = ?auto_268991 ?auto_268994 ) ) ( not ( = ?auto_268991 ?auto_268995 ) ) ( not ( = ?auto_268991 ?auto_268996 ) ) ( not ( = ?auto_268992 ?auto_268993 ) ) ( not ( = ?auto_268992 ?auto_268994 ) ) ( not ( = ?auto_268992 ?auto_268995 ) ) ( not ( = ?auto_268992 ?auto_268996 ) ) ( not ( = ?auto_268993 ?auto_268994 ) ) ( not ( = ?auto_268993 ?auto_268995 ) ) ( not ( = ?auto_268993 ?auto_268996 ) ) ( not ( = ?auto_268994 ?auto_268995 ) ) ( not ( = ?auto_268994 ?auto_268996 ) ) ( not ( = ?auto_268995 ?auto_268996 ) ) ( ON ?auto_268994 ?auto_268995 ) ( ON ?auto_268993 ?auto_268994 ) ( CLEAR ?auto_268991 ) ( ON ?auto_268992 ?auto_268993 ) ( CLEAR ?auto_268992 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_268987 ?auto_268988 ?auto_268989 ?auto_268990 ?auto_268991 ?auto_268992 )
      ( MAKE-9PILE ?auto_268987 ?auto_268988 ?auto_268989 ?auto_268990 ?auto_268991 ?auto_268992 ?auto_268993 ?auto_268994 ?auto_268995 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_269006 - BLOCK
      ?auto_269007 - BLOCK
      ?auto_269008 - BLOCK
      ?auto_269009 - BLOCK
      ?auto_269010 - BLOCK
      ?auto_269011 - BLOCK
      ?auto_269012 - BLOCK
      ?auto_269013 - BLOCK
      ?auto_269014 - BLOCK
    )
    :vars
    (
      ?auto_269015 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_269014 ?auto_269015 ) ( ON-TABLE ?auto_269006 ) ( ON ?auto_269007 ?auto_269006 ) ( ON ?auto_269008 ?auto_269007 ) ( ON ?auto_269009 ?auto_269008 ) ( ON ?auto_269010 ?auto_269009 ) ( not ( = ?auto_269006 ?auto_269007 ) ) ( not ( = ?auto_269006 ?auto_269008 ) ) ( not ( = ?auto_269006 ?auto_269009 ) ) ( not ( = ?auto_269006 ?auto_269010 ) ) ( not ( = ?auto_269006 ?auto_269011 ) ) ( not ( = ?auto_269006 ?auto_269012 ) ) ( not ( = ?auto_269006 ?auto_269013 ) ) ( not ( = ?auto_269006 ?auto_269014 ) ) ( not ( = ?auto_269006 ?auto_269015 ) ) ( not ( = ?auto_269007 ?auto_269008 ) ) ( not ( = ?auto_269007 ?auto_269009 ) ) ( not ( = ?auto_269007 ?auto_269010 ) ) ( not ( = ?auto_269007 ?auto_269011 ) ) ( not ( = ?auto_269007 ?auto_269012 ) ) ( not ( = ?auto_269007 ?auto_269013 ) ) ( not ( = ?auto_269007 ?auto_269014 ) ) ( not ( = ?auto_269007 ?auto_269015 ) ) ( not ( = ?auto_269008 ?auto_269009 ) ) ( not ( = ?auto_269008 ?auto_269010 ) ) ( not ( = ?auto_269008 ?auto_269011 ) ) ( not ( = ?auto_269008 ?auto_269012 ) ) ( not ( = ?auto_269008 ?auto_269013 ) ) ( not ( = ?auto_269008 ?auto_269014 ) ) ( not ( = ?auto_269008 ?auto_269015 ) ) ( not ( = ?auto_269009 ?auto_269010 ) ) ( not ( = ?auto_269009 ?auto_269011 ) ) ( not ( = ?auto_269009 ?auto_269012 ) ) ( not ( = ?auto_269009 ?auto_269013 ) ) ( not ( = ?auto_269009 ?auto_269014 ) ) ( not ( = ?auto_269009 ?auto_269015 ) ) ( not ( = ?auto_269010 ?auto_269011 ) ) ( not ( = ?auto_269010 ?auto_269012 ) ) ( not ( = ?auto_269010 ?auto_269013 ) ) ( not ( = ?auto_269010 ?auto_269014 ) ) ( not ( = ?auto_269010 ?auto_269015 ) ) ( not ( = ?auto_269011 ?auto_269012 ) ) ( not ( = ?auto_269011 ?auto_269013 ) ) ( not ( = ?auto_269011 ?auto_269014 ) ) ( not ( = ?auto_269011 ?auto_269015 ) ) ( not ( = ?auto_269012 ?auto_269013 ) ) ( not ( = ?auto_269012 ?auto_269014 ) ) ( not ( = ?auto_269012 ?auto_269015 ) ) ( not ( = ?auto_269013 ?auto_269014 ) ) ( not ( = ?auto_269013 ?auto_269015 ) ) ( not ( = ?auto_269014 ?auto_269015 ) ) ( ON ?auto_269013 ?auto_269014 ) ( ON ?auto_269012 ?auto_269013 ) ( CLEAR ?auto_269010 ) ( ON ?auto_269011 ?auto_269012 ) ( CLEAR ?auto_269011 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_269006 ?auto_269007 ?auto_269008 ?auto_269009 ?auto_269010 ?auto_269011 )
      ( MAKE-9PILE ?auto_269006 ?auto_269007 ?auto_269008 ?auto_269009 ?auto_269010 ?auto_269011 ?auto_269012 ?auto_269013 ?auto_269014 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_269025 - BLOCK
      ?auto_269026 - BLOCK
      ?auto_269027 - BLOCK
      ?auto_269028 - BLOCK
      ?auto_269029 - BLOCK
      ?auto_269030 - BLOCK
      ?auto_269031 - BLOCK
      ?auto_269032 - BLOCK
      ?auto_269033 - BLOCK
    )
    :vars
    (
      ?auto_269034 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_269033 ?auto_269034 ) ( ON-TABLE ?auto_269025 ) ( ON ?auto_269026 ?auto_269025 ) ( ON ?auto_269027 ?auto_269026 ) ( ON ?auto_269028 ?auto_269027 ) ( not ( = ?auto_269025 ?auto_269026 ) ) ( not ( = ?auto_269025 ?auto_269027 ) ) ( not ( = ?auto_269025 ?auto_269028 ) ) ( not ( = ?auto_269025 ?auto_269029 ) ) ( not ( = ?auto_269025 ?auto_269030 ) ) ( not ( = ?auto_269025 ?auto_269031 ) ) ( not ( = ?auto_269025 ?auto_269032 ) ) ( not ( = ?auto_269025 ?auto_269033 ) ) ( not ( = ?auto_269025 ?auto_269034 ) ) ( not ( = ?auto_269026 ?auto_269027 ) ) ( not ( = ?auto_269026 ?auto_269028 ) ) ( not ( = ?auto_269026 ?auto_269029 ) ) ( not ( = ?auto_269026 ?auto_269030 ) ) ( not ( = ?auto_269026 ?auto_269031 ) ) ( not ( = ?auto_269026 ?auto_269032 ) ) ( not ( = ?auto_269026 ?auto_269033 ) ) ( not ( = ?auto_269026 ?auto_269034 ) ) ( not ( = ?auto_269027 ?auto_269028 ) ) ( not ( = ?auto_269027 ?auto_269029 ) ) ( not ( = ?auto_269027 ?auto_269030 ) ) ( not ( = ?auto_269027 ?auto_269031 ) ) ( not ( = ?auto_269027 ?auto_269032 ) ) ( not ( = ?auto_269027 ?auto_269033 ) ) ( not ( = ?auto_269027 ?auto_269034 ) ) ( not ( = ?auto_269028 ?auto_269029 ) ) ( not ( = ?auto_269028 ?auto_269030 ) ) ( not ( = ?auto_269028 ?auto_269031 ) ) ( not ( = ?auto_269028 ?auto_269032 ) ) ( not ( = ?auto_269028 ?auto_269033 ) ) ( not ( = ?auto_269028 ?auto_269034 ) ) ( not ( = ?auto_269029 ?auto_269030 ) ) ( not ( = ?auto_269029 ?auto_269031 ) ) ( not ( = ?auto_269029 ?auto_269032 ) ) ( not ( = ?auto_269029 ?auto_269033 ) ) ( not ( = ?auto_269029 ?auto_269034 ) ) ( not ( = ?auto_269030 ?auto_269031 ) ) ( not ( = ?auto_269030 ?auto_269032 ) ) ( not ( = ?auto_269030 ?auto_269033 ) ) ( not ( = ?auto_269030 ?auto_269034 ) ) ( not ( = ?auto_269031 ?auto_269032 ) ) ( not ( = ?auto_269031 ?auto_269033 ) ) ( not ( = ?auto_269031 ?auto_269034 ) ) ( not ( = ?auto_269032 ?auto_269033 ) ) ( not ( = ?auto_269032 ?auto_269034 ) ) ( not ( = ?auto_269033 ?auto_269034 ) ) ( ON ?auto_269032 ?auto_269033 ) ( ON ?auto_269031 ?auto_269032 ) ( ON ?auto_269030 ?auto_269031 ) ( CLEAR ?auto_269028 ) ( ON ?auto_269029 ?auto_269030 ) ( CLEAR ?auto_269029 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_269025 ?auto_269026 ?auto_269027 ?auto_269028 ?auto_269029 )
      ( MAKE-9PILE ?auto_269025 ?auto_269026 ?auto_269027 ?auto_269028 ?auto_269029 ?auto_269030 ?auto_269031 ?auto_269032 ?auto_269033 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_269044 - BLOCK
      ?auto_269045 - BLOCK
      ?auto_269046 - BLOCK
      ?auto_269047 - BLOCK
      ?auto_269048 - BLOCK
      ?auto_269049 - BLOCK
      ?auto_269050 - BLOCK
      ?auto_269051 - BLOCK
      ?auto_269052 - BLOCK
    )
    :vars
    (
      ?auto_269053 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_269052 ?auto_269053 ) ( ON-TABLE ?auto_269044 ) ( ON ?auto_269045 ?auto_269044 ) ( ON ?auto_269046 ?auto_269045 ) ( ON ?auto_269047 ?auto_269046 ) ( not ( = ?auto_269044 ?auto_269045 ) ) ( not ( = ?auto_269044 ?auto_269046 ) ) ( not ( = ?auto_269044 ?auto_269047 ) ) ( not ( = ?auto_269044 ?auto_269048 ) ) ( not ( = ?auto_269044 ?auto_269049 ) ) ( not ( = ?auto_269044 ?auto_269050 ) ) ( not ( = ?auto_269044 ?auto_269051 ) ) ( not ( = ?auto_269044 ?auto_269052 ) ) ( not ( = ?auto_269044 ?auto_269053 ) ) ( not ( = ?auto_269045 ?auto_269046 ) ) ( not ( = ?auto_269045 ?auto_269047 ) ) ( not ( = ?auto_269045 ?auto_269048 ) ) ( not ( = ?auto_269045 ?auto_269049 ) ) ( not ( = ?auto_269045 ?auto_269050 ) ) ( not ( = ?auto_269045 ?auto_269051 ) ) ( not ( = ?auto_269045 ?auto_269052 ) ) ( not ( = ?auto_269045 ?auto_269053 ) ) ( not ( = ?auto_269046 ?auto_269047 ) ) ( not ( = ?auto_269046 ?auto_269048 ) ) ( not ( = ?auto_269046 ?auto_269049 ) ) ( not ( = ?auto_269046 ?auto_269050 ) ) ( not ( = ?auto_269046 ?auto_269051 ) ) ( not ( = ?auto_269046 ?auto_269052 ) ) ( not ( = ?auto_269046 ?auto_269053 ) ) ( not ( = ?auto_269047 ?auto_269048 ) ) ( not ( = ?auto_269047 ?auto_269049 ) ) ( not ( = ?auto_269047 ?auto_269050 ) ) ( not ( = ?auto_269047 ?auto_269051 ) ) ( not ( = ?auto_269047 ?auto_269052 ) ) ( not ( = ?auto_269047 ?auto_269053 ) ) ( not ( = ?auto_269048 ?auto_269049 ) ) ( not ( = ?auto_269048 ?auto_269050 ) ) ( not ( = ?auto_269048 ?auto_269051 ) ) ( not ( = ?auto_269048 ?auto_269052 ) ) ( not ( = ?auto_269048 ?auto_269053 ) ) ( not ( = ?auto_269049 ?auto_269050 ) ) ( not ( = ?auto_269049 ?auto_269051 ) ) ( not ( = ?auto_269049 ?auto_269052 ) ) ( not ( = ?auto_269049 ?auto_269053 ) ) ( not ( = ?auto_269050 ?auto_269051 ) ) ( not ( = ?auto_269050 ?auto_269052 ) ) ( not ( = ?auto_269050 ?auto_269053 ) ) ( not ( = ?auto_269051 ?auto_269052 ) ) ( not ( = ?auto_269051 ?auto_269053 ) ) ( not ( = ?auto_269052 ?auto_269053 ) ) ( ON ?auto_269051 ?auto_269052 ) ( ON ?auto_269050 ?auto_269051 ) ( ON ?auto_269049 ?auto_269050 ) ( CLEAR ?auto_269047 ) ( ON ?auto_269048 ?auto_269049 ) ( CLEAR ?auto_269048 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_269044 ?auto_269045 ?auto_269046 ?auto_269047 ?auto_269048 )
      ( MAKE-9PILE ?auto_269044 ?auto_269045 ?auto_269046 ?auto_269047 ?auto_269048 ?auto_269049 ?auto_269050 ?auto_269051 ?auto_269052 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_269063 - BLOCK
      ?auto_269064 - BLOCK
      ?auto_269065 - BLOCK
      ?auto_269066 - BLOCK
      ?auto_269067 - BLOCK
      ?auto_269068 - BLOCK
      ?auto_269069 - BLOCK
      ?auto_269070 - BLOCK
      ?auto_269071 - BLOCK
    )
    :vars
    (
      ?auto_269072 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_269071 ?auto_269072 ) ( ON-TABLE ?auto_269063 ) ( ON ?auto_269064 ?auto_269063 ) ( ON ?auto_269065 ?auto_269064 ) ( not ( = ?auto_269063 ?auto_269064 ) ) ( not ( = ?auto_269063 ?auto_269065 ) ) ( not ( = ?auto_269063 ?auto_269066 ) ) ( not ( = ?auto_269063 ?auto_269067 ) ) ( not ( = ?auto_269063 ?auto_269068 ) ) ( not ( = ?auto_269063 ?auto_269069 ) ) ( not ( = ?auto_269063 ?auto_269070 ) ) ( not ( = ?auto_269063 ?auto_269071 ) ) ( not ( = ?auto_269063 ?auto_269072 ) ) ( not ( = ?auto_269064 ?auto_269065 ) ) ( not ( = ?auto_269064 ?auto_269066 ) ) ( not ( = ?auto_269064 ?auto_269067 ) ) ( not ( = ?auto_269064 ?auto_269068 ) ) ( not ( = ?auto_269064 ?auto_269069 ) ) ( not ( = ?auto_269064 ?auto_269070 ) ) ( not ( = ?auto_269064 ?auto_269071 ) ) ( not ( = ?auto_269064 ?auto_269072 ) ) ( not ( = ?auto_269065 ?auto_269066 ) ) ( not ( = ?auto_269065 ?auto_269067 ) ) ( not ( = ?auto_269065 ?auto_269068 ) ) ( not ( = ?auto_269065 ?auto_269069 ) ) ( not ( = ?auto_269065 ?auto_269070 ) ) ( not ( = ?auto_269065 ?auto_269071 ) ) ( not ( = ?auto_269065 ?auto_269072 ) ) ( not ( = ?auto_269066 ?auto_269067 ) ) ( not ( = ?auto_269066 ?auto_269068 ) ) ( not ( = ?auto_269066 ?auto_269069 ) ) ( not ( = ?auto_269066 ?auto_269070 ) ) ( not ( = ?auto_269066 ?auto_269071 ) ) ( not ( = ?auto_269066 ?auto_269072 ) ) ( not ( = ?auto_269067 ?auto_269068 ) ) ( not ( = ?auto_269067 ?auto_269069 ) ) ( not ( = ?auto_269067 ?auto_269070 ) ) ( not ( = ?auto_269067 ?auto_269071 ) ) ( not ( = ?auto_269067 ?auto_269072 ) ) ( not ( = ?auto_269068 ?auto_269069 ) ) ( not ( = ?auto_269068 ?auto_269070 ) ) ( not ( = ?auto_269068 ?auto_269071 ) ) ( not ( = ?auto_269068 ?auto_269072 ) ) ( not ( = ?auto_269069 ?auto_269070 ) ) ( not ( = ?auto_269069 ?auto_269071 ) ) ( not ( = ?auto_269069 ?auto_269072 ) ) ( not ( = ?auto_269070 ?auto_269071 ) ) ( not ( = ?auto_269070 ?auto_269072 ) ) ( not ( = ?auto_269071 ?auto_269072 ) ) ( ON ?auto_269070 ?auto_269071 ) ( ON ?auto_269069 ?auto_269070 ) ( ON ?auto_269068 ?auto_269069 ) ( ON ?auto_269067 ?auto_269068 ) ( CLEAR ?auto_269065 ) ( ON ?auto_269066 ?auto_269067 ) ( CLEAR ?auto_269066 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_269063 ?auto_269064 ?auto_269065 ?auto_269066 )
      ( MAKE-9PILE ?auto_269063 ?auto_269064 ?auto_269065 ?auto_269066 ?auto_269067 ?auto_269068 ?auto_269069 ?auto_269070 ?auto_269071 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_269082 - BLOCK
      ?auto_269083 - BLOCK
      ?auto_269084 - BLOCK
      ?auto_269085 - BLOCK
      ?auto_269086 - BLOCK
      ?auto_269087 - BLOCK
      ?auto_269088 - BLOCK
      ?auto_269089 - BLOCK
      ?auto_269090 - BLOCK
    )
    :vars
    (
      ?auto_269091 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_269090 ?auto_269091 ) ( ON-TABLE ?auto_269082 ) ( ON ?auto_269083 ?auto_269082 ) ( ON ?auto_269084 ?auto_269083 ) ( not ( = ?auto_269082 ?auto_269083 ) ) ( not ( = ?auto_269082 ?auto_269084 ) ) ( not ( = ?auto_269082 ?auto_269085 ) ) ( not ( = ?auto_269082 ?auto_269086 ) ) ( not ( = ?auto_269082 ?auto_269087 ) ) ( not ( = ?auto_269082 ?auto_269088 ) ) ( not ( = ?auto_269082 ?auto_269089 ) ) ( not ( = ?auto_269082 ?auto_269090 ) ) ( not ( = ?auto_269082 ?auto_269091 ) ) ( not ( = ?auto_269083 ?auto_269084 ) ) ( not ( = ?auto_269083 ?auto_269085 ) ) ( not ( = ?auto_269083 ?auto_269086 ) ) ( not ( = ?auto_269083 ?auto_269087 ) ) ( not ( = ?auto_269083 ?auto_269088 ) ) ( not ( = ?auto_269083 ?auto_269089 ) ) ( not ( = ?auto_269083 ?auto_269090 ) ) ( not ( = ?auto_269083 ?auto_269091 ) ) ( not ( = ?auto_269084 ?auto_269085 ) ) ( not ( = ?auto_269084 ?auto_269086 ) ) ( not ( = ?auto_269084 ?auto_269087 ) ) ( not ( = ?auto_269084 ?auto_269088 ) ) ( not ( = ?auto_269084 ?auto_269089 ) ) ( not ( = ?auto_269084 ?auto_269090 ) ) ( not ( = ?auto_269084 ?auto_269091 ) ) ( not ( = ?auto_269085 ?auto_269086 ) ) ( not ( = ?auto_269085 ?auto_269087 ) ) ( not ( = ?auto_269085 ?auto_269088 ) ) ( not ( = ?auto_269085 ?auto_269089 ) ) ( not ( = ?auto_269085 ?auto_269090 ) ) ( not ( = ?auto_269085 ?auto_269091 ) ) ( not ( = ?auto_269086 ?auto_269087 ) ) ( not ( = ?auto_269086 ?auto_269088 ) ) ( not ( = ?auto_269086 ?auto_269089 ) ) ( not ( = ?auto_269086 ?auto_269090 ) ) ( not ( = ?auto_269086 ?auto_269091 ) ) ( not ( = ?auto_269087 ?auto_269088 ) ) ( not ( = ?auto_269087 ?auto_269089 ) ) ( not ( = ?auto_269087 ?auto_269090 ) ) ( not ( = ?auto_269087 ?auto_269091 ) ) ( not ( = ?auto_269088 ?auto_269089 ) ) ( not ( = ?auto_269088 ?auto_269090 ) ) ( not ( = ?auto_269088 ?auto_269091 ) ) ( not ( = ?auto_269089 ?auto_269090 ) ) ( not ( = ?auto_269089 ?auto_269091 ) ) ( not ( = ?auto_269090 ?auto_269091 ) ) ( ON ?auto_269089 ?auto_269090 ) ( ON ?auto_269088 ?auto_269089 ) ( ON ?auto_269087 ?auto_269088 ) ( ON ?auto_269086 ?auto_269087 ) ( CLEAR ?auto_269084 ) ( ON ?auto_269085 ?auto_269086 ) ( CLEAR ?auto_269085 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_269082 ?auto_269083 ?auto_269084 ?auto_269085 )
      ( MAKE-9PILE ?auto_269082 ?auto_269083 ?auto_269084 ?auto_269085 ?auto_269086 ?auto_269087 ?auto_269088 ?auto_269089 ?auto_269090 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_269101 - BLOCK
      ?auto_269102 - BLOCK
      ?auto_269103 - BLOCK
      ?auto_269104 - BLOCK
      ?auto_269105 - BLOCK
      ?auto_269106 - BLOCK
      ?auto_269107 - BLOCK
      ?auto_269108 - BLOCK
      ?auto_269109 - BLOCK
    )
    :vars
    (
      ?auto_269110 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_269109 ?auto_269110 ) ( ON-TABLE ?auto_269101 ) ( ON ?auto_269102 ?auto_269101 ) ( not ( = ?auto_269101 ?auto_269102 ) ) ( not ( = ?auto_269101 ?auto_269103 ) ) ( not ( = ?auto_269101 ?auto_269104 ) ) ( not ( = ?auto_269101 ?auto_269105 ) ) ( not ( = ?auto_269101 ?auto_269106 ) ) ( not ( = ?auto_269101 ?auto_269107 ) ) ( not ( = ?auto_269101 ?auto_269108 ) ) ( not ( = ?auto_269101 ?auto_269109 ) ) ( not ( = ?auto_269101 ?auto_269110 ) ) ( not ( = ?auto_269102 ?auto_269103 ) ) ( not ( = ?auto_269102 ?auto_269104 ) ) ( not ( = ?auto_269102 ?auto_269105 ) ) ( not ( = ?auto_269102 ?auto_269106 ) ) ( not ( = ?auto_269102 ?auto_269107 ) ) ( not ( = ?auto_269102 ?auto_269108 ) ) ( not ( = ?auto_269102 ?auto_269109 ) ) ( not ( = ?auto_269102 ?auto_269110 ) ) ( not ( = ?auto_269103 ?auto_269104 ) ) ( not ( = ?auto_269103 ?auto_269105 ) ) ( not ( = ?auto_269103 ?auto_269106 ) ) ( not ( = ?auto_269103 ?auto_269107 ) ) ( not ( = ?auto_269103 ?auto_269108 ) ) ( not ( = ?auto_269103 ?auto_269109 ) ) ( not ( = ?auto_269103 ?auto_269110 ) ) ( not ( = ?auto_269104 ?auto_269105 ) ) ( not ( = ?auto_269104 ?auto_269106 ) ) ( not ( = ?auto_269104 ?auto_269107 ) ) ( not ( = ?auto_269104 ?auto_269108 ) ) ( not ( = ?auto_269104 ?auto_269109 ) ) ( not ( = ?auto_269104 ?auto_269110 ) ) ( not ( = ?auto_269105 ?auto_269106 ) ) ( not ( = ?auto_269105 ?auto_269107 ) ) ( not ( = ?auto_269105 ?auto_269108 ) ) ( not ( = ?auto_269105 ?auto_269109 ) ) ( not ( = ?auto_269105 ?auto_269110 ) ) ( not ( = ?auto_269106 ?auto_269107 ) ) ( not ( = ?auto_269106 ?auto_269108 ) ) ( not ( = ?auto_269106 ?auto_269109 ) ) ( not ( = ?auto_269106 ?auto_269110 ) ) ( not ( = ?auto_269107 ?auto_269108 ) ) ( not ( = ?auto_269107 ?auto_269109 ) ) ( not ( = ?auto_269107 ?auto_269110 ) ) ( not ( = ?auto_269108 ?auto_269109 ) ) ( not ( = ?auto_269108 ?auto_269110 ) ) ( not ( = ?auto_269109 ?auto_269110 ) ) ( ON ?auto_269108 ?auto_269109 ) ( ON ?auto_269107 ?auto_269108 ) ( ON ?auto_269106 ?auto_269107 ) ( ON ?auto_269105 ?auto_269106 ) ( ON ?auto_269104 ?auto_269105 ) ( CLEAR ?auto_269102 ) ( ON ?auto_269103 ?auto_269104 ) ( CLEAR ?auto_269103 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_269101 ?auto_269102 ?auto_269103 )
      ( MAKE-9PILE ?auto_269101 ?auto_269102 ?auto_269103 ?auto_269104 ?auto_269105 ?auto_269106 ?auto_269107 ?auto_269108 ?auto_269109 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_269120 - BLOCK
      ?auto_269121 - BLOCK
      ?auto_269122 - BLOCK
      ?auto_269123 - BLOCK
      ?auto_269124 - BLOCK
      ?auto_269125 - BLOCK
      ?auto_269126 - BLOCK
      ?auto_269127 - BLOCK
      ?auto_269128 - BLOCK
    )
    :vars
    (
      ?auto_269129 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_269128 ?auto_269129 ) ( ON-TABLE ?auto_269120 ) ( ON ?auto_269121 ?auto_269120 ) ( not ( = ?auto_269120 ?auto_269121 ) ) ( not ( = ?auto_269120 ?auto_269122 ) ) ( not ( = ?auto_269120 ?auto_269123 ) ) ( not ( = ?auto_269120 ?auto_269124 ) ) ( not ( = ?auto_269120 ?auto_269125 ) ) ( not ( = ?auto_269120 ?auto_269126 ) ) ( not ( = ?auto_269120 ?auto_269127 ) ) ( not ( = ?auto_269120 ?auto_269128 ) ) ( not ( = ?auto_269120 ?auto_269129 ) ) ( not ( = ?auto_269121 ?auto_269122 ) ) ( not ( = ?auto_269121 ?auto_269123 ) ) ( not ( = ?auto_269121 ?auto_269124 ) ) ( not ( = ?auto_269121 ?auto_269125 ) ) ( not ( = ?auto_269121 ?auto_269126 ) ) ( not ( = ?auto_269121 ?auto_269127 ) ) ( not ( = ?auto_269121 ?auto_269128 ) ) ( not ( = ?auto_269121 ?auto_269129 ) ) ( not ( = ?auto_269122 ?auto_269123 ) ) ( not ( = ?auto_269122 ?auto_269124 ) ) ( not ( = ?auto_269122 ?auto_269125 ) ) ( not ( = ?auto_269122 ?auto_269126 ) ) ( not ( = ?auto_269122 ?auto_269127 ) ) ( not ( = ?auto_269122 ?auto_269128 ) ) ( not ( = ?auto_269122 ?auto_269129 ) ) ( not ( = ?auto_269123 ?auto_269124 ) ) ( not ( = ?auto_269123 ?auto_269125 ) ) ( not ( = ?auto_269123 ?auto_269126 ) ) ( not ( = ?auto_269123 ?auto_269127 ) ) ( not ( = ?auto_269123 ?auto_269128 ) ) ( not ( = ?auto_269123 ?auto_269129 ) ) ( not ( = ?auto_269124 ?auto_269125 ) ) ( not ( = ?auto_269124 ?auto_269126 ) ) ( not ( = ?auto_269124 ?auto_269127 ) ) ( not ( = ?auto_269124 ?auto_269128 ) ) ( not ( = ?auto_269124 ?auto_269129 ) ) ( not ( = ?auto_269125 ?auto_269126 ) ) ( not ( = ?auto_269125 ?auto_269127 ) ) ( not ( = ?auto_269125 ?auto_269128 ) ) ( not ( = ?auto_269125 ?auto_269129 ) ) ( not ( = ?auto_269126 ?auto_269127 ) ) ( not ( = ?auto_269126 ?auto_269128 ) ) ( not ( = ?auto_269126 ?auto_269129 ) ) ( not ( = ?auto_269127 ?auto_269128 ) ) ( not ( = ?auto_269127 ?auto_269129 ) ) ( not ( = ?auto_269128 ?auto_269129 ) ) ( ON ?auto_269127 ?auto_269128 ) ( ON ?auto_269126 ?auto_269127 ) ( ON ?auto_269125 ?auto_269126 ) ( ON ?auto_269124 ?auto_269125 ) ( ON ?auto_269123 ?auto_269124 ) ( CLEAR ?auto_269121 ) ( ON ?auto_269122 ?auto_269123 ) ( CLEAR ?auto_269122 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_269120 ?auto_269121 ?auto_269122 )
      ( MAKE-9PILE ?auto_269120 ?auto_269121 ?auto_269122 ?auto_269123 ?auto_269124 ?auto_269125 ?auto_269126 ?auto_269127 ?auto_269128 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_269139 - BLOCK
      ?auto_269140 - BLOCK
      ?auto_269141 - BLOCK
      ?auto_269142 - BLOCK
      ?auto_269143 - BLOCK
      ?auto_269144 - BLOCK
      ?auto_269145 - BLOCK
      ?auto_269146 - BLOCK
      ?auto_269147 - BLOCK
    )
    :vars
    (
      ?auto_269148 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_269147 ?auto_269148 ) ( ON-TABLE ?auto_269139 ) ( not ( = ?auto_269139 ?auto_269140 ) ) ( not ( = ?auto_269139 ?auto_269141 ) ) ( not ( = ?auto_269139 ?auto_269142 ) ) ( not ( = ?auto_269139 ?auto_269143 ) ) ( not ( = ?auto_269139 ?auto_269144 ) ) ( not ( = ?auto_269139 ?auto_269145 ) ) ( not ( = ?auto_269139 ?auto_269146 ) ) ( not ( = ?auto_269139 ?auto_269147 ) ) ( not ( = ?auto_269139 ?auto_269148 ) ) ( not ( = ?auto_269140 ?auto_269141 ) ) ( not ( = ?auto_269140 ?auto_269142 ) ) ( not ( = ?auto_269140 ?auto_269143 ) ) ( not ( = ?auto_269140 ?auto_269144 ) ) ( not ( = ?auto_269140 ?auto_269145 ) ) ( not ( = ?auto_269140 ?auto_269146 ) ) ( not ( = ?auto_269140 ?auto_269147 ) ) ( not ( = ?auto_269140 ?auto_269148 ) ) ( not ( = ?auto_269141 ?auto_269142 ) ) ( not ( = ?auto_269141 ?auto_269143 ) ) ( not ( = ?auto_269141 ?auto_269144 ) ) ( not ( = ?auto_269141 ?auto_269145 ) ) ( not ( = ?auto_269141 ?auto_269146 ) ) ( not ( = ?auto_269141 ?auto_269147 ) ) ( not ( = ?auto_269141 ?auto_269148 ) ) ( not ( = ?auto_269142 ?auto_269143 ) ) ( not ( = ?auto_269142 ?auto_269144 ) ) ( not ( = ?auto_269142 ?auto_269145 ) ) ( not ( = ?auto_269142 ?auto_269146 ) ) ( not ( = ?auto_269142 ?auto_269147 ) ) ( not ( = ?auto_269142 ?auto_269148 ) ) ( not ( = ?auto_269143 ?auto_269144 ) ) ( not ( = ?auto_269143 ?auto_269145 ) ) ( not ( = ?auto_269143 ?auto_269146 ) ) ( not ( = ?auto_269143 ?auto_269147 ) ) ( not ( = ?auto_269143 ?auto_269148 ) ) ( not ( = ?auto_269144 ?auto_269145 ) ) ( not ( = ?auto_269144 ?auto_269146 ) ) ( not ( = ?auto_269144 ?auto_269147 ) ) ( not ( = ?auto_269144 ?auto_269148 ) ) ( not ( = ?auto_269145 ?auto_269146 ) ) ( not ( = ?auto_269145 ?auto_269147 ) ) ( not ( = ?auto_269145 ?auto_269148 ) ) ( not ( = ?auto_269146 ?auto_269147 ) ) ( not ( = ?auto_269146 ?auto_269148 ) ) ( not ( = ?auto_269147 ?auto_269148 ) ) ( ON ?auto_269146 ?auto_269147 ) ( ON ?auto_269145 ?auto_269146 ) ( ON ?auto_269144 ?auto_269145 ) ( ON ?auto_269143 ?auto_269144 ) ( ON ?auto_269142 ?auto_269143 ) ( ON ?auto_269141 ?auto_269142 ) ( CLEAR ?auto_269139 ) ( ON ?auto_269140 ?auto_269141 ) ( CLEAR ?auto_269140 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_269139 ?auto_269140 )
      ( MAKE-9PILE ?auto_269139 ?auto_269140 ?auto_269141 ?auto_269142 ?auto_269143 ?auto_269144 ?auto_269145 ?auto_269146 ?auto_269147 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_269158 - BLOCK
      ?auto_269159 - BLOCK
      ?auto_269160 - BLOCK
      ?auto_269161 - BLOCK
      ?auto_269162 - BLOCK
      ?auto_269163 - BLOCK
      ?auto_269164 - BLOCK
      ?auto_269165 - BLOCK
      ?auto_269166 - BLOCK
    )
    :vars
    (
      ?auto_269167 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_269166 ?auto_269167 ) ( ON-TABLE ?auto_269158 ) ( not ( = ?auto_269158 ?auto_269159 ) ) ( not ( = ?auto_269158 ?auto_269160 ) ) ( not ( = ?auto_269158 ?auto_269161 ) ) ( not ( = ?auto_269158 ?auto_269162 ) ) ( not ( = ?auto_269158 ?auto_269163 ) ) ( not ( = ?auto_269158 ?auto_269164 ) ) ( not ( = ?auto_269158 ?auto_269165 ) ) ( not ( = ?auto_269158 ?auto_269166 ) ) ( not ( = ?auto_269158 ?auto_269167 ) ) ( not ( = ?auto_269159 ?auto_269160 ) ) ( not ( = ?auto_269159 ?auto_269161 ) ) ( not ( = ?auto_269159 ?auto_269162 ) ) ( not ( = ?auto_269159 ?auto_269163 ) ) ( not ( = ?auto_269159 ?auto_269164 ) ) ( not ( = ?auto_269159 ?auto_269165 ) ) ( not ( = ?auto_269159 ?auto_269166 ) ) ( not ( = ?auto_269159 ?auto_269167 ) ) ( not ( = ?auto_269160 ?auto_269161 ) ) ( not ( = ?auto_269160 ?auto_269162 ) ) ( not ( = ?auto_269160 ?auto_269163 ) ) ( not ( = ?auto_269160 ?auto_269164 ) ) ( not ( = ?auto_269160 ?auto_269165 ) ) ( not ( = ?auto_269160 ?auto_269166 ) ) ( not ( = ?auto_269160 ?auto_269167 ) ) ( not ( = ?auto_269161 ?auto_269162 ) ) ( not ( = ?auto_269161 ?auto_269163 ) ) ( not ( = ?auto_269161 ?auto_269164 ) ) ( not ( = ?auto_269161 ?auto_269165 ) ) ( not ( = ?auto_269161 ?auto_269166 ) ) ( not ( = ?auto_269161 ?auto_269167 ) ) ( not ( = ?auto_269162 ?auto_269163 ) ) ( not ( = ?auto_269162 ?auto_269164 ) ) ( not ( = ?auto_269162 ?auto_269165 ) ) ( not ( = ?auto_269162 ?auto_269166 ) ) ( not ( = ?auto_269162 ?auto_269167 ) ) ( not ( = ?auto_269163 ?auto_269164 ) ) ( not ( = ?auto_269163 ?auto_269165 ) ) ( not ( = ?auto_269163 ?auto_269166 ) ) ( not ( = ?auto_269163 ?auto_269167 ) ) ( not ( = ?auto_269164 ?auto_269165 ) ) ( not ( = ?auto_269164 ?auto_269166 ) ) ( not ( = ?auto_269164 ?auto_269167 ) ) ( not ( = ?auto_269165 ?auto_269166 ) ) ( not ( = ?auto_269165 ?auto_269167 ) ) ( not ( = ?auto_269166 ?auto_269167 ) ) ( ON ?auto_269165 ?auto_269166 ) ( ON ?auto_269164 ?auto_269165 ) ( ON ?auto_269163 ?auto_269164 ) ( ON ?auto_269162 ?auto_269163 ) ( ON ?auto_269161 ?auto_269162 ) ( ON ?auto_269160 ?auto_269161 ) ( CLEAR ?auto_269158 ) ( ON ?auto_269159 ?auto_269160 ) ( CLEAR ?auto_269159 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_269158 ?auto_269159 )
      ( MAKE-9PILE ?auto_269158 ?auto_269159 ?auto_269160 ?auto_269161 ?auto_269162 ?auto_269163 ?auto_269164 ?auto_269165 ?auto_269166 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_269177 - BLOCK
      ?auto_269178 - BLOCK
      ?auto_269179 - BLOCK
      ?auto_269180 - BLOCK
      ?auto_269181 - BLOCK
      ?auto_269182 - BLOCK
      ?auto_269183 - BLOCK
      ?auto_269184 - BLOCK
      ?auto_269185 - BLOCK
    )
    :vars
    (
      ?auto_269186 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_269185 ?auto_269186 ) ( not ( = ?auto_269177 ?auto_269178 ) ) ( not ( = ?auto_269177 ?auto_269179 ) ) ( not ( = ?auto_269177 ?auto_269180 ) ) ( not ( = ?auto_269177 ?auto_269181 ) ) ( not ( = ?auto_269177 ?auto_269182 ) ) ( not ( = ?auto_269177 ?auto_269183 ) ) ( not ( = ?auto_269177 ?auto_269184 ) ) ( not ( = ?auto_269177 ?auto_269185 ) ) ( not ( = ?auto_269177 ?auto_269186 ) ) ( not ( = ?auto_269178 ?auto_269179 ) ) ( not ( = ?auto_269178 ?auto_269180 ) ) ( not ( = ?auto_269178 ?auto_269181 ) ) ( not ( = ?auto_269178 ?auto_269182 ) ) ( not ( = ?auto_269178 ?auto_269183 ) ) ( not ( = ?auto_269178 ?auto_269184 ) ) ( not ( = ?auto_269178 ?auto_269185 ) ) ( not ( = ?auto_269178 ?auto_269186 ) ) ( not ( = ?auto_269179 ?auto_269180 ) ) ( not ( = ?auto_269179 ?auto_269181 ) ) ( not ( = ?auto_269179 ?auto_269182 ) ) ( not ( = ?auto_269179 ?auto_269183 ) ) ( not ( = ?auto_269179 ?auto_269184 ) ) ( not ( = ?auto_269179 ?auto_269185 ) ) ( not ( = ?auto_269179 ?auto_269186 ) ) ( not ( = ?auto_269180 ?auto_269181 ) ) ( not ( = ?auto_269180 ?auto_269182 ) ) ( not ( = ?auto_269180 ?auto_269183 ) ) ( not ( = ?auto_269180 ?auto_269184 ) ) ( not ( = ?auto_269180 ?auto_269185 ) ) ( not ( = ?auto_269180 ?auto_269186 ) ) ( not ( = ?auto_269181 ?auto_269182 ) ) ( not ( = ?auto_269181 ?auto_269183 ) ) ( not ( = ?auto_269181 ?auto_269184 ) ) ( not ( = ?auto_269181 ?auto_269185 ) ) ( not ( = ?auto_269181 ?auto_269186 ) ) ( not ( = ?auto_269182 ?auto_269183 ) ) ( not ( = ?auto_269182 ?auto_269184 ) ) ( not ( = ?auto_269182 ?auto_269185 ) ) ( not ( = ?auto_269182 ?auto_269186 ) ) ( not ( = ?auto_269183 ?auto_269184 ) ) ( not ( = ?auto_269183 ?auto_269185 ) ) ( not ( = ?auto_269183 ?auto_269186 ) ) ( not ( = ?auto_269184 ?auto_269185 ) ) ( not ( = ?auto_269184 ?auto_269186 ) ) ( not ( = ?auto_269185 ?auto_269186 ) ) ( ON ?auto_269184 ?auto_269185 ) ( ON ?auto_269183 ?auto_269184 ) ( ON ?auto_269182 ?auto_269183 ) ( ON ?auto_269181 ?auto_269182 ) ( ON ?auto_269180 ?auto_269181 ) ( ON ?auto_269179 ?auto_269180 ) ( ON ?auto_269178 ?auto_269179 ) ( ON ?auto_269177 ?auto_269178 ) ( CLEAR ?auto_269177 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_269177 )
      ( MAKE-9PILE ?auto_269177 ?auto_269178 ?auto_269179 ?auto_269180 ?auto_269181 ?auto_269182 ?auto_269183 ?auto_269184 ?auto_269185 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_269196 - BLOCK
      ?auto_269197 - BLOCK
      ?auto_269198 - BLOCK
      ?auto_269199 - BLOCK
      ?auto_269200 - BLOCK
      ?auto_269201 - BLOCK
      ?auto_269202 - BLOCK
      ?auto_269203 - BLOCK
      ?auto_269204 - BLOCK
    )
    :vars
    (
      ?auto_269205 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_269204 ?auto_269205 ) ( not ( = ?auto_269196 ?auto_269197 ) ) ( not ( = ?auto_269196 ?auto_269198 ) ) ( not ( = ?auto_269196 ?auto_269199 ) ) ( not ( = ?auto_269196 ?auto_269200 ) ) ( not ( = ?auto_269196 ?auto_269201 ) ) ( not ( = ?auto_269196 ?auto_269202 ) ) ( not ( = ?auto_269196 ?auto_269203 ) ) ( not ( = ?auto_269196 ?auto_269204 ) ) ( not ( = ?auto_269196 ?auto_269205 ) ) ( not ( = ?auto_269197 ?auto_269198 ) ) ( not ( = ?auto_269197 ?auto_269199 ) ) ( not ( = ?auto_269197 ?auto_269200 ) ) ( not ( = ?auto_269197 ?auto_269201 ) ) ( not ( = ?auto_269197 ?auto_269202 ) ) ( not ( = ?auto_269197 ?auto_269203 ) ) ( not ( = ?auto_269197 ?auto_269204 ) ) ( not ( = ?auto_269197 ?auto_269205 ) ) ( not ( = ?auto_269198 ?auto_269199 ) ) ( not ( = ?auto_269198 ?auto_269200 ) ) ( not ( = ?auto_269198 ?auto_269201 ) ) ( not ( = ?auto_269198 ?auto_269202 ) ) ( not ( = ?auto_269198 ?auto_269203 ) ) ( not ( = ?auto_269198 ?auto_269204 ) ) ( not ( = ?auto_269198 ?auto_269205 ) ) ( not ( = ?auto_269199 ?auto_269200 ) ) ( not ( = ?auto_269199 ?auto_269201 ) ) ( not ( = ?auto_269199 ?auto_269202 ) ) ( not ( = ?auto_269199 ?auto_269203 ) ) ( not ( = ?auto_269199 ?auto_269204 ) ) ( not ( = ?auto_269199 ?auto_269205 ) ) ( not ( = ?auto_269200 ?auto_269201 ) ) ( not ( = ?auto_269200 ?auto_269202 ) ) ( not ( = ?auto_269200 ?auto_269203 ) ) ( not ( = ?auto_269200 ?auto_269204 ) ) ( not ( = ?auto_269200 ?auto_269205 ) ) ( not ( = ?auto_269201 ?auto_269202 ) ) ( not ( = ?auto_269201 ?auto_269203 ) ) ( not ( = ?auto_269201 ?auto_269204 ) ) ( not ( = ?auto_269201 ?auto_269205 ) ) ( not ( = ?auto_269202 ?auto_269203 ) ) ( not ( = ?auto_269202 ?auto_269204 ) ) ( not ( = ?auto_269202 ?auto_269205 ) ) ( not ( = ?auto_269203 ?auto_269204 ) ) ( not ( = ?auto_269203 ?auto_269205 ) ) ( not ( = ?auto_269204 ?auto_269205 ) ) ( ON ?auto_269203 ?auto_269204 ) ( ON ?auto_269202 ?auto_269203 ) ( ON ?auto_269201 ?auto_269202 ) ( ON ?auto_269200 ?auto_269201 ) ( ON ?auto_269199 ?auto_269200 ) ( ON ?auto_269198 ?auto_269199 ) ( ON ?auto_269197 ?auto_269198 ) ( ON ?auto_269196 ?auto_269197 ) ( CLEAR ?auto_269196 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_269196 )
      ( MAKE-9PILE ?auto_269196 ?auto_269197 ?auto_269198 ?auto_269199 ?auto_269200 ?auto_269201 ?auto_269202 ?auto_269203 ?auto_269204 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_269216 - BLOCK
      ?auto_269217 - BLOCK
      ?auto_269218 - BLOCK
      ?auto_269219 - BLOCK
      ?auto_269220 - BLOCK
      ?auto_269221 - BLOCK
      ?auto_269222 - BLOCK
      ?auto_269223 - BLOCK
      ?auto_269224 - BLOCK
      ?auto_269225 - BLOCK
    )
    :vars
    (
      ?auto_269226 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_269224 ) ( ON ?auto_269225 ?auto_269226 ) ( CLEAR ?auto_269225 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_269216 ) ( ON ?auto_269217 ?auto_269216 ) ( ON ?auto_269218 ?auto_269217 ) ( ON ?auto_269219 ?auto_269218 ) ( ON ?auto_269220 ?auto_269219 ) ( ON ?auto_269221 ?auto_269220 ) ( ON ?auto_269222 ?auto_269221 ) ( ON ?auto_269223 ?auto_269222 ) ( ON ?auto_269224 ?auto_269223 ) ( not ( = ?auto_269216 ?auto_269217 ) ) ( not ( = ?auto_269216 ?auto_269218 ) ) ( not ( = ?auto_269216 ?auto_269219 ) ) ( not ( = ?auto_269216 ?auto_269220 ) ) ( not ( = ?auto_269216 ?auto_269221 ) ) ( not ( = ?auto_269216 ?auto_269222 ) ) ( not ( = ?auto_269216 ?auto_269223 ) ) ( not ( = ?auto_269216 ?auto_269224 ) ) ( not ( = ?auto_269216 ?auto_269225 ) ) ( not ( = ?auto_269216 ?auto_269226 ) ) ( not ( = ?auto_269217 ?auto_269218 ) ) ( not ( = ?auto_269217 ?auto_269219 ) ) ( not ( = ?auto_269217 ?auto_269220 ) ) ( not ( = ?auto_269217 ?auto_269221 ) ) ( not ( = ?auto_269217 ?auto_269222 ) ) ( not ( = ?auto_269217 ?auto_269223 ) ) ( not ( = ?auto_269217 ?auto_269224 ) ) ( not ( = ?auto_269217 ?auto_269225 ) ) ( not ( = ?auto_269217 ?auto_269226 ) ) ( not ( = ?auto_269218 ?auto_269219 ) ) ( not ( = ?auto_269218 ?auto_269220 ) ) ( not ( = ?auto_269218 ?auto_269221 ) ) ( not ( = ?auto_269218 ?auto_269222 ) ) ( not ( = ?auto_269218 ?auto_269223 ) ) ( not ( = ?auto_269218 ?auto_269224 ) ) ( not ( = ?auto_269218 ?auto_269225 ) ) ( not ( = ?auto_269218 ?auto_269226 ) ) ( not ( = ?auto_269219 ?auto_269220 ) ) ( not ( = ?auto_269219 ?auto_269221 ) ) ( not ( = ?auto_269219 ?auto_269222 ) ) ( not ( = ?auto_269219 ?auto_269223 ) ) ( not ( = ?auto_269219 ?auto_269224 ) ) ( not ( = ?auto_269219 ?auto_269225 ) ) ( not ( = ?auto_269219 ?auto_269226 ) ) ( not ( = ?auto_269220 ?auto_269221 ) ) ( not ( = ?auto_269220 ?auto_269222 ) ) ( not ( = ?auto_269220 ?auto_269223 ) ) ( not ( = ?auto_269220 ?auto_269224 ) ) ( not ( = ?auto_269220 ?auto_269225 ) ) ( not ( = ?auto_269220 ?auto_269226 ) ) ( not ( = ?auto_269221 ?auto_269222 ) ) ( not ( = ?auto_269221 ?auto_269223 ) ) ( not ( = ?auto_269221 ?auto_269224 ) ) ( not ( = ?auto_269221 ?auto_269225 ) ) ( not ( = ?auto_269221 ?auto_269226 ) ) ( not ( = ?auto_269222 ?auto_269223 ) ) ( not ( = ?auto_269222 ?auto_269224 ) ) ( not ( = ?auto_269222 ?auto_269225 ) ) ( not ( = ?auto_269222 ?auto_269226 ) ) ( not ( = ?auto_269223 ?auto_269224 ) ) ( not ( = ?auto_269223 ?auto_269225 ) ) ( not ( = ?auto_269223 ?auto_269226 ) ) ( not ( = ?auto_269224 ?auto_269225 ) ) ( not ( = ?auto_269224 ?auto_269226 ) ) ( not ( = ?auto_269225 ?auto_269226 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_269225 ?auto_269226 )
      ( !STACK ?auto_269225 ?auto_269224 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_269237 - BLOCK
      ?auto_269238 - BLOCK
      ?auto_269239 - BLOCK
      ?auto_269240 - BLOCK
      ?auto_269241 - BLOCK
      ?auto_269242 - BLOCK
      ?auto_269243 - BLOCK
      ?auto_269244 - BLOCK
      ?auto_269245 - BLOCK
      ?auto_269246 - BLOCK
    )
    :vars
    (
      ?auto_269247 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_269245 ) ( ON ?auto_269246 ?auto_269247 ) ( CLEAR ?auto_269246 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_269237 ) ( ON ?auto_269238 ?auto_269237 ) ( ON ?auto_269239 ?auto_269238 ) ( ON ?auto_269240 ?auto_269239 ) ( ON ?auto_269241 ?auto_269240 ) ( ON ?auto_269242 ?auto_269241 ) ( ON ?auto_269243 ?auto_269242 ) ( ON ?auto_269244 ?auto_269243 ) ( ON ?auto_269245 ?auto_269244 ) ( not ( = ?auto_269237 ?auto_269238 ) ) ( not ( = ?auto_269237 ?auto_269239 ) ) ( not ( = ?auto_269237 ?auto_269240 ) ) ( not ( = ?auto_269237 ?auto_269241 ) ) ( not ( = ?auto_269237 ?auto_269242 ) ) ( not ( = ?auto_269237 ?auto_269243 ) ) ( not ( = ?auto_269237 ?auto_269244 ) ) ( not ( = ?auto_269237 ?auto_269245 ) ) ( not ( = ?auto_269237 ?auto_269246 ) ) ( not ( = ?auto_269237 ?auto_269247 ) ) ( not ( = ?auto_269238 ?auto_269239 ) ) ( not ( = ?auto_269238 ?auto_269240 ) ) ( not ( = ?auto_269238 ?auto_269241 ) ) ( not ( = ?auto_269238 ?auto_269242 ) ) ( not ( = ?auto_269238 ?auto_269243 ) ) ( not ( = ?auto_269238 ?auto_269244 ) ) ( not ( = ?auto_269238 ?auto_269245 ) ) ( not ( = ?auto_269238 ?auto_269246 ) ) ( not ( = ?auto_269238 ?auto_269247 ) ) ( not ( = ?auto_269239 ?auto_269240 ) ) ( not ( = ?auto_269239 ?auto_269241 ) ) ( not ( = ?auto_269239 ?auto_269242 ) ) ( not ( = ?auto_269239 ?auto_269243 ) ) ( not ( = ?auto_269239 ?auto_269244 ) ) ( not ( = ?auto_269239 ?auto_269245 ) ) ( not ( = ?auto_269239 ?auto_269246 ) ) ( not ( = ?auto_269239 ?auto_269247 ) ) ( not ( = ?auto_269240 ?auto_269241 ) ) ( not ( = ?auto_269240 ?auto_269242 ) ) ( not ( = ?auto_269240 ?auto_269243 ) ) ( not ( = ?auto_269240 ?auto_269244 ) ) ( not ( = ?auto_269240 ?auto_269245 ) ) ( not ( = ?auto_269240 ?auto_269246 ) ) ( not ( = ?auto_269240 ?auto_269247 ) ) ( not ( = ?auto_269241 ?auto_269242 ) ) ( not ( = ?auto_269241 ?auto_269243 ) ) ( not ( = ?auto_269241 ?auto_269244 ) ) ( not ( = ?auto_269241 ?auto_269245 ) ) ( not ( = ?auto_269241 ?auto_269246 ) ) ( not ( = ?auto_269241 ?auto_269247 ) ) ( not ( = ?auto_269242 ?auto_269243 ) ) ( not ( = ?auto_269242 ?auto_269244 ) ) ( not ( = ?auto_269242 ?auto_269245 ) ) ( not ( = ?auto_269242 ?auto_269246 ) ) ( not ( = ?auto_269242 ?auto_269247 ) ) ( not ( = ?auto_269243 ?auto_269244 ) ) ( not ( = ?auto_269243 ?auto_269245 ) ) ( not ( = ?auto_269243 ?auto_269246 ) ) ( not ( = ?auto_269243 ?auto_269247 ) ) ( not ( = ?auto_269244 ?auto_269245 ) ) ( not ( = ?auto_269244 ?auto_269246 ) ) ( not ( = ?auto_269244 ?auto_269247 ) ) ( not ( = ?auto_269245 ?auto_269246 ) ) ( not ( = ?auto_269245 ?auto_269247 ) ) ( not ( = ?auto_269246 ?auto_269247 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_269246 ?auto_269247 )
      ( !STACK ?auto_269246 ?auto_269245 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_269258 - BLOCK
      ?auto_269259 - BLOCK
      ?auto_269260 - BLOCK
      ?auto_269261 - BLOCK
      ?auto_269262 - BLOCK
      ?auto_269263 - BLOCK
      ?auto_269264 - BLOCK
      ?auto_269265 - BLOCK
      ?auto_269266 - BLOCK
      ?auto_269267 - BLOCK
    )
    :vars
    (
      ?auto_269268 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_269267 ?auto_269268 ) ( ON-TABLE ?auto_269258 ) ( ON ?auto_269259 ?auto_269258 ) ( ON ?auto_269260 ?auto_269259 ) ( ON ?auto_269261 ?auto_269260 ) ( ON ?auto_269262 ?auto_269261 ) ( ON ?auto_269263 ?auto_269262 ) ( ON ?auto_269264 ?auto_269263 ) ( ON ?auto_269265 ?auto_269264 ) ( not ( = ?auto_269258 ?auto_269259 ) ) ( not ( = ?auto_269258 ?auto_269260 ) ) ( not ( = ?auto_269258 ?auto_269261 ) ) ( not ( = ?auto_269258 ?auto_269262 ) ) ( not ( = ?auto_269258 ?auto_269263 ) ) ( not ( = ?auto_269258 ?auto_269264 ) ) ( not ( = ?auto_269258 ?auto_269265 ) ) ( not ( = ?auto_269258 ?auto_269266 ) ) ( not ( = ?auto_269258 ?auto_269267 ) ) ( not ( = ?auto_269258 ?auto_269268 ) ) ( not ( = ?auto_269259 ?auto_269260 ) ) ( not ( = ?auto_269259 ?auto_269261 ) ) ( not ( = ?auto_269259 ?auto_269262 ) ) ( not ( = ?auto_269259 ?auto_269263 ) ) ( not ( = ?auto_269259 ?auto_269264 ) ) ( not ( = ?auto_269259 ?auto_269265 ) ) ( not ( = ?auto_269259 ?auto_269266 ) ) ( not ( = ?auto_269259 ?auto_269267 ) ) ( not ( = ?auto_269259 ?auto_269268 ) ) ( not ( = ?auto_269260 ?auto_269261 ) ) ( not ( = ?auto_269260 ?auto_269262 ) ) ( not ( = ?auto_269260 ?auto_269263 ) ) ( not ( = ?auto_269260 ?auto_269264 ) ) ( not ( = ?auto_269260 ?auto_269265 ) ) ( not ( = ?auto_269260 ?auto_269266 ) ) ( not ( = ?auto_269260 ?auto_269267 ) ) ( not ( = ?auto_269260 ?auto_269268 ) ) ( not ( = ?auto_269261 ?auto_269262 ) ) ( not ( = ?auto_269261 ?auto_269263 ) ) ( not ( = ?auto_269261 ?auto_269264 ) ) ( not ( = ?auto_269261 ?auto_269265 ) ) ( not ( = ?auto_269261 ?auto_269266 ) ) ( not ( = ?auto_269261 ?auto_269267 ) ) ( not ( = ?auto_269261 ?auto_269268 ) ) ( not ( = ?auto_269262 ?auto_269263 ) ) ( not ( = ?auto_269262 ?auto_269264 ) ) ( not ( = ?auto_269262 ?auto_269265 ) ) ( not ( = ?auto_269262 ?auto_269266 ) ) ( not ( = ?auto_269262 ?auto_269267 ) ) ( not ( = ?auto_269262 ?auto_269268 ) ) ( not ( = ?auto_269263 ?auto_269264 ) ) ( not ( = ?auto_269263 ?auto_269265 ) ) ( not ( = ?auto_269263 ?auto_269266 ) ) ( not ( = ?auto_269263 ?auto_269267 ) ) ( not ( = ?auto_269263 ?auto_269268 ) ) ( not ( = ?auto_269264 ?auto_269265 ) ) ( not ( = ?auto_269264 ?auto_269266 ) ) ( not ( = ?auto_269264 ?auto_269267 ) ) ( not ( = ?auto_269264 ?auto_269268 ) ) ( not ( = ?auto_269265 ?auto_269266 ) ) ( not ( = ?auto_269265 ?auto_269267 ) ) ( not ( = ?auto_269265 ?auto_269268 ) ) ( not ( = ?auto_269266 ?auto_269267 ) ) ( not ( = ?auto_269266 ?auto_269268 ) ) ( not ( = ?auto_269267 ?auto_269268 ) ) ( CLEAR ?auto_269265 ) ( ON ?auto_269266 ?auto_269267 ) ( CLEAR ?auto_269266 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_269258 ?auto_269259 ?auto_269260 ?auto_269261 ?auto_269262 ?auto_269263 ?auto_269264 ?auto_269265 ?auto_269266 )
      ( MAKE-10PILE ?auto_269258 ?auto_269259 ?auto_269260 ?auto_269261 ?auto_269262 ?auto_269263 ?auto_269264 ?auto_269265 ?auto_269266 ?auto_269267 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_269279 - BLOCK
      ?auto_269280 - BLOCK
      ?auto_269281 - BLOCK
      ?auto_269282 - BLOCK
      ?auto_269283 - BLOCK
      ?auto_269284 - BLOCK
      ?auto_269285 - BLOCK
      ?auto_269286 - BLOCK
      ?auto_269287 - BLOCK
      ?auto_269288 - BLOCK
    )
    :vars
    (
      ?auto_269289 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_269288 ?auto_269289 ) ( ON-TABLE ?auto_269279 ) ( ON ?auto_269280 ?auto_269279 ) ( ON ?auto_269281 ?auto_269280 ) ( ON ?auto_269282 ?auto_269281 ) ( ON ?auto_269283 ?auto_269282 ) ( ON ?auto_269284 ?auto_269283 ) ( ON ?auto_269285 ?auto_269284 ) ( ON ?auto_269286 ?auto_269285 ) ( not ( = ?auto_269279 ?auto_269280 ) ) ( not ( = ?auto_269279 ?auto_269281 ) ) ( not ( = ?auto_269279 ?auto_269282 ) ) ( not ( = ?auto_269279 ?auto_269283 ) ) ( not ( = ?auto_269279 ?auto_269284 ) ) ( not ( = ?auto_269279 ?auto_269285 ) ) ( not ( = ?auto_269279 ?auto_269286 ) ) ( not ( = ?auto_269279 ?auto_269287 ) ) ( not ( = ?auto_269279 ?auto_269288 ) ) ( not ( = ?auto_269279 ?auto_269289 ) ) ( not ( = ?auto_269280 ?auto_269281 ) ) ( not ( = ?auto_269280 ?auto_269282 ) ) ( not ( = ?auto_269280 ?auto_269283 ) ) ( not ( = ?auto_269280 ?auto_269284 ) ) ( not ( = ?auto_269280 ?auto_269285 ) ) ( not ( = ?auto_269280 ?auto_269286 ) ) ( not ( = ?auto_269280 ?auto_269287 ) ) ( not ( = ?auto_269280 ?auto_269288 ) ) ( not ( = ?auto_269280 ?auto_269289 ) ) ( not ( = ?auto_269281 ?auto_269282 ) ) ( not ( = ?auto_269281 ?auto_269283 ) ) ( not ( = ?auto_269281 ?auto_269284 ) ) ( not ( = ?auto_269281 ?auto_269285 ) ) ( not ( = ?auto_269281 ?auto_269286 ) ) ( not ( = ?auto_269281 ?auto_269287 ) ) ( not ( = ?auto_269281 ?auto_269288 ) ) ( not ( = ?auto_269281 ?auto_269289 ) ) ( not ( = ?auto_269282 ?auto_269283 ) ) ( not ( = ?auto_269282 ?auto_269284 ) ) ( not ( = ?auto_269282 ?auto_269285 ) ) ( not ( = ?auto_269282 ?auto_269286 ) ) ( not ( = ?auto_269282 ?auto_269287 ) ) ( not ( = ?auto_269282 ?auto_269288 ) ) ( not ( = ?auto_269282 ?auto_269289 ) ) ( not ( = ?auto_269283 ?auto_269284 ) ) ( not ( = ?auto_269283 ?auto_269285 ) ) ( not ( = ?auto_269283 ?auto_269286 ) ) ( not ( = ?auto_269283 ?auto_269287 ) ) ( not ( = ?auto_269283 ?auto_269288 ) ) ( not ( = ?auto_269283 ?auto_269289 ) ) ( not ( = ?auto_269284 ?auto_269285 ) ) ( not ( = ?auto_269284 ?auto_269286 ) ) ( not ( = ?auto_269284 ?auto_269287 ) ) ( not ( = ?auto_269284 ?auto_269288 ) ) ( not ( = ?auto_269284 ?auto_269289 ) ) ( not ( = ?auto_269285 ?auto_269286 ) ) ( not ( = ?auto_269285 ?auto_269287 ) ) ( not ( = ?auto_269285 ?auto_269288 ) ) ( not ( = ?auto_269285 ?auto_269289 ) ) ( not ( = ?auto_269286 ?auto_269287 ) ) ( not ( = ?auto_269286 ?auto_269288 ) ) ( not ( = ?auto_269286 ?auto_269289 ) ) ( not ( = ?auto_269287 ?auto_269288 ) ) ( not ( = ?auto_269287 ?auto_269289 ) ) ( not ( = ?auto_269288 ?auto_269289 ) ) ( CLEAR ?auto_269286 ) ( ON ?auto_269287 ?auto_269288 ) ( CLEAR ?auto_269287 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_269279 ?auto_269280 ?auto_269281 ?auto_269282 ?auto_269283 ?auto_269284 ?auto_269285 ?auto_269286 ?auto_269287 )
      ( MAKE-10PILE ?auto_269279 ?auto_269280 ?auto_269281 ?auto_269282 ?auto_269283 ?auto_269284 ?auto_269285 ?auto_269286 ?auto_269287 ?auto_269288 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_269300 - BLOCK
      ?auto_269301 - BLOCK
      ?auto_269302 - BLOCK
      ?auto_269303 - BLOCK
      ?auto_269304 - BLOCK
      ?auto_269305 - BLOCK
      ?auto_269306 - BLOCK
      ?auto_269307 - BLOCK
      ?auto_269308 - BLOCK
      ?auto_269309 - BLOCK
    )
    :vars
    (
      ?auto_269310 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_269309 ?auto_269310 ) ( ON-TABLE ?auto_269300 ) ( ON ?auto_269301 ?auto_269300 ) ( ON ?auto_269302 ?auto_269301 ) ( ON ?auto_269303 ?auto_269302 ) ( ON ?auto_269304 ?auto_269303 ) ( ON ?auto_269305 ?auto_269304 ) ( ON ?auto_269306 ?auto_269305 ) ( not ( = ?auto_269300 ?auto_269301 ) ) ( not ( = ?auto_269300 ?auto_269302 ) ) ( not ( = ?auto_269300 ?auto_269303 ) ) ( not ( = ?auto_269300 ?auto_269304 ) ) ( not ( = ?auto_269300 ?auto_269305 ) ) ( not ( = ?auto_269300 ?auto_269306 ) ) ( not ( = ?auto_269300 ?auto_269307 ) ) ( not ( = ?auto_269300 ?auto_269308 ) ) ( not ( = ?auto_269300 ?auto_269309 ) ) ( not ( = ?auto_269300 ?auto_269310 ) ) ( not ( = ?auto_269301 ?auto_269302 ) ) ( not ( = ?auto_269301 ?auto_269303 ) ) ( not ( = ?auto_269301 ?auto_269304 ) ) ( not ( = ?auto_269301 ?auto_269305 ) ) ( not ( = ?auto_269301 ?auto_269306 ) ) ( not ( = ?auto_269301 ?auto_269307 ) ) ( not ( = ?auto_269301 ?auto_269308 ) ) ( not ( = ?auto_269301 ?auto_269309 ) ) ( not ( = ?auto_269301 ?auto_269310 ) ) ( not ( = ?auto_269302 ?auto_269303 ) ) ( not ( = ?auto_269302 ?auto_269304 ) ) ( not ( = ?auto_269302 ?auto_269305 ) ) ( not ( = ?auto_269302 ?auto_269306 ) ) ( not ( = ?auto_269302 ?auto_269307 ) ) ( not ( = ?auto_269302 ?auto_269308 ) ) ( not ( = ?auto_269302 ?auto_269309 ) ) ( not ( = ?auto_269302 ?auto_269310 ) ) ( not ( = ?auto_269303 ?auto_269304 ) ) ( not ( = ?auto_269303 ?auto_269305 ) ) ( not ( = ?auto_269303 ?auto_269306 ) ) ( not ( = ?auto_269303 ?auto_269307 ) ) ( not ( = ?auto_269303 ?auto_269308 ) ) ( not ( = ?auto_269303 ?auto_269309 ) ) ( not ( = ?auto_269303 ?auto_269310 ) ) ( not ( = ?auto_269304 ?auto_269305 ) ) ( not ( = ?auto_269304 ?auto_269306 ) ) ( not ( = ?auto_269304 ?auto_269307 ) ) ( not ( = ?auto_269304 ?auto_269308 ) ) ( not ( = ?auto_269304 ?auto_269309 ) ) ( not ( = ?auto_269304 ?auto_269310 ) ) ( not ( = ?auto_269305 ?auto_269306 ) ) ( not ( = ?auto_269305 ?auto_269307 ) ) ( not ( = ?auto_269305 ?auto_269308 ) ) ( not ( = ?auto_269305 ?auto_269309 ) ) ( not ( = ?auto_269305 ?auto_269310 ) ) ( not ( = ?auto_269306 ?auto_269307 ) ) ( not ( = ?auto_269306 ?auto_269308 ) ) ( not ( = ?auto_269306 ?auto_269309 ) ) ( not ( = ?auto_269306 ?auto_269310 ) ) ( not ( = ?auto_269307 ?auto_269308 ) ) ( not ( = ?auto_269307 ?auto_269309 ) ) ( not ( = ?auto_269307 ?auto_269310 ) ) ( not ( = ?auto_269308 ?auto_269309 ) ) ( not ( = ?auto_269308 ?auto_269310 ) ) ( not ( = ?auto_269309 ?auto_269310 ) ) ( ON ?auto_269308 ?auto_269309 ) ( CLEAR ?auto_269306 ) ( ON ?auto_269307 ?auto_269308 ) ( CLEAR ?auto_269307 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_269300 ?auto_269301 ?auto_269302 ?auto_269303 ?auto_269304 ?auto_269305 ?auto_269306 ?auto_269307 )
      ( MAKE-10PILE ?auto_269300 ?auto_269301 ?auto_269302 ?auto_269303 ?auto_269304 ?auto_269305 ?auto_269306 ?auto_269307 ?auto_269308 ?auto_269309 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_269321 - BLOCK
      ?auto_269322 - BLOCK
      ?auto_269323 - BLOCK
      ?auto_269324 - BLOCK
      ?auto_269325 - BLOCK
      ?auto_269326 - BLOCK
      ?auto_269327 - BLOCK
      ?auto_269328 - BLOCK
      ?auto_269329 - BLOCK
      ?auto_269330 - BLOCK
    )
    :vars
    (
      ?auto_269331 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_269330 ?auto_269331 ) ( ON-TABLE ?auto_269321 ) ( ON ?auto_269322 ?auto_269321 ) ( ON ?auto_269323 ?auto_269322 ) ( ON ?auto_269324 ?auto_269323 ) ( ON ?auto_269325 ?auto_269324 ) ( ON ?auto_269326 ?auto_269325 ) ( ON ?auto_269327 ?auto_269326 ) ( not ( = ?auto_269321 ?auto_269322 ) ) ( not ( = ?auto_269321 ?auto_269323 ) ) ( not ( = ?auto_269321 ?auto_269324 ) ) ( not ( = ?auto_269321 ?auto_269325 ) ) ( not ( = ?auto_269321 ?auto_269326 ) ) ( not ( = ?auto_269321 ?auto_269327 ) ) ( not ( = ?auto_269321 ?auto_269328 ) ) ( not ( = ?auto_269321 ?auto_269329 ) ) ( not ( = ?auto_269321 ?auto_269330 ) ) ( not ( = ?auto_269321 ?auto_269331 ) ) ( not ( = ?auto_269322 ?auto_269323 ) ) ( not ( = ?auto_269322 ?auto_269324 ) ) ( not ( = ?auto_269322 ?auto_269325 ) ) ( not ( = ?auto_269322 ?auto_269326 ) ) ( not ( = ?auto_269322 ?auto_269327 ) ) ( not ( = ?auto_269322 ?auto_269328 ) ) ( not ( = ?auto_269322 ?auto_269329 ) ) ( not ( = ?auto_269322 ?auto_269330 ) ) ( not ( = ?auto_269322 ?auto_269331 ) ) ( not ( = ?auto_269323 ?auto_269324 ) ) ( not ( = ?auto_269323 ?auto_269325 ) ) ( not ( = ?auto_269323 ?auto_269326 ) ) ( not ( = ?auto_269323 ?auto_269327 ) ) ( not ( = ?auto_269323 ?auto_269328 ) ) ( not ( = ?auto_269323 ?auto_269329 ) ) ( not ( = ?auto_269323 ?auto_269330 ) ) ( not ( = ?auto_269323 ?auto_269331 ) ) ( not ( = ?auto_269324 ?auto_269325 ) ) ( not ( = ?auto_269324 ?auto_269326 ) ) ( not ( = ?auto_269324 ?auto_269327 ) ) ( not ( = ?auto_269324 ?auto_269328 ) ) ( not ( = ?auto_269324 ?auto_269329 ) ) ( not ( = ?auto_269324 ?auto_269330 ) ) ( not ( = ?auto_269324 ?auto_269331 ) ) ( not ( = ?auto_269325 ?auto_269326 ) ) ( not ( = ?auto_269325 ?auto_269327 ) ) ( not ( = ?auto_269325 ?auto_269328 ) ) ( not ( = ?auto_269325 ?auto_269329 ) ) ( not ( = ?auto_269325 ?auto_269330 ) ) ( not ( = ?auto_269325 ?auto_269331 ) ) ( not ( = ?auto_269326 ?auto_269327 ) ) ( not ( = ?auto_269326 ?auto_269328 ) ) ( not ( = ?auto_269326 ?auto_269329 ) ) ( not ( = ?auto_269326 ?auto_269330 ) ) ( not ( = ?auto_269326 ?auto_269331 ) ) ( not ( = ?auto_269327 ?auto_269328 ) ) ( not ( = ?auto_269327 ?auto_269329 ) ) ( not ( = ?auto_269327 ?auto_269330 ) ) ( not ( = ?auto_269327 ?auto_269331 ) ) ( not ( = ?auto_269328 ?auto_269329 ) ) ( not ( = ?auto_269328 ?auto_269330 ) ) ( not ( = ?auto_269328 ?auto_269331 ) ) ( not ( = ?auto_269329 ?auto_269330 ) ) ( not ( = ?auto_269329 ?auto_269331 ) ) ( not ( = ?auto_269330 ?auto_269331 ) ) ( ON ?auto_269329 ?auto_269330 ) ( CLEAR ?auto_269327 ) ( ON ?auto_269328 ?auto_269329 ) ( CLEAR ?auto_269328 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_269321 ?auto_269322 ?auto_269323 ?auto_269324 ?auto_269325 ?auto_269326 ?auto_269327 ?auto_269328 )
      ( MAKE-10PILE ?auto_269321 ?auto_269322 ?auto_269323 ?auto_269324 ?auto_269325 ?auto_269326 ?auto_269327 ?auto_269328 ?auto_269329 ?auto_269330 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_269342 - BLOCK
      ?auto_269343 - BLOCK
      ?auto_269344 - BLOCK
      ?auto_269345 - BLOCK
      ?auto_269346 - BLOCK
      ?auto_269347 - BLOCK
      ?auto_269348 - BLOCK
      ?auto_269349 - BLOCK
      ?auto_269350 - BLOCK
      ?auto_269351 - BLOCK
    )
    :vars
    (
      ?auto_269352 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_269351 ?auto_269352 ) ( ON-TABLE ?auto_269342 ) ( ON ?auto_269343 ?auto_269342 ) ( ON ?auto_269344 ?auto_269343 ) ( ON ?auto_269345 ?auto_269344 ) ( ON ?auto_269346 ?auto_269345 ) ( ON ?auto_269347 ?auto_269346 ) ( not ( = ?auto_269342 ?auto_269343 ) ) ( not ( = ?auto_269342 ?auto_269344 ) ) ( not ( = ?auto_269342 ?auto_269345 ) ) ( not ( = ?auto_269342 ?auto_269346 ) ) ( not ( = ?auto_269342 ?auto_269347 ) ) ( not ( = ?auto_269342 ?auto_269348 ) ) ( not ( = ?auto_269342 ?auto_269349 ) ) ( not ( = ?auto_269342 ?auto_269350 ) ) ( not ( = ?auto_269342 ?auto_269351 ) ) ( not ( = ?auto_269342 ?auto_269352 ) ) ( not ( = ?auto_269343 ?auto_269344 ) ) ( not ( = ?auto_269343 ?auto_269345 ) ) ( not ( = ?auto_269343 ?auto_269346 ) ) ( not ( = ?auto_269343 ?auto_269347 ) ) ( not ( = ?auto_269343 ?auto_269348 ) ) ( not ( = ?auto_269343 ?auto_269349 ) ) ( not ( = ?auto_269343 ?auto_269350 ) ) ( not ( = ?auto_269343 ?auto_269351 ) ) ( not ( = ?auto_269343 ?auto_269352 ) ) ( not ( = ?auto_269344 ?auto_269345 ) ) ( not ( = ?auto_269344 ?auto_269346 ) ) ( not ( = ?auto_269344 ?auto_269347 ) ) ( not ( = ?auto_269344 ?auto_269348 ) ) ( not ( = ?auto_269344 ?auto_269349 ) ) ( not ( = ?auto_269344 ?auto_269350 ) ) ( not ( = ?auto_269344 ?auto_269351 ) ) ( not ( = ?auto_269344 ?auto_269352 ) ) ( not ( = ?auto_269345 ?auto_269346 ) ) ( not ( = ?auto_269345 ?auto_269347 ) ) ( not ( = ?auto_269345 ?auto_269348 ) ) ( not ( = ?auto_269345 ?auto_269349 ) ) ( not ( = ?auto_269345 ?auto_269350 ) ) ( not ( = ?auto_269345 ?auto_269351 ) ) ( not ( = ?auto_269345 ?auto_269352 ) ) ( not ( = ?auto_269346 ?auto_269347 ) ) ( not ( = ?auto_269346 ?auto_269348 ) ) ( not ( = ?auto_269346 ?auto_269349 ) ) ( not ( = ?auto_269346 ?auto_269350 ) ) ( not ( = ?auto_269346 ?auto_269351 ) ) ( not ( = ?auto_269346 ?auto_269352 ) ) ( not ( = ?auto_269347 ?auto_269348 ) ) ( not ( = ?auto_269347 ?auto_269349 ) ) ( not ( = ?auto_269347 ?auto_269350 ) ) ( not ( = ?auto_269347 ?auto_269351 ) ) ( not ( = ?auto_269347 ?auto_269352 ) ) ( not ( = ?auto_269348 ?auto_269349 ) ) ( not ( = ?auto_269348 ?auto_269350 ) ) ( not ( = ?auto_269348 ?auto_269351 ) ) ( not ( = ?auto_269348 ?auto_269352 ) ) ( not ( = ?auto_269349 ?auto_269350 ) ) ( not ( = ?auto_269349 ?auto_269351 ) ) ( not ( = ?auto_269349 ?auto_269352 ) ) ( not ( = ?auto_269350 ?auto_269351 ) ) ( not ( = ?auto_269350 ?auto_269352 ) ) ( not ( = ?auto_269351 ?auto_269352 ) ) ( ON ?auto_269350 ?auto_269351 ) ( ON ?auto_269349 ?auto_269350 ) ( CLEAR ?auto_269347 ) ( ON ?auto_269348 ?auto_269349 ) ( CLEAR ?auto_269348 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_269342 ?auto_269343 ?auto_269344 ?auto_269345 ?auto_269346 ?auto_269347 ?auto_269348 )
      ( MAKE-10PILE ?auto_269342 ?auto_269343 ?auto_269344 ?auto_269345 ?auto_269346 ?auto_269347 ?auto_269348 ?auto_269349 ?auto_269350 ?auto_269351 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_269363 - BLOCK
      ?auto_269364 - BLOCK
      ?auto_269365 - BLOCK
      ?auto_269366 - BLOCK
      ?auto_269367 - BLOCK
      ?auto_269368 - BLOCK
      ?auto_269369 - BLOCK
      ?auto_269370 - BLOCK
      ?auto_269371 - BLOCK
      ?auto_269372 - BLOCK
    )
    :vars
    (
      ?auto_269373 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_269372 ?auto_269373 ) ( ON-TABLE ?auto_269363 ) ( ON ?auto_269364 ?auto_269363 ) ( ON ?auto_269365 ?auto_269364 ) ( ON ?auto_269366 ?auto_269365 ) ( ON ?auto_269367 ?auto_269366 ) ( ON ?auto_269368 ?auto_269367 ) ( not ( = ?auto_269363 ?auto_269364 ) ) ( not ( = ?auto_269363 ?auto_269365 ) ) ( not ( = ?auto_269363 ?auto_269366 ) ) ( not ( = ?auto_269363 ?auto_269367 ) ) ( not ( = ?auto_269363 ?auto_269368 ) ) ( not ( = ?auto_269363 ?auto_269369 ) ) ( not ( = ?auto_269363 ?auto_269370 ) ) ( not ( = ?auto_269363 ?auto_269371 ) ) ( not ( = ?auto_269363 ?auto_269372 ) ) ( not ( = ?auto_269363 ?auto_269373 ) ) ( not ( = ?auto_269364 ?auto_269365 ) ) ( not ( = ?auto_269364 ?auto_269366 ) ) ( not ( = ?auto_269364 ?auto_269367 ) ) ( not ( = ?auto_269364 ?auto_269368 ) ) ( not ( = ?auto_269364 ?auto_269369 ) ) ( not ( = ?auto_269364 ?auto_269370 ) ) ( not ( = ?auto_269364 ?auto_269371 ) ) ( not ( = ?auto_269364 ?auto_269372 ) ) ( not ( = ?auto_269364 ?auto_269373 ) ) ( not ( = ?auto_269365 ?auto_269366 ) ) ( not ( = ?auto_269365 ?auto_269367 ) ) ( not ( = ?auto_269365 ?auto_269368 ) ) ( not ( = ?auto_269365 ?auto_269369 ) ) ( not ( = ?auto_269365 ?auto_269370 ) ) ( not ( = ?auto_269365 ?auto_269371 ) ) ( not ( = ?auto_269365 ?auto_269372 ) ) ( not ( = ?auto_269365 ?auto_269373 ) ) ( not ( = ?auto_269366 ?auto_269367 ) ) ( not ( = ?auto_269366 ?auto_269368 ) ) ( not ( = ?auto_269366 ?auto_269369 ) ) ( not ( = ?auto_269366 ?auto_269370 ) ) ( not ( = ?auto_269366 ?auto_269371 ) ) ( not ( = ?auto_269366 ?auto_269372 ) ) ( not ( = ?auto_269366 ?auto_269373 ) ) ( not ( = ?auto_269367 ?auto_269368 ) ) ( not ( = ?auto_269367 ?auto_269369 ) ) ( not ( = ?auto_269367 ?auto_269370 ) ) ( not ( = ?auto_269367 ?auto_269371 ) ) ( not ( = ?auto_269367 ?auto_269372 ) ) ( not ( = ?auto_269367 ?auto_269373 ) ) ( not ( = ?auto_269368 ?auto_269369 ) ) ( not ( = ?auto_269368 ?auto_269370 ) ) ( not ( = ?auto_269368 ?auto_269371 ) ) ( not ( = ?auto_269368 ?auto_269372 ) ) ( not ( = ?auto_269368 ?auto_269373 ) ) ( not ( = ?auto_269369 ?auto_269370 ) ) ( not ( = ?auto_269369 ?auto_269371 ) ) ( not ( = ?auto_269369 ?auto_269372 ) ) ( not ( = ?auto_269369 ?auto_269373 ) ) ( not ( = ?auto_269370 ?auto_269371 ) ) ( not ( = ?auto_269370 ?auto_269372 ) ) ( not ( = ?auto_269370 ?auto_269373 ) ) ( not ( = ?auto_269371 ?auto_269372 ) ) ( not ( = ?auto_269371 ?auto_269373 ) ) ( not ( = ?auto_269372 ?auto_269373 ) ) ( ON ?auto_269371 ?auto_269372 ) ( ON ?auto_269370 ?auto_269371 ) ( CLEAR ?auto_269368 ) ( ON ?auto_269369 ?auto_269370 ) ( CLEAR ?auto_269369 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_269363 ?auto_269364 ?auto_269365 ?auto_269366 ?auto_269367 ?auto_269368 ?auto_269369 )
      ( MAKE-10PILE ?auto_269363 ?auto_269364 ?auto_269365 ?auto_269366 ?auto_269367 ?auto_269368 ?auto_269369 ?auto_269370 ?auto_269371 ?auto_269372 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_269384 - BLOCK
      ?auto_269385 - BLOCK
      ?auto_269386 - BLOCK
      ?auto_269387 - BLOCK
      ?auto_269388 - BLOCK
      ?auto_269389 - BLOCK
      ?auto_269390 - BLOCK
      ?auto_269391 - BLOCK
      ?auto_269392 - BLOCK
      ?auto_269393 - BLOCK
    )
    :vars
    (
      ?auto_269394 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_269393 ?auto_269394 ) ( ON-TABLE ?auto_269384 ) ( ON ?auto_269385 ?auto_269384 ) ( ON ?auto_269386 ?auto_269385 ) ( ON ?auto_269387 ?auto_269386 ) ( ON ?auto_269388 ?auto_269387 ) ( not ( = ?auto_269384 ?auto_269385 ) ) ( not ( = ?auto_269384 ?auto_269386 ) ) ( not ( = ?auto_269384 ?auto_269387 ) ) ( not ( = ?auto_269384 ?auto_269388 ) ) ( not ( = ?auto_269384 ?auto_269389 ) ) ( not ( = ?auto_269384 ?auto_269390 ) ) ( not ( = ?auto_269384 ?auto_269391 ) ) ( not ( = ?auto_269384 ?auto_269392 ) ) ( not ( = ?auto_269384 ?auto_269393 ) ) ( not ( = ?auto_269384 ?auto_269394 ) ) ( not ( = ?auto_269385 ?auto_269386 ) ) ( not ( = ?auto_269385 ?auto_269387 ) ) ( not ( = ?auto_269385 ?auto_269388 ) ) ( not ( = ?auto_269385 ?auto_269389 ) ) ( not ( = ?auto_269385 ?auto_269390 ) ) ( not ( = ?auto_269385 ?auto_269391 ) ) ( not ( = ?auto_269385 ?auto_269392 ) ) ( not ( = ?auto_269385 ?auto_269393 ) ) ( not ( = ?auto_269385 ?auto_269394 ) ) ( not ( = ?auto_269386 ?auto_269387 ) ) ( not ( = ?auto_269386 ?auto_269388 ) ) ( not ( = ?auto_269386 ?auto_269389 ) ) ( not ( = ?auto_269386 ?auto_269390 ) ) ( not ( = ?auto_269386 ?auto_269391 ) ) ( not ( = ?auto_269386 ?auto_269392 ) ) ( not ( = ?auto_269386 ?auto_269393 ) ) ( not ( = ?auto_269386 ?auto_269394 ) ) ( not ( = ?auto_269387 ?auto_269388 ) ) ( not ( = ?auto_269387 ?auto_269389 ) ) ( not ( = ?auto_269387 ?auto_269390 ) ) ( not ( = ?auto_269387 ?auto_269391 ) ) ( not ( = ?auto_269387 ?auto_269392 ) ) ( not ( = ?auto_269387 ?auto_269393 ) ) ( not ( = ?auto_269387 ?auto_269394 ) ) ( not ( = ?auto_269388 ?auto_269389 ) ) ( not ( = ?auto_269388 ?auto_269390 ) ) ( not ( = ?auto_269388 ?auto_269391 ) ) ( not ( = ?auto_269388 ?auto_269392 ) ) ( not ( = ?auto_269388 ?auto_269393 ) ) ( not ( = ?auto_269388 ?auto_269394 ) ) ( not ( = ?auto_269389 ?auto_269390 ) ) ( not ( = ?auto_269389 ?auto_269391 ) ) ( not ( = ?auto_269389 ?auto_269392 ) ) ( not ( = ?auto_269389 ?auto_269393 ) ) ( not ( = ?auto_269389 ?auto_269394 ) ) ( not ( = ?auto_269390 ?auto_269391 ) ) ( not ( = ?auto_269390 ?auto_269392 ) ) ( not ( = ?auto_269390 ?auto_269393 ) ) ( not ( = ?auto_269390 ?auto_269394 ) ) ( not ( = ?auto_269391 ?auto_269392 ) ) ( not ( = ?auto_269391 ?auto_269393 ) ) ( not ( = ?auto_269391 ?auto_269394 ) ) ( not ( = ?auto_269392 ?auto_269393 ) ) ( not ( = ?auto_269392 ?auto_269394 ) ) ( not ( = ?auto_269393 ?auto_269394 ) ) ( ON ?auto_269392 ?auto_269393 ) ( ON ?auto_269391 ?auto_269392 ) ( ON ?auto_269390 ?auto_269391 ) ( CLEAR ?auto_269388 ) ( ON ?auto_269389 ?auto_269390 ) ( CLEAR ?auto_269389 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_269384 ?auto_269385 ?auto_269386 ?auto_269387 ?auto_269388 ?auto_269389 )
      ( MAKE-10PILE ?auto_269384 ?auto_269385 ?auto_269386 ?auto_269387 ?auto_269388 ?auto_269389 ?auto_269390 ?auto_269391 ?auto_269392 ?auto_269393 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_269405 - BLOCK
      ?auto_269406 - BLOCK
      ?auto_269407 - BLOCK
      ?auto_269408 - BLOCK
      ?auto_269409 - BLOCK
      ?auto_269410 - BLOCK
      ?auto_269411 - BLOCK
      ?auto_269412 - BLOCK
      ?auto_269413 - BLOCK
      ?auto_269414 - BLOCK
    )
    :vars
    (
      ?auto_269415 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_269414 ?auto_269415 ) ( ON-TABLE ?auto_269405 ) ( ON ?auto_269406 ?auto_269405 ) ( ON ?auto_269407 ?auto_269406 ) ( ON ?auto_269408 ?auto_269407 ) ( ON ?auto_269409 ?auto_269408 ) ( not ( = ?auto_269405 ?auto_269406 ) ) ( not ( = ?auto_269405 ?auto_269407 ) ) ( not ( = ?auto_269405 ?auto_269408 ) ) ( not ( = ?auto_269405 ?auto_269409 ) ) ( not ( = ?auto_269405 ?auto_269410 ) ) ( not ( = ?auto_269405 ?auto_269411 ) ) ( not ( = ?auto_269405 ?auto_269412 ) ) ( not ( = ?auto_269405 ?auto_269413 ) ) ( not ( = ?auto_269405 ?auto_269414 ) ) ( not ( = ?auto_269405 ?auto_269415 ) ) ( not ( = ?auto_269406 ?auto_269407 ) ) ( not ( = ?auto_269406 ?auto_269408 ) ) ( not ( = ?auto_269406 ?auto_269409 ) ) ( not ( = ?auto_269406 ?auto_269410 ) ) ( not ( = ?auto_269406 ?auto_269411 ) ) ( not ( = ?auto_269406 ?auto_269412 ) ) ( not ( = ?auto_269406 ?auto_269413 ) ) ( not ( = ?auto_269406 ?auto_269414 ) ) ( not ( = ?auto_269406 ?auto_269415 ) ) ( not ( = ?auto_269407 ?auto_269408 ) ) ( not ( = ?auto_269407 ?auto_269409 ) ) ( not ( = ?auto_269407 ?auto_269410 ) ) ( not ( = ?auto_269407 ?auto_269411 ) ) ( not ( = ?auto_269407 ?auto_269412 ) ) ( not ( = ?auto_269407 ?auto_269413 ) ) ( not ( = ?auto_269407 ?auto_269414 ) ) ( not ( = ?auto_269407 ?auto_269415 ) ) ( not ( = ?auto_269408 ?auto_269409 ) ) ( not ( = ?auto_269408 ?auto_269410 ) ) ( not ( = ?auto_269408 ?auto_269411 ) ) ( not ( = ?auto_269408 ?auto_269412 ) ) ( not ( = ?auto_269408 ?auto_269413 ) ) ( not ( = ?auto_269408 ?auto_269414 ) ) ( not ( = ?auto_269408 ?auto_269415 ) ) ( not ( = ?auto_269409 ?auto_269410 ) ) ( not ( = ?auto_269409 ?auto_269411 ) ) ( not ( = ?auto_269409 ?auto_269412 ) ) ( not ( = ?auto_269409 ?auto_269413 ) ) ( not ( = ?auto_269409 ?auto_269414 ) ) ( not ( = ?auto_269409 ?auto_269415 ) ) ( not ( = ?auto_269410 ?auto_269411 ) ) ( not ( = ?auto_269410 ?auto_269412 ) ) ( not ( = ?auto_269410 ?auto_269413 ) ) ( not ( = ?auto_269410 ?auto_269414 ) ) ( not ( = ?auto_269410 ?auto_269415 ) ) ( not ( = ?auto_269411 ?auto_269412 ) ) ( not ( = ?auto_269411 ?auto_269413 ) ) ( not ( = ?auto_269411 ?auto_269414 ) ) ( not ( = ?auto_269411 ?auto_269415 ) ) ( not ( = ?auto_269412 ?auto_269413 ) ) ( not ( = ?auto_269412 ?auto_269414 ) ) ( not ( = ?auto_269412 ?auto_269415 ) ) ( not ( = ?auto_269413 ?auto_269414 ) ) ( not ( = ?auto_269413 ?auto_269415 ) ) ( not ( = ?auto_269414 ?auto_269415 ) ) ( ON ?auto_269413 ?auto_269414 ) ( ON ?auto_269412 ?auto_269413 ) ( ON ?auto_269411 ?auto_269412 ) ( CLEAR ?auto_269409 ) ( ON ?auto_269410 ?auto_269411 ) ( CLEAR ?auto_269410 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_269405 ?auto_269406 ?auto_269407 ?auto_269408 ?auto_269409 ?auto_269410 )
      ( MAKE-10PILE ?auto_269405 ?auto_269406 ?auto_269407 ?auto_269408 ?auto_269409 ?auto_269410 ?auto_269411 ?auto_269412 ?auto_269413 ?auto_269414 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_269426 - BLOCK
      ?auto_269427 - BLOCK
      ?auto_269428 - BLOCK
      ?auto_269429 - BLOCK
      ?auto_269430 - BLOCK
      ?auto_269431 - BLOCK
      ?auto_269432 - BLOCK
      ?auto_269433 - BLOCK
      ?auto_269434 - BLOCK
      ?auto_269435 - BLOCK
    )
    :vars
    (
      ?auto_269436 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_269435 ?auto_269436 ) ( ON-TABLE ?auto_269426 ) ( ON ?auto_269427 ?auto_269426 ) ( ON ?auto_269428 ?auto_269427 ) ( ON ?auto_269429 ?auto_269428 ) ( not ( = ?auto_269426 ?auto_269427 ) ) ( not ( = ?auto_269426 ?auto_269428 ) ) ( not ( = ?auto_269426 ?auto_269429 ) ) ( not ( = ?auto_269426 ?auto_269430 ) ) ( not ( = ?auto_269426 ?auto_269431 ) ) ( not ( = ?auto_269426 ?auto_269432 ) ) ( not ( = ?auto_269426 ?auto_269433 ) ) ( not ( = ?auto_269426 ?auto_269434 ) ) ( not ( = ?auto_269426 ?auto_269435 ) ) ( not ( = ?auto_269426 ?auto_269436 ) ) ( not ( = ?auto_269427 ?auto_269428 ) ) ( not ( = ?auto_269427 ?auto_269429 ) ) ( not ( = ?auto_269427 ?auto_269430 ) ) ( not ( = ?auto_269427 ?auto_269431 ) ) ( not ( = ?auto_269427 ?auto_269432 ) ) ( not ( = ?auto_269427 ?auto_269433 ) ) ( not ( = ?auto_269427 ?auto_269434 ) ) ( not ( = ?auto_269427 ?auto_269435 ) ) ( not ( = ?auto_269427 ?auto_269436 ) ) ( not ( = ?auto_269428 ?auto_269429 ) ) ( not ( = ?auto_269428 ?auto_269430 ) ) ( not ( = ?auto_269428 ?auto_269431 ) ) ( not ( = ?auto_269428 ?auto_269432 ) ) ( not ( = ?auto_269428 ?auto_269433 ) ) ( not ( = ?auto_269428 ?auto_269434 ) ) ( not ( = ?auto_269428 ?auto_269435 ) ) ( not ( = ?auto_269428 ?auto_269436 ) ) ( not ( = ?auto_269429 ?auto_269430 ) ) ( not ( = ?auto_269429 ?auto_269431 ) ) ( not ( = ?auto_269429 ?auto_269432 ) ) ( not ( = ?auto_269429 ?auto_269433 ) ) ( not ( = ?auto_269429 ?auto_269434 ) ) ( not ( = ?auto_269429 ?auto_269435 ) ) ( not ( = ?auto_269429 ?auto_269436 ) ) ( not ( = ?auto_269430 ?auto_269431 ) ) ( not ( = ?auto_269430 ?auto_269432 ) ) ( not ( = ?auto_269430 ?auto_269433 ) ) ( not ( = ?auto_269430 ?auto_269434 ) ) ( not ( = ?auto_269430 ?auto_269435 ) ) ( not ( = ?auto_269430 ?auto_269436 ) ) ( not ( = ?auto_269431 ?auto_269432 ) ) ( not ( = ?auto_269431 ?auto_269433 ) ) ( not ( = ?auto_269431 ?auto_269434 ) ) ( not ( = ?auto_269431 ?auto_269435 ) ) ( not ( = ?auto_269431 ?auto_269436 ) ) ( not ( = ?auto_269432 ?auto_269433 ) ) ( not ( = ?auto_269432 ?auto_269434 ) ) ( not ( = ?auto_269432 ?auto_269435 ) ) ( not ( = ?auto_269432 ?auto_269436 ) ) ( not ( = ?auto_269433 ?auto_269434 ) ) ( not ( = ?auto_269433 ?auto_269435 ) ) ( not ( = ?auto_269433 ?auto_269436 ) ) ( not ( = ?auto_269434 ?auto_269435 ) ) ( not ( = ?auto_269434 ?auto_269436 ) ) ( not ( = ?auto_269435 ?auto_269436 ) ) ( ON ?auto_269434 ?auto_269435 ) ( ON ?auto_269433 ?auto_269434 ) ( ON ?auto_269432 ?auto_269433 ) ( ON ?auto_269431 ?auto_269432 ) ( CLEAR ?auto_269429 ) ( ON ?auto_269430 ?auto_269431 ) ( CLEAR ?auto_269430 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_269426 ?auto_269427 ?auto_269428 ?auto_269429 ?auto_269430 )
      ( MAKE-10PILE ?auto_269426 ?auto_269427 ?auto_269428 ?auto_269429 ?auto_269430 ?auto_269431 ?auto_269432 ?auto_269433 ?auto_269434 ?auto_269435 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_269447 - BLOCK
      ?auto_269448 - BLOCK
      ?auto_269449 - BLOCK
      ?auto_269450 - BLOCK
      ?auto_269451 - BLOCK
      ?auto_269452 - BLOCK
      ?auto_269453 - BLOCK
      ?auto_269454 - BLOCK
      ?auto_269455 - BLOCK
      ?auto_269456 - BLOCK
    )
    :vars
    (
      ?auto_269457 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_269456 ?auto_269457 ) ( ON-TABLE ?auto_269447 ) ( ON ?auto_269448 ?auto_269447 ) ( ON ?auto_269449 ?auto_269448 ) ( ON ?auto_269450 ?auto_269449 ) ( not ( = ?auto_269447 ?auto_269448 ) ) ( not ( = ?auto_269447 ?auto_269449 ) ) ( not ( = ?auto_269447 ?auto_269450 ) ) ( not ( = ?auto_269447 ?auto_269451 ) ) ( not ( = ?auto_269447 ?auto_269452 ) ) ( not ( = ?auto_269447 ?auto_269453 ) ) ( not ( = ?auto_269447 ?auto_269454 ) ) ( not ( = ?auto_269447 ?auto_269455 ) ) ( not ( = ?auto_269447 ?auto_269456 ) ) ( not ( = ?auto_269447 ?auto_269457 ) ) ( not ( = ?auto_269448 ?auto_269449 ) ) ( not ( = ?auto_269448 ?auto_269450 ) ) ( not ( = ?auto_269448 ?auto_269451 ) ) ( not ( = ?auto_269448 ?auto_269452 ) ) ( not ( = ?auto_269448 ?auto_269453 ) ) ( not ( = ?auto_269448 ?auto_269454 ) ) ( not ( = ?auto_269448 ?auto_269455 ) ) ( not ( = ?auto_269448 ?auto_269456 ) ) ( not ( = ?auto_269448 ?auto_269457 ) ) ( not ( = ?auto_269449 ?auto_269450 ) ) ( not ( = ?auto_269449 ?auto_269451 ) ) ( not ( = ?auto_269449 ?auto_269452 ) ) ( not ( = ?auto_269449 ?auto_269453 ) ) ( not ( = ?auto_269449 ?auto_269454 ) ) ( not ( = ?auto_269449 ?auto_269455 ) ) ( not ( = ?auto_269449 ?auto_269456 ) ) ( not ( = ?auto_269449 ?auto_269457 ) ) ( not ( = ?auto_269450 ?auto_269451 ) ) ( not ( = ?auto_269450 ?auto_269452 ) ) ( not ( = ?auto_269450 ?auto_269453 ) ) ( not ( = ?auto_269450 ?auto_269454 ) ) ( not ( = ?auto_269450 ?auto_269455 ) ) ( not ( = ?auto_269450 ?auto_269456 ) ) ( not ( = ?auto_269450 ?auto_269457 ) ) ( not ( = ?auto_269451 ?auto_269452 ) ) ( not ( = ?auto_269451 ?auto_269453 ) ) ( not ( = ?auto_269451 ?auto_269454 ) ) ( not ( = ?auto_269451 ?auto_269455 ) ) ( not ( = ?auto_269451 ?auto_269456 ) ) ( not ( = ?auto_269451 ?auto_269457 ) ) ( not ( = ?auto_269452 ?auto_269453 ) ) ( not ( = ?auto_269452 ?auto_269454 ) ) ( not ( = ?auto_269452 ?auto_269455 ) ) ( not ( = ?auto_269452 ?auto_269456 ) ) ( not ( = ?auto_269452 ?auto_269457 ) ) ( not ( = ?auto_269453 ?auto_269454 ) ) ( not ( = ?auto_269453 ?auto_269455 ) ) ( not ( = ?auto_269453 ?auto_269456 ) ) ( not ( = ?auto_269453 ?auto_269457 ) ) ( not ( = ?auto_269454 ?auto_269455 ) ) ( not ( = ?auto_269454 ?auto_269456 ) ) ( not ( = ?auto_269454 ?auto_269457 ) ) ( not ( = ?auto_269455 ?auto_269456 ) ) ( not ( = ?auto_269455 ?auto_269457 ) ) ( not ( = ?auto_269456 ?auto_269457 ) ) ( ON ?auto_269455 ?auto_269456 ) ( ON ?auto_269454 ?auto_269455 ) ( ON ?auto_269453 ?auto_269454 ) ( ON ?auto_269452 ?auto_269453 ) ( CLEAR ?auto_269450 ) ( ON ?auto_269451 ?auto_269452 ) ( CLEAR ?auto_269451 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_269447 ?auto_269448 ?auto_269449 ?auto_269450 ?auto_269451 )
      ( MAKE-10PILE ?auto_269447 ?auto_269448 ?auto_269449 ?auto_269450 ?auto_269451 ?auto_269452 ?auto_269453 ?auto_269454 ?auto_269455 ?auto_269456 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_269468 - BLOCK
      ?auto_269469 - BLOCK
      ?auto_269470 - BLOCK
      ?auto_269471 - BLOCK
      ?auto_269472 - BLOCK
      ?auto_269473 - BLOCK
      ?auto_269474 - BLOCK
      ?auto_269475 - BLOCK
      ?auto_269476 - BLOCK
      ?auto_269477 - BLOCK
    )
    :vars
    (
      ?auto_269478 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_269477 ?auto_269478 ) ( ON-TABLE ?auto_269468 ) ( ON ?auto_269469 ?auto_269468 ) ( ON ?auto_269470 ?auto_269469 ) ( not ( = ?auto_269468 ?auto_269469 ) ) ( not ( = ?auto_269468 ?auto_269470 ) ) ( not ( = ?auto_269468 ?auto_269471 ) ) ( not ( = ?auto_269468 ?auto_269472 ) ) ( not ( = ?auto_269468 ?auto_269473 ) ) ( not ( = ?auto_269468 ?auto_269474 ) ) ( not ( = ?auto_269468 ?auto_269475 ) ) ( not ( = ?auto_269468 ?auto_269476 ) ) ( not ( = ?auto_269468 ?auto_269477 ) ) ( not ( = ?auto_269468 ?auto_269478 ) ) ( not ( = ?auto_269469 ?auto_269470 ) ) ( not ( = ?auto_269469 ?auto_269471 ) ) ( not ( = ?auto_269469 ?auto_269472 ) ) ( not ( = ?auto_269469 ?auto_269473 ) ) ( not ( = ?auto_269469 ?auto_269474 ) ) ( not ( = ?auto_269469 ?auto_269475 ) ) ( not ( = ?auto_269469 ?auto_269476 ) ) ( not ( = ?auto_269469 ?auto_269477 ) ) ( not ( = ?auto_269469 ?auto_269478 ) ) ( not ( = ?auto_269470 ?auto_269471 ) ) ( not ( = ?auto_269470 ?auto_269472 ) ) ( not ( = ?auto_269470 ?auto_269473 ) ) ( not ( = ?auto_269470 ?auto_269474 ) ) ( not ( = ?auto_269470 ?auto_269475 ) ) ( not ( = ?auto_269470 ?auto_269476 ) ) ( not ( = ?auto_269470 ?auto_269477 ) ) ( not ( = ?auto_269470 ?auto_269478 ) ) ( not ( = ?auto_269471 ?auto_269472 ) ) ( not ( = ?auto_269471 ?auto_269473 ) ) ( not ( = ?auto_269471 ?auto_269474 ) ) ( not ( = ?auto_269471 ?auto_269475 ) ) ( not ( = ?auto_269471 ?auto_269476 ) ) ( not ( = ?auto_269471 ?auto_269477 ) ) ( not ( = ?auto_269471 ?auto_269478 ) ) ( not ( = ?auto_269472 ?auto_269473 ) ) ( not ( = ?auto_269472 ?auto_269474 ) ) ( not ( = ?auto_269472 ?auto_269475 ) ) ( not ( = ?auto_269472 ?auto_269476 ) ) ( not ( = ?auto_269472 ?auto_269477 ) ) ( not ( = ?auto_269472 ?auto_269478 ) ) ( not ( = ?auto_269473 ?auto_269474 ) ) ( not ( = ?auto_269473 ?auto_269475 ) ) ( not ( = ?auto_269473 ?auto_269476 ) ) ( not ( = ?auto_269473 ?auto_269477 ) ) ( not ( = ?auto_269473 ?auto_269478 ) ) ( not ( = ?auto_269474 ?auto_269475 ) ) ( not ( = ?auto_269474 ?auto_269476 ) ) ( not ( = ?auto_269474 ?auto_269477 ) ) ( not ( = ?auto_269474 ?auto_269478 ) ) ( not ( = ?auto_269475 ?auto_269476 ) ) ( not ( = ?auto_269475 ?auto_269477 ) ) ( not ( = ?auto_269475 ?auto_269478 ) ) ( not ( = ?auto_269476 ?auto_269477 ) ) ( not ( = ?auto_269476 ?auto_269478 ) ) ( not ( = ?auto_269477 ?auto_269478 ) ) ( ON ?auto_269476 ?auto_269477 ) ( ON ?auto_269475 ?auto_269476 ) ( ON ?auto_269474 ?auto_269475 ) ( ON ?auto_269473 ?auto_269474 ) ( ON ?auto_269472 ?auto_269473 ) ( CLEAR ?auto_269470 ) ( ON ?auto_269471 ?auto_269472 ) ( CLEAR ?auto_269471 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_269468 ?auto_269469 ?auto_269470 ?auto_269471 )
      ( MAKE-10PILE ?auto_269468 ?auto_269469 ?auto_269470 ?auto_269471 ?auto_269472 ?auto_269473 ?auto_269474 ?auto_269475 ?auto_269476 ?auto_269477 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_269489 - BLOCK
      ?auto_269490 - BLOCK
      ?auto_269491 - BLOCK
      ?auto_269492 - BLOCK
      ?auto_269493 - BLOCK
      ?auto_269494 - BLOCK
      ?auto_269495 - BLOCK
      ?auto_269496 - BLOCK
      ?auto_269497 - BLOCK
      ?auto_269498 - BLOCK
    )
    :vars
    (
      ?auto_269499 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_269498 ?auto_269499 ) ( ON-TABLE ?auto_269489 ) ( ON ?auto_269490 ?auto_269489 ) ( ON ?auto_269491 ?auto_269490 ) ( not ( = ?auto_269489 ?auto_269490 ) ) ( not ( = ?auto_269489 ?auto_269491 ) ) ( not ( = ?auto_269489 ?auto_269492 ) ) ( not ( = ?auto_269489 ?auto_269493 ) ) ( not ( = ?auto_269489 ?auto_269494 ) ) ( not ( = ?auto_269489 ?auto_269495 ) ) ( not ( = ?auto_269489 ?auto_269496 ) ) ( not ( = ?auto_269489 ?auto_269497 ) ) ( not ( = ?auto_269489 ?auto_269498 ) ) ( not ( = ?auto_269489 ?auto_269499 ) ) ( not ( = ?auto_269490 ?auto_269491 ) ) ( not ( = ?auto_269490 ?auto_269492 ) ) ( not ( = ?auto_269490 ?auto_269493 ) ) ( not ( = ?auto_269490 ?auto_269494 ) ) ( not ( = ?auto_269490 ?auto_269495 ) ) ( not ( = ?auto_269490 ?auto_269496 ) ) ( not ( = ?auto_269490 ?auto_269497 ) ) ( not ( = ?auto_269490 ?auto_269498 ) ) ( not ( = ?auto_269490 ?auto_269499 ) ) ( not ( = ?auto_269491 ?auto_269492 ) ) ( not ( = ?auto_269491 ?auto_269493 ) ) ( not ( = ?auto_269491 ?auto_269494 ) ) ( not ( = ?auto_269491 ?auto_269495 ) ) ( not ( = ?auto_269491 ?auto_269496 ) ) ( not ( = ?auto_269491 ?auto_269497 ) ) ( not ( = ?auto_269491 ?auto_269498 ) ) ( not ( = ?auto_269491 ?auto_269499 ) ) ( not ( = ?auto_269492 ?auto_269493 ) ) ( not ( = ?auto_269492 ?auto_269494 ) ) ( not ( = ?auto_269492 ?auto_269495 ) ) ( not ( = ?auto_269492 ?auto_269496 ) ) ( not ( = ?auto_269492 ?auto_269497 ) ) ( not ( = ?auto_269492 ?auto_269498 ) ) ( not ( = ?auto_269492 ?auto_269499 ) ) ( not ( = ?auto_269493 ?auto_269494 ) ) ( not ( = ?auto_269493 ?auto_269495 ) ) ( not ( = ?auto_269493 ?auto_269496 ) ) ( not ( = ?auto_269493 ?auto_269497 ) ) ( not ( = ?auto_269493 ?auto_269498 ) ) ( not ( = ?auto_269493 ?auto_269499 ) ) ( not ( = ?auto_269494 ?auto_269495 ) ) ( not ( = ?auto_269494 ?auto_269496 ) ) ( not ( = ?auto_269494 ?auto_269497 ) ) ( not ( = ?auto_269494 ?auto_269498 ) ) ( not ( = ?auto_269494 ?auto_269499 ) ) ( not ( = ?auto_269495 ?auto_269496 ) ) ( not ( = ?auto_269495 ?auto_269497 ) ) ( not ( = ?auto_269495 ?auto_269498 ) ) ( not ( = ?auto_269495 ?auto_269499 ) ) ( not ( = ?auto_269496 ?auto_269497 ) ) ( not ( = ?auto_269496 ?auto_269498 ) ) ( not ( = ?auto_269496 ?auto_269499 ) ) ( not ( = ?auto_269497 ?auto_269498 ) ) ( not ( = ?auto_269497 ?auto_269499 ) ) ( not ( = ?auto_269498 ?auto_269499 ) ) ( ON ?auto_269497 ?auto_269498 ) ( ON ?auto_269496 ?auto_269497 ) ( ON ?auto_269495 ?auto_269496 ) ( ON ?auto_269494 ?auto_269495 ) ( ON ?auto_269493 ?auto_269494 ) ( CLEAR ?auto_269491 ) ( ON ?auto_269492 ?auto_269493 ) ( CLEAR ?auto_269492 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_269489 ?auto_269490 ?auto_269491 ?auto_269492 )
      ( MAKE-10PILE ?auto_269489 ?auto_269490 ?auto_269491 ?auto_269492 ?auto_269493 ?auto_269494 ?auto_269495 ?auto_269496 ?auto_269497 ?auto_269498 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_269510 - BLOCK
      ?auto_269511 - BLOCK
      ?auto_269512 - BLOCK
      ?auto_269513 - BLOCK
      ?auto_269514 - BLOCK
      ?auto_269515 - BLOCK
      ?auto_269516 - BLOCK
      ?auto_269517 - BLOCK
      ?auto_269518 - BLOCK
      ?auto_269519 - BLOCK
    )
    :vars
    (
      ?auto_269520 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_269519 ?auto_269520 ) ( ON-TABLE ?auto_269510 ) ( ON ?auto_269511 ?auto_269510 ) ( not ( = ?auto_269510 ?auto_269511 ) ) ( not ( = ?auto_269510 ?auto_269512 ) ) ( not ( = ?auto_269510 ?auto_269513 ) ) ( not ( = ?auto_269510 ?auto_269514 ) ) ( not ( = ?auto_269510 ?auto_269515 ) ) ( not ( = ?auto_269510 ?auto_269516 ) ) ( not ( = ?auto_269510 ?auto_269517 ) ) ( not ( = ?auto_269510 ?auto_269518 ) ) ( not ( = ?auto_269510 ?auto_269519 ) ) ( not ( = ?auto_269510 ?auto_269520 ) ) ( not ( = ?auto_269511 ?auto_269512 ) ) ( not ( = ?auto_269511 ?auto_269513 ) ) ( not ( = ?auto_269511 ?auto_269514 ) ) ( not ( = ?auto_269511 ?auto_269515 ) ) ( not ( = ?auto_269511 ?auto_269516 ) ) ( not ( = ?auto_269511 ?auto_269517 ) ) ( not ( = ?auto_269511 ?auto_269518 ) ) ( not ( = ?auto_269511 ?auto_269519 ) ) ( not ( = ?auto_269511 ?auto_269520 ) ) ( not ( = ?auto_269512 ?auto_269513 ) ) ( not ( = ?auto_269512 ?auto_269514 ) ) ( not ( = ?auto_269512 ?auto_269515 ) ) ( not ( = ?auto_269512 ?auto_269516 ) ) ( not ( = ?auto_269512 ?auto_269517 ) ) ( not ( = ?auto_269512 ?auto_269518 ) ) ( not ( = ?auto_269512 ?auto_269519 ) ) ( not ( = ?auto_269512 ?auto_269520 ) ) ( not ( = ?auto_269513 ?auto_269514 ) ) ( not ( = ?auto_269513 ?auto_269515 ) ) ( not ( = ?auto_269513 ?auto_269516 ) ) ( not ( = ?auto_269513 ?auto_269517 ) ) ( not ( = ?auto_269513 ?auto_269518 ) ) ( not ( = ?auto_269513 ?auto_269519 ) ) ( not ( = ?auto_269513 ?auto_269520 ) ) ( not ( = ?auto_269514 ?auto_269515 ) ) ( not ( = ?auto_269514 ?auto_269516 ) ) ( not ( = ?auto_269514 ?auto_269517 ) ) ( not ( = ?auto_269514 ?auto_269518 ) ) ( not ( = ?auto_269514 ?auto_269519 ) ) ( not ( = ?auto_269514 ?auto_269520 ) ) ( not ( = ?auto_269515 ?auto_269516 ) ) ( not ( = ?auto_269515 ?auto_269517 ) ) ( not ( = ?auto_269515 ?auto_269518 ) ) ( not ( = ?auto_269515 ?auto_269519 ) ) ( not ( = ?auto_269515 ?auto_269520 ) ) ( not ( = ?auto_269516 ?auto_269517 ) ) ( not ( = ?auto_269516 ?auto_269518 ) ) ( not ( = ?auto_269516 ?auto_269519 ) ) ( not ( = ?auto_269516 ?auto_269520 ) ) ( not ( = ?auto_269517 ?auto_269518 ) ) ( not ( = ?auto_269517 ?auto_269519 ) ) ( not ( = ?auto_269517 ?auto_269520 ) ) ( not ( = ?auto_269518 ?auto_269519 ) ) ( not ( = ?auto_269518 ?auto_269520 ) ) ( not ( = ?auto_269519 ?auto_269520 ) ) ( ON ?auto_269518 ?auto_269519 ) ( ON ?auto_269517 ?auto_269518 ) ( ON ?auto_269516 ?auto_269517 ) ( ON ?auto_269515 ?auto_269516 ) ( ON ?auto_269514 ?auto_269515 ) ( ON ?auto_269513 ?auto_269514 ) ( CLEAR ?auto_269511 ) ( ON ?auto_269512 ?auto_269513 ) ( CLEAR ?auto_269512 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_269510 ?auto_269511 ?auto_269512 )
      ( MAKE-10PILE ?auto_269510 ?auto_269511 ?auto_269512 ?auto_269513 ?auto_269514 ?auto_269515 ?auto_269516 ?auto_269517 ?auto_269518 ?auto_269519 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_269531 - BLOCK
      ?auto_269532 - BLOCK
      ?auto_269533 - BLOCK
      ?auto_269534 - BLOCK
      ?auto_269535 - BLOCK
      ?auto_269536 - BLOCK
      ?auto_269537 - BLOCK
      ?auto_269538 - BLOCK
      ?auto_269539 - BLOCK
      ?auto_269540 - BLOCK
    )
    :vars
    (
      ?auto_269541 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_269540 ?auto_269541 ) ( ON-TABLE ?auto_269531 ) ( ON ?auto_269532 ?auto_269531 ) ( not ( = ?auto_269531 ?auto_269532 ) ) ( not ( = ?auto_269531 ?auto_269533 ) ) ( not ( = ?auto_269531 ?auto_269534 ) ) ( not ( = ?auto_269531 ?auto_269535 ) ) ( not ( = ?auto_269531 ?auto_269536 ) ) ( not ( = ?auto_269531 ?auto_269537 ) ) ( not ( = ?auto_269531 ?auto_269538 ) ) ( not ( = ?auto_269531 ?auto_269539 ) ) ( not ( = ?auto_269531 ?auto_269540 ) ) ( not ( = ?auto_269531 ?auto_269541 ) ) ( not ( = ?auto_269532 ?auto_269533 ) ) ( not ( = ?auto_269532 ?auto_269534 ) ) ( not ( = ?auto_269532 ?auto_269535 ) ) ( not ( = ?auto_269532 ?auto_269536 ) ) ( not ( = ?auto_269532 ?auto_269537 ) ) ( not ( = ?auto_269532 ?auto_269538 ) ) ( not ( = ?auto_269532 ?auto_269539 ) ) ( not ( = ?auto_269532 ?auto_269540 ) ) ( not ( = ?auto_269532 ?auto_269541 ) ) ( not ( = ?auto_269533 ?auto_269534 ) ) ( not ( = ?auto_269533 ?auto_269535 ) ) ( not ( = ?auto_269533 ?auto_269536 ) ) ( not ( = ?auto_269533 ?auto_269537 ) ) ( not ( = ?auto_269533 ?auto_269538 ) ) ( not ( = ?auto_269533 ?auto_269539 ) ) ( not ( = ?auto_269533 ?auto_269540 ) ) ( not ( = ?auto_269533 ?auto_269541 ) ) ( not ( = ?auto_269534 ?auto_269535 ) ) ( not ( = ?auto_269534 ?auto_269536 ) ) ( not ( = ?auto_269534 ?auto_269537 ) ) ( not ( = ?auto_269534 ?auto_269538 ) ) ( not ( = ?auto_269534 ?auto_269539 ) ) ( not ( = ?auto_269534 ?auto_269540 ) ) ( not ( = ?auto_269534 ?auto_269541 ) ) ( not ( = ?auto_269535 ?auto_269536 ) ) ( not ( = ?auto_269535 ?auto_269537 ) ) ( not ( = ?auto_269535 ?auto_269538 ) ) ( not ( = ?auto_269535 ?auto_269539 ) ) ( not ( = ?auto_269535 ?auto_269540 ) ) ( not ( = ?auto_269535 ?auto_269541 ) ) ( not ( = ?auto_269536 ?auto_269537 ) ) ( not ( = ?auto_269536 ?auto_269538 ) ) ( not ( = ?auto_269536 ?auto_269539 ) ) ( not ( = ?auto_269536 ?auto_269540 ) ) ( not ( = ?auto_269536 ?auto_269541 ) ) ( not ( = ?auto_269537 ?auto_269538 ) ) ( not ( = ?auto_269537 ?auto_269539 ) ) ( not ( = ?auto_269537 ?auto_269540 ) ) ( not ( = ?auto_269537 ?auto_269541 ) ) ( not ( = ?auto_269538 ?auto_269539 ) ) ( not ( = ?auto_269538 ?auto_269540 ) ) ( not ( = ?auto_269538 ?auto_269541 ) ) ( not ( = ?auto_269539 ?auto_269540 ) ) ( not ( = ?auto_269539 ?auto_269541 ) ) ( not ( = ?auto_269540 ?auto_269541 ) ) ( ON ?auto_269539 ?auto_269540 ) ( ON ?auto_269538 ?auto_269539 ) ( ON ?auto_269537 ?auto_269538 ) ( ON ?auto_269536 ?auto_269537 ) ( ON ?auto_269535 ?auto_269536 ) ( ON ?auto_269534 ?auto_269535 ) ( CLEAR ?auto_269532 ) ( ON ?auto_269533 ?auto_269534 ) ( CLEAR ?auto_269533 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_269531 ?auto_269532 ?auto_269533 )
      ( MAKE-10PILE ?auto_269531 ?auto_269532 ?auto_269533 ?auto_269534 ?auto_269535 ?auto_269536 ?auto_269537 ?auto_269538 ?auto_269539 ?auto_269540 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_269552 - BLOCK
      ?auto_269553 - BLOCK
      ?auto_269554 - BLOCK
      ?auto_269555 - BLOCK
      ?auto_269556 - BLOCK
      ?auto_269557 - BLOCK
      ?auto_269558 - BLOCK
      ?auto_269559 - BLOCK
      ?auto_269560 - BLOCK
      ?auto_269561 - BLOCK
    )
    :vars
    (
      ?auto_269562 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_269561 ?auto_269562 ) ( ON-TABLE ?auto_269552 ) ( not ( = ?auto_269552 ?auto_269553 ) ) ( not ( = ?auto_269552 ?auto_269554 ) ) ( not ( = ?auto_269552 ?auto_269555 ) ) ( not ( = ?auto_269552 ?auto_269556 ) ) ( not ( = ?auto_269552 ?auto_269557 ) ) ( not ( = ?auto_269552 ?auto_269558 ) ) ( not ( = ?auto_269552 ?auto_269559 ) ) ( not ( = ?auto_269552 ?auto_269560 ) ) ( not ( = ?auto_269552 ?auto_269561 ) ) ( not ( = ?auto_269552 ?auto_269562 ) ) ( not ( = ?auto_269553 ?auto_269554 ) ) ( not ( = ?auto_269553 ?auto_269555 ) ) ( not ( = ?auto_269553 ?auto_269556 ) ) ( not ( = ?auto_269553 ?auto_269557 ) ) ( not ( = ?auto_269553 ?auto_269558 ) ) ( not ( = ?auto_269553 ?auto_269559 ) ) ( not ( = ?auto_269553 ?auto_269560 ) ) ( not ( = ?auto_269553 ?auto_269561 ) ) ( not ( = ?auto_269553 ?auto_269562 ) ) ( not ( = ?auto_269554 ?auto_269555 ) ) ( not ( = ?auto_269554 ?auto_269556 ) ) ( not ( = ?auto_269554 ?auto_269557 ) ) ( not ( = ?auto_269554 ?auto_269558 ) ) ( not ( = ?auto_269554 ?auto_269559 ) ) ( not ( = ?auto_269554 ?auto_269560 ) ) ( not ( = ?auto_269554 ?auto_269561 ) ) ( not ( = ?auto_269554 ?auto_269562 ) ) ( not ( = ?auto_269555 ?auto_269556 ) ) ( not ( = ?auto_269555 ?auto_269557 ) ) ( not ( = ?auto_269555 ?auto_269558 ) ) ( not ( = ?auto_269555 ?auto_269559 ) ) ( not ( = ?auto_269555 ?auto_269560 ) ) ( not ( = ?auto_269555 ?auto_269561 ) ) ( not ( = ?auto_269555 ?auto_269562 ) ) ( not ( = ?auto_269556 ?auto_269557 ) ) ( not ( = ?auto_269556 ?auto_269558 ) ) ( not ( = ?auto_269556 ?auto_269559 ) ) ( not ( = ?auto_269556 ?auto_269560 ) ) ( not ( = ?auto_269556 ?auto_269561 ) ) ( not ( = ?auto_269556 ?auto_269562 ) ) ( not ( = ?auto_269557 ?auto_269558 ) ) ( not ( = ?auto_269557 ?auto_269559 ) ) ( not ( = ?auto_269557 ?auto_269560 ) ) ( not ( = ?auto_269557 ?auto_269561 ) ) ( not ( = ?auto_269557 ?auto_269562 ) ) ( not ( = ?auto_269558 ?auto_269559 ) ) ( not ( = ?auto_269558 ?auto_269560 ) ) ( not ( = ?auto_269558 ?auto_269561 ) ) ( not ( = ?auto_269558 ?auto_269562 ) ) ( not ( = ?auto_269559 ?auto_269560 ) ) ( not ( = ?auto_269559 ?auto_269561 ) ) ( not ( = ?auto_269559 ?auto_269562 ) ) ( not ( = ?auto_269560 ?auto_269561 ) ) ( not ( = ?auto_269560 ?auto_269562 ) ) ( not ( = ?auto_269561 ?auto_269562 ) ) ( ON ?auto_269560 ?auto_269561 ) ( ON ?auto_269559 ?auto_269560 ) ( ON ?auto_269558 ?auto_269559 ) ( ON ?auto_269557 ?auto_269558 ) ( ON ?auto_269556 ?auto_269557 ) ( ON ?auto_269555 ?auto_269556 ) ( ON ?auto_269554 ?auto_269555 ) ( CLEAR ?auto_269552 ) ( ON ?auto_269553 ?auto_269554 ) ( CLEAR ?auto_269553 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_269552 ?auto_269553 )
      ( MAKE-10PILE ?auto_269552 ?auto_269553 ?auto_269554 ?auto_269555 ?auto_269556 ?auto_269557 ?auto_269558 ?auto_269559 ?auto_269560 ?auto_269561 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_269573 - BLOCK
      ?auto_269574 - BLOCK
      ?auto_269575 - BLOCK
      ?auto_269576 - BLOCK
      ?auto_269577 - BLOCK
      ?auto_269578 - BLOCK
      ?auto_269579 - BLOCK
      ?auto_269580 - BLOCK
      ?auto_269581 - BLOCK
      ?auto_269582 - BLOCK
    )
    :vars
    (
      ?auto_269583 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_269582 ?auto_269583 ) ( ON-TABLE ?auto_269573 ) ( not ( = ?auto_269573 ?auto_269574 ) ) ( not ( = ?auto_269573 ?auto_269575 ) ) ( not ( = ?auto_269573 ?auto_269576 ) ) ( not ( = ?auto_269573 ?auto_269577 ) ) ( not ( = ?auto_269573 ?auto_269578 ) ) ( not ( = ?auto_269573 ?auto_269579 ) ) ( not ( = ?auto_269573 ?auto_269580 ) ) ( not ( = ?auto_269573 ?auto_269581 ) ) ( not ( = ?auto_269573 ?auto_269582 ) ) ( not ( = ?auto_269573 ?auto_269583 ) ) ( not ( = ?auto_269574 ?auto_269575 ) ) ( not ( = ?auto_269574 ?auto_269576 ) ) ( not ( = ?auto_269574 ?auto_269577 ) ) ( not ( = ?auto_269574 ?auto_269578 ) ) ( not ( = ?auto_269574 ?auto_269579 ) ) ( not ( = ?auto_269574 ?auto_269580 ) ) ( not ( = ?auto_269574 ?auto_269581 ) ) ( not ( = ?auto_269574 ?auto_269582 ) ) ( not ( = ?auto_269574 ?auto_269583 ) ) ( not ( = ?auto_269575 ?auto_269576 ) ) ( not ( = ?auto_269575 ?auto_269577 ) ) ( not ( = ?auto_269575 ?auto_269578 ) ) ( not ( = ?auto_269575 ?auto_269579 ) ) ( not ( = ?auto_269575 ?auto_269580 ) ) ( not ( = ?auto_269575 ?auto_269581 ) ) ( not ( = ?auto_269575 ?auto_269582 ) ) ( not ( = ?auto_269575 ?auto_269583 ) ) ( not ( = ?auto_269576 ?auto_269577 ) ) ( not ( = ?auto_269576 ?auto_269578 ) ) ( not ( = ?auto_269576 ?auto_269579 ) ) ( not ( = ?auto_269576 ?auto_269580 ) ) ( not ( = ?auto_269576 ?auto_269581 ) ) ( not ( = ?auto_269576 ?auto_269582 ) ) ( not ( = ?auto_269576 ?auto_269583 ) ) ( not ( = ?auto_269577 ?auto_269578 ) ) ( not ( = ?auto_269577 ?auto_269579 ) ) ( not ( = ?auto_269577 ?auto_269580 ) ) ( not ( = ?auto_269577 ?auto_269581 ) ) ( not ( = ?auto_269577 ?auto_269582 ) ) ( not ( = ?auto_269577 ?auto_269583 ) ) ( not ( = ?auto_269578 ?auto_269579 ) ) ( not ( = ?auto_269578 ?auto_269580 ) ) ( not ( = ?auto_269578 ?auto_269581 ) ) ( not ( = ?auto_269578 ?auto_269582 ) ) ( not ( = ?auto_269578 ?auto_269583 ) ) ( not ( = ?auto_269579 ?auto_269580 ) ) ( not ( = ?auto_269579 ?auto_269581 ) ) ( not ( = ?auto_269579 ?auto_269582 ) ) ( not ( = ?auto_269579 ?auto_269583 ) ) ( not ( = ?auto_269580 ?auto_269581 ) ) ( not ( = ?auto_269580 ?auto_269582 ) ) ( not ( = ?auto_269580 ?auto_269583 ) ) ( not ( = ?auto_269581 ?auto_269582 ) ) ( not ( = ?auto_269581 ?auto_269583 ) ) ( not ( = ?auto_269582 ?auto_269583 ) ) ( ON ?auto_269581 ?auto_269582 ) ( ON ?auto_269580 ?auto_269581 ) ( ON ?auto_269579 ?auto_269580 ) ( ON ?auto_269578 ?auto_269579 ) ( ON ?auto_269577 ?auto_269578 ) ( ON ?auto_269576 ?auto_269577 ) ( ON ?auto_269575 ?auto_269576 ) ( CLEAR ?auto_269573 ) ( ON ?auto_269574 ?auto_269575 ) ( CLEAR ?auto_269574 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_269573 ?auto_269574 )
      ( MAKE-10PILE ?auto_269573 ?auto_269574 ?auto_269575 ?auto_269576 ?auto_269577 ?auto_269578 ?auto_269579 ?auto_269580 ?auto_269581 ?auto_269582 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_269594 - BLOCK
      ?auto_269595 - BLOCK
      ?auto_269596 - BLOCK
      ?auto_269597 - BLOCK
      ?auto_269598 - BLOCK
      ?auto_269599 - BLOCK
      ?auto_269600 - BLOCK
      ?auto_269601 - BLOCK
      ?auto_269602 - BLOCK
      ?auto_269603 - BLOCK
    )
    :vars
    (
      ?auto_269604 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_269603 ?auto_269604 ) ( not ( = ?auto_269594 ?auto_269595 ) ) ( not ( = ?auto_269594 ?auto_269596 ) ) ( not ( = ?auto_269594 ?auto_269597 ) ) ( not ( = ?auto_269594 ?auto_269598 ) ) ( not ( = ?auto_269594 ?auto_269599 ) ) ( not ( = ?auto_269594 ?auto_269600 ) ) ( not ( = ?auto_269594 ?auto_269601 ) ) ( not ( = ?auto_269594 ?auto_269602 ) ) ( not ( = ?auto_269594 ?auto_269603 ) ) ( not ( = ?auto_269594 ?auto_269604 ) ) ( not ( = ?auto_269595 ?auto_269596 ) ) ( not ( = ?auto_269595 ?auto_269597 ) ) ( not ( = ?auto_269595 ?auto_269598 ) ) ( not ( = ?auto_269595 ?auto_269599 ) ) ( not ( = ?auto_269595 ?auto_269600 ) ) ( not ( = ?auto_269595 ?auto_269601 ) ) ( not ( = ?auto_269595 ?auto_269602 ) ) ( not ( = ?auto_269595 ?auto_269603 ) ) ( not ( = ?auto_269595 ?auto_269604 ) ) ( not ( = ?auto_269596 ?auto_269597 ) ) ( not ( = ?auto_269596 ?auto_269598 ) ) ( not ( = ?auto_269596 ?auto_269599 ) ) ( not ( = ?auto_269596 ?auto_269600 ) ) ( not ( = ?auto_269596 ?auto_269601 ) ) ( not ( = ?auto_269596 ?auto_269602 ) ) ( not ( = ?auto_269596 ?auto_269603 ) ) ( not ( = ?auto_269596 ?auto_269604 ) ) ( not ( = ?auto_269597 ?auto_269598 ) ) ( not ( = ?auto_269597 ?auto_269599 ) ) ( not ( = ?auto_269597 ?auto_269600 ) ) ( not ( = ?auto_269597 ?auto_269601 ) ) ( not ( = ?auto_269597 ?auto_269602 ) ) ( not ( = ?auto_269597 ?auto_269603 ) ) ( not ( = ?auto_269597 ?auto_269604 ) ) ( not ( = ?auto_269598 ?auto_269599 ) ) ( not ( = ?auto_269598 ?auto_269600 ) ) ( not ( = ?auto_269598 ?auto_269601 ) ) ( not ( = ?auto_269598 ?auto_269602 ) ) ( not ( = ?auto_269598 ?auto_269603 ) ) ( not ( = ?auto_269598 ?auto_269604 ) ) ( not ( = ?auto_269599 ?auto_269600 ) ) ( not ( = ?auto_269599 ?auto_269601 ) ) ( not ( = ?auto_269599 ?auto_269602 ) ) ( not ( = ?auto_269599 ?auto_269603 ) ) ( not ( = ?auto_269599 ?auto_269604 ) ) ( not ( = ?auto_269600 ?auto_269601 ) ) ( not ( = ?auto_269600 ?auto_269602 ) ) ( not ( = ?auto_269600 ?auto_269603 ) ) ( not ( = ?auto_269600 ?auto_269604 ) ) ( not ( = ?auto_269601 ?auto_269602 ) ) ( not ( = ?auto_269601 ?auto_269603 ) ) ( not ( = ?auto_269601 ?auto_269604 ) ) ( not ( = ?auto_269602 ?auto_269603 ) ) ( not ( = ?auto_269602 ?auto_269604 ) ) ( not ( = ?auto_269603 ?auto_269604 ) ) ( ON ?auto_269602 ?auto_269603 ) ( ON ?auto_269601 ?auto_269602 ) ( ON ?auto_269600 ?auto_269601 ) ( ON ?auto_269599 ?auto_269600 ) ( ON ?auto_269598 ?auto_269599 ) ( ON ?auto_269597 ?auto_269598 ) ( ON ?auto_269596 ?auto_269597 ) ( ON ?auto_269595 ?auto_269596 ) ( ON ?auto_269594 ?auto_269595 ) ( CLEAR ?auto_269594 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_269594 )
      ( MAKE-10PILE ?auto_269594 ?auto_269595 ?auto_269596 ?auto_269597 ?auto_269598 ?auto_269599 ?auto_269600 ?auto_269601 ?auto_269602 ?auto_269603 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_269615 - BLOCK
      ?auto_269616 - BLOCK
      ?auto_269617 - BLOCK
      ?auto_269618 - BLOCK
      ?auto_269619 - BLOCK
      ?auto_269620 - BLOCK
      ?auto_269621 - BLOCK
      ?auto_269622 - BLOCK
      ?auto_269623 - BLOCK
      ?auto_269624 - BLOCK
    )
    :vars
    (
      ?auto_269625 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_269624 ?auto_269625 ) ( not ( = ?auto_269615 ?auto_269616 ) ) ( not ( = ?auto_269615 ?auto_269617 ) ) ( not ( = ?auto_269615 ?auto_269618 ) ) ( not ( = ?auto_269615 ?auto_269619 ) ) ( not ( = ?auto_269615 ?auto_269620 ) ) ( not ( = ?auto_269615 ?auto_269621 ) ) ( not ( = ?auto_269615 ?auto_269622 ) ) ( not ( = ?auto_269615 ?auto_269623 ) ) ( not ( = ?auto_269615 ?auto_269624 ) ) ( not ( = ?auto_269615 ?auto_269625 ) ) ( not ( = ?auto_269616 ?auto_269617 ) ) ( not ( = ?auto_269616 ?auto_269618 ) ) ( not ( = ?auto_269616 ?auto_269619 ) ) ( not ( = ?auto_269616 ?auto_269620 ) ) ( not ( = ?auto_269616 ?auto_269621 ) ) ( not ( = ?auto_269616 ?auto_269622 ) ) ( not ( = ?auto_269616 ?auto_269623 ) ) ( not ( = ?auto_269616 ?auto_269624 ) ) ( not ( = ?auto_269616 ?auto_269625 ) ) ( not ( = ?auto_269617 ?auto_269618 ) ) ( not ( = ?auto_269617 ?auto_269619 ) ) ( not ( = ?auto_269617 ?auto_269620 ) ) ( not ( = ?auto_269617 ?auto_269621 ) ) ( not ( = ?auto_269617 ?auto_269622 ) ) ( not ( = ?auto_269617 ?auto_269623 ) ) ( not ( = ?auto_269617 ?auto_269624 ) ) ( not ( = ?auto_269617 ?auto_269625 ) ) ( not ( = ?auto_269618 ?auto_269619 ) ) ( not ( = ?auto_269618 ?auto_269620 ) ) ( not ( = ?auto_269618 ?auto_269621 ) ) ( not ( = ?auto_269618 ?auto_269622 ) ) ( not ( = ?auto_269618 ?auto_269623 ) ) ( not ( = ?auto_269618 ?auto_269624 ) ) ( not ( = ?auto_269618 ?auto_269625 ) ) ( not ( = ?auto_269619 ?auto_269620 ) ) ( not ( = ?auto_269619 ?auto_269621 ) ) ( not ( = ?auto_269619 ?auto_269622 ) ) ( not ( = ?auto_269619 ?auto_269623 ) ) ( not ( = ?auto_269619 ?auto_269624 ) ) ( not ( = ?auto_269619 ?auto_269625 ) ) ( not ( = ?auto_269620 ?auto_269621 ) ) ( not ( = ?auto_269620 ?auto_269622 ) ) ( not ( = ?auto_269620 ?auto_269623 ) ) ( not ( = ?auto_269620 ?auto_269624 ) ) ( not ( = ?auto_269620 ?auto_269625 ) ) ( not ( = ?auto_269621 ?auto_269622 ) ) ( not ( = ?auto_269621 ?auto_269623 ) ) ( not ( = ?auto_269621 ?auto_269624 ) ) ( not ( = ?auto_269621 ?auto_269625 ) ) ( not ( = ?auto_269622 ?auto_269623 ) ) ( not ( = ?auto_269622 ?auto_269624 ) ) ( not ( = ?auto_269622 ?auto_269625 ) ) ( not ( = ?auto_269623 ?auto_269624 ) ) ( not ( = ?auto_269623 ?auto_269625 ) ) ( not ( = ?auto_269624 ?auto_269625 ) ) ( ON ?auto_269623 ?auto_269624 ) ( ON ?auto_269622 ?auto_269623 ) ( ON ?auto_269621 ?auto_269622 ) ( ON ?auto_269620 ?auto_269621 ) ( ON ?auto_269619 ?auto_269620 ) ( ON ?auto_269618 ?auto_269619 ) ( ON ?auto_269617 ?auto_269618 ) ( ON ?auto_269616 ?auto_269617 ) ( ON ?auto_269615 ?auto_269616 ) ( CLEAR ?auto_269615 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_269615 )
      ( MAKE-10PILE ?auto_269615 ?auto_269616 ?auto_269617 ?auto_269618 ?auto_269619 ?auto_269620 ?auto_269621 ?auto_269622 ?auto_269623 ?auto_269624 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_269637 - BLOCK
      ?auto_269638 - BLOCK
      ?auto_269639 - BLOCK
      ?auto_269640 - BLOCK
      ?auto_269641 - BLOCK
      ?auto_269642 - BLOCK
      ?auto_269643 - BLOCK
      ?auto_269644 - BLOCK
      ?auto_269645 - BLOCK
      ?auto_269646 - BLOCK
      ?auto_269647 - BLOCK
    )
    :vars
    (
      ?auto_269648 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_269646 ) ( ON ?auto_269647 ?auto_269648 ) ( CLEAR ?auto_269647 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_269637 ) ( ON ?auto_269638 ?auto_269637 ) ( ON ?auto_269639 ?auto_269638 ) ( ON ?auto_269640 ?auto_269639 ) ( ON ?auto_269641 ?auto_269640 ) ( ON ?auto_269642 ?auto_269641 ) ( ON ?auto_269643 ?auto_269642 ) ( ON ?auto_269644 ?auto_269643 ) ( ON ?auto_269645 ?auto_269644 ) ( ON ?auto_269646 ?auto_269645 ) ( not ( = ?auto_269637 ?auto_269638 ) ) ( not ( = ?auto_269637 ?auto_269639 ) ) ( not ( = ?auto_269637 ?auto_269640 ) ) ( not ( = ?auto_269637 ?auto_269641 ) ) ( not ( = ?auto_269637 ?auto_269642 ) ) ( not ( = ?auto_269637 ?auto_269643 ) ) ( not ( = ?auto_269637 ?auto_269644 ) ) ( not ( = ?auto_269637 ?auto_269645 ) ) ( not ( = ?auto_269637 ?auto_269646 ) ) ( not ( = ?auto_269637 ?auto_269647 ) ) ( not ( = ?auto_269637 ?auto_269648 ) ) ( not ( = ?auto_269638 ?auto_269639 ) ) ( not ( = ?auto_269638 ?auto_269640 ) ) ( not ( = ?auto_269638 ?auto_269641 ) ) ( not ( = ?auto_269638 ?auto_269642 ) ) ( not ( = ?auto_269638 ?auto_269643 ) ) ( not ( = ?auto_269638 ?auto_269644 ) ) ( not ( = ?auto_269638 ?auto_269645 ) ) ( not ( = ?auto_269638 ?auto_269646 ) ) ( not ( = ?auto_269638 ?auto_269647 ) ) ( not ( = ?auto_269638 ?auto_269648 ) ) ( not ( = ?auto_269639 ?auto_269640 ) ) ( not ( = ?auto_269639 ?auto_269641 ) ) ( not ( = ?auto_269639 ?auto_269642 ) ) ( not ( = ?auto_269639 ?auto_269643 ) ) ( not ( = ?auto_269639 ?auto_269644 ) ) ( not ( = ?auto_269639 ?auto_269645 ) ) ( not ( = ?auto_269639 ?auto_269646 ) ) ( not ( = ?auto_269639 ?auto_269647 ) ) ( not ( = ?auto_269639 ?auto_269648 ) ) ( not ( = ?auto_269640 ?auto_269641 ) ) ( not ( = ?auto_269640 ?auto_269642 ) ) ( not ( = ?auto_269640 ?auto_269643 ) ) ( not ( = ?auto_269640 ?auto_269644 ) ) ( not ( = ?auto_269640 ?auto_269645 ) ) ( not ( = ?auto_269640 ?auto_269646 ) ) ( not ( = ?auto_269640 ?auto_269647 ) ) ( not ( = ?auto_269640 ?auto_269648 ) ) ( not ( = ?auto_269641 ?auto_269642 ) ) ( not ( = ?auto_269641 ?auto_269643 ) ) ( not ( = ?auto_269641 ?auto_269644 ) ) ( not ( = ?auto_269641 ?auto_269645 ) ) ( not ( = ?auto_269641 ?auto_269646 ) ) ( not ( = ?auto_269641 ?auto_269647 ) ) ( not ( = ?auto_269641 ?auto_269648 ) ) ( not ( = ?auto_269642 ?auto_269643 ) ) ( not ( = ?auto_269642 ?auto_269644 ) ) ( not ( = ?auto_269642 ?auto_269645 ) ) ( not ( = ?auto_269642 ?auto_269646 ) ) ( not ( = ?auto_269642 ?auto_269647 ) ) ( not ( = ?auto_269642 ?auto_269648 ) ) ( not ( = ?auto_269643 ?auto_269644 ) ) ( not ( = ?auto_269643 ?auto_269645 ) ) ( not ( = ?auto_269643 ?auto_269646 ) ) ( not ( = ?auto_269643 ?auto_269647 ) ) ( not ( = ?auto_269643 ?auto_269648 ) ) ( not ( = ?auto_269644 ?auto_269645 ) ) ( not ( = ?auto_269644 ?auto_269646 ) ) ( not ( = ?auto_269644 ?auto_269647 ) ) ( not ( = ?auto_269644 ?auto_269648 ) ) ( not ( = ?auto_269645 ?auto_269646 ) ) ( not ( = ?auto_269645 ?auto_269647 ) ) ( not ( = ?auto_269645 ?auto_269648 ) ) ( not ( = ?auto_269646 ?auto_269647 ) ) ( not ( = ?auto_269646 ?auto_269648 ) ) ( not ( = ?auto_269647 ?auto_269648 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_269647 ?auto_269648 )
      ( !STACK ?auto_269647 ?auto_269646 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_269660 - BLOCK
      ?auto_269661 - BLOCK
      ?auto_269662 - BLOCK
      ?auto_269663 - BLOCK
      ?auto_269664 - BLOCK
      ?auto_269665 - BLOCK
      ?auto_269666 - BLOCK
      ?auto_269667 - BLOCK
      ?auto_269668 - BLOCK
      ?auto_269669 - BLOCK
      ?auto_269670 - BLOCK
    )
    :vars
    (
      ?auto_269671 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_269669 ) ( ON ?auto_269670 ?auto_269671 ) ( CLEAR ?auto_269670 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_269660 ) ( ON ?auto_269661 ?auto_269660 ) ( ON ?auto_269662 ?auto_269661 ) ( ON ?auto_269663 ?auto_269662 ) ( ON ?auto_269664 ?auto_269663 ) ( ON ?auto_269665 ?auto_269664 ) ( ON ?auto_269666 ?auto_269665 ) ( ON ?auto_269667 ?auto_269666 ) ( ON ?auto_269668 ?auto_269667 ) ( ON ?auto_269669 ?auto_269668 ) ( not ( = ?auto_269660 ?auto_269661 ) ) ( not ( = ?auto_269660 ?auto_269662 ) ) ( not ( = ?auto_269660 ?auto_269663 ) ) ( not ( = ?auto_269660 ?auto_269664 ) ) ( not ( = ?auto_269660 ?auto_269665 ) ) ( not ( = ?auto_269660 ?auto_269666 ) ) ( not ( = ?auto_269660 ?auto_269667 ) ) ( not ( = ?auto_269660 ?auto_269668 ) ) ( not ( = ?auto_269660 ?auto_269669 ) ) ( not ( = ?auto_269660 ?auto_269670 ) ) ( not ( = ?auto_269660 ?auto_269671 ) ) ( not ( = ?auto_269661 ?auto_269662 ) ) ( not ( = ?auto_269661 ?auto_269663 ) ) ( not ( = ?auto_269661 ?auto_269664 ) ) ( not ( = ?auto_269661 ?auto_269665 ) ) ( not ( = ?auto_269661 ?auto_269666 ) ) ( not ( = ?auto_269661 ?auto_269667 ) ) ( not ( = ?auto_269661 ?auto_269668 ) ) ( not ( = ?auto_269661 ?auto_269669 ) ) ( not ( = ?auto_269661 ?auto_269670 ) ) ( not ( = ?auto_269661 ?auto_269671 ) ) ( not ( = ?auto_269662 ?auto_269663 ) ) ( not ( = ?auto_269662 ?auto_269664 ) ) ( not ( = ?auto_269662 ?auto_269665 ) ) ( not ( = ?auto_269662 ?auto_269666 ) ) ( not ( = ?auto_269662 ?auto_269667 ) ) ( not ( = ?auto_269662 ?auto_269668 ) ) ( not ( = ?auto_269662 ?auto_269669 ) ) ( not ( = ?auto_269662 ?auto_269670 ) ) ( not ( = ?auto_269662 ?auto_269671 ) ) ( not ( = ?auto_269663 ?auto_269664 ) ) ( not ( = ?auto_269663 ?auto_269665 ) ) ( not ( = ?auto_269663 ?auto_269666 ) ) ( not ( = ?auto_269663 ?auto_269667 ) ) ( not ( = ?auto_269663 ?auto_269668 ) ) ( not ( = ?auto_269663 ?auto_269669 ) ) ( not ( = ?auto_269663 ?auto_269670 ) ) ( not ( = ?auto_269663 ?auto_269671 ) ) ( not ( = ?auto_269664 ?auto_269665 ) ) ( not ( = ?auto_269664 ?auto_269666 ) ) ( not ( = ?auto_269664 ?auto_269667 ) ) ( not ( = ?auto_269664 ?auto_269668 ) ) ( not ( = ?auto_269664 ?auto_269669 ) ) ( not ( = ?auto_269664 ?auto_269670 ) ) ( not ( = ?auto_269664 ?auto_269671 ) ) ( not ( = ?auto_269665 ?auto_269666 ) ) ( not ( = ?auto_269665 ?auto_269667 ) ) ( not ( = ?auto_269665 ?auto_269668 ) ) ( not ( = ?auto_269665 ?auto_269669 ) ) ( not ( = ?auto_269665 ?auto_269670 ) ) ( not ( = ?auto_269665 ?auto_269671 ) ) ( not ( = ?auto_269666 ?auto_269667 ) ) ( not ( = ?auto_269666 ?auto_269668 ) ) ( not ( = ?auto_269666 ?auto_269669 ) ) ( not ( = ?auto_269666 ?auto_269670 ) ) ( not ( = ?auto_269666 ?auto_269671 ) ) ( not ( = ?auto_269667 ?auto_269668 ) ) ( not ( = ?auto_269667 ?auto_269669 ) ) ( not ( = ?auto_269667 ?auto_269670 ) ) ( not ( = ?auto_269667 ?auto_269671 ) ) ( not ( = ?auto_269668 ?auto_269669 ) ) ( not ( = ?auto_269668 ?auto_269670 ) ) ( not ( = ?auto_269668 ?auto_269671 ) ) ( not ( = ?auto_269669 ?auto_269670 ) ) ( not ( = ?auto_269669 ?auto_269671 ) ) ( not ( = ?auto_269670 ?auto_269671 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_269670 ?auto_269671 )
      ( !STACK ?auto_269670 ?auto_269669 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_269683 - BLOCK
      ?auto_269684 - BLOCK
      ?auto_269685 - BLOCK
      ?auto_269686 - BLOCK
      ?auto_269687 - BLOCK
      ?auto_269688 - BLOCK
      ?auto_269689 - BLOCK
      ?auto_269690 - BLOCK
      ?auto_269691 - BLOCK
      ?auto_269692 - BLOCK
      ?auto_269693 - BLOCK
    )
    :vars
    (
      ?auto_269694 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_269693 ?auto_269694 ) ( ON-TABLE ?auto_269683 ) ( ON ?auto_269684 ?auto_269683 ) ( ON ?auto_269685 ?auto_269684 ) ( ON ?auto_269686 ?auto_269685 ) ( ON ?auto_269687 ?auto_269686 ) ( ON ?auto_269688 ?auto_269687 ) ( ON ?auto_269689 ?auto_269688 ) ( ON ?auto_269690 ?auto_269689 ) ( ON ?auto_269691 ?auto_269690 ) ( not ( = ?auto_269683 ?auto_269684 ) ) ( not ( = ?auto_269683 ?auto_269685 ) ) ( not ( = ?auto_269683 ?auto_269686 ) ) ( not ( = ?auto_269683 ?auto_269687 ) ) ( not ( = ?auto_269683 ?auto_269688 ) ) ( not ( = ?auto_269683 ?auto_269689 ) ) ( not ( = ?auto_269683 ?auto_269690 ) ) ( not ( = ?auto_269683 ?auto_269691 ) ) ( not ( = ?auto_269683 ?auto_269692 ) ) ( not ( = ?auto_269683 ?auto_269693 ) ) ( not ( = ?auto_269683 ?auto_269694 ) ) ( not ( = ?auto_269684 ?auto_269685 ) ) ( not ( = ?auto_269684 ?auto_269686 ) ) ( not ( = ?auto_269684 ?auto_269687 ) ) ( not ( = ?auto_269684 ?auto_269688 ) ) ( not ( = ?auto_269684 ?auto_269689 ) ) ( not ( = ?auto_269684 ?auto_269690 ) ) ( not ( = ?auto_269684 ?auto_269691 ) ) ( not ( = ?auto_269684 ?auto_269692 ) ) ( not ( = ?auto_269684 ?auto_269693 ) ) ( not ( = ?auto_269684 ?auto_269694 ) ) ( not ( = ?auto_269685 ?auto_269686 ) ) ( not ( = ?auto_269685 ?auto_269687 ) ) ( not ( = ?auto_269685 ?auto_269688 ) ) ( not ( = ?auto_269685 ?auto_269689 ) ) ( not ( = ?auto_269685 ?auto_269690 ) ) ( not ( = ?auto_269685 ?auto_269691 ) ) ( not ( = ?auto_269685 ?auto_269692 ) ) ( not ( = ?auto_269685 ?auto_269693 ) ) ( not ( = ?auto_269685 ?auto_269694 ) ) ( not ( = ?auto_269686 ?auto_269687 ) ) ( not ( = ?auto_269686 ?auto_269688 ) ) ( not ( = ?auto_269686 ?auto_269689 ) ) ( not ( = ?auto_269686 ?auto_269690 ) ) ( not ( = ?auto_269686 ?auto_269691 ) ) ( not ( = ?auto_269686 ?auto_269692 ) ) ( not ( = ?auto_269686 ?auto_269693 ) ) ( not ( = ?auto_269686 ?auto_269694 ) ) ( not ( = ?auto_269687 ?auto_269688 ) ) ( not ( = ?auto_269687 ?auto_269689 ) ) ( not ( = ?auto_269687 ?auto_269690 ) ) ( not ( = ?auto_269687 ?auto_269691 ) ) ( not ( = ?auto_269687 ?auto_269692 ) ) ( not ( = ?auto_269687 ?auto_269693 ) ) ( not ( = ?auto_269687 ?auto_269694 ) ) ( not ( = ?auto_269688 ?auto_269689 ) ) ( not ( = ?auto_269688 ?auto_269690 ) ) ( not ( = ?auto_269688 ?auto_269691 ) ) ( not ( = ?auto_269688 ?auto_269692 ) ) ( not ( = ?auto_269688 ?auto_269693 ) ) ( not ( = ?auto_269688 ?auto_269694 ) ) ( not ( = ?auto_269689 ?auto_269690 ) ) ( not ( = ?auto_269689 ?auto_269691 ) ) ( not ( = ?auto_269689 ?auto_269692 ) ) ( not ( = ?auto_269689 ?auto_269693 ) ) ( not ( = ?auto_269689 ?auto_269694 ) ) ( not ( = ?auto_269690 ?auto_269691 ) ) ( not ( = ?auto_269690 ?auto_269692 ) ) ( not ( = ?auto_269690 ?auto_269693 ) ) ( not ( = ?auto_269690 ?auto_269694 ) ) ( not ( = ?auto_269691 ?auto_269692 ) ) ( not ( = ?auto_269691 ?auto_269693 ) ) ( not ( = ?auto_269691 ?auto_269694 ) ) ( not ( = ?auto_269692 ?auto_269693 ) ) ( not ( = ?auto_269692 ?auto_269694 ) ) ( not ( = ?auto_269693 ?auto_269694 ) ) ( CLEAR ?auto_269691 ) ( ON ?auto_269692 ?auto_269693 ) ( CLEAR ?auto_269692 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_269683 ?auto_269684 ?auto_269685 ?auto_269686 ?auto_269687 ?auto_269688 ?auto_269689 ?auto_269690 ?auto_269691 ?auto_269692 )
      ( MAKE-11PILE ?auto_269683 ?auto_269684 ?auto_269685 ?auto_269686 ?auto_269687 ?auto_269688 ?auto_269689 ?auto_269690 ?auto_269691 ?auto_269692 ?auto_269693 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_269706 - BLOCK
      ?auto_269707 - BLOCK
      ?auto_269708 - BLOCK
      ?auto_269709 - BLOCK
      ?auto_269710 - BLOCK
      ?auto_269711 - BLOCK
      ?auto_269712 - BLOCK
      ?auto_269713 - BLOCK
      ?auto_269714 - BLOCK
      ?auto_269715 - BLOCK
      ?auto_269716 - BLOCK
    )
    :vars
    (
      ?auto_269717 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_269716 ?auto_269717 ) ( ON-TABLE ?auto_269706 ) ( ON ?auto_269707 ?auto_269706 ) ( ON ?auto_269708 ?auto_269707 ) ( ON ?auto_269709 ?auto_269708 ) ( ON ?auto_269710 ?auto_269709 ) ( ON ?auto_269711 ?auto_269710 ) ( ON ?auto_269712 ?auto_269711 ) ( ON ?auto_269713 ?auto_269712 ) ( ON ?auto_269714 ?auto_269713 ) ( not ( = ?auto_269706 ?auto_269707 ) ) ( not ( = ?auto_269706 ?auto_269708 ) ) ( not ( = ?auto_269706 ?auto_269709 ) ) ( not ( = ?auto_269706 ?auto_269710 ) ) ( not ( = ?auto_269706 ?auto_269711 ) ) ( not ( = ?auto_269706 ?auto_269712 ) ) ( not ( = ?auto_269706 ?auto_269713 ) ) ( not ( = ?auto_269706 ?auto_269714 ) ) ( not ( = ?auto_269706 ?auto_269715 ) ) ( not ( = ?auto_269706 ?auto_269716 ) ) ( not ( = ?auto_269706 ?auto_269717 ) ) ( not ( = ?auto_269707 ?auto_269708 ) ) ( not ( = ?auto_269707 ?auto_269709 ) ) ( not ( = ?auto_269707 ?auto_269710 ) ) ( not ( = ?auto_269707 ?auto_269711 ) ) ( not ( = ?auto_269707 ?auto_269712 ) ) ( not ( = ?auto_269707 ?auto_269713 ) ) ( not ( = ?auto_269707 ?auto_269714 ) ) ( not ( = ?auto_269707 ?auto_269715 ) ) ( not ( = ?auto_269707 ?auto_269716 ) ) ( not ( = ?auto_269707 ?auto_269717 ) ) ( not ( = ?auto_269708 ?auto_269709 ) ) ( not ( = ?auto_269708 ?auto_269710 ) ) ( not ( = ?auto_269708 ?auto_269711 ) ) ( not ( = ?auto_269708 ?auto_269712 ) ) ( not ( = ?auto_269708 ?auto_269713 ) ) ( not ( = ?auto_269708 ?auto_269714 ) ) ( not ( = ?auto_269708 ?auto_269715 ) ) ( not ( = ?auto_269708 ?auto_269716 ) ) ( not ( = ?auto_269708 ?auto_269717 ) ) ( not ( = ?auto_269709 ?auto_269710 ) ) ( not ( = ?auto_269709 ?auto_269711 ) ) ( not ( = ?auto_269709 ?auto_269712 ) ) ( not ( = ?auto_269709 ?auto_269713 ) ) ( not ( = ?auto_269709 ?auto_269714 ) ) ( not ( = ?auto_269709 ?auto_269715 ) ) ( not ( = ?auto_269709 ?auto_269716 ) ) ( not ( = ?auto_269709 ?auto_269717 ) ) ( not ( = ?auto_269710 ?auto_269711 ) ) ( not ( = ?auto_269710 ?auto_269712 ) ) ( not ( = ?auto_269710 ?auto_269713 ) ) ( not ( = ?auto_269710 ?auto_269714 ) ) ( not ( = ?auto_269710 ?auto_269715 ) ) ( not ( = ?auto_269710 ?auto_269716 ) ) ( not ( = ?auto_269710 ?auto_269717 ) ) ( not ( = ?auto_269711 ?auto_269712 ) ) ( not ( = ?auto_269711 ?auto_269713 ) ) ( not ( = ?auto_269711 ?auto_269714 ) ) ( not ( = ?auto_269711 ?auto_269715 ) ) ( not ( = ?auto_269711 ?auto_269716 ) ) ( not ( = ?auto_269711 ?auto_269717 ) ) ( not ( = ?auto_269712 ?auto_269713 ) ) ( not ( = ?auto_269712 ?auto_269714 ) ) ( not ( = ?auto_269712 ?auto_269715 ) ) ( not ( = ?auto_269712 ?auto_269716 ) ) ( not ( = ?auto_269712 ?auto_269717 ) ) ( not ( = ?auto_269713 ?auto_269714 ) ) ( not ( = ?auto_269713 ?auto_269715 ) ) ( not ( = ?auto_269713 ?auto_269716 ) ) ( not ( = ?auto_269713 ?auto_269717 ) ) ( not ( = ?auto_269714 ?auto_269715 ) ) ( not ( = ?auto_269714 ?auto_269716 ) ) ( not ( = ?auto_269714 ?auto_269717 ) ) ( not ( = ?auto_269715 ?auto_269716 ) ) ( not ( = ?auto_269715 ?auto_269717 ) ) ( not ( = ?auto_269716 ?auto_269717 ) ) ( CLEAR ?auto_269714 ) ( ON ?auto_269715 ?auto_269716 ) ( CLEAR ?auto_269715 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_269706 ?auto_269707 ?auto_269708 ?auto_269709 ?auto_269710 ?auto_269711 ?auto_269712 ?auto_269713 ?auto_269714 ?auto_269715 )
      ( MAKE-11PILE ?auto_269706 ?auto_269707 ?auto_269708 ?auto_269709 ?auto_269710 ?auto_269711 ?auto_269712 ?auto_269713 ?auto_269714 ?auto_269715 ?auto_269716 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_269729 - BLOCK
      ?auto_269730 - BLOCK
      ?auto_269731 - BLOCK
      ?auto_269732 - BLOCK
      ?auto_269733 - BLOCK
      ?auto_269734 - BLOCK
      ?auto_269735 - BLOCK
      ?auto_269736 - BLOCK
      ?auto_269737 - BLOCK
      ?auto_269738 - BLOCK
      ?auto_269739 - BLOCK
    )
    :vars
    (
      ?auto_269740 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_269739 ?auto_269740 ) ( ON-TABLE ?auto_269729 ) ( ON ?auto_269730 ?auto_269729 ) ( ON ?auto_269731 ?auto_269730 ) ( ON ?auto_269732 ?auto_269731 ) ( ON ?auto_269733 ?auto_269732 ) ( ON ?auto_269734 ?auto_269733 ) ( ON ?auto_269735 ?auto_269734 ) ( ON ?auto_269736 ?auto_269735 ) ( not ( = ?auto_269729 ?auto_269730 ) ) ( not ( = ?auto_269729 ?auto_269731 ) ) ( not ( = ?auto_269729 ?auto_269732 ) ) ( not ( = ?auto_269729 ?auto_269733 ) ) ( not ( = ?auto_269729 ?auto_269734 ) ) ( not ( = ?auto_269729 ?auto_269735 ) ) ( not ( = ?auto_269729 ?auto_269736 ) ) ( not ( = ?auto_269729 ?auto_269737 ) ) ( not ( = ?auto_269729 ?auto_269738 ) ) ( not ( = ?auto_269729 ?auto_269739 ) ) ( not ( = ?auto_269729 ?auto_269740 ) ) ( not ( = ?auto_269730 ?auto_269731 ) ) ( not ( = ?auto_269730 ?auto_269732 ) ) ( not ( = ?auto_269730 ?auto_269733 ) ) ( not ( = ?auto_269730 ?auto_269734 ) ) ( not ( = ?auto_269730 ?auto_269735 ) ) ( not ( = ?auto_269730 ?auto_269736 ) ) ( not ( = ?auto_269730 ?auto_269737 ) ) ( not ( = ?auto_269730 ?auto_269738 ) ) ( not ( = ?auto_269730 ?auto_269739 ) ) ( not ( = ?auto_269730 ?auto_269740 ) ) ( not ( = ?auto_269731 ?auto_269732 ) ) ( not ( = ?auto_269731 ?auto_269733 ) ) ( not ( = ?auto_269731 ?auto_269734 ) ) ( not ( = ?auto_269731 ?auto_269735 ) ) ( not ( = ?auto_269731 ?auto_269736 ) ) ( not ( = ?auto_269731 ?auto_269737 ) ) ( not ( = ?auto_269731 ?auto_269738 ) ) ( not ( = ?auto_269731 ?auto_269739 ) ) ( not ( = ?auto_269731 ?auto_269740 ) ) ( not ( = ?auto_269732 ?auto_269733 ) ) ( not ( = ?auto_269732 ?auto_269734 ) ) ( not ( = ?auto_269732 ?auto_269735 ) ) ( not ( = ?auto_269732 ?auto_269736 ) ) ( not ( = ?auto_269732 ?auto_269737 ) ) ( not ( = ?auto_269732 ?auto_269738 ) ) ( not ( = ?auto_269732 ?auto_269739 ) ) ( not ( = ?auto_269732 ?auto_269740 ) ) ( not ( = ?auto_269733 ?auto_269734 ) ) ( not ( = ?auto_269733 ?auto_269735 ) ) ( not ( = ?auto_269733 ?auto_269736 ) ) ( not ( = ?auto_269733 ?auto_269737 ) ) ( not ( = ?auto_269733 ?auto_269738 ) ) ( not ( = ?auto_269733 ?auto_269739 ) ) ( not ( = ?auto_269733 ?auto_269740 ) ) ( not ( = ?auto_269734 ?auto_269735 ) ) ( not ( = ?auto_269734 ?auto_269736 ) ) ( not ( = ?auto_269734 ?auto_269737 ) ) ( not ( = ?auto_269734 ?auto_269738 ) ) ( not ( = ?auto_269734 ?auto_269739 ) ) ( not ( = ?auto_269734 ?auto_269740 ) ) ( not ( = ?auto_269735 ?auto_269736 ) ) ( not ( = ?auto_269735 ?auto_269737 ) ) ( not ( = ?auto_269735 ?auto_269738 ) ) ( not ( = ?auto_269735 ?auto_269739 ) ) ( not ( = ?auto_269735 ?auto_269740 ) ) ( not ( = ?auto_269736 ?auto_269737 ) ) ( not ( = ?auto_269736 ?auto_269738 ) ) ( not ( = ?auto_269736 ?auto_269739 ) ) ( not ( = ?auto_269736 ?auto_269740 ) ) ( not ( = ?auto_269737 ?auto_269738 ) ) ( not ( = ?auto_269737 ?auto_269739 ) ) ( not ( = ?auto_269737 ?auto_269740 ) ) ( not ( = ?auto_269738 ?auto_269739 ) ) ( not ( = ?auto_269738 ?auto_269740 ) ) ( not ( = ?auto_269739 ?auto_269740 ) ) ( ON ?auto_269738 ?auto_269739 ) ( CLEAR ?auto_269736 ) ( ON ?auto_269737 ?auto_269738 ) ( CLEAR ?auto_269737 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_269729 ?auto_269730 ?auto_269731 ?auto_269732 ?auto_269733 ?auto_269734 ?auto_269735 ?auto_269736 ?auto_269737 )
      ( MAKE-11PILE ?auto_269729 ?auto_269730 ?auto_269731 ?auto_269732 ?auto_269733 ?auto_269734 ?auto_269735 ?auto_269736 ?auto_269737 ?auto_269738 ?auto_269739 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_269752 - BLOCK
      ?auto_269753 - BLOCK
      ?auto_269754 - BLOCK
      ?auto_269755 - BLOCK
      ?auto_269756 - BLOCK
      ?auto_269757 - BLOCK
      ?auto_269758 - BLOCK
      ?auto_269759 - BLOCK
      ?auto_269760 - BLOCK
      ?auto_269761 - BLOCK
      ?auto_269762 - BLOCK
    )
    :vars
    (
      ?auto_269763 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_269762 ?auto_269763 ) ( ON-TABLE ?auto_269752 ) ( ON ?auto_269753 ?auto_269752 ) ( ON ?auto_269754 ?auto_269753 ) ( ON ?auto_269755 ?auto_269754 ) ( ON ?auto_269756 ?auto_269755 ) ( ON ?auto_269757 ?auto_269756 ) ( ON ?auto_269758 ?auto_269757 ) ( ON ?auto_269759 ?auto_269758 ) ( not ( = ?auto_269752 ?auto_269753 ) ) ( not ( = ?auto_269752 ?auto_269754 ) ) ( not ( = ?auto_269752 ?auto_269755 ) ) ( not ( = ?auto_269752 ?auto_269756 ) ) ( not ( = ?auto_269752 ?auto_269757 ) ) ( not ( = ?auto_269752 ?auto_269758 ) ) ( not ( = ?auto_269752 ?auto_269759 ) ) ( not ( = ?auto_269752 ?auto_269760 ) ) ( not ( = ?auto_269752 ?auto_269761 ) ) ( not ( = ?auto_269752 ?auto_269762 ) ) ( not ( = ?auto_269752 ?auto_269763 ) ) ( not ( = ?auto_269753 ?auto_269754 ) ) ( not ( = ?auto_269753 ?auto_269755 ) ) ( not ( = ?auto_269753 ?auto_269756 ) ) ( not ( = ?auto_269753 ?auto_269757 ) ) ( not ( = ?auto_269753 ?auto_269758 ) ) ( not ( = ?auto_269753 ?auto_269759 ) ) ( not ( = ?auto_269753 ?auto_269760 ) ) ( not ( = ?auto_269753 ?auto_269761 ) ) ( not ( = ?auto_269753 ?auto_269762 ) ) ( not ( = ?auto_269753 ?auto_269763 ) ) ( not ( = ?auto_269754 ?auto_269755 ) ) ( not ( = ?auto_269754 ?auto_269756 ) ) ( not ( = ?auto_269754 ?auto_269757 ) ) ( not ( = ?auto_269754 ?auto_269758 ) ) ( not ( = ?auto_269754 ?auto_269759 ) ) ( not ( = ?auto_269754 ?auto_269760 ) ) ( not ( = ?auto_269754 ?auto_269761 ) ) ( not ( = ?auto_269754 ?auto_269762 ) ) ( not ( = ?auto_269754 ?auto_269763 ) ) ( not ( = ?auto_269755 ?auto_269756 ) ) ( not ( = ?auto_269755 ?auto_269757 ) ) ( not ( = ?auto_269755 ?auto_269758 ) ) ( not ( = ?auto_269755 ?auto_269759 ) ) ( not ( = ?auto_269755 ?auto_269760 ) ) ( not ( = ?auto_269755 ?auto_269761 ) ) ( not ( = ?auto_269755 ?auto_269762 ) ) ( not ( = ?auto_269755 ?auto_269763 ) ) ( not ( = ?auto_269756 ?auto_269757 ) ) ( not ( = ?auto_269756 ?auto_269758 ) ) ( not ( = ?auto_269756 ?auto_269759 ) ) ( not ( = ?auto_269756 ?auto_269760 ) ) ( not ( = ?auto_269756 ?auto_269761 ) ) ( not ( = ?auto_269756 ?auto_269762 ) ) ( not ( = ?auto_269756 ?auto_269763 ) ) ( not ( = ?auto_269757 ?auto_269758 ) ) ( not ( = ?auto_269757 ?auto_269759 ) ) ( not ( = ?auto_269757 ?auto_269760 ) ) ( not ( = ?auto_269757 ?auto_269761 ) ) ( not ( = ?auto_269757 ?auto_269762 ) ) ( not ( = ?auto_269757 ?auto_269763 ) ) ( not ( = ?auto_269758 ?auto_269759 ) ) ( not ( = ?auto_269758 ?auto_269760 ) ) ( not ( = ?auto_269758 ?auto_269761 ) ) ( not ( = ?auto_269758 ?auto_269762 ) ) ( not ( = ?auto_269758 ?auto_269763 ) ) ( not ( = ?auto_269759 ?auto_269760 ) ) ( not ( = ?auto_269759 ?auto_269761 ) ) ( not ( = ?auto_269759 ?auto_269762 ) ) ( not ( = ?auto_269759 ?auto_269763 ) ) ( not ( = ?auto_269760 ?auto_269761 ) ) ( not ( = ?auto_269760 ?auto_269762 ) ) ( not ( = ?auto_269760 ?auto_269763 ) ) ( not ( = ?auto_269761 ?auto_269762 ) ) ( not ( = ?auto_269761 ?auto_269763 ) ) ( not ( = ?auto_269762 ?auto_269763 ) ) ( ON ?auto_269761 ?auto_269762 ) ( CLEAR ?auto_269759 ) ( ON ?auto_269760 ?auto_269761 ) ( CLEAR ?auto_269760 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_269752 ?auto_269753 ?auto_269754 ?auto_269755 ?auto_269756 ?auto_269757 ?auto_269758 ?auto_269759 ?auto_269760 )
      ( MAKE-11PILE ?auto_269752 ?auto_269753 ?auto_269754 ?auto_269755 ?auto_269756 ?auto_269757 ?auto_269758 ?auto_269759 ?auto_269760 ?auto_269761 ?auto_269762 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_269775 - BLOCK
      ?auto_269776 - BLOCK
      ?auto_269777 - BLOCK
      ?auto_269778 - BLOCK
      ?auto_269779 - BLOCK
      ?auto_269780 - BLOCK
      ?auto_269781 - BLOCK
      ?auto_269782 - BLOCK
      ?auto_269783 - BLOCK
      ?auto_269784 - BLOCK
      ?auto_269785 - BLOCK
    )
    :vars
    (
      ?auto_269786 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_269785 ?auto_269786 ) ( ON-TABLE ?auto_269775 ) ( ON ?auto_269776 ?auto_269775 ) ( ON ?auto_269777 ?auto_269776 ) ( ON ?auto_269778 ?auto_269777 ) ( ON ?auto_269779 ?auto_269778 ) ( ON ?auto_269780 ?auto_269779 ) ( ON ?auto_269781 ?auto_269780 ) ( not ( = ?auto_269775 ?auto_269776 ) ) ( not ( = ?auto_269775 ?auto_269777 ) ) ( not ( = ?auto_269775 ?auto_269778 ) ) ( not ( = ?auto_269775 ?auto_269779 ) ) ( not ( = ?auto_269775 ?auto_269780 ) ) ( not ( = ?auto_269775 ?auto_269781 ) ) ( not ( = ?auto_269775 ?auto_269782 ) ) ( not ( = ?auto_269775 ?auto_269783 ) ) ( not ( = ?auto_269775 ?auto_269784 ) ) ( not ( = ?auto_269775 ?auto_269785 ) ) ( not ( = ?auto_269775 ?auto_269786 ) ) ( not ( = ?auto_269776 ?auto_269777 ) ) ( not ( = ?auto_269776 ?auto_269778 ) ) ( not ( = ?auto_269776 ?auto_269779 ) ) ( not ( = ?auto_269776 ?auto_269780 ) ) ( not ( = ?auto_269776 ?auto_269781 ) ) ( not ( = ?auto_269776 ?auto_269782 ) ) ( not ( = ?auto_269776 ?auto_269783 ) ) ( not ( = ?auto_269776 ?auto_269784 ) ) ( not ( = ?auto_269776 ?auto_269785 ) ) ( not ( = ?auto_269776 ?auto_269786 ) ) ( not ( = ?auto_269777 ?auto_269778 ) ) ( not ( = ?auto_269777 ?auto_269779 ) ) ( not ( = ?auto_269777 ?auto_269780 ) ) ( not ( = ?auto_269777 ?auto_269781 ) ) ( not ( = ?auto_269777 ?auto_269782 ) ) ( not ( = ?auto_269777 ?auto_269783 ) ) ( not ( = ?auto_269777 ?auto_269784 ) ) ( not ( = ?auto_269777 ?auto_269785 ) ) ( not ( = ?auto_269777 ?auto_269786 ) ) ( not ( = ?auto_269778 ?auto_269779 ) ) ( not ( = ?auto_269778 ?auto_269780 ) ) ( not ( = ?auto_269778 ?auto_269781 ) ) ( not ( = ?auto_269778 ?auto_269782 ) ) ( not ( = ?auto_269778 ?auto_269783 ) ) ( not ( = ?auto_269778 ?auto_269784 ) ) ( not ( = ?auto_269778 ?auto_269785 ) ) ( not ( = ?auto_269778 ?auto_269786 ) ) ( not ( = ?auto_269779 ?auto_269780 ) ) ( not ( = ?auto_269779 ?auto_269781 ) ) ( not ( = ?auto_269779 ?auto_269782 ) ) ( not ( = ?auto_269779 ?auto_269783 ) ) ( not ( = ?auto_269779 ?auto_269784 ) ) ( not ( = ?auto_269779 ?auto_269785 ) ) ( not ( = ?auto_269779 ?auto_269786 ) ) ( not ( = ?auto_269780 ?auto_269781 ) ) ( not ( = ?auto_269780 ?auto_269782 ) ) ( not ( = ?auto_269780 ?auto_269783 ) ) ( not ( = ?auto_269780 ?auto_269784 ) ) ( not ( = ?auto_269780 ?auto_269785 ) ) ( not ( = ?auto_269780 ?auto_269786 ) ) ( not ( = ?auto_269781 ?auto_269782 ) ) ( not ( = ?auto_269781 ?auto_269783 ) ) ( not ( = ?auto_269781 ?auto_269784 ) ) ( not ( = ?auto_269781 ?auto_269785 ) ) ( not ( = ?auto_269781 ?auto_269786 ) ) ( not ( = ?auto_269782 ?auto_269783 ) ) ( not ( = ?auto_269782 ?auto_269784 ) ) ( not ( = ?auto_269782 ?auto_269785 ) ) ( not ( = ?auto_269782 ?auto_269786 ) ) ( not ( = ?auto_269783 ?auto_269784 ) ) ( not ( = ?auto_269783 ?auto_269785 ) ) ( not ( = ?auto_269783 ?auto_269786 ) ) ( not ( = ?auto_269784 ?auto_269785 ) ) ( not ( = ?auto_269784 ?auto_269786 ) ) ( not ( = ?auto_269785 ?auto_269786 ) ) ( ON ?auto_269784 ?auto_269785 ) ( ON ?auto_269783 ?auto_269784 ) ( CLEAR ?auto_269781 ) ( ON ?auto_269782 ?auto_269783 ) ( CLEAR ?auto_269782 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_269775 ?auto_269776 ?auto_269777 ?auto_269778 ?auto_269779 ?auto_269780 ?auto_269781 ?auto_269782 )
      ( MAKE-11PILE ?auto_269775 ?auto_269776 ?auto_269777 ?auto_269778 ?auto_269779 ?auto_269780 ?auto_269781 ?auto_269782 ?auto_269783 ?auto_269784 ?auto_269785 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_269798 - BLOCK
      ?auto_269799 - BLOCK
      ?auto_269800 - BLOCK
      ?auto_269801 - BLOCK
      ?auto_269802 - BLOCK
      ?auto_269803 - BLOCK
      ?auto_269804 - BLOCK
      ?auto_269805 - BLOCK
      ?auto_269806 - BLOCK
      ?auto_269807 - BLOCK
      ?auto_269808 - BLOCK
    )
    :vars
    (
      ?auto_269809 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_269808 ?auto_269809 ) ( ON-TABLE ?auto_269798 ) ( ON ?auto_269799 ?auto_269798 ) ( ON ?auto_269800 ?auto_269799 ) ( ON ?auto_269801 ?auto_269800 ) ( ON ?auto_269802 ?auto_269801 ) ( ON ?auto_269803 ?auto_269802 ) ( ON ?auto_269804 ?auto_269803 ) ( not ( = ?auto_269798 ?auto_269799 ) ) ( not ( = ?auto_269798 ?auto_269800 ) ) ( not ( = ?auto_269798 ?auto_269801 ) ) ( not ( = ?auto_269798 ?auto_269802 ) ) ( not ( = ?auto_269798 ?auto_269803 ) ) ( not ( = ?auto_269798 ?auto_269804 ) ) ( not ( = ?auto_269798 ?auto_269805 ) ) ( not ( = ?auto_269798 ?auto_269806 ) ) ( not ( = ?auto_269798 ?auto_269807 ) ) ( not ( = ?auto_269798 ?auto_269808 ) ) ( not ( = ?auto_269798 ?auto_269809 ) ) ( not ( = ?auto_269799 ?auto_269800 ) ) ( not ( = ?auto_269799 ?auto_269801 ) ) ( not ( = ?auto_269799 ?auto_269802 ) ) ( not ( = ?auto_269799 ?auto_269803 ) ) ( not ( = ?auto_269799 ?auto_269804 ) ) ( not ( = ?auto_269799 ?auto_269805 ) ) ( not ( = ?auto_269799 ?auto_269806 ) ) ( not ( = ?auto_269799 ?auto_269807 ) ) ( not ( = ?auto_269799 ?auto_269808 ) ) ( not ( = ?auto_269799 ?auto_269809 ) ) ( not ( = ?auto_269800 ?auto_269801 ) ) ( not ( = ?auto_269800 ?auto_269802 ) ) ( not ( = ?auto_269800 ?auto_269803 ) ) ( not ( = ?auto_269800 ?auto_269804 ) ) ( not ( = ?auto_269800 ?auto_269805 ) ) ( not ( = ?auto_269800 ?auto_269806 ) ) ( not ( = ?auto_269800 ?auto_269807 ) ) ( not ( = ?auto_269800 ?auto_269808 ) ) ( not ( = ?auto_269800 ?auto_269809 ) ) ( not ( = ?auto_269801 ?auto_269802 ) ) ( not ( = ?auto_269801 ?auto_269803 ) ) ( not ( = ?auto_269801 ?auto_269804 ) ) ( not ( = ?auto_269801 ?auto_269805 ) ) ( not ( = ?auto_269801 ?auto_269806 ) ) ( not ( = ?auto_269801 ?auto_269807 ) ) ( not ( = ?auto_269801 ?auto_269808 ) ) ( not ( = ?auto_269801 ?auto_269809 ) ) ( not ( = ?auto_269802 ?auto_269803 ) ) ( not ( = ?auto_269802 ?auto_269804 ) ) ( not ( = ?auto_269802 ?auto_269805 ) ) ( not ( = ?auto_269802 ?auto_269806 ) ) ( not ( = ?auto_269802 ?auto_269807 ) ) ( not ( = ?auto_269802 ?auto_269808 ) ) ( not ( = ?auto_269802 ?auto_269809 ) ) ( not ( = ?auto_269803 ?auto_269804 ) ) ( not ( = ?auto_269803 ?auto_269805 ) ) ( not ( = ?auto_269803 ?auto_269806 ) ) ( not ( = ?auto_269803 ?auto_269807 ) ) ( not ( = ?auto_269803 ?auto_269808 ) ) ( not ( = ?auto_269803 ?auto_269809 ) ) ( not ( = ?auto_269804 ?auto_269805 ) ) ( not ( = ?auto_269804 ?auto_269806 ) ) ( not ( = ?auto_269804 ?auto_269807 ) ) ( not ( = ?auto_269804 ?auto_269808 ) ) ( not ( = ?auto_269804 ?auto_269809 ) ) ( not ( = ?auto_269805 ?auto_269806 ) ) ( not ( = ?auto_269805 ?auto_269807 ) ) ( not ( = ?auto_269805 ?auto_269808 ) ) ( not ( = ?auto_269805 ?auto_269809 ) ) ( not ( = ?auto_269806 ?auto_269807 ) ) ( not ( = ?auto_269806 ?auto_269808 ) ) ( not ( = ?auto_269806 ?auto_269809 ) ) ( not ( = ?auto_269807 ?auto_269808 ) ) ( not ( = ?auto_269807 ?auto_269809 ) ) ( not ( = ?auto_269808 ?auto_269809 ) ) ( ON ?auto_269807 ?auto_269808 ) ( ON ?auto_269806 ?auto_269807 ) ( CLEAR ?auto_269804 ) ( ON ?auto_269805 ?auto_269806 ) ( CLEAR ?auto_269805 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_269798 ?auto_269799 ?auto_269800 ?auto_269801 ?auto_269802 ?auto_269803 ?auto_269804 ?auto_269805 )
      ( MAKE-11PILE ?auto_269798 ?auto_269799 ?auto_269800 ?auto_269801 ?auto_269802 ?auto_269803 ?auto_269804 ?auto_269805 ?auto_269806 ?auto_269807 ?auto_269808 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_269821 - BLOCK
      ?auto_269822 - BLOCK
      ?auto_269823 - BLOCK
      ?auto_269824 - BLOCK
      ?auto_269825 - BLOCK
      ?auto_269826 - BLOCK
      ?auto_269827 - BLOCK
      ?auto_269828 - BLOCK
      ?auto_269829 - BLOCK
      ?auto_269830 - BLOCK
      ?auto_269831 - BLOCK
    )
    :vars
    (
      ?auto_269832 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_269831 ?auto_269832 ) ( ON-TABLE ?auto_269821 ) ( ON ?auto_269822 ?auto_269821 ) ( ON ?auto_269823 ?auto_269822 ) ( ON ?auto_269824 ?auto_269823 ) ( ON ?auto_269825 ?auto_269824 ) ( ON ?auto_269826 ?auto_269825 ) ( not ( = ?auto_269821 ?auto_269822 ) ) ( not ( = ?auto_269821 ?auto_269823 ) ) ( not ( = ?auto_269821 ?auto_269824 ) ) ( not ( = ?auto_269821 ?auto_269825 ) ) ( not ( = ?auto_269821 ?auto_269826 ) ) ( not ( = ?auto_269821 ?auto_269827 ) ) ( not ( = ?auto_269821 ?auto_269828 ) ) ( not ( = ?auto_269821 ?auto_269829 ) ) ( not ( = ?auto_269821 ?auto_269830 ) ) ( not ( = ?auto_269821 ?auto_269831 ) ) ( not ( = ?auto_269821 ?auto_269832 ) ) ( not ( = ?auto_269822 ?auto_269823 ) ) ( not ( = ?auto_269822 ?auto_269824 ) ) ( not ( = ?auto_269822 ?auto_269825 ) ) ( not ( = ?auto_269822 ?auto_269826 ) ) ( not ( = ?auto_269822 ?auto_269827 ) ) ( not ( = ?auto_269822 ?auto_269828 ) ) ( not ( = ?auto_269822 ?auto_269829 ) ) ( not ( = ?auto_269822 ?auto_269830 ) ) ( not ( = ?auto_269822 ?auto_269831 ) ) ( not ( = ?auto_269822 ?auto_269832 ) ) ( not ( = ?auto_269823 ?auto_269824 ) ) ( not ( = ?auto_269823 ?auto_269825 ) ) ( not ( = ?auto_269823 ?auto_269826 ) ) ( not ( = ?auto_269823 ?auto_269827 ) ) ( not ( = ?auto_269823 ?auto_269828 ) ) ( not ( = ?auto_269823 ?auto_269829 ) ) ( not ( = ?auto_269823 ?auto_269830 ) ) ( not ( = ?auto_269823 ?auto_269831 ) ) ( not ( = ?auto_269823 ?auto_269832 ) ) ( not ( = ?auto_269824 ?auto_269825 ) ) ( not ( = ?auto_269824 ?auto_269826 ) ) ( not ( = ?auto_269824 ?auto_269827 ) ) ( not ( = ?auto_269824 ?auto_269828 ) ) ( not ( = ?auto_269824 ?auto_269829 ) ) ( not ( = ?auto_269824 ?auto_269830 ) ) ( not ( = ?auto_269824 ?auto_269831 ) ) ( not ( = ?auto_269824 ?auto_269832 ) ) ( not ( = ?auto_269825 ?auto_269826 ) ) ( not ( = ?auto_269825 ?auto_269827 ) ) ( not ( = ?auto_269825 ?auto_269828 ) ) ( not ( = ?auto_269825 ?auto_269829 ) ) ( not ( = ?auto_269825 ?auto_269830 ) ) ( not ( = ?auto_269825 ?auto_269831 ) ) ( not ( = ?auto_269825 ?auto_269832 ) ) ( not ( = ?auto_269826 ?auto_269827 ) ) ( not ( = ?auto_269826 ?auto_269828 ) ) ( not ( = ?auto_269826 ?auto_269829 ) ) ( not ( = ?auto_269826 ?auto_269830 ) ) ( not ( = ?auto_269826 ?auto_269831 ) ) ( not ( = ?auto_269826 ?auto_269832 ) ) ( not ( = ?auto_269827 ?auto_269828 ) ) ( not ( = ?auto_269827 ?auto_269829 ) ) ( not ( = ?auto_269827 ?auto_269830 ) ) ( not ( = ?auto_269827 ?auto_269831 ) ) ( not ( = ?auto_269827 ?auto_269832 ) ) ( not ( = ?auto_269828 ?auto_269829 ) ) ( not ( = ?auto_269828 ?auto_269830 ) ) ( not ( = ?auto_269828 ?auto_269831 ) ) ( not ( = ?auto_269828 ?auto_269832 ) ) ( not ( = ?auto_269829 ?auto_269830 ) ) ( not ( = ?auto_269829 ?auto_269831 ) ) ( not ( = ?auto_269829 ?auto_269832 ) ) ( not ( = ?auto_269830 ?auto_269831 ) ) ( not ( = ?auto_269830 ?auto_269832 ) ) ( not ( = ?auto_269831 ?auto_269832 ) ) ( ON ?auto_269830 ?auto_269831 ) ( ON ?auto_269829 ?auto_269830 ) ( ON ?auto_269828 ?auto_269829 ) ( CLEAR ?auto_269826 ) ( ON ?auto_269827 ?auto_269828 ) ( CLEAR ?auto_269827 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_269821 ?auto_269822 ?auto_269823 ?auto_269824 ?auto_269825 ?auto_269826 ?auto_269827 )
      ( MAKE-11PILE ?auto_269821 ?auto_269822 ?auto_269823 ?auto_269824 ?auto_269825 ?auto_269826 ?auto_269827 ?auto_269828 ?auto_269829 ?auto_269830 ?auto_269831 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_269844 - BLOCK
      ?auto_269845 - BLOCK
      ?auto_269846 - BLOCK
      ?auto_269847 - BLOCK
      ?auto_269848 - BLOCK
      ?auto_269849 - BLOCK
      ?auto_269850 - BLOCK
      ?auto_269851 - BLOCK
      ?auto_269852 - BLOCK
      ?auto_269853 - BLOCK
      ?auto_269854 - BLOCK
    )
    :vars
    (
      ?auto_269855 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_269854 ?auto_269855 ) ( ON-TABLE ?auto_269844 ) ( ON ?auto_269845 ?auto_269844 ) ( ON ?auto_269846 ?auto_269845 ) ( ON ?auto_269847 ?auto_269846 ) ( ON ?auto_269848 ?auto_269847 ) ( ON ?auto_269849 ?auto_269848 ) ( not ( = ?auto_269844 ?auto_269845 ) ) ( not ( = ?auto_269844 ?auto_269846 ) ) ( not ( = ?auto_269844 ?auto_269847 ) ) ( not ( = ?auto_269844 ?auto_269848 ) ) ( not ( = ?auto_269844 ?auto_269849 ) ) ( not ( = ?auto_269844 ?auto_269850 ) ) ( not ( = ?auto_269844 ?auto_269851 ) ) ( not ( = ?auto_269844 ?auto_269852 ) ) ( not ( = ?auto_269844 ?auto_269853 ) ) ( not ( = ?auto_269844 ?auto_269854 ) ) ( not ( = ?auto_269844 ?auto_269855 ) ) ( not ( = ?auto_269845 ?auto_269846 ) ) ( not ( = ?auto_269845 ?auto_269847 ) ) ( not ( = ?auto_269845 ?auto_269848 ) ) ( not ( = ?auto_269845 ?auto_269849 ) ) ( not ( = ?auto_269845 ?auto_269850 ) ) ( not ( = ?auto_269845 ?auto_269851 ) ) ( not ( = ?auto_269845 ?auto_269852 ) ) ( not ( = ?auto_269845 ?auto_269853 ) ) ( not ( = ?auto_269845 ?auto_269854 ) ) ( not ( = ?auto_269845 ?auto_269855 ) ) ( not ( = ?auto_269846 ?auto_269847 ) ) ( not ( = ?auto_269846 ?auto_269848 ) ) ( not ( = ?auto_269846 ?auto_269849 ) ) ( not ( = ?auto_269846 ?auto_269850 ) ) ( not ( = ?auto_269846 ?auto_269851 ) ) ( not ( = ?auto_269846 ?auto_269852 ) ) ( not ( = ?auto_269846 ?auto_269853 ) ) ( not ( = ?auto_269846 ?auto_269854 ) ) ( not ( = ?auto_269846 ?auto_269855 ) ) ( not ( = ?auto_269847 ?auto_269848 ) ) ( not ( = ?auto_269847 ?auto_269849 ) ) ( not ( = ?auto_269847 ?auto_269850 ) ) ( not ( = ?auto_269847 ?auto_269851 ) ) ( not ( = ?auto_269847 ?auto_269852 ) ) ( not ( = ?auto_269847 ?auto_269853 ) ) ( not ( = ?auto_269847 ?auto_269854 ) ) ( not ( = ?auto_269847 ?auto_269855 ) ) ( not ( = ?auto_269848 ?auto_269849 ) ) ( not ( = ?auto_269848 ?auto_269850 ) ) ( not ( = ?auto_269848 ?auto_269851 ) ) ( not ( = ?auto_269848 ?auto_269852 ) ) ( not ( = ?auto_269848 ?auto_269853 ) ) ( not ( = ?auto_269848 ?auto_269854 ) ) ( not ( = ?auto_269848 ?auto_269855 ) ) ( not ( = ?auto_269849 ?auto_269850 ) ) ( not ( = ?auto_269849 ?auto_269851 ) ) ( not ( = ?auto_269849 ?auto_269852 ) ) ( not ( = ?auto_269849 ?auto_269853 ) ) ( not ( = ?auto_269849 ?auto_269854 ) ) ( not ( = ?auto_269849 ?auto_269855 ) ) ( not ( = ?auto_269850 ?auto_269851 ) ) ( not ( = ?auto_269850 ?auto_269852 ) ) ( not ( = ?auto_269850 ?auto_269853 ) ) ( not ( = ?auto_269850 ?auto_269854 ) ) ( not ( = ?auto_269850 ?auto_269855 ) ) ( not ( = ?auto_269851 ?auto_269852 ) ) ( not ( = ?auto_269851 ?auto_269853 ) ) ( not ( = ?auto_269851 ?auto_269854 ) ) ( not ( = ?auto_269851 ?auto_269855 ) ) ( not ( = ?auto_269852 ?auto_269853 ) ) ( not ( = ?auto_269852 ?auto_269854 ) ) ( not ( = ?auto_269852 ?auto_269855 ) ) ( not ( = ?auto_269853 ?auto_269854 ) ) ( not ( = ?auto_269853 ?auto_269855 ) ) ( not ( = ?auto_269854 ?auto_269855 ) ) ( ON ?auto_269853 ?auto_269854 ) ( ON ?auto_269852 ?auto_269853 ) ( ON ?auto_269851 ?auto_269852 ) ( CLEAR ?auto_269849 ) ( ON ?auto_269850 ?auto_269851 ) ( CLEAR ?auto_269850 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_269844 ?auto_269845 ?auto_269846 ?auto_269847 ?auto_269848 ?auto_269849 ?auto_269850 )
      ( MAKE-11PILE ?auto_269844 ?auto_269845 ?auto_269846 ?auto_269847 ?auto_269848 ?auto_269849 ?auto_269850 ?auto_269851 ?auto_269852 ?auto_269853 ?auto_269854 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_269867 - BLOCK
      ?auto_269868 - BLOCK
      ?auto_269869 - BLOCK
      ?auto_269870 - BLOCK
      ?auto_269871 - BLOCK
      ?auto_269872 - BLOCK
      ?auto_269873 - BLOCK
      ?auto_269874 - BLOCK
      ?auto_269875 - BLOCK
      ?auto_269876 - BLOCK
      ?auto_269877 - BLOCK
    )
    :vars
    (
      ?auto_269878 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_269877 ?auto_269878 ) ( ON-TABLE ?auto_269867 ) ( ON ?auto_269868 ?auto_269867 ) ( ON ?auto_269869 ?auto_269868 ) ( ON ?auto_269870 ?auto_269869 ) ( ON ?auto_269871 ?auto_269870 ) ( not ( = ?auto_269867 ?auto_269868 ) ) ( not ( = ?auto_269867 ?auto_269869 ) ) ( not ( = ?auto_269867 ?auto_269870 ) ) ( not ( = ?auto_269867 ?auto_269871 ) ) ( not ( = ?auto_269867 ?auto_269872 ) ) ( not ( = ?auto_269867 ?auto_269873 ) ) ( not ( = ?auto_269867 ?auto_269874 ) ) ( not ( = ?auto_269867 ?auto_269875 ) ) ( not ( = ?auto_269867 ?auto_269876 ) ) ( not ( = ?auto_269867 ?auto_269877 ) ) ( not ( = ?auto_269867 ?auto_269878 ) ) ( not ( = ?auto_269868 ?auto_269869 ) ) ( not ( = ?auto_269868 ?auto_269870 ) ) ( not ( = ?auto_269868 ?auto_269871 ) ) ( not ( = ?auto_269868 ?auto_269872 ) ) ( not ( = ?auto_269868 ?auto_269873 ) ) ( not ( = ?auto_269868 ?auto_269874 ) ) ( not ( = ?auto_269868 ?auto_269875 ) ) ( not ( = ?auto_269868 ?auto_269876 ) ) ( not ( = ?auto_269868 ?auto_269877 ) ) ( not ( = ?auto_269868 ?auto_269878 ) ) ( not ( = ?auto_269869 ?auto_269870 ) ) ( not ( = ?auto_269869 ?auto_269871 ) ) ( not ( = ?auto_269869 ?auto_269872 ) ) ( not ( = ?auto_269869 ?auto_269873 ) ) ( not ( = ?auto_269869 ?auto_269874 ) ) ( not ( = ?auto_269869 ?auto_269875 ) ) ( not ( = ?auto_269869 ?auto_269876 ) ) ( not ( = ?auto_269869 ?auto_269877 ) ) ( not ( = ?auto_269869 ?auto_269878 ) ) ( not ( = ?auto_269870 ?auto_269871 ) ) ( not ( = ?auto_269870 ?auto_269872 ) ) ( not ( = ?auto_269870 ?auto_269873 ) ) ( not ( = ?auto_269870 ?auto_269874 ) ) ( not ( = ?auto_269870 ?auto_269875 ) ) ( not ( = ?auto_269870 ?auto_269876 ) ) ( not ( = ?auto_269870 ?auto_269877 ) ) ( not ( = ?auto_269870 ?auto_269878 ) ) ( not ( = ?auto_269871 ?auto_269872 ) ) ( not ( = ?auto_269871 ?auto_269873 ) ) ( not ( = ?auto_269871 ?auto_269874 ) ) ( not ( = ?auto_269871 ?auto_269875 ) ) ( not ( = ?auto_269871 ?auto_269876 ) ) ( not ( = ?auto_269871 ?auto_269877 ) ) ( not ( = ?auto_269871 ?auto_269878 ) ) ( not ( = ?auto_269872 ?auto_269873 ) ) ( not ( = ?auto_269872 ?auto_269874 ) ) ( not ( = ?auto_269872 ?auto_269875 ) ) ( not ( = ?auto_269872 ?auto_269876 ) ) ( not ( = ?auto_269872 ?auto_269877 ) ) ( not ( = ?auto_269872 ?auto_269878 ) ) ( not ( = ?auto_269873 ?auto_269874 ) ) ( not ( = ?auto_269873 ?auto_269875 ) ) ( not ( = ?auto_269873 ?auto_269876 ) ) ( not ( = ?auto_269873 ?auto_269877 ) ) ( not ( = ?auto_269873 ?auto_269878 ) ) ( not ( = ?auto_269874 ?auto_269875 ) ) ( not ( = ?auto_269874 ?auto_269876 ) ) ( not ( = ?auto_269874 ?auto_269877 ) ) ( not ( = ?auto_269874 ?auto_269878 ) ) ( not ( = ?auto_269875 ?auto_269876 ) ) ( not ( = ?auto_269875 ?auto_269877 ) ) ( not ( = ?auto_269875 ?auto_269878 ) ) ( not ( = ?auto_269876 ?auto_269877 ) ) ( not ( = ?auto_269876 ?auto_269878 ) ) ( not ( = ?auto_269877 ?auto_269878 ) ) ( ON ?auto_269876 ?auto_269877 ) ( ON ?auto_269875 ?auto_269876 ) ( ON ?auto_269874 ?auto_269875 ) ( ON ?auto_269873 ?auto_269874 ) ( CLEAR ?auto_269871 ) ( ON ?auto_269872 ?auto_269873 ) ( CLEAR ?auto_269872 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_269867 ?auto_269868 ?auto_269869 ?auto_269870 ?auto_269871 ?auto_269872 )
      ( MAKE-11PILE ?auto_269867 ?auto_269868 ?auto_269869 ?auto_269870 ?auto_269871 ?auto_269872 ?auto_269873 ?auto_269874 ?auto_269875 ?auto_269876 ?auto_269877 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_269890 - BLOCK
      ?auto_269891 - BLOCK
      ?auto_269892 - BLOCK
      ?auto_269893 - BLOCK
      ?auto_269894 - BLOCK
      ?auto_269895 - BLOCK
      ?auto_269896 - BLOCK
      ?auto_269897 - BLOCK
      ?auto_269898 - BLOCK
      ?auto_269899 - BLOCK
      ?auto_269900 - BLOCK
    )
    :vars
    (
      ?auto_269901 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_269900 ?auto_269901 ) ( ON-TABLE ?auto_269890 ) ( ON ?auto_269891 ?auto_269890 ) ( ON ?auto_269892 ?auto_269891 ) ( ON ?auto_269893 ?auto_269892 ) ( ON ?auto_269894 ?auto_269893 ) ( not ( = ?auto_269890 ?auto_269891 ) ) ( not ( = ?auto_269890 ?auto_269892 ) ) ( not ( = ?auto_269890 ?auto_269893 ) ) ( not ( = ?auto_269890 ?auto_269894 ) ) ( not ( = ?auto_269890 ?auto_269895 ) ) ( not ( = ?auto_269890 ?auto_269896 ) ) ( not ( = ?auto_269890 ?auto_269897 ) ) ( not ( = ?auto_269890 ?auto_269898 ) ) ( not ( = ?auto_269890 ?auto_269899 ) ) ( not ( = ?auto_269890 ?auto_269900 ) ) ( not ( = ?auto_269890 ?auto_269901 ) ) ( not ( = ?auto_269891 ?auto_269892 ) ) ( not ( = ?auto_269891 ?auto_269893 ) ) ( not ( = ?auto_269891 ?auto_269894 ) ) ( not ( = ?auto_269891 ?auto_269895 ) ) ( not ( = ?auto_269891 ?auto_269896 ) ) ( not ( = ?auto_269891 ?auto_269897 ) ) ( not ( = ?auto_269891 ?auto_269898 ) ) ( not ( = ?auto_269891 ?auto_269899 ) ) ( not ( = ?auto_269891 ?auto_269900 ) ) ( not ( = ?auto_269891 ?auto_269901 ) ) ( not ( = ?auto_269892 ?auto_269893 ) ) ( not ( = ?auto_269892 ?auto_269894 ) ) ( not ( = ?auto_269892 ?auto_269895 ) ) ( not ( = ?auto_269892 ?auto_269896 ) ) ( not ( = ?auto_269892 ?auto_269897 ) ) ( not ( = ?auto_269892 ?auto_269898 ) ) ( not ( = ?auto_269892 ?auto_269899 ) ) ( not ( = ?auto_269892 ?auto_269900 ) ) ( not ( = ?auto_269892 ?auto_269901 ) ) ( not ( = ?auto_269893 ?auto_269894 ) ) ( not ( = ?auto_269893 ?auto_269895 ) ) ( not ( = ?auto_269893 ?auto_269896 ) ) ( not ( = ?auto_269893 ?auto_269897 ) ) ( not ( = ?auto_269893 ?auto_269898 ) ) ( not ( = ?auto_269893 ?auto_269899 ) ) ( not ( = ?auto_269893 ?auto_269900 ) ) ( not ( = ?auto_269893 ?auto_269901 ) ) ( not ( = ?auto_269894 ?auto_269895 ) ) ( not ( = ?auto_269894 ?auto_269896 ) ) ( not ( = ?auto_269894 ?auto_269897 ) ) ( not ( = ?auto_269894 ?auto_269898 ) ) ( not ( = ?auto_269894 ?auto_269899 ) ) ( not ( = ?auto_269894 ?auto_269900 ) ) ( not ( = ?auto_269894 ?auto_269901 ) ) ( not ( = ?auto_269895 ?auto_269896 ) ) ( not ( = ?auto_269895 ?auto_269897 ) ) ( not ( = ?auto_269895 ?auto_269898 ) ) ( not ( = ?auto_269895 ?auto_269899 ) ) ( not ( = ?auto_269895 ?auto_269900 ) ) ( not ( = ?auto_269895 ?auto_269901 ) ) ( not ( = ?auto_269896 ?auto_269897 ) ) ( not ( = ?auto_269896 ?auto_269898 ) ) ( not ( = ?auto_269896 ?auto_269899 ) ) ( not ( = ?auto_269896 ?auto_269900 ) ) ( not ( = ?auto_269896 ?auto_269901 ) ) ( not ( = ?auto_269897 ?auto_269898 ) ) ( not ( = ?auto_269897 ?auto_269899 ) ) ( not ( = ?auto_269897 ?auto_269900 ) ) ( not ( = ?auto_269897 ?auto_269901 ) ) ( not ( = ?auto_269898 ?auto_269899 ) ) ( not ( = ?auto_269898 ?auto_269900 ) ) ( not ( = ?auto_269898 ?auto_269901 ) ) ( not ( = ?auto_269899 ?auto_269900 ) ) ( not ( = ?auto_269899 ?auto_269901 ) ) ( not ( = ?auto_269900 ?auto_269901 ) ) ( ON ?auto_269899 ?auto_269900 ) ( ON ?auto_269898 ?auto_269899 ) ( ON ?auto_269897 ?auto_269898 ) ( ON ?auto_269896 ?auto_269897 ) ( CLEAR ?auto_269894 ) ( ON ?auto_269895 ?auto_269896 ) ( CLEAR ?auto_269895 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_269890 ?auto_269891 ?auto_269892 ?auto_269893 ?auto_269894 ?auto_269895 )
      ( MAKE-11PILE ?auto_269890 ?auto_269891 ?auto_269892 ?auto_269893 ?auto_269894 ?auto_269895 ?auto_269896 ?auto_269897 ?auto_269898 ?auto_269899 ?auto_269900 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_269913 - BLOCK
      ?auto_269914 - BLOCK
      ?auto_269915 - BLOCK
      ?auto_269916 - BLOCK
      ?auto_269917 - BLOCK
      ?auto_269918 - BLOCK
      ?auto_269919 - BLOCK
      ?auto_269920 - BLOCK
      ?auto_269921 - BLOCK
      ?auto_269922 - BLOCK
      ?auto_269923 - BLOCK
    )
    :vars
    (
      ?auto_269924 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_269923 ?auto_269924 ) ( ON-TABLE ?auto_269913 ) ( ON ?auto_269914 ?auto_269913 ) ( ON ?auto_269915 ?auto_269914 ) ( ON ?auto_269916 ?auto_269915 ) ( not ( = ?auto_269913 ?auto_269914 ) ) ( not ( = ?auto_269913 ?auto_269915 ) ) ( not ( = ?auto_269913 ?auto_269916 ) ) ( not ( = ?auto_269913 ?auto_269917 ) ) ( not ( = ?auto_269913 ?auto_269918 ) ) ( not ( = ?auto_269913 ?auto_269919 ) ) ( not ( = ?auto_269913 ?auto_269920 ) ) ( not ( = ?auto_269913 ?auto_269921 ) ) ( not ( = ?auto_269913 ?auto_269922 ) ) ( not ( = ?auto_269913 ?auto_269923 ) ) ( not ( = ?auto_269913 ?auto_269924 ) ) ( not ( = ?auto_269914 ?auto_269915 ) ) ( not ( = ?auto_269914 ?auto_269916 ) ) ( not ( = ?auto_269914 ?auto_269917 ) ) ( not ( = ?auto_269914 ?auto_269918 ) ) ( not ( = ?auto_269914 ?auto_269919 ) ) ( not ( = ?auto_269914 ?auto_269920 ) ) ( not ( = ?auto_269914 ?auto_269921 ) ) ( not ( = ?auto_269914 ?auto_269922 ) ) ( not ( = ?auto_269914 ?auto_269923 ) ) ( not ( = ?auto_269914 ?auto_269924 ) ) ( not ( = ?auto_269915 ?auto_269916 ) ) ( not ( = ?auto_269915 ?auto_269917 ) ) ( not ( = ?auto_269915 ?auto_269918 ) ) ( not ( = ?auto_269915 ?auto_269919 ) ) ( not ( = ?auto_269915 ?auto_269920 ) ) ( not ( = ?auto_269915 ?auto_269921 ) ) ( not ( = ?auto_269915 ?auto_269922 ) ) ( not ( = ?auto_269915 ?auto_269923 ) ) ( not ( = ?auto_269915 ?auto_269924 ) ) ( not ( = ?auto_269916 ?auto_269917 ) ) ( not ( = ?auto_269916 ?auto_269918 ) ) ( not ( = ?auto_269916 ?auto_269919 ) ) ( not ( = ?auto_269916 ?auto_269920 ) ) ( not ( = ?auto_269916 ?auto_269921 ) ) ( not ( = ?auto_269916 ?auto_269922 ) ) ( not ( = ?auto_269916 ?auto_269923 ) ) ( not ( = ?auto_269916 ?auto_269924 ) ) ( not ( = ?auto_269917 ?auto_269918 ) ) ( not ( = ?auto_269917 ?auto_269919 ) ) ( not ( = ?auto_269917 ?auto_269920 ) ) ( not ( = ?auto_269917 ?auto_269921 ) ) ( not ( = ?auto_269917 ?auto_269922 ) ) ( not ( = ?auto_269917 ?auto_269923 ) ) ( not ( = ?auto_269917 ?auto_269924 ) ) ( not ( = ?auto_269918 ?auto_269919 ) ) ( not ( = ?auto_269918 ?auto_269920 ) ) ( not ( = ?auto_269918 ?auto_269921 ) ) ( not ( = ?auto_269918 ?auto_269922 ) ) ( not ( = ?auto_269918 ?auto_269923 ) ) ( not ( = ?auto_269918 ?auto_269924 ) ) ( not ( = ?auto_269919 ?auto_269920 ) ) ( not ( = ?auto_269919 ?auto_269921 ) ) ( not ( = ?auto_269919 ?auto_269922 ) ) ( not ( = ?auto_269919 ?auto_269923 ) ) ( not ( = ?auto_269919 ?auto_269924 ) ) ( not ( = ?auto_269920 ?auto_269921 ) ) ( not ( = ?auto_269920 ?auto_269922 ) ) ( not ( = ?auto_269920 ?auto_269923 ) ) ( not ( = ?auto_269920 ?auto_269924 ) ) ( not ( = ?auto_269921 ?auto_269922 ) ) ( not ( = ?auto_269921 ?auto_269923 ) ) ( not ( = ?auto_269921 ?auto_269924 ) ) ( not ( = ?auto_269922 ?auto_269923 ) ) ( not ( = ?auto_269922 ?auto_269924 ) ) ( not ( = ?auto_269923 ?auto_269924 ) ) ( ON ?auto_269922 ?auto_269923 ) ( ON ?auto_269921 ?auto_269922 ) ( ON ?auto_269920 ?auto_269921 ) ( ON ?auto_269919 ?auto_269920 ) ( ON ?auto_269918 ?auto_269919 ) ( CLEAR ?auto_269916 ) ( ON ?auto_269917 ?auto_269918 ) ( CLEAR ?auto_269917 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_269913 ?auto_269914 ?auto_269915 ?auto_269916 ?auto_269917 )
      ( MAKE-11PILE ?auto_269913 ?auto_269914 ?auto_269915 ?auto_269916 ?auto_269917 ?auto_269918 ?auto_269919 ?auto_269920 ?auto_269921 ?auto_269922 ?auto_269923 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_269936 - BLOCK
      ?auto_269937 - BLOCK
      ?auto_269938 - BLOCK
      ?auto_269939 - BLOCK
      ?auto_269940 - BLOCK
      ?auto_269941 - BLOCK
      ?auto_269942 - BLOCK
      ?auto_269943 - BLOCK
      ?auto_269944 - BLOCK
      ?auto_269945 - BLOCK
      ?auto_269946 - BLOCK
    )
    :vars
    (
      ?auto_269947 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_269946 ?auto_269947 ) ( ON-TABLE ?auto_269936 ) ( ON ?auto_269937 ?auto_269936 ) ( ON ?auto_269938 ?auto_269937 ) ( ON ?auto_269939 ?auto_269938 ) ( not ( = ?auto_269936 ?auto_269937 ) ) ( not ( = ?auto_269936 ?auto_269938 ) ) ( not ( = ?auto_269936 ?auto_269939 ) ) ( not ( = ?auto_269936 ?auto_269940 ) ) ( not ( = ?auto_269936 ?auto_269941 ) ) ( not ( = ?auto_269936 ?auto_269942 ) ) ( not ( = ?auto_269936 ?auto_269943 ) ) ( not ( = ?auto_269936 ?auto_269944 ) ) ( not ( = ?auto_269936 ?auto_269945 ) ) ( not ( = ?auto_269936 ?auto_269946 ) ) ( not ( = ?auto_269936 ?auto_269947 ) ) ( not ( = ?auto_269937 ?auto_269938 ) ) ( not ( = ?auto_269937 ?auto_269939 ) ) ( not ( = ?auto_269937 ?auto_269940 ) ) ( not ( = ?auto_269937 ?auto_269941 ) ) ( not ( = ?auto_269937 ?auto_269942 ) ) ( not ( = ?auto_269937 ?auto_269943 ) ) ( not ( = ?auto_269937 ?auto_269944 ) ) ( not ( = ?auto_269937 ?auto_269945 ) ) ( not ( = ?auto_269937 ?auto_269946 ) ) ( not ( = ?auto_269937 ?auto_269947 ) ) ( not ( = ?auto_269938 ?auto_269939 ) ) ( not ( = ?auto_269938 ?auto_269940 ) ) ( not ( = ?auto_269938 ?auto_269941 ) ) ( not ( = ?auto_269938 ?auto_269942 ) ) ( not ( = ?auto_269938 ?auto_269943 ) ) ( not ( = ?auto_269938 ?auto_269944 ) ) ( not ( = ?auto_269938 ?auto_269945 ) ) ( not ( = ?auto_269938 ?auto_269946 ) ) ( not ( = ?auto_269938 ?auto_269947 ) ) ( not ( = ?auto_269939 ?auto_269940 ) ) ( not ( = ?auto_269939 ?auto_269941 ) ) ( not ( = ?auto_269939 ?auto_269942 ) ) ( not ( = ?auto_269939 ?auto_269943 ) ) ( not ( = ?auto_269939 ?auto_269944 ) ) ( not ( = ?auto_269939 ?auto_269945 ) ) ( not ( = ?auto_269939 ?auto_269946 ) ) ( not ( = ?auto_269939 ?auto_269947 ) ) ( not ( = ?auto_269940 ?auto_269941 ) ) ( not ( = ?auto_269940 ?auto_269942 ) ) ( not ( = ?auto_269940 ?auto_269943 ) ) ( not ( = ?auto_269940 ?auto_269944 ) ) ( not ( = ?auto_269940 ?auto_269945 ) ) ( not ( = ?auto_269940 ?auto_269946 ) ) ( not ( = ?auto_269940 ?auto_269947 ) ) ( not ( = ?auto_269941 ?auto_269942 ) ) ( not ( = ?auto_269941 ?auto_269943 ) ) ( not ( = ?auto_269941 ?auto_269944 ) ) ( not ( = ?auto_269941 ?auto_269945 ) ) ( not ( = ?auto_269941 ?auto_269946 ) ) ( not ( = ?auto_269941 ?auto_269947 ) ) ( not ( = ?auto_269942 ?auto_269943 ) ) ( not ( = ?auto_269942 ?auto_269944 ) ) ( not ( = ?auto_269942 ?auto_269945 ) ) ( not ( = ?auto_269942 ?auto_269946 ) ) ( not ( = ?auto_269942 ?auto_269947 ) ) ( not ( = ?auto_269943 ?auto_269944 ) ) ( not ( = ?auto_269943 ?auto_269945 ) ) ( not ( = ?auto_269943 ?auto_269946 ) ) ( not ( = ?auto_269943 ?auto_269947 ) ) ( not ( = ?auto_269944 ?auto_269945 ) ) ( not ( = ?auto_269944 ?auto_269946 ) ) ( not ( = ?auto_269944 ?auto_269947 ) ) ( not ( = ?auto_269945 ?auto_269946 ) ) ( not ( = ?auto_269945 ?auto_269947 ) ) ( not ( = ?auto_269946 ?auto_269947 ) ) ( ON ?auto_269945 ?auto_269946 ) ( ON ?auto_269944 ?auto_269945 ) ( ON ?auto_269943 ?auto_269944 ) ( ON ?auto_269942 ?auto_269943 ) ( ON ?auto_269941 ?auto_269942 ) ( CLEAR ?auto_269939 ) ( ON ?auto_269940 ?auto_269941 ) ( CLEAR ?auto_269940 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_269936 ?auto_269937 ?auto_269938 ?auto_269939 ?auto_269940 )
      ( MAKE-11PILE ?auto_269936 ?auto_269937 ?auto_269938 ?auto_269939 ?auto_269940 ?auto_269941 ?auto_269942 ?auto_269943 ?auto_269944 ?auto_269945 ?auto_269946 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_269959 - BLOCK
      ?auto_269960 - BLOCK
      ?auto_269961 - BLOCK
      ?auto_269962 - BLOCK
      ?auto_269963 - BLOCK
      ?auto_269964 - BLOCK
      ?auto_269965 - BLOCK
      ?auto_269966 - BLOCK
      ?auto_269967 - BLOCK
      ?auto_269968 - BLOCK
      ?auto_269969 - BLOCK
    )
    :vars
    (
      ?auto_269970 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_269969 ?auto_269970 ) ( ON-TABLE ?auto_269959 ) ( ON ?auto_269960 ?auto_269959 ) ( ON ?auto_269961 ?auto_269960 ) ( not ( = ?auto_269959 ?auto_269960 ) ) ( not ( = ?auto_269959 ?auto_269961 ) ) ( not ( = ?auto_269959 ?auto_269962 ) ) ( not ( = ?auto_269959 ?auto_269963 ) ) ( not ( = ?auto_269959 ?auto_269964 ) ) ( not ( = ?auto_269959 ?auto_269965 ) ) ( not ( = ?auto_269959 ?auto_269966 ) ) ( not ( = ?auto_269959 ?auto_269967 ) ) ( not ( = ?auto_269959 ?auto_269968 ) ) ( not ( = ?auto_269959 ?auto_269969 ) ) ( not ( = ?auto_269959 ?auto_269970 ) ) ( not ( = ?auto_269960 ?auto_269961 ) ) ( not ( = ?auto_269960 ?auto_269962 ) ) ( not ( = ?auto_269960 ?auto_269963 ) ) ( not ( = ?auto_269960 ?auto_269964 ) ) ( not ( = ?auto_269960 ?auto_269965 ) ) ( not ( = ?auto_269960 ?auto_269966 ) ) ( not ( = ?auto_269960 ?auto_269967 ) ) ( not ( = ?auto_269960 ?auto_269968 ) ) ( not ( = ?auto_269960 ?auto_269969 ) ) ( not ( = ?auto_269960 ?auto_269970 ) ) ( not ( = ?auto_269961 ?auto_269962 ) ) ( not ( = ?auto_269961 ?auto_269963 ) ) ( not ( = ?auto_269961 ?auto_269964 ) ) ( not ( = ?auto_269961 ?auto_269965 ) ) ( not ( = ?auto_269961 ?auto_269966 ) ) ( not ( = ?auto_269961 ?auto_269967 ) ) ( not ( = ?auto_269961 ?auto_269968 ) ) ( not ( = ?auto_269961 ?auto_269969 ) ) ( not ( = ?auto_269961 ?auto_269970 ) ) ( not ( = ?auto_269962 ?auto_269963 ) ) ( not ( = ?auto_269962 ?auto_269964 ) ) ( not ( = ?auto_269962 ?auto_269965 ) ) ( not ( = ?auto_269962 ?auto_269966 ) ) ( not ( = ?auto_269962 ?auto_269967 ) ) ( not ( = ?auto_269962 ?auto_269968 ) ) ( not ( = ?auto_269962 ?auto_269969 ) ) ( not ( = ?auto_269962 ?auto_269970 ) ) ( not ( = ?auto_269963 ?auto_269964 ) ) ( not ( = ?auto_269963 ?auto_269965 ) ) ( not ( = ?auto_269963 ?auto_269966 ) ) ( not ( = ?auto_269963 ?auto_269967 ) ) ( not ( = ?auto_269963 ?auto_269968 ) ) ( not ( = ?auto_269963 ?auto_269969 ) ) ( not ( = ?auto_269963 ?auto_269970 ) ) ( not ( = ?auto_269964 ?auto_269965 ) ) ( not ( = ?auto_269964 ?auto_269966 ) ) ( not ( = ?auto_269964 ?auto_269967 ) ) ( not ( = ?auto_269964 ?auto_269968 ) ) ( not ( = ?auto_269964 ?auto_269969 ) ) ( not ( = ?auto_269964 ?auto_269970 ) ) ( not ( = ?auto_269965 ?auto_269966 ) ) ( not ( = ?auto_269965 ?auto_269967 ) ) ( not ( = ?auto_269965 ?auto_269968 ) ) ( not ( = ?auto_269965 ?auto_269969 ) ) ( not ( = ?auto_269965 ?auto_269970 ) ) ( not ( = ?auto_269966 ?auto_269967 ) ) ( not ( = ?auto_269966 ?auto_269968 ) ) ( not ( = ?auto_269966 ?auto_269969 ) ) ( not ( = ?auto_269966 ?auto_269970 ) ) ( not ( = ?auto_269967 ?auto_269968 ) ) ( not ( = ?auto_269967 ?auto_269969 ) ) ( not ( = ?auto_269967 ?auto_269970 ) ) ( not ( = ?auto_269968 ?auto_269969 ) ) ( not ( = ?auto_269968 ?auto_269970 ) ) ( not ( = ?auto_269969 ?auto_269970 ) ) ( ON ?auto_269968 ?auto_269969 ) ( ON ?auto_269967 ?auto_269968 ) ( ON ?auto_269966 ?auto_269967 ) ( ON ?auto_269965 ?auto_269966 ) ( ON ?auto_269964 ?auto_269965 ) ( ON ?auto_269963 ?auto_269964 ) ( CLEAR ?auto_269961 ) ( ON ?auto_269962 ?auto_269963 ) ( CLEAR ?auto_269962 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_269959 ?auto_269960 ?auto_269961 ?auto_269962 )
      ( MAKE-11PILE ?auto_269959 ?auto_269960 ?auto_269961 ?auto_269962 ?auto_269963 ?auto_269964 ?auto_269965 ?auto_269966 ?auto_269967 ?auto_269968 ?auto_269969 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_269982 - BLOCK
      ?auto_269983 - BLOCK
      ?auto_269984 - BLOCK
      ?auto_269985 - BLOCK
      ?auto_269986 - BLOCK
      ?auto_269987 - BLOCK
      ?auto_269988 - BLOCK
      ?auto_269989 - BLOCK
      ?auto_269990 - BLOCK
      ?auto_269991 - BLOCK
      ?auto_269992 - BLOCK
    )
    :vars
    (
      ?auto_269993 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_269992 ?auto_269993 ) ( ON-TABLE ?auto_269982 ) ( ON ?auto_269983 ?auto_269982 ) ( ON ?auto_269984 ?auto_269983 ) ( not ( = ?auto_269982 ?auto_269983 ) ) ( not ( = ?auto_269982 ?auto_269984 ) ) ( not ( = ?auto_269982 ?auto_269985 ) ) ( not ( = ?auto_269982 ?auto_269986 ) ) ( not ( = ?auto_269982 ?auto_269987 ) ) ( not ( = ?auto_269982 ?auto_269988 ) ) ( not ( = ?auto_269982 ?auto_269989 ) ) ( not ( = ?auto_269982 ?auto_269990 ) ) ( not ( = ?auto_269982 ?auto_269991 ) ) ( not ( = ?auto_269982 ?auto_269992 ) ) ( not ( = ?auto_269982 ?auto_269993 ) ) ( not ( = ?auto_269983 ?auto_269984 ) ) ( not ( = ?auto_269983 ?auto_269985 ) ) ( not ( = ?auto_269983 ?auto_269986 ) ) ( not ( = ?auto_269983 ?auto_269987 ) ) ( not ( = ?auto_269983 ?auto_269988 ) ) ( not ( = ?auto_269983 ?auto_269989 ) ) ( not ( = ?auto_269983 ?auto_269990 ) ) ( not ( = ?auto_269983 ?auto_269991 ) ) ( not ( = ?auto_269983 ?auto_269992 ) ) ( not ( = ?auto_269983 ?auto_269993 ) ) ( not ( = ?auto_269984 ?auto_269985 ) ) ( not ( = ?auto_269984 ?auto_269986 ) ) ( not ( = ?auto_269984 ?auto_269987 ) ) ( not ( = ?auto_269984 ?auto_269988 ) ) ( not ( = ?auto_269984 ?auto_269989 ) ) ( not ( = ?auto_269984 ?auto_269990 ) ) ( not ( = ?auto_269984 ?auto_269991 ) ) ( not ( = ?auto_269984 ?auto_269992 ) ) ( not ( = ?auto_269984 ?auto_269993 ) ) ( not ( = ?auto_269985 ?auto_269986 ) ) ( not ( = ?auto_269985 ?auto_269987 ) ) ( not ( = ?auto_269985 ?auto_269988 ) ) ( not ( = ?auto_269985 ?auto_269989 ) ) ( not ( = ?auto_269985 ?auto_269990 ) ) ( not ( = ?auto_269985 ?auto_269991 ) ) ( not ( = ?auto_269985 ?auto_269992 ) ) ( not ( = ?auto_269985 ?auto_269993 ) ) ( not ( = ?auto_269986 ?auto_269987 ) ) ( not ( = ?auto_269986 ?auto_269988 ) ) ( not ( = ?auto_269986 ?auto_269989 ) ) ( not ( = ?auto_269986 ?auto_269990 ) ) ( not ( = ?auto_269986 ?auto_269991 ) ) ( not ( = ?auto_269986 ?auto_269992 ) ) ( not ( = ?auto_269986 ?auto_269993 ) ) ( not ( = ?auto_269987 ?auto_269988 ) ) ( not ( = ?auto_269987 ?auto_269989 ) ) ( not ( = ?auto_269987 ?auto_269990 ) ) ( not ( = ?auto_269987 ?auto_269991 ) ) ( not ( = ?auto_269987 ?auto_269992 ) ) ( not ( = ?auto_269987 ?auto_269993 ) ) ( not ( = ?auto_269988 ?auto_269989 ) ) ( not ( = ?auto_269988 ?auto_269990 ) ) ( not ( = ?auto_269988 ?auto_269991 ) ) ( not ( = ?auto_269988 ?auto_269992 ) ) ( not ( = ?auto_269988 ?auto_269993 ) ) ( not ( = ?auto_269989 ?auto_269990 ) ) ( not ( = ?auto_269989 ?auto_269991 ) ) ( not ( = ?auto_269989 ?auto_269992 ) ) ( not ( = ?auto_269989 ?auto_269993 ) ) ( not ( = ?auto_269990 ?auto_269991 ) ) ( not ( = ?auto_269990 ?auto_269992 ) ) ( not ( = ?auto_269990 ?auto_269993 ) ) ( not ( = ?auto_269991 ?auto_269992 ) ) ( not ( = ?auto_269991 ?auto_269993 ) ) ( not ( = ?auto_269992 ?auto_269993 ) ) ( ON ?auto_269991 ?auto_269992 ) ( ON ?auto_269990 ?auto_269991 ) ( ON ?auto_269989 ?auto_269990 ) ( ON ?auto_269988 ?auto_269989 ) ( ON ?auto_269987 ?auto_269988 ) ( ON ?auto_269986 ?auto_269987 ) ( CLEAR ?auto_269984 ) ( ON ?auto_269985 ?auto_269986 ) ( CLEAR ?auto_269985 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_269982 ?auto_269983 ?auto_269984 ?auto_269985 )
      ( MAKE-11PILE ?auto_269982 ?auto_269983 ?auto_269984 ?auto_269985 ?auto_269986 ?auto_269987 ?auto_269988 ?auto_269989 ?auto_269990 ?auto_269991 ?auto_269992 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_270005 - BLOCK
      ?auto_270006 - BLOCK
      ?auto_270007 - BLOCK
      ?auto_270008 - BLOCK
      ?auto_270009 - BLOCK
      ?auto_270010 - BLOCK
      ?auto_270011 - BLOCK
      ?auto_270012 - BLOCK
      ?auto_270013 - BLOCK
      ?auto_270014 - BLOCK
      ?auto_270015 - BLOCK
    )
    :vars
    (
      ?auto_270016 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_270015 ?auto_270016 ) ( ON-TABLE ?auto_270005 ) ( ON ?auto_270006 ?auto_270005 ) ( not ( = ?auto_270005 ?auto_270006 ) ) ( not ( = ?auto_270005 ?auto_270007 ) ) ( not ( = ?auto_270005 ?auto_270008 ) ) ( not ( = ?auto_270005 ?auto_270009 ) ) ( not ( = ?auto_270005 ?auto_270010 ) ) ( not ( = ?auto_270005 ?auto_270011 ) ) ( not ( = ?auto_270005 ?auto_270012 ) ) ( not ( = ?auto_270005 ?auto_270013 ) ) ( not ( = ?auto_270005 ?auto_270014 ) ) ( not ( = ?auto_270005 ?auto_270015 ) ) ( not ( = ?auto_270005 ?auto_270016 ) ) ( not ( = ?auto_270006 ?auto_270007 ) ) ( not ( = ?auto_270006 ?auto_270008 ) ) ( not ( = ?auto_270006 ?auto_270009 ) ) ( not ( = ?auto_270006 ?auto_270010 ) ) ( not ( = ?auto_270006 ?auto_270011 ) ) ( not ( = ?auto_270006 ?auto_270012 ) ) ( not ( = ?auto_270006 ?auto_270013 ) ) ( not ( = ?auto_270006 ?auto_270014 ) ) ( not ( = ?auto_270006 ?auto_270015 ) ) ( not ( = ?auto_270006 ?auto_270016 ) ) ( not ( = ?auto_270007 ?auto_270008 ) ) ( not ( = ?auto_270007 ?auto_270009 ) ) ( not ( = ?auto_270007 ?auto_270010 ) ) ( not ( = ?auto_270007 ?auto_270011 ) ) ( not ( = ?auto_270007 ?auto_270012 ) ) ( not ( = ?auto_270007 ?auto_270013 ) ) ( not ( = ?auto_270007 ?auto_270014 ) ) ( not ( = ?auto_270007 ?auto_270015 ) ) ( not ( = ?auto_270007 ?auto_270016 ) ) ( not ( = ?auto_270008 ?auto_270009 ) ) ( not ( = ?auto_270008 ?auto_270010 ) ) ( not ( = ?auto_270008 ?auto_270011 ) ) ( not ( = ?auto_270008 ?auto_270012 ) ) ( not ( = ?auto_270008 ?auto_270013 ) ) ( not ( = ?auto_270008 ?auto_270014 ) ) ( not ( = ?auto_270008 ?auto_270015 ) ) ( not ( = ?auto_270008 ?auto_270016 ) ) ( not ( = ?auto_270009 ?auto_270010 ) ) ( not ( = ?auto_270009 ?auto_270011 ) ) ( not ( = ?auto_270009 ?auto_270012 ) ) ( not ( = ?auto_270009 ?auto_270013 ) ) ( not ( = ?auto_270009 ?auto_270014 ) ) ( not ( = ?auto_270009 ?auto_270015 ) ) ( not ( = ?auto_270009 ?auto_270016 ) ) ( not ( = ?auto_270010 ?auto_270011 ) ) ( not ( = ?auto_270010 ?auto_270012 ) ) ( not ( = ?auto_270010 ?auto_270013 ) ) ( not ( = ?auto_270010 ?auto_270014 ) ) ( not ( = ?auto_270010 ?auto_270015 ) ) ( not ( = ?auto_270010 ?auto_270016 ) ) ( not ( = ?auto_270011 ?auto_270012 ) ) ( not ( = ?auto_270011 ?auto_270013 ) ) ( not ( = ?auto_270011 ?auto_270014 ) ) ( not ( = ?auto_270011 ?auto_270015 ) ) ( not ( = ?auto_270011 ?auto_270016 ) ) ( not ( = ?auto_270012 ?auto_270013 ) ) ( not ( = ?auto_270012 ?auto_270014 ) ) ( not ( = ?auto_270012 ?auto_270015 ) ) ( not ( = ?auto_270012 ?auto_270016 ) ) ( not ( = ?auto_270013 ?auto_270014 ) ) ( not ( = ?auto_270013 ?auto_270015 ) ) ( not ( = ?auto_270013 ?auto_270016 ) ) ( not ( = ?auto_270014 ?auto_270015 ) ) ( not ( = ?auto_270014 ?auto_270016 ) ) ( not ( = ?auto_270015 ?auto_270016 ) ) ( ON ?auto_270014 ?auto_270015 ) ( ON ?auto_270013 ?auto_270014 ) ( ON ?auto_270012 ?auto_270013 ) ( ON ?auto_270011 ?auto_270012 ) ( ON ?auto_270010 ?auto_270011 ) ( ON ?auto_270009 ?auto_270010 ) ( ON ?auto_270008 ?auto_270009 ) ( CLEAR ?auto_270006 ) ( ON ?auto_270007 ?auto_270008 ) ( CLEAR ?auto_270007 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_270005 ?auto_270006 ?auto_270007 )
      ( MAKE-11PILE ?auto_270005 ?auto_270006 ?auto_270007 ?auto_270008 ?auto_270009 ?auto_270010 ?auto_270011 ?auto_270012 ?auto_270013 ?auto_270014 ?auto_270015 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_270028 - BLOCK
      ?auto_270029 - BLOCK
      ?auto_270030 - BLOCK
      ?auto_270031 - BLOCK
      ?auto_270032 - BLOCK
      ?auto_270033 - BLOCK
      ?auto_270034 - BLOCK
      ?auto_270035 - BLOCK
      ?auto_270036 - BLOCK
      ?auto_270037 - BLOCK
      ?auto_270038 - BLOCK
    )
    :vars
    (
      ?auto_270039 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_270038 ?auto_270039 ) ( ON-TABLE ?auto_270028 ) ( ON ?auto_270029 ?auto_270028 ) ( not ( = ?auto_270028 ?auto_270029 ) ) ( not ( = ?auto_270028 ?auto_270030 ) ) ( not ( = ?auto_270028 ?auto_270031 ) ) ( not ( = ?auto_270028 ?auto_270032 ) ) ( not ( = ?auto_270028 ?auto_270033 ) ) ( not ( = ?auto_270028 ?auto_270034 ) ) ( not ( = ?auto_270028 ?auto_270035 ) ) ( not ( = ?auto_270028 ?auto_270036 ) ) ( not ( = ?auto_270028 ?auto_270037 ) ) ( not ( = ?auto_270028 ?auto_270038 ) ) ( not ( = ?auto_270028 ?auto_270039 ) ) ( not ( = ?auto_270029 ?auto_270030 ) ) ( not ( = ?auto_270029 ?auto_270031 ) ) ( not ( = ?auto_270029 ?auto_270032 ) ) ( not ( = ?auto_270029 ?auto_270033 ) ) ( not ( = ?auto_270029 ?auto_270034 ) ) ( not ( = ?auto_270029 ?auto_270035 ) ) ( not ( = ?auto_270029 ?auto_270036 ) ) ( not ( = ?auto_270029 ?auto_270037 ) ) ( not ( = ?auto_270029 ?auto_270038 ) ) ( not ( = ?auto_270029 ?auto_270039 ) ) ( not ( = ?auto_270030 ?auto_270031 ) ) ( not ( = ?auto_270030 ?auto_270032 ) ) ( not ( = ?auto_270030 ?auto_270033 ) ) ( not ( = ?auto_270030 ?auto_270034 ) ) ( not ( = ?auto_270030 ?auto_270035 ) ) ( not ( = ?auto_270030 ?auto_270036 ) ) ( not ( = ?auto_270030 ?auto_270037 ) ) ( not ( = ?auto_270030 ?auto_270038 ) ) ( not ( = ?auto_270030 ?auto_270039 ) ) ( not ( = ?auto_270031 ?auto_270032 ) ) ( not ( = ?auto_270031 ?auto_270033 ) ) ( not ( = ?auto_270031 ?auto_270034 ) ) ( not ( = ?auto_270031 ?auto_270035 ) ) ( not ( = ?auto_270031 ?auto_270036 ) ) ( not ( = ?auto_270031 ?auto_270037 ) ) ( not ( = ?auto_270031 ?auto_270038 ) ) ( not ( = ?auto_270031 ?auto_270039 ) ) ( not ( = ?auto_270032 ?auto_270033 ) ) ( not ( = ?auto_270032 ?auto_270034 ) ) ( not ( = ?auto_270032 ?auto_270035 ) ) ( not ( = ?auto_270032 ?auto_270036 ) ) ( not ( = ?auto_270032 ?auto_270037 ) ) ( not ( = ?auto_270032 ?auto_270038 ) ) ( not ( = ?auto_270032 ?auto_270039 ) ) ( not ( = ?auto_270033 ?auto_270034 ) ) ( not ( = ?auto_270033 ?auto_270035 ) ) ( not ( = ?auto_270033 ?auto_270036 ) ) ( not ( = ?auto_270033 ?auto_270037 ) ) ( not ( = ?auto_270033 ?auto_270038 ) ) ( not ( = ?auto_270033 ?auto_270039 ) ) ( not ( = ?auto_270034 ?auto_270035 ) ) ( not ( = ?auto_270034 ?auto_270036 ) ) ( not ( = ?auto_270034 ?auto_270037 ) ) ( not ( = ?auto_270034 ?auto_270038 ) ) ( not ( = ?auto_270034 ?auto_270039 ) ) ( not ( = ?auto_270035 ?auto_270036 ) ) ( not ( = ?auto_270035 ?auto_270037 ) ) ( not ( = ?auto_270035 ?auto_270038 ) ) ( not ( = ?auto_270035 ?auto_270039 ) ) ( not ( = ?auto_270036 ?auto_270037 ) ) ( not ( = ?auto_270036 ?auto_270038 ) ) ( not ( = ?auto_270036 ?auto_270039 ) ) ( not ( = ?auto_270037 ?auto_270038 ) ) ( not ( = ?auto_270037 ?auto_270039 ) ) ( not ( = ?auto_270038 ?auto_270039 ) ) ( ON ?auto_270037 ?auto_270038 ) ( ON ?auto_270036 ?auto_270037 ) ( ON ?auto_270035 ?auto_270036 ) ( ON ?auto_270034 ?auto_270035 ) ( ON ?auto_270033 ?auto_270034 ) ( ON ?auto_270032 ?auto_270033 ) ( ON ?auto_270031 ?auto_270032 ) ( CLEAR ?auto_270029 ) ( ON ?auto_270030 ?auto_270031 ) ( CLEAR ?auto_270030 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_270028 ?auto_270029 ?auto_270030 )
      ( MAKE-11PILE ?auto_270028 ?auto_270029 ?auto_270030 ?auto_270031 ?auto_270032 ?auto_270033 ?auto_270034 ?auto_270035 ?auto_270036 ?auto_270037 ?auto_270038 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_270051 - BLOCK
      ?auto_270052 - BLOCK
      ?auto_270053 - BLOCK
      ?auto_270054 - BLOCK
      ?auto_270055 - BLOCK
      ?auto_270056 - BLOCK
      ?auto_270057 - BLOCK
      ?auto_270058 - BLOCK
      ?auto_270059 - BLOCK
      ?auto_270060 - BLOCK
      ?auto_270061 - BLOCK
    )
    :vars
    (
      ?auto_270062 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_270061 ?auto_270062 ) ( ON-TABLE ?auto_270051 ) ( not ( = ?auto_270051 ?auto_270052 ) ) ( not ( = ?auto_270051 ?auto_270053 ) ) ( not ( = ?auto_270051 ?auto_270054 ) ) ( not ( = ?auto_270051 ?auto_270055 ) ) ( not ( = ?auto_270051 ?auto_270056 ) ) ( not ( = ?auto_270051 ?auto_270057 ) ) ( not ( = ?auto_270051 ?auto_270058 ) ) ( not ( = ?auto_270051 ?auto_270059 ) ) ( not ( = ?auto_270051 ?auto_270060 ) ) ( not ( = ?auto_270051 ?auto_270061 ) ) ( not ( = ?auto_270051 ?auto_270062 ) ) ( not ( = ?auto_270052 ?auto_270053 ) ) ( not ( = ?auto_270052 ?auto_270054 ) ) ( not ( = ?auto_270052 ?auto_270055 ) ) ( not ( = ?auto_270052 ?auto_270056 ) ) ( not ( = ?auto_270052 ?auto_270057 ) ) ( not ( = ?auto_270052 ?auto_270058 ) ) ( not ( = ?auto_270052 ?auto_270059 ) ) ( not ( = ?auto_270052 ?auto_270060 ) ) ( not ( = ?auto_270052 ?auto_270061 ) ) ( not ( = ?auto_270052 ?auto_270062 ) ) ( not ( = ?auto_270053 ?auto_270054 ) ) ( not ( = ?auto_270053 ?auto_270055 ) ) ( not ( = ?auto_270053 ?auto_270056 ) ) ( not ( = ?auto_270053 ?auto_270057 ) ) ( not ( = ?auto_270053 ?auto_270058 ) ) ( not ( = ?auto_270053 ?auto_270059 ) ) ( not ( = ?auto_270053 ?auto_270060 ) ) ( not ( = ?auto_270053 ?auto_270061 ) ) ( not ( = ?auto_270053 ?auto_270062 ) ) ( not ( = ?auto_270054 ?auto_270055 ) ) ( not ( = ?auto_270054 ?auto_270056 ) ) ( not ( = ?auto_270054 ?auto_270057 ) ) ( not ( = ?auto_270054 ?auto_270058 ) ) ( not ( = ?auto_270054 ?auto_270059 ) ) ( not ( = ?auto_270054 ?auto_270060 ) ) ( not ( = ?auto_270054 ?auto_270061 ) ) ( not ( = ?auto_270054 ?auto_270062 ) ) ( not ( = ?auto_270055 ?auto_270056 ) ) ( not ( = ?auto_270055 ?auto_270057 ) ) ( not ( = ?auto_270055 ?auto_270058 ) ) ( not ( = ?auto_270055 ?auto_270059 ) ) ( not ( = ?auto_270055 ?auto_270060 ) ) ( not ( = ?auto_270055 ?auto_270061 ) ) ( not ( = ?auto_270055 ?auto_270062 ) ) ( not ( = ?auto_270056 ?auto_270057 ) ) ( not ( = ?auto_270056 ?auto_270058 ) ) ( not ( = ?auto_270056 ?auto_270059 ) ) ( not ( = ?auto_270056 ?auto_270060 ) ) ( not ( = ?auto_270056 ?auto_270061 ) ) ( not ( = ?auto_270056 ?auto_270062 ) ) ( not ( = ?auto_270057 ?auto_270058 ) ) ( not ( = ?auto_270057 ?auto_270059 ) ) ( not ( = ?auto_270057 ?auto_270060 ) ) ( not ( = ?auto_270057 ?auto_270061 ) ) ( not ( = ?auto_270057 ?auto_270062 ) ) ( not ( = ?auto_270058 ?auto_270059 ) ) ( not ( = ?auto_270058 ?auto_270060 ) ) ( not ( = ?auto_270058 ?auto_270061 ) ) ( not ( = ?auto_270058 ?auto_270062 ) ) ( not ( = ?auto_270059 ?auto_270060 ) ) ( not ( = ?auto_270059 ?auto_270061 ) ) ( not ( = ?auto_270059 ?auto_270062 ) ) ( not ( = ?auto_270060 ?auto_270061 ) ) ( not ( = ?auto_270060 ?auto_270062 ) ) ( not ( = ?auto_270061 ?auto_270062 ) ) ( ON ?auto_270060 ?auto_270061 ) ( ON ?auto_270059 ?auto_270060 ) ( ON ?auto_270058 ?auto_270059 ) ( ON ?auto_270057 ?auto_270058 ) ( ON ?auto_270056 ?auto_270057 ) ( ON ?auto_270055 ?auto_270056 ) ( ON ?auto_270054 ?auto_270055 ) ( ON ?auto_270053 ?auto_270054 ) ( CLEAR ?auto_270051 ) ( ON ?auto_270052 ?auto_270053 ) ( CLEAR ?auto_270052 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_270051 ?auto_270052 )
      ( MAKE-11PILE ?auto_270051 ?auto_270052 ?auto_270053 ?auto_270054 ?auto_270055 ?auto_270056 ?auto_270057 ?auto_270058 ?auto_270059 ?auto_270060 ?auto_270061 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_270074 - BLOCK
      ?auto_270075 - BLOCK
      ?auto_270076 - BLOCK
      ?auto_270077 - BLOCK
      ?auto_270078 - BLOCK
      ?auto_270079 - BLOCK
      ?auto_270080 - BLOCK
      ?auto_270081 - BLOCK
      ?auto_270082 - BLOCK
      ?auto_270083 - BLOCK
      ?auto_270084 - BLOCK
    )
    :vars
    (
      ?auto_270085 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_270084 ?auto_270085 ) ( ON-TABLE ?auto_270074 ) ( not ( = ?auto_270074 ?auto_270075 ) ) ( not ( = ?auto_270074 ?auto_270076 ) ) ( not ( = ?auto_270074 ?auto_270077 ) ) ( not ( = ?auto_270074 ?auto_270078 ) ) ( not ( = ?auto_270074 ?auto_270079 ) ) ( not ( = ?auto_270074 ?auto_270080 ) ) ( not ( = ?auto_270074 ?auto_270081 ) ) ( not ( = ?auto_270074 ?auto_270082 ) ) ( not ( = ?auto_270074 ?auto_270083 ) ) ( not ( = ?auto_270074 ?auto_270084 ) ) ( not ( = ?auto_270074 ?auto_270085 ) ) ( not ( = ?auto_270075 ?auto_270076 ) ) ( not ( = ?auto_270075 ?auto_270077 ) ) ( not ( = ?auto_270075 ?auto_270078 ) ) ( not ( = ?auto_270075 ?auto_270079 ) ) ( not ( = ?auto_270075 ?auto_270080 ) ) ( not ( = ?auto_270075 ?auto_270081 ) ) ( not ( = ?auto_270075 ?auto_270082 ) ) ( not ( = ?auto_270075 ?auto_270083 ) ) ( not ( = ?auto_270075 ?auto_270084 ) ) ( not ( = ?auto_270075 ?auto_270085 ) ) ( not ( = ?auto_270076 ?auto_270077 ) ) ( not ( = ?auto_270076 ?auto_270078 ) ) ( not ( = ?auto_270076 ?auto_270079 ) ) ( not ( = ?auto_270076 ?auto_270080 ) ) ( not ( = ?auto_270076 ?auto_270081 ) ) ( not ( = ?auto_270076 ?auto_270082 ) ) ( not ( = ?auto_270076 ?auto_270083 ) ) ( not ( = ?auto_270076 ?auto_270084 ) ) ( not ( = ?auto_270076 ?auto_270085 ) ) ( not ( = ?auto_270077 ?auto_270078 ) ) ( not ( = ?auto_270077 ?auto_270079 ) ) ( not ( = ?auto_270077 ?auto_270080 ) ) ( not ( = ?auto_270077 ?auto_270081 ) ) ( not ( = ?auto_270077 ?auto_270082 ) ) ( not ( = ?auto_270077 ?auto_270083 ) ) ( not ( = ?auto_270077 ?auto_270084 ) ) ( not ( = ?auto_270077 ?auto_270085 ) ) ( not ( = ?auto_270078 ?auto_270079 ) ) ( not ( = ?auto_270078 ?auto_270080 ) ) ( not ( = ?auto_270078 ?auto_270081 ) ) ( not ( = ?auto_270078 ?auto_270082 ) ) ( not ( = ?auto_270078 ?auto_270083 ) ) ( not ( = ?auto_270078 ?auto_270084 ) ) ( not ( = ?auto_270078 ?auto_270085 ) ) ( not ( = ?auto_270079 ?auto_270080 ) ) ( not ( = ?auto_270079 ?auto_270081 ) ) ( not ( = ?auto_270079 ?auto_270082 ) ) ( not ( = ?auto_270079 ?auto_270083 ) ) ( not ( = ?auto_270079 ?auto_270084 ) ) ( not ( = ?auto_270079 ?auto_270085 ) ) ( not ( = ?auto_270080 ?auto_270081 ) ) ( not ( = ?auto_270080 ?auto_270082 ) ) ( not ( = ?auto_270080 ?auto_270083 ) ) ( not ( = ?auto_270080 ?auto_270084 ) ) ( not ( = ?auto_270080 ?auto_270085 ) ) ( not ( = ?auto_270081 ?auto_270082 ) ) ( not ( = ?auto_270081 ?auto_270083 ) ) ( not ( = ?auto_270081 ?auto_270084 ) ) ( not ( = ?auto_270081 ?auto_270085 ) ) ( not ( = ?auto_270082 ?auto_270083 ) ) ( not ( = ?auto_270082 ?auto_270084 ) ) ( not ( = ?auto_270082 ?auto_270085 ) ) ( not ( = ?auto_270083 ?auto_270084 ) ) ( not ( = ?auto_270083 ?auto_270085 ) ) ( not ( = ?auto_270084 ?auto_270085 ) ) ( ON ?auto_270083 ?auto_270084 ) ( ON ?auto_270082 ?auto_270083 ) ( ON ?auto_270081 ?auto_270082 ) ( ON ?auto_270080 ?auto_270081 ) ( ON ?auto_270079 ?auto_270080 ) ( ON ?auto_270078 ?auto_270079 ) ( ON ?auto_270077 ?auto_270078 ) ( ON ?auto_270076 ?auto_270077 ) ( CLEAR ?auto_270074 ) ( ON ?auto_270075 ?auto_270076 ) ( CLEAR ?auto_270075 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_270074 ?auto_270075 )
      ( MAKE-11PILE ?auto_270074 ?auto_270075 ?auto_270076 ?auto_270077 ?auto_270078 ?auto_270079 ?auto_270080 ?auto_270081 ?auto_270082 ?auto_270083 ?auto_270084 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_270097 - BLOCK
      ?auto_270098 - BLOCK
      ?auto_270099 - BLOCK
      ?auto_270100 - BLOCK
      ?auto_270101 - BLOCK
      ?auto_270102 - BLOCK
      ?auto_270103 - BLOCK
      ?auto_270104 - BLOCK
      ?auto_270105 - BLOCK
      ?auto_270106 - BLOCK
      ?auto_270107 - BLOCK
    )
    :vars
    (
      ?auto_270108 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_270107 ?auto_270108 ) ( not ( = ?auto_270097 ?auto_270098 ) ) ( not ( = ?auto_270097 ?auto_270099 ) ) ( not ( = ?auto_270097 ?auto_270100 ) ) ( not ( = ?auto_270097 ?auto_270101 ) ) ( not ( = ?auto_270097 ?auto_270102 ) ) ( not ( = ?auto_270097 ?auto_270103 ) ) ( not ( = ?auto_270097 ?auto_270104 ) ) ( not ( = ?auto_270097 ?auto_270105 ) ) ( not ( = ?auto_270097 ?auto_270106 ) ) ( not ( = ?auto_270097 ?auto_270107 ) ) ( not ( = ?auto_270097 ?auto_270108 ) ) ( not ( = ?auto_270098 ?auto_270099 ) ) ( not ( = ?auto_270098 ?auto_270100 ) ) ( not ( = ?auto_270098 ?auto_270101 ) ) ( not ( = ?auto_270098 ?auto_270102 ) ) ( not ( = ?auto_270098 ?auto_270103 ) ) ( not ( = ?auto_270098 ?auto_270104 ) ) ( not ( = ?auto_270098 ?auto_270105 ) ) ( not ( = ?auto_270098 ?auto_270106 ) ) ( not ( = ?auto_270098 ?auto_270107 ) ) ( not ( = ?auto_270098 ?auto_270108 ) ) ( not ( = ?auto_270099 ?auto_270100 ) ) ( not ( = ?auto_270099 ?auto_270101 ) ) ( not ( = ?auto_270099 ?auto_270102 ) ) ( not ( = ?auto_270099 ?auto_270103 ) ) ( not ( = ?auto_270099 ?auto_270104 ) ) ( not ( = ?auto_270099 ?auto_270105 ) ) ( not ( = ?auto_270099 ?auto_270106 ) ) ( not ( = ?auto_270099 ?auto_270107 ) ) ( not ( = ?auto_270099 ?auto_270108 ) ) ( not ( = ?auto_270100 ?auto_270101 ) ) ( not ( = ?auto_270100 ?auto_270102 ) ) ( not ( = ?auto_270100 ?auto_270103 ) ) ( not ( = ?auto_270100 ?auto_270104 ) ) ( not ( = ?auto_270100 ?auto_270105 ) ) ( not ( = ?auto_270100 ?auto_270106 ) ) ( not ( = ?auto_270100 ?auto_270107 ) ) ( not ( = ?auto_270100 ?auto_270108 ) ) ( not ( = ?auto_270101 ?auto_270102 ) ) ( not ( = ?auto_270101 ?auto_270103 ) ) ( not ( = ?auto_270101 ?auto_270104 ) ) ( not ( = ?auto_270101 ?auto_270105 ) ) ( not ( = ?auto_270101 ?auto_270106 ) ) ( not ( = ?auto_270101 ?auto_270107 ) ) ( not ( = ?auto_270101 ?auto_270108 ) ) ( not ( = ?auto_270102 ?auto_270103 ) ) ( not ( = ?auto_270102 ?auto_270104 ) ) ( not ( = ?auto_270102 ?auto_270105 ) ) ( not ( = ?auto_270102 ?auto_270106 ) ) ( not ( = ?auto_270102 ?auto_270107 ) ) ( not ( = ?auto_270102 ?auto_270108 ) ) ( not ( = ?auto_270103 ?auto_270104 ) ) ( not ( = ?auto_270103 ?auto_270105 ) ) ( not ( = ?auto_270103 ?auto_270106 ) ) ( not ( = ?auto_270103 ?auto_270107 ) ) ( not ( = ?auto_270103 ?auto_270108 ) ) ( not ( = ?auto_270104 ?auto_270105 ) ) ( not ( = ?auto_270104 ?auto_270106 ) ) ( not ( = ?auto_270104 ?auto_270107 ) ) ( not ( = ?auto_270104 ?auto_270108 ) ) ( not ( = ?auto_270105 ?auto_270106 ) ) ( not ( = ?auto_270105 ?auto_270107 ) ) ( not ( = ?auto_270105 ?auto_270108 ) ) ( not ( = ?auto_270106 ?auto_270107 ) ) ( not ( = ?auto_270106 ?auto_270108 ) ) ( not ( = ?auto_270107 ?auto_270108 ) ) ( ON ?auto_270106 ?auto_270107 ) ( ON ?auto_270105 ?auto_270106 ) ( ON ?auto_270104 ?auto_270105 ) ( ON ?auto_270103 ?auto_270104 ) ( ON ?auto_270102 ?auto_270103 ) ( ON ?auto_270101 ?auto_270102 ) ( ON ?auto_270100 ?auto_270101 ) ( ON ?auto_270099 ?auto_270100 ) ( ON ?auto_270098 ?auto_270099 ) ( ON ?auto_270097 ?auto_270098 ) ( CLEAR ?auto_270097 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_270097 )
      ( MAKE-11PILE ?auto_270097 ?auto_270098 ?auto_270099 ?auto_270100 ?auto_270101 ?auto_270102 ?auto_270103 ?auto_270104 ?auto_270105 ?auto_270106 ?auto_270107 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_270120 - BLOCK
      ?auto_270121 - BLOCK
      ?auto_270122 - BLOCK
      ?auto_270123 - BLOCK
      ?auto_270124 - BLOCK
      ?auto_270125 - BLOCK
      ?auto_270126 - BLOCK
      ?auto_270127 - BLOCK
      ?auto_270128 - BLOCK
      ?auto_270129 - BLOCK
      ?auto_270130 - BLOCK
    )
    :vars
    (
      ?auto_270131 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_270130 ?auto_270131 ) ( not ( = ?auto_270120 ?auto_270121 ) ) ( not ( = ?auto_270120 ?auto_270122 ) ) ( not ( = ?auto_270120 ?auto_270123 ) ) ( not ( = ?auto_270120 ?auto_270124 ) ) ( not ( = ?auto_270120 ?auto_270125 ) ) ( not ( = ?auto_270120 ?auto_270126 ) ) ( not ( = ?auto_270120 ?auto_270127 ) ) ( not ( = ?auto_270120 ?auto_270128 ) ) ( not ( = ?auto_270120 ?auto_270129 ) ) ( not ( = ?auto_270120 ?auto_270130 ) ) ( not ( = ?auto_270120 ?auto_270131 ) ) ( not ( = ?auto_270121 ?auto_270122 ) ) ( not ( = ?auto_270121 ?auto_270123 ) ) ( not ( = ?auto_270121 ?auto_270124 ) ) ( not ( = ?auto_270121 ?auto_270125 ) ) ( not ( = ?auto_270121 ?auto_270126 ) ) ( not ( = ?auto_270121 ?auto_270127 ) ) ( not ( = ?auto_270121 ?auto_270128 ) ) ( not ( = ?auto_270121 ?auto_270129 ) ) ( not ( = ?auto_270121 ?auto_270130 ) ) ( not ( = ?auto_270121 ?auto_270131 ) ) ( not ( = ?auto_270122 ?auto_270123 ) ) ( not ( = ?auto_270122 ?auto_270124 ) ) ( not ( = ?auto_270122 ?auto_270125 ) ) ( not ( = ?auto_270122 ?auto_270126 ) ) ( not ( = ?auto_270122 ?auto_270127 ) ) ( not ( = ?auto_270122 ?auto_270128 ) ) ( not ( = ?auto_270122 ?auto_270129 ) ) ( not ( = ?auto_270122 ?auto_270130 ) ) ( not ( = ?auto_270122 ?auto_270131 ) ) ( not ( = ?auto_270123 ?auto_270124 ) ) ( not ( = ?auto_270123 ?auto_270125 ) ) ( not ( = ?auto_270123 ?auto_270126 ) ) ( not ( = ?auto_270123 ?auto_270127 ) ) ( not ( = ?auto_270123 ?auto_270128 ) ) ( not ( = ?auto_270123 ?auto_270129 ) ) ( not ( = ?auto_270123 ?auto_270130 ) ) ( not ( = ?auto_270123 ?auto_270131 ) ) ( not ( = ?auto_270124 ?auto_270125 ) ) ( not ( = ?auto_270124 ?auto_270126 ) ) ( not ( = ?auto_270124 ?auto_270127 ) ) ( not ( = ?auto_270124 ?auto_270128 ) ) ( not ( = ?auto_270124 ?auto_270129 ) ) ( not ( = ?auto_270124 ?auto_270130 ) ) ( not ( = ?auto_270124 ?auto_270131 ) ) ( not ( = ?auto_270125 ?auto_270126 ) ) ( not ( = ?auto_270125 ?auto_270127 ) ) ( not ( = ?auto_270125 ?auto_270128 ) ) ( not ( = ?auto_270125 ?auto_270129 ) ) ( not ( = ?auto_270125 ?auto_270130 ) ) ( not ( = ?auto_270125 ?auto_270131 ) ) ( not ( = ?auto_270126 ?auto_270127 ) ) ( not ( = ?auto_270126 ?auto_270128 ) ) ( not ( = ?auto_270126 ?auto_270129 ) ) ( not ( = ?auto_270126 ?auto_270130 ) ) ( not ( = ?auto_270126 ?auto_270131 ) ) ( not ( = ?auto_270127 ?auto_270128 ) ) ( not ( = ?auto_270127 ?auto_270129 ) ) ( not ( = ?auto_270127 ?auto_270130 ) ) ( not ( = ?auto_270127 ?auto_270131 ) ) ( not ( = ?auto_270128 ?auto_270129 ) ) ( not ( = ?auto_270128 ?auto_270130 ) ) ( not ( = ?auto_270128 ?auto_270131 ) ) ( not ( = ?auto_270129 ?auto_270130 ) ) ( not ( = ?auto_270129 ?auto_270131 ) ) ( not ( = ?auto_270130 ?auto_270131 ) ) ( ON ?auto_270129 ?auto_270130 ) ( ON ?auto_270128 ?auto_270129 ) ( ON ?auto_270127 ?auto_270128 ) ( ON ?auto_270126 ?auto_270127 ) ( ON ?auto_270125 ?auto_270126 ) ( ON ?auto_270124 ?auto_270125 ) ( ON ?auto_270123 ?auto_270124 ) ( ON ?auto_270122 ?auto_270123 ) ( ON ?auto_270121 ?auto_270122 ) ( ON ?auto_270120 ?auto_270121 ) ( CLEAR ?auto_270120 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_270120 )
      ( MAKE-11PILE ?auto_270120 ?auto_270121 ?auto_270122 ?auto_270123 ?auto_270124 ?auto_270125 ?auto_270126 ?auto_270127 ?auto_270128 ?auto_270129 ?auto_270130 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_270144 - BLOCK
      ?auto_270145 - BLOCK
      ?auto_270146 - BLOCK
      ?auto_270147 - BLOCK
      ?auto_270148 - BLOCK
      ?auto_270149 - BLOCK
      ?auto_270150 - BLOCK
      ?auto_270151 - BLOCK
      ?auto_270152 - BLOCK
      ?auto_270153 - BLOCK
      ?auto_270154 - BLOCK
      ?auto_270155 - BLOCK
    )
    :vars
    (
      ?auto_270156 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_270154 ) ( ON ?auto_270155 ?auto_270156 ) ( CLEAR ?auto_270155 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_270144 ) ( ON ?auto_270145 ?auto_270144 ) ( ON ?auto_270146 ?auto_270145 ) ( ON ?auto_270147 ?auto_270146 ) ( ON ?auto_270148 ?auto_270147 ) ( ON ?auto_270149 ?auto_270148 ) ( ON ?auto_270150 ?auto_270149 ) ( ON ?auto_270151 ?auto_270150 ) ( ON ?auto_270152 ?auto_270151 ) ( ON ?auto_270153 ?auto_270152 ) ( ON ?auto_270154 ?auto_270153 ) ( not ( = ?auto_270144 ?auto_270145 ) ) ( not ( = ?auto_270144 ?auto_270146 ) ) ( not ( = ?auto_270144 ?auto_270147 ) ) ( not ( = ?auto_270144 ?auto_270148 ) ) ( not ( = ?auto_270144 ?auto_270149 ) ) ( not ( = ?auto_270144 ?auto_270150 ) ) ( not ( = ?auto_270144 ?auto_270151 ) ) ( not ( = ?auto_270144 ?auto_270152 ) ) ( not ( = ?auto_270144 ?auto_270153 ) ) ( not ( = ?auto_270144 ?auto_270154 ) ) ( not ( = ?auto_270144 ?auto_270155 ) ) ( not ( = ?auto_270144 ?auto_270156 ) ) ( not ( = ?auto_270145 ?auto_270146 ) ) ( not ( = ?auto_270145 ?auto_270147 ) ) ( not ( = ?auto_270145 ?auto_270148 ) ) ( not ( = ?auto_270145 ?auto_270149 ) ) ( not ( = ?auto_270145 ?auto_270150 ) ) ( not ( = ?auto_270145 ?auto_270151 ) ) ( not ( = ?auto_270145 ?auto_270152 ) ) ( not ( = ?auto_270145 ?auto_270153 ) ) ( not ( = ?auto_270145 ?auto_270154 ) ) ( not ( = ?auto_270145 ?auto_270155 ) ) ( not ( = ?auto_270145 ?auto_270156 ) ) ( not ( = ?auto_270146 ?auto_270147 ) ) ( not ( = ?auto_270146 ?auto_270148 ) ) ( not ( = ?auto_270146 ?auto_270149 ) ) ( not ( = ?auto_270146 ?auto_270150 ) ) ( not ( = ?auto_270146 ?auto_270151 ) ) ( not ( = ?auto_270146 ?auto_270152 ) ) ( not ( = ?auto_270146 ?auto_270153 ) ) ( not ( = ?auto_270146 ?auto_270154 ) ) ( not ( = ?auto_270146 ?auto_270155 ) ) ( not ( = ?auto_270146 ?auto_270156 ) ) ( not ( = ?auto_270147 ?auto_270148 ) ) ( not ( = ?auto_270147 ?auto_270149 ) ) ( not ( = ?auto_270147 ?auto_270150 ) ) ( not ( = ?auto_270147 ?auto_270151 ) ) ( not ( = ?auto_270147 ?auto_270152 ) ) ( not ( = ?auto_270147 ?auto_270153 ) ) ( not ( = ?auto_270147 ?auto_270154 ) ) ( not ( = ?auto_270147 ?auto_270155 ) ) ( not ( = ?auto_270147 ?auto_270156 ) ) ( not ( = ?auto_270148 ?auto_270149 ) ) ( not ( = ?auto_270148 ?auto_270150 ) ) ( not ( = ?auto_270148 ?auto_270151 ) ) ( not ( = ?auto_270148 ?auto_270152 ) ) ( not ( = ?auto_270148 ?auto_270153 ) ) ( not ( = ?auto_270148 ?auto_270154 ) ) ( not ( = ?auto_270148 ?auto_270155 ) ) ( not ( = ?auto_270148 ?auto_270156 ) ) ( not ( = ?auto_270149 ?auto_270150 ) ) ( not ( = ?auto_270149 ?auto_270151 ) ) ( not ( = ?auto_270149 ?auto_270152 ) ) ( not ( = ?auto_270149 ?auto_270153 ) ) ( not ( = ?auto_270149 ?auto_270154 ) ) ( not ( = ?auto_270149 ?auto_270155 ) ) ( not ( = ?auto_270149 ?auto_270156 ) ) ( not ( = ?auto_270150 ?auto_270151 ) ) ( not ( = ?auto_270150 ?auto_270152 ) ) ( not ( = ?auto_270150 ?auto_270153 ) ) ( not ( = ?auto_270150 ?auto_270154 ) ) ( not ( = ?auto_270150 ?auto_270155 ) ) ( not ( = ?auto_270150 ?auto_270156 ) ) ( not ( = ?auto_270151 ?auto_270152 ) ) ( not ( = ?auto_270151 ?auto_270153 ) ) ( not ( = ?auto_270151 ?auto_270154 ) ) ( not ( = ?auto_270151 ?auto_270155 ) ) ( not ( = ?auto_270151 ?auto_270156 ) ) ( not ( = ?auto_270152 ?auto_270153 ) ) ( not ( = ?auto_270152 ?auto_270154 ) ) ( not ( = ?auto_270152 ?auto_270155 ) ) ( not ( = ?auto_270152 ?auto_270156 ) ) ( not ( = ?auto_270153 ?auto_270154 ) ) ( not ( = ?auto_270153 ?auto_270155 ) ) ( not ( = ?auto_270153 ?auto_270156 ) ) ( not ( = ?auto_270154 ?auto_270155 ) ) ( not ( = ?auto_270154 ?auto_270156 ) ) ( not ( = ?auto_270155 ?auto_270156 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_270155 ?auto_270156 )
      ( !STACK ?auto_270155 ?auto_270154 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_270169 - BLOCK
      ?auto_270170 - BLOCK
      ?auto_270171 - BLOCK
      ?auto_270172 - BLOCK
      ?auto_270173 - BLOCK
      ?auto_270174 - BLOCK
      ?auto_270175 - BLOCK
      ?auto_270176 - BLOCK
      ?auto_270177 - BLOCK
      ?auto_270178 - BLOCK
      ?auto_270179 - BLOCK
      ?auto_270180 - BLOCK
    )
    :vars
    (
      ?auto_270181 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_270179 ) ( ON ?auto_270180 ?auto_270181 ) ( CLEAR ?auto_270180 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_270169 ) ( ON ?auto_270170 ?auto_270169 ) ( ON ?auto_270171 ?auto_270170 ) ( ON ?auto_270172 ?auto_270171 ) ( ON ?auto_270173 ?auto_270172 ) ( ON ?auto_270174 ?auto_270173 ) ( ON ?auto_270175 ?auto_270174 ) ( ON ?auto_270176 ?auto_270175 ) ( ON ?auto_270177 ?auto_270176 ) ( ON ?auto_270178 ?auto_270177 ) ( ON ?auto_270179 ?auto_270178 ) ( not ( = ?auto_270169 ?auto_270170 ) ) ( not ( = ?auto_270169 ?auto_270171 ) ) ( not ( = ?auto_270169 ?auto_270172 ) ) ( not ( = ?auto_270169 ?auto_270173 ) ) ( not ( = ?auto_270169 ?auto_270174 ) ) ( not ( = ?auto_270169 ?auto_270175 ) ) ( not ( = ?auto_270169 ?auto_270176 ) ) ( not ( = ?auto_270169 ?auto_270177 ) ) ( not ( = ?auto_270169 ?auto_270178 ) ) ( not ( = ?auto_270169 ?auto_270179 ) ) ( not ( = ?auto_270169 ?auto_270180 ) ) ( not ( = ?auto_270169 ?auto_270181 ) ) ( not ( = ?auto_270170 ?auto_270171 ) ) ( not ( = ?auto_270170 ?auto_270172 ) ) ( not ( = ?auto_270170 ?auto_270173 ) ) ( not ( = ?auto_270170 ?auto_270174 ) ) ( not ( = ?auto_270170 ?auto_270175 ) ) ( not ( = ?auto_270170 ?auto_270176 ) ) ( not ( = ?auto_270170 ?auto_270177 ) ) ( not ( = ?auto_270170 ?auto_270178 ) ) ( not ( = ?auto_270170 ?auto_270179 ) ) ( not ( = ?auto_270170 ?auto_270180 ) ) ( not ( = ?auto_270170 ?auto_270181 ) ) ( not ( = ?auto_270171 ?auto_270172 ) ) ( not ( = ?auto_270171 ?auto_270173 ) ) ( not ( = ?auto_270171 ?auto_270174 ) ) ( not ( = ?auto_270171 ?auto_270175 ) ) ( not ( = ?auto_270171 ?auto_270176 ) ) ( not ( = ?auto_270171 ?auto_270177 ) ) ( not ( = ?auto_270171 ?auto_270178 ) ) ( not ( = ?auto_270171 ?auto_270179 ) ) ( not ( = ?auto_270171 ?auto_270180 ) ) ( not ( = ?auto_270171 ?auto_270181 ) ) ( not ( = ?auto_270172 ?auto_270173 ) ) ( not ( = ?auto_270172 ?auto_270174 ) ) ( not ( = ?auto_270172 ?auto_270175 ) ) ( not ( = ?auto_270172 ?auto_270176 ) ) ( not ( = ?auto_270172 ?auto_270177 ) ) ( not ( = ?auto_270172 ?auto_270178 ) ) ( not ( = ?auto_270172 ?auto_270179 ) ) ( not ( = ?auto_270172 ?auto_270180 ) ) ( not ( = ?auto_270172 ?auto_270181 ) ) ( not ( = ?auto_270173 ?auto_270174 ) ) ( not ( = ?auto_270173 ?auto_270175 ) ) ( not ( = ?auto_270173 ?auto_270176 ) ) ( not ( = ?auto_270173 ?auto_270177 ) ) ( not ( = ?auto_270173 ?auto_270178 ) ) ( not ( = ?auto_270173 ?auto_270179 ) ) ( not ( = ?auto_270173 ?auto_270180 ) ) ( not ( = ?auto_270173 ?auto_270181 ) ) ( not ( = ?auto_270174 ?auto_270175 ) ) ( not ( = ?auto_270174 ?auto_270176 ) ) ( not ( = ?auto_270174 ?auto_270177 ) ) ( not ( = ?auto_270174 ?auto_270178 ) ) ( not ( = ?auto_270174 ?auto_270179 ) ) ( not ( = ?auto_270174 ?auto_270180 ) ) ( not ( = ?auto_270174 ?auto_270181 ) ) ( not ( = ?auto_270175 ?auto_270176 ) ) ( not ( = ?auto_270175 ?auto_270177 ) ) ( not ( = ?auto_270175 ?auto_270178 ) ) ( not ( = ?auto_270175 ?auto_270179 ) ) ( not ( = ?auto_270175 ?auto_270180 ) ) ( not ( = ?auto_270175 ?auto_270181 ) ) ( not ( = ?auto_270176 ?auto_270177 ) ) ( not ( = ?auto_270176 ?auto_270178 ) ) ( not ( = ?auto_270176 ?auto_270179 ) ) ( not ( = ?auto_270176 ?auto_270180 ) ) ( not ( = ?auto_270176 ?auto_270181 ) ) ( not ( = ?auto_270177 ?auto_270178 ) ) ( not ( = ?auto_270177 ?auto_270179 ) ) ( not ( = ?auto_270177 ?auto_270180 ) ) ( not ( = ?auto_270177 ?auto_270181 ) ) ( not ( = ?auto_270178 ?auto_270179 ) ) ( not ( = ?auto_270178 ?auto_270180 ) ) ( not ( = ?auto_270178 ?auto_270181 ) ) ( not ( = ?auto_270179 ?auto_270180 ) ) ( not ( = ?auto_270179 ?auto_270181 ) ) ( not ( = ?auto_270180 ?auto_270181 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_270180 ?auto_270181 )
      ( !STACK ?auto_270180 ?auto_270179 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_270194 - BLOCK
      ?auto_270195 - BLOCK
      ?auto_270196 - BLOCK
      ?auto_270197 - BLOCK
      ?auto_270198 - BLOCK
      ?auto_270199 - BLOCK
      ?auto_270200 - BLOCK
      ?auto_270201 - BLOCK
      ?auto_270202 - BLOCK
      ?auto_270203 - BLOCK
      ?auto_270204 - BLOCK
      ?auto_270205 - BLOCK
    )
    :vars
    (
      ?auto_270206 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_270205 ?auto_270206 ) ( ON-TABLE ?auto_270194 ) ( ON ?auto_270195 ?auto_270194 ) ( ON ?auto_270196 ?auto_270195 ) ( ON ?auto_270197 ?auto_270196 ) ( ON ?auto_270198 ?auto_270197 ) ( ON ?auto_270199 ?auto_270198 ) ( ON ?auto_270200 ?auto_270199 ) ( ON ?auto_270201 ?auto_270200 ) ( ON ?auto_270202 ?auto_270201 ) ( ON ?auto_270203 ?auto_270202 ) ( not ( = ?auto_270194 ?auto_270195 ) ) ( not ( = ?auto_270194 ?auto_270196 ) ) ( not ( = ?auto_270194 ?auto_270197 ) ) ( not ( = ?auto_270194 ?auto_270198 ) ) ( not ( = ?auto_270194 ?auto_270199 ) ) ( not ( = ?auto_270194 ?auto_270200 ) ) ( not ( = ?auto_270194 ?auto_270201 ) ) ( not ( = ?auto_270194 ?auto_270202 ) ) ( not ( = ?auto_270194 ?auto_270203 ) ) ( not ( = ?auto_270194 ?auto_270204 ) ) ( not ( = ?auto_270194 ?auto_270205 ) ) ( not ( = ?auto_270194 ?auto_270206 ) ) ( not ( = ?auto_270195 ?auto_270196 ) ) ( not ( = ?auto_270195 ?auto_270197 ) ) ( not ( = ?auto_270195 ?auto_270198 ) ) ( not ( = ?auto_270195 ?auto_270199 ) ) ( not ( = ?auto_270195 ?auto_270200 ) ) ( not ( = ?auto_270195 ?auto_270201 ) ) ( not ( = ?auto_270195 ?auto_270202 ) ) ( not ( = ?auto_270195 ?auto_270203 ) ) ( not ( = ?auto_270195 ?auto_270204 ) ) ( not ( = ?auto_270195 ?auto_270205 ) ) ( not ( = ?auto_270195 ?auto_270206 ) ) ( not ( = ?auto_270196 ?auto_270197 ) ) ( not ( = ?auto_270196 ?auto_270198 ) ) ( not ( = ?auto_270196 ?auto_270199 ) ) ( not ( = ?auto_270196 ?auto_270200 ) ) ( not ( = ?auto_270196 ?auto_270201 ) ) ( not ( = ?auto_270196 ?auto_270202 ) ) ( not ( = ?auto_270196 ?auto_270203 ) ) ( not ( = ?auto_270196 ?auto_270204 ) ) ( not ( = ?auto_270196 ?auto_270205 ) ) ( not ( = ?auto_270196 ?auto_270206 ) ) ( not ( = ?auto_270197 ?auto_270198 ) ) ( not ( = ?auto_270197 ?auto_270199 ) ) ( not ( = ?auto_270197 ?auto_270200 ) ) ( not ( = ?auto_270197 ?auto_270201 ) ) ( not ( = ?auto_270197 ?auto_270202 ) ) ( not ( = ?auto_270197 ?auto_270203 ) ) ( not ( = ?auto_270197 ?auto_270204 ) ) ( not ( = ?auto_270197 ?auto_270205 ) ) ( not ( = ?auto_270197 ?auto_270206 ) ) ( not ( = ?auto_270198 ?auto_270199 ) ) ( not ( = ?auto_270198 ?auto_270200 ) ) ( not ( = ?auto_270198 ?auto_270201 ) ) ( not ( = ?auto_270198 ?auto_270202 ) ) ( not ( = ?auto_270198 ?auto_270203 ) ) ( not ( = ?auto_270198 ?auto_270204 ) ) ( not ( = ?auto_270198 ?auto_270205 ) ) ( not ( = ?auto_270198 ?auto_270206 ) ) ( not ( = ?auto_270199 ?auto_270200 ) ) ( not ( = ?auto_270199 ?auto_270201 ) ) ( not ( = ?auto_270199 ?auto_270202 ) ) ( not ( = ?auto_270199 ?auto_270203 ) ) ( not ( = ?auto_270199 ?auto_270204 ) ) ( not ( = ?auto_270199 ?auto_270205 ) ) ( not ( = ?auto_270199 ?auto_270206 ) ) ( not ( = ?auto_270200 ?auto_270201 ) ) ( not ( = ?auto_270200 ?auto_270202 ) ) ( not ( = ?auto_270200 ?auto_270203 ) ) ( not ( = ?auto_270200 ?auto_270204 ) ) ( not ( = ?auto_270200 ?auto_270205 ) ) ( not ( = ?auto_270200 ?auto_270206 ) ) ( not ( = ?auto_270201 ?auto_270202 ) ) ( not ( = ?auto_270201 ?auto_270203 ) ) ( not ( = ?auto_270201 ?auto_270204 ) ) ( not ( = ?auto_270201 ?auto_270205 ) ) ( not ( = ?auto_270201 ?auto_270206 ) ) ( not ( = ?auto_270202 ?auto_270203 ) ) ( not ( = ?auto_270202 ?auto_270204 ) ) ( not ( = ?auto_270202 ?auto_270205 ) ) ( not ( = ?auto_270202 ?auto_270206 ) ) ( not ( = ?auto_270203 ?auto_270204 ) ) ( not ( = ?auto_270203 ?auto_270205 ) ) ( not ( = ?auto_270203 ?auto_270206 ) ) ( not ( = ?auto_270204 ?auto_270205 ) ) ( not ( = ?auto_270204 ?auto_270206 ) ) ( not ( = ?auto_270205 ?auto_270206 ) ) ( CLEAR ?auto_270203 ) ( ON ?auto_270204 ?auto_270205 ) ( CLEAR ?auto_270204 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_270194 ?auto_270195 ?auto_270196 ?auto_270197 ?auto_270198 ?auto_270199 ?auto_270200 ?auto_270201 ?auto_270202 ?auto_270203 ?auto_270204 )
      ( MAKE-12PILE ?auto_270194 ?auto_270195 ?auto_270196 ?auto_270197 ?auto_270198 ?auto_270199 ?auto_270200 ?auto_270201 ?auto_270202 ?auto_270203 ?auto_270204 ?auto_270205 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_270219 - BLOCK
      ?auto_270220 - BLOCK
      ?auto_270221 - BLOCK
      ?auto_270222 - BLOCK
      ?auto_270223 - BLOCK
      ?auto_270224 - BLOCK
      ?auto_270225 - BLOCK
      ?auto_270226 - BLOCK
      ?auto_270227 - BLOCK
      ?auto_270228 - BLOCK
      ?auto_270229 - BLOCK
      ?auto_270230 - BLOCK
    )
    :vars
    (
      ?auto_270231 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_270230 ?auto_270231 ) ( ON-TABLE ?auto_270219 ) ( ON ?auto_270220 ?auto_270219 ) ( ON ?auto_270221 ?auto_270220 ) ( ON ?auto_270222 ?auto_270221 ) ( ON ?auto_270223 ?auto_270222 ) ( ON ?auto_270224 ?auto_270223 ) ( ON ?auto_270225 ?auto_270224 ) ( ON ?auto_270226 ?auto_270225 ) ( ON ?auto_270227 ?auto_270226 ) ( ON ?auto_270228 ?auto_270227 ) ( not ( = ?auto_270219 ?auto_270220 ) ) ( not ( = ?auto_270219 ?auto_270221 ) ) ( not ( = ?auto_270219 ?auto_270222 ) ) ( not ( = ?auto_270219 ?auto_270223 ) ) ( not ( = ?auto_270219 ?auto_270224 ) ) ( not ( = ?auto_270219 ?auto_270225 ) ) ( not ( = ?auto_270219 ?auto_270226 ) ) ( not ( = ?auto_270219 ?auto_270227 ) ) ( not ( = ?auto_270219 ?auto_270228 ) ) ( not ( = ?auto_270219 ?auto_270229 ) ) ( not ( = ?auto_270219 ?auto_270230 ) ) ( not ( = ?auto_270219 ?auto_270231 ) ) ( not ( = ?auto_270220 ?auto_270221 ) ) ( not ( = ?auto_270220 ?auto_270222 ) ) ( not ( = ?auto_270220 ?auto_270223 ) ) ( not ( = ?auto_270220 ?auto_270224 ) ) ( not ( = ?auto_270220 ?auto_270225 ) ) ( not ( = ?auto_270220 ?auto_270226 ) ) ( not ( = ?auto_270220 ?auto_270227 ) ) ( not ( = ?auto_270220 ?auto_270228 ) ) ( not ( = ?auto_270220 ?auto_270229 ) ) ( not ( = ?auto_270220 ?auto_270230 ) ) ( not ( = ?auto_270220 ?auto_270231 ) ) ( not ( = ?auto_270221 ?auto_270222 ) ) ( not ( = ?auto_270221 ?auto_270223 ) ) ( not ( = ?auto_270221 ?auto_270224 ) ) ( not ( = ?auto_270221 ?auto_270225 ) ) ( not ( = ?auto_270221 ?auto_270226 ) ) ( not ( = ?auto_270221 ?auto_270227 ) ) ( not ( = ?auto_270221 ?auto_270228 ) ) ( not ( = ?auto_270221 ?auto_270229 ) ) ( not ( = ?auto_270221 ?auto_270230 ) ) ( not ( = ?auto_270221 ?auto_270231 ) ) ( not ( = ?auto_270222 ?auto_270223 ) ) ( not ( = ?auto_270222 ?auto_270224 ) ) ( not ( = ?auto_270222 ?auto_270225 ) ) ( not ( = ?auto_270222 ?auto_270226 ) ) ( not ( = ?auto_270222 ?auto_270227 ) ) ( not ( = ?auto_270222 ?auto_270228 ) ) ( not ( = ?auto_270222 ?auto_270229 ) ) ( not ( = ?auto_270222 ?auto_270230 ) ) ( not ( = ?auto_270222 ?auto_270231 ) ) ( not ( = ?auto_270223 ?auto_270224 ) ) ( not ( = ?auto_270223 ?auto_270225 ) ) ( not ( = ?auto_270223 ?auto_270226 ) ) ( not ( = ?auto_270223 ?auto_270227 ) ) ( not ( = ?auto_270223 ?auto_270228 ) ) ( not ( = ?auto_270223 ?auto_270229 ) ) ( not ( = ?auto_270223 ?auto_270230 ) ) ( not ( = ?auto_270223 ?auto_270231 ) ) ( not ( = ?auto_270224 ?auto_270225 ) ) ( not ( = ?auto_270224 ?auto_270226 ) ) ( not ( = ?auto_270224 ?auto_270227 ) ) ( not ( = ?auto_270224 ?auto_270228 ) ) ( not ( = ?auto_270224 ?auto_270229 ) ) ( not ( = ?auto_270224 ?auto_270230 ) ) ( not ( = ?auto_270224 ?auto_270231 ) ) ( not ( = ?auto_270225 ?auto_270226 ) ) ( not ( = ?auto_270225 ?auto_270227 ) ) ( not ( = ?auto_270225 ?auto_270228 ) ) ( not ( = ?auto_270225 ?auto_270229 ) ) ( not ( = ?auto_270225 ?auto_270230 ) ) ( not ( = ?auto_270225 ?auto_270231 ) ) ( not ( = ?auto_270226 ?auto_270227 ) ) ( not ( = ?auto_270226 ?auto_270228 ) ) ( not ( = ?auto_270226 ?auto_270229 ) ) ( not ( = ?auto_270226 ?auto_270230 ) ) ( not ( = ?auto_270226 ?auto_270231 ) ) ( not ( = ?auto_270227 ?auto_270228 ) ) ( not ( = ?auto_270227 ?auto_270229 ) ) ( not ( = ?auto_270227 ?auto_270230 ) ) ( not ( = ?auto_270227 ?auto_270231 ) ) ( not ( = ?auto_270228 ?auto_270229 ) ) ( not ( = ?auto_270228 ?auto_270230 ) ) ( not ( = ?auto_270228 ?auto_270231 ) ) ( not ( = ?auto_270229 ?auto_270230 ) ) ( not ( = ?auto_270229 ?auto_270231 ) ) ( not ( = ?auto_270230 ?auto_270231 ) ) ( CLEAR ?auto_270228 ) ( ON ?auto_270229 ?auto_270230 ) ( CLEAR ?auto_270229 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_270219 ?auto_270220 ?auto_270221 ?auto_270222 ?auto_270223 ?auto_270224 ?auto_270225 ?auto_270226 ?auto_270227 ?auto_270228 ?auto_270229 )
      ( MAKE-12PILE ?auto_270219 ?auto_270220 ?auto_270221 ?auto_270222 ?auto_270223 ?auto_270224 ?auto_270225 ?auto_270226 ?auto_270227 ?auto_270228 ?auto_270229 ?auto_270230 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_270244 - BLOCK
      ?auto_270245 - BLOCK
      ?auto_270246 - BLOCK
      ?auto_270247 - BLOCK
      ?auto_270248 - BLOCK
      ?auto_270249 - BLOCK
      ?auto_270250 - BLOCK
      ?auto_270251 - BLOCK
      ?auto_270252 - BLOCK
      ?auto_270253 - BLOCK
      ?auto_270254 - BLOCK
      ?auto_270255 - BLOCK
    )
    :vars
    (
      ?auto_270256 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_270255 ?auto_270256 ) ( ON-TABLE ?auto_270244 ) ( ON ?auto_270245 ?auto_270244 ) ( ON ?auto_270246 ?auto_270245 ) ( ON ?auto_270247 ?auto_270246 ) ( ON ?auto_270248 ?auto_270247 ) ( ON ?auto_270249 ?auto_270248 ) ( ON ?auto_270250 ?auto_270249 ) ( ON ?auto_270251 ?auto_270250 ) ( ON ?auto_270252 ?auto_270251 ) ( not ( = ?auto_270244 ?auto_270245 ) ) ( not ( = ?auto_270244 ?auto_270246 ) ) ( not ( = ?auto_270244 ?auto_270247 ) ) ( not ( = ?auto_270244 ?auto_270248 ) ) ( not ( = ?auto_270244 ?auto_270249 ) ) ( not ( = ?auto_270244 ?auto_270250 ) ) ( not ( = ?auto_270244 ?auto_270251 ) ) ( not ( = ?auto_270244 ?auto_270252 ) ) ( not ( = ?auto_270244 ?auto_270253 ) ) ( not ( = ?auto_270244 ?auto_270254 ) ) ( not ( = ?auto_270244 ?auto_270255 ) ) ( not ( = ?auto_270244 ?auto_270256 ) ) ( not ( = ?auto_270245 ?auto_270246 ) ) ( not ( = ?auto_270245 ?auto_270247 ) ) ( not ( = ?auto_270245 ?auto_270248 ) ) ( not ( = ?auto_270245 ?auto_270249 ) ) ( not ( = ?auto_270245 ?auto_270250 ) ) ( not ( = ?auto_270245 ?auto_270251 ) ) ( not ( = ?auto_270245 ?auto_270252 ) ) ( not ( = ?auto_270245 ?auto_270253 ) ) ( not ( = ?auto_270245 ?auto_270254 ) ) ( not ( = ?auto_270245 ?auto_270255 ) ) ( not ( = ?auto_270245 ?auto_270256 ) ) ( not ( = ?auto_270246 ?auto_270247 ) ) ( not ( = ?auto_270246 ?auto_270248 ) ) ( not ( = ?auto_270246 ?auto_270249 ) ) ( not ( = ?auto_270246 ?auto_270250 ) ) ( not ( = ?auto_270246 ?auto_270251 ) ) ( not ( = ?auto_270246 ?auto_270252 ) ) ( not ( = ?auto_270246 ?auto_270253 ) ) ( not ( = ?auto_270246 ?auto_270254 ) ) ( not ( = ?auto_270246 ?auto_270255 ) ) ( not ( = ?auto_270246 ?auto_270256 ) ) ( not ( = ?auto_270247 ?auto_270248 ) ) ( not ( = ?auto_270247 ?auto_270249 ) ) ( not ( = ?auto_270247 ?auto_270250 ) ) ( not ( = ?auto_270247 ?auto_270251 ) ) ( not ( = ?auto_270247 ?auto_270252 ) ) ( not ( = ?auto_270247 ?auto_270253 ) ) ( not ( = ?auto_270247 ?auto_270254 ) ) ( not ( = ?auto_270247 ?auto_270255 ) ) ( not ( = ?auto_270247 ?auto_270256 ) ) ( not ( = ?auto_270248 ?auto_270249 ) ) ( not ( = ?auto_270248 ?auto_270250 ) ) ( not ( = ?auto_270248 ?auto_270251 ) ) ( not ( = ?auto_270248 ?auto_270252 ) ) ( not ( = ?auto_270248 ?auto_270253 ) ) ( not ( = ?auto_270248 ?auto_270254 ) ) ( not ( = ?auto_270248 ?auto_270255 ) ) ( not ( = ?auto_270248 ?auto_270256 ) ) ( not ( = ?auto_270249 ?auto_270250 ) ) ( not ( = ?auto_270249 ?auto_270251 ) ) ( not ( = ?auto_270249 ?auto_270252 ) ) ( not ( = ?auto_270249 ?auto_270253 ) ) ( not ( = ?auto_270249 ?auto_270254 ) ) ( not ( = ?auto_270249 ?auto_270255 ) ) ( not ( = ?auto_270249 ?auto_270256 ) ) ( not ( = ?auto_270250 ?auto_270251 ) ) ( not ( = ?auto_270250 ?auto_270252 ) ) ( not ( = ?auto_270250 ?auto_270253 ) ) ( not ( = ?auto_270250 ?auto_270254 ) ) ( not ( = ?auto_270250 ?auto_270255 ) ) ( not ( = ?auto_270250 ?auto_270256 ) ) ( not ( = ?auto_270251 ?auto_270252 ) ) ( not ( = ?auto_270251 ?auto_270253 ) ) ( not ( = ?auto_270251 ?auto_270254 ) ) ( not ( = ?auto_270251 ?auto_270255 ) ) ( not ( = ?auto_270251 ?auto_270256 ) ) ( not ( = ?auto_270252 ?auto_270253 ) ) ( not ( = ?auto_270252 ?auto_270254 ) ) ( not ( = ?auto_270252 ?auto_270255 ) ) ( not ( = ?auto_270252 ?auto_270256 ) ) ( not ( = ?auto_270253 ?auto_270254 ) ) ( not ( = ?auto_270253 ?auto_270255 ) ) ( not ( = ?auto_270253 ?auto_270256 ) ) ( not ( = ?auto_270254 ?auto_270255 ) ) ( not ( = ?auto_270254 ?auto_270256 ) ) ( not ( = ?auto_270255 ?auto_270256 ) ) ( ON ?auto_270254 ?auto_270255 ) ( CLEAR ?auto_270252 ) ( ON ?auto_270253 ?auto_270254 ) ( CLEAR ?auto_270253 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_270244 ?auto_270245 ?auto_270246 ?auto_270247 ?auto_270248 ?auto_270249 ?auto_270250 ?auto_270251 ?auto_270252 ?auto_270253 )
      ( MAKE-12PILE ?auto_270244 ?auto_270245 ?auto_270246 ?auto_270247 ?auto_270248 ?auto_270249 ?auto_270250 ?auto_270251 ?auto_270252 ?auto_270253 ?auto_270254 ?auto_270255 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_270269 - BLOCK
      ?auto_270270 - BLOCK
      ?auto_270271 - BLOCK
      ?auto_270272 - BLOCK
      ?auto_270273 - BLOCK
      ?auto_270274 - BLOCK
      ?auto_270275 - BLOCK
      ?auto_270276 - BLOCK
      ?auto_270277 - BLOCK
      ?auto_270278 - BLOCK
      ?auto_270279 - BLOCK
      ?auto_270280 - BLOCK
    )
    :vars
    (
      ?auto_270281 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_270280 ?auto_270281 ) ( ON-TABLE ?auto_270269 ) ( ON ?auto_270270 ?auto_270269 ) ( ON ?auto_270271 ?auto_270270 ) ( ON ?auto_270272 ?auto_270271 ) ( ON ?auto_270273 ?auto_270272 ) ( ON ?auto_270274 ?auto_270273 ) ( ON ?auto_270275 ?auto_270274 ) ( ON ?auto_270276 ?auto_270275 ) ( ON ?auto_270277 ?auto_270276 ) ( not ( = ?auto_270269 ?auto_270270 ) ) ( not ( = ?auto_270269 ?auto_270271 ) ) ( not ( = ?auto_270269 ?auto_270272 ) ) ( not ( = ?auto_270269 ?auto_270273 ) ) ( not ( = ?auto_270269 ?auto_270274 ) ) ( not ( = ?auto_270269 ?auto_270275 ) ) ( not ( = ?auto_270269 ?auto_270276 ) ) ( not ( = ?auto_270269 ?auto_270277 ) ) ( not ( = ?auto_270269 ?auto_270278 ) ) ( not ( = ?auto_270269 ?auto_270279 ) ) ( not ( = ?auto_270269 ?auto_270280 ) ) ( not ( = ?auto_270269 ?auto_270281 ) ) ( not ( = ?auto_270270 ?auto_270271 ) ) ( not ( = ?auto_270270 ?auto_270272 ) ) ( not ( = ?auto_270270 ?auto_270273 ) ) ( not ( = ?auto_270270 ?auto_270274 ) ) ( not ( = ?auto_270270 ?auto_270275 ) ) ( not ( = ?auto_270270 ?auto_270276 ) ) ( not ( = ?auto_270270 ?auto_270277 ) ) ( not ( = ?auto_270270 ?auto_270278 ) ) ( not ( = ?auto_270270 ?auto_270279 ) ) ( not ( = ?auto_270270 ?auto_270280 ) ) ( not ( = ?auto_270270 ?auto_270281 ) ) ( not ( = ?auto_270271 ?auto_270272 ) ) ( not ( = ?auto_270271 ?auto_270273 ) ) ( not ( = ?auto_270271 ?auto_270274 ) ) ( not ( = ?auto_270271 ?auto_270275 ) ) ( not ( = ?auto_270271 ?auto_270276 ) ) ( not ( = ?auto_270271 ?auto_270277 ) ) ( not ( = ?auto_270271 ?auto_270278 ) ) ( not ( = ?auto_270271 ?auto_270279 ) ) ( not ( = ?auto_270271 ?auto_270280 ) ) ( not ( = ?auto_270271 ?auto_270281 ) ) ( not ( = ?auto_270272 ?auto_270273 ) ) ( not ( = ?auto_270272 ?auto_270274 ) ) ( not ( = ?auto_270272 ?auto_270275 ) ) ( not ( = ?auto_270272 ?auto_270276 ) ) ( not ( = ?auto_270272 ?auto_270277 ) ) ( not ( = ?auto_270272 ?auto_270278 ) ) ( not ( = ?auto_270272 ?auto_270279 ) ) ( not ( = ?auto_270272 ?auto_270280 ) ) ( not ( = ?auto_270272 ?auto_270281 ) ) ( not ( = ?auto_270273 ?auto_270274 ) ) ( not ( = ?auto_270273 ?auto_270275 ) ) ( not ( = ?auto_270273 ?auto_270276 ) ) ( not ( = ?auto_270273 ?auto_270277 ) ) ( not ( = ?auto_270273 ?auto_270278 ) ) ( not ( = ?auto_270273 ?auto_270279 ) ) ( not ( = ?auto_270273 ?auto_270280 ) ) ( not ( = ?auto_270273 ?auto_270281 ) ) ( not ( = ?auto_270274 ?auto_270275 ) ) ( not ( = ?auto_270274 ?auto_270276 ) ) ( not ( = ?auto_270274 ?auto_270277 ) ) ( not ( = ?auto_270274 ?auto_270278 ) ) ( not ( = ?auto_270274 ?auto_270279 ) ) ( not ( = ?auto_270274 ?auto_270280 ) ) ( not ( = ?auto_270274 ?auto_270281 ) ) ( not ( = ?auto_270275 ?auto_270276 ) ) ( not ( = ?auto_270275 ?auto_270277 ) ) ( not ( = ?auto_270275 ?auto_270278 ) ) ( not ( = ?auto_270275 ?auto_270279 ) ) ( not ( = ?auto_270275 ?auto_270280 ) ) ( not ( = ?auto_270275 ?auto_270281 ) ) ( not ( = ?auto_270276 ?auto_270277 ) ) ( not ( = ?auto_270276 ?auto_270278 ) ) ( not ( = ?auto_270276 ?auto_270279 ) ) ( not ( = ?auto_270276 ?auto_270280 ) ) ( not ( = ?auto_270276 ?auto_270281 ) ) ( not ( = ?auto_270277 ?auto_270278 ) ) ( not ( = ?auto_270277 ?auto_270279 ) ) ( not ( = ?auto_270277 ?auto_270280 ) ) ( not ( = ?auto_270277 ?auto_270281 ) ) ( not ( = ?auto_270278 ?auto_270279 ) ) ( not ( = ?auto_270278 ?auto_270280 ) ) ( not ( = ?auto_270278 ?auto_270281 ) ) ( not ( = ?auto_270279 ?auto_270280 ) ) ( not ( = ?auto_270279 ?auto_270281 ) ) ( not ( = ?auto_270280 ?auto_270281 ) ) ( ON ?auto_270279 ?auto_270280 ) ( CLEAR ?auto_270277 ) ( ON ?auto_270278 ?auto_270279 ) ( CLEAR ?auto_270278 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_270269 ?auto_270270 ?auto_270271 ?auto_270272 ?auto_270273 ?auto_270274 ?auto_270275 ?auto_270276 ?auto_270277 ?auto_270278 )
      ( MAKE-12PILE ?auto_270269 ?auto_270270 ?auto_270271 ?auto_270272 ?auto_270273 ?auto_270274 ?auto_270275 ?auto_270276 ?auto_270277 ?auto_270278 ?auto_270279 ?auto_270280 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_270294 - BLOCK
      ?auto_270295 - BLOCK
      ?auto_270296 - BLOCK
      ?auto_270297 - BLOCK
      ?auto_270298 - BLOCK
      ?auto_270299 - BLOCK
      ?auto_270300 - BLOCK
      ?auto_270301 - BLOCK
      ?auto_270302 - BLOCK
      ?auto_270303 - BLOCK
      ?auto_270304 - BLOCK
      ?auto_270305 - BLOCK
    )
    :vars
    (
      ?auto_270306 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_270305 ?auto_270306 ) ( ON-TABLE ?auto_270294 ) ( ON ?auto_270295 ?auto_270294 ) ( ON ?auto_270296 ?auto_270295 ) ( ON ?auto_270297 ?auto_270296 ) ( ON ?auto_270298 ?auto_270297 ) ( ON ?auto_270299 ?auto_270298 ) ( ON ?auto_270300 ?auto_270299 ) ( ON ?auto_270301 ?auto_270300 ) ( not ( = ?auto_270294 ?auto_270295 ) ) ( not ( = ?auto_270294 ?auto_270296 ) ) ( not ( = ?auto_270294 ?auto_270297 ) ) ( not ( = ?auto_270294 ?auto_270298 ) ) ( not ( = ?auto_270294 ?auto_270299 ) ) ( not ( = ?auto_270294 ?auto_270300 ) ) ( not ( = ?auto_270294 ?auto_270301 ) ) ( not ( = ?auto_270294 ?auto_270302 ) ) ( not ( = ?auto_270294 ?auto_270303 ) ) ( not ( = ?auto_270294 ?auto_270304 ) ) ( not ( = ?auto_270294 ?auto_270305 ) ) ( not ( = ?auto_270294 ?auto_270306 ) ) ( not ( = ?auto_270295 ?auto_270296 ) ) ( not ( = ?auto_270295 ?auto_270297 ) ) ( not ( = ?auto_270295 ?auto_270298 ) ) ( not ( = ?auto_270295 ?auto_270299 ) ) ( not ( = ?auto_270295 ?auto_270300 ) ) ( not ( = ?auto_270295 ?auto_270301 ) ) ( not ( = ?auto_270295 ?auto_270302 ) ) ( not ( = ?auto_270295 ?auto_270303 ) ) ( not ( = ?auto_270295 ?auto_270304 ) ) ( not ( = ?auto_270295 ?auto_270305 ) ) ( not ( = ?auto_270295 ?auto_270306 ) ) ( not ( = ?auto_270296 ?auto_270297 ) ) ( not ( = ?auto_270296 ?auto_270298 ) ) ( not ( = ?auto_270296 ?auto_270299 ) ) ( not ( = ?auto_270296 ?auto_270300 ) ) ( not ( = ?auto_270296 ?auto_270301 ) ) ( not ( = ?auto_270296 ?auto_270302 ) ) ( not ( = ?auto_270296 ?auto_270303 ) ) ( not ( = ?auto_270296 ?auto_270304 ) ) ( not ( = ?auto_270296 ?auto_270305 ) ) ( not ( = ?auto_270296 ?auto_270306 ) ) ( not ( = ?auto_270297 ?auto_270298 ) ) ( not ( = ?auto_270297 ?auto_270299 ) ) ( not ( = ?auto_270297 ?auto_270300 ) ) ( not ( = ?auto_270297 ?auto_270301 ) ) ( not ( = ?auto_270297 ?auto_270302 ) ) ( not ( = ?auto_270297 ?auto_270303 ) ) ( not ( = ?auto_270297 ?auto_270304 ) ) ( not ( = ?auto_270297 ?auto_270305 ) ) ( not ( = ?auto_270297 ?auto_270306 ) ) ( not ( = ?auto_270298 ?auto_270299 ) ) ( not ( = ?auto_270298 ?auto_270300 ) ) ( not ( = ?auto_270298 ?auto_270301 ) ) ( not ( = ?auto_270298 ?auto_270302 ) ) ( not ( = ?auto_270298 ?auto_270303 ) ) ( not ( = ?auto_270298 ?auto_270304 ) ) ( not ( = ?auto_270298 ?auto_270305 ) ) ( not ( = ?auto_270298 ?auto_270306 ) ) ( not ( = ?auto_270299 ?auto_270300 ) ) ( not ( = ?auto_270299 ?auto_270301 ) ) ( not ( = ?auto_270299 ?auto_270302 ) ) ( not ( = ?auto_270299 ?auto_270303 ) ) ( not ( = ?auto_270299 ?auto_270304 ) ) ( not ( = ?auto_270299 ?auto_270305 ) ) ( not ( = ?auto_270299 ?auto_270306 ) ) ( not ( = ?auto_270300 ?auto_270301 ) ) ( not ( = ?auto_270300 ?auto_270302 ) ) ( not ( = ?auto_270300 ?auto_270303 ) ) ( not ( = ?auto_270300 ?auto_270304 ) ) ( not ( = ?auto_270300 ?auto_270305 ) ) ( not ( = ?auto_270300 ?auto_270306 ) ) ( not ( = ?auto_270301 ?auto_270302 ) ) ( not ( = ?auto_270301 ?auto_270303 ) ) ( not ( = ?auto_270301 ?auto_270304 ) ) ( not ( = ?auto_270301 ?auto_270305 ) ) ( not ( = ?auto_270301 ?auto_270306 ) ) ( not ( = ?auto_270302 ?auto_270303 ) ) ( not ( = ?auto_270302 ?auto_270304 ) ) ( not ( = ?auto_270302 ?auto_270305 ) ) ( not ( = ?auto_270302 ?auto_270306 ) ) ( not ( = ?auto_270303 ?auto_270304 ) ) ( not ( = ?auto_270303 ?auto_270305 ) ) ( not ( = ?auto_270303 ?auto_270306 ) ) ( not ( = ?auto_270304 ?auto_270305 ) ) ( not ( = ?auto_270304 ?auto_270306 ) ) ( not ( = ?auto_270305 ?auto_270306 ) ) ( ON ?auto_270304 ?auto_270305 ) ( ON ?auto_270303 ?auto_270304 ) ( CLEAR ?auto_270301 ) ( ON ?auto_270302 ?auto_270303 ) ( CLEAR ?auto_270302 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_270294 ?auto_270295 ?auto_270296 ?auto_270297 ?auto_270298 ?auto_270299 ?auto_270300 ?auto_270301 ?auto_270302 )
      ( MAKE-12PILE ?auto_270294 ?auto_270295 ?auto_270296 ?auto_270297 ?auto_270298 ?auto_270299 ?auto_270300 ?auto_270301 ?auto_270302 ?auto_270303 ?auto_270304 ?auto_270305 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_270319 - BLOCK
      ?auto_270320 - BLOCK
      ?auto_270321 - BLOCK
      ?auto_270322 - BLOCK
      ?auto_270323 - BLOCK
      ?auto_270324 - BLOCK
      ?auto_270325 - BLOCK
      ?auto_270326 - BLOCK
      ?auto_270327 - BLOCK
      ?auto_270328 - BLOCK
      ?auto_270329 - BLOCK
      ?auto_270330 - BLOCK
    )
    :vars
    (
      ?auto_270331 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_270330 ?auto_270331 ) ( ON-TABLE ?auto_270319 ) ( ON ?auto_270320 ?auto_270319 ) ( ON ?auto_270321 ?auto_270320 ) ( ON ?auto_270322 ?auto_270321 ) ( ON ?auto_270323 ?auto_270322 ) ( ON ?auto_270324 ?auto_270323 ) ( ON ?auto_270325 ?auto_270324 ) ( ON ?auto_270326 ?auto_270325 ) ( not ( = ?auto_270319 ?auto_270320 ) ) ( not ( = ?auto_270319 ?auto_270321 ) ) ( not ( = ?auto_270319 ?auto_270322 ) ) ( not ( = ?auto_270319 ?auto_270323 ) ) ( not ( = ?auto_270319 ?auto_270324 ) ) ( not ( = ?auto_270319 ?auto_270325 ) ) ( not ( = ?auto_270319 ?auto_270326 ) ) ( not ( = ?auto_270319 ?auto_270327 ) ) ( not ( = ?auto_270319 ?auto_270328 ) ) ( not ( = ?auto_270319 ?auto_270329 ) ) ( not ( = ?auto_270319 ?auto_270330 ) ) ( not ( = ?auto_270319 ?auto_270331 ) ) ( not ( = ?auto_270320 ?auto_270321 ) ) ( not ( = ?auto_270320 ?auto_270322 ) ) ( not ( = ?auto_270320 ?auto_270323 ) ) ( not ( = ?auto_270320 ?auto_270324 ) ) ( not ( = ?auto_270320 ?auto_270325 ) ) ( not ( = ?auto_270320 ?auto_270326 ) ) ( not ( = ?auto_270320 ?auto_270327 ) ) ( not ( = ?auto_270320 ?auto_270328 ) ) ( not ( = ?auto_270320 ?auto_270329 ) ) ( not ( = ?auto_270320 ?auto_270330 ) ) ( not ( = ?auto_270320 ?auto_270331 ) ) ( not ( = ?auto_270321 ?auto_270322 ) ) ( not ( = ?auto_270321 ?auto_270323 ) ) ( not ( = ?auto_270321 ?auto_270324 ) ) ( not ( = ?auto_270321 ?auto_270325 ) ) ( not ( = ?auto_270321 ?auto_270326 ) ) ( not ( = ?auto_270321 ?auto_270327 ) ) ( not ( = ?auto_270321 ?auto_270328 ) ) ( not ( = ?auto_270321 ?auto_270329 ) ) ( not ( = ?auto_270321 ?auto_270330 ) ) ( not ( = ?auto_270321 ?auto_270331 ) ) ( not ( = ?auto_270322 ?auto_270323 ) ) ( not ( = ?auto_270322 ?auto_270324 ) ) ( not ( = ?auto_270322 ?auto_270325 ) ) ( not ( = ?auto_270322 ?auto_270326 ) ) ( not ( = ?auto_270322 ?auto_270327 ) ) ( not ( = ?auto_270322 ?auto_270328 ) ) ( not ( = ?auto_270322 ?auto_270329 ) ) ( not ( = ?auto_270322 ?auto_270330 ) ) ( not ( = ?auto_270322 ?auto_270331 ) ) ( not ( = ?auto_270323 ?auto_270324 ) ) ( not ( = ?auto_270323 ?auto_270325 ) ) ( not ( = ?auto_270323 ?auto_270326 ) ) ( not ( = ?auto_270323 ?auto_270327 ) ) ( not ( = ?auto_270323 ?auto_270328 ) ) ( not ( = ?auto_270323 ?auto_270329 ) ) ( not ( = ?auto_270323 ?auto_270330 ) ) ( not ( = ?auto_270323 ?auto_270331 ) ) ( not ( = ?auto_270324 ?auto_270325 ) ) ( not ( = ?auto_270324 ?auto_270326 ) ) ( not ( = ?auto_270324 ?auto_270327 ) ) ( not ( = ?auto_270324 ?auto_270328 ) ) ( not ( = ?auto_270324 ?auto_270329 ) ) ( not ( = ?auto_270324 ?auto_270330 ) ) ( not ( = ?auto_270324 ?auto_270331 ) ) ( not ( = ?auto_270325 ?auto_270326 ) ) ( not ( = ?auto_270325 ?auto_270327 ) ) ( not ( = ?auto_270325 ?auto_270328 ) ) ( not ( = ?auto_270325 ?auto_270329 ) ) ( not ( = ?auto_270325 ?auto_270330 ) ) ( not ( = ?auto_270325 ?auto_270331 ) ) ( not ( = ?auto_270326 ?auto_270327 ) ) ( not ( = ?auto_270326 ?auto_270328 ) ) ( not ( = ?auto_270326 ?auto_270329 ) ) ( not ( = ?auto_270326 ?auto_270330 ) ) ( not ( = ?auto_270326 ?auto_270331 ) ) ( not ( = ?auto_270327 ?auto_270328 ) ) ( not ( = ?auto_270327 ?auto_270329 ) ) ( not ( = ?auto_270327 ?auto_270330 ) ) ( not ( = ?auto_270327 ?auto_270331 ) ) ( not ( = ?auto_270328 ?auto_270329 ) ) ( not ( = ?auto_270328 ?auto_270330 ) ) ( not ( = ?auto_270328 ?auto_270331 ) ) ( not ( = ?auto_270329 ?auto_270330 ) ) ( not ( = ?auto_270329 ?auto_270331 ) ) ( not ( = ?auto_270330 ?auto_270331 ) ) ( ON ?auto_270329 ?auto_270330 ) ( ON ?auto_270328 ?auto_270329 ) ( CLEAR ?auto_270326 ) ( ON ?auto_270327 ?auto_270328 ) ( CLEAR ?auto_270327 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_270319 ?auto_270320 ?auto_270321 ?auto_270322 ?auto_270323 ?auto_270324 ?auto_270325 ?auto_270326 ?auto_270327 )
      ( MAKE-12PILE ?auto_270319 ?auto_270320 ?auto_270321 ?auto_270322 ?auto_270323 ?auto_270324 ?auto_270325 ?auto_270326 ?auto_270327 ?auto_270328 ?auto_270329 ?auto_270330 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_270344 - BLOCK
      ?auto_270345 - BLOCK
      ?auto_270346 - BLOCK
      ?auto_270347 - BLOCK
      ?auto_270348 - BLOCK
      ?auto_270349 - BLOCK
      ?auto_270350 - BLOCK
      ?auto_270351 - BLOCK
      ?auto_270352 - BLOCK
      ?auto_270353 - BLOCK
      ?auto_270354 - BLOCK
      ?auto_270355 - BLOCK
    )
    :vars
    (
      ?auto_270356 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_270355 ?auto_270356 ) ( ON-TABLE ?auto_270344 ) ( ON ?auto_270345 ?auto_270344 ) ( ON ?auto_270346 ?auto_270345 ) ( ON ?auto_270347 ?auto_270346 ) ( ON ?auto_270348 ?auto_270347 ) ( ON ?auto_270349 ?auto_270348 ) ( ON ?auto_270350 ?auto_270349 ) ( not ( = ?auto_270344 ?auto_270345 ) ) ( not ( = ?auto_270344 ?auto_270346 ) ) ( not ( = ?auto_270344 ?auto_270347 ) ) ( not ( = ?auto_270344 ?auto_270348 ) ) ( not ( = ?auto_270344 ?auto_270349 ) ) ( not ( = ?auto_270344 ?auto_270350 ) ) ( not ( = ?auto_270344 ?auto_270351 ) ) ( not ( = ?auto_270344 ?auto_270352 ) ) ( not ( = ?auto_270344 ?auto_270353 ) ) ( not ( = ?auto_270344 ?auto_270354 ) ) ( not ( = ?auto_270344 ?auto_270355 ) ) ( not ( = ?auto_270344 ?auto_270356 ) ) ( not ( = ?auto_270345 ?auto_270346 ) ) ( not ( = ?auto_270345 ?auto_270347 ) ) ( not ( = ?auto_270345 ?auto_270348 ) ) ( not ( = ?auto_270345 ?auto_270349 ) ) ( not ( = ?auto_270345 ?auto_270350 ) ) ( not ( = ?auto_270345 ?auto_270351 ) ) ( not ( = ?auto_270345 ?auto_270352 ) ) ( not ( = ?auto_270345 ?auto_270353 ) ) ( not ( = ?auto_270345 ?auto_270354 ) ) ( not ( = ?auto_270345 ?auto_270355 ) ) ( not ( = ?auto_270345 ?auto_270356 ) ) ( not ( = ?auto_270346 ?auto_270347 ) ) ( not ( = ?auto_270346 ?auto_270348 ) ) ( not ( = ?auto_270346 ?auto_270349 ) ) ( not ( = ?auto_270346 ?auto_270350 ) ) ( not ( = ?auto_270346 ?auto_270351 ) ) ( not ( = ?auto_270346 ?auto_270352 ) ) ( not ( = ?auto_270346 ?auto_270353 ) ) ( not ( = ?auto_270346 ?auto_270354 ) ) ( not ( = ?auto_270346 ?auto_270355 ) ) ( not ( = ?auto_270346 ?auto_270356 ) ) ( not ( = ?auto_270347 ?auto_270348 ) ) ( not ( = ?auto_270347 ?auto_270349 ) ) ( not ( = ?auto_270347 ?auto_270350 ) ) ( not ( = ?auto_270347 ?auto_270351 ) ) ( not ( = ?auto_270347 ?auto_270352 ) ) ( not ( = ?auto_270347 ?auto_270353 ) ) ( not ( = ?auto_270347 ?auto_270354 ) ) ( not ( = ?auto_270347 ?auto_270355 ) ) ( not ( = ?auto_270347 ?auto_270356 ) ) ( not ( = ?auto_270348 ?auto_270349 ) ) ( not ( = ?auto_270348 ?auto_270350 ) ) ( not ( = ?auto_270348 ?auto_270351 ) ) ( not ( = ?auto_270348 ?auto_270352 ) ) ( not ( = ?auto_270348 ?auto_270353 ) ) ( not ( = ?auto_270348 ?auto_270354 ) ) ( not ( = ?auto_270348 ?auto_270355 ) ) ( not ( = ?auto_270348 ?auto_270356 ) ) ( not ( = ?auto_270349 ?auto_270350 ) ) ( not ( = ?auto_270349 ?auto_270351 ) ) ( not ( = ?auto_270349 ?auto_270352 ) ) ( not ( = ?auto_270349 ?auto_270353 ) ) ( not ( = ?auto_270349 ?auto_270354 ) ) ( not ( = ?auto_270349 ?auto_270355 ) ) ( not ( = ?auto_270349 ?auto_270356 ) ) ( not ( = ?auto_270350 ?auto_270351 ) ) ( not ( = ?auto_270350 ?auto_270352 ) ) ( not ( = ?auto_270350 ?auto_270353 ) ) ( not ( = ?auto_270350 ?auto_270354 ) ) ( not ( = ?auto_270350 ?auto_270355 ) ) ( not ( = ?auto_270350 ?auto_270356 ) ) ( not ( = ?auto_270351 ?auto_270352 ) ) ( not ( = ?auto_270351 ?auto_270353 ) ) ( not ( = ?auto_270351 ?auto_270354 ) ) ( not ( = ?auto_270351 ?auto_270355 ) ) ( not ( = ?auto_270351 ?auto_270356 ) ) ( not ( = ?auto_270352 ?auto_270353 ) ) ( not ( = ?auto_270352 ?auto_270354 ) ) ( not ( = ?auto_270352 ?auto_270355 ) ) ( not ( = ?auto_270352 ?auto_270356 ) ) ( not ( = ?auto_270353 ?auto_270354 ) ) ( not ( = ?auto_270353 ?auto_270355 ) ) ( not ( = ?auto_270353 ?auto_270356 ) ) ( not ( = ?auto_270354 ?auto_270355 ) ) ( not ( = ?auto_270354 ?auto_270356 ) ) ( not ( = ?auto_270355 ?auto_270356 ) ) ( ON ?auto_270354 ?auto_270355 ) ( ON ?auto_270353 ?auto_270354 ) ( ON ?auto_270352 ?auto_270353 ) ( CLEAR ?auto_270350 ) ( ON ?auto_270351 ?auto_270352 ) ( CLEAR ?auto_270351 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_270344 ?auto_270345 ?auto_270346 ?auto_270347 ?auto_270348 ?auto_270349 ?auto_270350 ?auto_270351 )
      ( MAKE-12PILE ?auto_270344 ?auto_270345 ?auto_270346 ?auto_270347 ?auto_270348 ?auto_270349 ?auto_270350 ?auto_270351 ?auto_270352 ?auto_270353 ?auto_270354 ?auto_270355 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_270369 - BLOCK
      ?auto_270370 - BLOCK
      ?auto_270371 - BLOCK
      ?auto_270372 - BLOCK
      ?auto_270373 - BLOCK
      ?auto_270374 - BLOCK
      ?auto_270375 - BLOCK
      ?auto_270376 - BLOCK
      ?auto_270377 - BLOCK
      ?auto_270378 - BLOCK
      ?auto_270379 - BLOCK
      ?auto_270380 - BLOCK
    )
    :vars
    (
      ?auto_270381 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_270380 ?auto_270381 ) ( ON-TABLE ?auto_270369 ) ( ON ?auto_270370 ?auto_270369 ) ( ON ?auto_270371 ?auto_270370 ) ( ON ?auto_270372 ?auto_270371 ) ( ON ?auto_270373 ?auto_270372 ) ( ON ?auto_270374 ?auto_270373 ) ( ON ?auto_270375 ?auto_270374 ) ( not ( = ?auto_270369 ?auto_270370 ) ) ( not ( = ?auto_270369 ?auto_270371 ) ) ( not ( = ?auto_270369 ?auto_270372 ) ) ( not ( = ?auto_270369 ?auto_270373 ) ) ( not ( = ?auto_270369 ?auto_270374 ) ) ( not ( = ?auto_270369 ?auto_270375 ) ) ( not ( = ?auto_270369 ?auto_270376 ) ) ( not ( = ?auto_270369 ?auto_270377 ) ) ( not ( = ?auto_270369 ?auto_270378 ) ) ( not ( = ?auto_270369 ?auto_270379 ) ) ( not ( = ?auto_270369 ?auto_270380 ) ) ( not ( = ?auto_270369 ?auto_270381 ) ) ( not ( = ?auto_270370 ?auto_270371 ) ) ( not ( = ?auto_270370 ?auto_270372 ) ) ( not ( = ?auto_270370 ?auto_270373 ) ) ( not ( = ?auto_270370 ?auto_270374 ) ) ( not ( = ?auto_270370 ?auto_270375 ) ) ( not ( = ?auto_270370 ?auto_270376 ) ) ( not ( = ?auto_270370 ?auto_270377 ) ) ( not ( = ?auto_270370 ?auto_270378 ) ) ( not ( = ?auto_270370 ?auto_270379 ) ) ( not ( = ?auto_270370 ?auto_270380 ) ) ( not ( = ?auto_270370 ?auto_270381 ) ) ( not ( = ?auto_270371 ?auto_270372 ) ) ( not ( = ?auto_270371 ?auto_270373 ) ) ( not ( = ?auto_270371 ?auto_270374 ) ) ( not ( = ?auto_270371 ?auto_270375 ) ) ( not ( = ?auto_270371 ?auto_270376 ) ) ( not ( = ?auto_270371 ?auto_270377 ) ) ( not ( = ?auto_270371 ?auto_270378 ) ) ( not ( = ?auto_270371 ?auto_270379 ) ) ( not ( = ?auto_270371 ?auto_270380 ) ) ( not ( = ?auto_270371 ?auto_270381 ) ) ( not ( = ?auto_270372 ?auto_270373 ) ) ( not ( = ?auto_270372 ?auto_270374 ) ) ( not ( = ?auto_270372 ?auto_270375 ) ) ( not ( = ?auto_270372 ?auto_270376 ) ) ( not ( = ?auto_270372 ?auto_270377 ) ) ( not ( = ?auto_270372 ?auto_270378 ) ) ( not ( = ?auto_270372 ?auto_270379 ) ) ( not ( = ?auto_270372 ?auto_270380 ) ) ( not ( = ?auto_270372 ?auto_270381 ) ) ( not ( = ?auto_270373 ?auto_270374 ) ) ( not ( = ?auto_270373 ?auto_270375 ) ) ( not ( = ?auto_270373 ?auto_270376 ) ) ( not ( = ?auto_270373 ?auto_270377 ) ) ( not ( = ?auto_270373 ?auto_270378 ) ) ( not ( = ?auto_270373 ?auto_270379 ) ) ( not ( = ?auto_270373 ?auto_270380 ) ) ( not ( = ?auto_270373 ?auto_270381 ) ) ( not ( = ?auto_270374 ?auto_270375 ) ) ( not ( = ?auto_270374 ?auto_270376 ) ) ( not ( = ?auto_270374 ?auto_270377 ) ) ( not ( = ?auto_270374 ?auto_270378 ) ) ( not ( = ?auto_270374 ?auto_270379 ) ) ( not ( = ?auto_270374 ?auto_270380 ) ) ( not ( = ?auto_270374 ?auto_270381 ) ) ( not ( = ?auto_270375 ?auto_270376 ) ) ( not ( = ?auto_270375 ?auto_270377 ) ) ( not ( = ?auto_270375 ?auto_270378 ) ) ( not ( = ?auto_270375 ?auto_270379 ) ) ( not ( = ?auto_270375 ?auto_270380 ) ) ( not ( = ?auto_270375 ?auto_270381 ) ) ( not ( = ?auto_270376 ?auto_270377 ) ) ( not ( = ?auto_270376 ?auto_270378 ) ) ( not ( = ?auto_270376 ?auto_270379 ) ) ( not ( = ?auto_270376 ?auto_270380 ) ) ( not ( = ?auto_270376 ?auto_270381 ) ) ( not ( = ?auto_270377 ?auto_270378 ) ) ( not ( = ?auto_270377 ?auto_270379 ) ) ( not ( = ?auto_270377 ?auto_270380 ) ) ( not ( = ?auto_270377 ?auto_270381 ) ) ( not ( = ?auto_270378 ?auto_270379 ) ) ( not ( = ?auto_270378 ?auto_270380 ) ) ( not ( = ?auto_270378 ?auto_270381 ) ) ( not ( = ?auto_270379 ?auto_270380 ) ) ( not ( = ?auto_270379 ?auto_270381 ) ) ( not ( = ?auto_270380 ?auto_270381 ) ) ( ON ?auto_270379 ?auto_270380 ) ( ON ?auto_270378 ?auto_270379 ) ( ON ?auto_270377 ?auto_270378 ) ( CLEAR ?auto_270375 ) ( ON ?auto_270376 ?auto_270377 ) ( CLEAR ?auto_270376 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_270369 ?auto_270370 ?auto_270371 ?auto_270372 ?auto_270373 ?auto_270374 ?auto_270375 ?auto_270376 )
      ( MAKE-12PILE ?auto_270369 ?auto_270370 ?auto_270371 ?auto_270372 ?auto_270373 ?auto_270374 ?auto_270375 ?auto_270376 ?auto_270377 ?auto_270378 ?auto_270379 ?auto_270380 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_270394 - BLOCK
      ?auto_270395 - BLOCK
      ?auto_270396 - BLOCK
      ?auto_270397 - BLOCK
      ?auto_270398 - BLOCK
      ?auto_270399 - BLOCK
      ?auto_270400 - BLOCK
      ?auto_270401 - BLOCK
      ?auto_270402 - BLOCK
      ?auto_270403 - BLOCK
      ?auto_270404 - BLOCK
      ?auto_270405 - BLOCK
    )
    :vars
    (
      ?auto_270406 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_270405 ?auto_270406 ) ( ON-TABLE ?auto_270394 ) ( ON ?auto_270395 ?auto_270394 ) ( ON ?auto_270396 ?auto_270395 ) ( ON ?auto_270397 ?auto_270396 ) ( ON ?auto_270398 ?auto_270397 ) ( ON ?auto_270399 ?auto_270398 ) ( not ( = ?auto_270394 ?auto_270395 ) ) ( not ( = ?auto_270394 ?auto_270396 ) ) ( not ( = ?auto_270394 ?auto_270397 ) ) ( not ( = ?auto_270394 ?auto_270398 ) ) ( not ( = ?auto_270394 ?auto_270399 ) ) ( not ( = ?auto_270394 ?auto_270400 ) ) ( not ( = ?auto_270394 ?auto_270401 ) ) ( not ( = ?auto_270394 ?auto_270402 ) ) ( not ( = ?auto_270394 ?auto_270403 ) ) ( not ( = ?auto_270394 ?auto_270404 ) ) ( not ( = ?auto_270394 ?auto_270405 ) ) ( not ( = ?auto_270394 ?auto_270406 ) ) ( not ( = ?auto_270395 ?auto_270396 ) ) ( not ( = ?auto_270395 ?auto_270397 ) ) ( not ( = ?auto_270395 ?auto_270398 ) ) ( not ( = ?auto_270395 ?auto_270399 ) ) ( not ( = ?auto_270395 ?auto_270400 ) ) ( not ( = ?auto_270395 ?auto_270401 ) ) ( not ( = ?auto_270395 ?auto_270402 ) ) ( not ( = ?auto_270395 ?auto_270403 ) ) ( not ( = ?auto_270395 ?auto_270404 ) ) ( not ( = ?auto_270395 ?auto_270405 ) ) ( not ( = ?auto_270395 ?auto_270406 ) ) ( not ( = ?auto_270396 ?auto_270397 ) ) ( not ( = ?auto_270396 ?auto_270398 ) ) ( not ( = ?auto_270396 ?auto_270399 ) ) ( not ( = ?auto_270396 ?auto_270400 ) ) ( not ( = ?auto_270396 ?auto_270401 ) ) ( not ( = ?auto_270396 ?auto_270402 ) ) ( not ( = ?auto_270396 ?auto_270403 ) ) ( not ( = ?auto_270396 ?auto_270404 ) ) ( not ( = ?auto_270396 ?auto_270405 ) ) ( not ( = ?auto_270396 ?auto_270406 ) ) ( not ( = ?auto_270397 ?auto_270398 ) ) ( not ( = ?auto_270397 ?auto_270399 ) ) ( not ( = ?auto_270397 ?auto_270400 ) ) ( not ( = ?auto_270397 ?auto_270401 ) ) ( not ( = ?auto_270397 ?auto_270402 ) ) ( not ( = ?auto_270397 ?auto_270403 ) ) ( not ( = ?auto_270397 ?auto_270404 ) ) ( not ( = ?auto_270397 ?auto_270405 ) ) ( not ( = ?auto_270397 ?auto_270406 ) ) ( not ( = ?auto_270398 ?auto_270399 ) ) ( not ( = ?auto_270398 ?auto_270400 ) ) ( not ( = ?auto_270398 ?auto_270401 ) ) ( not ( = ?auto_270398 ?auto_270402 ) ) ( not ( = ?auto_270398 ?auto_270403 ) ) ( not ( = ?auto_270398 ?auto_270404 ) ) ( not ( = ?auto_270398 ?auto_270405 ) ) ( not ( = ?auto_270398 ?auto_270406 ) ) ( not ( = ?auto_270399 ?auto_270400 ) ) ( not ( = ?auto_270399 ?auto_270401 ) ) ( not ( = ?auto_270399 ?auto_270402 ) ) ( not ( = ?auto_270399 ?auto_270403 ) ) ( not ( = ?auto_270399 ?auto_270404 ) ) ( not ( = ?auto_270399 ?auto_270405 ) ) ( not ( = ?auto_270399 ?auto_270406 ) ) ( not ( = ?auto_270400 ?auto_270401 ) ) ( not ( = ?auto_270400 ?auto_270402 ) ) ( not ( = ?auto_270400 ?auto_270403 ) ) ( not ( = ?auto_270400 ?auto_270404 ) ) ( not ( = ?auto_270400 ?auto_270405 ) ) ( not ( = ?auto_270400 ?auto_270406 ) ) ( not ( = ?auto_270401 ?auto_270402 ) ) ( not ( = ?auto_270401 ?auto_270403 ) ) ( not ( = ?auto_270401 ?auto_270404 ) ) ( not ( = ?auto_270401 ?auto_270405 ) ) ( not ( = ?auto_270401 ?auto_270406 ) ) ( not ( = ?auto_270402 ?auto_270403 ) ) ( not ( = ?auto_270402 ?auto_270404 ) ) ( not ( = ?auto_270402 ?auto_270405 ) ) ( not ( = ?auto_270402 ?auto_270406 ) ) ( not ( = ?auto_270403 ?auto_270404 ) ) ( not ( = ?auto_270403 ?auto_270405 ) ) ( not ( = ?auto_270403 ?auto_270406 ) ) ( not ( = ?auto_270404 ?auto_270405 ) ) ( not ( = ?auto_270404 ?auto_270406 ) ) ( not ( = ?auto_270405 ?auto_270406 ) ) ( ON ?auto_270404 ?auto_270405 ) ( ON ?auto_270403 ?auto_270404 ) ( ON ?auto_270402 ?auto_270403 ) ( ON ?auto_270401 ?auto_270402 ) ( CLEAR ?auto_270399 ) ( ON ?auto_270400 ?auto_270401 ) ( CLEAR ?auto_270400 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_270394 ?auto_270395 ?auto_270396 ?auto_270397 ?auto_270398 ?auto_270399 ?auto_270400 )
      ( MAKE-12PILE ?auto_270394 ?auto_270395 ?auto_270396 ?auto_270397 ?auto_270398 ?auto_270399 ?auto_270400 ?auto_270401 ?auto_270402 ?auto_270403 ?auto_270404 ?auto_270405 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_270419 - BLOCK
      ?auto_270420 - BLOCK
      ?auto_270421 - BLOCK
      ?auto_270422 - BLOCK
      ?auto_270423 - BLOCK
      ?auto_270424 - BLOCK
      ?auto_270425 - BLOCK
      ?auto_270426 - BLOCK
      ?auto_270427 - BLOCK
      ?auto_270428 - BLOCK
      ?auto_270429 - BLOCK
      ?auto_270430 - BLOCK
    )
    :vars
    (
      ?auto_270431 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_270430 ?auto_270431 ) ( ON-TABLE ?auto_270419 ) ( ON ?auto_270420 ?auto_270419 ) ( ON ?auto_270421 ?auto_270420 ) ( ON ?auto_270422 ?auto_270421 ) ( ON ?auto_270423 ?auto_270422 ) ( ON ?auto_270424 ?auto_270423 ) ( not ( = ?auto_270419 ?auto_270420 ) ) ( not ( = ?auto_270419 ?auto_270421 ) ) ( not ( = ?auto_270419 ?auto_270422 ) ) ( not ( = ?auto_270419 ?auto_270423 ) ) ( not ( = ?auto_270419 ?auto_270424 ) ) ( not ( = ?auto_270419 ?auto_270425 ) ) ( not ( = ?auto_270419 ?auto_270426 ) ) ( not ( = ?auto_270419 ?auto_270427 ) ) ( not ( = ?auto_270419 ?auto_270428 ) ) ( not ( = ?auto_270419 ?auto_270429 ) ) ( not ( = ?auto_270419 ?auto_270430 ) ) ( not ( = ?auto_270419 ?auto_270431 ) ) ( not ( = ?auto_270420 ?auto_270421 ) ) ( not ( = ?auto_270420 ?auto_270422 ) ) ( not ( = ?auto_270420 ?auto_270423 ) ) ( not ( = ?auto_270420 ?auto_270424 ) ) ( not ( = ?auto_270420 ?auto_270425 ) ) ( not ( = ?auto_270420 ?auto_270426 ) ) ( not ( = ?auto_270420 ?auto_270427 ) ) ( not ( = ?auto_270420 ?auto_270428 ) ) ( not ( = ?auto_270420 ?auto_270429 ) ) ( not ( = ?auto_270420 ?auto_270430 ) ) ( not ( = ?auto_270420 ?auto_270431 ) ) ( not ( = ?auto_270421 ?auto_270422 ) ) ( not ( = ?auto_270421 ?auto_270423 ) ) ( not ( = ?auto_270421 ?auto_270424 ) ) ( not ( = ?auto_270421 ?auto_270425 ) ) ( not ( = ?auto_270421 ?auto_270426 ) ) ( not ( = ?auto_270421 ?auto_270427 ) ) ( not ( = ?auto_270421 ?auto_270428 ) ) ( not ( = ?auto_270421 ?auto_270429 ) ) ( not ( = ?auto_270421 ?auto_270430 ) ) ( not ( = ?auto_270421 ?auto_270431 ) ) ( not ( = ?auto_270422 ?auto_270423 ) ) ( not ( = ?auto_270422 ?auto_270424 ) ) ( not ( = ?auto_270422 ?auto_270425 ) ) ( not ( = ?auto_270422 ?auto_270426 ) ) ( not ( = ?auto_270422 ?auto_270427 ) ) ( not ( = ?auto_270422 ?auto_270428 ) ) ( not ( = ?auto_270422 ?auto_270429 ) ) ( not ( = ?auto_270422 ?auto_270430 ) ) ( not ( = ?auto_270422 ?auto_270431 ) ) ( not ( = ?auto_270423 ?auto_270424 ) ) ( not ( = ?auto_270423 ?auto_270425 ) ) ( not ( = ?auto_270423 ?auto_270426 ) ) ( not ( = ?auto_270423 ?auto_270427 ) ) ( not ( = ?auto_270423 ?auto_270428 ) ) ( not ( = ?auto_270423 ?auto_270429 ) ) ( not ( = ?auto_270423 ?auto_270430 ) ) ( not ( = ?auto_270423 ?auto_270431 ) ) ( not ( = ?auto_270424 ?auto_270425 ) ) ( not ( = ?auto_270424 ?auto_270426 ) ) ( not ( = ?auto_270424 ?auto_270427 ) ) ( not ( = ?auto_270424 ?auto_270428 ) ) ( not ( = ?auto_270424 ?auto_270429 ) ) ( not ( = ?auto_270424 ?auto_270430 ) ) ( not ( = ?auto_270424 ?auto_270431 ) ) ( not ( = ?auto_270425 ?auto_270426 ) ) ( not ( = ?auto_270425 ?auto_270427 ) ) ( not ( = ?auto_270425 ?auto_270428 ) ) ( not ( = ?auto_270425 ?auto_270429 ) ) ( not ( = ?auto_270425 ?auto_270430 ) ) ( not ( = ?auto_270425 ?auto_270431 ) ) ( not ( = ?auto_270426 ?auto_270427 ) ) ( not ( = ?auto_270426 ?auto_270428 ) ) ( not ( = ?auto_270426 ?auto_270429 ) ) ( not ( = ?auto_270426 ?auto_270430 ) ) ( not ( = ?auto_270426 ?auto_270431 ) ) ( not ( = ?auto_270427 ?auto_270428 ) ) ( not ( = ?auto_270427 ?auto_270429 ) ) ( not ( = ?auto_270427 ?auto_270430 ) ) ( not ( = ?auto_270427 ?auto_270431 ) ) ( not ( = ?auto_270428 ?auto_270429 ) ) ( not ( = ?auto_270428 ?auto_270430 ) ) ( not ( = ?auto_270428 ?auto_270431 ) ) ( not ( = ?auto_270429 ?auto_270430 ) ) ( not ( = ?auto_270429 ?auto_270431 ) ) ( not ( = ?auto_270430 ?auto_270431 ) ) ( ON ?auto_270429 ?auto_270430 ) ( ON ?auto_270428 ?auto_270429 ) ( ON ?auto_270427 ?auto_270428 ) ( ON ?auto_270426 ?auto_270427 ) ( CLEAR ?auto_270424 ) ( ON ?auto_270425 ?auto_270426 ) ( CLEAR ?auto_270425 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_270419 ?auto_270420 ?auto_270421 ?auto_270422 ?auto_270423 ?auto_270424 ?auto_270425 )
      ( MAKE-12PILE ?auto_270419 ?auto_270420 ?auto_270421 ?auto_270422 ?auto_270423 ?auto_270424 ?auto_270425 ?auto_270426 ?auto_270427 ?auto_270428 ?auto_270429 ?auto_270430 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_270444 - BLOCK
      ?auto_270445 - BLOCK
      ?auto_270446 - BLOCK
      ?auto_270447 - BLOCK
      ?auto_270448 - BLOCK
      ?auto_270449 - BLOCK
      ?auto_270450 - BLOCK
      ?auto_270451 - BLOCK
      ?auto_270452 - BLOCK
      ?auto_270453 - BLOCK
      ?auto_270454 - BLOCK
      ?auto_270455 - BLOCK
    )
    :vars
    (
      ?auto_270456 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_270455 ?auto_270456 ) ( ON-TABLE ?auto_270444 ) ( ON ?auto_270445 ?auto_270444 ) ( ON ?auto_270446 ?auto_270445 ) ( ON ?auto_270447 ?auto_270446 ) ( ON ?auto_270448 ?auto_270447 ) ( not ( = ?auto_270444 ?auto_270445 ) ) ( not ( = ?auto_270444 ?auto_270446 ) ) ( not ( = ?auto_270444 ?auto_270447 ) ) ( not ( = ?auto_270444 ?auto_270448 ) ) ( not ( = ?auto_270444 ?auto_270449 ) ) ( not ( = ?auto_270444 ?auto_270450 ) ) ( not ( = ?auto_270444 ?auto_270451 ) ) ( not ( = ?auto_270444 ?auto_270452 ) ) ( not ( = ?auto_270444 ?auto_270453 ) ) ( not ( = ?auto_270444 ?auto_270454 ) ) ( not ( = ?auto_270444 ?auto_270455 ) ) ( not ( = ?auto_270444 ?auto_270456 ) ) ( not ( = ?auto_270445 ?auto_270446 ) ) ( not ( = ?auto_270445 ?auto_270447 ) ) ( not ( = ?auto_270445 ?auto_270448 ) ) ( not ( = ?auto_270445 ?auto_270449 ) ) ( not ( = ?auto_270445 ?auto_270450 ) ) ( not ( = ?auto_270445 ?auto_270451 ) ) ( not ( = ?auto_270445 ?auto_270452 ) ) ( not ( = ?auto_270445 ?auto_270453 ) ) ( not ( = ?auto_270445 ?auto_270454 ) ) ( not ( = ?auto_270445 ?auto_270455 ) ) ( not ( = ?auto_270445 ?auto_270456 ) ) ( not ( = ?auto_270446 ?auto_270447 ) ) ( not ( = ?auto_270446 ?auto_270448 ) ) ( not ( = ?auto_270446 ?auto_270449 ) ) ( not ( = ?auto_270446 ?auto_270450 ) ) ( not ( = ?auto_270446 ?auto_270451 ) ) ( not ( = ?auto_270446 ?auto_270452 ) ) ( not ( = ?auto_270446 ?auto_270453 ) ) ( not ( = ?auto_270446 ?auto_270454 ) ) ( not ( = ?auto_270446 ?auto_270455 ) ) ( not ( = ?auto_270446 ?auto_270456 ) ) ( not ( = ?auto_270447 ?auto_270448 ) ) ( not ( = ?auto_270447 ?auto_270449 ) ) ( not ( = ?auto_270447 ?auto_270450 ) ) ( not ( = ?auto_270447 ?auto_270451 ) ) ( not ( = ?auto_270447 ?auto_270452 ) ) ( not ( = ?auto_270447 ?auto_270453 ) ) ( not ( = ?auto_270447 ?auto_270454 ) ) ( not ( = ?auto_270447 ?auto_270455 ) ) ( not ( = ?auto_270447 ?auto_270456 ) ) ( not ( = ?auto_270448 ?auto_270449 ) ) ( not ( = ?auto_270448 ?auto_270450 ) ) ( not ( = ?auto_270448 ?auto_270451 ) ) ( not ( = ?auto_270448 ?auto_270452 ) ) ( not ( = ?auto_270448 ?auto_270453 ) ) ( not ( = ?auto_270448 ?auto_270454 ) ) ( not ( = ?auto_270448 ?auto_270455 ) ) ( not ( = ?auto_270448 ?auto_270456 ) ) ( not ( = ?auto_270449 ?auto_270450 ) ) ( not ( = ?auto_270449 ?auto_270451 ) ) ( not ( = ?auto_270449 ?auto_270452 ) ) ( not ( = ?auto_270449 ?auto_270453 ) ) ( not ( = ?auto_270449 ?auto_270454 ) ) ( not ( = ?auto_270449 ?auto_270455 ) ) ( not ( = ?auto_270449 ?auto_270456 ) ) ( not ( = ?auto_270450 ?auto_270451 ) ) ( not ( = ?auto_270450 ?auto_270452 ) ) ( not ( = ?auto_270450 ?auto_270453 ) ) ( not ( = ?auto_270450 ?auto_270454 ) ) ( not ( = ?auto_270450 ?auto_270455 ) ) ( not ( = ?auto_270450 ?auto_270456 ) ) ( not ( = ?auto_270451 ?auto_270452 ) ) ( not ( = ?auto_270451 ?auto_270453 ) ) ( not ( = ?auto_270451 ?auto_270454 ) ) ( not ( = ?auto_270451 ?auto_270455 ) ) ( not ( = ?auto_270451 ?auto_270456 ) ) ( not ( = ?auto_270452 ?auto_270453 ) ) ( not ( = ?auto_270452 ?auto_270454 ) ) ( not ( = ?auto_270452 ?auto_270455 ) ) ( not ( = ?auto_270452 ?auto_270456 ) ) ( not ( = ?auto_270453 ?auto_270454 ) ) ( not ( = ?auto_270453 ?auto_270455 ) ) ( not ( = ?auto_270453 ?auto_270456 ) ) ( not ( = ?auto_270454 ?auto_270455 ) ) ( not ( = ?auto_270454 ?auto_270456 ) ) ( not ( = ?auto_270455 ?auto_270456 ) ) ( ON ?auto_270454 ?auto_270455 ) ( ON ?auto_270453 ?auto_270454 ) ( ON ?auto_270452 ?auto_270453 ) ( ON ?auto_270451 ?auto_270452 ) ( ON ?auto_270450 ?auto_270451 ) ( CLEAR ?auto_270448 ) ( ON ?auto_270449 ?auto_270450 ) ( CLEAR ?auto_270449 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_270444 ?auto_270445 ?auto_270446 ?auto_270447 ?auto_270448 ?auto_270449 )
      ( MAKE-12PILE ?auto_270444 ?auto_270445 ?auto_270446 ?auto_270447 ?auto_270448 ?auto_270449 ?auto_270450 ?auto_270451 ?auto_270452 ?auto_270453 ?auto_270454 ?auto_270455 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_270469 - BLOCK
      ?auto_270470 - BLOCK
      ?auto_270471 - BLOCK
      ?auto_270472 - BLOCK
      ?auto_270473 - BLOCK
      ?auto_270474 - BLOCK
      ?auto_270475 - BLOCK
      ?auto_270476 - BLOCK
      ?auto_270477 - BLOCK
      ?auto_270478 - BLOCK
      ?auto_270479 - BLOCK
      ?auto_270480 - BLOCK
    )
    :vars
    (
      ?auto_270481 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_270480 ?auto_270481 ) ( ON-TABLE ?auto_270469 ) ( ON ?auto_270470 ?auto_270469 ) ( ON ?auto_270471 ?auto_270470 ) ( ON ?auto_270472 ?auto_270471 ) ( ON ?auto_270473 ?auto_270472 ) ( not ( = ?auto_270469 ?auto_270470 ) ) ( not ( = ?auto_270469 ?auto_270471 ) ) ( not ( = ?auto_270469 ?auto_270472 ) ) ( not ( = ?auto_270469 ?auto_270473 ) ) ( not ( = ?auto_270469 ?auto_270474 ) ) ( not ( = ?auto_270469 ?auto_270475 ) ) ( not ( = ?auto_270469 ?auto_270476 ) ) ( not ( = ?auto_270469 ?auto_270477 ) ) ( not ( = ?auto_270469 ?auto_270478 ) ) ( not ( = ?auto_270469 ?auto_270479 ) ) ( not ( = ?auto_270469 ?auto_270480 ) ) ( not ( = ?auto_270469 ?auto_270481 ) ) ( not ( = ?auto_270470 ?auto_270471 ) ) ( not ( = ?auto_270470 ?auto_270472 ) ) ( not ( = ?auto_270470 ?auto_270473 ) ) ( not ( = ?auto_270470 ?auto_270474 ) ) ( not ( = ?auto_270470 ?auto_270475 ) ) ( not ( = ?auto_270470 ?auto_270476 ) ) ( not ( = ?auto_270470 ?auto_270477 ) ) ( not ( = ?auto_270470 ?auto_270478 ) ) ( not ( = ?auto_270470 ?auto_270479 ) ) ( not ( = ?auto_270470 ?auto_270480 ) ) ( not ( = ?auto_270470 ?auto_270481 ) ) ( not ( = ?auto_270471 ?auto_270472 ) ) ( not ( = ?auto_270471 ?auto_270473 ) ) ( not ( = ?auto_270471 ?auto_270474 ) ) ( not ( = ?auto_270471 ?auto_270475 ) ) ( not ( = ?auto_270471 ?auto_270476 ) ) ( not ( = ?auto_270471 ?auto_270477 ) ) ( not ( = ?auto_270471 ?auto_270478 ) ) ( not ( = ?auto_270471 ?auto_270479 ) ) ( not ( = ?auto_270471 ?auto_270480 ) ) ( not ( = ?auto_270471 ?auto_270481 ) ) ( not ( = ?auto_270472 ?auto_270473 ) ) ( not ( = ?auto_270472 ?auto_270474 ) ) ( not ( = ?auto_270472 ?auto_270475 ) ) ( not ( = ?auto_270472 ?auto_270476 ) ) ( not ( = ?auto_270472 ?auto_270477 ) ) ( not ( = ?auto_270472 ?auto_270478 ) ) ( not ( = ?auto_270472 ?auto_270479 ) ) ( not ( = ?auto_270472 ?auto_270480 ) ) ( not ( = ?auto_270472 ?auto_270481 ) ) ( not ( = ?auto_270473 ?auto_270474 ) ) ( not ( = ?auto_270473 ?auto_270475 ) ) ( not ( = ?auto_270473 ?auto_270476 ) ) ( not ( = ?auto_270473 ?auto_270477 ) ) ( not ( = ?auto_270473 ?auto_270478 ) ) ( not ( = ?auto_270473 ?auto_270479 ) ) ( not ( = ?auto_270473 ?auto_270480 ) ) ( not ( = ?auto_270473 ?auto_270481 ) ) ( not ( = ?auto_270474 ?auto_270475 ) ) ( not ( = ?auto_270474 ?auto_270476 ) ) ( not ( = ?auto_270474 ?auto_270477 ) ) ( not ( = ?auto_270474 ?auto_270478 ) ) ( not ( = ?auto_270474 ?auto_270479 ) ) ( not ( = ?auto_270474 ?auto_270480 ) ) ( not ( = ?auto_270474 ?auto_270481 ) ) ( not ( = ?auto_270475 ?auto_270476 ) ) ( not ( = ?auto_270475 ?auto_270477 ) ) ( not ( = ?auto_270475 ?auto_270478 ) ) ( not ( = ?auto_270475 ?auto_270479 ) ) ( not ( = ?auto_270475 ?auto_270480 ) ) ( not ( = ?auto_270475 ?auto_270481 ) ) ( not ( = ?auto_270476 ?auto_270477 ) ) ( not ( = ?auto_270476 ?auto_270478 ) ) ( not ( = ?auto_270476 ?auto_270479 ) ) ( not ( = ?auto_270476 ?auto_270480 ) ) ( not ( = ?auto_270476 ?auto_270481 ) ) ( not ( = ?auto_270477 ?auto_270478 ) ) ( not ( = ?auto_270477 ?auto_270479 ) ) ( not ( = ?auto_270477 ?auto_270480 ) ) ( not ( = ?auto_270477 ?auto_270481 ) ) ( not ( = ?auto_270478 ?auto_270479 ) ) ( not ( = ?auto_270478 ?auto_270480 ) ) ( not ( = ?auto_270478 ?auto_270481 ) ) ( not ( = ?auto_270479 ?auto_270480 ) ) ( not ( = ?auto_270479 ?auto_270481 ) ) ( not ( = ?auto_270480 ?auto_270481 ) ) ( ON ?auto_270479 ?auto_270480 ) ( ON ?auto_270478 ?auto_270479 ) ( ON ?auto_270477 ?auto_270478 ) ( ON ?auto_270476 ?auto_270477 ) ( ON ?auto_270475 ?auto_270476 ) ( CLEAR ?auto_270473 ) ( ON ?auto_270474 ?auto_270475 ) ( CLEAR ?auto_270474 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_270469 ?auto_270470 ?auto_270471 ?auto_270472 ?auto_270473 ?auto_270474 )
      ( MAKE-12PILE ?auto_270469 ?auto_270470 ?auto_270471 ?auto_270472 ?auto_270473 ?auto_270474 ?auto_270475 ?auto_270476 ?auto_270477 ?auto_270478 ?auto_270479 ?auto_270480 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_270494 - BLOCK
      ?auto_270495 - BLOCK
      ?auto_270496 - BLOCK
      ?auto_270497 - BLOCK
      ?auto_270498 - BLOCK
      ?auto_270499 - BLOCK
      ?auto_270500 - BLOCK
      ?auto_270501 - BLOCK
      ?auto_270502 - BLOCK
      ?auto_270503 - BLOCK
      ?auto_270504 - BLOCK
      ?auto_270505 - BLOCK
    )
    :vars
    (
      ?auto_270506 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_270505 ?auto_270506 ) ( ON-TABLE ?auto_270494 ) ( ON ?auto_270495 ?auto_270494 ) ( ON ?auto_270496 ?auto_270495 ) ( ON ?auto_270497 ?auto_270496 ) ( not ( = ?auto_270494 ?auto_270495 ) ) ( not ( = ?auto_270494 ?auto_270496 ) ) ( not ( = ?auto_270494 ?auto_270497 ) ) ( not ( = ?auto_270494 ?auto_270498 ) ) ( not ( = ?auto_270494 ?auto_270499 ) ) ( not ( = ?auto_270494 ?auto_270500 ) ) ( not ( = ?auto_270494 ?auto_270501 ) ) ( not ( = ?auto_270494 ?auto_270502 ) ) ( not ( = ?auto_270494 ?auto_270503 ) ) ( not ( = ?auto_270494 ?auto_270504 ) ) ( not ( = ?auto_270494 ?auto_270505 ) ) ( not ( = ?auto_270494 ?auto_270506 ) ) ( not ( = ?auto_270495 ?auto_270496 ) ) ( not ( = ?auto_270495 ?auto_270497 ) ) ( not ( = ?auto_270495 ?auto_270498 ) ) ( not ( = ?auto_270495 ?auto_270499 ) ) ( not ( = ?auto_270495 ?auto_270500 ) ) ( not ( = ?auto_270495 ?auto_270501 ) ) ( not ( = ?auto_270495 ?auto_270502 ) ) ( not ( = ?auto_270495 ?auto_270503 ) ) ( not ( = ?auto_270495 ?auto_270504 ) ) ( not ( = ?auto_270495 ?auto_270505 ) ) ( not ( = ?auto_270495 ?auto_270506 ) ) ( not ( = ?auto_270496 ?auto_270497 ) ) ( not ( = ?auto_270496 ?auto_270498 ) ) ( not ( = ?auto_270496 ?auto_270499 ) ) ( not ( = ?auto_270496 ?auto_270500 ) ) ( not ( = ?auto_270496 ?auto_270501 ) ) ( not ( = ?auto_270496 ?auto_270502 ) ) ( not ( = ?auto_270496 ?auto_270503 ) ) ( not ( = ?auto_270496 ?auto_270504 ) ) ( not ( = ?auto_270496 ?auto_270505 ) ) ( not ( = ?auto_270496 ?auto_270506 ) ) ( not ( = ?auto_270497 ?auto_270498 ) ) ( not ( = ?auto_270497 ?auto_270499 ) ) ( not ( = ?auto_270497 ?auto_270500 ) ) ( not ( = ?auto_270497 ?auto_270501 ) ) ( not ( = ?auto_270497 ?auto_270502 ) ) ( not ( = ?auto_270497 ?auto_270503 ) ) ( not ( = ?auto_270497 ?auto_270504 ) ) ( not ( = ?auto_270497 ?auto_270505 ) ) ( not ( = ?auto_270497 ?auto_270506 ) ) ( not ( = ?auto_270498 ?auto_270499 ) ) ( not ( = ?auto_270498 ?auto_270500 ) ) ( not ( = ?auto_270498 ?auto_270501 ) ) ( not ( = ?auto_270498 ?auto_270502 ) ) ( not ( = ?auto_270498 ?auto_270503 ) ) ( not ( = ?auto_270498 ?auto_270504 ) ) ( not ( = ?auto_270498 ?auto_270505 ) ) ( not ( = ?auto_270498 ?auto_270506 ) ) ( not ( = ?auto_270499 ?auto_270500 ) ) ( not ( = ?auto_270499 ?auto_270501 ) ) ( not ( = ?auto_270499 ?auto_270502 ) ) ( not ( = ?auto_270499 ?auto_270503 ) ) ( not ( = ?auto_270499 ?auto_270504 ) ) ( not ( = ?auto_270499 ?auto_270505 ) ) ( not ( = ?auto_270499 ?auto_270506 ) ) ( not ( = ?auto_270500 ?auto_270501 ) ) ( not ( = ?auto_270500 ?auto_270502 ) ) ( not ( = ?auto_270500 ?auto_270503 ) ) ( not ( = ?auto_270500 ?auto_270504 ) ) ( not ( = ?auto_270500 ?auto_270505 ) ) ( not ( = ?auto_270500 ?auto_270506 ) ) ( not ( = ?auto_270501 ?auto_270502 ) ) ( not ( = ?auto_270501 ?auto_270503 ) ) ( not ( = ?auto_270501 ?auto_270504 ) ) ( not ( = ?auto_270501 ?auto_270505 ) ) ( not ( = ?auto_270501 ?auto_270506 ) ) ( not ( = ?auto_270502 ?auto_270503 ) ) ( not ( = ?auto_270502 ?auto_270504 ) ) ( not ( = ?auto_270502 ?auto_270505 ) ) ( not ( = ?auto_270502 ?auto_270506 ) ) ( not ( = ?auto_270503 ?auto_270504 ) ) ( not ( = ?auto_270503 ?auto_270505 ) ) ( not ( = ?auto_270503 ?auto_270506 ) ) ( not ( = ?auto_270504 ?auto_270505 ) ) ( not ( = ?auto_270504 ?auto_270506 ) ) ( not ( = ?auto_270505 ?auto_270506 ) ) ( ON ?auto_270504 ?auto_270505 ) ( ON ?auto_270503 ?auto_270504 ) ( ON ?auto_270502 ?auto_270503 ) ( ON ?auto_270501 ?auto_270502 ) ( ON ?auto_270500 ?auto_270501 ) ( ON ?auto_270499 ?auto_270500 ) ( CLEAR ?auto_270497 ) ( ON ?auto_270498 ?auto_270499 ) ( CLEAR ?auto_270498 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_270494 ?auto_270495 ?auto_270496 ?auto_270497 ?auto_270498 )
      ( MAKE-12PILE ?auto_270494 ?auto_270495 ?auto_270496 ?auto_270497 ?auto_270498 ?auto_270499 ?auto_270500 ?auto_270501 ?auto_270502 ?auto_270503 ?auto_270504 ?auto_270505 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_270519 - BLOCK
      ?auto_270520 - BLOCK
      ?auto_270521 - BLOCK
      ?auto_270522 - BLOCK
      ?auto_270523 - BLOCK
      ?auto_270524 - BLOCK
      ?auto_270525 - BLOCK
      ?auto_270526 - BLOCK
      ?auto_270527 - BLOCK
      ?auto_270528 - BLOCK
      ?auto_270529 - BLOCK
      ?auto_270530 - BLOCK
    )
    :vars
    (
      ?auto_270531 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_270530 ?auto_270531 ) ( ON-TABLE ?auto_270519 ) ( ON ?auto_270520 ?auto_270519 ) ( ON ?auto_270521 ?auto_270520 ) ( ON ?auto_270522 ?auto_270521 ) ( not ( = ?auto_270519 ?auto_270520 ) ) ( not ( = ?auto_270519 ?auto_270521 ) ) ( not ( = ?auto_270519 ?auto_270522 ) ) ( not ( = ?auto_270519 ?auto_270523 ) ) ( not ( = ?auto_270519 ?auto_270524 ) ) ( not ( = ?auto_270519 ?auto_270525 ) ) ( not ( = ?auto_270519 ?auto_270526 ) ) ( not ( = ?auto_270519 ?auto_270527 ) ) ( not ( = ?auto_270519 ?auto_270528 ) ) ( not ( = ?auto_270519 ?auto_270529 ) ) ( not ( = ?auto_270519 ?auto_270530 ) ) ( not ( = ?auto_270519 ?auto_270531 ) ) ( not ( = ?auto_270520 ?auto_270521 ) ) ( not ( = ?auto_270520 ?auto_270522 ) ) ( not ( = ?auto_270520 ?auto_270523 ) ) ( not ( = ?auto_270520 ?auto_270524 ) ) ( not ( = ?auto_270520 ?auto_270525 ) ) ( not ( = ?auto_270520 ?auto_270526 ) ) ( not ( = ?auto_270520 ?auto_270527 ) ) ( not ( = ?auto_270520 ?auto_270528 ) ) ( not ( = ?auto_270520 ?auto_270529 ) ) ( not ( = ?auto_270520 ?auto_270530 ) ) ( not ( = ?auto_270520 ?auto_270531 ) ) ( not ( = ?auto_270521 ?auto_270522 ) ) ( not ( = ?auto_270521 ?auto_270523 ) ) ( not ( = ?auto_270521 ?auto_270524 ) ) ( not ( = ?auto_270521 ?auto_270525 ) ) ( not ( = ?auto_270521 ?auto_270526 ) ) ( not ( = ?auto_270521 ?auto_270527 ) ) ( not ( = ?auto_270521 ?auto_270528 ) ) ( not ( = ?auto_270521 ?auto_270529 ) ) ( not ( = ?auto_270521 ?auto_270530 ) ) ( not ( = ?auto_270521 ?auto_270531 ) ) ( not ( = ?auto_270522 ?auto_270523 ) ) ( not ( = ?auto_270522 ?auto_270524 ) ) ( not ( = ?auto_270522 ?auto_270525 ) ) ( not ( = ?auto_270522 ?auto_270526 ) ) ( not ( = ?auto_270522 ?auto_270527 ) ) ( not ( = ?auto_270522 ?auto_270528 ) ) ( not ( = ?auto_270522 ?auto_270529 ) ) ( not ( = ?auto_270522 ?auto_270530 ) ) ( not ( = ?auto_270522 ?auto_270531 ) ) ( not ( = ?auto_270523 ?auto_270524 ) ) ( not ( = ?auto_270523 ?auto_270525 ) ) ( not ( = ?auto_270523 ?auto_270526 ) ) ( not ( = ?auto_270523 ?auto_270527 ) ) ( not ( = ?auto_270523 ?auto_270528 ) ) ( not ( = ?auto_270523 ?auto_270529 ) ) ( not ( = ?auto_270523 ?auto_270530 ) ) ( not ( = ?auto_270523 ?auto_270531 ) ) ( not ( = ?auto_270524 ?auto_270525 ) ) ( not ( = ?auto_270524 ?auto_270526 ) ) ( not ( = ?auto_270524 ?auto_270527 ) ) ( not ( = ?auto_270524 ?auto_270528 ) ) ( not ( = ?auto_270524 ?auto_270529 ) ) ( not ( = ?auto_270524 ?auto_270530 ) ) ( not ( = ?auto_270524 ?auto_270531 ) ) ( not ( = ?auto_270525 ?auto_270526 ) ) ( not ( = ?auto_270525 ?auto_270527 ) ) ( not ( = ?auto_270525 ?auto_270528 ) ) ( not ( = ?auto_270525 ?auto_270529 ) ) ( not ( = ?auto_270525 ?auto_270530 ) ) ( not ( = ?auto_270525 ?auto_270531 ) ) ( not ( = ?auto_270526 ?auto_270527 ) ) ( not ( = ?auto_270526 ?auto_270528 ) ) ( not ( = ?auto_270526 ?auto_270529 ) ) ( not ( = ?auto_270526 ?auto_270530 ) ) ( not ( = ?auto_270526 ?auto_270531 ) ) ( not ( = ?auto_270527 ?auto_270528 ) ) ( not ( = ?auto_270527 ?auto_270529 ) ) ( not ( = ?auto_270527 ?auto_270530 ) ) ( not ( = ?auto_270527 ?auto_270531 ) ) ( not ( = ?auto_270528 ?auto_270529 ) ) ( not ( = ?auto_270528 ?auto_270530 ) ) ( not ( = ?auto_270528 ?auto_270531 ) ) ( not ( = ?auto_270529 ?auto_270530 ) ) ( not ( = ?auto_270529 ?auto_270531 ) ) ( not ( = ?auto_270530 ?auto_270531 ) ) ( ON ?auto_270529 ?auto_270530 ) ( ON ?auto_270528 ?auto_270529 ) ( ON ?auto_270527 ?auto_270528 ) ( ON ?auto_270526 ?auto_270527 ) ( ON ?auto_270525 ?auto_270526 ) ( ON ?auto_270524 ?auto_270525 ) ( CLEAR ?auto_270522 ) ( ON ?auto_270523 ?auto_270524 ) ( CLEAR ?auto_270523 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_270519 ?auto_270520 ?auto_270521 ?auto_270522 ?auto_270523 )
      ( MAKE-12PILE ?auto_270519 ?auto_270520 ?auto_270521 ?auto_270522 ?auto_270523 ?auto_270524 ?auto_270525 ?auto_270526 ?auto_270527 ?auto_270528 ?auto_270529 ?auto_270530 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_270544 - BLOCK
      ?auto_270545 - BLOCK
      ?auto_270546 - BLOCK
      ?auto_270547 - BLOCK
      ?auto_270548 - BLOCK
      ?auto_270549 - BLOCK
      ?auto_270550 - BLOCK
      ?auto_270551 - BLOCK
      ?auto_270552 - BLOCK
      ?auto_270553 - BLOCK
      ?auto_270554 - BLOCK
      ?auto_270555 - BLOCK
    )
    :vars
    (
      ?auto_270556 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_270555 ?auto_270556 ) ( ON-TABLE ?auto_270544 ) ( ON ?auto_270545 ?auto_270544 ) ( ON ?auto_270546 ?auto_270545 ) ( not ( = ?auto_270544 ?auto_270545 ) ) ( not ( = ?auto_270544 ?auto_270546 ) ) ( not ( = ?auto_270544 ?auto_270547 ) ) ( not ( = ?auto_270544 ?auto_270548 ) ) ( not ( = ?auto_270544 ?auto_270549 ) ) ( not ( = ?auto_270544 ?auto_270550 ) ) ( not ( = ?auto_270544 ?auto_270551 ) ) ( not ( = ?auto_270544 ?auto_270552 ) ) ( not ( = ?auto_270544 ?auto_270553 ) ) ( not ( = ?auto_270544 ?auto_270554 ) ) ( not ( = ?auto_270544 ?auto_270555 ) ) ( not ( = ?auto_270544 ?auto_270556 ) ) ( not ( = ?auto_270545 ?auto_270546 ) ) ( not ( = ?auto_270545 ?auto_270547 ) ) ( not ( = ?auto_270545 ?auto_270548 ) ) ( not ( = ?auto_270545 ?auto_270549 ) ) ( not ( = ?auto_270545 ?auto_270550 ) ) ( not ( = ?auto_270545 ?auto_270551 ) ) ( not ( = ?auto_270545 ?auto_270552 ) ) ( not ( = ?auto_270545 ?auto_270553 ) ) ( not ( = ?auto_270545 ?auto_270554 ) ) ( not ( = ?auto_270545 ?auto_270555 ) ) ( not ( = ?auto_270545 ?auto_270556 ) ) ( not ( = ?auto_270546 ?auto_270547 ) ) ( not ( = ?auto_270546 ?auto_270548 ) ) ( not ( = ?auto_270546 ?auto_270549 ) ) ( not ( = ?auto_270546 ?auto_270550 ) ) ( not ( = ?auto_270546 ?auto_270551 ) ) ( not ( = ?auto_270546 ?auto_270552 ) ) ( not ( = ?auto_270546 ?auto_270553 ) ) ( not ( = ?auto_270546 ?auto_270554 ) ) ( not ( = ?auto_270546 ?auto_270555 ) ) ( not ( = ?auto_270546 ?auto_270556 ) ) ( not ( = ?auto_270547 ?auto_270548 ) ) ( not ( = ?auto_270547 ?auto_270549 ) ) ( not ( = ?auto_270547 ?auto_270550 ) ) ( not ( = ?auto_270547 ?auto_270551 ) ) ( not ( = ?auto_270547 ?auto_270552 ) ) ( not ( = ?auto_270547 ?auto_270553 ) ) ( not ( = ?auto_270547 ?auto_270554 ) ) ( not ( = ?auto_270547 ?auto_270555 ) ) ( not ( = ?auto_270547 ?auto_270556 ) ) ( not ( = ?auto_270548 ?auto_270549 ) ) ( not ( = ?auto_270548 ?auto_270550 ) ) ( not ( = ?auto_270548 ?auto_270551 ) ) ( not ( = ?auto_270548 ?auto_270552 ) ) ( not ( = ?auto_270548 ?auto_270553 ) ) ( not ( = ?auto_270548 ?auto_270554 ) ) ( not ( = ?auto_270548 ?auto_270555 ) ) ( not ( = ?auto_270548 ?auto_270556 ) ) ( not ( = ?auto_270549 ?auto_270550 ) ) ( not ( = ?auto_270549 ?auto_270551 ) ) ( not ( = ?auto_270549 ?auto_270552 ) ) ( not ( = ?auto_270549 ?auto_270553 ) ) ( not ( = ?auto_270549 ?auto_270554 ) ) ( not ( = ?auto_270549 ?auto_270555 ) ) ( not ( = ?auto_270549 ?auto_270556 ) ) ( not ( = ?auto_270550 ?auto_270551 ) ) ( not ( = ?auto_270550 ?auto_270552 ) ) ( not ( = ?auto_270550 ?auto_270553 ) ) ( not ( = ?auto_270550 ?auto_270554 ) ) ( not ( = ?auto_270550 ?auto_270555 ) ) ( not ( = ?auto_270550 ?auto_270556 ) ) ( not ( = ?auto_270551 ?auto_270552 ) ) ( not ( = ?auto_270551 ?auto_270553 ) ) ( not ( = ?auto_270551 ?auto_270554 ) ) ( not ( = ?auto_270551 ?auto_270555 ) ) ( not ( = ?auto_270551 ?auto_270556 ) ) ( not ( = ?auto_270552 ?auto_270553 ) ) ( not ( = ?auto_270552 ?auto_270554 ) ) ( not ( = ?auto_270552 ?auto_270555 ) ) ( not ( = ?auto_270552 ?auto_270556 ) ) ( not ( = ?auto_270553 ?auto_270554 ) ) ( not ( = ?auto_270553 ?auto_270555 ) ) ( not ( = ?auto_270553 ?auto_270556 ) ) ( not ( = ?auto_270554 ?auto_270555 ) ) ( not ( = ?auto_270554 ?auto_270556 ) ) ( not ( = ?auto_270555 ?auto_270556 ) ) ( ON ?auto_270554 ?auto_270555 ) ( ON ?auto_270553 ?auto_270554 ) ( ON ?auto_270552 ?auto_270553 ) ( ON ?auto_270551 ?auto_270552 ) ( ON ?auto_270550 ?auto_270551 ) ( ON ?auto_270549 ?auto_270550 ) ( ON ?auto_270548 ?auto_270549 ) ( CLEAR ?auto_270546 ) ( ON ?auto_270547 ?auto_270548 ) ( CLEAR ?auto_270547 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_270544 ?auto_270545 ?auto_270546 ?auto_270547 )
      ( MAKE-12PILE ?auto_270544 ?auto_270545 ?auto_270546 ?auto_270547 ?auto_270548 ?auto_270549 ?auto_270550 ?auto_270551 ?auto_270552 ?auto_270553 ?auto_270554 ?auto_270555 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_270569 - BLOCK
      ?auto_270570 - BLOCK
      ?auto_270571 - BLOCK
      ?auto_270572 - BLOCK
      ?auto_270573 - BLOCK
      ?auto_270574 - BLOCK
      ?auto_270575 - BLOCK
      ?auto_270576 - BLOCK
      ?auto_270577 - BLOCK
      ?auto_270578 - BLOCK
      ?auto_270579 - BLOCK
      ?auto_270580 - BLOCK
    )
    :vars
    (
      ?auto_270581 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_270580 ?auto_270581 ) ( ON-TABLE ?auto_270569 ) ( ON ?auto_270570 ?auto_270569 ) ( ON ?auto_270571 ?auto_270570 ) ( not ( = ?auto_270569 ?auto_270570 ) ) ( not ( = ?auto_270569 ?auto_270571 ) ) ( not ( = ?auto_270569 ?auto_270572 ) ) ( not ( = ?auto_270569 ?auto_270573 ) ) ( not ( = ?auto_270569 ?auto_270574 ) ) ( not ( = ?auto_270569 ?auto_270575 ) ) ( not ( = ?auto_270569 ?auto_270576 ) ) ( not ( = ?auto_270569 ?auto_270577 ) ) ( not ( = ?auto_270569 ?auto_270578 ) ) ( not ( = ?auto_270569 ?auto_270579 ) ) ( not ( = ?auto_270569 ?auto_270580 ) ) ( not ( = ?auto_270569 ?auto_270581 ) ) ( not ( = ?auto_270570 ?auto_270571 ) ) ( not ( = ?auto_270570 ?auto_270572 ) ) ( not ( = ?auto_270570 ?auto_270573 ) ) ( not ( = ?auto_270570 ?auto_270574 ) ) ( not ( = ?auto_270570 ?auto_270575 ) ) ( not ( = ?auto_270570 ?auto_270576 ) ) ( not ( = ?auto_270570 ?auto_270577 ) ) ( not ( = ?auto_270570 ?auto_270578 ) ) ( not ( = ?auto_270570 ?auto_270579 ) ) ( not ( = ?auto_270570 ?auto_270580 ) ) ( not ( = ?auto_270570 ?auto_270581 ) ) ( not ( = ?auto_270571 ?auto_270572 ) ) ( not ( = ?auto_270571 ?auto_270573 ) ) ( not ( = ?auto_270571 ?auto_270574 ) ) ( not ( = ?auto_270571 ?auto_270575 ) ) ( not ( = ?auto_270571 ?auto_270576 ) ) ( not ( = ?auto_270571 ?auto_270577 ) ) ( not ( = ?auto_270571 ?auto_270578 ) ) ( not ( = ?auto_270571 ?auto_270579 ) ) ( not ( = ?auto_270571 ?auto_270580 ) ) ( not ( = ?auto_270571 ?auto_270581 ) ) ( not ( = ?auto_270572 ?auto_270573 ) ) ( not ( = ?auto_270572 ?auto_270574 ) ) ( not ( = ?auto_270572 ?auto_270575 ) ) ( not ( = ?auto_270572 ?auto_270576 ) ) ( not ( = ?auto_270572 ?auto_270577 ) ) ( not ( = ?auto_270572 ?auto_270578 ) ) ( not ( = ?auto_270572 ?auto_270579 ) ) ( not ( = ?auto_270572 ?auto_270580 ) ) ( not ( = ?auto_270572 ?auto_270581 ) ) ( not ( = ?auto_270573 ?auto_270574 ) ) ( not ( = ?auto_270573 ?auto_270575 ) ) ( not ( = ?auto_270573 ?auto_270576 ) ) ( not ( = ?auto_270573 ?auto_270577 ) ) ( not ( = ?auto_270573 ?auto_270578 ) ) ( not ( = ?auto_270573 ?auto_270579 ) ) ( not ( = ?auto_270573 ?auto_270580 ) ) ( not ( = ?auto_270573 ?auto_270581 ) ) ( not ( = ?auto_270574 ?auto_270575 ) ) ( not ( = ?auto_270574 ?auto_270576 ) ) ( not ( = ?auto_270574 ?auto_270577 ) ) ( not ( = ?auto_270574 ?auto_270578 ) ) ( not ( = ?auto_270574 ?auto_270579 ) ) ( not ( = ?auto_270574 ?auto_270580 ) ) ( not ( = ?auto_270574 ?auto_270581 ) ) ( not ( = ?auto_270575 ?auto_270576 ) ) ( not ( = ?auto_270575 ?auto_270577 ) ) ( not ( = ?auto_270575 ?auto_270578 ) ) ( not ( = ?auto_270575 ?auto_270579 ) ) ( not ( = ?auto_270575 ?auto_270580 ) ) ( not ( = ?auto_270575 ?auto_270581 ) ) ( not ( = ?auto_270576 ?auto_270577 ) ) ( not ( = ?auto_270576 ?auto_270578 ) ) ( not ( = ?auto_270576 ?auto_270579 ) ) ( not ( = ?auto_270576 ?auto_270580 ) ) ( not ( = ?auto_270576 ?auto_270581 ) ) ( not ( = ?auto_270577 ?auto_270578 ) ) ( not ( = ?auto_270577 ?auto_270579 ) ) ( not ( = ?auto_270577 ?auto_270580 ) ) ( not ( = ?auto_270577 ?auto_270581 ) ) ( not ( = ?auto_270578 ?auto_270579 ) ) ( not ( = ?auto_270578 ?auto_270580 ) ) ( not ( = ?auto_270578 ?auto_270581 ) ) ( not ( = ?auto_270579 ?auto_270580 ) ) ( not ( = ?auto_270579 ?auto_270581 ) ) ( not ( = ?auto_270580 ?auto_270581 ) ) ( ON ?auto_270579 ?auto_270580 ) ( ON ?auto_270578 ?auto_270579 ) ( ON ?auto_270577 ?auto_270578 ) ( ON ?auto_270576 ?auto_270577 ) ( ON ?auto_270575 ?auto_270576 ) ( ON ?auto_270574 ?auto_270575 ) ( ON ?auto_270573 ?auto_270574 ) ( CLEAR ?auto_270571 ) ( ON ?auto_270572 ?auto_270573 ) ( CLEAR ?auto_270572 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_270569 ?auto_270570 ?auto_270571 ?auto_270572 )
      ( MAKE-12PILE ?auto_270569 ?auto_270570 ?auto_270571 ?auto_270572 ?auto_270573 ?auto_270574 ?auto_270575 ?auto_270576 ?auto_270577 ?auto_270578 ?auto_270579 ?auto_270580 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_270594 - BLOCK
      ?auto_270595 - BLOCK
      ?auto_270596 - BLOCK
      ?auto_270597 - BLOCK
      ?auto_270598 - BLOCK
      ?auto_270599 - BLOCK
      ?auto_270600 - BLOCK
      ?auto_270601 - BLOCK
      ?auto_270602 - BLOCK
      ?auto_270603 - BLOCK
      ?auto_270604 - BLOCK
      ?auto_270605 - BLOCK
    )
    :vars
    (
      ?auto_270606 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_270605 ?auto_270606 ) ( ON-TABLE ?auto_270594 ) ( ON ?auto_270595 ?auto_270594 ) ( not ( = ?auto_270594 ?auto_270595 ) ) ( not ( = ?auto_270594 ?auto_270596 ) ) ( not ( = ?auto_270594 ?auto_270597 ) ) ( not ( = ?auto_270594 ?auto_270598 ) ) ( not ( = ?auto_270594 ?auto_270599 ) ) ( not ( = ?auto_270594 ?auto_270600 ) ) ( not ( = ?auto_270594 ?auto_270601 ) ) ( not ( = ?auto_270594 ?auto_270602 ) ) ( not ( = ?auto_270594 ?auto_270603 ) ) ( not ( = ?auto_270594 ?auto_270604 ) ) ( not ( = ?auto_270594 ?auto_270605 ) ) ( not ( = ?auto_270594 ?auto_270606 ) ) ( not ( = ?auto_270595 ?auto_270596 ) ) ( not ( = ?auto_270595 ?auto_270597 ) ) ( not ( = ?auto_270595 ?auto_270598 ) ) ( not ( = ?auto_270595 ?auto_270599 ) ) ( not ( = ?auto_270595 ?auto_270600 ) ) ( not ( = ?auto_270595 ?auto_270601 ) ) ( not ( = ?auto_270595 ?auto_270602 ) ) ( not ( = ?auto_270595 ?auto_270603 ) ) ( not ( = ?auto_270595 ?auto_270604 ) ) ( not ( = ?auto_270595 ?auto_270605 ) ) ( not ( = ?auto_270595 ?auto_270606 ) ) ( not ( = ?auto_270596 ?auto_270597 ) ) ( not ( = ?auto_270596 ?auto_270598 ) ) ( not ( = ?auto_270596 ?auto_270599 ) ) ( not ( = ?auto_270596 ?auto_270600 ) ) ( not ( = ?auto_270596 ?auto_270601 ) ) ( not ( = ?auto_270596 ?auto_270602 ) ) ( not ( = ?auto_270596 ?auto_270603 ) ) ( not ( = ?auto_270596 ?auto_270604 ) ) ( not ( = ?auto_270596 ?auto_270605 ) ) ( not ( = ?auto_270596 ?auto_270606 ) ) ( not ( = ?auto_270597 ?auto_270598 ) ) ( not ( = ?auto_270597 ?auto_270599 ) ) ( not ( = ?auto_270597 ?auto_270600 ) ) ( not ( = ?auto_270597 ?auto_270601 ) ) ( not ( = ?auto_270597 ?auto_270602 ) ) ( not ( = ?auto_270597 ?auto_270603 ) ) ( not ( = ?auto_270597 ?auto_270604 ) ) ( not ( = ?auto_270597 ?auto_270605 ) ) ( not ( = ?auto_270597 ?auto_270606 ) ) ( not ( = ?auto_270598 ?auto_270599 ) ) ( not ( = ?auto_270598 ?auto_270600 ) ) ( not ( = ?auto_270598 ?auto_270601 ) ) ( not ( = ?auto_270598 ?auto_270602 ) ) ( not ( = ?auto_270598 ?auto_270603 ) ) ( not ( = ?auto_270598 ?auto_270604 ) ) ( not ( = ?auto_270598 ?auto_270605 ) ) ( not ( = ?auto_270598 ?auto_270606 ) ) ( not ( = ?auto_270599 ?auto_270600 ) ) ( not ( = ?auto_270599 ?auto_270601 ) ) ( not ( = ?auto_270599 ?auto_270602 ) ) ( not ( = ?auto_270599 ?auto_270603 ) ) ( not ( = ?auto_270599 ?auto_270604 ) ) ( not ( = ?auto_270599 ?auto_270605 ) ) ( not ( = ?auto_270599 ?auto_270606 ) ) ( not ( = ?auto_270600 ?auto_270601 ) ) ( not ( = ?auto_270600 ?auto_270602 ) ) ( not ( = ?auto_270600 ?auto_270603 ) ) ( not ( = ?auto_270600 ?auto_270604 ) ) ( not ( = ?auto_270600 ?auto_270605 ) ) ( not ( = ?auto_270600 ?auto_270606 ) ) ( not ( = ?auto_270601 ?auto_270602 ) ) ( not ( = ?auto_270601 ?auto_270603 ) ) ( not ( = ?auto_270601 ?auto_270604 ) ) ( not ( = ?auto_270601 ?auto_270605 ) ) ( not ( = ?auto_270601 ?auto_270606 ) ) ( not ( = ?auto_270602 ?auto_270603 ) ) ( not ( = ?auto_270602 ?auto_270604 ) ) ( not ( = ?auto_270602 ?auto_270605 ) ) ( not ( = ?auto_270602 ?auto_270606 ) ) ( not ( = ?auto_270603 ?auto_270604 ) ) ( not ( = ?auto_270603 ?auto_270605 ) ) ( not ( = ?auto_270603 ?auto_270606 ) ) ( not ( = ?auto_270604 ?auto_270605 ) ) ( not ( = ?auto_270604 ?auto_270606 ) ) ( not ( = ?auto_270605 ?auto_270606 ) ) ( ON ?auto_270604 ?auto_270605 ) ( ON ?auto_270603 ?auto_270604 ) ( ON ?auto_270602 ?auto_270603 ) ( ON ?auto_270601 ?auto_270602 ) ( ON ?auto_270600 ?auto_270601 ) ( ON ?auto_270599 ?auto_270600 ) ( ON ?auto_270598 ?auto_270599 ) ( ON ?auto_270597 ?auto_270598 ) ( CLEAR ?auto_270595 ) ( ON ?auto_270596 ?auto_270597 ) ( CLEAR ?auto_270596 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_270594 ?auto_270595 ?auto_270596 )
      ( MAKE-12PILE ?auto_270594 ?auto_270595 ?auto_270596 ?auto_270597 ?auto_270598 ?auto_270599 ?auto_270600 ?auto_270601 ?auto_270602 ?auto_270603 ?auto_270604 ?auto_270605 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_270619 - BLOCK
      ?auto_270620 - BLOCK
      ?auto_270621 - BLOCK
      ?auto_270622 - BLOCK
      ?auto_270623 - BLOCK
      ?auto_270624 - BLOCK
      ?auto_270625 - BLOCK
      ?auto_270626 - BLOCK
      ?auto_270627 - BLOCK
      ?auto_270628 - BLOCK
      ?auto_270629 - BLOCK
      ?auto_270630 - BLOCK
    )
    :vars
    (
      ?auto_270631 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_270630 ?auto_270631 ) ( ON-TABLE ?auto_270619 ) ( ON ?auto_270620 ?auto_270619 ) ( not ( = ?auto_270619 ?auto_270620 ) ) ( not ( = ?auto_270619 ?auto_270621 ) ) ( not ( = ?auto_270619 ?auto_270622 ) ) ( not ( = ?auto_270619 ?auto_270623 ) ) ( not ( = ?auto_270619 ?auto_270624 ) ) ( not ( = ?auto_270619 ?auto_270625 ) ) ( not ( = ?auto_270619 ?auto_270626 ) ) ( not ( = ?auto_270619 ?auto_270627 ) ) ( not ( = ?auto_270619 ?auto_270628 ) ) ( not ( = ?auto_270619 ?auto_270629 ) ) ( not ( = ?auto_270619 ?auto_270630 ) ) ( not ( = ?auto_270619 ?auto_270631 ) ) ( not ( = ?auto_270620 ?auto_270621 ) ) ( not ( = ?auto_270620 ?auto_270622 ) ) ( not ( = ?auto_270620 ?auto_270623 ) ) ( not ( = ?auto_270620 ?auto_270624 ) ) ( not ( = ?auto_270620 ?auto_270625 ) ) ( not ( = ?auto_270620 ?auto_270626 ) ) ( not ( = ?auto_270620 ?auto_270627 ) ) ( not ( = ?auto_270620 ?auto_270628 ) ) ( not ( = ?auto_270620 ?auto_270629 ) ) ( not ( = ?auto_270620 ?auto_270630 ) ) ( not ( = ?auto_270620 ?auto_270631 ) ) ( not ( = ?auto_270621 ?auto_270622 ) ) ( not ( = ?auto_270621 ?auto_270623 ) ) ( not ( = ?auto_270621 ?auto_270624 ) ) ( not ( = ?auto_270621 ?auto_270625 ) ) ( not ( = ?auto_270621 ?auto_270626 ) ) ( not ( = ?auto_270621 ?auto_270627 ) ) ( not ( = ?auto_270621 ?auto_270628 ) ) ( not ( = ?auto_270621 ?auto_270629 ) ) ( not ( = ?auto_270621 ?auto_270630 ) ) ( not ( = ?auto_270621 ?auto_270631 ) ) ( not ( = ?auto_270622 ?auto_270623 ) ) ( not ( = ?auto_270622 ?auto_270624 ) ) ( not ( = ?auto_270622 ?auto_270625 ) ) ( not ( = ?auto_270622 ?auto_270626 ) ) ( not ( = ?auto_270622 ?auto_270627 ) ) ( not ( = ?auto_270622 ?auto_270628 ) ) ( not ( = ?auto_270622 ?auto_270629 ) ) ( not ( = ?auto_270622 ?auto_270630 ) ) ( not ( = ?auto_270622 ?auto_270631 ) ) ( not ( = ?auto_270623 ?auto_270624 ) ) ( not ( = ?auto_270623 ?auto_270625 ) ) ( not ( = ?auto_270623 ?auto_270626 ) ) ( not ( = ?auto_270623 ?auto_270627 ) ) ( not ( = ?auto_270623 ?auto_270628 ) ) ( not ( = ?auto_270623 ?auto_270629 ) ) ( not ( = ?auto_270623 ?auto_270630 ) ) ( not ( = ?auto_270623 ?auto_270631 ) ) ( not ( = ?auto_270624 ?auto_270625 ) ) ( not ( = ?auto_270624 ?auto_270626 ) ) ( not ( = ?auto_270624 ?auto_270627 ) ) ( not ( = ?auto_270624 ?auto_270628 ) ) ( not ( = ?auto_270624 ?auto_270629 ) ) ( not ( = ?auto_270624 ?auto_270630 ) ) ( not ( = ?auto_270624 ?auto_270631 ) ) ( not ( = ?auto_270625 ?auto_270626 ) ) ( not ( = ?auto_270625 ?auto_270627 ) ) ( not ( = ?auto_270625 ?auto_270628 ) ) ( not ( = ?auto_270625 ?auto_270629 ) ) ( not ( = ?auto_270625 ?auto_270630 ) ) ( not ( = ?auto_270625 ?auto_270631 ) ) ( not ( = ?auto_270626 ?auto_270627 ) ) ( not ( = ?auto_270626 ?auto_270628 ) ) ( not ( = ?auto_270626 ?auto_270629 ) ) ( not ( = ?auto_270626 ?auto_270630 ) ) ( not ( = ?auto_270626 ?auto_270631 ) ) ( not ( = ?auto_270627 ?auto_270628 ) ) ( not ( = ?auto_270627 ?auto_270629 ) ) ( not ( = ?auto_270627 ?auto_270630 ) ) ( not ( = ?auto_270627 ?auto_270631 ) ) ( not ( = ?auto_270628 ?auto_270629 ) ) ( not ( = ?auto_270628 ?auto_270630 ) ) ( not ( = ?auto_270628 ?auto_270631 ) ) ( not ( = ?auto_270629 ?auto_270630 ) ) ( not ( = ?auto_270629 ?auto_270631 ) ) ( not ( = ?auto_270630 ?auto_270631 ) ) ( ON ?auto_270629 ?auto_270630 ) ( ON ?auto_270628 ?auto_270629 ) ( ON ?auto_270627 ?auto_270628 ) ( ON ?auto_270626 ?auto_270627 ) ( ON ?auto_270625 ?auto_270626 ) ( ON ?auto_270624 ?auto_270625 ) ( ON ?auto_270623 ?auto_270624 ) ( ON ?auto_270622 ?auto_270623 ) ( CLEAR ?auto_270620 ) ( ON ?auto_270621 ?auto_270622 ) ( CLEAR ?auto_270621 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_270619 ?auto_270620 ?auto_270621 )
      ( MAKE-12PILE ?auto_270619 ?auto_270620 ?auto_270621 ?auto_270622 ?auto_270623 ?auto_270624 ?auto_270625 ?auto_270626 ?auto_270627 ?auto_270628 ?auto_270629 ?auto_270630 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_270644 - BLOCK
      ?auto_270645 - BLOCK
      ?auto_270646 - BLOCK
      ?auto_270647 - BLOCK
      ?auto_270648 - BLOCK
      ?auto_270649 - BLOCK
      ?auto_270650 - BLOCK
      ?auto_270651 - BLOCK
      ?auto_270652 - BLOCK
      ?auto_270653 - BLOCK
      ?auto_270654 - BLOCK
      ?auto_270655 - BLOCK
    )
    :vars
    (
      ?auto_270656 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_270655 ?auto_270656 ) ( ON-TABLE ?auto_270644 ) ( not ( = ?auto_270644 ?auto_270645 ) ) ( not ( = ?auto_270644 ?auto_270646 ) ) ( not ( = ?auto_270644 ?auto_270647 ) ) ( not ( = ?auto_270644 ?auto_270648 ) ) ( not ( = ?auto_270644 ?auto_270649 ) ) ( not ( = ?auto_270644 ?auto_270650 ) ) ( not ( = ?auto_270644 ?auto_270651 ) ) ( not ( = ?auto_270644 ?auto_270652 ) ) ( not ( = ?auto_270644 ?auto_270653 ) ) ( not ( = ?auto_270644 ?auto_270654 ) ) ( not ( = ?auto_270644 ?auto_270655 ) ) ( not ( = ?auto_270644 ?auto_270656 ) ) ( not ( = ?auto_270645 ?auto_270646 ) ) ( not ( = ?auto_270645 ?auto_270647 ) ) ( not ( = ?auto_270645 ?auto_270648 ) ) ( not ( = ?auto_270645 ?auto_270649 ) ) ( not ( = ?auto_270645 ?auto_270650 ) ) ( not ( = ?auto_270645 ?auto_270651 ) ) ( not ( = ?auto_270645 ?auto_270652 ) ) ( not ( = ?auto_270645 ?auto_270653 ) ) ( not ( = ?auto_270645 ?auto_270654 ) ) ( not ( = ?auto_270645 ?auto_270655 ) ) ( not ( = ?auto_270645 ?auto_270656 ) ) ( not ( = ?auto_270646 ?auto_270647 ) ) ( not ( = ?auto_270646 ?auto_270648 ) ) ( not ( = ?auto_270646 ?auto_270649 ) ) ( not ( = ?auto_270646 ?auto_270650 ) ) ( not ( = ?auto_270646 ?auto_270651 ) ) ( not ( = ?auto_270646 ?auto_270652 ) ) ( not ( = ?auto_270646 ?auto_270653 ) ) ( not ( = ?auto_270646 ?auto_270654 ) ) ( not ( = ?auto_270646 ?auto_270655 ) ) ( not ( = ?auto_270646 ?auto_270656 ) ) ( not ( = ?auto_270647 ?auto_270648 ) ) ( not ( = ?auto_270647 ?auto_270649 ) ) ( not ( = ?auto_270647 ?auto_270650 ) ) ( not ( = ?auto_270647 ?auto_270651 ) ) ( not ( = ?auto_270647 ?auto_270652 ) ) ( not ( = ?auto_270647 ?auto_270653 ) ) ( not ( = ?auto_270647 ?auto_270654 ) ) ( not ( = ?auto_270647 ?auto_270655 ) ) ( not ( = ?auto_270647 ?auto_270656 ) ) ( not ( = ?auto_270648 ?auto_270649 ) ) ( not ( = ?auto_270648 ?auto_270650 ) ) ( not ( = ?auto_270648 ?auto_270651 ) ) ( not ( = ?auto_270648 ?auto_270652 ) ) ( not ( = ?auto_270648 ?auto_270653 ) ) ( not ( = ?auto_270648 ?auto_270654 ) ) ( not ( = ?auto_270648 ?auto_270655 ) ) ( not ( = ?auto_270648 ?auto_270656 ) ) ( not ( = ?auto_270649 ?auto_270650 ) ) ( not ( = ?auto_270649 ?auto_270651 ) ) ( not ( = ?auto_270649 ?auto_270652 ) ) ( not ( = ?auto_270649 ?auto_270653 ) ) ( not ( = ?auto_270649 ?auto_270654 ) ) ( not ( = ?auto_270649 ?auto_270655 ) ) ( not ( = ?auto_270649 ?auto_270656 ) ) ( not ( = ?auto_270650 ?auto_270651 ) ) ( not ( = ?auto_270650 ?auto_270652 ) ) ( not ( = ?auto_270650 ?auto_270653 ) ) ( not ( = ?auto_270650 ?auto_270654 ) ) ( not ( = ?auto_270650 ?auto_270655 ) ) ( not ( = ?auto_270650 ?auto_270656 ) ) ( not ( = ?auto_270651 ?auto_270652 ) ) ( not ( = ?auto_270651 ?auto_270653 ) ) ( not ( = ?auto_270651 ?auto_270654 ) ) ( not ( = ?auto_270651 ?auto_270655 ) ) ( not ( = ?auto_270651 ?auto_270656 ) ) ( not ( = ?auto_270652 ?auto_270653 ) ) ( not ( = ?auto_270652 ?auto_270654 ) ) ( not ( = ?auto_270652 ?auto_270655 ) ) ( not ( = ?auto_270652 ?auto_270656 ) ) ( not ( = ?auto_270653 ?auto_270654 ) ) ( not ( = ?auto_270653 ?auto_270655 ) ) ( not ( = ?auto_270653 ?auto_270656 ) ) ( not ( = ?auto_270654 ?auto_270655 ) ) ( not ( = ?auto_270654 ?auto_270656 ) ) ( not ( = ?auto_270655 ?auto_270656 ) ) ( ON ?auto_270654 ?auto_270655 ) ( ON ?auto_270653 ?auto_270654 ) ( ON ?auto_270652 ?auto_270653 ) ( ON ?auto_270651 ?auto_270652 ) ( ON ?auto_270650 ?auto_270651 ) ( ON ?auto_270649 ?auto_270650 ) ( ON ?auto_270648 ?auto_270649 ) ( ON ?auto_270647 ?auto_270648 ) ( ON ?auto_270646 ?auto_270647 ) ( CLEAR ?auto_270644 ) ( ON ?auto_270645 ?auto_270646 ) ( CLEAR ?auto_270645 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_270644 ?auto_270645 )
      ( MAKE-12PILE ?auto_270644 ?auto_270645 ?auto_270646 ?auto_270647 ?auto_270648 ?auto_270649 ?auto_270650 ?auto_270651 ?auto_270652 ?auto_270653 ?auto_270654 ?auto_270655 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_270669 - BLOCK
      ?auto_270670 - BLOCK
      ?auto_270671 - BLOCK
      ?auto_270672 - BLOCK
      ?auto_270673 - BLOCK
      ?auto_270674 - BLOCK
      ?auto_270675 - BLOCK
      ?auto_270676 - BLOCK
      ?auto_270677 - BLOCK
      ?auto_270678 - BLOCK
      ?auto_270679 - BLOCK
      ?auto_270680 - BLOCK
    )
    :vars
    (
      ?auto_270681 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_270680 ?auto_270681 ) ( ON-TABLE ?auto_270669 ) ( not ( = ?auto_270669 ?auto_270670 ) ) ( not ( = ?auto_270669 ?auto_270671 ) ) ( not ( = ?auto_270669 ?auto_270672 ) ) ( not ( = ?auto_270669 ?auto_270673 ) ) ( not ( = ?auto_270669 ?auto_270674 ) ) ( not ( = ?auto_270669 ?auto_270675 ) ) ( not ( = ?auto_270669 ?auto_270676 ) ) ( not ( = ?auto_270669 ?auto_270677 ) ) ( not ( = ?auto_270669 ?auto_270678 ) ) ( not ( = ?auto_270669 ?auto_270679 ) ) ( not ( = ?auto_270669 ?auto_270680 ) ) ( not ( = ?auto_270669 ?auto_270681 ) ) ( not ( = ?auto_270670 ?auto_270671 ) ) ( not ( = ?auto_270670 ?auto_270672 ) ) ( not ( = ?auto_270670 ?auto_270673 ) ) ( not ( = ?auto_270670 ?auto_270674 ) ) ( not ( = ?auto_270670 ?auto_270675 ) ) ( not ( = ?auto_270670 ?auto_270676 ) ) ( not ( = ?auto_270670 ?auto_270677 ) ) ( not ( = ?auto_270670 ?auto_270678 ) ) ( not ( = ?auto_270670 ?auto_270679 ) ) ( not ( = ?auto_270670 ?auto_270680 ) ) ( not ( = ?auto_270670 ?auto_270681 ) ) ( not ( = ?auto_270671 ?auto_270672 ) ) ( not ( = ?auto_270671 ?auto_270673 ) ) ( not ( = ?auto_270671 ?auto_270674 ) ) ( not ( = ?auto_270671 ?auto_270675 ) ) ( not ( = ?auto_270671 ?auto_270676 ) ) ( not ( = ?auto_270671 ?auto_270677 ) ) ( not ( = ?auto_270671 ?auto_270678 ) ) ( not ( = ?auto_270671 ?auto_270679 ) ) ( not ( = ?auto_270671 ?auto_270680 ) ) ( not ( = ?auto_270671 ?auto_270681 ) ) ( not ( = ?auto_270672 ?auto_270673 ) ) ( not ( = ?auto_270672 ?auto_270674 ) ) ( not ( = ?auto_270672 ?auto_270675 ) ) ( not ( = ?auto_270672 ?auto_270676 ) ) ( not ( = ?auto_270672 ?auto_270677 ) ) ( not ( = ?auto_270672 ?auto_270678 ) ) ( not ( = ?auto_270672 ?auto_270679 ) ) ( not ( = ?auto_270672 ?auto_270680 ) ) ( not ( = ?auto_270672 ?auto_270681 ) ) ( not ( = ?auto_270673 ?auto_270674 ) ) ( not ( = ?auto_270673 ?auto_270675 ) ) ( not ( = ?auto_270673 ?auto_270676 ) ) ( not ( = ?auto_270673 ?auto_270677 ) ) ( not ( = ?auto_270673 ?auto_270678 ) ) ( not ( = ?auto_270673 ?auto_270679 ) ) ( not ( = ?auto_270673 ?auto_270680 ) ) ( not ( = ?auto_270673 ?auto_270681 ) ) ( not ( = ?auto_270674 ?auto_270675 ) ) ( not ( = ?auto_270674 ?auto_270676 ) ) ( not ( = ?auto_270674 ?auto_270677 ) ) ( not ( = ?auto_270674 ?auto_270678 ) ) ( not ( = ?auto_270674 ?auto_270679 ) ) ( not ( = ?auto_270674 ?auto_270680 ) ) ( not ( = ?auto_270674 ?auto_270681 ) ) ( not ( = ?auto_270675 ?auto_270676 ) ) ( not ( = ?auto_270675 ?auto_270677 ) ) ( not ( = ?auto_270675 ?auto_270678 ) ) ( not ( = ?auto_270675 ?auto_270679 ) ) ( not ( = ?auto_270675 ?auto_270680 ) ) ( not ( = ?auto_270675 ?auto_270681 ) ) ( not ( = ?auto_270676 ?auto_270677 ) ) ( not ( = ?auto_270676 ?auto_270678 ) ) ( not ( = ?auto_270676 ?auto_270679 ) ) ( not ( = ?auto_270676 ?auto_270680 ) ) ( not ( = ?auto_270676 ?auto_270681 ) ) ( not ( = ?auto_270677 ?auto_270678 ) ) ( not ( = ?auto_270677 ?auto_270679 ) ) ( not ( = ?auto_270677 ?auto_270680 ) ) ( not ( = ?auto_270677 ?auto_270681 ) ) ( not ( = ?auto_270678 ?auto_270679 ) ) ( not ( = ?auto_270678 ?auto_270680 ) ) ( not ( = ?auto_270678 ?auto_270681 ) ) ( not ( = ?auto_270679 ?auto_270680 ) ) ( not ( = ?auto_270679 ?auto_270681 ) ) ( not ( = ?auto_270680 ?auto_270681 ) ) ( ON ?auto_270679 ?auto_270680 ) ( ON ?auto_270678 ?auto_270679 ) ( ON ?auto_270677 ?auto_270678 ) ( ON ?auto_270676 ?auto_270677 ) ( ON ?auto_270675 ?auto_270676 ) ( ON ?auto_270674 ?auto_270675 ) ( ON ?auto_270673 ?auto_270674 ) ( ON ?auto_270672 ?auto_270673 ) ( ON ?auto_270671 ?auto_270672 ) ( CLEAR ?auto_270669 ) ( ON ?auto_270670 ?auto_270671 ) ( CLEAR ?auto_270670 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_270669 ?auto_270670 )
      ( MAKE-12PILE ?auto_270669 ?auto_270670 ?auto_270671 ?auto_270672 ?auto_270673 ?auto_270674 ?auto_270675 ?auto_270676 ?auto_270677 ?auto_270678 ?auto_270679 ?auto_270680 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_270694 - BLOCK
      ?auto_270695 - BLOCK
      ?auto_270696 - BLOCK
      ?auto_270697 - BLOCK
      ?auto_270698 - BLOCK
      ?auto_270699 - BLOCK
      ?auto_270700 - BLOCK
      ?auto_270701 - BLOCK
      ?auto_270702 - BLOCK
      ?auto_270703 - BLOCK
      ?auto_270704 - BLOCK
      ?auto_270705 - BLOCK
    )
    :vars
    (
      ?auto_270706 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_270705 ?auto_270706 ) ( not ( = ?auto_270694 ?auto_270695 ) ) ( not ( = ?auto_270694 ?auto_270696 ) ) ( not ( = ?auto_270694 ?auto_270697 ) ) ( not ( = ?auto_270694 ?auto_270698 ) ) ( not ( = ?auto_270694 ?auto_270699 ) ) ( not ( = ?auto_270694 ?auto_270700 ) ) ( not ( = ?auto_270694 ?auto_270701 ) ) ( not ( = ?auto_270694 ?auto_270702 ) ) ( not ( = ?auto_270694 ?auto_270703 ) ) ( not ( = ?auto_270694 ?auto_270704 ) ) ( not ( = ?auto_270694 ?auto_270705 ) ) ( not ( = ?auto_270694 ?auto_270706 ) ) ( not ( = ?auto_270695 ?auto_270696 ) ) ( not ( = ?auto_270695 ?auto_270697 ) ) ( not ( = ?auto_270695 ?auto_270698 ) ) ( not ( = ?auto_270695 ?auto_270699 ) ) ( not ( = ?auto_270695 ?auto_270700 ) ) ( not ( = ?auto_270695 ?auto_270701 ) ) ( not ( = ?auto_270695 ?auto_270702 ) ) ( not ( = ?auto_270695 ?auto_270703 ) ) ( not ( = ?auto_270695 ?auto_270704 ) ) ( not ( = ?auto_270695 ?auto_270705 ) ) ( not ( = ?auto_270695 ?auto_270706 ) ) ( not ( = ?auto_270696 ?auto_270697 ) ) ( not ( = ?auto_270696 ?auto_270698 ) ) ( not ( = ?auto_270696 ?auto_270699 ) ) ( not ( = ?auto_270696 ?auto_270700 ) ) ( not ( = ?auto_270696 ?auto_270701 ) ) ( not ( = ?auto_270696 ?auto_270702 ) ) ( not ( = ?auto_270696 ?auto_270703 ) ) ( not ( = ?auto_270696 ?auto_270704 ) ) ( not ( = ?auto_270696 ?auto_270705 ) ) ( not ( = ?auto_270696 ?auto_270706 ) ) ( not ( = ?auto_270697 ?auto_270698 ) ) ( not ( = ?auto_270697 ?auto_270699 ) ) ( not ( = ?auto_270697 ?auto_270700 ) ) ( not ( = ?auto_270697 ?auto_270701 ) ) ( not ( = ?auto_270697 ?auto_270702 ) ) ( not ( = ?auto_270697 ?auto_270703 ) ) ( not ( = ?auto_270697 ?auto_270704 ) ) ( not ( = ?auto_270697 ?auto_270705 ) ) ( not ( = ?auto_270697 ?auto_270706 ) ) ( not ( = ?auto_270698 ?auto_270699 ) ) ( not ( = ?auto_270698 ?auto_270700 ) ) ( not ( = ?auto_270698 ?auto_270701 ) ) ( not ( = ?auto_270698 ?auto_270702 ) ) ( not ( = ?auto_270698 ?auto_270703 ) ) ( not ( = ?auto_270698 ?auto_270704 ) ) ( not ( = ?auto_270698 ?auto_270705 ) ) ( not ( = ?auto_270698 ?auto_270706 ) ) ( not ( = ?auto_270699 ?auto_270700 ) ) ( not ( = ?auto_270699 ?auto_270701 ) ) ( not ( = ?auto_270699 ?auto_270702 ) ) ( not ( = ?auto_270699 ?auto_270703 ) ) ( not ( = ?auto_270699 ?auto_270704 ) ) ( not ( = ?auto_270699 ?auto_270705 ) ) ( not ( = ?auto_270699 ?auto_270706 ) ) ( not ( = ?auto_270700 ?auto_270701 ) ) ( not ( = ?auto_270700 ?auto_270702 ) ) ( not ( = ?auto_270700 ?auto_270703 ) ) ( not ( = ?auto_270700 ?auto_270704 ) ) ( not ( = ?auto_270700 ?auto_270705 ) ) ( not ( = ?auto_270700 ?auto_270706 ) ) ( not ( = ?auto_270701 ?auto_270702 ) ) ( not ( = ?auto_270701 ?auto_270703 ) ) ( not ( = ?auto_270701 ?auto_270704 ) ) ( not ( = ?auto_270701 ?auto_270705 ) ) ( not ( = ?auto_270701 ?auto_270706 ) ) ( not ( = ?auto_270702 ?auto_270703 ) ) ( not ( = ?auto_270702 ?auto_270704 ) ) ( not ( = ?auto_270702 ?auto_270705 ) ) ( not ( = ?auto_270702 ?auto_270706 ) ) ( not ( = ?auto_270703 ?auto_270704 ) ) ( not ( = ?auto_270703 ?auto_270705 ) ) ( not ( = ?auto_270703 ?auto_270706 ) ) ( not ( = ?auto_270704 ?auto_270705 ) ) ( not ( = ?auto_270704 ?auto_270706 ) ) ( not ( = ?auto_270705 ?auto_270706 ) ) ( ON ?auto_270704 ?auto_270705 ) ( ON ?auto_270703 ?auto_270704 ) ( ON ?auto_270702 ?auto_270703 ) ( ON ?auto_270701 ?auto_270702 ) ( ON ?auto_270700 ?auto_270701 ) ( ON ?auto_270699 ?auto_270700 ) ( ON ?auto_270698 ?auto_270699 ) ( ON ?auto_270697 ?auto_270698 ) ( ON ?auto_270696 ?auto_270697 ) ( ON ?auto_270695 ?auto_270696 ) ( ON ?auto_270694 ?auto_270695 ) ( CLEAR ?auto_270694 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_270694 )
      ( MAKE-12PILE ?auto_270694 ?auto_270695 ?auto_270696 ?auto_270697 ?auto_270698 ?auto_270699 ?auto_270700 ?auto_270701 ?auto_270702 ?auto_270703 ?auto_270704 ?auto_270705 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_270719 - BLOCK
      ?auto_270720 - BLOCK
      ?auto_270721 - BLOCK
      ?auto_270722 - BLOCK
      ?auto_270723 - BLOCK
      ?auto_270724 - BLOCK
      ?auto_270725 - BLOCK
      ?auto_270726 - BLOCK
      ?auto_270727 - BLOCK
      ?auto_270728 - BLOCK
      ?auto_270729 - BLOCK
      ?auto_270730 - BLOCK
    )
    :vars
    (
      ?auto_270731 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_270730 ?auto_270731 ) ( not ( = ?auto_270719 ?auto_270720 ) ) ( not ( = ?auto_270719 ?auto_270721 ) ) ( not ( = ?auto_270719 ?auto_270722 ) ) ( not ( = ?auto_270719 ?auto_270723 ) ) ( not ( = ?auto_270719 ?auto_270724 ) ) ( not ( = ?auto_270719 ?auto_270725 ) ) ( not ( = ?auto_270719 ?auto_270726 ) ) ( not ( = ?auto_270719 ?auto_270727 ) ) ( not ( = ?auto_270719 ?auto_270728 ) ) ( not ( = ?auto_270719 ?auto_270729 ) ) ( not ( = ?auto_270719 ?auto_270730 ) ) ( not ( = ?auto_270719 ?auto_270731 ) ) ( not ( = ?auto_270720 ?auto_270721 ) ) ( not ( = ?auto_270720 ?auto_270722 ) ) ( not ( = ?auto_270720 ?auto_270723 ) ) ( not ( = ?auto_270720 ?auto_270724 ) ) ( not ( = ?auto_270720 ?auto_270725 ) ) ( not ( = ?auto_270720 ?auto_270726 ) ) ( not ( = ?auto_270720 ?auto_270727 ) ) ( not ( = ?auto_270720 ?auto_270728 ) ) ( not ( = ?auto_270720 ?auto_270729 ) ) ( not ( = ?auto_270720 ?auto_270730 ) ) ( not ( = ?auto_270720 ?auto_270731 ) ) ( not ( = ?auto_270721 ?auto_270722 ) ) ( not ( = ?auto_270721 ?auto_270723 ) ) ( not ( = ?auto_270721 ?auto_270724 ) ) ( not ( = ?auto_270721 ?auto_270725 ) ) ( not ( = ?auto_270721 ?auto_270726 ) ) ( not ( = ?auto_270721 ?auto_270727 ) ) ( not ( = ?auto_270721 ?auto_270728 ) ) ( not ( = ?auto_270721 ?auto_270729 ) ) ( not ( = ?auto_270721 ?auto_270730 ) ) ( not ( = ?auto_270721 ?auto_270731 ) ) ( not ( = ?auto_270722 ?auto_270723 ) ) ( not ( = ?auto_270722 ?auto_270724 ) ) ( not ( = ?auto_270722 ?auto_270725 ) ) ( not ( = ?auto_270722 ?auto_270726 ) ) ( not ( = ?auto_270722 ?auto_270727 ) ) ( not ( = ?auto_270722 ?auto_270728 ) ) ( not ( = ?auto_270722 ?auto_270729 ) ) ( not ( = ?auto_270722 ?auto_270730 ) ) ( not ( = ?auto_270722 ?auto_270731 ) ) ( not ( = ?auto_270723 ?auto_270724 ) ) ( not ( = ?auto_270723 ?auto_270725 ) ) ( not ( = ?auto_270723 ?auto_270726 ) ) ( not ( = ?auto_270723 ?auto_270727 ) ) ( not ( = ?auto_270723 ?auto_270728 ) ) ( not ( = ?auto_270723 ?auto_270729 ) ) ( not ( = ?auto_270723 ?auto_270730 ) ) ( not ( = ?auto_270723 ?auto_270731 ) ) ( not ( = ?auto_270724 ?auto_270725 ) ) ( not ( = ?auto_270724 ?auto_270726 ) ) ( not ( = ?auto_270724 ?auto_270727 ) ) ( not ( = ?auto_270724 ?auto_270728 ) ) ( not ( = ?auto_270724 ?auto_270729 ) ) ( not ( = ?auto_270724 ?auto_270730 ) ) ( not ( = ?auto_270724 ?auto_270731 ) ) ( not ( = ?auto_270725 ?auto_270726 ) ) ( not ( = ?auto_270725 ?auto_270727 ) ) ( not ( = ?auto_270725 ?auto_270728 ) ) ( not ( = ?auto_270725 ?auto_270729 ) ) ( not ( = ?auto_270725 ?auto_270730 ) ) ( not ( = ?auto_270725 ?auto_270731 ) ) ( not ( = ?auto_270726 ?auto_270727 ) ) ( not ( = ?auto_270726 ?auto_270728 ) ) ( not ( = ?auto_270726 ?auto_270729 ) ) ( not ( = ?auto_270726 ?auto_270730 ) ) ( not ( = ?auto_270726 ?auto_270731 ) ) ( not ( = ?auto_270727 ?auto_270728 ) ) ( not ( = ?auto_270727 ?auto_270729 ) ) ( not ( = ?auto_270727 ?auto_270730 ) ) ( not ( = ?auto_270727 ?auto_270731 ) ) ( not ( = ?auto_270728 ?auto_270729 ) ) ( not ( = ?auto_270728 ?auto_270730 ) ) ( not ( = ?auto_270728 ?auto_270731 ) ) ( not ( = ?auto_270729 ?auto_270730 ) ) ( not ( = ?auto_270729 ?auto_270731 ) ) ( not ( = ?auto_270730 ?auto_270731 ) ) ( ON ?auto_270729 ?auto_270730 ) ( ON ?auto_270728 ?auto_270729 ) ( ON ?auto_270727 ?auto_270728 ) ( ON ?auto_270726 ?auto_270727 ) ( ON ?auto_270725 ?auto_270726 ) ( ON ?auto_270724 ?auto_270725 ) ( ON ?auto_270723 ?auto_270724 ) ( ON ?auto_270722 ?auto_270723 ) ( ON ?auto_270721 ?auto_270722 ) ( ON ?auto_270720 ?auto_270721 ) ( ON ?auto_270719 ?auto_270720 ) ( CLEAR ?auto_270719 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_270719 )
      ( MAKE-12PILE ?auto_270719 ?auto_270720 ?auto_270721 ?auto_270722 ?auto_270723 ?auto_270724 ?auto_270725 ?auto_270726 ?auto_270727 ?auto_270728 ?auto_270729 ?auto_270730 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_270745 - BLOCK
      ?auto_270746 - BLOCK
      ?auto_270747 - BLOCK
      ?auto_270748 - BLOCK
      ?auto_270749 - BLOCK
      ?auto_270750 - BLOCK
      ?auto_270751 - BLOCK
      ?auto_270752 - BLOCK
      ?auto_270753 - BLOCK
      ?auto_270754 - BLOCK
      ?auto_270755 - BLOCK
      ?auto_270756 - BLOCK
      ?auto_270757 - BLOCK
    )
    :vars
    (
      ?auto_270758 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_270756 ) ( ON ?auto_270757 ?auto_270758 ) ( CLEAR ?auto_270757 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_270745 ) ( ON ?auto_270746 ?auto_270745 ) ( ON ?auto_270747 ?auto_270746 ) ( ON ?auto_270748 ?auto_270747 ) ( ON ?auto_270749 ?auto_270748 ) ( ON ?auto_270750 ?auto_270749 ) ( ON ?auto_270751 ?auto_270750 ) ( ON ?auto_270752 ?auto_270751 ) ( ON ?auto_270753 ?auto_270752 ) ( ON ?auto_270754 ?auto_270753 ) ( ON ?auto_270755 ?auto_270754 ) ( ON ?auto_270756 ?auto_270755 ) ( not ( = ?auto_270745 ?auto_270746 ) ) ( not ( = ?auto_270745 ?auto_270747 ) ) ( not ( = ?auto_270745 ?auto_270748 ) ) ( not ( = ?auto_270745 ?auto_270749 ) ) ( not ( = ?auto_270745 ?auto_270750 ) ) ( not ( = ?auto_270745 ?auto_270751 ) ) ( not ( = ?auto_270745 ?auto_270752 ) ) ( not ( = ?auto_270745 ?auto_270753 ) ) ( not ( = ?auto_270745 ?auto_270754 ) ) ( not ( = ?auto_270745 ?auto_270755 ) ) ( not ( = ?auto_270745 ?auto_270756 ) ) ( not ( = ?auto_270745 ?auto_270757 ) ) ( not ( = ?auto_270745 ?auto_270758 ) ) ( not ( = ?auto_270746 ?auto_270747 ) ) ( not ( = ?auto_270746 ?auto_270748 ) ) ( not ( = ?auto_270746 ?auto_270749 ) ) ( not ( = ?auto_270746 ?auto_270750 ) ) ( not ( = ?auto_270746 ?auto_270751 ) ) ( not ( = ?auto_270746 ?auto_270752 ) ) ( not ( = ?auto_270746 ?auto_270753 ) ) ( not ( = ?auto_270746 ?auto_270754 ) ) ( not ( = ?auto_270746 ?auto_270755 ) ) ( not ( = ?auto_270746 ?auto_270756 ) ) ( not ( = ?auto_270746 ?auto_270757 ) ) ( not ( = ?auto_270746 ?auto_270758 ) ) ( not ( = ?auto_270747 ?auto_270748 ) ) ( not ( = ?auto_270747 ?auto_270749 ) ) ( not ( = ?auto_270747 ?auto_270750 ) ) ( not ( = ?auto_270747 ?auto_270751 ) ) ( not ( = ?auto_270747 ?auto_270752 ) ) ( not ( = ?auto_270747 ?auto_270753 ) ) ( not ( = ?auto_270747 ?auto_270754 ) ) ( not ( = ?auto_270747 ?auto_270755 ) ) ( not ( = ?auto_270747 ?auto_270756 ) ) ( not ( = ?auto_270747 ?auto_270757 ) ) ( not ( = ?auto_270747 ?auto_270758 ) ) ( not ( = ?auto_270748 ?auto_270749 ) ) ( not ( = ?auto_270748 ?auto_270750 ) ) ( not ( = ?auto_270748 ?auto_270751 ) ) ( not ( = ?auto_270748 ?auto_270752 ) ) ( not ( = ?auto_270748 ?auto_270753 ) ) ( not ( = ?auto_270748 ?auto_270754 ) ) ( not ( = ?auto_270748 ?auto_270755 ) ) ( not ( = ?auto_270748 ?auto_270756 ) ) ( not ( = ?auto_270748 ?auto_270757 ) ) ( not ( = ?auto_270748 ?auto_270758 ) ) ( not ( = ?auto_270749 ?auto_270750 ) ) ( not ( = ?auto_270749 ?auto_270751 ) ) ( not ( = ?auto_270749 ?auto_270752 ) ) ( not ( = ?auto_270749 ?auto_270753 ) ) ( not ( = ?auto_270749 ?auto_270754 ) ) ( not ( = ?auto_270749 ?auto_270755 ) ) ( not ( = ?auto_270749 ?auto_270756 ) ) ( not ( = ?auto_270749 ?auto_270757 ) ) ( not ( = ?auto_270749 ?auto_270758 ) ) ( not ( = ?auto_270750 ?auto_270751 ) ) ( not ( = ?auto_270750 ?auto_270752 ) ) ( not ( = ?auto_270750 ?auto_270753 ) ) ( not ( = ?auto_270750 ?auto_270754 ) ) ( not ( = ?auto_270750 ?auto_270755 ) ) ( not ( = ?auto_270750 ?auto_270756 ) ) ( not ( = ?auto_270750 ?auto_270757 ) ) ( not ( = ?auto_270750 ?auto_270758 ) ) ( not ( = ?auto_270751 ?auto_270752 ) ) ( not ( = ?auto_270751 ?auto_270753 ) ) ( not ( = ?auto_270751 ?auto_270754 ) ) ( not ( = ?auto_270751 ?auto_270755 ) ) ( not ( = ?auto_270751 ?auto_270756 ) ) ( not ( = ?auto_270751 ?auto_270757 ) ) ( not ( = ?auto_270751 ?auto_270758 ) ) ( not ( = ?auto_270752 ?auto_270753 ) ) ( not ( = ?auto_270752 ?auto_270754 ) ) ( not ( = ?auto_270752 ?auto_270755 ) ) ( not ( = ?auto_270752 ?auto_270756 ) ) ( not ( = ?auto_270752 ?auto_270757 ) ) ( not ( = ?auto_270752 ?auto_270758 ) ) ( not ( = ?auto_270753 ?auto_270754 ) ) ( not ( = ?auto_270753 ?auto_270755 ) ) ( not ( = ?auto_270753 ?auto_270756 ) ) ( not ( = ?auto_270753 ?auto_270757 ) ) ( not ( = ?auto_270753 ?auto_270758 ) ) ( not ( = ?auto_270754 ?auto_270755 ) ) ( not ( = ?auto_270754 ?auto_270756 ) ) ( not ( = ?auto_270754 ?auto_270757 ) ) ( not ( = ?auto_270754 ?auto_270758 ) ) ( not ( = ?auto_270755 ?auto_270756 ) ) ( not ( = ?auto_270755 ?auto_270757 ) ) ( not ( = ?auto_270755 ?auto_270758 ) ) ( not ( = ?auto_270756 ?auto_270757 ) ) ( not ( = ?auto_270756 ?auto_270758 ) ) ( not ( = ?auto_270757 ?auto_270758 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_270757 ?auto_270758 )
      ( !STACK ?auto_270757 ?auto_270756 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_270772 - BLOCK
      ?auto_270773 - BLOCK
      ?auto_270774 - BLOCK
      ?auto_270775 - BLOCK
      ?auto_270776 - BLOCK
      ?auto_270777 - BLOCK
      ?auto_270778 - BLOCK
      ?auto_270779 - BLOCK
      ?auto_270780 - BLOCK
      ?auto_270781 - BLOCK
      ?auto_270782 - BLOCK
      ?auto_270783 - BLOCK
      ?auto_270784 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_270783 ) ( ON-TABLE ?auto_270784 ) ( CLEAR ?auto_270784 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_270772 ) ( ON ?auto_270773 ?auto_270772 ) ( ON ?auto_270774 ?auto_270773 ) ( ON ?auto_270775 ?auto_270774 ) ( ON ?auto_270776 ?auto_270775 ) ( ON ?auto_270777 ?auto_270776 ) ( ON ?auto_270778 ?auto_270777 ) ( ON ?auto_270779 ?auto_270778 ) ( ON ?auto_270780 ?auto_270779 ) ( ON ?auto_270781 ?auto_270780 ) ( ON ?auto_270782 ?auto_270781 ) ( ON ?auto_270783 ?auto_270782 ) ( not ( = ?auto_270772 ?auto_270773 ) ) ( not ( = ?auto_270772 ?auto_270774 ) ) ( not ( = ?auto_270772 ?auto_270775 ) ) ( not ( = ?auto_270772 ?auto_270776 ) ) ( not ( = ?auto_270772 ?auto_270777 ) ) ( not ( = ?auto_270772 ?auto_270778 ) ) ( not ( = ?auto_270772 ?auto_270779 ) ) ( not ( = ?auto_270772 ?auto_270780 ) ) ( not ( = ?auto_270772 ?auto_270781 ) ) ( not ( = ?auto_270772 ?auto_270782 ) ) ( not ( = ?auto_270772 ?auto_270783 ) ) ( not ( = ?auto_270772 ?auto_270784 ) ) ( not ( = ?auto_270773 ?auto_270774 ) ) ( not ( = ?auto_270773 ?auto_270775 ) ) ( not ( = ?auto_270773 ?auto_270776 ) ) ( not ( = ?auto_270773 ?auto_270777 ) ) ( not ( = ?auto_270773 ?auto_270778 ) ) ( not ( = ?auto_270773 ?auto_270779 ) ) ( not ( = ?auto_270773 ?auto_270780 ) ) ( not ( = ?auto_270773 ?auto_270781 ) ) ( not ( = ?auto_270773 ?auto_270782 ) ) ( not ( = ?auto_270773 ?auto_270783 ) ) ( not ( = ?auto_270773 ?auto_270784 ) ) ( not ( = ?auto_270774 ?auto_270775 ) ) ( not ( = ?auto_270774 ?auto_270776 ) ) ( not ( = ?auto_270774 ?auto_270777 ) ) ( not ( = ?auto_270774 ?auto_270778 ) ) ( not ( = ?auto_270774 ?auto_270779 ) ) ( not ( = ?auto_270774 ?auto_270780 ) ) ( not ( = ?auto_270774 ?auto_270781 ) ) ( not ( = ?auto_270774 ?auto_270782 ) ) ( not ( = ?auto_270774 ?auto_270783 ) ) ( not ( = ?auto_270774 ?auto_270784 ) ) ( not ( = ?auto_270775 ?auto_270776 ) ) ( not ( = ?auto_270775 ?auto_270777 ) ) ( not ( = ?auto_270775 ?auto_270778 ) ) ( not ( = ?auto_270775 ?auto_270779 ) ) ( not ( = ?auto_270775 ?auto_270780 ) ) ( not ( = ?auto_270775 ?auto_270781 ) ) ( not ( = ?auto_270775 ?auto_270782 ) ) ( not ( = ?auto_270775 ?auto_270783 ) ) ( not ( = ?auto_270775 ?auto_270784 ) ) ( not ( = ?auto_270776 ?auto_270777 ) ) ( not ( = ?auto_270776 ?auto_270778 ) ) ( not ( = ?auto_270776 ?auto_270779 ) ) ( not ( = ?auto_270776 ?auto_270780 ) ) ( not ( = ?auto_270776 ?auto_270781 ) ) ( not ( = ?auto_270776 ?auto_270782 ) ) ( not ( = ?auto_270776 ?auto_270783 ) ) ( not ( = ?auto_270776 ?auto_270784 ) ) ( not ( = ?auto_270777 ?auto_270778 ) ) ( not ( = ?auto_270777 ?auto_270779 ) ) ( not ( = ?auto_270777 ?auto_270780 ) ) ( not ( = ?auto_270777 ?auto_270781 ) ) ( not ( = ?auto_270777 ?auto_270782 ) ) ( not ( = ?auto_270777 ?auto_270783 ) ) ( not ( = ?auto_270777 ?auto_270784 ) ) ( not ( = ?auto_270778 ?auto_270779 ) ) ( not ( = ?auto_270778 ?auto_270780 ) ) ( not ( = ?auto_270778 ?auto_270781 ) ) ( not ( = ?auto_270778 ?auto_270782 ) ) ( not ( = ?auto_270778 ?auto_270783 ) ) ( not ( = ?auto_270778 ?auto_270784 ) ) ( not ( = ?auto_270779 ?auto_270780 ) ) ( not ( = ?auto_270779 ?auto_270781 ) ) ( not ( = ?auto_270779 ?auto_270782 ) ) ( not ( = ?auto_270779 ?auto_270783 ) ) ( not ( = ?auto_270779 ?auto_270784 ) ) ( not ( = ?auto_270780 ?auto_270781 ) ) ( not ( = ?auto_270780 ?auto_270782 ) ) ( not ( = ?auto_270780 ?auto_270783 ) ) ( not ( = ?auto_270780 ?auto_270784 ) ) ( not ( = ?auto_270781 ?auto_270782 ) ) ( not ( = ?auto_270781 ?auto_270783 ) ) ( not ( = ?auto_270781 ?auto_270784 ) ) ( not ( = ?auto_270782 ?auto_270783 ) ) ( not ( = ?auto_270782 ?auto_270784 ) ) ( not ( = ?auto_270783 ?auto_270784 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_270784 )
      ( !STACK ?auto_270784 ?auto_270783 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_270798 - BLOCK
      ?auto_270799 - BLOCK
      ?auto_270800 - BLOCK
      ?auto_270801 - BLOCK
      ?auto_270802 - BLOCK
      ?auto_270803 - BLOCK
      ?auto_270804 - BLOCK
      ?auto_270805 - BLOCK
      ?auto_270806 - BLOCK
      ?auto_270807 - BLOCK
      ?auto_270808 - BLOCK
      ?auto_270809 - BLOCK
      ?auto_270810 - BLOCK
    )
    :vars
    (
      ?auto_270811 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_270810 ?auto_270811 ) ( ON-TABLE ?auto_270798 ) ( ON ?auto_270799 ?auto_270798 ) ( ON ?auto_270800 ?auto_270799 ) ( ON ?auto_270801 ?auto_270800 ) ( ON ?auto_270802 ?auto_270801 ) ( ON ?auto_270803 ?auto_270802 ) ( ON ?auto_270804 ?auto_270803 ) ( ON ?auto_270805 ?auto_270804 ) ( ON ?auto_270806 ?auto_270805 ) ( ON ?auto_270807 ?auto_270806 ) ( ON ?auto_270808 ?auto_270807 ) ( not ( = ?auto_270798 ?auto_270799 ) ) ( not ( = ?auto_270798 ?auto_270800 ) ) ( not ( = ?auto_270798 ?auto_270801 ) ) ( not ( = ?auto_270798 ?auto_270802 ) ) ( not ( = ?auto_270798 ?auto_270803 ) ) ( not ( = ?auto_270798 ?auto_270804 ) ) ( not ( = ?auto_270798 ?auto_270805 ) ) ( not ( = ?auto_270798 ?auto_270806 ) ) ( not ( = ?auto_270798 ?auto_270807 ) ) ( not ( = ?auto_270798 ?auto_270808 ) ) ( not ( = ?auto_270798 ?auto_270809 ) ) ( not ( = ?auto_270798 ?auto_270810 ) ) ( not ( = ?auto_270798 ?auto_270811 ) ) ( not ( = ?auto_270799 ?auto_270800 ) ) ( not ( = ?auto_270799 ?auto_270801 ) ) ( not ( = ?auto_270799 ?auto_270802 ) ) ( not ( = ?auto_270799 ?auto_270803 ) ) ( not ( = ?auto_270799 ?auto_270804 ) ) ( not ( = ?auto_270799 ?auto_270805 ) ) ( not ( = ?auto_270799 ?auto_270806 ) ) ( not ( = ?auto_270799 ?auto_270807 ) ) ( not ( = ?auto_270799 ?auto_270808 ) ) ( not ( = ?auto_270799 ?auto_270809 ) ) ( not ( = ?auto_270799 ?auto_270810 ) ) ( not ( = ?auto_270799 ?auto_270811 ) ) ( not ( = ?auto_270800 ?auto_270801 ) ) ( not ( = ?auto_270800 ?auto_270802 ) ) ( not ( = ?auto_270800 ?auto_270803 ) ) ( not ( = ?auto_270800 ?auto_270804 ) ) ( not ( = ?auto_270800 ?auto_270805 ) ) ( not ( = ?auto_270800 ?auto_270806 ) ) ( not ( = ?auto_270800 ?auto_270807 ) ) ( not ( = ?auto_270800 ?auto_270808 ) ) ( not ( = ?auto_270800 ?auto_270809 ) ) ( not ( = ?auto_270800 ?auto_270810 ) ) ( not ( = ?auto_270800 ?auto_270811 ) ) ( not ( = ?auto_270801 ?auto_270802 ) ) ( not ( = ?auto_270801 ?auto_270803 ) ) ( not ( = ?auto_270801 ?auto_270804 ) ) ( not ( = ?auto_270801 ?auto_270805 ) ) ( not ( = ?auto_270801 ?auto_270806 ) ) ( not ( = ?auto_270801 ?auto_270807 ) ) ( not ( = ?auto_270801 ?auto_270808 ) ) ( not ( = ?auto_270801 ?auto_270809 ) ) ( not ( = ?auto_270801 ?auto_270810 ) ) ( not ( = ?auto_270801 ?auto_270811 ) ) ( not ( = ?auto_270802 ?auto_270803 ) ) ( not ( = ?auto_270802 ?auto_270804 ) ) ( not ( = ?auto_270802 ?auto_270805 ) ) ( not ( = ?auto_270802 ?auto_270806 ) ) ( not ( = ?auto_270802 ?auto_270807 ) ) ( not ( = ?auto_270802 ?auto_270808 ) ) ( not ( = ?auto_270802 ?auto_270809 ) ) ( not ( = ?auto_270802 ?auto_270810 ) ) ( not ( = ?auto_270802 ?auto_270811 ) ) ( not ( = ?auto_270803 ?auto_270804 ) ) ( not ( = ?auto_270803 ?auto_270805 ) ) ( not ( = ?auto_270803 ?auto_270806 ) ) ( not ( = ?auto_270803 ?auto_270807 ) ) ( not ( = ?auto_270803 ?auto_270808 ) ) ( not ( = ?auto_270803 ?auto_270809 ) ) ( not ( = ?auto_270803 ?auto_270810 ) ) ( not ( = ?auto_270803 ?auto_270811 ) ) ( not ( = ?auto_270804 ?auto_270805 ) ) ( not ( = ?auto_270804 ?auto_270806 ) ) ( not ( = ?auto_270804 ?auto_270807 ) ) ( not ( = ?auto_270804 ?auto_270808 ) ) ( not ( = ?auto_270804 ?auto_270809 ) ) ( not ( = ?auto_270804 ?auto_270810 ) ) ( not ( = ?auto_270804 ?auto_270811 ) ) ( not ( = ?auto_270805 ?auto_270806 ) ) ( not ( = ?auto_270805 ?auto_270807 ) ) ( not ( = ?auto_270805 ?auto_270808 ) ) ( not ( = ?auto_270805 ?auto_270809 ) ) ( not ( = ?auto_270805 ?auto_270810 ) ) ( not ( = ?auto_270805 ?auto_270811 ) ) ( not ( = ?auto_270806 ?auto_270807 ) ) ( not ( = ?auto_270806 ?auto_270808 ) ) ( not ( = ?auto_270806 ?auto_270809 ) ) ( not ( = ?auto_270806 ?auto_270810 ) ) ( not ( = ?auto_270806 ?auto_270811 ) ) ( not ( = ?auto_270807 ?auto_270808 ) ) ( not ( = ?auto_270807 ?auto_270809 ) ) ( not ( = ?auto_270807 ?auto_270810 ) ) ( not ( = ?auto_270807 ?auto_270811 ) ) ( not ( = ?auto_270808 ?auto_270809 ) ) ( not ( = ?auto_270808 ?auto_270810 ) ) ( not ( = ?auto_270808 ?auto_270811 ) ) ( not ( = ?auto_270809 ?auto_270810 ) ) ( not ( = ?auto_270809 ?auto_270811 ) ) ( not ( = ?auto_270810 ?auto_270811 ) ) ( CLEAR ?auto_270808 ) ( ON ?auto_270809 ?auto_270810 ) ( CLEAR ?auto_270809 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_270798 ?auto_270799 ?auto_270800 ?auto_270801 ?auto_270802 ?auto_270803 ?auto_270804 ?auto_270805 ?auto_270806 ?auto_270807 ?auto_270808 ?auto_270809 )
      ( MAKE-13PILE ?auto_270798 ?auto_270799 ?auto_270800 ?auto_270801 ?auto_270802 ?auto_270803 ?auto_270804 ?auto_270805 ?auto_270806 ?auto_270807 ?auto_270808 ?auto_270809 ?auto_270810 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_270825 - BLOCK
      ?auto_270826 - BLOCK
      ?auto_270827 - BLOCK
      ?auto_270828 - BLOCK
      ?auto_270829 - BLOCK
      ?auto_270830 - BLOCK
      ?auto_270831 - BLOCK
      ?auto_270832 - BLOCK
      ?auto_270833 - BLOCK
      ?auto_270834 - BLOCK
      ?auto_270835 - BLOCK
      ?auto_270836 - BLOCK
      ?auto_270837 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_270837 ) ( ON-TABLE ?auto_270825 ) ( ON ?auto_270826 ?auto_270825 ) ( ON ?auto_270827 ?auto_270826 ) ( ON ?auto_270828 ?auto_270827 ) ( ON ?auto_270829 ?auto_270828 ) ( ON ?auto_270830 ?auto_270829 ) ( ON ?auto_270831 ?auto_270830 ) ( ON ?auto_270832 ?auto_270831 ) ( ON ?auto_270833 ?auto_270832 ) ( ON ?auto_270834 ?auto_270833 ) ( ON ?auto_270835 ?auto_270834 ) ( not ( = ?auto_270825 ?auto_270826 ) ) ( not ( = ?auto_270825 ?auto_270827 ) ) ( not ( = ?auto_270825 ?auto_270828 ) ) ( not ( = ?auto_270825 ?auto_270829 ) ) ( not ( = ?auto_270825 ?auto_270830 ) ) ( not ( = ?auto_270825 ?auto_270831 ) ) ( not ( = ?auto_270825 ?auto_270832 ) ) ( not ( = ?auto_270825 ?auto_270833 ) ) ( not ( = ?auto_270825 ?auto_270834 ) ) ( not ( = ?auto_270825 ?auto_270835 ) ) ( not ( = ?auto_270825 ?auto_270836 ) ) ( not ( = ?auto_270825 ?auto_270837 ) ) ( not ( = ?auto_270826 ?auto_270827 ) ) ( not ( = ?auto_270826 ?auto_270828 ) ) ( not ( = ?auto_270826 ?auto_270829 ) ) ( not ( = ?auto_270826 ?auto_270830 ) ) ( not ( = ?auto_270826 ?auto_270831 ) ) ( not ( = ?auto_270826 ?auto_270832 ) ) ( not ( = ?auto_270826 ?auto_270833 ) ) ( not ( = ?auto_270826 ?auto_270834 ) ) ( not ( = ?auto_270826 ?auto_270835 ) ) ( not ( = ?auto_270826 ?auto_270836 ) ) ( not ( = ?auto_270826 ?auto_270837 ) ) ( not ( = ?auto_270827 ?auto_270828 ) ) ( not ( = ?auto_270827 ?auto_270829 ) ) ( not ( = ?auto_270827 ?auto_270830 ) ) ( not ( = ?auto_270827 ?auto_270831 ) ) ( not ( = ?auto_270827 ?auto_270832 ) ) ( not ( = ?auto_270827 ?auto_270833 ) ) ( not ( = ?auto_270827 ?auto_270834 ) ) ( not ( = ?auto_270827 ?auto_270835 ) ) ( not ( = ?auto_270827 ?auto_270836 ) ) ( not ( = ?auto_270827 ?auto_270837 ) ) ( not ( = ?auto_270828 ?auto_270829 ) ) ( not ( = ?auto_270828 ?auto_270830 ) ) ( not ( = ?auto_270828 ?auto_270831 ) ) ( not ( = ?auto_270828 ?auto_270832 ) ) ( not ( = ?auto_270828 ?auto_270833 ) ) ( not ( = ?auto_270828 ?auto_270834 ) ) ( not ( = ?auto_270828 ?auto_270835 ) ) ( not ( = ?auto_270828 ?auto_270836 ) ) ( not ( = ?auto_270828 ?auto_270837 ) ) ( not ( = ?auto_270829 ?auto_270830 ) ) ( not ( = ?auto_270829 ?auto_270831 ) ) ( not ( = ?auto_270829 ?auto_270832 ) ) ( not ( = ?auto_270829 ?auto_270833 ) ) ( not ( = ?auto_270829 ?auto_270834 ) ) ( not ( = ?auto_270829 ?auto_270835 ) ) ( not ( = ?auto_270829 ?auto_270836 ) ) ( not ( = ?auto_270829 ?auto_270837 ) ) ( not ( = ?auto_270830 ?auto_270831 ) ) ( not ( = ?auto_270830 ?auto_270832 ) ) ( not ( = ?auto_270830 ?auto_270833 ) ) ( not ( = ?auto_270830 ?auto_270834 ) ) ( not ( = ?auto_270830 ?auto_270835 ) ) ( not ( = ?auto_270830 ?auto_270836 ) ) ( not ( = ?auto_270830 ?auto_270837 ) ) ( not ( = ?auto_270831 ?auto_270832 ) ) ( not ( = ?auto_270831 ?auto_270833 ) ) ( not ( = ?auto_270831 ?auto_270834 ) ) ( not ( = ?auto_270831 ?auto_270835 ) ) ( not ( = ?auto_270831 ?auto_270836 ) ) ( not ( = ?auto_270831 ?auto_270837 ) ) ( not ( = ?auto_270832 ?auto_270833 ) ) ( not ( = ?auto_270832 ?auto_270834 ) ) ( not ( = ?auto_270832 ?auto_270835 ) ) ( not ( = ?auto_270832 ?auto_270836 ) ) ( not ( = ?auto_270832 ?auto_270837 ) ) ( not ( = ?auto_270833 ?auto_270834 ) ) ( not ( = ?auto_270833 ?auto_270835 ) ) ( not ( = ?auto_270833 ?auto_270836 ) ) ( not ( = ?auto_270833 ?auto_270837 ) ) ( not ( = ?auto_270834 ?auto_270835 ) ) ( not ( = ?auto_270834 ?auto_270836 ) ) ( not ( = ?auto_270834 ?auto_270837 ) ) ( not ( = ?auto_270835 ?auto_270836 ) ) ( not ( = ?auto_270835 ?auto_270837 ) ) ( not ( = ?auto_270836 ?auto_270837 ) ) ( CLEAR ?auto_270835 ) ( ON ?auto_270836 ?auto_270837 ) ( CLEAR ?auto_270836 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_270825 ?auto_270826 ?auto_270827 ?auto_270828 ?auto_270829 ?auto_270830 ?auto_270831 ?auto_270832 ?auto_270833 ?auto_270834 ?auto_270835 ?auto_270836 )
      ( MAKE-13PILE ?auto_270825 ?auto_270826 ?auto_270827 ?auto_270828 ?auto_270829 ?auto_270830 ?auto_270831 ?auto_270832 ?auto_270833 ?auto_270834 ?auto_270835 ?auto_270836 ?auto_270837 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_270851 - BLOCK
      ?auto_270852 - BLOCK
      ?auto_270853 - BLOCK
      ?auto_270854 - BLOCK
      ?auto_270855 - BLOCK
      ?auto_270856 - BLOCK
      ?auto_270857 - BLOCK
      ?auto_270858 - BLOCK
      ?auto_270859 - BLOCK
      ?auto_270860 - BLOCK
      ?auto_270861 - BLOCK
      ?auto_270862 - BLOCK
      ?auto_270863 - BLOCK
    )
    :vars
    (
      ?auto_270864 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_270863 ?auto_270864 ) ( ON-TABLE ?auto_270851 ) ( ON ?auto_270852 ?auto_270851 ) ( ON ?auto_270853 ?auto_270852 ) ( ON ?auto_270854 ?auto_270853 ) ( ON ?auto_270855 ?auto_270854 ) ( ON ?auto_270856 ?auto_270855 ) ( ON ?auto_270857 ?auto_270856 ) ( ON ?auto_270858 ?auto_270857 ) ( ON ?auto_270859 ?auto_270858 ) ( ON ?auto_270860 ?auto_270859 ) ( not ( = ?auto_270851 ?auto_270852 ) ) ( not ( = ?auto_270851 ?auto_270853 ) ) ( not ( = ?auto_270851 ?auto_270854 ) ) ( not ( = ?auto_270851 ?auto_270855 ) ) ( not ( = ?auto_270851 ?auto_270856 ) ) ( not ( = ?auto_270851 ?auto_270857 ) ) ( not ( = ?auto_270851 ?auto_270858 ) ) ( not ( = ?auto_270851 ?auto_270859 ) ) ( not ( = ?auto_270851 ?auto_270860 ) ) ( not ( = ?auto_270851 ?auto_270861 ) ) ( not ( = ?auto_270851 ?auto_270862 ) ) ( not ( = ?auto_270851 ?auto_270863 ) ) ( not ( = ?auto_270851 ?auto_270864 ) ) ( not ( = ?auto_270852 ?auto_270853 ) ) ( not ( = ?auto_270852 ?auto_270854 ) ) ( not ( = ?auto_270852 ?auto_270855 ) ) ( not ( = ?auto_270852 ?auto_270856 ) ) ( not ( = ?auto_270852 ?auto_270857 ) ) ( not ( = ?auto_270852 ?auto_270858 ) ) ( not ( = ?auto_270852 ?auto_270859 ) ) ( not ( = ?auto_270852 ?auto_270860 ) ) ( not ( = ?auto_270852 ?auto_270861 ) ) ( not ( = ?auto_270852 ?auto_270862 ) ) ( not ( = ?auto_270852 ?auto_270863 ) ) ( not ( = ?auto_270852 ?auto_270864 ) ) ( not ( = ?auto_270853 ?auto_270854 ) ) ( not ( = ?auto_270853 ?auto_270855 ) ) ( not ( = ?auto_270853 ?auto_270856 ) ) ( not ( = ?auto_270853 ?auto_270857 ) ) ( not ( = ?auto_270853 ?auto_270858 ) ) ( not ( = ?auto_270853 ?auto_270859 ) ) ( not ( = ?auto_270853 ?auto_270860 ) ) ( not ( = ?auto_270853 ?auto_270861 ) ) ( not ( = ?auto_270853 ?auto_270862 ) ) ( not ( = ?auto_270853 ?auto_270863 ) ) ( not ( = ?auto_270853 ?auto_270864 ) ) ( not ( = ?auto_270854 ?auto_270855 ) ) ( not ( = ?auto_270854 ?auto_270856 ) ) ( not ( = ?auto_270854 ?auto_270857 ) ) ( not ( = ?auto_270854 ?auto_270858 ) ) ( not ( = ?auto_270854 ?auto_270859 ) ) ( not ( = ?auto_270854 ?auto_270860 ) ) ( not ( = ?auto_270854 ?auto_270861 ) ) ( not ( = ?auto_270854 ?auto_270862 ) ) ( not ( = ?auto_270854 ?auto_270863 ) ) ( not ( = ?auto_270854 ?auto_270864 ) ) ( not ( = ?auto_270855 ?auto_270856 ) ) ( not ( = ?auto_270855 ?auto_270857 ) ) ( not ( = ?auto_270855 ?auto_270858 ) ) ( not ( = ?auto_270855 ?auto_270859 ) ) ( not ( = ?auto_270855 ?auto_270860 ) ) ( not ( = ?auto_270855 ?auto_270861 ) ) ( not ( = ?auto_270855 ?auto_270862 ) ) ( not ( = ?auto_270855 ?auto_270863 ) ) ( not ( = ?auto_270855 ?auto_270864 ) ) ( not ( = ?auto_270856 ?auto_270857 ) ) ( not ( = ?auto_270856 ?auto_270858 ) ) ( not ( = ?auto_270856 ?auto_270859 ) ) ( not ( = ?auto_270856 ?auto_270860 ) ) ( not ( = ?auto_270856 ?auto_270861 ) ) ( not ( = ?auto_270856 ?auto_270862 ) ) ( not ( = ?auto_270856 ?auto_270863 ) ) ( not ( = ?auto_270856 ?auto_270864 ) ) ( not ( = ?auto_270857 ?auto_270858 ) ) ( not ( = ?auto_270857 ?auto_270859 ) ) ( not ( = ?auto_270857 ?auto_270860 ) ) ( not ( = ?auto_270857 ?auto_270861 ) ) ( not ( = ?auto_270857 ?auto_270862 ) ) ( not ( = ?auto_270857 ?auto_270863 ) ) ( not ( = ?auto_270857 ?auto_270864 ) ) ( not ( = ?auto_270858 ?auto_270859 ) ) ( not ( = ?auto_270858 ?auto_270860 ) ) ( not ( = ?auto_270858 ?auto_270861 ) ) ( not ( = ?auto_270858 ?auto_270862 ) ) ( not ( = ?auto_270858 ?auto_270863 ) ) ( not ( = ?auto_270858 ?auto_270864 ) ) ( not ( = ?auto_270859 ?auto_270860 ) ) ( not ( = ?auto_270859 ?auto_270861 ) ) ( not ( = ?auto_270859 ?auto_270862 ) ) ( not ( = ?auto_270859 ?auto_270863 ) ) ( not ( = ?auto_270859 ?auto_270864 ) ) ( not ( = ?auto_270860 ?auto_270861 ) ) ( not ( = ?auto_270860 ?auto_270862 ) ) ( not ( = ?auto_270860 ?auto_270863 ) ) ( not ( = ?auto_270860 ?auto_270864 ) ) ( not ( = ?auto_270861 ?auto_270862 ) ) ( not ( = ?auto_270861 ?auto_270863 ) ) ( not ( = ?auto_270861 ?auto_270864 ) ) ( not ( = ?auto_270862 ?auto_270863 ) ) ( not ( = ?auto_270862 ?auto_270864 ) ) ( not ( = ?auto_270863 ?auto_270864 ) ) ( ON ?auto_270862 ?auto_270863 ) ( CLEAR ?auto_270860 ) ( ON ?auto_270861 ?auto_270862 ) ( CLEAR ?auto_270861 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_270851 ?auto_270852 ?auto_270853 ?auto_270854 ?auto_270855 ?auto_270856 ?auto_270857 ?auto_270858 ?auto_270859 ?auto_270860 ?auto_270861 )
      ( MAKE-13PILE ?auto_270851 ?auto_270852 ?auto_270853 ?auto_270854 ?auto_270855 ?auto_270856 ?auto_270857 ?auto_270858 ?auto_270859 ?auto_270860 ?auto_270861 ?auto_270862 ?auto_270863 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_270878 - BLOCK
      ?auto_270879 - BLOCK
      ?auto_270880 - BLOCK
      ?auto_270881 - BLOCK
      ?auto_270882 - BLOCK
      ?auto_270883 - BLOCK
      ?auto_270884 - BLOCK
      ?auto_270885 - BLOCK
      ?auto_270886 - BLOCK
      ?auto_270887 - BLOCK
      ?auto_270888 - BLOCK
      ?auto_270889 - BLOCK
      ?auto_270890 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_270890 ) ( ON-TABLE ?auto_270878 ) ( ON ?auto_270879 ?auto_270878 ) ( ON ?auto_270880 ?auto_270879 ) ( ON ?auto_270881 ?auto_270880 ) ( ON ?auto_270882 ?auto_270881 ) ( ON ?auto_270883 ?auto_270882 ) ( ON ?auto_270884 ?auto_270883 ) ( ON ?auto_270885 ?auto_270884 ) ( ON ?auto_270886 ?auto_270885 ) ( ON ?auto_270887 ?auto_270886 ) ( not ( = ?auto_270878 ?auto_270879 ) ) ( not ( = ?auto_270878 ?auto_270880 ) ) ( not ( = ?auto_270878 ?auto_270881 ) ) ( not ( = ?auto_270878 ?auto_270882 ) ) ( not ( = ?auto_270878 ?auto_270883 ) ) ( not ( = ?auto_270878 ?auto_270884 ) ) ( not ( = ?auto_270878 ?auto_270885 ) ) ( not ( = ?auto_270878 ?auto_270886 ) ) ( not ( = ?auto_270878 ?auto_270887 ) ) ( not ( = ?auto_270878 ?auto_270888 ) ) ( not ( = ?auto_270878 ?auto_270889 ) ) ( not ( = ?auto_270878 ?auto_270890 ) ) ( not ( = ?auto_270879 ?auto_270880 ) ) ( not ( = ?auto_270879 ?auto_270881 ) ) ( not ( = ?auto_270879 ?auto_270882 ) ) ( not ( = ?auto_270879 ?auto_270883 ) ) ( not ( = ?auto_270879 ?auto_270884 ) ) ( not ( = ?auto_270879 ?auto_270885 ) ) ( not ( = ?auto_270879 ?auto_270886 ) ) ( not ( = ?auto_270879 ?auto_270887 ) ) ( not ( = ?auto_270879 ?auto_270888 ) ) ( not ( = ?auto_270879 ?auto_270889 ) ) ( not ( = ?auto_270879 ?auto_270890 ) ) ( not ( = ?auto_270880 ?auto_270881 ) ) ( not ( = ?auto_270880 ?auto_270882 ) ) ( not ( = ?auto_270880 ?auto_270883 ) ) ( not ( = ?auto_270880 ?auto_270884 ) ) ( not ( = ?auto_270880 ?auto_270885 ) ) ( not ( = ?auto_270880 ?auto_270886 ) ) ( not ( = ?auto_270880 ?auto_270887 ) ) ( not ( = ?auto_270880 ?auto_270888 ) ) ( not ( = ?auto_270880 ?auto_270889 ) ) ( not ( = ?auto_270880 ?auto_270890 ) ) ( not ( = ?auto_270881 ?auto_270882 ) ) ( not ( = ?auto_270881 ?auto_270883 ) ) ( not ( = ?auto_270881 ?auto_270884 ) ) ( not ( = ?auto_270881 ?auto_270885 ) ) ( not ( = ?auto_270881 ?auto_270886 ) ) ( not ( = ?auto_270881 ?auto_270887 ) ) ( not ( = ?auto_270881 ?auto_270888 ) ) ( not ( = ?auto_270881 ?auto_270889 ) ) ( not ( = ?auto_270881 ?auto_270890 ) ) ( not ( = ?auto_270882 ?auto_270883 ) ) ( not ( = ?auto_270882 ?auto_270884 ) ) ( not ( = ?auto_270882 ?auto_270885 ) ) ( not ( = ?auto_270882 ?auto_270886 ) ) ( not ( = ?auto_270882 ?auto_270887 ) ) ( not ( = ?auto_270882 ?auto_270888 ) ) ( not ( = ?auto_270882 ?auto_270889 ) ) ( not ( = ?auto_270882 ?auto_270890 ) ) ( not ( = ?auto_270883 ?auto_270884 ) ) ( not ( = ?auto_270883 ?auto_270885 ) ) ( not ( = ?auto_270883 ?auto_270886 ) ) ( not ( = ?auto_270883 ?auto_270887 ) ) ( not ( = ?auto_270883 ?auto_270888 ) ) ( not ( = ?auto_270883 ?auto_270889 ) ) ( not ( = ?auto_270883 ?auto_270890 ) ) ( not ( = ?auto_270884 ?auto_270885 ) ) ( not ( = ?auto_270884 ?auto_270886 ) ) ( not ( = ?auto_270884 ?auto_270887 ) ) ( not ( = ?auto_270884 ?auto_270888 ) ) ( not ( = ?auto_270884 ?auto_270889 ) ) ( not ( = ?auto_270884 ?auto_270890 ) ) ( not ( = ?auto_270885 ?auto_270886 ) ) ( not ( = ?auto_270885 ?auto_270887 ) ) ( not ( = ?auto_270885 ?auto_270888 ) ) ( not ( = ?auto_270885 ?auto_270889 ) ) ( not ( = ?auto_270885 ?auto_270890 ) ) ( not ( = ?auto_270886 ?auto_270887 ) ) ( not ( = ?auto_270886 ?auto_270888 ) ) ( not ( = ?auto_270886 ?auto_270889 ) ) ( not ( = ?auto_270886 ?auto_270890 ) ) ( not ( = ?auto_270887 ?auto_270888 ) ) ( not ( = ?auto_270887 ?auto_270889 ) ) ( not ( = ?auto_270887 ?auto_270890 ) ) ( not ( = ?auto_270888 ?auto_270889 ) ) ( not ( = ?auto_270888 ?auto_270890 ) ) ( not ( = ?auto_270889 ?auto_270890 ) ) ( ON ?auto_270889 ?auto_270890 ) ( CLEAR ?auto_270887 ) ( ON ?auto_270888 ?auto_270889 ) ( CLEAR ?auto_270888 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_270878 ?auto_270879 ?auto_270880 ?auto_270881 ?auto_270882 ?auto_270883 ?auto_270884 ?auto_270885 ?auto_270886 ?auto_270887 ?auto_270888 )
      ( MAKE-13PILE ?auto_270878 ?auto_270879 ?auto_270880 ?auto_270881 ?auto_270882 ?auto_270883 ?auto_270884 ?auto_270885 ?auto_270886 ?auto_270887 ?auto_270888 ?auto_270889 ?auto_270890 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_270904 - BLOCK
      ?auto_270905 - BLOCK
      ?auto_270906 - BLOCK
      ?auto_270907 - BLOCK
      ?auto_270908 - BLOCK
      ?auto_270909 - BLOCK
      ?auto_270910 - BLOCK
      ?auto_270911 - BLOCK
      ?auto_270912 - BLOCK
      ?auto_270913 - BLOCK
      ?auto_270914 - BLOCK
      ?auto_270915 - BLOCK
      ?auto_270916 - BLOCK
    )
    :vars
    (
      ?auto_270917 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_270916 ?auto_270917 ) ( ON-TABLE ?auto_270904 ) ( ON ?auto_270905 ?auto_270904 ) ( ON ?auto_270906 ?auto_270905 ) ( ON ?auto_270907 ?auto_270906 ) ( ON ?auto_270908 ?auto_270907 ) ( ON ?auto_270909 ?auto_270908 ) ( ON ?auto_270910 ?auto_270909 ) ( ON ?auto_270911 ?auto_270910 ) ( ON ?auto_270912 ?auto_270911 ) ( not ( = ?auto_270904 ?auto_270905 ) ) ( not ( = ?auto_270904 ?auto_270906 ) ) ( not ( = ?auto_270904 ?auto_270907 ) ) ( not ( = ?auto_270904 ?auto_270908 ) ) ( not ( = ?auto_270904 ?auto_270909 ) ) ( not ( = ?auto_270904 ?auto_270910 ) ) ( not ( = ?auto_270904 ?auto_270911 ) ) ( not ( = ?auto_270904 ?auto_270912 ) ) ( not ( = ?auto_270904 ?auto_270913 ) ) ( not ( = ?auto_270904 ?auto_270914 ) ) ( not ( = ?auto_270904 ?auto_270915 ) ) ( not ( = ?auto_270904 ?auto_270916 ) ) ( not ( = ?auto_270904 ?auto_270917 ) ) ( not ( = ?auto_270905 ?auto_270906 ) ) ( not ( = ?auto_270905 ?auto_270907 ) ) ( not ( = ?auto_270905 ?auto_270908 ) ) ( not ( = ?auto_270905 ?auto_270909 ) ) ( not ( = ?auto_270905 ?auto_270910 ) ) ( not ( = ?auto_270905 ?auto_270911 ) ) ( not ( = ?auto_270905 ?auto_270912 ) ) ( not ( = ?auto_270905 ?auto_270913 ) ) ( not ( = ?auto_270905 ?auto_270914 ) ) ( not ( = ?auto_270905 ?auto_270915 ) ) ( not ( = ?auto_270905 ?auto_270916 ) ) ( not ( = ?auto_270905 ?auto_270917 ) ) ( not ( = ?auto_270906 ?auto_270907 ) ) ( not ( = ?auto_270906 ?auto_270908 ) ) ( not ( = ?auto_270906 ?auto_270909 ) ) ( not ( = ?auto_270906 ?auto_270910 ) ) ( not ( = ?auto_270906 ?auto_270911 ) ) ( not ( = ?auto_270906 ?auto_270912 ) ) ( not ( = ?auto_270906 ?auto_270913 ) ) ( not ( = ?auto_270906 ?auto_270914 ) ) ( not ( = ?auto_270906 ?auto_270915 ) ) ( not ( = ?auto_270906 ?auto_270916 ) ) ( not ( = ?auto_270906 ?auto_270917 ) ) ( not ( = ?auto_270907 ?auto_270908 ) ) ( not ( = ?auto_270907 ?auto_270909 ) ) ( not ( = ?auto_270907 ?auto_270910 ) ) ( not ( = ?auto_270907 ?auto_270911 ) ) ( not ( = ?auto_270907 ?auto_270912 ) ) ( not ( = ?auto_270907 ?auto_270913 ) ) ( not ( = ?auto_270907 ?auto_270914 ) ) ( not ( = ?auto_270907 ?auto_270915 ) ) ( not ( = ?auto_270907 ?auto_270916 ) ) ( not ( = ?auto_270907 ?auto_270917 ) ) ( not ( = ?auto_270908 ?auto_270909 ) ) ( not ( = ?auto_270908 ?auto_270910 ) ) ( not ( = ?auto_270908 ?auto_270911 ) ) ( not ( = ?auto_270908 ?auto_270912 ) ) ( not ( = ?auto_270908 ?auto_270913 ) ) ( not ( = ?auto_270908 ?auto_270914 ) ) ( not ( = ?auto_270908 ?auto_270915 ) ) ( not ( = ?auto_270908 ?auto_270916 ) ) ( not ( = ?auto_270908 ?auto_270917 ) ) ( not ( = ?auto_270909 ?auto_270910 ) ) ( not ( = ?auto_270909 ?auto_270911 ) ) ( not ( = ?auto_270909 ?auto_270912 ) ) ( not ( = ?auto_270909 ?auto_270913 ) ) ( not ( = ?auto_270909 ?auto_270914 ) ) ( not ( = ?auto_270909 ?auto_270915 ) ) ( not ( = ?auto_270909 ?auto_270916 ) ) ( not ( = ?auto_270909 ?auto_270917 ) ) ( not ( = ?auto_270910 ?auto_270911 ) ) ( not ( = ?auto_270910 ?auto_270912 ) ) ( not ( = ?auto_270910 ?auto_270913 ) ) ( not ( = ?auto_270910 ?auto_270914 ) ) ( not ( = ?auto_270910 ?auto_270915 ) ) ( not ( = ?auto_270910 ?auto_270916 ) ) ( not ( = ?auto_270910 ?auto_270917 ) ) ( not ( = ?auto_270911 ?auto_270912 ) ) ( not ( = ?auto_270911 ?auto_270913 ) ) ( not ( = ?auto_270911 ?auto_270914 ) ) ( not ( = ?auto_270911 ?auto_270915 ) ) ( not ( = ?auto_270911 ?auto_270916 ) ) ( not ( = ?auto_270911 ?auto_270917 ) ) ( not ( = ?auto_270912 ?auto_270913 ) ) ( not ( = ?auto_270912 ?auto_270914 ) ) ( not ( = ?auto_270912 ?auto_270915 ) ) ( not ( = ?auto_270912 ?auto_270916 ) ) ( not ( = ?auto_270912 ?auto_270917 ) ) ( not ( = ?auto_270913 ?auto_270914 ) ) ( not ( = ?auto_270913 ?auto_270915 ) ) ( not ( = ?auto_270913 ?auto_270916 ) ) ( not ( = ?auto_270913 ?auto_270917 ) ) ( not ( = ?auto_270914 ?auto_270915 ) ) ( not ( = ?auto_270914 ?auto_270916 ) ) ( not ( = ?auto_270914 ?auto_270917 ) ) ( not ( = ?auto_270915 ?auto_270916 ) ) ( not ( = ?auto_270915 ?auto_270917 ) ) ( not ( = ?auto_270916 ?auto_270917 ) ) ( ON ?auto_270915 ?auto_270916 ) ( ON ?auto_270914 ?auto_270915 ) ( CLEAR ?auto_270912 ) ( ON ?auto_270913 ?auto_270914 ) ( CLEAR ?auto_270913 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_270904 ?auto_270905 ?auto_270906 ?auto_270907 ?auto_270908 ?auto_270909 ?auto_270910 ?auto_270911 ?auto_270912 ?auto_270913 )
      ( MAKE-13PILE ?auto_270904 ?auto_270905 ?auto_270906 ?auto_270907 ?auto_270908 ?auto_270909 ?auto_270910 ?auto_270911 ?auto_270912 ?auto_270913 ?auto_270914 ?auto_270915 ?auto_270916 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_270931 - BLOCK
      ?auto_270932 - BLOCK
      ?auto_270933 - BLOCK
      ?auto_270934 - BLOCK
      ?auto_270935 - BLOCK
      ?auto_270936 - BLOCK
      ?auto_270937 - BLOCK
      ?auto_270938 - BLOCK
      ?auto_270939 - BLOCK
      ?auto_270940 - BLOCK
      ?auto_270941 - BLOCK
      ?auto_270942 - BLOCK
      ?auto_270943 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_270943 ) ( ON-TABLE ?auto_270931 ) ( ON ?auto_270932 ?auto_270931 ) ( ON ?auto_270933 ?auto_270932 ) ( ON ?auto_270934 ?auto_270933 ) ( ON ?auto_270935 ?auto_270934 ) ( ON ?auto_270936 ?auto_270935 ) ( ON ?auto_270937 ?auto_270936 ) ( ON ?auto_270938 ?auto_270937 ) ( ON ?auto_270939 ?auto_270938 ) ( not ( = ?auto_270931 ?auto_270932 ) ) ( not ( = ?auto_270931 ?auto_270933 ) ) ( not ( = ?auto_270931 ?auto_270934 ) ) ( not ( = ?auto_270931 ?auto_270935 ) ) ( not ( = ?auto_270931 ?auto_270936 ) ) ( not ( = ?auto_270931 ?auto_270937 ) ) ( not ( = ?auto_270931 ?auto_270938 ) ) ( not ( = ?auto_270931 ?auto_270939 ) ) ( not ( = ?auto_270931 ?auto_270940 ) ) ( not ( = ?auto_270931 ?auto_270941 ) ) ( not ( = ?auto_270931 ?auto_270942 ) ) ( not ( = ?auto_270931 ?auto_270943 ) ) ( not ( = ?auto_270932 ?auto_270933 ) ) ( not ( = ?auto_270932 ?auto_270934 ) ) ( not ( = ?auto_270932 ?auto_270935 ) ) ( not ( = ?auto_270932 ?auto_270936 ) ) ( not ( = ?auto_270932 ?auto_270937 ) ) ( not ( = ?auto_270932 ?auto_270938 ) ) ( not ( = ?auto_270932 ?auto_270939 ) ) ( not ( = ?auto_270932 ?auto_270940 ) ) ( not ( = ?auto_270932 ?auto_270941 ) ) ( not ( = ?auto_270932 ?auto_270942 ) ) ( not ( = ?auto_270932 ?auto_270943 ) ) ( not ( = ?auto_270933 ?auto_270934 ) ) ( not ( = ?auto_270933 ?auto_270935 ) ) ( not ( = ?auto_270933 ?auto_270936 ) ) ( not ( = ?auto_270933 ?auto_270937 ) ) ( not ( = ?auto_270933 ?auto_270938 ) ) ( not ( = ?auto_270933 ?auto_270939 ) ) ( not ( = ?auto_270933 ?auto_270940 ) ) ( not ( = ?auto_270933 ?auto_270941 ) ) ( not ( = ?auto_270933 ?auto_270942 ) ) ( not ( = ?auto_270933 ?auto_270943 ) ) ( not ( = ?auto_270934 ?auto_270935 ) ) ( not ( = ?auto_270934 ?auto_270936 ) ) ( not ( = ?auto_270934 ?auto_270937 ) ) ( not ( = ?auto_270934 ?auto_270938 ) ) ( not ( = ?auto_270934 ?auto_270939 ) ) ( not ( = ?auto_270934 ?auto_270940 ) ) ( not ( = ?auto_270934 ?auto_270941 ) ) ( not ( = ?auto_270934 ?auto_270942 ) ) ( not ( = ?auto_270934 ?auto_270943 ) ) ( not ( = ?auto_270935 ?auto_270936 ) ) ( not ( = ?auto_270935 ?auto_270937 ) ) ( not ( = ?auto_270935 ?auto_270938 ) ) ( not ( = ?auto_270935 ?auto_270939 ) ) ( not ( = ?auto_270935 ?auto_270940 ) ) ( not ( = ?auto_270935 ?auto_270941 ) ) ( not ( = ?auto_270935 ?auto_270942 ) ) ( not ( = ?auto_270935 ?auto_270943 ) ) ( not ( = ?auto_270936 ?auto_270937 ) ) ( not ( = ?auto_270936 ?auto_270938 ) ) ( not ( = ?auto_270936 ?auto_270939 ) ) ( not ( = ?auto_270936 ?auto_270940 ) ) ( not ( = ?auto_270936 ?auto_270941 ) ) ( not ( = ?auto_270936 ?auto_270942 ) ) ( not ( = ?auto_270936 ?auto_270943 ) ) ( not ( = ?auto_270937 ?auto_270938 ) ) ( not ( = ?auto_270937 ?auto_270939 ) ) ( not ( = ?auto_270937 ?auto_270940 ) ) ( not ( = ?auto_270937 ?auto_270941 ) ) ( not ( = ?auto_270937 ?auto_270942 ) ) ( not ( = ?auto_270937 ?auto_270943 ) ) ( not ( = ?auto_270938 ?auto_270939 ) ) ( not ( = ?auto_270938 ?auto_270940 ) ) ( not ( = ?auto_270938 ?auto_270941 ) ) ( not ( = ?auto_270938 ?auto_270942 ) ) ( not ( = ?auto_270938 ?auto_270943 ) ) ( not ( = ?auto_270939 ?auto_270940 ) ) ( not ( = ?auto_270939 ?auto_270941 ) ) ( not ( = ?auto_270939 ?auto_270942 ) ) ( not ( = ?auto_270939 ?auto_270943 ) ) ( not ( = ?auto_270940 ?auto_270941 ) ) ( not ( = ?auto_270940 ?auto_270942 ) ) ( not ( = ?auto_270940 ?auto_270943 ) ) ( not ( = ?auto_270941 ?auto_270942 ) ) ( not ( = ?auto_270941 ?auto_270943 ) ) ( not ( = ?auto_270942 ?auto_270943 ) ) ( ON ?auto_270942 ?auto_270943 ) ( ON ?auto_270941 ?auto_270942 ) ( CLEAR ?auto_270939 ) ( ON ?auto_270940 ?auto_270941 ) ( CLEAR ?auto_270940 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_270931 ?auto_270932 ?auto_270933 ?auto_270934 ?auto_270935 ?auto_270936 ?auto_270937 ?auto_270938 ?auto_270939 ?auto_270940 )
      ( MAKE-13PILE ?auto_270931 ?auto_270932 ?auto_270933 ?auto_270934 ?auto_270935 ?auto_270936 ?auto_270937 ?auto_270938 ?auto_270939 ?auto_270940 ?auto_270941 ?auto_270942 ?auto_270943 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_270957 - BLOCK
      ?auto_270958 - BLOCK
      ?auto_270959 - BLOCK
      ?auto_270960 - BLOCK
      ?auto_270961 - BLOCK
      ?auto_270962 - BLOCK
      ?auto_270963 - BLOCK
      ?auto_270964 - BLOCK
      ?auto_270965 - BLOCK
      ?auto_270966 - BLOCK
      ?auto_270967 - BLOCK
      ?auto_270968 - BLOCK
      ?auto_270969 - BLOCK
    )
    :vars
    (
      ?auto_270970 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_270969 ?auto_270970 ) ( ON-TABLE ?auto_270957 ) ( ON ?auto_270958 ?auto_270957 ) ( ON ?auto_270959 ?auto_270958 ) ( ON ?auto_270960 ?auto_270959 ) ( ON ?auto_270961 ?auto_270960 ) ( ON ?auto_270962 ?auto_270961 ) ( ON ?auto_270963 ?auto_270962 ) ( ON ?auto_270964 ?auto_270963 ) ( not ( = ?auto_270957 ?auto_270958 ) ) ( not ( = ?auto_270957 ?auto_270959 ) ) ( not ( = ?auto_270957 ?auto_270960 ) ) ( not ( = ?auto_270957 ?auto_270961 ) ) ( not ( = ?auto_270957 ?auto_270962 ) ) ( not ( = ?auto_270957 ?auto_270963 ) ) ( not ( = ?auto_270957 ?auto_270964 ) ) ( not ( = ?auto_270957 ?auto_270965 ) ) ( not ( = ?auto_270957 ?auto_270966 ) ) ( not ( = ?auto_270957 ?auto_270967 ) ) ( not ( = ?auto_270957 ?auto_270968 ) ) ( not ( = ?auto_270957 ?auto_270969 ) ) ( not ( = ?auto_270957 ?auto_270970 ) ) ( not ( = ?auto_270958 ?auto_270959 ) ) ( not ( = ?auto_270958 ?auto_270960 ) ) ( not ( = ?auto_270958 ?auto_270961 ) ) ( not ( = ?auto_270958 ?auto_270962 ) ) ( not ( = ?auto_270958 ?auto_270963 ) ) ( not ( = ?auto_270958 ?auto_270964 ) ) ( not ( = ?auto_270958 ?auto_270965 ) ) ( not ( = ?auto_270958 ?auto_270966 ) ) ( not ( = ?auto_270958 ?auto_270967 ) ) ( not ( = ?auto_270958 ?auto_270968 ) ) ( not ( = ?auto_270958 ?auto_270969 ) ) ( not ( = ?auto_270958 ?auto_270970 ) ) ( not ( = ?auto_270959 ?auto_270960 ) ) ( not ( = ?auto_270959 ?auto_270961 ) ) ( not ( = ?auto_270959 ?auto_270962 ) ) ( not ( = ?auto_270959 ?auto_270963 ) ) ( not ( = ?auto_270959 ?auto_270964 ) ) ( not ( = ?auto_270959 ?auto_270965 ) ) ( not ( = ?auto_270959 ?auto_270966 ) ) ( not ( = ?auto_270959 ?auto_270967 ) ) ( not ( = ?auto_270959 ?auto_270968 ) ) ( not ( = ?auto_270959 ?auto_270969 ) ) ( not ( = ?auto_270959 ?auto_270970 ) ) ( not ( = ?auto_270960 ?auto_270961 ) ) ( not ( = ?auto_270960 ?auto_270962 ) ) ( not ( = ?auto_270960 ?auto_270963 ) ) ( not ( = ?auto_270960 ?auto_270964 ) ) ( not ( = ?auto_270960 ?auto_270965 ) ) ( not ( = ?auto_270960 ?auto_270966 ) ) ( not ( = ?auto_270960 ?auto_270967 ) ) ( not ( = ?auto_270960 ?auto_270968 ) ) ( not ( = ?auto_270960 ?auto_270969 ) ) ( not ( = ?auto_270960 ?auto_270970 ) ) ( not ( = ?auto_270961 ?auto_270962 ) ) ( not ( = ?auto_270961 ?auto_270963 ) ) ( not ( = ?auto_270961 ?auto_270964 ) ) ( not ( = ?auto_270961 ?auto_270965 ) ) ( not ( = ?auto_270961 ?auto_270966 ) ) ( not ( = ?auto_270961 ?auto_270967 ) ) ( not ( = ?auto_270961 ?auto_270968 ) ) ( not ( = ?auto_270961 ?auto_270969 ) ) ( not ( = ?auto_270961 ?auto_270970 ) ) ( not ( = ?auto_270962 ?auto_270963 ) ) ( not ( = ?auto_270962 ?auto_270964 ) ) ( not ( = ?auto_270962 ?auto_270965 ) ) ( not ( = ?auto_270962 ?auto_270966 ) ) ( not ( = ?auto_270962 ?auto_270967 ) ) ( not ( = ?auto_270962 ?auto_270968 ) ) ( not ( = ?auto_270962 ?auto_270969 ) ) ( not ( = ?auto_270962 ?auto_270970 ) ) ( not ( = ?auto_270963 ?auto_270964 ) ) ( not ( = ?auto_270963 ?auto_270965 ) ) ( not ( = ?auto_270963 ?auto_270966 ) ) ( not ( = ?auto_270963 ?auto_270967 ) ) ( not ( = ?auto_270963 ?auto_270968 ) ) ( not ( = ?auto_270963 ?auto_270969 ) ) ( not ( = ?auto_270963 ?auto_270970 ) ) ( not ( = ?auto_270964 ?auto_270965 ) ) ( not ( = ?auto_270964 ?auto_270966 ) ) ( not ( = ?auto_270964 ?auto_270967 ) ) ( not ( = ?auto_270964 ?auto_270968 ) ) ( not ( = ?auto_270964 ?auto_270969 ) ) ( not ( = ?auto_270964 ?auto_270970 ) ) ( not ( = ?auto_270965 ?auto_270966 ) ) ( not ( = ?auto_270965 ?auto_270967 ) ) ( not ( = ?auto_270965 ?auto_270968 ) ) ( not ( = ?auto_270965 ?auto_270969 ) ) ( not ( = ?auto_270965 ?auto_270970 ) ) ( not ( = ?auto_270966 ?auto_270967 ) ) ( not ( = ?auto_270966 ?auto_270968 ) ) ( not ( = ?auto_270966 ?auto_270969 ) ) ( not ( = ?auto_270966 ?auto_270970 ) ) ( not ( = ?auto_270967 ?auto_270968 ) ) ( not ( = ?auto_270967 ?auto_270969 ) ) ( not ( = ?auto_270967 ?auto_270970 ) ) ( not ( = ?auto_270968 ?auto_270969 ) ) ( not ( = ?auto_270968 ?auto_270970 ) ) ( not ( = ?auto_270969 ?auto_270970 ) ) ( ON ?auto_270968 ?auto_270969 ) ( ON ?auto_270967 ?auto_270968 ) ( ON ?auto_270966 ?auto_270967 ) ( CLEAR ?auto_270964 ) ( ON ?auto_270965 ?auto_270966 ) ( CLEAR ?auto_270965 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_270957 ?auto_270958 ?auto_270959 ?auto_270960 ?auto_270961 ?auto_270962 ?auto_270963 ?auto_270964 ?auto_270965 )
      ( MAKE-13PILE ?auto_270957 ?auto_270958 ?auto_270959 ?auto_270960 ?auto_270961 ?auto_270962 ?auto_270963 ?auto_270964 ?auto_270965 ?auto_270966 ?auto_270967 ?auto_270968 ?auto_270969 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_270984 - BLOCK
      ?auto_270985 - BLOCK
      ?auto_270986 - BLOCK
      ?auto_270987 - BLOCK
      ?auto_270988 - BLOCK
      ?auto_270989 - BLOCK
      ?auto_270990 - BLOCK
      ?auto_270991 - BLOCK
      ?auto_270992 - BLOCK
      ?auto_270993 - BLOCK
      ?auto_270994 - BLOCK
      ?auto_270995 - BLOCK
      ?auto_270996 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_270996 ) ( ON-TABLE ?auto_270984 ) ( ON ?auto_270985 ?auto_270984 ) ( ON ?auto_270986 ?auto_270985 ) ( ON ?auto_270987 ?auto_270986 ) ( ON ?auto_270988 ?auto_270987 ) ( ON ?auto_270989 ?auto_270988 ) ( ON ?auto_270990 ?auto_270989 ) ( ON ?auto_270991 ?auto_270990 ) ( not ( = ?auto_270984 ?auto_270985 ) ) ( not ( = ?auto_270984 ?auto_270986 ) ) ( not ( = ?auto_270984 ?auto_270987 ) ) ( not ( = ?auto_270984 ?auto_270988 ) ) ( not ( = ?auto_270984 ?auto_270989 ) ) ( not ( = ?auto_270984 ?auto_270990 ) ) ( not ( = ?auto_270984 ?auto_270991 ) ) ( not ( = ?auto_270984 ?auto_270992 ) ) ( not ( = ?auto_270984 ?auto_270993 ) ) ( not ( = ?auto_270984 ?auto_270994 ) ) ( not ( = ?auto_270984 ?auto_270995 ) ) ( not ( = ?auto_270984 ?auto_270996 ) ) ( not ( = ?auto_270985 ?auto_270986 ) ) ( not ( = ?auto_270985 ?auto_270987 ) ) ( not ( = ?auto_270985 ?auto_270988 ) ) ( not ( = ?auto_270985 ?auto_270989 ) ) ( not ( = ?auto_270985 ?auto_270990 ) ) ( not ( = ?auto_270985 ?auto_270991 ) ) ( not ( = ?auto_270985 ?auto_270992 ) ) ( not ( = ?auto_270985 ?auto_270993 ) ) ( not ( = ?auto_270985 ?auto_270994 ) ) ( not ( = ?auto_270985 ?auto_270995 ) ) ( not ( = ?auto_270985 ?auto_270996 ) ) ( not ( = ?auto_270986 ?auto_270987 ) ) ( not ( = ?auto_270986 ?auto_270988 ) ) ( not ( = ?auto_270986 ?auto_270989 ) ) ( not ( = ?auto_270986 ?auto_270990 ) ) ( not ( = ?auto_270986 ?auto_270991 ) ) ( not ( = ?auto_270986 ?auto_270992 ) ) ( not ( = ?auto_270986 ?auto_270993 ) ) ( not ( = ?auto_270986 ?auto_270994 ) ) ( not ( = ?auto_270986 ?auto_270995 ) ) ( not ( = ?auto_270986 ?auto_270996 ) ) ( not ( = ?auto_270987 ?auto_270988 ) ) ( not ( = ?auto_270987 ?auto_270989 ) ) ( not ( = ?auto_270987 ?auto_270990 ) ) ( not ( = ?auto_270987 ?auto_270991 ) ) ( not ( = ?auto_270987 ?auto_270992 ) ) ( not ( = ?auto_270987 ?auto_270993 ) ) ( not ( = ?auto_270987 ?auto_270994 ) ) ( not ( = ?auto_270987 ?auto_270995 ) ) ( not ( = ?auto_270987 ?auto_270996 ) ) ( not ( = ?auto_270988 ?auto_270989 ) ) ( not ( = ?auto_270988 ?auto_270990 ) ) ( not ( = ?auto_270988 ?auto_270991 ) ) ( not ( = ?auto_270988 ?auto_270992 ) ) ( not ( = ?auto_270988 ?auto_270993 ) ) ( not ( = ?auto_270988 ?auto_270994 ) ) ( not ( = ?auto_270988 ?auto_270995 ) ) ( not ( = ?auto_270988 ?auto_270996 ) ) ( not ( = ?auto_270989 ?auto_270990 ) ) ( not ( = ?auto_270989 ?auto_270991 ) ) ( not ( = ?auto_270989 ?auto_270992 ) ) ( not ( = ?auto_270989 ?auto_270993 ) ) ( not ( = ?auto_270989 ?auto_270994 ) ) ( not ( = ?auto_270989 ?auto_270995 ) ) ( not ( = ?auto_270989 ?auto_270996 ) ) ( not ( = ?auto_270990 ?auto_270991 ) ) ( not ( = ?auto_270990 ?auto_270992 ) ) ( not ( = ?auto_270990 ?auto_270993 ) ) ( not ( = ?auto_270990 ?auto_270994 ) ) ( not ( = ?auto_270990 ?auto_270995 ) ) ( not ( = ?auto_270990 ?auto_270996 ) ) ( not ( = ?auto_270991 ?auto_270992 ) ) ( not ( = ?auto_270991 ?auto_270993 ) ) ( not ( = ?auto_270991 ?auto_270994 ) ) ( not ( = ?auto_270991 ?auto_270995 ) ) ( not ( = ?auto_270991 ?auto_270996 ) ) ( not ( = ?auto_270992 ?auto_270993 ) ) ( not ( = ?auto_270992 ?auto_270994 ) ) ( not ( = ?auto_270992 ?auto_270995 ) ) ( not ( = ?auto_270992 ?auto_270996 ) ) ( not ( = ?auto_270993 ?auto_270994 ) ) ( not ( = ?auto_270993 ?auto_270995 ) ) ( not ( = ?auto_270993 ?auto_270996 ) ) ( not ( = ?auto_270994 ?auto_270995 ) ) ( not ( = ?auto_270994 ?auto_270996 ) ) ( not ( = ?auto_270995 ?auto_270996 ) ) ( ON ?auto_270995 ?auto_270996 ) ( ON ?auto_270994 ?auto_270995 ) ( ON ?auto_270993 ?auto_270994 ) ( CLEAR ?auto_270991 ) ( ON ?auto_270992 ?auto_270993 ) ( CLEAR ?auto_270992 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_270984 ?auto_270985 ?auto_270986 ?auto_270987 ?auto_270988 ?auto_270989 ?auto_270990 ?auto_270991 ?auto_270992 )
      ( MAKE-13PILE ?auto_270984 ?auto_270985 ?auto_270986 ?auto_270987 ?auto_270988 ?auto_270989 ?auto_270990 ?auto_270991 ?auto_270992 ?auto_270993 ?auto_270994 ?auto_270995 ?auto_270996 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_271010 - BLOCK
      ?auto_271011 - BLOCK
      ?auto_271012 - BLOCK
      ?auto_271013 - BLOCK
      ?auto_271014 - BLOCK
      ?auto_271015 - BLOCK
      ?auto_271016 - BLOCK
      ?auto_271017 - BLOCK
      ?auto_271018 - BLOCK
      ?auto_271019 - BLOCK
      ?auto_271020 - BLOCK
      ?auto_271021 - BLOCK
      ?auto_271022 - BLOCK
    )
    :vars
    (
      ?auto_271023 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_271022 ?auto_271023 ) ( ON-TABLE ?auto_271010 ) ( ON ?auto_271011 ?auto_271010 ) ( ON ?auto_271012 ?auto_271011 ) ( ON ?auto_271013 ?auto_271012 ) ( ON ?auto_271014 ?auto_271013 ) ( ON ?auto_271015 ?auto_271014 ) ( ON ?auto_271016 ?auto_271015 ) ( not ( = ?auto_271010 ?auto_271011 ) ) ( not ( = ?auto_271010 ?auto_271012 ) ) ( not ( = ?auto_271010 ?auto_271013 ) ) ( not ( = ?auto_271010 ?auto_271014 ) ) ( not ( = ?auto_271010 ?auto_271015 ) ) ( not ( = ?auto_271010 ?auto_271016 ) ) ( not ( = ?auto_271010 ?auto_271017 ) ) ( not ( = ?auto_271010 ?auto_271018 ) ) ( not ( = ?auto_271010 ?auto_271019 ) ) ( not ( = ?auto_271010 ?auto_271020 ) ) ( not ( = ?auto_271010 ?auto_271021 ) ) ( not ( = ?auto_271010 ?auto_271022 ) ) ( not ( = ?auto_271010 ?auto_271023 ) ) ( not ( = ?auto_271011 ?auto_271012 ) ) ( not ( = ?auto_271011 ?auto_271013 ) ) ( not ( = ?auto_271011 ?auto_271014 ) ) ( not ( = ?auto_271011 ?auto_271015 ) ) ( not ( = ?auto_271011 ?auto_271016 ) ) ( not ( = ?auto_271011 ?auto_271017 ) ) ( not ( = ?auto_271011 ?auto_271018 ) ) ( not ( = ?auto_271011 ?auto_271019 ) ) ( not ( = ?auto_271011 ?auto_271020 ) ) ( not ( = ?auto_271011 ?auto_271021 ) ) ( not ( = ?auto_271011 ?auto_271022 ) ) ( not ( = ?auto_271011 ?auto_271023 ) ) ( not ( = ?auto_271012 ?auto_271013 ) ) ( not ( = ?auto_271012 ?auto_271014 ) ) ( not ( = ?auto_271012 ?auto_271015 ) ) ( not ( = ?auto_271012 ?auto_271016 ) ) ( not ( = ?auto_271012 ?auto_271017 ) ) ( not ( = ?auto_271012 ?auto_271018 ) ) ( not ( = ?auto_271012 ?auto_271019 ) ) ( not ( = ?auto_271012 ?auto_271020 ) ) ( not ( = ?auto_271012 ?auto_271021 ) ) ( not ( = ?auto_271012 ?auto_271022 ) ) ( not ( = ?auto_271012 ?auto_271023 ) ) ( not ( = ?auto_271013 ?auto_271014 ) ) ( not ( = ?auto_271013 ?auto_271015 ) ) ( not ( = ?auto_271013 ?auto_271016 ) ) ( not ( = ?auto_271013 ?auto_271017 ) ) ( not ( = ?auto_271013 ?auto_271018 ) ) ( not ( = ?auto_271013 ?auto_271019 ) ) ( not ( = ?auto_271013 ?auto_271020 ) ) ( not ( = ?auto_271013 ?auto_271021 ) ) ( not ( = ?auto_271013 ?auto_271022 ) ) ( not ( = ?auto_271013 ?auto_271023 ) ) ( not ( = ?auto_271014 ?auto_271015 ) ) ( not ( = ?auto_271014 ?auto_271016 ) ) ( not ( = ?auto_271014 ?auto_271017 ) ) ( not ( = ?auto_271014 ?auto_271018 ) ) ( not ( = ?auto_271014 ?auto_271019 ) ) ( not ( = ?auto_271014 ?auto_271020 ) ) ( not ( = ?auto_271014 ?auto_271021 ) ) ( not ( = ?auto_271014 ?auto_271022 ) ) ( not ( = ?auto_271014 ?auto_271023 ) ) ( not ( = ?auto_271015 ?auto_271016 ) ) ( not ( = ?auto_271015 ?auto_271017 ) ) ( not ( = ?auto_271015 ?auto_271018 ) ) ( not ( = ?auto_271015 ?auto_271019 ) ) ( not ( = ?auto_271015 ?auto_271020 ) ) ( not ( = ?auto_271015 ?auto_271021 ) ) ( not ( = ?auto_271015 ?auto_271022 ) ) ( not ( = ?auto_271015 ?auto_271023 ) ) ( not ( = ?auto_271016 ?auto_271017 ) ) ( not ( = ?auto_271016 ?auto_271018 ) ) ( not ( = ?auto_271016 ?auto_271019 ) ) ( not ( = ?auto_271016 ?auto_271020 ) ) ( not ( = ?auto_271016 ?auto_271021 ) ) ( not ( = ?auto_271016 ?auto_271022 ) ) ( not ( = ?auto_271016 ?auto_271023 ) ) ( not ( = ?auto_271017 ?auto_271018 ) ) ( not ( = ?auto_271017 ?auto_271019 ) ) ( not ( = ?auto_271017 ?auto_271020 ) ) ( not ( = ?auto_271017 ?auto_271021 ) ) ( not ( = ?auto_271017 ?auto_271022 ) ) ( not ( = ?auto_271017 ?auto_271023 ) ) ( not ( = ?auto_271018 ?auto_271019 ) ) ( not ( = ?auto_271018 ?auto_271020 ) ) ( not ( = ?auto_271018 ?auto_271021 ) ) ( not ( = ?auto_271018 ?auto_271022 ) ) ( not ( = ?auto_271018 ?auto_271023 ) ) ( not ( = ?auto_271019 ?auto_271020 ) ) ( not ( = ?auto_271019 ?auto_271021 ) ) ( not ( = ?auto_271019 ?auto_271022 ) ) ( not ( = ?auto_271019 ?auto_271023 ) ) ( not ( = ?auto_271020 ?auto_271021 ) ) ( not ( = ?auto_271020 ?auto_271022 ) ) ( not ( = ?auto_271020 ?auto_271023 ) ) ( not ( = ?auto_271021 ?auto_271022 ) ) ( not ( = ?auto_271021 ?auto_271023 ) ) ( not ( = ?auto_271022 ?auto_271023 ) ) ( ON ?auto_271021 ?auto_271022 ) ( ON ?auto_271020 ?auto_271021 ) ( ON ?auto_271019 ?auto_271020 ) ( ON ?auto_271018 ?auto_271019 ) ( CLEAR ?auto_271016 ) ( ON ?auto_271017 ?auto_271018 ) ( CLEAR ?auto_271017 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_271010 ?auto_271011 ?auto_271012 ?auto_271013 ?auto_271014 ?auto_271015 ?auto_271016 ?auto_271017 )
      ( MAKE-13PILE ?auto_271010 ?auto_271011 ?auto_271012 ?auto_271013 ?auto_271014 ?auto_271015 ?auto_271016 ?auto_271017 ?auto_271018 ?auto_271019 ?auto_271020 ?auto_271021 ?auto_271022 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_271037 - BLOCK
      ?auto_271038 - BLOCK
      ?auto_271039 - BLOCK
      ?auto_271040 - BLOCK
      ?auto_271041 - BLOCK
      ?auto_271042 - BLOCK
      ?auto_271043 - BLOCK
      ?auto_271044 - BLOCK
      ?auto_271045 - BLOCK
      ?auto_271046 - BLOCK
      ?auto_271047 - BLOCK
      ?auto_271048 - BLOCK
      ?auto_271049 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_271049 ) ( ON-TABLE ?auto_271037 ) ( ON ?auto_271038 ?auto_271037 ) ( ON ?auto_271039 ?auto_271038 ) ( ON ?auto_271040 ?auto_271039 ) ( ON ?auto_271041 ?auto_271040 ) ( ON ?auto_271042 ?auto_271041 ) ( ON ?auto_271043 ?auto_271042 ) ( not ( = ?auto_271037 ?auto_271038 ) ) ( not ( = ?auto_271037 ?auto_271039 ) ) ( not ( = ?auto_271037 ?auto_271040 ) ) ( not ( = ?auto_271037 ?auto_271041 ) ) ( not ( = ?auto_271037 ?auto_271042 ) ) ( not ( = ?auto_271037 ?auto_271043 ) ) ( not ( = ?auto_271037 ?auto_271044 ) ) ( not ( = ?auto_271037 ?auto_271045 ) ) ( not ( = ?auto_271037 ?auto_271046 ) ) ( not ( = ?auto_271037 ?auto_271047 ) ) ( not ( = ?auto_271037 ?auto_271048 ) ) ( not ( = ?auto_271037 ?auto_271049 ) ) ( not ( = ?auto_271038 ?auto_271039 ) ) ( not ( = ?auto_271038 ?auto_271040 ) ) ( not ( = ?auto_271038 ?auto_271041 ) ) ( not ( = ?auto_271038 ?auto_271042 ) ) ( not ( = ?auto_271038 ?auto_271043 ) ) ( not ( = ?auto_271038 ?auto_271044 ) ) ( not ( = ?auto_271038 ?auto_271045 ) ) ( not ( = ?auto_271038 ?auto_271046 ) ) ( not ( = ?auto_271038 ?auto_271047 ) ) ( not ( = ?auto_271038 ?auto_271048 ) ) ( not ( = ?auto_271038 ?auto_271049 ) ) ( not ( = ?auto_271039 ?auto_271040 ) ) ( not ( = ?auto_271039 ?auto_271041 ) ) ( not ( = ?auto_271039 ?auto_271042 ) ) ( not ( = ?auto_271039 ?auto_271043 ) ) ( not ( = ?auto_271039 ?auto_271044 ) ) ( not ( = ?auto_271039 ?auto_271045 ) ) ( not ( = ?auto_271039 ?auto_271046 ) ) ( not ( = ?auto_271039 ?auto_271047 ) ) ( not ( = ?auto_271039 ?auto_271048 ) ) ( not ( = ?auto_271039 ?auto_271049 ) ) ( not ( = ?auto_271040 ?auto_271041 ) ) ( not ( = ?auto_271040 ?auto_271042 ) ) ( not ( = ?auto_271040 ?auto_271043 ) ) ( not ( = ?auto_271040 ?auto_271044 ) ) ( not ( = ?auto_271040 ?auto_271045 ) ) ( not ( = ?auto_271040 ?auto_271046 ) ) ( not ( = ?auto_271040 ?auto_271047 ) ) ( not ( = ?auto_271040 ?auto_271048 ) ) ( not ( = ?auto_271040 ?auto_271049 ) ) ( not ( = ?auto_271041 ?auto_271042 ) ) ( not ( = ?auto_271041 ?auto_271043 ) ) ( not ( = ?auto_271041 ?auto_271044 ) ) ( not ( = ?auto_271041 ?auto_271045 ) ) ( not ( = ?auto_271041 ?auto_271046 ) ) ( not ( = ?auto_271041 ?auto_271047 ) ) ( not ( = ?auto_271041 ?auto_271048 ) ) ( not ( = ?auto_271041 ?auto_271049 ) ) ( not ( = ?auto_271042 ?auto_271043 ) ) ( not ( = ?auto_271042 ?auto_271044 ) ) ( not ( = ?auto_271042 ?auto_271045 ) ) ( not ( = ?auto_271042 ?auto_271046 ) ) ( not ( = ?auto_271042 ?auto_271047 ) ) ( not ( = ?auto_271042 ?auto_271048 ) ) ( not ( = ?auto_271042 ?auto_271049 ) ) ( not ( = ?auto_271043 ?auto_271044 ) ) ( not ( = ?auto_271043 ?auto_271045 ) ) ( not ( = ?auto_271043 ?auto_271046 ) ) ( not ( = ?auto_271043 ?auto_271047 ) ) ( not ( = ?auto_271043 ?auto_271048 ) ) ( not ( = ?auto_271043 ?auto_271049 ) ) ( not ( = ?auto_271044 ?auto_271045 ) ) ( not ( = ?auto_271044 ?auto_271046 ) ) ( not ( = ?auto_271044 ?auto_271047 ) ) ( not ( = ?auto_271044 ?auto_271048 ) ) ( not ( = ?auto_271044 ?auto_271049 ) ) ( not ( = ?auto_271045 ?auto_271046 ) ) ( not ( = ?auto_271045 ?auto_271047 ) ) ( not ( = ?auto_271045 ?auto_271048 ) ) ( not ( = ?auto_271045 ?auto_271049 ) ) ( not ( = ?auto_271046 ?auto_271047 ) ) ( not ( = ?auto_271046 ?auto_271048 ) ) ( not ( = ?auto_271046 ?auto_271049 ) ) ( not ( = ?auto_271047 ?auto_271048 ) ) ( not ( = ?auto_271047 ?auto_271049 ) ) ( not ( = ?auto_271048 ?auto_271049 ) ) ( ON ?auto_271048 ?auto_271049 ) ( ON ?auto_271047 ?auto_271048 ) ( ON ?auto_271046 ?auto_271047 ) ( ON ?auto_271045 ?auto_271046 ) ( CLEAR ?auto_271043 ) ( ON ?auto_271044 ?auto_271045 ) ( CLEAR ?auto_271044 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_271037 ?auto_271038 ?auto_271039 ?auto_271040 ?auto_271041 ?auto_271042 ?auto_271043 ?auto_271044 )
      ( MAKE-13PILE ?auto_271037 ?auto_271038 ?auto_271039 ?auto_271040 ?auto_271041 ?auto_271042 ?auto_271043 ?auto_271044 ?auto_271045 ?auto_271046 ?auto_271047 ?auto_271048 ?auto_271049 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_271063 - BLOCK
      ?auto_271064 - BLOCK
      ?auto_271065 - BLOCK
      ?auto_271066 - BLOCK
      ?auto_271067 - BLOCK
      ?auto_271068 - BLOCK
      ?auto_271069 - BLOCK
      ?auto_271070 - BLOCK
      ?auto_271071 - BLOCK
      ?auto_271072 - BLOCK
      ?auto_271073 - BLOCK
      ?auto_271074 - BLOCK
      ?auto_271075 - BLOCK
    )
    :vars
    (
      ?auto_271076 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_271075 ?auto_271076 ) ( ON-TABLE ?auto_271063 ) ( ON ?auto_271064 ?auto_271063 ) ( ON ?auto_271065 ?auto_271064 ) ( ON ?auto_271066 ?auto_271065 ) ( ON ?auto_271067 ?auto_271066 ) ( ON ?auto_271068 ?auto_271067 ) ( not ( = ?auto_271063 ?auto_271064 ) ) ( not ( = ?auto_271063 ?auto_271065 ) ) ( not ( = ?auto_271063 ?auto_271066 ) ) ( not ( = ?auto_271063 ?auto_271067 ) ) ( not ( = ?auto_271063 ?auto_271068 ) ) ( not ( = ?auto_271063 ?auto_271069 ) ) ( not ( = ?auto_271063 ?auto_271070 ) ) ( not ( = ?auto_271063 ?auto_271071 ) ) ( not ( = ?auto_271063 ?auto_271072 ) ) ( not ( = ?auto_271063 ?auto_271073 ) ) ( not ( = ?auto_271063 ?auto_271074 ) ) ( not ( = ?auto_271063 ?auto_271075 ) ) ( not ( = ?auto_271063 ?auto_271076 ) ) ( not ( = ?auto_271064 ?auto_271065 ) ) ( not ( = ?auto_271064 ?auto_271066 ) ) ( not ( = ?auto_271064 ?auto_271067 ) ) ( not ( = ?auto_271064 ?auto_271068 ) ) ( not ( = ?auto_271064 ?auto_271069 ) ) ( not ( = ?auto_271064 ?auto_271070 ) ) ( not ( = ?auto_271064 ?auto_271071 ) ) ( not ( = ?auto_271064 ?auto_271072 ) ) ( not ( = ?auto_271064 ?auto_271073 ) ) ( not ( = ?auto_271064 ?auto_271074 ) ) ( not ( = ?auto_271064 ?auto_271075 ) ) ( not ( = ?auto_271064 ?auto_271076 ) ) ( not ( = ?auto_271065 ?auto_271066 ) ) ( not ( = ?auto_271065 ?auto_271067 ) ) ( not ( = ?auto_271065 ?auto_271068 ) ) ( not ( = ?auto_271065 ?auto_271069 ) ) ( not ( = ?auto_271065 ?auto_271070 ) ) ( not ( = ?auto_271065 ?auto_271071 ) ) ( not ( = ?auto_271065 ?auto_271072 ) ) ( not ( = ?auto_271065 ?auto_271073 ) ) ( not ( = ?auto_271065 ?auto_271074 ) ) ( not ( = ?auto_271065 ?auto_271075 ) ) ( not ( = ?auto_271065 ?auto_271076 ) ) ( not ( = ?auto_271066 ?auto_271067 ) ) ( not ( = ?auto_271066 ?auto_271068 ) ) ( not ( = ?auto_271066 ?auto_271069 ) ) ( not ( = ?auto_271066 ?auto_271070 ) ) ( not ( = ?auto_271066 ?auto_271071 ) ) ( not ( = ?auto_271066 ?auto_271072 ) ) ( not ( = ?auto_271066 ?auto_271073 ) ) ( not ( = ?auto_271066 ?auto_271074 ) ) ( not ( = ?auto_271066 ?auto_271075 ) ) ( not ( = ?auto_271066 ?auto_271076 ) ) ( not ( = ?auto_271067 ?auto_271068 ) ) ( not ( = ?auto_271067 ?auto_271069 ) ) ( not ( = ?auto_271067 ?auto_271070 ) ) ( not ( = ?auto_271067 ?auto_271071 ) ) ( not ( = ?auto_271067 ?auto_271072 ) ) ( not ( = ?auto_271067 ?auto_271073 ) ) ( not ( = ?auto_271067 ?auto_271074 ) ) ( not ( = ?auto_271067 ?auto_271075 ) ) ( not ( = ?auto_271067 ?auto_271076 ) ) ( not ( = ?auto_271068 ?auto_271069 ) ) ( not ( = ?auto_271068 ?auto_271070 ) ) ( not ( = ?auto_271068 ?auto_271071 ) ) ( not ( = ?auto_271068 ?auto_271072 ) ) ( not ( = ?auto_271068 ?auto_271073 ) ) ( not ( = ?auto_271068 ?auto_271074 ) ) ( not ( = ?auto_271068 ?auto_271075 ) ) ( not ( = ?auto_271068 ?auto_271076 ) ) ( not ( = ?auto_271069 ?auto_271070 ) ) ( not ( = ?auto_271069 ?auto_271071 ) ) ( not ( = ?auto_271069 ?auto_271072 ) ) ( not ( = ?auto_271069 ?auto_271073 ) ) ( not ( = ?auto_271069 ?auto_271074 ) ) ( not ( = ?auto_271069 ?auto_271075 ) ) ( not ( = ?auto_271069 ?auto_271076 ) ) ( not ( = ?auto_271070 ?auto_271071 ) ) ( not ( = ?auto_271070 ?auto_271072 ) ) ( not ( = ?auto_271070 ?auto_271073 ) ) ( not ( = ?auto_271070 ?auto_271074 ) ) ( not ( = ?auto_271070 ?auto_271075 ) ) ( not ( = ?auto_271070 ?auto_271076 ) ) ( not ( = ?auto_271071 ?auto_271072 ) ) ( not ( = ?auto_271071 ?auto_271073 ) ) ( not ( = ?auto_271071 ?auto_271074 ) ) ( not ( = ?auto_271071 ?auto_271075 ) ) ( not ( = ?auto_271071 ?auto_271076 ) ) ( not ( = ?auto_271072 ?auto_271073 ) ) ( not ( = ?auto_271072 ?auto_271074 ) ) ( not ( = ?auto_271072 ?auto_271075 ) ) ( not ( = ?auto_271072 ?auto_271076 ) ) ( not ( = ?auto_271073 ?auto_271074 ) ) ( not ( = ?auto_271073 ?auto_271075 ) ) ( not ( = ?auto_271073 ?auto_271076 ) ) ( not ( = ?auto_271074 ?auto_271075 ) ) ( not ( = ?auto_271074 ?auto_271076 ) ) ( not ( = ?auto_271075 ?auto_271076 ) ) ( ON ?auto_271074 ?auto_271075 ) ( ON ?auto_271073 ?auto_271074 ) ( ON ?auto_271072 ?auto_271073 ) ( ON ?auto_271071 ?auto_271072 ) ( ON ?auto_271070 ?auto_271071 ) ( CLEAR ?auto_271068 ) ( ON ?auto_271069 ?auto_271070 ) ( CLEAR ?auto_271069 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_271063 ?auto_271064 ?auto_271065 ?auto_271066 ?auto_271067 ?auto_271068 ?auto_271069 )
      ( MAKE-13PILE ?auto_271063 ?auto_271064 ?auto_271065 ?auto_271066 ?auto_271067 ?auto_271068 ?auto_271069 ?auto_271070 ?auto_271071 ?auto_271072 ?auto_271073 ?auto_271074 ?auto_271075 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_271090 - BLOCK
      ?auto_271091 - BLOCK
      ?auto_271092 - BLOCK
      ?auto_271093 - BLOCK
      ?auto_271094 - BLOCK
      ?auto_271095 - BLOCK
      ?auto_271096 - BLOCK
      ?auto_271097 - BLOCK
      ?auto_271098 - BLOCK
      ?auto_271099 - BLOCK
      ?auto_271100 - BLOCK
      ?auto_271101 - BLOCK
      ?auto_271102 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_271102 ) ( ON-TABLE ?auto_271090 ) ( ON ?auto_271091 ?auto_271090 ) ( ON ?auto_271092 ?auto_271091 ) ( ON ?auto_271093 ?auto_271092 ) ( ON ?auto_271094 ?auto_271093 ) ( ON ?auto_271095 ?auto_271094 ) ( not ( = ?auto_271090 ?auto_271091 ) ) ( not ( = ?auto_271090 ?auto_271092 ) ) ( not ( = ?auto_271090 ?auto_271093 ) ) ( not ( = ?auto_271090 ?auto_271094 ) ) ( not ( = ?auto_271090 ?auto_271095 ) ) ( not ( = ?auto_271090 ?auto_271096 ) ) ( not ( = ?auto_271090 ?auto_271097 ) ) ( not ( = ?auto_271090 ?auto_271098 ) ) ( not ( = ?auto_271090 ?auto_271099 ) ) ( not ( = ?auto_271090 ?auto_271100 ) ) ( not ( = ?auto_271090 ?auto_271101 ) ) ( not ( = ?auto_271090 ?auto_271102 ) ) ( not ( = ?auto_271091 ?auto_271092 ) ) ( not ( = ?auto_271091 ?auto_271093 ) ) ( not ( = ?auto_271091 ?auto_271094 ) ) ( not ( = ?auto_271091 ?auto_271095 ) ) ( not ( = ?auto_271091 ?auto_271096 ) ) ( not ( = ?auto_271091 ?auto_271097 ) ) ( not ( = ?auto_271091 ?auto_271098 ) ) ( not ( = ?auto_271091 ?auto_271099 ) ) ( not ( = ?auto_271091 ?auto_271100 ) ) ( not ( = ?auto_271091 ?auto_271101 ) ) ( not ( = ?auto_271091 ?auto_271102 ) ) ( not ( = ?auto_271092 ?auto_271093 ) ) ( not ( = ?auto_271092 ?auto_271094 ) ) ( not ( = ?auto_271092 ?auto_271095 ) ) ( not ( = ?auto_271092 ?auto_271096 ) ) ( not ( = ?auto_271092 ?auto_271097 ) ) ( not ( = ?auto_271092 ?auto_271098 ) ) ( not ( = ?auto_271092 ?auto_271099 ) ) ( not ( = ?auto_271092 ?auto_271100 ) ) ( not ( = ?auto_271092 ?auto_271101 ) ) ( not ( = ?auto_271092 ?auto_271102 ) ) ( not ( = ?auto_271093 ?auto_271094 ) ) ( not ( = ?auto_271093 ?auto_271095 ) ) ( not ( = ?auto_271093 ?auto_271096 ) ) ( not ( = ?auto_271093 ?auto_271097 ) ) ( not ( = ?auto_271093 ?auto_271098 ) ) ( not ( = ?auto_271093 ?auto_271099 ) ) ( not ( = ?auto_271093 ?auto_271100 ) ) ( not ( = ?auto_271093 ?auto_271101 ) ) ( not ( = ?auto_271093 ?auto_271102 ) ) ( not ( = ?auto_271094 ?auto_271095 ) ) ( not ( = ?auto_271094 ?auto_271096 ) ) ( not ( = ?auto_271094 ?auto_271097 ) ) ( not ( = ?auto_271094 ?auto_271098 ) ) ( not ( = ?auto_271094 ?auto_271099 ) ) ( not ( = ?auto_271094 ?auto_271100 ) ) ( not ( = ?auto_271094 ?auto_271101 ) ) ( not ( = ?auto_271094 ?auto_271102 ) ) ( not ( = ?auto_271095 ?auto_271096 ) ) ( not ( = ?auto_271095 ?auto_271097 ) ) ( not ( = ?auto_271095 ?auto_271098 ) ) ( not ( = ?auto_271095 ?auto_271099 ) ) ( not ( = ?auto_271095 ?auto_271100 ) ) ( not ( = ?auto_271095 ?auto_271101 ) ) ( not ( = ?auto_271095 ?auto_271102 ) ) ( not ( = ?auto_271096 ?auto_271097 ) ) ( not ( = ?auto_271096 ?auto_271098 ) ) ( not ( = ?auto_271096 ?auto_271099 ) ) ( not ( = ?auto_271096 ?auto_271100 ) ) ( not ( = ?auto_271096 ?auto_271101 ) ) ( not ( = ?auto_271096 ?auto_271102 ) ) ( not ( = ?auto_271097 ?auto_271098 ) ) ( not ( = ?auto_271097 ?auto_271099 ) ) ( not ( = ?auto_271097 ?auto_271100 ) ) ( not ( = ?auto_271097 ?auto_271101 ) ) ( not ( = ?auto_271097 ?auto_271102 ) ) ( not ( = ?auto_271098 ?auto_271099 ) ) ( not ( = ?auto_271098 ?auto_271100 ) ) ( not ( = ?auto_271098 ?auto_271101 ) ) ( not ( = ?auto_271098 ?auto_271102 ) ) ( not ( = ?auto_271099 ?auto_271100 ) ) ( not ( = ?auto_271099 ?auto_271101 ) ) ( not ( = ?auto_271099 ?auto_271102 ) ) ( not ( = ?auto_271100 ?auto_271101 ) ) ( not ( = ?auto_271100 ?auto_271102 ) ) ( not ( = ?auto_271101 ?auto_271102 ) ) ( ON ?auto_271101 ?auto_271102 ) ( ON ?auto_271100 ?auto_271101 ) ( ON ?auto_271099 ?auto_271100 ) ( ON ?auto_271098 ?auto_271099 ) ( ON ?auto_271097 ?auto_271098 ) ( CLEAR ?auto_271095 ) ( ON ?auto_271096 ?auto_271097 ) ( CLEAR ?auto_271096 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_271090 ?auto_271091 ?auto_271092 ?auto_271093 ?auto_271094 ?auto_271095 ?auto_271096 )
      ( MAKE-13PILE ?auto_271090 ?auto_271091 ?auto_271092 ?auto_271093 ?auto_271094 ?auto_271095 ?auto_271096 ?auto_271097 ?auto_271098 ?auto_271099 ?auto_271100 ?auto_271101 ?auto_271102 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_271116 - BLOCK
      ?auto_271117 - BLOCK
      ?auto_271118 - BLOCK
      ?auto_271119 - BLOCK
      ?auto_271120 - BLOCK
      ?auto_271121 - BLOCK
      ?auto_271122 - BLOCK
      ?auto_271123 - BLOCK
      ?auto_271124 - BLOCK
      ?auto_271125 - BLOCK
      ?auto_271126 - BLOCK
      ?auto_271127 - BLOCK
      ?auto_271128 - BLOCK
    )
    :vars
    (
      ?auto_271129 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_271128 ?auto_271129 ) ( ON-TABLE ?auto_271116 ) ( ON ?auto_271117 ?auto_271116 ) ( ON ?auto_271118 ?auto_271117 ) ( ON ?auto_271119 ?auto_271118 ) ( ON ?auto_271120 ?auto_271119 ) ( not ( = ?auto_271116 ?auto_271117 ) ) ( not ( = ?auto_271116 ?auto_271118 ) ) ( not ( = ?auto_271116 ?auto_271119 ) ) ( not ( = ?auto_271116 ?auto_271120 ) ) ( not ( = ?auto_271116 ?auto_271121 ) ) ( not ( = ?auto_271116 ?auto_271122 ) ) ( not ( = ?auto_271116 ?auto_271123 ) ) ( not ( = ?auto_271116 ?auto_271124 ) ) ( not ( = ?auto_271116 ?auto_271125 ) ) ( not ( = ?auto_271116 ?auto_271126 ) ) ( not ( = ?auto_271116 ?auto_271127 ) ) ( not ( = ?auto_271116 ?auto_271128 ) ) ( not ( = ?auto_271116 ?auto_271129 ) ) ( not ( = ?auto_271117 ?auto_271118 ) ) ( not ( = ?auto_271117 ?auto_271119 ) ) ( not ( = ?auto_271117 ?auto_271120 ) ) ( not ( = ?auto_271117 ?auto_271121 ) ) ( not ( = ?auto_271117 ?auto_271122 ) ) ( not ( = ?auto_271117 ?auto_271123 ) ) ( not ( = ?auto_271117 ?auto_271124 ) ) ( not ( = ?auto_271117 ?auto_271125 ) ) ( not ( = ?auto_271117 ?auto_271126 ) ) ( not ( = ?auto_271117 ?auto_271127 ) ) ( not ( = ?auto_271117 ?auto_271128 ) ) ( not ( = ?auto_271117 ?auto_271129 ) ) ( not ( = ?auto_271118 ?auto_271119 ) ) ( not ( = ?auto_271118 ?auto_271120 ) ) ( not ( = ?auto_271118 ?auto_271121 ) ) ( not ( = ?auto_271118 ?auto_271122 ) ) ( not ( = ?auto_271118 ?auto_271123 ) ) ( not ( = ?auto_271118 ?auto_271124 ) ) ( not ( = ?auto_271118 ?auto_271125 ) ) ( not ( = ?auto_271118 ?auto_271126 ) ) ( not ( = ?auto_271118 ?auto_271127 ) ) ( not ( = ?auto_271118 ?auto_271128 ) ) ( not ( = ?auto_271118 ?auto_271129 ) ) ( not ( = ?auto_271119 ?auto_271120 ) ) ( not ( = ?auto_271119 ?auto_271121 ) ) ( not ( = ?auto_271119 ?auto_271122 ) ) ( not ( = ?auto_271119 ?auto_271123 ) ) ( not ( = ?auto_271119 ?auto_271124 ) ) ( not ( = ?auto_271119 ?auto_271125 ) ) ( not ( = ?auto_271119 ?auto_271126 ) ) ( not ( = ?auto_271119 ?auto_271127 ) ) ( not ( = ?auto_271119 ?auto_271128 ) ) ( not ( = ?auto_271119 ?auto_271129 ) ) ( not ( = ?auto_271120 ?auto_271121 ) ) ( not ( = ?auto_271120 ?auto_271122 ) ) ( not ( = ?auto_271120 ?auto_271123 ) ) ( not ( = ?auto_271120 ?auto_271124 ) ) ( not ( = ?auto_271120 ?auto_271125 ) ) ( not ( = ?auto_271120 ?auto_271126 ) ) ( not ( = ?auto_271120 ?auto_271127 ) ) ( not ( = ?auto_271120 ?auto_271128 ) ) ( not ( = ?auto_271120 ?auto_271129 ) ) ( not ( = ?auto_271121 ?auto_271122 ) ) ( not ( = ?auto_271121 ?auto_271123 ) ) ( not ( = ?auto_271121 ?auto_271124 ) ) ( not ( = ?auto_271121 ?auto_271125 ) ) ( not ( = ?auto_271121 ?auto_271126 ) ) ( not ( = ?auto_271121 ?auto_271127 ) ) ( not ( = ?auto_271121 ?auto_271128 ) ) ( not ( = ?auto_271121 ?auto_271129 ) ) ( not ( = ?auto_271122 ?auto_271123 ) ) ( not ( = ?auto_271122 ?auto_271124 ) ) ( not ( = ?auto_271122 ?auto_271125 ) ) ( not ( = ?auto_271122 ?auto_271126 ) ) ( not ( = ?auto_271122 ?auto_271127 ) ) ( not ( = ?auto_271122 ?auto_271128 ) ) ( not ( = ?auto_271122 ?auto_271129 ) ) ( not ( = ?auto_271123 ?auto_271124 ) ) ( not ( = ?auto_271123 ?auto_271125 ) ) ( not ( = ?auto_271123 ?auto_271126 ) ) ( not ( = ?auto_271123 ?auto_271127 ) ) ( not ( = ?auto_271123 ?auto_271128 ) ) ( not ( = ?auto_271123 ?auto_271129 ) ) ( not ( = ?auto_271124 ?auto_271125 ) ) ( not ( = ?auto_271124 ?auto_271126 ) ) ( not ( = ?auto_271124 ?auto_271127 ) ) ( not ( = ?auto_271124 ?auto_271128 ) ) ( not ( = ?auto_271124 ?auto_271129 ) ) ( not ( = ?auto_271125 ?auto_271126 ) ) ( not ( = ?auto_271125 ?auto_271127 ) ) ( not ( = ?auto_271125 ?auto_271128 ) ) ( not ( = ?auto_271125 ?auto_271129 ) ) ( not ( = ?auto_271126 ?auto_271127 ) ) ( not ( = ?auto_271126 ?auto_271128 ) ) ( not ( = ?auto_271126 ?auto_271129 ) ) ( not ( = ?auto_271127 ?auto_271128 ) ) ( not ( = ?auto_271127 ?auto_271129 ) ) ( not ( = ?auto_271128 ?auto_271129 ) ) ( ON ?auto_271127 ?auto_271128 ) ( ON ?auto_271126 ?auto_271127 ) ( ON ?auto_271125 ?auto_271126 ) ( ON ?auto_271124 ?auto_271125 ) ( ON ?auto_271123 ?auto_271124 ) ( ON ?auto_271122 ?auto_271123 ) ( CLEAR ?auto_271120 ) ( ON ?auto_271121 ?auto_271122 ) ( CLEAR ?auto_271121 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_271116 ?auto_271117 ?auto_271118 ?auto_271119 ?auto_271120 ?auto_271121 )
      ( MAKE-13PILE ?auto_271116 ?auto_271117 ?auto_271118 ?auto_271119 ?auto_271120 ?auto_271121 ?auto_271122 ?auto_271123 ?auto_271124 ?auto_271125 ?auto_271126 ?auto_271127 ?auto_271128 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_271143 - BLOCK
      ?auto_271144 - BLOCK
      ?auto_271145 - BLOCK
      ?auto_271146 - BLOCK
      ?auto_271147 - BLOCK
      ?auto_271148 - BLOCK
      ?auto_271149 - BLOCK
      ?auto_271150 - BLOCK
      ?auto_271151 - BLOCK
      ?auto_271152 - BLOCK
      ?auto_271153 - BLOCK
      ?auto_271154 - BLOCK
      ?auto_271155 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_271155 ) ( ON-TABLE ?auto_271143 ) ( ON ?auto_271144 ?auto_271143 ) ( ON ?auto_271145 ?auto_271144 ) ( ON ?auto_271146 ?auto_271145 ) ( ON ?auto_271147 ?auto_271146 ) ( not ( = ?auto_271143 ?auto_271144 ) ) ( not ( = ?auto_271143 ?auto_271145 ) ) ( not ( = ?auto_271143 ?auto_271146 ) ) ( not ( = ?auto_271143 ?auto_271147 ) ) ( not ( = ?auto_271143 ?auto_271148 ) ) ( not ( = ?auto_271143 ?auto_271149 ) ) ( not ( = ?auto_271143 ?auto_271150 ) ) ( not ( = ?auto_271143 ?auto_271151 ) ) ( not ( = ?auto_271143 ?auto_271152 ) ) ( not ( = ?auto_271143 ?auto_271153 ) ) ( not ( = ?auto_271143 ?auto_271154 ) ) ( not ( = ?auto_271143 ?auto_271155 ) ) ( not ( = ?auto_271144 ?auto_271145 ) ) ( not ( = ?auto_271144 ?auto_271146 ) ) ( not ( = ?auto_271144 ?auto_271147 ) ) ( not ( = ?auto_271144 ?auto_271148 ) ) ( not ( = ?auto_271144 ?auto_271149 ) ) ( not ( = ?auto_271144 ?auto_271150 ) ) ( not ( = ?auto_271144 ?auto_271151 ) ) ( not ( = ?auto_271144 ?auto_271152 ) ) ( not ( = ?auto_271144 ?auto_271153 ) ) ( not ( = ?auto_271144 ?auto_271154 ) ) ( not ( = ?auto_271144 ?auto_271155 ) ) ( not ( = ?auto_271145 ?auto_271146 ) ) ( not ( = ?auto_271145 ?auto_271147 ) ) ( not ( = ?auto_271145 ?auto_271148 ) ) ( not ( = ?auto_271145 ?auto_271149 ) ) ( not ( = ?auto_271145 ?auto_271150 ) ) ( not ( = ?auto_271145 ?auto_271151 ) ) ( not ( = ?auto_271145 ?auto_271152 ) ) ( not ( = ?auto_271145 ?auto_271153 ) ) ( not ( = ?auto_271145 ?auto_271154 ) ) ( not ( = ?auto_271145 ?auto_271155 ) ) ( not ( = ?auto_271146 ?auto_271147 ) ) ( not ( = ?auto_271146 ?auto_271148 ) ) ( not ( = ?auto_271146 ?auto_271149 ) ) ( not ( = ?auto_271146 ?auto_271150 ) ) ( not ( = ?auto_271146 ?auto_271151 ) ) ( not ( = ?auto_271146 ?auto_271152 ) ) ( not ( = ?auto_271146 ?auto_271153 ) ) ( not ( = ?auto_271146 ?auto_271154 ) ) ( not ( = ?auto_271146 ?auto_271155 ) ) ( not ( = ?auto_271147 ?auto_271148 ) ) ( not ( = ?auto_271147 ?auto_271149 ) ) ( not ( = ?auto_271147 ?auto_271150 ) ) ( not ( = ?auto_271147 ?auto_271151 ) ) ( not ( = ?auto_271147 ?auto_271152 ) ) ( not ( = ?auto_271147 ?auto_271153 ) ) ( not ( = ?auto_271147 ?auto_271154 ) ) ( not ( = ?auto_271147 ?auto_271155 ) ) ( not ( = ?auto_271148 ?auto_271149 ) ) ( not ( = ?auto_271148 ?auto_271150 ) ) ( not ( = ?auto_271148 ?auto_271151 ) ) ( not ( = ?auto_271148 ?auto_271152 ) ) ( not ( = ?auto_271148 ?auto_271153 ) ) ( not ( = ?auto_271148 ?auto_271154 ) ) ( not ( = ?auto_271148 ?auto_271155 ) ) ( not ( = ?auto_271149 ?auto_271150 ) ) ( not ( = ?auto_271149 ?auto_271151 ) ) ( not ( = ?auto_271149 ?auto_271152 ) ) ( not ( = ?auto_271149 ?auto_271153 ) ) ( not ( = ?auto_271149 ?auto_271154 ) ) ( not ( = ?auto_271149 ?auto_271155 ) ) ( not ( = ?auto_271150 ?auto_271151 ) ) ( not ( = ?auto_271150 ?auto_271152 ) ) ( not ( = ?auto_271150 ?auto_271153 ) ) ( not ( = ?auto_271150 ?auto_271154 ) ) ( not ( = ?auto_271150 ?auto_271155 ) ) ( not ( = ?auto_271151 ?auto_271152 ) ) ( not ( = ?auto_271151 ?auto_271153 ) ) ( not ( = ?auto_271151 ?auto_271154 ) ) ( not ( = ?auto_271151 ?auto_271155 ) ) ( not ( = ?auto_271152 ?auto_271153 ) ) ( not ( = ?auto_271152 ?auto_271154 ) ) ( not ( = ?auto_271152 ?auto_271155 ) ) ( not ( = ?auto_271153 ?auto_271154 ) ) ( not ( = ?auto_271153 ?auto_271155 ) ) ( not ( = ?auto_271154 ?auto_271155 ) ) ( ON ?auto_271154 ?auto_271155 ) ( ON ?auto_271153 ?auto_271154 ) ( ON ?auto_271152 ?auto_271153 ) ( ON ?auto_271151 ?auto_271152 ) ( ON ?auto_271150 ?auto_271151 ) ( ON ?auto_271149 ?auto_271150 ) ( CLEAR ?auto_271147 ) ( ON ?auto_271148 ?auto_271149 ) ( CLEAR ?auto_271148 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_271143 ?auto_271144 ?auto_271145 ?auto_271146 ?auto_271147 ?auto_271148 )
      ( MAKE-13PILE ?auto_271143 ?auto_271144 ?auto_271145 ?auto_271146 ?auto_271147 ?auto_271148 ?auto_271149 ?auto_271150 ?auto_271151 ?auto_271152 ?auto_271153 ?auto_271154 ?auto_271155 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_271169 - BLOCK
      ?auto_271170 - BLOCK
      ?auto_271171 - BLOCK
      ?auto_271172 - BLOCK
      ?auto_271173 - BLOCK
      ?auto_271174 - BLOCK
      ?auto_271175 - BLOCK
      ?auto_271176 - BLOCK
      ?auto_271177 - BLOCK
      ?auto_271178 - BLOCK
      ?auto_271179 - BLOCK
      ?auto_271180 - BLOCK
      ?auto_271181 - BLOCK
    )
    :vars
    (
      ?auto_271182 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_271181 ?auto_271182 ) ( ON-TABLE ?auto_271169 ) ( ON ?auto_271170 ?auto_271169 ) ( ON ?auto_271171 ?auto_271170 ) ( ON ?auto_271172 ?auto_271171 ) ( not ( = ?auto_271169 ?auto_271170 ) ) ( not ( = ?auto_271169 ?auto_271171 ) ) ( not ( = ?auto_271169 ?auto_271172 ) ) ( not ( = ?auto_271169 ?auto_271173 ) ) ( not ( = ?auto_271169 ?auto_271174 ) ) ( not ( = ?auto_271169 ?auto_271175 ) ) ( not ( = ?auto_271169 ?auto_271176 ) ) ( not ( = ?auto_271169 ?auto_271177 ) ) ( not ( = ?auto_271169 ?auto_271178 ) ) ( not ( = ?auto_271169 ?auto_271179 ) ) ( not ( = ?auto_271169 ?auto_271180 ) ) ( not ( = ?auto_271169 ?auto_271181 ) ) ( not ( = ?auto_271169 ?auto_271182 ) ) ( not ( = ?auto_271170 ?auto_271171 ) ) ( not ( = ?auto_271170 ?auto_271172 ) ) ( not ( = ?auto_271170 ?auto_271173 ) ) ( not ( = ?auto_271170 ?auto_271174 ) ) ( not ( = ?auto_271170 ?auto_271175 ) ) ( not ( = ?auto_271170 ?auto_271176 ) ) ( not ( = ?auto_271170 ?auto_271177 ) ) ( not ( = ?auto_271170 ?auto_271178 ) ) ( not ( = ?auto_271170 ?auto_271179 ) ) ( not ( = ?auto_271170 ?auto_271180 ) ) ( not ( = ?auto_271170 ?auto_271181 ) ) ( not ( = ?auto_271170 ?auto_271182 ) ) ( not ( = ?auto_271171 ?auto_271172 ) ) ( not ( = ?auto_271171 ?auto_271173 ) ) ( not ( = ?auto_271171 ?auto_271174 ) ) ( not ( = ?auto_271171 ?auto_271175 ) ) ( not ( = ?auto_271171 ?auto_271176 ) ) ( not ( = ?auto_271171 ?auto_271177 ) ) ( not ( = ?auto_271171 ?auto_271178 ) ) ( not ( = ?auto_271171 ?auto_271179 ) ) ( not ( = ?auto_271171 ?auto_271180 ) ) ( not ( = ?auto_271171 ?auto_271181 ) ) ( not ( = ?auto_271171 ?auto_271182 ) ) ( not ( = ?auto_271172 ?auto_271173 ) ) ( not ( = ?auto_271172 ?auto_271174 ) ) ( not ( = ?auto_271172 ?auto_271175 ) ) ( not ( = ?auto_271172 ?auto_271176 ) ) ( not ( = ?auto_271172 ?auto_271177 ) ) ( not ( = ?auto_271172 ?auto_271178 ) ) ( not ( = ?auto_271172 ?auto_271179 ) ) ( not ( = ?auto_271172 ?auto_271180 ) ) ( not ( = ?auto_271172 ?auto_271181 ) ) ( not ( = ?auto_271172 ?auto_271182 ) ) ( not ( = ?auto_271173 ?auto_271174 ) ) ( not ( = ?auto_271173 ?auto_271175 ) ) ( not ( = ?auto_271173 ?auto_271176 ) ) ( not ( = ?auto_271173 ?auto_271177 ) ) ( not ( = ?auto_271173 ?auto_271178 ) ) ( not ( = ?auto_271173 ?auto_271179 ) ) ( not ( = ?auto_271173 ?auto_271180 ) ) ( not ( = ?auto_271173 ?auto_271181 ) ) ( not ( = ?auto_271173 ?auto_271182 ) ) ( not ( = ?auto_271174 ?auto_271175 ) ) ( not ( = ?auto_271174 ?auto_271176 ) ) ( not ( = ?auto_271174 ?auto_271177 ) ) ( not ( = ?auto_271174 ?auto_271178 ) ) ( not ( = ?auto_271174 ?auto_271179 ) ) ( not ( = ?auto_271174 ?auto_271180 ) ) ( not ( = ?auto_271174 ?auto_271181 ) ) ( not ( = ?auto_271174 ?auto_271182 ) ) ( not ( = ?auto_271175 ?auto_271176 ) ) ( not ( = ?auto_271175 ?auto_271177 ) ) ( not ( = ?auto_271175 ?auto_271178 ) ) ( not ( = ?auto_271175 ?auto_271179 ) ) ( not ( = ?auto_271175 ?auto_271180 ) ) ( not ( = ?auto_271175 ?auto_271181 ) ) ( not ( = ?auto_271175 ?auto_271182 ) ) ( not ( = ?auto_271176 ?auto_271177 ) ) ( not ( = ?auto_271176 ?auto_271178 ) ) ( not ( = ?auto_271176 ?auto_271179 ) ) ( not ( = ?auto_271176 ?auto_271180 ) ) ( not ( = ?auto_271176 ?auto_271181 ) ) ( not ( = ?auto_271176 ?auto_271182 ) ) ( not ( = ?auto_271177 ?auto_271178 ) ) ( not ( = ?auto_271177 ?auto_271179 ) ) ( not ( = ?auto_271177 ?auto_271180 ) ) ( not ( = ?auto_271177 ?auto_271181 ) ) ( not ( = ?auto_271177 ?auto_271182 ) ) ( not ( = ?auto_271178 ?auto_271179 ) ) ( not ( = ?auto_271178 ?auto_271180 ) ) ( not ( = ?auto_271178 ?auto_271181 ) ) ( not ( = ?auto_271178 ?auto_271182 ) ) ( not ( = ?auto_271179 ?auto_271180 ) ) ( not ( = ?auto_271179 ?auto_271181 ) ) ( not ( = ?auto_271179 ?auto_271182 ) ) ( not ( = ?auto_271180 ?auto_271181 ) ) ( not ( = ?auto_271180 ?auto_271182 ) ) ( not ( = ?auto_271181 ?auto_271182 ) ) ( ON ?auto_271180 ?auto_271181 ) ( ON ?auto_271179 ?auto_271180 ) ( ON ?auto_271178 ?auto_271179 ) ( ON ?auto_271177 ?auto_271178 ) ( ON ?auto_271176 ?auto_271177 ) ( ON ?auto_271175 ?auto_271176 ) ( ON ?auto_271174 ?auto_271175 ) ( CLEAR ?auto_271172 ) ( ON ?auto_271173 ?auto_271174 ) ( CLEAR ?auto_271173 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_271169 ?auto_271170 ?auto_271171 ?auto_271172 ?auto_271173 )
      ( MAKE-13PILE ?auto_271169 ?auto_271170 ?auto_271171 ?auto_271172 ?auto_271173 ?auto_271174 ?auto_271175 ?auto_271176 ?auto_271177 ?auto_271178 ?auto_271179 ?auto_271180 ?auto_271181 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_271196 - BLOCK
      ?auto_271197 - BLOCK
      ?auto_271198 - BLOCK
      ?auto_271199 - BLOCK
      ?auto_271200 - BLOCK
      ?auto_271201 - BLOCK
      ?auto_271202 - BLOCK
      ?auto_271203 - BLOCK
      ?auto_271204 - BLOCK
      ?auto_271205 - BLOCK
      ?auto_271206 - BLOCK
      ?auto_271207 - BLOCK
      ?auto_271208 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_271208 ) ( ON-TABLE ?auto_271196 ) ( ON ?auto_271197 ?auto_271196 ) ( ON ?auto_271198 ?auto_271197 ) ( ON ?auto_271199 ?auto_271198 ) ( not ( = ?auto_271196 ?auto_271197 ) ) ( not ( = ?auto_271196 ?auto_271198 ) ) ( not ( = ?auto_271196 ?auto_271199 ) ) ( not ( = ?auto_271196 ?auto_271200 ) ) ( not ( = ?auto_271196 ?auto_271201 ) ) ( not ( = ?auto_271196 ?auto_271202 ) ) ( not ( = ?auto_271196 ?auto_271203 ) ) ( not ( = ?auto_271196 ?auto_271204 ) ) ( not ( = ?auto_271196 ?auto_271205 ) ) ( not ( = ?auto_271196 ?auto_271206 ) ) ( not ( = ?auto_271196 ?auto_271207 ) ) ( not ( = ?auto_271196 ?auto_271208 ) ) ( not ( = ?auto_271197 ?auto_271198 ) ) ( not ( = ?auto_271197 ?auto_271199 ) ) ( not ( = ?auto_271197 ?auto_271200 ) ) ( not ( = ?auto_271197 ?auto_271201 ) ) ( not ( = ?auto_271197 ?auto_271202 ) ) ( not ( = ?auto_271197 ?auto_271203 ) ) ( not ( = ?auto_271197 ?auto_271204 ) ) ( not ( = ?auto_271197 ?auto_271205 ) ) ( not ( = ?auto_271197 ?auto_271206 ) ) ( not ( = ?auto_271197 ?auto_271207 ) ) ( not ( = ?auto_271197 ?auto_271208 ) ) ( not ( = ?auto_271198 ?auto_271199 ) ) ( not ( = ?auto_271198 ?auto_271200 ) ) ( not ( = ?auto_271198 ?auto_271201 ) ) ( not ( = ?auto_271198 ?auto_271202 ) ) ( not ( = ?auto_271198 ?auto_271203 ) ) ( not ( = ?auto_271198 ?auto_271204 ) ) ( not ( = ?auto_271198 ?auto_271205 ) ) ( not ( = ?auto_271198 ?auto_271206 ) ) ( not ( = ?auto_271198 ?auto_271207 ) ) ( not ( = ?auto_271198 ?auto_271208 ) ) ( not ( = ?auto_271199 ?auto_271200 ) ) ( not ( = ?auto_271199 ?auto_271201 ) ) ( not ( = ?auto_271199 ?auto_271202 ) ) ( not ( = ?auto_271199 ?auto_271203 ) ) ( not ( = ?auto_271199 ?auto_271204 ) ) ( not ( = ?auto_271199 ?auto_271205 ) ) ( not ( = ?auto_271199 ?auto_271206 ) ) ( not ( = ?auto_271199 ?auto_271207 ) ) ( not ( = ?auto_271199 ?auto_271208 ) ) ( not ( = ?auto_271200 ?auto_271201 ) ) ( not ( = ?auto_271200 ?auto_271202 ) ) ( not ( = ?auto_271200 ?auto_271203 ) ) ( not ( = ?auto_271200 ?auto_271204 ) ) ( not ( = ?auto_271200 ?auto_271205 ) ) ( not ( = ?auto_271200 ?auto_271206 ) ) ( not ( = ?auto_271200 ?auto_271207 ) ) ( not ( = ?auto_271200 ?auto_271208 ) ) ( not ( = ?auto_271201 ?auto_271202 ) ) ( not ( = ?auto_271201 ?auto_271203 ) ) ( not ( = ?auto_271201 ?auto_271204 ) ) ( not ( = ?auto_271201 ?auto_271205 ) ) ( not ( = ?auto_271201 ?auto_271206 ) ) ( not ( = ?auto_271201 ?auto_271207 ) ) ( not ( = ?auto_271201 ?auto_271208 ) ) ( not ( = ?auto_271202 ?auto_271203 ) ) ( not ( = ?auto_271202 ?auto_271204 ) ) ( not ( = ?auto_271202 ?auto_271205 ) ) ( not ( = ?auto_271202 ?auto_271206 ) ) ( not ( = ?auto_271202 ?auto_271207 ) ) ( not ( = ?auto_271202 ?auto_271208 ) ) ( not ( = ?auto_271203 ?auto_271204 ) ) ( not ( = ?auto_271203 ?auto_271205 ) ) ( not ( = ?auto_271203 ?auto_271206 ) ) ( not ( = ?auto_271203 ?auto_271207 ) ) ( not ( = ?auto_271203 ?auto_271208 ) ) ( not ( = ?auto_271204 ?auto_271205 ) ) ( not ( = ?auto_271204 ?auto_271206 ) ) ( not ( = ?auto_271204 ?auto_271207 ) ) ( not ( = ?auto_271204 ?auto_271208 ) ) ( not ( = ?auto_271205 ?auto_271206 ) ) ( not ( = ?auto_271205 ?auto_271207 ) ) ( not ( = ?auto_271205 ?auto_271208 ) ) ( not ( = ?auto_271206 ?auto_271207 ) ) ( not ( = ?auto_271206 ?auto_271208 ) ) ( not ( = ?auto_271207 ?auto_271208 ) ) ( ON ?auto_271207 ?auto_271208 ) ( ON ?auto_271206 ?auto_271207 ) ( ON ?auto_271205 ?auto_271206 ) ( ON ?auto_271204 ?auto_271205 ) ( ON ?auto_271203 ?auto_271204 ) ( ON ?auto_271202 ?auto_271203 ) ( ON ?auto_271201 ?auto_271202 ) ( CLEAR ?auto_271199 ) ( ON ?auto_271200 ?auto_271201 ) ( CLEAR ?auto_271200 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_271196 ?auto_271197 ?auto_271198 ?auto_271199 ?auto_271200 )
      ( MAKE-13PILE ?auto_271196 ?auto_271197 ?auto_271198 ?auto_271199 ?auto_271200 ?auto_271201 ?auto_271202 ?auto_271203 ?auto_271204 ?auto_271205 ?auto_271206 ?auto_271207 ?auto_271208 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_271222 - BLOCK
      ?auto_271223 - BLOCK
      ?auto_271224 - BLOCK
      ?auto_271225 - BLOCK
      ?auto_271226 - BLOCK
      ?auto_271227 - BLOCK
      ?auto_271228 - BLOCK
      ?auto_271229 - BLOCK
      ?auto_271230 - BLOCK
      ?auto_271231 - BLOCK
      ?auto_271232 - BLOCK
      ?auto_271233 - BLOCK
      ?auto_271234 - BLOCK
    )
    :vars
    (
      ?auto_271235 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_271234 ?auto_271235 ) ( ON-TABLE ?auto_271222 ) ( ON ?auto_271223 ?auto_271222 ) ( ON ?auto_271224 ?auto_271223 ) ( not ( = ?auto_271222 ?auto_271223 ) ) ( not ( = ?auto_271222 ?auto_271224 ) ) ( not ( = ?auto_271222 ?auto_271225 ) ) ( not ( = ?auto_271222 ?auto_271226 ) ) ( not ( = ?auto_271222 ?auto_271227 ) ) ( not ( = ?auto_271222 ?auto_271228 ) ) ( not ( = ?auto_271222 ?auto_271229 ) ) ( not ( = ?auto_271222 ?auto_271230 ) ) ( not ( = ?auto_271222 ?auto_271231 ) ) ( not ( = ?auto_271222 ?auto_271232 ) ) ( not ( = ?auto_271222 ?auto_271233 ) ) ( not ( = ?auto_271222 ?auto_271234 ) ) ( not ( = ?auto_271222 ?auto_271235 ) ) ( not ( = ?auto_271223 ?auto_271224 ) ) ( not ( = ?auto_271223 ?auto_271225 ) ) ( not ( = ?auto_271223 ?auto_271226 ) ) ( not ( = ?auto_271223 ?auto_271227 ) ) ( not ( = ?auto_271223 ?auto_271228 ) ) ( not ( = ?auto_271223 ?auto_271229 ) ) ( not ( = ?auto_271223 ?auto_271230 ) ) ( not ( = ?auto_271223 ?auto_271231 ) ) ( not ( = ?auto_271223 ?auto_271232 ) ) ( not ( = ?auto_271223 ?auto_271233 ) ) ( not ( = ?auto_271223 ?auto_271234 ) ) ( not ( = ?auto_271223 ?auto_271235 ) ) ( not ( = ?auto_271224 ?auto_271225 ) ) ( not ( = ?auto_271224 ?auto_271226 ) ) ( not ( = ?auto_271224 ?auto_271227 ) ) ( not ( = ?auto_271224 ?auto_271228 ) ) ( not ( = ?auto_271224 ?auto_271229 ) ) ( not ( = ?auto_271224 ?auto_271230 ) ) ( not ( = ?auto_271224 ?auto_271231 ) ) ( not ( = ?auto_271224 ?auto_271232 ) ) ( not ( = ?auto_271224 ?auto_271233 ) ) ( not ( = ?auto_271224 ?auto_271234 ) ) ( not ( = ?auto_271224 ?auto_271235 ) ) ( not ( = ?auto_271225 ?auto_271226 ) ) ( not ( = ?auto_271225 ?auto_271227 ) ) ( not ( = ?auto_271225 ?auto_271228 ) ) ( not ( = ?auto_271225 ?auto_271229 ) ) ( not ( = ?auto_271225 ?auto_271230 ) ) ( not ( = ?auto_271225 ?auto_271231 ) ) ( not ( = ?auto_271225 ?auto_271232 ) ) ( not ( = ?auto_271225 ?auto_271233 ) ) ( not ( = ?auto_271225 ?auto_271234 ) ) ( not ( = ?auto_271225 ?auto_271235 ) ) ( not ( = ?auto_271226 ?auto_271227 ) ) ( not ( = ?auto_271226 ?auto_271228 ) ) ( not ( = ?auto_271226 ?auto_271229 ) ) ( not ( = ?auto_271226 ?auto_271230 ) ) ( not ( = ?auto_271226 ?auto_271231 ) ) ( not ( = ?auto_271226 ?auto_271232 ) ) ( not ( = ?auto_271226 ?auto_271233 ) ) ( not ( = ?auto_271226 ?auto_271234 ) ) ( not ( = ?auto_271226 ?auto_271235 ) ) ( not ( = ?auto_271227 ?auto_271228 ) ) ( not ( = ?auto_271227 ?auto_271229 ) ) ( not ( = ?auto_271227 ?auto_271230 ) ) ( not ( = ?auto_271227 ?auto_271231 ) ) ( not ( = ?auto_271227 ?auto_271232 ) ) ( not ( = ?auto_271227 ?auto_271233 ) ) ( not ( = ?auto_271227 ?auto_271234 ) ) ( not ( = ?auto_271227 ?auto_271235 ) ) ( not ( = ?auto_271228 ?auto_271229 ) ) ( not ( = ?auto_271228 ?auto_271230 ) ) ( not ( = ?auto_271228 ?auto_271231 ) ) ( not ( = ?auto_271228 ?auto_271232 ) ) ( not ( = ?auto_271228 ?auto_271233 ) ) ( not ( = ?auto_271228 ?auto_271234 ) ) ( not ( = ?auto_271228 ?auto_271235 ) ) ( not ( = ?auto_271229 ?auto_271230 ) ) ( not ( = ?auto_271229 ?auto_271231 ) ) ( not ( = ?auto_271229 ?auto_271232 ) ) ( not ( = ?auto_271229 ?auto_271233 ) ) ( not ( = ?auto_271229 ?auto_271234 ) ) ( not ( = ?auto_271229 ?auto_271235 ) ) ( not ( = ?auto_271230 ?auto_271231 ) ) ( not ( = ?auto_271230 ?auto_271232 ) ) ( not ( = ?auto_271230 ?auto_271233 ) ) ( not ( = ?auto_271230 ?auto_271234 ) ) ( not ( = ?auto_271230 ?auto_271235 ) ) ( not ( = ?auto_271231 ?auto_271232 ) ) ( not ( = ?auto_271231 ?auto_271233 ) ) ( not ( = ?auto_271231 ?auto_271234 ) ) ( not ( = ?auto_271231 ?auto_271235 ) ) ( not ( = ?auto_271232 ?auto_271233 ) ) ( not ( = ?auto_271232 ?auto_271234 ) ) ( not ( = ?auto_271232 ?auto_271235 ) ) ( not ( = ?auto_271233 ?auto_271234 ) ) ( not ( = ?auto_271233 ?auto_271235 ) ) ( not ( = ?auto_271234 ?auto_271235 ) ) ( ON ?auto_271233 ?auto_271234 ) ( ON ?auto_271232 ?auto_271233 ) ( ON ?auto_271231 ?auto_271232 ) ( ON ?auto_271230 ?auto_271231 ) ( ON ?auto_271229 ?auto_271230 ) ( ON ?auto_271228 ?auto_271229 ) ( ON ?auto_271227 ?auto_271228 ) ( ON ?auto_271226 ?auto_271227 ) ( CLEAR ?auto_271224 ) ( ON ?auto_271225 ?auto_271226 ) ( CLEAR ?auto_271225 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_271222 ?auto_271223 ?auto_271224 ?auto_271225 )
      ( MAKE-13PILE ?auto_271222 ?auto_271223 ?auto_271224 ?auto_271225 ?auto_271226 ?auto_271227 ?auto_271228 ?auto_271229 ?auto_271230 ?auto_271231 ?auto_271232 ?auto_271233 ?auto_271234 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_271249 - BLOCK
      ?auto_271250 - BLOCK
      ?auto_271251 - BLOCK
      ?auto_271252 - BLOCK
      ?auto_271253 - BLOCK
      ?auto_271254 - BLOCK
      ?auto_271255 - BLOCK
      ?auto_271256 - BLOCK
      ?auto_271257 - BLOCK
      ?auto_271258 - BLOCK
      ?auto_271259 - BLOCK
      ?auto_271260 - BLOCK
      ?auto_271261 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_271261 ) ( ON-TABLE ?auto_271249 ) ( ON ?auto_271250 ?auto_271249 ) ( ON ?auto_271251 ?auto_271250 ) ( not ( = ?auto_271249 ?auto_271250 ) ) ( not ( = ?auto_271249 ?auto_271251 ) ) ( not ( = ?auto_271249 ?auto_271252 ) ) ( not ( = ?auto_271249 ?auto_271253 ) ) ( not ( = ?auto_271249 ?auto_271254 ) ) ( not ( = ?auto_271249 ?auto_271255 ) ) ( not ( = ?auto_271249 ?auto_271256 ) ) ( not ( = ?auto_271249 ?auto_271257 ) ) ( not ( = ?auto_271249 ?auto_271258 ) ) ( not ( = ?auto_271249 ?auto_271259 ) ) ( not ( = ?auto_271249 ?auto_271260 ) ) ( not ( = ?auto_271249 ?auto_271261 ) ) ( not ( = ?auto_271250 ?auto_271251 ) ) ( not ( = ?auto_271250 ?auto_271252 ) ) ( not ( = ?auto_271250 ?auto_271253 ) ) ( not ( = ?auto_271250 ?auto_271254 ) ) ( not ( = ?auto_271250 ?auto_271255 ) ) ( not ( = ?auto_271250 ?auto_271256 ) ) ( not ( = ?auto_271250 ?auto_271257 ) ) ( not ( = ?auto_271250 ?auto_271258 ) ) ( not ( = ?auto_271250 ?auto_271259 ) ) ( not ( = ?auto_271250 ?auto_271260 ) ) ( not ( = ?auto_271250 ?auto_271261 ) ) ( not ( = ?auto_271251 ?auto_271252 ) ) ( not ( = ?auto_271251 ?auto_271253 ) ) ( not ( = ?auto_271251 ?auto_271254 ) ) ( not ( = ?auto_271251 ?auto_271255 ) ) ( not ( = ?auto_271251 ?auto_271256 ) ) ( not ( = ?auto_271251 ?auto_271257 ) ) ( not ( = ?auto_271251 ?auto_271258 ) ) ( not ( = ?auto_271251 ?auto_271259 ) ) ( not ( = ?auto_271251 ?auto_271260 ) ) ( not ( = ?auto_271251 ?auto_271261 ) ) ( not ( = ?auto_271252 ?auto_271253 ) ) ( not ( = ?auto_271252 ?auto_271254 ) ) ( not ( = ?auto_271252 ?auto_271255 ) ) ( not ( = ?auto_271252 ?auto_271256 ) ) ( not ( = ?auto_271252 ?auto_271257 ) ) ( not ( = ?auto_271252 ?auto_271258 ) ) ( not ( = ?auto_271252 ?auto_271259 ) ) ( not ( = ?auto_271252 ?auto_271260 ) ) ( not ( = ?auto_271252 ?auto_271261 ) ) ( not ( = ?auto_271253 ?auto_271254 ) ) ( not ( = ?auto_271253 ?auto_271255 ) ) ( not ( = ?auto_271253 ?auto_271256 ) ) ( not ( = ?auto_271253 ?auto_271257 ) ) ( not ( = ?auto_271253 ?auto_271258 ) ) ( not ( = ?auto_271253 ?auto_271259 ) ) ( not ( = ?auto_271253 ?auto_271260 ) ) ( not ( = ?auto_271253 ?auto_271261 ) ) ( not ( = ?auto_271254 ?auto_271255 ) ) ( not ( = ?auto_271254 ?auto_271256 ) ) ( not ( = ?auto_271254 ?auto_271257 ) ) ( not ( = ?auto_271254 ?auto_271258 ) ) ( not ( = ?auto_271254 ?auto_271259 ) ) ( not ( = ?auto_271254 ?auto_271260 ) ) ( not ( = ?auto_271254 ?auto_271261 ) ) ( not ( = ?auto_271255 ?auto_271256 ) ) ( not ( = ?auto_271255 ?auto_271257 ) ) ( not ( = ?auto_271255 ?auto_271258 ) ) ( not ( = ?auto_271255 ?auto_271259 ) ) ( not ( = ?auto_271255 ?auto_271260 ) ) ( not ( = ?auto_271255 ?auto_271261 ) ) ( not ( = ?auto_271256 ?auto_271257 ) ) ( not ( = ?auto_271256 ?auto_271258 ) ) ( not ( = ?auto_271256 ?auto_271259 ) ) ( not ( = ?auto_271256 ?auto_271260 ) ) ( not ( = ?auto_271256 ?auto_271261 ) ) ( not ( = ?auto_271257 ?auto_271258 ) ) ( not ( = ?auto_271257 ?auto_271259 ) ) ( not ( = ?auto_271257 ?auto_271260 ) ) ( not ( = ?auto_271257 ?auto_271261 ) ) ( not ( = ?auto_271258 ?auto_271259 ) ) ( not ( = ?auto_271258 ?auto_271260 ) ) ( not ( = ?auto_271258 ?auto_271261 ) ) ( not ( = ?auto_271259 ?auto_271260 ) ) ( not ( = ?auto_271259 ?auto_271261 ) ) ( not ( = ?auto_271260 ?auto_271261 ) ) ( ON ?auto_271260 ?auto_271261 ) ( ON ?auto_271259 ?auto_271260 ) ( ON ?auto_271258 ?auto_271259 ) ( ON ?auto_271257 ?auto_271258 ) ( ON ?auto_271256 ?auto_271257 ) ( ON ?auto_271255 ?auto_271256 ) ( ON ?auto_271254 ?auto_271255 ) ( ON ?auto_271253 ?auto_271254 ) ( CLEAR ?auto_271251 ) ( ON ?auto_271252 ?auto_271253 ) ( CLEAR ?auto_271252 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_271249 ?auto_271250 ?auto_271251 ?auto_271252 )
      ( MAKE-13PILE ?auto_271249 ?auto_271250 ?auto_271251 ?auto_271252 ?auto_271253 ?auto_271254 ?auto_271255 ?auto_271256 ?auto_271257 ?auto_271258 ?auto_271259 ?auto_271260 ?auto_271261 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_271275 - BLOCK
      ?auto_271276 - BLOCK
      ?auto_271277 - BLOCK
      ?auto_271278 - BLOCK
      ?auto_271279 - BLOCK
      ?auto_271280 - BLOCK
      ?auto_271281 - BLOCK
      ?auto_271282 - BLOCK
      ?auto_271283 - BLOCK
      ?auto_271284 - BLOCK
      ?auto_271285 - BLOCK
      ?auto_271286 - BLOCK
      ?auto_271287 - BLOCK
    )
    :vars
    (
      ?auto_271288 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_271287 ?auto_271288 ) ( ON-TABLE ?auto_271275 ) ( ON ?auto_271276 ?auto_271275 ) ( not ( = ?auto_271275 ?auto_271276 ) ) ( not ( = ?auto_271275 ?auto_271277 ) ) ( not ( = ?auto_271275 ?auto_271278 ) ) ( not ( = ?auto_271275 ?auto_271279 ) ) ( not ( = ?auto_271275 ?auto_271280 ) ) ( not ( = ?auto_271275 ?auto_271281 ) ) ( not ( = ?auto_271275 ?auto_271282 ) ) ( not ( = ?auto_271275 ?auto_271283 ) ) ( not ( = ?auto_271275 ?auto_271284 ) ) ( not ( = ?auto_271275 ?auto_271285 ) ) ( not ( = ?auto_271275 ?auto_271286 ) ) ( not ( = ?auto_271275 ?auto_271287 ) ) ( not ( = ?auto_271275 ?auto_271288 ) ) ( not ( = ?auto_271276 ?auto_271277 ) ) ( not ( = ?auto_271276 ?auto_271278 ) ) ( not ( = ?auto_271276 ?auto_271279 ) ) ( not ( = ?auto_271276 ?auto_271280 ) ) ( not ( = ?auto_271276 ?auto_271281 ) ) ( not ( = ?auto_271276 ?auto_271282 ) ) ( not ( = ?auto_271276 ?auto_271283 ) ) ( not ( = ?auto_271276 ?auto_271284 ) ) ( not ( = ?auto_271276 ?auto_271285 ) ) ( not ( = ?auto_271276 ?auto_271286 ) ) ( not ( = ?auto_271276 ?auto_271287 ) ) ( not ( = ?auto_271276 ?auto_271288 ) ) ( not ( = ?auto_271277 ?auto_271278 ) ) ( not ( = ?auto_271277 ?auto_271279 ) ) ( not ( = ?auto_271277 ?auto_271280 ) ) ( not ( = ?auto_271277 ?auto_271281 ) ) ( not ( = ?auto_271277 ?auto_271282 ) ) ( not ( = ?auto_271277 ?auto_271283 ) ) ( not ( = ?auto_271277 ?auto_271284 ) ) ( not ( = ?auto_271277 ?auto_271285 ) ) ( not ( = ?auto_271277 ?auto_271286 ) ) ( not ( = ?auto_271277 ?auto_271287 ) ) ( not ( = ?auto_271277 ?auto_271288 ) ) ( not ( = ?auto_271278 ?auto_271279 ) ) ( not ( = ?auto_271278 ?auto_271280 ) ) ( not ( = ?auto_271278 ?auto_271281 ) ) ( not ( = ?auto_271278 ?auto_271282 ) ) ( not ( = ?auto_271278 ?auto_271283 ) ) ( not ( = ?auto_271278 ?auto_271284 ) ) ( not ( = ?auto_271278 ?auto_271285 ) ) ( not ( = ?auto_271278 ?auto_271286 ) ) ( not ( = ?auto_271278 ?auto_271287 ) ) ( not ( = ?auto_271278 ?auto_271288 ) ) ( not ( = ?auto_271279 ?auto_271280 ) ) ( not ( = ?auto_271279 ?auto_271281 ) ) ( not ( = ?auto_271279 ?auto_271282 ) ) ( not ( = ?auto_271279 ?auto_271283 ) ) ( not ( = ?auto_271279 ?auto_271284 ) ) ( not ( = ?auto_271279 ?auto_271285 ) ) ( not ( = ?auto_271279 ?auto_271286 ) ) ( not ( = ?auto_271279 ?auto_271287 ) ) ( not ( = ?auto_271279 ?auto_271288 ) ) ( not ( = ?auto_271280 ?auto_271281 ) ) ( not ( = ?auto_271280 ?auto_271282 ) ) ( not ( = ?auto_271280 ?auto_271283 ) ) ( not ( = ?auto_271280 ?auto_271284 ) ) ( not ( = ?auto_271280 ?auto_271285 ) ) ( not ( = ?auto_271280 ?auto_271286 ) ) ( not ( = ?auto_271280 ?auto_271287 ) ) ( not ( = ?auto_271280 ?auto_271288 ) ) ( not ( = ?auto_271281 ?auto_271282 ) ) ( not ( = ?auto_271281 ?auto_271283 ) ) ( not ( = ?auto_271281 ?auto_271284 ) ) ( not ( = ?auto_271281 ?auto_271285 ) ) ( not ( = ?auto_271281 ?auto_271286 ) ) ( not ( = ?auto_271281 ?auto_271287 ) ) ( not ( = ?auto_271281 ?auto_271288 ) ) ( not ( = ?auto_271282 ?auto_271283 ) ) ( not ( = ?auto_271282 ?auto_271284 ) ) ( not ( = ?auto_271282 ?auto_271285 ) ) ( not ( = ?auto_271282 ?auto_271286 ) ) ( not ( = ?auto_271282 ?auto_271287 ) ) ( not ( = ?auto_271282 ?auto_271288 ) ) ( not ( = ?auto_271283 ?auto_271284 ) ) ( not ( = ?auto_271283 ?auto_271285 ) ) ( not ( = ?auto_271283 ?auto_271286 ) ) ( not ( = ?auto_271283 ?auto_271287 ) ) ( not ( = ?auto_271283 ?auto_271288 ) ) ( not ( = ?auto_271284 ?auto_271285 ) ) ( not ( = ?auto_271284 ?auto_271286 ) ) ( not ( = ?auto_271284 ?auto_271287 ) ) ( not ( = ?auto_271284 ?auto_271288 ) ) ( not ( = ?auto_271285 ?auto_271286 ) ) ( not ( = ?auto_271285 ?auto_271287 ) ) ( not ( = ?auto_271285 ?auto_271288 ) ) ( not ( = ?auto_271286 ?auto_271287 ) ) ( not ( = ?auto_271286 ?auto_271288 ) ) ( not ( = ?auto_271287 ?auto_271288 ) ) ( ON ?auto_271286 ?auto_271287 ) ( ON ?auto_271285 ?auto_271286 ) ( ON ?auto_271284 ?auto_271285 ) ( ON ?auto_271283 ?auto_271284 ) ( ON ?auto_271282 ?auto_271283 ) ( ON ?auto_271281 ?auto_271282 ) ( ON ?auto_271280 ?auto_271281 ) ( ON ?auto_271279 ?auto_271280 ) ( ON ?auto_271278 ?auto_271279 ) ( CLEAR ?auto_271276 ) ( ON ?auto_271277 ?auto_271278 ) ( CLEAR ?auto_271277 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_271275 ?auto_271276 ?auto_271277 )
      ( MAKE-13PILE ?auto_271275 ?auto_271276 ?auto_271277 ?auto_271278 ?auto_271279 ?auto_271280 ?auto_271281 ?auto_271282 ?auto_271283 ?auto_271284 ?auto_271285 ?auto_271286 ?auto_271287 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_271302 - BLOCK
      ?auto_271303 - BLOCK
      ?auto_271304 - BLOCK
      ?auto_271305 - BLOCK
      ?auto_271306 - BLOCK
      ?auto_271307 - BLOCK
      ?auto_271308 - BLOCK
      ?auto_271309 - BLOCK
      ?auto_271310 - BLOCK
      ?auto_271311 - BLOCK
      ?auto_271312 - BLOCK
      ?auto_271313 - BLOCK
      ?auto_271314 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_271314 ) ( ON-TABLE ?auto_271302 ) ( ON ?auto_271303 ?auto_271302 ) ( not ( = ?auto_271302 ?auto_271303 ) ) ( not ( = ?auto_271302 ?auto_271304 ) ) ( not ( = ?auto_271302 ?auto_271305 ) ) ( not ( = ?auto_271302 ?auto_271306 ) ) ( not ( = ?auto_271302 ?auto_271307 ) ) ( not ( = ?auto_271302 ?auto_271308 ) ) ( not ( = ?auto_271302 ?auto_271309 ) ) ( not ( = ?auto_271302 ?auto_271310 ) ) ( not ( = ?auto_271302 ?auto_271311 ) ) ( not ( = ?auto_271302 ?auto_271312 ) ) ( not ( = ?auto_271302 ?auto_271313 ) ) ( not ( = ?auto_271302 ?auto_271314 ) ) ( not ( = ?auto_271303 ?auto_271304 ) ) ( not ( = ?auto_271303 ?auto_271305 ) ) ( not ( = ?auto_271303 ?auto_271306 ) ) ( not ( = ?auto_271303 ?auto_271307 ) ) ( not ( = ?auto_271303 ?auto_271308 ) ) ( not ( = ?auto_271303 ?auto_271309 ) ) ( not ( = ?auto_271303 ?auto_271310 ) ) ( not ( = ?auto_271303 ?auto_271311 ) ) ( not ( = ?auto_271303 ?auto_271312 ) ) ( not ( = ?auto_271303 ?auto_271313 ) ) ( not ( = ?auto_271303 ?auto_271314 ) ) ( not ( = ?auto_271304 ?auto_271305 ) ) ( not ( = ?auto_271304 ?auto_271306 ) ) ( not ( = ?auto_271304 ?auto_271307 ) ) ( not ( = ?auto_271304 ?auto_271308 ) ) ( not ( = ?auto_271304 ?auto_271309 ) ) ( not ( = ?auto_271304 ?auto_271310 ) ) ( not ( = ?auto_271304 ?auto_271311 ) ) ( not ( = ?auto_271304 ?auto_271312 ) ) ( not ( = ?auto_271304 ?auto_271313 ) ) ( not ( = ?auto_271304 ?auto_271314 ) ) ( not ( = ?auto_271305 ?auto_271306 ) ) ( not ( = ?auto_271305 ?auto_271307 ) ) ( not ( = ?auto_271305 ?auto_271308 ) ) ( not ( = ?auto_271305 ?auto_271309 ) ) ( not ( = ?auto_271305 ?auto_271310 ) ) ( not ( = ?auto_271305 ?auto_271311 ) ) ( not ( = ?auto_271305 ?auto_271312 ) ) ( not ( = ?auto_271305 ?auto_271313 ) ) ( not ( = ?auto_271305 ?auto_271314 ) ) ( not ( = ?auto_271306 ?auto_271307 ) ) ( not ( = ?auto_271306 ?auto_271308 ) ) ( not ( = ?auto_271306 ?auto_271309 ) ) ( not ( = ?auto_271306 ?auto_271310 ) ) ( not ( = ?auto_271306 ?auto_271311 ) ) ( not ( = ?auto_271306 ?auto_271312 ) ) ( not ( = ?auto_271306 ?auto_271313 ) ) ( not ( = ?auto_271306 ?auto_271314 ) ) ( not ( = ?auto_271307 ?auto_271308 ) ) ( not ( = ?auto_271307 ?auto_271309 ) ) ( not ( = ?auto_271307 ?auto_271310 ) ) ( not ( = ?auto_271307 ?auto_271311 ) ) ( not ( = ?auto_271307 ?auto_271312 ) ) ( not ( = ?auto_271307 ?auto_271313 ) ) ( not ( = ?auto_271307 ?auto_271314 ) ) ( not ( = ?auto_271308 ?auto_271309 ) ) ( not ( = ?auto_271308 ?auto_271310 ) ) ( not ( = ?auto_271308 ?auto_271311 ) ) ( not ( = ?auto_271308 ?auto_271312 ) ) ( not ( = ?auto_271308 ?auto_271313 ) ) ( not ( = ?auto_271308 ?auto_271314 ) ) ( not ( = ?auto_271309 ?auto_271310 ) ) ( not ( = ?auto_271309 ?auto_271311 ) ) ( not ( = ?auto_271309 ?auto_271312 ) ) ( not ( = ?auto_271309 ?auto_271313 ) ) ( not ( = ?auto_271309 ?auto_271314 ) ) ( not ( = ?auto_271310 ?auto_271311 ) ) ( not ( = ?auto_271310 ?auto_271312 ) ) ( not ( = ?auto_271310 ?auto_271313 ) ) ( not ( = ?auto_271310 ?auto_271314 ) ) ( not ( = ?auto_271311 ?auto_271312 ) ) ( not ( = ?auto_271311 ?auto_271313 ) ) ( not ( = ?auto_271311 ?auto_271314 ) ) ( not ( = ?auto_271312 ?auto_271313 ) ) ( not ( = ?auto_271312 ?auto_271314 ) ) ( not ( = ?auto_271313 ?auto_271314 ) ) ( ON ?auto_271313 ?auto_271314 ) ( ON ?auto_271312 ?auto_271313 ) ( ON ?auto_271311 ?auto_271312 ) ( ON ?auto_271310 ?auto_271311 ) ( ON ?auto_271309 ?auto_271310 ) ( ON ?auto_271308 ?auto_271309 ) ( ON ?auto_271307 ?auto_271308 ) ( ON ?auto_271306 ?auto_271307 ) ( ON ?auto_271305 ?auto_271306 ) ( CLEAR ?auto_271303 ) ( ON ?auto_271304 ?auto_271305 ) ( CLEAR ?auto_271304 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_271302 ?auto_271303 ?auto_271304 )
      ( MAKE-13PILE ?auto_271302 ?auto_271303 ?auto_271304 ?auto_271305 ?auto_271306 ?auto_271307 ?auto_271308 ?auto_271309 ?auto_271310 ?auto_271311 ?auto_271312 ?auto_271313 ?auto_271314 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_271328 - BLOCK
      ?auto_271329 - BLOCK
      ?auto_271330 - BLOCK
      ?auto_271331 - BLOCK
      ?auto_271332 - BLOCK
      ?auto_271333 - BLOCK
      ?auto_271334 - BLOCK
      ?auto_271335 - BLOCK
      ?auto_271336 - BLOCK
      ?auto_271337 - BLOCK
      ?auto_271338 - BLOCK
      ?auto_271339 - BLOCK
      ?auto_271340 - BLOCK
    )
    :vars
    (
      ?auto_271341 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_271340 ?auto_271341 ) ( ON-TABLE ?auto_271328 ) ( not ( = ?auto_271328 ?auto_271329 ) ) ( not ( = ?auto_271328 ?auto_271330 ) ) ( not ( = ?auto_271328 ?auto_271331 ) ) ( not ( = ?auto_271328 ?auto_271332 ) ) ( not ( = ?auto_271328 ?auto_271333 ) ) ( not ( = ?auto_271328 ?auto_271334 ) ) ( not ( = ?auto_271328 ?auto_271335 ) ) ( not ( = ?auto_271328 ?auto_271336 ) ) ( not ( = ?auto_271328 ?auto_271337 ) ) ( not ( = ?auto_271328 ?auto_271338 ) ) ( not ( = ?auto_271328 ?auto_271339 ) ) ( not ( = ?auto_271328 ?auto_271340 ) ) ( not ( = ?auto_271328 ?auto_271341 ) ) ( not ( = ?auto_271329 ?auto_271330 ) ) ( not ( = ?auto_271329 ?auto_271331 ) ) ( not ( = ?auto_271329 ?auto_271332 ) ) ( not ( = ?auto_271329 ?auto_271333 ) ) ( not ( = ?auto_271329 ?auto_271334 ) ) ( not ( = ?auto_271329 ?auto_271335 ) ) ( not ( = ?auto_271329 ?auto_271336 ) ) ( not ( = ?auto_271329 ?auto_271337 ) ) ( not ( = ?auto_271329 ?auto_271338 ) ) ( not ( = ?auto_271329 ?auto_271339 ) ) ( not ( = ?auto_271329 ?auto_271340 ) ) ( not ( = ?auto_271329 ?auto_271341 ) ) ( not ( = ?auto_271330 ?auto_271331 ) ) ( not ( = ?auto_271330 ?auto_271332 ) ) ( not ( = ?auto_271330 ?auto_271333 ) ) ( not ( = ?auto_271330 ?auto_271334 ) ) ( not ( = ?auto_271330 ?auto_271335 ) ) ( not ( = ?auto_271330 ?auto_271336 ) ) ( not ( = ?auto_271330 ?auto_271337 ) ) ( not ( = ?auto_271330 ?auto_271338 ) ) ( not ( = ?auto_271330 ?auto_271339 ) ) ( not ( = ?auto_271330 ?auto_271340 ) ) ( not ( = ?auto_271330 ?auto_271341 ) ) ( not ( = ?auto_271331 ?auto_271332 ) ) ( not ( = ?auto_271331 ?auto_271333 ) ) ( not ( = ?auto_271331 ?auto_271334 ) ) ( not ( = ?auto_271331 ?auto_271335 ) ) ( not ( = ?auto_271331 ?auto_271336 ) ) ( not ( = ?auto_271331 ?auto_271337 ) ) ( not ( = ?auto_271331 ?auto_271338 ) ) ( not ( = ?auto_271331 ?auto_271339 ) ) ( not ( = ?auto_271331 ?auto_271340 ) ) ( not ( = ?auto_271331 ?auto_271341 ) ) ( not ( = ?auto_271332 ?auto_271333 ) ) ( not ( = ?auto_271332 ?auto_271334 ) ) ( not ( = ?auto_271332 ?auto_271335 ) ) ( not ( = ?auto_271332 ?auto_271336 ) ) ( not ( = ?auto_271332 ?auto_271337 ) ) ( not ( = ?auto_271332 ?auto_271338 ) ) ( not ( = ?auto_271332 ?auto_271339 ) ) ( not ( = ?auto_271332 ?auto_271340 ) ) ( not ( = ?auto_271332 ?auto_271341 ) ) ( not ( = ?auto_271333 ?auto_271334 ) ) ( not ( = ?auto_271333 ?auto_271335 ) ) ( not ( = ?auto_271333 ?auto_271336 ) ) ( not ( = ?auto_271333 ?auto_271337 ) ) ( not ( = ?auto_271333 ?auto_271338 ) ) ( not ( = ?auto_271333 ?auto_271339 ) ) ( not ( = ?auto_271333 ?auto_271340 ) ) ( not ( = ?auto_271333 ?auto_271341 ) ) ( not ( = ?auto_271334 ?auto_271335 ) ) ( not ( = ?auto_271334 ?auto_271336 ) ) ( not ( = ?auto_271334 ?auto_271337 ) ) ( not ( = ?auto_271334 ?auto_271338 ) ) ( not ( = ?auto_271334 ?auto_271339 ) ) ( not ( = ?auto_271334 ?auto_271340 ) ) ( not ( = ?auto_271334 ?auto_271341 ) ) ( not ( = ?auto_271335 ?auto_271336 ) ) ( not ( = ?auto_271335 ?auto_271337 ) ) ( not ( = ?auto_271335 ?auto_271338 ) ) ( not ( = ?auto_271335 ?auto_271339 ) ) ( not ( = ?auto_271335 ?auto_271340 ) ) ( not ( = ?auto_271335 ?auto_271341 ) ) ( not ( = ?auto_271336 ?auto_271337 ) ) ( not ( = ?auto_271336 ?auto_271338 ) ) ( not ( = ?auto_271336 ?auto_271339 ) ) ( not ( = ?auto_271336 ?auto_271340 ) ) ( not ( = ?auto_271336 ?auto_271341 ) ) ( not ( = ?auto_271337 ?auto_271338 ) ) ( not ( = ?auto_271337 ?auto_271339 ) ) ( not ( = ?auto_271337 ?auto_271340 ) ) ( not ( = ?auto_271337 ?auto_271341 ) ) ( not ( = ?auto_271338 ?auto_271339 ) ) ( not ( = ?auto_271338 ?auto_271340 ) ) ( not ( = ?auto_271338 ?auto_271341 ) ) ( not ( = ?auto_271339 ?auto_271340 ) ) ( not ( = ?auto_271339 ?auto_271341 ) ) ( not ( = ?auto_271340 ?auto_271341 ) ) ( ON ?auto_271339 ?auto_271340 ) ( ON ?auto_271338 ?auto_271339 ) ( ON ?auto_271337 ?auto_271338 ) ( ON ?auto_271336 ?auto_271337 ) ( ON ?auto_271335 ?auto_271336 ) ( ON ?auto_271334 ?auto_271335 ) ( ON ?auto_271333 ?auto_271334 ) ( ON ?auto_271332 ?auto_271333 ) ( ON ?auto_271331 ?auto_271332 ) ( ON ?auto_271330 ?auto_271331 ) ( CLEAR ?auto_271328 ) ( ON ?auto_271329 ?auto_271330 ) ( CLEAR ?auto_271329 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_271328 ?auto_271329 )
      ( MAKE-13PILE ?auto_271328 ?auto_271329 ?auto_271330 ?auto_271331 ?auto_271332 ?auto_271333 ?auto_271334 ?auto_271335 ?auto_271336 ?auto_271337 ?auto_271338 ?auto_271339 ?auto_271340 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_271355 - BLOCK
      ?auto_271356 - BLOCK
      ?auto_271357 - BLOCK
      ?auto_271358 - BLOCK
      ?auto_271359 - BLOCK
      ?auto_271360 - BLOCK
      ?auto_271361 - BLOCK
      ?auto_271362 - BLOCK
      ?auto_271363 - BLOCK
      ?auto_271364 - BLOCK
      ?auto_271365 - BLOCK
      ?auto_271366 - BLOCK
      ?auto_271367 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_271367 ) ( ON-TABLE ?auto_271355 ) ( not ( = ?auto_271355 ?auto_271356 ) ) ( not ( = ?auto_271355 ?auto_271357 ) ) ( not ( = ?auto_271355 ?auto_271358 ) ) ( not ( = ?auto_271355 ?auto_271359 ) ) ( not ( = ?auto_271355 ?auto_271360 ) ) ( not ( = ?auto_271355 ?auto_271361 ) ) ( not ( = ?auto_271355 ?auto_271362 ) ) ( not ( = ?auto_271355 ?auto_271363 ) ) ( not ( = ?auto_271355 ?auto_271364 ) ) ( not ( = ?auto_271355 ?auto_271365 ) ) ( not ( = ?auto_271355 ?auto_271366 ) ) ( not ( = ?auto_271355 ?auto_271367 ) ) ( not ( = ?auto_271356 ?auto_271357 ) ) ( not ( = ?auto_271356 ?auto_271358 ) ) ( not ( = ?auto_271356 ?auto_271359 ) ) ( not ( = ?auto_271356 ?auto_271360 ) ) ( not ( = ?auto_271356 ?auto_271361 ) ) ( not ( = ?auto_271356 ?auto_271362 ) ) ( not ( = ?auto_271356 ?auto_271363 ) ) ( not ( = ?auto_271356 ?auto_271364 ) ) ( not ( = ?auto_271356 ?auto_271365 ) ) ( not ( = ?auto_271356 ?auto_271366 ) ) ( not ( = ?auto_271356 ?auto_271367 ) ) ( not ( = ?auto_271357 ?auto_271358 ) ) ( not ( = ?auto_271357 ?auto_271359 ) ) ( not ( = ?auto_271357 ?auto_271360 ) ) ( not ( = ?auto_271357 ?auto_271361 ) ) ( not ( = ?auto_271357 ?auto_271362 ) ) ( not ( = ?auto_271357 ?auto_271363 ) ) ( not ( = ?auto_271357 ?auto_271364 ) ) ( not ( = ?auto_271357 ?auto_271365 ) ) ( not ( = ?auto_271357 ?auto_271366 ) ) ( not ( = ?auto_271357 ?auto_271367 ) ) ( not ( = ?auto_271358 ?auto_271359 ) ) ( not ( = ?auto_271358 ?auto_271360 ) ) ( not ( = ?auto_271358 ?auto_271361 ) ) ( not ( = ?auto_271358 ?auto_271362 ) ) ( not ( = ?auto_271358 ?auto_271363 ) ) ( not ( = ?auto_271358 ?auto_271364 ) ) ( not ( = ?auto_271358 ?auto_271365 ) ) ( not ( = ?auto_271358 ?auto_271366 ) ) ( not ( = ?auto_271358 ?auto_271367 ) ) ( not ( = ?auto_271359 ?auto_271360 ) ) ( not ( = ?auto_271359 ?auto_271361 ) ) ( not ( = ?auto_271359 ?auto_271362 ) ) ( not ( = ?auto_271359 ?auto_271363 ) ) ( not ( = ?auto_271359 ?auto_271364 ) ) ( not ( = ?auto_271359 ?auto_271365 ) ) ( not ( = ?auto_271359 ?auto_271366 ) ) ( not ( = ?auto_271359 ?auto_271367 ) ) ( not ( = ?auto_271360 ?auto_271361 ) ) ( not ( = ?auto_271360 ?auto_271362 ) ) ( not ( = ?auto_271360 ?auto_271363 ) ) ( not ( = ?auto_271360 ?auto_271364 ) ) ( not ( = ?auto_271360 ?auto_271365 ) ) ( not ( = ?auto_271360 ?auto_271366 ) ) ( not ( = ?auto_271360 ?auto_271367 ) ) ( not ( = ?auto_271361 ?auto_271362 ) ) ( not ( = ?auto_271361 ?auto_271363 ) ) ( not ( = ?auto_271361 ?auto_271364 ) ) ( not ( = ?auto_271361 ?auto_271365 ) ) ( not ( = ?auto_271361 ?auto_271366 ) ) ( not ( = ?auto_271361 ?auto_271367 ) ) ( not ( = ?auto_271362 ?auto_271363 ) ) ( not ( = ?auto_271362 ?auto_271364 ) ) ( not ( = ?auto_271362 ?auto_271365 ) ) ( not ( = ?auto_271362 ?auto_271366 ) ) ( not ( = ?auto_271362 ?auto_271367 ) ) ( not ( = ?auto_271363 ?auto_271364 ) ) ( not ( = ?auto_271363 ?auto_271365 ) ) ( not ( = ?auto_271363 ?auto_271366 ) ) ( not ( = ?auto_271363 ?auto_271367 ) ) ( not ( = ?auto_271364 ?auto_271365 ) ) ( not ( = ?auto_271364 ?auto_271366 ) ) ( not ( = ?auto_271364 ?auto_271367 ) ) ( not ( = ?auto_271365 ?auto_271366 ) ) ( not ( = ?auto_271365 ?auto_271367 ) ) ( not ( = ?auto_271366 ?auto_271367 ) ) ( ON ?auto_271366 ?auto_271367 ) ( ON ?auto_271365 ?auto_271366 ) ( ON ?auto_271364 ?auto_271365 ) ( ON ?auto_271363 ?auto_271364 ) ( ON ?auto_271362 ?auto_271363 ) ( ON ?auto_271361 ?auto_271362 ) ( ON ?auto_271360 ?auto_271361 ) ( ON ?auto_271359 ?auto_271360 ) ( ON ?auto_271358 ?auto_271359 ) ( ON ?auto_271357 ?auto_271358 ) ( CLEAR ?auto_271355 ) ( ON ?auto_271356 ?auto_271357 ) ( CLEAR ?auto_271356 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_271355 ?auto_271356 )
      ( MAKE-13PILE ?auto_271355 ?auto_271356 ?auto_271357 ?auto_271358 ?auto_271359 ?auto_271360 ?auto_271361 ?auto_271362 ?auto_271363 ?auto_271364 ?auto_271365 ?auto_271366 ?auto_271367 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_271381 - BLOCK
      ?auto_271382 - BLOCK
      ?auto_271383 - BLOCK
      ?auto_271384 - BLOCK
      ?auto_271385 - BLOCK
      ?auto_271386 - BLOCK
      ?auto_271387 - BLOCK
      ?auto_271388 - BLOCK
      ?auto_271389 - BLOCK
      ?auto_271390 - BLOCK
      ?auto_271391 - BLOCK
      ?auto_271392 - BLOCK
      ?auto_271393 - BLOCK
    )
    :vars
    (
      ?auto_271394 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_271393 ?auto_271394 ) ( not ( = ?auto_271381 ?auto_271382 ) ) ( not ( = ?auto_271381 ?auto_271383 ) ) ( not ( = ?auto_271381 ?auto_271384 ) ) ( not ( = ?auto_271381 ?auto_271385 ) ) ( not ( = ?auto_271381 ?auto_271386 ) ) ( not ( = ?auto_271381 ?auto_271387 ) ) ( not ( = ?auto_271381 ?auto_271388 ) ) ( not ( = ?auto_271381 ?auto_271389 ) ) ( not ( = ?auto_271381 ?auto_271390 ) ) ( not ( = ?auto_271381 ?auto_271391 ) ) ( not ( = ?auto_271381 ?auto_271392 ) ) ( not ( = ?auto_271381 ?auto_271393 ) ) ( not ( = ?auto_271381 ?auto_271394 ) ) ( not ( = ?auto_271382 ?auto_271383 ) ) ( not ( = ?auto_271382 ?auto_271384 ) ) ( not ( = ?auto_271382 ?auto_271385 ) ) ( not ( = ?auto_271382 ?auto_271386 ) ) ( not ( = ?auto_271382 ?auto_271387 ) ) ( not ( = ?auto_271382 ?auto_271388 ) ) ( not ( = ?auto_271382 ?auto_271389 ) ) ( not ( = ?auto_271382 ?auto_271390 ) ) ( not ( = ?auto_271382 ?auto_271391 ) ) ( not ( = ?auto_271382 ?auto_271392 ) ) ( not ( = ?auto_271382 ?auto_271393 ) ) ( not ( = ?auto_271382 ?auto_271394 ) ) ( not ( = ?auto_271383 ?auto_271384 ) ) ( not ( = ?auto_271383 ?auto_271385 ) ) ( not ( = ?auto_271383 ?auto_271386 ) ) ( not ( = ?auto_271383 ?auto_271387 ) ) ( not ( = ?auto_271383 ?auto_271388 ) ) ( not ( = ?auto_271383 ?auto_271389 ) ) ( not ( = ?auto_271383 ?auto_271390 ) ) ( not ( = ?auto_271383 ?auto_271391 ) ) ( not ( = ?auto_271383 ?auto_271392 ) ) ( not ( = ?auto_271383 ?auto_271393 ) ) ( not ( = ?auto_271383 ?auto_271394 ) ) ( not ( = ?auto_271384 ?auto_271385 ) ) ( not ( = ?auto_271384 ?auto_271386 ) ) ( not ( = ?auto_271384 ?auto_271387 ) ) ( not ( = ?auto_271384 ?auto_271388 ) ) ( not ( = ?auto_271384 ?auto_271389 ) ) ( not ( = ?auto_271384 ?auto_271390 ) ) ( not ( = ?auto_271384 ?auto_271391 ) ) ( not ( = ?auto_271384 ?auto_271392 ) ) ( not ( = ?auto_271384 ?auto_271393 ) ) ( not ( = ?auto_271384 ?auto_271394 ) ) ( not ( = ?auto_271385 ?auto_271386 ) ) ( not ( = ?auto_271385 ?auto_271387 ) ) ( not ( = ?auto_271385 ?auto_271388 ) ) ( not ( = ?auto_271385 ?auto_271389 ) ) ( not ( = ?auto_271385 ?auto_271390 ) ) ( not ( = ?auto_271385 ?auto_271391 ) ) ( not ( = ?auto_271385 ?auto_271392 ) ) ( not ( = ?auto_271385 ?auto_271393 ) ) ( not ( = ?auto_271385 ?auto_271394 ) ) ( not ( = ?auto_271386 ?auto_271387 ) ) ( not ( = ?auto_271386 ?auto_271388 ) ) ( not ( = ?auto_271386 ?auto_271389 ) ) ( not ( = ?auto_271386 ?auto_271390 ) ) ( not ( = ?auto_271386 ?auto_271391 ) ) ( not ( = ?auto_271386 ?auto_271392 ) ) ( not ( = ?auto_271386 ?auto_271393 ) ) ( not ( = ?auto_271386 ?auto_271394 ) ) ( not ( = ?auto_271387 ?auto_271388 ) ) ( not ( = ?auto_271387 ?auto_271389 ) ) ( not ( = ?auto_271387 ?auto_271390 ) ) ( not ( = ?auto_271387 ?auto_271391 ) ) ( not ( = ?auto_271387 ?auto_271392 ) ) ( not ( = ?auto_271387 ?auto_271393 ) ) ( not ( = ?auto_271387 ?auto_271394 ) ) ( not ( = ?auto_271388 ?auto_271389 ) ) ( not ( = ?auto_271388 ?auto_271390 ) ) ( not ( = ?auto_271388 ?auto_271391 ) ) ( not ( = ?auto_271388 ?auto_271392 ) ) ( not ( = ?auto_271388 ?auto_271393 ) ) ( not ( = ?auto_271388 ?auto_271394 ) ) ( not ( = ?auto_271389 ?auto_271390 ) ) ( not ( = ?auto_271389 ?auto_271391 ) ) ( not ( = ?auto_271389 ?auto_271392 ) ) ( not ( = ?auto_271389 ?auto_271393 ) ) ( not ( = ?auto_271389 ?auto_271394 ) ) ( not ( = ?auto_271390 ?auto_271391 ) ) ( not ( = ?auto_271390 ?auto_271392 ) ) ( not ( = ?auto_271390 ?auto_271393 ) ) ( not ( = ?auto_271390 ?auto_271394 ) ) ( not ( = ?auto_271391 ?auto_271392 ) ) ( not ( = ?auto_271391 ?auto_271393 ) ) ( not ( = ?auto_271391 ?auto_271394 ) ) ( not ( = ?auto_271392 ?auto_271393 ) ) ( not ( = ?auto_271392 ?auto_271394 ) ) ( not ( = ?auto_271393 ?auto_271394 ) ) ( ON ?auto_271392 ?auto_271393 ) ( ON ?auto_271391 ?auto_271392 ) ( ON ?auto_271390 ?auto_271391 ) ( ON ?auto_271389 ?auto_271390 ) ( ON ?auto_271388 ?auto_271389 ) ( ON ?auto_271387 ?auto_271388 ) ( ON ?auto_271386 ?auto_271387 ) ( ON ?auto_271385 ?auto_271386 ) ( ON ?auto_271384 ?auto_271385 ) ( ON ?auto_271383 ?auto_271384 ) ( ON ?auto_271382 ?auto_271383 ) ( ON ?auto_271381 ?auto_271382 ) ( CLEAR ?auto_271381 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_271381 )
      ( MAKE-13PILE ?auto_271381 ?auto_271382 ?auto_271383 ?auto_271384 ?auto_271385 ?auto_271386 ?auto_271387 ?auto_271388 ?auto_271389 ?auto_271390 ?auto_271391 ?auto_271392 ?auto_271393 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_271408 - BLOCK
      ?auto_271409 - BLOCK
      ?auto_271410 - BLOCK
      ?auto_271411 - BLOCK
      ?auto_271412 - BLOCK
      ?auto_271413 - BLOCK
      ?auto_271414 - BLOCK
      ?auto_271415 - BLOCK
      ?auto_271416 - BLOCK
      ?auto_271417 - BLOCK
      ?auto_271418 - BLOCK
      ?auto_271419 - BLOCK
      ?auto_271420 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_271420 ) ( not ( = ?auto_271408 ?auto_271409 ) ) ( not ( = ?auto_271408 ?auto_271410 ) ) ( not ( = ?auto_271408 ?auto_271411 ) ) ( not ( = ?auto_271408 ?auto_271412 ) ) ( not ( = ?auto_271408 ?auto_271413 ) ) ( not ( = ?auto_271408 ?auto_271414 ) ) ( not ( = ?auto_271408 ?auto_271415 ) ) ( not ( = ?auto_271408 ?auto_271416 ) ) ( not ( = ?auto_271408 ?auto_271417 ) ) ( not ( = ?auto_271408 ?auto_271418 ) ) ( not ( = ?auto_271408 ?auto_271419 ) ) ( not ( = ?auto_271408 ?auto_271420 ) ) ( not ( = ?auto_271409 ?auto_271410 ) ) ( not ( = ?auto_271409 ?auto_271411 ) ) ( not ( = ?auto_271409 ?auto_271412 ) ) ( not ( = ?auto_271409 ?auto_271413 ) ) ( not ( = ?auto_271409 ?auto_271414 ) ) ( not ( = ?auto_271409 ?auto_271415 ) ) ( not ( = ?auto_271409 ?auto_271416 ) ) ( not ( = ?auto_271409 ?auto_271417 ) ) ( not ( = ?auto_271409 ?auto_271418 ) ) ( not ( = ?auto_271409 ?auto_271419 ) ) ( not ( = ?auto_271409 ?auto_271420 ) ) ( not ( = ?auto_271410 ?auto_271411 ) ) ( not ( = ?auto_271410 ?auto_271412 ) ) ( not ( = ?auto_271410 ?auto_271413 ) ) ( not ( = ?auto_271410 ?auto_271414 ) ) ( not ( = ?auto_271410 ?auto_271415 ) ) ( not ( = ?auto_271410 ?auto_271416 ) ) ( not ( = ?auto_271410 ?auto_271417 ) ) ( not ( = ?auto_271410 ?auto_271418 ) ) ( not ( = ?auto_271410 ?auto_271419 ) ) ( not ( = ?auto_271410 ?auto_271420 ) ) ( not ( = ?auto_271411 ?auto_271412 ) ) ( not ( = ?auto_271411 ?auto_271413 ) ) ( not ( = ?auto_271411 ?auto_271414 ) ) ( not ( = ?auto_271411 ?auto_271415 ) ) ( not ( = ?auto_271411 ?auto_271416 ) ) ( not ( = ?auto_271411 ?auto_271417 ) ) ( not ( = ?auto_271411 ?auto_271418 ) ) ( not ( = ?auto_271411 ?auto_271419 ) ) ( not ( = ?auto_271411 ?auto_271420 ) ) ( not ( = ?auto_271412 ?auto_271413 ) ) ( not ( = ?auto_271412 ?auto_271414 ) ) ( not ( = ?auto_271412 ?auto_271415 ) ) ( not ( = ?auto_271412 ?auto_271416 ) ) ( not ( = ?auto_271412 ?auto_271417 ) ) ( not ( = ?auto_271412 ?auto_271418 ) ) ( not ( = ?auto_271412 ?auto_271419 ) ) ( not ( = ?auto_271412 ?auto_271420 ) ) ( not ( = ?auto_271413 ?auto_271414 ) ) ( not ( = ?auto_271413 ?auto_271415 ) ) ( not ( = ?auto_271413 ?auto_271416 ) ) ( not ( = ?auto_271413 ?auto_271417 ) ) ( not ( = ?auto_271413 ?auto_271418 ) ) ( not ( = ?auto_271413 ?auto_271419 ) ) ( not ( = ?auto_271413 ?auto_271420 ) ) ( not ( = ?auto_271414 ?auto_271415 ) ) ( not ( = ?auto_271414 ?auto_271416 ) ) ( not ( = ?auto_271414 ?auto_271417 ) ) ( not ( = ?auto_271414 ?auto_271418 ) ) ( not ( = ?auto_271414 ?auto_271419 ) ) ( not ( = ?auto_271414 ?auto_271420 ) ) ( not ( = ?auto_271415 ?auto_271416 ) ) ( not ( = ?auto_271415 ?auto_271417 ) ) ( not ( = ?auto_271415 ?auto_271418 ) ) ( not ( = ?auto_271415 ?auto_271419 ) ) ( not ( = ?auto_271415 ?auto_271420 ) ) ( not ( = ?auto_271416 ?auto_271417 ) ) ( not ( = ?auto_271416 ?auto_271418 ) ) ( not ( = ?auto_271416 ?auto_271419 ) ) ( not ( = ?auto_271416 ?auto_271420 ) ) ( not ( = ?auto_271417 ?auto_271418 ) ) ( not ( = ?auto_271417 ?auto_271419 ) ) ( not ( = ?auto_271417 ?auto_271420 ) ) ( not ( = ?auto_271418 ?auto_271419 ) ) ( not ( = ?auto_271418 ?auto_271420 ) ) ( not ( = ?auto_271419 ?auto_271420 ) ) ( ON ?auto_271419 ?auto_271420 ) ( ON ?auto_271418 ?auto_271419 ) ( ON ?auto_271417 ?auto_271418 ) ( ON ?auto_271416 ?auto_271417 ) ( ON ?auto_271415 ?auto_271416 ) ( ON ?auto_271414 ?auto_271415 ) ( ON ?auto_271413 ?auto_271414 ) ( ON ?auto_271412 ?auto_271413 ) ( ON ?auto_271411 ?auto_271412 ) ( ON ?auto_271410 ?auto_271411 ) ( ON ?auto_271409 ?auto_271410 ) ( ON ?auto_271408 ?auto_271409 ) ( CLEAR ?auto_271408 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_271408 )
      ( MAKE-13PILE ?auto_271408 ?auto_271409 ?auto_271410 ?auto_271411 ?auto_271412 ?auto_271413 ?auto_271414 ?auto_271415 ?auto_271416 ?auto_271417 ?auto_271418 ?auto_271419 ?auto_271420 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_271434 - BLOCK
      ?auto_271435 - BLOCK
      ?auto_271436 - BLOCK
      ?auto_271437 - BLOCK
      ?auto_271438 - BLOCK
      ?auto_271439 - BLOCK
      ?auto_271440 - BLOCK
      ?auto_271441 - BLOCK
      ?auto_271442 - BLOCK
      ?auto_271443 - BLOCK
      ?auto_271444 - BLOCK
      ?auto_271445 - BLOCK
      ?auto_271446 - BLOCK
    )
    :vars
    (
      ?auto_271447 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_271434 ?auto_271435 ) ) ( not ( = ?auto_271434 ?auto_271436 ) ) ( not ( = ?auto_271434 ?auto_271437 ) ) ( not ( = ?auto_271434 ?auto_271438 ) ) ( not ( = ?auto_271434 ?auto_271439 ) ) ( not ( = ?auto_271434 ?auto_271440 ) ) ( not ( = ?auto_271434 ?auto_271441 ) ) ( not ( = ?auto_271434 ?auto_271442 ) ) ( not ( = ?auto_271434 ?auto_271443 ) ) ( not ( = ?auto_271434 ?auto_271444 ) ) ( not ( = ?auto_271434 ?auto_271445 ) ) ( not ( = ?auto_271434 ?auto_271446 ) ) ( not ( = ?auto_271435 ?auto_271436 ) ) ( not ( = ?auto_271435 ?auto_271437 ) ) ( not ( = ?auto_271435 ?auto_271438 ) ) ( not ( = ?auto_271435 ?auto_271439 ) ) ( not ( = ?auto_271435 ?auto_271440 ) ) ( not ( = ?auto_271435 ?auto_271441 ) ) ( not ( = ?auto_271435 ?auto_271442 ) ) ( not ( = ?auto_271435 ?auto_271443 ) ) ( not ( = ?auto_271435 ?auto_271444 ) ) ( not ( = ?auto_271435 ?auto_271445 ) ) ( not ( = ?auto_271435 ?auto_271446 ) ) ( not ( = ?auto_271436 ?auto_271437 ) ) ( not ( = ?auto_271436 ?auto_271438 ) ) ( not ( = ?auto_271436 ?auto_271439 ) ) ( not ( = ?auto_271436 ?auto_271440 ) ) ( not ( = ?auto_271436 ?auto_271441 ) ) ( not ( = ?auto_271436 ?auto_271442 ) ) ( not ( = ?auto_271436 ?auto_271443 ) ) ( not ( = ?auto_271436 ?auto_271444 ) ) ( not ( = ?auto_271436 ?auto_271445 ) ) ( not ( = ?auto_271436 ?auto_271446 ) ) ( not ( = ?auto_271437 ?auto_271438 ) ) ( not ( = ?auto_271437 ?auto_271439 ) ) ( not ( = ?auto_271437 ?auto_271440 ) ) ( not ( = ?auto_271437 ?auto_271441 ) ) ( not ( = ?auto_271437 ?auto_271442 ) ) ( not ( = ?auto_271437 ?auto_271443 ) ) ( not ( = ?auto_271437 ?auto_271444 ) ) ( not ( = ?auto_271437 ?auto_271445 ) ) ( not ( = ?auto_271437 ?auto_271446 ) ) ( not ( = ?auto_271438 ?auto_271439 ) ) ( not ( = ?auto_271438 ?auto_271440 ) ) ( not ( = ?auto_271438 ?auto_271441 ) ) ( not ( = ?auto_271438 ?auto_271442 ) ) ( not ( = ?auto_271438 ?auto_271443 ) ) ( not ( = ?auto_271438 ?auto_271444 ) ) ( not ( = ?auto_271438 ?auto_271445 ) ) ( not ( = ?auto_271438 ?auto_271446 ) ) ( not ( = ?auto_271439 ?auto_271440 ) ) ( not ( = ?auto_271439 ?auto_271441 ) ) ( not ( = ?auto_271439 ?auto_271442 ) ) ( not ( = ?auto_271439 ?auto_271443 ) ) ( not ( = ?auto_271439 ?auto_271444 ) ) ( not ( = ?auto_271439 ?auto_271445 ) ) ( not ( = ?auto_271439 ?auto_271446 ) ) ( not ( = ?auto_271440 ?auto_271441 ) ) ( not ( = ?auto_271440 ?auto_271442 ) ) ( not ( = ?auto_271440 ?auto_271443 ) ) ( not ( = ?auto_271440 ?auto_271444 ) ) ( not ( = ?auto_271440 ?auto_271445 ) ) ( not ( = ?auto_271440 ?auto_271446 ) ) ( not ( = ?auto_271441 ?auto_271442 ) ) ( not ( = ?auto_271441 ?auto_271443 ) ) ( not ( = ?auto_271441 ?auto_271444 ) ) ( not ( = ?auto_271441 ?auto_271445 ) ) ( not ( = ?auto_271441 ?auto_271446 ) ) ( not ( = ?auto_271442 ?auto_271443 ) ) ( not ( = ?auto_271442 ?auto_271444 ) ) ( not ( = ?auto_271442 ?auto_271445 ) ) ( not ( = ?auto_271442 ?auto_271446 ) ) ( not ( = ?auto_271443 ?auto_271444 ) ) ( not ( = ?auto_271443 ?auto_271445 ) ) ( not ( = ?auto_271443 ?auto_271446 ) ) ( not ( = ?auto_271444 ?auto_271445 ) ) ( not ( = ?auto_271444 ?auto_271446 ) ) ( not ( = ?auto_271445 ?auto_271446 ) ) ( ON ?auto_271434 ?auto_271447 ) ( not ( = ?auto_271446 ?auto_271447 ) ) ( not ( = ?auto_271445 ?auto_271447 ) ) ( not ( = ?auto_271444 ?auto_271447 ) ) ( not ( = ?auto_271443 ?auto_271447 ) ) ( not ( = ?auto_271442 ?auto_271447 ) ) ( not ( = ?auto_271441 ?auto_271447 ) ) ( not ( = ?auto_271440 ?auto_271447 ) ) ( not ( = ?auto_271439 ?auto_271447 ) ) ( not ( = ?auto_271438 ?auto_271447 ) ) ( not ( = ?auto_271437 ?auto_271447 ) ) ( not ( = ?auto_271436 ?auto_271447 ) ) ( not ( = ?auto_271435 ?auto_271447 ) ) ( not ( = ?auto_271434 ?auto_271447 ) ) ( ON ?auto_271435 ?auto_271434 ) ( ON ?auto_271436 ?auto_271435 ) ( ON ?auto_271437 ?auto_271436 ) ( ON ?auto_271438 ?auto_271437 ) ( ON ?auto_271439 ?auto_271438 ) ( ON ?auto_271440 ?auto_271439 ) ( ON ?auto_271441 ?auto_271440 ) ( ON ?auto_271442 ?auto_271441 ) ( ON ?auto_271443 ?auto_271442 ) ( ON ?auto_271444 ?auto_271443 ) ( ON ?auto_271445 ?auto_271444 ) ( ON ?auto_271446 ?auto_271445 ) ( CLEAR ?auto_271446 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_271446 ?auto_271445 ?auto_271444 ?auto_271443 ?auto_271442 ?auto_271441 ?auto_271440 ?auto_271439 ?auto_271438 ?auto_271437 ?auto_271436 ?auto_271435 ?auto_271434 )
      ( MAKE-13PILE ?auto_271434 ?auto_271435 ?auto_271436 ?auto_271437 ?auto_271438 ?auto_271439 ?auto_271440 ?auto_271441 ?auto_271442 ?auto_271443 ?auto_271444 ?auto_271445 ?auto_271446 ) )
  )

)

