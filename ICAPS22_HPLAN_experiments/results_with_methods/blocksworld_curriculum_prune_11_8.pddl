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
      ?auto_124085 - BLOCK
    )
    :vars
    (
      ?auto_124086 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124085 ?auto_124086 ) ( CLEAR ?auto_124085 ) ( HAND-EMPTY ) ( not ( = ?auto_124085 ?auto_124086 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_124085 ?auto_124086 )
      ( !PUTDOWN ?auto_124085 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_124092 - BLOCK
      ?auto_124093 - BLOCK
    )
    :vars
    (
      ?auto_124094 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_124092 ) ( ON ?auto_124093 ?auto_124094 ) ( CLEAR ?auto_124093 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_124092 ) ( not ( = ?auto_124092 ?auto_124093 ) ) ( not ( = ?auto_124092 ?auto_124094 ) ) ( not ( = ?auto_124093 ?auto_124094 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_124093 ?auto_124094 )
      ( !STACK ?auto_124093 ?auto_124092 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_124102 - BLOCK
      ?auto_124103 - BLOCK
    )
    :vars
    (
      ?auto_124104 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124103 ?auto_124104 ) ( not ( = ?auto_124102 ?auto_124103 ) ) ( not ( = ?auto_124102 ?auto_124104 ) ) ( not ( = ?auto_124103 ?auto_124104 ) ) ( ON ?auto_124102 ?auto_124103 ) ( CLEAR ?auto_124102 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_124102 )
      ( MAKE-2PILE ?auto_124102 ?auto_124103 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_124113 - BLOCK
      ?auto_124114 - BLOCK
      ?auto_124115 - BLOCK
    )
    :vars
    (
      ?auto_124116 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_124114 ) ( ON ?auto_124115 ?auto_124116 ) ( CLEAR ?auto_124115 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_124113 ) ( ON ?auto_124114 ?auto_124113 ) ( not ( = ?auto_124113 ?auto_124114 ) ) ( not ( = ?auto_124113 ?auto_124115 ) ) ( not ( = ?auto_124113 ?auto_124116 ) ) ( not ( = ?auto_124114 ?auto_124115 ) ) ( not ( = ?auto_124114 ?auto_124116 ) ) ( not ( = ?auto_124115 ?auto_124116 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_124115 ?auto_124116 )
      ( !STACK ?auto_124115 ?auto_124114 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_124127 - BLOCK
      ?auto_124128 - BLOCK
      ?auto_124129 - BLOCK
    )
    :vars
    (
      ?auto_124130 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124129 ?auto_124130 ) ( ON-TABLE ?auto_124127 ) ( not ( = ?auto_124127 ?auto_124128 ) ) ( not ( = ?auto_124127 ?auto_124129 ) ) ( not ( = ?auto_124127 ?auto_124130 ) ) ( not ( = ?auto_124128 ?auto_124129 ) ) ( not ( = ?auto_124128 ?auto_124130 ) ) ( not ( = ?auto_124129 ?auto_124130 ) ) ( CLEAR ?auto_124127 ) ( ON ?auto_124128 ?auto_124129 ) ( CLEAR ?auto_124128 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_124127 ?auto_124128 )
      ( MAKE-3PILE ?auto_124127 ?auto_124128 ?auto_124129 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_124141 - BLOCK
      ?auto_124142 - BLOCK
      ?auto_124143 - BLOCK
    )
    :vars
    (
      ?auto_124144 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124143 ?auto_124144 ) ( not ( = ?auto_124141 ?auto_124142 ) ) ( not ( = ?auto_124141 ?auto_124143 ) ) ( not ( = ?auto_124141 ?auto_124144 ) ) ( not ( = ?auto_124142 ?auto_124143 ) ) ( not ( = ?auto_124142 ?auto_124144 ) ) ( not ( = ?auto_124143 ?auto_124144 ) ) ( ON ?auto_124142 ?auto_124143 ) ( ON ?auto_124141 ?auto_124142 ) ( CLEAR ?auto_124141 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_124141 )
      ( MAKE-3PILE ?auto_124141 ?auto_124142 ?auto_124143 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_124156 - BLOCK
      ?auto_124157 - BLOCK
      ?auto_124158 - BLOCK
      ?auto_124159 - BLOCK
    )
    :vars
    (
      ?auto_124160 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_124158 ) ( ON ?auto_124159 ?auto_124160 ) ( CLEAR ?auto_124159 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_124156 ) ( ON ?auto_124157 ?auto_124156 ) ( ON ?auto_124158 ?auto_124157 ) ( not ( = ?auto_124156 ?auto_124157 ) ) ( not ( = ?auto_124156 ?auto_124158 ) ) ( not ( = ?auto_124156 ?auto_124159 ) ) ( not ( = ?auto_124156 ?auto_124160 ) ) ( not ( = ?auto_124157 ?auto_124158 ) ) ( not ( = ?auto_124157 ?auto_124159 ) ) ( not ( = ?auto_124157 ?auto_124160 ) ) ( not ( = ?auto_124158 ?auto_124159 ) ) ( not ( = ?auto_124158 ?auto_124160 ) ) ( not ( = ?auto_124159 ?auto_124160 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_124159 ?auto_124160 )
      ( !STACK ?auto_124159 ?auto_124158 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_124174 - BLOCK
      ?auto_124175 - BLOCK
      ?auto_124176 - BLOCK
      ?auto_124177 - BLOCK
    )
    :vars
    (
      ?auto_124178 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124177 ?auto_124178 ) ( ON-TABLE ?auto_124174 ) ( ON ?auto_124175 ?auto_124174 ) ( not ( = ?auto_124174 ?auto_124175 ) ) ( not ( = ?auto_124174 ?auto_124176 ) ) ( not ( = ?auto_124174 ?auto_124177 ) ) ( not ( = ?auto_124174 ?auto_124178 ) ) ( not ( = ?auto_124175 ?auto_124176 ) ) ( not ( = ?auto_124175 ?auto_124177 ) ) ( not ( = ?auto_124175 ?auto_124178 ) ) ( not ( = ?auto_124176 ?auto_124177 ) ) ( not ( = ?auto_124176 ?auto_124178 ) ) ( not ( = ?auto_124177 ?auto_124178 ) ) ( CLEAR ?auto_124175 ) ( ON ?auto_124176 ?auto_124177 ) ( CLEAR ?auto_124176 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_124174 ?auto_124175 ?auto_124176 )
      ( MAKE-4PILE ?auto_124174 ?auto_124175 ?auto_124176 ?auto_124177 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_124192 - BLOCK
      ?auto_124193 - BLOCK
      ?auto_124194 - BLOCK
      ?auto_124195 - BLOCK
    )
    :vars
    (
      ?auto_124196 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124195 ?auto_124196 ) ( ON-TABLE ?auto_124192 ) ( not ( = ?auto_124192 ?auto_124193 ) ) ( not ( = ?auto_124192 ?auto_124194 ) ) ( not ( = ?auto_124192 ?auto_124195 ) ) ( not ( = ?auto_124192 ?auto_124196 ) ) ( not ( = ?auto_124193 ?auto_124194 ) ) ( not ( = ?auto_124193 ?auto_124195 ) ) ( not ( = ?auto_124193 ?auto_124196 ) ) ( not ( = ?auto_124194 ?auto_124195 ) ) ( not ( = ?auto_124194 ?auto_124196 ) ) ( not ( = ?auto_124195 ?auto_124196 ) ) ( ON ?auto_124194 ?auto_124195 ) ( CLEAR ?auto_124192 ) ( ON ?auto_124193 ?auto_124194 ) ( CLEAR ?auto_124193 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_124192 ?auto_124193 )
      ( MAKE-4PILE ?auto_124192 ?auto_124193 ?auto_124194 ?auto_124195 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_124210 - BLOCK
      ?auto_124211 - BLOCK
      ?auto_124212 - BLOCK
      ?auto_124213 - BLOCK
    )
    :vars
    (
      ?auto_124214 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124213 ?auto_124214 ) ( not ( = ?auto_124210 ?auto_124211 ) ) ( not ( = ?auto_124210 ?auto_124212 ) ) ( not ( = ?auto_124210 ?auto_124213 ) ) ( not ( = ?auto_124210 ?auto_124214 ) ) ( not ( = ?auto_124211 ?auto_124212 ) ) ( not ( = ?auto_124211 ?auto_124213 ) ) ( not ( = ?auto_124211 ?auto_124214 ) ) ( not ( = ?auto_124212 ?auto_124213 ) ) ( not ( = ?auto_124212 ?auto_124214 ) ) ( not ( = ?auto_124213 ?auto_124214 ) ) ( ON ?auto_124212 ?auto_124213 ) ( ON ?auto_124211 ?auto_124212 ) ( ON ?auto_124210 ?auto_124211 ) ( CLEAR ?auto_124210 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_124210 )
      ( MAKE-4PILE ?auto_124210 ?auto_124211 ?auto_124212 ?auto_124213 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_124229 - BLOCK
      ?auto_124230 - BLOCK
      ?auto_124231 - BLOCK
      ?auto_124232 - BLOCK
      ?auto_124233 - BLOCK
    )
    :vars
    (
      ?auto_124234 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_124232 ) ( ON ?auto_124233 ?auto_124234 ) ( CLEAR ?auto_124233 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_124229 ) ( ON ?auto_124230 ?auto_124229 ) ( ON ?auto_124231 ?auto_124230 ) ( ON ?auto_124232 ?auto_124231 ) ( not ( = ?auto_124229 ?auto_124230 ) ) ( not ( = ?auto_124229 ?auto_124231 ) ) ( not ( = ?auto_124229 ?auto_124232 ) ) ( not ( = ?auto_124229 ?auto_124233 ) ) ( not ( = ?auto_124229 ?auto_124234 ) ) ( not ( = ?auto_124230 ?auto_124231 ) ) ( not ( = ?auto_124230 ?auto_124232 ) ) ( not ( = ?auto_124230 ?auto_124233 ) ) ( not ( = ?auto_124230 ?auto_124234 ) ) ( not ( = ?auto_124231 ?auto_124232 ) ) ( not ( = ?auto_124231 ?auto_124233 ) ) ( not ( = ?auto_124231 ?auto_124234 ) ) ( not ( = ?auto_124232 ?auto_124233 ) ) ( not ( = ?auto_124232 ?auto_124234 ) ) ( not ( = ?auto_124233 ?auto_124234 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_124233 ?auto_124234 )
      ( !STACK ?auto_124233 ?auto_124232 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_124251 - BLOCK
      ?auto_124252 - BLOCK
      ?auto_124253 - BLOCK
      ?auto_124254 - BLOCK
      ?auto_124255 - BLOCK
    )
    :vars
    (
      ?auto_124256 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124255 ?auto_124256 ) ( ON-TABLE ?auto_124251 ) ( ON ?auto_124252 ?auto_124251 ) ( ON ?auto_124253 ?auto_124252 ) ( not ( = ?auto_124251 ?auto_124252 ) ) ( not ( = ?auto_124251 ?auto_124253 ) ) ( not ( = ?auto_124251 ?auto_124254 ) ) ( not ( = ?auto_124251 ?auto_124255 ) ) ( not ( = ?auto_124251 ?auto_124256 ) ) ( not ( = ?auto_124252 ?auto_124253 ) ) ( not ( = ?auto_124252 ?auto_124254 ) ) ( not ( = ?auto_124252 ?auto_124255 ) ) ( not ( = ?auto_124252 ?auto_124256 ) ) ( not ( = ?auto_124253 ?auto_124254 ) ) ( not ( = ?auto_124253 ?auto_124255 ) ) ( not ( = ?auto_124253 ?auto_124256 ) ) ( not ( = ?auto_124254 ?auto_124255 ) ) ( not ( = ?auto_124254 ?auto_124256 ) ) ( not ( = ?auto_124255 ?auto_124256 ) ) ( CLEAR ?auto_124253 ) ( ON ?auto_124254 ?auto_124255 ) ( CLEAR ?auto_124254 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_124251 ?auto_124252 ?auto_124253 ?auto_124254 )
      ( MAKE-5PILE ?auto_124251 ?auto_124252 ?auto_124253 ?auto_124254 ?auto_124255 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_124273 - BLOCK
      ?auto_124274 - BLOCK
      ?auto_124275 - BLOCK
      ?auto_124276 - BLOCK
      ?auto_124277 - BLOCK
    )
    :vars
    (
      ?auto_124278 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124277 ?auto_124278 ) ( ON-TABLE ?auto_124273 ) ( ON ?auto_124274 ?auto_124273 ) ( not ( = ?auto_124273 ?auto_124274 ) ) ( not ( = ?auto_124273 ?auto_124275 ) ) ( not ( = ?auto_124273 ?auto_124276 ) ) ( not ( = ?auto_124273 ?auto_124277 ) ) ( not ( = ?auto_124273 ?auto_124278 ) ) ( not ( = ?auto_124274 ?auto_124275 ) ) ( not ( = ?auto_124274 ?auto_124276 ) ) ( not ( = ?auto_124274 ?auto_124277 ) ) ( not ( = ?auto_124274 ?auto_124278 ) ) ( not ( = ?auto_124275 ?auto_124276 ) ) ( not ( = ?auto_124275 ?auto_124277 ) ) ( not ( = ?auto_124275 ?auto_124278 ) ) ( not ( = ?auto_124276 ?auto_124277 ) ) ( not ( = ?auto_124276 ?auto_124278 ) ) ( not ( = ?auto_124277 ?auto_124278 ) ) ( ON ?auto_124276 ?auto_124277 ) ( CLEAR ?auto_124274 ) ( ON ?auto_124275 ?auto_124276 ) ( CLEAR ?auto_124275 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_124273 ?auto_124274 ?auto_124275 )
      ( MAKE-5PILE ?auto_124273 ?auto_124274 ?auto_124275 ?auto_124276 ?auto_124277 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_124295 - BLOCK
      ?auto_124296 - BLOCK
      ?auto_124297 - BLOCK
      ?auto_124298 - BLOCK
      ?auto_124299 - BLOCK
    )
    :vars
    (
      ?auto_124300 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124299 ?auto_124300 ) ( ON-TABLE ?auto_124295 ) ( not ( = ?auto_124295 ?auto_124296 ) ) ( not ( = ?auto_124295 ?auto_124297 ) ) ( not ( = ?auto_124295 ?auto_124298 ) ) ( not ( = ?auto_124295 ?auto_124299 ) ) ( not ( = ?auto_124295 ?auto_124300 ) ) ( not ( = ?auto_124296 ?auto_124297 ) ) ( not ( = ?auto_124296 ?auto_124298 ) ) ( not ( = ?auto_124296 ?auto_124299 ) ) ( not ( = ?auto_124296 ?auto_124300 ) ) ( not ( = ?auto_124297 ?auto_124298 ) ) ( not ( = ?auto_124297 ?auto_124299 ) ) ( not ( = ?auto_124297 ?auto_124300 ) ) ( not ( = ?auto_124298 ?auto_124299 ) ) ( not ( = ?auto_124298 ?auto_124300 ) ) ( not ( = ?auto_124299 ?auto_124300 ) ) ( ON ?auto_124298 ?auto_124299 ) ( ON ?auto_124297 ?auto_124298 ) ( CLEAR ?auto_124295 ) ( ON ?auto_124296 ?auto_124297 ) ( CLEAR ?auto_124296 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_124295 ?auto_124296 )
      ( MAKE-5PILE ?auto_124295 ?auto_124296 ?auto_124297 ?auto_124298 ?auto_124299 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_124317 - BLOCK
      ?auto_124318 - BLOCK
      ?auto_124319 - BLOCK
      ?auto_124320 - BLOCK
      ?auto_124321 - BLOCK
    )
    :vars
    (
      ?auto_124322 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124321 ?auto_124322 ) ( not ( = ?auto_124317 ?auto_124318 ) ) ( not ( = ?auto_124317 ?auto_124319 ) ) ( not ( = ?auto_124317 ?auto_124320 ) ) ( not ( = ?auto_124317 ?auto_124321 ) ) ( not ( = ?auto_124317 ?auto_124322 ) ) ( not ( = ?auto_124318 ?auto_124319 ) ) ( not ( = ?auto_124318 ?auto_124320 ) ) ( not ( = ?auto_124318 ?auto_124321 ) ) ( not ( = ?auto_124318 ?auto_124322 ) ) ( not ( = ?auto_124319 ?auto_124320 ) ) ( not ( = ?auto_124319 ?auto_124321 ) ) ( not ( = ?auto_124319 ?auto_124322 ) ) ( not ( = ?auto_124320 ?auto_124321 ) ) ( not ( = ?auto_124320 ?auto_124322 ) ) ( not ( = ?auto_124321 ?auto_124322 ) ) ( ON ?auto_124320 ?auto_124321 ) ( ON ?auto_124319 ?auto_124320 ) ( ON ?auto_124318 ?auto_124319 ) ( ON ?auto_124317 ?auto_124318 ) ( CLEAR ?auto_124317 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_124317 )
      ( MAKE-5PILE ?auto_124317 ?auto_124318 ?auto_124319 ?auto_124320 ?auto_124321 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_124340 - BLOCK
      ?auto_124341 - BLOCK
      ?auto_124342 - BLOCK
      ?auto_124343 - BLOCK
      ?auto_124344 - BLOCK
      ?auto_124345 - BLOCK
    )
    :vars
    (
      ?auto_124346 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_124344 ) ( ON ?auto_124345 ?auto_124346 ) ( CLEAR ?auto_124345 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_124340 ) ( ON ?auto_124341 ?auto_124340 ) ( ON ?auto_124342 ?auto_124341 ) ( ON ?auto_124343 ?auto_124342 ) ( ON ?auto_124344 ?auto_124343 ) ( not ( = ?auto_124340 ?auto_124341 ) ) ( not ( = ?auto_124340 ?auto_124342 ) ) ( not ( = ?auto_124340 ?auto_124343 ) ) ( not ( = ?auto_124340 ?auto_124344 ) ) ( not ( = ?auto_124340 ?auto_124345 ) ) ( not ( = ?auto_124340 ?auto_124346 ) ) ( not ( = ?auto_124341 ?auto_124342 ) ) ( not ( = ?auto_124341 ?auto_124343 ) ) ( not ( = ?auto_124341 ?auto_124344 ) ) ( not ( = ?auto_124341 ?auto_124345 ) ) ( not ( = ?auto_124341 ?auto_124346 ) ) ( not ( = ?auto_124342 ?auto_124343 ) ) ( not ( = ?auto_124342 ?auto_124344 ) ) ( not ( = ?auto_124342 ?auto_124345 ) ) ( not ( = ?auto_124342 ?auto_124346 ) ) ( not ( = ?auto_124343 ?auto_124344 ) ) ( not ( = ?auto_124343 ?auto_124345 ) ) ( not ( = ?auto_124343 ?auto_124346 ) ) ( not ( = ?auto_124344 ?auto_124345 ) ) ( not ( = ?auto_124344 ?auto_124346 ) ) ( not ( = ?auto_124345 ?auto_124346 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_124345 ?auto_124346 )
      ( !STACK ?auto_124345 ?auto_124344 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_124366 - BLOCK
      ?auto_124367 - BLOCK
      ?auto_124368 - BLOCK
      ?auto_124369 - BLOCK
      ?auto_124370 - BLOCK
      ?auto_124371 - BLOCK
    )
    :vars
    (
      ?auto_124372 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124371 ?auto_124372 ) ( ON-TABLE ?auto_124366 ) ( ON ?auto_124367 ?auto_124366 ) ( ON ?auto_124368 ?auto_124367 ) ( ON ?auto_124369 ?auto_124368 ) ( not ( = ?auto_124366 ?auto_124367 ) ) ( not ( = ?auto_124366 ?auto_124368 ) ) ( not ( = ?auto_124366 ?auto_124369 ) ) ( not ( = ?auto_124366 ?auto_124370 ) ) ( not ( = ?auto_124366 ?auto_124371 ) ) ( not ( = ?auto_124366 ?auto_124372 ) ) ( not ( = ?auto_124367 ?auto_124368 ) ) ( not ( = ?auto_124367 ?auto_124369 ) ) ( not ( = ?auto_124367 ?auto_124370 ) ) ( not ( = ?auto_124367 ?auto_124371 ) ) ( not ( = ?auto_124367 ?auto_124372 ) ) ( not ( = ?auto_124368 ?auto_124369 ) ) ( not ( = ?auto_124368 ?auto_124370 ) ) ( not ( = ?auto_124368 ?auto_124371 ) ) ( not ( = ?auto_124368 ?auto_124372 ) ) ( not ( = ?auto_124369 ?auto_124370 ) ) ( not ( = ?auto_124369 ?auto_124371 ) ) ( not ( = ?auto_124369 ?auto_124372 ) ) ( not ( = ?auto_124370 ?auto_124371 ) ) ( not ( = ?auto_124370 ?auto_124372 ) ) ( not ( = ?auto_124371 ?auto_124372 ) ) ( CLEAR ?auto_124369 ) ( ON ?auto_124370 ?auto_124371 ) ( CLEAR ?auto_124370 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_124366 ?auto_124367 ?auto_124368 ?auto_124369 ?auto_124370 )
      ( MAKE-6PILE ?auto_124366 ?auto_124367 ?auto_124368 ?auto_124369 ?auto_124370 ?auto_124371 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_124392 - BLOCK
      ?auto_124393 - BLOCK
      ?auto_124394 - BLOCK
      ?auto_124395 - BLOCK
      ?auto_124396 - BLOCK
      ?auto_124397 - BLOCK
    )
    :vars
    (
      ?auto_124398 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124397 ?auto_124398 ) ( ON-TABLE ?auto_124392 ) ( ON ?auto_124393 ?auto_124392 ) ( ON ?auto_124394 ?auto_124393 ) ( not ( = ?auto_124392 ?auto_124393 ) ) ( not ( = ?auto_124392 ?auto_124394 ) ) ( not ( = ?auto_124392 ?auto_124395 ) ) ( not ( = ?auto_124392 ?auto_124396 ) ) ( not ( = ?auto_124392 ?auto_124397 ) ) ( not ( = ?auto_124392 ?auto_124398 ) ) ( not ( = ?auto_124393 ?auto_124394 ) ) ( not ( = ?auto_124393 ?auto_124395 ) ) ( not ( = ?auto_124393 ?auto_124396 ) ) ( not ( = ?auto_124393 ?auto_124397 ) ) ( not ( = ?auto_124393 ?auto_124398 ) ) ( not ( = ?auto_124394 ?auto_124395 ) ) ( not ( = ?auto_124394 ?auto_124396 ) ) ( not ( = ?auto_124394 ?auto_124397 ) ) ( not ( = ?auto_124394 ?auto_124398 ) ) ( not ( = ?auto_124395 ?auto_124396 ) ) ( not ( = ?auto_124395 ?auto_124397 ) ) ( not ( = ?auto_124395 ?auto_124398 ) ) ( not ( = ?auto_124396 ?auto_124397 ) ) ( not ( = ?auto_124396 ?auto_124398 ) ) ( not ( = ?auto_124397 ?auto_124398 ) ) ( ON ?auto_124396 ?auto_124397 ) ( CLEAR ?auto_124394 ) ( ON ?auto_124395 ?auto_124396 ) ( CLEAR ?auto_124395 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_124392 ?auto_124393 ?auto_124394 ?auto_124395 )
      ( MAKE-6PILE ?auto_124392 ?auto_124393 ?auto_124394 ?auto_124395 ?auto_124396 ?auto_124397 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_124418 - BLOCK
      ?auto_124419 - BLOCK
      ?auto_124420 - BLOCK
      ?auto_124421 - BLOCK
      ?auto_124422 - BLOCK
      ?auto_124423 - BLOCK
    )
    :vars
    (
      ?auto_124424 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124423 ?auto_124424 ) ( ON-TABLE ?auto_124418 ) ( ON ?auto_124419 ?auto_124418 ) ( not ( = ?auto_124418 ?auto_124419 ) ) ( not ( = ?auto_124418 ?auto_124420 ) ) ( not ( = ?auto_124418 ?auto_124421 ) ) ( not ( = ?auto_124418 ?auto_124422 ) ) ( not ( = ?auto_124418 ?auto_124423 ) ) ( not ( = ?auto_124418 ?auto_124424 ) ) ( not ( = ?auto_124419 ?auto_124420 ) ) ( not ( = ?auto_124419 ?auto_124421 ) ) ( not ( = ?auto_124419 ?auto_124422 ) ) ( not ( = ?auto_124419 ?auto_124423 ) ) ( not ( = ?auto_124419 ?auto_124424 ) ) ( not ( = ?auto_124420 ?auto_124421 ) ) ( not ( = ?auto_124420 ?auto_124422 ) ) ( not ( = ?auto_124420 ?auto_124423 ) ) ( not ( = ?auto_124420 ?auto_124424 ) ) ( not ( = ?auto_124421 ?auto_124422 ) ) ( not ( = ?auto_124421 ?auto_124423 ) ) ( not ( = ?auto_124421 ?auto_124424 ) ) ( not ( = ?auto_124422 ?auto_124423 ) ) ( not ( = ?auto_124422 ?auto_124424 ) ) ( not ( = ?auto_124423 ?auto_124424 ) ) ( ON ?auto_124422 ?auto_124423 ) ( ON ?auto_124421 ?auto_124422 ) ( CLEAR ?auto_124419 ) ( ON ?auto_124420 ?auto_124421 ) ( CLEAR ?auto_124420 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_124418 ?auto_124419 ?auto_124420 )
      ( MAKE-6PILE ?auto_124418 ?auto_124419 ?auto_124420 ?auto_124421 ?auto_124422 ?auto_124423 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_124444 - BLOCK
      ?auto_124445 - BLOCK
      ?auto_124446 - BLOCK
      ?auto_124447 - BLOCK
      ?auto_124448 - BLOCK
      ?auto_124449 - BLOCK
    )
    :vars
    (
      ?auto_124450 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124449 ?auto_124450 ) ( ON-TABLE ?auto_124444 ) ( not ( = ?auto_124444 ?auto_124445 ) ) ( not ( = ?auto_124444 ?auto_124446 ) ) ( not ( = ?auto_124444 ?auto_124447 ) ) ( not ( = ?auto_124444 ?auto_124448 ) ) ( not ( = ?auto_124444 ?auto_124449 ) ) ( not ( = ?auto_124444 ?auto_124450 ) ) ( not ( = ?auto_124445 ?auto_124446 ) ) ( not ( = ?auto_124445 ?auto_124447 ) ) ( not ( = ?auto_124445 ?auto_124448 ) ) ( not ( = ?auto_124445 ?auto_124449 ) ) ( not ( = ?auto_124445 ?auto_124450 ) ) ( not ( = ?auto_124446 ?auto_124447 ) ) ( not ( = ?auto_124446 ?auto_124448 ) ) ( not ( = ?auto_124446 ?auto_124449 ) ) ( not ( = ?auto_124446 ?auto_124450 ) ) ( not ( = ?auto_124447 ?auto_124448 ) ) ( not ( = ?auto_124447 ?auto_124449 ) ) ( not ( = ?auto_124447 ?auto_124450 ) ) ( not ( = ?auto_124448 ?auto_124449 ) ) ( not ( = ?auto_124448 ?auto_124450 ) ) ( not ( = ?auto_124449 ?auto_124450 ) ) ( ON ?auto_124448 ?auto_124449 ) ( ON ?auto_124447 ?auto_124448 ) ( ON ?auto_124446 ?auto_124447 ) ( CLEAR ?auto_124444 ) ( ON ?auto_124445 ?auto_124446 ) ( CLEAR ?auto_124445 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_124444 ?auto_124445 )
      ( MAKE-6PILE ?auto_124444 ?auto_124445 ?auto_124446 ?auto_124447 ?auto_124448 ?auto_124449 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_124470 - BLOCK
      ?auto_124471 - BLOCK
      ?auto_124472 - BLOCK
      ?auto_124473 - BLOCK
      ?auto_124474 - BLOCK
      ?auto_124475 - BLOCK
    )
    :vars
    (
      ?auto_124476 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124475 ?auto_124476 ) ( not ( = ?auto_124470 ?auto_124471 ) ) ( not ( = ?auto_124470 ?auto_124472 ) ) ( not ( = ?auto_124470 ?auto_124473 ) ) ( not ( = ?auto_124470 ?auto_124474 ) ) ( not ( = ?auto_124470 ?auto_124475 ) ) ( not ( = ?auto_124470 ?auto_124476 ) ) ( not ( = ?auto_124471 ?auto_124472 ) ) ( not ( = ?auto_124471 ?auto_124473 ) ) ( not ( = ?auto_124471 ?auto_124474 ) ) ( not ( = ?auto_124471 ?auto_124475 ) ) ( not ( = ?auto_124471 ?auto_124476 ) ) ( not ( = ?auto_124472 ?auto_124473 ) ) ( not ( = ?auto_124472 ?auto_124474 ) ) ( not ( = ?auto_124472 ?auto_124475 ) ) ( not ( = ?auto_124472 ?auto_124476 ) ) ( not ( = ?auto_124473 ?auto_124474 ) ) ( not ( = ?auto_124473 ?auto_124475 ) ) ( not ( = ?auto_124473 ?auto_124476 ) ) ( not ( = ?auto_124474 ?auto_124475 ) ) ( not ( = ?auto_124474 ?auto_124476 ) ) ( not ( = ?auto_124475 ?auto_124476 ) ) ( ON ?auto_124474 ?auto_124475 ) ( ON ?auto_124473 ?auto_124474 ) ( ON ?auto_124472 ?auto_124473 ) ( ON ?auto_124471 ?auto_124472 ) ( ON ?auto_124470 ?auto_124471 ) ( CLEAR ?auto_124470 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_124470 )
      ( MAKE-6PILE ?auto_124470 ?auto_124471 ?auto_124472 ?auto_124473 ?auto_124474 ?auto_124475 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_124497 - BLOCK
      ?auto_124498 - BLOCK
      ?auto_124499 - BLOCK
      ?auto_124500 - BLOCK
      ?auto_124501 - BLOCK
      ?auto_124502 - BLOCK
      ?auto_124503 - BLOCK
    )
    :vars
    (
      ?auto_124504 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_124502 ) ( ON ?auto_124503 ?auto_124504 ) ( CLEAR ?auto_124503 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_124497 ) ( ON ?auto_124498 ?auto_124497 ) ( ON ?auto_124499 ?auto_124498 ) ( ON ?auto_124500 ?auto_124499 ) ( ON ?auto_124501 ?auto_124500 ) ( ON ?auto_124502 ?auto_124501 ) ( not ( = ?auto_124497 ?auto_124498 ) ) ( not ( = ?auto_124497 ?auto_124499 ) ) ( not ( = ?auto_124497 ?auto_124500 ) ) ( not ( = ?auto_124497 ?auto_124501 ) ) ( not ( = ?auto_124497 ?auto_124502 ) ) ( not ( = ?auto_124497 ?auto_124503 ) ) ( not ( = ?auto_124497 ?auto_124504 ) ) ( not ( = ?auto_124498 ?auto_124499 ) ) ( not ( = ?auto_124498 ?auto_124500 ) ) ( not ( = ?auto_124498 ?auto_124501 ) ) ( not ( = ?auto_124498 ?auto_124502 ) ) ( not ( = ?auto_124498 ?auto_124503 ) ) ( not ( = ?auto_124498 ?auto_124504 ) ) ( not ( = ?auto_124499 ?auto_124500 ) ) ( not ( = ?auto_124499 ?auto_124501 ) ) ( not ( = ?auto_124499 ?auto_124502 ) ) ( not ( = ?auto_124499 ?auto_124503 ) ) ( not ( = ?auto_124499 ?auto_124504 ) ) ( not ( = ?auto_124500 ?auto_124501 ) ) ( not ( = ?auto_124500 ?auto_124502 ) ) ( not ( = ?auto_124500 ?auto_124503 ) ) ( not ( = ?auto_124500 ?auto_124504 ) ) ( not ( = ?auto_124501 ?auto_124502 ) ) ( not ( = ?auto_124501 ?auto_124503 ) ) ( not ( = ?auto_124501 ?auto_124504 ) ) ( not ( = ?auto_124502 ?auto_124503 ) ) ( not ( = ?auto_124502 ?auto_124504 ) ) ( not ( = ?auto_124503 ?auto_124504 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_124503 ?auto_124504 )
      ( !STACK ?auto_124503 ?auto_124502 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_124527 - BLOCK
      ?auto_124528 - BLOCK
      ?auto_124529 - BLOCK
      ?auto_124530 - BLOCK
      ?auto_124531 - BLOCK
      ?auto_124532 - BLOCK
      ?auto_124533 - BLOCK
    )
    :vars
    (
      ?auto_124534 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124533 ?auto_124534 ) ( ON-TABLE ?auto_124527 ) ( ON ?auto_124528 ?auto_124527 ) ( ON ?auto_124529 ?auto_124528 ) ( ON ?auto_124530 ?auto_124529 ) ( ON ?auto_124531 ?auto_124530 ) ( not ( = ?auto_124527 ?auto_124528 ) ) ( not ( = ?auto_124527 ?auto_124529 ) ) ( not ( = ?auto_124527 ?auto_124530 ) ) ( not ( = ?auto_124527 ?auto_124531 ) ) ( not ( = ?auto_124527 ?auto_124532 ) ) ( not ( = ?auto_124527 ?auto_124533 ) ) ( not ( = ?auto_124527 ?auto_124534 ) ) ( not ( = ?auto_124528 ?auto_124529 ) ) ( not ( = ?auto_124528 ?auto_124530 ) ) ( not ( = ?auto_124528 ?auto_124531 ) ) ( not ( = ?auto_124528 ?auto_124532 ) ) ( not ( = ?auto_124528 ?auto_124533 ) ) ( not ( = ?auto_124528 ?auto_124534 ) ) ( not ( = ?auto_124529 ?auto_124530 ) ) ( not ( = ?auto_124529 ?auto_124531 ) ) ( not ( = ?auto_124529 ?auto_124532 ) ) ( not ( = ?auto_124529 ?auto_124533 ) ) ( not ( = ?auto_124529 ?auto_124534 ) ) ( not ( = ?auto_124530 ?auto_124531 ) ) ( not ( = ?auto_124530 ?auto_124532 ) ) ( not ( = ?auto_124530 ?auto_124533 ) ) ( not ( = ?auto_124530 ?auto_124534 ) ) ( not ( = ?auto_124531 ?auto_124532 ) ) ( not ( = ?auto_124531 ?auto_124533 ) ) ( not ( = ?auto_124531 ?auto_124534 ) ) ( not ( = ?auto_124532 ?auto_124533 ) ) ( not ( = ?auto_124532 ?auto_124534 ) ) ( not ( = ?auto_124533 ?auto_124534 ) ) ( CLEAR ?auto_124531 ) ( ON ?auto_124532 ?auto_124533 ) ( CLEAR ?auto_124532 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_124527 ?auto_124528 ?auto_124529 ?auto_124530 ?auto_124531 ?auto_124532 )
      ( MAKE-7PILE ?auto_124527 ?auto_124528 ?auto_124529 ?auto_124530 ?auto_124531 ?auto_124532 ?auto_124533 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_124557 - BLOCK
      ?auto_124558 - BLOCK
      ?auto_124559 - BLOCK
      ?auto_124560 - BLOCK
      ?auto_124561 - BLOCK
      ?auto_124562 - BLOCK
      ?auto_124563 - BLOCK
    )
    :vars
    (
      ?auto_124564 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124563 ?auto_124564 ) ( ON-TABLE ?auto_124557 ) ( ON ?auto_124558 ?auto_124557 ) ( ON ?auto_124559 ?auto_124558 ) ( ON ?auto_124560 ?auto_124559 ) ( not ( = ?auto_124557 ?auto_124558 ) ) ( not ( = ?auto_124557 ?auto_124559 ) ) ( not ( = ?auto_124557 ?auto_124560 ) ) ( not ( = ?auto_124557 ?auto_124561 ) ) ( not ( = ?auto_124557 ?auto_124562 ) ) ( not ( = ?auto_124557 ?auto_124563 ) ) ( not ( = ?auto_124557 ?auto_124564 ) ) ( not ( = ?auto_124558 ?auto_124559 ) ) ( not ( = ?auto_124558 ?auto_124560 ) ) ( not ( = ?auto_124558 ?auto_124561 ) ) ( not ( = ?auto_124558 ?auto_124562 ) ) ( not ( = ?auto_124558 ?auto_124563 ) ) ( not ( = ?auto_124558 ?auto_124564 ) ) ( not ( = ?auto_124559 ?auto_124560 ) ) ( not ( = ?auto_124559 ?auto_124561 ) ) ( not ( = ?auto_124559 ?auto_124562 ) ) ( not ( = ?auto_124559 ?auto_124563 ) ) ( not ( = ?auto_124559 ?auto_124564 ) ) ( not ( = ?auto_124560 ?auto_124561 ) ) ( not ( = ?auto_124560 ?auto_124562 ) ) ( not ( = ?auto_124560 ?auto_124563 ) ) ( not ( = ?auto_124560 ?auto_124564 ) ) ( not ( = ?auto_124561 ?auto_124562 ) ) ( not ( = ?auto_124561 ?auto_124563 ) ) ( not ( = ?auto_124561 ?auto_124564 ) ) ( not ( = ?auto_124562 ?auto_124563 ) ) ( not ( = ?auto_124562 ?auto_124564 ) ) ( not ( = ?auto_124563 ?auto_124564 ) ) ( ON ?auto_124562 ?auto_124563 ) ( CLEAR ?auto_124560 ) ( ON ?auto_124561 ?auto_124562 ) ( CLEAR ?auto_124561 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_124557 ?auto_124558 ?auto_124559 ?auto_124560 ?auto_124561 )
      ( MAKE-7PILE ?auto_124557 ?auto_124558 ?auto_124559 ?auto_124560 ?auto_124561 ?auto_124562 ?auto_124563 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_124587 - BLOCK
      ?auto_124588 - BLOCK
      ?auto_124589 - BLOCK
      ?auto_124590 - BLOCK
      ?auto_124591 - BLOCK
      ?auto_124592 - BLOCK
      ?auto_124593 - BLOCK
    )
    :vars
    (
      ?auto_124594 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124593 ?auto_124594 ) ( ON-TABLE ?auto_124587 ) ( ON ?auto_124588 ?auto_124587 ) ( ON ?auto_124589 ?auto_124588 ) ( not ( = ?auto_124587 ?auto_124588 ) ) ( not ( = ?auto_124587 ?auto_124589 ) ) ( not ( = ?auto_124587 ?auto_124590 ) ) ( not ( = ?auto_124587 ?auto_124591 ) ) ( not ( = ?auto_124587 ?auto_124592 ) ) ( not ( = ?auto_124587 ?auto_124593 ) ) ( not ( = ?auto_124587 ?auto_124594 ) ) ( not ( = ?auto_124588 ?auto_124589 ) ) ( not ( = ?auto_124588 ?auto_124590 ) ) ( not ( = ?auto_124588 ?auto_124591 ) ) ( not ( = ?auto_124588 ?auto_124592 ) ) ( not ( = ?auto_124588 ?auto_124593 ) ) ( not ( = ?auto_124588 ?auto_124594 ) ) ( not ( = ?auto_124589 ?auto_124590 ) ) ( not ( = ?auto_124589 ?auto_124591 ) ) ( not ( = ?auto_124589 ?auto_124592 ) ) ( not ( = ?auto_124589 ?auto_124593 ) ) ( not ( = ?auto_124589 ?auto_124594 ) ) ( not ( = ?auto_124590 ?auto_124591 ) ) ( not ( = ?auto_124590 ?auto_124592 ) ) ( not ( = ?auto_124590 ?auto_124593 ) ) ( not ( = ?auto_124590 ?auto_124594 ) ) ( not ( = ?auto_124591 ?auto_124592 ) ) ( not ( = ?auto_124591 ?auto_124593 ) ) ( not ( = ?auto_124591 ?auto_124594 ) ) ( not ( = ?auto_124592 ?auto_124593 ) ) ( not ( = ?auto_124592 ?auto_124594 ) ) ( not ( = ?auto_124593 ?auto_124594 ) ) ( ON ?auto_124592 ?auto_124593 ) ( ON ?auto_124591 ?auto_124592 ) ( CLEAR ?auto_124589 ) ( ON ?auto_124590 ?auto_124591 ) ( CLEAR ?auto_124590 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_124587 ?auto_124588 ?auto_124589 ?auto_124590 )
      ( MAKE-7PILE ?auto_124587 ?auto_124588 ?auto_124589 ?auto_124590 ?auto_124591 ?auto_124592 ?auto_124593 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_124617 - BLOCK
      ?auto_124618 - BLOCK
      ?auto_124619 - BLOCK
      ?auto_124620 - BLOCK
      ?auto_124621 - BLOCK
      ?auto_124622 - BLOCK
      ?auto_124623 - BLOCK
    )
    :vars
    (
      ?auto_124624 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124623 ?auto_124624 ) ( ON-TABLE ?auto_124617 ) ( ON ?auto_124618 ?auto_124617 ) ( not ( = ?auto_124617 ?auto_124618 ) ) ( not ( = ?auto_124617 ?auto_124619 ) ) ( not ( = ?auto_124617 ?auto_124620 ) ) ( not ( = ?auto_124617 ?auto_124621 ) ) ( not ( = ?auto_124617 ?auto_124622 ) ) ( not ( = ?auto_124617 ?auto_124623 ) ) ( not ( = ?auto_124617 ?auto_124624 ) ) ( not ( = ?auto_124618 ?auto_124619 ) ) ( not ( = ?auto_124618 ?auto_124620 ) ) ( not ( = ?auto_124618 ?auto_124621 ) ) ( not ( = ?auto_124618 ?auto_124622 ) ) ( not ( = ?auto_124618 ?auto_124623 ) ) ( not ( = ?auto_124618 ?auto_124624 ) ) ( not ( = ?auto_124619 ?auto_124620 ) ) ( not ( = ?auto_124619 ?auto_124621 ) ) ( not ( = ?auto_124619 ?auto_124622 ) ) ( not ( = ?auto_124619 ?auto_124623 ) ) ( not ( = ?auto_124619 ?auto_124624 ) ) ( not ( = ?auto_124620 ?auto_124621 ) ) ( not ( = ?auto_124620 ?auto_124622 ) ) ( not ( = ?auto_124620 ?auto_124623 ) ) ( not ( = ?auto_124620 ?auto_124624 ) ) ( not ( = ?auto_124621 ?auto_124622 ) ) ( not ( = ?auto_124621 ?auto_124623 ) ) ( not ( = ?auto_124621 ?auto_124624 ) ) ( not ( = ?auto_124622 ?auto_124623 ) ) ( not ( = ?auto_124622 ?auto_124624 ) ) ( not ( = ?auto_124623 ?auto_124624 ) ) ( ON ?auto_124622 ?auto_124623 ) ( ON ?auto_124621 ?auto_124622 ) ( ON ?auto_124620 ?auto_124621 ) ( CLEAR ?auto_124618 ) ( ON ?auto_124619 ?auto_124620 ) ( CLEAR ?auto_124619 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_124617 ?auto_124618 ?auto_124619 )
      ( MAKE-7PILE ?auto_124617 ?auto_124618 ?auto_124619 ?auto_124620 ?auto_124621 ?auto_124622 ?auto_124623 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_124647 - BLOCK
      ?auto_124648 - BLOCK
      ?auto_124649 - BLOCK
      ?auto_124650 - BLOCK
      ?auto_124651 - BLOCK
      ?auto_124652 - BLOCK
      ?auto_124653 - BLOCK
    )
    :vars
    (
      ?auto_124654 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124653 ?auto_124654 ) ( ON-TABLE ?auto_124647 ) ( not ( = ?auto_124647 ?auto_124648 ) ) ( not ( = ?auto_124647 ?auto_124649 ) ) ( not ( = ?auto_124647 ?auto_124650 ) ) ( not ( = ?auto_124647 ?auto_124651 ) ) ( not ( = ?auto_124647 ?auto_124652 ) ) ( not ( = ?auto_124647 ?auto_124653 ) ) ( not ( = ?auto_124647 ?auto_124654 ) ) ( not ( = ?auto_124648 ?auto_124649 ) ) ( not ( = ?auto_124648 ?auto_124650 ) ) ( not ( = ?auto_124648 ?auto_124651 ) ) ( not ( = ?auto_124648 ?auto_124652 ) ) ( not ( = ?auto_124648 ?auto_124653 ) ) ( not ( = ?auto_124648 ?auto_124654 ) ) ( not ( = ?auto_124649 ?auto_124650 ) ) ( not ( = ?auto_124649 ?auto_124651 ) ) ( not ( = ?auto_124649 ?auto_124652 ) ) ( not ( = ?auto_124649 ?auto_124653 ) ) ( not ( = ?auto_124649 ?auto_124654 ) ) ( not ( = ?auto_124650 ?auto_124651 ) ) ( not ( = ?auto_124650 ?auto_124652 ) ) ( not ( = ?auto_124650 ?auto_124653 ) ) ( not ( = ?auto_124650 ?auto_124654 ) ) ( not ( = ?auto_124651 ?auto_124652 ) ) ( not ( = ?auto_124651 ?auto_124653 ) ) ( not ( = ?auto_124651 ?auto_124654 ) ) ( not ( = ?auto_124652 ?auto_124653 ) ) ( not ( = ?auto_124652 ?auto_124654 ) ) ( not ( = ?auto_124653 ?auto_124654 ) ) ( ON ?auto_124652 ?auto_124653 ) ( ON ?auto_124651 ?auto_124652 ) ( ON ?auto_124650 ?auto_124651 ) ( ON ?auto_124649 ?auto_124650 ) ( CLEAR ?auto_124647 ) ( ON ?auto_124648 ?auto_124649 ) ( CLEAR ?auto_124648 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_124647 ?auto_124648 )
      ( MAKE-7PILE ?auto_124647 ?auto_124648 ?auto_124649 ?auto_124650 ?auto_124651 ?auto_124652 ?auto_124653 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_124677 - BLOCK
      ?auto_124678 - BLOCK
      ?auto_124679 - BLOCK
      ?auto_124680 - BLOCK
      ?auto_124681 - BLOCK
      ?auto_124682 - BLOCK
      ?auto_124683 - BLOCK
    )
    :vars
    (
      ?auto_124684 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124683 ?auto_124684 ) ( not ( = ?auto_124677 ?auto_124678 ) ) ( not ( = ?auto_124677 ?auto_124679 ) ) ( not ( = ?auto_124677 ?auto_124680 ) ) ( not ( = ?auto_124677 ?auto_124681 ) ) ( not ( = ?auto_124677 ?auto_124682 ) ) ( not ( = ?auto_124677 ?auto_124683 ) ) ( not ( = ?auto_124677 ?auto_124684 ) ) ( not ( = ?auto_124678 ?auto_124679 ) ) ( not ( = ?auto_124678 ?auto_124680 ) ) ( not ( = ?auto_124678 ?auto_124681 ) ) ( not ( = ?auto_124678 ?auto_124682 ) ) ( not ( = ?auto_124678 ?auto_124683 ) ) ( not ( = ?auto_124678 ?auto_124684 ) ) ( not ( = ?auto_124679 ?auto_124680 ) ) ( not ( = ?auto_124679 ?auto_124681 ) ) ( not ( = ?auto_124679 ?auto_124682 ) ) ( not ( = ?auto_124679 ?auto_124683 ) ) ( not ( = ?auto_124679 ?auto_124684 ) ) ( not ( = ?auto_124680 ?auto_124681 ) ) ( not ( = ?auto_124680 ?auto_124682 ) ) ( not ( = ?auto_124680 ?auto_124683 ) ) ( not ( = ?auto_124680 ?auto_124684 ) ) ( not ( = ?auto_124681 ?auto_124682 ) ) ( not ( = ?auto_124681 ?auto_124683 ) ) ( not ( = ?auto_124681 ?auto_124684 ) ) ( not ( = ?auto_124682 ?auto_124683 ) ) ( not ( = ?auto_124682 ?auto_124684 ) ) ( not ( = ?auto_124683 ?auto_124684 ) ) ( ON ?auto_124682 ?auto_124683 ) ( ON ?auto_124681 ?auto_124682 ) ( ON ?auto_124680 ?auto_124681 ) ( ON ?auto_124679 ?auto_124680 ) ( ON ?auto_124678 ?auto_124679 ) ( ON ?auto_124677 ?auto_124678 ) ( CLEAR ?auto_124677 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_124677 )
      ( MAKE-7PILE ?auto_124677 ?auto_124678 ?auto_124679 ?auto_124680 ?auto_124681 ?auto_124682 ?auto_124683 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_124708 - BLOCK
      ?auto_124709 - BLOCK
      ?auto_124710 - BLOCK
      ?auto_124711 - BLOCK
      ?auto_124712 - BLOCK
      ?auto_124713 - BLOCK
      ?auto_124714 - BLOCK
      ?auto_124715 - BLOCK
    )
    :vars
    (
      ?auto_124716 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_124714 ) ( ON ?auto_124715 ?auto_124716 ) ( CLEAR ?auto_124715 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_124708 ) ( ON ?auto_124709 ?auto_124708 ) ( ON ?auto_124710 ?auto_124709 ) ( ON ?auto_124711 ?auto_124710 ) ( ON ?auto_124712 ?auto_124711 ) ( ON ?auto_124713 ?auto_124712 ) ( ON ?auto_124714 ?auto_124713 ) ( not ( = ?auto_124708 ?auto_124709 ) ) ( not ( = ?auto_124708 ?auto_124710 ) ) ( not ( = ?auto_124708 ?auto_124711 ) ) ( not ( = ?auto_124708 ?auto_124712 ) ) ( not ( = ?auto_124708 ?auto_124713 ) ) ( not ( = ?auto_124708 ?auto_124714 ) ) ( not ( = ?auto_124708 ?auto_124715 ) ) ( not ( = ?auto_124708 ?auto_124716 ) ) ( not ( = ?auto_124709 ?auto_124710 ) ) ( not ( = ?auto_124709 ?auto_124711 ) ) ( not ( = ?auto_124709 ?auto_124712 ) ) ( not ( = ?auto_124709 ?auto_124713 ) ) ( not ( = ?auto_124709 ?auto_124714 ) ) ( not ( = ?auto_124709 ?auto_124715 ) ) ( not ( = ?auto_124709 ?auto_124716 ) ) ( not ( = ?auto_124710 ?auto_124711 ) ) ( not ( = ?auto_124710 ?auto_124712 ) ) ( not ( = ?auto_124710 ?auto_124713 ) ) ( not ( = ?auto_124710 ?auto_124714 ) ) ( not ( = ?auto_124710 ?auto_124715 ) ) ( not ( = ?auto_124710 ?auto_124716 ) ) ( not ( = ?auto_124711 ?auto_124712 ) ) ( not ( = ?auto_124711 ?auto_124713 ) ) ( not ( = ?auto_124711 ?auto_124714 ) ) ( not ( = ?auto_124711 ?auto_124715 ) ) ( not ( = ?auto_124711 ?auto_124716 ) ) ( not ( = ?auto_124712 ?auto_124713 ) ) ( not ( = ?auto_124712 ?auto_124714 ) ) ( not ( = ?auto_124712 ?auto_124715 ) ) ( not ( = ?auto_124712 ?auto_124716 ) ) ( not ( = ?auto_124713 ?auto_124714 ) ) ( not ( = ?auto_124713 ?auto_124715 ) ) ( not ( = ?auto_124713 ?auto_124716 ) ) ( not ( = ?auto_124714 ?auto_124715 ) ) ( not ( = ?auto_124714 ?auto_124716 ) ) ( not ( = ?auto_124715 ?auto_124716 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_124715 ?auto_124716 )
      ( !STACK ?auto_124715 ?auto_124714 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_124742 - BLOCK
      ?auto_124743 - BLOCK
      ?auto_124744 - BLOCK
      ?auto_124745 - BLOCK
      ?auto_124746 - BLOCK
      ?auto_124747 - BLOCK
      ?auto_124748 - BLOCK
      ?auto_124749 - BLOCK
    )
    :vars
    (
      ?auto_124750 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124749 ?auto_124750 ) ( ON-TABLE ?auto_124742 ) ( ON ?auto_124743 ?auto_124742 ) ( ON ?auto_124744 ?auto_124743 ) ( ON ?auto_124745 ?auto_124744 ) ( ON ?auto_124746 ?auto_124745 ) ( ON ?auto_124747 ?auto_124746 ) ( not ( = ?auto_124742 ?auto_124743 ) ) ( not ( = ?auto_124742 ?auto_124744 ) ) ( not ( = ?auto_124742 ?auto_124745 ) ) ( not ( = ?auto_124742 ?auto_124746 ) ) ( not ( = ?auto_124742 ?auto_124747 ) ) ( not ( = ?auto_124742 ?auto_124748 ) ) ( not ( = ?auto_124742 ?auto_124749 ) ) ( not ( = ?auto_124742 ?auto_124750 ) ) ( not ( = ?auto_124743 ?auto_124744 ) ) ( not ( = ?auto_124743 ?auto_124745 ) ) ( not ( = ?auto_124743 ?auto_124746 ) ) ( not ( = ?auto_124743 ?auto_124747 ) ) ( not ( = ?auto_124743 ?auto_124748 ) ) ( not ( = ?auto_124743 ?auto_124749 ) ) ( not ( = ?auto_124743 ?auto_124750 ) ) ( not ( = ?auto_124744 ?auto_124745 ) ) ( not ( = ?auto_124744 ?auto_124746 ) ) ( not ( = ?auto_124744 ?auto_124747 ) ) ( not ( = ?auto_124744 ?auto_124748 ) ) ( not ( = ?auto_124744 ?auto_124749 ) ) ( not ( = ?auto_124744 ?auto_124750 ) ) ( not ( = ?auto_124745 ?auto_124746 ) ) ( not ( = ?auto_124745 ?auto_124747 ) ) ( not ( = ?auto_124745 ?auto_124748 ) ) ( not ( = ?auto_124745 ?auto_124749 ) ) ( not ( = ?auto_124745 ?auto_124750 ) ) ( not ( = ?auto_124746 ?auto_124747 ) ) ( not ( = ?auto_124746 ?auto_124748 ) ) ( not ( = ?auto_124746 ?auto_124749 ) ) ( not ( = ?auto_124746 ?auto_124750 ) ) ( not ( = ?auto_124747 ?auto_124748 ) ) ( not ( = ?auto_124747 ?auto_124749 ) ) ( not ( = ?auto_124747 ?auto_124750 ) ) ( not ( = ?auto_124748 ?auto_124749 ) ) ( not ( = ?auto_124748 ?auto_124750 ) ) ( not ( = ?auto_124749 ?auto_124750 ) ) ( CLEAR ?auto_124747 ) ( ON ?auto_124748 ?auto_124749 ) ( CLEAR ?auto_124748 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_124742 ?auto_124743 ?auto_124744 ?auto_124745 ?auto_124746 ?auto_124747 ?auto_124748 )
      ( MAKE-8PILE ?auto_124742 ?auto_124743 ?auto_124744 ?auto_124745 ?auto_124746 ?auto_124747 ?auto_124748 ?auto_124749 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_124776 - BLOCK
      ?auto_124777 - BLOCK
      ?auto_124778 - BLOCK
      ?auto_124779 - BLOCK
      ?auto_124780 - BLOCK
      ?auto_124781 - BLOCK
      ?auto_124782 - BLOCK
      ?auto_124783 - BLOCK
    )
    :vars
    (
      ?auto_124784 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124783 ?auto_124784 ) ( ON-TABLE ?auto_124776 ) ( ON ?auto_124777 ?auto_124776 ) ( ON ?auto_124778 ?auto_124777 ) ( ON ?auto_124779 ?auto_124778 ) ( ON ?auto_124780 ?auto_124779 ) ( not ( = ?auto_124776 ?auto_124777 ) ) ( not ( = ?auto_124776 ?auto_124778 ) ) ( not ( = ?auto_124776 ?auto_124779 ) ) ( not ( = ?auto_124776 ?auto_124780 ) ) ( not ( = ?auto_124776 ?auto_124781 ) ) ( not ( = ?auto_124776 ?auto_124782 ) ) ( not ( = ?auto_124776 ?auto_124783 ) ) ( not ( = ?auto_124776 ?auto_124784 ) ) ( not ( = ?auto_124777 ?auto_124778 ) ) ( not ( = ?auto_124777 ?auto_124779 ) ) ( not ( = ?auto_124777 ?auto_124780 ) ) ( not ( = ?auto_124777 ?auto_124781 ) ) ( not ( = ?auto_124777 ?auto_124782 ) ) ( not ( = ?auto_124777 ?auto_124783 ) ) ( not ( = ?auto_124777 ?auto_124784 ) ) ( not ( = ?auto_124778 ?auto_124779 ) ) ( not ( = ?auto_124778 ?auto_124780 ) ) ( not ( = ?auto_124778 ?auto_124781 ) ) ( not ( = ?auto_124778 ?auto_124782 ) ) ( not ( = ?auto_124778 ?auto_124783 ) ) ( not ( = ?auto_124778 ?auto_124784 ) ) ( not ( = ?auto_124779 ?auto_124780 ) ) ( not ( = ?auto_124779 ?auto_124781 ) ) ( not ( = ?auto_124779 ?auto_124782 ) ) ( not ( = ?auto_124779 ?auto_124783 ) ) ( not ( = ?auto_124779 ?auto_124784 ) ) ( not ( = ?auto_124780 ?auto_124781 ) ) ( not ( = ?auto_124780 ?auto_124782 ) ) ( not ( = ?auto_124780 ?auto_124783 ) ) ( not ( = ?auto_124780 ?auto_124784 ) ) ( not ( = ?auto_124781 ?auto_124782 ) ) ( not ( = ?auto_124781 ?auto_124783 ) ) ( not ( = ?auto_124781 ?auto_124784 ) ) ( not ( = ?auto_124782 ?auto_124783 ) ) ( not ( = ?auto_124782 ?auto_124784 ) ) ( not ( = ?auto_124783 ?auto_124784 ) ) ( ON ?auto_124782 ?auto_124783 ) ( CLEAR ?auto_124780 ) ( ON ?auto_124781 ?auto_124782 ) ( CLEAR ?auto_124781 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_124776 ?auto_124777 ?auto_124778 ?auto_124779 ?auto_124780 ?auto_124781 )
      ( MAKE-8PILE ?auto_124776 ?auto_124777 ?auto_124778 ?auto_124779 ?auto_124780 ?auto_124781 ?auto_124782 ?auto_124783 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_124810 - BLOCK
      ?auto_124811 - BLOCK
      ?auto_124812 - BLOCK
      ?auto_124813 - BLOCK
      ?auto_124814 - BLOCK
      ?auto_124815 - BLOCK
      ?auto_124816 - BLOCK
      ?auto_124817 - BLOCK
    )
    :vars
    (
      ?auto_124818 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124817 ?auto_124818 ) ( ON-TABLE ?auto_124810 ) ( ON ?auto_124811 ?auto_124810 ) ( ON ?auto_124812 ?auto_124811 ) ( ON ?auto_124813 ?auto_124812 ) ( not ( = ?auto_124810 ?auto_124811 ) ) ( not ( = ?auto_124810 ?auto_124812 ) ) ( not ( = ?auto_124810 ?auto_124813 ) ) ( not ( = ?auto_124810 ?auto_124814 ) ) ( not ( = ?auto_124810 ?auto_124815 ) ) ( not ( = ?auto_124810 ?auto_124816 ) ) ( not ( = ?auto_124810 ?auto_124817 ) ) ( not ( = ?auto_124810 ?auto_124818 ) ) ( not ( = ?auto_124811 ?auto_124812 ) ) ( not ( = ?auto_124811 ?auto_124813 ) ) ( not ( = ?auto_124811 ?auto_124814 ) ) ( not ( = ?auto_124811 ?auto_124815 ) ) ( not ( = ?auto_124811 ?auto_124816 ) ) ( not ( = ?auto_124811 ?auto_124817 ) ) ( not ( = ?auto_124811 ?auto_124818 ) ) ( not ( = ?auto_124812 ?auto_124813 ) ) ( not ( = ?auto_124812 ?auto_124814 ) ) ( not ( = ?auto_124812 ?auto_124815 ) ) ( not ( = ?auto_124812 ?auto_124816 ) ) ( not ( = ?auto_124812 ?auto_124817 ) ) ( not ( = ?auto_124812 ?auto_124818 ) ) ( not ( = ?auto_124813 ?auto_124814 ) ) ( not ( = ?auto_124813 ?auto_124815 ) ) ( not ( = ?auto_124813 ?auto_124816 ) ) ( not ( = ?auto_124813 ?auto_124817 ) ) ( not ( = ?auto_124813 ?auto_124818 ) ) ( not ( = ?auto_124814 ?auto_124815 ) ) ( not ( = ?auto_124814 ?auto_124816 ) ) ( not ( = ?auto_124814 ?auto_124817 ) ) ( not ( = ?auto_124814 ?auto_124818 ) ) ( not ( = ?auto_124815 ?auto_124816 ) ) ( not ( = ?auto_124815 ?auto_124817 ) ) ( not ( = ?auto_124815 ?auto_124818 ) ) ( not ( = ?auto_124816 ?auto_124817 ) ) ( not ( = ?auto_124816 ?auto_124818 ) ) ( not ( = ?auto_124817 ?auto_124818 ) ) ( ON ?auto_124816 ?auto_124817 ) ( ON ?auto_124815 ?auto_124816 ) ( CLEAR ?auto_124813 ) ( ON ?auto_124814 ?auto_124815 ) ( CLEAR ?auto_124814 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_124810 ?auto_124811 ?auto_124812 ?auto_124813 ?auto_124814 )
      ( MAKE-8PILE ?auto_124810 ?auto_124811 ?auto_124812 ?auto_124813 ?auto_124814 ?auto_124815 ?auto_124816 ?auto_124817 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_124844 - BLOCK
      ?auto_124845 - BLOCK
      ?auto_124846 - BLOCK
      ?auto_124847 - BLOCK
      ?auto_124848 - BLOCK
      ?auto_124849 - BLOCK
      ?auto_124850 - BLOCK
      ?auto_124851 - BLOCK
    )
    :vars
    (
      ?auto_124852 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124851 ?auto_124852 ) ( ON-TABLE ?auto_124844 ) ( ON ?auto_124845 ?auto_124844 ) ( ON ?auto_124846 ?auto_124845 ) ( not ( = ?auto_124844 ?auto_124845 ) ) ( not ( = ?auto_124844 ?auto_124846 ) ) ( not ( = ?auto_124844 ?auto_124847 ) ) ( not ( = ?auto_124844 ?auto_124848 ) ) ( not ( = ?auto_124844 ?auto_124849 ) ) ( not ( = ?auto_124844 ?auto_124850 ) ) ( not ( = ?auto_124844 ?auto_124851 ) ) ( not ( = ?auto_124844 ?auto_124852 ) ) ( not ( = ?auto_124845 ?auto_124846 ) ) ( not ( = ?auto_124845 ?auto_124847 ) ) ( not ( = ?auto_124845 ?auto_124848 ) ) ( not ( = ?auto_124845 ?auto_124849 ) ) ( not ( = ?auto_124845 ?auto_124850 ) ) ( not ( = ?auto_124845 ?auto_124851 ) ) ( not ( = ?auto_124845 ?auto_124852 ) ) ( not ( = ?auto_124846 ?auto_124847 ) ) ( not ( = ?auto_124846 ?auto_124848 ) ) ( not ( = ?auto_124846 ?auto_124849 ) ) ( not ( = ?auto_124846 ?auto_124850 ) ) ( not ( = ?auto_124846 ?auto_124851 ) ) ( not ( = ?auto_124846 ?auto_124852 ) ) ( not ( = ?auto_124847 ?auto_124848 ) ) ( not ( = ?auto_124847 ?auto_124849 ) ) ( not ( = ?auto_124847 ?auto_124850 ) ) ( not ( = ?auto_124847 ?auto_124851 ) ) ( not ( = ?auto_124847 ?auto_124852 ) ) ( not ( = ?auto_124848 ?auto_124849 ) ) ( not ( = ?auto_124848 ?auto_124850 ) ) ( not ( = ?auto_124848 ?auto_124851 ) ) ( not ( = ?auto_124848 ?auto_124852 ) ) ( not ( = ?auto_124849 ?auto_124850 ) ) ( not ( = ?auto_124849 ?auto_124851 ) ) ( not ( = ?auto_124849 ?auto_124852 ) ) ( not ( = ?auto_124850 ?auto_124851 ) ) ( not ( = ?auto_124850 ?auto_124852 ) ) ( not ( = ?auto_124851 ?auto_124852 ) ) ( ON ?auto_124850 ?auto_124851 ) ( ON ?auto_124849 ?auto_124850 ) ( ON ?auto_124848 ?auto_124849 ) ( CLEAR ?auto_124846 ) ( ON ?auto_124847 ?auto_124848 ) ( CLEAR ?auto_124847 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_124844 ?auto_124845 ?auto_124846 ?auto_124847 )
      ( MAKE-8PILE ?auto_124844 ?auto_124845 ?auto_124846 ?auto_124847 ?auto_124848 ?auto_124849 ?auto_124850 ?auto_124851 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_124878 - BLOCK
      ?auto_124879 - BLOCK
      ?auto_124880 - BLOCK
      ?auto_124881 - BLOCK
      ?auto_124882 - BLOCK
      ?auto_124883 - BLOCK
      ?auto_124884 - BLOCK
      ?auto_124885 - BLOCK
    )
    :vars
    (
      ?auto_124886 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124885 ?auto_124886 ) ( ON-TABLE ?auto_124878 ) ( ON ?auto_124879 ?auto_124878 ) ( not ( = ?auto_124878 ?auto_124879 ) ) ( not ( = ?auto_124878 ?auto_124880 ) ) ( not ( = ?auto_124878 ?auto_124881 ) ) ( not ( = ?auto_124878 ?auto_124882 ) ) ( not ( = ?auto_124878 ?auto_124883 ) ) ( not ( = ?auto_124878 ?auto_124884 ) ) ( not ( = ?auto_124878 ?auto_124885 ) ) ( not ( = ?auto_124878 ?auto_124886 ) ) ( not ( = ?auto_124879 ?auto_124880 ) ) ( not ( = ?auto_124879 ?auto_124881 ) ) ( not ( = ?auto_124879 ?auto_124882 ) ) ( not ( = ?auto_124879 ?auto_124883 ) ) ( not ( = ?auto_124879 ?auto_124884 ) ) ( not ( = ?auto_124879 ?auto_124885 ) ) ( not ( = ?auto_124879 ?auto_124886 ) ) ( not ( = ?auto_124880 ?auto_124881 ) ) ( not ( = ?auto_124880 ?auto_124882 ) ) ( not ( = ?auto_124880 ?auto_124883 ) ) ( not ( = ?auto_124880 ?auto_124884 ) ) ( not ( = ?auto_124880 ?auto_124885 ) ) ( not ( = ?auto_124880 ?auto_124886 ) ) ( not ( = ?auto_124881 ?auto_124882 ) ) ( not ( = ?auto_124881 ?auto_124883 ) ) ( not ( = ?auto_124881 ?auto_124884 ) ) ( not ( = ?auto_124881 ?auto_124885 ) ) ( not ( = ?auto_124881 ?auto_124886 ) ) ( not ( = ?auto_124882 ?auto_124883 ) ) ( not ( = ?auto_124882 ?auto_124884 ) ) ( not ( = ?auto_124882 ?auto_124885 ) ) ( not ( = ?auto_124882 ?auto_124886 ) ) ( not ( = ?auto_124883 ?auto_124884 ) ) ( not ( = ?auto_124883 ?auto_124885 ) ) ( not ( = ?auto_124883 ?auto_124886 ) ) ( not ( = ?auto_124884 ?auto_124885 ) ) ( not ( = ?auto_124884 ?auto_124886 ) ) ( not ( = ?auto_124885 ?auto_124886 ) ) ( ON ?auto_124884 ?auto_124885 ) ( ON ?auto_124883 ?auto_124884 ) ( ON ?auto_124882 ?auto_124883 ) ( ON ?auto_124881 ?auto_124882 ) ( CLEAR ?auto_124879 ) ( ON ?auto_124880 ?auto_124881 ) ( CLEAR ?auto_124880 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_124878 ?auto_124879 ?auto_124880 )
      ( MAKE-8PILE ?auto_124878 ?auto_124879 ?auto_124880 ?auto_124881 ?auto_124882 ?auto_124883 ?auto_124884 ?auto_124885 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_124912 - BLOCK
      ?auto_124913 - BLOCK
      ?auto_124914 - BLOCK
      ?auto_124915 - BLOCK
      ?auto_124916 - BLOCK
      ?auto_124917 - BLOCK
      ?auto_124918 - BLOCK
      ?auto_124919 - BLOCK
    )
    :vars
    (
      ?auto_124920 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124919 ?auto_124920 ) ( ON-TABLE ?auto_124912 ) ( not ( = ?auto_124912 ?auto_124913 ) ) ( not ( = ?auto_124912 ?auto_124914 ) ) ( not ( = ?auto_124912 ?auto_124915 ) ) ( not ( = ?auto_124912 ?auto_124916 ) ) ( not ( = ?auto_124912 ?auto_124917 ) ) ( not ( = ?auto_124912 ?auto_124918 ) ) ( not ( = ?auto_124912 ?auto_124919 ) ) ( not ( = ?auto_124912 ?auto_124920 ) ) ( not ( = ?auto_124913 ?auto_124914 ) ) ( not ( = ?auto_124913 ?auto_124915 ) ) ( not ( = ?auto_124913 ?auto_124916 ) ) ( not ( = ?auto_124913 ?auto_124917 ) ) ( not ( = ?auto_124913 ?auto_124918 ) ) ( not ( = ?auto_124913 ?auto_124919 ) ) ( not ( = ?auto_124913 ?auto_124920 ) ) ( not ( = ?auto_124914 ?auto_124915 ) ) ( not ( = ?auto_124914 ?auto_124916 ) ) ( not ( = ?auto_124914 ?auto_124917 ) ) ( not ( = ?auto_124914 ?auto_124918 ) ) ( not ( = ?auto_124914 ?auto_124919 ) ) ( not ( = ?auto_124914 ?auto_124920 ) ) ( not ( = ?auto_124915 ?auto_124916 ) ) ( not ( = ?auto_124915 ?auto_124917 ) ) ( not ( = ?auto_124915 ?auto_124918 ) ) ( not ( = ?auto_124915 ?auto_124919 ) ) ( not ( = ?auto_124915 ?auto_124920 ) ) ( not ( = ?auto_124916 ?auto_124917 ) ) ( not ( = ?auto_124916 ?auto_124918 ) ) ( not ( = ?auto_124916 ?auto_124919 ) ) ( not ( = ?auto_124916 ?auto_124920 ) ) ( not ( = ?auto_124917 ?auto_124918 ) ) ( not ( = ?auto_124917 ?auto_124919 ) ) ( not ( = ?auto_124917 ?auto_124920 ) ) ( not ( = ?auto_124918 ?auto_124919 ) ) ( not ( = ?auto_124918 ?auto_124920 ) ) ( not ( = ?auto_124919 ?auto_124920 ) ) ( ON ?auto_124918 ?auto_124919 ) ( ON ?auto_124917 ?auto_124918 ) ( ON ?auto_124916 ?auto_124917 ) ( ON ?auto_124915 ?auto_124916 ) ( ON ?auto_124914 ?auto_124915 ) ( CLEAR ?auto_124912 ) ( ON ?auto_124913 ?auto_124914 ) ( CLEAR ?auto_124913 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_124912 ?auto_124913 )
      ( MAKE-8PILE ?auto_124912 ?auto_124913 ?auto_124914 ?auto_124915 ?auto_124916 ?auto_124917 ?auto_124918 ?auto_124919 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_124946 - BLOCK
      ?auto_124947 - BLOCK
      ?auto_124948 - BLOCK
      ?auto_124949 - BLOCK
      ?auto_124950 - BLOCK
      ?auto_124951 - BLOCK
      ?auto_124952 - BLOCK
      ?auto_124953 - BLOCK
    )
    :vars
    (
      ?auto_124954 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124953 ?auto_124954 ) ( not ( = ?auto_124946 ?auto_124947 ) ) ( not ( = ?auto_124946 ?auto_124948 ) ) ( not ( = ?auto_124946 ?auto_124949 ) ) ( not ( = ?auto_124946 ?auto_124950 ) ) ( not ( = ?auto_124946 ?auto_124951 ) ) ( not ( = ?auto_124946 ?auto_124952 ) ) ( not ( = ?auto_124946 ?auto_124953 ) ) ( not ( = ?auto_124946 ?auto_124954 ) ) ( not ( = ?auto_124947 ?auto_124948 ) ) ( not ( = ?auto_124947 ?auto_124949 ) ) ( not ( = ?auto_124947 ?auto_124950 ) ) ( not ( = ?auto_124947 ?auto_124951 ) ) ( not ( = ?auto_124947 ?auto_124952 ) ) ( not ( = ?auto_124947 ?auto_124953 ) ) ( not ( = ?auto_124947 ?auto_124954 ) ) ( not ( = ?auto_124948 ?auto_124949 ) ) ( not ( = ?auto_124948 ?auto_124950 ) ) ( not ( = ?auto_124948 ?auto_124951 ) ) ( not ( = ?auto_124948 ?auto_124952 ) ) ( not ( = ?auto_124948 ?auto_124953 ) ) ( not ( = ?auto_124948 ?auto_124954 ) ) ( not ( = ?auto_124949 ?auto_124950 ) ) ( not ( = ?auto_124949 ?auto_124951 ) ) ( not ( = ?auto_124949 ?auto_124952 ) ) ( not ( = ?auto_124949 ?auto_124953 ) ) ( not ( = ?auto_124949 ?auto_124954 ) ) ( not ( = ?auto_124950 ?auto_124951 ) ) ( not ( = ?auto_124950 ?auto_124952 ) ) ( not ( = ?auto_124950 ?auto_124953 ) ) ( not ( = ?auto_124950 ?auto_124954 ) ) ( not ( = ?auto_124951 ?auto_124952 ) ) ( not ( = ?auto_124951 ?auto_124953 ) ) ( not ( = ?auto_124951 ?auto_124954 ) ) ( not ( = ?auto_124952 ?auto_124953 ) ) ( not ( = ?auto_124952 ?auto_124954 ) ) ( not ( = ?auto_124953 ?auto_124954 ) ) ( ON ?auto_124952 ?auto_124953 ) ( ON ?auto_124951 ?auto_124952 ) ( ON ?auto_124950 ?auto_124951 ) ( ON ?auto_124949 ?auto_124950 ) ( ON ?auto_124948 ?auto_124949 ) ( ON ?auto_124947 ?auto_124948 ) ( ON ?auto_124946 ?auto_124947 ) ( CLEAR ?auto_124946 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_124946 )
      ( MAKE-8PILE ?auto_124946 ?auto_124947 ?auto_124948 ?auto_124949 ?auto_124950 ?auto_124951 ?auto_124952 ?auto_124953 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_124981 - BLOCK
      ?auto_124982 - BLOCK
      ?auto_124983 - BLOCK
      ?auto_124984 - BLOCK
      ?auto_124985 - BLOCK
      ?auto_124986 - BLOCK
      ?auto_124987 - BLOCK
      ?auto_124988 - BLOCK
      ?auto_124989 - BLOCK
    )
    :vars
    (
      ?auto_124990 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_124988 ) ( ON ?auto_124989 ?auto_124990 ) ( CLEAR ?auto_124989 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_124981 ) ( ON ?auto_124982 ?auto_124981 ) ( ON ?auto_124983 ?auto_124982 ) ( ON ?auto_124984 ?auto_124983 ) ( ON ?auto_124985 ?auto_124984 ) ( ON ?auto_124986 ?auto_124985 ) ( ON ?auto_124987 ?auto_124986 ) ( ON ?auto_124988 ?auto_124987 ) ( not ( = ?auto_124981 ?auto_124982 ) ) ( not ( = ?auto_124981 ?auto_124983 ) ) ( not ( = ?auto_124981 ?auto_124984 ) ) ( not ( = ?auto_124981 ?auto_124985 ) ) ( not ( = ?auto_124981 ?auto_124986 ) ) ( not ( = ?auto_124981 ?auto_124987 ) ) ( not ( = ?auto_124981 ?auto_124988 ) ) ( not ( = ?auto_124981 ?auto_124989 ) ) ( not ( = ?auto_124981 ?auto_124990 ) ) ( not ( = ?auto_124982 ?auto_124983 ) ) ( not ( = ?auto_124982 ?auto_124984 ) ) ( not ( = ?auto_124982 ?auto_124985 ) ) ( not ( = ?auto_124982 ?auto_124986 ) ) ( not ( = ?auto_124982 ?auto_124987 ) ) ( not ( = ?auto_124982 ?auto_124988 ) ) ( not ( = ?auto_124982 ?auto_124989 ) ) ( not ( = ?auto_124982 ?auto_124990 ) ) ( not ( = ?auto_124983 ?auto_124984 ) ) ( not ( = ?auto_124983 ?auto_124985 ) ) ( not ( = ?auto_124983 ?auto_124986 ) ) ( not ( = ?auto_124983 ?auto_124987 ) ) ( not ( = ?auto_124983 ?auto_124988 ) ) ( not ( = ?auto_124983 ?auto_124989 ) ) ( not ( = ?auto_124983 ?auto_124990 ) ) ( not ( = ?auto_124984 ?auto_124985 ) ) ( not ( = ?auto_124984 ?auto_124986 ) ) ( not ( = ?auto_124984 ?auto_124987 ) ) ( not ( = ?auto_124984 ?auto_124988 ) ) ( not ( = ?auto_124984 ?auto_124989 ) ) ( not ( = ?auto_124984 ?auto_124990 ) ) ( not ( = ?auto_124985 ?auto_124986 ) ) ( not ( = ?auto_124985 ?auto_124987 ) ) ( not ( = ?auto_124985 ?auto_124988 ) ) ( not ( = ?auto_124985 ?auto_124989 ) ) ( not ( = ?auto_124985 ?auto_124990 ) ) ( not ( = ?auto_124986 ?auto_124987 ) ) ( not ( = ?auto_124986 ?auto_124988 ) ) ( not ( = ?auto_124986 ?auto_124989 ) ) ( not ( = ?auto_124986 ?auto_124990 ) ) ( not ( = ?auto_124987 ?auto_124988 ) ) ( not ( = ?auto_124987 ?auto_124989 ) ) ( not ( = ?auto_124987 ?auto_124990 ) ) ( not ( = ?auto_124988 ?auto_124989 ) ) ( not ( = ?auto_124988 ?auto_124990 ) ) ( not ( = ?auto_124989 ?auto_124990 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_124989 ?auto_124990 )
      ( !STACK ?auto_124989 ?auto_124988 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_125019 - BLOCK
      ?auto_125020 - BLOCK
      ?auto_125021 - BLOCK
      ?auto_125022 - BLOCK
      ?auto_125023 - BLOCK
      ?auto_125024 - BLOCK
      ?auto_125025 - BLOCK
      ?auto_125026 - BLOCK
      ?auto_125027 - BLOCK
    )
    :vars
    (
      ?auto_125028 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125027 ?auto_125028 ) ( ON-TABLE ?auto_125019 ) ( ON ?auto_125020 ?auto_125019 ) ( ON ?auto_125021 ?auto_125020 ) ( ON ?auto_125022 ?auto_125021 ) ( ON ?auto_125023 ?auto_125022 ) ( ON ?auto_125024 ?auto_125023 ) ( ON ?auto_125025 ?auto_125024 ) ( not ( = ?auto_125019 ?auto_125020 ) ) ( not ( = ?auto_125019 ?auto_125021 ) ) ( not ( = ?auto_125019 ?auto_125022 ) ) ( not ( = ?auto_125019 ?auto_125023 ) ) ( not ( = ?auto_125019 ?auto_125024 ) ) ( not ( = ?auto_125019 ?auto_125025 ) ) ( not ( = ?auto_125019 ?auto_125026 ) ) ( not ( = ?auto_125019 ?auto_125027 ) ) ( not ( = ?auto_125019 ?auto_125028 ) ) ( not ( = ?auto_125020 ?auto_125021 ) ) ( not ( = ?auto_125020 ?auto_125022 ) ) ( not ( = ?auto_125020 ?auto_125023 ) ) ( not ( = ?auto_125020 ?auto_125024 ) ) ( not ( = ?auto_125020 ?auto_125025 ) ) ( not ( = ?auto_125020 ?auto_125026 ) ) ( not ( = ?auto_125020 ?auto_125027 ) ) ( not ( = ?auto_125020 ?auto_125028 ) ) ( not ( = ?auto_125021 ?auto_125022 ) ) ( not ( = ?auto_125021 ?auto_125023 ) ) ( not ( = ?auto_125021 ?auto_125024 ) ) ( not ( = ?auto_125021 ?auto_125025 ) ) ( not ( = ?auto_125021 ?auto_125026 ) ) ( not ( = ?auto_125021 ?auto_125027 ) ) ( not ( = ?auto_125021 ?auto_125028 ) ) ( not ( = ?auto_125022 ?auto_125023 ) ) ( not ( = ?auto_125022 ?auto_125024 ) ) ( not ( = ?auto_125022 ?auto_125025 ) ) ( not ( = ?auto_125022 ?auto_125026 ) ) ( not ( = ?auto_125022 ?auto_125027 ) ) ( not ( = ?auto_125022 ?auto_125028 ) ) ( not ( = ?auto_125023 ?auto_125024 ) ) ( not ( = ?auto_125023 ?auto_125025 ) ) ( not ( = ?auto_125023 ?auto_125026 ) ) ( not ( = ?auto_125023 ?auto_125027 ) ) ( not ( = ?auto_125023 ?auto_125028 ) ) ( not ( = ?auto_125024 ?auto_125025 ) ) ( not ( = ?auto_125024 ?auto_125026 ) ) ( not ( = ?auto_125024 ?auto_125027 ) ) ( not ( = ?auto_125024 ?auto_125028 ) ) ( not ( = ?auto_125025 ?auto_125026 ) ) ( not ( = ?auto_125025 ?auto_125027 ) ) ( not ( = ?auto_125025 ?auto_125028 ) ) ( not ( = ?auto_125026 ?auto_125027 ) ) ( not ( = ?auto_125026 ?auto_125028 ) ) ( not ( = ?auto_125027 ?auto_125028 ) ) ( CLEAR ?auto_125025 ) ( ON ?auto_125026 ?auto_125027 ) ( CLEAR ?auto_125026 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_125019 ?auto_125020 ?auto_125021 ?auto_125022 ?auto_125023 ?auto_125024 ?auto_125025 ?auto_125026 )
      ( MAKE-9PILE ?auto_125019 ?auto_125020 ?auto_125021 ?auto_125022 ?auto_125023 ?auto_125024 ?auto_125025 ?auto_125026 ?auto_125027 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_125057 - BLOCK
      ?auto_125058 - BLOCK
      ?auto_125059 - BLOCK
      ?auto_125060 - BLOCK
      ?auto_125061 - BLOCK
      ?auto_125062 - BLOCK
      ?auto_125063 - BLOCK
      ?auto_125064 - BLOCK
      ?auto_125065 - BLOCK
    )
    :vars
    (
      ?auto_125066 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125065 ?auto_125066 ) ( ON-TABLE ?auto_125057 ) ( ON ?auto_125058 ?auto_125057 ) ( ON ?auto_125059 ?auto_125058 ) ( ON ?auto_125060 ?auto_125059 ) ( ON ?auto_125061 ?auto_125060 ) ( ON ?auto_125062 ?auto_125061 ) ( not ( = ?auto_125057 ?auto_125058 ) ) ( not ( = ?auto_125057 ?auto_125059 ) ) ( not ( = ?auto_125057 ?auto_125060 ) ) ( not ( = ?auto_125057 ?auto_125061 ) ) ( not ( = ?auto_125057 ?auto_125062 ) ) ( not ( = ?auto_125057 ?auto_125063 ) ) ( not ( = ?auto_125057 ?auto_125064 ) ) ( not ( = ?auto_125057 ?auto_125065 ) ) ( not ( = ?auto_125057 ?auto_125066 ) ) ( not ( = ?auto_125058 ?auto_125059 ) ) ( not ( = ?auto_125058 ?auto_125060 ) ) ( not ( = ?auto_125058 ?auto_125061 ) ) ( not ( = ?auto_125058 ?auto_125062 ) ) ( not ( = ?auto_125058 ?auto_125063 ) ) ( not ( = ?auto_125058 ?auto_125064 ) ) ( not ( = ?auto_125058 ?auto_125065 ) ) ( not ( = ?auto_125058 ?auto_125066 ) ) ( not ( = ?auto_125059 ?auto_125060 ) ) ( not ( = ?auto_125059 ?auto_125061 ) ) ( not ( = ?auto_125059 ?auto_125062 ) ) ( not ( = ?auto_125059 ?auto_125063 ) ) ( not ( = ?auto_125059 ?auto_125064 ) ) ( not ( = ?auto_125059 ?auto_125065 ) ) ( not ( = ?auto_125059 ?auto_125066 ) ) ( not ( = ?auto_125060 ?auto_125061 ) ) ( not ( = ?auto_125060 ?auto_125062 ) ) ( not ( = ?auto_125060 ?auto_125063 ) ) ( not ( = ?auto_125060 ?auto_125064 ) ) ( not ( = ?auto_125060 ?auto_125065 ) ) ( not ( = ?auto_125060 ?auto_125066 ) ) ( not ( = ?auto_125061 ?auto_125062 ) ) ( not ( = ?auto_125061 ?auto_125063 ) ) ( not ( = ?auto_125061 ?auto_125064 ) ) ( not ( = ?auto_125061 ?auto_125065 ) ) ( not ( = ?auto_125061 ?auto_125066 ) ) ( not ( = ?auto_125062 ?auto_125063 ) ) ( not ( = ?auto_125062 ?auto_125064 ) ) ( not ( = ?auto_125062 ?auto_125065 ) ) ( not ( = ?auto_125062 ?auto_125066 ) ) ( not ( = ?auto_125063 ?auto_125064 ) ) ( not ( = ?auto_125063 ?auto_125065 ) ) ( not ( = ?auto_125063 ?auto_125066 ) ) ( not ( = ?auto_125064 ?auto_125065 ) ) ( not ( = ?auto_125064 ?auto_125066 ) ) ( not ( = ?auto_125065 ?auto_125066 ) ) ( ON ?auto_125064 ?auto_125065 ) ( CLEAR ?auto_125062 ) ( ON ?auto_125063 ?auto_125064 ) ( CLEAR ?auto_125063 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_125057 ?auto_125058 ?auto_125059 ?auto_125060 ?auto_125061 ?auto_125062 ?auto_125063 )
      ( MAKE-9PILE ?auto_125057 ?auto_125058 ?auto_125059 ?auto_125060 ?auto_125061 ?auto_125062 ?auto_125063 ?auto_125064 ?auto_125065 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_125095 - BLOCK
      ?auto_125096 - BLOCK
      ?auto_125097 - BLOCK
      ?auto_125098 - BLOCK
      ?auto_125099 - BLOCK
      ?auto_125100 - BLOCK
      ?auto_125101 - BLOCK
      ?auto_125102 - BLOCK
      ?auto_125103 - BLOCK
    )
    :vars
    (
      ?auto_125104 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125103 ?auto_125104 ) ( ON-TABLE ?auto_125095 ) ( ON ?auto_125096 ?auto_125095 ) ( ON ?auto_125097 ?auto_125096 ) ( ON ?auto_125098 ?auto_125097 ) ( ON ?auto_125099 ?auto_125098 ) ( not ( = ?auto_125095 ?auto_125096 ) ) ( not ( = ?auto_125095 ?auto_125097 ) ) ( not ( = ?auto_125095 ?auto_125098 ) ) ( not ( = ?auto_125095 ?auto_125099 ) ) ( not ( = ?auto_125095 ?auto_125100 ) ) ( not ( = ?auto_125095 ?auto_125101 ) ) ( not ( = ?auto_125095 ?auto_125102 ) ) ( not ( = ?auto_125095 ?auto_125103 ) ) ( not ( = ?auto_125095 ?auto_125104 ) ) ( not ( = ?auto_125096 ?auto_125097 ) ) ( not ( = ?auto_125096 ?auto_125098 ) ) ( not ( = ?auto_125096 ?auto_125099 ) ) ( not ( = ?auto_125096 ?auto_125100 ) ) ( not ( = ?auto_125096 ?auto_125101 ) ) ( not ( = ?auto_125096 ?auto_125102 ) ) ( not ( = ?auto_125096 ?auto_125103 ) ) ( not ( = ?auto_125096 ?auto_125104 ) ) ( not ( = ?auto_125097 ?auto_125098 ) ) ( not ( = ?auto_125097 ?auto_125099 ) ) ( not ( = ?auto_125097 ?auto_125100 ) ) ( not ( = ?auto_125097 ?auto_125101 ) ) ( not ( = ?auto_125097 ?auto_125102 ) ) ( not ( = ?auto_125097 ?auto_125103 ) ) ( not ( = ?auto_125097 ?auto_125104 ) ) ( not ( = ?auto_125098 ?auto_125099 ) ) ( not ( = ?auto_125098 ?auto_125100 ) ) ( not ( = ?auto_125098 ?auto_125101 ) ) ( not ( = ?auto_125098 ?auto_125102 ) ) ( not ( = ?auto_125098 ?auto_125103 ) ) ( not ( = ?auto_125098 ?auto_125104 ) ) ( not ( = ?auto_125099 ?auto_125100 ) ) ( not ( = ?auto_125099 ?auto_125101 ) ) ( not ( = ?auto_125099 ?auto_125102 ) ) ( not ( = ?auto_125099 ?auto_125103 ) ) ( not ( = ?auto_125099 ?auto_125104 ) ) ( not ( = ?auto_125100 ?auto_125101 ) ) ( not ( = ?auto_125100 ?auto_125102 ) ) ( not ( = ?auto_125100 ?auto_125103 ) ) ( not ( = ?auto_125100 ?auto_125104 ) ) ( not ( = ?auto_125101 ?auto_125102 ) ) ( not ( = ?auto_125101 ?auto_125103 ) ) ( not ( = ?auto_125101 ?auto_125104 ) ) ( not ( = ?auto_125102 ?auto_125103 ) ) ( not ( = ?auto_125102 ?auto_125104 ) ) ( not ( = ?auto_125103 ?auto_125104 ) ) ( ON ?auto_125102 ?auto_125103 ) ( ON ?auto_125101 ?auto_125102 ) ( CLEAR ?auto_125099 ) ( ON ?auto_125100 ?auto_125101 ) ( CLEAR ?auto_125100 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_125095 ?auto_125096 ?auto_125097 ?auto_125098 ?auto_125099 ?auto_125100 )
      ( MAKE-9PILE ?auto_125095 ?auto_125096 ?auto_125097 ?auto_125098 ?auto_125099 ?auto_125100 ?auto_125101 ?auto_125102 ?auto_125103 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_125133 - BLOCK
      ?auto_125134 - BLOCK
      ?auto_125135 - BLOCK
      ?auto_125136 - BLOCK
      ?auto_125137 - BLOCK
      ?auto_125138 - BLOCK
      ?auto_125139 - BLOCK
      ?auto_125140 - BLOCK
      ?auto_125141 - BLOCK
    )
    :vars
    (
      ?auto_125142 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125141 ?auto_125142 ) ( ON-TABLE ?auto_125133 ) ( ON ?auto_125134 ?auto_125133 ) ( ON ?auto_125135 ?auto_125134 ) ( ON ?auto_125136 ?auto_125135 ) ( not ( = ?auto_125133 ?auto_125134 ) ) ( not ( = ?auto_125133 ?auto_125135 ) ) ( not ( = ?auto_125133 ?auto_125136 ) ) ( not ( = ?auto_125133 ?auto_125137 ) ) ( not ( = ?auto_125133 ?auto_125138 ) ) ( not ( = ?auto_125133 ?auto_125139 ) ) ( not ( = ?auto_125133 ?auto_125140 ) ) ( not ( = ?auto_125133 ?auto_125141 ) ) ( not ( = ?auto_125133 ?auto_125142 ) ) ( not ( = ?auto_125134 ?auto_125135 ) ) ( not ( = ?auto_125134 ?auto_125136 ) ) ( not ( = ?auto_125134 ?auto_125137 ) ) ( not ( = ?auto_125134 ?auto_125138 ) ) ( not ( = ?auto_125134 ?auto_125139 ) ) ( not ( = ?auto_125134 ?auto_125140 ) ) ( not ( = ?auto_125134 ?auto_125141 ) ) ( not ( = ?auto_125134 ?auto_125142 ) ) ( not ( = ?auto_125135 ?auto_125136 ) ) ( not ( = ?auto_125135 ?auto_125137 ) ) ( not ( = ?auto_125135 ?auto_125138 ) ) ( not ( = ?auto_125135 ?auto_125139 ) ) ( not ( = ?auto_125135 ?auto_125140 ) ) ( not ( = ?auto_125135 ?auto_125141 ) ) ( not ( = ?auto_125135 ?auto_125142 ) ) ( not ( = ?auto_125136 ?auto_125137 ) ) ( not ( = ?auto_125136 ?auto_125138 ) ) ( not ( = ?auto_125136 ?auto_125139 ) ) ( not ( = ?auto_125136 ?auto_125140 ) ) ( not ( = ?auto_125136 ?auto_125141 ) ) ( not ( = ?auto_125136 ?auto_125142 ) ) ( not ( = ?auto_125137 ?auto_125138 ) ) ( not ( = ?auto_125137 ?auto_125139 ) ) ( not ( = ?auto_125137 ?auto_125140 ) ) ( not ( = ?auto_125137 ?auto_125141 ) ) ( not ( = ?auto_125137 ?auto_125142 ) ) ( not ( = ?auto_125138 ?auto_125139 ) ) ( not ( = ?auto_125138 ?auto_125140 ) ) ( not ( = ?auto_125138 ?auto_125141 ) ) ( not ( = ?auto_125138 ?auto_125142 ) ) ( not ( = ?auto_125139 ?auto_125140 ) ) ( not ( = ?auto_125139 ?auto_125141 ) ) ( not ( = ?auto_125139 ?auto_125142 ) ) ( not ( = ?auto_125140 ?auto_125141 ) ) ( not ( = ?auto_125140 ?auto_125142 ) ) ( not ( = ?auto_125141 ?auto_125142 ) ) ( ON ?auto_125140 ?auto_125141 ) ( ON ?auto_125139 ?auto_125140 ) ( ON ?auto_125138 ?auto_125139 ) ( CLEAR ?auto_125136 ) ( ON ?auto_125137 ?auto_125138 ) ( CLEAR ?auto_125137 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_125133 ?auto_125134 ?auto_125135 ?auto_125136 ?auto_125137 )
      ( MAKE-9PILE ?auto_125133 ?auto_125134 ?auto_125135 ?auto_125136 ?auto_125137 ?auto_125138 ?auto_125139 ?auto_125140 ?auto_125141 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_125171 - BLOCK
      ?auto_125172 - BLOCK
      ?auto_125173 - BLOCK
      ?auto_125174 - BLOCK
      ?auto_125175 - BLOCK
      ?auto_125176 - BLOCK
      ?auto_125177 - BLOCK
      ?auto_125178 - BLOCK
      ?auto_125179 - BLOCK
    )
    :vars
    (
      ?auto_125180 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125179 ?auto_125180 ) ( ON-TABLE ?auto_125171 ) ( ON ?auto_125172 ?auto_125171 ) ( ON ?auto_125173 ?auto_125172 ) ( not ( = ?auto_125171 ?auto_125172 ) ) ( not ( = ?auto_125171 ?auto_125173 ) ) ( not ( = ?auto_125171 ?auto_125174 ) ) ( not ( = ?auto_125171 ?auto_125175 ) ) ( not ( = ?auto_125171 ?auto_125176 ) ) ( not ( = ?auto_125171 ?auto_125177 ) ) ( not ( = ?auto_125171 ?auto_125178 ) ) ( not ( = ?auto_125171 ?auto_125179 ) ) ( not ( = ?auto_125171 ?auto_125180 ) ) ( not ( = ?auto_125172 ?auto_125173 ) ) ( not ( = ?auto_125172 ?auto_125174 ) ) ( not ( = ?auto_125172 ?auto_125175 ) ) ( not ( = ?auto_125172 ?auto_125176 ) ) ( not ( = ?auto_125172 ?auto_125177 ) ) ( not ( = ?auto_125172 ?auto_125178 ) ) ( not ( = ?auto_125172 ?auto_125179 ) ) ( not ( = ?auto_125172 ?auto_125180 ) ) ( not ( = ?auto_125173 ?auto_125174 ) ) ( not ( = ?auto_125173 ?auto_125175 ) ) ( not ( = ?auto_125173 ?auto_125176 ) ) ( not ( = ?auto_125173 ?auto_125177 ) ) ( not ( = ?auto_125173 ?auto_125178 ) ) ( not ( = ?auto_125173 ?auto_125179 ) ) ( not ( = ?auto_125173 ?auto_125180 ) ) ( not ( = ?auto_125174 ?auto_125175 ) ) ( not ( = ?auto_125174 ?auto_125176 ) ) ( not ( = ?auto_125174 ?auto_125177 ) ) ( not ( = ?auto_125174 ?auto_125178 ) ) ( not ( = ?auto_125174 ?auto_125179 ) ) ( not ( = ?auto_125174 ?auto_125180 ) ) ( not ( = ?auto_125175 ?auto_125176 ) ) ( not ( = ?auto_125175 ?auto_125177 ) ) ( not ( = ?auto_125175 ?auto_125178 ) ) ( not ( = ?auto_125175 ?auto_125179 ) ) ( not ( = ?auto_125175 ?auto_125180 ) ) ( not ( = ?auto_125176 ?auto_125177 ) ) ( not ( = ?auto_125176 ?auto_125178 ) ) ( not ( = ?auto_125176 ?auto_125179 ) ) ( not ( = ?auto_125176 ?auto_125180 ) ) ( not ( = ?auto_125177 ?auto_125178 ) ) ( not ( = ?auto_125177 ?auto_125179 ) ) ( not ( = ?auto_125177 ?auto_125180 ) ) ( not ( = ?auto_125178 ?auto_125179 ) ) ( not ( = ?auto_125178 ?auto_125180 ) ) ( not ( = ?auto_125179 ?auto_125180 ) ) ( ON ?auto_125178 ?auto_125179 ) ( ON ?auto_125177 ?auto_125178 ) ( ON ?auto_125176 ?auto_125177 ) ( ON ?auto_125175 ?auto_125176 ) ( CLEAR ?auto_125173 ) ( ON ?auto_125174 ?auto_125175 ) ( CLEAR ?auto_125174 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_125171 ?auto_125172 ?auto_125173 ?auto_125174 )
      ( MAKE-9PILE ?auto_125171 ?auto_125172 ?auto_125173 ?auto_125174 ?auto_125175 ?auto_125176 ?auto_125177 ?auto_125178 ?auto_125179 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_125209 - BLOCK
      ?auto_125210 - BLOCK
      ?auto_125211 - BLOCK
      ?auto_125212 - BLOCK
      ?auto_125213 - BLOCK
      ?auto_125214 - BLOCK
      ?auto_125215 - BLOCK
      ?auto_125216 - BLOCK
      ?auto_125217 - BLOCK
    )
    :vars
    (
      ?auto_125218 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125217 ?auto_125218 ) ( ON-TABLE ?auto_125209 ) ( ON ?auto_125210 ?auto_125209 ) ( not ( = ?auto_125209 ?auto_125210 ) ) ( not ( = ?auto_125209 ?auto_125211 ) ) ( not ( = ?auto_125209 ?auto_125212 ) ) ( not ( = ?auto_125209 ?auto_125213 ) ) ( not ( = ?auto_125209 ?auto_125214 ) ) ( not ( = ?auto_125209 ?auto_125215 ) ) ( not ( = ?auto_125209 ?auto_125216 ) ) ( not ( = ?auto_125209 ?auto_125217 ) ) ( not ( = ?auto_125209 ?auto_125218 ) ) ( not ( = ?auto_125210 ?auto_125211 ) ) ( not ( = ?auto_125210 ?auto_125212 ) ) ( not ( = ?auto_125210 ?auto_125213 ) ) ( not ( = ?auto_125210 ?auto_125214 ) ) ( not ( = ?auto_125210 ?auto_125215 ) ) ( not ( = ?auto_125210 ?auto_125216 ) ) ( not ( = ?auto_125210 ?auto_125217 ) ) ( not ( = ?auto_125210 ?auto_125218 ) ) ( not ( = ?auto_125211 ?auto_125212 ) ) ( not ( = ?auto_125211 ?auto_125213 ) ) ( not ( = ?auto_125211 ?auto_125214 ) ) ( not ( = ?auto_125211 ?auto_125215 ) ) ( not ( = ?auto_125211 ?auto_125216 ) ) ( not ( = ?auto_125211 ?auto_125217 ) ) ( not ( = ?auto_125211 ?auto_125218 ) ) ( not ( = ?auto_125212 ?auto_125213 ) ) ( not ( = ?auto_125212 ?auto_125214 ) ) ( not ( = ?auto_125212 ?auto_125215 ) ) ( not ( = ?auto_125212 ?auto_125216 ) ) ( not ( = ?auto_125212 ?auto_125217 ) ) ( not ( = ?auto_125212 ?auto_125218 ) ) ( not ( = ?auto_125213 ?auto_125214 ) ) ( not ( = ?auto_125213 ?auto_125215 ) ) ( not ( = ?auto_125213 ?auto_125216 ) ) ( not ( = ?auto_125213 ?auto_125217 ) ) ( not ( = ?auto_125213 ?auto_125218 ) ) ( not ( = ?auto_125214 ?auto_125215 ) ) ( not ( = ?auto_125214 ?auto_125216 ) ) ( not ( = ?auto_125214 ?auto_125217 ) ) ( not ( = ?auto_125214 ?auto_125218 ) ) ( not ( = ?auto_125215 ?auto_125216 ) ) ( not ( = ?auto_125215 ?auto_125217 ) ) ( not ( = ?auto_125215 ?auto_125218 ) ) ( not ( = ?auto_125216 ?auto_125217 ) ) ( not ( = ?auto_125216 ?auto_125218 ) ) ( not ( = ?auto_125217 ?auto_125218 ) ) ( ON ?auto_125216 ?auto_125217 ) ( ON ?auto_125215 ?auto_125216 ) ( ON ?auto_125214 ?auto_125215 ) ( ON ?auto_125213 ?auto_125214 ) ( ON ?auto_125212 ?auto_125213 ) ( CLEAR ?auto_125210 ) ( ON ?auto_125211 ?auto_125212 ) ( CLEAR ?auto_125211 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_125209 ?auto_125210 ?auto_125211 )
      ( MAKE-9PILE ?auto_125209 ?auto_125210 ?auto_125211 ?auto_125212 ?auto_125213 ?auto_125214 ?auto_125215 ?auto_125216 ?auto_125217 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_125247 - BLOCK
      ?auto_125248 - BLOCK
      ?auto_125249 - BLOCK
      ?auto_125250 - BLOCK
      ?auto_125251 - BLOCK
      ?auto_125252 - BLOCK
      ?auto_125253 - BLOCK
      ?auto_125254 - BLOCK
      ?auto_125255 - BLOCK
    )
    :vars
    (
      ?auto_125256 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125255 ?auto_125256 ) ( ON-TABLE ?auto_125247 ) ( not ( = ?auto_125247 ?auto_125248 ) ) ( not ( = ?auto_125247 ?auto_125249 ) ) ( not ( = ?auto_125247 ?auto_125250 ) ) ( not ( = ?auto_125247 ?auto_125251 ) ) ( not ( = ?auto_125247 ?auto_125252 ) ) ( not ( = ?auto_125247 ?auto_125253 ) ) ( not ( = ?auto_125247 ?auto_125254 ) ) ( not ( = ?auto_125247 ?auto_125255 ) ) ( not ( = ?auto_125247 ?auto_125256 ) ) ( not ( = ?auto_125248 ?auto_125249 ) ) ( not ( = ?auto_125248 ?auto_125250 ) ) ( not ( = ?auto_125248 ?auto_125251 ) ) ( not ( = ?auto_125248 ?auto_125252 ) ) ( not ( = ?auto_125248 ?auto_125253 ) ) ( not ( = ?auto_125248 ?auto_125254 ) ) ( not ( = ?auto_125248 ?auto_125255 ) ) ( not ( = ?auto_125248 ?auto_125256 ) ) ( not ( = ?auto_125249 ?auto_125250 ) ) ( not ( = ?auto_125249 ?auto_125251 ) ) ( not ( = ?auto_125249 ?auto_125252 ) ) ( not ( = ?auto_125249 ?auto_125253 ) ) ( not ( = ?auto_125249 ?auto_125254 ) ) ( not ( = ?auto_125249 ?auto_125255 ) ) ( not ( = ?auto_125249 ?auto_125256 ) ) ( not ( = ?auto_125250 ?auto_125251 ) ) ( not ( = ?auto_125250 ?auto_125252 ) ) ( not ( = ?auto_125250 ?auto_125253 ) ) ( not ( = ?auto_125250 ?auto_125254 ) ) ( not ( = ?auto_125250 ?auto_125255 ) ) ( not ( = ?auto_125250 ?auto_125256 ) ) ( not ( = ?auto_125251 ?auto_125252 ) ) ( not ( = ?auto_125251 ?auto_125253 ) ) ( not ( = ?auto_125251 ?auto_125254 ) ) ( not ( = ?auto_125251 ?auto_125255 ) ) ( not ( = ?auto_125251 ?auto_125256 ) ) ( not ( = ?auto_125252 ?auto_125253 ) ) ( not ( = ?auto_125252 ?auto_125254 ) ) ( not ( = ?auto_125252 ?auto_125255 ) ) ( not ( = ?auto_125252 ?auto_125256 ) ) ( not ( = ?auto_125253 ?auto_125254 ) ) ( not ( = ?auto_125253 ?auto_125255 ) ) ( not ( = ?auto_125253 ?auto_125256 ) ) ( not ( = ?auto_125254 ?auto_125255 ) ) ( not ( = ?auto_125254 ?auto_125256 ) ) ( not ( = ?auto_125255 ?auto_125256 ) ) ( ON ?auto_125254 ?auto_125255 ) ( ON ?auto_125253 ?auto_125254 ) ( ON ?auto_125252 ?auto_125253 ) ( ON ?auto_125251 ?auto_125252 ) ( ON ?auto_125250 ?auto_125251 ) ( ON ?auto_125249 ?auto_125250 ) ( CLEAR ?auto_125247 ) ( ON ?auto_125248 ?auto_125249 ) ( CLEAR ?auto_125248 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_125247 ?auto_125248 )
      ( MAKE-9PILE ?auto_125247 ?auto_125248 ?auto_125249 ?auto_125250 ?auto_125251 ?auto_125252 ?auto_125253 ?auto_125254 ?auto_125255 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_125285 - BLOCK
      ?auto_125286 - BLOCK
      ?auto_125287 - BLOCK
      ?auto_125288 - BLOCK
      ?auto_125289 - BLOCK
      ?auto_125290 - BLOCK
      ?auto_125291 - BLOCK
      ?auto_125292 - BLOCK
      ?auto_125293 - BLOCK
    )
    :vars
    (
      ?auto_125294 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125293 ?auto_125294 ) ( not ( = ?auto_125285 ?auto_125286 ) ) ( not ( = ?auto_125285 ?auto_125287 ) ) ( not ( = ?auto_125285 ?auto_125288 ) ) ( not ( = ?auto_125285 ?auto_125289 ) ) ( not ( = ?auto_125285 ?auto_125290 ) ) ( not ( = ?auto_125285 ?auto_125291 ) ) ( not ( = ?auto_125285 ?auto_125292 ) ) ( not ( = ?auto_125285 ?auto_125293 ) ) ( not ( = ?auto_125285 ?auto_125294 ) ) ( not ( = ?auto_125286 ?auto_125287 ) ) ( not ( = ?auto_125286 ?auto_125288 ) ) ( not ( = ?auto_125286 ?auto_125289 ) ) ( not ( = ?auto_125286 ?auto_125290 ) ) ( not ( = ?auto_125286 ?auto_125291 ) ) ( not ( = ?auto_125286 ?auto_125292 ) ) ( not ( = ?auto_125286 ?auto_125293 ) ) ( not ( = ?auto_125286 ?auto_125294 ) ) ( not ( = ?auto_125287 ?auto_125288 ) ) ( not ( = ?auto_125287 ?auto_125289 ) ) ( not ( = ?auto_125287 ?auto_125290 ) ) ( not ( = ?auto_125287 ?auto_125291 ) ) ( not ( = ?auto_125287 ?auto_125292 ) ) ( not ( = ?auto_125287 ?auto_125293 ) ) ( not ( = ?auto_125287 ?auto_125294 ) ) ( not ( = ?auto_125288 ?auto_125289 ) ) ( not ( = ?auto_125288 ?auto_125290 ) ) ( not ( = ?auto_125288 ?auto_125291 ) ) ( not ( = ?auto_125288 ?auto_125292 ) ) ( not ( = ?auto_125288 ?auto_125293 ) ) ( not ( = ?auto_125288 ?auto_125294 ) ) ( not ( = ?auto_125289 ?auto_125290 ) ) ( not ( = ?auto_125289 ?auto_125291 ) ) ( not ( = ?auto_125289 ?auto_125292 ) ) ( not ( = ?auto_125289 ?auto_125293 ) ) ( not ( = ?auto_125289 ?auto_125294 ) ) ( not ( = ?auto_125290 ?auto_125291 ) ) ( not ( = ?auto_125290 ?auto_125292 ) ) ( not ( = ?auto_125290 ?auto_125293 ) ) ( not ( = ?auto_125290 ?auto_125294 ) ) ( not ( = ?auto_125291 ?auto_125292 ) ) ( not ( = ?auto_125291 ?auto_125293 ) ) ( not ( = ?auto_125291 ?auto_125294 ) ) ( not ( = ?auto_125292 ?auto_125293 ) ) ( not ( = ?auto_125292 ?auto_125294 ) ) ( not ( = ?auto_125293 ?auto_125294 ) ) ( ON ?auto_125292 ?auto_125293 ) ( ON ?auto_125291 ?auto_125292 ) ( ON ?auto_125290 ?auto_125291 ) ( ON ?auto_125289 ?auto_125290 ) ( ON ?auto_125288 ?auto_125289 ) ( ON ?auto_125287 ?auto_125288 ) ( ON ?auto_125286 ?auto_125287 ) ( ON ?auto_125285 ?auto_125286 ) ( CLEAR ?auto_125285 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_125285 )
      ( MAKE-9PILE ?auto_125285 ?auto_125286 ?auto_125287 ?auto_125288 ?auto_125289 ?auto_125290 ?auto_125291 ?auto_125292 ?auto_125293 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_125324 - BLOCK
      ?auto_125325 - BLOCK
      ?auto_125326 - BLOCK
      ?auto_125327 - BLOCK
      ?auto_125328 - BLOCK
      ?auto_125329 - BLOCK
      ?auto_125330 - BLOCK
      ?auto_125331 - BLOCK
      ?auto_125332 - BLOCK
      ?auto_125333 - BLOCK
    )
    :vars
    (
      ?auto_125334 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_125332 ) ( ON ?auto_125333 ?auto_125334 ) ( CLEAR ?auto_125333 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_125324 ) ( ON ?auto_125325 ?auto_125324 ) ( ON ?auto_125326 ?auto_125325 ) ( ON ?auto_125327 ?auto_125326 ) ( ON ?auto_125328 ?auto_125327 ) ( ON ?auto_125329 ?auto_125328 ) ( ON ?auto_125330 ?auto_125329 ) ( ON ?auto_125331 ?auto_125330 ) ( ON ?auto_125332 ?auto_125331 ) ( not ( = ?auto_125324 ?auto_125325 ) ) ( not ( = ?auto_125324 ?auto_125326 ) ) ( not ( = ?auto_125324 ?auto_125327 ) ) ( not ( = ?auto_125324 ?auto_125328 ) ) ( not ( = ?auto_125324 ?auto_125329 ) ) ( not ( = ?auto_125324 ?auto_125330 ) ) ( not ( = ?auto_125324 ?auto_125331 ) ) ( not ( = ?auto_125324 ?auto_125332 ) ) ( not ( = ?auto_125324 ?auto_125333 ) ) ( not ( = ?auto_125324 ?auto_125334 ) ) ( not ( = ?auto_125325 ?auto_125326 ) ) ( not ( = ?auto_125325 ?auto_125327 ) ) ( not ( = ?auto_125325 ?auto_125328 ) ) ( not ( = ?auto_125325 ?auto_125329 ) ) ( not ( = ?auto_125325 ?auto_125330 ) ) ( not ( = ?auto_125325 ?auto_125331 ) ) ( not ( = ?auto_125325 ?auto_125332 ) ) ( not ( = ?auto_125325 ?auto_125333 ) ) ( not ( = ?auto_125325 ?auto_125334 ) ) ( not ( = ?auto_125326 ?auto_125327 ) ) ( not ( = ?auto_125326 ?auto_125328 ) ) ( not ( = ?auto_125326 ?auto_125329 ) ) ( not ( = ?auto_125326 ?auto_125330 ) ) ( not ( = ?auto_125326 ?auto_125331 ) ) ( not ( = ?auto_125326 ?auto_125332 ) ) ( not ( = ?auto_125326 ?auto_125333 ) ) ( not ( = ?auto_125326 ?auto_125334 ) ) ( not ( = ?auto_125327 ?auto_125328 ) ) ( not ( = ?auto_125327 ?auto_125329 ) ) ( not ( = ?auto_125327 ?auto_125330 ) ) ( not ( = ?auto_125327 ?auto_125331 ) ) ( not ( = ?auto_125327 ?auto_125332 ) ) ( not ( = ?auto_125327 ?auto_125333 ) ) ( not ( = ?auto_125327 ?auto_125334 ) ) ( not ( = ?auto_125328 ?auto_125329 ) ) ( not ( = ?auto_125328 ?auto_125330 ) ) ( not ( = ?auto_125328 ?auto_125331 ) ) ( not ( = ?auto_125328 ?auto_125332 ) ) ( not ( = ?auto_125328 ?auto_125333 ) ) ( not ( = ?auto_125328 ?auto_125334 ) ) ( not ( = ?auto_125329 ?auto_125330 ) ) ( not ( = ?auto_125329 ?auto_125331 ) ) ( not ( = ?auto_125329 ?auto_125332 ) ) ( not ( = ?auto_125329 ?auto_125333 ) ) ( not ( = ?auto_125329 ?auto_125334 ) ) ( not ( = ?auto_125330 ?auto_125331 ) ) ( not ( = ?auto_125330 ?auto_125332 ) ) ( not ( = ?auto_125330 ?auto_125333 ) ) ( not ( = ?auto_125330 ?auto_125334 ) ) ( not ( = ?auto_125331 ?auto_125332 ) ) ( not ( = ?auto_125331 ?auto_125333 ) ) ( not ( = ?auto_125331 ?auto_125334 ) ) ( not ( = ?auto_125332 ?auto_125333 ) ) ( not ( = ?auto_125332 ?auto_125334 ) ) ( not ( = ?auto_125333 ?auto_125334 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_125333 ?auto_125334 )
      ( !STACK ?auto_125333 ?auto_125332 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_125366 - BLOCK
      ?auto_125367 - BLOCK
      ?auto_125368 - BLOCK
      ?auto_125369 - BLOCK
      ?auto_125370 - BLOCK
      ?auto_125371 - BLOCK
      ?auto_125372 - BLOCK
      ?auto_125373 - BLOCK
      ?auto_125374 - BLOCK
      ?auto_125375 - BLOCK
    )
    :vars
    (
      ?auto_125376 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125375 ?auto_125376 ) ( ON-TABLE ?auto_125366 ) ( ON ?auto_125367 ?auto_125366 ) ( ON ?auto_125368 ?auto_125367 ) ( ON ?auto_125369 ?auto_125368 ) ( ON ?auto_125370 ?auto_125369 ) ( ON ?auto_125371 ?auto_125370 ) ( ON ?auto_125372 ?auto_125371 ) ( ON ?auto_125373 ?auto_125372 ) ( not ( = ?auto_125366 ?auto_125367 ) ) ( not ( = ?auto_125366 ?auto_125368 ) ) ( not ( = ?auto_125366 ?auto_125369 ) ) ( not ( = ?auto_125366 ?auto_125370 ) ) ( not ( = ?auto_125366 ?auto_125371 ) ) ( not ( = ?auto_125366 ?auto_125372 ) ) ( not ( = ?auto_125366 ?auto_125373 ) ) ( not ( = ?auto_125366 ?auto_125374 ) ) ( not ( = ?auto_125366 ?auto_125375 ) ) ( not ( = ?auto_125366 ?auto_125376 ) ) ( not ( = ?auto_125367 ?auto_125368 ) ) ( not ( = ?auto_125367 ?auto_125369 ) ) ( not ( = ?auto_125367 ?auto_125370 ) ) ( not ( = ?auto_125367 ?auto_125371 ) ) ( not ( = ?auto_125367 ?auto_125372 ) ) ( not ( = ?auto_125367 ?auto_125373 ) ) ( not ( = ?auto_125367 ?auto_125374 ) ) ( not ( = ?auto_125367 ?auto_125375 ) ) ( not ( = ?auto_125367 ?auto_125376 ) ) ( not ( = ?auto_125368 ?auto_125369 ) ) ( not ( = ?auto_125368 ?auto_125370 ) ) ( not ( = ?auto_125368 ?auto_125371 ) ) ( not ( = ?auto_125368 ?auto_125372 ) ) ( not ( = ?auto_125368 ?auto_125373 ) ) ( not ( = ?auto_125368 ?auto_125374 ) ) ( not ( = ?auto_125368 ?auto_125375 ) ) ( not ( = ?auto_125368 ?auto_125376 ) ) ( not ( = ?auto_125369 ?auto_125370 ) ) ( not ( = ?auto_125369 ?auto_125371 ) ) ( not ( = ?auto_125369 ?auto_125372 ) ) ( not ( = ?auto_125369 ?auto_125373 ) ) ( not ( = ?auto_125369 ?auto_125374 ) ) ( not ( = ?auto_125369 ?auto_125375 ) ) ( not ( = ?auto_125369 ?auto_125376 ) ) ( not ( = ?auto_125370 ?auto_125371 ) ) ( not ( = ?auto_125370 ?auto_125372 ) ) ( not ( = ?auto_125370 ?auto_125373 ) ) ( not ( = ?auto_125370 ?auto_125374 ) ) ( not ( = ?auto_125370 ?auto_125375 ) ) ( not ( = ?auto_125370 ?auto_125376 ) ) ( not ( = ?auto_125371 ?auto_125372 ) ) ( not ( = ?auto_125371 ?auto_125373 ) ) ( not ( = ?auto_125371 ?auto_125374 ) ) ( not ( = ?auto_125371 ?auto_125375 ) ) ( not ( = ?auto_125371 ?auto_125376 ) ) ( not ( = ?auto_125372 ?auto_125373 ) ) ( not ( = ?auto_125372 ?auto_125374 ) ) ( not ( = ?auto_125372 ?auto_125375 ) ) ( not ( = ?auto_125372 ?auto_125376 ) ) ( not ( = ?auto_125373 ?auto_125374 ) ) ( not ( = ?auto_125373 ?auto_125375 ) ) ( not ( = ?auto_125373 ?auto_125376 ) ) ( not ( = ?auto_125374 ?auto_125375 ) ) ( not ( = ?auto_125374 ?auto_125376 ) ) ( not ( = ?auto_125375 ?auto_125376 ) ) ( CLEAR ?auto_125373 ) ( ON ?auto_125374 ?auto_125375 ) ( CLEAR ?auto_125374 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_125366 ?auto_125367 ?auto_125368 ?auto_125369 ?auto_125370 ?auto_125371 ?auto_125372 ?auto_125373 ?auto_125374 )
      ( MAKE-10PILE ?auto_125366 ?auto_125367 ?auto_125368 ?auto_125369 ?auto_125370 ?auto_125371 ?auto_125372 ?auto_125373 ?auto_125374 ?auto_125375 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_125408 - BLOCK
      ?auto_125409 - BLOCK
      ?auto_125410 - BLOCK
      ?auto_125411 - BLOCK
      ?auto_125412 - BLOCK
      ?auto_125413 - BLOCK
      ?auto_125414 - BLOCK
      ?auto_125415 - BLOCK
      ?auto_125416 - BLOCK
      ?auto_125417 - BLOCK
    )
    :vars
    (
      ?auto_125418 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125417 ?auto_125418 ) ( ON-TABLE ?auto_125408 ) ( ON ?auto_125409 ?auto_125408 ) ( ON ?auto_125410 ?auto_125409 ) ( ON ?auto_125411 ?auto_125410 ) ( ON ?auto_125412 ?auto_125411 ) ( ON ?auto_125413 ?auto_125412 ) ( ON ?auto_125414 ?auto_125413 ) ( not ( = ?auto_125408 ?auto_125409 ) ) ( not ( = ?auto_125408 ?auto_125410 ) ) ( not ( = ?auto_125408 ?auto_125411 ) ) ( not ( = ?auto_125408 ?auto_125412 ) ) ( not ( = ?auto_125408 ?auto_125413 ) ) ( not ( = ?auto_125408 ?auto_125414 ) ) ( not ( = ?auto_125408 ?auto_125415 ) ) ( not ( = ?auto_125408 ?auto_125416 ) ) ( not ( = ?auto_125408 ?auto_125417 ) ) ( not ( = ?auto_125408 ?auto_125418 ) ) ( not ( = ?auto_125409 ?auto_125410 ) ) ( not ( = ?auto_125409 ?auto_125411 ) ) ( not ( = ?auto_125409 ?auto_125412 ) ) ( not ( = ?auto_125409 ?auto_125413 ) ) ( not ( = ?auto_125409 ?auto_125414 ) ) ( not ( = ?auto_125409 ?auto_125415 ) ) ( not ( = ?auto_125409 ?auto_125416 ) ) ( not ( = ?auto_125409 ?auto_125417 ) ) ( not ( = ?auto_125409 ?auto_125418 ) ) ( not ( = ?auto_125410 ?auto_125411 ) ) ( not ( = ?auto_125410 ?auto_125412 ) ) ( not ( = ?auto_125410 ?auto_125413 ) ) ( not ( = ?auto_125410 ?auto_125414 ) ) ( not ( = ?auto_125410 ?auto_125415 ) ) ( not ( = ?auto_125410 ?auto_125416 ) ) ( not ( = ?auto_125410 ?auto_125417 ) ) ( not ( = ?auto_125410 ?auto_125418 ) ) ( not ( = ?auto_125411 ?auto_125412 ) ) ( not ( = ?auto_125411 ?auto_125413 ) ) ( not ( = ?auto_125411 ?auto_125414 ) ) ( not ( = ?auto_125411 ?auto_125415 ) ) ( not ( = ?auto_125411 ?auto_125416 ) ) ( not ( = ?auto_125411 ?auto_125417 ) ) ( not ( = ?auto_125411 ?auto_125418 ) ) ( not ( = ?auto_125412 ?auto_125413 ) ) ( not ( = ?auto_125412 ?auto_125414 ) ) ( not ( = ?auto_125412 ?auto_125415 ) ) ( not ( = ?auto_125412 ?auto_125416 ) ) ( not ( = ?auto_125412 ?auto_125417 ) ) ( not ( = ?auto_125412 ?auto_125418 ) ) ( not ( = ?auto_125413 ?auto_125414 ) ) ( not ( = ?auto_125413 ?auto_125415 ) ) ( not ( = ?auto_125413 ?auto_125416 ) ) ( not ( = ?auto_125413 ?auto_125417 ) ) ( not ( = ?auto_125413 ?auto_125418 ) ) ( not ( = ?auto_125414 ?auto_125415 ) ) ( not ( = ?auto_125414 ?auto_125416 ) ) ( not ( = ?auto_125414 ?auto_125417 ) ) ( not ( = ?auto_125414 ?auto_125418 ) ) ( not ( = ?auto_125415 ?auto_125416 ) ) ( not ( = ?auto_125415 ?auto_125417 ) ) ( not ( = ?auto_125415 ?auto_125418 ) ) ( not ( = ?auto_125416 ?auto_125417 ) ) ( not ( = ?auto_125416 ?auto_125418 ) ) ( not ( = ?auto_125417 ?auto_125418 ) ) ( ON ?auto_125416 ?auto_125417 ) ( CLEAR ?auto_125414 ) ( ON ?auto_125415 ?auto_125416 ) ( CLEAR ?auto_125415 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_125408 ?auto_125409 ?auto_125410 ?auto_125411 ?auto_125412 ?auto_125413 ?auto_125414 ?auto_125415 )
      ( MAKE-10PILE ?auto_125408 ?auto_125409 ?auto_125410 ?auto_125411 ?auto_125412 ?auto_125413 ?auto_125414 ?auto_125415 ?auto_125416 ?auto_125417 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_125450 - BLOCK
      ?auto_125451 - BLOCK
      ?auto_125452 - BLOCK
      ?auto_125453 - BLOCK
      ?auto_125454 - BLOCK
      ?auto_125455 - BLOCK
      ?auto_125456 - BLOCK
      ?auto_125457 - BLOCK
      ?auto_125458 - BLOCK
      ?auto_125459 - BLOCK
    )
    :vars
    (
      ?auto_125460 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125459 ?auto_125460 ) ( ON-TABLE ?auto_125450 ) ( ON ?auto_125451 ?auto_125450 ) ( ON ?auto_125452 ?auto_125451 ) ( ON ?auto_125453 ?auto_125452 ) ( ON ?auto_125454 ?auto_125453 ) ( ON ?auto_125455 ?auto_125454 ) ( not ( = ?auto_125450 ?auto_125451 ) ) ( not ( = ?auto_125450 ?auto_125452 ) ) ( not ( = ?auto_125450 ?auto_125453 ) ) ( not ( = ?auto_125450 ?auto_125454 ) ) ( not ( = ?auto_125450 ?auto_125455 ) ) ( not ( = ?auto_125450 ?auto_125456 ) ) ( not ( = ?auto_125450 ?auto_125457 ) ) ( not ( = ?auto_125450 ?auto_125458 ) ) ( not ( = ?auto_125450 ?auto_125459 ) ) ( not ( = ?auto_125450 ?auto_125460 ) ) ( not ( = ?auto_125451 ?auto_125452 ) ) ( not ( = ?auto_125451 ?auto_125453 ) ) ( not ( = ?auto_125451 ?auto_125454 ) ) ( not ( = ?auto_125451 ?auto_125455 ) ) ( not ( = ?auto_125451 ?auto_125456 ) ) ( not ( = ?auto_125451 ?auto_125457 ) ) ( not ( = ?auto_125451 ?auto_125458 ) ) ( not ( = ?auto_125451 ?auto_125459 ) ) ( not ( = ?auto_125451 ?auto_125460 ) ) ( not ( = ?auto_125452 ?auto_125453 ) ) ( not ( = ?auto_125452 ?auto_125454 ) ) ( not ( = ?auto_125452 ?auto_125455 ) ) ( not ( = ?auto_125452 ?auto_125456 ) ) ( not ( = ?auto_125452 ?auto_125457 ) ) ( not ( = ?auto_125452 ?auto_125458 ) ) ( not ( = ?auto_125452 ?auto_125459 ) ) ( not ( = ?auto_125452 ?auto_125460 ) ) ( not ( = ?auto_125453 ?auto_125454 ) ) ( not ( = ?auto_125453 ?auto_125455 ) ) ( not ( = ?auto_125453 ?auto_125456 ) ) ( not ( = ?auto_125453 ?auto_125457 ) ) ( not ( = ?auto_125453 ?auto_125458 ) ) ( not ( = ?auto_125453 ?auto_125459 ) ) ( not ( = ?auto_125453 ?auto_125460 ) ) ( not ( = ?auto_125454 ?auto_125455 ) ) ( not ( = ?auto_125454 ?auto_125456 ) ) ( not ( = ?auto_125454 ?auto_125457 ) ) ( not ( = ?auto_125454 ?auto_125458 ) ) ( not ( = ?auto_125454 ?auto_125459 ) ) ( not ( = ?auto_125454 ?auto_125460 ) ) ( not ( = ?auto_125455 ?auto_125456 ) ) ( not ( = ?auto_125455 ?auto_125457 ) ) ( not ( = ?auto_125455 ?auto_125458 ) ) ( not ( = ?auto_125455 ?auto_125459 ) ) ( not ( = ?auto_125455 ?auto_125460 ) ) ( not ( = ?auto_125456 ?auto_125457 ) ) ( not ( = ?auto_125456 ?auto_125458 ) ) ( not ( = ?auto_125456 ?auto_125459 ) ) ( not ( = ?auto_125456 ?auto_125460 ) ) ( not ( = ?auto_125457 ?auto_125458 ) ) ( not ( = ?auto_125457 ?auto_125459 ) ) ( not ( = ?auto_125457 ?auto_125460 ) ) ( not ( = ?auto_125458 ?auto_125459 ) ) ( not ( = ?auto_125458 ?auto_125460 ) ) ( not ( = ?auto_125459 ?auto_125460 ) ) ( ON ?auto_125458 ?auto_125459 ) ( ON ?auto_125457 ?auto_125458 ) ( CLEAR ?auto_125455 ) ( ON ?auto_125456 ?auto_125457 ) ( CLEAR ?auto_125456 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_125450 ?auto_125451 ?auto_125452 ?auto_125453 ?auto_125454 ?auto_125455 ?auto_125456 )
      ( MAKE-10PILE ?auto_125450 ?auto_125451 ?auto_125452 ?auto_125453 ?auto_125454 ?auto_125455 ?auto_125456 ?auto_125457 ?auto_125458 ?auto_125459 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_125492 - BLOCK
      ?auto_125493 - BLOCK
      ?auto_125494 - BLOCK
      ?auto_125495 - BLOCK
      ?auto_125496 - BLOCK
      ?auto_125497 - BLOCK
      ?auto_125498 - BLOCK
      ?auto_125499 - BLOCK
      ?auto_125500 - BLOCK
      ?auto_125501 - BLOCK
    )
    :vars
    (
      ?auto_125502 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125501 ?auto_125502 ) ( ON-TABLE ?auto_125492 ) ( ON ?auto_125493 ?auto_125492 ) ( ON ?auto_125494 ?auto_125493 ) ( ON ?auto_125495 ?auto_125494 ) ( ON ?auto_125496 ?auto_125495 ) ( not ( = ?auto_125492 ?auto_125493 ) ) ( not ( = ?auto_125492 ?auto_125494 ) ) ( not ( = ?auto_125492 ?auto_125495 ) ) ( not ( = ?auto_125492 ?auto_125496 ) ) ( not ( = ?auto_125492 ?auto_125497 ) ) ( not ( = ?auto_125492 ?auto_125498 ) ) ( not ( = ?auto_125492 ?auto_125499 ) ) ( not ( = ?auto_125492 ?auto_125500 ) ) ( not ( = ?auto_125492 ?auto_125501 ) ) ( not ( = ?auto_125492 ?auto_125502 ) ) ( not ( = ?auto_125493 ?auto_125494 ) ) ( not ( = ?auto_125493 ?auto_125495 ) ) ( not ( = ?auto_125493 ?auto_125496 ) ) ( not ( = ?auto_125493 ?auto_125497 ) ) ( not ( = ?auto_125493 ?auto_125498 ) ) ( not ( = ?auto_125493 ?auto_125499 ) ) ( not ( = ?auto_125493 ?auto_125500 ) ) ( not ( = ?auto_125493 ?auto_125501 ) ) ( not ( = ?auto_125493 ?auto_125502 ) ) ( not ( = ?auto_125494 ?auto_125495 ) ) ( not ( = ?auto_125494 ?auto_125496 ) ) ( not ( = ?auto_125494 ?auto_125497 ) ) ( not ( = ?auto_125494 ?auto_125498 ) ) ( not ( = ?auto_125494 ?auto_125499 ) ) ( not ( = ?auto_125494 ?auto_125500 ) ) ( not ( = ?auto_125494 ?auto_125501 ) ) ( not ( = ?auto_125494 ?auto_125502 ) ) ( not ( = ?auto_125495 ?auto_125496 ) ) ( not ( = ?auto_125495 ?auto_125497 ) ) ( not ( = ?auto_125495 ?auto_125498 ) ) ( not ( = ?auto_125495 ?auto_125499 ) ) ( not ( = ?auto_125495 ?auto_125500 ) ) ( not ( = ?auto_125495 ?auto_125501 ) ) ( not ( = ?auto_125495 ?auto_125502 ) ) ( not ( = ?auto_125496 ?auto_125497 ) ) ( not ( = ?auto_125496 ?auto_125498 ) ) ( not ( = ?auto_125496 ?auto_125499 ) ) ( not ( = ?auto_125496 ?auto_125500 ) ) ( not ( = ?auto_125496 ?auto_125501 ) ) ( not ( = ?auto_125496 ?auto_125502 ) ) ( not ( = ?auto_125497 ?auto_125498 ) ) ( not ( = ?auto_125497 ?auto_125499 ) ) ( not ( = ?auto_125497 ?auto_125500 ) ) ( not ( = ?auto_125497 ?auto_125501 ) ) ( not ( = ?auto_125497 ?auto_125502 ) ) ( not ( = ?auto_125498 ?auto_125499 ) ) ( not ( = ?auto_125498 ?auto_125500 ) ) ( not ( = ?auto_125498 ?auto_125501 ) ) ( not ( = ?auto_125498 ?auto_125502 ) ) ( not ( = ?auto_125499 ?auto_125500 ) ) ( not ( = ?auto_125499 ?auto_125501 ) ) ( not ( = ?auto_125499 ?auto_125502 ) ) ( not ( = ?auto_125500 ?auto_125501 ) ) ( not ( = ?auto_125500 ?auto_125502 ) ) ( not ( = ?auto_125501 ?auto_125502 ) ) ( ON ?auto_125500 ?auto_125501 ) ( ON ?auto_125499 ?auto_125500 ) ( ON ?auto_125498 ?auto_125499 ) ( CLEAR ?auto_125496 ) ( ON ?auto_125497 ?auto_125498 ) ( CLEAR ?auto_125497 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_125492 ?auto_125493 ?auto_125494 ?auto_125495 ?auto_125496 ?auto_125497 )
      ( MAKE-10PILE ?auto_125492 ?auto_125493 ?auto_125494 ?auto_125495 ?auto_125496 ?auto_125497 ?auto_125498 ?auto_125499 ?auto_125500 ?auto_125501 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_125534 - BLOCK
      ?auto_125535 - BLOCK
      ?auto_125536 - BLOCK
      ?auto_125537 - BLOCK
      ?auto_125538 - BLOCK
      ?auto_125539 - BLOCK
      ?auto_125540 - BLOCK
      ?auto_125541 - BLOCK
      ?auto_125542 - BLOCK
      ?auto_125543 - BLOCK
    )
    :vars
    (
      ?auto_125544 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125543 ?auto_125544 ) ( ON-TABLE ?auto_125534 ) ( ON ?auto_125535 ?auto_125534 ) ( ON ?auto_125536 ?auto_125535 ) ( ON ?auto_125537 ?auto_125536 ) ( not ( = ?auto_125534 ?auto_125535 ) ) ( not ( = ?auto_125534 ?auto_125536 ) ) ( not ( = ?auto_125534 ?auto_125537 ) ) ( not ( = ?auto_125534 ?auto_125538 ) ) ( not ( = ?auto_125534 ?auto_125539 ) ) ( not ( = ?auto_125534 ?auto_125540 ) ) ( not ( = ?auto_125534 ?auto_125541 ) ) ( not ( = ?auto_125534 ?auto_125542 ) ) ( not ( = ?auto_125534 ?auto_125543 ) ) ( not ( = ?auto_125534 ?auto_125544 ) ) ( not ( = ?auto_125535 ?auto_125536 ) ) ( not ( = ?auto_125535 ?auto_125537 ) ) ( not ( = ?auto_125535 ?auto_125538 ) ) ( not ( = ?auto_125535 ?auto_125539 ) ) ( not ( = ?auto_125535 ?auto_125540 ) ) ( not ( = ?auto_125535 ?auto_125541 ) ) ( not ( = ?auto_125535 ?auto_125542 ) ) ( not ( = ?auto_125535 ?auto_125543 ) ) ( not ( = ?auto_125535 ?auto_125544 ) ) ( not ( = ?auto_125536 ?auto_125537 ) ) ( not ( = ?auto_125536 ?auto_125538 ) ) ( not ( = ?auto_125536 ?auto_125539 ) ) ( not ( = ?auto_125536 ?auto_125540 ) ) ( not ( = ?auto_125536 ?auto_125541 ) ) ( not ( = ?auto_125536 ?auto_125542 ) ) ( not ( = ?auto_125536 ?auto_125543 ) ) ( not ( = ?auto_125536 ?auto_125544 ) ) ( not ( = ?auto_125537 ?auto_125538 ) ) ( not ( = ?auto_125537 ?auto_125539 ) ) ( not ( = ?auto_125537 ?auto_125540 ) ) ( not ( = ?auto_125537 ?auto_125541 ) ) ( not ( = ?auto_125537 ?auto_125542 ) ) ( not ( = ?auto_125537 ?auto_125543 ) ) ( not ( = ?auto_125537 ?auto_125544 ) ) ( not ( = ?auto_125538 ?auto_125539 ) ) ( not ( = ?auto_125538 ?auto_125540 ) ) ( not ( = ?auto_125538 ?auto_125541 ) ) ( not ( = ?auto_125538 ?auto_125542 ) ) ( not ( = ?auto_125538 ?auto_125543 ) ) ( not ( = ?auto_125538 ?auto_125544 ) ) ( not ( = ?auto_125539 ?auto_125540 ) ) ( not ( = ?auto_125539 ?auto_125541 ) ) ( not ( = ?auto_125539 ?auto_125542 ) ) ( not ( = ?auto_125539 ?auto_125543 ) ) ( not ( = ?auto_125539 ?auto_125544 ) ) ( not ( = ?auto_125540 ?auto_125541 ) ) ( not ( = ?auto_125540 ?auto_125542 ) ) ( not ( = ?auto_125540 ?auto_125543 ) ) ( not ( = ?auto_125540 ?auto_125544 ) ) ( not ( = ?auto_125541 ?auto_125542 ) ) ( not ( = ?auto_125541 ?auto_125543 ) ) ( not ( = ?auto_125541 ?auto_125544 ) ) ( not ( = ?auto_125542 ?auto_125543 ) ) ( not ( = ?auto_125542 ?auto_125544 ) ) ( not ( = ?auto_125543 ?auto_125544 ) ) ( ON ?auto_125542 ?auto_125543 ) ( ON ?auto_125541 ?auto_125542 ) ( ON ?auto_125540 ?auto_125541 ) ( ON ?auto_125539 ?auto_125540 ) ( CLEAR ?auto_125537 ) ( ON ?auto_125538 ?auto_125539 ) ( CLEAR ?auto_125538 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_125534 ?auto_125535 ?auto_125536 ?auto_125537 ?auto_125538 )
      ( MAKE-10PILE ?auto_125534 ?auto_125535 ?auto_125536 ?auto_125537 ?auto_125538 ?auto_125539 ?auto_125540 ?auto_125541 ?auto_125542 ?auto_125543 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_125576 - BLOCK
      ?auto_125577 - BLOCK
      ?auto_125578 - BLOCK
      ?auto_125579 - BLOCK
      ?auto_125580 - BLOCK
      ?auto_125581 - BLOCK
      ?auto_125582 - BLOCK
      ?auto_125583 - BLOCK
      ?auto_125584 - BLOCK
      ?auto_125585 - BLOCK
    )
    :vars
    (
      ?auto_125586 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125585 ?auto_125586 ) ( ON-TABLE ?auto_125576 ) ( ON ?auto_125577 ?auto_125576 ) ( ON ?auto_125578 ?auto_125577 ) ( not ( = ?auto_125576 ?auto_125577 ) ) ( not ( = ?auto_125576 ?auto_125578 ) ) ( not ( = ?auto_125576 ?auto_125579 ) ) ( not ( = ?auto_125576 ?auto_125580 ) ) ( not ( = ?auto_125576 ?auto_125581 ) ) ( not ( = ?auto_125576 ?auto_125582 ) ) ( not ( = ?auto_125576 ?auto_125583 ) ) ( not ( = ?auto_125576 ?auto_125584 ) ) ( not ( = ?auto_125576 ?auto_125585 ) ) ( not ( = ?auto_125576 ?auto_125586 ) ) ( not ( = ?auto_125577 ?auto_125578 ) ) ( not ( = ?auto_125577 ?auto_125579 ) ) ( not ( = ?auto_125577 ?auto_125580 ) ) ( not ( = ?auto_125577 ?auto_125581 ) ) ( not ( = ?auto_125577 ?auto_125582 ) ) ( not ( = ?auto_125577 ?auto_125583 ) ) ( not ( = ?auto_125577 ?auto_125584 ) ) ( not ( = ?auto_125577 ?auto_125585 ) ) ( not ( = ?auto_125577 ?auto_125586 ) ) ( not ( = ?auto_125578 ?auto_125579 ) ) ( not ( = ?auto_125578 ?auto_125580 ) ) ( not ( = ?auto_125578 ?auto_125581 ) ) ( not ( = ?auto_125578 ?auto_125582 ) ) ( not ( = ?auto_125578 ?auto_125583 ) ) ( not ( = ?auto_125578 ?auto_125584 ) ) ( not ( = ?auto_125578 ?auto_125585 ) ) ( not ( = ?auto_125578 ?auto_125586 ) ) ( not ( = ?auto_125579 ?auto_125580 ) ) ( not ( = ?auto_125579 ?auto_125581 ) ) ( not ( = ?auto_125579 ?auto_125582 ) ) ( not ( = ?auto_125579 ?auto_125583 ) ) ( not ( = ?auto_125579 ?auto_125584 ) ) ( not ( = ?auto_125579 ?auto_125585 ) ) ( not ( = ?auto_125579 ?auto_125586 ) ) ( not ( = ?auto_125580 ?auto_125581 ) ) ( not ( = ?auto_125580 ?auto_125582 ) ) ( not ( = ?auto_125580 ?auto_125583 ) ) ( not ( = ?auto_125580 ?auto_125584 ) ) ( not ( = ?auto_125580 ?auto_125585 ) ) ( not ( = ?auto_125580 ?auto_125586 ) ) ( not ( = ?auto_125581 ?auto_125582 ) ) ( not ( = ?auto_125581 ?auto_125583 ) ) ( not ( = ?auto_125581 ?auto_125584 ) ) ( not ( = ?auto_125581 ?auto_125585 ) ) ( not ( = ?auto_125581 ?auto_125586 ) ) ( not ( = ?auto_125582 ?auto_125583 ) ) ( not ( = ?auto_125582 ?auto_125584 ) ) ( not ( = ?auto_125582 ?auto_125585 ) ) ( not ( = ?auto_125582 ?auto_125586 ) ) ( not ( = ?auto_125583 ?auto_125584 ) ) ( not ( = ?auto_125583 ?auto_125585 ) ) ( not ( = ?auto_125583 ?auto_125586 ) ) ( not ( = ?auto_125584 ?auto_125585 ) ) ( not ( = ?auto_125584 ?auto_125586 ) ) ( not ( = ?auto_125585 ?auto_125586 ) ) ( ON ?auto_125584 ?auto_125585 ) ( ON ?auto_125583 ?auto_125584 ) ( ON ?auto_125582 ?auto_125583 ) ( ON ?auto_125581 ?auto_125582 ) ( ON ?auto_125580 ?auto_125581 ) ( CLEAR ?auto_125578 ) ( ON ?auto_125579 ?auto_125580 ) ( CLEAR ?auto_125579 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_125576 ?auto_125577 ?auto_125578 ?auto_125579 )
      ( MAKE-10PILE ?auto_125576 ?auto_125577 ?auto_125578 ?auto_125579 ?auto_125580 ?auto_125581 ?auto_125582 ?auto_125583 ?auto_125584 ?auto_125585 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_125618 - BLOCK
      ?auto_125619 - BLOCK
      ?auto_125620 - BLOCK
      ?auto_125621 - BLOCK
      ?auto_125622 - BLOCK
      ?auto_125623 - BLOCK
      ?auto_125624 - BLOCK
      ?auto_125625 - BLOCK
      ?auto_125626 - BLOCK
      ?auto_125627 - BLOCK
    )
    :vars
    (
      ?auto_125628 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125627 ?auto_125628 ) ( ON-TABLE ?auto_125618 ) ( ON ?auto_125619 ?auto_125618 ) ( not ( = ?auto_125618 ?auto_125619 ) ) ( not ( = ?auto_125618 ?auto_125620 ) ) ( not ( = ?auto_125618 ?auto_125621 ) ) ( not ( = ?auto_125618 ?auto_125622 ) ) ( not ( = ?auto_125618 ?auto_125623 ) ) ( not ( = ?auto_125618 ?auto_125624 ) ) ( not ( = ?auto_125618 ?auto_125625 ) ) ( not ( = ?auto_125618 ?auto_125626 ) ) ( not ( = ?auto_125618 ?auto_125627 ) ) ( not ( = ?auto_125618 ?auto_125628 ) ) ( not ( = ?auto_125619 ?auto_125620 ) ) ( not ( = ?auto_125619 ?auto_125621 ) ) ( not ( = ?auto_125619 ?auto_125622 ) ) ( not ( = ?auto_125619 ?auto_125623 ) ) ( not ( = ?auto_125619 ?auto_125624 ) ) ( not ( = ?auto_125619 ?auto_125625 ) ) ( not ( = ?auto_125619 ?auto_125626 ) ) ( not ( = ?auto_125619 ?auto_125627 ) ) ( not ( = ?auto_125619 ?auto_125628 ) ) ( not ( = ?auto_125620 ?auto_125621 ) ) ( not ( = ?auto_125620 ?auto_125622 ) ) ( not ( = ?auto_125620 ?auto_125623 ) ) ( not ( = ?auto_125620 ?auto_125624 ) ) ( not ( = ?auto_125620 ?auto_125625 ) ) ( not ( = ?auto_125620 ?auto_125626 ) ) ( not ( = ?auto_125620 ?auto_125627 ) ) ( not ( = ?auto_125620 ?auto_125628 ) ) ( not ( = ?auto_125621 ?auto_125622 ) ) ( not ( = ?auto_125621 ?auto_125623 ) ) ( not ( = ?auto_125621 ?auto_125624 ) ) ( not ( = ?auto_125621 ?auto_125625 ) ) ( not ( = ?auto_125621 ?auto_125626 ) ) ( not ( = ?auto_125621 ?auto_125627 ) ) ( not ( = ?auto_125621 ?auto_125628 ) ) ( not ( = ?auto_125622 ?auto_125623 ) ) ( not ( = ?auto_125622 ?auto_125624 ) ) ( not ( = ?auto_125622 ?auto_125625 ) ) ( not ( = ?auto_125622 ?auto_125626 ) ) ( not ( = ?auto_125622 ?auto_125627 ) ) ( not ( = ?auto_125622 ?auto_125628 ) ) ( not ( = ?auto_125623 ?auto_125624 ) ) ( not ( = ?auto_125623 ?auto_125625 ) ) ( not ( = ?auto_125623 ?auto_125626 ) ) ( not ( = ?auto_125623 ?auto_125627 ) ) ( not ( = ?auto_125623 ?auto_125628 ) ) ( not ( = ?auto_125624 ?auto_125625 ) ) ( not ( = ?auto_125624 ?auto_125626 ) ) ( not ( = ?auto_125624 ?auto_125627 ) ) ( not ( = ?auto_125624 ?auto_125628 ) ) ( not ( = ?auto_125625 ?auto_125626 ) ) ( not ( = ?auto_125625 ?auto_125627 ) ) ( not ( = ?auto_125625 ?auto_125628 ) ) ( not ( = ?auto_125626 ?auto_125627 ) ) ( not ( = ?auto_125626 ?auto_125628 ) ) ( not ( = ?auto_125627 ?auto_125628 ) ) ( ON ?auto_125626 ?auto_125627 ) ( ON ?auto_125625 ?auto_125626 ) ( ON ?auto_125624 ?auto_125625 ) ( ON ?auto_125623 ?auto_125624 ) ( ON ?auto_125622 ?auto_125623 ) ( ON ?auto_125621 ?auto_125622 ) ( CLEAR ?auto_125619 ) ( ON ?auto_125620 ?auto_125621 ) ( CLEAR ?auto_125620 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_125618 ?auto_125619 ?auto_125620 )
      ( MAKE-10PILE ?auto_125618 ?auto_125619 ?auto_125620 ?auto_125621 ?auto_125622 ?auto_125623 ?auto_125624 ?auto_125625 ?auto_125626 ?auto_125627 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_125660 - BLOCK
      ?auto_125661 - BLOCK
      ?auto_125662 - BLOCK
      ?auto_125663 - BLOCK
      ?auto_125664 - BLOCK
      ?auto_125665 - BLOCK
      ?auto_125666 - BLOCK
      ?auto_125667 - BLOCK
      ?auto_125668 - BLOCK
      ?auto_125669 - BLOCK
    )
    :vars
    (
      ?auto_125670 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125669 ?auto_125670 ) ( ON-TABLE ?auto_125660 ) ( not ( = ?auto_125660 ?auto_125661 ) ) ( not ( = ?auto_125660 ?auto_125662 ) ) ( not ( = ?auto_125660 ?auto_125663 ) ) ( not ( = ?auto_125660 ?auto_125664 ) ) ( not ( = ?auto_125660 ?auto_125665 ) ) ( not ( = ?auto_125660 ?auto_125666 ) ) ( not ( = ?auto_125660 ?auto_125667 ) ) ( not ( = ?auto_125660 ?auto_125668 ) ) ( not ( = ?auto_125660 ?auto_125669 ) ) ( not ( = ?auto_125660 ?auto_125670 ) ) ( not ( = ?auto_125661 ?auto_125662 ) ) ( not ( = ?auto_125661 ?auto_125663 ) ) ( not ( = ?auto_125661 ?auto_125664 ) ) ( not ( = ?auto_125661 ?auto_125665 ) ) ( not ( = ?auto_125661 ?auto_125666 ) ) ( not ( = ?auto_125661 ?auto_125667 ) ) ( not ( = ?auto_125661 ?auto_125668 ) ) ( not ( = ?auto_125661 ?auto_125669 ) ) ( not ( = ?auto_125661 ?auto_125670 ) ) ( not ( = ?auto_125662 ?auto_125663 ) ) ( not ( = ?auto_125662 ?auto_125664 ) ) ( not ( = ?auto_125662 ?auto_125665 ) ) ( not ( = ?auto_125662 ?auto_125666 ) ) ( not ( = ?auto_125662 ?auto_125667 ) ) ( not ( = ?auto_125662 ?auto_125668 ) ) ( not ( = ?auto_125662 ?auto_125669 ) ) ( not ( = ?auto_125662 ?auto_125670 ) ) ( not ( = ?auto_125663 ?auto_125664 ) ) ( not ( = ?auto_125663 ?auto_125665 ) ) ( not ( = ?auto_125663 ?auto_125666 ) ) ( not ( = ?auto_125663 ?auto_125667 ) ) ( not ( = ?auto_125663 ?auto_125668 ) ) ( not ( = ?auto_125663 ?auto_125669 ) ) ( not ( = ?auto_125663 ?auto_125670 ) ) ( not ( = ?auto_125664 ?auto_125665 ) ) ( not ( = ?auto_125664 ?auto_125666 ) ) ( not ( = ?auto_125664 ?auto_125667 ) ) ( not ( = ?auto_125664 ?auto_125668 ) ) ( not ( = ?auto_125664 ?auto_125669 ) ) ( not ( = ?auto_125664 ?auto_125670 ) ) ( not ( = ?auto_125665 ?auto_125666 ) ) ( not ( = ?auto_125665 ?auto_125667 ) ) ( not ( = ?auto_125665 ?auto_125668 ) ) ( not ( = ?auto_125665 ?auto_125669 ) ) ( not ( = ?auto_125665 ?auto_125670 ) ) ( not ( = ?auto_125666 ?auto_125667 ) ) ( not ( = ?auto_125666 ?auto_125668 ) ) ( not ( = ?auto_125666 ?auto_125669 ) ) ( not ( = ?auto_125666 ?auto_125670 ) ) ( not ( = ?auto_125667 ?auto_125668 ) ) ( not ( = ?auto_125667 ?auto_125669 ) ) ( not ( = ?auto_125667 ?auto_125670 ) ) ( not ( = ?auto_125668 ?auto_125669 ) ) ( not ( = ?auto_125668 ?auto_125670 ) ) ( not ( = ?auto_125669 ?auto_125670 ) ) ( ON ?auto_125668 ?auto_125669 ) ( ON ?auto_125667 ?auto_125668 ) ( ON ?auto_125666 ?auto_125667 ) ( ON ?auto_125665 ?auto_125666 ) ( ON ?auto_125664 ?auto_125665 ) ( ON ?auto_125663 ?auto_125664 ) ( ON ?auto_125662 ?auto_125663 ) ( CLEAR ?auto_125660 ) ( ON ?auto_125661 ?auto_125662 ) ( CLEAR ?auto_125661 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_125660 ?auto_125661 )
      ( MAKE-10PILE ?auto_125660 ?auto_125661 ?auto_125662 ?auto_125663 ?auto_125664 ?auto_125665 ?auto_125666 ?auto_125667 ?auto_125668 ?auto_125669 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_125702 - BLOCK
      ?auto_125703 - BLOCK
      ?auto_125704 - BLOCK
      ?auto_125705 - BLOCK
      ?auto_125706 - BLOCK
      ?auto_125707 - BLOCK
      ?auto_125708 - BLOCK
      ?auto_125709 - BLOCK
      ?auto_125710 - BLOCK
      ?auto_125711 - BLOCK
    )
    :vars
    (
      ?auto_125712 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125711 ?auto_125712 ) ( not ( = ?auto_125702 ?auto_125703 ) ) ( not ( = ?auto_125702 ?auto_125704 ) ) ( not ( = ?auto_125702 ?auto_125705 ) ) ( not ( = ?auto_125702 ?auto_125706 ) ) ( not ( = ?auto_125702 ?auto_125707 ) ) ( not ( = ?auto_125702 ?auto_125708 ) ) ( not ( = ?auto_125702 ?auto_125709 ) ) ( not ( = ?auto_125702 ?auto_125710 ) ) ( not ( = ?auto_125702 ?auto_125711 ) ) ( not ( = ?auto_125702 ?auto_125712 ) ) ( not ( = ?auto_125703 ?auto_125704 ) ) ( not ( = ?auto_125703 ?auto_125705 ) ) ( not ( = ?auto_125703 ?auto_125706 ) ) ( not ( = ?auto_125703 ?auto_125707 ) ) ( not ( = ?auto_125703 ?auto_125708 ) ) ( not ( = ?auto_125703 ?auto_125709 ) ) ( not ( = ?auto_125703 ?auto_125710 ) ) ( not ( = ?auto_125703 ?auto_125711 ) ) ( not ( = ?auto_125703 ?auto_125712 ) ) ( not ( = ?auto_125704 ?auto_125705 ) ) ( not ( = ?auto_125704 ?auto_125706 ) ) ( not ( = ?auto_125704 ?auto_125707 ) ) ( not ( = ?auto_125704 ?auto_125708 ) ) ( not ( = ?auto_125704 ?auto_125709 ) ) ( not ( = ?auto_125704 ?auto_125710 ) ) ( not ( = ?auto_125704 ?auto_125711 ) ) ( not ( = ?auto_125704 ?auto_125712 ) ) ( not ( = ?auto_125705 ?auto_125706 ) ) ( not ( = ?auto_125705 ?auto_125707 ) ) ( not ( = ?auto_125705 ?auto_125708 ) ) ( not ( = ?auto_125705 ?auto_125709 ) ) ( not ( = ?auto_125705 ?auto_125710 ) ) ( not ( = ?auto_125705 ?auto_125711 ) ) ( not ( = ?auto_125705 ?auto_125712 ) ) ( not ( = ?auto_125706 ?auto_125707 ) ) ( not ( = ?auto_125706 ?auto_125708 ) ) ( not ( = ?auto_125706 ?auto_125709 ) ) ( not ( = ?auto_125706 ?auto_125710 ) ) ( not ( = ?auto_125706 ?auto_125711 ) ) ( not ( = ?auto_125706 ?auto_125712 ) ) ( not ( = ?auto_125707 ?auto_125708 ) ) ( not ( = ?auto_125707 ?auto_125709 ) ) ( not ( = ?auto_125707 ?auto_125710 ) ) ( not ( = ?auto_125707 ?auto_125711 ) ) ( not ( = ?auto_125707 ?auto_125712 ) ) ( not ( = ?auto_125708 ?auto_125709 ) ) ( not ( = ?auto_125708 ?auto_125710 ) ) ( not ( = ?auto_125708 ?auto_125711 ) ) ( not ( = ?auto_125708 ?auto_125712 ) ) ( not ( = ?auto_125709 ?auto_125710 ) ) ( not ( = ?auto_125709 ?auto_125711 ) ) ( not ( = ?auto_125709 ?auto_125712 ) ) ( not ( = ?auto_125710 ?auto_125711 ) ) ( not ( = ?auto_125710 ?auto_125712 ) ) ( not ( = ?auto_125711 ?auto_125712 ) ) ( ON ?auto_125710 ?auto_125711 ) ( ON ?auto_125709 ?auto_125710 ) ( ON ?auto_125708 ?auto_125709 ) ( ON ?auto_125707 ?auto_125708 ) ( ON ?auto_125706 ?auto_125707 ) ( ON ?auto_125705 ?auto_125706 ) ( ON ?auto_125704 ?auto_125705 ) ( ON ?auto_125703 ?auto_125704 ) ( ON ?auto_125702 ?auto_125703 ) ( CLEAR ?auto_125702 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_125702 )
      ( MAKE-10PILE ?auto_125702 ?auto_125703 ?auto_125704 ?auto_125705 ?auto_125706 ?auto_125707 ?auto_125708 ?auto_125709 ?auto_125710 ?auto_125711 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_125745 - BLOCK
      ?auto_125746 - BLOCK
      ?auto_125747 - BLOCK
      ?auto_125748 - BLOCK
      ?auto_125749 - BLOCK
      ?auto_125750 - BLOCK
      ?auto_125751 - BLOCK
      ?auto_125752 - BLOCK
      ?auto_125753 - BLOCK
      ?auto_125754 - BLOCK
      ?auto_125755 - BLOCK
    )
    :vars
    (
      ?auto_125756 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_125754 ) ( ON ?auto_125755 ?auto_125756 ) ( CLEAR ?auto_125755 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_125745 ) ( ON ?auto_125746 ?auto_125745 ) ( ON ?auto_125747 ?auto_125746 ) ( ON ?auto_125748 ?auto_125747 ) ( ON ?auto_125749 ?auto_125748 ) ( ON ?auto_125750 ?auto_125749 ) ( ON ?auto_125751 ?auto_125750 ) ( ON ?auto_125752 ?auto_125751 ) ( ON ?auto_125753 ?auto_125752 ) ( ON ?auto_125754 ?auto_125753 ) ( not ( = ?auto_125745 ?auto_125746 ) ) ( not ( = ?auto_125745 ?auto_125747 ) ) ( not ( = ?auto_125745 ?auto_125748 ) ) ( not ( = ?auto_125745 ?auto_125749 ) ) ( not ( = ?auto_125745 ?auto_125750 ) ) ( not ( = ?auto_125745 ?auto_125751 ) ) ( not ( = ?auto_125745 ?auto_125752 ) ) ( not ( = ?auto_125745 ?auto_125753 ) ) ( not ( = ?auto_125745 ?auto_125754 ) ) ( not ( = ?auto_125745 ?auto_125755 ) ) ( not ( = ?auto_125745 ?auto_125756 ) ) ( not ( = ?auto_125746 ?auto_125747 ) ) ( not ( = ?auto_125746 ?auto_125748 ) ) ( not ( = ?auto_125746 ?auto_125749 ) ) ( not ( = ?auto_125746 ?auto_125750 ) ) ( not ( = ?auto_125746 ?auto_125751 ) ) ( not ( = ?auto_125746 ?auto_125752 ) ) ( not ( = ?auto_125746 ?auto_125753 ) ) ( not ( = ?auto_125746 ?auto_125754 ) ) ( not ( = ?auto_125746 ?auto_125755 ) ) ( not ( = ?auto_125746 ?auto_125756 ) ) ( not ( = ?auto_125747 ?auto_125748 ) ) ( not ( = ?auto_125747 ?auto_125749 ) ) ( not ( = ?auto_125747 ?auto_125750 ) ) ( not ( = ?auto_125747 ?auto_125751 ) ) ( not ( = ?auto_125747 ?auto_125752 ) ) ( not ( = ?auto_125747 ?auto_125753 ) ) ( not ( = ?auto_125747 ?auto_125754 ) ) ( not ( = ?auto_125747 ?auto_125755 ) ) ( not ( = ?auto_125747 ?auto_125756 ) ) ( not ( = ?auto_125748 ?auto_125749 ) ) ( not ( = ?auto_125748 ?auto_125750 ) ) ( not ( = ?auto_125748 ?auto_125751 ) ) ( not ( = ?auto_125748 ?auto_125752 ) ) ( not ( = ?auto_125748 ?auto_125753 ) ) ( not ( = ?auto_125748 ?auto_125754 ) ) ( not ( = ?auto_125748 ?auto_125755 ) ) ( not ( = ?auto_125748 ?auto_125756 ) ) ( not ( = ?auto_125749 ?auto_125750 ) ) ( not ( = ?auto_125749 ?auto_125751 ) ) ( not ( = ?auto_125749 ?auto_125752 ) ) ( not ( = ?auto_125749 ?auto_125753 ) ) ( not ( = ?auto_125749 ?auto_125754 ) ) ( not ( = ?auto_125749 ?auto_125755 ) ) ( not ( = ?auto_125749 ?auto_125756 ) ) ( not ( = ?auto_125750 ?auto_125751 ) ) ( not ( = ?auto_125750 ?auto_125752 ) ) ( not ( = ?auto_125750 ?auto_125753 ) ) ( not ( = ?auto_125750 ?auto_125754 ) ) ( not ( = ?auto_125750 ?auto_125755 ) ) ( not ( = ?auto_125750 ?auto_125756 ) ) ( not ( = ?auto_125751 ?auto_125752 ) ) ( not ( = ?auto_125751 ?auto_125753 ) ) ( not ( = ?auto_125751 ?auto_125754 ) ) ( not ( = ?auto_125751 ?auto_125755 ) ) ( not ( = ?auto_125751 ?auto_125756 ) ) ( not ( = ?auto_125752 ?auto_125753 ) ) ( not ( = ?auto_125752 ?auto_125754 ) ) ( not ( = ?auto_125752 ?auto_125755 ) ) ( not ( = ?auto_125752 ?auto_125756 ) ) ( not ( = ?auto_125753 ?auto_125754 ) ) ( not ( = ?auto_125753 ?auto_125755 ) ) ( not ( = ?auto_125753 ?auto_125756 ) ) ( not ( = ?auto_125754 ?auto_125755 ) ) ( not ( = ?auto_125754 ?auto_125756 ) ) ( not ( = ?auto_125755 ?auto_125756 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_125755 ?auto_125756 )
      ( !STACK ?auto_125755 ?auto_125754 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_125768 - BLOCK
      ?auto_125769 - BLOCK
      ?auto_125770 - BLOCK
      ?auto_125771 - BLOCK
      ?auto_125772 - BLOCK
      ?auto_125773 - BLOCK
      ?auto_125774 - BLOCK
      ?auto_125775 - BLOCK
      ?auto_125776 - BLOCK
      ?auto_125777 - BLOCK
      ?auto_125778 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_125777 ) ( ON-TABLE ?auto_125778 ) ( CLEAR ?auto_125778 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_125768 ) ( ON ?auto_125769 ?auto_125768 ) ( ON ?auto_125770 ?auto_125769 ) ( ON ?auto_125771 ?auto_125770 ) ( ON ?auto_125772 ?auto_125771 ) ( ON ?auto_125773 ?auto_125772 ) ( ON ?auto_125774 ?auto_125773 ) ( ON ?auto_125775 ?auto_125774 ) ( ON ?auto_125776 ?auto_125775 ) ( ON ?auto_125777 ?auto_125776 ) ( not ( = ?auto_125768 ?auto_125769 ) ) ( not ( = ?auto_125768 ?auto_125770 ) ) ( not ( = ?auto_125768 ?auto_125771 ) ) ( not ( = ?auto_125768 ?auto_125772 ) ) ( not ( = ?auto_125768 ?auto_125773 ) ) ( not ( = ?auto_125768 ?auto_125774 ) ) ( not ( = ?auto_125768 ?auto_125775 ) ) ( not ( = ?auto_125768 ?auto_125776 ) ) ( not ( = ?auto_125768 ?auto_125777 ) ) ( not ( = ?auto_125768 ?auto_125778 ) ) ( not ( = ?auto_125769 ?auto_125770 ) ) ( not ( = ?auto_125769 ?auto_125771 ) ) ( not ( = ?auto_125769 ?auto_125772 ) ) ( not ( = ?auto_125769 ?auto_125773 ) ) ( not ( = ?auto_125769 ?auto_125774 ) ) ( not ( = ?auto_125769 ?auto_125775 ) ) ( not ( = ?auto_125769 ?auto_125776 ) ) ( not ( = ?auto_125769 ?auto_125777 ) ) ( not ( = ?auto_125769 ?auto_125778 ) ) ( not ( = ?auto_125770 ?auto_125771 ) ) ( not ( = ?auto_125770 ?auto_125772 ) ) ( not ( = ?auto_125770 ?auto_125773 ) ) ( not ( = ?auto_125770 ?auto_125774 ) ) ( not ( = ?auto_125770 ?auto_125775 ) ) ( not ( = ?auto_125770 ?auto_125776 ) ) ( not ( = ?auto_125770 ?auto_125777 ) ) ( not ( = ?auto_125770 ?auto_125778 ) ) ( not ( = ?auto_125771 ?auto_125772 ) ) ( not ( = ?auto_125771 ?auto_125773 ) ) ( not ( = ?auto_125771 ?auto_125774 ) ) ( not ( = ?auto_125771 ?auto_125775 ) ) ( not ( = ?auto_125771 ?auto_125776 ) ) ( not ( = ?auto_125771 ?auto_125777 ) ) ( not ( = ?auto_125771 ?auto_125778 ) ) ( not ( = ?auto_125772 ?auto_125773 ) ) ( not ( = ?auto_125772 ?auto_125774 ) ) ( not ( = ?auto_125772 ?auto_125775 ) ) ( not ( = ?auto_125772 ?auto_125776 ) ) ( not ( = ?auto_125772 ?auto_125777 ) ) ( not ( = ?auto_125772 ?auto_125778 ) ) ( not ( = ?auto_125773 ?auto_125774 ) ) ( not ( = ?auto_125773 ?auto_125775 ) ) ( not ( = ?auto_125773 ?auto_125776 ) ) ( not ( = ?auto_125773 ?auto_125777 ) ) ( not ( = ?auto_125773 ?auto_125778 ) ) ( not ( = ?auto_125774 ?auto_125775 ) ) ( not ( = ?auto_125774 ?auto_125776 ) ) ( not ( = ?auto_125774 ?auto_125777 ) ) ( not ( = ?auto_125774 ?auto_125778 ) ) ( not ( = ?auto_125775 ?auto_125776 ) ) ( not ( = ?auto_125775 ?auto_125777 ) ) ( not ( = ?auto_125775 ?auto_125778 ) ) ( not ( = ?auto_125776 ?auto_125777 ) ) ( not ( = ?auto_125776 ?auto_125778 ) ) ( not ( = ?auto_125777 ?auto_125778 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_125778 )
      ( !STACK ?auto_125778 ?auto_125777 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_125790 - BLOCK
      ?auto_125791 - BLOCK
      ?auto_125792 - BLOCK
      ?auto_125793 - BLOCK
      ?auto_125794 - BLOCK
      ?auto_125795 - BLOCK
      ?auto_125796 - BLOCK
      ?auto_125797 - BLOCK
      ?auto_125798 - BLOCK
      ?auto_125799 - BLOCK
      ?auto_125800 - BLOCK
    )
    :vars
    (
      ?auto_125801 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125800 ?auto_125801 ) ( ON-TABLE ?auto_125790 ) ( ON ?auto_125791 ?auto_125790 ) ( ON ?auto_125792 ?auto_125791 ) ( ON ?auto_125793 ?auto_125792 ) ( ON ?auto_125794 ?auto_125793 ) ( ON ?auto_125795 ?auto_125794 ) ( ON ?auto_125796 ?auto_125795 ) ( ON ?auto_125797 ?auto_125796 ) ( ON ?auto_125798 ?auto_125797 ) ( not ( = ?auto_125790 ?auto_125791 ) ) ( not ( = ?auto_125790 ?auto_125792 ) ) ( not ( = ?auto_125790 ?auto_125793 ) ) ( not ( = ?auto_125790 ?auto_125794 ) ) ( not ( = ?auto_125790 ?auto_125795 ) ) ( not ( = ?auto_125790 ?auto_125796 ) ) ( not ( = ?auto_125790 ?auto_125797 ) ) ( not ( = ?auto_125790 ?auto_125798 ) ) ( not ( = ?auto_125790 ?auto_125799 ) ) ( not ( = ?auto_125790 ?auto_125800 ) ) ( not ( = ?auto_125790 ?auto_125801 ) ) ( not ( = ?auto_125791 ?auto_125792 ) ) ( not ( = ?auto_125791 ?auto_125793 ) ) ( not ( = ?auto_125791 ?auto_125794 ) ) ( not ( = ?auto_125791 ?auto_125795 ) ) ( not ( = ?auto_125791 ?auto_125796 ) ) ( not ( = ?auto_125791 ?auto_125797 ) ) ( not ( = ?auto_125791 ?auto_125798 ) ) ( not ( = ?auto_125791 ?auto_125799 ) ) ( not ( = ?auto_125791 ?auto_125800 ) ) ( not ( = ?auto_125791 ?auto_125801 ) ) ( not ( = ?auto_125792 ?auto_125793 ) ) ( not ( = ?auto_125792 ?auto_125794 ) ) ( not ( = ?auto_125792 ?auto_125795 ) ) ( not ( = ?auto_125792 ?auto_125796 ) ) ( not ( = ?auto_125792 ?auto_125797 ) ) ( not ( = ?auto_125792 ?auto_125798 ) ) ( not ( = ?auto_125792 ?auto_125799 ) ) ( not ( = ?auto_125792 ?auto_125800 ) ) ( not ( = ?auto_125792 ?auto_125801 ) ) ( not ( = ?auto_125793 ?auto_125794 ) ) ( not ( = ?auto_125793 ?auto_125795 ) ) ( not ( = ?auto_125793 ?auto_125796 ) ) ( not ( = ?auto_125793 ?auto_125797 ) ) ( not ( = ?auto_125793 ?auto_125798 ) ) ( not ( = ?auto_125793 ?auto_125799 ) ) ( not ( = ?auto_125793 ?auto_125800 ) ) ( not ( = ?auto_125793 ?auto_125801 ) ) ( not ( = ?auto_125794 ?auto_125795 ) ) ( not ( = ?auto_125794 ?auto_125796 ) ) ( not ( = ?auto_125794 ?auto_125797 ) ) ( not ( = ?auto_125794 ?auto_125798 ) ) ( not ( = ?auto_125794 ?auto_125799 ) ) ( not ( = ?auto_125794 ?auto_125800 ) ) ( not ( = ?auto_125794 ?auto_125801 ) ) ( not ( = ?auto_125795 ?auto_125796 ) ) ( not ( = ?auto_125795 ?auto_125797 ) ) ( not ( = ?auto_125795 ?auto_125798 ) ) ( not ( = ?auto_125795 ?auto_125799 ) ) ( not ( = ?auto_125795 ?auto_125800 ) ) ( not ( = ?auto_125795 ?auto_125801 ) ) ( not ( = ?auto_125796 ?auto_125797 ) ) ( not ( = ?auto_125796 ?auto_125798 ) ) ( not ( = ?auto_125796 ?auto_125799 ) ) ( not ( = ?auto_125796 ?auto_125800 ) ) ( not ( = ?auto_125796 ?auto_125801 ) ) ( not ( = ?auto_125797 ?auto_125798 ) ) ( not ( = ?auto_125797 ?auto_125799 ) ) ( not ( = ?auto_125797 ?auto_125800 ) ) ( not ( = ?auto_125797 ?auto_125801 ) ) ( not ( = ?auto_125798 ?auto_125799 ) ) ( not ( = ?auto_125798 ?auto_125800 ) ) ( not ( = ?auto_125798 ?auto_125801 ) ) ( not ( = ?auto_125799 ?auto_125800 ) ) ( not ( = ?auto_125799 ?auto_125801 ) ) ( not ( = ?auto_125800 ?auto_125801 ) ) ( CLEAR ?auto_125798 ) ( ON ?auto_125799 ?auto_125800 ) ( CLEAR ?auto_125799 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_125790 ?auto_125791 ?auto_125792 ?auto_125793 ?auto_125794 ?auto_125795 ?auto_125796 ?auto_125797 ?auto_125798 ?auto_125799 )
      ( MAKE-11PILE ?auto_125790 ?auto_125791 ?auto_125792 ?auto_125793 ?auto_125794 ?auto_125795 ?auto_125796 ?auto_125797 ?auto_125798 ?auto_125799 ?auto_125800 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_125813 - BLOCK
      ?auto_125814 - BLOCK
      ?auto_125815 - BLOCK
      ?auto_125816 - BLOCK
      ?auto_125817 - BLOCK
      ?auto_125818 - BLOCK
      ?auto_125819 - BLOCK
      ?auto_125820 - BLOCK
      ?auto_125821 - BLOCK
      ?auto_125822 - BLOCK
      ?auto_125823 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_125823 ) ( ON-TABLE ?auto_125813 ) ( ON ?auto_125814 ?auto_125813 ) ( ON ?auto_125815 ?auto_125814 ) ( ON ?auto_125816 ?auto_125815 ) ( ON ?auto_125817 ?auto_125816 ) ( ON ?auto_125818 ?auto_125817 ) ( ON ?auto_125819 ?auto_125818 ) ( ON ?auto_125820 ?auto_125819 ) ( ON ?auto_125821 ?auto_125820 ) ( not ( = ?auto_125813 ?auto_125814 ) ) ( not ( = ?auto_125813 ?auto_125815 ) ) ( not ( = ?auto_125813 ?auto_125816 ) ) ( not ( = ?auto_125813 ?auto_125817 ) ) ( not ( = ?auto_125813 ?auto_125818 ) ) ( not ( = ?auto_125813 ?auto_125819 ) ) ( not ( = ?auto_125813 ?auto_125820 ) ) ( not ( = ?auto_125813 ?auto_125821 ) ) ( not ( = ?auto_125813 ?auto_125822 ) ) ( not ( = ?auto_125813 ?auto_125823 ) ) ( not ( = ?auto_125814 ?auto_125815 ) ) ( not ( = ?auto_125814 ?auto_125816 ) ) ( not ( = ?auto_125814 ?auto_125817 ) ) ( not ( = ?auto_125814 ?auto_125818 ) ) ( not ( = ?auto_125814 ?auto_125819 ) ) ( not ( = ?auto_125814 ?auto_125820 ) ) ( not ( = ?auto_125814 ?auto_125821 ) ) ( not ( = ?auto_125814 ?auto_125822 ) ) ( not ( = ?auto_125814 ?auto_125823 ) ) ( not ( = ?auto_125815 ?auto_125816 ) ) ( not ( = ?auto_125815 ?auto_125817 ) ) ( not ( = ?auto_125815 ?auto_125818 ) ) ( not ( = ?auto_125815 ?auto_125819 ) ) ( not ( = ?auto_125815 ?auto_125820 ) ) ( not ( = ?auto_125815 ?auto_125821 ) ) ( not ( = ?auto_125815 ?auto_125822 ) ) ( not ( = ?auto_125815 ?auto_125823 ) ) ( not ( = ?auto_125816 ?auto_125817 ) ) ( not ( = ?auto_125816 ?auto_125818 ) ) ( not ( = ?auto_125816 ?auto_125819 ) ) ( not ( = ?auto_125816 ?auto_125820 ) ) ( not ( = ?auto_125816 ?auto_125821 ) ) ( not ( = ?auto_125816 ?auto_125822 ) ) ( not ( = ?auto_125816 ?auto_125823 ) ) ( not ( = ?auto_125817 ?auto_125818 ) ) ( not ( = ?auto_125817 ?auto_125819 ) ) ( not ( = ?auto_125817 ?auto_125820 ) ) ( not ( = ?auto_125817 ?auto_125821 ) ) ( not ( = ?auto_125817 ?auto_125822 ) ) ( not ( = ?auto_125817 ?auto_125823 ) ) ( not ( = ?auto_125818 ?auto_125819 ) ) ( not ( = ?auto_125818 ?auto_125820 ) ) ( not ( = ?auto_125818 ?auto_125821 ) ) ( not ( = ?auto_125818 ?auto_125822 ) ) ( not ( = ?auto_125818 ?auto_125823 ) ) ( not ( = ?auto_125819 ?auto_125820 ) ) ( not ( = ?auto_125819 ?auto_125821 ) ) ( not ( = ?auto_125819 ?auto_125822 ) ) ( not ( = ?auto_125819 ?auto_125823 ) ) ( not ( = ?auto_125820 ?auto_125821 ) ) ( not ( = ?auto_125820 ?auto_125822 ) ) ( not ( = ?auto_125820 ?auto_125823 ) ) ( not ( = ?auto_125821 ?auto_125822 ) ) ( not ( = ?auto_125821 ?auto_125823 ) ) ( not ( = ?auto_125822 ?auto_125823 ) ) ( CLEAR ?auto_125821 ) ( ON ?auto_125822 ?auto_125823 ) ( CLEAR ?auto_125822 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_125813 ?auto_125814 ?auto_125815 ?auto_125816 ?auto_125817 ?auto_125818 ?auto_125819 ?auto_125820 ?auto_125821 ?auto_125822 )
      ( MAKE-11PILE ?auto_125813 ?auto_125814 ?auto_125815 ?auto_125816 ?auto_125817 ?auto_125818 ?auto_125819 ?auto_125820 ?auto_125821 ?auto_125822 ?auto_125823 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_125835 - BLOCK
      ?auto_125836 - BLOCK
      ?auto_125837 - BLOCK
      ?auto_125838 - BLOCK
      ?auto_125839 - BLOCK
      ?auto_125840 - BLOCK
      ?auto_125841 - BLOCK
      ?auto_125842 - BLOCK
      ?auto_125843 - BLOCK
      ?auto_125844 - BLOCK
      ?auto_125845 - BLOCK
    )
    :vars
    (
      ?auto_125846 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125845 ?auto_125846 ) ( ON-TABLE ?auto_125835 ) ( ON ?auto_125836 ?auto_125835 ) ( ON ?auto_125837 ?auto_125836 ) ( ON ?auto_125838 ?auto_125837 ) ( ON ?auto_125839 ?auto_125838 ) ( ON ?auto_125840 ?auto_125839 ) ( ON ?auto_125841 ?auto_125840 ) ( ON ?auto_125842 ?auto_125841 ) ( not ( = ?auto_125835 ?auto_125836 ) ) ( not ( = ?auto_125835 ?auto_125837 ) ) ( not ( = ?auto_125835 ?auto_125838 ) ) ( not ( = ?auto_125835 ?auto_125839 ) ) ( not ( = ?auto_125835 ?auto_125840 ) ) ( not ( = ?auto_125835 ?auto_125841 ) ) ( not ( = ?auto_125835 ?auto_125842 ) ) ( not ( = ?auto_125835 ?auto_125843 ) ) ( not ( = ?auto_125835 ?auto_125844 ) ) ( not ( = ?auto_125835 ?auto_125845 ) ) ( not ( = ?auto_125835 ?auto_125846 ) ) ( not ( = ?auto_125836 ?auto_125837 ) ) ( not ( = ?auto_125836 ?auto_125838 ) ) ( not ( = ?auto_125836 ?auto_125839 ) ) ( not ( = ?auto_125836 ?auto_125840 ) ) ( not ( = ?auto_125836 ?auto_125841 ) ) ( not ( = ?auto_125836 ?auto_125842 ) ) ( not ( = ?auto_125836 ?auto_125843 ) ) ( not ( = ?auto_125836 ?auto_125844 ) ) ( not ( = ?auto_125836 ?auto_125845 ) ) ( not ( = ?auto_125836 ?auto_125846 ) ) ( not ( = ?auto_125837 ?auto_125838 ) ) ( not ( = ?auto_125837 ?auto_125839 ) ) ( not ( = ?auto_125837 ?auto_125840 ) ) ( not ( = ?auto_125837 ?auto_125841 ) ) ( not ( = ?auto_125837 ?auto_125842 ) ) ( not ( = ?auto_125837 ?auto_125843 ) ) ( not ( = ?auto_125837 ?auto_125844 ) ) ( not ( = ?auto_125837 ?auto_125845 ) ) ( not ( = ?auto_125837 ?auto_125846 ) ) ( not ( = ?auto_125838 ?auto_125839 ) ) ( not ( = ?auto_125838 ?auto_125840 ) ) ( not ( = ?auto_125838 ?auto_125841 ) ) ( not ( = ?auto_125838 ?auto_125842 ) ) ( not ( = ?auto_125838 ?auto_125843 ) ) ( not ( = ?auto_125838 ?auto_125844 ) ) ( not ( = ?auto_125838 ?auto_125845 ) ) ( not ( = ?auto_125838 ?auto_125846 ) ) ( not ( = ?auto_125839 ?auto_125840 ) ) ( not ( = ?auto_125839 ?auto_125841 ) ) ( not ( = ?auto_125839 ?auto_125842 ) ) ( not ( = ?auto_125839 ?auto_125843 ) ) ( not ( = ?auto_125839 ?auto_125844 ) ) ( not ( = ?auto_125839 ?auto_125845 ) ) ( not ( = ?auto_125839 ?auto_125846 ) ) ( not ( = ?auto_125840 ?auto_125841 ) ) ( not ( = ?auto_125840 ?auto_125842 ) ) ( not ( = ?auto_125840 ?auto_125843 ) ) ( not ( = ?auto_125840 ?auto_125844 ) ) ( not ( = ?auto_125840 ?auto_125845 ) ) ( not ( = ?auto_125840 ?auto_125846 ) ) ( not ( = ?auto_125841 ?auto_125842 ) ) ( not ( = ?auto_125841 ?auto_125843 ) ) ( not ( = ?auto_125841 ?auto_125844 ) ) ( not ( = ?auto_125841 ?auto_125845 ) ) ( not ( = ?auto_125841 ?auto_125846 ) ) ( not ( = ?auto_125842 ?auto_125843 ) ) ( not ( = ?auto_125842 ?auto_125844 ) ) ( not ( = ?auto_125842 ?auto_125845 ) ) ( not ( = ?auto_125842 ?auto_125846 ) ) ( not ( = ?auto_125843 ?auto_125844 ) ) ( not ( = ?auto_125843 ?auto_125845 ) ) ( not ( = ?auto_125843 ?auto_125846 ) ) ( not ( = ?auto_125844 ?auto_125845 ) ) ( not ( = ?auto_125844 ?auto_125846 ) ) ( not ( = ?auto_125845 ?auto_125846 ) ) ( ON ?auto_125844 ?auto_125845 ) ( CLEAR ?auto_125842 ) ( ON ?auto_125843 ?auto_125844 ) ( CLEAR ?auto_125843 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_125835 ?auto_125836 ?auto_125837 ?auto_125838 ?auto_125839 ?auto_125840 ?auto_125841 ?auto_125842 ?auto_125843 )
      ( MAKE-11PILE ?auto_125835 ?auto_125836 ?auto_125837 ?auto_125838 ?auto_125839 ?auto_125840 ?auto_125841 ?auto_125842 ?auto_125843 ?auto_125844 ?auto_125845 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_125858 - BLOCK
      ?auto_125859 - BLOCK
      ?auto_125860 - BLOCK
      ?auto_125861 - BLOCK
      ?auto_125862 - BLOCK
      ?auto_125863 - BLOCK
      ?auto_125864 - BLOCK
      ?auto_125865 - BLOCK
      ?auto_125866 - BLOCK
      ?auto_125867 - BLOCK
      ?auto_125868 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_125868 ) ( ON-TABLE ?auto_125858 ) ( ON ?auto_125859 ?auto_125858 ) ( ON ?auto_125860 ?auto_125859 ) ( ON ?auto_125861 ?auto_125860 ) ( ON ?auto_125862 ?auto_125861 ) ( ON ?auto_125863 ?auto_125862 ) ( ON ?auto_125864 ?auto_125863 ) ( ON ?auto_125865 ?auto_125864 ) ( not ( = ?auto_125858 ?auto_125859 ) ) ( not ( = ?auto_125858 ?auto_125860 ) ) ( not ( = ?auto_125858 ?auto_125861 ) ) ( not ( = ?auto_125858 ?auto_125862 ) ) ( not ( = ?auto_125858 ?auto_125863 ) ) ( not ( = ?auto_125858 ?auto_125864 ) ) ( not ( = ?auto_125858 ?auto_125865 ) ) ( not ( = ?auto_125858 ?auto_125866 ) ) ( not ( = ?auto_125858 ?auto_125867 ) ) ( not ( = ?auto_125858 ?auto_125868 ) ) ( not ( = ?auto_125859 ?auto_125860 ) ) ( not ( = ?auto_125859 ?auto_125861 ) ) ( not ( = ?auto_125859 ?auto_125862 ) ) ( not ( = ?auto_125859 ?auto_125863 ) ) ( not ( = ?auto_125859 ?auto_125864 ) ) ( not ( = ?auto_125859 ?auto_125865 ) ) ( not ( = ?auto_125859 ?auto_125866 ) ) ( not ( = ?auto_125859 ?auto_125867 ) ) ( not ( = ?auto_125859 ?auto_125868 ) ) ( not ( = ?auto_125860 ?auto_125861 ) ) ( not ( = ?auto_125860 ?auto_125862 ) ) ( not ( = ?auto_125860 ?auto_125863 ) ) ( not ( = ?auto_125860 ?auto_125864 ) ) ( not ( = ?auto_125860 ?auto_125865 ) ) ( not ( = ?auto_125860 ?auto_125866 ) ) ( not ( = ?auto_125860 ?auto_125867 ) ) ( not ( = ?auto_125860 ?auto_125868 ) ) ( not ( = ?auto_125861 ?auto_125862 ) ) ( not ( = ?auto_125861 ?auto_125863 ) ) ( not ( = ?auto_125861 ?auto_125864 ) ) ( not ( = ?auto_125861 ?auto_125865 ) ) ( not ( = ?auto_125861 ?auto_125866 ) ) ( not ( = ?auto_125861 ?auto_125867 ) ) ( not ( = ?auto_125861 ?auto_125868 ) ) ( not ( = ?auto_125862 ?auto_125863 ) ) ( not ( = ?auto_125862 ?auto_125864 ) ) ( not ( = ?auto_125862 ?auto_125865 ) ) ( not ( = ?auto_125862 ?auto_125866 ) ) ( not ( = ?auto_125862 ?auto_125867 ) ) ( not ( = ?auto_125862 ?auto_125868 ) ) ( not ( = ?auto_125863 ?auto_125864 ) ) ( not ( = ?auto_125863 ?auto_125865 ) ) ( not ( = ?auto_125863 ?auto_125866 ) ) ( not ( = ?auto_125863 ?auto_125867 ) ) ( not ( = ?auto_125863 ?auto_125868 ) ) ( not ( = ?auto_125864 ?auto_125865 ) ) ( not ( = ?auto_125864 ?auto_125866 ) ) ( not ( = ?auto_125864 ?auto_125867 ) ) ( not ( = ?auto_125864 ?auto_125868 ) ) ( not ( = ?auto_125865 ?auto_125866 ) ) ( not ( = ?auto_125865 ?auto_125867 ) ) ( not ( = ?auto_125865 ?auto_125868 ) ) ( not ( = ?auto_125866 ?auto_125867 ) ) ( not ( = ?auto_125866 ?auto_125868 ) ) ( not ( = ?auto_125867 ?auto_125868 ) ) ( ON ?auto_125867 ?auto_125868 ) ( CLEAR ?auto_125865 ) ( ON ?auto_125866 ?auto_125867 ) ( CLEAR ?auto_125866 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_125858 ?auto_125859 ?auto_125860 ?auto_125861 ?auto_125862 ?auto_125863 ?auto_125864 ?auto_125865 ?auto_125866 )
      ( MAKE-11PILE ?auto_125858 ?auto_125859 ?auto_125860 ?auto_125861 ?auto_125862 ?auto_125863 ?auto_125864 ?auto_125865 ?auto_125866 ?auto_125867 ?auto_125868 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_125880 - BLOCK
      ?auto_125881 - BLOCK
      ?auto_125882 - BLOCK
      ?auto_125883 - BLOCK
      ?auto_125884 - BLOCK
      ?auto_125885 - BLOCK
      ?auto_125886 - BLOCK
      ?auto_125887 - BLOCK
      ?auto_125888 - BLOCK
      ?auto_125889 - BLOCK
      ?auto_125890 - BLOCK
    )
    :vars
    (
      ?auto_125891 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125890 ?auto_125891 ) ( ON-TABLE ?auto_125880 ) ( ON ?auto_125881 ?auto_125880 ) ( ON ?auto_125882 ?auto_125881 ) ( ON ?auto_125883 ?auto_125882 ) ( ON ?auto_125884 ?auto_125883 ) ( ON ?auto_125885 ?auto_125884 ) ( ON ?auto_125886 ?auto_125885 ) ( not ( = ?auto_125880 ?auto_125881 ) ) ( not ( = ?auto_125880 ?auto_125882 ) ) ( not ( = ?auto_125880 ?auto_125883 ) ) ( not ( = ?auto_125880 ?auto_125884 ) ) ( not ( = ?auto_125880 ?auto_125885 ) ) ( not ( = ?auto_125880 ?auto_125886 ) ) ( not ( = ?auto_125880 ?auto_125887 ) ) ( not ( = ?auto_125880 ?auto_125888 ) ) ( not ( = ?auto_125880 ?auto_125889 ) ) ( not ( = ?auto_125880 ?auto_125890 ) ) ( not ( = ?auto_125880 ?auto_125891 ) ) ( not ( = ?auto_125881 ?auto_125882 ) ) ( not ( = ?auto_125881 ?auto_125883 ) ) ( not ( = ?auto_125881 ?auto_125884 ) ) ( not ( = ?auto_125881 ?auto_125885 ) ) ( not ( = ?auto_125881 ?auto_125886 ) ) ( not ( = ?auto_125881 ?auto_125887 ) ) ( not ( = ?auto_125881 ?auto_125888 ) ) ( not ( = ?auto_125881 ?auto_125889 ) ) ( not ( = ?auto_125881 ?auto_125890 ) ) ( not ( = ?auto_125881 ?auto_125891 ) ) ( not ( = ?auto_125882 ?auto_125883 ) ) ( not ( = ?auto_125882 ?auto_125884 ) ) ( not ( = ?auto_125882 ?auto_125885 ) ) ( not ( = ?auto_125882 ?auto_125886 ) ) ( not ( = ?auto_125882 ?auto_125887 ) ) ( not ( = ?auto_125882 ?auto_125888 ) ) ( not ( = ?auto_125882 ?auto_125889 ) ) ( not ( = ?auto_125882 ?auto_125890 ) ) ( not ( = ?auto_125882 ?auto_125891 ) ) ( not ( = ?auto_125883 ?auto_125884 ) ) ( not ( = ?auto_125883 ?auto_125885 ) ) ( not ( = ?auto_125883 ?auto_125886 ) ) ( not ( = ?auto_125883 ?auto_125887 ) ) ( not ( = ?auto_125883 ?auto_125888 ) ) ( not ( = ?auto_125883 ?auto_125889 ) ) ( not ( = ?auto_125883 ?auto_125890 ) ) ( not ( = ?auto_125883 ?auto_125891 ) ) ( not ( = ?auto_125884 ?auto_125885 ) ) ( not ( = ?auto_125884 ?auto_125886 ) ) ( not ( = ?auto_125884 ?auto_125887 ) ) ( not ( = ?auto_125884 ?auto_125888 ) ) ( not ( = ?auto_125884 ?auto_125889 ) ) ( not ( = ?auto_125884 ?auto_125890 ) ) ( not ( = ?auto_125884 ?auto_125891 ) ) ( not ( = ?auto_125885 ?auto_125886 ) ) ( not ( = ?auto_125885 ?auto_125887 ) ) ( not ( = ?auto_125885 ?auto_125888 ) ) ( not ( = ?auto_125885 ?auto_125889 ) ) ( not ( = ?auto_125885 ?auto_125890 ) ) ( not ( = ?auto_125885 ?auto_125891 ) ) ( not ( = ?auto_125886 ?auto_125887 ) ) ( not ( = ?auto_125886 ?auto_125888 ) ) ( not ( = ?auto_125886 ?auto_125889 ) ) ( not ( = ?auto_125886 ?auto_125890 ) ) ( not ( = ?auto_125886 ?auto_125891 ) ) ( not ( = ?auto_125887 ?auto_125888 ) ) ( not ( = ?auto_125887 ?auto_125889 ) ) ( not ( = ?auto_125887 ?auto_125890 ) ) ( not ( = ?auto_125887 ?auto_125891 ) ) ( not ( = ?auto_125888 ?auto_125889 ) ) ( not ( = ?auto_125888 ?auto_125890 ) ) ( not ( = ?auto_125888 ?auto_125891 ) ) ( not ( = ?auto_125889 ?auto_125890 ) ) ( not ( = ?auto_125889 ?auto_125891 ) ) ( not ( = ?auto_125890 ?auto_125891 ) ) ( ON ?auto_125889 ?auto_125890 ) ( ON ?auto_125888 ?auto_125889 ) ( CLEAR ?auto_125886 ) ( ON ?auto_125887 ?auto_125888 ) ( CLEAR ?auto_125887 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_125880 ?auto_125881 ?auto_125882 ?auto_125883 ?auto_125884 ?auto_125885 ?auto_125886 ?auto_125887 )
      ( MAKE-11PILE ?auto_125880 ?auto_125881 ?auto_125882 ?auto_125883 ?auto_125884 ?auto_125885 ?auto_125886 ?auto_125887 ?auto_125888 ?auto_125889 ?auto_125890 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_125903 - BLOCK
      ?auto_125904 - BLOCK
      ?auto_125905 - BLOCK
      ?auto_125906 - BLOCK
      ?auto_125907 - BLOCK
      ?auto_125908 - BLOCK
      ?auto_125909 - BLOCK
      ?auto_125910 - BLOCK
      ?auto_125911 - BLOCK
      ?auto_125912 - BLOCK
      ?auto_125913 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_125913 ) ( ON-TABLE ?auto_125903 ) ( ON ?auto_125904 ?auto_125903 ) ( ON ?auto_125905 ?auto_125904 ) ( ON ?auto_125906 ?auto_125905 ) ( ON ?auto_125907 ?auto_125906 ) ( ON ?auto_125908 ?auto_125907 ) ( ON ?auto_125909 ?auto_125908 ) ( not ( = ?auto_125903 ?auto_125904 ) ) ( not ( = ?auto_125903 ?auto_125905 ) ) ( not ( = ?auto_125903 ?auto_125906 ) ) ( not ( = ?auto_125903 ?auto_125907 ) ) ( not ( = ?auto_125903 ?auto_125908 ) ) ( not ( = ?auto_125903 ?auto_125909 ) ) ( not ( = ?auto_125903 ?auto_125910 ) ) ( not ( = ?auto_125903 ?auto_125911 ) ) ( not ( = ?auto_125903 ?auto_125912 ) ) ( not ( = ?auto_125903 ?auto_125913 ) ) ( not ( = ?auto_125904 ?auto_125905 ) ) ( not ( = ?auto_125904 ?auto_125906 ) ) ( not ( = ?auto_125904 ?auto_125907 ) ) ( not ( = ?auto_125904 ?auto_125908 ) ) ( not ( = ?auto_125904 ?auto_125909 ) ) ( not ( = ?auto_125904 ?auto_125910 ) ) ( not ( = ?auto_125904 ?auto_125911 ) ) ( not ( = ?auto_125904 ?auto_125912 ) ) ( not ( = ?auto_125904 ?auto_125913 ) ) ( not ( = ?auto_125905 ?auto_125906 ) ) ( not ( = ?auto_125905 ?auto_125907 ) ) ( not ( = ?auto_125905 ?auto_125908 ) ) ( not ( = ?auto_125905 ?auto_125909 ) ) ( not ( = ?auto_125905 ?auto_125910 ) ) ( not ( = ?auto_125905 ?auto_125911 ) ) ( not ( = ?auto_125905 ?auto_125912 ) ) ( not ( = ?auto_125905 ?auto_125913 ) ) ( not ( = ?auto_125906 ?auto_125907 ) ) ( not ( = ?auto_125906 ?auto_125908 ) ) ( not ( = ?auto_125906 ?auto_125909 ) ) ( not ( = ?auto_125906 ?auto_125910 ) ) ( not ( = ?auto_125906 ?auto_125911 ) ) ( not ( = ?auto_125906 ?auto_125912 ) ) ( not ( = ?auto_125906 ?auto_125913 ) ) ( not ( = ?auto_125907 ?auto_125908 ) ) ( not ( = ?auto_125907 ?auto_125909 ) ) ( not ( = ?auto_125907 ?auto_125910 ) ) ( not ( = ?auto_125907 ?auto_125911 ) ) ( not ( = ?auto_125907 ?auto_125912 ) ) ( not ( = ?auto_125907 ?auto_125913 ) ) ( not ( = ?auto_125908 ?auto_125909 ) ) ( not ( = ?auto_125908 ?auto_125910 ) ) ( not ( = ?auto_125908 ?auto_125911 ) ) ( not ( = ?auto_125908 ?auto_125912 ) ) ( not ( = ?auto_125908 ?auto_125913 ) ) ( not ( = ?auto_125909 ?auto_125910 ) ) ( not ( = ?auto_125909 ?auto_125911 ) ) ( not ( = ?auto_125909 ?auto_125912 ) ) ( not ( = ?auto_125909 ?auto_125913 ) ) ( not ( = ?auto_125910 ?auto_125911 ) ) ( not ( = ?auto_125910 ?auto_125912 ) ) ( not ( = ?auto_125910 ?auto_125913 ) ) ( not ( = ?auto_125911 ?auto_125912 ) ) ( not ( = ?auto_125911 ?auto_125913 ) ) ( not ( = ?auto_125912 ?auto_125913 ) ) ( ON ?auto_125912 ?auto_125913 ) ( ON ?auto_125911 ?auto_125912 ) ( CLEAR ?auto_125909 ) ( ON ?auto_125910 ?auto_125911 ) ( CLEAR ?auto_125910 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_125903 ?auto_125904 ?auto_125905 ?auto_125906 ?auto_125907 ?auto_125908 ?auto_125909 ?auto_125910 )
      ( MAKE-11PILE ?auto_125903 ?auto_125904 ?auto_125905 ?auto_125906 ?auto_125907 ?auto_125908 ?auto_125909 ?auto_125910 ?auto_125911 ?auto_125912 ?auto_125913 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_125925 - BLOCK
      ?auto_125926 - BLOCK
      ?auto_125927 - BLOCK
      ?auto_125928 - BLOCK
      ?auto_125929 - BLOCK
      ?auto_125930 - BLOCK
      ?auto_125931 - BLOCK
      ?auto_125932 - BLOCK
      ?auto_125933 - BLOCK
      ?auto_125934 - BLOCK
      ?auto_125935 - BLOCK
    )
    :vars
    (
      ?auto_125936 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125935 ?auto_125936 ) ( ON-TABLE ?auto_125925 ) ( ON ?auto_125926 ?auto_125925 ) ( ON ?auto_125927 ?auto_125926 ) ( ON ?auto_125928 ?auto_125927 ) ( ON ?auto_125929 ?auto_125928 ) ( ON ?auto_125930 ?auto_125929 ) ( not ( = ?auto_125925 ?auto_125926 ) ) ( not ( = ?auto_125925 ?auto_125927 ) ) ( not ( = ?auto_125925 ?auto_125928 ) ) ( not ( = ?auto_125925 ?auto_125929 ) ) ( not ( = ?auto_125925 ?auto_125930 ) ) ( not ( = ?auto_125925 ?auto_125931 ) ) ( not ( = ?auto_125925 ?auto_125932 ) ) ( not ( = ?auto_125925 ?auto_125933 ) ) ( not ( = ?auto_125925 ?auto_125934 ) ) ( not ( = ?auto_125925 ?auto_125935 ) ) ( not ( = ?auto_125925 ?auto_125936 ) ) ( not ( = ?auto_125926 ?auto_125927 ) ) ( not ( = ?auto_125926 ?auto_125928 ) ) ( not ( = ?auto_125926 ?auto_125929 ) ) ( not ( = ?auto_125926 ?auto_125930 ) ) ( not ( = ?auto_125926 ?auto_125931 ) ) ( not ( = ?auto_125926 ?auto_125932 ) ) ( not ( = ?auto_125926 ?auto_125933 ) ) ( not ( = ?auto_125926 ?auto_125934 ) ) ( not ( = ?auto_125926 ?auto_125935 ) ) ( not ( = ?auto_125926 ?auto_125936 ) ) ( not ( = ?auto_125927 ?auto_125928 ) ) ( not ( = ?auto_125927 ?auto_125929 ) ) ( not ( = ?auto_125927 ?auto_125930 ) ) ( not ( = ?auto_125927 ?auto_125931 ) ) ( not ( = ?auto_125927 ?auto_125932 ) ) ( not ( = ?auto_125927 ?auto_125933 ) ) ( not ( = ?auto_125927 ?auto_125934 ) ) ( not ( = ?auto_125927 ?auto_125935 ) ) ( not ( = ?auto_125927 ?auto_125936 ) ) ( not ( = ?auto_125928 ?auto_125929 ) ) ( not ( = ?auto_125928 ?auto_125930 ) ) ( not ( = ?auto_125928 ?auto_125931 ) ) ( not ( = ?auto_125928 ?auto_125932 ) ) ( not ( = ?auto_125928 ?auto_125933 ) ) ( not ( = ?auto_125928 ?auto_125934 ) ) ( not ( = ?auto_125928 ?auto_125935 ) ) ( not ( = ?auto_125928 ?auto_125936 ) ) ( not ( = ?auto_125929 ?auto_125930 ) ) ( not ( = ?auto_125929 ?auto_125931 ) ) ( not ( = ?auto_125929 ?auto_125932 ) ) ( not ( = ?auto_125929 ?auto_125933 ) ) ( not ( = ?auto_125929 ?auto_125934 ) ) ( not ( = ?auto_125929 ?auto_125935 ) ) ( not ( = ?auto_125929 ?auto_125936 ) ) ( not ( = ?auto_125930 ?auto_125931 ) ) ( not ( = ?auto_125930 ?auto_125932 ) ) ( not ( = ?auto_125930 ?auto_125933 ) ) ( not ( = ?auto_125930 ?auto_125934 ) ) ( not ( = ?auto_125930 ?auto_125935 ) ) ( not ( = ?auto_125930 ?auto_125936 ) ) ( not ( = ?auto_125931 ?auto_125932 ) ) ( not ( = ?auto_125931 ?auto_125933 ) ) ( not ( = ?auto_125931 ?auto_125934 ) ) ( not ( = ?auto_125931 ?auto_125935 ) ) ( not ( = ?auto_125931 ?auto_125936 ) ) ( not ( = ?auto_125932 ?auto_125933 ) ) ( not ( = ?auto_125932 ?auto_125934 ) ) ( not ( = ?auto_125932 ?auto_125935 ) ) ( not ( = ?auto_125932 ?auto_125936 ) ) ( not ( = ?auto_125933 ?auto_125934 ) ) ( not ( = ?auto_125933 ?auto_125935 ) ) ( not ( = ?auto_125933 ?auto_125936 ) ) ( not ( = ?auto_125934 ?auto_125935 ) ) ( not ( = ?auto_125934 ?auto_125936 ) ) ( not ( = ?auto_125935 ?auto_125936 ) ) ( ON ?auto_125934 ?auto_125935 ) ( ON ?auto_125933 ?auto_125934 ) ( ON ?auto_125932 ?auto_125933 ) ( CLEAR ?auto_125930 ) ( ON ?auto_125931 ?auto_125932 ) ( CLEAR ?auto_125931 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_125925 ?auto_125926 ?auto_125927 ?auto_125928 ?auto_125929 ?auto_125930 ?auto_125931 )
      ( MAKE-11PILE ?auto_125925 ?auto_125926 ?auto_125927 ?auto_125928 ?auto_125929 ?auto_125930 ?auto_125931 ?auto_125932 ?auto_125933 ?auto_125934 ?auto_125935 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_125948 - BLOCK
      ?auto_125949 - BLOCK
      ?auto_125950 - BLOCK
      ?auto_125951 - BLOCK
      ?auto_125952 - BLOCK
      ?auto_125953 - BLOCK
      ?auto_125954 - BLOCK
      ?auto_125955 - BLOCK
      ?auto_125956 - BLOCK
      ?auto_125957 - BLOCK
      ?auto_125958 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_125958 ) ( ON-TABLE ?auto_125948 ) ( ON ?auto_125949 ?auto_125948 ) ( ON ?auto_125950 ?auto_125949 ) ( ON ?auto_125951 ?auto_125950 ) ( ON ?auto_125952 ?auto_125951 ) ( ON ?auto_125953 ?auto_125952 ) ( not ( = ?auto_125948 ?auto_125949 ) ) ( not ( = ?auto_125948 ?auto_125950 ) ) ( not ( = ?auto_125948 ?auto_125951 ) ) ( not ( = ?auto_125948 ?auto_125952 ) ) ( not ( = ?auto_125948 ?auto_125953 ) ) ( not ( = ?auto_125948 ?auto_125954 ) ) ( not ( = ?auto_125948 ?auto_125955 ) ) ( not ( = ?auto_125948 ?auto_125956 ) ) ( not ( = ?auto_125948 ?auto_125957 ) ) ( not ( = ?auto_125948 ?auto_125958 ) ) ( not ( = ?auto_125949 ?auto_125950 ) ) ( not ( = ?auto_125949 ?auto_125951 ) ) ( not ( = ?auto_125949 ?auto_125952 ) ) ( not ( = ?auto_125949 ?auto_125953 ) ) ( not ( = ?auto_125949 ?auto_125954 ) ) ( not ( = ?auto_125949 ?auto_125955 ) ) ( not ( = ?auto_125949 ?auto_125956 ) ) ( not ( = ?auto_125949 ?auto_125957 ) ) ( not ( = ?auto_125949 ?auto_125958 ) ) ( not ( = ?auto_125950 ?auto_125951 ) ) ( not ( = ?auto_125950 ?auto_125952 ) ) ( not ( = ?auto_125950 ?auto_125953 ) ) ( not ( = ?auto_125950 ?auto_125954 ) ) ( not ( = ?auto_125950 ?auto_125955 ) ) ( not ( = ?auto_125950 ?auto_125956 ) ) ( not ( = ?auto_125950 ?auto_125957 ) ) ( not ( = ?auto_125950 ?auto_125958 ) ) ( not ( = ?auto_125951 ?auto_125952 ) ) ( not ( = ?auto_125951 ?auto_125953 ) ) ( not ( = ?auto_125951 ?auto_125954 ) ) ( not ( = ?auto_125951 ?auto_125955 ) ) ( not ( = ?auto_125951 ?auto_125956 ) ) ( not ( = ?auto_125951 ?auto_125957 ) ) ( not ( = ?auto_125951 ?auto_125958 ) ) ( not ( = ?auto_125952 ?auto_125953 ) ) ( not ( = ?auto_125952 ?auto_125954 ) ) ( not ( = ?auto_125952 ?auto_125955 ) ) ( not ( = ?auto_125952 ?auto_125956 ) ) ( not ( = ?auto_125952 ?auto_125957 ) ) ( not ( = ?auto_125952 ?auto_125958 ) ) ( not ( = ?auto_125953 ?auto_125954 ) ) ( not ( = ?auto_125953 ?auto_125955 ) ) ( not ( = ?auto_125953 ?auto_125956 ) ) ( not ( = ?auto_125953 ?auto_125957 ) ) ( not ( = ?auto_125953 ?auto_125958 ) ) ( not ( = ?auto_125954 ?auto_125955 ) ) ( not ( = ?auto_125954 ?auto_125956 ) ) ( not ( = ?auto_125954 ?auto_125957 ) ) ( not ( = ?auto_125954 ?auto_125958 ) ) ( not ( = ?auto_125955 ?auto_125956 ) ) ( not ( = ?auto_125955 ?auto_125957 ) ) ( not ( = ?auto_125955 ?auto_125958 ) ) ( not ( = ?auto_125956 ?auto_125957 ) ) ( not ( = ?auto_125956 ?auto_125958 ) ) ( not ( = ?auto_125957 ?auto_125958 ) ) ( ON ?auto_125957 ?auto_125958 ) ( ON ?auto_125956 ?auto_125957 ) ( ON ?auto_125955 ?auto_125956 ) ( CLEAR ?auto_125953 ) ( ON ?auto_125954 ?auto_125955 ) ( CLEAR ?auto_125954 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_125948 ?auto_125949 ?auto_125950 ?auto_125951 ?auto_125952 ?auto_125953 ?auto_125954 )
      ( MAKE-11PILE ?auto_125948 ?auto_125949 ?auto_125950 ?auto_125951 ?auto_125952 ?auto_125953 ?auto_125954 ?auto_125955 ?auto_125956 ?auto_125957 ?auto_125958 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_125970 - BLOCK
      ?auto_125971 - BLOCK
      ?auto_125972 - BLOCK
      ?auto_125973 - BLOCK
      ?auto_125974 - BLOCK
      ?auto_125975 - BLOCK
      ?auto_125976 - BLOCK
      ?auto_125977 - BLOCK
      ?auto_125978 - BLOCK
      ?auto_125979 - BLOCK
      ?auto_125980 - BLOCK
    )
    :vars
    (
      ?auto_125981 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125980 ?auto_125981 ) ( ON-TABLE ?auto_125970 ) ( ON ?auto_125971 ?auto_125970 ) ( ON ?auto_125972 ?auto_125971 ) ( ON ?auto_125973 ?auto_125972 ) ( ON ?auto_125974 ?auto_125973 ) ( not ( = ?auto_125970 ?auto_125971 ) ) ( not ( = ?auto_125970 ?auto_125972 ) ) ( not ( = ?auto_125970 ?auto_125973 ) ) ( not ( = ?auto_125970 ?auto_125974 ) ) ( not ( = ?auto_125970 ?auto_125975 ) ) ( not ( = ?auto_125970 ?auto_125976 ) ) ( not ( = ?auto_125970 ?auto_125977 ) ) ( not ( = ?auto_125970 ?auto_125978 ) ) ( not ( = ?auto_125970 ?auto_125979 ) ) ( not ( = ?auto_125970 ?auto_125980 ) ) ( not ( = ?auto_125970 ?auto_125981 ) ) ( not ( = ?auto_125971 ?auto_125972 ) ) ( not ( = ?auto_125971 ?auto_125973 ) ) ( not ( = ?auto_125971 ?auto_125974 ) ) ( not ( = ?auto_125971 ?auto_125975 ) ) ( not ( = ?auto_125971 ?auto_125976 ) ) ( not ( = ?auto_125971 ?auto_125977 ) ) ( not ( = ?auto_125971 ?auto_125978 ) ) ( not ( = ?auto_125971 ?auto_125979 ) ) ( not ( = ?auto_125971 ?auto_125980 ) ) ( not ( = ?auto_125971 ?auto_125981 ) ) ( not ( = ?auto_125972 ?auto_125973 ) ) ( not ( = ?auto_125972 ?auto_125974 ) ) ( not ( = ?auto_125972 ?auto_125975 ) ) ( not ( = ?auto_125972 ?auto_125976 ) ) ( not ( = ?auto_125972 ?auto_125977 ) ) ( not ( = ?auto_125972 ?auto_125978 ) ) ( not ( = ?auto_125972 ?auto_125979 ) ) ( not ( = ?auto_125972 ?auto_125980 ) ) ( not ( = ?auto_125972 ?auto_125981 ) ) ( not ( = ?auto_125973 ?auto_125974 ) ) ( not ( = ?auto_125973 ?auto_125975 ) ) ( not ( = ?auto_125973 ?auto_125976 ) ) ( not ( = ?auto_125973 ?auto_125977 ) ) ( not ( = ?auto_125973 ?auto_125978 ) ) ( not ( = ?auto_125973 ?auto_125979 ) ) ( not ( = ?auto_125973 ?auto_125980 ) ) ( not ( = ?auto_125973 ?auto_125981 ) ) ( not ( = ?auto_125974 ?auto_125975 ) ) ( not ( = ?auto_125974 ?auto_125976 ) ) ( not ( = ?auto_125974 ?auto_125977 ) ) ( not ( = ?auto_125974 ?auto_125978 ) ) ( not ( = ?auto_125974 ?auto_125979 ) ) ( not ( = ?auto_125974 ?auto_125980 ) ) ( not ( = ?auto_125974 ?auto_125981 ) ) ( not ( = ?auto_125975 ?auto_125976 ) ) ( not ( = ?auto_125975 ?auto_125977 ) ) ( not ( = ?auto_125975 ?auto_125978 ) ) ( not ( = ?auto_125975 ?auto_125979 ) ) ( not ( = ?auto_125975 ?auto_125980 ) ) ( not ( = ?auto_125975 ?auto_125981 ) ) ( not ( = ?auto_125976 ?auto_125977 ) ) ( not ( = ?auto_125976 ?auto_125978 ) ) ( not ( = ?auto_125976 ?auto_125979 ) ) ( not ( = ?auto_125976 ?auto_125980 ) ) ( not ( = ?auto_125976 ?auto_125981 ) ) ( not ( = ?auto_125977 ?auto_125978 ) ) ( not ( = ?auto_125977 ?auto_125979 ) ) ( not ( = ?auto_125977 ?auto_125980 ) ) ( not ( = ?auto_125977 ?auto_125981 ) ) ( not ( = ?auto_125978 ?auto_125979 ) ) ( not ( = ?auto_125978 ?auto_125980 ) ) ( not ( = ?auto_125978 ?auto_125981 ) ) ( not ( = ?auto_125979 ?auto_125980 ) ) ( not ( = ?auto_125979 ?auto_125981 ) ) ( not ( = ?auto_125980 ?auto_125981 ) ) ( ON ?auto_125979 ?auto_125980 ) ( ON ?auto_125978 ?auto_125979 ) ( ON ?auto_125977 ?auto_125978 ) ( ON ?auto_125976 ?auto_125977 ) ( CLEAR ?auto_125974 ) ( ON ?auto_125975 ?auto_125976 ) ( CLEAR ?auto_125975 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_125970 ?auto_125971 ?auto_125972 ?auto_125973 ?auto_125974 ?auto_125975 )
      ( MAKE-11PILE ?auto_125970 ?auto_125971 ?auto_125972 ?auto_125973 ?auto_125974 ?auto_125975 ?auto_125976 ?auto_125977 ?auto_125978 ?auto_125979 ?auto_125980 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_125993 - BLOCK
      ?auto_125994 - BLOCK
      ?auto_125995 - BLOCK
      ?auto_125996 - BLOCK
      ?auto_125997 - BLOCK
      ?auto_125998 - BLOCK
      ?auto_125999 - BLOCK
      ?auto_126000 - BLOCK
      ?auto_126001 - BLOCK
      ?auto_126002 - BLOCK
      ?auto_126003 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_126003 ) ( ON-TABLE ?auto_125993 ) ( ON ?auto_125994 ?auto_125993 ) ( ON ?auto_125995 ?auto_125994 ) ( ON ?auto_125996 ?auto_125995 ) ( ON ?auto_125997 ?auto_125996 ) ( not ( = ?auto_125993 ?auto_125994 ) ) ( not ( = ?auto_125993 ?auto_125995 ) ) ( not ( = ?auto_125993 ?auto_125996 ) ) ( not ( = ?auto_125993 ?auto_125997 ) ) ( not ( = ?auto_125993 ?auto_125998 ) ) ( not ( = ?auto_125993 ?auto_125999 ) ) ( not ( = ?auto_125993 ?auto_126000 ) ) ( not ( = ?auto_125993 ?auto_126001 ) ) ( not ( = ?auto_125993 ?auto_126002 ) ) ( not ( = ?auto_125993 ?auto_126003 ) ) ( not ( = ?auto_125994 ?auto_125995 ) ) ( not ( = ?auto_125994 ?auto_125996 ) ) ( not ( = ?auto_125994 ?auto_125997 ) ) ( not ( = ?auto_125994 ?auto_125998 ) ) ( not ( = ?auto_125994 ?auto_125999 ) ) ( not ( = ?auto_125994 ?auto_126000 ) ) ( not ( = ?auto_125994 ?auto_126001 ) ) ( not ( = ?auto_125994 ?auto_126002 ) ) ( not ( = ?auto_125994 ?auto_126003 ) ) ( not ( = ?auto_125995 ?auto_125996 ) ) ( not ( = ?auto_125995 ?auto_125997 ) ) ( not ( = ?auto_125995 ?auto_125998 ) ) ( not ( = ?auto_125995 ?auto_125999 ) ) ( not ( = ?auto_125995 ?auto_126000 ) ) ( not ( = ?auto_125995 ?auto_126001 ) ) ( not ( = ?auto_125995 ?auto_126002 ) ) ( not ( = ?auto_125995 ?auto_126003 ) ) ( not ( = ?auto_125996 ?auto_125997 ) ) ( not ( = ?auto_125996 ?auto_125998 ) ) ( not ( = ?auto_125996 ?auto_125999 ) ) ( not ( = ?auto_125996 ?auto_126000 ) ) ( not ( = ?auto_125996 ?auto_126001 ) ) ( not ( = ?auto_125996 ?auto_126002 ) ) ( not ( = ?auto_125996 ?auto_126003 ) ) ( not ( = ?auto_125997 ?auto_125998 ) ) ( not ( = ?auto_125997 ?auto_125999 ) ) ( not ( = ?auto_125997 ?auto_126000 ) ) ( not ( = ?auto_125997 ?auto_126001 ) ) ( not ( = ?auto_125997 ?auto_126002 ) ) ( not ( = ?auto_125997 ?auto_126003 ) ) ( not ( = ?auto_125998 ?auto_125999 ) ) ( not ( = ?auto_125998 ?auto_126000 ) ) ( not ( = ?auto_125998 ?auto_126001 ) ) ( not ( = ?auto_125998 ?auto_126002 ) ) ( not ( = ?auto_125998 ?auto_126003 ) ) ( not ( = ?auto_125999 ?auto_126000 ) ) ( not ( = ?auto_125999 ?auto_126001 ) ) ( not ( = ?auto_125999 ?auto_126002 ) ) ( not ( = ?auto_125999 ?auto_126003 ) ) ( not ( = ?auto_126000 ?auto_126001 ) ) ( not ( = ?auto_126000 ?auto_126002 ) ) ( not ( = ?auto_126000 ?auto_126003 ) ) ( not ( = ?auto_126001 ?auto_126002 ) ) ( not ( = ?auto_126001 ?auto_126003 ) ) ( not ( = ?auto_126002 ?auto_126003 ) ) ( ON ?auto_126002 ?auto_126003 ) ( ON ?auto_126001 ?auto_126002 ) ( ON ?auto_126000 ?auto_126001 ) ( ON ?auto_125999 ?auto_126000 ) ( CLEAR ?auto_125997 ) ( ON ?auto_125998 ?auto_125999 ) ( CLEAR ?auto_125998 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_125993 ?auto_125994 ?auto_125995 ?auto_125996 ?auto_125997 ?auto_125998 )
      ( MAKE-11PILE ?auto_125993 ?auto_125994 ?auto_125995 ?auto_125996 ?auto_125997 ?auto_125998 ?auto_125999 ?auto_126000 ?auto_126001 ?auto_126002 ?auto_126003 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_126015 - BLOCK
      ?auto_126016 - BLOCK
      ?auto_126017 - BLOCK
      ?auto_126018 - BLOCK
      ?auto_126019 - BLOCK
      ?auto_126020 - BLOCK
      ?auto_126021 - BLOCK
      ?auto_126022 - BLOCK
      ?auto_126023 - BLOCK
      ?auto_126024 - BLOCK
      ?auto_126025 - BLOCK
    )
    :vars
    (
      ?auto_126026 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126025 ?auto_126026 ) ( ON-TABLE ?auto_126015 ) ( ON ?auto_126016 ?auto_126015 ) ( ON ?auto_126017 ?auto_126016 ) ( ON ?auto_126018 ?auto_126017 ) ( not ( = ?auto_126015 ?auto_126016 ) ) ( not ( = ?auto_126015 ?auto_126017 ) ) ( not ( = ?auto_126015 ?auto_126018 ) ) ( not ( = ?auto_126015 ?auto_126019 ) ) ( not ( = ?auto_126015 ?auto_126020 ) ) ( not ( = ?auto_126015 ?auto_126021 ) ) ( not ( = ?auto_126015 ?auto_126022 ) ) ( not ( = ?auto_126015 ?auto_126023 ) ) ( not ( = ?auto_126015 ?auto_126024 ) ) ( not ( = ?auto_126015 ?auto_126025 ) ) ( not ( = ?auto_126015 ?auto_126026 ) ) ( not ( = ?auto_126016 ?auto_126017 ) ) ( not ( = ?auto_126016 ?auto_126018 ) ) ( not ( = ?auto_126016 ?auto_126019 ) ) ( not ( = ?auto_126016 ?auto_126020 ) ) ( not ( = ?auto_126016 ?auto_126021 ) ) ( not ( = ?auto_126016 ?auto_126022 ) ) ( not ( = ?auto_126016 ?auto_126023 ) ) ( not ( = ?auto_126016 ?auto_126024 ) ) ( not ( = ?auto_126016 ?auto_126025 ) ) ( not ( = ?auto_126016 ?auto_126026 ) ) ( not ( = ?auto_126017 ?auto_126018 ) ) ( not ( = ?auto_126017 ?auto_126019 ) ) ( not ( = ?auto_126017 ?auto_126020 ) ) ( not ( = ?auto_126017 ?auto_126021 ) ) ( not ( = ?auto_126017 ?auto_126022 ) ) ( not ( = ?auto_126017 ?auto_126023 ) ) ( not ( = ?auto_126017 ?auto_126024 ) ) ( not ( = ?auto_126017 ?auto_126025 ) ) ( not ( = ?auto_126017 ?auto_126026 ) ) ( not ( = ?auto_126018 ?auto_126019 ) ) ( not ( = ?auto_126018 ?auto_126020 ) ) ( not ( = ?auto_126018 ?auto_126021 ) ) ( not ( = ?auto_126018 ?auto_126022 ) ) ( not ( = ?auto_126018 ?auto_126023 ) ) ( not ( = ?auto_126018 ?auto_126024 ) ) ( not ( = ?auto_126018 ?auto_126025 ) ) ( not ( = ?auto_126018 ?auto_126026 ) ) ( not ( = ?auto_126019 ?auto_126020 ) ) ( not ( = ?auto_126019 ?auto_126021 ) ) ( not ( = ?auto_126019 ?auto_126022 ) ) ( not ( = ?auto_126019 ?auto_126023 ) ) ( not ( = ?auto_126019 ?auto_126024 ) ) ( not ( = ?auto_126019 ?auto_126025 ) ) ( not ( = ?auto_126019 ?auto_126026 ) ) ( not ( = ?auto_126020 ?auto_126021 ) ) ( not ( = ?auto_126020 ?auto_126022 ) ) ( not ( = ?auto_126020 ?auto_126023 ) ) ( not ( = ?auto_126020 ?auto_126024 ) ) ( not ( = ?auto_126020 ?auto_126025 ) ) ( not ( = ?auto_126020 ?auto_126026 ) ) ( not ( = ?auto_126021 ?auto_126022 ) ) ( not ( = ?auto_126021 ?auto_126023 ) ) ( not ( = ?auto_126021 ?auto_126024 ) ) ( not ( = ?auto_126021 ?auto_126025 ) ) ( not ( = ?auto_126021 ?auto_126026 ) ) ( not ( = ?auto_126022 ?auto_126023 ) ) ( not ( = ?auto_126022 ?auto_126024 ) ) ( not ( = ?auto_126022 ?auto_126025 ) ) ( not ( = ?auto_126022 ?auto_126026 ) ) ( not ( = ?auto_126023 ?auto_126024 ) ) ( not ( = ?auto_126023 ?auto_126025 ) ) ( not ( = ?auto_126023 ?auto_126026 ) ) ( not ( = ?auto_126024 ?auto_126025 ) ) ( not ( = ?auto_126024 ?auto_126026 ) ) ( not ( = ?auto_126025 ?auto_126026 ) ) ( ON ?auto_126024 ?auto_126025 ) ( ON ?auto_126023 ?auto_126024 ) ( ON ?auto_126022 ?auto_126023 ) ( ON ?auto_126021 ?auto_126022 ) ( ON ?auto_126020 ?auto_126021 ) ( CLEAR ?auto_126018 ) ( ON ?auto_126019 ?auto_126020 ) ( CLEAR ?auto_126019 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_126015 ?auto_126016 ?auto_126017 ?auto_126018 ?auto_126019 )
      ( MAKE-11PILE ?auto_126015 ?auto_126016 ?auto_126017 ?auto_126018 ?auto_126019 ?auto_126020 ?auto_126021 ?auto_126022 ?auto_126023 ?auto_126024 ?auto_126025 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_126038 - BLOCK
      ?auto_126039 - BLOCK
      ?auto_126040 - BLOCK
      ?auto_126041 - BLOCK
      ?auto_126042 - BLOCK
      ?auto_126043 - BLOCK
      ?auto_126044 - BLOCK
      ?auto_126045 - BLOCK
      ?auto_126046 - BLOCK
      ?auto_126047 - BLOCK
      ?auto_126048 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_126048 ) ( ON-TABLE ?auto_126038 ) ( ON ?auto_126039 ?auto_126038 ) ( ON ?auto_126040 ?auto_126039 ) ( ON ?auto_126041 ?auto_126040 ) ( not ( = ?auto_126038 ?auto_126039 ) ) ( not ( = ?auto_126038 ?auto_126040 ) ) ( not ( = ?auto_126038 ?auto_126041 ) ) ( not ( = ?auto_126038 ?auto_126042 ) ) ( not ( = ?auto_126038 ?auto_126043 ) ) ( not ( = ?auto_126038 ?auto_126044 ) ) ( not ( = ?auto_126038 ?auto_126045 ) ) ( not ( = ?auto_126038 ?auto_126046 ) ) ( not ( = ?auto_126038 ?auto_126047 ) ) ( not ( = ?auto_126038 ?auto_126048 ) ) ( not ( = ?auto_126039 ?auto_126040 ) ) ( not ( = ?auto_126039 ?auto_126041 ) ) ( not ( = ?auto_126039 ?auto_126042 ) ) ( not ( = ?auto_126039 ?auto_126043 ) ) ( not ( = ?auto_126039 ?auto_126044 ) ) ( not ( = ?auto_126039 ?auto_126045 ) ) ( not ( = ?auto_126039 ?auto_126046 ) ) ( not ( = ?auto_126039 ?auto_126047 ) ) ( not ( = ?auto_126039 ?auto_126048 ) ) ( not ( = ?auto_126040 ?auto_126041 ) ) ( not ( = ?auto_126040 ?auto_126042 ) ) ( not ( = ?auto_126040 ?auto_126043 ) ) ( not ( = ?auto_126040 ?auto_126044 ) ) ( not ( = ?auto_126040 ?auto_126045 ) ) ( not ( = ?auto_126040 ?auto_126046 ) ) ( not ( = ?auto_126040 ?auto_126047 ) ) ( not ( = ?auto_126040 ?auto_126048 ) ) ( not ( = ?auto_126041 ?auto_126042 ) ) ( not ( = ?auto_126041 ?auto_126043 ) ) ( not ( = ?auto_126041 ?auto_126044 ) ) ( not ( = ?auto_126041 ?auto_126045 ) ) ( not ( = ?auto_126041 ?auto_126046 ) ) ( not ( = ?auto_126041 ?auto_126047 ) ) ( not ( = ?auto_126041 ?auto_126048 ) ) ( not ( = ?auto_126042 ?auto_126043 ) ) ( not ( = ?auto_126042 ?auto_126044 ) ) ( not ( = ?auto_126042 ?auto_126045 ) ) ( not ( = ?auto_126042 ?auto_126046 ) ) ( not ( = ?auto_126042 ?auto_126047 ) ) ( not ( = ?auto_126042 ?auto_126048 ) ) ( not ( = ?auto_126043 ?auto_126044 ) ) ( not ( = ?auto_126043 ?auto_126045 ) ) ( not ( = ?auto_126043 ?auto_126046 ) ) ( not ( = ?auto_126043 ?auto_126047 ) ) ( not ( = ?auto_126043 ?auto_126048 ) ) ( not ( = ?auto_126044 ?auto_126045 ) ) ( not ( = ?auto_126044 ?auto_126046 ) ) ( not ( = ?auto_126044 ?auto_126047 ) ) ( not ( = ?auto_126044 ?auto_126048 ) ) ( not ( = ?auto_126045 ?auto_126046 ) ) ( not ( = ?auto_126045 ?auto_126047 ) ) ( not ( = ?auto_126045 ?auto_126048 ) ) ( not ( = ?auto_126046 ?auto_126047 ) ) ( not ( = ?auto_126046 ?auto_126048 ) ) ( not ( = ?auto_126047 ?auto_126048 ) ) ( ON ?auto_126047 ?auto_126048 ) ( ON ?auto_126046 ?auto_126047 ) ( ON ?auto_126045 ?auto_126046 ) ( ON ?auto_126044 ?auto_126045 ) ( ON ?auto_126043 ?auto_126044 ) ( CLEAR ?auto_126041 ) ( ON ?auto_126042 ?auto_126043 ) ( CLEAR ?auto_126042 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_126038 ?auto_126039 ?auto_126040 ?auto_126041 ?auto_126042 )
      ( MAKE-11PILE ?auto_126038 ?auto_126039 ?auto_126040 ?auto_126041 ?auto_126042 ?auto_126043 ?auto_126044 ?auto_126045 ?auto_126046 ?auto_126047 ?auto_126048 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_126060 - BLOCK
      ?auto_126061 - BLOCK
      ?auto_126062 - BLOCK
      ?auto_126063 - BLOCK
      ?auto_126064 - BLOCK
      ?auto_126065 - BLOCK
      ?auto_126066 - BLOCK
      ?auto_126067 - BLOCK
      ?auto_126068 - BLOCK
      ?auto_126069 - BLOCK
      ?auto_126070 - BLOCK
    )
    :vars
    (
      ?auto_126071 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126070 ?auto_126071 ) ( ON-TABLE ?auto_126060 ) ( ON ?auto_126061 ?auto_126060 ) ( ON ?auto_126062 ?auto_126061 ) ( not ( = ?auto_126060 ?auto_126061 ) ) ( not ( = ?auto_126060 ?auto_126062 ) ) ( not ( = ?auto_126060 ?auto_126063 ) ) ( not ( = ?auto_126060 ?auto_126064 ) ) ( not ( = ?auto_126060 ?auto_126065 ) ) ( not ( = ?auto_126060 ?auto_126066 ) ) ( not ( = ?auto_126060 ?auto_126067 ) ) ( not ( = ?auto_126060 ?auto_126068 ) ) ( not ( = ?auto_126060 ?auto_126069 ) ) ( not ( = ?auto_126060 ?auto_126070 ) ) ( not ( = ?auto_126060 ?auto_126071 ) ) ( not ( = ?auto_126061 ?auto_126062 ) ) ( not ( = ?auto_126061 ?auto_126063 ) ) ( not ( = ?auto_126061 ?auto_126064 ) ) ( not ( = ?auto_126061 ?auto_126065 ) ) ( not ( = ?auto_126061 ?auto_126066 ) ) ( not ( = ?auto_126061 ?auto_126067 ) ) ( not ( = ?auto_126061 ?auto_126068 ) ) ( not ( = ?auto_126061 ?auto_126069 ) ) ( not ( = ?auto_126061 ?auto_126070 ) ) ( not ( = ?auto_126061 ?auto_126071 ) ) ( not ( = ?auto_126062 ?auto_126063 ) ) ( not ( = ?auto_126062 ?auto_126064 ) ) ( not ( = ?auto_126062 ?auto_126065 ) ) ( not ( = ?auto_126062 ?auto_126066 ) ) ( not ( = ?auto_126062 ?auto_126067 ) ) ( not ( = ?auto_126062 ?auto_126068 ) ) ( not ( = ?auto_126062 ?auto_126069 ) ) ( not ( = ?auto_126062 ?auto_126070 ) ) ( not ( = ?auto_126062 ?auto_126071 ) ) ( not ( = ?auto_126063 ?auto_126064 ) ) ( not ( = ?auto_126063 ?auto_126065 ) ) ( not ( = ?auto_126063 ?auto_126066 ) ) ( not ( = ?auto_126063 ?auto_126067 ) ) ( not ( = ?auto_126063 ?auto_126068 ) ) ( not ( = ?auto_126063 ?auto_126069 ) ) ( not ( = ?auto_126063 ?auto_126070 ) ) ( not ( = ?auto_126063 ?auto_126071 ) ) ( not ( = ?auto_126064 ?auto_126065 ) ) ( not ( = ?auto_126064 ?auto_126066 ) ) ( not ( = ?auto_126064 ?auto_126067 ) ) ( not ( = ?auto_126064 ?auto_126068 ) ) ( not ( = ?auto_126064 ?auto_126069 ) ) ( not ( = ?auto_126064 ?auto_126070 ) ) ( not ( = ?auto_126064 ?auto_126071 ) ) ( not ( = ?auto_126065 ?auto_126066 ) ) ( not ( = ?auto_126065 ?auto_126067 ) ) ( not ( = ?auto_126065 ?auto_126068 ) ) ( not ( = ?auto_126065 ?auto_126069 ) ) ( not ( = ?auto_126065 ?auto_126070 ) ) ( not ( = ?auto_126065 ?auto_126071 ) ) ( not ( = ?auto_126066 ?auto_126067 ) ) ( not ( = ?auto_126066 ?auto_126068 ) ) ( not ( = ?auto_126066 ?auto_126069 ) ) ( not ( = ?auto_126066 ?auto_126070 ) ) ( not ( = ?auto_126066 ?auto_126071 ) ) ( not ( = ?auto_126067 ?auto_126068 ) ) ( not ( = ?auto_126067 ?auto_126069 ) ) ( not ( = ?auto_126067 ?auto_126070 ) ) ( not ( = ?auto_126067 ?auto_126071 ) ) ( not ( = ?auto_126068 ?auto_126069 ) ) ( not ( = ?auto_126068 ?auto_126070 ) ) ( not ( = ?auto_126068 ?auto_126071 ) ) ( not ( = ?auto_126069 ?auto_126070 ) ) ( not ( = ?auto_126069 ?auto_126071 ) ) ( not ( = ?auto_126070 ?auto_126071 ) ) ( ON ?auto_126069 ?auto_126070 ) ( ON ?auto_126068 ?auto_126069 ) ( ON ?auto_126067 ?auto_126068 ) ( ON ?auto_126066 ?auto_126067 ) ( ON ?auto_126065 ?auto_126066 ) ( ON ?auto_126064 ?auto_126065 ) ( CLEAR ?auto_126062 ) ( ON ?auto_126063 ?auto_126064 ) ( CLEAR ?auto_126063 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_126060 ?auto_126061 ?auto_126062 ?auto_126063 )
      ( MAKE-11PILE ?auto_126060 ?auto_126061 ?auto_126062 ?auto_126063 ?auto_126064 ?auto_126065 ?auto_126066 ?auto_126067 ?auto_126068 ?auto_126069 ?auto_126070 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_126083 - BLOCK
      ?auto_126084 - BLOCK
      ?auto_126085 - BLOCK
      ?auto_126086 - BLOCK
      ?auto_126087 - BLOCK
      ?auto_126088 - BLOCK
      ?auto_126089 - BLOCK
      ?auto_126090 - BLOCK
      ?auto_126091 - BLOCK
      ?auto_126092 - BLOCK
      ?auto_126093 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_126093 ) ( ON-TABLE ?auto_126083 ) ( ON ?auto_126084 ?auto_126083 ) ( ON ?auto_126085 ?auto_126084 ) ( not ( = ?auto_126083 ?auto_126084 ) ) ( not ( = ?auto_126083 ?auto_126085 ) ) ( not ( = ?auto_126083 ?auto_126086 ) ) ( not ( = ?auto_126083 ?auto_126087 ) ) ( not ( = ?auto_126083 ?auto_126088 ) ) ( not ( = ?auto_126083 ?auto_126089 ) ) ( not ( = ?auto_126083 ?auto_126090 ) ) ( not ( = ?auto_126083 ?auto_126091 ) ) ( not ( = ?auto_126083 ?auto_126092 ) ) ( not ( = ?auto_126083 ?auto_126093 ) ) ( not ( = ?auto_126084 ?auto_126085 ) ) ( not ( = ?auto_126084 ?auto_126086 ) ) ( not ( = ?auto_126084 ?auto_126087 ) ) ( not ( = ?auto_126084 ?auto_126088 ) ) ( not ( = ?auto_126084 ?auto_126089 ) ) ( not ( = ?auto_126084 ?auto_126090 ) ) ( not ( = ?auto_126084 ?auto_126091 ) ) ( not ( = ?auto_126084 ?auto_126092 ) ) ( not ( = ?auto_126084 ?auto_126093 ) ) ( not ( = ?auto_126085 ?auto_126086 ) ) ( not ( = ?auto_126085 ?auto_126087 ) ) ( not ( = ?auto_126085 ?auto_126088 ) ) ( not ( = ?auto_126085 ?auto_126089 ) ) ( not ( = ?auto_126085 ?auto_126090 ) ) ( not ( = ?auto_126085 ?auto_126091 ) ) ( not ( = ?auto_126085 ?auto_126092 ) ) ( not ( = ?auto_126085 ?auto_126093 ) ) ( not ( = ?auto_126086 ?auto_126087 ) ) ( not ( = ?auto_126086 ?auto_126088 ) ) ( not ( = ?auto_126086 ?auto_126089 ) ) ( not ( = ?auto_126086 ?auto_126090 ) ) ( not ( = ?auto_126086 ?auto_126091 ) ) ( not ( = ?auto_126086 ?auto_126092 ) ) ( not ( = ?auto_126086 ?auto_126093 ) ) ( not ( = ?auto_126087 ?auto_126088 ) ) ( not ( = ?auto_126087 ?auto_126089 ) ) ( not ( = ?auto_126087 ?auto_126090 ) ) ( not ( = ?auto_126087 ?auto_126091 ) ) ( not ( = ?auto_126087 ?auto_126092 ) ) ( not ( = ?auto_126087 ?auto_126093 ) ) ( not ( = ?auto_126088 ?auto_126089 ) ) ( not ( = ?auto_126088 ?auto_126090 ) ) ( not ( = ?auto_126088 ?auto_126091 ) ) ( not ( = ?auto_126088 ?auto_126092 ) ) ( not ( = ?auto_126088 ?auto_126093 ) ) ( not ( = ?auto_126089 ?auto_126090 ) ) ( not ( = ?auto_126089 ?auto_126091 ) ) ( not ( = ?auto_126089 ?auto_126092 ) ) ( not ( = ?auto_126089 ?auto_126093 ) ) ( not ( = ?auto_126090 ?auto_126091 ) ) ( not ( = ?auto_126090 ?auto_126092 ) ) ( not ( = ?auto_126090 ?auto_126093 ) ) ( not ( = ?auto_126091 ?auto_126092 ) ) ( not ( = ?auto_126091 ?auto_126093 ) ) ( not ( = ?auto_126092 ?auto_126093 ) ) ( ON ?auto_126092 ?auto_126093 ) ( ON ?auto_126091 ?auto_126092 ) ( ON ?auto_126090 ?auto_126091 ) ( ON ?auto_126089 ?auto_126090 ) ( ON ?auto_126088 ?auto_126089 ) ( ON ?auto_126087 ?auto_126088 ) ( CLEAR ?auto_126085 ) ( ON ?auto_126086 ?auto_126087 ) ( CLEAR ?auto_126086 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_126083 ?auto_126084 ?auto_126085 ?auto_126086 )
      ( MAKE-11PILE ?auto_126083 ?auto_126084 ?auto_126085 ?auto_126086 ?auto_126087 ?auto_126088 ?auto_126089 ?auto_126090 ?auto_126091 ?auto_126092 ?auto_126093 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_126105 - BLOCK
      ?auto_126106 - BLOCK
      ?auto_126107 - BLOCK
      ?auto_126108 - BLOCK
      ?auto_126109 - BLOCK
      ?auto_126110 - BLOCK
      ?auto_126111 - BLOCK
      ?auto_126112 - BLOCK
      ?auto_126113 - BLOCK
      ?auto_126114 - BLOCK
      ?auto_126115 - BLOCK
    )
    :vars
    (
      ?auto_126116 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126115 ?auto_126116 ) ( ON-TABLE ?auto_126105 ) ( ON ?auto_126106 ?auto_126105 ) ( not ( = ?auto_126105 ?auto_126106 ) ) ( not ( = ?auto_126105 ?auto_126107 ) ) ( not ( = ?auto_126105 ?auto_126108 ) ) ( not ( = ?auto_126105 ?auto_126109 ) ) ( not ( = ?auto_126105 ?auto_126110 ) ) ( not ( = ?auto_126105 ?auto_126111 ) ) ( not ( = ?auto_126105 ?auto_126112 ) ) ( not ( = ?auto_126105 ?auto_126113 ) ) ( not ( = ?auto_126105 ?auto_126114 ) ) ( not ( = ?auto_126105 ?auto_126115 ) ) ( not ( = ?auto_126105 ?auto_126116 ) ) ( not ( = ?auto_126106 ?auto_126107 ) ) ( not ( = ?auto_126106 ?auto_126108 ) ) ( not ( = ?auto_126106 ?auto_126109 ) ) ( not ( = ?auto_126106 ?auto_126110 ) ) ( not ( = ?auto_126106 ?auto_126111 ) ) ( not ( = ?auto_126106 ?auto_126112 ) ) ( not ( = ?auto_126106 ?auto_126113 ) ) ( not ( = ?auto_126106 ?auto_126114 ) ) ( not ( = ?auto_126106 ?auto_126115 ) ) ( not ( = ?auto_126106 ?auto_126116 ) ) ( not ( = ?auto_126107 ?auto_126108 ) ) ( not ( = ?auto_126107 ?auto_126109 ) ) ( not ( = ?auto_126107 ?auto_126110 ) ) ( not ( = ?auto_126107 ?auto_126111 ) ) ( not ( = ?auto_126107 ?auto_126112 ) ) ( not ( = ?auto_126107 ?auto_126113 ) ) ( not ( = ?auto_126107 ?auto_126114 ) ) ( not ( = ?auto_126107 ?auto_126115 ) ) ( not ( = ?auto_126107 ?auto_126116 ) ) ( not ( = ?auto_126108 ?auto_126109 ) ) ( not ( = ?auto_126108 ?auto_126110 ) ) ( not ( = ?auto_126108 ?auto_126111 ) ) ( not ( = ?auto_126108 ?auto_126112 ) ) ( not ( = ?auto_126108 ?auto_126113 ) ) ( not ( = ?auto_126108 ?auto_126114 ) ) ( not ( = ?auto_126108 ?auto_126115 ) ) ( not ( = ?auto_126108 ?auto_126116 ) ) ( not ( = ?auto_126109 ?auto_126110 ) ) ( not ( = ?auto_126109 ?auto_126111 ) ) ( not ( = ?auto_126109 ?auto_126112 ) ) ( not ( = ?auto_126109 ?auto_126113 ) ) ( not ( = ?auto_126109 ?auto_126114 ) ) ( not ( = ?auto_126109 ?auto_126115 ) ) ( not ( = ?auto_126109 ?auto_126116 ) ) ( not ( = ?auto_126110 ?auto_126111 ) ) ( not ( = ?auto_126110 ?auto_126112 ) ) ( not ( = ?auto_126110 ?auto_126113 ) ) ( not ( = ?auto_126110 ?auto_126114 ) ) ( not ( = ?auto_126110 ?auto_126115 ) ) ( not ( = ?auto_126110 ?auto_126116 ) ) ( not ( = ?auto_126111 ?auto_126112 ) ) ( not ( = ?auto_126111 ?auto_126113 ) ) ( not ( = ?auto_126111 ?auto_126114 ) ) ( not ( = ?auto_126111 ?auto_126115 ) ) ( not ( = ?auto_126111 ?auto_126116 ) ) ( not ( = ?auto_126112 ?auto_126113 ) ) ( not ( = ?auto_126112 ?auto_126114 ) ) ( not ( = ?auto_126112 ?auto_126115 ) ) ( not ( = ?auto_126112 ?auto_126116 ) ) ( not ( = ?auto_126113 ?auto_126114 ) ) ( not ( = ?auto_126113 ?auto_126115 ) ) ( not ( = ?auto_126113 ?auto_126116 ) ) ( not ( = ?auto_126114 ?auto_126115 ) ) ( not ( = ?auto_126114 ?auto_126116 ) ) ( not ( = ?auto_126115 ?auto_126116 ) ) ( ON ?auto_126114 ?auto_126115 ) ( ON ?auto_126113 ?auto_126114 ) ( ON ?auto_126112 ?auto_126113 ) ( ON ?auto_126111 ?auto_126112 ) ( ON ?auto_126110 ?auto_126111 ) ( ON ?auto_126109 ?auto_126110 ) ( ON ?auto_126108 ?auto_126109 ) ( CLEAR ?auto_126106 ) ( ON ?auto_126107 ?auto_126108 ) ( CLEAR ?auto_126107 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_126105 ?auto_126106 ?auto_126107 )
      ( MAKE-11PILE ?auto_126105 ?auto_126106 ?auto_126107 ?auto_126108 ?auto_126109 ?auto_126110 ?auto_126111 ?auto_126112 ?auto_126113 ?auto_126114 ?auto_126115 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_126128 - BLOCK
      ?auto_126129 - BLOCK
      ?auto_126130 - BLOCK
      ?auto_126131 - BLOCK
      ?auto_126132 - BLOCK
      ?auto_126133 - BLOCK
      ?auto_126134 - BLOCK
      ?auto_126135 - BLOCK
      ?auto_126136 - BLOCK
      ?auto_126137 - BLOCK
      ?auto_126138 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_126138 ) ( ON-TABLE ?auto_126128 ) ( ON ?auto_126129 ?auto_126128 ) ( not ( = ?auto_126128 ?auto_126129 ) ) ( not ( = ?auto_126128 ?auto_126130 ) ) ( not ( = ?auto_126128 ?auto_126131 ) ) ( not ( = ?auto_126128 ?auto_126132 ) ) ( not ( = ?auto_126128 ?auto_126133 ) ) ( not ( = ?auto_126128 ?auto_126134 ) ) ( not ( = ?auto_126128 ?auto_126135 ) ) ( not ( = ?auto_126128 ?auto_126136 ) ) ( not ( = ?auto_126128 ?auto_126137 ) ) ( not ( = ?auto_126128 ?auto_126138 ) ) ( not ( = ?auto_126129 ?auto_126130 ) ) ( not ( = ?auto_126129 ?auto_126131 ) ) ( not ( = ?auto_126129 ?auto_126132 ) ) ( not ( = ?auto_126129 ?auto_126133 ) ) ( not ( = ?auto_126129 ?auto_126134 ) ) ( not ( = ?auto_126129 ?auto_126135 ) ) ( not ( = ?auto_126129 ?auto_126136 ) ) ( not ( = ?auto_126129 ?auto_126137 ) ) ( not ( = ?auto_126129 ?auto_126138 ) ) ( not ( = ?auto_126130 ?auto_126131 ) ) ( not ( = ?auto_126130 ?auto_126132 ) ) ( not ( = ?auto_126130 ?auto_126133 ) ) ( not ( = ?auto_126130 ?auto_126134 ) ) ( not ( = ?auto_126130 ?auto_126135 ) ) ( not ( = ?auto_126130 ?auto_126136 ) ) ( not ( = ?auto_126130 ?auto_126137 ) ) ( not ( = ?auto_126130 ?auto_126138 ) ) ( not ( = ?auto_126131 ?auto_126132 ) ) ( not ( = ?auto_126131 ?auto_126133 ) ) ( not ( = ?auto_126131 ?auto_126134 ) ) ( not ( = ?auto_126131 ?auto_126135 ) ) ( not ( = ?auto_126131 ?auto_126136 ) ) ( not ( = ?auto_126131 ?auto_126137 ) ) ( not ( = ?auto_126131 ?auto_126138 ) ) ( not ( = ?auto_126132 ?auto_126133 ) ) ( not ( = ?auto_126132 ?auto_126134 ) ) ( not ( = ?auto_126132 ?auto_126135 ) ) ( not ( = ?auto_126132 ?auto_126136 ) ) ( not ( = ?auto_126132 ?auto_126137 ) ) ( not ( = ?auto_126132 ?auto_126138 ) ) ( not ( = ?auto_126133 ?auto_126134 ) ) ( not ( = ?auto_126133 ?auto_126135 ) ) ( not ( = ?auto_126133 ?auto_126136 ) ) ( not ( = ?auto_126133 ?auto_126137 ) ) ( not ( = ?auto_126133 ?auto_126138 ) ) ( not ( = ?auto_126134 ?auto_126135 ) ) ( not ( = ?auto_126134 ?auto_126136 ) ) ( not ( = ?auto_126134 ?auto_126137 ) ) ( not ( = ?auto_126134 ?auto_126138 ) ) ( not ( = ?auto_126135 ?auto_126136 ) ) ( not ( = ?auto_126135 ?auto_126137 ) ) ( not ( = ?auto_126135 ?auto_126138 ) ) ( not ( = ?auto_126136 ?auto_126137 ) ) ( not ( = ?auto_126136 ?auto_126138 ) ) ( not ( = ?auto_126137 ?auto_126138 ) ) ( ON ?auto_126137 ?auto_126138 ) ( ON ?auto_126136 ?auto_126137 ) ( ON ?auto_126135 ?auto_126136 ) ( ON ?auto_126134 ?auto_126135 ) ( ON ?auto_126133 ?auto_126134 ) ( ON ?auto_126132 ?auto_126133 ) ( ON ?auto_126131 ?auto_126132 ) ( CLEAR ?auto_126129 ) ( ON ?auto_126130 ?auto_126131 ) ( CLEAR ?auto_126130 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_126128 ?auto_126129 ?auto_126130 )
      ( MAKE-11PILE ?auto_126128 ?auto_126129 ?auto_126130 ?auto_126131 ?auto_126132 ?auto_126133 ?auto_126134 ?auto_126135 ?auto_126136 ?auto_126137 ?auto_126138 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_126150 - BLOCK
      ?auto_126151 - BLOCK
      ?auto_126152 - BLOCK
      ?auto_126153 - BLOCK
      ?auto_126154 - BLOCK
      ?auto_126155 - BLOCK
      ?auto_126156 - BLOCK
      ?auto_126157 - BLOCK
      ?auto_126158 - BLOCK
      ?auto_126159 - BLOCK
      ?auto_126160 - BLOCK
    )
    :vars
    (
      ?auto_126161 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126160 ?auto_126161 ) ( ON-TABLE ?auto_126150 ) ( not ( = ?auto_126150 ?auto_126151 ) ) ( not ( = ?auto_126150 ?auto_126152 ) ) ( not ( = ?auto_126150 ?auto_126153 ) ) ( not ( = ?auto_126150 ?auto_126154 ) ) ( not ( = ?auto_126150 ?auto_126155 ) ) ( not ( = ?auto_126150 ?auto_126156 ) ) ( not ( = ?auto_126150 ?auto_126157 ) ) ( not ( = ?auto_126150 ?auto_126158 ) ) ( not ( = ?auto_126150 ?auto_126159 ) ) ( not ( = ?auto_126150 ?auto_126160 ) ) ( not ( = ?auto_126150 ?auto_126161 ) ) ( not ( = ?auto_126151 ?auto_126152 ) ) ( not ( = ?auto_126151 ?auto_126153 ) ) ( not ( = ?auto_126151 ?auto_126154 ) ) ( not ( = ?auto_126151 ?auto_126155 ) ) ( not ( = ?auto_126151 ?auto_126156 ) ) ( not ( = ?auto_126151 ?auto_126157 ) ) ( not ( = ?auto_126151 ?auto_126158 ) ) ( not ( = ?auto_126151 ?auto_126159 ) ) ( not ( = ?auto_126151 ?auto_126160 ) ) ( not ( = ?auto_126151 ?auto_126161 ) ) ( not ( = ?auto_126152 ?auto_126153 ) ) ( not ( = ?auto_126152 ?auto_126154 ) ) ( not ( = ?auto_126152 ?auto_126155 ) ) ( not ( = ?auto_126152 ?auto_126156 ) ) ( not ( = ?auto_126152 ?auto_126157 ) ) ( not ( = ?auto_126152 ?auto_126158 ) ) ( not ( = ?auto_126152 ?auto_126159 ) ) ( not ( = ?auto_126152 ?auto_126160 ) ) ( not ( = ?auto_126152 ?auto_126161 ) ) ( not ( = ?auto_126153 ?auto_126154 ) ) ( not ( = ?auto_126153 ?auto_126155 ) ) ( not ( = ?auto_126153 ?auto_126156 ) ) ( not ( = ?auto_126153 ?auto_126157 ) ) ( not ( = ?auto_126153 ?auto_126158 ) ) ( not ( = ?auto_126153 ?auto_126159 ) ) ( not ( = ?auto_126153 ?auto_126160 ) ) ( not ( = ?auto_126153 ?auto_126161 ) ) ( not ( = ?auto_126154 ?auto_126155 ) ) ( not ( = ?auto_126154 ?auto_126156 ) ) ( not ( = ?auto_126154 ?auto_126157 ) ) ( not ( = ?auto_126154 ?auto_126158 ) ) ( not ( = ?auto_126154 ?auto_126159 ) ) ( not ( = ?auto_126154 ?auto_126160 ) ) ( not ( = ?auto_126154 ?auto_126161 ) ) ( not ( = ?auto_126155 ?auto_126156 ) ) ( not ( = ?auto_126155 ?auto_126157 ) ) ( not ( = ?auto_126155 ?auto_126158 ) ) ( not ( = ?auto_126155 ?auto_126159 ) ) ( not ( = ?auto_126155 ?auto_126160 ) ) ( not ( = ?auto_126155 ?auto_126161 ) ) ( not ( = ?auto_126156 ?auto_126157 ) ) ( not ( = ?auto_126156 ?auto_126158 ) ) ( not ( = ?auto_126156 ?auto_126159 ) ) ( not ( = ?auto_126156 ?auto_126160 ) ) ( not ( = ?auto_126156 ?auto_126161 ) ) ( not ( = ?auto_126157 ?auto_126158 ) ) ( not ( = ?auto_126157 ?auto_126159 ) ) ( not ( = ?auto_126157 ?auto_126160 ) ) ( not ( = ?auto_126157 ?auto_126161 ) ) ( not ( = ?auto_126158 ?auto_126159 ) ) ( not ( = ?auto_126158 ?auto_126160 ) ) ( not ( = ?auto_126158 ?auto_126161 ) ) ( not ( = ?auto_126159 ?auto_126160 ) ) ( not ( = ?auto_126159 ?auto_126161 ) ) ( not ( = ?auto_126160 ?auto_126161 ) ) ( ON ?auto_126159 ?auto_126160 ) ( ON ?auto_126158 ?auto_126159 ) ( ON ?auto_126157 ?auto_126158 ) ( ON ?auto_126156 ?auto_126157 ) ( ON ?auto_126155 ?auto_126156 ) ( ON ?auto_126154 ?auto_126155 ) ( ON ?auto_126153 ?auto_126154 ) ( ON ?auto_126152 ?auto_126153 ) ( CLEAR ?auto_126150 ) ( ON ?auto_126151 ?auto_126152 ) ( CLEAR ?auto_126151 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_126150 ?auto_126151 )
      ( MAKE-11PILE ?auto_126150 ?auto_126151 ?auto_126152 ?auto_126153 ?auto_126154 ?auto_126155 ?auto_126156 ?auto_126157 ?auto_126158 ?auto_126159 ?auto_126160 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_126173 - BLOCK
      ?auto_126174 - BLOCK
      ?auto_126175 - BLOCK
      ?auto_126176 - BLOCK
      ?auto_126177 - BLOCK
      ?auto_126178 - BLOCK
      ?auto_126179 - BLOCK
      ?auto_126180 - BLOCK
      ?auto_126181 - BLOCK
      ?auto_126182 - BLOCK
      ?auto_126183 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_126183 ) ( ON-TABLE ?auto_126173 ) ( not ( = ?auto_126173 ?auto_126174 ) ) ( not ( = ?auto_126173 ?auto_126175 ) ) ( not ( = ?auto_126173 ?auto_126176 ) ) ( not ( = ?auto_126173 ?auto_126177 ) ) ( not ( = ?auto_126173 ?auto_126178 ) ) ( not ( = ?auto_126173 ?auto_126179 ) ) ( not ( = ?auto_126173 ?auto_126180 ) ) ( not ( = ?auto_126173 ?auto_126181 ) ) ( not ( = ?auto_126173 ?auto_126182 ) ) ( not ( = ?auto_126173 ?auto_126183 ) ) ( not ( = ?auto_126174 ?auto_126175 ) ) ( not ( = ?auto_126174 ?auto_126176 ) ) ( not ( = ?auto_126174 ?auto_126177 ) ) ( not ( = ?auto_126174 ?auto_126178 ) ) ( not ( = ?auto_126174 ?auto_126179 ) ) ( not ( = ?auto_126174 ?auto_126180 ) ) ( not ( = ?auto_126174 ?auto_126181 ) ) ( not ( = ?auto_126174 ?auto_126182 ) ) ( not ( = ?auto_126174 ?auto_126183 ) ) ( not ( = ?auto_126175 ?auto_126176 ) ) ( not ( = ?auto_126175 ?auto_126177 ) ) ( not ( = ?auto_126175 ?auto_126178 ) ) ( not ( = ?auto_126175 ?auto_126179 ) ) ( not ( = ?auto_126175 ?auto_126180 ) ) ( not ( = ?auto_126175 ?auto_126181 ) ) ( not ( = ?auto_126175 ?auto_126182 ) ) ( not ( = ?auto_126175 ?auto_126183 ) ) ( not ( = ?auto_126176 ?auto_126177 ) ) ( not ( = ?auto_126176 ?auto_126178 ) ) ( not ( = ?auto_126176 ?auto_126179 ) ) ( not ( = ?auto_126176 ?auto_126180 ) ) ( not ( = ?auto_126176 ?auto_126181 ) ) ( not ( = ?auto_126176 ?auto_126182 ) ) ( not ( = ?auto_126176 ?auto_126183 ) ) ( not ( = ?auto_126177 ?auto_126178 ) ) ( not ( = ?auto_126177 ?auto_126179 ) ) ( not ( = ?auto_126177 ?auto_126180 ) ) ( not ( = ?auto_126177 ?auto_126181 ) ) ( not ( = ?auto_126177 ?auto_126182 ) ) ( not ( = ?auto_126177 ?auto_126183 ) ) ( not ( = ?auto_126178 ?auto_126179 ) ) ( not ( = ?auto_126178 ?auto_126180 ) ) ( not ( = ?auto_126178 ?auto_126181 ) ) ( not ( = ?auto_126178 ?auto_126182 ) ) ( not ( = ?auto_126178 ?auto_126183 ) ) ( not ( = ?auto_126179 ?auto_126180 ) ) ( not ( = ?auto_126179 ?auto_126181 ) ) ( not ( = ?auto_126179 ?auto_126182 ) ) ( not ( = ?auto_126179 ?auto_126183 ) ) ( not ( = ?auto_126180 ?auto_126181 ) ) ( not ( = ?auto_126180 ?auto_126182 ) ) ( not ( = ?auto_126180 ?auto_126183 ) ) ( not ( = ?auto_126181 ?auto_126182 ) ) ( not ( = ?auto_126181 ?auto_126183 ) ) ( not ( = ?auto_126182 ?auto_126183 ) ) ( ON ?auto_126182 ?auto_126183 ) ( ON ?auto_126181 ?auto_126182 ) ( ON ?auto_126180 ?auto_126181 ) ( ON ?auto_126179 ?auto_126180 ) ( ON ?auto_126178 ?auto_126179 ) ( ON ?auto_126177 ?auto_126178 ) ( ON ?auto_126176 ?auto_126177 ) ( ON ?auto_126175 ?auto_126176 ) ( CLEAR ?auto_126173 ) ( ON ?auto_126174 ?auto_126175 ) ( CLEAR ?auto_126174 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_126173 ?auto_126174 )
      ( MAKE-11PILE ?auto_126173 ?auto_126174 ?auto_126175 ?auto_126176 ?auto_126177 ?auto_126178 ?auto_126179 ?auto_126180 ?auto_126181 ?auto_126182 ?auto_126183 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_126195 - BLOCK
      ?auto_126196 - BLOCK
      ?auto_126197 - BLOCK
      ?auto_126198 - BLOCK
      ?auto_126199 - BLOCK
      ?auto_126200 - BLOCK
      ?auto_126201 - BLOCK
      ?auto_126202 - BLOCK
      ?auto_126203 - BLOCK
      ?auto_126204 - BLOCK
      ?auto_126205 - BLOCK
    )
    :vars
    (
      ?auto_126206 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126205 ?auto_126206 ) ( not ( = ?auto_126195 ?auto_126196 ) ) ( not ( = ?auto_126195 ?auto_126197 ) ) ( not ( = ?auto_126195 ?auto_126198 ) ) ( not ( = ?auto_126195 ?auto_126199 ) ) ( not ( = ?auto_126195 ?auto_126200 ) ) ( not ( = ?auto_126195 ?auto_126201 ) ) ( not ( = ?auto_126195 ?auto_126202 ) ) ( not ( = ?auto_126195 ?auto_126203 ) ) ( not ( = ?auto_126195 ?auto_126204 ) ) ( not ( = ?auto_126195 ?auto_126205 ) ) ( not ( = ?auto_126195 ?auto_126206 ) ) ( not ( = ?auto_126196 ?auto_126197 ) ) ( not ( = ?auto_126196 ?auto_126198 ) ) ( not ( = ?auto_126196 ?auto_126199 ) ) ( not ( = ?auto_126196 ?auto_126200 ) ) ( not ( = ?auto_126196 ?auto_126201 ) ) ( not ( = ?auto_126196 ?auto_126202 ) ) ( not ( = ?auto_126196 ?auto_126203 ) ) ( not ( = ?auto_126196 ?auto_126204 ) ) ( not ( = ?auto_126196 ?auto_126205 ) ) ( not ( = ?auto_126196 ?auto_126206 ) ) ( not ( = ?auto_126197 ?auto_126198 ) ) ( not ( = ?auto_126197 ?auto_126199 ) ) ( not ( = ?auto_126197 ?auto_126200 ) ) ( not ( = ?auto_126197 ?auto_126201 ) ) ( not ( = ?auto_126197 ?auto_126202 ) ) ( not ( = ?auto_126197 ?auto_126203 ) ) ( not ( = ?auto_126197 ?auto_126204 ) ) ( not ( = ?auto_126197 ?auto_126205 ) ) ( not ( = ?auto_126197 ?auto_126206 ) ) ( not ( = ?auto_126198 ?auto_126199 ) ) ( not ( = ?auto_126198 ?auto_126200 ) ) ( not ( = ?auto_126198 ?auto_126201 ) ) ( not ( = ?auto_126198 ?auto_126202 ) ) ( not ( = ?auto_126198 ?auto_126203 ) ) ( not ( = ?auto_126198 ?auto_126204 ) ) ( not ( = ?auto_126198 ?auto_126205 ) ) ( not ( = ?auto_126198 ?auto_126206 ) ) ( not ( = ?auto_126199 ?auto_126200 ) ) ( not ( = ?auto_126199 ?auto_126201 ) ) ( not ( = ?auto_126199 ?auto_126202 ) ) ( not ( = ?auto_126199 ?auto_126203 ) ) ( not ( = ?auto_126199 ?auto_126204 ) ) ( not ( = ?auto_126199 ?auto_126205 ) ) ( not ( = ?auto_126199 ?auto_126206 ) ) ( not ( = ?auto_126200 ?auto_126201 ) ) ( not ( = ?auto_126200 ?auto_126202 ) ) ( not ( = ?auto_126200 ?auto_126203 ) ) ( not ( = ?auto_126200 ?auto_126204 ) ) ( not ( = ?auto_126200 ?auto_126205 ) ) ( not ( = ?auto_126200 ?auto_126206 ) ) ( not ( = ?auto_126201 ?auto_126202 ) ) ( not ( = ?auto_126201 ?auto_126203 ) ) ( not ( = ?auto_126201 ?auto_126204 ) ) ( not ( = ?auto_126201 ?auto_126205 ) ) ( not ( = ?auto_126201 ?auto_126206 ) ) ( not ( = ?auto_126202 ?auto_126203 ) ) ( not ( = ?auto_126202 ?auto_126204 ) ) ( not ( = ?auto_126202 ?auto_126205 ) ) ( not ( = ?auto_126202 ?auto_126206 ) ) ( not ( = ?auto_126203 ?auto_126204 ) ) ( not ( = ?auto_126203 ?auto_126205 ) ) ( not ( = ?auto_126203 ?auto_126206 ) ) ( not ( = ?auto_126204 ?auto_126205 ) ) ( not ( = ?auto_126204 ?auto_126206 ) ) ( not ( = ?auto_126205 ?auto_126206 ) ) ( ON ?auto_126204 ?auto_126205 ) ( ON ?auto_126203 ?auto_126204 ) ( ON ?auto_126202 ?auto_126203 ) ( ON ?auto_126201 ?auto_126202 ) ( ON ?auto_126200 ?auto_126201 ) ( ON ?auto_126199 ?auto_126200 ) ( ON ?auto_126198 ?auto_126199 ) ( ON ?auto_126197 ?auto_126198 ) ( ON ?auto_126196 ?auto_126197 ) ( ON ?auto_126195 ?auto_126196 ) ( CLEAR ?auto_126195 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_126195 )
      ( MAKE-11PILE ?auto_126195 ?auto_126196 ?auto_126197 ?auto_126198 ?auto_126199 ?auto_126200 ?auto_126201 ?auto_126202 ?auto_126203 ?auto_126204 ?auto_126205 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_126218 - BLOCK
      ?auto_126219 - BLOCK
      ?auto_126220 - BLOCK
      ?auto_126221 - BLOCK
      ?auto_126222 - BLOCK
      ?auto_126223 - BLOCK
      ?auto_126224 - BLOCK
      ?auto_126225 - BLOCK
      ?auto_126226 - BLOCK
      ?auto_126227 - BLOCK
      ?auto_126228 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_126228 ) ( not ( = ?auto_126218 ?auto_126219 ) ) ( not ( = ?auto_126218 ?auto_126220 ) ) ( not ( = ?auto_126218 ?auto_126221 ) ) ( not ( = ?auto_126218 ?auto_126222 ) ) ( not ( = ?auto_126218 ?auto_126223 ) ) ( not ( = ?auto_126218 ?auto_126224 ) ) ( not ( = ?auto_126218 ?auto_126225 ) ) ( not ( = ?auto_126218 ?auto_126226 ) ) ( not ( = ?auto_126218 ?auto_126227 ) ) ( not ( = ?auto_126218 ?auto_126228 ) ) ( not ( = ?auto_126219 ?auto_126220 ) ) ( not ( = ?auto_126219 ?auto_126221 ) ) ( not ( = ?auto_126219 ?auto_126222 ) ) ( not ( = ?auto_126219 ?auto_126223 ) ) ( not ( = ?auto_126219 ?auto_126224 ) ) ( not ( = ?auto_126219 ?auto_126225 ) ) ( not ( = ?auto_126219 ?auto_126226 ) ) ( not ( = ?auto_126219 ?auto_126227 ) ) ( not ( = ?auto_126219 ?auto_126228 ) ) ( not ( = ?auto_126220 ?auto_126221 ) ) ( not ( = ?auto_126220 ?auto_126222 ) ) ( not ( = ?auto_126220 ?auto_126223 ) ) ( not ( = ?auto_126220 ?auto_126224 ) ) ( not ( = ?auto_126220 ?auto_126225 ) ) ( not ( = ?auto_126220 ?auto_126226 ) ) ( not ( = ?auto_126220 ?auto_126227 ) ) ( not ( = ?auto_126220 ?auto_126228 ) ) ( not ( = ?auto_126221 ?auto_126222 ) ) ( not ( = ?auto_126221 ?auto_126223 ) ) ( not ( = ?auto_126221 ?auto_126224 ) ) ( not ( = ?auto_126221 ?auto_126225 ) ) ( not ( = ?auto_126221 ?auto_126226 ) ) ( not ( = ?auto_126221 ?auto_126227 ) ) ( not ( = ?auto_126221 ?auto_126228 ) ) ( not ( = ?auto_126222 ?auto_126223 ) ) ( not ( = ?auto_126222 ?auto_126224 ) ) ( not ( = ?auto_126222 ?auto_126225 ) ) ( not ( = ?auto_126222 ?auto_126226 ) ) ( not ( = ?auto_126222 ?auto_126227 ) ) ( not ( = ?auto_126222 ?auto_126228 ) ) ( not ( = ?auto_126223 ?auto_126224 ) ) ( not ( = ?auto_126223 ?auto_126225 ) ) ( not ( = ?auto_126223 ?auto_126226 ) ) ( not ( = ?auto_126223 ?auto_126227 ) ) ( not ( = ?auto_126223 ?auto_126228 ) ) ( not ( = ?auto_126224 ?auto_126225 ) ) ( not ( = ?auto_126224 ?auto_126226 ) ) ( not ( = ?auto_126224 ?auto_126227 ) ) ( not ( = ?auto_126224 ?auto_126228 ) ) ( not ( = ?auto_126225 ?auto_126226 ) ) ( not ( = ?auto_126225 ?auto_126227 ) ) ( not ( = ?auto_126225 ?auto_126228 ) ) ( not ( = ?auto_126226 ?auto_126227 ) ) ( not ( = ?auto_126226 ?auto_126228 ) ) ( not ( = ?auto_126227 ?auto_126228 ) ) ( ON ?auto_126227 ?auto_126228 ) ( ON ?auto_126226 ?auto_126227 ) ( ON ?auto_126225 ?auto_126226 ) ( ON ?auto_126224 ?auto_126225 ) ( ON ?auto_126223 ?auto_126224 ) ( ON ?auto_126222 ?auto_126223 ) ( ON ?auto_126221 ?auto_126222 ) ( ON ?auto_126220 ?auto_126221 ) ( ON ?auto_126219 ?auto_126220 ) ( ON ?auto_126218 ?auto_126219 ) ( CLEAR ?auto_126218 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_126218 )
      ( MAKE-11PILE ?auto_126218 ?auto_126219 ?auto_126220 ?auto_126221 ?auto_126222 ?auto_126223 ?auto_126224 ?auto_126225 ?auto_126226 ?auto_126227 ?auto_126228 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_126240 - BLOCK
      ?auto_126241 - BLOCK
      ?auto_126242 - BLOCK
      ?auto_126243 - BLOCK
      ?auto_126244 - BLOCK
      ?auto_126245 - BLOCK
      ?auto_126246 - BLOCK
      ?auto_126247 - BLOCK
      ?auto_126248 - BLOCK
      ?auto_126249 - BLOCK
      ?auto_126250 - BLOCK
    )
    :vars
    (
      ?auto_126251 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126240 ?auto_126241 ) ) ( not ( = ?auto_126240 ?auto_126242 ) ) ( not ( = ?auto_126240 ?auto_126243 ) ) ( not ( = ?auto_126240 ?auto_126244 ) ) ( not ( = ?auto_126240 ?auto_126245 ) ) ( not ( = ?auto_126240 ?auto_126246 ) ) ( not ( = ?auto_126240 ?auto_126247 ) ) ( not ( = ?auto_126240 ?auto_126248 ) ) ( not ( = ?auto_126240 ?auto_126249 ) ) ( not ( = ?auto_126240 ?auto_126250 ) ) ( not ( = ?auto_126241 ?auto_126242 ) ) ( not ( = ?auto_126241 ?auto_126243 ) ) ( not ( = ?auto_126241 ?auto_126244 ) ) ( not ( = ?auto_126241 ?auto_126245 ) ) ( not ( = ?auto_126241 ?auto_126246 ) ) ( not ( = ?auto_126241 ?auto_126247 ) ) ( not ( = ?auto_126241 ?auto_126248 ) ) ( not ( = ?auto_126241 ?auto_126249 ) ) ( not ( = ?auto_126241 ?auto_126250 ) ) ( not ( = ?auto_126242 ?auto_126243 ) ) ( not ( = ?auto_126242 ?auto_126244 ) ) ( not ( = ?auto_126242 ?auto_126245 ) ) ( not ( = ?auto_126242 ?auto_126246 ) ) ( not ( = ?auto_126242 ?auto_126247 ) ) ( not ( = ?auto_126242 ?auto_126248 ) ) ( not ( = ?auto_126242 ?auto_126249 ) ) ( not ( = ?auto_126242 ?auto_126250 ) ) ( not ( = ?auto_126243 ?auto_126244 ) ) ( not ( = ?auto_126243 ?auto_126245 ) ) ( not ( = ?auto_126243 ?auto_126246 ) ) ( not ( = ?auto_126243 ?auto_126247 ) ) ( not ( = ?auto_126243 ?auto_126248 ) ) ( not ( = ?auto_126243 ?auto_126249 ) ) ( not ( = ?auto_126243 ?auto_126250 ) ) ( not ( = ?auto_126244 ?auto_126245 ) ) ( not ( = ?auto_126244 ?auto_126246 ) ) ( not ( = ?auto_126244 ?auto_126247 ) ) ( not ( = ?auto_126244 ?auto_126248 ) ) ( not ( = ?auto_126244 ?auto_126249 ) ) ( not ( = ?auto_126244 ?auto_126250 ) ) ( not ( = ?auto_126245 ?auto_126246 ) ) ( not ( = ?auto_126245 ?auto_126247 ) ) ( not ( = ?auto_126245 ?auto_126248 ) ) ( not ( = ?auto_126245 ?auto_126249 ) ) ( not ( = ?auto_126245 ?auto_126250 ) ) ( not ( = ?auto_126246 ?auto_126247 ) ) ( not ( = ?auto_126246 ?auto_126248 ) ) ( not ( = ?auto_126246 ?auto_126249 ) ) ( not ( = ?auto_126246 ?auto_126250 ) ) ( not ( = ?auto_126247 ?auto_126248 ) ) ( not ( = ?auto_126247 ?auto_126249 ) ) ( not ( = ?auto_126247 ?auto_126250 ) ) ( not ( = ?auto_126248 ?auto_126249 ) ) ( not ( = ?auto_126248 ?auto_126250 ) ) ( not ( = ?auto_126249 ?auto_126250 ) ) ( ON ?auto_126240 ?auto_126251 ) ( not ( = ?auto_126250 ?auto_126251 ) ) ( not ( = ?auto_126249 ?auto_126251 ) ) ( not ( = ?auto_126248 ?auto_126251 ) ) ( not ( = ?auto_126247 ?auto_126251 ) ) ( not ( = ?auto_126246 ?auto_126251 ) ) ( not ( = ?auto_126245 ?auto_126251 ) ) ( not ( = ?auto_126244 ?auto_126251 ) ) ( not ( = ?auto_126243 ?auto_126251 ) ) ( not ( = ?auto_126242 ?auto_126251 ) ) ( not ( = ?auto_126241 ?auto_126251 ) ) ( not ( = ?auto_126240 ?auto_126251 ) ) ( ON ?auto_126241 ?auto_126240 ) ( ON ?auto_126242 ?auto_126241 ) ( ON ?auto_126243 ?auto_126242 ) ( ON ?auto_126244 ?auto_126243 ) ( ON ?auto_126245 ?auto_126244 ) ( ON ?auto_126246 ?auto_126245 ) ( ON ?auto_126247 ?auto_126246 ) ( ON ?auto_126248 ?auto_126247 ) ( ON ?auto_126249 ?auto_126248 ) ( ON ?auto_126250 ?auto_126249 ) ( CLEAR ?auto_126250 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_126250 ?auto_126249 ?auto_126248 ?auto_126247 ?auto_126246 ?auto_126245 ?auto_126244 ?auto_126243 ?auto_126242 ?auto_126241 ?auto_126240 )
      ( MAKE-11PILE ?auto_126240 ?auto_126241 ?auto_126242 ?auto_126243 ?auto_126244 ?auto_126245 ?auto_126246 ?auto_126247 ?auto_126248 ?auto_126249 ?auto_126250 ) )
  )

)

