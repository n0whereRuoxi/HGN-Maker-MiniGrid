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
      ?auto_208953 - BLOCK
    )
    :vars
    (
      ?auto_208954 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_208953 ?auto_208954 ) ( CLEAR ?auto_208953 ) ( HAND-EMPTY ) ( not ( = ?auto_208953 ?auto_208954 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_208953 ?auto_208954 )
      ( !PUTDOWN ?auto_208953 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_208960 - BLOCK
      ?auto_208961 - BLOCK
    )
    :vars
    (
      ?auto_208962 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_208960 ) ( ON ?auto_208961 ?auto_208962 ) ( CLEAR ?auto_208961 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_208960 ) ( not ( = ?auto_208960 ?auto_208961 ) ) ( not ( = ?auto_208960 ?auto_208962 ) ) ( not ( = ?auto_208961 ?auto_208962 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_208961 ?auto_208962 )
      ( !STACK ?auto_208961 ?auto_208960 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_208970 - BLOCK
      ?auto_208971 - BLOCK
    )
    :vars
    (
      ?auto_208972 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_208971 ?auto_208972 ) ( not ( = ?auto_208970 ?auto_208971 ) ) ( not ( = ?auto_208970 ?auto_208972 ) ) ( not ( = ?auto_208971 ?auto_208972 ) ) ( ON ?auto_208970 ?auto_208971 ) ( CLEAR ?auto_208970 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_208970 )
      ( MAKE-2PILE ?auto_208970 ?auto_208971 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_208981 - BLOCK
      ?auto_208982 - BLOCK
      ?auto_208983 - BLOCK
    )
    :vars
    (
      ?auto_208984 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_208982 ) ( ON ?auto_208983 ?auto_208984 ) ( CLEAR ?auto_208983 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_208981 ) ( ON ?auto_208982 ?auto_208981 ) ( not ( = ?auto_208981 ?auto_208982 ) ) ( not ( = ?auto_208981 ?auto_208983 ) ) ( not ( = ?auto_208981 ?auto_208984 ) ) ( not ( = ?auto_208982 ?auto_208983 ) ) ( not ( = ?auto_208982 ?auto_208984 ) ) ( not ( = ?auto_208983 ?auto_208984 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_208983 ?auto_208984 )
      ( !STACK ?auto_208983 ?auto_208982 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_208995 - BLOCK
      ?auto_208996 - BLOCK
      ?auto_208997 - BLOCK
    )
    :vars
    (
      ?auto_208998 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_208997 ?auto_208998 ) ( ON-TABLE ?auto_208995 ) ( not ( = ?auto_208995 ?auto_208996 ) ) ( not ( = ?auto_208995 ?auto_208997 ) ) ( not ( = ?auto_208995 ?auto_208998 ) ) ( not ( = ?auto_208996 ?auto_208997 ) ) ( not ( = ?auto_208996 ?auto_208998 ) ) ( not ( = ?auto_208997 ?auto_208998 ) ) ( CLEAR ?auto_208995 ) ( ON ?auto_208996 ?auto_208997 ) ( CLEAR ?auto_208996 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_208995 ?auto_208996 )
      ( MAKE-3PILE ?auto_208995 ?auto_208996 ?auto_208997 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_209009 - BLOCK
      ?auto_209010 - BLOCK
      ?auto_209011 - BLOCK
    )
    :vars
    (
      ?auto_209012 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209011 ?auto_209012 ) ( not ( = ?auto_209009 ?auto_209010 ) ) ( not ( = ?auto_209009 ?auto_209011 ) ) ( not ( = ?auto_209009 ?auto_209012 ) ) ( not ( = ?auto_209010 ?auto_209011 ) ) ( not ( = ?auto_209010 ?auto_209012 ) ) ( not ( = ?auto_209011 ?auto_209012 ) ) ( ON ?auto_209010 ?auto_209011 ) ( ON ?auto_209009 ?auto_209010 ) ( CLEAR ?auto_209009 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_209009 )
      ( MAKE-3PILE ?auto_209009 ?auto_209010 ?auto_209011 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_209024 - BLOCK
      ?auto_209025 - BLOCK
      ?auto_209026 - BLOCK
      ?auto_209027 - BLOCK
    )
    :vars
    (
      ?auto_209028 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_209026 ) ( ON ?auto_209027 ?auto_209028 ) ( CLEAR ?auto_209027 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_209024 ) ( ON ?auto_209025 ?auto_209024 ) ( ON ?auto_209026 ?auto_209025 ) ( not ( = ?auto_209024 ?auto_209025 ) ) ( not ( = ?auto_209024 ?auto_209026 ) ) ( not ( = ?auto_209024 ?auto_209027 ) ) ( not ( = ?auto_209024 ?auto_209028 ) ) ( not ( = ?auto_209025 ?auto_209026 ) ) ( not ( = ?auto_209025 ?auto_209027 ) ) ( not ( = ?auto_209025 ?auto_209028 ) ) ( not ( = ?auto_209026 ?auto_209027 ) ) ( not ( = ?auto_209026 ?auto_209028 ) ) ( not ( = ?auto_209027 ?auto_209028 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_209027 ?auto_209028 )
      ( !STACK ?auto_209027 ?auto_209026 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_209042 - BLOCK
      ?auto_209043 - BLOCK
      ?auto_209044 - BLOCK
      ?auto_209045 - BLOCK
    )
    :vars
    (
      ?auto_209046 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209045 ?auto_209046 ) ( ON-TABLE ?auto_209042 ) ( ON ?auto_209043 ?auto_209042 ) ( not ( = ?auto_209042 ?auto_209043 ) ) ( not ( = ?auto_209042 ?auto_209044 ) ) ( not ( = ?auto_209042 ?auto_209045 ) ) ( not ( = ?auto_209042 ?auto_209046 ) ) ( not ( = ?auto_209043 ?auto_209044 ) ) ( not ( = ?auto_209043 ?auto_209045 ) ) ( not ( = ?auto_209043 ?auto_209046 ) ) ( not ( = ?auto_209044 ?auto_209045 ) ) ( not ( = ?auto_209044 ?auto_209046 ) ) ( not ( = ?auto_209045 ?auto_209046 ) ) ( CLEAR ?auto_209043 ) ( ON ?auto_209044 ?auto_209045 ) ( CLEAR ?auto_209044 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_209042 ?auto_209043 ?auto_209044 )
      ( MAKE-4PILE ?auto_209042 ?auto_209043 ?auto_209044 ?auto_209045 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_209060 - BLOCK
      ?auto_209061 - BLOCK
      ?auto_209062 - BLOCK
      ?auto_209063 - BLOCK
    )
    :vars
    (
      ?auto_209064 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209063 ?auto_209064 ) ( ON-TABLE ?auto_209060 ) ( not ( = ?auto_209060 ?auto_209061 ) ) ( not ( = ?auto_209060 ?auto_209062 ) ) ( not ( = ?auto_209060 ?auto_209063 ) ) ( not ( = ?auto_209060 ?auto_209064 ) ) ( not ( = ?auto_209061 ?auto_209062 ) ) ( not ( = ?auto_209061 ?auto_209063 ) ) ( not ( = ?auto_209061 ?auto_209064 ) ) ( not ( = ?auto_209062 ?auto_209063 ) ) ( not ( = ?auto_209062 ?auto_209064 ) ) ( not ( = ?auto_209063 ?auto_209064 ) ) ( ON ?auto_209062 ?auto_209063 ) ( CLEAR ?auto_209060 ) ( ON ?auto_209061 ?auto_209062 ) ( CLEAR ?auto_209061 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_209060 ?auto_209061 )
      ( MAKE-4PILE ?auto_209060 ?auto_209061 ?auto_209062 ?auto_209063 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_209078 - BLOCK
      ?auto_209079 - BLOCK
      ?auto_209080 - BLOCK
      ?auto_209081 - BLOCK
    )
    :vars
    (
      ?auto_209082 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209081 ?auto_209082 ) ( not ( = ?auto_209078 ?auto_209079 ) ) ( not ( = ?auto_209078 ?auto_209080 ) ) ( not ( = ?auto_209078 ?auto_209081 ) ) ( not ( = ?auto_209078 ?auto_209082 ) ) ( not ( = ?auto_209079 ?auto_209080 ) ) ( not ( = ?auto_209079 ?auto_209081 ) ) ( not ( = ?auto_209079 ?auto_209082 ) ) ( not ( = ?auto_209080 ?auto_209081 ) ) ( not ( = ?auto_209080 ?auto_209082 ) ) ( not ( = ?auto_209081 ?auto_209082 ) ) ( ON ?auto_209080 ?auto_209081 ) ( ON ?auto_209079 ?auto_209080 ) ( ON ?auto_209078 ?auto_209079 ) ( CLEAR ?auto_209078 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_209078 )
      ( MAKE-4PILE ?auto_209078 ?auto_209079 ?auto_209080 ?auto_209081 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_209097 - BLOCK
      ?auto_209098 - BLOCK
      ?auto_209099 - BLOCK
      ?auto_209100 - BLOCK
      ?auto_209101 - BLOCK
    )
    :vars
    (
      ?auto_209102 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_209100 ) ( ON ?auto_209101 ?auto_209102 ) ( CLEAR ?auto_209101 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_209097 ) ( ON ?auto_209098 ?auto_209097 ) ( ON ?auto_209099 ?auto_209098 ) ( ON ?auto_209100 ?auto_209099 ) ( not ( = ?auto_209097 ?auto_209098 ) ) ( not ( = ?auto_209097 ?auto_209099 ) ) ( not ( = ?auto_209097 ?auto_209100 ) ) ( not ( = ?auto_209097 ?auto_209101 ) ) ( not ( = ?auto_209097 ?auto_209102 ) ) ( not ( = ?auto_209098 ?auto_209099 ) ) ( not ( = ?auto_209098 ?auto_209100 ) ) ( not ( = ?auto_209098 ?auto_209101 ) ) ( not ( = ?auto_209098 ?auto_209102 ) ) ( not ( = ?auto_209099 ?auto_209100 ) ) ( not ( = ?auto_209099 ?auto_209101 ) ) ( not ( = ?auto_209099 ?auto_209102 ) ) ( not ( = ?auto_209100 ?auto_209101 ) ) ( not ( = ?auto_209100 ?auto_209102 ) ) ( not ( = ?auto_209101 ?auto_209102 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_209101 ?auto_209102 )
      ( !STACK ?auto_209101 ?auto_209100 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_209119 - BLOCK
      ?auto_209120 - BLOCK
      ?auto_209121 - BLOCK
      ?auto_209122 - BLOCK
      ?auto_209123 - BLOCK
    )
    :vars
    (
      ?auto_209124 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209123 ?auto_209124 ) ( ON-TABLE ?auto_209119 ) ( ON ?auto_209120 ?auto_209119 ) ( ON ?auto_209121 ?auto_209120 ) ( not ( = ?auto_209119 ?auto_209120 ) ) ( not ( = ?auto_209119 ?auto_209121 ) ) ( not ( = ?auto_209119 ?auto_209122 ) ) ( not ( = ?auto_209119 ?auto_209123 ) ) ( not ( = ?auto_209119 ?auto_209124 ) ) ( not ( = ?auto_209120 ?auto_209121 ) ) ( not ( = ?auto_209120 ?auto_209122 ) ) ( not ( = ?auto_209120 ?auto_209123 ) ) ( not ( = ?auto_209120 ?auto_209124 ) ) ( not ( = ?auto_209121 ?auto_209122 ) ) ( not ( = ?auto_209121 ?auto_209123 ) ) ( not ( = ?auto_209121 ?auto_209124 ) ) ( not ( = ?auto_209122 ?auto_209123 ) ) ( not ( = ?auto_209122 ?auto_209124 ) ) ( not ( = ?auto_209123 ?auto_209124 ) ) ( CLEAR ?auto_209121 ) ( ON ?auto_209122 ?auto_209123 ) ( CLEAR ?auto_209122 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_209119 ?auto_209120 ?auto_209121 ?auto_209122 )
      ( MAKE-5PILE ?auto_209119 ?auto_209120 ?auto_209121 ?auto_209122 ?auto_209123 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_209141 - BLOCK
      ?auto_209142 - BLOCK
      ?auto_209143 - BLOCK
      ?auto_209144 - BLOCK
      ?auto_209145 - BLOCK
    )
    :vars
    (
      ?auto_209146 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209145 ?auto_209146 ) ( ON-TABLE ?auto_209141 ) ( ON ?auto_209142 ?auto_209141 ) ( not ( = ?auto_209141 ?auto_209142 ) ) ( not ( = ?auto_209141 ?auto_209143 ) ) ( not ( = ?auto_209141 ?auto_209144 ) ) ( not ( = ?auto_209141 ?auto_209145 ) ) ( not ( = ?auto_209141 ?auto_209146 ) ) ( not ( = ?auto_209142 ?auto_209143 ) ) ( not ( = ?auto_209142 ?auto_209144 ) ) ( not ( = ?auto_209142 ?auto_209145 ) ) ( not ( = ?auto_209142 ?auto_209146 ) ) ( not ( = ?auto_209143 ?auto_209144 ) ) ( not ( = ?auto_209143 ?auto_209145 ) ) ( not ( = ?auto_209143 ?auto_209146 ) ) ( not ( = ?auto_209144 ?auto_209145 ) ) ( not ( = ?auto_209144 ?auto_209146 ) ) ( not ( = ?auto_209145 ?auto_209146 ) ) ( ON ?auto_209144 ?auto_209145 ) ( CLEAR ?auto_209142 ) ( ON ?auto_209143 ?auto_209144 ) ( CLEAR ?auto_209143 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_209141 ?auto_209142 ?auto_209143 )
      ( MAKE-5PILE ?auto_209141 ?auto_209142 ?auto_209143 ?auto_209144 ?auto_209145 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_209163 - BLOCK
      ?auto_209164 - BLOCK
      ?auto_209165 - BLOCK
      ?auto_209166 - BLOCK
      ?auto_209167 - BLOCK
    )
    :vars
    (
      ?auto_209168 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209167 ?auto_209168 ) ( ON-TABLE ?auto_209163 ) ( not ( = ?auto_209163 ?auto_209164 ) ) ( not ( = ?auto_209163 ?auto_209165 ) ) ( not ( = ?auto_209163 ?auto_209166 ) ) ( not ( = ?auto_209163 ?auto_209167 ) ) ( not ( = ?auto_209163 ?auto_209168 ) ) ( not ( = ?auto_209164 ?auto_209165 ) ) ( not ( = ?auto_209164 ?auto_209166 ) ) ( not ( = ?auto_209164 ?auto_209167 ) ) ( not ( = ?auto_209164 ?auto_209168 ) ) ( not ( = ?auto_209165 ?auto_209166 ) ) ( not ( = ?auto_209165 ?auto_209167 ) ) ( not ( = ?auto_209165 ?auto_209168 ) ) ( not ( = ?auto_209166 ?auto_209167 ) ) ( not ( = ?auto_209166 ?auto_209168 ) ) ( not ( = ?auto_209167 ?auto_209168 ) ) ( ON ?auto_209166 ?auto_209167 ) ( ON ?auto_209165 ?auto_209166 ) ( CLEAR ?auto_209163 ) ( ON ?auto_209164 ?auto_209165 ) ( CLEAR ?auto_209164 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_209163 ?auto_209164 )
      ( MAKE-5PILE ?auto_209163 ?auto_209164 ?auto_209165 ?auto_209166 ?auto_209167 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_209185 - BLOCK
      ?auto_209186 - BLOCK
      ?auto_209187 - BLOCK
      ?auto_209188 - BLOCK
      ?auto_209189 - BLOCK
    )
    :vars
    (
      ?auto_209190 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209189 ?auto_209190 ) ( not ( = ?auto_209185 ?auto_209186 ) ) ( not ( = ?auto_209185 ?auto_209187 ) ) ( not ( = ?auto_209185 ?auto_209188 ) ) ( not ( = ?auto_209185 ?auto_209189 ) ) ( not ( = ?auto_209185 ?auto_209190 ) ) ( not ( = ?auto_209186 ?auto_209187 ) ) ( not ( = ?auto_209186 ?auto_209188 ) ) ( not ( = ?auto_209186 ?auto_209189 ) ) ( not ( = ?auto_209186 ?auto_209190 ) ) ( not ( = ?auto_209187 ?auto_209188 ) ) ( not ( = ?auto_209187 ?auto_209189 ) ) ( not ( = ?auto_209187 ?auto_209190 ) ) ( not ( = ?auto_209188 ?auto_209189 ) ) ( not ( = ?auto_209188 ?auto_209190 ) ) ( not ( = ?auto_209189 ?auto_209190 ) ) ( ON ?auto_209188 ?auto_209189 ) ( ON ?auto_209187 ?auto_209188 ) ( ON ?auto_209186 ?auto_209187 ) ( ON ?auto_209185 ?auto_209186 ) ( CLEAR ?auto_209185 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_209185 )
      ( MAKE-5PILE ?auto_209185 ?auto_209186 ?auto_209187 ?auto_209188 ?auto_209189 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_209208 - BLOCK
      ?auto_209209 - BLOCK
      ?auto_209210 - BLOCK
      ?auto_209211 - BLOCK
      ?auto_209212 - BLOCK
      ?auto_209213 - BLOCK
    )
    :vars
    (
      ?auto_209214 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_209212 ) ( ON ?auto_209213 ?auto_209214 ) ( CLEAR ?auto_209213 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_209208 ) ( ON ?auto_209209 ?auto_209208 ) ( ON ?auto_209210 ?auto_209209 ) ( ON ?auto_209211 ?auto_209210 ) ( ON ?auto_209212 ?auto_209211 ) ( not ( = ?auto_209208 ?auto_209209 ) ) ( not ( = ?auto_209208 ?auto_209210 ) ) ( not ( = ?auto_209208 ?auto_209211 ) ) ( not ( = ?auto_209208 ?auto_209212 ) ) ( not ( = ?auto_209208 ?auto_209213 ) ) ( not ( = ?auto_209208 ?auto_209214 ) ) ( not ( = ?auto_209209 ?auto_209210 ) ) ( not ( = ?auto_209209 ?auto_209211 ) ) ( not ( = ?auto_209209 ?auto_209212 ) ) ( not ( = ?auto_209209 ?auto_209213 ) ) ( not ( = ?auto_209209 ?auto_209214 ) ) ( not ( = ?auto_209210 ?auto_209211 ) ) ( not ( = ?auto_209210 ?auto_209212 ) ) ( not ( = ?auto_209210 ?auto_209213 ) ) ( not ( = ?auto_209210 ?auto_209214 ) ) ( not ( = ?auto_209211 ?auto_209212 ) ) ( not ( = ?auto_209211 ?auto_209213 ) ) ( not ( = ?auto_209211 ?auto_209214 ) ) ( not ( = ?auto_209212 ?auto_209213 ) ) ( not ( = ?auto_209212 ?auto_209214 ) ) ( not ( = ?auto_209213 ?auto_209214 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_209213 ?auto_209214 )
      ( !STACK ?auto_209213 ?auto_209212 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_209234 - BLOCK
      ?auto_209235 - BLOCK
      ?auto_209236 - BLOCK
      ?auto_209237 - BLOCK
      ?auto_209238 - BLOCK
      ?auto_209239 - BLOCK
    )
    :vars
    (
      ?auto_209240 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209239 ?auto_209240 ) ( ON-TABLE ?auto_209234 ) ( ON ?auto_209235 ?auto_209234 ) ( ON ?auto_209236 ?auto_209235 ) ( ON ?auto_209237 ?auto_209236 ) ( not ( = ?auto_209234 ?auto_209235 ) ) ( not ( = ?auto_209234 ?auto_209236 ) ) ( not ( = ?auto_209234 ?auto_209237 ) ) ( not ( = ?auto_209234 ?auto_209238 ) ) ( not ( = ?auto_209234 ?auto_209239 ) ) ( not ( = ?auto_209234 ?auto_209240 ) ) ( not ( = ?auto_209235 ?auto_209236 ) ) ( not ( = ?auto_209235 ?auto_209237 ) ) ( not ( = ?auto_209235 ?auto_209238 ) ) ( not ( = ?auto_209235 ?auto_209239 ) ) ( not ( = ?auto_209235 ?auto_209240 ) ) ( not ( = ?auto_209236 ?auto_209237 ) ) ( not ( = ?auto_209236 ?auto_209238 ) ) ( not ( = ?auto_209236 ?auto_209239 ) ) ( not ( = ?auto_209236 ?auto_209240 ) ) ( not ( = ?auto_209237 ?auto_209238 ) ) ( not ( = ?auto_209237 ?auto_209239 ) ) ( not ( = ?auto_209237 ?auto_209240 ) ) ( not ( = ?auto_209238 ?auto_209239 ) ) ( not ( = ?auto_209238 ?auto_209240 ) ) ( not ( = ?auto_209239 ?auto_209240 ) ) ( CLEAR ?auto_209237 ) ( ON ?auto_209238 ?auto_209239 ) ( CLEAR ?auto_209238 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_209234 ?auto_209235 ?auto_209236 ?auto_209237 ?auto_209238 )
      ( MAKE-6PILE ?auto_209234 ?auto_209235 ?auto_209236 ?auto_209237 ?auto_209238 ?auto_209239 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_209260 - BLOCK
      ?auto_209261 - BLOCK
      ?auto_209262 - BLOCK
      ?auto_209263 - BLOCK
      ?auto_209264 - BLOCK
      ?auto_209265 - BLOCK
    )
    :vars
    (
      ?auto_209266 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209265 ?auto_209266 ) ( ON-TABLE ?auto_209260 ) ( ON ?auto_209261 ?auto_209260 ) ( ON ?auto_209262 ?auto_209261 ) ( not ( = ?auto_209260 ?auto_209261 ) ) ( not ( = ?auto_209260 ?auto_209262 ) ) ( not ( = ?auto_209260 ?auto_209263 ) ) ( not ( = ?auto_209260 ?auto_209264 ) ) ( not ( = ?auto_209260 ?auto_209265 ) ) ( not ( = ?auto_209260 ?auto_209266 ) ) ( not ( = ?auto_209261 ?auto_209262 ) ) ( not ( = ?auto_209261 ?auto_209263 ) ) ( not ( = ?auto_209261 ?auto_209264 ) ) ( not ( = ?auto_209261 ?auto_209265 ) ) ( not ( = ?auto_209261 ?auto_209266 ) ) ( not ( = ?auto_209262 ?auto_209263 ) ) ( not ( = ?auto_209262 ?auto_209264 ) ) ( not ( = ?auto_209262 ?auto_209265 ) ) ( not ( = ?auto_209262 ?auto_209266 ) ) ( not ( = ?auto_209263 ?auto_209264 ) ) ( not ( = ?auto_209263 ?auto_209265 ) ) ( not ( = ?auto_209263 ?auto_209266 ) ) ( not ( = ?auto_209264 ?auto_209265 ) ) ( not ( = ?auto_209264 ?auto_209266 ) ) ( not ( = ?auto_209265 ?auto_209266 ) ) ( ON ?auto_209264 ?auto_209265 ) ( CLEAR ?auto_209262 ) ( ON ?auto_209263 ?auto_209264 ) ( CLEAR ?auto_209263 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_209260 ?auto_209261 ?auto_209262 ?auto_209263 )
      ( MAKE-6PILE ?auto_209260 ?auto_209261 ?auto_209262 ?auto_209263 ?auto_209264 ?auto_209265 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_209286 - BLOCK
      ?auto_209287 - BLOCK
      ?auto_209288 - BLOCK
      ?auto_209289 - BLOCK
      ?auto_209290 - BLOCK
      ?auto_209291 - BLOCK
    )
    :vars
    (
      ?auto_209292 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209291 ?auto_209292 ) ( ON-TABLE ?auto_209286 ) ( ON ?auto_209287 ?auto_209286 ) ( not ( = ?auto_209286 ?auto_209287 ) ) ( not ( = ?auto_209286 ?auto_209288 ) ) ( not ( = ?auto_209286 ?auto_209289 ) ) ( not ( = ?auto_209286 ?auto_209290 ) ) ( not ( = ?auto_209286 ?auto_209291 ) ) ( not ( = ?auto_209286 ?auto_209292 ) ) ( not ( = ?auto_209287 ?auto_209288 ) ) ( not ( = ?auto_209287 ?auto_209289 ) ) ( not ( = ?auto_209287 ?auto_209290 ) ) ( not ( = ?auto_209287 ?auto_209291 ) ) ( not ( = ?auto_209287 ?auto_209292 ) ) ( not ( = ?auto_209288 ?auto_209289 ) ) ( not ( = ?auto_209288 ?auto_209290 ) ) ( not ( = ?auto_209288 ?auto_209291 ) ) ( not ( = ?auto_209288 ?auto_209292 ) ) ( not ( = ?auto_209289 ?auto_209290 ) ) ( not ( = ?auto_209289 ?auto_209291 ) ) ( not ( = ?auto_209289 ?auto_209292 ) ) ( not ( = ?auto_209290 ?auto_209291 ) ) ( not ( = ?auto_209290 ?auto_209292 ) ) ( not ( = ?auto_209291 ?auto_209292 ) ) ( ON ?auto_209290 ?auto_209291 ) ( ON ?auto_209289 ?auto_209290 ) ( CLEAR ?auto_209287 ) ( ON ?auto_209288 ?auto_209289 ) ( CLEAR ?auto_209288 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_209286 ?auto_209287 ?auto_209288 )
      ( MAKE-6PILE ?auto_209286 ?auto_209287 ?auto_209288 ?auto_209289 ?auto_209290 ?auto_209291 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_209312 - BLOCK
      ?auto_209313 - BLOCK
      ?auto_209314 - BLOCK
      ?auto_209315 - BLOCK
      ?auto_209316 - BLOCK
      ?auto_209317 - BLOCK
    )
    :vars
    (
      ?auto_209318 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209317 ?auto_209318 ) ( ON-TABLE ?auto_209312 ) ( not ( = ?auto_209312 ?auto_209313 ) ) ( not ( = ?auto_209312 ?auto_209314 ) ) ( not ( = ?auto_209312 ?auto_209315 ) ) ( not ( = ?auto_209312 ?auto_209316 ) ) ( not ( = ?auto_209312 ?auto_209317 ) ) ( not ( = ?auto_209312 ?auto_209318 ) ) ( not ( = ?auto_209313 ?auto_209314 ) ) ( not ( = ?auto_209313 ?auto_209315 ) ) ( not ( = ?auto_209313 ?auto_209316 ) ) ( not ( = ?auto_209313 ?auto_209317 ) ) ( not ( = ?auto_209313 ?auto_209318 ) ) ( not ( = ?auto_209314 ?auto_209315 ) ) ( not ( = ?auto_209314 ?auto_209316 ) ) ( not ( = ?auto_209314 ?auto_209317 ) ) ( not ( = ?auto_209314 ?auto_209318 ) ) ( not ( = ?auto_209315 ?auto_209316 ) ) ( not ( = ?auto_209315 ?auto_209317 ) ) ( not ( = ?auto_209315 ?auto_209318 ) ) ( not ( = ?auto_209316 ?auto_209317 ) ) ( not ( = ?auto_209316 ?auto_209318 ) ) ( not ( = ?auto_209317 ?auto_209318 ) ) ( ON ?auto_209316 ?auto_209317 ) ( ON ?auto_209315 ?auto_209316 ) ( ON ?auto_209314 ?auto_209315 ) ( CLEAR ?auto_209312 ) ( ON ?auto_209313 ?auto_209314 ) ( CLEAR ?auto_209313 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_209312 ?auto_209313 )
      ( MAKE-6PILE ?auto_209312 ?auto_209313 ?auto_209314 ?auto_209315 ?auto_209316 ?auto_209317 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_209338 - BLOCK
      ?auto_209339 - BLOCK
      ?auto_209340 - BLOCK
      ?auto_209341 - BLOCK
      ?auto_209342 - BLOCK
      ?auto_209343 - BLOCK
    )
    :vars
    (
      ?auto_209344 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209343 ?auto_209344 ) ( not ( = ?auto_209338 ?auto_209339 ) ) ( not ( = ?auto_209338 ?auto_209340 ) ) ( not ( = ?auto_209338 ?auto_209341 ) ) ( not ( = ?auto_209338 ?auto_209342 ) ) ( not ( = ?auto_209338 ?auto_209343 ) ) ( not ( = ?auto_209338 ?auto_209344 ) ) ( not ( = ?auto_209339 ?auto_209340 ) ) ( not ( = ?auto_209339 ?auto_209341 ) ) ( not ( = ?auto_209339 ?auto_209342 ) ) ( not ( = ?auto_209339 ?auto_209343 ) ) ( not ( = ?auto_209339 ?auto_209344 ) ) ( not ( = ?auto_209340 ?auto_209341 ) ) ( not ( = ?auto_209340 ?auto_209342 ) ) ( not ( = ?auto_209340 ?auto_209343 ) ) ( not ( = ?auto_209340 ?auto_209344 ) ) ( not ( = ?auto_209341 ?auto_209342 ) ) ( not ( = ?auto_209341 ?auto_209343 ) ) ( not ( = ?auto_209341 ?auto_209344 ) ) ( not ( = ?auto_209342 ?auto_209343 ) ) ( not ( = ?auto_209342 ?auto_209344 ) ) ( not ( = ?auto_209343 ?auto_209344 ) ) ( ON ?auto_209342 ?auto_209343 ) ( ON ?auto_209341 ?auto_209342 ) ( ON ?auto_209340 ?auto_209341 ) ( ON ?auto_209339 ?auto_209340 ) ( ON ?auto_209338 ?auto_209339 ) ( CLEAR ?auto_209338 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_209338 )
      ( MAKE-6PILE ?auto_209338 ?auto_209339 ?auto_209340 ?auto_209341 ?auto_209342 ?auto_209343 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_209365 - BLOCK
      ?auto_209366 - BLOCK
      ?auto_209367 - BLOCK
      ?auto_209368 - BLOCK
      ?auto_209369 - BLOCK
      ?auto_209370 - BLOCK
      ?auto_209371 - BLOCK
    )
    :vars
    (
      ?auto_209372 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_209370 ) ( ON ?auto_209371 ?auto_209372 ) ( CLEAR ?auto_209371 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_209365 ) ( ON ?auto_209366 ?auto_209365 ) ( ON ?auto_209367 ?auto_209366 ) ( ON ?auto_209368 ?auto_209367 ) ( ON ?auto_209369 ?auto_209368 ) ( ON ?auto_209370 ?auto_209369 ) ( not ( = ?auto_209365 ?auto_209366 ) ) ( not ( = ?auto_209365 ?auto_209367 ) ) ( not ( = ?auto_209365 ?auto_209368 ) ) ( not ( = ?auto_209365 ?auto_209369 ) ) ( not ( = ?auto_209365 ?auto_209370 ) ) ( not ( = ?auto_209365 ?auto_209371 ) ) ( not ( = ?auto_209365 ?auto_209372 ) ) ( not ( = ?auto_209366 ?auto_209367 ) ) ( not ( = ?auto_209366 ?auto_209368 ) ) ( not ( = ?auto_209366 ?auto_209369 ) ) ( not ( = ?auto_209366 ?auto_209370 ) ) ( not ( = ?auto_209366 ?auto_209371 ) ) ( not ( = ?auto_209366 ?auto_209372 ) ) ( not ( = ?auto_209367 ?auto_209368 ) ) ( not ( = ?auto_209367 ?auto_209369 ) ) ( not ( = ?auto_209367 ?auto_209370 ) ) ( not ( = ?auto_209367 ?auto_209371 ) ) ( not ( = ?auto_209367 ?auto_209372 ) ) ( not ( = ?auto_209368 ?auto_209369 ) ) ( not ( = ?auto_209368 ?auto_209370 ) ) ( not ( = ?auto_209368 ?auto_209371 ) ) ( not ( = ?auto_209368 ?auto_209372 ) ) ( not ( = ?auto_209369 ?auto_209370 ) ) ( not ( = ?auto_209369 ?auto_209371 ) ) ( not ( = ?auto_209369 ?auto_209372 ) ) ( not ( = ?auto_209370 ?auto_209371 ) ) ( not ( = ?auto_209370 ?auto_209372 ) ) ( not ( = ?auto_209371 ?auto_209372 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_209371 ?auto_209372 )
      ( !STACK ?auto_209371 ?auto_209370 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_209395 - BLOCK
      ?auto_209396 - BLOCK
      ?auto_209397 - BLOCK
      ?auto_209398 - BLOCK
      ?auto_209399 - BLOCK
      ?auto_209400 - BLOCK
      ?auto_209401 - BLOCK
    )
    :vars
    (
      ?auto_209402 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209401 ?auto_209402 ) ( ON-TABLE ?auto_209395 ) ( ON ?auto_209396 ?auto_209395 ) ( ON ?auto_209397 ?auto_209396 ) ( ON ?auto_209398 ?auto_209397 ) ( ON ?auto_209399 ?auto_209398 ) ( not ( = ?auto_209395 ?auto_209396 ) ) ( not ( = ?auto_209395 ?auto_209397 ) ) ( not ( = ?auto_209395 ?auto_209398 ) ) ( not ( = ?auto_209395 ?auto_209399 ) ) ( not ( = ?auto_209395 ?auto_209400 ) ) ( not ( = ?auto_209395 ?auto_209401 ) ) ( not ( = ?auto_209395 ?auto_209402 ) ) ( not ( = ?auto_209396 ?auto_209397 ) ) ( not ( = ?auto_209396 ?auto_209398 ) ) ( not ( = ?auto_209396 ?auto_209399 ) ) ( not ( = ?auto_209396 ?auto_209400 ) ) ( not ( = ?auto_209396 ?auto_209401 ) ) ( not ( = ?auto_209396 ?auto_209402 ) ) ( not ( = ?auto_209397 ?auto_209398 ) ) ( not ( = ?auto_209397 ?auto_209399 ) ) ( not ( = ?auto_209397 ?auto_209400 ) ) ( not ( = ?auto_209397 ?auto_209401 ) ) ( not ( = ?auto_209397 ?auto_209402 ) ) ( not ( = ?auto_209398 ?auto_209399 ) ) ( not ( = ?auto_209398 ?auto_209400 ) ) ( not ( = ?auto_209398 ?auto_209401 ) ) ( not ( = ?auto_209398 ?auto_209402 ) ) ( not ( = ?auto_209399 ?auto_209400 ) ) ( not ( = ?auto_209399 ?auto_209401 ) ) ( not ( = ?auto_209399 ?auto_209402 ) ) ( not ( = ?auto_209400 ?auto_209401 ) ) ( not ( = ?auto_209400 ?auto_209402 ) ) ( not ( = ?auto_209401 ?auto_209402 ) ) ( CLEAR ?auto_209399 ) ( ON ?auto_209400 ?auto_209401 ) ( CLEAR ?auto_209400 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_209395 ?auto_209396 ?auto_209397 ?auto_209398 ?auto_209399 ?auto_209400 )
      ( MAKE-7PILE ?auto_209395 ?auto_209396 ?auto_209397 ?auto_209398 ?auto_209399 ?auto_209400 ?auto_209401 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_209425 - BLOCK
      ?auto_209426 - BLOCK
      ?auto_209427 - BLOCK
      ?auto_209428 - BLOCK
      ?auto_209429 - BLOCK
      ?auto_209430 - BLOCK
      ?auto_209431 - BLOCK
    )
    :vars
    (
      ?auto_209432 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209431 ?auto_209432 ) ( ON-TABLE ?auto_209425 ) ( ON ?auto_209426 ?auto_209425 ) ( ON ?auto_209427 ?auto_209426 ) ( ON ?auto_209428 ?auto_209427 ) ( not ( = ?auto_209425 ?auto_209426 ) ) ( not ( = ?auto_209425 ?auto_209427 ) ) ( not ( = ?auto_209425 ?auto_209428 ) ) ( not ( = ?auto_209425 ?auto_209429 ) ) ( not ( = ?auto_209425 ?auto_209430 ) ) ( not ( = ?auto_209425 ?auto_209431 ) ) ( not ( = ?auto_209425 ?auto_209432 ) ) ( not ( = ?auto_209426 ?auto_209427 ) ) ( not ( = ?auto_209426 ?auto_209428 ) ) ( not ( = ?auto_209426 ?auto_209429 ) ) ( not ( = ?auto_209426 ?auto_209430 ) ) ( not ( = ?auto_209426 ?auto_209431 ) ) ( not ( = ?auto_209426 ?auto_209432 ) ) ( not ( = ?auto_209427 ?auto_209428 ) ) ( not ( = ?auto_209427 ?auto_209429 ) ) ( not ( = ?auto_209427 ?auto_209430 ) ) ( not ( = ?auto_209427 ?auto_209431 ) ) ( not ( = ?auto_209427 ?auto_209432 ) ) ( not ( = ?auto_209428 ?auto_209429 ) ) ( not ( = ?auto_209428 ?auto_209430 ) ) ( not ( = ?auto_209428 ?auto_209431 ) ) ( not ( = ?auto_209428 ?auto_209432 ) ) ( not ( = ?auto_209429 ?auto_209430 ) ) ( not ( = ?auto_209429 ?auto_209431 ) ) ( not ( = ?auto_209429 ?auto_209432 ) ) ( not ( = ?auto_209430 ?auto_209431 ) ) ( not ( = ?auto_209430 ?auto_209432 ) ) ( not ( = ?auto_209431 ?auto_209432 ) ) ( ON ?auto_209430 ?auto_209431 ) ( CLEAR ?auto_209428 ) ( ON ?auto_209429 ?auto_209430 ) ( CLEAR ?auto_209429 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_209425 ?auto_209426 ?auto_209427 ?auto_209428 ?auto_209429 )
      ( MAKE-7PILE ?auto_209425 ?auto_209426 ?auto_209427 ?auto_209428 ?auto_209429 ?auto_209430 ?auto_209431 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_209455 - BLOCK
      ?auto_209456 - BLOCK
      ?auto_209457 - BLOCK
      ?auto_209458 - BLOCK
      ?auto_209459 - BLOCK
      ?auto_209460 - BLOCK
      ?auto_209461 - BLOCK
    )
    :vars
    (
      ?auto_209462 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209461 ?auto_209462 ) ( ON-TABLE ?auto_209455 ) ( ON ?auto_209456 ?auto_209455 ) ( ON ?auto_209457 ?auto_209456 ) ( not ( = ?auto_209455 ?auto_209456 ) ) ( not ( = ?auto_209455 ?auto_209457 ) ) ( not ( = ?auto_209455 ?auto_209458 ) ) ( not ( = ?auto_209455 ?auto_209459 ) ) ( not ( = ?auto_209455 ?auto_209460 ) ) ( not ( = ?auto_209455 ?auto_209461 ) ) ( not ( = ?auto_209455 ?auto_209462 ) ) ( not ( = ?auto_209456 ?auto_209457 ) ) ( not ( = ?auto_209456 ?auto_209458 ) ) ( not ( = ?auto_209456 ?auto_209459 ) ) ( not ( = ?auto_209456 ?auto_209460 ) ) ( not ( = ?auto_209456 ?auto_209461 ) ) ( not ( = ?auto_209456 ?auto_209462 ) ) ( not ( = ?auto_209457 ?auto_209458 ) ) ( not ( = ?auto_209457 ?auto_209459 ) ) ( not ( = ?auto_209457 ?auto_209460 ) ) ( not ( = ?auto_209457 ?auto_209461 ) ) ( not ( = ?auto_209457 ?auto_209462 ) ) ( not ( = ?auto_209458 ?auto_209459 ) ) ( not ( = ?auto_209458 ?auto_209460 ) ) ( not ( = ?auto_209458 ?auto_209461 ) ) ( not ( = ?auto_209458 ?auto_209462 ) ) ( not ( = ?auto_209459 ?auto_209460 ) ) ( not ( = ?auto_209459 ?auto_209461 ) ) ( not ( = ?auto_209459 ?auto_209462 ) ) ( not ( = ?auto_209460 ?auto_209461 ) ) ( not ( = ?auto_209460 ?auto_209462 ) ) ( not ( = ?auto_209461 ?auto_209462 ) ) ( ON ?auto_209460 ?auto_209461 ) ( ON ?auto_209459 ?auto_209460 ) ( CLEAR ?auto_209457 ) ( ON ?auto_209458 ?auto_209459 ) ( CLEAR ?auto_209458 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_209455 ?auto_209456 ?auto_209457 ?auto_209458 )
      ( MAKE-7PILE ?auto_209455 ?auto_209456 ?auto_209457 ?auto_209458 ?auto_209459 ?auto_209460 ?auto_209461 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_209485 - BLOCK
      ?auto_209486 - BLOCK
      ?auto_209487 - BLOCK
      ?auto_209488 - BLOCK
      ?auto_209489 - BLOCK
      ?auto_209490 - BLOCK
      ?auto_209491 - BLOCK
    )
    :vars
    (
      ?auto_209492 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209491 ?auto_209492 ) ( ON-TABLE ?auto_209485 ) ( ON ?auto_209486 ?auto_209485 ) ( not ( = ?auto_209485 ?auto_209486 ) ) ( not ( = ?auto_209485 ?auto_209487 ) ) ( not ( = ?auto_209485 ?auto_209488 ) ) ( not ( = ?auto_209485 ?auto_209489 ) ) ( not ( = ?auto_209485 ?auto_209490 ) ) ( not ( = ?auto_209485 ?auto_209491 ) ) ( not ( = ?auto_209485 ?auto_209492 ) ) ( not ( = ?auto_209486 ?auto_209487 ) ) ( not ( = ?auto_209486 ?auto_209488 ) ) ( not ( = ?auto_209486 ?auto_209489 ) ) ( not ( = ?auto_209486 ?auto_209490 ) ) ( not ( = ?auto_209486 ?auto_209491 ) ) ( not ( = ?auto_209486 ?auto_209492 ) ) ( not ( = ?auto_209487 ?auto_209488 ) ) ( not ( = ?auto_209487 ?auto_209489 ) ) ( not ( = ?auto_209487 ?auto_209490 ) ) ( not ( = ?auto_209487 ?auto_209491 ) ) ( not ( = ?auto_209487 ?auto_209492 ) ) ( not ( = ?auto_209488 ?auto_209489 ) ) ( not ( = ?auto_209488 ?auto_209490 ) ) ( not ( = ?auto_209488 ?auto_209491 ) ) ( not ( = ?auto_209488 ?auto_209492 ) ) ( not ( = ?auto_209489 ?auto_209490 ) ) ( not ( = ?auto_209489 ?auto_209491 ) ) ( not ( = ?auto_209489 ?auto_209492 ) ) ( not ( = ?auto_209490 ?auto_209491 ) ) ( not ( = ?auto_209490 ?auto_209492 ) ) ( not ( = ?auto_209491 ?auto_209492 ) ) ( ON ?auto_209490 ?auto_209491 ) ( ON ?auto_209489 ?auto_209490 ) ( ON ?auto_209488 ?auto_209489 ) ( CLEAR ?auto_209486 ) ( ON ?auto_209487 ?auto_209488 ) ( CLEAR ?auto_209487 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_209485 ?auto_209486 ?auto_209487 )
      ( MAKE-7PILE ?auto_209485 ?auto_209486 ?auto_209487 ?auto_209488 ?auto_209489 ?auto_209490 ?auto_209491 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_209515 - BLOCK
      ?auto_209516 - BLOCK
      ?auto_209517 - BLOCK
      ?auto_209518 - BLOCK
      ?auto_209519 - BLOCK
      ?auto_209520 - BLOCK
      ?auto_209521 - BLOCK
    )
    :vars
    (
      ?auto_209522 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209521 ?auto_209522 ) ( ON-TABLE ?auto_209515 ) ( not ( = ?auto_209515 ?auto_209516 ) ) ( not ( = ?auto_209515 ?auto_209517 ) ) ( not ( = ?auto_209515 ?auto_209518 ) ) ( not ( = ?auto_209515 ?auto_209519 ) ) ( not ( = ?auto_209515 ?auto_209520 ) ) ( not ( = ?auto_209515 ?auto_209521 ) ) ( not ( = ?auto_209515 ?auto_209522 ) ) ( not ( = ?auto_209516 ?auto_209517 ) ) ( not ( = ?auto_209516 ?auto_209518 ) ) ( not ( = ?auto_209516 ?auto_209519 ) ) ( not ( = ?auto_209516 ?auto_209520 ) ) ( not ( = ?auto_209516 ?auto_209521 ) ) ( not ( = ?auto_209516 ?auto_209522 ) ) ( not ( = ?auto_209517 ?auto_209518 ) ) ( not ( = ?auto_209517 ?auto_209519 ) ) ( not ( = ?auto_209517 ?auto_209520 ) ) ( not ( = ?auto_209517 ?auto_209521 ) ) ( not ( = ?auto_209517 ?auto_209522 ) ) ( not ( = ?auto_209518 ?auto_209519 ) ) ( not ( = ?auto_209518 ?auto_209520 ) ) ( not ( = ?auto_209518 ?auto_209521 ) ) ( not ( = ?auto_209518 ?auto_209522 ) ) ( not ( = ?auto_209519 ?auto_209520 ) ) ( not ( = ?auto_209519 ?auto_209521 ) ) ( not ( = ?auto_209519 ?auto_209522 ) ) ( not ( = ?auto_209520 ?auto_209521 ) ) ( not ( = ?auto_209520 ?auto_209522 ) ) ( not ( = ?auto_209521 ?auto_209522 ) ) ( ON ?auto_209520 ?auto_209521 ) ( ON ?auto_209519 ?auto_209520 ) ( ON ?auto_209518 ?auto_209519 ) ( ON ?auto_209517 ?auto_209518 ) ( CLEAR ?auto_209515 ) ( ON ?auto_209516 ?auto_209517 ) ( CLEAR ?auto_209516 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_209515 ?auto_209516 )
      ( MAKE-7PILE ?auto_209515 ?auto_209516 ?auto_209517 ?auto_209518 ?auto_209519 ?auto_209520 ?auto_209521 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_209545 - BLOCK
      ?auto_209546 - BLOCK
      ?auto_209547 - BLOCK
      ?auto_209548 - BLOCK
      ?auto_209549 - BLOCK
      ?auto_209550 - BLOCK
      ?auto_209551 - BLOCK
    )
    :vars
    (
      ?auto_209552 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209551 ?auto_209552 ) ( not ( = ?auto_209545 ?auto_209546 ) ) ( not ( = ?auto_209545 ?auto_209547 ) ) ( not ( = ?auto_209545 ?auto_209548 ) ) ( not ( = ?auto_209545 ?auto_209549 ) ) ( not ( = ?auto_209545 ?auto_209550 ) ) ( not ( = ?auto_209545 ?auto_209551 ) ) ( not ( = ?auto_209545 ?auto_209552 ) ) ( not ( = ?auto_209546 ?auto_209547 ) ) ( not ( = ?auto_209546 ?auto_209548 ) ) ( not ( = ?auto_209546 ?auto_209549 ) ) ( not ( = ?auto_209546 ?auto_209550 ) ) ( not ( = ?auto_209546 ?auto_209551 ) ) ( not ( = ?auto_209546 ?auto_209552 ) ) ( not ( = ?auto_209547 ?auto_209548 ) ) ( not ( = ?auto_209547 ?auto_209549 ) ) ( not ( = ?auto_209547 ?auto_209550 ) ) ( not ( = ?auto_209547 ?auto_209551 ) ) ( not ( = ?auto_209547 ?auto_209552 ) ) ( not ( = ?auto_209548 ?auto_209549 ) ) ( not ( = ?auto_209548 ?auto_209550 ) ) ( not ( = ?auto_209548 ?auto_209551 ) ) ( not ( = ?auto_209548 ?auto_209552 ) ) ( not ( = ?auto_209549 ?auto_209550 ) ) ( not ( = ?auto_209549 ?auto_209551 ) ) ( not ( = ?auto_209549 ?auto_209552 ) ) ( not ( = ?auto_209550 ?auto_209551 ) ) ( not ( = ?auto_209550 ?auto_209552 ) ) ( not ( = ?auto_209551 ?auto_209552 ) ) ( ON ?auto_209550 ?auto_209551 ) ( ON ?auto_209549 ?auto_209550 ) ( ON ?auto_209548 ?auto_209549 ) ( ON ?auto_209547 ?auto_209548 ) ( ON ?auto_209546 ?auto_209547 ) ( ON ?auto_209545 ?auto_209546 ) ( CLEAR ?auto_209545 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_209545 )
      ( MAKE-7PILE ?auto_209545 ?auto_209546 ?auto_209547 ?auto_209548 ?auto_209549 ?auto_209550 ?auto_209551 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_209576 - BLOCK
      ?auto_209577 - BLOCK
      ?auto_209578 - BLOCK
      ?auto_209579 - BLOCK
      ?auto_209580 - BLOCK
      ?auto_209581 - BLOCK
      ?auto_209582 - BLOCK
      ?auto_209583 - BLOCK
    )
    :vars
    (
      ?auto_209584 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_209582 ) ( ON ?auto_209583 ?auto_209584 ) ( CLEAR ?auto_209583 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_209576 ) ( ON ?auto_209577 ?auto_209576 ) ( ON ?auto_209578 ?auto_209577 ) ( ON ?auto_209579 ?auto_209578 ) ( ON ?auto_209580 ?auto_209579 ) ( ON ?auto_209581 ?auto_209580 ) ( ON ?auto_209582 ?auto_209581 ) ( not ( = ?auto_209576 ?auto_209577 ) ) ( not ( = ?auto_209576 ?auto_209578 ) ) ( not ( = ?auto_209576 ?auto_209579 ) ) ( not ( = ?auto_209576 ?auto_209580 ) ) ( not ( = ?auto_209576 ?auto_209581 ) ) ( not ( = ?auto_209576 ?auto_209582 ) ) ( not ( = ?auto_209576 ?auto_209583 ) ) ( not ( = ?auto_209576 ?auto_209584 ) ) ( not ( = ?auto_209577 ?auto_209578 ) ) ( not ( = ?auto_209577 ?auto_209579 ) ) ( not ( = ?auto_209577 ?auto_209580 ) ) ( not ( = ?auto_209577 ?auto_209581 ) ) ( not ( = ?auto_209577 ?auto_209582 ) ) ( not ( = ?auto_209577 ?auto_209583 ) ) ( not ( = ?auto_209577 ?auto_209584 ) ) ( not ( = ?auto_209578 ?auto_209579 ) ) ( not ( = ?auto_209578 ?auto_209580 ) ) ( not ( = ?auto_209578 ?auto_209581 ) ) ( not ( = ?auto_209578 ?auto_209582 ) ) ( not ( = ?auto_209578 ?auto_209583 ) ) ( not ( = ?auto_209578 ?auto_209584 ) ) ( not ( = ?auto_209579 ?auto_209580 ) ) ( not ( = ?auto_209579 ?auto_209581 ) ) ( not ( = ?auto_209579 ?auto_209582 ) ) ( not ( = ?auto_209579 ?auto_209583 ) ) ( not ( = ?auto_209579 ?auto_209584 ) ) ( not ( = ?auto_209580 ?auto_209581 ) ) ( not ( = ?auto_209580 ?auto_209582 ) ) ( not ( = ?auto_209580 ?auto_209583 ) ) ( not ( = ?auto_209580 ?auto_209584 ) ) ( not ( = ?auto_209581 ?auto_209582 ) ) ( not ( = ?auto_209581 ?auto_209583 ) ) ( not ( = ?auto_209581 ?auto_209584 ) ) ( not ( = ?auto_209582 ?auto_209583 ) ) ( not ( = ?auto_209582 ?auto_209584 ) ) ( not ( = ?auto_209583 ?auto_209584 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_209583 ?auto_209584 )
      ( !STACK ?auto_209583 ?auto_209582 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_209610 - BLOCK
      ?auto_209611 - BLOCK
      ?auto_209612 - BLOCK
      ?auto_209613 - BLOCK
      ?auto_209614 - BLOCK
      ?auto_209615 - BLOCK
      ?auto_209616 - BLOCK
      ?auto_209617 - BLOCK
    )
    :vars
    (
      ?auto_209618 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209617 ?auto_209618 ) ( ON-TABLE ?auto_209610 ) ( ON ?auto_209611 ?auto_209610 ) ( ON ?auto_209612 ?auto_209611 ) ( ON ?auto_209613 ?auto_209612 ) ( ON ?auto_209614 ?auto_209613 ) ( ON ?auto_209615 ?auto_209614 ) ( not ( = ?auto_209610 ?auto_209611 ) ) ( not ( = ?auto_209610 ?auto_209612 ) ) ( not ( = ?auto_209610 ?auto_209613 ) ) ( not ( = ?auto_209610 ?auto_209614 ) ) ( not ( = ?auto_209610 ?auto_209615 ) ) ( not ( = ?auto_209610 ?auto_209616 ) ) ( not ( = ?auto_209610 ?auto_209617 ) ) ( not ( = ?auto_209610 ?auto_209618 ) ) ( not ( = ?auto_209611 ?auto_209612 ) ) ( not ( = ?auto_209611 ?auto_209613 ) ) ( not ( = ?auto_209611 ?auto_209614 ) ) ( not ( = ?auto_209611 ?auto_209615 ) ) ( not ( = ?auto_209611 ?auto_209616 ) ) ( not ( = ?auto_209611 ?auto_209617 ) ) ( not ( = ?auto_209611 ?auto_209618 ) ) ( not ( = ?auto_209612 ?auto_209613 ) ) ( not ( = ?auto_209612 ?auto_209614 ) ) ( not ( = ?auto_209612 ?auto_209615 ) ) ( not ( = ?auto_209612 ?auto_209616 ) ) ( not ( = ?auto_209612 ?auto_209617 ) ) ( not ( = ?auto_209612 ?auto_209618 ) ) ( not ( = ?auto_209613 ?auto_209614 ) ) ( not ( = ?auto_209613 ?auto_209615 ) ) ( not ( = ?auto_209613 ?auto_209616 ) ) ( not ( = ?auto_209613 ?auto_209617 ) ) ( not ( = ?auto_209613 ?auto_209618 ) ) ( not ( = ?auto_209614 ?auto_209615 ) ) ( not ( = ?auto_209614 ?auto_209616 ) ) ( not ( = ?auto_209614 ?auto_209617 ) ) ( not ( = ?auto_209614 ?auto_209618 ) ) ( not ( = ?auto_209615 ?auto_209616 ) ) ( not ( = ?auto_209615 ?auto_209617 ) ) ( not ( = ?auto_209615 ?auto_209618 ) ) ( not ( = ?auto_209616 ?auto_209617 ) ) ( not ( = ?auto_209616 ?auto_209618 ) ) ( not ( = ?auto_209617 ?auto_209618 ) ) ( CLEAR ?auto_209615 ) ( ON ?auto_209616 ?auto_209617 ) ( CLEAR ?auto_209616 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_209610 ?auto_209611 ?auto_209612 ?auto_209613 ?auto_209614 ?auto_209615 ?auto_209616 )
      ( MAKE-8PILE ?auto_209610 ?auto_209611 ?auto_209612 ?auto_209613 ?auto_209614 ?auto_209615 ?auto_209616 ?auto_209617 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_209644 - BLOCK
      ?auto_209645 - BLOCK
      ?auto_209646 - BLOCK
      ?auto_209647 - BLOCK
      ?auto_209648 - BLOCK
      ?auto_209649 - BLOCK
      ?auto_209650 - BLOCK
      ?auto_209651 - BLOCK
    )
    :vars
    (
      ?auto_209652 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209651 ?auto_209652 ) ( ON-TABLE ?auto_209644 ) ( ON ?auto_209645 ?auto_209644 ) ( ON ?auto_209646 ?auto_209645 ) ( ON ?auto_209647 ?auto_209646 ) ( ON ?auto_209648 ?auto_209647 ) ( not ( = ?auto_209644 ?auto_209645 ) ) ( not ( = ?auto_209644 ?auto_209646 ) ) ( not ( = ?auto_209644 ?auto_209647 ) ) ( not ( = ?auto_209644 ?auto_209648 ) ) ( not ( = ?auto_209644 ?auto_209649 ) ) ( not ( = ?auto_209644 ?auto_209650 ) ) ( not ( = ?auto_209644 ?auto_209651 ) ) ( not ( = ?auto_209644 ?auto_209652 ) ) ( not ( = ?auto_209645 ?auto_209646 ) ) ( not ( = ?auto_209645 ?auto_209647 ) ) ( not ( = ?auto_209645 ?auto_209648 ) ) ( not ( = ?auto_209645 ?auto_209649 ) ) ( not ( = ?auto_209645 ?auto_209650 ) ) ( not ( = ?auto_209645 ?auto_209651 ) ) ( not ( = ?auto_209645 ?auto_209652 ) ) ( not ( = ?auto_209646 ?auto_209647 ) ) ( not ( = ?auto_209646 ?auto_209648 ) ) ( not ( = ?auto_209646 ?auto_209649 ) ) ( not ( = ?auto_209646 ?auto_209650 ) ) ( not ( = ?auto_209646 ?auto_209651 ) ) ( not ( = ?auto_209646 ?auto_209652 ) ) ( not ( = ?auto_209647 ?auto_209648 ) ) ( not ( = ?auto_209647 ?auto_209649 ) ) ( not ( = ?auto_209647 ?auto_209650 ) ) ( not ( = ?auto_209647 ?auto_209651 ) ) ( not ( = ?auto_209647 ?auto_209652 ) ) ( not ( = ?auto_209648 ?auto_209649 ) ) ( not ( = ?auto_209648 ?auto_209650 ) ) ( not ( = ?auto_209648 ?auto_209651 ) ) ( not ( = ?auto_209648 ?auto_209652 ) ) ( not ( = ?auto_209649 ?auto_209650 ) ) ( not ( = ?auto_209649 ?auto_209651 ) ) ( not ( = ?auto_209649 ?auto_209652 ) ) ( not ( = ?auto_209650 ?auto_209651 ) ) ( not ( = ?auto_209650 ?auto_209652 ) ) ( not ( = ?auto_209651 ?auto_209652 ) ) ( ON ?auto_209650 ?auto_209651 ) ( CLEAR ?auto_209648 ) ( ON ?auto_209649 ?auto_209650 ) ( CLEAR ?auto_209649 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_209644 ?auto_209645 ?auto_209646 ?auto_209647 ?auto_209648 ?auto_209649 )
      ( MAKE-8PILE ?auto_209644 ?auto_209645 ?auto_209646 ?auto_209647 ?auto_209648 ?auto_209649 ?auto_209650 ?auto_209651 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_209678 - BLOCK
      ?auto_209679 - BLOCK
      ?auto_209680 - BLOCK
      ?auto_209681 - BLOCK
      ?auto_209682 - BLOCK
      ?auto_209683 - BLOCK
      ?auto_209684 - BLOCK
      ?auto_209685 - BLOCK
    )
    :vars
    (
      ?auto_209686 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209685 ?auto_209686 ) ( ON-TABLE ?auto_209678 ) ( ON ?auto_209679 ?auto_209678 ) ( ON ?auto_209680 ?auto_209679 ) ( ON ?auto_209681 ?auto_209680 ) ( not ( = ?auto_209678 ?auto_209679 ) ) ( not ( = ?auto_209678 ?auto_209680 ) ) ( not ( = ?auto_209678 ?auto_209681 ) ) ( not ( = ?auto_209678 ?auto_209682 ) ) ( not ( = ?auto_209678 ?auto_209683 ) ) ( not ( = ?auto_209678 ?auto_209684 ) ) ( not ( = ?auto_209678 ?auto_209685 ) ) ( not ( = ?auto_209678 ?auto_209686 ) ) ( not ( = ?auto_209679 ?auto_209680 ) ) ( not ( = ?auto_209679 ?auto_209681 ) ) ( not ( = ?auto_209679 ?auto_209682 ) ) ( not ( = ?auto_209679 ?auto_209683 ) ) ( not ( = ?auto_209679 ?auto_209684 ) ) ( not ( = ?auto_209679 ?auto_209685 ) ) ( not ( = ?auto_209679 ?auto_209686 ) ) ( not ( = ?auto_209680 ?auto_209681 ) ) ( not ( = ?auto_209680 ?auto_209682 ) ) ( not ( = ?auto_209680 ?auto_209683 ) ) ( not ( = ?auto_209680 ?auto_209684 ) ) ( not ( = ?auto_209680 ?auto_209685 ) ) ( not ( = ?auto_209680 ?auto_209686 ) ) ( not ( = ?auto_209681 ?auto_209682 ) ) ( not ( = ?auto_209681 ?auto_209683 ) ) ( not ( = ?auto_209681 ?auto_209684 ) ) ( not ( = ?auto_209681 ?auto_209685 ) ) ( not ( = ?auto_209681 ?auto_209686 ) ) ( not ( = ?auto_209682 ?auto_209683 ) ) ( not ( = ?auto_209682 ?auto_209684 ) ) ( not ( = ?auto_209682 ?auto_209685 ) ) ( not ( = ?auto_209682 ?auto_209686 ) ) ( not ( = ?auto_209683 ?auto_209684 ) ) ( not ( = ?auto_209683 ?auto_209685 ) ) ( not ( = ?auto_209683 ?auto_209686 ) ) ( not ( = ?auto_209684 ?auto_209685 ) ) ( not ( = ?auto_209684 ?auto_209686 ) ) ( not ( = ?auto_209685 ?auto_209686 ) ) ( ON ?auto_209684 ?auto_209685 ) ( ON ?auto_209683 ?auto_209684 ) ( CLEAR ?auto_209681 ) ( ON ?auto_209682 ?auto_209683 ) ( CLEAR ?auto_209682 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_209678 ?auto_209679 ?auto_209680 ?auto_209681 ?auto_209682 )
      ( MAKE-8PILE ?auto_209678 ?auto_209679 ?auto_209680 ?auto_209681 ?auto_209682 ?auto_209683 ?auto_209684 ?auto_209685 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_209712 - BLOCK
      ?auto_209713 - BLOCK
      ?auto_209714 - BLOCK
      ?auto_209715 - BLOCK
      ?auto_209716 - BLOCK
      ?auto_209717 - BLOCK
      ?auto_209718 - BLOCK
      ?auto_209719 - BLOCK
    )
    :vars
    (
      ?auto_209720 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209719 ?auto_209720 ) ( ON-TABLE ?auto_209712 ) ( ON ?auto_209713 ?auto_209712 ) ( ON ?auto_209714 ?auto_209713 ) ( not ( = ?auto_209712 ?auto_209713 ) ) ( not ( = ?auto_209712 ?auto_209714 ) ) ( not ( = ?auto_209712 ?auto_209715 ) ) ( not ( = ?auto_209712 ?auto_209716 ) ) ( not ( = ?auto_209712 ?auto_209717 ) ) ( not ( = ?auto_209712 ?auto_209718 ) ) ( not ( = ?auto_209712 ?auto_209719 ) ) ( not ( = ?auto_209712 ?auto_209720 ) ) ( not ( = ?auto_209713 ?auto_209714 ) ) ( not ( = ?auto_209713 ?auto_209715 ) ) ( not ( = ?auto_209713 ?auto_209716 ) ) ( not ( = ?auto_209713 ?auto_209717 ) ) ( not ( = ?auto_209713 ?auto_209718 ) ) ( not ( = ?auto_209713 ?auto_209719 ) ) ( not ( = ?auto_209713 ?auto_209720 ) ) ( not ( = ?auto_209714 ?auto_209715 ) ) ( not ( = ?auto_209714 ?auto_209716 ) ) ( not ( = ?auto_209714 ?auto_209717 ) ) ( not ( = ?auto_209714 ?auto_209718 ) ) ( not ( = ?auto_209714 ?auto_209719 ) ) ( not ( = ?auto_209714 ?auto_209720 ) ) ( not ( = ?auto_209715 ?auto_209716 ) ) ( not ( = ?auto_209715 ?auto_209717 ) ) ( not ( = ?auto_209715 ?auto_209718 ) ) ( not ( = ?auto_209715 ?auto_209719 ) ) ( not ( = ?auto_209715 ?auto_209720 ) ) ( not ( = ?auto_209716 ?auto_209717 ) ) ( not ( = ?auto_209716 ?auto_209718 ) ) ( not ( = ?auto_209716 ?auto_209719 ) ) ( not ( = ?auto_209716 ?auto_209720 ) ) ( not ( = ?auto_209717 ?auto_209718 ) ) ( not ( = ?auto_209717 ?auto_209719 ) ) ( not ( = ?auto_209717 ?auto_209720 ) ) ( not ( = ?auto_209718 ?auto_209719 ) ) ( not ( = ?auto_209718 ?auto_209720 ) ) ( not ( = ?auto_209719 ?auto_209720 ) ) ( ON ?auto_209718 ?auto_209719 ) ( ON ?auto_209717 ?auto_209718 ) ( ON ?auto_209716 ?auto_209717 ) ( CLEAR ?auto_209714 ) ( ON ?auto_209715 ?auto_209716 ) ( CLEAR ?auto_209715 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_209712 ?auto_209713 ?auto_209714 ?auto_209715 )
      ( MAKE-8PILE ?auto_209712 ?auto_209713 ?auto_209714 ?auto_209715 ?auto_209716 ?auto_209717 ?auto_209718 ?auto_209719 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_209746 - BLOCK
      ?auto_209747 - BLOCK
      ?auto_209748 - BLOCK
      ?auto_209749 - BLOCK
      ?auto_209750 - BLOCK
      ?auto_209751 - BLOCK
      ?auto_209752 - BLOCK
      ?auto_209753 - BLOCK
    )
    :vars
    (
      ?auto_209754 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209753 ?auto_209754 ) ( ON-TABLE ?auto_209746 ) ( ON ?auto_209747 ?auto_209746 ) ( not ( = ?auto_209746 ?auto_209747 ) ) ( not ( = ?auto_209746 ?auto_209748 ) ) ( not ( = ?auto_209746 ?auto_209749 ) ) ( not ( = ?auto_209746 ?auto_209750 ) ) ( not ( = ?auto_209746 ?auto_209751 ) ) ( not ( = ?auto_209746 ?auto_209752 ) ) ( not ( = ?auto_209746 ?auto_209753 ) ) ( not ( = ?auto_209746 ?auto_209754 ) ) ( not ( = ?auto_209747 ?auto_209748 ) ) ( not ( = ?auto_209747 ?auto_209749 ) ) ( not ( = ?auto_209747 ?auto_209750 ) ) ( not ( = ?auto_209747 ?auto_209751 ) ) ( not ( = ?auto_209747 ?auto_209752 ) ) ( not ( = ?auto_209747 ?auto_209753 ) ) ( not ( = ?auto_209747 ?auto_209754 ) ) ( not ( = ?auto_209748 ?auto_209749 ) ) ( not ( = ?auto_209748 ?auto_209750 ) ) ( not ( = ?auto_209748 ?auto_209751 ) ) ( not ( = ?auto_209748 ?auto_209752 ) ) ( not ( = ?auto_209748 ?auto_209753 ) ) ( not ( = ?auto_209748 ?auto_209754 ) ) ( not ( = ?auto_209749 ?auto_209750 ) ) ( not ( = ?auto_209749 ?auto_209751 ) ) ( not ( = ?auto_209749 ?auto_209752 ) ) ( not ( = ?auto_209749 ?auto_209753 ) ) ( not ( = ?auto_209749 ?auto_209754 ) ) ( not ( = ?auto_209750 ?auto_209751 ) ) ( not ( = ?auto_209750 ?auto_209752 ) ) ( not ( = ?auto_209750 ?auto_209753 ) ) ( not ( = ?auto_209750 ?auto_209754 ) ) ( not ( = ?auto_209751 ?auto_209752 ) ) ( not ( = ?auto_209751 ?auto_209753 ) ) ( not ( = ?auto_209751 ?auto_209754 ) ) ( not ( = ?auto_209752 ?auto_209753 ) ) ( not ( = ?auto_209752 ?auto_209754 ) ) ( not ( = ?auto_209753 ?auto_209754 ) ) ( ON ?auto_209752 ?auto_209753 ) ( ON ?auto_209751 ?auto_209752 ) ( ON ?auto_209750 ?auto_209751 ) ( ON ?auto_209749 ?auto_209750 ) ( CLEAR ?auto_209747 ) ( ON ?auto_209748 ?auto_209749 ) ( CLEAR ?auto_209748 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_209746 ?auto_209747 ?auto_209748 )
      ( MAKE-8PILE ?auto_209746 ?auto_209747 ?auto_209748 ?auto_209749 ?auto_209750 ?auto_209751 ?auto_209752 ?auto_209753 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_209780 - BLOCK
      ?auto_209781 - BLOCK
      ?auto_209782 - BLOCK
      ?auto_209783 - BLOCK
      ?auto_209784 - BLOCK
      ?auto_209785 - BLOCK
      ?auto_209786 - BLOCK
      ?auto_209787 - BLOCK
    )
    :vars
    (
      ?auto_209788 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209787 ?auto_209788 ) ( ON-TABLE ?auto_209780 ) ( not ( = ?auto_209780 ?auto_209781 ) ) ( not ( = ?auto_209780 ?auto_209782 ) ) ( not ( = ?auto_209780 ?auto_209783 ) ) ( not ( = ?auto_209780 ?auto_209784 ) ) ( not ( = ?auto_209780 ?auto_209785 ) ) ( not ( = ?auto_209780 ?auto_209786 ) ) ( not ( = ?auto_209780 ?auto_209787 ) ) ( not ( = ?auto_209780 ?auto_209788 ) ) ( not ( = ?auto_209781 ?auto_209782 ) ) ( not ( = ?auto_209781 ?auto_209783 ) ) ( not ( = ?auto_209781 ?auto_209784 ) ) ( not ( = ?auto_209781 ?auto_209785 ) ) ( not ( = ?auto_209781 ?auto_209786 ) ) ( not ( = ?auto_209781 ?auto_209787 ) ) ( not ( = ?auto_209781 ?auto_209788 ) ) ( not ( = ?auto_209782 ?auto_209783 ) ) ( not ( = ?auto_209782 ?auto_209784 ) ) ( not ( = ?auto_209782 ?auto_209785 ) ) ( not ( = ?auto_209782 ?auto_209786 ) ) ( not ( = ?auto_209782 ?auto_209787 ) ) ( not ( = ?auto_209782 ?auto_209788 ) ) ( not ( = ?auto_209783 ?auto_209784 ) ) ( not ( = ?auto_209783 ?auto_209785 ) ) ( not ( = ?auto_209783 ?auto_209786 ) ) ( not ( = ?auto_209783 ?auto_209787 ) ) ( not ( = ?auto_209783 ?auto_209788 ) ) ( not ( = ?auto_209784 ?auto_209785 ) ) ( not ( = ?auto_209784 ?auto_209786 ) ) ( not ( = ?auto_209784 ?auto_209787 ) ) ( not ( = ?auto_209784 ?auto_209788 ) ) ( not ( = ?auto_209785 ?auto_209786 ) ) ( not ( = ?auto_209785 ?auto_209787 ) ) ( not ( = ?auto_209785 ?auto_209788 ) ) ( not ( = ?auto_209786 ?auto_209787 ) ) ( not ( = ?auto_209786 ?auto_209788 ) ) ( not ( = ?auto_209787 ?auto_209788 ) ) ( ON ?auto_209786 ?auto_209787 ) ( ON ?auto_209785 ?auto_209786 ) ( ON ?auto_209784 ?auto_209785 ) ( ON ?auto_209783 ?auto_209784 ) ( ON ?auto_209782 ?auto_209783 ) ( CLEAR ?auto_209780 ) ( ON ?auto_209781 ?auto_209782 ) ( CLEAR ?auto_209781 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_209780 ?auto_209781 )
      ( MAKE-8PILE ?auto_209780 ?auto_209781 ?auto_209782 ?auto_209783 ?auto_209784 ?auto_209785 ?auto_209786 ?auto_209787 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_209814 - BLOCK
      ?auto_209815 - BLOCK
      ?auto_209816 - BLOCK
      ?auto_209817 - BLOCK
      ?auto_209818 - BLOCK
      ?auto_209819 - BLOCK
      ?auto_209820 - BLOCK
      ?auto_209821 - BLOCK
    )
    :vars
    (
      ?auto_209822 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209821 ?auto_209822 ) ( not ( = ?auto_209814 ?auto_209815 ) ) ( not ( = ?auto_209814 ?auto_209816 ) ) ( not ( = ?auto_209814 ?auto_209817 ) ) ( not ( = ?auto_209814 ?auto_209818 ) ) ( not ( = ?auto_209814 ?auto_209819 ) ) ( not ( = ?auto_209814 ?auto_209820 ) ) ( not ( = ?auto_209814 ?auto_209821 ) ) ( not ( = ?auto_209814 ?auto_209822 ) ) ( not ( = ?auto_209815 ?auto_209816 ) ) ( not ( = ?auto_209815 ?auto_209817 ) ) ( not ( = ?auto_209815 ?auto_209818 ) ) ( not ( = ?auto_209815 ?auto_209819 ) ) ( not ( = ?auto_209815 ?auto_209820 ) ) ( not ( = ?auto_209815 ?auto_209821 ) ) ( not ( = ?auto_209815 ?auto_209822 ) ) ( not ( = ?auto_209816 ?auto_209817 ) ) ( not ( = ?auto_209816 ?auto_209818 ) ) ( not ( = ?auto_209816 ?auto_209819 ) ) ( not ( = ?auto_209816 ?auto_209820 ) ) ( not ( = ?auto_209816 ?auto_209821 ) ) ( not ( = ?auto_209816 ?auto_209822 ) ) ( not ( = ?auto_209817 ?auto_209818 ) ) ( not ( = ?auto_209817 ?auto_209819 ) ) ( not ( = ?auto_209817 ?auto_209820 ) ) ( not ( = ?auto_209817 ?auto_209821 ) ) ( not ( = ?auto_209817 ?auto_209822 ) ) ( not ( = ?auto_209818 ?auto_209819 ) ) ( not ( = ?auto_209818 ?auto_209820 ) ) ( not ( = ?auto_209818 ?auto_209821 ) ) ( not ( = ?auto_209818 ?auto_209822 ) ) ( not ( = ?auto_209819 ?auto_209820 ) ) ( not ( = ?auto_209819 ?auto_209821 ) ) ( not ( = ?auto_209819 ?auto_209822 ) ) ( not ( = ?auto_209820 ?auto_209821 ) ) ( not ( = ?auto_209820 ?auto_209822 ) ) ( not ( = ?auto_209821 ?auto_209822 ) ) ( ON ?auto_209820 ?auto_209821 ) ( ON ?auto_209819 ?auto_209820 ) ( ON ?auto_209818 ?auto_209819 ) ( ON ?auto_209817 ?auto_209818 ) ( ON ?auto_209816 ?auto_209817 ) ( ON ?auto_209815 ?auto_209816 ) ( ON ?auto_209814 ?auto_209815 ) ( CLEAR ?auto_209814 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_209814 )
      ( MAKE-8PILE ?auto_209814 ?auto_209815 ?auto_209816 ?auto_209817 ?auto_209818 ?auto_209819 ?auto_209820 ?auto_209821 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_209849 - BLOCK
      ?auto_209850 - BLOCK
      ?auto_209851 - BLOCK
      ?auto_209852 - BLOCK
      ?auto_209853 - BLOCK
      ?auto_209854 - BLOCK
      ?auto_209855 - BLOCK
      ?auto_209856 - BLOCK
      ?auto_209857 - BLOCK
    )
    :vars
    (
      ?auto_209858 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_209856 ) ( ON ?auto_209857 ?auto_209858 ) ( CLEAR ?auto_209857 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_209849 ) ( ON ?auto_209850 ?auto_209849 ) ( ON ?auto_209851 ?auto_209850 ) ( ON ?auto_209852 ?auto_209851 ) ( ON ?auto_209853 ?auto_209852 ) ( ON ?auto_209854 ?auto_209853 ) ( ON ?auto_209855 ?auto_209854 ) ( ON ?auto_209856 ?auto_209855 ) ( not ( = ?auto_209849 ?auto_209850 ) ) ( not ( = ?auto_209849 ?auto_209851 ) ) ( not ( = ?auto_209849 ?auto_209852 ) ) ( not ( = ?auto_209849 ?auto_209853 ) ) ( not ( = ?auto_209849 ?auto_209854 ) ) ( not ( = ?auto_209849 ?auto_209855 ) ) ( not ( = ?auto_209849 ?auto_209856 ) ) ( not ( = ?auto_209849 ?auto_209857 ) ) ( not ( = ?auto_209849 ?auto_209858 ) ) ( not ( = ?auto_209850 ?auto_209851 ) ) ( not ( = ?auto_209850 ?auto_209852 ) ) ( not ( = ?auto_209850 ?auto_209853 ) ) ( not ( = ?auto_209850 ?auto_209854 ) ) ( not ( = ?auto_209850 ?auto_209855 ) ) ( not ( = ?auto_209850 ?auto_209856 ) ) ( not ( = ?auto_209850 ?auto_209857 ) ) ( not ( = ?auto_209850 ?auto_209858 ) ) ( not ( = ?auto_209851 ?auto_209852 ) ) ( not ( = ?auto_209851 ?auto_209853 ) ) ( not ( = ?auto_209851 ?auto_209854 ) ) ( not ( = ?auto_209851 ?auto_209855 ) ) ( not ( = ?auto_209851 ?auto_209856 ) ) ( not ( = ?auto_209851 ?auto_209857 ) ) ( not ( = ?auto_209851 ?auto_209858 ) ) ( not ( = ?auto_209852 ?auto_209853 ) ) ( not ( = ?auto_209852 ?auto_209854 ) ) ( not ( = ?auto_209852 ?auto_209855 ) ) ( not ( = ?auto_209852 ?auto_209856 ) ) ( not ( = ?auto_209852 ?auto_209857 ) ) ( not ( = ?auto_209852 ?auto_209858 ) ) ( not ( = ?auto_209853 ?auto_209854 ) ) ( not ( = ?auto_209853 ?auto_209855 ) ) ( not ( = ?auto_209853 ?auto_209856 ) ) ( not ( = ?auto_209853 ?auto_209857 ) ) ( not ( = ?auto_209853 ?auto_209858 ) ) ( not ( = ?auto_209854 ?auto_209855 ) ) ( not ( = ?auto_209854 ?auto_209856 ) ) ( not ( = ?auto_209854 ?auto_209857 ) ) ( not ( = ?auto_209854 ?auto_209858 ) ) ( not ( = ?auto_209855 ?auto_209856 ) ) ( not ( = ?auto_209855 ?auto_209857 ) ) ( not ( = ?auto_209855 ?auto_209858 ) ) ( not ( = ?auto_209856 ?auto_209857 ) ) ( not ( = ?auto_209856 ?auto_209858 ) ) ( not ( = ?auto_209857 ?auto_209858 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_209857 ?auto_209858 )
      ( !STACK ?auto_209857 ?auto_209856 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_209887 - BLOCK
      ?auto_209888 - BLOCK
      ?auto_209889 - BLOCK
      ?auto_209890 - BLOCK
      ?auto_209891 - BLOCK
      ?auto_209892 - BLOCK
      ?auto_209893 - BLOCK
      ?auto_209894 - BLOCK
      ?auto_209895 - BLOCK
    )
    :vars
    (
      ?auto_209896 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209895 ?auto_209896 ) ( ON-TABLE ?auto_209887 ) ( ON ?auto_209888 ?auto_209887 ) ( ON ?auto_209889 ?auto_209888 ) ( ON ?auto_209890 ?auto_209889 ) ( ON ?auto_209891 ?auto_209890 ) ( ON ?auto_209892 ?auto_209891 ) ( ON ?auto_209893 ?auto_209892 ) ( not ( = ?auto_209887 ?auto_209888 ) ) ( not ( = ?auto_209887 ?auto_209889 ) ) ( not ( = ?auto_209887 ?auto_209890 ) ) ( not ( = ?auto_209887 ?auto_209891 ) ) ( not ( = ?auto_209887 ?auto_209892 ) ) ( not ( = ?auto_209887 ?auto_209893 ) ) ( not ( = ?auto_209887 ?auto_209894 ) ) ( not ( = ?auto_209887 ?auto_209895 ) ) ( not ( = ?auto_209887 ?auto_209896 ) ) ( not ( = ?auto_209888 ?auto_209889 ) ) ( not ( = ?auto_209888 ?auto_209890 ) ) ( not ( = ?auto_209888 ?auto_209891 ) ) ( not ( = ?auto_209888 ?auto_209892 ) ) ( not ( = ?auto_209888 ?auto_209893 ) ) ( not ( = ?auto_209888 ?auto_209894 ) ) ( not ( = ?auto_209888 ?auto_209895 ) ) ( not ( = ?auto_209888 ?auto_209896 ) ) ( not ( = ?auto_209889 ?auto_209890 ) ) ( not ( = ?auto_209889 ?auto_209891 ) ) ( not ( = ?auto_209889 ?auto_209892 ) ) ( not ( = ?auto_209889 ?auto_209893 ) ) ( not ( = ?auto_209889 ?auto_209894 ) ) ( not ( = ?auto_209889 ?auto_209895 ) ) ( not ( = ?auto_209889 ?auto_209896 ) ) ( not ( = ?auto_209890 ?auto_209891 ) ) ( not ( = ?auto_209890 ?auto_209892 ) ) ( not ( = ?auto_209890 ?auto_209893 ) ) ( not ( = ?auto_209890 ?auto_209894 ) ) ( not ( = ?auto_209890 ?auto_209895 ) ) ( not ( = ?auto_209890 ?auto_209896 ) ) ( not ( = ?auto_209891 ?auto_209892 ) ) ( not ( = ?auto_209891 ?auto_209893 ) ) ( not ( = ?auto_209891 ?auto_209894 ) ) ( not ( = ?auto_209891 ?auto_209895 ) ) ( not ( = ?auto_209891 ?auto_209896 ) ) ( not ( = ?auto_209892 ?auto_209893 ) ) ( not ( = ?auto_209892 ?auto_209894 ) ) ( not ( = ?auto_209892 ?auto_209895 ) ) ( not ( = ?auto_209892 ?auto_209896 ) ) ( not ( = ?auto_209893 ?auto_209894 ) ) ( not ( = ?auto_209893 ?auto_209895 ) ) ( not ( = ?auto_209893 ?auto_209896 ) ) ( not ( = ?auto_209894 ?auto_209895 ) ) ( not ( = ?auto_209894 ?auto_209896 ) ) ( not ( = ?auto_209895 ?auto_209896 ) ) ( CLEAR ?auto_209893 ) ( ON ?auto_209894 ?auto_209895 ) ( CLEAR ?auto_209894 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_209887 ?auto_209888 ?auto_209889 ?auto_209890 ?auto_209891 ?auto_209892 ?auto_209893 ?auto_209894 )
      ( MAKE-9PILE ?auto_209887 ?auto_209888 ?auto_209889 ?auto_209890 ?auto_209891 ?auto_209892 ?auto_209893 ?auto_209894 ?auto_209895 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_209925 - BLOCK
      ?auto_209926 - BLOCK
      ?auto_209927 - BLOCK
      ?auto_209928 - BLOCK
      ?auto_209929 - BLOCK
      ?auto_209930 - BLOCK
      ?auto_209931 - BLOCK
      ?auto_209932 - BLOCK
      ?auto_209933 - BLOCK
    )
    :vars
    (
      ?auto_209934 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209933 ?auto_209934 ) ( ON-TABLE ?auto_209925 ) ( ON ?auto_209926 ?auto_209925 ) ( ON ?auto_209927 ?auto_209926 ) ( ON ?auto_209928 ?auto_209927 ) ( ON ?auto_209929 ?auto_209928 ) ( ON ?auto_209930 ?auto_209929 ) ( not ( = ?auto_209925 ?auto_209926 ) ) ( not ( = ?auto_209925 ?auto_209927 ) ) ( not ( = ?auto_209925 ?auto_209928 ) ) ( not ( = ?auto_209925 ?auto_209929 ) ) ( not ( = ?auto_209925 ?auto_209930 ) ) ( not ( = ?auto_209925 ?auto_209931 ) ) ( not ( = ?auto_209925 ?auto_209932 ) ) ( not ( = ?auto_209925 ?auto_209933 ) ) ( not ( = ?auto_209925 ?auto_209934 ) ) ( not ( = ?auto_209926 ?auto_209927 ) ) ( not ( = ?auto_209926 ?auto_209928 ) ) ( not ( = ?auto_209926 ?auto_209929 ) ) ( not ( = ?auto_209926 ?auto_209930 ) ) ( not ( = ?auto_209926 ?auto_209931 ) ) ( not ( = ?auto_209926 ?auto_209932 ) ) ( not ( = ?auto_209926 ?auto_209933 ) ) ( not ( = ?auto_209926 ?auto_209934 ) ) ( not ( = ?auto_209927 ?auto_209928 ) ) ( not ( = ?auto_209927 ?auto_209929 ) ) ( not ( = ?auto_209927 ?auto_209930 ) ) ( not ( = ?auto_209927 ?auto_209931 ) ) ( not ( = ?auto_209927 ?auto_209932 ) ) ( not ( = ?auto_209927 ?auto_209933 ) ) ( not ( = ?auto_209927 ?auto_209934 ) ) ( not ( = ?auto_209928 ?auto_209929 ) ) ( not ( = ?auto_209928 ?auto_209930 ) ) ( not ( = ?auto_209928 ?auto_209931 ) ) ( not ( = ?auto_209928 ?auto_209932 ) ) ( not ( = ?auto_209928 ?auto_209933 ) ) ( not ( = ?auto_209928 ?auto_209934 ) ) ( not ( = ?auto_209929 ?auto_209930 ) ) ( not ( = ?auto_209929 ?auto_209931 ) ) ( not ( = ?auto_209929 ?auto_209932 ) ) ( not ( = ?auto_209929 ?auto_209933 ) ) ( not ( = ?auto_209929 ?auto_209934 ) ) ( not ( = ?auto_209930 ?auto_209931 ) ) ( not ( = ?auto_209930 ?auto_209932 ) ) ( not ( = ?auto_209930 ?auto_209933 ) ) ( not ( = ?auto_209930 ?auto_209934 ) ) ( not ( = ?auto_209931 ?auto_209932 ) ) ( not ( = ?auto_209931 ?auto_209933 ) ) ( not ( = ?auto_209931 ?auto_209934 ) ) ( not ( = ?auto_209932 ?auto_209933 ) ) ( not ( = ?auto_209932 ?auto_209934 ) ) ( not ( = ?auto_209933 ?auto_209934 ) ) ( ON ?auto_209932 ?auto_209933 ) ( CLEAR ?auto_209930 ) ( ON ?auto_209931 ?auto_209932 ) ( CLEAR ?auto_209931 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_209925 ?auto_209926 ?auto_209927 ?auto_209928 ?auto_209929 ?auto_209930 ?auto_209931 )
      ( MAKE-9PILE ?auto_209925 ?auto_209926 ?auto_209927 ?auto_209928 ?auto_209929 ?auto_209930 ?auto_209931 ?auto_209932 ?auto_209933 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_209963 - BLOCK
      ?auto_209964 - BLOCK
      ?auto_209965 - BLOCK
      ?auto_209966 - BLOCK
      ?auto_209967 - BLOCK
      ?auto_209968 - BLOCK
      ?auto_209969 - BLOCK
      ?auto_209970 - BLOCK
      ?auto_209971 - BLOCK
    )
    :vars
    (
      ?auto_209972 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209971 ?auto_209972 ) ( ON-TABLE ?auto_209963 ) ( ON ?auto_209964 ?auto_209963 ) ( ON ?auto_209965 ?auto_209964 ) ( ON ?auto_209966 ?auto_209965 ) ( ON ?auto_209967 ?auto_209966 ) ( not ( = ?auto_209963 ?auto_209964 ) ) ( not ( = ?auto_209963 ?auto_209965 ) ) ( not ( = ?auto_209963 ?auto_209966 ) ) ( not ( = ?auto_209963 ?auto_209967 ) ) ( not ( = ?auto_209963 ?auto_209968 ) ) ( not ( = ?auto_209963 ?auto_209969 ) ) ( not ( = ?auto_209963 ?auto_209970 ) ) ( not ( = ?auto_209963 ?auto_209971 ) ) ( not ( = ?auto_209963 ?auto_209972 ) ) ( not ( = ?auto_209964 ?auto_209965 ) ) ( not ( = ?auto_209964 ?auto_209966 ) ) ( not ( = ?auto_209964 ?auto_209967 ) ) ( not ( = ?auto_209964 ?auto_209968 ) ) ( not ( = ?auto_209964 ?auto_209969 ) ) ( not ( = ?auto_209964 ?auto_209970 ) ) ( not ( = ?auto_209964 ?auto_209971 ) ) ( not ( = ?auto_209964 ?auto_209972 ) ) ( not ( = ?auto_209965 ?auto_209966 ) ) ( not ( = ?auto_209965 ?auto_209967 ) ) ( not ( = ?auto_209965 ?auto_209968 ) ) ( not ( = ?auto_209965 ?auto_209969 ) ) ( not ( = ?auto_209965 ?auto_209970 ) ) ( not ( = ?auto_209965 ?auto_209971 ) ) ( not ( = ?auto_209965 ?auto_209972 ) ) ( not ( = ?auto_209966 ?auto_209967 ) ) ( not ( = ?auto_209966 ?auto_209968 ) ) ( not ( = ?auto_209966 ?auto_209969 ) ) ( not ( = ?auto_209966 ?auto_209970 ) ) ( not ( = ?auto_209966 ?auto_209971 ) ) ( not ( = ?auto_209966 ?auto_209972 ) ) ( not ( = ?auto_209967 ?auto_209968 ) ) ( not ( = ?auto_209967 ?auto_209969 ) ) ( not ( = ?auto_209967 ?auto_209970 ) ) ( not ( = ?auto_209967 ?auto_209971 ) ) ( not ( = ?auto_209967 ?auto_209972 ) ) ( not ( = ?auto_209968 ?auto_209969 ) ) ( not ( = ?auto_209968 ?auto_209970 ) ) ( not ( = ?auto_209968 ?auto_209971 ) ) ( not ( = ?auto_209968 ?auto_209972 ) ) ( not ( = ?auto_209969 ?auto_209970 ) ) ( not ( = ?auto_209969 ?auto_209971 ) ) ( not ( = ?auto_209969 ?auto_209972 ) ) ( not ( = ?auto_209970 ?auto_209971 ) ) ( not ( = ?auto_209970 ?auto_209972 ) ) ( not ( = ?auto_209971 ?auto_209972 ) ) ( ON ?auto_209970 ?auto_209971 ) ( ON ?auto_209969 ?auto_209970 ) ( CLEAR ?auto_209967 ) ( ON ?auto_209968 ?auto_209969 ) ( CLEAR ?auto_209968 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_209963 ?auto_209964 ?auto_209965 ?auto_209966 ?auto_209967 ?auto_209968 )
      ( MAKE-9PILE ?auto_209963 ?auto_209964 ?auto_209965 ?auto_209966 ?auto_209967 ?auto_209968 ?auto_209969 ?auto_209970 ?auto_209971 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_210001 - BLOCK
      ?auto_210002 - BLOCK
      ?auto_210003 - BLOCK
      ?auto_210004 - BLOCK
      ?auto_210005 - BLOCK
      ?auto_210006 - BLOCK
      ?auto_210007 - BLOCK
      ?auto_210008 - BLOCK
      ?auto_210009 - BLOCK
    )
    :vars
    (
      ?auto_210010 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_210009 ?auto_210010 ) ( ON-TABLE ?auto_210001 ) ( ON ?auto_210002 ?auto_210001 ) ( ON ?auto_210003 ?auto_210002 ) ( ON ?auto_210004 ?auto_210003 ) ( not ( = ?auto_210001 ?auto_210002 ) ) ( not ( = ?auto_210001 ?auto_210003 ) ) ( not ( = ?auto_210001 ?auto_210004 ) ) ( not ( = ?auto_210001 ?auto_210005 ) ) ( not ( = ?auto_210001 ?auto_210006 ) ) ( not ( = ?auto_210001 ?auto_210007 ) ) ( not ( = ?auto_210001 ?auto_210008 ) ) ( not ( = ?auto_210001 ?auto_210009 ) ) ( not ( = ?auto_210001 ?auto_210010 ) ) ( not ( = ?auto_210002 ?auto_210003 ) ) ( not ( = ?auto_210002 ?auto_210004 ) ) ( not ( = ?auto_210002 ?auto_210005 ) ) ( not ( = ?auto_210002 ?auto_210006 ) ) ( not ( = ?auto_210002 ?auto_210007 ) ) ( not ( = ?auto_210002 ?auto_210008 ) ) ( not ( = ?auto_210002 ?auto_210009 ) ) ( not ( = ?auto_210002 ?auto_210010 ) ) ( not ( = ?auto_210003 ?auto_210004 ) ) ( not ( = ?auto_210003 ?auto_210005 ) ) ( not ( = ?auto_210003 ?auto_210006 ) ) ( not ( = ?auto_210003 ?auto_210007 ) ) ( not ( = ?auto_210003 ?auto_210008 ) ) ( not ( = ?auto_210003 ?auto_210009 ) ) ( not ( = ?auto_210003 ?auto_210010 ) ) ( not ( = ?auto_210004 ?auto_210005 ) ) ( not ( = ?auto_210004 ?auto_210006 ) ) ( not ( = ?auto_210004 ?auto_210007 ) ) ( not ( = ?auto_210004 ?auto_210008 ) ) ( not ( = ?auto_210004 ?auto_210009 ) ) ( not ( = ?auto_210004 ?auto_210010 ) ) ( not ( = ?auto_210005 ?auto_210006 ) ) ( not ( = ?auto_210005 ?auto_210007 ) ) ( not ( = ?auto_210005 ?auto_210008 ) ) ( not ( = ?auto_210005 ?auto_210009 ) ) ( not ( = ?auto_210005 ?auto_210010 ) ) ( not ( = ?auto_210006 ?auto_210007 ) ) ( not ( = ?auto_210006 ?auto_210008 ) ) ( not ( = ?auto_210006 ?auto_210009 ) ) ( not ( = ?auto_210006 ?auto_210010 ) ) ( not ( = ?auto_210007 ?auto_210008 ) ) ( not ( = ?auto_210007 ?auto_210009 ) ) ( not ( = ?auto_210007 ?auto_210010 ) ) ( not ( = ?auto_210008 ?auto_210009 ) ) ( not ( = ?auto_210008 ?auto_210010 ) ) ( not ( = ?auto_210009 ?auto_210010 ) ) ( ON ?auto_210008 ?auto_210009 ) ( ON ?auto_210007 ?auto_210008 ) ( ON ?auto_210006 ?auto_210007 ) ( CLEAR ?auto_210004 ) ( ON ?auto_210005 ?auto_210006 ) ( CLEAR ?auto_210005 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_210001 ?auto_210002 ?auto_210003 ?auto_210004 ?auto_210005 )
      ( MAKE-9PILE ?auto_210001 ?auto_210002 ?auto_210003 ?auto_210004 ?auto_210005 ?auto_210006 ?auto_210007 ?auto_210008 ?auto_210009 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_210039 - BLOCK
      ?auto_210040 - BLOCK
      ?auto_210041 - BLOCK
      ?auto_210042 - BLOCK
      ?auto_210043 - BLOCK
      ?auto_210044 - BLOCK
      ?auto_210045 - BLOCK
      ?auto_210046 - BLOCK
      ?auto_210047 - BLOCK
    )
    :vars
    (
      ?auto_210048 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_210047 ?auto_210048 ) ( ON-TABLE ?auto_210039 ) ( ON ?auto_210040 ?auto_210039 ) ( ON ?auto_210041 ?auto_210040 ) ( not ( = ?auto_210039 ?auto_210040 ) ) ( not ( = ?auto_210039 ?auto_210041 ) ) ( not ( = ?auto_210039 ?auto_210042 ) ) ( not ( = ?auto_210039 ?auto_210043 ) ) ( not ( = ?auto_210039 ?auto_210044 ) ) ( not ( = ?auto_210039 ?auto_210045 ) ) ( not ( = ?auto_210039 ?auto_210046 ) ) ( not ( = ?auto_210039 ?auto_210047 ) ) ( not ( = ?auto_210039 ?auto_210048 ) ) ( not ( = ?auto_210040 ?auto_210041 ) ) ( not ( = ?auto_210040 ?auto_210042 ) ) ( not ( = ?auto_210040 ?auto_210043 ) ) ( not ( = ?auto_210040 ?auto_210044 ) ) ( not ( = ?auto_210040 ?auto_210045 ) ) ( not ( = ?auto_210040 ?auto_210046 ) ) ( not ( = ?auto_210040 ?auto_210047 ) ) ( not ( = ?auto_210040 ?auto_210048 ) ) ( not ( = ?auto_210041 ?auto_210042 ) ) ( not ( = ?auto_210041 ?auto_210043 ) ) ( not ( = ?auto_210041 ?auto_210044 ) ) ( not ( = ?auto_210041 ?auto_210045 ) ) ( not ( = ?auto_210041 ?auto_210046 ) ) ( not ( = ?auto_210041 ?auto_210047 ) ) ( not ( = ?auto_210041 ?auto_210048 ) ) ( not ( = ?auto_210042 ?auto_210043 ) ) ( not ( = ?auto_210042 ?auto_210044 ) ) ( not ( = ?auto_210042 ?auto_210045 ) ) ( not ( = ?auto_210042 ?auto_210046 ) ) ( not ( = ?auto_210042 ?auto_210047 ) ) ( not ( = ?auto_210042 ?auto_210048 ) ) ( not ( = ?auto_210043 ?auto_210044 ) ) ( not ( = ?auto_210043 ?auto_210045 ) ) ( not ( = ?auto_210043 ?auto_210046 ) ) ( not ( = ?auto_210043 ?auto_210047 ) ) ( not ( = ?auto_210043 ?auto_210048 ) ) ( not ( = ?auto_210044 ?auto_210045 ) ) ( not ( = ?auto_210044 ?auto_210046 ) ) ( not ( = ?auto_210044 ?auto_210047 ) ) ( not ( = ?auto_210044 ?auto_210048 ) ) ( not ( = ?auto_210045 ?auto_210046 ) ) ( not ( = ?auto_210045 ?auto_210047 ) ) ( not ( = ?auto_210045 ?auto_210048 ) ) ( not ( = ?auto_210046 ?auto_210047 ) ) ( not ( = ?auto_210046 ?auto_210048 ) ) ( not ( = ?auto_210047 ?auto_210048 ) ) ( ON ?auto_210046 ?auto_210047 ) ( ON ?auto_210045 ?auto_210046 ) ( ON ?auto_210044 ?auto_210045 ) ( ON ?auto_210043 ?auto_210044 ) ( CLEAR ?auto_210041 ) ( ON ?auto_210042 ?auto_210043 ) ( CLEAR ?auto_210042 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_210039 ?auto_210040 ?auto_210041 ?auto_210042 )
      ( MAKE-9PILE ?auto_210039 ?auto_210040 ?auto_210041 ?auto_210042 ?auto_210043 ?auto_210044 ?auto_210045 ?auto_210046 ?auto_210047 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_210077 - BLOCK
      ?auto_210078 - BLOCK
      ?auto_210079 - BLOCK
      ?auto_210080 - BLOCK
      ?auto_210081 - BLOCK
      ?auto_210082 - BLOCK
      ?auto_210083 - BLOCK
      ?auto_210084 - BLOCK
      ?auto_210085 - BLOCK
    )
    :vars
    (
      ?auto_210086 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_210085 ?auto_210086 ) ( ON-TABLE ?auto_210077 ) ( ON ?auto_210078 ?auto_210077 ) ( not ( = ?auto_210077 ?auto_210078 ) ) ( not ( = ?auto_210077 ?auto_210079 ) ) ( not ( = ?auto_210077 ?auto_210080 ) ) ( not ( = ?auto_210077 ?auto_210081 ) ) ( not ( = ?auto_210077 ?auto_210082 ) ) ( not ( = ?auto_210077 ?auto_210083 ) ) ( not ( = ?auto_210077 ?auto_210084 ) ) ( not ( = ?auto_210077 ?auto_210085 ) ) ( not ( = ?auto_210077 ?auto_210086 ) ) ( not ( = ?auto_210078 ?auto_210079 ) ) ( not ( = ?auto_210078 ?auto_210080 ) ) ( not ( = ?auto_210078 ?auto_210081 ) ) ( not ( = ?auto_210078 ?auto_210082 ) ) ( not ( = ?auto_210078 ?auto_210083 ) ) ( not ( = ?auto_210078 ?auto_210084 ) ) ( not ( = ?auto_210078 ?auto_210085 ) ) ( not ( = ?auto_210078 ?auto_210086 ) ) ( not ( = ?auto_210079 ?auto_210080 ) ) ( not ( = ?auto_210079 ?auto_210081 ) ) ( not ( = ?auto_210079 ?auto_210082 ) ) ( not ( = ?auto_210079 ?auto_210083 ) ) ( not ( = ?auto_210079 ?auto_210084 ) ) ( not ( = ?auto_210079 ?auto_210085 ) ) ( not ( = ?auto_210079 ?auto_210086 ) ) ( not ( = ?auto_210080 ?auto_210081 ) ) ( not ( = ?auto_210080 ?auto_210082 ) ) ( not ( = ?auto_210080 ?auto_210083 ) ) ( not ( = ?auto_210080 ?auto_210084 ) ) ( not ( = ?auto_210080 ?auto_210085 ) ) ( not ( = ?auto_210080 ?auto_210086 ) ) ( not ( = ?auto_210081 ?auto_210082 ) ) ( not ( = ?auto_210081 ?auto_210083 ) ) ( not ( = ?auto_210081 ?auto_210084 ) ) ( not ( = ?auto_210081 ?auto_210085 ) ) ( not ( = ?auto_210081 ?auto_210086 ) ) ( not ( = ?auto_210082 ?auto_210083 ) ) ( not ( = ?auto_210082 ?auto_210084 ) ) ( not ( = ?auto_210082 ?auto_210085 ) ) ( not ( = ?auto_210082 ?auto_210086 ) ) ( not ( = ?auto_210083 ?auto_210084 ) ) ( not ( = ?auto_210083 ?auto_210085 ) ) ( not ( = ?auto_210083 ?auto_210086 ) ) ( not ( = ?auto_210084 ?auto_210085 ) ) ( not ( = ?auto_210084 ?auto_210086 ) ) ( not ( = ?auto_210085 ?auto_210086 ) ) ( ON ?auto_210084 ?auto_210085 ) ( ON ?auto_210083 ?auto_210084 ) ( ON ?auto_210082 ?auto_210083 ) ( ON ?auto_210081 ?auto_210082 ) ( ON ?auto_210080 ?auto_210081 ) ( CLEAR ?auto_210078 ) ( ON ?auto_210079 ?auto_210080 ) ( CLEAR ?auto_210079 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_210077 ?auto_210078 ?auto_210079 )
      ( MAKE-9PILE ?auto_210077 ?auto_210078 ?auto_210079 ?auto_210080 ?auto_210081 ?auto_210082 ?auto_210083 ?auto_210084 ?auto_210085 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_210115 - BLOCK
      ?auto_210116 - BLOCK
      ?auto_210117 - BLOCK
      ?auto_210118 - BLOCK
      ?auto_210119 - BLOCK
      ?auto_210120 - BLOCK
      ?auto_210121 - BLOCK
      ?auto_210122 - BLOCK
      ?auto_210123 - BLOCK
    )
    :vars
    (
      ?auto_210124 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_210123 ?auto_210124 ) ( ON-TABLE ?auto_210115 ) ( not ( = ?auto_210115 ?auto_210116 ) ) ( not ( = ?auto_210115 ?auto_210117 ) ) ( not ( = ?auto_210115 ?auto_210118 ) ) ( not ( = ?auto_210115 ?auto_210119 ) ) ( not ( = ?auto_210115 ?auto_210120 ) ) ( not ( = ?auto_210115 ?auto_210121 ) ) ( not ( = ?auto_210115 ?auto_210122 ) ) ( not ( = ?auto_210115 ?auto_210123 ) ) ( not ( = ?auto_210115 ?auto_210124 ) ) ( not ( = ?auto_210116 ?auto_210117 ) ) ( not ( = ?auto_210116 ?auto_210118 ) ) ( not ( = ?auto_210116 ?auto_210119 ) ) ( not ( = ?auto_210116 ?auto_210120 ) ) ( not ( = ?auto_210116 ?auto_210121 ) ) ( not ( = ?auto_210116 ?auto_210122 ) ) ( not ( = ?auto_210116 ?auto_210123 ) ) ( not ( = ?auto_210116 ?auto_210124 ) ) ( not ( = ?auto_210117 ?auto_210118 ) ) ( not ( = ?auto_210117 ?auto_210119 ) ) ( not ( = ?auto_210117 ?auto_210120 ) ) ( not ( = ?auto_210117 ?auto_210121 ) ) ( not ( = ?auto_210117 ?auto_210122 ) ) ( not ( = ?auto_210117 ?auto_210123 ) ) ( not ( = ?auto_210117 ?auto_210124 ) ) ( not ( = ?auto_210118 ?auto_210119 ) ) ( not ( = ?auto_210118 ?auto_210120 ) ) ( not ( = ?auto_210118 ?auto_210121 ) ) ( not ( = ?auto_210118 ?auto_210122 ) ) ( not ( = ?auto_210118 ?auto_210123 ) ) ( not ( = ?auto_210118 ?auto_210124 ) ) ( not ( = ?auto_210119 ?auto_210120 ) ) ( not ( = ?auto_210119 ?auto_210121 ) ) ( not ( = ?auto_210119 ?auto_210122 ) ) ( not ( = ?auto_210119 ?auto_210123 ) ) ( not ( = ?auto_210119 ?auto_210124 ) ) ( not ( = ?auto_210120 ?auto_210121 ) ) ( not ( = ?auto_210120 ?auto_210122 ) ) ( not ( = ?auto_210120 ?auto_210123 ) ) ( not ( = ?auto_210120 ?auto_210124 ) ) ( not ( = ?auto_210121 ?auto_210122 ) ) ( not ( = ?auto_210121 ?auto_210123 ) ) ( not ( = ?auto_210121 ?auto_210124 ) ) ( not ( = ?auto_210122 ?auto_210123 ) ) ( not ( = ?auto_210122 ?auto_210124 ) ) ( not ( = ?auto_210123 ?auto_210124 ) ) ( ON ?auto_210122 ?auto_210123 ) ( ON ?auto_210121 ?auto_210122 ) ( ON ?auto_210120 ?auto_210121 ) ( ON ?auto_210119 ?auto_210120 ) ( ON ?auto_210118 ?auto_210119 ) ( ON ?auto_210117 ?auto_210118 ) ( CLEAR ?auto_210115 ) ( ON ?auto_210116 ?auto_210117 ) ( CLEAR ?auto_210116 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_210115 ?auto_210116 )
      ( MAKE-9PILE ?auto_210115 ?auto_210116 ?auto_210117 ?auto_210118 ?auto_210119 ?auto_210120 ?auto_210121 ?auto_210122 ?auto_210123 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_210153 - BLOCK
      ?auto_210154 - BLOCK
      ?auto_210155 - BLOCK
      ?auto_210156 - BLOCK
      ?auto_210157 - BLOCK
      ?auto_210158 - BLOCK
      ?auto_210159 - BLOCK
      ?auto_210160 - BLOCK
      ?auto_210161 - BLOCK
    )
    :vars
    (
      ?auto_210162 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_210161 ?auto_210162 ) ( not ( = ?auto_210153 ?auto_210154 ) ) ( not ( = ?auto_210153 ?auto_210155 ) ) ( not ( = ?auto_210153 ?auto_210156 ) ) ( not ( = ?auto_210153 ?auto_210157 ) ) ( not ( = ?auto_210153 ?auto_210158 ) ) ( not ( = ?auto_210153 ?auto_210159 ) ) ( not ( = ?auto_210153 ?auto_210160 ) ) ( not ( = ?auto_210153 ?auto_210161 ) ) ( not ( = ?auto_210153 ?auto_210162 ) ) ( not ( = ?auto_210154 ?auto_210155 ) ) ( not ( = ?auto_210154 ?auto_210156 ) ) ( not ( = ?auto_210154 ?auto_210157 ) ) ( not ( = ?auto_210154 ?auto_210158 ) ) ( not ( = ?auto_210154 ?auto_210159 ) ) ( not ( = ?auto_210154 ?auto_210160 ) ) ( not ( = ?auto_210154 ?auto_210161 ) ) ( not ( = ?auto_210154 ?auto_210162 ) ) ( not ( = ?auto_210155 ?auto_210156 ) ) ( not ( = ?auto_210155 ?auto_210157 ) ) ( not ( = ?auto_210155 ?auto_210158 ) ) ( not ( = ?auto_210155 ?auto_210159 ) ) ( not ( = ?auto_210155 ?auto_210160 ) ) ( not ( = ?auto_210155 ?auto_210161 ) ) ( not ( = ?auto_210155 ?auto_210162 ) ) ( not ( = ?auto_210156 ?auto_210157 ) ) ( not ( = ?auto_210156 ?auto_210158 ) ) ( not ( = ?auto_210156 ?auto_210159 ) ) ( not ( = ?auto_210156 ?auto_210160 ) ) ( not ( = ?auto_210156 ?auto_210161 ) ) ( not ( = ?auto_210156 ?auto_210162 ) ) ( not ( = ?auto_210157 ?auto_210158 ) ) ( not ( = ?auto_210157 ?auto_210159 ) ) ( not ( = ?auto_210157 ?auto_210160 ) ) ( not ( = ?auto_210157 ?auto_210161 ) ) ( not ( = ?auto_210157 ?auto_210162 ) ) ( not ( = ?auto_210158 ?auto_210159 ) ) ( not ( = ?auto_210158 ?auto_210160 ) ) ( not ( = ?auto_210158 ?auto_210161 ) ) ( not ( = ?auto_210158 ?auto_210162 ) ) ( not ( = ?auto_210159 ?auto_210160 ) ) ( not ( = ?auto_210159 ?auto_210161 ) ) ( not ( = ?auto_210159 ?auto_210162 ) ) ( not ( = ?auto_210160 ?auto_210161 ) ) ( not ( = ?auto_210160 ?auto_210162 ) ) ( not ( = ?auto_210161 ?auto_210162 ) ) ( ON ?auto_210160 ?auto_210161 ) ( ON ?auto_210159 ?auto_210160 ) ( ON ?auto_210158 ?auto_210159 ) ( ON ?auto_210157 ?auto_210158 ) ( ON ?auto_210156 ?auto_210157 ) ( ON ?auto_210155 ?auto_210156 ) ( ON ?auto_210154 ?auto_210155 ) ( ON ?auto_210153 ?auto_210154 ) ( CLEAR ?auto_210153 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_210153 )
      ( MAKE-9PILE ?auto_210153 ?auto_210154 ?auto_210155 ?auto_210156 ?auto_210157 ?auto_210158 ?auto_210159 ?auto_210160 ?auto_210161 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_210192 - BLOCK
      ?auto_210193 - BLOCK
      ?auto_210194 - BLOCK
      ?auto_210195 - BLOCK
      ?auto_210196 - BLOCK
      ?auto_210197 - BLOCK
      ?auto_210198 - BLOCK
      ?auto_210199 - BLOCK
      ?auto_210200 - BLOCK
      ?auto_210201 - BLOCK
    )
    :vars
    (
      ?auto_210202 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_210200 ) ( ON ?auto_210201 ?auto_210202 ) ( CLEAR ?auto_210201 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_210192 ) ( ON ?auto_210193 ?auto_210192 ) ( ON ?auto_210194 ?auto_210193 ) ( ON ?auto_210195 ?auto_210194 ) ( ON ?auto_210196 ?auto_210195 ) ( ON ?auto_210197 ?auto_210196 ) ( ON ?auto_210198 ?auto_210197 ) ( ON ?auto_210199 ?auto_210198 ) ( ON ?auto_210200 ?auto_210199 ) ( not ( = ?auto_210192 ?auto_210193 ) ) ( not ( = ?auto_210192 ?auto_210194 ) ) ( not ( = ?auto_210192 ?auto_210195 ) ) ( not ( = ?auto_210192 ?auto_210196 ) ) ( not ( = ?auto_210192 ?auto_210197 ) ) ( not ( = ?auto_210192 ?auto_210198 ) ) ( not ( = ?auto_210192 ?auto_210199 ) ) ( not ( = ?auto_210192 ?auto_210200 ) ) ( not ( = ?auto_210192 ?auto_210201 ) ) ( not ( = ?auto_210192 ?auto_210202 ) ) ( not ( = ?auto_210193 ?auto_210194 ) ) ( not ( = ?auto_210193 ?auto_210195 ) ) ( not ( = ?auto_210193 ?auto_210196 ) ) ( not ( = ?auto_210193 ?auto_210197 ) ) ( not ( = ?auto_210193 ?auto_210198 ) ) ( not ( = ?auto_210193 ?auto_210199 ) ) ( not ( = ?auto_210193 ?auto_210200 ) ) ( not ( = ?auto_210193 ?auto_210201 ) ) ( not ( = ?auto_210193 ?auto_210202 ) ) ( not ( = ?auto_210194 ?auto_210195 ) ) ( not ( = ?auto_210194 ?auto_210196 ) ) ( not ( = ?auto_210194 ?auto_210197 ) ) ( not ( = ?auto_210194 ?auto_210198 ) ) ( not ( = ?auto_210194 ?auto_210199 ) ) ( not ( = ?auto_210194 ?auto_210200 ) ) ( not ( = ?auto_210194 ?auto_210201 ) ) ( not ( = ?auto_210194 ?auto_210202 ) ) ( not ( = ?auto_210195 ?auto_210196 ) ) ( not ( = ?auto_210195 ?auto_210197 ) ) ( not ( = ?auto_210195 ?auto_210198 ) ) ( not ( = ?auto_210195 ?auto_210199 ) ) ( not ( = ?auto_210195 ?auto_210200 ) ) ( not ( = ?auto_210195 ?auto_210201 ) ) ( not ( = ?auto_210195 ?auto_210202 ) ) ( not ( = ?auto_210196 ?auto_210197 ) ) ( not ( = ?auto_210196 ?auto_210198 ) ) ( not ( = ?auto_210196 ?auto_210199 ) ) ( not ( = ?auto_210196 ?auto_210200 ) ) ( not ( = ?auto_210196 ?auto_210201 ) ) ( not ( = ?auto_210196 ?auto_210202 ) ) ( not ( = ?auto_210197 ?auto_210198 ) ) ( not ( = ?auto_210197 ?auto_210199 ) ) ( not ( = ?auto_210197 ?auto_210200 ) ) ( not ( = ?auto_210197 ?auto_210201 ) ) ( not ( = ?auto_210197 ?auto_210202 ) ) ( not ( = ?auto_210198 ?auto_210199 ) ) ( not ( = ?auto_210198 ?auto_210200 ) ) ( not ( = ?auto_210198 ?auto_210201 ) ) ( not ( = ?auto_210198 ?auto_210202 ) ) ( not ( = ?auto_210199 ?auto_210200 ) ) ( not ( = ?auto_210199 ?auto_210201 ) ) ( not ( = ?auto_210199 ?auto_210202 ) ) ( not ( = ?auto_210200 ?auto_210201 ) ) ( not ( = ?auto_210200 ?auto_210202 ) ) ( not ( = ?auto_210201 ?auto_210202 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_210201 ?auto_210202 )
      ( !STACK ?auto_210201 ?auto_210200 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_210234 - BLOCK
      ?auto_210235 - BLOCK
      ?auto_210236 - BLOCK
      ?auto_210237 - BLOCK
      ?auto_210238 - BLOCK
      ?auto_210239 - BLOCK
      ?auto_210240 - BLOCK
      ?auto_210241 - BLOCK
      ?auto_210242 - BLOCK
      ?auto_210243 - BLOCK
    )
    :vars
    (
      ?auto_210244 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_210243 ?auto_210244 ) ( ON-TABLE ?auto_210234 ) ( ON ?auto_210235 ?auto_210234 ) ( ON ?auto_210236 ?auto_210235 ) ( ON ?auto_210237 ?auto_210236 ) ( ON ?auto_210238 ?auto_210237 ) ( ON ?auto_210239 ?auto_210238 ) ( ON ?auto_210240 ?auto_210239 ) ( ON ?auto_210241 ?auto_210240 ) ( not ( = ?auto_210234 ?auto_210235 ) ) ( not ( = ?auto_210234 ?auto_210236 ) ) ( not ( = ?auto_210234 ?auto_210237 ) ) ( not ( = ?auto_210234 ?auto_210238 ) ) ( not ( = ?auto_210234 ?auto_210239 ) ) ( not ( = ?auto_210234 ?auto_210240 ) ) ( not ( = ?auto_210234 ?auto_210241 ) ) ( not ( = ?auto_210234 ?auto_210242 ) ) ( not ( = ?auto_210234 ?auto_210243 ) ) ( not ( = ?auto_210234 ?auto_210244 ) ) ( not ( = ?auto_210235 ?auto_210236 ) ) ( not ( = ?auto_210235 ?auto_210237 ) ) ( not ( = ?auto_210235 ?auto_210238 ) ) ( not ( = ?auto_210235 ?auto_210239 ) ) ( not ( = ?auto_210235 ?auto_210240 ) ) ( not ( = ?auto_210235 ?auto_210241 ) ) ( not ( = ?auto_210235 ?auto_210242 ) ) ( not ( = ?auto_210235 ?auto_210243 ) ) ( not ( = ?auto_210235 ?auto_210244 ) ) ( not ( = ?auto_210236 ?auto_210237 ) ) ( not ( = ?auto_210236 ?auto_210238 ) ) ( not ( = ?auto_210236 ?auto_210239 ) ) ( not ( = ?auto_210236 ?auto_210240 ) ) ( not ( = ?auto_210236 ?auto_210241 ) ) ( not ( = ?auto_210236 ?auto_210242 ) ) ( not ( = ?auto_210236 ?auto_210243 ) ) ( not ( = ?auto_210236 ?auto_210244 ) ) ( not ( = ?auto_210237 ?auto_210238 ) ) ( not ( = ?auto_210237 ?auto_210239 ) ) ( not ( = ?auto_210237 ?auto_210240 ) ) ( not ( = ?auto_210237 ?auto_210241 ) ) ( not ( = ?auto_210237 ?auto_210242 ) ) ( not ( = ?auto_210237 ?auto_210243 ) ) ( not ( = ?auto_210237 ?auto_210244 ) ) ( not ( = ?auto_210238 ?auto_210239 ) ) ( not ( = ?auto_210238 ?auto_210240 ) ) ( not ( = ?auto_210238 ?auto_210241 ) ) ( not ( = ?auto_210238 ?auto_210242 ) ) ( not ( = ?auto_210238 ?auto_210243 ) ) ( not ( = ?auto_210238 ?auto_210244 ) ) ( not ( = ?auto_210239 ?auto_210240 ) ) ( not ( = ?auto_210239 ?auto_210241 ) ) ( not ( = ?auto_210239 ?auto_210242 ) ) ( not ( = ?auto_210239 ?auto_210243 ) ) ( not ( = ?auto_210239 ?auto_210244 ) ) ( not ( = ?auto_210240 ?auto_210241 ) ) ( not ( = ?auto_210240 ?auto_210242 ) ) ( not ( = ?auto_210240 ?auto_210243 ) ) ( not ( = ?auto_210240 ?auto_210244 ) ) ( not ( = ?auto_210241 ?auto_210242 ) ) ( not ( = ?auto_210241 ?auto_210243 ) ) ( not ( = ?auto_210241 ?auto_210244 ) ) ( not ( = ?auto_210242 ?auto_210243 ) ) ( not ( = ?auto_210242 ?auto_210244 ) ) ( not ( = ?auto_210243 ?auto_210244 ) ) ( CLEAR ?auto_210241 ) ( ON ?auto_210242 ?auto_210243 ) ( CLEAR ?auto_210242 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_210234 ?auto_210235 ?auto_210236 ?auto_210237 ?auto_210238 ?auto_210239 ?auto_210240 ?auto_210241 ?auto_210242 )
      ( MAKE-10PILE ?auto_210234 ?auto_210235 ?auto_210236 ?auto_210237 ?auto_210238 ?auto_210239 ?auto_210240 ?auto_210241 ?auto_210242 ?auto_210243 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_210276 - BLOCK
      ?auto_210277 - BLOCK
      ?auto_210278 - BLOCK
      ?auto_210279 - BLOCK
      ?auto_210280 - BLOCK
      ?auto_210281 - BLOCK
      ?auto_210282 - BLOCK
      ?auto_210283 - BLOCK
      ?auto_210284 - BLOCK
      ?auto_210285 - BLOCK
    )
    :vars
    (
      ?auto_210286 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_210285 ?auto_210286 ) ( ON-TABLE ?auto_210276 ) ( ON ?auto_210277 ?auto_210276 ) ( ON ?auto_210278 ?auto_210277 ) ( ON ?auto_210279 ?auto_210278 ) ( ON ?auto_210280 ?auto_210279 ) ( ON ?auto_210281 ?auto_210280 ) ( ON ?auto_210282 ?auto_210281 ) ( not ( = ?auto_210276 ?auto_210277 ) ) ( not ( = ?auto_210276 ?auto_210278 ) ) ( not ( = ?auto_210276 ?auto_210279 ) ) ( not ( = ?auto_210276 ?auto_210280 ) ) ( not ( = ?auto_210276 ?auto_210281 ) ) ( not ( = ?auto_210276 ?auto_210282 ) ) ( not ( = ?auto_210276 ?auto_210283 ) ) ( not ( = ?auto_210276 ?auto_210284 ) ) ( not ( = ?auto_210276 ?auto_210285 ) ) ( not ( = ?auto_210276 ?auto_210286 ) ) ( not ( = ?auto_210277 ?auto_210278 ) ) ( not ( = ?auto_210277 ?auto_210279 ) ) ( not ( = ?auto_210277 ?auto_210280 ) ) ( not ( = ?auto_210277 ?auto_210281 ) ) ( not ( = ?auto_210277 ?auto_210282 ) ) ( not ( = ?auto_210277 ?auto_210283 ) ) ( not ( = ?auto_210277 ?auto_210284 ) ) ( not ( = ?auto_210277 ?auto_210285 ) ) ( not ( = ?auto_210277 ?auto_210286 ) ) ( not ( = ?auto_210278 ?auto_210279 ) ) ( not ( = ?auto_210278 ?auto_210280 ) ) ( not ( = ?auto_210278 ?auto_210281 ) ) ( not ( = ?auto_210278 ?auto_210282 ) ) ( not ( = ?auto_210278 ?auto_210283 ) ) ( not ( = ?auto_210278 ?auto_210284 ) ) ( not ( = ?auto_210278 ?auto_210285 ) ) ( not ( = ?auto_210278 ?auto_210286 ) ) ( not ( = ?auto_210279 ?auto_210280 ) ) ( not ( = ?auto_210279 ?auto_210281 ) ) ( not ( = ?auto_210279 ?auto_210282 ) ) ( not ( = ?auto_210279 ?auto_210283 ) ) ( not ( = ?auto_210279 ?auto_210284 ) ) ( not ( = ?auto_210279 ?auto_210285 ) ) ( not ( = ?auto_210279 ?auto_210286 ) ) ( not ( = ?auto_210280 ?auto_210281 ) ) ( not ( = ?auto_210280 ?auto_210282 ) ) ( not ( = ?auto_210280 ?auto_210283 ) ) ( not ( = ?auto_210280 ?auto_210284 ) ) ( not ( = ?auto_210280 ?auto_210285 ) ) ( not ( = ?auto_210280 ?auto_210286 ) ) ( not ( = ?auto_210281 ?auto_210282 ) ) ( not ( = ?auto_210281 ?auto_210283 ) ) ( not ( = ?auto_210281 ?auto_210284 ) ) ( not ( = ?auto_210281 ?auto_210285 ) ) ( not ( = ?auto_210281 ?auto_210286 ) ) ( not ( = ?auto_210282 ?auto_210283 ) ) ( not ( = ?auto_210282 ?auto_210284 ) ) ( not ( = ?auto_210282 ?auto_210285 ) ) ( not ( = ?auto_210282 ?auto_210286 ) ) ( not ( = ?auto_210283 ?auto_210284 ) ) ( not ( = ?auto_210283 ?auto_210285 ) ) ( not ( = ?auto_210283 ?auto_210286 ) ) ( not ( = ?auto_210284 ?auto_210285 ) ) ( not ( = ?auto_210284 ?auto_210286 ) ) ( not ( = ?auto_210285 ?auto_210286 ) ) ( ON ?auto_210284 ?auto_210285 ) ( CLEAR ?auto_210282 ) ( ON ?auto_210283 ?auto_210284 ) ( CLEAR ?auto_210283 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_210276 ?auto_210277 ?auto_210278 ?auto_210279 ?auto_210280 ?auto_210281 ?auto_210282 ?auto_210283 )
      ( MAKE-10PILE ?auto_210276 ?auto_210277 ?auto_210278 ?auto_210279 ?auto_210280 ?auto_210281 ?auto_210282 ?auto_210283 ?auto_210284 ?auto_210285 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_210318 - BLOCK
      ?auto_210319 - BLOCK
      ?auto_210320 - BLOCK
      ?auto_210321 - BLOCK
      ?auto_210322 - BLOCK
      ?auto_210323 - BLOCK
      ?auto_210324 - BLOCK
      ?auto_210325 - BLOCK
      ?auto_210326 - BLOCK
      ?auto_210327 - BLOCK
    )
    :vars
    (
      ?auto_210328 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_210327 ?auto_210328 ) ( ON-TABLE ?auto_210318 ) ( ON ?auto_210319 ?auto_210318 ) ( ON ?auto_210320 ?auto_210319 ) ( ON ?auto_210321 ?auto_210320 ) ( ON ?auto_210322 ?auto_210321 ) ( ON ?auto_210323 ?auto_210322 ) ( not ( = ?auto_210318 ?auto_210319 ) ) ( not ( = ?auto_210318 ?auto_210320 ) ) ( not ( = ?auto_210318 ?auto_210321 ) ) ( not ( = ?auto_210318 ?auto_210322 ) ) ( not ( = ?auto_210318 ?auto_210323 ) ) ( not ( = ?auto_210318 ?auto_210324 ) ) ( not ( = ?auto_210318 ?auto_210325 ) ) ( not ( = ?auto_210318 ?auto_210326 ) ) ( not ( = ?auto_210318 ?auto_210327 ) ) ( not ( = ?auto_210318 ?auto_210328 ) ) ( not ( = ?auto_210319 ?auto_210320 ) ) ( not ( = ?auto_210319 ?auto_210321 ) ) ( not ( = ?auto_210319 ?auto_210322 ) ) ( not ( = ?auto_210319 ?auto_210323 ) ) ( not ( = ?auto_210319 ?auto_210324 ) ) ( not ( = ?auto_210319 ?auto_210325 ) ) ( not ( = ?auto_210319 ?auto_210326 ) ) ( not ( = ?auto_210319 ?auto_210327 ) ) ( not ( = ?auto_210319 ?auto_210328 ) ) ( not ( = ?auto_210320 ?auto_210321 ) ) ( not ( = ?auto_210320 ?auto_210322 ) ) ( not ( = ?auto_210320 ?auto_210323 ) ) ( not ( = ?auto_210320 ?auto_210324 ) ) ( not ( = ?auto_210320 ?auto_210325 ) ) ( not ( = ?auto_210320 ?auto_210326 ) ) ( not ( = ?auto_210320 ?auto_210327 ) ) ( not ( = ?auto_210320 ?auto_210328 ) ) ( not ( = ?auto_210321 ?auto_210322 ) ) ( not ( = ?auto_210321 ?auto_210323 ) ) ( not ( = ?auto_210321 ?auto_210324 ) ) ( not ( = ?auto_210321 ?auto_210325 ) ) ( not ( = ?auto_210321 ?auto_210326 ) ) ( not ( = ?auto_210321 ?auto_210327 ) ) ( not ( = ?auto_210321 ?auto_210328 ) ) ( not ( = ?auto_210322 ?auto_210323 ) ) ( not ( = ?auto_210322 ?auto_210324 ) ) ( not ( = ?auto_210322 ?auto_210325 ) ) ( not ( = ?auto_210322 ?auto_210326 ) ) ( not ( = ?auto_210322 ?auto_210327 ) ) ( not ( = ?auto_210322 ?auto_210328 ) ) ( not ( = ?auto_210323 ?auto_210324 ) ) ( not ( = ?auto_210323 ?auto_210325 ) ) ( not ( = ?auto_210323 ?auto_210326 ) ) ( not ( = ?auto_210323 ?auto_210327 ) ) ( not ( = ?auto_210323 ?auto_210328 ) ) ( not ( = ?auto_210324 ?auto_210325 ) ) ( not ( = ?auto_210324 ?auto_210326 ) ) ( not ( = ?auto_210324 ?auto_210327 ) ) ( not ( = ?auto_210324 ?auto_210328 ) ) ( not ( = ?auto_210325 ?auto_210326 ) ) ( not ( = ?auto_210325 ?auto_210327 ) ) ( not ( = ?auto_210325 ?auto_210328 ) ) ( not ( = ?auto_210326 ?auto_210327 ) ) ( not ( = ?auto_210326 ?auto_210328 ) ) ( not ( = ?auto_210327 ?auto_210328 ) ) ( ON ?auto_210326 ?auto_210327 ) ( ON ?auto_210325 ?auto_210326 ) ( CLEAR ?auto_210323 ) ( ON ?auto_210324 ?auto_210325 ) ( CLEAR ?auto_210324 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_210318 ?auto_210319 ?auto_210320 ?auto_210321 ?auto_210322 ?auto_210323 ?auto_210324 )
      ( MAKE-10PILE ?auto_210318 ?auto_210319 ?auto_210320 ?auto_210321 ?auto_210322 ?auto_210323 ?auto_210324 ?auto_210325 ?auto_210326 ?auto_210327 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_210360 - BLOCK
      ?auto_210361 - BLOCK
      ?auto_210362 - BLOCK
      ?auto_210363 - BLOCK
      ?auto_210364 - BLOCK
      ?auto_210365 - BLOCK
      ?auto_210366 - BLOCK
      ?auto_210367 - BLOCK
      ?auto_210368 - BLOCK
      ?auto_210369 - BLOCK
    )
    :vars
    (
      ?auto_210370 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_210369 ?auto_210370 ) ( ON-TABLE ?auto_210360 ) ( ON ?auto_210361 ?auto_210360 ) ( ON ?auto_210362 ?auto_210361 ) ( ON ?auto_210363 ?auto_210362 ) ( ON ?auto_210364 ?auto_210363 ) ( not ( = ?auto_210360 ?auto_210361 ) ) ( not ( = ?auto_210360 ?auto_210362 ) ) ( not ( = ?auto_210360 ?auto_210363 ) ) ( not ( = ?auto_210360 ?auto_210364 ) ) ( not ( = ?auto_210360 ?auto_210365 ) ) ( not ( = ?auto_210360 ?auto_210366 ) ) ( not ( = ?auto_210360 ?auto_210367 ) ) ( not ( = ?auto_210360 ?auto_210368 ) ) ( not ( = ?auto_210360 ?auto_210369 ) ) ( not ( = ?auto_210360 ?auto_210370 ) ) ( not ( = ?auto_210361 ?auto_210362 ) ) ( not ( = ?auto_210361 ?auto_210363 ) ) ( not ( = ?auto_210361 ?auto_210364 ) ) ( not ( = ?auto_210361 ?auto_210365 ) ) ( not ( = ?auto_210361 ?auto_210366 ) ) ( not ( = ?auto_210361 ?auto_210367 ) ) ( not ( = ?auto_210361 ?auto_210368 ) ) ( not ( = ?auto_210361 ?auto_210369 ) ) ( not ( = ?auto_210361 ?auto_210370 ) ) ( not ( = ?auto_210362 ?auto_210363 ) ) ( not ( = ?auto_210362 ?auto_210364 ) ) ( not ( = ?auto_210362 ?auto_210365 ) ) ( not ( = ?auto_210362 ?auto_210366 ) ) ( not ( = ?auto_210362 ?auto_210367 ) ) ( not ( = ?auto_210362 ?auto_210368 ) ) ( not ( = ?auto_210362 ?auto_210369 ) ) ( not ( = ?auto_210362 ?auto_210370 ) ) ( not ( = ?auto_210363 ?auto_210364 ) ) ( not ( = ?auto_210363 ?auto_210365 ) ) ( not ( = ?auto_210363 ?auto_210366 ) ) ( not ( = ?auto_210363 ?auto_210367 ) ) ( not ( = ?auto_210363 ?auto_210368 ) ) ( not ( = ?auto_210363 ?auto_210369 ) ) ( not ( = ?auto_210363 ?auto_210370 ) ) ( not ( = ?auto_210364 ?auto_210365 ) ) ( not ( = ?auto_210364 ?auto_210366 ) ) ( not ( = ?auto_210364 ?auto_210367 ) ) ( not ( = ?auto_210364 ?auto_210368 ) ) ( not ( = ?auto_210364 ?auto_210369 ) ) ( not ( = ?auto_210364 ?auto_210370 ) ) ( not ( = ?auto_210365 ?auto_210366 ) ) ( not ( = ?auto_210365 ?auto_210367 ) ) ( not ( = ?auto_210365 ?auto_210368 ) ) ( not ( = ?auto_210365 ?auto_210369 ) ) ( not ( = ?auto_210365 ?auto_210370 ) ) ( not ( = ?auto_210366 ?auto_210367 ) ) ( not ( = ?auto_210366 ?auto_210368 ) ) ( not ( = ?auto_210366 ?auto_210369 ) ) ( not ( = ?auto_210366 ?auto_210370 ) ) ( not ( = ?auto_210367 ?auto_210368 ) ) ( not ( = ?auto_210367 ?auto_210369 ) ) ( not ( = ?auto_210367 ?auto_210370 ) ) ( not ( = ?auto_210368 ?auto_210369 ) ) ( not ( = ?auto_210368 ?auto_210370 ) ) ( not ( = ?auto_210369 ?auto_210370 ) ) ( ON ?auto_210368 ?auto_210369 ) ( ON ?auto_210367 ?auto_210368 ) ( ON ?auto_210366 ?auto_210367 ) ( CLEAR ?auto_210364 ) ( ON ?auto_210365 ?auto_210366 ) ( CLEAR ?auto_210365 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_210360 ?auto_210361 ?auto_210362 ?auto_210363 ?auto_210364 ?auto_210365 )
      ( MAKE-10PILE ?auto_210360 ?auto_210361 ?auto_210362 ?auto_210363 ?auto_210364 ?auto_210365 ?auto_210366 ?auto_210367 ?auto_210368 ?auto_210369 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_210402 - BLOCK
      ?auto_210403 - BLOCK
      ?auto_210404 - BLOCK
      ?auto_210405 - BLOCK
      ?auto_210406 - BLOCK
      ?auto_210407 - BLOCK
      ?auto_210408 - BLOCK
      ?auto_210409 - BLOCK
      ?auto_210410 - BLOCK
      ?auto_210411 - BLOCK
    )
    :vars
    (
      ?auto_210412 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_210411 ?auto_210412 ) ( ON-TABLE ?auto_210402 ) ( ON ?auto_210403 ?auto_210402 ) ( ON ?auto_210404 ?auto_210403 ) ( ON ?auto_210405 ?auto_210404 ) ( not ( = ?auto_210402 ?auto_210403 ) ) ( not ( = ?auto_210402 ?auto_210404 ) ) ( not ( = ?auto_210402 ?auto_210405 ) ) ( not ( = ?auto_210402 ?auto_210406 ) ) ( not ( = ?auto_210402 ?auto_210407 ) ) ( not ( = ?auto_210402 ?auto_210408 ) ) ( not ( = ?auto_210402 ?auto_210409 ) ) ( not ( = ?auto_210402 ?auto_210410 ) ) ( not ( = ?auto_210402 ?auto_210411 ) ) ( not ( = ?auto_210402 ?auto_210412 ) ) ( not ( = ?auto_210403 ?auto_210404 ) ) ( not ( = ?auto_210403 ?auto_210405 ) ) ( not ( = ?auto_210403 ?auto_210406 ) ) ( not ( = ?auto_210403 ?auto_210407 ) ) ( not ( = ?auto_210403 ?auto_210408 ) ) ( not ( = ?auto_210403 ?auto_210409 ) ) ( not ( = ?auto_210403 ?auto_210410 ) ) ( not ( = ?auto_210403 ?auto_210411 ) ) ( not ( = ?auto_210403 ?auto_210412 ) ) ( not ( = ?auto_210404 ?auto_210405 ) ) ( not ( = ?auto_210404 ?auto_210406 ) ) ( not ( = ?auto_210404 ?auto_210407 ) ) ( not ( = ?auto_210404 ?auto_210408 ) ) ( not ( = ?auto_210404 ?auto_210409 ) ) ( not ( = ?auto_210404 ?auto_210410 ) ) ( not ( = ?auto_210404 ?auto_210411 ) ) ( not ( = ?auto_210404 ?auto_210412 ) ) ( not ( = ?auto_210405 ?auto_210406 ) ) ( not ( = ?auto_210405 ?auto_210407 ) ) ( not ( = ?auto_210405 ?auto_210408 ) ) ( not ( = ?auto_210405 ?auto_210409 ) ) ( not ( = ?auto_210405 ?auto_210410 ) ) ( not ( = ?auto_210405 ?auto_210411 ) ) ( not ( = ?auto_210405 ?auto_210412 ) ) ( not ( = ?auto_210406 ?auto_210407 ) ) ( not ( = ?auto_210406 ?auto_210408 ) ) ( not ( = ?auto_210406 ?auto_210409 ) ) ( not ( = ?auto_210406 ?auto_210410 ) ) ( not ( = ?auto_210406 ?auto_210411 ) ) ( not ( = ?auto_210406 ?auto_210412 ) ) ( not ( = ?auto_210407 ?auto_210408 ) ) ( not ( = ?auto_210407 ?auto_210409 ) ) ( not ( = ?auto_210407 ?auto_210410 ) ) ( not ( = ?auto_210407 ?auto_210411 ) ) ( not ( = ?auto_210407 ?auto_210412 ) ) ( not ( = ?auto_210408 ?auto_210409 ) ) ( not ( = ?auto_210408 ?auto_210410 ) ) ( not ( = ?auto_210408 ?auto_210411 ) ) ( not ( = ?auto_210408 ?auto_210412 ) ) ( not ( = ?auto_210409 ?auto_210410 ) ) ( not ( = ?auto_210409 ?auto_210411 ) ) ( not ( = ?auto_210409 ?auto_210412 ) ) ( not ( = ?auto_210410 ?auto_210411 ) ) ( not ( = ?auto_210410 ?auto_210412 ) ) ( not ( = ?auto_210411 ?auto_210412 ) ) ( ON ?auto_210410 ?auto_210411 ) ( ON ?auto_210409 ?auto_210410 ) ( ON ?auto_210408 ?auto_210409 ) ( ON ?auto_210407 ?auto_210408 ) ( CLEAR ?auto_210405 ) ( ON ?auto_210406 ?auto_210407 ) ( CLEAR ?auto_210406 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_210402 ?auto_210403 ?auto_210404 ?auto_210405 ?auto_210406 )
      ( MAKE-10PILE ?auto_210402 ?auto_210403 ?auto_210404 ?auto_210405 ?auto_210406 ?auto_210407 ?auto_210408 ?auto_210409 ?auto_210410 ?auto_210411 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_210444 - BLOCK
      ?auto_210445 - BLOCK
      ?auto_210446 - BLOCK
      ?auto_210447 - BLOCK
      ?auto_210448 - BLOCK
      ?auto_210449 - BLOCK
      ?auto_210450 - BLOCK
      ?auto_210451 - BLOCK
      ?auto_210452 - BLOCK
      ?auto_210453 - BLOCK
    )
    :vars
    (
      ?auto_210454 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_210453 ?auto_210454 ) ( ON-TABLE ?auto_210444 ) ( ON ?auto_210445 ?auto_210444 ) ( ON ?auto_210446 ?auto_210445 ) ( not ( = ?auto_210444 ?auto_210445 ) ) ( not ( = ?auto_210444 ?auto_210446 ) ) ( not ( = ?auto_210444 ?auto_210447 ) ) ( not ( = ?auto_210444 ?auto_210448 ) ) ( not ( = ?auto_210444 ?auto_210449 ) ) ( not ( = ?auto_210444 ?auto_210450 ) ) ( not ( = ?auto_210444 ?auto_210451 ) ) ( not ( = ?auto_210444 ?auto_210452 ) ) ( not ( = ?auto_210444 ?auto_210453 ) ) ( not ( = ?auto_210444 ?auto_210454 ) ) ( not ( = ?auto_210445 ?auto_210446 ) ) ( not ( = ?auto_210445 ?auto_210447 ) ) ( not ( = ?auto_210445 ?auto_210448 ) ) ( not ( = ?auto_210445 ?auto_210449 ) ) ( not ( = ?auto_210445 ?auto_210450 ) ) ( not ( = ?auto_210445 ?auto_210451 ) ) ( not ( = ?auto_210445 ?auto_210452 ) ) ( not ( = ?auto_210445 ?auto_210453 ) ) ( not ( = ?auto_210445 ?auto_210454 ) ) ( not ( = ?auto_210446 ?auto_210447 ) ) ( not ( = ?auto_210446 ?auto_210448 ) ) ( not ( = ?auto_210446 ?auto_210449 ) ) ( not ( = ?auto_210446 ?auto_210450 ) ) ( not ( = ?auto_210446 ?auto_210451 ) ) ( not ( = ?auto_210446 ?auto_210452 ) ) ( not ( = ?auto_210446 ?auto_210453 ) ) ( not ( = ?auto_210446 ?auto_210454 ) ) ( not ( = ?auto_210447 ?auto_210448 ) ) ( not ( = ?auto_210447 ?auto_210449 ) ) ( not ( = ?auto_210447 ?auto_210450 ) ) ( not ( = ?auto_210447 ?auto_210451 ) ) ( not ( = ?auto_210447 ?auto_210452 ) ) ( not ( = ?auto_210447 ?auto_210453 ) ) ( not ( = ?auto_210447 ?auto_210454 ) ) ( not ( = ?auto_210448 ?auto_210449 ) ) ( not ( = ?auto_210448 ?auto_210450 ) ) ( not ( = ?auto_210448 ?auto_210451 ) ) ( not ( = ?auto_210448 ?auto_210452 ) ) ( not ( = ?auto_210448 ?auto_210453 ) ) ( not ( = ?auto_210448 ?auto_210454 ) ) ( not ( = ?auto_210449 ?auto_210450 ) ) ( not ( = ?auto_210449 ?auto_210451 ) ) ( not ( = ?auto_210449 ?auto_210452 ) ) ( not ( = ?auto_210449 ?auto_210453 ) ) ( not ( = ?auto_210449 ?auto_210454 ) ) ( not ( = ?auto_210450 ?auto_210451 ) ) ( not ( = ?auto_210450 ?auto_210452 ) ) ( not ( = ?auto_210450 ?auto_210453 ) ) ( not ( = ?auto_210450 ?auto_210454 ) ) ( not ( = ?auto_210451 ?auto_210452 ) ) ( not ( = ?auto_210451 ?auto_210453 ) ) ( not ( = ?auto_210451 ?auto_210454 ) ) ( not ( = ?auto_210452 ?auto_210453 ) ) ( not ( = ?auto_210452 ?auto_210454 ) ) ( not ( = ?auto_210453 ?auto_210454 ) ) ( ON ?auto_210452 ?auto_210453 ) ( ON ?auto_210451 ?auto_210452 ) ( ON ?auto_210450 ?auto_210451 ) ( ON ?auto_210449 ?auto_210450 ) ( ON ?auto_210448 ?auto_210449 ) ( CLEAR ?auto_210446 ) ( ON ?auto_210447 ?auto_210448 ) ( CLEAR ?auto_210447 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_210444 ?auto_210445 ?auto_210446 ?auto_210447 )
      ( MAKE-10PILE ?auto_210444 ?auto_210445 ?auto_210446 ?auto_210447 ?auto_210448 ?auto_210449 ?auto_210450 ?auto_210451 ?auto_210452 ?auto_210453 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_210486 - BLOCK
      ?auto_210487 - BLOCK
      ?auto_210488 - BLOCK
      ?auto_210489 - BLOCK
      ?auto_210490 - BLOCK
      ?auto_210491 - BLOCK
      ?auto_210492 - BLOCK
      ?auto_210493 - BLOCK
      ?auto_210494 - BLOCK
      ?auto_210495 - BLOCK
    )
    :vars
    (
      ?auto_210496 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_210495 ?auto_210496 ) ( ON-TABLE ?auto_210486 ) ( ON ?auto_210487 ?auto_210486 ) ( not ( = ?auto_210486 ?auto_210487 ) ) ( not ( = ?auto_210486 ?auto_210488 ) ) ( not ( = ?auto_210486 ?auto_210489 ) ) ( not ( = ?auto_210486 ?auto_210490 ) ) ( not ( = ?auto_210486 ?auto_210491 ) ) ( not ( = ?auto_210486 ?auto_210492 ) ) ( not ( = ?auto_210486 ?auto_210493 ) ) ( not ( = ?auto_210486 ?auto_210494 ) ) ( not ( = ?auto_210486 ?auto_210495 ) ) ( not ( = ?auto_210486 ?auto_210496 ) ) ( not ( = ?auto_210487 ?auto_210488 ) ) ( not ( = ?auto_210487 ?auto_210489 ) ) ( not ( = ?auto_210487 ?auto_210490 ) ) ( not ( = ?auto_210487 ?auto_210491 ) ) ( not ( = ?auto_210487 ?auto_210492 ) ) ( not ( = ?auto_210487 ?auto_210493 ) ) ( not ( = ?auto_210487 ?auto_210494 ) ) ( not ( = ?auto_210487 ?auto_210495 ) ) ( not ( = ?auto_210487 ?auto_210496 ) ) ( not ( = ?auto_210488 ?auto_210489 ) ) ( not ( = ?auto_210488 ?auto_210490 ) ) ( not ( = ?auto_210488 ?auto_210491 ) ) ( not ( = ?auto_210488 ?auto_210492 ) ) ( not ( = ?auto_210488 ?auto_210493 ) ) ( not ( = ?auto_210488 ?auto_210494 ) ) ( not ( = ?auto_210488 ?auto_210495 ) ) ( not ( = ?auto_210488 ?auto_210496 ) ) ( not ( = ?auto_210489 ?auto_210490 ) ) ( not ( = ?auto_210489 ?auto_210491 ) ) ( not ( = ?auto_210489 ?auto_210492 ) ) ( not ( = ?auto_210489 ?auto_210493 ) ) ( not ( = ?auto_210489 ?auto_210494 ) ) ( not ( = ?auto_210489 ?auto_210495 ) ) ( not ( = ?auto_210489 ?auto_210496 ) ) ( not ( = ?auto_210490 ?auto_210491 ) ) ( not ( = ?auto_210490 ?auto_210492 ) ) ( not ( = ?auto_210490 ?auto_210493 ) ) ( not ( = ?auto_210490 ?auto_210494 ) ) ( not ( = ?auto_210490 ?auto_210495 ) ) ( not ( = ?auto_210490 ?auto_210496 ) ) ( not ( = ?auto_210491 ?auto_210492 ) ) ( not ( = ?auto_210491 ?auto_210493 ) ) ( not ( = ?auto_210491 ?auto_210494 ) ) ( not ( = ?auto_210491 ?auto_210495 ) ) ( not ( = ?auto_210491 ?auto_210496 ) ) ( not ( = ?auto_210492 ?auto_210493 ) ) ( not ( = ?auto_210492 ?auto_210494 ) ) ( not ( = ?auto_210492 ?auto_210495 ) ) ( not ( = ?auto_210492 ?auto_210496 ) ) ( not ( = ?auto_210493 ?auto_210494 ) ) ( not ( = ?auto_210493 ?auto_210495 ) ) ( not ( = ?auto_210493 ?auto_210496 ) ) ( not ( = ?auto_210494 ?auto_210495 ) ) ( not ( = ?auto_210494 ?auto_210496 ) ) ( not ( = ?auto_210495 ?auto_210496 ) ) ( ON ?auto_210494 ?auto_210495 ) ( ON ?auto_210493 ?auto_210494 ) ( ON ?auto_210492 ?auto_210493 ) ( ON ?auto_210491 ?auto_210492 ) ( ON ?auto_210490 ?auto_210491 ) ( ON ?auto_210489 ?auto_210490 ) ( CLEAR ?auto_210487 ) ( ON ?auto_210488 ?auto_210489 ) ( CLEAR ?auto_210488 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_210486 ?auto_210487 ?auto_210488 )
      ( MAKE-10PILE ?auto_210486 ?auto_210487 ?auto_210488 ?auto_210489 ?auto_210490 ?auto_210491 ?auto_210492 ?auto_210493 ?auto_210494 ?auto_210495 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_210528 - BLOCK
      ?auto_210529 - BLOCK
      ?auto_210530 - BLOCK
      ?auto_210531 - BLOCK
      ?auto_210532 - BLOCK
      ?auto_210533 - BLOCK
      ?auto_210534 - BLOCK
      ?auto_210535 - BLOCK
      ?auto_210536 - BLOCK
      ?auto_210537 - BLOCK
    )
    :vars
    (
      ?auto_210538 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_210537 ?auto_210538 ) ( ON-TABLE ?auto_210528 ) ( not ( = ?auto_210528 ?auto_210529 ) ) ( not ( = ?auto_210528 ?auto_210530 ) ) ( not ( = ?auto_210528 ?auto_210531 ) ) ( not ( = ?auto_210528 ?auto_210532 ) ) ( not ( = ?auto_210528 ?auto_210533 ) ) ( not ( = ?auto_210528 ?auto_210534 ) ) ( not ( = ?auto_210528 ?auto_210535 ) ) ( not ( = ?auto_210528 ?auto_210536 ) ) ( not ( = ?auto_210528 ?auto_210537 ) ) ( not ( = ?auto_210528 ?auto_210538 ) ) ( not ( = ?auto_210529 ?auto_210530 ) ) ( not ( = ?auto_210529 ?auto_210531 ) ) ( not ( = ?auto_210529 ?auto_210532 ) ) ( not ( = ?auto_210529 ?auto_210533 ) ) ( not ( = ?auto_210529 ?auto_210534 ) ) ( not ( = ?auto_210529 ?auto_210535 ) ) ( not ( = ?auto_210529 ?auto_210536 ) ) ( not ( = ?auto_210529 ?auto_210537 ) ) ( not ( = ?auto_210529 ?auto_210538 ) ) ( not ( = ?auto_210530 ?auto_210531 ) ) ( not ( = ?auto_210530 ?auto_210532 ) ) ( not ( = ?auto_210530 ?auto_210533 ) ) ( not ( = ?auto_210530 ?auto_210534 ) ) ( not ( = ?auto_210530 ?auto_210535 ) ) ( not ( = ?auto_210530 ?auto_210536 ) ) ( not ( = ?auto_210530 ?auto_210537 ) ) ( not ( = ?auto_210530 ?auto_210538 ) ) ( not ( = ?auto_210531 ?auto_210532 ) ) ( not ( = ?auto_210531 ?auto_210533 ) ) ( not ( = ?auto_210531 ?auto_210534 ) ) ( not ( = ?auto_210531 ?auto_210535 ) ) ( not ( = ?auto_210531 ?auto_210536 ) ) ( not ( = ?auto_210531 ?auto_210537 ) ) ( not ( = ?auto_210531 ?auto_210538 ) ) ( not ( = ?auto_210532 ?auto_210533 ) ) ( not ( = ?auto_210532 ?auto_210534 ) ) ( not ( = ?auto_210532 ?auto_210535 ) ) ( not ( = ?auto_210532 ?auto_210536 ) ) ( not ( = ?auto_210532 ?auto_210537 ) ) ( not ( = ?auto_210532 ?auto_210538 ) ) ( not ( = ?auto_210533 ?auto_210534 ) ) ( not ( = ?auto_210533 ?auto_210535 ) ) ( not ( = ?auto_210533 ?auto_210536 ) ) ( not ( = ?auto_210533 ?auto_210537 ) ) ( not ( = ?auto_210533 ?auto_210538 ) ) ( not ( = ?auto_210534 ?auto_210535 ) ) ( not ( = ?auto_210534 ?auto_210536 ) ) ( not ( = ?auto_210534 ?auto_210537 ) ) ( not ( = ?auto_210534 ?auto_210538 ) ) ( not ( = ?auto_210535 ?auto_210536 ) ) ( not ( = ?auto_210535 ?auto_210537 ) ) ( not ( = ?auto_210535 ?auto_210538 ) ) ( not ( = ?auto_210536 ?auto_210537 ) ) ( not ( = ?auto_210536 ?auto_210538 ) ) ( not ( = ?auto_210537 ?auto_210538 ) ) ( ON ?auto_210536 ?auto_210537 ) ( ON ?auto_210535 ?auto_210536 ) ( ON ?auto_210534 ?auto_210535 ) ( ON ?auto_210533 ?auto_210534 ) ( ON ?auto_210532 ?auto_210533 ) ( ON ?auto_210531 ?auto_210532 ) ( ON ?auto_210530 ?auto_210531 ) ( CLEAR ?auto_210528 ) ( ON ?auto_210529 ?auto_210530 ) ( CLEAR ?auto_210529 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_210528 ?auto_210529 )
      ( MAKE-10PILE ?auto_210528 ?auto_210529 ?auto_210530 ?auto_210531 ?auto_210532 ?auto_210533 ?auto_210534 ?auto_210535 ?auto_210536 ?auto_210537 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_210570 - BLOCK
      ?auto_210571 - BLOCK
      ?auto_210572 - BLOCK
      ?auto_210573 - BLOCK
      ?auto_210574 - BLOCK
      ?auto_210575 - BLOCK
      ?auto_210576 - BLOCK
      ?auto_210577 - BLOCK
      ?auto_210578 - BLOCK
      ?auto_210579 - BLOCK
    )
    :vars
    (
      ?auto_210580 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_210579 ?auto_210580 ) ( not ( = ?auto_210570 ?auto_210571 ) ) ( not ( = ?auto_210570 ?auto_210572 ) ) ( not ( = ?auto_210570 ?auto_210573 ) ) ( not ( = ?auto_210570 ?auto_210574 ) ) ( not ( = ?auto_210570 ?auto_210575 ) ) ( not ( = ?auto_210570 ?auto_210576 ) ) ( not ( = ?auto_210570 ?auto_210577 ) ) ( not ( = ?auto_210570 ?auto_210578 ) ) ( not ( = ?auto_210570 ?auto_210579 ) ) ( not ( = ?auto_210570 ?auto_210580 ) ) ( not ( = ?auto_210571 ?auto_210572 ) ) ( not ( = ?auto_210571 ?auto_210573 ) ) ( not ( = ?auto_210571 ?auto_210574 ) ) ( not ( = ?auto_210571 ?auto_210575 ) ) ( not ( = ?auto_210571 ?auto_210576 ) ) ( not ( = ?auto_210571 ?auto_210577 ) ) ( not ( = ?auto_210571 ?auto_210578 ) ) ( not ( = ?auto_210571 ?auto_210579 ) ) ( not ( = ?auto_210571 ?auto_210580 ) ) ( not ( = ?auto_210572 ?auto_210573 ) ) ( not ( = ?auto_210572 ?auto_210574 ) ) ( not ( = ?auto_210572 ?auto_210575 ) ) ( not ( = ?auto_210572 ?auto_210576 ) ) ( not ( = ?auto_210572 ?auto_210577 ) ) ( not ( = ?auto_210572 ?auto_210578 ) ) ( not ( = ?auto_210572 ?auto_210579 ) ) ( not ( = ?auto_210572 ?auto_210580 ) ) ( not ( = ?auto_210573 ?auto_210574 ) ) ( not ( = ?auto_210573 ?auto_210575 ) ) ( not ( = ?auto_210573 ?auto_210576 ) ) ( not ( = ?auto_210573 ?auto_210577 ) ) ( not ( = ?auto_210573 ?auto_210578 ) ) ( not ( = ?auto_210573 ?auto_210579 ) ) ( not ( = ?auto_210573 ?auto_210580 ) ) ( not ( = ?auto_210574 ?auto_210575 ) ) ( not ( = ?auto_210574 ?auto_210576 ) ) ( not ( = ?auto_210574 ?auto_210577 ) ) ( not ( = ?auto_210574 ?auto_210578 ) ) ( not ( = ?auto_210574 ?auto_210579 ) ) ( not ( = ?auto_210574 ?auto_210580 ) ) ( not ( = ?auto_210575 ?auto_210576 ) ) ( not ( = ?auto_210575 ?auto_210577 ) ) ( not ( = ?auto_210575 ?auto_210578 ) ) ( not ( = ?auto_210575 ?auto_210579 ) ) ( not ( = ?auto_210575 ?auto_210580 ) ) ( not ( = ?auto_210576 ?auto_210577 ) ) ( not ( = ?auto_210576 ?auto_210578 ) ) ( not ( = ?auto_210576 ?auto_210579 ) ) ( not ( = ?auto_210576 ?auto_210580 ) ) ( not ( = ?auto_210577 ?auto_210578 ) ) ( not ( = ?auto_210577 ?auto_210579 ) ) ( not ( = ?auto_210577 ?auto_210580 ) ) ( not ( = ?auto_210578 ?auto_210579 ) ) ( not ( = ?auto_210578 ?auto_210580 ) ) ( not ( = ?auto_210579 ?auto_210580 ) ) ( ON ?auto_210578 ?auto_210579 ) ( ON ?auto_210577 ?auto_210578 ) ( ON ?auto_210576 ?auto_210577 ) ( ON ?auto_210575 ?auto_210576 ) ( ON ?auto_210574 ?auto_210575 ) ( ON ?auto_210573 ?auto_210574 ) ( ON ?auto_210572 ?auto_210573 ) ( ON ?auto_210571 ?auto_210572 ) ( ON ?auto_210570 ?auto_210571 ) ( CLEAR ?auto_210570 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_210570 )
      ( MAKE-10PILE ?auto_210570 ?auto_210571 ?auto_210572 ?auto_210573 ?auto_210574 ?auto_210575 ?auto_210576 ?auto_210577 ?auto_210578 ?auto_210579 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_210613 - BLOCK
      ?auto_210614 - BLOCK
      ?auto_210615 - BLOCK
      ?auto_210616 - BLOCK
      ?auto_210617 - BLOCK
      ?auto_210618 - BLOCK
      ?auto_210619 - BLOCK
      ?auto_210620 - BLOCK
      ?auto_210621 - BLOCK
      ?auto_210622 - BLOCK
      ?auto_210623 - BLOCK
    )
    :vars
    (
      ?auto_210624 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_210622 ) ( ON ?auto_210623 ?auto_210624 ) ( CLEAR ?auto_210623 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_210613 ) ( ON ?auto_210614 ?auto_210613 ) ( ON ?auto_210615 ?auto_210614 ) ( ON ?auto_210616 ?auto_210615 ) ( ON ?auto_210617 ?auto_210616 ) ( ON ?auto_210618 ?auto_210617 ) ( ON ?auto_210619 ?auto_210618 ) ( ON ?auto_210620 ?auto_210619 ) ( ON ?auto_210621 ?auto_210620 ) ( ON ?auto_210622 ?auto_210621 ) ( not ( = ?auto_210613 ?auto_210614 ) ) ( not ( = ?auto_210613 ?auto_210615 ) ) ( not ( = ?auto_210613 ?auto_210616 ) ) ( not ( = ?auto_210613 ?auto_210617 ) ) ( not ( = ?auto_210613 ?auto_210618 ) ) ( not ( = ?auto_210613 ?auto_210619 ) ) ( not ( = ?auto_210613 ?auto_210620 ) ) ( not ( = ?auto_210613 ?auto_210621 ) ) ( not ( = ?auto_210613 ?auto_210622 ) ) ( not ( = ?auto_210613 ?auto_210623 ) ) ( not ( = ?auto_210613 ?auto_210624 ) ) ( not ( = ?auto_210614 ?auto_210615 ) ) ( not ( = ?auto_210614 ?auto_210616 ) ) ( not ( = ?auto_210614 ?auto_210617 ) ) ( not ( = ?auto_210614 ?auto_210618 ) ) ( not ( = ?auto_210614 ?auto_210619 ) ) ( not ( = ?auto_210614 ?auto_210620 ) ) ( not ( = ?auto_210614 ?auto_210621 ) ) ( not ( = ?auto_210614 ?auto_210622 ) ) ( not ( = ?auto_210614 ?auto_210623 ) ) ( not ( = ?auto_210614 ?auto_210624 ) ) ( not ( = ?auto_210615 ?auto_210616 ) ) ( not ( = ?auto_210615 ?auto_210617 ) ) ( not ( = ?auto_210615 ?auto_210618 ) ) ( not ( = ?auto_210615 ?auto_210619 ) ) ( not ( = ?auto_210615 ?auto_210620 ) ) ( not ( = ?auto_210615 ?auto_210621 ) ) ( not ( = ?auto_210615 ?auto_210622 ) ) ( not ( = ?auto_210615 ?auto_210623 ) ) ( not ( = ?auto_210615 ?auto_210624 ) ) ( not ( = ?auto_210616 ?auto_210617 ) ) ( not ( = ?auto_210616 ?auto_210618 ) ) ( not ( = ?auto_210616 ?auto_210619 ) ) ( not ( = ?auto_210616 ?auto_210620 ) ) ( not ( = ?auto_210616 ?auto_210621 ) ) ( not ( = ?auto_210616 ?auto_210622 ) ) ( not ( = ?auto_210616 ?auto_210623 ) ) ( not ( = ?auto_210616 ?auto_210624 ) ) ( not ( = ?auto_210617 ?auto_210618 ) ) ( not ( = ?auto_210617 ?auto_210619 ) ) ( not ( = ?auto_210617 ?auto_210620 ) ) ( not ( = ?auto_210617 ?auto_210621 ) ) ( not ( = ?auto_210617 ?auto_210622 ) ) ( not ( = ?auto_210617 ?auto_210623 ) ) ( not ( = ?auto_210617 ?auto_210624 ) ) ( not ( = ?auto_210618 ?auto_210619 ) ) ( not ( = ?auto_210618 ?auto_210620 ) ) ( not ( = ?auto_210618 ?auto_210621 ) ) ( not ( = ?auto_210618 ?auto_210622 ) ) ( not ( = ?auto_210618 ?auto_210623 ) ) ( not ( = ?auto_210618 ?auto_210624 ) ) ( not ( = ?auto_210619 ?auto_210620 ) ) ( not ( = ?auto_210619 ?auto_210621 ) ) ( not ( = ?auto_210619 ?auto_210622 ) ) ( not ( = ?auto_210619 ?auto_210623 ) ) ( not ( = ?auto_210619 ?auto_210624 ) ) ( not ( = ?auto_210620 ?auto_210621 ) ) ( not ( = ?auto_210620 ?auto_210622 ) ) ( not ( = ?auto_210620 ?auto_210623 ) ) ( not ( = ?auto_210620 ?auto_210624 ) ) ( not ( = ?auto_210621 ?auto_210622 ) ) ( not ( = ?auto_210621 ?auto_210623 ) ) ( not ( = ?auto_210621 ?auto_210624 ) ) ( not ( = ?auto_210622 ?auto_210623 ) ) ( not ( = ?auto_210622 ?auto_210624 ) ) ( not ( = ?auto_210623 ?auto_210624 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_210623 ?auto_210624 )
      ( !STACK ?auto_210623 ?auto_210622 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_210659 - BLOCK
      ?auto_210660 - BLOCK
      ?auto_210661 - BLOCK
      ?auto_210662 - BLOCK
      ?auto_210663 - BLOCK
      ?auto_210664 - BLOCK
      ?auto_210665 - BLOCK
      ?auto_210666 - BLOCK
      ?auto_210667 - BLOCK
      ?auto_210668 - BLOCK
      ?auto_210669 - BLOCK
    )
    :vars
    (
      ?auto_210670 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_210669 ?auto_210670 ) ( ON-TABLE ?auto_210659 ) ( ON ?auto_210660 ?auto_210659 ) ( ON ?auto_210661 ?auto_210660 ) ( ON ?auto_210662 ?auto_210661 ) ( ON ?auto_210663 ?auto_210662 ) ( ON ?auto_210664 ?auto_210663 ) ( ON ?auto_210665 ?auto_210664 ) ( ON ?auto_210666 ?auto_210665 ) ( ON ?auto_210667 ?auto_210666 ) ( not ( = ?auto_210659 ?auto_210660 ) ) ( not ( = ?auto_210659 ?auto_210661 ) ) ( not ( = ?auto_210659 ?auto_210662 ) ) ( not ( = ?auto_210659 ?auto_210663 ) ) ( not ( = ?auto_210659 ?auto_210664 ) ) ( not ( = ?auto_210659 ?auto_210665 ) ) ( not ( = ?auto_210659 ?auto_210666 ) ) ( not ( = ?auto_210659 ?auto_210667 ) ) ( not ( = ?auto_210659 ?auto_210668 ) ) ( not ( = ?auto_210659 ?auto_210669 ) ) ( not ( = ?auto_210659 ?auto_210670 ) ) ( not ( = ?auto_210660 ?auto_210661 ) ) ( not ( = ?auto_210660 ?auto_210662 ) ) ( not ( = ?auto_210660 ?auto_210663 ) ) ( not ( = ?auto_210660 ?auto_210664 ) ) ( not ( = ?auto_210660 ?auto_210665 ) ) ( not ( = ?auto_210660 ?auto_210666 ) ) ( not ( = ?auto_210660 ?auto_210667 ) ) ( not ( = ?auto_210660 ?auto_210668 ) ) ( not ( = ?auto_210660 ?auto_210669 ) ) ( not ( = ?auto_210660 ?auto_210670 ) ) ( not ( = ?auto_210661 ?auto_210662 ) ) ( not ( = ?auto_210661 ?auto_210663 ) ) ( not ( = ?auto_210661 ?auto_210664 ) ) ( not ( = ?auto_210661 ?auto_210665 ) ) ( not ( = ?auto_210661 ?auto_210666 ) ) ( not ( = ?auto_210661 ?auto_210667 ) ) ( not ( = ?auto_210661 ?auto_210668 ) ) ( not ( = ?auto_210661 ?auto_210669 ) ) ( not ( = ?auto_210661 ?auto_210670 ) ) ( not ( = ?auto_210662 ?auto_210663 ) ) ( not ( = ?auto_210662 ?auto_210664 ) ) ( not ( = ?auto_210662 ?auto_210665 ) ) ( not ( = ?auto_210662 ?auto_210666 ) ) ( not ( = ?auto_210662 ?auto_210667 ) ) ( not ( = ?auto_210662 ?auto_210668 ) ) ( not ( = ?auto_210662 ?auto_210669 ) ) ( not ( = ?auto_210662 ?auto_210670 ) ) ( not ( = ?auto_210663 ?auto_210664 ) ) ( not ( = ?auto_210663 ?auto_210665 ) ) ( not ( = ?auto_210663 ?auto_210666 ) ) ( not ( = ?auto_210663 ?auto_210667 ) ) ( not ( = ?auto_210663 ?auto_210668 ) ) ( not ( = ?auto_210663 ?auto_210669 ) ) ( not ( = ?auto_210663 ?auto_210670 ) ) ( not ( = ?auto_210664 ?auto_210665 ) ) ( not ( = ?auto_210664 ?auto_210666 ) ) ( not ( = ?auto_210664 ?auto_210667 ) ) ( not ( = ?auto_210664 ?auto_210668 ) ) ( not ( = ?auto_210664 ?auto_210669 ) ) ( not ( = ?auto_210664 ?auto_210670 ) ) ( not ( = ?auto_210665 ?auto_210666 ) ) ( not ( = ?auto_210665 ?auto_210667 ) ) ( not ( = ?auto_210665 ?auto_210668 ) ) ( not ( = ?auto_210665 ?auto_210669 ) ) ( not ( = ?auto_210665 ?auto_210670 ) ) ( not ( = ?auto_210666 ?auto_210667 ) ) ( not ( = ?auto_210666 ?auto_210668 ) ) ( not ( = ?auto_210666 ?auto_210669 ) ) ( not ( = ?auto_210666 ?auto_210670 ) ) ( not ( = ?auto_210667 ?auto_210668 ) ) ( not ( = ?auto_210667 ?auto_210669 ) ) ( not ( = ?auto_210667 ?auto_210670 ) ) ( not ( = ?auto_210668 ?auto_210669 ) ) ( not ( = ?auto_210668 ?auto_210670 ) ) ( not ( = ?auto_210669 ?auto_210670 ) ) ( CLEAR ?auto_210667 ) ( ON ?auto_210668 ?auto_210669 ) ( CLEAR ?auto_210668 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_210659 ?auto_210660 ?auto_210661 ?auto_210662 ?auto_210663 ?auto_210664 ?auto_210665 ?auto_210666 ?auto_210667 ?auto_210668 )
      ( MAKE-11PILE ?auto_210659 ?auto_210660 ?auto_210661 ?auto_210662 ?auto_210663 ?auto_210664 ?auto_210665 ?auto_210666 ?auto_210667 ?auto_210668 ?auto_210669 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_210705 - BLOCK
      ?auto_210706 - BLOCK
      ?auto_210707 - BLOCK
      ?auto_210708 - BLOCK
      ?auto_210709 - BLOCK
      ?auto_210710 - BLOCK
      ?auto_210711 - BLOCK
      ?auto_210712 - BLOCK
      ?auto_210713 - BLOCK
      ?auto_210714 - BLOCK
      ?auto_210715 - BLOCK
    )
    :vars
    (
      ?auto_210716 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_210715 ?auto_210716 ) ( ON-TABLE ?auto_210705 ) ( ON ?auto_210706 ?auto_210705 ) ( ON ?auto_210707 ?auto_210706 ) ( ON ?auto_210708 ?auto_210707 ) ( ON ?auto_210709 ?auto_210708 ) ( ON ?auto_210710 ?auto_210709 ) ( ON ?auto_210711 ?auto_210710 ) ( ON ?auto_210712 ?auto_210711 ) ( not ( = ?auto_210705 ?auto_210706 ) ) ( not ( = ?auto_210705 ?auto_210707 ) ) ( not ( = ?auto_210705 ?auto_210708 ) ) ( not ( = ?auto_210705 ?auto_210709 ) ) ( not ( = ?auto_210705 ?auto_210710 ) ) ( not ( = ?auto_210705 ?auto_210711 ) ) ( not ( = ?auto_210705 ?auto_210712 ) ) ( not ( = ?auto_210705 ?auto_210713 ) ) ( not ( = ?auto_210705 ?auto_210714 ) ) ( not ( = ?auto_210705 ?auto_210715 ) ) ( not ( = ?auto_210705 ?auto_210716 ) ) ( not ( = ?auto_210706 ?auto_210707 ) ) ( not ( = ?auto_210706 ?auto_210708 ) ) ( not ( = ?auto_210706 ?auto_210709 ) ) ( not ( = ?auto_210706 ?auto_210710 ) ) ( not ( = ?auto_210706 ?auto_210711 ) ) ( not ( = ?auto_210706 ?auto_210712 ) ) ( not ( = ?auto_210706 ?auto_210713 ) ) ( not ( = ?auto_210706 ?auto_210714 ) ) ( not ( = ?auto_210706 ?auto_210715 ) ) ( not ( = ?auto_210706 ?auto_210716 ) ) ( not ( = ?auto_210707 ?auto_210708 ) ) ( not ( = ?auto_210707 ?auto_210709 ) ) ( not ( = ?auto_210707 ?auto_210710 ) ) ( not ( = ?auto_210707 ?auto_210711 ) ) ( not ( = ?auto_210707 ?auto_210712 ) ) ( not ( = ?auto_210707 ?auto_210713 ) ) ( not ( = ?auto_210707 ?auto_210714 ) ) ( not ( = ?auto_210707 ?auto_210715 ) ) ( not ( = ?auto_210707 ?auto_210716 ) ) ( not ( = ?auto_210708 ?auto_210709 ) ) ( not ( = ?auto_210708 ?auto_210710 ) ) ( not ( = ?auto_210708 ?auto_210711 ) ) ( not ( = ?auto_210708 ?auto_210712 ) ) ( not ( = ?auto_210708 ?auto_210713 ) ) ( not ( = ?auto_210708 ?auto_210714 ) ) ( not ( = ?auto_210708 ?auto_210715 ) ) ( not ( = ?auto_210708 ?auto_210716 ) ) ( not ( = ?auto_210709 ?auto_210710 ) ) ( not ( = ?auto_210709 ?auto_210711 ) ) ( not ( = ?auto_210709 ?auto_210712 ) ) ( not ( = ?auto_210709 ?auto_210713 ) ) ( not ( = ?auto_210709 ?auto_210714 ) ) ( not ( = ?auto_210709 ?auto_210715 ) ) ( not ( = ?auto_210709 ?auto_210716 ) ) ( not ( = ?auto_210710 ?auto_210711 ) ) ( not ( = ?auto_210710 ?auto_210712 ) ) ( not ( = ?auto_210710 ?auto_210713 ) ) ( not ( = ?auto_210710 ?auto_210714 ) ) ( not ( = ?auto_210710 ?auto_210715 ) ) ( not ( = ?auto_210710 ?auto_210716 ) ) ( not ( = ?auto_210711 ?auto_210712 ) ) ( not ( = ?auto_210711 ?auto_210713 ) ) ( not ( = ?auto_210711 ?auto_210714 ) ) ( not ( = ?auto_210711 ?auto_210715 ) ) ( not ( = ?auto_210711 ?auto_210716 ) ) ( not ( = ?auto_210712 ?auto_210713 ) ) ( not ( = ?auto_210712 ?auto_210714 ) ) ( not ( = ?auto_210712 ?auto_210715 ) ) ( not ( = ?auto_210712 ?auto_210716 ) ) ( not ( = ?auto_210713 ?auto_210714 ) ) ( not ( = ?auto_210713 ?auto_210715 ) ) ( not ( = ?auto_210713 ?auto_210716 ) ) ( not ( = ?auto_210714 ?auto_210715 ) ) ( not ( = ?auto_210714 ?auto_210716 ) ) ( not ( = ?auto_210715 ?auto_210716 ) ) ( ON ?auto_210714 ?auto_210715 ) ( CLEAR ?auto_210712 ) ( ON ?auto_210713 ?auto_210714 ) ( CLEAR ?auto_210713 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_210705 ?auto_210706 ?auto_210707 ?auto_210708 ?auto_210709 ?auto_210710 ?auto_210711 ?auto_210712 ?auto_210713 )
      ( MAKE-11PILE ?auto_210705 ?auto_210706 ?auto_210707 ?auto_210708 ?auto_210709 ?auto_210710 ?auto_210711 ?auto_210712 ?auto_210713 ?auto_210714 ?auto_210715 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_210751 - BLOCK
      ?auto_210752 - BLOCK
      ?auto_210753 - BLOCK
      ?auto_210754 - BLOCK
      ?auto_210755 - BLOCK
      ?auto_210756 - BLOCK
      ?auto_210757 - BLOCK
      ?auto_210758 - BLOCK
      ?auto_210759 - BLOCK
      ?auto_210760 - BLOCK
      ?auto_210761 - BLOCK
    )
    :vars
    (
      ?auto_210762 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_210761 ?auto_210762 ) ( ON-TABLE ?auto_210751 ) ( ON ?auto_210752 ?auto_210751 ) ( ON ?auto_210753 ?auto_210752 ) ( ON ?auto_210754 ?auto_210753 ) ( ON ?auto_210755 ?auto_210754 ) ( ON ?auto_210756 ?auto_210755 ) ( ON ?auto_210757 ?auto_210756 ) ( not ( = ?auto_210751 ?auto_210752 ) ) ( not ( = ?auto_210751 ?auto_210753 ) ) ( not ( = ?auto_210751 ?auto_210754 ) ) ( not ( = ?auto_210751 ?auto_210755 ) ) ( not ( = ?auto_210751 ?auto_210756 ) ) ( not ( = ?auto_210751 ?auto_210757 ) ) ( not ( = ?auto_210751 ?auto_210758 ) ) ( not ( = ?auto_210751 ?auto_210759 ) ) ( not ( = ?auto_210751 ?auto_210760 ) ) ( not ( = ?auto_210751 ?auto_210761 ) ) ( not ( = ?auto_210751 ?auto_210762 ) ) ( not ( = ?auto_210752 ?auto_210753 ) ) ( not ( = ?auto_210752 ?auto_210754 ) ) ( not ( = ?auto_210752 ?auto_210755 ) ) ( not ( = ?auto_210752 ?auto_210756 ) ) ( not ( = ?auto_210752 ?auto_210757 ) ) ( not ( = ?auto_210752 ?auto_210758 ) ) ( not ( = ?auto_210752 ?auto_210759 ) ) ( not ( = ?auto_210752 ?auto_210760 ) ) ( not ( = ?auto_210752 ?auto_210761 ) ) ( not ( = ?auto_210752 ?auto_210762 ) ) ( not ( = ?auto_210753 ?auto_210754 ) ) ( not ( = ?auto_210753 ?auto_210755 ) ) ( not ( = ?auto_210753 ?auto_210756 ) ) ( not ( = ?auto_210753 ?auto_210757 ) ) ( not ( = ?auto_210753 ?auto_210758 ) ) ( not ( = ?auto_210753 ?auto_210759 ) ) ( not ( = ?auto_210753 ?auto_210760 ) ) ( not ( = ?auto_210753 ?auto_210761 ) ) ( not ( = ?auto_210753 ?auto_210762 ) ) ( not ( = ?auto_210754 ?auto_210755 ) ) ( not ( = ?auto_210754 ?auto_210756 ) ) ( not ( = ?auto_210754 ?auto_210757 ) ) ( not ( = ?auto_210754 ?auto_210758 ) ) ( not ( = ?auto_210754 ?auto_210759 ) ) ( not ( = ?auto_210754 ?auto_210760 ) ) ( not ( = ?auto_210754 ?auto_210761 ) ) ( not ( = ?auto_210754 ?auto_210762 ) ) ( not ( = ?auto_210755 ?auto_210756 ) ) ( not ( = ?auto_210755 ?auto_210757 ) ) ( not ( = ?auto_210755 ?auto_210758 ) ) ( not ( = ?auto_210755 ?auto_210759 ) ) ( not ( = ?auto_210755 ?auto_210760 ) ) ( not ( = ?auto_210755 ?auto_210761 ) ) ( not ( = ?auto_210755 ?auto_210762 ) ) ( not ( = ?auto_210756 ?auto_210757 ) ) ( not ( = ?auto_210756 ?auto_210758 ) ) ( not ( = ?auto_210756 ?auto_210759 ) ) ( not ( = ?auto_210756 ?auto_210760 ) ) ( not ( = ?auto_210756 ?auto_210761 ) ) ( not ( = ?auto_210756 ?auto_210762 ) ) ( not ( = ?auto_210757 ?auto_210758 ) ) ( not ( = ?auto_210757 ?auto_210759 ) ) ( not ( = ?auto_210757 ?auto_210760 ) ) ( not ( = ?auto_210757 ?auto_210761 ) ) ( not ( = ?auto_210757 ?auto_210762 ) ) ( not ( = ?auto_210758 ?auto_210759 ) ) ( not ( = ?auto_210758 ?auto_210760 ) ) ( not ( = ?auto_210758 ?auto_210761 ) ) ( not ( = ?auto_210758 ?auto_210762 ) ) ( not ( = ?auto_210759 ?auto_210760 ) ) ( not ( = ?auto_210759 ?auto_210761 ) ) ( not ( = ?auto_210759 ?auto_210762 ) ) ( not ( = ?auto_210760 ?auto_210761 ) ) ( not ( = ?auto_210760 ?auto_210762 ) ) ( not ( = ?auto_210761 ?auto_210762 ) ) ( ON ?auto_210760 ?auto_210761 ) ( ON ?auto_210759 ?auto_210760 ) ( CLEAR ?auto_210757 ) ( ON ?auto_210758 ?auto_210759 ) ( CLEAR ?auto_210758 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_210751 ?auto_210752 ?auto_210753 ?auto_210754 ?auto_210755 ?auto_210756 ?auto_210757 ?auto_210758 )
      ( MAKE-11PILE ?auto_210751 ?auto_210752 ?auto_210753 ?auto_210754 ?auto_210755 ?auto_210756 ?auto_210757 ?auto_210758 ?auto_210759 ?auto_210760 ?auto_210761 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_210797 - BLOCK
      ?auto_210798 - BLOCK
      ?auto_210799 - BLOCK
      ?auto_210800 - BLOCK
      ?auto_210801 - BLOCK
      ?auto_210802 - BLOCK
      ?auto_210803 - BLOCK
      ?auto_210804 - BLOCK
      ?auto_210805 - BLOCK
      ?auto_210806 - BLOCK
      ?auto_210807 - BLOCK
    )
    :vars
    (
      ?auto_210808 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_210807 ?auto_210808 ) ( ON-TABLE ?auto_210797 ) ( ON ?auto_210798 ?auto_210797 ) ( ON ?auto_210799 ?auto_210798 ) ( ON ?auto_210800 ?auto_210799 ) ( ON ?auto_210801 ?auto_210800 ) ( ON ?auto_210802 ?auto_210801 ) ( not ( = ?auto_210797 ?auto_210798 ) ) ( not ( = ?auto_210797 ?auto_210799 ) ) ( not ( = ?auto_210797 ?auto_210800 ) ) ( not ( = ?auto_210797 ?auto_210801 ) ) ( not ( = ?auto_210797 ?auto_210802 ) ) ( not ( = ?auto_210797 ?auto_210803 ) ) ( not ( = ?auto_210797 ?auto_210804 ) ) ( not ( = ?auto_210797 ?auto_210805 ) ) ( not ( = ?auto_210797 ?auto_210806 ) ) ( not ( = ?auto_210797 ?auto_210807 ) ) ( not ( = ?auto_210797 ?auto_210808 ) ) ( not ( = ?auto_210798 ?auto_210799 ) ) ( not ( = ?auto_210798 ?auto_210800 ) ) ( not ( = ?auto_210798 ?auto_210801 ) ) ( not ( = ?auto_210798 ?auto_210802 ) ) ( not ( = ?auto_210798 ?auto_210803 ) ) ( not ( = ?auto_210798 ?auto_210804 ) ) ( not ( = ?auto_210798 ?auto_210805 ) ) ( not ( = ?auto_210798 ?auto_210806 ) ) ( not ( = ?auto_210798 ?auto_210807 ) ) ( not ( = ?auto_210798 ?auto_210808 ) ) ( not ( = ?auto_210799 ?auto_210800 ) ) ( not ( = ?auto_210799 ?auto_210801 ) ) ( not ( = ?auto_210799 ?auto_210802 ) ) ( not ( = ?auto_210799 ?auto_210803 ) ) ( not ( = ?auto_210799 ?auto_210804 ) ) ( not ( = ?auto_210799 ?auto_210805 ) ) ( not ( = ?auto_210799 ?auto_210806 ) ) ( not ( = ?auto_210799 ?auto_210807 ) ) ( not ( = ?auto_210799 ?auto_210808 ) ) ( not ( = ?auto_210800 ?auto_210801 ) ) ( not ( = ?auto_210800 ?auto_210802 ) ) ( not ( = ?auto_210800 ?auto_210803 ) ) ( not ( = ?auto_210800 ?auto_210804 ) ) ( not ( = ?auto_210800 ?auto_210805 ) ) ( not ( = ?auto_210800 ?auto_210806 ) ) ( not ( = ?auto_210800 ?auto_210807 ) ) ( not ( = ?auto_210800 ?auto_210808 ) ) ( not ( = ?auto_210801 ?auto_210802 ) ) ( not ( = ?auto_210801 ?auto_210803 ) ) ( not ( = ?auto_210801 ?auto_210804 ) ) ( not ( = ?auto_210801 ?auto_210805 ) ) ( not ( = ?auto_210801 ?auto_210806 ) ) ( not ( = ?auto_210801 ?auto_210807 ) ) ( not ( = ?auto_210801 ?auto_210808 ) ) ( not ( = ?auto_210802 ?auto_210803 ) ) ( not ( = ?auto_210802 ?auto_210804 ) ) ( not ( = ?auto_210802 ?auto_210805 ) ) ( not ( = ?auto_210802 ?auto_210806 ) ) ( not ( = ?auto_210802 ?auto_210807 ) ) ( not ( = ?auto_210802 ?auto_210808 ) ) ( not ( = ?auto_210803 ?auto_210804 ) ) ( not ( = ?auto_210803 ?auto_210805 ) ) ( not ( = ?auto_210803 ?auto_210806 ) ) ( not ( = ?auto_210803 ?auto_210807 ) ) ( not ( = ?auto_210803 ?auto_210808 ) ) ( not ( = ?auto_210804 ?auto_210805 ) ) ( not ( = ?auto_210804 ?auto_210806 ) ) ( not ( = ?auto_210804 ?auto_210807 ) ) ( not ( = ?auto_210804 ?auto_210808 ) ) ( not ( = ?auto_210805 ?auto_210806 ) ) ( not ( = ?auto_210805 ?auto_210807 ) ) ( not ( = ?auto_210805 ?auto_210808 ) ) ( not ( = ?auto_210806 ?auto_210807 ) ) ( not ( = ?auto_210806 ?auto_210808 ) ) ( not ( = ?auto_210807 ?auto_210808 ) ) ( ON ?auto_210806 ?auto_210807 ) ( ON ?auto_210805 ?auto_210806 ) ( ON ?auto_210804 ?auto_210805 ) ( CLEAR ?auto_210802 ) ( ON ?auto_210803 ?auto_210804 ) ( CLEAR ?auto_210803 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_210797 ?auto_210798 ?auto_210799 ?auto_210800 ?auto_210801 ?auto_210802 ?auto_210803 )
      ( MAKE-11PILE ?auto_210797 ?auto_210798 ?auto_210799 ?auto_210800 ?auto_210801 ?auto_210802 ?auto_210803 ?auto_210804 ?auto_210805 ?auto_210806 ?auto_210807 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_210843 - BLOCK
      ?auto_210844 - BLOCK
      ?auto_210845 - BLOCK
      ?auto_210846 - BLOCK
      ?auto_210847 - BLOCK
      ?auto_210848 - BLOCK
      ?auto_210849 - BLOCK
      ?auto_210850 - BLOCK
      ?auto_210851 - BLOCK
      ?auto_210852 - BLOCK
      ?auto_210853 - BLOCK
    )
    :vars
    (
      ?auto_210854 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_210853 ?auto_210854 ) ( ON-TABLE ?auto_210843 ) ( ON ?auto_210844 ?auto_210843 ) ( ON ?auto_210845 ?auto_210844 ) ( ON ?auto_210846 ?auto_210845 ) ( ON ?auto_210847 ?auto_210846 ) ( not ( = ?auto_210843 ?auto_210844 ) ) ( not ( = ?auto_210843 ?auto_210845 ) ) ( not ( = ?auto_210843 ?auto_210846 ) ) ( not ( = ?auto_210843 ?auto_210847 ) ) ( not ( = ?auto_210843 ?auto_210848 ) ) ( not ( = ?auto_210843 ?auto_210849 ) ) ( not ( = ?auto_210843 ?auto_210850 ) ) ( not ( = ?auto_210843 ?auto_210851 ) ) ( not ( = ?auto_210843 ?auto_210852 ) ) ( not ( = ?auto_210843 ?auto_210853 ) ) ( not ( = ?auto_210843 ?auto_210854 ) ) ( not ( = ?auto_210844 ?auto_210845 ) ) ( not ( = ?auto_210844 ?auto_210846 ) ) ( not ( = ?auto_210844 ?auto_210847 ) ) ( not ( = ?auto_210844 ?auto_210848 ) ) ( not ( = ?auto_210844 ?auto_210849 ) ) ( not ( = ?auto_210844 ?auto_210850 ) ) ( not ( = ?auto_210844 ?auto_210851 ) ) ( not ( = ?auto_210844 ?auto_210852 ) ) ( not ( = ?auto_210844 ?auto_210853 ) ) ( not ( = ?auto_210844 ?auto_210854 ) ) ( not ( = ?auto_210845 ?auto_210846 ) ) ( not ( = ?auto_210845 ?auto_210847 ) ) ( not ( = ?auto_210845 ?auto_210848 ) ) ( not ( = ?auto_210845 ?auto_210849 ) ) ( not ( = ?auto_210845 ?auto_210850 ) ) ( not ( = ?auto_210845 ?auto_210851 ) ) ( not ( = ?auto_210845 ?auto_210852 ) ) ( not ( = ?auto_210845 ?auto_210853 ) ) ( not ( = ?auto_210845 ?auto_210854 ) ) ( not ( = ?auto_210846 ?auto_210847 ) ) ( not ( = ?auto_210846 ?auto_210848 ) ) ( not ( = ?auto_210846 ?auto_210849 ) ) ( not ( = ?auto_210846 ?auto_210850 ) ) ( not ( = ?auto_210846 ?auto_210851 ) ) ( not ( = ?auto_210846 ?auto_210852 ) ) ( not ( = ?auto_210846 ?auto_210853 ) ) ( not ( = ?auto_210846 ?auto_210854 ) ) ( not ( = ?auto_210847 ?auto_210848 ) ) ( not ( = ?auto_210847 ?auto_210849 ) ) ( not ( = ?auto_210847 ?auto_210850 ) ) ( not ( = ?auto_210847 ?auto_210851 ) ) ( not ( = ?auto_210847 ?auto_210852 ) ) ( not ( = ?auto_210847 ?auto_210853 ) ) ( not ( = ?auto_210847 ?auto_210854 ) ) ( not ( = ?auto_210848 ?auto_210849 ) ) ( not ( = ?auto_210848 ?auto_210850 ) ) ( not ( = ?auto_210848 ?auto_210851 ) ) ( not ( = ?auto_210848 ?auto_210852 ) ) ( not ( = ?auto_210848 ?auto_210853 ) ) ( not ( = ?auto_210848 ?auto_210854 ) ) ( not ( = ?auto_210849 ?auto_210850 ) ) ( not ( = ?auto_210849 ?auto_210851 ) ) ( not ( = ?auto_210849 ?auto_210852 ) ) ( not ( = ?auto_210849 ?auto_210853 ) ) ( not ( = ?auto_210849 ?auto_210854 ) ) ( not ( = ?auto_210850 ?auto_210851 ) ) ( not ( = ?auto_210850 ?auto_210852 ) ) ( not ( = ?auto_210850 ?auto_210853 ) ) ( not ( = ?auto_210850 ?auto_210854 ) ) ( not ( = ?auto_210851 ?auto_210852 ) ) ( not ( = ?auto_210851 ?auto_210853 ) ) ( not ( = ?auto_210851 ?auto_210854 ) ) ( not ( = ?auto_210852 ?auto_210853 ) ) ( not ( = ?auto_210852 ?auto_210854 ) ) ( not ( = ?auto_210853 ?auto_210854 ) ) ( ON ?auto_210852 ?auto_210853 ) ( ON ?auto_210851 ?auto_210852 ) ( ON ?auto_210850 ?auto_210851 ) ( ON ?auto_210849 ?auto_210850 ) ( CLEAR ?auto_210847 ) ( ON ?auto_210848 ?auto_210849 ) ( CLEAR ?auto_210848 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_210843 ?auto_210844 ?auto_210845 ?auto_210846 ?auto_210847 ?auto_210848 )
      ( MAKE-11PILE ?auto_210843 ?auto_210844 ?auto_210845 ?auto_210846 ?auto_210847 ?auto_210848 ?auto_210849 ?auto_210850 ?auto_210851 ?auto_210852 ?auto_210853 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_210889 - BLOCK
      ?auto_210890 - BLOCK
      ?auto_210891 - BLOCK
      ?auto_210892 - BLOCK
      ?auto_210893 - BLOCK
      ?auto_210894 - BLOCK
      ?auto_210895 - BLOCK
      ?auto_210896 - BLOCK
      ?auto_210897 - BLOCK
      ?auto_210898 - BLOCK
      ?auto_210899 - BLOCK
    )
    :vars
    (
      ?auto_210900 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_210899 ?auto_210900 ) ( ON-TABLE ?auto_210889 ) ( ON ?auto_210890 ?auto_210889 ) ( ON ?auto_210891 ?auto_210890 ) ( ON ?auto_210892 ?auto_210891 ) ( not ( = ?auto_210889 ?auto_210890 ) ) ( not ( = ?auto_210889 ?auto_210891 ) ) ( not ( = ?auto_210889 ?auto_210892 ) ) ( not ( = ?auto_210889 ?auto_210893 ) ) ( not ( = ?auto_210889 ?auto_210894 ) ) ( not ( = ?auto_210889 ?auto_210895 ) ) ( not ( = ?auto_210889 ?auto_210896 ) ) ( not ( = ?auto_210889 ?auto_210897 ) ) ( not ( = ?auto_210889 ?auto_210898 ) ) ( not ( = ?auto_210889 ?auto_210899 ) ) ( not ( = ?auto_210889 ?auto_210900 ) ) ( not ( = ?auto_210890 ?auto_210891 ) ) ( not ( = ?auto_210890 ?auto_210892 ) ) ( not ( = ?auto_210890 ?auto_210893 ) ) ( not ( = ?auto_210890 ?auto_210894 ) ) ( not ( = ?auto_210890 ?auto_210895 ) ) ( not ( = ?auto_210890 ?auto_210896 ) ) ( not ( = ?auto_210890 ?auto_210897 ) ) ( not ( = ?auto_210890 ?auto_210898 ) ) ( not ( = ?auto_210890 ?auto_210899 ) ) ( not ( = ?auto_210890 ?auto_210900 ) ) ( not ( = ?auto_210891 ?auto_210892 ) ) ( not ( = ?auto_210891 ?auto_210893 ) ) ( not ( = ?auto_210891 ?auto_210894 ) ) ( not ( = ?auto_210891 ?auto_210895 ) ) ( not ( = ?auto_210891 ?auto_210896 ) ) ( not ( = ?auto_210891 ?auto_210897 ) ) ( not ( = ?auto_210891 ?auto_210898 ) ) ( not ( = ?auto_210891 ?auto_210899 ) ) ( not ( = ?auto_210891 ?auto_210900 ) ) ( not ( = ?auto_210892 ?auto_210893 ) ) ( not ( = ?auto_210892 ?auto_210894 ) ) ( not ( = ?auto_210892 ?auto_210895 ) ) ( not ( = ?auto_210892 ?auto_210896 ) ) ( not ( = ?auto_210892 ?auto_210897 ) ) ( not ( = ?auto_210892 ?auto_210898 ) ) ( not ( = ?auto_210892 ?auto_210899 ) ) ( not ( = ?auto_210892 ?auto_210900 ) ) ( not ( = ?auto_210893 ?auto_210894 ) ) ( not ( = ?auto_210893 ?auto_210895 ) ) ( not ( = ?auto_210893 ?auto_210896 ) ) ( not ( = ?auto_210893 ?auto_210897 ) ) ( not ( = ?auto_210893 ?auto_210898 ) ) ( not ( = ?auto_210893 ?auto_210899 ) ) ( not ( = ?auto_210893 ?auto_210900 ) ) ( not ( = ?auto_210894 ?auto_210895 ) ) ( not ( = ?auto_210894 ?auto_210896 ) ) ( not ( = ?auto_210894 ?auto_210897 ) ) ( not ( = ?auto_210894 ?auto_210898 ) ) ( not ( = ?auto_210894 ?auto_210899 ) ) ( not ( = ?auto_210894 ?auto_210900 ) ) ( not ( = ?auto_210895 ?auto_210896 ) ) ( not ( = ?auto_210895 ?auto_210897 ) ) ( not ( = ?auto_210895 ?auto_210898 ) ) ( not ( = ?auto_210895 ?auto_210899 ) ) ( not ( = ?auto_210895 ?auto_210900 ) ) ( not ( = ?auto_210896 ?auto_210897 ) ) ( not ( = ?auto_210896 ?auto_210898 ) ) ( not ( = ?auto_210896 ?auto_210899 ) ) ( not ( = ?auto_210896 ?auto_210900 ) ) ( not ( = ?auto_210897 ?auto_210898 ) ) ( not ( = ?auto_210897 ?auto_210899 ) ) ( not ( = ?auto_210897 ?auto_210900 ) ) ( not ( = ?auto_210898 ?auto_210899 ) ) ( not ( = ?auto_210898 ?auto_210900 ) ) ( not ( = ?auto_210899 ?auto_210900 ) ) ( ON ?auto_210898 ?auto_210899 ) ( ON ?auto_210897 ?auto_210898 ) ( ON ?auto_210896 ?auto_210897 ) ( ON ?auto_210895 ?auto_210896 ) ( ON ?auto_210894 ?auto_210895 ) ( CLEAR ?auto_210892 ) ( ON ?auto_210893 ?auto_210894 ) ( CLEAR ?auto_210893 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_210889 ?auto_210890 ?auto_210891 ?auto_210892 ?auto_210893 )
      ( MAKE-11PILE ?auto_210889 ?auto_210890 ?auto_210891 ?auto_210892 ?auto_210893 ?auto_210894 ?auto_210895 ?auto_210896 ?auto_210897 ?auto_210898 ?auto_210899 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_210935 - BLOCK
      ?auto_210936 - BLOCK
      ?auto_210937 - BLOCK
      ?auto_210938 - BLOCK
      ?auto_210939 - BLOCK
      ?auto_210940 - BLOCK
      ?auto_210941 - BLOCK
      ?auto_210942 - BLOCK
      ?auto_210943 - BLOCK
      ?auto_210944 - BLOCK
      ?auto_210945 - BLOCK
    )
    :vars
    (
      ?auto_210946 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_210945 ?auto_210946 ) ( ON-TABLE ?auto_210935 ) ( ON ?auto_210936 ?auto_210935 ) ( ON ?auto_210937 ?auto_210936 ) ( not ( = ?auto_210935 ?auto_210936 ) ) ( not ( = ?auto_210935 ?auto_210937 ) ) ( not ( = ?auto_210935 ?auto_210938 ) ) ( not ( = ?auto_210935 ?auto_210939 ) ) ( not ( = ?auto_210935 ?auto_210940 ) ) ( not ( = ?auto_210935 ?auto_210941 ) ) ( not ( = ?auto_210935 ?auto_210942 ) ) ( not ( = ?auto_210935 ?auto_210943 ) ) ( not ( = ?auto_210935 ?auto_210944 ) ) ( not ( = ?auto_210935 ?auto_210945 ) ) ( not ( = ?auto_210935 ?auto_210946 ) ) ( not ( = ?auto_210936 ?auto_210937 ) ) ( not ( = ?auto_210936 ?auto_210938 ) ) ( not ( = ?auto_210936 ?auto_210939 ) ) ( not ( = ?auto_210936 ?auto_210940 ) ) ( not ( = ?auto_210936 ?auto_210941 ) ) ( not ( = ?auto_210936 ?auto_210942 ) ) ( not ( = ?auto_210936 ?auto_210943 ) ) ( not ( = ?auto_210936 ?auto_210944 ) ) ( not ( = ?auto_210936 ?auto_210945 ) ) ( not ( = ?auto_210936 ?auto_210946 ) ) ( not ( = ?auto_210937 ?auto_210938 ) ) ( not ( = ?auto_210937 ?auto_210939 ) ) ( not ( = ?auto_210937 ?auto_210940 ) ) ( not ( = ?auto_210937 ?auto_210941 ) ) ( not ( = ?auto_210937 ?auto_210942 ) ) ( not ( = ?auto_210937 ?auto_210943 ) ) ( not ( = ?auto_210937 ?auto_210944 ) ) ( not ( = ?auto_210937 ?auto_210945 ) ) ( not ( = ?auto_210937 ?auto_210946 ) ) ( not ( = ?auto_210938 ?auto_210939 ) ) ( not ( = ?auto_210938 ?auto_210940 ) ) ( not ( = ?auto_210938 ?auto_210941 ) ) ( not ( = ?auto_210938 ?auto_210942 ) ) ( not ( = ?auto_210938 ?auto_210943 ) ) ( not ( = ?auto_210938 ?auto_210944 ) ) ( not ( = ?auto_210938 ?auto_210945 ) ) ( not ( = ?auto_210938 ?auto_210946 ) ) ( not ( = ?auto_210939 ?auto_210940 ) ) ( not ( = ?auto_210939 ?auto_210941 ) ) ( not ( = ?auto_210939 ?auto_210942 ) ) ( not ( = ?auto_210939 ?auto_210943 ) ) ( not ( = ?auto_210939 ?auto_210944 ) ) ( not ( = ?auto_210939 ?auto_210945 ) ) ( not ( = ?auto_210939 ?auto_210946 ) ) ( not ( = ?auto_210940 ?auto_210941 ) ) ( not ( = ?auto_210940 ?auto_210942 ) ) ( not ( = ?auto_210940 ?auto_210943 ) ) ( not ( = ?auto_210940 ?auto_210944 ) ) ( not ( = ?auto_210940 ?auto_210945 ) ) ( not ( = ?auto_210940 ?auto_210946 ) ) ( not ( = ?auto_210941 ?auto_210942 ) ) ( not ( = ?auto_210941 ?auto_210943 ) ) ( not ( = ?auto_210941 ?auto_210944 ) ) ( not ( = ?auto_210941 ?auto_210945 ) ) ( not ( = ?auto_210941 ?auto_210946 ) ) ( not ( = ?auto_210942 ?auto_210943 ) ) ( not ( = ?auto_210942 ?auto_210944 ) ) ( not ( = ?auto_210942 ?auto_210945 ) ) ( not ( = ?auto_210942 ?auto_210946 ) ) ( not ( = ?auto_210943 ?auto_210944 ) ) ( not ( = ?auto_210943 ?auto_210945 ) ) ( not ( = ?auto_210943 ?auto_210946 ) ) ( not ( = ?auto_210944 ?auto_210945 ) ) ( not ( = ?auto_210944 ?auto_210946 ) ) ( not ( = ?auto_210945 ?auto_210946 ) ) ( ON ?auto_210944 ?auto_210945 ) ( ON ?auto_210943 ?auto_210944 ) ( ON ?auto_210942 ?auto_210943 ) ( ON ?auto_210941 ?auto_210942 ) ( ON ?auto_210940 ?auto_210941 ) ( ON ?auto_210939 ?auto_210940 ) ( CLEAR ?auto_210937 ) ( ON ?auto_210938 ?auto_210939 ) ( CLEAR ?auto_210938 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_210935 ?auto_210936 ?auto_210937 ?auto_210938 )
      ( MAKE-11PILE ?auto_210935 ?auto_210936 ?auto_210937 ?auto_210938 ?auto_210939 ?auto_210940 ?auto_210941 ?auto_210942 ?auto_210943 ?auto_210944 ?auto_210945 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_210981 - BLOCK
      ?auto_210982 - BLOCK
      ?auto_210983 - BLOCK
      ?auto_210984 - BLOCK
      ?auto_210985 - BLOCK
      ?auto_210986 - BLOCK
      ?auto_210987 - BLOCK
      ?auto_210988 - BLOCK
      ?auto_210989 - BLOCK
      ?auto_210990 - BLOCK
      ?auto_210991 - BLOCK
    )
    :vars
    (
      ?auto_210992 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_210991 ?auto_210992 ) ( ON-TABLE ?auto_210981 ) ( ON ?auto_210982 ?auto_210981 ) ( not ( = ?auto_210981 ?auto_210982 ) ) ( not ( = ?auto_210981 ?auto_210983 ) ) ( not ( = ?auto_210981 ?auto_210984 ) ) ( not ( = ?auto_210981 ?auto_210985 ) ) ( not ( = ?auto_210981 ?auto_210986 ) ) ( not ( = ?auto_210981 ?auto_210987 ) ) ( not ( = ?auto_210981 ?auto_210988 ) ) ( not ( = ?auto_210981 ?auto_210989 ) ) ( not ( = ?auto_210981 ?auto_210990 ) ) ( not ( = ?auto_210981 ?auto_210991 ) ) ( not ( = ?auto_210981 ?auto_210992 ) ) ( not ( = ?auto_210982 ?auto_210983 ) ) ( not ( = ?auto_210982 ?auto_210984 ) ) ( not ( = ?auto_210982 ?auto_210985 ) ) ( not ( = ?auto_210982 ?auto_210986 ) ) ( not ( = ?auto_210982 ?auto_210987 ) ) ( not ( = ?auto_210982 ?auto_210988 ) ) ( not ( = ?auto_210982 ?auto_210989 ) ) ( not ( = ?auto_210982 ?auto_210990 ) ) ( not ( = ?auto_210982 ?auto_210991 ) ) ( not ( = ?auto_210982 ?auto_210992 ) ) ( not ( = ?auto_210983 ?auto_210984 ) ) ( not ( = ?auto_210983 ?auto_210985 ) ) ( not ( = ?auto_210983 ?auto_210986 ) ) ( not ( = ?auto_210983 ?auto_210987 ) ) ( not ( = ?auto_210983 ?auto_210988 ) ) ( not ( = ?auto_210983 ?auto_210989 ) ) ( not ( = ?auto_210983 ?auto_210990 ) ) ( not ( = ?auto_210983 ?auto_210991 ) ) ( not ( = ?auto_210983 ?auto_210992 ) ) ( not ( = ?auto_210984 ?auto_210985 ) ) ( not ( = ?auto_210984 ?auto_210986 ) ) ( not ( = ?auto_210984 ?auto_210987 ) ) ( not ( = ?auto_210984 ?auto_210988 ) ) ( not ( = ?auto_210984 ?auto_210989 ) ) ( not ( = ?auto_210984 ?auto_210990 ) ) ( not ( = ?auto_210984 ?auto_210991 ) ) ( not ( = ?auto_210984 ?auto_210992 ) ) ( not ( = ?auto_210985 ?auto_210986 ) ) ( not ( = ?auto_210985 ?auto_210987 ) ) ( not ( = ?auto_210985 ?auto_210988 ) ) ( not ( = ?auto_210985 ?auto_210989 ) ) ( not ( = ?auto_210985 ?auto_210990 ) ) ( not ( = ?auto_210985 ?auto_210991 ) ) ( not ( = ?auto_210985 ?auto_210992 ) ) ( not ( = ?auto_210986 ?auto_210987 ) ) ( not ( = ?auto_210986 ?auto_210988 ) ) ( not ( = ?auto_210986 ?auto_210989 ) ) ( not ( = ?auto_210986 ?auto_210990 ) ) ( not ( = ?auto_210986 ?auto_210991 ) ) ( not ( = ?auto_210986 ?auto_210992 ) ) ( not ( = ?auto_210987 ?auto_210988 ) ) ( not ( = ?auto_210987 ?auto_210989 ) ) ( not ( = ?auto_210987 ?auto_210990 ) ) ( not ( = ?auto_210987 ?auto_210991 ) ) ( not ( = ?auto_210987 ?auto_210992 ) ) ( not ( = ?auto_210988 ?auto_210989 ) ) ( not ( = ?auto_210988 ?auto_210990 ) ) ( not ( = ?auto_210988 ?auto_210991 ) ) ( not ( = ?auto_210988 ?auto_210992 ) ) ( not ( = ?auto_210989 ?auto_210990 ) ) ( not ( = ?auto_210989 ?auto_210991 ) ) ( not ( = ?auto_210989 ?auto_210992 ) ) ( not ( = ?auto_210990 ?auto_210991 ) ) ( not ( = ?auto_210990 ?auto_210992 ) ) ( not ( = ?auto_210991 ?auto_210992 ) ) ( ON ?auto_210990 ?auto_210991 ) ( ON ?auto_210989 ?auto_210990 ) ( ON ?auto_210988 ?auto_210989 ) ( ON ?auto_210987 ?auto_210988 ) ( ON ?auto_210986 ?auto_210987 ) ( ON ?auto_210985 ?auto_210986 ) ( ON ?auto_210984 ?auto_210985 ) ( CLEAR ?auto_210982 ) ( ON ?auto_210983 ?auto_210984 ) ( CLEAR ?auto_210983 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_210981 ?auto_210982 ?auto_210983 )
      ( MAKE-11PILE ?auto_210981 ?auto_210982 ?auto_210983 ?auto_210984 ?auto_210985 ?auto_210986 ?auto_210987 ?auto_210988 ?auto_210989 ?auto_210990 ?auto_210991 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_211027 - BLOCK
      ?auto_211028 - BLOCK
      ?auto_211029 - BLOCK
      ?auto_211030 - BLOCK
      ?auto_211031 - BLOCK
      ?auto_211032 - BLOCK
      ?auto_211033 - BLOCK
      ?auto_211034 - BLOCK
      ?auto_211035 - BLOCK
      ?auto_211036 - BLOCK
      ?auto_211037 - BLOCK
    )
    :vars
    (
      ?auto_211038 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_211037 ?auto_211038 ) ( ON-TABLE ?auto_211027 ) ( not ( = ?auto_211027 ?auto_211028 ) ) ( not ( = ?auto_211027 ?auto_211029 ) ) ( not ( = ?auto_211027 ?auto_211030 ) ) ( not ( = ?auto_211027 ?auto_211031 ) ) ( not ( = ?auto_211027 ?auto_211032 ) ) ( not ( = ?auto_211027 ?auto_211033 ) ) ( not ( = ?auto_211027 ?auto_211034 ) ) ( not ( = ?auto_211027 ?auto_211035 ) ) ( not ( = ?auto_211027 ?auto_211036 ) ) ( not ( = ?auto_211027 ?auto_211037 ) ) ( not ( = ?auto_211027 ?auto_211038 ) ) ( not ( = ?auto_211028 ?auto_211029 ) ) ( not ( = ?auto_211028 ?auto_211030 ) ) ( not ( = ?auto_211028 ?auto_211031 ) ) ( not ( = ?auto_211028 ?auto_211032 ) ) ( not ( = ?auto_211028 ?auto_211033 ) ) ( not ( = ?auto_211028 ?auto_211034 ) ) ( not ( = ?auto_211028 ?auto_211035 ) ) ( not ( = ?auto_211028 ?auto_211036 ) ) ( not ( = ?auto_211028 ?auto_211037 ) ) ( not ( = ?auto_211028 ?auto_211038 ) ) ( not ( = ?auto_211029 ?auto_211030 ) ) ( not ( = ?auto_211029 ?auto_211031 ) ) ( not ( = ?auto_211029 ?auto_211032 ) ) ( not ( = ?auto_211029 ?auto_211033 ) ) ( not ( = ?auto_211029 ?auto_211034 ) ) ( not ( = ?auto_211029 ?auto_211035 ) ) ( not ( = ?auto_211029 ?auto_211036 ) ) ( not ( = ?auto_211029 ?auto_211037 ) ) ( not ( = ?auto_211029 ?auto_211038 ) ) ( not ( = ?auto_211030 ?auto_211031 ) ) ( not ( = ?auto_211030 ?auto_211032 ) ) ( not ( = ?auto_211030 ?auto_211033 ) ) ( not ( = ?auto_211030 ?auto_211034 ) ) ( not ( = ?auto_211030 ?auto_211035 ) ) ( not ( = ?auto_211030 ?auto_211036 ) ) ( not ( = ?auto_211030 ?auto_211037 ) ) ( not ( = ?auto_211030 ?auto_211038 ) ) ( not ( = ?auto_211031 ?auto_211032 ) ) ( not ( = ?auto_211031 ?auto_211033 ) ) ( not ( = ?auto_211031 ?auto_211034 ) ) ( not ( = ?auto_211031 ?auto_211035 ) ) ( not ( = ?auto_211031 ?auto_211036 ) ) ( not ( = ?auto_211031 ?auto_211037 ) ) ( not ( = ?auto_211031 ?auto_211038 ) ) ( not ( = ?auto_211032 ?auto_211033 ) ) ( not ( = ?auto_211032 ?auto_211034 ) ) ( not ( = ?auto_211032 ?auto_211035 ) ) ( not ( = ?auto_211032 ?auto_211036 ) ) ( not ( = ?auto_211032 ?auto_211037 ) ) ( not ( = ?auto_211032 ?auto_211038 ) ) ( not ( = ?auto_211033 ?auto_211034 ) ) ( not ( = ?auto_211033 ?auto_211035 ) ) ( not ( = ?auto_211033 ?auto_211036 ) ) ( not ( = ?auto_211033 ?auto_211037 ) ) ( not ( = ?auto_211033 ?auto_211038 ) ) ( not ( = ?auto_211034 ?auto_211035 ) ) ( not ( = ?auto_211034 ?auto_211036 ) ) ( not ( = ?auto_211034 ?auto_211037 ) ) ( not ( = ?auto_211034 ?auto_211038 ) ) ( not ( = ?auto_211035 ?auto_211036 ) ) ( not ( = ?auto_211035 ?auto_211037 ) ) ( not ( = ?auto_211035 ?auto_211038 ) ) ( not ( = ?auto_211036 ?auto_211037 ) ) ( not ( = ?auto_211036 ?auto_211038 ) ) ( not ( = ?auto_211037 ?auto_211038 ) ) ( ON ?auto_211036 ?auto_211037 ) ( ON ?auto_211035 ?auto_211036 ) ( ON ?auto_211034 ?auto_211035 ) ( ON ?auto_211033 ?auto_211034 ) ( ON ?auto_211032 ?auto_211033 ) ( ON ?auto_211031 ?auto_211032 ) ( ON ?auto_211030 ?auto_211031 ) ( ON ?auto_211029 ?auto_211030 ) ( CLEAR ?auto_211027 ) ( ON ?auto_211028 ?auto_211029 ) ( CLEAR ?auto_211028 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_211027 ?auto_211028 )
      ( MAKE-11PILE ?auto_211027 ?auto_211028 ?auto_211029 ?auto_211030 ?auto_211031 ?auto_211032 ?auto_211033 ?auto_211034 ?auto_211035 ?auto_211036 ?auto_211037 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_211073 - BLOCK
      ?auto_211074 - BLOCK
      ?auto_211075 - BLOCK
      ?auto_211076 - BLOCK
      ?auto_211077 - BLOCK
      ?auto_211078 - BLOCK
      ?auto_211079 - BLOCK
      ?auto_211080 - BLOCK
      ?auto_211081 - BLOCK
      ?auto_211082 - BLOCK
      ?auto_211083 - BLOCK
    )
    :vars
    (
      ?auto_211084 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_211083 ?auto_211084 ) ( not ( = ?auto_211073 ?auto_211074 ) ) ( not ( = ?auto_211073 ?auto_211075 ) ) ( not ( = ?auto_211073 ?auto_211076 ) ) ( not ( = ?auto_211073 ?auto_211077 ) ) ( not ( = ?auto_211073 ?auto_211078 ) ) ( not ( = ?auto_211073 ?auto_211079 ) ) ( not ( = ?auto_211073 ?auto_211080 ) ) ( not ( = ?auto_211073 ?auto_211081 ) ) ( not ( = ?auto_211073 ?auto_211082 ) ) ( not ( = ?auto_211073 ?auto_211083 ) ) ( not ( = ?auto_211073 ?auto_211084 ) ) ( not ( = ?auto_211074 ?auto_211075 ) ) ( not ( = ?auto_211074 ?auto_211076 ) ) ( not ( = ?auto_211074 ?auto_211077 ) ) ( not ( = ?auto_211074 ?auto_211078 ) ) ( not ( = ?auto_211074 ?auto_211079 ) ) ( not ( = ?auto_211074 ?auto_211080 ) ) ( not ( = ?auto_211074 ?auto_211081 ) ) ( not ( = ?auto_211074 ?auto_211082 ) ) ( not ( = ?auto_211074 ?auto_211083 ) ) ( not ( = ?auto_211074 ?auto_211084 ) ) ( not ( = ?auto_211075 ?auto_211076 ) ) ( not ( = ?auto_211075 ?auto_211077 ) ) ( not ( = ?auto_211075 ?auto_211078 ) ) ( not ( = ?auto_211075 ?auto_211079 ) ) ( not ( = ?auto_211075 ?auto_211080 ) ) ( not ( = ?auto_211075 ?auto_211081 ) ) ( not ( = ?auto_211075 ?auto_211082 ) ) ( not ( = ?auto_211075 ?auto_211083 ) ) ( not ( = ?auto_211075 ?auto_211084 ) ) ( not ( = ?auto_211076 ?auto_211077 ) ) ( not ( = ?auto_211076 ?auto_211078 ) ) ( not ( = ?auto_211076 ?auto_211079 ) ) ( not ( = ?auto_211076 ?auto_211080 ) ) ( not ( = ?auto_211076 ?auto_211081 ) ) ( not ( = ?auto_211076 ?auto_211082 ) ) ( not ( = ?auto_211076 ?auto_211083 ) ) ( not ( = ?auto_211076 ?auto_211084 ) ) ( not ( = ?auto_211077 ?auto_211078 ) ) ( not ( = ?auto_211077 ?auto_211079 ) ) ( not ( = ?auto_211077 ?auto_211080 ) ) ( not ( = ?auto_211077 ?auto_211081 ) ) ( not ( = ?auto_211077 ?auto_211082 ) ) ( not ( = ?auto_211077 ?auto_211083 ) ) ( not ( = ?auto_211077 ?auto_211084 ) ) ( not ( = ?auto_211078 ?auto_211079 ) ) ( not ( = ?auto_211078 ?auto_211080 ) ) ( not ( = ?auto_211078 ?auto_211081 ) ) ( not ( = ?auto_211078 ?auto_211082 ) ) ( not ( = ?auto_211078 ?auto_211083 ) ) ( not ( = ?auto_211078 ?auto_211084 ) ) ( not ( = ?auto_211079 ?auto_211080 ) ) ( not ( = ?auto_211079 ?auto_211081 ) ) ( not ( = ?auto_211079 ?auto_211082 ) ) ( not ( = ?auto_211079 ?auto_211083 ) ) ( not ( = ?auto_211079 ?auto_211084 ) ) ( not ( = ?auto_211080 ?auto_211081 ) ) ( not ( = ?auto_211080 ?auto_211082 ) ) ( not ( = ?auto_211080 ?auto_211083 ) ) ( not ( = ?auto_211080 ?auto_211084 ) ) ( not ( = ?auto_211081 ?auto_211082 ) ) ( not ( = ?auto_211081 ?auto_211083 ) ) ( not ( = ?auto_211081 ?auto_211084 ) ) ( not ( = ?auto_211082 ?auto_211083 ) ) ( not ( = ?auto_211082 ?auto_211084 ) ) ( not ( = ?auto_211083 ?auto_211084 ) ) ( ON ?auto_211082 ?auto_211083 ) ( ON ?auto_211081 ?auto_211082 ) ( ON ?auto_211080 ?auto_211081 ) ( ON ?auto_211079 ?auto_211080 ) ( ON ?auto_211078 ?auto_211079 ) ( ON ?auto_211077 ?auto_211078 ) ( ON ?auto_211076 ?auto_211077 ) ( ON ?auto_211075 ?auto_211076 ) ( ON ?auto_211074 ?auto_211075 ) ( ON ?auto_211073 ?auto_211074 ) ( CLEAR ?auto_211073 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_211073 )
      ( MAKE-11PILE ?auto_211073 ?auto_211074 ?auto_211075 ?auto_211076 ?auto_211077 ?auto_211078 ?auto_211079 ?auto_211080 ?auto_211081 ?auto_211082 ?auto_211083 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_211120 - BLOCK
      ?auto_211121 - BLOCK
      ?auto_211122 - BLOCK
      ?auto_211123 - BLOCK
      ?auto_211124 - BLOCK
      ?auto_211125 - BLOCK
      ?auto_211126 - BLOCK
      ?auto_211127 - BLOCK
      ?auto_211128 - BLOCK
      ?auto_211129 - BLOCK
      ?auto_211130 - BLOCK
      ?auto_211131 - BLOCK
    )
    :vars
    (
      ?auto_211132 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_211130 ) ( ON ?auto_211131 ?auto_211132 ) ( CLEAR ?auto_211131 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_211120 ) ( ON ?auto_211121 ?auto_211120 ) ( ON ?auto_211122 ?auto_211121 ) ( ON ?auto_211123 ?auto_211122 ) ( ON ?auto_211124 ?auto_211123 ) ( ON ?auto_211125 ?auto_211124 ) ( ON ?auto_211126 ?auto_211125 ) ( ON ?auto_211127 ?auto_211126 ) ( ON ?auto_211128 ?auto_211127 ) ( ON ?auto_211129 ?auto_211128 ) ( ON ?auto_211130 ?auto_211129 ) ( not ( = ?auto_211120 ?auto_211121 ) ) ( not ( = ?auto_211120 ?auto_211122 ) ) ( not ( = ?auto_211120 ?auto_211123 ) ) ( not ( = ?auto_211120 ?auto_211124 ) ) ( not ( = ?auto_211120 ?auto_211125 ) ) ( not ( = ?auto_211120 ?auto_211126 ) ) ( not ( = ?auto_211120 ?auto_211127 ) ) ( not ( = ?auto_211120 ?auto_211128 ) ) ( not ( = ?auto_211120 ?auto_211129 ) ) ( not ( = ?auto_211120 ?auto_211130 ) ) ( not ( = ?auto_211120 ?auto_211131 ) ) ( not ( = ?auto_211120 ?auto_211132 ) ) ( not ( = ?auto_211121 ?auto_211122 ) ) ( not ( = ?auto_211121 ?auto_211123 ) ) ( not ( = ?auto_211121 ?auto_211124 ) ) ( not ( = ?auto_211121 ?auto_211125 ) ) ( not ( = ?auto_211121 ?auto_211126 ) ) ( not ( = ?auto_211121 ?auto_211127 ) ) ( not ( = ?auto_211121 ?auto_211128 ) ) ( not ( = ?auto_211121 ?auto_211129 ) ) ( not ( = ?auto_211121 ?auto_211130 ) ) ( not ( = ?auto_211121 ?auto_211131 ) ) ( not ( = ?auto_211121 ?auto_211132 ) ) ( not ( = ?auto_211122 ?auto_211123 ) ) ( not ( = ?auto_211122 ?auto_211124 ) ) ( not ( = ?auto_211122 ?auto_211125 ) ) ( not ( = ?auto_211122 ?auto_211126 ) ) ( not ( = ?auto_211122 ?auto_211127 ) ) ( not ( = ?auto_211122 ?auto_211128 ) ) ( not ( = ?auto_211122 ?auto_211129 ) ) ( not ( = ?auto_211122 ?auto_211130 ) ) ( not ( = ?auto_211122 ?auto_211131 ) ) ( not ( = ?auto_211122 ?auto_211132 ) ) ( not ( = ?auto_211123 ?auto_211124 ) ) ( not ( = ?auto_211123 ?auto_211125 ) ) ( not ( = ?auto_211123 ?auto_211126 ) ) ( not ( = ?auto_211123 ?auto_211127 ) ) ( not ( = ?auto_211123 ?auto_211128 ) ) ( not ( = ?auto_211123 ?auto_211129 ) ) ( not ( = ?auto_211123 ?auto_211130 ) ) ( not ( = ?auto_211123 ?auto_211131 ) ) ( not ( = ?auto_211123 ?auto_211132 ) ) ( not ( = ?auto_211124 ?auto_211125 ) ) ( not ( = ?auto_211124 ?auto_211126 ) ) ( not ( = ?auto_211124 ?auto_211127 ) ) ( not ( = ?auto_211124 ?auto_211128 ) ) ( not ( = ?auto_211124 ?auto_211129 ) ) ( not ( = ?auto_211124 ?auto_211130 ) ) ( not ( = ?auto_211124 ?auto_211131 ) ) ( not ( = ?auto_211124 ?auto_211132 ) ) ( not ( = ?auto_211125 ?auto_211126 ) ) ( not ( = ?auto_211125 ?auto_211127 ) ) ( not ( = ?auto_211125 ?auto_211128 ) ) ( not ( = ?auto_211125 ?auto_211129 ) ) ( not ( = ?auto_211125 ?auto_211130 ) ) ( not ( = ?auto_211125 ?auto_211131 ) ) ( not ( = ?auto_211125 ?auto_211132 ) ) ( not ( = ?auto_211126 ?auto_211127 ) ) ( not ( = ?auto_211126 ?auto_211128 ) ) ( not ( = ?auto_211126 ?auto_211129 ) ) ( not ( = ?auto_211126 ?auto_211130 ) ) ( not ( = ?auto_211126 ?auto_211131 ) ) ( not ( = ?auto_211126 ?auto_211132 ) ) ( not ( = ?auto_211127 ?auto_211128 ) ) ( not ( = ?auto_211127 ?auto_211129 ) ) ( not ( = ?auto_211127 ?auto_211130 ) ) ( not ( = ?auto_211127 ?auto_211131 ) ) ( not ( = ?auto_211127 ?auto_211132 ) ) ( not ( = ?auto_211128 ?auto_211129 ) ) ( not ( = ?auto_211128 ?auto_211130 ) ) ( not ( = ?auto_211128 ?auto_211131 ) ) ( not ( = ?auto_211128 ?auto_211132 ) ) ( not ( = ?auto_211129 ?auto_211130 ) ) ( not ( = ?auto_211129 ?auto_211131 ) ) ( not ( = ?auto_211129 ?auto_211132 ) ) ( not ( = ?auto_211130 ?auto_211131 ) ) ( not ( = ?auto_211130 ?auto_211132 ) ) ( not ( = ?auto_211131 ?auto_211132 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_211131 ?auto_211132 )
      ( !STACK ?auto_211131 ?auto_211130 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_211170 - BLOCK
      ?auto_211171 - BLOCK
      ?auto_211172 - BLOCK
      ?auto_211173 - BLOCK
      ?auto_211174 - BLOCK
      ?auto_211175 - BLOCK
      ?auto_211176 - BLOCK
      ?auto_211177 - BLOCK
      ?auto_211178 - BLOCK
      ?auto_211179 - BLOCK
      ?auto_211180 - BLOCK
      ?auto_211181 - BLOCK
    )
    :vars
    (
      ?auto_211182 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_211181 ?auto_211182 ) ( ON-TABLE ?auto_211170 ) ( ON ?auto_211171 ?auto_211170 ) ( ON ?auto_211172 ?auto_211171 ) ( ON ?auto_211173 ?auto_211172 ) ( ON ?auto_211174 ?auto_211173 ) ( ON ?auto_211175 ?auto_211174 ) ( ON ?auto_211176 ?auto_211175 ) ( ON ?auto_211177 ?auto_211176 ) ( ON ?auto_211178 ?auto_211177 ) ( ON ?auto_211179 ?auto_211178 ) ( not ( = ?auto_211170 ?auto_211171 ) ) ( not ( = ?auto_211170 ?auto_211172 ) ) ( not ( = ?auto_211170 ?auto_211173 ) ) ( not ( = ?auto_211170 ?auto_211174 ) ) ( not ( = ?auto_211170 ?auto_211175 ) ) ( not ( = ?auto_211170 ?auto_211176 ) ) ( not ( = ?auto_211170 ?auto_211177 ) ) ( not ( = ?auto_211170 ?auto_211178 ) ) ( not ( = ?auto_211170 ?auto_211179 ) ) ( not ( = ?auto_211170 ?auto_211180 ) ) ( not ( = ?auto_211170 ?auto_211181 ) ) ( not ( = ?auto_211170 ?auto_211182 ) ) ( not ( = ?auto_211171 ?auto_211172 ) ) ( not ( = ?auto_211171 ?auto_211173 ) ) ( not ( = ?auto_211171 ?auto_211174 ) ) ( not ( = ?auto_211171 ?auto_211175 ) ) ( not ( = ?auto_211171 ?auto_211176 ) ) ( not ( = ?auto_211171 ?auto_211177 ) ) ( not ( = ?auto_211171 ?auto_211178 ) ) ( not ( = ?auto_211171 ?auto_211179 ) ) ( not ( = ?auto_211171 ?auto_211180 ) ) ( not ( = ?auto_211171 ?auto_211181 ) ) ( not ( = ?auto_211171 ?auto_211182 ) ) ( not ( = ?auto_211172 ?auto_211173 ) ) ( not ( = ?auto_211172 ?auto_211174 ) ) ( not ( = ?auto_211172 ?auto_211175 ) ) ( not ( = ?auto_211172 ?auto_211176 ) ) ( not ( = ?auto_211172 ?auto_211177 ) ) ( not ( = ?auto_211172 ?auto_211178 ) ) ( not ( = ?auto_211172 ?auto_211179 ) ) ( not ( = ?auto_211172 ?auto_211180 ) ) ( not ( = ?auto_211172 ?auto_211181 ) ) ( not ( = ?auto_211172 ?auto_211182 ) ) ( not ( = ?auto_211173 ?auto_211174 ) ) ( not ( = ?auto_211173 ?auto_211175 ) ) ( not ( = ?auto_211173 ?auto_211176 ) ) ( not ( = ?auto_211173 ?auto_211177 ) ) ( not ( = ?auto_211173 ?auto_211178 ) ) ( not ( = ?auto_211173 ?auto_211179 ) ) ( not ( = ?auto_211173 ?auto_211180 ) ) ( not ( = ?auto_211173 ?auto_211181 ) ) ( not ( = ?auto_211173 ?auto_211182 ) ) ( not ( = ?auto_211174 ?auto_211175 ) ) ( not ( = ?auto_211174 ?auto_211176 ) ) ( not ( = ?auto_211174 ?auto_211177 ) ) ( not ( = ?auto_211174 ?auto_211178 ) ) ( not ( = ?auto_211174 ?auto_211179 ) ) ( not ( = ?auto_211174 ?auto_211180 ) ) ( not ( = ?auto_211174 ?auto_211181 ) ) ( not ( = ?auto_211174 ?auto_211182 ) ) ( not ( = ?auto_211175 ?auto_211176 ) ) ( not ( = ?auto_211175 ?auto_211177 ) ) ( not ( = ?auto_211175 ?auto_211178 ) ) ( not ( = ?auto_211175 ?auto_211179 ) ) ( not ( = ?auto_211175 ?auto_211180 ) ) ( not ( = ?auto_211175 ?auto_211181 ) ) ( not ( = ?auto_211175 ?auto_211182 ) ) ( not ( = ?auto_211176 ?auto_211177 ) ) ( not ( = ?auto_211176 ?auto_211178 ) ) ( not ( = ?auto_211176 ?auto_211179 ) ) ( not ( = ?auto_211176 ?auto_211180 ) ) ( not ( = ?auto_211176 ?auto_211181 ) ) ( not ( = ?auto_211176 ?auto_211182 ) ) ( not ( = ?auto_211177 ?auto_211178 ) ) ( not ( = ?auto_211177 ?auto_211179 ) ) ( not ( = ?auto_211177 ?auto_211180 ) ) ( not ( = ?auto_211177 ?auto_211181 ) ) ( not ( = ?auto_211177 ?auto_211182 ) ) ( not ( = ?auto_211178 ?auto_211179 ) ) ( not ( = ?auto_211178 ?auto_211180 ) ) ( not ( = ?auto_211178 ?auto_211181 ) ) ( not ( = ?auto_211178 ?auto_211182 ) ) ( not ( = ?auto_211179 ?auto_211180 ) ) ( not ( = ?auto_211179 ?auto_211181 ) ) ( not ( = ?auto_211179 ?auto_211182 ) ) ( not ( = ?auto_211180 ?auto_211181 ) ) ( not ( = ?auto_211180 ?auto_211182 ) ) ( not ( = ?auto_211181 ?auto_211182 ) ) ( CLEAR ?auto_211179 ) ( ON ?auto_211180 ?auto_211181 ) ( CLEAR ?auto_211180 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_211170 ?auto_211171 ?auto_211172 ?auto_211173 ?auto_211174 ?auto_211175 ?auto_211176 ?auto_211177 ?auto_211178 ?auto_211179 ?auto_211180 )
      ( MAKE-12PILE ?auto_211170 ?auto_211171 ?auto_211172 ?auto_211173 ?auto_211174 ?auto_211175 ?auto_211176 ?auto_211177 ?auto_211178 ?auto_211179 ?auto_211180 ?auto_211181 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_211220 - BLOCK
      ?auto_211221 - BLOCK
      ?auto_211222 - BLOCK
      ?auto_211223 - BLOCK
      ?auto_211224 - BLOCK
      ?auto_211225 - BLOCK
      ?auto_211226 - BLOCK
      ?auto_211227 - BLOCK
      ?auto_211228 - BLOCK
      ?auto_211229 - BLOCK
      ?auto_211230 - BLOCK
      ?auto_211231 - BLOCK
    )
    :vars
    (
      ?auto_211232 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_211231 ?auto_211232 ) ( ON-TABLE ?auto_211220 ) ( ON ?auto_211221 ?auto_211220 ) ( ON ?auto_211222 ?auto_211221 ) ( ON ?auto_211223 ?auto_211222 ) ( ON ?auto_211224 ?auto_211223 ) ( ON ?auto_211225 ?auto_211224 ) ( ON ?auto_211226 ?auto_211225 ) ( ON ?auto_211227 ?auto_211226 ) ( ON ?auto_211228 ?auto_211227 ) ( not ( = ?auto_211220 ?auto_211221 ) ) ( not ( = ?auto_211220 ?auto_211222 ) ) ( not ( = ?auto_211220 ?auto_211223 ) ) ( not ( = ?auto_211220 ?auto_211224 ) ) ( not ( = ?auto_211220 ?auto_211225 ) ) ( not ( = ?auto_211220 ?auto_211226 ) ) ( not ( = ?auto_211220 ?auto_211227 ) ) ( not ( = ?auto_211220 ?auto_211228 ) ) ( not ( = ?auto_211220 ?auto_211229 ) ) ( not ( = ?auto_211220 ?auto_211230 ) ) ( not ( = ?auto_211220 ?auto_211231 ) ) ( not ( = ?auto_211220 ?auto_211232 ) ) ( not ( = ?auto_211221 ?auto_211222 ) ) ( not ( = ?auto_211221 ?auto_211223 ) ) ( not ( = ?auto_211221 ?auto_211224 ) ) ( not ( = ?auto_211221 ?auto_211225 ) ) ( not ( = ?auto_211221 ?auto_211226 ) ) ( not ( = ?auto_211221 ?auto_211227 ) ) ( not ( = ?auto_211221 ?auto_211228 ) ) ( not ( = ?auto_211221 ?auto_211229 ) ) ( not ( = ?auto_211221 ?auto_211230 ) ) ( not ( = ?auto_211221 ?auto_211231 ) ) ( not ( = ?auto_211221 ?auto_211232 ) ) ( not ( = ?auto_211222 ?auto_211223 ) ) ( not ( = ?auto_211222 ?auto_211224 ) ) ( not ( = ?auto_211222 ?auto_211225 ) ) ( not ( = ?auto_211222 ?auto_211226 ) ) ( not ( = ?auto_211222 ?auto_211227 ) ) ( not ( = ?auto_211222 ?auto_211228 ) ) ( not ( = ?auto_211222 ?auto_211229 ) ) ( not ( = ?auto_211222 ?auto_211230 ) ) ( not ( = ?auto_211222 ?auto_211231 ) ) ( not ( = ?auto_211222 ?auto_211232 ) ) ( not ( = ?auto_211223 ?auto_211224 ) ) ( not ( = ?auto_211223 ?auto_211225 ) ) ( not ( = ?auto_211223 ?auto_211226 ) ) ( not ( = ?auto_211223 ?auto_211227 ) ) ( not ( = ?auto_211223 ?auto_211228 ) ) ( not ( = ?auto_211223 ?auto_211229 ) ) ( not ( = ?auto_211223 ?auto_211230 ) ) ( not ( = ?auto_211223 ?auto_211231 ) ) ( not ( = ?auto_211223 ?auto_211232 ) ) ( not ( = ?auto_211224 ?auto_211225 ) ) ( not ( = ?auto_211224 ?auto_211226 ) ) ( not ( = ?auto_211224 ?auto_211227 ) ) ( not ( = ?auto_211224 ?auto_211228 ) ) ( not ( = ?auto_211224 ?auto_211229 ) ) ( not ( = ?auto_211224 ?auto_211230 ) ) ( not ( = ?auto_211224 ?auto_211231 ) ) ( not ( = ?auto_211224 ?auto_211232 ) ) ( not ( = ?auto_211225 ?auto_211226 ) ) ( not ( = ?auto_211225 ?auto_211227 ) ) ( not ( = ?auto_211225 ?auto_211228 ) ) ( not ( = ?auto_211225 ?auto_211229 ) ) ( not ( = ?auto_211225 ?auto_211230 ) ) ( not ( = ?auto_211225 ?auto_211231 ) ) ( not ( = ?auto_211225 ?auto_211232 ) ) ( not ( = ?auto_211226 ?auto_211227 ) ) ( not ( = ?auto_211226 ?auto_211228 ) ) ( not ( = ?auto_211226 ?auto_211229 ) ) ( not ( = ?auto_211226 ?auto_211230 ) ) ( not ( = ?auto_211226 ?auto_211231 ) ) ( not ( = ?auto_211226 ?auto_211232 ) ) ( not ( = ?auto_211227 ?auto_211228 ) ) ( not ( = ?auto_211227 ?auto_211229 ) ) ( not ( = ?auto_211227 ?auto_211230 ) ) ( not ( = ?auto_211227 ?auto_211231 ) ) ( not ( = ?auto_211227 ?auto_211232 ) ) ( not ( = ?auto_211228 ?auto_211229 ) ) ( not ( = ?auto_211228 ?auto_211230 ) ) ( not ( = ?auto_211228 ?auto_211231 ) ) ( not ( = ?auto_211228 ?auto_211232 ) ) ( not ( = ?auto_211229 ?auto_211230 ) ) ( not ( = ?auto_211229 ?auto_211231 ) ) ( not ( = ?auto_211229 ?auto_211232 ) ) ( not ( = ?auto_211230 ?auto_211231 ) ) ( not ( = ?auto_211230 ?auto_211232 ) ) ( not ( = ?auto_211231 ?auto_211232 ) ) ( ON ?auto_211230 ?auto_211231 ) ( CLEAR ?auto_211228 ) ( ON ?auto_211229 ?auto_211230 ) ( CLEAR ?auto_211229 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_211220 ?auto_211221 ?auto_211222 ?auto_211223 ?auto_211224 ?auto_211225 ?auto_211226 ?auto_211227 ?auto_211228 ?auto_211229 )
      ( MAKE-12PILE ?auto_211220 ?auto_211221 ?auto_211222 ?auto_211223 ?auto_211224 ?auto_211225 ?auto_211226 ?auto_211227 ?auto_211228 ?auto_211229 ?auto_211230 ?auto_211231 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_211270 - BLOCK
      ?auto_211271 - BLOCK
      ?auto_211272 - BLOCK
      ?auto_211273 - BLOCK
      ?auto_211274 - BLOCK
      ?auto_211275 - BLOCK
      ?auto_211276 - BLOCK
      ?auto_211277 - BLOCK
      ?auto_211278 - BLOCK
      ?auto_211279 - BLOCK
      ?auto_211280 - BLOCK
      ?auto_211281 - BLOCK
    )
    :vars
    (
      ?auto_211282 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_211281 ?auto_211282 ) ( ON-TABLE ?auto_211270 ) ( ON ?auto_211271 ?auto_211270 ) ( ON ?auto_211272 ?auto_211271 ) ( ON ?auto_211273 ?auto_211272 ) ( ON ?auto_211274 ?auto_211273 ) ( ON ?auto_211275 ?auto_211274 ) ( ON ?auto_211276 ?auto_211275 ) ( ON ?auto_211277 ?auto_211276 ) ( not ( = ?auto_211270 ?auto_211271 ) ) ( not ( = ?auto_211270 ?auto_211272 ) ) ( not ( = ?auto_211270 ?auto_211273 ) ) ( not ( = ?auto_211270 ?auto_211274 ) ) ( not ( = ?auto_211270 ?auto_211275 ) ) ( not ( = ?auto_211270 ?auto_211276 ) ) ( not ( = ?auto_211270 ?auto_211277 ) ) ( not ( = ?auto_211270 ?auto_211278 ) ) ( not ( = ?auto_211270 ?auto_211279 ) ) ( not ( = ?auto_211270 ?auto_211280 ) ) ( not ( = ?auto_211270 ?auto_211281 ) ) ( not ( = ?auto_211270 ?auto_211282 ) ) ( not ( = ?auto_211271 ?auto_211272 ) ) ( not ( = ?auto_211271 ?auto_211273 ) ) ( not ( = ?auto_211271 ?auto_211274 ) ) ( not ( = ?auto_211271 ?auto_211275 ) ) ( not ( = ?auto_211271 ?auto_211276 ) ) ( not ( = ?auto_211271 ?auto_211277 ) ) ( not ( = ?auto_211271 ?auto_211278 ) ) ( not ( = ?auto_211271 ?auto_211279 ) ) ( not ( = ?auto_211271 ?auto_211280 ) ) ( not ( = ?auto_211271 ?auto_211281 ) ) ( not ( = ?auto_211271 ?auto_211282 ) ) ( not ( = ?auto_211272 ?auto_211273 ) ) ( not ( = ?auto_211272 ?auto_211274 ) ) ( not ( = ?auto_211272 ?auto_211275 ) ) ( not ( = ?auto_211272 ?auto_211276 ) ) ( not ( = ?auto_211272 ?auto_211277 ) ) ( not ( = ?auto_211272 ?auto_211278 ) ) ( not ( = ?auto_211272 ?auto_211279 ) ) ( not ( = ?auto_211272 ?auto_211280 ) ) ( not ( = ?auto_211272 ?auto_211281 ) ) ( not ( = ?auto_211272 ?auto_211282 ) ) ( not ( = ?auto_211273 ?auto_211274 ) ) ( not ( = ?auto_211273 ?auto_211275 ) ) ( not ( = ?auto_211273 ?auto_211276 ) ) ( not ( = ?auto_211273 ?auto_211277 ) ) ( not ( = ?auto_211273 ?auto_211278 ) ) ( not ( = ?auto_211273 ?auto_211279 ) ) ( not ( = ?auto_211273 ?auto_211280 ) ) ( not ( = ?auto_211273 ?auto_211281 ) ) ( not ( = ?auto_211273 ?auto_211282 ) ) ( not ( = ?auto_211274 ?auto_211275 ) ) ( not ( = ?auto_211274 ?auto_211276 ) ) ( not ( = ?auto_211274 ?auto_211277 ) ) ( not ( = ?auto_211274 ?auto_211278 ) ) ( not ( = ?auto_211274 ?auto_211279 ) ) ( not ( = ?auto_211274 ?auto_211280 ) ) ( not ( = ?auto_211274 ?auto_211281 ) ) ( not ( = ?auto_211274 ?auto_211282 ) ) ( not ( = ?auto_211275 ?auto_211276 ) ) ( not ( = ?auto_211275 ?auto_211277 ) ) ( not ( = ?auto_211275 ?auto_211278 ) ) ( not ( = ?auto_211275 ?auto_211279 ) ) ( not ( = ?auto_211275 ?auto_211280 ) ) ( not ( = ?auto_211275 ?auto_211281 ) ) ( not ( = ?auto_211275 ?auto_211282 ) ) ( not ( = ?auto_211276 ?auto_211277 ) ) ( not ( = ?auto_211276 ?auto_211278 ) ) ( not ( = ?auto_211276 ?auto_211279 ) ) ( not ( = ?auto_211276 ?auto_211280 ) ) ( not ( = ?auto_211276 ?auto_211281 ) ) ( not ( = ?auto_211276 ?auto_211282 ) ) ( not ( = ?auto_211277 ?auto_211278 ) ) ( not ( = ?auto_211277 ?auto_211279 ) ) ( not ( = ?auto_211277 ?auto_211280 ) ) ( not ( = ?auto_211277 ?auto_211281 ) ) ( not ( = ?auto_211277 ?auto_211282 ) ) ( not ( = ?auto_211278 ?auto_211279 ) ) ( not ( = ?auto_211278 ?auto_211280 ) ) ( not ( = ?auto_211278 ?auto_211281 ) ) ( not ( = ?auto_211278 ?auto_211282 ) ) ( not ( = ?auto_211279 ?auto_211280 ) ) ( not ( = ?auto_211279 ?auto_211281 ) ) ( not ( = ?auto_211279 ?auto_211282 ) ) ( not ( = ?auto_211280 ?auto_211281 ) ) ( not ( = ?auto_211280 ?auto_211282 ) ) ( not ( = ?auto_211281 ?auto_211282 ) ) ( ON ?auto_211280 ?auto_211281 ) ( ON ?auto_211279 ?auto_211280 ) ( CLEAR ?auto_211277 ) ( ON ?auto_211278 ?auto_211279 ) ( CLEAR ?auto_211278 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_211270 ?auto_211271 ?auto_211272 ?auto_211273 ?auto_211274 ?auto_211275 ?auto_211276 ?auto_211277 ?auto_211278 )
      ( MAKE-12PILE ?auto_211270 ?auto_211271 ?auto_211272 ?auto_211273 ?auto_211274 ?auto_211275 ?auto_211276 ?auto_211277 ?auto_211278 ?auto_211279 ?auto_211280 ?auto_211281 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_211320 - BLOCK
      ?auto_211321 - BLOCK
      ?auto_211322 - BLOCK
      ?auto_211323 - BLOCK
      ?auto_211324 - BLOCK
      ?auto_211325 - BLOCK
      ?auto_211326 - BLOCK
      ?auto_211327 - BLOCK
      ?auto_211328 - BLOCK
      ?auto_211329 - BLOCK
      ?auto_211330 - BLOCK
      ?auto_211331 - BLOCK
    )
    :vars
    (
      ?auto_211332 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_211331 ?auto_211332 ) ( ON-TABLE ?auto_211320 ) ( ON ?auto_211321 ?auto_211320 ) ( ON ?auto_211322 ?auto_211321 ) ( ON ?auto_211323 ?auto_211322 ) ( ON ?auto_211324 ?auto_211323 ) ( ON ?auto_211325 ?auto_211324 ) ( ON ?auto_211326 ?auto_211325 ) ( not ( = ?auto_211320 ?auto_211321 ) ) ( not ( = ?auto_211320 ?auto_211322 ) ) ( not ( = ?auto_211320 ?auto_211323 ) ) ( not ( = ?auto_211320 ?auto_211324 ) ) ( not ( = ?auto_211320 ?auto_211325 ) ) ( not ( = ?auto_211320 ?auto_211326 ) ) ( not ( = ?auto_211320 ?auto_211327 ) ) ( not ( = ?auto_211320 ?auto_211328 ) ) ( not ( = ?auto_211320 ?auto_211329 ) ) ( not ( = ?auto_211320 ?auto_211330 ) ) ( not ( = ?auto_211320 ?auto_211331 ) ) ( not ( = ?auto_211320 ?auto_211332 ) ) ( not ( = ?auto_211321 ?auto_211322 ) ) ( not ( = ?auto_211321 ?auto_211323 ) ) ( not ( = ?auto_211321 ?auto_211324 ) ) ( not ( = ?auto_211321 ?auto_211325 ) ) ( not ( = ?auto_211321 ?auto_211326 ) ) ( not ( = ?auto_211321 ?auto_211327 ) ) ( not ( = ?auto_211321 ?auto_211328 ) ) ( not ( = ?auto_211321 ?auto_211329 ) ) ( not ( = ?auto_211321 ?auto_211330 ) ) ( not ( = ?auto_211321 ?auto_211331 ) ) ( not ( = ?auto_211321 ?auto_211332 ) ) ( not ( = ?auto_211322 ?auto_211323 ) ) ( not ( = ?auto_211322 ?auto_211324 ) ) ( not ( = ?auto_211322 ?auto_211325 ) ) ( not ( = ?auto_211322 ?auto_211326 ) ) ( not ( = ?auto_211322 ?auto_211327 ) ) ( not ( = ?auto_211322 ?auto_211328 ) ) ( not ( = ?auto_211322 ?auto_211329 ) ) ( not ( = ?auto_211322 ?auto_211330 ) ) ( not ( = ?auto_211322 ?auto_211331 ) ) ( not ( = ?auto_211322 ?auto_211332 ) ) ( not ( = ?auto_211323 ?auto_211324 ) ) ( not ( = ?auto_211323 ?auto_211325 ) ) ( not ( = ?auto_211323 ?auto_211326 ) ) ( not ( = ?auto_211323 ?auto_211327 ) ) ( not ( = ?auto_211323 ?auto_211328 ) ) ( not ( = ?auto_211323 ?auto_211329 ) ) ( not ( = ?auto_211323 ?auto_211330 ) ) ( not ( = ?auto_211323 ?auto_211331 ) ) ( not ( = ?auto_211323 ?auto_211332 ) ) ( not ( = ?auto_211324 ?auto_211325 ) ) ( not ( = ?auto_211324 ?auto_211326 ) ) ( not ( = ?auto_211324 ?auto_211327 ) ) ( not ( = ?auto_211324 ?auto_211328 ) ) ( not ( = ?auto_211324 ?auto_211329 ) ) ( not ( = ?auto_211324 ?auto_211330 ) ) ( not ( = ?auto_211324 ?auto_211331 ) ) ( not ( = ?auto_211324 ?auto_211332 ) ) ( not ( = ?auto_211325 ?auto_211326 ) ) ( not ( = ?auto_211325 ?auto_211327 ) ) ( not ( = ?auto_211325 ?auto_211328 ) ) ( not ( = ?auto_211325 ?auto_211329 ) ) ( not ( = ?auto_211325 ?auto_211330 ) ) ( not ( = ?auto_211325 ?auto_211331 ) ) ( not ( = ?auto_211325 ?auto_211332 ) ) ( not ( = ?auto_211326 ?auto_211327 ) ) ( not ( = ?auto_211326 ?auto_211328 ) ) ( not ( = ?auto_211326 ?auto_211329 ) ) ( not ( = ?auto_211326 ?auto_211330 ) ) ( not ( = ?auto_211326 ?auto_211331 ) ) ( not ( = ?auto_211326 ?auto_211332 ) ) ( not ( = ?auto_211327 ?auto_211328 ) ) ( not ( = ?auto_211327 ?auto_211329 ) ) ( not ( = ?auto_211327 ?auto_211330 ) ) ( not ( = ?auto_211327 ?auto_211331 ) ) ( not ( = ?auto_211327 ?auto_211332 ) ) ( not ( = ?auto_211328 ?auto_211329 ) ) ( not ( = ?auto_211328 ?auto_211330 ) ) ( not ( = ?auto_211328 ?auto_211331 ) ) ( not ( = ?auto_211328 ?auto_211332 ) ) ( not ( = ?auto_211329 ?auto_211330 ) ) ( not ( = ?auto_211329 ?auto_211331 ) ) ( not ( = ?auto_211329 ?auto_211332 ) ) ( not ( = ?auto_211330 ?auto_211331 ) ) ( not ( = ?auto_211330 ?auto_211332 ) ) ( not ( = ?auto_211331 ?auto_211332 ) ) ( ON ?auto_211330 ?auto_211331 ) ( ON ?auto_211329 ?auto_211330 ) ( ON ?auto_211328 ?auto_211329 ) ( CLEAR ?auto_211326 ) ( ON ?auto_211327 ?auto_211328 ) ( CLEAR ?auto_211327 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_211320 ?auto_211321 ?auto_211322 ?auto_211323 ?auto_211324 ?auto_211325 ?auto_211326 ?auto_211327 )
      ( MAKE-12PILE ?auto_211320 ?auto_211321 ?auto_211322 ?auto_211323 ?auto_211324 ?auto_211325 ?auto_211326 ?auto_211327 ?auto_211328 ?auto_211329 ?auto_211330 ?auto_211331 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_211370 - BLOCK
      ?auto_211371 - BLOCK
      ?auto_211372 - BLOCK
      ?auto_211373 - BLOCK
      ?auto_211374 - BLOCK
      ?auto_211375 - BLOCK
      ?auto_211376 - BLOCK
      ?auto_211377 - BLOCK
      ?auto_211378 - BLOCK
      ?auto_211379 - BLOCK
      ?auto_211380 - BLOCK
      ?auto_211381 - BLOCK
    )
    :vars
    (
      ?auto_211382 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_211381 ?auto_211382 ) ( ON-TABLE ?auto_211370 ) ( ON ?auto_211371 ?auto_211370 ) ( ON ?auto_211372 ?auto_211371 ) ( ON ?auto_211373 ?auto_211372 ) ( ON ?auto_211374 ?auto_211373 ) ( ON ?auto_211375 ?auto_211374 ) ( not ( = ?auto_211370 ?auto_211371 ) ) ( not ( = ?auto_211370 ?auto_211372 ) ) ( not ( = ?auto_211370 ?auto_211373 ) ) ( not ( = ?auto_211370 ?auto_211374 ) ) ( not ( = ?auto_211370 ?auto_211375 ) ) ( not ( = ?auto_211370 ?auto_211376 ) ) ( not ( = ?auto_211370 ?auto_211377 ) ) ( not ( = ?auto_211370 ?auto_211378 ) ) ( not ( = ?auto_211370 ?auto_211379 ) ) ( not ( = ?auto_211370 ?auto_211380 ) ) ( not ( = ?auto_211370 ?auto_211381 ) ) ( not ( = ?auto_211370 ?auto_211382 ) ) ( not ( = ?auto_211371 ?auto_211372 ) ) ( not ( = ?auto_211371 ?auto_211373 ) ) ( not ( = ?auto_211371 ?auto_211374 ) ) ( not ( = ?auto_211371 ?auto_211375 ) ) ( not ( = ?auto_211371 ?auto_211376 ) ) ( not ( = ?auto_211371 ?auto_211377 ) ) ( not ( = ?auto_211371 ?auto_211378 ) ) ( not ( = ?auto_211371 ?auto_211379 ) ) ( not ( = ?auto_211371 ?auto_211380 ) ) ( not ( = ?auto_211371 ?auto_211381 ) ) ( not ( = ?auto_211371 ?auto_211382 ) ) ( not ( = ?auto_211372 ?auto_211373 ) ) ( not ( = ?auto_211372 ?auto_211374 ) ) ( not ( = ?auto_211372 ?auto_211375 ) ) ( not ( = ?auto_211372 ?auto_211376 ) ) ( not ( = ?auto_211372 ?auto_211377 ) ) ( not ( = ?auto_211372 ?auto_211378 ) ) ( not ( = ?auto_211372 ?auto_211379 ) ) ( not ( = ?auto_211372 ?auto_211380 ) ) ( not ( = ?auto_211372 ?auto_211381 ) ) ( not ( = ?auto_211372 ?auto_211382 ) ) ( not ( = ?auto_211373 ?auto_211374 ) ) ( not ( = ?auto_211373 ?auto_211375 ) ) ( not ( = ?auto_211373 ?auto_211376 ) ) ( not ( = ?auto_211373 ?auto_211377 ) ) ( not ( = ?auto_211373 ?auto_211378 ) ) ( not ( = ?auto_211373 ?auto_211379 ) ) ( not ( = ?auto_211373 ?auto_211380 ) ) ( not ( = ?auto_211373 ?auto_211381 ) ) ( not ( = ?auto_211373 ?auto_211382 ) ) ( not ( = ?auto_211374 ?auto_211375 ) ) ( not ( = ?auto_211374 ?auto_211376 ) ) ( not ( = ?auto_211374 ?auto_211377 ) ) ( not ( = ?auto_211374 ?auto_211378 ) ) ( not ( = ?auto_211374 ?auto_211379 ) ) ( not ( = ?auto_211374 ?auto_211380 ) ) ( not ( = ?auto_211374 ?auto_211381 ) ) ( not ( = ?auto_211374 ?auto_211382 ) ) ( not ( = ?auto_211375 ?auto_211376 ) ) ( not ( = ?auto_211375 ?auto_211377 ) ) ( not ( = ?auto_211375 ?auto_211378 ) ) ( not ( = ?auto_211375 ?auto_211379 ) ) ( not ( = ?auto_211375 ?auto_211380 ) ) ( not ( = ?auto_211375 ?auto_211381 ) ) ( not ( = ?auto_211375 ?auto_211382 ) ) ( not ( = ?auto_211376 ?auto_211377 ) ) ( not ( = ?auto_211376 ?auto_211378 ) ) ( not ( = ?auto_211376 ?auto_211379 ) ) ( not ( = ?auto_211376 ?auto_211380 ) ) ( not ( = ?auto_211376 ?auto_211381 ) ) ( not ( = ?auto_211376 ?auto_211382 ) ) ( not ( = ?auto_211377 ?auto_211378 ) ) ( not ( = ?auto_211377 ?auto_211379 ) ) ( not ( = ?auto_211377 ?auto_211380 ) ) ( not ( = ?auto_211377 ?auto_211381 ) ) ( not ( = ?auto_211377 ?auto_211382 ) ) ( not ( = ?auto_211378 ?auto_211379 ) ) ( not ( = ?auto_211378 ?auto_211380 ) ) ( not ( = ?auto_211378 ?auto_211381 ) ) ( not ( = ?auto_211378 ?auto_211382 ) ) ( not ( = ?auto_211379 ?auto_211380 ) ) ( not ( = ?auto_211379 ?auto_211381 ) ) ( not ( = ?auto_211379 ?auto_211382 ) ) ( not ( = ?auto_211380 ?auto_211381 ) ) ( not ( = ?auto_211380 ?auto_211382 ) ) ( not ( = ?auto_211381 ?auto_211382 ) ) ( ON ?auto_211380 ?auto_211381 ) ( ON ?auto_211379 ?auto_211380 ) ( ON ?auto_211378 ?auto_211379 ) ( ON ?auto_211377 ?auto_211378 ) ( CLEAR ?auto_211375 ) ( ON ?auto_211376 ?auto_211377 ) ( CLEAR ?auto_211376 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_211370 ?auto_211371 ?auto_211372 ?auto_211373 ?auto_211374 ?auto_211375 ?auto_211376 )
      ( MAKE-12PILE ?auto_211370 ?auto_211371 ?auto_211372 ?auto_211373 ?auto_211374 ?auto_211375 ?auto_211376 ?auto_211377 ?auto_211378 ?auto_211379 ?auto_211380 ?auto_211381 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_211420 - BLOCK
      ?auto_211421 - BLOCK
      ?auto_211422 - BLOCK
      ?auto_211423 - BLOCK
      ?auto_211424 - BLOCK
      ?auto_211425 - BLOCK
      ?auto_211426 - BLOCK
      ?auto_211427 - BLOCK
      ?auto_211428 - BLOCK
      ?auto_211429 - BLOCK
      ?auto_211430 - BLOCK
      ?auto_211431 - BLOCK
    )
    :vars
    (
      ?auto_211432 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_211431 ?auto_211432 ) ( ON-TABLE ?auto_211420 ) ( ON ?auto_211421 ?auto_211420 ) ( ON ?auto_211422 ?auto_211421 ) ( ON ?auto_211423 ?auto_211422 ) ( ON ?auto_211424 ?auto_211423 ) ( not ( = ?auto_211420 ?auto_211421 ) ) ( not ( = ?auto_211420 ?auto_211422 ) ) ( not ( = ?auto_211420 ?auto_211423 ) ) ( not ( = ?auto_211420 ?auto_211424 ) ) ( not ( = ?auto_211420 ?auto_211425 ) ) ( not ( = ?auto_211420 ?auto_211426 ) ) ( not ( = ?auto_211420 ?auto_211427 ) ) ( not ( = ?auto_211420 ?auto_211428 ) ) ( not ( = ?auto_211420 ?auto_211429 ) ) ( not ( = ?auto_211420 ?auto_211430 ) ) ( not ( = ?auto_211420 ?auto_211431 ) ) ( not ( = ?auto_211420 ?auto_211432 ) ) ( not ( = ?auto_211421 ?auto_211422 ) ) ( not ( = ?auto_211421 ?auto_211423 ) ) ( not ( = ?auto_211421 ?auto_211424 ) ) ( not ( = ?auto_211421 ?auto_211425 ) ) ( not ( = ?auto_211421 ?auto_211426 ) ) ( not ( = ?auto_211421 ?auto_211427 ) ) ( not ( = ?auto_211421 ?auto_211428 ) ) ( not ( = ?auto_211421 ?auto_211429 ) ) ( not ( = ?auto_211421 ?auto_211430 ) ) ( not ( = ?auto_211421 ?auto_211431 ) ) ( not ( = ?auto_211421 ?auto_211432 ) ) ( not ( = ?auto_211422 ?auto_211423 ) ) ( not ( = ?auto_211422 ?auto_211424 ) ) ( not ( = ?auto_211422 ?auto_211425 ) ) ( not ( = ?auto_211422 ?auto_211426 ) ) ( not ( = ?auto_211422 ?auto_211427 ) ) ( not ( = ?auto_211422 ?auto_211428 ) ) ( not ( = ?auto_211422 ?auto_211429 ) ) ( not ( = ?auto_211422 ?auto_211430 ) ) ( not ( = ?auto_211422 ?auto_211431 ) ) ( not ( = ?auto_211422 ?auto_211432 ) ) ( not ( = ?auto_211423 ?auto_211424 ) ) ( not ( = ?auto_211423 ?auto_211425 ) ) ( not ( = ?auto_211423 ?auto_211426 ) ) ( not ( = ?auto_211423 ?auto_211427 ) ) ( not ( = ?auto_211423 ?auto_211428 ) ) ( not ( = ?auto_211423 ?auto_211429 ) ) ( not ( = ?auto_211423 ?auto_211430 ) ) ( not ( = ?auto_211423 ?auto_211431 ) ) ( not ( = ?auto_211423 ?auto_211432 ) ) ( not ( = ?auto_211424 ?auto_211425 ) ) ( not ( = ?auto_211424 ?auto_211426 ) ) ( not ( = ?auto_211424 ?auto_211427 ) ) ( not ( = ?auto_211424 ?auto_211428 ) ) ( not ( = ?auto_211424 ?auto_211429 ) ) ( not ( = ?auto_211424 ?auto_211430 ) ) ( not ( = ?auto_211424 ?auto_211431 ) ) ( not ( = ?auto_211424 ?auto_211432 ) ) ( not ( = ?auto_211425 ?auto_211426 ) ) ( not ( = ?auto_211425 ?auto_211427 ) ) ( not ( = ?auto_211425 ?auto_211428 ) ) ( not ( = ?auto_211425 ?auto_211429 ) ) ( not ( = ?auto_211425 ?auto_211430 ) ) ( not ( = ?auto_211425 ?auto_211431 ) ) ( not ( = ?auto_211425 ?auto_211432 ) ) ( not ( = ?auto_211426 ?auto_211427 ) ) ( not ( = ?auto_211426 ?auto_211428 ) ) ( not ( = ?auto_211426 ?auto_211429 ) ) ( not ( = ?auto_211426 ?auto_211430 ) ) ( not ( = ?auto_211426 ?auto_211431 ) ) ( not ( = ?auto_211426 ?auto_211432 ) ) ( not ( = ?auto_211427 ?auto_211428 ) ) ( not ( = ?auto_211427 ?auto_211429 ) ) ( not ( = ?auto_211427 ?auto_211430 ) ) ( not ( = ?auto_211427 ?auto_211431 ) ) ( not ( = ?auto_211427 ?auto_211432 ) ) ( not ( = ?auto_211428 ?auto_211429 ) ) ( not ( = ?auto_211428 ?auto_211430 ) ) ( not ( = ?auto_211428 ?auto_211431 ) ) ( not ( = ?auto_211428 ?auto_211432 ) ) ( not ( = ?auto_211429 ?auto_211430 ) ) ( not ( = ?auto_211429 ?auto_211431 ) ) ( not ( = ?auto_211429 ?auto_211432 ) ) ( not ( = ?auto_211430 ?auto_211431 ) ) ( not ( = ?auto_211430 ?auto_211432 ) ) ( not ( = ?auto_211431 ?auto_211432 ) ) ( ON ?auto_211430 ?auto_211431 ) ( ON ?auto_211429 ?auto_211430 ) ( ON ?auto_211428 ?auto_211429 ) ( ON ?auto_211427 ?auto_211428 ) ( ON ?auto_211426 ?auto_211427 ) ( CLEAR ?auto_211424 ) ( ON ?auto_211425 ?auto_211426 ) ( CLEAR ?auto_211425 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_211420 ?auto_211421 ?auto_211422 ?auto_211423 ?auto_211424 ?auto_211425 )
      ( MAKE-12PILE ?auto_211420 ?auto_211421 ?auto_211422 ?auto_211423 ?auto_211424 ?auto_211425 ?auto_211426 ?auto_211427 ?auto_211428 ?auto_211429 ?auto_211430 ?auto_211431 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_211470 - BLOCK
      ?auto_211471 - BLOCK
      ?auto_211472 - BLOCK
      ?auto_211473 - BLOCK
      ?auto_211474 - BLOCK
      ?auto_211475 - BLOCK
      ?auto_211476 - BLOCK
      ?auto_211477 - BLOCK
      ?auto_211478 - BLOCK
      ?auto_211479 - BLOCK
      ?auto_211480 - BLOCK
      ?auto_211481 - BLOCK
    )
    :vars
    (
      ?auto_211482 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_211481 ?auto_211482 ) ( ON-TABLE ?auto_211470 ) ( ON ?auto_211471 ?auto_211470 ) ( ON ?auto_211472 ?auto_211471 ) ( ON ?auto_211473 ?auto_211472 ) ( not ( = ?auto_211470 ?auto_211471 ) ) ( not ( = ?auto_211470 ?auto_211472 ) ) ( not ( = ?auto_211470 ?auto_211473 ) ) ( not ( = ?auto_211470 ?auto_211474 ) ) ( not ( = ?auto_211470 ?auto_211475 ) ) ( not ( = ?auto_211470 ?auto_211476 ) ) ( not ( = ?auto_211470 ?auto_211477 ) ) ( not ( = ?auto_211470 ?auto_211478 ) ) ( not ( = ?auto_211470 ?auto_211479 ) ) ( not ( = ?auto_211470 ?auto_211480 ) ) ( not ( = ?auto_211470 ?auto_211481 ) ) ( not ( = ?auto_211470 ?auto_211482 ) ) ( not ( = ?auto_211471 ?auto_211472 ) ) ( not ( = ?auto_211471 ?auto_211473 ) ) ( not ( = ?auto_211471 ?auto_211474 ) ) ( not ( = ?auto_211471 ?auto_211475 ) ) ( not ( = ?auto_211471 ?auto_211476 ) ) ( not ( = ?auto_211471 ?auto_211477 ) ) ( not ( = ?auto_211471 ?auto_211478 ) ) ( not ( = ?auto_211471 ?auto_211479 ) ) ( not ( = ?auto_211471 ?auto_211480 ) ) ( not ( = ?auto_211471 ?auto_211481 ) ) ( not ( = ?auto_211471 ?auto_211482 ) ) ( not ( = ?auto_211472 ?auto_211473 ) ) ( not ( = ?auto_211472 ?auto_211474 ) ) ( not ( = ?auto_211472 ?auto_211475 ) ) ( not ( = ?auto_211472 ?auto_211476 ) ) ( not ( = ?auto_211472 ?auto_211477 ) ) ( not ( = ?auto_211472 ?auto_211478 ) ) ( not ( = ?auto_211472 ?auto_211479 ) ) ( not ( = ?auto_211472 ?auto_211480 ) ) ( not ( = ?auto_211472 ?auto_211481 ) ) ( not ( = ?auto_211472 ?auto_211482 ) ) ( not ( = ?auto_211473 ?auto_211474 ) ) ( not ( = ?auto_211473 ?auto_211475 ) ) ( not ( = ?auto_211473 ?auto_211476 ) ) ( not ( = ?auto_211473 ?auto_211477 ) ) ( not ( = ?auto_211473 ?auto_211478 ) ) ( not ( = ?auto_211473 ?auto_211479 ) ) ( not ( = ?auto_211473 ?auto_211480 ) ) ( not ( = ?auto_211473 ?auto_211481 ) ) ( not ( = ?auto_211473 ?auto_211482 ) ) ( not ( = ?auto_211474 ?auto_211475 ) ) ( not ( = ?auto_211474 ?auto_211476 ) ) ( not ( = ?auto_211474 ?auto_211477 ) ) ( not ( = ?auto_211474 ?auto_211478 ) ) ( not ( = ?auto_211474 ?auto_211479 ) ) ( not ( = ?auto_211474 ?auto_211480 ) ) ( not ( = ?auto_211474 ?auto_211481 ) ) ( not ( = ?auto_211474 ?auto_211482 ) ) ( not ( = ?auto_211475 ?auto_211476 ) ) ( not ( = ?auto_211475 ?auto_211477 ) ) ( not ( = ?auto_211475 ?auto_211478 ) ) ( not ( = ?auto_211475 ?auto_211479 ) ) ( not ( = ?auto_211475 ?auto_211480 ) ) ( not ( = ?auto_211475 ?auto_211481 ) ) ( not ( = ?auto_211475 ?auto_211482 ) ) ( not ( = ?auto_211476 ?auto_211477 ) ) ( not ( = ?auto_211476 ?auto_211478 ) ) ( not ( = ?auto_211476 ?auto_211479 ) ) ( not ( = ?auto_211476 ?auto_211480 ) ) ( not ( = ?auto_211476 ?auto_211481 ) ) ( not ( = ?auto_211476 ?auto_211482 ) ) ( not ( = ?auto_211477 ?auto_211478 ) ) ( not ( = ?auto_211477 ?auto_211479 ) ) ( not ( = ?auto_211477 ?auto_211480 ) ) ( not ( = ?auto_211477 ?auto_211481 ) ) ( not ( = ?auto_211477 ?auto_211482 ) ) ( not ( = ?auto_211478 ?auto_211479 ) ) ( not ( = ?auto_211478 ?auto_211480 ) ) ( not ( = ?auto_211478 ?auto_211481 ) ) ( not ( = ?auto_211478 ?auto_211482 ) ) ( not ( = ?auto_211479 ?auto_211480 ) ) ( not ( = ?auto_211479 ?auto_211481 ) ) ( not ( = ?auto_211479 ?auto_211482 ) ) ( not ( = ?auto_211480 ?auto_211481 ) ) ( not ( = ?auto_211480 ?auto_211482 ) ) ( not ( = ?auto_211481 ?auto_211482 ) ) ( ON ?auto_211480 ?auto_211481 ) ( ON ?auto_211479 ?auto_211480 ) ( ON ?auto_211478 ?auto_211479 ) ( ON ?auto_211477 ?auto_211478 ) ( ON ?auto_211476 ?auto_211477 ) ( ON ?auto_211475 ?auto_211476 ) ( CLEAR ?auto_211473 ) ( ON ?auto_211474 ?auto_211475 ) ( CLEAR ?auto_211474 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_211470 ?auto_211471 ?auto_211472 ?auto_211473 ?auto_211474 )
      ( MAKE-12PILE ?auto_211470 ?auto_211471 ?auto_211472 ?auto_211473 ?auto_211474 ?auto_211475 ?auto_211476 ?auto_211477 ?auto_211478 ?auto_211479 ?auto_211480 ?auto_211481 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_211520 - BLOCK
      ?auto_211521 - BLOCK
      ?auto_211522 - BLOCK
      ?auto_211523 - BLOCK
      ?auto_211524 - BLOCK
      ?auto_211525 - BLOCK
      ?auto_211526 - BLOCK
      ?auto_211527 - BLOCK
      ?auto_211528 - BLOCK
      ?auto_211529 - BLOCK
      ?auto_211530 - BLOCK
      ?auto_211531 - BLOCK
    )
    :vars
    (
      ?auto_211532 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_211531 ?auto_211532 ) ( ON-TABLE ?auto_211520 ) ( ON ?auto_211521 ?auto_211520 ) ( ON ?auto_211522 ?auto_211521 ) ( not ( = ?auto_211520 ?auto_211521 ) ) ( not ( = ?auto_211520 ?auto_211522 ) ) ( not ( = ?auto_211520 ?auto_211523 ) ) ( not ( = ?auto_211520 ?auto_211524 ) ) ( not ( = ?auto_211520 ?auto_211525 ) ) ( not ( = ?auto_211520 ?auto_211526 ) ) ( not ( = ?auto_211520 ?auto_211527 ) ) ( not ( = ?auto_211520 ?auto_211528 ) ) ( not ( = ?auto_211520 ?auto_211529 ) ) ( not ( = ?auto_211520 ?auto_211530 ) ) ( not ( = ?auto_211520 ?auto_211531 ) ) ( not ( = ?auto_211520 ?auto_211532 ) ) ( not ( = ?auto_211521 ?auto_211522 ) ) ( not ( = ?auto_211521 ?auto_211523 ) ) ( not ( = ?auto_211521 ?auto_211524 ) ) ( not ( = ?auto_211521 ?auto_211525 ) ) ( not ( = ?auto_211521 ?auto_211526 ) ) ( not ( = ?auto_211521 ?auto_211527 ) ) ( not ( = ?auto_211521 ?auto_211528 ) ) ( not ( = ?auto_211521 ?auto_211529 ) ) ( not ( = ?auto_211521 ?auto_211530 ) ) ( not ( = ?auto_211521 ?auto_211531 ) ) ( not ( = ?auto_211521 ?auto_211532 ) ) ( not ( = ?auto_211522 ?auto_211523 ) ) ( not ( = ?auto_211522 ?auto_211524 ) ) ( not ( = ?auto_211522 ?auto_211525 ) ) ( not ( = ?auto_211522 ?auto_211526 ) ) ( not ( = ?auto_211522 ?auto_211527 ) ) ( not ( = ?auto_211522 ?auto_211528 ) ) ( not ( = ?auto_211522 ?auto_211529 ) ) ( not ( = ?auto_211522 ?auto_211530 ) ) ( not ( = ?auto_211522 ?auto_211531 ) ) ( not ( = ?auto_211522 ?auto_211532 ) ) ( not ( = ?auto_211523 ?auto_211524 ) ) ( not ( = ?auto_211523 ?auto_211525 ) ) ( not ( = ?auto_211523 ?auto_211526 ) ) ( not ( = ?auto_211523 ?auto_211527 ) ) ( not ( = ?auto_211523 ?auto_211528 ) ) ( not ( = ?auto_211523 ?auto_211529 ) ) ( not ( = ?auto_211523 ?auto_211530 ) ) ( not ( = ?auto_211523 ?auto_211531 ) ) ( not ( = ?auto_211523 ?auto_211532 ) ) ( not ( = ?auto_211524 ?auto_211525 ) ) ( not ( = ?auto_211524 ?auto_211526 ) ) ( not ( = ?auto_211524 ?auto_211527 ) ) ( not ( = ?auto_211524 ?auto_211528 ) ) ( not ( = ?auto_211524 ?auto_211529 ) ) ( not ( = ?auto_211524 ?auto_211530 ) ) ( not ( = ?auto_211524 ?auto_211531 ) ) ( not ( = ?auto_211524 ?auto_211532 ) ) ( not ( = ?auto_211525 ?auto_211526 ) ) ( not ( = ?auto_211525 ?auto_211527 ) ) ( not ( = ?auto_211525 ?auto_211528 ) ) ( not ( = ?auto_211525 ?auto_211529 ) ) ( not ( = ?auto_211525 ?auto_211530 ) ) ( not ( = ?auto_211525 ?auto_211531 ) ) ( not ( = ?auto_211525 ?auto_211532 ) ) ( not ( = ?auto_211526 ?auto_211527 ) ) ( not ( = ?auto_211526 ?auto_211528 ) ) ( not ( = ?auto_211526 ?auto_211529 ) ) ( not ( = ?auto_211526 ?auto_211530 ) ) ( not ( = ?auto_211526 ?auto_211531 ) ) ( not ( = ?auto_211526 ?auto_211532 ) ) ( not ( = ?auto_211527 ?auto_211528 ) ) ( not ( = ?auto_211527 ?auto_211529 ) ) ( not ( = ?auto_211527 ?auto_211530 ) ) ( not ( = ?auto_211527 ?auto_211531 ) ) ( not ( = ?auto_211527 ?auto_211532 ) ) ( not ( = ?auto_211528 ?auto_211529 ) ) ( not ( = ?auto_211528 ?auto_211530 ) ) ( not ( = ?auto_211528 ?auto_211531 ) ) ( not ( = ?auto_211528 ?auto_211532 ) ) ( not ( = ?auto_211529 ?auto_211530 ) ) ( not ( = ?auto_211529 ?auto_211531 ) ) ( not ( = ?auto_211529 ?auto_211532 ) ) ( not ( = ?auto_211530 ?auto_211531 ) ) ( not ( = ?auto_211530 ?auto_211532 ) ) ( not ( = ?auto_211531 ?auto_211532 ) ) ( ON ?auto_211530 ?auto_211531 ) ( ON ?auto_211529 ?auto_211530 ) ( ON ?auto_211528 ?auto_211529 ) ( ON ?auto_211527 ?auto_211528 ) ( ON ?auto_211526 ?auto_211527 ) ( ON ?auto_211525 ?auto_211526 ) ( ON ?auto_211524 ?auto_211525 ) ( CLEAR ?auto_211522 ) ( ON ?auto_211523 ?auto_211524 ) ( CLEAR ?auto_211523 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_211520 ?auto_211521 ?auto_211522 ?auto_211523 )
      ( MAKE-12PILE ?auto_211520 ?auto_211521 ?auto_211522 ?auto_211523 ?auto_211524 ?auto_211525 ?auto_211526 ?auto_211527 ?auto_211528 ?auto_211529 ?auto_211530 ?auto_211531 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_211570 - BLOCK
      ?auto_211571 - BLOCK
      ?auto_211572 - BLOCK
      ?auto_211573 - BLOCK
      ?auto_211574 - BLOCK
      ?auto_211575 - BLOCK
      ?auto_211576 - BLOCK
      ?auto_211577 - BLOCK
      ?auto_211578 - BLOCK
      ?auto_211579 - BLOCK
      ?auto_211580 - BLOCK
      ?auto_211581 - BLOCK
    )
    :vars
    (
      ?auto_211582 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_211581 ?auto_211582 ) ( ON-TABLE ?auto_211570 ) ( ON ?auto_211571 ?auto_211570 ) ( not ( = ?auto_211570 ?auto_211571 ) ) ( not ( = ?auto_211570 ?auto_211572 ) ) ( not ( = ?auto_211570 ?auto_211573 ) ) ( not ( = ?auto_211570 ?auto_211574 ) ) ( not ( = ?auto_211570 ?auto_211575 ) ) ( not ( = ?auto_211570 ?auto_211576 ) ) ( not ( = ?auto_211570 ?auto_211577 ) ) ( not ( = ?auto_211570 ?auto_211578 ) ) ( not ( = ?auto_211570 ?auto_211579 ) ) ( not ( = ?auto_211570 ?auto_211580 ) ) ( not ( = ?auto_211570 ?auto_211581 ) ) ( not ( = ?auto_211570 ?auto_211582 ) ) ( not ( = ?auto_211571 ?auto_211572 ) ) ( not ( = ?auto_211571 ?auto_211573 ) ) ( not ( = ?auto_211571 ?auto_211574 ) ) ( not ( = ?auto_211571 ?auto_211575 ) ) ( not ( = ?auto_211571 ?auto_211576 ) ) ( not ( = ?auto_211571 ?auto_211577 ) ) ( not ( = ?auto_211571 ?auto_211578 ) ) ( not ( = ?auto_211571 ?auto_211579 ) ) ( not ( = ?auto_211571 ?auto_211580 ) ) ( not ( = ?auto_211571 ?auto_211581 ) ) ( not ( = ?auto_211571 ?auto_211582 ) ) ( not ( = ?auto_211572 ?auto_211573 ) ) ( not ( = ?auto_211572 ?auto_211574 ) ) ( not ( = ?auto_211572 ?auto_211575 ) ) ( not ( = ?auto_211572 ?auto_211576 ) ) ( not ( = ?auto_211572 ?auto_211577 ) ) ( not ( = ?auto_211572 ?auto_211578 ) ) ( not ( = ?auto_211572 ?auto_211579 ) ) ( not ( = ?auto_211572 ?auto_211580 ) ) ( not ( = ?auto_211572 ?auto_211581 ) ) ( not ( = ?auto_211572 ?auto_211582 ) ) ( not ( = ?auto_211573 ?auto_211574 ) ) ( not ( = ?auto_211573 ?auto_211575 ) ) ( not ( = ?auto_211573 ?auto_211576 ) ) ( not ( = ?auto_211573 ?auto_211577 ) ) ( not ( = ?auto_211573 ?auto_211578 ) ) ( not ( = ?auto_211573 ?auto_211579 ) ) ( not ( = ?auto_211573 ?auto_211580 ) ) ( not ( = ?auto_211573 ?auto_211581 ) ) ( not ( = ?auto_211573 ?auto_211582 ) ) ( not ( = ?auto_211574 ?auto_211575 ) ) ( not ( = ?auto_211574 ?auto_211576 ) ) ( not ( = ?auto_211574 ?auto_211577 ) ) ( not ( = ?auto_211574 ?auto_211578 ) ) ( not ( = ?auto_211574 ?auto_211579 ) ) ( not ( = ?auto_211574 ?auto_211580 ) ) ( not ( = ?auto_211574 ?auto_211581 ) ) ( not ( = ?auto_211574 ?auto_211582 ) ) ( not ( = ?auto_211575 ?auto_211576 ) ) ( not ( = ?auto_211575 ?auto_211577 ) ) ( not ( = ?auto_211575 ?auto_211578 ) ) ( not ( = ?auto_211575 ?auto_211579 ) ) ( not ( = ?auto_211575 ?auto_211580 ) ) ( not ( = ?auto_211575 ?auto_211581 ) ) ( not ( = ?auto_211575 ?auto_211582 ) ) ( not ( = ?auto_211576 ?auto_211577 ) ) ( not ( = ?auto_211576 ?auto_211578 ) ) ( not ( = ?auto_211576 ?auto_211579 ) ) ( not ( = ?auto_211576 ?auto_211580 ) ) ( not ( = ?auto_211576 ?auto_211581 ) ) ( not ( = ?auto_211576 ?auto_211582 ) ) ( not ( = ?auto_211577 ?auto_211578 ) ) ( not ( = ?auto_211577 ?auto_211579 ) ) ( not ( = ?auto_211577 ?auto_211580 ) ) ( not ( = ?auto_211577 ?auto_211581 ) ) ( not ( = ?auto_211577 ?auto_211582 ) ) ( not ( = ?auto_211578 ?auto_211579 ) ) ( not ( = ?auto_211578 ?auto_211580 ) ) ( not ( = ?auto_211578 ?auto_211581 ) ) ( not ( = ?auto_211578 ?auto_211582 ) ) ( not ( = ?auto_211579 ?auto_211580 ) ) ( not ( = ?auto_211579 ?auto_211581 ) ) ( not ( = ?auto_211579 ?auto_211582 ) ) ( not ( = ?auto_211580 ?auto_211581 ) ) ( not ( = ?auto_211580 ?auto_211582 ) ) ( not ( = ?auto_211581 ?auto_211582 ) ) ( ON ?auto_211580 ?auto_211581 ) ( ON ?auto_211579 ?auto_211580 ) ( ON ?auto_211578 ?auto_211579 ) ( ON ?auto_211577 ?auto_211578 ) ( ON ?auto_211576 ?auto_211577 ) ( ON ?auto_211575 ?auto_211576 ) ( ON ?auto_211574 ?auto_211575 ) ( ON ?auto_211573 ?auto_211574 ) ( CLEAR ?auto_211571 ) ( ON ?auto_211572 ?auto_211573 ) ( CLEAR ?auto_211572 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_211570 ?auto_211571 ?auto_211572 )
      ( MAKE-12PILE ?auto_211570 ?auto_211571 ?auto_211572 ?auto_211573 ?auto_211574 ?auto_211575 ?auto_211576 ?auto_211577 ?auto_211578 ?auto_211579 ?auto_211580 ?auto_211581 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_211620 - BLOCK
      ?auto_211621 - BLOCK
      ?auto_211622 - BLOCK
      ?auto_211623 - BLOCK
      ?auto_211624 - BLOCK
      ?auto_211625 - BLOCK
      ?auto_211626 - BLOCK
      ?auto_211627 - BLOCK
      ?auto_211628 - BLOCK
      ?auto_211629 - BLOCK
      ?auto_211630 - BLOCK
      ?auto_211631 - BLOCK
    )
    :vars
    (
      ?auto_211632 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_211631 ?auto_211632 ) ( ON-TABLE ?auto_211620 ) ( not ( = ?auto_211620 ?auto_211621 ) ) ( not ( = ?auto_211620 ?auto_211622 ) ) ( not ( = ?auto_211620 ?auto_211623 ) ) ( not ( = ?auto_211620 ?auto_211624 ) ) ( not ( = ?auto_211620 ?auto_211625 ) ) ( not ( = ?auto_211620 ?auto_211626 ) ) ( not ( = ?auto_211620 ?auto_211627 ) ) ( not ( = ?auto_211620 ?auto_211628 ) ) ( not ( = ?auto_211620 ?auto_211629 ) ) ( not ( = ?auto_211620 ?auto_211630 ) ) ( not ( = ?auto_211620 ?auto_211631 ) ) ( not ( = ?auto_211620 ?auto_211632 ) ) ( not ( = ?auto_211621 ?auto_211622 ) ) ( not ( = ?auto_211621 ?auto_211623 ) ) ( not ( = ?auto_211621 ?auto_211624 ) ) ( not ( = ?auto_211621 ?auto_211625 ) ) ( not ( = ?auto_211621 ?auto_211626 ) ) ( not ( = ?auto_211621 ?auto_211627 ) ) ( not ( = ?auto_211621 ?auto_211628 ) ) ( not ( = ?auto_211621 ?auto_211629 ) ) ( not ( = ?auto_211621 ?auto_211630 ) ) ( not ( = ?auto_211621 ?auto_211631 ) ) ( not ( = ?auto_211621 ?auto_211632 ) ) ( not ( = ?auto_211622 ?auto_211623 ) ) ( not ( = ?auto_211622 ?auto_211624 ) ) ( not ( = ?auto_211622 ?auto_211625 ) ) ( not ( = ?auto_211622 ?auto_211626 ) ) ( not ( = ?auto_211622 ?auto_211627 ) ) ( not ( = ?auto_211622 ?auto_211628 ) ) ( not ( = ?auto_211622 ?auto_211629 ) ) ( not ( = ?auto_211622 ?auto_211630 ) ) ( not ( = ?auto_211622 ?auto_211631 ) ) ( not ( = ?auto_211622 ?auto_211632 ) ) ( not ( = ?auto_211623 ?auto_211624 ) ) ( not ( = ?auto_211623 ?auto_211625 ) ) ( not ( = ?auto_211623 ?auto_211626 ) ) ( not ( = ?auto_211623 ?auto_211627 ) ) ( not ( = ?auto_211623 ?auto_211628 ) ) ( not ( = ?auto_211623 ?auto_211629 ) ) ( not ( = ?auto_211623 ?auto_211630 ) ) ( not ( = ?auto_211623 ?auto_211631 ) ) ( not ( = ?auto_211623 ?auto_211632 ) ) ( not ( = ?auto_211624 ?auto_211625 ) ) ( not ( = ?auto_211624 ?auto_211626 ) ) ( not ( = ?auto_211624 ?auto_211627 ) ) ( not ( = ?auto_211624 ?auto_211628 ) ) ( not ( = ?auto_211624 ?auto_211629 ) ) ( not ( = ?auto_211624 ?auto_211630 ) ) ( not ( = ?auto_211624 ?auto_211631 ) ) ( not ( = ?auto_211624 ?auto_211632 ) ) ( not ( = ?auto_211625 ?auto_211626 ) ) ( not ( = ?auto_211625 ?auto_211627 ) ) ( not ( = ?auto_211625 ?auto_211628 ) ) ( not ( = ?auto_211625 ?auto_211629 ) ) ( not ( = ?auto_211625 ?auto_211630 ) ) ( not ( = ?auto_211625 ?auto_211631 ) ) ( not ( = ?auto_211625 ?auto_211632 ) ) ( not ( = ?auto_211626 ?auto_211627 ) ) ( not ( = ?auto_211626 ?auto_211628 ) ) ( not ( = ?auto_211626 ?auto_211629 ) ) ( not ( = ?auto_211626 ?auto_211630 ) ) ( not ( = ?auto_211626 ?auto_211631 ) ) ( not ( = ?auto_211626 ?auto_211632 ) ) ( not ( = ?auto_211627 ?auto_211628 ) ) ( not ( = ?auto_211627 ?auto_211629 ) ) ( not ( = ?auto_211627 ?auto_211630 ) ) ( not ( = ?auto_211627 ?auto_211631 ) ) ( not ( = ?auto_211627 ?auto_211632 ) ) ( not ( = ?auto_211628 ?auto_211629 ) ) ( not ( = ?auto_211628 ?auto_211630 ) ) ( not ( = ?auto_211628 ?auto_211631 ) ) ( not ( = ?auto_211628 ?auto_211632 ) ) ( not ( = ?auto_211629 ?auto_211630 ) ) ( not ( = ?auto_211629 ?auto_211631 ) ) ( not ( = ?auto_211629 ?auto_211632 ) ) ( not ( = ?auto_211630 ?auto_211631 ) ) ( not ( = ?auto_211630 ?auto_211632 ) ) ( not ( = ?auto_211631 ?auto_211632 ) ) ( ON ?auto_211630 ?auto_211631 ) ( ON ?auto_211629 ?auto_211630 ) ( ON ?auto_211628 ?auto_211629 ) ( ON ?auto_211627 ?auto_211628 ) ( ON ?auto_211626 ?auto_211627 ) ( ON ?auto_211625 ?auto_211626 ) ( ON ?auto_211624 ?auto_211625 ) ( ON ?auto_211623 ?auto_211624 ) ( ON ?auto_211622 ?auto_211623 ) ( CLEAR ?auto_211620 ) ( ON ?auto_211621 ?auto_211622 ) ( CLEAR ?auto_211621 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_211620 ?auto_211621 )
      ( MAKE-12PILE ?auto_211620 ?auto_211621 ?auto_211622 ?auto_211623 ?auto_211624 ?auto_211625 ?auto_211626 ?auto_211627 ?auto_211628 ?auto_211629 ?auto_211630 ?auto_211631 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_211670 - BLOCK
      ?auto_211671 - BLOCK
      ?auto_211672 - BLOCK
      ?auto_211673 - BLOCK
      ?auto_211674 - BLOCK
      ?auto_211675 - BLOCK
      ?auto_211676 - BLOCK
      ?auto_211677 - BLOCK
      ?auto_211678 - BLOCK
      ?auto_211679 - BLOCK
      ?auto_211680 - BLOCK
      ?auto_211681 - BLOCK
    )
    :vars
    (
      ?auto_211682 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_211681 ?auto_211682 ) ( not ( = ?auto_211670 ?auto_211671 ) ) ( not ( = ?auto_211670 ?auto_211672 ) ) ( not ( = ?auto_211670 ?auto_211673 ) ) ( not ( = ?auto_211670 ?auto_211674 ) ) ( not ( = ?auto_211670 ?auto_211675 ) ) ( not ( = ?auto_211670 ?auto_211676 ) ) ( not ( = ?auto_211670 ?auto_211677 ) ) ( not ( = ?auto_211670 ?auto_211678 ) ) ( not ( = ?auto_211670 ?auto_211679 ) ) ( not ( = ?auto_211670 ?auto_211680 ) ) ( not ( = ?auto_211670 ?auto_211681 ) ) ( not ( = ?auto_211670 ?auto_211682 ) ) ( not ( = ?auto_211671 ?auto_211672 ) ) ( not ( = ?auto_211671 ?auto_211673 ) ) ( not ( = ?auto_211671 ?auto_211674 ) ) ( not ( = ?auto_211671 ?auto_211675 ) ) ( not ( = ?auto_211671 ?auto_211676 ) ) ( not ( = ?auto_211671 ?auto_211677 ) ) ( not ( = ?auto_211671 ?auto_211678 ) ) ( not ( = ?auto_211671 ?auto_211679 ) ) ( not ( = ?auto_211671 ?auto_211680 ) ) ( not ( = ?auto_211671 ?auto_211681 ) ) ( not ( = ?auto_211671 ?auto_211682 ) ) ( not ( = ?auto_211672 ?auto_211673 ) ) ( not ( = ?auto_211672 ?auto_211674 ) ) ( not ( = ?auto_211672 ?auto_211675 ) ) ( not ( = ?auto_211672 ?auto_211676 ) ) ( not ( = ?auto_211672 ?auto_211677 ) ) ( not ( = ?auto_211672 ?auto_211678 ) ) ( not ( = ?auto_211672 ?auto_211679 ) ) ( not ( = ?auto_211672 ?auto_211680 ) ) ( not ( = ?auto_211672 ?auto_211681 ) ) ( not ( = ?auto_211672 ?auto_211682 ) ) ( not ( = ?auto_211673 ?auto_211674 ) ) ( not ( = ?auto_211673 ?auto_211675 ) ) ( not ( = ?auto_211673 ?auto_211676 ) ) ( not ( = ?auto_211673 ?auto_211677 ) ) ( not ( = ?auto_211673 ?auto_211678 ) ) ( not ( = ?auto_211673 ?auto_211679 ) ) ( not ( = ?auto_211673 ?auto_211680 ) ) ( not ( = ?auto_211673 ?auto_211681 ) ) ( not ( = ?auto_211673 ?auto_211682 ) ) ( not ( = ?auto_211674 ?auto_211675 ) ) ( not ( = ?auto_211674 ?auto_211676 ) ) ( not ( = ?auto_211674 ?auto_211677 ) ) ( not ( = ?auto_211674 ?auto_211678 ) ) ( not ( = ?auto_211674 ?auto_211679 ) ) ( not ( = ?auto_211674 ?auto_211680 ) ) ( not ( = ?auto_211674 ?auto_211681 ) ) ( not ( = ?auto_211674 ?auto_211682 ) ) ( not ( = ?auto_211675 ?auto_211676 ) ) ( not ( = ?auto_211675 ?auto_211677 ) ) ( not ( = ?auto_211675 ?auto_211678 ) ) ( not ( = ?auto_211675 ?auto_211679 ) ) ( not ( = ?auto_211675 ?auto_211680 ) ) ( not ( = ?auto_211675 ?auto_211681 ) ) ( not ( = ?auto_211675 ?auto_211682 ) ) ( not ( = ?auto_211676 ?auto_211677 ) ) ( not ( = ?auto_211676 ?auto_211678 ) ) ( not ( = ?auto_211676 ?auto_211679 ) ) ( not ( = ?auto_211676 ?auto_211680 ) ) ( not ( = ?auto_211676 ?auto_211681 ) ) ( not ( = ?auto_211676 ?auto_211682 ) ) ( not ( = ?auto_211677 ?auto_211678 ) ) ( not ( = ?auto_211677 ?auto_211679 ) ) ( not ( = ?auto_211677 ?auto_211680 ) ) ( not ( = ?auto_211677 ?auto_211681 ) ) ( not ( = ?auto_211677 ?auto_211682 ) ) ( not ( = ?auto_211678 ?auto_211679 ) ) ( not ( = ?auto_211678 ?auto_211680 ) ) ( not ( = ?auto_211678 ?auto_211681 ) ) ( not ( = ?auto_211678 ?auto_211682 ) ) ( not ( = ?auto_211679 ?auto_211680 ) ) ( not ( = ?auto_211679 ?auto_211681 ) ) ( not ( = ?auto_211679 ?auto_211682 ) ) ( not ( = ?auto_211680 ?auto_211681 ) ) ( not ( = ?auto_211680 ?auto_211682 ) ) ( not ( = ?auto_211681 ?auto_211682 ) ) ( ON ?auto_211680 ?auto_211681 ) ( ON ?auto_211679 ?auto_211680 ) ( ON ?auto_211678 ?auto_211679 ) ( ON ?auto_211677 ?auto_211678 ) ( ON ?auto_211676 ?auto_211677 ) ( ON ?auto_211675 ?auto_211676 ) ( ON ?auto_211674 ?auto_211675 ) ( ON ?auto_211673 ?auto_211674 ) ( ON ?auto_211672 ?auto_211673 ) ( ON ?auto_211671 ?auto_211672 ) ( ON ?auto_211670 ?auto_211671 ) ( CLEAR ?auto_211670 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_211670 )
      ( MAKE-12PILE ?auto_211670 ?auto_211671 ?auto_211672 ?auto_211673 ?auto_211674 ?auto_211675 ?auto_211676 ?auto_211677 ?auto_211678 ?auto_211679 ?auto_211680 ?auto_211681 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_211721 - BLOCK
      ?auto_211722 - BLOCK
      ?auto_211723 - BLOCK
      ?auto_211724 - BLOCK
      ?auto_211725 - BLOCK
      ?auto_211726 - BLOCK
      ?auto_211727 - BLOCK
      ?auto_211728 - BLOCK
      ?auto_211729 - BLOCK
      ?auto_211730 - BLOCK
      ?auto_211731 - BLOCK
      ?auto_211732 - BLOCK
      ?auto_211733 - BLOCK
    )
    :vars
    (
      ?auto_211734 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_211732 ) ( ON ?auto_211733 ?auto_211734 ) ( CLEAR ?auto_211733 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_211721 ) ( ON ?auto_211722 ?auto_211721 ) ( ON ?auto_211723 ?auto_211722 ) ( ON ?auto_211724 ?auto_211723 ) ( ON ?auto_211725 ?auto_211724 ) ( ON ?auto_211726 ?auto_211725 ) ( ON ?auto_211727 ?auto_211726 ) ( ON ?auto_211728 ?auto_211727 ) ( ON ?auto_211729 ?auto_211728 ) ( ON ?auto_211730 ?auto_211729 ) ( ON ?auto_211731 ?auto_211730 ) ( ON ?auto_211732 ?auto_211731 ) ( not ( = ?auto_211721 ?auto_211722 ) ) ( not ( = ?auto_211721 ?auto_211723 ) ) ( not ( = ?auto_211721 ?auto_211724 ) ) ( not ( = ?auto_211721 ?auto_211725 ) ) ( not ( = ?auto_211721 ?auto_211726 ) ) ( not ( = ?auto_211721 ?auto_211727 ) ) ( not ( = ?auto_211721 ?auto_211728 ) ) ( not ( = ?auto_211721 ?auto_211729 ) ) ( not ( = ?auto_211721 ?auto_211730 ) ) ( not ( = ?auto_211721 ?auto_211731 ) ) ( not ( = ?auto_211721 ?auto_211732 ) ) ( not ( = ?auto_211721 ?auto_211733 ) ) ( not ( = ?auto_211721 ?auto_211734 ) ) ( not ( = ?auto_211722 ?auto_211723 ) ) ( not ( = ?auto_211722 ?auto_211724 ) ) ( not ( = ?auto_211722 ?auto_211725 ) ) ( not ( = ?auto_211722 ?auto_211726 ) ) ( not ( = ?auto_211722 ?auto_211727 ) ) ( not ( = ?auto_211722 ?auto_211728 ) ) ( not ( = ?auto_211722 ?auto_211729 ) ) ( not ( = ?auto_211722 ?auto_211730 ) ) ( not ( = ?auto_211722 ?auto_211731 ) ) ( not ( = ?auto_211722 ?auto_211732 ) ) ( not ( = ?auto_211722 ?auto_211733 ) ) ( not ( = ?auto_211722 ?auto_211734 ) ) ( not ( = ?auto_211723 ?auto_211724 ) ) ( not ( = ?auto_211723 ?auto_211725 ) ) ( not ( = ?auto_211723 ?auto_211726 ) ) ( not ( = ?auto_211723 ?auto_211727 ) ) ( not ( = ?auto_211723 ?auto_211728 ) ) ( not ( = ?auto_211723 ?auto_211729 ) ) ( not ( = ?auto_211723 ?auto_211730 ) ) ( not ( = ?auto_211723 ?auto_211731 ) ) ( not ( = ?auto_211723 ?auto_211732 ) ) ( not ( = ?auto_211723 ?auto_211733 ) ) ( not ( = ?auto_211723 ?auto_211734 ) ) ( not ( = ?auto_211724 ?auto_211725 ) ) ( not ( = ?auto_211724 ?auto_211726 ) ) ( not ( = ?auto_211724 ?auto_211727 ) ) ( not ( = ?auto_211724 ?auto_211728 ) ) ( not ( = ?auto_211724 ?auto_211729 ) ) ( not ( = ?auto_211724 ?auto_211730 ) ) ( not ( = ?auto_211724 ?auto_211731 ) ) ( not ( = ?auto_211724 ?auto_211732 ) ) ( not ( = ?auto_211724 ?auto_211733 ) ) ( not ( = ?auto_211724 ?auto_211734 ) ) ( not ( = ?auto_211725 ?auto_211726 ) ) ( not ( = ?auto_211725 ?auto_211727 ) ) ( not ( = ?auto_211725 ?auto_211728 ) ) ( not ( = ?auto_211725 ?auto_211729 ) ) ( not ( = ?auto_211725 ?auto_211730 ) ) ( not ( = ?auto_211725 ?auto_211731 ) ) ( not ( = ?auto_211725 ?auto_211732 ) ) ( not ( = ?auto_211725 ?auto_211733 ) ) ( not ( = ?auto_211725 ?auto_211734 ) ) ( not ( = ?auto_211726 ?auto_211727 ) ) ( not ( = ?auto_211726 ?auto_211728 ) ) ( not ( = ?auto_211726 ?auto_211729 ) ) ( not ( = ?auto_211726 ?auto_211730 ) ) ( not ( = ?auto_211726 ?auto_211731 ) ) ( not ( = ?auto_211726 ?auto_211732 ) ) ( not ( = ?auto_211726 ?auto_211733 ) ) ( not ( = ?auto_211726 ?auto_211734 ) ) ( not ( = ?auto_211727 ?auto_211728 ) ) ( not ( = ?auto_211727 ?auto_211729 ) ) ( not ( = ?auto_211727 ?auto_211730 ) ) ( not ( = ?auto_211727 ?auto_211731 ) ) ( not ( = ?auto_211727 ?auto_211732 ) ) ( not ( = ?auto_211727 ?auto_211733 ) ) ( not ( = ?auto_211727 ?auto_211734 ) ) ( not ( = ?auto_211728 ?auto_211729 ) ) ( not ( = ?auto_211728 ?auto_211730 ) ) ( not ( = ?auto_211728 ?auto_211731 ) ) ( not ( = ?auto_211728 ?auto_211732 ) ) ( not ( = ?auto_211728 ?auto_211733 ) ) ( not ( = ?auto_211728 ?auto_211734 ) ) ( not ( = ?auto_211729 ?auto_211730 ) ) ( not ( = ?auto_211729 ?auto_211731 ) ) ( not ( = ?auto_211729 ?auto_211732 ) ) ( not ( = ?auto_211729 ?auto_211733 ) ) ( not ( = ?auto_211729 ?auto_211734 ) ) ( not ( = ?auto_211730 ?auto_211731 ) ) ( not ( = ?auto_211730 ?auto_211732 ) ) ( not ( = ?auto_211730 ?auto_211733 ) ) ( not ( = ?auto_211730 ?auto_211734 ) ) ( not ( = ?auto_211731 ?auto_211732 ) ) ( not ( = ?auto_211731 ?auto_211733 ) ) ( not ( = ?auto_211731 ?auto_211734 ) ) ( not ( = ?auto_211732 ?auto_211733 ) ) ( not ( = ?auto_211732 ?auto_211734 ) ) ( not ( = ?auto_211733 ?auto_211734 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_211733 ?auto_211734 )
      ( !STACK ?auto_211733 ?auto_211732 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_211748 - BLOCK
      ?auto_211749 - BLOCK
      ?auto_211750 - BLOCK
      ?auto_211751 - BLOCK
      ?auto_211752 - BLOCK
      ?auto_211753 - BLOCK
      ?auto_211754 - BLOCK
      ?auto_211755 - BLOCK
      ?auto_211756 - BLOCK
      ?auto_211757 - BLOCK
      ?auto_211758 - BLOCK
      ?auto_211759 - BLOCK
      ?auto_211760 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_211759 ) ( ON-TABLE ?auto_211760 ) ( CLEAR ?auto_211760 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_211748 ) ( ON ?auto_211749 ?auto_211748 ) ( ON ?auto_211750 ?auto_211749 ) ( ON ?auto_211751 ?auto_211750 ) ( ON ?auto_211752 ?auto_211751 ) ( ON ?auto_211753 ?auto_211752 ) ( ON ?auto_211754 ?auto_211753 ) ( ON ?auto_211755 ?auto_211754 ) ( ON ?auto_211756 ?auto_211755 ) ( ON ?auto_211757 ?auto_211756 ) ( ON ?auto_211758 ?auto_211757 ) ( ON ?auto_211759 ?auto_211758 ) ( not ( = ?auto_211748 ?auto_211749 ) ) ( not ( = ?auto_211748 ?auto_211750 ) ) ( not ( = ?auto_211748 ?auto_211751 ) ) ( not ( = ?auto_211748 ?auto_211752 ) ) ( not ( = ?auto_211748 ?auto_211753 ) ) ( not ( = ?auto_211748 ?auto_211754 ) ) ( not ( = ?auto_211748 ?auto_211755 ) ) ( not ( = ?auto_211748 ?auto_211756 ) ) ( not ( = ?auto_211748 ?auto_211757 ) ) ( not ( = ?auto_211748 ?auto_211758 ) ) ( not ( = ?auto_211748 ?auto_211759 ) ) ( not ( = ?auto_211748 ?auto_211760 ) ) ( not ( = ?auto_211749 ?auto_211750 ) ) ( not ( = ?auto_211749 ?auto_211751 ) ) ( not ( = ?auto_211749 ?auto_211752 ) ) ( not ( = ?auto_211749 ?auto_211753 ) ) ( not ( = ?auto_211749 ?auto_211754 ) ) ( not ( = ?auto_211749 ?auto_211755 ) ) ( not ( = ?auto_211749 ?auto_211756 ) ) ( not ( = ?auto_211749 ?auto_211757 ) ) ( not ( = ?auto_211749 ?auto_211758 ) ) ( not ( = ?auto_211749 ?auto_211759 ) ) ( not ( = ?auto_211749 ?auto_211760 ) ) ( not ( = ?auto_211750 ?auto_211751 ) ) ( not ( = ?auto_211750 ?auto_211752 ) ) ( not ( = ?auto_211750 ?auto_211753 ) ) ( not ( = ?auto_211750 ?auto_211754 ) ) ( not ( = ?auto_211750 ?auto_211755 ) ) ( not ( = ?auto_211750 ?auto_211756 ) ) ( not ( = ?auto_211750 ?auto_211757 ) ) ( not ( = ?auto_211750 ?auto_211758 ) ) ( not ( = ?auto_211750 ?auto_211759 ) ) ( not ( = ?auto_211750 ?auto_211760 ) ) ( not ( = ?auto_211751 ?auto_211752 ) ) ( not ( = ?auto_211751 ?auto_211753 ) ) ( not ( = ?auto_211751 ?auto_211754 ) ) ( not ( = ?auto_211751 ?auto_211755 ) ) ( not ( = ?auto_211751 ?auto_211756 ) ) ( not ( = ?auto_211751 ?auto_211757 ) ) ( not ( = ?auto_211751 ?auto_211758 ) ) ( not ( = ?auto_211751 ?auto_211759 ) ) ( not ( = ?auto_211751 ?auto_211760 ) ) ( not ( = ?auto_211752 ?auto_211753 ) ) ( not ( = ?auto_211752 ?auto_211754 ) ) ( not ( = ?auto_211752 ?auto_211755 ) ) ( not ( = ?auto_211752 ?auto_211756 ) ) ( not ( = ?auto_211752 ?auto_211757 ) ) ( not ( = ?auto_211752 ?auto_211758 ) ) ( not ( = ?auto_211752 ?auto_211759 ) ) ( not ( = ?auto_211752 ?auto_211760 ) ) ( not ( = ?auto_211753 ?auto_211754 ) ) ( not ( = ?auto_211753 ?auto_211755 ) ) ( not ( = ?auto_211753 ?auto_211756 ) ) ( not ( = ?auto_211753 ?auto_211757 ) ) ( not ( = ?auto_211753 ?auto_211758 ) ) ( not ( = ?auto_211753 ?auto_211759 ) ) ( not ( = ?auto_211753 ?auto_211760 ) ) ( not ( = ?auto_211754 ?auto_211755 ) ) ( not ( = ?auto_211754 ?auto_211756 ) ) ( not ( = ?auto_211754 ?auto_211757 ) ) ( not ( = ?auto_211754 ?auto_211758 ) ) ( not ( = ?auto_211754 ?auto_211759 ) ) ( not ( = ?auto_211754 ?auto_211760 ) ) ( not ( = ?auto_211755 ?auto_211756 ) ) ( not ( = ?auto_211755 ?auto_211757 ) ) ( not ( = ?auto_211755 ?auto_211758 ) ) ( not ( = ?auto_211755 ?auto_211759 ) ) ( not ( = ?auto_211755 ?auto_211760 ) ) ( not ( = ?auto_211756 ?auto_211757 ) ) ( not ( = ?auto_211756 ?auto_211758 ) ) ( not ( = ?auto_211756 ?auto_211759 ) ) ( not ( = ?auto_211756 ?auto_211760 ) ) ( not ( = ?auto_211757 ?auto_211758 ) ) ( not ( = ?auto_211757 ?auto_211759 ) ) ( not ( = ?auto_211757 ?auto_211760 ) ) ( not ( = ?auto_211758 ?auto_211759 ) ) ( not ( = ?auto_211758 ?auto_211760 ) ) ( not ( = ?auto_211759 ?auto_211760 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_211760 )
      ( !STACK ?auto_211760 ?auto_211759 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_211774 - BLOCK
      ?auto_211775 - BLOCK
      ?auto_211776 - BLOCK
      ?auto_211777 - BLOCK
      ?auto_211778 - BLOCK
      ?auto_211779 - BLOCK
      ?auto_211780 - BLOCK
      ?auto_211781 - BLOCK
      ?auto_211782 - BLOCK
      ?auto_211783 - BLOCK
      ?auto_211784 - BLOCK
      ?auto_211785 - BLOCK
      ?auto_211786 - BLOCK
    )
    :vars
    (
      ?auto_211787 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_211786 ?auto_211787 ) ( ON-TABLE ?auto_211774 ) ( ON ?auto_211775 ?auto_211774 ) ( ON ?auto_211776 ?auto_211775 ) ( ON ?auto_211777 ?auto_211776 ) ( ON ?auto_211778 ?auto_211777 ) ( ON ?auto_211779 ?auto_211778 ) ( ON ?auto_211780 ?auto_211779 ) ( ON ?auto_211781 ?auto_211780 ) ( ON ?auto_211782 ?auto_211781 ) ( ON ?auto_211783 ?auto_211782 ) ( ON ?auto_211784 ?auto_211783 ) ( not ( = ?auto_211774 ?auto_211775 ) ) ( not ( = ?auto_211774 ?auto_211776 ) ) ( not ( = ?auto_211774 ?auto_211777 ) ) ( not ( = ?auto_211774 ?auto_211778 ) ) ( not ( = ?auto_211774 ?auto_211779 ) ) ( not ( = ?auto_211774 ?auto_211780 ) ) ( not ( = ?auto_211774 ?auto_211781 ) ) ( not ( = ?auto_211774 ?auto_211782 ) ) ( not ( = ?auto_211774 ?auto_211783 ) ) ( not ( = ?auto_211774 ?auto_211784 ) ) ( not ( = ?auto_211774 ?auto_211785 ) ) ( not ( = ?auto_211774 ?auto_211786 ) ) ( not ( = ?auto_211774 ?auto_211787 ) ) ( not ( = ?auto_211775 ?auto_211776 ) ) ( not ( = ?auto_211775 ?auto_211777 ) ) ( not ( = ?auto_211775 ?auto_211778 ) ) ( not ( = ?auto_211775 ?auto_211779 ) ) ( not ( = ?auto_211775 ?auto_211780 ) ) ( not ( = ?auto_211775 ?auto_211781 ) ) ( not ( = ?auto_211775 ?auto_211782 ) ) ( not ( = ?auto_211775 ?auto_211783 ) ) ( not ( = ?auto_211775 ?auto_211784 ) ) ( not ( = ?auto_211775 ?auto_211785 ) ) ( not ( = ?auto_211775 ?auto_211786 ) ) ( not ( = ?auto_211775 ?auto_211787 ) ) ( not ( = ?auto_211776 ?auto_211777 ) ) ( not ( = ?auto_211776 ?auto_211778 ) ) ( not ( = ?auto_211776 ?auto_211779 ) ) ( not ( = ?auto_211776 ?auto_211780 ) ) ( not ( = ?auto_211776 ?auto_211781 ) ) ( not ( = ?auto_211776 ?auto_211782 ) ) ( not ( = ?auto_211776 ?auto_211783 ) ) ( not ( = ?auto_211776 ?auto_211784 ) ) ( not ( = ?auto_211776 ?auto_211785 ) ) ( not ( = ?auto_211776 ?auto_211786 ) ) ( not ( = ?auto_211776 ?auto_211787 ) ) ( not ( = ?auto_211777 ?auto_211778 ) ) ( not ( = ?auto_211777 ?auto_211779 ) ) ( not ( = ?auto_211777 ?auto_211780 ) ) ( not ( = ?auto_211777 ?auto_211781 ) ) ( not ( = ?auto_211777 ?auto_211782 ) ) ( not ( = ?auto_211777 ?auto_211783 ) ) ( not ( = ?auto_211777 ?auto_211784 ) ) ( not ( = ?auto_211777 ?auto_211785 ) ) ( not ( = ?auto_211777 ?auto_211786 ) ) ( not ( = ?auto_211777 ?auto_211787 ) ) ( not ( = ?auto_211778 ?auto_211779 ) ) ( not ( = ?auto_211778 ?auto_211780 ) ) ( not ( = ?auto_211778 ?auto_211781 ) ) ( not ( = ?auto_211778 ?auto_211782 ) ) ( not ( = ?auto_211778 ?auto_211783 ) ) ( not ( = ?auto_211778 ?auto_211784 ) ) ( not ( = ?auto_211778 ?auto_211785 ) ) ( not ( = ?auto_211778 ?auto_211786 ) ) ( not ( = ?auto_211778 ?auto_211787 ) ) ( not ( = ?auto_211779 ?auto_211780 ) ) ( not ( = ?auto_211779 ?auto_211781 ) ) ( not ( = ?auto_211779 ?auto_211782 ) ) ( not ( = ?auto_211779 ?auto_211783 ) ) ( not ( = ?auto_211779 ?auto_211784 ) ) ( not ( = ?auto_211779 ?auto_211785 ) ) ( not ( = ?auto_211779 ?auto_211786 ) ) ( not ( = ?auto_211779 ?auto_211787 ) ) ( not ( = ?auto_211780 ?auto_211781 ) ) ( not ( = ?auto_211780 ?auto_211782 ) ) ( not ( = ?auto_211780 ?auto_211783 ) ) ( not ( = ?auto_211780 ?auto_211784 ) ) ( not ( = ?auto_211780 ?auto_211785 ) ) ( not ( = ?auto_211780 ?auto_211786 ) ) ( not ( = ?auto_211780 ?auto_211787 ) ) ( not ( = ?auto_211781 ?auto_211782 ) ) ( not ( = ?auto_211781 ?auto_211783 ) ) ( not ( = ?auto_211781 ?auto_211784 ) ) ( not ( = ?auto_211781 ?auto_211785 ) ) ( not ( = ?auto_211781 ?auto_211786 ) ) ( not ( = ?auto_211781 ?auto_211787 ) ) ( not ( = ?auto_211782 ?auto_211783 ) ) ( not ( = ?auto_211782 ?auto_211784 ) ) ( not ( = ?auto_211782 ?auto_211785 ) ) ( not ( = ?auto_211782 ?auto_211786 ) ) ( not ( = ?auto_211782 ?auto_211787 ) ) ( not ( = ?auto_211783 ?auto_211784 ) ) ( not ( = ?auto_211783 ?auto_211785 ) ) ( not ( = ?auto_211783 ?auto_211786 ) ) ( not ( = ?auto_211783 ?auto_211787 ) ) ( not ( = ?auto_211784 ?auto_211785 ) ) ( not ( = ?auto_211784 ?auto_211786 ) ) ( not ( = ?auto_211784 ?auto_211787 ) ) ( not ( = ?auto_211785 ?auto_211786 ) ) ( not ( = ?auto_211785 ?auto_211787 ) ) ( not ( = ?auto_211786 ?auto_211787 ) ) ( CLEAR ?auto_211784 ) ( ON ?auto_211785 ?auto_211786 ) ( CLEAR ?auto_211785 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_211774 ?auto_211775 ?auto_211776 ?auto_211777 ?auto_211778 ?auto_211779 ?auto_211780 ?auto_211781 ?auto_211782 ?auto_211783 ?auto_211784 ?auto_211785 )
      ( MAKE-13PILE ?auto_211774 ?auto_211775 ?auto_211776 ?auto_211777 ?auto_211778 ?auto_211779 ?auto_211780 ?auto_211781 ?auto_211782 ?auto_211783 ?auto_211784 ?auto_211785 ?auto_211786 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_211801 - BLOCK
      ?auto_211802 - BLOCK
      ?auto_211803 - BLOCK
      ?auto_211804 - BLOCK
      ?auto_211805 - BLOCK
      ?auto_211806 - BLOCK
      ?auto_211807 - BLOCK
      ?auto_211808 - BLOCK
      ?auto_211809 - BLOCK
      ?auto_211810 - BLOCK
      ?auto_211811 - BLOCK
      ?auto_211812 - BLOCK
      ?auto_211813 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_211813 ) ( ON-TABLE ?auto_211801 ) ( ON ?auto_211802 ?auto_211801 ) ( ON ?auto_211803 ?auto_211802 ) ( ON ?auto_211804 ?auto_211803 ) ( ON ?auto_211805 ?auto_211804 ) ( ON ?auto_211806 ?auto_211805 ) ( ON ?auto_211807 ?auto_211806 ) ( ON ?auto_211808 ?auto_211807 ) ( ON ?auto_211809 ?auto_211808 ) ( ON ?auto_211810 ?auto_211809 ) ( ON ?auto_211811 ?auto_211810 ) ( not ( = ?auto_211801 ?auto_211802 ) ) ( not ( = ?auto_211801 ?auto_211803 ) ) ( not ( = ?auto_211801 ?auto_211804 ) ) ( not ( = ?auto_211801 ?auto_211805 ) ) ( not ( = ?auto_211801 ?auto_211806 ) ) ( not ( = ?auto_211801 ?auto_211807 ) ) ( not ( = ?auto_211801 ?auto_211808 ) ) ( not ( = ?auto_211801 ?auto_211809 ) ) ( not ( = ?auto_211801 ?auto_211810 ) ) ( not ( = ?auto_211801 ?auto_211811 ) ) ( not ( = ?auto_211801 ?auto_211812 ) ) ( not ( = ?auto_211801 ?auto_211813 ) ) ( not ( = ?auto_211802 ?auto_211803 ) ) ( not ( = ?auto_211802 ?auto_211804 ) ) ( not ( = ?auto_211802 ?auto_211805 ) ) ( not ( = ?auto_211802 ?auto_211806 ) ) ( not ( = ?auto_211802 ?auto_211807 ) ) ( not ( = ?auto_211802 ?auto_211808 ) ) ( not ( = ?auto_211802 ?auto_211809 ) ) ( not ( = ?auto_211802 ?auto_211810 ) ) ( not ( = ?auto_211802 ?auto_211811 ) ) ( not ( = ?auto_211802 ?auto_211812 ) ) ( not ( = ?auto_211802 ?auto_211813 ) ) ( not ( = ?auto_211803 ?auto_211804 ) ) ( not ( = ?auto_211803 ?auto_211805 ) ) ( not ( = ?auto_211803 ?auto_211806 ) ) ( not ( = ?auto_211803 ?auto_211807 ) ) ( not ( = ?auto_211803 ?auto_211808 ) ) ( not ( = ?auto_211803 ?auto_211809 ) ) ( not ( = ?auto_211803 ?auto_211810 ) ) ( not ( = ?auto_211803 ?auto_211811 ) ) ( not ( = ?auto_211803 ?auto_211812 ) ) ( not ( = ?auto_211803 ?auto_211813 ) ) ( not ( = ?auto_211804 ?auto_211805 ) ) ( not ( = ?auto_211804 ?auto_211806 ) ) ( not ( = ?auto_211804 ?auto_211807 ) ) ( not ( = ?auto_211804 ?auto_211808 ) ) ( not ( = ?auto_211804 ?auto_211809 ) ) ( not ( = ?auto_211804 ?auto_211810 ) ) ( not ( = ?auto_211804 ?auto_211811 ) ) ( not ( = ?auto_211804 ?auto_211812 ) ) ( not ( = ?auto_211804 ?auto_211813 ) ) ( not ( = ?auto_211805 ?auto_211806 ) ) ( not ( = ?auto_211805 ?auto_211807 ) ) ( not ( = ?auto_211805 ?auto_211808 ) ) ( not ( = ?auto_211805 ?auto_211809 ) ) ( not ( = ?auto_211805 ?auto_211810 ) ) ( not ( = ?auto_211805 ?auto_211811 ) ) ( not ( = ?auto_211805 ?auto_211812 ) ) ( not ( = ?auto_211805 ?auto_211813 ) ) ( not ( = ?auto_211806 ?auto_211807 ) ) ( not ( = ?auto_211806 ?auto_211808 ) ) ( not ( = ?auto_211806 ?auto_211809 ) ) ( not ( = ?auto_211806 ?auto_211810 ) ) ( not ( = ?auto_211806 ?auto_211811 ) ) ( not ( = ?auto_211806 ?auto_211812 ) ) ( not ( = ?auto_211806 ?auto_211813 ) ) ( not ( = ?auto_211807 ?auto_211808 ) ) ( not ( = ?auto_211807 ?auto_211809 ) ) ( not ( = ?auto_211807 ?auto_211810 ) ) ( not ( = ?auto_211807 ?auto_211811 ) ) ( not ( = ?auto_211807 ?auto_211812 ) ) ( not ( = ?auto_211807 ?auto_211813 ) ) ( not ( = ?auto_211808 ?auto_211809 ) ) ( not ( = ?auto_211808 ?auto_211810 ) ) ( not ( = ?auto_211808 ?auto_211811 ) ) ( not ( = ?auto_211808 ?auto_211812 ) ) ( not ( = ?auto_211808 ?auto_211813 ) ) ( not ( = ?auto_211809 ?auto_211810 ) ) ( not ( = ?auto_211809 ?auto_211811 ) ) ( not ( = ?auto_211809 ?auto_211812 ) ) ( not ( = ?auto_211809 ?auto_211813 ) ) ( not ( = ?auto_211810 ?auto_211811 ) ) ( not ( = ?auto_211810 ?auto_211812 ) ) ( not ( = ?auto_211810 ?auto_211813 ) ) ( not ( = ?auto_211811 ?auto_211812 ) ) ( not ( = ?auto_211811 ?auto_211813 ) ) ( not ( = ?auto_211812 ?auto_211813 ) ) ( CLEAR ?auto_211811 ) ( ON ?auto_211812 ?auto_211813 ) ( CLEAR ?auto_211812 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_211801 ?auto_211802 ?auto_211803 ?auto_211804 ?auto_211805 ?auto_211806 ?auto_211807 ?auto_211808 ?auto_211809 ?auto_211810 ?auto_211811 ?auto_211812 )
      ( MAKE-13PILE ?auto_211801 ?auto_211802 ?auto_211803 ?auto_211804 ?auto_211805 ?auto_211806 ?auto_211807 ?auto_211808 ?auto_211809 ?auto_211810 ?auto_211811 ?auto_211812 ?auto_211813 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_211827 - BLOCK
      ?auto_211828 - BLOCK
      ?auto_211829 - BLOCK
      ?auto_211830 - BLOCK
      ?auto_211831 - BLOCK
      ?auto_211832 - BLOCK
      ?auto_211833 - BLOCK
      ?auto_211834 - BLOCK
      ?auto_211835 - BLOCK
      ?auto_211836 - BLOCK
      ?auto_211837 - BLOCK
      ?auto_211838 - BLOCK
      ?auto_211839 - BLOCK
    )
    :vars
    (
      ?auto_211840 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_211839 ?auto_211840 ) ( ON-TABLE ?auto_211827 ) ( ON ?auto_211828 ?auto_211827 ) ( ON ?auto_211829 ?auto_211828 ) ( ON ?auto_211830 ?auto_211829 ) ( ON ?auto_211831 ?auto_211830 ) ( ON ?auto_211832 ?auto_211831 ) ( ON ?auto_211833 ?auto_211832 ) ( ON ?auto_211834 ?auto_211833 ) ( ON ?auto_211835 ?auto_211834 ) ( ON ?auto_211836 ?auto_211835 ) ( not ( = ?auto_211827 ?auto_211828 ) ) ( not ( = ?auto_211827 ?auto_211829 ) ) ( not ( = ?auto_211827 ?auto_211830 ) ) ( not ( = ?auto_211827 ?auto_211831 ) ) ( not ( = ?auto_211827 ?auto_211832 ) ) ( not ( = ?auto_211827 ?auto_211833 ) ) ( not ( = ?auto_211827 ?auto_211834 ) ) ( not ( = ?auto_211827 ?auto_211835 ) ) ( not ( = ?auto_211827 ?auto_211836 ) ) ( not ( = ?auto_211827 ?auto_211837 ) ) ( not ( = ?auto_211827 ?auto_211838 ) ) ( not ( = ?auto_211827 ?auto_211839 ) ) ( not ( = ?auto_211827 ?auto_211840 ) ) ( not ( = ?auto_211828 ?auto_211829 ) ) ( not ( = ?auto_211828 ?auto_211830 ) ) ( not ( = ?auto_211828 ?auto_211831 ) ) ( not ( = ?auto_211828 ?auto_211832 ) ) ( not ( = ?auto_211828 ?auto_211833 ) ) ( not ( = ?auto_211828 ?auto_211834 ) ) ( not ( = ?auto_211828 ?auto_211835 ) ) ( not ( = ?auto_211828 ?auto_211836 ) ) ( not ( = ?auto_211828 ?auto_211837 ) ) ( not ( = ?auto_211828 ?auto_211838 ) ) ( not ( = ?auto_211828 ?auto_211839 ) ) ( not ( = ?auto_211828 ?auto_211840 ) ) ( not ( = ?auto_211829 ?auto_211830 ) ) ( not ( = ?auto_211829 ?auto_211831 ) ) ( not ( = ?auto_211829 ?auto_211832 ) ) ( not ( = ?auto_211829 ?auto_211833 ) ) ( not ( = ?auto_211829 ?auto_211834 ) ) ( not ( = ?auto_211829 ?auto_211835 ) ) ( not ( = ?auto_211829 ?auto_211836 ) ) ( not ( = ?auto_211829 ?auto_211837 ) ) ( not ( = ?auto_211829 ?auto_211838 ) ) ( not ( = ?auto_211829 ?auto_211839 ) ) ( not ( = ?auto_211829 ?auto_211840 ) ) ( not ( = ?auto_211830 ?auto_211831 ) ) ( not ( = ?auto_211830 ?auto_211832 ) ) ( not ( = ?auto_211830 ?auto_211833 ) ) ( not ( = ?auto_211830 ?auto_211834 ) ) ( not ( = ?auto_211830 ?auto_211835 ) ) ( not ( = ?auto_211830 ?auto_211836 ) ) ( not ( = ?auto_211830 ?auto_211837 ) ) ( not ( = ?auto_211830 ?auto_211838 ) ) ( not ( = ?auto_211830 ?auto_211839 ) ) ( not ( = ?auto_211830 ?auto_211840 ) ) ( not ( = ?auto_211831 ?auto_211832 ) ) ( not ( = ?auto_211831 ?auto_211833 ) ) ( not ( = ?auto_211831 ?auto_211834 ) ) ( not ( = ?auto_211831 ?auto_211835 ) ) ( not ( = ?auto_211831 ?auto_211836 ) ) ( not ( = ?auto_211831 ?auto_211837 ) ) ( not ( = ?auto_211831 ?auto_211838 ) ) ( not ( = ?auto_211831 ?auto_211839 ) ) ( not ( = ?auto_211831 ?auto_211840 ) ) ( not ( = ?auto_211832 ?auto_211833 ) ) ( not ( = ?auto_211832 ?auto_211834 ) ) ( not ( = ?auto_211832 ?auto_211835 ) ) ( not ( = ?auto_211832 ?auto_211836 ) ) ( not ( = ?auto_211832 ?auto_211837 ) ) ( not ( = ?auto_211832 ?auto_211838 ) ) ( not ( = ?auto_211832 ?auto_211839 ) ) ( not ( = ?auto_211832 ?auto_211840 ) ) ( not ( = ?auto_211833 ?auto_211834 ) ) ( not ( = ?auto_211833 ?auto_211835 ) ) ( not ( = ?auto_211833 ?auto_211836 ) ) ( not ( = ?auto_211833 ?auto_211837 ) ) ( not ( = ?auto_211833 ?auto_211838 ) ) ( not ( = ?auto_211833 ?auto_211839 ) ) ( not ( = ?auto_211833 ?auto_211840 ) ) ( not ( = ?auto_211834 ?auto_211835 ) ) ( not ( = ?auto_211834 ?auto_211836 ) ) ( not ( = ?auto_211834 ?auto_211837 ) ) ( not ( = ?auto_211834 ?auto_211838 ) ) ( not ( = ?auto_211834 ?auto_211839 ) ) ( not ( = ?auto_211834 ?auto_211840 ) ) ( not ( = ?auto_211835 ?auto_211836 ) ) ( not ( = ?auto_211835 ?auto_211837 ) ) ( not ( = ?auto_211835 ?auto_211838 ) ) ( not ( = ?auto_211835 ?auto_211839 ) ) ( not ( = ?auto_211835 ?auto_211840 ) ) ( not ( = ?auto_211836 ?auto_211837 ) ) ( not ( = ?auto_211836 ?auto_211838 ) ) ( not ( = ?auto_211836 ?auto_211839 ) ) ( not ( = ?auto_211836 ?auto_211840 ) ) ( not ( = ?auto_211837 ?auto_211838 ) ) ( not ( = ?auto_211837 ?auto_211839 ) ) ( not ( = ?auto_211837 ?auto_211840 ) ) ( not ( = ?auto_211838 ?auto_211839 ) ) ( not ( = ?auto_211838 ?auto_211840 ) ) ( not ( = ?auto_211839 ?auto_211840 ) ) ( ON ?auto_211838 ?auto_211839 ) ( CLEAR ?auto_211836 ) ( ON ?auto_211837 ?auto_211838 ) ( CLEAR ?auto_211837 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_211827 ?auto_211828 ?auto_211829 ?auto_211830 ?auto_211831 ?auto_211832 ?auto_211833 ?auto_211834 ?auto_211835 ?auto_211836 ?auto_211837 )
      ( MAKE-13PILE ?auto_211827 ?auto_211828 ?auto_211829 ?auto_211830 ?auto_211831 ?auto_211832 ?auto_211833 ?auto_211834 ?auto_211835 ?auto_211836 ?auto_211837 ?auto_211838 ?auto_211839 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_211854 - BLOCK
      ?auto_211855 - BLOCK
      ?auto_211856 - BLOCK
      ?auto_211857 - BLOCK
      ?auto_211858 - BLOCK
      ?auto_211859 - BLOCK
      ?auto_211860 - BLOCK
      ?auto_211861 - BLOCK
      ?auto_211862 - BLOCK
      ?auto_211863 - BLOCK
      ?auto_211864 - BLOCK
      ?auto_211865 - BLOCK
      ?auto_211866 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_211866 ) ( ON-TABLE ?auto_211854 ) ( ON ?auto_211855 ?auto_211854 ) ( ON ?auto_211856 ?auto_211855 ) ( ON ?auto_211857 ?auto_211856 ) ( ON ?auto_211858 ?auto_211857 ) ( ON ?auto_211859 ?auto_211858 ) ( ON ?auto_211860 ?auto_211859 ) ( ON ?auto_211861 ?auto_211860 ) ( ON ?auto_211862 ?auto_211861 ) ( ON ?auto_211863 ?auto_211862 ) ( not ( = ?auto_211854 ?auto_211855 ) ) ( not ( = ?auto_211854 ?auto_211856 ) ) ( not ( = ?auto_211854 ?auto_211857 ) ) ( not ( = ?auto_211854 ?auto_211858 ) ) ( not ( = ?auto_211854 ?auto_211859 ) ) ( not ( = ?auto_211854 ?auto_211860 ) ) ( not ( = ?auto_211854 ?auto_211861 ) ) ( not ( = ?auto_211854 ?auto_211862 ) ) ( not ( = ?auto_211854 ?auto_211863 ) ) ( not ( = ?auto_211854 ?auto_211864 ) ) ( not ( = ?auto_211854 ?auto_211865 ) ) ( not ( = ?auto_211854 ?auto_211866 ) ) ( not ( = ?auto_211855 ?auto_211856 ) ) ( not ( = ?auto_211855 ?auto_211857 ) ) ( not ( = ?auto_211855 ?auto_211858 ) ) ( not ( = ?auto_211855 ?auto_211859 ) ) ( not ( = ?auto_211855 ?auto_211860 ) ) ( not ( = ?auto_211855 ?auto_211861 ) ) ( not ( = ?auto_211855 ?auto_211862 ) ) ( not ( = ?auto_211855 ?auto_211863 ) ) ( not ( = ?auto_211855 ?auto_211864 ) ) ( not ( = ?auto_211855 ?auto_211865 ) ) ( not ( = ?auto_211855 ?auto_211866 ) ) ( not ( = ?auto_211856 ?auto_211857 ) ) ( not ( = ?auto_211856 ?auto_211858 ) ) ( not ( = ?auto_211856 ?auto_211859 ) ) ( not ( = ?auto_211856 ?auto_211860 ) ) ( not ( = ?auto_211856 ?auto_211861 ) ) ( not ( = ?auto_211856 ?auto_211862 ) ) ( not ( = ?auto_211856 ?auto_211863 ) ) ( not ( = ?auto_211856 ?auto_211864 ) ) ( not ( = ?auto_211856 ?auto_211865 ) ) ( not ( = ?auto_211856 ?auto_211866 ) ) ( not ( = ?auto_211857 ?auto_211858 ) ) ( not ( = ?auto_211857 ?auto_211859 ) ) ( not ( = ?auto_211857 ?auto_211860 ) ) ( not ( = ?auto_211857 ?auto_211861 ) ) ( not ( = ?auto_211857 ?auto_211862 ) ) ( not ( = ?auto_211857 ?auto_211863 ) ) ( not ( = ?auto_211857 ?auto_211864 ) ) ( not ( = ?auto_211857 ?auto_211865 ) ) ( not ( = ?auto_211857 ?auto_211866 ) ) ( not ( = ?auto_211858 ?auto_211859 ) ) ( not ( = ?auto_211858 ?auto_211860 ) ) ( not ( = ?auto_211858 ?auto_211861 ) ) ( not ( = ?auto_211858 ?auto_211862 ) ) ( not ( = ?auto_211858 ?auto_211863 ) ) ( not ( = ?auto_211858 ?auto_211864 ) ) ( not ( = ?auto_211858 ?auto_211865 ) ) ( not ( = ?auto_211858 ?auto_211866 ) ) ( not ( = ?auto_211859 ?auto_211860 ) ) ( not ( = ?auto_211859 ?auto_211861 ) ) ( not ( = ?auto_211859 ?auto_211862 ) ) ( not ( = ?auto_211859 ?auto_211863 ) ) ( not ( = ?auto_211859 ?auto_211864 ) ) ( not ( = ?auto_211859 ?auto_211865 ) ) ( not ( = ?auto_211859 ?auto_211866 ) ) ( not ( = ?auto_211860 ?auto_211861 ) ) ( not ( = ?auto_211860 ?auto_211862 ) ) ( not ( = ?auto_211860 ?auto_211863 ) ) ( not ( = ?auto_211860 ?auto_211864 ) ) ( not ( = ?auto_211860 ?auto_211865 ) ) ( not ( = ?auto_211860 ?auto_211866 ) ) ( not ( = ?auto_211861 ?auto_211862 ) ) ( not ( = ?auto_211861 ?auto_211863 ) ) ( not ( = ?auto_211861 ?auto_211864 ) ) ( not ( = ?auto_211861 ?auto_211865 ) ) ( not ( = ?auto_211861 ?auto_211866 ) ) ( not ( = ?auto_211862 ?auto_211863 ) ) ( not ( = ?auto_211862 ?auto_211864 ) ) ( not ( = ?auto_211862 ?auto_211865 ) ) ( not ( = ?auto_211862 ?auto_211866 ) ) ( not ( = ?auto_211863 ?auto_211864 ) ) ( not ( = ?auto_211863 ?auto_211865 ) ) ( not ( = ?auto_211863 ?auto_211866 ) ) ( not ( = ?auto_211864 ?auto_211865 ) ) ( not ( = ?auto_211864 ?auto_211866 ) ) ( not ( = ?auto_211865 ?auto_211866 ) ) ( ON ?auto_211865 ?auto_211866 ) ( CLEAR ?auto_211863 ) ( ON ?auto_211864 ?auto_211865 ) ( CLEAR ?auto_211864 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_211854 ?auto_211855 ?auto_211856 ?auto_211857 ?auto_211858 ?auto_211859 ?auto_211860 ?auto_211861 ?auto_211862 ?auto_211863 ?auto_211864 )
      ( MAKE-13PILE ?auto_211854 ?auto_211855 ?auto_211856 ?auto_211857 ?auto_211858 ?auto_211859 ?auto_211860 ?auto_211861 ?auto_211862 ?auto_211863 ?auto_211864 ?auto_211865 ?auto_211866 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_211880 - BLOCK
      ?auto_211881 - BLOCK
      ?auto_211882 - BLOCK
      ?auto_211883 - BLOCK
      ?auto_211884 - BLOCK
      ?auto_211885 - BLOCK
      ?auto_211886 - BLOCK
      ?auto_211887 - BLOCK
      ?auto_211888 - BLOCK
      ?auto_211889 - BLOCK
      ?auto_211890 - BLOCK
      ?auto_211891 - BLOCK
      ?auto_211892 - BLOCK
    )
    :vars
    (
      ?auto_211893 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_211892 ?auto_211893 ) ( ON-TABLE ?auto_211880 ) ( ON ?auto_211881 ?auto_211880 ) ( ON ?auto_211882 ?auto_211881 ) ( ON ?auto_211883 ?auto_211882 ) ( ON ?auto_211884 ?auto_211883 ) ( ON ?auto_211885 ?auto_211884 ) ( ON ?auto_211886 ?auto_211885 ) ( ON ?auto_211887 ?auto_211886 ) ( ON ?auto_211888 ?auto_211887 ) ( not ( = ?auto_211880 ?auto_211881 ) ) ( not ( = ?auto_211880 ?auto_211882 ) ) ( not ( = ?auto_211880 ?auto_211883 ) ) ( not ( = ?auto_211880 ?auto_211884 ) ) ( not ( = ?auto_211880 ?auto_211885 ) ) ( not ( = ?auto_211880 ?auto_211886 ) ) ( not ( = ?auto_211880 ?auto_211887 ) ) ( not ( = ?auto_211880 ?auto_211888 ) ) ( not ( = ?auto_211880 ?auto_211889 ) ) ( not ( = ?auto_211880 ?auto_211890 ) ) ( not ( = ?auto_211880 ?auto_211891 ) ) ( not ( = ?auto_211880 ?auto_211892 ) ) ( not ( = ?auto_211880 ?auto_211893 ) ) ( not ( = ?auto_211881 ?auto_211882 ) ) ( not ( = ?auto_211881 ?auto_211883 ) ) ( not ( = ?auto_211881 ?auto_211884 ) ) ( not ( = ?auto_211881 ?auto_211885 ) ) ( not ( = ?auto_211881 ?auto_211886 ) ) ( not ( = ?auto_211881 ?auto_211887 ) ) ( not ( = ?auto_211881 ?auto_211888 ) ) ( not ( = ?auto_211881 ?auto_211889 ) ) ( not ( = ?auto_211881 ?auto_211890 ) ) ( not ( = ?auto_211881 ?auto_211891 ) ) ( not ( = ?auto_211881 ?auto_211892 ) ) ( not ( = ?auto_211881 ?auto_211893 ) ) ( not ( = ?auto_211882 ?auto_211883 ) ) ( not ( = ?auto_211882 ?auto_211884 ) ) ( not ( = ?auto_211882 ?auto_211885 ) ) ( not ( = ?auto_211882 ?auto_211886 ) ) ( not ( = ?auto_211882 ?auto_211887 ) ) ( not ( = ?auto_211882 ?auto_211888 ) ) ( not ( = ?auto_211882 ?auto_211889 ) ) ( not ( = ?auto_211882 ?auto_211890 ) ) ( not ( = ?auto_211882 ?auto_211891 ) ) ( not ( = ?auto_211882 ?auto_211892 ) ) ( not ( = ?auto_211882 ?auto_211893 ) ) ( not ( = ?auto_211883 ?auto_211884 ) ) ( not ( = ?auto_211883 ?auto_211885 ) ) ( not ( = ?auto_211883 ?auto_211886 ) ) ( not ( = ?auto_211883 ?auto_211887 ) ) ( not ( = ?auto_211883 ?auto_211888 ) ) ( not ( = ?auto_211883 ?auto_211889 ) ) ( not ( = ?auto_211883 ?auto_211890 ) ) ( not ( = ?auto_211883 ?auto_211891 ) ) ( not ( = ?auto_211883 ?auto_211892 ) ) ( not ( = ?auto_211883 ?auto_211893 ) ) ( not ( = ?auto_211884 ?auto_211885 ) ) ( not ( = ?auto_211884 ?auto_211886 ) ) ( not ( = ?auto_211884 ?auto_211887 ) ) ( not ( = ?auto_211884 ?auto_211888 ) ) ( not ( = ?auto_211884 ?auto_211889 ) ) ( not ( = ?auto_211884 ?auto_211890 ) ) ( not ( = ?auto_211884 ?auto_211891 ) ) ( not ( = ?auto_211884 ?auto_211892 ) ) ( not ( = ?auto_211884 ?auto_211893 ) ) ( not ( = ?auto_211885 ?auto_211886 ) ) ( not ( = ?auto_211885 ?auto_211887 ) ) ( not ( = ?auto_211885 ?auto_211888 ) ) ( not ( = ?auto_211885 ?auto_211889 ) ) ( not ( = ?auto_211885 ?auto_211890 ) ) ( not ( = ?auto_211885 ?auto_211891 ) ) ( not ( = ?auto_211885 ?auto_211892 ) ) ( not ( = ?auto_211885 ?auto_211893 ) ) ( not ( = ?auto_211886 ?auto_211887 ) ) ( not ( = ?auto_211886 ?auto_211888 ) ) ( not ( = ?auto_211886 ?auto_211889 ) ) ( not ( = ?auto_211886 ?auto_211890 ) ) ( not ( = ?auto_211886 ?auto_211891 ) ) ( not ( = ?auto_211886 ?auto_211892 ) ) ( not ( = ?auto_211886 ?auto_211893 ) ) ( not ( = ?auto_211887 ?auto_211888 ) ) ( not ( = ?auto_211887 ?auto_211889 ) ) ( not ( = ?auto_211887 ?auto_211890 ) ) ( not ( = ?auto_211887 ?auto_211891 ) ) ( not ( = ?auto_211887 ?auto_211892 ) ) ( not ( = ?auto_211887 ?auto_211893 ) ) ( not ( = ?auto_211888 ?auto_211889 ) ) ( not ( = ?auto_211888 ?auto_211890 ) ) ( not ( = ?auto_211888 ?auto_211891 ) ) ( not ( = ?auto_211888 ?auto_211892 ) ) ( not ( = ?auto_211888 ?auto_211893 ) ) ( not ( = ?auto_211889 ?auto_211890 ) ) ( not ( = ?auto_211889 ?auto_211891 ) ) ( not ( = ?auto_211889 ?auto_211892 ) ) ( not ( = ?auto_211889 ?auto_211893 ) ) ( not ( = ?auto_211890 ?auto_211891 ) ) ( not ( = ?auto_211890 ?auto_211892 ) ) ( not ( = ?auto_211890 ?auto_211893 ) ) ( not ( = ?auto_211891 ?auto_211892 ) ) ( not ( = ?auto_211891 ?auto_211893 ) ) ( not ( = ?auto_211892 ?auto_211893 ) ) ( ON ?auto_211891 ?auto_211892 ) ( ON ?auto_211890 ?auto_211891 ) ( CLEAR ?auto_211888 ) ( ON ?auto_211889 ?auto_211890 ) ( CLEAR ?auto_211889 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_211880 ?auto_211881 ?auto_211882 ?auto_211883 ?auto_211884 ?auto_211885 ?auto_211886 ?auto_211887 ?auto_211888 ?auto_211889 )
      ( MAKE-13PILE ?auto_211880 ?auto_211881 ?auto_211882 ?auto_211883 ?auto_211884 ?auto_211885 ?auto_211886 ?auto_211887 ?auto_211888 ?auto_211889 ?auto_211890 ?auto_211891 ?auto_211892 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_211907 - BLOCK
      ?auto_211908 - BLOCK
      ?auto_211909 - BLOCK
      ?auto_211910 - BLOCK
      ?auto_211911 - BLOCK
      ?auto_211912 - BLOCK
      ?auto_211913 - BLOCK
      ?auto_211914 - BLOCK
      ?auto_211915 - BLOCK
      ?auto_211916 - BLOCK
      ?auto_211917 - BLOCK
      ?auto_211918 - BLOCK
      ?auto_211919 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_211919 ) ( ON-TABLE ?auto_211907 ) ( ON ?auto_211908 ?auto_211907 ) ( ON ?auto_211909 ?auto_211908 ) ( ON ?auto_211910 ?auto_211909 ) ( ON ?auto_211911 ?auto_211910 ) ( ON ?auto_211912 ?auto_211911 ) ( ON ?auto_211913 ?auto_211912 ) ( ON ?auto_211914 ?auto_211913 ) ( ON ?auto_211915 ?auto_211914 ) ( not ( = ?auto_211907 ?auto_211908 ) ) ( not ( = ?auto_211907 ?auto_211909 ) ) ( not ( = ?auto_211907 ?auto_211910 ) ) ( not ( = ?auto_211907 ?auto_211911 ) ) ( not ( = ?auto_211907 ?auto_211912 ) ) ( not ( = ?auto_211907 ?auto_211913 ) ) ( not ( = ?auto_211907 ?auto_211914 ) ) ( not ( = ?auto_211907 ?auto_211915 ) ) ( not ( = ?auto_211907 ?auto_211916 ) ) ( not ( = ?auto_211907 ?auto_211917 ) ) ( not ( = ?auto_211907 ?auto_211918 ) ) ( not ( = ?auto_211907 ?auto_211919 ) ) ( not ( = ?auto_211908 ?auto_211909 ) ) ( not ( = ?auto_211908 ?auto_211910 ) ) ( not ( = ?auto_211908 ?auto_211911 ) ) ( not ( = ?auto_211908 ?auto_211912 ) ) ( not ( = ?auto_211908 ?auto_211913 ) ) ( not ( = ?auto_211908 ?auto_211914 ) ) ( not ( = ?auto_211908 ?auto_211915 ) ) ( not ( = ?auto_211908 ?auto_211916 ) ) ( not ( = ?auto_211908 ?auto_211917 ) ) ( not ( = ?auto_211908 ?auto_211918 ) ) ( not ( = ?auto_211908 ?auto_211919 ) ) ( not ( = ?auto_211909 ?auto_211910 ) ) ( not ( = ?auto_211909 ?auto_211911 ) ) ( not ( = ?auto_211909 ?auto_211912 ) ) ( not ( = ?auto_211909 ?auto_211913 ) ) ( not ( = ?auto_211909 ?auto_211914 ) ) ( not ( = ?auto_211909 ?auto_211915 ) ) ( not ( = ?auto_211909 ?auto_211916 ) ) ( not ( = ?auto_211909 ?auto_211917 ) ) ( not ( = ?auto_211909 ?auto_211918 ) ) ( not ( = ?auto_211909 ?auto_211919 ) ) ( not ( = ?auto_211910 ?auto_211911 ) ) ( not ( = ?auto_211910 ?auto_211912 ) ) ( not ( = ?auto_211910 ?auto_211913 ) ) ( not ( = ?auto_211910 ?auto_211914 ) ) ( not ( = ?auto_211910 ?auto_211915 ) ) ( not ( = ?auto_211910 ?auto_211916 ) ) ( not ( = ?auto_211910 ?auto_211917 ) ) ( not ( = ?auto_211910 ?auto_211918 ) ) ( not ( = ?auto_211910 ?auto_211919 ) ) ( not ( = ?auto_211911 ?auto_211912 ) ) ( not ( = ?auto_211911 ?auto_211913 ) ) ( not ( = ?auto_211911 ?auto_211914 ) ) ( not ( = ?auto_211911 ?auto_211915 ) ) ( not ( = ?auto_211911 ?auto_211916 ) ) ( not ( = ?auto_211911 ?auto_211917 ) ) ( not ( = ?auto_211911 ?auto_211918 ) ) ( not ( = ?auto_211911 ?auto_211919 ) ) ( not ( = ?auto_211912 ?auto_211913 ) ) ( not ( = ?auto_211912 ?auto_211914 ) ) ( not ( = ?auto_211912 ?auto_211915 ) ) ( not ( = ?auto_211912 ?auto_211916 ) ) ( not ( = ?auto_211912 ?auto_211917 ) ) ( not ( = ?auto_211912 ?auto_211918 ) ) ( not ( = ?auto_211912 ?auto_211919 ) ) ( not ( = ?auto_211913 ?auto_211914 ) ) ( not ( = ?auto_211913 ?auto_211915 ) ) ( not ( = ?auto_211913 ?auto_211916 ) ) ( not ( = ?auto_211913 ?auto_211917 ) ) ( not ( = ?auto_211913 ?auto_211918 ) ) ( not ( = ?auto_211913 ?auto_211919 ) ) ( not ( = ?auto_211914 ?auto_211915 ) ) ( not ( = ?auto_211914 ?auto_211916 ) ) ( not ( = ?auto_211914 ?auto_211917 ) ) ( not ( = ?auto_211914 ?auto_211918 ) ) ( not ( = ?auto_211914 ?auto_211919 ) ) ( not ( = ?auto_211915 ?auto_211916 ) ) ( not ( = ?auto_211915 ?auto_211917 ) ) ( not ( = ?auto_211915 ?auto_211918 ) ) ( not ( = ?auto_211915 ?auto_211919 ) ) ( not ( = ?auto_211916 ?auto_211917 ) ) ( not ( = ?auto_211916 ?auto_211918 ) ) ( not ( = ?auto_211916 ?auto_211919 ) ) ( not ( = ?auto_211917 ?auto_211918 ) ) ( not ( = ?auto_211917 ?auto_211919 ) ) ( not ( = ?auto_211918 ?auto_211919 ) ) ( ON ?auto_211918 ?auto_211919 ) ( ON ?auto_211917 ?auto_211918 ) ( CLEAR ?auto_211915 ) ( ON ?auto_211916 ?auto_211917 ) ( CLEAR ?auto_211916 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_211907 ?auto_211908 ?auto_211909 ?auto_211910 ?auto_211911 ?auto_211912 ?auto_211913 ?auto_211914 ?auto_211915 ?auto_211916 )
      ( MAKE-13PILE ?auto_211907 ?auto_211908 ?auto_211909 ?auto_211910 ?auto_211911 ?auto_211912 ?auto_211913 ?auto_211914 ?auto_211915 ?auto_211916 ?auto_211917 ?auto_211918 ?auto_211919 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_211933 - BLOCK
      ?auto_211934 - BLOCK
      ?auto_211935 - BLOCK
      ?auto_211936 - BLOCK
      ?auto_211937 - BLOCK
      ?auto_211938 - BLOCK
      ?auto_211939 - BLOCK
      ?auto_211940 - BLOCK
      ?auto_211941 - BLOCK
      ?auto_211942 - BLOCK
      ?auto_211943 - BLOCK
      ?auto_211944 - BLOCK
      ?auto_211945 - BLOCK
    )
    :vars
    (
      ?auto_211946 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_211945 ?auto_211946 ) ( ON-TABLE ?auto_211933 ) ( ON ?auto_211934 ?auto_211933 ) ( ON ?auto_211935 ?auto_211934 ) ( ON ?auto_211936 ?auto_211935 ) ( ON ?auto_211937 ?auto_211936 ) ( ON ?auto_211938 ?auto_211937 ) ( ON ?auto_211939 ?auto_211938 ) ( ON ?auto_211940 ?auto_211939 ) ( not ( = ?auto_211933 ?auto_211934 ) ) ( not ( = ?auto_211933 ?auto_211935 ) ) ( not ( = ?auto_211933 ?auto_211936 ) ) ( not ( = ?auto_211933 ?auto_211937 ) ) ( not ( = ?auto_211933 ?auto_211938 ) ) ( not ( = ?auto_211933 ?auto_211939 ) ) ( not ( = ?auto_211933 ?auto_211940 ) ) ( not ( = ?auto_211933 ?auto_211941 ) ) ( not ( = ?auto_211933 ?auto_211942 ) ) ( not ( = ?auto_211933 ?auto_211943 ) ) ( not ( = ?auto_211933 ?auto_211944 ) ) ( not ( = ?auto_211933 ?auto_211945 ) ) ( not ( = ?auto_211933 ?auto_211946 ) ) ( not ( = ?auto_211934 ?auto_211935 ) ) ( not ( = ?auto_211934 ?auto_211936 ) ) ( not ( = ?auto_211934 ?auto_211937 ) ) ( not ( = ?auto_211934 ?auto_211938 ) ) ( not ( = ?auto_211934 ?auto_211939 ) ) ( not ( = ?auto_211934 ?auto_211940 ) ) ( not ( = ?auto_211934 ?auto_211941 ) ) ( not ( = ?auto_211934 ?auto_211942 ) ) ( not ( = ?auto_211934 ?auto_211943 ) ) ( not ( = ?auto_211934 ?auto_211944 ) ) ( not ( = ?auto_211934 ?auto_211945 ) ) ( not ( = ?auto_211934 ?auto_211946 ) ) ( not ( = ?auto_211935 ?auto_211936 ) ) ( not ( = ?auto_211935 ?auto_211937 ) ) ( not ( = ?auto_211935 ?auto_211938 ) ) ( not ( = ?auto_211935 ?auto_211939 ) ) ( not ( = ?auto_211935 ?auto_211940 ) ) ( not ( = ?auto_211935 ?auto_211941 ) ) ( not ( = ?auto_211935 ?auto_211942 ) ) ( not ( = ?auto_211935 ?auto_211943 ) ) ( not ( = ?auto_211935 ?auto_211944 ) ) ( not ( = ?auto_211935 ?auto_211945 ) ) ( not ( = ?auto_211935 ?auto_211946 ) ) ( not ( = ?auto_211936 ?auto_211937 ) ) ( not ( = ?auto_211936 ?auto_211938 ) ) ( not ( = ?auto_211936 ?auto_211939 ) ) ( not ( = ?auto_211936 ?auto_211940 ) ) ( not ( = ?auto_211936 ?auto_211941 ) ) ( not ( = ?auto_211936 ?auto_211942 ) ) ( not ( = ?auto_211936 ?auto_211943 ) ) ( not ( = ?auto_211936 ?auto_211944 ) ) ( not ( = ?auto_211936 ?auto_211945 ) ) ( not ( = ?auto_211936 ?auto_211946 ) ) ( not ( = ?auto_211937 ?auto_211938 ) ) ( not ( = ?auto_211937 ?auto_211939 ) ) ( not ( = ?auto_211937 ?auto_211940 ) ) ( not ( = ?auto_211937 ?auto_211941 ) ) ( not ( = ?auto_211937 ?auto_211942 ) ) ( not ( = ?auto_211937 ?auto_211943 ) ) ( not ( = ?auto_211937 ?auto_211944 ) ) ( not ( = ?auto_211937 ?auto_211945 ) ) ( not ( = ?auto_211937 ?auto_211946 ) ) ( not ( = ?auto_211938 ?auto_211939 ) ) ( not ( = ?auto_211938 ?auto_211940 ) ) ( not ( = ?auto_211938 ?auto_211941 ) ) ( not ( = ?auto_211938 ?auto_211942 ) ) ( not ( = ?auto_211938 ?auto_211943 ) ) ( not ( = ?auto_211938 ?auto_211944 ) ) ( not ( = ?auto_211938 ?auto_211945 ) ) ( not ( = ?auto_211938 ?auto_211946 ) ) ( not ( = ?auto_211939 ?auto_211940 ) ) ( not ( = ?auto_211939 ?auto_211941 ) ) ( not ( = ?auto_211939 ?auto_211942 ) ) ( not ( = ?auto_211939 ?auto_211943 ) ) ( not ( = ?auto_211939 ?auto_211944 ) ) ( not ( = ?auto_211939 ?auto_211945 ) ) ( not ( = ?auto_211939 ?auto_211946 ) ) ( not ( = ?auto_211940 ?auto_211941 ) ) ( not ( = ?auto_211940 ?auto_211942 ) ) ( not ( = ?auto_211940 ?auto_211943 ) ) ( not ( = ?auto_211940 ?auto_211944 ) ) ( not ( = ?auto_211940 ?auto_211945 ) ) ( not ( = ?auto_211940 ?auto_211946 ) ) ( not ( = ?auto_211941 ?auto_211942 ) ) ( not ( = ?auto_211941 ?auto_211943 ) ) ( not ( = ?auto_211941 ?auto_211944 ) ) ( not ( = ?auto_211941 ?auto_211945 ) ) ( not ( = ?auto_211941 ?auto_211946 ) ) ( not ( = ?auto_211942 ?auto_211943 ) ) ( not ( = ?auto_211942 ?auto_211944 ) ) ( not ( = ?auto_211942 ?auto_211945 ) ) ( not ( = ?auto_211942 ?auto_211946 ) ) ( not ( = ?auto_211943 ?auto_211944 ) ) ( not ( = ?auto_211943 ?auto_211945 ) ) ( not ( = ?auto_211943 ?auto_211946 ) ) ( not ( = ?auto_211944 ?auto_211945 ) ) ( not ( = ?auto_211944 ?auto_211946 ) ) ( not ( = ?auto_211945 ?auto_211946 ) ) ( ON ?auto_211944 ?auto_211945 ) ( ON ?auto_211943 ?auto_211944 ) ( ON ?auto_211942 ?auto_211943 ) ( CLEAR ?auto_211940 ) ( ON ?auto_211941 ?auto_211942 ) ( CLEAR ?auto_211941 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_211933 ?auto_211934 ?auto_211935 ?auto_211936 ?auto_211937 ?auto_211938 ?auto_211939 ?auto_211940 ?auto_211941 )
      ( MAKE-13PILE ?auto_211933 ?auto_211934 ?auto_211935 ?auto_211936 ?auto_211937 ?auto_211938 ?auto_211939 ?auto_211940 ?auto_211941 ?auto_211942 ?auto_211943 ?auto_211944 ?auto_211945 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_211960 - BLOCK
      ?auto_211961 - BLOCK
      ?auto_211962 - BLOCK
      ?auto_211963 - BLOCK
      ?auto_211964 - BLOCK
      ?auto_211965 - BLOCK
      ?auto_211966 - BLOCK
      ?auto_211967 - BLOCK
      ?auto_211968 - BLOCK
      ?auto_211969 - BLOCK
      ?auto_211970 - BLOCK
      ?auto_211971 - BLOCK
      ?auto_211972 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_211972 ) ( ON-TABLE ?auto_211960 ) ( ON ?auto_211961 ?auto_211960 ) ( ON ?auto_211962 ?auto_211961 ) ( ON ?auto_211963 ?auto_211962 ) ( ON ?auto_211964 ?auto_211963 ) ( ON ?auto_211965 ?auto_211964 ) ( ON ?auto_211966 ?auto_211965 ) ( ON ?auto_211967 ?auto_211966 ) ( not ( = ?auto_211960 ?auto_211961 ) ) ( not ( = ?auto_211960 ?auto_211962 ) ) ( not ( = ?auto_211960 ?auto_211963 ) ) ( not ( = ?auto_211960 ?auto_211964 ) ) ( not ( = ?auto_211960 ?auto_211965 ) ) ( not ( = ?auto_211960 ?auto_211966 ) ) ( not ( = ?auto_211960 ?auto_211967 ) ) ( not ( = ?auto_211960 ?auto_211968 ) ) ( not ( = ?auto_211960 ?auto_211969 ) ) ( not ( = ?auto_211960 ?auto_211970 ) ) ( not ( = ?auto_211960 ?auto_211971 ) ) ( not ( = ?auto_211960 ?auto_211972 ) ) ( not ( = ?auto_211961 ?auto_211962 ) ) ( not ( = ?auto_211961 ?auto_211963 ) ) ( not ( = ?auto_211961 ?auto_211964 ) ) ( not ( = ?auto_211961 ?auto_211965 ) ) ( not ( = ?auto_211961 ?auto_211966 ) ) ( not ( = ?auto_211961 ?auto_211967 ) ) ( not ( = ?auto_211961 ?auto_211968 ) ) ( not ( = ?auto_211961 ?auto_211969 ) ) ( not ( = ?auto_211961 ?auto_211970 ) ) ( not ( = ?auto_211961 ?auto_211971 ) ) ( not ( = ?auto_211961 ?auto_211972 ) ) ( not ( = ?auto_211962 ?auto_211963 ) ) ( not ( = ?auto_211962 ?auto_211964 ) ) ( not ( = ?auto_211962 ?auto_211965 ) ) ( not ( = ?auto_211962 ?auto_211966 ) ) ( not ( = ?auto_211962 ?auto_211967 ) ) ( not ( = ?auto_211962 ?auto_211968 ) ) ( not ( = ?auto_211962 ?auto_211969 ) ) ( not ( = ?auto_211962 ?auto_211970 ) ) ( not ( = ?auto_211962 ?auto_211971 ) ) ( not ( = ?auto_211962 ?auto_211972 ) ) ( not ( = ?auto_211963 ?auto_211964 ) ) ( not ( = ?auto_211963 ?auto_211965 ) ) ( not ( = ?auto_211963 ?auto_211966 ) ) ( not ( = ?auto_211963 ?auto_211967 ) ) ( not ( = ?auto_211963 ?auto_211968 ) ) ( not ( = ?auto_211963 ?auto_211969 ) ) ( not ( = ?auto_211963 ?auto_211970 ) ) ( not ( = ?auto_211963 ?auto_211971 ) ) ( not ( = ?auto_211963 ?auto_211972 ) ) ( not ( = ?auto_211964 ?auto_211965 ) ) ( not ( = ?auto_211964 ?auto_211966 ) ) ( not ( = ?auto_211964 ?auto_211967 ) ) ( not ( = ?auto_211964 ?auto_211968 ) ) ( not ( = ?auto_211964 ?auto_211969 ) ) ( not ( = ?auto_211964 ?auto_211970 ) ) ( not ( = ?auto_211964 ?auto_211971 ) ) ( not ( = ?auto_211964 ?auto_211972 ) ) ( not ( = ?auto_211965 ?auto_211966 ) ) ( not ( = ?auto_211965 ?auto_211967 ) ) ( not ( = ?auto_211965 ?auto_211968 ) ) ( not ( = ?auto_211965 ?auto_211969 ) ) ( not ( = ?auto_211965 ?auto_211970 ) ) ( not ( = ?auto_211965 ?auto_211971 ) ) ( not ( = ?auto_211965 ?auto_211972 ) ) ( not ( = ?auto_211966 ?auto_211967 ) ) ( not ( = ?auto_211966 ?auto_211968 ) ) ( not ( = ?auto_211966 ?auto_211969 ) ) ( not ( = ?auto_211966 ?auto_211970 ) ) ( not ( = ?auto_211966 ?auto_211971 ) ) ( not ( = ?auto_211966 ?auto_211972 ) ) ( not ( = ?auto_211967 ?auto_211968 ) ) ( not ( = ?auto_211967 ?auto_211969 ) ) ( not ( = ?auto_211967 ?auto_211970 ) ) ( not ( = ?auto_211967 ?auto_211971 ) ) ( not ( = ?auto_211967 ?auto_211972 ) ) ( not ( = ?auto_211968 ?auto_211969 ) ) ( not ( = ?auto_211968 ?auto_211970 ) ) ( not ( = ?auto_211968 ?auto_211971 ) ) ( not ( = ?auto_211968 ?auto_211972 ) ) ( not ( = ?auto_211969 ?auto_211970 ) ) ( not ( = ?auto_211969 ?auto_211971 ) ) ( not ( = ?auto_211969 ?auto_211972 ) ) ( not ( = ?auto_211970 ?auto_211971 ) ) ( not ( = ?auto_211970 ?auto_211972 ) ) ( not ( = ?auto_211971 ?auto_211972 ) ) ( ON ?auto_211971 ?auto_211972 ) ( ON ?auto_211970 ?auto_211971 ) ( ON ?auto_211969 ?auto_211970 ) ( CLEAR ?auto_211967 ) ( ON ?auto_211968 ?auto_211969 ) ( CLEAR ?auto_211968 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_211960 ?auto_211961 ?auto_211962 ?auto_211963 ?auto_211964 ?auto_211965 ?auto_211966 ?auto_211967 ?auto_211968 )
      ( MAKE-13PILE ?auto_211960 ?auto_211961 ?auto_211962 ?auto_211963 ?auto_211964 ?auto_211965 ?auto_211966 ?auto_211967 ?auto_211968 ?auto_211969 ?auto_211970 ?auto_211971 ?auto_211972 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_211986 - BLOCK
      ?auto_211987 - BLOCK
      ?auto_211988 - BLOCK
      ?auto_211989 - BLOCK
      ?auto_211990 - BLOCK
      ?auto_211991 - BLOCK
      ?auto_211992 - BLOCK
      ?auto_211993 - BLOCK
      ?auto_211994 - BLOCK
      ?auto_211995 - BLOCK
      ?auto_211996 - BLOCK
      ?auto_211997 - BLOCK
      ?auto_211998 - BLOCK
    )
    :vars
    (
      ?auto_211999 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_211998 ?auto_211999 ) ( ON-TABLE ?auto_211986 ) ( ON ?auto_211987 ?auto_211986 ) ( ON ?auto_211988 ?auto_211987 ) ( ON ?auto_211989 ?auto_211988 ) ( ON ?auto_211990 ?auto_211989 ) ( ON ?auto_211991 ?auto_211990 ) ( ON ?auto_211992 ?auto_211991 ) ( not ( = ?auto_211986 ?auto_211987 ) ) ( not ( = ?auto_211986 ?auto_211988 ) ) ( not ( = ?auto_211986 ?auto_211989 ) ) ( not ( = ?auto_211986 ?auto_211990 ) ) ( not ( = ?auto_211986 ?auto_211991 ) ) ( not ( = ?auto_211986 ?auto_211992 ) ) ( not ( = ?auto_211986 ?auto_211993 ) ) ( not ( = ?auto_211986 ?auto_211994 ) ) ( not ( = ?auto_211986 ?auto_211995 ) ) ( not ( = ?auto_211986 ?auto_211996 ) ) ( not ( = ?auto_211986 ?auto_211997 ) ) ( not ( = ?auto_211986 ?auto_211998 ) ) ( not ( = ?auto_211986 ?auto_211999 ) ) ( not ( = ?auto_211987 ?auto_211988 ) ) ( not ( = ?auto_211987 ?auto_211989 ) ) ( not ( = ?auto_211987 ?auto_211990 ) ) ( not ( = ?auto_211987 ?auto_211991 ) ) ( not ( = ?auto_211987 ?auto_211992 ) ) ( not ( = ?auto_211987 ?auto_211993 ) ) ( not ( = ?auto_211987 ?auto_211994 ) ) ( not ( = ?auto_211987 ?auto_211995 ) ) ( not ( = ?auto_211987 ?auto_211996 ) ) ( not ( = ?auto_211987 ?auto_211997 ) ) ( not ( = ?auto_211987 ?auto_211998 ) ) ( not ( = ?auto_211987 ?auto_211999 ) ) ( not ( = ?auto_211988 ?auto_211989 ) ) ( not ( = ?auto_211988 ?auto_211990 ) ) ( not ( = ?auto_211988 ?auto_211991 ) ) ( not ( = ?auto_211988 ?auto_211992 ) ) ( not ( = ?auto_211988 ?auto_211993 ) ) ( not ( = ?auto_211988 ?auto_211994 ) ) ( not ( = ?auto_211988 ?auto_211995 ) ) ( not ( = ?auto_211988 ?auto_211996 ) ) ( not ( = ?auto_211988 ?auto_211997 ) ) ( not ( = ?auto_211988 ?auto_211998 ) ) ( not ( = ?auto_211988 ?auto_211999 ) ) ( not ( = ?auto_211989 ?auto_211990 ) ) ( not ( = ?auto_211989 ?auto_211991 ) ) ( not ( = ?auto_211989 ?auto_211992 ) ) ( not ( = ?auto_211989 ?auto_211993 ) ) ( not ( = ?auto_211989 ?auto_211994 ) ) ( not ( = ?auto_211989 ?auto_211995 ) ) ( not ( = ?auto_211989 ?auto_211996 ) ) ( not ( = ?auto_211989 ?auto_211997 ) ) ( not ( = ?auto_211989 ?auto_211998 ) ) ( not ( = ?auto_211989 ?auto_211999 ) ) ( not ( = ?auto_211990 ?auto_211991 ) ) ( not ( = ?auto_211990 ?auto_211992 ) ) ( not ( = ?auto_211990 ?auto_211993 ) ) ( not ( = ?auto_211990 ?auto_211994 ) ) ( not ( = ?auto_211990 ?auto_211995 ) ) ( not ( = ?auto_211990 ?auto_211996 ) ) ( not ( = ?auto_211990 ?auto_211997 ) ) ( not ( = ?auto_211990 ?auto_211998 ) ) ( not ( = ?auto_211990 ?auto_211999 ) ) ( not ( = ?auto_211991 ?auto_211992 ) ) ( not ( = ?auto_211991 ?auto_211993 ) ) ( not ( = ?auto_211991 ?auto_211994 ) ) ( not ( = ?auto_211991 ?auto_211995 ) ) ( not ( = ?auto_211991 ?auto_211996 ) ) ( not ( = ?auto_211991 ?auto_211997 ) ) ( not ( = ?auto_211991 ?auto_211998 ) ) ( not ( = ?auto_211991 ?auto_211999 ) ) ( not ( = ?auto_211992 ?auto_211993 ) ) ( not ( = ?auto_211992 ?auto_211994 ) ) ( not ( = ?auto_211992 ?auto_211995 ) ) ( not ( = ?auto_211992 ?auto_211996 ) ) ( not ( = ?auto_211992 ?auto_211997 ) ) ( not ( = ?auto_211992 ?auto_211998 ) ) ( not ( = ?auto_211992 ?auto_211999 ) ) ( not ( = ?auto_211993 ?auto_211994 ) ) ( not ( = ?auto_211993 ?auto_211995 ) ) ( not ( = ?auto_211993 ?auto_211996 ) ) ( not ( = ?auto_211993 ?auto_211997 ) ) ( not ( = ?auto_211993 ?auto_211998 ) ) ( not ( = ?auto_211993 ?auto_211999 ) ) ( not ( = ?auto_211994 ?auto_211995 ) ) ( not ( = ?auto_211994 ?auto_211996 ) ) ( not ( = ?auto_211994 ?auto_211997 ) ) ( not ( = ?auto_211994 ?auto_211998 ) ) ( not ( = ?auto_211994 ?auto_211999 ) ) ( not ( = ?auto_211995 ?auto_211996 ) ) ( not ( = ?auto_211995 ?auto_211997 ) ) ( not ( = ?auto_211995 ?auto_211998 ) ) ( not ( = ?auto_211995 ?auto_211999 ) ) ( not ( = ?auto_211996 ?auto_211997 ) ) ( not ( = ?auto_211996 ?auto_211998 ) ) ( not ( = ?auto_211996 ?auto_211999 ) ) ( not ( = ?auto_211997 ?auto_211998 ) ) ( not ( = ?auto_211997 ?auto_211999 ) ) ( not ( = ?auto_211998 ?auto_211999 ) ) ( ON ?auto_211997 ?auto_211998 ) ( ON ?auto_211996 ?auto_211997 ) ( ON ?auto_211995 ?auto_211996 ) ( ON ?auto_211994 ?auto_211995 ) ( CLEAR ?auto_211992 ) ( ON ?auto_211993 ?auto_211994 ) ( CLEAR ?auto_211993 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_211986 ?auto_211987 ?auto_211988 ?auto_211989 ?auto_211990 ?auto_211991 ?auto_211992 ?auto_211993 )
      ( MAKE-13PILE ?auto_211986 ?auto_211987 ?auto_211988 ?auto_211989 ?auto_211990 ?auto_211991 ?auto_211992 ?auto_211993 ?auto_211994 ?auto_211995 ?auto_211996 ?auto_211997 ?auto_211998 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_212013 - BLOCK
      ?auto_212014 - BLOCK
      ?auto_212015 - BLOCK
      ?auto_212016 - BLOCK
      ?auto_212017 - BLOCK
      ?auto_212018 - BLOCK
      ?auto_212019 - BLOCK
      ?auto_212020 - BLOCK
      ?auto_212021 - BLOCK
      ?auto_212022 - BLOCK
      ?auto_212023 - BLOCK
      ?auto_212024 - BLOCK
      ?auto_212025 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_212025 ) ( ON-TABLE ?auto_212013 ) ( ON ?auto_212014 ?auto_212013 ) ( ON ?auto_212015 ?auto_212014 ) ( ON ?auto_212016 ?auto_212015 ) ( ON ?auto_212017 ?auto_212016 ) ( ON ?auto_212018 ?auto_212017 ) ( ON ?auto_212019 ?auto_212018 ) ( not ( = ?auto_212013 ?auto_212014 ) ) ( not ( = ?auto_212013 ?auto_212015 ) ) ( not ( = ?auto_212013 ?auto_212016 ) ) ( not ( = ?auto_212013 ?auto_212017 ) ) ( not ( = ?auto_212013 ?auto_212018 ) ) ( not ( = ?auto_212013 ?auto_212019 ) ) ( not ( = ?auto_212013 ?auto_212020 ) ) ( not ( = ?auto_212013 ?auto_212021 ) ) ( not ( = ?auto_212013 ?auto_212022 ) ) ( not ( = ?auto_212013 ?auto_212023 ) ) ( not ( = ?auto_212013 ?auto_212024 ) ) ( not ( = ?auto_212013 ?auto_212025 ) ) ( not ( = ?auto_212014 ?auto_212015 ) ) ( not ( = ?auto_212014 ?auto_212016 ) ) ( not ( = ?auto_212014 ?auto_212017 ) ) ( not ( = ?auto_212014 ?auto_212018 ) ) ( not ( = ?auto_212014 ?auto_212019 ) ) ( not ( = ?auto_212014 ?auto_212020 ) ) ( not ( = ?auto_212014 ?auto_212021 ) ) ( not ( = ?auto_212014 ?auto_212022 ) ) ( not ( = ?auto_212014 ?auto_212023 ) ) ( not ( = ?auto_212014 ?auto_212024 ) ) ( not ( = ?auto_212014 ?auto_212025 ) ) ( not ( = ?auto_212015 ?auto_212016 ) ) ( not ( = ?auto_212015 ?auto_212017 ) ) ( not ( = ?auto_212015 ?auto_212018 ) ) ( not ( = ?auto_212015 ?auto_212019 ) ) ( not ( = ?auto_212015 ?auto_212020 ) ) ( not ( = ?auto_212015 ?auto_212021 ) ) ( not ( = ?auto_212015 ?auto_212022 ) ) ( not ( = ?auto_212015 ?auto_212023 ) ) ( not ( = ?auto_212015 ?auto_212024 ) ) ( not ( = ?auto_212015 ?auto_212025 ) ) ( not ( = ?auto_212016 ?auto_212017 ) ) ( not ( = ?auto_212016 ?auto_212018 ) ) ( not ( = ?auto_212016 ?auto_212019 ) ) ( not ( = ?auto_212016 ?auto_212020 ) ) ( not ( = ?auto_212016 ?auto_212021 ) ) ( not ( = ?auto_212016 ?auto_212022 ) ) ( not ( = ?auto_212016 ?auto_212023 ) ) ( not ( = ?auto_212016 ?auto_212024 ) ) ( not ( = ?auto_212016 ?auto_212025 ) ) ( not ( = ?auto_212017 ?auto_212018 ) ) ( not ( = ?auto_212017 ?auto_212019 ) ) ( not ( = ?auto_212017 ?auto_212020 ) ) ( not ( = ?auto_212017 ?auto_212021 ) ) ( not ( = ?auto_212017 ?auto_212022 ) ) ( not ( = ?auto_212017 ?auto_212023 ) ) ( not ( = ?auto_212017 ?auto_212024 ) ) ( not ( = ?auto_212017 ?auto_212025 ) ) ( not ( = ?auto_212018 ?auto_212019 ) ) ( not ( = ?auto_212018 ?auto_212020 ) ) ( not ( = ?auto_212018 ?auto_212021 ) ) ( not ( = ?auto_212018 ?auto_212022 ) ) ( not ( = ?auto_212018 ?auto_212023 ) ) ( not ( = ?auto_212018 ?auto_212024 ) ) ( not ( = ?auto_212018 ?auto_212025 ) ) ( not ( = ?auto_212019 ?auto_212020 ) ) ( not ( = ?auto_212019 ?auto_212021 ) ) ( not ( = ?auto_212019 ?auto_212022 ) ) ( not ( = ?auto_212019 ?auto_212023 ) ) ( not ( = ?auto_212019 ?auto_212024 ) ) ( not ( = ?auto_212019 ?auto_212025 ) ) ( not ( = ?auto_212020 ?auto_212021 ) ) ( not ( = ?auto_212020 ?auto_212022 ) ) ( not ( = ?auto_212020 ?auto_212023 ) ) ( not ( = ?auto_212020 ?auto_212024 ) ) ( not ( = ?auto_212020 ?auto_212025 ) ) ( not ( = ?auto_212021 ?auto_212022 ) ) ( not ( = ?auto_212021 ?auto_212023 ) ) ( not ( = ?auto_212021 ?auto_212024 ) ) ( not ( = ?auto_212021 ?auto_212025 ) ) ( not ( = ?auto_212022 ?auto_212023 ) ) ( not ( = ?auto_212022 ?auto_212024 ) ) ( not ( = ?auto_212022 ?auto_212025 ) ) ( not ( = ?auto_212023 ?auto_212024 ) ) ( not ( = ?auto_212023 ?auto_212025 ) ) ( not ( = ?auto_212024 ?auto_212025 ) ) ( ON ?auto_212024 ?auto_212025 ) ( ON ?auto_212023 ?auto_212024 ) ( ON ?auto_212022 ?auto_212023 ) ( ON ?auto_212021 ?auto_212022 ) ( CLEAR ?auto_212019 ) ( ON ?auto_212020 ?auto_212021 ) ( CLEAR ?auto_212020 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_212013 ?auto_212014 ?auto_212015 ?auto_212016 ?auto_212017 ?auto_212018 ?auto_212019 ?auto_212020 )
      ( MAKE-13PILE ?auto_212013 ?auto_212014 ?auto_212015 ?auto_212016 ?auto_212017 ?auto_212018 ?auto_212019 ?auto_212020 ?auto_212021 ?auto_212022 ?auto_212023 ?auto_212024 ?auto_212025 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_212039 - BLOCK
      ?auto_212040 - BLOCK
      ?auto_212041 - BLOCK
      ?auto_212042 - BLOCK
      ?auto_212043 - BLOCK
      ?auto_212044 - BLOCK
      ?auto_212045 - BLOCK
      ?auto_212046 - BLOCK
      ?auto_212047 - BLOCK
      ?auto_212048 - BLOCK
      ?auto_212049 - BLOCK
      ?auto_212050 - BLOCK
      ?auto_212051 - BLOCK
    )
    :vars
    (
      ?auto_212052 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_212051 ?auto_212052 ) ( ON-TABLE ?auto_212039 ) ( ON ?auto_212040 ?auto_212039 ) ( ON ?auto_212041 ?auto_212040 ) ( ON ?auto_212042 ?auto_212041 ) ( ON ?auto_212043 ?auto_212042 ) ( ON ?auto_212044 ?auto_212043 ) ( not ( = ?auto_212039 ?auto_212040 ) ) ( not ( = ?auto_212039 ?auto_212041 ) ) ( not ( = ?auto_212039 ?auto_212042 ) ) ( not ( = ?auto_212039 ?auto_212043 ) ) ( not ( = ?auto_212039 ?auto_212044 ) ) ( not ( = ?auto_212039 ?auto_212045 ) ) ( not ( = ?auto_212039 ?auto_212046 ) ) ( not ( = ?auto_212039 ?auto_212047 ) ) ( not ( = ?auto_212039 ?auto_212048 ) ) ( not ( = ?auto_212039 ?auto_212049 ) ) ( not ( = ?auto_212039 ?auto_212050 ) ) ( not ( = ?auto_212039 ?auto_212051 ) ) ( not ( = ?auto_212039 ?auto_212052 ) ) ( not ( = ?auto_212040 ?auto_212041 ) ) ( not ( = ?auto_212040 ?auto_212042 ) ) ( not ( = ?auto_212040 ?auto_212043 ) ) ( not ( = ?auto_212040 ?auto_212044 ) ) ( not ( = ?auto_212040 ?auto_212045 ) ) ( not ( = ?auto_212040 ?auto_212046 ) ) ( not ( = ?auto_212040 ?auto_212047 ) ) ( not ( = ?auto_212040 ?auto_212048 ) ) ( not ( = ?auto_212040 ?auto_212049 ) ) ( not ( = ?auto_212040 ?auto_212050 ) ) ( not ( = ?auto_212040 ?auto_212051 ) ) ( not ( = ?auto_212040 ?auto_212052 ) ) ( not ( = ?auto_212041 ?auto_212042 ) ) ( not ( = ?auto_212041 ?auto_212043 ) ) ( not ( = ?auto_212041 ?auto_212044 ) ) ( not ( = ?auto_212041 ?auto_212045 ) ) ( not ( = ?auto_212041 ?auto_212046 ) ) ( not ( = ?auto_212041 ?auto_212047 ) ) ( not ( = ?auto_212041 ?auto_212048 ) ) ( not ( = ?auto_212041 ?auto_212049 ) ) ( not ( = ?auto_212041 ?auto_212050 ) ) ( not ( = ?auto_212041 ?auto_212051 ) ) ( not ( = ?auto_212041 ?auto_212052 ) ) ( not ( = ?auto_212042 ?auto_212043 ) ) ( not ( = ?auto_212042 ?auto_212044 ) ) ( not ( = ?auto_212042 ?auto_212045 ) ) ( not ( = ?auto_212042 ?auto_212046 ) ) ( not ( = ?auto_212042 ?auto_212047 ) ) ( not ( = ?auto_212042 ?auto_212048 ) ) ( not ( = ?auto_212042 ?auto_212049 ) ) ( not ( = ?auto_212042 ?auto_212050 ) ) ( not ( = ?auto_212042 ?auto_212051 ) ) ( not ( = ?auto_212042 ?auto_212052 ) ) ( not ( = ?auto_212043 ?auto_212044 ) ) ( not ( = ?auto_212043 ?auto_212045 ) ) ( not ( = ?auto_212043 ?auto_212046 ) ) ( not ( = ?auto_212043 ?auto_212047 ) ) ( not ( = ?auto_212043 ?auto_212048 ) ) ( not ( = ?auto_212043 ?auto_212049 ) ) ( not ( = ?auto_212043 ?auto_212050 ) ) ( not ( = ?auto_212043 ?auto_212051 ) ) ( not ( = ?auto_212043 ?auto_212052 ) ) ( not ( = ?auto_212044 ?auto_212045 ) ) ( not ( = ?auto_212044 ?auto_212046 ) ) ( not ( = ?auto_212044 ?auto_212047 ) ) ( not ( = ?auto_212044 ?auto_212048 ) ) ( not ( = ?auto_212044 ?auto_212049 ) ) ( not ( = ?auto_212044 ?auto_212050 ) ) ( not ( = ?auto_212044 ?auto_212051 ) ) ( not ( = ?auto_212044 ?auto_212052 ) ) ( not ( = ?auto_212045 ?auto_212046 ) ) ( not ( = ?auto_212045 ?auto_212047 ) ) ( not ( = ?auto_212045 ?auto_212048 ) ) ( not ( = ?auto_212045 ?auto_212049 ) ) ( not ( = ?auto_212045 ?auto_212050 ) ) ( not ( = ?auto_212045 ?auto_212051 ) ) ( not ( = ?auto_212045 ?auto_212052 ) ) ( not ( = ?auto_212046 ?auto_212047 ) ) ( not ( = ?auto_212046 ?auto_212048 ) ) ( not ( = ?auto_212046 ?auto_212049 ) ) ( not ( = ?auto_212046 ?auto_212050 ) ) ( not ( = ?auto_212046 ?auto_212051 ) ) ( not ( = ?auto_212046 ?auto_212052 ) ) ( not ( = ?auto_212047 ?auto_212048 ) ) ( not ( = ?auto_212047 ?auto_212049 ) ) ( not ( = ?auto_212047 ?auto_212050 ) ) ( not ( = ?auto_212047 ?auto_212051 ) ) ( not ( = ?auto_212047 ?auto_212052 ) ) ( not ( = ?auto_212048 ?auto_212049 ) ) ( not ( = ?auto_212048 ?auto_212050 ) ) ( not ( = ?auto_212048 ?auto_212051 ) ) ( not ( = ?auto_212048 ?auto_212052 ) ) ( not ( = ?auto_212049 ?auto_212050 ) ) ( not ( = ?auto_212049 ?auto_212051 ) ) ( not ( = ?auto_212049 ?auto_212052 ) ) ( not ( = ?auto_212050 ?auto_212051 ) ) ( not ( = ?auto_212050 ?auto_212052 ) ) ( not ( = ?auto_212051 ?auto_212052 ) ) ( ON ?auto_212050 ?auto_212051 ) ( ON ?auto_212049 ?auto_212050 ) ( ON ?auto_212048 ?auto_212049 ) ( ON ?auto_212047 ?auto_212048 ) ( ON ?auto_212046 ?auto_212047 ) ( CLEAR ?auto_212044 ) ( ON ?auto_212045 ?auto_212046 ) ( CLEAR ?auto_212045 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_212039 ?auto_212040 ?auto_212041 ?auto_212042 ?auto_212043 ?auto_212044 ?auto_212045 )
      ( MAKE-13PILE ?auto_212039 ?auto_212040 ?auto_212041 ?auto_212042 ?auto_212043 ?auto_212044 ?auto_212045 ?auto_212046 ?auto_212047 ?auto_212048 ?auto_212049 ?auto_212050 ?auto_212051 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_212066 - BLOCK
      ?auto_212067 - BLOCK
      ?auto_212068 - BLOCK
      ?auto_212069 - BLOCK
      ?auto_212070 - BLOCK
      ?auto_212071 - BLOCK
      ?auto_212072 - BLOCK
      ?auto_212073 - BLOCK
      ?auto_212074 - BLOCK
      ?auto_212075 - BLOCK
      ?auto_212076 - BLOCK
      ?auto_212077 - BLOCK
      ?auto_212078 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_212078 ) ( ON-TABLE ?auto_212066 ) ( ON ?auto_212067 ?auto_212066 ) ( ON ?auto_212068 ?auto_212067 ) ( ON ?auto_212069 ?auto_212068 ) ( ON ?auto_212070 ?auto_212069 ) ( ON ?auto_212071 ?auto_212070 ) ( not ( = ?auto_212066 ?auto_212067 ) ) ( not ( = ?auto_212066 ?auto_212068 ) ) ( not ( = ?auto_212066 ?auto_212069 ) ) ( not ( = ?auto_212066 ?auto_212070 ) ) ( not ( = ?auto_212066 ?auto_212071 ) ) ( not ( = ?auto_212066 ?auto_212072 ) ) ( not ( = ?auto_212066 ?auto_212073 ) ) ( not ( = ?auto_212066 ?auto_212074 ) ) ( not ( = ?auto_212066 ?auto_212075 ) ) ( not ( = ?auto_212066 ?auto_212076 ) ) ( not ( = ?auto_212066 ?auto_212077 ) ) ( not ( = ?auto_212066 ?auto_212078 ) ) ( not ( = ?auto_212067 ?auto_212068 ) ) ( not ( = ?auto_212067 ?auto_212069 ) ) ( not ( = ?auto_212067 ?auto_212070 ) ) ( not ( = ?auto_212067 ?auto_212071 ) ) ( not ( = ?auto_212067 ?auto_212072 ) ) ( not ( = ?auto_212067 ?auto_212073 ) ) ( not ( = ?auto_212067 ?auto_212074 ) ) ( not ( = ?auto_212067 ?auto_212075 ) ) ( not ( = ?auto_212067 ?auto_212076 ) ) ( not ( = ?auto_212067 ?auto_212077 ) ) ( not ( = ?auto_212067 ?auto_212078 ) ) ( not ( = ?auto_212068 ?auto_212069 ) ) ( not ( = ?auto_212068 ?auto_212070 ) ) ( not ( = ?auto_212068 ?auto_212071 ) ) ( not ( = ?auto_212068 ?auto_212072 ) ) ( not ( = ?auto_212068 ?auto_212073 ) ) ( not ( = ?auto_212068 ?auto_212074 ) ) ( not ( = ?auto_212068 ?auto_212075 ) ) ( not ( = ?auto_212068 ?auto_212076 ) ) ( not ( = ?auto_212068 ?auto_212077 ) ) ( not ( = ?auto_212068 ?auto_212078 ) ) ( not ( = ?auto_212069 ?auto_212070 ) ) ( not ( = ?auto_212069 ?auto_212071 ) ) ( not ( = ?auto_212069 ?auto_212072 ) ) ( not ( = ?auto_212069 ?auto_212073 ) ) ( not ( = ?auto_212069 ?auto_212074 ) ) ( not ( = ?auto_212069 ?auto_212075 ) ) ( not ( = ?auto_212069 ?auto_212076 ) ) ( not ( = ?auto_212069 ?auto_212077 ) ) ( not ( = ?auto_212069 ?auto_212078 ) ) ( not ( = ?auto_212070 ?auto_212071 ) ) ( not ( = ?auto_212070 ?auto_212072 ) ) ( not ( = ?auto_212070 ?auto_212073 ) ) ( not ( = ?auto_212070 ?auto_212074 ) ) ( not ( = ?auto_212070 ?auto_212075 ) ) ( not ( = ?auto_212070 ?auto_212076 ) ) ( not ( = ?auto_212070 ?auto_212077 ) ) ( not ( = ?auto_212070 ?auto_212078 ) ) ( not ( = ?auto_212071 ?auto_212072 ) ) ( not ( = ?auto_212071 ?auto_212073 ) ) ( not ( = ?auto_212071 ?auto_212074 ) ) ( not ( = ?auto_212071 ?auto_212075 ) ) ( not ( = ?auto_212071 ?auto_212076 ) ) ( not ( = ?auto_212071 ?auto_212077 ) ) ( not ( = ?auto_212071 ?auto_212078 ) ) ( not ( = ?auto_212072 ?auto_212073 ) ) ( not ( = ?auto_212072 ?auto_212074 ) ) ( not ( = ?auto_212072 ?auto_212075 ) ) ( not ( = ?auto_212072 ?auto_212076 ) ) ( not ( = ?auto_212072 ?auto_212077 ) ) ( not ( = ?auto_212072 ?auto_212078 ) ) ( not ( = ?auto_212073 ?auto_212074 ) ) ( not ( = ?auto_212073 ?auto_212075 ) ) ( not ( = ?auto_212073 ?auto_212076 ) ) ( not ( = ?auto_212073 ?auto_212077 ) ) ( not ( = ?auto_212073 ?auto_212078 ) ) ( not ( = ?auto_212074 ?auto_212075 ) ) ( not ( = ?auto_212074 ?auto_212076 ) ) ( not ( = ?auto_212074 ?auto_212077 ) ) ( not ( = ?auto_212074 ?auto_212078 ) ) ( not ( = ?auto_212075 ?auto_212076 ) ) ( not ( = ?auto_212075 ?auto_212077 ) ) ( not ( = ?auto_212075 ?auto_212078 ) ) ( not ( = ?auto_212076 ?auto_212077 ) ) ( not ( = ?auto_212076 ?auto_212078 ) ) ( not ( = ?auto_212077 ?auto_212078 ) ) ( ON ?auto_212077 ?auto_212078 ) ( ON ?auto_212076 ?auto_212077 ) ( ON ?auto_212075 ?auto_212076 ) ( ON ?auto_212074 ?auto_212075 ) ( ON ?auto_212073 ?auto_212074 ) ( CLEAR ?auto_212071 ) ( ON ?auto_212072 ?auto_212073 ) ( CLEAR ?auto_212072 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_212066 ?auto_212067 ?auto_212068 ?auto_212069 ?auto_212070 ?auto_212071 ?auto_212072 )
      ( MAKE-13PILE ?auto_212066 ?auto_212067 ?auto_212068 ?auto_212069 ?auto_212070 ?auto_212071 ?auto_212072 ?auto_212073 ?auto_212074 ?auto_212075 ?auto_212076 ?auto_212077 ?auto_212078 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_212092 - BLOCK
      ?auto_212093 - BLOCK
      ?auto_212094 - BLOCK
      ?auto_212095 - BLOCK
      ?auto_212096 - BLOCK
      ?auto_212097 - BLOCK
      ?auto_212098 - BLOCK
      ?auto_212099 - BLOCK
      ?auto_212100 - BLOCK
      ?auto_212101 - BLOCK
      ?auto_212102 - BLOCK
      ?auto_212103 - BLOCK
      ?auto_212104 - BLOCK
    )
    :vars
    (
      ?auto_212105 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_212104 ?auto_212105 ) ( ON-TABLE ?auto_212092 ) ( ON ?auto_212093 ?auto_212092 ) ( ON ?auto_212094 ?auto_212093 ) ( ON ?auto_212095 ?auto_212094 ) ( ON ?auto_212096 ?auto_212095 ) ( not ( = ?auto_212092 ?auto_212093 ) ) ( not ( = ?auto_212092 ?auto_212094 ) ) ( not ( = ?auto_212092 ?auto_212095 ) ) ( not ( = ?auto_212092 ?auto_212096 ) ) ( not ( = ?auto_212092 ?auto_212097 ) ) ( not ( = ?auto_212092 ?auto_212098 ) ) ( not ( = ?auto_212092 ?auto_212099 ) ) ( not ( = ?auto_212092 ?auto_212100 ) ) ( not ( = ?auto_212092 ?auto_212101 ) ) ( not ( = ?auto_212092 ?auto_212102 ) ) ( not ( = ?auto_212092 ?auto_212103 ) ) ( not ( = ?auto_212092 ?auto_212104 ) ) ( not ( = ?auto_212092 ?auto_212105 ) ) ( not ( = ?auto_212093 ?auto_212094 ) ) ( not ( = ?auto_212093 ?auto_212095 ) ) ( not ( = ?auto_212093 ?auto_212096 ) ) ( not ( = ?auto_212093 ?auto_212097 ) ) ( not ( = ?auto_212093 ?auto_212098 ) ) ( not ( = ?auto_212093 ?auto_212099 ) ) ( not ( = ?auto_212093 ?auto_212100 ) ) ( not ( = ?auto_212093 ?auto_212101 ) ) ( not ( = ?auto_212093 ?auto_212102 ) ) ( not ( = ?auto_212093 ?auto_212103 ) ) ( not ( = ?auto_212093 ?auto_212104 ) ) ( not ( = ?auto_212093 ?auto_212105 ) ) ( not ( = ?auto_212094 ?auto_212095 ) ) ( not ( = ?auto_212094 ?auto_212096 ) ) ( not ( = ?auto_212094 ?auto_212097 ) ) ( not ( = ?auto_212094 ?auto_212098 ) ) ( not ( = ?auto_212094 ?auto_212099 ) ) ( not ( = ?auto_212094 ?auto_212100 ) ) ( not ( = ?auto_212094 ?auto_212101 ) ) ( not ( = ?auto_212094 ?auto_212102 ) ) ( not ( = ?auto_212094 ?auto_212103 ) ) ( not ( = ?auto_212094 ?auto_212104 ) ) ( not ( = ?auto_212094 ?auto_212105 ) ) ( not ( = ?auto_212095 ?auto_212096 ) ) ( not ( = ?auto_212095 ?auto_212097 ) ) ( not ( = ?auto_212095 ?auto_212098 ) ) ( not ( = ?auto_212095 ?auto_212099 ) ) ( not ( = ?auto_212095 ?auto_212100 ) ) ( not ( = ?auto_212095 ?auto_212101 ) ) ( not ( = ?auto_212095 ?auto_212102 ) ) ( not ( = ?auto_212095 ?auto_212103 ) ) ( not ( = ?auto_212095 ?auto_212104 ) ) ( not ( = ?auto_212095 ?auto_212105 ) ) ( not ( = ?auto_212096 ?auto_212097 ) ) ( not ( = ?auto_212096 ?auto_212098 ) ) ( not ( = ?auto_212096 ?auto_212099 ) ) ( not ( = ?auto_212096 ?auto_212100 ) ) ( not ( = ?auto_212096 ?auto_212101 ) ) ( not ( = ?auto_212096 ?auto_212102 ) ) ( not ( = ?auto_212096 ?auto_212103 ) ) ( not ( = ?auto_212096 ?auto_212104 ) ) ( not ( = ?auto_212096 ?auto_212105 ) ) ( not ( = ?auto_212097 ?auto_212098 ) ) ( not ( = ?auto_212097 ?auto_212099 ) ) ( not ( = ?auto_212097 ?auto_212100 ) ) ( not ( = ?auto_212097 ?auto_212101 ) ) ( not ( = ?auto_212097 ?auto_212102 ) ) ( not ( = ?auto_212097 ?auto_212103 ) ) ( not ( = ?auto_212097 ?auto_212104 ) ) ( not ( = ?auto_212097 ?auto_212105 ) ) ( not ( = ?auto_212098 ?auto_212099 ) ) ( not ( = ?auto_212098 ?auto_212100 ) ) ( not ( = ?auto_212098 ?auto_212101 ) ) ( not ( = ?auto_212098 ?auto_212102 ) ) ( not ( = ?auto_212098 ?auto_212103 ) ) ( not ( = ?auto_212098 ?auto_212104 ) ) ( not ( = ?auto_212098 ?auto_212105 ) ) ( not ( = ?auto_212099 ?auto_212100 ) ) ( not ( = ?auto_212099 ?auto_212101 ) ) ( not ( = ?auto_212099 ?auto_212102 ) ) ( not ( = ?auto_212099 ?auto_212103 ) ) ( not ( = ?auto_212099 ?auto_212104 ) ) ( not ( = ?auto_212099 ?auto_212105 ) ) ( not ( = ?auto_212100 ?auto_212101 ) ) ( not ( = ?auto_212100 ?auto_212102 ) ) ( not ( = ?auto_212100 ?auto_212103 ) ) ( not ( = ?auto_212100 ?auto_212104 ) ) ( not ( = ?auto_212100 ?auto_212105 ) ) ( not ( = ?auto_212101 ?auto_212102 ) ) ( not ( = ?auto_212101 ?auto_212103 ) ) ( not ( = ?auto_212101 ?auto_212104 ) ) ( not ( = ?auto_212101 ?auto_212105 ) ) ( not ( = ?auto_212102 ?auto_212103 ) ) ( not ( = ?auto_212102 ?auto_212104 ) ) ( not ( = ?auto_212102 ?auto_212105 ) ) ( not ( = ?auto_212103 ?auto_212104 ) ) ( not ( = ?auto_212103 ?auto_212105 ) ) ( not ( = ?auto_212104 ?auto_212105 ) ) ( ON ?auto_212103 ?auto_212104 ) ( ON ?auto_212102 ?auto_212103 ) ( ON ?auto_212101 ?auto_212102 ) ( ON ?auto_212100 ?auto_212101 ) ( ON ?auto_212099 ?auto_212100 ) ( ON ?auto_212098 ?auto_212099 ) ( CLEAR ?auto_212096 ) ( ON ?auto_212097 ?auto_212098 ) ( CLEAR ?auto_212097 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_212092 ?auto_212093 ?auto_212094 ?auto_212095 ?auto_212096 ?auto_212097 )
      ( MAKE-13PILE ?auto_212092 ?auto_212093 ?auto_212094 ?auto_212095 ?auto_212096 ?auto_212097 ?auto_212098 ?auto_212099 ?auto_212100 ?auto_212101 ?auto_212102 ?auto_212103 ?auto_212104 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_212119 - BLOCK
      ?auto_212120 - BLOCK
      ?auto_212121 - BLOCK
      ?auto_212122 - BLOCK
      ?auto_212123 - BLOCK
      ?auto_212124 - BLOCK
      ?auto_212125 - BLOCK
      ?auto_212126 - BLOCK
      ?auto_212127 - BLOCK
      ?auto_212128 - BLOCK
      ?auto_212129 - BLOCK
      ?auto_212130 - BLOCK
      ?auto_212131 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_212131 ) ( ON-TABLE ?auto_212119 ) ( ON ?auto_212120 ?auto_212119 ) ( ON ?auto_212121 ?auto_212120 ) ( ON ?auto_212122 ?auto_212121 ) ( ON ?auto_212123 ?auto_212122 ) ( not ( = ?auto_212119 ?auto_212120 ) ) ( not ( = ?auto_212119 ?auto_212121 ) ) ( not ( = ?auto_212119 ?auto_212122 ) ) ( not ( = ?auto_212119 ?auto_212123 ) ) ( not ( = ?auto_212119 ?auto_212124 ) ) ( not ( = ?auto_212119 ?auto_212125 ) ) ( not ( = ?auto_212119 ?auto_212126 ) ) ( not ( = ?auto_212119 ?auto_212127 ) ) ( not ( = ?auto_212119 ?auto_212128 ) ) ( not ( = ?auto_212119 ?auto_212129 ) ) ( not ( = ?auto_212119 ?auto_212130 ) ) ( not ( = ?auto_212119 ?auto_212131 ) ) ( not ( = ?auto_212120 ?auto_212121 ) ) ( not ( = ?auto_212120 ?auto_212122 ) ) ( not ( = ?auto_212120 ?auto_212123 ) ) ( not ( = ?auto_212120 ?auto_212124 ) ) ( not ( = ?auto_212120 ?auto_212125 ) ) ( not ( = ?auto_212120 ?auto_212126 ) ) ( not ( = ?auto_212120 ?auto_212127 ) ) ( not ( = ?auto_212120 ?auto_212128 ) ) ( not ( = ?auto_212120 ?auto_212129 ) ) ( not ( = ?auto_212120 ?auto_212130 ) ) ( not ( = ?auto_212120 ?auto_212131 ) ) ( not ( = ?auto_212121 ?auto_212122 ) ) ( not ( = ?auto_212121 ?auto_212123 ) ) ( not ( = ?auto_212121 ?auto_212124 ) ) ( not ( = ?auto_212121 ?auto_212125 ) ) ( not ( = ?auto_212121 ?auto_212126 ) ) ( not ( = ?auto_212121 ?auto_212127 ) ) ( not ( = ?auto_212121 ?auto_212128 ) ) ( not ( = ?auto_212121 ?auto_212129 ) ) ( not ( = ?auto_212121 ?auto_212130 ) ) ( not ( = ?auto_212121 ?auto_212131 ) ) ( not ( = ?auto_212122 ?auto_212123 ) ) ( not ( = ?auto_212122 ?auto_212124 ) ) ( not ( = ?auto_212122 ?auto_212125 ) ) ( not ( = ?auto_212122 ?auto_212126 ) ) ( not ( = ?auto_212122 ?auto_212127 ) ) ( not ( = ?auto_212122 ?auto_212128 ) ) ( not ( = ?auto_212122 ?auto_212129 ) ) ( not ( = ?auto_212122 ?auto_212130 ) ) ( not ( = ?auto_212122 ?auto_212131 ) ) ( not ( = ?auto_212123 ?auto_212124 ) ) ( not ( = ?auto_212123 ?auto_212125 ) ) ( not ( = ?auto_212123 ?auto_212126 ) ) ( not ( = ?auto_212123 ?auto_212127 ) ) ( not ( = ?auto_212123 ?auto_212128 ) ) ( not ( = ?auto_212123 ?auto_212129 ) ) ( not ( = ?auto_212123 ?auto_212130 ) ) ( not ( = ?auto_212123 ?auto_212131 ) ) ( not ( = ?auto_212124 ?auto_212125 ) ) ( not ( = ?auto_212124 ?auto_212126 ) ) ( not ( = ?auto_212124 ?auto_212127 ) ) ( not ( = ?auto_212124 ?auto_212128 ) ) ( not ( = ?auto_212124 ?auto_212129 ) ) ( not ( = ?auto_212124 ?auto_212130 ) ) ( not ( = ?auto_212124 ?auto_212131 ) ) ( not ( = ?auto_212125 ?auto_212126 ) ) ( not ( = ?auto_212125 ?auto_212127 ) ) ( not ( = ?auto_212125 ?auto_212128 ) ) ( not ( = ?auto_212125 ?auto_212129 ) ) ( not ( = ?auto_212125 ?auto_212130 ) ) ( not ( = ?auto_212125 ?auto_212131 ) ) ( not ( = ?auto_212126 ?auto_212127 ) ) ( not ( = ?auto_212126 ?auto_212128 ) ) ( not ( = ?auto_212126 ?auto_212129 ) ) ( not ( = ?auto_212126 ?auto_212130 ) ) ( not ( = ?auto_212126 ?auto_212131 ) ) ( not ( = ?auto_212127 ?auto_212128 ) ) ( not ( = ?auto_212127 ?auto_212129 ) ) ( not ( = ?auto_212127 ?auto_212130 ) ) ( not ( = ?auto_212127 ?auto_212131 ) ) ( not ( = ?auto_212128 ?auto_212129 ) ) ( not ( = ?auto_212128 ?auto_212130 ) ) ( not ( = ?auto_212128 ?auto_212131 ) ) ( not ( = ?auto_212129 ?auto_212130 ) ) ( not ( = ?auto_212129 ?auto_212131 ) ) ( not ( = ?auto_212130 ?auto_212131 ) ) ( ON ?auto_212130 ?auto_212131 ) ( ON ?auto_212129 ?auto_212130 ) ( ON ?auto_212128 ?auto_212129 ) ( ON ?auto_212127 ?auto_212128 ) ( ON ?auto_212126 ?auto_212127 ) ( ON ?auto_212125 ?auto_212126 ) ( CLEAR ?auto_212123 ) ( ON ?auto_212124 ?auto_212125 ) ( CLEAR ?auto_212124 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_212119 ?auto_212120 ?auto_212121 ?auto_212122 ?auto_212123 ?auto_212124 )
      ( MAKE-13PILE ?auto_212119 ?auto_212120 ?auto_212121 ?auto_212122 ?auto_212123 ?auto_212124 ?auto_212125 ?auto_212126 ?auto_212127 ?auto_212128 ?auto_212129 ?auto_212130 ?auto_212131 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_212145 - BLOCK
      ?auto_212146 - BLOCK
      ?auto_212147 - BLOCK
      ?auto_212148 - BLOCK
      ?auto_212149 - BLOCK
      ?auto_212150 - BLOCK
      ?auto_212151 - BLOCK
      ?auto_212152 - BLOCK
      ?auto_212153 - BLOCK
      ?auto_212154 - BLOCK
      ?auto_212155 - BLOCK
      ?auto_212156 - BLOCK
      ?auto_212157 - BLOCK
    )
    :vars
    (
      ?auto_212158 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_212157 ?auto_212158 ) ( ON-TABLE ?auto_212145 ) ( ON ?auto_212146 ?auto_212145 ) ( ON ?auto_212147 ?auto_212146 ) ( ON ?auto_212148 ?auto_212147 ) ( not ( = ?auto_212145 ?auto_212146 ) ) ( not ( = ?auto_212145 ?auto_212147 ) ) ( not ( = ?auto_212145 ?auto_212148 ) ) ( not ( = ?auto_212145 ?auto_212149 ) ) ( not ( = ?auto_212145 ?auto_212150 ) ) ( not ( = ?auto_212145 ?auto_212151 ) ) ( not ( = ?auto_212145 ?auto_212152 ) ) ( not ( = ?auto_212145 ?auto_212153 ) ) ( not ( = ?auto_212145 ?auto_212154 ) ) ( not ( = ?auto_212145 ?auto_212155 ) ) ( not ( = ?auto_212145 ?auto_212156 ) ) ( not ( = ?auto_212145 ?auto_212157 ) ) ( not ( = ?auto_212145 ?auto_212158 ) ) ( not ( = ?auto_212146 ?auto_212147 ) ) ( not ( = ?auto_212146 ?auto_212148 ) ) ( not ( = ?auto_212146 ?auto_212149 ) ) ( not ( = ?auto_212146 ?auto_212150 ) ) ( not ( = ?auto_212146 ?auto_212151 ) ) ( not ( = ?auto_212146 ?auto_212152 ) ) ( not ( = ?auto_212146 ?auto_212153 ) ) ( not ( = ?auto_212146 ?auto_212154 ) ) ( not ( = ?auto_212146 ?auto_212155 ) ) ( not ( = ?auto_212146 ?auto_212156 ) ) ( not ( = ?auto_212146 ?auto_212157 ) ) ( not ( = ?auto_212146 ?auto_212158 ) ) ( not ( = ?auto_212147 ?auto_212148 ) ) ( not ( = ?auto_212147 ?auto_212149 ) ) ( not ( = ?auto_212147 ?auto_212150 ) ) ( not ( = ?auto_212147 ?auto_212151 ) ) ( not ( = ?auto_212147 ?auto_212152 ) ) ( not ( = ?auto_212147 ?auto_212153 ) ) ( not ( = ?auto_212147 ?auto_212154 ) ) ( not ( = ?auto_212147 ?auto_212155 ) ) ( not ( = ?auto_212147 ?auto_212156 ) ) ( not ( = ?auto_212147 ?auto_212157 ) ) ( not ( = ?auto_212147 ?auto_212158 ) ) ( not ( = ?auto_212148 ?auto_212149 ) ) ( not ( = ?auto_212148 ?auto_212150 ) ) ( not ( = ?auto_212148 ?auto_212151 ) ) ( not ( = ?auto_212148 ?auto_212152 ) ) ( not ( = ?auto_212148 ?auto_212153 ) ) ( not ( = ?auto_212148 ?auto_212154 ) ) ( not ( = ?auto_212148 ?auto_212155 ) ) ( not ( = ?auto_212148 ?auto_212156 ) ) ( not ( = ?auto_212148 ?auto_212157 ) ) ( not ( = ?auto_212148 ?auto_212158 ) ) ( not ( = ?auto_212149 ?auto_212150 ) ) ( not ( = ?auto_212149 ?auto_212151 ) ) ( not ( = ?auto_212149 ?auto_212152 ) ) ( not ( = ?auto_212149 ?auto_212153 ) ) ( not ( = ?auto_212149 ?auto_212154 ) ) ( not ( = ?auto_212149 ?auto_212155 ) ) ( not ( = ?auto_212149 ?auto_212156 ) ) ( not ( = ?auto_212149 ?auto_212157 ) ) ( not ( = ?auto_212149 ?auto_212158 ) ) ( not ( = ?auto_212150 ?auto_212151 ) ) ( not ( = ?auto_212150 ?auto_212152 ) ) ( not ( = ?auto_212150 ?auto_212153 ) ) ( not ( = ?auto_212150 ?auto_212154 ) ) ( not ( = ?auto_212150 ?auto_212155 ) ) ( not ( = ?auto_212150 ?auto_212156 ) ) ( not ( = ?auto_212150 ?auto_212157 ) ) ( not ( = ?auto_212150 ?auto_212158 ) ) ( not ( = ?auto_212151 ?auto_212152 ) ) ( not ( = ?auto_212151 ?auto_212153 ) ) ( not ( = ?auto_212151 ?auto_212154 ) ) ( not ( = ?auto_212151 ?auto_212155 ) ) ( not ( = ?auto_212151 ?auto_212156 ) ) ( not ( = ?auto_212151 ?auto_212157 ) ) ( not ( = ?auto_212151 ?auto_212158 ) ) ( not ( = ?auto_212152 ?auto_212153 ) ) ( not ( = ?auto_212152 ?auto_212154 ) ) ( not ( = ?auto_212152 ?auto_212155 ) ) ( not ( = ?auto_212152 ?auto_212156 ) ) ( not ( = ?auto_212152 ?auto_212157 ) ) ( not ( = ?auto_212152 ?auto_212158 ) ) ( not ( = ?auto_212153 ?auto_212154 ) ) ( not ( = ?auto_212153 ?auto_212155 ) ) ( not ( = ?auto_212153 ?auto_212156 ) ) ( not ( = ?auto_212153 ?auto_212157 ) ) ( not ( = ?auto_212153 ?auto_212158 ) ) ( not ( = ?auto_212154 ?auto_212155 ) ) ( not ( = ?auto_212154 ?auto_212156 ) ) ( not ( = ?auto_212154 ?auto_212157 ) ) ( not ( = ?auto_212154 ?auto_212158 ) ) ( not ( = ?auto_212155 ?auto_212156 ) ) ( not ( = ?auto_212155 ?auto_212157 ) ) ( not ( = ?auto_212155 ?auto_212158 ) ) ( not ( = ?auto_212156 ?auto_212157 ) ) ( not ( = ?auto_212156 ?auto_212158 ) ) ( not ( = ?auto_212157 ?auto_212158 ) ) ( ON ?auto_212156 ?auto_212157 ) ( ON ?auto_212155 ?auto_212156 ) ( ON ?auto_212154 ?auto_212155 ) ( ON ?auto_212153 ?auto_212154 ) ( ON ?auto_212152 ?auto_212153 ) ( ON ?auto_212151 ?auto_212152 ) ( ON ?auto_212150 ?auto_212151 ) ( CLEAR ?auto_212148 ) ( ON ?auto_212149 ?auto_212150 ) ( CLEAR ?auto_212149 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_212145 ?auto_212146 ?auto_212147 ?auto_212148 ?auto_212149 )
      ( MAKE-13PILE ?auto_212145 ?auto_212146 ?auto_212147 ?auto_212148 ?auto_212149 ?auto_212150 ?auto_212151 ?auto_212152 ?auto_212153 ?auto_212154 ?auto_212155 ?auto_212156 ?auto_212157 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_212172 - BLOCK
      ?auto_212173 - BLOCK
      ?auto_212174 - BLOCK
      ?auto_212175 - BLOCK
      ?auto_212176 - BLOCK
      ?auto_212177 - BLOCK
      ?auto_212178 - BLOCK
      ?auto_212179 - BLOCK
      ?auto_212180 - BLOCK
      ?auto_212181 - BLOCK
      ?auto_212182 - BLOCK
      ?auto_212183 - BLOCK
      ?auto_212184 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_212184 ) ( ON-TABLE ?auto_212172 ) ( ON ?auto_212173 ?auto_212172 ) ( ON ?auto_212174 ?auto_212173 ) ( ON ?auto_212175 ?auto_212174 ) ( not ( = ?auto_212172 ?auto_212173 ) ) ( not ( = ?auto_212172 ?auto_212174 ) ) ( not ( = ?auto_212172 ?auto_212175 ) ) ( not ( = ?auto_212172 ?auto_212176 ) ) ( not ( = ?auto_212172 ?auto_212177 ) ) ( not ( = ?auto_212172 ?auto_212178 ) ) ( not ( = ?auto_212172 ?auto_212179 ) ) ( not ( = ?auto_212172 ?auto_212180 ) ) ( not ( = ?auto_212172 ?auto_212181 ) ) ( not ( = ?auto_212172 ?auto_212182 ) ) ( not ( = ?auto_212172 ?auto_212183 ) ) ( not ( = ?auto_212172 ?auto_212184 ) ) ( not ( = ?auto_212173 ?auto_212174 ) ) ( not ( = ?auto_212173 ?auto_212175 ) ) ( not ( = ?auto_212173 ?auto_212176 ) ) ( not ( = ?auto_212173 ?auto_212177 ) ) ( not ( = ?auto_212173 ?auto_212178 ) ) ( not ( = ?auto_212173 ?auto_212179 ) ) ( not ( = ?auto_212173 ?auto_212180 ) ) ( not ( = ?auto_212173 ?auto_212181 ) ) ( not ( = ?auto_212173 ?auto_212182 ) ) ( not ( = ?auto_212173 ?auto_212183 ) ) ( not ( = ?auto_212173 ?auto_212184 ) ) ( not ( = ?auto_212174 ?auto_212175 ) ) ( not ( = ?auto_212174 ?auto_212176 ) ) ( not ( = ?auto_212174 ?auto_212177 ) ) ( not ( = ?auto_212174 ?auto_212178 ) ) ( not ( = ?auto_212174 ?auto_212179 ) ) ( not ( = ?auto_212174 ?auto_212180 ) ) ( not ( = ?auto_212174 ?auto_212181 ) ) ( not ( = ?auto_212174 ?auto_212182 ) ) ( not ( = ?auto_212174 ?auto_212183 ) ) ( not ( = ?auto_212174 ?auto_212184 ) ) ( not ( = ?auto_212175 ?auto_212176 ) ) ( not ( = ?auto_212175 ?auto_212177 ) ) ( not ( = ?auto_212175 ?auto_212178 ) ) ( not ( = ?auto_212175 ?auto_212179 ) ) ( not ( = ?auto_212175 ?auto_212180 ) ) ( not ( = ?auto_212175 ?auto_212181 ) ) ( not ( = ?auto_212175 ?auto_212182 ) ) ( not ( = ?auto_212175 ?auto_212183 ) ) ( not ( = ?auto_212175 ?auto_212184 ) ) ( not ( = ?auto_212176 ?auto_212177 ) ) ( not ( = ?auto_212176 ?auto_212178 ) ) ( not ( = ?auto_212176 ?auto_212179 ) ) ( not ( = ?auto_212176 ?auto_212180 ) ) ( not ( = ?auto_212176 ?auto_212181 ) ) ( not ( = ?auto_212176 ?auto_212182 ) ) ( not ( = ?auto_212176 ?auto_212183 ) ) ( not ( = ?auto_212176 ?auto_212184 ) ) ( not ( = ?auto_212177 ?auto_212178 ) ) ( not ( = ?auto_212177 ?auto_212179 ) ) ( not ( = ?auto_212177 ?auto_212180 ) ) ( not ( = ?auto_212177 ?auto_212181 ) ) ( not ( = ?auto_212177 ?auto_212182 ) ) ( not ( = ?auto_212177 ?auto_212183 ) ) ( not ( = ?auto_212177 ?auto_212184 ) ) ( not ( = ?auto_212178 ?auto_212179 ) ) ( not ( = ?auto_212178 ?auto_212180 ) ) ( not ( = ?auto_212178 ?auto_212181 ) ) ( not ( = ?auto_212178 ?auto_212182 ) ) ( not ( = ?auto_212178 ?auto_212183 ) ) ( not ( = ?auto_212178 ?auto_212184 ) ) ( not ( = ?auto_212179 ?auto_212180 ) ) ( not ( = ?auto_212179 ?auto_212181 ) ) ( not ( = ?auto_212179 ?auto_212182 ) ) ( not ( = ?auto_212179 ?auto_212183 ) ) ( not ( = ?auto_212179 ?auto_212184 ) ) ( not ( = ?auto_212180 ?auto_212181 ) ) ( not ( = ?auto_212180 ?auto_212182 ) ) ( not ( = ?auto_212180 ?auto_212183 ) ) ( not ( = ?auto_212180 ?auto_212184 ) ) ( not ( = ?auto_212181 ?auto_212182 ) ) ( not ( = ?auto_212181 ?auto_212183 ) ) ( not ( = ?auto_212181 ?auto_212184 ) ) ( not ( = ?auto_212182 ?auto_212183 ) ) ( not ( = ?auto_212182 ?auto_212184 ) ) ( not ( = ?auto_212183 ?auto_212184 ) ) ( ON ?auto_212183 ?auto_212184 ) ( ON ?auto_212182 ?auto_212183 ) ( ON ?auto_212181 ?auto_212182 ) ( ON ?auto_212180 ?auto_212181 ) ( ON ?auto_212179 ?auto_212180 ) ( ON ?auto_212178 ?auto_212179 ) ( ON ?auto_212177 ?auto_212178 ) ( CLEAR ?auto_212175 ) ( ON ?auto_212176 ?auto_212177 ) ( CLEAR ?auto_212176 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_212172 ?auto_212173 ?auto_212174 ?auto_212175 ?auto_212176 )
      ( MAKE-13PILE ?auto_212172 ?auto_212173 ?auto_212174 ?auto_212175 ?auto_212176 ?auto_212177 ?auto_212178 ?auto_212179 ?auto_212180 ?auto_212181 ?auto_212182 ?auto_212183 ?auto_212184 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_212198 - BLOCK
      ?auto_212199 - BLOCK
      ?auto_212200 - BLOCK
      ?auto_212201 - BLOCK
      ?auto_212202 - BLOCK
      ?auto_212203 - BLOCK
      ?auto_212204 - BLOCK
      ?auto_212205 - BLOCK
      ?auto_212206 - BLOCK
      ?auto_212207 - BLOCK
      ?auto_212208 - BLOCK
      ?auto_212209 - BLOCK
      ?auto_212210 - BLOCK
    )
    :vars
    (
      ?auto_212211 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_212210 ?auto_212211 ) ( ON-TABLE ?auto_212198 ) ( ON ?auto_212199 ?auto_212198 ) ( ON ?auto_212200 ?auto_212199 ) ( not ( = ?auto_212198 ?auto_212199 ) ) ( not ( = ?auto_212198 ?auto_212200 ) ) ( not ( = ?auto_212198 ?auto_212201 ) ) ( not ( = ?auto_212198 ?auto_212202 ) ) ( not ( = ?auto_212198 ?auto_212203 ) ) ( not ( = ?auto_212198 ?auto_212204 ) ) ( not ( = ?auto_212198 ?auto_212205 ) ) ( not ( = ?auto_212198 ?auto_212206 ) ) ( not ( = ?auto_212198 ?auto_212207 ) ) ( not ( = ?auto_212198 ?auto_212208 ) ) ( not ( = ?auto_212198 ?auto_212209 ) ) ( not ( = ?auto_212198 ?auto_212210 ) ) ( not ( = ?auto_212198 ?auto_212211 ) ) ( not ( = ?auto_212199 ?auto_212200 ) ) ( not ( = ?auto_212199 ?auto_212201 ) ) ( not ( = ?auto_212199 ?auto_212202 ) ) ( not ( = ?auto_212199 ?auto_212203 ) ) ( not ( = ?auto_212199 ?auto_212204 ) ) ( not ( = ?auto_212199 ?auto_212205 ) ) ( not ( = ?auto_212199 ?auto_212206 ) ) ( not ( = ?auto_212199 ?auto_212207 ) ) ( not ( = ?auto_212199 ?auto_212208 ) ) ( not ( = ?auto_212199 ?auto_212209 ) ) ( not ( = ?auto_212199 ?auto_212210 ) ) ( not ( = ?auto_212199 ?auto_212211 ) ) ( not ( = ?auto_212200 ?auto_212201 ) ) ( not ( = ?auto_212200 ?auto_212202 ) ) ( not ( = ?auto_212200 ?auto_212203 ) ) ( not ( = ?auto_212200 ?auto_212204 ) ) ( not ( = ?auto_212200 ?auto_212205 ) ) ( not ( = ?auto_212200 ?auto_212206 ) ) ( not ( = ?auto_212200 ?auto_212207 ) ) ( not ( = ?auto_212200 ?auto_212208 ) ) ( not ( = ?auto_212200 ?auto_212209 ) ) ( not ( = ?auto_212200 ?auto_212210 ) ) ( not ( = ?auto_212200 ?auto_212211 ) ) ( not ( = ?auto_212201 ?auto_212202 ) ) ( not ( = ?auto_212201 ?auto_212203 ) ) ( not ( = ?auto_212201 ?auto_212204 ) ) ( not ( = ?auto_212201 ?auto_212205 ) ) ( not ( = ?auto_212201 ?auto_212206 ) ) ( not ( = ?auto_212201 ?auto_212207 ) ) ( not ( = ?auto_212201 ?auto_212208 ) ) ( not ( = ?auto_212201 ?auto_212209 ) ) ( not ( = ?auto_212201 ?auto_212210 ) ) ( not ( = ?auto_212201 ?auto_212211 ) ) ( not ( = ?auto_212202 ?auto_212203 ) ) ( not ( = ?auto_212202 ?auto_212204 ) ) ( not ( = ?auto_212202 ?auto_212205 ) ) ( not ( = ?auto_212202 ?auto_212206 ) ) ( not ( = ?auto_212202 ?auto_212207 ) ) ( not ( = ?auto_212202 ?auto_212208 ) ) ( not ( = ?auto_212202 ?auto_212209 ) ) ( not ( = ?auto_212202 ?auto_212210 ) ) ( not ( = ?auto_212202 ?auto_212211 ) ) ( not ( = ?auto_212203 ?auto_212204 ) ) ( not ( = ?auto_212203 ?auto_212205 ) ) ( not ( = ?auto_212203 ?auto_212206 ) ) ( not ( = ?auto_212203 ?auto_212207 ) ) ( not ( = ?auto_212203 ?auto_212208 ) ) ( not ( = ?auto_212203 ?auto_212209 ) ) ( not ( = ?auto_212203 ?auto_212210 ) ) ( not ( = ?auto_212203 ?auto_212211 ) ) ( not ( = ?auto_212204 ?auto_212205 ) ) ( not ( = ?auto_212204 ?auto_212206 ) ) ( not ( = ?auto_212204 ?auto_212207 ) ) ( not ( = ?auto_212204 ?auto_212208 ) ) ( not ( = ?auto_212204 ?auto_212209 ) ) ( not ( = ?auto_212204 ?auto_212210 ) ) ( not ( = ?auto_212204 ?auto_212211 ) ) ( not ( = ?auto_212205 ?auto_212206 ) ) ( not ( = ?auto_212205 ?auto_212207 ) ) ( not ( = ?auto_212205 ?auto_212208 ) ) ( not ( = ?auto_212205 ?auto_212209 ) ) ( not ( = ?auto_212205 ?auto_212210 ) ) ( not ( = ?auto_212205 ?auto_212211 ) ) ( not ( = ?auto_212206 ?auto_212207 ) ) ( not ( = ?auto_212206 ?auto_212208 ) ) ( not ( = ?auto_212206 ?auto_212209 ) ) ( not ( = ?auto_212206 ?auto_212210 ) ) ( not ( = ?auto_212206 ?auto_212211 ) ) ( not ( = ?auto_212207 ?auto_212208 ) ) ( not ( = ?auto_212207 ?auto_212209 ) ) ( not ( = ?auto_212207 ?auto_212210 ) ) ( not ( = ?auto_212207 ?auto_212211 ) ) ( not ( = ?auto_212208 ?auto_212209 ) ) ( not ( = ?auto_212208 ?auto_212210 ) ) ( not ( = ?auto_212208 ?auto_212211 ) ) ( not ( = ?auto_212209 ?auto_212210 ) ) ( not ( = ?auto_212209 ?auto_212211 ) ) ( not ( = ?auto_212210 ?auto_212211 ) ) ( ON ?auto_212209 ?auto_212210 ) ( ON ?auto_212208 ?auto_212209 ) ( ON ?auto_212207 ?auto_212208 ) ( ON ?auto_212206 ?auto_212207 ) ( ON ?auto_212205 ?auto_212206 ) ( ON ?auto_212204 ?auto_212205 ) ( ON ?auto_212203 ?auto_212204 ) ( ON ?auto_212202 ?auto_212203 ) ( CLEAR ?auto_212200 ) ( ON ?auto_212201 ?auto_212202 ) ( CLEAR ?auto_212201 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_212198 ?auto_212199 ?auto_212200 ?auto_212201 )
      ( MAKE-13PILE ?auto_212198 ?auto_212199 ?auto_212200 ?auto_212201 ?auto_212202 ?auto_212203 ?auto_212204 ?auto_212205 ?auto_212206 ?auto_212207 ?auto_212208 ?auto_212209 ?auto_212210 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_212225 - BLOCK
      ?auto_212226 - BLOCK
      ?auto_212227 - BLOCK
      ?auto_212228 - BLOCK
      ?auto_212229 - BLOCK
      ?auto_212230 - BLOCK
      ?auto_212231 - BLOCK
      ?auto_212232 - BLOCK
      ?auto_212233 - BLOCK
      ?auto_212234 - BLOCK
      ?auto_212235 - BLOCK
      ?auto_212236 - BLOCK
      ?auto_212237 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_212237 ) ( ON-TABLE ?auto_212225 ) ( ON ?auto_212226 ?auto_212225 ) ( ON ?auto_212227 ?auto_212226 ) ( not ( = ?auto_212225 ?auto_212226 ) ) ( not ( = ?auto_212225 ?auto_212227 ) ) ( not ( = ?auto_212225 ?auto_212228 ) ) ( not ( = ?auto_212225 ?auto_212229 ) ) ( not ( = ?auto_212225 ?auto_212230 ) ) ( not ( = ?auto_212225 ?auto_212231 ) ) ( not ( = ?auto_212225 ?auto_212232 ) ) ( not ( = ?auto_212225 ?auto_212233 ) ) ( not ( = ?auto_212225 ?auto_212234 ) ) ( not ( = ?auto_212225 ?auto_212235 ) ) ( not ( = ?auto_212225 ?auto_212236 ) ) ( not ( = ?auto_212225 ?auto_212237 ) ) ( not ( = ?auto_212226 ?auto_212227 ) ) ( not ( = ?auto_212226 ?auto_212228 ) ) ( not ( = ?auto_212226 ?auto_212229 ) ) ( not ( = ?auto_212226 ?auto_212230 ) ) ( not ( = ?auto_212226 ?auto_212231 ) ) ( not ( = ?auto_212226 ?auto_212232 ) ) ( not ( = ?auto_212226 ?auto_212233 ) ) ( not ( = ?auto_212226 ?auto_212234 ) ) ( not ( = ?auto_212226 ?auto_212235 ) ) ( not ( = ?auto_212226 ?auto_212236 ) ) ( not ( = ?auto_212226 ?auto_212237 ) ) ( not ( = ?auto_212227 ?auto_212228 ) ) ( not ( = ?auto_212227 ?auto_212229 ) ) ( not ( = ?auto_212227 ?auto_212230 ) ) ( not ( = ?auto_212227 ?auto_212231 ) ) ( not ( = ?auto_212227 ?auto_212232 ) ) ( not ( = ?auto_212227 ?auto_212233 ) ) ( not ( = ?auto_212227 ?auto_212234 ) ) ( not ( = ?auto_212227 ?auto_212235 ) ) ( not ( = ?auto_212227 ?auto_212236 ) ) ( not ( = ?auto_212227 ?auto_212237 ) ) ( not ( = ?auto_212228 ?auto_212229 ) ) ( not ( = ?auto_212228 ?auto_212230 ) ) ( not ( = ?auto_212228 ?auto_212231 ) ) ( not ( = ?auto_212228 ?auto_212232 ) ) ( not ( = ?auto_212228 ?auto_212233 ) ) ( not ( = ?auto_212228 ?auto_212234 ) ) ( not ( = ?auto_212228 ?auto_212235 ) ) ( not ( = ?auto_212228 ?auto_212236 ) ) ( not ( = ?auto_212228 ?auto_212237 ) ) ( not ( = ?auto_212229 ?auto_212230 ) ) ( not ( = ?auto_212229 ?auto_212231 ) ) ( not ( = ?auto_212229 ?auto_212232 ) ) ( not ( = ?auto_212229 ?auto_212233 ) ) ( not ( = ?auto_212229 ?auto_212234 ) ) ( not ( = ?auto_212229 ?auto_212235 ) ) ( not ( = ?auto_212229 ?auto_212236 ) ) ( not ( = ?auto_212229 ?auto_212237 ) ) ( not ( = ?auto_212230 ?auto_212231 ) ) ( not ( = ?auto_212230 ?auto_212232 ) ) ( not ( = ?auto_212230 ?auto_212233 ) ) ( not ( = ?auto_212230 ?auto_212234 ) ) ( not ( = ?auto_212230 ?auto_212235 ) ) ( not ( = ?auto_212230 ?auto_212236 ) ) ( not ( = ?auto_212230 ?auto_212237 ) ) ( not ( = ?auto_212231 ?auto_212232 ) ) ( not ( = ?auto_212231 ?auto_212233 ) ) ( not ( = ?auto_212231 ?auto_212234 ) ) ( not ( = ?auto_212231 ?auto_212235 ) ) ( not ( = ?auto_212231 ?auto_212236 ) ) ( not ( = ?auto_212231 ?auto_212237 ) ) ( not ( = ?auto_212232 ?auto_212233 ) ) ( not ( = ?auto_212232 ?auto_212234 ) ) ( not ( = ?auto_212232 ?auto_212235 ) ) ( not ( = ?auto_212232 ?auto_212236 ) ) ( not ( = ?auto_212232 ?auto_212237 ) ) ( not ( = ?auto_212233 ?auto_212234 ) ) ( not ( = ?auto_212233 ?auto_212235 ) ) ( not ( = ?auto_212233 ?auto_212236 ) ) ( not ( = ?auto_212233 ?auto_212237 ) ) ( not ( = ?auto_212234 ?auto_212235 ) ) ( not ( = ?auto_212234 ?auto_212236 ) ) ( not ( = ?auto_212234 ?auto_212237 ) ) ( not ( = ?auto_212235 ?auto_212236 ) ) ( not ( = ?auto_212235 ?auto_212237 ) ) ( not ( = ?auto_212236 ?auto_212237 ) ) ( ON ?auto_212236 ?auto_212237 ) ( ON ?auto_212235 ?auto_212236 ) ( ON ?auto_212234 ?auto_212235 ) ( ON ?auto_212233 ?auto_212234 ) ( ON ?auto_212232 ?auto_212233 ) ( ON ?auto_212231 ?auto_212232 ) ( ON ?auto_212230 ?auto_212231 ) ( ON ?auto_212229 ?auto_212230 ) ( CLEAR ?auto_212227 ) ( ON ?auto_212228 ?auto_212229 ) ( CLEAR ?auto_212228 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_212225 ?auto_212226 ?auto_212227 ?auto_212228 )
      ( MAKE-13PILE ?auto_212225 ?auto_212226 ?auto_212227 ?auto_212228 ?auto_212229 ?auto_212230 ?auto_212231 ?auto_212232 ?auto_212233 ?auto_212234 ?auto_212235 ?auto_212236 ?auto_212237 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_212251 - BLOCK
      ?auto_212252 - BLOCK
      ?auto_212253 - BLOCK
      ?auto_212254 - BLOCK
      ?auto_212255 - BLOCK
      ?auto_212256 - BLOCK
      ?auto_212257 - BLOCK
      ?auto_212258 - BLOCK
      ?auto_212259 - BLOCK
      ?auto_212260 - BLOCK
      ?auto_212261 - BLOCK
      ?auto_212262 - BLOCK
      ?auto_212263 - BLOCK
    )
    :vars
    (
      ?auto_212264 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_212263 ?auto_212264 ) ( ON-TABLE ?auto_212251 ) ( ON ?auto_212252 ?auto_212251 ) ( not ( = ?auto_212251 ?auto_212252 ) ) ( not ( = ?auto_212251 ?auto_212253 ) ) ( not ( = ?auto_212251 ?auto_212254 ) ) ( not ( = ?auto_212251 ?auto_212255 ) ) ( not ( = ?auto_212251 ?auto_212256 ) ) ( not ( = ?auto_212251 ?auto_212257 ) ) ( not ( = ?auto_212251 ?auto_212258 ) ) ( not ( = ?auto_212251 ?auto_212259 ) ) ( not ( = ?auto_212251 ?auto_212260 ) ) ( not ( = ?auto_212251 ?auto_212261 ) ) ( not ( = ?auto_212251 ?auto_212262 ) ) ( not ( = ?auto_212251 ?auto_212263 ) ) ( not ( = ?auto_212251 ?auto_212264 ) ) ( not ( = ?auto_212252 ?auto_212253 ) ) ( not ( = ?auto_212252 ?auto_212254 ) ) ( not ( = ?auto_212252 ?auto_212255 ) ) ( not ( = ?auto_212252 ?auto_212256 ) ) ( not ( = ?auto_212252 ?auto_212257 ) ) ( not ( = ?auto_212252 ?auto_212258 ) ) ( not ( = ?auto_212252 ?auto_212259 ) ) ( not ( = ?auto_212252 ?auto_212260 ) ) ( not ( = ?auto_212252 ?auto_212261 ) ) ( not ( = ?auto_212252 ?auto_212262 ) ) ( not ( = ?auto_212252 ?auto_212263 ) ) ( not ( = ?auto_212252 ?auto_212264 ) ) ( not ( = ?auto_212253 ?auto_212254 ) ) ( not ( = ?auto_212253 ?auto_212255 ) ) ( not ( = ?auto_212253 ?auto_212256 ) ) ( not ( = ?auto_212253 ?auto_212257 ) ) ( not ( = ?auto_212253 ?auto_212258 ) ) ( not ( = ?auto_212253 ?auto_212259 ) ) ( not ( = ?auto_212253 ?auto_212260 ) ) ( not ( = ?auto_212253 ?auto_212261 ) ) ( not ( = ?auto_212253 ?auto_212262 ) ) ( not ( = ?auto_212253 ?auto_212263 ) ) ( not ( = ?auto_212253 ?auto_212264 ) ) ( not ( = ?auto_212254 ?auto_212255 ) ) ( not ( = ?auto_212254 ?auto_212256 ) ) ( not ( = ?auto_212254 ?auto_212257 ) ) ( not ( = ?auto_212254 ?auto_212258 ) ) ( not ( = ?auto_212254 ?auto_212259 ) ) ( not ( = ?auto_212254 ?auto_212260 ) ) ( not ( = ?auto_212254 ?auto_212261 ) ) ( not ( = ?auto_212254 ?auto_212262 ) ) ( not ( = ?auto_212254 ?auto_212263 ) ) ( not ( = ?auto_212254 ?auto_212264 ) ) ( not ( = ?auto_212255 ?auto_212256 ) ) ( not ( = ?auto_212255 ?auto_212257 ) ) ( not ( = ?auto_212255 ?auto_212258 ) ) ( not ( = ?auto_212255 ?auto_212259 ) ) ( not ( = ?auto_212255 ?auto_212260 ) ) ( not ( = ?auto_212255 ?auto_212261 ) ) ( not ( = ?auto_212255 ?auto_212262 ) ) ( not ( = ?auto_212255 ?auto_212263 ) ) ( not ( = ?auto_212255 ?auto_212264 ) ) ( not ( = ?auto_212256 ?auto_212257 ) ) ( not ( = ?auto_212256 ?auto_212258 ) ) ( not ( = ?auto_212256 ?auto_212259 ) ) ( not ( = ?auto_212256 ?auto_212260 ) ) ( not ( = ?auto_212256 ?auto_212261 ) ) ( not ( = ?auto_212256 ?auto_212262 ) ) ( not ( = ?auto_212256 ?auto_212263 ) ) ( not ( = ?auto_212256 ?auto_212264 ) ) ( not ( = ?auto_212257 ?auto_212258 ) ) ( not ( = ?auto_212257 ?auto_212259 ) ) ( not ( = ?auto_212257 ?auto_212260 ) ) ( not ( = ?auto_212257 ?auto_212261 ) ) ( not ( = ?auto_212257 ?auto_212262 ) ) ( not ( = ?auto_212257 ?auto_212263 ) ) ( not ( = ?auto_212257 ?auto_212264 ) ) ( not ( = ?auto_212258 ?auto_212259 ) ) ( not ( = ?auto_212258 ?auto_212260 ) ) ( not ( = ?auto_212258 ?auto_212261 ) ) ( not ( = ?auto_212258 ?auto_212262 ) ) ( not ( = ?auto_212258 ?auto_212263 ) ) ( not ( = ?auto_212258 ?auto_212264 ) ) ( not ( = ?auto_212259 ?auto_212260 ) ) ( not ( = ?auto_212259 ?auto_212261 ) ) ( not ( = ?auto_212259 ?auto_212262 ) ) ( not ( = ?auto_212259 ?auto_212263 ) ) ( not ( = ?auto_212259 ?auto_212264 ) ) ( not ( = ?auto_212260 ?auto_212261 ) ) ( not ( = ?auto_212260 ?auto_212262 ) ) ( not ( = ?auto_212260 ?auto_212263 ) ) ( not ( = ?auto_212260 ?auto_212264 ) ) ( not ( = ?auto_212261 ?auto_212262 ) ) ( not ( = ?auto_212261 ?auto_212263 ) ) ( not ( = ?auto_212261 ?auto_212264 ) ) ( not ( = ?auto_212262 ?auto_212263 ) ) ( not ( = ?auto_212262 ?auto_212264 ) ) ( not ( = ?auto_212263 ?auto_212264 ) ) ( ON ?auto_212262 ?auto_212263 ) ( ON ?auto_212261 ?auto_212262 ) ( ON ?auto_212260 ?auto_212261 ) ( ON ?auto_212259 ?auto_212260 ) ( ON ?auto_212258 ?auto_212259 ) ( ON ?auto_212257 ?auto_212258 ) ( ON ?auto_212256 ?auto_212257 ) ( ON ?auto_212255 ?auto_212256 ) ( ON ?auto_212254 ?auto_212255 ) ( CLEAR ?auto_212252 ) ( ON ?auto_212253 ?auto_212254 ) ( CLEAR ?auto_212253 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_212251 ?auto_212252 ?auto_212253 )
      ( MAKE-13PILE ?auto_212251 ?auto_212252 ?auto_212253 ?auto_212254 ?auto_212255 ?auto_212256 ?auto_212257 ?auto_212258 ?auto_212259 ?auto_212260 ?auto_212261 ?auto_212262 ?auto_212263 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_212278 - BLOCK
      ?auto_212279 - BLOCK
      ?auto_212280 - BLOCK
      ?auto_212281 - BLOCK
      ?auto_212282 - BLOCK
      ?auto_212283 - BLOCK
      ?auto_212284 - BLOCK
      ?auto_212285 - BLOCK
      ?auto_212286 - BLOCK
      ?auto_212287 - BLOCK
      ?auto_212288 - BLOCK
      ?auto_212289 - BLOCK
      ?auto_212290 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_212290 ) ( ON-TABLE ?auto_212278 ) ( ON ?auto_212279 ?auto_212278 ) ( not ( = ?auto_212278 ?auto_212279 ) ) ( not ( = ?auto_212278 ?auto_212280 ) ) ( not ( = ?auto_212278 ?auto_212281 ) ) ( not ( = ?auto_212278 ?auto_212282 ) ) ( not ( = ?auto_212278 ?auto_212283 ) ) ( not ( = ?auto_212278 ?auto_212284 ) ) ( not ( = ?auto_212278 ?auto_212285 ) ) ( not ( = ?auto_212278 ?auto_212286 ) ) ( not ( = ?auto_212278 ?auto_212287 ) ) ( not ( = ?auto_212278 ?auto_212288 ) ) ( not ( = ?auto_212278 ?auto_212289 ) ) ( not ( = ?auto_212278 ?auto_212290 ) ) ( not ( = ?auto_212279 ?auto_212280 ) ) ( not ( = ?auto_212279 ?auto_212281 ) ) ( not ( = ?auto_212279 ?auto_212282 ) ) ( not ( = ?auto_212279 ?auto_212283 ) ) ( not ( = ?auto_212279 ?auto_212284 ) ) ( not ( = ?auto_212279 ?auto_212285 ) ) ( not ( = ?auto_212279 ?auto_212286 ) ) ( not ( = ?auto_212279 ?auto_212287 ) ) ( not ( = ?auto_212279 ?auto_212288 ) ) ( not ( = ?auto_212279 ?auto_212289 ) ) ( not ( = ?auto_212279 ?auto_212290 ) ) ( not ( = ?auto_212280 ?auto_212281 ) ) ( not ( = ?auto_212280 ?auto_212282 ) ) ( not ( = ?auto_212280 ?auto_212283 ) ) ( not ( = ?auto_212280 ?auto_212284 ) ) ( not ( = ?auto_212280 ?auto_212285 ) ) ( not ( = ?auto_212280 ?auto_212286 ) ) ( not ( = ?auto_212280 ?auto_212287 ) ) ( not ( = ?auto_212280 ?auto_212288 ) ) ( not ( = ?auto_212280 ?auto_212289 ) ) ( not ( = ?auto_212280 ?auto_212290 ) ) ( not ( = ?auto_212281 ?auto_212282 ) ) ( not ( = ?auto_212281 ?auto_212283 ) ) ( not ( = ?auto_212281 ?auto_212284 ) ) ( not ( = ?auto_212281 ?auto_212285 ) ) ( not ( = ?auto_212281 ?auto_212286 ) ) ( not ( = ?auto_212281 ?auto_212287 ) ) ( not ( = ?auto_212281 ?auto_212288 ) ) ( not ( = ?auto_212281 ?auto_212289 ) ) ( not ( = ?auto_212281 ?auto_212290 ) ) ( not ( = ?auto_212282 ?auto_212283 ) ) ( not ( = ?auto_212282 ?auto_212284 ) ) ( not ( = ?auto_212282 ?auto_212285 ) ) ( not ( = ?auto_212282 ?auto_212286 ) ) ( not ( = ?auto_212282 ?auto_212287 ) ) ( not ( = ?auto_212282 ?auto_212288 ) ) ( not ( = ?auto_212282 ?auto_212289 ) ) ( not ( = ?auto_212282 ?auto_212290 ) ) ( not ( = ?auto_212283 ?auto_212284 ) ) ( not ( = ?auto_212283 ?auto_212285 ) ) ( not ( = ?auto_212283 ?auto_212286 ) ) ( not ( = ?auto_212283 ?auto_212287 ) ) ( not ( = ?auto_212283 ?auto_212288 ) ) ( not ( = ?auto_212283 ?auto_212289 ) ) ( not ( = ?auto_212283 ?auto_212290 ) ) ( not ( = ?auto_212284 ?auto_212285 ) ) ( not ( = ?auto_212284 ?auto_212286 ) ) ( not ( = ?auto_212284 ?auto_212287 ) ) ( not ( = ?auto_212284 ?auto_212288 ) ) ( not ( = ?auto_212284 ?auto_212289 ) ) ( not ( = ?auto_212284 ?auto_212290 ) ) ( not ( = ?auto_212285 ?auto_212286 ) ) ( not ( = ?auto_212285 ?auto_212287 ) ) ( not ( = ?auto_212285 ?auto_212288 ) ) ( not ( = ?auto_212285 ?auto_212289 ) ) ( not ( = ?auto_212285 ?auto_212290 ) ) ( not ( = ?auto_212286 ?auto_212287 ) ) ( not ( = ?auto_212286 ?auto_212288 ) ) ( not ( = ?auto_212286 ?auto_212289 ) ) ( not ( = ?auto_212286 ?auto_212290 ) ) ( not ( = ?auto_212287 ?auto_212288 ) ) ( not ( = ?auto_212287 ?auto_212289 ) ) ( not ( = ?auto_212287 ?auto_212290 ) ) ( not ( = ?auto_212288 ?auto_212289 ) ) ( not ( = ?auto_212288 ?auto_212290 ) ) ( not ( = ?auto_212289 ?auto_212290 ) ) ( ON ?auto_212289 ?auto_212290 ) ( ON ?auto_212288 ?auto_212289 ) ( ON ?auto_212287 ?auto_212288 ) ( ON ?auto_212286 ?auto_212287 ) ( ON ?auto_212285 ?auto_212286 ) ( ON ?auto_212284 ?auto_212285 ) ( ON ?auto_212283 ?auto_212284 ) ( ON ?auto_212282 ?auto_212283 ) ( ON ?auto_212281 ?auto_212282 ) ( CLEAR ?auto_212279 ) ( ON ?auto_212280 ?auto_212281 ) ( CLEAR ?auto_212280 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_212278 ?auto_212279 ?auto_212280 )
      ( MAKE-13PILE ?auto_212278 ?auto_212279 ?auto_212280 ?auto_212281 ?auto_212282 ?auto_212283 ?auto_212284 ?auto_212285 ?auto_212286 ?auto_212287 ?auto_212288 ?auto_212289 ?auto_212290 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_212304 - BLOCK
      ?auto_212305 - BLOCK
      ?auto_212306 - BLOCK
      ?auto_212307 - BLOCK
      ?auto_212308 - BLOCK
      ?auto_212309 - BLOCK
      ?auto_212310 - BLOCK
      ?auto_212311 - BLOCK
      ?auto_212312 - BLOCK
      ?auto_212313 - BLOCK
      ?auto_212314 - BLOCK
      ?auto_212315 - BLOCK
      ?auto_212316 - BLOCK
    )
    :vars
    (
      ?auto_212317 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_212316 ?auto_212317 ) ( ON-TABLE ?auto_212304 ) ( not ( = ?auto_212304 ?auto_212305 ) ) ( not ( = ?auto_212304 ?auto_212306 ) ) ( not ( = ?auto_212304 ?auto_212307 ) ) ( not ( = ?auto_212304 ?auto_212308 ) ) ( not ( = ?auto_212304 ?auto_212309 ) ) ( not ( = ?auto_212304 ?auto_212310 ) ) ( not ( = ?auto_212304 ?auto_212311 ) ) ( not ( = ?auto_212304 ?auto_212312 ) ) ( not ( = ?auto_212304 ?auto_212313 ) ) ( not ( = ?auto_212304 ?auto_212314 ) ) ( not ( = ?auto_212304 ?auto_212315 ) ) ( not ( = ?auto_212304 ?auto_212316 ) ) ( not ( = ?auto_212304 ?auto_212317 ) ) ( not ( = ?auto_212305 ?auto_212306 ) ) ( not ( = ?auto_212305 ?auto_212307 ) ) ( not ( = ?auto_212305 ?auto_212308 ) ) ( not ( = ?auto_212305 ?auto_212309 ) ) ( not ( = ?auto_212305 ?auto_212310 ) ) ( not ( = ?auto_212305 ?auto_212311 ) ) ( not ( = ?auto_212305 ?auto_212312 ) ) ( not ( = ?auto_212305 ?auto_212313 ) ) ( not ( = ?auto_212305 ?auto_212314 ) ) ( not ( = ?auto_212305 ?auto_212315 ) ) ( not ( = ?auto_212305 ?auto_212316 ) ) ( not ( = ?auto_212305 ?auto_212317 ) ) ( not ( = ?auto_212306 ?auto_212307 ) ) ( not ( = ?auto_212306 ?auto_212308 ) ) ( not ( = ?auto_212306 ?auto_212309 ) ) ( not ( = ?auto_212306 ?auto_212310 ) ) ( not ( = ?auto_212306 ?auto_212311 ) ) ( not ( = ?auto_212306 ?auto_212312 ) ) ( not ( = ?auto_212306 ?auto_212313 ) ) ( not ( = ?auto_212306 ?auto_212314 ) ) ( not ( = ?auto_212306 ?auto_212315 ) ) ( not ( = ?auto_212306 ?auto_212316 ) ) ( not ( = ?auto_212306 ?auto_212317 ) ) ( not ( = ?auto_212307 ?auto_212308 ) ) ( not ( = ?auto_212307 ?auto_212309 ) ) ( not ( = ?auto_212307 ?auto_212310 ) ) ( not ( = ?auto_212307 ?auto_212311 ) ) ( not ( = ?auto_212307 ?auto_212312 ) ) ( not ( = ?auto_212307 ?auto_212313 ) ) ( not ( = ?auto_212307 ?auto_212314 ) ) ( not ( = ?auto_212307 ?auto_212315 ) ) ( not ( = ?auto_212307 ?auto_212316 ) ) ( not ( = ?auto_212307 ?auto_212317 ) ) ( not ( = ?auto_212308 ?auto_212309 ) ) ( not ( = ?auto_212308 ?auto_212310 ) ) ( not ( = ?auto_212308 ?auto_212311 ) ) ( not ( = ?auto_212308 ?auto_212312 ) ) ( not ( = ?auto_212308 ?auto_212313 ) ) ( not ( = ?auto_212308 ?auto_212314 ) ) ( not ( = ?auto_212308 ?auto_212315 ) ) ( not ( = ?auto_212308 ?auto_212316 ) ) ( not ( = ?auto_212308 ?auto_212317 ) ) ( not ( = ?auto_212309 ?auto_212310 ) ) ( not ( = ?auto_212309 ?auto_212311 ) ) ( not ( = ?auto_212309 ?auto_212312 ) ) ( not ( = ?auto_212309 ?auto_212313 ) ) ( not ( = ?auto_212309 ?auto_212314 ) ) ( not ( = ?auto_212309 ?auto_212315 ) ) ( not ( = ?auto_212309 ?auto_212316 ) ) ( not ( = ?auto_212309 ?auto_212317 ) ) ( not ( = ?auto_212310 ?auto_212311 ) ) ( not ( = ?auto_212310 ?auto_212312 ) ) ( not ( = ?auto_212310 ?auto_212313 ) ) ( not ( = ?auto_212310 ?auto_212314 ) ) ( not ( = ?auto_212310 ?auto_212315 ) ) ( not ( = ?auto_212310 ?auto_212316 ) ) ( not ( = ?auto_212310 ?auto_212317 ) ) ( not ( = ?auto_212311 ?auto_212312 ) ) ( not ( = ?auto_212311 ?auto_212313 ) ) ( not ( = ?auto_212311 ?auto_212314 ) ) ( not ( = ?auto_212311 ?auto_212315 ) ) ( not ( = ?auto_212311 ?auto_212316 ) ) ( not ( = ?auto_212311 ?auto_212317 ) ) ( not ( = ?auto_212312 ?auto_212313 ) ) ( not ( = ?auto_212312 ?auto_212314 ) ) ( not ( = ?auto_212312 ?auto_212315 ) ) ( not ( = ?auto_212312 ?auto_212316 ) ) ( not ( = ?auto_212312 ?auto_212317 ) ) ( not ( = ?auto_212313 ?auto_212314 ) ) ( not ( = ?auto_212313 ?auto_212315 ) ) ( not ( = ?auto_212313 ?auto_212316 ) ) ( not ( = ?auto_212313 ?auto_212317 ) ) ( not ( = ?auto_212314 ?auto_212315 ) ) ( not ( = ?auto_212314 ?auto_212316 ) ) ( not ( = ?auto_212314 ?auto_212317 ) ) ( not ( = ?auto_212315 ?auto_212316 ) ) ( not ( = ?auto_212315 ?auto_212317 ) ) ( not ( = ?auto_212316 ?auto_212317 ) ) ( ON ?auto_212315 ?auto_212316 ) ( ON ?auto_212314 ?auto_212315 ) ( ON ?auto_212313 ?auto_212314 ) ( ON ?auto_212312 ?auto_212313 ) ( ON ?auto_212311 ?auto_212312 ) ( ON ?auto_212310 ?auto_212311 ) ( ON ?auto_212309 ?auto_212310 ) ( ON ?auto_212308 ?auto_212309 ) ( ON ?auto_212307 ?auto_212308 ) ( ON ?auto_212306 ?auto_212307 ) ( CLEAR ?auto_212304 ) ( ON ?auto_212305 ?auto_212306 ) ( CLEAR ?auto_212305 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_212304 ?auto_212305 )
      ( MAKE-13PILE ?auto_212304 ?auto_212305 ?auto_212306 ?auto_212307 ?auto_212308 ?auto_212309 ?auto_212310 ?auto_212311 ?auto_212312 ?auto_212313 ?auto_212314 ?auto_212315 ?auto_212316 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_212331 - BLOCK
      ?auto_212332 - BLOCK
      ?auto_212333 - BLOCK
      ?auto_212334 - BLOCK
      ?auto_212335 - BLOCK
      ?auto_212336 - BLOCK
      ?auto_212337 - BLOCK
      ?auto_212338 - BLOCK
      ?auto_212339 - BLOCK
      ?auto_212340 - BLOCK
      ?auto_212341 - BLOCK
      ?auto_212342 - BLOCK
      ?auto_212343 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_212343 ) ( ON-TABLE ?auto_212331 ) ( not ( = ?auto_212331 ?auto_212332 ) ) ( not ( = ?auto_212331 ?auto_212333 ) ) ( not ( = ?auto_212331 ?auto_212334 ) ) ( not ( = ?auto_212331 ?auto_212335 ) ) ( not ( = ?auto_212331 ?auto_212336 ) ) ( not ( = ?auto_212331 ?auto_212337 ) ) ( not ( = ?auto_212331 ?auto_212338 ) ) ( not ( = ?auto_212331 ?auto_212339 ) ) ( not ( = ?auto_212331 ?auto_212340 ) ) ( not ( = ?auto_212331 ?auto_212341 ) ) ( not ( = ?auto_212331 ?auto_212342 ) ) ( not ( = ?auto_212331 ?auto_212343 ) ) ( not ( = ?auto_212332 ?auto_212333 ) ) ( not ( = ?auto_212332 ?auto_212334 ) ) ( not ( = ?auto_212332 ?auto_212335 ) ) ( not ( = ?auto_212332 ?auto_212336 ) ) ( not ( = ?auto_212332 ?auto_212337 ) ) ( not ( = ?auto_212332 ?auto_212338 ) ) ( not ( = ?auto_212332 ?auto_212339 ) ) ( not ( = ?auto_212332 ?auto_212340 ) ) ( not ( = ?auto_212332 ?auto_212341 ) ) ( not ( = ?auto_212332 ?auto_212342 ) ) ( not ( = ?auto_212332 ?auto_212343 ) ) ( not ( = ?auto_212333 ?auto_212334 ) ) ( not ( = ?auto_212333 ?auto_212335 ) ) ( not ( = ?auto_212333 ?auto_212336 ) ) ( not ( = ?auto_212333 ?auto_212337 ) ) ( not ( = ?auto_212333 ?auto_212338 ) ) ( not ( = ?auto_212333 ?auto_212339 ) ) ( not ( = ?auto_212333 ?auto_212340 ) ) ( not ( = ?auto_212333 ?auto_212341 ) ) ( not ( = ?auto_212333 ?auto_212342 ) ) ( not ( = ?auto_212333 ?auto_212343 ) ) ( not ( = ?auto_212334 ?auto_212335 ) ) ( not ( = ?auto_212334 ?auto_212336 ) ) ( not ( = ?auto_212334 ?auto_212337 ) ) ( not ( = ?auto_212334 ?auto_212338 ) ) ( not ( = ?auto_212334 ?auto_212339 ) ) ( not ( = ?auto_212334 ?auto_212340 ) ) ( not ( = ?auto_212334 ?auto_212341 ) ) ( not ( = ?auto_212334 ?auto_212342 ) ) ( not ( = ?auto_212334 ?auto_212343 ) ) ( not ( = ?auto_212335 ?auto_212336 ) ) ( not ( = ?auto_212335 ?auto_212337 ) ) ( not ( = ?auto_212335 ?auto_212338 ) ) ( not ( = ?auto_212335 ?auto_212339 ) ) ( not ( = ?auto_212335 ?auto_212340 ) ) ( not ( = ?auto_212335 ?auto_212341 ) ) ( not ( = ?auto_212335 ?auto_212342 ) ) ( not ( = ?auto_212335 ?auto_212343 ) ) ( not ( = ?auto_212336 ?auto_212337 ) ) ( not ( = ?auto_212336 ?auto_212338 ) ) ( not ( = ?auto_212336 ?auto_212339 ) ) ( not ( = ?auto_212336 ?auto_212340 ) ) ( not ( = ?auto_212336 ?auto_212341 ) ) ( not ( = ?auto_212336 ?auto_212342 ) ) ( not ( = ?auto_212336 ?auto_212343 ) ) ( not ( = ?auto_212337 ?auto_212338 ) ) ( not ( = ?auto_212337 ?auto_212339 ) ) ( not ( = ?auto_212337 ?auto_212340 ) ) ( not ( = ?auto_212337 ?auto_212341 ) ) ( not ( = ?auto_212337 ?auto_212342 ) ) ( not ( = ?auto_212337 ?auto_212343 ) ) ( not ( = ?auto_212338 ?auto_212339 ) ) ( not ( = ?auto_212338 ?auto_212340 ) ) ( not ( = ?auto_212338 ?auto_212341 ) ) ( not ( = ?auto_212338 ?auto_212342 ) ) ( not ( = ?auto_212338 ?auto_212343 ) ) ( not ( = ?auto_212339 ?auto_212340 ) ) ( not ( = ?auto_212339 ?auto_212341 ) ) ( not ( = ?auto_212339 ?auto_212342 ) ) ( not ( = ?auto_212339 ?auto_212343 ) ) ( not ( = ?auto_212340 ?auto_212341 ) ) ( not ( = ?auto_212340 ?auto_212342 ) ) ( not ( = ?auto_212340 ?auto_212343 ) ) ( not ( = ?auto_212341 ?auto_212342 ) ) ( not ( = ?auto_212341 ?auto_212343 ) ) ( not ( = ?auto_212342 ?auto_212343 ) ) ( ON ?auto_212342 ?auto_212343 ) ( ON ?auto_212341 ?auto_212342 ) ( ON ?auto_212340 ?auto_212341 ) ( ON ?auto_212339 ?auto_212340 ) ( ON ?auto_212338 ?auto_212339 ) ( ON ?auto_212337 ?auto_212338 ) ( ON ?auto_212336 ?auto_212337 ) ( ON ?auto_212335 ?auto_212336 ) ( ON ?auto_212334 ?auto_212335 ) ( ON ?auto_212333 ?auto_212334 ) ( CLEAR ?auto_212331 ) ( ON ?auto_212332 ?auto_212333 ) ( CLEAR ?auto_212332 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_212331 ?auto_212332 )
      ( MAKE-13PILE ?auto_212331 ?auto_212332 ?auto_212333 ?auto_212334 ?auto_212335 ?auto_212336 ?auto_212337 ?auto_212338 ?auto_212339 ?auto_212340 ?auto_212341 ?auto_212342 ?auto_212343 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_212357 - BLOCK
      ?auto_212358 - BLOCK
      ?auto_212359 - BLOCK
      ?auto_212360 - BLOCK
      ?auto_212361 - BLOCK
      ?auto_212362 - BLOCK
      ?auto_212363 - BLOCK
      ?auto_212364 - BLOCK
      ?auto_212365 - BLOCK
      ?auto_212366 - BLOCK
      ?auto_212367 - BLOCK
      ?auto_212368 - BLOCK
      ?auto_212369 - BLOCK
    )
    :vars
    (
      ?auto_212370 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_212369 ?auto_212370 ) ( not ( = ?auto_212357 ?auto_212358 ) ) ( not ( = ?auto_212357 ?auto_212359 ) ) ( not ( = ?auto_212357 ?auto_212360 ) ) ( not ( = ?auto_212357 ?auto_212361 ) ) ( not ( = ?auto_212357 ?auto_212362 ) ) ( not ( = ?auto_212357 ?auto_212363 ) ) ( not ( = ?auto_212357 ?auto_212364 ) ) ( not ( = ?auto_212357 ?auto_212365 ) ) ( not ( = ?auto_212357 ?auto_212366 ) ) ( not ( = ?auto_212357 ?auto_212367 ) ) ( not ( = ?auto_212357 ?auto_212368 ) ) ( not ( = ?auto_212357 ?auto_212369 ) ) ( not ( = ?auto_212357 ?auto_212370 ) ) ( not ( = ?auto_212358 ?auto_212359 ) ) ( not ( = ?auto_212358 ?auto_212360 ) ) ( not ( = ?auto_212358 ?auto_212361 ) ) ( not ( = ?auto_212358 ?auto_212362 ) ) ( not ( = ?auto_212358 ?auto_212363 ) ) ( not ( = ?auto_212358 ?auto_212364 ) ) ( not ( = ?auto_212358 ?auto_212365 ) ) ( not ( = ?auto_212358 ?auto_212366 ) ) ( not ( = ?auto_212358 ?auto_212367 ) ) ( not ( = ?auto_212358 ?auto_212368 ) ) ( not ( = ?auto_212358 ?auto_212369 ) ) ( not ( = ?auto_212358 ?auto_212370 ) ) ( not ( = ?auto_212359 ?auto_212360 ) ) ( not ( = ?auto_212359 ?auto_212361 ) ) ( not ( = ?auto_212359 ?auto_212362 ) ) ( not ( = ?auto_212359 ?auto_212363 ) ) ( not ( = ?auto_212359 ?auto_212364 ) ) ( not ( = ?auto_212359 ?auto_212365 ) ) ( not ( = ?auto_212359 ?auto_212366 ) ) ( not ( = ?auto_212359 ?auto_212367 ) ) ( not ( = ?auto_212359 ?auto_212368 ) ) ( not ( = ?auto_212359 ?auto_212369 ) ) ( not ( = ?auto_212359 ?auto_212370 ) ) ( not ( = ?auto_212360 ?auto_212361 ) ) ( not ( = ?auto_212360 ?auto_212362 ) ) ( not ( = ?auto_212360 ?auto_212363 ) ) ( not ( = ?auto_212360 ?auto_212364 ) ) ( not ( = ?auto_212360 ?auto_212365 ) ) ( not ( = ?auto_212360 ?auto_212366 ) ) ( not ( = ?auto_212360 ?auto_212367 ) ) ( not ( = ?auto_212360 ?auto_212368 ) ) ( not ( = ?auto_212360 ?auto_212369 ) ) ( not ( = ?auto_212360 ?auto_212370 ) ) ( not ( = ?auto_212361 ?auto_212362 ) ) ( not ( = ?auto_212361 ?auto_212363 ) ) ( not ( = ?auto_212361 ?auto_212364 ) ) ( not ( = ?auto_212361 ?auto_212365 ) ) ( not ( = ?auto_212361 ?auto_212366 ) ) ( not ( = ?auto_212361 ?auto_212367 ) ) ( not ( = ?auto_212361 ?auto_212368 ) ) ( not ( = ?auto_212361 ?auto_212369 ) ) ( not ( = ?auto_212361 ?auto_212370 ) ) ( not ( = ?auto_212362 ?auto_212363 ) ) ( not ( = ?auto_212362 ?auto_212364 ) ) ( not ( = ?auto_212362 ?auto_212365 ) ) ( not ( = ?auto_212362 ?auto_212366 ) ) ( not ( = ?auto_212362 ?auto_212367 ) ) ( not ( = ?auto_212362 ?auto_212368 ) ) ( not ( = ?auto_212362 ?auto_212369 ) ) ( not ( = ?auto_212362 ?auto_212370 ) ) ( not ( = ?auto_212363 ?auto_212364 ) ) ( not ( = ?auto_212363 ?auto_212365 ) ) ( not ( = ?auto_212363 ?auto_212366 ) ) ( not ( = ?auto_212363 ?auto_212367 ) ) ( not ( = ?auto_212363 ?auto_212368 ) ) ( not ( = ?auto_212363 ?auto_212369 ) ) ( not ( = ?auto_212363 ?auto_212370 ) ) ( not ( = ?auto_212364 ?auto_212365 ) ) ( not ( = ?auto_212364 ?auto_212366 ) ) ( not ( = ?auto_212364 ?auto_212367 ) ) ( not ( = ?auto_212364 ?auto_212368 ) ) ( not ( = ?auto_212364 ?auto_212369 ) ) ( not ( = ?auto_212364 ?auto_212370 ) ) ( not ( = ?auto_212365 ?auto_212366 ) ) ( not ( = ?auto_212365 ?auto_212367 ) ) ( not ( = ?auto_212365 ?auto_212368 ) ) ( not ( = ?auto_212365 ?auto_212369 ) ) ( not ( = ?auto_212365 ?auto_212370 ) ) ( not ( = ?auto_212366 ?auto_212367 ) ) ( not ( = ?auto_212366 ?auto_212368 ) ) ( not ( = ?auto_212366 ?auto_212369 ) ) ( not ( = ?auto_212366 ?auto_212370 ) ) ( not ( = ?auto_212367 ?auto_212368 ) ) ( not ( = ?auto_212367 ?auto_212369 ) ) ( not ( = ?auto_212367 ?auto_212370 ) ) ( not ( = ?auto_212368 ?auto_212369 ) ) ( not ( = ?auto_212368 ?auto_212370 ) ) ( not ( = ?auto_212369 ?auto_212370 ) ) ( ON ?auto_212368 ?auto_212369 ) ( ON ?auto_212367 ?auto_212368 ) ( ON ?auto_212366 ?auto_212367 ) ( ON ?auto_212365 ?auto_212366 ) ( ON ?auto_212364 ?auto_212365 ) ( ON ?auto_212363 ?auto_212364 ) ( ON ?auto_212362 ?auto_212363 ) ( ON ?auto_212361 ?auto_212362 ) ( ON ?auto_212360 ?auto_212361 ) ( ON ?auto_212359 ?auto_212360 ) ( ON ?auto_212358 ?auto_212359 ) ( ON ?auto_212357 ?auto_212358 ) ( CLEAR ?auto_212357 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_212357 )
      ( MAKE-13PILE ?auto_212357 ?auto_212358 ?auto_212359 ?auto_212360 ?auto_212361 ?auto_212362 ?auto_212363 ?auto_212364 ?auto_212365 ?auto_212366 ?auto_212367 ?auto_212368 ?auto_212369 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_212384 - BLOCK
      ?auto_212385 - BLOCK
      ?auto_212386 - BLOCK
      ?auto_212387 - BLOCK
      ?auto_212388 - BLOCK
      ?auto_212389 - BLOCK
      ?auto_212390 - BLOCK
      ?auto_212391 - BLOCK
      ?auto_212392 - BLOCK
      ?auto_212393 - BLOCK
      ?auto_212394 - BLOCK
      ?auto_212395 - BLOCK
      ?auto_212396 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_212396 ) ( not ( = ?auto_212384 ?auto_212385 ) ) ( not ( = ?auto_212384 ?auto_212386 ) ) ( not ( = ?auto_212384 ?auto_212387 ) ) ( not ( = ?auto_212384 ?auto_212388 ) ) ( not ( = ?auto_212384 ?auto_212389 ) ) ( not ( = ?auto_212384 ?auto_212390 ) ) ( not ( = ?auto_212384 ?auto_212391 ) ) ( not ( = ?auto_212384 ?auto_212392 ) ) ( not ( = ?auto_212384 ?auto_212393 ) ) ( not ( = ?auto_212384 ?auto_212394 ) ) ( not ( = ?auto_212384 ?auto_212395 ) ) ( not ( = ?auto_212384 ?auto_212396 ) ) ( not ( = ?auto_212385 ?auto_212386 ) ) ( not ( = ?auto_212385 ?auto_212387 ) ) ( not ( = ?auto_212385 ?auto_212388 ) ) ( not ( = ?auto_212385 ?auto_212389 ) ) ( not ( = ?auto_212385 ?auto_212390 ) ) ( not ( = ?auto_212385 ?auto_212391 ) ) ( not ( = ?auto_212385 ?auto_212392 ) ) ( not ( = ?auto_212385 ?auto_212393 ) ) ( not ( = ?auto_212385 ?auto_212394 ) ) ( not ( = ?auto_212385 ?auto_212395 ) ) ( not ( = ?auto_212385 ?auto_212396 ) ) ( not ( = ?auto_212386 ?auto_212387 ) ) ( not ( = ?auto_212386 ?auto_212388 ) ) ( not ( = ?auto_212386 ?auto_212389 ) ) ( not ( = ?auto_212386 ?auto_212390 ) ) ( not ( = ?auto_212386 ?auto_212391 ) ) ( not ( = ?auto_212386 ?auto_212392 ) ) ( not ( = ?auto_212386 ?auto_212393 ) ) ( not ( = ?auto_212386 ?auto_212394 ) ) ( not ( = ?auto_212386 ?auto_212395 ) ) ( not ( = ?auto_212386 ?auto_212396 ) ) ( not ( = ?auto_212387 ?auto_212388 ) ) ( not ( = ?auto_212387 ?auto_212389 ) ) ( not ( = ?auto_212387 ?auto_212390 ) ) ( not ( = ?auto_212387 ?auto_212391 ) ) ( not ( = ?auto_212387 ?auto_212392 ) ) ( not ( = ?auto_212387 ?auto_212393 ) ) ( not ( = ?auto_212387 ?auto_212394 ) ) ( not ( = ?auto_212387 ?auto_212395 ) ) ( not ( = ?auto_212387 ?auto_212396 ) ) ( not ( = ?auto_212388 ?auto_212389 ) ) ( not ( = ?auto_212388 ?auto_212390 ) ) ( not ( = ?auto_212388 ?auto_212391 ) ) ( not ( = ?auto_212388 ?auto_212392 ) ) ( not ( = ?auto_212388 ?auto_212393 ) ) ( not ( = ?auto_212388 ?auto_212394 ) ) ( not ( = ?auto_212388 ?auto_212395 ) ) ( not ( = ?auto_212388 ?auto_212396 ) ) ( not ( = ?auto_212389 ?auto_212390 ) ) ( not ( = ?auto_212389 ?auto_212391 ) ) ( not ( = ?auto_212389 ?auto_212392 ) ) ( not ( = ?auto_212389 ?auto_212393 ) ) ( not ( = ?auto_212389 ?auto_212394 ) ) ( not ( = ?auto_212389 ?auto_212395 ) ) ( not ( = ?auto_212389 ?auto_212396 ) ) ( not ( = ?auto_212390 ?auto_212391 ) ) ( not ( = ?auto_212390 ?auto_212392 ) ) ( not ( = ?auto_212390 ?auto_212393 ) ) ( not ( = ?auto_212390 ?auto_212394 ) ) ( not ( = ?auto_212390 ?auto_212395 ) ) ( not ( = ?auto_212390 ?auto_212396 ) ) ( not ( = ?auto_212391 ?auto_212392 ) ) ( not ( = ?auto_212391 ?auto_212393 ) ) ( not ( = ?auto_212391 ?auto_212394 ) ) ( not ( = ?auto_212391 ?auto_212395 ) ) ( not ( = ?auto_212391 ?auto_212396 ) ) ( not ( = ?auto_212392 ?auto_212393 ) ) ( not ( = ?auto_212392 ?auto_212394 ) ) ( not ( = ?auto_212392 ?auto_212395 ) ) ( not ( = ?auto_212392 ?auto_212396 ) ) ( not ( = ?auto_212393 ?auto_212394 ) ) ( not ( = ?auto_212393 ?auto_212395 ) ) ( not ( = ?auto_212393 ?auto_212396 ) ) ( not ( = ?auto_212394 ?auto_212395 ) ) ( not ( = ?auto_212394 ?auto_212396 ) ) ( not ( = ?auto_212395 ?auto_212396 ) ) ( ON ?auto_212395 ?auto_212396 ) ( ON ?auto_212394 ?auto_212395 ) ( ON ?auto_212393 ?auto_212394 ) ( ON ?auto_212392 ?auto_212393 ) ( ON ?auto_212391 ?auto_212392 ) ( ON ?auto_212390 ?auto_212391 ) ( ON ?auto_212389 ?auto_212390 ) ( ON ?auto_212388 ?auto_212389 ) ( ON ?auto_212387 ?auto_212388 ) ( ON ?auto_212386 ?auto_212387 ) ( ON ?auto_212385 ?auto_212386 ) ( ON ?auto_212384 ?auto_212385 ) ( CLEAR ?auto_212384 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_212384 )
      ( MAKE-13PILE ?auto_212384 ?auto_212385 ?auto_212386 ?auto_212387 ?auto_212388 ?auto_212389 ?auto_212390 ?auto_212391 ?auto_212392 ?auto_212393 ?auto_212394 ?auto_212395 ?auto_212396 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_212410 - BLOCK
      ?auto_212411 - BLOCK
      ?auto_212412 - BLOCK
      ?auto_212413 - BLOCK
      ?auto_212414 - BLOCK
      ?auto_212415 - BLOCK
      ?auto_212416 - BLOCK
      ?auto_212417 - BLOCK
      ?auto_212418 - BLOCK
      ?auto_212419 - BLOCK
      ?auto_212420 - BLOCK
      ?auto_212421 - BLOCK
      ?auto_212422 - BLOCK
    )
    :vars
    (
      ?auto_212423 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_212410 ?auto_212411 ) ) ( not ( = ?auto_212410 ?auto_212412 ) ) ( not ( = ?auto_212410 ?auto_212413 ) ) ( not ( = ?auto_212410 ?auto_212414 ) ) ( not ( = ?auto_212410 ?auto_212415 ) ) ( not ( = ?auto_212410 ?auto_212416 ) ) ( not ( = ?auto_212410 ?auto_212417 ) ) ( not ( = ?auto_212410 ?auto_212418 ) ) ( not ( = ?auto_212410 ?auto_212419 ) ) ( not ( = ?auto_212410 ?auto_212420 ) ) ( not ( = ?auto_212410 ?auto_212421 ) ) ( not ( = ?auto_212410 ?auto_212422 ) ) ( not ( = ?auto_212411 ?auto_212412 ) ) ( not ( = ?auto_212411 ?auto_212413 ) ) ( not ( = ?auto_212411 ?auto_212414 ) ) ( not ( = ?auto_212411 ?auto_212415 ) ) ( not ( = ?auto_212411 ?auto_212416 ) ) ( not ( = ?auto_212411 ?auto_212417 ) ) ( not ( = ?auto_212411 ?auto_212418 ) ) ( not ( = ?auto_212411 ?auto_212419 ) ) ( not ( = ?auto_212411 ?auto_212420 ) ) ( not ( = ?auto_212411 ?auto_212421 ) ) ( not ( = ?auto_212411 ?auto_212422 ) ) ( not ( = ?auto_212412 ?auto_212413 ) ) ( not ( = ?auto_212412 ?auto_212414 ) ) ( not ( = ?auto_212412 ?auto_212415 ) ) ( not ( = ?auto_212412 ?auto_212416 ) ) ( not ( = ?auto_212412 ?auto_212417 ) ) ( not ( = ?auto_212412 ?auto_212418 ) ) ( not ( = ?auto_212412 ?auto_212419 ) ) ( not ( = ?auto_212412 ?auto_212420 ) ) ( not ( = ?auto_212412 ?auto_212421 ) ) ( not ( = ?auto_212412 ?auto_212422 ) ) ( not ( = ?auto_212413 ?auto_212414 ) ) ( not ( = ?auto_212413 ?auto_212415 ) ) ( not ( = ?auto_212413 ?auto_212416 ) ) ( not ( = ?auto_212413 ?auto_212417 ) ) ( not ( = ?auto_212413 ?auto_212418 ) ) ( not ( = ?auto_212413 ?auto_212419 ) ) ( not ( = ?auto_212413 ?auto_212420 ) ) ( not ( = ?auto_212413 ?auto_212421 ) ) ( not ( = ?auto_212413 ?auto_212422 ) ) ( not ( = ?auto_212414 ?auto_212415 ) ) ( not ( = ?auto_212414 ?auto_212416 ) ) ( not ( = ?auto_212414 ?auto_212417 ) ) ( not ( = ?auto_212414 ?auto_212418 ) ) ( not ( = ?auto_212414 ?auto_212419 ) ) ( not ( = ?auto_212414 ?auto_212420 ) ) ( not ( = ?auto_212414 ?auto_212421 ) ) ( not ( = ?auto_212414 ?auto_212422 ) ) ( not ( = ?auto_212415 ?auto_212416 ) ) ( not ( = ?auto_212415 ?auto_212417 ) ) ( not ( = ?auto_212415 ?auto_212418 ) ) ( not ( = ?auto_212415 ?auto_212419 ) ) ( not ( = ?auto_212415 ?auto_212420 ) ) ( not ( = ?auto_212415 ?auto_212421 ) ) ( not ( = ?auto_212415 ?auto_212422 ) ) ( not ( = ?auto_212416 ?auto_212417 ) ) ( not ( = ?auto_212416 ?auto_212418 ) ) ( not ( = ?auto_212416 ?auto_212419 ) ) ( not ( = ?auto_212416 ?auto_212420 ) ) ( not ( = ?auto_212416 ?auto_212421 ) ) ( not ( = ?auto_212416 ?auto_212422 ) ) ( not ( = ?auto_212417 ?auto_212418 ) ) ( not ( = ?auto_212417 ?auto_212419 ) ) ( not ( = ?auto_212417 ?auto_212420 ) ) ( not ( = ?auto_212417 ?auto_212421 ) ) ( not ( = ?auto_212417 ?auto_212422 ) ) ( not ( = ?auto_212418 ?auto_212419 ) ) ( not ( = ?auto_212418 ?auto_212420 ) ) ( not ( = ?auto_212418 ?auto_212421 ) ) ( not ( = ?auto_212418 ?auto_212422 ) ) ( not ( = ?auto_212419 ?auto_212420 ) ) ( not ( = ?auto_212419 ?auto_212421 ) ) ( not ( = ?auto_212419 ?auto_212422 ) ) ( not ( = ?auto_212420 ?auto_212421 ) ) ( not ( = ?auto_212420 ?auto_212422 ) ) ( not ( = ?auto_212421 ?auto_212422 ) ) ( ON ?auto_212410 ?auto_212423 ) ( not ( = ?auto_212422 ?auto_212423 ) ) ( not ( = ?auto_212421 ?auto_212423 ) ) ( not ( = ?auto_212420 ?auto_212423 ) ) ( not ( = ?auto_212419 ?auto_212423 ) ) ( not ( = ?auto_212418 ?auto_212423 ) ) ( not ( = ?auto_212417 ?auto_212423 ) ) ( not ( = ?auto_212416 ?auto_212423 ) ) ( not ( = ?auto_212415 ?auto_212423 ) ) ( not ( = ?auto_212414 ?auto_212423 ) ) ( not ( = ?auto_212413 ?auto_212423 ) ) ( not ( = ?auto_212412 ?auto_212423 ) ) ( not ( = ?auto_212411 ?auto_212423 ) ) ( not ( = ?auto_212410 ?auto_212423 ) ) ( ON ?auto_212411 ?auto_212410 ) ( ON ?auto_212412 ?auto_212411 ) ( ON ?auto_212413 ?auto_212412 ) ( ON ?auto_212414 ?auto_212413 ) ( ON ?auto_212415 ?auto_212414 ) ( ON ?auto_212416 ?auto_212415 ) ( ON ?auto_212417 ?auto_212416 ) ( ON ?auto_212418 ?auto_212417 ) ( ON ?auto_212419 ?auto_212418 ) ( ON ?auto_212420 ?auto_212419 ) ( ON ?auto_212421 ?auto_212420 ) ( ON ?auto_212422 ?auto_212421 ) ( CLEAR ?auto_212422 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_212422 ?auto_212421 ?auto_212420 ?auto_212419 ?auto_212418 ?auto_212417 ?auto_212416 ?auto_212415 ?auto_212414 ?auto_212413 ?auto_212412 ?auto_212411 ?auto_212410 )
      ( MAKE-13PILE ?auto_212410 ?auto_212411 ?auto_212412 ?auto_212413 ?auto_212414 ?auto_212415 ?auto_212416 ?auto_212417 ?auto_212418 ?auto_212419 ?auto_212420 ?auto_212421 ?auto_212422 ) )
  )

)

