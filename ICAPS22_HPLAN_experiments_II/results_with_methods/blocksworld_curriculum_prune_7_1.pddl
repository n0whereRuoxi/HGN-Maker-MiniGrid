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
      ?auto_18925 - BLOCK
    )
    :vars
    (
      ?auto_18926 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18925 ?auto_18926 ) ( CLEAR ?auto_18925 ) ( HAND-EMPTY ) ( not ( = ?auto_18925 ?auto_18926 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_18925 ?auto_18926 )
      ( !PUTDOWN ?auto_18925 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_18932 - BLOCK
      ?auto_18933 - BLOCK
    )
    :vars
    (
      ?auto_18934 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_18932 ) ( ON ?auto_18933 ?auto_18934 ) ( CLEAR ?auto_18933 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_18932 ) ( not ( = ?auto_18932 ?auto_18933 ) ) ( not ( = ?auto_18932 ?auto_18934 ) ) ( not ( = ?auto_18933 ?auto_18934 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_18933 ?auto_18934 )
      ( !STACK ?auto_18933 ?auto_18932 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_18942 - BLOCK
      ?auto_18943 - BLOCK
    )
    :vars
    (
      ?auto_18944 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18943 ?auto_18944 ) ( not ( = ?auto_18942 ?auto_18943 ) ) ( not ( = ?auto_18942 ?auto_18944 ) ) ( not ( = ?auto_18943 ?auto_18944 ) ) ( ON ?auto_18942 ?auto_18943 ) ( CLEAR ?auto_18942 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_18942 )
      ( MAKE-2PILE ?auto_18942 ?auto_18943 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_18953 - BLOCK
      ?auto_18954 - BLOCK
      ?auto_18955 - BLOCK
    )
    :vars
    (
      ?auto_18956 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_18954 ) ( ON ?auto_18955 ?auto_18956 ) ( CLEAR ?auto_18955 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_18953 ) ( ON ?auto_18954 ?auto_18953 ) ( not ( = ?auto_18953 ?auto_18954 ) ) ( not ( = ?auto_18953 ?auto_18955 ) ) ( not ( = ?auto_18953 ?auto_18956 ) ) ( not ( = ?auto_18954 ?auto_18955 ) ) ( not ( = ?auto_18954 ?auto_18956 ) ) ( not ( = ?auto_18955 ?auto_18956 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_18955 ?auto_18956 )
      ( !STACK ?auto_18955 ?auto_18954 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_18967 - BLOCK
      ?auto_18968 - BLOCK
      ?auto_18969 - BLOCK
    )
    :vars
    (
      ?auto_18970 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18969 ?auto_18970 ) ( ON-TABLE ?auto_18967 ) ( not ( = ?auto_18967 ?auto_18968 ) ) ( not ( = ?auto_18967 ?auto_18969 ) ) ( not ( = ?auto_18967 ?auto_18970 ) ) ( not ( = ?auto_18968 ?auto_18969 ) ) ( not ( = ?auto_18968 ?auto_18970 ) ) ( not ( = ?auto_18969 ?auto_18970 ) ) ( CLEAR ?auto_18967 ) ( ON ?auto_18968 ?auto_18969 ) ( CLEAR ?auto_18968 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_18967 ?auto_18968 )
      ( MAKE-3PILE ?auto_18967 ?auto_18968 ?auto_18969 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_18981 - BLOCK
      ?auto_18982 - BLOCK
      ?auto_18983 - BLOCK
    )
    :vars
    (
      ?auto_18984 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18983 ?auto_18984 ) ( not ( = ?auto_18981 ?auto_18982 ) ) ( not ( = ?auto_18981 ?auto_18983 ) ) ( not ( = ?auto_18981 ?auto_18984 ) ) ( not ( = ?auto_18982 ?auto_18983 ) ) ( not ( = ?auto_18982 ?auto_18984 ) ) ( not ( = ?auto_18983 ?auto_18984 ) ) ( ON ?auto_18982 ?auto_18983 ) ( ON ?auto_18981 ?auto_18982 ) ( CLEAR ?auto_18981 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_18981 )
      ( MAKE-3PILE ?auto_18981 ?auto_18982 ?auto_18983 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_18996 - BLOCK
      ?auto_18997 - BLOCK
      ?auto_18998 - BLOCK
      ?auto_18999 - BLOCK
    )
    :vars
    (
      ?auto_19000 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_18998 ) ( ON ?auto_18999 ?auto_19000 ) ( CLEAR ?auto_18999 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_18996 ) ( ON ?auto_18997 ?auto_18996 ) ( ON ?auto_18998 ?auto_18997 ) ( not ( = ?auto_18996 ?auto_18997 ) ) ( not ( = ?auto_18996 ?auto_18998 ) ) ( not ( = ?auto_18996 ?auto_18999 ) ) ( not ( = ?auto_18996 ?auto_19000 ) ) ( not ( = ?auto_18997 ?auto_18998 ) ) ( not ( = ?auto_18997 ?auto_18999 ) ) ( not ( = ?auto_18997 ?auto_19000 ) ) ( not ( = ?auto_18998 ?auto_18999 ) ) ( not ( = ?auto_18998 ?auto_19000 ) ) ( not ( = ?auto_18999 ?auto_19000 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_18999 ?auto_19000 )
      ( !STACK ?auto_18999 ?auto_18998 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_19014 - BLOCK
      ?auto_19015 - BLOCK
      ?auto_19016 - BLOCK
      ?auto_19017 - BLOCK
    )
    :vars
    (
      ?auto_19018 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19017 ?auto_19018 ) ( ON-TABLE ?auto_19014 ) ( ON ?auto_19015 ?auto_19014 ) ( not ( = ?auto_19014 ?auto_19015 ) ) ( not ( = ?auto_19014 ?auto_19016 ) ) ( not ( = ?auto_19014 ?auto_19017 ) ) ( not ( = ?auto_19014 ?auto_19018 ) ) ( not ( = ?auto_19015 ?auto_19016 ) ) ( not ( = ?auto_19015 ?auto_19017 ) ) ( not ( = ?auto_19015 ?auto_19018 ) ) ( not ( = ?auto_19016 ?auto_19017 ) ) ( not ( = ?auto_19016 ?auto_19018 ) ) ( not ( = ?auto_19017 ?auto_19018 ) ) ( CLEAR ?auto_19015 ) ( ON ?auto_19016 ?auto_19017 ) ( CLEAR ?auto_19016 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_19014 ?auto_19015 ?auto_19016 )
      ( MAKE-4PILE ?auto_19014 ?auto_19015 ?auto_19016 ?auto_19017 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_19032 - BLOCK
      ?auto_19033 - BLOCK
      ?auto_19034 - BLOCK
      ?auto_19035 - BLOCK
    )
    :vars
    (
      ?auto_19036 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19035 ?auto_19036 ) ( ON-TABLE ?auto_19032 ) ( not ( = ?auto_19032 ?auto_19033 ) ) ( not ( = ?auto_19032 ?auto_19034 ) ) ( not ( = ?auto_19032 ?auto_19035 ) ) ( not ( = ?auto_19032 ?auto_19036 ) ) ( not ( = ?auto_19033 ?auto_19034 ) ) ( not ( = ?auto_19033 ?auto_19035 ) ) ( not ( = ?auto_19033 ?auto_19036 ) ) ( not ( = ?auto_19034 ?auto_19035 ) ) ( not ( = ?auto_19034 ?auto_19036 ) ) ( not ( = ?auto_19035 ?auto_19036 ) ) ( ON ?auto_19034 ?auto_19035 ) ( CLEAR ?auto_19032 ) ( ON ?auto_19033 ?auto_19034 ) ( CLEAR ?auto_19033 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_19032 ?auto_19033 )
      ( MAKE-4PILE ?auto_19032 ?auto_19033 ?auto_19034 ?auto_19035 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_19050 - BLOCK
      ?auto_19051 - BLOCK
      ?auto_19052 - BLOCK
      ?auto_19053 - BLOCK
    )
    :vars
    (
      ?auto_19054 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19053 ?auto_19054 ) ( not ( = ?auto_19050 ?auto_19051 ) ) ( not ( = ?auto_19050 ?auto_19052 ) ) ( not ( = ?auto_19050 ?auto_19053 ) ) ( not ( = ?auto_19050 ?auto_19054 ) ) ( not ( = ?auto_19051 ?auto_19052 ) ) ( not ( = ?auto_19051 ?auto_19053 ) ) ( not ( = ?auto_19051 ?auto_19054 ) ) ( not ( = ?auto_19052 ?auto_19053 ) ) ( not ( = ?auto_19052 ?auto_19054 ) ) ( not ( = ?auto_19053 ?auto_19054 ) ) ( ON ?auto_19052 ?auto_19053 ) ( ON ?auto_19051 ?auto_19052 ) ( ON ?auto_19050 ?auto_19051 ) ( CLEAR ?auto_19050 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_19050 )
      ( MAKE-4PILE ?auto_19050 ?auto_19051 ?auto_19052 ?auto_19053 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_19069 - BLOCK
      ?auto_19070 - BLOCK
      ?auto_19071 - BLOCK
      ?auto_19072 - BLOCK
      ?auto_19073 - BLOCK
    )
    :vars
    (
      ?auto_19074 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_19072 ) ( ON ?auto_19073 ?auto_19074 ) ( CLEAR ?auto_19073 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_19069 ) ( ON ?auto_19070 ?auto_19069 ) ( ON ?auto_19071 ?auto_19070 ) ( ON ?auto_19072 ?auto_19071 ) ( not ( = ?auto_19069 ?auto_19070 ) ) ( not ( = ?auto_19069 ?auto_19071 ) ) ( not ( = ?auto_19069 ?auto_19072 ) ) ( not ( = ?auto_19069 ?auto_19073 ) ) ( not ( = ?auto_19069 ?auto_19074 ) ) ( not ( = ?auto_19070 ?auto_19071 ) ) ( not ( = ?auto_19070 ?auto_19072 ) ) ( not ( = ?auto_19070 ?auto_19073 ) ) ( not ( = ?auto_19070 ?auto_19074 ) ) ( not ( = ?auto_19071 ?auto_19072 ) ) ( not ( = ?auto_19071 ?auto_19073 ) ) ( not ( = ?auto_19071 ?auto_19074 ) ) ( not ( = ?auto_19072 ?auto_19073 ) ) ( not ( = ?auto_19072 ?auto_19074 ) ) ( not ( = ?auto_19073 ?auto_19074 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_19073 ?auto_19074 )
      ( !STACK ?auto_19073 ?auto_19072 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_19091 - BLOCK
      ?auto_19092 - BLOCK
      ?auto_19093 - BLOCK
      ?auto_19094 - BLOCK
      ?auto_19095 - BLOCK
    )
    :vars
    (
      ?auto_19096 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19095 ?auto_19096 ) ( ON-TABLE ?auto_19091 ) ( ON ?auto_19092 ?auto_19091 ) ( ON ?auto_19093 ?auto_19092 ) ( not ( = ?auto_19091 ?auto_19092 ) ) ( not ( = ?auto_19091 ?auto_19093 ) ) ( not ( = ?auto_19091 ?auto_19094 ) ) ( not ( = ?auto_19091 ?auto_19095 ) ) ( not ( = ?auto_19091 ?auto_19096 ) ) ( not ( = ?auto_19092 ?auto_19093 ) ) ( not ( = ?auto_19092 ?auto_19094 ) ) ( not ( = ?auto_19092 ?auto_19095 ) ) ( not ( = ?auto_19092 ?auto_19096 ) ) ( not ( = ?auto_19093 ?auto_19094 ) ) ( not ( = ?auto_19093 ?auto_19095 ) ) ( not ( = ?auto_19093 ?auto_19096 ) ) ( not ( = ?auto_19094 ?auto_19095 ) ) ( not ( = ?auto_19094 ?auto_19096 ) ) ( not ( = ?auto_19095 ?auto_19096 ) ) ( CLEAR ?auto_19093 ) ( ON ?auto_19094 ?auto_19095 ) ( CLEAR ?auto_19094 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_19091 ?auto_19092 ?auto_19093 ?auto_19094 )
      ( MAKE-5PILE ?auto_19091 ?auto_19092 ?auto_19093 ?auto_19094 ?auto_19095 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_19113 - BLOCK
      ?auto_19114 - BLOCK
      ?auto_19115 - BLOCK
      ?auto_19116 - BLOCK
      ?auto_19117 - BLOCK
    )
    :vars
    (
      ?auto_19118 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19117 ?auto_19118 ) ( ON-TABLE ?auto_19113 ) ( ON ?auto_19114 ?auto_19113 ) ( not ( = ?auto_19113 ?auto_19114 ) ) ( not ( = ?auto_19113 ?auto_19115 ) ) ( not ( = ?auto_19113 ?auto_19116 ) ) ( not ( = ?auto_19113 ?auto_19117 ) ) ( not ( = ?auto_19113 ?auto_19118 ) ) ( not ( = ?auto_19114 ?auto_19115 ) ) ( not ( = ?auto_19114 ?auto_19116 ) ) ( not ( = ?auto_19114 ?auto_19117 ) ) ( not ( = ?auto_19114 ?auto_19118 ) ) ( not ( = ?auto_19115 ?auto_19116 ) ) ( not ( = ?auto_19115 ?auto_19117 ) ) ( not ( = ?auto_19115 ?auto_19118 ) ) ( not ( = ?auto_19116 ?auto_19117 ) ) ( not ( = ?auto_19116 ?auto_19118 ) ) ( not ( = ?auto_19117 ?auto_19118 ) ) ( ON ?auto_19116 ?auto_19117 ) ( CLEAR ?auto_19114 ) ( ON ?auto_19115 ?auto_19116 ) ( CLEAR ?auto_19115 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_19113 ?auto_19114 ?auto_19115 )
      ( MAKE-5PILE ?auto_19113 ?auto_19114 ?auto_19115 ?auto_19116 ?auto_19117 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_19135 - BLOCK
      ?auto_19136 - BLOCK
      ?auto_19137 - BLOCK
      ?auto_19138 - BLOCK
      ?auto_19139 - BLOCK
    )
    :vars
    (
      ?auto_19140 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19139 ?auto_19140 ) ( ON-TABLE ?auto_19135 ) ( not ( = ?auto_19135 ?auto_19136 ) ) ( not ( = ?auto_19135 ?auto_19137 ) ) ( not ( = ?auto_19135 ?auto_19138 ) ) ( not ( = ?auto_19135 ?auto_19139 ) ) ( not ( = ?auto_19135 ?auto_19140 ) ) ( not ( = ?auto_19136 ?auto_19137 ) ) ( not ( = ?auto_19136 ?auto_19138 ) ) ( not ( = ?auto_19136 ?auto_19139 ) ) ( not ( = ?auto_19136 ?auto_19140 ) ) ( not ( = ?auto_19137 ?auto_19138 ) ) ( not ( = ?auto_19137 ?auto_19139 ) ) ( not ( = ?auto_19137 ?auto_19140 ) ) ( not ( = ?auto_19138 ?auto_19139 ) ) ( not ( = ?auto_19138 ?auto_19140 ) ) ( not ( = ?auto_19139 ?auto_19140 ) ) ( ON ?auto_19138 ?auto_19139 ) ( ON ?auto_19137 ?auto_19138 ) ( CLEAR ?auto_19135 ) ( ON ?auto_19136 ?auto_19137 ) ( CLEAR ?auto_19136 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_19135 ?auto_19136 )
      ( MAKE-5PILE ?auto_19135 ?auto_19136 ?auto_19137 ?auto_19138 ?auto_19139 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_19157 - BLOCK
      ?auto_19158 - BLOCK
      ?auto_19159 - BLOCK
      ?auto_19160 - BLOCK
      ?auto_19161 - BLOCK
    )
    :vars
    (
      ?auto_19162 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19161 ?auto_19162 ) ( not ( = ?auto_19157 ?auto_19158 ) ) ( not ( = ?auto_19157 ?auto_19159 ) ) ( not ( = ?auto_19157 ?auto_19160 ) ) ( not ( = ?auto_19157 ?auto_19161 ) ) ( not ( = ?auto_19157 ?auto_19162 ) ) ( not ( = ?auto_19158 ?auto_19159 ) ) ( not ( = ?auto_19158 ?auto_19160 ) ) ( not ( = ?auto_19158 ?auto_19161 ) ) ( not ( = ?auto_19158 ?auto_19162 ) ) ( not ( = ?auto_19159 ?auto_19160 ) ) ( not ( = ?auto_19159 ?auto_19161 ) ) ( not ( = ?auto_19159 ?auto_19162 ) ) ( not ( = ?auto_19160 ?auto_19161 ) ) ( not ( = ?auto_19160 ?auto_19162 ) ) ( not ( = ?auto_19161 ?auto_19162 ) ) ( ON ?auto_19160 ?auto_19161 ) ( ON ?auto_19159 ?auto_19160 ) ( ON ?auto_19158 ?auto_19159 ) ( ON ?auto_19157 ?auto_19158 ) ( CLEAR ?auto_19157 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_19157 )
      ( MAKE-5PILE ?auto_19157 ?auto_19158 ?auto_19159 ?auto_19160 ?auto_19161 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_19180 - BLOCK
      ?auto_19181 - BLOCK
      ?auto_19182 - BLOCK
      ?auto_19183 - BLOCK
      ?auto_19184 - BLOCK
      ?auto_19185 - BLOCK
    )
    :vars
    (
      ?auto_19186 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_19184 ) ( ON ?auto_19185 ?auto_19186 ) ( CLEAR ?auto_19185 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_19180 ) ( ON ?auto_19181 ?auto_19180 ) ( ON ?auto_19182 ?auto_19181 ) ( ON ?auto_19183 ?auto_19182 ) ( ON ?auto_19184 ?auto_19183 ) ( not ( = ?auto_19180 ?auto_19181 ) ) ( not ( = ?auto_19180 ?auto_19182 ) ) ( not ( = ?auto_19180 ?auto_19183 ) ) ( not ( = ?auto_19180 ?auto_19184 ) ) ( not ( = ?auto_19180 ?auto_19185 ) ) ( not ( = ?auto_19180 ?auto_19186 ) ) ( not ( = ?auto_19181 ?auto_19182 ) ) ( not ( = ?auto_19181 ?auto_19183 ) ) ( not ( = ?auto_19181 ?auto_19184 ) ) ( not ( = ?auto_19181 ?auto_19185 ) ) ( not ( = ?auto_19181 ?auto_19186 ) ) ( not ( = ?auto_19182 ?auto_19183 ) ) ( not ( = ?auto_19182 ?auto_19184 ) ) ( not ( = ?auto_19182 ?auto_19185 ) ) ( not ( = ?auto_19182 ?auto_19186 ) ) ( not ( = ?auto_19183 ?auto_19184 ) ) ( not ( = ?auto_19183 ?auto_19185 ) ) ( not ( = ?auto_19183 ?auto_19186 ) ) ( not ( = ?auto_19184 ?auto_19185 ) ) ( not ( = ?auto_19184 ?auto_19186 ) ) ( not ( = ?auto_19185 ?auto_19186 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_19185 ?auto_19186 )
      ( !STACK ?auto_19185 ?auto_19184 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_19206 - BLOCK
      ?auto_19207 - BLOCK
      ?auto_19208 - BLOCK
      ?auto_19209 - BLOCK
      ?auto_19210 - BLOCK
      ?auto_19211 - BLOCK
    )
    :vars
    (
      ?auto_19212 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19211 ?auto_19212 ) ( ON-TABLE ?auto_19206 ) ( ON ?auto_19207 ?auto_19206 ) ( ON ?auto_19208 ?auto_19207 ) ( ON ?auto_19209 ?auto_19208 ) ( not ( = ?auto_19206 ?auto_19207 ) ) ( not ( = ?auto_19206 ?auto_19208 ) ) ( not ( = ?auto_19206 ?auto_19209 ) ) ( not ( = ?auto_19206 ?auto_19210 ) ) ( not ( = ?auto_19206 ?auto_19211 ) ) ( not ( = ?auto_19206 ?auto_19212 ) ) ( not ( = ?auto_19207 ?auto_19208 ) ) ( not ( = ?auto_19207 ?auto_19209 ) ) ( not ( = ?auto_19207 ?auto_19210 ) ) ( not ( = ?auto_19207 ?auto_19211 ) ) ( not ( = ?auto_19207 ?auto_19212 ) ) ( not ( = ?auto_19208 ?auto_19209 ) ) ( not ( = ?auto_19208 ?auto_19210 ) ) ( not ( = ?auto_19208 ?auto_19211 ) ) ( not ( = ?auto_19208 ?auto_19212 ) ) ( not ( = ?auto_19209 ?auto_19210 ) ) ( not ( = ?auto_19209 ?auto_19211 ) ) ( not ( = ?auto_19209 ?auto_19212 ) ) ( not ( = ?auto_19210 ?auto_19211 ) ) ( not ( = ?auto_19210 ?auto_19212 ) ) ( not ( = ?auto_19211 ?auto_19212 ) ) ( CLEAR ?auto_19209 ) ( ON ?auto_19210 ?auto_19211 ) ( CLEAR ?auto_19210 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_19206 ?auto_19207 ?auto_19208 ?auto_19209 ?auto_19210 )
      ( MAKE-6PILE ?auto_19206 ?auto_19207 ?auto_19208 ?auto_19209 ?auto_19210 ?auto_19211 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_19232 - BLOCK
      ?auto_19233 - BLOCK
      ?auto_19234 - BLOCK
      ?auto_19235 - BLOCK
      ?auto_19236 - BLOCK
      ?auto_19237 - BLOCK
    )
    :vars
    (
      ?auto_19238 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19237 ?auto_19238 ) ( ON-TABLE ?auto_19232 ) ( ON ?auto_19233 ?auto_19232 ) ( ON ?auto_19234 ?auto_19233 ) ( not ( = ?auto_19232 ?auto_19233 ) ) ( not ( = ?auto_19232 ?auto_19234 ) ) ( not ( = ?auto_19232 ?auto_19235 ) ) ( not ( = ?auto_19232 ?auto_19236 ) ) ( not ( = ?auto_19232 ?auto_19237 ) ) ( not ( = ?auto_19232 ?auto_19238 ) ) ( not ( = ?auto_19233 ?auto_19234 ) ) ( not ( = ?auto_19233 ?auto_19235 ) ) ( not ( = ?auto_19233 ?auto_19236 ) ) ( not ( = ?auto_19233 ?auto_19237 ) ) ( not ( = ?auto_19233 ?auto_19238 ) ) ( not ( = ?auto_19234 ?auto_19235 ) ) ( not ( = ?auto_19234 ?auto_19236 ) ) ( not ( = ?auto_19234 ?auto_19237 ) ) ( not ( = ?auto_19234 ?auto_19238 ) ) ( not ( = ?auto_19235 ?auto_19236 ) ) ( not ( = ?auto_19235 ?auto_19237 ) ) ( not ( = ?auto_19235 ?auto_19238 ) ) ( not ( = ?auto_19236 ?auto_19237 ) ) ( not ( = ?auto_19236 ?auto_19238 ) ) ( not ( = ?auto_19237 ?auto_19238 ) ) ( ON ?auto_19236 ?auto_19237 ) ( CLEAR ?auto_19234 ) ( ON ?auto_19235 ?auto_19236 ) ( CLEAR ?auto_19235 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_19232 ?auto_19233 ?auto_19234 ?auto_19235 )
      ( MAKE-6PILE ?auto_19232 ?auto_19233 ?auto_19234 ?auto_19235 ?auto_19236 ?auto_19237 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_19258 - BLOCK
      ?auto_19259 - BLOCK
      ?auto_19260 - BLOCK
      ?auto_19261 - BLOCK
      ?auto_19262 - BLOCK
      ?auto_19263 - BLOCK
    )
    :vars
    (
      ?auto_19264 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19263 ?auto_19264 ) ( ON-TABLE ?auto_19258 ) ( ON ?auto_19259 ?auto_19258 ) ( not ( = ?auto_19258 ?auto_19259 ) ) ( not ( = ?auto_19258 ?auto_19260 ) ) ( not ( = ?auto_19258 ?auto_19261 ) ) ( not ( = ?auto_19258 ?auto_19262 ) ) ( not ( = ?auto_19258 ?auto_19263 ) ) ( not ( = ?auto_19258 ?auto_19264 ) ) ( not ( = ?auto_19259 ?auto_19260 ) ) ( not ( = ?auto_19259 ?auto_19261 ) ) ( not ( = ?auto_19259 ?auto_19262 ) ) ( not ( = ?auto_19259 ?auto_19263 ) ) ( not ( = ?auto_19259 ?auto_19264 ) ) ( not ( = ?auto_19260 ?auto_19261 ) ) ( not ( = ?auto_19260 ?auto_19262 ) ) ( not ( = ?auto_19260 ?auto_19263 ) ) ( not ( = ?auto_19260 ?auto_19264 ) ) ( not ( = ?auto_19261 ?auto_19262 ) ) ( not ( = ?auto_19261 ?auto_19263 ) ) ( not ( = ?auto_19261 ?auto_19264 ) ) ( not ( = ?auto_19262 ?auto_19263 ) ) ( not ( = ?auto_19262 ?auto_19264 ) ) ( not ( = ?auto_19263 ?auto_19264 ) ) ( ON ?auto_19262 ?auto_19263 ) ( ON ?auto_19261 ?auto_19262 ) ( CLEAR ?auto_19259 ) ( ON ?auto_19260 ?auto_19261 ) ( CLEAR ?auto_19260 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_19258 ?auto_19259 ?auto_19260 )
      ( MAKE-6PILE ?auto_19258 ?auto_19259 ?auto_19260 ?auto_19261 ?auto_19262 ?auto_19263 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_19284 - BLOCK
      ?auto_19285 - BLOCK
      ?auto_19286 - BLOCK
      ?auto_19287 - BLOCK
      ?auto_19288 - BLOCK
      ?auto_19289 - BLOCK
    )
    :vars
    (
      ?auto_19290 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19289 ?auto_19290 ) ( ON-TABLE ?auto_19284 ) ( not ( = ?auto_19284 ?auto_19285 ) ) ( not ( = ?auto_19284 ?auto_19286 ) ) ( not ( = ?auto_19284 ?auto_19287 ) ) ( not ( = ?auto_19284 ?auto_19288 ) ) ( not ( = ?auto_19284 ?auto_19289 ) ) ( not ( = ?auto_19284 ?auto_19290 ) ) ( not ( = ?auto_19285 ?auto_19286 ) ) ( not ( = ?auto_19285 ?auto_19287 ) ) ( not ( = ?auto_19285 ?auto_19288 ) ) ( not ( = ?auto_19285 ?auto_19289 ) ) ( not ( = ?auto_19285 ?auto_19290 ) ) ( not ( = ?auto_19286 ?auto_19287 ) ) ( not ( = ?auto_19286 ?auto_19288 ) ) ( not ( = ?auto_19286 ?auto_19289 ) ) ( not ( = ?auto_19286 ?auto_19290 ) ) ( not ( = ?auto_19287 ?auto_19288 ) ) ( not ( = ?auto_19287 ?auto_19289 ) ) ( not ( = ?auto_19287 ?auto_19290 ) ) ( not ( = ?auto_19288 ?auto_19289 ) ) ( not ( = ?auto_19288 ?auto_19290 ) ) ( not ( = ?auto_19289 ?auto_19290 ) ) ( ON ?auto_19288 ?auto_19289 ) ( ON ?auto_19287 ?auto_19288 ) ( ON ?auto_19286 ?auto_19287 ) ( CLEAR ?auto_19284 ) ( ON ?auto_19285 ?auto_19286 ) ( CLEAR ?auto_19285 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_19284 ?auto_19285 )
      ( MAKE-6PILE ?auto_19284 ?auto_19285 ?auto_19286 ?auto_19287 ?auto_19288 ?auto_19289 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_19310 - BLOCK
      ?auto_19311 - BLOCK
      ?auto_19312 - BLOCK
      ?auto_19313 - BLOCK
      ?auto_19314 - BLOCK
      ?auto_19315 - BLOCK
    )
    :vars
    (
      ?auto_19316 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19315 ?auto_19316 ) ( not ( = ?auto_19310 ?auto_19311 ) ) ( not ( = ?auto_19310 ?auto_19312 ) ) ( not ( = ?auto_19310 ?auto_19313 ) ) ( not ( = ?auto_19310 ?auto_19314 ) ) ( not ( = ?auto_19310 ?auto_19315 ) ) ( not ( = ?auto_19310 ?auto_19316 ) ) ( not ( = ?auto_19311 ?auto_19312 ) ) ( not ( = ?auto_19311 ?auto_19313 ) ) ( not ( = ?auto_19311 ?auto_19314 ) ) ( not ( = ?auto_19311 ?auto_19315 ) ) ( not ( = ?auto_19311 ?auto_19316 ) ) ( not ( = ?auto_19312 ?auto_19313 ) ) ( not ( = ?auto_19312 ?auto_19314 ) ) ( not ( = ?auto_19312 ?auto_19315 ) ) ( not ( = ?auto_19312 ?auto_19316 ) ) ( not ( = ?auto_19313 ?auto_19314 ) ) ( not ( = ?auto_19313 ?auto_19315 ) ) ( not ( = ?auto_19313 ?auto_19316 ) ) ( not ( = ?auto_19314 ?auto_19315 ) ) ( not ( = ?auto_19314 ?auto_19316 ) ) ( not ( = ?auto_19315 ?auto_19316 ) ) ( ON ?auto_19314 ?auto_19315 ) ( ON ?auto_19313 ?auto_19314 ) ( ON ?auto_19312 ?auto_19313 ) ( ON ?auto_19311 ?auto_19312 ) ( ON ?auto_19310 ?auto_19311 ) ( CLEAR ?auto_19310 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_19310 )
      ( MAKE-6PILE ?auto_19310 ?auto_19311 ?auto_19312 ?auto_19313 ?auto_19314 ?auto_19315 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_19337 - BLOCK
      ?auto_19338 - BLOCK
      ?auto_19339 - BLOCK
      ?auto_19340 - BLOCK
      ?auto_19341 - BLOCK
      ?auto_19342 - BLOCK
      ?auto_19343 - BLOCK
    )
    :vars
    (
      ?auto_19344 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_19342 ) ( ON ?auto_19343 ?auto_19344 ) ( CLEAR ?auto_19343 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_19337 ) ( ON ?auto_19338 ?auto_19337 ) ( ON ?auto_19339 ?auto_19338 ) ( ON ?auto_19340 ?auto_19339 ) ( ON ?auto_19341 ?auto_19340 ) ( ON ?auto_19342 ?auto_19341 ) ( not ( = ?auto_19337 ?auto_19338 ) ) ( not ( = ?auto_19337 ?auto_19339 ) ) ( not ( = ?auto_19337 ?auto_19340 ) ) ( not ( = ?auto_19337 ?auto_19341 ) ) ( not ( = ?auto_19337 ?auto_19342 ) ) ( not ( = ?auto_19337 ?auto_19343 ) ) ( not ( = ?auto_19337 ?auto_19344 ) ) ( not ( = ?auto_19338 ?auto_19339 ) ) ( not ( = ?auto_19338 ?auto_19340 ) ) ( not ( = ?auto_19338 ?auto_19341 ) ) ( not ( = ?auto_19338 ?auto_19342 ) ) ( not ( = ?auto_19338 ?auto_19343 ) ) ( not ( = ?auto_19338 ?auto_19344 ) ) ( not ( = ?auto_19339 ?auto_19340 ) ) ( not ( = ?auto_19339 ?auto_19341 ) ) ( not ( = ?auto_19339 ?auto_19342 ) ) ( not ( = ?auto_19339 ?auto_19343 ) ) ( not ( = ?auto_19339 ?auto_19344 ) ) ( not ( = ?auto_19340 ?auto_19341 ) ) ( not ( = ?auto_19340 ?auto_19342 ) ) ( not ( = ?auto_19340 ?auto_19343 ) ) ( not ( = ?auto_19340 ?auto_19344 ) ) ( not ( = ?auto_19341 ?auto_19342 ) ) ( not ( = ?auto_19341 ?auto_19343 ) ) ( not ( = ?auto_19341 ?auto_19344 ) ) ( not ( = ?auto_19342 ?auto_19343 ) ) ( not ( = ?auto_19342 ?auto_19344 ) ) ( not ( = ?auto_19343 ?auto_19344 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_19343 ?auto_19344 )
      ( !STACK ?auto_19343 ?auto_19342 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_19352 - BLOCK
      ?auto_19353 - BLOCK
      ?auto_19354 - BLOCK
      ?auto_19355 - BLOCK
      ?auto_19356 - BLOCK
      ?auto_19357 - BLOCK
      ?auto_19358 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_19357 ) ( ON-TABLE ?auto_19358 ) ( CLEAR ?auto_19358 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_19352 ) ( ON ?auto_19353 ?auto_19352 ) ( ON ?auto_19354 ?auto_19353 ) ( ON ?auto_19355 ?auto_19354 ) ( ON ?auto_19356 ?auto_19355 ) ( ON ?auto_19357 ?auto_19356 ) ( not ( = ?auto_19352 ?auto_19353 ) ) ( not ( = ?auto_19352 ?auto_19354 ) ) ( not ( = ?auto_19352 ?auto_19355 ) ) ( not ( = ?auto_19352 ?auto_19356 ) ) ( not ( = ?auto_19352 ?auto_19357 ) ) ( not ( = ?auto_19352 ?auto_19358 ) ) ( not ( = ?auto_19353 ?auto_19354 ) ) ( not ( = ?auto_19353 ?auto_19355 ) ) ( not ( = ?auto_19353 ?auto_19356 ) ) ( not ( = ?auto_19353 ?auto_19357 ) ) ( not ( = ?auto_19353 ?auto_19358 ) ) ( not ( = ?auto_19354 ?auto_19355 ) ) ( not ( = ?auto_19354 ?auto_19356 ) ) ( not ( = ?auto_19354 ?auto_19357 ) ) ( not ( = ?auto_19354 ?auto_19358 ) ) ( not ( = ?auto_19355 ?auto_19356 ) ) ( not ( = ?auto_19355 ?auto_19357 ) ) ( not ( = ?auto_19355 ?auto_19358 ) ) ( not ( = ?auto_19356 ?auto_19357 ) ) ( not ( = ?auto_19356 ?auto_19358 ) ) ( not ( = ?auto_19357 ?auto_19358 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_19358 )
      ( !STACK ?auto_19358 ?auto_19357 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_19366 - BLOCK
      ?auto_19367 - BLOCK
      ?auto_19368 - BLOCK
      ?auto_19369 - BLOCK
      ?auto_19370 - BLOCK
      ?auto_19371 - BLOCK
      ?auto_19372 - BLOCK
    )
    :vars
    (
      ?auto_19373 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19372 ?auto_19373 ) ( ON-TABLE ?auto_19366 ) ( ON ?auto_19367 ?auto_19366 ) ( ON ?auto_19368 ?auto_19367 ) ( ON ?auto_19369 ?auto_19368 ) ( ON ?auto_19370 ?auto_19369 ) ( not ( = ?auto_19366 ?auto_19367 ) ) ( not ( = ?auto_19366 ?auto_19368 ) ) ( not ( = ?auto_19366 ?auto_19369 ) ) ( not ( = ?auto_19366 ?auto_19370 ) ) ( not ( = ?auto_19366 ?auto_19371 ) ) ( not ( = ?auto_19366 ?auto_19372 ) ) ( not ( = ?auto_19366 ?auto_19373 ) ) ( not ( = ?auto_19367 ?auto_19368 ) ) ( not ( = ?auto_19367 ?auto_19369 ) ) ( not ( = ?auto_19367 ?auto_19370 ) ) ( not ( = ?auto_19367 ?auto_19371 ) ) ( not ( = ?auto_19367 ?auto_19372 ) ) ( not ( = ?auto_19367 ?auto_19373 ) ) ( not ( = ?auto_19368 ?auto_19369 ) ) ( not ( = ?auto_19368 ?auto_19370 ) ) ( not ( = ?auto_19368 ?auto_19371 ) ) ( not ( = ?auto_19368 ?auto_19372 ) ) ( not ( = ?auto_19368 ?auto_19373 ) ) ( not ( = ?auto_19369 ?auto_19370 ) ) ( not ( = ?auto_19369 ?auto_19371 ) ) ( not ( = ?auto_19369 ?auto_19372 ) ) ( not ( = ?auto_19369 ?auto_19373 ) ) ( not ( = ?auto_19370 ?auto_19371 ) ) ( not ( = ?auto_19370 ?auto_19372 ) ) ( not ( = ?auto_19370 ?auto_19373 ) ) ( not ( = ?auto_19371 ?auto_19372 ) ) ( not ( = ?auto_19371 ?auto_19373 ) ) ( not ( = ?auto_19372 ?auto_19373 ) ) ( CLEAR ?auto_19370 ) ( ON ?auto_19371 ?auto_19372 ) ( CLEAR ?auto_19371 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_19366 ?auto_19367 ?auto_19368 ?auto_19369 ?auto_19370 ?auto_19371 )
      ( MAKE-7PILE ?auto_19366 ?auto_19367 ?auto_19368 ?auto_19369 ?auto_19370 ?auto_19371 ?auto_19372 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_19381 - BLOCK
      ?auto_19382 - BLOCK
      ?auto_19383 - BLOCK
      ?auto_19384 - BLOCK
      ?auto_19385 - BLOCK
      ?auto_19386 - BLOCK
      ?auto_19387 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_19387 ) ( ON-TABLE ?auto_19381 ) ( ON ?auto_19382 ?auto_19381 ) ( ON ?auto_19383 ?auto_19382 ) ( ON ?auto_19384 ?auto_19383 ) ( ON ?auto_19385 ?auto_19384 ) ( not ( = ?auto_19381 ?auto_19382 ) ) ( not ( = ?auto_19381 ?auto_19383 ) ) ( not ( = ?auto_19381 ?auto_19384 ) ) ( not ( = ?auto_19381 ?auto_19385 ) ) ( not ( = ?auto_19381 ?auto_19386 ) ) ( not ( = ?auto_19381 ?auto_19387 ) ) ( not ( = ?auto_19382 ?auto_19383 ) ) ( not ( = ?auto_19382 ?auto_19384 ) ) ( not ( = ?auto_19382 ?auto_19385 ) ) ( not ( = ?auto_19382 ?auto_19386 ) ) ( not ( = ?auto_19382 ?auto_19387 ) ) ( not ( = ?auto_19383 ?auto_19384 ) ) ( not ( = ?auto_19383 ?auto_19385 ) ) ( not ( = ?auto_19383 ?auto_19386 ) ) ( not ( = ?auto_19383 ?auto_19387 ) ) ( not ( = ?auto_19384 ?auto_19385 ) ) ( not ( = ?auto_19384 ?auto_19386 ) ) ( not ( = ?auto_19384 ?auto_19387 ) ) ( not ( = ?auto_19385 ?auto_19386 ) ) ( not ( = ?auto_19385 ?auto_19387 ) ) ( not ( = ?auto_19386 ?auto_19387 ) ) ( CLEAR ?auto_19385 ) ( ON ?auto_19386 ?auto_19387 ) ( CLEAR ?auto_19386 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_19381 ?auto_19382 ?auto_19383 ?auto_19384 ?auto_19385 ?auto_19386 )
      ( MAKE-7PILE ?auto_19381 ?auto_19382 ?auto_19383 ?auto_19384 ?auto_19385 ?auto_19386 ?auto_19387 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_19395 - BLOCK
      ?auto_19396 - BLOCK
      ?auto_19397 - BLOCK
      ?auto_19398 - BLOCK
      ?auto_19399 - BLOCK
      ?auto_19400 - BLOCK
      ?auto_19401 - BLOCK
    )
    :vars
    (
      ?auto_19402 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19401 ?auto_19402 ) ( ON-TABLE ?auto_19395 ) ( ON ?auto_19396 ?auto_19395 ) ( ON ?auto_19397 ?auto_19396 ) ( ON ?auto_19398 ?auto_19397 ) ( not ( = ?auto_19395 ?auto_19396 ) ) ( not ( = ?auto_19395 ?auto_19397 ) ) ( not ( = ?auto_19395 ?auto_19398 ) ) ( not ( = ?auto_19395 ?auto_19399 ) ) ( not ( = ?auto_19395 ?auto_19400 ) ) ( not ( = ?auto_19395 ?auto_19401 ) ) ( not ( = ?auto_19395 ?auto_19402 ) ) ( not ( = ?auto_19396 ?auto_19397 ) ) ( not ( = ?auto_19396 ?auto_19398 ) ) ( not ( = ?auto_19396 ?auto_19399 ) ) ( not ( = ?auto_19396 ?auto_19400 ) ) ( not ( = ?auto_19396 ?auto_19401 ) ) ( not ( = ?auto_19396 ?auto_19402 ) ) ( not ( = ?auto_19397 ?auto_19398 ) ) ( not ( = ?auto_19397 ?auto_19399 ) ) ( not ( = ?auto_19397 ?auto_19400 ) ) ( not ( = ?auto_19397 ?auto_19401 ) ) ( not ( = ?auto_19397 ?auto_19402 ) ) ( not ( = ?auto_19398 ?auto_19399 ) ) ( not ( = ?auto_19398 ?auto_19400 ) ) ( not ( = ?auto_19398 ?auto_19401 ) ) ( not ( = ?auto_19398 ?auto_19402 ) ) ( not ( = ?auto_19399 ?auto_19400 ) ) ( not ( = ?auto_19399 ?auto_19401 ) ) ( not ( = ?auto_19399 ?auto_19402 ) ) ( not ( = ?auto_19400 ?auto_19401 ) ) ( not ( = ?auto_19400 ?auto_19402 ) ) ( not ( = ?auto_19401 ?auto_19402 ) ) ( ON ?auto_19400 ?auto_19401 ) ( CLEAR ?auto_19398 ) ( ON ?auto_19399 ?auto_19400 ) ( CLEAR ?auto_19399 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_19395 ?auto_19396 ?auto_19397 ?auto_19398 ?auto_19399 )
      ( MAKE-7PILE ?auto_19395 ?auto_19396 ?auto_19397 ?auto_19398 ?auto_19399 ?auto_19400 ?auto_19401 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_19410 - BLOCK
      ?auto_19411 - BLOCK
      ?auto_19412 - BLOCK
      ?auto_19413 - BLOCK
      ?auto_19414 - BLOCK
      ?auto_19415 - BLOCK
      ?auto_19416 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_19416 ) ( ON-TABLE ?auto_19410 ) ( ON ?auto_19411 ?auto_19410 ) ( ON ?auto_19412 ?auto_19411 ) ( ON ?auto_19413 ?auto_19412 ) ( not ( = ?auto_19410 ?auto_19411 ) ) ( not ( = ?auto_19410 ?auto_19412 ) ) ( not ( = ?auto_19410 ?auto_19413 ) ) ( not ( = ?auto_19410 ?auto_19414 ) ) ( not ( = ?auto_19410 ?auto_19415 ) ) ( not ( = ?auto_19410 ?auto_19416 ) ) ( not ( = ?auto_19411 ?auto_19412 ) ) ( not ( = ?auto_19411 ?auto_19413 ) ) ( not ( = ?auto_19411 ?auto_19414 ) ) ( not ( = ?auto_19411 ?auto_19415 ) ) ( not ( = ?auto_19411 ?auto_19416 ) ) ( not ( = ?auto_19412 ?auto_19413 ) ) ( not ( = ?auto_19412 ?auto_19414 ) ) ( not ( = ?auto_19412 ?auto_19415 ) ) ( not ( = ?auto_19412 ?auto_19416 ) ) ( not ( = ?auto_19413 ?auto_19414 ) ) ( not ( = ?auto_19413 ?auto_19415 ) ) ( not ( = ?auto_19413 ?auto_19416 ) ) ( not ( = ?auto_19414 ?auto_19415 ) ) ( not ( = ?auto_19414 ?auto_19416 ) ) ( not ( = ?auto_19415 ?auto_19416 ) ) ( ON ?auto_19415 ?auto_19416 ) ( CLEAR ?auto_19413 ) ( ON ?auto_19414 ?auto_19415 ) ( CLEAR ?auto_19414 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_19410 ?auto_19411 ?auto_19412 ?auto_19413 ?auto_19414 )
      ( MAKE-7PILE ?auto_19410 ?auto_19411 ?auto_19412 ?auto_19413 ?auto_19414 ?auto_19415 ?auto_19416 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_19424 - BLOCK
      ?auto_19425 - BLOCK
      ?auto_19426 - BLOCK
      ?auto_19427 - BLOCK
      ?auto_19428 - BLOCK
      ?auto_19429 - BLOCK
      ?auto_19430 - BLOCK
    )
    :vars
    (
      ?auto_19431 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19430 ?auto_19431 ) ( ON-TABLE ?auto_19424 ) ( ON ?auto_19425 ?auto_19424 ) ( ON ?auto_19426 ?auto_19425 ) ( not ( = ?auto_19424 ?auto_19425 ) ) ( not ( = ?auto_19424 ?auto_19426 ) ) ( not ( = ?auto_19424 ?auto_19427 ) ) ( not ( = ?auto_19424 ?auto_19428 ) ) ( not ( = ?auto_19424 ?auto_19429 ) ) ( not ( = ?auto_19424 ?auto_19430 ) ) ( not ( = ?auto_19424 ?auto_19431 ) ) ( not ( = ?auto_19425 ?auto_19426 ) ) ( not ( = ?auto_19425 ?auto_19427 ) ) ( not ( = ?auto_19425 ?auto_19428 ) ) ( not ( = ?auto_19425 ?auto_19429 ) ) ( not ( = ?auto_19425 ?auto_19430 ) ) ( not ( = ?auto_19425 ?auto_19431 ) ) ( not ( = ?auto_19426 ?auto_19427 ) ) ( not ( = ?auto_19426 ?auto_19428 ) ) ( not ( = ?auto_19426 ?auto_19429 ) ) ( not ( = ?auto_19426 ?auto_19430 ) ) ( not ( = ?auto_19426 ?auto_19431 ) ) ( not ( = ?auto_19427 ?auto_19428 ) ) ( not ( = ?auto_19427 ?auto_19429 ) ) ( not ( = ?auto_19427 ?auto_19430 ) ) ( not ( = ?auto_19427 ?auto_19431 ) ) ( not ( = ?auto_19428 ?auto_19429 ) ) ( not ( = ?auto_19428 ?auto_19430 ) ) ( not ( = ?auto_19428 ?auto_19431 ) ) ( not ( = ?auto_19429 ?auto_19430 ) ) ( not ( = ?auto_19429 ?auto_19431 ) ) ( not ( = ?auto_19430 ?auto_19431 ) ) ( ON ?auto_19429 ?auto_19430 ) ( ON ?auto_19428 ?auto_19429 ) ( CLEAR ?auto_19426 ) ( ON ?auto_19427 ?auto_19428 ) ( CLEAR ?auto_19427 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_19424 ?auto_19425 ?auto_19426 ?auto_19427 )
      ( MAKE-7PILE ?auto_19424 ?auto_19425 ?auto_19426 ?auto_19427 ?auto_19428 ?auto_19429 ?auto_19430 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_19439 - BLOCK
      ?auto_19440 - BLOCK
      ?auto_19441 - BLOCK
      ?auto_19442 - BLOCK
      ?auto_19443 - BLOCK
      ?auto_19444 - BLOCK
      ?auto_19445 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_19445 ) ( ON-TABLE ?auto_19439 ) ( ON ?auto_19440 ?auto_19439 ) ( ON ?auto_19441 ?auto_19440 ) ( not ( = ?auto_19439 ?auto_19440 ) ) ( not ( = ?auto_19439 ?auto_19441 ) ) ( not ( = ?auto_19439 ?auto_19442 ) ) ( not ( = ?auto_19439 ?auto_19443 ) ) ( not ( = ?auto_19439 ?auto_19444 ) ) ( not ( = ?auto_19439 ?auto_19445 ) ) ( not ( = ?auto_19440 ?auto_19441 ) ) ( not ( = ?auto_19440 ?auto_19442 ) ) ( not ( = ?auto_19440 ?auto_19443 ) ) ( not ( = ?auto_19440 ?auto_19444 ) ) ( not ( = ?auto_19440 ?auto_19445 ) ) ( not ( = ?auto_19441 ?auto_19442 ) ) ( not ( = ?auto_19441 ?auto_19443 ) ) ( not ( = ?auto_19441 ?auto_19444 ) ) ( not ( = ?auto_19441 ?auto_19445 ) ) ( not ( = ?auto_19442 ?auto_19443 ) ) ( not ( = ?auto_19442 ?auto_19444 ) ) ( not ( = ?auto_19442 ?auto_19445 ) ) ( not ( = ?auto_19443 ?auto_19444 ) ) ( not ( = ?auto_19443 ?auto_19445 ) ) ( not ( = ?auto_19444 ?auto_19445 ) ) ( ON ?auto_19444 ?auto_19445 ) ( ON ?auto_19443 ?auto_19444 ) ( CLEAR ?auto_19441 ) ( ON ?auto_19442 ?auto_19443 ) ( CLEAR ?auto_19442 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_19439 ?auto_19440 ?auto_19441 ?auto_19442 )
      ( MAKE-7PILE ?auto_19439 ?auto_19440 ?auto_19441 ?auto_19442 ?auto_19443 ?auto_19444 ?auto_19445 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_19453 - BLOCK
      ?auto_19454 - BLOCK
      ?auto_19455 - BLOCK
      ?auto_19456 - BLOCK
      ?auto_19457 - BLOCK
      ?auto_19458 - BLOCK
      ?auto_19459 - BLOCK
    )
    :vars
    (
      ?auto_19460 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19459 ?auto_19460 ) ( ON-TABLE ?auto_19453 ) ( ON ?auto_19454 ?auto_19453 ) ( not ( = ?auto_19453 ?auto_19454 ) ) ( not ( = ?auto_19453 ?auto_19455 ) ) ( not ( = ?auto_19453 ?auto_19456 ) ) ( not ( = ?auto_19453 ?auto_19457 ) ) ( not ( = ?auto_19453 ?auto_19458 ) ) ( not ( = ?auto_19453 ?auto_19459 ) ) ( not ( = ?auto_19453 ?auto_19460 ) ) ( not ( = ?auto_19454 ?auto_19455 ) ) ( not ( = ?auto_19454 ?auto_19456 ) ) ( not ( = ?auto_19454 ?auto_19457 ) ) ( not ( = ?auto_19454 ?auto_19458 ) ) ( not ( = ?auto_19454 ?auto_19459 ) ) ( not ( = ?auto_19454 ?auto_19460 ) ) ( not ( = ?auto_19455 ?auto_19456 ) ) ( not ( = ?auto_19455 ?auto_19457 ) ) ( not ( = ?auto_19455 ?auto_19458 ) ) ( not ( = ?auto_19455 ?auto_19459 ) ) ( not ( = ?auto_19455 ?auto_19460 ) ) ( not ( = ?auto_19456 ?auto_19457 ) ) ( not ( = ?auto_19456 ?auto_19458 ) ) ( not ( = ?auto_19456 ?auto_19459 ) ) ( not ( = ?auto_19456 ?auto_19460 ) ) ( not ( = ?auto_19457 ?auto_19458 ) ) ( not ( = ?auto_19457 ?auto_19459 ) ) ( not ( = ?auto_19457 ?auto_19460 ) ) ( not ( = ?auto_19458 ?auto_19459 ) ) ( not ( = ?auto_19458 ?auto_19460 ) ) ( not ( = ?auto_19459 ?auto_19460 ) ) ( ON ?auto_19458 ?auto_19459 ) ( ON ?auto_19457 ?auto_19458 ) ( ON ?auto_19456 ?auto_19457 ) ( CLEAR ?auto_19454 ) ( ON ?auto_19455 ?auto_19456 ) ( CLEAR ?auto_19455 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_19453 ?auto_19454 ?auto_19455 )
      ( MAKE-7PILE ?auto_19453 ?auto_19454 ?auto_19455 ?auto_19456 ?auto_19457 ?auto_19458 ?auto_19459 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_19468 - BLOCK
      ?auto_19469 - BLOCK
      ?auto_19470 - BLOCK
      ?auto_19471 - BLOCK
      ?auto_19472 - BLOCK
      ?auto_19473 - BLOCK
      ?auto_19474 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_19474 ) ( ON-TABLE ?auto_19468 ) ( ON ?auto_19469 ?auto_19468 ) ( not ( = ?auto_19468 ?auto_19469 ) ) ( not ( = ?auto_19468 ?auto_19470 ) ) ( not ( = ?auto_19468 ?auto_19471 ) ) ( not ( = ?auto_19468 ?auto_19472 ) ) ( not ( = ?auto_19468 ?auto_19473 ) ) ( not ( = ?auto_19468 ?auto_19474 ) ) ( not ( = ?auto_19469 ?auto_19470 ) ) ( not ( = ?auto_19469 ?auto_19471 ) ) ( not ( = ?auto_19469 ?auto_19472 ) ) ( not ( = ?auto_19469 ?auto_19473 ) ) ( not ( = ?auto_19469 ?auto_19474 ) ) ( not ( = ?auto_19470 ?auto_19471 ) ) ( not ( = ?auto_19470 ?auto_19472 ) ) ( not ( = ?auto_19470 ?auto_19473 ) ) ( not ( = ?auto_19470 ?auto_19474 ) ) ( not ( = ?auto_19471 ?auto_19472 ) ) ( not ( = ?auto_19471 ?auto_19473 ) ) ( not ( = ?auto_19471 ?auto_19474 ) ) ( not ( = ?auto_19472 ?auto_19473 ) ) ( not ( = ?auto_19472 ?auto_19474 ) ) ( not ( = ?auto_19473 ?auto_19474 ) ) ( ON ?auto_19473 ?auto_19474 ) ( ON ?auto_19472 ?auto_19473 ) ( ON ?auto_19471 ?auto_19472 ) ( CLEAR ?auto_19469 ) ( ON ?auto_19470 ?auto_19471 ) ( CLEAR ?auto_19470 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_19468 ?auto_19469 ?auto_19470 )
      ( MAKE-7PILE ?auto_19468 ?auto_19469 ?auto_19470 ?auto_19471 ?auto_19472 ?auto_19473 ?auto_19474 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_19482 - BLOCK
      ?auto_19483 - BLOCK
      ?auto_19484 - BLOCK
      ?auto_19485 - BLOCK
      ?auto_19486 - BLOCK
      ?auto_19487 - BLOCK
      ?auto_19488 - BLOCK
    )
    :vars
    (
      ?auto_19489 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19488 ?auto_19489 ) ( ON-TABLE ?auto_19482 ) ( not ( = ?auto_19482 ?auto_19483 ) ) ( not ( = ?auto_19482 ?auto_19484 ) ) ( not ( = ?auto_19482 ?auto_19485 ) ) ( not ( = ?auto_19482 ?auto_19486 ) ) ( not ( = ?auto_19482 ?auto_19487 ) ) ( not ( = ?auto_19482 ?auto_19488 ) ) ( not ( = ?auto_19482 ?auto_19489 ) ) ( not ( = ?auto_19483 ?auto_19484 ) ) ( not ( = ?auto_19483 ?auto_19485 ) ) ( not ( = ?auto_19483 ?auto_19486 ) ) ( not ( = ?auto_19483 ?auto_19487 ) ) ( not ( = ?auto_19483 ?auto_19488 ) ) ( not ( = ?auto_19483 ?auto_19489 ) ) ( not ( = ?auto_19484 ?auto_19485 ) ) ( not ( = ?auto_19484 ?auto_19486 ) ) ( not ( = ?auto_19484 ?auto_19487 ) ) ( not ( = ?auto_19484 ?auto_19488 ) ) ( not ( = ?auto_19484 ?auto_19489 ) ) ( not ( = ?auto_19485 ?auto_19486 ) ) ( not ( = ?auto_19485 ?auto_19487 ) ) ( not ( = ?auto_19485 ?auto_19488 ) ) ( not ( = ?auto_19485 ?auto_19489 ) ) ( not ( = ?auto_19486 ?auto_19487 ) ) ( not ( = ?auto_19486 ?auto_19488 ) ) ( not ( = ?auto_19486 ?auto_19489 ) ) ( not ( = ?auto_19487 ?auto_19488 ) ) ( not ( = ?auto_19487 ?auto_19489 ) ) ( not ( = ?auto_19488 ?auto_19489 ) ) ( ON ?auto_19487 ?auto_19488 ) ( ON ?auto_19486 ?auto_19487 ) ( ON ?auto_19485 ?auto_19486 ) ( ON ?auto_19484 ?auto_19485 ) ( CLEAR ?auto_19482 ) ( ON ?auto_19483 ?auto_19484 ) ( CLEAR ?auto_19483 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_19482 ?auto_19483 )
      ( MAKE-7PILE ?auto_19482 ?auto_19483 ?auto_19484 ?auto_19485 ?auto_19486 ?auto_19487 ?auto_19488 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_19497 - BLOCK
      ?auto_19498 - BLOCK
      ?auto_19499 - BLOCK
      ?auto_19500 - BLOCK
      ?auto_19501 - BLOCK
      ?auto_19502 - BLOCK
      ?auto_19503 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_19503 ) ( ON-TABLE ?auto_19497 ) ( not ( = ?auto_19497 ?auto_19498 ) ) ( not ( = ?auto_19497 ?auto_19499 ) ) ( not ( = ?auto_19497 ?auto_19500 ) ) ( not ( = ?auto_19497 ?auto_19501 ) ) ( not ( = ?auto_19497 ?auto_19502 ) ) ( not ( = ?auto_19497 ?auto_19503 ) ) ( not ( = ?auto_19498 ?auto_19499 ) ) ( not ( = ?auto_19498 ?auto_19500 ) ) ( not ( = ?auto_19498 ?auto_19501 ) ) ( not ( = ?auto_19498 ?auto_19502 ) ) ( not ( = ?auto_19498 ?auto_19503 ) ) ( not ( = ?auto_19499 ?auto_19500 ) ) ( not ( = ?auto_19499 ?auto_19501 ) ) ( not ( = ?auto_19499 ?auto_19502 ) ) ( not ( = ?auto_19499 ?auto_19503 ) ) ( not ( = ?auto_19500 ?auto_19501 ) ) ( not ( = ?auto_19500 ?auto_19502 ) ) ( not ( = ?auto_19500 ?auto_19503 ) ) ( not ( = ?auto_19501 ?auto_19502 ) ) ( not ( = ?auto_19501 ?auto_19503 ) ) ( not ( = ?auto_19502 ?auto_19503 ) ) ( ON ?auto_19502 ?auto_19503 ) ( ON ?auto_19501 ?auto_19502 ) ( ON ?auto_19500 ?auto_19501 ) ( ON ?auto_19499 ?auto_19500 ) ( CLEAR ?auto_19497 ) ( ON ?auto_19498 ?auto_19499 ) ( CLEAR ?auto_19498 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_19497 ?auto_19498 )
      ( MAKE-7PILE ?auto_19497 ?auto_19498 ?auto_19499 ?auto_19500 ?auto_19501 ?auto_19502 ?auto_19503 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_19511 - BLOCK
      ?auto_19512 - BLOCK
      ?auto_19513 - BLOCK
      ?auto_19514 - BLOCK
      ?auto_19515 - BLOCK
      ?auto_19516 - BLOCK
      ?auto_19517 - BLOCK
    )
    :vars
    (
      ?auto_19518 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_19517 ?auto_19518 ) ( not ( = ?auto_19511 ?auto_19512 ) ) ( not ( = ?auto_19511 ?auto_19513 ) ) ( not ( = ?auto_19511 ?auto_19514 ) ) ( not ( = ?auto_19511 ?auto_19515 ) ) ( not ( = ?auto_19511 ?auto_19516 ) ) ( not ( = ?auto_19511 ?auto_19517 ) ) ( not ( = ?auto_19511 ?auto_19518 ) ) ( not ( = ?auto_19512 ?auto_19513 ) ) ( not ( = ?auto_19512 ?auto_19514 ) ) ( not ( = ?auto_19512 ?auto_19515 ) ) ( not ( = ?auto_19512 ?auto_19516 ) ) ( not ( = ?auto_19512 ?auto_19517 ) ) ( not ( = ?auto_19512 ?auto_19518 ) ) ( not ( = ?auto_19513 ?auto_19514 ) ) ( not ( = ?auto_19513 ?auto_19515 ) ) ( not ( = ?auto_19513 ?auto_19516 ) ) ( not ( = ?auto_19513 ?auto_19517 ) ) ( not ( = ?auto_19513 ?auto_19518 ) ) ( not ( = ?auto_19514 ?auto_19515 ) ) ( not ( = ?auto_19514 ?auto_19516 ) ) ( not ( = ?auto_19514 ?auto_19517 ) ) ( not ( = ?auto_19514 ?auto_19518 ) ) ( not ( = ?auto_19515 ?auto_19516 ) ) ( not ( = ?auto_19515 ?auto_19517 ) ) ( not ( = ?auto_19515 ?auto_19518 ) ) ( not ( = ?auto_19516 ?auto_19517 ) ) ( not ( = ?auto_19516 ?auto_19518 ) ) ( not ( = ?auto_19517 ?auto_19518 ) ) ( ON ?auto_19516 ?auto_19517 ) ( ON ?auto_19515 ?auto_19516 ) ( ON ?auto_19514 ?auto_19515 ) ( ON ?auto_19513 ?auto_19514 ) ( ON ?auto_19512 ?auto_19513 ) ( ON ?auto_19511 ?auto_19512 ) ( CLEAR ?auto_19511 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_19511 )
      ( MAKE-7PILE ?auto_19511 ?auto_19512 ?auto_19513 ?auto_19514 ?auto_19515 ?auto_19516 ?auto_19517 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_19526 - BLOCK
      ?auto_19527 - BLOCK
      ?auto_19528 - BLOCK
      ?auto_19529 - BLOCK
      ?auto_19530 - BLOCK
      ?auto_19531 - BLOCK
      ?auto_19532 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_19532 ) ( not ( = ?auto_19526 ?auto_19527 ) ) ( not ( = ?auto_19526 ?auto_19528 ) ) ( not ( = ?auto_19526 ?auto_19529 ) ) ( not ( = ?auto_19526 ?auto_19530 ) ) ( not ( = ?auto_19526 ?auto_19531 ) ) ( not ( = ?auto_19526 ?auto_19532 ) ) ( not ( = ?auto_19527 ?auto_19528 ) ) ( not ( = ?auto_19527 ?auto_19529 ) ) ( not ( = ?auto_19527 ?auto_19530 ) ) ( not ( = ?auto_19527 ?auto_19531 ) ) ( not ( = ?auto_19527 ?auto_19532 ) ) ( not ( = ?auto_19528 ?auto_19529 ) ) ( not ( = ?auto_19528 ?auto_19530 ) ) ( not ( = ?auto_19528 ?auto_19531 ) ) ( not ( = ?auto_19528 ?auto_19532 ) ) ( not ( = ?auto_19529 ?auto_19530 ) ) ( not ( = ?auto_19529 ?auto_19531 ) ) ( not ( = ?auto_19529 ?auto_19532 ) ) ( not ( = ?auto_19530 ?auto_19531 ) ) ( not ( = ?auto_19530 ?auto_19532 ) ) ( not ( = ?auto_19531 ?auto_19532 ) ) ( ON ?auto_19531 ?auto_19532 ) ( ON ?auto_19530 ?auto_19531 ) ( ON ?auto_19529 ?auto_19530 ) ( ON ?auto_19528 ?auto_19529 ) ( ON ?auto_19527 ?auto_19528 ) ( ON ?auto_19526 ?auto_19527 ) ( CLEAR ?auto_19526 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_19526 )
      ( MAKE-7PILE ?auto_19526 ?auto_19527 ?auto_19528 ?auto_19529 ?auto_19530 ?auto_19531 ?auto_19532 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_19540 - BLOCK
      ?auto_19541 - BLOCK
      ?auto_19542 - BLOCK
      ?auto_19543 - BLOCK
      ?auto_19544 - BLOCK
      ?auto_19545 - BLOCK
      ?auto_19546 - BLOCK
    )
    :vars
    (
      ?auto_19547 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_19540 ?auto_19541 ) ) ( not ( = ?auto_19540 ?auto_19542 ) ) ( not ( = ?auto_19540 ?auto_19543 ) ) ( not ( = ?auto_19540 ?auto_19544 ) ) ( not ( = ?auto_19540 ?auto_19545 ) ) ( not ( = ?auto_19540 ?auto_19546 ) ) ( not ( = ?auto_19541 ?auto_19542 ) ) ( not ( = ?auto_19541 ?auto_19543 ) ) ( not ( = ?auto_19541 ?auto_19544 ) ) ( not ( = ?auto_19541 ?auto_19545 ) ) ( not ( = ?auto_19541 ?auto_19546 ) ) ( not ( = ?auto_19542 ?auto_19543 ) ) ( not ( = ?auto_19542 ?auto_19544 ) ) ( not ( = ?auto_19542 ?auto_19545 ) ) ( not ( = ?auto_19542 ?auto_19546 ) ) ( not ( = ?auto_19543 ?auto_19544 ) ) ( not ( = ?auto_19543 ?auto_19545 ) ) ( not ( = ?auto_19543 ?auto_19546 ) ) ( not ( = ?auto_19544 ?auto_19545 ) ) ( not ( = ?auto_19544 ?auto_19546 ) ) ( not ( = ?auto_19545 ?auto_19546 ) ) ( ON ?auto_19540 ?auto_19547 ) ( not ( = ?auto_19546 ?auto_19547 ) ) ( not ( = ?auto_19545 ?auto_19547 ) ) ( not ( = ?auto_19544 ?auto_19547 ) ) ( not ( = ?auto_19543 ?auto_19547 ) ) ( not ( = ?auto_19542 ?auto_19547 ) ) ( not ( = ?auto_19541 ?auto_19547 ) ) ( not ( = ?auto_19540 ?auto_19547 ) ) ( ON ?auto_19541 ?auto_19540 ) ( ON ?auto_19542 ?auto_19541 ) ( ON ?auto_19543 ?auto_19542 ) ( ON ?auto_19544 ?auto_19543 ) ( ON ?auto_19545 ?auto_19544 ) ( ON ?auto_19546 ?auto_19545 ) ( CLEAR ?auto_19546 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_19546 ?auto_19545 ?auto_19544 ?auto_19543 ?auto_19542 ?auto_19541 ?auto_19540 )
      ( MAKE-7PILE ?auto_19540 ?auto_19541 ?auto_19542 ?auto_19543 ?auto_19544 ?auto_19545 ?auto_19546 ) )
  )

)

