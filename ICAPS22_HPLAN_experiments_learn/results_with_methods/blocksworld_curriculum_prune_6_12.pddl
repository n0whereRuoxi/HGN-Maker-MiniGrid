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
      ?auto_14997 - BLOCK
    )
    :vars
    (
      ?auto_14998 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14997 ?auto_14998 ) ( CLEAR ?auto_14997 ) ( HAND-EMPTY ) ( not ( = ?auto_14997 ?auto_14998 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_14997 ?auto_14998 )
      ( !PUTDOWN ?auto_14997 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15004 - BLOCK
      ?auto_15005 - BLOCK
    )
    :vars
    (
      ?auto_15006 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_15004 ) ( ON ?auto_15005 ?auto_15006 ) ( CLEAR ?auto_15005 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15004 ) ( not ( = ?auto_15004 ?auto_15005 ) ) ( not ( = ?auto_15004 ?auto_15006 ) ) ( not ( = ?auto_15005 ?auto_15006 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15005 ?auto_15006 )
      ( !STACK ?auto_15005 ?auto_15004 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15014 - BLOCK
      ?auto_15015 - BLOCK
    )
    :vars
    (
      ?auto_15016 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15015 ?auto_15016 ) ( not ( = ?auto_15014 ?auto_15015 ) ) ( not ( = ?auto_15014 ?auto_15016 ) ) ( not ( = ?auto_15015 ?auto_15016 ) ) ( ON ?auto_15014 ?auto_15015 ) ( CLEAR ?auto_15014 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_15014 )
      ( MAKE-2PILE ?auto_15014 ?auto_15015 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15025 - BLOCK
      ?auto_15026 - BLOCK
      ?auto_15027 - BLOCK
    )
    :vars
    (
      ?auto_15028 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_15026 ) ( ON ?auto_15027 ?auto_15028 ) ( CLEAR ?auto_15027 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15025 ) ( ON ?auto_15026 ?auto_15025 ) ( not ( = ?auto_15025 ?auto_15026 ) ) ( not ( = ?auto_15025 ?auto_15027 ) ) ( not ( = ?auto_15025 ?auto_15028 ) ) ( not ( = ?auto_15026 ?auto_15027 ) ) ( not ( = ?auto_15026 ?auto_15028 ) ) ( not ( = ?auto_15027 ?auto_15028 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15027 ?auto_15028 )
      ( !STACK ?auto_15027 ?auto_15026 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15039 - BLOCK
      ?auto_15040 - BLOCK
      ?auto_15041 - BLOCK
    )
    :vars
    (
      ?auto_15042 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15041 ?auto_15042 ) ( ON-TABLE ?auto_15039 ) ( not ( = ?auto_15039 ?auto_15040 ) ) ( not ( = ?auto_15039 ?auto_15041 ) ) ( not ( = ?auto_15039 ?auto_15042 ) ) ( not ( = ?auto_15040 ?auto_15041 ) ) ( not ( = ?auto_15040 ?auto_15042 ) ) ( not ( = ?auto_15041 ?auto_15042 ) ) ( CLEAR ?auto_15039 ) ( ON ?auto_15040 ?auto_15041 ) ( CLEAR ?auto_15040 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15039 ?auto_15040 )
      ( MAKE-3PILE ?auto_15039 ?auto_15040 ?auto_15041 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15053 - BLOCK
      ?auto_15054 - BLOCK
      ?auto_15055 - BLOCK
    )
    :vars
    (
      ?auto_15056 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15055 ?auto_15056 ) ( not ( = ?auto_15053 ?auto_15054 ) ) ( not ( = ?auto_15053 ?auto_15055 ) ) ( not ( = ?auto_15053 ?auto_15056 ) ) ( not ( = ?auto_15054 ?auto_15055 ) ) ( not ( = ?auto_15054 ?auto_15056 ) ) ( not ( = ?auto_15055 ?auto_15056 ) ) ( ON ?auto_15054 ?auto_15055 ) ( ON ?auto_15053 ?auto_15054 ) ( CLEAR ?auto_15053 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_15053 )
      ( MAKE-3PILE ?auto_15053 ?auto_15054 ?auto_15055 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15068 - BLOCK
      ?auto_15069 - BLOCK
      ?auto_15070 - BLOCK
      ?auto_15071 - BLOCK
    )
    :vars
    (
      ?auto_15072 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_15070 ) ( ON ?auto_15071 ?auto_15072 ) ( CLEAR ?auto_15071 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15068 ) ( ON ?auto_15069 ?auto_15068 ) ( ON ?auto_15070 ?auto_15069 ) ( not ( = ?auto_15068 ?auto_15069 ) ) ( not ( = ?auto_15068 ?auto_15070 ) ) ( not ( = ?auto_15068 ?auto_15071 ) ) ( not ( = ?auto_15068 ?auto_15072 ) ) ( not ( = ?auto_15069 ?auto_15070 ) ) ( not ( = ?auto_15069 ?auto_15071 ) ) ( not ( = ?auto_15069 ?auto_15072 ) ) ( not ( = ?auto_15070 ?auto_15071 ) ) ( not ( = ?auto_15070 ?auto_15072 ) ) ( not ( = ?auto_15071 ?auto_15072 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15071 ?auto_15072 )
      ( !STACK ?auto_15071 ?auto_15070 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15086 - BLOCK
      ?auto_15087 - BLOCK
      ?auto_15088 - BLOCK
      ?auto_15089 - BLOCK
    )
    :vars
    (
      ?auto_15090 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15089 ?auto_15090 ) ( ON-TABLE ?auto_15086 ) ( ON ?auto_15087 ?auto_15086 ) ( not ( = ?auto_15086 ?auto_15087 ) ) ( not ( = ?auto_15086 ?auto_15088 ) ) ( not ( = ?auto_15086 ?auto_15089 ) ) ( not ( = ?auto_15086 ?auto_15090 ) ) ( not ( = ?auto_15087 ?auto_15088 ) ) ( not ( = ?auto_15087 ?auto_15089 ) ) ( not ( = ?auto_15087 ?auto_15090 ) ) ( not ( = ?auto_15088 ?auto_15089 ) ) ( not ( = ?auto_15088 ?auto_15090 ) ) ( not ( = ?auto_15089 ?auto_15090 ) ) ( CLEAR ?auto_15087 ) ( ON ?auto_15088 ?auto_15089 ) ( CLEAR ?auto_15088 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15086 ?auto_15087 ?auto_15088 )
      ( MAKE-4PILE ?auto_15086 ?auto_15087 ?auto_15088 ?auto_15089 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15104 - BLOCK
      ?auto_15105 - BLOCK
      ?auto_15106 - BLOCK
      ?auto_15107 - BLOCK
    )
    :vars
    (
      ?auto_15108 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15107 ?auto_15108 ) ( ON-TABLE ?auto_15104 ) ( not ( = ?auto_15104 ?auto_15105 ) ) ( not ( = ?auto_15104 ?auto_15106 ) ) ( not ( = ?auto_15104 ?auto_15107 ) ) ( not ( = ?auto_15104 ?auto_15108 ) ) ( not ( = ?auto_15105 ?auto_15106 ) ) ( not ( = ?auto_15105 ?auto_15107 ) ) ( not ( = ?auto_15105 ?auto_15108 ) ) ( not ( = ?auto_15106 ?auto_15107 ) ) ( not ( = ?auto_15106 ?auto_15108 ) ) ( not ( = ?auto_15107 ?auto_15108 ) ) ( ON ?auto_15106 ?auto_15107 ) ( CLEAR ?auto_15104 ) ( ON ?auto_15105 ?auto_15106 ) ( CLEAR ?auto_15105 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15104 ?auto_15105 )
      ( MAKE-4PILE ?auto_15104 ?auto_15105 ?auto_15106 ?auto_15107 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15122 - BLOCK
      ?auto_15123 - BLOCK
      ?auto_15124 - BLOCK
      ?auto_15125 - BLOCK
    )
    :vars
    (
      ?auto_15126 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15125 ?auto_15126 ) ( not ( = ?auto_15122 ?auto_15123 ) ) ( not ( = ?auto_15122 ?auto_15124 ) ) ( not ( = ?auto_15122 ?auto_15125 ) ) ( not ( = ?auto_15122 ?auto_15126 ) ) ( not ( = ?auto_15123 ?auto_15124 ) ) ( not ( = ?auto_15123 ?auto_15125 ) ) ( not ( = ?auto_15123 ?auto_15126 ) ) ( not ( = ?auto_15124 ?auto_15125 ) ) ( not ( = ?auto_15124 ?auto_15126 ) ) ( not ( = ?auto_15125 ?auto_15126 ) ) ( ON ?auto_15124 ?auto_15125 ) ( ON ?auto_15123 ?auto_15124 ) ( ON ?auto_15122 ?auto_15123 ) ( CLEAR ?auto_15122 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_15122 )
      ( MAKE-4PILE ?auto_15122 ?auto_15123 ?auto_15124 ?auto_15125 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_15141 - BLOCK
      ?auto_15142 - BLOCK
      ?auto_15143 - BLOCK
      ?auto_15144 - BLOCK
      ?auto_15145 - BLOCK
    )
    :vars
    (
      ?auto_15146 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_15144 ) ( ON ?auto_15145 ?auto_15146 ) ( CLEAR ?auto_15145 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15141 ) ( ON ?auto_15142 ?auto_15141 ) ( ON ?auto_15143 ?auto_15142 ) ( ON ?auto_15144 ?auto_15143 ) ( not ( = ?auto_15141 ?auto_15142 ) ) ( not ( = ?auto_15141 ?auto_15143 ) ) ( not ( = ?auto_15141 ?auto_15144 ) ) ( not ( = ?auto_15141 ?auto_15145 ) ) ( not ( = ?auto_15141 ?auto_15146 ) ) ( not ( = ?auto_15142 ?auto_15143 ) ) ( not ( = ?auto_15142 ?auto_15144 ) ) ( not ( = ?auto_15142 ?auto_15145 ) ) ( not ( = ?auto_15142 ?auto_15146 ) ) ( not ( = ?auto_15143 ?auto_15144 ) ) ( not ( = ?auto_15143 ?auto_15145 ) ) ( not ( = ?auto_15143 ?auto_15146 ) ) ( not ( = ?auto_15144 ?auto_15145 ) ) ( not ( = ?auto_15144 ?auto_15146 ) ) ( not ( = ?auto_15145 ?auto_15146 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15145 ?auto_15146 )
      ( !STACK ?auto_15145 ?auto_15144 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_15163 - BLOCK
      ?auto_15164 - BLOCK
      ?auto_15165 - BLOCK
      ?auto_15166 - BLOCK
      ?auto_15167 - BLOCK
    )
    :vars
    (
      ?auto_15168 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15167 ?auto_15168 ) ( ON-TABLE ?auto_15163 ) ( ON ?auto_15164 ?auto_15163 ) ( ON ?auto_15165 ?auto_15164 ) ( not ( = ?auto_15163 ?auto_15164 ) ) ( not ( = ?auto_15163 ?auto_15165 ) ) ( not ( = ?auto_15163 ?auto_15166 ) ) ( not ( = ?auto_15163 ?auto_15167 ) ) ( not ( = ?auto_15163 ?auto_15168 ) ) ( not ( = ?auto_15164 ?auto_15165 ) ) ( not ( = ?auto_15164 ?auto_15166 ) ) ( not ( = ?auto_15164 ?auto_15167 ) ) ( not ( = ?auto_15164 ?auto_15168 ) ) ( not ( = ?auto_15165 ?auto_15166 ) ) ( not ( = ?auto_15165 ?auto_15167 ) ) ( not ( = ?auto_15165 ?auto_15168 ) ) ( not ( = ?auto_15166 ?auto_15167 ) ) ( not ( = ?auto_15166 ?auto_15168 ) ) ( not ( = ?auto_15167 ?auto_15168 ) ) ( CLEAR ?auto_15165 ) ( ON ?auto_15166 ?auto_15167 ) ( CLEAR ?auto_15166 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_15163 ?auto_15164 ?auto_15165 ?auto_15166 )
      ( MAKE-5PILE ?auto_15163 ?auto_15164 ?auto_15165 ?auto_15166 ?auto_15167 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_15185 - BLOCK
      ?auto_15186 - BLOCK
      ?auto_15187 - BLOCK
      ?auto_15188 - BLOCK
      ?auto_15189 - BLOCK
    )
    :vars
    (
      ?auto_15190 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15189 ?auto_15190 ) ( ON-TABLE ?auto_15185 ) ( ON ?auto_15186 ?auto_15185 ) ( not ( = ?auto_15185 ?auto_15186 ) ) ( not ( = ?auto_15185 ?auto_15187 ) ) ( not ( = ?auto_15185 ?auto_15188 ) ) ( not ( = ?auto_15185 ?auto_15189 ) ) ( not ( = ?auto_15185 ?auto_15190 ) ) ( not ( = ?auto_15186 ?auto_15187 ) ) ( not ( = ?auto_15186 ?auto_15188 ) ) ( not ( = ?auto_15186 ?auto_15189 ) ) ( not ( = ?auto_15186 ?auto_15190 ) ) ( not ( = ?auto_15187 ?auto_15188 ) ) ( not ( = ?auto_15187 ?auto_15189 ) ) ( not ( = ?auto_15187 ?auto_15190 ) ) ( not ( = ?auto_15188 ?auto_15189 ) ) ( not ( = ?auto_15188 ?auto_15190 ) ) ( not ( = ?auto_15189 ?auto_15190 ) ) ( ON ?auto_15188 ?auto_15189 ) ( CLEAR ?auto_15186 ) ( ON ?auto_15187 ?auto_15188 ) ( CLEAR ?auto_15187 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15185 ?auto_15186 ?auto_15187 )
      ( MAKE-5PILE ?auto_15185 ?auto_15186 ?auto_15187 ?auto_15188 ?auto_15189 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_15207 - BLOCK
      ?auto_15208 - BLOCK
      ?auto_15209 - BLOCK
      ?auto_15210 - BLOCK
      ?auto_15211 - BLOCK
    )
    :vars
    (
      ?auto_15212 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15211 ?auto_15212 ) ( ON-TABLE ?auto_15207 ) ( not ( = ?auto_15207 ?auto_15208 ) ) ( not ( = ?auto_15207 ?auto_15209 ) ) ( not ( = ?auto_15207 ?auto_15210 ) ) ( not ( = ?auto_15207 ?auto_15211 ) ) ( not ( = ?auto_15207 ?auto_15212 ) ) ( not ( = ?auto_15208 ?auto_15209 ) ) ( not ( = ?auto_15208 ?auto_15210 ) ) ( not ( = ?auto_15208 ?auto_15211 ) ) ( not ( = ?auto_15208 ?auto_15212 ) ) ( not ( = ?auto_15209 ?auto_15210 ) ) ( not ( = ?auto_15209 ?auto_15211 ) ) ( not ( = ?auto_15209 ?auto_15212 ) ) ( not ( = ?auto_15210 ?auto_15211 ) ) ( not ( = ?auto_15210 ?auto_15212 ) ) ( not ( = ?auto_15211 ?auto_15212 ) ) ( ON ?auto_15210 ?auto_15211 ) ( ON ?auto_15209 ?auto_15210 ) ( CLEAR ?auto_15207 ) ( ON ?auto_15208 ?auto_15209 ) ( CLEAR ?auto_15208 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15207 ?auto_15208 )
      ( MAKE-5PILE ?auto_15207 ?auto_15208 ?auto_15209 ?auto_15210 ?auto_15211 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_15229 - BLOCK
      ?auto_15230 - BLOCK
      ?auto_15231 - BLOCK
      ?auto_15232 - BLOCK
      ?auto_15233 - BLOCK
    )
    :vars
    (
      ?auto_15234 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15233 ?auto_15234 ) ( not ( = ?auto_15229 ?auto_15230 ) ) ( not ( = ?auto_15229 ?auto_15231 ) ) ( not ( = ?auto_15229 ?auto_15232 ) ) ( not ( = ?auto_15229 ?auto_15233 ) ) ( not ( = ?auto_15229 ?auto_15234 ) ) ( not ( = ?auto_15230 ?auto_15231 ) ) ( not ( = ?auto_15230 ?auto_15232 ) ) ( not ( = ?auto_15230 ?auto_15233 ) ) ( not ( = ?auto_15230 ?auto_15234 ) ) ( not ( = ?auto_15231 ?auto_15232 ) ) ( not ( = ?auto_15231 ?auto_15233 ) ) ( not ( = ?auto_15231 ?auto_15234 ) ) ( not ( = ?auto_15232 ?auto_15233 ) ) ( not ( = ?auto_15232 ?auto_15234 ) ) ( not ( = ?auto_15233 ?auto_15234 ) ) ( ON ?auto_15232 ?auto_15233 ) ( ON ?auto_15231 ?auto_15232 ) ( ON ?auto_15230 ?auto_15231 ) ( ON ?auto_15229 ?auto_15230 ) ( CLEAR ?auto_15229 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_15229 )
      ( MAKE-5PILE ?auto_15229 ?auto_15230 ?auto_15231 ?auto_15232 ?auto_15233 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_15252 - BLOCK
      ?auto_15253 - BLOCK
      ?auto_15254 - BLOCK
      ?auto_15255 - BLOCK
      ?auto_15256 - BLOCK
      ?auto_15257 - BLOCK
    )
    :vars
    (
      ?auto_15258 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_15256 ) ( ON ?auto_15257 ?auto_15258 ) ( CLEAR ?auto_15257 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15252 ) ( ON ?auto_15253 ?auto_15252 ) ( ON ?auto_15254 ?auto_15253 ) ( ON ?auto_15255 ?auto_15254 ) ( ON ?auto_15256 ?auto_15255 ) ( not ( = ?auto_15252 ?auto_15253 ) ) ( not ( = ?auto_15252 ?auto_15254 ) ) ( not ( = ?auto_15252 ?auto_15255 ) ) ( not ( = ?auto_15252 ?auto_15256 ) ) ( not ( = ?auto_15252 ?auto_15257 ) ) ( not ( = ?auto_15252 ?auto_15258 ) ) ( not ( = ?auto_15253 ?auto_15254 ) ) ( not ( = ?auto_15253 ?auto_15255 ) ) ( not ( = ?auto_15253 ?auto_15256 ) ) ( not ( = ?auto_15253 ?auto_15257 ) ) ( not ( = ?auto_15253 ?auto_15258 ) ) ( not ( = ?auto_15254 ?auto_15255 ) ) ( not ( = ?auto_15254 ?auto_15256 ) ) ( not ( = ?auto_15254 ?auto_15257 ) ) ( not ( = ?auto_15254 ?auto_15258 ) ) ( not ( = ?auto_15255 ?auto_15256 ) ) ( not ( = ?auto_15255 ?auto_15257 ) ) ( not ( = ?auto_15255 ?auto_15258 ) ) ( not ( = ?auto_15256 ?auto_15257 ) ) ( not ( = ?auto_15256 ?auto_15258 ) ) ( not ( = ?auto_15257 ?auto_15258 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15257 ?auto_15258 )
      ( !STACK ?auto_15257 ?auto_15256 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_15265 - BLOCK
      ?auto_15266 - BLOCK
      ?auto_15267 - BLOCK
      ?auto_15268 - BLOCK
      ?auto_15269 - BLOCK
      ?auto_15270 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_15269 ) ( ON-TABLE ?auto_15270 ) ( CLEAR ?auto_15270 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15265 ) ( ON ?auto_15266 ?auto_15265 ) ( ON ?auto_15267 ?auto_15266 ) ( ON ?auto_15268 ?auto_15267 ) ( ON ?auto_15269 ?auto_15268 ) ( not ( = ?auto_15265 ?auto_15266 ) ) ( not ( = ?auto_15265 ?auto_15267 ) ) ( not ( = ?auto_15265 ?auto_15268 ) ) ( not ( = ?auto_15265 ?auto_15269 ) ) ( not ( = ?auto_15265 ?auto_15270 ) ) ( not ( = ?auto_15266 ?auto_15267 ) ) ( not ( = ?auto_15266 ?auto_15268 ) ) ( not ( = ?auto_15266 ?auto_15269 ) ) ( not ( = ?auto_15266 ?auto_15270 ) ) ( not ( = ?auto_15267 ?auto_15268 ) ) ( not ( = ?auto_15267 ?auto_15269 ) ) ( not ( = ?auto_15267 ?auto_15270 ) ) ( not ( = ?auto_15268 ?auto_15269 ) ) ( not ( = ?auto_15268 ?auto_15270 ) ) ( not ( = ?auto_15269 ?auto_15270 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_15270 )
      ( !STACK ?auto_15270 ?auto_15269 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_15277 - BLOCK
      ?auto_15278 - BLOCK
      ?auto_15279 - BLOCK
      ?auto_15280 - BLOCK
      ?auto_15281 - BLOCK
      ?auto_15282 - BLOCK
    )
    :vars
    (
      ?auto_15283 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15282 ?auto_15283 ) ( ON-TABLE ?auto_15277 ) ( ON ?auto_15278 ?auto_15277 ) ( ON ?auto_15279 ?auto_15278 ) ( ON ?auto_15280 ?auto_15279 ) ( not ( = ?auto_15277 ?auto_15278 ) ) ( not ( = ?auto_15277 ?auto_15279 ) ) ( not ( = ?auto_15277 ?auto_15280 ) ) ( not ( = ?auto_15277 ?auto_15281 ) ) ( not ( = ?auto_15277 ?auto_15282 ) ) ( not ( = ?auto_15277 ?auto_15283 ) ) ( not ( = ?auto_15278 ?auto_15279 ) ) ( not ( = ?auto_15278 ?auto_15280 ) ) ( not ( = ?auto_15278 ?auto_15281 ) ) ( not ( = ?auto_15278 ?auto_15282 ) ) ( not ( = ?auto_15278 ?auto_15283 ) ) ( not ( = ?auto_15279 ?auto_15280 ) ) ( not ( = ?auto_15279 ?auto_15281 ) ) ( not ( = ?auto_15279 ?auto_15282 ) ) ( not ( = ?auto_15279 ?auto_15283 ) ) ( not ( = ?auto_15280 ?auto_15281 ) ) ( not ( = ?auto_15280 ?auto_15282 ) ) ( not ( = ?auto_15280 ?auto_15283 ) ) ( not ( = ?auto_15281 ?auto_15282 ) ) ( not ( = ?auto_15281 ?auto_15283 ) ) ( not ( = ?auto_15282 ?auto_15283 ) ) ( CLEAR ?auto_15280 ) ( ON ?auto_15281 ?auto_15282 ) ( CLEAR ?auto_15281 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_15277 ?auto_15278 ?auto_15279 ?auto_15280 ?auto_15281 )
      ( MAKE-6PILE ?auto_15277 ?auto_15278 ?auto_15279 ?auto_15280 ?auto_15281 ?auto_15282 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_15290 - BLOCK
      ?auto_15291 - BLOCK
      ?auto_15292 - BLOCK
      ?auto_15293 - BLOCK
      ?auto_15294 - BLOCK
      ?auto_15295 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_15295 ) ( ON-TABLE ?auto_15290 ) ( ON ?auto_15291 ?auto_15290 ) ( ON ?auto_15292 ?auto_15291 ) ( ON ?auto_15293 ?auto_15292 ) ( not ( = ?auto_15290 ?auto_15291 ) ) ( not ( = ?auto_15290 ?auto_15292 ) ) ( not ( = ?auto_15290 ?auto_15293 ) ) ( not ( = ?auto_15290 ?auto_15294 ) ) ( not ( = ?auto_15290 ?auto_15295 ) ) ( not ( = ?auto_15291 ?auto_15292 ) ) ( not ( = ?auto_15291 ?auto_15293 ) ) ( not ( = ?auto_15291 ?auto_15294 ) ) ( not ( = ?auto_15291 ?auto_15295 ) ) ( not ( = ?auto_15292 ?auto_15293 ) ) ( not ( = ?auto_15292 ?auto_15294 ) ) ( not ( = ?auto_15292 ?auto_15295 ) ) ( not ( = ?auto_15293 ?auto_15294 ) ) ( not ( = ?auto_15293 ?auto_15295 ) ) ( not ( = ?auto_15294 ?auto_15295 ) ) ( CLEAR ?auto_15293 ) ( ON ?auto_15294 ?auto_15295 ) ( CLEAR ?auto_15294 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_15290 ?auto_15291 ?auto_15292 ?auto_15293 ?auto_15294 )
      ( MAKE-6PILE ?auto_15290 ?auto_15291 ?auto_15292 ?auto_15293 ?auto_15294 ?auto_15295 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_15302 - BLOCK
      ?auto_15303 - BLOCK
      ?auto_15304 - BLOCK
      ?auto_15305 - BLOCK
      ?auto_15306 - BLOCK
      ?auto_15307 - BLOCK
    )
    :vars
    (
      ?auto_15308 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15307 ?auto_15308 ) ( ON-TABLE ?auto_15302 ) ( ON ?auto_15303 ?auto_15302 ) ( ON ?auto_15304 ?auto_15303 ) ( not ( = ?auto_15302 ?auto_15303 ) ) ( not ( = ?auto_15302 ?auto_15304 ) ) ( not ( = ?auto_15302 ?auto_15305 ) ) ( not ( = ?auto_15302 ?auto_15306 ) ) ( not ( = ?auto_15302 ?auto_15307 ) ) ( not ( = ?auto_15302 ?auto_15308 ) ) ( not ( = ?auto_15303 ?auto_15304 ) ) ( not ( = ?auto_15303 ?auto_15305 ) ) ( not ( = ?auto_15303 ?auto_15306 ) ) ( not ( = ?auto_15303 ?auto_15307 ) ) ( not ( = ?auto_15303 ?auto_15308 ) ) ( not ( = ?auto_15304 ?auto_15305 ) ) ( not ( = ?auto_15304 ?auto_15306 ) ) ( not ( = ?auto_15304 ?auto_15307 ) ) ( not ( = ?auto_15304 ?auto_15308 ) ) ( not ( = ?auto_15305 ?auto_15306 ) ) ( not ( = ?auto_15305 ?auto_15307 ) ) ( not ( = ?auto_15305 ?auto_15308 ) ) ( not ( = ?auto_15306 ?auto_15307 ) ) ( not ( = ?auto_15306 ?auto_15308 ) ) ( not ( = ?auto_15307 ?auto_15308 ) ) ( ON ?auto_15306 ?auto_15307 ) ( CLEAR ?auto_15304 ) ( ON ?auto_15305 ?auto_15306 ) ( CLEAR ?auto_15305 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_15302 ?auto_15303 ?auto_15304 ?auto_15305 )
      ( MAKE-6PILE ?auto_15302 ?auto_15303 ?auto_15304 ?auto_15305 ?auto_15306 ?auto_15307 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_15315 - BLOCK
      ?auto_15316 - BLOCK
      ?auto_15317 - BLOCK
      ?auto_15318 - BLOCK
      ?auto_15319 - BLOCK
      ?auto_15320 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_15320 ) ( ON-TABLE ?auto_15315 ) ( ON ?auto_15316 ?auto_15315 ) ( ON ?auto_15317 ?auto_15316 ) ( not ( = ?auto_15315 ?auto_15316 ) ) ( not ( = ?auto_15315 ?auto_15317 ) ) ( not ( = ?auto_15315 ?auto_15318 ) ) ( not ( = ?auto_15315 ?auto_15319 ) ) ( not ( = ?auto_15315 ?auto_15320 ) ) ( not ( = ?auto_15316 ?auto_15317 ) ) ( not ( = ?auto_15316 ?auto_15318 ) ) ( not ( = ?auto_15316 ?auto_15319 ) ) ( not ( = ?auto_15316 ?auto_15320 ) ) ( not ( = ?auto_15317 ?auto_15318 ) ) ( not ( = ?auto_15317 ?auto_15319 ) ) ( not ( = ?auto_15317 ?auto_15320 ) ) ( not ( = ?auto_15318 ?auto_15319 ) ) ( not ( = ?auto_15318 ?auto_15320 ) ) ( not ( = ?auto_15319 ?auto_15320 ) ) ( ON ?auto_15319 ?auto_15320 ) ( CLEAR ?auto_15317 ) ( ON ?auto_15318 ?auto_15319 ) ( CLEAR ?auto_15318 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_15315 ?auto_15316 ?auto_15317 ?auto_15318 )
      ( MAKE-6PILE ?auto_15315 ?auto_15316 ?auto_15317 ?auto_15318 ?auto_15319 ?auto_15320 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_15327 - BLOCK
      ?auto_15328 - BLOCK
      ?auto_15329 - BLOCK
      ?auto_15330 - BLOCK
      ?auto_15331 - BLOCK
      ?auto_15332 - BLOCK
    )
    :vars
    (
      ?auto_15333 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15332 ?auto_15333 ) ( ON-TABLE ?auto_15327 ) ( ON ?auto_15328 ?auto_15327 ) ( not ( = ?auto_15327 ?auto_15328 ) ) ( not ( = ?auto_15327 ?auto_15329 ) ) ( not ( = ?auto_15327 ?auto_15330 ) ) ( not ( = ?auto_15327 ?auto_15331 ) ) ( not ( = ?auto_15327 ?auto_15332 ) ) ( not ( = ?auto_15327 ?auto_15333 ) ) ( not ( = ?auto_15328 ?auto_15329 ) ) ( not ( = ?auto_15328 ?auto_15330 ) ) ( not ( = ?auto_15328 ?auto_15331 ) ) ( not ( = ?auto_15328 ?auto_15332 ) ) ( not ( = ?auto_15328 ?auto_15333 ) ) ( not ( = ?auto_15329 ?auto_15330 ) ) ( not ( = ?auto_15329 ?auto_15331 ) ) ( not ( = ?auto_15329 ?auto_15332 ) ) ( not ( = ?auto_15329 ?auto_15333 ) ) ( not ( = ?auto_15330 ?auto_15331 ) ) ( not ( = ?auto_15330 ?auto_15332 ) ) ( not ( = ?auto_15330 ?auto_15333 ) ) ( not ( = ?auto_15331 ?auto_15332 ) ) ( not ( = ?auto_15331 ?auto_15333 ) ) ( not ( = ?auto_15332 ?auto_15333 ) ) ( ON ?auto_15331 ?auto_15332 ) ( ON ?auto_15330 ?auto_15331 ) ( CLEAR ?auto_15328 ) ( ON ?auto_15329 ?auto_15330 ) ( CLEAR ?auto_15329 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15327 ?auto_15328 ?auto_15329 )
      ( MAKE-6PILE ?auto_15327 ?auto_15328 ?auto_15329 ?auto_15330 ?auto_15331 ?auto_15332 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_15340 - BLOCK
      ?auto_15341 - BLOCK
      ?auto_15342 - BLOCK
      ?auto_15343 - BLOCK
      ?auto_15344 - BLOCK
      ?auto_15345 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_15345 ) ( ON-TABLE ?auto_15340 ) ( ON ?auto_15341 ?auto_15340 ) ( not ( = ?auto_15340 ?auto_15341 ) ) ( not ( = ?auto_15340 ?auto_15342 ) ) ( not ( = ?auto_15340 ?auto_15343 ) ) ( not ( = ?auto_15340 ?auto_15344 ) ) ( not ( = ?auto_15340 ?auto_15345 ) ) ( not ( = ?auto_15341 ?auto_15342 ) ) ( not ( = ?auto_15341 ?auto_15343 ) ) ( not ( = ?auto_15341 ?auto_15344 ) ) ( not ( = ?auto_15341 ?auto_15345 ) ) ( not ( = ?auto_15342 ?auto_15343 ) ) ( not ( = ?auto_15342 ?auto_15344 ) ) ( not ( = ?auto_15342 ?auto_15345 ) ) ( not ( = ?auto_15343 ?auto_15344 ) ) ( not ( = ?auto_15343 ?auto_15345 ) ) ( not ( = ?auto_15344 ?auto_15345 ) ) ( ON ?auto_15344 ?auto_15345 ) ( ON ?auto_15343 ?auto_15344 ) ( CLEAR ?auto_15341 ) ( ON ?auto_15342 ?auto_15343 ) ( CLEAR ?auto_15342 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15340 ?auto_15341 ?auto_15342 )
      ( MAKE-6PILE ?auto_15340 ?auto_15341 ?auto_15342 ?auto_15343 ?auto_15344 ?auto_15345 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_15352 - BLOCK
      ?auto_15353 - BLOCK
      ?auto_15354 - BLOCK
      ?auto_15355 - BLOCK
      ?auto_15356 - BLOCK
      ?auto_15357 - BLOCK
    )
    :vars
    (
      ?auto_15358 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15357 ?auto_15358 ) ( ON-TABLE ?auto_15352 ) ( not ( = ?auto_15352 ?auto_15353 ) ) ( not ( = ?auto_15352 ?auto_15354 ) ) ( not ( = ?auto_15352 ?auto_15355 ) ) ( not ( = ?auto_15352 ?auto_15356 ) ) ( not ( = ?auto_15352 ?auto_15357 ) ) ( not ( = ?auto_15352 ?auto_15358 ) ) ( not ( = ?auto_15353 ?auto_15354 ) ) ( not ( = ?auto_15353 ?auto_15355 ) ) ( not ( = ?auto_15353 ?auto_15356 ) ) ( not ( = ?auto_15353 ?auto_15357 ) ) ( not ( = ?auto_15353 ?auto_15358 ) ) ( not ( = ?auto_15354 ?auto_15355 ) ) ( not ( = ?auto_15354 ?auto_15356 ) ) ( not ( = ?auto_15354 ?auto_15357 ) ) ( not ( = ?auto_15354 ?auto_15358 ) ) ( not ( = ?auto_15355 ?auto_15356 ) ) ( not ( = ?auto_15355 ?auto_15357 ) ) ( not ( = ?auto_15355 ?auto_15358 ) ) ( not ( = ?auto_15356 ?auto_15357 ) ) ( not ( = ?auto_15356 ?auto_15358 ) ) ( not ( = ?auto_15357 ?auto_15358 ) ) ( ON ?auto_15356 ?auto_15357 ) ( ON ?auto_15355 ?auto_15356 ) ( ON ?auto_15354 ?auto_15355 ) ( CLEAR ?auto_15352 ) ( ON ?auto_15353 ?auto_15354 ) ( CLEAR ?auto_15353 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15352 ?auto_15353 )
      ( MAKE-6PILE ?auto_15352 ?auto_15353 ?auto_15354 ?auto_15355 ?auto_15356 ?auto_15357 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_15365 - BLOCK
      ?auto_15366 - BLOCK
      ?auto_15367 - BLOCK
      ?auto_15368 - BLOCK
      ?auto_15369 - BLOCK
      ?auto_15370 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_15370 ) ( ON-TABLE ?auto_15365 ) ( not ( = ?auto_15365 ?auto_15366 ) ) ( not ( = ?auto_15365 ?auto_15367 ) ) ( not ( = ?auto_15365 ?auto_15368 ) ) ( not ( = ?auto_15365 ?auto_15369 ) ) ( not ( = ?auto_15365 ?auto_15370 ) ) ( not ( = ?auto_15366 ?auto_15367 ) ) ( not ( = ?auto_15366 ?auto_15368 ) ) ( not ( = ?auto_15366 ?auto_15369 ) ) ( not ( = ?auto_15366 ?auto_15370 ) ) ( not ( = ?auto_15367 ?auto_15368 ) ) ( not ( = ?auto_15367 ?auto_15369 ) ) ( not ( = ?auto_15367 ?auto_15370 ) ) ( not ( = ?auto_15368 ?auto_15369 ) ) ( not ( = ?auto_15368 ?auto_15370 ) ) ( not ( = ?auto_15369 ?auto_15370 ) ) ( ON ?auto_15369 ?auto_15370 ) ( ON ?auto_15368 ?auto_15369 ) ( ON ?auto_15367 ?auto_15368 ) ( CLEAR ?auto_15365 ) ( ON ?auto_15366 ?auto_15367 ) ( CLEAR ?auto_15366 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15365 ?auto_15366 )
      ( MAKE-6PILE ?auto_15365 ?auto_15366 ?auto_15367 ?auto_15368 ?auto_15369 ?auto_15370 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_15377 - BLOCK
      ?auto_15378 - BLOCK
      ?auto_15379 - BLOCK
      ?auto_15380 - BLOCK
      ?auto_15381 - BLOCK
      ?auto_15382 - BLOCK
    )
    :vars
    (
      ?auto_15383 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15382 ?auto_15383 ) ( not ( = ?auto_15377 ?auto_15378 ) ) ( not ( = ?auto_15377 ?auto_15379 ) ) ( not ( = ?auto_15377 ?auto_15380 ) ) ( not ( = ?auto_15377 ?auto_15381 ) ) ( not ( = ?auto_15377 ?auto_15382 ) ) ( not ( = ?auto_15377 ?auto_15383 ) ) ( not ( = ?auto_15378 ?auto_15379 ) ) ( not ( = ?auto_15378 ?auto_15380 ) ) ( not ( = ?auto_15378 ?auto_15381 ) ) ( not ( = ?auto_15378 ?auto_15382 ) ) ( not ( = ?auto_15378 ?auto_15383 ) ) ( not ( = ?auto_15379 ?auto_15380 ) ) ( not ( = ?auto_15379 ?auto_15381 ) ) ( not ( = ?auto_15379 ?auto_15382 ) ) ( not ( = ?auto_15379 ?auto_15383 ) ) ( not ( = ?auto_15380 ?auto_15381 ) ) ( not ( = ?auto_15380 ?auto_15382 ) ) ( not ( = ?auto_15380 ?auto_15383 ) ) ( not ( = ?auto_15381 ?auto_15382 ) ) ( not ( = ?auto_15381 ?auto_15383 ) ) ( not ( = ?auto_15382 ?auto_15383 ) ) ( ON ?auto_15381 ?auto_15382 ) ( ON ?auto_15380 ?auto_15381 ) ( ON ?auto_15379 ?auto_15380 ) ( ON ?auto_15378 ?auto_15379 ) ( ON ?auto_15377 ?auto_15378 ) ( CLEAR ?auto_15377 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_15377 )
      ( MAKE-6PILE ?auto_15377 ?auto_15378 ?auto_15379 ?auto_15380 ?auto_15381 ?auto_15382 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_15390 - BLOCK
      ?auto_15391 - BLOCK
      ?auto_15392 - BLOCK
      ?auto_15393 - BLOCK
      ?auto_15394 - BLOCK
      ?auto_15395 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_15395 ) ( not ( = ?auto_15390 ?auto_15391 ) ) ( not ( = ?auto_15390 ?auto_15392 ) ) ( not ( = ?auto_15390 ?auto_15393 ) ) ( not ( = ?auto_15390 ?auto_15394 ) ) ( not ( = ?auto_15390 ?auto_15395 ) ) ( not ( = ?auto_15391 ?auto_15392 ) ) ( not ( = ?auto_15391 ?auto_15393 ) ) ( not ( = ?auto_15391 ?auto_15394 ) ) ( not ( = ?auto_15391 ?auto_15395 ) ) ( not ( = ?auto_15392 ?auto_15393 ) ) ( not ( = ?auto_15392 ?auto_15394 ) ) ( not ( = ?auto_15392 ?auto_15395 ) ) ( not ( = ?auto_15393 ?auto_15394 ) ) ( not ( = ?auto_15393 ?auto_15395 ) ) ( not ( = ?auto_15394 ?auto_15395 ) ) ( ON ?auto_15394 ?auto_15395 ) ( ON ?auto_15393 ?auto_15394 ) ( ON ?auto_15392 ?auto_15393 ) ( ON ?auto_15391 ?auto_15392 ) ( ON ?auto_15390 ?auto_15391 ) ( CLEAR ?auto_15390 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_15390 )
      ( MAKE-6PILE ?auto_15390 ?auto_15391 ?auto_15392 ?auto_15393 ?auto_15394 ?auto_15395 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_15402 - BLOCK
      ?auto_15403 - BLOCK
      ?auto_15404 - BLOCK
      ?auto_15405 - BLOCK
      ?auto_15406 - BLOCK
      ?auto_15407 - BLOCK
    )
    :vars
    (
      ?auto_15408 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15402 ?auto_15403 ) ) ( not ( = ?auto_15402 ?auto_15404 ) ) ( not ( = ?auto_15402 ?auto_15405 ) ) ( not ( = ?auto_15402 ?auto_15406 ) ) ( not ( = ?auto_15402 ?auto_15407 ) ) ( not ( = ?auto_15403 ?auto_15404 ) ) ( not ( = ?auto_15403 ?auto_15405 ) ) ( not ( = ?auto_15403 ?auto_15406 ) ) ( not ( = ?auto_15403 ?auto_15407 ) ) ( not ( = ?auto_15404 ?auto_15405 ) ) ( not ( = ?auto_15404 ?auto_15406 ) ) ( not ( = ?auto_15404 ?auto_15407 ) ) ( not ( = ?auto_15405 ?auto_15406 ) ) ( not ( = ?auto_15405 ?auto_15407 ) ) ( not ( = ?auto_15406 ?auto_15407 ) ) ( ON ?auto_15402 ?auto_15408 ) ( not ( = ?auto_15407 ?auto_15408 ) ) ( not ( = ?auto_15406 ?auto_15408 ) ) ( not ( = ?auto_15405 ?auto_15408 ) ) ( not ( = ?auto_15404 ?auto_15408 ) ) ( not ( = ?auto_15403 ?auto_15408 ) ) ( not ( = ?auto_15402 ?auto_15408 ) ) ( ON ?auto_15403 ?auto_15402 ) ( ON ?auto_15404 ?auto_15403 ) ( ON ?auto_15405 ?auto_15404 ) ( ON ?auto_15406 ?auto_15405 ) ( ON ?auto_15407 ?auto_15406 ) ( CLEAR ?auto_15407 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_15407 ?auto_15406 ?auto_15405 ?auto_15404 ?auto_15403 ?auto_15402 )
      ( MAKE-6PILE ?auto_15402 ?auto_15403 ?auto_15404 ?auto_15405 ?auto_15406 ?auto_15407 ) )
  )

)

