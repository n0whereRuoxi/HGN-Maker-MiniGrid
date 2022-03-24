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
      ?auto_126253 - BLOCK
    )
    :vars
    (
      ?auto_126254 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126253 ?auto_126254 ) ( CLEAR ?auto_126253 ) ( HAND-EMPTY ) ( not ( = ?auto_126253 ?auto_126254 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_126253 ?auto_126254 )
      ( !PUTDOWN ?auto_126253 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_126256 - BLOCK
    )
    :vars
    (
      ?auto_126257 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126256 ?auto_126257 ) ( CLEAR ?auto_126256 ) ( HAND-EMPTY ) ( not ( = ?auto_126256 ?auto_126257 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_126256 ?auto_126257 )
      ( !PUTDOWN ?auto_126256 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_126260 - BLOCK
      ?auto_126261 - BLOCK
    )
    :vars
    (
      ?auto_126262 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_126260 ) ( ON ?auto_126261 ?auto_126262 ) ( CLEAR ?auto_126261 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_126260 ) ( not ( = ?auto_126260 ?auto_126261 ) ) ( not ( = ?auto_126260 ?auto_126262 ) ) ( not ( = ?auto_126261 ?auto_126262 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_126261 ?auto_126262 )
      ( !STACK ?auto_126261 ?auto_126260 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_126265 - BLOCK
      ?auto_126266 - BLOCK
    )
    :vars
    (
      ?auto_126267 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_126265 ) ( ON ?auto_126266 ?auto_126267 ) ( CLEAR ?auto_126266 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_126265 ) ( not ( = ?auto_126265 ?auto_126266 ) ) ( not ( = ?auto_126265 ?auto_126267 ) ) ( not ( = ?auto_126266 ?auto_126267 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_126266 ?auto_126267 )
      ( !STACK ?auto_126266 ?auto_126265 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_126270 - BLOCK
      ?auto_126271 - BLOCK
    )
    :vars
    (
      ?auto_126272 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126271 ?auto_126272 ) ( not ( = ?auto_126270 ?auto_126271 ) ) ( not ( = ?auto_126270 ?auto_126272 ) ) ( not ( = ?auto_126271 ?auto_126272 ) ) ( ON ?auto_126270 ?auto_126271 ) ( CLEAR ?auto_126270 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_126270 )
      ( MAKE-2PILE ?auto_126270 ?auto_126271 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_126275 - BLOCK
      ?auto_126276 - BLOCK
    )
    :vars
    (
      ?auto_126277 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126276 ?auto_126277 ) ( not ( = ?auto_126275 ?auto_126276 ) ) ( not ( = ?auto_126275 ?auto_126277 ) ) ( not ( = ?auto_126276 ?auto_126277 ) ) ( ON ?auto_126275 ?auto_126276 ) ( CLEAR ?auto_126275 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_126275 )
      ( MAKE-2PILE ?auto_126275 ?auto_126276 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_126281 - BLOCK
      ?auto_126282 - BLOCK
      ?auto_126283 - BLOCK
    )
    :vars
    (
      ?auto_126284 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_126282 ) ( ON ?auto_126283 ?auto_126284 ) ( CLEAR ?auto_126283 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_126281 ) ( ON ?auto_126282 ?auto_126281 ) ( not ( = ?auto_126281 ?auto_126282 ) ) ( not ( = ?auto_126281 ?auto_126283 ) ) ( not ( = ?auto_126281 ?auto_126284 ) ) ( not ( = ?auto_126282 ?auto_126283 ) ) ( not ( = ?auto_126282 ?auto_126284 ) ) ( not ( = ?auto_126283 ?auto_126284 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_126283 ?auto_126284 )
      ( !STACK ?auto_126283 ?auto_126282 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_126288 - BLOCK
      ?auto_126289 - BLOCK
      ?auto_126290 - BLOCK
    )
    :vars
    (
      ?auto_126291 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_126289 ) ( ON ?auto_126290 ?auto_126291 ) ( CLEAR ?auto_126290 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_126288 ) ( ON ?auto_126289 ?auto_126288 ) ( not ( = ?auto_126288 ?auto_126289 ) ) ( not ( = ?auto_126288 ?auto_126290 ) ) ( not ( = ?auto_126288 ?auto_126291 ) ) ( not ( = ?auto_126289 ?auto_126290 ) ) ( not ( = ?auto_126289 ?auto_126291 ) ) ( not ( = ?auto_126290 ?auto_126291 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_126290 ?auto_126291 )
      ( !STACK ?auto_126290 ?auto_126289 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_126295 - BLOCK
      ?auto_126296 - BLOCK
      ?auto_126297 - BLOCK
    )
    :vars
    (
      ?auto_126298 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126297 ?auto_126298 ) ( ON-TABLE ?auto_126295 ) ( not ( = ?auto_126295 ?auto_126296 ) ) ( not ( = ?auto_126295 ?auto_126297 ) ) ( not ( = ?auto_126295 ?auto_126298 ) ) ( not ( = ?auto_126296 ?auto_126297 ) ) ( not ( = ?auto_126296 ?auto_126298 ) ) ( not ( = ?auto_126297 ?auto_126298 ) ) ( CLEAR ?auto_126295 ) ( ON ?auto_126296 ?auto_126297 ) ( CLEAR ?auto_126296 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_126295 ?auto_126296 )
      ( MAKE-3PILE ?auto_126295 ?auto_126296 ?auto_126297 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_126302 - BLOCK
      ?auto_126303 - BLOCK
      ?auto_126304 - BLOCK
    )
    :vars
    (
      ?auto_126305 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126304 ?auto_126305 ) ( ON-TABLE ?auto_126302 ) ( not ( = ?auto_126302 ?auto_126303 ) ) ( not ( = ?auto_126302 ?auto_126304 ) ) ( not ( = ?auto_126302 ?auto_126305 ) ) ( not ( = ?auto_126303 ?auto_126304 ) ) ( not ( = ?auto_126303 ?auto_126305 ) ) ( not ( = ?auto_126304 ?auto_126305 ) ) ( CLEAR ?auto_126302 ) ( ON ?auto_126303 ?auto_126304 ) ( CLEAR ?auto_126303 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_126302 ?auto_126303 )
      ( MAKE-3PILE ?auto_126302 ?auto_126303 ?auto_126304 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_126309 - BLOCK
      ?auto_126310 - BLOCK
      ?auto_126311 - BLOCK
    )
    :vars
    (
      ?auto_126312 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126311 ?auto_126312 ) ( not ( = ?auto_126309 ?auto_126310 ) ) ( not ( = ?auto_126309 ?auto_126311 ) ) ( not ( = ?auto_126309 ?auto_126312 ) ) ( not ( = ?auto_126310 ?auto_126311 ) ) ( not ( = ?auto_126310 ?auto_126312 ) ) ( not ( = ?auto_126311 ?auto_126312 ) ) ( ON ?auto_126310 ?auto_126311 ) ( ON ?auto_126309 ?auto_126310 ) ( CLEAR ?auto_126309 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_126309 )
      ( MAKE-3PILE ?auto_126309 ?auto_126310 ?auto_126311 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_126316 - BLOCK
      ?auto_126317 - BLOCK
      ?auto_126318 - BLOCK
    )
    :vars
    (
      ?auto_126319 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126318 ?auto_126319 ) ( not ( = ?auto_126316 ?auto_126317 ) ) ( not ( = ?auto_126316 ?auto_126318 ) ) ( not ( = ?auto_126316 ?auto_126319 ) ) ( not ( = ?auto_126317 ?auto_126318 ) ) ( not ( = ?auto_126317 ?auto_126319 ) ) ( not ( = ?auto_126318 ?auto_126319 ) ) ( ON ?auto_126317 ?auto_126318 ) ( ON ?auto_126316 ?auto_126317 ) ( CLEAR ?auto_126316 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_126316 )
      ( MAKE-3PILE ?auto_126316 ?auto_126317 ?auto_126318 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_126324 - BLOCK
      ?auto_126325 - BLOCK
      ?auto_126326 - BLOCK
      ?auto_126327 - BLOCK
    )
    :vars
    (
      ?auto_126328 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_126326 ) ( ON ?auto_126327 ?auto_126328 ) ( CLEAR ?auto_126327 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_126324 ) ( ON ?auto_126325 ?auto_126324 ) ( ON ?auto_126326 ?auto_126325 ) ( not ( = ?auto_126324 ?auto_126325 ) ) ( not ( = ?auto_126324 ?auto_126326 ) ) ( not ( = ?auto_126324 ?auto_126327 ) ) ( not ( = ?auto_126324 ?auto_126328 ) ) ( not ( = ?auto_126325 ?auto_126326 ) ) ( not ( = ?auto_126325 ?auto_126327 ) ) ( not ( = ?auto_126325 ?auto_126328 ) ) ( not ( = ?auto_126326 ?auto_126327 ) ) ( not ( = ?auto_126326 ?auto_126328 ) ) ( not ( = ?auto_126327 ?auto_126328 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_126327 ?auto_126328 )
      ( !STACK ?auto_126327 ?auto_126326 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_126333 - BLOCK
      ?auto_126334 - BLOCK
      ?auto_126335 - BLOCK
      ?auto_126336 - BLOCK
    )
    :vars
    (
      ?auto_126337 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_126335 ) ( ON ?auto_126336 ?auto_126337 ) ( CLEAR ?auto_126336 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_126333 ) ( ON ?auto_126334 ?auto_126333 ) ( ON ?auto_126335 ?auto_126334 ) ( not ( = ?auto_126333 ?auto_126334 ) ) ( not ( = ?auto_126333 ?auto_126335 ) ) ( not ( = ?auto_126333 ?auto_126336 ) ) ( not ( = ?auto_126333 ?auto_126337 ) ) ( not ( = ?auto_126334 ?auto_126335 ) ) ( not ( = ?auto_126334 ?auto_126336 ) ) ( not ( = ?auto_126334 ?auto_126337 ) ) ( not ( = ?auto_126335 ?auto_126336 ) ) ( not ( = ?auto_126335 ?auto_126337 ) ) ( not ( = ?auto_126336 ?auto_126337 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_126336 ?auto_126337 )
      ( !STACK ?auto_126336 ?auto_126335 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_126342 - BLOCK
      ?auto_126343 - BLOCK
      ?auto_126344 - BLOCK
      ?auto_126345 - BLOCK
    )
    :vars
    (
      ?auto_126346 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126345 ?auto_126346 ) ( ON-TABLE ?auto_126342 ) ( ON ?auto_126343 ?auto_126342 ) ( not ( = ?auto_126342 ?auto_126343 ) ) ( not ( = ?auto_126342 ?auto_126344 ) ) ( not ( = ?auto_126342 ?auto_126345 ) ) ( not ( = ?auto_126342 ?auto_126346 ) ) ( not ( = ?auto_126343 ?auto_126344 ) ) ( not ( = ?auto_126343 ?auto_126345 ) ) ( not ( = ?auto_126343 ?auto_126346 ) ) ( not ( = ?auto_126344 ?auto_126345 ) ) ( not ( = ?auto_126344 ?auto_126346 ) ) ( not ( = ?auto_126345 ?auto_126346 ) ) ( CLEAR ?auto_126343 ) ( ON ?auto_126344 ?auto_126345 ) ( CLEAR ?auto_126344 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_126342 ?auto_126343 ?auto_126344 )
      ( MAKE-4PILE ?auto_126342 ?auto_126343 ?auto_126344 ?auto_126345 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_126351 - BLOCK
      ?auto_126352 - BLOCK
      ?auto_126353 - BLOCK
      ?auto_126354 - BLOCK
    )
    :vars
    (
      ?auto_126355 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126354 ?auto_126355 ) ( ON-TABLE ?auto_126351 ) ( ON ?auto_126352 ?auto_126351 ) ( not ( = ?auto_126351 ?auto_126352 ) ) ( not ( = ?auto_126351 ?auto_126353 ) ) ( not ( = ?auto_126351 ?auto_126354 ) ) ( not ( = ?auto_126351 ?auto_126355 ) ) ( not ( = ?auto_126352 ?auto_126353 ) ) ( not ( = ?auto_126352 ?auto_126354 ) ) ( not ( = ?auto_126352 ?auto_126355 ) ) ( not ( = ?auto_126353 ?auto_126354 ) ) ( not ( = ?auto_126353 ?auto_126355 ) ) ( not ( = ?auto_126354 ?auto_126355 ) ) ( CLEAR ?auto_126352 ) ( ON ?auto_126353 ?auto_126354 ) ( CLEAR ?auto_126353 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_126351 ?auto_126352 ?auto_126353 )
      ( MAKE-4PILE ?auto_126351 ?auto_126352 ?auto_126353 ?auto_126354 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_126360 - BLOCK
      ?auto_126361 - BLOCK
      ?auto_126362 - BLOCK
      ?auto_126363 - BLOCK
    )
    :vars
    (
      ?auto_126364 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126363 ?auto_126364 ) ( ON-TABLE ?auto_126360 ) ( not ( = ?auto_126360 ?auto_126361 ) ) ( not ( = ?auto_126360 ?auto_126362 ) ) ( not ( = ?auto_126360 ?auto_126363 ) ) ( not ( = ?auto_126360 ?auto_126364 ) ) ( not ( = ?auto_126361 ?auto_126362 ) ) ( not ( = ?auto_126361 ?auto_126363 ) ) ( not ( = ?auto_126361 ?auto_126364 ) ) ( not ( = ?auto_126362 ?auto_126363 ) ) ( not ( = ?auto_126362 ?auto_126364 ) ) ( not ( = ?auto_126363 ?auto_126364 ) ) ( ON ?auto_126362 ?auto_126363 ) ( CLEAR ?auto_126360 ) ( ON ?auto_126361 ?auto_126362 ) ( CLEAR ?auto_126361 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_126360 ?auto_126361 )
      ( MAKE-4PILE ?auto_126360 ?auto_126361 ?auto_126362 ?auto_126363 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_126369 - BLOCK
      ?auto_126370 - BLOCK
      ?auto_126371 - BLOCK
      ?auto_126372 - BLOCK
    )
    :vars
    (
      ?auto_126373 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126372 ?auto_126373 ) ( ON-TABLE ?auto_126369 ) ( not ( = ?auto_126369 ?auto_126370 ) ) ( not ( = ?auto_126369 ?auto_126371 ) ) ( not ( = ?auto_126369 ?auto_126372 ) ) ( not ( = ?auto_126369 ?auto_126373 ) ) ( not ( = ?auto_126370 ?auto_126371 ) ) ( not ( = ?auto_126370 ?auto_126372 ) ) ( not ( = ?auto_126370 ?auto_126373 ) ) ( not ( = ?auto_126371 ?auto_126372 ) ) ( not ( = ?auto_126371 ?auto_126373 ) ) ( not ( = ?auto_126372 ?auto_126373 ) ) ( ON ?auto_126371 ?auto_126372 ) ( CLEAR ?auto_126369 ) ( ON ?auto_126370 ?auto_126371 ) ( CLEAR ?auto_126370 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_126369 ?auto_126370 )
      ( MAKE-4PILE ?auto_126369 ?auto_126370 ?auto_126371 ?auto_126372 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_126378 - BLOCK
      ?auto_126379 - BLOCK
      ?auto_126380 - BLOCK
      ?auto_126381 - BLOCK
    )
    :vars
    (
      ?auto_126382 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126381 ?auto_126382 ) ( not ( = ?auto_126378 ?auto_126379 ) ) ( not ( = ?auto_126378 ?auto_126380 ) ) ( not ( = ?auto_126378 ?auto_126381 ) ) ( not ( = ?auto_126378 ?auto_126382 ) ) ( not ( = ?auto_126379 ?auto_126380 ) ) ( not ( = ?auto_126379 ?auto_126381 ) ) ( not ( = ?auto_126379 ?auto_126382 ) ) ( not ( = ?auto_126380 ?auto_126381 ) ) ( not ( = ?auto_126380 ?auto_126382 ) ) ( not ( = ?auto_126381 ?auto_126382 ) ) ( ON ?auto_126380 ?auto_126381 ) ( ON ?auto_126379 ?auto_126380 ) ( ON ?auto_126378 ?auto_126379 ) ( CLEAR ?auto_126378 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_126378 )
      ( MAKE-4PILE ?auto_126378 ?auto_126379 ?auto_126380 ?auto_126381 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_126387 - BLOCK
      ?auto_126388 - BLOCK
      ?auto_126389 - BLOCK
      ?auto_126390 - BLOCK
    )
    :vars
    (
      ?auto_126391 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126390 ?auto_126391 ) ( not ( = ?auto_126387 ?auto_126388 ) ) ( not ( = ?auto_126387 ?auto_126389 ) ) ( not ( = ?auto_126387 ?auto_126390 ) ) ( not ( = ?auto_126387 ?auto_126391 ) ) ( not ( = ?auto_126388 ?auto_126389 ) ) ( not ( = ?auto_126388 ?auto_126390 ) ) ( not ( = ?auto_126388 ?auto_126391 ) ) ( not ( = ?auto_126389 ?auto_126390 ) ) ( not ( = ?auto_126389 ?auto_126391 ) ) ( not ( = ?auto_126390 ?auto_126391 ) ) ( ON ?auto_126389 ?auto_126390 ) ( ON ?auto_126388 ?auto_126389 ) ( ON ?auto_126387 ?auto_126388 ) ( CLEAR ?auto_126387 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_126387 )
      ( MAKE-4PILE ?auto_126387 ?auto_126388 ?auto_126389 ?auto_126390 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_126397 - BLOCK
      ?auto_126398 - BLOCK
      ?auto_126399 - BLOCK
      ?auto_126400 - BLOCK
      ?auto_126401 - BLOCK
    )
    :vars
    (
      ?auto_126402 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_126400 ) ( ON ?auto_126401 ?auto_126402 ) ( CLEAR ?auto_126401 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_126397 ) ( ON ?auto_126398 ?auto_126397 ) ( ON ?auto_126399 ?auto_126398 ) ( ON ?auto_126400 ?auto_126399 ) ( not ( = ?auto_126397 ?auto_126398 ) ) ( not ( = ?auto_126397 ?auto_126399 ) ) ( not ( = ?auto_126397 ?auto_126400 ) ) ( not ( = ?auto_126397 ?auto_126401 ) ) ( not ( = ?auto_126397 ?auto_126402 ) ) ( not ( = ?auto_126398 ?auto_126399 ) ) ( not ( = ?auto_126398 ?auto_126400 ) ) ( not ( = ?auto_126398 ?auto_126401 ) ) ( not ( = ?auto_126398 ?auto_126402 ) ) ( not ( = ?auto_126399 ?auto_126400 ) ) ( not ( = ?auto_126399 ?auto_126401 ) ) ( not ( = ?auto_126399 ?auto_126402 ) ) ( not ( = ?auto_126400 ?auto_126401 ) ) ( not ( = ?auto_126400 ?auto_126402 ) ) ( not ( = ?auto_126401 ?auto_126402 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_126401 ?auto_126402 )
      ( !STACK ?auto_126401 ?auto_126400 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_126408 - BLOCK
      ?auto_126409 - BLOCK
      ?auto_126410 - BLOCK
      ?auto_126411 - BLOCK
      ?auto_126412 - BLOCK
    )
    :vars
    (
      ?auto_126413 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_126411 ) ( ON ?auto_126412 ?auto_126413 ) ( CLEAR ?auto_126412 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_126408 ) ( ON ?auto_126409 ?auto_126408 ) ( ON ?auto_126410 ?auto_126409 ) ( ON ?auto_126411 ?auto_126410 ) ( not ( = ?auto_126408 ?auto_126409 ) ) ( not ( = ?auto_126408 ?auto_126410 ) ) ( not ( = ?auto_126408 ?auto_126411 ) ) ( not ( = ?auto_126408 ?auto_126412 ) ) ( not ( = ?auto_126408 ?auto_126413 ) ) ( not ( = ?auto_126409 ?auto_126410 ) ) ( not ( = ?auto_126409 ?auto_126411 ) ) ( not ( = ?auto_126409 ?auto_126412 ) ) ( not ( = ?auto_126409 ?auto_126413 ) ) ( not ( = ?auto_126410 ?auto_126411 ) ) ( not ( = ?auto_126410 ?auto_126412 ) ) ( not ( = ?auto_126410 ?auto_126413 ) ) ( not ( = ?auto_126411 ?auto_126412 ) ) ( not ( = ?auto_126411 ?auto_126413 ) ) ( not ( = ?auto_126412 ?auto_126413 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_126412 ?auto_126413 )
      ( !STACK ?auto_126412 ?auto_126411 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_126419 - BLOCK
      ?auto_126420 - BLOCK
      ?auto_126421 - BLOCK
      ?auto_126422 - BLOCK
      ?auto_126423 - BLOCK
    )
    :vars
    (
      ?auto_126424 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126423 ?auto_126424 ) ( ON-TABLE ?auto_126419 ) ( ON ?auto_126420 ?auto_126419 ) ( ON ?auto_126421 ?auto_126420 ) ( not ( = ?auto_126419 ?auto_126420 ) ) ( not ( = ?auto_126419 ?auto_126421 ) ) ( not ( = ?auto_126419 ?auto_126422 ) ) ( not ( = ?auto_126419 ?auto_126423 ) ) ( not ( = ?auto_126419 ?auto_126424 ) ) ( not ( = ?auto_126420 ?auto_126421 ) ) ( not ( = ?auto_126420 ?auto_126422 ) ) ( not ( = ?auto_126420 ?auto_126423 ) ) ( not ( = ?auto_126420 ?auto_126424 ) ) ( not ( = ?auto_126421 ?auto_126422 ) ) ( not ( = ?auto_126421 ?auto_126423 ) ) ( not ( = ?auto_126421 ?auto_126424 ) ) ( not ( = ?auto_126422 ?auto_126423 ) ) ( not ( = ?auto_126422 ?auto_126424 ) ) ( not ( = ?auto_126423 ?auto_126424 ) ) ( CLEAR ?auto_126421 ) ( ON ?auto_126422 ?auto_126423 ) ( CLEAR ?auto_126422 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_126419 ?auto_126420 ?auto_126421 ?auto_126422 )
      ( MAKE-5PILE ?auto_126419 ?auto_126420 ?auto_126421 ?auto_126422 ?auto_126423 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_126430 - BLOCK
      ?auto_126431 - BLOCK
      ?auto_126432 - BLOCK
      ?auto_126433 - BLOCK
      ?auto_126434 - BLOCK
    )
    :vars
    (
      ?auto_126435 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126434 ?auto_126435 ) ( ON-TABLE ?auto_126430 ) ( ON ?auto_126431 ?auto_126430 ) ( ON ?auto_126432 ?auto_126431 ) ( not ( = ?auto_126430 ?auto_126431 ) ) ( not ( = ?auto_126430 ?auto_126432 ) ) ( not ( = ?auto_126430 ?auto_126433 ) ) ( not ( = ?auto_126430 ?auto_126434 ) ) ( not ( = ?auto_126430 ?auto_126435 ) ) ( not ( = ?auto_126431 ?auto_126432 ) ) ( not ( = ?auto_126431 ?auto_126433 ) ) ( not ( = ?auto_126431 ?auto_126434 ) ) ( not ( = ?auto_126431 ?auto_126435 ) ) ( not ( = ?auto_126432 ?auto_126433 ) ) ( not ( = ?auto_126432 ?auto_126434 ) ) ( not ( = ?auto_126432 ?auto_126435 ) ) ( not ( = ?auto_126433 ?auto_126434 ) ) ( not ( = ?auto_126433 ?auto_126435 ) ) ( not ( = ?auto_126434 ?auto_126435 ) ) ( CLEAR ?auto_126432 ) ( ON ?auto_126433 ?auto_126434 ) ( CLEAR ?auto_126433 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_126430 ?auto_126431 ?auto_126432 ?auto_126433 )
      ( MAKE-5PILE ?auto_126430 ?auto_126431 ?auto_126432 ?auto_126433 ?auto_126434 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_126441 - BLOCK
      ?auto_126442 - BLOCK
      ?auto_126443 - BLOCK
      ?auto_126444 - BLOCK
      ?auto_126445 - BLOCK
    )
    :vars
    (
      ?auto_126446 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126445 ?auto_126446 ) ( ON-TABLE ?auto_126441 ) ( ON ?auto_126442 ?auto_126441 ) ( not ( = ?auto_126441 ?auto_126442 ) ) ( not ( = ?auto_126441 ?auto_126443 ) ) ( not ( = ?auto_126441 ?auto_126444 ) ) ( not ( = ?auto_126441 ?auto_126445 ) ) ( not ( = ?auto_126441 ?auto_126446 ) ) ( not ( = ?auto_126442 ?auto_126443 ) ) ( not ( = ?auto_126442 ?auto_126444 ) ) ( not ( = ?auto_126442 ?auto_126445 ) ) ( not ( = ?auto_126442 ?auto_126446 ) ) ( not ( = ?auto_126443 ?auto_126444 ) ) ( not ( = ?auto_126443 ?auto_126445 ) ) ( not ( = ?auto_126443 ?auto_126446 ) ) ( not ( = ?auto_126444 ?auto_126445 ) ) ( not ( = ?auto_126444 ?auto_126446 ) ) ( not ( = ?auto_126445 ?auto_126446 ) ) ( ON ?auto_126444 ?auto_126445 ) ( CLEAR ?auto_126442 ) ( ON ?auto_126443 ?auto_126444 ) ( CLEAR ?auto_126443 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_126441 ?auto_126442 ?auto_126443 )
      ( MAKE-5PILE ?auto_126441 ?auto_126442 ?auto_126443 ?auto_126444 ?auto_126445 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_126452 - BLOCK
      ?auto_126453 - BLOCK
      ?auto_126454 - BLOCK
      ?auto_126455 - BLOCK
      ?auto_126456 - BLOCK
    )
    :vars
    (
      ?auto_126457 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126456 ?auto_126457 ) ( ON-TABLE ?auto_126452 ) ( ON ?auto_126453 ?auto_126452 ) ( not ( = ?auto_126452 ?auto_126453 ) ) ( not ( = ?auto_126452 ?auto_126454 ) ) ( not ( = ?auto_126452 ?auto_126455 ) ) ( not ( = ?auto_126452 ?auto_126456 ) ) ( not ( = ?auto_126452 ?auto_126457 ) ) ( not ( = ?auto_126453 ?auto_126454 ) ) ( not ( = ?auto_126453 ?auto_126455 ) ) ( not ( = ?auto_126453 ?auto_126456 ) ) ( not ( = ?auto_126453 ?auto_126457 ) ) ( not ( = ?auto_126454 ?auto_126455 ) ) ( not ( = ?auto_126454 ?auto_126456 ) ) ( not ( = ?auto_126454 ?auto_126457 ) ) ( not ( = ?auto_126455 ?auto_126456 ) ) ( not ( = ?auto_126455 ?auto_126457 ) ) ( not ( = ?auto_126456 ?auto_126457 ) ) ( ON ?auto_126455 ?auto_126456 ) ( CLEAR ?auto_126453 ) ( ON ?auto_126454 ?auto_126455 ) ( CLEAR ?auto_126454 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_126452 ?auto_126453 ?auto_126454 )
      ( MAKE-5PILE ?auto_126452 ?auto_126453 ?auto_126454 ?auto_126455 ?auto_126456 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_126463 - BLOCK
      ?auto_126464 - BLOCK
      ?auto_126465 - BLOCK
      ?auto_126466 - BLOCK
      ?auto_126467 - BLOCK
    )
    :vars
    (
      ?auto_126468 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126467 ?auto_126468 ) ( ON-TABLE ?auto_126463 ) ( not ( = ?auto_126463 ?auto_126464 ) ) ( not ( = ?auto_126463 ?auto_126465 ) ) ( not ( = ?auto_126463 ?auto_126466 ) ) ( not ( = ?auto_126463 ?auto_126467 ) ) ( not ( = ?auto_126463 ?auto_126468 ) ) ( not ( = ?auto_126464 ?auto_126465 ) ) ( not ( = ?auto_126464 ?auto_126466 ) ) ( not ( = ?auto_126464 ?auto_126467 ) ) ( not ( = ?auto_126464 ?auto_126468 ) ) ( not ( = ?auto_126465 ?auto_126466 ) ) ( not ( = ?auto_126465 ?auto_126467 ) ) ( not ( = ?auto_126465 ?auto_126468 ) ) ( not ( = ?auto_126466 ?auto_126467 ) ) ( not ( = ?auto_126466 ?auto_126468 ) ) ( not ( = ?auto_126467 ?auto_126468 ) ) ( ON ?auto_126466 ?auto_126467 ) ( ON ?auto_126465 ?auto_126466 ) ( CLEAR ?auto_126463 ) ( ON ?auto_126464 ?auto_126465 ) ( CLEAR ?auto_126464 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_126463 ?auto_126464 )
      ( MAKE-5PILE ?auto_126463 ?auto_126464 ?auto_126465 ?auto_126466 ?auto_126467 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_126474 - BLOCK
      ?auto_126475 - BLOCK
      ?auto_126476 - BLOCK
      ?auto_126477 - BLOCK
      ?auto_126478 - BLOCK
    )
    :vars
    (
      ?auto_126479 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126478 ?auto_126479 ) ( ON-TABLE ?auto_126474 ) ( not ( = ?auto_126474 ?auto_126475 ) ) ( not ( = ?auto_126474 ?auto_126476 ) ) ( not ( = ?auto_126474 ?auto_126477 ) ) ( not ( = ?auto_126474 ?auto_126478 ) ) ( not ( = ?auto_126474 ?auto_126479 ) ) ( not ( = ?auto_126475 ?auto_126476 ) ) ( not ( = ?auto_126475 ?auto_126477 ) ) ( not ( = ?auto_126475 ?auto_126478 ) ) ( not ( = ?auto_126475 ?auto_126479 ) ) ( not ( = ?auto_126476 ?auto_126477 ) ) ( not ( = ?auto_126476 ?auto_126478 ) ) ( not ( = ?auto_126476 ?auto_126479 ) ) ( not ( = ?auto_126477 ?auto_126478 ) ) ( not ( = ?auto_126477 ?auto_126479 ) ) ( not ( = ?auto_126478 ?auto_126479 ) ) ( ON ?auto_126477 ?auto_126478 ) ( ON ?auto_126476 ?auto_126477 ) ( CLEAR ?auto_126474 ) ( ON ?auto_126475 ?auto_126476 ) ( CLEAR ?auto_126475 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_126474 ?auto_126475 )
      ( MAKE-5PILE ?auto_126474 ?auto_126475 ?auto_126476 ?auto_126477 ?auto_126478 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_126485 - BLOCK
      ?auto_126486 - BLOCK
      ?auto_126487 - BLOCK
      ?auto_126488 - BLOCK
      ?auto_126489 - BLOCK
    )
    :vars
    (
      ?auto_126490 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126489 ?auto_126490 ) ( not ( = ?auto_126485 ?auto_126486 ) ) ( not ( = ?auto_126485 ?auto_126487 ) ) ( not ( = ?auto_126485 ?auto_126488 ) ) ( not ( = ?auto_126485 ?auto_126489 ) ) ( not ( = ?auto_126485 ?auto_126490 ) ) ( not ( = ?auto_126486 ?auto_126487 ) ) ( not ( = ?auto_126486 ?auto_126488 ) ) ( not ( = ?auto_126486 ?auto_126489 ) ) ( not ( = ?auto_126486 ?auto_126490 ) ) ( not ( = ?auto_126487 ?auto_126488 ) ) ( not ( = ?auto_126487 ?auto_126489 ) ) ( not ( = ?auto_126487 ?auto_126490 ) ) ( not ( = ?auto_126488 ?auto_126489 ) ) ( not ( = ?auto_126488 ?auto_126490 ) ) ( not ( = ?auto_126489 ?auto_126490 ) ) ( ON ?auto_126488 ?auto_126489 ) ( ON ?auto_126487 ?auto_126488 ) ( ON ?auto_126486 ?auto_126487 ) ( ON ?auto_126485 ?auto_126486 ) ( CLEAR ?auto_126485 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_126485 )
      ( MAKE-5PILE ?auto_126485 ?auto_126486 ?auto_126487 ?auto_126488 ?auto_126489 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_126496 - BLOCK
      ?auto_126497 - BLOCK
      ?auto_126498 - BLOCK
      ?auto_126499 - BLOCK
      ?auto_126500 - BLOCK
    )
    :vars
    (
      ?auto_126501 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126500 ?auto_126501 ) ( not ( = ?auto_126496 ?auto_126497 ) ) ( not ( = ?auto_126496 ?auto_126498 ) ) ( not ( = ?auto_126496 ?auto_126499 ) ) ( not ( = ?auto_126496 ?auto_126500 ) ) ( not ( = ?auto_126496 ?auto_126501 ) ) ( not ( = ?auto_126497 ?auto_126498 ) ) ( not ( = ?auto_126497 ?auto_126499 ) ) ( not ( = ?auto_126497 ?auto_126500 ) ) ( not ( = ?auto_126497 ?auto_126501 ) ) ( not ( = ?auto_126498 ?auto_126499 ) ) ( not ( = ?auto_126498 ?auto_126500 ) ) ( not ( = ?auto_126498 ?auto_126501 ) ) ( not ( = ?auto_126499 ?auto_126500 ) ) ( not ( = ?auto_126499 ?auto_126501 ) ) ( not ( = ?auto_126500 ?auto_126501 ) ) ( ON ?auto_126499 ?auto_126500 ) ( ON ?auto_126498 ?auto_126499 ) ( ON ?auto_126497 ?auto_126498 ) ( ON ?auto_126496 ?auto_126497 ) ( CLEAR ?auto_126496 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_126496 )
      ( MAKE-5PILE ?auto_126496 ?auto_126497 ?auto_126498 ?auto_126499 ?auto_126500 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_126508 - BLOCK
      ?auto_126509 - BLOCK
      ?auto_126510 - BLOCK
      ?auto_126511 - BLOCK
      ?auto_126512 - BLOCK
      ?auto_126513 - BLOCK
    )
    :vars
    (
      ?auto_126514 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_126512 ) ( ON ?auto_126513 ?auto_126514 ) ( CLEAR ?auto_126513 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_126508 ) ( ON ?auto_126509 ?auto_126508 ) ( ON ?auto_126510 ?auto_126509 ) ( ON ?auto_126511 ?auto_126510 ) ( ON ?auto_126512 ?auto_126511 ) ( not ( = ?auto_126508 ?auto_126509 ) ) ( not ( = ?auto_126508 ?auto_126510 ) ) ( not ( = ?auto_126508 ?auto_126511 ) ) ( not ( = ?auto_126508 ?auto_126512 ) ) ( not ( = ?auto_126508 ?auto_126513 ) ) ( not ( = ?auto_126508 ?auto_126514 ) ) ( not ( = ?auto_126509 ?auto_126510 ) ) ( not ( = ?auto_126509 ?auto_126511 ) ) ( not ( = ?auto_126509 ?auto_126512 ) ) ( not ( = ?auto_126509 ?auto_126513 ) ) ( not ( = ?auto_126509 ?auto_126514 ) ) ( not ( = ?auto_126510 ?auto_126511 ) ) ( not ( = ?auto_126510 ?auto_126512 ) ) ( not ( = ?auto_126510 ?auto_126513 ) ) ( not ( = ?auto_126510 ?auto_126514 ) ) ( not ( = ?auto_126511 ?auto_126512 ) ) ( not ( = ?auto_126511 ?auto_126513 ) ) ( not ( = ?auto_126511 ?auto_126514 ) ) ( not ( = ?auto_126512 ?auto_126513 ) ) ( not ( = ?auto_126512 ?auto_126514 ) ) ( not ( = ?auto_126513 ?auto_126514 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_126513 ?auto_126514 )
      ( !STACK ?auto_126513 ?auto_126512 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_126521 - BLOCK
      ?auto_126522 - BLOCK
      ?auto_126523 - BLOCK
      ?auto_126524 - BLOCK
      ?auto_126525 - BLOCK
      ?auto_126526 - BLOCK
    )
    :vars
    (
      ?auto_126527 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_126525 ) ( ON ?auto_126526 ?auto_126527 ) ( CLEAR ?auto_126526 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_126521 ) ( ON ?auto_126522 ?auto_126521 ) ( ON ?auto_126523 ?auto_126522 ) ( ON ?auto_126524 ?auto_126523 ) ( ON ?auto_126525 ?auto_126524 ) ( not ( = ?auto_126521 ?auto_126522 ) ) ( not ( = ?auto_126521 ?auto_126523 ) ) ( not ( = ?auto_126521 ?auto_126524 ) ) ( not ( = ?auto_126521 ?auto_126525 ) ) ( not ( = ?auto_126521 ?auto_126526 ) ) ( not ( = ?auto_126521 ?auto_126527 ) ) ( not ( = ?auto_126522 ?auto_126523 ) ) ( not ( = ?auto_126522 ?auto_126524 ) ) ( not ( = ?auto_126522 ?auto_126525 ) ) ( not ( = ?auto_126522 ?auto_126526 ) ) ( not ( = ?auto_126522 ?auto_126527 ) ) ( not ( = ?auto_126523 ?auto_126524 ) ) ( not ( = ?auto_126523 ?auto_126525 ) ) ( not ( = ?auto_126523 ?auto_126526 ) ) ( not ( = ?auto_126523 ?auto_126527 ) ) ( not ( = ?auto_126524 ?auto_126525 ) ) ( not ( = ?auto_126524 ?auto_126526 ) ) ( not ( = ?auto_126524 ?auto_126527 ) ) ( not ( = ?auto_126525 ?auto_126526 ) ) ( not ( = ?auto_126525 ?auto_126527 ) ) ( not ( = ?auto_126526 ?auto_126527 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_126526 ?auto_126527 )
      ( !STACK ?auto_126526 ?auto_126525 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_126534 - BLOCK
      ?auto_126535 - BLOCK
      ?auto_126536 - BLOCK
      ?auto_126537 - BLOCK
      ?auto_126538 - BLOCK
      ?auto_126539 - BLOCK
    )
    :vars
    (
      ?auto_126540 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126539 ?auto_126540 ) ( ON-TABLE ?auto_126534 ) ( ON ?auto_126535 ?auto_126534 ) ( ON ?auto_126536 ?auto_126535 ) ( ON ?auto_126537 ?auto_126536 ) ( not ( = ?auto_126534 ?auto_126535 ) ) ( not ( = ?auto_126534 ?auto_126536 ) ) ( not ( = ?auto_126534 ?auto_126537 ) ) ( not ( = ?auto_126534 ?auto_126538 ) ) ( not ( = ?auto_126534 ?auto_126539 ) ) ( not ( = ?auto_126534 ?auto_126540 ) ) ( not ( = ?auto_126535 ?auto_126536 ) ) ( not ( = ?auto_126535 ?auto_126537 ) ) ( not ( = ?auto_126535 ?auto_126538 ) ) ( not ( = ?auto_126535 ?auto_126539 ) ) ( not ( = ?auto_126535 ?auto_126540 ) ) ( not ( = ?auto_126536 ?auto_126537 ) ) ( not ( = ?auto_126536 ?auto_126538 ) ) ( not ( = ?auto_126536 ?auto_126539 ) ) ( not ( = ?auto_126536 ?auto_126540 ) ) ( not ( = ?auto_126537 ?auto_126538 ) ) ( not ( = ?auto_126537 ?auto_126539 ) ) ( not ( = ?auto_126537 ?auto_126540 ) ) ( not ( = ?auto_126538 ?auto_126539 ) ) ( not ( = ?auto_126538 ?auto_126540 ) ) ( not ( = ?auto_126539 ?auto_126540 ) ) ( CLEAR ?auto_126537 ) ( ON ?auto_126538 ?auto_126539 ) ( CLEAR ?auto_126538 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_126534 ?auto_126535 ?auto_126536 ?auto_126537 ?auto_126538 )
      ( MAKE-6PILE ?auto_126534 ?auto_126535 ?auto_126536 ?auto_126537 ?auto_126538 ?auto_126539 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_126547 - BLOCK
      ?auto_126548 - BLOCK
      ?auto_126549 - BLOCK
      ?auto_126550 - BLOCK
      ?auto_126551 - BLOCK
      ?auto_126552 - BLOCK
    )
    :vars
    (
      ?auto_126553 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126552 ?auto_126553 ) ( ON-TABLE ?auto_126547 ) ( ON ?auto_126548 ?auto_126547 ) ( ON ?auto_126549 ?auto_126548 ) ( ON ?auto_126550 ?auto_126549 ) ( not ( = ?auto_126547 ?auto_126548 ) ) ( not ( = ?auto_126547 ?auto_126549 ) ) ( not ( = ?auto_126547 ?auto_126550 ) ) ( not ( = ?auto_126547 ?auto_126551 ) ) ( not ( = ?auto_126547 ?auto_126552 ) ) ( not ( = ?auto_126547 ?auto_126553 ) ) ( not ( = ?auto_126548 ?auto_126549 ) ) ( not ( = ?auto_126548 ?auto_126550 ) ) ( not ( = ?auto_126548 ?auto_126551 ) ) ( not ( = ?auto_126548 ?auto_126552 ) ) ( not ( = ?auto_126548 ?auto_126553 ) ) ( not ( = ?auto_126549 ?auto_126550 ) ) ( not ( = ?auto_126549 ?auto_126551 ) ) ( not ( = ?auto_126549 ?auto_126552 ) ) ( not ( = ?auto_126549 ?auto_126553 ) ) ( not ( = ?auto_126550 ?auto_126551 ) ) ( not ( = ?auto_126550 ?auto_126552 ) ) ( not ( = ?auto_126550 ?auto_126553 ) ) ( not ( = ?auto_126551 ?auto_126552 ) ) ( not ( = ?auto_126551 ?auto_126553 ) ) ( not ( = ?auto_126552 ?auto_126553 ) ) ( CLEAR ?auto_126550 ) ( ON ?auto_126551 ?auto_126552 ) ( CLEAR ?auto_126551 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_126547 ?auto_126548 ?auto_126549 ?auto_126550 ?auto_126551 )
      ( MAKE-6PILE ?auto_126547 ?auto_126548 ?auto_126549 ?auto_126550 ?auto_126551 ?auto_126552 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_126560 - BLOCK
      ?auto_126561 - BLOCK
      ?auto_126562 - BLOCK
      ?auto_126563 - BLOCK
      ?auto_126564 - BLOCK
      ?auto_126565 - BLOCK
    )
    :vars
    (
      ?auto_126566 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126565 ?auto_126566 ) ( ON-TABLE ?auto_126560 ) ( ON ?auto_126561 ?auto_126560 ) ( ON ?auto_126562 ?auto_126561 ) ( not ( = ?auto_126560 ?auto_126561 ) ) ( not ( = ?auto_126560 ?auto_126562 ) ) ( not ( = ?auto_126560 ?auto_126563 ) ) ( not ( = ?auto_126560 ?auto_126564 ) ) ( not ( = ?auto_126560 ?auto_126565 ) ) ( not ( = ?auto_126560 ?auto_126566 ) ) ( not ( = ?auto_126561 ?auto_126562 ) ) ( not ( = ?auto_126561 ?auto_126563 ) ) ( not ( = ?auto_126561 ?auto_126564 ) ) ( not ( = ?auto_126561 ?auto_126565 ) ) ( not ( = ?auto_126561 ?auto_126566 ) ) ( not ( = ?auto_126562 ?auto_126563 ) ) ( not ( = ?auto_126562 ?auto_126564 ) ) ( not ( = ?auto_126562 ?auto_126565 ) ) ( not ( = ?auto_126562 ?auto_126566 ) ) ( not ( = ?auto_126563 ?auto_126564 ) ) ( not ( = ?auto_126563 ?auto_126565 ) ) ( not ( = ?auto_126563 ?auto_126566 ) ) ( not ( = ?auto_126564 ?auto_126565 ) ) ( not ( = ?auto_126564 ?auto_126566 ) ) ( not ( = ?auto_126565 ?auto_126566 ) ) ( ON ?auto_126564 ?auto_126565 ) ( CLEAR ?auto_126562 ) ( ON ?auto_126563 ?auto_126564 ) ( CLEAR ?auto_126563 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_126560 ?auto_126561 ?auto_126562 ?auto_126563 )
      ( MAKE-6PILE ?auto_126560 ?auto_126561 ?auto_126562 ?auto_126563 ?auto_126564 ?auto_126565 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_126573 - BLOCK
      ?auto_126574 - BLOCK
      ?auto_126575 - BLOCK
      ?auto_126576 - BLOCK
      ?auto_126577 - BLOCK
      ?auto_126578 - BLOCK
    )
    :vars
    (
      ?auto_126579 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126578 ?auto_126579 ) ( ON-TABLE ?auto_126573 ) ( ON ?auto_126574 ?auto_126573 ) ( ON ?auto_126575 ?auto_126574 ) ( not ( = ?auto_126573 ?auto_126574 ) ) ( not ( = ?auto_126573 ?auto_126575 ) ) ( not ( = ?auto_126573 ?auto_126576 ) ) ( not ( = ?auto_126573 ?auto_126577 ) ) ( not ( = ?auto_126573 ?auto_126578 ) ) ( not ( = ?auto_126573 ?auto_126579 ) ) ( not ( = ?auto_126574 ?auto_126575 ) ) ( not ( = ?auto_126574 ?auto_126576 ) ) ( not ( = ?auto_126574 ?auto_126577 ) ) ( not ( = ?auto_126574 ?auto_126578 ) ) ( not ( = ?auto_126574 ?auto_126579 ) ) ( not ( = ?auto_126575 ?auto_126576 ) ) ( not ( = ?auto_126575 ?auto_126577 ) ) ( not ( = ?auto_126575 ?auto_126578 ) ) ( not ( = ?auto_126575 ?auto_126579 ) ) ( not ( = ?auto_126576 ?auto_126577 ) ) ( not ( = ?auto_126576 ?auto_126578 ) ) ( not ( = ?auto_126576 ?auto_126579 ) ) ( not ( = ?auto_126577 ?auto_126578 ) ) ( not ( = ?auto_126577 ?auto_126579 ) ) ( not ( = ?auto_126578 ?auto_126579 ) ) ( ON ?auto_126577 ?auto_126578 ) ( CLEAR ?auto_126575 ) ( ON ?auto_126576 ?auto_126577 ) ( CLEAR ?auto_126576 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_126573 ?auto_126574 ?auto_126575 ?auto_126576 )
      ( MAKE-6PILE ?auto_126573 ?auto_126574 ?auto_126575 ?auto_126576 ?auto_126577 ?auto_126578 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_126586 - BLOCK
      ?auto_126587 - BLOCK
      ?auto_126588 - BLOCK
      ?auto_126589 - BLOCK
      ?auto_126590 - BLOCK
      ?auto_126591 - BLOCK
    )
    :vars
    (
      ?auto_126592 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126591 ?auto_126592 ) ( ON-TABLE ?auto_126586 ) ( ON ?auto_126587 ?auto_126586 ) ( not ( = ?auto_126586 ?auto_126587 ) ) ( not ( = ?auto_126586 ?auto_126588 ) ) ( not ( = ?auto_126586 ?auto_126589 ) ) ( not ( = ?auto_126586 ?auto_126590 ) ) ( not ( = ?auto_126586 ?auto_126591 ) ) ( not ( = ?auto_126586 ?auto_126592 ) ) ( not ( = ?auto_126587 ?auto_126588 ) ) ( not ( = ?auto_126587 ?auto_126589 ) ) ( not ( = ?auto_126587 ?auto_126590 ) ) ( not ( = ?auto_126587 ?auto_126591 ) ) ( not ( = ?auto_126587 ?auto_126592 ) ) ( not ( = ?auto_126588 ?auto_126589 ) ) ( not ( = ?auto_126588 ?auto_126590 ) ) ( not ( = ?auto_126588 ?auto_126591 ) ) ( not ( = ?auto_126588 ?auto_126592 ) ) ( not ( = ?auto_126589 ?auto_126590 ) ) ( not ( = ?auto_126589 ?auto_126591 ) ) ( not ( = ?auto_126589 ?auto_126592 ) ) ( not ( = ?auto_126590 ?auto_126591 ) ) ( not ( = ?auto_126590 ?auto_126592 ) ) ( not ( = ?auto_126591 ?auto_126592 ) ) ( ON ?auto_126590 ?auto_126591 ) ( ON ?auto_126589 ?auto_126590 ) ( CLEAR ?auto_126587 ) ( ON ?auto_126588 ?auto_126589 ) ( CLEAR ?auto_126588 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_126586 ?auto_126587 ?auto_126588 )
      ( MAKE-6PILE ?auto_126586 ?auto_126587 ?auto_126588 ?auto_126589 ?auto_126590 ?auto_126591 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_126599 - BLOCK
      ?auto_126600 - BLOCK
      ?auto_126601 - BLOCK
      ?auto_126602 - BLOCK
      ?auto_126603 - BLOCK
      ?auto_126604 - BLOCK
    )
    :vars
    (
      ?auto_126605 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126604 ?auto_126605 ) ( ON-TABLE ?auto_126599 ) ( ON ?auto_126600 ?auto_126599 ) ( not ( = ?auto_126599 ?auto_126600 ) ) ( not ( = ?auto_126599 ?auto_126601 ) ) ( not ( = ?auto_126599 ?auto_126602 ) ) ( not ( = ?auto_126599 ?auto_126603 ) ) ( not ( = ?auto_126599 ?auto_126604 ) ) ( not ( = ?auto_126599 ?auto_126605 ) ) ( not ( = ?auto_126600 ?auto_126601 ) ) ( not ( = ?auto_126600 ?auto_126602 ) ) ( not ( = ?auto_126600 ?auto_126603 ) ) ( not ( = ?auto_126600 ?auto_126604 ) ) ( not ( = ?auto_126600 ?auto_126605 ) ) ( not ( = ?auto_126601 ?auto_126602 ) ) ( not ( = ?auto_126601 ?auto_126603 ) ) ( not ( = ?auto_126601 ?auto_126604 ) ) ( not ( = ?auto_126601 ?auto_126605 ) ) ( not ( = ?auto_126602 ?auto_126603 ) ) ( not ( = ?auto_126602 ?auto_126604 ) ) ( not ( = ?auto_126602 ?auto_126605 ) ) ( not ( = ?auto_126603 ?auto_126604 ) ) ( not ( = ?auto_126603 ?auto_126605 ) ) ( not ( = ?auto_126604 ?auto_126605 ) ) ( ON ?auto_126603 ?auto_126604 ) ( ON ?auto_126602 ?auto_126603 ) ( CLEAR ?auto_126600 ) ( ON ?auto_126601 ?auto_126602 ) ( CLEAR ?auto_126601 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_126599 ?auto_126600 ?auto_126601 )
      ( MAKE-6PILE ?auto_126599 ?auto_126600 ?auto_126601 ?auto_126602 ?auto_126603 ?auto_126604 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_126612 - BLOCK
      ?auto_126613 - BLOCK
      ?auto_126614 - BLOCK
      ?auto_126615 - BLOCK
      ?auto_126616 - BLOCK
      ?auto_126617 - BLOCK
    )
    :vars
    (
      ?auto_126618 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126617 ?auto_126618 ) ( ON-TABLE ?auto_126612 ) ( not ( = ?auto_126612 ?auto_126613 ) ) ( not ( = ?auto_126612 ?auto_126614 ) ) ( not ( = ?auto_126612 ?auto_126615 ) ) ( not ( = ?auto_126612 ?auto_126616 ) ) ( not ( = ?auto_126612 ?auto_126617 ) ) ( not ( = ?auto_126612 ?auto_126618 ) ) ( not ( = ?auto_126613 ?auto_126614 ) ) ( not ( = ?auto_126613 ?auto_126615 ) ) ( not ( = ?auto_126613 ?auto_126616 ) ) ( not ( = ?auto_126613 ?auto_126617 ) ) ( not ( = ?auto_126613 ?auto_126618 ) ) ( not ( = ?auto_126614 ?auto_126615 ) ) ( not ( = ?auto_126614 ?auto_126616 ) ) ( not ( = ?auto_126614 ?auto_126617 ) ) ( not ( = ?auto_126614 ?auto_126618 ) ) ( not ( = ?auto_126615 ?auto_126616 ) ) ( not ( = ?auto_126615 ?auto_126617 ) ) ( not ( = ?auto_126615 ?auto_126618 ) ) ( not ( = ?auto_126616 ?auto_126617 ) ) ( not ( = ?auto_126616 ?auto_126618 ) ) ( not ( = ?auto_126617 ?auto_126618 ) ) ( ON ?auto_126616 ?auto_126617 ) ( ON ?auto_126615 ?auto_126616 ) ( ON ?auto_126614 ?auto_126615 ) ( CLEAR ?auto_126612 ) ( ON ?auto_126613 ?auto_126614 ) ( CLEAR ?auto_126613 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_126612 ?auto_126613 )
      ( MAKE-6PILE ?auto_126612 ?auto_126613 ?auto_126614 ?auto_126615 ?auto_126616 ?auto_126617 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_126625 - BLOCK
      ?auto_126626 - BLOCK
      ?auto_126627 - BLOCK
      ?auto_126628 - BLOCK
      ?auto_126629 - BLOCK
      ?auto_126630 - BLOCK
    )
    :vars
    (
      ?auto_126631 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126630 ?auto_126631 ) ( ON-TABLE ?auto_126625 ) ( not ( = ?auto_126625 ?auto_126626 ) ) ( not ( = ?auto_126625 ?auto_126627 ) ) ( not ( = ?auto_126625 ?auto_126628 ) ) ( not ( = ?auto_126625 ?auto_126629 ) ) ( not ( = ?auto_126625 ?auto_126630 ) ) ( not ( = ?auto_126625 ?auto_126631 ) ) ( not ( = ?auto_126626 ?auto_126627 ) ) ( not ( = ?auto_126626 ?auto_126628 ) ) ( not ( = ?auto_126626 ?auto_126629 ) ) ( not ( = ?auto_126626 ?auto_126630 ) ) ( not ( = ?auto_126626 ?auto_126631 ) ) ( not ( = ?auto_126627 ?auto_126628 ) ) ( not ( = ?auto_126627 ?auto_126629 ) ) ( not ( = ?auto_126627 ?auto_126630 ) ) ( not ( = ?auto_126627 ?auto_126631 ) ) ( not ( = ?auto_126628 ?auto_126629 ) ) ( not ( = ?auto_126628 ?auto_126630 ) ) ( not ( = ?auto_126628 ?auto_126631 ) ) ( not ( = ?auto_126629 ?auto_126630 ) ) ( not ( = ?auto_126629 ?auto_126631 ) ) ( not ( = ?auto_126630 ?auto_126631 ) ) ( ON ?auto_126629 ?auto_126630 ) ( ON ?auto_126628 ?auto_126629 ) ( ON ?auto_126627 ?auto_126628 ) ( CLEAR ?auto_126625 ) ( ON ?auto_126626 ?auto_126627 ) ( CLEAR ?auto_126626 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_126625 ?auto_126626 )
      ( MAKE-6PILE ?auto_126625 ?auto_126626 ?auto_126627 ?auto_126628 ?auto_126629 ?auto_126630 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_126638 - BLOCK
      ?auto_126639 - BLOCK
      ?auto_126640 - BLOCK
      ?auto_126641 - BLOCK
      ?auto_126642 - BLOCK
      ?auto_126643 - BLOCK
    )
    :vars
    (
      ?auto_126644 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126643 ?auto_126644 ) ( not ( = ?auto_126638 ?auto_126639 ) ) ( not ( = ?auto_126638 ?auto_126640 ) ) ( not ( = ?auto_126638 ?auto_126641 ) ) ( not ( = ?auto_126638 ?auto_126642 ) ) ( not ( = ?auto_126638 ?auto_126643 ) ) ( not ( = ?auto_126638 ?auto_126644 ) ) ( not ( = ?auto_126639 ?auto_126640 ) ) ( not ( = ?auto_126639 ?auto_126641 ) ) ( not ( = ?auto_126639 ?auto_126642 ) ) ( not ( = ?auto_126639 ?auto_126643 ) ) ( not ( = ?auto_126639 ?auto_126644 ) ) ( not ( = ?auto_126640 ?auto_126641 ) ) ( not ( = ?auto_126640 ?auto_126642 ) ) ( not ( = ?auto_126640 ?auto_126643 ) ) ( not ( = ?auto_126640 ?auto_126644 ) ) ( not ( = ?auto_126641 ?auto_126642 ) ) ( not ( = ?auto_126641 ?auto_126643 ) ) ( not ( = ?auto_126641 ?auto_126644 ) ) ( not ( = ?auto_126642 ?auto_126643 ) ) ( not ( = ?auto_126642 ?auto_126644 ) ) ( not ( = ?auto_126643 ?auto_126644 ) ) ( ON ?auto_126642 ?auto_126643 ) ( ON ?auto_126641 ?auto_126642 ) ( ON ?auto_126640 ?auto_126641 ) ( ON ?auto_126639 ?auto_126640 ) ( ON ?auto_126638 ?auto_126639 ) ( CLEAR ?auto_126638 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_126638 )
      ( MAKE-6PILE ?auto_126638 ?auto_126639 ?auto_126640 ?auto_126641 ?auto_126642 ?auto_126643 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_126651 - BLOCK
      ?auto_126652 - BLOCK
      ?auto_126653 - BLOCK
      ?auto_126654 - BLOCK
      ?auto_126655 - BLOCK
      ?auto_126656 - BLOCK
    )
    :vars
    (
      ?auto_126657 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126656 ?auto_126657 ) ( not ( = ?auto_126651 ?auto_126652 ) ) ( not ( = ?auto_126651 ?auto_126653 ) ) ( not ( = ?auto_126651 ?auto_126654 ) ) ( not ( = ?auto_126651 ?auto_126655 ) ) ( not ( = ?auto_126651 ?auto_126656 ) ) ( not ( = ?auto_126651 ?auto_126657 ) ) ( not ( = ?auto_126652 ?auto_126653 ) ) ( not ( = ?auto_126652 ?auto_126654 ) ) ( not ( = ?auto_126652 ?auto_126655 ) ) ( not ( = ?auto_126652 ?auto_126656 ) ) ( not ( = ?auto_126652 ?auto_126657 ) ) ( not ( = ?auto_126653 ?auto_126654 ) ) ( not ( = ?auto_126653 ?auto_126655 ) ) ( not ( = ?auto_126653 ?auto_126656 ) ) ( not ( = ?auto_126653 ?auto_126657 ) ) ( not ( = ?auto_126654 ?auto_126655 ) ) ( not ( = ?auto_126654 ?auto_126656 ) ) ( not ( = ?auto_126654 ?auto_126657 ) ) ( not ( = ?auto_126655 ?auto_126656 ) ) ( not ( = ?auto_126655 ?auto_126657 ) ) ( not ( = ?auto_126656 ?auto_126657 ) ) ( ON ?auto_126655 ?auto_126656 ) ( ON ?auto_126654 ?auto_126655 ) ( ON ?auto_126653 ?auto_126654 ) ( ON ?auto_126652 ?auto_126653 ) ( ON ?auto_126651 ?auto_126652 ) ( CLEAR ?auto_126651 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_126651 )
      ( MAKE-6PILE ?auto_126651 ?auto_126652 ?auto_126653 ?auto_126654 ?auto_126655 ?auto_126656 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_126665 - BLOCK
      ?auto_126666 - BLOCK
      ?auto_126667 - BLOCK
      ?auto_126668 - BLOCK
      ?auto_126669 - BLOCK
      ?auto_126670 - BLOCK
      ?auto_126671 - BLOCK
    )
    :vars
    (
      ?auto_126672 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_126670 ) ( ON ?auto_126671 ?auto_126672 ) ( CLEAR ?auto_126671 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_126665 ) ( ON ?auto_126666 ?auto_126665 ) ( ON ?auto_126667 ?auto_126666 ) ( ON ?auto_126668 ?auto_126667 ) ( ON ?auto_126669 ?auto_126668 ) ( ON ?auto_126670 ?auto_126669 ) ( not ( = ?auto_126665 ?auto_126666 ) ) ( not ( = ?auto_126665 ?auto_126667 ) ) ( not ( = ?auto_126665 ?auto_126668 ) ) ( not ( = ?auto_126665 ?auto_126669 ) ) ( not ( = ?auto_126665 ?auto_126670 ) ) ( not ( = ?auto_126665 ?auto_126671 ) ) ( not ( = ?auto_126665 ?auto_126672 ) ) ( not ( = ?auto_126666 ?auto_126667 ) ) ( not ( = ?auto_126666 ?auto_126668 ) ) ( not ( = ?auto_126666 ?auto_126669 ) ) ( not ( = ?auto_126666 ?auto_126670 ) ) ( not ( = ?auto_126666 ?auto_126671 ) ) ( not ( = ?auto_126666 ?auto_126672 ) ) ( not ( = ?auto_126667 ?auto_126668 ) ) ( not ( = ?auto_126667 ?auto_126669 ) ) ( not ( = ?auto_126667 ?auto_126670 ) ) ( not ( = ?auto_126667 ?auto_126671 ) ) ( not ( = ?auto_126667 ?auto_126672 ) ) ( not ( = ?auto_126668 ?auto_126669 ) ) ( not ( = ?auto_126668 ?auto_126670 ) ) ( not ( = ?auto_126668 ?auto_126671 ) ) ( not ( = ?auto_126668 ?auto_126672 ) ) ( not ( = ?auto_126669 ?auto_126670 ) ) ( not ( = ?auto_126669 ?auto_126671 ) ) ( not ( = ?auto_126669 ?auto_126672 ) ) ( not ( = ?auto_126670 ?auto_126671 ) ) ( not ( = ?auto_126670 ?auto_126672 ) ) ( not ( = ?auto_126671 ?auto_126672 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_126671 ?auto_126672 )
      ( !STACK ?auto_126671 ?auto_126670 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_126680 - BLOCK
      ?auto_126681 - BLOCK
      ?auto_126682 - BLOCK
      ?auto_126683 - BLOCK
      ?auto_126684 - BLOCK
      ?auto_126685 - BLOCK
      ?auto_126686 - BLOCK
    )
    :vars
    (
      ?auto_126687 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_126685 ) ( ON ?auto_126686 ?auto_126687 ) ( CLEAR ?auto_126686 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_126680 ) ( ON ?auto_126681 ?auto_126680 ) ( ON ?auto_126682 ?auto_126681 ) ( ON ?auto_126683 ?auto_126682 ) ( ON ?auto_126684 ?auto_126683 ) ( ON ?auto_126685 ?auto_126684 ) ( not ( = ?auto_126680 ?auto_126681 ) ) ( not ( = ?auto_126680 ?auto_126682 ) ) ( not ( = ?auto_126680 ?auto_126683 ) ) ( not ( = ?auto_126680 ?auto_126684 ) ) ( not ( = ?auto_126680 ?auto_126685 ) ) ( not ( = ?auto_126680 ?auto_126686 ) ) ( not ( = ?auto_126680 ?auto_126687 ) ) ( not ( = ?auto_126681 ?auto_126682 ) ) ( not ( = ?auto_126681 ?auto_126683 ) ) ( not ( = ?auto_126681 ?auto_126684 ) ) ( not ( = ?auto_126681 ?auto_126685 ) ) ( not ( = ?auto_126681 ?auto_126686 ) ) ( not ( = ?auto_126681 ?auto_126687 ) ) ( not ( = ?auto_126682 ?auto_126683 ) ) ( not ( = ?auto_126682 ?auto_126684 ) ) ( not ( = ?auto_126682 ?auto_126685 ) ) ( not ( = ?auto_126682 ?auto_126686 ) ) ( not ( = ?auto_126682 ?auto_126687 ) ) ( not ( = ?auto_126683 ?auto_126684 ) ) ( not ( = ?auto_126683 ?auto_126685 ) ) ( not ( = ?auto_126683 ?auto_126686 ) ) ( not ( = ?auto_126683 ?auto_126687 ) ) ( not ( = ?auto_126684 ?auto_126685 ) ) ( not ( = ?auto_126684 ?auto_126686 ) ) ( not ( = ?auto_126684 ?auto_126687 ) ) ( not ( = ?auto_126685 ?auto_126686 ) ) ( not ( = ?auto_126685 ?auto_126687 ) ) ( not ( = ?auto_126686 ?auto_126687 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_126686 ?auto_126687 )
      ( !STACK ?auto_126686 ?auto_126685 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_126695 - BLOCK
      ?auto_126696 - BLOCK
      ?auto_126697 - BLOCK
      ?auto_126698 - BLOCK
      ?auto_126699 - BLOCK
      ?auto_126700 - BLOCK
      ?auto_126701 - BLOCK
    )
    :vars
    (
      ?auto_126702 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126701 ?auto_126702 ) ( ON-TABLE ?auto_126695 ) ( ON ?auto_126696 ?auto_126695 ) ( ON ?auto_126697 ?auto_126696 ) ( ON ?auto_126698 ?auto_126697 ) ( ON ?auto_126699 ?auto_126698 ) ( not ( = ?auto_126695 ?auto_126696 ) ) ( not ( = ?auto_126695 ?auto_126697 ) ) ( not ( = ?auto_126695 ?auto_126698 ) ) ( not ( = ?auto_126695 ?auto_126699 ) ) ( not ( = ?auto_126695 ?auto_126700 ) ) ( not ( = ?auto_126695 ?auto_126701 ) ) ( not ( = ?auto_126695 ?auto_126702 ) ) ( not ( = ?auto_126696 ?auto_126697 ) ) ( not ( = ?auto_126696 ?auto_126698 ) ) ( not ( = ?auto_126696 ?auto_126699 ) ) ( not ( = ?auto_126696 ?auto_126700 ) ) ( not ( = ?auto_126696 ?auto_126701 ) ) ( not ( = ?auto_126696 ?auto_126702 ) ) ( not ( = ?auto_126697 ?auto_126698 ) ) ( not ( = ?auto_126697 ?auto_126699 ) ) ( not ( = ?auto_126697 ?auto_126700 ) ) ( not ( = ?auto_126697 ?auto_126701 ) ) ( not ( = ?auto_126697 ?auto_126702 ) ) ( not ( = ?auto_126698 ?auto_126699 ) ) ( not ( = ?auto_126698 ?auto_126700 ) ) ( not ( = ?auto_126698 ?auto_126701 ) ) ( not ( = ?auto_126698 ?auto_126702 ) ) ( not ( = ?auto_126699 ?auto_126700 ) ) ( not ( = ?auto_126699 ?auto_126701 ) ) ( not ( = ?auto_126699 ?auto_126702 ) ) ( not ( = ?auto_126700 ?auto_126701 ) ) ( not ( = ?auto_126700 ?auto_126702 ) ) ( not ( = ?auto_126701 ?auto_126702 ) ) ( CLEAR ?auto_126699 ) ( ON ?auto_126700 ?auto_126701 ) ( CLEAR ?auto_126700 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_126695 ?auto_126696 ?auto_126697 ?auto_126698 ?auto_126699 ?auto_126700 )
      ( MAKE-7PILE ?auto_126695 ?auto_126696 ?auto_126697 ?auto_126698 ?auto_126699 ?auto_126700 ?auto_126701 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_126710 - BLOCK
      ?auto_126711 - BLOCK
      ?auto_126712 - BLOCK
      ?auto_126713 - BLOCK
      ?auto_126714 - BLOCK
      ?auto_126715 - BLOCK
      ?auto_126716 - BLOCK
    )
    :vars
    (
      ?auto_126717 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126716 ?auto_126717 ) ( ON-TABLE ?auto_126710 ) ( ON ?auto_126711 ?auto_126710 ) ( ON ?auto_126712 ?auto_126711 ) ( ON ?auto_126713 ?auto_126712 ) ( ON ?auto_126714 ?auto_126713 ) ( not ( = ?auto_126710 ?auto_126711 ) ) ( not ( = ?auto_126710 ?auto_126712 ) ) ( not ( = ?auto_126710 ?auto_126713 ) ) ( not ( = ?auto_126710 ?auto_126714 ) ) ( not ( = ?auto_126710 ?auto_126715 ) ) ( not ( = ?auto_126710 ?auto_126716 ) ) ( not ( = ?auto_126710 ?auto_126717 ) ) ( not ( = ?auto_126711 ?auto_126712 ) ) ( not ( = ?auto_126711 ?auto_126713 ) ) ( not ( = ?auto_126711 ?auto_126714 ) ) ( not ( = ?auto_126711 ?auto_126715 ) ) ( not ( = ?auto_126711 ?auto_126716 ) ) ( not ( = ?auto_126711 ?auto_126717 ) ) ( not ( = ?auto_126712 ?auto_126713 ) ) ( not ( = ?auto_126712 ?auto_126714 ) ) ( not ( = ?auto_126712 ?auto_126715 ) ) ( not ( = ?auto_126712 ?auto_126716 ) ) ( not ( = ?auto_126712 ?auto_126717 ) ) ( not ( = ?auto_126713 ?auto_126714 ) ) ( not ( = ?auto_126713 ?auto_126715 ) ) ( not ( = ?auto_126713 ?auto_126716 ) ) ( not ( = ?auto_126713 ?auto_126717 ) ) ( not ( = ?auto_126714 ?auto_126715 ) ) ( not ( = ?auto_126714 ?auto_126716 ) ) ( not ( = ?auto_126714 ?auto_126717 ) ) ( not ( = ?auto_126715 ?auto_126716 ) ) ( not ( = ?auto_126715 ?auto_126717 ) ) ( not ( = ?auto_126716 ?auto_126717 ) ) ( CLEAR ?auto_126714 ) ( ON ?auto_126715 ?auto_126716 ) ( CLEAR ?auto_126715 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_126710 ?auto_126711 ?auto_126712 ?auto_126713 ?auto_126714 ?auto_126715 )
      ( MAKE-7PILE ?auto_126710 ?auto_126711 ?auto_126712 ?auto_126713 ?auto_126714 ?auto_126715 ?auto_126716 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_126725 - BLOCK
      ?auto_126726 - BLOCK
      ?auto_126727 - BLOCK
      ?auto_126728 - BLOCK
      ?auto_126729 - BLOCK
      ?auto_126730 - BLOCK
      ?auto_126731 - BLOCK
    )
    :vars
    (
      ?auto_126732 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126731 ?auto_126732 ) ( ON-TABLE ?auto_126725 ) ( ON ?auto_126726 ?auto_126725 ) ( ON ?auto_126727 ?auto_126726 ) ( ON ?auto_126728 ?auto_126727 ) ( not ( = ?auto_126725 ?auto_126726 ) ) ( not ( = ?auto_126725 ?auto_126727 ) ) ( not ( = ?auto_126725 ?auto_126728 ) ) ( not ( = ?auto_126725 ?auto_126729 ) ) ( not ( = ?auto_126725 ?auto_126730 ) ) ( not ( = ?auto_126725 ?auto_126731 ) ) ( not ( = ?auto_126725 ?auto_126732 ) ) ( not ( = ?auto_126726 ?auto_126727 ) ) ( not ( = ?auto_126726 ?auto_126728 ) ) ( not ( = ?auto_126726 ?auto_126729 ) ) ( not ( = ?auto_126726 ?auto_126730 ) ) ( not ( = ?auto_126726 ?auto_126731 ) ) ( not ( = ?auto_126726 ?auto_126732 ) ) ( not ( = ?auto_126727 ?auto_126728 ) ) ( not ( = ?auto_126727 ?auto_126729 ) ) ( not ( = ?auto_126727 ?auto_126730 ) ) ( not ( = ?auto_126727 ?auto_126731 ) ) ( not ( = ?auto_126727 ?auto_126732 ) ) ( not ( = ?auto_126728 ?auto_126729 ) ) ( not ( = ?auto_126728 ?auto_126730 ) ) ( not ( = ?auto_126728 ?auto_126731 ) ) ( not ( = ?auto_126728 ?auto_126732 ) ) ( not ( = ?auto_126729 ?auto_126730 ) ) ( not ( = ?auto_126729 ?auto_126731 ) ) ( not ( = ?auto_126729 ?auto_126732 ) ) ( not ( = ?auto_126730 ?auto_126731 ) ) ( not ( = ?auto_126730 ?auto_126732 ) ) ( not ( = ?auto_126731 ?auto_126732 ) ) ( ON ?auto_126730 ?auto_126731 ) ( CLEAR ?auto_126728 ) ( ON ?auto_126729 ?auto_126730 ) ( CLEAR ?auto_126729 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_126725 ?auto_126726 ?auto_126727 ?auto_126728 ?auto_126729 )
      ( MAKE-7PILE ?auto_126725 ?auto_126726 ?auto_126727 ?auto_126728 ?auto_126729 ?auto_126730 ?auto_126731 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_126740 - BLOCK
      ?auto_126741 - BLOCK
      ?auto_126742 - BLOCK
      ?auto_126743 - BLOCK
      ?auto_126744 - BLOCK
      ?auto_126745 - BLOCK
      ?auto_126746 - BLOCK
    )
    :vars
    (
      ?auto_126747 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126746 ?auto_126747 ) ( ON-TABLE ?auto_126740 ) ( ON ?auto_126741 ?auto_126740 ) ( ON ?auto_126742 ?auto_126741 ) ( ON ?auto_126743 ?auto_126742 ) ( not ( = ?auto_126740 ?auto_126741 ) ) ( not ( = ?auto_126740 ?auto_126742 ) ) ( not ( = ?auto_126740 ?auto_126743 ) ) ( not ( = ?auto_126740 ?auto_126744 ) ) ( not ( = ?auto_126740 ?auto_126745 ) ) ( not ( = ?auto_126740 ?auto_126746 ) ) ( not ( = ?auto_126740 ?auto_126747 ) ) ( not ( = ?auto_126741 ?auto_126742 ) ) ( not ( = ?auto_126741 ?auto_126743 ) ) ( not ( = ?auto_126741 ?auto_126744 ) ) ( not ( = ?auto_126741 ?auto_126745 ) ) ( not ( = ?auto_126741 ?auto_126746 ) ) ( not ( = ?auto_126741 ?auto_126747 ) ) ( not ( = ?auto_126742 ?auto_126743 ) ) ( not ( = ?auto_126742 ?auto_126744 ) ) ( not ( = ?auto_126742 ?auto_126745 ) ) ( not ( = ?auto_126742 ?auto_126746 ) ) ( not ( = ?auto_126742 ?auto_126747 ) ) ( not ( = ?auto_126743 ?auto_126744 ) ) ( not ( = ?auto_126743 ?auto_126745 ) ) ( not ( = ?auto_126743 ?auto_126746 ) ) ( not ( = ?auto_126743 ?auto_126747 ) ) ( not ( = ?auto_126744 ?auto_126745 ) ) ( not ( = ?auto_126744 ?auto_126746 ) ) ( not ( = ?auto_126744 ?auto_126747 ) ) ( not ( = ?auto_126745 ?auto_126746 ) ) ( not ( = ?auto_126745 ?auto_126747 ) ) ( not ( = ?auto_126746 ?auto_126747 ) ) ( ON ?auto_126745 ?auto_126746 ) ( CLEAR ?auto_126743 ) ( ON ?auto_126744 ?auto_126745 ) ( CLEAR ?auto_126744 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_126740 ?auto_126741 ?auto_126742 ?auto_126743 ?auto_126744 )
      ( MAKE-7PILE ?auto_126740 ?auto_126741 ?auto_126742 ?auto_126743 ?auto_126744 ?auto_126745 ?auto_126746 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_126755 - BLOCK
      ?auto_126756 - BLOCK
      ?auto_126757 - BLOCK
      ?auto_126758 - BLOCK
      ?auto_126759 - BLOCK
      ?auto_126760 - BLOCK
      ?auto_126761 - BLOCK
    )
    :vars
    (
      ?auto_126762 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126761 ?auto_126762 ) ( ON-TABLE ?auto_126755 ) ( ON ?auto_126756 ?auto_126755 ) ( ON ?auto_126757 ?auto_126756 ) ( not ( = ?auto_126755 ?auto_126756 ) ) ( not ( = ?auto_126755 ?auto_126757 ) ) ( not ( = ?auto_126755 ?auto_126758 ) ) ( not ( = ?auto_126755 ?auto_126759 ) ) ( not ( = ?auto_126755 ?auto_126760 ) ) ( not ( = ?auto_126755 ?auto_126761 ) ) ( not ( = ?auto_126755 ?auto_126762 ) ) ( not ( = ?auto_126756 ?auto_126757 ) ) ( not ( = ?auto_126756 ?auto_126758 ) ) ( not ( = ?auto_126756 ?auto_126759 ) ) ( not ( = ?auto_126756 ?auto_126760 ) ) ( not ( = ?auto_126756 ?auto_126761 ) ) ( not ( = ?auto_126756 ?auto_126762 ) ) ( not ( = ?auto_126757 ?auto_126758 ) ) ( not ( = ?auto_126757 ?auto_126759 ) ) ( not ( = ?auto_126757 ?auto_126760 ) ) ( not ( = ?auto_126757 ?auto_126761 ) ) ( not ( = ?auto_126757 ?auto_126762 ) ) ( not ( = ?auto_126758 ?auto_126759 ) ) ( not ( = ?auto_126758 ?auto_126760 ) ) ( not ( = ?auto_126758 ?auto_126761 ) ) ( not ( = ?auto_126758 ?auto_126762 ) ) ( not ( = ?auto_126759 ?auto_126760 ) ) ( not ( = ?auto_126759 ?auto_126761 ) ) ( not ( = ?auto_126759 ?auto_126762 ) ) ( not ( = ?auto_126760 ?auto_126761 ) ) ( not ( = ?auto_126760 ?auto_126762 ) ) ( not ( = ?auto_126761 ?auto_126762 ) ) ( ON ?auto_126760 ?auto_126761 ) ( ON ?auto_126759 ?auto_126760 ) ( CLEAR ?auto_126757 ) ( ON ?auto_126758 ?auto_126759 ) ( CLEAR ?auto_126758 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_126755 ?auto_126756 ?auto_126757 ?auto_126758 )
      ( MAKE-7PILE ?auto_126755 ?auto_126756 ?auto_126757 ?auto_126758 ?auto_126759 ?auto_126760 ?auto_126761 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_126770 - BLOCK
      ?auto_126771 - BLOCK
      ?auto_126772 - BLOCK
      ?auto_126773 - BLOCK
      ?auto_126774 - BLOCK
      ?auto_126775 - BLOCK
      ?auto_126776 - BLOCK
    )
    :vars
    (
      ?auto_126777 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126776 ?auto_126777 ) ( ON-TABLE ?auto_126770 ) ( ON ?auto_126771 ?auto_126770 ) ( ON ?auto_126772 ?auto_126771 ) ( not ( = ?auto_126770 ?auto_126771 ) ) ( not ( = ?auto_126770 ?auto_126772 ) ) ( not ( = ?auto_126770 ?auto_126773 ) ) ( not ( = ?auto_126770 ?auto_126774 ) ) ( not ( = ?auto_126770 ?auto_126775 ) ) ( not ( = ?auto_126770 ?auto_126776 ) ) ( not ( = ?auto_126770 ?auto_126777 ) ) ( not ( = ?auto_126771 ?auto_126772 ) ) ( not ( = ?auto_126771 ?auto_126773 ) ) ( not ( = ?auto_126771 ?auto_126774 ) ) ( not ( = ?auto_126771 ?auto_126775 ) ) ( not ( = ?auto_126771 ?auto_126776 ) ) ( not ( = ?auto_126771 ?auto_126777 ) ) ( not ( = ?auto_126772 ?auto_126773 ) ) ( not ( = ?auto_126772 ?auto_126774 ) ) ( not ( = ?auto_126772 ?auto_126775 ) ) ( not ( = ?auto_126772 ?auto_126776 ) ) ( not ( = ?auto_126772 ?auto_126777 ) ) ( not ( = ?auto_126773 ?auto_126774 ) ) ( not ( = ?auto_126773 ?auto_126775 ) ) ( not ( = ?auto_126773 ?auto_126776 ) ) ( not ( = ?auto_126773 ?auto_126777 ) ) ( not ( = ?auto_126774 ?auto_126775 ) ) ( not ( = ?auto_126774 ?auto_126776 ) ) ( not ( = ?auto_126774 ?auto_126777 ) ) ( not ( = ?auto_126775 ?auto_126776 ) ) ( not ( = ?auto_126775 ?auto_126777 ) ) ( not ( = ?auto_126776 ?auto_126777 ) ) ( ON ?auto_126775 ?auto_126776 ) ( ON ?auto_126774 ?auto_126775 ) ( CLEAR ?auto_126772 ) ( ON ?auto_126773 ?auto_126774 ) ( CLEAR ?auto_126773 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_126770 ?auto_126771 ?auto_126772 ?auto_126773 )
      ( MAKE-7PILE ?auto_126770 ?auto_126771 ?auto_126772 ?auto_126773 ?auto_126774 ?auto_126775 ?auto_126776 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_126785 - BLOCK
      ?auto_126786 - BLOCK
      ?auto_126787 - BLOCK
      ?auto_126788 - BLOCK
      ?auto_126789 - BLOCK
      ?auto_126790 - BLOCK
      ?auto_126791 - BLOCK
    )
    :vars
    (
      ?auto_126792 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126791 ?auto_126792 ) ( ON-TABLE ?auto_126785 ) ( ON ?auto_126786 ?auto_126785 ) ( not ( = ?auto_126785 ?auto_126786 ) ) ( not ( = ?auto_126785 ?auto_126787 ) ) ( not ( = ?auto_126785 ?auto_126788 ) ) ( not ( = ?auto_126785 ?auto_126789 ) ) ( not ( = ?auto_126785 ?auto_126790 ) ) ( not ( = ?auto_126785 ?auto_126791 ) ) ( not ( = ?auto_126785 ?auto_126792 ) ) ( not ( = ?auto_126786 ?auto_126787 ) ) ( not ( = ?auto_126786 ?auto_126788 ) ) ( not ( = ?auto_126786 ?auto_126789 ) ) ( not ( = ?auto_126786 ?auto_126790 ) ) ( not ( = ?auto_126786 ?auto_126791 ) ) ( not ( = ?auto_126786 ?auto_126792 ) ) ( not ( = ?auto_126787 ?auto_126788 ) ) ( not ( = ?auto_126787 ?auto_126789 ) ) ( not ( = ?auto_126787 ?auto_126790 ) ) ( not ( = ?auto_126787 ?auto_126791 ) ) ( not ( = ?auto_126787 ?auto_126792 ) ) ( not ( = ?auto_126788 ?auto_126789 ) ) ( not ( = ?auto_126788 ?auto_126790 ) ) ( not ( = ?auto_126788 ?auto_126791 ) ) ( not ( = ?auto_126788 ?auto_126792 ) ) ( not ( = ?auto_126789 ?auto_126790 ) ) ( not ( = ?auto_126789 ?auto_126791 ) ) ( not ( = ?auto_126789 ?auto_126792 ) ) ( not ( = ?auto_126790 ?auto_126791 ) ) ( not ( = ?auto_126790 ?auto_126792 ) ) ( not ( = ?auto_126791 ?auto_126792 ) ) ( ON ?auto_126790 ?auto_126791 ) ( ON ?auto_126789 ?auto_126790 ) ( ON ?auto_126788 ?auto_126789 ) ( CLEAR ?auto_126786 ) ( ON ?auto_126787 ?auto_126788 ) ( CLEAR ?auto_126787 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_126785 ?auto_126786 ?auto_126787 )
      ( MAKE-7PILE ?auto_126785 ?auto_126786 ?auto_126787 ?auto_126788 ?auto_126789 ?auto_126790 ?auto_126791 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_126800 - BLOCK
      ?auto_126801 - BLOCK
      ?auto_126802 - BLOCK
      ?auto_126803 - BLOCK
      ?auto_126804 - BLOCK
      ?auto_126805 - BLOCK
      ?auto_126806 - BLOCK
    )
    :vars
    (
      ?auto_126807 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126806 ?auto_126807 ) ( ON-TABLE ?auto_126800 ) ( ON ?auto_126801 ?auto_126800 ) ( not ( = ?auto_126800 ?auto_126801 ) ) ( not ( = ?auto_126800 ?auto_126802 ) ) ( not ( = ?auto_126800 ?auto_126803 ) ) ( not ( = ?auto_126800 ?auto_126804 ) ) ( not ( = ?auto_126800 ?auto_126805 ) ) ( not ( = ?auto_126800 ?auto_126806 ) ) ( not ( = ?auto_126800 ?auto_126807 ) ) ( not ( = ?auto_126801 ?auto_126802 ) ) ( not ( = ?auto_126801 ?auto_126803 ) ) ( not ( = ?auto_126801 ?auto_126804 ) ) ( not ( = ?auto_126801 ?auto_126805 ) ) ( not ( = ?auto_126801 ?auto_126806 ) ) ( not ( = ?auto_126801 ?auto_126807 ) ) ( not ( = ?auto_126802 ?auto_126803 ) ) ( not ( = ?auto_126802 ?auto_126804 ) ) ( not ( = ?auto_126802 ?auto_126805 ) ) ( not ( = ?auto_126802 ?auto_126806 ) ) ( not ( = ?auto_126802 ?auto_126807 ) ) ( not ( = ?auto_126803 ?auto_126804 ) ) ( not ( = ?auto_126803 ?auto_126805 ) ) ( not ( = ?auto_126803 ?auto_126806 ) ) ( not ( = ?auto_126803 ?auto_126807 ) ) ( not ( = ?auto_126804 ?auto_126805 ) ) ( not ( = ?auto_126804 ?auto_126806 ) ) ( not ( = ?auto_126804 ?auto_126807 ) ) ( not ( = ?auto_126805 ?auto_126806 ) ) ( not ( = ?auto_126805 ?auto_126807 ) ) ( not ( = ?auto_126806 ?auto_126807 ) ) ( ON ?auto_126805 ?auto_126806 ) ( ON ?auto_126804 ?auto_126805 ) ( ON ?auto_126803 ?auto_126804 ) ( CLEAR ?auto_126801 ) ( ON ?auto_126802 ?auto_126803 ) ( CLEAR ?auto_126802 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_126800 ?auto_126801 ?auto_126802 )
      ( MAKE-7PILE ?auto_126800 ?auto_126801 ?auto_126802 ?auto_126803 ?auto_126804 ?auto_126805 ?auto_126806 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_126815 - BLOCK
      ?auto_126816 - BLOCK
      ?auto_126817 - BLOCK
      ?auto_126818 - BLOCK
      ?auto_126819 - BLOCK
      ?auto_126820 - BLOCK
      ?auto_126821 - BLOCK
    )
    :vars
    (
      ?auto_126822 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126821 ?auto_126822 ) ( ON-TABLE ?auto_126815 ) ( not ( = ?auto_126815 ?auto_126816 ) ) ( not ( = ?auto_126815 ?auto_126817 ) ) ( not ( = ?auto_126815 ?auto_126818 ) ) ( not ( = ?auto_126815 ?auto_126819 ) ) ( not ( = ?auto_126815 ?auto_126820 ) ) ( not ( = ?auto_126815 ?auto_126821 ) ) ( not ( = ?auto_126815 ?auto_126822 ) ) ( not ( = ?auto_126816 ?auto_126817 ) ) ( not ( = ?auto_126816 ?auto_126818 ) ) ( not ( = ?auto_126816 ?auto_126819 ) ) ( not ( = ?auto_126816 ?auto_126820 ) ) ( not ( = ?auto_126816 ?auto_126821 ) ) ( not ( = ?auto_126816 ?auto_126822 ) ) ( not ( = ?auto_126817 ?auto_126818 ) ) ( not ( = ?auto_126817 ?auto_126819 ) ) ( not ( = ?auto_126817 ?auto_126820 ) ) ( not ( = ?auto_126817 ?auto_126821 ) ) ( not ( = ?auto_126817 ?auto_126822 ) ) ( not ( = ?auto_126818 ?auto_126819 ) ) ( not ( = ?auto_126818 ?auto_126820 ) ) ( not ( = ?auto_126818 ?auto_126821 ) ) ( not ( = ?auto_126818 ?auto_126822 ) ) ( not ( = ?auto_126819 ?auto_126820 ) ) ( not ( = ?auto_126819 ?auto_126821 ) ) ( not ( = ?auto_126819 ?auto_126822 ) ) ( not ( = ?auto_126820 ?auto_126821 ) ) ( not ( = ?auto_126820 ?auto_126822 ) ) ( not ( = ?auto_126821 ?auto_126822 ) ) ( ON ?auto_126820 ?auto_126821 ) ( ON ?auto_126819 ?auto_126820 ) ( ON ?auto_126818 ?auto_126819 ) ( ON ?auto_126817 ?auto_126818 ) ( CLEAR ?auto_126815 ) ( ON ?auto_126816 ?auto_126817 ) ( CLEAR ?auto_126816 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_126815 ?auto_126816 )
      ( MAKE-7PILE ?auto_126815 ?auto_126816 ?auto_126817 ?auto_126818 ?auto_126819 ?auto_126820 ?auto_126821 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_126830 - BLOCK
      ?auto_126831 - BLOCK
      ?auto_126832 - BLOCK
      ?auto_126833 - BLOCK
      ?auto_126834 - BLOCK
      ?auto_126835 - BLOCK
      ?auto_126836 - BLOCK
    )
    :vars
    (
      ?auto_126837 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126836 ?auto_126837 ) ( ON-TABLE ?auto_126830 ) ( not ( = ?auto_126830 ?auto_126831 ) ) ( not ( = ?auto_126830 ?auto_126832 ) ) ( not ( = ?auto_126830 ?auto_126833 ) ) ( not ( = ?auto_126830 ?auto_126834 ) ) ( not ( = ?auto_126830 ?auto_126835 ) ) ( not ( = ?auto_126830 ?auto_126836 ) ) ( not ( = ?auto_126830 ?auto_126837 ) ) ( not ( = ?auto_126831 ?auto_126832 ) ) ( not ( = ?auto_126831 ?auto_126833 ) ) ( not ( = ?auto_126831 ?auto_126834 ) ) ( not ( = ?auto_126831 ?auto_126835 ) ) ( not ( = ?auto_126831 ?auto_126836 ) ) ( not ( = ?auto_126831 ?auto_126837 ) ) ( not ( = ?auto_126832 ?auto_126833 ) ) ( not ( = ?auto_126832 ?auto_126834 ) ) ( not ( = ?auto_126832 ?auto_126835 ) ) ( not ( = ?auto_126832 ?auto_126836 ) ) ( not ( = ?auto_126832 ?auto_126837 ) ) ( not ( = ?auto_126833 ?auto_126834 ) ) ( not ( = ?auto_126833 ?auto_126835 ) ) ( not ( = ?auto_126833 ?auto_126836 ) ) ( not ( = ?auto_126833 ?auto_126837 ) ) ( not ( = ?auto_126834 ?auto_126835 ) ) ( not ( = ?auto_126834 ?auto_126836 ) ) ( not ( = ?auto_126834 ?auto_126837 ) ) ( not ( = ?auto_126835 ?auto_126836 ) ) ( not ( = ?auto_126835 ?auto_126837 ) ) ( not ( = ?auto_126836 ?auto_126837 ) ) ( ON ?auto_126835 ?auto_126836 ) ( ON ?auto_126834 ?auto_126835 ) ( ON ?auto_126833 ?auto_126834 ) ( ON ?auto_126832 ?auto_126833 ) ( CLEAR ?auto_126830 ) ( ON ?auto_126831 ?auto_126832 ) ( CLEAR ?auto_126831 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_126830 ?auto_126831 )
      ( MAKE-7PILE ?auto_126830 ?auto_126831 ?auto_126832 ?auto_126833 ?auto_126834 ?auto_126835 ?auto_126836 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_126845 - BLOCK
      ?auto_126846 - BLOCK
      ?auto_126847 - BLOCK
      ?auto_126848 - BLOCK
      ?auto_126849 - BLOCK
      ?auto_126850 - BLOCK
      ?auto_126851 - BLOCK
    )
    :vars
    (
      ?auto_126852 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126851 ?auto_126852 ) ( not ( = ?auto_126845 ?auto_126846 ) ) ( not ( = ?auto_126845 ?auto_126847 ) ) ( not ( = ?auto_126845 ?auto_126848 ) ) ( not ( = ?auto_126845 ?auto_126849 ) ) ( not ( = ?auto_126845 ?auto_126850 ) ) ( not ( = ?auto_126845 ?auto_126851 ) ) ( not ( = ?auto_126845 ?auto_126852 ) ) ( not ( = ?auto_126846 ?auto_126847 ) ) ( not ( = ?auto_126846 ?auto_126848 ) ) ( not ( = ?auto_126846 ?auto_126849 ) ) ( not ( = ?auto_126846 ?auto_126850 ) ) ( not ( = ?auto_126846 ?auto_126851 ) ) ( not ( = ?auto_126846 ?auto_126852 ) ) ( not ( = ?auto_126847 ?auto_126848 ) ) ( not ( = ?auto_126847 ?auto_126849 ) ) ( not ( = ?auto_126847 ?auto_126850 ) ) ( not ( = ?auto_126847 ?auto_126851 ) ) ( not ( = ?auto_126847 ?auto_126852 ) ) ( not ( = ?auto_126848 ?auto_126849 ) ) ( not ( = ?auto_126848 ?auto_126850 ) ) ( not ( = ?auto_126848 ?auto_126851 ) ) ( not ( = ?auto_126848 ?auto_126852 ) ) ( not ( = ?auto_126849 ?auto_126850 ) ) ( not ( = ?auto_126849 ?auto_126851 ) ) ( not ( = ?auto_126849 ?auto_126852 ) ) ( not ( = ?auto_126850 ?auto_126851 ) ) ( not ( = ?auto_126850 ?auto_126852 ) ) ( not ( = ?auto_126851 ?auto_126852 ) ) ( ON ?auto_126850 ?auto_126851 ) ( ON ?auto_126849 ?auto_126850 ) ( ON ?auto_126848 ?auto_126849 ) ( ON ?auto_126847 ?auto_126848 ) ( ON ?auto_126846 ?auto_126847 ) ( ON ?auto_126845 ?auto_126846 ) ( CLEAR ?auto_126845 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_126845 )
      ( MAKE-7PILE ?auto_126845 ?auto_126846 ?auto_126847 ?auto_126848 ?auto_126849 ?auto_126850 ?auto_126851 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_126860 - BLOCK
      ?auto_126861 - BLOCK
      ?auto_126862 - BLOCK
      ?auto_126863 - BLOCK
      ?auto_126864 - BLOCK
      ?auto_126865 - BLOCK
      ?auto_126866 - BLOCK
    )
    :vars
    (
      ?auto_126867 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126866 ?auto_126867 ) ( not ( = ?auto_126860 ?auto_126861 ) ) ( not ( = ?auto_126860 ?auto_126862 ) ) ( not ( = ?auto_126860 ?auto_126863 ) ) ( not ( = ?auto_126860 ?auto_126864 ) ) ( not ( = ?auto_126860 ?auto_126865 ) ) ( not ( = ?auto_126860 ?auto_126866 ) ) ( not ( = ?auto_126860 ?auto_126867 ) ) ( not ( = ?auto_126861 ?auto_126862 ) ) ( not ( = ?auto_126861 ?auto_126863 ) ) ( not ( = ?auto_126861 ?auto_126864 ) ) ( not ( = ?auto_126861 ?auto_126865 ) ) ( not ( = ?auto_126861 ?auto_126866 ) ) ( not ( = ?auto_126861 ?auto_126867 ) ) ( not ( = ?auto_126862 ?auto_126863 ) ) ( not ( = ?auto_126862 ?auto_126864 ) ) ( not ( = ?auto_126862 ?auto_126865 ) ) ( not ( = ?auto_126862 ?auto_126866 ) ) ( not ( = ?auto_126862 ?auto_126867 ) ) ( not ( = ?auto_126863 ?auto_126864 ) ) ( not ( = ?auto_126863 ?auto_126865 ) ) ( not ( = ?auto_126863 ?auto_126866 ) ) ( not ( = ?auto_126863 ?auto_126867 ) ) ( not ( = ?auto_126864 ?auto_126865 ) ) ( not ( = ?auto_126864 ?auto_126866 ) ) ( not ( = ?auto_126864 ?auto_126867 ) ) ( not ( = ?auto_126865 ?auto_126866 ) ) ( not ( = ?auto_126865 ?auto_126867 ) ) ( not ( = ?auto_126866 ?auto_126867 ) ) ( ON ?auto_126865 ?auto_126866 ) ( ON ?auto_126864 ?auto_126865 ) ( ON ?auto_126863 ?auto_126864 ) ( ON ?auto_126862 ?auto_126863 ) ( ON ?auto_126861 ?auto_126862 ) ( ON ?auto_126860 ?auto_126861 ) ( CLEAR ?auto_126860 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_126860 )
      ( MAKE-7PILE ?auto_126860 ?auto_126861 ?auto_126862 ?auto_126863 ?auto_126864 ?auto_126865 ?auto_126866 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_126876 - BLOCK
      ?auto_126877 - BLOCK
      ?auto_126878 - BLOCK
      ?auto_126879 - BLOCK
      ?auto_126880 - BLOCK
      ?auto_126881 - BLOCK
      ?auto_126882 - BLOCK
      ?auto_126883 - BLOCK
    )
    :vars
    (
      ?auto_126884 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_126882 ) ( ON ?auto_126883 ?auto_126884 ) ( CLEAR ?auto_126883 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_126876 ) ( ON ?auto_126877 ?auto_126876 ) ( ON ?auto_126878 ?auto_126877 ) ( ON ?auto_126879 ?auto_126878 ) ( ON ?auto_126880 ?auto_126879 ) ( ON ?auto_126881 ?auto_126880 ) ( ON ?auto_126882 ?auto_126881 ) ( not ( = ?auto_126876 ?auto_126877 ) ) ( not ( = ?auto_126876 ?auto_126878 ) ) ( not ( = ?auto_126876 ?auto_126879 ) ) ( not ( = ?auto_126876 ?auto_126880 ) ) ( not ( = ?auto_126876 ?auto_126881 ) ) ( not ( = ?auto_126876 ?auto_126882 ) ) ( not ( = ?auto_126876 ?auto_126883 ) ) ( not ( = ?auto_126876 ?auto_126884 ) ) ( not ( = ?auto_126877 ?auto_126878 ) ) ( not ( = ?auto_126877 ?auto_126879 ) ) ( not ( = ?auto_126877 ?auto_126880 ) ) ( not ( = ?auto_126877 ?auto_126881 ) ) ( not ( = ?auto_126877 ?auto_126882 ) ) ( not ( = ?auto_126877 ?auto_126883 ) ) ( not ( = ?auto_126877 ?auto_126884 ) ) ( not ( = ?auto_126878 ?auto_126879 ) ) ( not ( = ?auto_126878 ?auto_126880 ) ) ( not ( = ?auto_126878 ?auto_126881 ) ) ( not ( = ?auto_126878 ?auto_126882 ) ) ( not ( = ?auto_126878 ?auto_126883 ) ) ( not ( = ?auto_126878 ?auto_126884 ) ) ( not ( = ?auto_126879 ?auto_126880 ) ) ( not ( = ?auto_126879 ?auto_126881 ) ) ( not ( = ?auto_126879 ?auto_126882 ) ) ( not ( = ?auto_126879 ?auto_126883 ) ) ( not ( = ?auto_126879 ?auto_126884 ) ) ( not ( = ?auto_126880 ?auto_126881 ) ) ( not ( = ?auto_126880 ?auto_126882 ) ) ( not ( = ?auto_126880 ?auto_126883 ) ) ( not ( = ?auto_126880 ?auto_126884 ) ) ( not ( = ?auto_126881 ?auto_126882 ) ) ( not ( = ?auto_126881 ?auto_126883 ) ) ( not ( = ?auto_126881 ?auto_126884 ) ) ( not ( = ?auto_126882 ?auto_126883 ) ) ( not ( = ?auto_126882 ?auto_126884 ) ) ( not ( = ?auto_126883 ?auto_126884 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_126883 ?auto_126884 )
      ( !STACK ?auto_126883 ?auto_126882 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_126893 - BLOCK
      ?auto_126894 - BLOCK
      ?auto_126895 - BLOCK
      ?auto_126896 - BLOCK
      ?auto_126897 - BLOCK
      ?auto_126898 - BLOCK
      ?auto_126899 - BLOCK
      ?auto_126900 - BLOCK
    )
    :vars
    (
      ?auto_126901 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_126899 ) ( ON ?auto_126900 ?auto_126901 ) ( CLEAR ?auto_126900 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_126893 ) ( ON ?auto_126894 ?auto_126893 ) ( ON ?auto_126895 ?auto_126894 ) ( ON ?auto_126896 ?auto_126895 ) ( ON ?auto_126897 ?auto_126896 ) ( ON ?auto_126898 ?auto_126897 ) ( ON ?auto_126899 ?auto_126898 ) ( not ( = ?auto_126893 ?auto_126894 ) ) ( not ( = ?auto_126893 ?auto_126895 ) ) ( not ( = ?auto_126893 ?auto_126896 ) ) ( not ( = ?auto_126893 ?auto_126897 ) ) ( not ( = ?auto_126893 ?auto_126898 ) ) ( not ( = ?auto_126893 ?auto_126899 ) ) ( not ( = ?auto_126893 ?auto_126900 ) ) ( not ( = ?auto_126893 ?auto_126901 ) ) ( not ( = ?auto_126894 ?auto_126895 ) ) ( not ( = ?auto_126894 ?auto_126896 ) ) ( not ( = ?auto_126894 ?auto_126897 ) ) ( not ( = ?auto_126894 ?auto_126898 ) ) ( not ( = ?auto_126894 ?auto_126899 ) ) ( not ( = ?auto_126894 ?auto_126900 ) ) ( not ( = ?auto_126894 ?auto_126901 ) ) ( not ( = ?auto_126895 ?auto_126896 ) ) ( not ( = ?auto_126895 ?auto_126897 ) ) ( not ( = ?auto_126895 ?auto_126898 ) ) ( not ( = ?auto_126895 ?auto_126899 ) ) ( not ( = ?auto_126895 ?auto_126900 ) ) ( not ( = ?auto_126895 ?auto_126901 ) ) ( not ( = ?auto_126896 ?auto_126897 ) ) ( not ( = ?auto_126896 ?auto_126898 ) ) ( not ( = ?auto_126896 ?auto_126899 ) ) ( not ( = ?auto_126896 ?auto_126900 ) ) ( not ( = ?auto_126896 ?auto_126901 ) ) ( not ( = ?auto_126897 ?auto_126898 ) ) ( not ( = ?auto_126897 ?auto_126899 ) ) ( not ( = ?auto_126897 ?auto_126900 ) ) ( not ( = ?auto_126897 ?auto_126901 ) ) ( not ( = ?auto_126898 ?auto_126899 ) ) ( not ( = ?auto_126898 ?auto_126900 ) ) ( not ( = ?auto_126898 ?auto_126901 ) ) ( not ( = ?auto_126899 ?auto_126900 ) ) ( not ( = ?auto_126899 ?auto_126901 ) ) ( not ( = ?auto_126900 ?auto_126901 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_126900 ?auto_126901 )
      ( !STACK ?auto_126900 ?auto_126899 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_126910 - BLOCK
      ?auto_126911 - BLOCK
      ?auto_126912 - BLOCK
      ?auto_126913 - BLOCK
      ?auto_126914 - BLOCK
      ?auto_126915 - BLOCK
      ?auto_126916 - BLOCK
      ?auto_126917 - BLOCK
    )
    :vars
    (
      ?auto_126918 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126917 ?auto_126918 ) ( ON-TABLE ?auto_126910 ) ( ON ?auto_126911 ?auto_126910 ) ( ON ?auto_126912 ?auto_126911 ) ( ON ?auto_126913 ?auto_126912 ) ( ON ?auto_126914 ?auto_126913 ) ( ON ?auto_126915 ?auto_126914 ) ( not ( = ?auto_126910 ?auto_126911 ) ) ( not ( = ?auto_126910 ?auto_126912 ) ) ( not ( = ?auto_126910 ?auto_126913 ) ) ( not ( = ?auto_126910 ?auto_126914 ) ) ( not ( = ?auto_126910 ?auto_126915 ) ) ( not ( = ?auto_126910 ?auto_126916 ) ) ( not ( = ?auto_126910 ?auto_126917 ) ) ( not ( = ?auto_126910 ?auto_126918 ) ) ( not ( = ?auto_126911 ?auto_126912 ) ) ( not ( = ?auto_126911 ?auto_126913 ) ) ( not ( = ?auto_126911 ?auto_126914 ) ) ( not ( = ?auto_126911 ?auto_126915 ) ) ( not ( = ?auto_126911 ?auto_126916 ) ) ( not ( = ?auto_126911 ?auto_126917 ) ) ( not ( = ?auto_126911 ?auto_126918 ) ) ( not ( = ?auto_126912 ?auto_126913 ) ) ( not ( = ?auto_126912 ?auto_126914 ) ) ( not ( = ?auto_126912 ?auto_126915 ) ) ( not ( = ?auto_126912 ?auto_126916 ) ) ( not ( = ?auto_126912 ?auto_126917 ) ) ( not ( = ?auto_126912 ?auto_126918 ) ) ( not ( = ?auto_126913 ?auto_126914 ) ) ( not ( = ?auto_126913 ?auto_126915 ) ) ( not ( = ?auto_126913 ?auto_126916 ) ) ( not ( = ?auto_126913 ?auto_126917 ) ) ( not ( = ?auto_126913 ?auto_126918 ) ) ( not ( = ?auto_126914 ?auto_126915 ) ) ( not ( = ?auto_126914 ?auto_126916 ) ) ( not ( = ?auto_126914 ?auto_126917 ) ) ( not ( = ?auto_126914 ?auto_126918 ) ) ( not ( = ?auto_126915 ?auto_126916 ) ) ( not ( = ?auto_126915 ?auto_126917 ) ) ( not ( = ?auto_126915 ?auto_126918 ) ) ( not ( = ?auto_126916 ?auto_126917 ) ) ( not ( = ?auto_126916 ?auto_126918 ) ) ( not ( = ?auto_126917 ?auto_126918 ) ) ( CLEAR ?auto_126915 ) ( ON ?auto_126916 ?auto_126917 ) ( CLEAR ?auto_126916 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_126910 ?auto_126911 ?auto_126912 ?auto_126913 ?auto_126914 ?auto_126915 ?auto_126916 )
      ( MAKE-8PILE ?auto_126910 ?auto_126911 ?auto_126912 ?auto_126913 ?auto_126914 ?auto_126915 ?auto_126916 ?auto_126917 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_126927 - BLOCK
      ?auto_126928 - BLOCK
      ?auto_126929 - BLOCK
      ?auto_126930 - BLOCK
      ?auto_126931 - BLOCK
      ?auto_126932 - BLOCK
      ?auto_126933 - BLOCK
      ?auto_126934 - BLOCK
    )
    :vars
    (
      ?auto_126935 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126934 ?auto_126935 ) ( ON-TABLE ?auto_126927 ) ( ON ?auto_126928 ?auto_126927 ) ( ON ?auto_126929 ?auto_126928 ) ( ON ?auto_126930 ?auto_126929 ) ( ON ?auto_126931 ?auto_126930 ) ( ON ?auto_126932 ?auto_126931 ) ( not ( = ?auto_126927 ?auto_126928 ) ) ( not ( = ?auto_126927 ?auto_126929 ) ) ( not ( = ?auto_126927 ?auto_126930 ) ) ( not ( = ?auto_126927 ?auto_126931 ) ) ( not ( = ?auto_126927 ?auto_126932 ) ) ( not ( = ?auto_126927 ?auto_126933 ) ) ( not ( = ?auto_126927 ?auto_126934 ) ) ( not ( = ?auto_126927 ?auto_126935 ) ) ( not ( = ?auto_126928 ?auto_126929 ) ) ( not ( = ?auto_126928 ?auto_126930 ) ) ( not ( = ?auto_126928 ?auto_126931 ) ) ( not ( = ?auto_126928 ?auto_126932 ) ) ( not ( = ?auto_126928 ?auto_126933 ) ) ( not ( = ?auto_126928 ?auto_126934 ) ) ( not ( = ?auto_126928 ?auto_126935 ) ) ( not ( = ?auto_126929 ?auto_126930 ) ) ( not ( = ?auto_126929 ?auto_126931 ) ) ( not ( = ?auto_126929 ?auto_126932 ) ) ( not ( = ?auto_126929 ?auto_126933 ) ) ( not ( = ?auto_126929 ?auto_126934 ) ) ( not ( = ?auto_126929 ?auto_126935 ) ) ( not ( = ?auto_126930 ?auto_126931 ) ) ( not ( = ?auto_126930 ?auto_126932 ) ) ( not ( = ?auto_126930 ?auto_126933 ) ) ( not ( = ?auto_126930 ?auto_126934 ) ) ( not ( = ?auto_126930 ?auto_126935 ) ) ( not ( = ?auto_126931 ?auto_126932 ) ) ( not ( = ?auto_126931 ?auto_126933 ) ) ( not ( = ?auto_126931 ?auto_126934 ) ) ( not ( = ?auto_126931 ?auto_126935 ) ) ( not ( = ?auto_126932 ?auto_126933 ) ) ( not ( = ?auto_126932 ?auto_126934 ) ) ( not ( = ?auto_126932 ?auto_126935 ) ) ( not ( = ?auto_126933 ?auto_126934 ) ) ( not ( = ?auto_126933 ?auto_126935 ) ) ( not ( = ?auto_126934 ?auto_126935 ) ) ( CLEAR ?auto_126932 ) ( ON ?auto_126933 ?auto_126934 ) ( CLEAR ?auto_126933 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_126927 ?auto_126928 ?auto_126929 ?auto_126930 ?auto_126931 ?auto_126932 ?auto_126933 )
      ( MAKE-8PILE ?auto_126927 ?auto_126928 ?auto_126929 ?auto_126930 ?auto_126931 ?auto_126932 ?auto_126933 ?auto_126934 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_126944 - BLOCK
      ?auto_126945 - BLOCK
      ?auto_126946 - BLOCK
      ?auto_126947 - BLOCK
      ?auto_126948 - BLOCK
      ?auto_126949 - BLOCK
      ?auto_126950 - BLOCK
      ?auto_126951 - BLOCK
    )
    :vars
    (
      ?auto_126952 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126951 ?auto_126952 ) ( ON-TABLE ?auto_126944 ) ( ON ?auto_126945 ?auto_126944 ) ( ON ?auto_126946 ?auto_126945 ) ( ON ?auto_126947 ?auto_126946 ) ( ON ?auto_126948 ?auto_126947 ) ( not ( = ?auto_126944 ?auto_126945 ) ) ( not ( = ?auto_126944 ?auto_126946 ) ) ( not ( = ?auto_126944 ?auto_126947 ) ) ( not ( = ?auto_126944 ?auto_126948 ) ) ( not ( = ?auto_126944 ?auto_126949 ) ) ( not ( = ?auto_126944 ?auto_126950 ) ) ( not ( = ?auto_126944 ?auto_126951 ) ) ( not ( = ?auto_126944 ?auto_126952 ) ) ( not ( = ?auto_126945 ?auto_126946 ) ) ( not ( = ?auto_126945 ?auto_126947 ) ) ( not ( = ?auto_126945 ?auto_126948 ) ) ( not ( = ?auto_126945 ?auto_126949 ) ) ( not ( = ?auto_126945 ?auto_126950 ) ) ( not ( = ?auto_126945 ?auto_126951 ) ) ( not ( = ?auto_126945 ?auto_126952 ) ) ( not ( = ?auto_126946 ?auto_126947 ) ) ( not ( = ?auto_126946 ?auto_126948 ) ) ( not ( = ?auto_126946 ?auto_126949 ) ) ( not ( = ?auto_126946 ?auto_126950 ) ) ( not ( = ?auto_126946 ?auto_126951 ) ) ( not ( = ?auto_126946 ?auto_126952 ) ) ( not ( = ?auto_126947 ?auto_126948 ) ) ( not ( = ?auto_126947 ?auto_126949 ) ) ( not ( = ?auto_126947 ?auto_126950 ) ) ( not ( = ?auto_126947 ?auto_126951 ) ) ( not ( = ?auto_126947 ?auto_126952 ) ) ( not ( = ?auto_126948 ?auto_126949 ) ) ( not ( = ?auto_126948 ?auto_126950 ) ) ( not ( = ?auto_126948 ?auto_126951 ) ) ( not ( = ?auto_126948 ?auto_126952 ) ) ( not ( = ?auto_126949 ?auto_126950 ) ) ( not ( = ?auto_126949 ?auto_126951 ) ) ( not ( = ?auto_126949 ?auto_126952 ) ) ( not ( = ?auto_126950 ?auto_126951 ) ) ( not ( = ?auto_126950 ?auto_126952 ) ) ( not ( = ?auto_126951 ?auto_126952 ) ) ( ON ?auto_126950 ?auto_126951 ) ( CLEAR ?auto_126948 ) ( ON ?auto_126949 ?auto_126950 ) ( CLEAR ?auto_126949 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_126944 ?auto_126945 ?auto_126946 ?auto_126947 ?auto_126948 ?auto_126949 )
      ( MAKE-8PILE ?auto_126944 ?auto_126945 ?auto_126946 ?auto_126947 ?auto_126948 ?auto_126949 ?auto_126950 ?auto_126951 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_126961 - BLOCK
      ?auto_126962 - BLOCK
      ?auto_126963 - BLOCK
      ?auto_126964 - BLOCK
      ?auto_126965 - BLOCK
      ?auto_126966 - BLOCK
      ?auto_126967 - BLOCK
      ?auto_126968 - BLOCK
    )
    :vars
    (
      ?auto_126969 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126968 ?auto_126969 ) ( ON-TABLE ?auto_126961 ) ( ON ?auto_126962 ?auto_126961 ) ( ON ?auto_126963 ?auto_126962 ) ( ON ?auto_126964 ?auto_126963 ) ( ON ?auto_126965 ?auto_126964 ) ( not ( = ?auto_126961 ?auto_126962 ) ) ( not ( = ?auto_126961 ?auto_126963 ) ) ( not ( = ?auto_126961 ?auto_126964 ) ) ( not ( = ?auto_126961 ?auto_126965 ) ) ( not ( = ?auto_126961 ?auto_126966 ) ) ( not ( = ?auto_126961 ?auto_126967 ) ) ( not ( = ?auto_126961 ?auto_126968 ) ) ( not ( = ?auto_126961 ?auto_126969 ) ) ( not ( = ?auto_126962 ?auto_126963 ) ) ( not ( = ?auto_126962 ?auto_126964 ) ) ( not ( = ?auto_126962 ?auto_126965 ) ) ( not ( = ?auto_126962 ?auto_126966 ) ) ( not ( = ?auto_126962 ?auto_126967 ) ) ( not ( = ?auto_126962 ?auto_126968 ) ) ( not ( = ?auto_126962 ?auto_126969 ) ) ( not ( = ?auto_126963 ?auto_126964 ) ) ( not ( = ?auto_126963 ?auto_126965 ) ) ( not ( = ?auto_126963 ?auto_126966 ) ) ( not ( = ?auto_126963 ?auto_126967 ) ) ( not ( = ?auto_126963 ?auto_126968 ) ) ( not ( = ?auto_126963 ?auto_126969 ) ) ( not ( = ?auto_126964 ?auto_126965 ) ) ( not ( = ?auto_126964 ?auto_126966 ) ) ( not ( = ?auto_126964 ?auto_126967 ) ) ( not ( = ?auto_126964 ?auto_126968 ) ) ( not ( = ?auto_126964 ?auto_126969 ) ) ( not ( = ?auto_126965 ?auto_126966 ) ) ( not ( = ?auto_126965 ?auto_126967 ) ) ( not ( = ?auto_126965 ?auto_126968 ) ) ( not ( = ?auto_126965 ?auto_126969 ) ) ( not ( = ?auto_126966 ?auto_126967 ) ) ( not ( = ?auto_126966 ?auto_126968 ) ) ( not ( = ?auto_126966 ?auto_126969 ) ) ( not ( = ?auto_126967 ?auto_126968 ) ) ( not ( = ?auto_126967 ?auto_126969 ) ) ( not ( = ?auto_126968 ?auto_126969 ) ) ( ON ?auto_126967 ?auto_126968 ) ( CLEAR ?auto_126965 ) ( ON ?auto_126966 ?auto_126967 ) ( CLEAR ?auto_126966 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_126961 ?auto_126962 ?auto_126963 ?auto_126964 ?auto_126965 ?auto_126966 )
      ( MAKE-8PILE ?auto_126961 ?auto_126962 ?auto_126963 ?auto_126964 ?auto_126965 ?auto_126966 ?auto_126967 ?auto_126968 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_126978 - BLOCK
      ?auto_126979 - BLOCK
      ?auto_126980 - BLOCK
      ?auto_126981 - BLOCK
      ?auto_126982 - BLOCK
      ?auto_126983 - BLOCK
      ?auto_126984 - BLOCK
      ?auto_126985 - BLOCK
    )
    :vars
    (
      ?auto_126986 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126985 ?auto_126986 ) ( ON-TABLE ?auto_126978 ) ( ON ?auto_126979 ?auto_126978 ) ( ON ?auto_126980 ?auto_126979 ) ( ON ?auto_126981 ?auto_126980 ) ( not ( = ?auto_126978 ?auto_126979 ) ) ( not ( = ?auto_126978 ?auto_126980 ) ) ( not ( = ?auto_126978 ?auto_126981 ) ) ( not ( = ?auto_126978 ?auto_126982 ) ) ( not ( = ?auto_126978 ?auto_126983 ) ) ( not ( = ?auto_126978 ?auto_126984 ) ) ( not ( = ?auto_126978 ?auto_126985 ) ) ( not ( = ?auto_126978 ?auto_126986 ) ) ( not ( = ?auto_126979 ?auto_126980 ) ) ( not ( = ?auto_126979 ?auto_126981 ) ) ( not ( = ?auto_126979 ?auto_126982 ) ) ( not ( = ?auto_126979 ?auto_126983 ) ) ( not ( = ?auto_126979 ?auto_126984 ) ) ( not ( = ?auto_126979 ?auto_126985 ) ) ( not ( = ?auto_126979 ?auto_126986 ) ) ( not ( = ?auto_126980 ?auto_126981 ) ) ( not ( = ?auto_126980 ?auto_126982 ) ) ( not ( = ?auto_126980 ?auto_126983 ) ) ( not ( = ?auto_126980 ?auto_126984 ) ) ( not ( = ?auto_126980 ?auto_126985 ) ) ( not ( = ?auto_126980 ?auto_126986 ) ) ( not ( = ?auto_126981 ?auto_126982 ) ) ( not ( = ?auto_126981 ?auto_126983 ) ) ( not ( = ?auto_126981 ?auto_126984 ) ) ( not ( = ?auto_126981 ?auto_126985 ) ) ( not ( = ?auto_126981 ?auto_126986 ) ) ( not ( = ?auto_126982 ?auto_126983 ) ) ( not ( = ?auto_126982 ?auto_126984 ) ) ( not ( = ?auto_126982 ?auto_126985 ) ) ( not ( = ?auto_126982 ?auto_126986 ) ) ( not ( = ?auto_126983 ?auto_126984 ) ) ( not ( = ?auto_126983 ?auto_126985 ) ) ( not ( = ?auto_126983 ?auto_126986 ) ) ( not ( = ?auto_126984 ?auto_126985 ) ) ( not ( = ?auto_126984 ?auto_126986 ) ) ( not ( = ?auto_126985 ?auto_126986 ) ) ( ON ?auto_126984 ?auto_126985 ) ( ON ?auto_126983 ?auto_126984 ) ( CLEAR ?auto_126981 ) ( ON ?auto_126982 ?auto_126983 ) ( CLEAR ?auto_126982 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_126978 ?auto_126979 ?auto_126980 ?auto_126981 ?auto_126982 )
      ( MAKE-8PILE ?auto_126978 ?auto_126979 ?auto_126980 ?auto_126981 ?auto_126982 ?auto_126983 ?auto_126984 ?auto_126985 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_126995 - BLOCK
      ?auto_126996 - BLOCK
      ?auto_126997 - BLOCK
      ?auto_126998 - BLOCK
      ?auto_126999 - BLOCK
      ?auto_127000 - BLOCK
      ?auto_127001 - BLOCK
      ?auto_127002 - BLOCK
    )
    :vars
    (
      ?auto_127003 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127002 ?auto_127003 ) ( ON-TABLE ?auto_126995 ) ( ON ?auto_126996 ?auto_126995 ) ( ON ?auto_126997 ?auto_126996 ) ( ON ?auto_126998 ?auto_126997 ) ( not ( = ?auto_126995 ?auto_126996 ) ) ( not ( = ?auto_126995 ?auto_126997 ) ) ( not ( = ?auto_126995 ?auto_126998 ) ) ( not ( = ?auto_126995 ?auto_126999 ) ) ( not ( = ?auto_126995 ?auto_127000 ) ) ( not ( = ?auto_126995 ?auto_127001 ) ) ( not ( = ?auto_126995 ?auto_127002 ) ) ( not ( = ?auto_126995 ?auto_127003 ) ) ( not ( = ?auto_126996 ?auto_126997 ) ) ( not ( = ?auto_126996 ?auto_126998 ) ) ( not ( = ?auto_126996 ?auto_126999 ) ) ( not ( = ?auto_126996 ?auto_127000 ) ) ( not ( = ?auto_126996 ?auto_127001 ) ) ( not ( = ?auto_126996 ?auto_127002 ) ) ( not ( = ?auto_126996 ?auto_127003 ) ) ( not ( = ?auto_126997 ?auto_126998 ) ) ( not ( = ?auto_126997 ?auto_126999 ) ) ( not ( = ?auto_126997 ?auto_127000 ) ) ( not ( = ?auto_126997 ?auto_127001 ) ) ( not ( = ?auto_126997 ?auto_127002 ) ) ( not ( = ?auto_126997 ?auto_127003 ) ) ( not ( = ?auto_126998 ?auto_126999 ) ) ( not ( = ?auto_126998 ?auto_127000 ) ) ( not ( = ?auto_126998 ?auto_127001 ) ) ( not ( = ?auto_126998 ?auto_127002 ) ) ( not ( = ?auto_126998 ?auto_127003 ) ) ( not ( = ?auto_126999 ?auto_127000 ) ) ( not ( = ?auto_126999 ?auto_127001 ) ) ( not ( = ?auto_126999 ?auto_127002 ) ) ( not ( = ?auto_126999 ?auto_127003 ) ) ( not ( = ?auto_127000 ?auto_127001 ) ) ( not ( = ?auto_127000 ?auto_127002 ) ) ( not ( = ?auto_127000 ?auto_127003 ) ) ( not ( = ?auto_127001 ?auto_127002 ) ) ( not ( = ?auto_127001 ?auto_127003 ) ) ( not ( = ?auto_127002 ?auto_127003 ) ) ( ON ?auto_127001 ?auto_127002 ) ( ON ?auto_127000 ?auto_127001 ) ( CLEAR ?auto_126998 ) ( ON ?auto_126999 ?auto_127000 ) ( CLEAR ?auto_126999 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_126995 ?auto_126996 ?auto_126997 ?auto_126998 ?auto_126999 )
      ( MAKE-8PILE ?auto_126995 ?auto_126996 ?auto_126997 ?auto_126998 ?auto_126999 ?auto_127000 ?auto_127001 ?auto_127002 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_127012 - BLOCK
      ?auto_127013 - BLOCK
      ?auto_127014 - BLOCK
      ?auto_127015 - BLOCK
      ?auto_127016 - BLOCK
      ?auto_127017 - BLOCK
      ?auto_127018 - BLOCK
      ?auto_127019 - BLOCK
    )
    :vars
    (
      ?auto_127020 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127019 ?auto_127020 ) ( ON-TABLE ?auto_127012 ) ( ON ?auto_127013 ?auto_127012 ) ( ON ?auto_127014 ?auto_127013 ) ( not ( = ?auto_127012 ?auto_127013 ) ) ( not ( = ?auto_127012 ?auto_127014 ) ) ( not ( = ?auto_127012 ?auto_127015 ) ) ( not ( = ?auto_127012 ?auto_127016 ) ) ( not ( = ?auto_127012 ?auto_127017 ) ) ( not ( = ?auto_127012 ?auto_127018 ) ) ( not ( = ?auto_127012 ?auto_127019 ) ) ( not ( = ?auto_127012 ?auto_127020 ) ) ( not ( = ?auto_127013 ?auto_127014 ) ) ( not ( = ?auto_127013 ?auto_127015 ) ) ( not ( = ?auto_127013 ?auto_127016 ) ) ( not ( = ?auto_127013 ?auto_127017 ) ) ( not ( = ?auto_127013 ?auto_127018 ) ) ( not ( = ?auto_127013 ?auto_127019 ) ) ( not ( = ?auto_127013 ?auto_127020 ) ) ( not ( = ?auto_127014 ?auto_127015 ) ) ( not ( = ?auto_127014 ?auto_127016 ) ) ( not ( = ?auto_127014 ?auto_127017 ) ) ( not ( = ?auto_127014 ?auto_127018 ) ) ( not ( = ?auto_127014 ?auto_127019 ) ) ( not ( = ?auto_127014 ?auto_127020 ) ) ( not ( = ?auto_127015 ?auto_127016 ) ) ( not ( = ?auto_127015 ?auto_127017 ) ) ( not ( = ?auto_127015 ?auto_127018 ) ) ( not ( = ?auto_127015 ?auto_127019 ) ) ( not ( = ?auto_127015 ?auto_127020 ) ) ( not ( = ?auto_127016 ?auto_127017 ) ) ( not ( = ?auto_127016 ?auto_127018 ) ) ( not ( = ?auto_127016 ?auto_127019 ) ) ( not ( = ?auto_127016 ?auto_127020 ) ) ( not ( = ?auto_127017 ?auto_127018 ) ) ( not ( = ?auto_127017 ?auto_127019 ) ) ( not ( = ?auto_127017 ?auto_127020 ) ) ( not ( = ?auto_127018 ?auto_127019 ) ) ( not ( = ?auto_127018 ?auto_127020 ) ) ( not ( = ?auto_127019 ?auto_127020 ) ) ( ON ?auto_127018 ?auto_127019 ) ( ON ?auto_127017 ?auto_127018 ) ( ON ?auto_127016 ?auto_127017 ) ( CLEAR ?auto_127014 ) ( ON ?auto_127015 ?auto_127016 ) ( CLEAR ?auto_127015 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_127012 ?auto_127013 ?auto_127014 ?auto_127015 )
      ( MAKE-8PILE ?auto_127012 ?auto_127013 ?auto_127014 ?auto_127015 ?auto_127016 ?auto_127017 ?auto_127018 ?auto_127019 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_127029 - BLOCK
      ?auto_127030 - BLOCK
      ?auto_127031 - BLOCK
      ?auto_127032 - BLOCK
      ?auto_127033 - BLOCK
      ?auto_127034 - BLOCK
      ?auto_127035 - BLOCK
      ?auto_127036 - BLOCK
    )
    :vars
    (
      ?auto_127037 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127036 ?auto_127037 ) ( ON-TABLE ?auto_127029 ) ( ON ?auto_127030 ?auto_127029 ) ( ON ?auto_127031 ?auto_127030 ) ( not ( = ?auto_127029 ?auto_127030 ) ) ( not ( = ?auto_127029 ?auto_127031 ) ) ( not ( = ?auto_127029 ?auto_127032 ) ) ( not ( = ?auto_127029 ?auto_127033 ) ) ( not ( = ?auto_127029 ?auto_127034 ) ) ( not ( = ?auto_127029 ?auto_127035 ) ) ( not ( = ?auto_127029 ?auto_127036 ) ) ( not ( = ?auto_127029 ?auto_127037 ) ) ( not ( = ?auto_127030 ?auto_127031 ) ) ( not ( = ?auto_127030 ?auto_127032 ) ) ( not ( = ?auto_127030 ?auto_127033 ) ) ( not ( = ?auto_127030 ?auto_127034 ) ) ( not ( = ?auto_127030 ?auto_127035 ) ) ( not ( = ?auto_127030 ?auto_127036 ) ) ( not ( = ?auto_127030 ?auto_127037 ) ) ( not ( = ?auto_127031 ?auto_127032 ) ) ( not ( = ?auto_127031 ?auto_127033 ) ) ( not ( = ?auto_127031 ?auto_127034 ) ) ( not ( = ?auto_127031 ?auto_127035 ) ) ( not ( = ?auto_127031 ?auto_127036 ) ) ( not ( = ?auto_127031 ?auto_127037 ) ) ( not ( = ?auto_127032 ?auto_127033 ) ) ( not ( = ?auto_127032 ?auto_127034 ) ) ( not ( = ?auto_127032 ?auto_127035 ) ) ( not ( = ?auto_127032 ?auto_127036 ) ) ( not ( = ?auto_127032 ?auto_127037 ) ) ( not ( = ?auto_127033 ?auto_127034 ) ) ( not ( = ?auto_127033 ?auto_127035 ) ) ( not ( = ?auto_127033 ?auto_127036 ) ) ( not ( = ?auto_127033 ?auto_127037 ) ) ( not ( = ?auto_127034 ?auto_127035 ) ) ( not ( = ?auto_127034 ?auto_127036 ) ) ( not ( = ?auto_127034 ?auto_127037 ) ) ( not ( = ?auto_127035 ?auto_127036 ) ) ( not ( = ?auto_127035 ?auto_127037 ) ) ( not ( = ?auto_127036 ?auto_127037 ) ) ( ON ?auto_127035 ?auto_127036 ) ( ON ?auto_127034 ?auto_127035 ) ( ON ?auto_127033 ?auto_127034 ) ( CLEAR ?auto_127031 ) ( ON ?auto_127032 ?auto_127033 ) ( CLEAR ?auto_127032 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_127029 ?auto_127030 ?auto_127031 ?auto_127032 )
      ( MAKE-8PILE ?auto_127029 ?auto_127030 ?auto_127031 ?auto_127032 ?auto_127033 ?auto_127034 ?auto_127035 ?auto_127036 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_127046 - BLOCK
      ?auto_127047 - BLOCK
      ?auto_127048 - BLOCK
      ?auto_127049 - BLOCK
      ?auto_127050 - BLOCK
      ?auto_127051 - BLOCK
      ?auto_127052 - BLOCK
      ?auto_127053 - BLOCK
    )
    :vars
    (
      ?auto_127054 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127053 ?auto_127054 ) ( ON-TABLE ?auto_127046 ) ( ON ?auto_127047 ?auto_127046 ) ( not ( = ?auto_127046 ?auto_127047 ) ) ( not ( = ?auto_127046 ?auto_127048 ) ) ( not ( = ?auto_127046 ?auto_127049 ) ) ( not ( = ?auto_127046 ?auto_127050 ) ) ( not ( = ?auto_127046 ?auto_127051 ) ) ( not ( = ?auto_127046 ?auto_127052 ) ) ( not ( = ?auto_127046 ?auto_127053 ) ) ( not ( = ?auto_127046 ?auto_127054 ) ) ( not ( = ?auto_127047 ?auto_127048 ) ) ( not ( = ?auto_127047 ?auto_127049 ) ) ( not ( = ?auto_127047 ?auto_127050 ) ) ( not ( = ?auto_127047 ?auto_127051 ) ) ( not ( = ?auto_127047 ?auto_127052 ) ) ( not ( = ?auto_127047 ?auto_127053 ) ) ( not ( = ?auto_127047 ?auto_127054 ) ) ( not ( = ?auto_127048 ?auto_127049 ) ) ( not ( = ?auto_127048 ?auto_127050 ) ) ( not ( = ?auto_127048 ?auto_127051 ) ) ( not ( = ?auto_127048 ?auto_127052 ) ) ( not ( = ?auto_127048 ?auto_127053 ) ) ( not ( = ?auto_127048 ?auto_127054 ) ) ( not ( = ?auto_127049 ?auto_127050 ) ) ( not ( = ?auto_127049 ?auto_127051 ) ) ( not ( = ?auto_127049 ?auto_127052 ) ) ( not ( = ?auto_127049 ?auto_127053 ) ) ( not ( = ?auto_127049 ?auto_127054 ) ) ( not ( = ?auto_127050 ?auto_127051 ) ) ( not ( = ?auto_127050 ?auto_127052 ) ) ( not ( = ?auto_127050 ?auto_127053 ) ) ( not ( = ?auto_127050 ?auto_127054 ) ) ( not ( = ?auto_127051 ?auto_127052 ) ) ( not ( = ?auto_127051 ?auto_127053 ) ) ( not ( = ?auto_127051 ?auto_127054 ) ) ( not ( = ?auto_127052 ?auto_127053 ) ) ( not ( = ?auto_127052 ?auto_127054 ) ) ( not ( = ?auto_127053 ?auto_127054 ) ) ( ON ?auto_127052 ?auto_127053 ) ( ON ?auto_127051 ?auto_127052 ) ( ON ?auto_127050 ?auto_127051 ) ( ON ?auto_127049 ?auto_127050 ) ( CLEAR ?auto_127047 ) ( ON ?auto_127048 ?auto_127049 ) ( CLEAR ?auto_127048 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_127046 ?auto_127047 ?auto_127048 )
      ( MAKE-8PILE ?auto_127046 ?auto_127047 ?auto_127048 ?auto_127049 ?auto_127050 ?auto_127051 ?auto_127052 ?auto_127053 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_127063 - BLOCK
      ?auto_127064 - BLOCK
      ?auto_127065 - BLOCK
      ?auto_127066 - BLOCK
      ?auto_127067 - BLOCK
      ?auto_127068 - BLOCK
      ?auto_127069 - BLOCK
      ?auto_127070 - BLOCK
    )
    :vars
    (
      ?auto_127071 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127070 ?auto_127071 ) ( ON-TABLE ?auto_127063 ) ( ON ?auto_127064 ?auto_127063 ) ( not ( = ?auto_127063 ?auto_127064 ) ) ( not ( = ?auto_127063 ?auto_127065 ) ) ( not ( = ?auto_127063 ?auto_127066 ) ) ( not ( = ?auto_127063 ?auto_127067 ) ) ( not ( = ?auto_127063 ?auto_127068 ) ) ( not ( = ?auto_127063 ?auto_127069 ) ) ( not ( = ?auto_127063 ?auto_127070 ) ) ( not ( = ?auto_127063 ?auto_127071 ) ) ( not ( = ?auto_127064 ?auto_127065 ) ) ( not ( = ?auto_127064 ?auto_127066 ) ) ( not ( = ?auto_127064 ?auto_127067 ) ) ( not ( = ?auto_127064 ?auto_127068 ) ) ( not ( = ?auto_127064 ?auto_127069 ) ) ( not ( = ?auto_127064 ?auto_127070 ) ) ( not ( = ?auto_127064 ?auto_127071 ) ) ( not ( = ?auto_127065 ?auto_127066 ) ) ( not ( = ?auto_127065 ?auto_127067 ) ) ( not ( = ?auto_127065 ?auto_127068 ) ) ( not ( = ?auto_127065 ?auto_127069 ) ) ( not ( = ?auto_127065 ?auto_127070 ) ) ( not ( = ?auto_127065 ?auto_127071 ) ) ( not ( = ?auto_127066 ?auto_127067 ) ) ( not ( = ?auto_127066 ?auto_127068 ) ) ( not ( = ?auto_127066 ?auto_127069 ) ) ( not ( = ?auto_127066 ?auto_127070 ) ) ( not ( = ?auto_127066 ?auto_127071 ) ) ( not ( = ?auto_127067 ?auto_127068 ) ) ( not ( = ?auto_127067 ?auto_127069 ) ) ( not ( = ?auto_127067 ?auto_127070 ) ) ( not ( = ?auto_127067 ?auto_127071 ) ) ( not ( = ?auto_127068 ?auto_127069 ) ) ( not ( = ?auto_127068 ?auto_127070 ) ) ( not ( = ?auto_127068 ?auto_127071 ) ) ( not ( = ?auto_127069 ?auto_127070 ) ) ( not ( = ?auto_127069 ?auto_127071 ) ) ( not ( = ?auto_127070 ?auto_127071 ) ) ( ON ?auto_127069 ?auto_127070 ) ( ON ?auto_127068 ?auto_127069 ) ( ON ?auto_127067 ?auto_127068 ) ( ON ?auto_127066 ?auto_127067 ) ( CLEAR ?auto_127064 ) ( ON ?auto_127065 ?auto_127066 ) ( CLEAR ?auto_127065 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_127063 ?auto_127064 ?auto_127065 )
      ( MAKE-8PILE ?auto_127063 ?auto_127064 ?auto_127065 ?auto_127066 ?auto_127067 ?auto_127068 ?auto_127069 ?auto_127070 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_127080 - BLOCK
      ?auto_127081 - BLOCK
      ?auto_127082 - BLOCK
      ?auto_127083 - BLOCK
      ?auto_127084 - BLOCK
      ?auto_127085 - BLOCK
      ?auto_127086 - BLOCK
      ?auto_127087 - BLOCK
    )
    :vars
    (
      ?auto_127088 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127087 ?auto_127088 ) ( ON-TABLE ?auto_127080 ) ( not ( = ?auto_127080 ?auto_127081 ) ) ( not ( = ?auto_127080 ?auto_127082 ) ) ( not ( = ?auto_127080 ?auto_127083 ) ) ( not ( = ?auto_127080 ?auto_127084 ) ) ( not ( = ?auto_127080 ?auto_127085 ) ) ( not ( = ?auto_127080 ?auto_127086 ) ) ( not ( = ?auto_127080 ?auto_127087 ) ) ( not ( = ?auto_127080 ?auto_127088 ) ) ( not ( = ?auto_127081 ?auto_127082 ) ) ( not ( = ?auto_127081 ?auto_127083 ) ) ( not ( = ?auto_127081 ?auto_127084 ) ) ( not ( = ?auto_127081 ?auto_127085 ) ) ( not ( = ?auto_127081 ?auto_127086 ) ) ( not ( = ?auto_127081 ?auto_127087 ) ) ( not ( = ?auto_127081 ?auto_127088 ) ) ( not ( = ?auto_127082 ?auto_127083 ) ) ( not ( = ?auto_127082 ?auto_127084 ) ) ( not ( = ?auto_127082 ?auto_127085 ) ) ( not ( = ?auto_127082 ?auto_127086 ) ) ( not ( = ?auto_127082 ?auto_127087 ) ) ( not ( = ?auto_127082 ?auto_127088 ) ) ( not ( = ?auto_127083 ?auto_127084 ) ) ( not ( = ?auto_127083 ?auto_127085 ) ) ( not ( = ?auto_127083 ?auto_127086 ) ) ( not ( = ?auto_127083 ?auto_127087 ) ) ( not ( = ?auto_127083 ?auto_127088 ) ) ( not ( = ?auto_127084 ?auto_127085 ) ) ( not ( = ?auto_127084 ?auto_127086 ) ) ( not ( = ?auto_127084 ?auto_127087 ) ) ( not ( = ?auto_127084 ?auto_127088 ) ) ( not ( = ?auto_127085 ?auto_127086 ) ) ( not ( = ?auto_127085 ?auto_127087 ) ) ( not ( = ?auto_127085 ?auto_127088 ) ) ( not ( = ?auto_127086 ?auto_127087 ) ) ( not ( = ?auto_127086 ?auto_127088 ) ) ( not ( = ?auto_127087 ?auto_127088 ) ) ( ON ?auto_127086 ?auto_127087 ) ( ON ?auto_127085 ?auto_127086 ) ( ON ?auto_127084 ?auto_127085 ) ( ON ?auto_127083 ?auto_127084 ) ( ON ?auto_127082 ?auto_127083 ) ( CLEAR ?auto_127080 ) ( ON ?auto_127081 ?auto_127082 ) ( CLEAR ?auto_127081 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_127080 ?auto_127081 )
      ( MAKE-8PILE ?auto_127080 ?auto_127081 ?auto_127082 ?auto_127083 ?auto_127084 ?auto_127085 ?auto_127086 ?auto_127087 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_127097 - BLOCK
      ?auto_127098 - BLOCK
      ?auto_127099 - BLOCK
      ?auto_127100 - BLOCK
      ?auto_127101 - BLOCK
      ?auto_127102 - BLOCK
      ?auto_127103 - BLOCK
      ?auto_127104 - BLOCK
    )
    :vars
    (
      ?auto_127105 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127104 ?auto_127105 ) ( ON-TABLE ?auto_127097 ) ( not ( = ?auto_127097 ?auto_127098 ) ) ( not ( = ?auto_127097 ?auto_127099 ) ) ( not ( = ?auto_127097 ?auto_127100 ) ) ( not ( = ?auto_127097 ?auto_127101 ) ) ( not ( = ?auto_127097 ?auto_127102 ) ) ( not ( = ?auto_127097 ?auto_127103 ) ) ( not ( = ?auto_127097 ?auto_127104 ) ) ( not ( = ?auto_127097 ?auto_127105 ) ) ( not ( = ?auto_127098 ?auto_127099 ) ) ( not ( = ?auto_127098 ?auto_127100 ) ) ( not ( = ?auto_127098 ?auto_127101 ) ) ( not ( = ?auto_127098 ?auto_127102 ) ) ( not ( = ?auto_127098 ?auto_127103 ) ) ( not ( = ?auto_127098 ?auto_127104 ) ) ( not ( = ?auto_127098 ?auto_127105 ) ) ( not ( = ?auto_127099 ?auto_127100 ) ) ( not ( = ?auto_127099 ?auto_127101 ) ) ( not ( = ?auto_127099 ?auto_127102 ) ) ( not ( = ?auto_127099 ?auto_127103 ) ) ( not ( = ?auto_127099 ?auto_127104 ) ) ( not ( = ?auto_127099 ?auto_127105 ) ) ( not ( = ?auto_127100 ?auto_127101 ) ) ( not ( = ?auto_127100 ?auto_127102 ) ) ( not ( = ?auto_127100 ?auto_127103 ) ) ( not ( = ?auto_127100 ?auto_127104 ) ) ( not ( = ?auto_127100 ?auto_127105 ) ) ( not ( = ?auto_127101 ?auto_127102 ) ) ( not ( = ?auto_127101 ?auto_127103 ) ) ( not ( = ?auto_127101 ?auto_127104 ) ) ( not ( = ?auto_127101 ?auto_127105 ) ) ( not ( = ?auto_127102 ?auto_127103 ) ) ( not ( = ?auto_127102 ?auto_127104 ) ) ( not ( = ?auto_127102 ?auto_127105 ) ) ( not ( = ?auto_127103 ?auto_127104 ) ) ( not ( = ?auto_127103 ?auto_127105 ) ) ( not ( = ?auto_127104 ?auto_127105 ) ) ( ON ?auto_127103 ?auto_127104 ) ( ON ?auto_127102 ?auto_127103 ) ( ON ?auto_127101 ?auto_127102 ) ( ON ?auto_127100 ?auto_127101 ) ( ON ?auto_127099 ?auto_127100 ) ( CLEAR ?auto_127097 ) ( ON ?auto_127098 ?auto_127099 ) ( CLEAR ?auto_127098 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_127097 ?auto_127098 )
      ( MAKE-8PILE ?auto_127097 ?auto_127098 ?auto_127099 ?auto_127100 ?auto_127101 ?auto_127102 ?auto_127103 ?auto_127104 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_127114 - BLOCK
      ?auto_127115 - BLOCK
      ?auto_127116 - BLOCK
      ?auto_127117 - BLOCK
      ?auto_127118 - BLOCK
      ?auto_127119 - BLOCK
      ?auto_127120 - BLOCK
      ?auto_127121 - BLOCK
    )
    :vars
    (
      ?auto_127122 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127121 ?auto_127122 ) ( not ( = ?auto_127114 ?auto_127115 ) ) ( not ( = ?auto_127114 ?auto_127116 ) ) ( not ( = ?auto_127114 ?auto_127117 ) ) ( not ( = ?auto_127114 ?auto_127118 ) ) ( not ( = ?auto_127114 ?auto_127119 ) ) ( not ( = ?auto_127114 ?auto_127120 ) ) ( not ( = ?auto_127114 ?auto_127121 ) ) ( not ( = ?auto_127114 ?auto_127122 ) ) ( not ( = ?auto_127115 ?auto_127116 ) ) ( not ( = ?auto_127115 ?auto_127117 ) ) ( not ( = ?auto_127115 ?auto_127118 ) ) ( not ( = ?auto_127115 ?auto_127119 ) ) ( not ( = ?auto_127115 ?auto_127120 ) ) ( not ( = ?auto_127115 ?auto_127121 ) ) ( not ( = ?auto_127115 ?auto_127122 ) ) ( not ( = ?auto_127116 ?auto_127117 ) ) ( not ( = ?auto_127116 ?auto_127118 ) ) ( not ( = ?auto_127116 ?auto_127119 ) ) ( not ( = ?auto_127116 ?auto_127120 ) ) ( not ( = ?auto_127116 ?auto_127121 ) ) ( not ( = ?auto_127116 ?auto_127122 ) ) ( not ( = ?auto_127117 ?auto_127118 ) ) ( not ( = ?auto_127117 ?auto_127119 ) ) ( not ( = ?auto_127117 ?auto_127120 ) ) ( not ( = ?auto_127117 ?auto_127121 ) ) ( not ( = ?auto_127117 ?auto_127122 ) ) ( not ( = ?auto_127118 ?auto_127119 ) ) ( not ( = ?auto_127118 ?auto_127120 ) ) ( not ( = ?auto_127118 ?auto_127121 ) ) ( not ( = ?auto_127118 ?auto_127122 ) ) ( not ( = ?auto_127119 ?auto_127120 ) ) ( not ( = ?auto_127119 ?auto_127121 ) ) ( not ( = ?auto_127119 ?auto_127122 ) ) ( not ( = ?auto_127120 ?auto_127121 ) ) ( not ( = ?auto_127120 ?auto_127122 ) ) ( not ( = ?auto_127121 ?auto_127122 ) ) ( ON ?auto_127120 ?auto_127121 ) ( ON ?auto_127119 ?auto_127120 ) ( ON ?auto_127118 ?auto_127119 ) ( ON ?auto_127117 ?auto_127118 ) ( ON ?auto_127116 ?auto_127117 ) ( ON ?auto_127115 ?auto_127116 ) ( ON ?auto_127114 ?auto_127115 ) ( CLEAR ?auto_127114 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_127114 )
      ( MAKE-8PILE ?auto_127114 ?auto_127115 ?auto_127116 ?auto_127117 ?auto_127118 ?auto_127119 ?auto_127120 ?auto_127121 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_127131 - BLOCK
      ?auto_127132 - BLOCK
      ?auto_127133 - BLOCK
      ?auto_127134 - BLOCK
      ?auto_127135 - BLOCK
      ?auto_127136 - BLOCK
      ?auto_127137 - BLOCK
      ?auto_127138 - BLOCK
    )
    :vars
    (
      ?auto_127139 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127138 ?auto_127139 ) ( not ( = ?auto_127131 ?auto_127132 ) ) ( not ( = ?auto_127131 ?auto_127133 ) ) ( not ( = ?auto_127131 ?auto_127134 ) ) ( not ( = ?auto_127131 ?auto_127135 ) ) ( not ( = ?auto_127131 ?auto_127136 ) ) ( not ( = ?auto_127131 ?auto_127137 ) ) ( not ( = ?auto_127131 ?auto_127138 ) ) ( not ( = ?auto_127131 ?auto_127139 ) ) ( not ( = ?auto_127132 ?auto_127133 ) ) ( not ( = ?auto_127132 ?auto_127134 ) ) ( not ( = ?auto_127132 ?auto_127135 ) ) ( not ( = ?auto_127132 ?auto_127136 ) ) ( not ( = ?auto_127132 ?auto_127137 ) ) ( not ( = ?auto_127132 ?auto_127138 ) ) ( not ( = ?auto_127132 ?auto_127139 ) ) ( not ( = ?auto_127133 ?auto_127134 ) ) ( not ( = ?auto_127133 ?auto_127135 ) ) ( not ( = ?auto_127133 ?auto_127136 ) ) ( not ( = ?auto_127133 ?auto_127137 ) ) ( not ( = ?auto_127133 ?auto_127138 ) ) ( not ( = ?auto_127133 ?auto_127139 ) ) ( not ( = ?auto_127134 ?auto_127135 ) ) ( not ( = ?auto_127134 ?auto_127136 ) ) ( not ( = ?auto_127134 ?auto_127137 ) ) ( not ( = ?auto_127134 ?auto_127138 ) ) ( not ( = ?auto_127134 ?auto_127139 ) ) ( not ( = ?auto_127135 ?auto_127136 ) ) ( not ( = ?auto_127135 ?auto_127137 ) ) ( not ( = ?auto_127135 ?auto_127138 ) ) ( not ( = ?auto_127135 ?auto_127139 ) ) ( not ( = ?auto_127136 ?auto_127137 ) ) ( not ( = ?auto_127136 ?auto_127138 ) ) ( not ( = ?auto_127136 ?auto_127139 ) ) ( not ( = ?auto_127137 ?auto_127138 ) ) ( not ( = ?auto_127137 ?auto_127139 ) ) ( not ( = ?auto_127138 ?auto_127139 ) ) ( ON ?auto_127137 ?auto_127138 ) ( ON ?auto_127136 ?auto_127137 ) ( ON ?auto_127135 ?auto_127136 ) ( ON ?auto_127134 ?auto_127135 ) ( ON ?auto_127133 ?auto_127134 ) ( ON ?auto_127132 ?auto_127133 ) ( ON ?auto_127131 ?auto_127132 ) ( CLEAR ?auto_127131 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_127131 )
      ( MAKE-8PILE ?auto_127131 ?auto_127132 ?auto_127133 ?auto_127134 ?auto_127135 ?auto_127136 ?auto_127137 ?auto_127138 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_127149 - BLOCK
      ?auto_127150 - BLOCK
      ?auto_127151 - BLOCK
      ?auto_127152 - BLOCK
      ?auto_127153 - BLOCK
      ?auto_127154 - BLOCK
      ?auto_127155 - BLOCK
      ?auto_127156 - BLOCK
      ?auto_127157 - BLOCK
    )
    :vars
    (
      ?auto_127158 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_127156 ) ( ON ?auto_127157 ?auto_127158 ) ( CLEAR ?auto_127157 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_127149 ) ( ON ?auto_127150 ?auto_127149 ) ( ON ?auto_127151 ?auto_127150 ) ( ON ?auto_127152 ?auto_127151 ) ( ON ?auto_127153 ?auto_127152 ) ( ON ?auto_127154 ?auto_127153 ) ( ON ?auto_127155 ?auto_127154 ) ( ON ?auto_127156 ?auto_127155 ) ( not ( = ?auto_127149 ?auto_127150 ) ) ( not ( = ?auto_127149 ?auto_127151 ) ) ( not ( = ?auto_127149 ?auto_127152 ) ) ( not ( = ?auto_127149 ?auto_127153 ) ) ( not ( = ?auto_127149 ?auto_127154 ) ) ( not ( = ?auto_127149 ?auto_127155 ) ) ( not ( = ?auto_127149 ?auto_127156 ) ) ( not ( = ?auto_127149 ?auto_127157 ) ) ( not ( = ?auto_127149 ?auto_127158 ) ) ( not ( = ?auto_127150 ?auto_127151 ) ) ( not ( = ?auto_127150 ?auto_127152 ) ) ( not ( = ?auto_127150 ?auto_127153 ) ) ( not ( = ?auto_127150 ?auto_127154 ) ) ( not ( = ?auto_127150 ?auto_127155 ) ) ( not ( = ?auto_127150 ?auto_127156 ) ) ( not ( = ?auto_127150 ?auto_127157 ) ) ( not ( = ?auto_127150 ?auto_127158 ) ) ( not ( = ?auto_127151 ?auto_127152 ) ) ( not ( = ?auto_127151 ?auto_127153 ) ) ( not ( = ?auto_127151 ?auto_127154 ) ) ( not ( = ?auto_127151 ?auto_127155 ) ) ( not ( = ?auto_127151 ?auto_127156 ) ) ( not ( = ?auto_127151 ?auto_127157 ) ) ( not ( = ?auto_127151 ?auto_127158 ) ) ( not ( = ?auto_127152 ?auto_127153 ) ) ( not ( = ?auto_127152 ?auto_127154 ) ) ( not ( = ?auto_127152 ?auto_127155 ) ) ( not ( = ?auto_127152 ?auto_127156 ) ) ( not ( = ?auto_127152 ?auto_127157 ) ) ( not ( = ?auto_127152 ?auto_127158 ) ) ( not ( = ?auto_127153 ?auto_127154 ) ) ( not ( = ?auto_127153 ?auto_127155 ) ) ( not ( = ?auto_127153 ?auto_127156 ) ) ( not ( = ?auto_127153 ?auto_127157 ) ) ( not ( = ?auto_127153 ?auto_127158 ) ) ( not ( = ?auto_127154 ?auto_127155 ) ) ( not ( = ?auto_127154 ?auto_127156 ) ) ( not ( = ?auto_127154 ?auto_127157 ) ) ( not ( = ?auto_127154 ?auto_127158 ) ) ( not ( = ?auto_127155 ?auto_127156 ) ) ( not ( = ?auto_127155 ?auto_127157 ) ) ( not ( = ?auto_127155 ?auto_127158 ) ) ( not ( = ?auto_127156 ?auto_127157 ) ) ( not ( = ?auto_127156 ?auto_127158 ) ) ( not ( = ?auto_127157 ?auto_127158 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_127157 ?auto_127158 )
      ( !STACK ?auto_127157 ?auto_127156 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_127168 - BLOCK
      ?auto_127169 - BLOCK
      ?auto_127170 - BLOCK
      ?auto_127171 - BLOCK
      ?auto_127172 - BLOCK
      ?auto_127173 - BLOCK
      ?auto_127174 - BLOCK
      ?auto_127175 - BLOCK
      ?auto_127176 - BLOCK
    )
    :vars
    (
      ?auto_127177 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_127175 ) ( ON ?auto_127176 ?auto_127177 ) ( CLEAR ?auto_127176 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_127168 ) ( ON ?auto_127169 ?auto_127168 ) ( ON ?auto_127170 ?auto_127169 ) ( ON ?auto_127171 ?auto_127170 ) ( ON ?auto_127172 ?auto_127171 ) ( ON ?auto_127173 ?auto_127172 ) ( ON ?auto_127174 ?auto_127173 ) ( ON ?auto_127175 ?auto_127174 ) ( not ( = ?auto_127168 ?auto_127169 ) ) ( not ( = ?auto_127168 ?auto_127170 ) ) ( not ( = ?auto_127168 ?auto_127171 ) ) ( not ( = ?auto_127168 ?auto_127172 ) ) ( not ( = ?auto_127168 ?auto_127173 ) ) ( not ( = ?auto_127168 ?auto_127174 ) ) ( not ( = ?auto_127168 ?auto_127175 ) ) ( not ( = ?auto_127168 ?auto_127176 ) ) ( not ( = ?auto_127168 ?auto_127177 ) ) ( not ( = ?auto_127169 ?auto_127170 ) ) ( not ( = ?auto_127169 ?auto_127171 ) ) ( not ( = ?auto_127169 ?auto_127172 ) ) ( not ( = ?auto_127169 ?auto_127173 ) ) ( not ( = ?auto_127169 ?auto_127174 ) ) ( not ( = ?auto_127169 ?auto_127175 ) ) ( not ( = ?auto_127169 ?auto_127176 ) ) ( not ( = ?auto_127169 ?auto_127177 ) ) ( not ( = ?auto_127170 ?auto_127171 ) ) ( not ( = ?auto_127170 ?auto_127172 ) ) ( not ( = ?auto_127170 ?auto_127173 ) ) ( not ( = ?auto_127170 ?auto_127174 ) ) ( not ( = ?auto_127170 ?auto_127175 ) ) ( not ( = ?auto_127170 ?auto_127176 ) ) ( not ( = ?auto_127170 ?auto_127177 ) ) ( not ( = ?auto_127171 ?auto_127172 ) ) ( not ( = ?auto_127171 ?auto_127173 ) ) ( not ( = ?auto_127171 ?auto_127174 ) ) ( not ( = ?auto_127171 ?auto_127175 ) ) ( not ( = ?auto_127171 ?auto_127176 ) ) ( not ( = ?auto_127171 ?auto_127177 ) ) ( not ( = ?auto_127172 ?auto_127173 ) ) ( not ( = ?auto_127172 ?auto_127174 ) ) ( not ( = ?auto_127172 ?auto_127175 ) ) ( not ( = ?auto_127172 ?auto_127176 ) ) ( not ( = ?auto_127172 ?auto_127177 ) ) ( not ( = ?auto_127173 ?auto_127174 ) ) ( not ( = ?auto_127173 ?auto_127175 ) ) ( not ( = ?auto_127173 ?auto_127176 ) ) ( not ( = ?auto_127173 ?auto_127177 ) ) ( not ( = ?auto_127174 ?auto_127175 ) ) ( not ( = ?auto_127174 ?auto_127176 ) ) ( not ( = ?auto_127174 ?auto_127177 ) ) ( not ( = ?auto_127175 ?auto_127176 ) ) ( not ( = ?auto_127175 ?auto_127177 ) ) ( not ( = ?auto_127176 ?auto_127177 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_127176 ?auto_127177 )
      ( !STACK ?auto_127176 ?auto_127175 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_127187 - BLOCK
      ?auto_127188 - BLOCK
      ?auto_127189 - BLOCK
      ?auto_127190 - BLOCK
      ?auto_127191 - BLOCK
      ?auto_127192 - BLOCK
      ?auto_127193 - BLOCK
      ?auto_127194 - BLOCK
      ?auto_127195 - BLOCK
    )
    :vars
    (
      ?auto_127196 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127195 ?auto_127196 ) ( ON-TABLE ?auto_127187 ) ( ON ?auto_127188 ?auto_127187 ) ( ON ?auto_127189 ?auto_127188 ) ( ON ?auto_127190 ?auto_127189 ) ( ON ?auto_127191 ?auto_127190 ) ( ON ?auto_127192 ?auto_127191 ) ( ON ?auto_127193 ?auto_127192 ) ( not ( = ?auto_127187 ?auto_127188 ) ) ( not ( = ?auto_127187 ?auto_127189 ) ) ( not ( = ?auto_127187 ?auto_127190 ) ) ( not ( = ?auto_127187 ?auto_127191 ) ) ( not ( = ?auto_127187 ?auto_127192 ) ) ( not ( = ?auto_127187 ?auto_127193 ) ) ( not ( = ?auto_127187 ?auto_127194 ) ) ( not ( = ?auto_127187 ?auto_127195 ) ) ( not ( = ?auto_127187 ?auto_127196 ) ) ( not ( = ?auto_127188 ?auto_127189 ) ) ( not ( = ?auto_127188 ?auto_127190 ) ) ( not ( = ?auto_127188 ?auto_127191 ) ) ( not ( = ?auto_127188 ?auto_127192 ) ) ( not ( = ?auto_127188 ?auto_127193 ) ) ( not ( = ?auto_127188 ?auto_127194 ) ) ( not ( = ?auto_127188 ?auto_127195 ) ) ( not ( = ?auto_127188 ?auto_127196 ) ) ( not ( = ?auto_127189 ?auto_127190 ) ) ( not ( = ?auto_127189 ?auto_127191 ) ) ( not ( = ?auto_127189 ?auto_127192 ) ) ( not ( = ?auto_127189 ?auto_127193 ) ) ( not ( = ?auto_127189 ?auto_127194 ) ) ( not ( = ?auto_127189 ?auto_127195 ) ) ( not ( = ?auto_127189 ?auto_127196 ) ) ( not ( = ?auto_127190 ?auto_127191 ) ) ( not ( = ?auto_127190 ?auto_127192 ) ) ( not ( = ?auto_127190 ?auto_127193 ) ) ( not ( = ?auto_127190 ?auto_127194 ) ) ( not ( = ?auto_127190 ?auto_127195 ) ) ( not ( = ?auto_127190 ?auto_127196 ) ) ( not ( = ?auto_127191 ?auto_127192 ) ) ( not ( = ?auto_127191 ?auto_127193 ) ) ( not ( = ?auto_127191 ?auto_127194 ) ) ( not ( = ?auto_127191 ?auto_127195 ) ) ( not ( = ?auto_127191 ?auto_127196 ) ) ( not ( = ?auto_127192 ?auto_127193 ) ) ( not ( = ?auto_127192 ?auto_127194 ) ) ( not ( = ?auto_127192 ?auto_127195 ) ) ( not ( = ?auto_127192 ?auto_127196 ) ) ( not ( = ?auto_127193 ?auto_127194 ) ) ( not ( = ?auto_127193 ?auto_127195 ) ) ( not ( = ?auto_127193 ?auto_127196 ) ) ( not ( = ?auto_127194 ?auto_127195 ) ) ( not ( = ?auto_127194 ?auto_127196 ) ) ( not ( = ?auto_127195 ?auto_127196 ) ) ( CLEAR ?auto_127193 ) ( ON ?auto_127194 ?auto_127195 ) ( CLEAR ?auto_127194 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_127187 ?auto_127188 ?auto_127189 ?auto_127190 ?auto_127191 ?auto_127192 ?auto_127193 ?auto_127194 )
      ( MAKE-9PILE ?auto_127187 ?auto_127188 ?auto_127189 ?auto_127190 ?auto_127191 ?auto_127192 ?auto_127193 ?auto_127194 ?auto_127195 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_127206 - BLOCK
      ?auto_127207 - BLOCK
      ?auto_127208 - BLOCK
      ?auto_127209 - BLOCK
      ?auto_127210 - BLOCK
      ?auto_127211 - BLOCK
      ?auto_127212 - BLOCK
      ?auto_127213 - BLOCK
      ?auto_127214 - BLOCK
    )
    :vars
    (
      ?auto_127215 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127214 ?auto_127215 ) ( ON-TABLE ?auto_127206 ) ( ON ?auto_127207 ?auto_127206 ) ( ON ?auto_127208 ?auto_127207 ) ( ON ?auto_127209 ?auto_127208 ) ( ON ?auto_127210 ?auto_127209 ) ( ON ?auto_127211 ?auto_127210 ) ( ON ?auto_127212 ?auto_127211 ) ( not ( = ?auto_127206 ?auto_127207 ) ) ( not ( = ?auto_127206 ?auto_127208 ) ) ( not ( = ?auto_127206 ?auto_127209 ) ) ( not ( = ?auto_127206 ?auto_127210 ) ) ( not ( = ?auto_127206 ?auto_127211 ) ) ( not ( = ?auto_127206 ?auto_127212 ) ) ( not ( = ?auto_127206 ?auto_127213 ) ) ( not ( = ?auto_127206 ?auto_127214 ) ) ( not ( = ?auto_127206 ?auto_127215 ) ) ( not ( = ?auto_127207 ?auto_127208 ) ) ( not ( = ?auto_127207 ?auto_127209 ) ) ( not ( = ?auto_127207 ?auto_127210 ) ) ( not ( = ?auto_127207 ?auto_127211 ) ) ( not ( = ?auto_127207 ?auto_127212 ) ) ( not ( = ?auto_127207 ?auto_127213 ) ) ( not ( = ?auto_127207 ?auto_127214 ) ) ( not ( = ?auto_127207 ?auto_127215 ) ) ( not ( = ?auto_127208 ?auto_127209 ) ) ( not ( = ?auto_127208 ?auto_127210 ) ) ( not ( = ?auto_127208 ?auto_127211 ) ) ( not ( = ?auto_127208 ?auto_127212 ) ) ( not ( = ?auto_127208 ?auto_127213 ) ) ( not ( = ?auto_127208 ?auto_127214 ) ) ( not ( = ?auto_127208 ?auto_127215 ) ) ( not ( = ?auto_127209 ?auto_127210 ) ) ( not ( = ?auto_127209 ?auto_127211 ) ) ( not ( = ?auto_127209 ?auto_127212 ) ) ( not ( = ?auto_127209 ?auto_127213 ) ) ( not ( = ?auto_127209 ?auto_127214 ) ) ( not ( = ?auto_127209 ?auto_127215 ) ) ( not ( = ?auto_127210 ?auto_127211 ) ) ( not ( = ?auto_127210 ?auto_127212 ) ) ( not ( = ?auto_127210 ?auto_127213 ) ) ( not ( = ?auto_127210 ?auto_127214 ) ) ( not ( = ?auto_127210 ?auto_127215 ) ) ( not ( = ?auto_127211 ?auto_127212 ) ) ( not ( = ?auto_127211 ?auto_127213 ) ) ( not ( = ?auto_127211 ?auto_127214 ) ) ( not ( = ?auto_127211 ?auto_127215 ) ) ( not ( = ?auto_127212 ?auto_127213 ) ) ( not ( = ?auto_127212 ?auto_127214 ) ) ( not ( = ?auto_127212 ?auto_127215 ) ) ( not ( = ?auto_127213 ?auto_127214 ) ) ( not ( = ?auto_127213 ?auto_127215 ) ) ( not ( = ?auto_127214 ?auto_127215 ) ) ( CLEAR ?auto_127212 ) ( ON ?auto_127213 ?auto_127214 ) ( CLEAR ?auto_127213 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_127206 ?auto_127207 ?auto_127208 ?auto_127209 ?auto_127210 ?auto_127211 ?auto_127212 ?auto_127213 )
      ( MAKE-9PILE ?auto_127206 ?auto_127207 ?auto_127208 ?auto_127209 ?auto_127210 ?auto_127211 ?auto_127212 ?auto_127213 ?auto_127214 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_127225 - BLOCK
      ?auto_127226 - BLOCK
      ?auto_127227 - BLOCK
      ?auto_127228 - BLOCK
      ?auto_127229 - BLOCK
      ?auto_127230 - BLOCK
      ?auto_127231 - BLOCK
      ?auto_127232 - BLOCK
      ?auto_127233 - BLOCK
    )
    :vars
    (
      ?auto_127234 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127233 ?auto_127234 ) ( ON-TABLE ?auto_127225 ) ( ON ?auto_127226 ?auto_127225 ) ( ON ?auto_127227 ?auto_127226 ) ( ON ?auto_127228 ?auto_127227 ) ( ON ?auto_127229 ?auto_127228 ) ( ON ?auto_127230 ?auto_127229 ) ( not ( = ?auto_127225 ?auto_127226 ) ) ( not ( = ?auto_127225 ?auto_127227 ) ) ( not ( = ?auto_127225 ?auto_127228 ) ) ( not ( = ?auto_127225 ?auto_127229 ) ) ( not ( = ?auto_127225 ?auto_127230 ) ) ( not ( = ?auto_127225 ?auto_127231 ) ) ( not ( = ?auto_127225 ?auto_127232 ) ) ( not ( = ?auto_127225 ?auto_127233 ) ) ( not ( = ?auto_127225 ?auto_127234 ) ) ( not ( = ?auto_127226 ?auto_127227 ) ) ( not ( = ?auto_127226 ?auto_127228 ) ) ( not ( = ?auto_127226 ?auto_127229 ) ) ( not ( = ?auto_127226 ?auto_127230 ) ) ( not ( = ?auto_127226 ?auto_127231 ) ) ( not ( = ?auto_127226 ?auto_127232 ) ) ( not ( = ?auto_127226 ?auto_127233 ) ) ( not ( = ?auto_127226 ?auto_127234 ) ) ( not ( = ?auto_127227 ?auto_127228 ) ) ( not ( = ?auto_127227 ?auto_127229 ) ) ( not ( = ?auto_127227 ?auto_127230 ) ) ( not ( = ?auto_127227 ?auto_127231 ) ) ( not ( = ?auto_127227 ?auto_127232 ) ) ( not ( = ?auto_127227 ?auto_127233 ) ) ( not ( = ?auto_127227 ?auto_127234 ) ) ( not ( = ?auto_127228 ?auto_127229 ) ) ( not ( = ?auto_127228 ?auto_127230 ) ) ( not ( = ?auto_127228 ?auto_127231 ) ) ( not ( = ?auto_127228 ?auto_127232 ) ) ( not ( = ?auto_127228 ?auto_127233 ) ) ( not ( = ?auto_127228 ?auto_127234 ) ) ( not ( = ?auto_127229 ?auto_127230 ) ) ( not ( = ?auto_127229 ?auto_127231 ) ) ( not ( = ?auto_127229 ?auto_127232 ) ) ( not ( = ?auto_127229 ?auto_127233 ) ) ( not ( = ?auto_127229 ?auto_127234 ) ) ( not ( = ?auto_127230 ?auto_127231 ) ) ( not ( = ?auto_127230 ?auto_127232 ) ) ( not ( = ?auto_127230 ?auto_127233 ) ) ( not ( = ?auto_127230 ?auto_127234 ) ) ( not ( = ?auto_127231 ?auto_127232 ) ) ( not ( = ?auto_127231 ?auto_127233 ) ) ( not ( = ?auto_127231 ?auto_127234 ) ) ( not ( = ?auto_127232 ?auto_127233 ) ) ( not ( = ?auto_127232 ?auto_127234 ) ) ( not ( = ?auto_127233 ?auto_127234 ) ) ( ON ?auto_127232 ?auto_127233 ) ( CLEAR ?auto_127230 ) ( ON ?auto_127231 ?auto_127232 ) ( CLEAR ?auto_127231 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_127225 ?auto_127226 ?auto_127227 ?auto_127228 ?auto_127229 ?auto_127230 ?auto_127231 )
      ( MAKE-9PILE ?auto_127225 ?auto_127226 ?auto_127227 ?auto_127228 ?auto_127229 ?auto_127230 ?auto_127231 ?auto_127232 ?auto_127233 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_127244 - BLOCK
      ?auto_127245 - BLOCK
      ?auto_127246 - BLOCK
      ?auto_127247 - BLOCK
      ?auto_127248 - BLOCK
      ?auto_127249 - BLOCK
      ?auto_127250 - BLOCK
      ?auto_127251 - BLOCK
      ?auto_127252 - BLOCK
    )
    :vars
    (
      ?auto_127253 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127252 ?auto_127253 ) ( ON-TABLE ?auto_127244 ) ( ON ?auto_127245 ?auto_127244 ) ( ON ?auto_127246 ?auto_127245 ) ( ON ?auto_127247 ?auto_127246 ) ( ON ?auto_127248 ?auto_127247 ) ( ON ?auto_127249 ?auto_127248 ) ( not ( = ?auto_127244 ?auto_127245 ) ) ( not ( = ?auto_127244 ?auto_127246 ) ) ( not ( = ?auto_127244 ?auto_127247 ) ) ( not ( = ?auto_127244 ?auto_127248 ) ) ( not ( = ?auto_127244 ?auto_127249 ) ) ( not ( = ?auto_127244 ?auto_127250 ) ) ( not ( = ?auto_127244 ?auto_127251 ) ) ( not ( = ?auto_127244 ?auto_127252 ) ) ( not ( = ?auto_127244 ?auto_127253 ) ) ( not ( = ?auto_127245 ?auto_127246 ) ) ( not ( = ?auto_127245 ?auto_127247 ) ) ( not ( = ?auto_127245 ?auto_127248 ) ) ( not ( = ?auto_127245 ?auto_127249 ) ) ( not ( = ?auto_127245 ?auto_127250 ) ) ( not ( = ?auto_127245 ?auto_127251 ) ) ( not ( = ?auto_127245 ?auto_127252 ) ) ( not ( = ?auto_127245 ?auto_127253 ) ) ( not ( = ?auto_127246 ?auto_127247 ) ) ( not ( = ?auto_127246 ?auto_127248 ) ) ( not ( = ?auto_127246 ?auto_127249 ) ) ( not ( = ?auto_127246 ?auto_127250 ) ) ( not ( = ?auto_127246 ?auto_127251 ) ) ( not ( = ?auto_127246 ?auto_127252 ) ) ( not ( = ?auto_127246 ?auto_127253 ) ) ( not ( = ?auto_127247 ?auto_127248 ) ) ( not ( = ?auto_127247 ?auto_127249 ) ) ( not ( = ?auto_127247 ?auto_127250 ) ) ( not ( = ?auto_127247 ?auto_127251 ) ) ( not ( = ?auto_127247 ?auto_127252 ) ) ( not ( = ?auto_127247 ?auto_127253 ) ) ( not ( = ?auto_127248 ?auto_127249 ) ) ( not ( = ?auto_127248 ?auto_127250 ) ) ( not ( = ?auto_127248 ?auto_127251 ) ) ( not ( = ?auto_127248 ?auto_127252 ) ) ( not ( = ?auto_127248 ?auto_127253 ) ) ( not ( = ?auto_127249 ?auto_127250 ) ) ( not ( = ?auto_127249 ?auto_127251 ) ) ( not ( = ?auto_127249 ?auto_127252 ) ) ( not ( = ?auto_127249 ?auto_127253 ) ) ( not ( = ?auto_127250 ?auto_127251 ) ) ( not ( = ?auto_127250 ?auto_127252 ) ) ( not ( = ?auto_127250 ?auto_127253 ) ) ( not ( = ?auto_127251 ?auto_127252 ) ) ( not ( = ?auto_127251 ?auto_127253 ) ) ( not ( = ?auto_127252 ?auto_127253 ) ) ( ON ?auto_127251 ?auto_127252 ) ( CLEAR ?auto_127249 ) ( ON ?auto_127250 ?auto_127251 ) ( CLEAR ?auto_127250 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_127244 ?auto_127245 ?auto_127246 ?auto_127247 ?auto_127248 ?auto_127249 ?auto_127250 )
      ( MAKE-9PILE ?auto_127244 ?auto_127245 ?auto_127246 ?auto_127247 ?auto_127248 ?auto_127249 ?auto_127250 ?auto_127251 ?auto_127252 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_127263 - BLOCK
      ?auto_127264 - BLOCK
      ?auto_127265 - BLOCK
      ?auto_127266 - BLOCK
      ?auto_127267 - BLOCK
      ?auto_127268 - BLOCK
      ?auto_127269 - BLOCK
      ?auto_127270 - BLOCK
      ?auto_127271 - BLOCK
    )
    :vars
    (
      ?auto_127272 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127271 ?auto_127272 ) ( ON-TABLE ?auto_127263 ) ( ON ?auto_127264 ?auto_127263 ) ( ON ?auto_127265 ?auto_127264 ) ( ON ?auto_127266 ?auto_127265 ) ( ON ?auto_127267 ?auto_127266 ) ( not ( = ?auto_127263 ?auto_127264 ) ) ( not ( = ?auto_127263 ?auto_127265 ) ) ( not ( = ?auto_127263 ?auto_127266 ) ) ( not ( = ?auto_127263 ?auto_127267 ) ) ( not ( = ?auto_127263 ?auto_127268 ) ) ( not ( = ?auto_127263 ?auto_127269 ) ) ( not ( = ?auto_127263 ?auto_127270 ) ) ( not ( = ?auto_127263 ?auto_127271 ) ) ( not ( = ?auto_127263 ?auto_127272 ) ) ( not ( = ?auto_127264 ?auto_127265 ) ) ( not ( = ?auto_127264 ?auto_127266 ) ) ( not ( = ?auto_127264 ?auto_127267 ) ) ( not ( = ?auto_127264 ?auto_127268 ) ) ( not ( = ?auto_127264 ?auto_127269 ) ) ( not ( = ?auto_127264 ?auto_127270 ) ) ( not ( = ?auto_127264 ?auto_127271 ) ) ( not ( = ?auto_127264 ?auto_127272 ) ) ( not ( = ?auto_127265 ?auto_127266 ) ) ( not ( = ?auto_127265 ?auto_127267 ) ) ( not ( = ?auto_127265 ?auto_127268 ) ) ( not ( = ?auto_127265 ?auto_127269 ) ) ( not ( = ?auto_127265 ?auto_127270 ) ) ( not ( = ?auto_127265 ?auto_127271 ) ) ( not ( = ?auto_127265 ?auto_127272 ) ) ( not ( = ?auto_127266 ?auto_127267 ) ) ( not ( = ?auto_127266 ?auto_127268 ) ) ( not ( = ?auto_127266 ?auto_127269 ) ) ( not ( = ?auto_127266 ?auto_127270 ) ) ( not ( = ?auto_127266 ?auto_127271 ) ) ( not ( = ?auto_127266 ?auto_127272 ) ) ( not ( = ?auto_127267 ?auto_127268 ) ) ( not ( = ?auto_127267 ?auto_127269 ) ) ( not ( = ?auto_127267 ?auto_127270 ) ) ( not ( = ?auto_127267 ?auto_127271 ) ) ( not ( = ?auto_127267 ?auto_127272 ) ) ( not ( = ?auto_127268 ?auto_127269 ) ) ( not ( = ?auto_127268 ?auto_127270 ) ) ( not ( = ?auto_127268 ?auto_127271 ) ) ( not ( = ?auto_127268 ?auto_127272 ) ) ( not ( = ?auto_127269 ?auto_127270 ) ) ( not ( = ?auto_127269 ?auto_127271 ) ) ( not ( = ?auto_127269 ?auto_127272 ) ) ( not ( = ?auto_127270 ?auto_127271 ) ) ( not ( = ?auto_127270 ?auto_127272 ) ) ( not ( = ?auto_127271 ?auto_127272 ) ) ( ON ?auto_127270 ?auto_127271 ) ( ON ?auto_127269 ?auto_127270 ) ( CLEAR ?auto_127267 ) ( ON ?auto_127268 ?auto_127269 ) ( CLEAR ?auto_127268 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_127263 ?auto_127264 ?auto_127265 ?auto_127266 ?auto_127267 ?auto_127268 )
      ( MAKE-9PILE ?auto_127263 ?auto_127264 ?auto_127265 ?auto_127266 ?auto_127267 ?auto_127268 ?auto_127269 ?auto_127270 ?auto_127271 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_127282 - BLOCK
      ?auto_127283 - BLOCK
      ?auto_127284 - BLOCK
      ?auto_127285 - BLOCK
      ?auto_127286 - BLOCK
      ?auto_127287 - BLOCK
      ?auto_127288 - BLOCK
      ?auto_127289 - BLOCK
      ?auto_127290 - BLOCK
    )
    :vars
    (
      ?auto_127291 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127290 ?auto_127291 ) ( ON-TABLE ?auto_127282 ) ( ON ?auto_127283 ?auto_127282 ) ( ON ?auto_127284 ?auto_127283 ) ( ON ?auto_127285 ?auto_127284 ) ( ON ?auto_127286 ?auto_127285 ) ( not ( = ?auto_127282 ?auto_127283 ) ) ( not ( = ?auto_127282 ?auto_127284 ) ) ( not ( = ?auto_127282 ?auto_127285 ) ) ( not ( = ?auto_127282 ?auto_127286 ) ) ( not ( = ?auto_127282 ?auto_127287 ) ) ( not ( = ?auto_127282 ?auto_127288 ) ) ( not ( = ?auto_127282 ?auto_127289 ) ) ( not ( = ?auto_127282 ?auto_127290 ) ) ( not ( = ?auto_127282 ?auto_127291 ) ) ( not ( = ?auto_127283 ?auto_127284 ) ) ( not ( = ?auto_127283 ?auto_127285 ) ) ( not ( = ?auto_127283 ?auto_127286 ) ) ( not ( = ?auto_127283 ?auto_127287 ) ) ( not ( = ?auto_127283 ?auto_127288 ) ) ( not ( = ?auto_127283 ?auto_127289 ) ) ( not ( = ?auto_127283 ?auto_127290 ) ) ( not ( = ?auto_127283 ?auto_127291 ) ) ( not ( = ?auto_127284 ?auto_127285 ) ) ( not ( = ?auto_127284 ?auto_127286 ) ) ( not ( = ?auto_127284 ?auto_127287 ) ) ( not ( = ?auto_127284 ?auto_127288 ) ) ( not ( = ?auto_127284 ?auto_127289 ) ) ( not ( = ?auto_127284 ?auto_127290 ) ) ( not ( = ?auto_127284 ?auto_127291 ) ) ( not ( = ?auto_127285 ?auto_127286 ) ) ( not ( = ?auto_127285 ?auto_127287 ) ) ( not ( = ?auto_127285 ?auto_127288 ) ) ( not ( = ?auto_127285 ?auto_127289 ) ) ( not ( = ?auto_127285 ?auto_127290 ) ) ( not ( = ?auto_127285 ?auto_127291 ) ) ( not ( = ?auto_127286 ?auto_127287 ) ) ( not ( = ?auto_127286 ?auto_127288 ) ) ( not ( = ?auto_127286 ?auto_127289 ) ) ( not ( = ?auto_127286 ?auto_127290 ) ) ( not ( = ?auto_127286 ?auto_127291 ) ) ( not ( = ?auto_127287 ?auto_127288 ) ) ( not ( = ?auto_127287 ?auto_127289 ) ) ( not ( = ?auto_127287 ?auto_127290 ) ) ( not ( = ?auto_127287 ?auto_127291 ) ) ( not ( = ?auto_127288 ?auto_127289 ) ) ( not ( = ?auto_127288 ?auto_127290 ) ) ( not ( = ?auto_127288 ?auto_127291 ) ) ( not ( = ?auto_127289 ?auto_127290 ) ) ( not ( = ?auto_127289 ?auto_127291 ) ) ( not ( = ?auto_127290 ?auto_127291 ) ) ( ON ?auto_127289 ?auto_127290 ) ( ON ?auto_127288 ?auto_127289 ) ( CLEAR ?auto_127286 ) ( ON ?auto_127287 ?auto_127288 ) ( CLEAR ?auto_127287 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_127282 ?auto_127283 ?auto_127284 ?auto_127285 ?auto_127286 ?auto_127287 )
      ( MAKE-9PILE ?auto_127282 ?auto_127283 ?auto_127284 ?auto_127285 ?auto_127286 ?auto_127287 ?auto_127288 ?auto_127289 ?auto_127290 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_127301 - BLOCK
      ?auto_127302 - BLOCK
      ?auto_127303 - BLOCK
      ?auto_127304 - BLOCK
      ?auto_127305 - BLOCK
      ?auto_127306 - BLOCK
      ?auto_127307 - BLOCK
      ?auto_127308 - BLOCK
      ?auto_127309 - BLOCK
    )
    :vars
    (
      ?auto_127310 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127309 ?auto_127310 ) ( ON-TABLE ?auto_127301 ) ( ON ?auto_127302 ?auto_127301 ) ( ON ?auto_127303 ?auto_127302 ) ( ON ?auto_127304 ?auto_127303 ) ( not ( = ?auto_127301 ?auto_127302 ) ) ( not ( = ?auto_127301 ?auto_127303 ) ) ( not ( = ?auto_127301 ?auto_127304 ) ) ( not ( = ?auto_127301 ?auto_127305 ) ) ( not ( = ?auto_127301 ?auto_127306 ) ) ( not ( = ?auto_127301 ?auto_127307 ) ) ( not ( = ?auto_127301 ?auto_127308 ) ) ( not ( = ?auto_127301 ?auto_127309 ) ) ( not ( = ?auto_127301 ?auto_127310 ) ) ( not ( = ?auto_127302 ?auto_127303 ) ) ( not ( = ?auto_127302 ?auto_127304 ) ) ( not ( = ?auto_127302 ?auto_127305 ) ) ( not ( = ?auto_127302 ?auto_127306 ) ) ( not ( = ?auto_127302 ?auto_127307 ) ) ( not ( = ?auto_127302 ?auto_127308 ) ) ( not ( = ?auto_127302 ?auto_127309 ) ) ( not ( = ?auto_127302 ?auto_127310 ) ) ( not ( = ?auto_127303 ?auto_127304 ) ) ( not ( = ?auto_127303 ?auto_127305 ) ) ( not ( = ?auto_127303 ?auto_127306 ) ) ( not ( = ?auto_127303 ?auto_127307 ) ) ( not ( = ?auto_127303 ?auto_127308 ) ) ( not ( = ?auto_127303 ?auto_127309 ) ) ( not ( = ?auto_127303 ?auto_127310 ) ) ( not ( = ?auto_127304 ?auto_127305 ) ) ( not ( = ?auto_127304 ?auto_127306 ) ) ( not ( = ?auto_127304 ?auto_127307 ) ) ( not ( = ?auto_127304 ?auto_127308 ) ) ( not ( = ?auto_127304 ?auto_127309 ) ) ( not ( = ?auto_127304 ?auto_127310 ) ) ( not ( = ?auto_127305 ?auto_127306 ) ) ( not ( = ?auto_127305 ?auto_127307 ) ) ( not ( = ?auto_127305 ?auto_127308 ) ) ( not ( = ?auto_127305 ?auto_127309 ) ) ( not ( = ?auto_127305 ?auto_127310 ) ) ( not ( = ?auto_127306 ?auto_127307 ) ) ( not ( = ?auto_127306 ?auto_127308 ) ) ( not ( = ?auto_127306 ?auto_127309 ) ) ( not ( = ?auto_127306 ?auto_127310 ) ) ( not ( = ?auto_127307 ?auto_127308 ) ) ( not ( = ?auto_127307 ?auto_127309 ) ) ( not ( = ?auto_127307 ?auto_127310 ) ) ( not ( = ?auto_127308 ?auto_127309 ) ) ( not ( = ?auto_127308 ?auto_127310 ) ) ( not ( = ?auto_127309 ?auto_127310 ) ) ( ON ?auto_127308 ?auto_127309 ) ( ON ?auto_127307 ?auto_127308 ) ( ON ?auto_127306 ?auto_127307 ) ( CLEAR ?auto_127304 ) ( ON ?auto_127305 ?auto_127306 ) ( CLEAR ?auto_127305 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_127301 ?auto_127302 ?auto_127303 ?auto_127304 ?auto_127305 )
      ( MAKE-9PILE ?auto_127301 ?auto_127302 ?auto_127303 ?auto_127304 ?auto_127305 ?auto_127306 ?auto_127307 ?auto_127308 ?auto_127309 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_127320 - BLOCK
      ?auto_127321 - BLOCK
      ?auto_127322 - BLOCK
      ?auto_127323 - BLOCK
      ?auto_127324 - BLOCK
      ?auto_127325 - BLOCK
      ?auto_127326 - BLOCK
      ?auto_127327 - BLOCK
      ?auto_127328 - BLOCK
    )
    :vars
    (
      ?auto_127329 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127328 ?auto_127329 ) ( ON-TABLE ?auto_127320 ) ( ON ?auto_127321 ?auto_127320 ) ( ON ?auto_127322 ?auto_127321 ) ( ON ?auto_127323 ?auto_127322 ) ( not ( = ?auto_127320 ?auto_127321 ) ) ( not ( = ?auto_127320 ?auto_127322 ) ) ( not ( = ?auto_127320 ?auto_127323 ) ) ( not ( = ?auto_127320 ?auto_127324 ) ) ( not ( = ?auto_127320 ?auto_127325 ) ) ( not ( = ?auto_127320 ?auto_127326 ) ) ( not ( = ?auto_127320 ?auto_127327 ) ) ( not ( = ?auto_127320 ?auto_127328 ) ) ( not ( = ?auto_127320 ?auto_127329 ) ) ( not ( = ?auto_127321 ?auto_127322 ) ) ( not ( = ?auto_127321 ?auto_127323 ) ) ( not ( = ?auto_127321 ?auto_127324 ) ) ( not ( = ?auto_127321 ?auto_127325 ) ) ( not ( = ?auto_127321 ?auto_127326 ) ) ( not ( = ?auto_127321 ?auto_127327 ) ) ( not ( = ?auto_127321 ?auto_127328 ) ) ( not ( = ?auto_127321 ?auto_127329 ) ) ( not ( = ?auto_127322 ?auto_127323 ) ) ( not ( = ?auto_127322 ?auto_127324 ) ) ( not ( = ?auto_127322 ?auto_127325 ) ) ( not ( = ?auto_127322 ?auto_127326 ) ) ( not ( = ?auto_127322 ?auto_127327 ) ) ( not ( = ?auto_127322 ?auto_127328 ) ) ( not ( = ?auto_127322 ?auto_127329 ) ) ( not ( = ?auto_127323 ?auto_127324 ) ) ( not ( = ?auto_127323 ?auto_127325 ) ) ( not ( = ?auto_127323 ?auto_127326 ) ) ( not ( = ?auto_127323 ?auto_127327 ) ) ( not ( = ?auto_127323 ?auto_127328 ) ) ( not ( = ?auto_127323 ?auto_127329 ) ) ( not ( = ?auto_127324 ?auto_127325 ) ) ( not ( = ?auto_127324 ?auto_127326 ) ) ( not ( = ?auto_127324 ?auto_127327 ) ) ( not ( = ?auto_127324 ?auto_127328 ) ) ( not ( = ?auto_127324 ?auto_127329 ) ) ( not ( = ?auto_127325 ?auto_127326 ) ) ( not ( = ?auto_127325 ?auto_127327 ) ) ( not ( = ?auto_127325 ?auto_127328 ) ) ( not ( = ?auto_127325 ?auto_127329 ) ) ( not ( = ?auto_127326 ?auto_127327 ) ) ( not ( = ?auto_127326 ?auto_127328 ) ) ( not ( = ?auto_127326 ?auto_127329 ) ) ( not ( = ?auto_127327 ?auto_127328 ) ) ( not ( = ?auto_127327 ?auto_127329 ) ) ( not ( = ?auto_127328 ?auto_127329 ) ) ( ON ?auto_127327 ?auto_127328 ) ( ON ?auto_127326 ?auto_127327 ) ( ON ?auto_127325 ?auto_127326 ) ( CLEAR ?auto_127323 ) ( ON ?auto_127324 ?auto_127325 ) ( CLEAR ?auto_127324 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_127320 ?auto_127321 ?auto_127322 ?auto_127323 ?auto_127324 )
      ( MAKE-9PILE ?auto_127320 ?auto_127321 ?auto_127322 ?auto_127323 ?auto_127324 ?auto_127325 ?auto_127326 ?auto_127327 ?auto_127328 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_127339 - BLOCK
      ?auto_127340 - BLOCK
      ?auto_127341 - BLOCK
      ?auto_127342 - BLOCK
      ?auto_127343 - BLOCK
      ?auto_127344 - BLOCK
      ?auto_127345 - BLOCK
      ?auto_127346 - BLOCK
      ?auto_127347 - BLOCK
    )
    :vars
    (
      ?auto_127348 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127347 ?auto_127348 ) ( ON-TABLE ?auto_127339 ) ( ON ?auto_127340 ?auto_127339 ) ( ON ?auto_127341 ?auto_127340 ) ( not ( = ?auto_127339 ?auto_127340 ) ) ( not ( = ?auto_127339 ?auto_127341 ) ) ( not ( = ?auto_127339 ?auto_127342 ) ) ( not ( = ?auto_127339 ?auto_127343 ) ) ( not ( = ?auto_127339 ?auto_127344 ) ) ( not ( = ?auto_127339 ?auto_127345 ) ) ( not ( = ?auto_127339 ?auto_127346 ) ) ( not ( = ?auto_127339 ?auto_127347 ) ) ( not ( = ?auto_127339 ?auto_127348 ) ) ( not ( = ?auto_127340 ?auto_127341 ) ) ( not ( = ?auto_127340 ?auto_127342 ) ) ( not ( = ?auto_127340 ?auto_127343 ) ) ( not ( = ?auto_127340 ?auto_127344 ) ) ( not ( = ?auto_127340 ?auto_127345 ) ) ( not ( = ?auto_127340 ?auto_127346 ) ) ( not ( = ?auto_127340 ?auto_127347 ) ) ( not ( = ?auto_127340 ?auto_127348 ) ) ( not ( = ?auto_127341 ?auto_127342 ) ) ( not ( = ?auto_127341 ?auto_127343 ) ) ( not ( = ?auto_127341 ?auto_127344 ) ) ( not ( = ?auto_127341 ?auto_127345 ) ) ( not ( = ?auto_127341 ?auto_127346 ) ) ( not ( = ?auto_127341 ?auto_127347 ) ) ( not ( = ?auto_127341 ?auto_127348 ) ) ( not ( = ?auto_127342 ?auto_127343 ) ) ( not ( = ?auto_127342 ?auto_127344 ) ) ( not ( = ?auto_127342 ?auto_127345 ) ) ( not ( = ?auto_127342 ?auto_127346 ) ) ( not ( = ?auto_127342 ?auto_127347 ) ) ( not ( = ?auto_127342 ?auto_127348 ) ) ( not ( = ?auto_127343 ?auto_127344 ) ) ( not ( = ?auto_127343 ?auto_127345 ) ) ( not ( = ?auto_127343 ?auto_127346 ) ) ( not ( = ?auto_127343 ?auto_127347 ) ) ( not ( = ?auto_127343 ?auto_127348 ) ) ( not ( = ?auto_127344 ?auto_127345 ) ) ( not ( = ?auto_127344 ?auto_127346 ) ) ( not ( = ?auto_127344 ?auto_127347 ) ) ( not ( = ?auto_127344 ?auto_127348 ) ) ( not ( = ?auto_127345 ?auto_127346 ) ) ( not ( = ?auto_127345 ?auto_127347 ) ) ( not ( = ?auto_127345 ?auto_127348 ) ) ( not ( = ?auto_127346 ?auto_127347 ) ) ( not ( = ?auto_127346 ?auto_127348 ) ) ( not ( = ?auto_127347 ?auto_127348 ) ) ( ON ?auto_127346 ?auto_127347 ) ( ON ?auto_127345 ?auto_127346 ) ( ON ?auto_127344 ?auto_127345 ) ( ON ?auto_127343 ?auto_127344 ) ( CLEAR ?auto_127341 ) ( ON ?auto_127342 ?auto_127343 ) ( CLEAR ?auto_127342 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_127339 ?auto_127340 ?auto_127341 ?auto_127342 )
      ( MAKE-9PILE ?auto_127339 ?auto_127340 ?auto_127341 ?auto_127342 ?auto_127343 ?auto_127344 ?auto_127345 ?auto_127346 ?auto_127347 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_127358 - BLOCK
      ?auto_127359 - BLOCK
      ?auto_127360 - BLOCK
      ?auto_127361 - BLOCK
      ?auto_127362 - BLOCK
      ?auto_127363 - BLOCK
      ?auto_127364 - BLOCK
      ?auto_127365 - BLOCK
      ?auto_127366 - BLOCK
    )
    :vars
    (
      ?auto_127367 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127366 ?auto_127367 ) ( ON-TABLE ?auto_127358 ) ( ON ?auto_127359 ?auto_127358 ) ( ON ?auto_127360 ?auto_127359 ) ( not ( = ?auto_127358 ?auto_127359 ) ) ( not ( = ?auto_127358 ?auto_127360 ) ) ( not ( = ?auto_127358 ?auto_127361 ) ) ( not ( = ?auto_127358 ?auto_127362 ) ) ( not ( = ?auto_127358 ?auto_127363 ) ) ( not ( = ?auto_127358 ?auto_127364 ) ) ( not ( = ?auto_127358 ?auto_127365 ) ) ( not ( = ?auto_127358 ?auto_127366 ) ) ( not ( = ?auto_127358 ?auto_127367 ) ) ( not ( = ?auto_127359 ?auto_127360 ) ) ( not ( = ?auto_127359 ?auto_127361 ) ) ( not ( = ?auto_127359 ?auto_127362 ) ) ( not ( = ?auto_127359 ?auto_127363 ) ) ( not ( = ?auto_127359 ?auto_127364 ) ) ( not ( = ?auto_127359 ?auto_127365 ) ) ( not ( = ?auto_127359 ?auto_127366 ) ) ( not ( = ?auto_127359 ?auto_127367 ) ) ( not ( = ?auto_127360 ?auto_127361 ) ) ( not ( = ?auto_127360 ?auto_127362 ) ) ( not ( = ?auto_127360 ?auto_127363 ) ) ( not ( = ?auto_127360 ?auto_127364 ) ) ( not ( = ?auto_127360 ?auto_127365 ) ) ( not ( = ?auto_127360 ?auto_127366 ) ) ( not ( = ?auto_127360 ?auto_127367 ) ) ( not ( = ?auto_127361 ?auto_127362 ) ) ( not ( = ?auto_127361 ?auto_127363 ) ) ( not ( = ?auto_127361 ?auto_127364 ) ) ( not ( = ?auto_127361 ?auto_127365 ) ) ( not ( = ?auto_127361 ?auto_127366 ) ) ( not ( = ?auto_127361 ?auto_127367 ) ) ( not ( = ?auto_127362 ?auto_127363 ) ) ( not ( = ?auto_127362 ?auto_127364 ) ) ( not ( = ?auto_127362 ?auto_127365 ) ) ( not ( = ?auto_127362 ?auto_127366 ) ) ( not ( = ?auto_127362 ?auto_127367 ) ) ( not ( = ?auto_127363 ?auto_127364 ) ) ( not ( = ?auto_127363 ?auto_127365 ) ) ( not ( = ?auto_127363 ?auto_127366 ) ) ( not ( = ?auto_127363 ?auto_127367 ) ) ( not ( = ?auto_127364 ?auto_127365 ) ) ( not ( = ?auto_127364 ?auto_127366 ) ) ( not ( = ?auto_127364 ?auto_127367 ) ) ( not ( = ?auto_127365 ?auto_127366 ) ) ( not ( = ?auto_127365 ?auto_127367 ) ) ( not ( = ?auto_127366 ?auto_127367 ) ) ( ON ?auto_127365 ?auto_127366 ) ( ON ?auto_127364 ?auto_127365 ) ( ON ?auto_127363 ?auto_127364 ) ( ON ?auto_127362 ?auto_127363 ) ( CLEAR ?auto_127360 ) ( ON ?auto_127361 ?auto_127362 ) ( CLEAR ?auto_127361 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_127358 ?auto_127359 ?auto_127360 ?auto_127361 )
      ( MAKE-9PILE ?auto_127358 ?auto_127359 ?auto_127360 ?auto_127361 ?auto_127362 ?auto_127363 ?auto_127364 ?auto_127365 ?auto_127366 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_127377 - BLOCK
      ?auto_127378 - BLOCK
      ?auto_127379 - BLOCK
      ?auto_127380 - BLOCK
      ?auto_127381 - BLOCK
      ?auto_127382 - BLOCK
      ?auto_127383 - BLOCK
      ?auto_127384 - BLOCK
      ?auto_127385 - BLOCK
    )
    :vars
    (
      ?auto_127386 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127385 ?auto_127386 ) ( ON-TABLE ?auto_127377 ) ( ON ?auto_127378 ?auto_127377 ) ( not ( = ?auto_127377 ?auto_127378 ) ) ( not ( = ?auto_127377 ?auto_127379 ) ) ( not ( = ?auto_127377 ?auto_127380 ) ) ( not ( = ?auto_127377 ?auto_127381 ) ) ( not ( = ?auto_127377 ?auto_127382 ) ) ( not ( = ?auto_127377 ?auto_127383 ) ) ( not ( = ?auto_127377 ?auto_127384 ) ) ( not ( = ?auto_127377 ?auto_127385 ) ) ( not ( = ?auto_127377 ?auto_127386 ) ) ( not ( = ?auto_127378 ?auto_127379 ) ) ( not ( = ?auto_127378 ?auto_127380 ) ) ( not ( = ?auto_127378 ?auto_127381 ) ) ( not ( = ?auto_127378 ?auto_127382 ) ) ( not ( = ?auto_127378 ?auto_127383 ) ) ( not ( = ?auto_127378 ?auto_127384 ) ) ( not ( = ?auto_127378 ?auto_127385 ) ) ( not ( = ?auto_127378 ?auto_127386 ) ) ( not ( = ?auto_127379 ?auto_127380 ) ) ( not ( = ?auto_127379 ?auto_127381 ) ) ( not ( = ?auto_127379 ?auto_127382 ) ) ( not ( = ?auto_127379 ?auto_127383 ) ) ( not ( = ?auto_127379 ?auto_127384 ) ) ( not ( = ?auto_127379 ?auto_127385 ) ) ( not ( = ?auto_127379 ?auto_127386 ) ) ( not ( = ?auto_127380 ?auto_127381 ) ) ( not ( = ?auto_127380 ?auto_127382 ) ) ( not ( = ?auto_127380 ?auto_127383 ) ) ( not ( = ?auto_127380 ?auto_127384 ) ) ( not ( = ?auto_127380 ?auto_127385 ) ) ( not ( = ?auto_127380 ?auto_127386 ) ) ( not ( = ?auto_127381 ?auto_127382 ) ) ( not ( = ?auto_127381 ?auto_127383 ) ) ( not ( = ?auto_127381 ?auto_127384 ) ) ( not ( = ?auto_127381 ?auto_127385 ) ) ( not ( = ?auto_127381 ?auto_127386 ) ) ( not ( = ?auto_127382 ?auto_127383 ) ) ( not ( = ?auto_127382 ?auto_127384 ) ) ( not ( = ?auto_127382 ?auto_127385 ) ) ( not ( = ?auto_127382 ?auto_127386 ) ) ( not ( = ?auto_127383 ?auto_127384 ) ) ( not ( = ?auto_127383 ?auto_127385 ) ) ( not ( = ?auto_127383 ?auto_127386 ) ) ( not ( = ?auto_127384 ?auto_127385 ) ) ( not ( = ?auto_127384 ?auto_127386 ) ) ( not ( = ?auto_127385 ?auto_127386 ) ) ( ON ?auto_127384 ?auto_127385 ) ( ON ?auto_127383 ?auto_127384 ) ( ON ?auto_127382 ?auto_127383 ) ( ON ?auto_127381 ?auto_127382 ) ( ON ?auto_127380 ?auto_127381 ) ( CLEAR ?auto_127378 ) ( ON ?auto_127379 ?auto_127380 ) ( CLEAR ?auto_127379 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_127377 ?auto_127378 ?auto_127379 )
      ( MAKE-9PILE ?auto_127377 ?auto_127378 ?auto_127379 ?auto_127380 ?auto_127381 ?auto_127382 ?auto_127383 ?auto_127384 ?auto_127385 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_127396 - BLOCK
      ?auto_127397 - BLOCK
      ?auto_127398 - BLOCK
      ?auto_127399 - BLOCK
      ?auto_127400 - BLOCK
      ?auto_127401 - BLOCK
      ?auto_127402 - BLOCK
      ?auto_127403 - BLOCK
      ?auto_127404 - BLOCK
    )
    :vars
    (
      ?auto_127405 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127404 ?auto_127405 ) ( ON-TABLE ?auto_127396 ) ( ON ?auto_127397 ?auto_127396 ) ( not ( = ?auto_127396 ?auto_127397 ) ) ( not ( = ?auto_127396 ?auto_127398 ) ) ( not ( = ?auto_127396 ?auto_127399 ) ) ( not ( = ?auto_127396 ?auto_127400 ) ) ( not ( = ?auto_127396 ?auto_127401 ) ) ( not ( = ?auto_127396 ?auto_127402 ) ) ( not ( = ?auto_127396 ?auto_127403 ) ) ( not ( = ?auto_127396 ?auto_127404 ) ) ( not ( = ?auto_127396 ?auto_127405 ) ) ( not ( = ?auto_127397 ?auto_127398 ) ) ( not ( = ?auto_127397 ?auto_127399 ) ) ( not ( = ?auto_127397 ?auto_127400 ) ) ( not ( = ?auto_127397 ?auto_127401 ) ) ( not ( = ?auto_127397 ?auto_127402 ) ) ( not ( = ?auto_127397 ?auto_127403 ) ) ( not ( = ?auto_127397 ?auto_127404 ) ) ( not ( = ?auto_127397 ?auto_127405 ) ) ( not ( = ?auto_127398 ?auto_127399 ) ) ( not ( = ?auto_127398 ?auto_127400 ) ) ( not ( = ?auto_127398 ?auto_127401 ) ) ( not ( = ?auto_127398 ?auto_127402 ) ) ( not ( = ?auto_127398 ?auto_127403 ) ) ( not ( = ?auto_127398 ?auto_127404 ) ) ( not ( = ?auto_127398 ?auto_127405 ) ) ( not ( = ?auto_127399 ?auto_127400 ) ) ( not ( = ?auto_127399 ?auto_127401 ) ) ( not ( = ?auto_127399 ?auto_127402 ) ) ( not ( = ?auto_127399 ?auto_127403 ) ) ( not ( = ?auto_127399 ?auto_127404 ) ) ( not ( = ?auto_127399 ?auto_127405 ) ) ( not ( = ?auto_127400 ?auto_127401 ) ) ( not ( = ?auto_127400 ?auto_127402 ) ) ( not ( = ?auto_127400 ?auto_127403 ) ) ( not ( = ?auto_127400 ?auto_127404 ) ) ( not ( = ?auto_127400 ?auto_127405 ) ) ( not ( = ?auto_127401 ?auto_127402 ) ) ( not ( = ?auto_127401 ?auto_127403 ) ) ( not ( = ?auto_127401 ?auto_127404 ) ) ( not ( = ?auto_127401 ?auto_127405 ) ) ( not ( = ?auto_127402 ?auto_127403 ) ) ( not ( = ?auto_127402 ?auto_127404 ) ) ( not ( = ?auto_127402 ?auto_127405 ) ) ( not ( = ?auto_127403 ?auto_127404 ) ) ( not ( = ?auto_127403 ?auto_127405 ) ) ( not ( = ?auto_127404 ?auto_127405 ) ) ( ON ?auto_127403 ?auto_127404 ) ( ON ?auto_127402 ?auto_127403 ) ( ON ?auto_127401 ?auto_127402 ) ( ON ?auto_127400 ?auto_127401 ) ( ON ?auto_127399 ?auto_127400 ) ( CLEAR ?auto_127397 ) ( ON ?auto_127398 ?auto_127399 ) ( CLEAR ?auto_127398 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_127396 ?auto_127397 ?auto_127398 )
      ( MAKE-9PILE ?auto_127396 ?auto_127397 ?auto_127398 ?auto_127399 ?auto_127400 ?auto_127401 ?auto_127402 ?auto_127403 ?auto_127404 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_127415 - BLOCK
      ?auto_127416 - BLOCK
      ?auto_127417 - BLOCK
      ?auto_127418 - BLOCK
      ?auto_127419 - BLOCK
      ?auto_127420 - BLOCK
      ?auto_127421 - BLOCK
      ?auto_127422 - BLOCK
      ?auto_127423 - BLOCK
    )
    :vars
    (
      ?auto_127424 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127423 ?auto_127424 ) ( ON-TABLE ?auto_127415 ) ( not ( = ?auto_127415 ?auto_127416 ) ) ( not ( = ?auto_127415 ?auto_127417 ) ) ( not ( = ?auto_127415 ?auto_127418 ) ) ( not ( = ?auto_127415 ?auto_127419 ) ) ( not ( = ?auto_127415 ?auto_127420 ) ) ( not ( = ?auto_127415 ?auto_127421 ) ) ( not ( = ?auto_127415 ?auto_127422 ) ) ( not ( = ?auto_127415 ?auto_127423 ) ) ( not ( = ?auto_127415 ?auto_127424 ) ) ( not ( = ?auto_127416 ?auto_127417 ) ) ( not ( = ?auto_127416 ?auto_127418 ) ) ( not ( = ?auto_127416 ?auto_127419 ) ) ( not ( = ?auto_127416 ?auto_127420 ) ) ( not ( = ?auto_127416 ?auto_127421 ) ) ( not ( = ?auto_127416 ?auto_127422 ) ) ( not ( = ?auto_127416 ?auto_127423 ) ) ( not ( = ?auto_127416 ?auto_127424 ) ) ( not ( = ?auto_127417 ?auto_127418 ) ) ( not ( = ?auto_127417 ?auto_127419 ) ) ( not ( = ?auto_127417 ?auto_127420 ) ) ( not ( = ?auto_127417 ?auto_127421 ) ) ( not ( = ?auto_127417 ?auto_127422 ) ) ( not ( = ?auto_127417 ?auto_127423 ) ) ( not ( = ?auto_127417 ?auto_127424 ) ) ( not ( = ?auto_127418 ?auto_127419 ) ) ( not ( = ?auto_127418 ?auto_127420 ) ) ( not ( = ?auto_127418 ?auto_127421 ) ) ( not ( = ?auto_127418 ?auto_127422 ) ) ( not ( = ?auto_127418 ?auto_127423 ) ) ( not ( = ?auto_127418 ?auto_127424 ) ) ( not ( = ?auto_127419 ?auto_127420 ) ) ( not ( = ?auto_127419 ?auto_127421 ) ) ( not ( = ?auto_127419 ?auto_127422 ) ) ( not ( = ?auto_127419 ?auto_127423 ) ) ( not ( = ?auto_127419 ?auto_127424 ) ) ( not ( = ?auto_127420 ?auto_127421 ) ) ( not ( = ?auto_127420 ?auto_127422 ) ) ( not ( = ?auto_127420 ?auto_127423 ) ) ( not ( = ?auto_127420 ?auto_127424 ) ) ( not ( = ?auto_127421 ?auto_127422 ) ) ( not ( = ?auto_127421 ?auto_127423 ) ) ( not ( = ?auto_127421 ?auto_127424 ) ) ( not ( = ?auto_127422 ?auto_127423 ) ) ( not ( = ?auto_127422 ?auto_127424 ) ) ( not ( = ?auto_127423 ?auto_127424 ) ) ( ON ?auto_127422 ?auto_127423 ) ( ON ?auto_127421 ?auto_127422 ) ( ON ?auto_127420 ?auto_127421 ) ( ON ?auto_127419 ?auto_127420 ) ( ON ?auto_127418 ?auto_127419 ) ( ON ?auto_127417 ?auto_127418 ) ( CLEAR ?auto_127415 ) ( ON ?auto_127416 ?auto_127417 ) ( CLEAR ?auto_127416 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_127415 ?auto_127416 )
      ( MAKE-9PILE ?auto_127415 ?auto_127416 ?auto_127417 ?auto_127418 ?auto_127419 ?auto_127420 ?auto_127421 ?auto_127422 ?auto_127423 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_127434 - BLOCK
      ?auto_127435 - BLOCK
      ?auto_127436 - BLOCK
      ?auto_127437 - BLOCK
      ?auto_127438 - BLOCK
      ?auto_127439 - BLOCK
      ?auto_127440 - BLOCK
      ?auto_127441 - BLOCK
      ?auto_127442 - BLOCK
    )
    :vars
    (
      ?auto_127443 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127442 ?auto_127443 ) ( ON-TABLE ?auto_127434 ) ( not ( = ?auto_127434 ?auto_127435 ) ) ( not ( = ?auto_127434 ?auto_127436 ) ) ( not ( = ?auto_127434 ?auto_127437 ) ) ( not ( = ?auto_127434 ?auto_127438 ) ) ( not ( = ?auto_127434 ?auto_127439 ) ) ( not ( = ?auto_127434 ?auto_127440 ) ) ( not ( = ?auto_127434 ?auto_127441 ) ) ( not ( = ?auto_127434 ?auto_127442 ) ) ( not ( = ?auto_127434 ?auto_127443 ) ) ( not ( = ?auto_127435 ?auto_127436 ) ) ( not ( = ?auto_127435 ?auto_127437 ) ) ( not ( = ?auto_127435 ?auto_127438 ) ) ( not ( = ?auto_127435 ?auto_127439 ) ) ( not ( = ?auto_127435 ?auto_127440 ) ) ( not ( = ?auto_127435 ?auto_127441 ) ) ( not ( = ?auto_127435 ?auto_127442 ) ) ( not ( = ?auto_127435 ?auto_127443 ) ) ( not ( = ?auto_127436 ?auto_127437 ) ) ( not ( = ?auto_127436 ?auto_127438 ) ) ( not ( = ?auto_127436 ?auto_127439 ) ) ( not ( = ?auto_127436 ?auto_127440 ) ) ( not ( = ?auto_127436 ?auto_127441 ) ) ( not ( = ?auto_127436 ?auto_127442 ) ) ( not ( = ?auto_127436 ?auto_127443 ) ) ( not ( = ?auto_127437 ?auto_127438 ) ) ( not ( = ?auto_127437 ?auto_127439 ) ) ( not ( = ?auto_127437 ?auto_127440 ) ) ( not ( = ?auto_127437 ?auto_127441 ) ) ( not ( = ?auto_127437 ?auto_127442 ) ) ( not ( = ?auto_127437 ?auto_127443 ) ) ( not ( = ?auto_127438 ?auto_127439 ) ) ( not ( = ?auto_127438 ?auto_127440 ) ) ( not ( = ?auto_127438 ?auto_127441 ) ) ( not ( = ?auto_127438 ?auto_127442 ) ) ( not ( = ?auto_127438 ?auto_127443 ) ) ( not ( = ?auto_127439 ?auto_127440 ) ) ( not ( = ?auto_127439 ?auto_127441 ) ) ( not ( = ?auto_127439 ?auto_127442 ) ) ( not ( = ?auto_127439 ?auto_127443 ) ) ( not ( = ?auto_127440 ?auto_127441 ) ) ( not ( = ?auto_127440 ?auto_127442 ) ) ( not ( = ?auto_127440 ?auto_127443 ) ) ( not ( = ?auto_127441 ?auto_127442 ) ) ( not ( = ?auto_127441 ?auto_127443 ) ) ( not ( = ?auto_127442 ?auto_127443 ) ) ( ON ?auto_127441 ?auto_127442 ) ( ON ?auto_127440 ?auto_127441 ) ( ON ?auto_127439 ?auto_127440 ) ( ON ?auto_127438 ?auto_127439 ) ( ON ?auto_127437 ?auto_127438 ) ( ON ?auto_127436 ?auto_127437 ) ( CLEAR ?auto_127434 ) ( ON ?auto_127435 ?auto_127436 ) ( CLEAR ?auto_127435 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_127434 ?auto_127435 )
      ( MAKE-9PILE ?auto_127434 ?auto_127435 ?auto_127436 ?auto_127437 ?auto_127438 ?auto_127439 ?auto_127440 ?auto_127441 ?auto_127442 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_127453 - BLOCK
      ?auto_127454 - BLOCK
      ?auto_127455 - BLOCK
      ?auto_127456 - BLOCK
      ?auto_127457 - BLOCK
      ?auto_127458 - BLOCK
      ?auto_127459 - BLOCK
      ?auto_127460 - BLOCK
      ?auto_127461 - BLOCK
    )
    :vars
    (
      ?auto_127462 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127461 ?auto_127462 ) ( not ( = ?auto_127453 ?auto_127454 ) ) ( not ( = ?auto_127453 ?auto_127455 ) ) ( not ( = ?auto_127453 ?auto_127456 ) ) ( not ( = ?auto_127453 ?auto_127457 ) ) ( not ( = ?auto_127453 ?auto_127458 ) ) ( not ( = ?auto_127453 ?auto_127459 ) ) ( not ( = ?auto_127453 ?auto_127460 ) ) ( not ( = ?auto_127453 ?auto_127461 ) ) ( not ( = ?auto_127453 ?auto_127462 ) ) ( not ( = ?auto_127454 ?auto_127455 ) ) ( not ( = ?auto_127454 ?auto_127456 ) ) ( not ( = ?auto_127454 ?auto_127457 ) ) ( not ( = ?auto_127454 ?auto_127458 ) ) ( not ( = ?auto_127454 ?auto_127459 ) ) ( not ( = ?auto_127454 ?auto_127460 ) ) ( not ( = ?auto_127454 ?auto_127461 ) ) ( not ( = ?auto_127454 ?auto_127462 ) ) ( not ( = ?auto_127455 ?auto_127456 ) ) ( not ( = ?auto_127455 ?auto_127457 ) ) ( not ( = ?auto_127455 ?auto_127458 ) ) ( not ( = ?auto_127455 ?auto_127459 ) ) ( not ( = ?auto_127455 ?auto_127460 ) ) ( not ( = ?auto_127455 ?auto_127461 ) ) ( not ( = ?auto_127455 ?auto_127462 ) ) ( not ( = ?auto_127456 ?auto_127457 ) ) ( not ( = ?auto_127456 ?auto_127458 ) ) ( not ( = ?auto_127456 ?auto_127459 ) ) ( not ( = ?auto_127456 ?auto_127460 ) ) ( not ( = ?auto_127456 ?auto_127461 ) ) ( not ( = ?auto_127456 ?auto_127462 ) ) ( not ( = ?auto_127457 ?auto_127458 ) ) ( not ( = ?auto_127457 ?auto_127459 ) ) ( not ( = ?auto_127457 ?auto_127460 ) ) ( not ( = ?auto_127457 ?auto_127461 ) ) ( not ( = ?auto_127457 ?auto_127462 ) ) ( not ( = ?auto_127458 ?auto_127459 ) ) ( not ( = ?auto_127458 ?auto_127460 ) ) ( not ( = ?auto_127458 ?auto_127461 ) ) ( not ( = ?auto_127458 ?auto_127462 ) ) ( not ( = ?auto_127459 ?auto_127460 ) ) ( not ( = ?auto_127459 ?auto_127461 ) ) ( not ( = ?auto_127459 ?auto_127462 ) ) ( not ( = ?auto_127460 ?auto_127461 ) ) ( not ( = ?auto_127460 ?auto_127462 ) ) ( not ( = ?auto_127461 ?auto_127462 ) ) ( ON ?auto_127460 ?auto_127461 ) ( ON ?auto_127459 ?auto_127460 ) ( ON ?auto_127458 ?auto_127459 ) ( ON ?auto_127457 ?auto_127458 ) ( ON ?auto_127456 ?auto_127457 ) ( ON ?auto_127455 ?auto_127456 ) ( ON ?auto_127454 ?auto_127455 ) ( ON ?auto_127453 ?auto_127454 ) ( CLEAR ?auto_127453 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_127453 )
      ( MAKE-9PILE ?auto_127453 ?auto_127454 ?auto_127455 ?auto_127456 ?auto_127457 ?auto_127458 ?auto_127459 ?auto_127460 ?auto_127461 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_127472 - BLOCK
      ?auto_127473 - BLOCK
      ?auto_127474 - BLOCK
      ?auto_127475 - BLOCK
      ?auto_127476 - BLOCK
      ?auto_127477 - BLOCK
      ?auto_127478 - BLOCK
      ?auto_127479 - BLOCK
      ?auto_127480 - BLOCK
    )
    :vars
    (
      ?auto_127481 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127480 ?auto_127481 ) ( not ( = ?auto_127472 ?auto_127473 ) ) ( not ( = ?auto_127472 ?auto_127474 ) ) ( not ( = ?auto_127472 ?auto_127475 ) ) ( not ( = ?auto_127472 ?auto_127476 ) ) ( not ( = ?auto_127472 ?auto_127477 ) ) ( not ( = ?auto_127472 ?auto_127478 ) ) ( not ( = ?auto_127472 ?auto_127479 ) ) ( not ( = ?auto_127472 ?auto_127480 ) ) ( not ( = ?auto_127472 ?auto_127481 ) ) ( not ( = ?auto_127473 ?auto_127474 ) ) ( not ( = ?auto_127473 ?auto_127475 ) ) ( not ( = ?auto_127473 ?auto_127476 ) ) ( not ( = ?auto_127473 ?auto_127477 ) ) ( not ( = ?auto_127473 ?auto_127478 ) ) ( not ( = ?auto_127473 ?auto_127479 ) ) ( not ( = ?auto_127473 ?auto_127480 ) ) ( not ( = ?auto_127473 ?auto_127481 ) ) ( not ( = ?auto_127474 ?auto_127475 ) ) ( not ( = ?auto_127474 ?auto_127476 ) ) ( not ( = ?auto_127474 ?auto_127477 ) ) ( not ( = ?auto_127474 ?auto_127478 ) ) ( not ( = ?auto_127474 ?auto_127479 ) ) ( not ( = ?auto_127474 ?auto_127480 ) ) ( not ( = ?auto_127474 ?auto_127481 ) ) ( not ( = ?auto_127475 ?auto_127476 ) ) ( not ( = ?auto_127475 ?auto_127477 ) ) ( not ( = ?auto_127475 ?auto_127478 ) ) ( not ( = ?auto_127475 ?auto_127479 ) ) ( not ( = ?auto_127475 ?auto_127480 ) ) ( not ( = ?auto_127475 ?auto_127481 ) ) ( not ( = ?auto_127476 ?auto_127477 ) ) ( not ( = ?auto_127476 ?auto_127478 ) ) ( not ( = ?auto_127476 ?auto_127479 ) ) ( not ( = ?auto_127476 ?auto_127480 ) ) ( not ( = ?auto_127476 ?auto_127481 ) ) ( not ( = ?auto_127477 ?auto_127478 ) ) ( not ( = ?auto_127477 ?auto_127479 ) ) ( not ( = ?auto_127477 ?auto_127480 ) ) ( not ( = ?auto_127477 ?auto_127481 ) ) ( not ( = ?auto_127478 ?auto_127479 ) ) ( not ( = ?auto_127478 ?auto_127480 ) ) ( not ( = ?auto_127478 ?auto_127481 ) ) ( not ( = ?auto_127479 ?auto_127480 ) ) ( not ( = ?auto_127479 ?auto_127481 ) ) ( not ( = ?auto_127480 ?auto_127481 ) ) ( ON ?auto_127479 ?auto_127480 ) ( ON ?auto_127478 ?auto_127479 ) ( ON ?auto_127477 ?auto_127478 ) ( ON ?auto_127476 ?auto_127477 ) ( ON ?auto_127475 ?auto_127476 ) ( ON ?auto_127474 ?auto_127475 ) ( ON ?auto_127473 ?auto_127474 ) ( ON ?auto_127472 ?auto_127473 ) ( CLEAR ?auto_127472 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_127472 )
      ( MAKE-9PILE ?auto_127472 ?auto_127473 ?auto_127474 ?auto_127475 ?auto_127476 ?auto_127477 ?auto_127478 ?auto_127479 ?auto_127480 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_127492 - BLOCK
      ?auto_127493 - BLOCK
      ?auto_127494 - BLOCK
      ?auto_127495 - BLOCK
      ?auto_127496 - BLOCK
      ?auto_127497 - BLOCK
      ?auto_127498 - BLOCK
      ?auto_127499 - BLOCK
      ?auto_127500 - BLOCK
      ?auto_127501 - BLOCK
    )
    :vars
    (
      ?auto_127502 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_127500 ) ( ON ?auto_127501 ?auto_127502 ) ( CLEAR ?auto_127501 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_127492 ) ( ON ?auto_127493 ?auto_127492 ) ( ON ?auto_127494 ?auto_127493 ) ( ON ?auto_127495 ?auto_127494 ) ( ON ?auto_127496 ?auto_127495 ) ( ON ?auto_127497 ?auto_127496 ) ( ON ?auto_127498 ?auto_127497 ) ( ON ?auto_127499 ?auto_127498 ) ( ON ?auto_127500 ?auto_127499 ) ( not ( = ?auto_127492 ?auto_127493 ) ) ( not ( = ?auto_127492 ?auto_127494 ) ) ( not ( = ?auto_127492 ?auto_127495 ) ) ( not ( = ?auto_127492 ?auto_127496 ) ) ( not ( = ?auto_127492 ?auto_127497 ) ) ( not ( = ?auto_127492 ?auto_127498 ) ) ( not ( = ?auto_127492 ?auto_127499 ) ) ( not ( = ?auto_127492 ?auto_127500 ) ) ( not ( = ?auto_127492 ?auto_127501 ) ) ( not ( = ?auto_127492 ?auto_127502 ) ) ( not ( = ?auto_127493 ?auto_127494 ) ) ( not ( = ?auto_127493 ?auto_127495 ) ) ( not ( = ?auto_127493 ?auto_127496 ) ) ( not ( = ?auto_127493 ?auto_127497 ) ) ( not ( = ?auto_127493 ?auto_127498 ) ) ( not ( = ?auto_127493 ?auto_127499 ) ) ( not ( = ?auto_127493 ?auto_127500 ) ) ( not ( = ?auto_127493 ?auto_127501 ) ) ( not ( = ?auto_127493 ?auto_127502 ) ) ( not ( = ?auto_127494 ?auto_127495 ) ) ( not ( = ?auto_127494 ?auto_127496 ) ) ( not ( = ?auto_127494 ?auto_127497 ) ) ( not ( = ?auto_127494 ?auto_127498 ) ) ( not ( = ?auto_127494 ?auto_127499 ) ) ( not ( = ?auto_127494 ?auto_127500 ) ) ( not ( = ?auto_127494 ?auto_127501 ) ) ( not ( = ?auto_127494 ?auto_127502 ) ) ( not ( = ?auto_127495 ?auto_127496 ) ) ( not ( = ?auto_127495 ?auto_127497 ) ) ( not ( = ?auto_127495 ?auto_127498 ) ) ( not ( = ?auto_127495 ?auto_127499 ) ) ( not ( = ?auto_127495 ?auto_127500 ) ) ( not ( = ?auto_127495 ?auto_127501 ) ) ( not ( = ?auto_127495 ?auto_127502 ) ) ( not ( = ?auto_127496 ?auto_127497 ) ) ( not ( = ?auto_127496 ?auto_127498 ) ) ( not ( = ?auto_127496 ?auto_127499 ) ) ( not ( = ?auto_127496 ?auto_127500 ) ) ( not ( = ?auto_127496 ?auto_127501 ) ) ( not ( = ?auto_127496 ?auto_127502 ) ) ( not ( = ?auto_127497 ?auto_127498 ) ) ( not ( = ?auto_127497 ?auto_127499 ) ) ( not ( = ?auto_127497 ?auto_127500 ) ) ( not ( = ?auto_127497 ?auto_127501 ) ) ( not ( = ?auto_127497 ?auto_127502 ) ) ( not ( = ?auto_127498 ?auto_127499 ) ) ( not ( = ?auto_127498 ?auto_127500 ) ) ( not ( = ?auto_127498 ?auto_127501 ) ) ( not ( = ?auto_127498 ?auto_127502 ) ) ( not ( = ?auto_127499 ?auto_127500 ) ) ( not ( = ?auto_127499 ?auto_127501 ) ) ( not ( = ?auto_127499 ?auto_127502 ) ) ( not ( = ?auto_127500 ?auto_127501 ) ) ( not ( = ?auto_127500 ?auto_127502 ) ) ( not ( = ?auto_127501 ?auto_127502 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_127501 ?auto_127502 )
      ( !STACK ?auto_127501 ?auto_127500 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_127513 - BLOCK
      ?auto_127514 - BLOCK
      ?auto_127515 - BLOCK
      ?auto_127516 - BLOCK
      ?auto_127517 - BLOCK
      ?auto_127518 - BLOCK
      ?auto_127519 - BLOCK
      ?auto_127520 - BLOCK
      ?auto_127521 - BLOCK
      ?auto_127522 - BLOCK
    )
    :vars
    (
      ?auto_127523 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_127521 ) ( ON ?auto_127522 ?auto_127523 ) ( CLEAR ?auto_127522 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_127513 ) ( ON ?auto_127514 ?auto_127513 ) ( ON ?auto_127515 ?auto_127514 ) ( ON ?auto_127516 ?auto_127515 ) ( ON ?auto_127517 ?auto_127516 ) ( ON ?auto_127518 ?auto_127517 ) ( ON ?auto_127519 ?auto_127518 ) ( ON ?auto_127520 ?auto_127519 ) ( ON ?auto_127521 ?auto_127520 ) ( not ( = ?auto_127513 ?auto_127514 ) ) ( not ( = ?auto_127513 ?auto_127515 ) ) ( not ( = ?auto_127513 ?auto_127516 ) ) ( not ( = ?auto_127513 ?auto_127517 ) ) ( not ( = ?auto_127513 ?auto_127518 ) ) ( not ( = ?auto_127513 ?auto_127519 ) ) ( not ( = ?auto_127513 ?auto_127520 ) ) ( not ( = ?auto_127513 ?auto_127521 ) ) ( not ( = ?auto_127513 ?auto_127522 ) ) ( not ( = ?auto_127513 ?auto_127523 ) ) ( not ( = ?auto_127514 ?auto_127515 ) ) ( not ( = ?auto_127514 ?auto_127516 ) ) ( not ( = ?auto_127514 ?auto_127517 ) ) ( not ( = ?auto_127514 ?auto_127518 ) ) ( not ( = ?auto_127514 ?auto_127519 ) ) ( not ( = ?auto_127514 ?auto_127520 ) ) ( not ( = ?auto_127514 ?auto_127521 ) ) ( not ( = ?auto_127514 ?auto_127522 ) ) ( not ( = ?auto_127514 ?auto_127523 ) ) ( not ( = ?auto_127515 ?auto_127516 ) ) ( not ( = ?auto_127515 ?auto_127517 ) ) ( not ( = ?auto_127515 ?auto_127518 ) ) ( not ( = ?auto_127515 ?auto_127519 ) ) ( not ( = ?auto_127515 ?auto_127520 ) ) ( not ( = ?auto_127515 ?auto_127521 ) ) ( not ( = ?auto_127515 ?auto_127522 ) ) ( not ( = ?auto_127515 ?auto_127523 ) ) ( not ( = ?auto_127516 ?auto_127517 ) ) ( not ( = ?auto_127516 ?auto_127518 ) ) ( not ( = ?auto_127516 ?auto_127519 ) ) ( not ( = ?auto_127516 ?auto_127520 ) ) ( not ( = ?auto_127516 ?auto_127521 ) ) ( not ( = ?auto_127516 ?auto_127522 ) ) ( not ( = ?auto_127516 ?auto_127523 ) ) ( not ( = ?auto_127517 ?auto_127518 ) ) ( not ( = ?auto_127517 ?auto_127519 ) ) ( not ( = ?auto_127517 ?auto_127520 ) ) ( not ( = ?auto_127517 ?auto_127521 ) ) ( not ( = ?auto_127517 ?auto_127522 ) ) ( not ( = ?auto_127517 ?auto_127523 ) ) ( not ( = ?auto_127518 ?auto_127519 ) ) ( not ( = ?auto_127518 ?auto_127520 ) ) ( not ( = ?auto_127518 ?auto_127521 ) ) ( not ( = ?auto_127518 ?auto_127522 ) ) ( not ( = ?auto_127518 ?auto_127523 ) ) ( not ( = ?auto_127519 ?auto_127520 ) ) ( not ( = ?auto_127519 ?auto_127521 ) ) ( not ( = ?auto_127519 ?auto_127522 ) ) ( not ( = ?auto_127519 ?auto_127523 ) ) ( not ( = ?auto_127520 ?auto_127521 ) ) ( not ( = ?auto_127520 ?auto_127522 ) ) ( not ( = ?auto_127520 ?auto_127523 ) ) ( not ( = ?auto_127521 ?auto_127522 ) ) ( not ( = ?auto_127521 ?auto_127523 ) ) ( not ( = ?auto_127522 ?auto_127523 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_127522 ?auto_127523 )
      ( !STACK ?auto_127522 ?auto_127521 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_127534 - BLOCK
      ?auto_127535 - BLOCK
      ?auto_127536 - BLOCK
      ?auto_127537 - BLOCK
      ?auto_127538 - BLOCK
      ?auto_127539 - BLOCK
      ?auto_127540 - BLOCK
      ?auto_127541 - BLOCK
      ?auto_127542 - BLOCK
      ?auto_127543 - BLOCK
    )
    :vars
    (
      ?auto_127544 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127543 ?auto_127544 ) ( ON-TABLE ?auto_127534 ) ( ON ?auto_127535 ?auto_127534 ) ( ON ?auto_127536 ?auto_127535 ) ( ON ?auto_127537 ?auto_127536 ) ( ON ?auto_127538 ?auto_127537 ) ( ON ?auto_127539 ?auto_127538 ) ( ON ?auto_127540 ?auto_127539 ) ( ON ?auto_127541 ?auto_127540 ) ( not ( = ?auto_127534 ?auto_127535 ) ) ( not ( = ?auto_127534 ?auto_127536 ) ) ( not ( = ?auto_127534 ?auto_127537 ) ) ( not ( = ?auto_127534 ?auto_127538 ) ) ( not ( = ?auto_127534 ?auto_127539 ) ) ( not ( = ?auto_127534 ?auto_127540 ) ) ( not ( = ?auto_127534 ?auto_127541 ) ) ( not ( = ?auto_127534 ?auto_127542 ) ) ( not ( = ?auto_127534 ?auto_127543 ) ) ( not ( = ?auto_127534 ?auto_127544 ) ) ( not ( = ?auto_127535 ?auto_127536 ) ) ( not ( = ?auto_127535 ?auto_127537 ) ) ( not ( = ?auto_127535 ?auto_127538 ) ) ( not ( = ?auto_127535 ?auto_127539 ) ) ( not ( = ?auto_127535 ?auto_127540 ) ) ( not ( = ?auto_127535 ?auto_127541 ) ) ( not ( = ?auto_127535 ?auto_127542 ) ) ( not ( = ?auto_127535 ?auto_127543 ) ) ( not ( = ?auto_127535 ?auto_127544 ) ) ( not ( = ?auto_127536 ?auto_127537 ) ) ( not ( = ?auto_127536 ?auto_127538 ) ) ( not ( = ?auto_127536 ?auto_127539 ) ) ( not ( = ?auto_127536 ?auto_127540 ) ) ( not ( = ?auto_127536 ?auto_127541 ) ) ( not ( = ?auto_127536 ?auto_127542 ) ) ( not ( = ?auto_127536 ?auto_127543 ) ) ( not ( = ?auto_127536 ?auto_127544 ) ) ( not ( = ?auto_127537 ?auto_127538 ) ) ( not ( = ?auto_127537 ?auto_127539 ) ) ( not ( = ?auto_127537 ?auto_127540 ) ) ( not ( = ?auto_127537 ?auto_127541 ) ) ( not ( = ?auto_127537 ?auto_127542 ) ) ( not ( = ?auto_127537 ?auto_127543 ) ) ( not ( = ?auto_127537 ?auto_127544 ) ) ( not ( = ?auto_127538 ?auto_127539 ) ) ( not ( = ?auto_127538 ?auto_127540 ) ) ( not ( = ?auto_127538 ?auto_127541 ) ) ( not ( = ?auto_127538 ?auto_127542 ) ) ( not ( = ?auto_127538 ?auto_127543 ) ) ( not ( = ?auto_127538 ?auto_127544 ) ) ( not ( = ?auto_127539 ?auto_127540 ) ) ( not ( = ?auto_127539 ?auto_127541 ) ) ( not ( = ?auto_127539 ?auto_127542 ) ) ( not ( = ?auto_127539 ?auto_127543 ) ) ( not ( = ?auto_127539 ?auto_127544 ) ) ( not ( = ?auto_127540 ?auto_127541 ) ) ( not ( = ?auto_127540 ?auto_127542 ) ) ( not ( = ?auto_127540 ?auto_127543 ) ) ( not ( = ?auto_127540 ?auto_127544 ) ) ( not ( = ?auto_127541 ?auto_127542 ) ) ( not ( = ?auto_127541 ?auto_127543 ) ) ( not ( = ?auto_127541 ?auto_127544 ) ) ( not ( = ?auto_127542 ?auto_127543 ) ) ( not ( = ?auto_127542 ?auto_127544 ) ) ( not ( = ?auto_127543 ?auto_127544 ) ) ( CLEAR ?auto_127541 ) ( ON ?auto_127542 ?auto_127543 ) ( CLEAR ?auto_127542 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_127534 ?auto_127535 ?auto_127536 ?auto_127537 ?auto_127538 ?auto_127539 ?auto_127540 ?auto_127541 ?auto_127542 )
      ( MAKE-10PILE ?auto_127534 ?auto_127535 ?auto_127536 ?auto_127537 ?auto_127538 ?auto_127539 ?auto_127540 ?auto_127541 ?auto_127542 ?auto_127543 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_127555 - BLOCK
      ?auto_127556 - BLOCK
      ?auto_127557 - BLOCK
      ?auto_127558 - BLOCK
      ?auto_127559 - BLOCK
      ?auto_127560 - BLOCK
      ?auto_127561 - BLOCK
      ?auto_127562 - BLOCK
      ?auto_127563 - BLOCK
      ?auto_127564 - BLOCK
    )
    :vars
    (
      ?auto_127565 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127564 ?auto_127565 ) ( ON-TABLE ?auto_127555 ) ( ON ?auto_127556 ?auto_127555 ) ( ON ?auto_127557 ?auto_127556 ) ( ON ?auto_127558 ?auto_127557 ) ( ON ?auto_127559 ?auto_127558 ) ( ON ?auto_127560 ?auto_127559 ) ( ON ?auto_127561 ?auto_127560 ) ( ON ?auto_127562 ?auto_127561 ) ( not ( = ?auto_127555 ?auto_127556 ) ) ( not ( = ?auto_127555 ?auto_127557 ) ) ( not ( = ?auto_127555 ?auto_127558 ) ) ( not ( = ?auto_127555 ?auto_127559 ) ) ( not ( = ?auto_127555 ?auto_127560 ) ) ( not ( = ?auto_127555 ?auto_127561 ) ) ( not ( = ?auto_127555 ?auto_127562 ) ) ( not ( = ?auto_127555 ?auto_127563 ) ) ( not ( = ?auto_127555 ?auto_127564 ) ) ( not ( = ?auto_127555 ?auto_127565 ) ) ( not ( = ?auto_127556 ?auto_127557 ) ) ( not ( = ?auto_127556 ?auto_127558 ) ) ( not ( = ?auto_127556 ?auto_127559 ) ) ( not ( = ?auto_127556 ?auto_127560 ) ) ( not ( = ?auto_127556 ?auto_127561 ) ) ( not ( = ?auto_127556 ?auto_127562 ) ) ( not ( = ?auto_127556 ?auto_127563 ) ) ( not ( = ?auto_127556 ?auto_127564 ) ) ( not ( = ?auto_127556 ?auto_127565 ) ) ( not ( = ?auto_127557 ?auto_127558 ) ) ( not ( = ?auto_127557 ?auto_127559 ) ) ( not ( = ?auto_127557 ?auto_127560 ) ) ( not ( = ?auto_127557 ?auto_127561 ) ) ( not ( = ?auto_127557 ?auto_127562 ) ) ( not ( = ?auto_127557 ?auto_127563 ) ) ( not ( = ?auto_127557 ?auto_127564 ) ) ( not ( = ?auto_127557 ?auto_127565 ) ) ( not ( = ?auto_127558 ?auto_127559 ) ) ( not ( = ?auto_127558 ?auto_127560 ) ) ( not ( = ?auto_127558 ?auto_127561 ) ) ( not ( = ?auto_127558 ?auto_127562 ) ) ( not ( = ?auto_127558 ?auto_127563 ) ) ( not ( = ?auto_127558 ?auto_127564 ) ) ( not ( = ?auto_127558 ?auto_127565 ) ) ( not ( = ?auto_127559 ?auto_127560 ) ) ( not ( = ?auto_127559 ?auto_127561 ) ) ( not ( = ?auto_127559 ?auto_127562 ) ) ( not ( = ?auto_127559 ?auto_127563 ) ) ( not ( = ?auto_127559 ?auto_127564 ) ) ( not ( = ?auto_127559 ?auto_127565 ) ) ( not ( = ?auto_127560 ?auto_127561 ) ) ( not ( = ?auto_127560 ?auto_127562 ) ) ( not ( = ?auto_127560 ?auto_127563 ) ) ( not ( = ?auto_127560 ?auto_127564 ) ) ( not ( = ?auto_127560 ?auto_127565 ) ) ( not ( = ?auto_127561 ?auto_127562 ) ) ( not ( = ?auto_127561 ?auto_127563 ) ) ( not ( = ?auto_127561 ?auto_127564 ) ) ( not ( = ?auto_127561 ?auto_127565 ) ) ( not ( = ?auto_127562 ?auto_127563 ) ) ( not ( = ?auto_127562 ?auto_127564 ) ) ( not ( = ?auto_127562 ?auto_127565 ) ) ( not ( = ?auto_127563 ?auto_127564 ) ) ( not ( = ?auto_127563 ?auto_127565 ) ) ( not ( = ?auto_127564 ?auto_127565 ) ) ( CLEAR ?auto_127562 ) ( ON ?auto_127563 ?auto_127564 ) ( CLEAR ?auto_127563 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_127555 ?auto_127556 ?auto_127557 ?auto_127558 ?auto_127559 ?auto_127560 ?auto_127561 ?auto_127562 ?auto_127563 )
      ( MAKE-10PILE ?auto_127555 ?auto_127556 ?auto_127557 ?auto_127558 ?auto_127559 ?auto_127560 ?auto_127561 ?auto_127562 ?auto_127563 ?auto_127564 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_127576 - BLOCK
      ?auto_127577 - BLOCK
      ?auto_127578 - BLOCK
      ?auto_127579 - BLOCK
      ?auto_127580 - BLOCK
      ?auto_127581 - BLOCK
      ?auto_127582 - BLOCK
      ?auto_127583 - BLOCK
      ?auto_127584 - BLOCK
      ?auto_127585 - BLOCK
    )
    :vars
    (
      ?auto_127586 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127585 ?auto_127586 ) ( ON-TABLE ?auto_127576 ) ( ON ?auto_127577 ?auto_127576 ) ( ON ?auto_127578 ?auto_127577 ) ( ON ?auto_127579 ?auto_127578 ) ( ON ?auto_127580 ?auto_127579 ) ( ON ?auto_127581 ?auto_127580 ) ( ON ?auto_127582 ?auto_127581 ) ( not ( = ?auto_127576 ?auto_127577 ) ) ( not ( = ?auto_127576 ?auto_127578 ) ) ( not ( = ?auto_127576 ?auto_127579 ) ) ( not ( = ?auto_127576 ?auto_127580 ) ) ( not ( = ?auto_127576 ?auto_127581 ) ) ( not ( = ?auto_127576 ?auto_127582 ) ) ( not ( = ?auto_127576 ?auto_127583 ) ) ( not ( = ?auto_127576 ?auto_127584 ) ) ( not ( = ?auto_127576 ?auto_127585 ) ) ( not ( = ?auto_127576 ?auto_127586 ) ) ( not ( = ?auto_127577 ?auto_127578 ) ) ( not ( = ?auto_127577 ?auto_127579 ) ) ( not ( = ?auto_127577 ?auto_127580 ) ) ( not ( = ?auto_127577 ?auto_127581 ) ) ( not ( = ?auto_127577 ?auto_127582 ) ) ( not ( = ?auto_127577 ?auto_127583 ) ) ( not ( = ?auto_127577 ?auto_127584 ) ) ( not ( = ?auto_127577 ?auto_127585 ) ) ( not ( = ?auto_127577 ?auto_127586 ) ) ( not ( = ?auto_127578 ?auto_127579 ) ) ( not ( = ?auto_127578 ?auto_127580 ) ) ( not ( = ?auto_127578 ?auto_127581 ) ) ( not ( = ?auto_127578 ?auto_127582 ) ) ( not ( = ?auto_127578 ?auto_127583 ) ) ( not ( = ?auto_127578 ?auto_127584 ) ) ( not ( = ?auto_127578 ?auto_127585 ) ) ( not ( = ?auto_127578 ?auto_127586 ) ) ( not ( = ?auto_127579 ?auto_127580 ) ) ( not ( = ?auto_127579 ?auto_127581 ) ) ( not ( = ?auto_127579 ?auto_127582 ) ) ( not ( = ?auto_127579 ?auto_127583 ) ) ( not ( = ?auto_127579 ?auto_127584 ) ) ( not ( = ?auto_127579 ?auto_127585 ) ) ( not ( = ?auto_127579 ?auto_127586 ) ) ( not ( = ?auto_127580 ?auto_127581 ) ) ( not ( = ?auto_127580 ?auto_127582 ) ) ( not ( = ?auto_127580 ?auto_127583 ) ) ( not ( = ?auto_127580 ?auto_127584 ) ) ( not ( = ?auto_127580 ?auto_127585 ) ) ( not ( = ?auto_127580 ?auto_127586 ) ) ( not ( = ?auto_127581 ?auto_127582 ) ) ( not ( = ?auto_127581 ?auto_127583 ) ) ( not ( = ?auto_127581 ?auto_127584 ) ) ( not ( = ?auto_127581 ?auto_127585 ) ) ( not ( = ?auto_127581 ?auto_127586 ) ) ( not ( = ?auto_127582 ?auto_127583 ) ) ( not ( = ?auto_127582 ?auto_127584 ) ) ( not ( = ?auto_127582 ?auto_127585 ) ) ( not ( = ?auto_127582 ?auto_127586 ) ) ( not ( = ?auto_127583 ?auto_127584 ) ) ( not ( = ?auto_127583 ?auto_127585 ) ) ( not ( = ?auto_127583 ?auto_127586 ) ) ( not ( = ?auto_127584 ?auto_127585 ) ) ( not ( = ?auto_127584 ?auto_127586 ) ) ( not ( = ?auto_127585 ?auto_127586 ) ) ( ON ?auto_127584 ?auto_127585 ) ( CLEAR ?auto_127582 ) ( ON ?auto_127583 ?auto_127584 ) ( CLEAR ?auto_127583 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_127576 ?auto_127577 ?auto_127578 ?auto_127579 ?auto_127580 ?auto_127581 ?auto_127582 ?auto_127583 )
      ( MAKE-10PILE ?auto_127576 ?auto_127577 ?auto_127578 ?auto_127579 ?auto_127580 ?auto_127581 ?auto_127582 ?auto_127583 ?auto_127584 ?auto_127585 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_127597 - BLOCK
      ?auto_127598 - BLOCK
      ?auto_127599 - BLOCK
      ?auto_127600 - BLOCK
      ?auto_127601 - BLOCK
      ?auto_127602 - BLOCK
      ?auto_127603 - BLOCK
      ?auto_127604 - BLOCK
      ?auto_127605 - BLOCK
      ?auto_127606 - BLOCK
    )
    :vars
    (
      ?auto_127607 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127606 ?auto_127607 ) ( ON-TABLE ?auto_127597 ) ( ON ?auto_127598 ?auto_127597 ) ( ON ?auto_127599 ?auto_127598 ) ( ON ?auto_127600 ?auto_127599 ) ( ON ?auto_127601 ?auto_127600 ) ( ON ?auto_127602 ?auto_127601 ) ( ON ?auto_127603 ?auto_127602 ) ( not ( = ?auto_127597 ?auto_127598 ) ) ( not ( = ?auto_127597 ?auto_127599 ) ) ( not ( = ?auto_127597 ?auto_127600 ) ) ( not ( = ?auto_127597 ?auto_127601 ) ) ( not ( = ?auto_127597 ?auto_127602 ) ) ( not ( = ?auto_127597 ?auto_127603 ) ) ( not ( = ?auto_127597 ?auto_127604 ) ) ( not ( = ?auto_127597 ?auto_127605 ) ) ( not ( = ?auto_127597 ?auto_127606 ) ) ( not ( = ?auto_127597 ?auto_127607 ) ) ( not ( = ?auto_127598 ?auto_127599 ) ) ( not ( = ?auto_127598 ?auto_127600 ) ) ( not ( = ?auto_127598 ?auto_127601 ) ) ( not ( = ?auto_127598 ?auto_127602 ) ) ( not ( = ?auto_127598 ?auto_127603 ) ) ( not ( = ?auto_127598 ?auto_127604 ) ) ( not ( = ?auto_127598 ?auto_127605 ) ) ( not ( = ?auto_127598 ?auto_127606 ) ) ( not ( = ?auto_127598 ?auto_127607 ) ) ( not ( = ?auto_127599 ?auto_127600 ) ) ( not ( = ?auto_127599 ?auto_127601 ) ) ( not ( = ?auto_127599 ?auto_127602 ) ) ( not ( = ?auto_127599 ?auto_127603 ) ) ( not ( = ?auto_127599 ?auto_127604 ) ) ( not ( = ?auto_127599 ?auto_127605 ) ) ( not ( = ?auto_127599 ?auto_127606 ) ) ( not ( = ?auto_127599 ?auto_127607 ) ) ( not ( = ?auto_127600 ?auto_127601 ) ) ( not ( = ?auto_127600 ?auto_127602 ) ) ( not ( = ?auto_127600 ?auto_127603 ) ) ( not ( = ?auto_127600 ?auto_127604 ) ) ( not ( = ?auto_127600 ?auto_127605 ) ) ( not ( = ?auto_127600 ?auto_127606 ) ) ( not ( = ?auto_127600 ?auto_127607 ) ) ( not ( = ?auto_127601 ?auto_127602 ) ) ( not ( = ?auto_127601 ?auto_127603 ) ) ( not ( = ?auto_127601 ?auto_127604 ) ) ( not ( = ?auto_127601 ?auto_127605 ) ) ( not ( = ?auto_127601 ?auto_127606 ) ) ( not ( = ?auto_127601 ?auto_127607 ) ) ( not ( = ?auto_127602 ?auto_127603 ) ) ( not ( = ?auto_127602 ?auto_127604 ) ) ( not ( = ?auto_127602 ?auto_127605 ) ) ( not ( = ?auto_127602 ?auto_127606 ) ) ( not ( = ?auto_127602 ?auto_127607 ) ) ( not ( = ?auto_127603 ?auto_127604 ) ) ( not ( = ?auto_127603 ?auto_127605 ) ) ( not ( = ?auto_127603 ?auto_127606 ) ) ( not ( = ?auto_127603 ?auto_127607 ) ) ( not ( = ?auto_127604 ?auto_127605 ) ) ( not ( = ?auto_127604 ?auto_127606 ) ) ( not ( = ?auto_127604 ?auto_127607 ) ) ( not ( = ?auto_127605 ?auto_127606 ) ) ( not ( = ?auto_127605 ?auto_127607 ) ) ( not ( = ?auto_127606 ?auto_127607 ) ) ( ON ?auto_127605 ?auto_127606 ) ( CLEAR ?auto_127603 ) ( ON ?auto_127604 ?auto_127605 ) ( CLEAR ?auto_127604 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_127597 ?auto_127598 ?auto_127599 ?auto_127600 ?auto_127601 ?auto_127602 ?auto_127603 ?auto_127604 )
      ( MAKE-10PILE ?auto_127597 ?auto_127598 ?auto_127599 ?auto_127600 ?auto_127601 ?auto_127602 ?auto_127603 ?auto_127604 ?auto_127605 ?auto_127606 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_127618 - BLOCK
      ?auto_127619 - BLOCK
      ?auto_127620 - BLOCK
      ?auto_127621 - BLOCK
      ?auto_127622 - BLOCK
      ?auto_127623 - BLOCK
      ?auto_127624 - BLOCK
      ?auto_127625 - BLOCK
      ?auto_127626 - BLOCK
      ?auto_127627 - BLOCK
    )
    :vars
    (
      ?auto_127628 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127627 ?auto_127628 ) ( ON-TABLE ?auto_127618 ) ( ON ?auto_127619 ?auto_127618 ) ( ON ?auto_127620 ?auto_127619 ) ( ON ?auto_127621 ?auto_127620 ) ( ON ?auto_127622 ?auto_127621 ) ( ON ?auto_127623 ?auto_127622 ) ( not ( = ?auto_127618 ?auto_127619 ) ) ( not ( = ?auto_127618 ?auto_127620 ) ) ( not ( = ?auto_127618 ?auto_127621 ) ) ( not ( = ?auto_127618 ?auto_127622 ) ) ( not ( = ?auto_127618 ?auto_127623 ) ) ( not ( = ?auto_127618 ?auto_127624 ) ) ( not ( = ?auto_127618 ?auto_127625 ) ) ( not ( = ?auto_127618 ?auto_127626 ) ) ( not ( = ?auto_127618 ?auto_127627 ) ) ( not ( = ?auto_127618 ?auto_127628 ) ) ( not ( = ?auto_127619 ?auto_127620 ) ) ( not ( = ?auto_127619 ?auto_127621 ) ) ( not ( = ?auto_127619 ?auto_127622 ) ) ( not ( = ?auto_127619 ?auto_127623 ) ) ( not ( = ?auto_127619 ?auto_127624 ) ) ( not ( = ?auto_127619 ?auto_127625 ) ) ( not ( = ?auto_127619 ?auto_127626 ) ) ( not ( = ?auto_127619 ?auto_127627 ) ) ( not ( = ?auto_127619 ?auto_127628 ) ) ( not ( = ?auto_127620 ?auto_127621 ) ) ( not ( = ?auto_127620 ?auto_127622 ) ) ( not ( = ?auto_127620 ?auto_127623 ) ) ( not ( = ?auto_127620 ?auto_127624 ) ) ( not ( = ?auto_127620 ?auto_127625 ) ) ( not ( = ?auto_127620 ?auto_127626 ) ) ( not ( = ?auto_127620 ?auto_127627 ) ) ( not ( = ?auto_127620 ?auto_127628 ) ) ( not ( = ?auto_127621 ?auto_127622 ) ) ( not ( = ?auto_127621 ?auto_127623 ) ) ( not ( = ?auto_127621 ?auto_127624 ) ) ( not ( = ?auto_127621 ?auto_127625 ) ) ( not ( = ?auto_127621 ?auto_127626 ) ) ( not ( = ?auto_127621 ?auto_127627 ) ) ( not ( = ?auto_127621 ?auto_127628 ) ) ( not ( = ?auto_127622 ?auto_127623 ) ) ( not ( = ?auto_127622 ?auto_127624 ) ) ( not ( = ?auto_127622 ?auto_127625 ) ) ( not ( = ?auto_127622 ?auto_127626 ) ) ( not ( = ?auto_127622 ?auto_127627 ) ) ( not ( = ?auto_127622 ?auto_127628 ) ) ( not ( = ?auto_127623 ?auto_127624 ) ) ( not ( = ?auto_127623 ?auto_127625 ) ) ( not ( = ?auto_127623 ?auto_127626 ) ) ( not ( = ?auto_127623 ?auto_127627 ) ) ( not ( = ?auto_127623 ?auto_127628 ) ) ( not ( = ?auto_127624 ?auto_127625 ) ) ( not ( = ?auto_127624 ?auto_127626 ) ) ( not ( = ?auto_127624 ?auto_127627 ) ) ( not ( = ?auto_127624 ?auto_127628 ) ) ( not ( = ?auto_127625 ?auto_127626 ) ) ( not ( = ?auto_127625 ?auto_127627 ) ) ( not ( = ?auto_127625 ?auto_127628 ) ) ( not ( = ?auto_127626 ?auto_127627 ) ) ( not ( = ?auto_127626 ?auto_127628 ) ) ( not ( = ?auto_127627 ?auto_127628 ) ) ( ON ?auto_127626 ?auto_127627 ) ( ON ?auto_127625 ?auto_127626 ) ( CLEAR ?auto_127623 ) ( ON ?auto_127624 ?auto_127625 ) ( CLEAR ?auto_127624 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_127618 ?auto_127619 ?auto_127620 ?auto_127621 ?auto_127622 ?auto_127623 ?auto_127624 )
      ( MAKE-10PILE ?auto_127618 ?auto_127619 ?auto_127620 ?auto_127621 ?auto_127622 ?auto_127623 ?auto_127624 ?auto_127625 ?auto_127626 ?auto_127627 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_127639 - BLOCK
      ?auto_127640 - BLOCK
      ?auto_127641 - BLOCK
      ?auto_127642 - BLOCK
      ?auto_127643 - BLOCK
      ?auto_127644 - BLOCK
      ?auto_127645 - BLOCK
      ?auto_127646 - BLOCK
      ?auto_127647 - BLOCK
      ?auto_127648 - BLOCK
    )
    :vars
    (
      ?auto_127649 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127648 ?auto_127649 ) ( ON-TABLE ?auto_127639 ) ( ON ?auto_127640 ?auto_127639 ) ( ON ?auto_127641 ?auto_127640 ) ( ON ?auto_127642 ?auto_127641 ) ( ON ?auto_127643 ?auto_127642 ) ( ON ?auto_127644 ?auto_127643 ) ( not ( = ?auto_127639 ?auto_127640 ) ) ( not ( = ?auto_127639 ?auto_127641 ) ) ( not ( = ?auto_127639 ?auto_127642 ) ) ( not ( = ?auto_127639 ?auto_127643 ) ) ( not ( = ?auto_127639 ?auto_127644 ) ) ( not ( = ?auto_127639 ?auto_127645 ) ) ( not ( = ?auto_127639 ?auto_127646 ) ) ( not ( = ?auto_127639 ?auto_127647 ) ) ( not ( = ?auto_127639 ?auto_127648 ) ) ( not ( = ?auto_127639 ?auto_127649 ) ) ( not ( = ?auto_127640 ?auto_127641 ) ) ( not ( = ?auto_127640 ?auto_127642 ) ) ( not ( = ?auto_127640 ?auto_127643 ) ) ( not ( = ?auto_127640 ?auto_127644 ) ) ( not ( = ?auto_127640 ?auto_127645 ) ) ( not ( = ?auto_127640 ?auto_127646 ) ) ( not ( = ?auto_127640 ?auto_127647 ) ) ( not ( = ?auto_127640 ?auto_127648 ) ) ( not ( = ?auto_127640 ?auto_127649 ) ) ( not ( = ?auto_127641 ?auto_127642 ) ) ( not ( = ?auto_127641 ?auto_127643 ) ) ( not ( = ?auto_127641 ?auto_127644 ) ) ( not ( = ?auto_127641 ?auto_127645 ) ) ( not ( = ?auto_127641 ?auto_127646 ) ) ( not ( = ?auto_127641 ?auto_127647 ) ) ( not ( = ?auto_127641 ?auto_127648 ) ) ( not ( = ?auto_127641 ?auto_127649 ) ) ( not ( = ?auto_127642 ?auto_127643 ) ) ( not ( = ?auto_127642 ?auto_127644 ) ) ( not ( = ?auto_127642 ?auto_127645 ) ) ( not ( = ?auto_127642 ?auto_127646 ) ) ( not ( = ?auto_127642 ?auto_127647 ) ) ( not ( = ?auto_127642 ?auto_127648 ) ) ( not ( = ?auto_127642 ?auto_127649 ) ) ( not ( = ?auto_127643 ?auto_127644 ) ) ( not ( = ?auto_127643 ?auto_127645 ) ) ( not ( = ?auto_127643 ?auto_127646 ) ) ( not ( = ?auto_127643 ?auto_127647 ) ) ( not ( = ?auto_127643 ?auto_127648 ) ) ( not ( = ?auto_127643 ?auto_127649 ) ) ( not ( = ?auto_127644 ?auto_127645 ) ) ( not ( = ?auto_127644 ?auto_127646 ) ) ( not ( = ?auto_127644 ?auto_127647 ) ) ( not ( = ?auto_127644 ?auto_127648 ) ) ( not ( = ?auto_127644 ?auto_127649 ) ) ( not ( = ?auto_127645 ?auto_127646 ) ) ( not ( = ?auto_127645 ?auto_127647 ) ) ( not ( = ?auto_127645 ?auto_127648 ) ) ( not ( = ?auto_127645 ?auto_127649 ) ) ( not ( = ?auto_127646 ?auto_127647 ) ) ( not ( = ?auto_127646 ?auto_127648 ) ) ( not ( = ?auto_127646 ?auto_127649 ) ) ( not ( = ?auto_127647 ?auto_127648 ) ) ( not ( = ?auto_127647 ?auto_127649 ) ) ( not ( = ?auto_127648 ?auto_127649 ) ) ( ON ?auto_127647 ?auto_127648 ) ( ON ?auto_127646 ?auto_127647 ) ( CLEAR ?auto_127644 ) ( ON ?auto_127645 ?auto_127646 ) ( CLEAR ?auto_127645 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_127639 ?auto_127640 ?auto_127641 ?auto_127642 ?auto_127643 ?auto_127644 ?auto_127645 )
      ( MAKE-10PILE ?auto_127639 ?auto_127640 ?auto_127641 ?auto_127642 ?auto_127643 ?auto_127644 ?auto_127645 ?auto_127646 ?auto_127647 ?auto_127648 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_127660 - BLOCK
      ?auto_127661 - BLOCK
      ?auto_127662 - BLOCK
      ?auto_127663 - BLOCK
      ?auto_127664 - BLOCK
      ?auto_127665 - BLOCK
      ?auto_127666 - BLOCK
      ?auto_127667 - BLOCK
      ?auto_127668 - BLOCK
      ?auto_127669 - BLOCK
    )
    :vars
    (
      ?auto_127670 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127669 ?auto_127670 ) ( ON-TABLE ?auto_127660 ) ( ON ?auto_127661 ?auto_127660 ) ( ON ?auto_127662 ?auto_127661 ) ( ON ?auto_127663 ?auto_127662 ) ( ON ?auto_127664 ?auto_127663 ) ( not ( = ?auto_127660 ?auto_127661 ) ) ( not ( = ?auto_127660 ?auto_127662 ) ) ( not ( = ?auto_127660 ?auto_127663 ) ) ( not ( = ?auto_127660 ?auto_127664 ) ) ( not ( = ?auto_127660 ?auto_127665 ) ) ( not ( = ?auto_127660 ?auto_127666 ) ) ( not ( = ?auto_127660 ?auto_127667 ) ) ( not ( = ?auto_127660 ?auto_127668 ) ) ( not ( = ?auto_127660 ?auto_127669 ) ) ( not ( = ?auto_127660 ?auto_127670 ) ) ( not ( = ?auto_127661 ?auto_127662 ) ) ( not ( = ?auto_127661 ?auto_127663 ) ) ( not ( = ?auto_127661 ?auto_127664 ) ) ( not ( = ?auto_127661 ?auto_127665 ) ) ( not ( = ?auto_127661 ?auto_127666 ) ) ( not ( = ?auto_127661 ?auto_127667 ) ) ( not ( = ?auto_127661 ?auto_127668 ) ) ( not ( = ?auto_127661 ?auto_127669 ) ) ( not ( = ?auto_127661 ?auto_127670 ) ) ( not ( = ?auto_127662 ?auto_127663 ) ) ( not ( = ?auto_127662 ?auto_127664 ) ) ( not ( = ?auto_127662 ?auto_127665 ) ) ( not ( = ?auto_127662 ?auto_127666 ) ) ( not ( = ?auto_127662 ?auto_127667 ) ) ( not ( = ?auto_127662 ?auto_127668 ) ) ( not ( = ?auto_127662 ?auto_127669 ) ) ( not ( = ?auto_127662 ?auto_127670 ) ) ( not ( = ?auto_127663 ?auto_127664 ) ) ( not ( = ?auto_127663 ?auto_127665 ) ) ( not ( = ?auto_127663 ?auto_127666 ) ) ( not ( = ?auto_127663 ?auto_127667 ) ) ( not ( = ?auto_127663 ?auto_127668 ) ) ( not ( = ?auto_127663 ?auto_127669 ) ) ( not ( = ?auto_127663 ?auto_127670 ) ) ( not ( = ?auto_127664 ?auto_127665 ) ) ( not ( = ?auto_127664 ?auto_127666 ) ) ( not ( = ?auto_127664 ?auto_127667 ) ) ( not ( = ?auto_127664 ?auto_127668 ) ) ( not ( = ?auto_127664 ?auto_127669 ) ) ( not ( = ?auto_127664 ?auto_127670 ) ) ( not ( = ?auto_127665 ?auto_127666 ) ) ( not ( = ?auto_127665 ?auto_127667 ) ) ( not ( = ?auto_127665 ?auto_127668 ) ) ( not ( = ?auto_127665 ?auto_127669 ) ) ( not ( = ?auto_127665 ?auto_127670 ) ) ( not ( = ?auto_127666 ?auto_127667 ) ) ( not ( = ?auto_127666 ?auto_127668 ) ) ( not ( = ?auto_127666 ?auto_127669 ) ) ( not ( = ?auto_127666 ?auto_127670 ) ) ( not ( = ?auto_127667 ?auto_127668 ) ) ( not ( = ?auto_127667 ?auto_127669 ) ) ( not ( = ?auto_127667 ?auto_127670 ) ) ( not ( = ?auto_127668 ?auto_127669 ) ) ( not ( = ?auto_127668 ?auto_127670 ) ) ( not ( = ?auto_127669 ?auto_127670 ) ) ( ON ?auto_127668 ?auto_127669 ) ( ON ?auto_127667 ?auto_127668 ) ( ON ?auto_127666 ?auto_127667 ) ( CLEAR ?auto_127664 ) ( ON ?auto_127665 ?auto_127666 ) ( CLEAR ?auto_127665 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_127660 ?auto_127661 ?auto_127662 ?auto_127663 ?auto_127664 ?auto_127665 )
      ( MAKE-10PILE ?auto_127660 ?auto_127661 ?auto_127662 ?auto_127663 ?auto_127664 ?auto_127665 ?auto_127666 ?auto_127667 ?auto_127668 ?auto_127669 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_127681 - BLOCK
      ?auto_127682 - BLOCK
      ?auto_127683 - BLOCK
      ?auto_127684 - BLOCK
      ?auto_127685 - BLOCK
      ?auto_127686 - BLOCK
      ?auto_127687 - BLOCK
      ?auto_127688 - BLOCK
      ?auto_127689 - BLOCK
      ?auto_127690 - BLOCK
    )
    :vars
    (
      ?auto_127691 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127690 ?auto_127691 ) ( ON-TABLE ?auto_127681 ) ( ON ?auto_127682 ?auto_127681 ) ( ON ?auto_127683 ?auto_127682 ) ( ON ?auto_127684 ?auto_127683 ) ( ON ?auto_127685 ?auto_127684 ) ( not ( = ?auto_127681 ?auto_127682 ) ) ( not ( = ?auto_127681 ?auto_127683 ) ) ( not ( = ?auto_127681 ?auto_127684 ) ) ( not ( = ?auto_127681 ?auto_127685 ) ) ( not ( = ?auto_127681 ?auto_127686 ) ) ( not ( = ?auto_127681 ?auto_127687 ) ) ( not ( = ?auto_127681 ?auto_127688 ) ) ( not ( = ?auto_127681 ?auto_127689 ) ) ( not ( = ?auto_127681 ?auto_127690 ) ) ( not ( = ?auto_127681 ?auto_127691 ) ) ( not ( = ?auto_127682 ?auto_127683 ) ) ( not ( = ?auto_127682 ?auto_127684 ) ) ( not ( = ?auto_127682 ?auto_127685 ) ) ( not ( = ?auto_127682 ?auto_127686 ) ) ( not ( = ?auto_127682 ?auto_127687 ) ) ( not ( = ?auto_127682 ?auto_127688 ) ) ( not ( = ?auto_127682 ?auto_127689 ) ) ( not ( = ?auto_127682 ?auto_127690 ) ) ( not ( = ?auto_127682 ?auto_127691 ) ) ( not ( = ?auto_127683 ?auto_127684 ) ) ( not ( = ?auto_127683 ?auto_127685 ) ) ( not ( = ?auto_127683 ?auto_127686 ) ) ( not ( = ?auto_127683 ?auto_127687 ) ) ( not ( = ?auto_127683 ?auto_127688 ) ) ( not ( = ?auto_127683 ?auto_127689 ) ) ( not ( = ?auto_127683 ?auto_127690 ) ) ( not ( = ?auto_127683 ?auto_127691 ) ) ( not ( = ?auto_127684 ?auto_127685 ) ) ( not ( = ?auto_127684 ?auto_127686 ) ) ( not ( = ?auto_127684 ?auto_127687 ) ) ( not ( = ?auto_127684 ?auto_127688 ) ) ( not ( = ?auto_127684 ?auto_127689 ) ) ( not ( = ?auto_127684 ?auto_127690 ) ) ( not ( = ?auto_127684 ?auto_127691 ) ) ( not ( = ?auto_127685 ?auto_127686 ) ) ( not ( = ?auto_127685 ?auto_127687 ) ) ( not ( = ?auto_127685 ?auto_127688 ) ) ( not ( = ?auto_127685 ?auto_127689 ) ) ( not ( = ?auto_127685 ?auto_127690 ) ) ( not ( = ?auto_127685 ?auto_127691 ) ) ( not ( = ?auto_127686 ?auto_127687 ) ) ( not ( = ?auto_127686 ?auto_127688 ) ) ( not ( = ?auto_127686 ?auto_127689 ) ) ( not ( = ?auto_127686 ?auto_127690 ) ) ( not ( = ?auto_127686 ?auto_127691 ) ) ( not ( = ?auto_127687 ?auto_127688 ) ) ( not ( = ?auto_127687 ?auto_127689 ) ) ( not ( = ?auto_127687 ?auto_127690 ) ) ( not ( = ?auto_127687 ?auto_127691 ) ) ( not ( = ?auto_127688 ?auto_127689 ) ) ( not ( = ?auto_127688 ?auto_127690 ) ) ( not ( = ?auto_127688 ?auto_127691 ) ) ( not ( = ?auto_127689 ?auto_127690 ) ) ( not ( = ?auto_127689 ?auto_127691 ) ) ( not ( = ?auto_127690 ?auto_127691 ) ) ( ON ?auto_127689 ?auto_127690 ) ( ON ?auto_127688 ?auto_127689 ) ( ON ?auto_127687 ?auto_127688 ) ( CLEAR ?auto_127685 ) ( ON ?auto_127686 ?auto_127687 ) ( CLEAR ?auto_127686 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_127681 ?auto_127682 ?auto_127683 ?auto_127684 ?auto_127685 ?auto_127686 )
      ( MAKE-10PILE ?auto_127681 ?auto_127682 ?auto_127683 ?auto_127684 ?auto_127685 ?auto_127686 ?auto_127687 ?auto_127688 ?auto_127689 ?auto_127690 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_127702 - BLOCK
      ?auto_127703 - BLOCK
      ?auto_127704 - BLOCK
      ?auto_127705 - BLOCK
      ?auto_127706 - BLOCK
      ?auto_127707 - BLOCK
      ?auto_127708 - BLOCK
      ?auto_127709 - BLOCK
      ?auto_127710 - BLOCK
      ?auto_127711 - BLOCK
    )
    :vars
    (
      ?auto_127712 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127711 ?auto_127712 ) ( ON-TABLE ?auto_127702 ) ( ON ?auto_127703 ?auto_127702 ) ( ON ?auto_127704 ?auto_127703 ) ( ON ?auto_127705 ?auto_127704 ) ( not ( = ?auto_127702 ?auto_127703 ) ) ( not ( = ?auto_127702 ?auto_127704 ) ) ( not ( = ?auto_127702 ?auto_127705 ) ) ( not ( = ?auto_127702 ?auto_127706 ) ) ( not ( = ?auto_127702 ?auto_127707 ) ) ( not ( = ?auto_127702 ?auto_127708 ) ) ( not ( = ?auto_127702 ?auto_127709 ) ) ( not ( = ?auto_127702 ?auto_127710 ) ) ( not ( = ?auto_127702 ?auto_127711 ) ) ( not ( = ?auto_127702 ?auto_127712 ) ) ( not ( = ?auto_127703 ?auto_127704 ) ) ( not ( = ?auto_127703 ?auto_127705 ) ) ( not ( = ?auto_127703 ?auto_127706 ) ) ( not ( = ?auto_127703 ?auto_127707 ) ) ( not ( = ?auto_127703 ?auto_127708 ) ) ( not ( = ?auto_127703 ?auto_127709 ) ) ( not ( = ?auto_127703 ?auto_127710 ) ) ( not ( = ?auto_127703 ?auto_127711 ) ) ( not ( = ?auto_127703 ?auto_127712 ) ) ( not ( = ?auto_127704 ?auto_127705 ) ) ( not ( = ?auto_127704 ?auto_127706 ) ) ( not ( = ?auto_127704 ?auto_127707 ) ) ( not ( = ?auto_127704 ?auto_127708 ) ) ( not ( = ?auto_127704 ?auto_127709 ) ) ( not ( = ?auto_127704 ?auto_127710 ) ) ( not ( = ?auto_127704 ?auto_127711 ) ) ( not ( = ?auto_127704 ?auto_127712 ) ) ( not ( = ?auto_127705 ?auto_127706 ) ) ( not ( = ?auto_127705 ?auto_127707 ) ) ( not ( = ?auto_127705 ?auto_127708 ) ) ( not ( = ?auto_127705 ?auto_127709 ) ) ( not ( = ?auto_127705 ?auto_127710 ) ) ( not ( = ?auto_127705 ?auto_127711 ) ) ( not ( = ?auto_127705 ?auto_127712 ) ) ( not ( = ?auto_127706 ?auto_127707 ) ) ( not ( = ?auto_127706 ?auto_127708 ) ) ( not ( = ?auto_127706 ?auto_127709 ) ) ( not ( = ?auto_127706 ?auto_127710 ) ) ( not ( = ?auto_127706 ?auto_127711 ) ) ( not ( = ?auto_127706 ?auto_127712 ) ) ( not ( = ?auto_127707 ?auto_127708 ) ) ( not ( = ?auto_127707 ?auto_127709 ) ) ( not ( = ?auto_127707 ?auto_127710 ) ) ( not ( = ?auto_127707 ?auto_127711 ) ) ( not ( = ?auto_127707 ?auto_127712 ) ) ( not ( = ?auto_127708 ?auto_127709 ) ) ( not ( = ?auto_127708 ?auto_127710 ) ) ( not ( = ?auto_127708 ?auto_127711 ) ) ( not ( = ?auto_127708 ?auto_127712 ) ) ( not ( = ?auto_127709 ?auto_127710 ) ) ( not ( = ?auto_127709 ?auto_127711 ) ) ( not ( = ?auto_127709 ?auto_127712 ) ) ( not ( = ?auto_127710 ?auto_127711 ) ) ( not ( = ?auto_127710 ?auto_127712 ) ) ( not ( = ?auto_127711 ?auto_127712 ) ) ( ON ?auto_127710 ?auto_127711 ) ( ON ?auto_127709 ?auto_127710 ) ( ON ?auto_127708 ?auto_127709 ) ( ON ?auto_127707 ?auto_127708 ) ( CLEAR ?auto_127705 ) ( ON ?auto_127706 ?auto_127707 ) ( CLEAR ?auto_127706 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_127702 ?auto_127703 ?auto_127704 ?auto_127705 ?auto_127706 )
      ( MAKE-10PILE ?auto_127702 ?auto_127703 ?auto_127704 ?auto_127705 ?auto_127706 ?auto_127707 ?auto_127708 ?auto_127709 ?auto_127710 ?auto_127711 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_127723 - BLOCK
      ?auto_127724 - BLOCK
      ?auto_127725 - BLOCK
      ?auto_127726 - BLOCK
      ?auto_127727 - BLOCK
      ?auto_127728 - BLOCK
      ?auto_127729 - BLOCK
      ?auto_127730 - BLOCK
      ?auto_127731 - BLOCK
      ?auto_127732 - BLOCK
    )
    :vars
    (
      ?auto_127733 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127732 ?auto_127733 ) ( ON-TABLE ?auto_127723 ) ( ON ?auto_127724 ?auto_127723 ) ( ON ?auto_127725 ?auto_127724 ) ( ON ?auto_127726 ?auto_127725 ) ( not ( = ?auto_127723 ?auto_127724 ) ) ( not ( = ?auto_127723 ?auto_127725 ) ) ( not ( = ?auto_127723 ?auto_127726 ) ) ( not ( = ?auto_127723 ?auto_127727 ) ) ( not ( = ?auto_127723 ?auto_127728 ) ) ( not ( = ?auto_127723 ?auto_127729 ) ) ( not ( = ?auto_127723 ?auto_127730 ) ) ( not ( = ?auto_127723 ?auto_127731 ) ) ( not ( = ?auto_127723 ?auto_127732 ) ) ( not ( = ?auto_127723 ?auto_127733 ) ) ( not ( = ?auto_127724 ?auto_127725 ) ) ( not ( = ?auto_127724 ?auto_127726 ) ) ( not ( = ?auto_127724 ?auto_127727 ) ) ( not ( = ?auto_127724 ?auto_127728 ) ) ( not ( = ?auto_127724 ?auto_127729 ) ) ( not ( = ?auto_127724 ?auto_127730 ) ) ( not ( = ?auto_127724 ?auto_127731 ) ) ( not ( = ?auto_127724 ?auto_127732 ) ) ( not ( = ?auto_127724 ?auto_127733 ) ) ( not ( = ?auto_127725 ?auto_127726 ) ) ( not ( = ?auto_127725 ?auto_127727 ) ) ( not ( = ?auto_127725 ?auto_127728 ) ) ( not ( = ?auto_127725 ?auto_127729 ) ) ( not ( = ?auto_127725 ?auto_127730 ) ) ( not ( = ?auto_127725 ?auto_127731 ) ) ( not ( = ?auto_127725 ?auto_127732 ) ) ( not ( = ?auto_127725 ?auto_127733 ) ) ( not ( = ?auto_127726 ?auto_127727 ) ) ( not ( = ?auto_127726 ?auto_127728 ) ) ( not ( = ?auto_127726 ?auto_127729 ) ) ( not ( = ?auto_127726 ?auto_127730 ) ) ( not ( = ?auto_127726 ?auto_127731 ) ) ( not ( = ?auto_127726 ?auto_127732 ) ) ( not ( = ?auto_127726 ?auto_127733 ) ) ( not ( = ?auto_127727 ?auto_127728 ) ) ( not ( = ?auto_127727 ?auto_127729 ) ) ( not ( = ?auto_127727 ?auto_127730 ) ) ( not ( = ?auto_127727 ?auto_127731 ) ) ( not ( = ?auto_127727 ?auto_127732 ) ) ( not ( = ?auto_127727 ?auto_127733 ) ) ( not ( = ?auto_127728 ?auto_127729 ) ) ( not ( = ?auto_127728 ?auto_127730 ) ) ( not ( = ?auto_127728 ?auto_127731 ) ) ( not ( = ?auto_127728 ?auto_127732 ) ) ( not ( = ?auto_127728 ?auto_127733 ) ) ( not ( = ?auto_127729 ?auto_127730 ) ) ( not ( = ?auto_127729 ?auto_127731 ) ) ( not ( = ?auto_127729 ?auto_127732 ) ) ( not ( = ?auto_127729 ?auto_127733 ) ) ( not ( = ?auto_127730 ?auto_127731 ) ) ( not ( = ?auto_127730 ?auto_127732 ) ) ( not ( = ?auto_127730 ?auto_127733 ) ) ( not ( = ?auto_127731 ?auto_127732 ) ) ( not ( = ?auto_127731 ?auto_127733 ) ) ( not ( = ?auto_127732 ?auto_127733 ) ) ( ON ?auto_127731 ?auto_127732 ) ( ON ?auto_127730 ?auto_127731 ) ( ON ?auto_127729 ?auto_127730 ) ( ON ?auto_127728 ?auto_127729 ) ( CLEAR ?auto_127726 ) ( ON ?auto_127727 ?auto_127728 ) ( CLEAR ?auto_127727 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_127723 ?auto_127724 ?auto_127725 ?auto_127726 ?auto_127727 )
      ( MAKE-10PILE ?auto_127723 ?auto_127724 ?auto_127725 ?auto_127726 ?auto_127727 ?auto_127728 ?auto_127729 ?auto_127730 ?auto_127731 ?auto_127732 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_127744 - BLOCK
      ?auto_127745 - BLOCK
      ?auto_127746 - BLOCK
      ?auto_127747 - BLOCK
      ?auto_127748 - BLOCK
      ?auto_127749 - BLOCK
      ?auto_127750 - BLOCK
      ?auto_127751 - BLOCK
      ?auto_127752 - BLOCK
      ?auto_127753 - BLOCK
    )
    :vars
    (
      ?auto_127754 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127753 ?auto_127754 ) ( ON-TABLE ?auto_127744 ) ( ON ?auto_127745 ?auto_127744 ) ( ON ?auto_127746 ?auto_127745 ) ( not ( = ?auto_127744 ?auto_127745 ) ) ( not ( = ?auto_127744 ?auto_127746 ) ) ( not ( = ?auto_127744 ?auto_127747 ) ) ( not ( = ?auto_127744 ?auto_127748 ) ) ( not ( = ?auto_127744 ?auto_127749 ) ) ( not ( = ?auto_127744 ?auto_127750 ) ) ( not ( = ?auto_127744 ?auto_127751 ) ) ( not ( = ?auto_127744 ?auto_127752 ) ) ( not ( = ?auto_127744 ?auto_127753 ) ) ( not ( = ?auto_127744 ?auto_127754 ) ) ( not ( = ?auto_127745 ?auto_127746 ) ) ( not ( = ?auto_127745 ?auto_127747 ) ) ( not ( = ?auto_127745 ?auto_127748 ) ) ( not ( = ?auto_127745 ?auto_127749 ) ) ( not ( = ?auto_127745 ?auto_127750 ) ) ( not ( = ?auto_127745 ?auto_127751 ) ) ( not ( = ?auto_127745 ?auto_127752 ) ) ( not ( = ?auto_127745 ?auto_127753 ) ) ( not ( = ?auto_127745 ?auto_127754 ) ) ( not ( = ?auto_127746 ?auto_127747 ) ) ( not ( = ?auto_127746 ?auto_127748 ) ) ( not ( = ?auto_127746 ?auto_127749 ) ) ( not ( = ?auto_127746 ?auto_127750 ) ) ( not ( = ?auto_127746 ?auto_127751 ) ) ( not ( = ?auto_127746 ?auto_127752 ) ) ( not ( = ?auto_127746 ?auto_127753 ) ) ( not ( = ?auto_127746 ?auto_127754 ) ) ( not ( = ?auto_127747 ?auto_127748 ) ) ( not ( = ?auto_127747 ?auto_127749 ) ) ( not ( = ?auto_127747 ?auto_127750 ) ) ( not ( = ?auto_127747 ?auto_127751 ) ) ( not ( = ?auto_127747 ?auto_127752 ) ) ( not ( = ?auto_127747 ?auto_127753 ) ) ( not ( = ?auto_127747 ?auto_127754 ) ) ( not ( = ?auto_127748 ?auto_127749 ) ) ( not ( = ?auto_127748 ?auto_127750 ) ) ( not ( = ?auto_127748 ?auto_127751 ) ) ( not ( = ?auto_127748 ?auto_127752 ) ) ( not ( = ?auto_127748 ?auto_127753 ) ) ( not ( = ?auto_127748 ?auto_127754 ) ) ( not ( = ?auto_127749 ?auto_127750 ) ) ( not ( = ?auto_127749 ?auto_127751 ) ) ( not ( = ?auto_127749 ?auto_127752 ) ) ( not ( = ?auto_127749 ?auto_127753 ) ) ( not ( = ?auto_127749 ?auto_127754 ) ) ( not ( = ?auto_127750 ?auto_127751 ) ) ( not ( = ?auto_127750 ?auto_127752 ) ) ( not ( = ?auto_127750 ?auto_127753 ) ) ( not ( = ?auto_127750 ?auto_127754 ) ) ( not ( = ?auto_127751 ?auto_127752 ) ) ( not ( = ?auto_127751 ?auto_127753 ) ) ( not ( = ?auto_127751 ?auto_127754 ) ) ( not ( = ?auto_127752 ?auto_127753 ) ) ( not ( = ?auto_127752 ?auto_127754 ) ) ( not ( = ?auto_127753 ?auto_127754 ) ) ( ON ?auto_127752 ?auto_127753 ) ( ON ?auto_127751 ?auto_127752 ) ( ON ?auto_127750 ?auto_127751 ) ( ON ?auto_127749 ?auto_127750 ) ( ON ?auto_127748 ?auto_127749 ) ( CLEAR ?auto_127746 ) ( ON ?auto_127747 ?auto_127748 ) ( CLEAR ?auto_127747 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_127744 ?auto_127745 ?auto_127746 ?auto_127747 )
      ( MAKE-10PILE ?auto_127744 ?auto_127745 ?auto_127746 ?auto_127747 ?auto_127748 ?auto_127749 ?auto_127750 ?auto_127751 ?auto_127752 ?auto_127753 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_127765 - BLOCK
      ?auto_127766 - BLOCK
      ?auto_127767 - BLOCK
      ?auto_127768 - BLOCK
      ?auto_127769 - BLOCK
      ?auto_127770 - BLOCK
      ?auto_127771 - BLOCK
      ?auto_127772 - BLOCK
      ?auto_127773 - BLOCK
      ?auto_127774 - BLOCK
    )
    :vars
    (
      ?auto_127775 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127774 ?auto_127775 ) ( ON-TABLE ?auto_127765 ) ( ON ?auto_127766 ?auto_127765 ) ( ON ?auto_127767 ?auto_127766 ) ( not ( = ?auto_127765 ?auto_127766 ) ) ( not ( = ?auto_127765 ?auto_127767 ) ) ( not ( = ?auto_127765 ?auto_127768 ) ) ( not ( = ?auto_127765 ?auto_127769 ) ) ( not ( = ?auto_127765 ?auto_127770 ) ) ( not ( = ?auto_127765 ?auto_127771 ) ) ( not ( = ?auto_127765 ?auto_127772 ) ) ( not ( = ?auto_127765 ?auto_127773 ) ) ( not ( = ?auto_127765 ?auto_127774 ) ) ( not ( = ?auto_127765 ?auto_127775 ) ) ( not ( = ?auto_127766 ?auto_127767 ) ) ( not ( = ?auto_127766 ?auto_127768 ) ) ( not ( = ?auto_127766 ?auto_127769 ) ) ( not ( = ?auto_127766 ?auto_127770 ) ) ( not ( = ?auto_127766 ?auto_127771 ) ) ( not ( = ?auto_127766 ?auto_127772 ) ) ( not ( = ?auto_127766 ?auto_127773 ) ) ( not ( = ?auto_127766 ?auto_127774 ) ) ( not ( = ?auto_127766 ?auto_127775 ) ) ( not ( = ?auto_127767 ?auto_127768 ) ) ( not ( = ?auto_127767 ?auto_127769 ) ) ( not ( = ?auto_127767 ?auto_127770 ) ) ( not ( = ?auto_127767 ?auto_127771 ) ) ( not ( = ?auto_127767 ?auto_127772 ) ) ( not ( = ?auto_127767 ?auto_127773 ) ) ( not ( = ?auto_127767 ?auto_127774 ) ) ( not ( = ?auto_127767 ?auto_127775 ) ) ( not ( = ?auto_127768 ?auto_127769 ) ) ( not ( = ?auto_127768 ?auto_127770 ) ) ( not ( = ?auto_127768 ?auto_127771 ) ) ( not ( = ?auto_127768 ?auto_127772 ) ) ( not ( = ?auto_127768 ?auto_127773 ) ) ( not ( = ?auto_127768 ?auto_127774 ) ) ( not ( = ?auto_127768 ?auto_127775 ) ) ( not ( = ?auto_127769 ?auto_127770 ) ) ( not ( = ?auto_127769 ?auto_127771 ) ) ( not ( = ?auto_127769 ?auto_127772 ) ) ( not ( = ?auto_127769 ?auto_127773 ) ) ( not ( = ?auto_127769 ?auto_127774 ) ) ( not ( = ?auto_127769 ?auto_127775 ) ) ( not ( = ?auto_127770 ?auto_127771 ) ) ( not ( = ?auto_127770 ?auto_127772 ) ) ( not ( = ?auto_127770 ?auto_127773 ) ) ( not ( = ?auto_127770 ?auto_127774 ) ) ( not ( = ?auto_127770 ?auto_127775 ) ) ( not ( = ?auto_127771 ?auto_127772 ) ) ( not ( = ?auto_127771 ?auto_127773 ) ) ( not ( = ?auto_127771 ?auto_127774 ) ) ( not ( = ?auto_127771 ?auto_127775 ) ) ( not ( = ?auto_127772 ?auto_127773 ) ) ( not ( = ?auto_127772 ?auto_127774 ) ) ( not ( = ?auto_127772 ?auto_127775 ) ) ( not ( = ?auto_127773 ?auto_127774 ) ) ( not ( = ?auto_127773 ?auto_127775 ) ) ( not ( = ?auto_127774 ?auto_127775 ) ) ( ON ?auto_127773 ?auto_127774 ) ( ON ?auto_127772 ?auto_127773 ) ( ON ?auto_127771 ?auto_127772 ) ( ON ?auto_127770 ?auto_127771 ) ( ON ?auto_127769 ?auto_127770 ) ( CLEAR ?auto_127767 ) ( ON ?auto_127768 ?auto_127769 ) ( CLEAR ?auto_127768 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_127765 ?auto_127766 ?auto_127767 ?auto_127768 )
      ( MAKE-10PILE ?auto_127765 ?auto_127766 ?auto_127767 ?auto_127768 ?auto_127769 ?auto_127770 ?auto_127771 ?auto_127772 ?auto_127773 ?auto_127774 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_127786 - BLOCK
      ?auto_127787 - BLOCK
      ?auto_127788 - BLOCK
      ?auto_127789 - BLOCK
      ?auto_127790 - BLOCK
      ?auto_127791 - BLOCK
      ?auto_127792 - BLOCK
      ?auto_127793 - BLOCK
      ?auto_127794 - BLOCK
      ?auto_127795 - BLOCK
    )
    :vars
    (
      ?auto_127796 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127795 ?auto_127796 ) ( ON-TABLE ?auto_127786 ) ( ON ?auto_127787 ?auto_127786 ) ( not ( = ?auto_127786 ?auto_127787 ) ) ( not ( = ?auto_127786 ?auto_127788 ) ) ( not ( = ?auto_127786 ?auto_127789 ) ) ( not ( = ?auto_127786 ?auto_127790 ) ) ( not ( = ?auto_127786 ?auto_127791 ) ) ( not ( = ?auto_127786 ?auto_127792 ) ) ( not ( = ?auto_127786 ?auto_127793 ) ) ( not ( = ?auto_127786 ?auto_127794 ) ) ( not ( = ?auto_127786 ?auto_127795 ) ) ( not ( = ?auto_127786 ?auto_127796 ) ) ( not ( = ?auto_127787 ?auto_127788 ) ) ( not ( = ?auto_127787 ?auto_127789 ) ) ( not ( = ?auto_127787 ?auto_127790 ) ) ( not ( = ?auto_127787 ?auto_127791 ) ) ( not ( = ?auto_127787 ?auto_127792 ) ) ( not ( = ?auto_127787 ?auto_127793 ) ) ( not ( = ?auto_127787 ?auto_127794 ) ) ( not ( = ?auto_127787 ?auto_127795 ) ) ( not ( = ?auto_127787 ?auto_127796 ) ) ( not ( = ?auto_127788 ?auto_127789 ) ) ( not ( = ?auto_127788 ?auto_127790 ) ) ( not ( = ?auto_127788 ?auto_127791 ) ) ( not ( = ?auto_127788 ?auto_127792 ) ) ( not ( = ?auto_127788 ?auto_127793 ) ) ( not ( = ?auto_127788 ?auto_127794 ) ) ( not ( = ?auto_127788 ?auto_127795 ) ) ( not ( = ?auto_127788 ?auto_127796 ) ) ( not ( = ?auto_127789 ?auto_127790 ) ) ( not ( = ?auto_127789 ?auto_127791 ) ) ( not ( = ?auto_127789 ?auto_127792 ) ) ( not ( = ?auto_127789 ?auto_127793 ) ) ( not ( = ?auto_127789 ?auto_127794 ) ) ( not ( = ?auto_127789 ?auto_127795 ) ) ( not ( = ?auto_127789 ?auto_127796 ) ) ( not ( = ?auto_127790 ?auto_127791 ) ) ( not ( = ?auto_127790 ?auto_127792 ) ) ( not ( = ?auto_127790 ?auto_127793 ) ) ( not ( = ?auto_127790 ?auto_127794 ) ) ( not ( = ?auto_127790 ?auto_127795 ) ) ( not ( = ?auto_127790 ?auto_127796 ) ) ( not ( = ?auto_127791 ?auto_127792 ) ) ( not ( = ?auto_127791 ?auto_127793 ) ) ( not ( = ?auto_127791 ?auto_127794 ) ) ( not ( = ?auto_127791 ?auto_127795 ) ) ( not ( = ?auto_127791 ?auto_127796 ) ) ( not ( = ?auto_127792 ?auto_127793 ) ) ( not ( = ?auto_127792 ?auto_127794 ) ) ( not ( = ?auto_127792 ?auto_127795 ) ) ( not ( = ?auto_127792 ?auto_127796 ) ) ( not ( = ?auto_127793 ?auto_127794 ) ) ( not ( = ?auto_127793 ?auto_127795 ) ) ( not ( = ?auto_127793 ?auto_127796 ) ) ( not ( = ?auto_127794 ?auto_127795 ) ) ( not ( = ?auto_127794 ?auto_127796 ) ) ( not ( = ?auto_127795 ?auto_127796 ) ) ( ON ?auto_127794 ?auto_127795 ) ( ON ?auto_127793 ?auto_127794 ) ( ON ?auto_127792 ?auto_127793 ) ( ON ?auto_127791 ?auto_127792 ) ( ON ?auto_127790 ?auto_127791 ) ( ON ?auto_127789 ?auto_127790 ) ( CLEAR ?auto_127787 ) ( ON ?auto_127788 ?auto_127789 ) ( CLEAR ?auto_127788 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_127786 ?auto_127787 ?auto_127788 )
      ( MAKE-10PILE ?auto_127786 ?auto_127787 ?auto_127788 ?auto_127789 ?auto_127790 ?auto_127791 ?auto_127792 ?auto_127793 ?auto_127794 ?auto_127795 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_127807 - BLOCK
      ?auto_127808 - BLOCK
      ?auto_127809 - BLOCK
      ?auto_127810 - BLOCK
      ?auto_127811 - BLOCK
      ?auto_127812 - BLOCK
      ?auto_127813 - BLOCK
      ?auto_127814 - BLOCK
      ?auto_127815 - BLOCK
      ?auto_127816 - BLOCK
    )
    :vars
    (
      ?auto_127817 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127816 ?auto_127817 ) ( ON-TABLE ?auto_127807 ) ( ON ?auto_127808 ?auto_127807 ) ( not ( = ?auto_127807 ?auto_127808 ) ) ( not ( = ?auto_127807 ?auto_127809 ) ) ( not ( = ?auto_127807 ?auto_127810 ) ) ( not ( = ?auto_127807 ?auto_127811 ) ) ( not ( = ?auto_127807 ?auto_127812 ) ) ( not ( = ?auto_127807 ?auto_127813 ) ) ( not ( = ?auto_127807 ?auto_127814 ) ) ( not ( = ?auto_127807 ?auto_127815 ) ) ( not ( = ?auto_127807 ?auto_127816 ) ) ( not ( = ?auto_127807 ?auto_127817 ) ) ( not ( = ?auto_127808 ?auto_127809 ) ) ( not ( = ?auto_127808 ?auto_127810 ) ) ( not ( = ?auto_127808 ?auto_127811 ) ) ( not ( = ?auto_127808 ?auto_127812 ) ) ( not ( = ?auto_127808 ?auto_127813 ) ) ( not ( = ?auto_127808 ?auto_127814 ) ) ( not ( = ?auto_127808 ?auto_127815 ) ) ( not ( = ?auto_127808 ?auto_127816 ) ) ( not ( = ?auto_127808 ?auto_127817 ) ) ( not ( = ?auto_127809 ?auto_127810 ) ) ( not ( = ?auto_127809 ?auto_127811 ) ) ( not ( = ?auto_127809 ?auto_127812 ) ) ( not ( = ?auto_127809 ?auto_127813 ) ) ( not ( = ?auto_127809 ?auto_127814 ) ) ( not ( = ?auto_127809 ?auto_127815 ) ) ( not ( = ?auto_127809 ?auto_127816 ) ) ( not ( = ?auto_127809 ?auto_127817 ) ) ( not ( = ?auto_127810 ?auto_127811 ) ) ( not ( = ?auto_127810 ?auto_127812 ) ) ( not ( = ?auto_127810 ?auto_127813 ) ) ( not ( = ?auto_127810 ?auto_127814 ) ) ( not ( = ?auto_127810 ?auto_127815 ) ) ( not ( = ?auto_127810 ?auto_127816 ) ) ( not ( = ?auto_127810 ?auto_127817 ) ) ( not ( = ?auto_127811 ?auto_127812 ) ) ( not ( = ?auto_127811 ?auto_127813 ) ) ( not ( = ?auto_127811 ?auto_127814 ) ) ( not ( = ?auto_127811 ?auto_127815 ) ) ( not ( = ?auto_127811 ?auto_127816 ) ) ( not ( = ?auto_127811 ?auto_127817 ) ) ( not ( = ?auto_127812 ?auto_127813 ) ) ( not ( = ?auto_127812 ?auto_127814 ) ) ( not ( = ?auto_127812 ?auto_127815 ) ) ( not ( = ?auto_127812 ?auto_127816 ) ) ( not ( = ?auto_127812 ?auto_127817 ) ) ( not ( = ?auto_127813 ?auto_127814 ) ) ( not ( = ?auto_127813 ?auto_127815 ) ) ( not ( = ?auto_127813 ?auto_127816 ) ) ( not ( = ?auto_127813 ?auto_127817 ) ) ( not ( = ?auto_127814 ?auto_127815 ) ) ( not ( = ?auto_127814 ?auto_127816 ) ) ( not ( = ?auto_127814 ?auto_127817 ) ) ( not ( = ?auto_127815 ?auto_127816 ) ) ( not ( = ?auto_127815 ?auto_127817 ) ) ( not ( = ?auto_127816 ?auto_127817 ) ) ( ON ?auto_127815 ?auto_127816 ) ( ON ?auto_127814 ?auto_127815 ) ( ON ?auto_127813 ?auto_127814 ) ( ON ?auto_127812 ?auto_127813 ) ( ON ?auto_127811 ?auto_127812 ) ( ON ?auto_127810 ?auto_127811 ) ( CLEAR ?auto_127808 ) ( ON ?auto_127809 ?auto_127810 ) ( CLEAR ?auto_127809 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_127807 ?auto_127808 ?auto_127809 )
      ( MAKE-10PILE ?auto_127807 ?auto_127808 ?auto_127809 ?auto_127810 ?auto_127811 ?auto_127812 ?auto_127813 ?auto_127814 ?auto_127815 ?auto_127816 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_127828 - BLOCK
      ?auto_127829 - BLOCK
      ?auto_127830 - BLOCK
      ?auto_127831 - BLOCK
      ?auto_127832 - BLOCK
      ?auto_127833 - BLOCK
      ?auto_127834 - BLOCK
      ?auto_127835 - BLOCK
      ?auto_127836 - BLOCK
      ?auto_127837 - BLOCK
    )
    :vars
    (
      ?auto_127838 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127837 ?auto_127838 ) ( ON-TABLE ?auto_127828 ) ( not ( = ?auto_127828 ?auto_127829 ) ) ( not ( = ?auto_127828 ?auto_127830 ) ) ( not ( = ?auto_127828 ?auto_127831 ) ) ( not ( = ?auto_127828 ?auto_127832 ) ) ( not ( = ?auto_127828 ?auto_127833 ) ) ( not ( = ?auto_127828 ?auto_127834 ) ) ( not ( = ?auto_127828 ?auto_127835 ) ) ( not ( = ?auto_127828 ?auto_127836 ) ) ( not ( = ?auto_127828 ?auto_127837 ) ) ( not ( = ?auto_127828 ?auto_127838 ) ) ( not ( = ?auto_127829 ?auto_127830 ) ) ( not ( = ?auto_127829 ?auto_127831 ) ) ( not ( = ?auto_127829 ?auto_127832 ) ) ( not ( = ?auto_127829 ?auto_127833 ) ) ( not ( = ?auto_127829 ?auto_127834 ) ) ( not ( = ?auto_127829 ?auto_127835 ) ) ( not ( = ?auto_127829 ?auto_127836 ) ) ( not ( = ?auto_127829 ?auto_127837 ) ) ( not ( = ?auto_127829 ?auto_127838 ) ) ( not ( = ?auto_127830 ?auto_127831 ) ) ( not ( = ?auto_127830 ?auto_127832 ) ) ( not ( = ?auto_127830 ?auto_127833 ) ) ( not ( = ?auto_127830 ?auto_127834 ) ) ( not ( = ?auto_127830 ?auto_127835 ) ) ( not ( = ?auto_127830 ?auto_127836 ) ) ( not ( = ?auto_127830 ?auto_127837 ) ) ( not ( = ?auto_127830 ?auto_127838 ) ) ( not ( = ?auto_127831 ?auto_127832 ) ) ( not ( = ?auto_127831 ?auto_127833 ) ) ( not ( = ?auto_127831 ?auto_127834 ) ) ( not ( = ?auto_127831 ?auto_127835 ) ) ( not ( = ?auto_127831 ?auto_127836 ) ) ( not ( = ?auto_127831 ?auto_127837 ) ) ( not ( = ?auto_127831 ?auto_127838 ) ) ( not ( = ?auto_127832 ?auto_127833 ) ) ( not ( = ?auto_127832 ?auto_127834 ) ) ( not ( = ?auto_127832 ?auto_127835 ) ) ( not ( = ?auto_127832 ?auto_127836 ) ) ( not ( = ?auto_127832 ?auto_127837 ) ) ( not ( = ?auto_127832 ?auto_127838 ) ) ( not ( = ?auto_127833 ?auto_127834 ) ) ( not ( = ?auto_127833 ?auto_127835 ) ) ( not ( = ?auto_127833 ?auto_127836 ) ) ( not ( = ?auto_127833 ?auto_127837 ) ) ( not ( = ?auto_127833 ?auto_127838 ) ) ( not ( = ?auto_127834 ?auto_127835 ) ) ( not ( = ?auto_127834 ?auto_127836 ) ) ( not ( = ?auto_127834 ?auto_127837 ) ) ( not ( = ?auto_127834 ?auto_127838 ) ) ( not ( = ?auto_127835 ?auto_127836 ) ) ( not ( = ?auto_127835 ?auto_127837 ) ) ( not ( = ?auto_127835 ?auto_127838 ) ) ( not ( = ?auto_127836 ?auto_127837 ) ) ( not ( = ?auto_127836 ?auto_127838 ) ) ( not ( = ?auto_127837 ?auto_127838 ) ) ( ON ?auto_127836 ?auto_127837 ) ( ON ?auto_127835 ?auto_127836 ) ( ON ?auto_127834 ?auto_127835 ) ( ON ?auto_127833 ?auto_127834 ) ( ON ?auto_127832 ?auto_127833 ) ( ON ?auto_127831 ?auto_127832 ) ( ON ?auto_127830 ?auto_127831 ) ( CLEAR ?auto_127828 ) ( ON ?auto_127829 ?auto_127830 ) ( CLEAR ?auto_127829 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_127828 ?auto_127829 )
      ( MAKE-10PILE ?auto_127828 ?auto_127829 ?auto_127830 ?auto_127831 ?auto_127832 ?auto_127833 ?auto_127834 ?auto_127835 ?auto_127836 ?auto_127837 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_127849 - BLOCK
      ?auto_127850 - BLOCK
      ?auto_127851 - BLOCK
      ?auto_127852 - BLOCK
      ?auto_127853 - BLOCK
      ?auto_127854 - BLOCK
      ?auto_127855 - BLOCK
      ?auto_127856 - BLOCK
      ?auto_127857 - BLOCK
      ?auto_127858 - BLOCK
    )
    :vars
    (
      ?auto_127859 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127858 ?auto_127859 ) ( ON-TABLE ?auto_127849 ) ( not ( = ?auto_127849 ?auto_127850 ) ) ( not ( = ?auto_127849 ?auto_127851 ) ) ( not ( = ?auto_127849 ?auto_127852 ) ) ( not ( = ?auto_127849 ?auto_127853 ) ) ( not ( = ?auto_127849 ?auto_127854 ) ) ( not ( = ?auto_127849 ?auto_127855 ) ) ( not ( = ?auto_127849 ?auto_127856 ) ) ( not ( = ?auto_127849 ?auto_127857 ) ) ( not ( = ?auto_127849 ?auto_127858 ) ) ( not ( = ?auto_127849 ?auto_127859 ) ) ( not ( = ?auto_127850 ?auto_127851 ) ) ( not ( = ?auto_127850 ?auto_127852 ) ) ( not ( = ?auto_127850 ?auto_127853 ) ) ( not ( = ?auto_127850 ?auto_127854 ) ) ( not ( = ?auto_127850 ?auto_127855 ) ) ( not ( = ?auto_127850 ?auto_127856 ) ) ( not ( = ?auto_127850 ?auto_127857 ) ) ( not ( = ?auto_127850 ?auto_127858 ) ) ( not ( = ?auto_127850 ?auto_127859 ) ) ( not ( = ?auto_127851 ?auto_127852 ) ) ( not ( = ?auto_127851 ?auto_127853 ) ) ( not ( = ?auto_127851 ?auto_127854 ) ) ( not ( = ?auto_127851 ?auto_127855 ) ) ( not ( = ?auto_127851 ?auto_127856 ) ) ( not ( = ?auto_127851 ?auto_127857 ) ) ( not ( = ?auto_127851 ?auto_127858 ) ) ( not ( = ?auto_127851 ?auto_127859 ) ) ( not ( = ?auto_127852 ?auto_127853 ) ) ( not ( = ?auto_127852 ?auto_127854 ) ) ( not ( = ?auto_127852 ?auto_127855 ) ) ( not ( = ?auto_127852 ?auto_127856 ) ) ( not ( = ?auto_127852 ?auto_127857 ) ) ( not ( = ?auto_127852 ?auto_127858 ) ) ( not ( = ?auto_127852 ?auto_127859 ) ) ( not ( = ?auto_127853 ?auto_127854 ) ) ( not ( = ?auto_127853 ?auto_127855 ) ) ( not ( = ?auto_127853 ?auto_127856 ) ) ( not ( = ?auto_127853 ?auto_127857 ) ) ( not ( = ?auto_127853 ?auto_127858 ) ) ( not ( = ?auto_127853 ?auto_127859 ) ) ( not ( = ?auto_127854 ?auto_127855 ) ) ( not ( = ?auto_127854 ?auto_127856 ) ) ( not ( = ?auto_127854 ?auto_127857 ) ) ( not ( = ?auto_127854 ?auto_127858 ) ) ( not ( = ?auto_127854 ?auto_127859 ) ) ( not ( = ?auto_127855 ?auto_127856 ) ) ( not ( = ?auto_127855 ?auto_127857 ) ) ( not ( = ?auto_127855 ?auto_127858 ) ) ( not ( = ?auto_127855 ?auto_127859 ) ) ( not ( = ?auto_127856 ?auto_127857 ) ) ( not ( = ?auto_127856 ?auto_127858 ) ) ( not ( = ?auto_127856 ?auto_127859 ) ) ( not ( = ?auto_127857 ?auto_127858 ) ) ( not ( = ?auto_127857 ?auto_127859 ) ) ( not ( = ?auto_127858 ?auto_127859 ) ) ( ON ?auto_127857 ?auto_127858 ) ( ON ?auto_127856 ?auto_127857 ) ( ON ?auto_127855 ?auto_127856 ) ( ON ?auto_127854 ?auto_127855 ) ( ON ?auto_127853 ?auto_127854 ) ( ON ?auto_127852 ?auto_127853 ) ( ON ?auto_127851 ?auto_127852 ) ( CLEAR ?auto_127849 ) ( ON ?auto_127850 ?auto_127851 ) ( CLEAR ?auto_127850 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_127849 ?auto_127850 )
      ( MAKE-10PILE ?auto_127849 ?auto_127850 ?auto_127851 ?auto_127852 ?auto_127853 ?auto_127854 ?auto_127855 ?auto_127856 ?auto_127857 ?auto_127858 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_127870 - BLOCK
      ?auto_127871 - BLOCK
      ?auto_127872 - BLOCK
      ?auto_127873 - BLOCK
      ?auto_127874 - BLOCK
      ?auto_127875 - BLOCK
      ?auto_127876 - BLOCK
      ?auto_127877 - BLOCK
      ?auto_127878 - BLOCK
      ?auto_127879 - BLOCK
    )
    :vars
    (
      ?auto_127880 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127879 ?auto_127880 ) ( not ( = ?auto_127870 ?auto_127871 ) ) ( not ( = ?auto_127870 ?auto_127872 ) ) ( not ( = ?auto_127870 ?auto_127873 ) ) ( not ( = ?auto_127870 ?auto_127874 ) ) ( not ( = ?auto_127870 ?auto_127875 ) ) ( not ( = ?auto_127870 ?auto_127876 ) ) ( not ( = ?auto_127870 ?auto_127877 ) ) ( not ( = ?auto_127870 ?auto_127878 ) ) ( not ( = ?auto_127870 ?auto_127879 ) ) ( not ( = ?auto_127870 ?auto_127880 ) ) ( not ( = ?auto_127871 ?auto_127872 ) ) ( not ( = ?auto_127871 ?auto_127873 ) ) ( not ( = ?auto_127871 ?auto_127874 ) ) ( not ( = ?auto_127871 ?auto_127875 ) ) ( not ( = ?auto_127871 ?auto_127876 ) ) ( not ( = ?auto_127871 ?auto_127877 ) ) ( not ( = ?auto_127871 ?auto_127878 ) ) ( not ( = ?auto_127871 ?auto_127879 ) ) ( not ( = ?auto_127871 ?auto_127880 ) ) ( not ( = ?auto_127872 ?auto_127873 ) ) ( not ( = ?auto_127872 ?auto_127874 ) ) ( not ( = ?auto_127872 ?auto_127875 ) ) ( not ( = ?auto_127872 ?auto_127876 ) ) ( not ( = ?auto_127872 ?auto_127877 ) ) ( not ( = ?auto_127872 ?auto_127878 ) ) ( not ( = ?auto_127872 ?auto_127879 ) ) ( not ( = ?auto_127872 ?auto_127880 ) ) ( not ( = ?auto_127873 ?auto_127874 ) ) ( not ( = ?auto_127873 ?auto_127875 ) ) ( not ( = ?auto_127873 ?auto_127876 ) ) ( not ( = ?auto_127873 ?auto_127877 ) ) ( not ( = ?auto_127873 ?auto_127878 ) ) ( not ( = ?auto_127873 ?auto_127879 ) ) ( not ( = ?auto_127873 ?auto_127880 ) ) ( not ( = ?auto_127874 ?auto_127875 ) ) ( not ( = ?auto_127874 ?auto_127876 ) ) ( not ( = ?auto_127874 ?auto_127877 ) ) ( not ( = ?auto_127874 ?auto_127878 ) ) ( not ( = ?auto_127874 ?auto_127879 ) ) ( not ( = ?auto_127874 ?auto_127880 ) ) ( not ( = ?auto_127875 ?auto_127876 ) ) ( not ( = ?auto_127875 ?auto_127877 ) ) ( not ( = ?auto_127875 ?auto_127878 ) ) ( not ( = ?auto_127875 ?auto_127879 ) ) ( not ( = ?auto_127875 ?auto_127880 ) ) ( not ( = ?auto_127876 ?auto_127877 ) ) ( not ( = ?auto_127876 ?auto_127878 ) ) ( not ( = ?auto_127876 ?auto_127879 ) ) ( not ( = ?auto_127876 ?auto_127880 ) ) ( not ( = ?auto_127877 ?auto_127878 ) ) ( not ( = ?auto_127877 ?auto_127879 ) ) ( not ( = ?auto_127877 ?auto_127880 ) ) ( not ( = ?auto_127878 ?auto_127879 ) ) ( not ( = ?auto_127878 ?auto_127880 ) ) ( not ( = ?auto_127879 ?auto_127880 ) ) ( ON ?auto_127878 ?auto_127879 ) ( ON ?auto_127877 ?auto_127878 ) ( ON ?auto_127876 ?auto_127877 ) ( ON ?auto_127875 ?auto_127876 ) ( ON ?auto_127874 ?auto_127875 ) ( ON ?auto_127873 ?auto_127874 ) ( ON ?auto_127872 ?auto_127873 ) ( ON ?auto_127871 ?auto_127872 ) ( ON ?auto_127870 ?auto_127871 ) ( CLEAR ?auto_127870 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_127870 )
      ( MAKE-10PILE ?auto_127870 ?auto_127871 ?auto_127872 ?auto_127873 ?auto_127874 ?auto_127875 ?auto_127876 ?auto_127877 ?auto_127878 ?auto_127879 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_127891 - BLOCK
      ?auto_127892 - BLOCK
      ?auto_127893 - BLOCK
      ?auto_127894 - BLOCK
      ?auto_127895 - BLOCK
      ?auto_127896 - BLOCK
      ?auto_127897 - BLOCK
      ?auto_127898 - BLOCK
      ?auto_127899 - BLOCK
      ?auto_127900 - BLOCK
    )
    :vars
    (
      ?auto_127901 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127900 ?auto_127901 ) ( not ( = ?auto_127891 ?auto_127892 ) ) ( not ( = ?auto_127891 ?auto_127893 ) ) ( not ( = ?auto_127891 ?auto_127894 ) ) ( not ( = ?auto_127891 ?auto_127895 ) ) ( not ( = ?auto_127891 ?auto_127896 ) ) ( not ( = ?auto_127891 ?auto_127897 ) ) ( not ( = ?auto_127891 ?auto_127898 ) ) ( not ( = ?auto_127891 ?auto_127899 ) ) ( not ( = ?auto_127891 ?auto_127900 ) ) ( not ( = ?auto_127891 ?auto_127901 ) ) ( not ( = ?auto_127892 ?auto_127893 ) ) ( not ( = ?auto_127892 ?auto_127894 ) ) ( not ( = ?auto_127892 ?auto_127895 ) ) ( not ( = ?auto_127892 ?auto_127896 ) ) ( not ( = ?auto_127892 ?auto_127897 ) ) ( not ( = ?auto_127892 ?auto_127898 ) ) ( not ( = ?auto_127892 ?auto_127899 ) ) ( not ( = ?auto_127892 ?auto_127900 ) ) ( not ( = ?auto_127892 ?auto_127901 ) ) ( not ( = ?auto_127893 ?auto_127894 ) ) ( not ( = ?auto_127893 ?auto_127895 ) ) ( not ( = ?auto_127893 ?auto_127896 ) ) ( not ( = ?auto_127893 ?auto_127897 ) ) ( not ( = ?auto_127893 ?auto_127898 ) ) ( not ( = ?auto_127893 ?auto_127899 ) ) ( not ( = ?auto_127893 ?auto_127900 ) ) ( not ( = ?auto_127893 ?auto_127901 ) ) ( not ( = ?auto_127894 ?auto_127895 ) ) ( not ( = ?auto_127894 ?auto_127896 ) ) ( not ( = ?auto_127894 ?auto_127897 ) ) ( not ( = ?auto_127894 ?auto_127898 ) ) ( not ( = ?auto_127894 ?auto_127899 ) ) ( not ( = ?auto_127894 ?auto_127900 ) ) ( not ( = ?auto_127894 ?auto_127901 ) ) ( not ( = ?auto_127895 ?auto_127896 ) ) ( not ( = ?auto_127895 ?auto_127897 ) ) ( not ( = ?auto_127895 ?auto_127898 ) ) ( not ( = ?auto_127895 ?auto_127899 ) ) ( not ( = ?auto_127895 ?auto_127900 ) ) ( not ( = ?auto_127895 ?auto_127901 ) ) ( not ( = ?auto_127896 ?auto_127897 ) ) ( not ( = ?auto_127896 ?auto_127898 ) ) ( not ( = ?auto_127896 ?auto_127899 ) ) ( not ( = ?auto_127896 ?auto_127900 ) ) ( not ( = ?auto_127896 ?auto_127901 ) ) ( not ( = ?auto_127897 ?auto_127898 ) ) ( not ( = ?auto_127897 ?auto_127899 ) ) ( not ( = ?auto_127897 ?auto_127900 ) ) ( not ( = ?auto_127897 ?auto_127901 ) ) ( not ( = ?auto_127898 ?auto_127899 ) ) ( not ( = ?auto_127898 ?auto_127900 ) ) ( not ( = ?auto_127898 ?auto_127901 ) ) ( not ( = ?auto_127899 ?auto_127900 ) ) ( not ( = ?auto_127899 ?auto_127901 ) ) ( not ( = ?auto_127900 ?auto_127901 ) ) ( ON ?auto_127899 ?auto_127900 ) ( ON ?auto_127898 ?auto_127899 ) ( ON ?auto_127897 ?auto_127898 ) ( ON ?auto_127896 ?auto_127897 ) ( ON ?auto_127895 ?auto_127896 ) ( ON ?auto_127894 ?auto_127895 ) ( ON ?auto_127893 ?auto_127894 ) ( ON ?auto_127892 ?auto_127893 ) ( ON ?auto_127891 ?auto_127892 ) ( CLEAR ?auto_127891 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_127891 )
      ( MAKE-10PILE ?auto_127891 ?auto_127892 ?auto_127893 ?auto_127894 ?auto_127895 ?auto_127896 ?auto_127897 ?auto_127898 ?auto_127899 ?auto_127900 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_127913 - BLOCK
      ?auto_127914 - BLOCK
      ?auto_127915 - BLOCK
      ?auto_127916 - BLOCK
      ?auto_127917 - BLOCK
      ?auto_127918 - BLOCK
      ?auto_127919 - BLOCK
      ?auto_127920 - BLOCK
      ?auto_127921 - BLOCK
      ?auto_127922 - BLOCK
      ?auto_127923 - BLOCK
    )
    :vars
    (
      ?auto_127924 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_127922 ) ( ON ?auto_127923 ?auto_127924 ) ( CLEAR ?auto_127923 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_127913 ) ( ON ?auto_127914 ?auto_127913 ) ( ON ?auto_127915 ?auto_127914 ) ( ON ?auto_127916 ?auto_127915 ) ( ON ?auto_127917 ?auto_127916 ) ( ON ?auto_127918 ?auto_127917 ) ( ON ?auto_127919 ?auto_127918 ) ( ON ?auto_127920 ?auto_127919 ) ( ON ?auto_127921 ?auto_127920 ) ( ON ?auto_127922 ?auto_127921 ) ( not ( = ?auto_127913 ?auto_127914 ) ) ( not ( = ?auto_127913 ?auto_127915 ) ) ( not ( = ?auto_127913 ?auto_127916 ) ) ( not ( = ?auto_127913 ?auto_127917 ) ) ( not ( = ?auto_127913 ?auto_127918 ) ) ( not ( = ?auto_127913 ?auto_127919 ) ) ( not ( = ?auto_127913 ?auto_127920 ) ) ( not ( = ?auto_127913 ?auto_127921 ) ) ( not ( = ?auto_127913 ?auto_127922 ) ) ( not ( = ?auto_127913 ?auto_127923 ) ) ( not ( = ?auto_127913 ?auto_127924 ) ) ( not ( = ?auto_127914 ?auto_127915 ) ) ( not ( = ?auto_127914 ?auto_127916 ) ) ( not ( = ?auto_127914 ?auto_127917 ) ) ( not ( = ?auto_127914 ?auto_127918 ) ) ( not ( = ?auto_127914 ?auto_127919 ) ) ( not ( = ?auto_127914 ?auto_127920 ) ) ( not ( = ?auto_127914 ?auto_127921 ) ) ( not ( = ?auto_127914 ?auto_127922 ) ) ( not ( = ?auto_127914 ?auto_127923 ) ) ( not ( = ?auto_127914 ?auto_127924 ) ) ( not ( = ?auto_127915 ?auto_127916 ) ) ( not ( = ?auto_127915 ?auto_127917 ) ) ( not ( = ?auto_127915 ?auto_127918 ) ) ( not ( = ?auto_127915 ?auto_127919 ) ) ( not ( = ?auto_127915 ?auto_127920 ) ) ( not ( = ?auto_127915 ?auto_127921 ) ) ( not ( = ?auto_127915 ?auto_127922 ) ) ( not ( = ?auto_127915 ?auto_127923 ) ) ( not ( = ?auto_127915 ?auto_127924 ) ) ( not ( = ?auto_127916 ?auto_127917 ) ) ( not ( = ?auto_127916 ?auto_127918 ) ) ( not ( = ?auto_127916 ?auto_127919 ) ) ( not ( = ?auto_127916 ?auto_127920 ) ) ( not ( = ?auto_127916 ?auto_127921 ) ) ( not ( = ?auto_127916 ?auto_127922 ) ) ( not ( = ?auto_127916 ?auto_127923 ) ) ( not ( = ?auto_127916 ?auto_127924 ) ) ( not ( = ?auto_127917 ?auto_127918 ) ) ( not ( = ?auto_127917 ?auto_127919 ) ) ( not ( = ?auto_127917 ?auto_127920 ) ) ( not ( = ?auto_127917 ?auto_127921 ) ) ( not ( = ?auto_127917 ?auto_127922 ) ) ( not ( = ?auto_127917 ?auto_127923 ) ) ( not ( = ?auto_127917 ?auto_127924 ) ) ( not ( = ?auto_127918 ?auto_127919 ) ) ( not ( = ?auto_127918 ?auto_127920 ) ) ( not ( = ?auto_127918 ?auto_127921 ) ) ( not ( = ?auto_127918 ?auto_127922 ) ) ( not ( = ?auto_127918 ?auto_127923 ) ) ( not ( = ?auto_127918 ?auto_127924 ) ) ( not ( = ?auto_127919 ?auto_127920 ) ) ( not ( = ?auto_127919 ?auto_127921 ) ) ( not ( = ?auto_127919 ?auto_127922 ) ) ( not ( = ?auto_127919 ?auto_127923 ) ) ( not ( = ?auto_127919 ?auto_127924 ) ) ( not ( = ?auto_127920 ?auto_127921 ) ) ( not ( = ?auto_127920 ?auto_127922 ) ) ( not ( = ?auto_127920 ?auto_127923 ) ) ( not ( = ?auto_127920 ?auto_127924 ) ) ( not ( = ?auto_127921 ?auto_127922 ) ) ( not ( = ?auto_127921 ?auto_127923 ) ) ( not ( = ?auto_127921 ?auto_127924 ) ) ( not ( = ?auto_127922 ?auto_127923 ) ) ( not ( = ?auto_127922 ?auto_127924 ) ) ( not ( = ?auto_127923 ?auto_127924 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_127923 ?auto_127924 )
      ( !STACK ?auto_127923 ?auto_127922 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_127936 - BLOCK
      ?auto_127937 - BLOCK
      ?auto_127938 - BLOCK
      ?auto_127939 - BLOCK
      ?auto_127940 - BLOCK
      ?auto_127941 - BLOCK
      ?auto_127942 - BLOCK
      ?auto_127943 - BLOCK
      ?auto_127944 - BLOCK
      ?auto_127945 - BLOCK
      ?auto_127946 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_127945 ) ( ON-TABLE ?auto_127946 ) ( CLEAR ?auto_127946 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_127936 ) ( ON ?auto_127937 ?auto_127936 ) ( ON ?auto_127938 ?auto_127937 ) ( ON ?auto_127939 ?auto_127938 ) ( ON ?auto_127940 ?auto_127939 ) ( ON ?auto_127941 ?auto_127940 ) ( ON ?auto_127942 ?auto_127941 ) ( ON ?auto_127943 ?auto_127942 ) ( ON ?auto_127944 ?auto_127943 ) ( ON ?auto_127945 ?auto_127944 ) ( not ( = ?auto_127936 ?auto_127937 ) ) ( not ( = ?auto_127936 ?auto_127938 ) ) ( not ( = ?auto_127936 ?auto_127939 ) ) ( not ( = ?auto_127936 ?auto_127940 ) ) ( not ( = ?auto_127936 ?auto_127941 ) ) ( not ( = ?auto_127936 ?auto_127942 ) ) ( not ( = ?auto_127936 ?auto_127943 ) ) ( not ( = ?auto_127936 ?auto_127944 ) ) ( not ( = ?auto_127936 ?auto_127945 ) ) ( not ( = ?auto_127936 ?auto_127946 ) ) ( not ( = ?auto_127937 ?auto_127938 ) ) ( not ( = ?auto_127937 ?auto_127939 ) ) ( not ( = ?auto_127937 ?auto_127940 ) ) ( not ( = ?auto_127937 ?auto_127941 ) ) ( not ( = ?auto_127937 ?auto_127942 ) ) ( not ( = ?auto_127937 ?auto_127943 ) ) ( not ( = ?auto_127937 ?auto_127944 ) ) ( not ( = ?auto_127937 ?auto_127945 ) ) ( not ( = ?auto_127937 ?auto_127946 ) ) ( not ( = ?auto_127938 ?auto_127939 ) ) ( not ( = ?auto_127938 ?auto_127940 ) ) ( not ( = ?auto_127938 ?auto_127941 ) ) ( not ( = ?auto_127938 ?auto_127942 ) ) ( not ( = ?auto_127938 ?auto_127943 ) ) ( not ( = ?auto_127938 ?auto_127944 ) ) ( not ( = ?auto_127938 ?auto_127945 ) ) ( not ( = ?auto_127938 ?auto_127946 ) ) ( not ( = ?auto_127939 ?auto_127940 ) ) ( not ( = ?auto_127939 ?auto_127941 ) ) ( not ( = ?auto_127939 ?auto_127942 ) ) ( not ( = ?auto_127939 ?auto_127943 ) ) ( not ( = ?auto_127939 ?auto_127944 ) ) ( not ( = ?auto_127939 ?auto_127945 ) ) ( not ( = ?auto_127939 ?auto_127946 ) ) ( not ( = ?auto_127940 ?auto_127941 ) ) ( not ( = ?auto_127940 ?auto_127942 ) ) ( not ( = ?auto_127940 ?auto_127943 ) ) ( not ( = ?auto_127940 ?auto_127944 ) ) ( not ( = ?auto_127940 ?auto_127945 ) ) ( not ( = ?auto_127940 ?auto_127946 ) ) ( not ( = ?auto_127941 ?auto_127942 ) ) ( not ( = ?auto_127941 ?auto_127943 ) ) ( not ( = ?auto_127941 ?auto_127944 ) ) ( not ( = ?auto_127941 ?auto_127945 ) ) ( not ( = ?auto_127941 ?auto_127946 ) ) ( not ( = ?auto_127942 ?auto_127943 ) ) ( not ( = ?auto_127942 ?auto_127944 ) ) ( not ( = ?auto_127942 ?auto_127945 ) ) ( not ( = ?auto_127942 ?auto_127946 ) ) ( not ( = ?auto_127943 ?auto_127944 ) ) ( not ( = ?auto_127943 ?auto_127945 ) ) ( not ( = ?auto_127943 ?auto_127946 ) ) ( not ( = ?auto_127944 ?auto_127945 ) ) ( not ( = ?auto_127944 ?auto_127946 ) ) ( not ( = ?auto_127945 ?auto_127946 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_127946 )
      ( !STACK ?auto_127946 ?auto_127945 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_127958 - BLOCK
      ?auto_127959 - BLOCK
      ?auto_127960 - BLOCK
      ?auto_127961 - BLOCK
      ?auto_127962 - BLOCK
      ?auto_127963 - BLOCK
      ?auto_127964 - BLOCK
      ?auto_127965 - BLOCK
      ?auto_127966 - BLOCK
      ?auto_127967 - BLOCK
      ?auto_127968 - BLOCK
    )
    :vars
    (
      ?auto_127969 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127968 ?auto_127969 ) ( ON-TABLE ?auto_127958 ) ( ON ?auto_127959 ?auto_127958 ) ( ON ?auto_127960 ?auto_127959 ) ( ON ?auto_127961 ?auto_127960 ) ( ON ?auto_127962 ?auto_127961 ) ( ON ?auto_127963 ?auto_127962 ) ( ON ?auto_127964 ?auto_127963 ) ( ON ?auto_127965 ?auto_127964 ) ( ON ?auto_127966 ?auto_127965 ) ( not ( = ?auto_127958 ?auto_127959 ) ) ( not ( = ?auto_127958 ?auto_127960 ) ) ( not ( = ?auto_127958 ?auto_127961 ) ) ( not ( = ?auto_127958 ?auto_127962 ) ) ( not ( = ?auto_127958 ?auto_127963 ) ) ( not ( = ?auto_127958 ?auto_127964 ) ) ( not ( = ?auto_127958 ?auto_127965 ) ) ( not ( = ?auto_127958 ?auto_127966 ) ) ( not ( = ?auto_127958 ?auto_127967 ) ) ( not ( = ?auto_127958 ?auto_127968 ) ) ( not ( = ?auto_127958 ?auto_127969 ) ) ( not ( = ?auto_127959 ?auto_127960 ) ) ( not ( = ?auto_127959 ?auto_127961 ) ) ( not ( = ?auto_127959 ?auto_127962 ) ) ( not ( = ?auto_127959 ?auto_127963 ) ) ( not ( = ?auto_127959 ?auto_127964 ) ) ( not ( = ?auto_127959 ?auto_127965 ) ) ( not ( = ?auto_127959 ?auto_127966 ) ) ( not ( = ?auto_127959 ?auto_127967 ) ) ( not ( = ?auto_127959 ?auto_127968 ) ) ( not ( = ?auto_127959 ?auto_127969 ) ) ( not ( = ?auto_127960 ?auto_127961 ) ) ( not ( = ?auto_127960 ?auto_127962 ) ) ( not ( = ?auto_127960 ?auto_127963 ) ) ( not ( = ?auto_127960 ?auto_127964 ) ) ( not ( = ?auto_127960 ?auto_127965 ) ) ( not ( = ?auto_127960 ?auto_127966 ) ) ( not ( = ?auto_127960 ?auto_127967 ) ) ( not ( = ?auto_127960 ?auto_127968 ) ) ( not ( = ?auto_127960 ?auto_127969 ) ) ( not ( = ?auto_127961 ?auto_127962 ) ) ( not ( = ?auto_127961 ?auto_127963 ) ) ( not ( = ?auto_127961 ?auto_127964 ) ) ( not ( = ?auto_127961 ?auto_127965 ) ) ( not ( = ?auto_127961 ?auto_127966 ) ) ( not ( = ?auto_127961 ?auto_127967 ) ) ( not ( = ?auto_127961 ?auto_127968 ) ) ( not ( = ?auto_127961 ?auto_127969 ) ) ( not ( = ?auto_127962 ?auto_127963 ) ) ( not ( = ?auto_127962 ?auto_127964 ) ) ( not ( = ?auto_127962 ?auto_127965 ) ) ( not ( = ?auto_127962 ?auto_127966 ) ) ( not ( = ?auto_127962 ?auto_127967 ) ) ( not ( = ?auto_127962 ?auto_127968 ) ) ( not ( = ?auto_127962 ?auto_127969 ) ) ( not ( = ?auto_127963 ?auto_127964 ) ) ( not ( = ?auto_127963 ?auto_127965 ) ) ( not ( = ?auto_127963 ?auto_127966 ) ) ( not ( = ?auto_127963 ?auto_127967 ) ) ( not ( = ?auto_127963 ?auto_127968 ) ) ( not ( = ?auto_127963 ?auto_127969 ) ) ( not ( = ?auto_127964 ?auto_127965 ) ) ( not ( = ?auto_127964 ?auto_127966 ) ) ( not ( = ?auto_127964 ?auto_127967 ) ) ( not ( = ?auto_127964 ?auto_127968 ) ) ( not ( = ?auto_127964 ?auto_127969 ) ) ( not ( = ?auto_127965 ?auto_127966 ) ) ( not ( = ?auto_127965 ?auto_127967 ) ) ( not ( = ?auto_127965 ?auto_127968 ) ) ( not ( = ?auto_127965 ?auto_127969 ) ) ( not ( = ?auto_127966 ?auto_127967 ) ) ( not ( = ?auto_127966 ?auto_127968 ) ) ( not ( = ?auto_127966 ?auto_127969 ) ) ( not ( = ?auto_127967 ?auto_127968 ) ) ( not ( = ?auto_127967 ?auto_127969 ) ) ( not ( = ?auto_127968 ?auto_127969 ) ) ( CLEAR ?auto_127966 ) ( ON ?auto_127967 ?auto_127968 ) ( CLEAR ?auto_127967 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_127958 ?auto_127959 ?auto_127960 ?auto_127961 ?auto_127962 ?auto_127963 ?auto_127964 ?auto_127965 ?auto_127966 ?auto_127967 )
      ( MAKE-11PILE ?auto_127958 ?auto_127959 ?auto_127960 ?auto_127961 ?auto_127962 ?auto_127963 ?auto_127964 ?auto_127965 ?auto_127966 ?auto_127967 ?auto_127968 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_127981 - BLOCK
      ?auto_127982 - BLOCK
      ?auto_127983 - BLOCK
      ?auto_127984 - BLOCK
      ?auto_127985 - BLOCK
      ?auto_127986 - BLOCK
      ?auto_127987 - BLOCK
      ?auto_127988 - BLOCK
      ?auto_127989 - BLOCK
      ?auto_127990 - BLOCK
      ?auto_127991 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_127991 ) ( ON-TABLE ?auto_127981 ) ( ON ?auto_127982 ?auto_127981 ) ( ON ?auto_127983 ?auto_127982 ) ( ON ?auto_127984 ?auto_127983 ) ( ON ?auto_127985 ?auto_127984 ) ( ON ?auto_127986 ?auto_127985 ) ( ON ?auto_127987 ?auto_127986 ) ( ON ?auto_127988 ?auto_127987 ) ( ON ?auto_127989 ?auto_127988 ) ( not ( = ?auto_127981 ?auto_127982 ) ) ( not ( = ?auto_127981 ?auto_127983 ) ) ( not ( = ?auto_127981 ?auto_127984 ) ) ( not ( = ?auto_127981 ?auto_127985 ) ) ( not ( = ?auto_127981 ?auto_127986 ) ) ( not ( = ?auto_127981 ?auto_127987 ) ) ( not ( = ?auto_127981 ?auto_127988 ) ) ( not ( = ?auto_127981 ?auto_127989 ) ) ( not ( = ?auto_127981 ?auto_127990 ) ) ( not ( = ?auto_127981 ?auto_127991 ) ) ( not ( = ?auto_127982 ?auto_127983 ) ) ( not ( = ?auto_127982 ?auto_127984 ) ) ( not ( = ?auto_127982 ?auto_127985 ) ) ( not ( = ?auto_127982 ?auto_127986 ) ) ( not ( = ?auto_127982 ?auto_127987 ) ) ( not ( = ?auto_127982 ?auto_127988 ) ) ( not ( = ?auto_127982 ?auto_127989 ) ) ( not ( = ?auto_127982 ?auto_127990 ) ) ( not ( = ?auto_127982 ?auto_127991 ) ) ( not ( = ?auto_127983 ?auto_127984 ) ) ( not ( = ?auto_127983 ?auto_127985 ) ) ( not ( = ?auto_127983 ?auto_127986 ) ) ( not ( = ?auto_127983 ?auto_127987 ) ) ( not ( = ?auto_127983 ?auto_127988 ) ) ( not ( = ?auto_127983 ?auto_127989 ) ) ( not ( = ?auto_127983 ?auto_127990 ) ) ( not ( = ?auto_127983 ?auto_127991 ) ) ( not ( = ?auto_127984 ?auto_127985 ) ) ( not ( = ?auto_127984 ?auto_127986 ) ) ( not ( = ?auto_127984 ?auto_127987 ) ) ( not ( = ?auto_127984 ?auto_127988 ) ) ( not ( = ?auto_127984 ?auto_127989 ) ) ( not ( = ?auto_127984 ?auto_127990 ) ) ( not ( = ?auto_127984 ?auto_127991 ) ) ( not ( = ?auto_127985 ?auto_127986 ) ) ( not ( = ?auto_127985 ?auto_127987 ) ) ( not ( = ?auto_127985 ?auto_127988 ) ) ( not ( = ?auto_127985 ?auto_127989 ) ) ( not ( = ?auto_127985 ?auto_127990 ) ) ( not ( = ?auto_127985 ?auto_127991 ) ) ( not ( = ?auto_127986 ?auto_127987 ) ) ( not ( = ?auto_127986 ?auto_127988 ) ) ( not ( = ?auto_127986 ?auto_127989 ) ) ( not ( = ?auto_127986 ?auto_127990 ) ) ( not ( = ?auto_127986 ?auto_127991 ) ) ( not ( = ?auto_127987 ?auto_127988 ) ) ( not ( = ?auto_127987 ?auto_127989 ) ) ( not ( = ?auto_127987 ?auto_127990 ) ) ( not ( = ?auto_127987 ?auto_127991 ) ) ( not ( = ?auto_127988 ?auto_127989 ) ) ( not ( = ?auto_127988 ?auto_127990 ) ) ( not ( = ?auto_127988 ?auto_127991 ) ) ( not ( = ?auto_127989 ?auto_127990 ) ) ( not ( = ?auto_127989 ?auto_127991 ) ) ( not ( = ?auto_127990 ?auto_127991 ) ) ( CLEAR ?auto_127989 ) ( ON ?auto_127990 ?auto_127991 ) ( CLEAR ?auto_127990 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_127981 ?auto_127982 ?auto_127983 ?auto_127984 ?auto_127985 ?auto_127986 ?auto_127987 ?auto_127988 ?auto_127989 ?auto_127990 )
      ( MAKE-11PILE ?auto_127981 ?auto_127982 ?auto_127983 ?auto_127984 ?auto_127985 ?auto_127986 ?auto_127987 ?auto_127988 ?auto_127989 ?auto_127990 ?auto_127991 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_128003 - BLOCK
      ?auto_128004 - BLOCK
      ?auto_128005 - BLOCK
      ?auto_128006 - BLOCK
      ?auto_128007 - BLOCK
      ?auto_128008 - BLOCK
      ?auto_128009 - BLOCK
      ?auto_128010 - BLOCK
      ?auto_128011 - BLOCK
      ?auto_128012 - BLOCK
      ?auto_128013 - BLOCK
    )
    :vars
    (
      ?auto_128014 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128013 ?auto_128014 ) ( ON-TABLE ?auto_128003 ) ( ON ?auto_128004 ?auto_128003 ) ( ON ?auto_128005 ?auto_128004 ) ( ON ?auto_128006 ?auto_128005 ) ( ON ?auto_128007 ?auto_128006 ) ( ON ?auto_128008 ?auto_128007 ) ( ON ?auto_128009 ?auto_128008 ) ( ON ?auto_128010 ?auto_128009 ) ( not ( = ?auto_128003 ?auto_128004 ) ) ( not ( = ?auto_128003 ?auto_128005 ) ) ( not ( = ?auto_128003 ?auto_128006 ) ) ( not ( = ?auto_128003 ?auto_128007 ) ) ( not ( = ?auto_128003 ?auto_128008 ) ) ( not ( = ?auto_128003 ?auto_128009 ) ) ( not ( = ?auto_128003 ?auto_128010 ) ) ( not ( = ?auto_128003 ?auto_128011 ) ) ( not ( = ?auto_128003 ?auto_128012 ) ) ( not ( = ?auto_128003 ?auto_128013 ) ) ( not ( = ?auto_128003 ?auto_128014 ) ) ( not ( = ?auto_128004 ?auto_128005 ) ) ( not ( = ?auto_128004 ?auto_128006 ) ) ( not ( = ?auto_128004 ?auto_128007 ) ) ( not ( = ?auto_128004 ?auto_128008 ) ) ( not ( = ?auto_128004 ?auto_128009 ) ) ( not ( = ?auto_128004 ?auto_128010 ) ) ( not ( = ?auto_128004 ?auto_128011 ) ) ( not ( = ?auto_128004 ?auto_128012 ) ) ( not ( = ?auto_128004 ?auto_128013 ) ) ( not ( = ?auto_128004 ?auto_128014 ) ) ( not ( = ?auto_128005 ?auto_128006 ) ) ( not ( = ?auto_128005 ?auto_128007 ) ) ( not ( = ?auto_128005 ?auto_128008 ) ) ( not ( = ?auto_128005 ?auto_128009 ) ) ( not ( = ?auto_128005 ?auto_128010 ) ) ( not ( = ?auto_128005 ?auto_128011 ) ) ( not ( = ?auto_128005 ?auto_128012 ) ) ( not ( = ?auto_128005 ?auto_128013 ) ) ( not ( = ?auto_128005 ?auto_128014 ) ) ( not ( = ?auto_128006 ?auto_128007 ) ) ( not ( = ?auto_128006 ?auto_128008 ) ) ( not ( = ?auto_128006 ?auto_128009 ) ) ( not ( = ?auto_128006 ?auto_128010 ) ) ( not ( = ?auto_128006 ?auto_128011 ) ) ( not ( = ?auto_128006 ?auto_128012 ) ) ( not ( = ?auto_128006 ?auto_128013 ) ) ( not ( = ?auto_128006 ?auto_128014 ) ) ( not ( = ?auto_128007 ?auto_128008 ) ) ( not ( = ?auto_128007 ?auto_128009 ) ) ( not ( = ?auto_128007 ?auto_128010 ) ) ( not ( = ?auto_128007 ?auto_128011 ) ) ( not ( = ?auto_128007 ?auto_128012 ) ) ( not ( = ?auto_128007 ?auto_128013 ) ) ( not ( = ?auto_128007 ?auto_128014 ) ) ( not ( = ?auto_128008 ?auto_128009 ) ) ( not ( = ?auto_128008 ?auto_128010 ) ) ( not ( = ?auto_128008 ?auto_128011 ) ) ( not ( = ?auto_128008 ?auto_128012 ) ) ( not ( = ?auto_128008 ?auto_128013 ) ) ( not ( = ?auto_128008 ?auto_128014 ) ) ( not ( = ?auto_128009 ?auto_128010 ) ) ( not ( = ?auto_128009 ?auto_128011 ) ) ( not ( = ?auto_128009 ?auto_128012 ) ) ( not ( = ?auto_128009 ?auto_128013 ) ) ( not ( = ?auto_128009 ?auto_128014 ) ) ( not ( = ?auto_128010 ?auto_128011 ) ) ( not ( = ?auto_128010 ?auto_128012 ) ) ( not ( = ?auto_128010 ?auto_128013 ) ) ( not ( = ?auto_128010 ?auto_128014 ) ) ( not ( = ?auto_128011 ?auto_128012 ) ) ( not ( = ?auto_128011 ?auto_128013 ) ) ( not ( = ?auto_128011 ?auto_128014 ) ) ( not ( = ?auto_128012 ?auto_128013 ) ) ( not ( = ?auto_128012 ?auto_128014 ) ) ( not ( = ?auto_128013 ?auto_128014 ) ) ( ON ?auto_128012 ?auto_128013 ) ( CLEAR ?auto_128010 ) ( ON ?auto_128011 ?auto_128012 ) ( CLEAR ?auto_128011 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_128003 ?auto_128004 ?auto_128005 ?auto_128006 ?auto_128007 ?auto_128008 ?auto_128009 ?auto_128010 ?auto_128011 )
      ( MAKE-11PILE ?auto_128003 ?auto_128004 ?auto_128005 ?auto_128006 ?auto_128007 ?auto_128008 ?auto_128009 ?auto_128010 ?auto_128011 ?auto_128012 ?auto_128013 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_128026 - BLOCK
      ?auto_128027 - BLOCK
      ?auto_128028 - BLOCK
      ?auto_128029 - BLOCK
      ?auto_128030 - BLOCK
      ?auto_128031 - BLOCK
      ?auto_128032 - BLOCK
      ?auto_128033 - BLOCK
      ?auto_128034 - BLOCK
      ?auto_128035 - BLOCK
      ?auto_128036 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_128036 ) ( ON-TABLE ?auto_128026 ) ( ON ?auto_128027 ?auto_128026 ) ( ON ?auto_128028 ?auto_128027 ) ( ON ?auto_128029 ?auto_128028 ) ( ON ?auto_128030 ?auto_128029 ) ( ON ?auto_128031 ?auto_128030 ) ( ON ?auto_128032 ?auto_128031 ) ( ON ?auto_128033 ?auto_128032 ) ( not ( = ?auto_128026 ?auto_128027 ) ) ( not ( = ?auto_128026 ?auto_128028 ) ) ( not ( = ?auto_128026 ?auto_128029 ) ) ( not ( = ?auto_128026 ?auto_128030 ) ) ( not ( = ?auto_128026 ?auto_128031 ) ) ( not ( = ?auto_128026 ?auto_128032 ) ) ( not ( = ?auto_128026 ?auto_128033 ) ) ( not ( = ?auto_128026 ?auto_128034 ) ) ( not ( = ?auto_128026 ?auto_128035 ) ) ( not ( = ?auto_128026 ?auto_128036 ) ) ( not ( = ?auto_128027 ?auto_128028 ) ) ( not ( = ?auto_128027 ?auto_128029 ) ) ( not ( = ?auto_128027 ?auto_128030 ) ) ( not ( = ?auto_128027 ?auto_128031 ) ) ( not ( = ?auto_128027 ?auto_128032 ) ) ( not ( = ?auto_128027 ?auto_128033 ) ) ( not ( = ?auto_128027 ?auto_128034 ) ) ( not ( = ?auto_128027 ?auto_128035 ) ) ( not ( = ?auto_128027 ?auto_128036 ) ) ( not ( = ?auto_128028 ?auto_128029 ) ) ( not ( = ?auto_128028 ?auto_128030 ) ) ( not ( = ?auto_128028 ?auto_128031 ) ) ( not ( = ?auto_128028 ?auto_128032 ) ) ( not ( = ?auto_128028 ?auto_128033 ) ) ( not ( = ?auto_128028 ?auto_128034 ) ) ( not ( = ?auto_128028 ?auto_128035 ) ) ( not ( = ?auto_128028 ?auto_128036 ) ) ( not ( = ?auto_128029 ?auto_128030 ) ) ( not ( = ?auto_128029 ?auto_128031 ) ) ( not ( = ?auto_128029 ?auto_128032 ) ) ( not ( = ?auto_128029 ?auto_128033 ) ) ( not ( = ?auto_128029 ?auto_128034 ) ) ( not ( = ?auto_128029 ?auto_128035 ) ) ( not ( = ?auto_128029 ?auto_128036 ) ) ( not ( = ?auto_128030 ?auto_128031 ) ) ( not ( = ?auto_128030 ?auto_128032 ) ) ( not ( = ?auto_128030 ?auto_128033 ) ) ( not ( = ?auto_128030 ?auto_128034 ) ) ( not ( = ?auto_128030 ?auto_128035 ) ) ( not ( = ?auto_128030 ?auto_128036 ) ) ( not ( = ?auto_128031 ?auto_128032 ) ) ( not ( = ?auto_128031 ?auto_128033 ) ) ( not ( = ?auto_128031 ?auto_128034 ) ) ( not ( = ?auto_128031 ?auto_128035 ) ) ( not ( = ?auto_128031 ?auto_128036 ) ) ( not ( = ?auto_128032 ?auto_128033 ) ) ( not ( = ?auto_128032 ?auto_128034 ) ) ( not ( = ?auto_128032 ?auto_128035 ) ) ( not ( = ?auto_128032 ?auto_128036 ) ) ( not ( = ?auto_128033 ?auto_128034 ) ) ( not ( = ?auto_128033 ?auto_128035 ) ) ( not ( = ?auto_128033 ?auto_128036 ) ) ( not ( = ?auto_128034 ?auto_128035 ) ) ( not ( = ?auto_128034 ?auto_128036 ) ) ( not ( = ?auto_128035 ?auto_128036 ) ) ( ON ?auto_128035 ?auto_128036 ) ( CLEAR ?auto_128033 ) ( ON ?auto_128034 ?auto_128035 ) ( CLEAR ?auto_128034 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_128026 ?auto_128027 ?auto_128028 ?auto_128029 ?auto_128030 ?auto_128031 ?auto_128032 ?auto_128033 ?auto_128034 )
      ( MAKE-11PILE ?auto_128026 ?auto_128027 ?auto_128028 ?auto_128029 ?auto_128030 ?auto_128031 ?auto_128032 ?auto_128033 ?auto_128034 ?auto_128035 ?auto_128036 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_128048 - BLOCK
      ?auto_128049 - BLOCK
      ?auto_128050 - BLOCK
      ?auto_128051 - BLOCK
      ?auto_128052 - BLOCK
      ?auto_128053 - BLOCK
      ?auto_128054 - BLOCK
      ?auto_128055 - BLOCK
      ?auto_128056 - BLOCK
      ?auto_128057 - BLOCK
      ?auto_128058 - BLOCK
    )
    :vars
    (
      ?auto_128059 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128058 ?auto_128059 ) ( ON-TABLE ?auto_128048 ) ( ON ?auto_128049 ?auto_128048 ) ( ON ?auto_128050 ?auto_128049 ) ( ON ?auto_128051 ?auto_128050 ) ( ON ?auto_128052 ?auto_128051 ) ( ON ?auto_128053 ?auto_128052 ) ( ON ?auto_128054 ?auto_128053 ) ( not ( = ?auto_128048 ?auto_128049 ) ) ( not ( = ?auto_128048 ?auto_128050 ) ) ( not ( = ?auto_128048 ?auto_128051 ) ) ( not ( = ?auto_128048 ?auto_128052 ) ) ( not ( = ?auto_128048 ?auto_128053 ) ) ( not ( = ?auto_128048 ?auto_128054 ) ) ( not ( = ?auto_128048 ?auto_128055 ) ) ( not ( = ?auto_128048 ?auto_128056 ) ) ( not ( = ?auto_128048 ?auto_128057 ) ) ( not ( = ?auto_128048 ?auto_128058 ) ) ( not ( = ?auto_128048 ?auto_128059 ) ) ( not ( = ?auto_128049 ?auto_128050 ) ) ( not ( = ?auto_128049 ?auto_128051 ) ) ( not ( = ?auto_128049 ?auto_128052 ) ) ( not ( = ?auto_128049 ?auto_128053 ) ) ( not ( = ?auto_128049 ?auto_128054 ) ) ( not ( = ?auto_128049 ?auto_128055 ) ) ( not ( = ?auto_128049 ?auto_128056 ) ) ( not ( = ?auto_128049 ?auto_128057 ) ) ( not ( = ?auto_128049 ?auto_128058 ) ) ( not ( = ?auto_128049 ?auto_128059 ) ) ( not ( = ?auto_128050 ?auto_128051 ) ) ( not ( = ?auto_128050 ?auto_128052 ) ) ( not ( = ?auto_128050 ?auto_128053 ) ) ( not ( = ?auto_128050 ?auto_128054 ) ) ( not ( = ?auto_128050 ?auto_128055 ) ) ( not ( = ?auto_128050 ?auto_128056 ) ) ( not ( = ?auto_128050 ?auto_128057 ) ) ( not ( = ?auto_128050 ?auto_128058 ) ) ( not ( = ?auto_128050 ?auto_128059 ) ) ( not ( = ?auto_128051 ?auto_128052 ) ) ( not ( = ?auto_128051 ?auto_128053 ) ) ( not ( = ?auto_128051 ?auto_128054 ) ) ( not ( = ?auto_128051 ?auto_128055 ) ) ( not ( = ?auto_128051 ?auto_128056 ) ) ( not ( = ?auto_128051 ?auto_128057 ) ) ( not ( = ?auto_128051 ?auto_128058 ) ) ( not ( = ?auto_128051 ?auto_128059 ) ) ( not ( = ?auto_128052 ?auto_128053 ) ) ( not ( = ?auto_128052 ?auto_128054 ) ) ( not ( = ?auto_128052 ?auto_128055 ) ) ( not ( = ?auto_128052 ?auto_128056 ) ) ( not ( = ?auto_128052 ?auto_128057 ) ) ( not ( = ?auto_128052 ?auto_128058 ) ) ( not ( = ?auto_128052 ?auto_128059 ) ) ( not ( = ?auto_128053 ?auto_128054 ) ) ( not ( = ?auto_128053 ?auto_128055 ) ) ( not ( = ?auto_128053 ?auto_128056 ) ) ( not ( = ?auto_128053 ?auto_128057 ) ) ( not ( = ?auto_128053 ?auto_128058 ) ) ( not ( = ?auto_128053 ?auto_128059 ) ) ( not ( = ?auto_128054 ?auto_128055 ) ) ( not ( = ?auto_128054 ?auto_128056 ) ) ( not ( = ?auto_128054 ?auto_128057 ) ) ( not ( = ?auto_128054 ?auto_128058 ) ) ( not ( = ?auto_128054 ?auto_128059 ) ) ( not ( = ?auto_128055 ?auto_128056 ) ) ( not ( = ?auto_128055 ?auto_128057 ) ) ( not ( = ?auto_128055 ?auto_128058 ) ) ( not ( = ?auto_128055 ?auto_128059 ) ) ( not ( = ?auto_128056 ?auto_128057 ) ) ( not ( = ?auto_128056 ?auto_128058 ) ) ( not ( = ?auto_128056 ?auto_128059 ) ) ( not ( = ?auto_128057 ?auto_128058 ) ) ( not ( = ?auto_128057 ?auto_128059 ) ) ( not ( = ?auto_128058 ?auto_128059 ) ) ( ON ?auto_128057 ?auto_128058 ) ( ON ?auto_128056 ?auto_128057 ) ( CLEAR ?auto_128054 ) ( ON ?auto_128055 ?auto_128056 ) ( CLEAR ?auto_128055 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_128048 ?auto_128049 ?auto_128050 ?auto_128051 ?auto_128052 ?auto_128053 ?auto_128054 ?auto_128055 )
      ( MAKE-11PILE ?auto_128048 ?auto_128049 ?auto_128050 ?auto_128051 ?auto_128052 ?auto_128053 ?auto_128054 ?auto_128055 ?auto_128056 ?auto_128057 ?auto_128058 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_128071 - BLOCK
      ?auto_128072 - BLOCK
      ?auto_128073 - BLOCK
      ?auto_128074 - BLOCK
      ?auto_128075 - BLOCK
      ?auto_128076 - BLOCK
      ?auto_128077 - BLOCK
      ?auto_128078 - BLOCK
      ?auto_128079 - BLOCK
      ?auto_128080 - BLOCK
      ?auto_128081 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_128081 ) ( ON-TABLE ?auto_128071 ) ( ON ?auto_128072 ?auto_128071 ) ( ON ?auto_128073 ?auto_128072 ) ( ON ?auto_128074 ?auto_128073 ) ( ON ?auto_128075 ?auto_128074 ) ( ON ?auto_128076 ?auto_128075 ) ( ON ?auto_128077 ?auto_128076 ) ( not ( = ?auto_128071 ?auto_128072 ) ) ( not ( = ?auto_128071 ?auto_128073 ) ) ( not ( = ?auto_128071 ?auto_128074 ) ) ( not ( = ?auto_128071 ?auto_128075 ) ) ( not ( = ?auto_128071 ?auto_128076 ) ) ( not ( = ?auto_128071 ?auto_128077 ) ) ( not ( = ?auto_128071 ?auto_128078 ) ) ( not ( = ?auto_128071 ?auto_128079 ) ) ( not ( = ?auto_128071 ?auto_128080 ) ) ( not ( = ?auto_128071 ?auto_128081 ) ) ( not ( = ?auto_128072 ?auto_128073 ) ) ( not ( = ?auto_128072 ?auto_128074 ) ) ( not ( = ?auto_128072 ?auto_128075 ) ) ( not ( = ?auto_128072 ?auto_128076 ) ) ( not ( = ?auto_128072 ?auto_128077 ) ) ( not ( = ?auto_128072 ?auto_128078 ) ) ( not ( = ?auto_128072 ?auto_128079 ) ) ( not ( = ?auto_128072 ?auto_128080 ) ) ( not ( = ?auto_128072 ?auto_128081 ) ) ( not ( = ?auto_128073 ?auto_128074 ) ) ( not ( = ?auto_128073 ?auto_128075 ) ) ( not ( = ?auto_128073 ?auto_128076 ) ) ( not ( = ?auto_128073 ?auto_128077 ) ) ( not ( = ?auto_128073 ?auto_128078 ) ) ( not ( = ?auto_128073 ?auto_128079 ) ) ( not ( = ?auto_128073 ?auto_128080 ) ) ( not ( = ?auto_128073 ?auto_128081 ) ) ( not ( = ?auto_128074 ?auto_128075 ) ) ( not ( = ?auto_128074 ?auto_128076 ) ) ( not ( = ?auto_128074 ?auto_128077 ) ) ( not ( = ?auto_128074 ?auto_128078 ) ) ( not ( = ?auto_128074 ?auto_128079 ) ) ( not ( = ?auto_128074 ?auto_128080 ) ) ( not ( = ?auto_128074 ?auto_128081 ) ) ( not ( = ?auto_128075 ?auto_128076 ) ) ( not ( = ?auto_128075 ?auto_128077 ) ) ( not ( = ?auto_128075 ?auto_128078 ) ) ( not ( = ?auto_128075 ?auto_128079 ) ) ( not ( = ?auto_128075 ?auto_128080 ) ) ( not ( = ?auto_128075 ?auto_128081 ) ) ( not ( = ?auto_128076 ?auto_128077 ) ) ( not ( = ?auto_128076 ?auto_128078 ) ) ( not ( = ?auto_128076 ?auto_128079 ) ) ( not ( = ?auto_128076 ?auto_128080 ) ) ( not ( = ?auto_128076 ?auto_128081 ) ) ( not ( = ?auto_128077 ?auto_128078 ) ) ( not ( = ?auto_128077 ?auto_128079 ) ) ( not ( = ?auto_128077 ?auto_128080 ) ) ( not ( = ?auto_128077 ?auto_128081 ) ) ( not ( = ?auto_128078 ?auto_128079 ) ) ( not ( = ?auto_128078 ?auto_128080 ) ) ( not ( = ?auto_128078 ?auto_128081 ) ) ( not ( = ?auto_128079 ?auto_128080 ) ) ( not ( = ?auto_128079 ?auto_128081 ) ) ( not ( = ?auto_128080 ?auto_128081 ) ) ( ON ?auto_128080 ?auto_128081 ) ( ON ?auto_128079 ?auto_128080 ) ( CLEAR ?auto_128077 ) ( ON ?auto_128078 ?auto_128079 ) ( CLEAR ?auto_128078 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_128071 ?auto_128072 ?auto_128073 ?auto_128074 ?auto_128075 ?auto_128076 ?auto_128077 ?auto_128078 )
      ( MAKE-11PILE ?auto_128071 ?auto_128072 ?auto_128073 ?auto_128074 ?auto_128075 ?auto_128076 ?auto_128077 ?auto_128078 ?auto_128079 ?auto_128080 ?auto_128081 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_128093 - BLOCK
      ?auto_128094 - BLOCK
      ?auto_128095 - BLOCK
      ?auto_128096 - BLOCK
      ?auto_128097 - BLOCK
      ?auto_128098 - BLOCK
      ?auto_128099 - BLOCK
      ?auto_128100 - BLOCK
      ?auto_128101 - BLOCK
      ?auto_128102 - BLOCK
      ?auto_128103 - BLOCK
    )
    :vars
    (
      ?auto_128104 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128103 ?auto_128104 ) ( ON-TABLE ?auto_128093 ) ( ON ?auto_128094 ?auto_128093 ) ( ON ?auto_128095 ?auto_128094 ) ( ON ?auto_128096 ?auto_128095 ) ( ON ?auto_128097 ?auto_128096 ) ( ON ?auto_128098 ?auto_128097 ) ( not ( = ?auto_128093 ?auto_128094 ) ) ( not ( = ?auto_128093 ?auto_128095 ) ) ( not ( = ?auto_128093 ?auto_128096 ) ) ( not ( = ?auto_128093 ?auto_128097 ) ) ( not ( = ?auto_128093 ?auto_128098 ) ) ( not ( = ?auto_128093 ?auto_128099 ) ) ( not ( = ?auto_128093 ?auto_128100 ) ) ( not ( = ?auto_128093 ?auto_128101 ) ) ( not ( = ?auto_128093 ?auto_128102 ) ) ( not ( = ?auto_128093 ?auto_128103 ) ) ( not ( = ?auto_128093 ?auto_128104 ) ) ( not ( = ?auto_128094 ?auto_128095 ) ) ( not ( = ?auto_128094 ?auto_128096 ) ) ( not ( = ?auto_128094 ?auto_128097 ) ) ( not ( = ?auto_128094 ?auto_128098 ) ) ( not ( = ?auto_128094 ?auto_128099 ) ) ( not ( = ?auto_128094 ?auto_128100 ) ) ( not ( = ?auto_128094 ?auto_128101 ) ) ( not ( = ?auto_128094 ?auto_128102 ) ) ( not ( = ?auto_128094 ?auto_128103 ) ) ( not ( = ?auto_128094 ?auto_128104 ) ) ( not ( = ?auto_128095 ?auto_128096 ) ) ( not ( = ?auto_128095 ?auto_128097 ) ) ( not ( = ?auto_128095 ?auto_128098 ) ) ( not ( = ?auto_128095 ?auto_128099 ) ) ( not ( = ?auto_128095 ?auto_128100 ) ) ( not ( = ?auto_128095 ?auto_128101 ) ) ( not ( = ?auto_128095 ?auto_128102 ) ) ( not ( = ?auto_128095 ?auto_128103 ) ) ( not ( = ?auto_128095 ?auto_128104 ) ) ( not ( = ?auto_128096 ?auto_128097 ) ) ( not ( = ?auto_128096 ?auto_128098 ) ) ( not ( = ?auto_128096 ?auto_128099 ) ) ( not ( = ?auto_128096 ?auto_128100 ) ) ( not ( = ?auto_128096 ?auto_128101 ) ) ( not ( = ?auto_128096 ?auto_128102 ) ) ( not ( = ?auto_128096 ?auto_128103 ) ) ( not ( = ?auto_128096 ?auto_128104 ) ) ( not ( = ?auto_128097 ?auto_128098 ) ) ( not ( = ?auto_128097 ?auto_128099 ) ) ( not ( = ?auto_128097 ?auto_128100 ) ) ( not ( = ?auto_128097 ?auto_128101 ) ) ( not ( = ?auto_128097 ?auto_128102 ) ) ( not ( = ?auto_128097 ?auto_128103 ) ) ( not ( = ?auto_128097 ?auto_128104 ) ) ( not ( = ?auto_128098 ?auto_128099 ) ) ( not ( = ?auto_128098 ?auto_128100 ) ) ( not ( = ?auto_128098 ?auto_128101 ) ) ( not ( = ?auto_128098 ?auto_128102 ) ) ( not ( = ?auto_128098 ?auto_128103 ) ) ( not ( = ?auto_128098 ?auto_128104 ) ) ( not ( = ?auto_128099 ?auto_128100 ) ) ( not ( = ?auto_128099 ?auto_128101 ) ) ( not ( = ?auto_128099 ?auto_128102 ) ) ( not ( = ?auto_128099 ?auto_128103 ) ) ( not ( = ?auto_128099 ?auto_128104 ) ) ( not ( = ?auto_128100 ?auto_128101 ) ) ( not ( = ?auto_128100 ?auto_128102 ) ) ( not ( = ?auto_128100 ?auto_128103 ) ) ( not ( = ?auto_128100 ?auto_128104 ) ) ( not ( = ?auto_128101 ?auto_128102 ) ) ( not ( = ?auto_128101 ?auto_128103 ) ) ( not ( = ?auto_128101 ?auto_128104 ) ) ( not ( = ?auto_128102 ?auto_128103 ) ) ( not ( = ?auto_128102 ?auto_128104 ) ) ( not ( = ?auto_128103 ?auto_128104 ) ) ( ON ?auto_128102 ?auto_128103 ) ( ON ?auto_128101 ?auto_128102 ) ( ON ?auto_128100 ?auto_128101 ) ( CLEAR ?auto_128098 ) ( ON ?auto_128099 ?auto_128100 ) ( CLEAR ?auto_128099 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_128093 ?auto_128094 ?auto_128095 ?auto_128096 ?auto_128097 ?auto_128098 ?auto_128099 )
      ( MAKE-11PILE ?auto_128093 ?auto_128094 ?auto_128095 ?auto_128096 ?auto_128097 ?auto_128098 ?auto_128099 ?auto_128100 ?auto_128101 ?auto_128102 ?auto_128103 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_128116 - BLOCK
      ?auto_128117 - BLOCK
      ?auto_128118 - BLOCK
      ?auto_128119 - BLOCK
      ?auto_128120 - BLOCK
      ?auto_128121 - BLOCK
      ?auto_128122 - BLOCK
      ?auto_128123 - BLOCK
      ?auto_128124 - BLOCK
      ?auto_128125 - BLOCK
      ?auto_128126 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_128126 ) ( ON-TABLE ?auto_128116 ) ( ON ?auto_128117 ?auto_128116 ) ( ON ?auto_128118 ?auto_128117 ) ( ON ?auto_128119 ?auto_128118 ) ( ON ?auto_128120 ?auto_128119 ) ( ON ?auto_128121 ?auto_128120 ) ( not ( = ?auto_128116 ?auto_128117 ) ) ( not ( = ?auto_128116 ?auto_128118 ) ) ( not ( = ?auto_128116 ?auto_128119 ) ) ( not ( = ?auto_128116 ?auto_128120 ) ) ( not ( = ?auto_128116 ?auto_128121 ) ) ( not ( = ?auto_128116 ?auto_128122 ) ) ( not ( = ?auto_128116 ?auto_128123 ) ) ( not ( = ?auto_128116 ?auto_128124 ) ) ( not ( = ?auto_128116 ?auto_128125 ) ) ( not ( = ?auto_128116 ?auto_128126 ) ) ( not ( = ?auto_128117 ?auto_128118 ) ) ( not ( = ?auto_128117 ?auto_128119 ) ) ( not ( = ?auto_128117 ?auto_128120 ) ) ( not ( = ?auto_128117 ?auto_128121 ) ) ( not ( = ?auto_128117 ?auto_128122 ) ) ( not ( = ?auto_128117 ?auto_128123 ) ) ( not ( = ?auto_128117 ?auto_128124 ) ) ( not ( = ?auto_128117 ?auto_128125 ) ) ( not ( = ?auto_128117 ?auto_128126 ) ) ( not ( = ?auto_128118 ?auto_128119 ) ) ( not ( = ?auto_128118 ?auto_128120 ) ) ( not ( = ?auto_128118 ?auto_128121 ) ) ( not ( = ?auto_128118 ?auto_128122 ) ) ( not ( = ?auto_128118 ?auto_128123 ) ) ( not ( = ?auto_128118 ?auto_128124 ) ) ( not ( = ?auto_128118 ?auto_128125 ) ) ( not ( = ?auto_128118 ?auto_128126 ) ) ( not ( = ?auto_128119 ?auto_128120 ) ) ( not ( = ?auto_128119 ?auto_128121 ) ) ( not ( = ?auto_128119 ?auto_128122 ) ) ( not ( = ?auto_128119 ?auto_128123 ) ) ( not ( = ?auto_128119 ?auto_128124 ) ) ( not ( = ?auto_128119 ?auto_128125 ) ) ( not ( = ?auto_128119 ?auto_128126 ) ) ( not ( = ?auto_128120 ?auto_128121 ) ) ( not ( = ?auto_128120 ?auto_128122 ) ) ( not ( = ?auto_128120 ?auto_128123 ) ) ( not ( = ?auto_128120 ?auto_128124 ) ) ( not ( = ?auto_128120 ?auto_128125 ) ) ( not ( = ?auto_128120 ?auto_128126 ) ) ( not ( = ?auto_128121 ?auto_128122 ) ) ( not ( = ?auto_128121 ?auto_128123 ) ) ( not ( = ?auto_128121 ?auto_128124 ) ) ( not ( = ?auto_128121 ?auto_128125 ) ) ( not ( = ?auto_128121 ?auto_128126 ) ) ( not ( = ?auto_128122 ?auto_128123 ) ) ( not ( = ?auto_128122 ?auto_128124 ) ) ( not ( = ?auto_128122 ?auto_128125 ) ) ( not ( = ?auto_128122 ?auto_128126 ) ) ( not ( = ?auto_128123 ?auto_128124 ) ) ( not ( = ?auto_128123 ?auto_128125 ) ) ( not ( = ?auto_128123 ?auto_128126 ) ) ( not ( = ?auto_128124 ?auto_128125 ) ) ( not ( = ?auto_128124 ?auto_128126 ) ) ( not ( = ?auto_128125 ?auto_128126 ) ) ( ON ?auto_128125 ?auto_128126 ) ( ON ?auto_128124 ?auto_128125 ) ( ON ?auto_128123 ?auto_128124 ) ( CLEAR ?auto_128121 ) ( ON ?auto_128122 ?auto_128123 ) ( CLEAR ?auto_128122 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_128116 ?auto_128117 ?auto_128118 ?auto_128119 ?auto_128120 ?auto_128121 ?auto_128122 )
      ( MAKE-11PILE ?auto_128116 ?auto_128117 ?auto_128118 ?auto_128119 ?auto_128120 ?auto_128121 ?auto_128122 ?auto_128123 ?auto_128124 ?auto_128125 ?auto_128126 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_128138 - BLOCK
      ?auto_128139 - BLOCK
      ?auto_128140 - BLOCK
      ?auto_128141 - BLOCK
      ?auto_128142 - BLOCK
      ?auto_128143 - BLOCK
      ?auto_128144 - BLOCK
      ?auto_128145 - BLOCK
      ?auto_128146 - BLOCK
      ?auto_128147 - BLOCK
      ?auto_128148 - BLOCK
    )
    :vars
    (
      ?auto_128149 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128148 ?auto_128149 ) ( ON-TABLE ?auto_128138 ) ( ON ?auto_128139 ?auto_128138 ) ( ON ?auto_128140 ?auto_128139 ) ( ON ?auto_128141 ?auto_128140 ) ( ON ?auto_128142 ?auto_128141 ) ( not ( = ?auto_128138 ?auto_128139 ) ) ( not ( = ?auto_128138 ?auto_128140 ) ) ( not ( = ?auto_128138 ?auto_128141 ) ) ( not ( = ?auto_128138 ?auto_128142 ) ) ( not ( = ?auto_128138 ?auto_128143 ) ) ( not ( = ?auto_128138 ?auto_128144 ) ) ( not ( = ?auto_128138 ?auto_128145 ) ) ( not ( = ?auto_128138 ?auto_128146 ) ) ( not ( = ?auto_128138 ?auto_128147 ) ) ( not ( = ?auto_128138 ?auto_128148 ) ) ( not ( = ?auto_128138 ?auto_128149 ) ) ( not ( = ?auto_128139 ?auto_128140 ) ) ( not ( = ?auto_128139 ?auto_128141 ) ) ( not ( = ?auto_128139 ?auto_128142 ) ) ( not ( = ?auto_128139 ?auto_128143 ) ) ( not ( = ?auto_128139 ?auto_128144 ) ) ( not ( = ?auto_128139 ?auto_128145 ) ) ( not ( = ?auto_128139 ?auto_128146 ) ) ( not ( = ?auto_128139 ?auto_128147 ) ) ( not ( = ?auto_128139 ?auto_128148 ) ) ( not ( = ?auto_128139 ?auto_128149 ) ) ( not ( = ?auto_128140 ?auto_128141 ) ) ( not ( = ?auto_128140 ?auto_128142 ) ) ( not ( = ?auto_128140 ?auto_128143 ) ) ( not ( = ?auto_128140 ?auto_128144 ) ) ( not ( = ?auto_128140 ?auto_128145 ) ) ( not ( = ?auto_128140 ?auto_128146 ) ) ( not ( = ?auto_128140 ?auto_128147 ) ) ( not ( = ?auto_128140 ?auto_128148 ) ) ( not ( = ?auto_128140 ?auto_128149 ) ) ( not ( = ?auto_128141 ?auto_128142 ) ) ( not ( = ?auto_128141 ?auto_128143 ) ) ( not ( = ?auto_128141 ?auto_128144 ) ) ( not ( = ?auto_128141 ?auto_128145 ) ) ( not ( = ?auto_128141 ?auto_128146 ) ) ( not ( = ?auto_128141 ?auto_128147 ) ) ( not ( = ?auto_128141 ?auto_128148 ) ) ( not ( = ?auto_128141 ?auto_128149 ) ) ( not ( = ?auto_128142 ?auto_128143 ) ) ( not ( = ?auto_128142 ?auto_128144 ) ) ( not ( = ?auto_128142 ?auto_128145 ) ) ( not ( = ?auto_128142 ?auto_128146 ) ) ( not ( = ?auto_128142 ?auto_128147 ) ) ( not ( = ?auto_128142 ?auto_128148 ) ) ( not ( = ?auto_128142 ?auto_128149 ) ) ( not ( = ?auto_128143 ?auto_128144 ) ) ( not ( = ?auto_128143 ?auto_128145 ) ) ( not ( = ?auto_128143 ?auto_128146 ) ) ( not ( = ?auto_128143 ?auto_128147 ) ) ( not ( = ?auto_128143 ?auto_128148 ) ) ( not ( = ?auto_128143 ?auto_128149 ) ) ( not ( = ?auto_128144 ?auto_128145 ) ) ( not ( = ?auto_128144 ?auto_128146 ) ) ( not ( = ?auto_128144 ?auto_128147 ) ) ( not ( = ?auto_128144 ?auto_128148 ) ) ( not ( = ?auto_128144 ?auto_128149 ) ) ( not ( = ?auto_128145 ?auto_128146 ) ) ( not ( = ?auto_128145 ?auto_128147 ) ) ( not ( = ?auto_128145 ?auto_128148 ) ) ( not ( = ?auto_128145 ?auto_128149 ) ) ( not ( = ?auto_128146 ?auto_128147 ) ) ( not ( = ?auto_128146 ?auto_128148 ) ) ( not ( = ?auto_128146 ?auto_128149 ) ) ( not ( = ?auto_128147 ?auto_128148 ) ) ( not ( = ?auto_128147 ?auto_128149 ) ) ( not ( = ?auto_128148 ?auto_128149 ) ) ( ON ?auto_128147 ?auto_128148 ) ( ON ?auto_128146 ?auto_128147 ) ( ON ?auto_128145 ?auto_128146 ) ( ON ?auto_128144 ?auto_128145 ) ( CLEAR ?auto_128142 ) ( ON ?auto_128143 ?auto_128144 ) ( CLEAR ?auto_128143 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_128138 ?auto_128139 ?auto_128140 ?auto_128141 ?auto_128142 ?auto_128143 )
      ( MAKE-11PILE ?auto_128138 ?auto_128139 ?auto_128140 ?auto_128141 ?auto_128142 ?auto_128143 ?auto_128144 ?auto_128145 ?auto_128146 ?auto_128147 ?auto_128148 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_128161 - BLOCK
      ?auto_128162 - BLOCK
      ?auto_128163 - BLOCK
      ?auto_128164 - BLOCK
      ?auto_128165 - BLOCK
      ?auto_128166 - BLOCK
      ?auto_128167 - BLOCK
      ?auto_128168 - BLOCK
      ?auto_128169 - BLOCK
      ?auto_128170 - BLOCK
      ?auto_128171 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_128171 ) ( ON-TABLE ?auto_128161 ) ( ON ?auto_128162 ?auto_128161 ) ( ON ?auto_128163 ?auto_128162 ) ( ON ?auto_128164 ?auto_128163 ) ( ON ?auto_128165 ?auto_128164 ) ( not ( = ?auto_128161 ?auto_128162 ) ) ( not ( = ?auto_128161 ?auto_128163 ) ) ( not ( = ?auto_128161 ?auto_128164 ) ) ( not ( = ?auto_128161 ?auto_128165 ) ) ( not ( = ?auto_128161 ?auto_128166 ) ) ( not ( = ?auto_128161 ?auto_128167 ) ) ( not ( = ?auto_128161 ?auto_128168 ) ) ( not ( = ?auto_128161 ?auto_128169 ) ) ( not ( = ?auto_128161 ?auto_128170 ) ) ( not ( = ?auto_128161 ?auto_128171 ) ) ( not ( = ?auto_128162 ?auto_128163 ) ) ( not ( = ?auto_128162 ?auto_128164 ) ) ( not ( = ?auto_128162 ?auto_128165 ) ) ( not ( = ?auto_128162 ?auto_128166 ) ) ( not ( = ?auto_128162 ?auto_128167 ) ) ( not ( = ?auto_128162 ?auto_128168 ) ) ( not ( = ?auto_128162 ?auto_128169 ) ) ( not ( = ?auto_128162 ?auto_128170 ) ) ( not ( = ?auto_128162 ?auto_128171 ) ) ( not ( = ?auto_128163 ?auto_128164 ) ) ( not ( = ?auto_128163 ?auto_128165 ) ) ( not ( = ?auto_128163 ?auto_128166 ) ) ( not ( = ?auto_128163 ?auto_128167 ) ) ( not ( = ?auto_128163 ?auto_128168 ) ) ( not ( = ?auto_128163 ?auto_128169 ) ) ( not ( = ?auto_128163 ?auto_128170 ) ) ( not ( = ?auto_128163 ?auto_128171 ) ) ( not ( = ?auto_128164 ?auto_128165 ) ) ( not ( = ?auto_128164 ?auto_128166 ) ) ( not ( = ?auto_128164 ?auto_128167 ) ) ( not ( = ?auto_128164 ?auto_128168 ) ) ( not ( = ?auto_128164 ?auto_128169 ) ) ( not ( = ?auto_128164 ?auto_128170 ) ) ( not ( = ?auto_128164 ?auto_128171 ) ) ( not ( = ?auto_128165 ?auto_128166 ) ) ( not ( = ?auto_128165 ?auto_128167 ) ) ( not ( = ?auto_128165 ?auto_128168 ) ) ( not ( = ?auto_128165 ?auto_128169 ) ) ( not ( = ?auto_128165 ?auto_128170 ) ) ( not ( = ?auto_128165 ?auto_128171 ) ) ( not ( = ?auto_128166 ?auto_128167 ) ) ( not ( = ?auto_128166 ?auto_128168 ) ) ( not ( = ?auto_128166 ?auto_128169 ) ) ( not ( = ?auto_128166 ?auto_128170 ) ) ( not ( = ?auto_128166 ?auto_128171 ) ) ( not ( = ?auto_128167 ?auto_128168 ) ) ( not ( = ?auto_128167 ?auto_128169 ) ) ( not ( = ?auto_128167 ?auto_128170 ) ) ( not ( = ?auto_128167 ?auto_128171 ) ) ( not ( = ?auto_128168 ?auto_128169 ) ) ( not ( = ?auto_128168 ?auto_128170 ) ) ( not ( = ?auto_128168 ?auto_128171 ) ) ( not ( = ?auto_128169 ?auto_128170 ) ) ( not ( = ?auto_128169 ?auto_128171 ) ) ( not ( = ?auto_128170 ?auto_128171 ) ) ( ON ?auto_128170 ?auto_128171 ) ( ON ?auto_128169 ?auto_128170 ) ( ON ?auto_128168 ?auto_128169 ) ( ON ?auto_128167 ?auto_128168 ) ( CLEAR ?auto_128165 ) ( ON ?auto_128166 ?auto_128167 ) ( CLEAR ?auto_128166 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_128161 ?auto_128162 ?auto_128163 ?auto_128164 ?auto_128165 ?auto_128166 )
      ( MAKE-11PILE ?auto_128161 ?auto_128162 ?auto_128163 ?auto_128164 ?auto_128165 ?auto_128166 ?auto_128167 ?auto_128168 ?auto_128169 ?auto_128170 ?auto_128171 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_128183 - BLOCK
      ?auto_128184 - BLOCK
      ?auto_128185 - BLOCK
      ?auto_128186 - BLOCK
      ?auto_128187 - BLOCK
      ?auto_128188 - BLOCK
      ?auto_128189 - BLOCK
      ?auto_128190 - BLOCK
      ?auto_128191 - BLOCK
      ?auto_128192 - BLOCK
      ?auto_128193 - BLOCK
    )
    :vars
    (
      ?auto_128194 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128193 ?auto_128194 ) ( ON-TABLE ?auto_128183 ) ( ON ?auto_128184 ?auto_128183 ) ( ON ?auto_128185 ?auto_128184 ) ( ON ?auto_128186 ?auto_128185 ) ( not ( = ?auto_128183 ?auto_128184 ) ) ( not ( = ?auto_128183 ?auto_128185 ) ) ( not ( = ?auto_128183 ?auto_128186 ) ) ( not ( = ?auto_128183 ?auto_128187 ) ) ( not ( = ?auto_128183 ?auto_128188 ) ) ( not ( = ?auto_128183 ?auto_128189 ) ) ( not ( = ?auto_128183 ?auto_128190 ) ) ( not ( = ?auto_128183 ?auto_128191 ) ) ( not ( = ?auto_128183 ?auto_128192 ) ) ( not ( = ?auto_128183 ?auto_128193 ) ) ( not ( = ?auto_128183 ?auto_128194 ) ) ( not ( = ?auto_128184 ?auto_128185 ) ) ( not ( = ?auto_128184 ?auto_128186 ) ) ( not ( = ?auto_128184 ?auto_128187 ) ) ( not ( = ?auto_128184 ?auto_128188 ) ) ( not ( = ?auto_128184 ?auto_128189 ) ) ( not ( = ?auto_128184 ?auto_128190 ) ) ( not ( = ?auto_128184 ?auto_128191 ) ) ( not ( = ?auto_128184 ?auto_128192 ) ) ( not ( = ?auto_128184 ?auto_128193 ) ) ( not ( = ?auto_128184 ?auto_128194 ) ) ( not ( = ?auto_128185 ?auto_128186 ) ) ( not ( = ?auto_128185 ?auto_128187 ) ) ( not ( = ?auto_128185 ?auto_128188 ) ) ( not ( = ?auto_128185 ?auto_128189 ) ) ( not ( = ?auto_128185 ?auto_128190 ) ) ( not ( = ?auto_128185 ?auto_128191 ) ) ( not ( = ?auto_128185 ?auto_128192 ) ) ( not ( = ?auto_128185 ?auto_128193 ) ) ( not ( = ?auto_128185 ?auto_128194 ) ) ( not ( = ?auto_128186 ?auto_128187 ) ) ( not ( = ?auto_128186 ?auto_128188 ) ) ( not ( = ?auto_128186 ?auto_128189 ) ) ( not ( = ?auto_128186 ?auto_128190 ) ) ( not ( = ?auto_128186 ?auto_128191 ) ) ( not ( = ?auto_128186 ?auto_128192 ) ) ( not ( = ?auto_128186 ?auto_128193 ) ) ( not ( = ?auto_128186 ?auto_128194 ) ) ( not ( = ?auto_128187 ?auto_128188 ) ) ( not ( = ?auto_128187 ?auto_128189 ) ) ( not ( = ?auto_128187 ?auto_128190 ) ) ( not ( = ?auto_128187 ?auto_128191 ) ) ( not ( = ?auto_128187 ?auto_128192 ) ) ( not ( = ?auto_128187 ?auto_128193 ) ) ( not ( = ?auto_128187 ?auto_128194 ) ) ( not ( = ?auto_128188 ?auto_128189 ) ) ( not ( = ?auto_128188 ?auto_128190 ) ) ( not ( = ?auto_128188 ?auto_128191 ) ) ( not ( = ?auto_128188 ?auto_128192 ) ) ( not ( = ?auto_128188 ?auto_128193 ) ) ( not ( = ?auto_128188 ?auto_128194 ) ) ( not ( = ?auto_128189 ?auto_128190 ) ) ( not ( = ?auto_128189 ?auto_128191 ) ) ( not ( = ?auto_128189 ?auto_128192 ) ) ( not ( = ?auto_128189 ?auto_128193 ) ) ( not ( = ?auto_128189 ?auto_128194 ) ) ( not ( = ?auto_128190 ?auto_128191 ) ) ( not ( = ?auto_128190 ?auto_128192 ) ) ( not ( = ?auto_128190 ?auto_128193 ) ) ( not ( = ?auto_128190 ?auto_128194 ) ) ( not ( = ?auto_128191 ?auto_128192 ) ) ( not ( = ?auto_128191 ?auto_128193 ) ) ( not ( = ?auto_128191 ?auto_128194 ) ) ( not ( = ?auto_128192 ?auto_128193 ) ) ( not ( = ?auto_128192 ?auto_128194 ) ) ( not ( = ?auto_128193 ?auto_128194 ) ) ( ON ?auto_128192 ?auto_128193 ) ( ON ?auto_128191 ?auto_128192 ) ( ON ?auto_128190 ?auto_128191 ) ( ON ?auto_128189 ?auto_128190 ) ( ON ?auto_128188 ?auto_128189 ) ( CLEAR ?auto_128186 ) ( ON ?auto_128187 ?auto_128188 ) ( CLEAR ?auto_128187 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_128183 ?auto_128184 ?auto_128185 ?auto_128186 ?auto_128187 )
      ( MAKE-11PILE ?auto_128183 ?auto_128184 ?auto_128185 ?auto_128186 ?auto_128187 ?auto_128188 ?auto_128189 ?auto_128190 ?auto_128191 ?auto_128192 ?auto_128193 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_128206 - BLOCK
      ?auto_128207 - BLOCK
      ?auto_128208 - BLOCK
      ?auto_128209 - BLOCK
      ?auto_128210 - BLOCK
      ?auto_128211 - BLOCK
      ?auto_128212 - BLOCK
      ?auto_128213 - BLOCK
      ?auto_128214 - BLOCK
      ?auto_128215 - BLOCK
      ?auto_128216 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_128216 ) ( ON-TABLE ?auto_128206 ) ( ON ?auto_128207 ?auto_128206 ) ( ON ?auto_128208 ?auto_128207 ) ( ON ?auto_128209 ?auto_128208 ) ( not ( = ?auto_128206 ?auto_128207 ) ) ( not ( = ?auto_128206 ?auto_128208 ) ) ( not ( = ?auto_128206 ?auto_128209 ) ) ( not ( = ?auto_128206 ?auto_128210 ) ) ( not ( = ?auto_128206 ?auto_128211 ) ) ( not ( = ?auto_128206 ?auto_128212 ) ) ( not ( = ?auto_128206 ?auto_128213 ) ) ( not ( = ?auto_128206 ?auto_128214 ) ) ( not ( = ?auto_128206 ?auto_128215 ) ) ( not ( = ?auto_128206 ?auto_128216 ) ) ( not ( = ?auto_128207 ?auto_128208 ) ) ( not ( = ?auto_128207 ?auto_128209 ) ) ( not ( = ?auto_128207 ?auto_128210 ) ) ( not ( = ?auto_128207 ?auto_128211 ) ) ( not ( = ?auto_128207 ?auto_128212 ) ) ( not ( = ?auto_128207 ?auto_128213 ) ) ( not ( = ?auto_128207 ?auto_128214 ) ) ( not ( = ?auto_128207 ?auto_128215 ) ) ( not ( = ?auto_128207 ?auto_128216 ) ) ( not ( = ?auto_128208 ?auto_128209 ) ) ( not ( = ?auto_128208 ?auto_128210 ) ) ( not ( = ?auto_128208 ?auto_128211 ) ) ( not ( = ?auto_128208 ?auto_128212 ) ) ( not ( = ?auto_128208 ?auto_128213 ) ) ( not ( = ?auto_128208 ?auto_128214 ) ) ( not ( = ?auto_128208 ?auto_128215 ) ) ( not ( = ?auto_128208 ?auto_128216 ) ) ( not ( = ?auto_128209 ?auto_128210 ) ) ( not ( = ?auto_128209 ?auto_128211 ) ) ( not ( = ?auto_128209 ?auto_128212 ) ) ( not ( = ?auto_128209 ?auto_128213 ) ) ( not ( = ?auto_128209 ?auto_128214 ) ) ( not ( = ?auto_128209 ?auto_128215 ) ) ( not ( = ?auto_128209 ?auto_128216 ) ) ( not ( = ?auto_128210 ?auto_128211 ) ) ( not ( = ?auto_128210 ?auto_128212 ) ) ( not ( = ?auto_128210 ?auto_128213 ) ) ( not ( = ?auto_128210 ?auto_128214 ) ) ( not ( = ?auto_128210 ?auto_128215 ) ) ( not ( = ?auto_128210 ?auto_128216 ) ) ( not ( = ?auto_128211 ?auto_128212 ) ) ( not ( = ?auto_128211 ?auto_128213 ) ) ( not ( = ?auto_128211 ?auto_128214 ) ) ( not ( = ?auto_128211 ?auto_128215 ) ) ( not ( = ?auto_128211 ?auto_128216 ) ) ( not ( = ?auto_128212 ?auto_128213 ) ) ( not ( = ?auto_128212 ?auto_128214 ) ) ( not ( = ?auto_128212 ?auto_128215 ) ) ( not ( = ?auto_128212 ?auto_128216 ) ) ( not ( = ?auto_128213 ?auto_128214 ) ) ( not ( = ?auto_128213 ?auto_128215 ) ) ( not ( = ?auto_128213 ?auto_128216 ) ) ( not ( = ?auto_128214 ?auto_128215 ) ) ( not ( = ?auto_128214 ?auto_128216 ) ) ( not ( = ?auto_128215 ?auto_128216 ) ) ( ON ?auto_128215 ?auto_128216 ) ( ON ?auto_128214 ?auto_128215 ) ( ON ?auto_128213 ?auto_128214 ) ( ON ?auto_128212 ?auto_128213 ) ( ON ?auto_128211 ?auto_128212 ) ( CLEAR ?auto_128209 ) ( ON ?auto_128210 ?auto_128211 ) ( CLEAR ?auto_128210 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_128206 ?auto_128207 ?auto_128208 ?auto_128209 ?auto_128210 )
      ( MAKE-11PILE ?auto_128206 ?auto_128207 ?auto_128208 ?auto_128209 ?auto_128210 ?auto_128211 ?auto_128212 ?auto_128213 ?auto_128214 ?auto_128215 ?auto_128216 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_128228 - BLOCK
      ?auto_128229 - BLOCK
      ?auto_128230 - BLOCK
      ?auto_128231 - BLOCK
      ?auto_128232 - BLOCK
      ?auto_128233 - BLOCK
      ?auto_128234 - BLOCK
      ?auto_128235 - BLOCK
      ?auto_128236 - BLOCK
      ?auto_128237 - BLOCK
      ?auto_128238 - BLOCK
    )
    :vars
    (
      ?auto_128239 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128238 ?auto_128239 ) ( ON-TABLE ?auto_128228 ) ( ON ?auto_128229 ?auto_128228 ) ( ON ?auto_128230 ?auto_128229 ) ( not ( = ?auto_128228 ?auto_128229 ) ) ( not ( = ?auto_128228 ?auto_128230 ) ) ( not ( = ?auto_128228 ?auto_128231 ) ) ( not ( = ?auto_128228 ?auto_128232 ) ) ( not ( = ?auto_128228 ?auto_128233 ) ) ( not ( = ?auto_128228 ?auto_128234 ) ) ( not ( = ?auto_128228 ?auto_128235 ) ) ( not ( = ?auto_128228 ?auto_128236 ) ) ( not ( = ?auto_128228 ?auto_128237 ) ) ( not ( = ?auto_128228 ?auto_128238 ) ) ( not ( = ?auto_128228 ?auto_128239 ) ) ( not ( = ?auto_128229 ?auto_128230 ) ) ( not ( = ?auto_128229 ?auto_128231 ) ) ( not ( = ?auto_128229 ?auto_128232 ) ) ( not ( = ?auto_128229 ?auto_128233 ) ) ( not ( = ?auto_128229 ?auto_128234 ) ) ( not ( = ?auto_128229 ?auto_128235 ) ) ( not ( = ?auto_128229 ?auto_128236 ) ) ( not ( = ?auto_128229 ?auto_128237 ) ) ( not ( = ?auto_128229 ?auto_128238 ) ) ( not ( = ?auto_128229 ?auto_128239 ) ) ( not ( = ?auto_128230 ?auto_128231 ) ) ( not ( = ?auto_128230 ?auto_128232 ) ) ( not ( = ?auto_128230 ?auto_128233 ) ) ( not ( = ?auto_128230 ?auto_128234 ) ) ( not ( = ?auto_128230 ?auto_128235 ) ) ( not ( = ?auto_128230 ?auto_128236 ) ) ( not ( = ?auto_128230 ?auto_128237 ) ) ( not ( = ?auto_128230 ?auto_128238 ) ) ( not ( = ?auto_128230 ?auto_128239 ) ) ( not ( = ?auto_128231 ?auto_128232 ) ) ( not ( = ?auto_128231 ?auto_128233 ) ) ( not ( = ?auto_128231 ?auto_128234 ) ) ( not ( = ?auto_128231 ?auto_128235 ) ) ( not ( = ?auto_128231 ?auto_128236 ) ) ( not ( = ?auto_128231 ?auto_128237 ) ) ( not ( = ?auto_128231 ?auto_128238 ) ) ( not ( = ?auto_128231 ?auto_128239 ) ) ( not ( = ?auto_128232 ?auto_128233 ) ) ( not ( = ?auto_128232 ?auto_128234 ) ) ( not ( = ?auto_128232 ?auto_128235 ) ) ( not ( = ?auto_128232 ?auto_128236 ) ) ( not ( = ?auto_128232 ?auto_128237 ) ) ( not ( = ?auto_128232 ?auto_128238 ) ) ( not ( = ?auto_128232 ?auto_128239 ) ) ( not ( = ?auto_128233 ?auto_128234 ) ) ( not ( = ?auto_128233 ?auto_128235 ) ) ( not ( = ?auto_128233 ?auto_128236 ) ) ( not ( = ?auto_128233 ?auto_128237 ) ) ( not ( = ?auto_128233 ?auto_128238 ) ) ( not ( = ?auto_128233 ?auto_128239 ) ) ( not ( = ?auto_128234 ?auto_128235 ) ) ( not ( = ?auto_128234 ?auto_128236 ) ) ( not ( = ?auto_128234 ?auto_128237 ) ) ( not ( = ?auto_128234 ?auto_128238 ) ) ( not ( = ?auto_128234 ?auto_128239 ) ) ( not ( = ?auto_128235 ?auto_128236 ) ) ( not ( = ?auto_128235 ?auto_128237 ) ) ( not ( = ?auto_128235 ?auto_128238 ) ) ( not ( = ?auto_128235 ?auto_128239 ) ) ( not ( = ?auto_128236 ?auto_128237 ) ) ( not ( = ?auto_128236 ?auto_128238 ) ) ( not ( = ?auto_128236 ?auto_128239 ) ) ( not ( = ?auto_128237 ?auto_128238 ) ) ( not ( = ?auto_128237 ?auto_128239 ) ) ( not ( = ?auto_128238 ?auto_128239 ) ) ( ON ?auto_128237 ?auto_128238 ) ( ON ?auto_128236 ?auto_128237 ) ( ON ?auto_128235 ?auto_128236 ) ( ON ?auto_128234 ?auto_128235 ) ( ON ?auto_128233 ?auto_128234 ) ( ON ?auto_128232 ?auto_128233 ) ( CLEAR ?auto_128230 ) ( ON ?auto_128231 ?auto_128232 ) ( CLEAR ?auto_128231 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_128228 ?auto_128229 ?auto_128230 ?auto_128231 )
      ( MAKE-11PILE ?auto_128228 ?auto_128229 ?auto_128230 ?auto_128231 ?auto_128232 ?auto_128233 ?auto_128234 ?auto_128235 ?auto_128236 ?auto_128237 ?auto_128238 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_128251 - BLOCK
      ?auto_128252 - BLOCK
      ?auto_128253 - BLOCK
      ?auto_128254 - BLOCK
      ?auto_128255 - BLOCK
      ?auto_128256 - BLOCK
      ?auto_128257 - BLOCK
      ?auto_128258 - BLOCK
      ?auto_128259 - BLOCK
      ?auto_128260 - BLOCK
      ?auto_128261 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_128261 ) ( ON-TABLE ?auto_128251 ) ( ON ?auto_128252 ?auto_128251 ) ( ON ?auto_128253 ?auto_128252 ) ( not ( = ?auto_128251 ?auto_128252 ) ) ( not ( = ?auto_128251 ?auto_128253 ) ) ( not ( = ?auto_128251 ?auto_128254 ) ) ( not ( = ?auto_128251 ?auto_128255 ) ) ( not ( = ?auto_128251 ?auto_128256 ) ) ( not ( = ?auto_128251 ?auto_128257 ) ) ( not ( = ?auto_128251 ?auto_128258 ) ) ( not ( = ?auto_128251 ?auto_128259 ) ) ( not ( = ?auto_128251 ?auto_128260 ) ) ( not ( = ?auto_128251 ?auto_128261 ) ) ( not ( = ?auto_128252 ?auto_128253 ) ) ( not ( = ?auto_128252 ?auto_128254 ) ) ( not ( = ?auto_128252 ?auto_128255 ) ) ( not ( = ?auto_128252 ?auto_128256 ) ) ( not ( = ?auto_128252 ?auto_128257 ) ) ( not ( = ?auto_128252 ?auto_128258 ) ) ( not ( = ?auto_128252 ?auto_128259 ) ) ( not ( = ?auto_128252 ?auto_128260 ) ) ( not ( = ?auto_128252 ?auto_128261 ) ) ( not ( = ?auto_128253 ?auto_128254 ) ) ( not ( = ?auto_128253 ?auto_128255 ) ) ( not ( = ?auto_128253 ?auto_128256 ) ) ( not ( = ?auto_128253 ?auto_128257 ) ) ( not ( = ?auto_128253 ?auto_128258 ) ) ( not ( = ?auto_128253 ?auto_128259 ) ) ( not ( = ?auto_128253 ?auto_128260 ) ) ( not ( = ?auto_128253 ?auto_128261 ) ) ( not ( = ?auto_128254 ?auto_128255 ) ) ( not ( = ?auto_128254 ?auto_128256 ) ) ( not ( = ?auto_128254 ?auto_128257 ) ) ( not ( = ?auto_128254 ?auto_128258 ) ) ( not ( = ?auto_128254 ?auto_128259 ) ) ( not ( = ?auto_128254 ?auto_128260 ) ) ( not ( = ?auto_128254 ?auto_128261 ) ) ( not ( = ?auto_128255 ?auto_128256 ) ) ( not ( = ?auto_128255 ?auto_128257 ) ) ( not ( = ?auto_128255 ?auto_128258 ) ) ( not ( = ?auto_128255 ?auto_128259 ) ) ( not ( = ?auto_128255 ?auto_128260 ) ) ( not ( = ?auto_128255 ?auto_128261 ) ) ( not ( = ?auto_128256 ?auto_128257 ) ) ( not ( = ?auto_128256 ?auto_128258 ) ) ( not ( = ?auto_128256 ?auto_128259 ) ) ( not ( = ?auto_128256 ?auto_128260 ) ) ( not ( = ?auto_128256 ?auto_128261 ) ) ( not ( = ?auto_128257 ?auto_128258 ) ) ( not ( = ?auto_128257 ?auto_128259 ) ) ( not ( = ?auto_128257 ?auto_128260 ) ) ( not ( = ?auto_128257 ?auto_128261 ) ) ( not ( = ?auto_128258 ?auto_128259 ) ) ( not ( = ?auto_128258 ?auto_128260 ) ) ( not ( = ?auto_128258 ?auto_128261 ) ) ( not ( = ?auto_128259 ?auto_128260 ) ) ( not ( = ?auto_128259 ?auto_128261 ) ) ( not ( = ?auto_128260 ?auto_128261 ) ) ( ON ?auto_128260 ?auto_128261 ) ( ON ?auto_128259 ?auto_128260 ) ( ON ?auto_128258 ?auto_128259 ) ( ON ?auto_128257 ?auto_128258 ) ( ON ?auto_128256 ?auto_128257 ) ( ON ?auto_128255 ?auto_128256 ) ( CLEAR ?auto_128253 ) ( ON ?auto_128254 ?auto_128255 ) ( CLEAR ?auto_128254 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_128251 ?auto_128252 ?auto_128253 ?auto_128254 )
      ( MAKE-11PILE ?auto_128251 ?auto_128252 ?auto_128253 ?auto_128254 ?auto_128255 ?auto_128256 ?auto_128257 ?auto_128258 ?auto_128259 ?auto_128260 ?auto_128261 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_128273 - BLOCK
      ?auto_128274 - BLOCK
      ?auto_128275 - BLOCK
      ?auto_128276 - BLOCK
      ?auto_128277 - BLOCK
      ?auto_128278 - BLOCK
      ?auto_128279 - BLOCK
      ?auto_128280 - BLOCK
      ?auto_128281 - BLOCK
      ?auto_128282 - BLOCK
      ?auto_128283 - BLOCK
    )
    :vars
    (
      ?auto_128284 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128283 ?auto_128284 ) ( ON-TABLE ?auto_128273 ) ( ON ?auto_128274 ?auto_128273 ) ( not ( = ?auto_128273 ?auto_128274 ) ) ( not ( = ?auto_128273 ?auto_128275 ) ) ( not ( = ?auto_128273 ?auto_128276 ) ) ( not ( = ?auto_128273 ?auto_128277 ) ) ( not ( = ?auto_128273 ?auto_128278 ) ) ( not ( = ?auto_128273 ?auto_128279 ) ) ( not ( = ?auto_128273 ?auto_128280 ) ) ( not ( = ?auto_128273 ?auto_128281 ) ) ( not ( = ?auto_128273 ?auto_128282 ) ) ( not ( = ?auto_128273 ?auto_128283 ) ) ( not ( = ?auto_128273 ?auto_128284 ) ) ( not ( = ?auto_128274 ?auto_128275 ) ) ( not ( = ?auto_128274 ?auto_128276 ) ) ( not ( = ?auto_128274 ?auto_128277 ) ) ( not ( = ?auto_128274 ?auto_128278 ) ) ( not ( = ?auto_128274 ?auto_128279 ) ) ( not ( = ?auto_128274 ?auto_128280 ) ) ( not ( = ?auto_128274 ?auto_128281 ) ) ( not ( = ?auto_128274 ?auto_128282 ) ) ( not ( = ?auto_128274 ?auto_128283 ) ) ( not ( = ?auto_128274 ?auto_128284 ) ) ( not ( = ?auto_128275 ?auto_128276 ) ) ( not ( = ?auto_128275 ?auto_128277 ) ) ( not ( = ?auto_128275 ?auto_128278 ) ) ( not ( = ?auto_128275 ?auto_128279 ) ) ( not ( = ?auto_128275 ?auto_128280 ) ) ( not ( = ?auto_128275 ?auto_128281 ) ) ( not ( = ?auto_128275 ?auto_128282 ) ) ( not ( = ?auto_128275 ?auto_128283 ) ) ( not ( = ?auto_128275 ?auto_128284 ) ) ( not ( = ?auto_128276 ?auto_128277 ) ) ( not ( = ?auto_128276 ?auto_128278 ) ) ( not ( = ?auto_128276 ?auto_128279 ) ) ( not ( = ?auto_128276 ?auto_128280 ) ) ( not ( = ?auto_128276 ?auto_128281 ) ) ( not ( = ?auto_128276 ?auto_128282 ) ) ( not ( = ?auto_128276 ?auto_128283 ) ) ( not ( = ?auto_128276 ?auto_128284 ) ) ( not ( = ?auto_128277 ?auto_128278 ) ) ( not ( = ?auto_128277 ?auto_128279 ) ) ( not ( = ?auto_128277 ?auto_128280 ) ) ( not ( = ?auto_128277 ?auto_128281 ) ) ( not ( = ?auto_128277 ?auto_128282 ) ) ( not ( = ?auto_128277 ?auto_128283 ) ) ( not ( = ?auto_128277 ?auto_128284 ) ) ( not ( = ?auto_128278 ?auto_128279 ) ) ( not ( = ?auto_128278 ?auto_128280 ) ) ( not ( = ?auto_128278 ?auto_128281 ) ) ( not ( = ?auto_128278 ?auto_128282 ) ) ( not ( = ?auto_128278 ?auto_128283 ) ) ( not ( = ?auto_128278 ?auto_128284 ) ) ( not ( = ?auto_128279 ?auto_128280 ) ) ( not ( = ?auto_128279 ?auto_128281 ) ) ( not ( = ?auto_128279 ?auto_128282 ) ) ( not ( = ?auto_128279 ?auto_128283 ) ) ( not ( = ?auto_128279 ?auto_128284 ) ) ( not ( = ?auto_128280 ?auto_128281 ) ) ( not ( = ?auto_128280 ?auto_128282 ) ) ( not ( = ?auto_128280 ?auto_128283 ) ) ( not ( = ?auto_128280 ?auto_128284 ) ) ( not ( = ?auto_128281 ?auto_128282 ) ) ( not ( = ?auto_128281 ?auto_128283 ) ) ( not ( = ?auto_128281 ?auto_128284 ) ) ( not ( = ?auto_128282 ?auto_128283 ) ) ( not ( = ?auto_128282 ?auto_128284 ) ) ( not ( = ?auto_128283 ?auto_128284 ) ) ( ON ?auto_128282 ?auto_128283 ) ( ON ?auto_128281 ?auto_128282 ) ( ON ?auto_128280 ?auto_128281 ) ( ON ?auto_128279 ?auto_128280 ) ( ON ?auto_128278 ?auto_128279 ) ( ON ?auto_128277 ?auto_128278 ) ( ON ?auto_128276 ?auto_128277 ) ( CLEAR ?auto_128274 ) ( ON ?auto_128275 ?auto_128276 ) ( CLEAR ?auto_128275 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_128273 ?auto_128274 ?auto_128275 )
      ( MAKE-11PILE ?auto_128273 ?auto_128274 ?auto_128275 ?auto_128276 ?auto_128277 ?auto_128278 ?auto_128279 ?auto_128280 ?auto_128281 ?auto_128282 ?auto_128283 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_128296 - BLOCK
      ?auto_128297 - BLOCK
      ?auto_128298 - BLOCK
      ?auto_128299 - BLOCK
      ?auto_128300 - BLOCK
      ?auto_128301 - BLOCK
      ?auto_128302 - BLOCK
      ?auto_128303 - BLOCK
      ?auto_128304 - BLOCK
      ?auto_128305 - BLOCK
      ?auto_128306 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_128306 ) ( ON-TABLE ?auto_128296 ) ( ON ?auto_128297 ?auto_128296 ) ( not ( = ?auto_128296 ?auto_128297 ) ) ( not ( = ?auto_128296 ?auto_128298 ) ) ( not ( = ?auto_128296 ?auto_128299 ) ) ( not ( = ?auto_128296 ?auto_128300 ) ) ( not ( = ?auto_128296 ?auto_128301 ) ) ( not ( = ?auto_128296 ?auto_128302 ) ) ( not ( = ?auto_128296 ?auto_128303 ) ) ( not ( = ?auto_128296 ?auto_128304 ) ) ( not ( = ?auto_128296 ?auto_128305 ) ) ( not ( = ?auto_128296 ?auto_128306 ) ) ( not ( = ?auto_128297 ?auto_128298 ) ) ( not ( = ?auto_128297 ?auto_128299 ) ) ( not ( = ?auto_128297 ?auto_128300 ) ) ( not ( = ?auto_128297 ?auto_128301 ) ) ( not ( = ?auto_128297 ?auto_128302 ) ) ( not ( = ?auto_128297 ?auto_128303 ) ) ( not ( = ?auto_128297 ?auto_128304 ) ) ( not ( = ?auto_128297 ?auto_128305 ) ) ( not ( = ?auto_128297 ?auto_128306 ) ) ( not ( = ?auto_128298 ?auto_128299 ) ) ( not ( = ?auto_128298 ?auto_128300 ) ) ( not ( = ?auto_128298 ?auto_128301 ) ) ( not ( = ?auto_128298 ?auto_128302 ) ) ( not ( = ?auto_128298 ?auto_128303 ) ) ( not ( = ?auto_128298 ?auto_128304 ) ) ( not ( = ?auto_128298 ?auto_128305 ) ) ( not ( = ?auto_128298 ?auto_128306 ) ) ( not ( = ?auto_128299 ?auto_128300 ) ) ( not ( = ?auto_128299 ?auto_128301 ) ) ( not ( = ?auto_128299 ?auto_128302 ) ) ( not ( = ?auto_128299 ?auto_128303 ) ) ( not ( = ?auto_128299 ?auto_128304 ) ) ( not ( = ?auto_128299 ?auto_128305 ) ) ( not ( = ?auto_128299 ?auto_128306 ) ) ( not ( = ?auto_128300 ?auto_128301 ) ) ( not ( = ?auto_128300 ?auto_128302 ) ) ( not ( = ?auto_128300 ?auto_128303 ) ) ( not ( = ?auto_128300 ?auto_128304 ) ) ( not ( = ?auto_128300 ?auto_128305 ) ) ( not ( = ?auto_128300 ?auto_128306 ) ) ( not ( = ?auto_128301 ?auto_128302 ) ) ( not ( = ?auto_128301 ?auto_128303 ) ) ( not ( = ?auto_128301 ?auto_128304 ) ) ( not ( = ?auto_128301 ?auto_128305 ) ) ( not ( = ?auto_128301 ?auto_128306 ) ) ( not ( = ?auto_128302 ?auto_128303 ) ) ( not ( = ?auto_128302 ?auto_128304 ) ) ( not ( = ?auto_128302 ?auto_128305 ) ) ( not ( = ?auto_128302 ?auto_128306 ) ) ( not ( = ?auto_128303 ?auto_128304 ) ) ( not ( = ?auto_128303 ?auto_128305 ) ) ( not ( = ?auto_128303 ?auto_128306 ) ) ( not ( = ?auto_128304 ?auto_128305 ) ) ( not ( = ?auto_128304 ?auto_128306 ) ) ( not ( = ?auto_128305 ?auto_128306 ) ) ( ON ?auto_128305 ?auto_128306 ) ( ON ?auto_128304 ?auto_128305 ) ( ON ?auto_128303 ?auto_128304 ) ( ON ?auto_128302 ?auto_128303 ) ( ON ?auto_128301 ?auto_128302 ) ( ON ?auto_128300 ?auto_128301 ) ( ON ?auto_128299 ?auto_128300 ) ( CLEAR ?auto_128297 ) ( ON ?auto_128298 ?auto_128299 ) ( CLEAR ?auto_128298 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_128296 ?auto_128297 ?auto_128298 )
      ( MAKE-11PILE ?auto_128296 ?auto_128297 ?auto_128298 ?auto_128299 ?auto_128300 ?auto_128301 ?auto_128302 ?auto_128303 ?auto_128304 ?auto_128305 ?auto_128306 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_128318 - BLOCK
      ?auto_128319 - BLOCK
      ?auto_128320 - BLOCK
      ?auto_128321 - BLOCK
      ?auto_128322 - BLOCK
      ?auto_128323 - BLOCK
      ?auto_128324 - BLOCK
      ?auto_128325 - BLOCK
      ?auto_128326 - BLOCK
      ?auto_128327 - BLOCK
      ?auto_128328 - BLOCK
    )
    :vars
    (
      ?auto_128329 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128328 ?auto_128329 ) ( ON-TABLE ?auto_128318 ) ( not ( = ?auto_128318 ?auto_128319 ) ) ( not ( = ?auto_128318 ?auto_128320 ) ) ( not ( = ?auto_128318 ?auto_128321 ) ) ( not ( = ?auto_128318 ?auto_128322 ) ) ( not ( = ?auto_128318 ?auto_128323 ) ) ( not ( = ?auto_128318 ?auto_128324 ) ) ( not ( = ?auto_128318 ?auto_128325 ) ) ( not ( = ?auto_128318 ?auto_128326 ) ) ( not ( = ?auto_128318 ?auto_128327 ) ) ( not ( = ?auto_128318 ?auto_128328 ) ) ( not ( = ?auto_128318 ?auto_128329 ) ) ( not ( = ?auto_128319 ?auto_128320 ) ) ( not ( = ?auto_128319 ?auto_128321 ) ) ( not ( = ?auto_128319 ?auto_128322 ) ) ( not ( = ?auto_128319 ?auto_128323 ) ) ( not ( = ?auto_128319 ?auto_128324 ) ) ( not ( = ?auto_128319 ?auto_128325 ) ) ( not ( = ?auto_128319 ?auto_128326 ) ) ( not ( = ?auto_128319 ?auto_128327 ) ) ( not ( = ?auto_128319 ?auto_128328 ) ) ( not ( = ?auto_128319 ?auto_128329 ) ) ( not ( = ?auto_128320 ?auto_128321 ) ) ( not ( = ?auto_128320 ?auto_128322 ) ) ( not ( = ?auto_128320 ?auto_128323 ) ) ( not ( = ?auto_128320 ?auto_128324 ) ) ( not ( = ?auto_128320 ?auto_128325 ) ) ( not ( = ?auto_128320 ?auto_128326 ) ) ( not ( = ?auto_128320 ?auto_128327 ) ) ( not ( = ?auto_128320 ?auto_128328 ) ) ( not ( = ?auto_128320 ?auto_128329 ) ) ( not ( = ?auto_128321 ?auto_128322 ) ) ( not ( = ?auto_128321 ?auto_128323 ) ) ( not ( = ?auto_128321 ?auto_128324 ) ) ( not ( = ?auto_128321 ?auto_128325 ) ) ( not ( = ?auto_128321 ?auto_128326 ) ) ( not ( = ?auto_128321 ?auto_128327 ) ) ( not ( = ?auto_128321 ?auto_128328 ) ) ( not ( = ?auto_128321 ?auto_128329 ) ) ( not ( = ?auto_128322 ?auto_128323 ) ) ( not ( = ?auto_128322 ?auto_128324 ) ) ( not ( = ?auto_128322 ?auto_128325 ) ) ( not ( = ?auto_128322 ?auto_128326 ) ) ( not ( = ?auto_128322 ?auto_128327 ) ) ( not ( = ?auto_128322 ?auto_128328 ) ) ( not ( = ?auto_128322 ?auto_128329 ) ) ( not ( = ?auto_128323 ?auto_128324 ) ) ( not ( = ?auto_128323 ?auto_128325 ) ) ( not ( = ?auto_128323 ?auto_128326 ) ) ( not ( = ?auto_128323 ?auto_128327 ) ) ( not ( = ?auto_128323 ?auto_128328 ) ) ( not ( = ?auto_128323 ?auto_128329 ) ) ( not ( = ?auto_128324 ?auto_128325 ) ) ( not ( = ?auto_128324 ?auto_128326 ) ) ( not ( = ?auto_128324 ?auto_128327 ) ) ( not ( = ?auto_128324 ?auto_128328 ) ) ( not ( = ?auto_128324 ?auto_128329 ) ) ( not ( = ?auto_128325 ?auto_128326 ) ) ( not ( = ?auto_128325 ?auto_128327 ) ) ( not ( = ?auto_128325 ?auto_128328 ) ) ( not ( = ?auto_128325 ?auto_128329 ) ) ( not ( = ?auto_128326 ?auto_128327 ) ) ( not ( = ?auto_128326 ?auto_128328 ) ) ( not ( = ?auto_128326 ?auto_128329 ) ) ( not ( = ?auto_128327 ?auto_128328 ) ) ( not ( = ?auto_128327 ?auto_128329 ) ) ( not ( = ?auto_128328 ?auto_128329 ) ) ( ON ?auto_128327 ?auto_128328 ) ( ON ?auto_128326 ?auto_128327 ) ( ON ?auto_128325 ?auto_128326 ) ( ON ?auto_128324 ?auto_128325 ) ( ON ?auto_128323 ?auto_128324 ) ( ON ?auto_128322 ?auto_128323 ) ( ON ?auto_128321 ?auto_128322 ) ( ON ?auto_128320 ?auto_128321 ) ( CLEAR ?auto_128318 ) ( ON ?auto_128319 ?auto_128320 ) ( CLEAR ?auto_128319 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_128318 ?auto_128319 )
      ( MAKE-11PILE ?auto_128318 ?auto_128319 ?auto_128320 ?auto_128321 ?auto_128322 ?auto_128323 ?auto_128324 ?auto_128325 ?auto_128326 ?auto_128327 ?auto_128328 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_128341 - BLOCK
      ?auto_128342 - BLOCK
      ?auto_128343 - BLOCK
      ?auto_128344 - BLOCK
      ?auto_128345 - BLOCK
      ?auto_128346 - BLOCK
      ?auto_128347 - BLOCK
      ?auto_128348 - BLOCK
      ?auto_128349 - BLOCK
      ?auto_128350 - BLOCK
      ?auto_128351 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_128351 ) ( ON-TABLE ?auto_128341 ) ( not ( = ?auto_128341 ?auto_128342 ) ) ( not ( = ?auto_128341 ?auto_128343 ) ) ( not ( = ?auto_128341 ?auto_128344 ) ) ( not ( = ?auto_128341 ?auto_128345 ) ) ( not ( = ?auto_128341 ?auto_128346 ) ) ( not ( = ?auto_128341 ?auto_128347 ) ) ( not ( = ?auto_128341 ?auto_128348 ) ) ( not ( = ?auto_128341 ?auto_128349 ) ) ( not ( = ?auto_128341 ?auto_128350 ) ) ( not ( = ?auto_128341 ?auto_128351 ) ) ( not ( = ?auto_128342 ?auto_128343 ) ) ( not ( = ?auto_128342 ?auto_128344 ) ) ( not ( = ?auto_128342 ?auto_128345 ) ) ( not ( = ?auto_128342 ?auto_128346 ) ) ( not ( = ?auto_128342 ?auto_128347 ) ) ( not ( = ?auto_128342 ?auto_128348 ) ) ( not ( = ?auto_128342 ?auto_128349 ) ) ( not ( = ?auto_128342 ?auto_128350 ) ) ( not ( = ?auto_128342 ?auto_128351 ) ) ( not ( = ?auto_128343 ?auto_128344 ) ) ( not ( = ?auto_128343 ?auto_128345 ) ) ( not ( = ?auto_128343 ?auto_128346 ) ) ( not ( = ?auto_128343 ?auto_128347 ) ) ( not ( = ?auto_128343 ?auto_128348 ) ) ( not ( = ?auto_128343 ?auto_128349 ) ) ( not ( = ?auto_128343 ?auto_128350 ) ) ( not ( = ?auto_128343 ?auto_128351 ) ) ( not ( = ?auto_128344 ?auto_128345 ) ) ( not ( = ?auto_128344 ?auto_128346 ) ) ( not ( = ?auto_128344 ?auto_128347 ) ) ( not ( = ?auto_128344 ?auto_128348 ) ) ( not ( = ?auto_128344 ?auto_128349 ) ) ( not ( = ?auto_128344 ?auto_128350 ) ) ( not ( = ?auto_128344 ?auto_128351 ) ) ( not ( = ?auto_128345 ?auto_128346 ) ) ( not ( = ?auto_128345 ?auto_128347 ) ) ( not ( = ?auto_128345 ?auto_128348 ) ) ( not ( = ?auto_128345 ?auto_128349 ) ) ( not ( = ?auto_128345 ?auto_128350 ) ) ( not ( = ?auto_128345 ?auto_128351 ) ) ( not ( = ?auto_128346 ?auto_128347 ) ) ( not ( = ?auto_128346 ?auto_128348 ) ) ( not ( = ?auto_128346 ?auto_128349 ) ) ( not ( = ?auto_128346 ?auto_128350 ) ) ( not ( = ?auto_128346 ?auto_128351 ) ) ( not ( = ?auto_128347 ?auto_128348 ) ) ( not ( = ?auto_128347 ?auto_128349 ) ) ( not ( = ?auto_128347 ?auto_128350 ) ) ( not ( = ?auto_128347 ?auto_128351 ) ) ( not ( = ?auto_128348 ?auto_128349 ) ) ( not ( = ?auto_128348 ?auto_128350 ) ) ( not ( = ?auto_128348 ?auto_128351 ) ) ( not ( = ?auto_128349 ?auto_128350 ) ) ( not ( = ?auto_128349 ?auto_128351 ) ) ( not ( = ?auto_128350 ?auto_128351 ) ) ( ON ?auto_128350 ?auto_128351 ) ( ON ?auto_128349 ?auto_128350 ) ( ON ?auto_128348 ?auto_128349 ) ( ON ?auto_128347 ?auto_128348 ) ( ON ?auto_128346 ?auto_128347 ) ( ON ?auto_128345 ?auto_128346 ) ( ON ?auto_128344 ?auto_128345 ) ( ON ?auto_128343 ?auto_128344 ) ( CLEAR ?auto_128341 ) ( ON ?auto_128342 ?auto_128343 ) ( CLEAR ?auto_128342 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_128341 ?auto_128342 )
      ( MAKE-11PILE ?auto_128341 ?auto_128342 ?auto_128343 ?auto_128344 ?auto_128345 ?auto_128346 ?auto_128347 ?auto_128348 ?auto_128349 ?auto_128350 ?auto_128351 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_128363 - BLOCK
      ?auto_128364 - BLOCK
      ?auto_128365 - BLOCK
      ?auto_128366 - BLOCK
      ?auto_128367 - BLOCK
      ?auto_128368 - BLOCK
      ?auto_128369 - BLOCK
      ?auto_128370 - BLOCK
      ?auto_128371 - BLOCK
      ?auto_128372 - BLOCK
      ?auto_128373 - BLOCK
    )
    :vars
    (
      ?auto_128374 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128373 ?auto_128374 ) ( not ( = ?auto_128363 ?auto_128364 ) ) ( not ( = ?auto_128363 ?auto_128365 ) ) ( not ( = ?auto_128363 ?auto_128366 ) ) ( not ( = ?auto_128363 ?auto_128367 ) ) ( not ( = ?auto_128363 ?auto_128368 ) ) ( not ( = ?auto_128363 ?auto_128369 ) ) ( not ( = ?auto_128363 ?auto_128370 ) ) ( not ( = ?auto_128363 ?auto_128371 ) ) ( not ( = ?auto_128363 ?auto_128372 ) ) ( not ( = ?auto_128363 ?auto_128373 ) ) ( not ( = ?auto_128363 ?auto_128374 ) ) ( not ( = ?auto_128364 ?auto_128365 ) ) ( not ( = ?auto_128364 ?auto_128366 ) ) ( not ( = ?auto_128364 ?auto_128367 ) ) ( not ( = ?auto_128364 ?auto_128368 ) ) ( not ( = ?auto_128364 ?auto_128369 ) ) ( not ( = ?auto_128364 ?auto_128370 ) ) ( not ( = ?auto_128364 ?auto_128371 ) ) ( not ( = ?auto_128364 ?auto_128372 ) ) ( not ( = ?auto_128364 ?auto_128373 ) ) ( not ( = ?auto_128364 ?auto_128374 ) ) ( not ( = ?auto_128365 ?auto_128366 ) ) ( not ( = ?auto_128365 ?auto_128367 ) ) ( not ( = ?auto_128365 ?auto_128368 ) ) ( not ( = ?auto_128365 ?auto_128369 ) ) ( not ( = ?auto_128365 ?auto_128370 ) ) ( not ( = ?auto_128365 ?auto_128371 ) ) ( not ( = ?auto_128365 ?auto_128372 ) ) ( not ( = ?auto_128365 ?auto_128373 ) ) ( not ( = ?auto_128365 ?auto_128374 ) ) ( not ( = ?auto_128366 ?auto_128367 ) ) ( not ( = ?auto_128366 ?auto_128368 ) ) ( not ( = ?auto_128366 ?auto_128369 ) ) ( not ( = ?auto_128366 ?auto_128370 ) ) ( not ( = ?auto_128366 ?auto_128371 ) ) ( not ( = ?auto_128366 ?auto_128372 ) ) ( not ( = ?auto_128366 ?auto_128373 ) ) ( not ( = ?auto_128366 ?auto_128374 ) ) ( not ( = ?auto_128367 ?auto_128368 ) ) ( not ( = ?auto_128367 ?auto_128369 ) ) ( not ( = ?auto_128367 ?auto_128370 ) ) ( not ( = ?auto_128367 ?auto_128371 ) ) ( not ( = ?auto_128367 ?auto_128372 ) ) ( not ( = ?auto_128367 ?auto_128373 ) ) ( not ( = ?auto_128367 ?auto_128374 ) ) ( not ( = ?auto_128368 ?auto_128369 ) ) ( not ( = ?auto_128368 ?auto_128370 ) ) ( not ( = ?auto_128368 ?auto_128371 ) ) ( not ( = ?auto_128368 ?auto_128372 ) ) ( not ( = ?auto_128368 ?auto_128373 ) ) ( not ( = ?auto_128368 ?auto_128374 ) ) ( not ( = ?auto_128369 ?auto_128370 ) ) ( not ( = ?auto_128369 ?auto_128371 ) ) ( not ( = ?auto_128369 ?auto_128372 ) ) ( not ( = ?auto_128369 ?auto_128373 ) ) ( not ( = ?auto_128369 ?auto_128374 ) ) ( not ( = ?auto_128370 ?auto_128371 ) ) ( not ( = ?auto_128370 ?auto_128372 ) ) ( not ( = ?auto_128370 ?auto_128373 ) ) ( not ( = ?auto_128370 ?auto_128374 ) ) ( not ( = ?auto_128371 ?auto_128372 ) ) ( not ( = ?auto_128371 ?auto_128373 ) ) ( not ( = ?auto_128371 ?auto_128374 ) ) ( not ( = ?auto_128372 ?auto_128373 ) ) ( not ( = ?auto_128372 ?auto_128374 ) ) ( not ( = ?auto_128373 ?auto_128374 ) ) ( ON ?auto_128372 ?auto_128373 ) ( ON ?auto_128371 ?auto_128372 ) ( ON ?auto_128370 ?auto_128371 ) ( ON ?auto_128369 ?auto_128370 ) ( ON ?auto_128368 ?auto_128369 ) ( ON ?auto_128367 ?auto_128368 ) ( ON ?auto_128366 ?auto_128367 ) ( ON ?auto_128365 ?auto_128366 ) ( ON ?auto_128364 ?auto_128365 ) ( ON ?auto_128363 ?auto_128364 ) ( CLEAR ?auto_128363 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_128363 )
      ( MAKE-11PILE ?auto_128363 ?auto_128364 ?auto_128365 ?auto_128366 ?auto_128367 ?auto_128368 ?auto_128369 ?auto_128370 ?auto_128371 ?auto_128372 ?auto_128373 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_128386 - BLOCK
      ?auto_128387 - BLOCK
      ?auto_128388 - BLOCK
      ?auto_128389 - BLOCK
      ?auto_128390 - BLOCK
      ?auto_128391 - BLOCK
      ?auto_128392 - BLOCK
      ?auto_128393 - BLOCK
      ?auto_128394 - BLOCK
      ?auto_128395 - BLOCK
      ?auto_128396 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_128396 ) ( not ( = ?auto_128386 ?auto_128387 ) ) ( not ( = ?auto_128386 ?auto_128388 ) ) ( not ( = ?auto_128386 ?auto_128389 ) ) ( not ( = ?auto_128386 ?auto_128390 ) ) ( not ( = ?auto_128386 ?auto_128391 ) ) ( not ( = ?auto_128386 ?auto_128392 ) ) ( not ( = ?auto_128386 ?auto_128393 ) ) ( not ( = ?auto_128386 ?auto_128394 ) ) ( not ( = ?auto_128386 ?auto_128395 ) ) ( not ( = ?auto_128386 ?auto_128396 ) ) ( not ( = ?auto_128387 ?auto_128388 ) ) ( not ( = ?auto_128387 ?auto_128389 ) ) ( not ( = ?auto_128387 ?auto_128390 ) ) ( not ( = ?auto_128387 ?auto_128391 ) ) ( not ( = ?auto_128387 ?auto_128392 ) ) ( not ( = ?auto_128387 ?auto_128393 ) ) ( not ( = ?auto_128387 ?auto_128394 ) ) ( not ( = ?auto_128387 ?auto_128395 ) ) ( not ( = ?auto_128387 ?auto_128396 ) ) ( not ( = ?auto_128388 ?auto_128389 ) ) ( not ( = ?auto_128388 ?auto_128390 ) ) ( not ( = ?auto_128388 ?auto_128391 ) ) ( not ( = ?auto_128388 ?auto_128392 ) ) ( not ( = ?auto_128388 ?auto_128393 ) ) ( not ( = ?auto_128388 ?auto_128394 ) ) ( not ( = ?auto_128388 ?auto_128395 ) ) ( not ( = ?auto_128388 ?auto_128396 ) ) ( not ( = ?auto_128389 ?auto_128390 ) ) ( not ( = ?auto_128389 ?auto_128391 ) ) ( not ( = ?auto_128389 ?auto_128392 ) ) ( not ( = ?auto_128389 ?auto_128393 ) ) ( not ( = ?auto_128389 ?auto_128394 ) ) ( not ( = ?auto_128389 ?auto_128395 ) ) ( not ( = ?auto_128389 ?auto_128396 ) ) ( not ( = ?auto_128390 ?auto_128391 ) ) ( not ( = ?auto_128390 ?auto_128392 ) ) ( not ( = ?auto_128390 ?auto_128393 ) ) ( not ( = ?auto_128390 ?auto_128394 ) ) ( not ( = ?auto_128390 ?auto_128395 ) ) ( not ( = ?auto_128390 ?auto_128396 ) ) ( not ( = ?auto_128391 ?auto_128392 ) ) ( not ( = ?auto_128391 ?auto_128393 ) ) ( not ( = ?auto_128391 ?auto_128394 ) ) ( not ( = ?auto_128391 ?auto_128395 ) ) ( not ( = ?auto_128391 ?auto_128396 ) ) ( not ( = ?auto_128392 ?auto_128393 ) ) ( not ( = ?auto_128392 ?auto_128394 ) ) ( not ( = ?auto_128392 ?auto_128395 ) ) ( not ( = ?auto_128392 ?auto_128396 ) ) ( not ( = ?auto_128393 ?auto_128394 ) ) ( not ( = ?auto_128393 ?auto_128395 ) ) ( not ( = ?auto_128393 ?auto_128396 ) ) ( not ( = ?auto_128394 ?auto_128395 ) ) ( not ( = ?auto_128394 ?auto_128396 ) ) ( not ( = ?auto_128395 ?auto_128396 ) ) ( ON ?auto_128395 ?auto_128396 ) ( ON ?auto_128394 ?auto_128395 ) ( ON ?auto_128393 ?auto_128394 ) ( ON ?auto_128392 ?auto_128393 ) ( ON ?auto_128391 ?auto_128392 ) ( ON ?auto_128390 ?auto_128391 ) ( ON ?auto_128389 ?auto_128390 ) ( ON ?auto_128388 ?auto_128389 ) ( ON ?auto_128387 ?auto_128388 ) ( ON ?auto_128386 ?auto_128387 ) ( CLEAR ?auto_128386 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_128386 )
      ( MAKE-11PILE ?auto_128386 ?auto_128387 ?auto_128388 ?auto_128389 ?auto_128390 ?auto_128391 ?auto_128392 ?auto_128393 ?auto_128394 ?auto_128395 ?auto_128396 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_128408 - BLOCK
      ?auto_128409 - BLOCK
      ?auto_128410 - BLOCK
      ?auto_128411 - BLOCK
      ?auto_128412 - BLOCK
      ?auto_128413 - BLOCK
      ?auto_128414 - BLOCK
      ?auto_128415 - BLOCK
      ?auto_128416 - BLOCK
      ?auto_128417 - BLOCK
      ?auto_128418 - BLOCK
    )
    :vars
    (
      ?auto_128419 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128408 ?auto_128409 ) ) ( not ( = ?auto_128408 ?auto_128410 ) ) ( not ( = ?auto_128408 ?auto_128411 ) ) ( not ( = ?auto_128408 ?auto_128412 ) ) ( not ( = ?auto_128408 ?auto_128413 ) ) ( not ( = ?auto_128408 ?auto_128414 ) ) ( not ( = ?auto_128408 ?auto_128415 ) ) ( not ( = ?auto_128408 ?auto_128416 ) ) ( not ( = ?auto_128408 ?auto_128417 ) ) ( not ( = ?auto_128408 ?auto_128418 ) ) ( not ( = ?auto_128409 ?auto_128410 ) ) ( not ( = ?auto_128409 ?auto_128411 ) ) ( not ( = ?auto_128409 ?auto_128412 ) ) ( not ( = ?auto_128409 ?auto_128413 ) ) ( not ( = ?auto_128409 ?auto_128414 ) ) ( not ( = ?auto_128409 ?auto_128415 ) ) ( not ( = ?auto_128409 ?auto_128416 ) ) ( not ( = ?auto_128409 ?auto_128417 ) ) ( not ( = ?auto_128409 ?auto_128418 ) ) ( not ( = ?auto_128410 ?auto_128411 ) ) ( not ( = ?auto_128410 ?auto_128412 ) ) ( not ( = ?auto_128410 ?auto_128413 ) ) ( not ( = ?auto_128410 ?auto_128414 ) ) ( not ( = ?auto_128410 ?auto_128415 ) ) ( not ( = ?auto_128410 ?auto_128416 ) ) ( not ( = ?auto_128410 ?auto_128417 ) ) ( not ( = ?auto_128410 ?auto_128418 ) ) ( not ( = ?auto_128411 ?auto_128412 ) ) ( not ( = ?auto_128411 ?auto_128413 ) ) ( not ( = ?auto_128411 ?auto_128414 ) ) ( not ( = ?auto_128411 ?auto_128415 ) ) ( not ( = ?auto_128411 ?auto_128416 ) ) ( not ( = ?auto_128411 ?auto_128417 ) ) ( not ( = ?auto_128411 ?auto_128418 ) ) ( not ( = ?auto_128412 ?auto_128413 ) ) ( not ( = ?auto_128412 ?auto_128414 ) ) ( not ( = ?auto_128412 ?auto_128415 ) ) ( not ( = ?auto_128412 ?auto_128416 ) ) ( not ( = ?auto_128412 ?auto_128417 ) ) ( not ( = ?auto_128412 ?auto_128418 ) ) ( not ( = ?auto_128413 ?auto_128414 ) ) ( not ( = ?auto_128413 ?auto_128415 ) ) ( not ( = ?auto_128413 ?auto_128416 ) ) ( not ( = ?auto_128413 ?auto_128417 ) ) ( not ( = ?auto_128413 ?auto_128418 ) ) ( not ( = ?auto_128414 ?auto_128415 ) ) ( not ( = ?auto_128414 ?auto_128416 ) ) ( not ( = ?auto_128414 ?auto_128417 ) ) ( not ( = ?auto_128414 ?auto_128418 ) ) ( not ( = ?auto_128415 ?auto_128416 ) ) ( not ( = ?auto_128415 ?auto_128417 ) ) ( not ( = ?auto_128415 ?auto_128418 ) ) ( not ( = ?auto_128416 ?auto_128417 ) ) ( not ( = ?auto_128416 ?auto_128418 ) ) ( not ( = ?auto_128417 ?auto_128418 ) ) ( ON ?auto_128408 ?auto_128419 ) ( not ( = ?auto_128418 ?auto_128419 ) ) ( not ( = ?auto_128417 ?auto_128419 ) ) ( not ( = ?auto_128416 ?auto_128419 ) ) ( not ( = ?auto_128415 ?auto_128419 ) ) ( not ( = ?auto_128414 ?auto_128419 ) ) ( not ( = ?auto_128413 ?auto_128419 ) ) ( not ( = ?auto_128412 ?auto_128419 ) ) ( not ( = ?auto_128411 ?auto_128419 ) ) ( not ( = ?auto_128410 ?auto_128419 ) ) ( not ( = ?auto_128409 ?auto_128419 ) ) ( not ( = ?auto_128408 ?auto_128419 ) ) ( ON ?auto_128409 ?auto_128408 ) ( ON ?auto_128410 ?auto_128409 ) ( ON ?auto_128411 ?auto_128410 ) ( ON ?auto_128412 ?auto_128411 ) ( ON ?auto_128413 ?auto_128412 ) ( ON ?auto_128414 ?auto_128413 ) ( ON ?auto_128415 ?auto_128414 ) ( ON ?auto_128416 ?auto_128415 ) ( ON ?auto_128417 ?auto_128416 ) ( ON ?auto_128418 ?auto_128417 ) ( CLEAR ?auto_128418 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_128418 ?auto_128417 ?auto_128416 ?auto_128415 ?auto_128414 ?auto_128413 ?auto_128412 ?auto_128411 ?auto_128410 ?auto_128409 ?auto_128408 )
      ( MAKE-11PILE ?auto_128408 ?auto_128409 ?auto_128410 ?auto_128411 ?auto_128412 ?auto_128413 ?auto_128414 ?auto_128415 ?auto_128416 ?auto_128417 ?auto_128418 ) )
  )

)

