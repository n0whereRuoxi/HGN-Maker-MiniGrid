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
      ?auto_18997 - BLOCK
      ?auto_18998 - BLOCK
      ?auto_18999 - BLOCK
      ?auto_19000 - BLOCK
      ?auto_19001 - BLOCK
    )
    :vars
    (
      ?auto_19002 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19002 ?auto_19001 ) ( CLEAR ?auto_19002 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_18997 ) ( ON ?auto_18998 ?auto_18997 ) ( ON ?auto_18999 ?auto_18998 ) ( ON ?auto_19000 ?auto_18999 ) ( ON ?auto_19001 ?auto_19000 ) ( not ( = ?auto_18997 ?auto_18998 ) ) ( not ( = ?auto_18997 ?auto_18999 ) ) ( not ( = ?auto_18997 ?auto_19000 ) ) ( not ( = ?auto_18997 ?auto_19001 ) ) ( not ( = ?auto_18997 ?auto_19002 ) ) ( not ( = ?auto_18998 ?auto_18999 ) ) ( not ( = ?auto_18998 ?auto_19000 ) ) ( not ( = ?auto_18998 ?auto_19001 ) ) ( not ( = ?auto_18998 ?auto_19002 ) ) ( not ( = ?auto_18999 ?auto_19000 ) ) ( not ( = ?auto_18999 ?auto_19001 ) ) ( not ( = ?auto_18999 ?auto_19002 ) ) ( not ( = ?auto_19000 ?auto_19001 ) ) ( not ( = ?auto_19000 ?auto_19002 ) ) ( not ( = ?auto_19001 ?auto_19002 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_19002 ?auto_19001 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_19004 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_19004 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_19004 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_19005 - BLOCK
    )
    :vars
    (
      ?auto_19006 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19005 ?auto_19006 ) ( CLEAR ?auto_19005 ) ( HAND-EMPTY ) ( not ( = ?auto_19005 ?auto_19006 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_19005 ?auto_19006 )
      ( MAKE-1PILE ?auto_19005 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_19011 - BLOCK
      ?auto_19012 - BLOCK
      ?auto_19013 - BLOCK
      ?auto_19014 - BLOCK
    )
    :vars
    (
      ?auto_19015 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19015 ?auto_19014 ) ( CLEAR ?auto_19015 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_19011 ) ( ON ?auto_19012 ?auto_19011 ) ( ON ?auto_19013 ?auto_19012 ) ( ON ?auto_19014 ?auto_19013 ) ( not ( = ?auto_19011 ?auto_19012 ) ) ( not ( = ?auto_19011 ?auto_19013 ) ) ( not ( = ?auto_19011 ?auto_19014 ) ) ( not ( = ?auto_19011 ?auto_19015 ) ) ( not ( = ?auto_19012 ?auto_19013 ) ) ( not ( = ?auto_19012 ?auto_19014 ) ) ( not ( = ?auto_19012 ?auto_19015 ) ) ( not ( = ?auto_19013 ?auto_19014 ) ) ( not ( = ?auto_19013 ?auto_19015 ) ) ( not ( = ?auto_19014 ?auto_19015 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_19015 ?auto_19014 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_19016 - BLOCK
      ?auto_19017 - BLOCK
      ?auto_19018 - BLOCK
      ?auto_19019 - BLOCK
    )
    :vars
    (
      ?auto_19020 - BLOCK
      ?auto_19021 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19020 ?auto_19019 ) ( CLEAR ?auto_19020 ) ( ON-TABLE ?auto_19016 ) ( ON ?auto_19017 ?auto_19016 ) ( ON ?auto_19018 ?auto_19017 ) ( ON ?auto_19019 ?auto_19018 ) ( not ( = ?auto_19016 ?auto_19017 ) ) ( not ( = ?auto_19016 ?auto_19018 ) ) ( not ( = ?auto_19016 ?auto_19019 ) ) ( not ( = ?auto_19016 ?auto_19020 ) ) ( not ( = ?auto_19017 ?auto_19018 ) ) ( not ( = ?auto_19017 ?auto_19019 ) ) ( not ( = ?auto_19017 ?auto_19020 ) ) ( not ( = ?auto_19018 ?auto_19019 ) ) ( not ( = ?auto_19018 ?auto_19020 ) ) ( not ( = ?auto_19019 ?auto_19020 ) ) ( HOLDING ?auto_19021 ) ( not ( = ?auto_19016 ?auto_19021 ) ) ( not ( = ?auto_19017 ?auto_19021 ) ) ( not ( = ?auto_19018 ?auto_19021 ) ) ( not ( = ?auto_19019 ?auto_19021 ) ) ( not ( = ?auto_19020 ?auto_19021 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_19021 )
      ( MAKE-4PILE ?auto_19016 ?auto_19017 ?auto_19018 ?auto_19019 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_19022 - BLOCK
      ?auto_19023 - BLOCK
      ?auto_19024 - BLOCK
      ?auto_19025 - BLOCK
    )
    :vars
    (
      ?auto_19027 - BLOCK
      ?auto_19026 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19027 ?auto_19025 ) ( ON-TABLE ?auto_19022 ) ( ON ?auto_19023 ?auto_19022 ) ( ON ?auto_19024 ?auto_19023 ) ( ON ?auto_19025 ?auto_19024 ) ( not ( = ?auto_19022 ?auto_19023 ) ) ( not ( = ?auto_19022 ?auto_19024 ) ) ( not ( = ?auto_19022 ?auto_19025 ) ) ( not ( = ?auto_19022 ?auto_19027 ) ) ( not ( = ?auto_19023 ?auto_19024 ) ) ( not ( = ?auto_19023 ?auto_19025 ) ) ( not ( = ?auto_19023 ?auto_19027 ) ) ( not ( = ?auto_19024 ?auto_19025 ) ) ( not ( = ?auto_19024 ?auto_19027 ) ) ( not ( = ?auto_19025 ?auto_19027 ) ) ( not ( = ?auto_19022 ?auto_19026 ) ) ( not ( = ?auto_19023 ?auto_19026 ) ) ( not ( = ?auto_19024 ?auto_19026 ) ) ( not ( = ?auto_19025 ?auto_19026 ) ) ( not ( = ?auto_19027 ?auto_19026 ) ) ( ON ?auto_19026 ?auto_19027 ) ( CLEAR ?auto_19026 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_19022 ?auto_19023 ?auto_19024 ?auto_19025 ?auto_19027 )
      ( MAKE-4PILE ?auto_19022 ?auto_19023 ?auto_19024 ?auto_19025 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_19030 - BLOCK
      ?auto_19031 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_19031 ) ( CLEAR ?auto_19030 ) ( ON-TABLE ?auto_19030 ) ( not ( = ?auto_19030 ?auto_19031 ) ) )
    :subtasks
    ( ( !STACK ?auto_19031 ?auto_19030 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_19032 - BLOCK
      ?auto_19033 - BLOCK
    )
    :vars
    (
      ?auto_19034 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_19032 ) ( ON-TABLE ?auto_19032 ) ( not ( = ?auto_19032 ?auto_19033 ) ) ( ON ?auto_19033 ?auto_19034 ) ( CLEAR ?auto_19033 ) ( HAND-EMPTY ) ( not ( = ?auto_19032 ?auto_19034 ) ) ( not ( = ?auto_19033 ?auto_19034 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_19033 ?auto_19034 )
      ( MAKE-2PILE ?auto_19032 ?auto_19033 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_19035 - BLOCK
      ?auto_19036 - BLOCK
    )
    :vars
    (
      ?auto_19037 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19035 ?auto_19036 ) ) ( ON ?auto_19036 ?auto_19037 ) ( CLEAR ?auto_19036 ) ( not ( = ?auto_19035 ?auto_19037 ) ) ( not ( = ?auto_19036 ?auto_19037 ) ) ( HOLDING ?auto_19035 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_19035 )
      ( MAKE-2PILE ?auto_19035 ?auto_19036 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_19038 - BLOCK
      ?auto_19039 - BLOCK
    )
    :vars
    (
      ?auto_19040 - BLOCK
      ?auto_19042 - BLOCK
      ?auto_19043 - BLOCK
      ?auto_19041 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19038 ?auto_19039 ) ) ( ON ?auto_19039 ?auto_19040 ) ( not ( = ?auto_19038 ?auto_19040 ) ) ( not ( = ?auto_19039 ?auto_19040 ) ) ( ON ?auto_19038 ?auto_19039 ) ( CLEAR ?auto_19038 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_19042 ) ( ON ?auto_19043 ?auto_19042 ) ( ON ?auto_19041 ?auto_19043 ) ( ON ?auto_19040 ?auto_19041 ) ( not ( = ?auto_19042 ?auto_19043 ) ) ( not ( = ?auto_19042 ?auto_19041 ) ) ( not ( = ?auto_19042 ?auto_19040 ) ) ( not ( = ?auto_19042 ?auto_19039 ) ) ( not ( = ?auto_19042 ?auto_19038 ) ) ( not ( = ?auto_19043 ?auto_19041 ) ) ( not ( = ?auto_19043 ?auto_19040 ) ) ( not ( = ?auto_19043 ?auto_19039 ) ) ( not ( = ?auto_19043 ?auto_19038 ) ) ( not ( = ?auto_19041 ?auto_19040 ) ) ( not ( = ?auto_19041 ?auto_19039 ) ) ( not ( = ?auto_19041 ?auto_19038 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_19042 ?auto_19043 ?auto_19041 ?auto_19040 ?auto_19039 )
      ( MAKE-2PILE ?auto_19038 ?auto_19039 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_19047 - BLOCK
      ?auto_19048 - BLOCK
      ?auto_19049 - BLOCK
    )
    :vars
    (
      ?auto_19050 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19050 ?auto_19049 ) ( CLEAR ?auto_19050 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_19047 ) ( ON ?auto_19048 ?auto_19047 ) ( ON ?auto_19049 ?auto_19048 ) ( not ( = ?auto_19047 ?auto_19048 ) ) ( not ( = ?auto_19047 ?auto_19049 ) ) ( not ( = ?auto_19047 ?auto_19050 ) ) ( not ( = ?auto_19048 ?auto_19049 ) ) ( not ( = ?auto_19048 ?auto_19050 ) ) ( not ( = ?auto_19049 ?auto_19050 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_19050 ?auto_19049 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_19051 - BLOCK
      ?auto_19052 - BLOCK
      ?auto_19053 - BLOCK
    )
    :vars
    (
      ?auto_19054 - BLOCK
      ?auto_19055 - BLOCK
      ?auto_19056 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19054 ?auto_19053 ) ( CLEAR ?auto_19054 ) ( ON-TABLE ?auto_19051 ) ( ON ?auto_19052 ?auto_19051 ) ( ON ?auto_19053 ?auto_19052 ) ( not ( = ?auto_19051 ?auto_19052 ) ) ( not ( = ?auto_19051 ?auto_19053 ) ) ( not ( = ?auto_19051 ?auto_19054 ) ) ( not ( = ?auto_19052 ?auto_19053 ) ) ( not ( = ?auto_19052 ?auto_19054 ) ) ( not ( = ?auto_19053 ?auto_19054 ) ) ( HOLDING ?auto_19055 ) ( CLEAR ?auto_19056 ) ( not ( = ?auto_19051 ?auto_19055 ) ) ( not ( = ?auto_19051 ?auto_19056 ) ) ( not ( = ?auto_19052 ?auto_19055 ) ) ( not ( = ?auto_19052 ?auto_19056 ) ) ( not ( = ?auto_19053 ?auto_19055 ) ) ( not ( = ?auto_19053 ?auto_19056 ) ) ( not ( = ?auto_19054 ?auto_19055 ) ) ( not ( = ?auto_19054 ?auto_19056 ) ) ( not ( = ?auto_19055 ?auto_19056 ) ) )
    :subtasks
    ( ( !STACK ?auto_19055 ?auto_19056 )
      ( MAKE-3PILE ?auto_19051 ?auto_19052 ?auto_19053 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_19057 - BLOCK
      ?auto_19058 - BLOCK
      ?auto_19059 - BLOCK
    )
    :vars
    (
      ?auto_19060 - BLOCK
      ?auto_19061 - BLOCK
      ?auto_19062 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19060 ?auto_19059 ) ( ON-TABLE ?auto_19057 ) ( ON ?auto_19058 ?auto_19057 ) ( ON ?auto_19059 ?auto_19058 ) ( not ( = ?auto_19057 ?auto_19058 ) ) ( not ( = ?auto_19057 ?auto_19059 ) ) ( not ( = ?auto_19057 ?auto_19060 ) ) ( not ( = ?auto_19058 ?auto_19059 ) ) ( not ( = ?auto_19058 ?auto_19060 ) ) ( not ( = ?auto_19059 ?auto_19060 ) ) ( CLEAR ?auto_19061 ) ( not ( = ?auto_19057 ?auto_19062 ) ) ( not ( = ?auto_19057 ?auto_19061 ) ) ( not ( = ?auto_19058 ?auto_19062 ) ) ( not ( = ?auto_19058 ?auto_19061 ) ) ( not ( = ?auto_19059 ?auto_19062 ) ) ( not ( = ?auto_19059 ?auto_19061 ) ) ( not ( = ?auto_19060 ?auto_19062 ) ) ( not ( = ?auto_19060 ?auto_19061 ) ) ( not ( = ?auto_19062 ?auto_19061 ) ) ( ON ?auto_19062 ?auto_19060 ) ( CLEAR ?auto_19062 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_19057 ?auto_19058 ?auto_19059 ?auto_19060 )
      ( MAKE-3PILE ?auto_19057 ?auto_19058 ?auto_19059 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_19063 - BLOCK
      ?auto_19064 - BLOCK
      ?auto_19065 - BLOCK
    )
    :vars
    (
      ?auto_19068 - BLOCK
      ?auto_19067 - BLOCK
      ?auto_19066 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19068 ?auto_19065 ) ( ON-TABLE ?auto_19063 ) ( ON ?auto_19064 ?auto_19063 ) ( ON ?auto_19065 ?auto_19064 ) ( not ( = ?auto_19063 ?auto_19064 ) ) ( not ( = ?auto_19063 ?auto_19065 ) ) ( not ( = ?auto_19063 ?auto_19068 ) ) ( not ( = ?auto_19064 ?auto_19065 ) ) ( not ( = ?auto_19064 ?auto_19068 ) ) ( not ( = ?auto_19065 ?auto_19068 ) ) ( not ( = ?auto_19063 ?auto_19067 ) ) ( not ( = ?auto_19063 ?auto_19066 ) ) ( not ( = ?auto_19064 ?auto_19067 ) ) ( not ( = ?auto_19064 ?auto_19066 ) ) ( not ( = ?auto_19065 ?auto_19067 ) ) ( not ( = ?auto_19065 ?auto_19066 ) ) ( not ( = ?auto_19068 ?auto_19067 ) ) ( not ( = ?auto_19068 ?auto_19066 ) ) ( not ( = ?auto_19067 ?auto_19066 ) ) ( ON ?auto_19067 ?auto_19068 ) ( CLEAR ?auto_19067 ) ( HOLDING ?auto_19066 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_19066 )
      ( MAKE-3PILE ?auto_19063 ?auto_19064 ?auto_19065 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_19069 - BLOCK
      ?auto_19070 - BLOCK
      ?auto_19071 - BLOCK
    )
    :vars
    (
      ?auto_19074 - BLOCK
      ?auto_19073 - BLOCK
      ?auto_19072 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19074 ?auto_19071 ) ( ON-TABLE ?auto_19069 ) ( ON ?auto_19070 ?auto_19069 ) ( ON ?auto_19071 ?auto_19070 ) ( not ( = ?auto_19069 ?auto_19070 ) ) ( not ( = ?auto_19069 ?auto_19071 ) ) ( not ( = ?auto_19069 ?auto_19074 ) ) ( not ( = ?auto_19070 ?auto_19071 ) ) ( not ( = ?auto_19070 ?auto_19074 ) ) ( not ( = ?auto_19071 ?auto_19074 ) ) ( not ( = ?auto_19069 ?auto_19073 ) ) ( not ( = ?auto_19069 ?auto_19072 ) ) ( not ( = ?auto_19070 ?auto_19073 ) ) ( not ( = ?auto_19070 ?auto_19072 ) ) ( not ( = ?auto_19071 ?auto_19073 ) ) ( not ( = ?auto_19071 ?auto_19072 ) ) ( not ( = ?auto_19074 ?auto_19073 ) ) ( not ( = ?auto_19074 ?auto_19072 ) ) ( not ( = ?auto_19073 ?auto_19072 ) ) ( ON ?auto_19073 ?auto_19074 ) ( ON ?auto_19072 ?auto_19073 ) ( CLEAR ?auto_19072 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_19069 ?auto_19070 ?auto_19071 ?auto_19074 ?auto_19073 )
      ( MAKE-3PILE ?auto_19069 ?auto_19070 ?auto_19071 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_19078 - BLOCK
      ?auto_19079 - BLOCK
      ?auto_19080 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_19080 ) ( CLEAR ?auto_19079 ) ( ON-TABLE ?auto_19078 ) ( ON ?auto_19079 ?auto_19078 ) ( not ( = ?auto_19078 ?auto_19079 ) ) ( not ( = ?auto_19078 ?auto_19080 ) ) ( not ( = ?auto_19079 ?auto_19080 ) ) )
    :subtasks
    ( ( !STACK ?auto_19080 ?auto_19079 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_19081 - BLOCK
      ?auto_19082 - BLOCK
      ?auto_19083 - BLOCK
    )
    :vars
    (
      ?auto_19084 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_19082 ) ( ON-TABLE ?auto_19081 ) ( ON ?auto_19082 ?auto_19081 ) ( not ( = ?auto_19081 ?auto_19082 ) ) ( not ( = ?auto_19081 ?auto_19083 ) ) ( not ( = ?auto_19082 ?auto_19083 ) ) ( ON ?auto_19083 ?auto_19084 ) ( CLEAR ?auto_19083 ) ( HAND-EMPTY ) ( not ( = ?auto_19081 ?auto_19084 ) ) ( not ( = ?auto_19082 ?auto_19084 ) ) ( not ( = ?auto_19083 ?auto_19084 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_19083 ?auto_19084 )
      ( MAKE-3PILE ?auto_19081 ?auto_19082 ?auto_19083 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_19085 - BLOCK
      ?auto_19086 - BLOCK
      ?auto_19087 - BLOCK
    )
    :vars
    (
      ?auto_19088 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_19085 ) ( not ( = ?auto_19085 ?auto_19086 ) ) ( not ( = ?auto_19085 ?auto_19087 ) ) ( not ( = ?auto_19086 ?auto_19087 ) ) ( ON ?auto_19087 ?auto_19088 ) ( CLEAR ?auto_19087 ) ( not ( = ?auto_19085 ?auto_19088 ) ) ( not ( = ?auto_19086 ?auto_19088 ) ) ( not ( = ?auto_19087 ?auto_19088 ) ) ( HOLDING ?auto_19086 ) ( CLEAR ?auto_19085 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_19085 ?auto_19086 )
      ( MAKE-3PILE ?auto_19085 ?auto_19086 ?auto_19087 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_19089 - BLOCK
      ?auto_19090 - BLOCK
      ?auto_19091 - BLOCK
    )
    :vars
    (
      ?auto_19092 - BLOCK
      ?auto_19093 - BLOCK
      ?auto_19094 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_19089 ) ( not ( = ?auto_19089 ?auto_19090 ) ) ( not ( = ?auto_19089 ?auto_19091 ) ) ( not ( = ?auto_19090 ?auto_19091 ) ) ( ON ?auto_19091 ?auto_19092 ) ( not ( = ?auto_19089 ?auto_19092 ) ) ( not ( = ?auto_19090 ?auto_19092 ) ) ( not ( = ?auto_19091 ?auto_19092 ) ) ( CLEAR ?auto_19089 ) ( ON ?auto_19090 ?auto_19091 ) ( CLEAR ?auto_19090 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_19093 ) ( ON ?auto_19094 ?auto_19093 ) ( ON ?auto_19092 ?auto_19094 ) ( not ( = ?auto_19093 ?auto_19094 ) ) ( not ( = ?auto_19093 ?auto_19092 ) ) ( not ( = ?auto_19093 ?auto_19091 ) ) ( not ( = ?auto_19093 ?auto_19090 ) ) ( not ( = ?auto_19094 ?auto_19092 ) ) ( not ( = ?auto_19094 ?auto_19091 ) ) ( not ( = ?auto_19094 ?auto_19090 ) ) ( not ( = ?auto_19089 ?auto_19093 ) ) ( not ( = ?auto_19089 ?auto_19094 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_19093 ?auto_19094 ?auto_19092 ?auto_19091 )
      ( MAKE-3PILE ?auto_19089 ?auto_19090 ?auto_19091 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_19095 - BLOCK
      ?auto_19096 - BLOCK
      ?auto_19097 - BLOCK
    )
    :vars
    (
      ?auto_19099 - BLOCK
      ?auto_19098 - BLOCK
      ?auto_19100 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19095 ?auto_19096 ) ) ( not ( = ?auto_19095 ?auto_19097 ) ) ( not ( = ?auto_19096 ?auto_19097 ) ) ( ON ?auto_19097 ?auto_19099 ) ( not ( = ?auto_19095 ?auto_19099 ) ) ( not ( = ?auto_19096 ?auto_19099 ) ) ( not ( = ?auto_19097 ?auto_19099 ) ) ( ON ?auto_19096 ?auto_19097 ) ( CLEAR ?auto_19096 ) ( ON-TABLE ?auto_19098 ) ( ON ?auto_19100 ?auto_19098 ) ( ON ?auto_19099 ?auto_19100 ) ( not ( = ?auto_19098 ?auto_19100 ) ) ( not ( = ?auto_19098 ?auto_19099 ) ) ( not ( = ?auto_19098 ?auto_19097 ) ) ( not ( = ?auto_19098 ?auto_19096 ) ) ( not ( = ?auto_19100 ?auto_19099 ) ) ( not ( = ?auto_19100 ?auto_19097 ) ) ( not ( = ?auto_19100 ?auto_19096 ) ) ( not ( = ?auto_19095 ?auto_19098 ) ) ( not ( = ?auto_19095 ?auto_19100 ) ) ( HOLDING ?auto_19095 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_19095 )
      ( MAKE-3PILE ?auto_19095 ?auto_19096 ?auto_19097 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_19101 - BLOCK
      ?auto_19102 - BLOCK
      ?auto_19103 - BLOCK
    )
    :vars
    (
      ?auto_19106 - BLOCK
      ?auto_19105 - BLOCK
      ?auto_19104 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19101 ?auto_19102 ) ) ( not ( = ?auto_19101 ?auto_19103 ) ) ( not ( = ?auto_19102 ?auto_19103 ) ) ( ON ?auto_19103 ?auto_19106 ) ( not ( = ?auto_19101 ?auto_19106 ) ) ( not ( = ?auto_19102 ?auto_19106 ) ) ( not ( = ?auto_19103 ?auto_19106 ) ) ( ON ?auto_19102 ?auto_19103 ) ( ON-TABLE ?auto_19105 ) ( ON ?auto_19104 ?auto_19105 ) ( ON ?auto_19106 ?auto_19104 ) ( not ( = ?auto_19105 ?auto_19104 ) ) ( not ( = ?auto_19105 ?auto_19106 ) ) ( not ( = ?auto_19105 ?auto_19103 ) ) ( not ( = ?auto_19105 ?auto_19102 ) ) ( not ( = ?auto_19104 ?auto_19106 ) ) ( not ( = ?auto_19104 ?auto_19103 ) ) ( not ( = ?auto_19104 ?auto_19102 ) ) ( not ( = ?auto_19101 ?auto_19105 ) ) ( not ( = ?auto_19101 ?auto_19104 ) ) ( ON ?auto_19101 ?auto_19102 ) ( CLEAR ?auto_19101 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_19105 ?auto_19104 ?auto_19106 ?auto_19103 ?auto_19102 )
      ( MAKE-3PILE ?auto_19101 ?auto_19102 ?auto_19103 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_19109 - BLOCK
      ?auto_19110 - BLOCK
    )
    :vars
    (
      ?auto_19111 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19111 ?auto_19110 ) ( CLEAR ?auto_19111 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_19109 ) ( ON ?auto_19110 ?auto_19109 ) ( not ( = ?auto_19109 ?auto_19110 ) ) ( not ( = ?auto_19109 ?auto_19111 ) ) ( not ( = ?auto_19110 ?auto_19111 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_19111 ?auto_19110 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_19112 - BLOCK
      ?auto_19113 - BLOCK
    )
    :vars
    (
      ?auto_19114 - BLOCK
      ?auto_19115 - BLOCK
      ?auto_19116 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19114 ?auto_19113 ) ( CLEAR ?auto_19114 ) ( ON-TABLE ?auto_19112 ) ( ON ?auto_19113 ?auto_19112 ) ( not ( = ?auto_19112 ?auto_19113 ) ) ( not ( = ?auto_19112 ?auto_19114 ) ) ( not ( = ?auto_19113 ?auto_19114 ) ) ( HOLDING ?auto_19115 ) ( CLEAR ?auto_19116 ) ( not ( = ?auto_19112 ?auto_19115 ) ) ( not ( = ?auto_19112 ?auto_19116 ) ) ( not ( = ?auto_19113 ?auto_19115 ) ) ( not ( = ?auto_19113 ?auto_19116 ) ) ( not ( = ?auto_19114 ?auto_19115 ) ) ( not ( = ?auto_19114 ?auto_19116 ) ) ( not ( = ?auto_19115 ?auto_19116 ) ) )
    :subtasks
    ( ( !STACK ?auto_19115 ?auto_19116 )
      ( MAKE-2PILE ?auto_19112 ?auto_19113 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_19117 - BLOCK
      ?auto_19118 - BLOCK
    )
    :vars
    (
      ?auto_19120 - BLOCK
      ?auto_19119 - BLOCK
      ?auto_19121 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19120 ?auto_19118 ) ( ON-TABLE ?auto_19117 ) ( ON ?auto_19118 ?auto_19117 ) ( not ( = ?auto_19117 ?auto_19118 ) ) ( not ( = ?auto_19117 ?auto_19120 ) ) ( not ( = ?auto_19118 ?auto_19120 ) ) ( CLEAR ?auto_19119 ) ( not ( = ?auto_19117 ?auto_19121 ) ) ( not ( = ?auto_19117 ?auto_19119 ) ) ( not ( = ?auto_19118 ?auto_19121 ) ) ( not ( = ?auto_19118 ?auto_19119 ) ) ( not ( = ?auto_19120 ?auto_19121 ) ) ( not ( = ?auto_19120 ?auto_19119 ) ) ( not ( = ?auto_19121 ?auto_19119 ) ) ( ON ?auto_19121 ?auto_19120 ) ( CLEAR ?auto_19121 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_19117 ?auto_19118 ?auto_19120 )
      ( MAKE-2PILE ?auto_19117 ?auto_19118 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_19122 - BLOCK
      ?auto_19123 - BLOCK
    )
    :vars
    (
      ?auto_19126 - BLOCK
      ?auto_19124 - BLOCK
      ?auto_19125 - BLOCK
      ?auto_19127 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19126 ?auto_19123 ) ( ON-TABLE ?auto_19122 ) ( ON ?auto_19123 ?auto_19122 ) ( not ( = ?auto_19122 ?auto_19123 ) ) ( not ( = ?auto_19122 ?auto_19126 ) ) ( not ( = ?auto_19123 ?auto_19126 ) ) ( not ( = ?auto_19122 ?auto_19124 ) ) ( not ( = ?auto_19122 ?auto_19125 ) ) ( not ( = ?auto_19123 ?auto_19124 ) ) ( not ( = ?auto_19123 ?auto_19125 ) ) ( not ( = ?auto_19126 ?auto_19124 ) ) ( not ( = ?auto_19126 ?auto_19125 ) ) ( not ( = ?auto_19124 ?auto_19125 ) ) ( ON ?auto_19124 ?auto_19126 ) ( CLEAR ?auto_19124 ) ( HOLDING ?auto_19125 ) ( CLEAR ?auto_19127 ) ( ON-TABLE ?auto_19127 ) ( not ( = ?auto_19127 ?auto_19125 ) ) ( not ( = ?auto_19122 ?auto_19127 ) ) ( not ( = ?auto_19123 ?auto_19127 ) ) ( not ( = ?auto_19126 ?auto_19127 ) ) ( not ( = ?auto_19124 ?auto_19127 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_19127 ?auto_19125 )
      ( MAKE-2PILE ?auto_19122 ?auto_19123 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_19128 - BLOCK
      ?auto_19129 - BLOCK
    )
    :vars
    (
      ?auto_19133 - BLOCK
      ?auto_19131 - BLOCK
      ?auto_19130 - BLOCK
      ?auto_19132 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19133 ?auto_19129 ) ( ON-TABLE ?auto_19128 ) ( ON ?auto_19129 ?auto_19128 ) ( not ( = ?auto_19128 ?auto_19129 ) ) ( not ( = ?auto_19128 ?auto_19133 ) ) ( not ( = ?auto_19129 ?auto_19133 ) ) ( not ( = ?auto_19128 ?auto_19131 ) ) ( not ( = ?auto_19128 ?auto_19130 ) ) ( not ( = ?auto_19129 ?auto_19131 ) ) ( not ( = ?auto_19129 ?auto_19130 ) ) ( not ( = ?auto_19133 ?auto_19131 ) ) ( not ( = ?auto_19133 ?auto_19130 ) ) ( not ( = ?auto_19131 ?auto_19130 ) ) ( ON ?auto_19131 ?auto_19133 ) ( CLEAR ?auto_19132 ) ( ON-TABLE ?auto_19132 ) ( not ( = ?auto_19132 ?auto_19130 ) ) ( not ( = ?auto_19128 ?auto_19132 ) ) ( not ( = ?auto_19129 ?auto_19132 ) ) ( not ( = ?auto_19133 ?auto_19132 ) ) ( not ( = ?auto_19131 ?auto_19132 ) ) ( ON ?auto_19130 ?auto_19131 ) ( CLEAR ?auto_19130 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_19128 ?auto_19129 ?auto_19133 ?auto_19131 )
      ( MAKE-2PILE ?auto_19128 ?auto_19129 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_19134 - BLOCK
      ?auto_19135 - BLOCK
    )
    :vars
    (
      ?auto_19137 - BLOCK
      ?auto_19136 - BLOCK
      ?auto_19139 - BLOCK
      ?auto_19138 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19137 ?auto_19135 ) ( ON-TABLE ?auto_19134 ) ( ON ?auto_19135 ?auto_19134 ) ( not ( = ?auto_19134 ?auto_19135 ) ) ( not ( = ?auto_19134 ?auto_19137 ) ) ( not ( = ?auto_19135 ?auto_19137 ) ) ( not ( = ?auto_19134 ?auto_19136 ) ) ( not ( = ?auto_19134 ?auto_19139 ) ) ( not ( = ?auto_19135 ?auto_19136 ) ) ( not ( = ?auto_19135 ?auto_19139 ) ) ( not ( = ?auto_19137 ?auto_19136 ) ) ( not ( = ?auto_19137 ?auto_19139 ) ) ( not ( = ?auto_19136 ?auto_19139 ) ) ( ON ?auto_19136 ?auto_19137 ) ( not ( = ?auto_19138 ?auto_19139 ) ) ( not ( = ?auto_19134 ?auto_19138 ) ) ( not ( = ?auto_19135 ?auto_19138 ) ) ( not ( = ?auto_19137 ?auto_19138 ) ) ( not ( = ?auto_19136 ?auto_19138 ) ) ( ON ?auto_19139 ?auto_19136 ) ( CLEAR ?auto_19139 ) ( HOLDING ?auto_19138 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_19138 )
      ( MAKE-2PILE ?auto_19134 ?auto_19135 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_19140 - BLOCK
      ?auto_19141 - BLOCK
    )
    :vars
    (
      ?auto_19145 - BLOCK
      ?auto_19144 - BLOCK
      ?auto_19143 - BLOCK
      ?auto_19142 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19145 ?auto_19141 ) ( ON-TABLE ?auto_19140 ) ( ON ?auto_19141 ?auto_19140 ) ( not ( = ?auto_19140 ?auto_19141 ) ) ( not ( = ?auto_19140 ?auto_19145 ) ) ( not ( = ?auto_19141 ?auto_19145 ) ) ( not ( = ?auto_19140 ?auto_19144 ) ) ( not ( = ?auto_19140 ?auto_19143 ) ) ( not ( = ?auto_19141 ?auto_19144 ) ) ( not ( = ?auto_19141 ?auto_19143 ) ) ( not ( = ?auto_19145 ?auto_19144 ) ) ( not ( = ?auto_19145 ?auto_19143 ) ) ( not ( = ?auto_19144 ?auto_19143 ) ) ( ON ?auto_19144 ?auto_19145 ) ( not ( = ?auto_19142 ?auto_19143 ) ) ( not ( = ?auto_19140 ?auto_19142 ) ) ( not ( = ?auto_19141 ?auto_19142 ) ) ( not ( = ?auto_19145 ?auto_19142 ) ) ( not ( = ?auto_19144 ?auto_19142 ) ) ( ON ?auto_19143 ?auto_19144 ) ( ON ?auto_19142 ?auto_19143 ) ( CLEAR ?auto_19142 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_19140 ?auto_19141 ?auto_19145 ?auto_19144 ?auto_19143 )
      ( MAKE-2PILE ?auto_19140 ?auto_19141 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_19150 - BLOCK
      ?auto_19151 - BLOCK
      ?auto_19152 - BLOCK
      ?auto_19153 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_19153 ) ( CLEAR ?auto_19152 ) ( ON-TABLE ?auto_19150 ) ( ON ?auto_19151 ?auto_19150 ) ( ON ?auto_19152 ?auto_19151 ) ( not ( = ?auto_19150 ?auto_19151 ) ) ( not ( = ?auto_19150 ?auto_19152 ) ) ( not ( = ?auto_19150 ?auto_19153 ) ) ( not ( = ?auto_19151 ?auto_19152 ) ) ( not ( = ?auto_19151 ?auto_19153 ) ) ( not ( = ?auto_19152 ?auto_19153 ) ) )
    :subtasks
    ( ( !STACK ?auto_19153 ?auto_19152 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_19154 - BLOCK
      ?auto_19155 - BLOCK
      ?auto_19156 - BLOCK
      ?auto_19157 - BLOCK
    )
    :vars
    (
      ?auto_19158 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_19156 ) ( ON-TABLE ?auto_19154 ) ( ON ?auto_19155 ?auto_19154 ) ( ON ?auto_19156 ?auto_19155 ) ( not ( = ?auto_19154 ?auto_19155 ) ) ( not ( = ?auto_19154 ?auto_19156 ) ) ( not ( = ?auto_19154 ?auto_19157 ) ) ( not ( = ?auto_19155 ?auto_19156 ) ) ( not ( = ?auto_19155 ?auto_19157 ) ) ( not ( = ?auto_19156 ?auto_19157 ) ) ( ON ?auto_19157 ?auto_19158 ) ( CLEAR ?auto_19157 ) ( HAND-EMPTY ) ( not ( = ?auto_19154 ?auto_19158 ) ) ( not ( = ?auto_19155 ?auto_19158 ) ) ( not ( = ?auto_19156 ?auto_19158 ) ) ( not ( = ?auto_19157 ?auto_19158 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_19157 ?auto_19158 )
      ( MAKE-4PILE ?auto_19154 ?auto_19155 ?auto_19156 ?auto_19157 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_19159 - BLOCK
      ?auto_19160 - BLOCK
      ?auto_19161 - BLOCK
      ?auto_19162 - BLOCK
    )
    :vars
    (
      ?auto_19163 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_19159 ) ( ON ?auto_19160 ?auto_19159 ) ( not ( = ?auto_19159 ?auto_19160 ) ) ( not ( = ?auto_19159 ?auto_19161 ) ) ( not ( = ?auto_19159 ?auto_19162 ) ) ( not ( = ?auto_19160 ?auto_19161 ) ) ( not ( = ?auto_19160 ?auto_19162 ) ) ( not ( = ?auto_19161 ?auto_19162 ) ) ( ON ?auto_19162 ?auto_19163 ) ( CLEAR ?auto_19162 ) ( not ( = ?auto_19159 ?auto_19163 ) ) ( not ( = ?auto_19160 ?auto_19163 ) ) ( not ( = ?auto_19161 ?auto_19163 ) ) ( not ( = ?auto_19162 ?auto_19163 ) ) ( HOLDING ?auto_19161 ) ( CLEAR ?auto_19160 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_19159 ?auto_19160 ?auto_19161 )
      ( MAKE-4PILE ?auto_19159 ?auto_19160 ?auto_19161 ?auto_19162 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_19164 - BLOCK
      ?auto_19165 - BLOCK
      ?auto_19166 - BLOCK
      ?auto_19167 - BLOCK
    )
    :vars
    (
      ?auto_19168 - BLOCK
      ?auto_19169 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_19164 ) ( ON ?auto_19165 ?auto_19164 ) ( not ( = ?auto_19164 ?auto_19165 ) ) ( not ( = ?auto_19164 ?auto_19166 ) ) ( not ( = ?auto_19164 ?auto_19167 ) ) ( not ( = ?auto_19165 ?auto_19166 ) ) ( not ( = ?auto_19165 ?auto_19167 ) ) ( not ( = ?auto_19166 ?auto_19167 ) ) ( ON ?auto_19167 ?auto_19168 ) ( not ( = ?auto_19164 ?auto_19168 ) ) ( not ( = ?auto_19165 ?auto_19168 ) ) ( not ( = ?auto_19166 ?auto_19168 ) ) ( not ( = ?auto_19167 ?auto_19168 ) ) ( CLEAR ?auto_19165 ) ( ON ?auto_19166 ?auto_19167 ) ( CLEAR ?auto_19166 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_19169 ) ( ON ?auto_19168 ?auto_19169 ) ( not ( = ?auto_19169 ?auto_19168 ) ) ( not ( = ?auto_19169 ?auto_19167 ) ) ( not ( = ?auto_19169 ?auto_19166 ) ) ( not ( = ?auto_19164 ?auto_19169 ) ) ( not ( = ?auto_19165 ?auto_19169 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_19169 ?auto_19168 ?auto_19167 )
      ( MAKE-4PILE ?auto_19164 ?auto_19165 ?auto_19166 ?auto_19167 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_19170 - BLOCK
      ?auto_19171 - BLOCK
      ?auto_19172 - BLOCK
      ?auto_19173 - BLOCK
    )
    :vars
    (
      ?auto_19175 - BLOCK
      ?auto_19174 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_19170 ) ( not ( = ?auto_19170 ?auto_19171 ) ) ( not ( = ?auto_19170 ?auto_19172 ) ) ( not ( = ?auto_19170 ?auto_19173 ) ) ( not ( = ?auto_19171 ?auto_19172 ) ) ( not ( = ?auto_19171 ?auto_19173 ) ) ( not ( = ?auto_19172 ?auto_19173 ) ) ( ON ?auto_19173 ?auto_19175 ) ( not ( = ?auto_19170 ?auto_19175 ) ) ( not ( = ?auto_19171 ?auto_19175 ) ) ( not ( = ?auto_19172 ?auto_19175 ) ) ( not ( = ?auto_19173 ?auto_19175 ) ) ( ON ?auto_19172 ?auto_19173 ) ( CLEAR ?auto_19172 ) ( ON-TABLE ?auto_19174 ) ( ON ?auto_19175 ?auto_19174 ) ( not ( = ?auto_19174 ?auto_19175 ) ) ( not ( = ?auto_19174 ?auto_19173 ) ) ( not ( = ?auto_19174 ?auto_19172 ) ) ( not ( = ?auto_19170 ?auto_19174 ) ) ( not ( = ?auto_19171 ?auto_19174 ) ) ( HOLDING ?auto_19171 ) ( CLEAR ?auto_19170 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_19170 ?auto_19171 )
      ( MAKE-4PILE ?auto_19170 ?auto_19171 ?auto_19172 ?auto_19173 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_19176 - BLOCK
      ?auto_19177 - BLOCK
      ?auto_19178 - BLOCK
      ?auto_19179 - BLOCK
    )
    :vars
    (
      ?auto_19180 - BLOCK
      ?auto_19181 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_19176 ) ( not ( = ?auto_19176 ?auto_19177 ) ) ( not ( = ?auto_19176 ?auto_19178 ) ) ( not ( = ?auto_19176 ?auto_19179 ) ) ( not ( = ?auto_19177 ?auto_19178 ) ) ( not ( = ?auto_19177 ?auto_19179 ) ) ( not ( = ?auto_19178 ?auto_19179 ) ) ( ON ?auto_19179 ?auto_19180 ) ( not ( = ?auto_19176 ?auto_19180 ) ) ( not ( = ?auto_19177 ?auto_19180 ) ) ( not ( = ?auto_19178 ?auto_19180 ) ) ( not ( = ?auto_19179 ?auto_19180 ) ) ( ON ?auto_19178 ?auto_19179 ) ( ON-TABLE ?auto_19181 ) ( ON ?auto_19180 ?auto_19181 ) ( not ( = ?auto_19181 ?auto_19180 ) ) ( not ( = ?auto_19181 ?auto_19179 ) ) ( not ( = ?auto_19181 ?auto_19178 ) ) ( not ( = ?auto_19176 ?auto_19181 ) ) ( not ( = ?auto_19177 ?auto_19181 ) ) ( CLEAR ?auto_19176 ) ( ON ?auto_19177 ?auto_19178 ) ( CLEAR ?auto_19177 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_19181 ?auto_19180 ?auto_19179 ?auto_19178 )
      ( MAKE-4PILE ?auto_19176 ?auto_19177 ?auto_19178 ?auto_19179 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_19182 - BLOCK
      ?auto_19183 - BLOCK
      ?auto_19184 - BLOCK
      ?auto_19185 - BLOCK
    )
    :vars
    (
      ?auto_19187 - BLOCK
      ?auto_19186 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19182 ?auto_19183 ) ) ( not ( = ?auto_19182 ?auto_19184 ) ) ( not ( = ?auto_19182 ?auto_19185 ) ) ( not ( = ?auto_19183 ?auto_19184 ) ) ( not ( = ?auto_19183 ?auto_19185 ) ) ( not ( = ?auto_19184 ?auto_19185 ) ) ( ON ?auto_19185 ?auto_19187 ) ( not ( = ?auto_19182 ?auto_19187 ) ) ( not ( = ?auto_19183 ?auto_19187 ) ) ( not ( = ?auto_19184 ?auto_19187 ) ) ( not ( = ?auto_19185 ?auto_19187 ) ) ( ON ?auto_19184 ?auto_19185 ) ( ON-TABLE ?auto_19186 ) ( ON ?auto_19187 ?auto_19186 ) ( not ( = ?auto_19186 ?auto_19187 ) ) ( not ( = ?auto_19186 ?auto_19185 ) ) ( not ( = ?auto_19186 ?auto_19184 ) ) ( not ( = ?auto_19182 ?auto_19186 ) ) ( not ( = ?auto_19183 ?auto_19186 ) ) ( ON ?auto_19183 ?auto_19184 ) ( CLEAR ?auto_19183 ) ( HOLDING ?auto_19182 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_19182 )
      ( MAKE-4PILE ?auto_19182 ?auto_19183 ?auto_19184 ?auto_19185 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_19188 - BLOCK
      ?auto_19189 - BLOCK
      ?auto_19190 - BLOCK
      ?auto_19191 - BLOCK
    )
    :vars
    (
      ?auto_19193 - BLOCK
      ?auto_19192 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19188 ?auto_19189 ) ) ( not ( = ?auto_19188 ?auto_19190 ) ) ( not ( = ?auto_19188 ?auto_19191 ) ) ( not ( = ?auto_19189 ?auto_19190 ) ) ( not ( = ?auto_19189 ?auto_19191 ) ) ( not ( = ?auto_19190 ?auto_19191 ) ) ( ON ?auto_19191 ?auto_19193 ) ( not ( = ?auto_19188 ?auto_19193 ) ) ( not ( = ?auto_19189 ?auto_19193 ) ) ( not ( = ?auto_19190 ?auto_19193 ) ) ( not ( = ?auto_19191 ?auto_19193 ) ) ( ON ?auto_19190 ?auto_19191 ) ( ON-TABLE ?auto_19192 ) ( ON ?auto_19193 ?auto_19192 ) ( not ( = ?auto_19192 ?auto_19193 ) ) ( not ( = ?auto_19192 ?auto_19191 ) ) ( not ( = ?auto_19192 ?auto_19190 ) ) ( not ( = ?auto_19188 ?auto_19192 ) ) ( not ( = ?auto_19189 ?auto_19192 ) ) ( ON ?auto_19189 ?auto_19190 ) ( ON ?auto_19188 ?auto_19189 ) ( CLEAR ?auto_19188 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_19192 ?auto_19193 ?auto_19191 ?auto_19190 ?auto_19189 )
      ( MAKE-4PILE ?auto_19188 ?auto_19189 ?auto_19190 ?auto_19191 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_19195 - BLOCK
    )
    :vars
    (
      ?auto_19196 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19196 ?auto_19195 ) ( CLEAR ?auto_19196 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_19195 ) ( not ( = ?auto_19195 ?auto_19196 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_19196 ?auto_19195 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_19197 - BLOCK
    )
    :vars
    (
      ?auto_19198 - BLOCK
      ?auto_19199 - BLOCK
      ?auto_19200 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19198 ?auto_19197 ) ( CLEAR ?auto_19198 ) ( ON-TABLE ?auto_19197 ) ( not ( = ?auto_19197 ?auto_19198 ) ) ( HOLDING ?auto_19199 ) ( CLEAR ?auto_19200 ) ( not ( = ?auto_19197 ?auto_19199 ) ) ( not ( = ?auto_19197 ?auto_19200 ) ) ( not ( = ?auto_19198 ?auto_19199 ) ) ( not ( = ?auto_19198 ?auto_19200 ) ) ( not ( = ?auto_19199 ?auto_19200 ) ) )
    :subtasks
    ( ( !STACK ?auto_19199 ?auto_19200 )
      ( MAKE-1PILE ?auto_19197 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_19201 - BLOCK
    )
    :vars
    (
      ?auto_19202 - BLOCK
      ?auto_19204 - BLOCK
      ?auto_19203 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19202 ?auto_19201 ) ( ON-TABLE ?auto_19201 ) ( not ( = ?auto_19201 ?auto_19202 ) ) ( CLEAR ?auto_19204 ) ( not ( = ?auto_19201 ?auto_19203 ) ) ( not ( = ?auto_19201 ?auto_19204 ) ) ( not ( = ?auto_19202 ?auto_19203 ) ) ( not ( = ?auto_19202 ?auto_19204 ) ) ( not ( = ?auto_19203 ?auto_19204 ) ) ( ON ?auto_19203 ?auto_19202 ) ( CLEAR ?auto_19203 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_19201 ?auto_19202 )
      ( MAKE-1PILE ?auto_19201 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_19205 - BLOCK
    )
    :vars
    (
      ?auto_19206 - BLOCK
      ?auto_19208 - BLOCK
      ?auto_19207 - BLOCK
      ?auto_19210 - BLOCK
      ?auto_19209 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19206 ?auto_19205 ) ( ON-TABLE ?auto_19205 ) ( not ( = ?auto_19205 ?auto_19206 ) ) ( not ( = ?auto_19205 ?auto_19208 ) ) ( not ( = ?auto_19205 ?auto_19207 ) ) ( not ( = ?auto_19206 ?auto_19208 ) ) ( not ( = ?auto_19206 ?auto_19207 ) ) ( not ( = ?auto_19208 ?auto_19207 ) ) ( ON ?auto_19208 ?auto_19206 ) ( CLEAR ?auto_19208 ) ( HOLDING ?auto_19207 ) ( CLEAR ?auto_19210 ) ( ON-TABLE ?auto_19209 ) ( ON ?auto_19210 ?auto_19209 ) ( not ( = ?auto_19209 ?auto_19210 ) ) ( not ( = ?auto_19209 ?auto_19207 ) ) ( not ( = ?auto_19210 ?auto_19207 ) ) ( not ( = ?auto_19205 ?auto_19210 ) ) ( not ( = ?auto_19205 ?auto_19209 ) ) ( not ( = ?auto_19206 ?auto_19210 ) ) ( not ( = ?auto_19206 ?auto_19209 ) ) ( not ( = ?auto_19208 ?auto_19210 ) ) ( not ( = ?auto_19208 ?auto_19209 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_19209 ?auto_19210 ?auto_19207 )
      ( MAKE-1PILE ?auto_19205 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_19211 - BLOCK
    )
    :vars
    (
      ?auto_19214 - BLOCK
      ?auto_19215 - BLOCK
      ?auto_19212 - BLOCK
      ?auto_19216 - BLOCK
      ?auto_19213 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19214 ?auto_19211 ) ( ON-TABLE ?auto_19211 ) ( not ( = ?auto_19211 ?auto_19214 ) ) ( not ( = ?auto_19211 ?auto_19215 ) ) ( not ( = ?auto_19211 ?auto_19212 ) ) ( not ( = ?auto_19214 ?auto_19215 ) ) ( not ( = ?auto_19214 ?auto_19212 ) ) ( not ( = ?auto_19215 ?auto_19212 ) ) ( ON ?auto_19215 ?auto_19214 ) ( CLEAR ?auto_19216 ) ( ON-TABLE ?auto_19213 ) ( ON ?auto_19216 ?auto_19213 ) ( not ( = ?auto_19213 ?auto_19216 ) ) ( not ( = ?auto_19213 ?auto_19212 ) ) ( not ( = ?auto_19216 ?auto_19212 ) ) ( not ( = ?auto_19211 ?auto_19216 ) ) ( not ( = ?auto_19211 ?auto_19213 ) ) ( not ( = ?auto_19214 ?auto_19216 ) ) ( not ( = ?auto_19214 ?auto_19213 ) ) ( not ( = ?auto_19215 ?auto_19216 ) ) ( not ( = ?auto_19215 ?auto_19213 ) ) ( ON ?auto_19212 ?auto_19215 ) ( CLEAR ?auto_19212 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_19211 ?auto_19214 ?auto_19215 )
      ( MAKE-1PILE ?auto_19211 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_19217 - BLOCK
    )
    :vars
    (
      ?auto_19221 - BLOCK
      ?auto_19222 - BLOCK
      ?auto_19219 - BLOCK
      ?auto_19218 - BLOCK
      ?auto_19220 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19221 ?auto_19217 ) ( ON-TABLE ?auto_19217 ) ( not ( = ?auto_19217 ?auto_19221 ) ) ( not ( = ?auto_19217 ?auto_19222 ) ) ( not ( = ?auto_19217 ?auto_19219 ) ) ( not ( = ?auto_19221 ?auto_19222 ) ) ( not ( = ?auto_19221 ?auto_19219 ) ) ( not ( = ?auto_19222 ?auto_19219 ) ) ( ON ?auto_19222 ?auto_19221 ) ( ON-TABLE ?auto_19218 ) ( not ( = ?auto_19218 ?auto_19220 ) ) ( not ( = ?auto_19218 ?auto_19219 ) ) ( not ( = ?auto_19220 ?auto_19219 ) ) ( not ( = ?auto_19217 ?auto_19220 ) ) ( not ( = ?auto_19217 ?auto_19218 ) ) ( not ( = ?auto_19221 ?auto_19220 ) ) ( not ( = ?auto_19221 ?auto_19218 ) ) ( not ( = ?auto_19222 ?auto_19220 ) ) ( not ( = ?auto_19222 ?auto_19218 ) ) ( ON ?auto_19219 ?auto_19222 ) ( CLEAR ?auto_19219 ) ( HOLDING ?auto_19220 ) ( CLEAR ?auto_19218 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_19218 ?auto_19220 )
      ( MAKE-1PILE ?auto_19217 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_19223 - BLOCK
    )
    :vars
    (
      ?auto_19226 - BLOCK
      ?auto_19228 - BLOCK
      ?auto_19224 - BLOCK
      ?auto_19225 - BLOCK
      ?auto_19227 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19226 ?auto_19223 ) ( ON-TABLE ?auto_19223 ) ( not ( = ?auto_19223 ?auto_19226 ) ) ( not ( = ?auto_19223 ?auto_19228 ) ) ( not ( = ?auto_19223 ?auto_19224 ) ) ( not ( = ?auto_19226 ?auto_19228 ) ) ( not ( = ?auto_19226 ?auto_19224 ) ) ( not ( = ?auto_19228 ?auto_19224 ) ) ( ON ?auto_19228 ?auto_19226 ) ( ON-TABLE ?auto_19225 ) ( not ( = ?auto_19225 ?auto_19227 ) ) ( not ( = ?auto_19225 ?auto_19224 ) ) ( not ( = ?auto_19227 ?auto_19224 ) ) ( not ( = ?auto_19223 ?auto_19227 ) ) ( not ( = ?auto_19223 ?auto_19225 ) ) ( not ( = ?auto_19226 ?auto_19227 ) ) ( not ( = ?auto_19226 ?auto_19225 ) ) ( not ( = ?auto_19228 ?auto_19227 ) ) ( not ( = ?auto_19228 ?auto_19225 ) ) ( ON ?auto_19224 ?auto_19228 ) ( CLEAR ?auto_19225 ) ( ON ?auto_19227 ?auto_19224 ) ( CLEAR ?auto_19227 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_19223 ?auto_19226 ?auto_19228 ?auto_19224 )
      ( MAKE-1PILE ?auto_19223 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_19229 - BLOCK
    )
    :vars
    (
      ?auto_19230 - BLOCK
      ?auto_19231 - BLOCK
      ?auto_19234 - BLOCK
      ?auto_19233 - BLOCK
      ?auto_19232 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19230 ?auto_19229 ) ( ON-TABLE ?auto_19229 ) ( not ( = ?auto_19229 ?auto_19230 ) ) ( not ( = ?auto_19229 ?auto_19231 ) ) ( not ( = ?auto_19229 ?auto_19234 ) ) ( not ( = ?auto_19230 ?auto_19231 ) ) ( not ( = ?auto_19230 ?auto_19234 ) ) ( not ( = ?auto_19231 ?auto_19234 ) ) ( ON ?auto_19231 ?auto_19230 ) ( not ( = ?auto_19233 ?auto_19232 ) ) ( not ( = ?auto_19233 ?auto_19234 ) ) ( not ( = ?auto_19232 ?auto_19234 ) ) ( not ( = ?auto_19229 ?auto_19232 ) ) ( not ( = ?auto_19229 ?auto_19233 ) ) ( not ( = ?auto_19230 ?auto_19232 ) ) ( not ( = ?auto_19230 ?auto_19233 ) ) ( not ( = ?auto_19231 ?auto_19232 ) ) ( not ( = ?auto_19231 ?auto_19233 ) ) ( ON ?auto_19234 ?auto_19231 ) ( ON ?auto_19232 ?auto_19234 ) ( CLEAR ?auto_19232 ) ( HOLDING ?auto_19233 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_19233 )
      ( MAKE-1PILE ?auto_19229 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_19235 - BLOCK
    )
    :vars
    (
      ?auto_19240 - BLOCK
      ?auto_19238 - BLOCK
      ?auto_19236 - BLOCK
      ?auto_19239 - BLOCK
      ?auto_19237 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19240 ?auto_19235 ) ( ON-TABLE ?auto_19235 ) ( not ( = ?auto_19235 ?auto_19240 ) ) ( not ( = ?auto_19235 ?auto_19238 ) ) ( not ( = ?auto_19235 ?auto_19236 ) ) ( not ( = ?auto_19240 ?auto_19238 ) ) ( not ( = ?auto_19240 ?auto_19236 ) ) ( not ( = ?auto_19238 ?auto_19236 ) ) ( ON ?auto_19238 ?auto_19240 ) ( not ( = ?auto_19239 ?auto_19237 ) ) ( not ( = ?auto_19239 ?auto_19236 ) ) ( not ( = ?auto_19237 ?auto_19236 ) ) ( not ( = ?auto_19235 ?auto_19237 ) ) ( not ( = ?auto_19235 ?auto_19239 ) ) ( not ( = ?auto_19240 ?auto_19237 ) ) ( not ( = ?auto_19240 ?auto_19239 ) ) ( not ( = ?auto_19238 ?auto_19237 ) ) ( not ( = ?auto_19238 ?auto_19239 ) ) ( ON ?auto_19236 ?auto_19238 ) ( ON ?auto_19237 ?auto_19236 ) ( ON ?auto_19239 ?auto_19237 ) ( CLEAR ?auto_19239 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_19235 ?auto_19240 ?auto_19238 ?auto_19236 ?auto_19237 )
      ( MAKE-1PILE ?auto_19235 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_19246 - BLOCK
      ?auto_19247 - BLOCK
      ?auto_19248 - BLOCK
      ?auto_19249 - BLOCK
      ?auto_19250 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_19250 ) ( CLEAR ?auto_19249 ) ( ON-TABLE ?auto_19246 ) ( ON ?auto_19247 ?auto_19246 ) ( ON ?auto_19248 ?auto_19247 ) ( ON ?auto_19249 ?auto_19248 ) ( not ( = ?auto_19246 ?auto_19247 ) ) ( not ( = ?auto_19246 ?auto_19248 ) ) ( not ( = ?auto_19246 ?auto_19249 ) ) ( not ( = ?auto_19246 ?auto_19250 ) ) ( not ( = ?auto_19247 ?auto_19248 ) ) ( not ( = ?auto_19247 ?auto_19249 ) ) ( not ( = ?auto_19247 ?auto_19250 ) ) ( not ( = ?auto_19248 ?auto_19249 ) ) ( not ( = ?auto_19248 ?auto_19250 ) ) ( not ( = ?auto_19249 ?auto_19250 ) ) )
    :subtasks
    ( ( !STACK ?auto_19250 ?auto_19249 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_19251 - BLOCK
      ?auto_19252 - BLOCK
      ?auto_19253 - BLOCK
      ?auto_19254 - BLOCK
      ?auto_19255 - BLOCK
    )
    :vars
    (
      ?auto_19256 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_19254 ) ( ON-TABLE ?auto_19251 ) ( ON ?auto_19252 ?auto_19251 ) ( ON ?auto_19253 ?auto_19252 ) ( ON ?auto_19254 ?auto_19253 ) ( not ( = ?auto_19251 ?auto_19252 ) ) ( not ( = ?auto_19251 ?auto_19253 ) ) ( not ( = ?auto_19251 ?auto_19254 ) ) ( not ( = ?auto_19251 ?auto_19255 ) ) ( not ( = ?auto_19252 ?auto_19253 ) ) ( not ( = ?auto_19252 ?auto_19254 ) ) ( not ( = ?auto_19252 ?auto_19255 ) ) ( not ( = ?auto_19253 ?auto_19254 ) ) ( not ( = ?auto_19253 ?auto_19255 ) ) ( not ( = ?auto_19254 ?auto_19255 ) ) ( ON ?auto_19255 ?auto_19256 ) ( CLEAR ?auto_19255 ) ( HAND-EMPTY ) ( not ( = ?auto_19251 ?auto_19256 ) ) ( not ( = ?auto_19252 ?auto_19256 ) ) ( not ( = ?auto_19253 ?auto_19256 ) ) ( not ( = ?auto_19254 ?auto_19256 ) ) ( not ( = ?auto_19255 ?auto_19256 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_19255 ?auto_19256 )
      ( MAKE-5PILE ?auto_19251 ?auto_19252 ?auto_19253 ?auto_19254 ?auto_19255 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_19257 - BLOCK
      ?auto_19258 - BLOCK
      ?auto_19259 - BLOCK
      ?auto_19260 - BLOCK
      ?auto_19261 - BLOCK
    )
    :vars
    (
      ?auto_19262 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_19257 ) ( ON ?auto_19258 ?auto_19257 ) ( ON ?auto_19259 ?auto_19258 ) ( not ( = ?auto_19257 ?auto_19258 ) ) ( not ( = ?auto_19257 ?auto_19259 ) ) ( not ( = ?auto_19257 ?auto_19260 ) ) ( not ( = ?auto_19257 ?auto_19261 ) ) ( not ( = ?auto_19258 ?auto_19259 ) ) ( not ( = ?auto_19258 ?auto_19260 ) ) ( not ( = ?auto_19258 ?auto_19261 ) ) ( not ( = ?auto_19259 ?auto_19260 ) ) ( not ( = ?auto_19259 ?auto_19261 ) ) ( not ( = ?auto_19260 ?auto_19261 ) ) ( ON ?auto_19261 ?auto_19262 ) ( CLEAR ?auto_19261 ) ( not ( = ?auto_19257 ?auto_19262 ) ) ( not ( = ?auto_19258 ?auto_19262 ) ) ( not ( = ?auto_19259 ?auto_19262 ) ) ( not ( = ?auto_19260 ?auto_19262 ) ) ( not ( = ?auto_19261 ?auto_19262 ) ) ( HOLDING ?auto_19260 ) ( CLEAR ?auto_19259 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_19257 ?auto_19258 ?auto_19259 ?auto_19260 )
      ( MAKE-5PILE ?auto_19257 ?auto_19258 ?auto_19259 ?auto_19260 ?auto_19261 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_19263 - BLOCK
      ?auto_19264 - BLOCK
      ?auto_19265 - BLOCK
      ?auto_19266 - BLOCK
      ?auto_19267 - BLOCK
    )
    :vars
    (
      ?auto_19268 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_19263 ) ( ON ?auto_19264 ?auto_19263 ) ( ON ?auto_19265 ?auto_19264 ) ( not ( = ?auto_19263 ?auto_19264 ) ) ( not ( = ?auto_19263 ?auto_19265 ) ) ( not ( = ?auto_19263 ?auto_19266 ) ) ( not ( = ?auto_19263 ?auto_19267 ) ) ( not ( = ?auto_19264 ?auto_19265 ) ) ( not ( = ?auto_19264 ?auto_19266 ) ) ( not ( = ?auto_19264 ?auto_19267 ) ) ( not ( = ?auto_19265 ?auto_19266 ) ) ( not ( = ?auto_19265 ?auto_19267 ) ) ( not ( = ?auto_19266 ?auto_19267 ) ) ( ON ?auto_19267 ?auto_19268 ) ( not ( = ?auto_19263 ?auto_19268 ) ) ( not ( = ?auto_19264 ?auto_19268 ) ) ( not ( = ?auto_19265 ?auto_19268 ) ) ( not ( = ?auto_19266 ?auto_19268 ) ) ( not ( = ?auto_19267 ?auto_19268 ) ) ( CLEAR ?auto_19265 ) ( ON ?auto_19266 ?auto_19267 ) ( CLEAR ?auto_19266 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_19268 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_19268 ?auto_19267 )
      ( MAKE-5PILE ?auto_19263 ?auto_19264 ?auto_19265 ?auto_19266 ?auto_19267 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_19269 - BLOCK
      ?auto_19270 - BLOCK
      ?auto_19271 - BLOCK
      ?auto_19272 - BLOCK
      ?auto_19273 - BLOCK
    )
    :vars
    (
      ?auto_19274 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_19269 ) ( ON ?auto_19270 ?auto_19269 ) ( not ( = ?auto_19269 ?auto_19270 ) ) ( not ( = ?auto_19269 ?auto_19271 ) ) ( not ( = ?auto_19269 ?auto_19272 ) ) ( not ( = ?auto_19269 ?auto_19273 ) ) ( not ( = ?auto_19270 ?auto_19271 ) ) ( not ( = ?auto_19270 ?auto_19272 ) ) ( not ( = ?auto_19270 ?auto_19273 ) ) ( not ( = ?auto_19271 ?auto_19272 ) ) ( not ( = ?auto_19271 ?auto_19273 ) ) ( not ( = ?auto_19272 ?auto_19273 ) ) ( ON ?auto_19273 ?auto_19274 ) ( not ( = ?auto_19269 ?auto_19274 ) ) ( not ( = ?auto_19270 ?auto_19274 ) ) ( not ( = ?auto_19271 ?auto_19274 ) ) ( not ( = ?auto_19272 ?auto_19274 ) ) ( not ( = ?auto_19273 ?auto_19274 ) ) ( ON ?auto_19272 ?auto_19273 ) ( CLEAR ?auto_19272 ) ( ON-TABLE ?auto_19274 ) ( HOLDING ?auto_19271 ) ( CLEAR ?auto_19270 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_19269 ?auto_19270 ?auto_19271 )
      ( MAKE-5PILE ?auto_19269 ?auto_19270 ?auto_19271 ?auto_19272 ?auto_19273 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_19275 - BLOCK
      ?auto_19276 - BLOCK
      ?auto_19277 - BLOCK
      ?auto_19278 - BLOCK
      ?auto_19279 - BLOCK
    )
    :vars
    (
      ?auto_19280 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_19275 ) ( ON ?auto_19276 ?auto_19275 ) ( not ( = ?auto_19275 ?auto_19276 ) ) ( not ( = ?auto_19275 ?auto_19277 ) ) ( not ( = ?auto_19275 ?auto_19278 ) ) ( not ( = ?auto_19275 ?auto_19279 ) ) ( not ( = ?auto_19276 ?auto_19277 ) ) ( not ( = ?auto_19276 ?auto_19278 ) ) ( not ( = ?auto_19276 ?auto_19279 ) ) ( not ( = ?auto_19277 ?auto_19278 ) ) ( not ( = ?auto_19277 ?auto_19279 ) ) ( not ( = ?auto_19278 ?auto_19279 ) ) ( ON ?auto_19279 ?auto_19280 ) ( not ( = ?auto_19275 ?auto_19280 ) ) ( not ( = ?auto_19276 ?auto_19280 ) ) ( not ( = ?auto_19277 ?auto_19280 ) ) ( not ( = ?auto_19278 ?auto_19280 ) ) ( not ( = ?auto_19279 ?auto_19280 ) ) ( ON ?auto_19278 ?auto_19279 ) ( ON-TABLE ?auto_19280 ) ( CLEAR ?auto_19276 ) ( ON ?auto_19277 ?auto_19278 ) ( CLEAR ?auto_19277 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_19280 ?auto_19279 ?auto_19278 )
      ( MAKE-5PILE ?auto_19275 ?auto_19276 ?auto_19277 ?auto_19278 ?auto_19279 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_19281 - BLOCK
      ?auto_19282 - BLOCK
      ?auto_19283 - BLOCK
      ?auto_19284 - BLOCK
      ?auto_19285 - BLOCK
    )
    :vars
    (
      ?auto_19286 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_19281 ) ( not ( = ?auto_19281 ?auto_19282 ) ) ( not ( = ?auto_19281 ?auto_19283 ) ) ( not ( = ?auto_19281 ?auto_19284 ) ) ( not ( = ?auto_19281 ?auto_19285 ) ) ( not ( = ?auto_19282 ?auto_19283 ) ) ( not ( = ?auto_19282 ?auto_19284 ) ) ( not ( = ?auto_19282 ?auto_19285 ) ) ( not ( = ?auto_19283 ?auto_19284 ) ) ( not ( = ?auto_19283 ?auto_19285 ) ) ( not ( = ?auto_19284 ?auto_19285 ) ) ( ON ?auto_19285 ?auto_19286 ) ( not ( = ?auto_19281 ?auto_19286 ) ) ( not ( = ?auto_19282 ?auto_19286 ) ) ( not ( = ?auto_19283 ?auto_19286 ) ) ( not ( = ?auto_19284 ?auto_19286 ) ) ( not ( = ?auto_19285 ?auto_19286 ) ) ( ON ?auto_19284 ?auto_19285 ) ( ON-TABLE ?auto_19286 ) ( ON ?auto_19283 ?auto_19284 ) ( CLEAR ?auto_19283 ) ( HOLDING ?auto_19282 ) ( CLEAR ?auto_19281 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_19281 ?auto_19282 )
      ( MAKE-5PILE ?auto_19281 ?auto_19282 ?auto_19283 ?auto_19284 ?auto_19285 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_19287 - BLOCK
      ?auto_19288 - BLOCK
      ?auto_19289 - BLOCK
      ?auto_19290 - BLOCK
      ?auto_19291 - BLOCK
    )
    :vars
    (
      ?auto_19292 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_19287 ) ( not ( = ?auto_19287 ?auto_19288 ) ) ( not ( = ?auto_19287 ?auto_19289 ) ) ( not ( = ?auto_19287 ?auto_19290 ) ) ( not ( = ?auto_19287 ?auto_19291 ) ) ( not ( = ?auto_19288 ?auto_19289 ) ) ( not ( = ?auto_19288 ?auto_19290 ) ) ( not ( = ?auto_19288 ?auto_19291 ) ) ( not ( = ?auto_19289 ?auto_19290 ) ) ( not ( = ?auto_19289 ?auto_19291 ) ) ( not ( = ?auto_19290 ?auto_19291 ) ) ( ON ?auto_19291 ?auto_19292 ) ( not ( = ?auto_19287 ?auto_19292 ) ) ( not ( = ?auto_19288 ?auto_19292 ) ) ( not ( = ?auto_19289 ?auto_19292 ) ) ( not ( = ?auto_19290 ?auto_19292 ) ) ( not ( = ?auto_19291 ?auto_19292 ) ) ( ON ?auto_19290 ?auto_19291 ) ( ON-TABLE ?auto_19292 ) ( ON ?auto_19289 ?auto_19290 ) ( CLEAR ?auto_19287 ) ( ON ?auto_19288 ?auto_19289 ) ( CLEAR ?auto_19288 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_19292 ?auto_19291 ?auto_19290 ?auto_19289 )
      ( MAKE-5PILE ?auto_19287 ?auto_19288 ?auto_19289 ?auto_19290 ?auto_19291 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_19293 - BLOCK
      ?auto_19294 - BLOCK
      ?auto_19295 - BLOCK
      ?auto_19296 - BLOCK
      ?auto_19297 - BLOCK
    )
    :vars
    (
      ?auto_19298 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19293 ?auto_19294 ) ) ( not ( = ?auto_19293 ?auto_19295 ) ) ( not ( = ?auto_19293 ?auto_19296 ) ) ( not ( = ?auto_19293 ?auto_19297 ) ) ( not ( = ?auto_19294 ?auto_19295 ) ) ( not ( = ?auto_19294 ?auto_19296 ) ) ( not ( = ?auto_19294 ?auto_19297 ) ) ( not ( = ?auto_19295 ?auto_19296 ) ) ( not ( = ?auto_19295 ?auto_19297 ) ) ( not ( = ?auto_19296 ?auto_19297 ) ) ( ON ?auto_19297 ?auto_19298 ) ( not ( = ?auto_19293 ?auto_19298 ) ) ( not ( = ?auto_19294 ?auto_19298 ) ) ( not ( = ?auto_19295 ?auto_19298 ) ) ( not ( = ?auto_19296 ?auto_19298 ) ) ( not ( = ?auto_19297 ?auto_19298 ) ) ( ON ?auto_19296 ?auto_19297 ) ( ON-TABLE ?auto_19298 ) ( ON ?auto_19295 ?auto_19296 ) ( ON ?auto_19294 ?auto_19295 ) ( CLEAR ?auto_19294 ) ( HOLDING ?auto_19293 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_19293 )
      ( MAKE-5PILE ?auto_19293 ?auto_19294 ?auto_19295 ?auto_19296 ?auto_19297 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_19299 - BLOCK
      ?auto_19300 - BLOCK
      ?auto_19301 - BLOCK
      ?auto_19302 - BLOCK
      ?auto_19303 - BLOCK
    )
    :vars
    (
      ?auto_19304 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19299 ?auto_19300 ) ) ( not ( = ?auto_19299 ?auto_19301 ) ) ( not ( = ?auto_19299 ?auto_19302 ) ) ( not ( = ?auto_19299 ?auto_19303 ) ) ( not ( = ?auto_19300 ?auto_19301 ) ) ( not ( = ?auto_19300 ?auto_19302 ) ) ( not ( = ?auto_19300 ?auto_19303 ) ) ( not ( = ?auto_19301 ?auto_19302 ) ) ( not ( = ?auto_19301 ?auto_19303 ) ) ( not ( = ?auto_19302 ?auto_19303 ) ) ( ON ?auto_19303 ?auto_19304 ) ( not ( = ?auto_19299 ?auto_19304 ) ) ( not ( = ?auto_19300 ?auto_19304 ) ) ( not ( = ?auto_19301 ?auto_19304 ) ) ( not ( = ?auto_19302 ?auto_19304 ) ) ( not ( = ?auto_19303 ?auto_19304 ) ) ( ON ?auto_19302 ?auto_19303 ) ( ON-TABLE ?auto_19304 ) ( ON ?auto_19301 ?auto_19302 ) ( ON ?auto_19300 ?auto_19301 ) ( ON ?auto_19299 ?auto_19300 ) ( CLEAR ?auto_19299 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_19304 ?auto_19303 ?auto_19302 ?auto_19301 ?auto_19300 )
      ( MAKE-5PILE ?auto_19299 ?auto_19300 ?auto_19301 ?auto_19302 ?auto_19303 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_19309 - BLOCK
      ?auto_19310 - BLOCK
      ?auto_19311 - BLOCK
      ?auto_19312 - BLOCK
    )
    :vars
    (
      ?auto_19313 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19313 ?auto_19312 ) ( CLEAR ?auto_19313 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_19309 ) ( ON ?auto_19310 ?auto_19309 ) ( ON ?auto_19311 ?auto_19310 ) ( ON ?auto_19312 ?auto_19311 ) ( not ( = ?auto_19309 ?auto_19310 ) ) ( not ( = ?auto_19309 ?auto_19311 ) ) ( not ( = ?auto_19309 ?auto_19312 ) ) ( not ( = ?auto_19309 ?auto_19313 ) ) ( not ( = ?auto_19310 ?auto_19311 ) ) ( not ( = ?auto_19310 ?auto_19312 ) ) ( not ( = ?auto_19310 ?auto_19313 ) ) ( not ( = ?auto_19311 ?auto_19312 ) ) ( not ( = ?auto_19311 ?auto_19313 ) ) ( not ( = ?auto_19312 ?auto_19313 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_19313 ?auto_19312 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_19325 - BLOCK
      ?auto_19326 - BLOCK
      ?auto_19327 - BLOCK
      ?auto_19328 - BLOCK
    )
    :vars
    (
      ?auto_19329 - BLOCK
      ?auto_19330 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_19325 ) ( ON ?auto_19326 ?auto_19325 ) ( ON ?auto_19327 ?auto_19326 ) ( not ( = ?auto_19325 ?auto_19326 ) ) ( not ( = ?auto_19325 ?auto_19327 ) ) ( not ( = ?auto_19325 ?auto_19328 ) ) ( not ( = ?auto_19325 ?auto_19329 ) ) ( not ( = ?auto_19326 ?auto_19327 ) ) ( not ( = ?auto_19326 ?auto_19328 ) ) ( not ( = ?auto_19326 ?auto_19329 ) ) ( not ( = ?auto_19327 ?auto_19328 ) ) ( not ( = ?auto_19327 ?auto_19329 ) ) ( not ( = ?auto_19328 ?auto_19329 ) ) ( ON ?auto_19329 ?auto_19330 ) ( CLEAR ?auto_19329 ) ( not ( = ?auto_19325 ?auto_19330 ) ) ( not ( = ?auto_19326 ?auto_19330 ) ) ( not ( = ?auto_19327 ?auto_19330 ) ) ( not ( = ?auto_19328 ?auto_19330 ) ) ( not ( = ?auto_19329 ?auto_19330 ) ) ( HOLDING ?auto_19328 ) ( CLEAR ?auto_19327 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_19325 ?auto_19326 ?auto_19327 ?auto_19328 ?auto_19329 )
      ( MAKE-4PILE ?auto_19325 ?auto_19326 ?auto_19327 ?auto_19328 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_19331 - BLOCK
      ?auto_19332 - BLOCK
      ?auto_19333 - BLOCK
      ?auto_19334 - BLOCK
    )
    :vars
    (
      ?auto_19335 - BLOCK
      ?auto_19336 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_19331 ) ( ON ?auto_19332 ?auto_19331 ) ( ON ?auto_19333 ?auto_19332 ) ( not ( = ?auto_19331 ?auto_19332 ) ) ( not ( = ?auto_19331 ?auto_19333 ) ) ( not ( = ?auto_19331 ?auto_19334 ) ) ( not ( = ?auto_19331 ?auto_19335 ) ) ( not ( = ?auto_19332 ?auto_19333 ) ) ( not ( = ?auto_19332 ?auto_19334 ) ) ( not ( = ?auto_19332 ?auto_19335 ) ) ( not ( = ?auto_19333 ?auto_19334 ) ) ( not ( = ?auto_19333 ?auto_19335 ) ) ( not ( = ?auto_19334 ?auto_19335 ) ) ( ON ?auto_19335 ?auto_19336 ) ( not ( = ?auto_19331 ?auto_19336 ) ) ( not ( = ?auto_19332 ?auto_19336 ) ) ( not ( = ?auto_19333 ?auto_19336 ) ) ( not ( = ?auto_19334 ?auto_19336 ) ) ( not ( = ?auto_19335 ?auto_19336 ) ) ( CLEAR ?auto_19333 ) ( ON ?auto_19334 ?auto_19335 ) ( CLEAR ?auto_19334 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_19336 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_19336 ?auto_19335 )
      ( MAKE-4PILE ?auto_19331 ?auto_19332 ?auto_19333 ?auto_19334 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_19337 - BLOCK
      ?auto_19338 - BLOCK
      ?auto_19339 - BLOCK
      ?auto_19340 - BLOCK
    )
    :vars
    (
      ?auto_19342 - BLOCK
      ?auto_19341 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_19337 ) ( ON ?auto_19338 ?auto_19337 ) ( not ( = ?auto_19337 ?auto_19338 ) ) ( not ( = ?auto_19337 ?auto_19339 ) ) ( not ( = ?auto_19337 ?auto_19340 ) ) ( not ( = ?auto_19337 ?auto_19342 ) ) ( not ( = ?auto_19338 ?auto_19339 ) ) ( not ( = ?auto_19338 ?auto_19340 ) ) ( not ( = ?auto_19338 ?auto_19342 ) ) ( not ( = ?auto_19339 ?auto_19340 ) ) ( not ( = ?auto_19339 ?auto_19342 ) ) ( not ( = ?auto_19340 ?auto_19342 ) ) ( ON ?auto_19342 ?auto_19341 ) ( not ( = ?auto_19337 ?auto_19341 ) ) ( not ( = ?auto_19338 ?auto_19341 ) ) ( not ( = ?auto_19339 ?auto_19341 ) ) ( not ( = ?auto_19340 ?auto_19341 ) ) ( not ( = ?auto_19342 ?auto_19341 ) ) ( ON ?auto_19340 ?auto_19342 ) ( CLEAR ?auto_19340 ) ( ON-TABLE ?auto_19341 ) ( HOLDING ?auto_19339 ) ( CLEAR ?auto_19338 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_19337 ?auto_19338 ?auto_19339 )
      ( MAKE-4PILE ?auto_19337 ?auto_19338 ?auto_19339 ?auto_19340 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_19343 - BLOCK
      ?auto_19344 - BLOCK
      ?auto_19345 - BLOCK
      ?auto_19346 - BLOCK
    )
    :vars
    (
      ?auto_19348 - BLOCK
      ?auto_19347 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_19343 ) ( ON ?auto_19344 ?auto_19343 ) ( not ( = ?auto_19343 ?auto_19344 ) ) ( not ( = ?auto_19343 ?auto_19345 ) ) ( not ( = ?auto_19343 ?auto_19346 ) ) ( not ( = ?auto_19343 ?auto_19348 ) ) ( not ( = ?auto_19344 ?auto_19345 ) ) ( not ( = ?auto_19344 ?auto_19346 ) ) ( not ( = ?auto_19344 ?auto_19348 ) ) ( not ( = ?auto_19345 ?auto_19346 ) ) ( not ( = ?auto_19345 ?auto_19348 ) ) ( not ( = ?auto_19346 ?auto_19348 ) ) ( ON ?auto_19348 ?auto_19347 ) ( not ( = ?auto_19343 ?auto_19347 ) ) ( not ( = ?auto_19344 ?auto_19347 ) ) ( not ( = ?auto_19345 ?auto_19347 ) ) ( not ( = ?auto_19346 ?auto_19347 ) ) ( not ( = ?auto_19348 ?auto_19347 ) ) ( ON ?auto_19346 ?auto_19348 ) ( ON-TABLE ?auto_19347 ) ( CLEAR ?auto_19344 ) ( ON ?auto_19345 ?auto_19346 ) ( CLEAR ?auto_19345 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_19347 ?auto_19348 ?auto_19346 )
      ( MAKE-4PILE ?auto_19343 ?auto_19344 ?auto_19345 ?auto_19346 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_19349 - BLOCK
      ?auto_19350 - BLOCK
      ?auto_19351 - BLOCK
      ?auto_19352 - BLOCK
    )
    :vars
    (
      ?auto_19354 - BLOCK
      ?auto_19353 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_19349 ) ( not ( = ?auto_19349 ?auto_19350 ) ) ( not ( = ?auto_19349 ?auto_19351 ) ) ( not ( = ?auto_19349 ?auto_19352 ) ) ( not ( = ?auto_19349 ?auto_19354 ) ) ( not ( = ?auto_19350 ?auto_19351 ) ) ( not ( = ?auto_19350 ?auto_19352 ) ) ( not ( = ?auto_19350 ?auto_19354 ) ) ( not ( = ?auto_19351 ?auto_19352 ) ) ( not ( = ?auto_19351 ?auto_19354 ) ) ( not ( = ?auto_19352 ?auto_19354 ) ) ( ON ?auto_19354 ?auto_19353 ) ( not ( = ?auto_19349 ?auto_19353 ) ) ( not ( = ?auto_19350 ?auto_19353 ) ) ( not ( = ?auto_19351 ?auto_19353 ) ) ( not ( = ?auto_19352 ?auto_19353 ) ) ( not ( = ?auto_19354 ?auto_19353 ) ) ( ON ?auto_19352 ?auto_19354 ) ( ON-TABLE ?auto_19353 ) ( ON ?auto_19351 ?auto_19352 ) ( CLEAR ?auto_19351 ) ( HOLDING ?auto_19350 ) ( CLEAR ?auto_19349 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_19349 ?auto_19350 )
      ( MAKE-4PILE ?auto_19349 ?auto_19350 ?auto_19351 ?auto_19352 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_19355 - BLOCK
      ?auto_19356 - BLOCK
      ?auto_19357 - BLOCK
      ?auto_19358 - BLOCK
    )
    :vars
    (
      ?auto_19360 - BLOCK
      ?auto_19359 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_19355 ) ( not ( = ?auto_19355 ?auto_19356 ) ) ( not ( = ?auto_19355 ?auto_19357 ) ) ( not ( = ?auto_19355 ?auto_19358 ) ) ( not ( = ?auto_19355 ?auto_19360 ) ) ( not ( = ?auto_19356 ?auto_19357 ) ) ( not ( = ?auto_19356 ?auto_19358 ) ) ( not ( = ?auto_19356 ?auto_19360 ) ) ( not ( = ?auto_19357 ?auto_19358 ) ) ( not ( = ?auto_19357 ?auto_19360 ) ) ( not ( = ?auto_19358 ?auto_19360 ) ) ( ON ?auto_19360 ?auto_19359 ) ( not ( = ?auto_19355 ?auto_19359 ) ) ( not ( = ?auto_19356 ?auto_19359 ) ) ( not ( = ?auto_19357 ?auto_19359 ) ) ( not ( = ?auto_19358 ?auto_19359 ) ) ( not ( = ?auto_19360 ?auto_19359 ) ) ( ON ?auto_19358 ?auto_19360 ) ( ON-TABLE ?auto_19359 ) ( ON ?auto_19357 ?auto_19358 ) ( CLEAR ?auto_19355 ) ( ON ?auto_19356 ?auto_19357 ) ( CLEAR ?auto_19356 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_19359 ?auto_19360 ?auto_19358 ?auto_19357 )
      ( MAKE-4PILE ?auto_19355 ?auto_19356 ?auto_19357 ?auto_19358 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_19361 - BLOCK
      ?auto_19362 - BLOCK
      ?auto_19363 - BLOCK
      ?auto_19364 - BLOCK
    )
    :vars
    (
      ?auto_19365 - BLOCK
      ?auto_19366 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19361 ?auto_19362 ) ) ( not ( = ?auto_19361 ?auto_19363 ) ) ( not ( = ?auto_19361 ?auto_19364 ) ) ( not ( = ?auto_19361 ?auto_19365 ) ) ( not ( = ?auto_19362 ?auto_19363 ) ) ( not ( = ?auto_19362 ?auto_19364 ) ) ( not ( = ?auto_19362 ?auto_19365 ) ) ( not ( = ?auto_19363 ?auto_19364 ) ) ( not ( = ?auto_19363 ?auto_19365 ) ) ( not ( = ?auto_19364 ?auto_19365 ) ) ( ON ?auto_19365 ?auto_19366 ) ( not ( = ?auto_19361 ?auto_19366 ) ) ( not ( = ?auto_19362 ?auto_19366 ) ) ( not ( = ?auto_19363 ?auto_19366 ) ) ( not ( = ?auto_19364 ?auto_19366 ) ) ( not ( = ?auto_19365 ?auto_19366 ) ) ( ON ?auto_19364 ?auto_19365 ) ( ON-TABLE ?auto_19366 ) ( ON ?auto_19363 ?auto_19364 ) ( ON ?auto_19362 ?auto_19363 ) ( CLEAR ?auto_19362 ) ( HOLDING ?auto_19361 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_19361 )
      ( MAKE-4PILE ?auto_19361 ?auto_19362 ?auto_19363 ?auto_19364 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_19367 - BLOCK
      ?auto_19368 - BLOCK
      ?auto_19369 - BLOCK
      ?auto_19370 - BLOCK
    )
    :vars
    (
      ?auto_19371 - BLOCK
      ?auto_19372 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19367 ?auto_19368 ) ) ( not ( = ?auto_19367 ?auto_19369 ) ) ( not ( = ?auto_19367 ?auto_19370 ) ) ( not ( = ?auto_19367 ?auto_19371 ) ) ( not ( = ?auto_19368 ?auto_19369 ) ) ( not ( = ?auto_19368 ?auto_19370 ) ) ( not ( = ?auto_19368 ?auto_19371 ) ) ( not ( = ?auto_19369 ?auto_19370 ) ) ( not ( = ?auto_19369 ?auto_19371 ) ) ( not ( = ?auto_19370 ?auto_19371 ) ) ( ON ?auto_19371 ?auto_19372 ) ( not ( = ?auto_19367 ?auto_19372 ) ) ( not ( = ?auto_19368 ?auto_19372 ) ) ( not ( = ?auto_19369 ?auto_19372 ) ) ( not ( = ?auto_19370 ?auto_19372 ) ) ( not ( = ?auto_19371 ?auto_19372 ) ) ( ON ?auto_19370 ?auto_19371 ) ( ON-TABLE ?auto_19372 ) ( ON ?auto_19369 ?auto_19370 ) ( ON ?auto_19368 ?auto_19369 ) ( ON ?auto_19367 ?auto_19368 ) ( CLEAR ?auto_19367 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_19372 ?auto_19371 ?auto_19370 ?auto_19369 ?auto_19368 )
      ( MAKE-4PILE ?auto_19367 ?auto_19368 ?auto_19369 ?auto_19370 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_19374 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_19374 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_19374 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_19375 - BLOCK
    )
    :vars
    (
      ?auto_19376 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19375 ?auto_19376 ) ( CLEAR ?auto_19375 ) ( HAND-EMPTY ) ( not ( = ?auto_19375 ?auto_19376 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_19375 ?auto_19376 )
      ( MAKE-1PILE ?auto_19375 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_19377 - BLOCK
    )
    :vars
    (
      ?auto_19378 - BLOCK
      ?auto_19380 - BLOCK
      ?auto_19381 - BLOCK
      ?auto_19379 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19377 ?auto_19378 ) ) ( HOLDING ?auto_19377 ) ( CLEAR ?auto_19378 ) ( ON-TABLE ?auto_19380 ) ( ON ?auto_19381 ?auto_19380 ) ( ON ?auto_19379 ?auto_19381 ) ( ON ?auto_19378 ?auto_19379 ) ( not ( = ?auto_19380 ?auto_19381 ) ) ( not ( = ?auto_19380 ?auto_19379 ) ) ( not ( = ?auto_19380 ?auto_19378 ) ) ( not ( = ?auto_19380 ?auto_19377 ) ) ( not ( = ?auto_19381 ?auto_19379 ) ) ( not ( = ?auto_19381 ?auto_19378 ) ) ( not ( = ?auto_19381 ?auto_19377 ) ) ( not ( = ?auto_19379 ?auto_19378 ) ) ( not ( = ?auto_19379 ?auto_19377 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_19380 ?auto_19381 ?auto_19379 ?auto_19378 ?auto_19377 )
      ( MAKE-1PILE ?auto_19377 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_19382 - BLOCK
    )
    :vars
    (
      ?auto_19383 - BLOCK
      ?auto_19384 - BLOCK
      ?auto_19386 - BLOCK
      ?auto_19385 - BLOCK
      ?auto_19387 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19382 ?auto_19383 ) ) ( CLEAR ?auto_19383 ) ( ON-TABLE ?auto_19384 ) ( ON ?auto_19386 ?auto_19384 ) ( ON ?auto_19385 ?auto_19386 ) ( ON ?auto_19383 ?auto_19385 ) ( not ( = ?auto_19384 ?auto_19386 ) ) ( not ( = ?auto_19384 ?auto_19385 ) ) ( not ( = ?auto_19384 ?auto_19383 ) ) ( not ( = ?auto_19384 ?auto_19382 ) ) ( not ( = ?auto_19386 ?auto_19385 ) ) ( not ( = ?auto_19386 ?auto_19383 ) ) ( not ( = ?auto_19386 ?auto_19382 ) ) ( not ( = ?auto_19385 ?auto_19383 ) ) ( not ( = ?auto_19385 ?auto_19382 ) ) ( ON ?auto_19382 ?auto_19387 ) ( CLEAR ?auto_19382 ) ( HAND-EMPTY ) ( not ( = ?auto_19382 ?auto_19387 ) ) ( not ( = ?auto_19383 ?auto_19387 ) ) ( not ( = ?auto_19384 ?auto_19387 ) ) ( not ( = ?auto_19386 ?auto_19387 ) ) ( not ( = ?auto_19385 ?auto_19387 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_19382 ?auto_19387 )
      ( MAKE-1PILE ?auto_19382 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_19388 - BLOCK
    )
    :vars
    (
      ?auto_19389 - BLOCK
      ?auto_19390 - BLOCK
      ?auto_19392 - BLOCK
      ?auto_19391 - BLOCK
      ?auto_19393 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19388 ?auto_19389 ) ) ( ON-TABLE ?auto_19390 ) ( ON ?auto_19392 ?auto_19390 ) ( ON ?auto_19391 ?auto_19392 ) ( not ( = ?auto_19390 ?auto_19392 ) ) ( not ( = ?auto_19390 ?auto_19391 ) ) ( not ( = ?auto_19390 ?auto_19389 ) ) ( not ( = ?auto_19390 ?auto_19388 ) ) ( not ( = ?auto_19392 ?auto_19391 ) ) ( not ( = ?auto_19392 ?auto_19389 ) ) ( not ( = ?auto_19392 ?auto_19388 ) ) ( not ( = ?auto_19391 ?auto_19389 ) ) ( not ( = ?auto_19391 ?auto_19388 ) ) ( ON ?auto_19388 ?auto_19393 ) ( CLEAR ?auto_19388 ) ( not ( = ?auto_19388 ?auto_19393 ) ) ( not ( = ?auto_19389 ?auto_19393 ) ) ( not ( = ?auto_19390 ?auto_19393 ) ) ( not ( = ?auto_19392 ?auto_19393 ) ) ( not ( = ?auto_19391 ?auto_19393 ) ) ( HOLDING ?auto_19389 ) ( CLEAR ?auto_19391 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_19390 ?auto_19392 ?auto_19391 ?auto_19389 )
      ( MAKE-1PILE ?auto_19388 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_19394 - BLOCK
    )
    :vars
    (
      ?auto_19398 - BLOCK
      ?auto_19397 - BLOCK
      ?auto_19396 - BLOCK
      ?auto_19395 - BLOCK
      ?auto_19399 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19394 ?auto_19398 ) ) ( ON-TABLE ?auto_19397 ) ( ON ?auto_19396 ?auto_19397 ) ( ON ?auto_19395 ?auto_19396 ) ( not ( = ?auto_19397 ?auto_19396 ) ) ( not ( = ?auto_19397 ?auto_19395 ) ) ( not ( = ?auto_19397 ?auto_19398 ) ) ( not ( = ?auto_19397 ?auto_19394 ) ) ( not ( = ?auto_19396 ?auto_19395 ) ) ( not ( = ?auto_19396 ?auto_19398 ) ) ( not ( = ?auto_19396 ?auto_19394 ) ) ( not ( = ?auto_19395 ?auto_19398 ) ) ( not ( = ?auto_19395 ?auto_19394 ) ) ( ON ?auto_19394 ?auto_19399 ) ( not ( = ?auto_19394 ?auto_19399 ) ) ( not ( = ?auto_19398 ?auto_19399 ) ) ( not ( = ?auto_19397 ?auto_19399 ) ) ( not ( = ?auto_19396 ?auto_19399 ) ) ( not ( = ?auto_19395 ?auto_19399 ) ) ( CLEAR ?auto_19395 ) ( ON ?auto_19398 ?auto_19394 ) ( CLEAR ?auto_19398 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_19399 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_19399 ?auto_19394 )
      ( MAKE-1PILE ?auto_19394 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_19400 - BLOCK
    )
    :vars
    (
      ?auto_19404 - BLOCK
      ?auto_19402 - BLOCK
      ?auto_19401 - BLOCK
      ?auto_19405 - BLOCK
      ?auto_19403 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19400 ?auto_19404 ) ) ( ON-TABLE ?auto_19402 ) ( ON ?auto_19401 ?auto_19402 ) ( not ( = ?auto_19402 ?auto_19401 ) ) ( not ( = ?auto_19402 ?auto_19405 ) ) ( not ( = ?auto_19402 ?auto_19404 ) ) ( not ( = ?auto_19402 ?auto_19400 ) ) ( not ( = ?auto_19401 ?auto_19405 ) ) ( not ( = ?auto_19401 ?auto_19404 ) ) ( not ( = ?auto_19401 ?auto_19400 ) ) ( not ( = ?auto_19405 ?auto_19404 ) ) ( not ( = ?auto_19405 ?auto_19400 ) ) ( ON ?auto_19400 ?auto_19403 ) ( not ( = ?auto_19400 ?auto_19403 ) ) ( not ( = ?auto_19404 ?auto_19403 ) ) ( not ( = ?auto_19402 ?auto_19403 ) ) ( not ( = ?auto_19401 ?auto_19403 ) ) ( not ( = ?auto_19405 ?auto_19403 ) ) ( ON ?auto_19404 ?auto_19400 ) ( CLEAR ?auto_19404 ) ( ON-TABLE ?auto_19403 ) ( HOLDING ?auto_19405 ) ( CLEAR ?auto_19401 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_19402 ?auto_19401 ?auto_19405 )
      ( MAKE-1PILE ?auto_19400 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_19406 - BLOCK
    )
    :vars
    (
      ?auto_19407 - BLOCK
      ?auto_19408 - BLOCK
      ?auto_19409 - BLOCK
      ?auto_19410 - BLOCK
      ?auto_19411 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19406 ?auto_19407 ) ) ( ON-TABLE ?auto_19408 ) ( ON ?auto_19409 ?auto_19408 ) ( not ( = ?auto_19408 ?auto_19409 ) ) ( not ( = ?auto_19408 ?auto_19410 ) ) ( not ( = ?auto_19408 ?auto_19407 ) ) ( not ( = ?auto_19408 ?auto_19406 ) ) ( not ( = ?auto_19409 ?auto_19410 ) ) ( not ( = ?auto_19409 ?auto_19407 ) ) ( not ( = ?auto_19409 ?auto_19406 ) ) ( not ( = ?auto_19410 ?auto_19407 ) ) ( not ( = ?auto_19410 ?auto_19406 ) ) ( ON ?auto_19406 ?auto_19411 ) ( not ( = ?auto_19406 ?auto_19411 ) ) ( not ( = ?auto_19407 ?auto_19411 ) ) ( not ( = ?auto_19408 ?auto_19411 ) ) ( not ( = ?auto_19409 ?auto_19411 ) ) ( not ( = ?auto_19410 ?auto_19411 ) ) ( ON ?auto_19407 ?auto_19406 ) ( ON-TABLE ?auto_19411 ) ( CLEAR ?auto_19409 ) ( ON ?auto_19410 ?auto_19407 ) ( CLEAR ?auto_19410 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_19411 ?auto_19406 ?auto_19407 )
      ( MAKE-1PILE ?auto_19406 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_19412 - BLOCK
    )
    :vars
    (
      ?auto_19416 - BLOCK
      ?auto_19415 - BLOCK
      ?auto_19413 - BLOCK
      ?auto_19417 - BLOCK
      ?auto_19414 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19412 ?auto_19416 ) ) ( ON-TABLE ?auto_19415 ) ( not ( = ?auto_19415 ?auto_19413 ) ) ( not ( = ?auto_19415 ?auto_19417 ) ) ( not ( = ?auto_19415 ?auto_19416 ) ) ( not ( = ?auto_19415 ?auto_19412 ) ) ( not ( = ?auto_19413 ?auto_19417 ) ) ( not ( = ?auto_19413 ?auto_19416 ) ) ( not ( = ?auto_19413 ?auto_19412 ) ) ( not ( = ?auto_19417 ?auto_19416 ) ) ( not ( = ?auto_19417 ?auto_19412 ) ) ( ON ?auto_19412 ?auto_19414 ) ( not ( = ?auto_19412 ?auto_19414 ) ) ( not ( = ?auto_19416 ?auto_19414 ) ) ( not ( = ?auto_19415 ?auto_19414 ) ) ( not ( = ?auto_19413 ?auto_19414 ) ) ( not ( = ?auto_19417 ?auto_19414 ) ) ( ON ?auto_19416 ?auto_19412 ) ( ON-TABLE ?auto_19414 ) ( ON ?auto_19417 ?auto_19416 ) ( CLEAR ?auto_19417 ) ( HOLDING ?auto_19413 ) ( CLEAR ?auto_19415 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_19415 ?auto_19413 )
      ( MAKE-1PILE ?auto_19412 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_19418 - BLOCK
    )
    :vars
    (
      ?auto_19420 - BLOCK
      ?auto_19421 - BLOCK
      ?auto_19422 - BLOCK
      ?auto_19419 - BLOCK
      ?auto_19423 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19418 ?auto_19420 ) ) ( ON-TABLE ?auto_19421 ) ( not ( = ?auto_19421 ?auto_19422 ) ) ( not ( = ?auto_19421 ?auto_19419 ) ) ( not ( = ?auto_19421 ?auto_19420 ) ) ( not ( = ?auto_19421 ?auto_19418 ) ) ( not ( = ?auto_19422 ?auto_19419 ) ) ( not ( = ?auto_19422 ?auto_19420 ) ) ( not ( = ?auto_19422 ?auto_19418 ) ) ( not ( = ?auto_19419 ?auto_19420 ) ) ( not ( = ?auto_19419 ?auto_19418 ) ) ( ON ?auto_19418 ?auto_19423 ) ( not ( = ?auto_19418 ?auto_19423 ) ) ( not ( = ?auto_19420 ?auto_19423 ) ) ( not ( = ?auto_19421 ?auto_19423 ) ) ( not ( = ?auto_19422 ?auto_19423 ) ) ( not ( = ?auto_19419 ?auto_19423 ) ) ( ON ?auto_19420 ?auto_19418 ) ( ON-TABLE ?auto_19423 ) ( ON ?auto_19419 ?auto_19420 ) ( CLEAR ?auto_19421 ) ( ON ?auto_19422 ?auto_19419 ) ( CLEAR ?auto_19422 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_19423 ?auto_19418 ?auto_19420 ?auto_19419 )
      ( MAKE-1PILE ?auto_19418 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_19424 - BLOCK
    )
    :vars
    (
      ?auto_19426 - BLOCK
      ?auto_19425 - BLOCK
      ?auto_19428 - BLOCK
      ?auto_19429 - BLOCK
      ?auto_19427 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19424 ?auto_19426 ) ) ( not ( = ?auto_19425 ?auto_19428 ) ) ( not ( = ?auto_19425 ?auto_19429 ) ) ( not ( = ?auto_19425 ?auto_19426 ) ) ( not ( = ?auto_19425 ?auto_19424 ) ) ( not ( = ?auto_19428 ?auto_19429 ) ) ( not ( = ?auto_19428 ?auto_19426 ) ) ( not ( = ?auto_19428 ?auto_19424 ) ) ( not ( = ?auto_19429 ?auto_19426 ) ) ( not ( = ?auto_19429 ?auto_19424 ) ) ( ON ?auto_19424 ?auto_19427 ) ( not ( = ?auto_19424 ?auto_19427 ) ) ( not ( = ?auto_19426 ?auto_19427 ) ) ( not ( = ?auto_19425 ?auto_19427 ) ) ( not ( = ?auto_19428 ?auto_19427 ) ) ( not ( = ?auto_19429 ?auto_19427 ) ) ( ON ?auto_19426 ?auto_19424 ) ( ON-TABLE ?auto_19427 ) ( ON ?auto_19429 ?auto_19426 ) ( ON ?auto_19428 ?auto_19429 ) ( CLEAR ?auto_19428 ) ( HOLDING ?auto_19425 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_19425 )
      ( MAKE-1PILE ?auto_19424 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_19430 - BLOCK
    )
    :vars
    (
      ?auto_19433 - BLOCK
      ?auto_19431 - BLOCK
      ?auto_19435 - BLOCK
      ?auto_19432 - BLOCK
      ?auto_19434 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19430 ?auto_19433 ) ) ( not ( = ?auto_19431 ?auto_19435 ) ) ( not ( = ?auto_19431 ?auto_19432 ) ) ( not ( = ?auto_19431 ?auto_19433 ) ) ( not ( = ?auto_19431 ?auto_19430 ) ) ( not ( = ?auto_19435 ?auto_19432 ) ) ( not ( = ?auto_19435 ?auto_19433 ) ) ( not ( = ?auto_19435 ?auto_19430 ) ) ( not ( = ?auto_19432 ?auto_19433 ) ) ( not ( = ?auto_19432 ?auto_19430 ) ) ( ON ?auto_19430 ?auto_19434 ) ( not ( = ?auto_19430 ?auto_19434 ) ) ( not ( = ?auto_19433 ?auto_19434 ) ) ( not ( = ?auto_19431 ?auto_19434 ) ) ( not ( = ?auto_19435 ?auto_19434 ) ) ( not ( = ?auto_19432 ?auto_19434 ) ) ( ON ?auto_19433 ?auto_19430 ) ( ON-TABLE ?auto_19434 ) ( ON ?auto_19432 ?auto_19433 ) ( ON ?auto_19435 ?auto_19432 ) ( ON ?auto_19431 ?auto_19435 ) ( CLEAR ?auto_19431 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_19434 ?auto_19430 ?auto_19433 ?auto_19432 ?auto_19435 )
      ( MAKE-1PILE ?auto_19430 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_19439 - BLOCK
      ?auto_19440 - BLOCK
      ?auto_19441 - BLOCK
    )
    :vars
    (
      ?auto_19442 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19442 ?auto_19441 ) ( CLEAR ?auto_19442 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_19439 ) ( ON ?auto_19440 ?auto_19439 ) ( ON ?auto_19441 ?auto_19440 ) ( not ( = ?auto_19439 ?auto_19440 ) ) ( not ( = ?auto_19439 ?auto_19441 ) ) ( not ( = ?auto_19439 ?auto_19442 ) ) ( not ( = ?auto_19440 ?auto_19441 ) ) ( not ( = ?auto_19440 ?auto_19442 ) ) ( not ( = ?auto_19441 ?auto_19442 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_19442 ?auto_19441 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_19443 - BLOCK
      ?auto_19444 - BLOCK
      ?auto_19445 - BLOCK
    )
    :vars
    (
      ?auto_19446 - BLOCK
      ?auto_19447 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19446 ?auto_19445 ) ( CLEAR ?auto_19446 ) ( ON-TABLE ?auto_19443 ) ( ON ?auto_19444 ?auto_19443 ) ( ON ?auto_19445 ?auto_19444 ) ( not ( = ?auto_19443 ?auto_19444 ) ) ( not ( = ?auto_19443 ?auto_19445 ) ) ( not ( = ?auto_19443 ?auto_19446 ) ) ( not ( = ?auto_19444 ?auto_19445 ) ) ( not ( = ?auto_19444 ?auto_19446 ) ) ( not ( = ?auto_19445 ?auto_19446 ) ) ( HOLDING ?auto_19447 ) ( not ( = ?auto_19443 ?auto_19447 ) ) ( not ( = ?auto_19444 ?auto_19447 ) ) ( not ( = ?auto_19445 ?auto_19447 ) ) ( not ( = ?auto_19446 ?auto_19447 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_19447 )
      ( MAKE-3PILE ?auto_19443 ?auto_19444 ?auto_19445 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_19448 - BLOCK
      ?auto_19449 - BLOCK
      ?auto_19450 - BLOCK
    )
    :vars
    (
      ?auto_19451 - BLOCK
      ?auto_19452 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19451 ?auto_19450 ) ( ON-TABLE ?auto_19448 ) ( ON ?auto_19449 ?auto_19448 ) ( ON ?auto_19450 ?auto_19449 ) ( not ( = ?auto_19448 ?auto_19449 ) ) ( not ( = ?auto_19448 ?auto_19450 ) ) ( not ( = ?auto_19448 ?auto_19451 ) ) ( not ( = ?auto_19449 ?auto_19450 ) ) ( not ( = ?auto_19449 ?auto_19451 ) ) ( not ( = ?auto_19450 ?auto_19451 ) ) ( not ( = ?auto_19448 ?auto_19452 ) ) ( not ( = ?auto_19449 ?auto_19452 ) ) ( not ( = ?auto_19450 ?auto_19452 ) ) ( not ( = ?auto_19451 ?auto_19452 ) ) ( ON ?auto_19452 ?auto_19451 ) ( CLEAR ?auto_19452 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_19448 ?auto_19449 ?auto_19450 ?auto_19451 )
      ( MAKE-3PILE ?auto_19448 ?auto_19449 ?auto_19450 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_19453 - BLOCK
      ?auto_19454 - BLOCK
      ?auto_19455 - BLOCK
    )
    :vars
    (
      ?auto_19457 - BLOCK
      ?auto_19456 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19457 ?auto_19455 ) ( ON-TABLE ?auto_19453 ) ( ON ?auto_19454 ?auto_19453 ) ( ON ?auto_19455 ?auto_19454 ) ( not ( = ?auto_19453 ?auto_19454 ) ) ( not ( = ?auto_19453 ?auto_19455 ) ) ( not ( = ?auto_19453 ?auto_19457 ) ) ( not ( = ?auto_19454 ?auto_19455 ) ) ( not ( = ?auto_19454 ?auto_19457 ) ) ( not ( = ?auto_19455 ?auto_19457 ) ) ( not ( = ?auto_19453 ?auto_19456 ) ) ( not ( = ?auto_19454 ?auto_19456 ) ) ( not ( = ?auto_19455 ?auto_19456 ) ) ( not ( = ?auto_19457 ?auto_19456 ) ) ( HOLDING ?auto_19456 ) ( CLEAR ?auto_19457 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_19453 ?auto_19454 ?auto_19455 ?auto_19457 ?auto_19456 )
      ( MAKE-3PILE ?auto_19453 ?auto_19454 ?auto_19455 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_19458 - BLOCK
      ?auto_19459 - BLOCK
      ?auto_19460 - BLOCK
    )
    :vars
    (
      ?auto_19462 - BLOCK
      ?auto_19461 - BLOCK
      ?auto_19463 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19462 ?auto_19460 ) ( ON-TABLE ?auto_19458 ) ( ON ?auto_19459 ?auto_19458 ) ( ON ?auto_19460 ?auto_19459 ) ( not ( = ?auto_19458 ?auto_19459 ) ) ( not ( = ?auto_19458 ?auto_19460 ) ) ( not ( = ?auto_19458 ?auto_19462 ) ) ( not ( = ?auto_19459 ?auto_19460 ) ) ( not ( = ?auto_19459 ?auto_19462 ) ) ( not ( = ?auto_19460 ?auto_19462 ) ) ( not ( = ?auto_19458 ?auto_19461 ) ) ( not ( = ?auto_19459 ?auto_19461 ) ) ( not ( = ?auto_19460 ?auto_19461 ) ) ( not ( = ?auto_19462 ?auto_19461 ) ) ( CLEAR ?auto_19462 ) ( ON ?auto_19461 ?auto_19463 ) ( CLEAR ?auto_19461 ) ( HAND-EMPTY ) ( not ( = ?auto_19458 ?auto_19463 ) ) ( not ( = ?auto_19459 ?auto_19463 ) ) ( not ( = ?auto_19460 ?auto_19463 ) ) ( not ( = ?auto_19462 ?auto_19463 ) ) ( not ( = ?auto_19461 ?auto_19463 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_19461 ?auto_19463 )
      ( MAKE-3PILE ?auto_19458 ?auto_19459 ?auto_19460 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_19476 - BLOCK
      ?auto_19477 - BLOCK
      ?auto_19478 - BLOCK
    )
    :vars
    (
      ?auto_19480 - BLOCK
      ?auto_19479 - BLOCK
      ?auto_19481 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_19476 ) ( ON ?auto_19477 ?auto_19476 ) ( not ( = ?auto_19476 ?auto_19477 ) ) ( not ( = ?auto_19476 ?auto_19478 ) ) ( not ( = ?auto_19476 ?auto_19480 ) ) ( not ( = ?auto_19477 ?auto_19478 ) ) ( not ( = ?auto_19477 ?auto_19480 ) ) ( not ( = ?auto_19478 ?auto_19480 ) ) ( not ( = ?auto_19476 ?auto_19479 ) ) ( not ( = ?auto_19477 ?auto_19479 ) ) ( not ( = ?auto_19478 ?auto_19479 ) ) ( not ( = ?auto_19480 ?auto_19479 ) ) ( ON ?auto_19479 ?auto_19481 ) ( not ( = ?auto_19476 ?auto_19481 ) ) ( not ( = ?auto_19477 ?auto_19481 ) ) ( not ( = ?auto_19478 ?auto_19481 ) ) ( not ( = ?auto_19480 ?auto_19481 ) ) ( not ( = ?auto_19479 ?auto_19481 ) ) ( ON ?auto_19480 ?auto_19479 ) ( CLEAR ?auto_19480 ) ( HOLDING ?auto_19478 ) ( CLEAR ?auto_19477 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_19476 ?auto_19477 ?auto_19478 ?auto_19480 )
      ( MAKE-3PILE ?auto_19476 ?auto_19477 ?auto_19478 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_19482 - BLOCK
      ?auto_19483 - BLOCK
      ?auto_19484 - BLOCK
    )
    :vars
    (
      ?auto_19486 - BLOCK
      ?auto_19487 - BLOCK
      ?auto_19485 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_19482 ) ( ON ?auto_19483 ?auto_19482 ) ( not ( = ?auto_19482 ?auto_19483 ) ) ( not ( = ?auto_19482 ?auto_19484 ) ) ( not ( = ?auto_19482 ?auto_19486 ) ) ( not ( = ?auto_19483 ?auto_19484 ) ) ( not ( = ?auto_19483 ?auto_19486 ) ) ( not ( = ?auto_19484 ?auto_19486 ) ) ( not ( = ?auto_19482 ?auto_19487 ) ) ( not ( = ?auto_19483 ?auto_19487 ) ) ( not ( = ?auto_19484 ?auto_19487 ) ) ( not ( = ?auto_19486 ?auto_19487 ) ) ( ON ?auto_19487 ?auto_19485 ) ( not ( = ?auto_19482 ?auto_19485 ) ) ( not ( = ?auto_19483 ?auto_19485 ) ) ( not ( = ?auto_19484 ?auto_19485 ) ) ( not ( = ?auto_19486 ?auto_19485 ) ) ( not ( = ?auto_19487 ?auto_19485 ) ) ( ON ?auto_19486 ?auto_19487 ) ( CLEAR ?auto_19483 ) ( ON ?auto_19484 ?auto_19486 ) ( CLEAR ?auto_19484 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_19485 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_19485 ?auto_19487 ?auto_19486 )
      ( MAKE-3PILE ?auto_19482 ?auto_19483 ?auto_19484 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_19488 - BLOCK
      ?auto_19489 - BLOCK
      ?auto_19490 - BLOCK
    )
    :vars
    (
      ?auto_19493 - BLOCK
      ?auto_19491 - BLOCK
      ?auto_19492 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_19488 ) ( not ( = ?auto_19488 ?auto_19489 ) ) ( not ( = ?auto_19488 ?auto_19490 ) ) ( not ( = ?auto_19488 ?auto_19493 ) ) ( not ( = ?auto_19489 ?auto_19490 ) ) ( not ( = ?auto_19489 ?auto_19493 ) ) ( not ( = ?auto_19490 ?auto_19493 ) ) ( not ( = ?auto_19488 ?auto_19491 ) ) ( not ( = ?auto_19489 ?auto_19491 ) ) ( not ( = ?auto_19490 ?auto_19491 ) ) ( not ( = ?auto_19493 ?auto_19491 ) ) ( ON ?auto_19491 ?auto_19492 ) ( not ( = ?auto_19488 ?auto_19492 ) ) ( not ( = ?auto_19489 ?auto_19492 ) ) ( not ( = ?auto_19490 ?auto_19492 ) ) ( not ( = ?auto_19493 ?auto_19492 ) ) ( not ( = ?auto_19491 ?auto_19492 ) ) ( ON ?auto_19493 ?auto_19491 ) ( ON ?auto_19490 ?auto_19493 ) ( CLEAR ?auto_19490 ) ( ON-TABLE ?auto_19492 ) ( HOLDING ?auto_19489 ) ( CLEAR ?auto_19488 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_19488 ?auto_19489 )
      ( MAKE-3PILE ?auto_19488 ?auto_19489 ?auto_19490 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_19494 - BLOCK
      ?auto_19495 - BLOCK
      ?auto_19496 - BLOCK
    )
    :vars
    (
      ?auto_19497 - BLOCK
      ?auto_19498 - BLOCK
      ?auto_19499 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_19494 ) ( not ( = ?auto_19494 ?auto_19495 ) ) ( not ( = ?auto_19494 ?auto_19496 ) ) ( not ( = ?auto_19494 ?auto_19497 ) ) ( not ( = ?auto_19495 ?auto_19496 ) ) ( not ( = ?auto_19495 ?auto_19497 ) ) ( not ( = ?auto_19496 ?auto_19497 ) ) ( not ( = ?auto_19494 ?auto_19498 ) ) ( not ( = ?auto_19495 ?auto_19498 ) ) ( not ( = ?auto_19496 ?auto_19498 ) ) ( not ( = ?auto_19497 ?auto_19498 ) ) ( ON ?auto_19498 ?auto_19499 ) ( not ( = ?auto_19494 ?auto_19499 ) ) ( not ( = ?auto_19495 ?auto_19499 ) ) ( not ( = ?auto_19496 ?auto_19499 ) ) ( not ( = ?auto_19497 ?auto_19499 ) ) ( not ( = ?auto_19498 ?auto_19499 ) ) ( ON ?auto_19497 ?auto_19498 ) ( ON ?auto_19496 ?auto_19497 ) ( ON-TABLE ?auto_19499 ) ( CLEAR ?auto_19494 ) ( ON ?auto_19495 ?auto_19496 ) ( CLEAR ?auto_19495 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_19499 ?auto_19498 ?auto_19497 ?auto_19496 )
      ( MAKE-3PILE ?auto_19494 ?auto_19495 ?auto_19496 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_19500 - BLOCK
      ?auto_19501 - BLOCK
      ?auto_19502 - BLOCK
    )
    :vars
    (
      ?auto_19505 - BLOCK
      ?auto_19504 - BLOCK
      ?auto_19503 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19500 ?auto_19501 ) ) ( not ( = ?auto_19500 ?auto_19502 ) ) ( not ( = ?auto_19500 ?auto_19505 ) ) ( not ( = ?auto_19501 ?auto_19502 ) ) ( not ( = ?auto_19501 ?auto_19505 ) ) ( not ( = ?auto_19502 ?auto_19505 ) ) ( not ( = ?auto_19500 ?auto_19504 ) ) ( not ( = ?auto_19501 ?auto_19504 ) ) ( not ( = ?auto_19502 ?auto_19504 ) ) ( not ( = ?auto_19505 ?auto_19504 ) ) ( ON ?auto_19504 ?auto_19503 ) ( not ( = ?auto_19500 ?auto_19503 ) ) ( not ( = ?auto_19501 ?auto_19503 ) ) ( not ( = ?auto_19502 ?auto_19503 ) ) ( not ( = ?auto_19505 ?auto_19503 ) ) ( not ( = ?auto_19504 ?auto_19503 ) ) ( ON ?auto_19505 ?auto_19504 ) ( ON ?auto_19502 ?auto_19505 ) ( ON-TABLE ?auto_19503 ) ( ON ?auto_19501 ?auto_19502 ) ( CLEAR ?auto_19501 ) ( HOLDING ?auto_19500 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_19500 )
      ( MAKE-3PILE ?auto_19500 ?auto_19501 ?auto_19502 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_19506 - BLOCK
      ?auto_19507 - BLOCK
      ?auto_19508 - BLOCK
    )
    :vars
    (
      ?auto_19510 - BLOCK
      ?auto_19511 - BLOCK
      ?auto_19509 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19506 ?auto_19507 ) ) ( not ( = ?auto_19506 ?auto_19508 ) ) ( not ( = ?auto_19506 ?auto_19510 ) ) ( not ( = ?auto_19507 ?auto_19508 ) ) ( not ( = ?auto_19507 ?auto_19510 ) ) ( not ( = ?auto_19508 ?auto_19510 ) ) ( not ( = ?auto_19506 ?auto_19511 ) ) ( not ( = ?auto_19507 ?auto_19511 ) ) ( not ( = ?auto_19508 ?auto_19511 ) ) ( not ( = ?auto_19510 ?auto_19511 ) ) ( ON ?auto_19511 ?auto_19509 ) ( not ( = ?auto_19506 ?auto_19509 ) ) ( not ( = ?auto_19507 ?auto_19509 ) ) ( not ( = ?auto_19508 ?auto_19509 ) ) ( not ( = ?auto_19510 ?auto_19509 ) ) ( not ( = ?auto_19511 ?auto_19509 ) ) ( ON ?auto_19510 ?auto_19511 ) ( ON ?auto_19508 ?auto_19510 ) ( ON-TABLE ?auto_19509 ) ( ON ?auto_19507 ?auto_19508 ) ( ON ?auto_19506 ?auto_19507 ) ( CLEAR ?auto_19506 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_19509 ?auto_19511 ?auto_19510 ?auto_19508 ?auto_19507 )
      ( MAKE-3PILE ?auto_19506 ?auto_19507 ?auto_19508 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_19514 - BLOCK
      ?auto_19515 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_19515 ) ( CLEAR ?auto_19514 ) ( ON-TABLE ?auto_19514 ) ( not ( = ?auto_19514 ?auto_19515 ) ) )
    :subtasks
    ( ( !STACK ?auto_19515 ?auto_19514 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_19516 - BLOCK
      ?auto_19517 - BLOCK
    )
    :vars
    (
      ?auto_19518 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_19516 ) ( ON-TABLE ?auto_19516 ) ( not ( = ?auto_19516 ?auto_19517 ) ) ( ON ?auto_19517 ?auto_19518 ) ( CLEAR ?auto_19517 ) ( HAND-EMPTY ) ( not ( = ?auto_19516 ?auto_19518 ) ) ( not ( = ?auto_19517 ?auto_19518 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_19517 ?auto_19518 )
      ( MAKE-2PILE ?auto_19516 ?auto_19517 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_19519 - BLOCK
      ?auto_19520 - BLOCK
    )
    :vars
    (
      ?auto_19521 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19519 ?auto_19520 ) ) ( ON ?auto_19520 ?auto_19521 ) ( CLEAR ?auto_19520 ) ( not ( = ?auto_19519 ?auto_19521 ) ) ( not ( = ?auto_19520 ?auto_19521 ) ) ( HOLDING ?auto_19519 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_19519 )
      ( MAKE-2PILE ?auto_19519 ?auto_19520 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_19522 - BLOCK
      ?auto_19523 - BLOCK
    )
    :vars
    (
      ?auto_19524 - BLOCK
      ?auto_19525 - BLOCK
      ?auto_19526 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19522 ?auto_19523 ) ) ( ON ?auto_19523 ?auto_19524 ) ( not ( = ?auto_19522 ?auto_19524 ) ) ( not ( = ?auto_19523 ?auto_19524 ) ) ( ON ?auto_19522 ?auto_19523 ) ( CLEAR ?auto_19522 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_19525 ) ( ON ?auto_19526 ?auto_19525 ) ( ON ?auto_19524 ?auto_19526 ) ( not ( = ?auto_19525 ?auto_19526 ) ) ( not ( = ?auto_19525 ?auto_19524 ) ) ( not ( = ?auto_19525 ?auto_19523 ) ) ( not ( = ?auto_19525 ?auto_19522 ) ) ( not ( = ?auto_19526 ?auto_19524 ) ) ( not ( = ?auto_19526 ?auto_19523 ) ) ( not ( = ?auto_19526 ?auto_19522 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_19525 ?auto_19526 ?auto_19524 ?auto_19523 )
      ( MAKE-2PILE ?auto_19522 ?auto_19523 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_19527 - BLOCK
      ?auto_19528 - BLOCK
    )
    :vars
    (
      ?auto_19530 - BLOCK
      ?auto_19531 - BLOCK
      ?auto_19529 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19527 ?auto_19528 ) ) ( ON ?auto_19528 ?auto_19530 ) ( not ( = ?auto_19527 ?auto_19530 ) ) ( not ( = ?auto_19528 ?auto_19530 ) ) ( ON-TABLE ?auto_19531 ) ( ON ?auto_19529 ?auto_19531 ) ( ON ?auto_19530 ?auto_19529 ) ( not ( = ?auto_19531 ?auto_19529 ) ) ( not ( = ?auto_19531 ?auto_19530 ) ) ( not ( = ?auto_19531 ?auto_19528 ) ) ( not ( = ?auto_19531 ?auto_19527 ) ) ( not ( = ?auto_19529 ?auto_19530 ) ) ( not ( = ?auto_19529 ?auto_19528 ) ) ( not ( = ?auto_19529 ?auto_19527 ) ) ( HOLDING ?auto_19527 ) ( CLEAR ?auto_19528 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_19531 ?auto_19529 ?auto_19530 ?auto_19528 ?auto_19527 )
      ( MAKE-2PILE ?auto_19527 ?auto_19528 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_19532 - BLOCK
      ?auto_19533 - BLOCK
    )
    :vars
    (
      ?auto_19536 - BLOCK
      ?auto_19535 - BLOCK
      ?auto_19534 - BLOCK
      ?auto_19537 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19532 ?auto_19533 ) ) ( ON ?auto_19533 ?auto_19536 ) ( not ( = ?auto_19532 ?auto_19536 ) ) ( not ( = ?auto_19533 ?auto_19536 ) ) ( ON-TABLE ?auto_19535 ) ( ON ?auto_19534 ?auto_19535 ) ( ON ?auto_19536 ?auto_19534 ) ( not ( = ?auto_19535 ?auto_19534 ) ) ( not ( = ?auto_19535 ?auto_19536 ) ) ( not ( = ?auto_19535 ?auto_19533 ) ) ( not ( = ?auto_19535 ?auto_19532 ) ) ( not ( = ?auto_19534 ?auto_19536 ) ) ( not ( = ?auto_19534 ?auto_19533 ) ) ( not ( = ?auto_19534 ?auto_19532 ) ) ( CLEAR ?auto_19533 ) ( ON ?auto_19532 ?auto_19537 ) ( CLEAR ?auto_19532 ) ( HAND-EMPTY ) ( not ( = ?auto_19532 ?auto_19537 ) ) ( not ( = ?auto_19533 ?auto_19537 ) ) ( not ( = ?auto_19536 ?auto_19537 ) ) ( not ( = ?auto_19535 ?auto_19537 ) ) ( not ( = ?auto_19534 ?auto_19537 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_19532 ?auto_19537 )
      ( MAKE-2PILE ?auto_19532 ?auto_19533 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_19538 - BLOCK
      ?auto_19539 - BLOCK
    )
    :vars
    (
      ?auto_19543 - BLOCK
      ?auto_19540 - BLOCK
      ?auto_19541 - BLOCK
      ?auto_19542 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19538 ?auto_19539 ) ) ( not ( = ?auto_19538 ?auto_19543 ) ) ( not ( = ?auto_19539 ?auto_19543 ) ) ( ON-TABLE ?auto_19540 ) ( ON ?auto_19541 ?auto_19540 ) ( ON ?auto_19543 ?auto_19541 ) ( not ( = ?auto_19540 ?auto_19541 ) ) ( not ( = ?auto_19540 ?auto_19543 ) ) ( not ( = ?auto_19540 ?auto_19539 ) ) ( not ( = ?auto_19540 ?auto_19538 ) ) ( not ( = ?auto_19541 ?auto_19543 ) ) ( not ( = ?auto_19541 ?auto_19539 ) ) ( not ( = ?auto_19541 ?auto_19538 ) ) ( ON ?auto_19538 ?auto_19542 ) ( CLEAR ?auto_19538 ) ( not ( = ?auto_19538 ?auto_19542 ) ) ( not ( = ?auto_19539 ?auto_19542 ) ) ( not ( = ?auto_19543 ?auto_19542 ) ) ( not ( = ?auto_19540 ?auto_19542 ) ) ( not ( = ?auto_19541 ?auto_19542 ) ) ( HOLDING ?auto_19539 ) ( CLEAR ?auto_19543 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_19540 ?auto_19541 ?auto_19543 ?auto_19539 )
      ( MAKE-2PILE ?auto_19538 ?auto_19539 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_19544 - BLOCK
      ?auto_19545 - BLOCK
    )
    :vars
    (
      ?auto_19547 - BLOCK
      ?auto_19546 - BLOCK
      ?auto_19549 - BLOCK
      ?auto_19548 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19544 ?auto_19545 ) ) ( not ( = ?auto_19544 ?auto_19547 ) ) ( not ( = ?auto_19545 ?auto_19547 ) ) ( ON-TABLE ?auto_19546 ) ( ON ?auto_19549 ?auto_19546 ) ( ON ?auto_19547 ?auto_19549 ) ( not ( = ?auto_19546 ?auto_19549 ) ) ( not ( = ?auto_19546 ?auto_19547 ) ) ( not ( = ?auto_19546 ?auto_19545 ) ) ( not ( = ?auto_19546 ?auto_19544 ) ) ( not ( = ?auto_19549 ?auto_19547 ) ) ( not ( = ?auto_19549 ?auto_19545 ) ) ( not ( = ?auto_19549 ?auto_19544 ) ) ( ON ?auto_19544 ?auto_19548 ) ( not ( = ?auto_19544 ?auto_19548 ) ) ( not ( = ?auto_19545 ?auto_19548 ) ) ( not ( = ?auto_19547 ?auto_19548 ) ) ( not ( = ?auto_19546 ?auto_19548 ) ) ( not ( = ?auto_19549 ?auto_19548 ) ) ( CLEAR ?auto_19547 ) ( ON ?auto_19545 ?auto_19544 ) ( CLEAR ?auto_19545 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_19548 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_19548 ?auto_19544 )
      ( MAKE-2PILE ?auto_19544 ?auto_19545 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_19550 - BLOCK
      ?auto_19551 - BLOCK
    )
    :vars
    (
      ?auto_19553 - BLOCK
      ?auto_19554 - BLOCK
      ?auto_19552 - BLOCK
      ?auto_19555 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19550 ?auto_19551 ) ) ( not ( = ?auto_19550 ?auto_19553 ) ) ( not ( = ?auto_19551 ?auto_19553 ) ) ( ON-TABLE ?auto_19554 ) ( ON ?auto_19552 ?auto_19554 ) ( not ( = ?auto_19554 ?auto_19552 ) ) ( not ( = ?auto_19554 ?auto_19553 ) ) ( not ( = ?auto_19554 ?auto_19551 ) ) ( not ( = ?auto_19554 ?auto_19550 ) ) ( not ( = ?auto_19552 ?auto_19553 ) ) ( not ( = ?auto_19552 ?auto_19551 ) ) ( not ( = ?auto_19552 ?auto_19550 ) ) ( ON ?auto_19550 ?auto_19555 ) ( not ( = ?auto_19550 ?auto_19555 ) ) ( not ( = ?auto_19551 ?auto_19555 ) ) ( not ( = ?auto_19553 ?auto_19555 ) ) ( not ( = ?auto_19554 ?auto_19555 ) ) ( not ( = ?auto_19552 ?auto_19555 ) ) ( ON ?auto_19551 ?auto_19550 ) ( CLEAR ?auto_19551 ) ( ON-TABLE ?auto_19555 ) ( HOLDING ?auto_19553 ) ( CLEAR ?auto_19552 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_19554 ?auto_19552 ?auto_19553 )
      ( MAKE-2PILE ?auto_19550 ?auto_19551 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_19556 - BLOCK
      ?auto_19557 - BLOCK
    )
    :vars
    (
      ?auto_19558 - BLOCK
      ?auto_19560 - BLOCK
      ?auto_19561 - BLOCK
      ?auto_19559 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19556 ?auto_19557 ) ) ( not ( = ?auto_19556 ?auto_19558 ) ) ( not ( = ?auto_19557 ?auto_19558 ) ) ( ON-TABLE ?auto_19560 ) ( ON ?auto_19561 ?auto_19560 ) ( not ( = ?auto_19560 ?auto_19561 ) ) ( not ( = ?auto_19560 ?auto_19558 ) ) ( not ( = ?auto_19560 ?auto_19557 ) ) ( not ( = ?auto_19560 ?auto_19556 ) ) ( not ( = ?auto_19561 ?auto_19558 ) ) ( not ( = ?auto_19561 ?auto_19557 ) ) ( not ( = ?auto_19561 ?auto_19556 ) ) ( ON ?auto_19556 ?auto_19559 ) ( not ( = ?auto_19556 ?auto_19559 ) ) ( not ( = ?auto_19557 ?auto_19559 ) ) ( not ( = ?auto_19558 ?auto_19559 ) ) ( not ( = ?auto_19560 ?auto_19559 ) ) ( not ( = ?auto_19561 ?auto_19559 ) ) ( ON ?auto_19557 ?auto_19556 ) ( ON-TABLE ?auto_19559 ) ( CLEAR ?auto_19561 ) ( ON ?auto_19558 ?auto_19557 ) ( CLEAR ?auto_19558 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_19559 ?auto_19556 ?auto_19557 )
      ( MAKE-2PILE ?auto_19556 ?auto_19557 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_19562 - BLOCK
      ?auto_19563 - BLOCK
    )
    :vars
    (
      ?auto_19567 - BLOCK
      ?auto_19564 - BLOCK
      ?auto_19566 - BLOCK
      ?auto_19565 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19562 ?auto_19563 ) ) ( not ( = ?auto_19562 ?auto_19567 ) ) ( not ( = ?auto_19563 ?auto_19567 ) ) ( ON-TABLE ?auto_19564 ) ( not ( = ?auto_19564 ?auto_19566 ) ) ( not ( = ?auto_19564 ?auto_19567 ) ) ( not ( = ?auto_19564 ?auto_19563 ) ) ( not ( = ?auto_19564 ?auto_19562 ) ) ( not ( = ?auto_19566 ?auto_19567 ) ) ( not ( = ?auto_19566 ?auto_19563 ) ) ( not ( = ?auto_19566 ?auto_19562 ) ) ( ON ?auto_19562 ?auto_19565 ) ( not ( = ?auto_19562 ?auto_19565 ) ) ( not ( = ?auto_19563 ?auto_19565 ) ) ( not ( = ?auto_19567 ?auto_19565 ) ) ( not ( = ?auto_19564 ?auto_19565 ) ) ( not ( = ?auto_19566 ?auto_19565 ) ) ( ON ?auto_19563 ?auto_19562 ) ( ON-TABLE ?auto_19565 ) ( ON ?auto_19567 ?auto_19563 ) ( CLEAR ?auto_19567 ) ( HOLDING ?auto_19566 ) ( CLEAR ?auto_19564 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_19564 ?auto_19566 )
      ( MAKE-2PILE ?auto_19562 ?auto_19563 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_19568 - BLOCK
      ?auto_19569 - BLOCK
    )
    :vars
    (
      ?auto_19570 - BLOCK
      ?auto_19572 - BLOCK
      ?auto_19573 - BLOCK
      ?auto_19571 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19568 ?auto_19569 ) ) ( not ( = ?auto_19568 ?auto_19570 ) ) ( not ( = ?auto_19569 ?auto_19570 ) ) ( ON-TABLE ?auto_19572 ) ( not ( = ?auto_19572 ?auto_19573 ) ) ( not ( = ?auto_19572 ?auto_19570 ) ) ( not ( = ?auto_19572 ?auto_19569 ) ) ( not ( = ?auto_19572 ?auto_19568 ) ) ( not ( = ?auto_19573 ?auto_19570 ) ) ( not ( = ?auto_19573 ?auto_19569 ) ) ( not ( = ?auto_19573 ?auto_19568 ) ) ( ON ?auto_19568 ?auto_19571 ) ( not ( = ?auto_19568 ?auto_19571 ) ) ( not ( = ?auto_19569 ?auto_19571 ) ) ( not ( = ?auto_19570 ?auto_19571 ) ) ( not ( = ?auto_19572 ?auto_19571 ) ) ( not ( = ?auto_19573 ?auto_19571 ) ) ( ON ?auto_19569 ?auto_19568 ) ( ON-TABLE ?auto_19571 ) ( ON ?auto_19570 ?auto_19569 ) ( CLEAR ?auto_19572 ) ( ON ?auto_19573 ?auto_19570 ) ( CLEAR ?auto_19573 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_19571 ?auto_19568 ?auto_19569 ?auto_19570 )
      ( MAKE-2PILE ?auto_19568 ?auto_19569 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_19574 - BLOCK
      ?auto_19575 - BLOCK
    )
    :vars
    (
      ?auto_19579 - BLOCK
      ?auto_19578 - BLOCK
      ?auto_19577 - BLOCK
      ?auto_19576 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19574 ?auto_19575 ) ) ( not ( = ?auto_19574 ?auto_19579 ) ) ( not ( = ?auto_19575 ?auto_19579 ) ) ( not ( = ?auto_19578 ?auto_19577 ) ) ( not ( = ?auto_19578 ?auto_19579 ) ) ( not ( = ?auto_19578 ?auto_19575 ) ) ( not ( = ?auto_19578 ?auto_19574 ) ) ( not ( = ?auto_19577 ?auto_19579 ) ) ( not ( = ?auto_19577 ?auto_19575 ) ) ( not ( = ?auto_19577 ?auto_19574 ) ) ( ON ?auto_19574 ?auto_19576 ) ( not ( = ?auto_19574 ?auto_19576 ) ) ( not ( = ?auto_19575 ?auto_19576 ) ) ( not ( = ?auto_19579 ?auto_19576 ) ) ( not ( = ?auto_19578 ?auto_19576 ) ) ( not ( = ?auto_19577 ?auto_19576 ) ) ( ON ?auto_19575 ?auto_19574 ) ( ON-TABLE ?auto_19576 ) ( ON ?auto_19579 ?auto_19575 ) ( ON ?auto_19577 ?auto_19579 ) ( CLEAR ?auto_19577 ) ( HOLDING ?auto_19578 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_19578 )
      ( MAKE-2PILE ?auto_19574 ?auto_19575 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_19580 - BLOCK
      ?auto_19581 - BLOCK
    )
    :vars
    (
      ?auto_19582 - BLOCK
      ?auto_19584 - BLOCK
      ?auto_19585 - BLOCK
      ?auto_19583 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19580 ?auto_19581 ) ) ( not ( = ?auto_19580 ?auto_19582 ) ) ( not ( = ?auto_19581 ?auto_19582 ) ) ( not ( = ?auto_19584 ?auto_19585 ) ) ( not ( = ?auto_19584 ?auto_19582 ) ) ( not ( = ?auto_19584 ?auto_19581 ) ) ( not ( = ?auto_19584 ?auto_19580 ) ) ( not ( = ?auto_19585 ?auto_19582 ) ) ( not ( = ?auto_19585 ?auto_19581 ) ) ( not ( = ?auto_19585 ?auto_19580 ) ) ( ON ?auto_19580 ?auto_19583 ) ( not ( = ?auto_19580 ?auto_19583 ) ) ( not ( = ?auto_19581 ?auto_19583 ) ) ( not ( = ?auto_19582 ?auto_19583 ) ) ( not ( = ?auto_19584 ?auto_19583 ) ) ( not ( = ?auto_19585 ?auto_19583 ) ) ( ON ?auto_19581 ?auto_19580 ) ( ON-TABLE ?auto_19583 ) ( ON ?auto_19582 ?auto_19581 ) ( ON ?auto_19585 ?auto_19582 ) ( ON ?auto_19584 ?auto_19585 ) ( CLEAR ?auto_19584 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_19583 ?auto_19580 ?auto_19581 ?auto_19582 ?auto_19585 )
      ( MAKE-2PILE ?auto_19580 ?auto_19581 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_19588 - BLOCK
      ?auto_19589 - BLOCK
    )
    :vars
    (
      ?auto_19590 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19590 ?auto_19589 ) ( CLEAR ?auto_19590 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_19588 ) ( ON ?auto_19589 ?auto_19588 ) ( not ( = ?auto_19588 ?auto_19589 ) ) ( not ( = ?auto_19588 ?auto_19590 ) ) ( not ( = ?auto_19589 ?auto_19590 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_19590 ?auto_19589 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_19591 - BLOCK
      ?auto_19592 - BLOCK
    )
    :vars
    (
      ?auto_19593 - BLOCK
      ?auto_19594 - BLOCK
      ?auto_19595 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19593 ?auto_19592 ) ( CLEAR ?auto_19593 ) ( ON-TABLE ?auto_19591 ) ( ON ?auto_19592 ?auto_19591 ) ( not ( = ?auto_19591 ?auto_19592 ) ) ( not ( = ?auto_19591 ?auto_19593 ) ) ( not ( = ?auto_19592 ?auto_19593 ) ) ( HOLDING ?auto_19594 ) ( CLEAR ?auto_19595 ) ( not ( = ?auto_19591 ?auto_19594 ) ) ( not ( = ?auto_19591 ?auto_19595 ) ) ( not ( = ?auto_19592 ?auto_19594 ) ) ( not ( = ?auto_19592 ?auto_19595 ) ) ( not ( = ?auto_19593 ?auto_19594 ) ) ( not ( = ?auto_19593 ?auto_19595 ) ) ( not ( = ?auto_19594 ?auto_19595 ) ) )
    :subtasks
    ( ( !STACK ?auto_19594 ?auto_19595 )
      ( MAKE-2PILE ?auto_19591 ?auto_19592 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_19596 - BLOCK
      ?auto_19597 - BLOCK
    )
    :vars
    (
      ?auto_19599 - BLOCK
      ?auto_19598 - BLOCK
      ?auto_19600 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19599 ?auto_19597 ) ( ON-TABLE ?auto_19596 ) ( ON ?auto_19597 ?auto_19596 ) ( not ( = ?auto_19596 ?auto_19597 ) ) ( not ( = ?auto_19596 ?auto_19599 ) ) ( not ( = ?auto_19597 ?auto_19599 ) ) ( CLEAR ?auto_19598 ) ( not ( = ?auto_19596 ?auto_19600 ) ) ( not ( = ?auto_19596 ?auto_19598 ) ) ( not ( = ?auto_19597 ?auto_19600 ) ) ( not ( = ?auto_19597 ?auto_19598 ) ) ( not ( = ?auto_19599 ?auto_19600 ) ) ( not ( = ?auto_19599 ?auto_19598 ) ) ( not ( = ?auto_19600 ?auto_19598 ) ) ( ON ?auto_19600 ?auto_19599 ) ( CLEAR ?auto_19600 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_19596 ?auto_19597 ?auto_19599 )
      ( MAKE-2PILE ?auto_19596 ?auto_19597 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_19601 - BLOCK
      ?auto_19602 - BLOCK
    )
    :vars
    (
      ?auto_19604 - BLOCK
      ?auto_19605 - BLOCK
      ?auto_19603 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19604 ?auto_19602 ) ( ON-TABLE ?auto_19601 ) ( ON ?auto_19602 ?auto_19601 ) ( not ( = ?auto_19601 ?auto_19602 ) ) ( not ( = ?auto_19601 ?auto_19604 ) ) ( not ( = ?auto_19602 ?auto_19604 ) ) ( not ( = ?auto_19601 ?auto_19605 ) ) ( not ( = ?auto_19601 ?auto_19603 ) ) ( not ( = ?auto_19602 ?auto_19605 ) ) ( not ( = ?auto_19602 ?auto_19603 ) ) ( not ( = ?auto_19604 ?auto_19605 ) ) ( not ( = ?auto_19604 ?auto_19603 ) ) ( not ( = ?auto_19605 ?auto_19603 ) ) ( ON ?auto_19605 ?auto_19604 ) ( CLEAR ?auto_19605 ) ( HOLDING ?auto_19603 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_19603 )
      ( MAKE-2PILE ?auto_19601 ?auto_19602 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_19606 - BLOCK
      ?auto_19607 - BLOCK
    )
    :vars
    (
      ?auto_19610 - BLOCK
      ?auto_19608 - BLOCK
      ?auto_19609 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19610 ?auto_19607 ) ( ON-TABLE ?auto_19606 ) ( ON ?auto_19607 ?auto_19606 ) ( not ( = ?auto_19606 ?auto_19607 ) ) ( not ( = ?auto_19606 ?auto_19610 ) ) ( not ( = ?auto_19607 ?auto_19610 ) ) ( not ( = ?auto_19606 ?auto_19608 ) ) ( not ( = ?auto_19606 ?auto_19609 ) ) ( not ( = ?auto_19607 ?auto_19608 ) ) ( not ( = ?auto_19607 ?auto_19609 ) ) ( not ( = ?auto_19610 ?auto_19608 ) ) ( not ( = ?auto_19610 ?auto_19609 ) ) ( not ( = ?auto_19608 ?auto_19609 ) ) ( ON ?auto_19608 ?auto_19610 ) ( ON ?auto_19609 ?auto_19608 ) ( CLEAR ?auto_19609 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_19606 ?auto_19607 ?auto_19610 ?auto_19608 )
      ( MAKE-2PILE ?auto_19606 ?auto_19607 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_19611 - BLOCK
      ?auto_19612 - BLOCK
    )
    :vars
    (
      ?auto_19614 - BLOCK
      ?auto_19613 - BLOCK
      ?auto_19615 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19614 ?auto_19612 ) ( ON-TABLE ?auto_19611 ) ( ON ?auto_19612 ?auto_19611 ) ( not ( = ?auto_19611 ?auto_19612 ) ) ( not ( = ?auto_19611 ?auto_19614 ) ) ( not ( = ?auto_19612 ?auto_19614 ) ) ( not ( = ?auto_19611 ?auto_19613 ) ) ( not ( = ?auto_19611 ?auto_19615 ) ) ( not ( = ?auto_19612 ?auto_19613 ) ) ( not ( = ?auto_19612 ?auto_19615 ) ) ( not ( = ?auto_19614 ?auto_19613 ) ) ( not ( = ?auto_19614 ?auto_19615 ) ) ( not ( = ?auto_19613 ?auto_19615 ) ) ( ON ?auto_19613 ?auto_19614 ) ( HOLDING ?auto_19615 ) ( CLEAR ?auto_19613 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_19611 ?auto_19612 ?auto_19614 ?auto_19613 ?auto_19615 )
      ( MAKE-2PILE ?auto_19611 ?auto_19612 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_19616 - BLOCK
      ?auto_19617 - BLOCK
    )
    :vars
    (
      ?auto_19619 - BLOCK
      ?auto_19620 - BLOCK
      ?auto_19618 - BLOCK
      ?auto_19621 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19619 ?auto_19617 ) ( ON-TABLE ?auto_19616 ) ( ON ?auto_19617 ?auto_19616 ) ( not ( = ?auto_19616 ?auto_19617 ) ) ( not ( = ?auto_19616 ?auto_19619 ) ) ( not ( = ?auto_19617 ?auto_19619 ) ) ( not ( = ?auto_19616 ?auto_19620 ) ) ( not ( = ?auto_19616 ?auto_19618 ) ) ( not ( = ?auto_19617 ?auto_19620 ) ) ( not ( = ?auto_19617 ?auto_19618 ) ) ( not ( = ?auto_19619 ?auto_19620 ) ) ( not ( = ?auto_19619 ?auto_19618 ) ) ( not ( = ?auto_19620 ?auto_19618 ) ) ( ON ?auto_19620 ?auto_19619 ) ( CLEAR ?auto_19620 ) ( ON ?auto_19618 ?auto_19621 ) ( CLEAR ?auto_19618 ) ( HAND-EMPTY ) ( not ( = ?auto_19616 ?auto_19621 ) ) ( not ( = ?auto_19617 ?auto_19621 ) ) ( not ( = ?auto_19619 ?auto_19621 ) ) ( not ( = ?auto_19620 ?auto_19621 ) ) ( not ( = ?auto_19618 ?auto_19621 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_19618 ?auto_19621 )
      ( MAKE-2PILE ?auto_19616 ?auto_19617 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_19622 - BLOCK
      ?auto_19623 - BLOCK
    )
    :vars
    (
      ?auto_19627 - BLOCK
      ?auto_19626 - BLOCK
      ?auto_19625 - BLOCK
      ?auto_19624 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19627 ?auto_19623 ) ( ON-TABLE ?auto_19622 ) ( ON ?auto_19623 ?auto_19622 ) ( not ( = ?auto_19622 ?auto_19623 ) ) ( not ( = ?auto_19622 ?auto_19627 ) ) ( not ( = ?auto_19623 ?auto_19627 ) ) ( not ( = ?auto_19622 ?auto_19626 ) ) ( not ( = ?auto_19622 ?auto_19625 ) ) ( not ( = ?auto_19623 ?auto_19626 ) ) ( not ( = ?auto_19623 ?auto_19625 ) ) ( not ( = ?auto_19627 ?auto_19626 ) ) ( not ( = ?auto_19627 ?auto_19625 ) ) ( not ( = ?auto_19626 ?auto_19625 ) ) ( ON ?auto_19625 ?auto_19624 ) ( CLEAR ?auto_19625 ) ( not ( = ?auto_19622 ?auto_19624 ) ) ( not ( = ?auto_19623 ?auto_19624 ) ) ( not ( = ?auto_19627 ?auto_19624 ) ) ( not ( = ?auto_19626 ?auto_19624 ) ) ( not ( = ?auto_19625 ?auto_19624 ) ) ( HOLDING ?auto_19626 ) ( CLEAR ?auto_19627 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_19622 ?auto_19623 ?auto_19627 ?auto_19626 )
      ( MAKE-2PILE ?auto_19622 ?auto_19623 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_19628 - BLOCK
      ?auto_19629 - BLOCK
    )
    :vars
    (
      ?auto_19630 - BLOCK
      ?auto_19633 - BLOCK
      ?auto_19631 - BLOCK
      ?auto_19632 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19630 ?auto_19629 ) ( ON-TABLE ?auto_19628 ) ( ON ?auto_19629 ?auto_19628 ) ( not ( = ?auto_19628 ?auto_19629 ) ) ( not ( = ?auto_19628 ?auto_19630 ) ) ( not ( = ?auto_19629 ?auto_19630 ) ) ( not ( = ?auto_19628 ?auto_19633 ) ) ( not ( = ?auto_19628 ?auto_19631 ) ) ( not ( = ?auto_19629 ?auto_19633 ) ) ( not ( = ?auto_19629 ?auto_19631 ) ) ( not ( = ?auto_19630 ?auto_19633 ) ) ( not ( = ?auto_19630 ?auto_19631 ) ) ( not ( = ?auto_19633 ?auto_19631 ) ) ( ON ?auto_19631 ?auto_19632 ) ( not ( = ?auto_19628 ?auto_19632 ) ) ( not ( = ?auto_19629 ?auto_19632 ) ) ( not ( = ?auto_19630 ?auto_19632 ) ) ( not ( = ?auto_19633 ?auto_19632 ) ) ( not ( = ?auto_19631 ?auto_19632 ) ) ( CLEAR ?auto_19630 ) ( ON ?auto_19633 ?auto_19631 ) ( CLEAR ?auto_19633 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_19632 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_19632 ?auto_19631 )
      ( MAKE-2PILE ?auto_19628 ?auto_19629 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_19646 - BLOCK
      ?auto_19647 - BLOCK
    )
    :vars
    (
      ?auto_19649 - BLOCK
      ?auto_19648 - BLOCK
      ?auto_19651 - BLOCK
      ?auto_19650 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_19646 ) ( not ( = ?auto_19646 ?auto_19647 ) ) ( not ( = ?auto_19646 ?auto_19649 ) ) ( not ( = ?auto_19647 ?auto_19649 ) ) ( not ( = ?auto_19646 ?auto_19648 ) ) ( not ( = ?auto_19646 ?auto_19651 ) ) ( not ( = ?auto_19647 ?auto_19648 ) ) ( not ( = ?auto_19647 ?auto_19651 ) ) ( not ( = ?auto_19649 ?auto_19648 ) ) ( not ( = ?auto_19649 ?auto_19651 ) ) ( not ( = ?auto_19648 ?auto_19651 ) ) ( ON ?auto_19651 ?auto_19650 ) ( not ( = ?auto_19646 ?auto_19650 ) ) ( not ( = ?auto_19647 ?auto_19650 ) ) ( not ( = ?auto_19649 ?auto_19650 ) ) ( not ( = ?auto_19648 ?auto_19650 ) ) ( not ( = ?auto_19651 ?auto_19650 ) ) ( ON ?auto_19648 ?auto_19651 ) ( ON-TABLE ?auto_19650 ) ( ON ?auto_19649 ?auto_19648 ) ( CLEAR ?auto_19649 ) ( HOLDING ?auto_19647 ) ( CLEAR ?auto_19646 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_19646 ?auto_19647 ?auto_19649 )
      ( MAKE-2PILE ?auto_19646 ?auto_19647 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_19652 - BLOCK
      ?auto_19653 - BLOCK
    )
    :vars
    (
      ?auto_19655 - BLOCK
      ?auto_19657 - BLOCK
      ?auto_19654 - BLOCK
      ?auto_19656 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_19652 ) ( not ( = ?auto_19652 ?auto_19653 ) ) ( not ( = ?auto_19652 ?auto_19655 ) ) ( not ( = ?auto_19653 ?auto_19655 ) ) ( not ( = ?auto_19652 ?auto_19657 ) ) ( not ( = ?auto_19652 ?auto_19654 ) ) ( not ( = ?auto_19653 ?auto_19657 ) ) ( not ( = ?auto_19653 ?auto_19654 ) ) ( not ( = ?auto_19655 ?auto_19657 ) ) ( not ( = ?auto_19655 ?auto_19654 ) ) ( not ( = ?auto_19657 ?auto_19654 ) ) ( ON ?auto_19654 ?auto_19656 ) ( not ( = ?auto_19652 ?auto_19656 ) ) ( not ( = ?auto_19653 ?auto_19656 ) ) ( not ( = ?auto_19655 ?auto_19656 ) ) ( not ( = ?auto_19657 ?auto_19656 ) ) ( not ( = ?auto_19654 ?auto_19656 ) ) ( ON ?auto_19657 ?auto_19654 ) ( ON-TABLE ?auto_19656 ) ( ON ?auto_19655 ?auto_19657 ) ( CLEAR ?auto_19652 ) ( ON ?auto_19653 ?auto_19655 ) ( CLEAR ?auto_19653 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_19656 ?auto_19654 ?auto_19657 ?auto_19655 )
      ( MAKE-2PILE ?auto_19652 ?auto_19653 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_19658 - BLOCK
      ?auto_19659 - BLOCK
    )
    :vars
    (
      ?auto_19660 - BLOCK
      ?auto_19663 - BLOCK
      ?auto_19662 - BLOCK
      ?auto_19661 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19658 ?auto_19659 ) ) ( not ( = ?auto_19658 ?auto_19660 ) ) ( not ( = ?auto_19659 ?auto_19660 ) ) ( not ( = ?auto_19658 ?auto_19663 ) ) ( not ( = ?auto_19658 ?auto_19662 ) ) ( not ( = ?auto_19659 ?auto_19663 ) ) ( not ( = ?auto_19659 ?auto_19662 ) ) ( not ( = ?auto_19660 ?auto_19663 ) ) ( not ( = ?auto_19660 ?auto_19662 ) ) ( not ( = ?auto_19663 ?auto_19662 ) ) ( ON ?auto_19662 ?auto_19661 ) ( not ( = ?auto_19658 ?auto_19661 ) ) ( not ( = ?auto_19659 ?auto_19661 ) ) ( not ( = ?auto_19660 ?auto_19661 ) ) ( not ( = ?auto_19663 ?auto_19661 ) ) ( not ( = ?auto_19662 ?auto_19661 ) ) ( ON ?auto_19663 ?auto_19662 ) ( ON-TABLE ?auto_19661 ) ( ON ?auto_19660 ?auto_19663 ) ( ON ?auto_19659 ?auto_19660 ) ( CLEAR ?auto_19659 ) ( HOLDING ?auto_19658 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_19658 )
      ( MAKE-2PILE ?auto_19658 ?auto_19659 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_19664 - BLOCK
      ?auto_19665 - BLOCK
    )
    :vars
    (
      ?auto_19666 - BLOCK
      ?auto_19669 - BLOCK
      ?auto_19667 - BLOCK
      ?auto_19668 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19664 ?auto_19665 ) ) ( not ( = ?auto_19664 ?auto_19666 ) ) ( not ( = ?auto_19665 ?auto_19666 ) ) ( not ( = ?auto_19664 ?auto_19669 ) ) ( not ( = ?auto_19664 ?auto_19667 ) ) ( not ( = ?auto_19665 ?auto_19669 ) ) ( not ( = ?auto_19665 ?auto_19667 ) ) ( not ( = ?auto_19666 ?auto_19669 ) ) ( not ( = ?auto_19666 ?auto_19667 ) ) ( not ( = ?auto_19669 ?auto_19667 ) ) ( ON ?auto_19667 ?auto_19668 ) ( not ( = ?auto_19664 ?auto_19668 ) ) ( not ( = ?auto_19665 ?auto_19668 ) ) ( not ( = ?auto_19666 ?auto_19668 ) ) ( not ( = ?auto_19669 ?auto_19668 ) ) ( not ( = ?auto_19667 ?auto_19668 ) ) ( ON ?auto_19669 ?auto_19667 ) ( ON-TABLE ?auto_19668 ) ( ON ?auto_19666 ?auto_19669 ) ( ON ?auto_19665 ?auto_19666 ) ( ON ?auto_19664 ?auto_19665 ) ( CLEAR ?auto_19664 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_19668 ?auto_19667 ?auto_19669 ?auto_19666 ?auto_19665 )
      ( MAKE-2PILE ?auto_19664 ?auto_19665 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_19673 - BLOCK
      ?auto_19674 - BLOCK
      ?auto_19675 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_19675 ) ( CLEAR ?auto_19674 ) ( ON-TABLE ?auto_19673 ) ( ON ?auto_19674 ?auto_19673 ) ( not ( = ?auto_19673 ?auto_19674 ) ) ( not ( = ?auto_19673 ?auto_19675 ) ) ( not ( = ?auto_19674 ?auto_19675 ) ) )
    :subtasks
    ( ( !STACK ?auto_19675 ?auto_19674 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_19676 - BLOCK
      ?auto_19677 - BLOCK
      ?auto_19678 - BLOCK
    )
    :vars
    (
      ?auto_19679 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_19677 ) ( ON-TABLE ?auto_19676 ) ( ON ?auto_19677 ?auto_19676 ) ( not ( = ?auto_19676 ?auto_19677 ) ) ( not ( = ?auto_19676 ?auto_19678 ) ) ( not ( = ?auto_19677 ?auto_19678 ) ) ( ON ?auto_19678 ?auto_19679 ) ( CLEAR ?auto_19678 ) ( HAND-EMPTY ) ( not ( = ?auto_19676 ?auto_19679 ) ) ( not ( = ?auto_19677 ?auto_19679 ) ) ( not ( = ?auto_19678 ?auto_19679 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_19678 ?auto_19679 )
      ( MAKE-3PILE ?auto_19676 ?auto_19677 ?auto_19678 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_19680 - BLOCK
      ?auto_19681 - BLOCK
      ?auto_19682 - BLOCK
    )
    :vars
    (
      ?auto_19683 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_19680 ) ( not ( = ?auto_19680 ?auto_19681 ) ) ( not ( = ?auto_19680 ?auto_19682 ) ) ( not ( = ?auto_19681 ?auto_19682 ) ) ( ON ?auto_19682 ?auto_19683 ) ( CLEAR ?auto_19682 ) ( not ( = ?auto_19680 ?auto_19683 ) ) ( not ( = ?auto_19681 ?auto_19683 ) ) ( not ( = ?auto_19682 ?auto_19683 ) ) ( HOLDING ?auto_19681 ) ( CLEAR ?auto_19680 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_19680 ?auto_19681 )
      ( MAKE-3PILE ?auto_19680 ?auto_19681 ?auto_19682 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_19684 - BLOCK
      ?auto_19685 - BLOCK
      ?auto_19686 - BLOCK
    )
    :vars
    (
      ?auto_19687 - BLOCK
      ?auto_19688 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_19684 ) ( not ( = ?auto_19684 ?auto_19685 ) ) ( not ( = ?auto_19684 ?auto_19686 ) ) ( not ( = ?auto_19685 ?auto_19686 ) ) ( ON ?auto_19686 ?auto_19687 ) ( not ( = ?auto_19684 ?auto_19687 ) ) ( not ( = ?auto_19685 ?auto_19687 ) ) ( not ( = ?auto_19686 ?auto_19687 ) ) ( CLEAR ?auto_19684 ) ( ON ?auto_19685 ?auto_19686 ) ( CLEAR ?auto_19685 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_19688 ) ( ON ?auto_19687 ?auto_19688 ) ( not ( = ?auto_19688 ?auto_19687 ) ) ( not ( = ?auto_19688 ?auto_19686 ) ) ( not ( = ?auto_19688 ?auto_19685 ) ) ( not ( = ?auto_19684 ?auto_19688 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_19688 ?auto_19687 ?auto_19686 )
      ( MAKE-3PILE ?auto_19684 ?auto_19685 ?auto_19686 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_19689 - BLOCK
      ?auto_19690 - BLOCK
      ?auto_19691 - BLOCK
    )
    :vars
    (
      ?auto_19693 - BLOCK
      ?auto_19692 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19689 ?auto_19690 ) ) ( not ( = ?auto_19689 ?auto_19691 ) ) ( not ( = ?auto_19690 ?auto_19691 ) ) ( ON ?auto_19691 ?auto_19693 ) ( not ( = ?auto_19689 ?auto_19693 ) ) ( not ( = ?auto_19690 ?auto_19693 ) ) ( not ( = ?auto_19691 ?auto_19693 ) ) ( ON ?auto_19690 ?auto_19691 ) ( CLEAR ?auto_19690 ) ( ON-TABLE ?auto_19692 ) ( ON ?auto_19693 ?auto_19692 ) ( not ( = ?auto_19692 ?auto_19693 ) ) ( not ( = ?auto_19692 ?auto_19691 ) ) ( not ( = ?auto_19692 ?auto_19690 ) ) ( not ( = ?auto_19689 ?auto_19692 ) ) ( HOLDING ?auto_19689 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_19689 )
      ( MAKE-3PILE ?auto_19689 ?auto_19690 ?auto_19691 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_19694 - BLOCK
      ?auto_19695 - BLOCK
      ?auto_19696 - BLOCK
    )
    :vars
    (
      ?auto_19697 - BLOCK
      ?auto_19698 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19694 ?auto_19695 ) ) ( not ( = ?auto_19694 ?auto_19696 ) ) ( not ( = ?auto_19695 ?auto_19696 ) ) ( ON ?auto_19696 ?auto_19697 ) ( not ( = ?auto_19694 ?auto_19697 ) ) ( not ( = ?auto_19695 ?auto_19697 ) ) ( not ( = ?auto_19696 ?auto_19697 ) ) ( ON ?auto_19695 ?auto_19696 ) ( ON-TABLE ?auto_19698 ) ( ON ?auto_19697 ?auto_19698 ) ( not ( = ?auto_19698 ?auto_19697 ) ) ( not ( = ?auto_19698 ?auto_19696 ) ) ( not ( = ?auto_19698 ?auto_19695 ) ) ( not ( = ?auto_19694 ?auto_19698 ) ) ( ON ?auto_19694 ?auto_19695 ) ( CLEAR ?auto_19694 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_19698 ?auto_19697 ?auto_19696 ?auto_19695 )
      ( MAKE-3PILE ?auto_19694 ?auto_19695 ?auto_19696 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_19699 - BLOCK
      ?auto_19700 - BLOCK
      ?auto_19701 - BLOCK
    )
    :vars
    (
      ?auto_19703 - BLOCK
      ?auto_19702 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19699 ?auto_19700 ) ) ( not ( = ?auto_19699 ?auto_19701 ) ) ( not ( = ?auto_19700 ?auto_19701 ) ) ( ON ?auto_19701 ?auto_19703 ) ( not ( = ?auto_19699 ?auto_19703 ) ) ( not ( = ?auto_19700 ?auto_19703 ) ) ( not ( = ?auto_19701 ?auto_19703 ) ) ( ON ?auto_19700 ?auto_19701 ) ( ON-TABLE ?auto_19702 ) ( ON ?auto_19703 ?auto_19702 ) ( not ( = ?auto_19702 ?auto_19703 ) ) ( not ( = ?auto_19702 ?auto_19701 ) ) ( not ( = ?auto_19702 ?auto_19700 ) ) ( not ( = ?auto_19699 ?auto_19702 ) ) ( HOLDING ?auto_19699 ) ( CLEAR ?auto_19700 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_19702 ?auto_19703 ?auto_19701 ?auto_19700 ?auto_19699 )
      ( MAKE-3PILE ?auto_19699 ?auto_19700 ?auto_19701 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_19704 - BLOCK
      ?auto_19705 - BLOCK
      ?auto_19706 - BLOCK
    )
    :vars
    (
      ?auto_19708 - BLOCK
      ?auto_19707 - BLOCK
      ?auto_19709 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19704 ?auto_19705 ) ) ( not ( = ?auto_19704 ?auto_19706 ) ) ( not ( = ?auto_19705 ?auto_19706 ) ) ( ON ?auto_19706 ?auto_19708 ) ( not ( = ?auto_19704 ?auto_19708 ) ) ( not ( = ?auto_19705 ?auto_19708 ) ) ( not ( = ?auto_19706 ?auto_19708 ) ) ( ON ?auto_19705 ?auto_19706 ) ( ON-TABLE ?auto_19707 ) ( ON ?auto_19708 ?auto_19707 ) ( not ( = ?auto_19707 ?auto_19708 ) ) ( not ( = ?auto_19707 ?auto_19706 ) ) ( not ( = ?auto_19707 ?auto_19705 ) ) ( not ( = ?auto_19704 ?auto_19707 ) ) ( CLEAR ?auto_19705 ) ( ON ?auto_19704 ?auto_19709 ) ( CLEAR ?auto_19704 ) ( HAND-EMPTY ) ( not ( = ?auto_19704 ?auto_19709 ) ) ( not ( = ?auto_19705 ?auto_19709 ) ) ( not ( = ?auto_19706 ?auto_19709 ) ) ( not ( = ?auto_19708 ?auto_19709 ) ) ( not ( = ?auto_19707 ?auto_19709 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_19704 ?auto_19709 )
      ( MAKE-3PILE ?auto_19704 ?auto_19705 ?auto_19706 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_19710 - BLOCK
      ?auto_19711 - BLOCK
      ?auto_19712 - BLOCK
    )
    :vars
    (
      ?auto_19713 - BLOCK
      ?auto_19715 - BLOCK
      ?auto_19714 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19710 ?auto_19711 ) ) ( not ( = ?auto_19710 ?auto_19712 ) ) ( not ( = ?auto_19711 ?auto_19712 ) ) ( ON ?auto_19712 ?auto_19713 ) ( not ( = ?auto_19710 ?auto_19713 ) ) ( not ( = ?auto_19711 ?auto_19713 ) ) ( not ( = ?auto_19712 ?auto_19713 ) ) ( ON-TABLE ?auto_19715 ) ( ON ?auto_19713 ?auto_19715 ) ( not ( = ?auto_19715 ?auto_19713 ) ) ( not ( = ?auto_19715 ?auto_19712 ) ) ( not ( = ?auto_19715 ?auto_19711 ) ) ( not ( = ?auto_19710 ?auto_19715 ) ) ( ON ?auto_19710 ?auto_19714 ) ( CLEAR ?auto_19710 ) ( not ( = ?auto_19710 ?auto_19714 ) ) ( not ( = ?auto_19711 ?auto_19714 ) ) ( not ( = ?auto_19712 ?auto_19714 ) ) ( not ( = ?auto_19713 ?auto_19714 ) ) ( not ( = ?auto_19715 ?auto_19714 ) ) ( HOLDING ?auto_19711 ) ( CLEAR ?auto_19712 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_19715 ?auto_19713 ?auto_19712 ?auto_19711 )
      ( MAKE-3PILE ?auto_19710 ?auto_19711 ?auto_19712 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_19716 - BLOCK
      ?auto_19717 - BLOCK
      ?auto_19718 - BLOCK
    )
    :vars
    (
      ?auto_19720 - BLOCK
      ?auto_19721 - BLOCK
      ?auto_19719 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19716 ?auto_19717 ) ) ( not ( = ?auto_19716 ?auto_19718 ) ) ( not ( = ?auto_19717 ?auto_19718 ) ) ( ON ?auto_19718 ?auto_19720 ) ( not ( = ?auto_19716 ?auto_19720 ) ) ( not ( = ?auto_19717 ?auto_19720 ) ) ( not ( = ?auto_19718 ?auto_19720 ) ) ( ON-TABLE ?auto_19721 ) ( ON ?auto_19720 ?auto_19721 ) ( not ( = ?auto_19721 ?auto_19720 ) ) ( not ( = ?auto_19721 ?auto_19718 ) ) ( not ( = ?auto_19721 ?auto_19717 ) ) ( not ( = ?auto_19716 ?auto_19721 ) ) ( ON ?auto_19716 ?auto_19719 ) ( not ( = ?auto_19716 ?auto_19719 ) ) ( not ( = ?auto_19717 ?auto_19719 ) ) ( not ( = ?auto_19718 ?auto_19719 ) ) ( not ( = ?auto_19720 ?auto_19719 ) ) ( not ( = ?auto_19721 ?auto_19719 ) ) ( CLEAR ?auto_19718 ) ( ON ?auto_19717 ?auto_19716 ) ( CLEAR ?auto_19717 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_19719 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_19719 ?auto_19716 )
      ( MAKE-3PILE ?auto_19716 ?auto_19717 ?auto_19718 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_19722 - BLOCK
      ?auto_19723 - BLOCK
      ?auto_19724 - BLOCK
    )
    :vars
    (
      ?auto_19725 - BLOCK
      ?auto_19726 - BLOCK
      ?auto_19727 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19722 ?auto_19723 ) ) ( not ( = ?auto_19722 ?auto_19724 ) ) ( not ( = ?auto_19723 ?auto_19724 ) ) ( not ( = ?auto_19722 ?auto_19725 ) ) ( not ( = ?auto_19723 ?auto_19725 ) ) ( not ( = ?auto_19724 ?auto_19725 ) ) ( ON-TABLE ?auto_19726 ) ( ON ?auto_19725 ?auto_19726 ) ( not ( = ?auto_19726 ?auto_19725 ) ) ( not ( = ?auto_19726 ?auto_19724 ) ) ( not ( = ?auto_19726 ?auto_19723 ) ) ( not ( = ?auto_19722 ?auto_19726 ) ) ( ON ?auto_19722 ?auto_19727 ) ( not ( = ?auto_19722 ?auto_19727 ) ) ( not ( = ?auto_19723 ?auto_19727 ) ) ( not ( = ?auto_19724 ?auto_19727 ) ) ( not ( = ?auto_19725 ?auto_19727 ) ) ( not ( = ?auto_19726 ?auto_19727 ) ) ( ON ?auto_19723 ?auto_19722 ) ( CLEAR ?auto_19723 ) ( ON-TABLE ?auto_19727 ) ( HOLDING ?auto_19724 ) ( CLEAR ?auto_19725 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_19726 ?auto_19725 ?auto_19724 )
      ( MAKE-3PILE ?auto_19722 ?auto_19723 ?auto_19724 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_19728 - BLOCK
      ?auto_19729 - BLOCK
      ?auto_19730 - BLOCK
    )
    :vars
    (
      ?auto_19731 - BLOCK
      ?auto_19733 - BLOCK
      ?auto_19732 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19728 ?auto_19729 ) ) ( not ( = ?auto_19728 ?auto_19730 ) ) ( not ( = ?auto_19729 ?auto_19730 ) ) ( not ( = ?auto_19728 ?auto_19731 ) ) ( not ( = ?auto_19729 ?auto_19731 ) ) ( not ( = ?auto_19730 ?auto_19731 ) ) ( ON-TABLE ?auto_19733 ) ( ON ?auto_19731 ?auto_19733 ) ( not ( = ?auto_19733 ?auto_19731 ) ) ( not ( = ?auto_19733 ?auto_19730 ) ) ( not ( = ?auto_19733 ?auto_19729 ) ) ( not ( = ?auto_19728 ?auto_19733 ) ) ( ON ?auto_19728 ?auto_19732 ) ( not ( = ?auto_19728 ?auto_19732 ) ) ( not ( = ?auto_19729 ?auto_19732 ) ) ( not ( = ?auto_19730 ?auto_19732 ) ) ( not ( = ?auto_19731 ?auto_19732 ) ) ( not ( = ?auto_19733 ?auto_19732 ) ) ( ON ?auto_19729 ?auto_19728 ) ( ON-TABLE ?auto_19732 ) ( CLEAR ?auto_19731 ) ( ON ?auto_19730 ?auto_19729 ) ( CLEAR ?auto_19730 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_19732 ?auto_19728 ?auto_19729 )
      ( MAKE-3PILE ?auto_19728 ?auto_19729 ?auto_19730 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_19734 - BLOCK
      ?auto_19735 - BLOCK
      ?auto_19736 - BLOCK
    )
    :vars
    (
      ?auto_19738 - BLOCK
      ?auto_19739 - BLOCK
      ?auto_19737 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19734 ?auto_19735 ) ) ( not ( = ?auto_19734 ?auto_19736 ) ) ( not ( = ?auto_19735 ?auto_19736 ) ) ( not ( = ?auto_19734 ?auto_19738 ) ) ( not ( = ?auto_19735 ?auto_19738 ) ) ( not ( = ?auto_19736 ?auto_19738 ) ) ( ON-TABLE ?auto_19739 ) ( not ( = ?auto_19739 ?auto_19738 ) ) ( not ( = ?auto_19739 ?auto_19736 ) ) ( not ( = ?auto_19739 ?auto_19735 ) ) ( not ( = ?auto_19734 ?auto_19739 ) ) ( ON ?auto_19734 ?auto_19737 ) ( not ( = ?auto_19734 ?auto_19737 ) ) ( not ( = ?auto_19735 ?auto_19737 ) ) ( not ( = ?auto_19736 ?auto_19737 ) ) ( not ( = ?auto_19738 ?auto_19737 ) ) ( not ( = ?auto_19739 ?auto_19737 ) ) ( ON ?auto_19735 ?auto_19734 ) ( ON-TABLE ?auto_19737 ) ( ON ?auto_19736 ?auto_19735 ) ( CLEAR ?auto_19736 ) ( HOLDING ?auto_19738 ) ( CLEAR ?auto_19739 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_19739 ?auto_19738 )
      ( MAKE-3PILE ?auto_19734 ?auto_19735 ?auto_19736 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_19740 - BLOCK
      ?auto_19741 - BLOCK
      ?auto_19742 - BLOCK
    )
    :vars
    (
      ?auto_19744 - BLOCK
      ?auto_19745 - BLOCK
      ?auto_19743 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19740 ?auto_19741 ) ) ( not ( = ?auto_19740 ?auto_19742 ) ) ( not ( = ?auto_19741 ?auto_19742 ) ) ( not ( = ?auto_19740 ?auto_19744 ) ) ( not ( = ?auto_19741 ?auto_19744 ) ) ( not ( = ?auto_19742 ?auto_19744 ) ) ( ON-TABLE ?auto_19745 ) ( not ( = ?auto_19745 ?auto_19744 ) ) ( not ( = ?auto_19745 ?auto_19742 ) ) ( not ( = ?auto_19745 ?auto_19741 ) ) ( not ( = ?auto_19740 ?auto_19745 ) ) ( ON ?auto_19740 ?auto_19743 ) ( not ( = ?auto_19740 ?auto_19743 ) ) ( not ( = ?auto_19741 ?auto_19743 ) ) ( not ( = ?auto_19742 ?auto_19743 ) ) ( not ( = ?auto_19744 ?auto_19743 ) ) ( not ( = ?auto_19745 ?auto_19743 ) ) ( ON ?auto_19741 ?auto_19740 ) ( ON-TABLE ?auto_19743 ) ( ON ?auto_19742 ?auto_19741 ) ( CLEAR ?auto_19745 ) ( ON ?auto_19744 ?auto_19742 ) ( CLEAR ?auto_19744 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_19743 ?auto_19740 ?auto_19741 ?auto_19742 )
      ( MAKE-3PILE ?auto_19740 ?auto_19741 ?auto_19742 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_19746 - BLOCK
      ?auto_19747 - BLOCK
      ?auto_19748 - BLOCK
    )
    :vars
    (
      ?auto_19751 - BLOCK
      ?auto_19749 - BLOCK
      ?auto_19750 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19746 ?auto_19747 ) ) ( not ( = ?auto_19746 ?auto_19748 ) ) ( not ( = ?auto_19747 ?auto_19748 ) ) ( not ( = ?auto_19746 ?auto_19751 ) ) ( not ( = ?auto_19747 ?auto_19751 ) ) ( not ( = ?auto_19748 ?auto_19751 ) ) ( not ( = ?auto_19749 ?auto_19751 ) ) ( not ( = ?auto_19749 ?auto_19748 ) ) ( not ( = ?auto_19749 ?auto_19747 ) ) ( not ( = ?auto_19746 ?auto_19749 ) ) ( ON ?auto_19746 ?auto_19750 ) ( not ( = ?auto_19746 ?auto_19750 ) ) ( not ( = ?auto_19747 ?auto_19750 ) ) ( not ( = ?auto_19748 ?auto_19750 ) ) ( not ( = ?auto_19751 ?auto_19750 ) ) ( not ( = ?auto_19749 ?auto_19750 ) ) ( ON ?auto_19747 ?auto_19746 ) ( ON-TABLE ?auto_19750 ) ( ON ?auto_19748 ?auto_19747 ) ( ON ?auto_19751 ?auto_19748 ) ( CLEAR ?auto_19751 ) ( HOLDING ?auto_19749 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_19749 )
      ( MAKE-3PILE ?auto_19746 ?auto_19747 ?auto_19748 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_19752 - BLOCK
      ?auto_19753 - BLOCK
      ?auto_19754 - BLOCK
    )
    :vars
    (
      ?auto_19756 - BLOCK
      ?auto_19757 - BLOCK
      ?auto_19755 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19752 ?auto_19753 ) ) ( not ( = ?auto_19752 ?auto_19754 ) ) ( not ( = ?auto_19753 ?auto_19754 ) ) ( not ( = ?auto_19752 ?auto_19756 ) ) ( not ( = ?auto_19753 ?auto_19756 ) ) ( not ( = ?auto_19754 ?auto_19756 ) ) ( not ( = ?auto_19757 ?auto_19756 ) ) ( not ( = ?auto_19757 ?auto_19754 ) ) ( not ( = ?auto_19757 ?auto_19753 ) ) ( not ( = ?auto_19752 ?auto_19757 ) ) ( ON ?auto_19752 ?auto_19755 ) ( not ( = ?auto_19752 ?auto_19755 ) ) ( not ( = ?auto_19753 ?auto_19755 ) ) ( not ( = ?auto_19754 ?auto_19755 ) ) ( not ( = ?auto_19756 ?auto_19755 ) ) ( not ( = ?auto_19757 ?auto_19755 ) ) ( ON ?auto_19753 ?auto_19752 ) ( ON-TABLE ?auto_19755 ) ( ON ?auto_19754 ?auto_19753 ) ( ON ?auto_19756 ?auto_19754 ) ( ON ?auto_19757 ?auto_19756 ) ( CLEAR ?auto_19757 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_19755 ?auto_19752 ?auto_19753 ?auto_19754 ?auto_19756 )
      ( MAKE-3PILE ?auto_19752 ?auto_19753 ?auto_19754 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_19759 - BLOCK
    )
    :vars
    (
      ?auto_19760 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19760 ?auto_19759 ) ( CLEAR ?auto_19760 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_19759 ) ( not ( = ?auto_19759 ?auto_19760 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_19760 ?auto_19759 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_19761 - BLOCK
    )
    :vars
    (
      ?auto_19762 - BLOCK
      ?auto_19763 - BLOCK
      ?auto_19764 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19762 ?auto_19761 ) ( CLEAR ?auto_19762 ) ( ON-TABLE ?auto_19761 ) ( not ( = ?auto_19761 ?auto_19762 ) ) ( HOLDING ?auto_19763 ) ( CLEAR ?auto_19764 ) ( not ( = ?auto_19761 ?auto_19763 ) ) ( not ( = ?auto_19761 ?auto_19764 ) ) ( not ( = ?auto_19762 ?auto_19763 ) ) ( not ( = ?auto_19762 ?auto_19764 ) ) ( not ( = ?auto_19763 ?auto_19764 ) ) )
    :subtasks
    ( ( !STACK ?auto_19763 ?auto_19764 )
      ( MAKE-1PILE ?auto_19761 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_19765 - BLOCK
    )
    :vars
    (
      ?auto_19767 - BLOCK
      ?auto_19768 - BLOCK
      ?auto_19766 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19767 ?auto_19765 ) ( ON-TABLE ?auto_19765 ) ( not ( = ?auto_19765 ?auto_19767 ) ) ( CLEAR ?auto_19768 ) ( not ( = ?auto_19765 ?auto_19766 ) ) ( not ( = ?auto_19765 ?auto_19768 ) ) ( not ( = ?auto_19767 ?auto_19766 ) ) ( not ( = ?auto_19767 ?auto_19768 ) ) ( not ( = ?auto_19766 ?auto_19768 ) ) ( ON ?auto_19766 ?auto_19767 ) ( CLEAR ?auto_19766 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_19765 ?auto_19767 )
      ( MAKE-1PILE ?auto_19765 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_19769 - BLOCK
    )
    :vars
    (
      ?auto_19771 - BLOCK
      ?auto_19770 - BLOCK
      ?auto_19772 - BLOCK
      ?auto_19773 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19771 ?auto_19769 ) ( ON-TABLE ?auto_19769 ) ( not ( = ?auto_19769 ?auto_19771 ) ) ( not ( = ?auto_19769 ?auto_19770 ) ) ( not ( = ?auto_19769 ?auto_19772 ) ) ( not ( = ?auto_19771 ?auto_19770 ) ) ( not ( = ?auto_19771 ?auto_19772 ) ) ( not ( = ?auto_19770 ?auto_19772 ) ) ( ON ?auto_19770 ?auto_19771 ) ( CLEAR ?auto_19770 ) ( HOLDING ?auto_19772 ) ( CLEAR ?auto_19773 ) ( ON-TABLE ?auto_19773 ) ( not ( = ?auto_19773 ?auto_19772 ) ) ( not ( = ?auto_19769 ?auto_19773 ) ) ( not ( = ?auto_19771 ?auto_19773 ) ) ( not ( = ?auto_19770 ?auto_19773 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_19773 ?auto_19772 )
      ( MAKE-1PILE ?auto_19769 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_19774 - BLOCK
    )
    :vars
    (
      ?auto_19775 - BLOCK
      ?auto_19777 - BLOCK
      ?auto_19776 - BLOCK
      ?auto_19778 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19775 ?auto_19774 ) ( ON-TABLE ?auto_19774 ) ( not ( = ?auto_19774 ?auto_19775 ) ) ( not ( = ?auto_19774 ?auto_19777 ) ) ( not ( = ?auto_19774 ?auto_19776 ) ) ( not ( = ?auto_19775 ?auto_19777 ) ) ( not ( = ?auto_19775 ?auto_19776 ) ) ( not ( = ?auto_19777 ?auto_19776 ) ) ( ON ?auto_19777 ?auto_19775 ) ( CLEAR ?auto_19778 ) ( ON-TABLE ?auto_19778 ) ( not ( = ?auto_19778 ?auto_19776 ) ) ( not ( = ?auto_19774 ?auto_19778 ) ) ( not ( = ?auto_19775 ?auto_19778 ) ) ( not ( = ?auto_19777 ?auto_19778 ) ) ( ON ?auto_19776 ?auto_19777 ) ( CLEAR ?auto_19776 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_19774 ?auto_19775 ?auto_19777 )
      ( MAKE-1PILE ?auto_19774 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_19779 - BLOCK
    )
    :vars
    (
      ?auto_19783 - BLOCK
      ?auto_19780 - BLOCK
      ?auto_19782 - BLOCK
      ?auto_19781 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19783 ?auto_19779 ) ( ON-TABLE ?auto_19779 ) ( not ( = ?auto_19779 ?auto_19783 ) ) ( not ( = ?auto_19779 ?auto_19780 ) ) ( not ( = ?auto_19779 ?auto_19782 ) ) ( not ( = ?auto_19783 ?auto_19780 ) ) ( not ( = ?auto_19783 ?auto_19782 ) ) ( not ( = ?auto_19780 ?auto_19782 ) ) ( ON ?auto_19780 ?auto_19783 ) ( not ( = ?auto_19781 ?auto_19782 ) ) ( not ( = ?auto_19779 ?auto_19781 ) ) ( not ( = ?auto_19783 ?auto_19781 ) ) ( not ( = ?auto_19780 ?auto_19781 ) ) ( ON ?auto_19782 ?auto_19780 ) ( CLEAR ?auto_19782 ) ( HOLDING ?auto_19781 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_19781 )
      ( MAKE-1PILE ?auto_19779 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_19784 - BLOCK
    )
    :vars
    (
      ?auto_19788 - BLOCK
      ?auto_19785 - BLOCK
      ?auto_19787 - BLOCK
      ?auto_19786 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19788 ?auto_19784 ) ( ON-TABLE ?auto_19784 ) ( not ( = ?auto_19784 ?auto_19788 ) ) ( not ( = ?auto_19784 ?auto_19785 ) ) ( not ( = ?auto_19784 ?auto_19787 ) ) ( not ( = ?auto_19788 ?auto_19785 ) ) ( not ( = ?auto_19788 ?auto_19787 ) ) ( not ( = ?auto_19785 ?auto_19787 ) ) ( ON ?auto_19785 ?auto_19788 ) ( not ( = ?auto_19786 ?auto_19787 ) ) ( not ( = ?auto_19784 ?auto_19786 ) ) ( not ( = ?auto_19788 ?auto_19786 ) ) ( not ( = ?auto_19785 ?auto_19786 ) ) ( ON ?auto_19787 ?auto_19785 ) ( ON ?auto_19786 ?auto_19787 ) ( CLEAR ?auto_19786 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_19784 ?auto_19788 ?auto_19785 ?auto_19787 )
      ( MAKE-1PILE ?auto_19784 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_19789 - BLOCK
    )
    :vars
    (
      ?auto_19790 - BLOCK
      ?auto_19793 - BLOCK
      ?auto_19791 - BLOCK
      ?auto_19792 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19790 ?auto_19789 ) ( ON-TABLE ?auto_19789 ) ( not ( = ?auto_19789 ?auto_19790 ) ) ( not ( = ?auto_19789 ?auto_19793 ) ) ( not ( = ?auto_19789 ?auto_19791 ) ) ( not ( = ?auto_19790 ?auto_19793 ) ) ( not ( = ?auto_19790 ?auto_19791 ) ) ( not ( = ?auto_19793 ?auto_19791 ) ) ( ON ?auto_19793 ?auto_19790 ) ( not ( = ?auto_19792 ?auto_19791 ) ) ( not ( = ?auto_19789 ?auto_19792 ) ) ( not ( = ?auto_19790 ?auto_19792 ) ) ( not ( = ?auto_19793 ?auto_19792 ) ) ( ON ?auto_19791 ?auto_19793 ) ( HOLDING ?auto_19792 ) ( CLEAR ?auto_19791 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_19789 ?auto_19790 ?auto_19793 ?auto_19791 ?auto_19792 )
      ( MAKE-1PILE ?auto_19789 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_19794 - BLOCK
    )
    :vars
    (
      ?auto_19795 - BLOCK
      ?auto_19798 - BLOCK
      ?auto_19797 - BLOCK
      ?auto_19796 - BLOCK
      ?auto_19799 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19795 ?auto_19794 ) ( ON-TABLE ?auto_19794 ) ( not ( = ?auto_19794 ?auto_19795 ) ) ( not ( = ?auto_19794 ?auto_19798 ) ) ( not ( = ?auto_19794 ?auto_19797 ) ) ( not ( = ?auto_19795 ?auto_19798 ) ) ( not ( = ?auto_19795 ?auto_19797 ) ) ( not ( = ?auto_19798 ?auto_19797 ) ) ( ON ?auto_19798 ?auto_19795 ) ( not ( = ?auto_19796 ?auto_19797 ) ) ( not ( = ?auto_19794 ?auto_19796 ) ) ( not ( = ?auto_19795 ?auto_19796 ) ) ( not ( = ?auto_19798 ?auto_19796 ) ) ( ON ?auto_19797 ?auto_19798 ) ( CLEAR ?auto_19797 ) ( ON ?auto_19796 ?auto_19799 ) ( CLEAR ?auto_19796 ) ( HAND-EMPTY ) ( not ( = ?auto_19794 ?auto_19799 ) ) ( not ( = ?auto_19795 ?auto_19799 ) ) ( not ( = ?auto_19798 ?auto_19799 ) ) ( not ( = ?auto_19797 ?auto_19799 ) ) ( not ( = ?auto_19796 ?auto_19799 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_19796 ?auto_19799 )
      ( MAKE-1PILE ?auto_19794 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_19800 - BLOCK
    )
    :vars
    (
      ?auto_19803 - BLOCK
      ?auto_19805 - BLOCK
      ?auto_19801 - BLOCK
      ?auto_19802 - BLOCK
      ?auto_19804 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19803 ?auto_19800 ) ( ON-TABLE ?auto_19800 ) ( not ( = ?auto_19800 ?auto_19803 ) ) ( not ( = ?auto_19800 ?auto_19805 ) ) ( not ( = ?auto_19800 ?auto_19801 ) ) ( not ( = ?auto_19803 ?auto_19805 ) ) ( not ( = ?auto_19803 ?auto_19801 ) ) ( not ( = ?auto_19805 ?auto_19801 ) ) ( ON ?auto_19805 ?auto_19803 ) ( not ( = ?auto_19802 ?auto_19801 ) ) ( not ( = ?auto_19800 ?auto_19802 ) ) ( not ( = ?auto_19803 ?auto_19802 ) ) ( not ( = ?auto_19805 ?auto_19802 ) ) ( ON ?auto_19802 ?auto_19804 ) ( CLEAR ?auto_19802 ) ( not ( = ?auto_19800 ?auto_19804 ) ) ( not ( = ?auto_19803 ?auto_19804 ) ) ( not ( = ?auto_19805 ?auto_19804 ) ) ( not ( = ?auto_19801 ?auto_19804 ) ) ( not ( = ?auto_19802 ?auto_19804 ) ) ( HOLDING ?auto_19801 ) ( CLEAR ?auto_19805 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_19800 ?auto_19803 ?auto_19805 ?auto_19801 )
      ( MAKE-1PILE ?auto_19800 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_19806 - BLOCK
    )
    :vars
    (
      ?auto_19810 - BLOCK
      ?auto_19807 - BLOCK
      ?auto_19808 - BLOCK
      ?auto_19809 - BLOCK
      ?auto_19811 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19810 ?auto_19806 ) ( ON-TABLE ?auto_19806 ) ( not ( = ?auto_19806 ?auto_19810 ) ) ( not ( = ?auto_19806 ?auto_19807 ) ) ( not ( = ?auto_19806 ?auto_19808 ) ) ( not ( = ?auto_19810 ?auto_19807 ) ) ( not ( = ?auto_19810 ?auto_19808 ) ) ( not ( = ?auto_19807 ?auto_19808 ) ) ( ON ?auto_19807 ?auto_19810 ) ( not ( = ?auto_19809 ?auto_19808 ) ) ( not ( = ?auto_19806 ?auto_19809 ) ) ( not ( = ?auto_19810 ?auto_19809 ) ) ( not ( = ?auto_19807 ?auto_19809 ) ) ( ON ?auto_19809 ?auto_19811 ) ( not ( = ?auto_19806 ?auto_19811 ) ) ( not ( = ?auto_19810 ?auto_19811 ) ) ( not ( = ?auto_19807 ?auto_19811 ) ) ( not ( = ?auto_19808 ?auto_19811 ) ) ( not ( = ?auto_19809 ?auto_19811 ) ) ( CLEAR ?auto_19807 ) ( ON ?auto_19808 ?auto_19809 ) ( CLEAR ?auto_19808 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_19811 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_19811 ?auto_19809 )
      ( MAKE-1PILE ?auto_19806 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_19812 - BLOCK
    )
    :vars
    (
      ?auto_19816 - BLOCK
      ?auto_19814 - BLOCK
      ?auto_19813 - BLOCK
      ?auto_19817 - BLOCK
      ?auto_19815 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19816 ?auto_19812 ) ( ON-TABLE ?auto_19812 ) ( not ( = ?auto_19812 ?auto_19816 ) ) ( not ( = ?auto_19812 ?auto_19814 ) ) ( not ( = ?auto_19812 ?auto_19813 ) ) ( not ( = ?auto_19816 ?auto_19814 ) ) ( not ( = ?auto_19816 ?auto_19813 ) ) ( not ( = ?auto_19814 ?auto_19813 ) ) ( not ( = ?auto_19817 ?auto_19813 ) ) ( not ( = ?auto_19812 ?auto_19817 ) ) ( not ( = ?auto_19816 ?auto_19817 ) ) ( not ( = ?auto_19814 ?auto_19817 ) ) ( ON ?auto_19817 ?auto_19815 ) ( not ( = ?auto_19812 ?auto_19815 ) ) ( not ( = ?auto_19816 ?auto_19815 ) ) ( not ( = ?auto_19814 ?auto_19815 ) ) ( not ( = ?auto_19813 ?auto_19815 ) ) ( not ( = ?auto_19817 ?auto_19815 ) ) ( ON ?auto_19813 ?auto_19817 ) ( CLEAR ?auto_19813 ) ( ON-TABLE ?auto_19815 ) ( HOLDING ?auto_19814 ) ( CLEAR ?auto_19816 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_19812 ?auto_19816 ?auto_19814 )
      ( MAKE-1PILE ?auto_19812 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_19818 - BLOCK
    )
    :vars
    (
      ?auto_19823 - BLOCK
      ?auto_19822 - BLOCK
      ?auto_19820 - BLOCK
      ?auto_19821 - BLOCK
      ?auto_19819 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19823 ?auto_19818 ) ( ON-TABLE ?auto_19818 ) ( not ( = ?auto_19818 ?auto_19823 ) ) ( not ( = ?auto_19818 ?auto_19822 ) ) ( not ( = ?auto_19818 ?auto_19820 ) ) ( not ( = ?auto_19823 ?auto_19822 ) ) ( not ( = ?auto_19823 ?auto_19820 ) ) ( not ( = ?auto_19822 ?auto_19820 ) ) ( not ( = ?auto_19821 ?auto_19820 ) ) ( not ( = ?auto_19818 ?auto_19821 ) ) ( not ( = ?auto_19823 ?auto_19821 ) ) ( not ( = ?auto_19822 ?auto_19821 ) ) ( ON ?auto_19821 ?auto_19819 ) ( not ( = ?auto_19818 ?auto_19819 ) ) ( not ( = ?auto_19823 ?auto_19819 ) ) ( not ( = ?auto_19822 ?auto_19819 ) ) ( not ( = ?auto_19820 ?auto_19819 ) ) ( not ( = ?auto_19821 ?auto_19819 ) ) ( ON ?auto_19820 ?auto_19821 ) ( ON-TABLE ?auto_19819 ) ( CLEAR ?auto_19823 ) ( ON ?auto_19822 ?auto_19820 ) ( CLEAR ?auto_19822 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_19819 ?auto_19821 ?auto_19820 )
      ( MAKE-1PILE ?auto_19818 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_19836 - BLOCK
    )
    :vars
    (
      ?auto_19840 - BLOCK
      ?auto_19838 - BLOCK
      ?auto_19837 - BLOCK
      ?auto_19839 - BLOCK
      ?auto_19841 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19836 ?auto_19840 ) ) ( not ( = ?auto_19836 ?auto_19838 ) ) ( not ( = ?auto_19836 ?auto_19837 ) ) ( not ( = ?auto_19840 ?auto_19838 ) ) ( not ( = ?auto_19840 ?auto_19837 ) ) ( not ( = ?auto_19838 ?auto_19837 ) ) ( not ( = ?auto_19839 ?auto_19837 ) ) ( not ( = ?auto_19836 ?auto_19839 ) ) ( not ( = ?auto_19840 ?auto_19839 ) ) ( not ( = ?auto_19838 ?auto_19839 ) ) ( ON ?auto_19839 ?auto_19841 ) ( not ( = ?auto_19836 ?auto_19841 ) ) ( not ( = ?auto_19840 ?auto_19841 ) ) ( not ( = ?auto_19838 ?auto_19841 ) ) ( not ( = ?auto_19837 ?auto_19841 ) ) ( not ( = ?auto_19839 ?auto_19841 ) ) ( ON ?auto_19837 ?auto_19839 ) ( ON-TABLE ?auto_19841 ) ( ON ?auto_19838 ?auto_19837 ) ( ON ?auto_19840 ?auto_19838 ) ( CLEAR ?auto_19840 ) ( HOLDING ?auto_19836 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_19836 ?auto_19840 )
      ( MAKE-1PILE ?auto_19836 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_19842 - BLOCK
    )
    :vars
    (
      ?auto_19844 - BLOCK
      ?auto_19843 - BLOCK
      ?auto_19845 - BLOCK
      ?auto_19846 - BLOCK
      ?auto_19847 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19842 ?auto_19844 ) ) ( not ( = ?auto_19842 ?auto_19843 ) ) ( not ( = ?auto_19842 ?auto_19845 ) ) ( not ( = ?auto_19844 ?auto_19843 ) ) ( not ( = ?auto_19844 ?auto_19845 ) ) ( not ( = ?auto_19843 ?auto_19845 ) ) ( not ( = ?auto_19846 ?auto_19845 ) ) ( not ( = ?auto_19842 ?auto_19846 ) ) ( not ( = ?auto_19844 ?auto_19846 ) ) ( not ( = ?auto_19843 ?auto_19846 ) ) ( ON ?auto_19846 ?auto_19847 ) ( not ( = ?auto_19842 ?auto_19847 ) ) ( not ( = ?auto_19844 ?auto_19847 ) ) ( not ( = ?auto_19843 ?auto_19847 ) ) ( not ( = ?auto_19845 ?auto_19847 ) ) ( not ( = ?auto_19846 ?auto_19847 ) ) ( ON ?auto_19845 ?auto_19846 ) ( ON-TABLE ?auto_19847 ) ( ON ?auto_19843 ?auto_19845 ) ( ON ?auto_19844 ?auto_19843 ) ( ON ?auto_19842 ?auto_19844 ) ( CLEAR ?auto_19842 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_19847 ?auto_19846 ?auto_19845 ?auto_19843 ?auto_19844 )
      ( MAKE-1PILE ?auto_19842 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_19852 - BLOCK
      ?auto_19853 - BLOCK
      ?auto_19854 - BLOCK
      ?auto_19855 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_19855 ) ( CLEAR ?auto_19854 ) ( ON-TABLE ?auto_19852 ) ( ON ?auto_19853 ?auto_19852 ) ( ON ?auto_19854 ?auto_19853 ) ( not ( = ?auto_19852 ?auto_19853 ) ) ( not ( = ?auto_19852 ?auto_19854 ) ) ( not ( = ?auto_19852 ?auto_19855 ) ) ( not ( = ?auto_19853 ?auto_19854 ) ) ( not ( = ?auto_19853 ?auto_19855 ) ) ( not ( = ?auto_19854 ?auto_19855 ) ) )
    :subtasks
    ( ( !STACK ?auto_19855 ?auto_19854 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_19856 - BLOCK
      ?auto_19857 - BLOCK
      ?auto_19858 - BLOCK
      ?auto_19859 - BLOCK
    )
    :vars
    (
      ?auto_19860 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_19858 ) ( ON-TABLE ?auto_19856 ) ( ON ?auto_19857 ?auto_19856 ) ( ON ?auto_19858 ?auto_19857 ) ( not ( = ?auto_19856 ?auto_19857 ) ) ( not ( = ?auto_19856 ?auto_19858 ) ) ( not ( = ?auto_19856 ?auto_19859 ) ) ( not ( = ?auto_19857 ?auto_19858 ) ) ( not ( = ?auto_19857 ?auto_19859 ) ) ( not ( = ?auto_19858 ?auto_19859 ) ) ( ON ?auto_19859 ?auto_19860 ) ( CLEAR ?auto_19859 ) ( HAND-EMPTY ) ( not ( = ?auto_19856 ?auto_19860 ) ) ( not ( = ?auto_19857 ?auto_19860 ) ) ( not ( = ?auto_19858 ?auto_19860 ) ) ( not ( = ?auto_19859 ?auto_19860 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_19859 ?auto_19860 )
      ( MAKE-4PILE ?auto_19856 ?auto_19857 ?auto_19858 ?auto_19859 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_19861 - BLOCK
      ?auto_19862 - BLOCK
      ?auto_19863 - BLOCK
      ?auto_19864 - BLOCK
    )
    :vars
    (
      ?auto_19865 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_19861 ) ( ON ?auto_19862 ?auto_19861 ) ( not ( = ?auto_19861 ?auto_19862 ) ) ( not ( = ?auto_19861 ?auto_19863 ) ) ( not ( = ?auto_19861 ?auto_19864 ) ) ( not ( = ?auto_19862 ?auto_19863 ) ) ( not ( = ?auto_19862 ?auto_19864 ) ) ( not ( = ?auto_19863 ?auto_19864 ) ) ( ON ?auto_19864 ?auto_19865 ) ( CLEAR ?auto_19864 ) ( not ( = ?auto_19861 ?auto_19865 ) ) ( not ( = ?auto_19862 ?auto_19865 ) ) ( not ( = ?auto_19863 ?auto_19865 ) ) ( not ( = ?auto_19864 ?auto_19865 ) ) ( HOLDING ?auto_19863 ) ( CLEAR ?auto_19862 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_19861 ?auto_19862 ?auto_19863 )
      ( MAKE-4PILE ?auto_19861 ?auto_19862 ?auto_19863 ?auto_19864 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_19866 - BLOCK
      ?auto_19867 - BLOCK
      ?auto_19868 - BLOCK
      ?auto_19869 - BLOCK
    )
    :vars
    (
      ?auto_19870 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_19866 ) ( ON ?auto_19867 ?auto_19866 ) ( not ( = ?auto_19866 ?auto_19867 ) ) ( not ( = ?auto_19866 ?auto_19868 ) ) ( not ( = ?auto_19866 ?auto_19869 ) ) ( not ( = ?auto_19867 ?auto_19868 ) ) ( not ( = ?auto_19867 ?auto_19869 ) ) ( not ( = ?auto_19868 ?auto_19869 ) ) ( ON ?auto_19869 ?auto_19870 ) ( not ( = ?auto_19866 ?auto_19870 ) ) ( not ( = ?auto_19867 ?auto_19870 ) ) ( not ( = ?auto_19868 ?auto_19870 ) ) ( not ( = ?auto_19869 ?auto_19870 ) ) ( CLEAR ?auto_19867 ) ( ON ?auto_19868 ?auto_19869 ) ( CLEAR ?auto_19868 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_19870 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_19870 ?auto_19869 )
      ( MAKE-4PILE ?auto_19866 ?auto_19867 ?auto_19868 ?auto_19869 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_19871 - BLOCK
      ?auto_19872 - BLOCK
      ?auto_19873 - BLOCK
      ?auto_19874 - BLOCK
    )
    :vars
    (
      ?auto_19875 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_19871 ) ( not ( = ?auto_19871 ?auto_19872 ) ) ( not ( = ?auto_19871 ?auto_19873 ) ) ( not ( = ?auto_19871 ?auto_19874 ) ) ( not ( = ?auto_19872 ?auto_19873 ) ) ( not ( = ?auto_19872 ?auto_19874 ) ) ( not ( = ?auto_19873 ?auto_19874 ) ) ( ON ?auto_19874 ?auto_19875 ) ( not ( = ?auto_19871 ?auto_19875 ) ) ( not ( = ?auto_19872 ?auto_19875 ) ) ( not ( = ?auto_19873 ?auto_19875 ) ) ( not ( = ?auto_19874 ?auto_19875 ) ) ( ON ?auto_19873 ?auto_19874 ) ( CLEAR ?auto_19873 ) ( ON-TABLE ?auto_19875 ) ( HOLDING ?auto_19872 ) ( CLEAR ?auto_19871 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_19871 ?auto_19872 )
      ( MAKE-4PILE ?auto_19871 ?auto_19872 ?auto_19873 ?auto_19874 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_19876 - BLOCK
      ?auto_19877 - BLOCK
      ?auto_19878 - BLOCK
      ?auto_19879 - BLOCK
    )
    :vars
    (
      ?auto_19880 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_19876 ) ( not ( = ?auto_19876 ?auto_19877 ) ) ( not ( = ?auto_19876 ?auto_19878 ) ) ( not ( = ?auto_19876 ?auto_19879 ) ) ( not ( = ?auto_19877 ?auto_19878 ) ) ( not ( = ?auto_19877 ?auto_19879 ) ) ( not ( = ?auto_19878 ?auto_19879 ) ) ( ON ?auto_19879 ?auto_19880 ) ( not ( = ?auto_19876 ?auto_19880 ) ) ( not ( = ?auto_19877 ?auto_19880 ) ) ( not ( = ?auto_19878 ?auto_19880 ) ) ( not ( = ?auto_19879 ?auto_19880 ) ) ( ON ?auto_19878 ?auto_19879 ) ( ON-TABLE ?auto_19880 ) ( CLEAR ?auto_19876 ) ( ON ?auto_19877 ?auto_19878 ) ( CLEAR ?auto_19877 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_19880 ?auto_19879 ?auto_19878 )
      ( MAKE-4PILE ?auto_19876 ?auto_19877 ?auto_19878 ?auto_19879 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_19881 - BLOCK
      ?auto_19882 - BLOCK
      ?auto_19883 - BLOCK
      ?auto_19884 - BLOCK
    )
    :vars
    (
      ?auto_19885 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19881 ?auto_19882 ) ) ( not ( = ?auto_19881 ?auto_19883 ) ) ( not ( = ?auto_19881 ?auto_19884 ) ) ( not ( = ?auto_19882 ?auto_19883 ) ) ( not ( = ?auto_19882 ?auto_19884 ) ) ( not ( = ?auto_19883 ?auto_19884 ) ) ( ON ?auto_19884 ?auto_19885 ) ( not ( = ?auto_19881 ?auto_19885 ) ) ( not ( = ?auto_19882 ?auto_19885 ) ) ( not ( = ?auto_19883 ?auto_19885 ) ) ( not ( = ?auto_19884 ?auto_19885 ) ) ( ON ?auto_19883 ?auto_19884 ) ( ON-TABLE ?auto_19885 ) ( ON ?auto_19882 ?auto_19883 ) ( CLEAR ?auto_19882 ) ( HOLDING ?auto_19881 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_19881 )
      ( MAKE-4PILE ?auto_19881 ?auto_19882 ?auto_19883 ?auto_19884 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_19886 - BLOCK
      ?auto_19887 - BLOCK
      ?auto_19888 - BLOCK
      ?auto_19889 - BLOCK
    )
    :vars
    (
      ?auto_19890 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19886 ?auto_19887 ) ) ( not ( = ?auto_19886 ?auto_19888 ) ) ( not ( = ?auto_19886 ?auto_19889 ) ) ( not ( = ?auto_19887 ?auto_19888 ) ) ( not ( = ?auto_19887 ?auto_19889 ) ) ( not ( = ?auto_19888 ?auto_19889 ) ) ( ON ?auto_19889 ?auto_19890 ) ( not ( = ?auto_19886 ?auto_19890 ) ) ( not ( = ?auto_19887 ?auto_19890 ) ) ( not ( = ?auto_19888 ?auto_19890 ) ) ( not ( = ?auto_19889 ?auto_19890 ) ) ( ON ?auto_19888 ?auto_19889 ) ( ON-TABLE ?auto_19890 ) ( ON ?auto_19887 ?auto_19888 ) ( ON ?auto_19886 ?auto_19887 ) ( CLEAR ?auto_19886 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_19890 ?auto_19889 ?auto_19888 ?auto_19887 )
      ( MAKE-4PILE ?auto_19886 ?auto_19887 ?auto_19888 ?auto_19889 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_19891 - BLOCK
      ?auto_19892 - BLOCK
      ?auto_19893 - BLOCK
      ?auto_19894 - BLOCK
    )
    :vars
    (
      ?auto_19895 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19891 ?auto_19892 ) ) ( not ( = ?auto_19891 ?auto_19893 ) ) ( not ( = ?auto_19891 ?auto_19894 ) ) ( not ( = ?auto_19892 ?auto_19893 ) ) ( not ( = ?auto_19892 ?auto_19894 ) ) ( not ( = ?auto_19893 ?auto_19894 ) ) ( ON ?auto_19894 ?auto_19895 ) ( not ( = ?auto_19891 ?auto_19895 ) ) ( not ( = ?auto_19892 ?auto_19895 ) ) ( not ( = ?auto_19893 ?auto_19895 ) ) ( not ( = ?auto_19894 ?auto_19895 ) ) ( ON ?auto_19893 ?auto_19894 ) ( ON-TABLE ?auto_19895 ) ( ON ?auto_19892 ?auto_19893 ) ( HOLDING ?auto_19891 ) ( CLEAR ?auto_19892 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_19895 ?auto_19894 ?auto_19893 ?auto_19892 ?auto_19891 )
      ( MAKE-4PILE ?auto_19891 ?auto_19892 ?auto_19893 ?auto_19894 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_19896 - BLOCK
      ?auto_19897 - BLOCK
      ?auto_19898 - BLOCK
      ?auto_19899 - BLOCK
    )
    :vars
    (
      ?auto_19900 - BLOCK
      ?auto_19901 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19896 ?auto_19897 ) ) ( not ( = ?auto_19896 ?auto_19898 ) ) ( not ( = ?auto_19896 ?auto_19899 ) ) ( not ( = ?auto_19897 ?auto_19898 ) ) ( not ( = ?auto_19897 ?auto_19899 ) ) ( not ( = ?auto_19898 ?auto_19899 ) ) ( ON ?auto_19899 ?auto_19900 ) ( not ( = ?auto_19896 ?auto_19900 ) ) ( not ( = ?auto_19897 ?auto_19900 ) ) ( not ( = ?auto_19898 ?auto_19900 ) ) ( not ( = ?auto_19899 ?auto_19900 ) ) ( ON ?auto_19898 ?auto_19899 ) ( ON-TABLE ?auto_19900 ) ( ON ?auto_19897 ?auto_19898 ) ( CLEAR ?auto_19897 ) ( ON ?auto_19896 ?auto_19901 ) ( CLEAR ?auto_19896 ) ( HAND-EMPTY ) ( not ( = ?auto_19896 ?auto_19901 ) ) ( not ( = ?auto_19897 ?auto_19901 ) ) ( not ( = ?auto_19898 ?auto_19901 ) ) ( not ( = ?auto_19899 ?auto_19901 ) ) ( not ( = ?auto_19900 ?auto_19901 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_19896 ?auto_19901 )
      ( MAKE-4PILE ?auto_19896 ?auto_19897 ?auto_19898 ?auto_19899 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_19902 - BLOCK
      ?auto_19903 - BLOCK
      ?auto_19904 - BLOCK
      ?auto_19905 - BLOCK
    )
    :vars
    (
      ?auto_19907 - BLOCK
      ?auto_19906 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19902 ?auto_19903 ) ) ( not ( = ?auto_19902 ?auto_19904 ) ) ( not ( = ?auto_19902 ?auto_19905 ) ) ( not ( = ?auto_19903 ?auto_19904 ) ) ( not ( = ?auto_19903 ?auto_19905 ) ) ( not ( = ?auto_19904 ?auto_19905 ) ) ( ON ?auto_19905 ?auto_19907 ) ( not ( = ?auto_19902 ?auto_19907 ) ) ( not ( = ?auto_19903 ?auto_19907 ) ) ( not ( = ?auto_19904 ?auto_19907 ) ) ( not ( = ?auto_19905 ?auto_19907 ) ) ( ON ?auto_19904 ?auto_19905 ) ( ON-TABLE ?auto_19907 ) ( ON ?auto_19902 ?auto_19906 ) ( CLEAR ?auto_19902 ) ( not ( = ?auto_19902 ?auto_19906 ) ) ( not ( = ?auto_19903 ?auto_19906 ) ) ( not ( = ?auto_19904 ?auto_19906 ) ) ( not ( = ?auto_19905 ?auto_19906 ) ) ( not ( = ?auto_19907 ?auto_19906 ) ) ( HOLDING ?auto_19903 ) ( CLEAR ?auto_19904 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_19907 ?auto_19905 ?auto_19904 ?auto_19903 )
      ( MAKE-4PILE ?auto_19902 ?auto_19903 ?auto_19904 ?auto_19905 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_19908 - BLOCK
      ?auto_19909 - BLOCK
      ?auto_19910 - BLOCK
      ?auto_19911 - BLOCK
    )
    :vars
    (
      ?auto_19912 - BLOCK
      ?auto_19913 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19908 ?auto_19909 ) ) ( not ( = ?auto_19908 ?auto_19910 ) ) ( not ( = ?auto_19908 ?auto_19911 ) ) ( not ( = ?auto_19909 ?auto_19910 ) ) ( not ( = ?auto_19909 ?auto_19911 ) ) ( not ( = ?auto_19910 ?auto_19911 ) ) ( ON ?auto_19911 ?auto_19912 ) ( not ( = ?auto_19908 ?auto_19912 ) ) ( not ( = ?auto_19909 ?auto_19912 ) ) ( not ( = ?auto_19910 ?auto_19912 ) ) ( not ( = ?auto_19911 ?auto_19912 ) ) ( ON ?auto_19910 ?auto_19911 ) ( ON-TABLE ?auto_19912 ) ( ON ?auto_19908 ?auto_19913 ) ( not ( = ?auto_19908 ?auto_19913 ) ) ( not ( = ?auto_19909 ?auto_19913 ) ) ( not ( = ?auto_19910 ?auto_19913 ) ) ( not ( = ?auto_19911 ?auto_19913 ) ) ( not ( = ?auto_19912 ?auto_19913 ) ) ( CLEAR ?auto_19910 ) ( ON ?auto_19909 ?auto_19908 ) ( CLEAR ?auto_19909 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_19913 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_19913 ?auto_19908 )
      ( MAKE-4PILE ?auto_19908 ?auto_19909 ?auto_19910 ?auto_19911 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_19914 - BLOCK
      ?auto_19915 - BLOCK
      ?auto_19916 - BLOCK
      ?auto_19917 - BLOCK
    )
    :vars
    (
      ?auto_19918 - BLOCK
      ?auto_19919 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19914 ?auto_19915 ) ) ( not ( = ?auto_19914 ?auto_19916 ) ) ( not ( = ?auto_19914 ?auto_19917 ) ) ( not ( = ?auto_19915 ?auto_19916 ) ) ( not ( = ?auto_19915 ?auto_19917 ) ) ( not ( = ?auto_19916 ?auto_19917 ) ) ( ON ?auto_19917 ?auto_19918 ) ( not ( = ?auto_19914 ?auto_19918 ) ) ( not ( = ?auto_19915 ?auto_19918 ) ) ( not ( = ?auto_19916 ?auto_19918 ) ) ( not ( = ?auto_19917 ?auto_19918 ) ) ( ON-TABLE ?auto_19918 ) ( ON ?auto_19914 ?auto_19919 ) ( not ( = ?auto_19914 ?auto_19919 ) ) ( not ( = ?auto_19915 ?auto_19919 ) ) ( not ( = ?auto_19916 ?auto_19919 ) ) ( not ( = ?auto_19917 ?auto_19919 ) ) ( not ( = ?auto_19918 ?auto_19919 ) ) ( ON ?auto_19915 ?auto_19914 ) ( CLEAR ?auto_19915 ) ( ON-TABLE ?auto_19919 ) ( HOLDING ?auto_19916 ) ( CLEAR ?auto_19917 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_19918 ?auto_19917 ?auto_19916 )
      ( MAKE-4PILE ?auto_19914 ?auto_19915 ?auto_19916 ?auto_19917 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_19920 - BLOCK
      ?auto_19921 - BLOCK
      ?auto_19922 - BLOCK
      ?auto_19923 - BLOCK
    )
    :vars
    (
      ?auto_19925 - BLOCK
      ?auto_19924 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19920 ?auto_19921 ) ) ( not ( = ?auto_19920 ?auto_19922 ) ) ( not ( = ?auto_19920 ?auto_19923 ) ) ( not ( = ?auto_19921 ?auto_19922 ) ) ( not ( = ?auto_19921 ?auto_19923 ) ) ( not ( = ?auto_19922 ?auto_19923 ) ) ( ON ?auto_19923 ?auto_19925 ) ( not ( = ?auto_19920 ?auto_19925 ) ) ( not ( = ?auto_19921 ?auto_19925 ) ) ( not ( = ?auto_19922 ?auto_19925 ) ) ( not ( = ?auto_19923 ?auto_19925 ) ) ( ON-TABLE ?auto_19925 ) ( ON ?auto_19920 ?auto_19924 ) ( not ( = ?auto_19920 ?auto_19924 ) ) ( not ( = ?auto_19921 ?auto_19924 ) ) ( not ( = ?auto_19922 ?auto_19924 ) ) ( not ( = ?auto_19923 ?auto_19924 ) ) ( not ( = ?auto_19925 ?auto_19924 ) ) ( ON ?auto_19921 ?auto_19920 ) ( ON-TABLE ?auto_19924 ) ( CLEAR ?auto_19923 ) ( ON ?auto_19922 ?auto_19921 ) ( CLEAR ?auto_19922 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_19924 ?auto_19920 ?auto_19921 )
      ( MAKE-4PILE ?auto_19920 ?auto_19921 ?auto_19922 ?auto_19923 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_19926 - BLOCK
      ?auto_19927 - BLOCK
      ?auto_19928 - BLOCK
      ?auto_19929 - BLOCK
    )
    :vars
    (
      ?auto_19930 - BLOCK
      ?auto_19931 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19926 ?auto_19927 ) ) ( not ( = ?auto_19926 ?auto_19928 ) ) ( not ( = ?auto_19926 ?auto_19929 ) ) ( not ( = ?auto_19927 ?auto_19928 ) ) ( not ( = ?auto_19927 ?auto_19929 ) ) ( not ( = ?auto_19928 ?auto_19929 ) ) ( not ( = ?auto_19926 ?auto_19930 ) ) ( not ( = ?auto_19927 ?auto_19930 ) ) ( not ( = ?auto_19928 ?auto_19930 ) ) ( not ( = ?auto_19929 ?auto_19930 ) ) ( ON-TABLE ?auto_19930 ) ( ON ?auto_19926 ?auto_19931 ) ( not ( = ?auto_19926 ?auto_19931 ) ) ( not ( = ?auto_19927 ?auto_19931 ) ) ( not ( = ?auto_19928 ?auto_19931 ) ) ( not ( = ?auto_19929 ?auto_19931 ) ) ( not ( = ?auto_19930 ?auto_19931 ) ) ( ON ?auto_19927 ?auto_19926 ) ( ON-TABLE ?auto_19931 ) ( ON ?auto_19928 ?auto_19927 ) ( CLEAR ?auto_19928 ) ( HOLDING ?auto_19929 ) ( CLEAR ?auto_19930 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_19930 ?auto_19929 )
      ( MAKE-4PILE ?auto_19926 ?auto_19927 ?auto_19928 ?auto_19929 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_19932 - BLOCK
      ?auto_19933 - BLOCK
      ?auto_19934 - BLOCK
      ?auto_19935 - BLOCK
    )
    :vars
    (
      ?auto_19936 - BLOCK
      ?auto_19937 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19932 ?auto_19933 ) ) ( not ( = ?auto_19932 ?auto_19934 ) ) ( not ( = ?auto_19932 ?auto_19935 ) ) ( not ( = ?auto_19933 ?auto_19934 ) ) ( not ( = ?auto_19933 ?auto_19935 ) ) ( not ( = ?auto_19934 ?auto_19935 ) ) ( not ( = ?auto_19932 ?auto_19936 ) ) ( not ( = ?auto_19933 ?auto_19936 ) ) ( not ( = ?auto_19934 ?auto_19936 ) ) ( not ( = ?auto_19935 ?auto_19936 ) ) ( ON-TABLE ?auto_19936 ) ( ON ?auto_19932 ?auto_19937 ) ( not ( = ?auto_19932 ?auto_19937 ) ) ( not ( = ?auto_19933 ?auto_19937 ) ) ( not ( = ?auto_19934 ?auto_19937 ) ) ( not ( = ?auto_19935 ?auto_19937 ) ) ( not ( = ?auto_19936 ?auto_19937 ) ) ( ON ?auto_19933 ?auto_19932 ) ( ON-TABLE ?auto_19937 ) ( ON ?auto_19934 ?auto_19933 ) ( CLEAR ?auto_19936 ) ( ON ?auto_19935 ?auto_19934 ) ( CLEAR ?auto_19935 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_19937 ?auto_19932 ?auto_19933 ?auto_19934 )
      ( MAKE-4PILE ?auto_19932 ?auto_19933 ?auto_19934 ?auto_19935 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_19938 - BLOCK
      ?auto_19939 - BLOCK
      ?auto_19940 - BLOCK
      ?auto_19941 - BLOCK
    )
    :vars
    (
      ?auto_19943 - BLOCK
      ?auto_19942 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19938 ?auto_19939 ) ) ( not ( = ?auto_19938 ?auto_19940 ) ) ( not ( = ?auto_19938 ?auto_19941 ) ) ( not ( = ?auto_19939 ?auto_19940 ) ) ( not ( = ?auto_19939 ?auto_19941 ) ) ( not ( = ?auto_19940 ?auto_19941 ) ) ( not ( = ?auto_19938 ?auto_19943 ) ) ( not ( = ?auto_19939 ?auto_19943 ) ) ( not ( = ?auto_19940 ?auto_19943 ) ) ( not ( = ?auto_19941 ?auto_19943 ) ) ( ON ?auto_19938 ?auto_19942 ) ( not ( = ?auto_19938 ?auto_19942 ) ) ( not ( = ?auto_19939 ?auto_19942 ) ) ( not ( = ?auto_19940 ?auto_19942 ) ) ( not ( = ?auto_19941 ?auto_19942 ) ) ( not ( = ?auto_19943 ?auto_19942 ) ) ( ON ?auto_19939 ?auto_19938 ) ( ON-TABLE ?auto_19942 ) ( ON ?auto_19940 ?auto_19939 ) ( ON ?auto_19941 ?auto_19940 ) ( CLEAR ?auto_19941 ) ( HOLDING ?auto_19943 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_19943 )
      ( MAKE-4PILE ?auto_19938 ?auto_19939 ?auto_19940 ?auto_19941 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_19944 - BLOCK
      ?auto_19945 - BLOCK
      ?auto_19946 - BLOCK
      ?auto_19947 - BLOCK
    )
    :vars
    (
      ?auto_19948 - BLOCK
      ?auto_19949 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19944 ?auto_19945 ) ) ( not ( = ?auto_19944 ?auto_19946 ) ) ( not ( = ?auto_19944 ?auto_19947 ) ) ( not ( = ?auto_19945 ?auto_19946 ) ) ( not ( = ?auto_19945 ?auto_19947 ) ) ( not ( = ?auto_19946 ?auto_19947 ) ) ( not ( = ?auto_19944 ?auto_19948 ) ) ( not ( = ?auto_19945 ?auto_19948 ) ) ( not ( = ?auto_19946 ?auto_19948 ) ) ( not ( = ?auto_19947 ?auto_19948 ) ) ( ON ?auto_19944 ?auto_19949 ) ( not ( = ?auto_19944 ?auto_19949 ) ) ( not ( = ?auto_19945 ?auto_19949 ) ) ( not ( = ?auto_19946 ?auto_19949 ) ) ( not ( = ?auto_19947 ?auto_19949 ) ) ( not ( = ?auto_19948 ?auto_19949 ) ) ( ON ?auto_19945 ?auto_19944 ) ( ON-TABLE ?auto_19949 ) ( ON ?auto_19946 ?auto_19945 ) ( ON ?auto_19947 ?auto_19946 ) ( ON ?auto_19948 ?auto_19947 ) ( CLEAR ?auto_19948 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_19949 ?auto_19944 ?auto_19945 ?auto_19946 ?auto_19947 )
      ( MAKE-4PILE ?auto_19944 ?auto_19945 ?auto_19946 ?auto_19947 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_19955 - BLOCK
      ?auto_19956 - BLOCK
      ?auto_19957 - BLOCK
      ?auto_19958 - BLOCK
      ?auto_19959 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_19959 ) ( CLEAR ?auto_19958 ) ( ON-TABLE ?auto_19955 ) ( ON ?auto_19956 ?auto_19955 ) ( ON ?auto_19957 ?auto_19956 ) ( ON ?auto_19958 ?auto_19957 ) ( not ( = ?auto_19955 ?auto_19956 ) ) ( not ( = ?auto_19955 ?auto_19957 ) ) ( not ( = ?auto_19955 ?auto_19958 ) ) ( not ( = ?auto_19955 ?auto_19959 ) ) ( not ( = ?auto_19956 ?auto_19957 ) ) ( not ( = ?auto_19956 ?auto_19958 ) ) ( not ( = ?auto_19956 ?auto_19959 ) ) ( not ( = ?auto_19957 ?auto_19958 ) ) ( not ( = ?auto_19957 ?auto_19959 ) ) ( not ( = ?auto_19958 ?auto_19959 ) ) )
    :subtasks
    ( ( !STACK ?auto_19959 ?auto_19958 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_19960 - BLOCK
      ?auto_19961 - BLOCK
      ?auto_19962 - BLOCK
      ?auto_19963 - BLOCK
      ?auto_19964 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_19963 ) ( ON-TABLE ?auto_19960 ) ( ON ?auto_19961 ?auto_19960 ) ( ON ?auto_19962 ?auto_19961 ) ( ON ?auto_19963 ?auto_19962 ) ( not ( = ?auto_19960 ?auto_19961 ) ) ( not ( = ?auto_19960 ?auto_19962 ) ) ( not ( = ?auto_19960 ?auto_19963 ) ) ( not ( = ?auto_19960 ?auto_19964 ) ) ( not ( = ?auto_19961 ?auto_19962 ) ) ( not ( = ?auto_19961 ?auto_19963 ) ) ( not ( = ?auto_19961 ?auto_19964 ) ) ( not ( = ?auto_19962 ?auto_19963 ) ) ( not ( = ?auto_19962 ?auto_19964 ) ) ( not ( = ?auto_19963 ?auto_19964 ) ) ( ON-TABLE ?auto_19964 ) ( CLEAR ?auto_19964 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_19964 )
      ( MAKE-5PILE ?auto_19960 ?auto_19961 ?auto_19962 ?auto_19963 ?auto_19964 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_19965 - BLOCK
      ?auto_19966 - BLOCK
      ?auto_19967 - BLOCK
      ?auto_19968 - BLOCK
      ?auto_19969 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_19965 ) ( ON ?auto_19966 ?auto_19965 ) ( ON ?auto_19967 ?auto_19966 ) ( not ( = ?auto_19965 ?auto_19966 ) ) ( not ( = ?auto_19965 ?auto_19967 ) ) ( not ( = ?auto_19965 ?auto_19968 ) ) ( not ( = ?auto_19965 ?auto_19969 ) ) ( not ( = ?auto_19966 ?auto_19967 ) ) ( not ( = ?auto_19966 ?auto_19968 ) ) ( not ( = ?auto_19966 ?auto_19969 ) ) ( not ( = ?auto_19967 ?auto_19968 ) ) ( not ( = ?auto_19967 ?auto_19969 ) ) ( not ( = ?auto_19968 ?auto_19969 ) ) ( ON-TABLE ?auto_19969 ) ( CLEAR ?auto_19969 ) ( HOLDING ?auto_19968 ) ( CLEAR ?auto_19967 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_19965 ?auto_19966 ?auto_19967 ?auto_19968 )
      ( MAKE-5PILE ?auto_19965 ?auto_19966 ?auto_19967 ?auto_19968 ?auto_19969 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_19970 - BLOCK
      ?auto_19971 - BLOCK
      ?auto_19972 - BLOCK
      ?auto_19973 - BLOCK
      ?auto_19974 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_19970 ) ( ON ?auto_19971 ?auto_19970 ) ( ON ?auto_19972 ?auto_19971 ) ( not ( = ?auto_19970 ?auto_19971 ) ) ( not ( = ?auto_19970 ?auto_19972 ) ) ( not ( = ?auto_19970 ?auto_19973 ) ) ( not ( = ?auto_19970 ?auto_19974 ) ) ( not ( = ?auto_19971 ?auto_19972 ) ) ( not ( = ?auto_19971 ?auto_19973 ) ) ( not ( = ?auto_19971 ?auto_19974 ) ) ( not ( = ?auto_19972 ?auto_19973 ) ) ( not ( = ?auto_19972 ?auto_19974 ) ) ( not ( = ?auto_19973 ?auto_19974 ) ) ( ON-TABLE ?auto_19974 ) ( CLEAR ?auto_19972 ) ( ON ?auto_19973 ?auto_19974 ) ( CLEAR ?auto_19973 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_19974 )
      ( MAKE-5PILE ?auto_19970 ?auto_19971 ?auto_19972 ?auto_19973 ?auto_19974 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_19975 - BLOCK
      ?auto_19976 - BLOCK
      ?auto_19977 - BLOCK
      ?auto_19978 - BLOCK
      ?auto_19979 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_19975 ) ( ON ?auto_19976 ?auto_19975 ) ( not ( = ?auto_19975 ?auto_19976 ) ) ( not ( = ?auto_19975 ?auto_19977 ) ) ( not ( = ?auto_19975 ?auto_19978 ) ) ( not ( = ?auto_19975 ?auto_19979 ) ) ( not ( = ?auto_19976 ?auto_19977 ) ) ( not ( = ?auto_19976 ?auto_19978 ) ) ( not ( = ?auto_19976 ?auto_19979 ) ) ( not ( = ?auto_19977 ?auto_19978 ) ) ( not ( = ?auto_19977 ?auto_19979 ) ) ( not ( = ?auto_19978 ?auto_19979 ) ) ( ON-TABLE ?auto_19979 ) ( ON ?auto_19978 ?auto_19979 ) ( CLEAR ?auto_19978 ) ( HOLDING ?auto_19977 ) ( CLEAR ?auto_19976 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_19975 ?auto_19976 ?auto_19977 )
      ( MAKE-5PILE ?auto_19975 ?auto_19976 ?auto_19977 ?auto_19978 ?auto_19979 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_19980 - BLOCK
      ?auto_19981 - BLOCK
      ?auto_19982 - BLOCK
      ?auto_19983 - BLOCK
      ?auto_19984 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_19980 ) ( ON ?auto_19981 ?auto_19980 ) ( not ( = ?auto_19980 ?auto_19981 ) ) ( not ( = ?auto_19980 ?auto_19982 ) ) ( not ( = ?auto_19980 ?auto_19983 ) ) ( not ( = ?auto_19980 ?auto_19984 ) ) ( not ( = ?auto_19981 ?auto_19982 ) ) ( not ( = ?auto_19981 ?auto_19983 ) ) ( not ( = ?auto_19981 ?auto_19984 ) ) ( not ( = ?auto_19982 ?auto_19983 ) ) ( not ( = ?auto_19982 ?auto_19984 ) ) ( not ( = ?auto_19983 ?auto_19984 ) ) ( ON-TABLE ?auto_19984 ) ( ON ?auto_19983 ?auto_19984 ) ( CLEAR ?auto_19981 ) ( ON ?auto_19982 ?auto_19983 ) ( CLEAR ?auto_19982 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_19984 ?auto_19983 )
      ( MAKE-5PILE ?auto_19980 ?auto_19981 ?auto_19982 ?auto_19983 ?auto_19984 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_19985 - BLOCK
      ?auto_19986 - BLOCK
      ?auto_19987 - BLOCK
      ?auto_19988 - BLOCK
      ?auto_19989 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_19985 ) ( not ( = ?auto_19985 ?auto_19986 ) ) ( not ( = ?auto_19985 ?auto_19987 ) ) ( not ( = ?auto_19985 ?auto_19988 ) ) ( not ( = ?auto_19985 ?auto_19989 ) ) ( not ( = ?auto_19986 ?auto_19987 ) ) ( not ( = ?auto_19986 ?auto_19988 ) ) ( not ( = ?auto_19986 ?auto_19989 ) ) ( not ( = ?auto_19987 ?auto_19988 ) ) ( not ( = ?auto_19987 ?auto_19989 ) ) ( not ( = ?auto_19988 ?auto_19989 ) ) ( ON-TABLE ?auto_19989 ) ( ON ?auto_19988 ?auto_19989 ) ( ON ?auto_19987 ?auto_19988 ) ( CLEAR ?auto_19987 ) ( HOLDING ?auto_19986 ) ( CLEAR ?auto_19985 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_19985 ?auto_19986 )
      ( MAKE-5PILE ?auto_19985 ?auto_19986 ?auto_19987 ?auto_19988 ?auto_19989 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_19990 - BLOCK
      ?auto_19991 - BLOCK
      ?auto_19992 - BLOCK
      ?auto_19993 - BLOCK
      ?auto_19994 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_19990 ) ( not ( = ?auto_19990 ?auto_19991 ) ) ( not ( = ?auto_19990 ?auto_19992 ) ) ( not ( = ?auto_19990 ?auto_19993 ) ) ( not ( = ?auto_19990 ?auto_19994 ) ) ( not ( = ?auto_19991 ?auto_19992 ) ) ( not ( = ?auto_19991 ?auto_19993 ) ) ( not ( = ?auto_19991 ?auto_19994 ) ) ( not ( = ?auto_19992 ?auto_19993 ) ) ( not ( = ?auto_19992 ?auto_19994 ) ) ( not ( = ?auto_19993 ?auto_19994 ) ) ( ON-TABLE ?auto_19994 ) ( ON ?auto_19993 ?auto_19994 ) ( ON ?auto_19992 ?auto_19993 ) ( CLEAR ?auto_19990 ) ( ON ?auto_19991 ?auto_19992 ) ( CLEAR ?auto_19991 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_19994 ?auto_19993 ?auto_19992 )
      ( MAKE-5PILE ?auto_19990 ?auto_19991 ?auto_19992 ?auto_19993 ?auto_19994 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_19995 - BLOCK
      ?auto_19996 - BLOCK
      ?auto_19997 - BLOCK
      ?auto_19998 - BLOCK
      ?auto_19999 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19995 ?auto_19996 ) ) ( not ( = ?auto_19995 ?auto_19997 ) ) ( not ( = ?auto_19995 ?auto_19998 ) ) ( not ( = ?auto_19995 ?auto_19999 ) ) ( not ( = ?auto_19996 ?auto_19997 ) ) ( not ( = ?auto_19996 ?auto_19998 ) ) ( not ( = ?auto_19996 ?auto_19999 ) ) ( not ( = ?auto_19997 ?auto_19998 ) ) ( not ( = ?auto_19997 ?auto_19999 ) ) ( not ( = ?auto_19998 ?auto_19999 ) ) ( ON-TABLE ?auto_19999 ) ( ON ?auto_19998 ?auto_19999 ) ( ON ?auto_19997 ?auto_19998 ) ( ON ?auto_19996 ?auto_19997 ) ( CLEAR ?auto_19996 ) ( HOLDING ?auto_19995 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_19995 )
      ( MAKE-5PILE ?auto_19995 ?auto_19996 ?auto_19997 ?auto_19998 ?auto_19999 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_20000 - BLOCK
      ?auto_20001 - BLOCK
      ?auto_20002 - BLOCK
      ?auto_20003 - BLOCK
      ?auto_20004 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20000 ?auto_20001 ) ) ( not ( = ?auto_20000 ?auto_20002 ) ) ( not ( = ?auto_20000 ?auto_20003 ) ) ( not ( = ?auto_20000 ?auto_20004 ) ) ( not ( = ?auto_20001 ?auto_20002 ) ) ( not ( = ?auto_20001 ?auto_20003 ) ) ( not ( = ?auto_20001 ?auto_20004 ) ) ( not ( = ?auto_20002 ?auto_20003 ) ) ( not ( = ?auto_20002 ?auto_20004 ) ) ( not ( = ?auto_20003 ?auto_20004 ) ) ( ON-TABLE ?auto_20004 ) ( ON ?auto_20003 ?auto_20004 ) ( ON ?auto_20002 ?auto_20003 ) ( ON ?auto_20001 ?auto_20002 ) ( ON ?auto_20000 ?auto_20001 ) ( CLEAR ?auto_20000 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_20004 ?auto_20003 ?auto_20002 ?auto_20001 )
      ( MAKE-5PILE ?auto_20000 ?auto_20001 ?auto_20002 ?auto_20003 ?auto_20004 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_20005 - BLOCK
      ?auto_20006 - BLOCK
      ?auto_20007 - BLOCK
      ?auto_20008 - BLOCK
      ?auto_20009 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20005 ?auto_20006 ) ) ( not ( = ?auto_20005 ?auto_20007 ) ) ( not ( = ?auto_20005 ?auto_20008 ) ) ( not ( = ?auto_20005 ?auto_20009 ) ) ( not ( = ?auto_20006 ?auto_20007 ) ) ( not ( = ?auto_20006 ?auto_20008 ) ) ( not ( = ?auto_20006 ?auto_20009 ) ) ( not ( = ?auto_20007 ?auto_20008 ) ) ( not ( = ?auto_20007 ?auto_20009 ) ) ( not ( = ?auto_20008 ?auto_20009 ) ) ( ON-TABLE ?auto_20009 ) ( ON ?auto_20008 ?auto_20009 ) ( ON ?auto_20007 ?auto_20008 ) ( ON ?auto_20006 ?auto_20007 ) ( HOLDING ?auto_20005 ) ( CLEAR ?auto_20006 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_20009 ?auto_20008 ?auto_20007 ?auto_20006 ?auto_20005 )
      ( MAKE-5PILE ?auto_20005 ?auto_20006 ?auto_20007 ?auto_20008 ?auto_20009 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_20010 - BLOCK
      ?auto_20011 - BLOCK
      ?auto_20012 - BLOCK
      ?auto_20013 - BLOCK
      ?auto_20014 - BLOCK
    )
    :vars
    (
      ?auto_20015 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20010 ?auto_20011 ) ) ( not ( = ?auto_20010 ?auto_20012 ) ) ( not ( = ?auto_20010 ?auto_20013 ) ) ( not ( = ?auto_20010 ?auto_20014 ) ) ( not ( = ?auto_20011 ?auto_20012 ) ) ( not ( = ?auto_20011 ?auto_20013 ) ) ( not ( = ?auto_20011 ?auto_20014 ) ) ( not ( = ?auto_20012 ?auto_20013 ) ) ( not ( = ?auto_20012 ?auto_20014 ) ) ( not ( = ?auto_20013 ?auto_20014 ) ) ( ON-TABLE ?auto_20014 ) ( ON ?auto_20013 ?auto_20014 ) ( ON ?auto_20012 ?auto_20013 ) ( ON ?auto_20011 ?auto_20012 ) ( CLEAR ?auto_20011 ) ( ON ?auto_20010 ?auto_20015 ) ( CLEAR ?auto_20010 ) ( HAND-EMPTY ) ( not ( = ?auto_20010 ?auto_20015 ) ) ( not ( = ?auto_20011 ?auto_20015 ) ) ( not ( = ?auto_20012 ?auto_20015 ) ) ( not ( = ?auto_20013 ?auto_20015 ) ) ( not ( = ?auto_20014 ?auto_20015 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_20010 ?auto_20015 )
      ( MAKE-5PILE ?auto_20010 ?auto_20011 ?auto_20012 ?auto_20013 ?auto_20014 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_20016 - BLOCK
      ?auto_20017 - BLOCK
      ?auto_20018 - BLOCK
      ?auto_20019 - BLOCK
      ?auto_20020 - BLOCK
    )
    :vars
    (
      ?auto_20021 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20016 ?auto_20017 ) ) ( not ( = ?auto_20016 ?auto_20018 ) ) ( not ( = ?auto_20016 ?auto_20019 ) ) ( not ( = ?auto_20016 ?auto_20020 ) ) ( not ( = ?auto_20017 ?auto_20018 ) ) ( not ( = ?auto_20017 ?auto_20019 ) ) ( not ( = ?auto_20017 ?auto_20020 ) ) ( not ( = ?auto_20018 ?auto_20019 ) ) ( not ( = ?auto_20018 ?auto_20020 ) ) ( not ( = ?auto_20019 ?auto_20020 ) ) ( ON-TABLE ?auto_20020 ) ( ON ?auto_20019 ?auto_20020 ) ( ON ?auto_20018 ?auto_20019 ) ( ON ?auto_20016 ?auto_20021 ) ( CLEAR ?auto_20016 ) ( not ( = ?auto_20016 ?auto_20021 ) ) ( not ( = ?auto_20017 ?auto_20021 ) ) ( not ( = ?auto_20018 ?auto_20021 ) ) ( not ( = ?auto_20019 ?auto_20021 ) ) ( not ( = ?auto_20020 ?auto_20021 ) ) ( HOLDING ?auto_20017 ) ( CLEAR ?auto_20018 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_20020 ?auto_20019 ?auto_20018 ?auto_20017 )
      ( MAKE-5PILE ?auto_20016 ?auto_20017 ?auto_20018 ?auto_20019 ?auto_20020 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_20022 - BLOCK
      ?auto_20023 - BLOCK
      ?auto_20024 - BLOCK
      ?auto_20025 - BLOCK
      ?auto_20026 - BLOCK
    )
    :vars
    (
      ?auto_20027 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20022 ?auto_20023 ) ) ( not ( = ?auto_20022 ?auto_20024 ) ) ( not ( = ?auto_20022 ?auto_20025 ) ) ( not ( = ?auto_20022 ?auto_20026 ) ) ( not ( = ?auto_20023 ?auto_20024 ) ) ( not ( = ?auto_20023 ?auto_20025 ) ) ( not ( = ?auto_20023 ?auto_20026 ) ) ( not ( = ?auto_20024 ?auto_20025 ) ) ( not ( = ?auto_20024 ?auto_20026 ) ) ( not ( = ?auto_20025 ?auto_20026 ) ) ( ON-TABLE ?auto_20026 ) ( ON ?auto_20025 ?auto_20026 ) ( ON ?auto_20024 ?auto_20025 ) ( ON ?auto_20022 ?auto_20027 ) ( not ( = ?auto_20022 ?auto_20027 ) ) ( not ( = ?auto_20023 ?auto_20027 ) ) ( not ( = ?auto_20024 ?auto_20027 ) ) ( not ( = ?auto_20025 ?auto_20027 ) ) ( not ( = ?auto_20026 ?auto_20027 ) ) ( CLEAR ?auto_20024 ) ( ON ?auto_20023 ?auto_20022 ) ( CLEAR ?auto_20023 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_20027 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_20027 ?auto_20022 )
      ( MAKE-5PILE ?auto_20022 ?auto_20023 ?auto_20024 ?auto_20025 ?auto_20026 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_20028 - BLOCK
      ?auto_20029 - BLOCK
      ?auto_20030 - BLOCK
      ?auto_20031 - BLOCK
      ?auto_20032 - BLOCK
    )
    :vars
    (
      ?auto_20033 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20028 ?auto_20029 ) ) ( not ( = ?auto_20028 ?auto_20030 ) ) ( not ( = ?auto_20028 ?auto_20031 ) ) ( not ( = ?auto_20028 ?auto_20032 ) ) ( not ( = ?auto_20029 ?auto_20030 ) ) ( not ( = ?auto_20029 ?auto_20031 ) ) ( not ( = ?auto_20029 ?auto_20032 ) ) ( not ( = ?auto_20030 ?auto_20031 ) ) ( not ( = ?auto_20030 ?auto_20032 ) ) ( not ( = ?auto_20031 ?auto_20032 ) ) ( ON-TABLE ?auto_20032 ) ( ON ?auto_20031 ?auto_20032 ) ( ON ?auto_20028 ?auto_20033 ) ( not ( = ?auto_20028 ?auto_20033 ) ) ( not ( = ?auto_20029 ?auto_20033 ) ) ( not ( = ?auto_20030 ?auto_20033 ) ) ( not ( = ?auto_20031 ?auto_20033 ) ) ( not ( = ?auto_20032 ?auto_20033 ) ) ( ON ?auto_20029 ?auto_20028 ) ( CLEAR ?auto_20029 ) ( ON-TABLE ?auto_20033 ) ( HOLDING ?auto_20030 ) ( CLEAR ?auto_20031 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_20032 ?auto_20031 ?auto_20030 )
      ( MAKE-5PILE ?auto_20028 ?auto_20029 ?auto_20030 ?auto_20031 ?auto_20032 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_20034 - BLOCK
      ?auto_20035 - BLOCK
      ?auto_20036 - BLOCK
      ?auto_20037 - BLOCK
      ?auto_20038 - BLOCK
    )
    :vars
    (
      ?auto_20039 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20034 ?auto_20035 ) ) ( not ( = ?auto_20034 ?auto_20036 ) ) ( not ( = ?auto_20034 ?auto_20037 ) ) ( not ( = ?auto_20034 ?auto_20038 ) ) ( not ( = ?auto_20035 ?auto_20036 ) ) ( not ( = ?auto_20035 ?auto_20037 ) ) ( not ( = ?auto_20035 ?auto_20038 ) ) ( not ( = ?auto_20036 ?auto_20037 ) ) ( not ( = ?auto_20036 ?auto_20038 ) ) ( not ( = ?auto_20037 ?auto_20038 ) ) ( ON-TABLE ?auto_20038 ) ( ON ?auto_20037 ?auto_20038 ) ( ON ?auto_20034 ?auto_20039 ) ( not ( = ?auto_20034 ?auto_20039 ) ) ( not ( = ?auto_20035 ?auto_20039 ) ) ( not ( = ?auto_20036 ?auto_20039 ) ) ( not ( = ?auto_20037 ?auto_20039 ) ) ( not ( = ?auto_20038 ?auto_20039 ) ) ( ON ?auto_20035 ?auto_20034 ) ( ON-TABLE ?auto_20039 ) ( CLEAR ?auto_20037 ) ( ON ?auto_20036 ?auto_20035 ) ( CLEAR ?auto_20036 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_20039 ?auto_20034 ?auto_20035 )
      ( MAKE-5PILE ?auto_20034 ?auto_20035 ?auto_20036 ?auto_20037 ?auto_20038 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_20040 - BLOCK
      ?auto_20041 - BLOCK
      ?auto_20042 - BLOCK
      ?auto_20043 - BLOCK
      ?auto_20044 - BLOCK
    )
    :vars
    (
      ?auto_20045 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20040 ?auto_20041 ) ) ( not ( = ?auto_20040 ?auto_20042 ) ) ( not ( = ?auto_20040 ?auto_20043 ) ) ( not ( = ?auto_20040 ?auto_20044 ) ) ( not ( = ?auto_20041 ?auto_20042 ) ) ( not ( = ?auto_20041 ?auto_20043 ) ) ( not ( = ?auto_20041 ?auto_20044 ) ) ( not ( = ?auto_20042 ?auto_20043 ) ) ( not ( = ?auto_20042 ?auto_20044 ) ) ( not ( = ?auto_20043 ?auto_20044 ) ) ( ON-TABLE ?auto_20044 ) ( ON ?auto_20040 ?auto_20045 ) ( not ( = ?auto_20040 ?auto_20045 ) ) ( not ( = ?auto_20041 ?auto_20045 ) ) ( not ( = ?auto_20042 ?auto_20045 ) ) ( not ( = ?auto_20043 ?auto_20045 ) ) ( not ( = ?auto_20044 ?auto_20045 ) ) ( ON ?auto_20041 ?auto_20040 ) ( ON-TABLE ?auto_20045 ) ( ON ?auto_20042 ?auto_20041 ) ( CLEAR ?auto_20042 ) ( HOLDING ?auto_20043 ) ( CLEAR ?auto_20044 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_20044 ?auto_20043 )
      ( MAKE-5PILE ?auto_20040 ?auto_20041 ?auto_20042 ?auto_20043 ?auto_20044 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_20046 - BLOCK
      ?auto_20047 - BLOCK
      ?auto_20048 - BLOCK
      ?auto_20049 - BLOCK
      ?auto_20050 - BLOCK
    )
    :vars
    (
      ?auto_20051 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20046 ?auto_20047 ) ) ( not ( = ?auto_20046 ?auto_20048 ) ) ( not ( = ?auto_20046 ?auto_20049 ) ) ( not ( = ?auto_20046 ?auto_20050 ) ) ( not ( = ?auto_20047 ?auto_20048 ) ) ( not ( = ?auto_20047 ?auto_20049 ) ) ( not ( = ?auto_20047 ?auto_20050 ) ) ( not ( = ?auto_20048 ?auto_20049 ) ) ( not ( = ?auto_20048 ?auto_20050 ) ) ( not ( = ?auto_20049 ?auto_20050 ) ) ( ON-TABLE ?auto_20050 ) ( ON ?auto_20046 ?auto_20051 ) ( not ( = ?auto_20046 ?auto_20051 ) ) ( not ( = ?auto_20047 ?auto_20051 ) ) ( not ( = ?auto_20048 ?auto_20051 ) ) ( not ( = ?auto_20049 ?auto_20051 ) ) ( not ( = ?auto_20050 ?auto_20051 ) ) ( ON ?auto_20047 ?auto_20046 ) ( ON-TABLE ?auto_20051 ) ( ON ?auto_20048 ?auto_20047 ) ( CLEAR ?auto_20050 ) ( ON ?auto_20049 ?auto_20048 ) ( CLEAR ?auto_20049 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_20051 ?auto_20046 ?auto_20047 ?auto_20048 )
      ( MAKE-5PILE ?auto_20046 ?auto_20047 ?auto_20048 ?auto_20049 ?auto_20050 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_20052 - BLOCK
      ?auto_20053 - BLOCK
      ?auto_20054 - BLOCK
      ?auto_20055 - BLOCK
      ?auto_20056 - BLOCK
    )
    :vars
    (
      ?auto_20057 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20052 ?auto_20053 ) ) ( not ( = ?auto_20052 ?auto_20054 ) ) ( not ( = ?auto_20052 ?auto_20055 ) ) ( not ( = ?auto_20052 ?auto_20056 ) ) ( not ( = ?auto_20053 ?auto_20054 ) ) ( not ( = ?auto_20053 ?auto_20055 ) ) ( not ( = ?auto_20053 ?auto_20056 ) ) ( not ( = ?auto_20054 ?auto_20055 ) ) ( not ( = ?auto_20054 ?auto_20056 ) ) ( not ( = ?auto_20055 ?auto_20056 ) ) ( ON ?auto_20052 ?auto_20057 ) ( not ( = ?auto_20052 ?auto_20057 ) ) ( not ( = ?auto_20053 ?auto_20057 ) ) ( not ( = ?auto_20054 ?auto_20057 ) ) ( not ( = ?auto_20055 ?auto_20057 ) ) ( not ( = ?auto_20056 ?auto_20057 ) ) ( ON ?auto_20053 ?auto_20052 ) ( ON-TABLE ?auto_20057 ) ( ON ?auto_20054 ?auto_20053 ) ( ON ?auto_20055 ?auto_20054 ) ( CLEAR ?auto_20055 ) ( HOLDING ?auto_20056 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_20056 )
      ( MAKE-5PILE ?auto_20052 ?auto_20053 ?auto_20054 ?auto_20055 ?auto_20056 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_20058 - BLOCK
      ?auto_20059 - BLOCK
      ?auto_20060 - BLOCK
      ?auto_20061 - BLOCK
      ?auto_20062 - BLOCK
    )
    :vars
    (
      ?auto_20063 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20058 ?auto_20059 ) ) ( not ( = ?auto_20058 ?auto_20060 ) ) ( not ( = ?auto_20058 ?auto_20061 ) ) ( not ( = ?auto_20058 ?auto_20062 ) ) ( not ( = ?auto_20059 ?auto_20060 ) ) ( not ( = ?auto_20059 ?auto_20061 ) ) ( not ( = ?auto_20059 ?auto_20062 ) ) ( not ( = ?auto_20060 ?auto_20061 ) ) ( not ( = ?auto_20060 ?auto_20062 ) ) ( not ( = ?auto_20061 ?auto_20062 ) ) ( ON ?auto_20058 ?auto_20063 ) ( not ( = ?auto_20058 ?auto_20063 ) ) ( not ( = ?auto_20059 ?auto_20063 ) ) ( not ( = ?auto_20060 ?auto_20063 ) ) ( not ( = ?auto_20061 ?auto_20063 ) ) ( not ( = ?auto_20062 ?auto_20063 ) ) ( ON ?auto_20059 ?auto_20058 ) ( ON-TABLE ?auto_20063 ) ( ON ?auto_20060 ?auto_20059 ) ( ON ?auto_20061 ?auto_20060 ) ( ON ?auto_20062 ?auto_20061 ) ( CLEAR ?auto_20062 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_20063 ?auto_20058 ?auto_20059 ?auto_20060 ?auto_20061 )
      ( MAKE-5PILE ?auto_20058 ?auto_20059 ?auto_20060 ?auto_20061 ?auto_20062 ) )
  )

)

