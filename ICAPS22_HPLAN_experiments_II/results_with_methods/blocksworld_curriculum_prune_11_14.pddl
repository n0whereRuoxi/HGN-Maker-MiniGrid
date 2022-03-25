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
      ?auto_137093 - BLOCK
    )
    :vars
    (
      ?auto_137094 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137093 ?auto_137094 ) ( CLEAR ?auto_137093 ) ( HAND-EMPTY ) ( not ( = ?auto_137093 ?auto_137094 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_137093 ?auto_137094 )
      ( !PUTDOWN ?auto_137093 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_137100 - BLOCK
      ?auto_137101 - BLOCK
    )
    :vars
    (
      ?auto_137102 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_137100 ) ( ON ?auto_137101 ?auto_137102 ) ( CLEAR ?auto_137101 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_137100 ) ( not ( = ?auto_137100 ?auto_137101 ) ) ( not ( = ?auto_137100 ?auto_137102 ) ) ( not ( = ?auto_137101 ?auto_137102 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_137101 ?auto_137102 )
      ( !STACK ?auto_137101 ?auto_137100 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_137110 - BLOCK
      ?auto_137111 - BLOCK
    )
    :vars
    (
      ?auto_137112 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137111 ?auto_137112 ) ( not ( = ?auto_137110 ?auto_137111 ) ) ( not ( = ?auto_137110 ?auto_137112 ) ) ( not ( = ?auto_137111 ?auto_137112 ) ) ( ON ?auto_137110 ?auto_137111 ) ( CLEAR ?auto_137110 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_137110 )
      ( MAKE-2PILE ?auto_137110 ?auto_137111 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_137121 - BLOCK
      ?auto_137122 - BLOCK
      ?auto_137123 - BLOCK
    )
    :vars
    (
      ?auto_137124 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_137122 ) ( ON ?auto_137123 ?auto_137124 ) ( CLEAR ?auto_137123 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_137121 ) ( ON ?auto_137122 ?auto_137121 ) ( not ( = ?auto_137121 ?auto_137122 ) ) ( not ( = ?auto_137121 ?auto_137123 ) ) ( not ( = ?auto_137121 ?auto_137124 ) ) ( not ( = ?auto_137122 ?auto_137123 ) ) ( not ( = ?auto_137122 ?auto_137124 ) ) ( not ( = ?auto_137123 ?auto_137124 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_137123 ?auto_137124 )
      ( !STACK ?auto_137123 ?auto_137122 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_137135 - BLOCK
      ?auto_137136 - BLOCK
      ?auto_137137 - BLOCK
    )
    :vars
    (
      ?auto_137138 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137137 ?auto_137138 ) ( ON-TABLE ?auto_137135 ) ( not ( = ?auto_137135 ?auto_137136 ) ) ( not ( = ?auto_137135 ?auto_137137 ) ) ( not ( = ?auto_137135 ?auto_137138 ) ) ( not ( = ?auto_137136 ?auto_137137 ) ) ( not ( = ?auto_137136 ?auto_137138 ) ) ( not ( = ?auto_137137 ?auto_137138 ) ) ( CLEAR ?auto_137135 ) ( ON ?auto_137136 ?auto_137137 ) ( CLEAR ?auto_137136 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_137135 ?auto_137136 )
      ( MAKE-3PILE ?auto_137135 ?auto_137136 ?auto_137137 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_137149 - BLOCK
      ?auto_137150 - BLOCK
      ?auto_137151 - BLOCK
    )
    :vars
    (
      ?auto_137152 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137151 ?auto_137152 ) ( not ( = ?auto_137149 ?auto_137150 ) ) ( not ( = ?auto_137149 ?auto_137151 ) ) ( not ( = ?auto_137149 ?auto_137152 ) ) ( not ( = ?auto_137150 ?auto_137151 ) ) ( not ( = ?auto_137150 ?auto_137152 ) ) ( not ( = ?auto_137151 ?auto_137152 ) ) ( ON ?auto_137150 ?auto_137151 ) ( ON ?auto_137149 ?auto_137150 ) ( CLEAR ?auto_137149 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_137149 )
      ( MAKE-3PILE ?auto_137149 ?auto_137150 ?auto_137151 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_137164 - BLOCK
      ?auto_137165 - BLOCK
      ?auto_137166 - BLOCK
      ?auto_137167 - BLOCK
    )
    :vars
    (
      ?auto_137168 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_137166 ) ( ON ?auto_137167 ?auto_137168 ) ( CLEAR ?auto_137167 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_137164 ) ( ON ?auto_137165 ?auto_137164 ) ( ON ?auto_137166 ?auto_137165 ) ( not ( = ?auto_137164 ?auto_137165 ) ) ( not ( = ?auto_137164 ?auto_137166 ) ) ( not ( = ?auto_137164 ?auto_137167 ) ) ( not ( = ?auto_137164 ?auto_137168 ) ) ( not ( = ?auto_137165 ?auto_137166 ) ) ( not ( = ?auto_137165 ?auto_137167 ) ) ( not ( = ?auto_137165 ?auto_137168 ) ) ( not ( = ?auto_137166 ?auto_137167 ) ) ( not ( = ?auto_137166 ?auto_137168 ) ) ( not ( = ?auto_137167 ?auto_137168 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_137167 ?auto_137168 )
      ( !STACK ?auto_137167 ?auto_137166 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_137182 - BLOCK
      ?auto_137183 - BLOCK
      ?auto_137184 - BLOCK
      ?auto_137185 - BLOCK
    )
    :vars
    (
      ?auto_137186 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137185 ?auto_137186 ) ( ON-TABLE ?auto_137182 ) ( ON ?auto_137183 ?auto_137182 ) ( not ( = ?auto_137182 ?auto_137183 ) ) ( not ( = ?auto_137182 ?auto_137184 ) ) ( not ( = ?auto_137182 ?auto_137185 ) ) ( not ( = ?auto_137182 ?auto_137186 ) ) ( not ( = ?auto_137183 ?auto_137184 ) ) ( not ( = ?auto_137183 ?auto_137185 ) ) ( not ( = ?auto_137183 ?auto_137186 ) ) ( not ( = ?auto_137184 ?auto_137185 ) ) ( not ( = ?auto_137184 ?auto_137186 ) ) ( not ( = ?auto_137185 ?auto_137186 ) ) ( CLEAR ?auto_137183 ) ( ON ?auto_137184 ?auto_137185 ) ( CLEAR ?auto_137184 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_137182 ?auto_137183 ?auto_137184 )
      ( MAKE-4PILE ?auto_137182 ?auto_137183 ?auto_137184 ?auto_137185 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_137200 - BLOCK
      ?auto_137201 - BLOCK
      ?auto_137202 - BLOCK
      ?auto_137203 - BLOCK
    )
    :vars
    (
      ?auto_137204 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137203 ?auto_137204 ) ( ON-TABLE ?auto_137200 ) ( not ( = ?auto_137200 ?auto_137201 ) ) ( not ( = ?auto_137200 ?auto_137202 ) ) ( not ( = ?auto_137200 ?auto_137203 ) ) ( not ( = ?auto_137200 ?auto_137204 ) ) ( not ( = ?auto_137201 ?auto_137202 ) ) ( not ( = ?auto_137201 ?auto_137203 ) ) ( not ( = ?auto_137201 ?auto_137204 ) ) ( not ( = ?auto_137202 ?auto_137203 ) ) ( not ( = ?auto_137202 ?auto_137204 ) ) ( not ( = ?auto_137203 ?auto_137204 ) ) ( ON ?auto_137202 ?auto_137203 ) ( CLEAR ?auto_137200 ) ( ON ?auto_137201 ?auto_137202 ) ( CLEAR ?auto_137201 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_137200 ?auto_137201 )
      ( MAKE-4PILE ?auto_137200 ?auto_137201 ?auto_137202 ?auto_137203 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_137218 - BLOCK
      ?auto_137219 - BLOCK
      ?auto_137220 - BLOCK
      ?auto_137221 - BLOCK
    )
    :vars
    (
      ?auto_137222 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137221 ?auto_137222 ) ( not ( = ?auto_137218 ?auto_137219 ) ) ( not ( = ?auto_137218 ?auto_137220 ) ) ( not ( = ?auto_137218 ?auto_137221 ) ) ( not ( = ?auto_137218 ?auto_137222 ) ) ( not ( = ?auto_137219 ?auto_137220 ) ) ( not ( = ?auto_137219 ?auto_137221 ) ) ( not ( = ?auto_137219 ?auto_137222 ) ) ( not ( = ?auto_137220 ?auto_137221 ) ) ( not ( = ?auto_137220 ?auto_137222 ) ) ( not ( = ?auto_137221 ?auto_137222 ) ) ( ON ?auto_137220 ?auto_137221 ) ( ON ?auto_137219 ?auto_137220 ) ( ON ?auto_137218 ?auto_137219 ) ( CLEAR ?auto_137218 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_137218 )
      ( MAKE-4PILE ?auto_137218 ?auto_137219 ?auto_137220 ?auto_137221 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_137237 - BLOCK
      ?auto_137238 - BLOCK
      ?auto_137239 - BLOCK
      ?auto_137240 - BLOCK
      ?auto_137241 - BLOCK
    )
    :vars
    (
      ?auto_137242 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_137240 ) ( ON ?auto_137241 ?auto_137242 ) ( CLEAR ?auto_137241 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_137237 ) ( ON ?auto_137238 ?auto_137237 ) ( ON ?auto_137239 ?auto_137238 ) ( ON ?auto_137240 ?auto_137239 ) ( not ( = ?auto_137237 ?auto_137238 ) ) ( not ( = ?auto_137237 ?auto_137239 ) ) ( not ( = ?auto_137237 ?auto_137240 ) ) ( not ( = ?auto_137237 ?auto_137241 ) ) ( not ( = ?auto_137237 ?auto_137242 ) ) ( not ( = ?auto_137238 ?auto_137239 ) ) ( not ( = ?auto_137238 ?auto_137240 ) ) ( not ( = ?auto_137238 ?auto_137241 ) ) ( not ( = ?auto_137238 ?auto_137242 ) ) ( not ( = ?auto_137239 ?auto_137240 ) ) ( not ( = ?auto_137239 ?auto_137241 ) ) ( not ( = ?auto_137239 ?auto_137242 ) ) ( not ( = ?auto_137240 ?auto_137241 ) ) ( not ( = ?auto_137240 ?auto_137242 ) ) ( not ( = ?auto_137241 ?auto_137242 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_137241 ?auto_137242 )
      ( !STACK ?auto_137241 ?auto_137240 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_137259 - BLOCK
      ?auto_137260 - BLOCK
      ?auto_137261 - BLOCK
      ?auto_137262 - BLOCK
      ?auto_137263 - BLOCK
    )
    :vars
    (
      ?auto_137264 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137263 ?auto_137264 ) ( ON-TABLE ?auto_137259 ) ( ON ?auto_137260 ?auto_137259 ) ( ON ?auto_137261 ?auto_137260 ) ( not ( = ?auto_137259 ?auto_137260 ) ) ( not ( = ?auto_137259 ?auto_137261 ) ) ( not ( = ?auto_137259 ?auto_137262 ) ) ( not ( = ?auto_137259 ?auto_137263 ) ) ( not ( = ?auto_137259 ?auto_137264 ) ) ( not ( = ?auto_137260 ?auto_137261 ) ) ( not ( = ?auto_137260 ?auto_137262 ) ) ( not ( = ?auto_137260 ?auto_137263 ) ) ( not ( = ?auto_137260 ?auto_137264 ) ) ( not ( = ?auto_137261 ?auto_137262 ) ) ( not ( = ?auto_137261 ?auto_137263 ) ) ( not ( = ?auto_137261 ?auto_137264 ) ) ( not ( = ?auto_137262 ?auto_137263 ) ) ( not ( = ?auto_137262 ?auto_137264 ) ) ( not ( = ?auto_137263 ?auto_137264 ) ) ( CLEAR ?auto_137261 ) ( ON ?auto_137262 ?auto_137263 ) ( CLEAR ?auto_137262 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_137259 ?auto_137260 ?auto_137261 ?auto_137262 )
      ( MAKE-5PILE ?auto_137259 ?auto_137260 ?auto_137261 ?auto_137262 ?auto_137263 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_137281 - BLOCK
      ?auto_137282 - BLOCK
      ?auto_137283 - BLOCK
      ?auto_137284 - BLOCK
      ?auto_137285 - BLOCK
    )
    :vars
    (
      ?auto_137286 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137285 ?auto_137286 ) ( ON-TABLE ?auto_137281 ) ( ON ?auto_137282 ?auto_137281 ) ( not ( = ?auto_137281 ?auto_137282 ) ) ( not ( = ?auto_137281 ?auto_137283 ) ) ( not ( = ?auto_137281 ?auto_137284 ) ) ( not ( = ?auto_137281 ?auto_137285 ) ) ( not ( = ?auto_137281 ?auto_137286 ) ) ( not ( = ?auto_137282 ?auto_137283 ) ) ( not ( = ?auto_137282 ?auto_137284 ) ) ( not ( = ?auto_137282 ?auto_137285 ) ) ( not ( = ?auto_137282 ?auto_137286 ) ) ( not ( = ?auto_137283 ?auto_137284 ) ) ( not ( = ?auto_137283 ?auto_137285 ) ) ( not ( = ?auto_137283 ?auto_137286 ) ) ( not ( = ?auto_137284 ?auto_137285 ) ) ( not ( = ?auto_137284 ?auto_137286 ) ) ( not ( = ?auto_137285 ?auto_137286 ) ) ( ON ?auto_137284 ?auto_137285 ) ( CLEAR ?auto_137282 ) ( ON ?auto_137283 ?auto_137284 ) ( CLEAR ?auto_137283 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_137281 ?auto_137282 ?auto_137283 )
      ( MAKE-5PILE ?auto_137281 ?auto_137282 ?auto_137283 ?auto_137284 ?auto_137285 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_137303 - BLOCK
      ?auto_137304 - BLOCK
      ?auto_137305 - BLOCK
      ?auto_137306 - BLOCK
      ?auto_137307 - BLOCK
    )
    :vars
    (
      ?auto_137308 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137307 ?auto_137308 ) ( ON-TABLE ?auto_137303 ) ( not ( = ?auto_137303 ?auto_137304 ) ) ( not ( = ?auto_137303 ?auto_137305 ) ) ( not ( = ?auto_137303 ?auto_137306 ) ) ( not ( = ?auto_137303 ?auto_137307 ) ) ( not ( = ?auto_137303 ?auto_137308 ) ) ( not ( = ?auto_137304 ?auto_137305 ) ) ( not ( = ?auto_137304 ?auto_137306 ) ) ( not ( = ?auto_137304 ?auto_137307 ) ) ( not ( = ?auto_137304 ?auto_137308 ) ) ( not ( = ?auto_137305 ?auto_137306 ) ) ( not ( = ?auto_137305 ?auto_137307 ) ) ( not ( = ?auto_137305 ?auto_137308 ) ) ( not ( = ?auto_137306 ?auto_137307 ) ) ( not ( = ?auto_137306 ?auto_137308 ) ) ( not ( = ?auto_137307 ?auto_137308 ) ) ( ON ?auto_137306 ?auto_137307 ) ( ON ?auto_137305 ?auto_137306 ) ( CLEAR ?auto_137303 ) ( ON ?auto_137304 ?auto_137305 ) ( CLEAR ?auto_137304 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_137303 ?auto_137304 )
      ( MAKE-5PILE ?auto_137303 ?auto_137304 ?auto_137305 ?auto_137306 ?auto_137307 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_137325 - BLOCK
      ?auto_137326 - BLOCK
      ?auto_137327 - BLOCK
      ?auto_137328 - BLOCK
      ?auto_137329 - BLOCK
    )
    :vars
    (
      ?auto_137330 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137329 ?auto_137330 ) ( not ( = ?auto_137325 ?auto_137326 ) ) ( not ( = ?auto_137325 ?auto_137327 ) ) ( not ( = ?auto_137325 ?auto_137328 ) ) ( not ( = ?auto_137325 ?auto_137329 ) ) ( not ( = ?auto_137325 ?auto_137330 ) ) ( not ( = ?auto_137326 ?auto_137327 ) ) ( not ( = ?auto_137326 ?auto_137328 ) ) ( not ( = ?auto_137326 ?auto_137329 ) ) ( not ( = ?auto_137326 ?auto_137330 ) ) ( not ( = ?auto_137327 ?auto_137328 ) ) ( not ( = ?auto_137327 ?auto_137329 ) ) ( not ( = ?auto_137327 ?auto_137330 ) ) ( not ( = ?auto_137328 ?auto_137329 ) ) ( not ( = ?auto_137328 ?auto_137330 ) ) ( not ( = ?auto_137329 ?auto_137330 ) ) ( ON ?auto_137328 ?auto_137329 ) ( ON ?auto_137327 ?auto_137328 ) ( ON ?auto_137326 ?auto_137327 ) ( ON ?auto_137325 ?auto_137326 ) ( CLEAR ?auto_137325 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_137325 )
      ( MAKE-5PILE ?auto_137325 ?auto_137326 ?auto_137327 ?auto_137328 ?auto_137329 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_137348 - BLOCK
      ?auto_137349 - BLOCK
      ?auto_137350 - BLOCK
      ?auto_137351 - BLOCK
      ?auto_137352 - BLOCK
      ?auto_137353 - BLOCK
    )
    :vars
    (
      ?auto_137354 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_137352 ) ( ON ?auto_137353 ?auto_137354 ) ( CLEAR ?auto_137353 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_137348 ) ( ON ?auto_137349 ?auto_137348 ) ( ON ?auto_137350 ?auto_137349 ) ( ON ?auto_137351 ?auto_137350 ) ( ON ?auto_137352 ?auto_137351 ) ( not ( = ?auto_137348 ?auto_137349 ) ) ( not ( = ?auto_137348 ?auto_137350 ) ) ( not ( = ?auto_137348 ?auto_137351 ) ) ( not ( = ?auto_137348 ?auto_137352 ) ) ( not ( = ?auto_137348 ?auto_137353 ) ) ( not ( = ?auto_137348 ?auto_137354 ) ) ( not ( = ?auto_137349 ?auto_137350 ) ) ( not ( = ?auto_137349 ?auto_137351 ) ) ( not ( = ?auto_137349 ?auto_137352 ) ) ( not ( = ?auto_137349 ?auto_137353 ) ) ( not ( = ?auto_137349 ?auto_137354 ) ) ( not ( = ?auto_137350 ?auto_137351 ) ) ( not ( = ?auto_137350 ?auto_137352 ) ) ( not ( = ?auto_137350 ?auto_137353 ) ) ( not ( = ?auto_137350 ?auto_137354 ) ) ( not ( = ?auto_137351 ?auto_137352 ) ) ( not ( = ?auto_137351 ?auto_137353 ) ) ( not ( = ?auto_137351 ?auto_137354 ) ) ( not ( = ?auto_137352 ?auto_137353 ) ) ( not ( = ?auto_137352 ?auto_137354 ) ) ( not ( = ?auto_137353 ?auto_137354 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_137353 ?auto_137354 )
      ( !STACK ?auto_137353 ?auto_137352 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_137374 - BLOCK
      ?auto_137375 - BLOCK
      ?auto_137376 - BLOCK
      ?auto_137377 - BLOCK
      ?auto_137378 - BLOCK
      ?auto_137379 - BLOCK
    )
    :vars
    (
      ?auto_137380 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137379 ?auto_137380 ) ( ON-TABLE ?auto_137374 ) ( ON ?auto_137375 ?auto_137374 ) ( ON ?auto_137376 ?auto_137375 ) ( ON ?auto_137377 ?auto_137376 ) ( not ( = ?auto_137374 ?auto_137375 ) ) ( not ( = ?auto_137374 ?auto_137376 ) ) ( not ( = ?auto_137374 ?auto_137377 ) ) ( not ( = ?auto_137374 ?auto_137378 ) ) ( not ( = ?auto_137374 ?auto_137379 ) ) ( not ( = ?auto_137374 ?auto_137380 ) ) ( not ( = ?auto_137375 ?auto_137376 ) ) ( not ( = ?auto_137375 ?auto_137377 ) ) ( not ( = ?auto_137375 ?auto_137378 ) ) ( not ( = ?auto_137375 ?auto_137379 ) ) ( not ( = ?auto_137375 ?auto_137380 ) ) ( not ( = ?auto_137376 ?auto_137377 ) ) ( not ( = ?auto_137376 ?auto_137378 ) ) ( not ( = ?auto_137376 ?auto_137379 ) ) ( not ( = ?auto_137376 ?auto_137380 ) ) ( not ( = ?auto_137377 ?auto_137378 ) ) ( not ( = ?auto_137377 ?auto_137379 ) ) ( not ( = ?auto_137377 ?auto_137380 ) ) ( not ( = ?auto_137378 ?auto_137379 ) ) ( not ( = ?auto_137378 ?auto_137380 ) ) ( not ( = ?auto_137379 ?auto_137380 ) ) ( CLEAR ?auto_137377 ) ( ON ?auto_137378 ?auto_137379 ) ( CLEAR ?auto_137378 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_137374 ?auto_137375 ?auto_137376 ?auto_137377 ?auto_137378 )
      ( MAKE-6PILE ?auto_137374 ?auto_137375 ?auto_137376 ?auto_137377 ?auto_137378 ?auto_137379 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_137400 - BLOCK
      ?auto_137401 - BLOCK
      ?auto_137402 - BLOCK
      ?auto_137403 - BLOCK
      ?auto_137404 - BLOCK
      ?auto_137405 - BLOCK
    )
    :vars
    (
      ?auto_137406 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137405 ?auto_137406 ) ( ON-TABLE ?auto_137400 ) ( ON ?auto_137401 ?auto_137400 ) ( ON ?auto_137402 ?auto_137401 ) ( not ( = ?auto_137400 ?auto_137401 ) ) ( not ( = ?auto_137400 ?auto_137402 ) ) ( not ( = ?auto_137400 ?auto_137403 ) ) ( not ( = ?auto_137400 ?auto_137404 ) ) ( not ( = ?auto_137400 ?auto_137405 ) ) ( not ( = ?auto_137400 ?auto_137406 ) ) ( not ( = ?auto_137401 ?auto_137402 ) ) ( not ( = ?auto_137401 ?auto_137403 ) ) ( not ( = ?auto_137401 ?auto_137404 ) ) ( not ( = ?auto_137401 ?auto_137405 ) ) ( not ( = ?auto_137401 ?auto_137406 ) ) ( not ( = ?auto_137402 ?auto_137403 ) ) ( not ( = ?auto_137402 ?auto_137404 ) ) ( not ( = ?auto_137402 ?auto_137405 ) ) ( not ( = ?auto_137402 ?auto_137406 ) ) ( not ( = ?auto_137403 ?auto_137404 ) ) ( not ( = ?auto_137403 ?auto_137405 ) ) ( not ( = ?auto_137403 ?auto_137406 ) ) ( not ( = ?auto_137404 ?auto_137405 ) ) ( not ( = ?auto_137404 ?auto_137406 ) ) ( not ( = ?auto_137405 ?auto_137406 ) ) ( ON ?auto_137404 ?auto_137405 ) ( CLEAR ?auto_137402 ) ( ON ?auto_137403 ?auto_137404 ) ( CLEAR ?auto_137403 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_137400 ?auto_137401 ?auto_137402 ?auto_137403 )
      ( MAKE-6PILE ?auto_137400 ?auto_137401 ?auto_137402 ?auto_137403 ?auto_137404 ?auto_137405 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_137426 - BLOCK
      ?auto_137427 - BLOCK
      ?auto_137428 - BLOCK
      ?auto_137429 - BLOCK
      ?auto_137430 - BLOCK
      ?auto_137431 - BLOCK
    )
    :vars
    (
      ?auto_137432 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137431 ?auto_137432 ) ( ON-TABLE ?auto_137426 ) ( ON ?auto_137427 ?auto_137426 ) ( not ( = ?auto_137426 ?auto_137427 ) ) ( not ( = ?auto_137426 ?auto_137428 ) ) ( not ( = ?auto_137426 ?auto_137429 ) ) ( not ( = ?auto_137426 ?auto_137430 ) ) ( not ( = ?auto_137426 ?auto_137431 ) ) ( not ( = ?auto_137426 ?auto_137432 ) ) ( not ( = ?auto_137427 ?auto_137428 ) ) ( not ( = ?auto_137427 ?auto_137429 ) ) ( not ( = ?auto_137427 ?auto_137430 ) ) ( not ( = ?auto_137427 ?auto_137431 ) ) ( not ( = ?auto_137427 ?auto_137432 ) ) ( not ( = ?auto_137428 ?auto_137429 ) ) ( not ( = ?auto_137428 ?auto_137430 ) ) ( not ( = ?auto_137428 ?auto_137431 ) ) ( not ( = ?auto_137428 ?auto_137432 ) ) ( not ( = ?auto_137429 ?auto_137430 ) ) ( not ( = ?auto_137429 ?auto_137431 ) ) ( not ( = ?auto_137429 ?auto_137432 ) ) ( not ( = ?auto_137430 ?auto_137431 ) ) ( not ( = ?auto_137430 ?auto_137432 ) ) ( not ( = ?auto_137431 ?auto_137432 ) ) ( ON ?auto_137430 ?auto_137431 ) ( ON ?auto_137429 ?auto_137430 ) ( CLEAR ?auto_137427 ) ( ON ?auto_137428 ?auto_137429 ) ( CLEAR ?auto_137428 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_137426 ?auto_137427 ?auto_137428 )
      ( MAKE-6PILE ?auto_137426 ?auto_137427 ?auto_137428 ?auto_137429 ?auto_137430 ?auto_137431 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_137452 - BLOCK
      ?auto_137453 - BLOCK
      ?auto_137454 - BLOCK
      ?auto_137455 - BLOCK
      ?auto_137456 - BLOCK
      ?auto_137457 - BLOCK
    )
    :vars
    (
      ?auto_137458 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137457 ?auto_137458 ) ( ON-TABLE ?auto_137452 ) ( not ( = ?auto_137452 ?auto_137453 ) ) ( not ( = ?auto_137452 ?auto_137454 ) ) ( not ( = ?auto_137452 ?auto_137455 ) ) ( not ( = ?auto_137452 ?auto_137456 ) ) ( not ( = ?auto_137452 ?auto_137457 ) ) ( not ( = ?auto_137452 ?auto_137458 ) ) ( not ( = ?auto_137453 ?auto_137454 ) ) ( not ( = ?auto_137453 ?auto_137455 ) ) ( not ( = ?auto_137453 ?auto_137456 ) ) ( not ( = ?auto_137453 ?auto_137457 ) ) ( not ( = ?auto_137453 ?auto_137458 ) ) ( not ( = ?auto_137454 ?auto_137455 ) ) ( not ( = ?auto_137454 ?auto_137456 ) ) ( not ( = ?auto_137454 ?auto_137457 ) ) ( not ( = ?auto_137454 ?auto_137458 ) ) ( not ( = ?auto_137455 ?auto_137456 ) ) ( not ( = ?auto_137455 ?auto_137457 ) ) ( not ( = ?auto_137455 ?auto_137458 ) ) ( not ( = ?auto_137456 ?auto_137457 ) ) ( not ( = ?auto_137456 ?auto_137458 ) ) ( not ( = ?auto_137457 ?auto_137458 ) ) ( ON ?auto_137456 ?auto_137457 ) ( ON ?auto_137455 ?auto_137456 ) ( ON ?auto_137454 ?auto_137455 ) ( CLEAR ?auto_137452 ) ( ON ?auto_137453 ?auto_137454 ) ( CLEAR ?auto_137453 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_137452 ?auto_137453 )
      ( MAKE-6PILE ?auto_137452 ?auto_137453 ?auto_137454 ?auto_137455 ?auto_137456 ?auto_137457 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_137478 - BLOCK
      ?auto_137479 - BLOCK
      ?auto_137480 - BLOCK
      ?auto_137481 - BLOCK
      ?auto_137482 - BLOCK
      ?auto_137483 - BLOCK
    )
    :vars
    (
      ?auto_137484 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137483 ?auto_137484 ) ( not ( = ?auto_137478 ?auto_137479 ) ) ( not ( = ?auto_137478 ?auto_137480 ) ) ( not ( = ?auto_137478 ?auto_137481 ) ) ( not ( = ?auto_137478 ?auto_137482 ) ) ( not ( = ?auto_137478 ?auto_137483 ) ) ( not ( = ?auto_137478 ?auto_137484 ) ) ( not ( = ?auto_137479 ?auto_137480 ) ) ( not ( = ?auto_137479 ?auto_137481 ) ) ( not ( = ?auto_137479 ?auto_137482 ) ) ( not ( = ?auto_137479 ?auto_137483 ) ) ( not ( = ?auto_137479 ?auto_137484 ) ) ( not ( = ?auto_137480 ?auto_137481 ) ) ( not ( = ?auto_137480 ?auto_137482 ) ) ( not ( = ?auto_137480 ?auto_137483 ) ) ( not ( = ?auto_137480 ?auto_137484 ) ) ( not ( = ?auto_137481 ?auto_137482 ) ) ( not ( = ?auto_137481 ?auto_137483 ) ) ( not ( = ?auto_137481 ?auto_137484 ) ) ( not ( = ?auto_137482 ?auto_137483 ) ) ( not ( = ?auto_137482 ?auto_137484 ) ) ( not ( = ?auto_137483 ?auto_137484 ) ) ( ON ?auto_137482 ?auto_137483 ) ( ON ?auto_137481 ?auto_137482 ) ( ON ?auto_137480 ?auto_137481 ) ( ON ?auto_137479 ?auto_137480 ) ( ON ?auto_137478 ?auto_137479 ) ( CLEAR ?auto_137478 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_137478 )
      ( MAKE-6PILE ?auto_137478 ?auto_137479 ?auto_137480 ?auto_137481 ?auto_137482 ?auto_137483 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_137505 - BLOCK
      ?auto_137506 - BLOCK
      ?auto_137507 - BLOCK
      ?auto_137508 - BLOCK
      ?auto_137509 - BLOCK
      ?auto_137510 - BLOCK
      ?auto_137511 - BLOCK
    )
    :vars
    (
      ?auto_137512 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_137510 ) ( ON ?auto_137511 ?auto_137512 ) ( CLEAR ?auto_137511 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_137505 ) ( ON ?auto_137506 ?auto_137505 ) ( ON ?auto_137507 ?auto_137506 ) ( ON ?auto_137508 ?auto_137507 ) ( ON ?auto_137509 ?auto_137508 ) ( ON ?auto_137510 ?auto_137509 ) ( not ( = ?auto_137505 ?auto_137506 ) ) ( not ( = ?auto_137505 ?auto_137507 ) ) ( not ( = ?auto_137505 ?auto_137508 ) ) ( not ( = ?auto_137505 ?auto_137509 ) ) ( not ( = ?auto_137505 ?auto_137510 ) ) ( not ( = ?auto_137505 ?auto_137511 ) ) ( not ( = ?auto_137505 ?auto_137512 ) ) ( not ( = ?auto_137506 ?auto_137507 ) ) ( not ( = ?auto_137506 ?auto_137508 ) ) ( not ( = ?auto_137506 ?auto_137509 ) ) ( not ( = ?auto_137506 ?auto_137510 ) ) ( not ( = ?auto_137506 ?auto_137511 ) ) ( not ( = ?auto_137506 ?auto_137512 ) ) ( not ( = ?auto_137507 ?auto_137508 ) ) ( not ( = ?auto_137507 ?auto_137509 ) ) ( not ( = ?auto_137507 ?auto_137510 ) ) ( not ( = ?auto_137507 ?auto_137511 ) ) ( not ( = ?auto_137507 ?auto_137512 ) ) ( not ( = ?auto_137508 ?auto_137509 ) ) ( not ( = ?auto_137508 ?auto_137510 ) ) ( not ( = ?auto_137508 ?auto_137511 ) ) ( not ( = ?auto_137508 ?auto_137512 ) ) ( not ( = ?auto_137509 ?auto_137510 ) ) ( not ( = ?auto_137509 ?auto_137511 ) ) ( not ( = ?auto_137509 ?auto_137512 ) ) ( not ( = ?auto_137510 ?auto_137511 ) ) ( not ( = ?auto_137510 ?auto_137512 ) ) ( not ( = ?auto_137511 ?auto_137512 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_137511 ?auto_137512 )
      ( !STACK ?auto_137511 ?auto_137510 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_137535 - BLOCK
      ?auto_137536 - BLOCK
      ?auto_137537 - BLOCK
      ?auto_137538 - BLOCK
      ?auto_137539 - BLOCK
      ?auto_137540 - BLOCK
      ?auto_137541 - BLOCK
    )
    :vars
    (
      ?auto_137542 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137541 ?auto_137542 ) ( ON-TABLE ?auto_137535 ) ( ON ?auto_137536 ?auto_137535 ) ( ON ?auto_137537 ?auto_137536 ) ( ON ?auto_137538 ?auto_137537 ) ( ON ?auto_137539 ?auto_137538 ) ( not ( = ?auto_137535 ?auto_137536 ) ) ( not ( = ?auto_137535 ?auto_137537 ) ) ( not ( = ?auto_137535 ?auto_137538 ) ) ( not ( = ?auto_137535 ?auto_137539 ) ) ( not ( = ?auto_137535 ?auto_137540 ) ) ( not ( = ?auto_137535 ?auto_137541 ) ) ( not ( = ?auto_137535 ?auto_137542 ) ) ( not ( = ?auto_137536 ?auto_137537 ) ) ( not ( = ?auto_137536 ?auto_137538 ) ) ( not ( = ?auto_137536 ?auto_137539 ) ) ( not ( = ?auto_137536 ?auto_137540 ) ) ( not ( = ?auto_137536 ?auto_137541 ) ) ( not ( = ?auto_137536 ?auto_137542 ) ) ( not ( = ?auto_137537 ?auto_137538 ) ) ( not ( = ?auto_137537 ?auto_137539 ) ) ( not ( = ?auto_137537 ?auto_137540 ) ) ( not ( = ?auto_137537 ?auto_137541 ) ) ( not ( = ?auto_137537 ?auto_137542 ) ) ( not ( = ?auto_137538 ?auto_137539 ) ) ( not ( = ?auto_137538 ?auto_137540 ) ) ( not ( = ?auto_137538 ?auto_137541 ) ) ( not ( = ?auto_137538 ?auto_137542 ) ) ( not ( = ?auto_137539 ?auto_137540 ) ) ( not ( = ?auto_137539 ?auto_137541 ) ) ( not ( = ?auto_137539 ?auto_137542 ) ) ( not ( = ?auto_137540 ?auto_137541 ) ) ( not ( = ?auto_137540 ?auto_137542 ) ) ( not ( = ?auto_137541 ?auto_137542 ) ) ( CLEAR ?auto_137539 ) ( ON ?auto_137540 ?auto_137541 ) ( CLEAR ?auto_137540 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_137535 ?auto_137536 ?auto_137537 ?auto_137538 ?auto_137539 ?auto_137540 )
      ( MAKE-7PILE ?auto_137535 ?auto_137536 ?auto_137537 ?auto_137538 ?auto_137539 ?auto_137540 ?auto_137541 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_137565 - BLOCK
      ?auto_137566 - BLOCK
      ?auto_137567 - BLOCK
      ?auto_137568 - BLOCK
      ?auto_137569 - BLOCK
      ?auto_137570 - BLOCK
      ?auto_137571 - BLOCK
    )
    :vars
    (
      ?auto_137572 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137571 ?auto_137572 ) ( ON-TABLE ?auto_137565 ) ( ON ?auto_137566 ?auto_137565 ) ( ON ?auto_137567 ?auto_137566 ) ( ON ?auto_137568 ?auto_137567 ) ( not ( = ?auto_137565 ?auto_137566 ) ) ( not ( = ?auto_137565 ?auto_137567 ) ) ( not ( = ?auto_137565 ?auto_137568 ) ) ( not ( = ?auto_137565 ?auto_137569 ) ) ( not ( = ?auto_137565 ?auto_137570 ) ) ( not ( = ?auto_137565 ?auto_137571 ) ) ( not ( = ?auto_137565 ?auto_137572 ) ) ( not ( = ?auto_137566 ?auto_137567 ) ) ( not ( = ?auto_137566 ?auto_137568 ) ) ( not ( = ?auto_137566 ?auto_137569 ) ) ( not ( = ?auto_137566 ?auto_137570 ) ) ( not ( = ?auto_137566 ?auto_137571 ) ) ( not ( = ?auto_137566 ?auto_137572 ) ) ( not ( = ?auto_137567 ?auto_137568 ) ) ( not ( = ?auto_137567 ?auto_137569 ) ) ( not ( = ?auto_137567 ?auto_137570 ) ) ( not ( = ?auto_137567 ?auto_137571 ) ) ( not ( = ?auto_137567 ?auto_137572 ) ) ( not ( = ?auto_137568 ?auto_137569 ) ) ( not ( = ?auto_137568 ?auto_137570 ) ) ( not ( = ?auto_137568 ?auto_137571 ) ) ( not ( = ?auto_137568 ?auto_137572 ) ) ( not ( = ?auto_137569 ?auto_137570 ) ) ( not ( = ?auto_137569 ?auto_137571 ) ) ( not ( = ?auto_137569 ?auto_137572 ) ) ( not ( = ?auto_137570 ?auto_137571 ) ) ( not ( = ?auto_137570 ?auto_137572 ) ) ( not ( = ?auto_137571 ?auto_137572 ) ) ( ON ?auto_137570 ?auto_137571 ) ( CLEAR ?auto_137568 ) ( ON ?auto_137569 ?auto_137570 ) ( CLEAR ?auto_137569 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_137565 ?auto_137566 ?auto_137567 ?auto_137568 ?auto_137569 )
      ( MAKE-7PILE ?auto_137565 ?auto_137566 ?auto_137567 ?auto_137568 ?auto_137569 ?auto_137570 ?auto_137571 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_137595 - BLOCK
      ?auto_137596 - BLOCK
      ?auto_137597 - BLOCK
      ?auto_137598 - BLOCK
      ?auto_137599 - BLOCK
      ?auto_137600 - BLOCK
      ?auto_137601 - BLOCK
    )
    :vars
    (
      ?auto_137602 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137601 ?auto_137602 ) ( ON-TABLE ?auto_137595 ) ( ON ?auto_137596 ?auto_137595 ) ( ON ?auto_137597 ?auto_137596 ) ( not ( = ?auto_137595 ?auto_137596 ) ) ( not ( = ?auto_137595 ?auto_137597 ) ) ( not ( = ?auto_137595 ?auto_137598 ) ) ( not ( = ?auto_137595 ?auto_137599 ) ) ( not ( = ?auto_137595 ?auto_137600 ) ) ( not ( = ?auto_137595 ?auto_137601 ) ) ( not ( = ?auto_137595 ?auto_137602 ) ) ( not ( = ?auto_137596 ?auto_137597 ) ) ( not ( = ?auto_137596 ?auto_137598 ) ) ( not ( = ?auto_137596 ?auto_137599 ) ) ( not ( = ?auto_137596 ?auto_137600 ) ) ( not ( = ?auto_137596 ?auto_137601 ) ) ( not ( = ?auto_137596 ?auto_137602 ) ) ( not ( = ?auto_137597 ?auto_137598 ) ) ( not ( = ?auto_137597 ?auto_137599 ) ) ( not ( = ?auto_137597 ?auto_137600 ) ) ( not ( = ?auto_137597 ?auto_137601 ) ) ( not ( = ?auto_137597 ?auto_137602 ) ) ( not ( = ?auto_137598 ?auto_137599 ) ) ( not ( = ?auto_137598 ?auto_137600 ) ) ( not ( = ?auto_137598 ?auto_137601 ) ) ( not ( = ?auto_137598 ?auto_137602 ) ) ( not ( = ?auto_137599 ?auto_137600 ) ) ( not ( = ?auto_137599 ?auto_137601 ) ) ( not ( = ?auto_137599 ?auto_137602 ) ) ( not ( = ?auto_137600 ?auto_137601 ) ) ( not ( = ?auto_137600 ?auto_137602 ) ) ( not ( = ?auto_137601 ?auto_137602 ) ) ( ON ?auto_137600 ?auto_137601 ) ( ON ?auto_137599 ?auto_137600 ) ( CLEAR ?auto_137597 ) ( ON ?auto_137598 ?auto_137599 ) ( CLEAR ?auto_137598 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_137595 ?auto_137596 ?auto_137597 ?auto_137598 )
      ( MAKE-7PILE ?auto_137595 ?auto_137596 ?auto_137597 ?auto_137598 ?auto_137599 ?auto_137600 ?auto_137601 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_137625 - BLOCK
      ?auto_137626 - BLOCK
      ?auto_137627 - BLOCK
      ?auto_137628 - BLOCK
      ?auto_137629 - BLOCK
      ?auto_137630 - BLOCK
      ?auto_137631 - BLOCK
    )
    :vars
    (
      ?auto_137632 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137631 ?auto_137632 ) ( ON-TABLE ?auto_137625 ) ( ON ?auto_137626 ?auto_137625 ) ( not ( = ?auto_137625 ?auto_137626 ) ) ( not ( = ?auto_137625 ?auto_137627 ) ) ( not ( = ?auto_137625 ?auto_137628 ) ) ( not ( = ?auto_137625 ?auto_137629 ) ) ( not ( = ?auto_137625 ?auto_137630 ) ) ( not ( = ?auto_137625 ?auto_137631 ) ) ( not ( = ?auto_137625 ?auto_137632 ) ) ( not ( = ?auto_137626 ?auto_137627 ) ) ( not ( = ?auto_137626 ?auto_137628 ) ) ( not ( = ?auto_137626 ?auto_137629 ) ) ( not ( = ?auto_137626 ?auto_137630 ) ) ( not ( = ?auto_137626 ?auto_137631 ) ) ( not ( = ?auto_137626 ?auto_137632 ) ) ( not ( = ?auto_137627 ?auto_137628 ) ) ( not ( = ?auto_137627 ?auto_137629 ) ) ( not ( = ?auto_137627 ?auto_137630 ) ) ( not ( = ?auto_137627 ?auto_137631 ) ) ( not ( = ?auto_137627 ?auto_137632 ) ) ( not ( = ?auto_137628 ?auto_137629 ) ) ( not ( = ?auto_137628 ?auto_137630 ) ) ( not ( = ?auto_137628 ?auto_137631 ) ) ( not ( = ?auto_137628 ?auto_137632 ) ) ( not ( = ?auto_137629 ?auto_137630 ) ) ( not ( = ?auto_137629 ?auto_137631 ) ) ( not ( = ?auto_137629 ?auto_137632 ) ) ( not ( = ?auto_137630 ?auto_137631 ) ) ( not ( = ?auto_137630 ?auto_137632 ) ) ( not ( = ?auto_137631 ?auto_137632 ) ) ( ON ?auto_137630 ?auto_137631 ) ( ON ?auto_137629 ?auto_137630 ) ( ON ?auto_137628 ?auto_137629 ) ( CLEAR ?auto_137626 ) ( ON ?auto_137627 ?auto_137628 ) ( CLEAR ?auto_137627 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_137625 ?auto_137626 ?auto_137627 )
      ( MAKE-7PILE ?auto_137625 ?auto_137626 ?auto_137627 ?auto_137628 ?auto_137629 ?auto_137630 ?auto_137631 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_137655 - BLOCK
      ?auto_137656 - BLOCK
      ?auto_137657 - BLOCK
      ?auto_137658 - BLOCK
      ?auto_137659 - BLOCK
      ?auto_137660 - BLOCK
      ?auto_137661 - BLOCK
    )
    :vars
    (
      ?auto_137662 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137661 ?auto_137662 ) ( ON-TABLE ?auto_137655 ) ( not ( = ?auto_137655 ?auto_137656 ) ) ( not ( = ?auto_137655 ?auto_137657 ) ) ( not ( = ?auto_137655 ?auto_137658 ) ) ( not ( = ?auto_137655 ?auto_137659 ) ) ( not ( = ?auto_137655 ?auto_137660 ) ) ( not ( = ?auto_137655 ?auto_137661 ) ) ( not ( = ?auto_137655 ?auto_137662 ) ) ( not ( = ?auto_137656 ?auto_137657 ) ) ( not ( = ?auto_137656 ?auto_137658 ) ) ( not ( = ?auto_137656 ?auto_137659 ) ) ( not ( = ?auto_137656 ?auto_137660 ) ) ( not ( = ?auto_137656 ?auto_137661 ) ) ( not ( = ?auto_137656 ?auto_137662 ) ) ( not ( = ?auto_137657 ?auto_137658 ) ) ( not ( = ?auto_137657 ?auto_137659 ) ) ( not ( = ?auto_137657 ?auto_137660 ) ) ( not ( = ?auto_137657 ?auto_137661 ) ) ( not ( = ?auto_137657 ?auto_137662 ) ) ( not ( = ?auto_137658 ?auto_137659 ) ) ( not ( = ?auto_137658 ?auto_137660 ) ) ( not ( = ?auto_137658 ?auto_137661 ) ) ( not ( = ?auto_137658 ?auto_137662 ) ) ( not ( = ?auto_137659 ?auto_137660 ) ) ( not ( = ?auto_137659 ?auto_137661 ) ) ( not ( = ?auto_137659 ?auto_137662 ) ) ( not ( = ?auto_137660 ?auto_137661 ) ) ( not ( = ?auto_137660 ?auto_137662 ) ) ( not ( = ?auto_137661 ?auto_137662 ) ) ( ON ?auto_137660 ?auto_137661 ) ( ON ?auto_137659 ?auto_137660 ) ( ON ?auto_137658 ?auto_137659 ) ( ON ?auto_137657 ?auto_137658 ) ( CLEAR ?auto_137655 ) ( ON ?auto_137656 ?auto_137657 ) ( CLEAR ?auto_137656 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_137655 ?auto_137656 )
      ( MAKE-7PILE ?auto_137655 ?auto_137656 ?auto_137657 ?auto_137658 ?auto_137659 ?auto_137660 ?auto_137661 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_137685 - BLOCK
      ?auto_137686 - BLOCK
      ?auto_137687 - BLOCK
      ?auto_137688 - BLOCK
      ?auto_137689 - BLOCK
      ?auto_137690 - BLOCK
      ?auto_137691 - BLOCK
    )
    :vars
    (
      ?auto_137692 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137691 ?auto_137692 ) ( not ( = ?auto_137685 ?auto_137686 ) ) ( not ( = ?auto_137685 ?auto_137687 ) ) ( not ( = ?auto_137685 ?auto_137688 ) ) ( not ( = ?auto_137685 ?auto_137689 ) ) ( not ( = ?auto_137685 ?auto_137690 ) ) ( not ( = ?auto_137685 ?auto_137691 ) ) ( not ( = ?auto_137685 ?auto_137692 ) ) ( not ( = ?auto_137686 ?auto_137687 ) ) ( not ( = ?auto_137686 ?auto_137688 ) ) ( not ( = ?auto_137686 ?auto_137689 ) ) ( not ( = ?auto_137686 ?auto_137690 ) ) ( not ( = ?auto_137686 ?auto_137691 ) ) ( not ( = ?auto_137686 ?auto_137692 ) ) ( not ( = ?auto_137687 ?auto_137688 ) ) ( not ( = ?auto_137687 ?auto_137689 ) ) ( not ( = ?auto_137687 ?auto_137690 ) ) ( not ( = ?auto_137687 ?auto_137691 ) ) ( not ( = ?auto_137687 ?auto_137692 ) ) ( not ( = ?auto_137688 ?auto_137689 ) ) ( not ( = ?auto_137688 ?auto_137690 ) ) ( not ( = ?auto_137688 ?auto_137691 ) ) ( not ( = ?auto_137688 ?auto_137692 ) ) ( not ( = ?auto_137689 ?auto_137690 ) ) ( not ( = ?auto_137689 ?auto_137691 ) ) ( not ( = ?auto_137689 ?auto_137692 ) ) ( not ( = ?auto_137690 ?auto_137691 ) ) ( not ( = ?auto_137690 ?auto_137692 ) ) ( not ( = ?auto_137691 ?auto_137692 ) ) ( ON ?auto_137690 ?auto_137691 ) ( ON ?auto_137689 ?auto_137690 ) ( ON ?auto_137688 ?auto_137689 ) ( ON ?auto_137687 ?auto_137688 ) ( ON ?auto_137686 ?auto_137687 ) ( ON ?auto_137685 ?auto_137686 ) ( CLEAR ?auto_137685 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_137685 )
      ( MAKE-7PILE ?auto_137685 ?auto_137686 ?auto_137687 ?auto_137688 ?auto_137689 ?auto_137690 ?auto_137691 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_137716 - BLOCK
      ?auto_137717 - BLOCK
      ?auto_137718 - BLOCK
      ?auto_137719 - BLOCK
      ?auto_137720 - BLOCK
      ?auto_137721 - BLOCK
      ?auto_137722 - BLOCK
      ?auto_137723 - BLOCK
    )
    :vars
    (
      ?auto_137724 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_137722 ) ( ON ?auto_137723 ?auto_137724 ) ( CLEAR ?auto_137723 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_137716 ) ( ON ?auto_137717 ?auto_137716 ) ( ON ?auto_137718 ?auto_137717 ) ( ON ?auto_137719 ?auto_137718 ) ( ON ?auto_137720 ?auto_137719 ) ( ON ?auto_137721 ?auto_137720 ) ( ON ?auto_137722 ?auto_137721 ) ( not ( = ?auto_137716 ?auto_137717 ) ) ( not ( = ?auto_137716 ?auto_137718 ) ) ( not ( = ?auto_137716 ?auto_137719 ) ) ( not ( = ?auto_137716 ?auto_137720 ) ) ( not ( = ?auto_137716 ?auto_137721 ) ) ( not ( = ?auto_137716 ?auto_137722 ) ) ( not ( = ?auto_137716 ?auto_137723 ) ) ( not ( = ?auto_137716 ?auto_137724 ) ) ( not ( = ?auto_137717 ?auto_137718 ) ) ( not ( = ?auto_137717 ?auto_137719 ) ) ( not ( = ?auto_137717 ?auto_137720 ) ) ( not ( = ?auto_137717 ?auto_137721 ) ) ( not ( = ?auto_137717 ?auto_137722 ) ) ( not ( = ?auto_137717 ?auto_137723 ) ) ( not ( = ?auto_137717 ?auto_137724 ) ) ( not ( = ?auto_137718 ?auto_137719 ) ) ( not ( = ?auto_137718 ?auto_137720 ) ) ( not ( = ?auto_137718 ?auto_137721 ) ) ( not ( = ?auto_137718 ?auto_137722 ) ) ( not ( = ?auto_137718 ?auto_137723 ) ) ( not ( = ?auto_137718 ?auto_137724 ) ) ( not ( = ?auto_137719 ?auto_137720 ) ) ( not ( = ?auto_137719 ?auto_137721 ) ) ( not ( = ?auto_137719 ?auto_137722 ) ) ( not ( = ?auto_137719 ?auto_137723 ) ) ( not ( = ?auto_137719 ?auto_137724 ) ) ( not ( = ?auto_137720 ?auto_137721 ) ) ( not ( = ?auto_137720 ?auto_137722 ) ) ( not ( = ?auto_137720 ?auto_137723 ) ) ( not ( = ?auto_137720 ?auto_137724 ) ) ( not ( = ?auto_137721 ?auto_137722 ) ) ( not ( = ?auto_137721 ?auto_137723 ) ) ( not ( = ?auto_137721 ?auto_137724 ) ) ( not ( = ?auto_137722 ?auto_137723 ) ) ( not ( = ?auto_137722 ?auto_137724 ) ) ( not ( = ?auto_137723 ?auto_137724 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_137723 ?auto_137724 )
      ( !STACK ?auto_137723 ?auto_137722 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_137750 - BLOCK
      ?auto_137751 - BLOCK
      ?auto_137752 - BLOCK
      ?auto_137753 - BLOCK
      ?auto_137754 - BLOCK
      ?auto_137755 - BLOCK
      ?auto_137756 - BLOCK
      ?auto_137757 - BLOCK
    )
    :vars
    (
      ?auto_137758 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137757 ?auto_137758 ) ( ON-TABLE ?auto_137750 ) ( ON ?auto_137751 ?auto_137750 ) ( ON ?auto_137752 ?auto_137751 ) ( ON ?auto_137753 ?auto_137752 ) ( ON ?auto_137754 ?auto_137753 ) ( ON ?auto_137755 ?auto_137754 ) ( not ( = ?auto_137750 ?auto_137751 ) ) ( not ( = ?auto_137750 ?auto_137752 ) ) ( not ( = ?auto_137750 ?auto_137753 ) ) ( not ( = ?auto_137750 ?auto_137754 ) ) ( not ( = ?auto_137750 ?auto_137755 ) ) ( not ( = ?auto_137750 ?auto_137756 ) ) ( not ( = ?auto_137750 ?auto_137757 ) ) ( not ( = ?auto_137750 ?auto_137758 ) ) ( not ( = ?auto_137751 ?auto_137752 ) ) ( not ( = ?auto_137751 ?auto_137753 ) ) ( not ( = ?auto_137751 ?auto_137754 ) ) ( not ( = ?auto_137751 ?auto_137755 ) ) ( not ( = ?auto_137751 ?auto_137756 ) ) ( not ( = ?auto_137751 ?auto_137757 ) ) ( not ( = ?auto_137751 ?auto_137758 ) ) ( not ( = ?auto_137752 ?auto_137753 ) ) ( not ( = ?auto_137752 ?auto_137754 ) ) ( not ( = ?auto_137752 ?auto_137755 ) ) ( not ( = ?auto_137752 ?auto_137756 ) ) ( not ( = ?auto_137752 ?auto_137757 ) ) ( not ( = ?auto_137752 ?auto_137758 ) ) ( not ( = ?auto_137753 ?auto_137754 ) ) ( not ( = ?auto_137753 ?auto_137755 ) ) ( not ( = ?auto_137753 ?auto_137756 ) ) ( not ( = ?auto_137753 ?auto_137757 ) ) ( not ( = ?auto_137753 ?auto_137758 ) ) ( not ( = ?auto_137754 ?auto_137755 ) ) ( not ( = ?auto_137754 ?auto_137756 ) ) ( not ( = ?auto_137754 ?auto_137757 ) ) ( not ( = ?auto_137754 ?auto_137758 ) ) ( not ( = ?auto_137755 ?auto_137756 ) ) ( not ( = ?auto_137755 ?auto_137757 ) ) ( not ( = ?auto_137755 ?auto_137758 ) ) ( not ( = ?auto_137756 ?auto_137757 ) ) ( not ( = ?auto_137756 ?auto_137758 ) ) ( not ( = ?auto_137757 ?auto_137758 ) ) ( CLEAR ?auto_137755 ) ( ON ?auto_137756 ?auto_137757 ) ( CLEAR ?auto_137756 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_137750 ?auto_137751 ?auto_137752 ?auto_137753 ?auto_137754 ?auto_137755 ?auto_137756 )
      ( MAKE-8PILE ?auto_137750 ?auto_137751 ?auto_137752 ?auto_137753 ?auto_137754 ?auto_137755 ?auto_137756 ?auto_137757 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_137784 - BLOCK
      ?auto_137785 - BLOCK
      ?auto_137786 - BLOCK
      ?auto_137787 - BLOCK
      ?auto_137788 - BLOCK
      ?auto_137789 - BLOCK
      ?auto_137790 - BLOCK
      ?auto_137791 - BLOCK
    )
    :vars
    (
      ?auto_137792 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137791 ?auto_137792 ) ( ON-TABLE ?auto_137784 ) ( ON ?auto_137785 ?auto_137784 ) ( ON ?auto_137786 ?auto_137785 ) ( ON ?auto_137787 ?auto_137786 ) ( ON ?auto_137788 ?auto_137787 ) ( not ( = ?auto_137784 ?auto_137785 ) ) ( not ( = ?auto_137784 ?auto_137786 ) ) ( not ( = ?auto_137784 ?auto_137787 ) ) ( not ( = ?auto_137784 ?auto_137788 ) ) ( not ( = ?auto_137784 ?auto_137789 ) ) ( not ( = ?auto_137784 ?auto_137790 ) ) ( not ( = ?auto_137784 ?auto_137791 ) ) ( not ( = ?auto_137784 ?auto_137792 ) ) ( not ( = ?auto_137785 ?auto_137786 ) ) ( not ( = ?auto_137785 ?auto_137787 ) ) ( not ( = ?auto_137785 ?auto_137788 ) ) ( not ( = ?auto_137785 ?auto_137789 ) ) ( not ( = ?auto_137785 ?auto_137790 ) ) ( not ( = ?auto_137785 ?auto_137791 ) ) ( not ( = ?auto_137785 ?auto_137792 ) ) ( not ( = ?auto_137786 ?auto_137787 ) ) ( not ( = ?auto_137786 ?auto_137788 ) ) ( not ( = ?auto_137786 ?auto_137789 ) ) ( not ( = ?auto_137786 ?auto_137790 ) ) ( not ( = ?auto_137786 ?auto_137791 ) ) ( not ( = ?auto_137786 ?auto_137792 ) ) ( not ( = ?auto_137787 ?auto_137788 ) ) ( not ( = ?auto_137787 ?auto_137789 ) ) ( not ( = ?auto_137787 ?auto_137790 ) ) ( not ( = ?auto_137787 ?auto_137791 ) ) ( not ( = ?auto_137787 ?auto_137792 ) ) ( not ( = ?auto_137788 ?auto_137789 ) ) ( not ( = ?auto_137788 ?auto_137790 ) ) ( not ( = ?auto_137788 ?auto_137791 ) ) ( not ( = ?auto_137788 ?auto_137792 ) ) ( not ( = ?auto_137789 ?auto_137790 ) ) ( not ( = ?auto_137789 ?auto_137791 ) ) ( not ( = ?auto_137789 ?auto_137792 ) ) ( not ( = ?auto_137790 ?auto_137791 ) ) ( not ( = ?auto_137790 ?auto_137792 ) ) ( not ( = ?auto_137791 ?auto_137792 ) ) ( ON ?auto_137790 ?auto_137791 ) ( CLEAR ?auto_137788 ) ( ON ?auto_137789 ?auto_137790 ) ( CLEAR ?auto_137789 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_137784 ?auto_137785 ?auto_137786 ?auto_137787 ?auto_137788 ?auto_137789 )
      ( MAKE-8PILE ?auto_137784 ?auto_137785 ?auto_137786 ?auto_137787 ?auto_137788 ?auto_137789 ?auto_137790 ?auto_137791 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_137818 - BLOCK
      ?auto_137819 - BLOCK
      ?auto_137820 - BLOCK
      ?auto_137821 - BLOCK
      ?auto_137822 - BLOCK
      ?auto_137823 - BLOCK
      ?auto_137824 - BLOCK
      ?auto_137825 - BLOCK
    )
    :vars
    (
      ?auto_137826 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137825 ?auto_137826 ) ( ON-TABLE ?auto_137818 ) ( ON ?auto_137819 ?auto_137818 ) ( ON ?auto_137820 ?auto_137819 ) ( ON ?auto_137821 ?auto_137820 ) ( not ( = ?auto_137818 ?auto_137819 ) ) ( not ( = ?auto_137818 ?auto_137820 ) ) ( not ( = ?auto_137818 ?auto_137821 ) ) ( not ( = ?auto_137818 ?auto_137822 ) ) ( not ( = ?auto_137818 ?auto_137823 ) ) ( not ( = ?auto_137818 ?auto_137824 ) ) ( not ( = ?auto_137818 ?auto_137825 ) ) ( not ( = ?auto_137818 ?auto_137826 ) ) ( not ( = ?auto_137819 ?auto_137820 ) ) ( not ( = ?auto_137819 ?auto_137821 ) ) ( not ( = ?auto_137819 ?auto_137822 ) ) ( not ( = ?auto_137819 ?auto_137823 ) ) ( not ( = ?auto_137819 ?auto_137824 ) ) ( not ( = ?auto_137819 ?auto_137825 ) ) ( not ( = ?auto_137819 ?auto_137826 ) ) ( not ( = ?auto_137820 ?auto_137821 ) ) ( not ( = ?auto_137820 ?auto_137822 ) ) ( not ( = ?auto_137820 ?auto_137823 ) ) ( not ( = ?auto_137820 ?auto_137824 ) ) ( not ( = ?auto_137820 ?auto_137825 ) ) ( not ( = ?auto_137820 ?auto_137826 ) ) ( not ( = ?auto_137821 ?auto_137822 ) ) ( not ( = ?auto_137821 ?auto_137823 ) ) ( not ( = ?auto_137821 ?auto_137824 ) ) ( not ( = ?auto_137821 ?auto_137825 ) ) ( not ( = ?auto_137821 ?auto_137826 ) ) ( not ( = ?auto_137822 ?auto_137823 ) ) ( not ( = ?auto_137822 ?auto_137824 ) ) ( not ( = ?auto_137822 ?auto_137825 ) ) ( not ( = ?auto_137822 ?auto_137826 ) ) ( not ( = ?auto_137823 ?auto_137824 ) ) ( not ( = ?auto_137823 ?auto_137825 ) ) ( not ( = ?auto_137823 ?auto_137826 ) ) ( not ( = ?auto_137824 ?auto_137825 ) ) ( not ( = ?auto_137824 ?auto_137826 ) ) ( not ( = ?auto_137825 ?auto_137826 ) ) ( ON ?auto_137824 ?auto_137825 ) ( ON ?auto_137823 ?auto_137824 ) ( CLEAR ?auto_137821 ) ( ON ?auto_137822 ?auto_137823 ) ( CLEAR ?auto_137822 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_137818 ?auto_137819 ?auto_137820 ?auto_137821 ?auto_137822 )
      ( MAKE-8PILE ?auto_137818 ?auto_137819 ?auto_137820 ?auto_137821 ?auto_137822 ?auto_137823 ?auto_137824 ?auto_137825 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_137852 - BLOCK
      ?auto_137853 - BLOCK
      ?auto_137854 - BLOCK
      ?auto_137855 - BLOCK
      ?auto_137856 - BLOCK
      ?auto_137857 - BLOCK
      ?auto_137858 - BLOCK
      ?auto_137859 - BLOCK
    )
    :vars
    (
      ?auto_137860 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137859 ?auto_137860 ) ( ON-TABLE ?auto_137852 ) ( ON ?auto_137853 ?auto_137852 ) ( ON ?auto_137854 ?auto_137853 ) ( not ( = ?auto_137852 ?auto_137853 ) ) ( not ( = ?auto_137852 ?auto_137854 ) ) ( not ( = ?auto_137852 ?auto_137855 ) ) ( not ( = ?auto_137852 ?auto_137856 ) ) ( not ( = ?auto_137852 ?auto_137857 ) ) ( not ( = ?auto_137852 ?auto_137858 ) ) ( not ( = ?auto_137852 ?auto_137859 ) ) ( not ( = ?auto_137852 ?auto_137860 ) ) ( not ( = ?auto_137853 ?auto_137854 ) ) ( not ( = ?auto_137853 ?auto_137855 ) ) ( not ( = ?auto_137853 ?auto_137856 ) ) ( not ( = ?auto_137853 ?auto_137857 ) ) ( not ( = ?auto_137853 ?auto_137858 ) ) ( not ( = ?auto_137853 ?auto_137859 ) ) ( not ( = ?auto_137853 ?auto_137860 ) ) ( not ( = ?auto_137854 ?auto_137855 ) ) ( not ( = ?auto_137854 ?auto_137856 ) ) ( not ( = ?auto_137854 ?auto_137857 ) ) ( not ( = ?auto_137854 ?auto_137858 ) ) ( not ( = ?auto_137854 ?auto_137859 ) ) ( not ( = ?auto_137854 ?auto_137860 ) ) ( not ( = ?auto_137855 ?auto_137856 ) ) ( not ( = ?auto_137855 ?auto_137857 ) ) ( not ( = ?auto_137855 ?auto_137858 ) ) ( not ( = ?auto_137855 ?auto_137859 ) ) ( not ( = ?auto_137855 ?auto_137860 ) ) ( not ( = ?auto_137856 ?auto_137857 ) ) ( not ( = ?auto_137856 ?auto_137858 ) ) ( not ( = ?auto_137856 ?auto_137859 ) ) ( not ( = ?auto_137856 ?auto_137860 ) ) ( not ( = ?auto_137857 ?auto_137858 ) ) ( not ( = ?auto_137857 ?auto_137859 ) ) ( not ( = ?auto_137857 ?auto_137860 ) ) ( not ( = ?auto_137858 ?auto_137859 ) ) ( not ( = ?auto_137858 ?auto_137860 ) ) ( not ( = ?auto_137859 ?auto_137860 ) ) ( ON ?auto_137858 ?auto_137859 ) ( ON ?auto_137857 ?auto_137858 ) ( ON ?auto_137856 ?auto_137857 ) ( CLEAR ?auto_137854 ) ( ON ?auto_137855 ?auto_137856 ) ( CLEAR ?auto_137855 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_137852 ?auto_137853 ?auto_137854 ?auto_137855 )
      ( MAKE-8PILE ?auto_137852 ?auto_137853 ?auto_137854 ?auto_137855 ?auto_137856 ?auto_137857 ?auto_137858 ?auto_137859 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_137886 - BLOCK
      ?auto_137887 - BLOCK
      ?auto_137888 - BLOCK
      ?auto_137889 - BLOCK
      ?auto_137890 - BLOCK
      ?auto_137891 - BLOCK
      ?auto_137892 - BLOCK
      ?auto_137893 - BLOCK
    )
    :vars
    (
      ?auto_137894 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137893 ?auto_137894 ) ( ON-TABLE ?auto_137886 ) ( ON ?auto_137887 ?auto_137886 ) ( not ( = ?auto_137886 ?auto_137887 ) ) ( not ( = ?auto_137886 ?auto_137888 ) ) ( not ( = ?auto_137886 ?auto_137889 ) ) ( not ( = ?auto_137886 ?auto_137890 ) ) ( not ( = ?auto_137886 ?auto_137891 ) ) ( not ( = ?auto_137886 ?auto_137892 ) ) ( not ( = ?auto_137886 ?auto_137893 ) ) ( not ( = ?auto_137886 ?auto_137894 ) ) ( not ( = ?auto_137887 ?auto_137888 ) ) ( not ( = ?auto_137887 ?auto_137889 ) ) ( not ( = ?auto_137887 ?auto_137890 ) ) ( not ( = ?auto_137887 ?auto_137891 ) ) ( not ( = ?auto_137887 ?auto_137892 ) ) ( not ( = ?auto_137887 ?auto_137893 ) ) ( not ( = ?auto_137887 ?auto_137894 ) ) ( not ( = ?auto_137888 ?auto_137889 ) ) ( not ( = ?auto_137888 ?auto_137890 ) ) ( not ( = ?auto_137888 ?auto_137891 ) ) ( not ( = ?auto_137888 ?auto_137892 ) ) ( not ( = ?auto_137888 ?auto_137893 ) ) ( not ( = ?auto_137888 ?auto_137894 ) ) ( not ( = ?auto_137889 ?auto_137890 ) ) ( not ( = ?auto_137889 ?auto_137891 ) ) ( not ( = ?auto_137889 ?auto_137892 ) ) ( not ( = ?auto_137889 ?auto_137893 ) ) ( not ( = ?auto_137889 ?auto_137894 ) ) ( not ( = ?auto_137890 ?auto_137891 ) ) ( not ( = ?auto_137890 ?auto_137892 ) ) ( not ( = ?auto_137890 ?auto_137893 ) ) ( not ( = ?auto_137890 ?auto_137894 ) ) ( not ( = ?auto_137891 ?auto_137892 ) ) ( not ( = ?auto_137891 ?auto_137893 ) ) ( not ( = ?auto_137891 ?auto_137894 ) ) ( not ( = ?auto_137892 ?auto_137893 ) ) ( not ( = ?auto_137892 ?auto_137894 ) ) ( not ( = ?auto_137893 ?auto_137894 ) ) ( ON ?auto_137892 ?auto_137893 ) ( ON ?auto_137891 ?auto_137892 ) ( ON ?auto_137890 ?auto_137891 ) ( ON ?auto_137889 ?auto_137890 ) ( CLEAR ?auto_137887 ) ( ON ?auto_137888 ?auto_137889 ) ( CLEAR ?auto_137888 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_137886 ?auto_137887 ?auto_137888 )
      ( MAKE-8PILE ?auto_137886 ?auto_137887 ?auto_137888 ?auto_137889 ?auto_137890 ?auto_137891 ?auto_137892 ?auto_137893 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_137920 - BLOCK
      ?auto_137921 - BLOCK
      ?auto_137922 - BLOCK
      ?auto_137923 - BLOCK
      ?auto_137924 - BLOCK
      ?auto_137925 - BLOCK
      ?auto_137926 - BLOCK
      ?auto_137927 - BLOCK
    )
    :vars
    (
      ?auto_137928 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137927 ?auto_137928 ) ( ON-TABLE ?auto_137920 ) ( not ( = ?auto_137920 ?auto_137921 ) ) ( not ( = ?auto_137920 ?auto_137922 ) ) ( not ( = ?auto_137920 ?auto_137923 ) ) ( not ( = ?auto_137920 ?auto_137924 ) ) ( not ( = ?auto_137920 ?auto_137925 ) ) ( not ( = ?auto_137920 ?auto_137926 ) ) ( not ( = ?auto_137920 ?auto_137927 ) ) ( not ( = ?auto_137920 ?auto_137928 ) ) ( not ( = ?auto_137921 ?auto_137922 ) ) ( not ( = ?auto_137921 ?auto_137923 ) ) ( not ( = ?auto_137921 ?auto_137924 ) ) ( not ( = ?auto_137921 ?auto_137925 ) ) ( not ( = ?auto_137921 ?auto_137926 ) ) ( not ( = ?auto_137921 ?auto_137927 ) ) ( not ( = ?auto_137921 ?auto_137928 ) ) ( not ( = ?auto_137922 ?auto_137923 ) ) ( not ( = ?auto_137922 ?auto_137924 ) ) ( not ( = ?auto_137922 ?auto_137925 ) ) ( not ( = ?auto_137922 ?auto_137926 ) ) ( not ( = ?auto_137922 ?auto_137927 ) ) ( not ( = ?auto_137922 ?auto_137928 ) ) ( not ( = ?auto_137923 ?auto_137924 ) ) ( not ( = ?auto_137923 ?auto_137925 ) ) ( not ( = ?auto_137923 ?auto_137926 ) ) ( not ( = ?auto_137923 ?auto_137927 ) ) ( not ( = ?auto_137923 ?auto_137928 ) ) ( not ( = ?auto_137924 ?auto_137925 ) ) ( not ( = ?auto_137924 ?auto_137926 ) ) ( not ( = ?auto_137924 ?auto_137927 ) ) ( not ( = ?auto_137924 ?auto_137928 ) ) ( not ( = ?auto_137925 ?auto_137926 ) ) ( not ( = ?auto_137925 ?auto_137927 ) ) ( not ( = ?auto_137925 ?auto_137928 ) ) ( not ( = ?auto_137926 ?auto_137927 ) ) ( not ( = ?auto_137926 ?auto_137928 ) ) ( not ( = ?auto_137927 ?auto_137928 ) ) ( ON ?auto_137926 ?auto_137927 ) ( ON ?auto_137925 ?auto_137926 ) ( ON ?auto_137924 ?auto_137925 ) ( ON ?auto_137923 ?auto_137924 ) ( ON ?auto_137922 ?auto_137923 ) ( CLEAR ?auto_137920 ) ( ON ?auto_137921 ?auto_137922 ) ( CLEAR ?auto_137921 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_137920 ?auto_137921 )
      ( MAKE-8PILE ?auto_137920 ?auto_137921 ?auto_137922 ?auto_137923 ?auto_137924 ?auto_137925 ?auto_137926 ?auto_137927 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_137954 - BLOCK
      ?auto_137955 - BLOCK
      ?auto_137956 - BLOCK
      ?auto_137957 - BLOCK
      ?auto_137958 - BLOCK
      ?auto_137959 - BLOCK
      ?auto_137960 - BLOCK
      ?auto_137961 - BLOCK
    )
    :vars
    (
      ?auto_137962 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137961 ?auto_137962 ) ( not ( = ?auto_137954 ?auto_137955 ) ) ( not ( = ?auto_137954 ?auto_137956 ) ) ( not ( = ?auto_137954 ?auto_137957 ) ) ( not ( = ?auto_137954 ?auto_137958 ) ) ( not ( = ?auto_137954 ?auto_137959 ) ) ( not ( = ?auto_137954 ?auto_137960 ) ) ( not ( = ?auto_137954 ?auto_137961 ) ) ( not ( = ?auto_137954 ?auto_137962 ) ) ( not ( = ?auto_137955 ?auto_137956 ) ) ( not ( = ?auto_137955 ?auto_137957 ) ) ( not ( = ?auto_137955 ?auto_137958 ) ) ( not ( = ?auto_137955 ?auto_137959 ) ) ( not ( = ?auto_137955 ?auto_137960 ) ) ( not ( = ?auto_137955 ?auto_137961 ) ) ( not ( = ?auto_137955 ?auto_137962 ) ) ( not ( = ?auto_137956 ?auto_137957 ) ) ( not ( = ?auto_137956 ?auto_137958 ) ) ( not ( = ?auto_137956 ?auto_137959 ) ) ( not ( = ?auto_137956 ?auto_137960 ) ) ( not ( = ?auto_137956 ?auto_137961 ) ) ( not ( = ?auto_137956 ?auto_137962 ) ) ( not ( = ?auto_137957 ?auto_137958 ) ) ( not ( = ?auto_137957 ?auto_137959 ) ) ( not ( = ?auto_137957 ?auto_137960 ) ) ( not ( = ?auto_137957 ?auto_137961 ) ) ( not ( = ?auto_137957 ?auto_137962 ) ) ( not ( = ?auto_137958 ?auto_137959 ) ) ( not ( = ?auto_137958 ?auto_137960 ) ) ( not ( = ?auto_137958 ?auto_137961 ) ) ( not ( = ?auto_137958 ?auto_137962 ) ) ( not ( = ?auto_137959 ?auto_137960 ) ) ( not ( = ?auto_137959 ?auto_137961 ) ) ( not ( = ?auto_137959 ?auto_137962 ) ) ( not ( = ?auto_137960 ?auto_137961 ) ) ( not ( = ?auto_137960 ?auto_137962 ) ) ( not ( = ?auto_137961 ?auto_137962 ) ) ( ON ?auto_137960 ?auto_137961 ) ( ON ?auto_137959 ?auto_137960 ) ( ON ?auto_137958 ?auto_137959 ) ( ON ?auto_137957 ?auto_137958 ) ( ON ?auto_137956 ?auto_137957 ) ( ON ?auto_137955 ?auto_137956 ) ( ON ?auto_137954 ?auto_137955 ) ( CLEAR ?auto_137954 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_137954 )
      ( MAKE-8PILE ?auto_137954 ?auto_137955 ?auto_137956 ?auto_137957 ?auto_137958 ?auto_137959 ?auto_137960 ?auto_137961 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_137989 - BLOCK
      ?auto_137990 - BLOCK
      ?auto_137991 - BLOCK
      ?auto_137992 - BLOCK
      ?auto_137993 - BLOCK
      ?auto_137994 - BLOCK
      ?auto_137995 - BLOCK
      ?auto_137996 - BLOCK
      ?auto_137997 - BLOCK
    )
    :vars
    (
      ?auto_137998 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_137996 ) ( ON ?auto_137997 ?auto_137998 ) ( CLEAR ?auto_137997 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_137989 ) ( ON ?auto_137990 ?auto_137989 ) ( ON ?auto_137991 ?auto_137990 ) ( ON ?auto_137992 ?auto_137991 ) ( ON ?auto_137993 ?auto_137992 ) ( ON ?auto_137994 ?auto_137993 ) ( ON ?auto_137995 ?auto_137994 ) ( ON ?auto_137996 ?auto_137995 ) ( not ( = ?auto_137989 ?auto_137990 ) ) ( not ( = ?auto_137989 ?auto_137991 ) ) ( not ( = ?auto_137989 ?auto_137992 ) ) ( not ( = ?auto_137989 ?auto_137993 ) ) ( not ( = ?auto_137989 ?auto_137994 ) ) ( not ( = ?auto_137989 ?auto_137995 ) ) ( not ( = ?auto_137989 ?auto_137996 ) ) ( not ( = ?auto_137989 ?auto_137997 ) ) ( not ( = ?auto_137989 ?auto_137998 ) ) ( not ( = ?auto_137990 ?auto_137991 ) ) ( not ( = ?auto_137990 ?auto_137992 ) ) ( not ( = ?auto_137990 ?auto_137993 ) ) ( not ( = ?auto_137990 ?auto_137994 ) ) ( not ( = ?auto_137990 ?auto_137995 ) ) ( not ( = ?auto_137990 ?auto_137996 ) ) ( not ( = ?auto_137990 ?auto_137997 ) ) ( not ( = ?auto_137990 ?auto_137998 ) ) ( not ( = ?auto_137991 ?auto_137992 ) ) ( not ( = ?auto_137991 ?auto_137993 ) ) ( not ( = ?auto_137991 ?auto_137994 ) ) ( not ( = ?auto_137991 ?auto_137995 ) ) ( not ( = ?auto_137991 ?auto_137996 ) ) ( not ( = ?auto_137991 ?auto_137997 ) ) ( not ( = ?auto_137991 ?auto_137998 ) ) ( not ( = ?auto_137992 ?auto_137993 ) ) ( not ( = ?auto_137992 ?auto_137994 ) ) ( not ( = ?auto_137992 ?auto_137995 ) ) ( not ( = ?auto_137992 ?auto_137996 ) ) ( not ( = ?auto_137992 ?auto_137997 ) ) ( not ( = ?auto_137992 ?auto_137998 ) ) ( not ( = ?auto_137993 ?auto_137994 ) ) ( not ( = ?auto_137993 ?auto_137995 ) ) ( not ( = ?auto_137993 ?auto_137996 ) ) ( not ( = ?auto_137993 ?auto_137997 ) ) ( not ( = ?auto_137993 ?auto_137998 ) ) ( not ( = ?auto_137994 ?auto_137995 ) ) ( not ( = ?auto_137994 ?auto_137996 ) ) ( not ( = ?auto_137994 ?auto_137997 ) ) ( not ( = ?auto_137994 ?auto_137998 ) ) ( not ( = ?auto_137995 ?auto_137996 ) ) ( not ( = ?auto_137995 ?auto_137997 ) ) ( not ( = ?auto_137995 ?auto_137998 ) ) ( not ( = ?auto_137996 ?auto_137997 ) ) ( not ( = ?auto_137996 ?auto_137998 ) ) ( not ( = ?auto_137997 ?auto_137998 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_137997 ?auto_137998 )
      ( !STACK ?auto_137997 ?auto_137996 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_138027 - BLOCK
      ?auto_138028 - BLOCK
      ?auto_138029 - BLOCK
      ?auto_138030 - BLOCK
      ?auto_138031 - BLOCK
      ?auto_138032 - BLOCK
      ?auto_138033 - BLOCK
      ?auto_138034 - BLOCK
      ?auto_138035 - BLOCK
    )
    :vars
    (
      ?auto_138036 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_138035 ?auto_138036 ) ( ON-TABLE ?auto_138027 ) ( ON ?auto_138028 ?auto_138027 ) ( ON ?auto_138029 ?auto_138028 ) ( ON ?auto_138030 ?auto_138029 ) ( ON ?auto_138031 ?auto_138030 ) ( ON ?auto_138032 ?auto_138031 ) ( ON ?auto_138033 ?auto_138032 ) ( not ( = ?auto_138027 ?auto_138028 ) ) ( not ( = ?auto_138027 ?auto_138029 ) ) ( not ( = ?auto_138027 ?auto_138030 ) ) ( not ( = ?auto_138027 ?auto_138031 ) ) ( not ( = ?auto_138027 ?auto_138032 ) ) ( not ( = ?auto_138027 ?auto_138033 ) ) ( not ( = ?auto_138027 ?auto_138034 ) ) ( not ( = ?auto_138027 ?auto_138035 ) ) ( not ( = ?auto_138027 ?auto_138036 ) ) ( not ( = ?auto_138028 ?auto_138029 ) ) ( not ( = ?auto_138028 ?auto_138030 ) ) ( not ( = ?auto_138028 ?auto_138031 ) ) ( not ( = ?auto_138028 ?auto_138032 ) ) ( not ( = ?auto_138028 ?auto_138033 ) ) ( not ( = ?auto_138028 ?auto_138034 ) ) ( not ( = ?auto_138028 ?auto_138035 ) ) ( not ( = ?auto_138028 ?auto_138036 ) ) ( not ( = ?auto_138029 ?auto_138030 ) ) ( not ( = ?auto_138029 ?auto_138031 ) ) ( not ( = ?auto_138029 ?auto_138032 ) ) ( not ( = ?auto_138029 ?auto_138033 ) ) ( not ( = ?auto_138029 ?auto_138034 ) ) ( not ( = ?auto_138029 ?auto_138035 ) ) ( not ( = ?auto_138029 ?auto_138036 ) ) ( not ( = ?auto_138030 ?auto_138031 ) ) ( not ( = ?auto_138030 ?auto_138032 ) ) ( not ( = ?auto_138030 ?auto_138033 ) ) ( not ( = ?auto_138030 ?auto_138034 ) ) ( not ( = ?auto_138030 ?auto_138035 ) ) ( not ( = ?auto_138030 ?auto_138036 ) ) ( not ( = ?auto_138031 ?auto_138032 ) ) ( not ( = ?auto_138031 ?auto_138033 ) ) ( not ( = ?auto_138031 ?auto_138034 ) ) ( not ( = ?auto_138031 ?auto_138035 ) ) ( not ( = ?auto_138031 ?auto_138036 ) ) ( not ( = ?auto_138032 ?auto_138033 ) ) ( not ( = ?auto_138032 ?auto_138034 ) ) ( not ( = ?auto_138032 ?auto_138035 ) ) ( not ( = ?auto_138032 ?auto_138036 ) ) ( not ( = ?auto_138033 ?auto_138034 ) ) ( not ( = ?auto_138033 ?auto_138035 ) ) ( not ( = ?auto_138033 ?auto_138036 ) ) ( not ( = ?auto_138034 ?auto_138035 ) ) ( not ( = ?auto_138034 ?auto_138036 ) ) ( not ( = ?auto_138035 ?auto_138036 ) ) ( CLEAR ?auto_138033 ) ( ON ?auto_138034 ?auto_138035 ) ( CLEAR ?auto_138034 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_138027 ?auto_138028 ?auto_138029 ?auto_138030 ?auto_138031 ?auto_138032 ?auto_138033 ?auto_138034 )
      ( MAKE-9PILE ?auto_138027 ?auto_138028 ?auto_138029 ?auto_138030 ?auto_138031 ?auto_138032 ?auto_138033 ?auto_138034 ?auto_138035 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_138065 - BLOCK
      ?auto_138066 - BLOCK
      ?auto_138067 - BLOCK
      ?auto_138068 - BLOCK
      ?auto_138069 - BLOCK
      ?auto_138070 - BLOCK
      ?auto_138071 - BLOCK
      ?auto_138072 - BLOCK
      ?auto_138073 - BLOCK
    )
    :vars
    (
      ?auto_138074 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_138073 ?auto_138074 ) ( ON-TABLE ?auto_138065 ) ( ON ?auto_138066 ?auto_138065 ) ( ON ?auto_138067 ?auto_138066 ) ( ON ?auto_138068 ?auto_138067 ) ( ON ?auto_138069 ?auto_138068 ) ( ON ?auto_138070 ?auto_138069 ) ( not ( = ?auto_138065 ?auto_138066 ) ) ( not ( = ?auto_138065 ?auto_138067 ) ) ( not ( = ?auto_138065 ?auto_138068 ) ) ( not ( = ?auto_138065 ?auto_138069 ) ) ( not ( = ?auto_138065 ?auto_138070 ) ) ( not ( = ?auto_138065 ?auto_138071 ) ) ( not ( = ?auto_138065 ?auto_138072 ) ) ( not ( = ?auto_138065 ?auto_138073 ) ) ( not ( = ?auto_138065 ?auto_138074 ) ) ( not ( = ?auto_138066 ?auto_138067 ) ) ( not ( = ?auto_138066 ?auto_138068 ) ) ( not ( = ?auto_138066 ?auto_138069 ) ) ( not ( = ?auto_138066 ?auto_138070 ) ) ( not ( = ?auto_138066 ?auto_138071 ) ) ( not ( = ?auto_138066 ?auto_138072 ) ) ( not ( = ?auto_138066 ?auto_138073 ) ) ( not ( = ?auto_138066 ?auto_138074 ) ) ( not ( = ?auto_138067 ?auto_138068 ) ) ( not ( = ?auto_138067 ?auto_138069 ) ) ( not ( = ?auto_138067 ?auto_138070 ) ) ( not ( = ?auto_138067 ?auto_138071 ) ) ( not ( = ?auto_138067 ?auto_138072 ) ) ( not ( = ?auto_138067 ?auto_138073 ) ) ( not ( = ?auto_138067 ?auto_138074 ) ) ( not ( = ?auto_138068 ?auto_138069 ) ) ( not ( = ?auto_138068 ?auto_138070 ) ) ( not ( = ?auto_138068 ?auto_138071 ) ) ( not ( = ?auto_138068 ?auto_138072 ) ) ( not ( = ?auto_138068 ?auto_138073 ) ) ( not ( = ?auto_138068 ?auto_138074 ) ) ( not ( = ?auto_138069 ?auto_138070 ) ) ( not ( = ?auto_138069 ?auto_138071 ) ) ( not ( = ?auto_138069 ?auto_138072 ) ) ( not ( = ?auto_138069 ?auto_138073 ) ) ( not ( = ?auto_138069 ?auto_138074 ) ) ( not ( = ?auto_138070 ?auto_138071 ) ) ( not ( = ?auto_138070 ?auto_138072 ) ) ( not ( = ?auto_138070 ?auto_138073 ) ) ( not ( = ?auto_138070 ?auto_138074 ) ) ( not ( = ?auto_138071 ?auto_138072 ) ) ( not ( = ?auto_138071 ?auto_138073 ) ) ( not ( = ?auto_138071 ?auto_138074 ) ) ( not ( = ?auto_138072 ?auto_138073 ) ) ( not ( = ?auto_138072 ?auto_138074 ) ) ( not ( = ?auto_138073 ?auto_138074 ) ) ( ON ?auto_138072 ?auto_138073 ) ( CLEAR ?auto_138070 ) ( ON ?auto_138071 ?auto_138072 ) ( CLEAR ?auto_138071 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_138065 ?auto_138066 ?auto_138067 ?auto_138068 ?auto_138069 ?auto_138070 ?auto_138071 )
      ( MAKE-9PILE ?auto_138065 ?auto_138066 ?auto_138067 ?auto_138068 ?auto_138069 ?auto_138070 ?auto_138071 ?auto_138072 ?auto_138073 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_138103 - BLOCK
      ?auto_138104 - BLOCK
      ?auto_138105 - BLOCK
      ?auto_138106 - BLOCK
      ?auto_138107 - BLOCK
      ?auto_138108 - BLOCK
      ?auto_138109 - BLOCK
      ?auto_138110 - BLOCK
      ?auto_138111 - BLOCK
    )
    :vars
    (
      ?auto_138112 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_138111 ?auto_138112 ) ( ON-TABLE ?auto_138103 ) ( ON ?auto_138104 ?auto_138103 ) ( ON ?auto_138105 ?auto_138104 ) ( ON ?auto_138106 ?auto_138105 ) ( ON ?auto_138107 ?auto_138106 ) ( not ( = ?auto_138103 ?auto_138104 ) ) ( not ( = ?auto_138103 ?auto_138105 ) ) ( not ( = ?auto_138103 ?auto_138106 ) ) ( not ( = ?auto_138103 ?auto_138107 ) ) ( not ( = ?auto_138103 ?auto_138108 ) ) ( not ( = ?auto_138103 ?auto_138109 ) ) ( not ( = ?auto_138103 ?auto_138110 ) ) ( not ( = ?auto_138103 ?auto_138111 ) ) ( not ( = ?auto_138103 ?auto_138112 ) ) ( not ( = ?auto_138104 ?auto_138105 ) ) ( not ( = ?auto_138104 ?auto_138106 ) ) ( not ( = ?auto_138104 ?auto_138107 ) ) ( not ( = ?auto_138104 ?auto_138108 ) ) ( not ( = ?auto_138104 ?auto_138109 ) ) ( not ( = ?auto_138104 ?auto_138110 ) ) ( not ( = ?auto_138104 ?auto_138111 ) ) ( not ( = ?auto_138104 ?auto_138112 ) ) ( not ( = ?auto_138105 ?auto_138106 ) ) ( not ( = ?auto_138105 ?auto_138107 ) ) ( not ( = ?auto_138105 ?auto_138108 ) ) ( not ( = ?auto_138105 ?auto_138109 ) ) ( not ( = ?auto_138105 ?auto_138110 ) ) ( not ( = ?auto_138105 ?auto_138111 ) ) ( not ( = ?auto_138105 ?auto_138112 ) ) ( not ( = ?auto_138106 ?auto_138107 ) ) ( not ( = ?auto_138106 ?auto_138108 ) ) ( not ( = ?auto_138106 ?auto_138109 ) ) ( not ( = ?auto_138106 ?auto_138110 ) ) ( not ( = ?auto_138106 ?auto_138111 ) ) ( not ( = ?auto_138106 ?auto_138112 ) ) ( not ( = ?auto_138107 ?auto_138108 ) ) ( not ( = ?auto_138107 ?auto_138109 ) ) ( not ( = ?auto_138107 ?auto_138110 ) ) ( not ( = ?auto_138107 ?auto_138111 ) ) ( not ( = ?auto_138107 ?auto_138112 ) ) ( not ( = ?auto_138108 ?auto_138109 ) ) ( not ( = ?auto_138108 ?auto_138110 ) ) ( not ( = ?auto_138108 ?auto_138111 ) ) ( not ( = ?auto_138108 ?auto_138112 ) ) ( not ( = ?auto_138109 ?auto_138110 ) ) ( not ( = ?auto_138109 ?auto_138111 ) ) ( not ( = ?auto_138109 ?auto_138112 ) ) ( not ( = ?auto_138110 ?auto_138111 ) ) ( not ( = ?auto_138110 ?auto_138112 ) ) ( not ( = ?auto_138111 ?auto_138112 ) ) ( ON ?auto_138110 ?auto_138111 ) ( ON ?auto_138109 ?auto_138110 ) ( CLEAR ?auto_138107 ) ( ON ?auto_138108 ?auto_138109 ) ( CLEAR ?auto_138108 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_138103 ?auto_138104 ?auto_138105 ?auto_138106 ?auto_138107 ?auto_138108 )
      ( MAKE-9PILE ?auto_138103 ?auto_138104 ?auto_138105 ?auto_138106 ?auto_138107 ?auto_138108 ?auto_138109 ?auto_138110 ?auto_138111 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_138141 - BLOCK
      ?auto_138142 - BLOCK
      ?auto_138143 - BLOCK
      ?auto_138144 - BLOCK
      ?auto_138145 - BLOCK
      ?auto_138146 - BLOCK
      ?auto_138147 - BLOCK
      ?auto_138148 - BLOCK
      ?auto_138149 - BLOCK
    )
    :vars
    (
      ?auto_138150 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_138149 ?auto_138150 ) ( ON-TABLE ?auto_138141 ) ( ON ?auto_138142 ?auto_138141 ) ( ON ?auto_138143 ?auto_138142 ) ( ON ?auto_138144 ?auto_138143 ) ( not ( = ?auto_138141 ?auto_138142 ) ) ( not ( = ?auto_138141 ?auto_138143 ) ) ( not ( = ?auto_138141 ?auto_138144 ) ) ( not ( = ?auto_138141 ?auto_138145 ) ) ( not ( = ?auto_138141 ?auto_138146 ) ) ( not ( = ?auto_138141 ?auto_138147 ) ) ( not ( = ?auto_138141 ?auto_138148 ) ) ( not ( = ?auto_138141 ?auto_138149 ) ) ( not ( = ?auto_138141 ?auto_138150 ) ) ( not ( = ?auto_138142 ?auto_138143 ) ) ( not ( = ?auto_138142 ?auto_138144 ) ) ( not ( = ?auto_138142 ?auto_138145 ) ) ( not ( = ?auto_138142 ?auto_138146 ) ) ( not ( = ?auto_138142 ?auto_138147 ) ) ( not ( = ?auto_138142 ?auto_138148 ) ) ( not ( = ?auto_138142 ?auto_138149 ) ) ( not ( = ?auto_138142 ?auto_138150 ) ) ( not ( = ?auto_138143 ?auto_138144 ) ) ( not ( = ?auto_138143 ?auto_138145 ) ) ( not ( = ?auto_138143 ?auto_138146 ) ) ( not ( = ?auto_138143 ?auto_138147 ) ) ( not ( = ?auto_138143 ?auto_138148 ) ) ( not ( = ?auto_138143 ?auto_138149 ) ) ( not ( = ?auto_138143 ?auto_138150 ) ) ( not ( = ?auto_138144 ?auto_138145 ) ) ( not ( = ?auto_138144 ?auto_138146 ) ) ( not ( = ?auto_138144 ?auto_138147 ) ) ( not ( = ?auto_138144 ?auto_138148 ) ) ( not ( = ?auto_138144 ?auto_138149 ) ) ( not ( = ?auto_138144 ?auto_138150 ) ) ( not ( = ?auto_138145 ?auto_138146 ) ) ( not ( = ?auto_138145 ?auto_138147 ) ) ( not ( = ?auto_138145 ?auto_138148 ) ) ( not ( = ?auto_138145 ?auto_138149 ) ) ( not ( = ?auto_138145 ?auto_138150 ) ) ( not ( = ?auto_138146 ?auto_138147 ) ) ( not ( = ?auto_138146 ?auto_138148 ) ) ( not ( = ?auto_138146 ?auto_138149 ) ) ( not ( = ?auto_138146 ?auto_138150 ) ) ( not ( = ?auto_138147 ?auto_138148 ) ) ( not ( = ?auto_138147 ?auto_138149 ) ) ( not ( = ?auto_138147 ?auto_138150 ) ) ( not ( = ?auto_138148 ?auto_138149 ) ) ( not ( = ?auto_138148 ?auto_138150 ) ) ( not ( = ?auto_138149 ?auto_138150 ) ) ( ON ?auto_138148 ?auto_138149 ) ( ON ?auto_138147 ?auto_138148 ) ( ON ?auto_138146 ?auto_138147 ) ( CLEAR ?auto_138144 ) ( ON ?auto_138145 ?auto_138146 ) ( CLEAR ?auto_138145 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_138141 ?auto_138142 ?auto_138143 ?auto_138144 ?auto_138145 )
      ( MAKE-9PILE ?auto_138141 ?auto_138142 ?auto_138143 ?auto_138144 ?auto_138145 ?auto_138146 ?auto_138147 ?auto_138148 ?auto_138149 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_138179 - BLOCK
      ?auto_138180 - BLOCK
      ?auto_138181 - BLOCK
      ?auto_138182 - BLOCK
      ?auto_138183 - BLOCK
      ?auto_138184 - BLOCK
      ?auto_138185 - BLOCK
      ?auto_138186 - BLOCK
      ?auto_138187 - BLOCK
    )
    :vars
    (
      ?auto_138188 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_138187 ?auto_138188 ) ( ON-TABLE ?auto_138179 ) ( ON ?auto_138180 ?auto_138179 ) ( ON ?auto_138181 ?auto_138180 ) ( not ( = ?auto_138179 ?auto_138180 ) ) ( not ( = ?auto_138179 ?auto_138181 ) ) ( not ( = ?auto_138179 ?auto_138182 ) ) ( not ( = ?auto_138179 ?auto_138183 ) ) ( not ( = ?auto_138179 ?auto_138184 ) ) ( not ( = ?auto_138179 ?auto_138185 ) ) ( not ( = ?auto_138179 ?auto_138186 ) ) ( not ( = ?auto_138179 ?auto_138187 ) ) ( not ( = ?auto_138179 ?auto_138188 ) ) ( not ( = ?auto_138180 ?auto_138181 ) ) ( not ( = ?auto_138180 ?auto_138182 ) ) ( not ( = ?auto_138180 ?auto_138183 ) ) ( not ( = ?auto_138180 ?auto_138184 ) ) ( not ( = ?auto_138180 ?auto_138185 ) ) ( not ( = ?auto_138180 ?auto_138186 ) ) ( not ( = ?auto_138180 ?auto_138187 ) ) ( not ( = ?auto_138180 ?auto_138188 ) ) ( not ( = ?auto_138181 ?auto_138182 ) ) ( not ( = ?auto_138181 ?auto_138183 ) ) ( not ( = ?auto_138181 ?auto_138184 ) ) ( not ( = ?auto_138181 ?auto_138185 ) ) ( not ( = ?auto_138181 ?auto_138186 ) ) ( not ( = ?auto_138181 ?auto_138187 ) ) ( not ( = ?auto_138181 ?auto_138188 ) ) ( not ( = ?auto_138182 ?auto_138183 ) ) ( not ( = ?auto_138182 ?auto_138184 ) ) ( not ( = ?auto_138182 ?auto_138185 ) ) ( not ( = ?auto_138182 ?auto_138186 ) ) ( not ( = ?auto_138182 ?auto_138187 ) ) ( not ( = ?auto_138182 ?auto_138188 ) ) ( not ( = ?auto_138183 ?auto_138184 ) ) ( not ( = ?auto_138183 ?auto_138185 ) ) ( not ( = ?auto_138183 ?auto_138186 ) ) ( not ( = ?auto_138183 ?auto_138187 ) ) ( not ( = ?auto_138183 ?auto_138188 ) ) ( not ( = ?auto_138184 ?auto_138185 ) ) ( not ( = ?auto_138184 ?auto_138186 ) ) ( not ( = ?auto_138184 ?auto_138187 ) ) ( not ( = ?auto_138184 ?auto_138188 ) ) ( not ( = ?auto_138185 ?auto_138186 ) ) ( not ( = ?auto_138185 ?auto_138187 ) ) ( not ( = ?auto_138185 ?auto_138188 ) ) ( not ( = ?auto_138186 ?auto_138187 ) ) ( not ( = ?auto_138186 ?auto_138188 ) ) ( not ( = ?auto_138187 ?auto_138188 ) ) ( ON ?auto_138186 ?auto_138187 ) ( ON ?auto_138185 ?auto_138186 ) ( ON ?auto_138184 ?auto_138185 ) ( ON ?auto_138183 ?auto_138184 ) ( CLEAR ?auto_138181 ) ( ON ?auto_138182 ?auto_138183 ) ( CLEAR ?auto_138182 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_138179 ?auto_138180 ?auto_138181 ?auto_138182 )
      ( MAKE-9PILE ?auto_138179 ?auto_138180 ?auto_138181 ?auto_138182 ?auto_138183 ?auto_138184 ?auto_138185 ?auto_138186 ?auto_138187 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_138217 - BLOCK
      ?auto_138218 - BLOCK
      ?auto_138219 - BLOCK
      ?auto_138220 - BLOCK
      ?auto_138221 - BLOCK
      ?auto_138222 - BLOCK
      ?auto_138223 - BLOCK
      ?auto_138224 - BLOCK
      ?auto_138225 - BLOCK
    )
    :vars
    (
      ?auto_138226 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_138225 ?auto_138226 ) ( ON-TABLE ?auto_138217 ) ( ON ?auto_138218 ?auto_138217 ) ( not ( = ?auto_138217 ?auto_138218 ) ) ( not ( = ?auto_138217 ?auto_138219 ) ) ( not ( = ?auto_138217 ?auto_138220 ) ) ( not ( = ?auto_138217 ?auto_138221 ) ) ( not ( = ?auto_138217 ?auto_138222 ) ) ( not ( = ?auto_138217 ?auto_138223 ) ) ( not ( = ?auto_138217 ?auto_138224 ) ) ( not ( = ?auto_138217 ?auto_138225 ) ) ( not ( = ?auto_138217 ?auto_138226 ) ) ( not ( = ?auto_138218 ?auto_138219 ) ) ( not ( = ?auto_138218 ?auto_138220 ) ) ( not ( = ?auto_138218 ?auto_138221 ) ) ( not ( = ?auto_138218 ?auto_138222 ) ) ( not ( = ?auto_138218 ?auto_138223 ) ) ( not ( = ?auto_138218 ?auto_138224 ) ) ( not ( = ?auto_138218 ?auto_138225 ) ) ( not ( = ?auto_138218 ?auto_138226 ) ) ( not ( = ?auto_138219 ?auto_138220 ) ) ( not ( = ?auto_138219 ?auto_138221 ) ) ( not ( = ?auto_138219 ?auto_138222 ) ) ( not ( = ?auto_138219 ?auto_138223 ) ) ( not ( = ?auto_138219 ?auto_138224 ) ) ( not ( = ?auto_138219 ?auto_138225 ) ) ( not ( = ?auto_138219 ?auto_138226 ) ) ( not ( = ?auto_138220 ?auto_138221 ) ) ( not ( = ?auto_138220 ?auto_138222 ) ) ( not ( = ?auto_138220 ?auto_138223 ) ) ( not ( = ?auto_138220 ?auto_138224 ) ) ( not ( = ?auto_138220 ?auto_138225 ) ) ( not ( = ?auto_138220 ?auto_138226 ) ) ( not ( = ?auto_138221 ?auto_138222 ) ) ( not ( = ?auto_138221 ?auto_138223 ) ) ( not ( = ?auto_138221 ?auto_138224 ) ) ( not ( = ?auto_138221 ?auto_138225 ) ) ( not ( = ?auto_138221 ?auto_138226 ) ) ( not ( = ?auto_138222 ?auto_138223 ) ) ( not ( = ?auto_138222 ?auto_138224 ) ) ( not ( = ?auto_138222 ?auto_138225 ) ) ( not ( = ?auto_138222 ?auto_138226 ) ) ( not ( = ?auto_138223 ?auto_138224 ) ) ( not ( = ?auto_138223 ?auto_138225 ) ) ( not ( = ?auto_138223 ?auto_138226 ) ) ( not ( = ?auto_138224 ?auto_138225 ) ) ( not ( = ?auto_138224 ?auto_138226 ) ) ( not ( = ?auto_138225 ?auto_138226 ) ) ( ON ?auto_138224 ?auto_138225 ) ( ON ?auto_138223 ?auto_138224 ) ( ON ?auto_138222 ?auto_138223 ) ( ON ?auto_138221 ?auto_138222 ) ( ON ?auto_138220 ?auto_138221 ) ( CLEAR ?auto_138218 ) ( ON ?auto_138219 ?auto_138220 ) ( CLEAR ?auto_138219 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_138217 ?auto_138218 ?auto_138219 )
      ( MAKE-9PILE ?auto_138217 ?auto_138218 ?auto_138219 ?auto_138220 ?auto_138221 ?auto_138222 ?auto_138223 ?auto_138224 ?auto_138225 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_138255 - BLOCK
      ?auto_138256 - BLOCK
      ?auto_138257 - BLOCK
      ?auto_138258 - BLOCK
      ?auto_138259 - BLOCK
      ?auto_138260 - BLOCK
      ?auto_138261 - BLOCK
      ?auto_138262 - BLOCK
      ?auto_138263 - BLOCK
    )
    :vars
    (
      ?auto_138264 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_138263 ?auto_138264 ) ( ON-TABLE ?auto_138255 ) ( not ( = ?auto_138255 ?auto_138256 ) ) ( not ( = ?auto_138255 ?auto_138257 ) ) ( not ( = ?auto_138255 ?auto_138258 ) ) ( not ( = ?auto_138255 ?auto_138259 ) ) ( not ( = ?auto_138255 ?auto_138260 ) ) ( not ( = ?auto_138255 ?auto_138261 ) ) ( not ( = ?auto_138255 ?auto_138262 ) ) ( not ( = ?auto_138255 ?auto_138263 ) ) ( not ( = ?auto_138255 ?auto_138264 ) ) ( not ( = ?auto_138256 ?auto_138257 ) ) ( not ( = ?auto_138256 ?auto_138258 ) ) ( not ( = ?auto_138256 ?auto_138259 ) ) ( not ( = ?auto_138256 ?auto_138260 ) ) ( not ( = ?auto_138256 ?auto_138261 ) ) ( not ( = ?auto_138256 ?auto_138262 ) ) ( not ( = ?auto_138256 ?auto_138263 ) ) ( not ( = ?auto_138256 ?auto_138264 ) ) ( not ( = ?auto_138257 ?auto_138258 ) ) ( not ( = ?auto_138257 ?auto_138259 ) ) ( not ( = ?auto_138257 ?auto_138260 ) ) ( not ( = ?auto_138257 ?auto_138261 ) ) ( not ( = ?auto_138257 ?auto_138262 ) ) ( not ( = ?auto_138257 ?auto_138263 ) ) ( not ( = ?auto_138257 ?auto_138264 ) ) ( not ( = ?auto_138258 ?auto_138259 ) ) ( not ( = ?auto_138258 ?auto_138260 ) ) ( not ( = ?auto_138258 ?auto_138261 ) ) ( not ( = ?auto_138258 ?auto_138262 ) ) ( not ( = ?auto_138258 ?auto_138263 ) ) ( not ( = ?auto_138258 ?auto_138264 ) ) ( not ( = ?auto_138259 ?auto_138260 ) ) ( not ( = ?auto_138259 ?auto_138261 ) ) ( not ( = ?auto_138259 ?auto_138262 ) ) ( not ( = ?auto_138259 ?auto_138263 ) ) ( not ( = ?auto_138259 ?auto_138264 ) ) ( not ( = ?auto_138260 ?auto_138261 ) ) ( not ( = ?auto_138260 ?auto_138262 ) ) ( not ( = ?auto_138260 ?auto_138263 ) ) ( not ( = ?auto_138260 ?auto_138264 ) ) ( not ( = ?auto_138261 ?auto_138262 ) ) ( not ( = ?auto_138261 ?auto_138263 ) ) ( not ( = ?auto_138261 ?auto_138264 ) ) ( not ( = ?auto_138262 ?auto_138263 ) ) ( not ( = ?auto_138262 ?auto_138264 ) ) ( not ( = ?auto_138263 ?auto_138264 ) ) ( ON ?auto_138262 ?auto_138263 ) ( ON ?auto_138261 ?auto_138262 ) ( ON ?auto_138260 ?auto_138261 ) ( ON ?auto_138259 ?auto_138260 ) ( ON ?auto_138258 ?auto_138259 ) ( ON ?auto_138257 ?auto_138258 ) ( CLEAR ?auto_138255 ) ( ON ?auto_138256 ?auto_138257 ) ( CLEAR ?auto_138256 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_138255 ?auto_138256 )
      ( MAKE-9PILE ?auto_138255 ?auto_138256 ?auto_138257 ?auto_138258 ?auto_138259 ?auto_138260 ?auto_138261 ?auto_138262 ?auto_138263 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_138293 - BLOCK
      ?auto_138294 - BLOCK
      ?auto_138295 - BLOCK
      ?auto_138296 - BLOCK
      ?auto_138297 - BLOCK
      ?auto_138298 - BLOCK
      ?auto_138299 - BLOCK
      ?auto_138300 - BLOCK
      ?auto_138301 - BLOCK
    )
    :vars
    (
      ?auto_138302 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_138301 ?auto_138302 ) ( not ( = ?auto_138293 ?auto_138294 ) ) ( not ( = ?auto_138293 ?auto_138295 ) ) ( not ( = ?auto_138293 ?auto_138296 ) ) ( not ( = ?auto_138293 ?auto_138297 ) ) ( not ( = ?auto_138293 ?auto_138298 ) ) ( not ( = ?auto_138293 ?auto_138299 ) ) ( not ( = ?auto_138293 ?auto_138300 ) ) ( not ( = ?auto_138293 ?auto_138301 ) ) ( not ( = ?auto_138293 ?auto_138302 ) ) ( not ( = ?auto_138294 ?auto_138295 ) ) ( not ( = ?auto_138294 ?auto_138296 ) ) ( not ( = ?auto_138294 ?auto_138297 ) ) ( not ( = ?auto_138294 ?auto_138298 ) ) ( not ( = ?auto_138294 ?auto_138299 ) ) ( not ( = ?auto_138294 ?auto_138300 ) ) ( not ( = ?auto_138294 ?auto_138301 ) ) ( not ( = ?auto_138294 ?auto_138302 ) ) ( not ( = ?auto_138295 ?auto_138296 ) ) ( not ( = ?auto_138295 ?auto_138297 ) ) ( not ( = ?auto_138295 ?auto_138298 ) ) ( not ( = ?auto_138295 ?auto_138299 ) ) ( not ( = ?auto_138295 ?auto_138300 ) ) ( not ( = ?auto_138295 ?auto_138301 ) ) ( not ( = ?auto_138295 ?auto_138302 ) ) ( not ( = ?auto_138296 ?auto_138297 ) ) ( not ( = ?auto_138296 ?auto_138298 ) ) ( not ( = ?auto_138296 ?auto_138299 ) ) ( not ( = ?auto_138296 ?auto_138300 ) ) ( not ( = ?auto_138296 ?auto_138301 ) ) ( not ( = ?auto_138296 ?auto_138302 ) ) ( not ( = ?auto_138297 ?auto_138298 ) ) ( not ( = ?auto_138297 ?auto_138299 ) ) ( not ( = ?auto_138297 ?auto_138300 ) ) ( not ( = ?auto_138297 ?auto_138301 ) ) ( not ( = ?auto_138297 ?auto_138302 ) ) ( not ( = ?auto_138298 ?auto_138299 ) ) ( not ( = ?auto_138298 ?auto_138300 ) ) ( not ( = ?auto_138298 ?auto_138301 ) ) ( not ( = ?auto_138298 ?auto_138302 ) ) ( not ( = ?auto_138299 ?auto_138300 ) ) ( not ( = ?auto_138299 ?auto_138301 ) ) ( not ( = ?auto_138299 ?auto_138302 ) ) ( not ( = ?auto_138300 ?auto_138301 ) ) ( not ( = ?auto_138300 ?auto_138302 ) ) ( not ( = ?auto_138301 ?auto_138302 ) ) ( ON ?auto_138300 ?auto_138301 ) ( ON ?auto_138299 ?auto_138300 ) ( ON ?auto_138298 ?auto_138299 ) ( ON ?auto_138297 ?auto_138298 ) ( ON ?auto_138296 ?auto_138297 ) ( ON ?auto_138295 ?auto_138296 ) ( ON ?auto_138294 ?auto_138295 ) ( ON ?auto_138293 ?auto_138294 ) ( CLEAR ?auto_138293 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_138293 )
      ( MAKE-9PILE ?auto_138293 ?auto_138294 ?auto_138295 ?auto_138296 ?auto_138297 ?auto_138298 ?auto_138299 ?auto_138300 ?auto_138301 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_138332 - BLOCK
      ?auto_138333 - BLOCK
      ?auto_138334 - BLOCK
      ?auto_138335 - BLOCK
      ?auto_138336 - BLOCK
      ?auto_138337 - BLOCK
      ?auto_138338 - BLOCK
      ?auto_138339 - BLOCK
      ?auto_138340 - BLOCK
      ?auto_138341 - BLOCK
    )
    :vars
    (
      ?auto_138342 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_138340 ) ( ON ?auto_138341 ?auto_138342 ) ( CLEAR ?auto_138341 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_138332 ) ( ON ?auto_138333 ?auto_138332 ) ( ON ?auto_138334 ?auto_138333 ) ( ON ?auto_138335 ?auto_138334 ) ( ON ?auto_138336 ?auto_138335 ) ( ON ?auto_138337 ?auto_138336 ) ( ON ?auto_138338 ?auto_138337 ) ( ON ?auto_138339 ?auto_138338 ) ( ON ?auto_138340 ?auto_138339 ) ( not ( = ?auto_138332 ?auto_138333 ) ) ( not ( = ?auto_138332 ?auto_138334 ) ) ( not ( = ?auto_138332 ?auto_138335 ) ) ( not ( = ?auto_138332 ?auto_138336 ) ) ( not ( = ?auto_138332 ?auto_138337 ) ) ( not ( = ?auto_138332 ?auto_138338 ) ) ( not ( = ?auto_138332 ?auto_138339 ) ) ( not ( = ?auto_138332 ?auto_138340 ) ) ( not ( = ?auto_138332 ?auto_138341 ) ) ( not ( = ?auto_138332 ?auto_138342 ) ) ( not ( = ?auto_138333 ?auto_138334 ) ) ( not ( = ?auto_138333 ?auto_138335 ) ) ( not ( = ?auto_138333 ?auto_138336 ) ) ( not ( = ?auto_138333 ?auto_138337 ) ) ( not ( = ?auto_138333 ?auto_138338 ) ) ( not ( = ?auto_138333 ?auto_138339 ) ) ( not ( = ?auto_138333 ?auto_138340 ) ) ( not ( = ?auto_138333 ?auto_138341 ) ) ( not ( = ?auto_138333 ?auto_138342 ) ) ( not ( = ?auto_138334 ?auto_138335 ) ) ( not ( = ?auto_138334 ?auto_138336 ) ) ( not ( = ?auto_138334 ?auto_138337 ) ) ( not ( = ?auto_138334 ?auto_138338 ) ) ( not ( = ?auto_138334 ?auto_138339 ) ) ( not ( = ?auto_138334 ?auto_138340 ) ) ( not ( = ?auto_138334 ?auto_138341 ) ) ( not ( = ?auto_138334 ?auto_138342 ) ) ( not ( = ?auto_138335 ?auto_138336 ) ) ( not ( = ?auto_138335 ?auto_138337 ) ) ( not ( = ?auto_138335 ?auto_138338 ) ) ( not ( = ?auto_138335 ?auto_138339 ) ) ( not ( = ?auto_138335 ?auto_138340 ) ) ( not ( = ?auto_138335 ?auto_138341 ) ) ( not ( = ?auto_138335 ?auto_138342 ) ) ( not ( = ?auto_138336 ?auto_138337 ) ) ( not ( = ?auto_138336 ?auto_138338 ) ) ( not ( = ?auto_138336 ?auto_138339 ) ) ( not ( = ?auto_138336 ?auto_138340 ) ) ( not ( = ?auto_138336 ?auto_138341 ) ) ( not ( = ?auto_138336 ?auto_138342 ) ) ( not ( = ?auto_138337 ?auto_138338 ) ) ( not ( = ?auto_138337 ?auto_138339 ) ) ( not ( = ?auto_138337 ?auto_138340 ) ) ( not ( = ?auto_138337 ?auto_138341 ) ) ( not ( = ?auto_138337 ?auto_138342 ) ) ( not ( = ?auto_138338 ?auto_138339 ) ) ( not ( = ?auto_138338 ?auto_138340 ) ) ( not ( = ?auto_138338 ?auto_138341 ) ) ( not ( = ?auto_138338 ?auto_138342 ) ) ( not ( = ?auto_138339 ?auto_138340 ) ) ( not ( = ?auto_138339 ?auto_138341 ) ) ( not ( = ?auto_138339 ?auto_138342 ) ) ( not ( = ?auto_138340 ?auto_138341 ) ) ( not ( = ?auto_138340 ?auto_138342 ) ) ( not ( = ?auto_138341 ?auto_138342 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_138341 ?auto_138342 )
      ( !STACK ?auto_138341 ?auto_138340 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_138374 - BLOCK
      ?auto_138375 - BLOCK
      ?auto_138376 - BLOCK
      ?auto_138377 - BLOCK
      ?auto_138378 - BLOCK
      ?auto_138379 - BLOCK
      ?auto_138380 - BLOCK
      ?auto_138381 - BLOCK
      ?auto_138382 - BLOCK
      ?auto_138383 - BLOCK
    )
    :vars
    (
      ?auto_138384 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_138383 ?auto_138384 ) ( ON-TABLE ?auto_138374 ) ( ON ?auto_138375 ?auto_138374 ) ( ON ?auto_138376 ?auto_138375 ) ( ON ?auto_138377 ?auto_138376 ) ( ON ?auto_138378 ?auto_138377 ) ( ON ?auto_138379 ?auto_138378 ) ( ON ?auto_138380 ?auto_138379 ) ( ON ?auto_138381 ?auto_138380 ) ( not ( = ?auto_138374 ?auto_138375 ) ) ( not ( = ?auto_138374 ?auto_138376 ) ) ( not ( = ?auto_138374 ?auto_138377 ) ) ( not ( = ?auto_138374 ?auto_138378 ) ) ( not ( = ?auto_138374 ?auto_138379 ) ) ( not ( = ?auto_138374 ?auto_138380 ) ) ( not ( = ?auto_138374 ?auto_138381 ) ) ( not ( = ?auto_138374 ?auto_138382 ) ) ( not ( = ?auto_138374 ?auto_138383 ) ) ( not ( = ?auto_138374 ?auto_138384 ) ) ( not ( = ?auto_138375 ?auto_138376 ) ) ( not ( = ?auto_138375 ?auto_138377 ) ) ( not ( = ?auto_138375 ?auto_138378 ) ) ( not ( = ?auto_138375 ?auto_138379 ) ) ( not ( = ?auto_138375 ?auto_138380 ) ) ( not ( = ?auto_138375 ?auto_138381 ) ) ( not ( = ?auto_138375 ?auto_138382 ) ) ( not ( = ?auto_138375 ?auto_138383 ) ) ( not ( = ?auto_138375 ?auto_138384 ) ) ( not ( = ?auto_138376 ?auto_138377 ) ) ( not ( = ?auto_138376 ?auto_138378 ) ) ( not ( = ?auto_138376 ?auto_138379 ) ) ( not ( = ?auto_138376 ?auto_138380 ) ) ( not ( = ?auto_138376 ?auto_138381 ) ) ( not ( = ?auto_138376 ?auto_138382 ) ) ( not ( = ?auto_138376 ?auto_138383 ) ) ( not ( = ?auto_138376 ?auto_138384 ) ) ( not ( = ?auto_138377 ?auto_138378 ) ) ( not ( = ?auto_138377 ?auto_138379 ) ) ( not ( = ?auto_138377 ?auto_138380 ) ) ( not ( = ?auto_138377 ?auto_138381 ) ) ( not ( = ?auto_138377 ?auto_138382 ) ) ( not ( = ?auto_138377 ?auto_138383 ) ) ( not ( = ?auto_138377 ?auto_138384 ) ) ( not ( = ?auto_138378 ?auto_138379 ) ) ( not ( = ?auto_138378 ?auto_138380 ) ) ( not ( = ?auto_138378 ?auto_138381 ) ) ( not ( = ?auto_138378 ?auto_138382 ) ) ( not ( = ?auto_138378 ?auto_138383 ) ) ( not ( = ?auto_138378 ?auto_138384 ) ) ( not ( = ?auto_138379 ?auto_138380 ) ) ( not ( = ?auto_138379 ?auto_138381 ) ) ( not ( = ?auto_138379 ?auto_138382 ) ) ( not ( = ?auto_138379 ?auto_138383 ) ) ( not ( = ?auto_138379 ?auto_138384 ) ) ( not ( = ?auto_138380 ?auto_138381 ) ) ( not ( = ?auto_138380 ?auto_138382 ) ) ( not ( = ?auto_138380 ?auto_138383 ) ) ( not ( = ?auto_138380 ?auto_138384 ) ) ( not ( = ?auto_138381 ?auto_138382 ) ) ( not ( = ?auto_138381 ?auto_138383 ) ) ( not ( = ?auto_138381 ?auto_138384 ) ) ( not ( = ?auto_138382 ?auto_138383 ) ) ( not ( = ?auto_138382 ?auto_138384 ) ) ( not ( = ?auto_138383 ?auto_138384 ) ) ( CLEAR ?auto_138381 ) ( ON ?auto_138382 ?auto_138383 ) ( CLEAR ?auto_138382 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_138374 ?auto_138375 ?auto_138376 ?auto_138377 ?auto_138378 ?auto_138379 ?auto_138380 ?auto_138381 ?auto_138382 )
      ( MAKE-10PILE ?auto_138374 ?auto_138375 ?auto_138376 ?auto_138377 ?auto_138378 ?auto_138379 ?auto_138380 ?auto_138381 ?auto_138382 ?auto_138383 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_138416 - BLOCK
      ?auto_138417 - BLOCK
      ?auto_138418 - BLOCK
      ?auto_138419 - BLOCK
      ?auto_138420 - BLOCK
      ?auto_138421 - BLOCK
      ?auto_138422 - BLOCK
      ?auto_138423 - BLOCK
      ?auto_138424 - BLOCK
      ?auto_138425 - BLOCK
    )
    :vars
    (
      ?auto_138426 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_138425 ?auto_138426 ) ( ON-TABLE ?auto_138416 ) ( ON ?auto_138417 ?auto_138416 ) ( ON ?auto_138418 ?auto_138417 ) ( ON ?auto_138419 ?auto_138418 ) ( ON ?auto_138420 ?auto_138419 ) ( ON ?auto_138421 ?auto_138420 ) ( ON ?auto_138422 ?auto_138421 ) ( not ( = ?auto_138416 ?auto_138417 ) ) ( not ( = ?auto_138416 ?auto_138418 ) ) ( not ( = ?auto_138416 ?auto_138419 ) ) ( not ( = ?auto_138416 ?auto_138420 ) ) ( not ( = ?auto_138416 ?auto_138421 ) ) ( not ( = ?auto_138416 ?auto_138422 ) ) ( not ( = ?auto_138416 ?auto_138423 ) ) ( not ( = ?auto_138416 ?auto_138424 ) ) ( not ( = ?auto_138416 ?auto_138425 ) ) ( not ( = ?auto_138416 ?auto_138426 ) ) ( not ( = ?auto_138417 ?auto_138418 ) ) ( not ( = ?auto_138417 ?auto_138419 ) ) ( not ( = ?auto_138417 ?auto_138420 ) ) ( not ( = ?auto_138417 ?auto_138421 ) ) ( not ( = ?auto_138417 ?auto_138422 ) ) ( not ( = ?auto_138417 ?auto_138423 ) ) ( not ( = ?auto_138417 ?auto_138424 ) ) ( not ( = ?auto_138417 ?auto_138425 ) ) ( not ( = ?auto_138417 ?auto_138426 ) ) ( not ( = ?auto_138418 ?auto_138419 ) ) ( not ( = ?auto_138418 ?auto_138420 ) ) ( not ( = ?auto_138418 ?auto_138421 ) ) ( not ( = ?auto_138418 ?auto_138422 ) ) ( not ( = ?auto_138418 ?auto_138423 ) ) ( not ( = ?auto_138418 ?auto_138424 ) ) ( not ( = ?auto_138418 ?auto_138425 ) ) ( not ( = ?auto_138418 ?auto_138426 ) ) ( not ( = ?auto_138419 ?auto_138420 ) ) ( not ( = ?auto_138419 ?auto_138421 ) ) ( not ( = ?auto_138419 ?auto_138422 ) ) ( not ( = ?auto_138419 ?auto_138423 ) ) ( not ( = ?auto_138419 ?auto_138424 ) ) ( not ( = ?auto_138419 ?auto_138425 ) ) ( not ( = ?auto_138419 ?auto_138426 ) ) ( not ( = ?auto_138420 ?auto_138421 ) ) ( not ( = ?auto_138420 ?auto_138422 ) ) ( not ( = ?auto_138420 ?auto_138423 ) ) ( not ( = ?auto_138420 ?auto_138424 ) ) ( not ( = ?auto_138420 ?auto_138425 ) ) ( not ( = ?auto_138420 ?auto_138426 ) ) ( not ( = ?auto_138421 ?auto_138422 ) ) ( not ( = ?auto_138421 ?auto_138423 ) ) ( not ( = ?auto_138421 ?auto_138424 ) ) ( not ( = ?auto_138421 ?auto_138425 ) ) ( not ( = ?auto_138421 ?auto_138426 ) ) ( not ( = ?auto_138422 ?auto_138423 ) ) ( not ( = ?auto_138422 ?auto_138424 ) ) ( not ( = ?auto_138422 ?auto_138425 ) ) ( not ( = ?auto_138422 ?auto_138426 ) ) ( not ( = ?auto_138423 ?auto_138424 ) ) ( not ( = ?auto_138423 ?auto_138425 ) ) ( not ( = ?auto_138423 ?auto_138426 ) ) ( not ( = ?auto_138424 ?auto_138425 ) ) ( not ( = ?auto_138424 ?auto_138426 ) ) ( not ( = ?auto_138425 ?auto_138426 ) ) ( ON ?auto_138424 ?auto_138425 ) ( CLEAR ?auto_138422 ) ( ON ?auto_138423 ?auto_138424 ) ( CLEAR ?auto_138423 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_138416 ?auto_138417 ?auto_138418 ?auto_138419 ?auto_138420 ?auto_138421 ?auto_138422 ?auto_138423 )
      ( MAKE-10PILE ?auto_138416 ?auto_138417 ?auto_138418 ?auto_138419 ?auto_138420 ?auto_138421 ?auto_138422 ?auto_138423 ?auto_138424 ?auto_138425 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_138458 - BLOCK
      ?auto_138459 - BLOCK
      ?auto_138460 - BLOCK
      ?auto_138461 - BLOCK
      ?auto_138462 - BLOCK
      ?auto_138463 - BLOCK
      ?auto_138464 - BLOCK
      ?auto_138465 - BLOCK
      ?auto_138466 - BLOCK
      ?auto_138467 - BLOCK
    )
    :vars
    (
      ?auto_138468 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_138467 ?auto_138468 ) ( ON-TABLE ?auto_138458 ) ( ON ?auto_138459 ?auto_138458 ) ( ON ?auto_138460 ?auto_138459 ) ( ON ?auto_138461 ?auto_138460 ) ( ON ?auto_138462 ?auto_138461 ) ( ON ?auto_138463 ?auto_138462 ) ( not ( = ?auto_138458 ?auto_138459 ) ) ( not ( = ?auto_138458 ?auto_138460 ) ) ( not ( = ?auto_138458 ?auto_138461 ) ) ( not ( = ?auto_138458 ?auto_138462 ) ) ( not ( = ?auto_138458 ?auto_138463 ) ) ( not ( = ?auto_138458 ?auto_138464 ) ) ( not ( = ?auto_138458 ?auto_138465 ) ) ( not ( = ?auto_138458 ?auto_138466 ) ) ( not ( = ?auto_138458 ?auto_138467 ) ) ( not ( = ?auto_138458 ?auto_138468 ) ) ( not ( = ?auto_138459 ?auto_138460 ) ) ( not ( = ?auto_138459 ?auto_138461 ) ) ( not ( = ?auto_138459 ?auto_138462 ) ) ( not ( = ?auto_138459 ?auto_138463 ) ) ( not ( = ?auto_138459 ?auto_138464 ) ) ( not ( = ?auto_138459 ?auto_138465 ) ) ( not ( = ?auto_138459 ?auto_138466 ) ) ( not ( = ?auto_138459 ?auto_138467 ) ) ( not ( = ?auto_138459 ?auto_138468 ) ) ( not ( = ?auto_138460 ?auto_138461 ) ) ( not ( = ?auto_138460 ?auto_138462 ) ) ( not ( = ?auto_138460 ?auto_138463 ) ) ( not ( = ?auto_138460 ?auto_138464 ) ) ( not ( = ?auto_138460 ?auto_138465 ) ) ( not ( = ?auto_138460 ?auto_138466 ) ) ( not ( = ?auto_138460 ?auto_138467 ) ) ( not ( = ?auto_138460 ?auto_138468 ) ) ( not ( = ?auto_138461 ?auto_138462 ) ) ( not ( = ?auto_138461 ?auto_138463 ) ) ( not ( = ?auto_138461 ?auto_138464 ) ) ( not ( = ?auto_138461 ?auto_138465 ) ) ( not ( = ?auto_138461 ?auto_138466 ) ) ( not ( = ?auto_138461 ?auto_138467 ) ) ( not ( = ?auto_138461 ?auto_138468 ) ) ( not ( = ?auto_138462 ?auto_138463 ) ) ( not ( = ?auto_138462 ?auto_138464 ) ) ( not ( = ?auto_138462 ?auto_138465 ) ) ( not ( = ?auto_138462 ?auto_138466 ) ) ( not ( = ?auto_138462 ?auto_138467 ) ) ( not ( = ?auto_138462 ?auto_138468 ) ) ( not ( = ?auto_138463 ?auto_138464 ) ) ( not ( = ?auto_138463 ?auto_138465 ) ) ( not ( = ?auto_138463 ?auto_138466 ) ) ( not ( = ?auto_138463 ?auto_138467 ) ) ( not ( = ?auto_138463 ?auto_138468 ) ) ( not ( = ?auto_138464 ?auto_138465 ) ) ( not ( = ?auto_138464 ?auto_138466 ) ) ( not ( = ?auto_138464 ?auto_138467 ) ) ( not ( = ?auto_138464 ?auto_138468 ) ) ( not ( = ?auto_138465 ?auto_138466 ) ) ( not ( = ?auto_138465 ?auto_138467 ) ) ( not ( = ?auto_138465 ?auto_138468 ) ) ( not ( = ?auto_138466 ?auto_138467 ) ) ( not ( = ?auto_138466 ?auto_138468 ) ) ( not ( = ?auto_138467 ?auto_138468 ) ) ( ON ?auto_138466 ?auto_138467 ) ( ON ?auto_138465 ?auto_138466 ) ( CLEAR ?auto_138463 ) ( ON ?auto_138464 ?auto_138465 ) ( CLEAR ?auto_138464 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_138458 ?auto_138459 ?auto_138460 ?auto_138461 ?auto_138462 ?auto_138463 ?auto_138464 )
      ( MAKE-10PILE ?auto_138458 ?auto_138459 ?auto_138460 ?auto_138461 ?auto_138462 ?auto_138463 ?auto_138464 ?auto_138465 ?auto_138466 ?auto_138467 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_138500 - BLOCK
      ?auto_138501 - BLOCK
      ?auto_138502 - BLOCK
      ?auto_138503 - BLOCK
      ?auto_138504 - BLOCK
      ?auto_138505 - BLOCK
      ?auto_138506 - BLOCK
      ?auto_138507 - BLOCK
      ?auto_138508 - BLOCK
      ?auto_138509 - BLOCK
    )
    :vars
    (
      ?auto_138510 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_138509 ?auto_138510 ) ( ON-TABLE ?auto_138500 ) ( ON ?auto_138501 ?auto_138500 ) ( ON ?auto_138502 ?auto_138501 ) ( ON ?auto_138503 ?auto_138502 ) ( ON ?auto_138504 ?auto_138503 ) ( not ( = ?auto_138500 ?auto_138501 ) ) ( not ( = ?auto_138500 ?auto_138502 ) ) ( not ( = ?auto_138500 ?auto_138503 ) ) ( not ( = ?auto_138500 ?auto_138504 ) ) ( not ( = ?auto_138500 ?auto_138505 ) ) ( not ( = ?auto_138500 ?auto_138506 ) ) ( not ( = ?auto_138500 ?auto_138507 ) ) ( not ( = ?auto_138500 ?auto_138508 ) ) ( not ( = ?auto_138500 ?auto_138509 ) ) ( not ( = ?auto_138500 ?auto_138510 ) ) ( not ( = ?auto_138501 ?auto_138502 ) ) ( not ( = ?auto_138501 ?auto_138503 ) ) ( not ( = ?auto_138501 ?auto_138504 ) ) ( not ( = ?auto_138501 ?auto_138505 ) ) ( not ( = ?auto_138501 ?auto_138506 ) ) ( not ( = ?auto_138501 ?auto_138507 ) ) ( not ( = ?auto_138501 ?auto_138508 ) ) ( not ( = ?auto_138501 ?auto_138509 ) ) ( not ( = ?auto_138501 ?auto_138510 ) ) ( not ( = ?auto_138502 ?auto_138503 ) ) ( not ( = ?auto_138502 ?auto_138504 ) ) ( not ( = ?auto_138502 ?auto_138505 ) ) ( not ( = ?auto_138502 ?auto_138506 ) ) ( not ( = ?auto_138502 ?auto_138507 ) ) ( not ( = ?auto_138502 ?auto_138508 ) ) ( not ( = ?auto_138502 ?auto_138509 ) ) ( not ( = ?auto_138502 ?auto_138510 ) ) ( not ( = ?auto_138503 ?auto_138504 ) ) ( not ( = ?auto_138503 ?auto_138505 ) ) ( not ( = ?auto_138503 ?auto_138506 ) ) ( not ( = ?auto_138503 ?auto_138507 ) ) ( not ( = ?auto_138503 ?auto_138508 ) ) ( not ( = ?auto_138503 ?auto_138509 ) ) ( not ( = ?auto_138503 ?auto_138510 ) ) ( not ( = ?auto_138504 ?auto_138505 ) ) ( not ( = ?auto_138504 ?auto_138506 ) ) ( not ( = ?auto_138504 ?auto_138507 ) ) ( not ( = ?auto_138504 ?auto_138508 ) ) ( not ( = ?auto_138504 ?auto_138509 ) ) ( not ( = ?auto_138504 ?auto_138510 ) ) ( not ( = ?auto_138505 ?auto_138506 ) ) ( not ( = ?auto_138505 ?auto_138507 ) ) ( not ( = ?auto_138505 ?auto_138508 ) ) ( not ( = ?auto_138505 ?auto_138509 ) ) ( not ( = ?auto_138505 ?auto_138510 ) ) ( not ( = ?auto_138506 ?auto_138507 ) ) ( not ( = ?auto_138506 ?auto_138508 ) ) ( not ( = ?auto_138506 ?auto_138509 ) ) ( not ( = ?auto_138506 ?auto_138510 ) ) ( not ( = ?auto_138507 ?auto_138508 ) ) ( not ( = ?auto_138507 ?auto_138509 ) ) ( not ( = ?auto_138507 ?auto_138510 ) ) ( not ( = ?auto_138508 ?auto_138509 ) ) ( not ( = ?auto_138508 ?auto_138510 ) ) ( not ( = ?auto_138509 ?auto_138510 ) ) ( ON ?auto_138508 ?auto_138509 ) ( ON ?auto_138507 ?auto_138508 ) ( ON ?auto_138506 ?auto_138507 ) ( CLEAR ?auto_138504 ) ( ON ?auto_138505 ?auto_138506 ) ( CLEAR ?auto_138505 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_138500 ?auto_138501 ?auto_138502 ?auto_138503 ?auto_138504 ?auto_138505 )
      ( MAKE-10PILE ?auto_138500 ?auto_138501 ?auto_138502 ?auto_138503 ?auto_138504 ?auto_138505 ?auto_138506 ?auto_138507 ?auto_138508 ?auto_138509 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_138542 - BLOCK
      ?auto_138543 - BLOCK
      ?auto_138544 - BLOCK
      ?auto_138545 - BLOCK
      ?auto_138546 - BLOCK
      ?auto_138547 - BLOCK
      ?auto_138548 - BLOCK
      ?auto_138549 - BLOCK
      ?auto_138550 - BLOCK
      ?auto_138551 - BLOCK
    )
    :vars
    (
      ?auto_138552 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_138551 ?auto_138552 ) ( ON-TABLE ?auto_138542 ) ( ON ?auto_138543 ?auto_138542 ) ( ON ?auto_138544 ?auto_138543 ) ( ON ?auto_138545 ?auto_138544 ) ( not ( = ?auto_138542 ?auto_138543 ) ) ( not ( = ?auto_138542 ?auto_138544 ) ) ( not ( = ?auto_138542 ?auto_138545 ) ) ( not ( = ?auto_138542 ?auto_138546 ) ) ( not ( = ?auto_138542 ?auto_138547 ) ) ( not ( = ?auto_138542 ?auto_138548 ) ) ( not ( = ?auto_138542 ?auto_138549 ) ) ( not ( = ?auto_138542 ?auto_138550 ) ) ( not ( = ?auto_138542 ?auto_138551 ) ) ( not ( = ?auto_138542 ?auto_138552 ) ) ( not ( = ?auto_138543 ?auto_138544 ) ) ( not ( = ?auto_138543 ?auto_138545 ) ) ( not ( = ?auto_138543 ?auto_138546 ) ) ( not ( = ?auto_138543 ?auto_138547 ) ) ( not ( = ?auto_138543 ?auto_138548 ) ) ( not ( = ?auto_138543 ?auto_138549 ) ) ( not ( = ?auto_138543 ?auto_138550 ) ) ( not ( = ?auto_138543 ?auto_138551 ) ) ( not ( = ?auto_138543 ?auto_138552 ) ) ( not ( = ?auto_138544 ?auto_138545 ) ) ( not ( = ?auto_138544 ?auto_138546 ) ) ( not ( = ?auto_138544 ?auto_138547 ) ) ( not ( = ?auto_138544 ?auto_138548 ) ) ( not ( = ?auto_138544 ?auto_138549 ) ) ( not ( = ?auto_138544 ?auto_138550 ) ) ( not ( = ?auto_138544 ?auto_138551 ) ) ( not ( = ?auto_138544 ?auto_138552 ) ) ( not ( = ?auto_138545 ?auto_138546 ) ) ( not ( = ?auto_138545 ?auto_138547 ) ) ( not ( = ?auto_138545 ?auto_138548 ) ) ( not ( = ?auto_138545 ?auto_138549 ) ) ( not ( = ?auto_138545 ?auto_138550 ) ) ( not ( = ?auto_138545 ?auto_138551 ) ) ( not ( = ?auto_138545 ?auto_138552 ) ) ( not ( = ?auto_138546 ?auto_138547 ) ) ( not ( = ?auto_138546 ?auto_138548 ) ) ( not ( = ?auto_138546 ?auto_138549 ) ) ( not ( = ?auto_138546 ?auto_138550 ) ) ( not ( = ?auto_138546 ?auto_138551 ) ) ( not ( = ?auto_138546 ?auto_138552 ) ) ( not ( = ?auto_138547 ?auto_138548 ) ) ( not ( = ?auto_138547 ?auto_138549 ) ) ( not ( = ?auto_138547 ?auto_138550 ) ) ( not ( = ?auto_138547 ?auto_138551 ) ) ( not ( = ?auto_138547 ?auto_138552 ) ) ( not ( = ?auto_138548 ?auto_138549 ) ) ( not ( = ?auto_138548 ?auto_138550 ) ) ( not ( = ?auto_138548 ?auto_138551 ) ) ( not ( = ?auto_138548 ?auto_138552 ) ) ( not ( = ?auto_138549 ?auto_138550 ) ) ( not ( = ?auto_138549 ?auto_138551 ) ) ( not ( = ?auto_138549 ?auto_138552 ) ) ( not ( = ?auto_138550 ?auto_138551 ) ) ( not ( = ?auto_138550 ?auto_138552 ) ) ( not ( = ?auto_138551 ?auto_138552 ) ) ( ON ?auto_138550 ?auto_138551 ) ( ON ?auto_138549 ?auto_138550 ) ( ON ?auto_138548 ?auto_138549 ) ( ON ?auto_138547 ?auto_138548 ) ( CLEAR ?auto_138545 ) ( ON ?auto_138546 ?auto_138547 ) ( CLEAR ?auto_138546 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_138542 ?auto_138543 ?auto_138544 ?auto_138545 ?auto_138546 )
      ( MAKE-10PILE ?auto_138542 ?auto_138543 ?auto_138544 ?auto_138545 ?auto_138546 ?auto_138547 ?auto_138548 ?auto_138549 ?auto_138550 ?auto_138551 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_138584 - BLOCK
      ?auto_138585 - BLOCK
      ?auto_138586 - BLOCK
      ?auto_138587 - BLOCK
      ?auto_138588 - BLOCK
      ?auto_138589 - BLOCK
      ?auto_138590 - BLOCK
      ?auto_138591 - BLOCK
      ?auto_138592 - BLOCK
      ?auto_138593 - BLOCK
    )
    :vars
    (
      ?auto_138594 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_138593 ?auto_138594 ) ( ON-TABLE ?auto_138584 ) ( ON ?auto_138585 ?auto_138584 ) ( ON ?auto_138586 ?auto_138585 ) ( not ( = ?auto_138584 ?auto_138585 ) ) ( not ( = ?auto_138584 ?auto_138586 ) ) ( not ( = ?auto_138584 ?auto_138587 ) ) ( not ( = ?auto_138584 ?auto_138588 ) ) ( not ( = ?auto_138584 ?auto_138589 ) ) ( not ( = ?auto_138584 ?auto_138590 ) ) ( not ( = ?auto_138584 ?auto_138591 ) ) ( not ( = ?auto_138584 ?auto_138592 ) ) ( not ( = ?auto_138584 ?auto_138593 ) ) ( not ( = ?auto_138584 ?auto_138594 ) ) ( not ( = ?auto_138585 ?auto_138586 ) ) ( not ( = ?auto_138585 ?auto_138587 ) ) ( not ( = ?auto_138585 ?auto_138588 ) ) ( not ( = ?auto_138585 ?auto_138589 ) ) ( not ( = ?auto_138585 ?auto_138590 ) ) ( not ( = ?auto_138585 ?auto_138591 ) ) ( not ( = ?auto_138585 ?auto_138592 ) ) ( not ( = ?auto_138585 ?auto_138593 ) ) ( not ( = ?auto_138585 ?auto_138594 ) ) ( not ( = ?auto_138586 ?auto_138587 ) ) ( not ( = ?auto_138586 ?auto_138588 ) ) ( not ( = ?auto_138586 ?auto_138589 ) ) ( not ( = ?auto_138586 ?auto_138590 ) ) ( not ( = ?auto_138586 ?auto_138591 ) ) ( not ( = ?auto_138586 ?auto_138592 ) ) ( not ( = ?auto_138586 ?auto_138593 ) ) ( not ( = ?auto_138586 ?auto_138594 ) ) ( not ( = ?auto_138587 ?auto_138588 ) ) ( not ( = ?auto_138587 ?auto_138589 ) ) ( not ( = ?auto_138587 ?auto_138590 ) ) ( not ( = ?auto_138587 ?auto_138591 ) ) ( not ( = ?auto_138587 ?auto_138592 ) ) ( not ( = ?auto_138587 ?auto_138593 ) ) ( not ( = ?auto_138587 ?auto_138594 ) ) ( not ( = ?auto_138588 ?auto_138589 ) ) ( not ( = ?auto_138588 ?auto_138590 ) ) ( not ( = ?auto_138588 ?auto_138591 ) ) ( not ( = ?auto_138588 ?auto_138592 ) ) ( not ( = ?auto_138588 ?auto_138593 ) ) ( not ( = ?auto_138588 ?auto_138594 ) ) ( not ( = ?auto_138589 ?auto_138590 ) ) ( not ( = ?auto_138589 ?auto_138591 ) ) ( not ( = ?auto_138589 ?auto_138592 ) ) ( not ( = ?auto_138589 ?auto_138593 ) ) ( not ( = ?auto_138589 ?auto_138594 ) ) ( not ( = ?auto_138590 ?auto_138591 ) ) ( not ( = ?auto_138590 ?auto_138592 ) ) ( not ( = ?auto_138590 ?auto_138593 ) ) ( not ( = ?auto_138590 ?auto_138594 ) ) ( not ( = ?auto_138591 ?auto_138592 ) ) ( not ( = ?auto_138591 ?auto_138593 ) ) ( not ( = ?auto_138591 ?auto_138594 ) ) ( not ( = ?auto_138592 ?auto_138593 ) ) ( not ( = ?auto_138592 ?auto_138594 ) ) ( not ( = ?auto_138593 ?auto_138594 ) ) ( ON ?auto_138592 ?auto_138593 ) ( ON ?auto_138591 ?auto_138592 ) ( ON ?auto_138590 ?auto_138591 ) ( ON ?auto_138589 ?auto_138590 ) ( ON ?auto_138588 ?auto_138589 ) ( CLEAR ?auto_138586 ) ( ON ?auto_138587 ?auto_138588 ) ( CLEAR ?auto_138587 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_138584 ?auto_138585 ?auto_138586 ?auto_138587 )
      ( MAKE-10PILE ?auto_138584 ?auto_138585 ?auto_138586 ?auto_138587 ?auto_138588 ?auto_138589 ?auto_138590 ?auto_138591 ?auto_138592 ?auto_138593 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_138626 - BLOCK
      ?auto_138627 - BLOCK
      ?auto_138628 - BLOCK
      ?auto_138629 - BLOCK
      ?auto_138630 - BLOCK
      ?auto_138631 - BLOCK
      ?auto_138632 - BLOCK
      ?auto_138633 - BLOCK
      ?auto_138634 - BLOCK
      ?auto_138635 - BLOCK
    )
    :vars
    (
      ?auto_138636 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_138635 ?auto_138636 ) ( ON-TABLE ?auto_138626 ) ( ON ?auto_138627 ?auto_138626 ) ( not ( = ?auto_138626 ?auto_138627 ) ) ( not ( = ?auto_138626 ?auto_138628 ) ) ( not ( = ?auto_138626 ?auto_138629 ) ) ( not ( = ?auto_138626 ?auto_138630 ) ) ( not ( = ?auto_138626 ?auto_138631 ) ) ( not ( = ?auto_138626 ?auto_138632 ) ) ( not ( = ?auto_138626 ?auto_138633 ) ) ( not ( = ?auto_138626 ?auto_138634 ) ) ( not ( = ?auto_138626 ?auto_138635 ) ) ( not ( = ?auto_138626 ?auto_138636 ) ) ( not ( = ?auto_138627 ?auto_138628 ) ) ( not ( = ?auto_138627 ?auto_138629 ) ) ( not ( = ?auto_138627 ?auto_138630 ) ) ( not ( = ?auto_138627 ?auto_138631 ) ) ( not ( = ?auto_138627 ?auto_138632 ) ) ( not ( = ?auto_138627 ?auto_138633 ) ) ( not ( = ?auto_138627 ?auto_138634 ) ) ( not ( = ?auto_138627 ?auto_138635 ) ) ( not ( = ?auto_138627 ?auto_138636 ) ) ( not ( = ?auto_138628 ?auto_138629 ) ) ( not ( = ?auto_138628 ?auto_138630 ) ) ( not ( = ?auto_138628 ?auto_138631 ) ) ( not ( = ?auto_138628 ?auto_138632 ) ) ( not ( = ?auto_138628 ?auto_138633 ) ) ( not ( = ?auto_138628 ?auto_138634 ) ) ( not ( = ?auto_138628 ?auto_138635 ) ) ( not ( = ?auto_138628 ?auto_138636 ) ) ( not ( = ?auto_138629 ?auto_138630 ) ) ( not ( = ?auto_138629 ?auto_138631 ) ) ( not ( = ?auto_138629 ?auto_138632 ) ) ( not ( = ?auto_138629 ?auto_138633 ) ) ( not ( = ?auto_138629 ?auto_138634 ) ) ( not ( = ?auto_138629 ?auto_138635 ) ) ( not ( = ?auto_138629 ?auto_138636 ) ) ( not ( = ?auto_138630 ?auto_138631 ) ) ( not ( = ?auto_138630 ?auto_138632 ) ) ( not ( = ?auto_138630 ?auto_138633 ) ) ( not ( = ?auto_138630 ?auto_138634 ) ) ( not ( = ?auto_138630 ?auto_138635 ) ) ( not ( = ?auto_138630 ?auto_138636 ) ) ( not ( = ?auto_138631 ?auto_138632 ) ) ( not ( = ?auto_138631 ?auto_138633 ) ) ( not ( = ?auto_138631 ?auto_138634 ) ) ( not ( = ?auto_138631 ?auto_138635 ) ) ( not ( = ?auto_138631 ?auto_138636 ) ) ( not ( = ?auto_138632 ?auto_138633 ) ) ( not ( = ?auto_138632 ?auto_138634 ) ) ( not ( = ?auto_138632 ?auto_138635 ) ) ( not ( = ?auto_138632 ?auto_138636 ) ) ( not ( = ?auto_138633 ?auto_138634 ) ) ( not ( = ?auto_138633 ?auto_138635 ) ) ( not ( = ?auto_138633 ?auto_138636 ) ) ( not ( = ?auto_138634 ?auto_138635 ) ) ( not ( = ?auto_138634 ?auto_138636 ) ) ( not ( = ?auto_138635 ?auto_138636 ) ) ( ON ?auto_138634 ?auto_138635 ) ( ON ?auto_138633 ?auto_138634 ) ( ON ?auto_138632 ?auto_138633 ) ( ON ?auto_138631 ?auto_138632 ) ( ON ?auto_138630 ?auto_138631 ) ( ON ?auto_138629 ?auto_138630 ) ( CLEAR ?auto_138627 ) ( ON ?auto_138628 ?auto_138629 ) ( CLEAR ?auto_138628 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_138626 ?auto_138627 ?auto_138628 )
      ( MAKE-10PILE ?auto_138626 ?auto_138627 ?auto_138628 ?auto_138629 ?auto_138630 ?auto_138631 ?auto_138632 ?auto_138633 ?auto_138634 ?auto_138635 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_138668 - BLOCK
      ?auto_138669 - BLOCK
      ?auto_138670 - BLOCK
      ?auto_138671 - BLOCK
      ?auto_138672 - BLOCK
      ?auto_138673 - BLOCK
      ?auto_138674 - BLOCK
      ?auto_138675 - BLOCK
      ?auto_138676 - BLOCK
      ?auto_138677 - BLOCK
    )
    :vars
    (
      ?auto_138678 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_138677 ?auto_138678 ) ( ON-TABLE ?auto_138668 ) ( not ( = ?auto_138668 ?auto_138669 ) ) ( not ( = ?auto_138668 ?auto_138670 ) ) ( not ( = ?auto_138668 ?auto_138671 ) ) ( not ( = ?auto_138668 ?auto_138672 ) ) ( not ( = ?auto_138668 ?auto_138673 ) ) ( not ( = ?auto_138668 ?auto_138674 ) ) ( not ( = ?auto_138668 ?auto_138675 ) ) ( not ( = ?auto_138668 ?auto_138676 ) ) ( not ( = ?auto_138668 ?auto_138677 ) ) ( not ( = ?auto_138668 ?auto_138678 ) ) ( not ( = ?auto_138669 ?auto_138670 ) ) ( not ( = ?auto_138669 ?auto_138671 ) ) ( not ( = ?auto_138669 ?auto_138672 ) ) ( not ( = ?auto_138669 ?auto_138673 ) ) ( not ( = ?auto_138669 ?auto_138674 ) ) ( not ( = ?auto_138669 ?auto_138675 ) ) ( not ( = ?auto_138669 ?auto_138676 ) ) ( not ( = ?auto_138669 ?auto_138677 ) ) ( not ( = ?auto_138669 ?auto_138678 ) ) ( not ( = ?auto_138670 ?auto_138671 ) ) ( not ( = ?auto_138670 ?auto_138672 ) ) ( not ( = ?auto_138670 ?auto_138673 ) ) ( not ( = ?auto_138670 ?auto_138674 ) ) ( not ( = ?auto_138670 ?auto_138675 ) ) ( not ( = ?auto_138670 ?auto_138676 ) ) ( not ( = ?auto_138670 ?auto_138677 ) ) ( not ( = ?auto_138670 ?auto_138678 ) ) ( not ( = ?auto_138671 ?auto_138672 ) ) ( not ( = ?auto_138671 ?auto_138673 ) ) ( not ( = ?auto_138671 ?auto_138674 ) ) ( not ( = ?auto_138671 ?auto_138675 ) ) ( not ( = ?auto_138671 ?auto_138676 ) ) ( not ( = ?auto_138671 ?auto_138677 ) ) ( not ( = ?auto_138671 ?auto_138678 ) ) ( not ( = ?auto_138672 ?auto_138673 ) ) ( not ( = ?auto_138672 ?auto_138674 ) ) ( not ( = ?auto_138672 ?auto_138675 ) ) ( not ( = ?auto_138672 ?auto_138676 ) ) ( not ( = ?auto_138672 ?auto_138677 ) ) ( not ( = ?auto_138672 ?auto_138678 ) ) ( not ( = ?auto_138673 ?auto_138674 ) ) ( not ( = ?auto_138673 ?auto_138675 ) ) ( not ( = ?auto_138673 ?auto_138676 ) ) ( not ( = ?auto_138673 ?auto_138677 ) ) ( not ( = ?auto_138673 ?auto_138678 ) ) ( not ( = ?auto_138674 ?auto_138675 ) ) ( not ( = ?auto_138674 ?auto_138676 ) ) ( not ( = ?auto_138674 ?auto_138677 ) ) ( not ( = ?auto_138674 ?auto_138678 ) ) ( not ( = ?auto_138675 ?auto_138676 ) ) ( not ( = ?auto_138675 ?auto_138677 ) ) ( not ( = ?auto_138675 ?auto_138678 ) ) ( not ( = ?auto_138676 ?auto_138677 ) ) ( not ( = ?auto_138676 ?auto_138678 ) ) ( not ( = ?auto_138677 ?auto_138678 ) ) ( ON ?auto_138676 ?auto_138677 ) ( ON ?auto_138675 ?auto_138676 ) ( ON ?auto_138674 ?auto_138675 ) ( ON ?auto_138673 ?auto_138674 ) ( ON ?auto_138672 ?auto_138673 ) ( ON ?auto_138671 ?auto_138672 ) ( ON ?auto_138670 ?auto_138671 ) ( CLEAR ?auto_138668 ) ( ON ?auto_138669 ?auto_138670 ) ( CLEAR ?auto_138669 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_138668 ?auto_138669 )
      ( MAKE-10PILE ?auto_138668 ?auto_138669 ?auto_138670 ?auto_138671 ?auto_138672 ?auto_138673 ?auto_138674 ?auto_138675 ?auto_138676 ?auto_138677 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_138710 - BLOCK
      ?auto_138711 - BLOCK
      ?auto_138712 - BLOCK
      ?auto_138713 - BLOCK
      ?auto_138714 - BLOCK
      ?auto_138715 - BLOCK
      ?auto_138716 - BLOCK
      ?auto_138717 - BLOCK
      ?auto_138718 - BLOCK
      ?auto_138719 - BLOCK
    )
    :vars
    (
      ?auto_138720 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_138719 ?auto_138720 ) ( not ( = ?auto_138710 ?auto_138711 ) ) ( not ( = ?auto_138710 ?auto_138712 ) ) ( not ( = ?auto_138710 ?auto_138713 ) ) ( not ( = ?auto_138710 ?auto_138714 ) ) ( not ( = ?auto_138710 ?auto_138715 ) ) ( not ( = ?auto_138710 ?auto_138716 ) ) ( not ( = ?auto_138710 ?auto_138717 ) ) ( not ( = ?auto_138710 ?auto_138718 ) ) ( not ( = ?auto_138710 ?auto_138719 ) ) ( not ( = ?auto_138710 ?auto_138720 ) ) ( not ( = ?auto_138711 ?auto_138712 ) ) ( not ( = ?auto_138711 ?auto_138713 ) ) ( not ( = ?auto_138711 ?auto_138714 ) ) ( not ( = ?auto_138711 ?auto_138715 ) ) ( not ( = ?auto_138711 ?auto_138716 ) ) ( not ( = ?auto_138711 ?auto_138717 ) ) ( not ( = ?auto_138711 ?auto_138718 ) ) ( not ( = ?auto_138711 ?auto_138719 ) ) ( not ( = ?auto_138711 ?auto_138720 ) ) ( not ( = ?auto_138712 ?auto_138713 ) ) ( not ( = ?auto_138712 ?auto_138714 ) ) ( not ( = ?auto_138712 ?auto_138715 ) ) ( not ( = ?auto_138712 ?auto_138716 ) ) ( not ( = ?auto_138712 ?auto_138717 ) ) ( not ( = ?auto_138712 ?auto_138718 ) ) ( not ( = ?auto_138712 ?auto_138719 ) ) ( not ( = ?auto_138712 ?auto_138720 ) ) ( not ( = ?auto_138713 ?auto_138714 ) ) ( not ( = ?auto_138713 ?auto_138715 ) ) ( not ( = ?auto_138713 ?auto_138716 ) ) ( not ( = ?auto_138713 ?auto_138717 ) ) ( not ( = ?auto_138713 ?auto_138718 ) ) ( not ( = ?auto_138713 ?auto_138719 ) ) ( not ( = ?auto_138713 ?auto_138720 ) ) ( not ( = ?auto_138714 ?auto_138715 ) ) ( not ( = ?auto_138714 ?auto_138716 ) ) ( not ( = ?auto_138714 ?auto_138717 ) ) ( not ( = ?auto_138714 ?auto_138718 ) ) ( not ( = ?auto_138714 ?auto_138719 ) ) ( not ( = ?auto_138714 ?auto_138720 ) ) ( not ( = ?auto_138715 ?auto_138716 ) ) ( not ( = ?auto_138715 ?auto_138717 ) ) ( not ( = ?auto_138715 ?auto_138718 ) ) ( not ( = ?auto_138715 ?auto_138719 ) ) ( not ( = ?auto_138715 ?auto_138720 ) ) ( not ( = ?auto_138716 ?auto_138717 ) ) ( not ( = ?auto_138716 ?auto_138718 ) ) ( not ( = ?auto_138716 ?auto_138719 ) ) ( not ( = ?auto_138716 ?auto_138720 ) ) ( not ( = ?auto_138717 ?auto_138718 ) ) ( not ( = ?auto_138717 ?auto_138719 ) ) ( not ( = ?auto_138717 ?auto_138720 ) ) ( not ( = ?auto_138718 ?auto_138719 ) ) ( not ( = ?auto_138718 ?auto_138720 ) ) ( not ( = ?auto_138719 ?auto_138720 ) ) ( ON ?auto_138718 ?auto_138719 ) ( ON ?auto_138717 ?auto_138718 ) ( ON ?auto_138716 ?auto_138717 ) ( ON ?auto_138715 ?auto_138716 ) ( ON ?auto_138714 ?auto_138715 ) ( ON ?auto_138713 ?auto_138714 ) ( ON ?auto_138712 ?auto_138713 ) ( ON ?auto_138711 ?auto_138712 ) ( ON ?auto_138710 ?auto_138711 ) ( CLEAR ?auto_138710 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_138710 )
      ( MAKE-10PILE ?auto_138710 ?auto_138711 ?auto_138712 ?auto_138713 ?auto_138714 ?auto_138715 ?auto_138716 ?auto_138717 ?auto_138718 ?auto_138719 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_138753 - BLOCK
      ?auto_138754 - BLOCK
      ?auto_138755 - BLOCK
      ?auto_138756 - BLOCK
      ?auto_138757 - BLOCK
      ?auto_138758 - BLOCK
      ?auto_138759 - BLOCK
      ?auto_138760 - BLOCK
      ?auto_138761 - BLOCK
      ?auto_138762 - BLOCK
      ?auto_138763 - BLOCK
    )
    :vars
    (
      ?auto_138764 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_138762 ) ( ON ?auto_138763 ?auto_138764 ) ( CLEAR ?auto_138763 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_138753 ) ( ON ?auto_138754 ?auto_138753 ) ( ON ?auto_138755 ?auto_138754 ) ( ON ?auto_138756 ?auto_138755 ) ( ON ?auto_138757 ?auto_138756 ) ( ON ?auto_138758 ?auto_138757 ) ( ON ?auto_138759 ?auto_138758 ) ( ON ?auto_138760 ?auto_138759 ) ( ON ?auto_138761 ?auto_138760 ) ( ON ?auto_138762 ?auto_138761 ) ( not ( = ?auto_138753 ?auto_138754 ) ) ( not ( = ?auto_138753 ?auto_138755 ) ) ( not ( = ?auto_138753 ?auto_138756 ) ) ( not ( = ?auto_138753 ?auto_138757 ) ) ( not ( = ?auto_138753 ?auto_138758 ) ) ( not ( = ?auto_138753 ?auto_138759 ) ) ( not ( = ?auto_138753 ?auto_138760 ) ) ( not ( = ?auto_138753 ?auto_138761 ) ) ( not ( = ?auto_138753 ?auto_138762 ) ) ( not ( = ?auto_138753 ?auto_138763 ) ) ( not ( = ?auto_138753 ?auto_138764 ) ) ( not ( = ?auto_138754 ?auto_138755 ) ) ( not ( = ?auto_138754 ?auto_138756 ) ) ( not ( = ?auto_138754 ?auto_138757 ) ) ( not ( = ?auto_138754 ?auto_138758 ) ) ( not ( = ?auto_138754 ?auto_138759 ) ) ( not ( = ?auto_138754 ?auto_138760 ) ) ( not ( = ?auto_138754 ?auto_138761 ) ) ( not ( = ?auto_138754 ?auto_138762 ) ) ( not ( = ?auto_138754 ?auto_138763 ) ) ( not ( = ?auto_138754 ?auto_138764 ) ) ( not ( = ?auto_138755 ?auto_138756 ) ) ( not ( = ?auto_138755 ?auto_138757 ) ) ( not ( = ?auto_138755 ?auto_138758 ) ) ( not ( = ?auto_138755 ?auto_138759 ) ) ( not ( = ?auto_138755 ?auto_138760 ) ) ( not ( = ?auto_138755 ?auto_138761 ) ) ( not ( = ?auto_138755 ?auto_138762 ) ) ( not ( = ?auto_138755 ?auto_138763 ) ) ( not ( = ?auto_138755 ?auto_138764 ) ) ( not ( = ?auto_138756 ?auto_138757 ) ) ( not ( = ?auto_138756 ?auto_138758 ) ) ( not ( = ?auto_138756 ?auto_138759 ) ) ( not ( = ?auto_138756 ?auto_138760 ) ) ( not ( = ?auto_138756 ?auto_138761 ) ) ( not ( = ?auto_138756 ?auto_138762 ) ) ( not ( = ?auto_138756 ?auto_138763 ) ) ( not ( = ?auto_138756 ?auto_138764 ) ) ( not ( = ?auto_138757 ?auto_138758 ) ) ( not ( = ?auto_138757 ?auto_138759 ) ) ( not ( = ?auto_138757 ?auto_138760 ) ) ( not ( = ?auto_138757 ?auto_138761 ) ) ( not ( = ?auto_138757 ?auto_138762 ) ) ( not ( = ?auto_138757 ?auto_138763 ) ) ( not ( = ?auto_138757 ?auto_138764 ) ) ( not ( = ?auto_138758 ?auto_138759 ) ) ( not ( = ?auto_138758 ?auto_138760 ) ) ( not ( = ?auto_138758 ?auto_138761 ) ) ( not ( = ?auto_138758 ?auto_138762 ) ) ( not ( = ?auto_138758 ?auto_138763 ) ) ( not ( = ?auto_138758 ?auto_138764 ) ) ( not ( = ?auto_138759 ?auto_138760 ) ) ( not ( = ?auto_138759 ?auto_138761 ) ) ( not ( = ?auto_138759 ?auto_138762 ) ) ( not ( = ?auto_138759 ?auto_138763 ) ) ( not ( = ?auto_138759 ?auto_138764 ) ) ( not ( = ?auto_138760 ?auto_138761 ) ) ( not ( = ?auto_138760 ?auto_138762 ) ) ( not ( = ?auto_138760 ?auto_138763 ) ) ( not ( = ?auto_138760 ?auto_138764 ) ) ( not ( = ?auto_138761 ?auto_138762 ) ) ( not ( = ?auto_138761 ?auto_138763 ) ) ( not ( = ?auto_138761 ?auto_138764 ) ) ( not ( = ?auto_138762 ?auto_138763 ) ) ( not ( = ?auto_138762 ?auto_138764 ) ) ( not ( = ?auto_138763 ?auto_138764 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_138763 ?auto_138764 )
      ( !STACK ?auto_138763 ?auto_138762 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_138776 - BLOCK
      ?auto_138777 - BLOCK
      ?auto_138778 - BLOCK
      ?auto_138779 - BLOCK
      ?auto_138780 - BLOCK
      ?auto_138781 - BLOCK
      ?auto_138782 - BLOCK
      ?auto_138783 - BLOCK
      ?auto_138784 - BLOCK
      ?auto_138785 - BLOCK
      ?auto_138786 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_138785 ) ( ON-TABLE ?auto_138786 ) ( CLEAR ?auto_138786 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_138776 ) ( ON ?auto_138777 ?auto_138776 ) ( ON ?auto_138778 ?auto_138777 ) ( ON ?auto_138779 ?auto_138778 ) ( ON ?auto_138780 ?auto_138779 ) ( ON ?auto_138781 ?auto_138780 ) ( ON ?auto_138782 ?auto_138781 ) ( ON ?auto_138783 ?auto_138782 ) ( ON ?auto_138784 ?auto_138783 ) ( ON ?auto_138785 ?auto_138784 ) ( not ( = ?auto_138776 ?auto_138777 ) ) ( not ( = ?auto_138776 ?auto_138778 ) ) ( not ( = ?auto_138776 ?auto_138779 ) ) ( not ( = ?auto_138776 ?auto_138780 ) ) ( not ( = ?auto_138776 ?auto_138781 ) ) ( not ( = ?auto_138776 ?auto_138782 ) ) ( not ( = ?auto_138776 ?auto_138783 ) ) ( not ( = ?auto_138776 ?auto_138784 ) ) ( not ( = ?auto_138776 ?auto_138785 ) ) ( not ( = ?auto_138776 ?auto_138786 ) ) ( not ( = ?auto_138777 ?auto_138778 ) ) ( not ( = ?auto_138777 ?auto_138779 ) ) ( not ( = ?auto_138777 ?auto_138780 ) ) ( not ( = ?auto_138777 ?auto_138781 ) ) ( not ( = ?auto_138777 ?auto_138782 ) ) ( not ( = ?auto_138777 ?auto_138783 ) ) ( not ( = ?auto_138777 ?auto_138784 ) ) ( not ( = ?auto_138777 ?auto_138785 ) ) ( not ( = ?auto_138777 ?auto_138786 ) ) ( not ( = ?auto_138778 ?auto_138779 ) ) ( not ( = ?auto_138778 ?auto_138780 ) ) ( not ( = ?auto_138778 ?auto_138781 ) ) ( not ( = ?auto_138778 ?auto_138782 ) ) ( not ( = ?auto_138778 ?auto_138783 ) ) ( not ( = ?auto_138778 ?auto_138784 ) ) ( not ( = ?auto_138778 ?auto_138785 ) ) ( not ( = ?auto_138778 ?auto_138786 ) ) ( not ( = ?auto_138779 ?auto_138780 ) ) ( not ( = ?auto_138779 ?auto_138781 ) ) ( not ( = ?auto_138779 ?auto_138782 ) ) ( not ( = ?auto_138779 ?auto_138783 ) ) ( not ( = ?auto_138779 ?auto_138784 ) ) ( not ( = ?auto_138779 ?auto_138785 ) ) ( not ( = ?auto_138779 ?auto_138786 ) ) ( not ( = ?auto_138780 ?auto_138781 ) ) ( not ( = ?auto_138780 ?auto_138782 ) ) ( not ( = ?auto_138780 ?auto_138783 ) ) ( not ( = ?auto_138780 ?auto_138784 ) ) ( not ( = ?auto_138780 ?auto_138785 ) ) ( not ( = ?auto_138780 ?auto_138786 ) ) ( not ( = ?auto_138781 ?auto_138782 ) ) ( not ( = ?auto_138781 ?auto_138783 ) ) ( not ( = ?auto_138781 ?auto_138784 ) ) ( not ( = ?auto_138781 ?auto_138785 ) ) ( not ( = ?auto_138781 ?auto_138786 ) ) ( not ( = ?auto_138782 ?auto_138783 ) ) ( not ( = ?auto_138782 ?auto_138784 ) ) ( not ( = ?auto_138782 ?auto_138785 ) ) ( not ( = ?auto_138782 ?auto_138786 ) ) ( not ( = ?auto_138783 ?auto_138784 ) ) ( not ( = ?auto_138783 ?auto_138785 ) ) ( not ( = ?auto_138783 ?auto_138786 ) ) ( not ( = ?auto_138784 ?auto_138785 ) ) ( not ( = ?auto_138784 ?auto_138786 ) ) ( not ( = ?auto_138785 ?auto_138786 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_138786 )
      ( !STACK ?auto_138786 ?auto_138785 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_138798 - BLOCK
      ?auto_138799 - BLOCK
      ?auto_138800 - BLOCK
      ?auto_138801 - BLOCK
      ?auto_138802 - BLOCK
      ?auto_138803 - BLOCK
      ?auto_138804 - BLOCK
      ?auto_138805 - BLOCK
      ?auto_138806 - BLOCK
      ?auto_138807 - BLOCK
      ?auto_138808 - BLOCK
    )
    :vars
    (
      ?auto_138809 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_138808 ?auto_138809 ) ( ON-TABLE ?auto_138798 ) ( ON ?auto_138799 ?auto_138798 ) ( ON ?auto_138800 ?auto_138799 ) ( ON ?auto_138801 ?auto_138800 ) ( ON ?auto_138802 ?auto_138801 ) ( ON ?auto_138803 ?auto_138802 ) ( ON ?auto_138804 ?auto_138803 ) ( ON ?auto_138805 ?auto_138804 ) ( ON ?auto_138806 ?auto_138805 ) ( not ( = ?auto_138798 ?auto_138799 ) ) ( not ( = ?auto_138798 ?auto_138800 ) ) ( not ( = ?auto_138798 ?auto_138801 ) ) ( not ( = ?auto_138798 ?auto_138802 ) ) ( not ( = ?auto_138798 ?auto_138803 ) ) ( not ( = ?auto_138798 ?auto_138804 ) ) ( not ( = ?auto_138798 ?auto_138805 ) ) ( not ( = ?auto_138798 ?auto_138806 ) ) ( not ( = ?auto_138798 ?auto_138807 ) ) ( not ( = ?auto_138798 ?auto_138808 ) ) ( not ( = ?auto_138798 ?auto_138809 ) ) ( not ( = ?auto_138799 ?auto_138800 ) ) ( not ( = ?auto_138799 ?auto_138801 ) ) ( not ( = ?auto_138799 ?auto_138802 ) ) ( not ( = ?auto_138799 ?auto_138803 ) ) ( not ( = ?auto_138799 ?auto_138804 ) ) ( not ( = ?auto_138799 ?auto_138805 ) ) ( not ( = ?auto_138799 ?auto_138806 ) ) ( not ( = ?auto_138799 ?auto_138807 ) ) ( not ( = ?auto_138799 ?auto_138808 ) ) ( not ( = ?auto_138799 ?auto_138809 ) ) ( not ( = ?auto_138800 ?auto_138801 ) ) ( not ( = ?auto_138800 ?auto_138802 ) ) ( not ( = ?auto_138800 ?auto_138803 ) ) ( not ( = ?auto_138800 ?auto_138804 ) ) ( not ( = ?auto_138800 ?auto_138805 ) ) ( not ( = ?auto_138800 ?auto_138806 ) ) ( not ( = ?auto_138800 ?auto_138807 ) ) ( not ( = ?auto_138800 ?auto_138808 ) ) ( not ( = ?auto_138800 ?auto_138809 ) ) ( not ( = ?auto_138801 ?auto_138802 ) ) ( not ( = ?auto_138801 ?auto_138803 ) ) ( not ( = ?auto_138801 ?auto_138804 ) ) ( not ( = ?auto_138801 ?auto_138805 ) ) ( not ( = ?auto_138801 ?auto_138806 ) ) ( not ( = ?auto_138801 ?auto_138807 ) ) ( not ( = ?auto_138801 ?auto_138808 ) ) ( not ( = ?auto_138801 ?auto_138809 ) ) ( not ( = ?auto_138802 ?auto_138803 ) ) ( not ( = ?auto_138802 ?auto_138804 ) ) ( not ( = ?auto_138802 ?auto_138805 ) ) ( not ( = ?auto_138802 ?auto_138806 ) ) ( not ( = ?auto_138802 ?auto_138807 ) ) ( not ( = ?auto_138802 ?auto_138808 ) ) ( not ( = ?auto_138802 ?auto_138809 ) ) ( not ( = ?auto_138803 ?auto_138804 ) ) ( not ( = ?auto_138803 ?auto_138805 ) ) ( not ( = ?auto_138803 ?auto_138806 ) ) ( not ( = ?auto_138803 ?auto_138807 ) ) ( not ( = ?auto_138803 ?auto_138808 ) ) ( not ( = ?auto_138803 ?auto_138809 ) ) ( not ( = ?auto_138804 ?auto_138805 ) ) ( not ( = ?auto_138804 ?auto_138806 ) ) ( not ( = ?auto_138804 ?auto_138807 ) ) ( not ( = ?auto_138804 ?auto_138808 ) ) ( not ( = ?auto_138804 ?auto_138809 ) ) ( not ( = ?auto_138805 ?auto_138806 ) ) ( not ( = ?auto_138805 ?auto_138807 ) ) ( not ( = ?auto_138805 ?auto_138808 ) ) ( not ( = ?auto_138805 ?auto_138809 ) ) ( not ( = ?auto_138806 ?auto_138807 ) ) ( not ( = ?auto_138806 ?auto_138808 ) ) ( not ( = ?auto_138806 ?auto_138809 ) ) ( not ( = ?auto_138807 ?auto_138808 ) ) ( not ( = ?auto_138807 ?auto_138809 ) ) ( not ( = ?auto_138808 ?auto_138809 ) ) ( CLEAR ?auto_138806 ) ( ON ?auto_138807 ?auto_138808 ) ( CLEAR ?auto_138807 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_138798 ?auto_138799 ?auto_138800 ?auto_138801 ?auto_138802 ?auto_138803 ?auto_138804 ?auto_138805 ?auto_138806 ?auto_138807 )
      ( MAKE-11PILE ?auto_138798 ?auto_138799 ?auto_138800 ?auto_138801 ?auto_138802 ?auto_138803 ?auto_138804 ?auto_138805 ?auto_138806 ?auto_138807 ?auto_138808 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_138821 - BLOCK
      ?auto_138822 - BLOCK
      ?auto_138823 - BLOCK
      ?auto_138824 - BLOCK
      ?auto_138825 - BLOCK
      ?auto_138826 - BLOCK
      ?auto_138827 - BLOCK
      ?auto_138828 - BLOCK
      ?auto_138829 - BLOCK
      ?auto_138830 - BLOCK
      ?auto_138831 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_138831 ) ( ON-TABLE ?auto_138821 ) ( ON ?auto_138822 ?auto_138821 ) ( ON ?auto_138823 ?auto_138822 ) ( ON ?auto_138824 ?auto_138823 ) ( ON ?auto_138825 ?auto_138824 ) ( ON ?auto_138826 ?auto_138825 ) ( ON ?auto_138827 ?auto_138826 ) ( ON ?auto_138828 ?auto_138827 ) ( ON ?auto_138829 ?auto_138828 ) ( not ( = ?auto_138821 ?auto_138822 ) ) ( not ( = ?auto_138821 ?auto_138823 ) ) ( not ( = ?auto_138821 ?auto_138824 ) ) ( not ( = ?auto_138821 ?auto_138825 ) ) ( not ( = ?auto_138821 ?auto_138826 ) ) ( not ( = ?auto_138821 ?auto_138827 ) ) ( not ( = ?auto_138821 ?auto_138828 ) ) ( not ( = ?auto_138821 ?auto_138829 ) ) ( not ( = ?auto_138821 ?auto_138830 ) ) ( not ( = ?auto_138821 ?auto_138831 ) ) ( not ( = ?auto_138822 ?auto_138823 ) ) ( not ( = ?auto_138822 ?auto_138824 ) ) ( not ( = ?auto_138822 ?auto_138825 ) ) ( not ( = ?auto_138822 ?auto_138826 ) ) ( not ( = ?auto_138822 ?auto_138827 ) ) ( not ( = ?auto_138822 ?auto_138828 ) ) ( not ( = ?auto_138822 ?auto_138829 ) ) ( not ( = ?auto_138822 ?auto_138830 ) ) ( not ( = ?auto_138822 ?auto_138831 ) ) ( not ( = ?auto_138823 ?auto_138824 ) ) ( not ( = ?auto_138823 ?auto_138825 ) ) ( not ( = ?auto_138823 ?auto_138826 ) ) ( not ( = ?auto_138823 ?auto_138827 ) ) ( not ( = ?auto_138823 ?auto_138828 ) ) ( not ( = ?auto_138823 ?auto_138829 ) ) ( not ( = ?auto_138823 ?auto_138830 ) ) ( not ( = ?auto_138823 ?auto_138831 ) ) ( not ( = ?auto_138824 ?auto_138825 ) ) ( not ( = ?auto_138824 ?auto_138826 ) ) ( not ( = ?auto_138824 ?auto_138827 ) ) ( not ( = ?auto_138824 ?auto_138828 ) ) ( not ( = ?auto_138824 ?auto_138829 ) ) ( not ( = ?auto_138824 ?auto_138830 ) ) ( not ( = ?auto_138824 ?auto_138831 ) ) ( not ( = ?auto_138825 ?auto_138826 ) ) ( not ( = ?auto_138825 ?auto_138827 ) ) ( not ( = ?auto_138825 ?auto_138828 ) ) ( not ( = ?auto_138825 ?auto_138829 ) ) ( not ( = ?auto_138825 ?auto_138830 ) ) ( not ( = ?auto_138825 ?auto_138831 ) ) ( not ( = ?auto_138826 ?auto_138827 ) ) ( not ( = ?auto_138826 ?auto_138828 ) ) ( not ( = ?auto_138826 ?auto_138829 ) ) ( not ( = ?auto_138826 ?auto_138830 ) ) ( not ( = ?auto_138826 ?auto_138831 ) ) ( not ( = ?auto_138827 ?auto_138828 ) ) ( not ( = ?auto_138827 ?auto_138829 ) ) ( not ( = ?auto_138827 ?auto_138830 ) ) ( not ( = ?auto_138827 ?auto_138831 ) ) ( not ( = ?auto_138828 ?auto_138829 ) ) ( not ( = ?auto_138828 ?auto_138830 ) ) ( not ( = ?auto_138828 ?auto_138831 ) ) ( not ( = ?auto_138829 ?auto_138830 ) ) ( not ( = ?auto_138829 ?auto_138831 ) ) ( not ( = ?auto_138830 ?auto_138831 ) ) ( CLEAR ?auto_138829 ) ( ON ?auto_138830 ?auto_138831 ) ( CLEAR ?auto_138830 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_138821 ?auto_138822 ?auto_138823 ?auto_138824 ?auto_138825 ?auto_138826 ?auto_138827 ?auto_138828 ?auto_138829 ?auto_138830 )
      ( MAKE-11PILE ?auto_138821 ?auto_138822 ?auto_138823 ?auto_138824 ?auto_138825 ?auto_138826 ?auto_138827 ?auto_138828 ?auto_138829 ?auto_138830 ?auto_138831 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_138843 - BLOCK
      ?auto_138844 - BLOCK
      ?auto_138845 - BLOCK
      ?auto_138846 - BLOCK
      ?auto_138847 - BLOCK
      ?auto_138848 - BLOCK
      ?auto_138849 - BLOCK
      ?auto_138850 - BLOCK
      ?auto_138851 - BLOCK
      ?auto_138852 - BLOCK
      ?auto_138853 - BLOCK
    )
    :vars
    (
      ?auto_138854 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_138853 ?auto_138854 ) ( ON-TABLE ?auto_138843 ) ( ON ?auto_138844 ?auto_138843 ) ( ON ?auto_138845 ?auto_138844 ) ( ON ?auto_138846 ?auto_138845 ) ( ON ?auto_138847 ?auto_138846 ) ( ON ?auto_138848 ?auto_138847 ) ( ON ?auto_138849 ?auto_138848 ) ( ON ?auto_138850 ?auto_138849 ) ( not ( = ?auto_138843 ?auto_138844 ) ) ( not ( = ?auto_138843 ?auto_138845 ) ) ( not ( = ?auto_138843 ?auto_138846 ) ) ( not ( = ?auto_138843 ?auto_138847 ) ) ( not ( = ?auto_138843 ?auto_138848 ) ) ( not ( = ?auto_138843 ?auto_138849 ) ) ( not ( = ?auto_138843 ?auto_138850 ) ) ( not ( = ?auto_138843 ?auto_138851 ) ) ( not ( = ?auto_138843 ?auto_138852 ) ) ( not ( = ?auto_138843 ?auto_138853 ) ) ( not ( = ?auto_138843 ?auto_138854 ) ) ( not ( = ?auto_138844 ?auto_138845 ) ) ( not ( = ?auto_138844 ?auto_138846 ) ) ( not ( = ?auto_138844 ?auto_138847 ) ) ( not ( = ?auto_138844 ?auto_138848 ) ) ( not ( = ?auto_138844 ?auto_138849 ) ) ( not ( = ?auto_138844 ?auto_138850 ) ) ( not ( = ?auto_138844 ?auto_138851 ) ) ( not ( = ?auto_138844 ?auto_138852 ) ) ( not ( = ?auto_138844 ?auto_138853 ) ) ( not ( = ?auto_138844 ?auto_138854 ) ) ( not ( = ?auto_138845 ?auto_138846 ) ) ( not ( = ?auto_138845 ?auto_138847 ) ) ( not ( = ?auto_138845 ?auto_138848 ) ) ( not ( = ?auto_138845 ?auto_138849 ) ) ( not ( = ?auto_138845 ?auto_138850 ) ) ( not ( = ?auto_138845 ?auto_138851 ) ) ( not ( = ?auto_138845 ?auto_138852 ) ) ( not ( = ?auto_138845 ?auto_138853 ) ) ( not ( = ?auto_138845 ?auto_138854 ) ) ( not ( = ?auto_138846 ?auto_138847 ) ) ( not ( = ?auto_138846 ?auto_138848 ) ) ( not ( = ?auto_138846 ?auto_138849 ) ) ( not ( = ?auto_138846 ?auto_138850 ) ) ( not ( = ?auto_138846 ?auto_138851 ) ) ( not ( = ?auto_138846 ?auto_138852 ) ) ( not ( = ?auto_138846 ?auto_138853 ) ) ( not ( = ?auto_138846 ?auto_138854 ) ) ( not ( = ?auto_138847 ?auto_138848 ) ) ( not ( = ?auto_138847 ?auto_138849 ) ) ( not ( = ?auto_138847 ?auto_138850 ) ) ( not ( = ?auto_138847 ?auto_138851 ) ) ( not ( = ?auto_138847 ?auto_138852 ) ) ( not ( = ?auto_138847 ?auto_138853 ) ) ( not ( = ?auto_138847 ?auto_138854 ) ) ( not ( = ?auto_138848 ?auto_138849 ) ) ( not ( = ?auto_138848 ?auto_138850 ) ) ( not ( = ?auto_138848 ?auto_138851 ) ) ( not ( = ?auto_138848 ?auto_138852 ) ) ( not ( = ?auto_138848 ?auto_138853 ) ) ( not ( = ?auto_138848 ?auto_138854 ) ) ( not ( = ?auto_138849 ?auto_138850 ) ) ( not ( = ?auto_138849 ?auto_138851 ) ) ( not ( = ?auto_138849 ?auto_138852 ) ) ( not ( = ?auto_138849 ?auto_138853 ) ) ( not ( = ?auto_138849 ?auto_138854 ) ) ( not ( = ?auto_138850 ?auto_138851 ) ) ( not ( = ?auto_138850 ?auto_138852 ) ) ( not ( = ?auto_138850 ?auto_138853 ) ) ( not ( = ?auto_138850 ?auto_138854 ) ) ( not ( = ?auto_138851 ?auto_138852 ) ) ( not ( = ?auto_138851 ?auto_138853 ) ) ( not ( = ?auto_138851 ?auto_138854 ) ) ( not ( = ?auto_138852 ?auto_138853 ) ) ( not ( = ?auto_138852 ?auto_138854 ) ) ( not ( = ?auto_138853 ?auto_138854 ) ) ( ON ?auto_138852 ?auto_138853 ) ( CLEAR ?auto_138850 ) ( ON ?auto_138851 ?auto_138852 ) ( CLEAR ?auto_138851 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_138843 ?auto_138844 ?auto_138845 ?auto_138846 ?auto_138847 ?auto_138848 ?auto_138849 ?auto_138850 ?auto_138851 )
      ( MAKE-11PILE ?auto_138843 ?auto_138844 ?auto_138845 ?auto_138846 ?auto_138847 ?auto_138848 ?auto_138849 ?auto_138850 ?auto_138851 ?auto_138852 ?auto_138853 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_138866 - BLOCK
      ?auto_138867 - BLOCK
      ?auto_138868 - BLOCK
      ?auto_138869 - BLOCK
      ?auto_138870 - BLOCK
      ?auto_138871 - BLOCK
      ?auto_138872 - BLOCK
      ?auto_138873 - BLOCK
      ?auto_138874 - BLOCK
      ?auto_138875 - BLOCK
      ?auto_138876 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_138876 ) ( ON-TABLE ?auto_138866 ) ( ON ?auto_138867 ?auto_138866 ) ( ON ?auto_138868 ?auto_138867 ) ( ON ?auto_138869 ?auto_138868 ) ( ON ?auto_138870 ?auto_138869 ) ( ON ?auto_138871 ?auto_138870 ) ( ON ?auto_138872 ?auto_138871 ) ( ON ?auto_138873 ?auto_138872 ) ( not ( = ?auto_138866 ?auto_138867 ) ) ( not ( = ?auto_138866 ?auto_138868 ) ) ( not ( = ?auto_138866 ?auto_138869 ) ) ( not ( = ?auto_138866 ?auto_138870 ) ) ( not ( = ?auto_138866 ?auto_138871 ) ) ( not ( = ?auto_138866 ?auto_138872 ) ) ( not ( = ?auto_138866 ?auto_138873 ) ) ( not ( = ?auto_138866 ?auto_138874 ) ) ( not ( = ?auto_138866 ?auto_138875 ) ) ( not ( = ?auto_138866 ?auto_138876 ) ) ( not ( = ?auto_138867 ?auto_138868 ) ) ( not ( = ?auto_138867 ?auto_138869 ) ) ( not ( = ?auto_138867 ?auto_138870 ) ) ( not ( = ?auto_138867 ?auto_138871 ) ) ( not ( = ?auto_138867 ?auto_138872 ) ) ( not ( = ?auto_138867 ?auto_138873 ) ) ( not ( = ?auto_138867 ?auto_138874 ) ) ( not ( = ?auto_138867 ?auto_138875 ) ) ( not ( = ?auto_138867 ?auto_138876 ) ) ( not ( = ?auto_138868 ?auto_138869 ) ) ( not ( = ?auto_138868 ?auto_138870 ) ) ( not ( = ?auto_138868 ?auto_138871 ) ) ( not ( = ?auto_138868 ?auto_138872 ) ) ( not ( = ?auto_138868 ?auto_138873 ) ) ( not ( = ?auto_138868 ?auto_138874 ) ) ( not ( = ?auto_138868 ?auto_138875 ) ) ( not ( = ?auto_138868 ?auto_138876 ) ) ( not ( = ?auto_138869 ?auto_138870 ) ) ( not ( = ?auto_138869 ?auto_138871 ) ) ( not ( = ?auto_138869 ?auto_138872 ) ) ( not ( = ?auto_138869 ?auto_138873 ) ) ( not ( = ?auto_138869 ?auto_138874 ) ) ( not ( = ?auto_138869 ?auto_138875 ) ) ( not ( = ?auto_138869 ?auto_138876 ) ) ( not ( = ?auto_138870 ?auto_138871 ) ) ( not ( = ?auto_138870 ?auto_138872 ) ) ( not ( = ?auto_138870 ?auto_138873 ) ) ( not ( = ?auto_138870 ?auto_138874 ) ) ( not ( = ?auto_138870 ?auto_138875 ) ) ( not ( = ?auto_138870 ?auto_138876 ) ) ( not ( = ?auto_138871 ?auto_138872 ) ) ( not ( = ?auto_138871 ?auto_138873 ) ) ( not ( = ?auto_138871 ?auto_138874 ) ) ( not ( = ?auto_138871 ?auto_138875 ) ) ( not ( = ?auto_138871 ?auto_138876 ) ) ( not ( = ?auto_138872 ?auto_138873 ) ) ( not ( = ?auto_138872 ?auto_138874 ) ) ( not ( = ?auto_138872 ?auto_138875 ) ) ( not ( = ?auto_138872 ?auto_138876 ) ) ( not ( = ?auto_138873 ?auto_138874 ) ) ( not ( = ?auto_138873 ?auto_138875 ) ) ( not ( = ?auto_138873 ?auto_138876 ) ) ( not ( = ?auto_138874 ?auto_138875 ) ) ( not ( = ?auto_138874 ?auto_138876 ) ) ( not ( = ?auto_138875 ?auto_138876 ) ) ( ON ?auto_138875 ?auto_138876 ) ( CLEAR ?auto_138873 ) ( ON ?auto_138874 ?auto_138875 ) ( CLEAR ?auto_138874 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_138866 ?auto_138867 ?auto_138868 ?auto_138869 ?auto_138870 ?auto_138871 ?auto_138872 ?auto_138873 ?auto_138874 )
      ( MAKE-11PILE ?auto_138866 ?auto_138867 ?auto_138868 ?auto_138869 ?auto_138870 ?auto_138871 ?auto_138872 ?auto_138873 ?auto_138874 ?auto_138875 ?auto_138876 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_138888 - BLOCK
      ?auto_138889 - BLOCK
      ?auto_138890 - BLOCK
      ?auto_138891 - BLOCK
      ?auto_138892 - BLOCK
      ?auto_138893 - BLOCK
      ?auto_138894 - BLOCK
      ?auto_138895 - BLOCK
      ?auto_138896 - BLOCK
      ?auto_138897 - BLOCK
      ?auto_138898 - BLOCK
    )
    :vars
    (
      ?auto_138899 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_138898 ?auto_138899 ) ( ON-TABLE ?auto_138888 ) ( ON ?auto_138889 ?auto_138888 ) ( ON ?auto_138890 ?auto_138889 ) ( ON ?auto_138891 ?auto_138890 ) ( ON ?auto_138892 ?auto_138891 ) ( ON ?auto_138893 ?auto_138892 ) ( ON ?auto_138894 ?auto_138893 ) ( not ( = ?auto_138888 ?auto_138889 ) ) ( not ( = ?auto_138888 ?auto_138890 ) ) ( not ( = ?auto_138888 ?auto_138891 ) ) ( not ( = ?auto_138888 ?auto_138892 ) ) ( not ( = ?auto_138888 ?auto_138893 ) ) ( not ( = ?auto_138888 ?auto_138894 ) ) ( not ( = ?auto_138888 ?auto_138895 ) ) ( not ( = ?auto_138888 ?auto_138896 ) ) ( not ( = ?auto_138888 ?auto_138897 ) ) ( not ( = ?auto_138888 ?auto_138898 ) ) ( not ( = ?auto_138888 ?auto_138899 ) ) ( not ( = ?auto_138889 ?auto_138890 ) ) ( not ( = ?auto_138889 ?auto_138891 ) ) ( not ( = ?auto_138889 ?auto_138892 ) ) ( not ( = ?auto_138889 ?auto_138893 ) ) ( not ( = ?auto_138889 ?auto_138894 ) ) ( not ( = ?auto_138889 ?auto_138895 ) ) ( not ( = ?auto_138889 ?auto_138896 ) ) ( not ( = ?auto_138889 ?auto_138897 ) ) ( not ( = ?auto_138889 ?auto_138898 ) ) ( not ( = ?auto_138889 ?auto_138899 ) ) ( not ( = ?auto_138890 ?auto_138891 ) ) ( not ( = ?auto_138890 ?auto_138892 ) ) ( not ( = ?auto_138890 ?auto_138893 ) ) ( not ( = ?auto_138890 ?auto_138894 ) ) ( not ( = ?auto_138890 ?auto_138895 ) ) ( not ( = ?auto_138890 ?auto_138896 ) ) ( not ( = ?auto_138890 ?auto_138897 ) ) ( not ( = ?auto_138890 ?auto_138898 ) ) ( not ( = ?auto_138890 ?auto_138899 ) ) ( not ( = ?auto_138891 ?auto_138892 ) ) ( not ( = ?auto_138891 ?auto_138893 ) ) ( not ( = ?auto_138891 ?auto_138894 ) ) ( not ( = ?auto_138891 ?auto_138895 ) ) ( not ( = ?auto_138891 ?auto_138896 ) ) ( not ( = ?auto_138891 ?auto_138897 ) ) ( not ( = ?auto_138891 ?auto_138898 ) ) ( not ( = ?auto_138891 ?auto_138899 ) ) ( not ( = ?auto_138892 ?auto_138893 ) ) ( not ( = ?auto_138892 ?auto_138894 ) ) ( not ( = ?auto_138892 ?auto_138895 ) ) ( not ( = ?auto_138892 ?auto_138896 ) ) ( not ( = ?auto_138892 ?auto_138897 ) ) ( not ( = ?auto_138892 ?auto_138898 ) ) ( not ( = ?auto_138892 ?auto_138899 ) ) ( not ( = ?auto_138893 ?auto_138894 ) ) ( not ( = ?auto_138893 ?auto_138895 ) ) ( not ( = ?auto_138893 ?auto_138896 ) ) ( not ( = ?auto_138893 ?auto_138897 ) ) ( not ( = ?auto_138893 ?auto_138898 ) ) ( not ( = ?auto_138893 ?auto_138899 ) ) ( not ( = ?auto_138894 ?auto_138895 ) ) ( not ( = ?auto_138894 ?auto_138896 ) ) ( not ( = ?auto_138894 ?auto_138897 ) ) ( not ( = ?auto_138894 ?auto_138898 ) ) ( not ( = ?auto_138894 ?auto_138899 ) ) ( not ( = ?auto_138895 ?auto_138896 ) ) ( not ( = ?auto_138895 ?auto_138897 ) ) ( not ( = ?auto_138895 ?auto_138898 ) ) ( not ( = ?auto_138895 ?auto_138899 ) ) ( not ( = ?auto_138896 ?auto_138897 ) ) ( not ( = ?auto_138896 ?auto_138898 ) ) ( not ( = ?auto_138896 ?auto_138899 ) ) ( not ( = ?auto_138897 ?auto_138898 ) ) ( not ( = ?auto_138897 ?auto_138899 ) ) ( not ( = ?auto_138898 ?auto_138899 ) ) ( ON ?auto_138897 ?auto_138898 ) ( ON ?auto_138896 ?auto_138897 ) ( CLEAR ?auto_138894 ) ( ON ?auto_138895 ?auto_138896 ) ( CLEAR ?auto_138895 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_138888 ?auto_138889 ?auto_138890 ?auto_138891 ?auto_138892 ?auto_138893 ?auto_138894 ?auto_138895 )
      ( MAKE-11PILE ?auto_138888 ?auto_138889 ?auto_138890 ?auto_138891 ?auto_138892 ?auto_138893 ?auto_138894 ?auto_138895 ?auto_138896 ?auto_138897 ?auto_138898 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_138911 - BLOCK
      ?auto_138912 - BLOCK
      ?auto_138913 - BLOCK
      ?auto_138914 - BLOCK
      ?auto_138915 - BLOCK
      ?auto_138916 - BLOCK
      ?auto_138917 - BLOCK
      ?auto_138918 - BLOCK
      ?auto_138919 - BLOCK
      ?auto_138920 - BLOCK
      ?auto_138921 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_138921 ) ( ON-TABLE ?auto_138911 ) ( ON ?auto_138912 ?auto_138911 ) ( ON ?auto_138913 ?auto_138912 ) ( ON ?auto_138914 ?auto_138913 ) ( ON ?auto_138915 ?auto_138914 ) ( ON ?auto_138916 ?auto_138915 ) ( ON ?auto_138917 ?auto_138916 ) ( not ( = ?auto_138911 ?auto_138912 ) ) ( not ( = ?auto_138911 ?auto_138913 ) ) ( not ( = ?auto_138911 ?auto_138914 ) ) ( not ( = ?auto_138911 ?auto_138915 ) ) ( not ( = ?auto_138911 ?auto_138916 ) ) ( not ( = ?auto_138911 ?auto_138917 ) ) ( not ( = ?auto_138911 ?auto_138918 ) ) ( not ( = ?auto_138911 ?auto_138919 ) ) ( not ( = ?auto_138911 ?auto_138920 ) ) ( not ( = ?auto_138911 ?auto_138921 ) ) ( not ( = ?auto_138912 ?auto_138913 ) ) ( not ( = ?auto_138912 ?auto_138914 ) ) ( not ( = ?auto_138912 ?auto_138915 ) ) ( not ( = ?auto_138912 ?auto_138916 ) ) ( not ( = ?auto_138912 ?auto_138917 ) ) ( not ( = ?auto_138912 ?auto_138918 ) ) ( not ( = ?auto_138912 ?auto_138919 ) ) ( not ( = ?auto_138912 ?auto_138920 ) ) ( not ( = ?auto_138912 ?auto_138921 ) ) ( not ( = ?auto_138913 ?auto_138914 ) ) ( not ( = ?auto_138913 ?auto_138915 ) ) ( not ( = ?auto_138913 ?auto_138916 ) ) ( not ( = ?auto_138913 ?auto_138917 ) ) ( not ( = ?auto_138913 ?auto_138918 ) ) ( not ( = ?auto_138913 ?auto_138919 ) ) ( not ( = ?auto_138913 ?auto_138920 ) ) ( not ( = ?auto_138913 ?auto_138921 ) ) ( not ( = ?auto_138914 ?auto_138915 ) ) ( not ( = ?auto_138914 ?auto_138916 ) ) ( not ( = ?auto_138914 ?auto_138917 ) ) ( not ( = ?auto_138914 ?auto_138918 ) ) ( not ( = ?auto_138914 ?auto_138919 ) ) ( not ( = ?auto_138914 ?auto_138920 ) ) ( not ( = ?auto_138914 ?auto_138921 ) ) ( not ( = ?auto_138915 ?auto_138916 ) ) ( not ( = ?auto_138915 ?auto_138917 ) ) ( not ( = ?auto_138915 ?auto_138918 ) ) ( not ( = ?auto_138915 ?auto_138919 ) ) ( not ( = ?auto_138915 ?auto_138920 ) ) ( not ( = ?auto_138915 ?auto_138921 ) ) ( not ( = ?auto_138916 ?auto_138917 ) ) ( not ( = ?auto_138916 ?auto_138918 ) ) ( not ( = ?auto_138916 ?auto_138919 ) ) ( not ( = ?auto_138916 ?auto_138920 ) ) ( not ( = ?auto_138916 ?auto_138921 ) ) ( not ( = ?auto_138917 ?auto_138918 ) ) ( not ( = ?auto_138917 ?auto_138919 ) ) ( not ( = ?auto_138917 ?auto_138920 ) ) ( not ( = ?auto_138917 ?auto_138921 ) ) ( not ( = ?auto_138918 ?auto_138919 ) ) ( not ( = ?auto_138918 ?auto_138920 ) ) ( not ( = ?auto_138918 ?auto_138921 ) ) ( not ( = ?auto_138919 ?auto_138920 ) ) ( not ( = ?auto_138919 ?auto_138921 ) ) ( not ( = ?auto_138920 ?auto_138921 ) ) ( ON ?auto_138920 ?auto_138921 ) ( ON ?auto_138919 ?auto_138920 ) ( CLEAR ?auto_138917 ) ( ON ?auto_138918 ?auto_138919 ) ( CLEAR ?auto_138918 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_138911 ?auto_138912 ?auto_138913 ?auto_138914 ?auto_138915 ?auto_138916 ?auto_138917 ?auto_138918 )
      ( MAKE-11PILE ?auto_138911 ?auto_138912 ?auto_138913 ?auto_138914 ?auto_138915 ?auto_138916 ?auto_138917 ?auto_138918 ?auto_138919 ?auto_138920 ?auto_138921 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_138933 - BLOCK
      ?auto_138934 - BLOCK
      ?auto_138935 - BLOCK
      ?auto_138936 - BLOCK
      ?auto_138937 - BLOCK
      ?auto_138938 - BLOCK
      ?auto_138939 - BLOCK
      ?auto_138940 - BLOCK
      ?auto_138941 - BLOCK
      ?auto_138942 - BLOCK
      ?auto_138943 - BLOCK
    )
    :vars
    (
      ?auto_138944 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_138943 ?auto_138944 ) ( ON-TABLE ?auto_138933 ) ( ON ?auto_138934 ?auto_138933 ) ( ON ?auto_138935 ?auto_138934 ) ( ON ?auto_138936 ?auto_138935 ) ( ON ?auto_138937 ?auto_138936 ) ( ON ?auto_138938 ?auto_138937 ) ( not ( = ?auto_138933 ?auto_138934 ) ) ( not ( = ?auto_138933 ?auto_138935 ) ) ( not ( = ?auto_138933 ?auto_138936 ) ) ( not ( = ?auto_138933 ?auto_138937 ) ) ( not ( = ?auto_138933 ?auto_138938 ) ) ( not ( = ?auto_138933 ?auto_138939 ) ) ( not ( = ?auto_138933 ?auto_138940 ) ) ( not ( = ?auto_138933 ?auto_138941 ) ) ( not ( = ?auto_138933 ?auto_138942 ) ) ( not ( = ?auto_138933 ?auto_138943 ) ) ( not ( = ?auto_138933 ?auto_138944 ) ) ( not ( = ?auto_138934 ?auto_138935 ) ) ( not ( = ?auto_138934 ?auto_138936 ) ) ( not ( = ?auto_138934 ?auto_138937 ) ) ( not ( = ?auto_138934 ?auto_138938 ) ) ( not ( = ?auto_138934 ?auto_138939 ) ) ( not ( = ?auto_138934 ?auto_138940 ) ) ( not ( = ?auto_138934 ?auto_138941 ) ) ( not ( = ?auto_138934 ?auto_138942 ) ) ( not ( = ?auto_138934 ?auto_138943 ) ) ( not ( = ?auto_138934 ?auto_138944 ) ) ( not ( = ?auto_138935 ?auto_138936 ) ) ( not ( = ?auto_138935 ?auto_138937 ) ) ( not ( = ?auto_138935 ?auto_138938 ) ) ( not ( = ?auto_138935 ?auto_138939 ) ) ( not ( = ?auto_138935 ?auto_138940 ) ) ( not ( = ?auto_138935 ?auto_138941 ) ) ( not ( = ?auto_138935 ?auto_138942 ) ) ( not ( = ?auto_138935 ?auto_138943 ) ) ( not ( = ?auto_138935 ?auto_138944 ) ) ( not ( = ?auto_138936 ?auto_138937 ) ) ( not ( = ?auto_138936 ?auto_138938 ) ) ( not ( = ?auto_138936 ?auto_138939 ) ) ( not ( = ?auto_138936 ?auto_138940 ) ) ( not ( = ?auto_138936 ?auto_138941 ) ) ( not ( = ?auto_138936 ?auto_138942 ) ) ( not ( = ?auto_138936 ?auto_138943 ) ) ( not ( = ?auto_138936 ?auto_138944 ) ) ( not ( = ?auto_138937 ?auto_138938 ) ) ( not ( = ?auto_138937 ?auto_138939 ) ) ( not ( = ?auto_138937 ?auto_138940 ) ) ( not ( = ?auto_138937 ?auto_138941 ) ) ( not ( = ?auto_138937 ?auto_138942 ) ) ( not ( = ?auto_138937 ?auto_138943 ) ) ( not ( = ?auto_138937 ?auto_138944 ) ) ( not ( = ?auto_138938 ?auto_138939 ) ) ( not ( = ?auto_138938 ?auto_138940 ) ) ( not ( = ?auto_138938 ?auto_138941 ) ) ( not ( = ?auto_138938 ?auto_138942 ) ) ( not ( = ?auto_138938 ?auto_138943 ) ) ( not ( = ?auto_138938 ?auto_138944 ) ) ( not ( = ?auto_138939 ?auto_138940 ) ) ( not ( = ?auto_138939 ?auto_138941 ) ) ( not ( = ?auto_138939 ?auto_138942 ) ) ( not ( = ?auto_138939 ?auto_138943 ) ) ( not ( = ?auto_138939 ?auto_138944 ) ) ( not ( = ?auto_138940 ?auto_138941 ) ) ( not ( = ?auto_138940 ?auto_138942 ) ) ( not ( = ?auto_138940 ?auto_138943 ) ) ( not ( = ?auto_138940 ?auto_138944 ) ) ( not ( = ?auto_138941 ?auto_138942 ) ) ( not ( = ?auto_138941 ?auto_138943 ) ) ( not ( = ?auto_138941 ?auto_138944 ) ) ( not ( = ?auto_138942 ?auto_138943 ) ) ( not ( = ?auto_138942 ?auto_138944 ) ) ( not ( = ?auto_138943 ?auto_138944 ) ) ( ON ?auto_138942 ?auto_138943 ) ( ON ?auto_138941 ?auto_138942 ) ( ON ?auto_138940 ?auto_138941 ) ( CLEAR ?auto_138938 ) ( ON ?auto_138939 ?auto_138940 ) ( CLEAR ?auto_138939 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_138933 ?auto_138934 ?auto_138935 ?auto_138936 ?auto_138937 ?auto_138938 ?auto_138939 )
      ( MAKE-11PILE ?auto_138933 ?auto_138934 ?auto_138935 ?auto_138936 ?auto_138937 ?auto_138938 ?auto_138939 ?auto_138940 ?auto_138941 ?auto_138942 ?auto_138943 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_138956 - BLOCK
      ?auto_138957 - BLOCK
      ?auto_138958 - BLOCK
      ?auto_138959 - BLOCK
      ?auto_138960 - BLOCK
      ?auto_138961 - BLOCK
      ?auto_138962 - BLOCK
      ?auto_138963 - BLOCK
      ?auto_138964 - BLOCK
      ?auto_138965 - BLOCK
      ?auto_138966 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_138966 ) ( ON-TABLE ?auto_138956 ) ( ON ?auto_138957 ?auto_138956 ) ( ON ?auto_138958 ?auto_138957 ) ( ON ?auto_138959 ?auto_138958 ) ( ON ?auto_138960 ?auto_138959 ) ( ON ?auto_138961 ?auto_138960 ) ( not ( = ?auto_138956 ?auto_138957 ) ) ( not ( = ?auto_138956 ?auto_138958 ) ) ( not ( = ?auto_138956 ?auto_138959 ) ) ( not ( = ?auto_138956 ?auto_138960 ) ) ( not ( = ?auto_138956 ?auto_138961 ) ) ( not ( = ?auto_138956 ?auto_138962 ) ) ( not ( = ?auto_138956 ?auto_138963 ) ) ( not ( = ?auto_138956 ?auto_138964 ) ) ( not ( = ?auto_138956 ?auto_138965 ) ) ( not ( = ?auto_138956 ?auto_138966 ) ) ( not ( = ?auto_138957 ?auto_138958 ) ) ( not ( = ?auto_138957 ?auto_138959 ) ) ( not ( = ?auto_138957 ?auto_138960 ) ) ( not ( = ?auto_138957 ?auto_138961 ) ) ( not ( = ?auto_138957 ?auto_138962 ) ) ( not ( = ?auto_138957 ?auto_138963 ) ) ( not ( = ?auto_138957 ?auto_138964 ) ) ( not ( = ?auto_138957 ?auto_138965 ) ) ( not ( = ?auto_138957 ?auto_138966 ) ) ( not ( = ?auto_138958 ?auto_138959 ) ) ( not ( = ?auto_138958 ?auto_138960 ) ) ( not ( = ?auto_138958 ?auto_138961 ) ) ( not ( = ?auto_138958 ?auto_138962 ) ) ( not ( = ?auto_138958 ?auto_138963 ) ) ( not ( = ?auto_138958 ?auto_138964 ) ) ( not ( = ?auto_138958 ?auto_138965 ) ) ( not ( = ?auto_138958 ?auto_138966 ) ) ( not ( = ?auto_138959 ?auto_138960 ) ) ( not ( = ?auto_138959 ?auto_138961 ) ) ( not ( = ?auto_138959 ?auto_138962 ) ) ( not ( = ?auto_138959 ?auto_138963 ) ) ( not ( = ?auto_138959 ?auto_138964 ) ) ( not ( = ?auto_138959 ?auto_138965 ) ) ( not ( = ?auto_138959 ?auto_138966 ) ) ( not ( = ?auto_138960 ?auto_138961 ) ) ( not ( = ?auto_138960 ?auto_138962 ) ) ( not ( = ?auto_138960 ?auto_138963 ) ) ( not ( = ?auto_138960 ?auto_138964 ) ) ( not ( = ?auto_138960 ?auto_138965 ) ) ( not ( = ?auto_138960 ?auto_138966 ) ) ( not ( = ?auto_138961 ?auto_138962 ) ) ( not ( = ?auto_138961 ?auto_138963 ) ) ( not ( = ?auto_138961 ?auto_138964 ) ) ( not ( = ?auto_138961 ?auto_138965 ) ) ( not ( = ?auto_138961 ?auto_138966 ) ) ( not ( = ?auto_138962 ?auto_138963 ) ) ( not ( = ?auto_138962 ?auto_138964 ) ) ( not ( = ?auto_138962 ?auto_138965 ) ) ( not ( = ?auto_138962 ?auto_138966 ) ) ( not ( = ?auto_138963 ?auto_138964 ) ) ( not ( = ?auto_138963 ?auto_138965 ) ) ( not ( = ?auto_138963 ?auto_138966 ) ) ( not ( = ?auto_138964 ?auto_138965 ) ) ( not ( = ?auto_138964 ?auto_138966 ) ) ( not ( = ?auto_138965 ?auto_138966 ) ) ( ON ?auto_138965 ?auto_138966 ) ( ON ?auto_138964 ?auto_138965 ) ( ON ?auto_138963 ?auto_138964 ) ( CLEAR ?auto_138961 ) ( ON ?auto_138962 ?auto_138963 ) ( CLEAR ?auto_138962 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_138956 ?auto_138957 ?auto_138958 ?auto_138959 ?auto_138960 ?auto_138961 ?auto_138962 )
      ( MAKE-11PILE ?auto_138956 ?auto_138957 ?auto_138958 ?auto_138959 ?auto_138960 ?auto_138961 ?auto_138962 ?auto_138963 ?auto_138964 ?auto_138965 ?auto_138966 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_138978 - BLOCK
      ?auto_138979 - BLOCK
      ?auto_138980 - BLOCK
      ?auto_138981 - BLOCK
      ?auto_138982 - BLOCK
      ?auto_138983 - BLOCK
      ?auto_138984 - BLOCK
      ?auto_138985 - BLOCK
      ?auto_138986 - BLOCK
      ?auto_138987 - BLOCK
      ?auto_138988 - BLOCK
    )
    :vars
    (
      ?auto_138989 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_138988 ?auto_138989 ) ( ON-TABLE ?auto_138978 ) ( ON ?auto_138979 ?auto_138978 ) ( ON ?auto_138980 ?auto_138979 ) ( ON ?auto_138981 ?auto_138980 ) ( ON ?auto_138982 ?auto_138981 ) ( not ( = ?auto_138978 ?auto_138979 ) ) ( not ( = ?auto_138978 ?auto_138980 ) ) ( not ( = ?auto_138978 ?auto_138981 ) ) ( not ( = ?auto_138978 ?auto_138982 ) ) ( not ( = ?auto_138978 ?auto_138983 ) ) ( not ( = ?auto_138978 ?auto_138984 ) ) ( not ( = ?auto_138978 ?auto_138985 ) ) ( not ( = ?auto_138978 ?auto_138986 ) ) ( not ( = ?auto_138978 ?auto_138987 ) ) ( not ( = ?auto_138978 ?auto_138988 ) ) ( not ( = ?auto_138978 ?auto_138989 ) ) ( not ( = ?auto_138979 ?auto_138980 ) ) ( not ( = ?auto_138979 ?auto_138981 ) ) ( not ( = ?auto_138979 ?auto_138982 ) ) ( not ( = ?auto_138979 ?auto_138983 ) ) ( not ( = ?auto_138979 ?auto_138984 ) ) ( not ( = ?auto_138979 ?auto_138985 ) ) ( not ( = ?auto_138979 ?auto_138986 ) ) ( not ( = ?auto_138979 ?auto_138987 ) ) ( not ( = ?auto_138979 ?auto_138988 ) ) ( not ( = ?auto_138979 ?auto_138989 ) ) ( not ( = ?auto_138980 ?auto_138981 ) ) ( not ( = ?auto_138980 ?auto_138982 ) ) ( not ( = ?auto_138980 ?auto_138983 ) ) ( not ( = ?auto_138980 ?auto_138984 ) ) ( not ( = ?auto_138980 ?auto_138985 ) ) ( not ( = ?auto_138980 ?auto_138986 ) ) ( not ( = ?auto_138980 ?auto_138987 ) ) ( not ( = ?auto_138980 ?auto_138988 ) ) ( not ( = ?auto_138980 ?auto_138989 ) ) ( not ( = ?auto_138981 ?auto_138982 ) ) ( not ( = ?auto_138981 ?auto_138983 ) ) ( not ( = ?auto_138981 ?auto_138984 ) ) ( not ( = ?auto_138981 ?auto_138985 ) ) ( not ( = ?auto_138981 ?auto_138986 ) ) ( not ( = ?auto_138981 ?auto_138987 ) ) ( not ( = ?auto_138981 ?auto_138988 ) ) ( not ( = ?auto_138981 ?auto_138989 ) ) ( not ( = ?auto_138982 ?auto_138983 ) ) ( not ( = ?auto_138982 ?auto_138984 ) ) ( not ( = ?auto_138982 ?auto_138985 ) ) ( not ( = ?auto_138982 ?auto_138986 ) ) ( not ( = ?auto_138982 ?auto_138987 ) ) ( not ( = ?auto_138982 ?auto_138988 ) ) ( not ( = ?auto_138982 ?auto_138989 ) ) ( not ( = ?auto_138983 ?auto_138984 ) ) ( not ( = ?auto_138983 ?auto_138985 ) ) ( not ( = ?auto_138983 ?auto_138986 ) ) ( not ( = ?auto_138983 ?auto_138987 ) ) ( not ( = ?auto_138983 ?auto_138988 ) ) ( not ( = ?auto_138983 ?auto_138989 ) ) ( not ( = ?auto_138984 ?auto_138985 ) ) ( not ( = ?auto_138984 ?auto_138986 ) ) ( not ( = ?auto_138984 ?auto_138987 ) ) ( not ( = ?auto_138984 ?auto_138988 ) ) ( not ( = ?auto_138984 ?auto_138989 ) ) ( not ( = ?auto_138985 ?auto_138986 ) ) ( not ( = ?auto_138985 ?auto_138987 ) ) ( not ( = ?auto_138985 ?auto_138988 ) ) ( not ( = ?auto_138985 ?auto_138989 ) ) ( not ( = ?auto_138986 ?auto_138987 ) ) ( not ( = ?auto_138986 ?auto_138988 ) ) ( not ( = ?auto_138986 ?auto_138989 ) ) ( not ( = ?auto_138987 ?auto_138988 ) ) ( not ( = ?auto_138987 ?auto_138989 ) ) ( not ( = ?auto_138988 ?auto_138989 ) ) ( ON ?auto_138987 ?auto_138988 ) ( ON ?auto_138986 ?auto_138987 ) ( ON ?auto_138985 ?auto_138986 ) ( ON ?auto_138984 ?auto_138985 ) ( CLEAR ?auto_138982 ) ( ON ?auto_138983 ?auto_138984 ) ( CLEAR ?auto_138983 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_138978 ?auto_138979 ?auto_138980 ?auto_138981 ?auto_138982 ?auto_138983 )
      ( MAKE-11PILE ?auto_138978 ?auto_138979 ?auto_138980 ?auto_138981 ?auto_138982 ?auto_138983 ?auto_138984 ?auto_138985 ?auto_138986 ?auto_138987 ?auto_138988 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_139001 - BLOCK
      ?auto_139002 - BLOCK
      ?auto_139003 - BLOCK
      ?auto_139004 - BLOCK
      ?auto_139005 - BLOCK
      ?auto_139006 - BLOCK
      ?auto_139007 - BLOCK
      ?auto_139008 - BLOCK
      ?auto_139009 - BLOCK
      ?auto_139010 - BLOCK
      ?auto_139011 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_139011 ) ( ON-TABLE ?auto_139001 ) ( ON ?auto_139002 ?auto_139001 ) ( ON ?auto_139003 ?auto_139002 ) ( ON ?auto_139004 ?auto_139003 ) ( ON ?auto_139005 ?auto_139004 ) ( not ( = ?auto_139001 ?auto_139002 ) ) ( not ( = ?auto_139001 ?auto_139003 ) ) ( not ( = ?auto_139001 ?auto_139004 ) ) ( not ( = ?auto_139001 ?auto_139005 ) ) ( not ( = ?auto_139001 ?auto_139006 ) ) ( not ( = ?auto_139001 ?auto_139007 ) ) ( not ( = ?auto_139001 ?auto_139008 ) ) ( not ( = ?auto_139001 ?auto_139009 ) ) ( not ( = ?auto_139001 ?auto_139010 ) ) ( not ( = ?auto_139001 ?auto_139011 ) ) ( not ( = ?auto_139002 ?auto_139003 ) ) ( not ( = ?auto_139002 ?auto_139004 ) ) ( not ( = ?auto_139002 ?auto_139005 ) ) ( not ( = ?auto_139002 ?auto_139006 ) ) ( not ( = ?auto_139002 ?auto_139007 ) ) ( not ( = ?auto_139002 ?auto_139008 ) ) ( not ( = ?auto_139002 ?auto_139009 ) ) ( not ( = ?auto_139002 ?auto_139010 ) ) ( not ( = ?auto_139002 ?auto_139011 ) ) ( not ( = ?auto_139003 ?auto_139004 ) ) ( not ( = ?auto_139003 ?auto_139005 ) ) ( not ( = ?auto_139003 ?auto_139006 ) ) ( not ( = ?auto_139003 ?auto_139007 ) ) ( not ( = ?auto_139003 ?auto_139008 ) ) ( not ( = ?auto_139003 ?auto_139009 ) ) ( not ( = ?auto_139003 ?auto_139010 ) ) ( not ( = ?auto_139003 ?auto_139011 ) ) ( not ( = ?auto_139004 ?auto_139005 ) ) ( not ( = ?auto_139004 ?auto_139006 ) ) ( not ( = ?auto_139004 ?auto_139007 ) ) ( not ( = ?auto_139004 ?auto_139008 ) ) ( not ( = ?auto_139004 ?auto_139009 ) ) ( not ( = ?auto_139004 ?auto_139010 ) ) ( not ( = ?auto_139004 ?auto_139011 ) ) ( not ( = ?auto_139005 ?auto_139006 ) ) ( not ( = ?auto_139005 ?auto_139007 ) ) ( not ( = ?auto_139005 ?auto_139008 ) ) ( not ( = ?auto_139005 ?auto_139009 ) ) ( not ( = ?auto_139005 ?auto_139010 ) ) ( not ( = ?auto_139005 ?auto_139011 ) ) ( not ( = ?auto_139006 ?auto_139007 ) ) ( not ( = ?auto_139006 ?auto_139008 ) ) ( not ( = ?auto_139006 ?auto_139009 ) ) ( not ( = ?auto_139006 ?auto_139010 ) ) ( not ( = ?auto_139006 ?auto_139011 ) ) ( not ( = ?auto_139007 ?auto_139008 ) ) ( not ( = ?auto_139007 ?auto_139009 ) ) ( not ( = ?auto_139007 ?auto_139010 ) ) ( not ( = ?auto_139007 ?auto_139011 ) ) ( not ( = ?auto_139008 ?auto_139009 ) ) ( not ( = ?auto_139008 ?auto_139010 ) ) ( not ( = ?auto_139008 ?auto_139011 ) ) ( not ( = ?auto_139009 ?auto_139010 ) ) ( not ( = ?auto_139009 ?auto_139011 ) ) ( not ( = ?auto_139010 ?auto_139011 ) ) ( ON ?auto_139010 ?auto_139011 ) ( ON ?auto_139009 ?auto_139010 ) ( ON ?auto_139008 ?auto_139009 ) ( ON ?auto_139007 ?auto_139008 ) ( CLEAR ?auto_139005 ) ( ON ?auto_139006 ?auto_139007 ) ( CLEAR ?auto_139006 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_139001 ?auto_139002 ?auto_139003 ?auto_139004 ?auto_139005 ?auto_139006 )
      ( MAKE-11PILE ?auto_139001 ?auto_139002 ?auto_139003 ?auto_139004 ?auto_139005 ?auto_139006 ?auto_139007 ?auto_139008 ?auto_139009 ?auto_139010 ?auto_139011 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_139023 - BLOCK
      ?auto_139024 - BLOCK
      ?auto_139025 - BLOCK
      ?auto_139026 - BLOCK
      ?auto_139027 - BLOCK
      ?auto_139028 - BLOCK
      ?auto_139029 - BLOCK
      ?auto_139030 - BLOCK
      ?auto_139031 - BLOCK
      ?auto_139032 - BLOCK
      ?auto_139033 - BLOCK
    )
    :vars
    (
      ?auto_139034 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139033 ?auto_139034 ) ( ON-TABLE ?auto_139023 ) ( ON ?auto_139024 ?auto_139023 ) ( ON ?auto_139025 ?auto_139024 ) ( ON ?auto_139026 ?auto_139025 ) ( not ( = ?auto_139023 ?auto_139024 ) ) ( not ( = ?auto_139023 ?auto_139025 ) ) ( not ( = ?auto_139023 ?auto_139026 ) ) ( not ( = ?auto_139023 ?auto_139027 ) ) ( not ( = ?auto_139023 ?auto_139028 ) ) ( not ( = ?auto_139023 ?auto_139029 ) ) ( not ( = ?auto_139023 ?auto_139030 ) ) ( not ( = ?auto_139023 ?auto_139031 ) ) ( not ( = ?auto_139023 ?auto_139032 ) ) ( not ( = ?auto_139023 ?auto_139033 ) ) ( not ( = ?auto_139023 ?auto_139034 ) ) ( not ( = ?auto_139024 ?auto_139025 ) ) ( not ( = ?auto_139024 ?auto_139026 ) ) ( not ( = ?auto_139024 ?auto_139027 ) ) ( not ( = ?auto_139024 ?auto_139028 ) ) ( not ( = ?auto_139024 ?auto_139029 ) ) ( not ( = ?auto_139024 ?auto_139030 ) ) ( not ( = ?auto_139024 ?auto_139031 ) ) ( not ( = ?auto_139024 ?auto_139032 ) ) ( not ( = ?auto_139024 ?auto_139033 ) ) ( not ( = ?auto_139024 ?auto_139034 ) ) ( not ( = ?auto_139025 ?auto_139026 ) ) ( not ( = ?auto_139025 ?auto_139027 ) ) ( not ( = ?auto_139025 ?auto_139028 ) ) ( not ( = ?auto_139025 ?auto_139029 ) ) ( not ( = ?auto_139025 ?auto_139030 ) ) ( not ( = ?auto_139025 ?auto_139031 ) ) ( not ( = ?auto_139025 ?auto_139032 ) ) ( not ( = ?auto_139025 ?auto_139033 ) ) ( not ( = ?auto_139025 ?auto_139034 ) ) ( not ( = ?auto_139026 ?auto_139027 ) ) ( not ( = ?auto_139026 ?auto_139028 ) ) ( not ( = ?auto_139026 ?auto_139029 ) ) ( not ( = ?auto_139026 ?auto_139030 ) ) ( not ( = ?auto_139026 ?auto_139031 ) ) ( not ( = ?auto_139026 ?auto_139032 ) ) ( not ( = ?auto_139026 ?auto_139033 ) ) ( not ( = ?auto_139026 ?auto_139034 ) ) ( not ( = ?auto_139027 ?auto_139028 ) ) ( not ( = ?auto_139027 ?auto_139029 ) ) ( not ( = ?auto_139027 ?auto_139030 ) ) ( not ( = ?auto_139027 ?auto_139031 ) ) ( not ( = ?auto_139027 ?auto_139032 ) ) ( not ( = ?auto_139027 ?auto_139033 ) ) ( not ( = ?auto_139027 ?auto_139034 ) ) ( not ( = ?auto_139028 ?auto_139029 ) ) ( not ( = ?auto_139028 ?auto_139030 ) ) ( not ( = ?auto_139028 ?auto_139031 ) ) ( not ( = ?auto_139028 ?auto_139032 ) ) ( not ( = ?auto_139028 ?auto_139033 ) ) ( not ( = ?auto_139028 ?auto_139034 ) ) ( not ( = ?auto_139029 ?auto_139030 ) ) ( not ( = ?auto_139029 ?auto_139031 ) ) ( not ( = ?auto_139029 ?auto_139032 ) ) ( not ( = ?auto_139029 ?auto_139033 ) ) ( not ( = ?auto_139029 ?auto_139034 ) ) ( not ( = ?auto_139030 ?auto_139031 ) ) ( not ( = ?auto_139030 ?auto_139032 ) ) ( not ( = ?auto_139030 ?auto_139033 ) ) ( not ( = ?auto_139030 ?auto_139034 ) ) ( not ( = ?auto_139031 ?auto_139032 ) ) ( not ( = ?auto_139031 ?auto_139033 ) ) ( not ( = ?auto_139031 ?auto_139034 ) ) ( not ( = ?auto_139032 ?auto_139033 ) ) ( not ( = ?auto_139032 ?auto_139034 ) ) ( not ( = ?auto_139033 ?auto_139034 ) ) ( ON ?auto_139032 ?auto_139033 ) ( ON ?auto_139031 ?auto_139032 ) ( ON ?auto_139030 ?auto_139031 ) ( ON ?auto_139029 ?auto_139030 ) ( ON ?auto_139028 ?auto_139029 ) ( CLEAR ?auto_139026 ) ( ON ?auto_139027 ?auto_139028 ) ( CLEAR ?auto_139027 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_139023 ?auto_139024 ?auto_139025 ?auto_139026 ?auto_139027 )
      ( MAKE-11PILE ?auto_139023 ?auto_139024 ?auto_139025 ?auto_139026 ?auto_139027 ?auto_139028 ?auto_139029 ?auto_139030 ?auto_139031 ?auto_139032 ?auto_139033 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_139046 - BLOCK
      ?auto_139047 - BLOCK
      ?auto_139048 - BLOCK
      ?auto_139049 - BLOCK
      ?auto_139050 - BLOCK
      ?auto_139051 - BLOCK
      ?auto_139052 - BLOCK
      ?auto_139053 - BLOCK
      ?auto_139054 - BLOCK
      ?auto_139055 - BLOCK
      ?auto_139056 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_139056 ) ( ON-TABLE ?auto_139046 ) ( ON ?auto_139047 ?auto_139046 ) ( ON ?auto_139048 ?auto_139047 ) ( ON ?auto_139049 ?auto_139048 ) ( not ( = ?auto_139046 ?auto_139047 ) ) ( not ( = ?auto_139046 ?auto_139048 ) ) ( not ( = ?auto_139046 ?auto_139049 ) ) ( not ( = ?auto_139046 ?auto_139050 ) ) ( not ( = ?auto_139046 ?auto_139051 ) ) ( not ( = ?auto_139046 ?auto_139052 ) ) ( not ( = ?auto_139046 ?auto_139053 ) ) ( not ( = ?auto_139046 ?auto_139054 ) ) ( not ( = ?auto_139046 ?auto_139055 ) ) ( not ( = ?auto_139046 ?auto_139056 ) ) ( not ( = ?auto_139047 ?auto_139048 ) ) ( not ( = ?auto_139047 ?auto_139049 ) ) ( not ( = ?auto_139047 ?auto_139050 ) ) ( not ( = ?auto_139047 ?auto_139051 ) ) ( not ( = ?auto_139047 ?auto_139052 ) ) ( not ( = ?auto_139047 ?auto_139053 ) ) ( not ( = ?auto_139047 ?auto_139054 ) ) ( not ( = ?auto_139047 ?auto_139055 ) ) ( not ( = ?auto_139047 ?auto_139056 ) ) ( not ( = ?auto_139048 ?auto_139049 ) ) ( not ( = ?auto_139048 ?auto_139050 ) ) ( not ( = ?auto_139048 ?auto_139051 ) ) ( not ( = ?auto_139048 ?auto_139052 ) ) ( not ( = ?auto_139048 ?auto_139053 ) ) ( not ( = ?auto_139048 ?auto_139054 ) ) ( not ( = ?auto_139048 ?auto_139055 ) ) ( not ( = ?auto_139048 ?auto_139056 ) ) ( not ( = ?auto_139049 ?auto_139050 ) ) ( not ( = ?auto_139049 ?auto_139051 ) ) ( not ( = ?auto_139049 ?auto_139052 ) ) ( not ( = ?auto_139049 ?auto_139053 ) ) ( not ( = ?auto_139049 ?auto_139054 ) ) ( not ( = ?auto_139049 ?auto_139055 ) ) ( not ( = ?auto_139049 ?auto_139056 ) ) ( not ( = ?auto_139050 ?auto_139051 ) ) ( not ( = ?auto_139050 ?auto_139052 ) ) ( not ( = ?auto_139050 ?auto_139053 ) ) ( not ( = ?auto_139050 ?auto_139054 ) ) ( not ( = ?auto_139050 ?auto_139055 ) ) ( not ( = ?auto_139050 ?auto_139056 ) ) ( not ( = ?auto_139051 ?auto_139052 ) ) ( not ( = ?auto_139051 ?auto_139053 ) ) ( not ( = ?auto_139051 ?auto_139054 ) ) ( not ( = ?auto_139051 ?auto_139055 ) ) ( not ( = ?auto_139051 ?auto_139056 ) ) ( not ( = ?auto_139052 ?auto_139053 ) ) ( not ( = ?auto_139052 ?auto_139054 ) ) ( not ( = ?auto_139052 ?auto_139055 ) ) ( not ( = ?auto_139052 ?auto_139056 ) ) ( not ( = ?auto_139053 ?auto_139054 ) ) ( not ( = ?auto_139053 ?auto_139055 ) ) ( not ( = ?auto_139053 ?auto_139056 ) ) ( not ( = ?auto_139054 ?auto_139055 ) ) ( not ( = ?auto_139054 ?auto_139056 ) ) ( not ( = ?auto_139055 ?auto_139056 ) ) ( ON ?auto_139055 ?auto_139056 ) ( ON ?auto_139054 ?auto_139055 ) ( ON ?auto_139053 ?auto_139054 ) ( ON ?auto_139052 ?auto_139053 ) ( ON ?auto_139051 ?auto_139052 ) ( CLEAR ?auto_139049 ) ( ON ?auto_139050 ?auto_139051 ) ( CLEAR ?auto_139050 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_139046 ?auto_139047 ?auto_139048 ?auto_139049 ?auto_139050 )
      ( MAKE-11PILE ?auto_139046 ?auto_139047 ?auto_139048 ?auto_139049 ?auto_139050 ?auto_139051 ?auto_139052 ?auto_139053 ?auto_139054 ?auto_139055 ?auto_139056 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_139068 - BLOCK
      ?auto_139069 - BLOCK
      ?auto_139070 - BLOCK
      ?auto_139071 - BLOCK
      ?auto_139072 - BLOCK
      ?auto_139073 - BLOCK
      ?auto_139074 - BLOCK
      ?auto_139075 - BLOCK
      ?auto_139076 - BLOCK
      ?auto_139077 - BLOCK
      ?auto_139078 - BLOCK
    )
    :vars
    (
      ?auto_139079 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139078 ?auto_139079 ) ( ON-TABLE ?auto_139068 ) ( ON ?auto_139069 ?auto_139068 ) ( ON ?auto_139070 ?auto_139069 ) ( not ( = ?auto_139068 ?auto_139069 ) ) ( not ( = ?auto_139068 ?auto_139070 ) ) ( not ( = ?auto_139068 ?auto_139071 ) ) ( not ( = ?auto_139068 ?auto_139072 ) ) ( not ( = ?auto_139068 ?auto_139073 ) ) ( not ( = ?auto_139068 ?auto_139074 ) ) ( not ( = ?auto_139068 ?auto_139075 ) ) ( not ( = ?auto_139068 ?auto_139076 ) ) ( not ( = ?auto_139068 ?auto_139077 ) ) ( not ( = ?auto_139068 ?auto_139078 ) ) ( not ( = ?auto_139068 ?auto_139079 ) ) ( not ( = ?auto_139069 ?auto_139070 ) ) ( not ( = ?auto_139069 ?auto_139071 ) ) ( not ( = ?auto_139069 ?auto_139072 ) ) ( not ( = ?auto_139069 ?auto_139073 ) ) ( not ( = ?auto_139069 ?auto_139074 ) ) ( not ( = ?auto_139069 ?auto_139075 ) ) ( not ( = ?auto_139069 ?auto_139076 ) ) ( not ( = ?auto_139069 ?auto_139077 ) ) ( not ( = ?auto_139069 ?auto_139078 ) ) ( not ( = ?auto_139069 ?auto_139079 ) ) ( not ( = ?auto_139070 ?auto_139071 ) ) ( not ( = ?auto_139070 ?auto_139072 ) ) ( not ( = ?auto_139070 ?auto_139073 ) ) ( not ( = ?auto_139070 ?auto_139074 ) ) ( not ( = ?auto_139070 ?auto_139075 ) ) ( not ( = ?auto_139070 ?auto_139076 ) ) ( not ( = ?auto_139070 ?auto_139077 ) ) ( not ( = ?auto_139070 ?auto_139078 ) ) ( not ( = ?auto_139070 ?auto_139079 ) ) ( not ( = ?auto_139071 ?auto_139072 ) ) ( not ( = ?auto_139071 ?auto_139073 ) ) ( not ( = ?auto_139071 ?auto_139074 ) ) ( not ( = ?auto_139071 ?auto_139075 ) ) ( not ( = ?auto_139071 ?auto_139076 ) ) ( not ( = ?auto_139071 ?auto_139077 ) ) ( not ( = ?auto_139071 ?auto_139078 ) ) ( not ( = ?auto_139071 ?auto_139079 ) ) ( not ( = ?auto_139072 ?auto_139073 ) ) ( not ( = ?auto_139072 ?auto_139074 ) ) ( not ( = ?auto_139072 ?auto_139075 ) ) ( not ( = ?auto_139072 ?auto_139076 ) ) ( not ( = ?auto_139072 ?auto_139077 ) ) ( not ( = ?auto_139072 ?auto_139078 ) ) ( not ( = ?auto_139072 ?auto_139079 ) ) ( not ( = ?auto_139073 ?auto_139074 ) ) ( not ( = ?auto_139073 ?auto_139075 ) ) ( not ( = ?auto_139073 ?auto_139076 ) ) ( not ( = ?auto_139073 ?auto_139077 ) ) ( not ( = ?auto_139073 ?auto_139078 ) ) ( not ( = ?auto_139073 ?auto_139079 ) ) ( not ( = ?auto_139074 ?auto_139075 ) ) ( not ( = ?auto_139074 ?auto_139076 ) ) ( not ( = ?auto_139074 ?auto_139077 ) ) ( not ( = ?auto_139074 ?auto_139078 ) ) ( not ( = ?auto_139074 ?auto_139079 ) ) ( not ( = ?auto_139075 ?auto_139076 ) ) ( not ( = ?auto_139075 ?auto_139077 ) ) ( not ( = ?auto_139075 ?auto_139078 ) ) ( not ( = ?auto_139075 ?auto_139079 ) ) ( not ( = ?auto_139076 ?auto_139077 ) ) ( not ( = ?auto_139076 ?auto_139078 ) ) ( not ( = ?auto_139076 ?auto_139079 ) ) ( not ( = ?auto_139077 ?auto_139078 ) ) ( not ( = ?auto_139077 ?auto_139079 ) ) ( not ( = ?auto_139078 ?auto_139079 ) ) ( ON ?auto_139077 ?auto_139078 ) ( ON ?auto_139076 ?auto_139077 ) ( ON ?auto_139075 ?auto_139076 ) ( ON ?auto_139074 ?auto_139075 ) ( ON ?auto_139073 ?auto_139074 ) ( ON ?auto_139072 ?auto_139073 ) ( CLEAR ?auto_139070 ) ( ON ?auto_139071 ?auto_139072 ) ( CLEAR ?auto_139071 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_139068 ?auto_139069 ?auto_139070 ?auto_139071 )
      ( MAKE-11PILE ?auto_139068 ?auto_139069 ?auto_139070 ?auto_139071 ?auto_139072 ?auto_139073 ?auto_139074 ?auto_139075 ?auto_139076 ?auto_139077 ?auto_139078 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_139091 - BLOCK
      ?auto_139092 - BLOCK
      ?auto_139093 - BLOCK
      ?auto_139094 - BLOCK
      ?auto_139095 - BLOCK
      ?auto_139096 - BLOCK
      ?auto_139097 - BLOCK
      ?auto_139098 - BLOCK
      ?auto_139099 - BLOCK
      ?auto_139100 - BLOCK
      ?auto_139101 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_139101 ) ( ON-TABLE ?auto_139091 ) ( ON ?auto_139092 ?auto_139091 ) ( ON ?auto_139093 ?auto_139092 ) ( not ( = ?auto_139091 ?auto_139092 ) ) ( not ( = ?auto_139091 ?auto_139093 ) ) ( not ( = ?auto_139091 ?auto_139094 ) ) ( not ( = ?auto_139091 ?auto_139095 ) ) ( not ( = ?auto_139091 ?auto_139096 ) ) ( not ( = ?auto_139091 ?auto_139097 ) ) ( not ( = ?auto_139091 ?auto_139098 ) ) ( not ( = ?auto_139091 ?auto_139099 ) ) ( not ( = ?auto_139091 ?auto_139100 ) ) ( not ( = ?auto_139091 ?auto_139101 ) ) ( not ( = ?auto_139092 ?auto_139093 ) ) ( not ( = ?auto_139092 ?auto_139094 ) ) ( not ( = ?auto_139092 ?auto_139095 ) ) ( not ( = ?auto_139092 ?auto_139096 ) ) ( not ( = ?auto_139092 ?auto_139097 ) ) ( not ( = ?auto_139092 ?auto_139098 ) ) ( not ( = ?auto_139092 ?auto_139099 ) ) ( not ( = ?auto_139092 ?auto_139100 ) ) ( not ( = ?auto_139092 ?auto_139101 ) ) ( not ( = ?auto_139093 ?auto_139094 ) ) ( not ( = ?auto_139093 ?auto_139095 ) ) ( not ( = ?auto_139093 ?auto_139096 ) ) ( not ( = ?auto_139093 ?auto_139097 ) ) ( not ( = ?auto_139093 ?auto_139098 ) ) ( not ( = ?auto_139093 ?auto_139099 ) ) ( not ( = ?auto_139093 ?auto_139100 ) ) ( not ( = ?auto_139093 ?auto_139101 ) ) ( not ( = ?auto_139094 ?auto_139095 ) ) ( not ( = ?auto_139094 ?auto_139096 ) ) ( not ( = ?auto_139094 ?auto_139097 ) ) ( not ( = ?auto_139094 ?auto_139098 ) ) ( not ( = ?auto_139094 ?auto_139099 ) ) ( not ( = ?auto_139094 ?auto_139100 ) ) ( not ( = ?auto_139094 ?auto_139101 ) ) ( not ( = ?auto_139095 ?auto_139096 ) ) ( not ( = ?auto_139095 ?auto_139097 ) ) ( not ( = ?auto_139095 ?auto_139098 ) ) ( not ( = ?auto_139095 ?auto_139099 ) ) ( not ( = ?auto_139095 ?auto_139100 ) ) ( not ( = ?auto_139095 ?auto_139101 ) ) ( not ( = ?auto_139096 ?auto_139097 ) ) ( not ( = ?auto_139096 ?auto_139098 ) ) ( not ( = ?auto_139096 ?auto_139099 ) ) ( not ( = ?auto_139096 ?auto_139100 ) ) ( not ( = ?auto_139096 ?auto_139101 ) ) ( not ( = ?auto_139097 ?auto_139098 ) ) ( not ( = ?auto_139097 ?auto_139099 ) ) ( not ( = ?auto_139097 ?auto_139100 ) ) ( not ( = ?auto_139097 ?auto_139101 ) ) ( not ( = ?auto_139098 ?auto_139099 ) ) ( not ( = ?auto_139098 ?auto_139100 ) ) ( not ( = ?auto_139098 ?auto_139101 ) ) ( not ( = ?auto_139099 ?auto_139100 ) ) ( not ( = ?auto_139099 ?auto_139101 ) ) ( not ( = ?auto_139100 ?auto_139101 ) ) ( ON ?auto_139100 ?auto_139101 ) ( ON ?auto_139099 ?auto_139100 ) ( ON ?auto_139098 ?auto_139099 ) ( ON ?auto_139097 ?auto_139098 ) ( ON ?auto_139096 ?auto_139097 ) ( ON ?auto_139095 ?auto_139096 ) ( CLEAR ?auto_139093 ) ( ON ?auto_139094 ?auto_139095 ) ( CLEAR ?auto_139094 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_139091 ?auto_139092 ?auto_139093 ?auto_139094 )
      ( MAKE-11PILE ?auto_139091 ?auto_139092 ?auto_139093 ?auto_139094 ?auto_139095 ?auto_139096 ?auto_139097 ?auto_139098 ?auto_139099 ?auto_139100 ?auto_139101 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_139113 - BLOCK
      ?auto_139114 - BLOCK
      ?auto_139115 - BLOCK
      ?auto_139116 - BLOCK
      ?auto_139117 - BLOCK
      ?auto_139118 - BLOCK
      ?auto_139119 - BLOCK
      ?auto_139120 - BLOCK
      ?auto_139121 - BLOCK
      ?auto_139122 - BLOCK
      ?auto_139123 - BLOCK
    )
    :vars
    (
      ?auto_139124 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139123 ?auto_139124 ) ( ON-TABLE ?auto_139113 ) ( ON ?auto_139114 ?auto_139113 ) ( not ( = ?auto_139113 ?auto_139114 ) ) ( not ( = ?auto_139113 ?auto_139115 ) ) ( not ( = ?auto_139113 ?auto_139116 ) ) ( not ( = ?auto_139113 ?auto_139117 ) ) ( not ( = ?auto_139113 ?auto_139118 ) ) ( not ( = ?auto_139113 ?auto_139119 ) ) ( not ( = ?auto_139113 ?auto_139120 ) ) ( not ( = ?auto_139113 ?auto_139121 ) ) ( not ( = ?auto_139113 ?auto_139122 ) ) ( not ( = ?auto_139113 ?auto_139123 ) ) ( not ( = ?auto_139113 ?auto_139124 ) ) ( not ( = ?auto_139114 ?auto_139115 ) ) ( not ( = ?auto_139114 ?auto_139116 ) ) ( not ( = ?auto_139114 ?auto_139117 ) ) ( not ( = ?auto_139114 ?auto_139118 ) ) ( not ( = ?auto_139114 ?auto_139119 ) ) ( not ( = ?auto_139114 ?auto_139120 ) ) ( not ( = ?auto_139114 ?auto_139121 ) ) ( not ( = ?auto_139114 ?auto_139122 ) ) ( not ( = ?auto_139114 ?auto_139123 ) ) ( not ( = ?auto_139114 ?auto_139124 ) ) ( not ( = ?auto_139115 ?auto_139116 ) ) ( not ( = ?auto_139115 ?auto_139117 ) ) ( not ( = ?auto_139115 ?auto_139118 ) ) ( not ( = ?auto_139115 ?auto_139119 ) ) ( not ( = ?auto_139115 ?auto_139120 ) ) ( not ( = ?auto_139115 ?auto_139121 ) ) ( not ( = ?auto_139115 ?auto_139122 ) ) ( not ( = ?auto_139115 ?auto_139123 ) ) ( not ( = ?auto_139115 ?auto_139124 ) ) ( not ( = ?auto_139116 ?auto_139117 ) ) ( not ( = ?auto_139116 ?auto_139118 ) ) ( not ( = ?auto_139116 ?auto_139119 ) ) ( not ( = ?auto_139116 ?auto_139120 ) ) ( not ( = ?auto_139116 ?auto_139121 ) ) ( not ( = ?auto_139116 ?auto_139122 ) ) ( not ( = ?auto_139116 ?auto_139123 ) ) ( not ( = ?auto_139116 ?auto_139124 ) ) ( not ( = ?auto_139117 ?auto_139118 ) ) ( not ( = ?auto_139117 ?auto_139119 ) ) ( not ( = ?auto_139117 ?auto_139120 ) ) ( not ( = ?auto_139117 ?auto_139121 ) ) ( not ( = ?auto_139117 ?auto_139122 ) ) ( not ( = ?auto_139117 ?auto_139123 ) ) ( not ( = ?auto_139117 ?auto_139124 ) ) ( not ( = ?auto_139118 ?auto_139119 ) ) ( not ( = ?auto_139118 ?auto_139120 ) ) ( not ( = ?auto_139118 ?auto_139121 ) ) ( not ( = ?auto_139118 ?auto_139122 ) ) ( not ( = ?auto_139118 ?auto_139123 ) ) ( not ( = ?auto_139118 ?auto_139124 ) ) ( not ( = ?auto_139119 ?auto_139120 ) ) ( not ( = ?auto_139119 ?auto_139121 ) ) ( not ( = ?auto_139119 ?auto_139122 ) ) ( not ( = ?auto_139119 ?auto_139123 ) ) ( not ( = ?auto_139119 ?auto_139124 ) ) ( not ( = ?auto_139120 ?auto_139121 ) ) ( not ( = ?auto_139120 ?auto_139122 ) ) ( not ( = ?auto_139120 ?auto_139123 ) ) ( not ( = ?auto_139120 ?auto_139124 ) ) ( not ( = ?auto_139121 ?auto_139122 ) ) ( not ( = ?auto_139121 ?auto_139123 ) ) ( not ( = ?auto_139121 ?auto_139124 ) ) ( not ( = ?auto_139122 ?auto_139123 ) ) ( not ( = ?auto_139122 ?auto_139124 ) ) ( not ( = ?auto_139123 ?auto_139124 ) ) ( ON ?auto_139122 ?auto_139123 ) ( ON ?auto_139121 ?auto_139122 ) ( ON ?auto_139120 ?auto_139121 ) ( ON ?auto_139119 ?auto_139120 ) ( ON ?auto_139118 ?auto_139119 ) ( ON ?auto_139117 ?auto_139118 ) ( ON ?auto_139116 ?auto_139117 ) ( CLEAR ?auto_139114 ) ( ON ?auto_139115 ?auto_139116 ) ( CLEAR ?auto_139115 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_139113 ?auto_139114 ?auto_139115 )
      ( MAKE-11PILE ?auto_139113 ?auto_139114 ?auto_139115 ?auto_139116 ?auto_139117 ?auto_139118 ?auto_139119 ?auto_139120 ?auto_139121 ?auto_139122 ?auto_139123 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_139136 - BLOCK
      ?auto_139137 - BLOCK
      ?auto_139138 - BLOCK
      ?auto_139139 - BLOCK
      ?auto_139140 - BLOCK
      ?auto_139141 - BLOCK
      ?auto_139142 - BLOCK
      ?auto_139143 - BLOCK
      ?auto_139144 - BLOCK
      ?auto_139145 - BLOCK
      ?auto_139146 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_139146 ) ( ON-TABLE ?auto_139136 ) ( ON ?auto_139137 ?auto_139136 ) ( not ( = ?auto_139136 ?auto_139137 ) ) ( not ( = ?auto_139136 ?auto_139138 ) ) ( not ( = ?auto_139136 ?auto_139139 ) ) ( not ( = ?auto_139136 ?auto_139140 ) ) ( not ( = ?auto_139136 ?auto_139141 ) ) ( not ( = ?auto_139136 ?auto_139142 ) ) ( not ( = ?auto_139136 ?auto_139143 ) ) ( not ( = ?auto_139136 ?auto_139144 ) ) ( not ( = ?auto_139136 ?auto_139145 ) ) ( not ( = ?auto_139136 ?auto_139146 ) ) ( not ( = ?auto_139137 ?auto_139138 ) ) ( not ( = ?auto_139137 ?auto_139139 ) ) ( not ( = ?auto_139137 ?auto_139140 ) ) ( not ( = ?auto_139137 ?auto_139141 ) ) ( not ( = ?auto_139137 ?auto_139142 ) ) ( not ( = ?auto_139137 ?auto_139143 ) ) ( not ( = ?auto_139137 ?auto_139144 ) ) ( not ( = ?auto_139137 ?auto_139145 ) ) ( not ( = ?auto_139137 ?auto_139146 ) ) ( not ( = ?auto_139138 ?auto_139139 ) ) ( not ( = ?auto_139138 ?auto_139140 ) ) ( not ( = ?auto_139138 ?auto_139141 ) ) ( not ( = ?auto_139138 ?auto_139142 ) ) ( not ( = ?auto_139138 ?auto_139143 ) ) ( not ( = ?auto_139138 ?auto_139144 ) ) ( not ( = ?auto_139138 ?auto_139145 ) ) ( not ( = ?auto_139138 ?auto_139146 ) ) ( not ( = ?auto_139139 ?auto_139140 ) ) ( not ( = ?auto_139139 ?auto_139141 ) ) ( not ( = ?auto_139139 ?auto_139142 ) ) ( not ( = ?auto_139139 ?auto_139143 ) ) ( not ( = ?auto_139139 ?auto_139144 ) ) ( not ( = ?auto_139139 ?auto_139145 ) ) ( not ( = ?auto_139139 ?auto_139146 ) ) ( not ( = ?auto_139140 ?auto_139141 ) ) ( not ( = ?auto_139140 ?auto_139142 ) ) ( not ( = ?auto_139140 ?auto_139143 ) ) ( not ( = ?auto_139140 ?auto_139144 ) ) ( not ( = ?auto_139140 ?auto_139145 ) ) ( not ( = ?auto_139140 ?auto_139146 ) ) ( not ( = ?auto_139141 ?auto_139142 ) ) ( not ( = ?auto_139141 ?auto_139143 ) ) ( not ( = ?auto_139141 ?auto_139144 ) ) ( not ( = ?auto_139141 ?auto_139145 ) ) ( not ( = ?auto_139141 ?auto_139146 ) ) ( not ( = ?auto_139142 ?auto_139143 ) ) ( not ( = ?auto_139142 ?auto_139144 ) ) ( not ( = ?auto_139142 ?auto_139145 ) ) ( not ( = ?auto_139142 ?auto_139146 ) ) ( not ( = ?auto_139143 ?auto_139144 ) ) ( not ( = ?auto_139143 ?auto_139145 ) ) ( not ( = ?auto_139143 ?auto_139146 ) ) ( not ( = ?auto_139144 ?auto_139145 ) ) ( not ( = ?auto_139144 ?auto_139146 ) ) ( not ( = ?auto_139145 ?auto_139146 ) ) ( ON ?auto_139145 ?auto_139146 ) ( ON ?auto_139144 ?auto_139145 ) ( ON ?auto_139143 ?auto_139144 ) ( ON ?auto_139142 ?auto_139143 ) ( ON ?auto_139141 ?auto_139142 ) ( ON ?auto_139140 ?auto_139141 ) ( ON ?auto_139139 ?auto_139140 ) ( CLEAR ?auto_139137 ) ( ON ?auto_139138 ?auto_139139 ) ( CLEAR ?auto_139138 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_139136 ?auto_139137 ?auto_139138 )
      ( MAKE-11PILE ?auto_139136 ?auto_139137 ?auto_139138 ?auto_139139 ?auto_139140 ?auto_139141 ?auto_139142 ?auto_139143 ?auto_139144 ?auto_139145 ?auto_139146 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_139158 - BLOCK
      ?auto_139159 - BLOCK
      ?auto_139160 - BLOCK
      ?auto_139161 - BLOCK
      ?auto_139162 - BLOCK
      ?auto_139163 - BLOCK
      ?auto_139164 - BLOCK
      ?auto_139165 - BLOCK
      ?auto_139166 - BLOCK
      ?auto_139167 - BLOCK
      ?auto_139168 - BLOCK
    )
    :vars
    (
      ?auto_139169 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139168 ?auto_139169 ) ( ON-TABLE ?auto_139158 ) ( not ( = ?auto_139158 ?auto_139159 ) ) ( not ( = ?auto_139158 ?auto_139160 ) ) ( not ( = ?auto_139158 ?auto_139161 ) ) ( not ( = ?auto_139158 ?auto_139162 ) ) ( not ( = ?auto_139158 ?auto_139163 ) ) ( not ( = ?auto_139158 ?auto_139164 ) ) ( not ( = ?auto_139158 ?auto_139165 ) ) ( not ( = ?auto_139158 ?auto_139166 ) ) ( not ( = ?auto_139158 ?auto_139167 ) ) ( not ( = ?auto_139158 ?auto_139168 ) ) ( not ( = ?auto_139158 ?auto_139169 ) ) ( not ( = ?auto_139159 ?auto_139160 ) ) ( not ( = ?auto_139159 ?auto_139161 ) ) ( not ( = ?auto_139159 ?auto_139162 ) ) ( not ( = ?auto_139159 ?auto_139163 ) ) ( not ( = ?auto_139159 ?auto_139164 ) ) ( not ( = ?auto_139159 ?auto_139165 ) ) ( not ( = ?auto_139159 ?auto_139166 ) ) ( not ( = ?auto_139159 ?auto_139167 ) ) ( not ( = ?auto_139159 ?auto_139168 ) ) ( not ( = ?auto_139159 ?auto_139169 ) ) ( not ( = ?auto_139160 ?auto_139161 ) ) ( not ( = ?auto_139160 ?auto_139162 ) ) ( not ( = ?auto_139160 ?auto_139163 ) ) ( not ( = ?auto_139160 ?auto_139164 ) ) ( not ( = ?auto_139160 ?auto_139165 ) ) ( not ( = ?auto_139160 ?auto_139166 ) ) ( not ( = ?auto_139160 ?auto_139167 ) ) ( not ( = ?auto_139160 ?auto_139168 ) ) ( not ( = ?auto_139160 ?auto_139169 ) ) ( not ( = ?auto_139161 ?auto_139162 ) ) ( not ( = ?auto_139161 ?auto_139163 ) ) ( not ( = ?auto_139161 ?auto_139164 ) ) ( not ( = ?auto_139161 ?auto_139165 ) ) ( not ( = ?auto_139161 ?auto_139166 ) ) ( not ( = ?auto_139161 ?auto_139167 ) ) ( not ( = ?auto_139161 ?auto_139168 ) ) ( not ( = ?auto_139161 ?auto_139169 ) ) ( not ( = ?auto_139162 ?auto_139163 ) ) ( not ( = ?auto_139162 ?auto_139164 ) ) ( not ( = ?auto_139162 ?auto_139165 ) ) ( not ( = ?auto_139162 ?auto_139166 ) ) ( not ( = ?auto_139162 ?auto_139167 ) ) ( not ( = ?auto_139162 ?auto_139168 ) ) ( not ( = ?auto_139162 ?auto_139169 ) ) ( not ( = ?auto_139163 ?auto_139164 ) ) ( not ( = ?auto_139163 ?auto_139165 ) ) ( not ( = ?auto_139163 ?auto_139166 ) ) ( not ( = ?auto_139163 ?auto_139167 ) ) ( not ( = ?auto_139163 ?auto_139168 ) ) ( not ( = ?auto_139163 ?auto_139169 ) ) ( not ( = ?auto_139164 ?auto_139165 ) ) ( not ( = ?auto_139164 ?auto_139166 ) ) ( not ( = ?auto_139164 ?auto_139167 ) ) ( not ( = ?auto_139164 ?auto_139168 ) ) ( not ( = ?auto_139164 ?auto_139169 ) ) ( not ( = ?auto_139165 ?auto_139166 ) ) ( not ( = ?auto_139165 ?auto_139167 ) ) ( not ( = ?auto_139165 ?auto_139168 ) ) ( not ( = ?auto_139165 ?auto_139169 ) ) ( not ( = ?auto_139166 ?auto_139167 ) ) ( not ( = ?auto_139166 ?auto_139168 ) ) ( not ( = ?auto_139166 ?auto_139169 ) ) ( not ( = ?auto_139167 ?auto_139168 ) ) ( not ( = ?auto_139167 ?auto_139169 ) ) ( not ( = ?auto_139168 ?auto_139169 ) ) ( ON ?auto_139167 ?auto_139168 ) ( ON ?auto_139166 ?auto_139167 ) ( ON ?auto_139165 ?auto_139166 ) ( ON ?auto_139164 ?auto_139165 ) ( ON ?auto_139163 ?auto_139164 ) ( ON ?auto_139162 ?auto_139163 ) ( ON ?auto_139161 ?auto_139162 ) ( ON ?auto_139160 ?auto_139161 ) ( CLEAR ?auto_139158 ) ( ON ?auto_139159 ?auto_139160 ) ( CLEAR ?auto_139159 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_139158 ?auto_139159 )
      ( MAKE-11PILE ?auto_139158 ?auto_139159 ?auto_139160 ?auto_139161 ?auto_139162 ?auto_139163 ?auto_139164 ?auto_139165 ?auto_139166 ?auto_139167 ?auto_139168 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_139181 - BLOCK
      ?auto_139182 - BLOCK
      ?auto_139183 - BLOCK
      ?auto_139184 - BLOCK
      ?auto_139185 - BLOCK
      ?auto_139186 - BLOCK
      ?auto_139187 - BLOCK
      ?auto_139188 - BLOCK
      ?auto_139189 - BLOCK
      ?auto_139190 - BLOCK
      ?auto_139191 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_139191 ) ( ON-TABLE ?auto_139181 ) ( not ( = ?auto_139181 ?auto_139182 ) ) ( not ( = ?auto_139181 ?auto_139183 ) ) ( not ( = ?auto_139181 ?auto_139184 ) ) ( not ( = ?auto_139181 ?auto_139185 ) ) ( not ( = ?auto_139181 ?auto_139186 ) ) ( not ( = ?auto_139181 ?auto_139187 ) ) ( not ( = ?auto_139181 ?auto_139188 ) ) ( not ( = ?auto_139181 ?auto_139189 ) ) ( not ( = ?auto_139181 ?auto_139190 ) ) ( not ( = ?auto_139181 ?auto_139191 ) ) ( not ( = ?auto_139182 ?auto_139183 ) ) ( not ( = ?auto_139182 ?auto_139184 ) ) ( not ( = ?auto_139182 ?auto_139185 ) ) ( not ( = ?auto_139182 ?auto_139186 ) ) ( not ( = ?auto_139182 ?auto_139187 ) ) ( not ( = ?auto_139182 ?auto_139188 ) ) ( not ( = ?auto_139182 ?auto_139189 ) ) ( not ( = ?auto_139182 ?auto_139190 ) ) ( not ( = ?auto_139182 ?auto_139191 ) ) ( not ( = ?auto_139183 ?auto_139184 ) ) ( not ( = ?auto_139183 ?auto_139185 ) ) ( not ( = ?auto_139183 ?auto_139186 ) ) ( not ( = ?auto_139183 ?auto_139187 ) ) ( not ( = ?auto_139183 ?auto_139188 ) ) ( not ( = ?auto_139183 ?auto_139189 ) ) ( not ( = ?auto_139183 ?auto_139190 ) ) ( not ( = ?auto_139183 ?auto_139191 ) ) ( not ( = ?auto_139184 ?auto_139185 ) ) ( not ( = ?auto_139184 ?auto_139186 ) ) ( not ( = ?auto_139184 ?auto_139187 ) ) ( not ( = ?auto_139184 ?auto_139188 ) ) ( not ( = ?auto_139184 ?auto_139189 ) ) ( not ( = ?auto_139184 ?auto_139190 ) ) ( not ( = ?auto_139184 ?auto_139191 ) ) ( not ( = ?auto_139185 ?auto_139186 ) ) ( not ( = ?auto_139185 ?auto_139187 ) ) ( not ( = ?auto_139185 ?auto_139188 ) ) ( not ( = ?auto_139185 ?auto_139189 ) ) ( not ( = ?auto_139185 ?auto_139190 ) ) ( not ( = ?auto_139185 ?auto_139191 ) ) ( not ( = ?auto_139186 ?auto_139187 ) ) ( not ( = ?auto_139186 ?auto_139188 ) ) ( not ( = ?auto_139186 ?auto_139189 ) ) ( not ( = ?auto_139186 ?auto_139190 ) ) ( not ( = ?auto_139186 ?auto_139191 ) ) ( not ( = ?auto_139187 ?auto_139188 ) ) ( not ( = ?auto_139187 ?auto_139189 ) ) ( not ( = ?auto_139187 ?auto_139190 ) ) ( not ( = ?auto_139187 ?auto_139191 ) ) ( not ( = ?auto_139188 ?auto_139189 ) ) ( not ( = ?auto_139188 ?auto_139190 ) ) ( not ( = ?auto_139188 ?auto_139191 ) ) ( not ( = ?auto_139189 ?auto_139190 ) ) ( not ( = ?auto_139189 ?auto_139191 ) ) ( not ( = ?auto_139190 ?auto_139191 ) ) ( ON ?auto_139190 ?auto_139191 ) ( ON ?auto_139189 ?auto_139190 ) ( ON ?auto_139188 ?auto_139189 ) ( ON ?auto_139187 ?auto_139188 ) ( ON ?auto_139186 ?auto_139187 ) ( ON ?auto_139185 ?auto_139186 ) ( ON ?auto_139184 ?auto_139185 ) ( ON ?auto_139183 ?auto_139184 ) ( CLEAR ?auto_139181 ) ( ON ?auto_139182 ?auto_139183 ) ( CLEAR ?auto_139182 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_139181 ?auto_139182 )
      ( MAKE-11PILE ?auto_139181 ?auto_139182 ?auto_139183 ?auto_139184 ?auto_139185 ?auto_139186 ?auto_139187 ?auto_139188 ?auto_139189 ?auto_139190 ?auto_139191 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_139203 - BLOCK
      ?auto_139204 - BLOCK
      ?auto_139205 - BLOCK
      ?auto_139206 - BLOCK
      ?auto_139207 - BLOCK
      ?auto_139208 - BLOCK
      ?auto_139209 - BLOCK
      ?auto_139210 - BLOCK
      ?auto_139211 - BLOCK
      ?auto_139212 - BLOCK
      ?auto_139213 - BLOCK
    )
    :vars
    (
      ?auto_139214 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139213 ?auto_139214 ) ( not ( = ?auto_139203 ?auto_139204 ) ) ( not ( = ?auto_139203 ?auto_139205 ) ) ( not ( = ?auto_139203 ?auto_139206 ) ) ( not ( = ?auto_139203 ?auto_139207 ) ) ( not ( = ?auto_139203 ?auto_139208 ) ) ( not ( = ?auto_139203 ?auto_139209 ) ) ( not ( = ?auto_139203 ?auto_139210 ) ) ( not ( = ?auto_139203 ?auto_139211 ) ) ( not ( = ?auto_139203 ?auto_139212 ) ) ( not ( = ?auto_139203 ?auto_139213 ) ) ( not ( = ?auto_139203 ?auto_139214 ) ) ( not ( = ?auto_139204 ?auto_139205 ) ) ( not ( = ?auto_139204 ?auto_139206 ) ) ( not ( = ?auto_139204 ?auto_139207 ) ) ( not ( = ?auto_139204 ?auto_139208 ) ) ( not ( = ?auto_139204 ?auto_139209 ) ) ( not ( = ?auto_139204 ?auto_139210 ) ) ( not ( = ?auto_139204 ?auto_139211 ) ) ( not ( = ?auto_139204 ?auto_139212 ) ) ( not ( = ?auto_139204 ?auto_139213 ) ) ( not ( = ?auto_139204 ?auto_139214 ) ) ( not ( = ?auto_139205 ?auto_139206 ) ) ( not ( = ?auto_139205 ?auto_139207 ) ) ( not ( = ?auto_139205 ?auto_139208 ) ) ( not ( = ?auto_139205 ?auto_139209 ) ) ( not ( = ?auto_139205 ?auto_139210 ) ) ( not ( = ?auto_139205 ?auto_139211 ) ) ( not ( = ?auto_139205 ?auto_139212 ) ) ( not ( = ?auto_139205 ?auto_139213 ) ) ( not ( = ?auto_139205 ?auto_139214 ) ) ( not ( = ?auto_139206 ?auto_139207 ) ) ( not ( = ?auto_139206 ?auto_139208 ) ) ( not ( = ?auto_139206 ?auto_139209 ) ) ( not ( = ?auto_139206 ?auto_139210 ) ) ( not ( = ?auto_139206 ?auto_139211 ) ) ( not ( = ?auto_139206 ?auto_139212 ) ) ( not ( = ?auto_139206 ?auto_139213 ) ) ( not ( = ?auto_139206 ?auto_139214 ) ) ( not ( = ?auto_139207 ?auto_139208 ) ) ( not ( = ?auto_139207 ?auto_139209 ) ) ( not ( = ?auto_139207 ?auto_139210 ) ) ( not ( = ?auto_139207 ?auto_139211 ) ) ( not ( = ?auto_139207 ?auto_139212 ) ) ( not ( = ?auto_139207 ?auto_139213 ) ) ( not ( = ?auto_139207 ?auto_139214 ) ) ( not ( = ?auto_139208 ?auto_139209 ) ) ( not ( = ?auto_139208 ?auto_139210 ) ) ( not ( = ?auto_139208 ?auto_139211 ) ) ( not ( = ?auto_139208 ?auto_139212 ) ) ( not ( = ?auto_139208 ?auto_139213 ) ) ( not ( = ?auto_139208 ?auto_139214 ) ) ( not ( = ?auto_139209 ?auto_139210 ) ) ( not ( = ?auto_139209 ?auto_139211 ) ) ( not ( = ?auto_139209 ?auto_139212 ) ) ( not ( = ?auto_139209 ?auto_139213 ) ) ( not ( = ?auto_139209 ?auto_139214 ) ) ( not ( = ?auto_139210 ?auto_139211 ) ) ( not ( = ?auto_139210 ?auto_139212 ) ) ( not ( = ?auto_139210 ?auto_139213 ) ) ( not ( = ?auto_139210 ?auto_139214 ) ) ( not ( = ?auto_139211 ?auto_139212 ) ) ( not ( = ?auto_139211 ?auto_139213 ) ) ( not ( = ?auto_139211 ?auto_139214 ) ) ( not ( = ?auto_139212 ?auto_139213 ) ) ( not ( = ?auto_139212 ?auto_139214 ) ) ( not ( = ?auto_139213 ?auto_139214 ) ) ( ON ?auto_139212 ?auto_139213 ) ( ON ?auto_139211 ?auto_139212 ) ( ON ?auto_139210 ?auto_139211 ) ( ON ?auto_139209 ?auto_139210 ) ( ON ?auto_139208 ?auto_139209 ) ( ON ?auto_139207 ?auto_139208 ) ( ON ?auto_139206 ?auto_139207 ) ( ON ?auto_139205 ?auto_139206 ) ( ON ?auto_139204 ?auto_139205 ) ( ON ?auto_139203 ?auto_139204 ) ( CLEAR ?auto_139203 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_139203 )
      ( MAKE-11PILE ?auto_139203 ?auto_139204 ?auto_139205 ?auto_139206 ?auto_139207 ?auto_139208 ?auto_139209 ?auto_139210 ?auto_139211 ?auto_139212 ?auto_139213 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_139226 - BLOCK
      ?auto_139227 - BLOCK
      ?auto_139228 - BLOCK
      ?auto_139229 - BLOCK
      ?auto_139230 - BLOCK
      ?auto_139231 - BLOCK
      ?auto_139232 - BLOCK
      ?auto_139233 - BLOCK
      ?auto_139234 - BLOCK
      ?auto_139235 - BLOCK
      ?auto_139236 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_139236 ) ( not ( = ?auto_139226 ?auto_139227 ) ) ( not ( = ?auto_139226 ?auto_139228 ) ) ( not ( = ?auto_139226 ?auto_139229 ) ) ( not ( = ?auto_139226 ?auto_139230 ) ) ( not ( = ?auto_139226 ?auto_139231 ) ) ( not ( = ?auto_139226 ?auto_139232 ) ) ( not ( = ?auto_139226 ?auto_139233 ) ) ( not ( = ?auto_139226 ?auto_139234 ) ) ( not ( = ?auto_139226 ?auto_139235 ) ) ( not ( = ?auto_139226 ?auto_139236 ) ) ( not ( = ?auto_139227 ?auto_139228 ) ) ( not ( = ?auto_139227 ?auto_139229 ) ) ( not ( = ?auto_139227 ?auto_139230 ) ) ( not ( = ?auto_139227 ?auto_139231 ) ) ( not ( = ?auto_139227 ?auto_139232 ) ) ( not ( = ?auto_139227 ?auto_139233 ) ) ( not ( = ?auto_139227 ?auto_139234 ) ) ( not ( = ?auto_139227 ?auto_139235 ) ) ( not ( = ?auto_139227 ?auto_139236 ) ) ( not ( = ?auto_139228 ?auto_139229 ) ) ( not ( = ?auto_139228 ?auto_139230 ) ) ( not ( = ?auto_139228 ?auto_139231 ) ) ( not ( = ?auto_139228 ?auto_139232 ) ) ( not ( = ?auto_139228 ?auto_139233 ) ) ( not ( = ?auto_139228 ?auto_139234 ) ) ( not ( = ?auto_139228 ?auto_139235 ) ) ( not ( = ?auto_139228 ?auto_139236 ) ) ( not ( = ?auto_139229 ?auto_139230 ) ) ( not ( = ?auto_139229 ?auto_139231 ) ) ( not ( = ?auto_139229 ?auto_139232 ) ) ( not ( = ?auto_139229 ?auto_139233 ) ) ( not ( = ?auto_139229 ?auto_139234 ) ) ( not ( = ?auto_139229 ?auto_139235 ) ) ( not ( = ?auto_139229 ?auto_139236 ) ) ( not ( = ?auto_139230 ?auto_139231 ) ) ( not ( = ?auto_139230 ?auto_139232 ) ) ( not ( = ?auto_139230 ?auto_139233 ) ) ( not ( = ?auto_139230 ?auto_139234 ) ) ( not ( = ?auto_139230 ?auto_139235 ) ) ( not ( = ?auto_139230 ?auto_139236 ) ) ( not ( = ?auto_139231 ?auto_139232 ) ) ( not ( = ?auto_139231 ?auto_139233 ) ) ( not ( = ?auto_139231 ?auto_139234 ) ) ( not ( = ?auto_139231 ?auto_139235 ) ) ( not ( = ?auto_139231 ?auto_139236 ) ) ( not ( = ?auto_139232 ?auto_139233 ) ) ( not ( = ?auto_139232 ?auto_139234 ) ) ( not ( = ?auto_139232 ?auto_139235 ) ) ( not ( = ?auto_139232 ?auto_139236 ) ) ( not ( = ?auto_139233 ?auto_139234 ) ) ( not ( = ?auto_139233 ?auto_139235 ) ) ( not ( = ?auto_139233 ?auto_139236 ) ) ( not ( = ?auto_139234 ?auto_139235 ) ) ( not ( = ?auto_139234 ?auto_139236 ) ) ( not ( = ?auto_139235 ?auto_139236 ) ) ( ON ?auto_139235 ?auto_139236 ) ( ON ?auto_139234 ?auto_139235 ) ( ON ?auto_139233 ?auto_139234 ) ( ON ?auto_139232 ?auto_139233 ) ( ON ?auto_139231 ?auto_139232 ) ( ON ?auto_139230 ?auto_139231 ) ( ON ?auto_139229 ?auto_139230 ) ( ON ?auto_139228 ?auto_139229 ) ( ON ?auto_139227 ?auto_139228 ) ( ON ?auto_139226 ?auto_139227 ) ( CLEAR ?auto_139226 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_139226 )
      ( MAKE-11PILE ?auto_139226 ?auto_139227 ?auto_139228 ?auto_139229 ?auto_139230 ?auto_139231 ?auto_139232 ?auto_139233 ?auto_139234 ?auto_139235 ?auto_139236 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_139248 - BLOCK
      ?auto_139249 - BLOCK
      ?auto_139250 - BLOCK
      ?auto_139251 - BLOCK
      ?auto_139252 - BLOCK
      ?auto_139253 - BLOCK
      ?auto_139254 - BLOCK
      ?auto_139255 - BLOCK
      ?auto_139256 - BLOCK
      ?auto_139257 - BLOCK
      ?auto_139258 - BLOCK
    )
    :vars
    (
      ?auto_139259 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139248 ?auto_139249 ) ) ( not ( = ?auto_139248 ?auto_139250 ) ) ( not ( = ?auto_139248 ?auto_139251 ) ) ( not ( = ?auto_139248 ?auto_139252 ) ) ( not ( = ?auto_139248 ?auto_139253 ) ) ( not ( = ?auto_139248 ?auto_139254 ) ) ( not ( = ?auto_139248 ?auto_139255 ) ) ( not ( = ?auto_139248 ?auto_139256 ) ) ( not ( = ?auto_139248 ?auto_139257 ) ) ( not ( = ?auto_139248 ?auto_139258 ) ) ( not ( = ?auto_139249 ?auto_139250 ) ) ( not ( = ?auto_139249 ?auto_139251 ) ) ( not ( = ?auto_139249 ?auto_139252 ) ) ( not ( = ?auto_139249 ?auto_139253 ) ) ( not ( = ?auto_139249 ?auto_139254 ) ) ( not ( = ?auto_139249 ?auto_139255 ) ) ( not ( = ?auto_139249 ?auto_139256 ) ) ( not ( = ?auto_139249 ?auto_139257 ) ) ( not ( = ?auto_139249 ?auto_139258 ) ) ( not ( = ?auto_139250 ?auto_139251 ) ) ( not ( = ?auto_139250 ?auto_139252 ) ) ( not ( = ?auto_139250 ?auto_139253 ) ) ( not ( = ?auto_139250 ?auto_139254 ) ) ( not ( = ?auto_139250 ?auto_139255 ) ) ( not ( = ?auto_139250 ?auto_139256 ) ) ( not ( = ?auto_139250 ?auto_139257 ) ) ( not ( = ?auto_139250 ?auto_139258 ) ) ( not ( = ?auto_139251 ?auto_139252 ) ) ( not ( = ?auto_139251 ?auto_139253 ) ) ( not ( = ?auto_139251 ?auto_139254 ) ) ( not ( = ?auto_139251 ?auto_139255 ) ) ( not ( = ?auto_139251 ?auto_139256 ) ) ( not ( = ?auto_139251 ?auto_139257 ) ) ( not ( = ?auto_139251 ?auto_139258 ) ) ( not ( = ?auto_139252 ?auto_139253 ) ) ( not ( = ?auto_139252 ?auto_139254 ) ) ( not ( = ?auto_139252 ?auto_139255 ) ) ( not ( = ?auto_139252 ?auto_139256 ) ) ( not ( = ?auto_139252 ?auto_139257 ) ) ( not ( = ?auto_139252 ?auto_139258 ) ) ( not ( = ?auto_139253 ?auto_139254 ) ) ( not ( = ?auto_139253 ?auto_139255 ) ) ( not ( = ?auto_139253 ?auto_139256 ) ) ( not ( = ?auto_139253 ?auto_139257 ) ) ( not ( = ?auto_139253 ?auto_139258 ) ) ( not ( = ?auto_139254 ?auto_139255 ) ) ( not ( = ?auto_139254 ?auto_139256 ) ) ( not ( = ?auto_139254 ?auto_139257 ) ) ( not ( = ?auto_139254 ?auto_139258 ) ) ( not ( = ?auto_139255 ?auto_139256 ) ) ( not ( = ?auto_139255 ?auto_139257 ) ) ( not ( = ?auto_139255 ?auto_139258 ) ) ( not ( = ?auto_139256 ?auto_139257 ) ) ( not ( = ?auto_139256 ?auto_139258 ) ) ( not ( = ?auto_139257 ?auto_139258 ) ) ( ON ?auto_139248 ?auto_139259 ) ( not ( = ?auto_139258 ?auto_139259 ) ) ( not ( = ?auto_139257 ?auto_139259 ) ) ( not ( = ?auto_139256 ?auto_139259 ) ) ( not ( = ?auto_139255 ?auto_139259 ) ) ( not ( = ?auto_139254 ?auto_139259 ) ) ( not ( = ?auto_139253 ?auto_139259 ) ) ( not ( = ?auto_139252 ?auto_139259 ) ) ( not ( = ?auto_139251 ?auto_139259 ) ) ( not ( = ?auto_139250 ?auto_139259 ) ) ( not ( = ?auto_139249 ?auto_139259 ) ) ( not ( = ?auto_139248 ?auto_139259 ) ) ( ON ?auto_139249 ?auto_139248 ) ( ON ?auto_139250 ?auto_139249 ) ( ON ?auto_139251 ?auto_139250 ) ( ON ?auto_139252 ?auto_139251 ) ( ON ?auto_139253 ?auto_139252 ) ( ON ?auto_139254 ?auto_139253 ) ( ON ?auto_139255 ?auto_139254 ) ( ON ?auto_139256 ?auto_139255 ) ( ON ?auto_139257 ?auto_139256 ) ( ON ?auto_139258 ?auto_139257 ) ( CLEAR ?auto_139258 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_139258 ?auto_139257 ?auto_139256 ?auto_139255 ?auto_139254 ?auto_139253 ?auto_139252 ?auto_139251 ?auto_139250 ?auto_139249 ?auto_139248 )
      ( MAKE-11PILE ?auto_139248 ?auto_139249 ?auto_139250 ?auto_139251 ?auto_139252 ?auto_139253 ?auto_139254 ?auto_139255 ?auto_139256 ?auto_139257 ?auto_139258 ) )
  )

)
