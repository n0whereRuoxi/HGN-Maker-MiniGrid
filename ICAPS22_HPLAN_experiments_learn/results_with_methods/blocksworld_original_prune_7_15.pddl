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
      ?auto_104277 - BLOCK
      ?auto_104278 - BLOCK
      ?auto_104279 - BLOCK
      ?auto_104280 - BLOCK
      ?auto_104281 - BLOCK
      ?auto_104282 - BLOCK
      ?auto_104283 - BLOCK
    )
    :vars
    (
      ?auto_104284 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104284 ?auto_104283 ) ( CLEAR ?auto_104284 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_104277 ) ( ON ?auto_104278 ?auto_104277 ) ( ON ?auto_104279 ?auto_104278 ) ( ON ?auto_104280 ?auto_104279 ) ( ON ?auto_104281 ?auto_104280 ) ( ON ?auto_104282 ?auto_104281 ) ( ON ?auto_104283 ?auto_104282 ) ( not ( = ?auto_104277 ?auto_104278 ) ) ( not ( = ?auto_104277 ?auto_104279 ) ) ( not ( = ?auto_104277 ?auto_104280 ) ) ( not ( = ?auto_104277 ?auto_104281 ) ) ( not ( = ?auto_104277 ?auto_104282 ) ) ( not ( = ?auto_104277 ?auto_104283 ) ) ( not ( = ?auto_104277 ?auto_104284 ) ) ( not ( = ?auto_104278 ?auto_104279 ) ) ( not ( = ?auto_104278 ?auto_104280 ) ) ( not ( = ?auto_104278 ?auto_104281 ) ) ( not ( = ?auto_104278 ?auto_104282 ) ) ( not ( = ?auto_104278 ?auto_104283 ) ) ( not ( = ?auto_104278 ?auto_104284 ) ) ( not ( = ?auto_104279 ?auto_104280 ) ) ( not ( = ?auto_104279 ?auto_104281 ) ) ( not ( = ?auto_104279 ?auto_104282 ) ) ( not ( = ?auto_104279 ?auto_104283 ) ) ( not ( = ?auto_104279 ?auto_104284 ) ) ( not ( = ?auto_104280 ?auto_104281 ) ) ( not ( = ?auto_104280 ?auto_104282 ) ) ( not ( = ?auto_104280 ?auto_104283 ) ) ( not ( = ?auto_104280 ?auto_104284 ) ) ( not ( = ?auto_104281 ?auto_104282 ) ) ( not ( = ?auto_104281 ?auto_104283 ) ) ( not ( = ?auto_104281 ?auto_104284 ) ) ( not ( = ?auto_104282 ?auto_104283 ) ) ( not ( = ?auto_104282 ?auto_104284 ) ) ( not ( = ?auto_104283 ?auto_104284 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_104284 ?auto_104283 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_104286 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_104286 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_104286 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_104287 - BLOCK
    )
    :vars
    (
      ?auto_104288 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104287 ?auto_104288 ) ( CLEAR ?auto_104287 ) ( HAND-EMPTY ) ( not ( = ?auto_104287 ?auto_104288 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_104287 ?auto_104288 )
      ( MAKE-1PILE ?auto_104287 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_104295 - BLOCK
      ?auto_104296 - BLOCK
      ?auto_104297 - BLOCK
      ?auto_104298 - BLOCK
      ?auto_104299 - BLOCK
      ?auto_104300 - BLOCK
    )
    :vars
    (
      ?auto_104301 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104301 ?auto_104300 ) ( CLEAR ?auto_104301 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_104295 ) ( ON ?auto_104296 ?auto_104295 ) ( ON ?auto_104297 ?auto_104296 ) ( ON ?auto_104298 ?auto_104297 ) ( ON ?auto_104299 ?auto_104298 ) ( ON ?auto_104300 ?auto_104299 ) ( not ( = ?auto_104295 ?auto_104296 ) ) ( not ( = ?auto_104295 ?auto_104297 ) ) ( not ( = ?auto_104295 ?auto_104298 ) ) ( not ( = ?auto_104295 ?auto_104299 ) ) ( not ( = ?auto_104295 ?auto_104300 ) ) ( not ( = ?auto_104295 ?auto_104301 ) ) ( not ( = ?auto_104296 ?auto_104297 ) ) ( not ( = ?auto_104296 ?auto_104298 ) ) ( not ( = ?auto_104296 ?auto_104299 ) ) ( not ( = ?auto_104296 ?auto_104300 ) ) ( not ( = ?auto_104296 ?auto_104301 ) ) ( not ( = ?auto_104297 ?auto_104298 ) ) ( not ( = ?auto_104297 ?auto_104299 ) ) ( not ( = ?auto_104297 ?auto_104300 ) ) ( not ( = ?auto_104297 ?auto_104301 ) ) ( not ( = ?auto_104298 ?auto_104299 ) ) ( not ( = ?auto_104298 ?auto_104300 ) ) ( not ( = ?auto_104298 ?auto_104301 ) ) ( not ( = ?auto_104299 ?auto_104300 ) ) ( not ( = ?auto_104299 ?auto_104301 ) ) ( not ( = ?auto_104300 ?auto_104301 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_104301 ?auto_104300 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_104302 - BLOCK
      ?auto_104303 - BLOCK
      ?auto_104304 - BLOCK
      ?auto_104305 - BLOCK
      ?auto_104306 - BLOCK
      ?auto_104307 - BLOCK
    )
    :vars
    (
      ?auto_104308 - BLOCK
      ?auto_104309 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104308 ?auto_104307 ) ( CLEAR ?auto_104308 ) ( ON-TABLE ?auto_104302 ) ( ON ?auto_104303 ?auto_104302 ) ( ON ?auto_104304 ?auto_104303 ) ( ON ?auto_104305 ?auto_104304 ) ( ON ?auto_104306 ?auto_104305 ) ( ON ?auto_104307 ?auto_104306 ) ( not ( = ?auto_104302 ?auto_104303 ) ) ( not ( = ?auto_104302 ?auto_104304 ) ) ( not ( = ?auto_104302 ?auto_104305 ) ) ( not ( = ?auto_104302 ?auto_104306 ) ) ( not ( = ?auto_104302 ?auto_104307 ) ) ( not ( = ?auto_104302 ?auto_104308 ) ) ( not ( = ?auto_104303 ?auto_104304 ) ) ( not ( = ?auto_104303 ?auto_104305 ) ) ( not ( = ?auto_104303 ?auto_104306 ) ) ( not ( = ?auto_104303 ?auto_104307 ) ) ( not ( = ?auto_104303 ?auto_104308 ) ) ( not ( = ?auto_104304 ?auto_104305 ) ) ( not ( = ?auto_104304 ?auto_104306 ) ) ( not ( = ?auto_104304 ?auto_104307 ) ) ( not ( = ?auto_104304 ?auto_104308 ) ) ( not ( = ?auto_104305 ?auto_104306 ) ) ( not ( = ?auto_104305 ?auto_104307 ) ) ( not ( = ?auto_104305 ?auto_104308 ) ) ( not ( = ?auto_104306 ?auto_104307 ) ) ( not ( = ?auto_104306 ?auto_104308 ) ) ( not ( = ?auto_104307 ?auto_104308 ) ) ( HOLDING ?auto_104309 ) ( not ( = ?auto_104302 ?auto_104309 ) ) ( not ( = ?auto_104303 ?auto_104309 ) ) ( not ( = ?auto_104304 ?auto_104309 ) ) ( not ( = ?auto_104305 ?auto_104309 ) ) ( not ( = ?auto_104306 ?auto_104309 ) ) ( not ( = ?auto_104307 ?auto_104309 ) ) ( not ( = ?auto_104308 ?auto_104309 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_104309 )
      ( MAKE-6PILE ?auto_104302 ?auto_104303 ?auto_104304 ?auto_104305 ?auto_104306 ?auto_104307 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_104310 - BLOCK
      ?auto_104311 - BLOCK
      ?auto_104312 - BLOCK
      ?auto_104313 - BLOCK
      ?auto_104314 - BLOCK
      ?auto_104315 - BLOCK
    )
    :vars
    (
      ?auto_104317 - BLOCK
      ?auto_104316 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104317 ?auto_104315 ) ( ON-TABLE ?auto_104310 ) ( ON ?auto_104311 ?auto_104310 ) ( ON ?auto_104312 ?auto_104311 ) ( ON ?auto_104313 ?auto_104312 ) ( ON ?auto_104314 ?auto_104313 ) ( ON ?auto_104315 ?auto_104314 ) ( not ( = ?auto_104310 ?auto_104311 ) ) ( not ( = ?auto_104310 ?auto_104312 ) ) ( not ( = ?auto_104310 ?auto_104313 ) ) ( not ( = ?auto_104310 ?auto_104314 ) ) ( not ( = ?auto_104310 ?auto_104315 ) ) ( not ( = ?auto_104310 ?auto_104317 ) ) ( not ( = ?auto_104311 ?auto_104312 ) ) ( not ( = ?auto_104311 ?auto_104313 ) ) ( not ( = ?auto_104311 ?auto_104314 ) ) ( not ( = ?auto_104311 ?auto_104315 ) ) ( not ( = ?auto_104311 ?auto_104317 ) ) ( not ( = ?auto_104312 ?auto_104313 ) ) ( not ( = ?auto_104312 ?auto_104314 ) ) ( not ( = ?auto_104312 ?auto_104315 ) ) ( not ( = ?auto_104312 ?auto_104317 ) ) ( not ( = ?auto_104313 ?auto_104314 ) ) ( not ( = ?auto_104313 ?auto_104315 ) ) ( not ( = ?auto_104313 ?auto_104317 ) ) ( not ( = ?auto_104314 ?auto_104315 ) ) ( not ( = ?auto_104314 ?auto_104317 ) ) ( not ( = ?auto_104315 ?auto_104317 ) ) ( not ( = ?auto_104310 ?auto_104316 ) ) ( not ( = ?auto_104311 ?auto_104316 ) ) ( not ( = ?auto_104312 ?auto_104316 ) ) ( not ( = ?auto_104313 ?auto_104316 ) ) ( not ( = ?auto_104314 ?auto_104316 ) ) ( not ( = ?auto_104315 ?auto_104316 ) ) ( not ( = ?auto_104317 ?auto_104316 ) ) ( ON ?auto_104316 ?auto_104317 ) ( CLEAR ?auto_104316 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_104310 ?auto_104311 ?auto_104312 ?auto_104313 ?auto_104314 ?auto_104315 ?auto_104317 )
      ( MAKE-6PILE ?auto_104310 ?auto_104311 ?auto_104312 ?auto_104313 ?auto_104314 ?auto_104315 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_104320 - BLOCK
      ?auto_104321 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_104321 ) ( CLEAR ?auto_104320 ) ( ON-TABLE ?auto_104320 ) ( not ( = ?auto_104320 ?auto_104321 ) ) )
    :subtasks
    ( ( !STACK ?auto_104321 ?auto_104320 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_104322 - BLOCK
      ?auto_104323 - BLOCK
    )
    :vars
    (
      ?auto_104324 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_104322 ) ( ON-TABLE ?auto_104322 ) ( not ( = ?auto_104322 ?auto_104323 ) ) ( ON ?auto_104323 ?auto_104324 ) ( CLEAR ?auto_104323 ) ( HAND-EMPTY ) ( not ( = ?auto_104322 ?auto_104324 ) ) ( not ( = ?auto_104323 ?auto_104324 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_104323 ?auto_104324 )
      ( MAKE-2PILE ?auto_104322 ?auto_104323 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_104325 - BLOCK
      ?auto_104326 - BLOCK
    )
    :vars
    (
      ?auto_104327 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_104325 ?auto_104326 ) ) ( ON ?auto_104326 ?auto_104327 ) ( CLEAR ?auto_104326 ) ( not ( = ?auto_104325 ?auto_104327 ) ) ( not ( = ?auto_104326 ?auto_104327 ) ) ( HOLDING ?auto_104325 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_104325 )
      ( MAKE-2PILE ?auto_104325 ?auto_104326 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_104328 - BLOCK
      ?auto_104329 - BLOCK
    )
    :vars
    (
      ?auto_104330 - BLOCK
      ?auto_104333 - BLOCK
      ?auto_104334 - BLOCK
      ?auto_104335 - BLOCK
      ?auto_104331 - BLOCK
      ?auto_104332 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_104328 ?auto_104329 ) ) ( ON ?auto_104329 ?auto_104330 ) ( not ( = ?auto_104328 ?auto_104330 ) ) ( not ( = ?auto_104329 ?auto_104330 ) ) ( ON ?auto_104328 ?auto_104329 ) ( CLEAR ?auto_104328 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_104333 ) ( ON ?auto_104334 ?auto_104333 ) ( ON ?auto_104335 ?auto_104334 ) ( ON ?auto_104331 ?auto_104335 ) ( ON ?auto_104332 ?auto_104331 ) ( ON ?auto_104330 ?auto_104332 ) ( not ( = ?auto_104333 ?auto_104334 ) ) ( not ( = ?auto_104333 ?auto_104335 ) ) ( not ( = ?auto_104333 ?auto_104331 ) ) ( not ( = ?auto_104333 ?auto_104332 ) ) ( not ( = ?auto_104333 ?auto_104330 ) ) ( not ( = ?auto_104333 ?auto_104329 ) ) ( not ( = ?auto_104333 ?auto_104328 ) ) ( not ( = ?auto_104334 ?auto_104335 ) ) ( not ( = ?auto_104334 ?auto_104331 ) ) ( not ( = ?auto_104334 ?auto_104332 ) ) ( not ( = ?auto_104334 ?auto_104330 ) ) ( not ( = ?auto_104334 ?auto_104329 ) ) ( not ( = ?auto_104334 ?auto_104328 ) ) ( not ( = ?auto_104335 ?auto_104331 ) ) ( not ( = ?auto_104335 ?auto_104332 ) ) ( not ( = ?auto_104335 ?auto_104330 ) ) ( not ( = ?auto_104335 ?auto_104329 ) ) ( not ( = ?auto_104335 ?auto_104328 ) ) ( not ( = ?auto_104331 ?auto_104332 ) ) ( not ( = ?auto_104331 ?auto_104330 ) ) ( not ( = ?auto_104331 ?auto_104329 ) ) ( not ( = ?auto_104331 ?auto_104328 ) ) ( not ( = ?auto_104332 ?auto_104330 ) ) ( not ( = ?auto_104332 ?auto_104329 ) ) ( not ( = ?auto_104332 ?auto_104328 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_104333 ?auto_104334 ?auto_104335 ?auto_104331 ?auto_104332 ?auto_104330 ?auto_104329 )
      ( MAKE-2PILE ?auto_104328 ?auto_104329 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_104341 - BLOCK
      ?auto_104342 - BLOCK
      ?auto_104343 - BLOCK
      ?auto_104344 - BLOCK
      ?auto_104345 - BLOCK
    )
    :vars
    (
      ?auto_104346 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104346 ?auto_104345 ) ( CLEAR ?auto_104346 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_104341 ) ( ON ?auto_104342 ?auto_104341 ) ( ON ?auto_104343 ?auto_104342 ) ( ON ?auto_104344 ?auto_104343 ) ( ON ?auto_104345 ?auto_104344 ) ( not ( = ?auto_104341 ?auto_104342 ) ) ( not ( = ?auto_104341 ?auto_104343 ) ) ( not ( = ?auto_104341 ?auto_104344 ) ) ( not ( = ?auto_104341 ?auto_104345 ) ) ( not ( = ?auto_104341 ?auto_104346 ) ) ( not ( = ?auto_104342 ?auto_104343 ) ) ( not ( = ?auto_104342 ?auto_104344 ) ) ( not ( = ?auto_104342 ?auto_104345 ) ) ( not ( = ?auto_104342 ?auto_104346 ) ) ( not ( = ?auto_104343 ?auto_104344 ) ) ( not ( = ?auto_104343 ?auto_104345 ) ) ( not ( = ?auto_104343 ?auto_104346 ) ) ( not ( = ?auto_104344 ?auto_104345 ) ) ( not ( = ?auto_104344 ?auto_104346 ) ) ( not ( = ?auto_104345 ?auto_104346 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_104346 ?auto_104345 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_104347 - BLOCK
      ?auto_104348 - BLOCK
      ?auto_104349 - BLOCK
      ?auto_104350 - BLOCK
      ?auto_104351 - BLOCK
    )
    :vars
    (
      ?auto_104352 - BLOCK
      ?auto_104353 - BLOCK
      ?auto_104354 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104352 ?auto_104351 ) ( CLEAR ?auto_104352 ) ( ON-TABLE ?auto_104347 ) ( ON ?auto_104348 ?auto_104347 ) ( ON ?auto_104349 ?auto_104348 ) ( ON ?auto_104350 ?auto_104349 ) ( ON ?auto_104351 ?auto_104350 ) ( not ( = ?auto_104347 ?auto_104348 ) ) ( not ( = ?auto_104347 ?auto_104349 ) ) ( not ( = ?auto_104347 ?auto_104350 ) ) ( not ( = ?auto_104347 ?auto_104351 ) ) ( not ( = ?auto_104347 ?auto_104352 ) ) ( not ( = ?auto_104348 ?auto_104349 ) ) ( not ( = ?auto_104348 ?auto_104350 ) ) ( not ( = ?auto_104348 ?auto_104351 ) ) ( not ( = ?auto_104348 ?auto_104352 ) ) ( not ( = ?auto_104349 ?auto_104350 ) ) ( not ( = ?auto_104349 ?auto_104351 ) ) ( not ( = ?auto_104349 ?auto_104352 ) ) ( not ( = ?auto_104350 ?auto_104351 ) ) ( not ( = ?auto_104350 ?auto_104352 ) ) ( not ( = ?auto_104351 ?auto_104352 ) ) ( HOLDING ?auto_104353 ) ( CLEAR ?auto_104354 ) ( not ( = ?auto_104347 ?auto_104353 ) ) ( not ( = ?auto_104347 ?auto_104354 ) ) ( not ( = ?auto_104348 ?auto_104353 ) ) ( not ( = ?auto_104348 ?auto_104354 ) ) ( not ( = ?auto_104349 ?auto_104353 ) ) ( not ( = ?auto_104349 ?auto_104354 ) ) ( not ( = ?auto_104350 ?auto_104353 ) ) ( not ( = ?auto_104350 ?auto_104354 ) ) ( not ( = ?auto_104351 ?auto_104353 ) ) ( not ( = ?auto_104351 ?auto_104354 ) ) ( not ( = ?auto_104352 ?auto_104353 ) ) ( not ( = ?auto_104352 ?auto_104354 ) ) ( not ( = ?auto_104353 ?auto_104354 ) ) )
    :subtasks
    ( ( !STACK ?auto_104353 ?auto_104354 )
      ( MAKE-5PILE ?auto_104347 ?auto_104348 ?auto_104349 ?auto_104350 ?auto_104351 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_105273 - BLOCK
      ?auto_105274 - BLOCK
      ?auto_105275 - BLOCK
      ?auto_105276 - BLOCK
      ?auto_105277 - BLOCK
    )
    :vars
    (
      ?auto_105279 - BLOCK
      ?auto_105278 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105279 ?auto_105277 ) ( ON-TABLE ?auto_105273 ) ( ON ?auto_105274 ?auto_105273 ) ( ON ?auto_105275 ?auto_105274 ) ( ON ?auto_105276 ?auto_105275 ) ( ON ?auto_105277 ?auto_105276 ) ( not ( = ?auto_105273 ?auto_105274 ) ) ( not ( = ?auto_105273 ?auto_105275 ) ) ( not ( = ?auto_105273 ?auto_105276 ) ) ( not ( = ?auto_105273 ?auto_105277 ) ) ( not ( = ?auto_105273 ?auto_105279 ) ) ( not ( = ?auto_105274 ?auto_105275 ) ) ( not ( = ?auto_105274 ?auto_105276 ) ) ( not ( = ?auto_105274 ?auto_105277 ) ) ( not ( = ?auto_105274 ?auto_105279 ) ) ( not ( = ?auto_105275 ?auto_105276 ) ) ( not ( = ?auto_105275 ?auto_105277 ) ) ( not ( = ?auto_105275 ?auto_105279 ) ) ( not ( = ?auto_105276 ?auto_105277 ) ) ( not ( = ?auto_105276 ?auto_105279 ) ) ( not ( = ?auto_105277 ?auto_105279 ) ) ( not ( = ?auto_105273 ?auto_105278 ) ) ( not ( = ?auto_105274 ?auto_105278 ) ) ( not ( = ?auto_105275 ?auto_105278 ) ) ( not ( = ?auto_105276 ?auto_105278 ) ) ( not ( = ?auto_105277 ?auto_105278 ) ) ( not ( = ?auto_105279 ?auto_105278 ) ) ( ON ?auto_105278 ?auto_105279 ) ( CLEAR ?auto_105278 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_105273 ?auto_105274 ?auto_105275 ?auto_105276 ?auto_105277 ?auto_105279 )
      ( MAKE-5PILE ?auto_105273 ?auto_105274 ?auto_105275 ?auto_105276 ?auto_105277 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_104363 - BLOCK
      ?auto_104364 - BLOCK
      ?auto_104365 - BLOCK
      ?auto_104366 - BLOCK
      ?auto_104367 - BLOCK
    )
    :vars
    (
      ?auto_104370 - BLOCK
      ?auto_104369 - BLOCK
      ?auto_104368 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104370 ?auto_104367 ) ( ON-TABLE ?auto_104363 ) ( ON ?auto_104364 ?auto_104363 ) ( ON ?auto_104365 ?auto_104364 ) ( ON ?auto_104366 ?auto_104365 ) ( ON ?auto_104367 ?auto_104366 ) ( not ( = ?auto_104363 ?auto_104364 ) ) ( not ( = ?auto_104363 ?auto_104365 ) ) ( not ( = ?auto_104363 ?auto_104366 ) ) ( not ( = ?auto_104363 ?auto_104367 ) ) ( not ( = ?auto_104363 ?auto_104370 ) ) ( not ( = ?auto_104364 ?auto_104365 ) ) ( not ( = ?auto_104364 ?auto_104366 ) ) ( not ( = ?auto_104364 ?auto_104367 ) ) ( not ( = ?auto_104364 ?auto_104370 ) ) ( not ( = ?auto_104365 ?auto_104366 ) ) ( not ( = ?auto_104365 ?auto_104367 ) ) ( not ( = ?auto_104365 ?auto_104370 ) ) ( not ( = ?auto_104366 ?auto_104367 ) ) ( not ( = ?auto_104366 ?auto_104370 ) ) ( not ( = ?auto_104367 ?auto_104370 ) ) ( not ( = ?auto_104363 ?auto_104369 ) ) ( not ( = ?auto_104363 ?auto_104368 ) ) ( not ( = ?auto_104364 ?auto_104369 ) ) ( not ( = ?auto_104364 ?auto_104368 ) ) ( not ( = ?auto_104365 ?auto_104369 ) ) ( not ( = ?auto_104365 ?auto_104368 ) ) ( not ( = ?auto_104366 ?auto_104369 ) ) ( not ( = ?auto_104366 ?auto_104368 ) ) ( not ( = ?auto_104367 ?auto_104369 ) ) ( not ( = ?auto_104367 ?auto_104368 ) ) ( not ( = ?auto_104370 ?auto_104369 ) ) ( not ( = ?auto_104370 ?auto_104368 ) ) ( not ( = ?auto_104369 ?auto_104368 ) ) ( ON ?auto_104369 ?auto_104370 ) ( CLEAR ?auto_104369 ) ( HOLDING ?auto_104368 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_104368 )
      ( MAKE-5PILE ?auto_104363 ?auto_104364 ?auto_104365 ?auto_104366 ?auto_104367 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_104371 - BLOCK
      ?auto_104372 - BLOCK
      ?auto_104373 - BLOCK
      ?auto_104374 - BLOCK
      ?auto_104375 - BLOCK
    )
    :vars
    (
      ?auto_104377 - BLOCK
      ?auto_104378 - BLOCK
      ?auto_104376 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104377 ?auto_104375 ) ( ON-TABLE ?auto_104371 ) ( ON ?auto_104372 ?auto_104371 ) ( ON ?auto_104373 ?auto_104372 ) ( ON ?auto_104374 ?auto_104373 ) ( ON ?auto_104375 ?auto_104374 ) ( not ( = ?auto_104371 ?auto_104372 ) ) ( not ( = ?auto_104371 ?auto_104373 ) ) ( not ( = ?auto_104371 ?auto_104374 ) ) ( not ( = ?auto_104371 ?auto_104375 ) ) ( not ( = ?auto_104371 ?auto_104377 ) ) ( not ( = ?auto_104372 ?auto_104373 ) ) ( not ( = ?auto_104372 ?auto_104374 ) ) ( not ( = ?auto_104372 ?auto_104375 ) ) ( not ( = ?auto_104372 ?auto_104377 ) ) ( not ( = ?auto_104373 ?auto_104374 ) ) ( not ( = ?auto_104373 ?auto_104375 ) ) ( not ( = ?auto_104373 ?auto_104377 ) ) ( not ( = ?auto_104374 ?auto_104375 ) ) ( not ( = ?auto_104374 ?auto_104377 ) ) ( not ( = ?auto_104375 ?auto_104377 ) ) ( not ( = ?auto_104371 ?auto_104378 ) ) ( not ( = ?auto_104371 ?auto_104376 ) ) ( not ( = ?auto_104372 ?auto_104378 ) ) ( not ( = ?auto_104372 ?auto_104376 ) ) ( not ( = ?auto_104373 ?auto_104378 ) ) ( not ( = ?auto_104373 ?auto_104376 ) ) ( not ( = ?auto_104374 ?auto_104378 ) ) ( not ( = ?auto_104374 ?auto_104376 ) ) ( not ( = ?auto_104375 ?auto_104378 ) ) ( not ( = ?auto_104375 ?auto_104376 ) ) ( not ( = ?auto_104377 ?auto_104378 ) ) ( not ( = ?auto_104377 ?auto_104376 ) ) ( not ( = ?auto_104378 ?auto_104376 ) ) ( ON ?auto_104378 ?auto_104377 ) ( ON ?auto_104376 ?auto_104378 ) ( CLEAR ?auto_104376 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_104371 ?auto_104372 ?auto_104373 ?auto_104374 ?auto_104375 ?auto_104377 ?auto_104378 )
      ( MAKE-5PILE ?auto_104371 ?auto_104372 ?auto_104373 ?auto_104374 ?auto_104375 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_104382 - BLOCK
      ?auto_104383 - BLOCK
      ?auto_104384 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_104384 ) ( CLEAR ?auto_104383 ) ( ON-TABLE ?auto_104382 ) ( ON ?auto_104383 ?auto_104382 ) ( not ( = ?auto_104382 ?auto_104383 ) ) ( not ( = ?auto_104382 ?auto_104384 ) ) ( not ( = ?auto_104383 ?auto_104384 ) ) )
    :subtasks
    ( ( !STACK ?auto_104384 ?auto_104383 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_104385 - BLOCK
      ?auto_104386 - BLOCK
      ?auto_104387 - BLOCK
    )
    :vars
    (
      ?auto_104388 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_104386 ) ( ON-TABLE ?auto_104385 ) ( ON ?auto_104386 ?auto_104385 ) ( not ( = ?auto_104385 ?auto_104386 ) ) ( not ( = ?auto_104385 ?auto_104387 ) ) ( not ( = ?auto_104386 ?auto_104387 ) ) ( ON ?auto_104387 ?auto_104388 ) ( CLEAR ?auto_104387 ) ( HAND-EMPTY ) ( not ( = ?auto_104385 ?auto_104388 ) ) ( not ( = ?auto_104386 ?auto_104388 ) ) ( not ( = ?auto_104387 ?auto_104388 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_104387 ?auto_104388 )
      ( MAKE-3PILE ?auto_104385 ?auto_104386 ?auto_104387 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_104389 - BLOCK
      ?auto_104390 - BLOCK
      ?auto_104391 - BLOCK
    )
    :vars
    (
      ?auto_104392 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_104389 ) ( not ( = ?auto_104389 ?auto_104390 ) ) ( not ( = ?auto_104389 ?auto_104391 ) ) ( not ( = ?auto_104390 ?auto_104391 ) ) ( ON ?auto_104391 ?auto_104392 ) ( CLEAR ?auto_104391 ) ( not ( = ?auto_104389 ?auto_104392 ) ) ( not ( = ?auto_104390 ?auto_104392 ) ) ( not ( = ?auto_104391 ?auto_104392 ) ) ( HOLDING ?auto_104390 ) ( CLEAR ?auto_104389 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_104389 ?auto_104390 )
      ( MAKE-3PILE ?auto_104389 ?auto_104390 ?auto_104391 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_104393 - BLOCK
      ?auto_104394 - BLOCK
      ?auto_104395 - BLOCK
    )
    :vars
    (
      ?auto_104396 - BLOCK
      ?auto_104400 - BLOCK
      ?auto_104397 - BLOCK
      ?auto_104399 - BLOCK
      ?auto_104398 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_104393 ) ( not ( = ?auto_104393 ?auto_104394 ) ) ( not ( = ?auto_104393 ?auto_104395 ) ) ( not ( = ?auto_104394 ?auto_104395 ) ) ( ON ?auto_104395 ?auto_104396 ) ( not ( = ?auto_104393 ?auto_104396 ) ) ( not ( = ?auto_104394 ?auto_104396 ) ) ( not ( = ?auto_104395 ?auto_104396 ) ) ( CLEAR ?auto_104393 ) ( ON ?auto_104394 ?auto_104395 ) ( CLEAR ?auto_104394 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_104400 ) ( ON ?auto_104397 ?auto_104400 ) ( ON ?auto_104399 ?auto_104397 ) ( ON ?auto_104398 ?auto_104399 ) ( ON ?auto_104396 ?auto_104398 ) ( not ( = ?auto_104400 ?auto_104397 ) ) ( not ( = ?auto_104400 ?auto_104399 ) ) ( not ( = ?auto_104400 ?auto_104398 ) ) ( not ( = ?auto_104400 ?auto_104396 ) ) ( not ( = ?auto_104400 ?auto_104395 ) ) ( not ( = ?auto_104400 ?auto_104394 ) ) ( not ( = ?auto_104397 ?auto_104399 ) ) ( not ( = ?auto_104397 ?auto_104398 ) ) ( not ( = ?auto_104397 ?auto_104396 ) ) ( not ( = ?auto_104397 ?auto_104395 ) ) ( not ( = ?auto_104397 ?auto_104394 ) ) ( not ( = ?auto_104399 ?auto_104398 ) ) ( not ( = ?auto_104399 ?auto_104396 ) ) ( not ( = ?auto_104399 ?auto_104395 ) ) ( not ( = ?auto_104399 ?auto_104394 ) ) ( not ( = ?auto_104398 ?auto_104396 ) ) ( not ( = ?auto_104398 ?auto_104395 ) ) ( not ( = ?auto_104398 ?auto_104394 ) ) ( not ( = ?auto_104393 ?auto_104400 ) ) ( not ( = ?auto_104393 ?auto_104397 ) ) ( not ( = ?auto_104393 ?auto_104399 ) ) ( not ( = ?auto_104393 ?auto_104398 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_104400 ?auto_104397 ?auto_104399 ?auto_104398 ?auto_104396 ?auto_104395 )
      ( MAKE-3PILE ?auto_104393 ?auto_104394 ?auto_104395 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_104401 - BLOCK
      ?auto_104402 - BLOCK
      ?auto_104403 - BLOCK
    )
    :vars
    (
      ?auto_104406 - BLOCK
      ?auto_104405 - BLOCK
      ?auto_104407 - BLOCK
      ?auto_104408 - BLOCK
      ?auto_104404 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_104401 ?auto_104402 ) ) ( not ( = ?auto_104401 ?auto_104403 ) ) ( not ( = ?auto_104402 ?auto_104403 ) ) ( ON ?auto_104403 ?auto_104406 ) ( not ( = ?auto_104401 ?auto_104406 ) ) ( not ( = ?auto_104402 ?auto_104406 ) ) ( not ( = ?auto_104403 ?auto_104406 ) ) ( ON ?auto_104402 ?auto_104403 ) ( CLEAR ?auto_104402 ) ( ON-TABLE ?auto_104405 ) ( ON ?auto_104407 ?auto_104405 ) ( ON ?auto_104408 ?auto_104407 ) ( ON ?auto_104404 ?auto_104408 ) ( ON ?auto_104406 ?auto_104404 ) ( not ( = ?auto_104405 ?auto_104407 ) ) ( not ( = ?auto_104405 ?auto_104408 ) ) ( not ( = ?auto_104405 ?auto_104404 ) ) ( not ( = ?auto_104405 ?auto_104406 ) ) ( not ( = ?auto_104405 ?auto_104403 ) ) ( not ( = ?auto_104405 ?auto_104402 ) ) ( not ( = ?auto_104407 ?auto_104408 ) ) ( not ( = ?auto_104407 ?auto_104404 ) ) ( not ( = ?auto_104407 ?auto_104406 ) ) ( not ( = ?auto_104407 ?auto_104403 ) ) ( not ( = ?auto_104407 ?auto_104402 ) ) ( not ( = ?auto_104408 ?auto_104404 ) ) ( not ( = ?auto_104408 ?auto_104406 ) ) ( not ( = ?auto_104408 ?auto_104403 ) ) ( not ( = ?auto_104408 ?auto_104402 ) ) ( not ( = ?auto_104404 ?auto_104406 ) ) ( not ( = ?auto_104404 ?auto_104403 ) ) ( not ( = ?auto_104404 ?auto_104402 ) ) ( not ( = ?auto_104401 ?auto_104405 ) ) ( not ( = ?auto_104401 ?auto_104407 ) ) ( not ( = ?auto_104401 ?auto_104408 ) ) ( not ( = ?auto_104401 ?auto_104404 ) ) ( HOLDING ?auto_104401 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_104401 )
      ( MAKE-3PILE ?auto_104401 ?auto_104402 ?auto_104403 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_104409 - BLOCK
      ?auto_104410 - BLOCK
      ?auto_104411 - BLOCK
    )
    :vars
    (
      ?auto_104414 - BLOCK
      ?auto_104412 - BLOCK
      ?auto_104415 - BLOCK
      ?auto_104413 - BLOCK
      ?auto_104416 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_104409 ?auto_104410 ) ) ( not ( = ?auto_104409 ?auto_104411 ) ) ( not ( = ?auto_104410 ?auto_104411 ) ) ( ON ?auto_104411 ?auto_104414 ) ( not ( = ?auto_104409 ?auto_104414 ) ) ( not ( = ?auto_104410 ?auto_104414 ) ) ( not ( = ?auto_104411 ?auto_104414 ) ) ( ON ?auto_104410 ?auto_104411 ) ( ON-TABLE ?auto_104412 ) ( ON ?auto_104415 ?auto_104412 ) ( ON ?auto_104413 ?auto_104415 ) ( ON ?auto_104416 ?auto_104413 ) ( ON ?auto_104414 ?auto_104416 ) ( not ( = ?auto_104412 ?auto_104415 ) ) ( not ( = ?auto_104412 ?auto_104413 ) ) ( not ( = ?auto_104412 ?auto_104416 ) ) ( not ( = ?auto_104412 ?auto_104414 ) ) ( not ( = ?auto_104412 ?auto_104411 ) ) ( not ( = ?auto_104412 ?auto_104410 ) ) ( not ( = ?auto_104415 ?auto_104413 ) ) ( not ( = ?auto_104415 ?auto_104416 ) ) ( not ( = ?auto_104415 ?auto_104414 ) ) ( not ( = ?auto_104415 ?auto_104411 ) ) ( not ( = ?auto_104415 ?auto_104410 ) ) ( not ( = ?auto_104413 ?auto_104416 ) ) ( not ( = ?auto_104413 ?auto_104414 ) ) ( not ( = ?auto_104413 ?auto_104411 ) ) ( not ( = ?auto_104413 ?auto_104410 ) ) ( not ( = ?auto_104416 ?auto_104414 ) ) ( not ( = ?auto_104416 ?auto_104411 ) ) ( not ( = ?auto_104416 ?auto_104410 ) ) ( not ( = ?auto_104409 ?auto_104412 ) ) ( not ( = ?auto_104409 ?auto_104415 ) ) ( not ( = ?auto_104409 ?auto_104413 ) ) ( not ( = ?auto_104409 ?auto_104416 ) ) ( ON ?auto_104409 ?auto_104410 ) ( CLEAR ?auto_104409 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_104412 ?auto_104415 ?auto_104413 ?auto_104416 ?auto_104414 ?auto_104411 ?auto_104410 )
      ( MAKE-3PILE ?auto_104409 ?auto_104410 ?auto_104411 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_104421 - BLOCK
      ?auto_104422 - BLOCK
      ?auto_104423 - BLOCK
      ?auto_104424 - BLOCK
    )
    :vars
    (
      ?auto_104425 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104425 ?auto_104424 ) ( CLEAR ?auto_104425 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_104421 ) ( ON ?auto_104422 ?auto_104421 ) ( ON ?auto_104423 ?auto_104422 ) ( ON ?auto_104424 ?auto_104423 ) ( not ( = ?auto_104421 ?auto_104422 ) ) ( not ( = ?auto_104421 ?auto_104423 ) ) ( not ( = ?auto_104421 ?auto_104424 ) ) ( not ( = ?auto_104421 ?auto_104425 ) ) ( not ( = ?auto_104422 ?auto_104423 ) ) ( not ( = ?auto_104422 ?auto_104424 ) ) ( not ( = ?auto_104422 ?auto_104425 ) ) ( not ( = ?auto_104423 ?auto_104424 ) ) ( not ( = ?auto_104423 ?auto_104425 ) ) ( not ( = ?auto_104424 ?auto_104425 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_104425 ?auto_104424 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_104426 - BLOCK
      ?auto_104427 - BLOCK
      ?auto_104428 - BLOCK
      ?auto_104429 - BLOCK
    )
    :vars
    (
      ?auto_104430 - BLOCK
      ?auto_104431 - BLOCK
      ?auto_104432 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104430 ?auto_104429 ) ( CLEAR ?auto_104430 ) ( ON-TABLE ?auto_104426 ) ( ON ?auto_104427 ?auto_104426 ) ( ON ?auto_104428 ?auto_104427 ) ( ON ?auto_104429 ?auto_104428 ) ( not ( = ?auto_104426 ?auto_104427 ) ) ( not ( = ?auto_104426 ?auto_104428 ) ) ( not ( = ?auto_104426 ?auto_104429 ) ) ( not ( = ?auto_104426 ?auto_104430 ) ) ( not ( = ?auto_104427 ?auto_104428 ) ) ( not ( = ?auto_104427 ?auto_104429 ) ) ( not ( = ?auto_104427 ?auto_104430 ) ) ( not ( = ?auto_104428 ?auto_104429 ) ) ( not ( = ?auto_104428 ?auto_104430 ) ) ( not ( = ?auto_104429 ?auto_104430 ) ) ( HOLDING ?auto_104431 ) ( CLEAR ?auto_104432 ) ( not ( = ?auto_104426 ?auto_104431 ) ) ( not ( = ?auto_104426 ?auto_104432 ) ) ( not ( = ?auto_104427 ?auto_104431 ) ) ( not ( = ?auto_104427 ?auto_104432 ) ) ( not ( = ?auto_104428 ?auto_104431 ) ) ( not ( = ?auto_104428 ?auto_104432 ) ) ( not ( = ?auto_104429 ?auto_104431 ) ) ( not ( = ?auto_104429 ?auto_104432 ) ) ( not ( = ?auto_104430 ?auto_104431 ) ) ( not ( = ?auto_104430 ?auto_104432 ) ) ( not ( = ?auto_104431 ?auto_104432 ) ) )
    :subtasks
    ( ( !STACK ?auto_104431 ?auto_104432 )
      ( MAKE-4PILE ?auto_104426 ?auto_104427 ?auto_104428 ?auto_104429 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_104433 - BLOCK
      ?auto_104434 - BLOCK
      ?auto_104435 - BLOCK
      ?auto_104436 - BLOCK
    )
    :vars
    (
      ?auto_104437 - BLOCK
      ?auto_104438 - BLOCK
      ?auto_104439 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104437 ?auto_104436 ) ( ON-TABLE ?auto_104433 ) ( ON ?auto_104434 ?auto_104433 ) ( ON ?auto_104435 ?auto_104434 ) ( ON ?auto_104436 ?auto_104435 ) ( not ( = ?auto_104433 ?auto_104434 ) ) ( not ( = ?auto_104433 ?auto_104435 ) ) ( not ( = ?auto_104433 ?auto_104436 ) ) ( not ( = ?auto_104433 ?auto_104437 ) ) ( not ( = ?auto_104434 ?auto_104435 ) ) ( not ( = ?auto_104434 ?auto_104436 ) ) ( not ( = ?auto_104434 ?auto_104437 ) ) ( not ( = ?auto_104435 ?auto_104436 ) ) ( not ( = ?auto_104435 ?auto_104437 ) ) ( not ( = ?auto_104436 ?auto_104437 ) ) ( CLEAR ?auto_104438 ) ( not ( = ?auto_104433 ?auto_104439 ) ) ( not ( = ?auto_104433 ?auto_104438 ) ) ( not ( = ?auto_104434 ?auto_104439 ) ) ( not ( = ?auto_104434 ?auto_104438 ) ) ( not ( = ?auto_104435 ?auto_104439 ) ) ( not ( = ?auto_104435 ?auto_104438 ) ) ( not ( = ?auto_104436 ?auto_104439 ) ) ( not ( = ?auto_104436 ?auto_104438 ) ) ( not ( = ?auto_104437 ?auto_104439 ) ) ( not ( = ?auto_104437 ?auto_104438 ) ) ( not ( = ?auto_104439 ?auto_104438 ) ) ( ON ?auto_104439 ?auto_104437 ) ( CLEAR ?auto_104439 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_104433 ?auto_104434 ?auto_104435 ?auto_104436 ?auto_104437 )
      ( MAKE-4PILE ?auto_104433 ?auto_104434 ?auto_104435 ?auto_104436 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_104440 - BLOCK
      ?auto_104441 - BLOCK
      ?auto_104442 - BLOCK
      ?auto_104443 - BLOCK
    )
    :vars
    (
      ?auto_104444 - BLOCK
      ?auto_104446 - BLOCK
      ?auto_104445 - BLOCK
      ?auto_104447 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104444 ?auto_104443 ) ( ON-TABLE ?auto_104440 ) ( ON ?auto_104441 ?auto_104440 ) ( ON ?auto_104442 ?auto_104441 ) ( ON ?auto_104443 ?auto_104442 ) ( not ( = ?auto_104440 ?auto_104441 ) ) ( not ( = ?auto_104440 ?auto_104442 ) ) ( not ( = ?auto_104440 ?auto_104443 ) ) ( not ( = ?auto_104440 ?auto_104444 ) ) ( not ( = ?auto_104441 ?auto_104442 ) ) ( not ( = ?auto_104441 ?auto_104443 ) ) ( not ( = ?auto_104441 ?auto_104444 ) ) ( not ( = ?auto_104442 ?auto_104443 ) ) ( not ( = ?auto_104442 ?auto_104444 ) ) ( not ( = ?auto_104443 ?auto_104444 ) ) ( not ( = ?auto_104440 ?auto_104446 ) ) ( not ( = ?auto_104440 ?auto_104445 ) ) ( not ( = ?auto_104441 ?auto_104446 ) ) ( not ( = ?auto_104441 ?auto_104445 ) ) ( not ( = ?auto_104442 ?auto_104446 ) ) ( not ( = ?auto_104442 ?auto_104445 ) ) ( not ( = ?auto_104443 ?auto_104446 ) ) ( not ( = ?auto_104443 ?auto_104445 ) ) ( not ( = ?auto_104444 ?auto_104446 ) ) ( not ( = ?auto_104444 ?auto_104445 ) ) ( not ( = ?auto_104446 ?auto_104445 ) ) ( ON ?auto_104446 ?auto_104444 ) ( CLEAR ?auto_104446 ) ( HOLDING ?auto_104445 ) ( CLEAR ?auto_104447 ) ( ON-TABLE ?auto_104447 ) ( not ( = ?auto_104447 ?auto_104445 ) ) ( not ( = ?auto_104440 ?auto_104447 ) ) ( not ( = ?auto_104441 ?auto_104447 ) ) ( not ( = ?auto_104442 ?auto_104447 ) ) ( not ( = ?auto_104443 ?auto_104447 ) ) ( not ( = ?auto_104444 ?auto_104447 ) ) ( not ( = ?auto_104446 ?auto_104447 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_104447 ?auto_104445 )
      ( MAKE-4PILE ?auto_104440 ?auto_104441 ?auto_104442 ?auto_104443 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_105502 - BLOCK
      ?auto_105503 - BLOCK
      ?auto_105504 - BLOCK
      ?auto_105505 - BLOCK
    )
    :vars
    (
      ?auto_105508 - BLOCK
      ?auto_105506 - BLOCK
      ?auto_105507 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105508 ?auto_105505 ) ( ON-TABLE ?auto_105502 ) ( ON ?auto_105503 ?auto_105502 ) ( ON ?auto_105504 ?auto_105503 ) ( ON ?auto_105505 ?auto_105504 ) ( not ( = ?auto_105502 ?auto_105503 ) ) ( not ( = ?auto_105502 ?auto_105504 ) ) ( not ( = ?auto_105502 ?auto_105505 ) ) ( not ( = ?auto_105502 ?auto_105508 ) ) ( not ( = ?auto_105503 ?auto_105504 ) ) ( not ( = ?auto_105503 ?auto_105505 ) ) ( not ( = ?auto_105503 ?auto_105508 ) ) ( not ( = ?auto_105504 ?auto_105505 ) ) ( not ( = ?auto_105504 ?auto_105508 ) ) ( not ( = ?auto_105505 ?auto_105508 ) ) ( not ( = ?auto_105502 ?auto_105506 ) ) ( not ( = ?auto_105502 ?auto_105507 ) ) ( not ( = ?auto_105503 ?auto_105506 ) ) ( not ( = ?auto_105503 ?auto_105507 ) ) ( not ( = ?auto_105504 ?auto_105506 ) ) ( not ( = ?auto_105504 ?auto_105507 ) ) ( not ( = ?auto_105505 ?auto_105506 ) ) ( not ( = ?auto_105505 ?auto_105507 ) ) ( not ( = ?auto_105508 ?auto_105506 ) ) ( not ( = ?auto_105508 ?auto_105507 ) ) ( not ( = ?auto_105506 ?auto_105507 ) ) ( ON ?auto_105506 ?auto_105508 ) ( ON ?auto_105507 ?auto_105506 ) ( CLEAR ?auto_105507 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_105502 ?auto_105503 ?auto_105504 ?auto_105505 ?auto_105508 ?auto_105506 )
      ( MAKE-4PILE ?auto_105502 ?auto_105503 ?auto_105504 ?auto_105505 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_104456 - BLOCK
      ?auto_104457 - BLOCK
      ?auto_104458 - BLOCK
      ?auto_104459 - BLOCK
    )
    :vars
    (
      ?auto_104463 - BLOCK
      ?auto_104460 - BLOCK
      ?auto_104461 - BLOCK
      ?auto_104462 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104463 ?auto_104459 ) ( ON-TABLE ?auto_104456 ) ( ON ?auto_104457 ?auto_104456 ) ( ON ?auto_104458 ?auto_104457 ) ( ON ?auto_104459 ?auto_104458 ) ( not ( = ?auto_104456 ?auto_104457 ) ) ( not ( = ?auto_104456 ?auto_104458 ) ) ( not ( = ?auto_104456 ?auto_104459 ) ) ( not ( = ?auto_104456 ?auto_104463 ) ) ( not ( = ?auto_104457 ?auto_104458 ) ) ( not ( = ?auto_104457 ?auto_104459 ) ) ( not ( = ?auto_104457 ?auto_104463 ) ) ( not ( = ?auto_104458 ?auto_104459 ) ) ( not ( = ?auto_104458 ?auto_104463 ) ) ( not ( = ?auto_104459 ?auto_104463 ) ) ( not ( = ?auto_104456 ?auto_104460 ) ) ( not ( = ?auto_104456 ?auto_104461 ) ) ( not ( = ?auto_104457 ?auto_104460 ) ) ( not ( = ?auto_104457 ?auto_104461 ) ) ( not ( = ?auto_104458 ?auto_104460 ) ) ( not ( = ?auto_104458 ?auto_104461 ) ) ( not ( = ?auto_104459 ?auto_104460 ) ) ( not ( = ?auto_104459 ?auto_104461 ) ) ( not ( = ?auto_104463 ?auto_104460 ) ) ( not ( = ?auto_104463 ?auto_104461 ) ) ( not ( = ?auto_104460 ?auto_104461 ) ) ( ON ?auto_104460 ?auto_104463 ) ( not ( = ?auto_104462 ?auto_104461 ) ) ( not ( = ?auto_104456 ?auto_104462 ) ) ( not ( = ?auto_104457 ?auto_104462 ) ) ( not ( = ?auto_104458 ?auto_104462 ) ) ( not ( = ?auto_104459 ?auto_104462 ) ) ( not ( = ?auto_104463 ?auto_104462 ) ) ( not ( = ?auto_104460 ?auto_104462 ) ) ( ON ?auto_104461 ?auto_104460 ) ( CLEAR ?auto_104461 ) ( HOLDING ?auto_104462 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_104462 )
      ( MAKE-4PILE ?auto_104456 ?auto_104457 ?auto_104458 ?auto_104459 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_104464 - BLOCK
      ?auto_104465 - BLOCK
      ?auto_104466 - BLOCK
      ?auto_104467 - BLOCK
    )
    :vars
    (
      ?auto_104468 - BLOCK
      ?auto_104471 - BLOCK
      ?auto_104470 - BLOCK
      ?auto_104469 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104468 ?auto_104467 ) ( ON-TABLE ?auto_104464 ) ( ON ?auto_104465 ?auto_104464 ) ( ON ?auto_104466 ?auto_104465 ) ( ON ?auto_104467 ?auto_104466 ) ( not ( = ?auto_104464 ?auto_104465 ) ) ( not ( = ?auto_104464 ?auto_104466 ) ) ( not ( = ?auto_104464 ?auto_104467 ) ) ( not ( = ?auto_104464 ?auto_104468 ) ) ( not ( = ?auto_104465 ?auto_104466 ) ) ( not ( = ?auto_104465 ?auto_104467 ) ) ( not ( = ?auto_104465 ?auto_104468 ) ) ( not ( = ?auto_104466 ?auto_104467 ) ) ( not ( = ?auto_104466 ?auto_104468 ) ) ( not ( = ?auto_104467 ?auto_104468 ) ) ( not ( = ?auto_104464 ?auto_104471 ) ) ( not ( = ?auto_104464 ?auto_104470 ) ) ( not ( = ?auto_104465 ?auto_104471 ) ) ( not ( = ?auto_104465 ?auto_104470 ) ) ( not ( = ?auto_104466 ?auto_104471 ) ) ( not ( = ?auto_104466 ?auto_104470 ) ) ( not ( = ?auto_104467 ?auto_104471 ) ) ( not ( = ?auto_104467 ?auto_104470 ) ) ( not ( = ?auto_104468 ?auto_104471 ) ) ( not ( = ?auto_104468 ?auto_104470 ) ) ( not ( = ?auto_104471 ?auto_104470 ) ) ( ON ?auto_104471 ?auto_104468 ) ( not ( = ?auto_104469 ?auto_104470 ) ) ( not ( = ?auto_104464 ?auto_104469 ) ) ( not ( = ?auto_104465 ?auto_104469 ) ) ( not ( = ?auto_104466 ?auto_104469 ) ) ( not ( = ?auto_104467 ?auto_104469 ) ) ( not ( = ?auto_104468 ?auto_104469 ) ) ( not ( = ?auto_104471 ?auto_104469 ) ) ( ON ?auto_104470 ?auto_104471 ) ( ON ?auto_104469 ?auto_104470 ) ( CLEAR ?auto_104469 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_104464 ?auto_104465 ?auto_104466 ?auto_104467 ?auto_104468 ?auto_104471 ?auto_104470 )
      ( MAKE-4PILE ?auto_104464 ?auto_104465 ?auto_104466 ?auto_104467 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_104476 - BLOCK
      ?auto_104477 - BLOCK
      ?auto_104478 - BLOCK
      ?auto_104479 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_104479 ) ( CLEAR ?auto_104478 ) ( ON-TABLE ?auto_104476 ) ( ON ?auto_104477 ?auto_104476 ) ( ON ?auto_104478 ?auto_104477 ) ( not ( = ?auto_104476 ?auto_104477 ) ) ( not ( = ?auto_104476 ?auto_104478 ) ) ( not ( = ?auto_104476 ?auto_104479 ) ) ( not ( = ?auto_104477 ?auto_104478 ) ) ( not ( = ?auto_104477 ?auto_104479 ) ) ( not ( = ?auto_104478 ?auto_104479 ) ) )
    :subtasks
    ( ( !STACK ?auto_104479 ?auto_104478 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_104480 - BLOCK
      ?auto_104481 - BLOCK
      ?auto_104482 - BLOCK
      ?auto_104483 - BLOCK
    )
    :vars
    (
      ?auto_104484 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_104482 ) ( ON-TABLE ?auto_104480 ) ( ON ?auto_104481 ?auto_104480 ) ( ON ?auto_104482 ?auto_104481 ) ( not ( = ?auto_104480 ?auto_104481 ) ) ( not ( = ?auto_104480 ?auto_104482 ) ) ( not ( = ?auto_104480 ?auto_104483 ) ) ( not ( = ?auto_104481 ?auto_104482 ) ) ( not ( = ?auto_104481 ?auto_104483 ) ) ( not ( = ?auto_104482 ?auto_104483 ) ) ( ON ?auto_104483 ?auto_104484 ) ( CLEAR ?auto_104483 ) ( HAND-EMPTY ) ( not ( = ?auto_104480 ?auto_104484 ) ) ( not ( = ?auto_104481 ?auto_104484 ) ) ( not ( = ?auto_104482 ?auto_104484 ) ) ( not ( = ?auto_104483 ?auto_104484 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_104483 ?auto_104484 )
      ( MAKE-4PILE ?auto_104480 ?auto_104481 ?auto_104482 ?auto_104483 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_104485 - BLOCK
      ?auto_104486 - BLOCK
      ?auto_104487 - BLOCK
      ?auto_104488 - BLOCK
    )
    :vars
    (
      ?auto_104489 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_104485 ) ( ON ?auto_104486 ?auto_104485 ) ( not ( = ?auto_104485 ?auto_104486 ) ) ( not ( = ?auto_104485 ?auto_104487 ) ) ( not ( = ?auto_104485 ?auto_104488 ) ) ( not ( = ?auto_104486 ?auto_104487 ) ) ( not ( = ?auto_104486 ?auto_104488 ) ) ( not ( = ?auto_104487 ?auto_104488 ) ) ( ON ?auto_104488 ?auto_104489 ) ( CLEAR ?auto_104488 ) ( not ( = ?auto_104485 ?auto_104489 ) ) ( not ( = ?auto_104486 ?auto_104489 ) ) ( not ( = ?auto_104487 ?auto_104489 ) ) ( not ( = ?auto_104488 ?auto_104489 ) ) ( HOLDING ?auto_104487 ) ( CLEAR ?auto_104486 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_104485 ?auto_104486 ?auto_104487 )
      ( MAKE-4PILE ?auto_104485 ?auto_104486 ?auto_104487 ?auto_104488 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_104490 - BLOCK
      ?auto_104491 - BLOCK
      ?auto_104492 - BLOCK
      ?auto_104493 - BLOCK
    )
    :vars
    (
      ?auto_104494 - BLOCK
      ?auto_104497 - BLOCK
      ?auto_104496 - BLOCK
      ?auto_104495 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_104490 ) ( ON ?auto_104491 ?auto_104490 ) ( not ( = ?auto_104490 ?auto_104491 ) ) ( not ( = ?auto_104490 ?auto_104492 ) ) ( not ( = ?auto_104490 ?auto_104493 ) ) ( not ( = ?auto_104491 ?auto_104492 ) ) ( not ( = ?auto_104491 ?auto_104493 ) ) ( not ( = ?auto_104492 ?auto_104493 ) ) ( ON ?auto_104493 ?auto_104494 ) ( not ( = ?auto_104490 ?auto_104494 ) ) ( not ( = ?auto_104491 ?auto_104494 ) ) ( not ( = ?auto_104492 ?auto_104494 ) ) ( not ( = ?auto_104493 ?auto_104494 ) ) ( CLEAR ?auto_104491 ) ( ON ?auto_104492 ?auto_104493 ) ( CLEAR ?auto_104492 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_104497 ) ( ON ?auto_104496 ?auto_104497 ) ( ON ?auto_104495 ?auto_104496 ) ( ON ?auto_104494 ?auto_104495 ) ( not ( = ?auto_104497 ?auto_104496 ) ) ( not ( = ?auto_104497 ?auto_104495 ) ) ( not ( = ?auto_104497 ?auto_104494 ) ) ( not ( = ?auto_104497 ?auto_104493 ) ) ( not ( = ?auto_104497 ?auto_104492 ) ) ( not ( = ?auto_104496 ?auto_104495 ) ) ( not ( = ?auto_104496 ?auto_104494 ) ) ( not ( = ?auto_104496 ?auto_104493 ) ) ( not ( = ?auto_104496 ?auto_104492 ) ) ( not ( = ?auto_104495 ?auto_104494 ) ) ( not ( = ?auto_104495 ?auto_104493 ) ) ( not ( = ?auto_104495 ?auto_104492 ) ) ( not ( = ?auto_104490 ?auto_104497 ) ) ( not ( = ?auto_104490 ?auto_104496 ) ) ( not ( = ?auto_104490 ?auto_104495 ) ) ( not ( = ?auto_104491 ?auto_104497 ) ) ( not ( = ?auto_104491 ?auto_104496 ) ) ( not ( = ?auto_104491 ?auto_104495 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_104497 ?auto_104496 ?auto_104495 ?auto_104494 ?auto_104493 )
      ( MAKE-4PILE ?auto_104490 ?auto_104491 ?auto_104492 ?auto_104493 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_104498 - BLOCK
      ?auto_104499 - BLOCK
      ?auto_104500 - BLOCK
      ?auto_104501 - BLOCK
    )
    :vars
    (
      ?auto_104504 - BLOCK
      ?auto_104502 - BLOCK
      ?auto_104503 - BLOCK
      ?auto_104505 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_104498 ) ( not ( = ?auto_104498 ?auto_104499 ) ) ( not ( = ?auto_104498 ?auto_104500 ) ) ( not ( = ?auto_104498 ?auto_104501 ) ) ( not ( = ?auto_104499 ?auto_104500 ) ) ( not ( = ?auto_104499 ?auto_104501 ) ) ( not ( = ?auto_104500 ?auto_104501 ) ) ( ON ?auto_104501 ?auto_104504 ) ( not ( = ?auto_104498 ?auto_104504 ) ) ( not ( = ?auto_104499 ?auto_104504 ) ) ( not ( = ?auto_104500 ?auto_104504 ) ) ( not ( = ?auto_104501 ?auto_104504 ) ) ( ON ?auto_104500 ?auto_104501 ) ( CLEAR ?auto_104500 ) ( ON-TABLE ?auto_104502 ) ( ON ?auto_104503 ?auto_104502 ) ( ON ?auto_104505 ?auto_104503 ) ( ON ?auto_104504 ?auto_104505 ) ( not ( = ?auto_104502 ?auto_104503 ) ) ( not ( = ?auto_104502 ?auto_104505 ) ) ( not ( = ?auto_104502 ?auto_104504 ) ) ( not ( = ?auto_104502 ?auto_104501 ) ) ( not ( = ?auto_104502 ?auto_104500 ) ) ( not ( = ?auto_104503 ?auto_104505 ) ) ( not ( = ?auto_104503 ?auto_104504 ) ) ( not ( = ?auto_104503 ?auto_104501 ) ) ( not ( = ?auto_104503 ?auto_104500 ) ) ( not ( = ?auto_104505 ?auto_104504 ) ) ( not ( = ?auto_104505 ?auto_104501 ) ) ( not ( = ?auto_104505 ?auto_104500 ) ) ( not ( = ?auto_104498 ?auto_104502 ) ) ( not ( = ?auto_104498 ?auto_104503 ) ) ( not ( = ?auto_104498 ?auto_104505 ) ) ( not ( = ?auto_104499 ?auto_104502 ) ) ( not ( = ?auto_104499 ?auto_104503 ) ) ( not ( = ?auto_104499 ?auto_104505 ) ) ( HOLDING ?auto_104499 ) ( CLEAR ?auto_104498 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_104498 ?auto_104499 )
      ( MAKE-4PILE ?auto_104498 ?auto_104499 ?auto_104500 ?auto_104501 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_104506 - BLOCK
      ?auto_104507 - BLOCK
      ?auto_104508 - BLOCK
      ?auto_104509 - BLOCK
    )
    :vars
    (
      ?auto_104510 - BLOCK
      ?auto_104511 - BLOCK
      ?auto_104512 - BLOCK
      ?auto_104513 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_104506 ) ( not ( = ?auto_104506 ?auto_104507 ) ) ( not ( = ?auto_104506 ?auto_104508 ) ) ( not ( = ?auto_104506 ?auto_104509 ) ) ( not ( = ?auto_104507 ?auto_104508 ) ) ( not ( = ?auto_104507 ?auto_104509 ) ) ( not ( = ?auto_104508 ?auto_104509 ) ) ( ON ?auto_104509 ?auto_104510 ) ( not ( = ?auto_104506 ?auto_104510 ) ) ( not ( = ?auto_104507 ?auto_104510 ) ) ( not ( = ?auto_104508 ?auto_104510 ) ) ( not ( = ?auto_104509 ?auto_104510 ) ) ( ON ?auto_104508 ?auto_104509 ) ( ON-TABLE ?auto_104511 ) ( ON ?auto_104512 ?auto_104511 ) ( ON ?auto_104513 ?auto_104512 ) ( ON ?auto_104510 ?auto_104513 ) ( not ( = ?auto_104511 ?auto_104512 ) ) ( not ( = ?auto_104511 ?auto_104513 ) ) ( not ( = ?auto_104511 ?auto_104510 ) ) ( not ( = ?auto_104511 ?auto_104509 ) ) ( not ( = ?auto_104511 ?auto_104508 ) ) ( not ( = ?auto_104512 ?auto_104513 ) ) ( not ( = ?auto_104512 ?auto_104510 ) ) ( not ( = ?auto_104512 ?auto_104509 ) ) ( not ( = ?auto_104512 ?auto_104508 ) ) ( not ( = ?auto_104513 ?auto_104510 ) ) ( not ( = ?auto_104513 ?auto_104509 ) ) ( not ( = ?auto_104513 ?auto_104508 ) ) ( not ( = ?auto_104506 ?auto_104511 ) ) ( not ( = ?auto_104506 ?auto_104512 ) ) ( not ( = ?auto_104506 ?auto_104513 ) ) ( not ( = ?auto_104507 ?auto_104511 ) ) ( not ( = ?auto_104507 ?auto_104512 ) ) ( not ( = ?auto_104507 ?auto_104513 ) ) ( CLEAR ?auto_104506 ) ( ON ?auto_104507 ?auto_104508 ) ( CLEAR ?auto_104507 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_104511 ?auto_104512 ?auto_104513 ?auto_104510 ?auto_104509 ?auto_104508 )
      ( MAKE-4PILE ?auto_104506 ?auto_104507 ?auto_104508 ?auto_104509 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_104514 - BLOCK
      ?auto_104515 - BLOCK
      ?auto_104516 - BLOCK
      ?auto_104517 - BLOCK
    )
    :vars
    (
      ?auto_104520 - BLOCK
      ?auto_104519 - BLOCK
      ?auto_104521 - BLOCK
      ?auto_104518 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_104514 ?auto_104515 ) ) ( not ( = ?auto_104514 ?auto_104516 ) ) ( not ( = ?auto_104514 ?auto_104517 ) ) ( not ( = ?auto_104515 ?auto_104516 ) ) ( not ( = ?auto_104515 ?auto_104517 ) ) ( not ( = ?auto_104516 ?auto_104517 ) ) ( ON ?auto_104517 ?auto_104520 ) ( not ( = ?auto_104514 ?auto_104520 ) ) ( not ( = ?auto_104515 ?auto_104520 ) ) ( not ( = ?auto_104516 ?auto_104520 ) ) ( not ( = ?auto_104517 ?auto_104520 ) ) ( ON ?auto_104516 ?auto_104517 ) ( ON-TABLE ?auto_104519 ) ( ON ?auto_104521 ?auto_104519 ) ( ON ?auto_104518 ?auto_104521 ) ( ON ?auto_104520 ?auto_104518 ) ( not ( = ?auto_104519 ?auto_104521 ) ) ( not ( = ?auto_104519 ?auto_104518 ) ) ( not ( = ?auto_104519 ?auto_104520 ) ) ( not ( = ?auto_104519 ?auto_104517 ) ) ( not ( = ?auto_104519 ?auto_104516 ) ) ( not ( = ?auto_104521 ?auto_104518 ) ) ( not ( = ?auto_104521 ?auto_104520 ) ) ( not ( = ?auto_104521 ?auto_104517 ) ) ( not ( = ?auto_104521 ?auto_104516 ) ) ( not ( = ?auto_104518 ?auto_104520 ) ) ( not ( = ?auto_104518 ?auto_104517 ) ) ( not ( = ?auto_104518 ?auto_104516 ) ) ( not ( = ?auto_104514 ?auto_104519 ) ) ( not ( = ?auto_104514 ?auto_104521 ) ) ( not ( = ?auto_104514 ?auto_104518 ) ) ( not ( = ?auto_104515 ?auto_104519 ) ) ( not ( = ?auto_104515 ?auto_104521 ) ) ( not ( = ?auto_104515 ?auto_104518 ) ) ( ON ?auto_104515 ?auto_104516 ) ( CLEAR ?auto_104515 ) ( HOLDING ?auto_104514 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_104514 )
      ( MAKE-4PILE ?auto_104514 ?auto_104515 ?auto_104516 ?auto_104517 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_104522 - BLOCK
      ?auto_104523 - BLOCK
      ?auto_104524 - BLOCK
      ?auto_104525 - BLOCK
    )
    :vars
    (
      ?auto_104527 - BLOCK
      ?auto_104528 - BLOCK
      ?auto_104529 - BLOCK
      ?auto_104526 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_104522 ?auto_104523 ) ) ( not ( = ?auto_104522 ?auto_104524 ) ) ( not ( = ?auto_104522 ?auto_104525 ) ) ( not ( = ?auto_104523 ?auto_104524 ) ) ( not ( = ?auto_104523 ?auto_104525 ) ) ( not ( = ?auto_104524 ?auto_104525 ) ) ( ON ?auto_104525 ?auto_104527 ) ( not ( = ?auto_104522 ?auto_104527 ) ) ( not ( = ?auto_104523 ?auto_104527 ) ) ( not ( = ?auto_104524 ?auto_104527 ) ) ( not ( = ?auto_104525 ?auto_104527 ) ) ( ON ?auto_104524 ?auto_104525 ) ( ON-TABLE ?auto_104528 ) ( ON ?auto_104529 ?auto_104528 ) ( ON ?auto_104526 ?auto_104529 ) ( ON ?auto_104527 ?auto_104526 ) ( not ( = ?auto_104528 ?auto_104529 ) ) ( not ( = ?auto_104528 ?auto_104526 ) ) ( not ( = ?auto_104528 ?auto_104527 ) ) ( not ( = ?auto_104528 ?auto_104525 ) ) ( not ( = ?auto_104528 ?auto_104524 ) ) ( not ( = ?auto_104529 ?auto_104526 ) ) ( not ( = ?auto_104529 ?auto_104527 ) ) ( not ( = ?auto_104529 ?auto_104525 ) ) ( not ( = ?auto_104529 ?auto_104524 ) ) ( not ( = ?auto_104526 ?auto_104527 ) ) ( not ( = ?auto_104526 ?auto_104525 ) ) ( not ( = ?auto_104526 ?auto_104524 ) ) ( not ( = ?auto_104522 ?auto_104528 ) ) ( not ( = ?auto_104522 ?auto_104529 ) ) ( not ( = ?auto_104522 ?auto_104526 ) ) ( not ( = ?auto_104523 ?auto_104528 ) ) ( not ( = ?auto_104523 ?auto_104529 ) ) ( not ( = ?auto_104523 ?auto_104526 ) ) ( ON ?auto_104523 ?auto_104524 ) ( ON ?auto_104522 ?auto_104523 ) ( CLEAR ?auto_104522 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_104528 ?auto_104529 ?auto_104526 ?auto_104527 ?auto_104525 ?auto_104524 ?auto_104523 )
      ( MAKE-4PILE ?auto_104522 ?auto_104523 ?auto_104524 ?auto_104525 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_104533 - BLOCK
      ?auto_104534 - BLOCK
      ?auto_104535 - BLOCK
    )
    :vars
    (
      ?auto_104536 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104536 ?auto_104535 ) ( CLEAR ?auto_104536 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_104533 ) ( ON ?auto_104534 ?auto_104533 ) ( ON ?auto_104535 ?auto_104534 ) ( not ( = ?auto_104533 ?auto_104534 ) ) ( not ( = ?auto_104533 ?auto_104535 ) ) ( not ( = ?auto_104533 ?auto_104536 ) ) ( not ( = ?auto_104534 ?auto_104535 ) ) ( not ( = ?auto_104534 ?auto_104536 ) ) ( not ( = ?auto_104535 ?auto_104536 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_104536 ?auto_104535 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_104537 - BLOCK
      ?auto_104538 - BLOCK
      ?auto_104539 - BLOCK
    )
    :vars
    (
      ?auto_104540 - BLOCK
      ?auto_104541 - BLOCK
      ?auto_104542 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104540 ?auto_104539 ) ( CLEAR ?auto_104540 ) ( ON-TABLE ?auto_104537 ) ( ON ?auto_104538 ?auto_104537 ) ( ON ?auto_104539 ?auto_104538 ) ( not ( = ?auto_104537 ?auto_104538 ) ) ( not ( = ?auto_104537 ?auto_104539 ) ) ( not ( = ?auto_104537 ?auto_104540 ) ) ( not ( = ?auto_104538 ?auto_104539 ) ) ( not ( = ?auto_104538 ?auto_104540 ) ) ( not ( = ?auto_104539 ?auto_104540 ) ) ( HOLDING ?auto_104541 ) ( CLEAR ?auto_104542 ) ( not ( = ?auto_104537 ?auto_104541 ) ) ( not ( = ?auto_104537 ?auto_104542 ) ) ( not ( = ?auto_104538 ?auto_104541 ) ) ( not ( = ?auto_104538 ?auto_104542 ) ) ( not ( = ?auto_104539 ?auto_104541 ) ) ( not ( = ?auto_104539 ?auto_104542 ) ) ( not ( = ?auto_104540 ?auto_104541 ) ) ( not ( = ?auto_104540 ?auto_104542 ) ) ( not ( = ?auto_104541 ?auto_104542 ) ) )
    :subtasks
    ( ( !STACK ?auto_104541 ?auto_104542 )
      ( MAKE-3PILE ?auto_104537 ?auto_104538 ?auto_104539 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_104543 - BLOCK
      ?auto_104544 - BLOCK
      ?auto_104545 - BLOCK
    )
    :vars
    (
      ?auto_104546 - BLOCK
      ?auto_104548 - BLOCK
      ?auto_104547 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104546 ?auto_104545 ) ( ON-TABLE ?auto_104543 ) ( ON ?auto_104544 ?auto_104543 ) ( ON ?auto_104545 ?auto_104544 ) ( not ( = ?auto_104543 ?auto_104544 ) ) ( not ( = ?auto_104543 ?auto_104545 ) ) ( not ( = ?auto_104543 ?auto_104546 ) ) ( not ( = ?auto_104544 ?auto_104545 ) ) ( not ( = ?auto_104544 ?auto_104546 ) ) ( not ( = ?auto_104545 ?auto_104546 ) ) ( CLEAR ?auto_104548 ) ( not ( = ?auto_104543 ?auto_104547 ) ) ( not ( = ?auto_104543 ?auto_104548 ) ) ( not ( = ?auto_104544 ?auto_104547 ) ) ( not ( = ?auto_104544 ?auto_104548 ) ) ( not ( = ?auto_104545 ?auto_104547 ) ) ( not ( = ?auto_104545 ?auto_104548 ) ) ( not ( = ?auto_104546 ?auto_104547 ) ) ( not ( = ?auto_104546 ?auto_104548 ) ) ( not ( = ?auto_104547 ?auto_104548 ) ) ( ON ?auto_104547 ?auto_104546 ) ( CLEAR ?auto_104547 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_104543 ?auto_104544 ?auto_104545 ?auto_104546 )
      ( MAKE-3PILE ?auto_104543 ?auto_104544 ?auto_104545 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_104549 - BLOCK
      ?auto_104550 - BLOCK
      ?auto_104551 - BLOCK
    )
    :vars
    (
      ?auto_104552 - BLOCK
      ?auto_104554 - BLOCK
      ?auto_104553 - BLOCK
      ?auto_104556 - BLOCK
      ?auto_104555 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104552 ?auto_104551 ) ( ON-TABLE ?auto_104549 ) ( ON ?auto_104550 ?auto_104549 ) ( ON ?auto_104551 ?auto_104550 ) ( not ( = ?auto_104549 ?auto_104550 ) ) ( not ( = ?auto_104549 ?auto_104551 ) ) ( not ( = ?auto_104549 ?auto_104552 ) ) ( not ( = ?auto_104550 ?auto_104551 ) ) ( not ( = ?auto_104550 ?auto_104552 ) ) ( not ( = ?auto_104551 ?auto_104552 ) ) ( not ( = ?auto_104549 ?auto_104554 ) ) ( not ( = ?auto_104549 ?auto_104553 ) ) ( not ( = ?auto_104550 ?auto_104554 ) ) ( not ( = ?auto_104550 ?auto_104553 ) ) ( not ( = ?auto_104551 ?auto_104554 ) ) ( not ( = ?auto_104551 ?auto_104553 ) ) ( not ( = ?auto_104552 ?auto_104554 ) ) ( not ( = ?auto_104552 ?auto_104553 ) ) ( not ( = ?auto_104554 ?auto_104553 ) ) ( ON ?auto_104554 ?auto_104552 ) ( CLEAR ?auto_104554 ) ( HOLDING ?auto_104553 ) ( CLEAR ?auto_104556 ) ( ON-TABLE ?auto_104555 ) ( ON ?auto_104556 ?auto_104555 ) ( not ( = ?auto_104555 ?auto_104556 ) ) ( not ( = ?auto_104555 ?auto_104553 ) ) ( not ( = ?auto_104556 ?auto_104553 ) ) ( not ( = ?auto_104549 ?auto_104556 ) ) ( not ( = ?auto_104549 ?auto_104555 ) ) ( not ( = ?auto_104550 ?auto_104556 ) ) ( not ( = ?auto_104550 ?auto_104555 ) ) ( not ( = ?auto_104551 ?auto_104556 ) ) ( not ( = ?auto_104551 ?auto_104555 ) ) ( not ( = ?auto_104552 ?auto_104556 ) ) ( not ( = ?auto_104552 ?auto_104555 ) ) ( not ( = ?auto_104554 ?auto_104556 ) ) ( not ( = ?auto_104554 ?auto_104555 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_104555 ?auto_104556 ?auto_104553 )
      ( MAKE-3PILE ?auto_104549 ?auto_104550 ?auto_104551 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_104557 - BLOCK
      ?auto_104558 - BLOCK
      ?auto_104559 - BLOCK
    )
    :vars
    (
      ?auto_104564 - BLOCK
      ?auto_104563 - BLOCK
      ?auto_104560 - BLOCK
      ?auto_104562 - BLOCK
      ?auto_104561 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104564 ?auto_104559 ) ( ON-TABLE ?auto_104557 ) ( ON ?auto_104558 ?auto_104557 ) ( ON ?auto_104559 ?auto_104558 ) ( not ( = ?auto_104557 ?auto_104558 ) ) ( not ( = ?auto_104557 ?auto_104559 ) ) ( not ( = ?auto_104557 ?auto_104564 ) ) ( not ( = ?auto_104558 ?auto_104559 ) ) ( not ( = ?auto_104558 ?auto_104564 ) ) ( not ( = ?auto_104559 ?auto_104564 ) ) ( not ( = ?auto_104557 ?auto_104563 ) ) ( not ( = ?auto_104557 ?auto_104560 ) ) ( not ( = ?auto_104558 ?auto_104563 ) ) ( not ( = ?auto_104558 ?auto_104560 ) ) ( not ( = ?auto_104559 ?auto_104563 ) ) ( not ( = ?auto_104559 ?auto_104560 ) ) ( not ( = ?auto_104564 ?auto_104563 ) ) ( not ( = ?auto_104564 ?auto_104560 ) ) ( not ( = ?auto_104563 ?auto_104560 ) ) ( ON ?auto_104563 ?auto_104564 ) ( CLEAR ?auto_104562 ) ( ON-TABLE ?auto_104561 ) ( ON ?auto_104562 ?auto_104561 ) ( not ( = ?auto_104561 ?auto_104562 ) ) ( not ( = ?auto_104561 ?auto_104560 ) ) ( not ( = ?auto_104562 ?auto_104560 ) ) ( not ( = ?auto_104557 ?auto_104562 ) ) ( not ( = ?auto_104557 ?auto_104561 ) ) ( not ( = ?auto_104558 ?auto_104562 ) ) ( not ( = ?auto_104558 ?auto_104561 ) ) ( not ( = ?auto_104559 ?auto_104562 ) ) ( not ( = ?auto_104559 ?auto_104561 ) ) ( not ( = ?auto_104564 ?auto_104562 ) ) ( not ( = ?auto_104564 ?auto_104561 ) ) ( not ( = ?auto_104563 ?auto_104562 ) ) ( not ( = ?auto_104563 ?auto_104561 ) ) ( ON ?auto_104560 ?auto_104563 ) ( CLEAR ?auto_104560 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_104557 ?auto_104558 ?auto_104559 ?auto_104564 ?auto_104563 )
      ( MAKE-3PILE ?auto_104557 ?auto_104558 ?auto_104559 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_104565 - BLOCK
      ?auto_104566 - BLOCK
      ?auto_104567 - BLOCK
    )
    :vars
    (
      ?auto_104568 - BLOCK
      ?auto_104570 - BLOCK
      ?auto_104572 - BLOCK
      ?auto_104571 - BLOCK
      ?auto_104569 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104568 ?auto_104567 ) ( ON-TABLE ?auto_104565 ) ( ON ?auto_104566 ?auto_104565 ) ( ON ?auto_104567 ?auto_104566 ) ( not ( = ?auto_104565 ?auto_104566 ) ) ( not ( = ?auto_104565 ?auto_104567 ) ) ( not ( = ?auto_104565 ?auto_104568 ) ) ( not ( = ?auto_104566 ?auto_104567 ) ) ( not ( = ?auto_104566 ?auto_104568 ) ) ( not ( = ?auto_104567 ?auto_104568 ) ) ( not ( = ?auto_104565 ?auto_104570 ) ) ( not ( = ?auto_104565 ?auto_104572 ) ) ( not ( = ?auto_104566 ?auto_104570 ) ) ( not ( = ?auto_104566 ?auto_104572 ) ) ( not ( = ?auto_104567 ?auto_104570 ) ) ( not ( = ?auto_104567 ?auto_104572 ) ) ( not ( = ?auto_104568 ?auto_104570 ) ) ( not ( = ?auto_104568 ?auto_104572 ) ) ( not ( = ?auto_104570 ?auto_104572 ) ) ( ON ?auto_104570 ?auto_104568 ) ( ON-TABLE ?auto_104571 ) ( not ( = ?auto_104571 ?auto_104569 ) ) ( not ( = ?auto_104571 ?auto_104572 ) ) ( not ( = ?auto_104569 ?auto_104572 ) ) ( not ( = ?auto_104565 ?auto_104569 ) ) ( not ( = ?auto_104565 ?auto_104571 ) ) ( not ( = ?auto_104566 ?auto_104569 ) ) ( not ( = ?auto_104566 ?auto_104571 ) ) ( not ( = ?auto_104567 ?auto_104569 ) ) ( not ( = ?auto_104567 ?auto_104571 ) ) ( not ( = ?auto_104568 ?auto_104569 ) ) ( not ( = ?auto_104568 ?auto_104571 ) ) ( not ( = ?auto_104570 ?auto_104569 ) ) ( not ( = ?auto_104570 ?auto_104571 ) ) ( ON ?auto_104572 ?auto_104570 ) ( CLEAR ?auto_104572 ) ( HOLDING ?auto_104569 ) ( CLEAR ?auto_104571 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_104571 ?auto_104569 )
      ( MAKE-3PILE ?auto_104565 ?auto_104566 ?auto_104567 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_105750 - BLOCK
      ?auto_105751 - BLOCK
      ?auto_105752 - BLOCK
    )
    :vars
    (
      ?auto_105753 - BLOCK
      ?auto_105754 - BLOCK
      ?auto_105756 - BLOCK
      ?auto_105755 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105753 ?auto_105752 ) ( ON-TABLE ?auto_105750 ) ( ON ?auto_105751 ?auto_105750 ) ( ON ?auto_105752 ?auto_105751 ) ( not ( = ?auto_105750 ?auto_105751 ) ) ( not ( = ?auto_105750 ?auto_105752 ) ) ( not ( = ?auto_105750 ?auto_105753 ) ) ( not ( = ?auto_105751 ?auto_105752 ) ) ( not ( = ?auto_105751 ?auto_105753 ) ) ( not ( = ?auto_105752 ?auto_105753 ) ) ( not ( = ?auto_105750 ?auto_105754 ) ) ( not ( = ?auto_105750 ?auto_105756 ) ) ( not ( = ?auto_105751 ?auto_105754 ) ) ( not ( = ?auto_105751 ?auto_105756 ) ) ( not ( = ?auto_105752 ?auto_105754 ) ) ( not ( = ?auto_105752 ?auto_105756 ) ) ( not ( = ?auto_105753 ?auto_105754 ) ) ( not ( = ?auto_105753 ?auto_105756 ) ) ( not ( = ?auto_105754 ?auto_105756 ) ) ( ON ?auto_105754 ?auto_105753 ) ( not ( = ?auto_105755 ?auto_105756 ) ) ( not ( = ?auto_105750 ?auto_105755 ) ) ( not ( = ?auto_105751 ?auto_105755 ) ) ( not ( = ?auto_105752 ?auto_105755 ) ) ( not ( = ?auto_105753 ?auto_105755 ) ) ( not ( = ?auto_105754 ?auto_105755 ) ) ( ON ?auto_105756 ?auto_105754 ) ( ON ?auto_105755 ?auto_105756 ) ( CLEAR ?auto_105755 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_105750 ?auto_105751 ?auto_105752 ?auto_105753 ?auto_105754 ?auto_105756 )
      ( MAKE-3PILE ?auto_105750 ?auto_105751 ?auto_105752 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_104581 - BLOCK
      ?auto_104582 - BLOCK
      ?auto_104583 - BLOCK
    )
    :vars
    (
      ?auto_104587 - BLOCK
      ?auto_104585 - BLOCK
      ?auto_104588 - BLOCK
      ?auto_104586 - BLOCK
      ?auto_104584 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104587 ?auto_104583 ) ( ON-TABLE ?auto_104581 ) ( ON ?auto_104582 ?auto_104581 ) ( ON ?auto_104583 ?auto_104582 ) ( not ( = ?auto_104581 ?auto_104582 ) ) ( not ( = ?auto_104581 ?auto_104583 ) ) ( not ( = ?auto_104581 ?auto_104587 ) ) ( not ( = ?auto_104582 ?auto_104583 ) ) ( not ( = ?auto_104582 ?auto_104587 ) ) ( not ( = ?auto_104583 ?auto_104587 ) ) ( not ( = ?auto_104581 ?auto_104585 ) ) ( not ( = ?auto_104581 ?auto_104588 ) ) ( not ( = ?auto_104582 ?auto_104585 ) ) ( not ( = ?auto_104582 ?auto_104588 ) ) ( not ( = ?auto_104583 ?auto_104585 ) ) ( not ( = ?auto_104583 ?auto_104588 ) ) ( not ( = ?auto_104587 ?auto_104585 ) ) ( not ( = ?auto_104587 ?auto_104588 ) ) ( not ( = ?auto_104585 ?auto_104588 ) ) ( ON ?auto_104585 ?auto_104587 ) ( not ( = ?auto_104586 ?auto_104584 ) ) ( not ( = ?auto_104586 ?auto_104588 ) ) ( not ( = ?auto_104584 ?auto_104588 ) ) ( not ( = ?auto_104581 ?auto_104584 ) ) ( not ( = ?auto_104581 ?auto_104586 ) ) ( not ( = ?auto_104582 ?auto_104584 ) ) ( not ( = ?auto_104582 ?auto_104586 ) ) ( not ( = ?auto_104583 ?auto_104584 ) ) ( not ( = ?auto_104583 ?auto_104586 ) ) ( not ( = ?auto_104587 ?auto_104584 ) ) ( not ( = ?auto_104587 ?auto_104586 ) ) ( not ( = ?auto_104585 ?auto_104584 ) ) ( not ( = ?auto_104585 ?auto_104586 ) ) ( ON ?auto_104588 ?auto_104585 ) ( ON ?auto_104584 ?auto_104588 ) ( CLEAR ?auto_104584 ) ( HOLDING ?auto_104586 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_104586 )
      ( MAKE-3PILE ?auto_104581 ?auto_104582 ?auto_104583 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_104589 - BLOCK
      ?auto_104590 - BLOCK
      ?auto_104591 - BLOCK
    )
    :vars
    (
      ?auto_104593 - BLOCK
      ?auto_104596 - BLOCK
      ?auto_104594 - BLOCK
      ?auto_104592 - BLOCK
      ?auto_104595 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104593 ?auto_104591 ) ( ON-TABLE ?auto_104589 ) ( ON ?auto_104590 ?auto_104589 ) ( ON ?auto_104591 ?auto_104590 ) ( not ( = ?auto_104589 ?auto_104590 ) ) ( not ( = ?auto_104589 ?auto_104591 ) ) ( not ( = ?auto_104589 ?auto_104593 ) ) ( not ( = ?auto_104590 ?auto_104591 ) ) ( not ( = ?auto_104590 ?auto_104593 ) ) ( not ( = ?auto_104591 ?auto_104593 ) ) ( not ( = ?auto_104589 ?auto_104596 ) ) ( not ( = ?auto_104589 ?auto_104594 ) ) ( not ( = ?auto_104590 ?auto_104596 ) ) ( not ( = ?auto_104590 ?auto_104594 ) ) ( not ( = ?auto_104591 ?auto_104596 ) ) ( not ( = ?auto_104591 ?auto_104594 ) ) ( not ( = ?auto_104593 ?auto_104596 ) ) ( not ( = ?auto_104593 ?auto_104594 ) ) ( not ( = ?auto_104596 ?auto_104594 ) ) ( ON ?auto_104596 ?auto_104593 ) ( not ( = ?auto_104592 ?auto_104595 ) ) ( not ( = ?auto_104592 ?auto_104594 ) ) ( not ( = ?auto_104595 ?auto_104594 ) ) ( not ( = ?auto_104589 ?auto_104595 ) ) ( not ( = ?auto_104589 ?auto_104592 ) ) ( not ( = ?auto_104590 ?auto_104595 ) ) ( not ( = ?auto_104590 ?auto_104592 ) ) ( not ( = ?auto_104591 ?auto_104595 ) ) ( not ( = ?auto_104591 ?auto_104592 ) ) ( not ( = ?auto_104593 ?auto_104595 ) ) ( not ( = ?auto_104593 ?auto_104592 ) ) ( not ( = ?auto_104596 ?auto_104595 ) ) ( not ( = ?auto_104596 ?auto_104592 ) ) ( ON ?auto_104594 ?auto_104596 ) ( ON ?auto_104595 ?auto_104594 ) ( ON ?auto_104592 ?auto_104595 ) ( CLEAR ?auto_104592 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_104589 ?auto_104590 ?auto_104591 ?auto_104593 ?auto_104596 ?auto_104594 ?auto_104595 )
      ( MAKE-3PILE ?auto_104589 ?auto_104590 ?auto_104591 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_104602 - BLOCK
      ?auto_104603 - BLOCK
      ?auto_104604 - BLOCK
      ?auto_104605 - BLOCK
      ?auto_104606 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_104606 ) ( CLEAR ?auto_104605 ) ( ON-TABLE ?auto_104602 ) ( ON ?auto_104603 ?auto_104602 ) ( ON ?auto_104604 ?auto_104603 ) ( ON ?auto_104605 ?auto_104604 ) ( not ( = ?auto_104602 ?auto_104603 ) ) ( not ( = ?auto_104602 ?auto_104604 ) ) ( not ( = ?auto_104602 ?auto_104605 ) ) ( not ( = ?auto_104602 ?auto_104606 ) ) ( not ( = ?auto_104603 ?auto_104604 ) ) ( not ( = ?auto_104603 ?auto_104605 ) ) ( not ( = ?auto_104603 ?auto_104606 ) ) ( not ( = ?auto_104604 ?auto_104605 ) ) ( not ( = ?auto_104604 ?auto_104606 ) ) ( not ( = ?auto_104605 ?auto_104606 ) ) )
    :subtasks
    ( ( !STACK ?auto_104606 ?auto_104605 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_104607 - BLOCK
      ?auto_104608 - BLOCK
      ?auto_104609 - BLOCK
      ?auto_104610 - BLOCK
      ?auto_104611 - BLOCK
    )
    :vars
    (
      ?auto_104612 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_104610 ) ( ON-TABLE ?auto_104607 ) ( ON ?auto_104608 ?auto_104607 ) ( ON ?auto_104609 ?auto_104608 ) ( ON ?auto_104610 ?auto_104609 ) ( not ( = ?auto_104607 ?auto_104608 ) ) ( not ( = ?auto_104607 ?auto_104609 ) ) ( not ( = ?auto_104607 ?auto_104610 ) ) ( not ( = ?auto_104607 ?auto_104611 ) ) ( not ( = ?auto_104608 ?auto_104609 ) ) ( not ( = ?auto_104608 ?auto_104610 ) ) ( not ( = ?auto_104608 ?auto_104611 ) ) ( not ( = ?auto_104609 ?auto_104610 ) ) ( not ( = ?auto_104609 ?auto_104611 ) ) ( not ( = ?auto_104610 ?auto_104611 ) ) ( ON ?auto_104611 ?auto_104612 ) ( CLEAR ?auto_104611 ) ( HAND-EMPTY ) ( not ( = ?auto_104607 ?auto_104612 ) ) ( not ( = ?auto_104608 ?auto_104612 ) ) ( not ( = ?auto_104609 ?auto_104612 ) ) ( not ( = ?auto_104610 ?auto_104612 ) ) ( not ( = ?auto_104611 ?auto_104612 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_104611 ?auto_104612 )
      ( MAKE-5PILE ?auto_104607 ?auto_104608 ?auto_104609 ?auto_104610 ?auto_104611 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_104613 - BLOCK
      ?auto_104614 - BLOCK
      ?auto_104615 - BLOCK
      ?auto_104616 - BLOCK
      ?auto_104617 - BLOCK
    )
    :vars
    (
      ?auto_104618 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_104613 ) ( ON ?auto_104614 ?auto_104613 ) ( ON ?auto_104615 ?auto_104614 ) ( not ( = ?auto_104613 ?auto_104614 ) ) ( not ( = ?auto_104613 ?auto_104615 ) ) ( not ( = ?auto_104613 ?auto_104616 ) ) ( not ( = ?auto_104613 ?auto_104617 ) ) ( not ( = ?auto_104614 ?auto_104615 ) ) ( not ( = ?auto_104614 ?auto_104616 ) ) ( not ( = ?auto_104614 ?auto_104617 ) ) ( not ( = ?auto_104615 ?auto_104616 ) ) ( not ( = ?auto_104615 ?auto_104617 ) ) ( not ( = ?auto_104616 ?auto_104617 ) ) ( ON ?auto_104617 ?auto_104618 ) ( CLEAR ?auto_104617 ) ( not ( = ?auto_104613 ?auto_104618 ) ) ( not ( = ?auto_104614 ?auto_104618 ) ) ( not ( = ?auto_104615 ?auto_104618 ) ) ( not ( = ?auto_104616 ?auto_104618 ) ) ( not ( = ?auto_104617 ?auto_104618 ) ) ( HOLDING ?auto_104616 ) ( CLEAR ?auto_104615 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_104613 ?auto_104614 ?auto_104615 ?auto_104616 )
      ( MAKE-5PILE ?auto_104613 ?auto_104614 ?auto_104615 ?auto_104616 ?auto_104617 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_104619 - BLOCK
      ?auto_104620 - BLOCK
      ?auto_104621 - BLOCK
      ?auto_104622 - BLOCK
      ?auto_104623 - BLOCK
    )
    :vars
    (
      ?auto_104624 - BLOCK
      ?auto_104626 - BLOCK
      ?auto_104625 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_104619 ) ( ON ?auto_104620 ?auto_104619 ) ( ON ?auto_104621 ?auto_104620 ) ( not ( = ?auto_104619 ?auto_104620 ) ) ( not ( = ?auto_104619 ?auto_104621 ) ) ( not ( = ?auto_104619 ?auto_104622 ) ) ( not ( = ?auto_104619 ?auto_104623 ) ) ( not ( = ?auto_104620 ?auto_104621 ) ) ( not ( = ?auto_104620 ?auto_104622 ) ) ( not ( = ?auto_104620 ?auto_104623 ) ) ( not ( = ?auto_104621 ?auto_104622 ) ) ( not ( = ?auto_104621 ?auto_104623 ) ) ( not ( = ?auto_104622 ?auto_104623 ) ) ( ON ?auto_104623 ?auto_104624 ) ( not ( = ?auto_104619 ?auto_104624 ) ) ( not ( = ?auto_104620 ?auto_104624 ) ) ( not ( = ?auto_104621 ?auto_104624 ) ) ( not ( = ?auto_104622 ?auto_104624 ) ) ( not ( = ?auto_104623 ?auto_104624 ) ) ( CLEAR ?auto_104621 ) ( ON ?auto_104622 ?auto_104623 ) ( CLEAR ?auto_104622 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_104626 ) ( ON ?auto_104625 ?auto_104626 ) ( ON ?auto_104624 ?auto_104625 ) ( not ( = ?auto_104626 ?auto_104625 ) ) ( not ( = ?auto_104626 ?auto_104624 ) ) ( not ( = ?auto_104626 ?auto_104623 ) ) ( not ( = ?auto_104626 ?auto_104622 ) ) ( not ( = ?auto_104625 ?auto_104624 ) ) ( not ( = ?auto_104625 ?auto_104623 ) ) ( not ( = ?auto_104625 ?auto_104622 ) ) ( not ( = ?auto_104619 ?auto_104626 ) ) ( not ( = ?auto_104619 ?auto_104625 ) ) ( not ( = ?auto_104620 ?auto_104626 ) ) ( not ( = ?auto_104620 ?auto_104625 ) ) ( not ( = ?auto_104621 ?auto_104626 ) ) ( not ( = ?auto_104621 ?auto_104625 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_104626 ?auto_104625 ?auto_104624 ?auto_104623 )
      ( MAKE-5PILE ?auto_104619 ?auto_104620 ?auto_104621 ?auto_104622 ?auto_104623 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_104627 - BLOCK
      ?auto_104628 - BLOCK
      ?auto_104629 - BLOCK
      ?auto_104630 - BLOCK
      ?auto_104631 - BLOCK
    )
    :vars
    (
      ?auto_104633 - BLOCK
      ?auto_104634 - BLOCK
      ?auto_104632 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_104627 ) ( ON ?auto_104628 ?auto_104627 ) ( not ( = ?auto_104627 ?auto_104628 ) ) ( not ( = ?auto_104627 ?auto_104629 ) ) ( not ( = ?auto_104627 ?auto_104630 ) ) ( not ( = ?auto_104627 ?auto_104631 ) ) ( not ( = ?auto_104628 ?auto_104629 ) ) ( not ( = ?auto_104628 ?auto_104630 ) ) ( not ( = ?auto_104628 ?auto_104631 ) ) ( not ( = ?auto_104629 ?auto_104630 ) ) ( not ( = ?auto_104629 ?auto_104631 ) ) ( not ( = ?auto_104630 ?auto_104631 ) ) ( ON ?auto_104631 ?auto_104633 ) ( not ( = ?auto_104627 ?auto_104633 ) ) ( not ( = ?auto_104628 ?auto_104633 ) ) ( not ( = ?auto_104629 ?auto_104633 ) ) ( not ( = ?auto_104630 ?auto_104633 ) ) ( not ( = ?auto_104631 ?auto_104633 ) ) ( ON ?auto_104630 ?auto_104631 ) ( CLEAR ?auto_104630 ) ( ON-TABLE ?auto_104634 ) ( ON ?auto_104632 ?auto_104634 ) ( ON ?auto_104633 ?auto_104632 ) ( not ( = ?auto_104634 ?auto_104632 ) ) ( not ( = ?auto_104634 ?auto_104633 ) ) ( not ( = ?auto_104634 ?auto_104631 ) ) ( not ( = ?auto_104634 ?auto_104630 ) ) ( not ( = ?auto_104632 ?auto_104633 ) ) ( not ( = ?auto_104632 ?auto_104631 ) ) ( not ( = ?auto_104632 ?auto_104630 ) ) ( not ( = ?auto_104627 ?auto_104634 ) ) ( not ( = ?auto_104627 ?auto_104632 ) ) ( not ( = ?auto_104628 ?auto_104634 ) ) ( not ( = ?auto_104628 ?auto_104632 ) ) ( not ( = ?auto_104629 ?auto_104634 ) ) ( not ( = ?auto_104629 ?auto_104632 ) ) ( HOLDING ?auto_104629 ) ( CLEAR ?auto_104628 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_104627 ?auto_104628 ?auto_104629 )
      ( MAKE-5PILE ?auto_104627 ?auto_104628 ?auto_104629 ?auto_104630 ?auto_104631 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_104635 - BLOCK
      ?auto_104636 - BLOCK
      ?auto_104637 - BLOCK
      ?auto_104638 - BLOCK
      ?auto_104639 - BLOCK
    )
    :vars
    (
      ?auto_104640 - BLOCK
      ?auto_104641 - BLOCK
      ?auto_104642 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_104635 ) ( ON ?auto_104636 ?auto_104635 ) ( not ( = ?auto_104635 ?auto_104636 ) ) ( not ( = ?auto_104635 ?auto_104637 ) ) ( not ( = ?auto_104635 ?auto_104638 ) ) ( not ( = ?auto_104635 ?auto_104639 ) ) ( not ( = ?auto_104636 ?auto_104637 ) ) ( not ( = ?auto_104636 ?auto_104638 ) ) ( not ( = ?auto_104636 ?auto_104639 ) ) ( not ( = ?auto_104637 ?auto_104638 ) ) ( not ( = ?auto_104637 ?auto_104639 ) ) ( not ( = ?auto_104638 ?auto_104639 ) ) ( ON ?auto_104639 ?auto_104640 ) ( not ( = ?auto_104635 ?auto_104640 ) ) ( not ( = ?auto_104636 ?auto_104640 ) ) ( not ( = ?auto_104637 ?auto_104640 ) ) ( not ( = ?auto_104638 ?auto_104640 ) ) ( not ( = ?auto_104639 ?auto_104640 ) ) ( ON ?auto_104638 ?auto_104639 ) ( ON-TABLE ?auto_104641 ) ( ON ?auto_104642 ?auto_104641 ) ( ON ?auto_104640 ?auto_104642 ) ( not ( = ?auto_104641 ?auto_104642 ) ) ( not ( = ?auto_104641 ?auto_104640 ) ) ( not ( = ?auto_104641 ?auto_104639 ) ) ( not ( = ?auto_104641 ?auto_104638 ) ) ( not ( = ?auto_104642 ?auto_104640 ) ) ( not ( = ?auto_104642 ?auto_104639 ) ) ( not ( = ?auto_104642 ?auto_104638 ) ) ( not ( = ?auto_104635 ?auto_104641 ) ) ( not ( = ?auto_104635 ?auto_104642 ) ) ( not ( = ?auto_104636 ?auto_104641 ) ) ( not ( = ?auto_104636 ?auto_104642 ) ) ( not ( = ?auto_104637 ?auto_104641 ) ) ( not ( = ?auto_104637 ?auto_104642 ) ) ( CLEAR ?auto_104636 ) ( ON ?auto_104637 ?auto_104638 ) ( CLEAR ?auto_104637 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_104641 ?auto_104642 ?auto_104640 ?auto_104639 ?auto_104638 )
      ( MAKE-5PILE ?auto_104635 ?auto_104636 ?auto_104637 ?auto_104638 ?auto_104639 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_104643 - BLOCK
      ?auto_104644 - BLOCK
      ?auto_104645 - BLOCK
      ?auto_104646 - BLOCK
      ?auto_104647 - BLOCK
    )
    :vars
    (
      ?auto_104648 - BLOCK
      ?auto_104650 - BLOCK
      ?auto_104649 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_104643 ) ( not ( = ?auto_104643 ?auto_104644 ) ) ( not ( = ?auto_104643 ?auto_104645 ) ) ( not ( = ?auto_104643 ?auto_104646 ) ) ( not ( = ?auto_104643 ?auto_104647 ) ) ( not ( = ?auto_104644 ?auto_104645 ) ) ( not ( = ?auto_104644 ?auto_104646 ) ) ( not ( = ?auto_104644 ?auto_104647 ) ) ( not ( = ?auto_104645 ?auto_104646 ) ) ( not ( = ?auto_104645 ?auto_104647 ) ) ( not ( = ?auto_104646 ?auto_104647 ) ) ( ON ?auto_104647 ?auto_104648 ) ( not ( = ?auto_104643 ?auto_104648 ) ) ( not ( = ?auto_104644 ?auto_104648 ) ) ( not ( = ?auto_104645 ?auto_104648 ) ) ( not ( = ?auto_104646 ?auto_104648 ) ) ( not ( = ?auto_104647 ?auto_104648 ) ) ( ON ?auto_104646 ?auto_104647 ) ( ON-TABLE ?auto_104650 ) ( ON ?auto_104649 ?auto_104650 ) ( ON ?auto_104648 ?auto_104649 ) ( not ( = ?auto_104650 ?auto_104649 ) ) ( not ( = ?auto_104650 ?auto_104648 ) ) ( not ( = ?auto_104650 ?auto_104647 ) ) ( not ( = ?auto_104650 ?auto_104646 ) ) ( not ( = ?auto_104649 ?auto_104648 ) ) ( not ( = ?auto_104649 ?auto_104647 ) ) ( not ( = ?auto_104649 ?auto_104646 ) ) ( not ( = ?auto_104643 ?auto_104650 ) ) ( not ( = ?auto_104643 ?auto_104649 ) ) ( not ( = ?auto_104644 ?auto_104650 ) ) ( not ( = ?auto_104644 ?auto_104649 ) ) ( not ( = ?auto_104645 ?auto_104650 ) ) ( not ( = ?auto_104645 ?auto_104649 ) ) ( ON ?auto_104645 ?auto_104646 ) ( CLEAR ?auto_104645 ) ( HOLDING ?auto_104644 ) ( CLEAR ?auto_104643 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_104643 ?auto_104644 )
      ( MAKE-5PILE ?auto_104643 ?auto_104644 ?auto_104645 ?auto_104646 ?auto_104647 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_104651 - BLOCK
      ?auto_104652 - BLOCK
      ?auto_104653 - BLOCK
      ?auto_104654 - BLOCK
      ?auto_104655 - BLOCK
    )
    :vars
    (
      ?auto_104658 - BLOCK
      ?auto_104656 - BLOCK
      ?auto_104657 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_104651 ) ( not ( = ?auto_104651 ?auto_104652 ) ) ( not ( = ?auto_104651 ?auto_104653 ) ) ( not ( = ?auto_104651 ?auto_104654 ) ) ( not ( = ?auto_104651 ?auto_104655 ) ) ( not ( = ?auto_104652 ?auto_104653 ) ) ( not ( = ?auto_104652 ?auto_104654 ) ) ( not ( = ?auto_104652 ?auto_104655 ) ) ( not ( = ?auto_104653 ?auto_104654 ) ) ( not ( = ?auto_104653 ?auto_104655 ) ) ( not ( = ?auto_104654 ?auto_104655 ) ) ( ON ?auto_104655 ?auto_104658 ) ( not ( = ?auto_104651 ?auto_104658 ) ) ( not ( = ?auto_104652 ?auto_104658 ) ) ( not ( = ?auto_104653 ?auto_104658 ) ) ( not ( = ?auto_104654 ?auto_104658 ) ) ( not ( = ?auto_104655 ?auto_104658 ) ) ( ON ?auto_104654 ?auto_104655 ) ( ON-TABLE ?auto_104656 ) ( ON ?auto_104657 ?auto_104656 ) ( ON ?auto_104658 ?auto_104657 ) ( not ( = ?auto_104656 ?auto_104657 ) ) ( not ( = ?auto_104656 ?auto_104658 ) ) ( not ( = ?auto_104656 ?auto_104655 ) ) ( not ( = ?auto_104656 ?auto_104654 ) ) ( not ( = ?auto_104657 ?auto_104658 ) ) ( not ( = ?auto_104657 ?auto_104655 ) ) ( not ( = ?auto_104657 ?auto_104654 ) ) ( not ( = ?auto_104651 ?auto_104656 ) ) ( not ( = ?auto_104651 ?auto_104657 ) ) ( not ( = ?auto_104652 ?auto_104656 ) ) ( not ( = ?auto_104652 ?auto_104657 ) ) ( not ( = ?auto_104653 ?auto_104656 ) ) ( not ( = ?auto_104653 ?auto_104657 ) ) ( ON ?auto_104653 ?auto_104654 ) ( CLEAR ?auto_104651 ) ( ON ?auto_104652 ?auto_104653 ) ( CLEAR ?auto_104652 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_104656 ?auto_104657 ?auto_104658 ?auto_104655 ?auto_104654 ?auto_104653 )
      ( MAKE-5PILE ?auto_104651 ?auto_104652 ?auto_104653 ?auto_104654 ?auto_104655 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_104659 - BLOCK
      ?auto_104660 - BLOCK
      ?auto_104661 - BLOCK
      ?auto_104662 - BLOCK
      ?auto_104663 - BLOCK
    )
    :vars
    (
      ?auto_104665 - BLOCK
      ?auto_104666 - BLOCK
      ?auto_104664 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_104659 ?auto_104660 ) ) ( not ( = ?auto_104659 ?auto_104661 ) ) ( not ( = ?auto_104659 ?auto_104662 ) ) ( not ( = ?auto_104659 ?auto_104663 ) ) ( not ( = ?auto_104660 ?auto_104661 ) ) ( not ( = ?auto_104660 ?auto_104662 ) ) ( not ( = ?auto_104660 ?auto_104663 ) ) ( not ( = ?auto_104661 ?auto_104662 ) ) ( not ( = ?auto_104661 ?auto_104663 ) ) ( not ( = ?auto_104662 ?auto_104663 ) ) ( ON ?auto_104663 ?auto_104665 ) ( not ( = ?auto_104659 ?auto_104665 ) ) ( not ( = ?auto_104660 ?auto_104665 ) ) ( not ( = ?auto_104661 ?auto_104665 ) ) ( not ( = ?auto_104662 ?auto_104665 ) ) ( not ( = ?auto_104663 ?auto_104665 ) ) ( ON ?auto_104662 ?auto_104663 ) ( ON-TABLE ?auto_104666 ) ( ON ?auto_104664 ?auto_104666 ) ( ON ?auto_104665 ?auto_104664 ) ( not ( = ?auto_104666 ?auto_104664 ) ) ( not ( = ?auto_104666 ?auto_104665 ) ) ( not ( = ?auto_104666 ?auto_104663 ) ) ( not ( = ?auto_104666 ?auto_104662 ) ) ( not ( = ?auto_104664 ?auto_104665 ) ) ( not ( = ?auto_104664 ?auto_104663 ) ) ( not ( = ?auto_104664 ?auto_104662 ) ) ( not ( = ?auto_104659 ?auto_104666 ) ) ( not ( = ?auto_104659 ?auto_104664 ) ) ( not ( = ?auto_104660 ?auto_104666 ) ) ( not ( = ?auto_104660 ?auto_104664 ) ) ( not ( = ?auto_104661 ?auto_104666 ) ) ( not ( = ?auto_104661 ?auto_104664 ) ) ( ON ?auto_104661 ?auto_104662 ) ( ON ?auto_104660 ?auto_104661 ) ( CLEAR ?auto_104660 ) ( HOLDING ?auto_104659 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_104659 )
      ( MAKE-5PILE ?auto_104659 ?auto_104660 ?auto_104661 ?auto_104662 ?auto_104663 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_104667 - BLOCK
      ?auto_104668 - BLOCK
      ?auto_104669 - BLOCK
      ?auto_104670 - BLOCK
      ?auto_104671 - BLOCK
    )
    :vars
    (
      ?auto_104672 - BLOCK
      ?auto_104674 - BLOCK
      ?auto_104673 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_104667 ?auto_104668 ) ) ( not ( = ?auto_104667 ?auto_104669 ) ) ( not ( = ?auto_104667 ?auto_104670 ) ) ( not ( = ?auto_104667 ?auto_104671 ) ) ( not ( = ?auto_104668 ?auto_104669 ) ) ( not ( = ?auto_104668 ?auto_104670 ) ) ( not ( = ?auto_104668 ?auto_104671 ) ) ( not ( = ?auto_104669 ?auto_104670 ) ) ( not ( = ?auto_104669 ?auto_104671 ) ) ( not ( = ?auto_104670 ?auto_104671 ) ) ( ON ?auto_104671 ?auto_104672 ) ( not ( = ?auto_104667 ?auto_104672 ) ) ( not ( = ?auto_104668 ?auto_104672 ) ) ( not ( = ?auto_104669 ?auto_104672 ) ) ( not ( = ?auto_104670 ?auto_104672 ) ) ( not ( = ?auto_104671 ?auto_104672 ) ) ( ON ?auto_104670 ?auto_104671 ) ( ON-TABLE ?auto_104674 ) ( ON ?auto_104673 ?auto_104674 ) ( ON ?auto_104672 ?auto_104673 ) ( not ( = ?auto_104674 ?auto_104673 ) ) ( not ( = ?auto_104674 ?auto_104672 ) ) ( not ( = ?auto_104674 ?auto_104671 ) ) ( not ( = ?auto_104674 ?auto_104670 ) ) ( not ( = ?auto_104673 ?auto_104672 ) ) ( not ( = ?auto_104673 ?auto_104671 ) ) ( not ( = ?auto_104673 ?auto_104670 ) ) ( not ( = ?auto_104667 ?auto_104674 ) ) ( not ( = ?auto_104667 ?auto_104673 ) ) ( not ( = ?auto_104668 ?auto_104674 ) ) ( not ( = ?auto_104668 ?auto_104673 ) ) ( not ( = ?auto_104669 ?auto_104674 ) ) ( not ( = ?auto_104669 ?auto_104673 ) ) ( ON ?auto_104669 ?auto_104670 ) ( ON ?auto_104668 ?auto_104669 ) ( ON ?auto_104667 ?auto_104668 ) ( CLEAR ?auto_104667 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_104674 ?auto_104673 ?auto_104672 ?auto_104671 ?auto_104670 ?auto_104669 ?auto_104668 )
      ( MAKE-5PILE ?auto_104667 ?auto_104668 ?auto_104669 ?auto_104670 ?auto_104671 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_104677 - BLOCK
      ?auto_104678 - BLOCK
    )
    :vars
    (
      ?auto_104679 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104679 ?auto_104678 ) ( CLEAR ?auto_104679 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_104677 ) ( ON ?auto_104678 ?auto_104677 ) ( not ( = ?auto_104677 ?auto_104678 ) ) ( not ( = ?auto_104677 ?auto_104679 ) ) ( not ( = ?auto_104678 ?auto_104679 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_104679 ?auto_104678 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_104680 - BLOCK
      ?auto_104681 - BLOCK
    )
    :vars
    (
      ?auto_104682 - BLOCK
      ?auto_104683 - BLOCK
      ?auto_104684 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104682 ?auto_104681 ) ( CLEAR ?auto_104682 ) ( ON-TABLE ?auto_104680 ) ( ON ?auto_104681 ?auto_104680 ) ( not ( = ?auto_104680 ?auto_104681 ) ) ( not ( = ?auto_104680 ?auto_104682 ) ) ( not ( = ?auto_104681 ?auto_104682 ) ) ( HOLDING ?auto_104683 ) ( CLEAR ?auto_104684 ) ( not ( = ?auto_104680 ?auto_104683 ) ) ( not ( = ?auto_104680 ?auto_104684 ) ) ( not ( = ?auto_104681 ?auto_104683 ) ) ( not ( = ?auto_104681 ?auto_104684 ) ) ( not ( = ?auto_104682 ?auto_104683 ) ) ( not ( = ?auto_104682 ?auto_104684 ) ) ( not ( = ?auto_104683 ?auto_104684 ) ) )
    :subtasks
    ( ( !STACK ?auto_104683 ?auto_104684 )
      ( MAKE-2PILE ?auto_104680 ?auto_104681 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_104685 - BLOCK
      ?auto_104686 - BLOCK
    )
    :vars
    (
      ?auto_104688 - BLOCK
      ?auto_104687 - BLOCK
      ?auto_104689 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104688 ?auto_104686 ) ( ON-TABLE ?auto_104685 ) ( ON ?auto_104686 ?auto_104685 ) ( not ( = ?auto_104685 ?auto_104686 ) ) ( not ( = ?auto_104685 ?auto_104688 ) ) ( not ( = ?auto_104686 ?auto_104688 ) ) ( CLEAR ?auto_104687 ) ( not ( = ?auto_104685 ?auto_104689 ) ) ( not ( = ?auto_104685 ?auto_104687 ) ) ( not ( = ?auto_104686 ?auto_104689 ) ) ( not ( = ?auto_104686 ?auto_104687 ) ) ( not ( = ?auto_104688 ?auto_104689 ) ) ( not ( = ?auto_104688 ?auto_104687 ) ) ( not ( = ?auto_104689 ?auto_104687 ) ) ( ON ?auto_104689 ?auto_104688 ) ( CLEAR ?auto_104689 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_104685 ?auto_104686 ?auto_104688 )
      ( MAKE-2PILE ?auto_104685 ?auto_104686 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_104690 - BLOCK
      ?auto_104691 - BLOCK
    )
    :vars
    (
      ?auto_104694 - BLOCK
      ?auto_104693 - BLOCK
      ?auto_104692 - BLOCK
      ?auto_104696 - BLOCK
      ?auto_104697 - BLOCK
      ?auto_104695 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104694 ?auto_104691 ) ( ON-TABLE ?auto_104690 ) ( ON ?auto_104691 ?auto_104690 ) ( not ( = ?auto_104690 ?auto_104691 ) ) ( not ( = ?auto_104690 ?auto_104694 ) ) ( not ( = ?auto_104691 ?auto_104694 ) ) ( not ( = ?auto_104690 ?auto_104693 ) ) ( not ( = ?auto_104690 ?auto_104692 ) ) ( not ( = ?auto_104691 ?auto_104693 ) ) ( not ( = ?auto_104691 ?auto_104692 ) ) ( not ( = ?auto_104694 ?auto_104693 ) ) ( not ( = ?auto_104694 ?auto_104692 ) ) ( not ( = ?auto_104693 ?auto_104692 ) ) ( ON ?auto_104693 ?auto_104694 ) ( CLEAR ?auto_104693 ) ( HOLDING ?auto_104692 ) ( CLEAR ?auto_104696 ) ( ON-TABLE ?auto_104697 ) ( ON ?auto_104695 ?auto_104697 ) ( ON ?auto_104696 ?auto_104695 ) ( not ( = ?auto_104697 ?auto_104695 ) ) ( not ( = ?auto_104697 ?auto_104696 ) ) ( not ( = ?auto_104697 ?auto_104692 ) ) ( not ( = ?auto_104695 ?auto_104696 ) ) ( not ( = ?auto_104695 ?auto_104692 ) ) ( not ( = ?auto_104696 ?auto_104692 ) ) ( not ( = ?auto_104690 ?auto_104696 ) ) ( not ( = ?auto_104690 ?auto_104697 ) ) ( not ( = ?auto_104690 ?auto_104695 ) ) ( not ( = ?auto_104691 ?auto_104696 ) ) ( not ( = ?auto_104691 ?auto_104697 ) ) ( not ( = ?auto_104691 ?auto_104695 ) ) ( not ( = ?auto_104694 ?auto_104696 ) ) ( not ( = ?auto_104694 ?auto_104697 ) ) ( not ( = ?auto_104694 ?auto_104695 ) ) ( not ( = ?auto_104693 ?auto_104696 ) ) ( not ( = ?auto_104693 ?auto_104697 ) ) ( not ( = ?auto_104693 ?auto_104695 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_104697 ?auto_104695 ?auto_104696 ?auto_104692 )
      ( MAKE-2PILE ?auto_104690 ?auto_104691 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_104698 - BLOCK
      ?auto_104699 - BLOCK
    )
    :vars
    (
      ?auto_104702 - BLOCK
      ?auto_104700 - BLOCK
      ?auto_104703 - BLOCK
      ?auto_104705 - BLOCK
      ?auto_104704 - BLOCK
      ?auto_104701 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104702 ?auto_104699 ) ( ON-TABLE ?auto_104698 ) ( ON ?auto_104699 ?auto_104698 ) ( not ( = ?auto_104698 ?auto_104699 ) ) ( not ( = ?auto_104698 ?auto_104702 ) ) ( not ( = ?auto_104699 ?auto_104702 ) ) ( not ( = ?auto_104698 ?auto_104700 ) ) ( not ( = ?auto_104698 ?auto_104703 ) ) ( not ( = ?auto_104699 ?auto_104700 ) ) ( not ( = ?auto_104699 ?auto_104703 ) ) ( not ( = ?auto_104702 ?auto_104700 ) ) ( not ( = ?auto_104702 ?auto_104703 ) ) ( not ( = ?auto_104700 ?auto_104703 ) ) ( ON ?auto_104700 ?auto_104702 ) ( CLEAR ?auto_104705 ) ( ON-TABLE ?auto_104704 ) ( ON ?auto_104701 ?auto_104704 ) ( ON ?auto_104705 ?auto_104701 ) ( not ( = ?auto_104704 ?auto_104701 ) ) ( not ( = ?auto_104704 ?auto_104705 ) ) ( not ( = ?auto_104704 ?auto_104703 ) ) ( not ( = ?auto_104701 ?auto_104705 ) ) ( not ( = ?auto_104701 ?auto_104703 ) ) ( not ( = ?auto_104705 ?auto_104703 ) ) ( not ( = ?auto_104698 ?auto_104705 ) ) ( not ( = ?auto_104698 ?auto_104704 ) ) ( not ( = ?auto_104698 ?auto_104701 ) ) ( not ( = ?auto_104699 ?auto_104705 ) ) ( not ( = ?auto_104699 ?auto_104704 ) ) ( not ( = ?auto_104699 ?auto_104701 ) ) ( not ( = ?auto_104702 ?auto_104705 ) ) ( not ( = ?auto_104702 ?auto_104704 ) ) ( not ( = ?auto_104702 ?auto_104701 ) ) ( not ( = ?auto_104700 ?auto_104705 ) ) ( not ( = ?auto_104700 ?auto_104704 ) ) ( not ( = ?auto_104700 ?auto_104701 ) ) ( ON ?auto_104703 ?auto_104700 ) ( CLEAR ?auto_104703 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_104698 ?auto_104699 ?auto_104702 ?auto_104700 )
      ( MAKE-2PILE ?auto_104698 ?auto_104699 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_104706 - BLOCK
      ?auto_104707 - BLOCK
    )
    :vars
    (
      ?auto_104711 - BLOCK
      ?auto_104708 - BLOCK
      ?auto_104710 - BLOCK
      ?auto_104713 - BLOCK
      ?auto_104712 - BLOCK
      ?auto_104709 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104711 ?auto_104707 ) ( ON-TABLE ?auto_104706 ) ( ON ?auto_104707 ?auto_104706 ) ( not ( = ?auto_104706 ?auto_104707 ) ) ( not ( = ?auto_104706 ?auto_104711 ) ) ( not ( = ?auto_104707 ?auto_104711 ) ) ( not ( = ?auto_104706 ?auto_104708 ) ) ( not ( = ?auto_104706 ?auto_104710 ) ) ( not ( = ?auto_104707 ?auto_104708 ) ) ( not ( = ?auto_104707 ?auto_104710 ) ) ( not ( = ?auto_104711 ?auto_104708 ) ) ( not ( = ?auto_104711 ?auto_104710 ) ) ( not ( = ?auto_104708 ?auto_104710 ) ) ( ON ?auto_104708 ?auto_104711 ) ( ON-TABLE ?auto_104713 ) ( ON ?auto_104712 ?auto_104713 ) ( not ( = ?auto_104713 ?auto_104712 ) ) ( not ( = ?auto_104713 ?auto_104709 ) ) ( not ( = ?auto_104713 ?auto_104710 ) ) ( not ( = ?auto_104712 ?auto_104709 ) ) ( not ( = ?auto_104712 ?auto_104710 ) ) ( not ( = ?auto_104709 ?auto_104710 ) ) ( not ( = ?auto_104706 ?auto_104709 ) ) ( not ( = ?auto_104706 ?auto_104713 ) ) ( not ( = ?auto_104706 ?auto_104712 ) ) ( not ( = ?auto_104707 ?auto_104709 ) ) ( not ( = ?auto_104707 ?auto_104713 ) ) ( not ( = ?auto_104707 ?auto_104712 ) ) ( not ( = ?auto_104711 ?auto_104709 ) ) ( not ( = ?auto_104711 ?auto_104713 ) ) ( not ( = ?auto_104711 ?auto_104712 ) ) ( not ( = ?auto_104708 ?auto_104709 ) ) ( not ( = ?auto_104708 ?auto_104713 ) ) ( not ( = ?auto_104708 ?auto_104712 ) ) ( ON ?auto_104710 ?auto_104708 ) ( CLEAR ?auto_104710 ) ( HOLDING ?auto_104709 ) ( CLEAR ?auto_104712 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_104713 ?auto_104712 ?auto_104709 )
      ( MAKE-2PILE ?auto_104706 ?auto_104707 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_104714 - BLOCK
      ?auto_104715 - BLOCK
    )
    :vars
    (
      ?auto_104716 - BLOCK
      ?auto_104719 - BLOCK
      ?auto_104717 - BLOCK
      ?auto_104720 - BLOCK
      ?auto_104718 - BLOCK
      ?auto_104721 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104716 ?auto_104715 ) ( ON-TABLE ?auto_104714 ) ( ON ?auto_104715 ?auto_104714 ) ( not ( = ?auto_104714 ?auto_104715 ) ) ( not ( = ?auto_104714 ?auto_104716 ) ) ( not ( = ?auto_104715 ?auto_104716 ) ) ( not ( = ?auto_104714 ?auto_104719 ) ) ( not ( = ?auto_104714 ?auto_104717 ) ) ( not ( = ?auto_104715 ?auto_104719 ) ) ( not ( = ?auto_104715 ?auto_104717 ) ) ( not ( = ?auto_104716 ?auto_104719 ) ) ( not ( = ?auto_104716 ?auto_104717 ) ) ( not ( = ?auto_104719 ?auto_104717 ) ) ( ON ?auto_104719 ?auto_104716 ) ( ON-TABLE ?auto_104720 ) ( ON ?auto_104718 ?auto_104720 ) ( not ( = ?auto_104720 ?auto_104718 ) ) ( not ( = ?auto_104720 ?auto_104721 ) ) ( not ( = ?auto_104720 ?auto_104717 ) ) ( not ( = ?auto_104718 ?auto_104721 ) ) ( not ( = ?auto_104718 ?auto_104717 ) ) ( not ( = ?auto_104721 ?auto_104717 ) ) ( not ( = ?auto_104714 ?auto_104721 ) ) ( not ( = ?auto_104714 ?auto_104720 ) ) ( not ( = ?auto_104714 ?auto_104718 ) ) ( not ( = ?auto_104715 ?auto_104721 ) ) ( not ( = ?auto_104715 ?auto_104720 ) ) ( not ( = ?auto_104715 ?auto_104718 ) ) ( not ( = ?auto_104716 ?auto_104721 ) ) ( not ( = ?auto_104716 ?auto_104720 ) ) ( not ( = ?auto_104716 ?auto_104718 ) ) ( not ( = ?auto_104719 ?auto_104721 ) ) ( not ( = ?auto_104719 ?auto_104720 ) ) ( not ( = ?auto_104719 ?auto_104718 ) ) ( ON ?auto_104717 ?auto_104719 ) ( CLEAR ?auto_104718 ) ( ON ?auto_104721 ?auto_104717 ) ( CLEAR ?auto_104721 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_104714 ?auto_104715 ?auto_104716 ?auto_104719 ?auto_104717 )
      ( MAKE-2PILE ?auto_104714 ?auto_104715 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_104722 - BLOCK
      ?auto_104723 - BLOCK
    )
    :vars
    (
      ?auto_104726 - BLOCK
      ?auto_104728 - BLOCK
      ?auto_104727 - BLOCK
      ?auto_104729 - BLOCK
      ?auto_104725 - BLOCK
      ?auto_104724 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104726 ?auto_104723 ) ( ON-TABLE ?auto_104722 ) ( ON ?auto_104723 ?auto_104722 ) ( not ( = ?auto_104722 ?auto_104723 ) ) ( not ( = ?auto_104722 ?auto_104726 ) ) ( not ( = ?auto_104723 ?auto_104726 ) ) ( not ( = ?auto_104722 ?auto_104728 ) ) ( not ( = ?auto_104722 ?auto_104727 ) ) ( not ( = ?auto_104723 ?auto_104728 ) ) ( not ( = ?auto_104723 ?auto_104727 ) ) ( not ( = ?auto_104726 ?auto_104728 ) ) ( not ( = ?auto_104726 ?auto_104727 ) ) ( not ( = ?auto_104728 ?auto_104727 ) ) ( ON ?auto_104728 ?auto_104726 ) ( ON-TABLE ?auto_104729 ) ( not ( = ?auto_104729 ?auto_104725 ) ) ( not ( = ?auto_104729 ?auto_104724 ) ) ( not ( = ?auto_104729 ?auto_104727 ) ) ( not ( = ?auto_104725 ?auto_104724 ) ) ( not ( = ?auto_104725 ?auto_104727 ) ) ( not ( = ?auto_104724 ?auto_104727 ) ) ( not ( = ?auto_104722 ?auto_104724 ) ) ( not ( = ?auto_104722 ?auto_104729 ) ) ( not ( = ?auto_104722 ?auto_104725 ) ) ( not ( = ?auto_104723 ?auto_104724 ) ) ( not ( = ?auto_104723 ?auto_104729 ) ) ( not ( = ?auto_104723 ?auto_104725 ) ) ( not ( = ?auto_104726 ?auto_104724 ) ) ( not ( = ?auto_104726 ?auto_104729 ) ) ( not ( = ?auto_104726 ?auto_104725 ) ) ( not ( = ?auto_104728 ?auto_104724 ) ) ( not ( = ?auto_104728 ?auto_104729 ) ) ( not ( = ?auto_104728 ?auto_104725 ) ) ( ON ?auto_104727 ?auto_104728 ) ( ON ?auto_104724 ?auto_104727 ) ( CLEAR ?auto_104724 ) ( HOLDING ?auto_104725 ) ( CLEAR ?auto_104729 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_104729 ?auto_104725 )
      ( MAKE-2PILE ?auto_104722 ?auto_104723 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_106023 - BLOCK
      ?auto_106024 - BLOCK
    )
    :vars
    (
      ?auto_106027 - BLOCK
      ?auto_106026 - BLOCK
      ?auto_106028 - BLOCK
      ?auto_106025 - BLOCK
      ?auto_106029 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106027 ?auto_106024 ) ( ON-TABLE ?auto_106023 ) ( ON ?auto_106024 ?auto_106023 ) ( not ( = ?auto_106023 ?auto_106024 ) ) ( not ( = ?auto_106023 ?auto_106027 ) ) ( not ( = ?auto_106024 ?auto_106027 ) ) ( not ( = ?auto_106023 ?auto_106026 ) ) ( not ( = ?auto_106023 ?auto_106028 ) ) ( not ( = ?auto_106024 ?auto_106026 ) ) ( not ( = ?auto_106024 ?auto_106028 ) ) ( not ( = ?auto_106027 ?auto_106026 ) ) ( not ( = ?auto_106027 ?auto_106028 ) ) ( not ( = ?auto_106026 ?auto_106028 ) ) ( ON ?auto_106026 ?auto_106027 ) ( not ( = ?auto_106025 ?auto_106029 ) ) ( not ( = ?auto_106025 ?auto_106028 ) ) ( not ( = ?auto_106029 ?auto_106028 ) ) ( not ( = ?auto_106023 ?auto_106029 ) ) ( not ( = ?auto_106023 ?auto_106025 ) ) ( not ( = ?auto_106024 ?auto_106029 ) ) ( not ( = ?auto_106024 ?auto_106025 ) ) ( not ( = ?auto_106027 ?auto_106029 ) ) ( not ( = ?auto_106027 ?auto_106025 ) ) ( not ( = ?auto_106026 ?auto_106029 ) ) ( not ( = ?auto_106026 ?auto_106025 ) ) ( ON ?auto_106028 ?auto_106026 ) ( ON ?auto_106029 ?auto_106028 ) ( ON ?auto_106025 ?auto_106029 ) ( CLEAR ?auto_106025 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_106023 ?auto_106024 ?auto_106027 ?auto_106026 ?auto_106028 ?auto_106029 )
      ( MAKE-2PILE ?auto_106023 ?auto_106024 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_104738 - BLOCK
      ?auto_104739 - BLOCK
    )
    :vars
    (
      ?auto_104743 - BLOCK
      ?auto_104744 - BLOCK
      ?auto_104745 - BLOCK
      ?auto_104742 - BLOCK
      ?auto_104741 - BLOCK
      ?auto_104740 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104743 ?auto_104739 ) ( ON-TABLE ?auto_104738 ) ( ON ?auto_104739 ?auto_104738 ) ( not ( = ?auto_104738 ?auto_104739 ) ) ( not ( = ?auto_104738 ?auto_104743 ) ) ( not ( = ?auto_104739 ?auto_104743 ) ) ( not ( = ?auto_104738 ?auto_104744 ) ) ( not ( = ?auto_104738 ?auto_104745 ) ) ( not ( = ?auto_104739 ?auto_104744 ) ) ( not ( = ?auto_104739 ?auto_104745 ) ) ( not ( = ?auto_104743 ?auto_104744 ) ) ( not ( = ?auto_104743 ?auto_104745 ) ) ( not ( = ?auto_104744 ?auto_104745 ) ) ( ON ?auto_104744 ?auto_104743 ) ( not ( = ?auto_104742 ?auto_104741 ) ) ( not ( = ?auto_104742 ?auto_104740 ) ) ( not ( = ?auto_104742 ?auto_104745 ) ) ( not ( = ?auto_104741 ?auto_104740 ) ) ( not ( = ?auto_104741 ?auto_104745 ) ) ( not ( = ?auto_104740 ?auto_104745 ) ) ( not ( = ?auto_104738 ?auto_104740 ) ) ( not ( = ?auto_104738 ?auto_104742 ) ) ( not ( = ?auto_104738 ?auto_104741 ) ) ( not ( = ?auto_104739 ?auto_104740 ) ) ( not ( = ?auto_104739 ?auto_104742 ) ) ( not ( = ?auto_104739 ?auto_104741 ) ) ( not ( = ?auto_104743 ?auto_104740 ) ) ( not ( = ?auto_104743 ?auto_104742 ) ) ( not ( = ?auto_104743 ?auto_104741 ) ) ( not ( = ?auto_104744 ?auto_104740 ) ) ( not ( = ?auto_104744 ?auto_104742 ) ) ( not ( = ?auto_104744 ?auto_104741 ) ) ( ON ?auto_104745 ?auto_104744 ) ( ON ?auto_104740 ?auto_104745 ) ( ON ?auto_104741 ?auto_104740 ) ( CLEAR ?auto_104741 ) ( HOLDING ?auto_104742 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_104742 )
      ( MAKE-2PILE ?auto_104738 ?auto_104739 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_104746 - BLOCK
      ?auto_104747 - BLOCK
    )
    :vars
    (
      ?auto_104748 - BLOCK
      ?auto_104752 - BLOCK
      ?auto_104750 - BLOCK
      ?auto_104751 - BLOCK
      ?auto_104749 - BLOCK
      ?auto_104753 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104748 ?auto_104747 ) ( ON-TABLE ?auto_104746 ) ( ON ?auto_104747 ?auto_104746 ) ( not ( = ?auto_104746 ?auto_104747 ) ) ( not ( = ?auto_104746 ?auto_104748 ) ) ( not ( = ?auto_104747 ?auto_104748 ) ) ( not ( = ?auto_104746 ?auto_104752 ) ) ( not ( = ?auto_104746 ?auto_104750 ) ) ( not ( = ?auto_104747 ?auto_104752 ) ) ( not ( = ?auto_104747 ?auto_104750 ) ) ( not ( = ?auto_104748 ?auto_104752 ) ) ( not ( = ?auto_104748 ?auto_104750 ) ) ( not ( = ?auto_104752 ?auto_104750 ) ) ( ON ?auto_104752 ?auto_104748 ) ( not ( = ?auto_104751 ?auto_104749 ) ) ( not ( = ?auto_104751 ?auto_104753 ) ) ( not ( = ?auto_104751 ?auto_104750 ) ) ( not ( = ?auto_104749 ?auto_104753 ) ) ( not ( = ?auto_104749 ?auto_104750 ) ) ( not ( = ?auto_104753 ?auto_104750 ) ) ( not ( = ?auto_104746 ?auto_104753 ) ) ( not ( = ?auto_104746 ?auto_104751 ) ) ( not ( = ?auto_104746 ?auto_104749 ) ) ( not ( = ?auto_104747 ?auto_104753 ) ) ( not ( = ?auto_104747 ?auto_104751 ) ) ( not ( = ?auto_104747 ?auto_104749 ) ) ( not ( = ?auto_104748 ?auto_104753 ) ) ( not ( = ?auto_104748 ?auto_104751 ) ) ( not ( = ?auto_104748 ?auto_104749 ) ) ( not ( = ?auto_104752 ?auto_104753 ) ) ( not ( = ?auto_104752 ?auto_104751 ) ) ( not ( = ?auto_104752 ?auto_104749 ) ) ( ON ?auto_104750 ?auto_104752 ) ( ON ?auto_104753 ?auto_104750 ) ( ON ?auto_104749 ?auto_104753 ) ( ON ?auto_104751 ?auto_104749 ) ( CLEAR ?auto_104751 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_104746 ?auto_104747 ?auto_104748 ?auto_104752 ?auto_104750 ?auto_104753 ?auto_104749 )
      ( MAKE-2PILE ?auto_104746 ?auto_104747 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_104760 - BLOCK
      ?auto_104761 - BLOCK
      ?auto_104762 - BLOCK
      ?auto_104763 - BLOCK
      ?auto_104764 - BLOCK
      ?auto_104765 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_104765 ) ( CLEAR ?auto_104764 ) ( ON-TABLE ?auto_104760 ) ( ON ?auto_104761 ?auto_104760 ) ( ON ?auto_104762 ?auto_104761 ) ( ON ?auto_104763 ?auto_104762 ) ( ON ?auto_104764 ?auto_104763 ) ( not ( = ?auto_104760 ?auto_104761 ) ) ( not ( = ?auto_104760 ?auto_104762 ) ) ( not ( = ?auto_104760 ?auto_104763 ) ) ( not ( = ?auto_104760 ?auto_104764 ) ) ( not ( = ?auto_104760 ?auto_104765 ) ) ( not ( = ?auto_104761 ?auto_104762 ) ) ( not ( = ?auto_104761 ?auto_104763 ) ) ( not ( = ?auto_104761 ?auto_104764 ) ) ( not ( = ?auto_104761 ?auto_104765 ) ) ( not ( = ?auto_104762 ?auto_104763 ) ) ( not ( = ?auto_104762 ?auto_104764 ) ) ( not ( = ?auto_104762 ?auto_104765 ) ) ( not ( = ?auto_104763 ?auto_104764 ) ) ( not ( = ?auto_104763 ?auto_104765 ) ) ( not ( = ?auto_104764 ?auto_104765 ) ) )
    :subtasks
    ( ( !STACK ?auto_104765 ?auto_104764 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_104766 - BLOCK
      ?auto_104767 - BLOCK
      ?auto_104768 - BLOCK
      ?auto_104769 - BLOCK
      ?auto_104770 - BLOCK
      ?auto_104771 - BLOCK
    )
    :vars
    (
      ?auto_104772 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_104770 ) ( ON-TABLE ?auto_104766 ) ( ON ?auto_104767 ?auto_104766 ) ( ON ?auto_104768 ?auto_104767 ) ( ON ?auto_104769 ?auto_104768 ) ( ON ?auto_104770 ?auto_104769 ) ( not ( = ?auto_104766 ?auto_104767 ) ) ( not ( = ?auto_104766 ?auto_104768 ) ) ( not ( = ?auto_104766 ?auto_104769 ) ) ( not ( = ?auto_104766 ?auto_104770 ) ) ( not ( = ?auto_104766 ?auto_104771 ) ) ( not ( = ?auto_104767 ?auto_104768 ) ) ( not ( = ?auto_104767 ?auto_104769 ) ) ( not ( = ?auto_104767 ?auto_104770 ) ) ( not ( = ?auto_104767 ?auto_104771 ) ) ( not ( = ?auto_104768 ?auto_104769 ) ) ( not ( = ?auto_104768 ?auto_104770 ) ) ( not ( = ?auto_104768 ?auto_104771 ) ) ( not ( = ?auto_104769 ?auto_104770 ) ) ( not ( = ?auto_104769 ?auto_104771 ) ) ( not ( = ?auto_104770 ?auto_104771 ) ) ( ON ?auto_104771 ?auto_104772 ) ( CLEAR ?auto_104771 ) ( HAND-EMPTY ) ( not ( = ?auto_104766 ?auto_104772 ) ) ( not ( = ?auto_104767 ?auto_104772 ) ) ( not ( = ?auto_104768 ?auto_104772 ) ) ( not ( = ?auto_104769 ?auto_104772 ) ) ( not ( = ?auto_104770 ?auto_104772 ) ) ( not ( = ?auto_104771 ?auto_104772 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_104771 ?auto_104772 )
      ( MAKE-6PILE ?auto_104766 ?auto_104767 ?auto_104768 ?auto_104769 ?auto_104770 ?auto_104771 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_104773 - BLOCK
      ?auto_104774 - BLOCK
      ?auto_104775 - BLOCK
      ?auto_104776 - BLOCK
      ?auto_104777 - BLOCK
      ?auto_104778 - BLOCK
    )
    :vars
    (
      ?auto_104779 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_104773 ) ( ON ?auto_104774 ?auto_104773 ) ( ON ?auto_104775 ?auto_104774 ) ( ON ?auto_104776 ?auto_104775 ) ( not ( = ?auto_104773 ?auto_104774 ) ) ( not ( = ?auto_104773 ?auto_104775 ) ) ( not ( = ?auto_104773 ?auto_104776 ) ) ( not ( = ?auto_104773 ?auto_104777 ) ) ( not ( = ?auto_104773 ?auto_104778 ) ) ( not ( = ?auto_104774 ?auto_104775 ) ) ( not ( = ?auto_104774 ?auto_104776 ) ) ( not ( = ?auto_104774 ?auto_104777 ) ) ( not ( = ?auto_104774 ?auto_104778 ) ) ( not ( = ?auto_104775 ?auto_104776 ) ) ( not ( = ?auto_104775 ?auto_104777 ) ) ( not ( = ?auto_104775 ?auto_104778 ) ) ( not ( = ?auto_104776 ?auto_104777 ) ) ( not ( = ?auto_104776 ?auto_104778 ) ) ( not ( = ?auto_104777 ?auto_104778 ) ) ( ON ?auto_104778 ?auto_104779 ) ( CLEAR ?auto_104778 ) ( not ( = ?auto_104773 ?auto_104779 ) ) ( not ( = ?auto_104774 ?auto_104779 ) ) ( not ( = ?auto_104775 ?auto_104779 ) ) ( not ( = ?auto_104776 ?auto_104779 ) ) ( not ( = ?auto_104777 ?auto_104779 ) ) ( not ( = ?auto_104778 ?auto_104779 ) ) ( HOLDING ?auto_104777 ) ( CLEAR ?auto_104776 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_104773 ?auto_104774 ?auto_104775 ?auto_104776 ?auto_104777 )
      ( MAKE-6PILE ?auto_104773 ?auto_104774 ?auto_104775 ?auto_104776 ?auto_104777 ?auto_104778 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_104780 - BLOCK
      ?auto_104781 - BLOCK
      ?auto_104782 - BLOCK
      ?auto_104783 - BLOCK
      ?auto_104784 - BLOCK
      ?auto_104785 - BLOCK
    )
    :vars
    (
      ?auto_104786 - BLOCK
      ?auto_104787 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_104780 ) ( ON ?auto_104781 ?auto_104780 ) ( ON ?auto_104782 ?auto_104781 ) ( ON ?auto_104783 ?auto_104782 ) ( not ( = ?auto_104780 ?auto_104781 ) ) ( not ( = ?auto_104780 ?auto_104782 ) ) ( not ( = ?auto_104780 ?auto_104783 ) ) ( not ( = ?auto_104780 ?auto_104784 ) ) ( not ( = ?auto_104780 ?auto_104785 ) ) ( not ( = ?auto_104781 ?auto_104782 ) ) ( not ( = ?auto_104781 ?auto_104783 ) ) ( not ( = ?auto_104781 ?auto_104784 ) ) ( not ( = ?auto_104781 ?auto_104785 ) ) ( not ( = ?auto_104782 ?auto_104783 ) ) ( not ( = ?auto_104782 ?auto_104784 ) ) ( not ( = ?auto_104782 ?auto_104785 ) ) ( not ( = ?auto_104783 ?auto_104784 ) ) ( not ( = ?auto_104783 ?auto_104785 ) ) ( not ( = ?auto_104784 ?auto_104785 ) ) ( ON ?auto_104785 ?auto_104786 ) ( not ( = ?auto_104780 ?auto_104786 ) ) ( not ( = ?auto_104781 ?auto_104786 ) ) ( not ( = ?auto_104782 ?auto_104786 ) ) ( not ( = ?auto_104783 ?auto_104786 ) ) ( not ( = ?auto_104784 ?auto_104786 ) ) ( not ( = ?auto_104785 ?auto_104786 ) ) ( CLEAR ?auto_104783 ) ( ON ?auto_104784 ?auto_104785 ) ( CLEAR ?auto_104784 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_104787 ) ( ON ?auto_104786 ?auto_104787 ) ( not ( = ?auto_104787 ?auto_104786 ) ) ( not ( = ?auto_104787 ?auto_104785 ) ) ( not ( = ?auto_104787 ?auto_104784 ) ) ( not ( = ?auto_104780 ?auto_104787 ) ) ( not ( = ?auto_104781 ?auto_104787 ) ) ( not ( = ?auto_104782 ?auto_104787 ) ) ( not ( = ?auto_104783 ?auto_104787 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_104787 ?auto_104786 ?auto_104785 )
      ( MAKE-6PILE ?auto_104780 ?auto_104781 ?auto_104782 ?auto_104783 ?auto_104784 ?auto_104785 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_104788 - BLOCK
      ?auto_104789 - BLOCK
      ?auto_104790 - BLOCK
      ?auto_104791 - BLOCK
      ?auto_104792 - BLOCK
      ?auto_104793 - BLOCK
    )
    :vars
    (
      ?auto_104794 - BLOCK
      ?auto_104795 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_104788 ) ( ON ?auto_104789 ?auto_104788 ) ( ON ?auto_104790 ?auto_104789 ) ( not ( = ?auto_104788 ?auto_104789 ) ) ( not ( = ?auto_104788 ?auto_104790 ) ) ( not ( = ?auto_104788 ?auto_104791 ) ) ( not ( = ?auto_104788 ?auto_104792 ) ) ( not ( = ?auto_104788 ?auto_104793 ) ) ( not ( = ?auto_104789 ?auto_104790 ) ) ( not ( = ?auto_104789 ?auto_104791 ) ) ( not ( = ?auto_104789 ?auto_104792 ) ) ( not ( = ?auto_104789 ?auto_104793 ) ) ( not ( = ?auto_104790 ?auto_104791 ) ) ( not ( = ?auto_104790 ?auto_104792 ) ) ( not ( = ?auto_104790 ?auto_104793 ) ) ( not ( = ?auto_104791 ?auto_104792 ) ) ( not ( = ?auto_104791 ?auto_104793 ) ) ( not ( = ?auto_104792 ?auto_104793 ) ) ( ON ?auto_104793 ?auto_104794 ) ( not ( = ?auto_104788 ?auto_104794 ) ) ( not ( = ?auto_104789 ?auto_104794 ) ) ( not ( = ?auto_104790 ?auto_104794 ) ) ( not ( = ?auto_104791 ?auto_104794 ) ) ( not ( = ?auto_104792 ?auto_104794 ) ) ( not ( = ?auto_104793 ?auto_104794 ) ) ( ON ?auto_104792 ?auto_104793 ) ( CLEAR ?auto_104792 ) ( ON-TABLE ?auto_104795 ) ( ON ?auto_104794 ?auto_104795 ) ( not ( = ?auto_104795 ?auto_104794 ) ) ( not ( = ?auto_104795 ?auto_104793 ) ) ( not ( = ?auto_104795 ?auto_104792 ) ) ( not ( = ?auto_104788 ?auto_104795 ) ) ( not ( = ?auto_104789 ?auto_104795 ) ) ( not ( = ?auto_104790 ?auto_104795 ) ) ( not ( = ?auto_104791 ?auto_104795 ) ) ( HOLDING ?auto_104791 ) ( CLEAR ?auto_104790 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_104788 ?auto_104789 ?auto_104790 ?auto_104791 )
      ( MAKE-6PILE ?auto_104788 ?auto_104789 ?auto_104790 ?auto_104791 ?auto_104792 ?auto_104793 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_104796 - BLOCK
      ?auto_104797 - BLOCK
      ?auto_104798 - BLOCK
      ?auto_104799 - BLOCK
      ?auto_104800 - BLOCK
      ?auto_104801 - BLOCK
    )
    :vars
    (
      ?auto_104803 - BLOCK
      ?auto_104802 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_104796 ) ( ON ?auto_104797 ?auto_104796 ) ( ON ?auto_104798 ?auto_104797 ) ( not ( = ?auto_104796 ?auto_104797 ) ) ( not ( = ?auto_104796 ?auto_104798 ) ) ( not ( = ?auto_104796 ?auto_104799 ) ) ( not ( = ?auto_104796 ?auto_104800 ) ) ( not ( = ?auto_104796 ?auto_104801 ) ) ( not ( = ?auto_104797 ?auto_104798 ) ) ( not ( = ?auto_104797 ?auto_104799 ) ) ( not ( = ?auto_104797 ?auto_104800 ) ) ( not ( = ?auto_104797 ?auto_104801 ) ) ( not ( = ?auto_104798 ?auto_104799 ) ) ( not ( = ?auto_104798 ?auto_104800 ) ) ( not ( = ?auto_104798 ?auto_104801 ) ) ( not ( = ?auto_104799 ?auto_104800 ) ) ( not ( = ?auto_104799 ?auto_104801 ) ) ( not ( = ?auto_104800 ?auto_104801 ) ) ( ON ?auto_104801 ?auto_104803 ) ( not ( = ?auto_104796 ?auto_104803 ) ) ( not ( = ?auto_104797 ?auto_104803 ) ) ( not ( = ?auto_104798 ?auto_104803 ) ) ( not ( = ?auto_104799 ?auto_104803 ) ) ( not ( = ?auto_104800 ?auto_104803 ) ) ( not ( = ?auto_104801 ?auto_104803 ) ) ( ON ?auto_104800 ?auto_104801 ) ( ON-TABLE ?auto_104802 ) ( ON ?auto_104803 ?auto_104802 ) ( not ( = ?auto_104802 ?auto_104803 ) ) ( not ( = ?auto_104802 ?auto_104801 ) ) ( not ( = ?auto_104802 ?auto_104800 ) ) ( not ( = ?auto_104796 ?auto_104802 ) ) ( not ( = ?auto_104797 ?auto_104802 ) ) ( not ( = ?auto_104798 ?auto_104802 ) ) ( not ( = ?auto_104799 ?auto_104802 ) ) ( CLEAR ?auto_104798 ) ( ON ?auto_104799 ?auto_104800 ) ( CLEAR ?auto_104799 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_104802 ?auto_104803 ?auto_104801 ?auto_104800 )
      ( MAKE-6PILE ?auto_104796 ?auto_104797 ?auto_104798 ?auto_104799 ?auto_104800 ?auto_104801 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_104804 - BLOCK
      ?auto_104805 - BLOCK
      ?auto_104806 - BLOCK
      ?auto_104807 - BLOCK
      ?auto_104808 - BLOCK
      ?auto_104809 - BLOCK
    )
    :vars
    (
      ?auto_104811 - BLOCK
      ?auto_104810 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_104804 ) ( ON ?auto_104805 ?auto_104804 ) ( not ( = ?auto_104804 ?auto_104805 ) ) ( not ( = ?auto_104804 ?auto_104806 ) ) ( not ( = ?auto_104804 ?auto_104807 ) ) ( not ( = ?auto_104804 ?auto_104808 ) ) ( not ( = ?auto_104804 ?auto_104809 ) ) ( not ( = ?auto_104805 ?auto_104806 ) ) ( not ( = ?auto_104805 ?auto_104807 ) ) ( not ( = ?auto_104805 ?auto_104808 ) ) ( not ( = ?auto_104805 ?auto_104809 ) ) ( not ( = ?auto_104806 ?auto_104807 ) ) ( not ( = ?auto_104806 ?auto_104808 ) ) ( not ( = ?auto_104806 ?auto_104809 ) ) ( not ( = ?auto_104807 ?auto_104808 ) ) ( not ( = ?auto_104807 ?auto_104809 ) ) ( not ( = ?auto_104808 ?auto_104809 ) ) ( ON ?auto_104809 ?auto_104811 ) ( not ( = ?auto_104804 ?auto_104811 ) ) ( not ( = ?auto_104805 ?auto_104811 ) ) ( not ( = ?auto_104806 ?auto_104811 ) ) ( not ( = ?auto_104807 ?auto_104811 ) ) ( not ( = ?auto_104808 ?auto_104811 ) ) ( not ( = ?auto_104809 ?auto_104811 ) ) ( ON ?auto_104808 ?auto_104809 ) ( ON-TABLE ?auto_104810 ) ( ON ?auto_104811 ?auto_104810 ) ( not ( = ?auto_104810 ?auto_104811 ) ) ( not ( = ?auto_104810 ?auto_104809 ) ) ( not ( = ?auto_104810 ?auto_104808 ) ) ( not ( = ?auto_104804 ?auto_104810 ) ) ( not ( = ?auto_104805 ?auto_104810 ) ) ( not ( = ?auto_104806 ?auto_104810 ) ) ( not ( = ?auto_104807 ?auto_104810 ) ) ( ON ?auto_104807 ?auto_104808 ) ( CLEAR ?auto_104807 ) ( HOLDING ?auto_104806 ) ( CLEAR ?auto_104805 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_104804 ?auto_104805 ?auto_104806 )
      ( MAKE-6PILE ?auto_104804 ?auto_104805 ?auto_104806 ?auto_104807 ?auto_104808 ?auto_104809 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_104812 - BLOCK
      ?auto_104813 - BLOCK
      ?auto_104814 - BLOCK
      ?auto_104815 - BLOCK
      ?auto_104816 - BLOCK
      ?auto_104817 - BLOCK
    )
    :vars
    (
      ?auto_104818 - BLOCK
      ?auto_104819 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_104812 ) ( ON ?auto_104813 ?auto_104812 ) ( not ( = ?auto_104812 ?auto_104813 ) ) ( not ( = ?auto_104812 ?auto_104814 ) ) ( not ( = ?auto_104812 ?auto_104815 ) ) ( not ( = ?auto_104812 ?auto_104816 ) ) ( not ( = ?auto_104812 ?auto_104817 ) ) ( not ( = ?auto_104813 ?auto_104814 ) ) ( not ( = ?auto_104813 ?auto_104815 ) ) ( not ( = ?auto_104813 ?auto_104816 ) ) ( not ( = ?auto_104813 ?auto_104817 ) ) ( not ( = ?auto_104814 ?auto_104815 ) ) ( not ( = ?auto_104814 ?auto_104816 ) ) ( not ( = ?auto_104814 ?auto_104817 ) ) ( not ( = ?auto_104815 ?auto_104816 ) ) ( not ( = ?auto_104815 ?auto_104817 ) ) ( not ( = ?auto_104816 ?auto_104817 ) ) ( ON ?auto_104817 ?auto_104818 ) ( not ( = ?auto_104812 ?auto_104818 ) ) ( not ( = ?auto_104813 ?auto_104818 ) ) ( not ( = ?auto_104814 ?auto_104818 ) ) ( not ( = ?auto_104815 ?auto_104818 ) ) ( not ( = ?auto_104816 ?auto_104818 ) ) ( not ( = ?auto_104817 ?auto_104818 ) ) ( ON ?auto_104816 ?auto_104817 ) ( ON-TABLE ?auto_104819 ) ( ON ?auto_104818 ?auto_104819 ) ( not ( = ?auto_104819 ?auto_104818 ) ) ( not ( = ?auto_104819 ?auto_104817 ) ) ( not ( = ?auto_104819 ?auto_104816 ) ) ( not ( = ?auto_104812 ?auto_104819 ) ) ( not ( = ?auto_104813 ?auto_104819 ) ) ( not ( = ?auto_104814 ?auto_104819 ) ) ( not ( = ?auto_104815 ?auto_104819 ) ) ( ON ?auto_104815 ?auto_104816 ) ( CLEAR ?auto_104813 ) ( ON ?auto_104814 ?auto_104815 ) ( CLEAR ?auto_104814 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_104819 ?auto_104818 ?auto_104817 ?auto_104816 ?auto_104815 )
      ( MAKE-6PILE ?auto_104812 ?auto_104813 ?auto_104814 ?auto_104815 ?auto_104816 ?auto_104817 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_104820 - BLOCK
      ?auto_104821 - BLOCK
      ?auto_104822 - BLOCK
      ?auto_104823 - BLOCK
      ?auto_104824 - BLOCK
      ?auto_104825 - BLOCK
    )
    :vars
    (
      ?auto_104827 - BLOCK
      ?auto_104826 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_104820 ) ( not ( = ?auto_104820 ?auto_104821 ) ) ( not ( = ?auto_104820 ?auto_104822 ) ) ( not ( = ?auto_104820 ?auto_104823 ) ) ( not ( = ?auto_104820 ?auto_104824 ) ) ( not ( = ?auto_104820 ?auto_104825 ) ) ( not ( = ?auto_104821 ?auto_104822 ) ) ( not ( = ?auto_104821 ?auto_104823 ) ) ( not ( = ?auto_104821 ?auto_104824 ) ) ( not ( = ?auto_104821 ?auto_104825 ) ) ( not ( = ?auto_104822 ?auto_104823 ) ) ( not ( = ?auto_104822 ?auto_104824 ) ) ( not ( = ?auto_104822 ?auto_104825 ) ) ( not ( = ?auto_104823 ?auto_104824 ) ) ( not ( = ?auto_104823 ?auto_104825 ) ) ( not ( = ?auto_104824 ?auto_104825 ) ) ( ON ?auto_104825 ?auto_104827 ) ( not ( = ?auto_104820 ?auto_104827 ) ) ( not ( = ?auto_104821 ?auto_104827 ) ) ( not ( = ?auto_104822 ?auto_104827 ) ) ( not ( = ?auto_104823 ?auto_104827 ) ) ( not ( = ?auto_104824 ?auto_104827 ) ) ( not ( = ?auto_104825 ?auto_104827 ) ) ( ON ?auto_104824 ?auto_104825 ) ( ON-TABLE ?auto_104826 ) ( ON ?auto_104827 ?auto_104826 ) ( not ( = ?auto_104826 ?auto_104827 ) ) ( not ( = ?auto_104826 ?auto_104825 ) ) ( not ( = ?auto_104826 ?auto_104824 ) ) ( not ( = ?auto_104820 ?auto_104826 ) ) ( not ( = ?auto_104821 ?auto_104826 ) ) ( not ( = ?auto_104822 ?auto_104826 ) ) ( not ( = ?auto_104823 ?auto_104826 ) ) ( ON ?auto_104823 ?auto_104824 ) ( ON ?auto_104822 ?auto_104823 ) ( CLEAR ?auto_104822 ) ( HOLDING ?auto_104821 ) ( CLEAR ?auto_104820 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_104820 ?auto_104821 )
      ( MAKE-6PILE ?auto_104820 ?auto_104821 ?auto_104822 ?auto_104823 ?auto_104824 ?auto_104825 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_104828 - BLOCK
      ?auto_104829 - BLOCK
      ?auto_104830 - BLOCK
      ?auto_104831 - BLOCK
      ?auto_104832 - BLOCK
      ?auto_104833 - BLOCK
    )
    :vars
    (
      ?auto_104834 - BLOCK
      ?auto_104835 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_104828 ) ( not ( = ?auto_104828 ?auto_104829 ) ) ( not ( = ?auto_104828 ?auto_104830 ) ) ( not ( = ?auto_104828 ?auto_104831 ) ) ( not ( = ?auto_104828 ?auto_104832 ) ) ( not ( = ?auto_104828 ?auto_104833 ) ) ( not ( = ?auto_104829 ?auto_104830 ) ) ( not ( = ?auto_104829 ?auto_104831 ) ) ( not ( = ?auto_104829 ?auto_104832 ) ) ( not ( = ?auto_104829 ?auto_104833 ) ) ( not ( = ?auto_104830 ?auto_104831 ) ) ( not ( = ?auto_104830 ?auto_104832 ) ) ( not ( = ?auto_104830 ?auto_104833 ) ) ( not ( = ?auto_104831 ?auto_104832 ) ) ( not ( = ?auto_104831 ?auto_104833 ) ) ( not ( = ?auto_104832 ?auto_104833 ) ) ( ON ?auto_104833 ?auto_104834 ) ( not ( = ?auto_104828 ?auto_104834 ) ) ( not ( = ?auto_104829 ?auto_104834 ) ) ( not ( = ?auto_104830 ?auto_104834 ) ) ( not ( = ?auto_104831 ?auto_104834 ) ) ( not ( = ?auto_104832 ?auto_104834 ) ) ( not ( = ?auto_104833 ?auto_104834 ) ) ( ON ?auto_104832 ?auto_104833 ) ( ON-TABLE ?auto_104835 ) ( ON ?auto_104834 ?auto_104835 ) ( not ( = ?auto_104835 ?auto_104834 ) ) ( not ( = ?auto_104835 ?auto_104833 ) ) ( not ( = ?auto_104835 ?auto_104832 ) ) ( not ( = ?auto_104828 ?auto_104835 ) ) ( not ( = ?auto_104829 ?auto_104835 ) ) ( not ( = ?auto_104830 ?auto_104835 ) ) ( not ( = ?auto_104831 ?auto_104835 ) ) ( ON ?auto_104831 ?auto_104832 ) ( ON ?auto_104830 ?auto_104831 ) ( CLEAR ?auto_104828 ) ( ON ?auto_104829 ?auto_104830 ) ( CLEAR ?auto_104829 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_104835 ?auto_104834 ?auto_104833 ?auto_104832 ?auto_104831 ?auto_104830 )
      ( MAKE-6PILE ?auto_104828 ?auto_104829 ?auto_104830 ?auto_104831 ?auto_104832 ?auto_104833 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_104836 - BLOCK
      ?auto_104837 - BLOCK
      ?auto_104838 - BLOCK
      ?auto_104839 - BLOCK
      ?auto_104840 - BLOCK
      ?auto_104841 - BLOCK
    )
    :vars
    (
      ?auto_104842 - BLOCK
      ?auto_104843 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_104836 ?auto_104837 ) ) ( not ( = ?auto_104836 ?auto_104838 ) ) ( not ( = ?auto_104836 ?auto_104839 ) ) ( not ( = ?auto_104836 ?auto_104840 ) ) ( not ( = ?auto_104836 ?auto_104841 ) ) ( not ( = ?auto_104837 ?auto_104838 ) ) ( not ( = ?auto_104837 ?auto_104839 ) ) ( not ( = ?auto_104837 ?auto_104840 ) ) ( not ( = ?auto_104837 ?auto_104841 ) ) ( not ( = ?auto_104838 ?auto_104839 ) ) ( not ( = ?auto_104838 ?auto_104840 ) ) ( not ( = ?auto_104838 ?auto_104841 ) ) ( not ( = ?auto_104839 ?auto_104840 ) ) ( not ( = ?auto_104839 ?auto_104841 ) ) ( not ( = ?auto_104840 ?auto_104841 ) ) ( ON ?auto_104841 ?auto_104842 ) ( not ( = ?auto_104836 ?auto_104842 ) ) ( not ( = ?auto_104837 ?auto_104842 ) ) ( not ( = ?auto_104838 ?auto_104842 ) ) ( not ( = ?auto_104839 ?auto_104842 ) ) ( not ( = ?auto_104840 ?auto_104842 ) ) ( not ( = ?auto_104841 ?auto_104842 ) ) ( ON ?auto_104840 ?auto_104841 ) ( ON-TABLE ?auto_104843 ) ( ON ?auto_104842 ?auto_104843 ) ( not ( = ?auto_104843 ?auto_104842 ) ) ( not ( = ?auto_104843 ?auto_104841 ) ) ( not ( = ?auto_104843 ?auto_104840 ) ) ( not ( = ?auto_104836 ?auto_104843 ) ) ( not ( = ?auto_104837 ?auto_104843 ) ) ( not ( = ?auto_104838 ?auto_104843 ) ) ( not ( = ?auto_104839 ?auto_104843 ) ) ( ON ?auto_104839 ?auto_104840 ) ( ON ?auto_104838 ?auto_104839 ) ( ON ?auto_104837 ?auto_104838 ) ( CLEAR ?auto_104837 ) ( HOLDING ?auto_104836 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_104836 )
      ( MAKE-6PILE ?auto_104836 ?auto_104837 ?auto_104838 ?auto_104839 ?auto_104840 ?auto_104841 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_104844 - BLOCK
      ?auto_104845 - BLOCK
      ?auto_104846 - BLOCK
      ?auto_104847 - BLOCK
      ?auto_104848 - BLOCK
      ?auto_104849 - BLOCK
    )
    :vars
    (
      ?auto_104850 - BLOCK
      ?auto_104851 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_104844 ?auto_104845 ) ) ( not ( = ?auto_104844 ?auto_104846 ) ) ( not ( = ?auto_104844 ?auto_104847 ) ) ( not ( = ?auto_104844 ?auto_104848 ) ) ( not ( = ?auto_104844 ?auto_104849 ) ) ( not ( = ?auto_104845 ?auto_104846 ) ) ( not ( = ?auto_104845 ?auto_104847 ) ) ( not ( = ?auto_104845 ?auto_104848 ) ) ( not ( = ?auto_104845 ?auto_104849 ) ) ( not ( = ?auto_104846 ?auto_104847 ) ) ( not ( = ?auto_104846 ?auto_104848 ) ) ( not ( = ?auto_104846 ?auto_104849 ) ) ( not ( = ?auto_104847 ?auto_104848 ) ) ( not ( = ?auto_104847 ?auto_104849 ) ) ( not ( = ?auto_104848 ?auto_104849 ) ) ( ON ?auto_104849 ?auto_104850 ) ( not ( = ?auto_104844 ?auto_104850 ) ) ( not ( = ?auto_104845 ?auto_104850 ) ) ( not ( = ?auto_104846 ?auto_104850 ) ) ( not ( = ?auto_104847 ?auto_104850 ) ) ( not ( = ?auto_104848 ?auto_104850 ) ) ( not ( = ?auto_104849 ?auto_104850 ) ) ( ON ?auto_104848 ?auto_104849 ) ( ON-TABLE ?auto_104851 ) ( ON ?auto_104850 ?auto_104851 ) ( not ( = ?auto_104851 ?auto_104850 ) ) ( not ( = ?auto_104851 ?auto_104849 ) ) ( not ( = ?auto_104851 ?auto_104848 ) ) ( not ( = ?auto_104844 ?auto_104851 ) ) ( not ( = ?auto_104845 ?auto_104851 ) ) ( not ( = ?auto_104846 ?auto_104851 ) ) ( not ( = ?auto_104847 ?auto_104851 ) ) ( ON ?auto_104847 ?auto_104848 ) ( ON ?auto_104846 ?auto_104847 ) ( ON ?auto_104845 ?auto_104846 ) ( ON ?auto_104844 ?auto_104845 ) ( CLEAR ?auto_104844 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_104851 ?auto_104850 ?auto_104849 ?auto_104848 ?auto_104847 ?auto_104846 ?auto_104845 )
      ( MAKE-6PILE ?auto_104844 ?auto_104845 ?auto_104846 ?auto_104847 ?auto_104848 ?auto_104849 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_104853 - BLOCK
    )
    :vars
    (
      ?auto_104854 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104854 ?auto_104853 ) ( CLEAR ?auto_104854 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_104853 ) ( not ( = ?auto_104853 ?auto_104854 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_104854 ?auto_104853 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_104855 - BLOCK
    )
    :vars
    (
      ?auto_104856 - BLOCK
      ?auto_104857 - BLOCK
      ?auto_104858 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104856 ?auto_104855 ) ( CLEAR ?auto_104856 ) ( ON-TABLE ?auto_104855 ) ( not ( = ?auto_104855 ?auto_104856 ) ) ( HOLDING ?auto_104857 ) ( CLEAR ?auto_104858 ) ( not ( = ?auto_104855 ?auto_104857 ) ) ( not ( = ?auto_104855 ?auto_104858 ) ) ( not ( = ?auto_104856 ?auto_104857 ) ) ( not ( = ?auto_104856 ?auto_104858 ) ) ( not ( = ?auto_104857 ?auto_104858 ) ) )
    :subtasks
    ( ( !STACK ?auto_104857 ?auto_104858 )
      ( MAKE-1PILE ?auto_104855 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_104859 - BLOCK
    )
    :vars
    (
      ?auto_104862 - BLOCK
      ?auto_104860 - BLOCK
      ?auto_104861 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104862 ?auto_104859 ) ( ON-TABLE ?auto_104859 ) ( not ( = ?auto_104859 ?auto_104862 ) ) ( CLEAR ?auto_104860 ) ( not ( = ?auto_104859 ?auto_104861 ) ) ( not ( = ?auto_104859 ?auto_104860 ) ) ( not ( = ?auto_104862 ?auto_104861 ) ) ( not ( = ?auto_104862 ?auto_104860 ) ) ( not ( = ?auto_104861 ?auto_104860 ) ) ( ON ?auto_104861 ?auto_104862 ) ( CLEAR ?auto_104861 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_104859 ?auto_104862 )
      ( MAKE-1PILE ?auto_104859 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_104863 - BLOCK
    )
    :vars
    (
      ?auto_104866 - BLOCK
      ?auto_104865 - BLOCK
      ?auto_104864 - BLOCK
      ?auto_104868 - BLOCK
      ?auto_104870 - BLOCK
      ?auto_104867 - BLOCK
      ?auto_104869 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104866 ?auto_104863 ) ( ON-TABLE ?auto_104863 ) ( not ( = ?auto_104863 ?auto_104866 ) ) ( not ( = ?auto_104863 ?auto_104865 ) ) ( not ( = ?auto_104863 ?auto_104864 ) ) ( not ( = ?auto_104866 ?auto_104865 ) ) ( not ( = ?auto_104866 ?auto_104864 ) ) ( not ( = ?auto_104865 ?auto_104864 ) ) ( ON ?auto_104865 ?auto_104866 ) ( CLEAR ?auto_104865 ) ( HOLDING ?auto_104864 ) ( CLEAR ?auto_104868 ) ( ON-TABLE ?auto_104870 ) ( ON ?auto_104867 ?auto_104870 ) ( ON ?auto_104869 ?auto_104867 ) ( ON ?auto_104868 ?auto_104869 ) ( not ( = ?auto_104870 ?auto_104867 ) ) ( not ( = ?auto_104870 ?auto_104869 ) ) ( not ( = ?auto_104870 ?auto_104868 ) ) ( not ( = ?auto_104870 ?auto_104864 ) ) ( not ( = ?auto_104867 ?auto_104869 ) ) ( not ( = ?auto_104867 ?auto_104868 ) ) ( not ( = ?auto_104867 ?auto_104864 ) ) ( not ( = ?auto_104869 ?auto_104868 ) ) ( not ( = ?auto_104869 ?auto_104864 ) ) ( not ( = ?auto_104868 ?auto_104864 ) ) ( not ( = ?auto_104863 ?auto_104868 ) ) ( not ( = ?auto_104863 ?auto_104870 ) ) ( not ( = ?auto_104863 ?auto_104867 ) ) ( not ( = ?auto_104863 ?auto_104869 ) ) ( not ( = ?auto_104866 ?auto_104868 ) ) ( not ( = ?auto_104866 ?auto_104870 ) ) ( not ( = ?auto_104866 ?auto_104867 ) ) ( not ( = ?auto_104866 ?auto_104869 ) ) ( not ( = ?auto_104865 ?auto_104868 ) ) ( not ( = ?auto_104865 ?auto_104870 ) ) ( not ( = ?auto_104865 ?auto_104867 ) ) ( not ( = ?auto_104865 ?auto_104869 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_104870 ?auto_104867 ?auto_104869 ?auto_104868 ?auto_104864 )
      ( MAKE-1PILE ?auto_104863 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_104871 - BLOCK
    )
    :vars
    (
      ?auto_104872 - BLOCK
      ?auto_104875 - BLOCK
      ?auto_104874 - BLOCK
      ?auto_104873 - BLOCK
      ?auto_104876 - BLOCK
      ?auto_104878 - BLOCK
      ?auto_104877 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104872 ?auto_104871 ) ( ON-TABLE ?auto_104871 ) ( not ( = ?auto_104871 ?auto_104872 ) ) ( not ( = ?auto_104871 ?auto_104875 ) ) ( not ( = ?auto_104871 ?auto_104874 ) ) ( not ( = ?auto_104872 ?auto_104875 ) ) ( not ( = ?auto_104872 ?auto_104874 ) ) ( not ( = ?auto_104875 ?auto_104874 ) ) ( ON ?auto_104875 ?auto_104872 ) ( CLEAR ?auto_104873 ) ( ON-TABLE ?auto_104876 ) ( ON ?auto_104878 ?auto_104876 ) ( ON ?auto_104877 ?auto_104878 ) ( ON ?auto_104873 ?auto_104877 ) ( not ( = ?auto_104876 ?auto_104878 ) ) ( not ( = ?auto_104876 ?auto_104877 ) ) ( not ( = ?auto_104876 ?auto_104873 ) ) ( not ( = ?auto_104876 ?auto_104874 ) ) ( not ( = ?auto_104878 ?auto_104877 ) ) ( not ( = ?auto_104878 ?auto_104873 ) ) ( not ( = ?auto_104878 ?auto_104874 ) ) ( not ( = ?auto_104877 ?auto_104873 ) ) ( not ( = ?auto_104877 ?auto_104874 ) ) ( not ( = ?auto_104873 ?auto_104874 ) ) ( not ( = ?auto_104871 ?auto_104873 ) ) ( not ( = ?auto_104871 ?auto_104876 ) ) ( not ( = ?auto_104871 ?auto_104878 ) ) ( not ( = ?auto_104871 ?auto_104877 ) ) ( not ( = ?auto_104872 ?auto_104873 ) ) ( not ( = ?auto_104872 ?auto_104876 ) ) ( not ( = ?auto_104872 ?auto_104878 ) ) ( not ( = ?auto_104872 ?auto_104877 ) ) ( not ( = ?auto_104875 ?auto_104873 ) ) ( not ( = ?auto_104875 ?auto_104876 ) ) ( not ( = ?auto_104875 ?auto_104878 ) ) ( not ( = ?auto_104875 ?auto_104877 ) ) ( ON ?auto_104874 ?auto_104875 ) ( CLEAR ?auto_104874 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_104871 ?auto_104872 ?auto_104875 )
      ( MAKE-1PILE ?auto_104871 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_104879 - BLOCK
    )
    :vars
    (
      ?auto_104885 - BLOCK
      ?auto_104886 - BLOCK
      ?auto_104884 - BLOCK
      ?auto_104882 - BLOCK
      ?auto_104883 - BLOCK
      ?auto_104880 - BLOCK
      ?auto_104881 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104885 ?auto_104879 ) ( ON-TABLE ?auto_104879 ) ( not ( = ?auto_104879 ?auto_104885 ) ) ( not ( = ?auto_104879 ?auto_104886 ) ) ( not ( = ?auto_104879 ?auto_104884 ) ) ( not ( = ?auto_104885 ?auto_104886 ) ) ( not ( = ?auto_104885 ?auto_104884 ) ) ( not ( = ?auto_104886 ?auto_104884 ) ) ( ON ?auto_104886 ?auto_104885 ) ( ON-TABLE ?auto_104882 ) ( ON ?auto_104883 ?auto_104882 ) ( ON ?auto_104880 ?auto_104883 ) ( not ( = ?auto_104882 ?auto_104883 ) ) ( not ( = ?auto_104882 ?auto_104880 ) ) ( not ( = ?auto_104882 ?auto_104881 ) ) ( not ( = ?auto_104882 ?auto_104884 ) ) ( not ( = ?auto_104883 ?auto_104880 ) ) ( not ( = ?auto_104883 ?auto_104881 ) ) ( not ( = ?auto_104883 ?auto_104884 ) ) ( not ( = ?auto_104880 ?auto_104881 ) ) ( not ( = ?auto_104880 ?auto_104884 ) ) ( not ( = ?auto_104881 ?auto_104884 ) ) ( not ( = ?auto_104879 ?auto_104881 ) ) ( not ( = ?auto_104879 ?auto_104882 ) ) ( not ( = ?auto_104879 ?auto_104883 ) ) ( not ( = ?auto_104879 ?auto_104880 ) ) ( not ( = ?auto_104885 ?auto_104881 ) ) ( not ( = ?auto_104885 ?auto_104882 ) ) ( not ( = ?auto_104885 ?auto_104883 ) ) ( not ( = ?auto_104885 ?auto_104880 ) ) ( not ( = ?auto_104886 ?auto_104881 ) ) ( not ( = ?auto_104886 ?auto_104882 ) ) ( not ( = ?auto_104886 ?auto_104883 ) ) ( not ( = ?auto_104886 ?auto_104880 ) ) ( ON ?auto_104884 ?auto_104886 ) ( CLEAR ?auto_104884 ) ( HOLDING ?auto_104881 ) ( CLEAR ?auto_104880 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_104882 ?auto_104883 ?auto_104880 ?auto_104881 )
      ( MAKE-1PILE ?auto_104879 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_104887 - BLOCK
    )
    :vars
    (
      ?auto_104890 - BLOCK
      ?auto_104892 - BLOCK
      ?auto_104893 - BLOCK
      ?auto_104888 - BLOCK
      ?auto_104889 - BLOCK
      ?auto_104894 - BLOCK
      ?auto_104891 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104890 ?auto_104887 ) ( ON-TABLE ?auto_104887 ) ( not ( = ?auto_104887 ?auto_104890 ) ) ( not ( = ?auto_104887 ?auto_104892 ) ) ( not ( = ?auto_104887 ?auto_104893 ) ) ( not ( = ?auto_104890 ?auto_104892 ) ) ( not ( = ?auto_104890 ?auto_104893 ) ) ( not ( = ?auto_104892 ?auto_104893 ) ) ( ON ?auto_104892 ?auto_104890 ) ( ON-TABLE ?auto_104888 ) ( ON ?auto_104889 ?auto_104888 ) ( ON ?auto_104894 ?auto_104889 ) ( not ( = ?auto_104888 ?auto_104889 ) ) ( not ( = ?auto_104888 ?auto_104894 ) ) ( not ( = ?auto_104888 ?auto_104891 ) ) ( not ( = ?auto_104888 ?auto_104893 ) ) ( not ( = ?auto_104889 ?auto_104894 ) ) ( not ( = ?auto_104889 ?auto_104891 ) ) ( not ( = ?auto_104889 ?auto_104893 ) ) ( not ( = ?auto_104894 ?auto_104891 ) ) ( not ( = ?auto_104894 ?auto_104893 ) ) ( not ( = ?auto_104891 ?auto_104893 ) ) ( not ( = ?auto_104887 ?auto_104891 ) ) ( not ( = ?auto_104887 ?auto_104888 ) ) ( not ( = ?auto_104887 ?auto_104889 ) ) ( not ( = ?auto_104887 ?auto_104894 ) ) ( not ( = ?auto_104890 ?auto_104891 ) ) ( not ( = ?auto_104890 ?auto_104888 ) ) ( not ( = ?auto_104890 ?auto_104889 ) ) ( not ( = ?auto_104890 ?auto_104894 ) ) ( not ( = ?auto_104892 ?auto_104891 ) ) ( not ( = ?auto_104892 ?auto_104888 ) ) ( not ( = ?auto_104892 ?auto_104889 ) ) ( not ( = ?auto_104892 ?auto_104894 ) ) ( ON ?auto_104893 ?auto_104892 ) ( CLEAR ?auto_104894 ) ( ON ?auto_104891 ?auto_104893 ) ( CLEAR ?auto_104891 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_104887 ?auto_104890 ?auto_104892 ?auto_104893 )
      ( MAKE-1PILE ?auto_104887 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_104895 - BLOCK
    )
    :vars
    (
      ?auto_104896 - BLOCK
      ?auto_104902 - BLOCK
      ?auto_104899 - BLOCK
      ?auto_104901 - BLOCK
      ?auto_104897 - BLOCK
      ?auto_104900 - BLOCK
      ?auto_104898 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104896 ?auto_104895 ) ( ON-TABLE ?auto_104895 ) ( not ( = ?auto_104895 ?auto_104896 ) ) ( not ( = ?auto_104895 ?auto_104902 ) ) ( not ( = ?auto_104895 ?auto_104899 ) ) ( not ( = ?auto_104896 ?auto_104902 ) ) ( not ( = ?auto_104896 ?auto_104899 ) ) ( not ( = ?auto_104902 ?auto_104899 ) ) ( ON ?auto_104902 ?auto_104896 ) ( ON-TABLE ?auto_104901 ) ( ON ?auto_104897 ?auto_104901 ) ( not ( = ?auto_104901 ?auto_104897 ) ) ( not ( = ?auto_104901 ?auto_104900 ) ) ( not ( = ?auto_104901 ?auto_104898 ) ) ( not ( = ?auto_104901 ?auto_104899 ) ) ( not ( = ?auto_104897 ?auto_104900 ) ) ( not ( = ?auto_104897 ?auto_104898 ) ) ( not ( = ?auto_104897 ?auto_104899 ) ) ( not ( = ?auto_104900 ?auto_104898 ) ) ( not ( = ?auto_104900 ?auto_104899 ) ) ( not ( = ?auto_104898 ?auto_104899 ) ) ( not ( = ?auto_104895 ?auto_104898 ) ) ( not ( = ?auto_104895 ?auto_104901 ) ) ( not ( = ?auto_104895 ?auto_104897 ) ) ( not ( = ?auto_104895 ?auto_104900 ) ) ( not ( = ?auto_104896 ?auto_104898 ) ) ( not ( = ?auto_104896 ?auto_104901 ) ) ( not ( = ?auto_104896 ?auto_104897 ) ) ( not ( = ?auto_104896 ?auto_104900 ) ) ( not ( = ?auto_104902 ?auto_104898 ) ) ( not ( = ?auto_104902 ?auto_104901 ) ) ( not ( = ?auto_104902 ?auto_104897 ) ) ( not ( = ?auto_104902 ?auto_104900 ) ) ( ON ?auto_104899 ?auto_104902 ) ( ON ?auto_104898 ?auto_104899 ) ( CLEAR ?auto_104898 ) ( HOLDING ?auto_104900 ) ( CLEAR ?auto_104897 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_104901 ?auto_104897 ?auto_104900 )
      ( MAKE-1PILE ?auto_104895 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_104903 - BLOCK
    )
    :vars
    (
      ?auto_104904 - BLOCK
      ?auto_104905 - BLOCK
      ?auto_104909 - BLOCK
      ?auto_104906 - BLOCK
      ?auto_104910 - BLOCK
      ?auto_104908 - BLOCK
      ?auto_104907 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104904 ?auto_104903 ) ( ON-TABLE ?auto_104903 ) ( not ( = ?auto_104903 ?auto_104904 ) ) ( not ( = ?auto_104903 ?auto_104905 ) ) ( not ( = ?auto_104903 ?auto_104909 ) ) ( not ( = ?auto_104904 ?auto_104905 ) ) ( not ( = ?auto_104904 ?auto_104909 ) ) ( not ( = ?auto_104905 ?auto_104909 ) ) ( ON ?auto_104905 ?auto_104904 ) ( ON-TABLE ?auto_104906 ) ( ON ?auto_104910 ?auto_104906 ) ( not ( = ?auto_104906 ?auto_104910 ) ) ( not ( = ?auto_104906 ?auto_104908 ) ) ( not ( = ?auto_104906 ?auto_104907 ) ) ( not ( = ?auto_104906 ?auto_104909 ) ) ( not ( = ?auto_104910 ?auto_104908 ) ) ( not ( = ?auto_104910 ?auto_104907 ) ) ( not ( = ?auto_104910 ?auto_104909 ) ) ( not ( = ?auto_104908 ?auto_104907 ) ) ( not ( = ?auto_104908 ?auto_104909 ) ) ( not ( = ?auto_104907 ?auto_104909 ) ) ( not ( = ?auto_104903 ?auto_104907 ) ) ( not ( = ?auto_104903 ?auto_104906 ) ) ( not ( = ?auto_104903 ?auto_104910 ) ) ( not ( = ?auto_104903 ?auto_104908 ) ) ( not ( = ?auto_104904 ?auto_104907 ) ) ( not ( = ?auto_104904 ?auto_104906 ) ) ( not ( = ?auto_104904 ?auto_104910 ) ) ( not ( = ?auto_104904 ?auto_104908 ) ) ( not ( = ?auto_104905 ?auto_104907 ) ) ( not ( = ?auto_104905 ?auto_104906 ) ) ( not ( = ?auto_104905 ?auto_104910 ) ) ( not ( = ?auto_104905 ?auto_104908 ) ) ( ON ?auto_104909 ?auto_104905 ) ( ON ?auto_104907 ?auto_104909 ) ( CLEAR ?auto_104910 ) ( ON ?auto_104908 ?auto_104907 ) ( CLEAR ?auto_104908 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_104903 ?auto_104904 ?auto_104905 ?auto_104909 ?auto_104907 )
      ( MAKE-1PILE ?auto_104903 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_104911 - BLOCK
    )
    :vars
    (
      ?auto_104912 - BLOCK
      ?auto_104916 - BLOCK
      ?auto_104917 - BLOCK
      ?auto_104918 - BLOCK
      ?auto_104913 - BLOCK
      ?auto_104914 - BLOCK
      ?auto_104915 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104912 ?auto_104911 ) ( ON-TABLE ?auto_104911 ) ( not ( = ?auto_104911 ?auto_104912 ) ) ( not ( = ?auto_104911 ?auto_104916 ) ) ( not ( = ?auto_104911 ?auto_104917 ) ) ( not ( = ?auto_104912 ?auto_104916 ) ) ( not ( = ?auto_104912 ?auto_104917 ) ) ( not ( = ?auto_104916 ?auto_104917 ) ) ( ON ?auto_104916 ?auto_104912 ) ( ON-TABLE ?auto_104918 ) ( not ( = ?auto_104918 ?auto_104913 ) ) ( not ( = ?auto_104918 ?auto_104914 ) ) ( not ( = ?auto_104918 ?auto_104915 ) ) ( not ( = ?auto_104918 ?auto_104917 ) ) ( not ( = ?auto_104913 ?auto_104914 ) ) ( not ( = ?auto_104913 ?auto_104915 ) ) ( not ( = ?auto_104913 ?auto_104917 ) ) ( not ( = ?auto_104914 ?auto_104915 ) ) ( not ( = ?auto_104914 ?auto_104917 ) ) ( not ( = ?auto_104915 ?auto_104917 ) ) ( not ( = ?auto_104911 ?auto_104915 ) ) ( not ( = ?auto_104911 ?auto_104918 ) ) ( not ( = ?auto_104911 ?auto_104913 ) ) ( not ( = ?auto_104911 ?auto_104914 ) ) ( not ( = ?auto_104912 ?auto_104915 ) ) ( not ( = ?auto_104912 ?auto_104918 ) ) ( not ( = ?auto_104912 ?auto_104913 ) ) ( not ( = ?auto_104912 ?auto_104914 ) ) ( not ( = ?auto_104916 ?auto_104915 ) ) ( not ( = ?auto_104916 ?auto_104918 ) ) ( not ( = ?auto_104916 ?auto_104913 ) ) ( not ( = ?auto_104916 ?auto_104914 ) ) ( ON ?auto_104917 ?auto_104916 ) ( ON ?auto_104915 ?auto_104917 ) ( ON ?auto_104914 ?auto_104915 ) ( CLEAR ?auto_104914 ) ( HOLDING ?auto_104913 ) ( CLEAR ?auto_104918 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_104918 ?auto_104913 )
      ( MAKE-1PILE ?auto_104911 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_106325 - BLOCK
    )
    :vars
    (
      ?auto_106329 - BLOCK
      ?auto_106331 - BLOCK
      ?auto_106327 - BLOCK
      ?auto_106328 - BLOCK
      ?auto_106326 - BLOCK
      ?auto_106330 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106329 ?auto_106325 ) ( ON-TABLE ?auto_106325 ) ( not ( = ?auto_106325 ?auto_106329 ) ) ( not ( = ?auto_106325 ?auto_106331 ) ) ( not ( = ?auto_106325 ?auto_106327 ) ) ( not ( = ?auto_106329 ?auto_106331 ) ) ( not ( = ?auto_106329 ?auto_106327 ) ) ( not ( = ?auto_106331 ?auto_106327 ) ) ( ON ?auto_106331 ?auto_106329 ) ( not ( = ?auto_106328 ?auto_106326 ) ) ( not ( = ?auto_106328 ?auto_106330 ) ) ( not ( = ?auto_106328 ?auto_106327 ) ) ( not ( = ?auto_106326 ?auto_106330 ) ) ( not ( = ?auto_106326 ?auto_106327 ) ) ( not ( = ?auto_106330 ?auto_106327 ) ) ( not ( = ?auto_106325 ?auto_106330 ) ) ( not ( = ?auto_106325 ?auto_106328 ) ) ( not ( = ?auto_106325 ?auto_106326 ) ) ( not ( = ?auto_106329 ?auto_106330 ) ) ( not ( = ?auto_106329 ?auto_106328 ) ) ( not ( = ?auto_106329 ?auto_106326 ) ) ( not ( = ?auto_106331 ?auto_106330 ) ) ( not ( = ?auto_106331 ?auto_106328 ) ) ( not ( = ?auto_106331 ?auto_106326 ) ) ( ON ?auto_106327 ?auto_106331 ) ( ON ?auto_106330 ?auto_106327 ) ( ON ?auto_106326 ?auto_106330 ) ( ON ?auto_106328 ?auto_106326 ) ( CLEAR ?auto_106328 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_106325 ?auto_106329 ?auto_106331 ?auto_106327 ?auto_106330 ?auto_106326 )
      ( MAKE-1PILE ?auto_106325 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_104927 - BLOCK
    )
    :vars
    (
      ?auto_104933 - BLOCK
      ?auto_104930 - BLOCK
      ?auto_104928 - BLOCK
      ?auto_104929 - BLOCK
      ?auto_104934 - BLOCK
      ?auto_104932 - BLOCK
      ?auto_104931 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104933 ?auto_104927 ) ( ON-TABLE ?auto_104927 ) ( not ( = ?auto_104927 ?auto_104933 ) ) ( not ( = ?auto_104927 ?auto_104930 ) ) ( not ( = ?auto_104927 ?auto_104928 ) ) ( not ( = ?auto_104933 ?auto_104930 ) ) ( not ( = ?auto_104933 ?auto_104928 ) ) ( not ( = ?auto_104930 ?auto_104928 ) ) ( ON ?auto_104930 ?auto_104933 ) ( not ( = ?auto_104929 ?auto_104934 ) ) ( not ( = ?auto_104929 ?auto_104932 ) ) ( not ( = ?auto_104929 ?auto_104931 ) ) ( not ( = ?auto_104929 ?auto_104928 ) ) ( not ( = ?auto_104934 ?auto_104932 ) ) ( not ( = ?auto_104934 ?auto_104931 ) ) ( not ( = ?auto_104934 ?auto_104928 ) ) ( not ( = ?auto_104932 ?auto_104931 ) ) ( not ( = ?auto_104932 ?auto_104928 ) ) ( not ( = ?auto_104931 ?auto_104928 ) ) ( not ( = ?auto_104927 ?auto_104931 ) ) ( not ( = ?auto_104927 ?auto_104929 ) ) ( not ( = ?auto_104927 ?auto_104934 ) ) ( not ( = ?auto_104927 ?auto_104932 ) ) ( not ( = ?auto_104933 ?auto_104931 ) ) ( not ( = ?auto_104933 ?auto_104929 ) ) ( not ( = ?auto_104933 ?auto_104934 ) ) ( not ( = ?auto_104933 ?auto_104932 ) ) ( not ( = ?auto_104930 ?auto_104931 ) ) ( not ( = ?auto_104930 ?auto_104929 ) ) ( not ( = ?auto_104930 ?auto_104934 ) ) ( not ( = ?auto_104930 ?auto_104932 ) ) ( ON ?auto_104928 ?auto_104930 ) ( ON ?auto_104931 ?auto_104928 ) ( ON ?auto_104932 ?auto_104931 ) ( ON ?auto_104934 ?auto_104932 ) ( CLEAR ?auto_104934 ) ( HOLDING ?auto_104929 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_104929 )
      ( MAKE-1PILE ?auto_104927 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_104935 - BLOCK
    )
    :vars
    (
      ?auto_104937 - BLOCK
      ?auto_104936 - BLOCK
      ?auto_104941 - BLOCK
      ?auto_104942 - BLOCK
      ?auto_104940 - BLOCK
      ?auto_104938 - BLOCK
      ?auto_104939 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104937 ?auto_104935 ) ( ON-TABLE ?auto_104935 ) ( not ( = ?auto_104935 ?auto_104937 ) ) ( not ( = ?auto_104935 ?auto_104936 ) ) ( not ( = ?auto_104935 ?auto_104941 ) ) ( not ( = ?auto_104937 ?auto_104936 ) ) ( not ( = ?auto_104937 ?auto_104941 ) ) ( not ( = ?auto_104936 ?auto_104941 ) ) ( ON ?auto_104936 ?auto_104937 ) ( not ( = ?auto_104942 ?auto_104940 ) ) ( not ( = ?auto_104942 ?auto_104938 ) ) ( not ( = ?auto_104942 ?auto_104939 ) ) ( not ( = ?auto_104942 ?auto_104941 ) ) ( not ( = ?auto_104940 ?auto_104938 ) ) ( not ( = ?auto_104940 ?auto_104939 ) ) ( not ( = ?auto_104940 ?auto_104941 ) ) ( not ( = ?auto_104938 ?auto_104939 ) ) ( not ( = ?auto_104938 ?auto_104941 ) ) ( not ( = ?auto_104939 ?auto_104941 ) ) ( not ( = ?auto_104935 ?auto_104939 ) ) ( not ( = ?auto_104935 ?auto_104942 ) ) ( not ( = ?auto_104935 ?auto_104940 ) ) ( not ( = ?auto_104935 ?auto_104938 ) ) ( not ( = ?auto_104937 ?auto_104939 ) ) ( not ( = ?auto_104937 ?auto_104942 ) ) ( not ( = ?auto_104937 ?auto_104940 ) ) ( not ( = ?auto_104937 ?auto_104938 ) ) ( not ( = ?auto_104936 ?auto_104939 ) ) ( not ( = ?auto_104936 ?auto_104942 ) ) ( not ( = ?auto_104936 ?auto_104940 ) ) ( not ( = ?auto_104936 ?auto_104938 ) ) ( ON ?auto_104941 ?auto_104936 ) ( ON ?auto_104939 ?auto_104941 ) ( ON ?auto_104938 ?auto_104939 ) ( ON ?auto_104940 ?auto_104938 ) ( ON ?auto_104942 ?auto_104940 ) ( CLEAR ?auto_104942 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_104935 ?auto_104937 ?auto_104936 ?auto_104941 ?auto_104939 ?auto_104938 ?auto_104940 )
      ( MAKE-1PILE ?auto_104935 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_104950 - BLOCK
      ?auto_104951 - BLOCK
      ?auto_104952 - BLOCK
      ?auto_104953 - BLOCK
      ?auto_104954 - BLOCK
      ?auto_104955 - BLOCK
      ?auto_104956 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_104956 ) ( CLEAR ?auto_104955 ) ( ON-TABLE ?auto_104950 ) ( ON ?auto_104951 ?auto_104950 ) ( ON ?auto_104952 ?auto_104951 ) ( ON ?auto_104953 ?auto_104952 ) ( ON ?auto_104954 ?auto_104953 ) ( ON ?auto_104955 ?auto_104954 ) ( not ( = ?auto_104950 ?auto_104951 ) ) ( not ( = ?auto_104950 ?auto_104952 ) ) ( not ( = ?auto_104950 ?auto_104953 ) ) ( not ( = ?auto_104950 ?auto_104954 ) ) ( not ( = ?auto_104950 ?auto_104955 ) ) ( not ( = ?auto_104950 ?auto_104956 ) ) ( not ( = ?auto_104951 ?auto_104952 ) ) ( not ( = ?auto_104951 ?auto_104953 ) ) ( not ( = ?auto_104951 ?auto_104954 ) ) ( not ( = ?auto_104951 ?auto_104955 ) ) ( not ( = ?auto_104951 ?auto_104956 ) ) ( not ( = ?auto_104952 ?auto_104953 ) ) ( not ( = ?auto_104952 ?auto_104954 ) ) ( not ( = ?auto_104952 ?auto_104955 ) ) ( not ( = ?auto_104952 ?auto_104956 ) ) ( not ( = ?auto_104953 ?auto_104954 ) ) ( not ( = ?auto_104953 ?auto_104955 ) ) ( not ( = ?auto_104953 ?auto_104956 ) ) ( not ( = ?auto_104954 ?auto_104955 ) ) ( not ( = ?auto_104954 ?auto_104956 ) ) ( not ( = ?auto_104955 ?auto_104956 ) ) )
    :subtasks
    ( ( !STACK ?auto_104956 ?auto_104955 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_104957 - BLOCK
      ?auto_104958 - BLOCK
      ?auto_104959 - BLOCK
      ?auto_104960 - BLOCK
      ?auto_104961 - BLOCK
      ?auto_104962 - BLOCK
      ?auto_104963 - BLOCK
    )
    :vars
    (
      ?auto_104964 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_104962 ) ( ON-TABLE ?auto_104957 ) ( ON ?auto_104958 ?auto_104957 ) ( ON ?auto_104959 ?auto_104958 ) ( ON ?auto_104960 ?auto_104959 ) ( ON ?auto_104961 ?auto_104960 ) ( ON ?auto_104962 ?auto_104961 ) ( not ( = ?auto_104957 ?auto_104958 ) ) ( not ( = ?auto_104957 ?auto_104959 ) ) ( not ( = ?auto_104957 ?auto_104960 ) ) ( not ( = ?auto_104957 ?auto_104961 ) ) ( not ( = ?auto_104957 ?auto_104962 ) ) ( not ( = ?auto_104957 ?auto_104963 ) ) ( not ( = ?auto_104958 ?auto_104959 ) ) ( not ( = ?auto_104958 ?auto_104960 ) ) ( not ( = ?auto_104958 ?auto_104961 ) ) ( not ( = ?auto_104958 ?auto_104962 ) ) ( not ( = ?auto_104958 ?auto_104963 ) ) ( not ( = ?auto_104959 ?auto_104960 ) ) ( not ( = ?auto_104959 ?auto_104961 ) ) ( not ( = ?auto_104959 ?auto_104962 ) ) ( not ( = ?auto_104959 ?auto_104963 ) ) ( not ( = ?auto_104960 ?auto_104961 ) ) ( not ( = ?auto_104960 ?auto_104962 ) ) ( not ( = ?auto_104960 ?auto_104963 ) ) ( not ( = ?auto_104961 ?auto_104962 ) ) ( not ( = ?auto_104961 ?auto_104963 ) ) ( not ( = ?auto_104962 ?auto_104963 ) ) ( ON ?auto_104963 ?auto_104964 ) ( CLEAR ?auto_104963 ) ( HAND-EMPTY ) ( not ( = ?auto_104957 ?auto_104964 ) ) ( not ( = ?auto_104958 ?auto_104964 ) ) ( not ( = ?auto_104959 ?auto_104964 ) ) ( not ( = ?auto_104960 ?auto_104964 ) ) ( not ( = ?auto_104961 ?auto_104964 ) ) ( not ( = ?auto_104962 ?auto_104964 ) ) ( not ( = ?auto_104963 ?auto_104964 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_104963 ?auto_104964 )
      ( MAKE-7PILE ?auto_104957 ?auto_104958 ?auto_104959 ?auto_104960 ?auto_104961 ?auto_104962 ?auto_104963 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_104965 - BLOCK
      ?auto_104966 - BLOCK
      ?auto_104967 - BLOCK
      ?auto_104968 - BLOCK
      ?auto_104969 - BLOCK
      ?auto_104970 - BLOCK
      ?auto_104971 - BLOCK
    )
    :vars
    (
      ?auto_104972 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_104965 ) ( ON ?auto_104966 ?auto_104965 ) ( ON ?auto_104967 ?auto_104966 ) ( ON ?auto_104968 ?auto_104967 ) ( ON ?auto_104969 ?auto_104968 ) ( not ( = ?auto_104965 ?auto_104966 ) ) ( not ( = ?auto_104965 ?auto_104967 ) ) ( not ( = ?auto_104965 ?auto_104968 ) ) ( not ( = ?auto_104965 ?auto_104969 ) ) ( not ( = ?auto_104965 ?auto_104970 ) ) ( not ( = ?auto_104965 ?auto_104971 ) ) ( not ( = ?auto_104966 ?auto_104967 ) ) ( not ( = ?auto_104966 ?auto_104968 ) ) ( not ( = ?auto_104966 ?auto_104969 ) ) ( not ( = ?auto_104966 ?auto_104970 ) ) ( not ( = ?auto_104966 ?auto_104971 ) ) ( not ( = ?auto_104967 ?auto_104968 ) ) ( not ( = ?auto_104967 ?auto_104969 ) ) ( not ( = ?auto_104967 ?auto_104970 ) ) ( not ( = ?auto_104967 ?auto_104971 ) ) ( not ( = ?auto_104968 ?auto_104969 ) ) ( not ( = ?auto_104968 ?auto_104970 ) ) ( not ( = ?auto_104968 ?auto_104971 ) ) ( not ( = ?auto_104969 ?auto_104970 ) ) ( not ( = ?auto_104969 ?auto_104971 ) ) ( not ( = ?auto_104970 ?auto_104971 ) ) ( ON ?auto_104971 ?auto_104972 ) ( CLEAR ?auto_104971 ) ( not ( = ?auto_104965 ?auto_104972 ) ) ( not ( = ?auto_104966 ?auto_104972 ) ) ( not ( = ?auto_104967 ?auto_104972 ) ) ( not ( = ?auto_104968 ?auto_104972 ) ) ( not ( = ?auto_104969 ?auto_104972 ) ) ( not ( = ?auto_104970 ?auto_104972 ) ) ( not ( = ?auto_104971 ?auto_104972 ) ) ( HOLDING ?auto_104970 ) ( CLEAR ?auto_104969 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_104965 ?auto_104966 ?auto_104967 ?auto_104968 ?auto_104969 ?auto_104970 )
      ( MAKE-7PILE ?auto_104965 ?auto_104966 ?auto_104967 ?auto_104968 ?auto_104969 ?auto_104970 ?auto_104971 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_104973 - BLOCK
      ?auto_104974 - BLOCK
      ?auto_104975 - BLOCK
      ?auto_104976 - BLOCK
      ?auto_104977 - BLOCK
      ?auto_104978 - BLOCK
      ?auto_104979 - BLOCK
    )
    :vars
    (
      ?auto_104980 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_104973 ) ( ON ?auto_104974 ?auto_104973 ) ( ON ?auto_104975 ?auto_104974 ) ( ON ?auto_104976 ?auto_104975 ) ( ON ?auto_104977 ?auto_104976 ) ( not ( = ?auto_104973 ?auto_104974 ) ) ( not ( = ?auto_104973 ?auto_104975 ) ) ( not ( = ?auto_104973 ?auto_104976 ) ) ( not ( = ?auto_104973 ?auto_104977 ) ) ( not ( = ?auto_104973 ?auto_104978 ) ) ( not ( = ?auto_104973 ?auto_104979 ) ) ( not ( = ?auto_104974 ?auto_104975 ) ) ( not ( = ?auto_104974 ?auto_104976 ) ) ( not ( = ?auto_104974 ?auto_104977 ) ) ( not ( = ?auto_104974 ?auto_104978 ) ) ( not ( = ?auto_104974 ?auto_104979 ) ) ( not ( = ?auto_104975 ?auto_104976 ) ) ( not ( = ?auto_104975 ?auto_104977 ) ) ( not ( = ?auto_104975 ?auto_104978 ) ) ( not ( = ?auto_104975 ?auto_104979 ) ) ( not ( = ?auto_104976 ?auto_104977 ) ) ( not ( = ?auto_104976 ?auto_104978 ) ) ( not ( = ?auto_104976 ?auto_104979 ) ) ( not ( = ?auto_104977 ?auto_104978 ) ) ( not ( = ?auto_104977 ?auto_104979 ) ) ( not ( = ?auto_104978 ?auto_104979 ) ) ( ON ?auto_104979 ?auto_104980 ) ( not ( = ?auto_104973 ?auto_104980 ) ) ( not ( = ?auto_104974 ?auto_104980 ) ) ( not ( = ?auto_104975 ?auto_104980 ) ) ( not ( = ?auto_104976 ?auto_104980 ) ) ( not ( = ?auto_104977 ?auto_104980 ) ) ( not ( = ?auto_104978 ?auto_104980 ) ) ( not ( = ?auto_104979 ?auto_104980 ) ) ( CLEAR ?auto_104977 ) ( ON ?auto_104978 ?auto_104979 ) ( CLEAR ?auto_104978 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_104980 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_104980 ?auto_104979 )
      ( MAKE-7PILE ?auto_104973 ?auto_104974 ?auto_104975 ?auto_104976 ?auto_104977 ?auto_104978 ?auto_104979 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_104981 - BLOCK
      ?auto_104982 - BLOCK
      ?auto_104983 - BLOCK
      ?auto_104984 - BLOCK
      ?auto_104985 - BLOCK
      ?auto_104986 - BLOCK
      ?auto_104987 - BLOCK
    )
    :vars
    (
      ?auto_104988 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_104981 ) ( ON ?auto_104982 ?auto_104981 ) ( ON ?auto_104983 ?auto_104982 ) ( ON ?auto_104984 ?auto_104983 ) ( not ( = ?auto_104981 ?auto_104982 ) ) ( not ( = ?auto_104981 ?auto_104983 ) ) ( not ( = ?auto_104981 ?auto_104984 ) ) ( not ( = ?auto_104981 ?auto_104985 ) ) ( not ( = ?auto_104981 ?auto_104986 ) ) ( not ( = ?auto_104981 ?auto_104987 ) ) ( not ( = ?auto_104982 ?auto_104983 ) ) ( not ( = ?auto_104982 ?auto_104984 ) ) ( not ( = ?auto_104982 ?auto_104985 ) ) ( not ( = ?auto_104982 ?auto_104986 ) ) ( not ( = ?auto_104982 ?auto_104987 ) ) ( not ( = ?auto_104983 ?auto_104984 ) ) ( not ( = ?auto_104983 ?auto_104985 ) ) ( not ( = ?auto_104983 ?auto_104986 ) ) ( not ( = ?auto_104983 ?auto_104987 ) ) ( not ( = ?auto_104984 ?auto_104985 ) ) ( not ( = ?auto_104984 ?auto_104986 ) ) ( not ( = ?auto_104984 ?auto_104987 ) ) ( not ( = ?auto_104985 ?auto_104986 ) ) ( not ( = ?auto_104985 ?auto_104987 ) ) ( not ( = ?auto_104986 ?auto_104987 ) ) ( ON ?auto_104987 ?auto_104988 ) ( not ( = ?auto_104981 ?auto_104988 ) ) ( not ( = ?auto_104982 ?auto_104988 ) ) ( not ( = ?auto_104983 ?auto_104988 ) ) ( not ( = ?auto_104984 ?auto_104988 ) ) ( not ( = ?auto_104985 ?auto_104988 ) ) ( not ( = ?auto_104986 ?auto_104988 ) ) ( not ( = ?auto_104987 ?auto_104988 ) ) ( ON ?auto_104986 ?auto_104987 ) ( CLEAR ?auto_104986 ) ( ON-TABLE ?auto_104988 ) ( HOLDING ?auto_104985 ) ( CLEAR ?auto_104984 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_104981 ?auto_104982 ?auto_104983 ?auto_104984 ?auto_104985 )
      ( MAKE-7PILE ?auto_104981 ?auto_104982 ?auto_104983 ?auto_104984 ?auto_104985 ?auto_104986 ?auto_104987 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_104989 - BLOCK
      ?auto_104990 - BLOCK
      ?auto_104991 - BLOCK
      ?auto_104992 - BLOCK
      ?auto_104993 - BLOCK
      ?auto_104994 - BLOCK
      ?auto_104995 - BLOCK
    )
    :vars
    (
      ?auto_104996 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_104989 ) ( ON ?auto_104990 ?auto_104989 ) ( ON ?auto_104991 ?auto_104990 ) ( ON ?auto_104992 ?auto_104991 ) ( not ( = ?auto_104989 ?auto_104990 ) ) ( not ( = ?auto_104989 ?auto_104991 ) ) ( not ( = ?auto_104989 ?auto_104992 ) ) ( not ( = ?auto_104989 ?auto_104993 ) ) ( not ( = ?auto_104989 ?auto_104994 ) ) ( not ( = ?auto_104989 ?auto_104995 ) ) ( not ( = ?auto_104990 ?auto_104991 ) ) ( not ( = ?auto_104990 ?auto_104992 ) ) ( not ( = ?auto_104990 ?auto_104993 ) ) ( not ( = ?auto_104990 ?auto_104994 ) ) ( not ( = ?auto_104990 ?auto_104995 ) ) ( not ( = ?auto_104991 ?auto_104992 ) ) ( not ( = ?auto_104991 ?auto_104993 ) ) ( not ( = ?auto_104991 ?auto_104994 ) ) ( not ( = ?auto_104991 ?auto_104995 ) ) ( not ( = ?auto_104992 ?auto_104993 ) ) ( not ( = ?auto_104992 ?auto_104994 ) ) ( not ( = ?auto_104992 ?auto_104995 ) ) ( not ( = ?auto_104993 ?auto_104994 ) ) ( not ( = ?auto_104993 ?auto_104995 ) ) ( not ( = ?auto_104994 ?auto_104995 ) ) ( ON ?auto_104995 ?auto_104996 ) ( not ( = ?auto_104989 ?auto_104996 ) ) ( not ( = ?auto_104990 ?auto_104996 ) ) ( not ( = ?auto_104991 ?auto_104996 ) ) ( not ( = ?auto_104992 ?auto_104996 ) ) ( not ( = ?auto_104993 ?auto_104996 ) ) ( not ( = ?auto_104994 ?auto_104996 ) ) ( not ( = ?auto_104995 ?auto_104996 ) ) ( ON ?auto_104994 ?auto_104995 ) ( ON-TABLE ?auto_104996 ) ( CLEAR ?auto_104992 ) ( ON ?auto_104993 ?auto_104994 ) ( CLEAR ?auto_104993 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_104996 ?auto_104995 ?auto_104994 )
      ( MAKE-7PILE ?auto_104989 ?auto_104990 ?auto_104991 ?auto_104992 ?auto_104993 ?auto_104994 ?auto_104995 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_104997 - BLOCK
      ?auto_104998 - BLOCK
      ?auto_104999 - BLOCK
      ?auto_105000 - BLOCK
      ?auto_105001 - BLOCK
      ?auto_105002 - BLOCK
      ?auto_105003 - BLOCK
    )
    :vars
    (
      ?auto_105004 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_104997 ) ( ON ?auto_104998 ?auto_104997 ) ( ON ?auto_104999 ?auto_104998 ) ( not ( = ?auto_104997 ?auto_104998 ) ) ( not ( = ?auto_104997 ?auto_104999 ) ) ( not ( = ?auto_104997 ?auto_105000 ) ) ( not ( = ?auto_104997 ?auto_105001 ) ) ( not ( = ?auto_104997 ?auto_105002 ) ) ( not ( = ?auto_104997 ?auto_105003 ) ) ( not ( = ?auto_104998 ?auto_104999 ) ) ( not ( = ?auto_104998 ?auto_105000 ) ) ( not ( = ?auto_104998 ?auto_105001 ) ) ( not ( = ?auto_104998 ?auto_105002 ) ) ( not ( = ?auto_104998 ?auto_105003 ) ) ( not ( = ?auto_104999 ?auto_105000 ) ) ( not ( = ?auto_104999 ?auto_105001 ) ) ( not ( = ?auto_104999 ?auto_105002 ) ) ( not ( = ?auto_104999 ?auto_105003 ) ) ( not ( = ?auto_105000 ?auto_105001 ) ) ( not ( = ?auto_105000 ?auto_105002 ) ) ( not ( = ?auto_105000 ?auto_105003 ) ) ( not ( = ?auto_105001 ?auto_105002 ) ) ( not ( = ?auto_105001 ?auto_105003 ) ) ( not ( = ?auto_105002 ?auto_105003 ) ) ( ON ?auto_105003 ?auto_105004 ) ( not ( = ?auto_104997 ?auto_105004 ) ) ( not ( = ?auto_104998 ?auto_105004 ) ) ( not ( = ?auto_104999 ?auto_105004 ) ) ( not ( = ?auto_105000 ?auto_105004 ) ) ( not ( = ?auto_105001 ?auto_105004 ) ) ( not ( = ?auto_105002 ?auto_105004 ) ) ( not ( = ?auto_105003 ?auto_105004 ) ) ( ON ?auto_105002 ?auto_105003 ) ( ON-TABLE ?auto_105004 ) ( ON ?auto_105001 ?auto_105002 ) ( CLEAR ?auto_105001 ) ( HOLDING ?auto_105000 ) ( CLEAR ?auto_104999 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_104997 ?auto_104998 ?auto_104999 ?auto_105000 )
      ( MAKE-7PILE ?auto_104997 ?auto_104998 ?auto_104999 ?auto_105000 ?auto_105001 ?auto_105002 ?auto_105003 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_105005 - BLOCK
      ?auto_105006 - BLOCK
      ?auto_105007 - BLOCK
      ?auto_105008 - BLOCK
      ?auto_105009 - BLOCK
      ?auto_105010 - BLOCK
      ?auto_105011 - BLOCK
    )
    :vars
    (
      ?auto_105012 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_105005 ) ( ON ?auto_105006 ?auto_105005 ) ( ON ?auto_105007 ?auto_105006 ) ( not ( = ?auto_105005 ?auto_105006 ) ) ( not ( = ?auto_105005 ?auto_105007 ) ) ( not ( = ?auto_105005 ?auto_105008 ) ) ( not ( = ?auto_105005 ?auto_105009 ) ) ( not ( = ?auto_105005 ?auto_105010 ) ) ( not ( = ?auto_105005 ?auto_105011 ) ) ( not ( = ?auto_105006 ?auto_105007 ) ) ( not ( = ?auto_105006 ?auto_105008 ) ) ( not ( = ?auto_105006 ?auto_105009 ) ) ( not ( = ?auto_105006 ?auto_105010 ) ) ( not ( = ?auto_105006 ?auto_105011 ) ) ( not ( = ?auto_105007 ?auto_105008 ) ) ( not ( = ?auto_105007 ?auto_105009 ) ) ( not ( = ?auto_105007 ?auto_105010 ) ) ( not ( = ?auto_105007 ?auto_105011 ) ) ( not ( = ?auto_105008 ?auto_105009 ) ) ( not ( = ?auto_105008 ?auto_105010 ) ) ( not ( = ?auto_105008 ?auto_105011 ) ) ( not ( = ?auto_105009 ?auto_105010 ) ) ( not ( = ?auto_105009 ?auto_105011 ) ) ( not ( = ?auto_105010 ?auto_105011 ) ) ( ON ?auto_105011 ?auto_105012 ) ( not ( = ?auto_105005 ?auto_105012 ) ) ( not ( = ?auto_105006 ?auto_105012 ) ) ( not ( = ?auto_105007 ?auto_105012 ) ) ( not ( = ?auto_105008 ?auto_105012 ) ) ( not ( = ?auto_105009 ?auto_105012 ) ) ( not ( = ?auto_105010 ?auto_105012 ) ) ( not ( = ?auto_105011 ?auto_105012 ) ) ( ON ?auto_105010 ?auto_105011 ) ( ON-TABLE ?auto_105012 ) ( ON ?auto_105009 ?auto_105010 ) ( CLEAR ?auto_105007 ) ( ON ?auto_105008 ?auto_105009 ) ( CLEAR ?auto_105008 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_105012 ?auto_105011 ?auto_105010 ?auto_105009 )
      ( MAKE-7PILE ?auto_105005 ?auto_105006 ?auto_105007 ?auto_105008 ?auto_105009 ?auto_105010 ?auto_105011 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_105013 - BLOCK
      ?auto_105014 - BLOCK
      ?auto_105015 - BLOCK
      ?auto_105016 - BLOCK
      ?auto_105017 - BLOCK
      ?auto_105018 - BLOCK
      ?auto_105019 - BLOCK
    )
    :vars
    (
      ?auto_105020 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_105013 ) ( ON ?auto_105014 ?auto_105013 ) ( not ( = ?auto_105013 ?auto_105014 ) ) ( not ( = ?auto_105013 ?auto_105015 ) ) ( not ( = ?auto_105013 ?auto_105016 ) ) ( not ( = ?auto_105013 ?auto_105017 ) ) ( not ( = ?auto_105013 ?auto_105018 ) ) ( not ( = ?auto_105013 ?auto_105019 ) ) ( not ( = ?auto_105014 ?auto_105015 ) ) ( not ( = ?auto_105014 ?auto_105016 ) ) ( not ( = ?auto_105014 ?auto_105017 ) ) ( not ( = ?auto_105014 ?auto_105018 ) ) ( not ( = ?auto_105014 ?auto_105019 ) ) ( not ( = ?auto_105015 ?auto_105016 ) ) ( not ( = ?auto_105015 ?auto_105017 ) ) ( not ( = ?auto_105015 ?auto_105018 ) ) ( not ( = ?auto_105015 ?auto_105019 ) ) ( not ( = ?auto_105016 ?auto_105017 ) ) ( not ( = ?auto_105016 ?auto_105018 ) ) ( not ( = ?auto_105016 ?auto_105019 ) ) ( not ( = ?auto_105017 ?auto_105018 ) ) ( not ( = ?auto_105017 ?auto_105019 ) ) ( not ( = ?auto_105018 ?auto_105019 ) ) ( ON ?auto_105019 ?auto_105020 ) ( not ( = ?auto_105013 ?auto_105020 ) ) ( not ( = ?auto_105014 ?auto_105020 ) ) ( not ( = ?auto_105015 ?auto_105020 ) ) ( not ( = ?auto_105016 ?auto_105020 ) ) ( not ( = ?auto_105017 ?auto_105020 ) ) ( not ( = ?auto_105018 ?auto_105020 ) ) ( not ( = ?auto_105019 ?auto_105020 ) ) ( ON ?auto_105018 ?auto_105019 ) ( ON-TABLE ?auto_105020 ) ( ON ?auto_105017 ?auto_105018 ) ( ON ?auto_105016 ?auto_105017 ) ( CLEAR ?auto_105016 ) ( HOLDING ?auto_105015 ) ( CLEAR ?auto_105014 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_105013 ?auto_105014 ?auto_105015 )
      ( MAKE-7PILE ?auto_105013 ?auto_105014 ?auto_105015 ?auto_105016 ?auto_105017 ?auto_105018 ?auto_105019 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_105021 - BLOCK
      ?auto_105022 - BLOCK
      ?auto_105023 - BLOCK
      ?auto_105024 - BLOCK
      ?auto_105025 - BLOCK
      ?auto_105026 - BLOCK
      ?auto_105027 - BLOCK
    )
    :vars
    (
      ?auto_105028 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_105021 ) ( ON ?auto_105022 ?auto_105021 ) ( not ( = ?auto_105021 ?auto_105022 ) ) ( not ( = ?auto_105021 ?auto_105023 ) ) ( not ( = ?auto_105021 ?auto_105024 ) ) ( not ( = ?auto_105021 ?auto_105025 ) ) ( not ( = ?auto_105021 ?auto_105026 ) ) ( not ( = ?auto_105021 ?auto_105027 ) ) ( not ( = ?auto_105022 ?auto_105023 ) ) ( not ( = ?auto_105022 ?auto_105024 ) ) ( not ( = ?auto_105022 ?auto_105025 ) ) ( not ( = ?auto_105022 ?auto_105026 ) ) ( not ( = ?auto_105022 ?auto_105027 ) ) ( not ( = ?auto_105023 ?auto_105024 ) ) ( not ( = ?auto_105023 ?auto_105025 ) ) ( not ( = ?auto_105023 ?auto_105026 ) ) ( not ( = ?auto_105023 ?auto_105027 ) ) ( not ( = ?auto_105024 ?auto_105025 ) ) ( not ( = ?auto_105024 ?auto_105026 ) ) ( not ( = ?auto_105024 ?auto_105027 ) ) ( not ( = ?auto_105025 ?auto_105026 ) ) ( not ( = ?auto_105025 ?auto_105027 ) ) ( not ( = ?auto_105026 ?auto_105027 ) ) ( ON ?auto_105027 ?auto_105028 ) ( not ( = ?auto_105021 ?auto_105028 ) ) ( not ( = ?auto_105022 ?auto_105028 ) ) ( not ( = ?auto_105023 ?auto_105028 ) ) ( not ( = ?auto_105024 ?auto_105028 ) ) ( not ( = ?auto_105025 ?auto_105028 ) ) ( not ( = ?auto_105026 ?auto_105028 ) ) ( not ( = ?auto_105027 ?auto_105028 ) ) ( ON ?auto_105026 ?auto_105027 ) ( ON-TABLE ?auto_105028 ) ( ON ?auto_105025 ?auto_105026 ) ( ON ?auto_105024 ?auto_105025 ) ( CLEAR ?auto_105022 ) ( ON ?auto_105023 ?auto_105024 ) ( CLEAR ?auto_105023 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_105028 ?auto_105027 ?auto_105026 ?auto_105025 ?auto_105024 )
      ( MAKE-7PILE ?auto_105021 ?auto_105022 ?auto_105023 ?auto_105024 ?auto_105025 ?auto_105026 ?auto_105027 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_105029 - BLOCK
      ?auto_105030 - BLOCK
      ?auto_105031 - BLOCK
      ?auto_105032 - BLOCK
      ?auto_105033 - BLOCK
      ?auto_105034 - BLOCK
      ?auto_105035 - BLOCK
    )
    :vars
    (
      ?auto_105036 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_105029 ) ( not ( = ?auto_105029 ?auto_105030 ) ) ( not ( = ?auto_105029 ?auto_105031 ) ) ( not ( = ?auto_105029 ?auto_105032 ) ) ( not ( = ?auto_105029 ?auto_105033 ) ) ( not ( = ?auto_105029 ?auto_105034 ) ) ( not ( = ?auto_105029 ?auto_105035 ) ) ( not ( = ?auto_105030 ?auto_105031 ) ) ( not ( = ?auto_105030 ?auto_105032 ) ) ( not ( = ?auto_105030 ?auto_105033 ) ) ( not ( = ?auto_105030 ?auto_105034 ) ) ( not ( = ?auto_105030 ?auto_105035 ) ) ( not ( = ?auto_105031 ?auto_105032 ) ) ( not ( = ?auto_105031 ?auto_105033 ) ) ( not ( = ?auto_105031 ?auto_105034 ) ) ( not ( = ?auto_105031 ?auto_105035 ) ) ( not ( = ?auto_105032 ?auto_105033 ) ) ( not ( = ?auto_105032 ?auto_105034 ) ) ( not ( = ?auto_105032 ?auto_105035 ) ) ( not ( = ?auto_105033 ?auto_105034 ) ) ( not ( = ?auto_105033 ?auto_105035 ) ) ( not ( = ?auto_105034 ?auto_105035 ) ) ( ON ?auto_105035 ?auto_105036 ) ( not ( = ?auto_105029 ?auto_105036 ) ) ( not ( = ?auto_105030 ?auto_105036 ) ) ( not ( = ?auto_105031 ?auto_105036 ) ) ( not ( = ?auto_105032 ?auto_105036 ) ) ( not ( = ?auto_105033 ?auto_105036 ) ) ( not ( = ?auto_105034 ?auto_105036 ) ) ( not ( = ?auto_105035 ?auto_105036 ) ) ( ON ?auto_105034 ?auto_105035 ) ( ON-TABLE ?auto_105036 ) ( ON ?auto_105033 ?auto_105034 ) ( ON ?auto_105032 ?auto_105033 ) ( ON ?auto_105031 ?auto_105032 ) ( CLEAR ?auto_105031 ) ( HOLDING ?auto_105030 ) ( CLEAR ?auto_105029 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_105029 ?auto_105030 )
      ( MAKE-7PILE ?auto_105029 ?auto_105030 ?auto_105031 ?auto_105032 ?auto_105033 ?auto_105034 ?auto_105035 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_105037 - BLOCK
      ?auto_105038 - BLOCK
      ?auto_105039 - BLOCK
      ?auto_105040 - BLOCK
      ?auto_105041 - BLOCK
      ?auto_105042 - BLOCK
      ?auto_105043 - BLOCK
    )
    :vars
    (
      ?auto_105044 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_105037 ) ( not ( = ?auto_105037 ?auto_105038 ) ) ( not ( = ?auto_105037 ?auto_105039 ) ) ( not ( = ?auto_105037 ?auto_105040 ) ) ( not ( = ?auto_105037 ?auto_105041 ) ) ( not ( = ?auto_105037 ?auto_105042 ) ) ( not ( = ?auto_105037 ?auto_105043 ) ) ( not ( = ?auto_105038 ?auto_105039 ) ) ( not ( = ?auto_105038 ?auto_105040 ) ) ( not ( = ?auto_105038 ?auto_105041 ) ) ( not ( = ?auto_105038 ?auto_105042 ) ) ( not ( = ?auto_105038 ?auto_105043 ) ) ( not ( = ?auto_105039 ?auto_105040 ) ) ( not ( = ?auto_105039 ?auto_105041 ) ) ( not ( = ?auto_105039 ?auto_105042 ) ) ( not ( = ?auto_105039 ?auto_105043 ) ) ( not ( = ?auto_105040 ?auto_105041 ) ) ( not ( = ?auto_105040 ?auto_105042 ) ) ( not ( = ?auto_105040 ?auto_105043 ) ) ( not ( = ?auto_105041 ?auto_105042 ) ) ( not ( = ?auto_105041 ?auto_105043 ) ) ( not ( = ?auto_105042 ?auto_105043 ) ) ( ON ?auto_105043 ?auto_105044 ) ( not ( = ?auto_105037 ?auto_105044 ) ) ( not ( = ?auto_105038 ?auto_105044 ) ) ( not ( = ?auto_105039 ?auto_105044 ) ) ( not ( = ?auto_105040 ?auto_105044 ) ) ( not ( = ?auto_105041 ?auto_105044 ) ) ( not ( = ?auto_105042 ?auto_105044 ) ) ( not ( = ?auto_105043 ?auto_105044 ) ) ( ON ?auto_105042 ?auto_105043 ) ( ON-TABLE ?auto_105044 ) ( ON ?auto_105041 ?auto_105042 ) ( ON ?auto_105040 ?auto_105041 ) ( ON ?auto_105039 ?auto_105040 ) ( CLEAR ?auto_105037 ) ( ON ?auto_105038 ?auto_105039 ) ( CLEAR ?auto_105038 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_105044 ?auto_105043 ?auto_105042 ?auto_105041 ?auto_105040 ?auto_105039 )
      ( MAKE-7PILE ?auto_105037 ?auto_105038 ?auto_105039 ?auto_105040 ?auto_105041 ?auto_105042 ?auto_105043 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_105045 - BLOCK
      ?auto_105046 - BLOCK
      ?auto_105047 - BLOCK
      ?auto_105048 - BLOCK
      ?auto_105049 - BLOCK
      ?auto_105050 - BLOCK
      ?auto_105051 - BLOCK
    )
    :vars
    (
      ?auto_105052 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105045 ?auto_105046 ) ) ( not ( = ?auto_105045 ?auto_105047 ) ) ( not ( = ?auto_105045 ?auto_105048 ) ) ( not ( = ?auto_105045 ?auto_105049 ) ) ( not ( = ?auto_105045 ?auto_105050 ) ) ( not ( = ?auto_105045 ?auto_105051 ) ) ( not ( = ?auto_105046 ?auto_105047 ) ) ( not ( = ?auto_105046 ?auto_105048 ) ) ( not ( = ?auto_105046 ?auto_105049 ) ) ( not ( = ?auto_105046 ?auto_105050 ) ) ( not ( = ?auto_105046 ?auto_105051 ) ) ( not ( = ?auto_105047 ?auto_105048 ) ) ( not ( = ?auto_105047 ?auto_105049 ) ) ( not ( = ?auto_105047 ?auto_105050 ) ) ( not ( = ?auto_105047 ?auto_105051 ) ) ( not ( = ?auto_105048 ?auto_105049 ) ) ( not ( = ?auto_105048 ?auto_105050 ) ) ( not ( = ?auto_105048 ?auto_105051 ) ) ( not ( = ?auto_105049 ?auto_105050 ) ) ( not ( = ?auto_105049 ?auto_105051 ) ) ( not ( = ?auto_105050 ?auto_105051 ) ) ( ON ?auto_105051 ?auto_105052 ) ( not ( = ?auto_105045 ?auto_105052 ) ) ( not ( = ?auto_105046 ?auto_105052 ) ) ( not ( = ?auto_105047 ?auto_105052 ) ) ( not ( = ?auto_105048 ?auto_105052 ) ) ( not ( = ?auto_105049 ?auto_105052 ) ) ( not ( = ?auto_105050 ?auto_105052 ) ) ( not ( = ?auto_105051 ?auto_105052 ) ) ( ON ?auto_105050 ?auto_105051 ) ( ON-TABLE ?auto_105052 ) ( ON ?auto_105049 ?auto_105050 ) ( ON ?auto_105048 ?auto_105049 ) ( ON ?auto_105047 ?auto_105048 ) ( ON ?auto_105046 ?auto_105047 ) ( CLEAR ?auto_105046 ) ( HOLDING ?auto_105045 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_105045 )
      ( MAKE-7PILE ?auto_105045 ?auto_105046 ?auto_105047 ?auto_105048 ?auto_105049 ?auto_105050 ?auto_105051 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_105053 - BLOCK
      ?auto_105054 - BLOCK
      ?auto_105055 - BLOCK
      ?auto_105056 - BLOCK
      ?auto_105057 - BLOCK
      ?auto_105058 - BLOCK
      ?auto_105059 - BLOCK
    )
    :vars
    (
      ?auto_105060 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105053 ?auto_105054 ) ) ( not ( = ?auto_105053 ?auto_105055 ) ) ( not ( = ?auto_105053 ?auto_105056 ) ) ( not ( = ?auto_105053 ?auto_105057 ) ) ( not ( = ?auto_105053 ?auto_105058 ) ) ( not ( = ?auto_105053 ?auto_105059 ) ) ( not ( = ?auto_105054 ?auto_105055 ) ) ( not ( = ?auto_105054 ?auto_105056 ) ) ( not ( = ?auto_105054 ?auto_105057 ) ) ( not ( = ?auto_105054 ?auto_105058 ) ) ( not ( = ?auto_105054 ?auto_105059 ) ) ( not ( = ?auto_105055 ?auto_105056 ) ) ( not ( = ?auto_105055 ?auto_105057 ) ) ( not ( = ?auto_105055 ?auto_105058 ) ) ( not ( = ?auto_105055 ?auto_105059 ) ) ( not ( = ?auto_105056 ?auto_105057 ) ) ( not ( = ?auto_105056 ?auto_105058 ) ) ( not ( = ?auto_105056 ?auto_105059 ) ) ( not ( = ?auto_105057 ?auto_105058 ) ) ( not ( = ?auto_105057 ?auto_105059 ) ) ( not ( = ?auto_105058 ?auto_105059 ) ) ( ON ?auto_105059 ?auto_105060 ) ( not ( = ?auto_105053 ?auto_105060 ) ) ( not ( = ?auto_105054 ?auto_105060 ) ) ( not ( = ?auto_105055 ?auto_105060 ) ) ( not ( = ?auto_105056 ?auto_105060 ) ) ( not ( = ?auto_105057 ?auto_105060 ) ) ( not ( = ?auto_105058 ?auto_105060 ) ) ( not ( = ?auto_105059 ?auto_105060 ) ) ( ON ?auto_105058 ?auto_105059 ) ( ON-TABLE ?auto_105060 ) ( ON ?auto_105057 ?auto_105058 ) ( ON ?auto_105056 ?auto_105057 ) ( ON ?auto_105055 ?auto_105056 ) ( ON ?auto_105054 ?auto_105055 ) ( ON ?auto_105053 ?auto_105054 ) ( CLEAR ?auto_105053 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_105060 ?auto_105059 ?auto_105058 ?auto_105057 ?auto_105056 ?auto_105055 ?auto_105054 )
      ( MAKE-7PILE ?auto_105053 ?auto_105054 ?auto_105055 ?auto_105056 ?auto_105057 ?auto_105058 ?auto_105059 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_105167 - BLOCK
    )
    :vars
    (
      ?auto_105168 - BLOCK
      ?auto_105169 - BLOCK
      ?auto_105170 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105167 ?auto_105168 ) ( CLEAR ?auto_105167 ) ( not ( = ?auto_105167 ?auto_105168 ) ) ( HOLDING ?auto_105169 ) ( CLEAR ?auto_105170 ) ( not ( = ?auto_105167 ?auto_105169 ) ) ( not ( = ?auto_105167 ?auto_105170 ) ) ( not ( = ?auto_105168 ?auto_105169 ) ) ( not ( = ?auto_105168 ?auto_105170 ) ) ( not ( = ?auto_105169 ?auto_105170 ) ) )
    :subtasks
    ( ( !STACK ?auto_105169 ?auto_105170 )
      ( MAKE-1PILE ?auto_105167 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_105171 - BLOCK
    )
    :vars
    (
      ?auto_105172 - BLOCK
      ?auto_105173 - BLOCK
      ?auto_105174 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105171 ?auto_105172 ) ( not ( = ?auto_105171 ?auto_105172 ) ) ( CLEAR ?auto_105173 ) ( not ( = ?auto_105171 ?auto_105174 ) ) ( not ( = ?auto_105171 ?auto_105173 ) ) ( not ( = ?auto_105172 ?auto_105174 ) ) ( not ( = ?auto_105172 ?auto_105173 ) ) ( not ( = ?auto_105174 ?auto_105173 ) ) ( ON ?auto_105174 ?auto_105171 ) ( CLEAR ?auto_105174 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_105172 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_105172 ?auto_105171 )
      ( MAKE-1PILE ?auto_105171 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_105175 - BLOCK
    )
    :vars
    (
      ?auto_105177 - BLOCK
      ?auto_105178 - BLOCK
      ?auto_105176 - BLOCK
      ?auto_105180 - BLOCK
      ?auto_105182 - BLOCK
      ?auto_105179 - BLOCK
      ?auto_105181 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105175 ?auto_105177 ) ( not ( = ?auto_105175 ?auto_105177 ) ) ( not ( = ?auto_105175 ?auto_105178 ) ) ( not ( = ?auto_105175 ?auto_105176 ) ) ( not ( = ?auto_105177 ?auto_105178 ) ) ( not ( = ?auto_105177 ?auto_105176 ) ) ( not ( = ?auto_105178 ?auto_105176 ) ) ( ON ?auto_105178 ?auto_105175 ) ( CLEAR ?auto_105178 ) ( ON-TABLE ?auto_105177 ) ( HOLDING ?auto_105176 ) ( CLEAR ?auto_105180 ) ( ON-TABLE ?auto_105182 ) ( ON ?auto_105179 ?auto_105182 ) ( ON ?auto_105181 ?auto_105179 ) ( ON ?auto_105180 ?auto_105181 ) ( not ( = ?auto_105182 ?auto_105179 ) ) ( not ( = ?auto_105182 ?auto_105181 ) ) ( not ( = ?auto_105182 ?auto_105180 ) ) ( not ( = ?auto_105182 ?auto_105176 ) ) ( not ( = ?auto_105179 ?auto_105181 ) ) ( not ( = ?auto_105179 ?auto_105180 ) ) ( not ( = ?auto_105179 ?auto_105176 ) ) ( not ( = ?auto_105181 ?auto_105180 ) ) ( not ( = ?auto_105181 ?auto_105176 ) ) ( not ( = ?auto_105180 ?auto_105176 ) ) ( not ( = ?auto_105175 ?auto_105180 ) ) ( not ( = ?auto_105175 ?auto_105182 ) ) ( not ( = ?auto_105175 ?auto_105179 ) ) ( not ( = ?auto_105175 ?auto_105181 ) ) ( not ( = ?auto_105177 ?auto_105180 ) ) ( not ( = ?auto_105177 ?auto_105182 ) ) ( not ( = ?auto_105177 ?auto_105179 ) ) ( not ( = ?auto_105177 ?auto_105181 ) ) ( not ( = ?auto_105178 ?auto_105180 ) ) ( not ( = ?auto_105178 ?auto_105182 ) ) ( not ( = ?auto_105178 ?auto_105179 ) ) ( not ( = ?auto_105178 ?auto_105181 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_105182 ?auto_105179 ?auto_105181 ?auto_105180 ?auto_105176 )
      ( MAKE-1PILE ?auto_105175 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_105183 - BLOCK
    )
    :vars
    (
      ?auto_105189 - BLOCK
      ?auto_105186 - BLOCK
      ?auto_105184 - BLOCK
      ?auto_105190 - BLOCK
      ?auto_105188 - BLOCK
      ?auto_105187 - BLOCK
      ?auto_105185 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105183 ?auto_105189 ) ( not ( = ?auto_105183 ?auto_105189 ) ) ( not ( = ?auto_105183 ?auto_105186 ) ) ( not ( = ?auto_105183 ?auto_105184 ) ) ( not ( = ?auto_105189 ?auto_105186 ) ) ( not ( = ?auto_105189 ?auto_105184 ) ) ( not ( = ?auto_105186 ?auto_105184 ) ) ( ON ?auto_105186 ?auto_105183 ) ( ON-TABLE ?auto_105189 ) ( CLEAR ?auto_105190 ) ( ON-TABLE ?auto_105188 ) ( ON ?auto_105187 ?auto_105188 ) ( ON ?auto_105185 ?auto_105187 ) ( ON ?auto_105190 ?auto_105185 ) ( not ( = ?auto_105188 ?auto_105187 ) ) ( not ( = ?auto_105188 ?auto_105185 ) ) ( not ( = ?auto_105188 ?auto_105190 ) ) ( not ( = ?auto_105188 ?auto_105184 ) ) ( not ( = ?auto_105187 ?auto_105185 ) ) ( not ( = ?auto_105187 ?auto_105190 ) ) ( not ( = ?auto_105187 ?auto_105184 ) ) ( not ( = ?auto_105185 ?auto_105190 ) ) ( not ( = ?auto_105185 ?auto_105184 ) ) ( not ( = ?auto_105190 ?auto_105184 ) ) ( not ( = ?auto_105183 ?auto_105190 ) ) ( not ( = ?auto_105183 ?auto_105188 ) ) ( not ( = ?auto_105183 ?auto_105187 ) ) ( not ( = ?auto_105183 ?auto_105185 ) ) ( not ( = ?auto_105189 ?auto_105190 ) ) ( not ( = ?auto_105189 ?auto_105188 ) ) ( not ( = ?auto_105189 ?auto_105187 ) ) ( not ( = ?auto_105189 ?auto_105185 ) ) ( not ( = ?auto_105186 ?auto_105190 ) ) ( not ( = ?auto_105186 ?auto_105188 ) ) ( not ( = ?auto_105186 ?auto_105187 ) ) ( not ( = ?auto_105186 ?auto_105185 ) ) ( ON ?auto_105184 ?auto_105186 ) ( CLEAR ?auto_105184 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_105189 ?auto_105183 ?auto_105186 )
      ( MAKE-1PILE ?auto_105183 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_105191 - BLOCK
    )
    :vars
    (
      ?auto_105198 - BLOCK
      ?auto_105193 - BLOCK
      ?auto_105196 - BLOCK
      ?auto_105194 - BLOCK
      ?auto_105197 - BLOCK
      ?auto_105192 - BLOCK
      ?auto_105195 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105191 ?auto_105198 ) ( not ( = ?auto_105191 ?auto_105198 ) ) ( not ( = ?auto_105191 ?auto_105193 ) ) ( not ( = ?auto_105191 ?auto_105196 ) ) ( not ( = ?auto_105198 ?auto_105193 ) ) ( not ( = ?auto_105198 ?auto_105196 ) ) ( not ( = ?auto_105193 ?auto_105196 ) ) ( ON ?auto_105193 ?auto_105191 ) ( ON-TABLE ?auto_105198 ) ( ON-TABLE ?auto_105194 ) ( ON ?auto_105197 ?auto_105194 ) ( ON ?auto_105192 ?auto_105197 ) ( not ( = ?auto_105194 ?auto_105197 ) ) ( not ( = ?auto_105194 ?auto_105192 ) ) ( not ( = ?auto_105194 ?auto_105195 ) ) ( not ( = ?auto_105194 ?auto_105196 ) ) ( not ( = ?auto_105197 ?auto_105192 ) ) ( not ( = ?auto_105197 ?auto_105195 ) ) ( not ( = ?auto_105197 ?auto_105196 ) ) ( not ( = ?auto_105192 ?auto_105195 ) ) ( not ( = ?auto_105192 ?auto_105196 ) ) ( not ( = ?auto_105195 ?auto_105196 ) ) ( not ( = ?auto_105191 ?auto_105195 ) ) ( not ( = ?auto_105191 ?auto_105194 ) ) ( not ( = ?auto_105191 ?auto_105197 ) ) ( not ( = ?auto_105191 ?auto_105192 ) ) ( not ( = ?auto_105198 ?auto_105195 ) ) ( not ( = ?auto_105198 ?auto_105194 ) ) ( not ( = ?auto_105198 ?auto_105197 ) ) ( not ( = ?auto_105198 ?auto_105192 ) ) ( not ( = ?auto_105193 ?auto_105195 ) ) ( not ( = ?auto_105193 ?auto_105194 ) ) ( not ( = ?auto_105193 ?auto_105197 ) ) ( not ( = ?auto_105193 ?auto_105192 ) ) ( ON ?auto_105196 ?auto_105193 ) ( CLEAR ?auto_105196 ) ( HOLDING ?auto_105195 ) ( CLEAR ?auto_105192 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_105194 ?auto_105197 ?auto_105192 ?auto_105195 )
      ( MAKE-1PILE ?auto_105191 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_105199 - BLOCK
    )
    :vars
    (
      ?auto_105201 - BLOCK
      ?auto_105204 - BLOCK
      ?auto_105206 - BLOCK
      ?auto_105200 - BLOCK
      ?auto_105205 - BLOCK
      ?auto_105203 - BLOCK
      ?auto_105202 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105199 ?auto_105201 ) ( not ( = ?auto_105199 ?auto_105201 ) ) ( not ( = ?auto_105199 ?auto_105204 ) ) ( not ( = ?auto_105199 ?auto_105206 ) ) ( not ( = ?auto_105201 ?auto_105204 ) ) ( not ( = ?auto_105201 ?auto_105206 ) ) ( not ( = ?auto_105204 ?auto_105206 ) ) ( ON ?auto_105204 ?auto_105199 ) ( ON-TABLE ?auto_105201 ) ( ON-TABLE ?auto_105200 ) ( ON ?auto_105205 ?auto_105200 ) ( ON ?auto_105203 ?auto_105205 ) ( not ( = ?auto_105200 ?auto_105205 ) ) ( not ( = ?auto_105200 ?auto_105203 ) ) ( not ( = ?auto_105200 ?auto_105202 ) ) ( not ( = ?auto_105200 ?auto_105206 ) ) ( not ( = ?auto_105205 ?auto_105203 ) ) ( not ( = ?auto_105205 ?auto_105202 ) ) ( not ( = ?auto_105205 ?auto_105206 ) ) ( not ( = ?auto_105203 ?auto_105202 ) ) ( not ( = ?auto_105203 ?auto_105206 ) ) ( not ( = ?auto_105202 ?auto_105206 ) ) ( not ( = ?auto_105199 ?auto_105202 ) ) ( not ( = ?auto_105199 ?auto_105200 ) ) ( not ( = ?auto_105199 ?auto_105205 ) ) ( not ( = ?auto_105199 ?auto_105203 ) ) ( not ( = ?auto_105201 ?auto_105202 ) ) ( not ( = ?auto_105201 ?auto_105200 ) ) ( not ( = ?auto_105201 ?auto_105205 ) ) ( not ( = ?auto_105201 ?auto_105203 ) ) ( not ( = ?auto_105204 ?auto_105202 ) ) ( not ( = ?auto_105204 ?auto_105200 ) ) ( not ( = ?auto_105204 ?auto_105205 ) ) ( not ( = ?auto_105204 ?auto_105203 ) ) ( ON ?auto_105206 ?auto_105204 ) ( CLEAR ?auto_105203 ) ( ON ?auto_105202 ?auto_105206 ) ( CLEAR ?auto_105202 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_105201 ?auto_105199 ?auto_105204 ?auto_105206 )
      ( MAKE-1PILE ?auto_105199 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_105207 - BLOCK
    )
    :vars
    (
      ?auto_105214 - BLOCK
      ?auto_105212 - BLOCK
      ?auto_105210 - BLOCK
      ?auto_105209 - BLOCK
      ?auto_105211 - BLOCK
      ?auto_105213 - BLOCK
      ?auto_105208 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105207 ?auto_105214 ) ( not ( = ?auto_105207 ?auto_105214 ) ) ( not ( = ?auto_105207 ?auto_105212 ) ) ( not ( = ?auto_105207 ?auto_105210 ) ) ( not ( = ?auto_105214 ?auto_105212 ) ) ( not ( = ?auto_105214 ?auto_105210 ) ) ( not ( = ?auto_105212 ?auto_105210 ) ) ( ON ?auto_105212 ?auto_105207 ) ( ON-TABLE ?auto_105214 ) ( ON-TABLE ?auto_105209 ) ( ON ?auto_105211 ?auto_105209 ) ( not ( = ?auto_105209 ?auto_105211 ) ) ( not ( = ?auto_105209 ?auto_105213 ) ) ( not ( = ?auto_105209 ?auto_105208 ) ) ( not ( = ?auto_105209 ?auto_105210 ) ) ( not ( = ?auto_105211 ?auto_105213 ) ) ( not ( = ?auto_105211 ?auto_105208 ) ) ( not ( = ?auto_105211 ?auto_105210 ) ) ( not ( = ?auto_105213 ?auto_105208 ) ) ( not ( = ?auto_105213 ?auto_105210 ) ) ( not ( = ?auto_105208 ?auto_105210 ) ) ( not ( = ?auto_105207 ?auto_105208 ) ) ( not ( = ?auto_105207 ?auto_105209 ) ) ( not ( = ?auto_105207 ?auto_105211 ) ) ( not ( = ?auto_105207 ?auto_105213 ) ) ( not ( = ?auto_105214 ?auto_105208 ) ) ( not ( = ?auto_105214 ?auto_105209 ) ) ( not ( = ?auto_105214 ?auto_105211 ) ) ( not ( = ?auto_105214 ?auto_105213 ) ) ( not ( = ?auto_105212 ?auto_105208 ) ) ( not ( = ?auto_105212 ?auto_105209 ) ) ( not ( = ?auto_105212 ?auto_105211 ) ) ( not ( = ?auto_105212 ?auto_105213 ) ) ( ON ?auto_105210 ?auto_105212 ) ( ON ?auto_105208 ?auto_105210 ) ( CLEAR ?auto_105208 ) ( HOLDING ?auto_105213 ) ( CLEAR ?auto_105211 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_105209 ?auto_105211 ?auto_105213 )
      ( MAKE-1PILE ?auto_105207 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_105215 - BLOCK
    )
    :vars
    (
      ?auto_105222 - BLOCK
      ?auto_105220 - BLOCK
      ?auto_105219 - BLOCK
      ?auto_105218 - BLOCK
      ?auto_105217 - BLOCK
      ?auto_105216 - BLOCK
      ?auto_105221 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105215 ?auto_105222 ) ( not ( = ?auto_105215 ?auto_105222 ) ) ( not ( = ?auto_105215 ?auto_105220 ) ) ( not ( = ?auto_105215 ?auto_105219 ) ) ( not ( = ?auto_105222 ?auto_105220 ) ) ( not ( = ?auto_105222 ?auto_105219 ) ) ( not ( = ?auto_105220 ?auto_105219 ) ) ( ON ?auto_105220 ?auto_105215 ) ( ON-TABLE ?auto_105222 ) ( ON-TABLE ?auto_105218 ) ( ON ?auto_105217 ?auto_105218 ) ( not ( = ?auto_105218 ?auto_105217 ) ) ( not ( = ?auto_105218 ?auto_105216 ) ) ( not ( = ?auto_105218 ?auto_105221 ) ) ( not ( = ?auto_105218 ?auto_105219 ) ) ( not ( = ?auto_105217 ?auto_105216 ) ) ( not ( = ?auto_105217 ?auto_105221 ) ) ( not ( = ?auto_105217 ?auto_105219 ) ) ( not ( = ?auto_105216 ?auto_105221 ) ) ( not ( = ?auto_105216 ?auto_105219 ) ) ( not ( = ?auto_105221 ?auto_105219 ) ) ( not ( = ?auto_105215 ?auto_105221 ) ) ( not ( = ?auto_105215 ?auto_105218 ) ) ( not ( = ?auto_105215 ?auto_105217 ) ) ( not ( = ?auto_105215 ?auto_105216 ) ) ( not ( = ?auto_105222 ?auto_105221 ) ) ( not ( = ?auto_105222 ?auto_105218 ) ) ( not ( = ?auto_105222 ?auto_105217 ) ) ( not ( = ?auto_105222 ?auto_105216 ) ) ( not ( = ?auto_105220 ?auto_105221 ) ) ( not ( = ?auto_105220 ?auto_105218 ) ) ( not ( = ?auto_105220 ?auto_105217 ) ) ( not ( = ?auto_105220 ?auto_105216 ) ) ( ON ?auto_105219 ?auto_105220 ) ( ON ?auto_105221 ?auto_105219 ) ( CLEAR ?auto_105217 ) ( ON ?auto_105216 ?auto_105221 ) ( CLEAR ?auto_105216 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_105222 ?auto_105215 ?auto_105220 ?auto_105219 ?auto_105221 )
      ( MAKE-1PILE ?auto_105215 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_105223 - BLOCK
    )
    :vars
    (
      ?auto_105229 - BLOCK
      ?auto_105227 - BLOCK
      ?auto_105226 - BLOCK
      ?auto_105230 - BLOCK
      ?auto_105228 - BLOCK
      ?auto_105224 - BLOCK
      ?auto_105225 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105223 ?auto_105229 ) ( not ( = ?auto_105223 ?auto_105229 ) ) ( not ( = ?auto_105223 ?auto_105227 ) ) ( not ( = ?auto_105223 ?auto_105226 ) ) ( not ( = ?auto_105229 ?auto_105227 ) ) ( not ( = ?auto_105229 ?auto_105226 ) ) ( not ( = ?auto_105227 ?auto_105226 ) ) ( ON ?auto_105227 ?auto_105223 ) ( ON-TABLE ?auto_105229 ) ( ON-TABLE ?auto_105230 ) ( not ( = ?auto_105230 ?auto_105228 ) ) ( not ( = ?auto_105230 ?auto_105224 ) ) ( not ( = ?auto_105230 ?auto_105225 ) ) ( not ( = ?auto_105230 ?auto_105226 ) ) ( not ( = ?auto_105228 ?auto_105224 ) ) ( not ( = ?auto_105228 ?auto_105225 ) ) ( not ( = ?auto_105228 ?auto_105226 ) ) ( not ( = ?auto_105224 ?auto_105225 ) ) ( not ( = ?auto_105224 ?auto_105226 ) ) ( not ( = ?auto_105225 ?auto_105226 ) ) ( not ( = ?auto_105223 ?auto_105225 ) ) ( not ( = ?auto_105223 ?auto_105230 ) ) ( not ( = ?auto_105223 ?auto_105228 ) ) ( not ( = ?auto_105223 ?auto_105224 ) ) ( not ( = ?auto_105229 ?auto_105225 ) ) ( not ( = ?auto_105229 ?auto_105230 ) ) ( not ( = ?auto_105229 ?auto_105228 ) ) ( not ( = ?auto_105229 ?auto_105224 ) ) ( not ( = ?auto_105227 ?auto_105225 ) ) ( not ( = ?auto_105227 ?auto_105230 ) ) ( not ( = ?auto_105227 ?auto_105228 ) ) ( not ( = ?auto_105227 ?auto_105224 ) ) ( ON ?auto_105226 ?auto_105227 ) ( ON ?auto_105225 ?auto_105226 ) ( ON ?auto_105224 ?auto_105225 ) ( CLEAR ?auto_105224 ) ( HOLDING ?auto_105228 ) ( CLEAR ?auto_105230 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_105230 ?auto_105228 )
      ( MAKE-1PILE ?auto_105223 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_105231 - BLOCK
    )
    :vars
    (
      ?auto_105234 - BLOCK
      ?auto_105236 - BLOCK
      ?auto_105233 - BLOCK
      ?auto_105237 - BLOCK
      ?auto_105232 - BLOCK
      ?auto_105238 - BLOCK
      ?auto_105235 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105231 ?auto_105234 ) ( not ( = ?auto_105231 ?auto_105234 ) ) ( not ( = ?auto_105231 ?auto_105236 ) ) ( not ( = ?auto_105231 ?auto_105233 ) ) ( not ( = ?auto_105234 ?auto_105236 ) ) ( not ( = ?auto_105234 ?auto_105233 ) ) ( not ( = ?auto_105236 ?auto_105233 ) ) ( ON ?auto_105236 ?auto_105231 ) ( ON-TABLE ?auto_105234 ) ( ON-TABLE ?auto_105237 ) ( not ( = ?auto_105237 ?auto_105232 ) ) ( not ( = ?auto_105237 ?auto_105238 ) ) ( not ( = ?auto_105237 ?auto_105235 ) ) ( not ( = ?auto_105237 ?auto_105233 ) ) ( not ( = ?auto_105232 ?auto_105238 ) ) ( not ( = ?auto_105232 ?auto_105235 ) ) ( not ( = ?auto_105232 ?auto_105233 ) ) ( not ( = ?auto_105238 ?auto_105235 ) ) ( not ( = ?auto_105238 ?auto_105233 ) ) ( not ( = ?auto_105235 ?auto_105233 ) ) ( not ( = ?auto_105231 ?auto_105235 ) ) ( not ( = ?auto_105231 ?auto_105237 ) ) ( not ( = ?auto_105231 ?auto_105232 ) ) ( not ( = ?auto_105231 ?auto_105238 ) ) ( not ( = ?auto_105234 ?auto_105235 ) ) ( not ( = ?auto_105234 ?auto_105237 ) ) ( not ( = ?auto_105234 ?auto_105232 ) ) ( not ( = ?auto_105234 ?auto_105238 ) ) ( not ( = ?auto_105236 ?auto_105235 ) ) ( not ( = ?auto_105236 ?auto_105237 ) ) ( not ( = ?auto_105236 ?auto_105232 ) ) ( not ( = ?auto_105236 ?auto_105238 ) ) ( ON ?auto_105233 ?auto_105236 ) ( ON ?auto_105235 ?auto_105233 ) ( ON ?auto_105238 ?auto_105235 ) ( CLEAR ?auto_105237 ) ( ON ?auto_105232 ?auto_105238 ) ( CLEAR ?auto_105232 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_105234 ?auto_105231 ?auto_105236 ?auto_105233 ?auto_105235 ?auto_105238 )
      ( MAKE-1PILE ?auto_105231 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_105239 - BLOCK
    )
    :vars
    (
      ?auto_105245 - BLOCK
      ?auto_105246 - BLOCK
      ?auto_105243 - BLOCK
      ?auto_105240 - BLOCK
      ?auto_105244 - BLOCK
      ?auto_105242 - BLOCK
      ?auto_105241 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105239 ?auto_105245 ) ( not ( = ?auto_105239 ?auto_105245 ) ) ( not ( = ?auto_105239 ?auto_105246 ) ) ( not ( = ?auto_105239 ?auto_105243 ) ) ( not ( = ?auto_105245 ?auto_105246 ) ) ( not ( = ?auto_105245 ?auto_105243 ) ) ( not ( = ?auto_105246 ?auto_105243 ) ) ( ON ?auto_105246 ?auto_105239 ) ( ON-TABLE ?auto_105245 ) ( not ( = ?auto_105240 ?auto_105244 ) ) ( not ( = ?auto_105240 ?auto_105242 ) ) ( not ( = ?auto_105240 ?auto_105241 ) ) ( not ( = ?auto_105240 ?auto_105243 ) ) ( not ( = ?auto_105244 ?auto_105242 ) ) ( not ( = ?auto_105244 ?auto_105241 ) ) ( not ( = ?auto_105244 ?auto_105243 ) ) ( not ( = ?auto_105242 ?auto_105241 ) ) ( not ( = ?auto_105242 ?auto_105243 ) ) ( not ( = ?auto_105241 ?auto_105243 ) ) ( not ( = ?auto_105239 ?auto_105241 ) ) ( not ( = ?auto_105239 ?auto_105240 ) ) ( not ( = ?auto_105239 ?auto_105244 ) ) ( not ( = ?auto_105239 ?auto_105242 ) ) ( not ( = ?auto_105245 ?auto_105241 ) ) ( not ( = ?auto_105245 ?auto_105240 ) ) ( not ( = ?auto_105245 ?auto_105244 ) ) ( not ( = ?auto_105245 ?auto_105242 ) ) ( not ( = ?auto_105246 ?auto_105241 ) ) ( not ( = ?auto_105246 ?auto_105240 ) ) ( not ( = ?auto_105246 ?auto_105244 ) ) ( not ( = ?auto_105246 ?auto_105242 ) ) ( ON ?auto_105243 ?auto_105246 ) ( ON ?auto_105241 ?auto_105243 ) ( ON ?auto_105242 ?auto_105241 ) ( ON ?auto_105244 ?auto_105242 ) ( CLEAR ?auto_105244 ) ( HOLDING ?auto_105240 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_105240 )
      ( MAKE-1PILE ?auto_105239 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_105247 - BLOCK
    )
    :vars
    (
      ?auto_105252 - BLOCK
      ?auto_105250 - BLOCK
      ?auto_105254 - BLOCK
      ?auto_105249 - BLOCK
      ?auto_105251 - BLOCK
      ?auto_105253 - BLOCK
      ?auto_105248 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105247 ?auto_105252 ) ( not ( = ?auto_105247 ?auto_105252 ) ) ( not ( = ?auto_105247 ?auto_105250 ) ) ( not ( = ?auto_105247 ?auto_105254 ) ) ( not ( = ?auto_105252 ?auto_105250 ) ) ( not ( = ?auto_105252 ?auto_105254 ) ) ( not ( = ?auto_105250 ?auto_105254 ) ) ( ON ?auto_105250 ?auto_105247 ) ( ON-TABLE ?auto_105252 ) ( not ( = ?auto_105249 ?auto_105251 ) ) ( not ( = ?auto_105249 ?auto_105253 ) ) ( not ( = ?auto_105249 ?auto_105248 ) ) ( not ( = ?auto_105249 ?auto_105254 ) ) ( not ( = ?auto_105251 ?auto_105253 ) ) ( not ( = ?auto_105251 ?auto_105248 ) ) ( not ( = ?auto_105251 ?auto_105254 ) ) ( not ( = ?auto_105253 ?auto_105248 ) ) ( not ( = ?auto_105253 ?auto_105254 ) ) ( not ( = ?auto_105248 ?auto_105254 ) ) ( not ( = ?auto_105247 ?auto_105248 ) ) ( not ( = ?auto_105247 ?auto_105249 ) ) ( not ( = ?auto_105247 ?auto_105251 ) ) ( not ( = ?auto_105247 ?auto_105253 ) ) ( not ( = ?auto_105252 ?auto_105248 ) ) ( not ( = ?auto_105252 ?auto_105249 ) ) ( not ( = ?auto_105252 ?auto_105251 ) ) ( not ( = ?auto_105252 ?auto_105253 ) ) ( not ( = ?auto_105250 ?auto_105248 ) ) ( not ( = ?auto_105250 ?auto_105249 ) ) ( not ( = ?auto_105250 ?auto_105251 ) ) ( not ( = ?auto_105250 ?auto_105253 ) ) ( ON ?auto_105254 ?auto_105250 ) ( ON ?auto_105248 ?auto_105254 ) ( ON ?auto_105253 ?auto_105248 ) ( ON ?auto_105251 ?auto_105253 ) ( ON ?auto_105249 ?auto_105251 ) ( CLEAR ?auto_105249 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_105252 ?auto_105247 ?auto_105250 ?auto_105254 ?auto_105248 ?auto_105253 ?auto_105251 )
      ( MAKE-1PILE ?auto_105247 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_105266 - BLOCK
      ?auto_105267 - BLOCK
      ?auto_105268 - BLOCK
      ?auto_105269 - BLOCK
      ?auto_105270 - BLOCK
    )
    :vars
    (
      ?auto_105271 - BLOCK
      ?auto_105272 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105271 ?auto_105270 ) ( CLEAR ?auto_105271 ) ( ON-TABLE ?auto_105266 ) ( ON ?auto_105267 ?auto_105266 ) ( ON ?auto_105268 ?auto_105267 ) ( ON ?auto_105269 ?auto_105268 ) ( ON ?auto_105270 ?auto_105269 ) ( not ( = ?auto_105266 ?auto_105267 ) ) ( not ( = ?auto_105266 ?auto_105268 ) ) ( not ( = ?auto_105266 ?auto_105269 ) ) ( not ( = ?auto_105266 ?auto_105270 ) ) ( not ( = ?auto_105266 ?auto_105271 ) ) ( not ( = ?auto_105267 ?auto_105268 ) ) ( not ( = ?auto_105267 ?auto_105269 ) ) ( not ( = ?auto_105267 ?auto_105270 ) ) ( not ( = ?auto_105267 ?auto_105271 ) ) ( not ( = ?auto_105268 ?auto_105269 ) ) ( not ( = ?auto_105268 ?auto_105270 ) ) ( not ( = ?auto_105268 ?auto_105271 ) ) ( not ( = ?auto_105269 ?auto_105270 ) ) ( not ( = ?auto_105269 ?auto_105271 ) ) ( not ( = ?auto_105270 ?auto_105271 ) ) ( HOLDING ?auto_105272 ) ( not ( = ?auto_105266 ?auto_105272 ) ) ( not ( = ?auto_105267 ?auto_105272 ) ) ( not ( = ?auto_105268 ?auto_105272 ) ) ( not ( = ?auto_105269 ?auto_105272 ) ) ( not ( = ?auto_105270 ?auto_105272 ) ) ( not ( = ?auto_105271 ?auto_105272 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_105272 )
      ( MAKE-5PILE ?auto_105266 ?auto_105267 ?auto_105268 ?auto_105269 ?auto_105270 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_105363 - BLOCK
      ?auto_105364 - BLOCK
    )
    :vars
    (
      ?auto_105365 - BLOCK
      ?auto_105367 - BLOCK
      ?auto_105366 - BLOCK
      ?auto_105368 - BLOCK
      ?auto_105369 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105363 ?auto_105364 ) ) ( ON ?auto_105364 ?auto_105365 ) ( not ( = ?auto_105363 ?auto_105365 ) ) ( not ( = ?auto_105364 ?auto_105365 ) ) ( ON ?auto_105363 ?auto_105364 ) ( CLEAR ?auto_105363 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_105367 ) ( ON ?auto_105366 ?auto_105367 ) ( ON ?auto_105368 ?auto_105366 ) ( ON ?auto_105369 ?auto_105368 ) ( ON ?auto_105365 ?auto_105369 ) ( not ( = ?auto_105367 ?auto_105366 ) ) ( not ( = ?auto_105367 ?auto_105368 ) ) ( not ( = ?auto_105367 ?auto_105369 ) ) ( not ( = ?auto_105367 ?auto_105365 ) ) ( not ( = ?auto_105367 ?auto_105364 ) ) ( not ( = ?auto_105367 ?auto_105363 ) ) ( not ( = ?auto_105366 ?auto_105368 ) ) ( not ( = ?auto_105366 ?auto_105369 ) ) ( not ( = ?auto_105366 ?auto_105365 ) ) ( not ( = ?auto_105366 ?auto_105364 ) ) ( not ( = ?auto_105366 ?auto_105363 ) ) ( not ( = ?auto_105368 ?auto_105369 ) ) ( not ( = ?auto_105368 ?auto_105365 ) ) ( not ( = ?auto_105368 ?auto_105364 ) ) ( not ( = ?auto_105368 ?auto_105363 ) ) ( not ( = ?auto_105369 ?auto_105365 ) ) ( not ( = ?auto_105369 ?auto_105364 ) ) ( not ( = ?auto_105369 ?auto_105363 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_105367 ?auto_105366 ?auto_105368 ?auto_105369 ?auto_105365 ?auto_105364 )
      ( MAKE-2PILE ?auto_105363 ?auto_105364 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_105372 - BLOCK
      ?auto_105373 - BLOCK
    )
    :vars
    (
      ?auto_105374 - BLOCK
      ?auto_105375 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105372 ?auto_105373 ) ) ( ON ?auto_105373 ?auto_105374 ) ( CLEAR ?auto_105373 ) ( not ( = ?auto_105372 ?auto_105374 ) ) ( not ( = ?auto_105373 ?auto_105374 ) ) ( ON ?auto_105372 ?auto_105375 ) ( CLEAR ?auto_105372 ) ( HAND-EMPTY ) ( not ( = ?auto_105372 ?auto_105375 ) ) ( not ( = ?auto_105373 ?auto_105375 ) ) ( not ( = ?auto_105374 ?auto_105375 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_105372 ?auto_105375 )
      ( MAKE-2PILE ?auto_105372 ?auto_105373 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_105376 - BLOCK
      ?auto_105377 - BLOCK
    )
    :vars
    (
      ?auto_105379 - BLOCK
      ?auto_105378 - BLOCK
      ?auto_105380 - BLOCK
      ?auto_105383 - BLOCK
      ?auto_105382 - BLOCK
      ?auto_105381 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105376 ?auto_105377 ) ) ( not ( = ?auto_105376 ?auto_105379 ) ) ( not ( = ?auto_105377 ?auto_105379 ) ) ( ON ?auto_105376 ?auto_105378 ) ( CLEAR ?auto_105376 ) ( not ( = ?auto_105376 ?auto_105378 ) ) ( not ( = ?auto_105377 ?auto_105378 ) ) ( not ( = ?auto_105379 ?auto_105378 ) ) ( HOLDING ?auto_105377 ) ( CLEAR ?auto_105379 ) ( ON-TABLE ?auto_105380 ) ( ON ?auto_105383 ?auto_105380 ) ( ON ?auto_105382 ?auto_105383 ) ( ON ?auto_105381 ?auto_105382 ) ( ON ?auto_105379 ?auto_105381 ) ( not ( = ?auto_105380 ?auto_105383 ) ) ( not ( = ?auto_105380 ?auto_105382 ) ) ( not ( = ?auto_105380 ?auto_105381 ) ) ( not ( = ?auto_105380 ?auto_105379 ) ) ( not ( = ?auto_105380 ?auto_105377 ) ) ( not ( = ?auto_105383 ?auto_105382 ) ) ( not ( = ?auto_105383 ?auto_105381 ) ) ( not ( = ?auto_105383 ?auto_105379 ) ) ( not ( = ?auto_105383 ?auto_105377 ) ) ( not ( = ?auto_105382 ?auto_105381 ) ) ( not ( = ?auto_105382 ?auto_105379 ) ) ( not ( = ?auto_105382 ?auto_105377 ) ) ( not ( = ?auto_105381 ?auto_105379 ) ) ( not ( = ?auto_105381 ?auto_105377 ) ) ( not ( = ?auto_105376 ?auto_105380 ) ) ( not ( = ?auto_105376 ?auto_105383 ) ) ( not ( = ?auto_105376 ?auto_105382 ) ) ( not ( = ?auto_105376 ?auto_105381 ) ) ( not ( = ?auto_105378 ?auto_105380 ) ) ( not ( = ?auto_105378 ?auto_105383 ) ) ( not ( = ?auto_105378 ?auto_105382 ) ) ( not ( = ?auto_105378 ?auto_105381 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_105380 ?auto_105383 ?auto_105382 ?auto_105381 ?auto_105379 ?auto_105377 )
      ( MAKE-2PILE ?auto_105376 ?auto_105377 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_105384 - BLOCK
      ?auto_105385 - BLOCK
    )
    :vars
    (
      ?auto_105391 - BLOCK
      ?auto_105387 - BLOCK
      ?auto_105389 - BLOCK
      ?auto_105386 - BLOCK
      ?auto_105388 - BLOCK
      ?auto_105390 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105384 ?auto_105385 ) ) ( not ( = ?auto_105384 ?auto_105391 ) ) ( not ( = ?auto_105385 ?auto_105391 ) ) ( ON ?auto_105384 ?auto_105387 ) ( not ( = ?auto_105384 ?auto_105387 ) ) ( not ( = ?auto_105385 ?auto_105387 ) ) ( not ( = ?auto_105391 ?auto_105387 ) ) ( CLEAR ?auto_105391 ) ( ON-TABLE ?auto_105389 ) ( ON ?auto_105386 ?auto_105389 ) ( ON ?auto_105388 ?auto_105386 ) ( ON ?auto_105390 ?auto_105388 ) ( ON ?auto_105391 ?auto_105390 ) ( not ( = ?auto_105389 ?auto_105386 ) ) ( not ( = ?auto_105389 ?auto_105388 ) ) ( not ( = ?auto_105389 ?auto_105390 ) ) ( not ( = ?auto_105389 ?auto_105391 ) ) ( not ( = ?auto_105389 ?auto_105385 ) ) ( not ( = ?auto_105386 ?auto_105388 ) ) ( not ( = ?auto_105386 ?auto_105390 ) ) ( not ( = ?auto_105386 ?auto_105391 ) ) ( not ( = ?auto_105386 ?auto_105385 ) ) ( not ( = ?auto_105388 ?auto_105390 ) ) ( not ( = ?auto_105388 ?auto_105391 ) ) ( not ( = ?auto_105388 ?auto_105385 ) ) ( not ( = ?auto_105390 ?auto_105391 ) ) ( not ( = ?auto_105390 ?auto_105385 ) ) ( not ( = ?auto_105384 ?auto_105389 ) ) ( not ( = ?auto_105384 ?auto_105386 ) ) ( not ( = ?auto_105384 ?auto_105388 ) ) ( not ( = ?auto_105384 ?auto_105390 ) ) ( not ( = ?auto_105387 ?auto_105389 ) ) ( not ( = ?auto_105387 ?auto_105386 ) ) ( not ( = ?auto_105387 ?auto_105388 ) ) ( not ( = ?auto_105387 ?auto_105390 ) ) ( ON ?auto_105385 ?auto_105384 ) ( CLEAR ?auto_105385 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_105387 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_105387 ?auto_105384 )
      ( MAKE-2PILE ?auto_105384 ?auto_105385 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_105392 - BLOCK
      ?auto_105393 - BLOCK
    )
    :vars
    (
      ?auto_105396 - BLOCK
      ?auto_105399 - BLOCK
      ?auto_105395 - BLOCK
      ?auto_105397 - BLOCK
      ?auto_105394 - BLOCK
      ?auto_105398 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105392 ?auto_105393 ) ) ( not ( = ?auto_105392 ?auto_105396 ) ) ( not ( = ?auto_105393 ?auto_105396 ) ) ( ON ?auto_105392 ?auto_105399 ) ( not ( = ?auto_105392 ?auto_105399 ) ) ( not ( = ?auto_105393 ?auto_105399 ) ) ( not ( = ?auto_105396 ?auto_105399 ) ) ( ON-TABLE ?auto_105395 ) ( ON ?auto_105397 ?auto_105395 ) ( ON ?auto_105394 ?auto_105397 ) ( ON ?auto_105398 ?auto_105394 ) ( not ( = ?auto_105395 ?auto_105397 ) ) ( not ( = ?auto_105395 ?auto_105394 ) ) ( not ( = ?auto_105395 ?auto_105398 ) ) ( not ( = ?auto_105395 ?auto_105396 ) ) ( not ( = ?auto_105395 ?auto_105393 ) ) ( not ( = ?auto_105397 ?auto_105394 ) ) ( not ( = ?auto_105397 ?auto_105398 ) ) ( not ( = ?auto_105397 ?auto_105396 ) ) ( not ( = ?auto_105397 ?auto_105393 ) ) ( not ( = ?auto_105394 ?auto_105398 ) ) ( not ( = ?auto_105394 ?auto_105396 ) ) ( not ( = ?auto_105394 ?auto_105393 ) ) ( not ( = ?auto_105398 ?auto_105396 ) ) ( not ( = ?auto_105398 ?auto_105393 ) ) ( not ( = ?auto_105392 ?auto_105395 ) ) ( not ( = ?auto_105392 ?auto_105397 ) ) ( not ( = ?auto_105392 ?auto_105394 ) ) ( not ( = ?auto_105392 ?auto_105398 ) ) ( not ( = ?auto_105399 ?auto_105395 ) ) ( not ( = ?auto_105399 ?auto_105397 ) ) ( not ( = ?auto_105399 ?auto_105394 ) ) ( not ( = ?auto_105399 ?auto_105398 ) ) ( ON ?auto_105393 ?auto_105392 ) ( CLEAR ?auto_105393 ) ( ON-TABLE ?auto_105399 ) ( HOLDING ?auto_105396 ) ( CLEAR ?auto_105398 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_105395 ?auto_105397 ?auto_105394 ?auto_105398 ?auto_105396 )
      ( MAKE-2PILE ?auto_105392 ?auto_105393 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_105400 - BLOCK
      ?auto_105401 - BLOCK
    )
    :vars
    (
      ?auto_105404 - BLOCK
      ?auto_105402 - BLOCK
      ?auto_105403 - BLOCK
      ?auto_105407 - BLOCK
      ?auto_105406 - BLOCK
      ?auto_105405 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105400 ?auto_105401 ) ) ( not ( = ?auto_105400 ?auto_105404 ) ) ( not ( = ?auto_105401 ?auto_105404 ) ) ( ON ?auto_105400 ?auto_105402 ) ( not ( = ?auto_105400 ?auto_105402 ) ) ( not ( = ?auto_105401 ?auto_105402 ) ) ( not ( = ?auto_105404 ?auto_105402 ) ) ( ON-TABLE ?auto_105403 ) ( ON ?auto_105407 ?auto_105403 ) ( ON ?auto_105406 ?auto_105407 ) ( ON ?auto_105405 ?auto_105406 ) ( not ( = ?auto_105403 ?auto_105407 ) ) ( not ( = ?auto_105403 ?auto_105406 ) ) ( not ( = ?auto_105403 ?auto_105405 ) ) ( not ( = ?auto_105403 ?auto_105404 ) ) ( not ( = ?auto_105403 ?auto_105401 ) ) ( not ( = ?auto_105407 ?auto_105406 ) ) ( not ( = ?auto_105407 ?auto_105405 ) ) ( not ( = ?auto_105407 ?auto_105404 ) ) ( not ( = ?auto_105407 ?auto_105401 ) ) ( not ( = ?auto_105406 ?auto_105405 ) ) ( not ( = ?auto_105406 ?auto_105404 ) ) ( not ( = ?auto_105406 ?auto_105401 ) ) ( not ( = ?auto_105405 ?auto_105404 ) ) ( not ( = ?auto_105405 ?auto_105401 ) ) ( not ( = ?auto_105400 ?auto_105403 ) ) ( not ( = ?auto_105400 ?auto_105407 ) ) ( not ( = ?auto_105400 ?auto_105406 ) ) ( not ( = ?auto_105400 ?auto_105405 ) ) ( not ( = ?auto_105402 ?auto_105403 ) ) ( not ( = ?auto_105402 ?auto_105407 ) ) ( not ( = ?auto_105402 ?auto_105406 ) ) ( not ( = ?auto_105402 ?auto_105405 ) ) ( ON ?auto_105401 ?auto_105400 ) ( ON-TABLE ?auto_105402 ) ( CLEAR ?auto_105405 ) ( ON ?auto_105404 ?auto_105401 ) ( CLEAR ?auto_105404 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_105402 ?auto_105400 ?auto_105401 )
      ( MAKE-2PILE ?auto_105400 ?auto_105401 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_105408 - BLOCK
      ?auto_105409 - BLOCK
    )
    :vars
    (
      ?auto_105414 - BLOCK
      ?auto_105415 - BLOCK
      ?auto_105411 - BLOCK
      ?auto_105410 - BLOCK
      ?auto_105413 - BLOCK
      ?auto_105412 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105408 ?auto_105409 ) ) ( not ( = ?auto_105408 ?auto_105414 ) ) ( not ( = ?auto_105409 ?auto_105414 ) ) ( ON ?auto_105408 ?auto_105415 ) ( not ( = ?auto_105408 ?auto_105415 ) ) ( not ( = ?auto_105409 ?auto_105415 ) ) ( not ( = ?auto_105414 ?auto_105415 ) ) ( ON-TABLE ?auto_105411 ) ( ON ?auto_105410 ?auto_105411 ) ( ON ?auto_105413 ?auto_105410 ) ( not ( = ?auto_105411 ?auto_105410 ) ) ( not ( = ?auto_105411 ?auto_105413 ) ) ( not ( = ?auto_105411 ?auto_105412 ) ) ( not ( = ?auto_105411 ?auto_105414 ) ) ( not ( = ?auto_105411 ?auto_105409 ) ) ( not ( = ?auto_105410 ?auto_105413 ) ) ( not ( = ?auto_105410 ?auto_105412 ) ) ( not ( = ?auto_105410 ?auto_105414 ) ) ( not ( = ?auto_105410 ?auto_105409 ) ) ( not ( = ?auto_105413 ?auto_105412 ) ) ( not ( = ?auto_105413 ?auto_105414 ) ) ( not ( = ?auto_105413 ?auto_105409 ) ) ( not ( = ?auto_105412 ?auto_105414 ) ) ( not ( = ?auto_105412 ?auto_105409 ) ) ( not ( = ?auto_105408 ?auto_105411 ) ) ( not ( = ?auto_105408 ?auto_105410 ) ) ( not ( = ?auto_105408 ?auto_105413 ) ) ( not ( = ?auto_105408 ?auto_105412 ) ) ( not ( = ?auto_105415 ?auto_105411 ) ) ( not ( = ?auto_105415 ?auto_105410 ) ) ( not ( = ?auto_105415 ?auto_105413 ) ) ( not ( = ?auto_105415 ?auto_105412 ) ) ( ON ?auto_105409 ?auto_105408 ) ( ON-TABLE ?auto_105415 ) ( ON ?auto_105414 ?auto_105409 ) ( CLEAR ?auto_105414 ) ( HOLDING ?auto_105412 ) ( CLEAR ?auto_105413 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_105411 ?auto_105410 ?auto_105413 ?auto_105412 )
      ( MAKE-2PILE ?auto_105408 ?auto_105409 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_105416 - BLOCK
      ?auto_105417 - BLOCK
    )
    :vars
    (
      ?auto_105422 - BLOCK
      ?auto_105423 - BLOCK
      ?auto_105419 - BLOCK
      ?auto_105420 - BLOCK
      ?auto_105421 - BLOCK
      ?auto_105418 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105416 ?auto_105417 ) ) ( not ( = ?auto_105416 ?auto_105422 ) ) ( not ( = ?auto_105417 ?auto_105422 ) ) ( ON ?auto_105416 ?auto_105423 ) ( not ( = ?auto_105416 ?auto_105423 ) ) ( not ( = ?auto_105417 ?auto_105423 ) ) ( not ( = ?auto_105422 ?auto_105423 ) ) ( ON-TABLE ?auto_105419 ) ( ON ?auto_105420 ?auto_105419 ) ( ON ?auto_105421 ?auto_105420 ) ( not ( = ?auto_105419 ?auto_105420 ) ) ( not ( = ?auto_105419 ?auto_105421 ) ) ( not ( = ?auto_105419 ?auto_105418 ) ) ( not ( = ?auto_105419 ?auto_105422 ) ) ( not ( = ?auto_105419 ?auto_105417 ) ) ( not ( = ?auto_105420 ?auto_105421 ) ) ( not ( = ?auto_105420 ?auto_105418 ) ) ( not ( = ?auto_105420 ?auto_105422 ) ) ( not ( = ?auto_105420 ?auto_105417 ) ) ( not ( = ?auto_105421 ?auto_105418 ) ) ( not ( = ?auto_105421 ?auto_105422 ) ) ( not ( = ?auto_105421 ?auto_105417 ) ) ( not ( = ?auto_105418 ?auto_105422 ) ) ( not ( = ?auto_105418 ?auto_105417 ) ) ( not ( = ?auto_105416 ?auto_105419 ) ) ( not ( = ?auto_105416 ?auto_105420 ) ) ( not ( = ?auto_105416 ?auto_105421 ) ) ( not ( = ?auto_105416 ?auto_105418 ) ) ( not ( = ?auto_105423 ?auto_105419 ) ) ( not ( = ?auto_105423 ?auto_105420 ) ) ( not ( = ?auto_105423 ?auto_105421 ) ) ( not ( = ?auto_105423 ?auto_105418 ) ) ( ON ?auto_105417 ?auto_105416 ) ( ON-TABLE ?auto_105423 ) ( ON ?auto_105422 ?auto_105417 ) ( CLEAR ?auto_105421 ) ( ON ?auto_105418 ?auto_105422 ) ( CLEAR ?auto_105418 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_105423 ?auto_105416 ?auto_105417 ?auto_105422 )
      ( MAKE-2PILE ?auto_105416 ?auto_105417 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_105424 - BLOCK
      ?auto_105425 - BLOCK
    )
    :vars
    (
      ?auto_105429 - BLOCK
      ?auto_105431 - BLOCK
      ?auto_105430 - BLOCK
      ?auto_105426 - BLOCK
      ?auto_105427 - BLOCK
      ?auto_105428 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105424 ?auto_105425 ) ) ( not ( = ?auto_105424 ?auto_105429 ) ) ( not ( = ?auto_105425 ?auto_105429 ) ) ( ON ?auto_105424 ?auto_105431 ) ( not ( = ?auto_105424 ?auto_105431 ) ) ( not ( = ?auto_105425 ?auto_105431 ) ) ( not ( = ?auto_105429 ?auto_105431 ) ) ( ON-TABLE ?auto_105430 ) ( ON ?auto_105426 ?auto_105430 ) ( not ( = ?auto_105430 ?auto_105426 ) ) ( not ( = ?auto_105430 ?auto_105427 ) ) ( not ( = ?auto_105430 ?auto_105428 ) ) ( not ( = ?auto_105430 ?auto_105429 ) ) ( not ( = ?auto_105430 ?auto_105425 ) ) ( not ( = ?auto_105426 ?auto_105427 ) ) ( not ( = ?auto_105426 ?auto_105428 ) ) ( not ( = ?auto_105426 ?auto_105429 ) ) ( not ( = ?auto_105426 ?auto_105425 ) ) ( not ( = ?auto_105427 ?auto_105428 ) ) ( not ( = ?auto_105427 ?auto_105429 ) ) ( not ( = ?auto_105427 ?auto_105425 ) ) ( not ( = ?auto_105428 ?auto_105429 ) ) ( not ( = ?auto_105428 ?auto_105425 ) ) ( not ( = ?auto_105424 ?auto_105430 ) ) ( not ( = ?auto_105424 ?auto_105426 ) ) ( not ( = ?auto_105424 ?auto_105427 ) ) ( not ( = ?auto_105424 ?auto_105428 ) ) ( not ( = ?auto_105431 ?auto_105430 ) ) ( not ( = ?auto_105431 ?auto_105426 ) ) ( not ( = ?auto_105431 ?auto_105427 ) ) ( not ( = ?auto_105431 ?auto_105428 ) ) ( ON ?auto_105425 ?auto_105424 ) ( ON-TABLE ?auto_105431 ) ( ON ?auto_105429 ?auto_105425 ) ( ON ?auto_105428 ?auto_105429 ) ( CLEAR ?auto_105428 ) ( HOLDING ?auto_105427 ) ( CLEAR ?auto_105426 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_105430 ?auto_105426 ?auto_105427 )
      ( MAKE-2PILE ?auto_105424 ?auto_105425 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_105432 - BLOCK
      ?auto_105433 - BLOCK
    )
    :vars
    (
      ?auto_105438 - BLOCK
      ?auto_105436 - BLOCK
      ?auto_105439 - BLOCK
      ?auto_105434 - BLOCK
      ?auto_105435 - BLOCK
      ?auto_105437 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105432 ?auto_105433 ) ) ( not ( = ?auto_105432 ?auto_105438 ) ) ( not ( = ?auto_105433 ?auto_105438 ) ) ( ON ?auto_105432 ?auto_105436 ) ( not ( = ?auto_105432 ?auto_105436 ) ) ( not ( = ?auto_105433 ?auto_105436 ) ) ( not ( = ?auto_105438 ?auto_105436 ) ) ( ON-TABLE ?auto_105439 ) ( ON ?auto_105434 ?auto_105439 ) ( not ( = ?auto_105439 ?auto_105434 ) ) ( not ( = ?auto_105439 ?auto_105435 ) ) ( not ( = ?auto_105439 ?auto_105437 ) ) ( not ( = ?auto_105439 ?auto_105438 ) ) ( not ( = ?auto_105439 ?auto_105433 ) ) ( not ( = ?auto_105434 ?auto_105435 ) ) ( not ( = ?auto_105434 ?auto_105437 ) ) ( not ( = ?auto_105434 ?auto_105438 ) ) ( not ( = ?auto_105434 ?auto_105433 ) ) ( not ( = ?auto_105435 ?auto_105437 ) ) ( not ( = ?auto_105435 ?auto_105438 ) ) ( not ( = ?auto_105435 ?auto_105433 ) ) ( not ( = ?auto_105437 ?auto_105438 ) ) ( not ( = ?auto_105437 ?auto_105433 ) ) ( not ( = ?auto_105432 ?auto_105439 ) ) ( not ( = ?auto_105432 ?auto_105434 ) ) ( not ( = ?auto_105432 ?auto_105435 ) ) ( not ( = ?auto_105432 ?auto_105437 ) ) ( not ( = ?auto_105436 ?auto_105439 ) ) ( not ( = ?auto_105436 ?auto_105434 ) ) ( not ( = ?auto_105436 ?auto_105435 ) ) ( not ( = ?auto_105436 ?auto_105437 ) ) ( ON ?auto_105433 ?auto_105432 ) ( ON-TABLE ?auto_105436 ) ( ON ?auto_105438 ?auto_105433 ) ( ON ?auto_105437 ?auto_105438 ) ( CLEAR ?auto_105434 ) ( ON ?auto_105435 ?auto_105437 ) ( CLEAR ?auto_105435 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_105436 ?auto_105432 ?auto_105433 ?auto_105438 ?auto_105437 )
      ( MAKE-2PILE ?auto_105432 ?auto_105433 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_105440 - BLOCK
      ?auto_105441 - BLOCK
    )
    :vars
    (
      ?auto_105447 - BLOCK
      ?auto_105446 - BLOCK
      ?auto_105444 - BLOCK
      ?auto_105443 - BLOCK
      ?auto_105445 - BLOCK
      ?auto_105442 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105440 ?auto_105441 ) ) ( not ( = ?auto_105440 ?auto_105447 ) ) ( not ( = ?auto_105441 ?auto_105447 ) ) ( ON ?auto_105440 ?auto_105446 ) ( not ( = ?auto_105440 ?auto_105446 ) ) ( not ( = ?auto_105441 ?auto_105446 ) ) ( not ( = ?auto_105447 ?auto_105446 ) ) ( ON-TABLE ?auto_105444 ) ( not ( = ?auto_105444 ?auto_105443 ) ) ( not ( = ?auto_105444 ?auto_105445 ) ) ( not ( = ?auto_105444 ?auto_105442 ) ) ( not ( = ?auto_105444 ?auto_105447 ) ) ( not ( = ?auto_105444 ?auto_105441 ) ) ( not ( = ?auto_105443 ?auto_105445 ) ) ( not ( = ?auto_105443 ?auto_105442 ) ) ( not ( = ?auto_105443 ?auto_105447 ) ) ( not ( = ?auto_105443 ?auto_105441 ) ) ( not ( = ?auto_105445 ?auto_105442 ) ) ( not ( = ?auto_105445 ?auto_105447 ) ) ( not ( = ?auto_105445 ?auto_105441 ) ) ( not ( = ?auto_105442 ?auto_105447 ) ) ( not ( = ?auto_105442 ?auto_105441 ) ) ( not ( = ?auto_105440 ?auto_105444 ) ) ( not ( = ?auto_105440 ?auto_105443 ) ) ( not ( = ?auto_105440 ?auto_105445 ) ) ( not ( = ?auto_105440 ?auto_105442 ) ) ( not ( = ?auto_105446 ?auto_105444 ) ) ( not ( = ?auto_105446 ?auto_105443 ) ) ( not ( = ?auto_105446 ?auto_105445 ) ) ( not ( = ?auto_105446 ?auto_105442 ) ) ( ON ?auto_105441 ?auto_105440 ) ( ON-TABLE ?auto_105446 ) ( ON ?auto_105447 ?auto_105441 ) ( ON ?auto_105442 ?auto_105447 ) ( ON ?auto_105445 ?auto_105442 ) ( CLEAR ?auto_105445 ) ( HOLDING ?auto_105443 ) ( CLEAR ?auto_105444 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_105444 ?auto_105443 )
      ( MAKE-2PILE ?auto_105440 ?auto_105441 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_105448 - BLOCK
      ?auto_105449 - BLOCK
    )
    :vars
    (
      ?auto_105454 - BLOCK
      ?auto_105452 - BLOCK
      ?auto_105453 - BLOCK
      ?auto_105450 - BLOCK
      ?auto_105451 - BLOCK
      ?auto_105455 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105448 ?auto_105449 ) ) ( not ( = ?auto_105448 ?auto_105454 ) ) ( not ( = ?auto_105449 ?auto_105454 ) ) ( ON ?auto_105448 ?auto_105452 ) ( not ( = ?auto_105448 ?auto_105452 ) ) ( not ( = ?auto_105449 ?auto_105452 ) ) ( not ( = ?auto_105454 ?auto_105452 ) ) ( ON-TABLE ?auto_105453 ) ( not ( = ?auto_105453 ?auto_105450 ) ) ( not ( = ?auto_105453 ?auto_105451 ) ) ( not ( = ?auto_105453 ?auto_105455 ) ) ( not ( = ?auto_105453 ?auto_105454 ) ) ( not ( = ?auto_105453 ?auto_105449 ) ) ( not ( = ?auto_105450 ?auto_105451 ) ) ( not ( = ?auto_105450 ?auto_105455 ) ) ( not ( = ?auto_105450 ?auto_105454 ) ) ( not ( = ?auto_105450 ?auto_105449 ) ) ( not ( = ?auto_105451 ?auto_105455 ) ) ( not ( = ?auto_105451 ?auto_105454 ) ) ( not ( = ?auto_105451 ?auto_105449 ) ) ( not ( = ?auto_105455 ?auto_105454 ) ) ( not ( = ?auto_105455 ?auto_105449 ) ) ( not ( = ?auto_105448 ?auto_105453 ) ) ( not ( = ?auto_105448 ?auto_105450 ) ) ( not ( = ?auto_105448 ?auto_105451 ) ) ( not ( = ?auto_105448 ?auto_105455 ) ) ( not ( = ?auto_105452 ?auto_105453 ) ) ( not ( = ?auto_105452 ?auto_105450 ) ) ( not ( = ?auto_105452 ?auto_105451 ) ) ( not ( = ?auto_105452 ?auto_105455 ) ) ( ON ?auto_105449 ?auto_105448 ) ( ON-TABLE ?auto_105452 ) ( ON ?auto_105454 ?auto_105449 ) ( ON ?auto_105455 ?auto_105454 ) ( ON ?auto_105451 ?auto_105455 ) ( CLEAR ?auto_105453 ) ( ON ?auto_105450 ?auto_105451 ) ( CLEAR ?auto_105450 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_105452 ?auto_105448 ?auto_105449 ?auto_105454 ?auto_105455 ?auto_105451 )
      ( MAKE-2PILE ?auto_105448 ?auto_105449 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_105456 - BLOCK
      ?auto_105457 - BLOCK
    )
    :vars
    (
      ?auto_105459 - BLOCK
      ?auto_105463 - BLOCK
      ?auto_105458 - BLOCK
      ?auto_105460 - BLOCK
      ?auto_105461 - BLOCK
      ?auto_105462 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105456 ?auto_105457 ) ) ( not ( = ?auto_105456 ?auto_105459 ) ) ( not ( = ?auto_105457 ?auto_105459 ) ) ( ON ?auto_105456 ?auto_105463 ) ( not ( = ?auto_105456 ?auto_105463 ) ) ( not ( = ?auto_105457 ?auto_105463 ) ) ( not ( = ?auto_105459 ?auto_105463 ) ) ( not ( = ?auto_105458 ?auto_105460 ) ) ( not ( = ?auto_105458 ?auto_105461 ) ) ( not ( = ?auto_105458 ?auto_105462 ) ) ( not ( = ?auto_105458 ?auto_105459 ) ) ( not ( = ?auto_105458 ?auto_105457 ) ) ( not ( = ?auto_105460 ?auto_105461 ) ) ( not ( = ?auto_105460 ?auto_105462 ) ) ( not ( = ?auto_105460 ?auto_105459 ) ) ( not ( = ?auto_105460 ?auto_105457 ) ) ( not ( = ?auto_105461 ?auto_105462 ) ) ( not ( = ?auto_105461 ?auto_105459 ) ) ( not ( = ?auto_105461 ?auto_105457 ) ) ( not ( = ?auto_105462 ?auto_105459 ) ) ( not ( = ?auto_105462 ?auto_105457 ) ) ( not ( = ?auto_105456 ?auto_105458 ) ) ( not ( = ?auto_105456 ?auto_105460 ) ) ( not ( = ?auto_105456 ?auto_105461 ) ) ( not ( = ?auto_105456 ?auto_105462 ) ) ( not ( = ?auto_105463 ?auto_105458 ) ) ( not ( = ?auto_105463 ?auto_105460 ) ) ( not ( = ?auto_105463 ?auto_105461 ) ) ( not ( = ?auto_105463 ?auto_105462 ) ) ( ON ?auto_105457 ?auto_105456 ) ( ON-TABLE ?auto_105463 ) ( ON ?auto_105459 ?auto_105457 ) ( ON ?auto_105462 ?auto_105459 ) ( ON ?auto_105461 ?auto_105462 ) ( ON ?auto_105460 ?auto_105461 ) ( CLEAR ?auto_105460 ) ( HOLDING ?auto_105458 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_105458 )
      ( MAKE-2PILE ?auto_105456 ?auto_105457 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_105464 - BLOCK
      ?auto_105465 - BLOCK
    )
    :vars
    (
      ?auto_105470 - BLOCK
      ?auto_105471 - BLOCK
      ?auto_105469 - BLOCK
      ?auto_105468 - BLOCK
      ?auto_105467 - BLOCK
      ?auto_105466 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105464 ?auto_105465 ) ) ( not ( = ?auto_105464 ?auto_105470 ) ) ( not ( = ?auto_105465 ?auto_105470 ) ) ( ON ?auto_105464 ?auto_105471 ) ( not ( = ?auto_105464 ?auto_105471 ) ) ( not ( = ?auto_105465 ?auto_105471 ) ) ( not ( = ?auto_105470 ?auto_105471 ) ) ( not ( = ?auto_105469 ?auto_105468 ) ) ( not ( = ?auto_105469 ?auto_105467 ) ) ( not ( = ?auto_105469 ?auto_105466 ) ) ( not ( = ?auto_105469 ?auto_105470 ) ) ( not ( = ?auto_105469 ?auto_105465 ) ) ( not ( = ?auto_105468 ?auto_105467 ) ) ( not ( = ?auto_105468 ?auto_105466 ) ) ( not ( = ?auto_105468 ?auto_105470 ) ) ( not ( = ?auto_105468 ?auto_105465 ) ) ( not ( = ?auto_105467 ?auto_105466 ) ) ( not ( = ?auto_105467 ?auto_105470 ) ) ( not ( = ?auto_105467 ?auto_105465 ) ) ( not ( = ?auto_105466 ?auto_105470 ) ) ( not ( = ?auto_105466 ?auto_105465 ) ) ( not ( = ?auto_105464 ?auto_105469 ) ) ( not ( = ?auto_105464 ?auto_105468 ) ) ( not ( = ?auto_105464 ?auto_105467 ) ) ( not ( = ?auto_105464 ?auto_105466 ) ) ( not ( = ?auto_105471 ?auto_105469 ) ) ( not ( = ?auto_105471 ?auto_105468 ) ) ( not ( = ?auto_105471 ?auto_105467 ) ) ( not ( = ?auto_105471 ?auto_105466 ) ) ( ON ?auto_105465 ?auto_105464 ) ( ON-TABLE ?auto_105471 ) ( ON ?auto_105470 ?auto_105465 ) ( ON ?auto_105466 ?auto_105470 ) ( ON ?auto_105467 ?auto_105466 ) ( ON ?auto_105468 ?auto_105467 ) ( ON ?auto_105469 ?auto_105468 ) ( CLEAR ?auto_105469 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_105471 ?auto_105464 ?auto_105465 ?auto_105470 ?auto_105466 ?auto_105467 ?auto_105468 )
      ( MAKE-2PILE ?auto_105464 ?auto_105465 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_105495 - BLOCK
      ?auto_105496 - BLOCK
      ?auto_105497 - BLOCK
      ?auto_105498 - BLOCK
    )
    :vars
    (
      ?auto_105500 - BLOCK
      ?auto_105501 - BLOCK
      ?auto_105499 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105500 ?auto_105498 ) ( ON-TABLE ?auto_105495 ) ( ON ?auto_105496 ?auto_105495 ) ( ON ?auto_105497 ?auto_105496 ) ( ON ?auto_105498 ?auto_105497 ) ( not ( = ?auto_105495 ?auto_105496 ) ) ( not ( = ?auto_105495 ?auto_105497 ) ) ( not ( = ?auto_105495 ?auto_105498 ) ) ( not ( = ?auto_105495 ?auto_105500 ) ) ( not ( = ?auto_105496 ?auto_105497 ) ) ( not ( = ?auto_105496 ?auto_105498 ) ) ( not ( = ?auto_105496 ?auto_105500 ) ) ( not ( = ?auto_105497 ?auto_105498 ) ) ( not ( = ?auto_105497 ?auto_105500 ) ) ( not ( = ?auto_105498 ?auto_105500 ) ) ( not ( = ?auto_105495 ?auto_105501 ) ) ( not ( = ?auto_105495 ?auto_105499 ) ) ( not ( = ?auto_105496 ?auto_105501 ) ) ( not ( = ?auto_105496 ?auto_105499 ) ) ( not ( = ?auto_105497 ?auto_105501 ) ) ( not ( = ?auto_105497 ?auto_105499 ) ) ( not ( = ?auto_105498 ?auto_105501 ) ) ( not ( = ?auto_105498 ?auto_105499 ) ) ( not ( = ?auto_105500 ?auto_105501 ) ) ( not ( = ?auto_105500 ?auto_105499 ) ) ( not ( = ?auto_105501 ?auto_105499 ) ) ( ON ?auto_105501 ?auto_105500 ) ( CLEAR ?auto_105501 ) ( HOLDING ?auto_105499 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_105499 )
      ( MAKE-4PILE ?auto_105495 ?auto_105496 ?auto_105497 ?auto_105498 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_105582 - BLOCK
      ?auto_105583 - BLOCK
      ?auto_105584 - BLOCK
    )
    :vars
    (
      ?auto_105585 - BLOCK
      ?auto_105587 - BLOCK
      ?auto_105586 - BLOCK
      ?auto_105588 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_105582 ) ( not ( = ?auto_105582 ?auto_105583 ) ) ( not ( = ?auto_105582 ?auto_105584 ) ) ( not ( = ?auto_105583 ?auto_105584 ) ) ( ON ?auto_105584 ?auto_105585 ) ( not ( = ?auto_105582 ?auto_105585 ) ) ( not ( = ?auto_105583 ?auto_105585 ) ) ( not ( = ?auto_105584 ?auto_105585 ) ) ( CLEAR ?auto_105582 ) ( ON ?auto_105583 ?auto_105584 ) ( CLEAR ?auto_105583 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_105587 ) ( ON ?auto_105586 ?auto_105587 ) ( ON ?auto_105588 ?auto_105586 ) ( ON ?auto_105585 ?auto_105588 ) ( not ( = ?auto_105587 ?auto_105586 ) ) ( not ( = ?auto_105587 ?auto_105588 ) ) ( not ( = ?auto_105587 ?auto_105585 ) ) ( not ( = ?auto_105587 ?auto_105584 ) ) ( not ( = ?auto_105587 ?auto_105583 ) ) ( not ( = ?auto_105586 ?auto_105588 ) ) ( not ( = ?auto_105586 ?auto_105585 ) ) ( not ( = ?auto_105586 ?auto_105584 ) ) ( not ( = ?auto_105586 ?auto_105583 ) ) ( not ( = ?auto_105588 ?auto_105585 ) ) ( not ( = ?auto_105588 ?auto_105584 ) ) ( not ( = ?auto_105588 ?auto_105583 ) ) ( not ( = ?auto_105582 ?auto_105587 ) ) ( not ( = ?auto_105582 ?auto_105586 ) ) ( not ( = ?auto_105582 ?auto_105588 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_105587 ?auto_105586 ?auto_105588 ?auto_105585 ?auto_105584 )
      ( MAKE-3PILE ?auto_105582 ?auto_105583 ?auto_105584 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_105589 - BLOCK
      ?auto_105590 - BLOCK
      ?auto_105591 - BLOCK
    )
    :vars
    (
      ?auto_105592 - BLOCK
      ?auto_105594 - BLOCK
      ?auto_105595 - BLOCK
      ?auto_105593 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105589 ?auto_105590 ) ) ( not ( = ?auto_105589 ?auto_105591 ) ) ( not ( = ?auto_105590 ?auto_105591 ) ) ( ON ?auto_105591 ?auto_105592 ) ( not ( = ?auto_105589 ?auto_105592 ) ) ( not ( = ?auto_105590 ?auto_105592 ) ) ( not ( = ?auto_105591 ?auto_105592 ) ) ( ON ?auto_105590 ?auto_105591 ) ( CLEAR ?auto_105590 ) ( ON-TABLE ?auto_105594 ) ( ON ?auto_105595 ?auto_105594 ) ( ON ?auto_105593 ?auto_105595 ) ( ON ?auto_105592 ?auto_105593 ) ( not ( = ?auto_105594 ?auto_105595 ) ) ( not ( = ?auto_105594 ?auto_105593 ) ) ( not ( = ?auto_105594 ?auto_105592 ) ) ( not ( = ?auto_105594 ?auto_105591 ) ) ( not ( = ?auto_105594 ?auto_105590 ) ) ( not ( = ?auto_105595 ?auto_105593 ) ) ( not ( = ?auto_105595 ?auto_105592 ) ) ( not ( = ?auto_105595 ?auto_105591 ) ) ( not ( = ?auto_105595 ?auto_105590 ) ) ( not ( = ?auto_105593 ?auto_105592 ) ) ( not ( = ?auto_105593 ?auto_105591 ) ) ( not ( = ?auto_105593 ?auto_105590 ) ) ( not ( = ?auto_105589 ?auto_105594 ) ) ( not ( = ?auto_105589 ?auto_105595 ) ) ( not ( = ?auto_105589 ?auto_105593 ) ) ( HOLDING ?auto_105589 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_105589 )
      ( MAKE-3PILE ?auto_105589 ?auto_105590 ?auto_105591 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_105596 - BLOCK
      ?auto_105597 - BLOCK
      ?auto_105598 - BLOCK
    )
    :vars
    (
      ?auto_105600 - BLOCK
      ?auto_105602 - BLOCK
      ?auto_105599 - BLOCK
      ?auto_105601 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105596 ?auto_105597 ) ) ( not ( = ?auto_105596 ?auto_105598 ) ) ( not ( = ?auto_105597 ?auto_105598 ) ) ( ON ?auto_105598 ?auto_105600 ) ( not ( = ?auto_105596 ?auto_105600 ) ) ( not ( = ?auto_105597 ?auto_105600 ) ) ( not ( = ?auto_105598 ?auto_105600 ) ) ( ON ?auto_105597 ?auto_105598 ) ( ON-TABLE ?auto_105602 ) ( ON ?auto_105599 ?auto_105602 ) ( ON ?auto_105601 ?auto_105599 ) ( ON ?auto_105600 ?auto_105601 ) ( not ( = ?auto_105602 ?auto_105599 ) ) ( not ( = ?auto_105602 ?auto_105601 ) ) ( not ( = ?auto_105602 ?auto_105600 ) ) ( not ( = ?auto_105602 ?auto_105598 ) ) ( not ( = ?auto_105602 ?auto_105597 ) ) ( not ( = ?auto_105599 ?auto_105601 ) ) ( not ( = ?auto_105599 ?auto_105600 ) ) ( not ( = ?auto_105599 ?auto_105598 ) ) ( not ( = ?auto_105599 ?auto_105597 ) ) ( not ( = ?auto_105601 ?auto_105600 ) ) ( not ( = ?auto_105601 ?auto_105598 ) ) ( not ( = ?auto_105601 ?auto_105597 ) ) ( not ( = ?auto_105596 ?auto_105602 ) ) ( not ( = ?auto_105596 ?auto_105599 ) ) ( not ( = ?auto_105596 ?auto_105601 ) ) ( ON ?auto_105596 ?auto_105597 ) ( CLEAR ?auto_105596 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_105602 ?auto_105599 ?auto_105601 ?auto_105600 ?auto_105598 ?auto_105597 )
      ( MAKE-3PILE ?auto_105596 ?auto_105597 ?auto_105598 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_105606 - BLOCK
      ?auto_105607 - BLOCK
      ?auto_105608 - BLOCK
    )
    :vars
    (
      ?auto_105612 - BLOCK
      ?auto_105609 - BLOCK
      ?auto_105611 - BLOCK
      ?auto_105610 - BLOCK
      ?auto_105613 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105606 ?auto_105607 ) ) ( not ( = ?auto_105606 ?auto_105608 ) ) ( not ( = ?auto_105607 ?auto_105608 ) ) ( ON ?auto_105608 ?auto_105612 ) ( not ( = ?auto_105606 ?auto_105612 ) ) ( not ( = ?auto_105607 ?auto_105612 ) ) ( not ( = ?auto_105608 ?auto_105612 ) ) ( ON ?auto_105607 ?auto_105608 ) ( CLEAR ?auto_105607 ) ( ON-TABLE ?auto_105609 ) ( ON ?auto_105611 ?auto_105609 ) ( ON ?auto_105610 ?auto_105611 ) ( ON ?auto_105612 ?auto_105610 ) ( not ( = ?auto_105609 ?auto_105611 ) ) ( not ( = ?auto_105609 ?auto_105610 ) ) ( not ( = ?auto_105609 ?auto_105612 ) ) ( not ( = ?auto_105609 ?auto_105608 ) ) ( not ( = ?auto_105609 ?auto_105607 ) ) ( not ( = ?auto_105611 ?auto_105610 ) ) ( not ( = ?auto_105611 ?auto_105612 ) ) ( not ( = ?auto_105611 ?auto_105608 ) ) ( not ( = ?auto_105611 ?auto_105607 ) ) ( not ( = ?auto_105610 ?auto_105612 ) ) ( not ( = ?auto_105610 ?auto_105608 ) ) ( not ( = ?auto_105610 ?auto_105607 ) ) ( not ( = ?auto_105606 ?auto_105609 ) ) ( not ( = ?auto_105606 ?auto_105611 ) ) ( not ( = ?auto_105606 ?auto_105610 ) ) ( ON ?auto_105606 ?auto_105613 ) ( CLEAR ?auto_105606 ) ( HAND-EMPTY ) ( not ( = ?auto_105606 ?auto_105613 ) ) ( not ( = ?auto_105607 ?auto_105613 ) ) ( not ( = ?auto_105608 ?auto_105613 ) ) ( not ( = ?auto_105612 ?auto_105613 ) ) ( not ( = ?auto_105609 ?auto_105613 ) ) ( not ( = ?auto_105611 ?auto_105613 ) ) ( not ( = ?auto_105610 ?auto_105613 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_105606 ?auto_105613 )
      ( MAKE-3PILE ?auto_105606 ?auto_105607 ?auto_105608 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_105614 - BLOCK
      ?auto_105615 - BLOCK
      ?auto_105616 - BLOCK
    )
    :vars
    (
      ?auto_105619 - BLOCK
      ?auto_105618 - BLOCK
      ?auto_105621 - BLOCK
      ?auto_105620 - BLOCK
      ?auto_105617 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105614 ?auto_105615 ) ) ( not ( = ?auto_105614 ?auto_105616 ) ) ( not ( = ?auto_105615 ?auto_105616 ) ) ( ON ?auto_105616 ?auto_105619 ) ( not ( = ?auto_105614 ?auto_105619 ) ) ( not ( = ?auto_105615 ?auto_105619 ) ) ( not ( = ?auto_105616 ?auto_105619 ) ) ( ON-TABLE ?auto_105618 ) ( ON ?auto_105621 ?auto_105618 ) ( ON ?auto_105620 ?auto_105621 ) ( ON ?auto_105619 ?auto_105620 ) ( not ( = ?auto_105618 ?auto_105621 ) ) ( not ( = ?auto_105618 ?auto_105620 ) ) ( not ( = ?auto_105618 ?auto_105619 ) ) ( not ( = ?auto_105618 ?auto_105616 ) ) ( not ( = ?auto_105618 ?auto_105615 ) ) ( not ( = ?auto_105621 ?auto_105620 ) ) ( not ( = ?auto_105621 ?auto_105619 ) ) ( not ( = ?auto_105621 ?auto_105616 ) ) ( not ( = ?auto_105621 ?auto_105615 ) ) ( not ( = ?auto_105620 ?auto_105619 ) ) ( not ( = ?auto_105620 ?auto_105616 ) ) ( not ( = ?auto_105620 ?auto_105615 ) ) ( not ( = ?auto_105614 ?auto_105618 ) ) ( not ( = ?auto_105614 ?auto_105621 ) ) ( not ( = ?auto_105614 ?auto_105620 ) ) ( ON ?auto_105614 ?auto_105617 ) ( CLEAR ?auto_105614 ) ( not ( = ?auto_105614 ?auto_105617 ) ) ( not ( = ?auto_105615 ?auto_105617 ) ) ( not ( = ?auto_105616 ?auto_105617 ) ) ( not ( = ?auto_105619 ?auto_105617 ) ) ( not ( = ?auto_105618 ?auto_105617 ) ) ( not ( = ?auto_105621 ?auto_105617 ) ) ( not ( = ?auto_105620 ?auto_105617 ) ) ( HOLDING ?auto_105615 ) ( CLEAR ?auto_105616 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_105618 ?auto_105621 ?auto_105620 ?auto_105619 ?auto_105616 ?auto_105615 )
      ( MAKE-3PILE ?auto_105614 ?auto_105615 ?auto_105616 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_105622 - BLOCK
      ?auto_105623 - BLOCK
      ?auto_105624 - BLOCK
    )
    :vars
    (
      ?auto_105627 - BLOCK
      ?auto_105625 - BLOCK
      ?auto_105626 - BLOCK
      ?auto_105628 - BLOCK
      ?auto_105629 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105622 ?auto_105623 ) ) ( not ( = ?auto_105622 ?auto_105624 ) ) ( not ( = ?auto_105623 ?auto_105624 ) ) ( ON ?auto_105624 ?auto_105627 ) ( not ( = ?auto_105622 ?auto_105627 ) ) ( not ( = ?auto_105623 ?auto_105627 ) ) ( not ( = ?auto_105624 ?auto_105627 ) ) ( ON-TABLE ?auto_105625 ) ( ON ?auto_105626 ?auto_105625 ) ( ON ?auto_105628 ?auto_105626 ) ( ON ?auto_105627 ?auto_105628 ) ( not ( = ?auto_105625 ?auto_105626 ) ) ( not ( = ?auto_105625 ?auto_105628 ) ) ( not ( = ?auto_105625 ?auto_105627 ) ) ( not ( = ?auto_105625 ?auto_105624 ) ) ( not ( = ?auto_105625 ?auto_105623 ) ) ( not ( = ?auto_105626 ?auto_105628 ) ) ( not ( = ?auto_105626 ?auto_105627 ) ) ( not ( = ?auto_105626 ?auto_105624 ) ) ( not ( = ?auto_105626 ?auto_105623 ) ) ( not ( = ?auto_105628 ?auto_105627 ) ) ( not ( = ?auto_105628 ?auto_105624 ) ) ( not ( = ?auto_105628 ?auto_105623 ) ) ( not ( = ?auto_105622 ?auto_105625 ) ) ( not ( = ?auto_105622 ?auto_105626 ) ) ( not ( = ?auto_105622 ?auto_105628 ) ) ( ON ?auto_105622 ?auto_105629 ) ( not ( = ?auto_105622 ?auto_105629 ) ) ( not ( = ?auto_105623 ?auto_105629 ) ) ( not ( = ?auto_105624 ?auto_105629 ) ) ( not ( = ?auto_105627 ?auto_105629 ) ) ( not ( = ?auto_105625 ?auto_105629 ) ) ( not ( = ?auto_105626 ?auto_105629 ) ) ( not ( = ?auto_105628 ?auto_105629 ) ) ( CLEAR ?auto_105624 ) ( ON ?auto_105623 ?auto_105622 ) ( CLEAR ?auto_105623 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_105629 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_105629 ?auto_105622 )
      ( MAKE-3PILE ?auto_105622 ?auto_105623 ?auto_105624 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_105630 - BLOCK
      ?auto_105631 - BLOCK
      ?auto_105632 - BLOCK
    )
    :vars
    (
      ?auto_105635 - BLOCK
      ?auto_105634 - BLOCK
      ?auto_105636 - BLOCK
      ?auto_105633 - BLOCK
      ?auto_105637 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105630 ?auto_105631 ) ) ( not ( = ?auto_105630 ?auto_105632 ) ) ( not ( = ?auto_105631 ?auto_105632 ) ) ( not ( = ?auto_105630 ?auto_105635 ) ) ( not ( = ?auto_105631 ?auto_105635 ) ) ( not ( = ?auto_105632 ?auto_105635 ) ) ( ON-TABLE ?auto_105634 ) ( ON ?auto_105636 ?auto_105634 ) ( ON ?auto_105633 ?auto_105636 ) ( ON ?auto_105635 ?auto_105633 ) ( not ( = ?auto_105634 ?auto_105636 ) ) ( not ( = ?auto_105634 ?auto_105633 ) ) ( not ( = ?auto_105634 ?auto_105635 ) ) ( not ( = ?auto_105634 ?auto_105632 ) ) ( not ( = ?auto_105634 ?auto_105631 ) ) ( not ( = ?auto_105636 ?auto_105633 ) ) ( not ( = ?auto_105636 ?auto_105635 ) ) ( not ( = ?auto_105636 ?auto_105632 ) ) ( not ( = ?auto_105636 ?auto_105631 ) ) ( not ( = ?auto_105633 ?auto_105635 ) ) ( not ( = ?auto_105633 ?auto_105632 ) ) ( not ( = ?auto_105633 ?auto_105631 ) ) ( not ( = ?auto_105630 ?auto_105634 ) ) ( not ( = ?auto_105630 ?auto_105636 ) ) ( not ( = ?auto_105630 ?auto_105633 ) ) ( ON ?auto_105630 ?auto_105637 ) ( not ( = ?auto_105630 ?auto_105637 ) ) ( not ( = ?auto_105631 ?auto_105637 ) ) ( not ( = ?auto_105632 ?auto_105637 ) ) ( not ( = ?auto_105635 ?auto_105637 ) ) ( not ( = ?auto_105634 ?auto_105637 ) ) ( not ( = ?auto_105636 ?auto_105637 ) ) ( not ( = ?auto_105633 ?auto_105637 ) ) ( ON ?auto_105631 ?auto_105630 ) ( CLEAR ?auto_105631 ) ( ON-TABLE ?auto_105637 ) ( HOLDING ?auto_105632 ) ( CLEAR ?auto_105635 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_105634 ?auto_105636 ?auto_105633 ?auto_105635 ?auto_105632 )
      ( MAKE-3PILE ?auto_105630 ?auto_105631 ?auto_105632 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_105638 - BLOCK
      ?auto_105639 - BLOCK
      ?auto_105640 - BLOCK
    )
    :vars
    (
      ?auto_105644 - BLOCK
      ?auto_105645 - BLOCK
      ?auto_105643 - BLOCK
      ?auto_105641 - BLOCK
      ?auto_105642 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105638 ?auto_105639 ) ) ( not ( = ?auto_105638 ?auto_105640 ) ) ( not ( = ?auto_105639 ?auto_105640 ) ) ( not ( = ?auto_105638 ?auto_105644 ) ) ( not ( = ?auto_105639 ?auto_105644 ) ) ( not ( = ?auto_105640 ?auto_105644 ) ) ( ON-TABLE ?auto_105645 ) ( ON ?auto_105643 ?auto_105645 ) ( ON ?auto_105641 ?auto_105643 ) ( ON ?auto_105644 ?auto_105641 ) ( not ( = ?auto_105645 ?auto_105643 ) ) ( not ( = ?auto_105645 ?auto_105641 ) ) ( not ( = ?auto_105645 ?auto_105644 ) ) ( not ( = ?auto_105645 ?auto_105640 ) ) ( not ( = ?auto_105645 ?auto_105639 ) ) ( not ( = ?auto_105643 ?auto_105641 ) ) ( not ( = ?auto_105643 ?auto_105644 ) ) ( not ( = ?auto_105643 ?auto_105640 ) ) ( not ( = ?auto_105643 ?auto_105639 ) ) ( not ( = ?auto_105641 ?auto_105644 ) ) ( not ( = ?auto_105641 ?auto_105640 ) ) ( not ( = ?auto_105641 ?auto_105639 ) ) ( not ( = ?auto_105638 ?auto_105645 ) ) ( not ( = ?auto_105638 ?auto_105643 ) ) ( not ( = ?auto_105638 ?auto_105641 ) ) ( ON ?auto_105638 ?auto_105642 ) ( not ( = ?auto_105638 ?auto_105642 ) ) ( not ( = ?auto_105639 ?auto_105642 ) ) ( not ( = ?auto_105640 ?auto_105642 ) ) ( not ( = ?auto_105644 ?auto_105642 ) ) ( not ( = ?auto_105645 ?auto_105642 ) ) ( not ( = ?auto_105643 ?auto_105642 ) ) ( not ( = ?auto_105641 ?auto_105642 ) ) ( ON ?auto_105639 ?auto_105638 ) ( ON-TABLE ?auto_105642 ) ( CLEAR ?auto_105644 ) ( ON ?auto_105640 ?auto_105639 ) ( CLEAR ?auto_105640 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_105642 ?auto_105638 ?auto_105639 )
      ( MAKE-3PILE ?auto_105638 ?auto_105639 ?auto_105640 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_105646 - BLOCK
      ?auto_105647 - BLOCK
      ?auto_105648 - BLOCK
    )
    :vars
    (
      ?auto_105653 - BLOCK
      ?auto_105652 - BLOCK
      ?auto_105650 - BLOCK
      ?auto_105649 - BLOCK
      ?auto_105651 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105646 ?auto_105647 ) ) ( not ( = ?auto_105646 ?auto_105648 ) ) ( not ( = ?auto_105647 ?auto_105648 ) ) ( not ( = ?auto_105646 ?auto_105653 ) ) ( not ( = ?auto_105647 ?auto_105653 ) ) ( not ( = ?auto_105648 ?auto_105653 ) ) ( ON-TABLE ?auto_105652 ) ( ON ?auto_105650 ?auto_105652 ) ( ON ?auto_105649 ?auto_105650 ) ( not ( = ?auto_105652 ?auto_105650 ) ) ( not ( = ?auto_105652 ?auto_105649 ) ) ( not ( = ?auto_105652 ?auto_105653 ) ) ( not ( = ?auto_105652 ?auto_105648 ) ) ( not ( = ?auto_105652 ?auto_105647 ) ) ( not ( = ?auto_105650 ?auto_105649 ) ) ( not ( = ?auto_105650 ?auto_105653 ) ) ( not ( = ?auto_105650 ?auto_105648 ) ) ( not ( = ?auto_105650 ?auto_105647 ) ) ( not ( = ?auto_105649 ?auto_105653 ) ) ( not ( = ?auto_105649 ?auto_105648 ) ) ( not ( = ?auto_105649 ?auto_105647 ) ) ( not ( = ?auto_105646 ?auto_105652 ) ) ( not ( = ?auto_105646 ?auto_105650 ) ) ( not ( = ?auto_105646 ?auto_105649 ) ) ( ON ?auto_105646 ?auto_105651 ) ( not ( = ?auto_105646 ?auto_105651 ) ) ( not ( = ?auto_105647 ?auto_105651 ) ) ( not ( = ?auto_105648 ?auto_105651 ) ) ( not ( = ?auto_105653 ?auto_105651 ) ) ( not ( = ?auto_105652 ?auto_105651 ) ) ( not ( = ?auto_105650 ?auto_105651 ) ) ( not ( = ?auto_105649 ?auto_105651 ) ) ( ON ?auto_105647 ?auto_105646 ) ( ON-TABLE ?auto_105651 ) ( ON ?auto_105648 ?auto_105647 ) ( CLEAR ?auto_105648 ) ( HOLDING ?auto_105653 ) ( CLEAR ?auto_105649 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_105652 ?auto_105650 ?auto_105649 ?auto_105653 )
      ( MAKE-3PILE ?auto_105646 ?auto_105647 ?auto_105648 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_105654 - BLOCK
      ?auto_105655 - BLOCK
      ?auto_105656 - BLOCK
    )
    :vars
    (
      ?auto_105661 - BLOCK
      ?auto_105659 - BLOCK
      ?auto_105660 - BLOCK
      ?auto_105657 - BLOCK
      ?auto_105658 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105654 ?auto_105655 ) ) ( not ( = ?auto_105654 ?auto_105656 ) ) ( not ( = ?auto_105655 ?auto_105656 ) ) ( not ( = ?auto_105654 ?auto_105661 ) ) ( not ( = ?auto_105655 ?auto_105661 ) ) ( not ( = ?auto_105656 ?auto_105661 ) ) ( ON-TABLE ?auto_105659 ) ( ON ?auto_105660 ?auto_105659 ) ( ON ?auto_105657 ?auto_105660 ) ( not ( = ?auto_105659 ?auto_105660 ) ) ( not ( = ?auto_105659 ?auto_105657 ) ) ( not ( = ?auto_105659 ?auto_105661 ) ) ( not ( = ?auto_105659 ?auto_105656 ) ) ( not ( = ?auto_105659 ?auto_105655 ) ) ( not ( = ?auto_105660 ?auto_105657 ) ) ( not ( = ?auto_105660 ?auto_105661 ) ) ( not ( = ?auto_105660 ?auto_105656 ) ) ( not ( = ?auto_105660 ?auto_105655 ) ) ( not ( = ?auto_105657 ?auto_105661 ) ) ( not ( = ?auto_105657 ?auto_105656 ) ) ( not ( = ?auto_105657 ?auto_105655 ) ) ( not ( = ?auto_105654 ?auto_105659 ) ) ( not ( = ?auto_105654 ?auto_105660 ) ) ( not ( = ?auto_105654 ?auto_105657 ) ) ( ON ?auto_105654 ?auto_105658 ) ( not ( = ?auto_105654 ?auto_105658 ) ) ( not ( = ?auto_105655 ?auto_105658 ) ) ( not ( = ?auto_105656 ?auto_105658 ) ) ( not ( = ?auto_105661 ?auto_105658 ) ) ( not ( = ?auto_105659 ?auto_105658 ) ) ( not ( = ?auto_105660 ?auto_105658 ) ) ( not ( = ?auto_105657 ?auto_105658 ) ) ( ON ?auto_105655 ?auto_105654 ) ( ON-TABLE ?auto_105658 ) ( ON ?auto_105656 ?auto_105655 ) ( CLEAR ?auto_105657 ) ( ON ?auto_105661 ?auto_105656 ) ( CLEAR ?auto_105661 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_105658 ?auto_105654 ?auto_105655 ?auto_105656 )
      ( MAKE-3PILE ?auto_105654 ?auto_105655 ?auto_105656 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_105662 - BLOCK
      ?auto_105663 - BLOCK
      ?auto_105664 - BLOCK
    )
    :vars
    (
      ?auto_105668 - BLOCK
      ?auto_105669 - BLOCK
      ?auto_105666 - BLOCK
      ?auto_105667 - BLOCK
      ?auto_105665 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105662 ?auto_105663 ) ) ( not ( = ?auto_105662 ?auto_105664 ) ) ( not ( = ?auto_105663 ?auto_105664 ) ) ( not ( = ?auto_105662 ?auto_105668 ) ) ( not ( = ?auto_105663 ?auto_105668 ) ) ( not ( = ?auto_105664 ?auto_105668 ) ) ( ON-TABLE ?auto_105669 ) ( ON ?auto_105666 ?auto_105669 ) ( not ( = ?auto_105669 ?auto_105666 ) ) ( not ( = ?auto_105669 ?auto_105667 ) ) ( not ( = ?auto_105669 ?auto_105668 ) ) ( not ( = ?auto_105669 ?auto_105664 ) ) ( not ( = ?auto_105669 ?auto_105663 ) ) ( not ( = ?auto_105666 ?auto_105667 ) ) ( not ( = ?auto_105666 ?auto_105668 ) ) ( not ( = ?auto_105666 ?auto_105664 ) ) ( not ( = ?auto_105666 ?auto_105663 ) ) ( not ( = ?auto_105667 ?auto_105668 ) ) ( not ( = ?auto_105667 ?auto_105664 ) ) ( not ( = ?auto_105667 ?auto_105663 ) ) ( not ( = ?auto_105662 ?auto_105669 ) ) ( not ( = ?auto_105662 ?auto_105666 ) ) ( not ( = ?auto_105662 ?auto_105667 ) ) ( ON ?auto_105662 ?auto_105665 ) ( not ( = ?auto_105662 ?auto_105665 ) ) ( not ( = ?auto_105663 ?auto_105665 ) ) ( not ( = ?auto_105664 ?auto_105665 ) ) ( not ( = ?auto_105668 ?auto_105665 ) ) ( not ( = ?auto_105669 ?auto_105665 ) ) ( not ( = ?auto_105666 ?auto_105665 ) ) ( not ( = ?auto_105667 ?auto_105665 ) ) ( ON ?auto_105663 ?auto_105662 ) ( ON-TABLE ?auto_105665 ) ( ON ?auto_105664 ?auto_105663 ) ( ON ?auto_105668 ?auto_105664 ) ( CLEAR ?auto_105668 ) ( HOLDING ?auto_105667 ) ( CLEAR ?auto_105666 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_105669 ?auto_105666 ?auto_105667 )
      ( MAKE-3PILE ?auto_105662 ?auto_105663 ?auto_105664 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_105670 - BLOCK
      ?auto_105671 - BLOCK
      ?auto_105672 - BLOCK
    )
    :vars
    (
      ?auto_105673 - BLOCK
      ?auto_105674 - BLOCK
      ?auto_105675 - BLOCK
      ?auto_105677 - BLOCK
      ?auto_105676 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105670 ?auto_105671 ) ) ( not ( = ?auto_105670 ?auto_105672 ) ) ( not ( = ?auto_105671 ?auto_105672 ) ) ( not ( = ?auto_105670 ?auto_105673 ) ) ( not ( = ?auto_105671 ?auto_105673 ) ) ( not ( = ?auto_105672 ?auto_105673 ) ) ( ON-TABLE ?auto_105674 ) ( ON ?auto_105675 ?auto_105674 ) ( not ( = ?auto_105674 ?auto_105675 ) ) ( not ( = ?auto_105674 ?auto_105677 ) ) ( not ( = ?auto_105674 ?auto_105673 ) ) ( not ( = ?auto_105674 ?auto_105672 ) ) ( not ( = ?auto_105674 ?auto_105671 ) ) ( not ( = ?auto_105675 ?auto_105677 ) ) ( not ( = ?auto_105675 ?auto_105673 ) ) ( not ( = ?auto_105675 ?auto_105672 ) ) ( not ( = ?auto_105675 ?auto_105671 ) ) ( not ( = ?auto_105677 ?auto_105673 ) ) ( not ( = ?auto_105677 ?auto_105672 ) ) ( not ( = ?auto_105677 ?auto_105671 ) ) ( not ( = ?auto_105670 ?auto_105674 ) ) ( not ( = ?auto_105670 ?auto_105675 ) ) ( not ( = ?auto_105670 ?auto_105677 ) ) ( ON ?auto_105670 ?auto_105676 ) ( not ( = ?auto_105670 ?auto_105676 ) ) ( not ( = ?auto_105671 ?auto_105676 ) ) ( not ( = ?auto_105672 ?auto_105676 ) ) ( not ( = ?auto_105673 ?auto_105676 ) ) ( not ( = ?auto_105674 ?auto_105676 ) ) ( not ( = ?auto_105675 ?auto_105676 ) ) ( not ( = ?auto_105677 ?auto_105676 ) ) ( ON ?auto_105671 ?auto_105670 ) ( ON-TABLE ?auto_105676 ) ( ON ?auto_105672 ?auto_105671 ) ( ON ?auto_105673 ?auto_105672 ) ( CLEAR ?auto_105675 ) ( ON ?auto_105677 ?auto_105673 ) ( CLEAR ?auto_105677 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_105676 ?auto_105670 ?auto_105671 ?auto_105672 ?auto_105673 )
      ( MAKE-3PILE ?auto_105670 ?auto_105671 ?auto_105672 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_105678 - BLOCK
      ?auto_105679 - BLOCK
      ?auto_105680 - BLOCK
    )
    :vars
    (
      ?auto_105683 - BLOCK
      ?auto_105681 - BLOCK
      ?auto_105684 - BLOCK
      ?auto_105682 - BLOCK
      ?auto_105685 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105678 ?auto_105679 ) ) ( not ( = ?auto_105678 ?auto_105680 ) ) ( not ( = ?auto_105679 ?auto_105680 ) ) ( not ( = ?auto_105678 ?auto_105683 ) ) ( not ( = ?auto_105679 ?auto_105683 ) ) ( not ( = ?auto_105680 ?auto_105683 ) ) ( ON-TABLE ?auto_105681 ) ( not ( = ?auto_105681 ?auto_105684 ) ) ( not ( = ?auto_105681 ?auto_105682 ) ) ( not ( = ?auto_105681 ?auto_105683 ) ) ( not ( = ?auto_105681 ?auto_105680 ) ) ( not ( = ?auto_105681 ?auto_105679 ) ) ( not ( = ?auto_105684 ?auto_105682 ) ) ( not ( = ?auto_105684 ?auto_105683 ) ) ( not ( = ?auto_105684 ?auto_105680 ) ) ( not ( = ?auto_105684 ?auto_105679 ) ) ( not ( = ?auto_105682 ?auto_105683 ) ) ( not ( = ?auto_105682 ?auto_105680 ) ) ( not ( = ?auto_105682 ?auto_105679 ) ) ( not ( = ?auto_105678 ?auto_105681 ) ) ( not ( = ?auto_105678 ?auto_105684 ) ) ( not ( = ?auto_105678 ?auto_105682 ) ) ( ON ?auto_105678 ?auto_105685 ) ( not ( = ?auto_105678 ?auto_105685 ) ) ( not ( = ?auto_105679 ?auto_105685 ) ) ( not ( = ?auto_105680 ?auto_105685 ) ) ( not ( = ?auto_105683 ?auto_105685 ) ) ( not ( = ?auto_105681 ?auto_105685 ) ) ( not ( = ?auto_105684 ?auto_105685 ) ) ( not ( = ?auto_105682 ?auto_105685 ) ) ( ON ?auto_105679 ?auto_105678 ) ( ON-TABLE ?auto_105685 ) ( ON ?auto_105680 ?auto_105679 ) ( ON ?auto_105683 ?auto_105680 ) ( ON ?auto_105682 ?auto_105683 ) ( CLEAR ?auto_105682 ) ( HOLDING ?auto_105684 ) ( CLEAR ?auto_105681 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_105681 ?auto_105684 )
      ( MAKE-3PILE ?auto_105678 ?auto_105679 ?auto_105680 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_105686 - BLOCK
      ?auto_105687 - BLOCK
      ?auto_105688 - BLOCK
    )
    :vars
    (
      ?auto_105690 - BLOCK
      ?auto_105692 - BLOCK
      ?auto_105691 - BLOCK
      ?auto_105689 - BLOCK
      ?auto_105693 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105686 ?auto_105687 ) ) ( not ( = ?auto_105686 ?auto_105688 ) ) ( not ( = ?auto_105687 ?auto_105688 ) ) ( not ( = ?auto_105686 ?auto_105690 ) ) ( not ( = ?auto_105687 ?auto_105690 ) ) ( not ( = ?auto_105688 ?auto_105690 ) ) ( ON-TABLE ?auto_105692 ) ( not ( = ?auto_105692 ?auto_105691 ) ) ( not ( = ?auto_105692 ?auto_105689 ) ) ( not ( = ?auto_105692 ?auto_105690 ) ) ( not ( = ?auto_105692 ?auto_105688 ) ) ( not ( = ?auto_105692 ?auto_105687 ) ) ( not ( = ?auto_105691 ?auto_105689 ) ) ( not ( = ?auto_105691 ?auto_105690 ) ) ( not ( = ?auto_105691 ?auto_105688 ) ) ( not ( = ?auto_105691 ?auto_105687 ) ) ( not ( = ?auto_105689 ?auto_105690 ) ) ( not ( = ?auto_105689 ?auto_105688 ) ) ( not ( = ?auto_105689 ?auto_105687 ) ) ( not ( = ?auto_105686 ?auto_105692 ) ) ( not ( = ?auto_105686 ?auto_105691 ) ) ( not ( = ?auto_105686 ?auto_105689 ) ) ( ON ?auto_105686 ?auto_105693 ) ( not ( = ?auto_105686 ?auto_105693 ) ) ( not ( = ?auto_105687 ?auto_105693 ) ) ( not ( = ?auto_105688 ?auto_105693 ) ) ( not ( = ?auto_105690 ?auto_105693 ) ) ( not ( = ?auto_105692 ?auto_105693 ) ) ( not ( = ?auto_105691 ?auto_105693 ) ) ( not ( = ?auto_105689 ?auto_105693 ) ) ( ON ?auto_105687 ?auto_105686 ) ( ON-TABLE ?auto_105693 ) ( ON ?auto_105688 ?auto_105687 ) ( ON ?auto_105690 ?auto_105688 ) ( ON ?auto_105689 ?auto_105690 ) ( CLEAR ?auto_105692 ) ( ON ?auto_105691 ?auto_105689 ) ( CLEAR ?auto_105691 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_105693 ?auto_105686 ?auto_105687 ?auto_105688 ?auto_105690 ?auto_105689 )
      ( MAKE-3PILE ?auto_105686 ?auto_105687 ?auto_105688 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_105694 - BLOCK
      ?auto_105695 - BLOCK
      ?auto_105696 - BLOCK
    )
    :vars
    (
      ?auto_105700 - BLOCK
      ?auto_105698 - BLOCK
      ?auto_105699 - BLOCK
      ?auto_105701 - BLOCK
      ?auto_105697 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105694 ?auto_105695 ) ) ( not ( = ?auto_105694 ?auto_105696 ) ) ( not ( = ?auto_105695 ?auto_105696 ) ) ( not ( = ?auto_105694 ?auto_105700 ) ) ( not ( = ?auto_105695 ?auto_105700 ) ) ( not ( = ?auto_105696 ?auto_105700 ) ) ( not ( = ?auto_105698 ?auto_105699 ) ) ( not ( = ?auto_105698 ?auto_105701 ) ) ( not ( = ?auto_105698 ?auto_105700 ) ) ( not ( = ?auto_105698 ?auto_105696 ) ) ( not ( = ?auto_105698 ?auto_105695 ) ) ( not ( = ?auto_105699 ?auto_105701 ) ) ( not ( = ?auto_105699 ?auto_105700 ) ) ( not ( = ?auto_105699 ?auto_105696 ) ) ( not ( = ?auto_105699 ?auto_105695 ) ) ( not ( = ?auto_105701 ?auto_105700 ) ) ( not ( = ?auto_105701 ?auto_105696 ) ) ( not ( = ?auto_105701 ?auto_105695 ) ) ( not ( = ?auto_105694 ?auto_105698 ) ) ( not ( = ?auto_105694 ?auto_105699 ) ) ( not ( = ?auto_105694 ?auto_105701 ) ) ( ON ?auto_105694 ?auto_105697 ) ( not ( = ?auto_105694 ?auto_105697 ) ) ( not ( = ?auto_105695 ?auto_105697 ) ) ( not ( = ?auto_105696 ?auto_105697 ) ) ( not ( = ?auto_105700 ?auto_105697 ) ) ( not ( = ?auto_105698 ?auto_105697 ) ) ( not ( = ?auto_105699 ?auto_105697 ) ) ( not ( = ?auto_105701 ?auto_105697 ) ) ( ON ?auto_105695 ?auto_105694 ) ( ON-TABLE ?auto_105697 ) ( ON ?auto_105696 ?auto_105695 ) ( ON ?auto_105700 ?auto_105696 ) ( ON ?auto_105701 ?auto_105700 ) ( ON ?auto_105699 ?auto_105701 ) ( CLEAR ?auto_105699 ) ( HOLDING ?auto_105698 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_105698 )
      ( MAKE-3PILE ?auto_105694 ?auto_105695 ?auto_105696 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_105702 - BLOCK
      ?auto_105703 - BLOCK
      ?auto_105704 - BLOCK
    )
    :vars
    (
      ?auto_105707 - BLOCK
      ?auto_105706 - BLOCK
      ?auto_105705 - BLOCK
      ?auto_105709 - BLOCK
      ?auto_105708 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105702 ?auto_105703 ) ) ( not ( = ?auto_105702 ?auto_105704 ) ) ( not ( = ?auto_105703 ?auto_105704 ) ) ( not ( = ?auto_105702 ?auto_105707 ) ) ( not ( = ?auto_105703 ?auto_105707 ) ) ( not ( = ?auto_105704 ?auto_105707 ) ) ( not ( = ?auto_105706 ?auto_105705 ) ) ( not ( = ?auto_105706 ?auto_105709 ) ) ( not ( = ?auto_105706 ?auto_105707 ) ) ( not ( = ?auto_105706 ?auto_105704 ) ) ( not ( = ?auto_105706 ?auto_105703 ) ) ( not ( = ?auto_105705 ?auto_105709 ) ) ( not ( = ?auto_105705 ?auto_105707 ) ) ( not ( = ?auto_105705 ?auto_105704 ) ) ( not ( = ?auto_105705 ?auto_105703 ) ) ( not ( = ?auto_105709 ?auto_105707 ) ) ( not ( = ?auto_105709 ?auto_105704 ) ) ( not ( = ?auto_105709 ?auto_105703 ) ) ( not ( = ?auto_105702 ?auto_105706 ) ) ( not ( = ?auto_105702 ?auto_105705 ) ) ( not ( = ?auto_105702 ?auto_105709 ) ) ( ON ?auto_105702 ?auto_105708 ) ( not ( = ?auto_105702 ?auto_105708 ) ) ( not ( = ?auto_105703 ?auto_105708 ) ) ( not ( = ?auto_105704 ?auto_105708 ) ) ( not ( = ?auto_105707 ?auto_105708 ) ) ( not ( = ?auto_105706 ?auto_105708 ) ) ( not ( = ?auto_105705 ?auto_105708 ) ) ( not ( = ?auto_105709 ?auto_105708 ) ) ( ON ?auto_105703 ?auto_105702 ) ( ON-TABLE ?auto_105708 ) ( ON ?auto_105704 ?auto_105703 ) ( ON ?auto_105707 ?auto_105704 ) ( ON ?auto_105709 ?auto_105707 ) ( ON ?auto_105705 ?auto_105709 ) ( ON ?auto_105706 ?auto_105705 ) ( CLEAR ?auto_105706 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_105708 ?auto_105702 ?auto_105703 ?auto_105704 ?auto_105707 ?auto_105709 ?auto_105705 )
      ( MAKE-3PILE ?auto_105702 ?auto_105703 ?auto_105704 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_105729 - BLOCK
      ?auto_105730 - BLOCK
      ?auto_105731 - BLOCK
    )
    :vars
    (
      ?auto_105733 - BLOCK
      ?auto_105734 - BLOCK
      ?auto_105732 - BLOCK
      ?auto_105735 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105733 ?auto_105731 ) ( ON-TABLE ?auto_105729 ) ( ON ?auto_105730 ?auto_105729 ) ( ON ?auto_105731 ?auto_105730 ) ( not ( = ?auto_105729 ?auto_105730 ) ) ( not ( = ?auto_105729 ?auto_105731 ) ) ( not ( = ?auto_105729 ?auto_105733 ) ) ( not ( = ?auto_105730 ?auto_105731 ) ) ( not ( = ?auto_105730 ?auto_105733 ) ) ( not ( = ?auto_105731 ?auto_105733 ) ) ( not ( = ?auto_105729 ?auto_105734 ) ) ( not ( = ?auto_105729 ?auto_105732 ) ) ( not ( = ?auto_105730 ?auto_105734 ) ) ( not ( = ?auto_105730 ?auto_105732 ) ) ( not ( = ?auto_105731 ?auto_105734 ) ) ( not ( = ?auto_105731 ?auto_105732 ) ) ( not ( = ?auto_105733 ?auto_105734 ) ) ( not ( = ?auto_105733 ?auto_105732 ) ) ( not ( = ?auto_105734 ?auto_105732 ) ) ( ON ?auto_105734 ?auto_105733 ) ( CLEAR ?auto_105734 ) ( HOLDING ?auto_105732 ) ( CLEAR ?auto_105735 ) ( ON-TABLE ?auto_105735 ) ( not ( = ?auto_105735 ?auto_105732 ) ) ( not ( = ?auto_105729 ?auto_105735 ) ) ( not ( = ?auto_105730 ?auto_105735 ) ) ( not ( = ?auto_105731 ?auto_105735 ) ) ( not ( = ?auto_105733 ?auto_105735 ) ) ( not ( = ?auto_105734 ?auto_105735 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_105735 ?auto_105732 )
      ( MAKE-3PILE ?auto_105729 ?auto_105730 ?auto_105731 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_105736 - BLOCK
      ?auto_105737 - BLOCK
      ?auto_105738 - BLOCK
    )
    :vars
    (
      ?auto_105739 - BLOCK
      ?auto_105741 - BLOCK
      ?auto_105742 - BLOCK
      ?auto_105740 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105739 ?auto_105738 ) ( ON-TABLE ?auto_105736 ) ( ON ?auto_105737 ?auto_105736 ) ( ON ?auto_105738 ?auto_105737 ) ( not ( = ?auto_105736 ?auto_105737 ) ) ( not ( = ?auto_105736 ?auto_105738 ) ) ( not ( = ?auto_105736 ?auto_105739 ) ) ( not ( = ?auto_105737 ?auto_105738 ) ) ( not ( = ?auto_105737 ?auto_105739 ) ) ( not ( = ?auto_105738 ?auto_105739 ) ) ( not ( = ?auto_105736 ?auto_105741 ) ) ( not ( = ?auto_105736 ?auto_105742 ) ) ( not ( = ?auto_105737 ?auto_105741 ) ) ( not ( = ?auto_105737 ?auto_105742 ) ) ( not ( = ?auto_105738 ?auto_105741 ) ) ( not ( = ?auto_105738 ?auto_105742 ) ) ( not ( = ?auto_105739 ?auto_105741 ) ) ( not ( = ?auto_105739 ?auto_105742 ) ) ( not ( = ?auto_105741 ?auto_105742 ) ) ( ON ?auto_105741 ?auto_105739 ) ( CLEAR ?auto_105740 ) ( ON-TABLE ?auto_105740 ) ( not ( = ?auto_105740 ?auto_105742 ) ) ( not ( = ?auto_105736 ?auto_105740 ) ) ( not ( = ?auto_105737 ?auto_105740 ) ) ( not ( = ?auto_105738 ?auto_105740 ) ) ( not ( = ?auto_105739 ?auto_105740 ) ) ( not ( = ?auto_105741 ?auto_105740 ) ) ( ON ?auto_105742 ?auto_105741 ) ( CLEAR ?auto_105742 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_105736 ?auto_105737 ?auto_105738 ?auto_105739 ?auto_105741 )
      ( MAKE-3PILE ?auto_105736 ?auto_105737 ?auto_105738 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_105743 - BLOCK
      ?auto_105744 - BLOCK
      ?auto_105745 - BLOCK
    )
    :vars
    (
      ?auto_105748 - BLOCK
      ?auto_105749 - BLOCK
      ?auto_105746 - BLOCK
      ?auto_105747 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105748 ?auto_105745 ) ( ON-TABLE ?auto_105743 ) ( ON ?auto_105744 ?auto_105743 ) ( ON ?auto_105745 ?auto_105744 ) ( not ( = ?auto_105743 ?auto_105744 ) ) ( not ( = ?auto_105743 ?auto_105745 ) ) ( not ( = ?auto_105743 ?auto_105748 ) ) ( not ( = ?auto_105744 ?auto_105745 ) ) ( not ( = ?auto_105744 ?auto_105748 ) ) ( not ( = ?auto_105745 ?auto_105748 ) ) ( not ( = ?auto_105743 ?auto_105749 ) ) ( not ( = ?auto_105743 ?auto_105746 ) ) ( not ( = ?auto_105744 ?auto_105749 ) ) ( not ( = ?auto_105744 ?auto_105746 ) ) ( not ( = ?auto_105745 ?auto_105749 ) ) ( not ( = ?auto_105745 ?auto_105746 ) ) ( not ( = ?auto_105748 ?auto_105749 ) ) ( not ( = ?auto_105748 ?auto_105746 ) ) ( not ( = ?auto_105749 ?auto_105746 ) ) ( ON ?auto_105749 ?auto_105748 ) ( not ( = ?auto_105747 ?auto_105746 ) ) ( not ( = ?auto_105743 ?auto_105747 ) ) ( not ( = ?auto_105744 ?auto_105747 ) ) ( not ( = ?auto_105745 ?auto_105747 ) ) ( not ( = ?auto_105748 ?auto_105747 ) ) ( not ( = ?auto_105749 ?auto_105747 ) ) ( ON ?auto_105746 ?auto_105749 ) ( CLEAR ?auto_105746 ) ( HOLDING ?auto_105747 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_105747 )
      ( MAKE-3PILE ?auto_105743 ?auto_105744 ?auto_105745 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_105760 - BLOCK
      ?auto_105761 - BLOCK
      ?auto_105762 - BLOCK
    )
    :vars
    (
      ?auto_105763 - BLOCK
      ?auto_105766 - BLOCK
      ?auto_105765 - BLOCK
      ?auto_105764 - BLOCK
      ?auto_105767 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105763 ?auto_105762 ) ( ON-TABLE ?auto_105760 ) ( ON ?auto_105761 ?auto_105760 ) ( ON ?auto_105762 ?auto_105761 ) ( not ( = ?auto_105760 ?auto_105761 ) ) ( not ( = ?auto_105760 ?auto_105762 ) ) ( not ( = ?auto_105760 ?auto_105763 ) ) ( not ( = ?auto_105761 ?auto_105762 ) ) ( not ( = ?auto_105761 ?auto_105763 ) ) ( not ( = ?auto_105762 ?auto_105763 ) ) ( not ( = ?auto_105760 ?auto_105766 ) ) ( not ( = ?auto_105760 ?auto_105765 ) ) ( not ( = ?auto_105761 ?auto_105766 ) ) ( not ( = ?auto_105761 ?auto_105765 ) ) ( not ( = ?auto_105762 ?auto_105766 ) ) ( not ( = ?auto_105762 ?auto_105765 ) ) ( not ( = ?auto_105763 ?auto_105766 ) ) ( not ( = ?auto_105763 ?auto_105765 ) ) ( not ( = ?auto_105766 ?auto_105765 ) ) ( ON ?auto_105766 ?auto_105763 ) ( not ( = ?auto_105764 ?auto_105765 ) ) ( not ( = ?auto_105760 ?auto_105764 ) ) ( not ( = ?auto_105761 ?auto_105764 ) ) ( not ( = ?auto_105762 ?auto_105764 ) ) ( not ( = ?auto_105763 ?auto_105764 ) ) ( not ( = ?auto_105766 ?auto_105764 ) ) ( ON ?auto_105765 ?auto_105766 ) ( CLEAR ?auto_105765 ) ( ON ?auto_105764 ?auto_105767 ) ( CLEAR ?auto_105764 ) ( HAND-EMPTY ) ( not ( = ?auto_105760 ?auto_105767 ) ) ( not ( = ?auto_105761 ?auto_105767 ) ) ( not ( = ?auto_105762 ?auto_105767 ) ) ( not ( = ?auto_105763 ?auto_105767 ) ) ( not ( = ?auto_105766 ?auto_105767 ) ) ( not ( = ?auto_105765 ?auto_105767 ) ) ( not ( = ?auto_105764 ?auto_105767 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_105764 ?auto_105767 )
      ( MAKE-3PILE ?auto_105760 ?auto_105761 ?auto_105762 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_105768 - BLOCK
      ?auto_105769 - BLOCK
      ?auto_105770 - BLOCK
    )
    :vars
    (
      ?auto_105771 - BLOCK
      ?auto_105774 - BLOCK
      ?auto_105772 - BLOCK
      ?auto_105773 - BLOCK
      ?auto_105775 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105771 ?auto_105770 ) ( ON-TABLE ?auto_105768 ) ( ON ?auto_105769 ?auto_105768 ) ( ON ?auto_105770 ?auto_105769 ) ( not ( = ?auto_105768 ?auto_105769 ) ) ( not ( = ?auto_105768 ?auto_105770 ) ) ( not ( = ?auto_105768 ?auto_105771 ) ) ( not ( = ?auto_105769 ?auto_105770 ) ) ( not ( = ?auto_105769 ?auto_105771 ) ) ( not ( = ?auto_105770 ?auto_105771 ) ) ( not ( = ?auto_105768 ?auto_105774 ) ) ( not ( = ?auto_105768 ?auto_105772 ) ) ( not ( = ?auto_105769 ?auto_105774 ) ) ( not ( = ?auto_105769 ?auto_105772 ) ) ( not ( = ?auto_105770 ?auto_105774 ) ) ( not ( = ?auto_105770 ?auto_105772 ) ) ( not ( = ?auto_105771 ?auto_105774 ) ) ( not ( = ?auto_105771 ?auto_105772 ) ) ( not ( = ?auto_105774 ?auto_105772 ) ) ( ON ?auto_105774 ?auto_105771 ) ( not ( = ?auto_105773 ?auto_105772 ) ) ( not ( = ?auto_105768 ?auto_105773 ) ) ( not ( = ?auto_105769 ?auto_105773 ) ) ( not ( = ?auto_105770 ?auto_105773 ) ) ( not ( = ?auto_105771 ?auto_105773 ) ) ( not ( = ?auto_105774 ?auto_105773 ) ) ( ON ?auto_105773 ?auto_105775 ) ( CLEAR ?auto_105773 ) ( not ( = ?auto_105768 ?auto_105775 ) ) ( not ( = ?auto_105769 ?auto_105775 ) ) ( not ( = ?auto_105770 ?auto_105775 ) ) ( not ( = ?auto_105771 ?auto_105775 ) ) ( not ( = ?auto_105774 ?auto_105775 ) ) ( not ( = ?auto_105772 ?auto_105775 ) ) ( not ( = ?auto_105773 ?auto_105775 ) ) ( HOLDING ?auto_105772 ) ( CLEAR ?auto_105774 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_105768 ?auto_105769 ?auto_105770 ?auto_105771 ?auto_105774 ?auto_105772 )
      ( MAKE-3PILE ?auto_105768 ?auto_105769 ?auto_105770 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_105830 - BLOCK
      ?auto_105831 - BLOCK
      ?auto_105832 - BLOCK
      ?auto_105833 - BLOCK
    )
    :vars
    (
      ?auto_105834 - BLOCK
      ?auto_105835 - BLOCK
      ?auto_105836 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_105830 ) ( ON ?auto_105831 ?auto_105830 ) ( not ( = ?auto_105830 ?auto_105831 ) ) ( not ( = ?auto_105830 ?auto_105832 ) ) ( not ( = ?auto_105830 ?auto_105833 ) ) ( not ( = ?auto_105831 ?auto_105832 ) ) ( not ( = ?auto_105831 ?auto_105833 ) ) ( not ( = ?auto_105832 ?auto_105833 ) ) ( ON ?auto_105833 ?auto_105834 ) ( not ( = ?auto_105830 ?auto_105834 ) ) ( not ( = ?auto_105831 ?auto_105834 ) ) ( not ( = ?auto_105832 ?auto_105834 ) ) ( not ( = ?auto_105833 ?auto_105834 ) ) ( CLEAR ?auto_105831 ) ( ON ?auto_105832 ?auto_105833 ) ( CLEAR ?auto_105832 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_105835 ) ( ON ?auto_105836 ?auto_105835 ) ( ON ?auto_105834 ?auto_105836 ) ( not ( = ?auto_105835 ?auto_105836 ) ) ( not ( = ?auto_105835 ?auto_105834 ) ) ( not ( = ?auto_105835 ?auto_105833 ) ) ( not ( = ?auto_105835 ?auto_105832 ) ) ( not ( = ?auto_105836 ?auto_105834 ) ) ( not ( = ?auto_105836 ?auto_105833 ) ) ( not ( = ?auto_105836 ?auto_105832 ) ) ( not ( = ?auto_105830 ?auto_105835 ) ) ( not ( = ?auto_105830 ?auto_105836 ) ) ( not ( = ?auto_105831 ?auto_105835 ) ) ( not ( = ?auto_105831 ?auto_105836 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_105835 ?auto_105836 ?auto_105834 ?auto_105833 )
      ( MAKE-4PILE ?auto_105830 ?auto_105831 ?auto_105832 ?auto_105833 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_105837 - BLOCK
      ?auto_105838 - BLOCK
      ?auto_105839 - BLOCK
      ?auto_105840 - BLOCK
    )
    :vars
    (
      ?auto_105841 - BLOCK
      ?auto_105843 - BLOCK
      ?auto_105842 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_105837 ) ( not ( = ?auto_105837 ?auto_105838 ) ) ( not ( = ?auto_105837 ?auto_105839 ) ) ( not ( = ?auto_105837 ?auto_105840 ) ) ( not ( = ?auto_105838 ?auto_105839 ) ) ( not ( = ?auto_105838 ?auto_105840 ) ) ( not ( = ?auto_105839 ?auto_105840 ) ) ( ON ?auto_105840 ?auto_105841 ) ( not ( = ?auto_105837 ?auto_105841 ) ) ( not ( = ?auto_105838 ?auto_105841 ) ) ( not ( = ?auto_105839 ?auto_105841 ) ) ( not ( = ?auto_105840 ?auto_105841 ) ) ( ON ?auto_105839 ?auto_105840 ) ( CLEAR ?auto_105839 ) ( ON-TABLE ?auto_105843 ) ( ON ?auto_105842 ?auto_105843 ) ( ON ?auto_105841 ?auto_105842 ) ( not ( = ?auto_105843 ?auto_105842 ) ) ( not ( = ?auto_105843 ?auto_105841 ) ) ( not ( = ?auto_105843 ?auto_105840 ) ) ( not ( = ?auto_105843 ?auto_105839 ) ) ( not ( = ?auto_105842 ?auto_105841 ) ) ( not ( = ?auto_105842 ?auto_105840 ) ) ( not ( = ?auto_105842 ?auto_105839 ) ) ( not ( = ?auto_105837 ?auto_105843 ) ) ( not ( = ?auto_105837 ?auto_105842 ) ) ( not ( = ?auto_105838 ?auto_105843 ) ) ( not ( = ?auto_105838 ?auto_105842 ) ) ( HOLDING ?auto_105838 ) ( CLEAR ?auto_105837 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_105837 ?auto_105838 )
      ( MAKE-4PILE ?auto_105837 ?auto_105838 ?auto_105839 ?auto_105840 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_105844 - BLOCK
      ?auto_105845 - BLOCK
      ?auto_105846 - BLOCK
      ?auto_105847 - BLOCK
    )
    :vars
    (
      ?auto_105848 - BLOCK
      ?auto_105850 - BLOCK
      ?auto_105849 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_105844 ) ( not ( = ?auto_105844 ?auto_105845 ) ) ( not ( = ?auto_105844 ?auto_105846 ) ) ( not ( = ?auto_105844 ?auto_105847 ) ) ( not ( = ?auto_105845 ?auto_105846 ) ) ( not ( = ?auto_105845 ?auto_105847 ) ) ( not ( = ?auto_105846 ?auto_105847 ) ) ( ON ?auto_105847 ?auto_105848 ) ( not ( = ?auto_105844 ?auto_105848 ) ) ( not ( = ?auto_105845 ?auto_105848 ) ) ( not ( = ?auto_105846 ?auto_105848 ) ) ( not ( = ?auto_105847 ?auto_105848 ) ) ( ON ?auto_105846 ?auto_105847 ) ( ON-TABLE ?auto_105850 ) ( ON ?auto_105849 ?auto_105850 ) ( ON ?auto_105848 ?auto_105849 ) ( not ( = ?auto_105850 ?auto_105849 ) ) ( not ( = ?auto_105850 ?auto_105848 ) ) ( not ( = ?auto_105850 ?auto_105847 ) ) ( not ( = ?auto_105850 ?auto_105846 ) ) ( not ( = ?auto_105849 ?auto_105848 ) ) ( not ( = ?auto_105849 ?auto_105847 ) ) ( not ( = ?auto_105849 ?auto_105846 ) ) ( not ( = ?auto_105844 ?auto_105850 ) ) ( not ( = ?auto_105844 ?auto_105849 ) ) ( not ( = ?auto_105845 ?auto_105850 ) ) ( not ( = ?auto_105845 ?auto_105849 ) ) ( CLEAR ?auto_105844 ) ( ON ?auto_105845 ?auto_105846 ) ( CLEAR ?auto_105845 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_105850 ?auto_105849 ?auto_105848 ?auto_105847 ?auto_105846 )
      ( MAKE-4PILE ?auto_105844 ?auto_105845 ?auto_105846 ?auto_105847 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_105851 - BLOCK
      ?auto_105852 - BLOCK
      ?auto_105853 - BLOCK
      ?auto_105854 - BLOCK
    )
    :vars
    (
      ?auto_105855 - BLOCK
      ?auto_105856 - BLOCK
      ?auto_105857 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105851 ?auto_105852 ) ) ( not ( = ?auto_105851 ?auto_105853 ) ) ( not ( = ?auto_105851 ?auto_105854 ) ) ( not ( = ?auto_105852 ?auto_105853 ) ) ( not ( = ?auto_105852 ?auto_105854 ) ) ( not ( = ?auto_105853 ?auto_105854 ) ) ( ON ?auto_105854 ?auto_105855 ) ( not ( = ?auto_105851 ?auto_105855 ) ) ( not ( = ?auto_105852 ?auto_105855 ) ) ( not ( = ?auto_105853 ?auto_105855 ) ) ( not ( = ?auto_105854 ?auto_105855 ) ) ( ON ?auto_105853 ?auto_105854 ) ( ON-TABLE ?auto_105856 ) ( ON ?auto_105857 ?auto_105856 ) ( ON ?auto_105855 ?auto_105857 ) ( not ( = ?auto_105856 ?auto_105857 ) ) ( not ( = ?auto_105856 ?auto_105855 ) ) ( not ( = ?auto_105856 ?auto_105854 ) ) ( not ( = ?auto_105856 ?auto_105853 ) ) ( not ( = ?auto_105857 ?auto_105855 ) ) ( not ( = ?auto_105857 ?auto_105854 ) ) ( not ( = ?auto_105857 ?auto_105853 ) ) ( not ( = ?auto_105851 ?auto_105856 ) ) ( not ( = ?auto_105851 ?auto_105857 ) ) ( not ( = ?auto_105852 ?auto_105856 ) ) ( not ( = ?auto_105852 ?auto_105857 ) ) ( ON ?auto_105852 ?auto_105853 ) ( CLEAR ?auto_105852 ) ( HOLDING ?auto_105851 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_105851 )
      ( MAKE-4PILE ?auto_105851 ?auto_105852 ?auto_105853 ?auto_105854 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_105858 - BLOCK
      ?auto_105859 - BLOCK
      ?auto_105860 - BLOCK
      ?auto_105861 - BLOCK
    )
    :vars
    (
      ?auto_105862 - BLOCK
      ?auto_105864 - BLOCK
      ?auto_105863 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105858 ?auto_105859 ) ) ( not ( = ?auto_105858 ?auto_105860 ) ) ( not ( = ?auto_105858 ?auto_105861 ) ) ( not ( = ?auto_105859 ?auto_105860 ) ) ( not ( = ?auto_105859 ?auto_105861 ) ) ( not ( = ?auto_105860 ?auto_105861 ) ) ( ON ?auto_105861 ?auto_105862 ) ( not ( = ?auto_105858 ?auto_105862 ) ) ( not ( = ?auto_105859 ?auto_105862 ) ) ( not ( = ?auto_105860 ?auto_105862 ) ) ( not ( = ?auto_105861 ?auto_105862 ) ) ( ON ?auto_105860 ?auto_105861 ) ( ON-TABLE ?auto_105864 ) ( ON ?auto_105863 ?auto_105864 ) ( ON ?auto_105862 ?auto_105863 ) ( not ( = ?auto_105864 ?auto_105863 ) ) ( not ( = ?auto_105864 ?auto_105862 ) ) ( not ( = ?auto_105864 ?auto_105861 ) ) ( not ( = ?auto_105864 ?auto_105860 ) ) ( not ( = ?auto_105863 ?auto_105862 ) ) ( not ( = ?auto_105863 ?auto_105861 ) ) ( not ( = ?auto_105863 ?auto_105860 ) ) ( not ( = ?auto_105858 ?auto_105864 ) ) ( not ( = ?auto_105858 ?auto_105863 ) ) ( not ( = ?auto_105859 ?auto_105864 ) ) ( not ( = ?auto_105859 ?auto_105863 ) ) ( ON ?auto_105859 ?auto_105860 ) ( ON ?auto_105858 ?auto_105859 ) ( CLEAR ?auto_105858 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_105864 ?auto_105863 ?auto_105862 ?auto_105861 ?auto_105860 ?auto_105859 )
      ( MAKE-4PILE ?auto_105858 ?auto_105859 ?auto_105860 ?auto_105861 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_105869 - BLOCK
      ?auto_105870 - BLOCK
      ?auto_105871 - BLOCK
      ?auto_105872 - BLOCK
    )
    :vars
    (
      ?auto_105873 - BLOCK
      ?auto_105875 - BLOCK
      ?auto_105874 - BLOCK
      ?auto_105876 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105869 ?auto_105870 ) ) ( not ( = ?auto_105869 ?auto_105871 ) ) ( not ( = ?auto_105869 ?auto_105872 ) ) ( not ( = ?auto_105870 ?auto_105871 ) ) ( not ( = ?auto_105870 ?auto_105872 ) ) ( not ( = ?auto_105871 ?auto_105872 ) ) ( ON ?auto_105872 ?auto_105873 ) ( not ( = ?auto_105869 ?auto_105873 ) ) ( not ( = ?auto_105870 ?auto_105873 ) ) ( not ( = ?auto_105871 ?auto_105873 ) ) ( not ( = ?auto_105872 ?auto_105873 ) ) ( ON ?auto_105871 ?auto_105872 ) ( ON-TABLE ?auto_105875 ) ( ON ?auto_105874 ?auto_105875 ) ( ON ?auto_105873 ?auto_105874 ) ( not ( = ?auto_105875 ?auto_105874 ) ) ( not ( = ?auto_105875 ?auto_105873 ) ) ( not ( = ?auto_105875 ?auto_105872 ) ) ( not ( = ?auto_105875 ?auto_105871 ) ) ( not ( = ?auto_105874 ?auto_105873 ) ) ( not ( = ?auto_105874 ?auto_105872 ) ) ( not ( = ?auto_105874 ?auto_105871 ) ) ( not ( = ?auto_105869 ?auto_105875 ) ) ( not ( = ?auto_105869 ?auto_105874 ) ) ( not ( = ?auto_105870 ?auto_105875 ) ) ( not ( = ?auto_105870 ?auto_105874 ) ) ( ON ?auto_105870 ?auto_105871 ) ( CLEAR ?auto_105870 ) ( ON ?auto_105869 ?auto_105876 ) ( CLEAR ?auto_105869 ) ( HAND-EMPTY ) ( not ( = ?auto_105869 ?auto_105876 ) ) ( not ( = ?auto_105870 ?auto_105876 ) ) ( not ( = ?auto_105871 ?auto_105876 ) ) ( not ( = ?auto_105872 ?auto_105876 ) ) ( not ( = ?auto_105873 ?auto_105876 ) ) ( not ( = ?auto_105875 ?auto_105876 ) ) ( not ( = ?auto_105874 ?auto_105876 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_105869 ?auto_105876 )
      ( MAKE-4PILE ?auto_105869 ?auto_105870 ?auto_105871 ?auto_105872 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_105877 - BLOCK
      ?auto_105878 - BLOCK
      ?auto_105879 - BLOCK
      ?auto_105880 - BLOCK
    )
    :vars
    (
      ?auto_105881 - BLOCK
      ?auto_105882 - BLOCK
      ?auto_105883 - BLOCK
      ?auto_105884 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105877 ?auto_105878 ) ) ( not ( = ?auto_105877 ?auto_105879 ) ) ( not ( = ?auto_105877 ?auto_105880 ) ) ( not ( = ?auto_105878 ?auto_105879 ) ) ( not ( = ?auto_105878 ?auto_105880 ) ) ( not ( = ?auto_105879 ?auto_105880 ) ) ( ON ?auto_105880 ?auto_105881 ) ( not ( = ?auto_105877 ?auto_105881 ) ) ( not ( = ?auto_105878 ?auto_105881 ) ) ( not ( = ?auto_105879 ?auto_105881 ) ) ( not ( = ?auto_105880 ?auto_105881 ) ) ( ON ?auto_105879 ?auto_105880 ) ( ON-TABLE ?auto_105882 ) ( ON ?auto_105883 ?auto_105882 ) ( ON ?auto_105881 ?auto_105883 ) ( not ( = ?auto_105882 ?auto_105883 ) ) ( not ( = ?auto_105882 ?auto_105881 ) ) ( not ( = ?auto_105882 ?auto_105880 ) ) ( not ( = ?auto_105882 ?auto_105879 ) ) ( not ( = ?auto_105883 ?auto_105881 ) ) ( not ( = ?auto_105883 ?auto_105880 ) ) ( not ( = ?auto_105883 ?auto_105879 ) ) ( not ( = ?auto_105877 ?auto_105882 ) ) ( not ( = ?auto_105877 ?auto_105883 ) ) ( not ( = ?auto_105878 ?auto_105882 ) ) ( not ( = ?auto_105878 ?auto_105883 ) ) ( ON ?auto_105877 ?auto_105884 ) ( CLEAR ?auto_105877 ) ( not ( = ?auto_105877 ?auto_105884 ) ) ( not ( = ?auto_105878 ?auto_105884 ) ) ( not ( = ?auto_105879 ?auto_105884 ) ) ( not ( = ?auto_105880 ?auto_105884 ) ) ( not ( = ?auto_105881 ?auto_105884 ) ) ( not ( = ?auto_105882 ?auto_105884 ) ) ( not ( = ?auto_105883 ?auto_105884 ) ) ( HOLDING ?auto_105878 ) ( CLEAR ?auto_105879 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_105882 ?auto_105883 ?auto_105881 ?auto_105880 ?auto_105879 ?auto_105878 )
      ( MAKE-4PILE ?auto_105877 ?auto_105878 ?auto_105879 ?auto_105880 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_105885 - BLOCK
      ?auto_105886 - BLOCK
      ?auto_105887 - BLOCK
      ?auto_105888 - BLOCK
    )
    :vars
    (
      ?auto_105892 - BLOCK
      ?auto_105891 - BLOCK
      ?auto_105889 - BLOCK
      ?auto_105890 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105885 ?auto_105886 ) ) ( not ( = ?auto_105885 ?auto_105887 ) ) ( not ( = ?auto_105885 ?auto_105888 ) ) ( not ( = ?auto_105886 ?auto_105887 ) ) ( not ( = ?auto_105886 ?auto_105888 ) ) ( not ( = ?auto_105887 ?auto_105888 ) ) ( ON ?auto_105888 ?auto_105892 ) ( not ( = ?auto_105885 ?auto_105892 ) ) ( not ( = ?auto_105886 ?auto_105892 ) ) ( not ( = ?auto_105887 ?auto_105892 ) ) ( not ( = ?auto_105888 ?auto_105892 ) ) ( ON ?auto_105887 ?auto_105888 ) ( ON-TABLE ?auto_105891 ) ( ON ?auto_105889 ?auto_105891 ) ( ON ?auto_105892 ?auto_105889 ) ( not ( = ?auto_105891 ?auto_105889 ) ) ( not ( = ?auto_105891 ?auto_105892 ) ) ( not ( = ?auto_105891 ?auto_105888 ) ) ( not ( = ?auto_105891 ?auto_105887 ) ) ( not ( = ?auto_105889 ?auto_105892 ) ) ( not ( = ?auto_105889 ?auto_105888 ) ) ( not ( = ?auto_105889 ?auto_105887 ) ) ( not ( = ?auto_105885 ?auto_105891 ) ) ( not ( = ?auto_105885 ?auto_105889 ) ) ( not ( = ?auto_105886 ?auto_105891 ) ) ( not ( = ?auto_105886 ?auto_105889 ) ) ( ON ?auto_105885 ?auto_105890 ) ( not ( = ?auto_105885 ?auto_105890 ) ) ( not ( = ?auto_105886 ?auto_105890 ) ) ( not ( = ?auto_105887 ?auto_105890 ) ) ( not ( = ?auto_105888 ?auto_105890 ) ) ( not ( = ?auto_105892 ?auto_105890 ) ) ( not ( = ?auto_105891 ?auto_105890 ) ) ( not ( = ?auto_105889 ?auto_105890 ) ) ( CLEAR ?auto_105887 ) ( ON ?auto_105886 ?auto_105885 ) ( CLEAR ?auto_105886 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_105890 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_105890 ?auto_105885 )
      ( MAKE-4PILE ?auto_105885 ?auto_105886 ?auto_105887 ?auto_105888 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_105893 - BLOCK
      ?auto_105894 - BLOCK
      ?auto_105895 - BLOCK
      ?auto_105896 - BLOCK
    )
    :vars
    (
      ?auto_105899 - BLOCK
      ?auto_105898 - BLOCK
      ?auto_105897 - BLOCK
      ?auto_105900 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105893 ?auto_105894 ) ) ( not ( = ?auto_105893 ?auto_105895 ) ) ( not ( = ?auto_105893 ?auto_105896 ) ) ( not ( = ?auto_105894 ?auto_105895 ) ) ( not ( = ?auto_105894 ?auto_105896 ) ) ( not ( = ?auto_105895 ?auto_105896 ) ) ( ON ?auto_105896 ?auto_105899 ) ( not ( = ?auto_105893 ?auto_105899 ) ) ( not ( = ?auto_105894 ?auto_105899 ) ) ( not ( = ?auto_105895 ?auto_105899 ) ) ( not ( = ?auto_105896 ?auto_105899 ) ) ( ON-TABLE ?auto_105898 ) ( ON ?auto_105897 ?auto_105898 ) ( ON ?auto_105899 ?auto_105897 ) ( not ( = ?auto_105898 ?auto_105897 ) ) ( not ( = ?auto_105898 ?auto_105899 ) ) ( not ( = ?auto_105898 ?auto_105896 ) ) ( not ( = ?auto_105898 ?auto_105895 ) ) ( not ( = ?auto_105897 ?auto_105899 ) ) ( not ( = ?auto_105897 ?auto_105896 ) ) ( not ( = ?auto_105897 ?auto_105895 ) ) ( not ( = ?auto_105893 ?auto_105898 ) ) ( not ( = ?auto_105893 ?auto_105897 ) ) ( not ( = ?auto_105894 ?auto_105898 ) ) ( not ( = ?auto_105894 ?auto_105897 ) ) ( ON ?auto_105893 ?auto_105900 ) ( not ( = ?auto_105893 ?auto_105900 ) ) ( not ( = ?auto_105894 ?auto_105900 ) ) ( not ( = ?auto_105895 ?auto_105900 ) ) ( not ( = ?auto_105896 ?auto_105900 ) ) ( not ( = ?auto_105899 ?auto_105900 ) ) ( not ( = ?auto_105898 ?auto_105900 ) ) ( not ( = ?auto_105897 ?auto_105900 ) ) ( ON ?auto_105894 ?auto_105893 ) ( CLEAR ?auto_105894 ) ( ON-TABLE ?auto_105900 ) ( HOLDING ?auto_105895 ) ( CLEAR ?auto_105896 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_105898 ?auto_105897 ?auto_105899 ?auto_105896 ?auto_105895 )
      ( MAKE-4PILE ?auto_105893 ?auto_105894 ?auto_105895 ?auto_105896 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_105901 - BLOCK
      ?auto_105902 - BLOCK
      ?auto_105903 - BLOCK
      ?auto_105904 - BLOCK
    )
    :vars
    (
      ?auto_105907 - BLOCK
      ?auto_105906 - BLOCK
      ?auto_105908 - BLOCK
      ?auto_105905 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105901 ?auto_105902 ) ) ( not ( = ?auto_105901 ?auto_105903 ) ) ( not ( = ?auto_105901 ?auto_105904 ) ) ( not ( = ?auto_105902 ?auto_105903 ) ) ( not ( = ?auto_105902 ?auto_105904 ) ) ( not ( = ?auto_105903 ?auto_105904 ) ) ( ON ?auto_105904 ?auto_105907 ) ( not ( = ?auto_105901 ?auto_105907 ) ) ( not ( = ?auto_105902 ?auto_105907 ) ) ( not ( = ?auto_105903 ?auto_105907 ) ) ( not ( = ?auto_105904 ?auto_105907 ) ) ( ON-TABLE ?auto_105906 ) ( ON ?auto_105908 ?auto_105906 ) ( ON ?auto_105907 ?auto_105908 ) ( not ( = ?auto_105906 ?auto_105908 ) ) ( not ( = ?auto_105906 ?auto_105907 ) ) ( not ( = ?auto_105906 ?auto_105904 ) ) ( not ( = ?auto_105906 ?auto_105903 ) ) ( not ( = ?auto_105908 ?auto_105907 ) ) ( not ( = ?auto_105908 ?auto_105904 ) ) ( not ( = ?auto_105908 ?auto_105903 ) ) ( not ( = ?auto_105901 ?auto_105906 ) ) ( not ( = ?auto_105901 ?auto_105908 ) ) ( not ( = ?auto_105902 ?auto_105906 ) ) ( not ( = ?auto_105902 ?auto_105908 ) ) ( ON ?auto_105901 ?auto_105905 ) ( not ( = ?auto_105901 ?auto_105905 ) ) ( not ( = ?auto_105902 ?auto_105905 ) ) ( not ( = ?auto_105903 ?auto_105905 ) ) ( not ( = ?auto_105904 ?auto_105905 ) ) ( not ( = ?auto_105907 ?auto_105905 ) ) ( not ( = ?auto_105906 ?auto_105905 ) ) ( not ( = ?auto_105908 ?auto_105905 ) ) ( ON ?auto_105902 ?auto_105901 ) ( ON-TABLE ?auto_105905 ) ( CLEAR ?auto_105904 ) ( ON ?auto_105903 ?auto_105902 ) ( CLEAR ?auto_105903 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_105905 ?auto_105901 ?auto_105902 )
      ( MAKE-4PILE ?auto_105901 ?auto_105902 ?auto_105903 ?auto_105904 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_105909 - BLOCK
      ?auto_105910 - BLOCK
      ?auto_105911 - BLOCK
      ?auto_105912 - BLOCK
    )
    :vars
    (
      ?auto_105913 - BLOCK
      ?auto_105916 - BLOCK
      ?auto_105914 - BLOCK
      ?auto_105915 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105909 ?auto_105910 ) ) ( not ( = ?auto_105909 ?auto_105911 ) ) ( not ( = ?auto_105909 ?auto_105912 ) ) ( not ( = ?auto_105910 ?auto_105911 ) ) ( not ( = ?auto_105910 ?auto_105912 ) ) ( not ( = ?auto_105911 ?auto_105912 ) ) ( not ( = ?auto_105909 ?auto_105913 ) ) ( not ( = ?auto_105910 ?auto_105913 ) ) ( not ( = ?auto_105911 ?auto_105913 ) ) ( not ( = ?auto_105912 ?auto_105913 ) ) ( ON-TABLE ?auto_105916 ) ( ON ?auto_105914 ?auto_105916 ) ( ON ?auto_105913 ?auto_105914 ) ( not ( = ?auto_105916 ?auto_105914 ) ) ( not ( = ?auto_105916 ?auto_105913 ) ) ( not ( = ?auto_105916 ?auto_105912 ) ) ( not ( = ?auto_105916 ?auto_105911 ) ) ( not ( = ?auto_105914 ?auto_105913 ) ) ( not ( = ?auto_105914 ?auto_105912 ) ) ( not ( = ?auto_105914 ?auto_105911 ) ) ( not ( = ?auto_105909 ?auto_105916 ) ) ( not ( = ?auto_105909 ?auto_105914 ) ) ( not ( = ?auto_105910 ?auto_105916 ) ) ( not ( = ?auto_105910 ?auto_105914 ) ) ( ON ?auto_105909 ?auto_105915 ) ( not ( = ?auto_105909 ?auto_105915 ) ) ( not ( = ?auto_105910 ?auto_105915 ) ) ( not ( = ?auto_105911 ?auto_105915 ) ) ( not ( = ?auto_105912 ?auto_105915 ) ) ( not ( = ?auto_105913 ?auto_105915 ) ) ( not ( = ?auto_105916 ?auto_105915 ) ) ( not ( = ?auto_105914 ?auto_105915 ) ) ( ON ?auto_105910 ?auto_105909 ) ( ON-TABLE ?auto_105915 ) ( ON ?auto_105911 ?auto_105910 ) ( CLEAR ?auto_105911 ) ( HOLDING ?auto_105912 ) ( CLEAR ?auto_105913 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_105916 ?auto_105914 ?auto_105913 ?auto_105912 )
      ( MAKE-4PILE ?auto_105909 ?auto_105910 ?auto_105911 ?auto_105912 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_105917 - BLOCK
      ?auto_105918 - BLOCK
      ?auto_105919 - BLOCK
      ?auto_105920 - BLOCK
    )
    :vars
    (
      ?auto_105924 - BLOCK
      ?auto_105922 - BLOCK
      ?auto_105921 - BLOCK
      ?auto_105923 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105917 ?auto_105918 ) ) ( not ( = ?auto_105917 ?auto_105919 ) ) ( not ( = ?auto_105917 ?auto_105920 ) ) ( not ( = ?auto_105918 ?auto_105919 ) ) ( not ( = ?auto_105918 ?auto_105920 ) ) ( not ( = ?auto_105919 ?auto_105920 ) ) ( not ( = ?auto_105917 ?auto_105924 ) ) ( not ( = ?auto_105918 ?auto_105924 ) ) ( not ( = ?auto_105919 ?auto_105924 ) ) ( not ( = ?auto_105920 ?auto_105924 ) ) ( ON-TABLE ?auto_105922 ) ( ON ?auto_105921 ?auto_105922 ) ( ON ?auto_105924 ?auto_105921 ) ( not ( = ?auto_105922 ?auto_105921 ) ) ( not ( = ?auto_105922 ?auto_105924 ) ) ( not ( = ?auto_105922 ?auto_105920 ) ) ( not ( = ?auto_105922 ?auto_105919 ) ) ( not ( = ?auto_105921 ?auto_105924 ) ) ( not ( = ?auto_105921 ?auto_105920 ) ) ( not ( = ?auto_105921 ?auto_105919 ) ) ( not ( = ?auto_105917 ?auto_105922 ) ) ( not ( = ?auto_105917 ?auto_105921 ) ) ( not ( = ?auto_105918 ?auto_105922 ) ) ( not ( = ?auto_105918 ?auto_105921 ) ) ( ON ?auto_105917 ?auto_105923 ) ( not ( = ?auto_105917 ?auto_105923 ) ) ( not ( = ?auto_105918 ?auto_105923 ) ) ( not ( = ?auto_105919 ?auto_105923 ) ) ( not ( = ?auto_105920 ?auto_105923 ) ) ( not ( = ?auto_105924 ?auto_105923 ) ) ( not ( = ?auto_105922 ?auto_105923 ) ) ( not ( = ?auto_105921 ?auto_105923 ) ) ( ON ?auto_105918 ?auto_105917 ) ( ON-TABLE ?auto_105923 ) ( ON ?auto_105919 ?auto_105918 ) ( CLEAR ?auto_105924 ) ( ON ?auto_105920 ?auto_105919 ) ( CLEAR ?auto_105920 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_105923 ?auto_105917 ?auto_105918 ?auto_105919 )
      ( MAKE-4PILE ?auto_105917 ?auto_105918 ?auto_105919 ?auto_105920 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_105925 - BLOCK
      ?auto_105926 - BLOCK
      ?auto_105927 - BLOCK
      ?auto_105928 - BLOCK
    )
    :vars
    (
      ?auto_105930 - BLOCK
      ?auto_105929 - BLOCK
      ?auto_105932 - BLOCK
      ?auto_105931 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105925 ?auto_105926 ) ) ( not ( = ?auto_105925 ?auto_105927 ) ) ( not ( = ?auto_105925 ?auto_105928 ) ) ( not ( = ?auto_105926 ?auto_105927 ) ) ( not ( = ?auto_105926 ?auto_105928 ) ) ( not ( = ?auto_105927 ?auto_105928 ) ) ( not ( = ?auto_105925 ?auto_105930 ) ) ( not ( = ?auto_105926 ?auto_105930 ) ) ( not ( = ?auto_105927 ?auto_105930 ) ) ( not ( = ?auto_105928 ?auto_105930 ) ) ( ON-TABLE ?auto_105929 ) ( ON ?auto_105932 ?auto_105929 ) ( not ( = ?auto_105929 ?auto_105932 ) ) ( not ( = ?auto_105929 ?auto_105930 ) ) ( not ( = ?auto_105929 ?auto_105928 ) ) ( not ( = ?auto_105929 ?auto_105927 ) ) ( not ( = ?auto_105932 ?auto_105930 ) ) ( not ( = ?auto_105932 ?auto_105928 ) ) ( not ( = ?auto_105932 ?auto_105927 ) ) ( not ( = ?auto_105925 ?auto_105929 ) ) ( not ( = ?auto_105925 ?auto_105932 ) ) ( not ( = ?auto_105926 ?auto_105929 ) ) ( not ( = ?auto_105926 ?auto_105932 ) ) ( ON ?auto_105925 ?auto_105931 ) ( not ( = ?auto_105925 ?auto_105931 ) ) ( not ( = ?auto_105926 ?auto_105931 ) ) ( not ( = ?auto_105927 ?auto_105931 ) ) ( not ( = ?auto_105928 ?auto_105931 ) ) ( not ( = ?auto_105930 ?auto_105931 ) ) ( not ( = ?auto_105929 ?auto_105931 ) ) ( not ( = ?auto_105932 ?auto_105931 ) ) ( ON ?auto_105926 ?auto_105925 ) ( ON-TABLE ?auto_105931 ) ( ON ?auto_105927 ?auto_105926 ) ( ON ?auto_105928 ?auto_105927 ) ( CLEAR ?auto_105928 ) ( HOLDING ?auto_105930 ) ( CLEAR ?auto_105932 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_105929 ?auto_105932 ?auto_105930 )
      ( MAKE-4PILE ?auto_105925 ?auto_105926 ?auto_105927 ?auto_105928 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_105933 - BLOCK
      ?auto_105934 - BLOCK
      ?auto_105935 - BLOCK
      ?auto_105936 - BLOCK
    )
    :vars
    (
      ?auto_105940 - BLOCK
      ?auto_105937 - BLOCK
      ?auto_105938 - BLOCK
      ?auto_105939 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105933 ?auto_105934 ) ) ( not ( = ?auto_105933 ?auto_105935 ) ) ( not ( = ?auto_105933 ?auto_105936 ) ) ( not ( = ?auto_105934 ?auto_105935 ) ) ( not ( = ?auto_105934 ?auto_105936 ) ) ( not ( = ?auto_105935 ?auto_105936 ) ) ( not ( = ?auto_105933 ?auto_105940 ) ) ( not ( = ?auto_105934 ?auto_105940 ) ) ( not ( = ?auto_105935 ?auto_105940 ) ) ( not ( = ?auto_105936 ?auto_105940 ) ) ( ON-TABLE ?auto_105937 ) ( ON ?auto_105938 ?auto_105937 ) ( not ( = ?auto_105937 ?auto_105938 ) ) ( not ( = ?auto_105937 ?auto_105940 ) ) ( not ( = ?auto_105937 ?auto_105936 ) ) ( not ( = ?auto_105937 ?auto_105935 ) ) ( not ( = ?auto_105938 ?auto_105940 ) ) ( not ( = ?auto_105938 ?auto_105936 ) ) ( not ( = ?auto_105938 ?auto_105935 ) ) ( not ( = ?auto_105933 ?auto_105937 ) ) ( not ( = ?auto_105933 ?auto_105938 ) ) ( not ( = ?auto_105934 ?auto_105937 ) ) ( not ( = ?auto_105934 ?auto_105938 ) ) ( ON ?auto_105933 ?auto_105939 ) ( not ( = ?auto_105933 ?auto_105939 ) ) ( not ( = ?auto_105934 ?auto_105939 ) ) ( not ( = ?auto_105935 ?auto_105939 ) ) ( not ( = ?auto_105936 ?auto_105939 ) ) ( not ( = ?auto_105940 ?auto_105939 ) ) ( not ( = ?auto_105937 ?auto_105939 ) ) ( not ( = ?auto_105938 ?auto_105939 ) ) ( ON ?auto_105934 ?auto_105933 ) ( ON-TABLE ?auto_105939 ) ( ON ?auto_105935 ?auto_105934 ) ( ON ?auto_105936 ?auto_105935 ) ( CLEAR ?auto_105938 ) ( ON ?auto_105940 ?auto_105936 ) ( CLEAR ?auto_105940 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_105939 ?auto_105933 ?auto_105934 ?auto_105935 ?auto_105936 )
      ( MAKE-4PILE ?auto_105933 ?auto_105934 ?auto_105935 ?auto_105936 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_105941 - BLOCK
      ?auto_105942 - BLOCK
      ?auto_105943 - BLOCK
      ?auto_105944 - BLOCK
    )
    :vars
    (
      ?auto_105948 - BLOCK
      ?auto_105945 - BLOCK
      ?auto_105946 - BLOCK
      ?auto_105947 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105941 ?auto_105942 ) ) ( not ( = ?auto_105941 ?auto_105943 ) ) ( not ( = ?auto_105941 ?auto_105944 ) ) ( not ( = ?auto_105942 ?auto_105943 ) ) ( not ( = ?auto_105942 ?auto_105944 ) ) ( not ( = ?auto_105943 ?auto_105944 ) ) ( not ( = ?auto_105941 ?auto_105948 ) ) ( not ( = ?auto_105942 ?auto_105948 ) ) ( not ( = ?auto_105943 ?auto_105948 ) ) ( not ( = ?auto_105944 ?auto_105948 ) ) ( ON-TABLE ?auto_105945 ) ( not ( = ?auto_105945 ?auto_105946 ) ) ( not ( = ?auto_105945 ?auto_105948 ) ) ( not ( = ?auto_105945 ?auto_105944 ) ) ( not ( = ?auto_105945 ?auto_105943 ) ) ( not ( = ?auto_105946 ?auto_105948 ) ) ( not ( = ?auto_105946 ?auto_105944 ) ) ( not ( = ?auto_105946 ?auto_105943 ) ) ( not ( = ?auto_105941 ?auto_105945 ) ) ( not ( = ?auto_105941 ?auto_105946 ) ) ( not ( = ?auto_105942 ?auto_105945 ) ) ( not ( = ?auto_105942 ?auto_105946 ) ) ( ON ?auto_105941 ?auto_105947 ) ( not ( = ?auto_105941 ?auto_105947 ) ) ( not ( = ?auto_105942 ?auto_105947 ) ) ( not ( = ?auto_105943 ?auto_105947 ) ) ( not ( = ?auto_105944 ?auto_105947 ) ) ( not ( = ?auto_105948 ?auto_105947 ) ) ( not ( = ?auto_105945 ?auto_105947 ) ) ( not ( = ?auto_105946 ?auto_105947 ) ) ( ON ?auto_105942 ?auto_105941 ) ( ON-TABLE ?auto_105947 ) ( ON ?auto_105943 ?auto_105942 ) ( ON ?auto_105944 ?auto_105943 ) ( ON ?auto_105948 ?auto_105944 ) ( CLEAR ?auto_105948 ) ( HOLDING ?auto_105946 ) ( CLEAR ?auto_105945 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_105945 ?auto_105946 )
      ( MAKE-4PILE ?auto_105941 ?auto_105942 ?auto_105943 ?auto_105944 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_105949 - BLOCK
      ?auto_105950 - BLOCK
      ?auto_105951 - BLOCK
      ?auto_105952 - BLOCK
    )
    :vars
    (
      ?auto_105955 - BLOCK
      ?auto_105956 - BLOCK
      ?auto_105954 - BLOCK
      ?auto_105953 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105949 ?auto_105950 ) ) ( not ( = ?auto_105949 ?auto_105951 ) ) ( not ( = ?auto_105949 ?auto_105952 ) ) ( not ( = ?auto_105950 ?auto_105951 ) ) ( not ( = ?auto_105950 ?auto_105952 ) ) ( not ( = ?auto_105951 ?auto_105952 ) ) ( not ( = ?auto_105949 ?auto_105955 ) ) ( not ( = ?auto_105950 ?auto_105955 ) ) ( not ( = ?auto_105951 ?auto_105955 ) ) ( not ( = ?auto_105952 ?auto_105955 ) ) ( ON-TABLE ?auto_105956 ) ( not ( = ?auto_105956 ?auto_105954 ) ) ( not ( = ?auto_105956 ?auto_105955 ) ) ( not ( = ?auto_105956 ?auto_105952 ) ) ( not ( = ?auto_105956 ?auto_105951 ) ) ( not ( = ?auto_105954 ?auto_105955 ) ) ( not ( = ?auto_105954 ?auto_105952 ) ) ( not ( = ?auto_105954 ?auto_105951 ) ) ( not ( = ?auto_105949 ?auto_105956 ) ) ( not ( = ?auto_105949 ?auto_105954 ) ) ( not ( = ?auto_105950 ?auto_105956 ) ) ( not ( = ?auto_105950 ?auto_105954 ) ) ( ON ?auto_105949 ?auto_105953 ) ( not ( = ?auto_105949 ?auto_105953 ) ) ( not ( = ?auto_105950 ?auto_105953 ) ) ( not ( = ?auto_105951 ?auto_105953 ) ) ( not ( = ?auto_105952 ?auto_105953 ) ) ( not ( = ?auto_105955 ?auto_105953 ) ) ( not ( = ?auto_105956 ?auto_105953 ) ) ( not ( = ?auto_105954 ?auto_105953 ) ) ( ON ?auto_105950 ?auto_105949 ) ( ON-TABLE ?auto_105953 ) ( ON ?auto_105951 ?auto_105950 ) ( ON ?auto_105952 ?auto_105951 ) ( ON ?auto_105955 ?auto_105952 ) ( CLEAR ?auto_105956 ) ( ON ?auto_105954 ?auto_105955 ) ( CLEAR ?auto_105954 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_105953 ?auto_105949 ?auto_105950 ?auto_105951 ?auto_105952 ?auto_105955 )
      ( MAKE-4PILE ?auto_105949 ?auto_105950 ?auto_105951 ?auto_105952 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_105957 - BLOCK
      ?auto_105958 - BLOCK
      ?auto_105959 - BLOCK
      ?auto_105960 - BLOCK
    )
    :vars
    (
      ?auto_105962 - BLOCK
      ?auto_105963 - BLOCK
      ?auto_105961 - BLOCK
      ?auto_105964 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105957 ?auto_105958 ) ) ( not ( = ?auto_105957 ?auto_105959 ) ) ( not ( = ?auto_105957 ?auto_105960 ) ) ( not ( = ?auto_105958 ?auto_105959 ) ) ( not ( = ?auto_105958 ?auto_105960 ) ) ( not ( = ?auto_105959 ?auto_105960 ) ) ( not ( = ?auto_105957 ?auto_105962 ) ) ( not ( = ?auto_105958 ?auto_105962 ) ) ( not ( = ?auto_105959 ?auto_105962 ) ) ( not ( = ?auto_105960 ?auto_105962 ) ) ( not ( = ?auto_105963 ?auto_105961 ) ) ( not ( = ?auto_105963 ?auto_105962 ) ) ( not ( = ?auto_105963 ?auto_105960 ) ) ( not ( = ?auto_105963 ?auto_105959 ) ) ( not ( = ?auto_105961 ?auto_105962 ) ) ( not ( = ?auto_105961 ?auto_105960 ) ) ( not ( = ?auto_105961 ?auto_105959 ) ) ( not ( = ?auto_105957 ?auto_105963 ) ) ( not ( = ?auto_105957 ?auto_105961 ) ) ( not ( = ?auto_105958 ?auto_105963 ) ) ( not ( = ?auto_105958 ?auto_105961 ) ) ( ON ?auto_105957 ?auto_105964 ) ( not ( = ?auto_105957 ?auto_105964 ) ) ( not ( = ?auto_105958 ?auto_105964 ) ) ( not ( = ?auto_105959 ?auto_105964 ) ) ( not ( = ?auto_105960 ?auto_105964 ) ) ( not ( = ?auto_105962 ?auto_105964 ) ) ( not ( = ?auto_105963 ?auto_105964 ) ) ( not ( = ?auto_105961 ?auto_105964 ) ) ( ON ?auto_105958 ?auto_105957 ) ( ON-TABLE ?auto_105964 ) ( ON ?auto_105959 ?auto_105958 ) ( ON ?auto_105960 ?auto_105959 ) ( ON ?auto_105962 ?auto_105960 ) ( ON ?auto_105961 ?auto_105962 ) ( CLEAR ?auto_105961 ) ( HOLDING ?auto_105963 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_105963 )
      ( MAKE-4PILE ?auto_105957 ?auto_105958 ?auto_105959 ?auto_105960 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_105965 - BLOCK
      ?auto_105966 - BLOCK
      ?auto_105967 - BLOCK
      ?auto_105968 - BLOCK
    )
    :vars
    (
      ?auto_105969 - BLOCK
      ?auto_105970 - BLOCK
      ?auto_105972 - BLOCK
      ?auto_105971 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105965 ?auto_105966 ) ) ( not ( = ?auto_105965 ?auto_105967 ) ) ( not ( = ?auto_105965 ?auto_105968 ) ) ( not ( = ?auto_105966 ?auto_105967 ) ) ( not ( = ?auto_105966 ?auto_105968 ) ) ( not ( = ?auto_105967 ?auto_105968 ) ) ( not ( = ?auto_105965 ?auto_105969 ) ) ( not ( = ?auto_105966 ?auto_105969 ) ) ( not ( = ?auto_105967 ?auto_105969 ) ) ( not ( = ?auto_105968 ?auto_105969 ) ) ( not ( = ?auto_105970 ?auto_105972 ) ) ( not ( = ?auto_105970 ?auto_105969 ) ) ( not ( = ?auto_105970 ?auto_105968 ) ) ( not ( = ?auto_105970 ?auto_105967 ) ) ( not ( = ?auto_105972 ?auto_105969 ) ) ( not ( = ?auto_105972 ?auto_105968 ) ) ( not ( = ?auto_105972 ?auto_105967 ) ) ( not ( = ?auto_105965 ?auto_105970 ) ) ( not ( = ?auto_105965 ?auto_105972 ) ) ( not ( = ?auto_105966 ?auto_105970 ) ) ( not ( = ?auto_105966 ?auto_105972 ) ) ( ON ?auto_105965 ?auto_105971 ) ( not ( = ?auto_105965 ?auto_105971 ) ) ( not ( = ?auto_105966 ?auto_105971 ) ) ( not ( = ?auto_105967 ?auto_105971 ) ) ( not ( = ?auto_105968 ?auto_105971 ) ) ( not ( = ?auto_105969 ?auto_105971 ) ) ( not ( = ?auto_105970 ?auto_105971 ) ) ( not ( = ?auto_105972 ?auto_105971 ) ) ( ON ?auto_105966 ?auto_105965 ) ( ON-TABLE ?auto_105971 ) ( ON ?auto_105967 ?auto_105966 ) ( ON ?auto_105968 ?auto_105967 ) ( ON ?auto_105969 ?auto_105968 ) ( ON ?auto_105972 ?auto_105969 ) ( ON ?auto_105970 ?auto_105972 ) ( CLEAR ?auto_105970 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_105971 ?auto_105965 ?auto_105966 ?auto_105967 ?auto_105968 ?auto_105969 ?auto_105972 )
      ( MAKE-4PILE ?auto_105965 ?auto_105966 ?auto_105967 ?auto_105968 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_105988 - BLOCK
      ?auto_105989 - BLOCK
    )
    :vars
    (
      ?auto_105992 - BLOCK
      ?auto_105991 - BLOCK
      ?auto_105990 - BLOCK
      ?auto_105994 - BLOCK
      ?auto_105993 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105992 ?auto_105989 ) ( ON-TABLE ?auto_105988 ) ( ON ?auto_105989 ?auto_105988 ) ( not ( = ?auto_105988 ?auto_105989 ) ) ( not ( = ?auto_105988 ?auto_105992 ) ) ( not ( = ?auto_105989 ?auto_105992 ) ) ( not ( = ?auto_105988 ?auto_105991 ) ) ( not ( = ?auto_105988 ?auto_105990 ) ) ( not ( = ?auto_105989 ?auto_105991 ) ) ( not ( = ?auto_105989 ?auto_105990 ) ) ( not ( = ?auto_105992 ?auto_105991 ) ) ( not ( = ?auto_105992 ?auto_105990 ) ) ( not ( = ?auto_105991 ?auto_105990 ) ) ( ON ?auto_105991 ?auto_105992 ) ( CLEAR ?auto_105991 ) ( HOLDING ?auto_105990 ) ( CLEAR ?auto_105994 ) ( ON-TABLE ?auto_105993 ) ( ON ?auto_105994 ?auto_105993 ) ( not ( = ?auto_105993 ?auto_105994 ) ) ( not ( = ?auto_105993 ?auto_105990 ) ) ( not ( = ?auto_105994 ?auto_105990 ) ) ( not ( = ?auto_105988 ?auto_105994 ) ) ( not ( = ?auto_105988 ?auto_105993 ) ) ( not ( = ?auto_105989 ?auto_105994 ) ) ( not ( = ?auto_105989 ?auto_105993 ) ) ( not ( = ?auto_105992 ?auto_105994 ) ) ( not ( = ?auto_105992 ?auto_105993 ) ) ( not ( = ?auto_105991 ?auto_105994 ) ) ( not ( = ?auto_105991 ?auto_105993 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_105993 ?auto_105994 ?auto_105990 )
      ( MAKE-2PILE ?auto_105988 ?auto_105989 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_105995 - BLOCK
      ?auto_105996 - BLOCK
    )
    :vars
    (
      ?auto_106000 - BLOCK
      ?auto_105998 - BLOCK
      ?auto_105999 - BLOCK
      ?auto_106001 - BLOCK
      ?auto_105997 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106000 ?auto_105996 ) ( ON-TABLE ?auto_105995 ) ( ON ?auto_105996 ?auto_105995 ) ( not ( = ?auto_105995 ?auto_105996 ) ) ( not ( = ?auto_105995 ?auto_106000 ) ) ( not ( = ?auto_105996 ?auto_106000 ) ) ( not ( = ?auto_105995 ?auto_105998 ) ) ( not ( = ?auto_105995 ?auto_105999 ) ) ( not ( = ?auto_105996 ?auto_105998 ) ) ( not ( = ?auto_105996 ?auto_105999 ) ) ( not ( = ?auto_106000 ?auto_105998 ) ) ( not ( = ?auto_106000 ?auto_105999 ) ) ( not ( = ?auto_105998 ?auto_105999 ) ) ( ON ?auto_105998 ?auto_106000 ) ( CLEAR ?auto_106001 ) ( ON-TABLE ?auto_105997 ) ( ON ?auto_106001 ?auto_105997 ) ( not ( = ?auto_105997 ?auto_106001 ) ) ( not ( = ?auto_105997 ?auto_105999 ) ) ( not ( = ?auto_106001 ?auto_105999 ) ) ( not ( = ?auto_105995 ?auto_106001 ) ) ( not ( = ?auto_105995 ?auto_105997 ) ) ( not ( = ?auto_105996 ?auto_106001 ) ) ( not ( = ?auto_105996 ?auto_105997 ) ) ( not ( = ?auto_106000 ?auto_106001 ) ) ( not ( = ?auto_106000 ?auto_105997 ) ) ( not ( = ?auto_105998 ?auto_106001 ) ) ( not ( = ?auto_105998 ?auto_105997 ) ) ( ON ?auto_105999 ?auto_105998 ) ( CLEAR ?auto_105999 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_105995 ?auto_105996 ?auto_106000 ?auto_105998 )
      ( MAKE-2PILE ?auto_105995 ?auto_105996 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_106002 - BLOCK
      ?auto_106003 - BLOCK
    )
    :vars
    (
      ?auto_106005 - BLOCK
      ?auto_106008 - BLOCK
      ?auto_106006 - BLOCK
      ?auto_106007 - BLOCK
      ?auto_106004 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106005 ?auto_106003 ) ( ON-TABLE ?auto_106002 ) ( ON ?auto_106003 ?auto_106002 ) ( not ( = ?auto_106002 ?auto_106003 ) ) ( not ( = ?auto_106002 ?auto_106005 ) ) ( not ( = ?auto_106003 ?auto_106005 ) ) ( not ( = ?auto_106002 ?auto_106008 ) ) ( not ( = ?auto_106002 ?auto_106006 ) ) ( not ( = ?auto_106003 ?auto_106008 ) ) ( not ( = ?auto_106003 ?auto_106006 ) ) ( not ( = ?auto_106005 ?auto_106008 ) ) ( not ( = ?auto_106005 ?auto_106006 ) ) ( not ( = ?auto_106008 ?auto_106006 ) ) ( ON ?auto_106008 ?auto_106005 ) ( ON-TABLE ?auto_106007 ) ( not ( = ?auto_106007 ?auto_106004 ) ) ( not ( = ?auto_106007 ?auto_106006 ) ) ( not ( = ?auto_106004 ?auto_106006 ) ) ( not ( = ?auto_106002 ?auto_106004 ) ) ( not ( = ?auto_106002 ?auto_106007 ) ) ( not ( = ?auto_106003 ?auto_106004 ) ) ( not ( = ?auto_106003 ?auto_106007 ) ) ( not ( = ?auto_106005 ?auto_106004 ) ) ( not ( = ?auto_106005 ?auto_106007 ) ) ( not ( = ?auto_106008 ?auto_106004 ) ) ( not ( = ?auto_106008 ?auto_106007 ) ) ( ON ?auto_106006 ?auto_106008 ) ( CLEAR ?auto_106006 ) ( HOLDING ?auto_106004 ) ( CLEAR ?auto_106007 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_106007 ?auto_106004 )
      ( MAKE-2PILE ?auto_106002 ?auto_106003 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_106009 - BLOCK
      ?auto_106010 - BLOCK
    )
    :vars
    (
      ?auto_106015 - BLOCK
      ?auto_106012 - BLOCK
      ?auto_106013 - BLOCK
      ?auto_106014 - BLOCK
      ?auto_106011 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106015 ?auto_106010 ) ( ON-TABLE ?auto_106009 ) ( ON ?auto_106010 ?auto_106009 ) ( not ( = ?auto_106009 ?auto_106010 ) ) ( not ( = ?auto_106009 ?auto_106015 ) ) ( not ( = ?auto_106010 ?auto_106015 ) ) ( not ( = ?auto_106009 ?auto_106012 ) ) ( not ( = ?auto_106009 ?auto_106013 ) ) ( not ( = ?auto_106010 ?auto_106012 ) ) ( not ( = ?auto_106010 ?auto_106013 ) ) ( not ( = ?auto_106015 ?auto_106012 ) ) ( not ( = ?auto_106015 ?auto_106013 ) ) ( not ( = ?auto_106012 ?auto_106013 ) ) ( ON ?auto_106012 ?auto_106015 ) ( ON-TABLE ?auto_106014 ) ( not ( = ?auto_106014 ?auto_106011 ) ) ( not ( = ?auto_106014 ?auto_106013 ) ) ( not ( = ?auto_106011 ?auto_106013 ) ) ( not ( = ?auto_106009 ?auto_106011 ) ) ( not ( = ?auto_106009 ?auto_106014 ) ) ( not ( = ?auto_106010 ?auto_106011 ) ) ( not ( = ?auto_106010 ?auto_106014 ) ) ( not ( = ?auto_106015 ?auto_106011 ) ) ( not ( = ?auto_106015 ?auto_106014 ) ) ( not ( = ?auto_106012 ?auto_106011 ) ) ( not ( = ?auto_106012 ?auto_106014 ) ) ( ON ?auto_106013 ?auto_106012 ) ( CLEAR ?auto_106014 ) ( ON ?auto_106011 ?auto_106013 ) ( CLEAR ?auto_106011 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_106009 ?auto_106010 ?auto_106015 ?auto_106012 ?auto_106013 )
      ( MAKE-2PILE ?auto_106009 ?auto_106010 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_106016 - BLOCK
      ?auto_106017 - BLOCK
    )
    :vars
    (
      ?auto_106021 - BLOCK
      ?auto_106020 - BLOCK
      ?auto_106022 - BLOCK
      ?auto_106018 - BLOCK
      ?auto_106019 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106021 ?auto_106017 ) ( ON-TABLE ?auto_106016 ) ( ON ?auto_106017 ?auto_106016 ) ( not ( = ?auto_106016 ?auto_106017 ) ) ( not ( = ?auto_106016 ?auto_106021 ) ) ( not ( = ?auto_106017 ?auto_106021 ) ) ( not ( = ?auto_106016 ?auto_106020 ) ) ( not ( = ?auto_106016 ?auto_106022 ) ) ( not ( = ?auto_106017 ?auto_106020 ) ) ( not ( = ?auto_106017 ?auto_106022 ) ) ( not ( = ?auto_106021 ?auto_106020 ) ) ( not ( = ?auto_106021 ?auto_106022 ) ) ( not ( = ?auto_106020 ?auto_106022 ) ) ( ON ?auto_106020 ?auto_106021 ) ( not ( = ?auto_106018 ?auto_106019 ) ) ( not ( = ?auto_106018 ?auto_106022 ) ) ( not ( = ?auto_106019 ?auto_106022 ) ) ( not ( = ?auto_106016 ?auto_106019 ) ) ( not ( = ?auto_106016 ?auto_106018 ) ) ( not ( = ?auto_106017 ?auto_106019 ) ) ( not ( = ?auto_106017 ?auto_106018 ) ) ( not ( = ?auto_106021 ?auto_106019 ) ) ( not ( = ?auto_106021 ?auto_106018 ) ) ( not ( = ?auto_106020 ?auto_106019 ) ) ( not ( = ?auto_106020 ?auto_106018 ) ) ( ON ?auto_106022 ?auto_106020 ) ( ON ?auto_106019 ?auto_106022 ) ( CLEAR ?auto_106019 ) ( HOLDING ?auto_106018 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_106018 )
      ( MAKE-2PILE ?auto_106016 ?auto_106017 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_106032 - BLOCK
      ?auto_106033 - BLOCK
    )
    :vars
    (
      ?auto_106037 - BLOCK
      ?auto_106036 - BLOCK
      ?auto_106038 - BLOCK
      ?auto_106035 - BLOCK
      ?auto_106034 - BLOCK
      ?auto_106039 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106037 ?auto_106033 ) ( ON-TABLE ?auto_106032 ) ( ON ?auto_106033 ?auto_106032 ) ( not ( = ?auto_106032 ?auto_106033 ) ) ( not ( = ?auto_106032 ?auto_106037 ) ) ( not ( = ?auto_106033 ?auto_106037 ) ) ( not ( = ?auto_106032 ?auto_106036 ) ) ( not ( = ?auto_106032 ?auto_106038 ) ) ( not ( = ?auto_106033 ?auto_106036 ) ) ( not ( = ?auto_106033 ?auto_106038 ) ) ( not ( = ?auto_106037 ?auto_106036 ) ) ( not ( = ?auto_106037 ?auto_106038 ) ) ( not ( = ?auto_106036 ?auto_106038 ) ) ( ON ?auto_106036 ?auto_106037 ) ( not ( = ?auto_106035 ?auto_106034 ) ) ( not ( = ?auto_106035 ?auto_106038 ) ) ( not ( = ?auto_106034 ?auto_106038 ) ) ( not ( = ?auto_106032 ?auto_106034 ) ) ( not ( = ?auto_106032 ?auto_106035 ) ) ( not ( = ?auto_106033 ?auto_106034 ) ) ( not ( = ?auto_106033 ?auto_106035 ) ) ( not ( = ?auto_106037 ?auto_106034 ) ) ( not ( = ?auto_106037 ?auto_106035 ) ) ( not ( = ?auto_106036 ?auto_106034 ) ) ( not ( = ?auto_106036 ?auto_106035 ) ) ( ON ?auto_106038 ?auto_106036 ) ( ON ?auto_106034 ?auto_106038 ) ( CLEAR ?auto_106034 ) ( ON ?auto_106035 ?auto_106039 ) ( CLEAR ?auto_106035 ) ( HAND-EMPTY ) ( not ( = ?auto_106032 ?auto_106039 ) ) ( not ( = ?auto_106033 ?auto_106039 ) ) ( not ( = ?auto_106037 ?auto_106039 ) ) ( not ( = ?auto_106036 ?auto_106039 ) ) ( not ( = ?auto_106038 ?auto_106039 ) ) ( not ( = ?auto_106035 ?auto_106039 ) ) ( not ( = ?auto_106034 ?auto_106039 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_106035 ?auto_106039 )
      ( MAKE-2PILE ?auto_106032 ?auto_106033 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_106040 - BLOCK
      ?auto_106041 - BLOCK
    )
    :vars
    (
      ?auto_106047 - BLOCK
      ?auto_106043 - BLOCK
      ?auto_106042 - BLOCK
      ?auto_106044 - BLOCK
      ?auto_106045 - BLOCK
      ?auto_106046 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106047 ?auto_106041 ) ( ON-TABLE ?auto_106040 ) ( ON ?auto_106041 ?auto_106040 ) ( not ( = ?auto_106040 ?auto_106041 ) ) ( not ( = ?auto_106040 ?auto_106047 ) ) ( not ( = ?auto_106041 ?auto_106047 ) ) ( not ( = ?auto_106040 ?auto_106043 ) ) ( not ( = ?auto_106040 ?auto_106042 ) ) ( not ( = ?auto_106041 ?auto_106043 ) ) ( not ( = ?auto_106041 ?auto_106042 ) ) ( not ( = ?auto_106047 ?auto_106043 ) ) ( not ( = ?auto_106047 ?auto_106042 ) ) ( not ( = ?auto_106043 ?auto_106042 ) ) ( ON ?auto_106043 ?auto_106047 ) ( not ( = ?auto_106044 ?auto_106045 ) ) ( not ( = ?auto_106044 ?auto_106042 ) ) ( not ( = ?auto_106045 ?auto_106042 ) ) ( not ( = ?auto_106040 ?auto_106045 ) ) ( not ( = ?auto_106040 ?auto_106044 ) ) ( not ( = ?auto_106041 ?auto_106045 ) ) ( not ( = ?auto_106041 ?auto_106044 ) ) ( not ( = ?auto_106047 ?auto_106045 ) ) ( not ( = ?auto_106047 ?auto_106044 ) ) ( not ( = ?auto_106043 ?auto_106045 ) ) ( not ( = ?auto_106043 ?auto_106044 ) ) ( ON ?auto_106042 ?auto_106043 ) ( ON ?auto_106044 ?auto_106046 ) ( CLEAR ?auto_106044 ) ( not ( = ?auto_106040 ?auto_106046 ) ) ( not ( = ?auto_106041 ?auto_106046 ) ) ( not ( = ?auto_106047 ?auto_106046 ) ) ( not ( = ?auto_106043 ?auto_106046 ) ) ( not ( = ?auto_106042 ?auto_106046 ) ) ( not ( = ?auto_106044 ?auto_106046 ) ) ( not ( = ?auto_106045 ?auto_106046 ) ) ( HOLDING ?auto_106045 ) ( CLEAR ?auto_106042 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_106040 ?auto_106041 ?auto_106047 ?auto_106043 ?auto_106042 ?auto_106045 )
      ( MAKE-2PILE ?auto_106040 ?auto_106041 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_106048 - BLOCK
      ?auto_106049 - BLOCK
    )
    :vars
    (
      ?auto_106054 - BLOCK
      ?auto_106052 - BLOCK
      ?auto_106053 - BLOCK
      ?auto_106050 - BLOCK
      ?auto_106055 - BLOCK
      ?auto_106051 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106054 ?auto_106049 ) ( ON-TABLE ?auto_106048 ) ( ON ?auto_106049 ?auto_106048 ) ( not ( = ?auto_106048 ?auto_106049 ) ) ( not ( = ?auto_106048 ?auto_106054 ) ) ( not ( = ?auto_106049 ?auto_106054 ) ) ( not ( = ?auto_106048 ?auto_106052 ) ) ( not ( = ?auto_106048 ?auto_106053 ) ) ( not ( = ?auto_106049 ?auto_106052 ) ) ( not ( = ?auto_106049 ?auto_106053 ) ) ( not ( = ?auto_106054 ?auto_106052 ) ) ( not ( = ?auto_106054 ?auto_106053 ) ) ( not ( = ?auto_106052 ?auto_106053 ) ) ( ON ?auto_106052 ?auto_106054 ) ( not ( = ?auto_106050 ?auto_106055 ) ) ( not ( = ?auto_106050 ?auto_106053 ) ) ( not ( = ?auto_106055 ?auto_106053 ) ) ( not ( = ?auto_106048 ?auto_106055 ) ) ( not ( = ?auto_106048 ?auto_106050 ) ) ( not ( = ?auto_106049 ?auto_106055 ) ) ( not ( = ?auto_106049 ?auto_106050 ) ) ( not ( = ?auto_106054 ?auto_106055 ) ) ( not ( = ?auto_106054 ?auto_106050 ) ) ( not ( = ?auto_106052 ?auto_106055 ) ) ( not ( = ?auto_106052 ?auto_106050 ) ) ( ON ?auto_106053 ?auto_106052 ) ( ON ?auto_106050 ?auto_106051 ) ( not ( = ?auto_106048 ?auto_106051 ) ) ( not ( = ?auto_106049 ?auto_106051 ) ) ( not ( = ?auto_106054 ?auto_106051 ) ) ( not ( = ?auto_106052 ?auto_106051 ) ) ( not ( = ?auto_106053 ?auto_106051 ) ) ( not ( = ?auto_106050 ?auto_106051 ) ) ( not ( = ?auto_106055 ?auto_106051 ) ) ( CLEAR ?auto_106053 ) ( ON ?auto_106055 ?auto_106050 ) ( CLEAR ?auto_106055 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_106051 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_106051 ?auto_106050 )
      ( MAKE-2PILE ?auto_106048 ?auto_106049 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_106056 - BLOCK
      ?auto_106057 - BLOCK
    )
    :vars
    (
      ?auto_106060 - BLOCK
      ?auto_106063 - BLOCK
      ?auto_106059 - BLOCK
      ?auto_106061 - BLOCK
      ?auto_106058 - BLOCK
      ?auto_106062 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106060 ?auto_106057 ) ( ON-TABLE ?auto_106056 ) ( ON ?auto_106057 ?auto_106056 ) ( not ( = ?auto_106056 ?auto_106057 ) ) ( not ( = ?auto_106056 ?auto_106060 ) ) ( not ( = ?auto_106057 ?auto_106060 ) ) ( not ( = ?auto_106056 ?auto_106063 ) ) ( not ( = ?auto_106056 ?auto_106059 ) ) ( not ( = ?auto_106057 ?auto_106063 ) ) ( not ( = ?auto_106057 ?auto_106059 ) ) ( not ( = ?auto_106060 ?auto_106063 ) ) ( not ( = ?auto_106060 ?auto_106059 ) ) ( not ( = ?auto_106063 ?auto_106059 ) ) ( ON ?auto_106063 ?auto_106060 ) ( not ( = ?auto_106061 ?auto_106058 ) ) ( not ( = ?auto_106061 ?auto_106059 ) ) ( not ( = ?auto_106058 ?auto_106059 ) ) ( not ( = ?auto_106056 ?auto_106058 ) ) ( not ( = ?auto_106056 ?auto_106061 ) ) ( not ( = ?auto_106057 ?auto_106058 ) ) ( not ( = ?auto_106057 ?auto_106061 ) ) ( not ( = ?auto_106060 ?auto_106058 ) ) ( not ( = ?auto_106060 ?auto_106061 ) ) ( not ( = ?auto_106063 ?auto_106058 ) ) ( not ( = ?auto_106063 ?auto_106061 ) ) ( ON ?auto_106061 ?auto_106062 ) ( not ( = ?auto_106056 ?auto_106062 ) ) ( not ( = ?auto_106057 ?auto_106062 ) ) ( not ( = ?auto_106060 ?auto_106062 ) ) ( not ( = ?auto_106063 ?auto_106062 ) ) ( not ( = ?auto_106059 ?auto_106062 ) ) ( not ( = ?auto_106061 ?auto_106062 ) ) ( not ( = ?auto_106058 ?auto_106062 ) ) ( ON ?auto_106058 ?auto_106061 ) ( CLEAR ?auto_106058 ) ( ON-TABLE ?auto_106062 ) ( HOLDING ?auto_106059 ) ( CLEAR ?auto_106063 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_106056 ?auto_106057 ?auto_106060 ?auto_106063 ?auto_106059 )
      ( MAKE-2PILE ?auto_106056 ?auto_106057 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_106107 - BLOCK
      ?auto_106108 - BLOCK
      ?auto_106109 - BLOCK
      ?auto_106110 - BLOCK
      ?auto_106111 - BLOCK
    )
    :vars
    (
      ?auto_106112 - BLOCK
      ?auto_106113 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_106107 ) ( ON ?auto_106108 ?auto_106107 ) ( ON ?auto_106109 ?auto_106108 ) ( not ( = ?auto_106107 ?auto_106108 ) ) ( not ( = ?auto_106107 ?auto_106109 ) ) ( not ( = ?auto_106107 ?auto_106110 ) ) ( not ( = ?auto_106107 ?auto_106111 ) ) ( not ( = ?auto_106108 ?auto_106109 ) ) ( not ( = ?auto_106108 ?auto_106110 ) ) ( not ( = ?auto_106108 ?auto_106111 ) ) ( not ( = ?auto_106109 ?auto_106110 ) ) ( not ( = ?auto_106109 ?auto_106111 ) ) ( not ( = ?auto_106110 ?auto_106111 ) ) ( ON ?auto_106111 ?auto_106112 ) ( not ( = ?auto_106107 ?auto_106112 ) ) ( not ( = ?auto_106108 ?auto_106112 ) ) ( not ( = ?auto_106109 ?auto_106112 ) ) ( not ( = ?auto_106110 ?auto_106112 ) ) ( not ( = ?auto_106111 ?auto_106112 ) ) ( CLEAR ?auto_106109 ) ( ON ?auto_106110 ?auto_106111 ) ( CLEAR ?auto_106110 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_106113 ) ( ON ?auto_106112 ?auto_106113 ) ( not ( = ?auto_106113 ?auto_106112 ) ) ( not ( = ?auto_106113 ?auto_106111 ) ) ( not ( = ?auto_106113 ?auto_106110 ) ) ( not ( = ?auto_106107 ?auto_106113 ) ) ( not ( = ?auto_106108 ?auto_106113 ) ) ( not ( = ?auto_106109 ?auto_106113 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_106113 ?auto_106112 ?auto_106111 )
      ( MAKE-5PILE ?auto_106107 ?auto_106108 ?auto_106109 ?auto_106110 ?auto_106111 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_106114 - BLOCK
      ?auto_106115 - BLOCK
      ?auto_106116 - BLOCK
      ?auto_106117 - BLOCK
      ?auto_106118 - BLOCK
    )
    :vars
    (
      ?auto_106120 - BLOCK
      ?auto_106119 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_106114 ) ( ON ?auto_106115 ?auto_106114 ) ( not ( = ?auto_106114 ?auto_106115 ) ) ( not ( = ?auto_106114 ?auto_106116 ) ) ( not ( = ?auto_106114 ?auto_106117 ) ) ( not ( = ?auto_106114 ?auto_106118 ) ) ( not ( = ?auto_106115 ?auto_106116 ) ) ( not ( = ?auto_106115 ?auto_106117 ) ) ( not ( = ?auto_106115 ?auto_106118 ) ) ( not ( = ?auto_106116 ?auto_106117 ) ) ( not ( = ?auto_106116 ?auto_106118 ) ) ( not ( = ?auto_106117 ?auto_106118 ) ) ( ON ?auto_106118 ?auto_106120 ) ( not ( = ?auto_106114 ?auto_106120 ) ) ( not ( = ?auto_106115 ?auto_106120 ) ) ( not ( = ?auto_106116 ?auto_106120 ) ) ( not ( = ?auto_106117 ?auto_106120 ) ) ( not ( = ?auto_106118 ?auto_106120 ) ) ( ON ?auto_106117 ?auto_106118 ) ( CLEAR ?auto_106117 ) ( ON-TABLE ?auto_106119 ) ( ON ?auto_106120 ?auto_106119 ) ( not ( = ?auto_106119 ?auto_106120 ) ) ( not ( = ?auto_106119 ?auto_106118 ) ) ( not ( = ?auto_106119 ?auto_106117 ) ) ( not ( = ?auto_106114 ?auto_106119 ) ) ( not ( = ?auto_106115 ?auto_106119 ) ) ( not ( = ?auto_106116 ?auto_106119 ) ) ( HOLDING ?auto_106116 ) ( CLEAR ?auto_106115 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_106114 ?auto_106115 ?auto_106116 )
      ( MAKE-5PILE ?auto_106114 ?auto_106115 ?auto_106116 ?auto_106117 ?auto_106118 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_106121 - BLOCK
      ?auto_106122 - BLOCK
      ?auto_106123 - BLOCK
      ?auto_106124 - BLOCK
      ?auto_106125 - BLOCK
    )
    :vars
    (
      ?auto_106126 - BLOCK
      ?auto_106127 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_106121 ) ( ON ?auto_106122 ?auto_106121 ) ( not ( = ?auto_106121 ?auto_106122 ) ) ( not ( = ?auto_106121 ?auto_106123 ) ) ( not ( = ?auto_106121 ?auto_106124 ) ) ( not ( = ?auto_106121 ?auto_106125 ) ) ( not ( = ?auto_106122 ?auto_106123 ) ) ( not ( = ?auto_106122 ?auto_106124 ) ) ( not ( = ?auto_106122 ?auto_106125 ) ) ( not ( = ?auto_106123 ?auto_106124 ) ) ( not ( = ?auto_106123 ?auto_106125 ) ) ( not ( = ?auto_106124 ?auto_106125 ) ) ( ON ?auto_106125 ?auto_106126 ) ( not ( = ?auto_106121 ?auto_106126 ) ) ( not ( = ?auto_106122 ?auto_106126 ) ) ( not ( = ?auto_106123 ?auto_106126 ) ) ( not ( = ?auto_106124 ?auto_106126 ) ) ( not ( = ?auto_106125 ?auto_106126 ) ) ( ON ?auto_106124 ?auto_106125 ) ( ON-TABLE ?auto_106127 ) ( ON ?auto_106126 ?auto_106127 ) ( not ( = ?auto_106127 ?auto_106126 ) ) ( not ( = ?auto_106127 ?auto_106125 ) ) ( not ( = ?auto_106127 ?auto_106124 ) ) ( not ( = ?auto_106121 ?auto_106127 ) ) ( not ( = ?auto_106122 ?auto_106127 ) ) ( not ( = ?auto_106123 ?auto_106127 ) ) ( CLEAR ?auto_106122 ) ( ON ?auto_106123 ?auto_106124 ) ( CLEAR ?auto_106123 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_106127 ?auto_106126 ?auto_106125 ?auto_106124 )
      ( MAKE-5PILE ?auto_106121 ?auto_106122 ?auto_106123 ?auto_106124 ?auto_106125 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_106128 - BLOCK
      ?auto_106129 - BLOCK
      ?auto_106130 - BLOCK
      ?auto_106131 - BLOCK
      ?auto_106132 - BLOCK
    )
    :vars
    (
      ?auto_106133 - BLOCK
      ?auto_106134 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_106128 ) ( not ( = ?auto_106128 ?auto_106129 ) ) ( not ( = ?auto_106128 ?auto_106130 ) ) ( not ( = ?auto_106128 ?auto_106131 ) ) ( not ( = ?auto_106128 ?auto_106132 ) ) ( not ( = ?auto_106129 ?auto_106130 ) ) ( not ( = ?auto_106129 ?auto_106131 ) ) ( not ( = ?auto_106129 ?auto_106132 ) ) ( not ( = ?auto_106130 ?auto_106131 ) ) ( not ( = ?auto_106130 ?auto_106132 ) ) ( not ( = ?auto_106131 ?auto_106132 ) ) ( ON ?auto_106132 ?auto_106133 ) ( not ( = ?auto_106128 ?auto_106133 ) ) ( not ( = ?auto_106129 ?auto_106133 ) ) ( not ( = ?auto_106130 ?auto_106133 ) ) ( not ( = ?auto_106131 ?auto_106133 ) ) ( not ( = ?auto_106132 ?auto_106133 ) ) ( ON ?auto_106131 ?auto_106132 ) ( ON-TABLE ?auto_106134 ) ( ON ?auto_106133 ?auto_106134 ) ( not ( = ?auto_106134 ?auto_106133 ) ) ( not ( = ?auto_106134 ?auto_106132 ) ) ( not ( = ?auto_106134 ?auto_106131 ) ) ( not ( = ?auto_106128 ?auto_106134 ) ) ( not ( = ?auto_106129 ?auto_106134 ) ) ( not ( = ?auto_106130 ?auto_106134 ) ) ( ON ?auto_106130 ?auto_106131 ) ( CLEAR ?auto_106130 ) ( HOLDING ?auto_106129 ) ( CLEAR ?auto_106128 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_106128 ?auto_106129 )
      ( MAKE-5PILE ?auto_106128 ?auto_106129 ?auto_106130 ?auto_106131 ?auto_106132 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_106135 - BLOCK
      ?auto_106136 - BLOCK
      ?auto_106137 - BLOCK
      ?auto_106138 - BLOCK
      ?auto_106139 - BLOCK
    )
    :vars
    (
      ?auto_106140 - BLOCK
      ?auto_106141 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_106135 ) ( not ( = ?auto_106135 ?auto_106136 ) ) ( not ( = ?auto_106135 ?auto_106137 ) ) ( not ( = ?auto_106135 ?auto_106138 ) ) ( not ( = ?auto_106135 ?auto_106139 ) ) ( not ( = ?auto_106136 ?auto_106137 ) ) ( not ( = ?auto_106136 ?auto_106138 ) ) ( not ( = ?auto_106136 ?auto_106139 ) ) ( not ( = ?auto_106137 ?auto_106138 ) ) ( not ( = ?auto_106137 ?auto_106139 ) ) ( not ( = ?auto_106138 ?auto_106139 ) ) ( ON ?auto_106139 ?auto_106140 ) ( not ( = ?auto_106135 ?auto_106140 ) ) ( not ( = ?auto_106136 ?auto_106140 ) ) ( not ( = ?auto_106137 ?auto_106140 ) ) ( not ( = ?auto_106138 ?auto_106140 ) ) ( not ( = ?auto_106139 ?auto_106140 ) ) ( ON ?auto_106138 ?auto_106139 ) ( ON-TABLE ?auto_106141 ) ( ON ?auto_106140 ?auto_106141 ) ( not ( = ?auto_106141 ?auto_106140 ) ) ( not ( = ?auto_106141 ?auto_106139 ) ) ( not ( = ?auto_106141 ?auto_106138 ) ) ( not ( = ?auto_106135 ?auto_106141 ) ) ( not ( = ?auto_106136 ?auto_106141 ) ) ( not ( = ?auto_106137 ?auto_106141 ) ) ( ON ?auto_106137 ?auto_106138 ) ( CLEAR ?auto_106135 ) ( ON ?auto_106136 ?auto_106137 ) ( CLEAR ?auto_106136 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_106141 ?auto_106140 ?auto_106139 ?auto_106138 ?auto_106137 )
      ( MAKE-5PILE ?auto_106135 ?auto_106136 ?auto_106137 ?auto_106138 ?auto_106139 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_106142 - BLOCK
      ?auto_106143 - BLOCK
      ?auto_106144 - BLOCK
      ?auto_106145 - BLOCK
      ?auto_106146 - BLOCK
    )
    :vars
    (
      ?auto_106148 - BLOCK
      ?auto_106147 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106142 ?auto_106143 ) ) ( not ( = ?auto_106142 ?auto_106144 ) ) ( not ( = ?auto_106142 ?auto_106145 ) ) ( not ( = ?auto_106142 ?auto_106146 ) ) ( not ( = ?auto_106143 ?auto_106144 ) ) ( not ( = ?auto_106143 ?auto_106145 ) ) ( not ( = ?auto_106143 ?auto_106146 ) ) ( not ( = ?auto_106144 ?auto_106145 ) ) ( not ( = ?auto_106144 ?auto_106146 ) ) ( not ( = ?auto_106145 ?auto_106146 ) ) ( ON ?auto_106146 ?auto_106148 ) ( not ( = ?auto_106142 ?auto_106148 ) ) ( not ( = ?auto_106143 ?auto_106148 ) ) ( not ( = ?auto_106144 ?auto_106148 ) ) ( not ( = ?auto_106145 ?auto_106148 ) ) ( not ( = ?auto_106146 ?auto_106148 ) ) ( ON ?auto_106145 ?auto_106146 ) ( ON-TABLE ?auto_106147 ) ( ON ?auto_106148 ?auto_106147 ) ( not ( = ?auto_106147 ?auto_106148 ) ) ( not ( = ?auto_106147 ?auto_106146 ) ) ( not ( = ?auto_106147 ?auto_106145 ) ) ( not ( = ?auto_106142 ?auto_106147 ) ) ( not ( = ?auto_106143 ?auto_106147 ) ) ( not ( = ?auto_106144 ?auto_106147 ) ) ( ON ?auto_106144 ?auto_106145 ) ( ON ?auto_106143 ?auto_106144 ) ( CLEAR ?auto_106143 ) ( HOLDING ?auto_106142 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_106142 )
      ( MAKE-5PILE ?auto_106142 ?auto_106143 ?auto_106144 ?auto_106145 ?auto_106146 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_106149 - BLOCK
      ?auto_106150 - BLOCK
      ?auto_106151 - BLOCK
      ?auto_106152 - BLOCK
      ?auto_106153 - BLOCK
    )
    :vars
    (
      ?auto_106154 - BLOCK
      ?auto_106155 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106149 ?auto_106150 ) ) ( not ( = ?auto_106149 ?auto_106151 ) ) ( not ( = ?auto_106149 ?auto_106152 ) ) ( not ( = ?auto_106149 ?auto_106153 ) ) ( not ( = ?auto_106150 ?auto_106151 ) ) ( not ( = ?auto_106150 ?auto_106152 ) ) ( not ( = ?auto_106150 ?auto_106153 ) ) ( not ( = ?auto_106151 ?auto_106152 ) ) ( not ( = ?auto_106151 ?auto_106153 ) ) ( not ( = ?auto_106152 ?auto_106153 ) ) ( ON ?auto_106153 ?auto_106154 ) ( not ( = ?auto_106149 ?auto_106154 ) ) ( not ( = ?auto_106150 ?auto_106154 ) ) ( not ( = ?auto_106151 ?auto_106154 ) ) ( not ( = ?auto_106152 ?auto_106154 ) ) ( not ( = ?auto_106153 ?auto_106154 ) ) ( ON ?auto_106152 ?auto_106153 ) ( ON-TABLE ?auto_106155 ) ( ON ?auto_106154 ?auto_106155 ) ( not ( = ?auto_106155 ?auto_106154 ) ) ( not ( = ?auto_106155 ?auto_106153 ) ) ( not ( = ?auto_106155 ?auto_106152 ) ) ( not ( = ?auto_106149 ?auto_106155 ) ) ( not ( = ?auto_106150 ?auto_106155 ) ) ( not ( = ?auto_106151 ?auto_106155 ) ) ( ON ?auto_106151 ?auto_106152 ) ( ON ?auto_106150 ?auto_106151 ) ( ON ?auto_106149 ?auto_106150 ) ( CLEAR ?auto_106149 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_106155 ?auto_106154 ?auto_106153 ?auto_106152 ?auto_106151 ?auto_106150 )
      ( MAKE-5PILE ?auto_106149 ?auto_106150 ?auto_106151 ?auto_106152 ?auto_106153 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_106161 - BLOCK
      ?auto_106162 - BLOCK
      ?auto_106163 - BLOCK
      ?auto_106164 - BLOCK
      ?auto_106165 - BLOCK
    )
    :vars
    (
      ?auto_106166 - BLOCK
      ?auto_106167 - BLOCK
      ?auto_106168 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106161 ?auto_106162 ) ) ( not ( = ?auto_106161 ?auto_106163 ) ) ( not ( = ?auto_106161 ?auto_106164 ) ) ( not ( = ?auto_106161 ?auto_106165 ) ) ( not ( = ?auto_106162 ?auto_106163 ) ) ( not ( = ?auto_106162 ?auto_106164 ) ) ( not ( = ?auto_106162 ?auto_106165 ) ) ( not ( = ?auto_106163 ?auto_106164 ) ) ( not ( = ?auto_106163 ?auto_106165 ) ) ( not ( = ?auto_106164 ?auto_106165 ) ) ( ON ?auto_106165 ?auto_106166 ) ( not ( = ?auto_106161 ?auto_106166 ) ) ( not ( = ?auto_106162 ?auto_106166 ) ) ( not ( = ?auto_106163 ?auto_106166 ) ) ( not ( = ?auto_106164 ?auto_106166 ) ) ( not ( = ?auto_106165 ?auto_106166 ) ) ( ON ?auto_106164 ?auto_106165 ) ( ON-TABLE ?auto_106167 ) ( ON ?auto_106166 ?auto_106167 ) ( not ( = ?auto_106167 ?auto_106166 ) ) ( not ( = ?auto_106167 ?auto_106165 ) ) ( not ( = ?auto_106167 ?auto_106164 ) ) ( not ( = ?auto_106161 ?auto_106167 ) ) ( not ( = ?auto_106162 ?auto_106167 ) ) ( not ( = ?auto_106163 ?auto_106167 ) ) ( ON ?auto_106163 ?auto_106164 ) ( ON ?auto_106162 ?auto_106163 ) ( CLEAR ?auto_106162 ) ( ON ?auto_106161 ?auto_106168 ) ( CLEAR ?auto_106161 ) ( HAND-EMPTY ) ( not ( = ?auto_106161 ?auto_106168 ) ) ( not ( = ?auto_106162 ?auto_106168 ) ) ( not ( = ?auto_106163 ?auto_106168 ) ) ( not ( = ?auto_106164 ?auto_106168 ) ) ( not ( = ?auto_106165 ?auto_106168 ) ) ( not ( = ?auto_106166 ?auto_106168 ) ) ( not ( = ?auto_106167 ?auto_106168 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_106161 ?auto_106168 )
      ( MAKE-5PILE ?auto_106161 ?auto_106162 ?auto_106163 ?auto_106164 ?auto_106165 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_106169 - BLOCK
      ?auto_106170 - BLOCK
      ?auto_106171 - BLOCK
      ?auto_106172 - BLOCK
      ?auto_106173 - BLOCK
    )
    :vars
    (
      ?auto_106176 - BLOCK
      ?auto_106175 - BLOCK
      ?auto_106174 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106169 ?auto_106170 ) ) ( not ( = ?auto_106169 ?auto_106171 ) ) ( not ( = ?auto_106169 ?auto_106172 ) ) ( not ( = ?auto_106169 ?auto_106173 ) ) ( not ( = ?auto_106170 ?auto_106171 ) ) ( not ( = ?auto_106170 ?auto_106172 ) ) ( not ( = ?auto_106170 ?auto_106173 ) ) ( not ( = ?auto_106171 ?auto_106172 ) ) ( not ( = ?auto_106171 ?auto_106173 ) ) ( not ( = ?auto_106172 ?auto_106173 ) ) ( ON ?auto_106173 ?auto_106176 ) ( not ( = ?auto_106169 ?auto_106176 ) ) ( not ( = ?auto_106170 ?auto_106176 ) ) ( not ( = ?auto_106171 ?auto_106176 ) ) ( not ( = ?auto_106172 ?auto_106176 ) ) ( not ( = ?auto_106173 ?auto_106176 ) ) ( ON ?auto_106172 ?auto_106173 ) ( ON-TABLE ?auto_106175 ) ( ON ?auto_106176 ?auto_106175 ) ( not ( = ?auto_106175 ?auto_106176 ) ) ( not ( = ?auto_106175 ?auto_106173 ) ) ( not ( = ?auto_106175 ?auto_106172 ) ) ( not ( = ?auto_106169 ?auto_106175 ) ) ( not ( = ?auto_106170 ?auto_106175 ) ) ( not ( = ?auto_106171 ?auto_106175 ) ) ( ON ?auto_106171 ?auto_106172 ) ( ON ?auto_106169 ?auto_106174 ) ( CLEAR ?auto_106169 ) ( not ( = ?auto_106169 ?auto_106174 ) ) ( not ( = ?auto_106170 ?auto_106174 ) ) ( not ( = ?auto_106171 ?auto_106174 ) ) ( not ( = ?auto_106172 ?auto_106174 ) ) ( not ( = ?auto_106173 ?auto_106174 ) ) ( not ( = ?auto_106176 ?auto_106174 ) ) ( not ( = ?auto_106175 ?auto_106174 ) ) ( HOLDING ?auto_106170 ) ( CLEAR ?auto_106171 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_106175 ?auto_106176 ?auto_106173 ?auto_106172 ?auto_106171 ?auto_106170 )
      ( MAKE-5PILE ?auto_106169 ?auto_106170 ?auto_106171 ?auto_106172 ?auto_106173 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_106177 - BLOCK
      ?auto_106178 - BLOCK
      ?auto_106179 - BLOCK
      ?auto_106180 - BLOCK
      ?auto_106181 - BLOCK
    )
    :vars
    (
      ?auto_106184 - BLOCK
      ?auto_106182 - BLOCK
      ?auto_106183 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106177 ?auto_106178 ) ) ( not ( = ?auto_106177 ?auto_106179 ) ) ( not ( = ?auto_106177 ?auto_106180 ) ) ( not ( = ?auto_106177 ?auto_106181 ) ) ( not ( = ?auto_106178 ?auto_106179 ) ) ( not ( = ?auto_106178 ?auto_106180 ) ) ( not ( = ?auto_106178 ?auto_106181 ) ) ( not ( = ?auto_106179 ?auto_106180 ) ) ( not ( = ?auto_106179 ?auto_106181 ) ) ( not ( = ?auto_106180 ?auto_106181 ) ) ( ON ?auto_106181 ?auto_106184 ) ( not ( = ?auto_106177 ?auto_106184 ) ) ( not ( = ?auto_106178 ?auto_106184 ) ) ( not ( = ?auto_106179 ?auto_106184 ) ) ( not ( = ?auto_106180 ?auto_106184 ) ) ( not ( = ?auto_106181 ?auto_106184 ) ) ( ON ?auto_106180 ?auto_106181 ) ( ON-TABLE ?auto_106182 ) ( ON ?auto_106184 ?auto_106182 ) ( not ( = ?auto_106182 ?auto_106184 ) ) ( not ( = ?auto_106182 ?auto_106181 ) ) ( not ( = ?auto_106182 ?auto_106180 ) ) ( not ( = ?auto_106177 ?auto_106182 ) ) ( not ( = ?auto_106178 ?auto_106182 ) ) ( not ( = ?auto_106179 ?auto_106182 ) ) ( ON ?auto_106179 ?auto_106180 ) ( ON ?auto_106177 ?auto_106183 ) ( not ( = ?auto_106177 ?auto_106183 ) ) ( not ( = ?auto_106178 ?auto_106183 ) ) ( not ( = ?auto_106179 ?auto_106183 ) ) ( not ( = ?auto_106180 ?auto_106183 ) ) ( not ( = ?auto_106181 ?auto_106183 ) ) ( not ( = ?auto_106184 ?auto_106183 ) ) ( not ( = ?auto_106182 ?auto_106183 ) ) ( CLEAR ?auto_106179 ) ( ON ?auto_106178 ?auto_106177 ) ( CLEAR ?auto_106178 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_106183 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_106183 ?auto_106177 )
      ( MAKE-5PILE ?auto_106177 ?auto_106178 ?auto_106179 ?auto_106180 ?auto_106181 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_106185 - BLOCK
      ?auto_106186 - BLOCK
      ?auto_106187 - BLOCK
      ?auto_106188 - BLOCK
      ?auto_106189 - BLOCK
    )
    :vars
    (
      ?auto_106190 - BLOCK
      ?auto_106191 - BLOCK
      ?auto_106192 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106185 ?auto_106186 ) ) ( not ( = ?auto_106185 ?auto_106187 ) ) ( not ( = ?auto_106185 ?auto_106188 ) ) ( not ( = ?auto_106185 ?auto_106189 ) ) ( not ( = ?auto_106186 ?auto_106187 ) ) ( not ( = ?auto_106186 ?auto_106188 ) ) ( not ( = ?auto_106186 ?auto_106189 ) ) ( not ( = ?auto_106187 ?auto_106188 ) ) ( not ( = ?auto_106187 ?auto_106189 ) ) ( not ( = ?auto_106188 ?auto_106189 ) ) ( ON ?auto_106189 ?auto_106190 ) ( not ( = ?auto_106185 ?auto_106190 ) ) ( not ( = ?auto_106186 ?auto_106190 ) ) ( not ( = ?auto_106187 ?auto_106190 ) ) ( not ( = ?auto_106188 ?auto_106190 ) ) ( not ( = ?auto_106189 ?auto_106190 ) ) ( ON ?auto_106188 ?auto_106189 ) ( ON-TABLE ?auto_106191 ) ( ON ?auto_106190 ?auto_106191 ) ( not ( = ?auto_106191 ?auto_106190 ) ) ( not ( = ?auto_106191 ?auto_106189 ) ) ( not ( = ?auto_106191 ?auto_106188 ) ) ( not ( = ?auto_106185 ?auto_106191 ) ) ( not ( = ?auto_106186 ?auto_106191 ) ) ( not ( = ?auto_106187 ?auto_106191 ) ) ( ON ?auto_106185 ?auto_106192 ) ( not ( = ?auto_106185 ?auto_106192 ) ) ( not ( = ?auto_106186 ?auto_106192 ) ) ( not ( = ?auto_106187 ?auto_106192 ) ) ( not ( = ?auto_106188 ?auto_106192 ) ) ( not ( = ?auto_106189 ?auto_106192 ) ) ( not ( = ?auto_106190 ?auto_106192 ) ) ( not ( = ?auto_106191 ?auto_106192 ) ) ( ON ?auto_106186 ?auto_106185 ) ( CLEAR ?auto_106186 ) ( ON-TABLE ?auto_106192 ) ( HOLDING ?auto_106187 ) ( CLEAR ?auto_106188 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_106191 ?auto_106190 ?auto_106189 ?auto_106188 ?auto_106187 )
      ( MAKE-5PILE ?auto_106185 ?auto_106186 ?auto_106187 ?auto_106188 ?auto_106189 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_106193 - BLOCK
      ?auto_106194 - BLOCK
      ?auto_106195 - BLOCK
      ?auto_106196 - BLOCK
      ?auto_106197 - BLOCK
    )
    :vars
    (
      ?auto_106198 - BLOCK
      ?auto_106200 - BLOCK
      ?auto_106199 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106193 ?auto_106194 ) ) ( not ( = ?auto_106193 ?auto_106195 ) ) ( not ( = ?auto_106193 ?auto_106196 ) ) ( not ( = ?auto_106193 ?auto_106197 ) ) ( not ( = ?auto_106194 ?auto_106195 ) ) ( not ( = ?auto_106194 ?auto_106196 ) ) ( not ( = ?auto_106194 ?auto_106197 ) ) ( not ( = ?auto_106195 ?auto_106196 ) ) ( not ( = ?auto_106195 ?auto_106197 ) ) ( not ( = ?auto_106196 ?auto_106197 ) ) ( ON ?auto_106197 ?auto_106198 ) ( not ( = ?auto_106193 ?auto_106198 ) ) ( not ( = ?auto_106194 ?auto_106198 ) ) ( not ( = ?auto_106195 ?auto_106198 ) ) ( not ( = ?auto_106196 ?auto_106198 ) ) ( not ( = ?auto_106197 ?auto_106198 ) ) ( ON ?auto_106196 ?auto_106197 ) ( ON-TABLE ?auto_106200 ) ( ON ?auto_106198 ?auto_106200 ) ( not ( = ?auto_106200 ?auto_106198 ) ) ( not ( = ?auto_106200 ?auto_106197 ) ) ( not ( = ?auto_106200 ?auto_106196 ) ) ( not ( = ?auto_106193 ?auto_106200 ) ) ( not ( = ?auto_106194 ?auto_106200 ) ) ( not ( = ?auto_106195 ?auto_106200 ) ) ( ON ?auto_106193 ?auto_106199 ) ( not ( = ?auto_106193 ?auto_106199 ) ) ( not ( = ?auto_106194 ?auto_106199 ) ) ( not ( = ?auto_106195 ?auto_106199 ) ) ( not ( = ?auto_106196 ?auto_106199 ) ) ( not ( = ?auto_106197 ?auto_106199 ) ) ( not ( = ?auto_106198 ?auto_106199 ) ) ( not ( = ?auto_106200 ?auto_106199 ) ) ( ON ?auto_106194 ?auto_106193 ) ( ON-TABLE ?auto_106199 ) ( CLEAR ?auto_106196 ) ( ON ?auto_106195 ?auto_106194 ) ( CLEAR ?auto_106195 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_106199 ?auto_106193 ?auto_106194 )
      ( MAKE-5PILE ?auto_106193 ?auto_106194 ?auto_106195 ?auto_106196 ?auto_106197 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_106201 - BLOCK
      ?auto_106202 - BLOCK
      ?auto_106203 - BLOCK
      ?auto_106204 - BLOCK
      ?auto_106205 - BLOCK
    )
    :vars
    (
      ?auto_106207 - BLOCK
      ?auto_106206 - BLOCK
      ?auto_106208 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106201 ?auto_106202 ) ) ( not ( = ?auto_106201 ?auto_106203 ) ) ( not ( = ?auto_106201 ?auto_106204 ) ) ( not ( = ?auto_106201 ?auto_106205 ) ) ( not ( = ?auto_106202 ?auto_106203 ) ) ( not ( = ?auto_106202 ?auto_106204 ) ) ( not ( = ?auto_106202 ?auto_106205 ) ) ( not ( = ?auto_106203 ?auto_106204 ) ) ( not ( = ?auto_106203 ?auto_106205 ) ) ( not ( = ?auto_106204 ?auto_106205 ) ) ( ON ?auto_106205 ?auto_106207 ) ( not ( = ?auto_106201 ?auto_106207 ) ) ( not ( = ?auto_106202 ?auto_106207 ) ) ( not ( = ?auto_106203 ?auto_106207 ) ) ( not ( = ?auto_106204 ?auto_106207 ) ) ( not ( = ?auto_106205 ?auto_106207 ) ) ( ON-TABLE ?auto_106206 ) ( ON ?auto_106207 ?auto_106206 ) ( not ( = ?auto_106206 ?auto_106207 ) ) ( not ( = ?auto_106206 ?auto_106205 ) ) ( not ( = ?auto_106206 ?auto_106204 ) ) ( not ( = ?auto_106201 ?auto_106206 ) ) ( not ( = ?auto_106202 ?auto_106206 ) ) ( not ( = ?auto_106203 ?auto_106206 ) ) ( ON ?auto_106201 ?auto_106208 ) ( not ( = ?auto_106201 ?auto_106208 ) ) ( not ( = ?auto_106202 ?auto_106208 ) ) ( not ( = ?auto_106203 ?auto_106208 ) ) ( not ( = ?auto_106204 ?auto_106208 ) ) ( not ( = ?auto_106205 ?auto_106208 ) ) ( not ( = ?auto_106207 ?auto_106208 ) ) ( not ( = ?auto_106206 ?auto_106208 ) ) ( ON ?auto_106202 ?auto_106201 ) ( ON-TABLE ?auto_106208 ) ( ON ?auto_106203 ?auto_106202 ) ( CLEAR ?auto_106203 ) ( HOLDING ?auto_106204 ) ( CLEAR ?auto_106205 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_106206 ?auto_106207 ?auto_106205 ?auto_106204 )
      ( MAKE-5PILE ?auto_106201 ?auto_106202 ?auto_106203 ?auto_106204 ?auto_106205 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_106209 - BLOCK
      ?auto_106210 - BLOCK
      ?auto_106211 - BLOCK
      ?auto_106212 - BLOCK
      ?auto_106213 - BLOCK
    )
    :vars
    (
      ?auto_106216 - BLOCK
      ?auto_106215 - BLOCK
      ?auto_106214 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106209 ?auto_106210 ) ) ( not ( = ?auto_106209 ?auto_106211 ) ) ( not ( = ?auto_106209 ?auto_106212 ) ) ( not ( = ?auto_106209 ?auto_106213 ) ) ( not ( = ?auto_106210 ?auto_106211 ) ) ( not ( = ?auto_106210 ?auto_106212 ) ) ( not ( = ?auto_106210 ?auto_106213 ) ) ( not ( = ?auto_106211 ?auto_106212 ) ) ( not ( = ?auto_106211 ?auto_106213 ) ) ( not ( = ?auto_106212 ?auto_106213 ) ) ( ON ?auto_106213 ?auto_106216 ) ( not ( = ?auto_106209 ?auto_106216 ) ) ( not ( = ?auto_106210 ?auto_106216 ) ) ( not ( = ?auto_106211 ?auto_106216 ) ) ( not ( = ?auto_106212 ?auto_106216 ) ) ( not ( = ?auto_106213 ?auto_106216 ) ) ( ON-TABLE ?auto_106215 ) ( ON ?auto_106216 ?auto_106215 ) ( not ( = ?auto_106215 ?auto_106216 ) ) ( not ( = ?auto_106215 ?auto_106213 ) ) ( not ( = ?auto_106215 ?auto_106212 ) ) ( not ( = ?auto_106209 ?auto_106215 ) ) ( not ( = ?auto_106210 ?auto_106215 ) ) ( not ( = ?auto_106211 ?auto_106215 ) ) ( ON ?auto_106209 ?auto_106214 ) ( not ( = ?auto_106209 ?auto_106214 ) ) ( not ( = ?auto_106210 ?auto_106214 ) ) ( not ( = ?auto_106211 ?auto_106214 ) ) ( not ( = ?auto_106212 ?auto_106214 ) ) ( not ( = ?auto_106213 ?auto_106214 ) ) ( not ( = ?auto_106216 ?auto_106214 ) ) ( not ( = ?auto_106215 ?auto_106214 ) ) ( ON ?auto_106210 ?auto_106209 ) ( ON-TABLE ?auto_106214 ) ( ON ?auto_106211 ?auto_106210 ) ( CLEAR ?auto_106213 ) ( ON ?auto_106212 ?auto_106211 ) ( CLEAR ?auto_106212 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_106214 ?auto_106209 ?auto_106210 ?auto_106211 )
      ( MAKE-5PILE ?auto_106209 ?auto_106210 ?auto_106211 ?auto_106212 ?auto_106213 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_106217 - BLOCK
      ?auto_106218 - BLOCK
      ?auto_106219 - BLOCK
      ?auto_106220 - BLOCK
      ?auto_106221 - BLOCK
    )
    :vars
    (
      ?auto_106224 - BLOCK
      ?auto_106223 - BLOCK
      ?auto_106222 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106217 ?auto_106218 ) ) ( not ( = ?auto_106217 ?auto_106219 ) ) ( not ( = ?auto_106217 ?auto_106220 ) ) ( not ( = ?auto_106217 ?auto_106221 ) ) ( not ( = ?auto_106218 ?auto_106219 ) ) ( not ( = ?auto_106218 ?auto_106220 ) ) ( not ( = ?auto_106218 ?auto_106221 ) ) ( not ( = ?auto_106219 ?auto_106220 ) ) ( not ( = ?auto_106219 ?auto_106221 ) ) ( not ( = ?auto_106220 ?auto_106221 ) ) ( not ( = ?auto_106217 ?auto_106224 ) ) ( not ( = ?auto_106218 ?auto_106224 ) ) ( not ( = ?auto_106219 ?auto_106224 ) ) ( not ( = ?auto_106220 ?auto_106224 ) ) ( not ( = ?auto_106221 ?auto_106224 ) ) ( ON-TABLE ?auto_106223 ) ( ON ?auto_106224 ?auto_106223 ) ( not ( = ?auto_106223 ?auto_106224 ) ) ( not ( = ?auto_106223 ?auto_106221 ) ) ( not ( = ?auto_106223 ?auto_106220 ) ) ( not ( = ?auto_106217 ?auto_106223 ) ) ( not ( = ?auto_106218 ?auto_106223 ) ) ( not ( = ?auto_106219 ?auto_106223 ) ) ( ON ?auto_106217 ?auto_106222 ) ( not ( = ?auto_106217 ?auto_106222 ) ) ( not ( = ?auto_106218 ?auto_106222 ) ) ( not ( = ?auto_106219 ?auto_106222 ) ) ( not ( = ?auto_106220 ?auto_106222 ) ) ( not ( = ?auto_106221 ?auto_106222 ) ) ( not ( = ?auto_106224 ?auto_106222 ) ) ( not ( = ?auto_106223 ?auto_106222 ) ) ( ON ?auto_106218 ?auto_106217 ) ( ON-TABLE ?auto_106222 ) ( ON ?auto_106219 ?auto_106218 ) ( ON ?auto_106220 ?auto_106219 ) ( CLEAR ?auto_106220 ) ( HOLDING ?auto_106221 ) ( CLEAR ?auto_106224 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_106223 ?auto_106224 ?auto_106221 )
      ( MAKE-5PILE ?auto_106217 ?auto_106218 ?auto_106219 ?auto_106220 ?auto_106221 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_106225 - BLOCK
      ?auto_106226 - BLOCK
      ?auto_106227 - BLOCK
      ?auto_106228 - BLOCK
      ?auto_106229 - BLOCK
    )
    :vars
    (
      ?auto_106232 - BLOCK
      ?auto_106230 - BLOCK
      ?auto_106231 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106225 ?auto_106226 ) ) ( not ( = ?auto_106225 ?auto_106227 ) ) ( not ( = ?auto_106225 ?auto_106228 ) ) ( not ( = ?auto_106225 ?auto_106229 ) ) ( not ( = ?auto_106226 ?auto_106227 ) ) ( not ( = ?auto_106226 ?auto_106228 ) ) ( not ( = ?auto_106226 ?auto_106229 ) ) ( not ( = ?auto_106227 ?auto_106228 ) ) ( not ( = ?auto_106227 ?auto_106229 ) ) ( not ( = ?auto_106228 ?auto_106229 ) ) ( not ( = ?auto_106225 ?auto_106232 ) ) ( not ( = ?auto_106226 ?auto_106232 ) ) ( not ( = ?auto_106227 ?auto_106232 ) ) ( not ( = ?auto_106228 ?auto_106232 ) ) ( not ( = ?auto_106229 ?auto_106232 ) ) ( ON-TABLE ?auto_106230 ) ( ON ?auto_106232 ?auto_106230 ) ( not ( = ?auto_106230 ?auto_106232 ) ) ( not ( = ?auto_106230 ?auto_106229 ) ) ( not ( = ?auto_106230 ?auto_106228 ) ) ( not ( = ?auto_106225 ?auto_106230 ) ) ( not ( = ?auto_106226 ?auto_106230 ) ) ( not ( = ?auto_106227 ?auto_106230 ) ) ( ON ?auto_106225 ?auto_106231 ) ( not ( = ?auto_106225 ?auto_106231 ) ) ( not ( = ?auto_106226 ?auto_106231 ) ) ( not ( = ?auto_106227 ?auto_106231 ) ) ( not ( = ?auto_106228 ?auto_106231 ) ) ( not ( = ?auto_106229 ?auto_106231 ) ) ( not ( = ?auto_106232 ?auto_106231 ) ) ( not ( = ?auto_106230 ?auto_106231 ) ) ( ON ?auto_106226 ?auto_106225 ) ( ON-TABLE ?auto_106231 ) ( ON ?auto_106227 ?auto_106226 ) ( ON ?auto_106228 ?auto_106227 ) ( CLEAR ?auto_106232 ) ( ON ?auto_106229 ?auto_106228 ) ( CLEAR ?auto_106229 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_106231 ?auto_106225 ?auto_106226 ?auto_106227 ?auto_106228 )
      ( MAKE-5PILE ?auto_106225 ?auto_106226 ?auto_106227 ?auto_106228 ?auto_106229 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_106233 - BLOCK
      ?auto_106234 - BLOCK
      ?auto_106235 - BLOCK
      ?auto_106236 - BLOCK
      ?auto_106237 - BLOCK
    )
    :vars
    (
      ?auto_106239 - BLOCK
      ?auto_106238 - BLOCK
      ?auto_106240 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106233 ?auto_106234 ) ) ( not ( = ?auto_106233 ?auto_106235 ) ) ( not ( = ?auto_106233 ?auto_106236 ) ) ( not ( = ?auto_106233 ?auto_106237 ) ) ( not ( = ?auto_106234 ?auto_106235 ) ) ( not ( = ?auto_106234 ?auto_106236 ) ) ( not ( = ?auto_106234 ?auto_106237 ) ) ( not ( = ?auto_106235 ?auto_106236 ) ) ( not ( = ?auto_106235 ?auto_106237 ) ) ( not ( = ?auto_106236 ?auto_106237 ) ) ( not ( = ?auto_106233 ?auto_106239 ) ) ( not ( = ?auto_106234 ?auto_106239 ) ) ( not ( = ?auto_106235 ?auto_106239 ) ) ( not ( = ?auto_106236 ?auto_106239 ) ) ( not ( = ?auto_106237 ?auto_106239 ) ) ( ON-TABLE ?auto_106238 ) ( not ( = ?auto_106238 ?auto_106239 ) ) ( not ( = ?auto_106238 ?auto_106237 ) ) ( not ( = ?auto_106238 ?auto_106236 ) ) ( not ( = ?auto_106233 ?auto_106238 ) ) ( not ( = ?auto_106234 ?auto_106238 ) ) ( not ( = ?auto_106235 ?auto_106238 ) ) ( ON ?auto_106233 ?auto_106240 ) ( not ( = ?auto_106233 ?auto_106240 ) ) ( not ( = ?auto_106234 ?auto_106240 ) ) ( not ( = ?auto_106235 ?auto_106240 ) ) ( not ( = ?auto_106236 ?auto_106240 ) ) ( not ( = ?auto_106237 ?auto_106240 ) ) ( not ( = ?auto_106239 ?auto_106240 ) ) ( not ( = ?auto_106238 ?auto_106240 ) ) ( ON ?auto_106234 ?auto_106233 ) ( ON-TABLE ?auto_106240 ) ( ON ?auto_106235 ?auto_106234 ) ( ON ?auto_106236 ?auto_106235 ) ( ON ?auto_106237 ?auto_106236 ) ( CLEAR ?auto_106237 ) ( HOLDING ?auto_106239 ) ( CLEAR ?auto_106238 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_106238 ?auto_106239 )
      ( MAKE-5PILE ?auto_106233 ?auto_106234 ?auto_106235 ?auto_106236 ?auto_106237 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_106241 - BLOCK
      ?auto_106242 - BLOCK
      ?auto_106243 - BLOCK
      ?auto_106244 - BLOCK
      ?auto_106245 - BLOCK
    )
    :vars
    (
      ?auto_106248 - BLOCK
      ?auto_106246 - BLOCK
      ?auto_106247 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106241 ?auto_106242 ) ) ( not ( = ?auto_106241 ?auto_106243 ) ) ( not ( = ?auto_106241 ?auto_106244 ) ) ( not ( = ?auto_106241 ?auto_106245 ) ) ( not ( = ?auto_106242 ?auto_106243 ) ) ( not ( = ?auto_106242 ?auto_106244 ) ) ( not ( = ?auto_106242 ?auto_106245 ) ) ( not ( = ?auto_106243 ?auto_106244 ) ) ( not ( = ?auto_106243 ?auto_106245 ) ) ( not ( = ?auto_106244 ?auto_106245 ) ) ( not ( = ?auto_106241 ?auto_106248 ) ) ( not ( = ?auto_106242 ?auto_106248 ) ) ( not ( = ?auto_106243 ?auto_106248 ) ) ( not ( = ?auto_106244 ?auto_106248 ) ) ( not ( = ?auto_106245 ?auto_106248 ) ) ( ON-TABLE ?auto_106246 ) ( not ( = ?auto_106246 ?auto_106248 ) ) ( not ( = ?auto_106246 ?auto_106245 ) ) ( not ( = ?auto_106246 ?auto_106244 ) ) ( not ( = ?auto_106241 ?auto_106246 ) ) ( not ( = ?auto_106242 ?auto_106246 ) ) ( not ( = ?auto_106243 ?auto_106246 ) ) ( ON ?auto_106241 ?auto_106247 ) ( not ( = ?auto_106241 ?auto_106247 ) ) ( not ( = ?auto_106242 ?auto_106247 ) ) ( not ( = ?auto_106243 ?auto_106247 ) ) ( not ( = ?auto_106244 ?auto_106247 ) ) ( not ( = ?auto_106245 ?auto_106247 ) ) ( not ( = ?auto_106248 ?auto_106247 ) ) ( not ( = ?auto_106246 ?auto_106247 ) ) ( ON ?auto_106242 ?auto_106241 ) ( ON-TABLE ?auto_106247 ) ( ON ?auto_106243 ?auto_106242 ) ( ON ?auto_106244 ?auto_106243 ) ( ON ?auto_106245 ?auto_106244 ) ( CLEAR ?auto_106246 ) ( ON ?auto_106248 ?auto_106245 ) ( CLEAR ?auto_106248 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_106247 ?auto_106241 ?auto_106242 ?auto_106243 ?auto_106244 ?auto_106245 )
      ( MAKE-5PILE ?auto_106241 ?auto_106242 ?auto_106243 ?auto_106244 ?auto_106245 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_106249 - BLOCK
      ?auto_106250 - BLOCK
      ?auto_106251 - BLOCK
      ?auto_106252 - BLOCK
      ?auto_106253 - BLOCK
    )
    :vars
    (
      ?auto_106255 - BLOCK
      ?auto_106256 - BLOCK
      ?auto_106254 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106249 ?auto_106250 ) ) ( not ( = ?auto_106249 ?auto_106251 ) ) ( not ( = ?auto_106249 ?auto_106252 ) ) ( not ( = ?auto_106249 ?auto_106253 ) ) ( not ( = ?auto_106250 ?auto_106251 ) ) ( not ( = ?auto_106250 ?auto_106252 ) ) ( not ( = ?auto_106250 ?auto_106253 ) ) ( not ( = ?auto_106251 ?auto_106252 ) ) ( not ( = ?auto_106251 ?auto_106253 ) ) ( not ( = ?auto_106252 ?auto_106253 ) ) ( not ( = ?auto_106249 ?auto_106255 ) ) ( not ( = ?auto_106250 ?auto_106255 ) ) ( not ( = ?auto_106251 ?auto_106255 ) ) ( not ( = ?auto_106252 ?auto_106255 ) ) ( not ( = ?auto_106253 ?auto_106255 ) ) ( not ( = ?auto_106256 ?auto_106255 ) ) ( not ( = ?auto_106256 ?auto_106253 ) ) ( not ( = ?auto_106256 ?auto_106252 ) ) ( not ( = ?auto_106249 ?auto_106256 ) ) ( not ( = ?auto_106250 ?auto_106256 ) ) ( not ( = ?auto_106251 ?auto_106256 ) ) ( ON ?auto_106249 ?auto_106254 ) ( not ( = ?auto_106249 ?auto_106254 ) ) ( not ( = ?auto_106250 ?auto_106254 ) ) ( not ( = ?auto_106251 ?auto_106254 ) ) ( not ( = ?auto_106252 ?auto_106254 ) ) ( not ( = ?auto_106253 ?auto_106254 ) ) ( not ( = ?auto_106255 ?auto_106254 ) ) ( not ( = ?auto_106256 ?auto_106254 ) ) ( ON ?auto_106250 ?auto_106249 ) ( ON-TABLE ?auto_106254 ) ( ON ?auto_106251 ?auto_106250 ) ( ON ?auto_106252 ?auto_106251 ) ( ON ?auto_106253 ?auto_106252 ) ( ON ?auto_106255 ?auto_106253 ) ( CLEAR ?auto_106255 ) ( HOLDING ?auto_106256 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_106256 )
      ( MAKE-5PILE ?auto_106249 ?auto_106250 ?auto_106251 ?auto_106252 ?auto_106253 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_106257 - BLOCK
      ?auto_106258 - BLOCK
      ?auto_106259 - BLOCK
      ?auto_106260 - BLOCK
      ?auto_106261 - BLOCK
    )
    :vars
    (
      ?auto_106263 - BLOCK
      ?auto_106264 - BLOCK
      ?auto_106262 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106257 ?auto_106258 ) ) ( not ( = ?auto_106257 ?auto_106259 ) ) ( not ( = ?auto_106257 ?auto_106260 ) ) ( not ( = ?auto_106257 ?auto_106261 ) ) ( not ( = ?auto_106258 ?auto_106259 ) ) ( not ( = ?auto_106258 ?auto_106260 ) ) ( not ( = ?auto_106258 ?auto_106261 ) ) ( not ( = ?auto_106259 ?auto_106260 ) ) ( not ( = ?auto_106259 ?auto_106261 ) ) ( not ( = ?auto_106260 ?auto_106261 ) ) ( not ( = ?auto_106257 ?auto_106263 ) ) ( not ( = ?auto_106258 ?auto_106263 ) ) ( not ( = ?auto_106259 ?auto_106263 ) ) ( not ( = ?auto_106260 ?auto_106263 ) ) ( not ( = ?auto_106261 ?auto_106263 ) ) ( not ( = ?auto_106264 ?auto_106263 ) ) ( not ( = ?auto_106264 ?auto_106261 ) ) ( not ( = ?auto_106264 ?auto_106260 ) ) ( not ( = ?auto_106257 ?auto_106264 ) ) ( not ( = ?auto_106258 ?auto_106264 ) ) ( not ( = ?auto_106259 ?auto_106264 ) ) ( ON ?auto_106257 ?auto_106262 ) ( not ( = ?auto_106257 ?auto_106262 ) ) ( not ( = ?auto_106258 ?auto_106262 ) ) ( not ( = ?auto_106259 ?auto_106262 ) ) ( not ( = ?auto_106260 ?auto_106262 ) ) ( not ( = ?auto_106261 ?auto_106262 ) ) ( not ( = ?auto_106263 ?auto_106262 ) ) ( not ( = ?auto_106264 ?auto_106262 ) ) ( ON ?auto_106258 ?auto_106257 ) ( ON-TABLE ?auto_106262 ) ( ON ?auto_106259 ?auto_106258 ) ( ON ?auto_106260 ?auto_106259 ) ( ON ?auto_106261 ?auto_106260 ) ( ON ?auto_106263 ?auto_106261 ) ( ON ?auto_106264 ?auto_106263 ) ( CLEAR ?auto_106264 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_106262 ?auto_106257 ?auto_106258 ?auto_106259 ?auto_106260 ?auto_106261 ?auto_106263 )
      ( MAKE-5PILE ?auto_106257 ?auto_106258 ?auto_106259 ?auto_106260 ?auto_106261 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_106276 - BLOCK
    )
    :vars
    (
      ?auto_106278 - BLOCK
      ?auto_106279 - BLOCK
      ?auto_106277 - BLOCK
      ?auto_106280 - BLOCK
      ?auto_106282 - BLOCK
      ?auto_106281 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106278 ?auto_106276 ) ( ON-TABLE ?auto_106276 ) ( not ( = ?auto_106276 ?auto_106278 ) ) ( not ( = ?auto_106276 ?auto_106279 ) ) ( not ( = ?auto_106276 ?auto_106277 ) ) ( not ( = ?auto_106278 ?auto_106279 ) ) ( not ( = ?auto_106278 ?auto_106277 ) ) ( not ( = ?auto_106279 ?auto_106277 ) ) ( ON ?auto_106279 ?auto_106278 ) ( CLEAR ?auto_106279 ) ( HOLDING ?auto_106277 ) ( CLEAR ?auto_106280 ) ( ON-TABLE ?auto_106282 ) ( ON ?auto_106281 ?auto_106282 ) ( ON ?auto_106280 ?auto_106281 ) ( not ( = ?auto_106282 ?auto_106281 ) ) ( not ( = ?auto_106282 ?auto_106280 ) ) ( not ( = ?auto_106282 ?auto_106277 ) ) ( not ( = ?auto_106281 ?auto_106280 ) ) ( not ( = ?auto_106281 ?auto_106277 ) ) ( not ( = ?auto_106280 ?auto_106277 ) ) ( not ( = ?auto_106276 ?auto_106280 ) ) ( not ( = ?auto_106276 ?auto_106282 ) ) ( not ( = ?auto_106276 ?auto_106281 ) ) ( not ( = ?auto_106278 ?auto_106280 ) ) ( not ( = ?auto_106278 ?auto_106282 ) ) ( not ( = ?auto_106278 ?auto_106281 ) ) ( not ( = ?auto_106279 ?auto_106280 ) ) ( not ( = ?auto_106279 ?auto_106282 ) ) ( not ( = ?auto_106279 ?auto_106281 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_106282 ?auto_106281 ?auto_106280 ?auto_106277 )
      ( MAKE-1PILE ?auto_106276 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_106283 - BLOCK
    )
    :vars
    (
      ?auto_106288 - BLOCK
      ?auto_106289 - BLOCK
      ?auto_106287 - BLOCK
      ?auto_106285 - BLOCK
      ?auto_106284 - BLOCK
      ?auto_106286 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106288 ?auto_106283 ) ( ON-TABLE ?auto_106283 ) ( not ( = ?auto_106283 ?auto_106288 ) ) ( not ( = ?auto_106283 ?auto_106289 ) ) ( not ( = ?auto_106283 ?auto_106287 ) ) ( not ( = ?auto_106288 ?auto_106289 ) ) ( not ( = ?auto_106288 ?auto_106287 ) ) ( not ( = ?auto_106289 ?auto_106287 ) ) ( ON ?auto_106289 ?auto_106288 ) ( CLEAR ?auto_106285 ) ( ON-TABLE ?auto_106284 ) ( ON ?auto_106286 ?auto_106284 ) ( ON ?auto_106285 ?auto_106286 ) ( not ( = ?auto_106284 ?auto_106286 ) ) ( not ( = ?auto_106284 ?auto_106285 ) ) ( not ( = ?auto_106284 ?auto_106287 ) ) ( not ( = ?auto_106286 ?auto_106285 ) ) ( not ( = ?auto_106286 ?auto_106287 ) ) ( not ( = ?auto_106285 ?auto_106287 ) ) ( not ( = ?auto_106283 ?auto_106285 ) ) ( not ( = ?auto_106283 ?auto_106284 ) ) ( not ( = ?auto_106283 ?auto_106286 ) ) ( not ( = ?auto_106288 ?auto_106285 ) ) ( not ( = ?auto_106288 ?auto_106284 ) ) ( not ( = ?auto_106288 ?auto_106286 ) ) ( not ( = ?auto_106289 ?auto_106285 ) ) ( not ( = ?auto_106289 ?auto_106284 ) ) ( not ( = ?auto_106289 ?auto_106286 ) ) ( ON ?auto_106287 ?auto_106289 ) ( CLEAR ?auto_106287 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_106283 ?auto_106288 ?auto_106289 )
      ( MAKE-1PILE ?auto_106283 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_106290 - BLOCK
    )
    :vars
    (
      ?auto_106294 - BLOCK
      ?auto_106296 - BLOCK
      ?auto_106292 - BLOCK
      ?auto_106295 - BLOCK
      ?auto_106293 - BLOCK
      ?auto_106291 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106294 ?auto_106290 ) ( ON-TABLE ?auto_106290 ) ( not ( = ?auto_106290 ?auto_106294 ) ) ( not ( = ?auto_106290 ?auto_106296 ) ) ( not ( = ?auto_106290 ?auto_106292 ) ) ( not ( = ?auto_106294 ?auto_106296 ) ) ( not ( = ?auto_106294 ?auto_106292 ) ) ( not ( = ?auto_106296 ?auto_106292 ) ) ( ON ?auto_106296 ?auto_106294 ) ( ON-TABLE ?auto_106295 ) ( ON ?auto_106293 ?auto_106295 ) ( not ( = ?auto_106295 ?auto_106293 ) ) ( not ( = ?auto_106295 ?auto_106291 ) ) ( not ( = ?auto_106295 ?auto_106292 ) ) ( not ( = ?auto_106293 ?auto_106291 ) ) ( not ( = ?auto_106293 ?auto_106292 ) ) ( not ( = ?auto_106291 ?auto_106292 ) ) ( not ( = ?auto_106290 ?auto_106291 ) ) ( not ( = ?auto_106290 ?auto_106295 ) ) ( not ( = ?auto_106290 ?auto_106293 ) ) ( not ( = ?auto_106294 ?auto_106291 ) ) ( not ( = ?auto_106294 ?auto_106295 ) ) ( not ( = ?auto_106294 ?auto_106293 ) ) ( not ( = ?auto_106296 ?auto_106291 ) ) ( not ( = ?auto_106296 ?auto_106295 ) ) ( not ( = ?auto_106296 ?auto_106293 ) ) ( ON ?auto_106292 ?auto_106296 ) ( CLEAR ?auto_106292 ) ( HOLDING ?auto_106291 ) ( CLEAR ?auto_106293 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_106295 ?auto_106293 ?auto_106291 )
      ( MAKE-1PILE ?auto_106290 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_106297 - BLOCK
    )
    :vars
    (
      ?auto_106302 - BLOCK
      ?auto_106301 - BLOCK
      ?auto_106303 - BLOCK
      ?auto_106300 - BLOCK
      ?auto_106298 - BLOCK
      ?auto_106299 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106302 ?auto_106297 ) ( ON-TABLE ?auto_106297 ) ( not ( = ?auto_106297 ?auto_106302 ) ) ( not ( = ?auto_106297 ?auto_106301 ) ) ( not ( = ?auto_106297 ?auto_106303 ) ) ( not ( = ?auto_106302 ?auto_106301 ) ) ( not ( = ?auto_106302 ?auto_106303 ) ) ( not ( = ?auto_106301 ?auto_106303 ) ) ( ON ?auto_106301 ?auto_106302 ) ( ON-TABLE ?auto_106300 ) ( ON ?auto_106298 ?auto_106300 ) ( not ( = ?auto_106300 ?auto_106298 ) ) ( not ( = ?auto_106300 ?auto_106299 ) ) ( not ( = ?auto_106300 ?auto_106303 ) ) ( not ( = ?auto_106298 ?auto_106299 ) ) ( not ( = ?auto_106298 ?auto_106303 ) ) ( not ( = ?auto_106299 ?auto_106303 ) ) ( not ( = ?auto_106297 ?auto_106299 ) ) ( not ( = ?auto_106297 ?auto_106300 ) ) ( not ( = ?auto_106297 ?auto_106298 ) ) ( not ( = ?auto_106302 ?auto_106299 ) ) ( not ( = ?auto_106302 ?auto_106300 ) ) ( not ( = ?auto_106302 ?auto_106298 ) ) ( not ( = ?auto_106301 ?auto_106299 ) ) ( not ( = ?auto_106301 ?auto_106300 ) ) ( not ( = ?auto_106301 ?auto_106298 ) ) ( ON ?auto_106303 ?auto_106301 ) ( CLEAR ?auto_106298 ) ( ON ?auto_106299 ?auto_106303 ) ( CLEAR ?auto_106299 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_106297 ?auto_106302 ?auto_106301 ?auto_106303 )
      ( MAKE-1PILE ?auto_106297 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_106304 - BLOCK
    )
    :vars
    (
      ?auto_106307 - BLOCK
      ?auto_106306 - BLOCK
      ?auto_106310 - BLOCK
      ?auto_106305 - BLOCK
      ?auto_106308 - BLOCK
      ?auto_106309 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106307 ?auto_106304 ) ( ON-TABLE ?auto_106304 ) ( not ( = ?auto_106304 ?auto_106307 ) ) ( not ( = ?auto_106304 ?auto_106306 ) ) ( not ( = ?auto_106304 ?auto_106310 ) ) ( not ( = ?auto_106307 ?auto_106306 ) ) ( not ( = ?auto_106307 ?auto_106310 ) ) ( not ( = ?auto_106306 ?auto_106310 ) ) ( ON ?auto_106306 ?auto_106307 ) ( ON-TABLE ?auto_106305 ) ( not ( = ?auto_106305 ?auto_106308 ) ) ( not ( = ?auto_106305 ?auto_106309 ) ) ( not ( = ?auto_106305 ?auto_106310 ) ) ( not ( = ?auto_106308 ?auto_106309 ) ) ( not ( = ?auto_106308 ?auto_106310 ) ) ( not ( = ?auto_106309 ?auto_106310 ) ) ( not ( = ?auto_106304 ?auto_106309 ) ) ( not ( = ?auto_106304 ?auto_106305 ) ) ( not ( = ?auto_106304 ?auto_106308 ) ) ( not ( = ?auto_106307 ?auto_106309 ) ) ( not ( = ?auto_106307 ?auto_106305 ) ) ( not ( = ?auto_106307 ?auto_106308 ) ) ( not ( = ?auto_106306 ?auto_106309 ) ) ( not ( = ?auto_106306 ?auto_106305 ) ) ( not ( = ?auto_106306 ?auto_106308 ) ) ( ON ?auto_106310 ?auto_106306 ) ( ON ?auto_106309 ?auto_106310 ) ( CLEAR ?auto_106309 ) ( HOLDING ?auto_106308 ) ( CLEAR ?auto_106305 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_106305 ?auto_106308 )
      ( MAKE-1PILE ?auto_106304 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_106311 - BLOCK
    )
    :vars
    (
      ?auto_106313 - BLOCK
      ?auto_106317 - BLOCK
      ?auto_106316 - BLOCK
      ?auto_106315 - BLOCK
      ?auto_106312 - BLOCK
      ?auto_106314 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106313 ?auto_106311 ) ( ON-TABLE ?auto_106311 ) ( not ( = ?auto_106311 ?auto_106313 ) ) ( not ( = ?auto_106311 ?auto_106317 ) ) ( not ( = ?auto_106311 ?auto_106316 ) ) ( not ( = ?auto_106313 ?auto_106317 ) ) ( not ( = ?auto_106313 ?auto_106316 ) ) ( not ( = ?auto_106317 ?auto_106316 ) ) ( ON ?auto_106317 ?auto_106313 ) ( ON-TABLE ?auto_106315 ) ( not ( = ?auto_106315 ?auto_106312 ) ) ( not ( = ?auto_106315 ?auto_106314 ) ) ( not ( = ?auto_106315 ?auto_106316 ) ) ( not ( = ?auto_106312 ?auto_106314 ) ) ( not ( = ?auto_106312 ?auto_106316 ) ) ( not ( = ?auto_106314 ?auto_106316 ) ) ( not ( = ?auto_106311 ?auto_106314 ) ) ( not ( = ?auto_106311 ?auto_106315 ) ) ( not ( = ?auto_106311 ?auto_106312 ) ) ( not ( = ?auto_106313 ?auto_106314 ) ) ( not ( = ?auto_106313 ?auto_106315 ) ) ( not ( = ?auto_106313 ?auto_106312 ) ) ( not ( = ?auto_106317 ?auto_106314 ) ) ( not ( = ?auto_106317 ?auto_106315 ) ) ( not ( = ?auto_106317 ?auto_106312 ) ) ( ON ?auto_106316 ?auto_106317 ) ( ON ?auto_106314 ?auto_106316 ) ( CLEAR ?auto_106315 ) ( ON ?auto_106312 ?auto_106314 ) ( CLEAR ?auto_106312 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_106311 ?auto_106313 ?auto_106317 ?auto_106316 ?auto_106314 )
      ( MAKE-1PILE ?auto_106311 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_106318 - BLOCK
    )
    :vars
    (
      ?auto_106324 - BLOCK
      ?auto_106321 - BLOCK
      ?auto_106319 - BLOCK
      ?auto_106320 - BLOCK
      ?auto_106323 - BLOCK
      ?auto_106322 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106324 ?auto_106318 ) ( ON-TABLE ?auto_106318 ) ( not ( = ?auto_106318 ?auto_106324 ) ) ( not ( = ?auto_106318 ?auto_106321 ) ) ( not ( = ?auto_106318 ?auto_106319 ) ) ( not ( = ?auto_106324 ?auto_106321 ) ) ( not ( = ?auto_106324 ?auto_106319 ) ) ( not ( = ?auto_106321 ?auto_106319 ) ) ( ON ?auto_106321 ?auto_106324 ) ( not ( = ?auto_106320 ?auto_106323 ) ) ( not ( = ?auto_106320 ?auto_106322 ) ) ( not ( = ?auto_106320 ?auto_106319 ) ) ( not ( = ?auto_106323 ?auto_106322 ) ) ( not ( = ?auto_106323 ?auto_106319 ) ) ( not ( = ?auto_106322 ?auto_106319 ) ) ( not ( = ?auto_106318 ?auto_106322 ) ) ( not ( = ?auto_106318 ?auto_106320 ) ) ( not ( = ?auto_106318 ?auto_106323 ) ) ( not ( = ?auto_106324 ?auto_106322 ) ) ( not ( = ?auto_106324 ?auto_106320 ) ) ( not ( = ?auto_106324 ?auto_106323 ) ) ( not ( = ?auto_106321 ?auto_106322 ) ) ( not ( = ?auto_106321 ?auto_106320 ) ) ( not ( = ?auto_106321 ?auto_106323 ) ) ( ON ?auto_106319 ?auto_106321 ) ( ON ?auto_106322 ?auto_106319 ) ( ON ?auto_106323 ?auto_106322 ) ( CLEAR ?auto_106323 ) ( HOLDING ?auto_106320 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_106320 )
      ( MAKE-1PILE ?auto_106318 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_106333 - BLOCK
    )
    :vars
    (
      ?auto_106336 - BLOCK
      ?auto_106338 - BLOCK
      ?auto_106337 - BLOCK
      ?auto_106334 - BLOCK
      ?auto_106335 - BLOCK
      ?auto_106339 - BLOCK
      ?auto_106340 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106336 ?auto_106333 ) ( ON-TABLE ?auto_106333 ) ( not ( = ?auto_106333 ?auto_106336 ) ) ( not ( = ?auto_106333 ?auto_106338 ) ) ( not ( = ?auto_106333 ?auto_106337 ) ) ( not ( = ?auto_106336 ?auto_106338 ) ) ( not ( = ?auto_106336 ?auto_106337 ) ) ( not ( = ?auto_106338 ?auto_106337 ) ) ( ON ?auto_106338 ?auto_106336 ) ( not ( = ?auto_106334 ?auto_106335 ) ) ( not ( = ?auto_106334 ?auto_106339 ) ) ( not ( = ?auto_106334 ?auto_106337 ) ) ( not ( = ?auto_106335 ?auto_106339 ) ) ( not ( = ?auto_106335 ?auto_106337 ) ) ( not ( = ?auto_106339 ?auto_106337 ) ) ( not ( = ?auto_106333 ?auto_106339 ) ) ( not ( = ?auto_106333 ?auto_106334 ) ) ( not ( = ?auto_106333 ?auto_106335 ) ) ( not ( = ?auto_106336 ?auto_106339 ) ) ( not ( = ?auto_106336 ?auto_106334 ) ) ( not ( = ?auto_106336 ?auto_106335 ) ) ( not ( = ?auto_106338 ?auto_106339 ) ) ( not ( = ?auto_106338 ?auto_106334 ) ) ( not ( = ?auto_106338 ?auto_106335 ) ) ( ON ?auto_106337 ?auto_106338 ) ( ON ?auto_106339 ?auto_106337 ) ( ON ?auto_106335 ?auto_106339 ) ( CLEAR ?auto_106335 ) ( ON ?auto_106334 ?auto_106340 ) ( CLEAR ?auto_106334 ) ( HAND-EMPTY ) ( not ( = ?auto_106333 ?auto_106340 ) ) ( not ( = ?auto_106336 ?auto_106340 ) ) ( not ( = ?auto_106338 ?auto_106340 ) ) ( not ( = ?auto_106337 ?auto_106340 ) ) ( not ( = ?auto_106334 ?auto_106340 ) ) ( not ( = ?auto_106335 ?auto_106340 ) ) ( not ( = ?auto_106339 ?auto_106340 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_106334 ?auto_106340 )
      ( MAKE-1PILE ?auto_106333 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_106341 - BLOCK
    )
    :vars
    (
      ?auto_106348 - BLOCK
      ?auto_106343 - BLOCK
      ?auto_106346 - BLOCK
      ?auto_106344 - BLOCK
      ?auto_106342 - BLOCK
      ?auto_106345 - BLOCK
      ?auto_106347 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106348 ?auto_106341 ) ( ON-TABLE ?auto_106341 ) ( not ( = ?auto_106341 ?auto_106348 ) ) ( not ( = ?auto_106341 ?auto_106343 ) ) ( not ( = ?auto_106341 ?auto_106346 ) ) ( not ( = ?auto_106348 ?auto_106343 ) ) ( not ( = ?auto_106348 ?auto_106346 ) ) ( not ( = ?auto_106343 ?auto_106346 ) ) ( ON ?auto_106343 ?auto_106348 ) ( not ( = ?auto_106344 ?auto_106342 ) ) ( not ( = ?auto_106344 ?auto_106345 ) ) ( not ( = ?auto_106344 ?auto_106346 ) ) ( not ( = ?auto_106342 ?auto_106345 ) ) ( not ( = ?auto_106342 ?auto_106346 ) ) ( not ( = ?auto_106345 ?auto_106346 ) ) ( not ( = ?auto_106341 ?auto_106345 ) ) ( not ( = ?auto_106341 ?auto_106344 ) ) ( not ( = ?auto_106341 ?auto_106342 ) ) ( not ( = ?auto_106348 ?auto_106345 ) ) ( not ( = ?auto_106348 ?auto_106344 ) ) ( not ( = ?auto_106348 ?auto_106342 ) ) ( not ( = ?auto_106343 ?auto_106345 ) ) ( not ( = ?auto_106343 ?auto_106344 ) ) ( not ( = ?auto_106343 ?auto_106342 ) ) ( ON ?auto_106346 ?auto_106343 ) ( ON ?auto_106345 ?auto_106346 ) ( ON ?auto_106344 ?auto_106347 ) ( CLEAR ?auto_106344 ) ( not ( = ?auto_106341 ?auto_106347 ) ) ( not ( = ?auto_106348 ?auto_106347 ) ) ( not ( = ?auto_106343 ?auto_106347 ) ) ( not ( = ?auto_106346 ?auto_106347 ) ) ( not ( = ?auto_106344 ?auto_106347 ) ) ( not ( = ?auto_106342 ?auto_106347 ) ) ( not ( = ?auto_106345 ?auto_106347 ) ) ( HOLDING ?auto_106342 ) ( CLEAR ?auto_106345 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_106341 ?auto_106348 ?auto_106343 ?auto_106346 ?auto_106345 ?auto_106342 )
      ( MAKE-1PILE ?auto_106341 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_106349 - BLOCK
    )
    :vars
    (
      ?auto_106356 - BLOCK
      ?auto_106352 - BLOCK
      ?auto_106354 - BLOCK
      ?auto_106353 - BLOCK
      ?auto_106351 - BLOCK
      ?auto_106355 - BLOCK
      ?auto_106350 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106356 ?auto_106349 ) ( ON-TABLE ?auto_106349 ) ( not ( = ?auto_106349 ?auto_106356 ) ) ( not ( = ?auto_106349 ?auto_106352 ) ) ( not ( = ?auto_106349 ?auto_106354 ) ) ( not ( = ?auto_106356 ?auto_106352 ) ) ( not ( = ?auto_106356 ?auto_106354 ) ) ( not ( = ?auto_106352 ?auto_106354 ) ) ( ON ?auto_106352 ?auto_106356 ) ( not ( = ?auto_106353 ?auto_106351 ) ) ( not ( = ?auto_106353 ?auto_106355 ) ) ( not ( = ?auto_106353 ?auto_106354 ) ) ( not ( = ?auto_106351 ?auto_106355 ) ) ( not ( = ?auto_106351 ?auto_106354 ) ) ( not ( = ?auto_106355 ?auto_106354 ) ) ( not ( = ?auto_106349 ?auto_106355 ) ) ( not ( = ?auto_106349 ?auto_106353 ) ) ( not ( = ?auto_106349 ?auto_106351 ) ) ( not ( = ?auto_106356 ?auto_106355 ) ) ( not ( = ?auto_106356 ?auto_106353 ) ) ( not ( = ?auto_106356 ?auto_106351 ) ) ( not ( = ?auto_106352 ?auto_106355 ) ) ( not ( = ?auto_106352 ?auto_106353 ) ) ( not ( = ?auto_106352 ?auto_106351 ) ) ( ON ?auto_106354 ?auto_106352 ) ( ON ?auto_106355 ?auto_106354 ) ( ON ?auto_106353 ?auto_106350 ) ( not ( = ?auto_106349 ?auto_106350 ) ) ( not ( = ?auto_106356 ?auto_106350 ) ) ( not ( = ?auto_106352 ?auto_106350 ) ) ( not ( = ?auto_106354 ?auto_106350 ) ) ( not ( = ?auto_106353 ?auto_106350 ) ) ( not ( = ?auto_106351 ?auto_106350 ) ) ( not ( = ?auto_106355 ?auto_106350 ) ) ( CLEAR ?auto_106355 ) ( ON ?auto_106351 ?auto_106353 ) ( CLEAR ?auto_106351 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_106350 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_106350 ?auto_106353 )
      ( MAKE-1PILE ?auto_106349 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_106357 - BLOCK
    )
    :vars
    (
      ?auto_106363 - BLOCK
      ?auto_106364 - BLOCK
      ?auto_106361 - BLOCK
      ?auto_106358 - BLOCK
      ?auto_106362 - BLOCK
      ?auto_106360 - BLOCK
      ?auto_106359 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106363 ?auto_106357 ) ( ON-TABLE ?auto_106357 ) ( not ( = ?auto_106357 ?auto_106363 ) ) ( not ( = ?auto_106357 ?auto_106364 ) ) ( not ( = ?auto_106357 ?auto_106361 ) ) ( not ( = ?auto_106363 ?auto_106364 ) ) ( not ( = ?auto_106363 ?auto_106361 ) ) ( not ( = ?auto_106364 ?auto_106361 ) ) ( ON ?auto_106364 ?auto_106363 ) ( not ( = ?auto_106358 ?auto_106362 ) ) ( not ( = ?auto_106358 ?auto_106360 ) ) ( not ( = ?auto_106358 ?auto_106361 ) ) ( not ( = ?auto_106362 ?auto_106360 ) ) ( not ( = ?auto_106362 ?auto_106361 ) ) ( not ( = ?auto_106360 ?auto_106361 ) ) ( not ( = ?auto_106357 ?auto_106360 ) ) ( not ( = ?auto_106357 ?auto_106358 ) ) ( not ( = ?auto_106357 ?auto_106362 ) ) ( not ( = ?auto_106363 ?auto_106360 ) ) ( not ( = ?auto_106363 ?auto_106358 ) ) ( not ( = ?auto_106363 ?auto_106362 ) ) ( not ( = ?auto_106364 ?auto_106360 ) ) ( not ( = ?auto_106364 ?auto_106358 ) ) ( not ( = ?auto_106364 ?auto_106362 ) ) ( ON ?auto_106361 ?auto_106364 ) ( ON ?auto_106358 ?auto_106359 ) ( not ( = ?auto_106357 ?auto_106359 ) ) ( not ( = ?auto_106363 ?auto_106359 ) ) ( not ( = ?auto_106364 ?auto_106359 ) ) ( not ( = ?auto_106361 ?auto_106359 ) ) ( not ( = ?auto_106358 ?auto_106359 ) ) ( not ( = ?auto_106362 ?auto_106359 ) ) ( not ( = ?auto_106360 ?auto_106359 ) ) ( ON ?auto_106362 ?auto_106358 ) ( CLEAR ?auto_106362 ) ( ON-TABLE ?auto_106359 ) ( HOLDING ?auto_106360 ) ( CLEAR ?auto_106361 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_106357 ?auto_106363 ?auto_106364 ?auto_106361 ?auto_106360 )
      ( MAKE-1PILE ?auto_106357 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_106403 - BLOCK
      ?auto_106404 - BLOCK
      ?auto_106405 - BLOCK
      ?auto_106406 - BLOCK
      ?auto_106407 - BLOCK
      ?auto_106408 - BLOCK
    )
    :vars
    (
      ?auto_106409 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_106403 ) ( ON ?auto_106404 ?auto_106403 ) ( ON ?auto_106405 ?auto_106404 ) ( ON ?auto_106406 ?auto_106405 ) ( not ( = ?auto_106403 ?auto_106404 ) ) ( not ( = ?auto_106403 ?auto_106405 ) ) ( not ( = ?auto_106403 ?auto_106406 ) ) ( not ( = ?auto_106403 ?auto_106407 ) ) ( not ( = ?auto_106403 ?auto_106408 ) ) ( not ( = ?auto_106404 ?auto_106405 ) ) ( not ( = ?auto_106404 ?auto_106406 ) ) ( not ( = ?auto_106404 ?auto_106407 ) ) ( not ( = ?auto_106404 ?auto_106408 ) ) ( not ( = ?auto_106405 ?auto_106406 ) ) ( not ( = ?auto_106405 ?auto_106407 ) ) ( not ( = ?auto_106405 ?auto_106408 ) ) ( not ( = ?auto_106406 ?auto_106407 ) ) ( not ( = ?auto_106406 ?auto_106408 ) ) ( not ( = ?auto_106407 ?auto_106408 ) ) ( ON ?auto_106408 ?auto_106409 ) ( not ( = ?auto_106403 ?auto_106409 ) ) ( not ( = ?auto_106404 ?auto_106409 ) ) ( not ( = ?auto_106405 ?auto_106409 ) ) ( not ( = ?auto_106406 ?auto_106409 ) ) ( not ( = ?auto_106407 ?auto_106409 ) ) ( not ( = ?auto_106408 ?auto_106409 ) ) ( CLEAR ?auto_106406 ) ( ON ?auto_106407 ?auto_106408 ) ( CLEAR ?auto_106407 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_106409 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_106409 ?auto_106408 )
      ( MAKE-6PILE ?auto_106403 ?auto_106404 ?auto_106405 ?auto_106406 ?auto_106407 ?auto_106408 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_106410 - BLOCK
      ?auto_106411 - BLOCK
      ?auto_106412 - BLOCK
      ?auto_106413 - BLOCK
      ?auto_106414 - BLOCK
      ?auto_106415 - BLOCK
    )
    :vars
    (
      ?auto_106416 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_106410 ) ( ON ?auto_106411 ?auto_106410 ) ( ON ?auto_106412 ?auto_106411 ) ( not ( = ?auto_106410 ?auto_106411 ) ) ( not ( = ?auto_106410 ?auto_106412 ) ) ( not ( = ?auto_106410 ?auto_106413 ) ) ( not ( = ?auto_106410 ?auto_106414 ) ) ( not ( = ?auto_106410 ?auto_106415 ) ) ( not ( = ?auto_106411 ?auto_106412 ) ) ( not ( = ?auto_106411 ?auto_106413 ) ) ( not ( = ?auto_106411 ?auto_106414 ) ) ( not ( = ?auto_106411 ?auto_106415 ) ) ( not ( = ?auto_106412 ?auto_106413 ) ) ( not ( = ?auto_106412 ?auto_106414 ) ) ( not ( = ?auto_106412 ?auto_106415 ) ) ( not ( = ?auto_106413 ?auto_106414 ) ) ( not ( = ?auto_106413 ?auto_106415 ) ) ( not ( = ?auto_106414 ?auto_106415 ) ) ( ON ?auto_106415 ?auto_106416 ) ( not ( = ?auto_106410 ?auto_106416 ) ) ( not ( = ?auto_106411 ?auto_106416 ) ) ( not ( = ?auto_106412 ?auto_106416 ) ) ( not ( = ?auto_106413 ?auto_106416 ) ) ( not ( = ?auto_106414 ?auto_106416 ) ) ( not ( = ?auto_106415 ?auto_106416 ) ) ( ON ?auto_106414 ?auto_106415 ) ( CLEAR ?auto_106414 ) ( ON-TABLE ?auto_106416 ) ( HOLDING ?auto_106413 ) ( CLEAR ?auto_106412 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_106410 ?auto_106411 ?auto_106412 ?auto_106413 )
      ( MAKE-6PILE ?auto_106410 ?auto_106411 ?auto_106412 ?auto_106413 ?auto_106414 ?auto_106415 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_106417 - BLOCK
      ?auto_106418 - BLOCK
      ?auto_106419 - BLOCK
      ?auto_106420 - BLOCK
      ?auto_106421 - BLOCK
      ?auto_106422 - BLOCK
    )
    :vars
    (
      ?auto_106423 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_106417 ) ( ON ?auto_106418 ?auto_106417 ) ( ON ?auto_106419 ?auto_106418 ) ( not ( = ?auto_106417 ?auto_106418 ) ) ( not ( = ?auto_106417 ?auto_106419 ) ) ( not ( = ?auto_106417 ?auto_106420 ) ) ( not ( = ?auto_106417 ?auto_106421 ) ) ( not ( = ?auto_106417 ?auto_106422 ) ) ( not ( = ?auto_106418 ?auto_106419 ) ) ( not ( = ?auto_106418 ?auto_106420 ) ) ( not ( = ?auto_106418 ?auto_106421 ) ) ( not ( = ?auto_106418 ?auto_106422 ) ) ( not ( = ?auto_106419 ?auto_106420 ) ) ( not ( = ?auto_106419 ?auto_106421 ) ) ( not ( = ?auto_106419 ?auto_106422 ) ) ( not ( = ?auto_106420 ?auto_106421 ) ) ( not ( = ?auto_106420 ?auto_106422 ) ) ( not ( = ?auto_106421 ?auto_106422 ) ) ( ON ?auto_106422 ?auto_106423 ) ( not ( = ?auto_106417 ?auto_106423 ) ) ( not ( = ?auto_106418 ?auto_106423 ) ) ( not ( = ?auto_106419 ?auto_106423 ) ) ( not ( = ?auto_106420 ?auto_106423 ) ) ( not ( = ?auto_106421 ?auto_106423 ) ) ( not ( = ?auto_106422 ?auto_106423 ) ) ( ON ?auto_106421 ?auto_106422 ) ( ON-TABLE ?auto_106423 ) ( CLEAR ?auto_106419 ) ( ON ?auto_106420 ?auto_106421 ) ( CLEAR ?auto_106420 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_106423 ?auto_106422 ?auto_106421 )
      ( MAKE-6PILE ?auto_106417 ?auto_106418 ?auto_106419 ?auto_106420 ?auto_106421 ?auto_106422 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_106424 - BLOCK
      ?auto_106425 - BLOCK
      ?auto_106426 - BLOCK
      ?auto_106427 - BLOCK
      ?auto_106428 - BLOCK
      ?auto_106429 - BLOCK
    )
    :vars
    (
      ?auto_106430 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_106424 ) ( ON ?auto_106425 ?auto_106424 ) ( not ( = ?auto_106424 ?auto_106425 ) ) ( not ( = ?auto_106424 ?auto_106426 ) ) ( not ( = ?auto_106424 ?auto_106427 ) ) ( not ( = ?auto_106424 ?auto_106428 ) ) ( not ( = ?auto_106424 ?auto_106429 ) ) ( not ( = ?auto_106425 ?auto_106426 ) ) ( not ( = ?auto_106425 ?auto_106427 ) ) ( not ( = ?auto_106425 ?auto_106428 ) ) ( not ( = ?auto_106425 ?auto_106429 ) ) ( not ( = ?auto_106426 ?auto_106427 ) ) ( not ( = ?auto_106426 ?auto_106428 ) ) ( not ( = ?auto_106426 ?auto_106429 ) ) ( not ( = ?auto_106427 ?auto_106428 ) ) ( not ( = ?auto_106427 ?auto_106429 ) ) ( not ( = ?auto_106428 ?auto_106429 ) ) ( ON ?auto_106429 ?auto_106430 ) ( not ( = ?auto_106424 ?auto_106430 ) ) ( not ( = ?auto_106425 ?auto_106430 ) ) ( not ( = ?auto_106426 ?auto_106430 ) ) ( not ( = ?auto_106427 ?auto_106430 ) ) ( not ( = ?auto_106428 ?auto_106430 ) ) ( not ( = ?auto_106429 ?auto_106430 ) ) ( ON ?auto_106428 ?auto_106429 ) ( ON-TABLE ?auto_106430 ) ( ON ?auto_106427 ?auto_106428 ) ( CLEAR ?auto_106427 ) ( HOLDING ?auto_106426 ) ( CLEAR ?auto_106425 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_106424 ?auto_106425 ?auto_106426 )
      ( MAKE-6PILE ?auto_106424 ?auto_106425 ?auto_106426 ?auto_106427 ?auto_106428 ?auto_106429 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_106431 - BLOCK
      ?auto_106432 - BLOCK
      ?auto_106433 - BLOCK
      ?auto_106434 - BLOCK
      ?auto_106435 - BLOCK
      ?auto_106436 - BLOCK
    )
    :vars
    (
      ?auto_106437 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_106431 ) ( ON ?auto_106432 ?auto_106431 ) ( not ( = ?auto_106431 ?auto_106432 ) ) ( not ( = ?auto_106431 ?auto_106433 ) ) ( not ( = ?auto_106431 ?auto_106434 ) ) ( not ( = ?auto_106431 ?auto_106435 ) ) ( not ( = ?auto_106431 ?auto_106436 ) ) ( not ( = ?auto_106432 ?auto_106433 ) ) ( not ( = ?auto_106432 ?auto_106434 ) ) ( not ( = ?auto_106432 ?auto_106435 ) ) ( not ( = ?auto_106432 ?auto_106436 ) ) ( not ( = ?auto_106433 ?auto_106434 ) ) ( not ( = ?auto_106433 ?auto_106435 ) ) ( not ( = ?auto_106433 ?auto_106436 ) ) ( not ( = ?auto_106434 ?auto_106435 ) ) ( not ( = ?auto_106434 ?auto_106436 ) ) ( not ( = ?auto_106435 ?auto_106436 ) ) ( ON ?auto_106436 ?auto_106437 ) ( not ( = ?auto_106431 ?auto_106437 ) ) ( not ( = ?auto_106432 ?auto_106437 ) ) ( not ( = ?auto_106433 ?auto_106437 ) ) ( not ( = ?auto_106434 ?auto_106437 ) ) ( not ( = ?auto_106435 ?auto_106437 ) ) ( not ( = ?auto_106436 ?auto_106437 ) ) ( ON ?auto_106435 ?auto_106436 ) ( ON-TABLE ?auto_106437 ) ( ON ?auto_106434 ?auto_106435 ) ( CLEAR ?auto_106432 ) ( ON ?auto_106433 ?auto_106434 ) ( CLEAR ?auto_106433 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_106437 ?auto_106436 ?auto_106435 ?auto_106434 )
      ( MAKE-6PILE ?auto_106431 ?auto_106432 ?auto_106433 ?auto_106434 ?auto_106435 ?auto_106436 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_106438 - BLOCK
      ?auto_106439 - BLOCK
      ?auto_106440 - BLOCK
      ?auto_106441 - BLOCK
      ?auto_106442 - BLOCK
      ?auto_106443 - BLOCK
    )
    :vars
    (
      ?auto_106444 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_106438 ) ( not ( = ?auto_106438 ?auto_106439 ) ) ( not ( = ?auto_106438 ?auto_106440 ) ) ( not ( = ?auto_106438 ?auto_106441 ) ) ( not ( = ?auto_106438 ?auto_106442 ) ) ( not ( = ?auto_106438 ?auto_106443 ) ) ( not ( = ?auto_106439 ?auto_106440 ) ) ( not ( = ?auto_106439 ?auto_106441 ) ) ( not ( = ?auto_106439 ?auto_106442 ) ) ( not ( = ?auto_106439 ?auto_106443 ) ) ( not ( = ?auto_106440 ?auto_106441 ) ) ( not ( = ?auto_106440 ?auto_106442 ) ) ( not ( = ?auto_106440 ?auto_106443 ) ) ( not ( = ?auto_106441 ?auto_106442 ) ) ( not ( = ?auto_106441 ?auto_106443 ) ) ( not ( = ?auto_106442 ?auto_106443 ) ) ( ON ?auto_106443 ?auto_106444 ) ( not ( = ?auto_106438 ?auto_106444 ) ) ( not ( = ?auto_106439 ?auto_106444 ) ) ( not ( = ?auto_106440 ?auto_106444 ) ) ( not ( = ?auto_106441 ?auto_106444 ) ) ( not ( = ?auto_106442 ?auto_106444 ) ) ( not ( = ?auto_106443 ?auto_106444 ) ) ( ON ?auto_106442 ?auto_106443 ) ( ON-TABLE ?auto_106444 ) ( ON ?auto_106441 ?auto_106442 ) ( ON ?auto_106440 ?auto_106441 ) ( CLEAR ?auto_106440 ) ( HOLDING ?auto_106439 ) ( CLEAR ?auto_106438 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_106438 ?auto_106439 )
      ( MAKE-6PILE ?auto_106438 ?auto_106439 ?auto_106440 ?auto_106441 ?auto_106442 ?auto_106443 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_106445 - BLOCK
      ?auto_106446 - BLOCK
      ?auto_106447 - BLOCK
      ?auto_106448 - BLOCK
      ?auto_106449 - BLOCK
      ?auto_106450 - BLOCK
    )
    :vars
    (
      ?auto_106451 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_106445 ) ( not ( = ?auto_106445 ?auto_106446 ) ) ( not ( = ?auto_106445 ?auto_106447 ) ) ( not ( = ?auto_106445 ?auto_106448 ) ) ( not ( = ?auto_106445 ?auto_106449 ) ) ( not ( = ?auto_106445 ?auto_106450 ) ) ( not ( = ?auto_106446 ?auto_106447 ) ) ( not ( = ?auto_106446 ?auto_106448 ) ) ( not ( = ?auto_106446 ?auto_106449 ) ) ( not ( = ?auto_106446 ?auto_106450 ) ) ( not ( = ?auto_106447 ?auto_106448 ) ) ( not ( = ?auto_106447 ?auto_106449 ) ) ( not ( = ?auto_106447 ?auto_106450 ) ) ( not ( = ?auto_106448 ?auto_106449 ) ) ( not ( = ?auto_106448 ?auto_106450 ) ) ( not ( = ?auto_106449 ?auto_106450 ) ) ( ON ?auto_106450 ?auto_106451 ) ( not ( = ?auto_106445 ?auto_106451 ) ) ( not ( = ?auto_106446 ?auto_106451 ) ) ( not ( = ?auto_106447 ?auto_106451 ) ) ( not ( = ?auto_106448 ?auto_106451 ) ) ( not ( = ?auto_106449 ?auto_106451 ) ) ( not ( = ?auto_106450 ?auto_106451 ) ) ( ON ?auto_106449 ?auto_106450 ) ( ON-TABLE ?auto_106451 ) ( ON ?auto_106448 ?auto_106449 ) ( ON ?auto_106447 ?auto_106448 ) ( CLEAR ?auto_106445 ) ( ON ?auto_106446 ?auto_106447 ) ( CLEAR ?auto_106446 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_106451 ?auto_106450 ?auto_106449 ?auto_106448 ?auto_106447 )
      ( MAKE-6PILE ?auto_106445 ?auto_106446 ?auto_106447 ?auto_106448 ?auto_106449 ?auto_106450 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_106452 - BLOCK
      ?auto_106453 - BLOCK
      ?auto_106454 - BLOCK
      ?auto_106455 - BLOCK
      ?auto_106456 - BLOCK
      ?auto_106457 - BLOCK
    )
    :vars
    (
      ?auto_106458 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106452 ?auto_106453 ) ) ( not ( = ?auto_106452 ?auto_106454 ) ) ( not ( = ?auto_106452 ?auto_106455 ) ) ( not ( = ?auto_106452 ?auto_106456 ) ) ( not ( = ?auto_106452 ?auto_106457 ) ) ( not ( = ?auto_106453 ?auto_106454 ) ) ( not ( = ?auto_106453 ?auto_106455 ) ) ( not ( = ?auto_106453 ?auto_106456 ) ) ( not ( = ?auto_106453 ?auto_106457 ) ) ( not ( = ?auto_106454 ?auto_106455 ) ) ( not ( = ?auto_106454 ?auto_106456 ) ) ( not ( = ?auto_106454 ?auto_106457 ) ) ( not ( = ?auto_106455 ?auto_106456 ) ) ( not ( = ?auto_106455 ?auto_106457 ) ) ( not ( = ?auto_106456 ?auto_106457 ) ) ( ON ?auto_106457 ?auto_106458 ) ( not ( = ?auto_106452 ?auto_106458 ) ) ( not ( = ?auto_106453 ?auto_106458 ) ) ( not ( = ?auto_106454 ?auto_106458 ) ) ( not ( = ?auto_106455 ?auto_106458 ) ) ( not ( = ?auto_106456 ?auto_106458 ) ) ( not ( = ?auto_106457 ?auto_106458 ) ) ( ON ?auto_106456 ?auto_106457 ) ( ON-TABLE ?auto_106458 ) ( ON ?auto_106455 ?auto_106456 ) ( ON ?auto_106454 ?auto_106455 ) ( ON ?auto_106453 ?auto_106454 ) ( CLEAR ?auto_106453 ) ( HOLDING ?auto_106452 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_106452 )
      ( MAKE-6PILE ?auto_106452 ?auto_106453 ?auto_106454 ?auto_106455 ?auto_106456 ?auto_106457 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_106459 - BLOCK
      ?auto_106460 - BLOCK
      ?auto_106461 - BLOCK
      ?auto_106462 - BLOCK
      ?auto_106463 - BLOCK
      ?auto_106464 - BLOCK
    )
    :vars
    (
      ?auto_106465 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106459 ?auto_106460 ) ) ( not ( = ?auto_106459 ?auto_106461 ) ) ( not ( = ?auto_106459 ?auto_106462 ) ) ( not ( = ?auto_106459 ?auto_106463 ) ) ( not ( = ?auto_106459 ?auto_106464 ) ) ( not ( = ?auto_106460 ?auto_106461 ) ) ( not ( = ?auto_106460 ?auto_106462 ) ) ( not ( = ?auto_106460 ?auto_106463 ) ) ( not ( = ?auto_106460 ?auto_106464 ) ) ( not ( = ?auto_106461 ?auto_106462 ) ) ( not ( = ?auto_106461 ?auto_106463 ) ) ( not ( = ?auto_106461 ?auto_106464 ) ) ( not ( = ?auto_106462 ?auto_106463 ) ) ( not ( = ?auto_106462 ?auto_106464 ) ) ( not ( = ?auto_106463 ?auto_106464 ) ) ( ON ?auto_106464 ?auto_106465 ) ( not ( = ?auto_106459 ?auto_106465 ) ) ( not ( = ?auto_106460 ?auto_106465 ) ) ( not ( = ?auto_106461 ?auto_106465 ) ) ( not ( = ?auto_106462 ?auto_106465 ) ) ( not ( = ?auto_106463 ?auto_106465 ) ) ( not ( = ?auto_106464 ?auto_106465 ) ) ( ON ?auto_106463 ?auto_106464 ) ( ON-TABLE ?auto_106465 ) ( ON ?auto_106462 ?auto_106463 ) ( ON ?auto_106461 ?auto_106462 ) ( ON ?auto_106460 ?auto_106461 ) ( ON ?auto_106459 ?auto_106460 ) ( CLEAR ?auto_106459 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_106465 ?auto_106464 ?auto_106463 ?auto_106462 ?auto_106461 ?auto_106460 )
      ( MAKE-6PILE ?auto_106459 ?auto_106460 ?auto_106461 ?auto_106462 ?auto_106463 ?auto_106464 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_106472 - BLOCK
      ?auto_106473 - BLOCK
      ?auto_106474 - BLOCK
      ?auto_106475 - BLOCK
      ?auto_106476 - BLOCK
      ?auto_106477 - BLOCK
    )
    :vars
    (
      ?auto_106478 - BLOCK
      ?auto_106479 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106472 ?auto_106473 ) ) ( not ( = ?auto_106472 ?auto_106474 ) ) ( not ( = ?auto_106472 ?auto_106475 ) ) ( not ( = ?auto_106472 ?auto_106476 ) ) ( not ( = ?auto_106472 ?auto_106477 ) ) ( not ( = ?auto_106473 ?auto_106474 ) ) ( not ( = ?auto_106473 ?auto_106475 ) ) ( not ( = ?auto_106473 ?auto_106476 ) ) ( not ( = ?auto_106473 ?auto_106477 ) ) ( not ( = ?auto_106474 ?auto_106475 ) ) ( not ( = ?auto_106474 ?auto_106476 ) ) ( not ( = ?auto_106474 ?auto_106477 ) ) ( not ( = ?auto_106475 ?auto_106476 ) ) ( not ( = ?auto_106475 ?auto_106477 ) ) ( not ( = ?auto_106476 ?auto_106477 ) ) ( ON ?auto_106477 ?auto_106478 ) ( not ( = ?auto_106472 ?auto_106478 ) ) ( not ( = ?auto_106473 ?auto_106478 ) ) ( not ( = ?auto_106474 ?auto_106478 ) ) ( not ( = ?auto_106475 ?auto_106478 ) ) ( not ( = ?auto_106476 ?auto_106478 ) ) ( not ( = ?auto_106477 ?auto_106478 ) ) ( ON ?auto_106476 ?auto_106477 ) ( ON-TABLE ?auto_106478 ) ( ON ?auto_106475 ?auto_106476 ) ( ON ?auto_106474 ?auto_106475 ) ( ON ?auto_106473 ?auto_106474 ) ( CLEAR ?auto_106473 ) ( ON ?auto_106472 ?auto_106479 ) ( CLEAR ?auto_106472 ) ( HAND-EMPTY ) ( not ( = ?auto_106472 ?auto_106479 ) ) ( not ( = ?auto_106473 ?auto_106479 ) ) ( not ( = ?auto_106474 ?auto_106479 ) ) ( not ( = ?auto_106475 ?auto_106479 ) ) ( not ( = ?auto_106476 ?auto_106479 ) ) ( not ( = ?auto_106477 ?auto_106479 ) ) ( not ( = ?auto_106478 ?auto_106479 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_106472 ?auto_106479 )
      ( MAKE-6PILE ?auto_106472 ?auto_106473 ?auto_106474 ?auto_106475 ?auto_106476 ?auto_106477 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_106480 - BLOCK
      ?auto_106481 - BLOCK
      ?auto_106482 - BLOCK
      ?auto_106483 - BLOCK
      ?auto_106484 - BLOCK
      ?auto_106485 - BLOCK
    )
    :vars
    (
      ?auto_106487 - BLOCK
      ?auto_106486 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106480 ?auto_106481 ) ) ( not ( = ?auto_106480 ?auto_106482 ) ) ( not ( = ?auto_106480 ?auto_106483 ) ) ( not ( = ?auto_106480 ?auto_106484 ) ) ( not ( = ?auto_106480 ?auto_106485 ) ) ( not ( = ?auto_106481 ?auto_106482 ) ) ( not ( = ?auto_106481 ?auto_106483 ) ) ( not ( = ?auto_106481 ?auto_106484 ) ) ( not ( = ?auto_106481 ?auto_106485 ) ) ( not ( = ?auto_106482 ?auto_106483 ) ) ( not ( = ?auto_106482 ?auto_106484 ) ) ( not ( = ?auto_106482 ?auto_106485 ) ) ( not ( = ?auto_106483 ?auto_106484 ) ) ( not ( = ?auto_106483 ?auto_106485 ) ) ( not ( = ?auto_106484 ?auto_106485 ) ) ( ON ?auto_106485 ?auto_106487 ) ( not ( = ?auto_106480 ?auto_106487 ) ) ( not ( = ?auto_106481 ?auto_106487 ) ) ( not ( = ?auto_106482 ?auto_106487 ) ) ( not ( = ?auto_106483 ?auto_106487 ) ) ( not ( = ?auto_106484 ?auto_106487 ) ) ( not ( = ?auto_106485 ?auto_106487 ) ) ( ON ?auto_106484 ?auto_106485 ) ( ON-TABLE ?auto_106487 ) ( ON ?auto_106483 ?auto_106484 ) ( ON ?auto_106482 ?auto_106483 ) ( ON ?auto_106480 ?auto_106486 ) ( CLEAR ?auto_106480 ) ( not ( = ?auto_106480 ?auto_106486 ) ) ( not ( = ?auto_106481 ?auto_106486 ) ) ( not ( = ?auto_106482 ?auto_106486 ) ) ( not ( = ?auto_106483 ?auto_106486 ) ) ( not ( = ?auto_106484 ?auto_106486 ) ) ( not ( = ?auto_106485 ?auto_106486 ) ) ( not ( = ?auto_106487 ?auto_106486 ) ) ( HOLDING ?auto_106481 ) ( CLEAR ?auto_106482 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_106487 ?auto_106485 ?auto_106484 ?auto_106483 ?auto_106482 ?auto_106481 )
      ( MAKE-6PILE ?auto_106480 ?auto_106481 ?auto_106482 ?auto_106483 ?auto_106484 ?auto_106485 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_106488 - BLOCK
      ?auto_106489 - BLOCK
      ?auto_106490 - BLOCK
      ?auto_106491 - BLOCK
      ?auto_106492 - BLOCK
      ?auto_106493 - BLOCK
    )
    :vars
    (
      ?auto_106495 - BLOCK
      ?auto_106494 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106488 ?auto_106489 ) ) ( not ( = ?auto_106488 ?auto_106490 ) ) ( not ( = ?auto_106488 ?auto_106491 ) ) ( not ( = ?auto_106488 ?auto_106492 ) ) ( not ( = ?auto_106488 ?auto_106493 ) ) ( not ( = ?auto_106489 ?auto_106490 ) ) ( not ( = ?auto_106489 ?auto_106491 ) ) ( not ( = ?auto_106489 ?auto_106492 ) ) ( not ( = ?auto_106489 ?auto_106493 ) ) ( not ( = ?auto_106490 ?auto_106491 ) ) ( not ( = ?auto_106490 ?auto_106492 ) ) ( not ( = ?auto_106490 ?auto_106493 ) ) ( not ( = ?auto_106491 ?auto_106492 ) ) ( not ( = ?auto_106491 ?auto_106493 ) ) ( not ( = ?auto_106492 ?auto_106493 ) ) ( ON ?auto_106493 ?auto_106495 ) ( not ( = ?auto_106488 ?auto_106495 ) ) ( not ( = ?auto_106489 ?auto_106495 ) ) ( not ( = ?auto_106490 ?auto_106495 ) ) ( not ( = ?auto_106491 ?auto_106495 ) ) ( not ( = ?auto_106492 ?auto_106495 ) ) ( not ( = ?auto_106493 ?auto_106495 ) ) ( ON ?auto_106492 ?auto_106493 ) ( ON-TABLE ?auto_106495 ) ( ON ?auto_106491 ?auto_106492 ) ( ON ?auto_106490 ?auto_106491 ) ( ON ?auto_106488 ?auto_106494 ) ( not ( = ?auto_106488 ?auto_106494 ) ) ( not ( = ?auto_106489 ?auto_106494 ) ) ( not ( = ?auto_106490 ?auto_106494 ) ) ( not ( = ?auto_106491 ?auto_106494 ) ) ( not ( = ?auto_106492 ?auto_106494 ) ) ( not ( = ?auto_106493 ?auto_106494 ) ) ( not ( = ?auto_106495 ?auto_106494 ) ) ( CLEAR ?auto_106490 ) ( ON ?auto_106489 ?auto_106488 ) ( CLEAR ?auto_106489 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_106494 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_106494 ?auto_106488 )
      ( MAKE-6PILE ?auto_106488 ?auto_106489 ?auto_106490 ?auto_106491 ?auto_106492 ?auto_106493 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_106496 - BLOCK
      ?auto_106497 - BLOCK
      ?auto_106498 - BLOCK
      ?auto_106499 - BLOCK
      ?auto_106500 - BLOCK
      ?auto_106501 - BLOCK
    )
    :vars
    (
      ?auto_106502 - BLOCK
      ?auto_106503 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106496 ?auto_106497 ) ) ( not ( = ?auto_106496 ?auto_106498 ) ) ( not ( = ?auto_106496 ?auto_106499 ) ) ( not ( = ?auto_106496 ?auto_106500 ) ) ( not ( = ?auto_106496 ?auto_106501 ) ) ( not ( = ?auto_106497 ?auto_106498 ) ) ( not ( = ?auto_106497 ?auto_106499 ) ) ( not ( = ?auto_106497 ?auto_106500 ) ) ( not ( = ?auto_106497 ?auto_106501 ) ) ( not ( = ?auto_106498 ?auto_106499 ) ) ( not ( = ?auto_106498 ?auto_106500 ) ) ( not ( = ?auto_106498 ?auto_106501 ) ) ( not ( = ?auto_106499 ?auto_106500 ) ) ( not ( = ?auto_106499 ?auto_106501 ) ) ( not ( = ?auto_106500 ?auto_106501 ) ) ( ON ?auto_106501 ?auto_106502 ) ( not ( = ?auto_106496 ?auto_106502 ) ) ( not ( = ?auto_106497 ?auto_106502 ) ) ( not ( = ?auto_106498 ?auto_106502 ) ) ( not ( = ?auto_106499 ?auto_106502 ) ) ( not ( = ?auto_106500 ?auto_106502 ) ) ( not ( = ?auto_106501 ?auto_106502 ) ) ( ON ?auto_106500 ?auto_106501 ) ( ON-TABLE ?auto_106502 ) ( ON ?auto_106499 ?auto_106500 ) ( ON ?auto_106496 ?auto_106503 ) ( not ( = ?auto_106496 ?auto_106503 ) ) ( not ( = ?auto_106497 ?auto_106503 ) ) ( not ( = ?auto_106498 ?auto_106503 ) ) ( not ( = ?auto_106499 ?auto_106503 ) ) ( not ( = ?auto_106500 ?auto_106503 ) ) ( not ( = ?auto_106501 ?auto_106503 ) ) ( not ( = ?auto_106502 ?auto_106503 ) ) ( ON ?auto_106497 ?auto_106496 ) ( CLEAR ?auto_106497 ) ( ON-TABLE ?auto_106503 ) ( HOLDING ?auto_106498 ) ( CLEAR ?auto_106499 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_106502 ?auto_106501 ?auto_106500 ?auto_106499 ?auto_106498 )
      ( MAKE-6PILE ?auto_106496 ?auto_106497 ?auto_106498 ?auto_106499 ?auto_106500 ?auto_106501 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_106504 - BLOCK
      ?auto_106505 - BLOCK
      ?auto_106506 - BLOCK
      ?auto_106507 - BLOCK
      ?auto_106508 - BLOCK
      ?auto_106509 - BLOCK
    )
    :vars
    (
      ?auto_106511 - BLOCK
      ?auto_106510 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106504 ?auto_106505 ) ) ( not ( = ?auto_106504 ?auto_106506 ) ) ( not ( = ?auto_106504 ?auto_106507 ) ) ( not ( = ?auto_106504 ?auto_106508 ) ) ( not ( = ?auto_106504 ?auto_106509 ) ) ( not ( = ?auto_106505 ?auto_106506 ) ) ( not ( = ?auto_106505 ?auto_106507 ) ) ( not ( = ?auto_106505 ?auto_106508 ) ) ( not ( = ?auto_106505 ?auto_106509 ) ) ( not ( = ?auto_106506 ?auto_106507 ) ) ( not ( = ?auto_106506 ?auto_106508 ) ) ( not ( = ?auto_106506 ?auto_106509 ) ) ( not ( = ?auto_106507 ?auto_106508 ) ) ( not ( = ?auto_106507 ?auto_106509 ) ) ( not ( = ?auto_106508 ?auto_106509 ) ) ( ON ?auto_106509 ?auto_106511 ) ( not ( = ?auto_106504 ?auto_106511 ) ) ( not ( = ?auto_106505 ?auto_106511 ) ) ( not ( = ?auto_106506 ?auto_106511 ) ) ( not ( = ?auto_106507 ?auto_106511 ) ) ( not ( = ?auto_106508 ?auto_106511 ) ) ( not ( = ?auto_106509 ?auto_106511 ) ) ( ON ?auto_106508 ?auto_106509 ) ( ON-TABLE ?auto_106511 ) ( ON ?auto_106507 ?auto_106508 ) ( ON ?auto_106504 ?auto_106510 ) ( not ( = ?auto_106504 ?auto_106510 ) ) ( not ( = ?auto_106505 ?auto_106510 ) ) ( not ( = ?auto_106506 ?auto_106510 ) ) ( not ( = ?auto_106507 ?auto_106510 ) ) ( not ( = ?auto_106508 ?auto_106510 ) ) ( not ( = ?auto_106509 ?auto_106510 ) ) ( not ( = ?auto_106511 ?auto_106510 ) ) ( ON ?auto_106505 ?auto_106504 ) ( ON-TABLE ?auto_106510 ) ( CLEAR ?auto_106507 ) ( ON ?auto_106506 ?auto_106505 ) ( CLEAR ?auto_106506 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_106510 ?auto_106504 ?auto_106505 )
      ( MAKE-6PILE ?auto_106504 ?auto_106505 ?auto_106506 ?auto_106507 ?auto_106508 ?auto_106509 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_106512 - BLOCK
      ?auto_106513 - BLOCK
      ?auto_106514 - BLOCK
      ?auto_106515 - BLOCK
      ?auto_106516 - BLOCK
      ?auto_106517 - BLOCK
    )
    :vars
    (
      ?auto_106519 - BLOCK
      ?auto_106518 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106512 ?auto_106513 ) ) ( not ( = ?auto_106512 ?auto_106514 ) ) ( not ( = ?auto_106512 ?auto_106515 ) ) ( not ( = ?auto_106512 ?auto_106516 ) ) ( not ( = ?auto_106512 ?auto_106517 ) ) ( not ( = ?auto_106513 ?auto_106514 ) ) ( not ( = ?auto_106513 ?auto_106515 ) ) ( not ( = ?auto_106513 ?auto_106516 ) ) ( not ( = ?auto_106513 ?auto_106517 ) ) ( not ( = ?auto_106514 ?auto_106515 ) ) ( not ( = ?auto_106514 ?auto_106516 ) ) ( not ( = ?auto_106514 ?auto_106517 ) ) ( not ( = ?auto_106515 ?auto_106516 ) ) ( not ( = ?auto_106515 ?auto_106517 ) ) ( not ( = ?auto_106516 ?auto_106517 ) ) ( ON ?auto_106517 ?auto_106519 ) ( not ( = ?auto_106512 ?auto_106519 ) ) ( not ( = ?auto_106513 ?auto_106519 ) ) ( not ( = ?auto_106514 ?auto_106519 ) ) ( not ( = ?auto_106515 ?auto_106519 ) ) ( not ( = ?auto_106516 ?auto_106519 ) ) ( not ( = ?auto_106517 ?auto_106519 ) ) ( ON ?auto_106516 ?auto_106517 ) ( ON-TABLE ?auto_106519 ) ( ON ?auto_106512 ?auto_106518 ) ( not ( = ?auto_106512 ?auto_106518 ) ) ( not ( = ?auto_106513 ?auto_106518 ) ) ( not ( = ?auto_106514 ?auto_106518 ) ) ( not ( = ?auto_106515 ?auto_106518 ) ) ( not ( = ?auto_106516 ?auto_106518 ) ) ( not ( = ?auto_106517 ?auto_106518 ) ) ( not ( = ?auto_106519 ?auto_106518 ) ) ( ON ?auto_106513 ?auto_106512 ) ( ON-TABLE ?auto_106518 ) ( ON ?auto_106514 ?auto_106513 ) ( CLEAR ?auto_106514 ) ( HOLDING ?auto_106515 ) ( CLEAR ?auto_106516 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_106519 ?auto_106517 ?auto_106516 ?auto_106515 )
      ( MAKE-6PILE ?auto_106512 ?auto_106513 ?auto_106514 ?auto_106515 ?auto_106516 ?auto_106517 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_106520 - BLOCK
      ?auto_106521 - BLOCK
      ?auto_106522 - BLOCK
      ?auto_106523 - BLOCK
      ?auto_106524 - BLOCK
      ?auto_106525 - BLOCK
    )
    :vars
    (
      ?auto_106527 - BLOCK
      ?auto_106526 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106520 ?auto_106521 ) ) ( not ( = ?auto_106520 ?auto_106522 ) ) ( not ( = ?auto_106520 ?auto_106523 ) ) ( not ( = ?auto_106520 ?auto_106524 ) ) ( not ( = ?auto_106520 ?auto_106525 ) ) ( not ( = ?auto_106521 ?auto_106522 ) ) ( not ( = ?auto_106521 ?auto_106523 ) ) ( not ( = ?auto_106521 ?auto_106524 ) ) ( not ( = ?auto_106521 ?auto_106525 ) ) ( not ( = ?auto_106522 ?auto_106523 ) ) ( not ( = ?auto_106522 ?auto_106524 ) ) ( not ( = ?auto_106522 ?auto_106525 ) ) ( not ( = ?auto_106523 ?auto_106524 ) ) ( not ( = ?auto_106523 ?auto_106525 ) ) ( not ( = ?auto_106524 ?auto_106525 ) ) ( ON ?auto_106525 ?auto_106527 ) ( not ( = ?auto_106520 ?auto_106527 ) ) ( not ( = ?auto_106521 ?auto_106527 ) ) ( not ( = ?auto_106522 ?auto_106527 ) ) ( not ( = ?auto_106523 ?auto_106527 ) ) ( not ( = ?auto_106524 ?auto_106527 ) ) ( not ( = ?auto_106525 ?auto_106527 ) ) ( ON ?auto_106524 ?auto_106525 ) ( ON-TABLE ?auto_106527 ) ( ON ?auto_106520 ?auto_106526 ) ( not ( = ?auto_106520 ?auto_106526 ) ) ( not ( = ?auto_106521 ?auto_106526 ) ) ( not ( = ?auto_106522 ?auto_106526 ) ) ( not ( = ?auto_106523 ?auto_106526 ) ) ( not ( = ?auto_106524 ?auto_106526 ) ) ( not ( = ?auto_106525 ?auto_106526 ) ) ( not ( = ?auto_106527 ?auto_106526 ) ) ( ON ?auto_106521 ?auto_106520 ) ( ON-TABLE ?auto_106526 ) ( ON ?auto_106522 ?auto_106521 ) ( CLEAR ?auto_106524 ) ( ON ?auto_106523 ?auto_106522 ) ( CLEAR ?auto_106523 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_106526 ?auto_106520 ?auto_106521 ?auto_106522 )
      ( MAKE-6PILE ?auto_106520 ?auto_106521 ?auto_106522 ?auto_106523 ?auto_106524 ?auto_106525 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_106528 - BLOCK
      ?auto_106529 - BLOCK
      ?auto_106530 - BLOCK
      ?auto_106531 - BLOCK
      ?auto_106532 - BLOCK
      ?auto_106533 - BLOCK
    )
    :vars
    (
      ?auto_106535 - BLOCK
      ?auto_106534 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106528 ?auto_106529 ) ) ( not ( = ?auto_106528 ?auto_106530 ) ) ( not ( = ?auto_106528 ?auto_106531 ) ) ( not ( = ?auto_106528 ?auto_106532 ) ) ( not ( = ?auto_106528 ?auto_106533 ) ) ( not ( = ?auto_106529 ?auto_106530 ) ) ( not ( = ?auto_106529 ?auto_106531 ) ) ( not ( = ?auto_106529 ?auto_106532 ) ) ( not ( = ?auto_106529 ?auto_106533 ) ) ( not ( = ?auto_106530 ?auto_106531 ) ) ( not ( = ?auto_106530 ?auto_106532 ) ) ( not ( = ?auto_106530 ?auto_106533 ) ) ( not ( = ?auto_106531 ?auto_106532 ) ) ( not ( = ?auto_106531 ?auto_106533 ) ) ( not ( = ?auto_106532 ?auto_106533 ) ) ( ON ?auto_106533 ?auto_106535 ) ( not ( = ?auto_106528 ?auto_106535 ) ) ( not ( = ?auto_106529 ?auto_106535 ) ) ( not ( = ?auto_106530 ?auto_106535 ) ) ( not ( = ?auto_106531 ?auto_106535 ) ) ( not ( = ?auto_106532 ?auto_106535 ) ) ( not ( = ?auto_106533 ?auto_106535 ) ) ( ON-TABLE ?auto_106535 ) ( ON ?auto_106528 ?auto_106534 ) ( not ( = ?auto_106528 ?auto_106534 ) ) ( not ( = ?auto_106529 ?auto_106534 ) ) ( not ( = ?auto_106530 ?auto_106534 ) ) ( not ( = ?auto_106531 ?auto_106534 ) ) ( not ( = ?auto_106532 ?auto_106534 ) ) ( not ( = ?auto_106533 ?auto_106534 ) ) ( not ( = ?auto_106535 ?auto_106534 ) ) ( ON ?auto_106529 ?auto_106528 ) ( ON-TABLE ?auto_106534 ) ( ON ?auto_106530 ?auto_106529 ) ( ON ?auto_106531 ?auto_106530 ) ( CLEAR ?auto_106531 ) ( HOLDING ?auto_106532 ) ( CLEAR ?auto_106533 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_106535 ?auto_106533 ?auto_106532 )
      ( MAKE-6PILE ?auto_106528 ?auto_106529 ?auto_106530 ?auto_106531 ?auto_106532 ?auto_106533 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_106536 - BLOCK
      ?auto_106537 - BLOCK
      ?auto_106538 - BLOCK
      ?auto_106539 - BLOCK
      ?auto_106540 - BLOCK
      ?auto_106541 - BLOCK
    )
    :vars
    (
      ?auto_106542 - BLOCK
      ?auto_106543 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106536 ?auto_106537 ) ) ( not ( = ?auto_106536 ?auto_106538 ) ) ( not ( = ?auto_106536 ?auto_106539 ) ) ( not ( = ?auto_106536 ?auto_106540 ) ) ( not ( = ?auto_106536 ?auto_106541 ) ) ( not ( = ?auto_106537 ?auto_106538 ) ) ( not ( = ?auto_106537 ?auto_106539 ) ) ( not ( = ?auto_106537 ?auto_106540 ) ) ( not ( = ?auto_106537 ?auto_106541 ) ) ( not ( = ?auto_106538 ?auto_106539 ) ) ( not ( = ?auto_106538 ?auto_106540 ) ) ( not ( = ?auto_106538 ?auto_106541 ) ) ( not ( = ?auto_106539 ?auto_106540 ) ) ( not ( = ?auto_106539 ?auto_106541 ) ) ( not ( = ?auto_106540 ?auto_106541 ) ) ( ON ?auto_106541 ?auto_106542 ) ( not ( = ?auto_106536 ?auto_106542 ) ) ( not ( = ?auto_106537 ?auto_106542 ) ) ( not ( = ?auto_106538 ?auto_106542 ) ) ( not ( = ?auto_106539 ?auto_106542 ) ) ( not ( = ?auto_106540 ?auto_106542 ) ) ( not ( = ?auto_106541 ?auto_106542 ) ) ( ON-TABLE ?auto_106542 ) ( ON ?auto_106536 ?auto_106543 ) ( not ( = ?auto_106536 ?auto_106543 ) ) ( not ( = ?auto_106537 ?auto_106543 ) ) ( not ( = ?auto_106538 ?auto_106543 ) ) ( not ( = ?auto_106539 ?auto_106543 ) ) ( not ( = ?auto_106540 ?auto_106543 ) ) ( not ( = ?auto_106541 ?auto_106543 ) ) ( not ( = ?auto_106542 ?auto_106543 ) ) ( ON ?auto_106537 ?auto_106536 ) ( ON-TABLE ?auto_106543 ) ( ON ?auto_106538 ?auto_106537 ) ( ON ?auto_106539 ?auto_106538 ) ( CLEAR ?auto_106541 ) ( ON ?auto_106540 ?auto_106539 ) ( CLEAR ?auto_106540 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_106543 ?auto_106536 ?auto_106537 ?auto_106538 ?auto_106539 )
      ( MAKE-6PILE ?auto_106536 ?auto_106537 ?auto_106538 ?auto_106539 ?auto_106540 ?auto_106541 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_106544 - BLOCK
      ?auto_106545 - BLOCK
      ?auto_106546 - BLOCK
      ?auto_106547 - BLOCK
      ?auto_106548 - BLOCK
      ?auto_106549 - BLOCK
    )
    :vars
    (
      ?auto_106550 - BLOCK
      ?auto_106551 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106544 ?auto_106545 ) ) ( not ( = ?auto_106544 ?auto_106546 ) ) ( not ( = ?auto_106544 ?auto_106547 ) ) ( not ( = ?auto_106544 ?auto_106548 ) ) ( not ( = ?auto_106544 ?auto_106549 ) ) ( not ( = ?auto_106545 ?auto_106546 ) ) ( not ( = ?auto_106545 ?auto_106547 ) ) ( not ( = ?auto_106545 ?auto_106548 ) ) ( not ( = ?auto_106545 ?auto_106549 ) ) ( not ( = ?auto_106546 ?auto_106547 ) ) ( not ( = ?auto_106546 ?auto_106548 ) ) ( not ( = ?auto_106546 ?auto_106549 ) ) ( not ( = ?auto_106547 ?auto_106548 ) ) ( not ( = ?auto_106547 ?auto_106549 ) ) ( not ( = ?auto_106548 ?auto_106549 ) ) ( not ( = ?auto_106544 ?auto_106550 ) ) ( not ( = ?auto_106545 ?auto_106550 ) ) ( not ( = ?auto_106546 ?auto_106550 ) ) ( not ( = ?auto_106547 ?auto_106550 ) ) ( not ( = ?auto_106548 ?auto_106550 ) ) ( not ( = ?auto_106549 ?auto_106550 ) ) ( ON-TABLE ?auto_106550 ) ( ON ?auto_106544 ?auto_106551 ) ( not ( = ?auto_106544 ?auto_106551 ) ) ( not ( = ?auto_106545 ?auto_106551 ) ) ( not ( = ?auto_106546 ?auto_106551 ) ) ( not ( = ?auto_106547 ?auto_106551 ) ) ( not ( = ?auto_106548 ?auto_106551 ) ) ( not ( = ?auto_106549 ?auto_106551 ) ) ( not ( = ?auto_106550 ?auto_106551 ) ) ( ON ?auto_106545 ?auto_106544 ) ( ON-TABLE ?auto_106551 ) ( ON ?auto_106546 ?auto_106545 ) ( ON ?auto_106547 ?auto_106546 ) ( ON ?auto_106548 ?auto_106547 ) ( CLEAR ?auto_106548 ) ( HOLDING ?auto_106549 ) ( CLEAR ?auto_106550 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_106550 ?auto_106549 )
      ( MAKE-6PILE ?auto_106544 ?auto_106545 ?auto_106546 ?auto_106547 ?auto_106548 ?auto_106549 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_106552 - BLOCK
      ?auto_106553 - BLOCK
      ?auto_106554 - BLOCK
      ?auto_106555 - BLOCK
      ?auto_106556 - BLOCK
      ?auto_106557 - BLOCK
    )
    :vars
    (
      ?auto_106559 - BLOCK
      ?auto_106558 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106552 ?auto_106553 ) ) ( not ( = ?auto_106552 ?auto_106554 ) ) ( not ( = ?auto_106552 ?auto_106555 ) ) ( not ( = ?auto_106552 ?auto_106556 ) ) ( not ( = ?auto_106552 ?auto_106557 ) ) ( not ( = ?auto_106553 ?auto_106554 ) ) ( not ( = ?auto_106553 ?auto_106555 ) ) ( not ( = ?auto_106553 ?auto_106556 ) ) ( not ( = ?auto_106553 ?auto_106557 ) ) ( not ( = ?auto_106554 ?auto_106555 ) ) ( not ( = ?auto_106554 ?auto_106556 ) ) ( not ( = ?auto_106554 ?auto_106557 ) ) ( not ( = ?auto_106555 ?auto_106556 ) ) ( not ( = ?auto_106555 ?auto_106557 ) ) ( not ( = ?auto_106556 ?auto_106557 ) ) ( not ( = ?auto_106552 ?auto_106559 ) ) ( not ( = ?auto_106553 ?auto_106559 ) ) ( not ( = ?auto_106554 ?auto_106559 ) ) ( not ( = ?auto_106555 ?auto_106559 ) ) ( not ( = ?auto_106556 ?auto_106559 ) ) ( not ( = ?auto_106557 ?auto_106559 ) ) ( ON-TABLE ?auto_106559 ) ( ON ?auto_106552 ?auto_106558 ) ( not ( = ?auto_106552 ?auto_106558 ) ) ( not ( = ?auto_106553 ?auto_106558 ) ) ( not ( = ?auto_106554 ?auto_106558 ) ) ( not ( = ?auto_106555 ?auto_106558 ) ) ( not ( = ?auto_106556 ?auto_106558 ) ) ( not ( = ?auto_106557 ?auto_106558 ) ) ( not ( = ?auto_106559 ?auto_106558 ) ) ( ON ?auto_106553 ?auto_106552 ) ( ON-TABLE ?auto_106558 ) ( ON ?auto_106554 ?auto_106553 ) ( ON ?auto_106555 ?auto_106554 ) ( ON ?auto_106556 ?auto_106555 ) ( CLEAR ?auto_106559 ) ( ON ?auto_106557 ?auto_106556 ) ( CLEAR ?auto_106557 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_106558 ?auto_106552 ?auto_106553 ?auto_106554 ?auto_106555 ?auto_106556 )
      ( MAKE-6PILE ?auto_106552 ?auto_106553 ?auto_106554 ?auto_106555 ?auto_106556 ?auto_106557 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_106560 - BLOCK
      ?auto_106561 - BLOCK
      ?auto_106562 - BLOCK
      ?auto_106563 - BLOCK
      ?auto_106564 - BLOCK
      ?auto_106565 - BLOCK
    )
    :vars
    (
      ?auto_106566 - BLOCK
      ?auto_106567 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106560 ?auto_106561 ) ) ( not ( = ?auto_106560 ?auto_106562 ) ) ( not ( = ?auto_106560 ?auto_106563 ) ) ( not ( = ?auto_106560 ?auto_106564 ) ) ( not ( = ?auto_106560 ?auto_106565 ) ) ( not ( = ?auto_106561 ?auto_106562 ) ) ( not ( = ?auto_106561 ?auto_106563 ) ) ( not ( = ?auto_106561 ?auto_106564 ) ) ( not ( = ?auto_106561 ?auto_106565 ) ) ( not ( = ?auto_106562 ?auto_106563 ) ) ( not ( = ?auto_106562 ?auto_106564 ) ) ( not ( = ?auto_106562 ?auto_106565 ) ) ( not ( = ?auto_106563 ?auto_106564 ) ) ( not ( = ?auto_106563 ?auto_106565 ) ) ( not ( = ?auto_106564 ?auto_106565 ) ) ( not ( = ?auto_106560 ?auto_106566 ) ) ( not ( = ?auto_106561 ?auto_106566 ) ) ( not ( = ?auto_106562 ?auto_106566 ) ) ( not ( = ?auto_106563 ?auto_106566 ) ) ( not ( = ?auto_106564 ?auto_106566 ) ) ( not ( = ?auto_106565 ?auto_106566 ) ) ( ON ?auto_106560 ?auto_106567 ) ( not ( = ?auto_106560 ?auto_106567 ) ) ( not ( = ?auto_106561 ?auto_106567 ) ) ( not ( = ?auto_106562 ?auto_106567 ) ) ( not ( = ?auto_106563 ?auto_106567 ) ) ( not ( = ?auto_106564 ?auto_106567 ) ) ( not ( = ?auto_106565 ?auto_106567 ) ) ( not ( = ?auto_106566 ?auto_106567 ) ) ( ON ?auto_106561 ?auto_106560 ) ( ON-TABLE ?auto_106567 ) ( ON ?auto_106562 ?auto_106561 ) ( ON ?auto_106563 ?auto_106562 ) ( ON ?auto_106564 ?auto_106563 ) ( ON ?auto_106565 ?auto_106564 ) ( CLEAR ?auto_106565 ) ( HOLDING ?auto_106566 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_106566 )
      ( MAKE-6PILE ?auto_106560 ?auto_106561 ?auto_106562 ?auto_106563 ?auto_106564 ?auto_106565 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_106568 - BLOCK
      ?auto_106569 - BLOCK
      ?auto_106570 - BLOCK
      ?auto_106571 - BLOCK
      ?auto_106572 - BLOCK
      ?auto_106573 - BLOCK
    )
    :vars
    (
      ?auto_106575 - BLOCK
      ?auto_106574 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106568 ?auto_106569 ) ) ( not ( = ?auto_106568 ?auto_106570 ) ) ( not ( = ?auto_106568 ?auto_106571 ) ) ( not ( = ?auto_106568 ?auto_106572 ) ) ( not ( = ?auto_106568 ?auto_106573 ) ) ( not ( = ?auto_106569 ?auto_106570 ) ) ( not ( = ?auto_106569 ?auto_106571 ) ) ( not ( = ?auto_106569 ?auto_106572 ) ) ( not ( = ?auto_106569 ?auto_106573 ) ) ( not ( = ?auto_106570 ?auto_106571 ) ) ( not ( = ?auto_106570 ?auto_106572 ) ) ( not ( = ?auto_106570 ?auto_106573 ) ) ( not ( = ?auto_106571 ?auto_106572 ) ) ( not ( = ?auto_106571 ?auto_106573 ) ) ( not ( = ?auto_106572 ?auto_106573 ) ) ( not ( = ?auto_106568 ?auto_106575 ) ) ( not ( = ?auto_106569 ?auto_106575 ) ) ( not ( = ?auto_106570 ?auto_106575 ) ) ( not ( = ?auto_106571 ?auto_106575 ) ) ( not ( = ?auto_106572 ?auto_106575 ) ) ( not ( = ?auto_106573 ?auto_106575 ) ) ( ON ?auto_106568 ?auto_106574 ) ( not ( = ?auto_106568 ?auto_106574 ) ) ( not ( = ?auto_106569 ?auto_106574 ) ) ( not ( = ?auto_106570 ?auto_106574 ) ) ( not ( = ?auto_106571 ?auto_106574 ) ) ( not ( = ?auto_106572 ?auto_106574 ) ) ( not ( = ?auto_106573 ?auto_106574 ) ) ( not ( = ?auto_106575 ?auto_106574 ) ) ( ON ?auto_106569 ?auto_106568 ) ( ON-TABLE ?auto_106574 ) ( ON ?auto_106570 ?auto_106569 ) ( ON ?auto_106571 ?auto_106570 ) ( ON ?auto_106572 ?auto_106571 ) ( ON ?auto_106573 ?auto_106572 ) ( ON ?auto_106575 ?auto_106573 ) ( CLEAR ?auto_106575 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_106574 ?auto_106568 ?auto_106569 ?auto_106570 ?auto_106571 ?auto_106572 ?auto_106573 )
      ( MAKE-6PILE ?auto_106568 ?auto_106569 ?auto_106570 ?auto_106571 ?auto_106572 ?auto_106573 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_106590 - BLOCK
      ?auto_106591 - BLOCK
      ?auto_106592 - BLOCK
      ?auto_106593 - BLOCK
      ?auto_106594 - BLOCK
      ?auto_106595 - BLOCK
      ?auto_106596 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_106595 ) ( ON-TABLE ?auto_106590 ) ( ON ?auto_106591 ?auto_106590 ) ( ON ?auto_106592 ?auto_106591 ) ( ON ?auto_106593 ?auto_106592 ) ( ON ?auto_106594 ?auto_106593 ) ( ON ?auto_106595 ?auto_106594 ) ( not ( = ?auto_106590 ?auto_106591 ) ) ( not ( = ?auto_106590 ?auto_106592 ) ) ( not ( = ?auto_106590 ?auto_106593 ) ) ( not ( = ?auto_106590 ?auto_106594 ) ) ( not ( = ?auto_106590 ?auto_106595 ) ) ( not ( = ?auto_106590 ?auto_106596 ) ) ( not ( = ?auto_106591 ?auto_106592 ) ) ( not ( = ?auto_106591 ?auto_106593 ) ) ( not ( = ?auto_106591 ?auto_106594 ) ) ( not ( = ?auto_106591 ?auto_106595 ) ) ( not ( = ?auto_106591 ?auto_106596 ) ) ( not ( = ?auto_106592 ?auto_106593 ) ) ( not ( = ?auto_106592 ?auto_106594 ) ) ( not ( = ?auto_106592 ?auto_106595 ) ) ( not ( = ?auto_106592 ?auto_106596 ) ) ( not ( = ?auto_106593 ?auto_106594 ) ) ( not ( = ?auto_106593 ?auto_106595 ) ) ( not ( = ?auto_106593 ?auto_106596 ) ) ( not ( = ?auto_106594 ?auto_106595 ) ) ( not ( = ?auto_106594 ?auto_106596 ) ) ( not ( = ?auto_106595 ?auto_106596 ) ) ( ON-TABLE ?auto_106596 ) ( CLEAR ?auto_106596 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_106596 )
      ( MAKE-7PILE ?auto_106590 ?auto_106591 ?auto_106592 ?auto_106593 ?auto_106594 ?auto_106595 ?auto_106596 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_106597 - BLOCK
      ?auto_106598 - BLOCK
      ?auto_106599 - BLOCK
      ?auto_106600 - BLOCK
      ?auto_106601 - BLOCK
      ?auto_106602 - BLOCK
      ?auto_106603 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_106597 ) ( ON ?auto_106598 ?auto_106597 ) ( ON ?auto_106599 ?auto_106598 ) ( ON ?auto_106600 ?auto_106599 ) ( ON ?auto_106601 ?auto_106600 ) ( not ( = ?auto_106597 ?auto_106598 ) ) ( not ( = ?auto_106597 ?auto_106599 ) ) ( not ( = ?auto_106597 ?auto_106600 ) ) ( not ( = ?auto_106597 ?auto_106601 ) ) ( not ( = ?auto_106597 ?auto_106602 ) ) ( not ( = ?auto_106597 ?auto_106603 ) ) ( not ( = ?auto_106598 ?auto_106599 ) ) ( not ( = ?auto_106598 ?auto_106600 ) ) ( not ( = ?auto_106598 ?auto_106601 ) ) ( not ( = ?auto_106598 ?auto_106602 ) ) ( not ( = ?auto_106598 ?auto_106603 ) ) ( not ( = ?auto_106599 ?auto_106600 ) ) ( not ( = ?auto_106599 ?auto_106601 ) ) ( not ( = ?auto_106599 ?auto_106602 ) ) ( not ( = ?auto_106599 ?auto_106603 ) ) ( not ( = ?auto_106600 ?auto_106601 ) ) ( not ( = ?auto_106600 ?auto_106602 ) ) ( not ( = ?auto_106600 ?auto_106603 ) ) ( not ( = ?auto_106601 ?auto_106602 ) ) ( not ( = ?auto_106601 ?auto_106603 ) ) ( not ( = ?auto_106602 ?auto_106603 ) ) ( ON-TABLE ?auto_106603 ) ( CLEAR ?auto_106603 ) ( HOLDING ?auto_106602 ) ( CLEAR ?auto_106601 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_106597 ?auto_106598 ?auto_106599 ?auto_106600 ?auto_106601 ?auto_106602 )
      ( MAKE-7PILE ?auto_106597 ?auto_106598 ?auto_106599 ?auto_106600 ?auto_106601 ?auto_106602 ?auto_106603 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_106604 - BLOCK
      ?auto_106605 - BLOCK
      ?auto_106606 - BLOCK
      ?auto_106607 - BLOCK
      ?auto_106608 - BLOCK
      ?auto_106609 - BLOCK
      ?auto_106610 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_106604 ) ( ON ?auto_106605 ?auto_106604 ) ( ON ?auto_106606 ?auto_106605 ) ( ON ?auto_106607 ?auto_106606 ) ( ON ?auto_106608 ?auto_106607 ) ( not ( = ?auto_106604 ?auto_106605 ) ) ( not ( = ?auto_106604 ?auto_106606 ) ) ( not ( = ?auto_106604 ?auto_106607 ) ) ( not ( = ?auto_106604 ?auto_106608 ) ) ( not ( = ?auto_106604 ?auto_106609 ) ) ( not ( = ?auto_106604 ?auto_106610 ) ) ( not ( = ?auto_106605 ?auto_106606 ) ) ( not ( = ?auto_106605 ?auto_106607 ) ) ( not ( = ?auto_106605 ?auto_106608 ) ) ( not ( = ?auto_106605 ?auto_106609 ) ) ( not ( = ?auto_106605 ?auto_106610 ) ) ( not ( = ?auto_106606 ?auto_106607 ) ) ( not ( = ?auto_106606 ?auto_106608 ) ) ( not ( = ?auto_106606 ?auto_106609 ) ) ( not ( = ?auto_106606 ?auto_106610 ) ) ( not ( = ?auto_106607 ?auto_106608 ) ) ( not ( = ?auto_106607 ?auto_106609 ) ) ( not ( = ?auto_106607 ?auto_106610 ) ) ( not ( = ?auto_106608 ?auto_106609 ) ) ( not ( = ?auto_106608 ?auto_106610 ) ) ( not ( = ?auto_106609 ?auto_106610 ) ) ( ON-TABLE ?auto_106610 ) ( CLEAR ?auto_106608 ) ( ON ?auto_106609 ?auto_106610 ) ( CLEAR ?auto_106609 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_106610 )
      ( MAKE-7PILE ?auto_106604 ?auto_106605 ?auto_106606 ?auto_106607 ?auto_106608 ?auto_106609 ?auto_106610 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_106611 - BLOCK
      ?auto_106612 - BLOCK
      ?auto_106613 - BLOCK
      ?auto_106614 - BLOCK
      ?auto_106615 - BLOCK
      ?auto_106616 - BLOCK
      ?auto_106617 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_106611 ) ( ON ?auto_106612 ?auto_106611 ) ( ON ?auto_106613 ?auto_106612 ) ( ON ?auto_106614 ?auto_106613 ) ( not ( = ?auto_106611 ?auto_106612 ) ) ( not ( = ?auto_106611 ?auto_106613 ) ) ( not ( = ?auto_106611 ?auto_106614 ) ) ( not ( = ?auto_106611 ?auto_106615 ) ) ( not ( = ?auto_106611 ?auto_106616 ) ) ( not ( = ?auto_106611 ?auto_106617 ) ) ( not ( = ?auto_106612 ?auto_106613 ) ) ( not ( = ?auto_106612 ?auto_106614 ) ) ( not ( = ?auto_106612 ?auto_106615 ) ) ( not ( = ?auto_106612 ?auto_106616 ) ) ( not ( = ?auto_106612 ?auto_106617 ) ) ( not ( = ?auto_106613 ?auto_106614 ) ) ( not ( = ?auto_106613 ?auto_106615 ) ) ( not ( = ?auto_106613 ?auto_106616 ) ) ( not ( = ?auto_106613 ?auto_106617 ) ) ( not ( = ?auto_106614 ?auto_106615 ) ) ( not ( = ?auto_106614 ?auto_106616 ) ) ( not ( = ?auto_106614 ?auto_106617 ) ) ( not ( = ?auto_106615 ?auto_106616 ) ) ( not ( = ?auto_106615 ?auto_106617 ) ) ( not ( = ?auto_106616 ?auto_106617 ) ) ( ON-TABLE ?auto_106617 ) ( ON ?auto_106616 ?auto_106617 ) ( CLEAR ?auto_106616 ) ( HOLDING ?auto_106615 ) ( CLEAR ?auto_106614 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_106611 ?auto_106612 ?auto_106613 ?auto_106614 ?auto_106615 )
      ( MAKE-7PILE ?auto_106611 ?auto_106612 ?auto_106613 ?auto_106614 ?auto_106615 ?auto_106616 ?auto_106617 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_106618 - BLOCK
      ?auto_106619 - BLOCK
      ?auto_106620 - BLOCK
      ?auto_106621 - BLOCK
      ?auto_106622 - BLOCK
      ?auto_106623 - BLOCK
      ?auto_106624 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_106618 ) ( ON ?auto_106619 ?auto_106618 ) ( ON ?auto_106620 ?auto_106619 ) ( ON ?auto_106621 ?auto_106620 ) ( not ( = ?auto_106618 ?auto_106619 ) ) ( not ( = ?auto_106618 ?auto_106620 ) ) ( not ( = ?auto_106618 ?auto_106621 ) ) ( not ( = ?auto_106618 ?auto_106622 ) ) ( not ( = ?auto_106618 ?auto_106623 ) ) ( not ( = ?auto_106618 ?auto_106624 ) ) ( not ( = ?auto_106619 ?auto_106620 ) ) ( not ( = ?auto_106619 ?auto_106621 ) ) ( not ( = ?auto_106619 ?auto_106622 ) ) ( not ( = ?auto_106619 ?auto_106623 ) ) ( not ( = ?auto_106619 ?auto_106624 ) ) ( not ( = ?auto_106620 ?auto_106621 ) ) ( not ( = ?auto_106620 ?auto_106622 ) ) ( not ( = ?auto_106620 ?auto_106623 ) ) ( not ( = ?auto_106620 ?auto_106624 ) ) ( not ( = ?auto_106621 ?auto_106622 ) ) ( not ( = ?auto_106621 ?auto_106623 ) ) ( not ( = ?auto_106621 ?auto_106624 ) ) ( not ( = ?auto_106622 ?auto_106623 ) ) ( not ( = ?auto_106622 ?auto_106624 ) ) ( not ( = ?auto_106623 ?auto_106624 ) ) ( ON-TABLE ?auto_106624 ) ( ON ?auto_106623 ?auto_106624 ) ( CLEAR ?auto_106621 ) ( ON ?auto_106622 ?auto_106623 ) ( CLEAR ?auto_106622 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_106624 ?auto_106623 )
      ( MAKE-7PILE ?auto_106618 ?auto_106619 ?auto_106620 ?auto_106621 ?auto_106622 ?auto_106623 ?auto_106624 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_106625 - BLOCK
      ?auto_106626 - BLOCK
      ?auto_106627 - BLOCK
      ?auto_106628 - BLOCK
      ?auto_106629 - BLOCK
      ?auto_106630 - BLOCK
      ?auto_106631 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_106625 ) ( ON ?auto_106626 ?auto_106625 ) ( ON ?auto_106627 ?auto_106626 ) ( not ( = ?auto_106625 ?auto_106626 ) ) ( not ( = ?auto_106625 ?auto_106627 ) ) ( not ( = ?auto_106625 ?auto_106628 ) ) ( not ( = ?auto_106625 ?auto_106629 ) ) ( not ( = ?auto_106625 ?auto_106630 ) ) ( not ( = ?auto_106625 ?auto_106631 ) ) ( not ( = ?auto_106626 ?auto_106627 ) ) ( not ( = ?auto_106626 ?auto_106628 ) ) ( not ( = ?auto_106626 ?auto_106629 ) ) ( not ( = ?auto_106626 ?auto_106630 ) ) ( not ( = ?auto_106626 ?auto_106631 ) ) ( not ( = ?auto_106627 ?auto_106628 ) ) ( not ( = ?auto_106627 ?auto_106629 ) ) ( not ( = ?auto_106627 ?auto_106630 ) ) ( not ( = ?auto_106627 ?auto_106631 ) ) ( not ( = ?auto_106628 ?auto_106629 ) ) ( not ( = ?auto_106628 ?auto_106630 ) ) ( not ( = ?auto_106628 ?auto_106631 ) ) ( not ( = ?auto_106629 ?auto_106630 ) ) ( not ( = ?auto_106629 ?auto_106631 ) ) ( not ( = ?auto_106630 ?auto_106631 ) ) ( ON-TABLE ?auto_106631 ) ( ON ?auto_106630 ?auto_106631 ) ( ON ?auto_106629 ?auto_106630 ) ( CLEAR ?auto_106629 ) ( HOLDING ?auto_106628 ) ( CLEAR ?auto_106627 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_106625 ?auto_106626 ?auto_106627 ?auto_106628 )
      ( MAKE-7PILE ?auto_106625 ?auto_106626 ?auto_106627 ?auto_106628 ?auto_106629 ?auto_106630 ?auto_106631 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_106632 - BLOCK
      ?auto_106633 - BLOCK
      ?auto_106634 - BLOCK
      ?auto_106635 - BLOCK
      ?auto_106636 - BLOCK
      ?auto_106637 - BLOCK
      ?auto_106638 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_106632 ) ( ON ?auto_106633 ?auto_106632 ) ( ON ?auto_106634 ?auto_106633 ) ( not ( = ?auto_106632 ?auto_106633 ) ) ( not ( = ?auto_106632 ?auto_106634 ) ) ( not ( = ?auto_106632 ?auto_106635 ) ) ( not ( = ?auto_106632 ?auto_106636 ) ) ( not ( = ?auto_106632 ?auto_106637 ) ) ( not ( = ?auto_106632 ?auto_106638 ) ) ( not ( = ?auto_106633 ?auto_106634 ) ) ( not ( = ?auto_106633 ?auto_106635 ) ) ( not ( = ?auto_106633 ?auto_106636 ) ) ( not ( = ?auto_106633 ?auto_106637 ) ) ( not ( = ?auto_106633 ?auto_106638 ) ) ( not ( = ?auto_106634 ?auto_106635 ) ) ( not ( = ?auto_106634 ?auto_106636 ) ) ( not ( = ?auto_106634 ?auto_106637 ) ) ( not ( = ?auto_106634 ?auto_106638 ) ) ( not ( = ?auto_106635 ?auto_106636 ) ) ( not ( = ?auto_106635 ?auto_106637 ) ) ( not ( = ?auto_106635 ?auto_106638 ) ) ( not ( = ?auto_106636 ?auto_106637 ) ) ( not ( = ?auto_106636 ?auto_106638 ) ) ( not ( = ?auto_106637 ?auto_106638 ) ) ( ON-TABLE ?auto_106638 ) ( ON ?auto_106637 ?auto_106638 ) ( ON ?auto_106636 ?auto_106637 ) ( CLEAR ?auto_106634 ) ( ON ?auto_106635 ?auto_106636 ) ( CLEAR ?auto_106635 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_106638 ?auto_106637 ?auto_106636 )
      ( MAKE-7PILE ?auto_106632 ?auto_106633 ?auto_106634 ?auto_106635 ?auto_106636 ?auto_106637 ?auto_106638 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_106639 - BLOCK
      ?auto_106640 - BLOCK
      ?auto_106641 - BLOCK
      ?auto_106642 - BLOCK
      ?auto_106643 - BLOCK
      ?auto_106644 - BLOCK
      ?auto_106645 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_106639 ) ( ON ?auto_106640 ?auto_106639 ) ( not ( = ?auto_106639 ?auto_106640 ) ) ( not ( = ?auto_106639 ?auto_106641 ) ) ( not ( = ?auto_106639 ?auto_106642 ) ) ( not ( = ?auto_106639 ?auto_106643 ) ) ( not ( = ?auto_106639 ?auto_106644 ) ) ( not ( = ?auto_106639 ?auto_106645 ) ) ( not ( = ?auto_106640 ?auto_106641 ) ) ( not ( = ?auto_106640 ?auto_106642 ) ) ( not ( = ?auto_106640 ?auto_106643 ) ) ( not ( = ?auto_106640 ?auto_106644 ) ) ( not ( = ?auto_106640 ?auto_106645 ) ) ( not ( = ?auto_106641 ?auto_106642 ) ) ( not ( = ?auto_106641 ?auto_106643 ) ) ( not ( = ?auto_106641 ?auto_106644 ) ) ( not ( = ?auto_106641 ?auto_106645 ) ) ( not ( = ?auto_106642 ?auto_106643 ) ) ( not ( = ?auto_106642 ?auto_106644 ) ) ( not ( = ?auto_106642 ?auto_106645 ) ) ( not ( = ?auto_106643 ?auto_106644 ) ) ( not ( = ?auto_106643 ?auto_106645 ) ) ( not ( = ?auto_106644 ?auto_106645 ) ) ( ON-TABLE ?auto_106645 ) ( ON ?auto_106644 ?auto_106645 ) ( ON ?auto_106643 ?auto_106644 ) ( ON ?auto_106642 ?auto_106643 ) ( CLEAR ?auto_106642 ) ( HOLDING ?auto_106641 ) ( CLEAR ?auto_106640 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_106639 ?auto_106640 ?auto_106641 )
      ( MAKE-7PILE ?auto_106639 ?auto_106640 ?auto_106641 ?auto_106642 ?auto_106643 ?auto_106644 ?auto_106645 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_106646 - BLOCK
      ?auto_106647 - BLOCK
      ?auto_106648 - BLOCK
      ?auto_106649 - BLOCK
      ?auto_106650 - BLOCK
      ?auto_106651 - BLOCK
      ?auto_106652 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_106646 ) ( ON ?auto_106647 ?auto_106646 ) ( not ( = ?auto_106646 ?auto_106647 ) ) ( not ( = ?auto_106646 ?auto_106648 ) ) ( not ( = ?auto_106646 ?auto_106649 ) ) ( not ( = ?auto_106646 ?auto_106650 ) ) ( not ( = ?auto_106646 ?auto_106651 ) ) ( not ( = ?auto_106646 ?auto_106652 ) ) ( not ( = ?auto_106647 ?auto_106648 ) ) ( not ( = ?auto_106647 ?auto_106649 ) ) ( not ( = ?auto_106647 ?auto_106650 ) ) ( not ( = ?auto_106647 ?auto_106651 ) ) ( not ( = ?auto_106647 ?auto_106652 ) ) ( not ( = ?auto_106648 ?auto_106649 ) ) ( not ( = ?auto_106648 ?auto_106650 ) ) ( not ( = ?auto_106648 ?auto_106651 ) ) ( not ( = ?auto_106648 ?auto_106652 ) ) ( not ( = ?auto_106649 ?auto_106650 ) ) ( not ( = ?auto_106649 ?auto_106651 ) ) ( not ( = ?auto_106649 ?auto_106652 ) ) ( not ( = ?auto_106650 ?auto_106651 ) ) ( not ( = ?auto_106650 ?auto_106652 ) ) ( not ( = ?auto_106651 ?auto_106652 ) ) ( ON-TABLE ?auto_106652 ) ( ON ?auto_106651 ?auto_106652 ) ( ON ?auto_106650 ?auto_106651 ) ( ON ?auto_106649 ?auto_106650 ) ( CLEAR ?auto_106647 ) ( ON ?auto_106648 ?auto_106649 ) ( CLEAR ?auto_106648 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_106652 ?auto_106651 ?auto_106650 ?auto_106649 )
      ( MAKE-7PILE ?auto_106646 ?auto_106647 ?auto_106648 ?auto_106649 ?auto_106650 ?auto_106651 ?auto_106652 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_106653 - BLOCK
      ?auto_106654 - BLOCK
      ?auto_106655 - BLOCK
      ?auto_106656 - BLOCK
      ?auto_106657 - BLOCK
      ?auto_106658 - BLOCK
      ?auto_106659 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_106653 ) ( not ( = ?auto_106653 ?auto_106654 ) ) ( not ( = ?auto_106653 ?auto_106655 ) ) ( not ( = ?auto_106653 ?auto_106656 ) ) ( not ( = ?auto_106653 ?auto_106657 ) ) ( not ( = ?auto_106653 ?auto_106658 ) ) ( not ( = ?auto_106653 ?auto_106659 ) ) ( not ( = ?auto_106654 ?auto_106655 ) ) ( not ( = ?auto_106654 ?auto_106656 ) ) ( not ( = ?auto_106654 ?auto_106657 ) ) ( not ( = ?auto_106654 ?auto_106658 ) ) ( not ( = ?auto_106654 ?auto_106659 ) ) ( not ( = ?auto_106655 ?auto_106656 ) ) ( not ( = ?auto_106655 ?auto_106657 ) ) ( not ( = ?auto_106655 ?auto_106658 ) ) ( not ( = ?auto_106655 ?auto_106659 ) ) ( not ( = ?auto_106656 ?auto_106657 ) ) ( not ( = ?auto_106656 ?auto_106658 ) ) ( not ( = ?auto_106656 ?auto_106659 ) ) ( not ( = ?auto_106657 ?auto_106658 ) ) ( not ( = ?auto_106657 ?auto_106659 ) ) ( not ( = ?auto_106658 ?auto_106659 ) ) ( ON-TABLE ?auto_106659 ) ( ON ?auto_106658 ?auto_106659 ) ( ON ?auto_106657 ?auto_106658 ) ( ON ?auto_106656 ?auto_106657 ) ( ON ?auto_106655 ?auto_106656 ) ( CLEAR ?auto_106655 ) ( HOLDING ?auto_106654 ) ( CLEAR ?auto_106653 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_106653 ?auto_106654 )
      ( MAKE-7PILE ?auto_106653 ?auto_106654 ?auto_106655 ?auto_106656 ?auto_106657 ?auto_106658 ?auto_106659 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_106660 - BLOCK
      ?auto_106661 - BLOCK
      ?auto_106662 - BLOCK
      ?auto_106663 - BLOCK
      ?auto_106664 - BLOCK
      ?auto_106665 - BLOCK
      ?auto_106666 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_106660 ) ( not ( = ?auto_106660 ?auto_106661 ) ) ( not ( = ?auto_106660 ?auto_106662 ) ) ( not ( = ?auto_106660 ?auto_106663 ) ) ( not ( = ?auto_106660 ?auto_106664 ) ) ( not ( = ?auto_106660 ?auto_106665 ) ) ( not ( = ?auto_106660 ?auto_106666 ) ) ( not ( = ?auto_106661 ?auto_106662 ) ) ( not ( = ?auto_106661 ?auto_106663 ) ) ( not ( = ?auto_106661 ?auto_106664 ) ) ( not ( = ?auto_106661 ?auto_106665 ) ) ( not ( = ?auto_106661 ?auto_106666 ) ) ( not ( = ?auto_106662 ?auto_106663 ) ) ( not ( = ?auto_106662 ?auto_106664 ) ) ( not ( = ?auto_106662 ?auto_106665 ) ) ( not ( = ?auto_106662 ?auto_106666 ) ) ( not ( = ?auto_106663 ?auto_106664 ) ) ( not ( = ?auto_106663 ?auto_106665 ) ) ( not ( = ?auto_106663 ?auto_106666 ) ) ( not ( = ?auto_106664 ?auto_106665 ) ) ( not ( = ?auto_106664 ?auto_106666 ) ) ( not ( = ?auto_106665 ?auto_106666 ) ) ( ON-TABLE ?auto_106666 ) ( ON ?auto_106665 ?auto_106666 ) ( ON ?auto_106664 ?auto_106665 ) ( ON ?auto_106663 ?auto_106664 ) ( ON ?auto_106662 ?auto_106663 ) ( CLEAR ?auto_106660 ) ( ON ?auto_106661 ?auto_106662 ) ( CLEAR ?auto_106661 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_106666 ?auto_106665 ?auto_106664 ?auto_106663 ?auto_106662 )
      ( MAKE-7PILE ?auto_106660 ?auto_106661 ?auto_106662 ?auto_106663 ?auto_106664 ?auto_106665 ?auto_106666 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_106667 - BLOCK
      ?auto_106668 - BLOCK
      ?auto_106669 - BLOCK
      ?auto_106670 - BLOCK
      ?auto_106671 - BLOCK
      ?auto_106672 - BLOCK
      ?auto_106673 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106667 ?auto_106668 ) ) ( not ( = ?auto_106667 ?auto_106669 ) ) ( not ( = ?auto_106667 ?auto_106670 ) ) ( not ( = ?auto_106667 ?auto_106671 ) ) ( not ( = ?auto_106667 ?auto_106672 ) ) ( not ( = ?auto_106667 ?auto_106673 ) ) ( not ( = ?auto_106668 ?auto_106669 ) ) ( not ( = ?auto_106668 ?auto_106670 ) ) ( not ( = ?auto_106668 ?auto_106671 ) ) ( not ( = ?auto_106668 ?auto_106672 ) ) ( not ( = ?auto_106668 ?auto_106673 ) ) ( not ( = ?auto_106669 ?auto_106670 ) ) ( not ( = ?auto_106669 ?auto_106671 ) ) ( not ( = ?auto_106669 ?auto_106672 ) ) ( not ( = ?auto_106669 ?auto_106673 ) ) ( not ( = ?auto_106670 ?auto_106671 ) ) ( not ( = ?auto_106670 ?auto_106672 ) ) ( not ( = ?auto_106670 ?auto_106673 ) ) ( not ( = ?auto_106671 ?auto_106672 ) ) ( not ( = ?auto_106671 ?auto_106673 ) ) ( not ( = ?auto_106672 ?auto_106673 ) ) ( ON-TABLE ?auto_106673 ) ( ON ?auto_106672 ?auto_106673 ) ( ON ?auto_106671 ?auto_106672 ) ( ON ?auto_106670 ?auto_106671 ) ( ON ?auto_106669 ?auto_106670 ) ( ON ?auto_106668 ?auto_106669 ) ( CLEAR ?auto_106668 ) ( HOLDING ?auto_106667 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_106667 )
      ( MAKE-7PILE ?auto_106667 ?auto_106668 ?auto_106669 ?auto_106670 ?auto_106671 ?auto_106672 ?auto_106673 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_106674 - BLOCK
      ?auto_106675 - BLOCK
      ?auto_106676 - BLOCK
      ?auto_106677 - BLOCK
      ?auto_106678 - BLOCK
      ?auto_106679 - BLOCK
      ?auto_106680 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106674 ?auto_106675 ) ) ( not ( = ?auto_106674 ?auto_106676 ) ) ( not ( = ?auto_106674 ?auto_106677 ) ) ( not ( = ?auto_106674 ?auto_106678 ) ) ( not ( = ?auto_106674 ?auto_106679 ) ) ( not ( = ?auto_106674 ?auto_106680 ) ) ( not ( = ?auto_106675 ?auto_106676 ) ) ( not ( = ?auto_106675 ?auto_106677 ) ) ( not ( = ?auto_106675 ?auto_106678 ) ) ( not ( = ?auto_106675 ?auto_106679 ) ) ( not ( = ?auto_106675 ?auto_106680 ) ) ( not ( = ?auto_106676 ?auto_106677 ) ) ( not ( = ?auto_106676 ?auto_106678 ) ) ( not ( = ?auto_106676 ?auto_106679 ) ) ( not ( = ?auto_106676 ?auto_106680 ) ) ( not ( = ?auto_106677 ?auto_106678 ) ) ( not ( = ?auto_106677 ?auto_106679 ) ) ( not ( = ?auto_106677 ?auto_106680 ) ) ( not ( = ?auto_106678 ?auto_106679 ) ) ( not ( = ?auto_106678 ?auto_106680 ) ) ( not ( = ?auto_106679 ?auto_106680 ) ) ( ON-TABLE ?auto_106680 ) ( ON ?auto_106679 ?auto_106680 ) ( ON ?auto_106678 ?auto_106679 ) ( ON ?auto_106677 ?auto_106678 ) ( ON ?auto_106676 ?auto_106677 ) ( ON ?auto_106675 ?auto_106676 ) ( ON ?auto_106674 ?auto_106675 ) ( CLEAR ?auto_106674 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_106680 ?auto_106679 ?auto_106678 ?auto_106677 ?auto_106676 ?auto_106675 )
      ( MAKE-7PILE ?auto_106674 ?auto_106675 ?auto_106676 ?auto_106677 ?auto_106678 ?auto_106679 ?auto_106680 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_106688 - BLOCK
      ?auto_106689 - BLOCK
      ?auto_106690 - BLOCK
      ?auto_106691 - BLOCK
      ?auto_106692 - BLOCK
      ?auto_106693 - BLOCK
      ?auto_106694 - BLOCK
    )
    :vars
    (
      ?auto_106695 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106688 ?auto_106689 ) ) ( not ( = ?auto_106688 ?auto_106690 ) ) ( not ( = ?auto_106688 ?auto_106691 ) ) ( not ( = ?auto_106688 ?auto_106692 ) ) ( not ( = ?auto_106688 ?auto_106693 ) ) ( not ( = ?auto_106688 ?auto_106694 ) ) ( not ( = ?auto_106689 ?auto_106690 ) ) ( not ( = ?auto_106689 ?auto_106691 ) ) ( not ( = ?auto_106689 ?auto_106692 ) ) ( not ( = ?auto_106689 ?auto_106693 ) ) ( not ( = ?auto_106689 ?auto_106694 ) ) ( not ( = ?auto_106690 ?auto_106691 ) ) ( not ( = ?auto_106690 ?auto_106692 ) ) ( not ( = ?auto_106690 ?auto_106693 ) ) ( not ( = ?auto_106690 ?auto_106694 ) ) ( not ( = ?auto_106691 ?auto_106692 ) ) ( not ( = ?auto_106691 ?auto_106693 ) ) ( not ( = ?auto_106691 ?auto_106694 ) ) ( not ( = ?auto_106692 ?auto_106693 ) ) ( not ( = ?auto_106692 ?auto_106694 ) ) ( not ( = ?auto_106693 ?auto_106694 ) ) ( ON-TABLE ?auto_106694 ) ( ON ?auto_106693 ?auto_106694 ) ( ON ?auto_106692 ?auto_106693 ) ( ON ?auto_106691 ?auto_106692 ) ( ON ?auto_106690 ?auto_106691 ) ( ON ?auto_106689 ?auto_106690 ) ( CLEAR ?auto_106689 ) ( ON ?auto_106688 ?auto_106695 ) ( CLEAR ?auto_106688 ) ( HAND-EMPTY ) ( not ( = ?auto_106688 ?auto_106695 ) ) ( not ( = ?auto_106689 ?auto_106695 ) ) ( not ( = ?auto_106690 ?auto_106695 ) ) ( not ( = ?auto_106691 ?auto_106695 ) ) ( not ( = ?auto_106692 ?auto_106695 ) ) ( not ( = ?auto_106693 ?auto_106695 ) ) ( not ( = ?auto_106694 ?auto_106695 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_106688 ?auto_106695 )
      ( MAKE-7PILE ?auto_106688 ?auto_106689 ?auto_106690 ?auto_106691 ?auto_106692 ?auto_106693 ?auto_106694 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_106696 - BLOCK
      ?auto_106697 - BLOCK
      ?auto_106698 - BLOCK
      ?auto_106699 - BLOCK
      ?auto_106700 - BLOCK
      ?auto_106701 - BLOCK
      ?auto_106702 - BLOCK
    )
    :vars
    (
      ?auto_106703 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106696 ?auto_106697 ) ) ( not ( = ?auto_106696 ?auto_106698 ) ) ( not ( = ?auto_106696 ?auto_106699 ) ) ( not ( = ?auto_106696 ?auto_106700 ) ) ( not ( = ?auto_106696 ?auto_106701 ) ) ( not ( = ?auto_106696 ?auto_106702 ) ) ( not ( = ?auto_106697 ?auto_106698 ) ) ( not ( = ?auto_106697 ?auto_106699 ) ) ( not ( = ?auto_106697 ?auto_106700 ) ) ( not ( = ?auto_106697 ?auto_106701 ) ) ( not ( = ?auto_106697 ?auto_106702 ) ) ( not ( = ?auto_106698 ?auto_106699 ) ) ( not ( = ?auto_106698 ?auto_106700 ) ) ( not ( = ?auto_106698 ?auto_106701 ) ) ( not ( = ?auto_106698 ?auto_106702 ) ) ( not ( = ?auto_106699 ?auto_106700 ) ) ( not ( = ?auto_106699 ?auto_106701 ) ) ( not ( = ?auto_106699 ?auto_106702 ) ) ( not ( = ?auto_106700 ?auto_106701 ) ) ( not ( = ?auto_106700 ?auto_106702 ) ) ( not ( = ?auto_106701 ?auto_106702 ) ) ( ON-TABLE ?auto_106702 ) ( ON ?auto_106701 ?auto_106702 ) ( ON ?auto_106700 ?auto_106701 ) ( ON ?auto_106699 ?auto_106700 ) ( ON ?auto_106698 ?auto_106699 ) ( ON ?auto_106696 ?auto_106703 ) ( CLEAR ?auto_106696 ) ( not ( = ?auto_106696 ?auto_106703 ) ) ( not ( = ?auto_106697 ?auto_106703 ) ) ( not ( = ?auto_106698 ?auto_106703 ) ) ( not ( = ?auto_106699 ?auto_106703 ) ) ( not ( = ?auto_106700 ?auto_106703 ) ) ( not ( = ?auto_106701 ?auto_106703 ) ) ( not ( = ?auto_106702 ?auto_106703 ) ) ( HOLDING ?auto_106697 ) ( CLEAR ?auto_106698 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_106702 ?auto_106701 ?auto_106700 ?auto_106699 ?auto_106698 ?auto_106697 )
      ( MAKE-7PILE ?auto_106696 ?auto_106697 ?auto_106698 ?auto_106699 ?auto_106700 ?auto_106701 ?auto_106702 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_106704 - BLOCK
      ?auto_106705 - BLOCK
      ?auto_106706 - BLOCK
      ?auto_106707 - BLOCK
      ?auto_106708 - BLOCK
      ?auto_106709 - BLOCK
      ?auto_106710 - BLOCK
    )
    :vars
    (
      ?auto_106711 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106704 ?auto_106705 ) ) ( not ( = ?auto_106704 ?auto_106706 ) ) ( not ( = ?auto_106704 ?auto_106707 ) ) ( not ( = ?auto_106704 ?auto_106708 ) ) ( not ( = ?auto_106704 ?auto_106709 ) ) ( not ( = ?auto_106704 ?auto_106710 ) ) ( not ( = ?auto_106705 ?auto_106706 ) ) ( not ( = ?auto_106705 ?auto_106707 ) ) ( not ( = ?auto_106705 ?auto_106708 ) ) ( not ( = ?auto_106705 ?auto_106709 ) ) ( not ( = ?auto_106705 ?auto_106710 ) ) ( not ( = ?auto_106706 ?auto_106707 ) ) ( not ( = ?auto_106706 ?auto_106708 ) ) ( not ( = ?auto_106706 ?auto_106709 ) ) ( not ( = ?auto_106706 ?auto_106710 ) ) ( not ( = ?auto_106707 ?auto_106708 ) ) ( not ( = ?auto_106707 ?auto_106709 ) ) ( not ( = ?auto_106707 ?auto_106710 ) ) ( not ( = ?auto_106708 ?auto_106709 ) ) ( not ( = ?auto_106708 ?auto_106710 ) ) ( not ( = ?auto_106709 ?auto_106710 ) ) ( ON-TABLE ?auto_106710 ) ( ON ?auto_106709 ?auto_106710 ) ( ON ?auto_106708 ?auto_106709 ) ( ON ?auto_106707 ?auto_106708 ) ( ON ?auto_106706 ?auto_106707 ) ( ON ?auto_106704 ?auto_106711 ) ( not ( = ?auto_106704 ?auto_106711 ) ) ( not ( = ?auto_106705 ?auto_106711 ) ) ( not ( = ?auto_106706 ?auto_106711 ) ) ( not ( = ?auto_106707 ?auto_106711 ) ) ( not ( = ?auto_106708 ?auto_106711 ) ) ( not ( = ?auto_106709 ?auto_106711 ) ) ( not ( = ?auto_106710 ?auto_106711 ) ) ( CLEAR ?auto_106706 ) ( ON ?auto_106705 ?auto_106704 ) ( CLEAR ?auto_106705 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_106711 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_106711 ?auto_106704 )
      ( MAKE-7PILE ?auto_106704 ?auto_106705 ?auto_106706 ?auto_106707 ?auto_106708 ?auto_106709 ?auto_106710 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_106712 - BLOCK
      ?auto_106713 - BLOCK
      ?auto_106714 - BLOCK
      ?auto_106715 - BLOCK
      ?auto_106716 - BLOCK
      ?auto_106717 - BLOCK
      ?auto_106718 - BLOCK
    )
    :vars
    (
      ?auto_106719 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106712 ?auto_106713 ) ) ( not ( = ?auto_106712 ?auto_106714 ) ) ( not ( = ?auto_106712 ?auto_106715 ) ) ( not ( = ?auto_106712 ?auto_106716 ) ) ( not ( = ?auto_106712 ?auto_106717 ) ) ( not ( = ?auto_106712 ?auto_106718 ) ) ( not ( = ?auto_106713 ?auto_106714 ) ) ( not ( = ?auto_106713 ?auto_106715 ) ) ( not ( = ?auto_106713 ?auto_106716 ) ) ( not ( = ?auto_106713 ?auto_106717 ) ) ( not ( = ?auto_106713 ?auto_106718 ) ) ( not ( = ?auto_106714 ?auto_106715 ) ) ( not ( = ?auto_106714 ?auto_106716 ) ) ( not ( = ?auto_106714 ?auto_106717 ) ) ( not ( = ?auto_106714 ?auto_106718 ) ) ( not ( = ?auto_106715 ?auto_106716 ) ) ( not ( = ?auto_106715 ?auto_106717 ) ) ( not ( = ?auto_106715 ?auto_106718 ) ) ( not ( = ?auto_106716 ?auto_106717 ) ) ( not ( = ?auto_106716 ?auto_106718 ) ) ( not ( = ?auto_106717 ?auto_106718 ) ) ( ON-TABLE ?auto_106718 ) ( ON ?auto_106717 ?auto_106718 ) ( ON ?auto_106716 ?auto_106717 ) ( ON ?auto_106715 ?auto_106716 ) ( ON ?auto_106712 ?auto_106719 ) ( not ( = ?auto_106712 ?auto_106719 ) ) ( not ( = ?auto_106713 ?auto_106719 ) ) ( not ( = ?auto_106714 ?auto_106719 ) ) ( not ( = ?auto_106715 ?auto_106719 ) ) ( not ( = ?auto_106716 ?auto_106719 ) ) ( not ( = ?auto_106717 ?auto_106719 ) ) ( not ( = ?auto_106718 ?auto_106719 ) ) ( ON ?auto_106713 ?auto_106712 ) ( CLEAR ?auto_106713 ) ( ON-TABLE ?auto_106719 ) ( HOLDING ?auto_106714 ) ( CLEAR ?auto_106715 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_106718 ?auto_106717 ?auto_106716 ?auto_106715 ?auto_106714 )
      ( MAKE-7PILE ?auto_106712 ?auto_106713 ?auto_106714 ?auto_106715 ?auto_106716 ?auto_106717 ?auto_106718 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_106720 - BLOCK
      ?auto_106721 - BLOCK
      ?auto_106722 - BLOCK
      ?auto_106723 - BLOCK
      ?auto_106724 - BLOCK
      ?auto_106725 - BLOCK
      ?auto_106726 - BLOCK
    )
    :vars
    (
      ?auto_106727 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106720 ?auto_106721 ) ) ( not ( = ?auto_106720 ?auto_106722 ) ) ( not ( = ?auto_106720 ?auto_106723 ) ) ( not ( = ?auto_106720 ?auto_106724 ) ) ( not ( = ?auto_106720 ?auto_106725 ) ) ( not ( = ?auto_106720 ?auto_106726 ) ) ( not ( = ?auto_106721 ?auto_106722 ) ) ( not ( = ?auto_106721 ?auto_106723 ) ) ( not ( = ?auto_106721 ?auto_106724 ) ) ( not ( = ?auto_106721 ?auto_106725 ) ) ( not ( = ?auto_106721 ?auto_106726 ) ) ( not ( = ?auto_106722 ?auto_106723 ) ) ( not ( = ?auto_106722 ?auto_106724 ) ) ( not ( = ?auto_106722 ?auto_106725 ) ) ( not ( = ?auto_106722 ?auto_106726 ) ) ( not ( = ?auto_106723 ?auto_106724 ) ) ( not ( = ?auto_106723 ?auto_106725 ) ) ( not ( = ?auto_106723 ?auto_106726 ) ) ( not ( = ?auto_106724 ?auto_106725 ) ) ( not ( = ?auto_106724 ?auto_106726 ) ) ( not ( = ?auto_106725 ?auto_106726 ) ) ( ON-TABLE ?auto_106726 ) ( ON ?auto_106725 ?auto_106726 ) ( ON ?auto_106724 ?auto_106725 ) ( ON ?auto_106723 ?auto_106724 ) ( ON ?auto_106720 ?auto_106727 ) ( not ( = ?auto_106720 ?auto_106727 ) ) ( not ( = ?auto_106721 ?auto_106727 ) ) ( not ( = ?auto_106722 ?auto_106727 ) ) ( not ( = ?auto_106723 ?auto_106727 ) ) ( not ( = ?auto_106724 ?auto_106727 ) ) ( not ( = ?auto_106725 ?auto_106727 ) ) ( not ( = ?auto_106726 ?auto_106727 ) ) ( ON ?auto_106721 ?auto_106720 ) ( ON-TABLE ?auto_106727 ) ( CLEAR ?auto_106723 ) ( ON ?auto_106722 ?auto_106721 ) ( CLEAR ?auto_106722 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_106727 ?auto_106720 ?auto_106721 )
      ( MAKE-7PILE ?auto_106720 ?auto_106721 ?auto_106722 ?auto_106723 ?auto_106724 ?auto_106725 ?auto_106726 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_106728 - BLOCK
      ?auto_106729 - BLOCK
      ?auto_106730 - BLOCK
      ?auto_106731 - BLOCK
      ?auto_106732 - BLOCK
      ?auto_106733 - BLOCK
      ?auto_106734 - BLOCK
    )
    :vars
    (
      ?auto_106735 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106728 ?auto_106729 ) ) ( not ( = ?auto_106728 ?auto_106730 ) ) ( not ( = ?auto_106728 ?auto_106731 ) ) ( not ( = ?auto_106728 ?auto_106732 ) ) ( not ( = ?auto_106728 ?auto_106733 ) ) ( not ( = ?auto_106728 ?auto_106734 ) ) ( not ( = ?auto_106729 ?auto_106730 ) ) ( not ( = ?auto_106729 ?auto_106731 ) ) ( not ( = ?auto_106729 ?auto_106732 ) ) ( not ( = ?auto_106729 ?auto_106733 ) ) ( not ( = ?auto_106729 ?auto_106734 ) ) ( not ( = ?auto_106730 ?auto_106731 ) ) ( not ( = ?auto_106730 ?auto_106732 ) ) ( not ( = ?auto_106730 ?auto_106733 ) ) ( not ( = ?auto_106730 ?auto_106734 ) ) ( not ( = ?auto_106731 ?auto_106732 ) ) ( not ( = ?auto_106731 ?auto_106733 ) ) ( not ( = ?auto_106731 ?auto_106734 ) ) ( not ( = ?auto_106732 ?auto_106733 ) ) ( not ( = ?auto_106732 ?auto_106734 ) ) ( not ( = ?auto_106733 ?auto_106734 ) ) ( ON-TABLE ?auto_106734 ) ( ON ?auto_106733 ?auto_106734 ) ( ON ?auto_106732 ?auto_106733 ) ( ON ?auto_106728 ?auto_106735 ) ( not ( = ?auto_106728 ?auto_106735 ) ) ( not ( = ?auto_106729 ?auto_106735 ) ) ( not ( = ?auto_106730 ?auto_106735 ) ) ( not ( = ?auto_106731 ?auto_106735 ) ) ( not ( = ?auto_106732 ?auto_106735 ) ) ( not ( = ?auto_106733 ?auto_106735 ) ) ( not ( = ?auto_106734 ?auto_106735 ) ) ( ON ?auto_106729 ?auto_106728 ) ( ON-TABLE ?auto_106735 ) ( ON ?auto_106730 ?auto_106729 ) ( CLEAR ?auto_106730 ) ( HOLDING ?auto_106731 ) ( CLEAR ?auto_106732 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_106734 ?auto_106733 ?auto_106732 ?auto_106731 )
      ( MAKE-7PILE ?auto_106728 ?auto_106729 ?auto_106730 ?auto_106731 ?auto_106732 ?auto_106733 ?auto_106734 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_106736 - BLOCK
      ?auto_106737 - BLOCK
      ?auto_106738 - BLOCK
      ?auto_106739 - BLOCK
      ?auto_106740 - BLOCK
      ?auto_106741 - BLOCK
      ?auto_106742 - BLOCK
    )
    :vars
    (
      ?auto_106743 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106736 ?auto_106737 ) ) ( not ( = ?auto_106736 ?auto_106738 ) ) ( not ( = ?auto_106736 ?auto_106739 ) ) ( not ( = ?auto_106736 ?auto_106740 ) ) ( not ( = ?auto_106736 ?auto_106741 ) ) ( not ( = ?auto_106736 ?auto_106742 ) ) ( not ( = ?auto_106737 ?auto_106738 ) ) ( not ( = ?auto_106737 ?auto_106739 ) ) ( not ( = ?auto_106737 ?auto_106740 ) ) ( not ( = ?auto_106737 ?auto_106741 ) ) ( not ( = ?auto_106737 ?auto_106742 ) ) ( not ( = ?auto_106738 ?auto_106739 ) ) ( not ( = ?auto_106738 ?auto_106740 ) ) ( not ( = ?auto_106738 ?auto_106741 ) ) ( not ( = ?auto_106738 ?auto_106742 ) ) ( not ( = ?auto_106739 ?auto_106740 ) ) ( not ( = ?auto_106739 ?auto_106741 ) ) ( not ( = ?auto_106739 ?auto_106742 ) ) ( not ( = ?auto_106740 ?auto_106741 ) ) ( not ( = ?auto_106740 ?auto_106742 ) ) ( not ( = ?auto_106741 ?auto_106742 ) ) ( ON-TABLE ?auto_106742 ) ( ON ?auto_106741 ?auto_106742 ) ( ON ?auto_106740 ?auto_106741 ) ( ON ?auto_106736 ?auto_106743 ) ( not ( = ?auto_106736 ?auto_106743 ) ) ( not ( = ?auto_106737 ?auto_106743 ) ) ( not ( = ?auto_106738 ?auto_106743 ) ) ( not ( = ?auto_106739 ?auto_106743 ) ) ( not ( = ?auto_106740 ?auto_106743 ) ) ( not ( = ?auto_106741 ?auto_106743 ) ) ( not ( = ?auto_106742 ?auto_106743 ) ) ( ON ?auto_106737 ?auto_106736 ) ( ON-TABLE ?auto_106743 ) ( ON ?auto_106738 ?auto_106737 ) ( CLEAR ?auto_106740 ) ( ON ?auto_106739 ?auto_106738 ) ( CLEAR ?auto_106739 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_106743 ?auto_106736 ?auto_106737 ?auto_106738 )
      ( MAKE-7PILE ?auto_106736 ?auto_106737 ?auto_106738 ?auto_106739 ?auto_106740 ?auto_106741 ?auto_106742 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_106744 - BLOCK
      ?auto_106745 - BLOCK
      ?auto_106746 - BLOCK
      ?auto_106747 - BLOCK
      ?auto_106748 - BLOCK
      ?auto_106749 - BLOCK
      ?auto_106750 - BLOCK
    )
    :vars
    (
      ?auto_106751 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106744 ?auto_106745 ) ) ( not ( = ?auto_106744 ?auto_106746 ) ) ( not ( = ?auto_106744 ?auto_106747 ) ) ( not ( = ?auto_106744 ?auto_106748 ) ) ( not ( = ?auto_106744 ?auto_106749 ) ) ( not ( = ?auto_106744 ?auto_106750 ) ) ( not ( = ?auto_106745 ?auto_106746 ) ) ( not ( = ?auto_106745 ?auto_106747 ) ) ( not ( = ?auto_106745 ?auto_106748 ) ) ( not ( = ?auto_106745 ?auto_106749 ) ) ( not ( = ?auto_106745 ?auto_106750 ) ) ( not ( = ?auto_106746 ?auto_106747 ) ) ( not ( = ?auto_106746 ?auto_106748 ) ) ( not ( = ?auto_106746 ?auto_106749 ) ) ( not ( = ?auto_106746 ?auto_106750 ) ) ( not ( = ?auto_106747 ?auto_106748 ) ) ( not ( = ?auto_106747 ?auto_106749 ) ) ( not ( = ?auto_106747 ?auto_106750 ) ) ( not ( = ?auto_106748 ?auto_106749 ) ) ( not ( = ?auto_106748 ?auto_106750 ) ) ( not ( = ?auto_106749 ?auto_106750 ) ) ( ON-TABLE ?auto_106750 ) ( ON ?auto_106749 ?auto_106750 ) ( ON ?auto_106744 ?auto_106751 ) ( not ( = ?auto_106744 ?auto_106751 ) ) ( not ( = ?auto_106745 ?auto_106751 ) ) ( not ( = ?auto_106746 ?auto_106751 ) ) ( not ( = ?auto_106747 ?auto_106751 ) ) ( not ( = ?auto_106748 ?auto_106751 ) ) ( not ( = ?auto_106749 ?auto_106751 ) ) ( not ( = ?auto_106750 ?auto_106751 ) ) ( ON ?auto_106745 ?auto_106744 ) ( ON-TABLE ?auto_106751 ) ( ON ?auto_106746 ?auto_106745 ) ( ON ?auto_106747 ?auto_106746 ) ( CLEAR ?auto_106747 ) ( HOLDING ?auto_106748 ) ( CLEAR ?auto_106749 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_106750 ?auto_106749 ?auto_106748 )
      ( MAKE-7PILE ?auto_106744 ?auto_106745 ?auto_106746 ?auto_106747 ?auto_106748 ?auto_106749 ?auto_106750 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_106752 - BLOCK
      ?auto_106753 - BLOCK
      ?auto_106754 - BLOCK
      ?auto_106755 - BLOCK
      ?auto_106756 - BLOCK
      ?auto_106757 - BLOCK
      ?auto_106758 - BLOCK
    )
    :vars
    (
      ?auto_106759 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106752 ?auto_106753 ) ) ( not ( = ?auto_106752 ?auto_106754 ) ) ( not ( = ?auto_106752 ?auto_106755 ) ) ( not ( = ?auto_106752 ?auto_106756 ) ) ( not ( = ?auto_106752 ?auto_106757 ) ) ( not ( = ?auto_106752 ?auto_106758 ) ) ( not ( = ?auto_106753 ?auto_106754 ) ) ( not ( = ?auto_106753 ?auto_106755 ) ) ( not ( = ?auto_106753 ?auto_106756 ) ) ( not ( = ?auto_106753 ?auto_106757 ) ) ( not ( = ?auto_106753 ?auto_106758 ) ) ( not ( = ?auto_106754 ?auto_106755 ) ) ( not ( = ?auto_106754 ?auto_106756 ) ) ( not ( = ?auto_106754 ?auto_106757 ) ) ( not ( = ?auto_106754 ?auto_106758 ) ) ( not ( = ?auto_106755 ?auto_106756 ) ) ( not ( = ?auto_106755 ?auto_106757 ) ) ( not ( = ?auto_106755 ?auto_106758 ) ) ( not ( = ?auto_106756 ?auto_106757 ) ) ( not ( = ?auto_106756 ?auto_106758 ) ) ( not ( = ?auto_106757 ?auto_106758 ) ) ( ON-TABLE ?auto_106758 ) ( ON ?auto_106757 ?auto_106758 ) ( ON ?auto_106752 ?auto_106759 ) ( not ( = ?auto_106752 ?auto_106759 ) ) ( not ( = ?auto_106753 ?auto_106759 ) ) ( not ( = ?auto_106754 ?auto_106759 ) ) ( not ( = ?auto_106755 ?auto_106759 ) ) ( not ( = ?auto_106756 ?auto_106759 ) ) ( not ( = ?auto_106757 ?auto_106759 ) ) ( not ( = ?auto_106758 ?auto_106759 ) ) ( ON ?auto_106753 ?auto_106752 ) ( ON-TABLE ?auto_106759 ) ( ON ?auto_106754 ?auto_106753 ) ( ON ?auto_106755 ?auto_106754 ) ( CLEAR ?auto_106757 ) ( ON ?auto_106756 ?auto_106755 ) ( CLEAR ?auto_106756 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_106759 ?auto_106752 ?auto_106753 ?auto_106754 ?auto_106755 )
      ( MAKE-7PILE ?auto_106752 ?auto_106753 ?auto_106754 ?auto_106755 ?auto_106756 ?auto_106757 ?auto_106758 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_106760 - BLOCK
      ?auto_106761 - BLOCK
      ?auto_106762 - BLOCK
      ?auto_106763 - BLOCK
      ?auto_106764 - BLOCK
      ?auto_106765 - BLOCK
      ?auto_106766 - BLOCK
    )
    :vars
    (
      ?auto_106767 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106760 ?auto_106761 ) ) ( not ( = ?auto_106760 ?auto_106762 ) ) ( not ( = ?auto_106760 ?auto_106763 ) ) ( not ( = ?auto_106760 ?auto_106764 ) ) ( not ( = ?auto_106760 ?auto_106765 ) ) ( not ( = ?auto_106760 ?auto_106766 ) ) ( not ( = ?auto_106761 ?auto_106762 ) ) ( not ( = ?auto_106761 ?auto_106763 ) ) ( not ( = ?auto_106761 ?auto_106764 ) ) ( not ( = ?auto_106761 ?auto_106765 ) ) ( not ( = ?auto_106761 ?auto_106766 ) ) ( not ( = ?auto_106762 ?auto_106763 ) ) ( not ( = ?auto_106762 ?auto_106764 ) ) ( not ( = ?auto_106762 ?auto_106765 ) ) ( not ( = ?auto_106762 ?auto_106766 ) ) ( not ( = ?auto_106763 ?auto_106764 ) ) ( not ( = ?auto_106763 ?auto_106765 ) ) ( not ( = ?auto_106763 ?auto_106766 ) ) ( not ( = ?auto_106764 ?auto_106765 ) ) ( not ( = ?auto_106764 ?auto_106766 ) ) ( not ( = ?auto_106765 ?auto_106766 ) ) ( ON-TABLE ?auto_106766 ) ( ON ?auto_106760 ?auto_106767 ) ( not ( = ?auto_106760 ?auto_106767 ) ) ( not ( = ?auto_106761 ?auto_106767 ) ) ( not ( = ?auto_106762 ?auto_106767 ) ) ( not ( = ?auto_106763 ?auto_106767 ) ) ( not ( = ?auto_106764 ?auto_106767 ) ) ( not ( = ?auto_106765 ?auto_106767 ) ) ( not ( = ?auto_106766 ?auto_106767 ) ) ( ON ?auto_106761 ?auto_106760 ) ( ON-TABLE ?auto_106767 ) ( ON ?auto_106762 ?auto_106761 ) ( ON ?auto_106763 ?auto_106762 ) ( ON ?auto_106764 ?auto_106763 ) ( CLEAR ?auto_106764 ) ( HOLDING ?auto_106765 ) ( CLEAR ?auto_106766 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_106766 ?auto_106765 )
      ( MAKE-7PILE ?auto_106760 ?auto_106761 ?auto_106762 ?auto_106763 ?auto_106764 ?auto_106765 ?auto_106766 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_106768 - BLOCK
      ?auto_106769 - BLOCK
      ?auto_106770 - BLOCK
      ?auto_106771 - BLOCK
      ?auto_106772 - BLOCK
      ?auto_106773 - BLOCK
      ?auto_106774 - BLOCK
    )
    :vars
    (
      ?auto_106775 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106768 ?auto_106769 ) ) ( not ( = ?auto_106768 ?auto_106770 ) ) ( not ( = ?auto_106768 ?auto_106771 ) ) ( not ( = ?auto_106768 ?auto_106772 ) ) ( not ( = ?auto_106768 ?auto_106773 ) ) ( not ( = ?auto_106768 ?auto_106774 ) ) ( not ( = ?auto_106769 ?auto_106770 ) ) ( not ( = ?auto_106769 ?auto_106771 ) ) ( not ( = ?auto_106769 ?auto_106772 ) ) ( not ( = ?auto_106769 ?auto_106773 ) ) ( not ( = ?auto_106769 ?auto_106774 ) ) ( not ( = ?auto_106770 ?auto_106771 ) ) ( not ( = ?auto_106770 ?auto_106772 ) ) ( not ( = ?auto_106770 ?auto_106773 ) ) ( not ( = ?auto_106770 ?auto_106774 ) ) ( not ( = ?auto_106771 ?auto_106772 ) ) ( not ( = ?auto_106771 ?auto_106773 ) ) ( not ( = ?auto_106771 ?auto_106774 ) ) ( not ( = ?auto_106772 ?auto_106773 ) ) ( not ( = ?auto_106772 ?auto_106774 ) ) ( not ( = ?auto_106773 ?auto_106774 ) ) ( ON-TABLE ?auto_106774 ) ( ON ?auto_106768 ?auto_106775 ) ( not ( = ?auto_106768 ?auto_106775 ) ) ( not ( = ?auto_106769 ?auto_106775 ) ) ( not ( = ?auto_106770 ?auto_106775 ) ) ( not ( = ?auto_106771 ?auto_106775 ) ) ( not ( = ?auto_106772 ?auto_106775 ) ) ( not ( = ?auto_106773 ?auto_106775 ) ) ( not ( = ?auto_106774 ?auto_106775 ) ) ( ON ?auto_106769 ?auto_106768 ) ( ON-TABLE ?auto_106775 ) ( ON ?auto_106770 ?auto_106769 ) ( ON ?auto_106771 ?auto_106770 ) ( ON ?auto_106772 ?auto_106771 ) ( CLEAR ?auto_106774 ) ( ON ?auto_106773 ?auto_106772 ) ( CLEAR ?auto_106773 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_106775 ?auto_106768 ?auto_106769 ?auto_106770 ?auto_106771 ?auto_106772 )
      ( MAKE-7PILE ?auto_106768 ?auto_106769 ?auto_106770 ?auto_106771 ?auto_106772 ?auto_106773 ?auto_106774 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_106776 - BLOCK
      ?auto_106777 - BLOCK
      ?auto_106778 - BLOCK
      ?auto_106779 - BLOCK
      ?auto_106780 - BLOCK
      ?auto_106781 - BLOCK
      ?auto_106782 - BLOCK
    )
    :vars
    (
      ?auto_106783 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106776 ?auto_106777 ) ) ( not ( = ?auto_106776 ?auto_106778 ) ) ( not ( = ?auto_106776 ?auto_106779 ) ) ( not ( = ?auto_106776 ?auto_106780 ) ) ( not ( = ?auto_106776 ?auto_106781 ) ) ( not ( = ?auto_106776 ?auto_106782 ) ) ( not ( = ?auto_106777 ?auto_106778 ) ) ( not ( = ?auto_106777 ?auto_106779 ) ) ( not ( = ?auto_106777 ?auto_106780 ) ) ( not ( = ?auto_106777 ?auto_106781 ) ) ( not ( = ?auto_106777 ?auto_106782 ) ) ( not ( = ?auto_106778 ?auto_106779 ) ) ( not ( = ?auto_106778 ?auto_106780 ) ) ( not ( = ?auto_106778 ?auto_106781 ) ) ( not ( = ?auto_106778 ?auto_106782 ) ) ( not ( = ?auto_106779 ?auto_106780 ) ) ( not ( = ?auto_106779 ?auto_106781 ) ) ( not ( = ?auto_106779 ?auto_106782 ) ) ( not ( = ?auto_106780 ?auto_106781 ) ) ( not ( = ?auto_106780 ?auto_106782 ) ) ( not ( = ?auto_106781 ?auto_106782 ) ) ( ON ?auto_106776 ?auto_106783 ) ( not ( = ?auto_106776 ?auto_106783 ) ) ( not ( = ?auto_106777 ?auto_106783 ) ) ( not ( = ?auto_106778 ?auto_106783 ) ) ( not ( = ?auto_106779 ?auto_106783 ) ) ( not ( = ?auto_106780 ?auto_106783 ) ) ( not ( = ?auto_106781 ?auto_106783 ) ) ( not ( = ?auto_106782 ?auto_106783 ) ) ( ON ?auto_106777 ?auto_106776 ) ( ON-TABLE ?auto_106783 ) ( ON ?auto_106778 ?auto_106777 ) ( ON ?auto_106779 ?auto_106778 ) ( ON ?auto_106780 ?auto_106779 ) ( ON ?auto_106781 ?auto_106780 ) ( CLEAR ?auto_106781 ) ( HOLDING ?auto_106782 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_106782 )
      ( MAKE-7PILE ?auto_106776 ?auto_106777 ?auto_106778 ?auto_106779 ?auto_106780 ?auto_106781 ?auto_106782 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_106784 - BLOCK
      ?auto_106785 - BLOCK
      ?auto_106786 - BLOCK
      ?auto_106787 - BLOCK
      ?auto_106788 - BLOCK
      ?auto_106789 - BLOCK
      ?auto_106790 - BLOCK
    )
    :vars
    (
      ?auto_106791 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106784 ?auto_106785 ) ) ( not ( = ?auto_106784 ?auto_106786 ) ) ( not ( = ?auto_106784 ?auto_106787 ) ) ( not ( = ?auto_106784 ?auto_106788 ) ) ( not ( = ?auto_106784 ?auto_106789 ) ) ( not ( = ?auto_106784 ?auto_106790 ) ) ( not ( = ?auto_106785 ?auto_106786 ) ) ( not ( = ?auto_106785 ?auto_106787 ) ) ( not ( = ?auto_106785 ?auto_106788 ) ) ( not ( = ?auto_106785 ?auto_106789 ) ) ( not ( = ?auto_106785 ?auto_106790 ) ) ( not ( = ?auto_106786 ?auto_106787 ) ) ( not ( = ?auto_106786 ?auto_106788 ) ) ( not ( = ?auto_106786 ?auto_106789 ) ) ( not ( = ?auto_106786 ?auto_106790 ) ) ( not ( = ?auto_106787 ?auto_106788 ) ) ( not ( = ?auto_106787 ?auto_106789 ) ) ( not ( = ?auto_106787 ?auto_106790 ) ) ( not ( = ?auto_106788 ?auto_106789 ) ) ( not ( = ?auto_106788 ?auto_106790 ) ) ( not ( = ?auto_106789 ?auto_106790 ) ) ( ON ?auto_106784 ?auto_106791 ) ( not ( = ?auto_106784 ?auto_106791 ) ) ( not ( = ?auto_106785 ?auto_106791 ) ) ( not ( = ?auto_106786 ?auto_106791 ) ) ( not ( = ?auto_106787 ?auto_106791 ) ) ( not ( = ?auto_106788 ?auto_106791 ) ) ( not ( = ?auto_106789 ?auto_106791 ) ) ( not ( = ?auto_106790 ?auto_106791 ) ) ( ON ?auto_106785 ?auto_106784 ) ( ON-TABLE ?auto_106791 ) ( ON ?auto_106786 ?auto_106785 ) ( ON ?auto_106787 ?auto_106786 ) ( ON ?auto_106788 ?auto_106787 ) ( ON ?auto_106789 ?auto_106788 ) ( ON ?auto_106790 ?auto_106789 ) ( CLEAR ?auto_106790 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_106791 ?auto_106784 ?auto_106785 ?auto_106786 ?auto_106787 ?auto_106788 ?auto_106789 )
      ( MAKE-7PILE ?auto_106784 ?auto_106785 ?auto_106786 ?auto_106787 ?auto_106788 ?auto_106789 ?auto_106790 ) )
  )

)

