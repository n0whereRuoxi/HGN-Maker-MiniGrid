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
      ?auto_233257 - BLOCK
    )
    :vars
    (
      ?auto_233258 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233257 ?auto_233258 ) ( CLEAR ?auto_233257 ) ( HAND-EMPTY ) ( not ( = ?auto_233257 ?auto_233258 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_233257 ?auto_233258 )
      ( !PUTDOWN ?auto_233257 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_233260 - BLOCK
    )
    :vars
    (
      ?auto_233261 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233260 ?auto_233261 ) ( CLEAR ?auto_233260 ) ( HAND-EMPTY ) ( not ( = ?auto_233260 ?auto_233261 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_233260 ?auto_233261 )
      ( !PUTDOWN ?auto_233260 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_233264 - BLOCK
      ?auto_233265 - BLOCK
    )
    :vars
    (
      ?auto_233266 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_233264 ) ( ON ?auto_233265 ?auto_233266 ) ( CLEAR ?auto_233265 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_233264 ) ( not ( = ?auto_233264 ?auto_233265 ) ) ( not ( = ?auto_233264 ?auto_233266 ) ) ( not ( = ?auto_233265 ?auto_233266 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_233265 ?auto_233266 )
      ( !STACK ?auto_233265 ?auto_233264 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_233269 - BLOCK
      ?auto_233270 - BLOCK
    )
    :vars
    (
      ?auto_233271 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_233269 ) ( ON ?auto_233270 ?auto_233271 ) ( CLEAR ?auto_233270 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_233269 ) ( not ( = ?auto_233269 ?auto_233270 ) ) ( not ( = ?auto_233269 ?auto_233271 ) ) ( not ( = ?auto_233270 ?auto_233271 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_233270 ?auto_233271 )
      ( !STACK ?auto_233270 ?auto_233269 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_233274 - BLOCK
      ?auto_233275 - BLOCK
    )
    :vars
    (
      ?auto_233276 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233275 ?auto_233276 ) ( not ( = ?auto_233274 ?auto_233275 ) ) ( not ( = ?auto_233274 ?auto_233276 ) ) ( not ( = ?auto_233275 ?auto_233276 ) ) ( ON ?auto_233274 ?auto_233275 ) ( CLEAR ?auto_233274 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_233274 )
      ( MAKE-2PILE ?auto_233274 ?auto_233275 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_233279 - BLOCK
      ?auto_233280 - BLOCK
    )
    :vars
    (
      ?auto_233281 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233280 ?auto_233281 ) ( not ( = ?auto_233279 ?auto_233280 ) ) ( not ( = ?auto_233279 ?auto_233281 ) ) ( not ( = ?auto_233280 ?auto_233281 ) ) ( ON ?auto_233279 ?auto_233280 ) ( CLEAR ?auto_233279 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_233279 )
      ( MAKE-2PILE ?auto_233279 ?auto_233280 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_233285 - BLOCK
      ?auto_233286 - BLOCK
      ?auto_233287 - BLOCK
    )
    :vars
    (
      ?auto_233288 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_233286 ) ( ON ?auto_233287 ?auto_233288 ) ( CLEAR ?auto_233287 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_233285 ) ( ON ?auto_233286 ?auto_233285 ) ( not ( = ?auto_233285 ?auto_233286 ) ) ( not ( = ?auto_233285 ?auto_233287 ) ) ( not ( = ?auto_233285 ?auto_233288 ) ) ( not ( = ?auto_233286 ?auto_233287 ) ) ( not ( = ?auto_233286 ?auto_233288 ) ) ( not ( = ?auto_233287 ?auto_233288 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_233287 ?auto_233288 )
      ( !STACK ?auto_233287 ?auto_233286 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_233292 - BLOCK
      ?auto_233293 - BLOCK
      ?auto_233294 - BLOCK
    )
    :vars
    (
      ?auto_233295 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_233293 ) ( ON ?auto_233294 ?auto_233295 ) ( CLEAR ?auto_233294 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_233292 ) ( ON ?auto_233293 ?auto_233292 ) ( not ( = ?auto_233292 ?auto_233293 ) ) ( not ( = ?auto_233292 ?auto_233294 ) ) ( not ( = ?auto_233292 ?auto_233295 ) ) ( not ( = ?auto_233293 ?auto_233294 ) ) ( not ( = ?auto_233293 ?auto_233295 ) ) ( not ( = ?auto_233294 ?auto_233295 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_233294 ?auto_233295 )
      ( !STACK ?auto_233294 ?auto_233293 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_233299 - BLOCK
      ?auto_233300 - BLOCK
      ?auto_233301 - BLOCK
    )
    :vars
    (
      ?auto_233302 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233301 ?auto_233302 ) ( ON-TABLE ?auto_233299 ) ( not ( = ?auto_233299 ?auto_233300 ) ) ( not ( = ?auto_233299 ?auto_233301 ) ) ( not ( = ?auto_233299 ?auto_233302 ) ) ( not ( = ?auto_233300 ?auto_233301 ) ) ( not ( = ?auto_233300 ?auto_233302 ) ) ( not ( = ?auto_233301 ?auto_233302 ) ) ( CLEAR ?auto_233299 ) ( ON ?auto_233300 ?auto_233301 ) ( CLEAR ?auto_233300 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_233299 ?auto_233300 )
      ( MAKE-3PILE ?auto_233299 ?auto_233300 ?auto_233301 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_233306 - BLOCK
      ?auto_233307 - BLOCK
      ?auto_233308 - BLOCK
    )
    :vars
    (
      ?auto_233309 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233308 ?auto_233309 ) ( ON-TABLE ?auto_233306 ) ( not ( = ?auto_233306 ?auto_233307 ) ) ( not ( = ?auto_233306 ?auto_233308 ) ) ( not ( = ?auto_233306 ?auto_233309 ) ) ( not ( = ?auto_233307 ?auto_233308 ) ) ( not ( = ?auto_233307 ?auto_233309 ) ) ( not ( = ?auto_233308 ?auto_233309 ) ) ( CLEAR ?auto_233306 ) ( ON ?auto_233307 ?auto_233308 ) ( CLEAR ?auto_233307 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_233306 ?auto_233307 )
      ( MAKE-3PILE ?auto_233306 ?auto_233307 ?auto_233308 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_233313 - BLOCK
      ?auto_233314 - BLOCK
      ?auto_233315 - BLOCK
    )
    :vars
    (
      ?auto_233316 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233315 ?auto_233316 ) ( not ( = ?auto_233313 ?auto_233314 ) ) ( not ( = ?auto_233313 ?auto_233315 ) ) ( not ( = ?auto_233313 ?auto_233316 ) ) ( not ( = ?auto_233314 ?auto_233315 ) ) ( not ( = ?auto_233314 ?auto_233316 ) ) ( not ( = ?auto_233315 ?auto_233316 ) ) ( ON ?auto_233314 ?auto_233315 ) ( ON ?auto_233313 ?auto_233314 ) ( CLEAR ?auto_233313 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_233313 )
      ( MAKE-3PILE ?auto_233313 ?auto_233314 ?auto_233315 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_233320 - BLOCK
      ?auto_233321 - BLOCK
      ?auto_233322 - BLOCK
    )
    :vars
    (
      ?auto_233323 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233322 ?auto_233323 ) ( not ( = ?auto_233320 ?auto_233321 ) ) ( not ( = ?auto_233320 ?auto_233322 ) ) ( not ( = ?auto_233320 ?auto_233323 ) ) ( not ( = ?auto_233321 ?auto_233322 ) ) ( not ( = ?auto_233321 ?auto_233323 ) ) ( not ( = ?auto_233322 ?auto_233323 ) ) ( ON ?auto_233321 ?auto_233322 ) ( ON ?auto_233320 ?auto_233321 ) ( CLEAR ?auto_233320 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_233320 )
      ( MAKE-3PILE ?auto_233320 ?auto_233321 ?auto_233322 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_233328 - BLOCK
      ?auto_233329 - BLOCK
      ?auto_233330 - BLOCK
      ?auto_233331 - BLOCK
    )
    :vars
    (
      ?auto_233332 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_233330 ) ( ON ?auto_233331 ?auto_233332 ) ( CLEAR ?auto_233331 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_233328 ) ( ON ?auto_233329 ?auto_233328 ) ( ON ?auto_233330 ?auto_233329 ) ( not ( = ?auto_233328 ?auto_233329 ) ) ( not ( = ?auto_233328 ?auto_233330 ) ) ( not ( = ?auto_233328 ?auto_233331 ) ) ( not ( = ?auto_233328 ?auto_233332 ) ) ( not ( = ?auto_233329 ?auto_233330 ) ) ( not ( = ?auto_233329 ?auto_233331 ) ) ( not ( = ?auto_233329 ?auto_233332 ) ) ( not ( = ?auto_233330 ?auto_233331 ) ) ( not ( = ?auto_233330 ?auto_233332 ) ) ( not ( = ?auto_233331 ?auto_233332 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_233331 ?auto_233332 )
      ( !STACK ?auto_233331 ?auto_233330 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_233337 - BLOCK
      ?auto_233338 - BLOCK
      ?auto_233339 - BLOCK
      ?auto_233340 - BLOCK
    )
    :vars
    (
      ?auto_233341 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_233339 ) ( ON ?auto_233340 ?auto_233341 ) ( CLEAR ?auto_233340 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_233337 ) ( ON ?auto_233338 ?auto_233337 ) ( ON ?auto_233339 ?auto_233338 ) ( not ( = ?auto_233337 ?auto_233338 ) ) ( not ( = ?auto_233337 ?auto_233339 ) ) ( not ( = ?auto_233337 ?auto_233340 ) ) ( not ( = ?auto_233337 ?auto_233341 ) ) ( not ( = ?auto_233338 ?auto_233339 ) ) ( not ( = ?auto_233338 ?auto_233340 ) ) ( not ( = ?auto_233338 ?auto_233341 ) ) ( not ( = ?auto_233339 ?auto_233340 ) ) ( not ( = ?auto_233339 ?auto_233341 ) ) ( not ( = ?auto_233340 ?auto_233341 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_233340 ?auto_233341 )
      ( !STACK ?auto_233340 ?auto_233339 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_233346 - BLOCK
      ?auto_233347 - BLOCK
      ?auto_233348 - BLOCK
      ?auto_233349 - BLOCK
    )
    :vars
    (
      ?auto_233350 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233349 ?auto_233350 ) ( ON-TABLE ?auto_233346 ) ( ON ?auto_233347 ?auto_233346 ) ( not ( = ?auto_233346 ?auto_233347 ) ) ( not ( = ?auto_233346 ?auto_233348 ) ) ( not ( = ?auto_233346 ?auto_233349 ) ) ( not ( = ?auto_233346 ?auto_233350 ) ) ( not ( = ?auto_233347 ?auto_233348 ) ) ( not ( = ?auto_233347 ?auto_233349 ) ) ( not ( = ?auto_233347 ?auto_233350 ) ) ( not ( = ?auto_233348 ?auto_233349 ) ) ( not ( = ?auto_233348 ?auto_233350 ) ) ( not ( = ?auto_233349 ?auto_233350 ) ) ( CLEAR ?auto_233347 ) ( ON ?auto_233348 ?auto_233349 ) ( CLEAR ?auto_233348 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_233346 ?auto_233347 ?auto_233348 )
      ( MAKE-4PILE ?auto_233346 ?auto_233347 ?auto_233348 ?auto_233349 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_233355 - BLOCK
      ?auto_233356 - BLOCK
      ?auto_233357 - BLOCK
      ?auto_233358 - BLOCK
    )
    :vars
    (
      ?auto_233359 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233358 ?auto_233359 ) ( ON-TABLE ?auto_233355 ) ( ON ?auto_233356 ?auto_233355 ) ( not ( = ?auto_233355 ?auto_233356 ) ) ( not ( = ?auto_233355 ?auto_233357 ) ) ( not ( = ?auto_233355 ?auto_233358 ) ) ( not ( = ?auto_233355 ?auto_233359 ) ) ( not ( = ?auto_233356 ?auto_233357 ) ) ( not ( = ?auto_233356 ?auto_233358 ) ) ( not ( = ?auto_233356 ?auto_233359 ) ) ( not ( = ?auto_233357 ?auto_233358 ) ) ( not ( = ?auto_233357 ?auto_233359 ) ) ( not ( = ?auto_233358 ?auto_233359 ) ) ( CLEAR ?auto_233356 ) ( ON ?auto_233357 ?auto_233358 ) ( CLEAR ?auto_233357 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_233355 ?auto_233356 ?auto_233357 )
      ( MAKE-4PILE ?auto_233355 ?auto_233356 ?auto_233357 ?auto_233358 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_233364 - BLOCK
      ?auto_233365 - BLOCK
      ?auto_233366 - BLOCK
      ?auto_233367 - BLOCK
    )
    :vars
    (
      ?auto_233368 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233367 ?auto_233368 ) ( ON-TABLE ?auto_233364 ) ( not ( = ?auto_233364 ?auto_233365 ) ) ( not ( = ?auto_233364 ?auto_233366 ) ) ( not ( = ?auto_233364 ?auto_233367 ) ) ( not ( = ?auto_233364 ?auto_233368 ) ) ( not ( = ?auto_233365 ?auto_233366 ) ) ( not ( = ?auto_233365 ?auto_233367 ) ) ( not ( = ?auto_233365 ?auto_233368 ) ) ( not ( = ?auto_233366 ?auto_233367 ) ) ( not ( = ?auto_233366 ?auto_233368 ) ) ( not ( = ?auto_233367 ?auto_233368 ) ) ( ON ?auto_233366 ?auto_233367 ) ( CLEAR ?auto_233364 ) ( ON ?auto_233365 ?auto_233366 ) ( CLEAR ?auto_233365 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_233364 ?auto_233365 )
      ( MAKE-4PILE ?auto_233364 ?auto_233365 ?auto_233366 ?auto_233367 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_233373 - BLOCK
      ?auto_233374 - BLOCK
      ?auto_233375 - BLOCK
      ?auto_233376 - BLOCK
    )
    :vars
    (
      ?auto_233377 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233376 ?auto_233377 ) ( ON-TABLE ?auto_233373 ) ( not ( = ?auto_233373 ?auto_233374 ) ) ( not ( = ?auto_233373 ?auto_233375 ) ) ( not ( = ?auto_233373 ?auto_233376 ) ) ( not ( = ?auto_233373 ?auto_233377 ) ) ( not ( = ?auto_233374 ?auto_233375 ) ) ( not ( = ?auto_233374 ?auto_233376 ) ) ( not ( = ?auto_233374 ?auto_233377 ) ) ( not ( = ?auto_233375 ?auto_233376 ) ) ( not ( = ?auto_233375 ?auto_233377 ) ) ( not ( = ?auto_233376 ?auto_233377 ) ) ( ON ?auto_233375 ?auto_233376 ) ( CLEAR ?auto_233373 ) ( ON ?auto_233374 ?auto_233375 ) ( CLEAR ?auto_233374 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_233373 ?auto_233374 )
      ( MAKE-4PILE ?auto_233373 ?auto_233374 ?auto_233375 ?auto_233376 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_233382 - BLOCK
      ?auto_233383 - BLOCK
      ?auto_233384 - BLOCK
      ?auto_233385 - BLOCK
    )
    :vars
    (
      ?auto_233386 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233385 ?auto_233386 ) ( not ( = ?auto_233382 ?auto_233383 ) ) ( not ( = ?auto_233382 ?auto_233384 ) ) ( not ( = ?auto_233382 ?auto_233385 ) ) ( not ( = ?auto_233382 ?auto_233386 ) ) ( not ( = ?auto_233383 ?auto_233384 ) ) ( not ( = ?auto_233383 ?auto_233385 ) ) ( not ( = ?auto_233383 ?auto_233386 ) ) ( not ( = ?auto_233384 ?auto_233385 ) ) ( not ( = ?auto_233384 ?auto_233386 ) ) ( not ( = ?auto_233385 ?auto_233386 ) ) ( ON ?auto_233384 ?auto_233385 ) ( ON ?auto_233383 ?auto_233384 ) ( ON ?auto_233382 ?auto_233383 ) ( CLEAR ?auto_233382 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_233382 )
      ( MAKE-4PILE ?auto_233382 ?auto_233383 ?auto_233384 ?auto_233385 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_233391 - BLOCK
      ?auto_233392 - BLOCK
      ?auto_233393 - BLOCK
      ?auto_233394 - BLOCK
    )
    :vars
    (
      ?auto_233395 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233394 ?auto_233395 ) ( not ( = ?auto_233391 ?auto_233392 ) ) ( not ( = ?auto_233391 ?auto_233393 ) ) ( not ( = ?auto_233391 ?auto_233394 ) ) ( not ( = ?auto_233391 ?auto_233395 ) ) ( not ( = ?auto_233392 ?auto_233393 ) ) ( not ( = ?auto_233392 ?auto_233394 ) ) ( not ( = ?auto_233392 ?auto_233395 ) ) ( not ( = ?auto_233393 ?auto_233394 ) ) ( not ( = ?auto_233393 ?auto_233395 ) ) ( not ( = ?auto_233394 ?auto_233395 ) ) ( ON ?auto_233393 ?auto_233394 ) ( ON ?auto_233392 ?auto_233393 ) ( ON ?auto_233391 ?auto_233392 ) ( CLEAR ?auto_233391 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_233391 )
      ( MAKE-4PILE ?auto_233391 ?auto_233392 ?auto_233393 ?auto_233394 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_233401 - BLOCK
      ?auto_233402 - BLOCK
      ?auto_233403 - BLOCK
      ?auto_233404 - BLOCK
      ?auto_233405 - BLOCK
    )
    :vars
    (
      ?auto_233406 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_233404 ) ( ON ?auto_233405 ?auto_233406 ) ( CLEAR ?auto_233405 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_233401 ) ( ON ?auto_233402 ?auto_233401 ) ( ON ?auto_233403 ?auto_233402 ) ( ON ?auto_233404 ?auto_233403 ) ( not ( = ?auto_233401 ?auto_233402 ) ) ( not ( = ?auto_233401 ?auto_233403 ) ) ( not ( = ?auto_233401 ?auto_233404 ) ) ( not ( = ?auto_233401 ?auto_233405 ) ) ( not ( = ?auto_233401 ?auto_233406 ) ) ( not ( = ?auto_233402 ?auto_233403 ) ) ( not ( = ?auto_233402 ?auto_233404 ) ) ( not ( = ?auto_233402 ?auto_233405 ) ) ( not ( = ?auto_233402 ?auto_233406 ) ) ( not ( = ?auto_233403 ?auto_233404 ) ) ( not ( = ?auto_233403 ?auto_233405 ) ) ( not ( = ?auto_233403 ?auto_233406 ) ) ( not ( = ?auto_233404 ?auto_233405 ) ) ( not ( = ?auto_233404 ?auto_233406 ) ) ( not ( = ?auto_233405 ?auto_233406 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_233405 ?auto_233406 )
      ( !STACK ?auto_233405 ?auto_233404 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_233412 - BLOCK
      ?auto_233413 - BLOCK
      ?auto_233414 - BLOCK
      ?auto_233415 - BLOCK
      ?auto_233416 - BLOCK
    )
    :vars
    (
      ?auto_233417 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_233415 ) ( ON ?auto_233416 ?auto_233417 ) ( CLEAR ?auto_233416 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_233412 ) ( ON ?auto_233413 ?auto_233412 ) ( ON ?auto_233414 ?auto_233413 ) ( ON ?auto_233415 ?auto_233414 ) ( not ( = ?auto_233412 ?auto_233413 ) ) ( not ( = ?auto_233412 ?auto_233414 ) ) ( not ( = ?auto_233412 ?auto_233415 ) ) ( not ( = ?auto_233412 ?auto_233416 ) ) ( not ( = ?auto_233412 ?auto_233417 ) ) ( not ( = ?auto_233413 ?auto_233414 ) ) ( not ( = ?auto_233413 ?auto_233415 ) ) ( not ( = ?auto_233413 ?auto_233416 ) ) ( not ( = ?auto_233413 ?auto_233417 ) ) ( not ( = ?auto_233414 ?auto_233415 ) ) ( not ( = ?auto_233414 ?auto_233416 ) ) ( not ( = ?auto_233414 ?auto_233417 ) ) ( not ( = ?auto_233415 ?auto_233416 ) ) ( not ( = ?auto_233415 ?auto_233417 ) ) ( not ( = ?auto_233416 ?auto_233417 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_233416 ?auto_233417 )
      ( !STACK ?auto_233416 ?auto_233415 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_233423 - BLOCK
      ?auto_233424 - BLOCK
      ?auto_233425 - BLOCK
      ?auto_233426 - BLOCK
      ?auto_233427 - BLOCK
    )
    :vars
    (
      ?auto_233428 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233427 ?auto_233428 ) ( ON-TABLE ?auto_233423 ) ( ON ?auto_233424 ?auto_233423 ) ( ON ?auto_233425 ?auto_233424 ) ( not ( = ?auto_233423 ?auto_233424 ) ) ( not ( = ?auto_233423 ?auto_233425 ) ) ( not ( = ?auto_233423 ?auto_233426 ) ) ( not ( = ?auto_233423 ?auto_233427 ) ) ( not ( = ?auto_233423 ?auto_233428 ) ) ( not ( = ?auto_233424 ?auto_233425 ) ) ( not ( = ?auto_233424 ?auto_233426 ) ) ( not ( = ?auto_233424 ?auto_233427 ) ) ( not ( = ?auto_233424 ?auto_233428 ) ) ( not ( = ?auto_233425 ?auto_233426 ) ) ( not ( = ?auto_233425 ?auto_233427 ) ) ( not ( = ?auto_233425 ?auto_233428 ) ) ( not ( = ?auto_233426 ?auto_233427 ) ) ( not ( = ?auto_233426 ?auto_233428 ) ) ( not ( = ?auto_233427 ?auto_233428 ) ) ( CLEAR ?auto_233425 ) ( ON ?auto_233426 ?auto_233427 ) ( CLEAR ?auto_233426 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_233423 ?auto_233424 ?auto_233425 ?auto_233426 )
      ( MAKE-5PILE ?auto_233423 ?auto_233424 ?auto_233425 ?auto_233426 ?auto_233427 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_233434 - BLOCK
      ?auto_233435 - BLOCK
      ?auto_233436 - BLOCK
      ?auto_233437 - BLOCK
      ?auto_233438 - BLOCK
    )
    :vars
    (
      ?auto_233439 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233438 ?auto_233439 ) ( ON-TABLE ?auto_233434 ) ( ON ?auto_233435 ?auto_233434 ) ( ON ?auto_233436 ?auto_233435 ) ( not ( = ?auto_233434 ?auto_233435 ) ) ( not ( = ?auto_233434 ?auto_233436 ) ) ( not ( = ?auto_233434 ?auto_233437 ) ) ( not ( = ?auto_233434 ?auto_233438 ) ) ( not ( = ?auto_233434 ?auto_233439 ) ) ( not ( = ?auto_233435 ?auto_233436 ) ) ( not ( = ?auto_233435 ?auto_233437 ) ) ( not ( = ?auto_233435 ?auto_233438 ) ) ( not ( = ?auto_233435 ?auto_233439 ) ) ( not ( = ?auto_233436 ?auto_233437 ) ) ( not ( = ?auto_233436 ?auto_233438 ) ) ( not ( = ?auto_233436 ?auto_233439 ) ) ( not ( = ?auto_233437 ?auto_233438 ) ) ( not ( = ?auto_233437 ?auto_233439 ) ) ( not ( = ?auto_233438 ?auto_233439 ) ) ( CLEAR ?auto_233436 ) ( ON ?auto_233437 ?auto_233438 ) ( CLEAR ?auto_233437 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_233434 ?auto_233435 ?auto_233436 ?auto_233437 )
      ( MAKE-5PILE ?auto_233434 ?auto_233435 ?auto_233436 ?auto_233437 ?auto_233438 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_233445 - BLOCK
      ?auto_233446 - BLOCK
      ?auto_233447 - BLOCK
      ?auto_233448 - BLOCK
      ?auto_233449 - BLOCK
    )
    :vars
    (
      ?auto_233450 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233449 ?auto_233450 ) ( ON-TABLE ?auto_233445 ) ( ON ?auto_233446 ?auto_233445 ) ( not ( = ?auto_233445 ?auto_233446 ) ) ( not ( = ?auto_233445 ?auto_233447 ) ) ( not ( = ?auto_233445 ?auto_233448 ) ) ( not ( = ?auto_233445 ?auto_233449 ) ) ( not ( = ?auto_233445 ?auto_233450 ) ) ( not ( = ?auto_233446 ?auto_233447 ) ) ( not ( = ?auto_233446 ?auto_233448 ) ) ( not ( = ?auto_233446 ?auto_233449 ) ) ( not ( = ?auto_233446 ?auto_233450 ) ) ( not ( = ?auto_233447 ?auto_233448 ) ) ( not ( = ?auto_233447 ?auto_233449 ) ) ( not ( = ?auto_233447 ?auto_233450 ) ) ( not ( = ?auto_233448 ?auto_233449 ) ) ( not ( = ?auto_233448 ?auto_233450 ) ) ( not ( = ?auto_233449 ?auto_233450 ) ) ( ON ?auto_233448 ?auto_233449 ) ( CLEAR ?auto_233446 ) ( ON ?auto_233447 ?auto_233448 ) ( CLEAR ?auto_233447 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_233445 ?auto_233446 ?auto_233447 )
      ( MAKE-5PILE ?auto_233445 ?auto_233446 ?auto_233447 ?auto_233448 ?auto_233449 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_233456 - BLOCK
      ?auto_233457 - BLOCK
      ?auto_233458 - BLOCK
      ?auto_233459 - BLOCK
      ?auto_233460 - BLOCK
    )
    :vars
    (
      ?auto_233461 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233460 ?auto_233461 ) ( ON-TABLE ?auto_233456 ) ( ON ?auto_233457 ?auto_233456 ) ( not ( = ?auto_233456 ?auto_233457 ) ) ( not ( = ?auto_233456 ?auto_233458 ) ) ( not ( = ?auto_233456 ?auto_233459 ) ) ( not ( = ?auto_233456 ?auto_233460 ) ) ( not ( = ?auto_233456 ?auto_233461 ) ) ( not ( = ?auto_233457 ?auto_233458 ) ) ( not ( = ?auto_233457 ?auto_233459 ) ) ( not ( = ?auto_233457 ?auto_233460 ) ) ( not ( = ?auto_233457 ?auto_233461 ) ) ( not ( = ?auto_233458 ?auto_233459 ) ) ( not ( = ?auto_233458 ?auto_233460 ) ) ( not ( = ?auto_233458 ?auto_233461 ) ) ( not ( = ?auto_233459 ?auto_233460 ) ) ( not ( = ?auto_233459 ?auto_233461 ) ) ( not ( = ?auto_233460 ?auto_233461 ) ) ( ON ?auto_233459 ?auto_233460 ) ( CLEAR ?auto_233457 ) ( ON ?auto_233458 ?auto_233459 ) ( CLEAR ?auto_233458 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_233456 ?auto_233457 ?auto_233458 )
      ( MAKE-5PILE ?auto_233456 ?auto_233457 ?auto_233458 ?auto_233459 ?auto_233460 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_233467 - BLOCK
      ?auto_233468 - BLOCK
      ?auto_233469 - BLOCK
      ?auto_233470 - BLOCK
      ?auto_233471 - BLOCK
    )
    :vars
    (
      ?auto_233472 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233471 ?auto_233472 ) ( ON-TABLE ?auto_233467 ) ( not ( = ?auto_233467 ?auto_233468 ) ) ( not ( = ?auto_233467 ?auto_233469 ) ) ( not ( = ?auto_233467 ?auto_233470 ) ) ( not ( = ?auto_233467 ?auto_233471 ) ) ( not ( = ?auto_233467 ?auto_233472 ) ) ( not ( = ?auto_233468 ?auto_233469 ) ) ( not ( = ?auto_233468 ?auto_233470 ) ) ( not ( = ?auto_233468 ?auto_233471 ) ) ( not ( = ?auto_233468 ?auto_233472 ) ) ( not ( = ?auto_233469 ?auto_233470 ) ) ( not ( = ?auto_233469 ?auto_233471 ) ) ( not ( = ?auto_233469 ?auto_233472 ) ) ( not ( = ?auto_233470 ?auto_233471 ) ) ( not ( = ?auto_233470 ?auto_233472 ) ) ( not ( = ?auto_233471 ?auto_233472 ) ) ( ON ?auto_233470 ?auto_233471 ) ( ON ?auto_233469 ?auto_233470 ) ( CLEAR ?auto_233467 ) ( ON ?auto_233468 ?auto_233469 ) ( CLEAR ?auto_233468 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_233467 ?auto_233468 )
      ( MAKE-5PILE ?auto_233467 ?auto_233468 ?auto_233469 ?auto_233470 ?auto_233471 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_233478 - BLOCK
      ?auto_233479 - BLOCK
      ?auto_233480 - BLOCK
      ?auto_233481 - BLOCK
      ?auto_233482 - BLOCK
    )
    :vars
    (
      ?auto_233483 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233482 ?auto_233483 ) ( ON-TABLE ?auto_233478 ) ( not ( = ?auto_233478 ?auto_233479 ) ) ( not ( = ?auto_233478 ?auto_233480 ) ) ( not ( = ?auto_233478 ?auto_233481 ) ) ( not ( = ?auto_233478 ?auto_233482 ) ) ( not ( = ?auto_233478 ?auto_233483 ) ) ( not ( = ?auto_233479 ?auto_233480 ) ) ( not ( = ?auto_233479 ?auto_233481 ) ) ( not ( = ?auto_233479 ?auto_233482 ) ) ( not ( = ?auto_233479 ?auto_233483 ) ) ( not ( = ?auto_233480 ?auto_233481 ) ) ( not ( = ?auto_233480 ?auto_233482 ) ) ( not ( = ?auto_233480 ?auto_233483 ) ) ( not ( = ?auto_233481 ?auto_233482 ) ) ( not ( = ?auto_233481 ?auto_233483 ) ) ( not ( = ?auto_233482 ?auto_233483 ) ) ( ON ?auto_233481 ?auto_233482 ) ( ON ?auto_233480 ?auto_233481 ) ( CLEAR ?auto_233478 ) ( ON ?auto_233479 ?auto_233480 ) ( CLEAR ?auto_233479 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_233478 ?auto_233479 )
      ( MAKE-5PILE ?auto_233478 ?auto_233479 ?auto_233480 ?auto_233481 ?auto_233482 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_233489 - BLOCK
      ?auto_233490 - BLOCK
      ?auto_233491 - BLOCK
      ?auto_233492 - BLOCK
      ?auto_233493 - BLOCK
    )
    :vars
    (
      ?auto_233494 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233493 ?auto_233494 ) ( not ( = ?auto_233489 ?auto_233490 ) ) ( not ( = ?auto_233489 ?auto_233491 ) ) ( not ( = ?auto_233489 ?auto_233492 ) ) ( not ( = ?auto_233489 ?auto_233493 ) ) ( not ( = ?auto_233489 ?auto_233494 ) ) ( not ( = ?auto_233490 ?auto_233491 ) ) ( not ( = ?auto_233490 ?auto_233492 ) ) ( not ( = ?auto_233490 ?auto_233493 ) ) ( not ( = ?auto_233490 ?auto_233494 ) ) ( not ( = ?auto_233491 ?auto_233492 ) ) ( not ( = ?auto_233491 ?auto_233493 ) ) ( not ( = ?auto_233491 ?auto_233494 ) ) ( not ( = ?auto_233492 ?auto_233493 ) ) ( not ( = ?auto_233492 ?auto_233494 ) ) ( not ( = ?auto_233493 ?auto_233494 ) ) ( ON ?auto_233492 ?auto_233493 ) ( ON ?auto_233491 ?auto_233492 ) ( ON ?auto_233490 ?auto_233491 ) ( ON ?auto_233489 ?auto_233490 ) ( CLEAR ?auto_233489 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_233489 )
      ( MAKE-5PILE ?auto_233489 ?auto_233490 ?auto_233491 ?auto_233492 ?auto_233493 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_233500 - BLOCK
      ?auto_233501 - BLOCK
      ?auto_233502 - BLOCK
      ?auto_233503 - BLOCK
      ?auto_233504 - BLOCK
    )
    :vars
    (
      ?auto_233505 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233504 ?auto_233505 ) ( not ( = ?auto_233500 ?auto_233501 ) ) ( not ( = ?auto_233500 ?auto_233502 ) ) ( not ( = ?auto_233500 ?auto_233503 ) ) ( not ( = ?auto_233500 ?auto_233504 ) ) ( not ( = ?auto_233500 ?auto_233505 ) ) ( not ( = ?auto_233501 ?auto_233502 ) ) ( not ( = ?auto_233501 ?auto_233503 ) ) ( not ( = ?auto_233501 ?auto_233504 ) ) ( not ( = ?auto_233501 ?auto_233505 ) ) ( not ( = ?auto_233502 ?auto_233503 ) ) ( not ( = ?auto_233502 ?auto_233504 ) ) ( not ( = ?auto_233502 ?auto_233505 ) ) ( not ( = ?auto_233503 ?auto_233504 ) ) ( not ( = ?auto_233503 ?auto_233505 ) ) ( not ( = ?auto_233504 ?auto_233505 ) ) ( ON ?auto_233503 ?auto_233504 ) ( ON ?auto_233502 ?auto_233503 ) ( ON ?auto_233501 ?auto_233502 ) ( ON ?auto_233500 ?auto_233501 ) ( CLEAR ?auto_233500 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_233500 )
      ( MAKE-5PILE ?auto_233500 ?auto_233501 ?auto_233502 ?auto_233503 ?auto_233504 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_233512 - BLOCK
      ?auto_233513 - BLOCK
      ?auto_233514 - BLOCK
      ?auto_233515 - BLOCK
      ?auto_233516 - BLOCK
      ?auto_233517 - BLOCK
    )
    :vars
    (
      ?auto_233518 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_233516 ) ( ON ?auto_233517 ?auto_233518 ) ( CLEAR ?auto_233517 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_233512 ) ( ON ?auto_233513 ?auto_233512 ) ( ON ?auto_233514 ?auto_233513 ) ( ON ?auto_233515 ?auto_233514 ) ( ON ?auto_233516 ?auto_233515 ) ( not ( = ?auto_233512 ?auto_233513 ) ) ( not ( = ?auto_233512 ?auto_233514 ) ) ( not ( = ?auto_233512 ?auto_233515 ) ) ( not ( = ?auto_233512 ?auto_233516 ) ) ( not ( = ?auto_233512 ?auto_233517 ) ) ( not ( = ?auto_233512 ?auto_233518 ) ) ( not ( = ?auto_233513 ?auto_233514 ) ) ( not ( = ?auto_233513 ?auto_233515 ) ) ( not ( = ?auto_233513 ?auto_233516 ) ) ( not ( = ?auto_233513 ?auto_233517 ) ) ( not ( = ?auto_233513 ?auto_233518 ) ) ( not ( = ?auto_233514 ?auto_233515 ) ) ( not ( = ?auto_233514 ?auto_233516 ) ) ( not ( = ?auto_233514 ?auto_233517 ) ) ( not ( = ?auto_233514 ?auto_233518 ) ) ( not ( = ?auto_233515 ?auto_233516 ) ) ( not ( = ?auto_233515 ?auto_233517 ) ) ( not ( = ?auto_233515 ?auto_233518 ) ) ( not ( = ?auto_233516 ?auto_233517 ) ) ( not ( = ?auto_233516 ?auto_233518 ) ) ( not ( = ?auto_233517 ?auto_233518 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_233517 ?auto_233518 )
      ( !STACK ?auto_233517 ?auto_233516 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_233525 - BLOCK
      ?auto_233526 - BLOCK
      ?auto_233527 - BLOCK
      ?auto_233528 - BLOCK
      ?auto_233529 - BLOCK
      ?auto_233530 - BLOCK
    )
    :vars
    (
      ?auto_233531 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_233529 ) ( ON ?auto_233530 ?auto_233531 ) ( CLEAR ?auto_233530 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_233525 ) ( ON ?auto_233526 ?auto_233525 ) ( ON ?auto_233527 ?auto_233526 ) ( ON ?auto_233528 ?auto_233527 ) ( ON ?auto_233529 ?auto_233528 ) ( not ( = ?auto_233525 ?auto_233526 ) ) ( not ( = ?auto_233525 ?auto_233527 ) ) ( not ( = ?auto_233525 ?auto_233528 ) ) ( not ( = ?auto_233525 ?auto_233529 ) ) ( not ( = ?auto_233525 ?auto_233530 ) ) ( not ( = ?auto_233525 ?auto_233531 ) ) ( not ( = ?auto_233526 ?auto_233527 ) ) ( not ( = ?auto_233526 ?auto_233528 ) ) ( not ( = ?auto_233526 ?auto_233529 ) ) ( not ( = ?auto_233526 ?auto_233530 ) ) ( not ( = ?auto_233526 ?auto_233531 ) ) ( not ( = ?auto_233527 ?auto_233528 ) ) ( not ( = ?auto_233527 ?auto_233529 ) ) ( not ( = ?auto_233527 ?auto_233530 ) ) ( not ( = ?auto_233527 ?auto_233531 ) ) ( not ( = ?auto_233528 ?auto_233529 ) ) ( not ( = ?auto_233528 ?auto_233530 ) ) ( not ( = ?auto_233528 ?auto_233531 ) ) ( not ( = ?auto_233529 ?auto_233530 ) ) ( not ( = ?auto_233529 ?auto_233531 ) ) ( not ( = ?auto_233530 ?auto_233531 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_233530 ?auto_233531 )
      ( !STACK ?auto_233530 ?auto_233529 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_233538 - BLOCK
      ?auto_233539 - BLOCK
      ?auto_233540 - BLOCK
      ?auto_233541 - BLOCK
      ?auto_233542 - BLOCK
      ?auto_233543 - BLOCK
    )
    :vars
    (
      ?auto_233544 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233543 ?auto_233544 ) ( ON-TABLE ?auto_233538 ) ( ON ?auto_233539 ?auto_233538 ) ( ON ?auto_233540 ?auto_233539 ) ( ON ?auto_233541 ?auto_233540 ) ( not ( = ?auto_233538 ?auto_233539 ) ) ( not ( = ?auto_233538 ?auto_233540 ) ) ( not ( = ?auto_233538 ?auto_233541 ) ) ( not ( = ?auto_233538 ?auto_233542 ) ) ( not ( = ?auto_233538 ?auto_233543 ) ) ( not ( = ?auto_233538 ?auto_233544 ) ) ( not ( = ?auto_233539 ?auto_233540 ) ) ( not ( = ?auto_233539 ?auto_233541 ) ) ( not ( = ?auto_233539 ?auto_233542 ) ) ( not ( = ?auto_233539 ?auto_233543 ) ) ( not ( = ?auto_233539 ?auto_233544 ) ) ( not ( = ?auto_233540 ?auto_233541 ) ) ( not ( = ?auto_233540 ?auto_233542 ) ) ( not ( = ?auto_233540 ?auto_233543 ) ) ( not ( = ?auto_233540 ?auto_233544 ) ) ( not ( = ?auto_233541 ?auto_233542 ) ) ( not ( = ?auto_233541 ?auto_233543 ) ) ( not ( = ?auto_233541 ?auto_233544 ) ) ( not ( = ?auto_233542 ?auto_233543 ) ) ( not ( = ?auto_233542 ?auto_233544 ) ) ( not ( = ?auto_233543 ?auto_233544 ) ) ( CLEAR ?auto_233541 ) ( ON ?auto_233542 ?auto_233543 ) ( CLEAR ?auto_233542 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_233538 ?auto_233539 ?auto_233540 ?auto_233541 ?auto_233542 )
      ( MAKE-6PILE ?auto_233538 ?auto_233539 ?auto_233540 ?auto_233541 ?auto_233542 ?auto_233543 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_233551 - BLOCK
      ?auto_233552 - BLOCK
      ?auto_233553 - BLOCK
      ?auto_233554 - BLOCK
      ?auto_233555 - BLOCK
      ?auto_233556 - BLOCK
    )
    :vars
    (
      ?auto_233557 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233556 ?auto_233557 ) ( ON-TABLE ?auto_233551 ) ( ON ?auto_233552 ?auto_233551 ) ( ON ?auto_233553 ?auto_233552 ) ( ON ?auto_233554 ?auto_233553 ) ( not ( = ?auto_233551 ?auto_233552 ) ) ( not ( = ?auto_233551 ?auto_233553 ) ) ( not ( = ?auto_233551 ?auto_233554 ) ) ( not ( = ?auto_233551 ?auto_233555 ) ) ( not ( = ?auto_233551 ?auto_233556 ) ) ( not ( = ?auto_233551 ?auto_233557 ) ) ( not ( = ?auto_233552 ?auto_233553 ) ) ( not ( = ?auto_233552 ?auto_233554 ) ) ( not ( = ?auto_233552 ?auto_233555 ) ) ( not ( = ?auto_233552 ?auto_233556 ) ) ( not ( = ?auto_233552 ?auto_233557 ) ) ( not ( = ?auto_233553 ?auto_233554 ) ) ( not ( = ?auto_233553 ?auto_233555 ) ) ( not ( = ?auto_233553 ?auto_233556 ) ) ( not ( = ?auto_233553 ?auto_233557 ) ) ( not ( = ?auto_233554 ?auto_233555 ) ) ( not ( = ?auto_233554 ?auto_233556 ) ) ( not ( = ?auto_233554 ?auto_233557 ) ) ( not ( = ?auto_233555 ?auto_233556 ) ) ( not ( = ?auto_233555 ?auto_233557 ) ) ( not ( = ?auto_233556 ?auto_233557 ) ) ( CLEAR ?auto_233554 ) ( ON ?auto_233555 ?auto_233556 ) ( CLEAR ?auto_233555 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_233551 ?auto_233552 ?auto_233553 ?auto_233554 ?auto_233555 )
      ( MAKE-6PILE ?auto_233551 ?auto_233552 ?auto_233553 ?auto_233554 ?auto_233555 ?auto_233556 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_233564 - BLOCK
      ?auto_233565 - BLOCK
      ?auto_233566 - BLOCK
      ?auto_233567 - BLOCK
      ?auto_233568 - BLOCK
      ?auto_233569 - BLOCK
    )
    :vars
    (
      ?auto_233570 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233569 ?auto_233570 ) ( ON-TABLE ?auto_233564 ) ( ON ?auto_233565 ?auto_233564 ) ( ON ?auto_233566 ?auto_233565 ) ( not ( = ?auto_233564 ?auto_233565 ) ) ( not ( = ?auto_233564 ?auto_233566 ) ) ( not ( = ?auto_233564 ?auto_233567 ) ) ( not ( = ?auto_233564 ?auto_233568 ) ) ( not ( = ?auto_233564 ?auto_233569 ) ) ( not ( = ?auto_233564 ?auto_233570 ) ) ( not ( = ?auto_233565 ?auto_233566 ) ) ( not ( = ?auto_233565 ?auto_233567 ) ) ( not ( = ?auto_233565 ?auto_233568 ) ) ( not ( = ?auto_233565 ?auto_233569 ) ) ( not ( = ?auto_233565 ?auto_233570 ) ) ( not ( = ?auto_233566 ?auto_233567 ) ) ( not ( = ?auto_233566 ?auto_233568 ) ) ( not ( = ?auto_233566 ?auto_233569 ) ) ( not ( = ?auto_233566 ?auto_233570 ) ) ( not ( = ?auto_233567 ?auto_233568 ) ) ( not ( = ?auto_233567 ?auto_233569 ) ) ( not ( = ?auto_233567 ?auto_233570 ) ) ( not ( = ?auto_233568 ?auto_233569 ) ) ( not ( = ?auto_233568 ?auto_233570 ) ) ( not ( = ?auto_233569 ?auto_233570 ) ) ( ON ?auto_233568 ?auto_233569 ) ( CLEAR ?auto_233566 ) ( ON ?auto_233567 ?auto_233568 ) ( CLEAR ?auto_233567 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_233564 ?auto_233565 ?auto_233566 ?auto_233567 )
      ( MAKE-6PILE ?auto_233564 ?auto_233565 ?auto_233566 ?auto_233567 ?auto_233568 ?auto_233569 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_233577 - BLOCK
      ?auto_233578 - BLOCK
      ?auto_233579 - BLOCK
      ?auto_233580 - BLOCK
      ?auto_233581 - BLOCK
      ?auto_233582 - BLOCK
    )
    :vars
    (
      ?auto_233583 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233582 ?auto_233583 ) ( ON-TABLE ?auto_233577 ) ( ON ?auto_233578 ?auto_233577 ) ( ON ?auto_233579 ?auto_233578 ) ( not ( = ?auto_233577 ?auto_233578 ) ) ( not ( = ?auto_233577 ?auto_233579 ) ) ( not ( = ?auto_233577 ?auto_233580 ) ) ( not ( = ?auto_233577 ?auto_233581 ) ) ( not ( = ?auto_233577 ?auto_233582 ) ) ( not ( = ?auto_233577 ?auto_233583 ) ) ( not ( = ?auto_233578 ?auto_233579 ) ) ( not ( = ?auto_233578 ?auto_233580 ) ) ( not ( = ?auto_233578 ?auto_233581 ) ) ( not ( = ?auto_233578 ?auto_233582 ) ) ( not ( = ?auto_233578 ?auto_233583 ) ) ( not ( = ?auto_233579 ?auto_233580 ) ) ( not ( = ?auto_233579 ?auto_233581 ) ) ( not ( = ?auto_233579 ?auto_233582 ) ) ( not ( = ?auto_233579 ?auto_233583 ) ) ( not ( = ?auto_233580 ?auto_233581 ) ) ( not ( = ?auto_233580 ?auto_233582 ) ) ( not ( = ?auto_233580 ?auto_233583 ) ) ( not ( = ?auto_233581 ?auto_233582 ) ) ( not ( = ?auto_233581 ?auto_233583 ) ) ( not ( = ?auto_233582 ?auto_233583 ) ) ( ON ?auto_233581 ?auto_233582 ) ( CLEAR ?auto_233579 ) ( ON ?auto_233580 ?auto_233581 ) ( CLEAR ?auto_233580 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_233577 ?auto_233578 ?auto_233579 ?auto_233580 )
      ( MAKE-6PILE ?auto_233577 ?auto_233578 ?auto_233579 ?auto_233580 ?auto_233581 ?auto_233582 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_233590 - BLOCK
      ?auto_233591 - BLOCK
      ?auto_233592 - BLOCK
      ?auto_233593 - BLOCK
      ?auto_233594 - BLOCK
      ?auto_233595 - BLOCK
    )
    :vars
    (
      ?auto_233596 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233595 ?auto_233596 ) ( ON-TABLE ?auto_233590 ) ( ON ?auto_233591 ?auto_233590 ) ( not ( = ?auto_233590 ?auto_233591 ) ) ( not ( = ?auto_233590 ?auto_233592 ) ) ( not ( = ?auto_233590 ?auto_233593 ) ) ( not ( = ?auto_233590 ?auto_233594 ) ) ( not ( = ?auto_233590 ?auto_233595 ) ) ( not ( = ?auto_233590 ?auto_233596 ) ) ( not ( = ?auto_233591 ?auto_233592 ) ) ( not ( = ?auto_233591 ?auto_233593 ) ) ( not ( = ?auto_233591 ?auto_233594 ) ) ( not ( = ?auto_233591 ?auto_233595 ) ) ( not ( = ?auto_233591 ?auto_233596 ) ) ( not ( = ?auto_233592 ?auto_233593 ) ) ( not ( = ?auto_233592 ?auto_233594 ) ) ( not ( = ?auto_233592 ?auto_233595 ) ) ( not ( = ?auto_233592 ?auto_233596 ) ) ( not ( = ?auto_233593 ?auto_233594 ) ) ( not ( = ?auto_233593 ?auto_233595 ) ) ( not ( = ?auto_233593 ?auto_233596 ) ) ( not ( = ?auto_233594 ?auto_233595 ) ) ( not ( = ?auto_233594 ?auto_233596 ) ) ( not ( = ?auto_233595 ?auto_233596 ) ) ( ON ?auto_233594 ?auto_233595 ) ( ON ?auto_233593 ?auto_233594 ) ( CLEAR ?auto_233591 ) ( ON ?auto_233592 ?auto_233593 ) ( CLEAR ?auto_233592 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_233590 ?auto_233591 ?auto_233592 )
      ( MAKE-6PILE ?auto_233590 ?auto_233591 ?auto_233592 ?auto_233593 ?auto_233594 ?auto_233595 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_233603 - BLOCK
      ?auto_233604 - BLOCK
      ?auto_233605 - BLOCK
      ?auto_233606 - BLOCK
      ?auto_233607 - BLOCK
      ?auto_233608 - BLOCK
    )
    :vars
    (
      ?auto_233609 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233608 ?auto_233609 ) ( ON-TABLE ?auto_233603 ) ( ON ?auto_233604 ?auto_233603 ) ( not ( = ?auto_233603 ?auto_233604 ) ) ( not ( = ?auto_233603 ?auto_233605 ) ) ( not ( = ?auto_233603 ?auto_233606 ) ) ( not ( = ?auto_233603 ?auto_233607 ) ) ( not ( = ?auto_233603 ?auto_233608 ) ) ( not ( = ?auto_233603 ?auto_233609 ) ) ( not ( = ?auto_233604 ?auto_233605 ) ) ( not ( = ?auto_233604 ?auto_233606 ) ) ( not ( = ?auto_233604 ?auto_233607 ) ) ( not ( = ?auto_233604 ?auto_233608 ) ) ( not ( = ?auto_233604 ?auto_233609 ) ) ( not ( = ?auto_233605 ?auto_233606 ) ) ( not ( = ?auto_233605 ?auto_233607 ) ) ( not ( = ?auto_233605 ?auto_233608 ) ) ( not ( = ?auto_233605 ?auto_233609 ) ) ( not ( = ?auto_233606 ?auto_233607 ) ) ( not ( = ?auto_233606 ?auto_233608 ) ) ( not ( = ?auto_233606 ?auto_233609 ) ) ( not ( = ?auto_233607 ?auto_233608 ) ) ( not ( = ?auto_233607 ?auto_233609 ) ) ( not ( = ?auto_233608 ?auto_233609 ) ) ( ON ?auto_233607 ?auto_233608 ) ( ON ?auto_233606 ?auto_233607 ) ( CLEAR ?auto_233604 ) ( ON ?auto_233605 ?auto_233606 ) ( CLEAR ?auto_233605 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_233603 ?auto_233604 ?auto_233605 )
      ( MAKE-6PILE ?auto_233603 ?auto_233604 ?auto_233605 ?auto_233606 ?auto_233607 ?auto_233608 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_233616 - BLOCK
      ?auto_233617 - BLOCK
      ?auto_233618 - BLOCK
      ?auto_233619 - BLOCK
      ?auto_233620 - BLOCK
      ?auto_233621 - BLOCK
    )
    :vars
    (
      ?auto_233622 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233621 ?auto_233622 ) ( ON-TABLE ?auto_233616 ) ( not ( = ?auto_233616 ?auto_233617 ) ) ( not ( = ?auto_233616 ?auto_233618 ) ) ( not ( = ?auto_233616 ?auto_233619 ) ) ( not ( = ?auto_233616 ?auto_233620 ) ) ( not ( = ?auto_233616 ?auto_233621 ) ) ( not ( = ?auto_233616 ?auto_233622 ) ) ( not ( = ?auto_233617 ?auto_233618 ) ) ( not ( = ?auto_233617 ?auto_233619 ) ) ( not ( = ?auto_233617 ?auto_233620 ) ) ( not ( = ?auto_233617 ?auto_233621 ) ) ( not ( = ?auto_233617 ?auto_233622 ) ) ( not ( = ?auto_233618 ?auto_233619 ) ) ( not ( = ?auto_233618 ?auto_233620 ) ) ( not ( = ?auto_233618 ?auto_233621 ) ) ( not ( = ?auto_233618 ?auto_233622 ) ) ( not ( = ?auto_233619 ?auto_233620 ) ) ( not ( = ?auto_233619 ?auto_233621 ) ) ( not ( = ?auto_233619 ?auto_233622 ) ) ( not ( = ?auto_233620 ?auto_233621 ) ) ( not ( = ?auto_233620 ?auto_233622 ) ) ( not ( = ?auto_233621 ?auto_233622 ) ) ( ON ?auto_233620 ?auto_233621 ) ( ON ?auto_233619 ?auto_233620 ) ( ON ?auto_233618 ?auto_233619 ) ( CLEAR ?auto_233616 ) ( ON ?auto_233617 ?auto_233618 ) ( CLEAR ?auto_233617 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_233616 ?auto_233617 )
      ( MAKE-6PILE ?auto_233616 ?auto_233617 ?auto_233618 ?auto_233619 ?auto_233620 ?auto_233621 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_233629 - BLOCK
      ?auto_233630 - BLOCK
      ?auto_233631 - BLOCK
      ?auto_233632 - BLOCK
      ?auto_233633 - BLOCK
      ?auto_233634 - BLOCK
    )
    :vars
    (
      ?auto_233635 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233634 ?auto_233635 ) ( ON-TABLE ?auto_233629 ) ( not ( = ?auto_233629 ?auto_233630 ) ) ( not ( = ?auto_233629 ?auto_233631 ) ) ( not ( = ?auto_233629 ?auto_233632 ) ) ( not ( = ?auto_233629 ?auto_233633 ) ) ( not ( = ?auto_233629 ?auto_233634 ) ) ( not ( = ?auto_233629 ?auto_233635 ) ) ( not ( = ?auto_233630 ?auto_233631 ) ) ( not ( = ?auto_233630 ?auto_233632 ) ) ( not ( = ?auto_233630 ?auto_233633 ) ) ( not ( = ?auto_233630 ?auto_233634 ) ) ( not ( = ?auto_233630 ?auto_233635 ) ) ( not ( = ?auto_233631 ?auto_233632 ) ) ( not ( = ?auto_233631 ?auto_233633 ) ) ( not ( = ?auto_233631 ?auto_233634 ) ) ( not ( = ?auto_233631 ?auto_233635 ) ) ( not ( = ?auto_233632 ?auto_233633 ) ) ( not ( = ?auto_233632 ?auto_233634 ) ) ( not ( = ?auto_233632 ?auto_233635 ) ) ( not ( = ?auto_233633 ?auto_233634 ) ) ( not ( = ?auto_233633 ?auto_233635 ) ) ( not ( = ?auto_233634 ?auto_233635 ) ) ( ON ?auto_233633 ?auto_233634 ) ( ON ?auto_233632 ?auto_233633 ) ( ON ?auto_233631 ?auto_233632 ) ( CLEAR ?auto_233629 ) ( ON ?auto_233630 ?auto_233631 ) ( CLEAR ?auto_233630 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_233629 ?auto_233630 )
      ( MAKE-6PILE ?auto_233629 ?auto_233630 ?auto_233631 ?auto_233632 ?auto_233633 ?auto_233634 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_233642 - BLOCK
      ?auto_233643 - BLOCK
      ?auto_233644 - BLOCK
      ?auto_233645 - BLOCK
      ?auto_233646 - BLOCK
      ?auto_233647 - BLOCK
    )
    :vars
    (
      ?auto_233648 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233647 ?auto_233648 ) ( not ( = ?auto_233642 ?auto_233643 ) ) ( not ( = ?auto_233642 ?auto_233644 ) ) ( not ( = ?auto_233642 ?auto_233645 ) ) ( not ( = ?auto_233642 ?auto_233646 ) ) ( not ( = ?auto_233642 ?auto_233647 ) ) ( not ( = ?auto_233642 ?auto_233648 ) ) ( not ( = ?auto_233643 ?auto_233644 ) ) ( not ( = ?auto_233643 ?auto_233645 ) ) ( not ( = ?auto_233643 ?auto_233646 ) ) ( not ( = ?auto_233643 ?auto_233647 ) ) ( not ( = ?auto_233643 ?auto_233648 ) ) ( not ( = ?auto_233644 ?auto_233645 ) ) ( not ( = ?auto_233644 ?auto_233646 ) ) ( not ( = ?auto_233644 ?auto_233647 ) ) ( not ( = ?auto_233644 ?auto_233648 ) ) ( not ( = ?auto_233645 ?auto_233646 ) ) ( not ( = ?auto_233645 ?auto_233647 ) ) ( not ( = ?auto_233645 ?auto_233648 ) ) ( not ( = ?auto_233646 ?auto_233647 ) ) ( not ( = ?auto_233646 ?auto_233648 ) ) ( not ( = ?auto_233647 ?auto_233648 ) ) ( ON ?auto_233646 ?auto_233647 ) ( ON ?auto_233645 ?auto_233646 ) ( ON ?auto_233644 ?auto_233645 ) ( ON ?auto_233643 ?auto_233644 ) ( ON ?auto_233642 ?auto_233643 ) ( CLEAR ?auto_233642 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_233642 )
      ( MAKE-6PILE ?auto_233642 ?auto_233643 ?auto_233644 ?auto_233645 ?auto_233646 ?auto_233647 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_233655 - BLOCK
      ?auto_233656 - BLOCK
      ?auto_233657 - BLOCK
      ?auto_233658 - BLOCK
      ?auto_233659 - BLOCK
      ?auto_233660 - BLOCK
    )
    :vars
    (
      ?auto_233661 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233660 ?auto_233661 ) ( not ( = ?auto_233655 ?auto_233656 ) ) ( not ( = ?auto_233655 ?auto_233657 ) ) ( not ( = ?auto_233655 ?auto_233658 ) ) ( not ( = ?auto_233655 ?auto_233659 ) ) ( not ( = ?auto_233655 ?auto_233660 ) ) ( not ( = ?auto_233655 ?auto_233661 ) ) ( not ( = ?auto_233656 ?auto_233657 ) ) ( not ( = ?auto_233656 ?auto_233658 ) ) ( not ( = ?auto_233656 ?auto_233659 ) ) ( not ( = ?auto_233656 ?auto_233660 ) ) ( not ( = ?auto_233656 ?auto_233661 ) ) ( not ( = ?auto_233657 ?auto_233658 ) ) ( not ( = ?auto_233657 ?auto_233659 ) ) ( not ( = ?auto_233657 ?auto_233660 ) ) ( not ( = ?auto_233657 ?auto_233661 ) ) ( not ( = ?auto_233658 ?auto_233659 ) ) ( not ( = ?auto_233658 ?auto_233660 ) ) ( not ( = ?auto_233658 ?auto_233661 ) ) ( not ( = ?auto_233659 ?auto_233660 ) ) ( not ( = ?auto_233659 ?auto_233661 ) ) ( not ( = ?auto_233660 ?auto_233661 ) ) ( ON ?auto_233659 ?auto_233660 ) ( ON ?auto_233658 ?auto_233659 ) ( ON ?auto_233657 ?auto_233658 ) ( ON ?auto_233656 ?auto_233657 ) ( ON ?auto_233655 ?auto_233656 ) ( CLEAR ?auto_233655 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_233655 )
      ( MAKE-6PILE ?auto_233655 ?auto_233656 ?auto_233657 ?auto_233658 ?auto_233659 ?auto_233660 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_233669 - BLOCK
      ?auto_233670 - BLOCK
      ?auto_233671 - BLOCK
      ?auto_233672 - BLOCK
      ?auto_233673 - BLOCK
      ?auto_233674 - BLOCK
      ?auto_233675 - BLOCK
    )
    :vars
    (
      ?auto_233676 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_233674 ) ( ON ?auto_233675 ?auto_233676 ) ( CLEAR ?auto_233675 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_233669 ) ( ON ?auto_233670 ?auto_233669 ) ( ON ?auto_233671 ?auto_233670 ) ( ON ?auto_233672 ?auto_233671 ) ( ON ?auto_233673 ?auto_233672 ) ( ON ?auto_233674 ?auto_233673 ) ( not ( = ?auto_233669 ?auto_233670 ) ) ( not ( = ?auto_233669 ?auto_233671 ) ) ( not ( = ?auto_233669 ?auto_233672 ) ) ( not ( = ?auto_233669 ?auto_233673 ) ) ( not ( = ?auto_233669 ?auto_233674 ) ) ( not ( = ?auto_233669 ?auto_233675 ) ) ( not ( = ?auto_233669 ?auto_233676 ) ) ( not ( = ?auto_233670 ?auto_233671 ) ) ( not ( = ?auto_233670 ?auto_233672 ) ) ( not ( = ?auto_233670 ?auto_233673 ) ) ( not ( = ?auto_233670 ?auto_233674 ) ) ( not ( = ?auto_233670 ?auto_233675 ) ) ( not ( = ?auto_233670 ?auto_233676 ) ) ( not ( = ?auto_233671 ?auto_233672 ) ) ( not ( = ?auto_233671 ?auto_233673 ) ) ( not ( = ?auto_233671 ?auto_233674 ) ) ( not ( = ?auto_233671 ?auto_233675 ) ) ( not ( = ?auto_233671 ?auto_233676 ) ) ( not ( = ?auto_233672 ?auto_233673 ) ) ( not ( = ?auto_233672 ?auto_233674 ) ) ( not ( = ?auto_233672 ?auto_233675 ) ) ( not ( = ?auto_233672 ?auto_233676 ) ) ( not ( = ?auto_233673 ?auto_233674 ) ) ( not ( = ?auto_233673 ?auto_233675 ) ) ( not ( = ?auto_233673 ?auto_233676 ) ) ( not ( = ?auto_233674 ?auto_233675 ) ) ( not ( = ?auto_233674 ?auto_233676 ) ) ( not ( = ?auto_233675 ?auto_233676 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_233675 ?auto_233676 )
      ( !STACK ?auto_233675 ?auto_233674 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_233684 - BLOCK
      ?auto_233685 - BLOCK
      ?auto_233686 - BLOCK
      ?auto_233687 - BLOCK
      ?auto_233688 - BLOCK
      ?auto_233689 - BLOCK
      ?auto_233690 - BLOCK
    )
    :vars
    (
      ?auto_233691 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_233689 ) ( ON ?auto_233690 ?auto_233691 ) ( CLEAR ?auto_233690 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_233684 ) ( ON ?auto_233685 ?auto_233684 ) ( ON ?auto_233686 ?auto_233685 ) ( ON ?auto_233687 ?auto_233686 ) ( ON ?auto_233688 ?auto_233687 ) ( ON ?auto_233689 ?auto_233688 ) ( not ( = ?auto_233684 ?auto_233685 ) ) ( not ( = ?auto_233684 ?auto_233686 ) ) ( not ( = ?auto_233684 ?auto_233687 ) ) ( not ( = ?auto_233684 ?auto_233688 ) ) ( not ( = ?auto_233684 ?auto_233689 ) ) ( not ( = ?auto_233684 ?auto_233690 ) ) ( not ( = ?auto_233684 ?auto_233691 ) ) ( not ( = ?auto_233685 ?auto_233686 ) ) ( not ( = ?auto_233685 ?auto_233687 ) ) ( not ( = ?auto_233685 ?auto_233688 ) ) ( not ( = ?auto_233685 ?auto_233689 ) ) ( not ( = ?auto_233685 ?auto_233690 ) ) ( not ( = ?auto_233685 ?auto_233691 ) ) ( not ( = ?auto_233686 ?auto_233687 ) ) ( not ( = ?auto_233686 ?auto_233688 ) ) ( not ( = ?auto_233686 ?auto_233689 ) ) ( not ( = ?auto_233686 ?auto_233690 ) ) ( not ( = ?auto_233686 ?auto_233691 ) ) ( not ( = ?auto_233687 ?auto_233688 ) ) ( not ( = ?auto_233687 ?auto_233689 ) ) ( not ( = ?auto_233687 ?auto_233690 ) ) ( not ( = ?auto_233687 ?auto_233691 ) ) ( not ( = ?auto_233688 ?auto_233689 ) ) ( not ( = ?auto_233688 ?auto_233690 ) ) ( not ( = ?auto_233688 ?auto_233691 ) ) ( not ( = ?auto_233689 ?auto_233690 ) ) ( not ( = ?auto_233689 ?auto_233691 ) ) ( not ( = ?auto_233690 ?auto_233691 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_233690 ?auto_233691 )
      ( !STACK ?auto_233690 ?auto_233689 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_233699 - BLOCK
      ?auto_233700 - BLOCK
      ?auto_233701 - BLOCK
      ?auto_233702 - BLOCK
      ?auto_233703 - BLOCK
      ?auto_233704 - BLOCK
      ?auto_233705 - BLOCK
    )
    :vars
    (
      ?auto_233706 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233705 ?auto_233706 ) ( ON-TABLE ?auto_233699 ) ( ON ?auto_233700 ?auto_233699 ) ( ON ?auto_233701 ?auto_233700 ) ( ON ?auto_233702 ?auto_233701 ) ( ON ?auto_233703 ?auto_233702 ) ( not ( = ?auto_233699 ?auto_233700 ) ) ( not ( = ?auto_233699 ?auto_233701 ) ) ( not ( = ?auto_233699 ?auto_233702 ) ) ( not ( = ?auto_233699 ?auto_233703 ) ) ( not ( = ?auto_233699 ?auto_233704 ) ) ( not ( = ?auto_233699 ?auto_233705 ) ) ( not ( = ?auto_233699 ?auto_233706 ) ) ( not ( = ?auto_233700 ?auto_233701 ) ) ( not ( = ?auto_233700 ?auto_233702 ) ) ( not ( = ?auto_233700 ?auto_233703 ) ) ( not ( = ?auto_233700 ?auto_233704 ) ) ( not ( = ?auto_233700 ?auto_233705 ) ) ( not ( = ?auto_233700 ?auto_233706 ) ) ( not ( = ?auto_233701 ?auto_233702 ) ) ( not ( = ?auto_233701 ?auto_233703 ) ) ( not ( = ?auto_233701 ?auto_233704 ) ) ( not ( = ?auto_233701 ?auto_233705 ) ) ( not ( = ?auto_233701 ?auto_233706 ) ) ( not ( = ?auto_233702 ?auto_233703 ) ) ( not ( = ?auto_233702 ?auto_233704 ) ) ( not ( = ?auto_233702 ?auto_233705 ) ) ( not ( = ?auto_233702 ?auto_233706 ) ) ( not ( = ?auto_233703 ?auto_233704 ) ) ( not ( = ?auto_233703 ?auto_233705 ) ) ( not ( = ?auto_233703 ?auto_233706 ) ) ( not ( = ?auto_233704 ?auto_233705 ) ) ( not ( = ?auto_233704 ?auto_233706 ) ) ( not ( = ?auto_233705 ?auto_233706 ) ) ( CLEAR ?auto_233703 ) ( ON ?auto_233704 ?auto_233705 ) ( CLEAR ?auto_233704 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_233699 ?auto_233700 ?auto_233701 ?auto_233702 ?auto_233703 ?auto_233704 )
      ( MAKE-7PILE ?auto_233699 ?auto_233700 ?auto_233701 ?auto_233702 ?auto_233703 ?auto_233704 ?auto_233705 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_233714 - BLOCK
      ?auto_233715 - BLOCK
      ?auto_233716 - BLOCK
      ?auto_233717 - BLOCK
      ?auto_233718 - BLOCK
      ?auto_233719 - BLOCK
      ?auto_233720 - BLOCK
    )
    :vars
    (
      ?auto_233721 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233720 ?auto_233721 ) ( ON-TABLE ?auto_233714 ) ( ON ?auto_233715 ?auto_233714 ) ( ON ?auto_233716 ?auto_233715 ) ( ON ?auto_233717 ?auto_233716 ) ( ON ?auto_233718 ?auto_233717 ) ( not ( = ?auto_233714 ?auto_233715 ) ) ( not ( = ?auto_233714 ?auto_233716 ) ) ( not ( = ?auto_233714 ?auto_233717 ) ) ( not ( = ?auto_233714 ?auto_233718 ) ) ( not ( = ?auto_233714 ?auto_233719 ) ) ( not ( = ?auto_233714 ?auto_233720 ) ) ( not ( = ?auto_233714 ?auto_233721 ) ) ( not ( = ?auto_233715 ?auto_233716 ) ) ( not ( = ?auto_233715 ?auto_233717 ) ) ( not ( = ?auto_233715 ?auto_233718 ) ) ( not ( = ?auto_233715 ?auto_233719 ) ) ( not ( = ?auto_233715 ?auto_233720 ) ) ( not ( = ?auto_233715 ?auto_233721 ) ) ( not ( = ?auto_233716 ?auto_233717 ) ) ( not ( = ?auto_233716 ?auto_233718 ) ) ( not ( = ?auto_233716 ?auto_233719 ) ) ( not ( = ?auto_233716 ?auto_233720 ) ) ( not ( = ?auto_233716 ?auto_233721 ) ) ( not ( = ?auto_233717 ?auto_233718 ) ) ( not ( = ?auto_233717 ?auto_233719 ) ) ( not ( = ?auto_233717 ?auto_233720 ) ) ( not ( = ?auto_233717 ?auto_233721 ) ) ( not ( = ?auto_233718 ?auto_233719 ) ) ( not ( = ?auto_233718 ?auto_233720 ) ) ( not ( = ?auto_233718 ?auto_233721 ) ) ( not ( = ?auto_233719 ?auto_233720 ) ) ( not ( = ?auto_233719 ?auto_233721 ) ) ( not ( = ?auto_233720 ?auto_233721 ) ) ( CLEAR ?auto_233718 ) ( ON ?auto_233719 ?auto_233720 ) ( CLEAR ?auto_233719 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_233714 ?auto_233715 ?auto_233716 ?auto_233717 ?auto_233718 ?auto_233719 )
      ( MAKE-7PILE ?auto_233714 ?auto_233715 ?auto_233716 ?auto_233717 ?auto_233718 ?auto_233719 ?auto_233720 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_233729 - BLOCK
      ?auto_233730 - BLOCK
      ?auto_233731 - BLOCK
      ?auto_233732 - BLOCK
      ?auto_233733 - BLOCK
      ?auto_233734 - BLOCK
      ?auto_233735 - BLOCK
    )
    :vars
    (
      ?auto_233736 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233735 ?auto_233736 ) ( ON-TABLE ?auto_233729 ) ( ON ?auto_233730 ?auto_233729 ) ( ON ?auto_233731 ?auto_233730 ) ( ON ?auto_233732 ?auto_233731 ) ( not ( = ?auto_233729 ?auto_233730 ) ) ( not ( = ?auto_233729 ?auto_233731 ) ) ( not ( = ?auto_233729 ?auto_233732 ) ) ( not ( = ?auto_233729 ?auto_233733 ) ) ( not ( = ?auto_233729 ?auto_233734 ) ) ( not ( = ?auto_233729 ?auto_233735 ) ) ( not ( = ?auto_233729 ?auto_233736 ) ) ( not ( = ?auto_233730 ?auto_233731 ) ) ( not ( = ?auto_233730 ?auto_233732 ) ) ( not ( = ?auto_233730 ?auto_233733 ) ) ( not ( = ?auto_233730 ?auto_233734 ) ) ( not ( = ?auto_233730 ?auto_233735 ) ) ( not ( = ?auto_233730 ?auto_233736 ) ) ( not ( = ?auto_233731 ?auto_233732 ) ) ( not ( = ?auto_233731 ?auto_233733 ) ) ( not ( = ?auto_233731 ?auto_233734 ) ) ( not ( = ?auto_233731 ?auto_233735 ) ) ( not ( = ?auto_233731 ?auto_233736 ) ) ( not ( = ?auto_233732 ?auto_233733 ) ) ( not ( = ?auto_233732 ?auto_233734 ) ) ( not ( = ?auto_233732 ?auto_233735 ) ) ( not ( = ?auto_233732 ?auto_233736 ) ) ( not ( = ?auto_233733 ?auto_233734 ) ) ( not ( = ?auto_233733 ?auto_233735 ) ) ( not ( = ?auto_233733 ?auto_233736 ) ) ( not ( = ?auto_233734 ?auto_233735 ) ) ( not ( = ?auto_233734 ?auto_233736 ) ) ( not ( = ?auto_233735 ?auto_233736 ) ) ( ON ?auto_233734 ?auto_233735 ) ( CLEAR ?auto_233732 ) ( ON ?auto_233733 ?auto_233734 ) ( CLEAR ?auto_233733 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_233729 ?auto_233730 ?auto_233731 ?auto_233732 ?auto_233733 )
      ( MAKE-7PILE ?auto_233729 ?auto_233730 ?auto_233731 ?auto_233732 ?auto_233733 ?auto_233734 ?auto_233735 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_233744 - BLOCK
      ?auto_233745 - BLOCK
      ?auto_233746 - BLOCK
      ?auto_233747 - BLOCK
      ?auto_233748 - BLOCK
      ?auto_233749 - BLOCK
      ?auto_233750 - BLOCK
    )
    :vars
    (
      ?auto_233751 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233750 ?auto_233751 ) ( ON-TABLE ?auto_233744 ) ( ON ?auto_233745 ?auto_233744 ) ( ON ?auto_233746 ?auto_233745 ) ( ON ?auto_233747 ?auto_233746 ) ( not ( = ?auto_233744 ?auto_233745 ) ) ( not ( = ?auto_233744 ?auto_233746 ) ) ( not ( = ?auto_233744 ?auto_233747 ) ) ( not ( = ?auto_233744 ?auto_233748 ) ) ( not ( = ?auto_233744 ?auto_233749 ) ) ( not ( = ?auto_233744 ?auto_233750 ) ) ( not ( = ?auto_233744 ?auto_233751 ) ) ( not ( = ?auto_233745 ?auto_233746 ) ) ( not ( = ?auto_233745 ?auto_233747 ) ) ( not ( = ?auto_233745 ?auto_233748 ) ) ( not ( = ?auto_233745 ?auto_233749 ) ) ( not ( = ?auto_233745 ?auto_233750 ) ) ( not ( = ?auto_233745 ?auto_233751 ) ) ( not ( = ?auto_233746 ?auto_233747 ) ) ( not ( = ?auto_233746 ?auto_233748 ) ) ( not ( = ?auto_233746 ?auto_233749 ) ) ( not ( = ?auto_233746 ?auto_233750 ) ) ( not ( = ?auto_233746 ?auto_233751 ) ) ( not ( = ?auto_233747 ?auto_233748 ) ) ( not ( = ?auto_233747 ?auto_233749 ) ) ( not ( = ?auto_233747 ?auto_233750 ) ) ( not ( = ?auto_233747 ?auto_233751 ) ) ( not ( = ?auto_233748 ?auto_233749 ) ) ( not ( = ?auto_233748 ?auto_233750 ) ) ( not ( = ?auto_233748 ?auto_233751 ) ) ( not ( = ?auto_233749 ?auto_233750 ) ) ( not ( = ?auto_233749 ?auto_233751 ) ) ( not ( = ?auto_233750 ?auto_233751 ) ) ( ON ?auto_233749 ?auto_233750 ) ( CLEAR ?auto_233747 ) ( ON ?auto_233748 ?auto_233749 ) ( CLEAR ?auto_233748 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_233744 ?auto_233745 ?auto_233746 ?auto_233747 ?auto_233748 )
      ( MAKE-7PILE ?auto_233744 ?auto_233745 ?auto_233746 ?auto_233747 ?auto_233748 ?auto_233749 ?auto_233750 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_233759 - BLOCK
      ?auto_233760 - BLOCK
      ?auto_233761 - BLOCK
      ?auto_233762 - BLOCK
      ?auto_233763 - BLOCK
      ?auto_233764 - BLOCK
      ?auto_233765 - BLOCK
    )
    :vars
    (
      ?auto_233766 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233765 ?auto_233766 ) ( ON-TABLE ?auto_233759 ) ( ON ?auto_233760 ?auto_233759 ) ( ON ?auto_233761 ?auto_233760 ) ( not ( = ?auto_233759 ?auto_233760 ) ) ( not ( = ?auto_233759 ?auto_233761 ) ) ( not ( = ?auto_233759 ?auto_233762 ) ) ( not ( = ?auto_233759 ?auto_233763 ) ) ( not ( = ?auto_233759 ?auto_233764 ) ) ( not ( = ?auto_233759 ?auto_233765 ) ) ( not ( = ?auto_233759 ?auto_233766 ) ) ( not ( = ?auto_233760 ?auto_233761 ) ) ( not ( = ?auto_233760 ?auto_233762 ) ) ( not ( = ?auto_233760 ?auto_233763 ) ) ( not ( = ?auto_233760 ?auto_233764 ) ) ( not ( = ?auto_233760 ?auto_233765 ) ) ( not ( = ?auto_233760 ?auto_233766 ) ) ( not ( = ?auto_233761 ?auto_233762 ) ) ( not ( = ?auto_233761 ?auto_233763 ) ) ( not ( = ?auto_233761 ?auto_233764 ) ) ( not ( = ?auto_233761 ?auto_233765 ) ) ( not ( = ?auto_233761 ?auto_233766 ) ) ( not ( = ?auto_233762 ?auto_233763 ) ) ( not ( = ?auto_233762 ?auto_233764 ) ) ( not ( = ?auto_233762 ?auto_233765 ) ) ( not ( = ?auto_233762 ?auto_233766 ) ) ( not ( = ?auto_233763 ?auto_233764 ) ) ( not ( = ?auto_233763 ?auto_233765 ) ) ( not ( = ?auto_233763 ?auto_233766 ) ) ( not ( = ?auto_233764 ?auto_233765 ) ) ( not ( = ?auto_233764 ?auto_233766 ) ) ( not ( = ?auto_233765 ?auto_233766 ) ) ( ON ?auto_233764 ?auto_233765 ) ( ON ?auto_233763 ?auto_233764 ) ( CLEAR ?auto_233761 ) ( ON ?auto_233762 ?auto_233763 ) ( CLEAR ?auto_233762 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_233759 ?auto_233760 ?auto_233761 ?auto_233762 )
      ( MAKE-7PILE ?auto_233759 ?auto_233760 ?auto_233761 ?auto_233762 ?auto_233763 ?auto_233764 ?auto_233765 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_233774 - BLOCK
      ?auto_233775 - BLOCK
      ?auto_233776 - BLOCK
      ?auto_233777 - BLOCK
      ?auto_233778 - BLOCK
      ?auto_233779 - BLOCK
      ?auto_233780 - BLOCK
    )
    :vars
    (
      ?auto_233781 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233780 ?auto_233781 ) ( ON-TABLE ?auto_233774 ) ( ON ?auto_233775 ?auto_233774 ) ( ON ?auto_233776 ?auto_233775 ) ( not ( = ?auto_233774 ?auto_233775 ) ) ( not ( = ?auto_233774 ?auto_233776 ) ) ( not ( = ?auto_233774 ?auto_233777 ) ) ( not ( = ?auto_233774 ?auto_233778 ) ) ( not ( = ?auto_233774 ?auto_233779 ) ) ( not ( = ?auto_233774 ?auto_233780 ) ) ( not ( = ?auto_233774 ?auto_233781 ) ) ( not ( = ?auto_233775 ?auto_233776 ) ) ( not ( = ?auto_233775 ?auto_233777 ) ) ( not ( = ?auto_233775 ?auto_233778 ) ) ( not ( = ?auto_233775 ?auto_233779 ) ) ( not ( = ?auto_233775 ?auto_233780 ) ) ( not ( = ?auto_233775 ?auto_233781 ) ) ( not ( = ?auto_233776 ?auto_233777 ) ) ( not ( = ?auto_233776 ?auto_233778 ) ) ( not ( = ?auto_233776 ?auto_233779 ) ) ( not ( = ?auto_233776 ?auto_233780 ) ) ( not ( = ?auto_233776 ?auto_233781 ) ) ( not ( = ?auto_233777 ?auto_233778 ) ) ( not ( = ?auto_233777 ?auto_233779 ) ) ( not ( = ?auto_233777 ?auto_233780 ) ) ( not ( = ?auto_233777 ?auto_233781 ) ) ( not ( = ?auto_233778 ?auto_233779 ) ) ( not ( = ?auto_233778 ?auto_233780 ) ) ( not ( = ?auto_233778 ?auto_233781 ) ) ( not ( = ?auto_233779 ?auto_233780 ) ) ( not ( = ?auto_233779 ?auto_233781 ) ) ( not ( = ?auto_233780 ?auto_233781 ) ) ( ON ?auto_233779 ?auto_233780 ) ( ON ?auto_233778 ?auto_233779 ) ( CLEAR ?auto_233776 ) ( ON ?auto_233777 ?auto_233778 ) ( CLEAR ?auto_233777 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_233774 ?auto_233775 ?auto_233776 ?auto_233777 )
      ( MAKE-7PILE ?auto_233774 ?auto_233775 ?auto_233776 ?auto_233777 ?auto_233778 ?auto_233779 ?auto_233780 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_233789 - BLOCK
      ?auto_233790 - BLOCK
      ?auto_233791 - BLOCK
      ?auto_233792 - BLOCK
      ?auto_233793 - BLOCK
      ?auto_233794 - BLOCK
      ?auto_233795 - BLOCK
    )
    :vars
    (
      ?auto_233796 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233795 ?auto_233796 ) ( ON-TABLE ?auto_233789 ) ( ON ?auto_233790 ?auto_233789 ) ( not ( = ?auto_233789 ?auto_233790 ) ) ( not ( = ?auto_233789 ?auto_233791 ) ) ( not ( = ?auto_233789 ?auto_233792 ) ) ( not ( = ?auto_233789 ?auto_233793 ) ) ( not ( = ?auto_233789 ?auto_233794 ) ) ( not ( = ?auto_233789 ?auto_233795 ) ) ( not ( = ?auto_233789 ?auto_233796 ) ) ( not ( = ?auto_233790 ?auto_233791 ) ) ( not ( = ?auto_233790 ?auto_233792 ) ) ( not ( = ?auto_233790 ?auto_233793 ) ) ( not ( = ?auto_233790 ?auto_233794 ) ) ( not ( = ?auto_233790 ?auto_233795 ) ) ( not ( = ?auto_233790 ?auto_233796 ) ) ( not ( = ?auto_233791 ?auto_233792 ) ) ( not ( = ?auto_233791 ?auto_233793 ) ) ( not ( = ?auto_233791 ?auto_233794 ) ) ( not ( = ?auto_233791 ?auto_233795 ) ) ( not ( = ?auto_233791 ?auto_233796 ) ) ( not ( = ?auto_233792 ?auto_233793 ) ) ( not ( = ?auto_233792 ?auto_233794 ) ) ( not ( = ?auto_233792 ?auto_233795 ) ) ( not ( = ?auto_233792 ?auto_233796 ) ) ( not ( = ?auto_233793 ?auto_233794 ) ) ( not ( = ?auto_233793 ?auto_233795 ) ) ( not ( = ?auto_233793 ?auto_233796 ) ) ( not ( = ?auto_233794 ?auto_233795 ) ) ( not ( = ?auto_233794 ?auto_233796 ) ) ( not ( = ?auto_233795 ?auto_233796 ) ) ( ON ?auto_233794 ?auto_233795 ) ( ON ?auto_233793 ?auto_233794 ) ( ON ?auto_233792 ?auto_233793 ) ( CLEAR ?auto_233790 ) ( ON ?auto_233791 ?auto_233792 ) ( CLEAR ?auto_233791 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_233789 ?auto_233790 ?auto_233791 )
      ( MAKE-7PILE ?auto_233789 ?auto_233790 ?auto_233791 ?auto_233792 ?auto_233793 ?auto_233794 ?auto_233795 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_233804 - BLOCK
      ?auto_233805 - BLOCK
      ?auto_233806 - BLOCK
      ?auto_233807 - BLOCK
      ?auto_233808 - BLOCK
      ?auto_233809 - BLOCK
      ?auto_233810 - BLOCK
    )
    :vars
    (
      ?auto_233811 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233810 ?auto_233811 ) ( ON-TABLE ?auto_233804 ) ( ON ?auto_233805 ?auto_233804 ) ( not ( = ?auto_233804 ?auto_233805 ) ) ( not ( = ?auto_233804 ?auto_233806 ) ) ( not ( = ?auto_233804 ?auto_233807 ) ) ( not ( = ?auto_233804 ?auto_233808 ) ) ( not ( = ?auto_233804 ?auto_233809 ) ) ( not ( = ?auto_233804 ?auto_233810 ) ) ( not ( = ?auto_233804 ?auto_233811 ) ) ( not ( = ?auto_233805 ?auto_233806 ) ) ( not ( = ?auto_233805 ?auto_233807 ) ) ( not ( = ?auto_233805 ?auto_233808 ) ) ( not ( = ?auto_233805 ?auto_233809 ) ) ( not ( = ?auto_233805 ?auto_233810 ) ) ( not ( = ?auto_233805 ?auto_233811 ) ) ( not ( = ?auto_233806 ?auto_233807 ) ) ( not ( = ?auto_233806 ?auto_233808 ) ) ( not ( = ?auto_233806 ?auto_233809 ) ) ( not ( = ?auto_233806 ?auto_233810 ) ) ( not ( = ?auto_233806 ?auto_233811 ) ) ( not ( = ?auto_233807 ?auto_233808 ) ) ( not ( = ?auto_233807 ?auto_233809 ) ) ( not ( = ?auto_233807 ?auto_233810 ) ) ( not ( = ?auto_233807 ?auto_233811 ) ) ( not ( = ?auto_233808 ?auto_233809 ) ) ( not ( = ?auto_233808 ?auto_233810 ) ) ( not ( = ?auto_233808 ?auto_233811 ) ) ( not ( = ?auto_233809 ?auto_233810 ) ) ( not ( = ?auto_233809 ?auto_233811 ) ) ( not ( = ?auto_233810 ?auto_233811 ) ) ( ON ?auto_233809 ?auto_233810 ) ( ON ?auto_233808 ?auto_233809 ) ( ON ?auto_233807 ?auto_233808 ) ( CLEAR ?auto_233805 ) ( ON ?auto_233806 ?auto_233807 ) ( CLEAR ?auto_233806 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_233804 ?auto_233805 ?auto_233806 )
      ( MAKE-7PILE ?auto_233804 ?auto_233805 ?auto_233806 ?auto_233807 ?auto_233808 ?auto_233809 ?auto_233810 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_233819 - BLOCK
      ?auto_233820 - BLOCK
      ?auto_233821 - BLOCK
      ?auto_233822 - BLOCK
      ?auto_233823 - BLOCK
      ?auto_233824 - BLOCK
      ?auto_233825 - BLOCK
    )
    :vars
    (
      ?auto_233826 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233825 ?auto_233826 ) ( ON-TABLE ?auto_233819 ) ( not ( = ?auto_233819 ?auto_233820 ) ) ( not ( = ?auto_233819 ?auto_233821 ) ) ( not ( = ?auto_233819 ?auto_233822 ) ) ( not ( = ?auto_233819 ?auto_233823 ) ) ( not ( = ?auto_233819 ?auto_233824 ) ) ( not ( = ?auto_233819 ?auto_233825 ) ) ( not ( = ?auto_233819 ?auto_233826 ) ) ( not ( = ?auto_233820 ?auto_233821 ) ) ( not ( = ?auto_233820 ?auto_233822 ) ) ( not ( = ?auto_233820 ?auto_233823 ) ) ( not ( = ?auto_233820 ?auto_233824 ) ) ( not ( = ?auto_233820 ?auto_233825 ) ) ( not ( = ?auto_233820 ?auto_233826 ) ) ( not ( = ?auto_233821 ?auto_233822 ) ) ( not ( = ?auto_233821 ?auto_233823 ) ) ( not ( = ?auto_233821 ?auto_233824 ) ) ( not ( = ?auto_233821 ?auto_233825 ) ) ( not ( = ?auto_233821 ?auto_233826 ) ) ( not ( = ?auto_233822 ?auto_233823 ) ) ( not ( = ?auto_233822 ?auto_233824 ) ) ( not ( = ?auto_233822 ?auto_233825 ) ) ( not ( = ?auto_233822 ?auto_233826 ) ) ( not ( = ?auto_233823 ?auto_233824 ) ) ( not ( = ?auto_233823 ?auto_233825 ) ) ( not ( = ?auto_233823 ?auto_233826 ) ) ( not ( = ?auto_233824 ?auto_233825 ) ) ( not ( = ?auto_233824 ?auto_233826 ) ) ( not ( = ?auto_233825 ?auto_233826 ) ) ( ON ?auto_233824 ?auto_233825 ) ( ON ?auto_233823 ?auto_233824 ) ( ON ?auto_233822 ?auto_233823 ) ( ON ?auto_233821 ?auto_233822 ) ( CLEAR ?auto_233819 ) ( ON ?auto_233820 ?auto_233821 ) ( CLEAR ?auto_233820 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_233819 ?auto_233820 )
      ( MAKE-7PILE ?auto_233819 ?auto_233820 ?auto_233821 ?auto_233822 ?auto_233823 ?auto_233824 ?auto_233825 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_233834 - BLOCK
      ?auto_233835 - BLOCK
      ?auto_233836 - BLOCK
      ?auto_233837 - BLOCK
      ?auto_233838 - BLOCK
      ?auto_233839 - BLOCK
      ?auto_233840 - BLOCK
    )
    :vars
    (
      ?auto_233841 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233840 ?auto_233841 ) ( ON-TABLE ?auto_233834 ) ( not ( = ?auto_233834 ?auto_233835 ) ) ( not ( = ?auto_233834 ?auto_233836 ) ) ( not ( = ?auto_233834 ?auto_233837 ) ) ( not ( = ?auto_233834 ?auto_233838 ) ) ( not ( = ?auto_233834 ?auto_233839 ) ) ( not ( = ?auto_233834 ?auto_233840 ) ) ( not ( = ?auto_233834 ?auto_233841 ) ) ( not ( = ?auto_233835 ?auto_233836 ) ) ( not ( = ?auto_233835 ?auto_233837 ) ) ( not ( = ?auto_233835 ?auto_233838 ) ) ( not ( = ?auto_233835 ?auto_233839 ) ) ( not ( = ?auto_233835 ?auto_233840 ) ) ( not ( = ?auto_233835 ?auto_233841 ) ) ( not ( = ?auto_233836 ?auto_233837 ) ) ( not ( = ?auto_233836 ?auto_233838 ) ) ( not ( = ?auto_233836 ?auto_233839 ) ) ( not ( = ?auto_233836 ?auto_233840 ) ) ( not ( = ?auto_233836 ?auto_233841 ) ) ( not ( = ?auto_233837 ?auto_233838 ) ) ( not ( = ?auto_233837 ?auto_233839 ) ) ( not ( = ?auto_233837 ?auto_233840 ) ) ( not ( = ?auto_233837 ?auto_233841 ) ) ( not ( = ?auto_233838 ?auto_233839 ) ) ( not ( = ?auto_233838 ?auto_233840 ) ) ( not ( = ?auto_233838 ?auto_233841 ) ) ( not ( = ?auto_233839 ?auto_233840 ) ) ( not ( = ?auto_233839 ?auto_233841 ) ) ( not ( = ?auto_233840 ?auto_233841 ) ) ( ON ?auto_233839 ?auto_233840 ) ( ON ?auto_233838 ?auto_233839 ) ( ON ?auto_233837 ?auto_233838 ) ( ON ?auto_233836 ?auto_233837 ) ( CLEAR ?auto_233834 ) ( ON ?auto_233835 ?auto_233836 ) ( CLEAR ?auto_233835 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_233834 ?auto_233835 )
      ( MAKE-7PILE ?auto_233834 ?auto_233835 ?auto_233836 ?auto_233837 ?auto_233838 ?auto_233839 ?auto_233840 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_233849 - BLOCK
      ?auto_233850 - BLOCK
      ?auto_233851 - BLOCK
      ?auto_233852 - BLOCK
      ?auto_233853 - BLOCK
      ?auto_233854 - BLOCK
      ?auto_233855 - BLOCK
    )
    :vars
    (
      ?auto_233856 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233855 ?auto_233856 ) ( not ( = ?auto_233849 ?auto_233850 ) ) ( not ( = ?auto_233849 ?auto_233851 ) ) ( not ( = ?auto_233849 ?auto_233852 ) ) ( not ( = ?auto_233849 ?auto_233853 ) ) ( not ( = ?auto_233849 ?auto_233854 ) ) ( not ( = ?auto_233849 ?auto_233855 ) ) ( not ( = ?auto_233849 ?auto_233856 ) ) ( not ( = ?auto_233850 ?auto_233851 ) ) ( not ( = ?auto_233850 ?auto_233852 ) ) ( not ( = ?auto_233850 ?auto_233853 ) ) ( not ( = ?auto_233850 ?auto_233854 ) ) ( not ( = ?auto_233850 ?auto_233855 ) ) ( not ( = ?auto_233850 ?auto_233856 ) ) ( not ( = ?auto_233851 ?auto_233852 ) ) ( not ( = ?auto_233851 ?auto_233853 ) ) ( not ( = ?auto_233851 ?auto_233854 ) ) ( not ( = ?auto_233851 ?auto_233855 ) ) ( not ( = ?auto_233851 ?auto_233856 ) ) ( not ( = ?auto_233852 ?auto_233853 ) ) ( not ( = ?auto_233852 ?auto_233854 ) ) ( not ( = ?auto_233852 ?auto_233855 ) ) ( not ( = ?auto_233852 ?auto_233856 ) ) ( not ( = ?auto_233853 ?auto_233854 ) ) ( not ( = ?auto_233853 ?auto_233855 ) ) ( not ( = ?auto_233853 ?auto_233856 ) ) ( not ( = ?auto_233854 ?auto_233855 ) ) ( not ( = ?auto_233854 ?auto_233856 ) ) ( not ( = ?auto_233855 ?auto_233856 ) ) ( ON ?auto_233854 ?auto_233855 ) ( ON ?auto_233853 ?auto_233854 ) ( ON ?auto_233852 ?auto_233853 ) ( ON ?auto_233851 ?auto_233852 ) ( ON ?auto_233850 ?auto_233851 ) ( ON ?auto_233849 ?auto_233850 ) ( CLEAR ?auto_233849 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_233849 )
      ( MAKE-7PILE ?auto_233849 ?auto_233850 ?auto_233851 ?auto_233852 ?auto_233853 ?auto_233854 ?auto_233855 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_233864 - BLOCK
      ?auto_233865 - BLOCK
      ?auto_233866 - BLOCK
      ?auto_233867 - BLOCK
      ?auto_233868 - BLOCK
      ?auto_233869 - BLOCK
      ?auto_233870 - BLOCK
    )
    :vars
    (
      ?auto_233871 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233870 ?auto_233871 ) ( not ( = ?auto_233864 ?auto_233865 ) ) ( not ( = ?auto_233864 ?auto_233866 ) ) ( not ( = ?auto_233864 ?auto_233867 ) ) ( not ( = ?auto_233864 ?auto_233868 ) ) ( not ( = ?auto_233864 ?auto_233869 ) ) ( not ( = ?auto_233864 ?auto_233870 ) ) ( not ( = ?auto_233864 ?auto_233871 ) ) ( not ( = ?auto_233865 ?auto_233866 ) ) ( not ( = ?auto_233865 ?auto_233867 ) ) ( not ( = ?auto_233865 ?auto_233868 ) ) ( not ( = ?auto_233865 ?auto_233869 ) ) ( not ( = ?auto_233865 ?auto_233870 ) ) ( not ( = ?auto_233865 ?auto_233871 ) ) ( not ( = ?auto_233866 ?auto_233867 ) ) ( not ( = ?auto_233866 ?auto_233868 ) ) ( not ( = ?auto_233866 ?auto_233869 ) ) ( not ( = ?auto_233866 ?auto_233870 ) ) ( not ( = ?auto_233866 ?auto_233871 ) ) ( not ( = ?auto_233867 ?auto_233868 ) ) ( not ( = ?auto_233867 ?auto_233869 ) ) ( not ( = ?auto_233867 ?auto_233870 ) ) ( not ( = ?auto_233867 ?auto_233871 ) ) ( not ( = ?auto_233868 ?auto_233869 ) ) ( not ( = ?auto_233868 ?auto_233870 ) ) ( not ( = ?auto_233868 ?auto_233871 ) ) ( not ( = ?auto_233869 ?auto_233870 ) ) ( not ( = ?auto_233869 ?auto_233871 ) ) ( not ( = ?auto_233870 ?auto_233871 ) ) ( ON ?auto_233869 ?auto_233870 ) ( ON ?auto_233868 ?auto_233869 ) ( ON ?auto_233867 ?auto_233868 ) ( ON ?auto_233866 ?auto_233867 ) ( ON ?auto_233865 ?auto_233866 ) ( ON ?auto_233864 ?auto_233865 ) ( CLEAR ?auto_233864 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_233864 )
      ( MAKE-7PILE ?auto_233864 ?auto_233865 ?auto_233866 ?auto_233867 ?auto_233868 ?auto_233869 ?auto_233870 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_233880 - BLOCK
      ?auto_233881 - BLOCK
      ?auto_233882 - BLOCK
      ?auto_233883 - BLOCK
      ?auto_233884 - BLOCK
      ?auto_233885 - BLOCK
      ?auto_233886 - BLOCK
      ?auto_233887 - BLOCK
    )
    :vars
    (
      ?auto_233888 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_233886 ) ( ON ?auto_233887 ?auto_233888 ) ( CLEAR ?auto_233887 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_233880 ) ( ON ?auto_233881 ?auto_233880 ) ( ON ?auto_233882 ?auto_233881 ) ( ON ?auto_233883 ?auto_233882 ) ( ON ?auto_233884 ?auto_233883 ) ( ON ?auto_233885 ?auto_233884 ) ( ON ?auto_233886 ?auto_233885 ) ( not ( = ?auto_233880 ?auto_233881 ) ) ( not ( = ?auto_233880 ?auto_233882 ) ) ( not ( = ?auto_233880 ?auto_233883 ) ) ( not ( = ?auto_233880 ?auto_233884 ) ) ( not ( = ?auto_233880 ?auto_233885 ) ) ( not ( = ?auto_233880 ?auto_233886 ) ) ( not ( = ?auto_233880 ?auto_233887 ) ) ( not ( = ?auto_233880 ?auto_233888 ) ) ( not ( = ?auto_233881 ?auto_233882 ) ) ( not ( = ?auto_233881 ?auto_233883 ) ) ( not ( = ?auto_233881 ?auto_233884 ) ) ( not ( = ?auto_233881 ?auto_233885 ) ) ( not ( = ?auto_233881 ?auto_233886 ) ) ( not ( = ?auto_233881 ?auto_233887 ) ) ( not ( = ?auto_233881 ?auto_233888 ) ) ( not ( = ?auto_233882 ?auto_233883 ) ) ( not ( = ?auto_233882 ?auto_233884 ) ) ( not ( = ?auto_233882 ?auto_233885 ) ) ( not ( = ?auto_233882 ?auto_233886 ) ) ( not ( = ?auto_233882 ?auto_233887 ) ) ( not ( = ?auto_233882 ?auto_233888 ) ) ( not ( = ?auto_233883 ?auto_233884 ) ) ( not ( = ?auto_233883 ?auto_233885 ) ) ( not ( = ?auto_233883 ?auto_233886 ) ) ( not ( = ?auto_233883 ?auto_233887 ) ) ( not ( = ?auto_233883 ?auto_233888 ) ) ( not ( = ?auto_233884 ?auto_233885 ) ) ( not ( = ?auto_233884 ?auto_233886 ) ) ( not ( = ?auto_233884 ?auto_233887 ) ) ( not ( = ?auto_233884 ?auto_233888 ) ) ( not ( = ?auto_233885 ?auto_233886 ) ) ( not ( = ?auto_233885 ?auto_233887 ) ) ( not ( = ?auto_233885 ?auto_233888 ) ) ( not ( = ?auto_233886 ?auto_233887 ) ) ( not ( = ?auto_233886 ?auto_233888 ) ) ( not ( = ?auto_233887 ?auto_233888 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_233887 ?auto_233888 )
      ( !STACK ?auto_233887 ?auto_233886 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_233897 - BLOCK
      ?auto_233898 - BLOCK
      ?auto_233899 - BLOCK
      ?auto_233900 - BLOCK
      ?auto_233901 - BLOCK
      ?auto_233902 - BLOCK
      ?auto_233903 - BLOCK
      ?auto_233904 - BLOCK
    )
    :vars
    (
      ?auto_233905 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_233903 ) ( ON ?auto_233904 ?auto_233905 ) ( CLEAR ?auto_233904 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_233897 ) ( ON ?auto_233898 ?auto_233897 ) ( ON ?auto_233899 ?auto_233898 ) ( ON ?auto_233900 ?auto_233899 ) ( ON ?auto_233901 ?auto_233900 ) ( ON ?auto_233902 ?auto_233901 ) ( ON ?auto_233903 ?auto_233902 ) ( not ( = ?auto_233897 ?auto_233898 ) ) ( not ( = ?auto_233897 ?auto_233899 ) ) ( not ( = ?auto_233897 ?auto_233900 ) ) ( not ( = ?auto_233897 ?auto_233901 ) ) ( not ( = ?auto_233897 ?auto_233902 ) ) ( not ( = ?auto_233897 ?auto_233903 ) ) ( not ( = ?auto_233897 ?auto_233904 ) ) ( not ( = ?auto_233897 ?auto_233905 ) ) ( not ( = ?auto_233898 ?auto_233899 ) ) ( not ( = ?auto_233898 ?auto_233900 ) ) ( not ( = ?auto_233898 ?auto_233901 ) ) ( not ( = ?auto_233898 ?auto_233902 ) ) ( not ( = ?auto_233898 ?auto_233903 ) ) ( not ( = ?auto_233898 ?auto_233904 ) ) ( not ( = ?auto_233898 ?auto_233905 ) ) ( not ( = ?auto_233899 ?auto_233900 ) ) ( not ( = ?auto_233899 ?auto_233901 ) ) ( not ( = ?auto_233899 ?auto_233902 ) ) ( not ( = ?auto_233899 ?auto_233903 ) ) ( not ( = ?auto_233899 ?auto_233904 ) ) ( not ( = ?auto_233899 ?auto_233905 ) ) ( not ( = ?auto_233900 ?auto_233901 ) ) ( not ( = ?auto_233900 ?auto_233902 ) ) ( not ( = ?auto_233900 ?auto_233903 ) ) ( not ( = ?auto_233900 ?auto_233904 ) ) ( not ( = ?auto_233900 ?auto_233905 ) ) ( not ( = ?auto_233901 ?auto_233902 ) ) ( not ( = ?auto_233901 ?auto_233903 ) ) ( not ( = ?auto_233901 ?auto_233904 ) ) ( not ( = ?auto_233901 ?auto_233905 ) ) ( not ( = ?auto_233902 ?auto_233903 ) ) ( not ( = ?auto_233902 ?auto_233904 ) ) ( not ( = ?auto_233902 ?auto_233905 ) ) ( not ( = ?auto_233903 ?auto_233904 ) ) ( not ( = ?auto_233903 ?auto_233905 ) ) ( not ( = ?auto_233904 ?auto_233905 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_233904 ?auto_233905 )
      ( !STACK ?auto_233904 ?auto_233903 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_233914 - BLOCK
      ?auto_233915 - BLOCK
      ?auto_233916 - BLOCK
      ?auto_233917 - BLOCK
      ?auto_233918 - BLOCK
      ?auto_233919 - BLOCK
      ?auto_233920 - BLOCK
      ?auto_233921 - BLOCK
    )
    :vars
    (
      ?auto_233922 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233921 ?auto_233922 ) ( ON-TABLE ?auto_233914 ) ( ON ?auto_233915 ?auto_233914 ) ( ON ?auto_233916 ?auto_233915 ) ( ON ?auto_233917 ?auto_233916 ) ( ON ?auto_233918 ?auto_233917 ) ( ON ?auto_233919 ?auto_233918 ) ( not ( = ?auto_233914 ?auto_233915 ) ) ( not ( = ?auto_233914 ?auto_233916 ) ) ( not ( = ?auto_233914 ?auto_233917 ) ) ( not ( = ?auto_233914 ?auto_233918 ) ) ( not ( = ?auto_233914 ?auto_233919 ) ) ( not ( = ?auto_233914 ?auto_233920 ) ) ( not ( = ?auto_233914 ?auto_233921 ) ) ( not ( = ?auto_233914 ?auto_233922 ) ) ( not ( = ?auto_233915 ?auto_233916 ) ) ( not ( = ?auto_233915 ?auto_233917 ) ) ( not ( = ?auto_233915 ?auto_233918 ) ) ( not ( = ?auto_233915 ?auto_233919 ) ) ( not ( = ?auto_233915 ?auto_233920 ) ) ( not ( = ?auto_233915 ?auto_233921 ) ) ( not ( = ?auto_233915 ?auto_233922 ) ) ( not ( = ?auto_233916 ?auto_233917 ) ) ( not ( = ?auto_233916 ?auto_233918 ) ) ( not ( = ?auto_233916 ?auto_233919 ) ) ( not ( = ?auto_233916 ?auto_233920 ) ) ( not ( = ?auto_233916 ?auto_233921 ) ) ( not ( = ?auto_233916 ?auto_233922 ) ) ( not ( = ?auto_233917 ?auto_233918 ) ) ( not ( = ?auto_233917 ?auto_233919 ) ) ( not ( = ?auto_233917 ?auto_233920 ) ) ( not ( = ?auto_233917 ?auto_233921 ) ) ( not ( = ?auto_233917 ?auto_233922 ) ) ( not ( = ?auto_233918 ?auto_233919 ) ) ( not ( = ?auto_233918 ?auto_233920 ) ) ( not ( = ?auto_233918 ?auto_233921 ) ) ( not ( = ?auto_233918 ?auto_233922 ) ) ( not ( = ?auto_233919 ?auto_233920 ) ) ( not ( = ?auto_233919 ?auto_233921 ) ) ( not ( = ?auto_233919 ?auto_233922 ) ) ( not ( = ?auto_233920 ?auto_233921 ) ) ( not ( = ?auto_233920 ?auto_233922 ) ) ( not ( = ?auto_233921 ?auto_233922 ) ) ( CLEAR ?auto_233919 ) ( ON ?auto_233920 ?auto_233921 ) ( CLEAR ?auto_233920 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_233914 ?auto_233915 ?auto_233916 ?auto_233917 ?auto_233918 ?auto_233919 ?auto_233920 )
      ( MAKE-8PILE ?auto_233914 ?auto_233915 ?auto_233916 ?auto_233917 ?auto_233918 ?auto_233919 ?auto_233920 ?auto_233921 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_233931 - BLOCK
      ?auto_233932 - BLOCK
      ?auto_233933 - BLOCK
      ?auto_233934 - BLOCK
      ?auto_233935 - BLOCK
      ?auto_233936 - BLOCK
      ?auto_233937 - BLOCK
      ?auto_233938 - BLOCK
    )
    :vars
    (
      ?auto_233939 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233938 ?auto_233939 ) ( ON-TABLE ?auto_233931 ) ( ON ?auto_233932 ?auto_233931 ) ( ON ?auto_233933 ?auto_233932 ) ( ON ?auto_233934 ?auto_233933 ) ( ON ?auto_233935 ?auto_233934 ) ( ON ?auto_233936 ?auto_233935 ) ( not ( = ?auto_233931 ?auto_233932 ) ) ( not ( = ?auto_233931 ?auto_233933 ) ) ( not ( = ?auto_233931 ?auto_233934 ) ) ( not ( = ?auto_233931 ?auto_233935 ) ) ( not ( = ?auto_233931 ?auto_233936 ) ) ( not ( = ?auto_233931 ?auto_233937 ) ) ( not ( = ?auto_233931 ?auto_233938 ) ) ( not ( = ?auto_233931 ?auto_233939 ) ) ( not ( = ?auto_233932 ?auto_233933 ) ) ( not ( = ?auto_233932 ?auto_233934 ) ) ( not ( = ?auto_233932 ?auto_233935 ) ) ( not ( = ?auto_233932 ?auto_233936 ) ) ( not ( = ?auto_233932 ?auto_233937 ) ) ( not ( = ?auto_233932 ?auto_233938 ) ) ( not ( = ?auto_233932 ?auto_233939 ) ) ( not ( = ?auto_233933 ?auto_233934 ) ) ( not ( = ?auto_233933 ?auto_233935 ) ) ( not ( = ?auto_233933 ?auto_233936 ) ) ( not ( = ?auto_233933 ?auto_233937 ) ) ( not ( = ?auto_233933 ?auto_233938 ) ) ( not ( = ?auto_233933 ?auto_233939 ) ) ( not ( = ?auto_233934 ?auto_233935 ) ) ( not ( = ?auto_233934 ?auto_233936 ) ) ( not ( = ?auto_233934 ?auto_233937 ) ) ( not ( = ?auto_233934 ?auto_233938 ) ) ( not ( = ?auto_233934 ?auto_233939 ) ) ( not ( = ?auto_233935 ?auto_233936 ) ) ( not ( = ?auto_233935 ?auto_233937 ) ) ( not ( = ?auto_233935 ?auto_233938 ) ) ( not ( = ?auto_233935 ?auto_233939 ) ) ( not ( = ?auto_233936 ?auto_233937 ) ) ( not ( = ?auto_233936 ?auto_233938 ) ) ( not ( = ?auto_233936 ?auto_233939 ) ) ( not ( = ?auto_233937 ?auto_233938 ) ) ( not ( = ?auto_233937 ?auto_233939 ) ) ( not ( = ?auto_233938 ?auto_233939 ) ) ( CLEAR ?auto_233936 ) ( ON ?auto_233937 ?auto_233938 ) ( CLEAR ?auto_233937 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_233931 ?auto_233932 ?auto_233933 ?auto_233934 ?auto_233935 ?auto_233936 ?auto_233937 )
      ( MAKE-8PILE ?auto_233931 ?auto_233932 ?auto_233933 ?auto_233934 ?auto_233935 ?auto_233936 ?auto_233937 ?auto_233938 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_233948 - BLOCK
      ?auto_233949 - BLOCK
      ?auto_233950 - BLOCK
      ?auto_233951 - BLOCK
      ?auto_233952 - BLOCK
      ?auto_233953 - BLOCK
      ?auto_233954 - BLOCK
      ?auto_233955 - BLOCK
    )
    :vars
    (
      ?auto_233956 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233955 ?auto_233956 ) ( ON-TABLE ?auto_233948 ) ( ON ?auto_233949 ?auto_233948 ) ( ON ?auto_233950 ?auto_233949 ) ( ON ?auto_233951 ?auto_233950 ) ( ON ?auto_233952 ?auto_233951 ) ( not ( = ?auto_233948 ?auto_233949 ) ) ( not ( = ?auto_233948 ?auto_233950 ) ) ( not ( = ?auto_233948 ?auto_233951 ) ) ( not ( = ?auto_233948 ?auto_233952 ) ) ( not ( = ?auto_233948 ?auto_233953 ) ) ( not ( = ?auto_233948 ?auto_233954 ) ) ( not ( = ?auto_233948 ?auto_233955 ) ) ( not ( = ?auto_233948 ?auto_233956 ) ) ( not ( = ?auto_233949 ?auto_233950 ) ) ( not ( = ?auto_233949 ?auto_233951 ) ) ( not ( = ?auto_233949 ?auto_233952 ) ) ( not ( = ?auto_233949 ?auto_233953 ) ) ( not ( = ?auto_233949 ?auto_233954 ) ) ( not ( = ?auto_233949 ?auto_233955 ) ) ( not ( = ?auto_233949 ?auto_233956 ) ) ( not ( = ?auto_233950 ?auto_233951 ) ) ( not ( = ?auto_233950 ?auto_233952 ) ) ( not ( = ?auto_233950 ?auto_233953 ) ) ( not ( = ?auto_233950 ?auto_233954 ) ) ( not ( = ?auto_233950 ?auto_233955 ) ) ( not ( = ?auto_233950 ?auto_233956 ) ) ( not ( = ?auto_233951 ?auto_233952 ) ) ( not ( = ?auto_233951 ?auto_233953 ) ) ( not ( = ?auto_233951 ?auto_233954 ) ) ( not ( = ?auto_233951 ?auto_233955 ) ) ( not ( = ?auto_233951 ?auto_233956 ) ) ( not ( = ?auto_233952 ?auto_233953 ) ) ( not ( = ?auto_233952 ?auto_233954 ) ) ( not ( = ?auto_233952 ?auto_233955 ) ) ( not ( = ?auto_233952 ?auto_233956 ) ) ( not ( = ?auto_233953 ?auto_233954 ) ) ( not ( = ?auto_233953 ?auto_233955 ) ) ( not ( = ?auto_233953 ?auto_233956 ) ) ( not ( = ?auto_233954 ?auto_233955 ) ) ( not ( = ?auto_233954 ?auto_233956 ) ) ( not ( = ?auto_233955 ?auto_233956 ) ) ( ON ?auto_233954 ?auto_233955 ) ( CLEAR ?auto_233952 ) ( ON ?auto_233953 ?auto_233954 ) ( CLEAR ?auto_233953 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_233948 ?auto_233949 ?auto_233950 ?auto_233951 ?auto_233952 ?auto_233953 )
      ( MAKE-8PILE ?auto_233948 ?auto_233949 ?auto_233950 ?auto_233951 ?auto_233952 ?auto_233953 ?auto_233954 ?auto_233955 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_233965 - BLOCK
      ?auto_233966 - BLOCK
      ?auto_233967 - BLOCK
      ?auto_233968 - BLOCK
      ?auto_233969 - BLOCK
      ?auto_233970 - BLOCK
      ?auto_233971 - BLOCK
      ?auto_233972 - BLOCK
    )
    :vars
    (
      ?auto_233973 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233972 ?auto_233973 ) ( ON-TABLE ?auto_233965 ) ( ON ?auto_233966 ?auto_233965 ) ( ON ?auto_233967 ?auto_233966 ) ( ON ?auto_233968 ?auto_233967 ) ( ON ?auto_233969 ?auto_233968 ) ( not ( = ?auto_233965 ?auto_233966 ) ) ( not ( = ?auto_233965 ?auto_233967 ) ) ( not ( = ?auto_233965 ?auto_233968 ) ) ( not ( = ?auto_233965 ?auto_233969 ) ) ( not ( = ?auto_233965 ?auto_233970 ) ) ( not ( = ?auto_233965 ?auto_233971 ) ) ( not ( = ?auto_233965 ?auto_233972 ) ) ( not ( = ?auto_233965 ?auto_233973 ) ) ( not ( = ?auto_233966 ?auto_233967 ) ) ( not ( = ?auto_233966 ?auto_233968 ) ) ( not ( = ?auto_233966 ?auto_233969 ) ) ( not ( = ?auto_233966 ?auto_233970 ) ) ( not ( = ?auto_233966 ?auto_233971 ) ) ( not ( = ?auto_233966 ?auto_233972 ) ) ( not ( = ?auto_233966 ?auto_233973 ) ) ( not ( = ?auto_233967 ?auto_233968 ) ) ( not ( = ?auto_233967 ?auto_233969 ) ) ( not ( = ?auto_233967 ?auto_233970 ) ) ( not ( = ?auto_233967 ?auto_233971 ) ) ( not ( = ?auto_233967 ?auto_233972 ) ) ( not ( = ?auto_233967 ?auto_233973 ) ) ( not ( = ?auto_233968 ?auto_233969 ) ) ( not ( = ?auto_233968 ?auto_233970 ) ) ( not ( = ?auto_233968 ?auto_233971 ) ) ( not ( = ?auto_233968 ?auto_233972 ) ) ( not ( = ?auto_233968 ?auto_233973 ) ) ( not ( = ?auto_233969 ?auto_233970 ) ) ( not ( = ?auto_233969 ?auto_233971 ) ) ( not ( = ?auto_233969 ?auto_233972 ) ) ( not ( = ?auto_233969 ?auto_233973 ) ) ( not ( = ?auto_233970 ?auto_233971 ) ) ( not ( = ?auto_233970 ?auto_233972 ) ) ( not ( = ?auto_233970 ?auto_233973 ) ) ( not ( = ?auto_233971 ?auto_233972 ) ) ( not ( = ?auto_233971 ?auto_233973 ) ) ( not ( = ?auto_233972 ?auto_233973 ) ) ( ON ?auto_233971 ?auto_233972 ) ( CLEAR ?auto_233969 ) ( ON ?auto_233970 ?auto_233971 ) ( CLEAR ?auto_233970 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_233965 ?auto_233966 ?auto_233967 ?auto_233968 ?auto_233969 ?auto_233970 )
      ( MAKE-8PILE ?auto_233965 ?auto_233966 ?auto_233967 ?auto_233968 ?auto_233969 ?auto_233970 ?auto_233971 ?auto_233972 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_233982 - BLOCK
      ?auto_233983 - BLOCK
      ?auto_233984 - BLOCK
      ?auto_233985 - BLOCK
      ?auto_233986 - BLOCK
      ?auto_233987 - BLOCK
      ?auto_233988 - BLOCK
      ?auto_233989 - BLOCK
    )
    :vars
    (
      ?auto_233990 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233989 ?auto_233990 ) ( ON-TABLE ?auto_233982 ) ( ON ?auto_233983 ?auto_233982 ) ( ON ?auto_233984 ?auto_233983 ) ( ON ?auto_233985 ?auto_233984 ) ( not ( = ?auto_233982 ?auto_233983 ) ) ( not ( = ?auto_233982 ?auto_233984 ) ) ( not ( = ?auto_233982 ?auto_233985 ) ) ( not ( = ?auto_233982 ?auto_233986 ) ) ( not ( = ?auto_233982 ?auto_233987 ) ) ( not ( = ?auto_233982 ?auto_233988 ) ) ( not ( = ?auto_233982 ?auto_233989 ) ) ( not ( = ?auto_233982 ?auto_233990 ) ) ( not ( = ?auto_233983 ?auto_233984 ) ) ( not ( = ?auto_233983 ?auto_233985 ) ) ( not ( = ?auto_233983 ?auto_233986 ) ) ( not ( = ?auto_233983 ?auto_233987 ) ) ( not ( = ?auto_233983 ?auto_233988 ) ) ( not ( = ?auto_233983 ?auto_233989 ) ) ( not ( = ?auto_233983 ?auto_233990 ) ) ( not ( = ?auto_233984 ?auto_233985 ) ) ( not ( = ?auto_233984 ?auto_233986 ) ) ( not ( = ?auto_233984 ?auto_233987 ) ) ( not ( = ?auto_233984 ?auto_233988 ) ) ( not ( = ?auto_233984 ?auto_233989 ) ) ( not ( = ?auto_233984 ?auto_233990 ) ) ( not ( = ?auto_233985 ?auto_233986 ) ) ( not ( = ?auto_233985 ?auto_233987 ) ) ( not ( = ?auto_233985 ?auto_233988 ) ) ( not ( = ?auto_233985 ?auto_233989 ) ) ( not ( = ?auto_233985 ?auto_233990 ) ) ( not ( = ?auto_233986 ?auto_233987 ) ) ( not ( = ?auto_233986 ?auto_233988 ) ) ( not ( = ?auto_233986 ?auto_233989 ) ) ( not ( = ?auto_233986 ?auto_233990 ) ) ( not ( = ?auto_233987 ?auto_233988 ) ) ( not ( = ?auto_233987 ?auto_233989 ) ) ( not ( = ?auto_233987 ?auto_233990 ) ) ( not ( = ?auto_233988 ?auto_233989 ) ) ( not ( = ?auto_233988 ?auto_233990 ) ) ( not ( = ?auto_233989 ?auto_233990 ) ) ( ON ?auto_233988 ?auto_233989 ) ( ON ?auto_233987 ?auto_233988 ) ( CLEAR ?auto_233985 ) ( ON ?auto_233986 ?auto_233987 ) ( CLEAR ?auto_233986 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_233982 ?auto_233983 ?auto_233984 ?auto_233985 ?auto_233986 )
      ( MAKE-8PILE ?auto_233982 ?auto_233983 ?auto_233984 ?auto_233985 ?auto_233986 ?auto_233987 ?auto_233988 ?auto_233989 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_233999 - BLOCK
      ?auto_234000 - BLOCK
      ?auto_234001 - BLOCK
      ?auto_234002 - BLOCK
      ?auto_234003 - BLOCK
      ?auto_234004 - BLOCK
      ?auto_234005 - BLOCK
      ?auto_234006 - BLOCK
    )
    :vars
    (
      ?auto_234007 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_234006 ?auto_234007 ) ( ON-TABLE ?auto_233999 ) ( ON ?auto_234000 ?auto_233999 ) ( ON ?auto_234001 ?auto_234000 ) ( ON ?auto_234002 ?auto_234001 ) ( not ( = ?auto_233999 ?auto_234000 ) ) ( not ( = ?auto_233999 ?auto_234001 ) ) ( not ( = ?auto_233999 ?auto_234002 ) ) ( not ( = ?auto_233999 ?auto_234003 ) ) ( not ( = ?auto_233999 ?auto_234004 ) ) ( not ( = ?auto_233999 ?auto_234005 ) ) ( not ( = ?auto_233999 ?auto_234006 ) ) ( not ( = ?auto_233999 ?auto_234007 ) ) ( not ( = ?auto_234000 ?auto_234001 ) ) ( not ( = ?auto_234000 ?auto_234002 ) ) ( not ( = ?auto_234000 ?auto_234003 ) ) ( not ( = ?auto_234000 ?auto_234004 ) ) ( not ( = ?auto_234000 ?auto_234005 ) ) ( not ( = ?auto_234000 ?auto_234006 ) ) ( not ( = ?auto_234000 ?auto_234007 ) ) ( not ( = ?auto_234001 ?auto_234002 ) ) ( not ( = ?auto_234001 ?auto_234003 ) ) ( not ( = ?auto_234001 ?auto_234004 ) ) ( not ( = ?auto_234001 ?auto_234005 ) ) ( not ( = ?auto_234001 ?auto_234006 ) ) ( not ( = ?auto_234001 ?auto_234007 ) ) ( not ( = ?auto_234002 ?auto_234003 ) ) ( not ( = ?auto_234002 ?auto_234004 ) ) ( not ( = ?auto_234002 ?auto_234005 ) ) ( not ( = ?auto_234002 ?auto_234006 ) ) ( not ( = ?auto_234002 ?auto_234007 ) ) ( not ( = ?auto_234003 ?auto_234004 ) ) ( not ( = ?auto_234003 ?auto_234005 ) ) ( not ( = ?auto_234003 ?auto_234006 ) ) ( not ( = ?auto_234003 ?auto_234007 ) ) ( not ( = ?auto_234004 ?auto_234005 ) ) ( not ( = ?auto_234004 ?auto_234006 ) ) ( not ( = ?auto_234004 ?auto_234007 ) ) ( not ( = ?auto_234005 ?auto_234006 ) ) ( not ( = ?auto_234005 ?auto_234007 ) ) ( not ( = ?auto_234006 ?auto_234007 ) ) ( ON ?auto_234005 ?auto_234006 ) ( ON ?auto_234004 ?auto_234005 ) ( CLEAR ?auto_234002 ) ( ON ?auto_234003 ?auto_234004 ) ( CLEAR ?auto_234003 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_233999 ?auto_234000 ?auto_234001 ?auto_234002 ?auto_234003 )
      ( MAKE-8PILE ?auto_233999 ?auto_234000 ?auto_234001 ?auto_234002 ?auto_234003 ?auto_234004 ?auto_234005 ?auto_234006 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_234016 - BLOCK
      ?auto_234017 - BLOCK
      ?auto_234018 - BLOCK
      ?auto_234019 - BLOCK
      ?auto_234020 - BLOCK
      ?auto_234021 - BLOCK
      ?auto_234022 - BLOCK
      ?auto_234023 - BLOCK
    )
    :vars
    (
      ?auto_234024 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_234023 ?auto_234024 ) ( ON-TABLE ?auto_234016 ) ( ON ?auto_234017 ?auto_234016 ) ( ON ?auto_234018 ?auto_234017 ) ( not ( = ?auto_234016 ?auto_234017 ) ) ( not ( = ?auto_234016 ?auto_234018 ) ) ( not ( = ?auto_234016 ?auto_234019 ) ) ( not ( = ?auto_234016 ?auto_234020 ) ) ( not ( = ?auto_234016 ?auto_234021 ) ) ( not ( = ?auto_234016 ?auto_234022 ) ) ( not ( = ?auto_234016 ?auto_234023 ) ) ( not ( = ?auto_234016 ?auto_234024 ) ) ( not ( = ?auto_234017 ?auto_234018 ) ) ( not ( = ?auto_234017 ?auto_234019 ) ) ( not ( = ?auto_234017 ?auto_234020 ) ) ( not ( = ?auto_234017 ?auto_234021 ) ) ( not ( = ?auto_234017 ?auto_234022 ) ) ( not ( = ?auto_234017 ?auto_234023 ) ) ( not ( = ?auto_234017 ?auto_234024 ) ) ( not ( = ?auto_234018 ?auto_234019 ) ) ( not ( = ?auto_234018 ?auto_234020 ) ) ( not ( = ?auto_234018 ?auto_234021 ) ) ( not ( = ?auto_234018 ?auto_234022 ) ) ( not ( = ?auto_234018 ?auto_234023 ) ) ( not ( = ?auto_234018 ?auto_234024 ) ) ( not ( = ?auto_234019 ?auto_234020 ) ) ( not ( = ?auto_234019 ?auto_234021 ) ) ( not ( = ?auto_234019 ?auto_234022 ) ) ( not ( = ?auto_234019 ?auto_234023 ) ) ( not ( = ?auto_234019 ?auto_234024 ) ) ( not ( = ?auto_234020 ?auto_234021 ) ) ( not ( = ?auto_234020 ?auto_234022 ) ) ( not ( = ?auto_234020 ?auto_234023 ) ) ( not ( = ?auto_234020 ?auto_234024 ) ) ( not ( = ?auto_234021 ?auto_234022 ) ) ( not ( = ?auto_234021 ?auto_234023 ) ) ( not ( = ?auto_234021 ?auto_234024 ) ) ( not ( = ?auto_234022 ?auto_234023 ) ) ( not ( = ?auto_234022 ?auto_234024 ) ) ( not ( = ?auto_234023 ?auto_234024 ) ) ( ON ?auto_234022 ?auto_234023 ) ( ON ?auto_234021 ?auto_234022 ) ( ON ?auto_234020 ?auto_234021 ) ( CLEAR ?auto_234018 ) ( ON ?auto_234019 ?auto_234020 ) ( CLEAR ?auto_234019 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_234016 ?auto_234017 ?auto_234018 ?auto_234019 )
      ( MAKE-8PILE ?auto_234016 ?auto_234017 ?auto_234018 ?auto_234019 ?auto_234020 ?auto_234021 ?auto_234022 ?auto_234023 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_234033 - BLOCK
      ?auto_234034 - BLOCK
      ?auto_234035 - BLOCK
      ?auto_234036 - BLOCK
      ?auto_234037 - BLOCK
      ?auto_234038 - BLOCK
      ?auto_234039 - BLOCK
      ?auto_234040 - BLOCK
    )
    :vars
    (
      ?auto_234041 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_234040 ?auto_234041 ) ( ON-TABLE ?auto_234033 ) ( ON ?auto_234034 ?auto_234033 ) ( ON ?auto_234035 ?auto_234034 ) ( not ( = ?auto_234033 ?auto_234034 ) ) ( not ( = ?auto_234033 ?auto_234035 ) ) ( not ( = ?auto_234033 ?auto_234036 ) ) ( not ( = ?auto_234033 ?auto_234037 ) ) ( not ( = ?auto_234033 ?auto_234038 ) ) ( not ( = ?auto_234033 ?auto_234039 ) ) ( not ( = ?auto_234033 ?auto_234040 ) ) ( not ( = ?auto_234033 ?auto_234041 ) ) ( not ( = ?auto_234034 ?auto_234035 ) ) ( not ( = ?auto_234034 ?auto_234036 ) ) ( not ( = ?auto_234034 ?auto_234037 ) ) ( not ( = ?auto_234034 ?auto_234038 ) ) ( not ( = ?auto_234034 ?auto_234039 ) ) ( not ( = ?auto_234034 ?auto_234040 ) ) ( not ( = ?auto_234034 ?auto_234041 ) ) ( not ( = ?auto_234035 ?auto_234036 ) ) ( not ( = ?auto_234035 ?auto_234037 ) ) ( not ( = ?auto_234035 ?auto_234038 ) ) ( not ( = ?auto_234035 ?auto_234039 ) ) ( not ( = ?auto_234035 ?auto_234040 ) ) ( not ( = ?auto_234035 ?auto_234041 ) ) ( not ( = ?auto_234036 ?auto_234037 ) ) ( not ( = ?auto_234036 ?auto_234038 ) ) ( not ( = ?auto_234036 ?auto_234039 ) ) ( not ( = ?auto_234036 ?auto_234040 ) ) ( not ( = ?auto_234036 ?auto_234041 ) ) ( not ( = ?auto_234037 ?auto_234038 ) ) ( not ( = ?auto_234037 ?auto_234039 ) ) ( not ( = ?auto_234037 ?auto_234040 ) ) ( not ( = ?auto_234037 ?auto_234041 ) ) ( not ( = ?auto_234038 ?auto_234039 ) ) ( not ( = ?auto_234038 ?auto_234040 ) ) ( not ( = ?auto_234038 ?auto_234041 ) ) ( not ( = ?auto_234039 ?auto_234040 ) ) ( not ( = ?auto_234039 ?auto_234041 ) ) ( not ( = ?auto_234040 ?auto_234041 ) ) ( ON ?auto_234039 ?auto_234040 ) ( ON ?auto_234038 ?auto_234039 ) ( ON ?auto_234037 ?auto_234038 ) ( CLEAR ?auto_234035 ) ( ON ?auto_234036 ?auto_234037 ) ( CLEAR ?auto_234036 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_234033 ?auto_234034 ?auto_234035 ?auto_234036 )
      ( MAKE-8PILE ?auto_234033 ?auto_234034 ?auto_234035 ?auto_234036 ?auto_234037 ?auto_234038 ?auto_234039 ?auto_234040 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_234050 - BLOCK
      ?auto_234051 - BLOCK
      ?auto_234052 - BLOCK
      ?auto_234053 - BLOCK
      ?auto_234054 - BLOCK
      ?auto_234055 - BLOCK
      ?auto_234056 - BLOCK
      ?auto_234057 - BLOCK
    )
    :vars
    (
      ?auto_234058 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_234057 ?auto_234058 ) ( ON-TABLE ?auto_234050 ) ( ON ?auto_234051 ?auto_234050 ) ( not ( = ?auto_234050 ?auto_234051 ) ) ( not ( = ?auto_234050 ?auto_234052 ) ) ( not ( = ?auto_234050 ?auto_234053 ) ) ( not ( = ?auto_234050 ?auto_234054 ) ) ( not ( = ?auto_234050 ?auto_234055 ) ) ( not ( = ?auto_234050 ?auto_234056 ) ) ( not ( = ?auto_234050 ?auto_234057 ) ) ( not ( = ?auto_234050 ?auto_234058 ) ) ( not ( = ?auto_234051 ?auto_234052 ) ) ( not ( = ?auto_234051 ?auto_234053 ) ) ( not ( = ?auto_234051 ?auto_234054 ) ) ( not ( = ?auto_234051 ?auto_234055 ) ) ( not ( = ?auto_234051 ?auto_234056 ) ) ( not ( = ?auto_234051 ?auto_234057 ) ) ( not ( = ?auto_234051 ?auto_234058 ) ) ( not ( = ?auto_234052 ?auto_234053 ) ) ( not ( = ?auto_234052 ?auto_234054 ) ) ( not ( = ?auto_234052 ?auto_234055 ) ) ( not ( = ?auto_234052 ?auto_234056 ) ) ( not ( = ?auto_234052 ?auto_234057 ) ) ( not ( = ?auto_234052 ?auto_234058 ) ) ( not ( = ?auto_234053 ?auto_234054 ) ) ( not ( = ?auto_234053 ?auto_234055 ) ) ( not ( = ?auto_234053 ?auto_234056 ) ) ( not ( = ?auto_234053 ?auto_234057 ) ) ( not ( = ?auto_234053 ?auto_234058 ) ) ( not ( = ?auto_234054 ?auto_234055 ) ) ( not ( = ?auto_234054 ?auto_234056 ) ) ( not ( = ?auto_234054 ?auto_234057 ) ) ( not ( = ?auto_234054 ?auto_234058 ) ) ( not ( = ?auto_234055 ?auto_234056 ) ) ( not ( = ?auto_234055 ?auto_234057 ) ) ( not ( = ?auto_234055 ?auto_234058 ) ) ( not ( = ?auto_234056 ?auto_234057 ) ) ( not ( = ?auto_234056 ?auto_234058 ) ) ( not ( = ?auto_234057 ?auto_234058 ) ) ( ON ?auto_234056 ?auto_234057 ) ( ON ?auto_234055 ?auto_234056 ) ( ON ?auto_234054 ?auto_234055 ) ( ON ?auto_234053 ?auto_234054 ) ( CLEAR ?auto_234051 ) ( ON ?auto_234052 ?auto_234053 ) ( CLEAR ?auto_234052 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_234050 ?auto_234051 ?auto_234052 )
      ( MAKE-8PILE ?auto_234050 ?auto_234051 ?auto_234052 ?auto_234053 ?auto_234054 ?auto_234055 ?auto_234056 ?auto_234057 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_234067 - BLOCK
      ?auto_234068 - BLOCK
      ?auto_234069 - BLOCK
      ?auto_234070 - BLOCK
      ?auto_234071 - BLOCK
      ?auto_234072 - BLOCK
      ?auto_234073 - BLOCK
      ?auto_234074 - BLOCK
    )
    :vars
    (
      ?auto_234075 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_234074 ?auto_234075 ) ( ON-TABLE ?auto_234067 ) ( ON ?auto_234068 ?auto_234067 ) ( not ( = ?auto_234067 ?auto_234068 ) ) ( not ( = ?auto_234067 ?auto_234069 ) ) ( not ( = ?auto_234067 ?auto_234070 ) ) ( not ( = ?auto_234067 ?auto_234071 ) ) ( not ( = ?auto_234067 ?auto_234072 ) ) ( not ( = ?auto_234067 ?auto_234073 ) ) ( not ( = ?auto_234067 ?auto_234074 ) ) ( not ( = ?auto_234067 ?auto_234075 ) ) ( not ( = ?auto_234068 ?auto_234069 ) ) ( not ( = ?auto_234068 ?auto_234070 ) ) ( not ( = ?auto_234068 ?auto_234071 ) ) ( not ( = ?auto_234068 ?auto_234072 ) ) ( not ( = ?auto_234068 ?auto_234073 ) ) ( not ( = ?auto_234068 ?auto_234074 ) ) ( not ( = ?auto_234068 ?auto_234075 ) ) ( not ( = ?auto_234069 ?auto_234070 ) ) ( not ( = ?auto_234069 ?auto_234071 ) ) ( not ( = ?auto_234069 ?auto_234072 ) ) ( not ( = ?auto_234069 ?auto_234073 ) ) ( not ( = ?auto_234069 ?auto_234074 ) ) ( not ( = ?auto_234069 ?auto_234075 ) ) ( not ( = ?auto_234070 ?auto_234071 ) ) ( not ( = ?auto_234070 ?auto_234072 ) ) ( not ( = ?auto_234070 ?auto_234073 ) ) ( not ( = ?auto_234070 ?auto_234074 ) ) ( not ( = ?auto_234070 ?auto_234075 ) ) ( not ( = ?auto_234071 ?auto_234072 ) ) ( not ( = ?auto_234071 ?auto_234073 ) ) ( not ( = ?auto_234071 ?auto_234074 ) ) ( not ( = ?auto_234071 ?auto_234075 ) ) ( not ( = ?auto_234072 ?auto_234073 ) ) ( not ( = ?auto_234072 ?auto_234074 ) ) ( not ( = ?auto_234072 ?auto_234075 ) ) ( not ( = ?auto_234073 ?auto_234074 ) ) ( not ( = ?auto_234073 ?auto_234075 ) ) ( not ( = ?auto_234074 ?auto_234075 ) ) ( ON ?auto_234073 ?auto_234074 ) ( ON ?auto_234072 ?auto_234073 ) ( ON ?auto_234071 ?auto_234072 ) ( ON ?auto_234070 ?auto_234071 ) ( CLEAR ?auto_234068 ) ( ON ?auto_234069 ?auto_234070 ) ( CLEAR ?auto_234069 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_234067 ?auto_234068 ?auto_234069 )
      ( MAKE-8PILE ?auto_234067 ?auto_234068 ?auto_234069 ?auto_234070 ?auto_234071 ?auto_234072 ?auto_234073 ?auto_234074 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_234084 - BLOCK
      ?auto_234085 - BLOCK
      ?auto_234086 - BLOCK
      ?auto_234087 - BLOCK
      ?auto_234088 - BLOCK
      ?auto_234089 - BLOCK
      ?auto_234090 - BLOCK
      ?auto_234091 - BLOCK
    )
    :vars
    (
      ?auto_234092 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_234091 ?auto_234092 ) ( ON-TABLE ?auto_234084 ) ( not ( = ?auto_234084 ?auto_234085 ) ) ( not ( = ?auto_234084 ?auto_234086 ) ) ( not ( = ?auto_234084 ?auto_234087 ) ) ( not ( = ?auto_234084 ?auto_234088 ) ) ( not ( = ?auto_234084 ?auto_234089 ) ) ( not ( = ?auto_234084 ?auto_234090 ) ) ( not ( = ?auto_234084 ?auto_234091 ) ) ( not ( = ?auto_234084 ?auto_234092 ) ) ( not ( = ?auto_234085 ?auto_234086 ) ) ( not ( = ?auto_234085 ?auto_234087 ) ) ( not ( = ?auto_234085 ?auto_234088 ) ) ( not ( = ?auto_234085 ?auto_234089 ) ) ( not ( = ?auto_234085 ?auto_234090 ) ) ( not ( = ?auto_234085 ?auto_234091 ) ) ( not ( = ?auto_234085 ?auto_234092 ) ) ( not ( = ?auto_234086 ?auto_234087 ) ) ( not ( = ?auto_234086 ?auto_234088 ) ) ( not ( = ?auto_234086 ?auto_234089 ) ) ( not ( = ?auto_234086 ?auto_234090 ) ) ( not ( = ?auto_234086 ?auto_234091 ) ) ( not ( = ?auto_234086 ?auto_234092 ) ) ( not ( = ?auto_234087 ?auto_234088 ) ) ( not ( = ?auto_234087 ?auto_234089 ) ) ( not ( = ?auto_234087 ?auto_234090 ) ) ( not ( = ?auto_234087 ?auto_234091 ) ) ( not ( = ?auto_234087 ?auto_234092 ) ) ( not ( = ?auto_234088 ?auto_234089 ) ) ( not ( = ?auto_234088 ?auto_234090 ) ) ( not ( = ?auto_234088 ?auto_234091 ) ) ( not ( = ?auto_234088 ?auto_234092 ) ) ( not ( = ?auto_234089 ?auto_234090 ) ) ( not ( = ?auto_234089 ?auto_234091 ) ) ( not ( = ?auto_234089 ?auto_234092 ) ) ( not ( = ?auto_234090 ?auto_234091 ) ) ( not ( = ?auto_234090 ?auto_234092 ) ) ( not ( = ?auto_234091 ?auto_234092 ) ) ( ON ?auto_234090 ?auto_234091 ) ( ON ?auto_234089 ?auto_234090 ) ( ON ?auto_234088 ?auto_234089 ) ( ON ?auto_234087 ?auto_234088 ) ( ON ?auto_234086 ?auto_234087 ) ( CLEAR ?auto_234084 ) ( ON ?auto_234085 ?auto_234086 ) ( CLEAR ?auto_234085 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_234084 ?auto_234085 )
      ( MAKE-8PILE ?auto_234084 ?auto_234085 ?auto_234086 ?auto_234087 ?auto_234088 ?auto_234089 ?auto_234090 ?auto_234091 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_234101 - BLOCK
      ?auto_234102 - BLOCK
      ?auto_234103 - BLOCK
      ?auto_234104 - BLOCK
      ?auto_234105 - BLOCK
      ?auto_234106 - BLOCK
      ?auto_234107 - BLOCK
      ?auto_234108 - BLOCK
    )
    :vars
    (
      ?auto_234109 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_234108 ?auto_234109 ) ( ON-TABLE ?auto_234101 ) ( not ( = ?auto_234101 ?auto_234102 ) ) ( not ( = ?auto_234101 ?auto_234103 ) ) ( not ( = ?auto_234101 ?auto_234104 ) ) ( not ( = ?auto_234101 ?auto_234105 ) ) ( not ( = ?auto_234101 ?auto_234106 ) ) ( not ( = ?auto_234101 ?auto_234107 ) ) ( not ( = ?auto_234101 ?auto_234108 ) ) ( not ( = ?auto_234101 ?auto_234109 ) ) ( not ( = ?auto_234102 ?auto_234103 ) ) ( not ( = ?auto_234102 ?auto_234104 ) ) ( not ( = ?auto_234102 ?auto_234105 ) ) ( not ( = ?auto_234102 ?auto_234106 ) ) ( not ( = ?auto_234102 ?auto_234107 ) ) ( not ( = ?auto_234102 ?auto_234108 ) ) ( not ( = ?auto_234102 ?auto_234109 ) ) ( not ( = ?auto_234103 ?auto_234104 ) ) ( not ( = ?auto_234103 ?auto_234105 ) ) ( not ( = ?auto_234103 ?auto_234106 ) ) ( not ( = ?auto_234103 ?auto_234107 ) ) ( not ( = ?auto_234103 ?auto_234108 ) ) ( not ( = ?auto_234103 ?auto_234109 ) ) ( not ( = ?auto_234104 ?auto_234105 ) ) ( not ( = ?auto_234104 ?auto_234106 ) ) ( not ( = ?auto_234104 ?auto_234107 ) ) ( not ( = ?auto_234104 ?auto_234108 ) ) ( not ( = ?auto_234104 ?auto_234109 ) ) ( not ( = ?auto_234105 ?auto_234106 ) ) ( not ( = ?auto_234105 ?auto_234107 ) ) ( not ( = ?auto_234105 ?auto_234108 ) ) ( not ( = ?auto_234105 ?auto_234109 ) ) ( not ( = ?auto_234106 ?auto_234107 ) ) ( not ( = ?auto_234106 ?auto_234108 ) ) ( not ( = ?auto_234106 ?auto_234109 ) ) ( not ( = ?auto_234107 ?auto_234108 ) ) ( not ( = ?auto_234107 ?auto_234109 ) ) ( not ( = ?auto_234108 ?auto_234109 ) ) ( ON ?auto_234107 ?auto_234108 ) ( ON ?auto_234106 ?auto_234107 ) ( ON ?auto_234105 ?auto_234106 ) ( ON ?auto_234104 ?auto_234105 ) ( ON ?auto_234103 ?auto_234104 ) ( CLEAR ?auto_234101 ) ( ON ?auto_234102 ?auto_234103 ) ( CLEAR ?auto_234102 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_234101 ?auto_234102 )
      ( MAKE-8PILE ?auto_234101 ?auto_234102 ?auto_234103 ?auto_234104 ?auto_234105 ?auto_234106 ?auto_234107 ?auto_234108 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_234118 - BLOCK
      ?auto_234119 - BLOCK
      ?auto_234120 - BLOCK
      ?auto_234121 - BLOCK
      ?auto_234122 - BLOCK
      ?auto_234123 - BLOCK
      ?auto_234124 - BLOCK
      ?auto_234125 - BLOCK
    )
    :vars
    (
      ?auto_234126 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_234125 ?auto_234126 ) ( not ( = ?auto_234118 ?auto_234119 ) ) ( not ( = ?auto_234118 ?auto_234120 ) ) ( not ( = ?auto_234118 ?auto_234121 ) ) ( not ( = ?auto_234118 ?auto_234122 ) ) ( not ( = ?auto_234118 ?auto_234123 ) ) ( not ( = ?auto_234118 ?auto_234124 ) ) ( not ( = ?auto_234118 ?auto_234125 ) ) ( not ( = ?auto_234118 ?auto_234126 ) ) ( not ( = ?auto_234119 ?auto_234120 ) ) ( not ( = ?auto_234119 ?auto_234121 ) ) ( not ( = ?auto_234119 ?auto_234122 ) ) ( not ( = ?auto_234119 ?auto_234123 ) ) ( not ( = ?auto_234119 ?auto_234124 ) ) ( not ( = ?auto_234119 ?auto_234125 ) ) ( not ( = ?auto_234119 ?auto_234126 ) ) ( not ( = ?auto_234120 ?auto_234121 ) ) ( not ( = ?auto_234120 ?auto_234122 ) ) ( not ( = ?auto_234120 ?auto_234123 ) ) ( not ( = ?auto_234120 ?auto_234124 ) ) ( not ( = ?auto_234120 ?auto_234125 ) ) ( not ( = ?auto_234120 ?auto_234126 ) ) ( not ( = ?auto_234121 ?auto_234122 ) ) ( not ( = ?auto_234121 ?auto_234123 ) ) ( not ( = ?auto_234121 ?auto_234124 ) ) ( not ( = ?auto_234121 ?auto_234125 ) ) ( not ( = ?auto_234121 ?auto_234126 ) ) ( not ( = ?auto_234122 ?auto_234123 ) ) ( not ( = ?auto_234122 ?auto_234124 ) ) ( not ( = ?auto_234122 ?auto_234125 ) ) ( not ( = ?auto_234122 ?auto_234126 ) ) ( not ( = ?auto_234123 ?auto_234124 ) ) ( not ( = ?auto_234123 ?auto_234125 ) ) ( not ( = ?auto_234123 ?auto_234126 ) ) ( not ( = ?auto_234124 ?auto_234125 ) ) ( not ( = ?auto_234124 ?auto_234126 ) ) ( not ( = ?auto_234125 ?auto_234126 ) ) ( ON ?auto_234124 ?auto_234125 ) ( ON ?auto_234123 ?auto_234124 ) ( ON ?auto_234122 ?auto_234123 ) ( ON ?auto_234121 ?auto_234122 ) ( ON ?auto_234120 ?auto_234121 ) ( ON ?auto_234119 ?auto_234120 ) ( ON ?auto_234118 ?auto_234119 ) ( CLEAR ?auto_234118 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_234118 )
      ( MAKE-8PILE ?auto_234118 ?auto_234119 ?auto_234120 ?auto_234121 ?auto_234122 ?auto_234123 ?auto_234124 ?auto_234125 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_234135 - BLOCK
      ?auto_234136 - BLOCK
      ?auto_234137 - BLOCK
      ?auto_234138 - BLOCK
      ?auto_234139 - BLOCK
      ?auto_234140 - BLOCK
      ?auto_234141 - BLOCK
      ?auto_234142 - BLOCK
    )
    :vars
    (
      ?auto_234143 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_234142 ?auto_234143 ) ( not ( = ?auto_234135 ?auto_234136 ) ) ( not ( = ?auto_234135 ?auto_234137 ) ) ( not ( = ?auto_234135 ?auto_234138 ) ) ( not ( = ?auto_234135 ?auto_234139 ) ) ( not ( = ?auto_234135 ?auto_234140 ) ) ( not ( = ?auto_234135 ?auto_234141 ) ) ( not ( = ?auto_234135 ?auto_234142 ) ) ( not ( = ?auto_234135 ?auto_234143 ) ) ( not ( = ?auto_234136 ?auto_234137 ) ) ( not ( = ?auto_234136 ?auto_234138 ) ) ( not ( = ?auto_234136 ?auto_234139 ) ) ( not ( = ?auto_234136 ?auto_234140 ) ) ( not ( = ?auto_234136 ?auto_234141 ) ) ( not ( = ?auto_234136 ?auto_234142 ) ) ( not ( = ?auto_234136 ?auto_234143 ) ) ( not ( = ?auto_234137 ?auto_234138 ) ) ( not ( = ?auto_234137 ?auto_234139 ) ) ( not ( = ?auto_234137 ?auto_234140 ) ) ( not ( = ?auto_234137 ?auto_234141 ) ) ( not ( = ?auto_234137 ?auto_234142 ) ) ( not ( = ?auto_234137 ?auto_234143 ) ) ( not ( = ?auto_234138 ?auto_234139 ) ) ( not ( = ?auto_234138 ?auto_234140 ) ) ( not ( = ?auto_234138 ?auto_234141 ) ) ( not ( = ?auto_234138 ?auto_234142 ) ) ( not ( = ?auto_234138 ?auto_234143 ) ) ( not ( = ?auto_234139 ?auto_234140 ) ) ( not ( = ?auto_234139 ?auto_234141 ) ) ( not ( = ?auto_234139 ?auto_234142 ) ) ( not ( = ?auto_234139 ?auto_234143 ) ) ( not ( = ?auto_234140 ?auto_234141 ) ) ( not ( = ?auto_234140 ?auto_234142 ) ) ( not ( = ?auto_234140 ?auto_234143 ) ) ( not ( = ?auto_234141 ?auto_234142 ) ) ( not ( = ?auto_234141 ?auto_234143 ) ) ( not ( = ?auto_234142 ?auto_234143 ) ) ( ON ?auto_234141 ?auto_234142 ) ( ON ?auto_234140 ?auto_234141 ) ( ON ?auto_234139 ?auto_234140 ) ( ON ?auto_234138 ?auto_234139 ) ( ON ?auto_234137 ?auto_234138 ) ( ON ?auto_234136 ?auto_234137 ) ( ON ?auto_234135 ?auto_234136 ) ( CLEAR ?auto_234135 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_234135 )
      ( MAKE-8PILE ?auto_234135 ?auto_234136 ?auto_234137 ?auto_234138 ?auto_234139 ?auto_234140 ?auto_234141 ?auto_234142 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_234153 - BLOCK
      ?auto_234154 - BLOCK
      ?auto_234155 - BLOCK
      ?auto_234156 - BLOCK
      ?auto_234157 - BLOCK
      ?auto_234158 - BLOCK
      ?auto_234159 - BLOCK
      ?auto_234160 - BLOCK
      ?auto_234161 - BLOCK
    )
    :vars
    (
      ?auto_234162 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_234160 ) ( ON ?auto_234161 ?auto_234162 ) ( CLEAR ?auto_234161 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_234153 ) ( ON ?auto_234154 ?auto_234153 ) ( ON ?auto_234155 ?auto_234154 ) ( ON ?auto_234156 ?auto_234155 ) ( ON ?auto_234157 ?auto_234156 ) ( ON ?auto_234158 ?auto_234157 ) ( ON ?auto_234159 ?auto_234158 ) ( ON ?auto_234160 ?auto_234159 ) ( not ( = ?auto_234153 ?auto_234154 ) ) ( not ( = ?auto_234153 ?auto_234155 ) ) ( not ( = ?auto_234153 ?auto_234156 ) ) ( not ( = ?auto_234153 ?auto_234157 ) ) ( not ( = ?auto_234153 ?auto_234158 ) ) ( not ( = ?auto_234153 ?auto_234159 ) ) ( not ( = ?auto_234153 ?auto_234160 ) ) ( not ( = ?auto_234153 ?auto_234161 ) ) ( not ( = ?auto_234153 ?auto_234162 ) ) ( not ( = ?auto_234154 ?auto_234155 ) ) ( not ( = ?auto_234154 ?auto_234156 ) ) ( not ( = ?auto_234154 ?auto_234157 ) ) ( not ( = ?auto_234154 ?auto_234158 ) ) ( not ( = ?auto_234154 ?auto_234159 ) ) ( not ( = ?auto_234154 ?auto_234160 ) ) ( not ( = ?auto_234154 ?auto_234161 ) ) ( not ( = ?auto_234154 ?auto_234162 ) ) ( not ( = ?auto_234155 ?auto_234156 ) ) ( not ( = ?auto_234155 ?auto_234157 ) ) ( not ( = ?auto_234155 ?auto_234158 ) ) ( not ( = ?auto_234155 ?auto_234159 ) ) ( not ( = ?auto_234155 ?auto_234160 ) ) ( not ( = ?auto_234155 ?auto_234161 ) ) ( not ( = ?auto_234155 ?auto_234162 ) ) ( not ( = ?auto_234156 ?auto_234157 ) ) ( not ( = ?auto_234156 ?auto_234158 ) ) ( not ( = ?auto_234156 ?auto_234159 ) ) ( not ( = ?auto_234156 ?auto_234160 ) ) ( not ( = ?auto_234156 ?auto_234161 ) ) ( not ( = ?auto_234156 ?auto_234162 ) ) ( not ( = ?auto_234157 ?auto_234158 ) ) ( not ( = ?auto_234157 ?auto_234159 ) ) ( not ( = ?auto_234157 ?auto_234160 ) ) ( not ( = ?auto_234157 ?auto_234161 ) ) ( not ( = ?auto_234157 ?auto_234162 ) ) ( not ( = ?auto_234158 ?auto_234159 ) ) ( not ( = ?auto_234158 ?auto_234160 ) ) ( not ( = ?auto_234158 ?auto_234161 ) ) ( not ( = ?auto_234158 ?auto_234162 ) ) ( not ( = ?auto_234159 ?auto_234160 ) ) ( not ( = ?auto_234159 ?auto_234161 ) ) ( not ( = ?auto_234159 ?auto_234162 ) ) ( not ( = ?auto_234160 ?auto_234161 ) ) ( not ( = ?auto_234160 ?auto_234162 ) ) ( not ( = ?auto_234161 ?auto_234162 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_234161 ?auto_234162 )
      ( !STACK ?auto_234161 ?auto_234160 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_234172 - BLOCK
      ?auto_234173 - BLOCK
      ?auto_234174 - BLOCK
      ?auto_234175 - BLOCK
      ?auto_234176 - BLOCK
      ?auto_234177 - BLOCK
      ?auto_234178 - BLOCK
      ?auto_234179 - BLOCK
      ?auto_234180 - BLOCK
    )
    :vars
    (
      ?auto_234181 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_234179 ) ( ON ?auto_234180 ?auto_234181 ) ( CLEAR ?auto_234180 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_234172 ) ( ON ?auto_234173 ?auto_234172 ) ( ON ?auto_234174 ?auto_234173 ) ( ON ?auto_234175 ?auto_234174 ) ( ON ?auto_234176 ?auto_234175 ) ( ON ?auto_234177 ?auto_234176 ) ( ON ?auto_234178 ?auto_234177 ) ( ON ?auto_234179 ?auto_234178 ) ( not ( = ?auto_234172 ?auto_234173 ) ) ( not ( = ?auto_234172 ?auto_234174 ) ) ( not ( = ?auto_234172 ?auto_234175 ) ) ( not ( = ?auto_234172 ?auto_234176 ) ) ( not ( = ?auto_234172 ?auto_234177 ) ) ( not ( = ?auto_234172 ?auto_234178 ) ) ( not ( = ?auto_234172 ?auto_234179 ) ) ( not ( = ?auto_234172 ?auto_234180 ) ) ( not ( = ?auto_234172 ?auto_234181 ) ) ( not ( = ?auto_234173 ?auto_234174 ) ) ( not ( = ?auto_234173 ?auto_234175 ) ) ( not ( = ?auto_234173 ?auto_234176 ) ) ( not ( = ?auto_234173 ?auto_234177 ) ) ( not ( = ?auto_234173 ?auto_234178 ) ) ( not ( = ?auto_234173 ?auto_234179 ) ) ( not ( = ?auto_234173 ?auto_234180 ) ) ( not ( = ?auto_234173 ?auto_234181 ) ) ( not ( = ?auto_234174 ?auto_234175 ) ) ( not ( = ?auto_234174 ?auto_234176 ) ) ( not ( = ?auto_234174 ?auto_234177 ) ) ( not ( = ?auto_234174 ?auto_234178 ) ) ( not ( = ?auto_234174 ?auto_234179 ) ) ( not ( = ?auto_234174 ?auto_234180 ) ) ( not ( = ?auto_234174 ?auto_234181 ) ) ( not ( = ?auto_234175 ?auto_234176 ) ) ( not ( = ?auto_234175 ?auto_234177 ) ) ( not ( = ?auto_234175 ?auto_234178 ) ) ( not ( = ?auto_234175 ?auto_234179 ) ) ( not ( = ?auto_234175 ?auto_234180 ) ) ( not ( = ?auto_234175 ?auto_234181 ) ) ( not ( = ?auto_234176 ?auto_234177 ) ) ( not ( = ?auto_234176 ?auto_234178 ) ) ( not ( = ?auto_234176 ?auto_234179 ) ) ( not ( = ?auto_234176 ?auto_234180 ) ) ( not ( = ?auto_234176 ?auto_234181 ) ) ( not ( = ?auto_234177 ?auto_234178 ) ) ( not ( = ?auto_234177 ?auto_234179 ) ) ( not ( = ?auto_234177 ?auto_234180 ) ) ( not ( = ?auto_234177 ?auto_234181 ) ) ( not ( = ?auto_234178 ?auto_234179 ) ) ( not ( = ?auto_234178 ?auto_234180 ) ) ( not ( = ?auto_234178 ?auto_234181 ) ) ( not ( = ?auto_234179 ?auto_234180 ) ) ( not ( = ?auto_234179 ?auto_234181 ) ) ( not ( = ?auto_234180 ?auto_234181 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_234180 ?auto_234181 )
      ( !STACK ?auto_234180 ?auto_234179 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_234191 - BLOCK
      ?auto_234192 - BLOCK
      ?auto_234193 - BLOCK
      ?auto_234194 - BLOCK
      ?auto_234195 - BLOCK
      ?auto_234196 - BLOCK
      ?auto_234197 - BLOCK
      ?auto_234198 - BLOCK
      ?auto_234199 - BLOCK
    )
    :vars
    (
      ?auto_234200 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_234199 ?auto_234200 ) ( ON-TABLE ?auto_234191 ) ( ON ?auto_234192 ?auto_234191 ) ( ON ?auto_234193 ?auto_234192 ) ( ON ?auto_234194 ?auto_234193 ) ( ON ?auto_234195 ?auto_234194 ) ( ON ?auto_234196 ?auto_234195 ) ( ON ?auto_234197 ?auto_234196 ) ( not ( = ?auto_234191 ?auto_234192 ) ) ( not ( = ?auto_234191 ?auto_234193 ) ) ( not ( = ?auto_234191 ?auto_234194 ) ) ( not ( = ?auto_234191 ?auto_234195 ) ) ( not ( = ?auto_234191 ?auto_234196 ) ) ( not ( = ?auto_234191 ?auto_234197 ) ) ( not ( = ?auto_234191 ?auto_234198 ) ) ( not ( = ?auto_234191 ?auto_234199 ) ) ( not ( = ?auto_234191 ?auto_234200 ) ) ( not ( = ?auto_234192 ?auto_234193 ) ) ( not ( = ?auto_234192 ?auto_234194 ) ) ( not ( = ?auto_234192 ?auto_234195 ) ) ( not ( = ?auto_234192 ?auto_234196 ) ) ( not ( = ?auto_234192 ?auto_234197 ) ) ( not ( = ?auto_234192 ?auto_234198 ) ) ( not ( = ?auto_234192 ?auto_234199 ) ) ( not ( = ?auto_234192 ?auto_234200 ) ) ( not ( = ?auto_234193 ?auto_234194 ) ) ( not ( = ?auto_234193 ?auto_234195 ) ) ( not ( = ?auto_234193 ?auto_234196 ) ) ( not ( = ?auto_234193 ?auto_234197 ) ) ( not ( = ?auto_234193 ?auto_234198 ) ) ( not ( = ?auto_234193 ?auto_234199 ) ) ( not ( = ?auto_234193 ?auto_234200 ) ) ( not ( = ?auto_234194 ?auto_234195 ) ) ( not ( = ?auto_234194 ?auto_234196 ) ) ( not ( = ?auto_234194 ?auto_234197 ) ) ( not ( = ?auto_234194 ?auto_234198 ) ) ( not ( = ?auto_234194 ?auto_234199 ) ) ( not ( = ?auto_234194 ?auto_234200 ) ) ( not ( = ?auto_234195 ?auto_234196 ) ) ( not ( = ?auto_234195 ?auto_234197 ) ) ( not ( = ?auto_234195 ?auto_234198 ) ) ( not ( = ?auto_234195 ?auto_234199 ) ) ( not ( = ?auto_234195 ?auto_234200 ) ) ( not ( = ?auto_234196 ?auto_234197 ) ) ( not ( = ?auto_234196 ?auto_234198 ) ) ( not ( = ?auto_234196 ?auto_234199 ) ) ( not ( = ?auto_234196 ?auto_234200 ) ) ( not ( = ?auto_234197 ?auto_234198 ) ) ( not ( = ?auto_234197 ?auto_234199 ) ) ( not ( = ?auto_234197 ?auto_234200 ) ) ( not ( = ?auto_234198 ?auto_234199 ) ) ( not ( = ?auto_234198 ?auto_234200 ) ) ( not ( = ?auto_234199 ?auto_234200 ) ) ( CLEAR ?auto_234197 ) ( ON ?auto_234198 ?auto_234199 ) ( CLEAR ?auto_234198 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_234191 ?auto_234192 ?auto_234193 ?auto_234194 ?auto_234195 ?auto_234196 ?auto_234197 ?auto_234198 )
      ( MAKE-9PILE ?auto_234191 ?auto_234192 ?auto_234193 ?auto_234194 ?auto_234195 ?auto_234196 ?auto_234197 ?auto_234198 ?auto_234199 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_234210 - BLOCK
      ?auto_234211 - BLOCK
      ?auto_234212 - BLOCK
      ?auto_234213 - BLOCK
      ?auto_234214 - BLOCK
      ?auto_234215 - BLOCK
      ?auto_234216 - BLOCK
      ?auto_234217 - BLOCK
      ?auto_234218 - BLOCK
    )
    :vars
    (
      ?auto_234219 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_234218 ?auto_234219 ) ( ON-TABLE ?auto_234210 ) ( ON ?auto_234211 ?auto_234210 ) ( ON ?auto_234212 ?auto_234211 ) ( ON ?auto_234213 ?auto_234212 ) ( ON ?auto_234214 ?auto_234213 ) ( ON ?auto_234215 ?auto_234214 ) ( ON ?auto_234216 ?auto_234215 ) ( not ( = ?auto_234210 ?auto_234211 ) ) ( not ( = ?auto_234210 ?auto_234212 ) ) ( not ( = ?auto_234210 ?auto_234213 ) ) ( not ( = ?auto_234210 ?auto_234214 ) ) ( not ( = ?auto_234210 ?auto_234215 ) ) ( not ( = ?auto_234210 ?auto_234216 ) ) ( not ( = ?auto_234210 ?auto_234217 ) ) ( not ( = ?auto_234210 ?auto_234218 ) ) ( not ( = ?auto_234210 ?auto_234219 ) ) ( not ( = ?auto_234211 ?auto_234212 ) ) ( not ( = ?auto_234211 ?auto_234213 ) ) ( not ( = ?auto_234211 ?auto_234214 ) ) ( not ( = ?auto_234211 ?auto_234215 ) ) ( not ( = ?auto_234211 ?auto_234216 ) ) ( not ( = ?auto_234211 ?auto_234217 ) ) ( not ( = ?auto_234211 ?auto_234218 ) ) ( not ( = ?auto_234211 ?auto_234219 ) ) ( not ( = ?auto_234212 ?auto_234213 ) ) ( not ( = ?auto_234212 ?auto_234214 ) ) ( not ( = ?auto_234212 ?auto_234215 ) ) ( not ( = ?auto_234212 ?auto_234216 ) ) ( not ( = ?auto_234212 ?auto_234217 ) ) ( not ( = ?auto_234212 ?auto_234218 ) ) ( not ( = ?auto_234212 ?auto_234219 ) ) ( not ( = ?auto_234213 ?auto_234214 ) ) ( not ( = ?auto_234213 ?auto_234215 ) ) ( not ( = ?auto_234213 ?auto_234216 ) ) ( not ( = ?auto_234213 ?auto_234217 ) ) ( not ( = ?auto_234213 ?auto_234218 ) ) ( not ( = ?auto_234213 ?auto_234219 ) ) ( not ( = ?auto_234214 ?auto_234215 ) ) ( not ( = ?auto_234214 ?auto_234216 ) ) ( not ( = ?auto_234214 ?auto_234217 ) ) ( not ( = ?auto_234214 ?auto_234218 ) ) ( not ( = ?auto_234214 ?auto_234219 ) ) ( not ( = ?auto_234215 ?auto_234216 ) ) ( not ( = ?auto_234215 ?auto_234217 ) ) ( not ( = ?auto_234215 ?auto_234218 ) ) ( not ( = ?auto_234215 ?auto_234219 ) ) ( not ( = ?auto_234216 ?auto_234217 ) ) ( not ( = ?auto_234216 ?auto_234218 ) ) ( not ( = ?auto_234216 ?auto_234219 ) ) ( not ( = ?auto_234217 ?auto_234218 ) ) ( not ( = ?auto_234217 ?auto_234219 ) ) ( not ( = ?auto_234218 ?auto_234219 ) ) ( CLEAR ?auto_234216 ) ( ON ?auto_234217 ?auto_234218 ) ( CLEAR ?auto_234217 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_234210 ?auto_234211 ?auto_234212 ?auto_234213 ?auto_234214 ?auto_234215 ?auto_234216 ?auto_234217 )
      ( MAKE-9PILE ?auto_234210 ?auto_234211 ?auto_234212 ?auto_234213 ?auto_234214 ?auto_234215 ?auto_234216 ?auto_234217 ?auto_234218 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_234229 - BLOCK
      ?auto_234230 - BLOCK
      ?auto_234231 - BLOCK
      ?auto_234232 - BLOCK
      ?auto_234233 - BLOCK
      ?auto_234234 - BLOCK
      ?auto_234235 - BLOCK
      ?auto_234236 - BLOCK
      ?auto_234237 - BLOCK
    )
    :vars
    (
      ?auto_234238 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_234237 ?auto_234238 ) ( ON-TABLE ?auto_234229 ) ( ON ?auto_234230 ?auto_234229 ) ( ON ?auto_234231 ?auto_234230 ) ( ON ?auto_234232 ?auto_234231 ) ( ON ?auto_234233 ?auto_234232 ) ( ON ?auto_234234 ?auto_234233 ) ( not ( = ?auto_234229 ?auto_234230 ) ) ( not ( = ?auto_234229 ?auto_234231 ) ) ( not ( = ?auto_234229 ?auto_234232 ) ) ( not ( = ?auto_234229 ?auto_234233 ) ) ( not ( = ?auto_234229 ?auto_234234 ) ) ( not ( = ?auto_234229 ?auto_234235 ) ) ( not ( = ?auto_234229 ?auto_234236 ) ) ( not ( = ?auto_234229 ?auto_234237 ) ) ( not ( = ?auto_234229 ?auto_234238 ) ) ( not ( = ?auto_234230 ?auto_234231 ) ) ( not ( = ?auto_234230 ?auto_234232 ) ) ( not ( = ?auto_234230 ?auto_234233 ) ) ( not ( = ?auto_234230 ?auto_234234 ) ) ( not ( = ?auto_234230 ?auto_234235 ) ) ( not ( = ?auto_234230 ?auto_234236 ) ) ( not ( = ?auto_234230 ?auto_234237 ) ) ( not ( = ?auto_234230 ?auto_234238 ) ) ( not ( = ?auto_234231 ?auto_234232 ) ) ( not ( = ?auto_234231 ?auto_234233 ) ) ( not ( = ?auto_234231 ?auto_234234 ) ) ( not ( = ?auto_234231 ?auto_234235 ) ) ( not ( = ?auto_234231 ?auto_234236 ) ) ( not ( = ?auto_234231 ?auto_234237 ) ) ( not ( = ?auto_234231 ?auto_234238 ) ) ( not ( = ?auto_234232 ?auto_234233 ) ) ( not ( = ?auto_234232 ?auto_234234 ) ) ( not ( = ?auto_234232 ?auto_234235 ) ) ( not ( = ?auto_234232 ?auto_234236 ) ) ( not ( = ?auto_234232 ?auto_234237 ) ) ( not ( = ?auto_234232 ?auto_234238 ) ) ( not ( = ?auto_234233 ?auto_234234 ) ) ( not ( = ?auto_234233 ?auto_234235 ) ) ( not ( = ?auto_234233 ?auto_234236 ) ) ( not ( = ?auto_234233 ?auto_234237 ) ) ( not ( = ?auto_234233 ?auto_234238 ) ) ( not ( = ?auto_234234 ?auto_234235 ) ) ( not ( = ?auto_234234 ?auto_234236 ) ) ( not ( = ?auto_234234 ?auto_234237 ) ) ( not ( = ?auto_234234 ?auto_234238 ) ) ( not ( = ?auto_234235 ?auto_234236 ) ) ( not ( = ?auto_234235 ?auto_234237 ) ) ( not ( = ?auto_234235 ?auto_234238 ) ) ( not ( = ?auto_234236 ?auto_234237 ) ) ( not ( = ?auto_234236 ?auto_234238 ) ) ( not ( = ?auto_234237 ?auto_234238 ) ) ( ON ?auto_234236 ?auto_234237 ) ( CLEAR ?auto_234234 ) ( ON ?auto_234235 ?auto_234236 ) ( CLEAR ?auto_234235 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_234229 ?auto_234230 ?auto_234231 ?auto_234232 ?auto_234233 ?auto_234234 ?auto_234235 )
      ( MAKE-9PILE ?auto_234229 ?auto_234230 ?auto_234231 ?auto_234232 ?auto_234233 ?auto_234234 ?auto_234235 ?auto_234236 ?auto_234237 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_234248 - BLOCK
      ?auto_234249 - BLOCK
      ?auto_234250 - BLOCK
      ?auto_234251 - BLOCK
      ?auto_234252 - BLOCK
      ?auto_234253 - BLOCK
      ?auto_234254 - BLOCK
      ?auto_234255 - BLOCK
      ?auto_234256 - BLOCK
    )
    :vars
    (
      ?auto_234257 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_234256 ?auto_234257 ) ( ON-TABLE ?auto_234248 ) ( ON ?auto_234249 ?auto_234248 ) ( ON ?auto_234250 ?auto_234249 ) ( ON ?auto_234251 ?auto_234250 ) ( ON ?auto_234252 ?auto_234251 ) ( ON ?auto_234253 ?auto_234252 ) ( not ( = ?auto_234248 ?auto_234249 ) ) ( not ( = ?auto_234248 ?auto_234250 ) ) ( not ( = ?auto_234248 ?auto_234251 ) ) ( not ( = ?auto_234248 ?auto_234252 ) ) ( not ( = ?auto_234248 ?auto_234253 ) ) ( not ( = ?auto_234248 ?auto_234254 ) ) ( not ( = ?auto_234248 ?auto_234255 ) ) ( not ( = ?auto_234248 ?auto_234256 ) ) ( not ( = ?auto_234248 ?auto_234257 ) ) ( not ( = ?auto_234249 ?auto_234250 ) ) ( not ( = ?auto_234249 ?auto_234251 ) ) ( not ( = ?auto_234249 ?auto_234252 ) ) ( not ( = ?auto_234249 ?auto_234253 ) ) ( not ( = ?auto_234249 ?auto_234254 ) ) ( not ( = ?auto_234249 ?auto_234255 ) ) ( not ( = ?auto_234249 ?auto_234256 ) ) ( not ( = ?auto_234249 ?auto_234257 ) ) ( not ( = ?auto_234250 ?auto_234251 ) ) ( not ( = ?auto_234250 ?auto_234252 ) ) ( not ( = ?auto_234250 ?auto_234253 ) ) ( not ( = ?auto_234250 ?auto_234254 ) ) ( not ( = ?auto_234250 ?auto_234255 ) ) ( not ( = ?auto_234250 ?auto_234256 ) ) ( not ( = ?auto_234250 ?auto_234257 ) ) ( not ( = ?auto_234251 ?auto_234252 ) ) ( not ( = ?auto_234251 ?auto_234253 ) ) ( not ( = ?auto_234251 ?auto_234254 ) ) ( not ( = ?auto_234251 ?auto_234255 ) ) ( not ( = ?auto_234251 ?auto_234256 ) ) ( not ( = ?auto_234251 ?auto_234257 ) ) ( not ( = ?auto_234252 ?auto_234253 ) ) ( not ( = ?auto_234252 ?auto_234254 ) ) ( not ( = ?auto_234252 ?auto_234255 ) ) ( not ( = ?auto_234252 ?auto_234256 ) ) ( not ( = ?auto_234252 ?auto_234257 ) ) ( not ( = ?auto_234253 ?auto_234254 ) ) ( not ( = ?auto_234253 ?auto_234255 ) ) ( not ( = ?auto_234253 ?auto_234256 ) ) ( not ( = ?auto_234253 ?auto_234257 ) ) ( not ( = ?auto_234254 ?auto_234255 ) ) ( not ( = ?auto_234254 ?auto_234256 ) ) ( not ( = ?auto_234254 ?auto_234257 ) ) ( not ( = ?auto_234255 ?auto_234256 ) ) ( not ( = ?auto_234255 ?auto_234257 ) ) ( not ( = ?auto_234256 ?auto_234257 ) ) ( ON ?auto_234255 ?auto_234256 ) ( CLEAR ?auto_234253 ) ( ON ?auto_234254 ?auto_234255 ) ( CLEAR ?auto_234254 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_234248 ?auto_234249 ?auto_234250 ?auto_234251 ?auto_234252 ?auto_234253 ?auto_234254 )
      ( MAKE-9PILE ?auto_234248 ?auto_234249 ?auto_234250 ?auto_234251 ?auto_234252 ?auto_234253 ?auto_234254 ?auto_234255 ?auto_234256 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_234267 - BLOCK
      ?auto_234268 - BLOCK
      ?auto_234269 - BLOCK
      ?auto_234270 - BLOCK
      ?auto_234271 - BLOCK
      ?auto_234272 - BLOCK
      ?auto_234273 - BLOCK
      ?auto_234274 - BLOCK
      ?auto_234275 - BLOCK
    )
    :vars
    (
      ?auto_234276 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_234275 ?auto_234276 ) ( ON-TABLE ?auto_234267 ) ( ON ?auto_234268 ?auto_234267 ) ( ON ?auto_234269 ?auto_234268 ) ( ON ?auto_234270 ?auto_234269 ) ( ON ?auto_234271 ?auto_234270 ) ( not ( = ?auto_234267 ?auto_234268 ) ) ( not ( = ?auto_234267 ?auto_234269 ) ) ( not ( = ?auto_234267 ?auto_234270 ) ) ( not ( = ?auto_234267 ?auto_234271 ) ) ( not ( = ?auto_234267 ?auto_234272 ) ) ( not ( = ?auto_234267 ?auto_234273 ) ) ( not ( = ?auto_234267 ?auto_234274 ) ) ( not ( = ?auto_234267 ?auto_234275 ) ) ( not ( = ?auto_234267 ?auto_234276 ) ) ( not ( = ?auto_234268 ?auto_234269 ) ) ( not ( = ?auto_234268 ?auto_234270 ) ) ( not ( = ?auto_234268 ?auto_234271 ) ) ( not ( = ?auto_234268 ?auto_234272 ) ) ( not ( = ?auto_234268 ?auto_234273 ) ) ( not ( = ?auto_234268 ?auto_234274 ) ) ( not ( = ?auto_234268 ?auto_234275 ) ) ( not ( = ?auto_234268 ?auto_234276 ) ) ( not ( = ?auto_234269 ?auto_234270 ) ) ( not ( = ?auto_234269 ?auto_234271 ) ) ( not ( = ?auto_234269 ?auto_234272 ) ) ( not ( = ?auto_234269 ?auto_234273 ) ) ( not ( = ?auto_234269 ?auto_234274 ) ) ( not ( = ?auto_234269 ?auto_234275 ) ) ( not ( = ?auto_234269 ?auto_234276 ) ) ( not ( = ?auto_234270 ?auto_234271 ) ) ( not ( = ?auto_234270 ?auto_234272 ) ) ( not ( = ?auto_234270 ?auto_234273 ) ) ( not ( = ?auto_234270 ?auto_234274 ) ) ( not ( = ?auto_234270 ?auto_234275 ) ) ( not ( = ?auto_234270 ?auto_234276 ) ) ( not ( = ?auto_234271 ?auto_234272 ) ) ( not ( = ?auto_234271 ?auto_234273 ) ) ( not ( = ?auto_234271 ?auto_234274 ) ) ( not ( = ?auto_234271 ?auto_234275 ) ) ( not ( = ?auto_234271 ?auto_234276 ) ) ( not ( = ?auto_234272 ?auto_234273 ) ) ( not ( = ?auto_234272 ?auto_234274 ) ) ( not ( = ?auto_234272 ?auto_234275 ) ) ( not ( = ?auto_234272 ?auto_234276 ) ) ( not ( = ?auto_234273 ?auto_234274 ) ) ( not ( = ?auto_234273 ?auto_234275 ) ) ( not ( = ?auto_234273 ?auto_234276 ) ) ( not ( = ?auto_234274 ?auto_234275 ) ) ( not ( = ?auto_234274 ?auto_234276 ) ) ( not ( = ?auto_234275 ?auto_234276 ) ) ( ON ?auto_234274 ?auto_234275 ) ( ON ?auto_234273 ?auto_234274 ) ( CLEAR ?auto_234271 ) ( ON ?auto_234272 ?auto_234273 ) ( CLEAR ?auto_234272 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_234267 ?auto_234268 ?auto_234269 ?auto_234270 ?auto_234271 ?auto_234272 )
      ( MAKE-9PILE ?auto_234267 ?auto_234268 ?auto_234269 ?auto_234270 ?auto_234271 ?auto_234272 ?auto_234273 ?auto_234274 ?auto_234275 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_234286 - BLOCK
      ?auto_234287 - BLOCK
      ?auto_234288 - BLOCK
      ?auto_234289 - BLOCK
      ?auto_234290 - BLOCK
      ?auto_234291 - BLOCK
      ?auto_234292 - BLOCK
      ?auto_234293 - BLOCK
      ?auto_234294 - BLOCK
    )
    :vars
    (
      ?auto_234295 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_234294 ?auto_234295 ) ( ON-TABLE ?auto_234286 ) ( ON ?auto_234287 ?auto_234286 ) ( ON ?auto_234288 ?auto_234287 ) ( ON ?auto_234289 ?auto_234288 ) ( ON ?auto_234290 ?auto_234289 ) ( not ( = ?auto_234286 ?auto_234287 ) ) ( not ( = ?auto_234286 ?auto_234288 ) ) ( not ( = ?auto_234286 ?auto_234289 ) ) ( not ( = ?auto_234286 ?auto_234290 ) ) ( not ( = ?auto_234286 ?auto_234291 ) ) ( not ( = ?auto_234286 ?auto_234292 ) ) ( not ( = ?auto_234286 ?auto_234293 ) ) ( not ( = ?auto_234286 ?auto_234294 ) ) ( not ( = ?auto_234286 ?auto_234295 ) ) ( not ( = ?auto_234287 ?auto_234288 ) ) ( not ( = ?auto_234287 ?auto_234289 ) ) ( not ( = ?auto_234287 ?auto_234290 ) ) ( not ( = ?auto_234287 ?auto_234291 ) ) ( not ( = ?auto_234287 ?auto_234292 ) ) ( not ( = ?auto_234287 ?auto_234293 ) ) ( not ( = ?auto_234287 ?auto_234294 ) ) ( not ( = ?auto_234287 ?auto_234295 ) ) ( not ( = ?auto_234288 ?auto_234289 ) ) ( not ( = ?auto_234288 ?auto_234290 ) ) ( not ( = ?auto_234288 ?auto_234291 ) ) ( not ( = ?auto_234288 ?auto_234292 ) ) ( not ( = ?auto_234288 ?auto_234293 ) ) ( not ( = ?auto_234288 ?auto_234294 ) ) ( not ( = ?auto_234288 ?auto_234295 ) ) ( not ( = ?auto_234289 ?auto_234290 ) ) ( not ( = ?auto_234289 ?auto_234291 ) ) ( not ( = ?auto_234289 ?auto_234292 ) ) ( not ( = ?auto_234289 ?auto_234293 ) ) ( not ( = ?auto_234289 ?auto_234294 ) ) ( not ( = ?auto_234289 ?auto_234295 ) ) ( not ( = ?auto_234290 ?auto_234291 ) ) ( not ( = ?auto_234290 ?auto_234292 ) ) ( not ( = ?auto_234290 ?auto_234293 ) ) ( not ( = ?auto_234290 ?auto_234294 ) ) ( not ( = ?auto_234290 ?auto_234295 ) ) ( not ( = ?auto_234291 ?auto_234292 ) ) ( not ( = ?auto_234291 ?auto_234293 ) ) ( not ( = ?auto_234291 ?auto_234294 ) ) ( not ( = ?auto_234291 ?auto_234295 ) ) ( not ( = ?auto_234292 ?auto_234293 ) ) ( not ( = ?auto_234292 ?auto_234294 ) ) ( not ( = ?auto_234292 ?auto_234295 ) ) ( not ( = ?auto_234293 ?auto_234294 ) ) ( not ( = ?auto_234293 ?auto_234295 ) ) ( not ( = ?auto_234294 ?auto_234295 ) ) ( ON ?auto_234293 ?auto_234294 ) ( ON ?auto_234292 ?auto_234293 ) ( CLEAR ?auto_234290 ) ( ON ?auto_234291 ?auto_234292 ) ( CLEAR ?auto_234291 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_234286 ?auto_234287 ?auto_234288 ?auto_234289 ?auto_234290 ?auto_234291 )
      ( MAKE-9PILE ?auto_234286 ?auto_234287 ?auto_234288 ?auto_234289 ?auto_234290 ?auto_234291 ?auto_234292 ?auto_234293 ?auto_234294 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_234305 - BLOCK
      ?auto_234306 - BLOCK
      ?auto_234307 - BLOCK
      ?auto_234308 - BLOCK
      ?auto_234309 - BLOCK
      ?auto_234310 - BLOCK
      ?auto_234311 - BLOCK
      ?auto_234312 - BLOCK
      ?auto_234313 - BLOCK
    )
    :vars
    (
      ?auto_234314 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_234313 ?auto_234314 ) ( ON-TABLE ?auto_234305 ) ( ON ?auto_234306 ?auto_234305 ) ( ON ?auto_234307 ?auto_234306 ) ( ON ?auto_234308 ?auto_234307 ) ( not ( = ?auto_234305 ?auto_234306 ) ) ( not ( = ?auto_234305 ?auto_234307 ) ) ( not ( = ?auto_234305 ?auto_234308 ) ) ( not ( = ?auto_234305 ?auto_234309 ) ) ( not ( = ?auto_234305 ?auto_234310 ) ) ( not ( = ?auto_234305 ?auto_234311 ) ) ( not ( = ?auto_234305 ?auto_234312 ) ) ( not ( = ?auto_234305 ?auto_234313 ) ) ( not ( = ?auto_234305 ?auto_234314 ) ) ( not ( = ?auto_234306 ?auto_234307 ) ) ( not ( = ?auto_234306 ?auto_234308 ) ) ( not ( = ?auto_234306 ?auto_234309 ) ) ( not ( = ?auto_234306 ?auto_234310 ) ) ( not ( = ?auto_234306 ?auto_234311 ) ) ( not ( = ?auto_234306 ?auto_234312 ) ) ( not ( = ?auto_234306 ?auto_234313 ) ) ( not ( = ?auto_234306 ?auto_234314 ) ) ( not ( = ?auto_234307 ?auto_234308 ) ) ( not ( = ?auto_234307 ?auto_234309 ) ) ( not ( = ?auto_234307 ?auto_234310 ) ) ( not ( = ?auto_234307 ?auto_234311 ) ) ( not ( = ?auto_234307 ?auto_234312 ) ) ( not ( = ?auto_234307 ?auto_234313 ) ) ( not ( = ?auto_234307 ?auto_234314 ) ) ( not ( = ?auto_234308 ?auto_234309 ) ) ( not ( = ?auto_234308 ?auto_234310 ) ) ( not ( = ?auto_234308 ?auto_234311 ) ) ( not ( = ?auto_234308 ?auto_234312 ) ) ( not ( = ?auto_234308 ?auto_234313 ) ) ( not ( = ?auto_234308 ?auto_234314 ) ) ( not ( = ?auto_234309 ?auto_234310 ) ) ( not ( = ?auto_234309 ?auto_234311 ) ) ( not ( = ?auto_234309 ?auto_234312 ) ) ( not ( = ?auto_234309 ?auto_234313 ) ) ( not ( = ?auto_234309 ?auto_234314 ) ) ( not ( = ?auto_234310 ?auto_234311 ) ) ( not ( = ?auto_234310 ?auto_234312 ) ) ( not ( = ?auto_234310 ?auto_234313 ) ) ( not ( = ?auto_234310 ?auto_234314 ) ) ( not ( = ?auto_234311 ?auto_234312 ) ) ( not ( = ?auto_234311 ?auto_234313 ) ) ( not ( = ?auto_234311 ?auto_234314 ) ) ( not ( = ?auto_234312 ?auto_234313 ) ) ( not ( = ?auto_234312 ?auto_234314 ) ) ( not ( = ?auto_234313 ?auto_234314 ) ) ( ON ?auto_234312 ?auto_234313 ) ( ON ?auto_234311 ?auto_234312 ) ( ON ?auto_234310 ?auto_234311 ) ( CLEAR ?auto_234308 ) ( ON ?auto_234309 ?auto_234310 ) ( CLEAR ?auto_234309 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_234305 ?auto_234306 ?auto_234307 ?auto_234308 ?auto_234309 )
      ( MAKE-9PILE ?auto_234305 ?auto_234306 ?auto_234307 ?auto_234308 ?auto_234309 ?auto_234310 ?auto_234311 ?auto_234312 ?auto_234313 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_234324 - BLOCK
      ?auto_234325 - BLOCK
      ?auto_234326 - BLOCK
      ?auto_234327 - BLOCK
      ?auto_234328 - BLOCK
      ?auto_234329 - BLOCK
      ?auto_234330 - BLOCK
      ?auto_234331 - BLOCK
      ?auto_234332 - BLOCK
    )
    :vars
    (
      ?auto_234333 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_234332 ?auto_234333 ) ( ON-TABLE ?auto_234324 ) ( ON ?auto_234325 ?auto_234324 ) ( ON ?auto_234326 ?auto_234325 ) ( ON ?auto_234327 ?auto_234326 ) ( not ( = ?auto_234324 ?auto_234325 ) ) ( not ( = ?auto_234324 ?auto_234326 ) ) ( not ( = ?auto_234324 ?auto_234327 ) ) ( not ( = ?auto_234324 ?auto_234328 ) ) ( not ( = ?auto_234324 ?auto_234329 ) ) ( not ( = ?auto_234324 ?auto_234330 ) ) ( not ( = ?auto_234324 ?auto_234331 ) ) ( not ( = ?auto_234324 ?auto_234332 ) ) ( not ( = ?auto_234324 ?auto_234333 ) ) ( not ( = ?auto_234325 ?auto_234326 ) ) ( not ( = ?auto_234325 ?auto_234327 ) ) ( not ( = ?auto_234325 ?auto_234328 ) ) ( not ( = ?auto_234325 ?auto_234329 ) ) ( not ( = ?auto_234325 ?auto_234330 ) ) ( not ( = ?auto_234325 ?auto_234331 ) ) ( not ( = ?auto_234325 ?auto_234332 ) ) ( not ( = ?auto_234325 ?auto_234333 ) ) ( not ( = ?auto_234326 ?auto_234327 ) ) ( not ( = ?auto_234326 ?auto_234328 ) ) ( not ( = ?auto_234326 ?auto_234329 ) ) ( not ( = ?auto_234326 ?auto_234330 ) ) ( not ( = ?auto_234326 ?auto_234331 ) ) ( not ( = ?auto_234326 ?auto_234332 ) ) ( not ( = ?auto_234326 ?auto_234333 ) ) ( not ( = ?auto_234327 ?auto_234328 ) ) ( not ( = ?auto_234327 ?auto_234329 ) ) ( not ( = ?auto_234327 ?auto_234330 ) ) ( not ( = ?auto_234327 ?auto_234331 ) ) ( not ( = ?auto_234327 ?auto_234332 ) ) ( not ( = ?auto_234327 ?auto_234333 ) ) ( not ( = ?auto_234328 ?auto_234329 ) ) ( not ( = ?auto_234328 ?auto_234330 ) ) ( not ( = ?auto_234328 ?auto_234331 ) ) ( not ( = ?auto_234328 ?auto_234332 ) ) ( not ( = ?auto_234328 ?auto_234333 ) ) ( not ( = ?auto_234329 ?auto_234330 ) ) ( not ( = ?auto_234329 ?auto_234331 ) ) ( not ( = ?auto_234329 ?auto_234332 ) ) ( not ( = ?auto_234329 ?auto_234333 ) ) ( not ( = ?auto_234330 ?auto_234331 ) ) ( not ( = ?auto_234330 ?auto_234332 ) ) ( not ( = ?auto_234330 ?auto_234333 ) ) ( not ( = ?auto_234331 ?auto_234332 ) ) ( not ( = ?auto_234331 ?auto_234333 ) ) ( not ( = ?auto_234332 ?auto_234333 ) ) ( ON ?auto_234331 ?auto_234332 ) ( ON ?auto_234330 ?auto_234331 ) ( ON ?auto_234329 ?auto_234330 ) ( CLEAR ?auto_234327 ) ( ON ?auto_234328 ?auto_234329 ) ( CLEAR ?auto_234328 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_234324 ?auto_234325 ?auto_234326 ?auto_234327 ?auto_234328 )
      ( MAKE-9PILE ?auto_234324 ?auto_234325 ?auto_234326 ?auto_234327 ?auto_234328 ?auto_234329 ?auto_234330 ?auto_234331 ?auto_234332 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_234343 - BLOCK
      ?auto_234344 - BLOCK
      ?auto_234345 - BLOCK
      ?auto_234346 - BLOCK
      ?auto_234347 - BLOCK
      ?auto_234348 - BLOCK
      ?auto_234349 - BLOCK
      ?auto_234350 - BLOCK
      ?auto_234351 - BLOCK
    )
    :vars
    (
      ?auto_234352 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_234351 ?auto_234352 ) ( ON-TABLE ?auto_234343 ) ( ON ?auto_234344 ?auto_234343 ) ( ON ?auto_234345 ?auto_234344 ) ( not ( = ?auto_234343 ?auto_234344 ) ) ( not ( = ?auto_234343 ?auto_234345 ) ) ( not ( = ?auto_234343 ?auto_234346 ) ) ( not ( = ?auto_234343 ?auto_234347 ) ) ( not ( = ?auto_234343 ?auto_234348 ) ) ( not ( = ?auto_234343 ?auto_234349 ) ) ( not ( = ?auto_234343 ?auto_234350 ) ) ( not ( = ?auto_234343 ?auto_234351 ) ) ( not ( = ?auto_234343 ?auto_234352 ) ) ( not ( = ?auto_234344 ?auto_234345 ) ) ( not ( = ?auto_234344 ?auto_234346 ) ) ( not ( = ?auto_234344 ?auto_234347 ) ) ( not ( = ?auto_234344 ?auto_234348 ) ) ( not ( = ?auto_234344 ?auto_234349 ) ) ( not ( = ?auto_234344 ?auto_234350 ) ) ( not ( = ?auto_234344 ?auto_234351 ) ) ( not ( = ?auto_234344 ?auto_234352 ) ) ( not ( = ?auto_234345 ?auto_234346 ) ) ( not ( = ?auto_234345 ?auto_234347 ) ) ( not ( = ?auto_234345 ?auto_234348 ) ) ( not ( = ?auto_234345 ?auto_234349 ) ) ( not ( = ?auto_234345 ?auto_234350 ) ) ( not ( = ?auto_234345 ?auto_234351 ) ) ( not ( = ?auto_234345 ?auto_234352 ) ) ( not ( = ?auto_234346 ?auto_234347 ) ) ( not ( = ?auto_234346 ?auto_234348 ) ) ( not ( = ?auto_234346 ?auto_234349 ) ) ( not ( = ?auto_234346 ?auto_234350 ) ) ( not ( = ?auto_234346 ?auto_234351 ) ) ( not ( = ?auto_234346 ?auto_234352 ) ) ( not ( = ?auto_234347 ?auto_234348 ) ) ( not ( = ?auto_234347 ?auto_234349 ) ) ( not ( = ?auto_234347 ?auto_234350 ) ) ( not ( = ?auto_234347 ?auto_234351 ) ) ( not ( = ?auto_234347 ?auto_234352 ) ) ( not ( = ?auto_234348 ?auto_234349 ) ) ( not ( = ?auto_234348 ?auto_234350 ) ) ( not ( = ?auto_234348 ?auto_234351 ) ) ( not ( = ?auto_234348 ?auto_234352 ) ) ( not ( = ?auto_234349 ?auto_234350 ) ) ( not ( = ?auto_234349 ?auto_234351 ) ) ( not ( = ?auto_234349 ?auto_234352 ) ) ( not ( = ?auto_234350 ?auto_234351 ) ) ( not ( = ?auto_234350 ?auto_234352 ) ) ( not ( = ?auto_234351 ?auto_234352 ) ) ( ON ?auto_234350 ?auto_234351 ) ( ON ?auto_234349 ?auto_234350 ) ( ON ?auto_234348 ?auto_234349 ) ( ON ?auto_234347 ?auto_234348 ) ( CLEAR ?auto_234345 ) ( ON ?auto_234346 ?auto_234347 ) ( CLEAR ?auto_234346 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_234343 ?auto_234344 ?auto_234345 ?auto_234346 )
      ( MAKE-9PILE ?auto_234343 ?auto_234344 ?auto_234345 ?auto_234346 ?auto_234347 ?auto_234348 ?auto_234349 ?auto_234350 ?auto_234351 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_234362 - BLOCK
      ?auto_234363 - BLOCK
      ?auto_234364 - BLOCK
      ?auto_234365 - BLOCK
      ?auto_234366 - BLOCK
      ?auto_234367 - BLOCK
      ?auto_234368 - BLOCK
      ?auto_234369 - BLOCK
      ?auto_234370 - BLOCK
    )
    :vars
    (
      ?auto_234371 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_234370 ?auto_234371 ) ( ON-TABLE ?auto_234362 ) ( ON ?auto_234363 ?auto_234362 ) ( ON ?auto_234364 ?auto_234363 ) ( not ( = ?auto_234362 ?auto_234363 ) ) ( not ( = ?auto_234362 ?auto_234364 ) ) ( not ( = ?auto_234362 ?auto_234365 ) ) ( not ( = ?auto_234362 ?auto_234366 ) ) ( not ( = ?auto_234362 ?auto_234367 ) ) ( not ( = ?auto_234362 ?auto_234368 ) ) ( not ( = ?auto_234362 ?auto_234369 ) ) ( not ( = ?auto_234362 ?auto_234370 ) ) ( not ( = ?auto_234362 ?auto_234371 ) ) ( not ( = ?auto_234363 ?auto_234364 ) ) ( not ( = ?auto_234363 ?auto_234365 ) ) ( not ( = ?auto_234363 ?auto_234366 ) ) ( not ( = ?auto_234363 ?auto_234367 ) ) ( not ( = ?auto_234363 ?auto_234368 ) ) ( not ( = ?auto_234363 ?auto_234369 ) ) ( not ( = ?auto_234363 ?auto_234370 ) ) ( not ( = ?auto_234363 ?auto_234371 ) ) ( not ( = ?auto_234364 ?auto_234365 ) ) ( not ( = ?auto_234364 ?auto_234366 ) ) ( not ( = ?auto_234364 ?auto_234367 ) ) ( not ( = ?auto_234364 ?auto_234368 ) ) ( not ( = ?auto_234364 ?auto_234369 ) ) ( not ( = ?auto_234364 ?auto_234370 ) ) ( not ( = ?auto_234364 ?auto_234371 ) ) ( not ( = ?auto_234365 ?auto_234366 ) ) ( not ( = ?auto_234365 ?auto_234367 ) ) ( not ( = ?auto_234365 ?auto_234368 ) ) ( not ( = ?auto_234365 ?auto_234369 ) ) ( not ( = ?auto_234365 ?auto_234370 ) ) ( not ( = ?auto_234365 ?auto_234371 ) ) ( not ( = ?auto_234366 ?auto_234367 ) ) ( not ( = ?auto_234366 ?auto_234368 ) ) ( not ( = ?auto_234366 ?auto_234369 ) ) ( not ( = ?auto_234366 ?auto_234370 ) ) ( not ( = ?auto_234366 ?auto_234371 ) ) ( not ( = ?auto_234367 ?auto_234368 ) ) ( not ( = ?auto_234367 ?auto_234369 ) ) ( not ( = ?auto_234367 ?auto_234370 ) ) ( not ( = ?auto_234367 ?auto_234371 ) ) ( not ( = ?auto_234368 ?auto_234369 ) ) ( not ( = ?auto_234368 ?auto_234370 ) ) ( not ( = ?auto_234368 ?auto_234371 ) ) ( not ( = ?auto_234369 ?auto_234370 ) ) ( not ( = ?auto_234369 ?auto_234371 ) ) ( not ( = ?auto_234370 ?auto_234371 ) ) ( ON ?auto_234369 ?auto_234370 ) ( ON ?auto_234368 ?auto_234369 ) ( ON ?auto_234367 ?auto_234368 ) ( ON ?auto_234366 ?auto_234367 ) ( CLEAR ?auto_234364 ) ( ON ?auto_234365 ?auto_234366 ) ( CLEAR ?auto_234365 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_234362 ?auto_234363 ?auto_234364 ?auto_234365 )
      ( MAKE-9PILE ?auto_234362 ?auto_234363 ?auto_234364 ?auto_234365 ?auto_234366 ?auto_234367 ?auto_234368 ?auto_234369 ?auto_234370 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_234381 - BLOCK
      ?auto_234382 - BLOCK
      ?auto_234383 - BLOCK
      ?auto_234384 - BLOCK
      ?auto_234385 - BLOCK
      ?auto_234386 - BLOCK
      ?auto_234387 - BLOCK
      ?auto_234388 - BLOCK
      ?auto_234389 - BLOCK
    )
    :vars
    (
      ?auto_234390 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_234389 ?auto_234390 ) ( ON-TABLE ?auto_234381 ) ( ON ?auto_234382 ?auto_234381 ) ( not ( = ?auto_234381 ?auto_234382 ) ) ( not ( = ?auto_234381 ?auto_234383 ) ) ( not ( = ?auto_234381 ?auto_234384 ) ) ( not ( = ?auto_234381 ?auto_234385 ) ) ( not ( = ?auto_234381 ?auto_234386 ) ) ( not ( = ?auto_234381 ?auto_234387 ) ) ( not ( = ?auto_234381 ?auto_234388 ) ) ( not ( = ?auto_234381 ?auto_234389 ) ) ( not ( = ?auto_234381 ?auto_234390 ) ) ( not ( = ?auto_234382 ?auto_234383 ) ) ( not ( = ?auto_234382 ?auto_234384 ) ) ( not ( = ?auto_234382 ?auto_234385 ) ) ( not ( = ?auto_234382 ?auto_234386 ) ) ( not ( = ?auto_234382 ?auto_234387 ) ) ( not ( = ?auto_234382 ?auto_234388 ) ) ( not ( = ?auto_234382 ?auto_234389 ) ) ( not ( = ?auto_234382 ?auto_234390 ) ) ( not ( = ?auto_234383 ?auto_234384 ) ) ( not ( = ?auto_234383 ?auto_234385 ) ) ( not ( = ?auto_234383 ?auto_234386 ) ) ( not ( = ?auto_234383 ?auto_234387 ) ) ( not ( = ?auto_234383 ?auto_234388 ) ) ( not ( = ?auto_234383 ?auto_234389 ) ) ( not ( = ?auto_234383 ?auto_234390 ) ) ( not ( = ?auto_234384 ?auto_234385 ) ) ( not ( = ?auto_234384 ?auto_234386 ) ) ( not ( = ?auto_234384 ?auto_234387 ) ) ( not ( = ?auto_234384 ?auto_234388 ) ) ( not ( = ?auto_234384 ?auto_234389 ) ) ( not ( = ?auto_234384 ?auto_234390 ) ) ( not ( = ?auto_234385 ?auto_234386 ) ) ( not ( = ?auto_234385 ?auto_234387 ) ) ( not ( = ?auto_234385 ?auto_234388 ) ) ( not ( = ?auto_234385 ?auto_234389 ) ) ( not ( = ?auto_234385 ?auto_234390 ) ) ( not ( = ?auto_234386 ?auto_234387 ) ) ( not ( = ?auto_234386 ?auto_234388 ) ) ( not ( = ?auto_234386 ?auto_234389 ) ) ( not ( = ?auto_234386 ?auto_234390 ) ) ( not ( = ?auto_234387 ?auto_234388 ) ) ( not ( = ?auto_234387 ?auto_234389 ) ) ( not ( = ?auto_234387 ?auto_234390 ) ) ( not ( = ?auto_234388 ?auto_234389 ) ) ( not ( = ?auto_234388 ?auto_234390 ) ) ( not ( = ?auto_234389 ?auto_234390 ) ) ( ON ?auto_234388 ?auto_234389 ) ( ON ?auto_234387 ?auto_234388 ) ( ON ?auto_234386 ?auto_234387 ) ( ON ?auto_234385 ?auto_234386 ) ( ON ?auto_234384 ?auto_234385 ) ( CLEAR ?auto_234382 ) ( ON ?auto_234383 ?auto_234384 ) ( CLEAR ?auto_234383 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_234381 ?auto_234382 ?auto_234383 )
      ( MAKE-9PILE ?auto_234381 ?auto_234382 ?auto_234383 ?auto_234384 ?auto_234385 ?auto_234386 ?auto_234387 ?auto_234388 ?auto_234389 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_234400 - BLOCK
      ?auto_234401 - BLOCK
      ?auto_234402 - BLOCK
      ?auto_234403 - BLOCK
      ?auto_234404 - BLOCK
      ?auto_234405 - BLOCK
      ?auto_234406 - BLOCK
      ?auto_234407 - BLOCK
      ?auto_234408 - BLOCK
    )
    :vars
    (
      ?auto_234409 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_234408 ?auto_234409 ) ( ON-TABLE ?auto_234400 ) ( ON ?auto_234401 ?auto_234400 ) ( not ( = ?auto_234400 ?auto_234401 ) ) ( not ( = ?auto_234400 ?auto_234402 ) ) ( not ( = ?auto_234400 ?auto_234403 ) ) ( not ( = ?auto_234400 ?auto_234404 ) ) ( not ( = ?auto_234400 ?auto_234405 ) ) ( not ( = ?auto_234400 ?auto_234406 ) ) ( not ( = ?auto_234400 ?auto_234407 ) ) ( not ( = ?auto_234400 ?auto_234408 ) ) ( not ( = ?auto_234400 ?auto_234409 ) ) ( not ( = ?auto_234401 ?auto_234402 ) ) ( not ( = ?auto_234401 ?auto_234403 ) ) ( not ( = ?auto_234401 ?auto_234404 ) ) ( not ( = ?auto_234401 ?auto_234405 ) ) ( not ( = ?auto_234401 ?auto_234406 ) ) ( not ( = ?auto_234401 ?auto_234407 ) ) ( not ( = ?auto_234401 ?auto_234408 ) ) ( not ( = ?auto_234401 ?auto_234409 ) ) ( not ( = ?auto_234402 ?auto_234403 ) ) ( not ( = ?auto_234402 ?auto_234404 ) ) ( not ( = ?auto_234402 ?auto_234405 ) ) ( not ( = ?auto_234402 ?auto_234406 ) ) ( not ( = ?auto_234402 ?auto_234407 ) ) ( not ( = ?auto_234402 ?auto_234408 ) ) ( not ( = ?auto_234402 ?auto_234409 ) ) ( not ( = ?auto_234403 ?auto_234404 ) ) ( not ( = ?auto_234403 ?auto_234405 ) ) ( not ( = ?auto_234403 ?auto_234406 ) ) ( not ( = ?auto_234403 ?auto_234407 ) ) ( not ( = ?auto_234403 ?auto_234408 ) ) ( not ( = ?auto_234403 ?auto_234409 ) ) ( not ( = ?auto_234404 ?auto_234405 ) ) ( not ( = ?auto_234404 ?auto_234406 ) ) ( not ( = ?auto_234404 ?auto_234407 ) ) ( not ( = ?auto_234404 ?auto_234408 ) ) ( not ( = ?auto_234404 ?auto_234409 ) ) ( not ( = ?auto_234405 ?auto_234406 ) ) ( not ( = ?auto_234405 ?auto_234407 ) ) ( not ( = ?auto_234405 ?auto_234408 ) ) ( not ( = ?auto_234405 ?auto_234409 ) ) ( not ( = ?auto_234406 ?auto_234407 ) ) ( not ( = ?auto_234406 ?auto_234408 ) ) ( not ( = ?auto_234406 ?auto_234409 ) ) ( not ( = ?auto_234407 ?auto_234408 ) ) ( not ( = ?auto_234407 ?auto_234409 ) ) ( not ( = ?auto_234408 ?auto_234409 ) ) ( ON ?auto_234407 ?auto_234408 ) ( ON ?auto_234406 ?auto_234407 ) ( ON ?auto_234405 ?auto_234406 ) ( ON ?auto_234404 ?auto_234405 ) ( ON ?auto_234403 ?auto_234404 ) ( CLEAR ?auto_234401 ) ( ON ?auto_234402 ?auto_234403 ) ( CLEAR ?auto_234402 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_234400 ?auto_234401 ?auto_234402 )
      ( MAKE-9PILE ?auto_234400 ?auto_234401 ?auto_234402 ?auto_234403 ?auto_234404 ?auto_234405 ?auto_234406 ?auto_234407 ?auto_234408 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_234419 - BLOCK
      ?auto_234420 - BLOCK
      ?auto_234421 - BLOCK
      ?auto_234422 - BLOCK
      ?auto_234423 - BLOCK
      ?auto_234424 - BLOCK
      ?auto_234425 - BLOCK
      ?auto_234426 - BLOCK
      ?auto_234427 - BLOCK
    )
    :vars
    (
      ?auto_234428 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_234427 ?auto_234428 ) ( ON-TABLE ?auto_234419 ) ( not ( = ?auto_234419 ?auto_234420 ) ) ( not ( = ?auto_234419 ?auto_234421 ) ) ( not ( = ?auto_234419 ?auto_234422 ) ) ( not ( = ?auto_234419 ?auto_234423 ) ) ( not ( = ?auto_234419 ?auto_234424 ) ) ( not ( = ?auto_234419 ?auto_234425 ) ) ( not ( = ?auto_234419 ?auto_234426 ) ) ( not ( = ?auto_234419 ?auto_234427 ) ) ( not ( = ?auto_234419 ?auto_234428 ) ) ( not ( = ?auto_234420 ?auto_234421 ) ) ( not ( = ?auto_234420 ?auto_234422 ) ) ( not ( = ?auto_234420 ?auto_234423 ) ) ( not ( = ?auto_234420 ?auto_234424 ) ) ( not ( = ?auto_234420 ?auto_234425 ) ) ( not ( = ?auto_234420 ?auto_234426 ) ) ( not ( = ?auto_234420 ?auto_234427 ) ) ( not ( = ?auto_234420 ?auto_234428 ) ) ( not ( = ?auto_234421 ?auto_234422 ) ) ( not ( = ?auto_234421 ?auto_234423 ) ) ( not ( = ?auto_234421 ?auto_234424 ) ) ( not ( = ?auto_234421 ?auto_234425 ) ) ( not ( = ?auto_234421 ?auto_234426 ) ) ( not ( = ?auto_234421 ?auto_234427 ) ) ( not ( = ?auto_234421 ?auto_234428 ) ) ( not ( = ?auto_234422 ?auto_234423 ) ) ( not ( = ?auto_234422 ?auto_234424 ) ) ( not ( = ?auto_234422 ?auto_234425 ) ) ( not ( = ?auto_234422 ?auto_234426 ) ) ( not ( = ?auto_234422 ?auto_234427 ) ) ( not ( = ?auto_234422 ?auto_234428 ) ) ( not ( = ?auto_234423 ?auto_234424 ) ) ( not ( = ?auto_234423 ?auto_234425 ) ) ( not ( = ?auto_234423 ?auto_234426 ) ) ( not ( = ?auto_234423 ?auto_234427 ) ) ( not ( = ?auto_234423 ?auto_234428 ) ) ( not ( = ?auto_234424 ?auto_234425 ) ) ( not ( = ?auto_234424 ?auto_234426 ) ) ( not ( = ?auto_234424 ?auto_234427 ) ) ( not ( = ?auto_234424 ?auto_234428 ) ) ( not ( = ?auto_234425 ?auto_234426 ) ) ( not ( = ?auto_234425 ?auto_234427 ) ) ( not ( = ?auto_234425 ?auto_234428 ) ) ( not ( = ?auto_234426 ?auto_234427 ) ) ( not ( = ?auto_234426 ?auto_234428 ) ) ( not ( = ?auto_234427 ?auto_234428 ) ) ( ON ?auto_234426 ?auto_234427 ) ( ON ?auto_234425 ?auto_234426 ) ( ON ?auto_234424 ?auto_234425 ) ( ON ?auto_234423 ?auto_234424 ) ( ON ?auto_234422 ?auto_234423 ) ( ON ?auto_234421 ?auto_234422 ) ( CLEAR ?auto_234419 ) ( ON ?auto_234420 ?auto_234421 ) ( CLEAR ?auto_234420 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_234419 ?auto_234420 )
      ( MAKE-9PILE ?auto_234419 ?auto_234420 ?auto_234421 ?auto_234422 ?auto_234423 ?auto_234424 ?auto_234425 ?auto_234426 ?auto_234427 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_234438 - BLOCK
      ?auto_234439 - BLOCK
      ?auto_234440 - BLOCK
      ?auto_234441 - BLOCK
      ?auto_234442 - BLOCK
      ?auto_234443 - BLOCK
      ?auto_234444 - BLOCK
      ?auto_234445 - BLOCK
      ?auto_234446 - BLOCK
    )
    :vars
    (
      ?auto_234447 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_234446 ?auto_234447 ) ( ON-TABLE ?auto_234438 ) ( not ( = ?auto_234438 ?auto_234439 ) ) ( not ( = ?auto_234438 ?auto_234440 ) ) ( not ( = ?auto_234438 ?auto_234441 ) ) ( not ( = ?auto_234438 ?auto_234442 ) ) ( not ( = ?auto_234438 ?auto_234443 ) ) ( not ( = ?auto_234438 ?auto_234444 ) ) ( not ( = ?auto_234438 ?auto_234445 ) ) ( not ( = ?auto_234438 ?auto_234446 ) ) ( not ( = ?auto_234438 ?auto_234447 ) ) ( not ( = ?auto_234439 ?auto_234440 ) ) ( not ( = ?auto_234439 ?auto_234441 ) ) ( not ( = ?auto_234439 ?auto_234442 ) ) ( not ( = ?auto_234439 ?auto_234443 ) ) ( not ( = ?auto_234439 ?auto_234444 ) ) ( not ( = ?auto_234439 ?auto_234445 ) ) ( not ( = ?auto_234439 ?auto_234446 ) ) ( not ( = ?auto_234439 ?auto_234447 ) ) ( not ( = ?auto_234440 ?auto_234441 ) ) ( not ( = ?auto_234440 ?auto_234442 ) ) ( not ( = ?auto_234440 ?auto_234443 ) ) ( not ( = ?auto_234440 ?auto_234444 ) ) ( not ( = ?auto_234440 ?auto_234445 ) ) ( not ( = ?auto_234440 ?auto_234446 ) ) ( not ( = ?auto_234440 ?auto_234447 ) ) ( not ( = ?auto_234441 ?auto_234442 ) ) ( not ( = ?auto_234441 ?auto_234443 ) ) ( not ( = ?auto_234441 ?auto_234444 ) ) ( not ( = ?auto_234441 ?auto_234445 ) ) ( not ( = ?auto_234441 ?auto_234446 ) ) ( not ( = ?auto_234441 ?auto_234447 ) ) ( not ( = ?auto_234442 ?auto_234443 ) ) ( not ( = ?auto_234442 ?auto_234444 ) ) ( not ( = ?auto_234442 ?auto_234445 ) ) ( not ( = ?auto_234442 ?auto_234446 ) ) ( not ( = ?auto_234442 ?auto_234447 ) ) ( not ( = ?auto_234443 ?auto_234444 ) ) ( not ( = ?auto_234443 ?auto_234445 ) ) ( not ( = ?auto_234443 ?auto_234446 ) ) ( not ( = ?auto_234443 ?auto_234447 ) ) ( not ( = ?auto_234444 ?auto_234445 ) ) ( not ( = ?auto_234444 ?auto_234446 ) ) ( not ( = ?auto_234444 ?auto_234447 ) ) ( not ( = ?auto_234445 ?auto_234446 ) ) ( not ( = ?auto_234445 ?auto_234447 ) ) ( not ( = ?auto_234446 ?auto_234447 ) ) ( ON ?auto_234445 ?auto_234446 ) ( ON ?auto_234444 ?auto_234445 ) ( ON ?auto_234443 ?auto_234444 ) ( ON ?auto_234442 ?auto_234443 ) ( ON ?auto_234441 ?auto_234442 ) ( ON ?auto_234440 ?auto_234441 ) ( CLEAR ?auto_234438 ) ( ON ?auto_234439 ?auto_234440 ) ( CLEAR ?auto_234439 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_234438 ?auto_234439 )
      ( MAKE-9PILE ?auto_234438 ?auto_234439 ?auto_234440 ?auto_234441 ?auto_234442 ?auto_234443 ?auto_234444 ?auto_234445 ?auto_234446 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_234457 - BLOCK
      ?auto_234458 - BLOCK
      ?auto_234459 - BLOCK
      ?auto_234460 - BLOCK
      ?auto_234461 - BLOCK
      ?auto_234462 - BLOCK
      ?auto_234463 - BLOCK
      ?auto_234464 - BLOCK
      ?auto_234465 - BLOCK
    )
    :vars
    (
      ?auto_234466 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_234465 ?auto_234466 ) ( not ( = ?auto_234457 ?auto_234458 ) ) ( not ( = ?auto_234457 ?auto_234459 ) ) ( not ( = ?auto_234457 ?auto_234460 ) ) ( not ( = ?auto_234457 ?auto_234461 ) ) ( not ( = ?auto_234457 ?auto_234462 ) ) ( not ( = ?auto_234457 ?auto_234463 ) ) ( not ( = ?auto_234457 ?auto_234464 ) ) ( not ( = ?auto_234457 ?auto_234465 ) ) ( not ( = ?auto_234457 ?auto_234466 ) ) ( not ( = ?auto_234458 ?auto_234459 ) ) ( not ( = ?auto_234458 ?auto_234460 ) ) ( not ( = ?auto_234458 ?auto_234461 ) ) ( not ( = ?auto_234458 ?auto_234462 ) ) ( not ( = ?auto_234458 ?auto_234463 ) ) ( not ( = ?auto_234458 ?auto_234464 ) ) ( not ( = ?auto_234458 ?auto_234465 ) ) ( not ( = ?auto_234458 ?auto_234466 ) ) ( not ( = ?auto_234459 ?auto_234460 ) ) ( not ( = ?auto_234459 ?auto_234461 ) ) ( not ( = ?auto_234459 ?auto_234462 ) ) ( not ( = ?auto_234459 ?auto_234463 ) ) ( not ( = ?auto_234459 ?auto_234464 ) ) ( not ( = ?auto_234459 ?auto_234465 ) ) ( not ( = ?auto_234459 ?auto_234466 ) ) ( not ( = ?auto_234460 ?auto_234461 ) ) ( not ( = ?auto_234460 ?auto_234462 ) ) ( not ( = ?auto_234460 ?auto_234463 ) ) ( not ( = ?auto_234460 ?auto_234464 ) ) ( not ( = ?auto_234460 ?auto_234465 ) ) ( not ( = ?auto_234460 ?auto_234466 ) ) ( not ( = ?auto_234461 ?auto_234462 ) ) ( not ( = ?auto_234461 ?auto_234463 ) ) ( not ( = ?auto_234461 ?auto_234464 ) ) ( not ( = ?auto_234461 ?auto_234465 ) ) ( not ( = ?auto_234461 ?auto_234466 ) ) ( not ( = ?auto_234462 ?auto_234463 ) ) ( not ( = ?auto_234462 ?auto_234464 ) ) ( not ( = ?auto_234462 ?auto_234465 ) ) ( not ( = ?auto_234462 ?auto_234466 ) ) ( not ( = ?auto_234463 ?auto_234464 ) ) ( not ( = ?auto_234463 ?auto_234465 ) ) ( not ( = ?auto_234463 ?auto_234466 ) ) ( not ( = ?auto_234464 ?auto_234465 ) ) ( not ( = ?auto_234464 ?auto_234466 ) ) ( not ( = ?auto_234465 ?auto_234466 ) ) ( ON ?auto_234464 ?auto_234465 ) ( ON ?auto_234463 ?auto_234464 ) ( ON ?auto_234462 ?auto_234463 ) ( ON ?auto_234461 ?auto_234462 ) ( ON ?auto_234460 ?auto_234461 ) ( ON ?auto_234459 ?auto_234460 ) ( ON ?auto_234458 ?auto_234459 ) ( ON ?auto_234457 ?auto_234458 ) ( CLEAR ?auto_234457 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_234457 )
      ( MAKE-9PILE ?auto_234457 ?auto_234458 ?auto_234459 ?auto_234460 ?auto_234461 ?auto_234462 ?auto_234463 ?auto_234464 ?auto_234465 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_234476 - BLOCK
      ?auto_234477 - BLOCK
      ?auto_234478 - BLOCK
      ?auto_234479 - BLOCK
      ?auto_234480 - BLOCK
      ?auto_234481 - BLOCK
      ?auto_234482 - BLOCK
      ?auto_234483 - BLOCK
      ?auto_234484 - BLOCK
    )
    :vars
    (
      ?auto_234485 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_234484 ?auto_234485 ) ( not ( = ?auto_234476 ?auto_234477 ) ) ( not ( = ?auto_234476 ?auto_234478 ) ) ( not ( = ?auto_234476 ?auto_234479 ) ) ( not ( = ?auto_234476 ?auto_234480 ) ) ( not ( = ?auto_234476 ?auto_234481 ) ) ( not ( = ?auto_234476 ?auto_234482 ) ) ( not ( = ?auto_234476 ?auto_234483 ) ) ( not ( = ?auto_234476 ?auto_234484 ) ) ( not ( = ?auto_234476 ?auto_234485 ) ) ( not ( = ?auto_234477 ?auto_234478 ) ) ( not ( = ?auto_234477 ?auto_234479 ) ) ( not ( = ?auto_234477 ?auto_234480 ) ) ( not ( = ?auto_234477 ?auto_234481 ) ) ( not ( = ?auto_234477 ?auto_234482 ) ) ( not ( = ?auto_234477 ?auto_234483 ) ) ( not ( = ?auto_234477 ?auto_234484 ) ) ( not ( = ?auto_234477 ?auto_234485 ) ) ( not ( = ?auto_234478 ?auto_234479 ) ) ( not ( = ?auto_234478 ?auto_234480 ) ) ( not ( = ?auto_234478 ?auto_234481 ) ) ( not ( = ?auto_234478 ?auto_234482 ) ) ( not ( = ?auto_234478 ?auto_234483 ) ) ( not ( = ?auto_234478 ?auto_234484 ) ) ( not ( = ?auto_234478 ?auto_234485 ) ) ( not ( = ?auto_234479 ?auto_234480 ) ) ( not ( = ?auto_234479 ?auto_234481 ) ) ( not ( = ?auto_234479 ?auto_234482 ) ) ( not ( = ?auto_234479 ?auto_234483 ) ) ( not ( = ?auto_234479 ?auto_234484 ) ) ( not ( = ?auto_234479 ?auto_234485 ) ) ( not ( = ?auto_234480 ?auto_234481 ) ) ( not ( = ?auto_234480 ?auto_234482 ) ) ( not ( = ?auto_234480 ?auto_234483 ) ) ( not ( = ?auto_234480 ?auto_234484 ) ) ( not ( = ?auto_234480 ?auto_234485 ) ) ( not ( = ?auto_234481 ?auto_234482 ) ) ( not ( = ?auto_234481 ?auto_234483 ) ) ( not ( = ?auto_234481 ?auto_234484 ) ) ( not ( = ?auto_234481 ?auto_234485 ) ) ( not ( = ?auto_234482 ?auto_234483 ) ) ( not ( = ?auto_234482 ?auto_234484 ) ) ( not ( = ?auto_234482 ?auto_234485 ) ) ( not ( = ?auto_234483 ?auto_234484 ) ) ( not ( = ?auto_234483 ?auto_234485 ) ) ( not ( = ?auto_234484 ?auto_234485 ) ) ( ON ?auto_234483 ?auto_234484 ) ( ON ?auto_234482 ?auto_234483 ) ( ON ?auto_234481 ?auto_234482 ) ( ON ?auto_234480 ?auto_234481 ) ( ON ?auto_234479 ?auto_234480 ) ( ON ?auto_234478 ?auto_234479 ) ( ON ?auto_234477 ?auto_234478 ) ( ON ?auto_234476 ?auto_234477 ) ( CLEAR ?auto_234476 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_234476 )
      ( MAKE-9PILE ?auto_234476 ?auto_234477 ?auto_234478 ?auto_234479 ?auto_234480 ?auto_234481 ?auto_234482 ?auto_234483 ?auto_234484 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_234496 - BLOCK
      ?auto_234497 - BLOCK
      ?auto_234498 - BLOCK
      ?auto_234499 - BLOCK
      ?auto_234500 - BLOCK
      ?auto_234501 - BLOCK
      ?auto_234502 - BLOCK
      ?auto_234503 - BLOCK
      ?auto_234504 - BLOCK
      ?auto_234505 - BLOCK
    )
    :vars
    (
      ?auto_234506 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_234504 ) ( ON ?auto_234505 ?auto_234506 ) ( CLEAR ?auto_234505 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_234496 ) ( ON ?auto_234497 ?auto_234496 ) ( ON ?auto_234498 ?auto_234497 ) ( ON ?auto_234499 ?auto_234498 ) ( ON ?auto_234500 ?auto_234499 ) ( ON ?auto_234501 ?auto_234500 ) ( ON ?auto_234502 ?auto_234501 ) ( ON ?auto_234503 ?auto_234502 ) ( ON ?auto_234504 ?auto_234503 ) ( not ( = ?auto_234496 ?auto_234497 ) ) ( not ( = ?auto_234496 ?auto_234498 ) ) ( not ( = ?auto_234496 ?auto_234499 ) ) ( not ( = ?auto_234496 ?auto_234500 ) ) ( not ( = ?auto_234496 ?auto_234501 ) ) ( not ( = ?auto_234496 ?auto_234502 ) ) ( not ( = ?auto_234496 ?auto_234503 ) ) ( not ( = ?auto_234496 ?auto_234504 ) ) ( not ( = ?auto_234496 ?auto_234505 ) ) ( not ( = ?auto_234496 ?auto_234506 ) ) ( not ( = ?auto_234497 ?auto_234498 ) ) ( not ( = ?auto_234497 ?auto_234499 ) ) ( not ( = ?auto_234497 ?auto_234500 ) ) ( not ( = ?auto_234497 ?auto_234501 ) ) ( not ( = ?auto_234497 ?auto_234502 ) ) ( not ( = ?auto_234497 ?auto_234503 ) ) ( not ( = ?auto_234497 ?auto_234504 ) ) ( not ( = ?auto_234497 ?auto_234505 ) ) ( not ( = ?auto_234497 ?auto_234506 ) ) ( not ( = ?auto_234498 ?auto_234499 ) ) ( not ( = ?auto_234498 ?auto_234500 ) ) ( not ( = ?auto_234498 ?auto_234501 ) ) ( not ( = ?auto_234498 ?auto_234502 ) ) ( not ( = ?auto_234498 ?auto_234503 ) ) ( not ( = ?auto_234498 ?auto_234504 ) ) ( not ( = ?auto_234498 ?auto_234505 ) ) ( not ( = ?auto_234498 ?auto_234506 ) ) ( not ( = ?auto_234499 ?auto_234500 ) ) ( not ( = ?auto_234499 ?auto_234501 ) ) ( not ( = ?auto_234499 ?auto_234502 ) ) ( not ( = ?auto_234499 ?auto_234503 ) ) ( not ( = ?auto_234499 ?auto_234504 ) ) ( not ( = ?auto_234499 ?auto_234505 ) ) ( not ( = ?auto_234499 ?auto_234506 ) ) ( not ( = ?auto_234500 ?auto_234501 ) ) ( not ( = ?auto_234500 ?auto_234502 ) ) ( not ( = ?auto_234500 ?auto_234503 ) ) ( not ( = ?auto_234500 ?auto_234504 ) ) ( not ( = ?auto_234500 ?auto_234505 ) ) ( not ( = ?auto_234500 ?auto_234506 ) ) ( not ( = ?auto_234501 ?auto_234502 ) ) ( not ( = ?auto_234501 ?auto_234503 ) ) ( not ( = ?auto_234501 ?auto_234504 ) ) ( not ( = ?auto_234501 ?auto_234505 ) ) ( not ( = ?auto_234501 ?auto_234506 ) ) ( not ( = ?auto_234502 ?auto_234503 ) ) ( not ( = ?auto_234502 ?auto_234504 ) ) ( not ( = ?auto_234502 ?auto_234505 ) ) ( not ( = ?auto_234502 ?auto_234506 ) ) ( not ( = ?auto_234503 ?auto_234504 ) ) ( not ( = ?auto_234503 ?auto_234505 ) ) ( not ( = ?auto_234503 ?auto_234506 ) ) ( not ( = ?auto_234504 ?auto_234505 ) ) ( not ( = ?auto_234504 ?auto_234506 ) ) ( not ( = ?auto_234505 ?auto_234506 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_234505 ?auto_234506 )
      ( !STACK ?auto_234505 ?auto_234504 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_234517 - BLOCK
      ?auto_234518 - BLOCK
      ?auto_234519 - BLOCK
      ?auto_234520 - BLOCK
      ?auto_234521 - BLOCK
      ?auto_234522 - BLOCK
      ?auto_234523 - BLOCK
      ?auto_234524 - BLOCK
      ?auto_234525 - BLOCK
      ?auto_234526 - BLOCK
    )
    :vars
    (
      ?auto_234527 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_234525 ) ( ON ?auto_234526 ?auto_234527 ) ( CLEAR ?auto_234526 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_234517 ) ( ON ?auto_234518 ?auto_234517 ) ( ON ?auto_234519 ?auto_234518 ) ( ON ?auto_234520 ?auto_234519 ) ( ON ?auto_234521 ?auto_234520 ) ( ON ?auto_234522 ?auto_234521 ) ( ON ?auto_234523 ?auto_234522 ) ( ON ?auto_234524 ?auto_234523 ) ( ON ?auto_234525 ?auto_234524 ) ( not ( = ?auto_234517 ?auto_234518 ) ) ( not ( = ?auto_234517 ?auto_234519 ) ) ( not ( = ?auto_234517 ?auto_234520 ) ) ( not ( = ?auto_234517 ?auto_234521 ) ) ( not ( = ?auto_234517 ?auto_234522 ) ) ( not ( = ?auto_234517 ?auto_234523 ) ) ( not ( = ?auto_234517 ?auto_234524 ) ) ( not ( = ?auto_234517 ?auto_234525 ) ) ( not ( = ?auto_234517 ?auto_234526 ) ) ( not ( = ?auto_234517 ?auto_234527 ) ) ( not ( = ?auto_234518 ?auto_234519 ) ) ( not ( = ?auto_234518 ?auto_234520 ) ) ( not ( = ?auto_234518 ?auto_234521 ) ) ( not ( = ?auto_234518 ?auto_234522 ) ) ( not ( = ?auto_234518 ?auto_234523 ) ) ( not ( = ?auto_234518 ?auto_234524 ) ) ( not ( = ?auto_234518 ?auto_234525 ) ) ( not ( = ?auto_234518 ?auto_234526 ) ) ( not ( = ?auto_234518 ?auto_234527 ) ) ( not ( = ?auto_234519 ?auto_234520 ) ) ( not ( = ?auto_234519 ?auto_234521 ) ) ( not ( = ?auto_234519 ?auto_234522 ) ) ( not ( = ?auto_234519 ?auto_234523 ) ) ( not ( = ?auto_234519 ?auto_234524 ) ) ( not ( = ?auto_234519 ?auto_234525 ) ) ( not ( = ?auto_234519 ?auto_234526 ) ) ( not ( = ?auto_234519 ?auto_234527 ) ) ( not ( = ?auto_234520 ?auto_234521 ) ) ( not ( = ?auto_234520 ?auto_234522 ) ) ( not ( = ?auto_234520 ?auto_234523 ) ) ( not ( = ?auto_234520 ?auto_234524 ) ) ( not ( = ?auto_234520 ?auto_234525 ) ) ( not ( = ?auto_234520 ?auto_234526 ) ) ( not ( = ?auto_234520 ?auto_234527 ) ) ( not ( = ?auto_234521 ?auto_234522 ) ) ( not ( = ?auto_234521 ?auto_234523 ) ) ( not ( = ?auto_234521 ?auto_234524 ) ) ( not ( = ?auto_234521 ?auto_234525 ) ) ( not ( = ?auto_234521 ?auto_234526 ) ) ( not ( = ?auto_234521 ?auto_234527 ) ) ( not ( = ?auto_234522 ?auto_234523 ) ) ( not ( = ?auto_234522 ?auto_234524 ) ) ( not ( = ?auto_234522 ?auto_234525 ) ) ( not ( = ?auto_234522 ?auto_234526 ) ) ( not ( = ?auto_234522 ?auto_234527 ) ) ( not ( = ?auto_234523 ?auto_234524 ) ) ( not ( = ?auto_234523 ?auto_234525 ) ) ( not ( = ?auto_234523 ?auto_234526 ) ) ( not ( = ?auto_234523 ?auto_234527 ) ) ( not ( = ?auto_234524 ?auto_234525 ) ) ( not ( = ?auto_234524 ?auto_234526 ) ) ( not ( = ?auto_234524 ?auto_234527 ) ) ( not ( = ?auto_234525 ?auto_234526 ) ) ( not ( = ?auto_234525 ?auto_234527 ) ) ( not ( = ?auto_234526 ?auto_234527 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_234526 ?auto_234527 )
      ( !STACK ?auto_234526 ?auto_234525 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_234538 - BLOCK
      ?auto_234539 - BLOCK
      ?auto_234540 - BLOCK
      ?auto_234541 - BLOCK
      ?auto_234542 - BLOCK
      ?auto_234543 - BLOCK
      ?auto_234544 - BLOCK
      ?auto_234545 - BLOCK
      ?auto_234546 - BLOCK
      ?auto_234547 - BLOCK
    )
    :vars
    (
      ?auto_234548 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_234547 ?auto_234548 ) ( ON-TABLE ?auto_234538 ) ( ON ?auto_234539 ?auto_234538 ) ( ON ?auto_234540 ?auto_234539 ) ( ON ?auto_234541 ?auto_234540 ) ( ON ?auto_234542 ?auto_234541 ) ( ON ?auto_234543 ?auto_234542 ) ( ON ?auto_234544 ?auto_234543 ) ( ON ?auto_234545 ?auto_234544 ) ( not ( = ?auto_234538 ?auto_234539 ) ) ( not ( = ?auto_234538 ?auto_234540 ) ) ( not ( = ?auto_234538 ?auto_234541 ) ) ( not ( = ?auto_234538 ?auto_234542 ) ) ( not ( = ?auto_234538 ?auto_234543 ) ) ( not ( = ?auto_234538 ?auto_234544 ) ) ( not ( = ?auto_234538 ?auto_234545 ) ) ( not ( = ?auto_234538 ?auto_234546 ) ) ( not ( = ?auto_234538 ?auto_234547 ) ) ( not ( = ?auto_234538 ?auto_234548 ) ) ( not ( = ?auto_234539 ?auto_234540 ) ) ( not ( = ?auto_234539 ?auto_234541 ) ) ( not ( = ?auto_234539 ?auto_234542 ) ) ( not ( = ?auto_234539 ?auto_234543 ) ) ( not ( = ?auto_234539 ?auto_234544 ) ) ( not ( = ?auto_234539 ?auto_234545 ) ) ( not ( = ?auto_234539 ?auto_234546 ) ) ( not ( = ?auto_234539 ?auto_234547 ) ) ( not ( = ?auto_234539 ?auto_234548 ) ) ( not ( = ?auto_234540 ?auto_234541 ) ) ( not ( = ?auto_234540 ?auto_234542 ) ) ( not ( = ?auto_234540 ?auto_234543 ) ) ( not ( = ?auto_234540 ?auto_234544 ) ) ( not ( = ?auto_234540 ?auto_234545 ) ) ( not ( = ?auto_234540 ?auto_234546 ) ) ( not ( = ?auto_234540 ?auto_234547 ) ) ( not ( = ?auto_234540 ?auto_234548 ) ) ( not ( = ?auto_234541 ?auto_234542 ) ) ( not ( = ?auto_234541 ?auto_234543 ) ) ( not ( = ?auto_234541 ?auto_234544 ) ) ( not ( = ?auto_234541 ?auto_234545 ) ) ( not ( = ?auto_234541 ?auto_234546 ) ) ( not ( = ?auto_234541 ?auto_234547 ) ) ( not ( = ?auto_234541 ?auto_234548 ) ) ( not ( = ?auto_234542 ?auto_234543 ) ) ( not ( = ?auto_234542 ?auto_234544 ) ) ( not ( = ?auto_234542 ?auto_234545 ) ) ( not ( = ?auto_234542 ?auto_234546 ) ) ( not ( = ?auto_234542 ?auto_234547 ) ) ( not ( = ?auto_234542 ?auto_234548 ) ) ( not ( = ?auto_234543 ?auto_234544 ) ) ( not ( = ?auto_234543 ?auto_234545 ) ) ( not ( = ?auto_234543 ?auto_234546 ) ) ( not ( = ?auto_234543 ?auto_234547 ) ) ( not ( = ?auto_234543 ?auto_234548 ) ) ( not ( = ?auto_234544 ?auto_234545 ) ) ( not ( = ?auto_234544 ?auto_234546 ) ) ( not ( = ?auto_234544 ?auto_234547 ) ) ( not ( = ?auto_234544 ?auto_234548 ) ) ( not ( = ?auto_234545 ?auto_234546 ) ) ( not ( = ?auto_234545 ?auto_234547 ) ) ( not ( = ?auto_234545 ?auto_234548 ) ) ( not ( = ?auto_234546 ?auto_234547 ) ) ( not ( = ?auto_234546 ?auto_234548 ) ) ( not ( = ?auto_234547 ?auto_234548 ) ) ( CLEAR ?auto_234545 ) ( ON ?auto_234546 ?auto_234547 ) ( CLEAR ?auto_234546 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_234538 ?auto_234539 ?auto_234540 ?auto_234541 ?auto_234542 ?auto_234543 ?auto_234544 ?auto_234545 ?auto_234546 )
      ( MAKE-10PILE ?auto_234538 ?auto_234539 ?auto_234540 ?auto_234541 ?auto_234542 ?auto_234543 ?auto_234544 ?auto_234545 ?auto_234546 ?auto_234547 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_234559 - BLOCK
      ?auto_234560 - BLOCK
      ?auto_234561 - BLOCK
      ?auto_234562 - BLOCK
      ?auto_234563 - BLOCK
      ?auto_234564 - BLOCK
      ?auto_234565 - BLOCK
      ?auto_234566 - BLOCK
      ?auto_234567 - BLOCK
      ?auto_234568 - BLOCK
    )
    :vars
    (
      ?auto_234569 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_234568 ?auto_234569 ) ( ON-TABLE ?auto_234559 ) ( ON ?auto_234560 ?auto_234559 ) ( ON ?auto_234561 ?auto_234560 ) ( ON ?auto_234562 ?auto_234561 ) ( ON ?auto_234563 ?auto_234562 ) ( ON ?auto_234564 ?auto_234563 ) ( ON ?auto_234565 ?auto_234564 ) ( ON ?auto_234566 ?auto_234565 ) ( not ( = ?auto_234559 ?auto_234560 ) ) ( not ( = ?auto_234559 ?auto_234561 ) ) ( not ( = ?auto_234559 ?auto_234562 ) ) ( not ( = ?auto_234559 ?auto_234563 ) ) ( not ( = ?auto_234559 ?auto_234564 ) ) ( not ( = ?auto_234559 ?auto_234565 ) ) ( not ( = ?auto_234559 ?auto_234566 ) ) ( not ( = ?auto_234559 ?auto_234567 ) ) ( not ( = ?auto_234559 ?auto_234568 ) ) ( not ( = ?auto_234559 ?auto_234569 ) ) ( not ( = ?auto_234560 ?auto_234561 ) ) ( not ( = ?auto_234560 ?auto_234562 ) ) ( not ( = ?auto_234560 ?auto_234563 ) ) ( not ( = ?auto_234560 ?auto_234564 ) ) ( not ( = ?auto_234560 ?auto_234565 ) ) ( not ( = ?auto_234560 ?auto_234566 ) ) ( not ( = ?auto_234560 ?auto_234567 ) ) ( not ( = ?auto_234560 ?auto_234568 ) ) ( not ( = ?auto_234560 ?auto_234569 ) ) ( not ( = ?auto_234561 ?auto_234562 ) ) ( not ( = ?auto_234561 ?auto_234563 ) ) ( not ( = ?auto_234561 ?auto_234564 ) ) ( not ( = ?auto_234561 ?auto_234565 ) ) ( not ( = ?auto_234561 ?auto_234566 ) ) ( not ( = ?auto_234561 ?auto_234567 ) ) ( not ( = ?auto_234561 ?auto_234568 ) ) ( not ( = ?auto_234561 ?auto_234569 ) ) ( not ( = ?auto_234562 ?auto_234563 ) ) ( not ( = ?auto_234562 ?auto_234564 ) ) ( not ( = ?auto_234562 ?auto_234565 ) ) ( not ( = ?auto_234562 ?auto_234566 ) ) ( not ( = ?auto_234562 ?auto_234567 ) ) ( not ( = ?auto_234562 ?auto_234568 ) ) ( not ( = ?auto_234562 ?auto_234569 ) ) ( not ( = ?auto_234563 ?auto_234564 ) ) ( not ( = ?auto_234563 ?auto_234565 ) ) ( not ( = ?auto_234563 ?auto_234566 ) ) ( not ( = ?auto_234563 ?auto_234567 ) ) ( not ( = ?auto_234563 ?auto_234568 ) ) ( not ( = ?auto_234563 ?auto_234569 ) ) ( not ( = ?auto_234564 ?auto_234565 ) ) ( not ( = ?auto_234564 ?auto_234566 ) ) ( not ( = ?auto_234564 ?auto_234567 ) ) ( not ( = ?auto_234564 ?auto_234568 ) ) ( not ( = ?auto_234564 ?auto_234569 ) ) ( not ( = ?auto_234565 ?auto_234566 ) ) ( not ( = ?auto_234565 ?auto_234567 ) ) ( not ( = ?auto_234565 ?auto_234568 ) ) ( not ( = ?auto_234565 ?auto_234569 ) ) ( not ( = ?auto_234566 ?auto_234567 ) ) ( not ( = ?auto_234566 ?auto_234568 ) ) ( not ( = ?auto_234566 ?auto_234569 ) ) ( not ( = ?auto_234567 ?auto_234568 ) ) ( not ( = ?auto_234567 ?auto_234569 ) ) ( not ( = ?auto_234568 ?auto_234569 ) ) ( CLEAR ?auto_234566 ) ( ON ?auto_234567 ?auto_234568 ) ( CLEAR ?auto_234567 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_234559 ?auto_234560 ?auto_234561 ?auto_234562 ?auto_234563 ?auto_234564 ?auto_234565 ?auto_234566 ?auto_234567 )
      ( MAKE-10PILE ?auto_234559 ?auto_234560 ?auto_234561 ?auto_234562 ?auto_234563 ?auto_234564 ?auto_234565 ?auto_234566 ?auto_234567 ?auto_234568 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_234580 - BLOCK
      ?auto_234581 - BLOCK
      ?auto_234582 - BLOCK
      ?auto_234583 - BLOCK
      ?auto_234584 - BLOCK
      ?auto_234585 - BLOCK
      ?auto_234586 - BLOCK
      ?auto_234587 - BLOCK
      ?auto_234588 - BLOCK
      ?auto_234589 - BLOCK
    )
    :vars
    (
      ?auto_234590 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_234589 ?auto_234590 ) ( ON-TABLE ?auto_234580 ) ( ON ?auto_234581 ?auto_234580 ) ( ON ?auto_234582 ?auto_234581 ) ( ON ?auto_234583 ?auto_234582 ) ( ON ?auto_234584 ?auto_234583 ) ( ON ?auto_234585 ?auto_234584 ) ( ON ?auto_234586 ?auto_234585 ) ( not ( = ?auto_234580 ?auto_234581 ) ) ( not ( = ?auto_234580 ?auto_234582 ) ) ( not ( = ?auto_234580 ?auto_234583 ) ) ( not ( = ?auto_234580 ?auto_234584 ) ) ( not ( = ?auto_234580 ?auto_234585 ) ) ( not ( = ?auto_234580 ?auto_234586 ) ) ( not ( = ?auto_234580 ?auto_234587 ) ) ( not ( = ?auto_234580 ?auto_234588 ) ) ( not ( = ?auto_234580 ?auto_234589 ) ) ( not ( = ?auto_234580 ?auto_234590 ) ) ( not ( = ?auto_234581 ?auto_234582 ) ) ( not ( = ?auto_234581 ?auto_234583 ) ) ( not ( = ?auto_234581 ?auto_234584 ) ) ( not ( = ?auto_234581 ?auto_234585 ) ) ( not ( = ?auto_234581 ?auto_234586 ) ) ( not ( = ?auto_234581 ?auto_234587 ) ) ( not ( = ?auto_234581 ?auto_234588 ) ) ( not ( = ?auto_234581 ?auto_234589 ) ) ( not ( = ?auto_234581 ?auto_234590 ) ) ( not ( = ?auto_234582 ?auto_234583 ) ) ( not ( = ?auto_234582 ?auto_234584 ) ) ( not ( = ?auto_234582 ?auto_234585 ) ) ( not ( = ?auto_234582 ?auto_234586 ) ) ( not ( = ?auto_234582 ?auto_234587 ) ) ( not ( = ?auto_234582 ?auto_234588 ) ) ( not ( = ?auto_234582 ?auto_234589 ) ) ( not ( = ?auto_234582 ?auto_234590 ) ) ( not ( = ?auto_234583 ?auto_234584 ) ) ( not ( = ?auto_234583 ?auto_234585 ) ) ( not ( = ?auto_234583 ?auto_234586 ) ) ( not ( = ?auto_234583 ?auto_234587 ) ) ( not ( = ?auto_234583 ?auto_234588 ) ) ( not ( = ?auto_234583 ?auto_234589 ) ) ( not ( = ?auto_234583 ?auto_234590 ) ) ( not ( = ?auto_234584 ?auto_234585 ) ) ( not ( = ?auto_234584 ?auto_234586 ) ) ( not ( = ?auto_234584 ?auto_234587 ) ) ( not ( = ?auto_234584 ?auto_234588 ) ) ( not ( = ?auto_234584 ?auto_234589 ) ) ( not ( = ?auto_234584 ?auto_234590 ) ) ( not ( = ?auto_234585 ?auto_234586 ) ) ( not ( = ?auto_234585 ?auto_234587 ) ) ( not ( = ?auto_234585 ?auto_234588 ) ) ( not ( = ?auto_234585 ?auto_234589 ) ) ( not ( = ?auto_234585 ?auto_234590 ) ) ( not ( = ?auto_234586 ?auto_234587 ) ) ( not ( = ?auto_234586 ?auto_234588 ) ) ( not ( = ?auto_234586 ?auto_234589 ) ) ( not ( = ?auto_234586 ?auto_234590 ) ) ( not ( = ?auto_234587 ?auto_234588 ) ) ( not ( = ?auto_234587 ?auto_234589 ) ) ( not ( = ?auto_234587 ?auto_234590 ) ) ( not ( = ?auto_234588 ?auto_234589 ) ) ( not ( = ?auto_234588 ?auto_234590 ) ) ( not ( = ?auto_234589 ?auto_234590 ) ) ( ON ?auto_234588 ?auto_234589 ) ( CLEAR ?auto_234586 ) ( ON ?auto_234587 ?auto_234588 ) ( CLEAR ?auto_234587 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_234580 ?auto_234581 ?auto_234582 ?auto_234583 ?auto_234584 ?auto_234585 ?auto_234586 ?auto_234587 )
      ( MAKE-10PILE ?auto_234580 ?auto_234581 ?auto_234582 ?auto_234583 ?auto_234584 ?auto_234585 ?auto_234586 ?auto_234587 ?auto_234588 ?auto_234589 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_234601 - BLOCK
      ?auto_234602 - BLOCK
      ?auto_234603 - BLOCK
      ?auto_234604 - BLOCK
      ?auto_234605 - BLOCK
      ?auto_234606 - BLOCK
      ?auto_234607 - BLOCK
      ?auto_234608 - BLOCK
      ?auto_234609 - BLOCK
      ?auto_234610 - BLOCK
    )
    :vars
    (
      ?auto_234611 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_234610 ?auto_234611 ) ( ON-TABLE ?auto_234601 ) ( ON ?auto_234602 ?auto_234601 ) ( ON ?auto_234603 ?auto_234602 ) ( ON ?auto_234604 ?auto_234603 ) ( ON ?auto_234605 ?auto_234604 ) ( ON ?auto_234606 ?auto_234605 ) ( ON ?auto_234607 ?auto_234606 ) ( not ( = ?auto_234601 ?auto_234602 ) ) ( not ( = ?auto_234601 ?auto_234603 ) ) ( not ( = ?auto_234601 ?auto_234604 ) ) ( not ( = ?auto_234601 ?auto_234605 ) ) ( not ( = ?auto_234601 ?auto_234606 ) ) ( not ( = ?auto_234601 ?auto_234607 ) ) ( not ( = ?auto_234601 ?auto_234608 ) ) ( not ( = ?auto_234601 ?auto_234609 ) ) ( not ( = ?auto_234601 ?auto_234610 ) ) ( not ( = ?auto_234601 ?auto_234611 ) ) ( not ( = ?auto_234602 ?auto_234603 ) ) ( not ( = ?auto_234602 ?auto_234604 ) ) ( not ( = ?auto_234602 ?auto_234605 ) ) ( not ( = ?auto_234602 ?auto_234606 ) ) ( not ( = ?auto_234602 ?auto_234607 ) ) ( not ( = ?auto_234602 ?auto_234608 ) ) ( not ( = ?auto_234602 ?auto_234609 ) ) ( not ( = ?auto_234602 ?auto_234610 ) ) ( not ( = ?auto_234602 ?auto_234611 ) ) ( not ( = ?auto_234603 ?auto_234604 ) ) ( not ( = ?auto_234603 ?auto_234605 ) ) ( not ( = ?auto_234603 ?auto_234606 ) ) ( not ( = ?auto_234603 ?auto_234607 ) ) ( not ( = ?auto_234603 ?auto_234608 ) ) ( not ( = ?auto_234603 ?auto_234609 ) ) ( not ( = ?auto_234603 ?auto_234610 ) ) ( not ( = ?auto_234603 ?auto_234611 ) ) ( not ( = ?auto_234604 ?auto_234605 ) ) ( not ( = ?auto_234604 ?auto_234606 ) ) ( not ( = ?auto_234604 ?auto_234607 ) ) ( not ( = ?auto_234604 ?auto_234608 ) ) ( not ( = ?auto_234604 ?auto_234609 ) ) ( not ( = ?auto_234604 ?auto_234610 ) ) ( not ( = ?auto_234604 ?auto_234611 ) ) ( not ( = ?auto_234605 ?auto_234606 ) ) ( not ( = ?auto_234605 ?auto_234607 ) ) ( not ( = ?auto_234605 ?auto_234608 ) ) ( not ( = ?auto_234605 ?auto_234609 ) ) ( not ( = ?auto_234605 ?auto_234610 ) ) ( not ( = ?auto_234605 ?auto_234611 ) ) ( not ( = ?auto_234606 ?auto_234607 ) ) ( not ( = ?auto_234606 ?auto_234608 ) ) ( not ( = ?auto_234606 ?auto_234609 ) ) ( not ( = ?auto_234606 ?auto_234610 ) ) ( not ( = ?auto_234606 ?auto_234611 ) ) ( not ( = ?auto_234607 ?auto_234608 ) ) ( not ( = ?auto_234607 ?auto_234609 ) ) ( not ( = ?auto_234607 ?auto_234610 ) ) ( not ( = ?auto_234607 ?auto_234611 ) ) ( not ( = ?auto_234608 ?auto_234609 ) ) ( not ( = ?auto_234608 ?auto_234610 ) ) ( not ( = ?auto_234608 ?auto_234611 ) ) ( not ( = ?auto_234609 ?auto_234610 ) ) ( not ( = ?auto_234609 ?auto_234611 ) ) ( not ( = ?auto_234610 ?auto_234611 ) ) ( ON ?auto_234609 ?auto_234610 ) ( CLEAR ?auto_234607 ) ( ON ?auto_234608 ?auto_234609 ) ( CLEAR ?auto_234608 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_234601 ?auto_234602 ?auto_234603 ?auto_234604 ?auto_234605 ?auto_234606 ?auto_234607 ?auto_234608 )
      ( MAKE-10PILE ?auto_234601 ?auto_234602 ?auto_234603 ?auto_234604 ?auto_234605 ?auto_234606 ?auto_234607 ?auto_234608 ?auto_234609 ?auto_234610 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_234622 - BLOCK
      ?auto_234623 - BLOCK
      ?auto_234624 - BLOCK
      ?auto_234625 - BLOCK
      ?auto_234626 - BLOCK
      ?auto_234627 - BLOCK
      ?auto_234628 - BLOCK
      ?auto_234629 - BLOCK
      ?auto_234630 - BLOCK
      ?auto_234631 - BLOCK
    )
    :vars
    (
      ?auto_234632 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_234631 ?auto_234632 ) ( ON-TABLE ?auto_234622 ) ( ON ?auto_234623 ?auto_234622 ) ( ON ?auto_234624 ?auto_234623 ) ( ON ?auto_234625 ?auto_234624 ) ( ON ?auto_234626 ?auto_234625 ) ( ON ?auto_234627 ?auto_234626 ) ( not ( = ?auto_234622 ?auto_234623 ) ) ( not ( = ?auto_234622 ?auto_234624 ) ) ( not ( = ?auto_234622 ?auto_234625 ) ) ( not ( = ?auto_234622 ?auto_234626 ) ) ( not ( = ?auto_234622 ?auto_234627 ) ) ( not ( = ?auto_234622 ?auto_234628 ) ) ( not ( = ?auto_234622 ?auto_234629 ) ) ( not ( = ?auto_234622 ?auto_234630 ) ) ( not ( = ?auto_234622 ?auto_234631 ) ) ( not ( = ?auto_234622 ?auto_234632 ) ) ( not ( = ?auto_234623 ?auto_234624 ) ) ( not ( = ?auto_234623 ?auto_234625 ) ) ( not ( = ?auto_234623 ?auto_234626 ) ) ( not ( = ?auto_234623 ?auto_234627 ) ) ( not ( = ?auto_234623 ?auto_234628 ) ) ( not ( = ?auto_234623 ?auto_234629 ) ) ( not ( = ?auto_234623 ?auto_234630 ) ) ( not ( = ?auto_234623 ?auto_234631 ) ) ( not ( = ?auto_234623 ?auto_234632 ) ) ( not ( = ?auto_234624 ?auto_234625 ) ) ( not ( = ?auto_234624 ?auto_234626 ) ) ( not ( = ?auto_234624 ?auto_234627 ) ) ( not ( = ?auto_234624 ?auto_234628 ) ) ( not ( = ?auto_234624 ?auto_234629 ) ) ( not ( = ?auto_234624 ?auto_234630 ) ) ( not ( = ?auto_234624 ?auto_234631 ) ) ( not ( = ?auto_234624 ?auto_234632 ) ) ( not ( = ?auto_234625 ?auto_234626 ) ) ( not ( = ?auto_234625 ?auto_234627 ) ) ( not ( = ?auto_234625 ?auto_234628 ) ) ( not ( = ?auto_234625 ?auto_234629 ) ) ( not ( = ?auto_234625 ?auto_234630 ) ) ( not ( = ?auto_234625 ?auto_234631 ) ) ( not ( = ?auto_234625 ?auto_234632 ) ) ( not ( = ?auto_234626 ?auto_234627 ) ) ( not ( = ?auto_234626 ?auto_234628 ) ) ( not ( = ?auto_234626 ?auto_234629 ) ) ( not ( = ?auto_234626 ?auto_234630 ) ) ( not ( = ?auto_234626 ?auto_234631 ) ) ( not ( = ?auto_234626 ?auto_234632 ) ) ( not ( = ?auto_234627 ?auto_234628 ) ) ( not ( = ?auto_234627 ?auto_234629 ) ) ( not ( = ?auto_234627 ?auto_234630 ) ) ( not ( = ?auto_234627 ?auto_234631 ) ) ( not ( = ?auto_234627 ?auto_234632 ) ) ( not ( = ?auto_234628 ?auto_234629 ) ) ( not ( = ?auto_234628 ?auto_234630 ) ) ( not ( = ?auto_234628 ?auto_234631 ) ) ( not ( = ?auto_234628 ?auto_234632 ) ) ( not ( = ?auto_234629 ?auto_234630 ) ) ( not ( = ?auto_234629 ?auto_234631 ) ) ( not ( = ?auto_234629 ?auto_234632 ) ) ( not ( = ?auto_234630 ?auto_234631 ) ) ( not ( = ?auto_234630 ?auto_234632 ) ) ( not ( = ?auto_234631 ?auto_234632 ) ) ( ON ?auto_234630 ?auto_234631 ) ( ON ?auto_234629 ?auto_234630 ) ( CLEAR ?auto_234627 ) ( ON ?auto_234628 ?auto_234629 ) ( CLEAR ?auto_234628 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_234622 ?auto_234623 ?auto_234624 ?auto_234625 ?auto_234626 ?auto_234627 ?auto_234628 )
      ( MAKE-10PILE ?auto_234622 ?auto_234623 ?auto_234624 ?auto_234625 ?auto_234626 ?auto_234627 ?auto_234628 ?auto_234629 ?auto_234630 ?auto_234631 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_234643 - BLOCK
      ?auto_234644 - BLOCK
      ?auto_234645 - BLOCK
      ?auto_234646 - BLOCK
      ?auto_234647 - BLOCK
      ?auto_234648 - BLOCK
      ?auto_234649 - BLOCK
      ?auto_234650 - BLOCK
      ?auto_234651 - BLOCK
      ?auto_234652 - BLOCK
    )
    :vars
    (
      ?auto_234653 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_234652 ?auto_234653 ) ( ON-TABLE ?auto_234643 ) ( ON ?auto_234644 ?auto_234643 ) ( ON ?auto_234645 ?auto_234644 ) ( ON ?auto_234646 ?auto_234645 ) ( ON ?auto_234647 ?auto_234646 ) ( ON ?auto_234648 ?auto_234647 ) ( not ( = ?auto_234643 ?auto_234644 ) ) ( not ( = ?auto_234643 ?auto_234645 ) ) ( not ( = ?auto_234643 ?auto_234646 ) ) ( not ( = ?auto_234643 ?auto_234647 ) ) ( not ( = ?auto_234643 ?auto_234648 ) ) ( not ( = ?auto_234643 ?auto_234649 ) ) ( not ( = ?auto_234643 ?auto_234650 ) ) ( not ( = ?auto_234643 ?auto_234651 ) ) ( not ( = ?auto_234643 ?auto_234652 ) ) ( not ( = ?auto_234643 ?auto_234653 ) ) ( not ( = ?auto_234644 ?auto_234645 ) ) ( not ( = ?auto_234644 ?auto_234646 ) ) ( not ( = ?auto_234644 ?auto_234647 ) ) ( not ( = ?auto_234644 ?auto_234648 ) ) ( not ( = ?auto_234644 ?auto_234649 ) ) ( not ( = ?auto_234644 ?auto_234650 ) ) ( not ( = ?auto_234644 ?auto_234651 ) ) ( not ( = ?auto_234644 ?auto_234652 ) ) ( not ( = ?auto_234644 ?auto_234653 ) ) ( not ( = ?auto_234645 ?auto_234646 ) ) ( not ( = ?auto_234645 ?auto_234647 ) ) ( not ( = ?auto_234645 ?auto_234648 ) ) ( not ( = ?auto_234645 ?auto_234649 ) ) ( not ( = ?auto_234645 ?auto_234650 ) ) ( not ( = ?auto_234645 ?auto_234651 ) ) ( not ( = ?auto_234645 ?auto_234652 ) ) ( not ( = ?auto_234645 ?auto_234653 ) ) ( not ( = ?auto_234646 ?auto_234647 ) ) ( not ( = ?auto_234646 ?auto_234648 ) ) ( not ( = ?auto_234646 ?auto_234649 ) ) ( not ( = ?auto_234646 ?auto_234650 ) ) ( not ( = ?auto_234646 ?auto_234651 ) ) ( not ( = ?auto_234646 ?auto_234652 ) ) ( not ( = ?auto_234646 ?auto_234653 ) ) ( not ( = ?auto_234647 ?auto_234648 ) ) ( not ( = ?auto_234647 ?auto_234649 ) ) ( not ( = ?auto_234647 ?auto_234650 ) ) ( not ( = ?auto_234647 ?auto_234651 ) ) ( not ( = ?auto_234647 ?auto_234652 ) ) ( not ( = ?auto_234647 ?auto_234653 ) ) ( not ( = ?auto_234648 ?auto_234649 ) ) ( not ( = ?auto_234648 ?auto_234650 ) ) ( not ( = ?auto_234648 ?auto_234651 ) ) ( not ( = ?auto_234648 ?auto_234652 ) ) ( not ( = ?auto_234648 ?auto_234653 ) ) ( not ( = ?auto_234649 ?auto_234650 ) ) ( not ( = ?auto_234649 ?auto_234651 ) ) ( not ( = ?auto_234649 ?auto_234652 ) ) ( not ( = ?auto_234649 ?auto_234653 ) ) ( not ( = ?auto_234650 ?auto_234651 ) ) ( not ( = ?auto_234650 ?auto_234652 ) ) ( not ( = ?auto_234650 ?auto_234653 ) ) ( not ( = ?auto_234651 ?auto_234652 ) ) ( not ( = ?auto_234651 ?auto_234653 ) ) ( not ( = ?auto_234652 ?auto_234653 ) ) ( ON ?auto_234651 ?auto_234652 ) ( ON ?auto_234650 ?auto_234651 ) ( CLEAR ?auto_234648 ) ( ON ?auto_234649 ?auto_234650 ) ( CLEAR ?auto_234649 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_234643 ?auto_234644 ?auto_234645 ?auto_234646 ?auto_234647 ?auto_234648 ?auto_234649 )
      ( MAKE-10PILE ?auto_234643 ?auto_234644 ?auto_234645 ?auto_234646 ?auto_234647 ?auto_234648 ?auto_234649 ?auto_234650 ?auto_234651 ?auto_234652 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_234664 - BLOCK
      ?auto_234665 - BLOCK
      ?auto_234666 - BLOCK
      ?auto_234667 - BLOCK
      ?auto_234668 - BLOCK
      ?auto_234669 - BLOCK
      ?auto_234670 - BLOCK
      ?auto_234671 - BLOCK
      ?auto_234672 - BLOCK
      ?auto_234673 - BLOCK
    )
    :vars
    (
      ?auto_234674 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_234673 ?auto_234674 ) ( ON-TABLE ?auto_234664 ) ( ON ?auto_234665 ?auto_234664 ) ( ON ?auto_234666 ?auto_234665 ) ( ON ?auto_234667 ?auto_234666 ) ( ON ?auto_234668 ?auto_234667 ) ( not ( = ?auto_234664 ?auto_234665 ) ) ( not ( = ?auto_234664 ?auto_234666 ) ) ( not ( = ?auto_234664 ?auto_234667 ) ) ( not ( = ?auto_234664 ?auto_234668 ) ) ( not ( = ?auto_234664 ?auto_234669 ) ) ( not ( = ?auto_234664 ?auto_234670 ) ) ( not ( = ?auto_234664 ?auto_234671 ) ) ( not ( = ?auto_234664 ?auto_234672 ) ) ( not ( = ?auto_234664 ?auto_234673 ) ) ( not ( = ?auto_234664 ?auto_234674 ) ) ( not ( = ?auto_234665 ?auto_234666 ) ) ( not ( = ?auto_234665 ?auto_234667 ) ) ( not ( = ?auto_234665 ?auto_234668 ) ) ( not ( = ?auto_234665 ?auto_234669 ) ) ( not ( = ?auto_234665 ?auto_234670 ) ) ( not ( = ?auto_234665 ?auto_234671 ) ) ( not ( = ?auto_234665 ?auto_234672 ) ) ( not ( = ?auto_234665 ?auto_234673 ) ) ( not ( = ?auto_234665 ?auto_234674 ) ) ( not ( = ?auto_234666 ?auto_234667 ) ) ( not ( = ?auto_234666 ?auto_234668 ) ) ( not ( = ?auto_234666 ?auto_234669 ) ) ( not ( = ?auto_234666 ?auto_234670 ) ) ( not ( = ?auto_234666 ?auto_234671 ) ) ( not ( = ?auto_234666 ?auto_234672 ) ) ( not ( = ?auto_234666 ?auto_234673 ) ) ( not ( = ?auto_234666 ?auto_234674 ) ) ( not ( = ?auto_234667 ?auto_234668 ) ) ( not ( = ?auto_234667 ?auto_234669 ) ) ( not ( = ?auto_234667 ?auto_234670 ) ) ( not ( = ?auto_234667 ?auto_234671 ) ) ( not ( = ?auto_234667 ?auto_234672 ) ) ( not ( = ?auto_234667 ?auto_234673 ) ) ( not ( = ?auto_234667 ?auto_234674 ) ) ( not ( = ?auto_234668 ?auto_234669 ) ) ( not ( = ?auto_234668 ?auto_234670 ) ) ( not ( = ?auto_234668 ?auto_234671 ) ) ( not ( = ?auto_234668 ?auto_234672 ) ) ( not ( = ?auto_234668 ?auto_234673 ) ) ( not ( = ?auto_234668 ?auto_234674 ) ) ( not ( = ?auto_234669 ?auto_234670 ) ) ( not ( = ?auto_234669 ?auto_234671 ) ) ( not ( = ?auto_234669 ?auto_234672 ) ) ( not ( = ?auto_234669 ?auto_234673 ) ) ( not ( = ?auto_234669 ?auto_234674 ) ) ( not ( = ?auto_234670 ?auto_234671 ) ) ( not ( = ?auto_234670 ?auto_234672 ) ) ( not ( = ?auto_234670 ?auto_234673 ) ) ( not ( = ?auto_234670 ?auto_234674 ) ) ( not ( = ?auto_234671 ?auto_234672 ) ) ( not ( = ?auto_234671 ?auto_234673 ) ) ( not ( = ?auto_234671 ?auto_234674 ) ) ( not ( = ?auto_234672 ?auto_234673 ) ) ( not ( = ?auto_234672 ?auto_234674 ) ) ( not ( = ?auto_234673 ?auto_234674 ) ) ( ON ?auto_234672 ?auto_234673 ) ( ON ?auto_234671 ?auto_234672 ) ( ON ?auto_234670 ?auto_234671 ) ( CLEAR ?auto_234668 ) ( ON ?auto_234669 ?auto_234670 ) ( CLEAR ?auto_234669 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_234664 ?auto_234665 ?auto_234666 ?auto_234667 ?auto_234668 ?auto_234669 )
      ( MAKE-10PILE ?auto_234664 ?auto_234665 ?auto_234666 ?auto_234667 ?auto_234668 ?auto_234669 ?auto_234670 ?auto_234671 ?auto_234672 ?auto_234673 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_234685 - BLOCK
      ?auto_234686 - BLOCK
      ?auto_234687 - BLOCK
      ?auto_234688 - BLOCK
      ?auto_234689 - BLOCK
      ?auto_234690 - BLOCK
      ?auto_234691 - BLOCK
      ?auto_234692 - BLOCK
      ?auto_234693 - BLOCK
      ?auto_234694 - BLOCK
    )
    :vars
    (
      ?auto_234695 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_234694 ?auto_234695 ) ( ON-TABLE ?auto_234685 ) ( ON ?auto_234686 ?auto_234685 ) ( ON ?auto_234687 ?auto_234686 ) ( ON ?auto_234688 ?auto_234687 ) ( ON ?auto_234689 ?auto_234688 ) ( not ( = ?auto_234685 ?auto_234686 ) ) ( not ( = ?auto_234685 ?auto_234687 ) ) ( not ( = ?auto_234685 ?auto_234688 ) ) ( not ( = ?auto_234685 ?auto_234689 ) ) ( not ( = ?auto_234685 ?auto_234690 ) ) ( not ( = ?auto_234685 ?auto_234691 ) ) ( not ( = ?auto_234685 ?auto_234692 ) ) ( not ( = ?auto_234685 ?auto_234693 ) ) ( not ( = ?auto_234685 ?auto_234694 ) ) ( not ( = ?auto_234685 ?auto_234695 ) ) ( not ( = ?auto_234686 ?auto_234687 ) ) ( not ( = ?auto_234686 ?auto_234688 ) ) ( not ( = ?auto_234686 ?auto_234689 ) ) ( not ( = ?auto_234686 ?auto_234690 ) ) ( not ( = ?auto_234686 ?auto_234691 ) ) ( not ( = ?auto_234686 ?auto_234692 ) ) ( not ( = ?auto_234686 ?auto_234693 ) ) ( not ( = ?auto_234686 ?auto_234694 ) ) ( not ( = ?auto_234686 ?auto_234695 ) ) ( not ( = ?auto_234687 ?auto_234688 ) ) ( not ( = ?auto_234687 ?auto_234689 ) ) ( not ( = ?auto_234687 ?auto_234690 ) ) ( not ( = ?auto_234687 ?auto_234691 ) ) ( not ( = ?auto_234687 ?auto_234692 ) ) ( not ( = ?auto_234687 ?auto_234693 ) ) ( not ( = ?auto_234687 ?auto_234694 ) ) ( not ( = ?auto_234687 ?auto_234695 ) ) ( not ( = ?auto_234688 ?auto_234689 ) ) ( not ( = ?auto_234688 ?auto_234690 ) ) ( not ( = ?auto_234688 ?auto_234691 ) ) ( not ( = ?auto_234688 ?auto_234692 ) ) ( not ( = ?auto_234688 ?auto_234693 ) ) ( not ( = ?auto_234688 ?auto_234694 ) ) ( not ( = ?auto_234688 ?auto_234695 ) ) ( not ( = ?auto_234689 ?auto_234690 ) ) ( not ( = ?auto_234689 ?auto_234691 ) ) ( not ( = ?auto_234689 ?auto_234692 ) ) ( not ( = ?auto_234689 ?auto_234693 ) ) ( not ( = ?auto_234689 ?auto_234694 ) ) ( not ( = ?auto_234689 ?auto_234695 ) ) ( not ( = ?auto_234690 ?auto_234691 ) ) ( not ( = ?auto_234690 ?auto_234692 ) ) ( not ( = ?auto_234690 ?auto_234693 ) ) ( not ( = ?auto_234690 ?auto_234694 ) ) ( not ( = ?auto_234690 ?auto_234695 ) ) ( not ( = ?auto_234691 ?auto_234692 ) ) ( not ( = ?auto_234691 ?auto_234693 ) ) ( not ( = ?auto_234691 ?auto_234694 ) ) ( not ( = ?auto_234691 ?auto_234695 ) ) ( not ( = ?auto_234692 ?auto_234693 ) ) ( not ( = ?auto_234692 ?auto_234694 ) ) ( not ( = ?auto_234692 ?auto_234695 ) ) ( not ( = ?auto_234693 ?auto_234694 ) ) ( not ( = ?auto_234693 ?auto_234695 ) ) ( not ( = ?auto_234694 ?auto_234695 ) ) ( ON ?auto_234693 ?auto_234694 ) ( ON ?auto_234692 ?auto_234693 ) ( ON ?auto_234691 ?auto_234692 ) ( CLEAR ?auto_234689 ) ( ON ?auto_234690 ?auto_234691 ) ( CLEAR ?auto_234690 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_234685 ?auto_234686 ?auto_234687 ?auto_234688 ?auto_234689 ?auto_234690 )
      ( MAKE-10PILE ?auto_234685 ?auto_234686 ?auto_234687 ?auto_234688 ?auto_234689 ?auto_234690 ?auto_234691 ?auto_234692 ?auto_234693 ?auto_234694 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_234706 - BLOCK
      ?auto_234707 - BLOCK
      ?auto_234708 - BLOCK
      ?auto_234709 - BLOCK
      ?auto_234710 - BLOCK
      ?auto_234711 - BLOCK
      ?auto_234712 - BLOCK
      ?auto_234713 - BLOCK
      ?auto_234714 - BLOCK
      ?auto_234715 - BLOCK
    )
    :vars
    (
      ?auto_234716 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_234715 ?auto_234716 ) ( ON-TABLE ?auto_234706 ) ( ON ?auto_234707 ?auto_234706 ) ( ON ?auto_234708 ?auto_234707 ) ( ON ?auto_234709 ?auto_234708 ) ( not ( = ?auto_234706 ?auto_234707 ) ) ( not ( = ?auto_234706 ?auto_234708 ) ) ( not ( = ?auto_234706 ?auto_234709 ) ) ( not ( = ?auto_234706 ?auto_234710 ) ) ( not ( = ?auto_234706 ?auto_234711 ) ) ( not ( = ?auto_234706 ?auto_234712 ) ) ( not ( = ?auto_234706 ?auto_234713 ) ) ( not ( = ?auto_234706 ?auto_234714 ) ) ( not ( = ?auto_234706 ?auto_234715 ) ) ( not ( = ?auto_234706 ?auto_234716 ) ) ( not ( = ?auto_234707 ?auto_234708 ) ) ( not ( = ?auto_234707 ?auto_234709 ) ) ( not ( = ?auto_234707 ?auto_234710 ) ) ( not ( = ?auto_234707 ?auto_234711 ) ) ( not ( = ?auto_234707 ?auto_234712 ) ) ( not ( = ?auto_234707 ?auto_234713 ) ) ( not ( = ?auto_234707 ?auto_234714 ) ) ( not ( = ?auto_234707 ?auto_234715 ) ) ( not ( = ?auto_234707 ?auto_234716 ) ) ( not ( = ?auto_234708 ?auto_234709 ) ) ( not ( = ?auto_234708 ?auto_234710 ) ) ( not ( = ?auto_234708 ?auto_234711 ) ) ( not ( = ?auto_234708 ?auto_234712 ) ) ( not ( = ?auto_234708 ?auto_234713 ) ) ( not ( = ?auto_234708 ?auto_234714 ) ) ( not ( = ?auto_234708 ?auto_234715 ) ) ( not ( = ?auto_234708 ?auto_234716 ) ) ( not ( = ?auto_234709 ?auto_234710 ) ) ( not ( = ?auto_234709 ?auto_234711 ) ) ( not ( = ?auto_234709 ?auto_234712 ) ) ( not ( = ?auto_234709 ?auto_234713 ) ) ( not ( = ?auto_234709 ?auto_234714 ) ) ( not ( = ?auto_234709 ?auto_234715 ) ) ( not ( = ?auto_234709 ?auto_234716 ) ) ( not ( = ?auto_234710 ?auto_234711 ) ) ( not ( = ?auto_234710 ?auto_234712 ) ) ( not ( = ?auto_234710 ?auto_234713 ) ) ( not ( = ?auto_234710 ?auto_234714 ) ) ( not ( = ?auto_234710 ?auto_234715 ) ) ( not ( = ?auto_234710 ?auto_234716 ) ) ( not ( = ?auto_234711 ?auto_234712 ) ) ( not ( = ?auto_234711 ?auto_234713 ) ) ( not ( = ?auto_234711 ?auto_234714 ) ) ( not ( = ?auto_234711 ?auto_234715 ) ) ( not ( = ?auto_234711 ?auto_234716 ) ) ( not ( = ?auto_234712 ?auto_234713 ) ) ( not ( = ?auto_234712 ?auto_234714 ) ) ( not ( = ?auto_234712 ?auto_234715 ) ) ( not ( = ?auto_234712 ?auto_234716 ) ) ( not ( = ?auto_234713 ?auto_234714 ) ) ( not ( = ?auto_234713 ?auto_234715 ) ) ( not ( = ?auto_234713 ?auto_234716 ) ) ( not ( = ?auto_234714 ?auto_234715 ) ) ( not ( = ?auto_234714 ?auto_234716 ) ) ( not ( = ?auto_234715 ?auto_234716 ) ) ( ON ?auto_234714 ?auto_234715 ) ( ON ?auto_234713 ?auto_234714 ) ( ON ?auto_234712 ?auto_234713 ) ( ON ?auto_234711 ?auto_234712 ) ( CLEAR ?auto_234709 ) ( ON ?auto_234710 ?auto_234711 ) ( CLEAR ?auto_234710 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_234706 ?auto_234707 ?auto_234708 ?auto_234709 ?auto_234710 )
      ( MAKE-10PILE ?auto_234706 ?auto_234707 ?auto_234708 ?auto_234709 ?auto_234710 ?auto_234711 ?auto_234712 ?auto_234713 ?auto_234714 ?auto_234715 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_234727 - BLOCK
      ?auto_234728 - BLOCK
      ?auto_234729 - BLOCK
      ?auto_234730 - BLOCK
      ?auto_234731 - BLOCK
      ?auto_234732 - BLOCK
      ?auto_234733 - BLOCK
      ?auto_234734 - BLOCK
      ?auto_234735 - BLOCK
      ?auto_234736 - BLOCK
    )
    :vars
    (
      ?auto_234737 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_234736 ?auto_234737 ) ( ON-TABLE ?auto_234727 ) ( ON ?auto_234728 ?auto_234727 ) ( ON ?auto_234729 ?auto_234728 ) ( ON ?auto_234730 ?auto_234729 ) ( not ( = ?auto_234727 ?auto_234728 ) ) ( not ( = ?auto_234727 ?auto_234729 ) ) ( not ( = ?auto_234727 ?auto_234730 ) ) ( not ( = ?auto_234727 ?auto_234731 ) ) ( not ( = ?auto_234727 ?auto_234732 ) ) ( not ( = ?auto_234727 ?auto_234733 ) ) ( not ( = ?auto_234727 ?auto_234734 ) ) ( not ( = ?auto_234727 ?auto_234735 ) ) ( not ( = ?auto_234727 ?auto_234736 ) ) ( not ( = ?auto_234727 ?auto_234737 ) ) ( not ( = ?auto_234728 ?auto_234729 ) ) ( not ( = ?auto_234728 ?auto_234730 ) ) ( not ( = ?auto_234728 ?auto_234731 ) ) ( not ( = ?auto_234728 ?auto_234732 ) ) ( not ( = ?auto_234728 ?auto_234733 ) ) ( not ( = ?auto_234728 ?auto_234734 ) ) ( not ( = ?auto_234728 ?auto_234735 ) ) ( not ( = ?auto_234728 ?auto_234736 ) ) ( not ( = ?auto_234728 ?auto_234737 ) ) ( not ( = ?auto_234729 ?auto_234730 ) ) ( not ( = ?auto_234729 ?auto_234731 ) ) ( not ( = ?auto_234729 ?auto_234732 ) ) ( not ( = ?auto_234729 ?auto_234733 ) ) ( not ( = ?auto_234729 ?auto_234734 ) ) ( not ( = ?auto_234729 ?auto_234735 ) ) ( not ( = ?auto_234729 ?auto_234736 ) ) ( not ( = ?auto_234729 ?auto_234737 ) ) ( not ( = ?auto_234730 ?auto_234731 ) ) ( not ( = ?auto_234730 ?auto_234732 ) ) ( not ( = ?auto_234730 ?auto_234733 ) ) ( not ( = ?auto_234730 ?auto_234734 ) ) ( not ( = ?auto_234730 ?auto_234735 ) ) ( not ( = ?auto_234730 ?auto_234736 ) ) ( not ( = ?auto_234730 ?auto_234737 ) ) ( not ( = ?auto_234731 ?auto_234732 ) ) ( not ( = ?auto_234731 ?auto_234733 ) ) ( not ( = ?auto_234731 ?auto_234734 ) ) ( not ( = ?auto_234731 ?auto_234735 ) ) ( not ( = ?auto_234731 ?auto_234736 ) ) ( not ( = ?auto_234731 ?auto_234737 ) ) ( not ( = ?auto_234732 ?auto_234733 ) ) ( not ( = ?auto_234732 ?auto_234734 ) ) ( not ( = ?auto_234732 ?auto_234735 ) ) ( not ( = ?auto_234732 ?auto_234736 ) ) ( not ( = ?auto_234732 ?auto_234737 ) ) ( not ( = ?auto_234733 ?auto_234734 ) ) ( not ( = ?auto_234733 ?auto_234735 ) ) ( not ( = ?auto_234733 ?auto_234736 ) ) ( not ( = ?auto_234733 ?auto_234737 ) ) ( not ( = ?auto_234734 ?auto_234735 ) ) ( not ( = ?auto_234734 ?auto_234736 ) ) ( not ( = ?auto_234734 ?auto_234737 ) ) ( not ( = ?auto_234735 ?auto_234736 ) ) ( not ( = ?auto_234735 ?auto_234737 ) ) ( not ( = ?auto_234736 ?auto_234737 ) ) ( ON ?auto_234735 ?auto_234736 ) ( ON ?auto_234734 ?auto_234735 ) ( ON ?auto_234733 ?auto_234734 ) ( ON ?auto_234732 ?auto_234733 ) ( CLEAR ?auto_234730 ) ( ON ?auto_234731 ?auto_234732 ) ( CLEAR ?auto_234731 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_234727 ?auto_234728 ?auto_234729 ?auto_234730 ?auto_234731 )
      ( MAKE-10PILE ?auto_234727 ?auto_234728 ?auto_234729 ?auto_234730 ?auto_234731 ?auto_234732 ?auto_234733 ?auto_234734 ?auto_234735 ?auto_234736 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_234748 - BLOCK
      ?auto_234749 - BLOCK
      ?auto_234750 - BLOCK
      ?auto_234751 - BLOCK
      ?auto_234752 - BLOCK
      ?auto_234753 - BLOCK
      ?auto_234754 - BLOCK
      ?auto_234755 - BLOCK
      ?auto_234756 - BLOCK
      ?auto_234757 - BLOCK
    )
    :vars
    (
      ?auto_234758 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_234757 ?auto_234758 ) ( ON-TABLE ?auto_234748 ) ( ON ?auto_234749 ?auto_234748 ) ( ON ?auto_234750 ?auto_234749 ) ( not ( = ?auto_234748 ?auto_234749 ) ) ( not ( = ?auto_234748 ?auto_234750 ) ) ( not ( = ?auto_234748 ?auto_234751 ) ) ( not ( = ?auto_234748 ?auto_234752 ) ) ( not ( = ?auto_234748 ?auto_234753 ) ) ( not ( = ?auto_234748 ?auto_234754 ) ) ( not ( = ?auto_234748 ?auto_234755 ) ) ( not ( = ?auto_234748 ?auto_234756 ) ) ( not ( = ?auto_234748 ?auto_234757 ) ) ( not ( = ?auto_234748 ?auto_234758 ) ) ( not ( = ?auto_234749 ?auto_234750 ) ) ( not ( = ?auto_234749 ?auto_234751 ) ) ( not ( = ?auto_234749 ?auto_234752 ) ) ( not ( = ?auto_234749 ?auto_234753 ) ) ( not ( = ?auto_234749 ?auto_234754 ) ) ( not ( = ?auto_234749 ?auto_234755 ) ) ( not ( = ?auto_234749 ?auto_234756 ) ) ( not ( = ?auto_234749 ?auto_234757 ) ) ( not ( = ?auto_234749 ?auto_234758 ) ) ( not ( = ?auto_234750 ?auto_234751 ) ) ( not ( = ?auto_234750 ?auto_234752 ) ) ( not ( = ?auto_234750 ?auto_234753 ) ) ( not ( = ?auto_234750 ?auto_234754 ) ) ( not ( = ?auto_234750 ?auto_234755 ) ) ( not ( = ?auto_234750 ?auto_234756 ) ) ( not ( = ?auto_234750 ?auto_234757 ) ) ( not ( = ?auto_234750 ?auto_234758 ) ) ( not ( = ?auto_234751 ?auto_234752 ) ) ( not ( = ?auto_234751 ?auto_234753 ) ) ( not ( = ?auto_234751 ?auto_234754 ) ) ( not ( = ?auto_234751 ?auto_234755 ) ) ( not ( = ?auto_234751 ?auto_234756 ) ) ( not ( = ?auto_234751 ?auto_234757 ) ) ( not ( = ?auto_234751 ?auto_234758 ) ) ( not ( = ?auto_234752 ?auto_234753 ) ) ( not ( = ?auto_234752 ?auto_234754 ) ) ( not ( = ?auto_234752 ?auto_234755 ) ) ( not ( = ?auto_234752 ?auto_234756 ) ) ( not ( = ?auto_234752 ?auto_234757 ) ) ( not ( = ?auto_234752 ?auto_234758 ) ) ( not ( = ?auto_234753 ?auto_234754 ) ) ( not ( = ?auto_234753 ?auto_234755 ) ) ( not ( = ?auto_234753 ?auto_234756 ) ) ( not ( = ?auto_234753 ?auto_234757 ) ) ( not ( = ?auto_234753 ?auto_234758 ) ) ( not ( = ?auto_234754 ?auto_234755 ) ) ( not ( = ?auto_234754 ?auto_234756 ) ) ( not ( = ?auto_234754 ?auto_234757 ) ) ( not ( = ?auto_234754 ?auto_234758 ) ) ( not ( = ?auto_234755 ?auto_234756 ) ) ( not ( = ?auto_234755 ?auto_234757 ) ) ( not ( = ?auto_234755 ?auto_234758 ) ) ( not ( = ?auto_234756 ?auto_234757 ) ) ( not ( = ?auto_234756 ?auto_234758 ) ) ( not ( = ?auto_234757 ?auto_234758 ) ) ( ON ?auto_234756 ?auto_234757 ) ( ON ?auto_234755 ?auto_234756 ) ( ON ?auto_234754 ?auto_234755 ) ( ON ?auto_234753 ?auto_234754 ) ( ON ?auto_234752 ?auto_234753 ) ( CLEAR ?auto_234750 ) ( ON ?auto_234751 ?auto_234752 ) ( CLEAR ?auto_234751 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_234748 ?auto_234749 ?auto_234750 ?auto_234751 )
      ( MAKE-10PILE ?auto_234748 ?auto_234749 ?auto_234750 ?auto_234751 ?auto_234752 ?auto_234753 ?auto_234754 ?auto_234755 ?auto_234756 ?auto_234757 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_234769 - BLOCK
      ?auto_234770 - BLOCK
      ?auto_234771 - BLOCK
      ?auto_234772 - BLOCK
      ?auto_234773 - BLOCK
      ?auto_234774 - BLOCK
      ?auto_234775 - BLOCK
      ?auto_234776 - BLOCK
      ?auto_234777 - BLOCK
      ?auto_234778 - BLOCK
    )
    :vars
    (
      ?auto_234779 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_234778 ?auto_234779 ) ( ON-TABLE ?auto_234769 ) ( ON ?auto_234770 ?auto_234769 ) ( ON ?auto_234771 ?auto_234770 ) ( not ( = ?auto_234769 ?auto_234770 ) ) ( not ( = ?auto_234769 ?auto_234771 ) ) ( not ( = ?auto_234769 ?auto_234772 ) ) ( not ( = ?auto_234769 ?auto_234773 ) ) ( not ( = ?auto_234769 ?auto_234774 ) ) ( not ( = ?auto_234769 ?auto_234775 ) ) ( not ( = ?auto_234769 ?auto_234776 ) ) ( not ( = ?auto_234769 ?auto_234777 ) ) ( not ( = ?auto_234769 ?auto_234778 ) ) ( not ( = ?auto_234769 ?auto_234779 ) ) ( not ( = ?auto_234770 ?auto_234771 ) ) ( not ( = ?auto_234770 ?auto_234772 ) ) ( not ( = ?auto_234770 ?auto_234773 ) ) ( not ( = ?auto_234770 ?auto_234774 ) ) ( not ( = ?auto_234770 ?auto_234775 ) ) ( not ( = ?auto_234770 ?auto_234776 ) ) ( not ( = ?auto_234770 ?auto_234777 ) ) ( not ( = ?auto_234770 ?auto_234778 ) ) ( not ( = ?auto_234770 ?auto_234779 ) ) ( not ( = ?auto_234771 ?auto_234772 ) ) ( not ( = ?auto_234771 ?auto_234773 ) ) ( not ( = ?auto_234771 ?auto_234774 ) ) ( not ( = ?auto_234771 ?auto_234775 ) ) ( not ( = ?auto_234771 ?auto_234776 ) ) ( not ( = ?auto_234771 ?auto_234777 ) ) ( not ( = ?auto_234771 ?auto_234778 ) ) ( not ( = ?auto_234771 ?auto_234779 ) ) ( not ( = ?auto_234772 ?auto_234773 ) ) ( not ( = ?auto_234772 ?auto_234774 ) ) ( not ( = ?auto_234772 ?auto_234775 ) ) ( not ( = ?auto_234772 ?auto_234776 ) ) ( not ( = ?auto_234772 ?auto_234777 ) ) ( not ( = ?auto_234772 ?auto_234778 ) ) ( not ( = ?auto_234772 ?auto_234779 ) ) ( not ( = ?auto_234773 ?auto_234774 ) ) ( not ( = ?auto_234773 ?auto_234775 ) ) ( not ( = ?auto_234773 ?auto_234776 ) ) ( not ( = ?auto_234773 ?auto_234777 ) ) ( not ( = ?auto_234773 ?auto_234778 ) ) ( not ( = ?auto_234773 ?auto_234779 ) ) ( not ( = ?auto_234774 ?auto_234775 ) ) ( not ( = ?auto_234774 ?auto_234776 ) ) ( not ( = ?auto_234774 ?auto_234777 ) ) ( not ( = ?auto_234774 ?auto_234778 ) ) ( not ( = ?auto_234774 ?auto_234779 ) ) ( not ( = ?auto_234775 ?auto_234776 ) ) ( not ( = ?auto_234775 ?auto_234777 ) ) ( not ( = ?auto_234775 ?auto_234778 ) ) ( not ( = ?auto_234775 ?auto_234779 ) ) ( not ( = ?auto_234776 ?auto_234777 ) ) ( not ( = ?auto_234776 ?auto_234778 ) ) ( not ( = ?auto_234776 ?auto_234779 ) ) ( not ( = ?auto_234777 ?auto_234778 ) ) ( not ( = ?auto_234777 ?auto_234779 ) ) ( not ( = ?auto_234778 ?auto_234779 ) ) ( ON ?auto_234777 ?auto_234778 ) ( ON ?auto_234776 ?auto_234777 ) ( ON ?auto_234775 ?auto_234776 ) ( ON ?auto_234774 ?auto_234775 ) ( ON ?auto_234773 ?auto_234774 ) ( CLEAR ?auto_234771 ) ( ON ?auto_234772 ?auto_234773 ) ( CLEAR ?auto_234772 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_234769 ?auto_234770 ?auto_234771 ?auto_234772 )
      ( MAKE-10PILE ?auto_234769 ?auto_234770 ?auto_234771 ?auto_234772 ?auto_234773 ?auto_234774 ?auto_234775 ?auto_234776 ?auto_234777 ?auto_234778 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_234790 - BLOCK
      ?auto_234791 - BLOCK
      ?auto_234792 - BLOCK
      ?auto_234793 - BLOCK
      ?auto_234794 - BLOCK
      ?auto_234795 - BLOCK
      ?auto_234796 - BLOCK
      ?auto_234797 - BLOCK
      ?auto_234798 - BLOCK
      ?auto_234799 - BLOCK
    )
    :vars
    (
      ?auto_234800 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_234799 ?auto_234800 ) ( ON-TABLE ?auto_234790 ) ( ON ?auto_234791 ?auto_234790 ) ( not ( = ?auto_234790 ?auto_234791 ) ) ( not ( = ?auto_234790 ?auto_234792 ) ) ( not ( = ?auto_234790 ?auto_234793 ) ) ( not ( = ?auto_234790 ?auto_234794 ) ) ( not ( = ?auto_234790 ?auto_234795 ) ) ( not ( = ?auto_234790 ?auto_234796 ) ) ( not ( = ?auto_234790 ?auto_234797 ) ) ( not ( = ?auto_234790 ?auto_234798 ) ) ( not ( = ?auto_234790 ?auto_234799 ) ) ( not ( = ?auto_234790 ?auto_234800 ) ) ( not ( = ?auto_234791 ?auto_234792 ) ) ( not ( = ?auto_234791 ?auto_234793 ) ) ( not ( = ?auto_234791 ?auto_234794 ) ) ( not ( = ?auto_234791 ?auto_234795 ) ) ( not ( = ?auto_234791 ?auto_234796 ) ) ( not ( = ?auto_234791 ?auto_234797 ) ) ( not ( = ?auto_234791 ?auto_234798 ) ) ( not ( = ?auto_234791 ?auto_234799 ) ) ( not ( = ?auto_234791 ?auto_234800 ) ) ( not ( = ?auto_234792 ?auto_234793 ) ) ( not ( = ?auto_234792 ?auto_234794 ) ) ( not ( = ?auto_234792 ?auto_234795 ) ) ( not ( = ?auto_234792 ?auto_234796 ) ) ( not ( = ?auto_234792 ?auto_234797 ) ) ( not ( = ?auto_234792 ?auto_234798 ) ) ( not ( = ?auto_234792 ?auto_234799 ) ) ( not ( = ?auto_234792 ?auto_234800 ) ) ( not ( = ?auto_234793 ?auto_234794 ) ) ( not ( = ?auto_234793 ?auto_234795 ) ) ( not ( = ?auto_234793 ?auto_234796 ) ) ( not ( = ?auto_234793 ?auto_234797 ) ) ( not ( = ?auto_234793 ?auto_234798 ) ) ( not ( = ?auto_234793 ?auto_234799 ) ) ( not ( = ?auto_234793 ?auto_234800 ) ) ( not ( = ?auto_234794 ?auto_234795 ) ) ( not ( = ?auto_234794 ?auto_234796 ) ) ( not ( = ?auto_234794 ?auto_234797 ) ) ( not ( = ?auto_234794 ?auto_234798 ) ) ( not ( = ?auto_234794 ?auto_234799 ) ) ( not ( = ?auto_234794 ?auto_234800 ) ) ( not ( = ?auto_234795 ?auto_234796 ) ) ( not ( = ?auto_234795 ?auto_234797 ) ) ( not ( = ?auto_234795 ?auto_234798 ) ) ( not ( = ?auto_234795 ?auto_234799 ) ) ( not ( = ?auto_234795 ?auto_234800 ) ) ( not ( = ?auto_234796 ?auto_234797 ) ) ( not ( = ?auto_234796 ?auto_234798 ) ) ( not ( = ?auto_234796 ?auto_234799 ) ) ( not ( = ?auto_234796 ?auto_234800 ) ) ( not ( = ?auto_234797 ?auto_234798 ) ) ( not ( = ?auto_234797 ?auto_234799 ) ) ( not ( = ?auto_234797 ?auto_234800 ) ) ( not ( = ?auto_234798 ?auto_234799 ) ) ( not ( = ?auto_234798 ?auto_234800 ) ) ( not ( = ?auto_234799 ?auto_234800 ) ) ( ON ?auto_234798 ?auto_234799 ) ( ON ?auto_234797 ?auto_234798 ) ( ON ?auto_234796 ?auto_234797 ) ( ON ?auto_234795 ?auto_234796 ) ( ON ?auto_234794 ?auto_234795 ) ( ON ?auto_234793 ?auto_234794 ) ( CLEAR ?auto_234791 ) ( ON ?auto_234792 ?auto_234793 ) ( CLEAR ?auto_234792 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_234790 ?auto_234791 ?auto_234792 )
      ( MAKE-10PILE ?auto_234790 ?auto_234791 ?auto_234792 ?auto_234793 ?auto_234794 ?auto_234795 ?auto_234796 ?auto_234797 ?auto_234798 ?auto_234799 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_234811 - BLOCK
      ?auto_234812 - BLOCK
      ?auto_234813 - BLOCK
      ?auto_234814 - BLOCK
      ?auto_234815 - BLOCK
      ?auto_234816 - BLOCK
      ?auto_234817 - BLOCK
      ?auto_234818 - BLOCK
      ?auto_234819 - BLOCK
      ?auto_234820 - BLOCK
    )
    :vars
    (
      ?auto_234821 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_234820 ?auto_234821 ) ( ON-TABLE ?auto_234811 ) ( ON ?auto_234812 ?auto_234811 ) ( not ( = ?auto_234811 ?auto_234812 ) ) ( not ( = ?auto_234811 ?auto_234813 ) ) ( not ( = ?auto_234811 ?auto_234814 ) ) ( not ( = ?auto_234811 ?auto_234815 ) ) ( not ( = ?auto_234811 ?auto_234816 ) ) ( not ( = ?auto_234811 ?auto_234817 ) ) ( not ( = ?auto_234811 ?auto_234818 ) ) ( not ( = ?auto_234811 ?auto_234819 ) ) ( not ( = ?auto_234811 ?auto_234820 ) ) ( not ( = ?auto_234811 ?auto_234821 ) ) ( not ( = ?auto_234812 ?auto_234813 ) ) ( not ( = ?auto_234812 ?auto_234814 ) ) ( not ( = ?auto_234812 ?auto_234815 ) ) ( not ( = ?auto_234812 ?auto_234816 ) ) ( not ( = ?auto_234812 ?auto_234817 ) ) ( not ( = ?auto_234812 ?auto_234818 ) ) ( not ( = ?auto_234812 ?auto_234819 ) ) ( not ( = ?auto_234812 ?auto_234820 ) ) ( not ( = ?auto_234812 ?auto_234821 ) ) ( not ( = ?auto_234813 ?auto_234814 ) ) ( not ( = ?auto_234813 ?auto_234815 ) ) ( not ( = ?auto_234813 ?auto_234816 ) ) ( not ( = ?auto_234813 ?auto_234817 ) ) ( not ( = ?auto_234813 ?auto_234818 ) ) ( not ( = ?auto_234813 ?auto_234819 ) ) ( not ( = ?auto_234813 ?auto_234820 ) ) ( not ( = ?auto_234813 ?auto_234821 ) ) ( not ( = ?auto_234814 ?auto_234815 ) ) ( not ( = ?auto_234814 ?auto_234816 ) ) ( not ( = ?auto_234814 ?auto_234817 ) ) ( not ( = ?auto_234814 ?auto_234818 ) ) ( not ( = ?auto_234814 ?auto_234819 ) ) ( not ( = ?auto_234814 ?auto_234820 ) ) ( not ( = ?auto_234814 ?auto_234821 ) ) ( not ( = ?auto_234815 ?auto_234816 ) ) ( not ( = ?auto_234815 ?auto_234817 ) ) ( not ( = ?auto_234815 ?auto_234818 ) ) ( not ( = ?auto_234815 ?auto_234819 ) ) ( not ( = ?auto_234815 ?auto_234820 ) ) ( not ( = ?auto_234815 ?auto_234821 ) ) ( not ( = ?auto_234816 ?auto_234817 ) ) ( not ( = ?auto_234816 ?auto_234818 ) ) ( not ( = ?auto_234816 ?auto_234819 ) ) ( not ( = ?auto_234816 ?auto_234820 ) ) ( not ( = ?auto_234816 ?auto_234821 ) ) ( not ( = ?auto_234817 ?auto_234818 ) ) ( not ( = ?auto_234817 ?auto_234819 ) ) ( not ( = ?auto_234817 ?auto_234820 ) ) ( not ( = ?auto_234817 ?auto_234821 ) ) ( not ( = ?auto_234818 ?auto_234819 ) ) ( not ( = ?auto_234818 ?auto_234820 ) ) ( not ( = ?auto_234818 ?auto_234821 ) ) ( not ( = ?auto_234819 ?auto_234820 ) ) ( not ( = ?auto_234819 ?auto_234821 ) ) ( not ( = ?auto_234820 ?auto_234821 ) ) ( ON ?auto_234819 ?auto_234820 ) ( ON ?auto_234818 ?auto_234819 ) ( ON ?auto_234817 ?auto_234818 ) ( ON ?auto_234816 ?auto_234817 ) ( ON ?auto_234815 ?auto_234816 ) ( ON ?auto_234814 ?auto_234815 ) ( CLEAR ?auto_234812 ) ( ON ?auto_234813 ?auto_234814 ) ( CLEAR ?auto_234813 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_234811 ?auto_234812 ?auto_234813 )
      ( MAKE-10PILE ?auto_234811 ?auto_234812 ?auto_234813 ?auto_234814 ?auto_234815 ?auto_234816 ?auto_234817 ?auto_234818 ?auto_234819 ?auto_234820 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_234832 - BLOCK
      ?auto_234833 - BLOCK
      ?auto_234834 - BLOCK
      ?auto_234835 - BLOCK
      ?auto_234836 - BLOCK
      ?auto_234837 - BLOCK
      ?auto_234838 - BLOCK
      ?auto_234839 - BLOCK
      ?auto_234840 - BLOCK
      ?auto_234841 - BLOCK
    )
    :vars
    (
      ?auto_234842 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_234841 ?auto_234842 ) ( ON-TABLE ?auto_234832 ) ( not ( = ?auto_234832 ?auto_234833 ) ) ( not ( = ?auto_234832 ?auto_234834 ) ) ( not ( = ?auto_234832 ?auto_234835 ) ) ( not ( = ?auto_234832 ?auto_234836 ) ) ( not ( = ?auto_234832 ?auto_234837 ) ) ( not ( = ?auto_234832 ?auto_234838 ) ) ( not ( = ?auto_234832 ?auto_234839 ) ) ( not ( = ?auto_234832 ?auto_234840 ) ) ( not ( = ?auto_234832 ?auto_234841 ) ) ( not ( = ?auto_234832 ?auto_234842 ) ) ( not ( = ?auto_234833 ?auto_234834 ) ) ( not ( = ?auto_234833 ?auto_234835 ) ) ( not ( = ?auto_234833 ?auto_234836 ) ) ( not ( = ?auto_234833 ?auto_234837 ) ) ( not ( = ?auto_234833 ?auto_234838 ) ) ( not ( = ?auto_234833 ?auto_234839 ) ) ( not ( = ?auto_234833 ?auto_234840 ) ) ( not ( = ?auto_234833 ?auto_234841 ) ) ( not ( = ?auto_234833 ?auto_234842 ) ) ( not ( = ?auto_234834 ?auto_234835 ) ) ( not ( = ?auto_234834 ?auto_234836 ) ) ( not ( = ?auto_234834 ?auto_234837 ) ) ( not ( = ?auto_234834 ?auto_234838 ) ) ( not ( = ?auto_234834 ?auto_234839 ) ) ( not ( = ?auto_234834 ?auto_234840 ) ) ( not ( = ?auto_234834 ?auto_234841 ) ) ( not ( = ?auto_234834 ?auto_234842 ) ) ( not ( = ?auto_234835 ?auto_234836 ) ) ( not ( = ?auto_234835 ?auto_234837 ) ) ( not ( = ?auto_234835 ?auto_234838 ) ) ( not ( = ?auto_234835 ?auto_234839 ) ) ( not ( = ?auto_234835 ?auto_234840 ) ) ( not ( = ?auto_234835 ?auto_234841 ) ) ( not ( = ?auto_234835 ?auto_234842 ) ) ( not ( = ?auto_234836 ?auto_234837 ) ) ( not ( = ?auto_234836 ?auto_234838 ) ) ( not ( = ?auto_234836 ?auto_234839 ) ) ( not ( = ?auto_234836 ?auto_234840 ) ) ( not ( = ?auto_234836 ?auto_234841 ) ) ( not ( = ?auto_234836 ?auto_234842 ) ) ( not ( = ?auto_234837 ?auto_234838 ) ) ( not ( = ?auto_234837 ?auto_234839 ) ) ( not ( = ?auto_234837 ?auto_234840 ) ) ( not ( = ?auto_234837 ?auto_234841 ) ) ( not ( = ?auto_234837 ?auto_234842 ) ) ( not ( = ?auto_234838 ?auto_234839 ) ) ( not ( = ?auto_234838 ?auto_234840 ) ) ( not ( = ?auto_234838 ?auto_234841 ) ) ( not ( = ?auto_234838 ?auto_234842 ) ) ( not ( = ?auto_234839 ?auto_234840 ) ) ( not ( = ?auto_234839 ?auto_234841 ) ) ( not ( = ?auto_234839 ?auto_234842 ) ) ( not ( = ?auto_234840 ?auto_234841 ) ) ( not ( = ?auto_234840 ?auto_234842 ) ) ( not ( = ?auto_234841 ?auto_234842 ) ) ( ON ?auto_234840 ?auto_234841 ) ( ON ?auto_234839 ?auto_234840 ) ( ON ?auto_234838 ?auto_234839 ) ( ON ?auto_234837 ?auto_234838 ) ( ON ?auto_234836 ?auto_234837 ) ( ON ?auto_234835 ?auto_234836 ) ( ON ?auto_234834 ?auto_234835 ) ( CLEAR ?auto_234832 ) ( ON ?auto_234833 ?auto_234834 ) ( CLEAR ?auto_234833 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_234832 ?auto_234833 )
      ( MAKE-10PILE ?auto_234832 ?auto_234833 ?auto_234834 ?auto_234835 ?auto_234836 ?auto_234837 ?auto_234838 ?auto_234839 ?auto_234840 ?auto_234841 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_234853 - BLOCK
      ?auto_234854 - BLOCK
      ?auto_234855 - BLOCK
      ?auto_234856 - BLOCK
      ?auto_234857 - BLOCK
      ?auto_234858 - BLOCK
      ?auto_234859 - BLOCK
      ?auto_234860 - BLOCK
      ?auto_234861 - BLOCK
      ?auto_234862 - BLOCK
    )
    :vars
    (
      ?auto_234863 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_234862 ?auto_234863 ) ( ON-TABLE ?auto_234853 ) ( not ( = ?auto_234853 ?auto_234854 ) ) ( not ( = ?auto_234853 ?auto_234855 ) ) ( not ( = ?auto_234853 ?auto_234856 ) ) ( not ( = ?auto_234853 ?auto_234857 ) ) ( not ( = ?auto_234853 ?auto_234858 ) ) ( not ( = ?auto_234853 ?auto_234859 ) ) ( not ( = ?auto_234853 ?auto_234860 ) ) ( not ( = ?auto_234853 ?auto_234861 ) ) ( not ( = ?auto_234853 ?auto_234862 ) ) ( not ( = ?auto_234853 ?auto_234863 ) ) ( not ( = ?auto_234854 ?auto_234855 ) ) ( not ( = ?auto_234854 ?auto_234856 ) ) ( not ( = ?auto_234854 ?auto_234857 ) ) ( not ( = ?auto_234854 ?auto_234858 ) ) ( not ( = ?auto_234854 ?auto_234859 ) ) ( not ( = ?auto_234854 ?auto_234860 ) ) ( not ( = ?auto_234854 ?auto_234861 ) ) ( not ( = ?auto_234854 ?auto_234862 ) ) ( not ( = ?auto_234854 ?auto_234863 ) ) ( not ( = ?auto_234855 ?auto_234856 ) ) ( not ( = ?auto_234855 ?auto_234857 ) ) ( not ( = ?auto_234855 ?auto_234858 ) ) ( not ( = ?auto_234855 ?auto_234859 ) ) ( not ( = ?auto_234855 ?auto_234860 ) ) ( not ( = ?auto_234855 ?auto_234861 ) ) ( not ( = ?auto_234855 ?auto_234862 ) ) ( not ( = ?auto_234855 ?auto_234863 ) ) ( not ( = ?auto_234856 ?auto_234857 ) ) ( not ( = ?auto_234856 ?auto_234858 ) ) ( not ( = ?auto_234856 ?auto_234859 ) ) ( not ( = ?auto_234856 ?auto_234860 ) ) ( not ( = ?auto_234856 ?auto_234861 ) ) ( not ( = ?auto_234856 ?auto_234862 ) ) ( not ( = ?auto_234856 ?auto_234863 ) ) ( not ( = ?auto_234857 ?auto_234858 ) ) ( not ( = ?auto_234857 ?auto_234859 ) ) ( not ( = ?auto_234857 ?auto_234860 ) ) ( not ( = ?auto_234857 ?auto_234861 ) ) ( not ( = ?auto_234857 ?auto_234862 ) ) ( not ( = ?auto_234857 ?auto_234863 ) ) ( not ( = ?auto_234858 ?auto_234859 ) ) ( not ( = ?auto_234858 ?auto_234860 ) ) ( not ( = ?auto_234858 ?auto_234861 ) ) ( not ( = ?auto_234858 ?auto_234862 ) ) ( not ( = ?auto_234858 ?auto_234863 ) ) ( not ( = ?auto_234859 ?auto_234860 ) ) ( not ( = ?auto_234859 ?auto_234861 ) ) ( not ( = ?auto_234859 ?auto_234862 ) ) ( not ( = ?auto_234859 ?auto_234863 ) ) ( not ( = ?auto_234860 ?auto_234861 ) ) ( not ( = ?auto_234860 ?auto_234862 ) ) ( not ( = ?auto_234860 ?auto_234863 ) ) ( not ( = ?auto_234861 ?auto_234862 ) ) ( not ( = ?auto_234861 ?auto_234863 ) ) ( not ( = ?auto_234862 ?auto_234863 ) ) ( ON ?auto_234861 ?auto_234862 ) ( ON ?auto_234860 ?auto_234861 ) ( ON ?auto_234859 ?auto_234860 ) ( ON ?auto_234858 ?auto_234859 ) ( ON ?auto_234857 ?auto_234858 ) ( ON ?auto_234856 ?auto_234857 ) ( ON ?auto_234855 ?auto_234856 ) ( CLEAR ?auto_234853 ) ( ON ?auto_234854 ?auto_234855 ) ( CLEAR ?auto_234854 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_234853 ?auto_234854 )
      ( MAKE-10PILE ?auto_234853 ?auto_234854 ?auto_234855 ?auto_234856 ?auto_234857 ?auto_234858 ?auto_234859 ?auto_234860 ?auto_234861 ?auto_234862 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_234874 - BLOCK
      ?auto_234875 - BLOCK
      ?auto_234876 - BLOCK
      ?auto_234877 - BLOCK
      ?auto_234878 - BLOCK
      ?auto_234879 - BLOCK
      ?auto_234880 - BLOCK
      ?auto_234881 - BLOCK
      ?auto_234882 - BLOCK
      ?auto_234883 - BLOCK
    )
    :vars
    (
      ?auto_234884 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_234883 ?auto_234884 ) ( not ( = ?auto_234874 ?auto_234875 ) ) ( not ( = ?auto_234874 ?auto_234876 ) ) ( not ( = ?auto_234874 ?auto_234877 ) ) ( not ( = ?auto_234874 ?auto_234878 ) ) ( not ( = ?auto_234874 ?auto_234879 ) ) ( not ( = ?auto_234874 ?auto_234880 ) ) ( not ( = ?auto_234874 ?auto_234881 ) ) ( not ( = ?auto_234874 ?auto_234882 ) ) ( not ( = ?auto_234874 ?auto_234883 ) ) ( not ( = ?auto_234874 ?auto_234884 ) ) ( not ( = ?auto_234875 ?auto_234876 ) ) ( not ( = ?auto_234875 ?auto_234877 ) ) ( not ( = ?auto_234875 ?auto_234878 ) ) ( not ( = ?auto_234875 ?auto_234879 ) ) ( not ( = ?auto_234875 ?auto_234880 ) ) ( not ( = ?auto_234875 ?auto_234881 ) ) ( not ( = ?auto_234875 ?auto_234882 ) ) ( not ( = ?auto_234875 ?auto_234883 ) ) ( not ( = ?auto_234875 ?auto_234884 ) ) ( not ( = ?auto_234876 ?auto_234877 ) ) ( not ( = ?auto_234876 ?auto_234878 ) ) ( not ( = ?auto_234876 ?auto_234879 ) ) ( not ( = ?auto_234876 ?auto_234880 ) ) ( not ( = ?auto_234876 ?auto_234881 ) ) ( not ( = ?auto_234876 ?auto_234882 ) ) ( not ( = ?auto_234876 ?auto_234883 ) ) ( not ( = ?auto_234876 ?auto_234884 ) ) ( not ( = ?auto_234877 ?auto_234878 ) ) ( not ( = ?auto_234877 ?auto_234879 ) ) ( not ( = ?auto_234877 ?auto_234880 ) ) ( not ( = ?auto_234877 ?auto_234881 ) ) ( not ( = ?auto_234877 ?auto_234882 ) ) ( not ( = ?auto_234877 ?auto_234883 ) ) ( not ( = ?auto_234877 ?auto_234884 ) ) ( not ( = ?auto_234878 ?auto_234879 ) ) ( not ( = ?auto_234878 ?auto_234880 ) ) ( not ( = ?auto_234878 ?auto_234881 ) ) ( not ( = ?auto_234878 ?auto_234882 ) ) ( not ( = ?auto_234878 ?auto_234883 ) ) ( not ( = ?auto_234878 ?auto_234884 ) ) ( not ( = ?auto_234879 ?auto_234880 ) ) ( not ( = ?auto_234879 ?auto_234881 ) ) ( not ( = ?auto_234879 ?auto_234882 ) ) ( not ( = ?auto_234879 ?auto_234883 ) ) ( not ( = ?auto_234879 ?auto_234884 ) ) ( not ( = ?auto_234880 ?auto_234881 ) ) ( not ( = ?auto_234880 ?auto_234882 ) ) ( not ( = ?auto_234880 ?auto_234883 ) ) ( not ( = ?auto_234880 ?auto_234884 ) ) ( not ( = ?auto_234881 ?auto_234882 ) ) ( not ( = ?auto_234881 ?auto_234883 ) ) ( not ( = ?auto_234881 ?auto_234884 ) ) ( not ( = ?auto_234882 ?auto_234883 ) ) ( not ( = ?auto_234882 ?auto_234884 ) ) ( not ( = ?auto_234883 ?auto_234884 ) ) ( ON ?auto_234882 ?auto_234883 ) ( ON ?auto_234881 ?auto_234882 ) ( ON ?auto_234880 ?auto_234881 ) ( ON ?auto_234879 ?auto_234880 ) ( ON ?auto_234878 ?auto_234879 ) ( ON ?auto_234877 ?auto_234878 ) ( ON ?auto_234876 ?auto_234877 ) ( ON ?auto_234875 ?auto_234876 ) ( ON ?auto_234874 ?auto_234875 ) ( CLEAR ?auto_234874 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_234874 )
      ( MAKE-10PILE ?auto_234874 ?auto_234875 ?auto_234876 ?auto_234877 ?auto_234878 ?auto_234879 ?auto_234880 ?auto_234881 ?auto_234882 ?auto_234883 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_234895 - BLOCK
      ?auto_234896 - BLOCK
      ?auto_234897 - BLOCK
      ?auto_234898 - BLOCK
      ?auto_234899 - BLOCK
      ?auto_234900 - BLOCK
      ?auto_234901 - BLOCK
      ?auto_234902 - BLOCK
      ?auto_234903 - BLOCK
      ?auto_234904 - BLOCK
    )
    :vars
    (
      ?auto_234905 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_234904 ?auto_234905 ) ( not ( = ?auto_234895 ?auto_234896 ) ) ( not ( = ?auto_234895 ?auto_234897 ) ) ( not ( = ?auto_234895 ?auto_234898 ) ) ( not ( = ?auto_234895 ?auto_234899 ) ) ( not ( = ?auto_234895 ?auto_234900 ) ) ( not ( = ?auto_234895 ?auto_234901 ) ) ( not ( = ?auto_234895 ?auto_234902 ) ) ( not ( = ?auto_234895 ?auto_234903 ) ) ( not ( = ?auto_234895 ?auto_234904 ) ) ( not ( = ?auto_234895 ?auto_234905 ) ) ( not ( = ?auto_234896 ?auto_234897 ) ) ( not ( = ?auto_234896 ?auto_234898 ) ) ( not ( = ?auto_234896 ?auto_234899 ) ) ( not ( = ?auto_234896 ?auto_234900 ) ) ( not ( = ?auto_234896 ?auto_234901 ) ) ( not ( = ?auto_234896 ?auto_234902 ) ) ( not ( = ?auto_234896 ?auto_234903 ) ) ( not ( = ?auto_234896 ?auto_234904 ) ) ( not ( = ?auto_234896 ?auto_234905 ) ) ( not ( = ?auto_234897 ?auto_234898 ) ) ( not ( = ?auto_234897 ?auto_234899 ) ) ( not ( = ?auto_234897 ?auto_234900 ) ) ( not ( = ?auto_234897 ?auto_234901 ) ) ( not ( = ?auto_234897 ?auto_234902 ) ) ( not ( = ?auto_234897 ?auto_234903 ) ) ( not ( = ?auto_234897 ?auto_234904 ) ) ( not ( = ?auto_234897 ?auto_234905 ) ) ( not ( = ?auto_234898 ?auto_234899 ) ) ( not ( = ?auto_234898 ?auto_234900 ) ) ( not ( = ?auto_234898 ?auto_234901 ) ) ( not ( = ?auto_234898 ?auto_234902 ) ) ( not ( = ?auto_234898 ?auto_234903 ) ) ( not ( = ?auto_234898 ?auto_234904 ) ) ( not ( = ?auto_234898 ?auto_234905 ) ) ( not ( = ?auto_234899 ?auto_234900 ) ) ( not ( = ?auto_234899 ?auto_234901 ) ) ( not ( = ?auto_234899 ?auto_234902 ) ) ( not ( = ?auto_234899 ?auto_234903 ) ) ( not ( = ?auto_234899 ?auto_234904 ) ) ( not ( = ?auto_234899 ?auto_234905 ) ) ( not ( = ?auto_234900 ?auto_234901 ) ) ( not ( = ?auto_234900 ?auto_234902 ) ) ( not ( = ?auto_234900 ?auto_234903 ) ) ( not ( = ?auto_234900 ?auto_234904 ) ) ( not ( = ?auto_234900 ?auto_234905 ) ) ( not ( = ?auto_234901 ?auto_234902 ) ) ( not ( = ?auto_234901 ?auto_234903 ) ) ( not ( = ?auto_234901 ?auto_234904 ) ) ( not ( = ?auto_234901 ?auto_234905 ) ) ( not ( = ?auto_234902 ?auto_234903 ) ) ( not ( = ?auto_234902 ?auto_234904 ) ) ( not ( = ?auto_234902 ?auto_234905 ) ) ( not ( = ?auto_234903 ?auto_234904 ) ) ( not ( = ?auto_234903 ?auto_234905 ) ) ( not ( = ?auto_234904 ?auto_234905 ) ) ( ON ?auto_234903 ?auto_234904 ) ( ON ?auto_234902 ?auto_234903 ) ( ON ?auto_234901 ?auto_234902 ) ( ON ?auto_234900 ?auto_234901 ) ( ON ?auto_234899 ?auto_234900 ) ( ON ?auto_234898 ?auto_234899 ) ( ON ?auto_234897 ?auto_234898 ) ( ON ?auto_234896 ?auto_234897 ) ( ON ?auto_234895 ?auto_234896 ) ( CLEAR ?auto_234895 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_234895 )
      ( MAKE-10PILE ?auto_234895 ?auto_234896 ?auto_234897 ?auto_234898 ?auto_234899 ?auto_234900 ?auto_234901 ?auto_234902 ?auto_234903 ?auto_234904 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_234917 - BLOCK
      ?auto_234918 - BLOCK
      ?auto_234919 - BLOCK
      ?auto_234920 - BLOCK
      ?auto_234921 - BLOCK
      ?auto_234922 - BLOCK
      ?auto_234923 - BLOCK
      ?auto_234924 - BLOCK
      ?auto_234925 - BLOCK
      ?auto_234926 - BLOCK
      ?auto_234927 - BLOCK
    )
    :vars
    (
      ?auto_234928 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_234926 ) ( ON ?auto_234927 ?auto_234928 ) ( CLEAR ?auto_234927 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_234917 ) ( ON ?auto_234918 ?auto_234917 ) ( ON ?auto_234919 ?auto_234918 ) ( ON ?auto_234920 ?auto_234919 ) ( ON ?auto_234921 ?auto_234920 ) ( ON ?auto_234922 ?auto_234921 ) ( ON ?auto_234923 ?auto_234922 ) ( ON ?auto_234924 ?auto_234923 ) ( ON ?auto_234925 ?auto_234924 ) ( ON ?auto_234926 ?auto_234925 ) ( not ( = ?auto_234917 ?auto_234918 ) ) ( not ( = ?auto_234917 ?auto_234919 ) ) ( not ( = ?auto_234917 ?auto_234920 ) ) ( not ( = ?auto_234917 ?auto_234921 ) ) ( not ( = ?auto_234917 ?auto_234922 ) ) ( not ( = ?auto_234917 ?auto_234923 ) ) ( not ( = ?auto_234917 ?auto_234924 ) ) ( not ( = ?auto_234917 ?auto_234925 ) ) ( not ( = ?auto_234917 ?auto_234926 ) ) ( not ( = ?auto_234917 ?auto_234927 ) ) ( not ( = ?auto_234917 ?auto_234928 ) ) ( not ( = ?auto_234918 ?auto_234919 ) ) ( not ( = ?auto_234918 ?auto_234920 ) ) ( not ( = ?auto_234918 ?auto_234921 ) ) ( not ( = ?auto_234918 ?auto_234922 ) ) ( not ( = ?auto_234918 ?auto_234923 ) ) ( not ( = ?auto_234918 ?auto_234924 ) ) ( not ( = ?auto_234918 ?auto_234925 ) ) ( not ( = ?auto_234918 ?auto_234926 ) ) ( not ( = ?auto_234918 ?auto_234927 ) ) ( not ( = ?auto_234918 ?auto_234928 ) ) ( not ( = ?auto_234919 ?auto_234920 ) ) ( not ( = ?auto_234919 ?auto_234921 ) ) ( not ( = ?auto_234919 ?auto_234922 ) ) ( not ( = ?auto_234919 ?auto_234923 ) ) ( not ( = ?auto_234919 ?auto_234924 ) ) ( not ( = ?auto_234919 ?auto_234925 ) ) ( not ( = ?auto_234919 ?auto_234926 ) ) ( not ( = ?auto_234919 ?auto_234927 ) ) ( not ( = ?auto_234919 ?auto_234928 ) ) ( not ( = ?auto_234920 ?auto_234921 ) ) ( not ( = ?auto_234920 ?auto_234922 ) ) ( not ( = ?auto_234920 ?auto_234923 ) ) ( not ( = ?auto_234920 ?auto_234924 ) ) ( not ( = ?auto_234920 ?auto_234925 ) ) ( not ( = ?auto_234920 ?auto_234926 ) ) ( not ( = ?auto_234920 ?auto_234927 ) ) ( not ( = ?auto_234920 ?auto_234928 ) ) ( not ( = ?auto_234921 ?auto_234922 ) ) ( not ( = ?auto_234921 ?auto_234923 ) ) ( not ( = ?auto_234921 ?auto_234924 ) ) ( not ( = ?auto_234921 ?auto_234925 ) ) ( not ( = ?auto_234921 ?auto_234926 ) ) ( not ( = ?auto_234921 ?auto_234927 ) ) ( not ( = ?auto_234921 ?auto_234928 ) ) ( not ( = ?auto_234922 ?auto_234923 ) ) ( not ( = ?auto_234922 ?auto_234924 ) ) ( not ( = ?auto_234922 ?auto_234925 ) ) ( not ( = ?auto_234922 ?auto_234926 ) ) ( not ( = ?auto_234922 ?auto_234927 ) ) ( not ( = ?auto_234922 ?auto_234928 ) ) ( not ( = ?auto_234923 ?auto_234924 ) ) ( not ( = ?auto_234923 ?auto_234925 ) ) ( not ( = ?auto_234923 ?auto_234926 ) ) ( not ( = ?auto_234923 ?auto_234927 ) ) ( not ( = ?auto_234923 ?auto_234928 ) ) ( not ( = ?auto_234924 ?auto_234925 ) ) ( not ( = ?auto_234924 ?auto_234926 ) ) ( not ( = ?auto_234924 ?auto_234927 ) ) ( not ( = ?auto_234924 ?auto_234928 ) ) ( not ( = ?auto_234925 ?auto_234926 ) ) ( not ( = ?auto_234925 ?auto_234927 ) ) ( not ( = ?auto_234925 ?auto_234928 ) ) ( not ( = ?auto_234926 ?auto_234927 ) ) ( not ( = ?auto_234926 ?auto_234928 ) ) ( not ( = ?auto_234927 ?auto_234928 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_234927 ?auto_234928 )
      ( !STACK ?auto_234927 ?auto_234926 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_234940 - BLOCK
      ?auto_234941 - BLOCK
      ?auto_234942 - BLOCK
      ?auto_234943 - BLOCK
      ?auto_234944 - BLOCK
      ?auto_234945 - BLOCK
      ?auto_234946 - BLOCK
      ?auto_234947 - BLOCK
      ?auto_234948 - BLOCK
      ?auto_234949 - BLOCK
      ?auto_234950 - BLOCK
    )
    :vars
    (
      ?auto_234951 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_234949 ) ( ON ?auto_234950 ?auto_234951 ) ( CLEAR ?auto_234950 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_234940 ) ( ON ?auto_234941 ?auto_234940 ) ( ON ?auto_234942 ?auto_234941 ) ( ON ?auto_234943 ?auto_234942 ) ( ON ?auto_234944 ?auto_234943 ) ( ON ?auto_234945 ?auto_234944 ) ( ON ?auto_234946 ?auto_234945 ) ( ON ?auto_234947 ?auto_234946 ) ( ON ?auto_234948 ?auto_234947 ) ( ON ?auto_234949 ?auto_234948 ) ( not ( = ?auto_234940 ?auto_234941 ) ) ( not ( = ?auto_234940 ?auto_234942 ) ) ( not ( = ?auto_234940 ?auto_234943 ) ) ( not ( = ?auto_234940 ?auto_234944 ) ) ( not ( = ?auto_234940 ?auto_234945 ) ) ( not ( = ?auto_234940 ?auto_234946 ) ) ( not ( = ?auto_234940 ?auto_234947 ) ) ( not ( = ?auto_234940 ?auto_234948 ) ) ( not ( = ?auto_234940 ?auto_234949 ) ) ( not ( = ?auto_234940 ?auto_234950 ) ) ( not ( = ?auto_234940 ?auto_234951 ) ) ( not ( = ?auto_234941 ?auto_234942 ) ) ( not ( = ?auto_234941 ?auto_234943 ) ) ( not ( = ?auto_234941 ?auto_234944 ) ) ( not ( = ?auto_234941 ?auto_234945 ) ) ( not ( = ?auto_234941 ?auto_234946 ) ) ( not ( = ?auto_234941 ?auto_234947 ) ) ( not ( = ?auto_234941 ?auto_234948 ) ) ( not ( = ?auto_234941 ?auto_234949 ) ) ( not ( = ?auto_234941 ?auto_234950 ) ) ( not ( = ?auto_234941 ?auto_234951 ) ) ( not ( = ?auto_234942 ?auto_234943 ) ) ( not ( = ?auto_234942 ?auto_234944 ) ) ( not ( = ?auto_234942 ?auto_234945 ) ) ( not ( = ?auto_234942 ?auto_234946 ) ) ( not ( = ?auto_234942 ?auto_234947 ) ) ( not ( = ?auto_234942 ?auto_234948 ) ) ( not ( = ?auto_234942 ?auto_234949 ) ) ( not ( = ?auto_234942 ?auto_234950 ) ) ( not ( = ?auto_234942 ?auto_234951 ) ) ( not ( = ?auto_234943 ?auto_234944 ) ) ( not ( = ?auto_234943 ?auto_234945 ) ) ( not ( = ?auto_234943 ?auto_234946 ) ) ( not ( = ?auto_234943 ?auto_234947 ) ) ( not ( = ?auto_234943 ?auto_234948 ) ) ( not ( = ?auto_234943 ?auto_234949 ) ) ( not ( = ?auto_234943 ?auto_234950 ) ) ( not ( = ?auto_234943 ?auto_234951 ) ) ( not ( = ?auto_234944 ?auto_234945 ) ) ( not ( = ?auto_234944 ?auto_234946 ) ) ( not ( = ?auto_234944 ?auto_234947 ) ) ( not ( = ?auto_234944 ?auto_234948 ) ) ( not ( = ?auto_234944 ?auto_234949 ) ) ( not ( = ?auto_234944 ?auto_234950 ) ) ( not ( = ?auto_234944 ?auto_234951 ) ) ( not ( = ?auto_234945 ?auto_234946 ) ) ( not ( = ?auto_234945 ?auto_234947 ) ) ( not ( = ?auto_234945 ?auto_234948 ) ) ( not ( = ?auto_234945 ?auto_234949 ) ) ( not ( = ?auto_234945 ?auto_234950 ) ) ( not ( = ?auto_234945 ?auto_234951 ) ) ( not ( = ?auto_234946 ?auto_234947 ) ) ( not ( = ?auto_234946 ?auto_234948 ) ) ( not ( = ?auto_234946 ?auto_234949 ) ) ( not ( = ?auto_234946 ?auto_234950 ) ) ( not ( = ?auto_234946 ?auto_234951 ) ) ( not ( = ?auto_234947 ?auto_234948 ) ) ( not ( = ?auto_234947 ?auto_234949 ) ) ( not ( = ?auto_234947 ?auto_234950 ) ) ( not ( = ?auto_234947 ?auto_234951 ) ) ( not ( = ?auto_234948 ?auto_234949 ) ) ( not ( = ?auto_234948 ?auto_234950 ) ) ( not ( = ?auto_234948 ?auto_234951 ) ) ( not ( = ?auto_234949 ?auto_234950 ) ) ( not ( = ?auto_234949 ?auto_234951 ) ) ( not ( = ?auto_234950 ?auto_234951 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_234950 ?auto_234951 )
      ( !STACK ?auto_234950 ?auto_234949 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_234963 - BLOCK
      ?auto_234964 - BLOCK
      ?auto_234965 - BLOCK
      ?auto_234966 - BLOCK
      ?auto_234967 - BLOCK
      ?auto_234968 - BLOCK
      ?auto_234969 - BLOCK
      ?auto_234970 - BLOCK
      ?auto_234971 - BLOCK
      ?auto_234972 - BLOCK
      ?auto_234973 - BLOCK
    )
    :vars
    (
      ?auto_234974 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_234973 ?auto_234974 ) ( ON-TABLE ?auto_234963 ) ( ON ?auto_234964 ?auto_234963 ) ( ON ?auto_234965 ?auto_234964 ) ( ON ?auto_234966 ?auto_234965 ) ( ON ?auto_234967 ?auto_234966 ) ( ON ?auto_234968 ?auto_234967 ) ( ON ?auto_234969 ?auto_234968 ) ( ON ?auto_234970 ?auto_234969 ) ( ON ?auto_234971 ?auto_234970 ) ( not ( = ?auto_234963 ?auto_234964 ) ) ( not ( = ?auto_234963 ?auto_234965 ) ) ( not ( = ?auto_234963 ?auto_234966 ) ) ( not ( = ?auto_234963 ?auto_234967 ) ) ( not ( = ?auto_234963 ?auto_234968 ) ) ( not ( = ?auto_234963 ?auto_234969 ) ) ( not ( = ?auto_234963 ?auto_234970 ) ) ( not ( = ?auto_234963 ?auto_234971 ) ) ( not ( = ?auto_234963 ?auto_234972 ) ) ( not ( = ?auto_234963 ?auto_234973 ) ) ( not ( = ?auto_234963 ?auto_234974 ) ) ( not ( = ?auto_234964 ?auto_234965 ) ) ( not ( = ?auto_234964 ?auto_234966 ) ) ( not ( = ?auto_234964 ?auto_234967 ) ) ( not ( = ?auto_234964 ?auto_234968 ) ) ( not ( = ?auto_234964 ?auto_234969 ) ) ( not ( = ?auto_234964 ?auto_234970 ) ) ( not ( = ?auto_234964 ?auto_234971 ) ) ( not ( = ?auto_234964 ?auto_234972 ) ) ( not ( = ?auto_234964 ?auto_234973 ) ) ( not ( = ?auto_234964 ?auto_234974 ) ) ( not ( = ?auto_234965 ?auto_234966 ) ) ( not ( = ?auto_234965 ?auto_234967 ) ) ( not ( = ?auto_234965 ?auto_234968 ) ) ( not ( = ?auto_234965 ?auto_234969 ) ) ( not ( = ?auto_234965 ?auto_234970 ) ) ( not ( = ?auto_234965 ?auto_234971 ) ) ( not ( = ?auto_234965 ?auto_234972 ) ) ( not ( = ?auto_234965 ?auto_234973 ) ) ( not ( = ?auto_234965 ?auto_234974 ) ) ( not ( = ?auto_234966 ?auto_234967 ) ) ( not ( = ?auto_234966 ?auto_234968 ) ) ( not ( = ?auto_234966 ?auto_234969 ) ) ( not ( = ?auto_234966 ?auto_234970 ) ) ( not ( = ?auto_234966 ?auto_234971 ) ) ( not ( = ?auto_234966 ?auto_234972 ) ) ( not ( = ?auto_234966 ?auto_234973 ) ) ( not ( = ?auto_234966 ?auto_234974 ) ) ( not ( = ?auto_234967 ?auto_234968 ) ) ( not ( = ?auto_234967 ?auto_234969 ) ) ( not ( = ?auto_234967 ?auto_234970 ) ) ( not ( = ?auto_234967 ?auto_234971 ) ) ( not ( = ?auto_234967 ?auto_234972 ) ) ( not ( = ?auto_234967 ?auto_234973 ) ) ( not ( = ?auto_234967 ?auto_234974 ) ) ( not ( = ?auto_234968 ?auto_234969 ) ) ( not ( = ?auto_234968 ?auto_234970 ) ) ( not ( = ?auto_234968 ?auto_234971 ) ) ( not ( = ?auto_234968 ?auto_234972 ) ) ( not ( = ?auto_234968 ?auto_234973 ) ) ( not ( = ?auto_234968 ?auto_234974 ) ) ( not ( = ?auto_234969 ?auto_234970 ) ) ( not ( = ?auto_234969 ?auto_234971 ) ) ( not ( = ?auto_234969 ?auto_234972 ) ) ( not ( = ?auto_234969 ?auto_234973 ) ) ( not ( = ?auto_234969 ?auto_234974 ) ) ( not ( = ?auto_234970 ?auto_234971 ) ) ( not ( = ?auto_234970 ?auto_234972 ) ) ( not ( = ?auto_234970 ?auto_234973 ) ) ( not ( = ?auto_234970 ?auto_234974 ) ) ( not ( = ?auto_234971 ?auto_234972 ) ) ( not ( = ?auto_234971 ?auto_234973 ) ) ( not ( = ?auto_234971 ?auto_234974 ) ) ( not ( = ?auto_234972 ?auto_234973 ) ) ( not ( = ?auto_234972 ?auto_234974 ) ) ( not ( = ?auto_234973 ?auto_234974 ) ) ( CLEAR ?auto_234971 ) ( ON ?auto_234972 ?auto_234973 ) ( CLEAR ?auto_234972 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_234963 ?auto_234964 ?auto_234965 ?auto_234966 ?auto_234967 ?auto_234968 ?auto_234969 ?auto_234970 ?auto_234971 ?auto_234972 )
      ( MAKE-11PILE ?auto_234963 ?auto_234964 ?auto_234965 ?auto_234966 ?auto_234967 ?auto_234968 ?auto_234969 ?auto_234970 ?auto_234971 ?auto_234972 ?auto_234973 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_234986 - BLOCK
      ?auto_234987 - BLOCK
      ?auto_234988 - BLOCK
      ?auto_234989 - BLOCK
      ?auto_234990 - BLOCK
      ?auto_234991 - BLOCK
      ?auto_234992 - BLOCK
      ?auto_234993 - BLOCK
      ?auto_234994 - BLOCK
      ?auto_234995 - BLOCK
      ?auto_234996 - BLOCK
    )
    :vars
    (
      ?auto_234997 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_234996 ?auto_234997 ) ( ON-TABLE ?auto_234986 ) ( ON ?auto_234987 ?auto_234986 ) ( ON ?auto_234988 ?auto_234987 ) ( ON ?auto_234989 ?auto_234988 ) ( ON ?auto_234990 ?auto_234989 ) ( ON ?auto_234991 ?auto_234990 ) ( ON ?auto_234992 ?auto_234991 ) ( ON ?auto_234993 ?auto_234992 ) ( ON ?auto_234994 ?auto_234993 ) ( not ( = ?auto_234986 ?auto_234987 ) ) ( not ( = ?auto_234986 ?auto_234988 ) ) ( not ( = ?auto_234986 ?auto_234989 ) ) ( not ( = ?auto_234986 ?auto_234990 ) ) ( not ( = ?auto_234986 ?auto_234991 ) ) ( not ( = ?auto_234986 ?auto_234992 ) ) ( not ( = ?auto_234986 ?auto_234993 ) ) ( not ( = ?auto_234986 ?auto_234994 ) ) ( not ( = ?auto_234986 ?auto_234995 ) ) ( not ( = ?auto_234986 ?auto_234996 ) ) ( not ( = ?auto_234986 ?auto_234997 ) ) ( not ( = ?auto_234987 ?auto_234988 ) ) ( not ( = ?auto_234987 ?auto_234989 ) ) ( not ( = ?auto_234987 ?auto_234990 ) ) ( not ( = ?auto_234987 ?auto_234991 ) ) ( not ( = ?auto_234987 ?auto_234992 ) ) ( not ( = ?auto_234987 ?auto_234993 ) ) ( not ( = ?auto_234987 ?auto_234994 ) ) ( not ( = ?auto_234987 ?auto_234995 ) ) ( not ( = ?auto_234987 ?auto_234996 ) ) ( not ( = ?auto_234987 ?auto_234997 ) ) ( not ( = ?auto_234988 ?auto_234989 ) ) ( not ( = ?auto_234988 ?auto_234990 ) ) ( not ( = ?auto_234988 ?auto_234991 ) ) ( not ( = ?auto_234988 ?auto_234992 ) ) ( not ( = ?auto_234988 ?auto_234993 ) ) ( not ( = ?auto_234988 ?auto_234994 ) ) ( not ( = ?auto_234988 ?auto_234995 ) ) ( not ( = ?auto_234988 ?auto_234996 ) ) ( not ( = ?auto_234988 ?auto_234997 ) ) ( not ( = ?auto_234989 ?auto_234990 ) ) ( not ( = ?auto_234989 ?auto_234991 ) ) ( not ( = ?auto_234989 ?auto_234992 ) ) ( not ( = ?auto_234989 ?auto_234993 ) ) ( not ( = ?auto_234989 ?auto_234994 ) ) ( not ( = ?auto_234989 ?auto_234995 ) ) ( not ( = ?auto_234989 ?auto_234996 ) ) ( not ( = ?auto_234989 ?auto_234997 ) ) ( not ( = ?auto_234990 ?auto_234991 ) ) ( not ( = ?auto_234990 ?auto_234992 ) ) ( not ( = ?auto_234990 ?auto_234993 ) ) ( not ( = ?auto_234990 ?auto_234994 ) ) ( not ( = ?auto_234990 ?auto_234995 ) ) ( not ( = ?auto_234990 ?auto_234996 ) ) ( not ( = ?auto_234990 ?auto_234997 ) ) ( not ( = ?auto_234991 ?auto_234992 ) ) ( not ( = ?auto_234991 ?auto_234993 ) ) ( not ( = ?auto_234991 ?auto_234994 ) ) ( not ( = ?auto_234991 ?auto_234995 ) ) ( not ( = ?auto_234991 ?auto_234996 ) ) ( not ( = ?auto_234991 ?auto_234997 ) ) ( not ( = ?auto_234992 ?auto_234993 ) ) ( not ( = ?auto_234992 ?auto_234994 ) ) ( not ( = ?auto_234992 ?auto_234995 ) ) ( not ( = ?auto_234992 ?auto_234996 ) ) ( not ( = ?auto_234992 ?auto_234997 ) ) ( not ( = ?auto_234993 ?auto_234994 ) ) ( not ( = ?auto_234993 ?auto_234995 ) ) ( not ( = ?auto_234993 ?auto_234996 ) ) ( not ( = ?auto_234993 ?auto_234997 ) ) ( not ( = ?auto_234994 ?auto_234995 ) ) ( not ( = ?auto_234994 ?auto_234996 ) ) ( not ( = ?auto_234994 ?auto_234997 ) ) ( not ( = ?auto_234995 ?auto_234996 ) ) ( not ( = ?auto_234995 ?auto_234997 ) ) ( not ( = ?auto_234996 ?auto_234997 ) ) ( CLEAR ?auto_234994 ) ( ON ?auto_234995 ?auto_234996 ) ( CLEAR ?auto_234995 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_234986 ?auto_234987 ?auto_234988 ?auto_234989 ?auto_234990 ?auto_234991 ?auto_234992 ?auto_234993 ?auto_234994 ?auto_234995 )
      ( MAKE-11PILE ?auto_234986 ?auto_234987 ?auto_234988 ?auto_234989 ?auto_234990 ?auto_234991 ?auto_234992 ?auto_234993 ?auto_234994 ?auto_234995 ?auto_234996 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_235009 - BLOCK
      ?auto_235010 - BLOCK
      ?auto_235011 - BLOCK
      ?auto_235012 - BLOCK
      ?auto_235013 - BLOCK
      ?auto_235014 - BLOCK
      ?auto_235015 - BLOCK
      ?auto_235016 - BLOCK
      ?auto_235017 - BLOCK
      ?auto_235018 - BLOCK
      ?auto_235019 - BLOCK
    )
    :vars
    (
      ?auto_235020 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_235019 ?auto_235020 ) ( ON-TABLE ?auto_235009 ) ( ON ?auto_235010 ?auto_235009 ) ( ON ?auto_235011 ?auto_235010 ) ( ON ?auto_235012 ?auto_235011 ) ( ON ?auto_235013 ?auto_235012 ) ( ON ?auto_235014 ?auto_235013 ) ( ON ?auto_235015 ?auto_235014 ) ( ON ?auto_235016 ?auto_235015 ) ( not ( = ?auto_235009 ?auto_235010 ) ) ( not ( = ?auto_235009 ?auto_235011 ) ) ( not ( = ?auto_235009 ?auto_235012 ) ) ( not ( = ?auto_235009 ?auto_235013 ) ) ( not ( = ?auto_235009 ?auto_235014 ) ) ( not ( = ?auto_235009 ?auto_235015 ) ) ( not ( = ?auto_235009 ?auto_235016 ) ) ( not ( = ?auto_235009 ?auto_235017 ) ) ( not ( = ?auto_235009 ?auto_235018 ) ) ( not ( = ?auto_235009 ?auto_235019 ) ) ( not ( = ?auto_235009 ?auto_235020 ) ) ( not ( = ?auto_235010 ?auto_235011 ) ) ( not ( = ?auto_235010 ?auto_235012 ) ) ( not ( = ?auto_235010 ?auto_235013 ) ) ( not ( = ?auto_235010 ?auto_235014 ) ) ( not ( = ?auto_235010 ?auto_235015 ) ) ( not ( = ?auto_235010 ?auto_235016 ) ) ( not ( = ?auto_235010 ?auto_235017 ) ) ( not ( = ?auto_235010 ?auto_235018 ) ) ( not ( = ?auto_235010 ?auto_235019 ) ) ( not ( = ?auto_235010 ?auto_235020 ) ) ( not ( = ?auto_235011 ?auto_235012 ) ) ( not ( = ?auto_235011 ?auto_235013 ) ) ( not ( = ?auto_235011 ?auto_235014 ) ) ( not ( = ?auto_235011 ?auto_235015 ) ) ( not ( = ?auto_235011 ?auto_235016 ) ) ( not ( = ?auto_235011 ?auto_235017 ) ) ( not ( = ?auto_235011 ?auto_235018 ) ) ( not ( = ?auto_235011 ?auto_235019 ) ) ( not ( = ?auto_235011 ?auto_235020 ) ) ( not ( = ?auto_235012 ?auto_235013 ) ) ( not ( = ?auto_235012 ?auto_235014 ) ) ( not ( = ?auto_235012 ?auto_235015 ) ) ( not ( = ?auto_235012 ?auto_235016 ) ) ( not ( = ?auto_235012 ?auto_235017 ) ) ( not ( = ?auto_235012 ?auto_235018 ) ) ( not ( = ?auto_235012 ?auto_235019 ) ) ( not ( = ?auto_235012 ?auto_235020 ) ) ( not ( = ?auto_235013 ?auto_235014 ) ) ( not ( = ?auto_235013 ?auto_235015 ) ) ( not ( = ?auto_235013 ?auto_235016 ) ) ( not ( = ?auto_235013 ?auto_235017 ) ) ( not ( = ?auto_235013 ?auto_235018 ) ) ( not ( = ?auto_235013 ?auto_235019 ) ) ( not ( = ?auto_235013 ?auto_235020 ) ) ( not ( = ?auto_235014 ?auto_235015 ) ) ( not ( = ?auto_235014 ?auto_235016 ) ) ( not ( = ?auto_235014 ?auto_235017 ) ) ( not ( = ?auto_235014 ?auto_235018 ) ) ( not ( = ?auto_235014 ?auto_235019 ) ) ( not ( = ?auto_235014 ?auto_235020 ) ) ( not ( = ?auto_235015 ?auto_235016 ) ) ( not ( = ?auto_235015 ?auto_235017 ) ) ( not ( = ?auto_235015 ?auto_235018 ) ) ( not ( = ?auto_235015 ?auto_235019 ) ) ( not ( = ?auto_235015 ?auto_235020 ) ) ( not ( = ?auto_235016 ?auto_235017 ) ) ( not ( = ?auto_235016 ?auto_235018 ) ) ( not ( = ?auto_235016 ?auto_235019 ) ) ( not ( = ?auto_235016 ?auto_235020 ) ) ( not ( = ?auto_235017 ?auto_235018 ) ) ( not ( = ?auto_235017 ?auto_235019 ) ) ( not ( = ?auto_235017 ?auto_235020 ) ) ( not ( = ?auto_235018 ?auto_235019 ) ) ( not ( = ?auto_235018 ?auto_235020 ) ) ( not ( = ?auto_235019 ?auto_235020 ) ) ( ON ?auto_235018 ?auto_235019 ) ( CLEAR ?auto_235016 ) ( ON ?auto_235017 ?auto_235018 ) ( CLEAR ?auto_235017 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_235009 ?auto_235010 ?auto_235011 ?auto_235012 ?auto_235013 ?auto_235014 ?auto_235015 ?auto_235016 ?auto_235017 )
      ( MAKE-11PILE ?auto_235009 ?auto_235010 ?auto_235011 ?auto_235012 ?auto_235013 ?auto_235014 ?auto_235015 ?auto_235016 ?auto_235017 ?auto_235018 ?auto_235019 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_235032 - BLOCK
      ?auto_235033 - BLOCK
      ?auto_235034 - BLOCK
      ?auto_235035 - BLOCK
      ?auto_235036 - BLOCK
      ?auto_235037 - BLOCK
      ?auto_235038 - BLOCK
      ?auto_235039 - BLOCK
      ?auto_235040 - BLOCK
      ?auto_235041 - BLOCK
      ?auto_235042 - BLOCK
    )
    :vars
    (
      ?auto_235043 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_235042 ?auto_235043 ) ( ON-TABLE ?auto_235032 ) ( ON ?auto_235033 ?auto_235032 ) ( ON ?auto_235034 ?auto_235033 ) ( ON ?auto_235035 ?auto_235034 ) ( ON ?auto_235036 ?auto_235035 ) ( ON ?auto_235037 ?auto_235036 ) ( ON ?auto_235038 ?auto_235037 ) ( ON ?auto_235039 ?auto_235038 ) ( not ( = ?auto_235032 ?auto_235033 ) ) ( not ( = ?auto_235032 ?auto_235034 ) ) ( not ( = ?auto_235032 ?auto_235035 ) ) ( not ( = ?auto_235032 ?auto_235036 ) ) ( not ( = ?auto_235032 ?auto_235037 ) ) ( not ( = ?auto_235032 ?auto_235038 ) ) ( not ( = ?auto_235032 ?auto_235039 ) ) ( not ( = ?auto_235032 ?auto_235040 ) ) ( not ( = ?auto_235032 ?auto_235041 ) ) ( not ( = ?auto_235032 ?auto_235042 ) ) ( not ( = ?auto_235032 ?auto_235043 ) ) ( not ( = ?auto_235033 ?auto_235034 ) ) ( not ( = ?auto_235033 ?auto_235035 ) ) ( not ( = ?auto_235033 ?auto_235036 ) ) ( not ( = ?auto_235033 ?auto_235037 ) ) ( not ( = ?auto_235033 ?auto_235038 ) ) ( not ( = ?auto_235033 ?auto_235039 ) ) ( not ( = ?auto_235033 ?auto_235040 ) ) ( not ( = ?auto_235033 ?auto_235041 ) ) ( not ( = ?auto_235033 ?auto_235042 ) ) ( not ( = ?auto_235033 ?auto_235043 ) ) ( not ( = ?auto_235034 ?auto_235035 ) ) ( not ( = ?auto_235034 ?auto_235036 ) ) ( not ( = ?auto_235034 ?auto_235037 ) ) ( not ( = ?auto_235034 ?auto_235038 ) ) ( not ( = ?auto_235034 ?auto_235039 ) ) ( not ( = ?auto_235034 ?auto_235040 ) ) ( not ( = ?auto_235034 ?auto_235041 ) ) ( not ( = ?auto_235034 ?auto_235042 ) ) ( not ( = ?auto_235034 ?auto_235043 ) ) ( not ( = ?auto_235035 ?auto_235036 ) ) ( not ( = ?auto_235035 ?auto_235037 ) ) ( not ( = ?auto_235035 ?auto_235038 ) ) ( not ( = ?auto_235035 ?auto_235039 ) ) ( not ( = ?auto_235035 ?auto_235040 ) ) ( not ( = ?auto_235035 ?auto_235041 ) ) ( not ( = ?auto_235035 ?auto_235042 ) ) ( not ( = ?auto_235035 ?auto_235043 ) ) ( not ( = ?auto_235036 ?auto_235037 ) ) ( not ( = ?auto_235036 ?auto_235038 ) ) ( not ( = ?auto_235036 ?auto_235039 ) ) ( not ( = ?auto_235036 ?auto_235040 ) ) ( not ( = ?auto_235036 ?auto_235041 ) ) ( not ( = ?auto_235036 ?auto_235042 ) ) ( not ( = ?auto_235036 ?auto_235043 ) ) ( not ( = ?auto_235037 ?auto_235038 ) ) ( not ( = ?auto_235037 ?auto_235039 ) ) ( not ( = ?auto_235037 ?auto_235040 ) ) ( not ( = ?auto_235037 ?auto_235041 ) ) ( not ( = ?auto_235037 ?auto_235042 ) ) ( not ( = ?auto_235037 ?auto_235043 ) ) ( not ( = ?auto_235038 ?auto_235039 ) ) ( not ( = ?auto_235038 ?auto_235040 ) ) ( not ( = ?auto_235038 ?auto_235041 ) ) ( not ( = ?auto_235038 ?auto_235042 ) ) ( not ( = ?auto_235038 ?auto_235043 ) ) ( not ( = ?auto_235039 ?auto_235040 ) ) ( not ( = ?auto_235039 ?auto_235041 ) ) ( not ( = ?auto_235039 ?auto_235042 ) ) ( not ( = ?auto_235039 ?auto_235043 ) ) ( not ( = ?auto_235040 ?auto_235041 ) ) ( not ( = ?auto_235040 ?auto_235042 ) ) ( not ( = ?auto_235040 ?auto_235043 ) ) ( not ( = ?auto_235041 ?auto_235042 ) ) ( not ( = ?auto_235041 ?auto_235043 ) ) ( not ( = ?auto_235042 ?auto_235043 ) ) ( ON ?auto_235041 ?auto_235042 ) ( CLEAR ?auto_235039 ) ( ON ?auto_235040 ?auto_235041 ) ( CLEAR ?auto_235040 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_235032 ?auto_235033 ?auto_235034 ?auto_235035 ?auto_235036 ?auto_235037 ?auto_235038 ?auto_235039 ?auto_235040 )
      ( MAKE-11PILE ?auto_235032 ?auto_235033 ?auto_235034 ?auto_235035 ?auto_235036 ?auto_235037 ?auto_235038 ?auto_235039 ?auto_235040 ?auto_235041 ?auto_235042 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_235055 - BLOCK
      ?auto_235056 - BLOCK
      ?auto_235057 - BLOCK
      ?auto_235058 - BLOCK
      ?auto_235059 - BLOCK
      ?auto_235060 - BLOCK
      ?auto_235061 - BLOCK
      ?auto_235062 - BLOCK
      ?auto_235063 - BLOCK
      ?auto_235064 - BLOCK
      ?auto_235065 - BLOCK
    )
    :vars
    (
      ?auto_235066 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_235065 ?auto_235066 ) ( ON-TABLE ?auto_235055 ) ( ON ?auto_235056 ?auto_235055 ) ( ON ?auto_235057 ?auto_235056 ) ( ON ?auto_235058 ?auto_235057 ) ( ON ?auto_235059 ?auto_235058 ) ( ON ?auto_235060 ?auto_235059 ) ( ON ?auto_235061 ?auto_235060 ) ( not ( = ?auto_235055 ?auto_235056 ) ) ( not ( = ?auto_235055 ?auto_235057 ) ) ( not ( = ?auto_235055 ?auto_235058 ) ) ( not ( = ?auto_235055 ?auto_235059 ) ) ( not ( = ?auto_235055 ?auto_235060 ) ) ( not ( = ?auto_235055 ?auto_235061 ) ) ( not ( = ?auto_235055 ?auto_235062 ) ) ( not ( = ?auto_235055 ?auto_235063 ) ) ( not ( = ?auto_235055 ?auto_235064 ) ) ( not ( = ?auto_235055 ?auto_235065 ) ) ( not ( = ?auto_235055 ?auto_235066 ) ) ( not ( = ?auto_235056 ?auto_235057 ) ) ( not ( = ?auto_235056 ?auto_235058 ) ) ( not ( = ?auto_235056 ?auto_235059 ) ) ( not ( = ?auto_235056 ?auto_235060 ) ) ( not ( = ?auto_235056 ?auto_235061 ) ) ( not ( = ?auto_235056 ?auto_235062 ) ) ( not ( = ?auto_235056 ?auto_235063 ) ) ( not ( = ?auto_235056 ?auto_235064 ) ) ( not ( = ?auto_235056 ?auto_235065 ) ) ( not ( = ?auto_235056 ?auto_235066 ) ) ( not ( = ?auto_235057 ?auto_235058 ) ) ( not ( = ?auto_235057 ?auto_235059 ) ) ( not ( = ?auto_235057 ?auto_235060 ) ) ( not ( = ?auto_235057 ?auto_235061 ) ) ( not ( = ?auto_235057 ?auto_235062 ) ) ( not ( = ?auto_235057 ?auto_235063 ) ) ( not ( = ?auto_235057 ?auto_235064 ) ) ( not ( = ?auto_235057 ?auto_235065 ) ) ( not ( = ?auto_235057 ?auto_235066 ) ) ( not ( = ?auto_235058 ?auto_235059 ) ) ( not ( = ?auto_235058 ?auto_235060 ) ) ( not ( = ?auto_235058 ?auto_235061 ) ) ( not ( = ?auto_235058 ?auto_235062 ) ) ( not ( = ?auto_235058 ?auto_235063 ) ) ( not ( = ?auto_235058 ?auto_235064 ) ) ( not ( = ?auto_235058 ?auto_235065 ) ) ( not ( = ?auto_235058 ?auto_235066 ) ) ( not ( = ?auto_235059 ?auto_235060 ) ) ( not ( = ?auto_235059 ?auto_235061 ) ) ( not ( = ?auto_235059 ?auto_235062 ) ) ( not ( = ?auto_235059 ?auto_235063 ) ) ( not ( = ?auto_235059 ?auto_235064 ) ) ( not ( = ?auto_235059 ?auto_235065 ) ) ( not ( = ?auto_235059 ?auto_235066 ) ) ( not ( = ?auto_235060 ?auto_235061 ) ) ( not ( = ?auto_235060 ?auto_235062 ) ) ( not ( = ?auto_235060 ?auto_235063 ) ) ( not ( = ?auto_235060 ?auto_235064 ) ) ( not ( = ?auto_235060 ?auto_235065 ) ) ( not ( = ?auto_235060 ?auto_235066 ) ) ( not ( = ?auto_235061 ?auto_235062 ) ) ( not ( = ?auto_235061 ?auto_235063 ) ) ( not ( = ?auto_235061 ?auto_235064 ) ) ( not ( = ?auto_235061 ?auto_235065 ) ) ( not ( = ?auto_235061 ?auto_235066 ) ) ( not ( = ?auto_235062 ?auto_235063 ) ) ( not ( = ?auto_235062 ?auto_235064 ) ) ( not ( = ?auto_235062 ?auto_235065 ) ) ( not ( = ?auto_235062 ?auto_235066 ) ) ( not ( = ?auto_235063 ?auto_235064 ) ) ( not ( = ?auto_235063 ?auto_235065 ) ) ( not ( = ?auto_235063 ?auto_235066 ) ) ( not ( = ?auto_235064 ?auto_235065 ) ) ( not ( = ?auto_235064 ?auto_235066 ) ) ( not ( = ?auto_235065 ?auto_235066 ) ) ( ON ?auto_235064 ?auto_235065 ) ( ON ?auto_235063 ?auto_235064 ) ( CLEAR ?auto_235061 ) ( ON ?auto_235062 ?auto_235063 ) ( CLEAR ?auto_235062 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_235055 ?auto_235056 ?auto_235057 ?auto_235058 ?auto_235059 ?auto_235060 ?auto_235061 ?auto_235062 )
      ( MAKE-11PILE ?auto_235055 ?auto_235056 ?auto_235057 ?auto_235058 ?auto_235059 ?auto_235060 ?auto_235061 ?auto_235062 ?auto_235063 ?auto_235064 ?auto_235065 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_235078 - BLOCK
      ?auto_235079 - BLOCK
      ?auto_235080 - BLOCK
      ?auto_235081 - BLOCK
      ?auto_235082 - BLOCK
      ?auto_235083 - BLOCK
      ?auto_235084 - BLOCK
      ?auto_235085 - BLOCK
      ?auto_235086 - BLOCK
      ?auto_235087 - BLOCK
      ?auto_235088 - BLOCK
    )
    :vars
    (
      ?auto_235089 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_235088 ?auto_235089 ) ( ON-TABLE ?auto_235078 ) ( ON ?auto_235079 ?auto_235078 ) ( ON ?auto_235080 ?auto_235079 ) ( ON ?auto_235081 ?auto_235080 ) ( ON ?auto_235082 ?auto_235081 ) ( ON ?auto_235083 ?auto_235082 ) ( ON ?auto_235084 ?auto_235083 ) ( not ( = ?auto_235078 ?auto_235079 ) ) ( not ( = ?auto_235078 ?auto_235080 ) ) ( not ( = ?auto_235078 ?auto_235081 ) ) ( not ( = ?auto_235078 ?auto_235082 ) ) ( not ( = ?auto_235078 ?auto_235083 ) ) ( not ( = ?auto_235078 ?auto_235084 ) ) ( not ( = ?auto_235078 ?auto_235085 ) ) ( not ( = ?auto_235078 ?auto_235086 ) ) ( not ( = ?auto_235078 ?auto_235087 ) ) ( not ( = ?auto_235078 ?auto_235088 ) ) ( not ( = ?auto_235078 ?auto_235089 ) ) ( not ( = ?auto_235079 ?auto_235080 ) ) ( not ( = ?auto_235079 ?auto_235081 ) ) ( not ( = ?auto_235079 ?auto_235082 ) ) ( not ( = ?auto_235079 ?auto_235083 ) ) ( not ( = ?auto_235079 ?auto_235084 ) ) ( not ( = ?auto_235079 ?auto_235085 ) ) ( not ( = ?auto_235079 ?auto_235086 ) ) ( not ( = ?auto_235079 ?auto_235087 ) ) ( not ( = ?auto_235079 ?auto_235088 ) ) ( not ( = ?auto_235079 ?auto_235089 ) ) ( not ( = ?auto_235080 ?auto_235081 ) ) ( not ( = ?auto_235080 ?auto_235082 ) ) ( not ( = ?auto_235080 ?auto_235083 ) ) ( not ( = ?auto_235080 ?auto_235084 ) ) ( not ( = ?auto_235080 ?auto_235085 ) ) ( not ( = ?auto_235080 ?auto_235086 ) ) ( not ( = ?auto_235080 ?auto_235087 ) ) ( not ( = ?auto_235080 ?auto_235088 ) ) ( not ( = ?auto_235080 ?auto_235089 ) ) ( not ( = ?auto_235081 ?auto_235082 ) ) ( not ( = ?auto_235081 ?auto_235083 ) ) ( not ( = ?auto_235081 ?auto_235084 ) ) ( not ( = ?auto_235081 ?auto_235085 ) ) ( not ( = ?auto_235081 ?auto_235086 ) ) ( not ( = ?auto_235081 ?auto_235087 ) ) ( not ( = ?auto_235081 ?auto_235088 ) ) ( not ( = ?auto_235081 ?auto_235089 ) ) ( not ( = ?auto_235082 ?auto_235083 ) ) ( not ( = ?auto_235082 ?auto_235084 ) ) ( not ( = ?auto_235082 ?auto_235085 ) ) ( not ( = ?auto_235082 ?auto_235086 ) ) ( not ( = ?auto_235082 ?auto_235087 ) ) ( not ( = ?auto_235082 ?auto_235088 ) ) ( not ( = ?auto_235082 ?auto_235089 ) ) ( not ( = ?auto_235083 ?auto_235084 ) ) ( not ( = ?auto_235083 ?auto_235085 ) ) ( not ( = ?auto_235083 ?auto_235086 ) ) ( not ( = ?auto_235083 ?auto_235087 ) ) ( not ( = ?auto_235083 ?auto_235088 ) ) ( not ( = ?auto_235083 ?auto_235089 ) ) ( not ( = ?auto_235084 ?auto_235085 ) ) ( not ( = ?auto_235084 ?auto_235086 ) ) ( not ( = ?auto_235084 ?auto_235087 ) ) ( not ( = ?auto_235084 ?auto_235088 ) ) ( not ( = ?auto_235084 ?auto_235089 ) ) ( not ( = ?auto_235085 ?auto_235086 ) ) ( not ( = ?auto_235085 ?auto_235087 ) ) ( not ( = ?auto_235085 ?auto_235088 ) ) ( not ( = ?auto_235085 ?auto_235089 ) ) ( not ( = ?auto_235086 ?auto_235087 ) ) ( not ( = ?auto_235086 ?auto_235088 ) ) ( not ( = ?auto_235086 ?auto_235089 ) ) ( not ( = ?auto_235087 ?auto_235088 ) ) ( not ( = ?auto_235087 ?auto_235089 ) ) ( not ( = ?auto_235088 ?auto_235089 ) ) ( ON ?auto_235087 ?auto_235088 ) ( ON ?auto_235086 ?auto_235087 ) ( CLEAR ?auto_235084 ) ( ON ?auto_235085 ?auto_235086 ) ( CLEAR ?auto_235085 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_235078 ?auto_235079 ?auto_235080 ?auto_235081 ?auto_235082 ?auto_235083 ?auto_235084 ?auto_235085 )
      ( MAKE-11PILE ?auto_235078 ?auto_235079 ?auto_235080 ?auto_235081 ?auto_235082 ?auto_235083 ?auto_235084 ?auto_235085 ?auto_235086 ?auto_235087 ?auto_235088 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_235101 - BLOCK
      ?auto_235102 - BLOCK
      ?auto_235103 - BLOCK
      ?auto_235104 - BLOCK
      ?auto_235105 - BLOCK
      ?auto_235106 - BLOCK
      ?auto_235107 - BLOCK
      ?auto_235108 - BLOCK
      ?auto_235109 - BLOCK
      ?auto_235110 - BLOCK
      ?auto_235111 - BLOCK
    )
    :vars
    (
      ?auto_235112 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_235111 ?auto_235112 ) ( ON-TABLE ?auto_235101 ) ( ON ?auto_235102 ?auto_235101 ) ( ON ?auto_235103 ?auto_235102 ) ( ON ?auto_235104 ?auto_235103 ) ( ON ?auto_235105 ?auto_235104 ) ( ON ?auto_235106 ?auto_235105 ) ( not ( = ?auto_235101 ?auto_235102 ) ) ( not ( = ?auto_235101 ?auto_235103 ) ) ( not ( = ?auto_235101 ?auto_235104 ) ) ( not ( = ?auto_235101 ?auto_235105 ) ) ( not ( = ?auto_235101 ?auto_235106 ) ) ( not ( = ?auto_235101 ?auto_235107 ) ) ( not ( = ?auto_235101 ?auto_235108 ) ) ( not ( = ?auto_235101 ?auto_235109 ) ) ( not ( = ?auto_235101 ?auto_235110 ) ) ( not ( = ?auto_235101 ?auto_235111 ) ) ( not ( = ?auto_235101 ?auto_235112 ) ) ( not ( = ?auto_235102 ?auto_235103 ) ) ( not ( = ?auto_235102 ?auto_235104 ) ) ( not ( = ?auto_235102 ?auto_235105 ) ) ( not ( = ?auto_235102 ?auto_235106 ) ) ( not ( = ?auto_235102 ?auto_235107 ) ) ( not ( = ?auto_235102 ?auto_235108 ) ) ( not ( = ?auto_235102 ?auto_235109 ) ) ( not ( = ?auto_235102 ?auto_235110 ) ) ( not ( = ?auto_235102 ?auto_235111 ) ) ( not ( = ?auto_235102 ?auto_235112 ) ) ( not ( = ?auto_235103 ?auto_235104 ) ) ( not ( = ?auto_235103 ?auto_235105 ) ) ( not ( = ?auto_235103 ?auto_235106 ) ) ( not ( = ?auto_235103 ?auto_235107 ) ) ( not ( = ?auto_235103 ?auto_235108 ) ) ( not ( = ?auto_235103 ?auto_235109 ) ) ( not ( = ?auto_235103 ?auto_235110 ) ) ( not ( = ?auto_235103 ?auto_235111 ) ) ( not ( = ?auto_235103 ?auto_235112 ) ) ( not ( = ?auto_235104 ?auto_235105 ) ) ( not ( = ?auto_235104 ?auto_235106 ) ) ( not ( = ?auto_235104 ?auto_235107 ) ) ( not ( = ?auto_235104 ?auto_235108 ) ) ( not ( = ?auto_235104 ?auto_235109 ) ) ( not ( = ?auto_235104 ?auto_235110 ) ) ( not ( = ?auto_235104 ?auto_235111 ) ) ( not ( = ?auto_235104 ?auto_235112 ) ) ( not ( = ?auto_235105 ?auto_235106 ) ) ( not ( = ?auto_235105 ?auto_235107 ) ) ( not ( = ?auto_235105 ?auto_235108 ) ) ( not ( = ?auto_235105 ?auto_235109 ) ) ( not ( = ?auto_235105 ?auto_235110 ) ) ( not ( = ?auto_235105 ?auto_235111 ) ) ( not ( = ?auto_235105 ?auto_235112 ) ) ( not ( = ?auto_235106 ?auto_235107 ) ) ( not ( = ?auto_235106 ?auto_235108 ) ) ( not ( = ?auto_235106 ?auto_235109 ) ) ( not ( = ?auto_235106 ?auto_235110 ) ) ( not ( = ?auto_235106 ?auto_235111 ) ) ( not ( = ?auto_235106 ?auto_235112 ) ) ( not ( = ?auto_235107 ?auto_235108 ) ) ( not ( = ?auto_235107 ?auto_235109 ) ) ( not ( = ?auto_235107 ?auto_235110 ) ) ( not ( = ?auto_235107 ?auto_235111 ) ) ( not ( = ?auto_235107 ?auto_235112 ) ) ( not ( = ?auto_235108 ?auto_235109 ) ) ( not ( = ?auto_235108 ?auto_235110 ) ) ( not ( = ?auto_235108 ?auto_235111 ) ) ( not ( = ?auto_235108 ?auto_235112 ) ) ( not ( = ?auto_235109 ?auto_235110 ) ) ( not ( = ?auto_235109 ?auto_235111 ) ) ( not ( = ?auto_235109 ?auto_235112 ) ) ( not ( = ?auto_235110 ?auto_235111 ) ) ( not ( = ?auto_235110 ?auto_235112 ) ) ( not ( = ?auto_235111 ?auto_235112 ) ) ( ON ?auto_235110 ?auto_235111 ) ( ON ?auto_235109 ?auto_235110 ) ( ON ?auto_235108 ?auto_235109 ) ( CLEAR ?auto_235106 ) ( ON ?auto_235107 ?auto_235108 ) ( CLEAR ?auto_235107 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_235101 ?auto_235102 ?auto_235103 ?auto_235104 ?auto_235105 ?auto_235106 ?auto_235107 )
      ( MAKE-11PILE ?auto_235101 ?auto_235102 ?auto_235103 ?auto_235104 ?auto_235105 ?auto_235106 ?auto_235107 ?auto_235108 ?auto_235109 ?auto_235110 ?auto_235111 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_235124 - BLOCK
      ?auto_235125 - BLOCK
      ?auto_235126 - BLOCK
      ?auto_235127 - BLOCK
      ?auto_235128 - BLOCK
      ?auto_235129 - BLOCK
      ?auto_235130 - BLOCK
      ?auto_235131 - BLOCK
      ?auto_235132 - BLOCK
      ?auto_235133 - BLOCK
      ?auto_235134 - BLOCK
    )
    :vars
    (
      ?auto_235135 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_235134 ?auto_235135 ) ( ON-TABLE ?auto_235124 ) ( ON ?auto_235125 ?auto_235124 ) ( ON ?auto_235126 ?auto_235125 ) ( ON ?auto_235127 ?auto_235126 ) ( ON ?auto_235128 ?auto_235127 ) ( ON ?auto_235129 ?auto_235128 ) ( not ( = ?auto_235124 ?auto_235125 ) ) ( not ( = ?auto_235124 ?auto_235126 ) ) ( not ( = ?auto_235124 ?auto_235127 ) ) ( not ( = ?auto_235124 ?auto_235128 ) ) ( not ( = ?auto_235124 ?auto_235129 ) ) ( not ( = ?auto_235124 ?auto_235130 ) ) ( not ( = ?auto_235124 ?auto_235131 ) ) ( not ( = ?auto_235124 ?auto_235132 ) ) ( not ( = ?auto_235124 ?auto_235133 ) ) ( not ( = ?auto_235124 ?auto_235134 ) ) ( not ( = ?auto_235124 ?auto_235135 ) ) ( not ( = ?auto_235125 ?auto_235126 ) ) ( not ( = ?auto_235125 ?auto_235127 ) ) ( not ( = ?auto_235125 ?auto_235128 ) ) ( not ( = ?auto_235125 ?auto_235129 ) ) ( not ( = ?auto_235125 ?auto_235130 ) ) ( not ( = ?auto_235125 ?auto_235131 ) ) ( not ( = ?auto_235125 ?auto_235132 ) ) ( not ( = ?auto_235125 ?auto_235133 ) ) ( not ( = ?auto_235125 ?auto_235134 ) ) ( not ( = ?auto_235125 ?auto_235135 ) ) ( not ( = ?auto_235126 ?auto_235127 ) ) ( not ( = ?auto_235126 ?auto_235128 ) ) ( not ( = ?auto_235126 ?auto_235129 ) ) ( not ( = ?auto_235126 ?auto_235130 ) ) ( not ( = ?auto_235126 ?auto_235131 ) ) ( not ( = ?auto_235126 ?auto_235132 ) ) ( not ( = ?auto_235126 ?auto_235133 ) ) ( not ( = ?auto_235126 ?auto_235134 ) ) ( not ( = ?auto_235126 ?auto_235135 ) ) ( not ( = ?auto_235127 ?auto_235128 ) ) ( not ( = ?auto_235127 ?auto_235129 ) ) ( not ( = ?auto_235127 ?auto_235130 ) ) ( not ( = ?auto_235127 ?auto_235131 ) ) ( not ( = ?auto_235127 ?auto_235132 ) ) ( not ( = ?auto_235127 ?auto_235133 ) ) ( not ( = ?auto_235127 ?auto_235134 ) ) ( not ( = ?auto_235127 ?auto_235135 ) ) ( not ( = ?auto_235128 ?auto_235129 ) ) ( not ( = ?auto_235128 ?auto_235130 ) ) ( not ( = ?auto_235128 ?auto_235131 ) ) ( not ( = ?auto_235128 ?auto_235132 ) ) ( not ( = ?auto_235128 ?auto_235133 ) ) ( not ( = ?auto_235128 ?auto_235134 ) ) ( not ( = ?auto_235128 ?auto_235135 ) ) ( not ( = ?auto_235129 ?auto_235130 ) ) ( not ( = ?auto_235129 ?auto_235131 ) ) ( not ( = ?auto_235129 ?auto_235132 ) ) ( not ( = ?auto_235129 ?auto_235133 ) ) ( not ( = ?auto_235129 ?auto_235134 ) ) ( not ( = ?auto_235129 ?auto_235135 ) ) ( not ( = ?auto_235130 ?auto_235131 ) ) ( not ( = ?auto_235130 ?auto_235132 ) ) ( not ( = ?auto_235130 ?auto_235133 ) ) ( not ( = ?auto_235130 ?auto_235134 ) ) ( not ( = ?auto_235130 ?auto_235135 ) ) ( not ( = ?auto_235131 ?auto_235132 ) ) ( not ( = ?auto_235131 ?auto_235133 ) ) ( not ( = ?auto_235131 ?auto_235134 ) ) ( not ( = ?auto_235131 ?auto_235135 ) ) ( not ( = ?auto_235132 ?auto_235133 ) ) ( not ( = ?auto_235132 ?auto_235134 ) ) ( not ( = ?auto_235132 ?auto_235135 ) ) ( not ( = ?auto_235133 ?auto_235134 ) ) ( not ( = ?auto_235133 ?auto_235135 ) ) ( not ( = ?auto_235134 ?auto_235135 ) ) ( ON ?auto_235133 ?auto_235134 ) ( ON ?auto_235132 ?auto_235133 ) ( ON ?auto_235131 ?auto_235132 ) ( CLEAR ?auto_235129 ) ( ON ?auto_235130 ?auto_235131 ) ( CLEAR ?auto_235130 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_235124 ?auto_235125 ?auto_235126 ?auto_235127 ?auto_235128 ?auto_235129 ?auto_235130 )
      ( MAKE-11PILE ?auto_235124 ?auto_235125 ?auto_235126 ?auto_235127 ?auto_235128 ?auto_235129 ?auto_235130 ?auto_235131 ?auto_235132 ?auto_235133 ?auto_235134 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_235147 - BLOCK
      ?auto_235148 - BLOCK
      ?auto_235149 - BLOCK
      ?auto_235150 - BLOCK
      ?auto_235151 - BLOCK
      ?auto_235152 - BLOCK
      ?auto_235153 - BLOCK
      ?auto_235154 - BLOCK
      ?auto_235155 - BLOCK
      ?auto_235156 - BLOCK
      ?auto_235157 - BLOCK
    )
    :vars
    (
      ?auto_235158 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_235157 ?auto_235158 ) ( ON-TABLE ?auto_235147 ) ( ON ?auto_235148 ?auto_235147 ) ( ON ?auto_235149 ?auto_235148 ) ( ON ?auto_235150 ?auto_235149 ) ( ON ?auto_235151 ?auto_235150 ) ( not ( = ?auto_235147 ?auto_235148 ) ) ( not ( = ?auto_235147 ?auto_235149 ) ) ( not ( = ?auto_235147 ?auto_235150 ) ) ( not ( = ?auto_235147 ?auto_235151 ) ) ( not ( = ?auto_235147 ?auto_235152 ) ) ( not ( = ?auto_235147 ?auto_235153 ) ) ( not ( = ?auto_235147 ?auto_235154 ) ) ( not ( = ?auto_235147 ?auto_235155 ) ) ( not ( = ?auto_235147 ?auto_235156 ) ) ( not ( = ?auto_235147 ?auto_235157 ) ) ( not ( = ?auto_235147 ?auto_235158 ) ) ( not ( = ?auto_235148 ?auto_235149 ) ) ( not ( = ?auto_235148 ?auto_235150 ) ) ( not ( = ?auto_235148 ?auto_235151 ) ) ( not ( = ?auto_235148 ?auto_235152 ) ) ( not ( = ?auto_235148 ?auto_235153 ) ) ( not ( = ?auto_235148 ?auto_235154 ) ) ( not ( = ?auto_235148 ?auto_235155 ) ) ( not ( = ?auto_235148 ?auto_235156 ) ) ( not ( = ?auto_235148 ?auto_235157 ) ) ( not ( = ?auto_235148 ?auto_235158 ) ) ( not ( = ?auto_235149 ?auto_235150 ) ) ( not ( = ?auto_235149 ?auto_235151 ) ) ( not ( = ?auto_235149 ?auto_235152 ) ) ( not ( = ?auto_235149 ?auto_235153 ) ) ( not ( = ?auto_235149 ?auto_235154 ) ) ( not ( = ?auto_235149 ?auto_235155 ) ) ( not ( = ?auto_235149 ?auto_235156 ) ) ( not ( = ?auto_235149 ?auto_235157 ) ) ( not ( = ?auto_235149 ?auto_235158 ) ) ( not ( = ?auto_235150 ?auto_235151 ) ) ( not ( = ?auto_235150 ?auto_235152 ) ) ( not ( = ?auto_235150 ?auto_235153 ) ) ( not ( = ?auto_235150 ?auto_235154 ) ) ( not ( = ?auto_235150 ?auto_235155 ) ) ( not ( = ?auto_235150 ?auto_235156 ) ) ( not ( = ?auto_235150 ?auto_235157 ) ) ( not ( = ?auto_235150 ?auto_235158 ) ) ( not ( = ?auto_235151 ?auto_235152 ) ) ( not ( = ?auto_235151 ?auto_235153 ) ) ( not ( = ?auto_235151 ?auto_235154 ) ) ( not ( = ?auto_235151 ?auto_235155 ) ) ( not ( = ?auto_235151 ?auto_235156 ) ) ( not ( = ?auto_235151 ?auto_235157 ) ) ( not ( = ?auto_235151 ?auto_235158 ) ) ( not ( = ?auto_235152 ?auto_235153 ) ) ( not ( = ?auto_235152 ?auto_235154 ) ) ( not ( = ?auto_235152 ?auto_235155 ) ) ( not ( = ?auto_235152 ?auto_235156 ) ) ( not ( = ?auto_235152 ?auto_235157 ) ) ( not ( = ?auto_235152 ?auto_235158 ) ) ( not ( = ?auto_235153 ?auto_235154 ) ) ( not ( = ?auto_235153 ?auto_235155 ) ) ( not ( = ?auto_235153 ?auto_235156 ) ) ( not ( = ?auto_235153 ?auto_235157 ) ) ( not ( = ?auto_235153 ?auto_235158 ) ) ( not ( = ?auto_235154 ?auto_235155 ) ) ( not ( = ?auto_235154 ?auto_235156 ) ) ( not ( = ?auto_235154 ?auto_235157 ) ) ( not ( = ?auto_235154 ?auto_235158 ) ) ( not ( = ?auto_235155 ?auto_235156 ) ) ( not ( = ?auto_235155 ?auto_235157 ) ) ( not ( = ?auto_235155 ?auto_235158 ) ) ( not ( = ?auto_235156 ?auto_235157 ) ) ( not ( = ?auto_235156 ?auto_235158 ) ) ( not ( = ?auto_235157 ?auto_235158 ) ) ( ON ?auto_235156 ?auto_235157 ) ( ON ?auto_235155 ?auto_235156 ) ( ON ?auto_235154 ?auto_235155 ) ( ON ?auto_235153 ?auto_235154 ) ( CLEAR ?auto_235151 ) ( ON ?auto_235152 ?auto_235153 ) ( CLEAR ?auto_235152 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_235147 ?auto_235148 ?auto_235149 ?auto_235150 ?auto_235151 ?auto_235152 )
      ( MAKE-11PILE ?auto_235147 ?auto_235148 ?auto_235149 ?auto_235150 ?auto_235151 ?auto_235152 ?auto_235153 ?auto_235154 ?auto_235155 ?auto_235156 ?auto_235157 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_235170 - BLOCK
      ?auto_235171 - BLOCK
      ?auto_235172 - BLOCK
      ?auto_235173 - BLOCK
      ?auto_235174 - BLOCK
      ?auto_235175 - BLOCK
      ?auto_235176 - BLOCK
      ?auto_235177 - BLOCK
      ?auto_235178 - BLOCK
      ?auto_235179 - BLOCK
      ?auto_235180 - BLOCK
    )
    :vars
    (
      ?auto_235181 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_235180 ?auto_235181 ) ( ON-TABLE ?auto_235170 ) ( ON ?auto_235171 ?auto_235170 ) ( ON ?auto_235172 ?auto_235171 ) ( ON ?auto_235173 ?auto_235172 ) ( ON ?auto_235174 ?auto_235173 ) ( not ( = ?auto_235170 ?auto_235171 ) ) ( not ( = ?auto_235170 ?auto_235172 ) ) ( not ( = ?auto_235170 ?auto_235173 ) ) ( not ( = ?auto_235170 ?auto_235174 ) ) ( not ( = ?auto_235170 ?auto_235175 ) ) ( not ( = ?auto_235170 ?auto_235176 ) ) ( not ( = ?auto_235170 ?auto_235177 ) ) ( not ( = ?auto_235170 ?auto_235178 ) ) ( not ( = ?auto_235170 ?auto_235179 ) ) ( not ( = ?auto_235170 ?auto_235180 ) ) ( not ( = ?auto_235170 ?auto_235181 ) ) ( not ( = ?auto_235171 ?auto_235172 ) ) ( not ( = ?auto_235171 ?auto_235173 ) ) ( not ( = ?auto_235171 ?auto_235174 ) ) ( not ( = ?auto_235171 ?auto_235175 ) ) ( not ( = ?auto_235171 ?auto_235176 ) ) ( not ( = ?auto_235171 ?auto_235177 ) ) ( not ( = ?auto_235171 ?auto_235178 ) ) ( not ( = ?auto_235171 ?auto_235179 ) ) ( not ( = ?auto_235171 ?auto_235180 ) ) ( not ( = ?auto_235171 ?auto_235181 ) ) ( not ( = ?auto_235172 ?auto_235173 ) ) ( not ( = ?auto_235172 ?auto_235174 ) ) ( not ( = ?auto_235172 ?auto_235175 ) ) ( not ( = ?auto_235172 ?auto_235176 ) ) ( not ( = ?auto_235172 ?auto_235177 ) ) ( not ( = ?auto_235172 ?auto_235178 ) ) ( not ( = ?auto_235172 ?auto_235179 ) ) ( not ( = ?auto_235172 ?auto_235180 ) ) ( not ( = ?auto_235172 ?auto_235181 ) ) ( not ( = ?auto_235173 ?auto_235174 ) ) ( not ( = ?auto_235173 ?auto_235175 ) ) ( not ( = ?auto_235173 ?auto_235176 ) ) ( not ( = ?auto_235173 ?auto_235177 ) ) ( not ( = ?auto_235173 ?auto_235178 ) ) ( not ( = ?auto_235173 ?auto_235179 ) ) ( not ( = ?auto_235173 ?auto_235180 ) ) ( not ( = ?auto_235173 ?auto_235181 ) ) ( not ( = ?auto_235174 ?auto_235175 ) ) ( not ( = ?auto_235174 ?auto_235176 ) ) ( not ( = ?auto_235174 ?auto_235177 ) ) ( not ( = ?auto_235174 ?auto_235178 ) ) ( not ( = ?auto_235174 ?auto_235179 ) ) ( not ( = ?auto_235174 ?auto_235180 ) ) ( not ( = ?auto_235174 ?auto_235181 ) ) ( not ( = ?auto_235175 ?auto_235176 ) ) ( not ( = ?auto_235175 ?auto_235177 ) ) ( not ( = ?auto_235175 ?auto_235178 ) ) ( not ( = ?auto_235175 ?auto_235179 ) ) ( not ( = ?auto_235175 ?auto_235180 ) ) ( not ( = ?auto_235175 ?auto_235181 ) ) ( not ( = ?auto_235176 ?auto_235177 ) ) ( not ( = ?auto_235176 ?auto_235178 ) ) ( not ( = ?auto_235176 ?auto_235179 ) ) ( not ( = ?auto_235176 ?auto_235180 ) ) ( not ( = ?auto_235176 ?auto_235181 ) ) ( not ( = ?auto_235177 ?auto_235178 ) ) ( not ( = ?auto_235177 ?auto_235179 ) ) ( not ( = ?auto_235177 ?auto_235180 ) ) ( not ( = ?auto_235177 ?auto_235181 ) ) ( not ( = ?auto_235178 ?auto_235179 ) ) ( not ( = ?auto_235178 ?auto_235180 ) ) ( not ( = ?auto_235178 ?auto_235181 ) ) ( not ( = ?auto_235179 ?auto_235180 ) ) ( not ( = ?auto_235179 ?auto_235181 ) ) ( not ( = ?auto_235180 ?auto_235181 ) ) ( ON ?auto_235179 ?auto_235180 ) ( ON ?auto_235178 ?auto_235179 ) ( ON ?auto_235177 ?auto_235178 ) ( ON ?auto_235176 ?auto_235177 ) ( CLEAR ?auto_235174 ) ( ON ?auto_235175 ?auto_235176 ) ( CLEAR ?auto_235175 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_235170 ?auto_235171 ?auto_235172 ?auto_235173 ?auto_235174 ?auto_235175 )
      ( MAKE-11PILE ?auto_235170 ?auto_235171 ?auto_235172 ?auto_235173 ?auto_235174 ?auto_235175 ?auto_235176 ?auto_235177 ?auto_235178 ?auto_235179 ?auto_235180 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_235193 - BLOCK
      ?auto_235194 - BLOCK
      ?auto_235195 - BLOCK
      ?auto_235196 - BLOCK
      ?auto_235197 - BLOCK
      ?auto_235198 - BLOCK
      ?auto_235199 - BLOCK
      ?auto_235200 - BLOCK
      ?auto_235201 - BLOCK
      ?auto_235202 - BLOCK
      ?auto_235203 - BLOCK
    )
    :vars
    (
      ?auto_235204 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_235203 ?auto_235204 ) ( ON-TABLE ?auto_235193 ) ( ON ?auto_235194 ?auto_235193 ) ( ON ?auto_235195 ?auto_235194 ) ( ON ?auto_235196 ?auto_235195 ) ( not ( = ?auto_235193 ?auto_235194 ) ) ( not ( = ?auto_235193 ?auto_235195 ) ) ( not ( = ?auto_235193 ?auto_235196 ) ) ( not ( = ?auto_235193 ?auto_235197 ) ) ( not ( = ?auto_235193 ?auto_235198 ) ) ( not ( = ?auto_235193 ?auto_235199 ) ) ( not ( = ?auto_235193 ?auto_235200 ) ) ( not ( = ?auto_235193 ?auto_235201 ) ) ( not ( = ?auto_235193 ?auto_235202 ) ) ( not ( = ?auto_235193 ?auto_235203 ) ) ( not ( = ?auto_235193 ?auto_235204 ) ) ( not ( = ?auto_235194 ?auto_235195 ) ) ( not ( = ?auto_235194 ?auto_235196 ) ) ( not ( = ?auto_235194 ?auto_235197 ) ) ( not ( = ?auto_235194 ?auto_235198 ) ) ( not ( = ?auto_235194 ?auto_235199 ) ) ( not ( = ?auto_235194 ?auto_235200 ) ) ( not ( = ?auto_235194 ?auto_235201 ) ) ( not ( = ?auto_235194 ?auto_235202 ) ) ( not ( = ?auto_235194 ?auto_235203 ) ) ( not ( = ?auto_235194 ?auto_235204 ) ) ( not ( = ?auto_235195 ?auto_235196 ) ) ( not ( = ?auto_235195 ?auto_235197 ) ) ( not ( = ?auto_235195 ?auto_235198 ) ) ( not ( = ?auto_235195 ?auto_235199 ) ) ( not ( = ?auto_235195 ?auto_235200 ) ) ( not ( = ?auto_235195 ?auto_235201 ) ) ( not ( = ?auto_235195 ?auto_235202 ) ) ( not ( = ?auto_235195 ?auto_235203 ) ) ( not ( = ?auto_235195 ?auto_235204 ) ) ( not ( = ?auto_235196 ?auto_235197 ) ) ( not ( = ?auto_235196 ?auto_235198 ) ) ( not ( = ?auto_235196 ?auto_235199 ) ) ( not ( = ?auto_235196 ?auto_235200 ) ) ( not ( = ?auto_235196 ?auto_235201 ) ) ( not ( = ?auto_235196 ?auto_235202 ) ) ( not ( = ?auto_235196 ?auto_235203 ) ) ( not ( = ?auto_235196 ?auto_235204 ) ) ( not ( = ?auto_235197 ?auto_235198 ) ) ( not ( = ?auto_235197 ?auto_235199 ) ) ( not ( = ?auto_235197 ?auto_235200 ) ) ( not ( = ?auto_235197 ?auto_235201 ) ) ( not ( = ?auto_235197 ?auto_235202 ) ) ( not ( = ?auto_235197 ?auto_235203 ) ) ( not ( = ?auto_235197 ?auto_235204 ) ) ( not ( = ?auto_235198 ?auto_235199 ) ) ( not ( = ?auto_235198 ?auto_235200 ) ) ( not ( = ?auto_235198 ?auto_235201 ) ) ( not ( = ?auto_235198 ?auto_235202 ) ) ( not ( = ?auto_235198 ?auto_235203 ) ) ( not ( = ?auto_235198 ?auto_235204 ) ) ( not ( = ?auto_235199 ?auto_235200 ) ) ( not ( = ?auto_235199 ?auto_235201 ) ) ( not ( = ?auto_235199 ?auto_235202 ) ) ( not ( = ?auto_235199 ?auto_235203 ) ) ( not ( = ?auto_235199 ?auto_235204 ) ) ( not ( = ?auto_235200 ?auto_235201 ) ) ( not ( = ?auto_235200 ?auto_235202 ) ) ( not ( = ?auto_235200 ?auto_235203 ) ) ( not ( = ?auto_235200 ?auto_235204 ) ) ( not ( = ?auto_235201 ?auto_235202 ) ) ( not ( = ?auto_235201 ?auto_235203 ) ) ( not ( = ?auto_235201 ?auto_235204 ) ) ( not ( = ?auto_235202 ?auto_235203 ) ) ( not ( = ?auto_235202 ?auto_235204 ) ) ( not ( = ?auto_235203 ?auto_235204 ) ) ( ON ?auto_235202 ?auto_235203 ) ( ON ?auto_235201 ?auto_235202 ) ( ON ?auto_235200 ?auto_235201 ) ( ON ?auto_235199 ?auto_235200 ) ( ON ?auto_235198 ?auto_235199 ) ( CLEAR ?auto_235196 ) ( ON ?auto_235197 ?auto_235198 ) ( CLEAR ?auto_235197 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_235193 ?auto_235194 ?auto_235195 ?auto_235196 ?auto_235197 )
      ( MAKE-11PILE ?auto_235193 ?auto_235194 ?auto_235195 ?auto_235196 ?auto_235197 ?auto_235198 ?auto_235199 ?auto_235200 ?auto_235201 ?auto_235202 ?auto_235203 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_235216 - BLOCK
      ?auto_235217 - BLOCK
      ?auto_235218 - BLOCK
      ?auto_235219 - BLOCK
      ?auto_235220 - BLOCK
      ?auto_235221 - BLOCK
      ?auto_235222 - BLOCK
      ?auto_235223 - BLOCK
      ?auto_235224 - BLOCK
      ?auto_235225 - BLOCK
      ?auto_235226 - BLOCK
    )
    :vars
    (
      ?auto_235227 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_235226 ?auto_235227 ) ( ON-TABLE ?auto_235216 ) ( ON ?auto_235217 ?auto_235216 ) ( ON ?auto_235218 ?auto_235217 ) ( ON ?auto_235219 ?auto_235218 ) ( not ( = ?auto_235216 ?auto_235217 ) ) ( not ( = ?auto_235216 ?auto_235218 ) ) ( not ( = ?auto_235216 ?auto_235219 ) ) ( not ( = ?auto_235216 ?auto_235220 ) ) ( not ( = ?auto_235216 ?auto_235221 ) ) ( not ( = ?auto_235216 ?auto_235222 ) ) ( not ( = ?auto_235216 ?auto_235223 ) ) ( not ( = ?auto_235216 ?auto_235224 ) ) ( not ( = ?auto_235216 ?auto_235225 ) ) ( not ( = ?auto_235216 ?auto_235226 ) ) ( not ( = ?auto_235216 ?auto_235227 ) ) ( not ( = ?auto_235217 ?auto_235218 ) ) ( not ( = ?auto_235217 ?auto_235219 ) ) ( not ( = ?auto_235217 ?auto_235220 ) ) ( not ( = ?auto_235217 ?auto_235221 ) ) ( not ( = ?auto_235217 ?auto_235222 ) ) ( not ( = ?auto_235217 ?auto_235223 ) ) ( not ( = ?auto_235217 ?auto_235224 ) ) ( not ( = ?auto_235217 ?auto_235225 ) ) ( not ( = ?auto_235217 ?auto_235226 ) ) ( not ( = ?auto_235217 ?auto_235227 ) ) ( not ( = ?auto_235218 ?auto_235219 ) ) ( not ( = ?auto_235218 ?auto_235220 ) ) ( not ( = ?auto_235218 ?auto_235221 ) ) ( not ( = ?auto_235218 ?auto_235222 ) ) ( not ( = ?auto_235218 ?auto_235223 ) ) ( not ( = ?auto_235218 ?auto_235224 ) ) ( not ( = ?auto_235218 ?auto_235225 ) ) ( not ( = ?auto_235218 ?auto_235226 ) ) ( not ( = ?auto_235218 ?auto_235227 ) ) ( not ( = ?auto_235219 ?auto_235220 ) ) ( not ( = ?auto_235219 ?auto_235221 ) ) ( not ( = ?auto_235219 ?auto_235222 ) ) ( not ( = ?auto_235219 ?auto_235223 ) ) ( not ( = ?auto_235219 ?auto_235224 ) ) ( not ( = ?auto_235219 ?auto_235225 ) ) ( not ( = ?auto_235219 ?auto_235226 ) ) ( not ( = ?auto_235219 ?auto_235227 ) ) ( not ( = ?auto_235220 ?auto_235221 ) ) ( not ( = ?auto_235220 ?auto_235222 ) ) ( not ( = ?auto_235220 ?auto_235223 ) ) ( not ( = ?auto_235220 ?auto_235224 ) ) ( not ( = ?auto_235220 ?auto_235225 ) ) ( not ( = ?auto_235220 ?auto_235226 ) ) ( not ( = ?auto_235220 ?auto_235227 ) ) ( not ( = ?auto_235221 ?auto_235222 ) ) ( not ( = ?auto_235221 ?auto_235223 ) ) ( not ( = ?auto_235221 ?auto_235224 ) ) ( not ( = ?auto_235221 ?auto_235225 ) ) ( not ( = ?auto_235221 ?auto_235226 ) ) ( not ( = ?auto_235221 ?auto_235227 ) ) ( not ( = ?auto_235222 ?auto_235223 ) ) ( not ( = ?auto_235222 ?auto_235224 ) ) ( not ( = ?auto_235222 ?auto_235225 ) ) ( not ( = ?auto_235222 ?auto_235226 ) ) ( not ( = ?auto_235222 ?auto_235227 ) ) ( not ( = ?auto_235223 ?auto_235224 ) ) ( not ( = ?auto_235223 ?auto_235225 ) ) ( not ( = ?auto_235223 ?auto_235226 ) ) ( not ( = ?auto_235223 ?auto_235227 ) ) ( not ( = ?auto_235224 ?auto_235225 ) ) ( not ( = ?auto_235224 ?auto_235226 ) ) ( not ( = ?auto_235224 ?auto_235227 ) ) ( not ( = ?auto_235225 ?auto_235226 ) ) ( not ( = ?auto_235225 ?auto_235227 ) ) ( not ( = ?auto_235226 ?auto_235227 ) ) ( ON ?auto_235225 ?auto_235226 ) ( ON ?auto_235224 ?auto_235225 ) ( ON ?auto_235223 ?auto_235224 ) ( ON ?auto_235222 ?auto_235223 ) ( ON ?auto_235221 ?auto_235222 ) ( CLEAR ?auto_235219 ) ( ON ?auto_235220 ?auto_235221 ) ( CLEAR ?auto_235220 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_235216 ?auto_235217 ?auto_235218 ?auto_235219 ?auto_235220 )
      ( MAKE-11PILE ?auto_235216 ?auto_235217 ?auto_235218 ?auto_235219 ?auto_235220 ?auto_235221 ?auto_235222 ?auto_235223 ?auto_235224 ?auto_235225 ?auto_235226 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_235239 - BLOCK
      ?auto_235240 - BLOCK
      ?auto_235241 - BLOCK
      ?auto_235242 - BLOCK
      ?auto_235243 - BLOCK
      ?auto_235244 - BLOCK
      ?auto_235245 - BLOCK
      ?auto_235246 - BLOCK
      ?auto_235247 - BLOCK
      ?auto_235248 - BLOCK
      ?auto_235249 - BLOCK
    )
    :vars
    (
      ?auto_235250 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_235249 ?auto_235250 ) ( ON-TABLE ?auto_235239 ) ( ON ?auto_235240 ?auto_235239 ) ( ON ?auto_235241 ?auto_235240 ) ( not ( = ?auto_235239 ?auto_235240 ) ) ( not ( = ?auto_235239 ?auto_235241 ) ) ( not ( = ?auto_235239 ?auto_235242 ) ) ( not ( = ?auto_235239 ?auto_235243 ) ) ( not ( = ?auto_235239 ?auto_235244 ) ) ( not ( = ?auto_235239 ?auto_235245 ) ) ( not ( = ?auto_235239 ?auto_235246 ) ) ( not ( = ?auto_235239 ?auto_235247 ) ) ( not ( = ?auto_235239 ?auto_235248 ) ) ( not ( = ?auto_235239 ?auto_235249 ) ) ( not ( = ?auto_235239 ?auto_235250 ) ) ( not ( = ?auto_235240 ?auto_235241 ) ) ( not ( = ?auto_235240 ?auto_235242 ) ) ( not ( = ?auto_235240 ?auto_235243 ) ) ( not ( = ?auto_235240 ?auto_235244 ) ) ( not ( = ?auto_235240 ?auto_235245 ) ) ( not ( = ?auto_235240 ?auto_235246 ) ) ( not ( = ?auto_235240 ?auto_235247 ) ) ( not ( = ?auto_235240 ?auto_235248 ) ) ( not ( = ?auto_235240 ?auto_235249 ) ) ( not ( = ?auto_235240 ?auto_235250 ) ) ( not ( = ?auto_235241 ?auto_235242 ) ) ( not ( = ?auto_235241 ?auto_235243 ) ) ( not ( = ?auto_235241 ?auto_235244 ) ) ( not ( = ?auto_235241 ?auto_235245 ) ) ( not ( = ?auto_235241 ?auto_235246 ) ) ( not ( = ?auto_235241 ?auto_235247 ) ) ( not ( = ?auto_235241 ?auto_235248 ) ) ( not ( = ?auto_235241 ?auto_235249 ) ) ( not ( = ?auto_235241 ?auto_235250 ) ) ( not ( = ?auto_235242 ?auto_235243 ) ) ( not ( = ?auto_235242 ?auto_235244 ) ) ( not ( = ?auto_235242 ?auto_235245 ) ) ( not ( = ?auto_235242 ?auto_235246 ) ) ( not ( = ?auto_235242 ?auto_235247 ) ) ( not ( = ?auto_235242 ?auto_235248 ) ) ( not ( = ?auto_235242 ?auto_235249 ) ) ( not ( = ?auto_235242 ?auto_235250 ) ) ( not ( = ?auto_235243 ?auto_235244 ) ) ( not ( = ?auto_235243 ?auto_235245 ) ) ( not ( = ?auto_235243 ?auto_235246 ) ) ( not ( = ?auto_235243 ?auto_235247 ) ) ( not ( = ?auto_235243 ?auto_235248 ) ) ( not ( = ?auto_235243 ?auto_235249 ) ) ( not ( = ?auto_235243 ?auto_235250 ) ) ( not ( = ?auto_235244 ?auto_235245 ) ) ( not ( = ?auto_235244 ?auto_235246 ) ) ( not ( = ?auto_235244 ?auto_235247 ) ) ( not ( = ?auto_235244 ?auto_235248 ) ) ( not ( = ?auto_235244 ?auto_235249 ) ) ( not ( = ?auto_235244 ?auto_235250 ) ) ( not ( = ?auto_235245 ?auto_235246 ) ) ( not ( = ?auto_235245 ?auto_235247 ) ) ( not ( = ?auto_235245 ?auto_235248 ) ) ( not ( = ?auto_235245 ?auto_235249 ) ) ( not ( = ?auto_235245 ?auto_235250 ) ) ( not ( = ?auto_235246 ?auto_235247 ) ) ( not ( = ?auto_235246 ?auto_235248 ) ) ( not ( = ?auto_235246 ?auto_235249 ) ) ( not ( = ?auto_235246 ?auto_235250 ) ) ( not ( = ?auto_235247 ?auto_235248 ) ) ( not ( = ?auto_235247 ?auto_235249 ) ) ( not ( = ?auto_235247 ?auto_235250 ) ) ( not ( = ?auto_235248 ?auto_235249 ) ) ( not ( = ?auto_235248 ?auto_235250 ) ) ( not ( = ?auto_235249 ?auto_235250 ) ) ( ON ?auto_235248 ?auto_235249 ) ( ON ?auto_235247 ?auto_235248 ) ( ON ?auto_235246 ?auto_235247 ) ( ON ?auto_235245 ?auto_235246 ) ( ON ?auto_235244 ?auto_235245 ) ( ON ?auto_235243 ?auto_235244 ) ( CLEAR ?auto_235241 ) ( ON ?auto_235242 ?auto_235243 ) ( CLEAR ?auto_235242 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_235239 ?auto_235240 ?auto_235241 ?auto_235242 )
      ( MAKE-11PILE ?auto_235239 ?auto_235240 ?auto_235241 ?auto_235242 ?auto_235243 ?auto_235244 ?auto_235245 ?auto_235246 ?auto_235247 ?auto_235248 ?auto_235249 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_235262 - BLOCK
      ?auto_235263 - BLOCK
      ?auto_235264 - BLOCK
      ?auto_235265 - BLOCK
      ?auto_235266 - BLOCK
      ?auto_235267 - BLOCK
      ?auto_235268 - BLOCK
      ?auto_235269 - BLOCK
      ?auto_235270 - BLOCK
      ?auto_235271 - BLOCK
      ?auto_235272 - BLOCK
    )
    :vars
    (
      ?auto_235273 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_235272 ?auto_235273 ) ( ON-TABLE ?auto_235262 ) ( ON ?auto_235263 ?auto_235262 ) ( ON ?auto_235264 ?auto_235263 ) ( not ( = ?auto_235262 ?auto_235263 ) ) ( not ( = ?auto_235262 ?auto_235264 ) ) ( not ( = ?auto_235262 ?auto_235265 ) ) ( not ( = ?auto_235262 ?auto_235266 ) ) ( not ( = ?auto_235262 ?auto_235267 ) ) ( not ( = ?auto_235262 ?auto_235268 ) ) ( not ( = ?auto_235262 ?auto_235269 ) ) ( not ( = ?auto_235262 ?auto_235270 ) ) ( not ( = ?auto_235262 ?auto_235271 ) ) ( not ( = ?auto_235262 ?auto_235272 ) ) ( not ( = ?auto_235262 ?auto_235273 ) ) ( not ( = ?auto_235263 ?auto_235264 ) ) ( not ( = ?auto_235263 ?auto_235265 ) ) ( not ( = ?auto_235263 ?auto_235266 ) ) ( not ( = ?auto_235263 ?auto_235267 ) ) ( not ( = ?auto_235263 ?auto_235268 ) ) ( not ( = ?auto_235263 ?auto_235269 ) ) ( not ( = ?auto_235263 ?auto_235270 ) ) ( not ( = ?auto_235263 ?auto_235271 ) ) ( not ( = ?auto_235263 ?auto_235272 ) ) ( not ( = ?auto_235263 ?auto_235273 ) ) ( not ( = ?auto_235264 ?auto_235265 ) ) ( not ( = ?auto_235264 ?auto_235266 ) ) ( not ( = ?auto_235264 ?auto_235267 ) ) ( not ( = ?auto_235264 ?auto_235268 ) ) ( not ( = ?auto_235264 ?auto_235269 ) ) ( not ( = ?auto_235264 ?auto_235270 ) ) ( not ( = ?auto_235264 ?auto_235271 ) ) ( not ( = ?auto_235264 ?auto_235272 ) ) ( not ( = ?auto_235264 ?auto_235273 ) ) ( not ( = ?auto_235265 ?auto_235266 ) ) ( not ( = ?auto_235265 ?auto_235267 ) ) ( not ( = ?auto_235265 ?auto_235268 ) ) ( not ( = ?auto_235265 ?auto_235269 ) ) ( not ( = ?auto_235265 ?auto_235270 ) ) ( not ( = ?auto_235265 ?auto_235271 ) ) ( not ( = ?auto_235265 ?auto_235272 ) ) ( not ( = ?auto_235265 ?auto_235273 ) ) ( not ( = ?auto_235266 ?auto_235267 ) ) ( not ( = ?auto_235266 ?auto_235268 ) ) ( not ( = ?auto_235266 ?auto_235269 ) ) ( not ( = ?auto_235266 ?auto_235270 ) ) ( not ( = ?auto_235266 ?auto_235271 ) ) ( not ( = ?auto_235266 ?auto_235272 ) ) ( not ( = ?auto_235266 ?auto_235273 ) ) ( not ( = ?auto_235267 ?auto_235268 ) ) ( not ( = ?auto_235267 ?auto_235269 ) ) ( not ( = ?auto_235267 ?auto_235270 ) ) ( not ( = ?auto_235267 ?auto_235271 ) ) ( not ( = ?auto_235267 ?auto_235272 ) ) ( not ( = ?auto_235267 ?auto_235273 ) ) ( not ( = ?auto_235268 ?auto_235269 ) ) ( not ( = ?auto_235268 ?auto_235270 ) ) ( not ( = ?auto_235268 ?auto_235271 ) ) ( not ( = ?auto_235268 ?auto_235272 ) ) ( not ( = ?auto_235268 ?auto_235273 ) ) ( not ( = ?auto_235269 ?auto_235270 ) ) ( not ( = ?auto_235269 ?auto_235271 ) ) ( not ( = ?auto_235269 ?auto_235272 ) ) ( not ( = ?auto_235269 ?auto_235273 ) ) ( not ( = ?auto_235270 ?auto_235271 ) ) ( not ( = ?auto_235270 ?auto_235272 ) ) ( not ( = ?auto_235270 ?auto_235273 ) ) ( not ( = ?auto_235271 ?auto_235272 ) ) ( not ( = ?auto_235271 ?auto_235273 ) ) ( not ( = ?auto_235272 ?auto_235273 ) ) ( ON ?auto_235271 ?auto_235272 ) ( ON ?auto_235270 ?auto_235271 ) ( ON ?auto_235269 ?auto_235270 ) ( ON ?auto_235268 ?auto_235269 ) ( ON ?auto_235267 ?auto_235268 ) ( ON ?auto_235266 ?auto_235267 ) ( CLEAR ?auto_235264 ) ( ON ?auto_235265 ?auto_235266 ) ( CLEAR ?auto_235265 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_235262 ?auto_235263 ?auto_235264 ?auto_235265 )
      ( MAKE-11PILE ?auto_235262 ?auto_235263 ?auto_235264 ?auto_235265 ?auto_235266 ?auto_235267 ?auto_235268 ?auto_235269 ?auto_235270 ?auto_235271 ?auto_235272 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_235285 - BLOCK
      ?auto_235286 - BLOCK
      ?auto_235287 - BLOCK
      ?auto_235288 - BLOCK
      ?auto_235289 - BLOCK
      ?auto_235290 - BLOCK
      ?auto_235291 - BLOCK
      ?auto_235292 - BLOCK
      ?auto_235293 - BLOCK
      ?auto_235294 - BLOCK
      ?auto_235295 - BLOCK
    )
    :vars
    (
      ?auto_235296 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_235295 ?auto_235296 ) ( ON-TABLE ?auto_235285 ) ( ON ?auto_235286 ?auto_235285 ) ( not ( = ?auto_235285 ?auto_235286 ) ) ( not ( = ?auto_235285 ?auto_235287 ) ) ( not ( = ?auto_235285 ?auto_235288 ) ) ( not ( = ?auto_235285 ?auto_235289 ) ) ( not ( = ?auto_235285 ?auto_235290 ) ) ( not ( = ?auto_235285 ?auto_235291 ) ) ( not ( = ?auto_235285 ?auto_235292 ) ) ( not ( = ?auto_235285 ?auto_235293 ) ) ( not ( = ?auto_235285 ?auto_235294 ) ) ( not ( = ?auto_235285 ?auto_235295 ) ) ( not ( = ?auto_235285 ?auto_235296 ) ) ( not ( = ?auto_235286 ?auto_235287 ) ) ( not ( = ?auto_235286 ?auto_235288 ) ) ( not ( = ?auto_235286 ?auto_235289 ) ) ( not ( = ?auto_235286 ?auto_235290 ) ) ( not ( = ?auto_235286 ?auto_235291 ) ) ( not ( = ?auto_235286 ?auto_235292 ) ) ( not ( = ?auto_235286 ?auto_235293 ) ) ( not ( = ?auto_235286 ?auto_235294 ) ) ( not ( = ?auto_235286 ?auto_235295 ) ) ( not ( = ?auto_235286 ?auto_235296 ) ) ( not ( = ?auto_235287 ?auto_235288 ) ) ( not ( = ?auto_235287 ?auto_235289 ) ) ( not ( = ?auto_235287 ?auto_235290 ) ) ( not ( = ?auto_235287 ?auto_235291 ) ) ( not ( = ?auto_235287 ?auto_235292 ) ) ( not ( = ?auto_235287 ?auto_235293 ) ) ( not ( = ?auto_235287 ?auto_235294 ) ) ( not ( = ?auto_235287 ?auto_235295 ) ) ( not ( = ?auto_235287 ?auto_235296 ) ) ( not ( = ?auto_235288 ?auto_235289 ) ) ( not ( = ?auto_235288 ?auto_235290 ) ) ( not ( = ?auto_235288 ?auto_235291 ) ) ( not ( = ?auto_235288 ?auto_235292 ) ) ( not ( = ?auto_235288 ?auto_235293 ) ) ( not ( = ?auto_235288 ?auto_235294 ) ) ( not ( = ?auto_235288 ?auto_235295 ) ) ( not ( = ?auto_235288 ?auto_235296 ) ) ( not ( = ?auto_235289 ?auto_235290 ) ) ( not ( = ?auto_235289 ?auto_235291 ) ) ( not ( = ?auto_235289 ?auto_235292 ) ) ( not ( = ?auto_235289 ?auto_235293 ) ) ( not ( = ?auto_235289 ?auto_235294 ) ) ( not ( = ?auto_235289 ?auto_235295 ) ) ( not ( = ?auto_235289 ?auto_235296 ) ) ( not ( = ?auto_235290 ?auto_235291 ) ) ( not ( = ?auto_235290 ?auto_235292 ) ) ( not ( = ?auto_235290 ?auto_235293 ) ) ( not ( = ?auto_235290 ?auto_235294 ) ) ( not ( = ?auto_235290 ?auto_235295 ) ) ( not ( = ?auto_235290 ?auto_235296 ) ) ( not ( = ?auto_235291 ?auto_235292 ) ) ( not ( = ?auto_235291 ?auto_235293 ) ) ( not ( = ?auto_235291 ?auto_235294 ) ) ( not ( = ?auto_235291 ?auto_235295 ) ) ( not ( = ?auto_235291 ?auto_235296 ) ) ( not ( = ?auto_235292 ?auto_235293 ) ) ( not ( = ?auto_235292 ?auto_235294 ) ) ( not ( = ?auto_235292 ?auto_235295 ) ) ( not ( = ?auto_235292 ?auto_235296 ) ) ( not ( = ?auto_235293 ?auto_235294 ) ) ( not ( = ?auto_235293 ?auto_235295 ) ) ( not ( = ?auto_235293 ?auto_235296 ) ) ( not ( = ?auto_235294 ?auto_235295 ) ) ( not ( = ?auto_235294 ?auto_235296 ) ) ( not ( = ?auto_235295 ?auto_235296 ) ) ( ON ?auto_235294 ?auto_235295 ) ( ON ?auto_235293 ?auto_235294 ) ( ON ?auto_235292 ?auto_235293 ) ( ON ?auto_235291 ?auto_235292 ) ( ON ?auto_235290 ?auto_235291 ) ( ON ?auto_235289 ?auto_235290 ) ( ON ?auto_235288 ?auto_235289 ) ( CLEAR ?auto_235286 ) ( ON ?auto_235287 ?auto_235288 ) ( CLEAR ?auto_235287 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_235285 ?auto_235286 ?auto_235287 )
      ( MAKE-11PILE ?auto_235285 ?auto_235286 ?auto_235287 ?auto_235288 ?auto_235289 ?auto_235290 ?auto_235291 ?auto_235292 ?auto_235293 ?auto_235294 ?auto_235295 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_235308 - BLOCK
      ?auto_235309 - BLOCK
      ?auto_235310 - BLOCK
      ?auto_235311 - BLOCK
      ?auto_235312 - BLOCK
      ?auto_235313 - BLOCK
      ?auto_235314 - BLOCK
      ?auto_235315 - BLOCK
      ?auto_235316 - BLOCK
      ?auto_235317 - BLOCK
      ?auto_235318 - BLOCK
    )
    :vars
    (
      ?auto_235319 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_235318 ?auto_235319 ) ( ON-TABLE ?auto_235308 ) ( ON ?auto_235309 ?auto_235308 ) ( not ( = ?auto_235308 ?auto_235309 ) ) ( not ( = ?auto_235308 ?auto_235310 ) ) ( not ( = ?auto_235308 ?auto_235311 ) ) ( not ( = ?auto_235308 ?auto_235312 ) ) ( not ( = ?auto_235308 ?auto_235313 ) ) ( not ( = ?auto_235308 ?auto_235314 ) ) ( not ( = ?auto_235308 ?auto_235315 ) ) ( not ( = ?auto_235308 ?auto_235316 ) ) ( not ( = ?auto_235308 ?auto_235317 ) ) ( not ( = ?auto_235308 ?auto_235318 ) ) ( not ( = ?auto_235308 ?auto_235319 ) ) ( not ( = ?auto_235309 ?auto_235310 ) ) ( not ( = ?auto_235309 ?auto_235311 ) ) ( not ( = ?auto_235309 ?auto_235312 ) ) ( not ( = ?auto_235309 ?auto_235313 ) ) ( not ( = ?auto_235309 ?auto_235314 ) ) ( not ( = ?auto_235309 ?auto_235315 ) ) ( not ( = ?auto_235309 ?auto_235316 ) ) ( not ( = ?auto_235309 ?auto_235317 ) ) ( not ( = ?auto_235309 ?auto_235318 ) ) ( not ( = ?auto_235309 ?auto_235319 ) ) ( not ( = ?auto_235310 ?auto_235311 ) ) ( not ( = ?auto_235310 ?auto_235312 ) ) ( not ( = ?auto_235310 ?auto_235313 ) ) ( not ( = ?auto_235310 ?auto_235314 ) ) ( not ( = ?auto_235310 ?auto_235315 ) ) ( not ( = ?auto_235310 ?auto_235316 ) ) ( not ( = ?auto_235310 ?auto_235317 ) ) ( not ( = ?auto_235310 ?auto_235318 ) ) ( not ( = ?auto_235310 ?auto_235319 ) ) ( not ( = ?auto_235311 ?auto_235312 ) ) ( not ( = ?auto_235311 ?auto_235313 ) ) ( not ( = ?auto_235311 ?auto_235314 ) ) ( not ( = ?auto_235311 ?auto_235315 ) ) ( not ( = ?auto_235311 ?auto_235316 ) ) ( not ( = ?auto_235311 ?auto_235317 ) ) ( not ( = ?auto_235311 ?auto_235318 ) ) ( not ( = ?auto_235311 ?auto_235319 ) ) ( not ( = ?auto_235312 ?auto_235313 ) ) ( not ( = ?auto_235312 ?auto_235314 ) ) ( not ( = ?auto_235312 ?auto_235315 ) ) ( not ( = ?auto_235312 ?auto_235316 ) ) ( not ( = ?auto_235312 ?auto_235317 ) ) ( not ( = ?auto_235312 ?auto_235318 ) ) ( not ( = ?auto_235312 ?auto_235319 ) ) ( not ( = ?auto_235313 ?auto_235314 ) ) ( not ( = ?auto_235313 ?auto_235315 ) ) ( not ( = ?auto_235313 ?auto_235316 ) ) ( not ( = ?auto_235313 ?auto_235317 ) ) ( not ( = ?auto_235313 ?auto_235318 ) ) ( not ( = ?auto_235313 ?auto_235319 ) ) ( not ( = ?auto_235314 ?auto_235315 ) ) ( not ( = ?auto_235314 ?auto_235316 ) ) ( not ( = ?auto_235314 ?auto_235317 ) ) ( not ( = ?auto_235314 ?auto_235318 ) ) ( not ( = ?auto_235314 ?auto_235319 ) ) ( not ( = ?auto_235315 ?auto_235316 ) ) ( not ( = ?auto_235315 ?auto_235317 ) ) ( not ( = ?auto_235315 ?auto_235318 ) ) ( not ( = ?auto_235315 ?auto_235319 ) ) ( not ( = ?auto_235316 ?auto_235317 ) ) ( not ( = ?auto_235316 ?auto_235318 ) ) ( not ( = ?auto_235316 ?auto_235319 ) ) ( not ( = ?auto_235317 ?auto_235318 ) ) ( not ( = ?auto_235317 ?auto_235319 ) ) ( not ( = ?auto_235318 ?auto_235319 ) ) ( ON ?auto_235317 ?auto_235318 ) ( ON ?auto_235316 ?auto_235317 ) ( ON ?auto_235315 ?auto_235316 ) ( ON ?auto_235314 ?auto_235315 ) ( ON ?auto_235313 ?auto_235314 ) ( ON ?auto_235312 ?auto_235313 ) ( ON ?auto_235311 ?auto_235312 ) ( CLEAR ?auto_235309 ) ( ON ?auto_235310 ?auto_235311 ) ( CLEAR ?auto_235310 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_235308 ?auto_235309 ?auto_235310 )
      ( MAKE-11PILE ?auto_235308 ?auto_235309 ?auto_235310 ?auto_235311 ?auto_235312 ?auto_235313 ?auto_235314 ?auto_235315 ?auto_235316 ?auto_235317 ?auto_235318 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_235331 - BLOCK
      ?auto_235332 - BLOCK
      ?auto_235333 - BLOCK
      ?auto_235334 - BLOCK
      ?auto_235335 - BLOCK
      ?auto_235336 - BLOCK
      ?auto_235337 - BLOCK
      ?auto_235338 - BLOCK
      ?auto_235339 - BLOCK
      ?auto_235340 - BLOCK
      ?auto_235341 - BLOCK
    )
    :vars
    (
      ?auto_235342 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_235341 ?auto_235342 ) ( ON-TABLE ?auto_235331 ) ( not ( = ?auto_235331 ?auto_235332 ) ) ( not ( = ?auto_235331 ?auto_235333 ) ) ( not ( = ?auto_235331 ?auto_235334 ) ) ( not ( = ?auto_235331 ?auto_235335 ) ) ( not ( = ?auto_235331 ?auto_235336 ) ) ( not ( = ?auto_235331 ?auto_235337 ) ) ( not ( = ?auto_235331 ?auto_235338 ) ) ( not ( = ?auto_235331 ?auto_235339 ) ) ( not ( = ?auto_235331 ?auto_235340 ) ) ( not ( = ?auto_235331 ?auto_235341 ) ) ( not ( = ?auto_235331 ?auto_235342 ) ) ( not ( = ?auto_235332 ?auto_235333 ) ) ( not ( = ?auto_235332 ?auto_235334 ) ) ( not ( = ?auto_235332 ?auto_235335 ) ) ( not ( = ?auto_235332 ?auto_235336 ) ) ( not ( = ?auto_235332 ?auto_235337 ) ) ( not ( = ?auto_235332 ?auto_235338 ) ) ( not ( = ?auto_235332 ?auto_235339 ) ) ( not ( = ?auto_235332 ?auto_235340 ) ) ( not ( = ?auto_235332 ?auto_235341 ) ) ( not ( = ?auto_235332 ?auto_235342 ) ) ( not ( = ?auto_235333 ?auto_235334 ) ) ( not ( = ?auto_235333 ?auto_235335 ) ) ( not ( = ?auto_235333 ?auto_235336 ) ) ( not ( = ?auto_235333 ?auto_235337 ) ) ( not ( = ?auto_235333 ?auto_235338 ) ) ( not ( = ?auto_235333 ?auto_235339 ) ) ( not ( = ?auto_235333 ?auto_235340 ) ) ( not ( = ?auto_235333 ?auto_235341 ) ) ( not ( = ?auto_235333 ?auto_235342 ) ) ( not ( = ?auto_235334 ?auto_235335 ) ) ( not ( = ?auto_235334 ?auto_235336 ) ) ( not ( = ?auto_235334 ?auto_235337 ) ) ( not ( = ?auto_235334 ?auto_235338 ) ) ( not ( = ?auto_235334 ?auto_235339 ) ) ( not ( = ?auto_235334 ?auto_235340 ) ) ( not ( = ?auto_235334 ?auto_235341 ) ) ( not ( = ?auto_235334 ?auto_235342 ) ) ( not ( = ?auto_235335 ?auto_235336 ) ) ( not ( = ?auto_235335 ?auto_235337 ) ) ( not ( = ?auto_235335 ?auto_235338 ) ) ( not ( = ?auto_235335 ?auto_235339 ) ) ( not ( = ?auto_235335 ?auto_235340 ) ) ( not ( = ?auto_235335 ?auto_235341 ) ) ( not ( = ?auto_235335 ?auto_235342 ) ) ( not ( = ?auto_235336 ?auto_235337 ) ) ( not ( = ?auto_235336 ?auto_235338 ) ) ( not ( = ?auto_235336 ?auto_235339 ) ) ( not ( = ?auto_235336 ?auto_235340 ) ) ( not ( = ?auto_235336 ?auto_235341 ) ) ( not ( = ?auto_235336 ?auto_235342 ) ) ( not ( = ?auto_235337 ?auto_235338 ) ) ( not ( = ?auto_235337 ?auto_235339 ) ) ( not ( = ?auto_235337 ?auto_235340 ) ) ( not ( = ?auto_235337 ?auto_235341 ) ) ( not ( = ?auto_235337 ?auto_235342 ) ) ( not ( = ?auto_235338 ?auto_235339 ) ) ( not ( = ?auto_235338 ?auto_235340 ) ) ( not ( = ?auto_235338 ?auto_235341 ) ) ( not ( = ?auto_235338 ?auto_235342 ) ) ( not ( = ?auto_235339 ?auto_235340 ) ) ( not ( = ?auto_235339 ?auto_235341 ) ) ( not ( = ?auto_235339 ?auto_235342 ) ) ( not ( = ?auto_235340 ?auto_235341 ) ) ( not ( = ?auto_235340 ?auto_235342 ) ) ( not ( = ?auto_235341 ?auto_235342 ) ) ( ON ?auto_235340 ?auto_235341 ) ( ON ?auto_235339 ?auto_235340 ) ( ON ?auto_235338 ?auto_235339 ) ( ON ?auto_235337 ?auto_235338 ) ( ON ?auto_235336 ?auto_235337 ) ( ON ?auto_235335 ?auto_235336 ) ( ON ?auto_235334 ?auto_235335 ) ( ON ?auto_235333 ?auto_235334 ) ( CLEAR ?auto_235331 ) ( ON ?auto_235332 ?auto_235333 ) ( CLEAR ?auto_235332 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_235331 ?auto_235332 )
      ( MAKE-11PILE ?auto_235331 ?auto_235332 ?auto_235333 ?auto_235334 ?auto_235335 ?auto_235336 ?auto_235337 ?auto_235338 ?auto_235339 ?auto_235340 ?auto_235341 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_235354 - BLOCK
      ?auto_235355 - BLOCK
      ?auto_235356 - BLOCK
      ?auto_235357 - BLOCK
      ?auto_235358 - BLOCK
      ?auto_235359 - BLOCK
      ?auto_235360 - BLOCK
      ?auto_235361 - BLOCK
      ?auto_235362 - BLOCK
      ?auto_235363 - BLOCK
      ?auto_235364 - BLOCK
    )
    :vars
    (
      ?auto_235365 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_235364 ?auto_235365 ) ( ON-TABLE ?auto_235354 ) ( not ( = ?auto_235354 ?auto_235355 ) ) ( not ( = ?auto_235354 ?auto_235356 ) ) ( not ( = ?auto_235354 ?auto_235357 ) ) ( not ( = ?auto_235354 ?auto_235358 ) ) ( not ( = ?auto_235354 ?auto_235359 ) ) ( not ( = ?auto_235354 ?auto_235360 ) ) ( not ( = ?auto_235354 ?auto_235361 ) ) ( not ( = ?auto_235354 ?auto_235362 ) ) ( not ( = ?auto_235354 ?auto_235363 ) ) ( not ( = ?auto_235354 ?auto_235364 ) ) ( not ( = ?auto_235354 ?auto_235365 ) ) ( not ( = ?auto_235355 ?auto_235356 ) ) ( not ( = ?auto_235355 ?auto_235357 ) ) ( not ( = ?auto_235355 ?auto_235358 ) ) ( not ( = ?auto_235355 ?auto_235359 ) ) ( not ( = ?auto_235355 ?auto_235360 ) ) ( not ( = ?auto_235355 ?auto_235361 ) ) ( not ( = ?auto_235355 ?auto_235362 ) ) ( not ( = ?auto_235355 ?auto_235363 ) ) ( not ( = ?auto_235355 ?auto_235364 ) ) ( not ( = ?auto_235355 ?auto_235365 ) ) ( not ( = ?auto_235356 ?auto_235357 ) ) ( not ( = ?auto_235356 ?auto_235358 ) ) ( not ( = ?auto_235356 ?auto_235359 ) ) ( not ( = ?auto_235356 ?auto_235360 ) ) ( not ( = ?auto_235356 ?auto_235361 ) ) ( not ( = ?auto_235356 ?auto_235362 ) ) ( not ( = ?auto_235356 ?auto_235363 ) ) ( not ( = ?auto_235356 ?auto_235364 ) ) ( not ( = ?auto_235356 ?auto_235365 ) ) ( not ( = ?auto_235357 ?auto_235358 ) ) ( not ( = ?auto_235357 ?auto_235359 ) ) ( not ( = ?auto_235357 ?auto_235360 ) ) ( not ( = ?auto_235357 ?auto_235361 ) ) ( not ( = ?auto_235357 ?auto_235362 ) ) ( not ( = ?auto_235357 ?auto_235363 ) ) ( not ( = ?auto_235357 ?auto_235364 ) ) ( not ( = ?auto_235357 ?auto_235365 ) ) ( not ( = ?auto_235358 ?auto_235359 ) ) ( not ( = ?auto_235358 ?auto_235360 ) ) ( not ( = ?auto_235358 ?auto_235361 ) ) ( not ( = ?auto_235358 ?auto_235362 ) ) ( not ( = ?auto_235358 ?auto_235363 ) ) ( not ( = ?auto_235358 ?auto_235364 ) ) ( not ( = ?auto_235358 ?auto_235365 ) ) ( not ( = ?auto_235359 ?auto_235360 ) ) ( not ( = ?auto_235359 ?auto_235361 ) ) ( not ( = ?auto_235359 ?auto_235362 ) ) ( not ( = ?auto_235359 ?auto_235363 ) ) ( not ( = ?auto_235359 ?auto_235364 ) ) ( not ( = ?auto_235359 ?auto_235365 ) ) ( not ( = ?auto_235360 ?auto_235361 ) ) ( not ( = ?auto_235360 ?auto_235362 ) ) ( not ( = ?auto_235360 ?auto_235363 ) ) ( not ( = ?auto_235360 ?auto_235364 ) ) ( not ( = ?auto_235360 ?auto_235365 ) ) ( not ( = ?auto_235361 ?auto_235362 ) ) ( not ( = ?auto_235361 ?auto_235363 ) ) ( not ( = ?auto_235361 ?auto_235364 ) ) ( not ( = ?auto_235361 ?auto_235365 ) ) ( not ( = ?auto_235362 ?auto_235363 ) ) ( not ( = ?auto_235362 ?auto_235364 ) ) ( not ( = ?auto_235362 ?auto_235365 ) ) ( not ( = ?auto_235363 ?auto_235364 ) ) ( not ( = ?auto_235363 ?auto_235365 ) ) ( not ( = ?auto_235364 ?auto_235365 ) ) ( ON ?auto_235363 ?auto_235364 ) ( ON ?auto_235362 ?auto_235363 ) ( ON ?auto_235361 ?auto_235362 ) ( ON ?auto_235360 ?auto_235361 ) ( ON ?auto_235359 ?auto_235360 ) ( ON ?auto_235358 ?auto_235359 ) ( ON ?auto_235357 ?auto_235358 ) ( ON ?auto_235356 ?auto_235357 ) ( CLEAR ?auto_235354 ) ( ON ?auto_235355 ?auto_235356 ) ( CLEAR ?auto_235355 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_235354 ?auto_235355 )
      ( MAKE-11PILE ?auto_235354 ?auto_235355 ?auto_235356 ?auto_235357 ?auto_235358 ?auto_235359 ?auto_235360 ?auto_235361 ?auto_235362 ?auto_235363 ?auto_235364 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_235377 - BLOCK
      ?auto_235378 - BLOCK
      ?auto_235379 - BLOCK
      ?auto_235380 - BLOCK
      ?auto_235381 - BLOCK
      ?auto_235382 - BLOCK
      ?auto_235383 - BLOCK
      ?auto_235384 - BLOCK
      ?auto_235385 - BLOCK
      ?auto_235386 - BLOCK
      ?auto_235387 - BLOCK
    )
    :vars
    (
      ?auto_235388 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_235387 ?auto_235388 ) ( not ( = ?auto_235377 ?auto_235378 ) ) ( not ( = ?auto_235377 ?auto_235379 ) ) ( not ( = ?auto_235377 ?auto_235380 ) ) ( not ( = ?auto_235377 ?auto_235381 ) ) ( not ( = ?auto_235377 ?auto_235382 ) ) ( not ( = ?auto_235377 ?auto_235383 ) ) ( not ( = ?auto_235377 ?auto_235384 ) ) ( not ( = ?auto_235377 ?auto_235385 ) ) ( not ( = ?auto_235377 ?auto_235386 ) ) ( not ( = ?auto_235377 ?auto_235387 ) ) ( not ( = ?auto_235377 ?auto_235388 ) ) ( not ( = ?auto_235378 ?auto_235379 ) ) ( not ( = ?auto_235378 ?auto_235380 ) ) ( not ( = ?auto_235378 ?auto_235381 ) ) ( not ( = ?auto_235378 ?auto_235382 ) ) ( not ( = ?auto_235378 ?auto_235383 ) ) ( not ( = ?auto_235378 ?auto_235384 ) ) ( not ( = ?auto_235378 ?auto_235385 ) ) ( not ( = ?auto_235378 ?auto_235386 ) ) ( not ( = ?auto_235378 ?auto_235387 ) ) ( not ( = ?auto_235378 ?auto_235388 ) ) ( not ( = ?auto_235379 ?auto_235380 ) ) ( not ( = ?auto_235379 ?auto_235381 ) ) ( not ( = ?auto_235379 ?auto_235382 ) ) ( not ( = ?auto_235379 ?auto_235383 ) ) ( not ( = ?auto_235379 ?auto_235384 ) ) ( not ( = ?auto_235379 ?auto_235385 ) ) ( not ( = ?auto_235379 ?auto_235386 ) ) ( not ( = ?auto_235379 ?auto_235387 ) ) ( not ( = ?auto_235379 ?auto_235388 ) ) ( not ( = ?auto_235380 ?auto_235381 ) ) ( not ( = ?auto_235380 ?auto_235382 ) ) ( not ( = ?auto_235380 ?auto_235383 ) ) ( not ( = ?auto_235380 ?auto_235384 ) ) ( not ( = ?auto_235380 ?auto_235385 ) ) ( not ( = ?auto_235380 ?auto_235386 ) ) ( not ( = ?auto_235380 ?auto_235387 ) ) ( not ( = ?auto_235380 ?auto_235388 ) ) ( not ( = ?auto_235381 ?auto_235382 ) ) ( not ( = ?auto_235381 ?auto_235383 ) ) ( not ( = ?auto_235381 ?auto_235384 ) ) ( not ( = ?auto_235381 ?auto_235385 ) ) ( not ( = ?auto_235381 ?auto_235386 ) ) ( not ( = ?auto_235381 ?auto_235387 ) ) ( not ( = ?auto_235381 ?auto_235388 ) ) ( not ( = ?auto_235382 ?auto_235383 ) ) ( not ( = ?auto_235382 ?auto_235384 ) ) ( not ( = ?auto_235382 ?auto_235385 ) ) ( not ( = ?auto_235382 ?auto_235386 ) ) ( not ( = ?auto_235382 ?auto_235387 ) ) ( not ( = ?auto_235382 ?auto_235388 ) ) ( not ( = ?auto_235383 ?auto_235384 ) ) ( not ( = ?auto_235383 ?auto_235385 ) ) ( not ( = ?auto_235383 ?auto_235386 ) ) ( not ( = ?auto_235383 ?auto_235387 ) ) ( not ( = ?auto_235383 ?auto_235388 ) ) ( not ( = ?auto_235384 ?auto_235385 ) ) ( not ( = ?auto_235384 ?auto_235386 ) ) ( not ( = ?auto_235384 ?auto_235387 ) ) ( not ( = ?auto_235384 ?auto_235388 ) ) ( not ( = ?auto_235385 ?auto_235386 ) ) ( not ( = ?auto_235385 ?auto_235387 ) ) ( not ( = ?auto_235385 ?auto_235388 ) ) ( not ( = ?auto_235386 ?auto_235387 ) ) ( not ( = ?auto_235386 ?auto_235388 ) ) ( not ( = ?auto_235387 ?auto_235388 ) ) ( ON ?auto_235386 ?auto_235387 ) ( ON ?auto_235385 ?auto_235386 ) ( ON ?auto_235384 ?auto_235385 ) ( ON ?auto_235383 ?auto_235384 ) ( ON ?auto_235382 ?auto_235383 ) ( ON ?auto_235381 ?auto_235382 ) ( ON ?auto_235380 ?auto_235381 ) ( ON ?auto_235379 ?auto_235380 ) ( ON ?auto_235378 ?auto_235379 ) ( ON ?auto_235377 ?auto_235378 ) ( CLEAR ?auto_235377 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_235377 )
      ( MAKE-11PILE ?auto_235377 ?auto_235378 ?auto_235379 ?auto_235380 ?auto_235381 ?auto_235382 ?auto_235383 ?auto_235384 ?auto_235385 ?auto_235386 ?auto_235387 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_235400 - BLOCK
      ?auto_235401 - BLOCK
      ?auto_235402 - BLOCK
      ?auto_235403 - BLOCK
      ?auto_235404 - BLOCK
      ?auto_235405 - BLOCK
      ?auto_235406 - BLOCK
      ?auto_235407 - BLOCK
      ?auto_235408 - BLOCK
      ?auto_235409 - BLOCK
      ?auto_235410 - BLOCK
    )
    :vars
    (
      ?auto_235411 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_235410 ?auto_235411 ) ( not ( = ?auto_235400 ?auto_235401 ) ) ( not ( = ?auto_235400 ?auto_235402 ) ) ( not ( = ?auto_235400 ?auto_235403 ) ) ( not ( = ?auto_235400 ?auto_235404 ) ) ( not ( = ?auto_235400 ?auto_235405 ) ) ( not ( = ?auto_235400 ?auto_235406 ) ) ( not ( = ?auto_235400 ?auto_235407 ) ) ( not ( = ?auto_235400 ?auto_235408 ) ) ( not ( = ?auto_235400 ?auto_235409 ) ) ( not ( = ?auto_235400 ?auto_235410 ) ) ( not ( = ?auto_235400 ?auto_235411 ) ) ( not ( = ?auto_235401 ?auto_235402 ) ) ( not ( = ?auto_235401 ?auto_235403 ) ) ( not ( = ?auto_235401 ?auto_235404 ) ) ( not ( = ?auto_235401 ?auto_235405 ) ) ( not ( = ?auto_235401 ?auto_235406 ) ) ( not ( = ?auto_235401 ?auto_235407 ) ) ( not ( = ?auto_235401 ?auto_235408 ) ) ( not ( = ?auto_235401 ?auto_235409 ) ) ( not ( = ?auto_235401 ?auto_235410 ) ) ( not ( = ?auto_235401 ?auto_235411 ) ) ( not ( = ?auto_235402 ?auto_235403 ) ) ( not ( = ?auto_235402 ?auto_235404 ) ) ( not ( = ?auto_235402 ?auto_235405 ) ) ( not ( = ?auto_235402 ?auto_235406 ) ) ( not ( = ?auto_235402 ?auto_235407 ) ) ( not ( = ?auto_235402 ?auto_235408 ) ) ( not ( = ?auto_235402 ?auto_235409 ) ) ( not ( = ?auto_235402 ?auto_235410 ) ) ( not ( = ?auto_235402 ?auto_235411 ) ) ( not ( = ?auto_235403 ?auto_235404 ) ) ( not ( = ?auto_235403 ?auto_235405 ) ) ( not ( = ?auto_235403 ?auto_235406 ) ) ( not ( = ?auto_235403 ?auto_235407 ) ) ( not ( = ?auto_235403 ?auto_235408 ) ) ( not ( = ?auto_235403 ?auto_235409 ) ) ( not ( = ?auto_235403 ?auto_235410 ) ) ( not ( = ?auto_235403 ?auto_235411 ) ) ( not ( = ?auto_235404 ?auto_235405 ) ) ( not ( = ?auto_235404 ?auto_235406 ) ) ( not ( = ?auto_235404 ?auto_235407 ) ) ( not ( = ?auto_235404 ?auto_235408 ) ) ( not ( = ?auto_235404 ?auto_235409 ) ) ( not ( = ?auto_235404 ?auto_235410 ) ) ( not ( = ?auto_235404 ?auto_235411 ) ) ( not ( = ?auto_235405 ?auto_235406 ) ) ( not ( = ?auto_235405 ?auto_235407 ) ) ( not ( = ?auto_235405 ?auto_235408 ) ) ( not ( = ?auto_235405 ?auto_235409 ) ) ( not ( = ?auto_235405 ?auto_235410 ) ) ( not ( = ?auto_235405 ?auto_235411 ) ) ( not ( = ?auto_235406 ?auto_235407 ) ) ( not ( = ?auto_235406 ?auto_235408 ) ) ( not ( = ?auto_235406 ?auto_235409 ) ) ( not ( = ?auto_235406 ?auto_235410 ) ) ( not ( = ?auto_235406 ?auto_235411 ) ) ( not ( = ?auto_235407 ?auto_235408 ) ) ( not ( = ?auto_235407 ?auto_235409 ) ) ( not ( = ?auto_235407 ?auto_235410 ) ) ( not ( = ?auto_235407 ?auto_235411 ) ) ( not ( = ?auto_235408 ?auto_235409 ) ) ( not ( = ?auto_235408 ?auto_235410 ) ) ( not ( = ?auto_235408 ?auto_235411 ) ) ( not ( = ?auto_235409 ?auto_235410 ) ) ( not ( = ?auto_235409 ?auto_235411 ) ) ( not ( = ?auto_235410 ?auto_235411 ) ) ( ON ?auto_235409 ?auto_235410 ) ( ON ?auto_235408 ?auto_235409 ) ( ON ?auto_235407 ?auto_235408 ) ( ON ?auto_235406 ?auto_235407 ) ( ON ?auto_235405 ?auto_235406 ) ( ON ?auto_235404 ?auto_235405 ) ( ON ?auto_235403 ?auto_235404 ) ( ON ?auto_235402 ?auto_235403 ) ( ON ?auto_235401 ?auto_235402 ) ( ON ?auto_235400 ?auto_235401 ) ( CLEAR ?auto_235400 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_235400 )
      ( MAKE-11PILE ?auto_235400 ?auto_235401 ?auto_235402 ?auto_235403 ?auto_235404 ?auto_235405 ?auto_235406 ?auto_235407 ?auto_235408 ?auto_235409 ?auto_235410 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_235424 - BLOCK
      ?auto_235425 - BLOCK
      ?auto_235426 - BLOCK
      ?auto_235427 - BLOCK
      ?auto_235428 - BLOCK
      ?auto_235429 - BLOCK
      ?auto_235430 - BLOCK
      ?auto_235431 - BLOCK
      ?auto_235432 - BLOCK
      ?auto_235433 - BLOCK
      ?auto_235434 - BLOCK
      ?auto_235435 - BLOCK
    )
    :vars
    (
      ?auto_235436 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_235434 ) ( ON ?auto_235435 ?auto_235436 ) ( CLEAR ?auto_235435 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_235424 ) ( ON ?auto_235425 ?auto_235424 ) ( ON ?auto_235426 ?auto_235425 ) ( ON ?auto_235427 ?auto_235426 ) ( ON ?auto_235428 ?auto_235427 ) ( ON ?auto_235429 ?auto_235428 ) ( ON ?auto_235430 ?auto_235429 ) ( ON ?auto_235431 ?auto_235430 ) ( ON ?auto_235432 ?auto_235431 ) ( ON ?auto_235433 ?auto_235432 ) ( ON ?auto_235434 ?auto_235433 ) ( not ( = ?auto_235424 ?auto_235425 ) ) ( not ( = ?auto_235424 ?auto_235426 ) ) ( not ( = ?auto_235424 ?auto_235427 ) ) ( not ( = ?auto_235424 ?auto_235428 ) ) ( not ( = ?auto_235424 ?auto_235429 ) ) ( not ( = ?auto_235424 ?auto_235430 ) ) ( not ( = ?auto_235424 ?auto_235431 ) ) ( not ( = ?auto_235424 ?auto_235432 ) ) ( not ( = ?auto_235424 ?auto_235433 ) ) ( not ( = ?auto_235424 ?auto_235434 ) ) ( not ( = ?auto_235424 ?auto_235435 ) ) ( not ( = ?auto_235424 ?auto_235436 ) ) ( not ( = ?auto_235425 ?auto_235426 ) ) ( not ( = ?auto_235425 ?auto_235427 ) ) ( not ( = ?auto_235425 ?auto_235428 ) ) ( not ( = ?auto_235425 ?auto_235429 ) ) ( not ( = ?auto_235425 ?auto_235430 ) ) ( not ( = ?auto_235425 ?auto_235431 ) ) ( not ( = ?auto_235425 ?auto_235432 ) ) ( not ( = ?auto_235425 ?auto_235433 ) ) ( not ( = ?auto_235425 ?auto_235434 ) ) ( not ( = ?auto_235425 ?auto_235435 ) ) ( not ( = ?auto_235425 ?auto_235436 ) ) ( not ( = ?auto_235426 ?auto_235427 ) ) ( not ( = ?auto_235426 ?auto_235428 ) ) ( not ( = ?auto_235426 ?auto_235429 ) ) ( not ( = ?auto_235426 ?auto_235430 ) ) ( not ( = ?auto_235426 ?auto_235431 ) ) ( not ( = ?auto_235426 ?auto_235432 ) ) ( not ( = ?auto_235426 ?auto_235433 ) ) ( not ( = ?auto_235426 ?auto_235434 ) ) ( not ( = ?auto_235426 ?auto_235435 ) ) ( not ( = ?auto_235426 ?auto_235436 ) ) ( not ( = ?auto_235427 ?auto_235428 ) ) ( not ( = ?auto_235427 ?auto_235429 ) ) ( not ( = ?auto_235427 ?auto_235430 ) ) ( not ( = ?auto_235427 ?auto_235431 ) ) ( not ( = ?auto_235427 ?auto_235432 ) ) ( not ( = ?auto_235427 ?auto_235433 ) ) ( not ( = ?auto_235427 ?auto_235434 ) ) ( not ( = ?auto_235427 ?auto_235435 ) ) ( not ( = ?auto_235427 ?auto_235436 ) ) ( not ( = ?auto_235428 ?auto_235429 ) ) ( not ( = ?auto_235428 ?auto_235430 ) ) ( not ( = ?auto_235428 ?auto_235431 ) ) ( not ( = ?auto_235428 ?auto_235432 ) ) ( not ( = ?auto_235428 ?auto_235433 ) ) ( not ( = ?auto_235428 ?auto_235434 ) ) ( not ( = ?auto_235428 ?auto_235435 ) ) ( not ( = ?auto_235428 ?auto_235436 ) ) ( not ( = ?auto_235429 ?auto_235430 ) ) ( not ( = ?auto_235429 ?auto_235431 ) ) ( not ( = ?auto_235429 ?auto_235432 ) ) ( not ( = ?auto_235429 ?auto_235433 ) ) ( not ( = ?auto_235429 ?auto_235434 ) ) ( not ( = ?auto_235429 ?auto_235435 ) ) ( not ( = ?auto_235429 ?auto_235436 ) ) ( not ( = ?auto_235430 ?auto_235431 ) ) ( not ( = ?auto_235430 ?auto_235432 ) ) ( not ( = ?auto_235430 ?auto_235433 ) ) ( not ( = ?auto_235430 ?auto_235434 ) ) ( not ( = ?auto_235430 ?auto_235435 ) ) ( not ( = ?auto_235430 ?auto_235436 ) ) ( not ( = ?auto_235431 ?auto_235432 ) ) ( not ( = ?auto_235431 ?auto_235433 ) ) ( not ( = ?auto_235431 ?auto_235434 ) ) ( not ( = ?auto_235431 ?auto_235435 ) ) ( not ( = ?auto_235431 ?auto_235436 ) ) ( not ( = ?auto_235432 ?auto_235433 ) ) ( not ( = ?auto_235432 ?auto_235434 ) ) ( not ( = ?auto_235432 ?auto_235435 ) ) ( not ( = ?auto_235432 ?auto_235436 ) ) ( not ( = ?auto_235433 ?auto_235434 ) ) ( not ( = ?auto_235433 ?auto_235435 ) ) ( not ( = ?auto_235433 ?auto_235436 ) ) ( not ( = ?auto_235434 ?auto_235435 ) ) ( not ( = ?auto_235434 ?auto_235436 ) ) ( not ( = ?auto_235435 ?auto_235436 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_235435 ?auto_235436 )
      ( !STACK ?auto_235435 ?auto_235434 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_235449 - BLOCK
      ?auto_235450 - BLOCK
      ?auto_235451 - BLOCK
      ?auto_235452 - BLOCK
      ?auto_235453 - BLOCK
      ?auto_235454 - BLOCK
      ?auto_235455 - BLOCK
      ?auto_235456 - BLOCK
      ?auto_235457 - BLOCK
      ?auto_235458 - BLOCK
      ?auto_235459 - BLOCK
      ?auto_235460 - BLOCK
    )
    :vars
    (
      ?auto_235461 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_235459 ) ( ON ?auto_235460 ?auto_235461 ) ( CLEAR ?auto_235460 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_235449 ) ( ON ?auto_235450 ?auto_235449 ) ( ON ?auto_235451 ?auto_235450 ) ( ON ?auto_235452 ?auto_235451 ) ( ON ?auto_235453 ?auto_235452 ) ( ON ?auto_235454 ?auto_235453 ) ( ON ?auto_235455 ?auto_235454 ) ( ON ?auto_235456 ?auto_235455 ) ( ON ?auto_235457 ?auto_235456 ) ( ON ?auto_235458 ?auto_235457 ) ( ON ?auto_235459 ?auto_235458 ) ( not ( = ?auto_235449 ?auto_235450 ) ) ( not ( = ?auto_235449 ?auto_235451 ) ) ( not ( = ?auto_235449 ?auto_235452 ) ) ( not ( = ?auto_235449 ?auto_235453 ) ) ( not ( = ?auto_235449 ?auto_235454 ) ) ( not ( = ?auto_235449 ?auto_235455 ) ) ( not ( = ?auto_235449 ?auto_235456 ) ) ( not ( = ?auto_235449 ?auto_235457 ) ) ( not ( = ?auto_235449 ?auto_235458 ) ) ( not ( = ?auto_235449 ?auto_235459 ) ) ( not ( = ?auto_235449 ?auto_235460 ) ) ( not ( = ?auto_235449 ?auto_235461 ) ) ( not ( = ?auto_235450 ?auto_235451 ) ) ( not ( = ?auto_235450 ?auto_235452 ) ) ( not ( = ?auto_235450 ?auto_235453 ) ) ( not ( = ?auto_235450 ?auto_235454 ) ) ( not ( = ?auto_235450 ?auto_235455 ) ) ( not ( = ?auto_235450 ?auto_235456 ) ) ( not ( = ?auto_235450 ?auto_235457 ) ) ( not ( = ?auto_235450 ?auto_235458 ) ) ( not ( = ?auto_235450 ?auto_235459 ) ) ( not ( = ?auto_235450 ?auto_235460 ) ) ( not ( = ?auto_235450 ?auto_235461 ) ) ( not ( = ?auto_235451 ?auto_235452 ) ) ( not ( = ?auto_235451 ?auto_235453 ) ) ( not ( = ?auto_235451 ?auto_235454 ) ) ( not ( = ?auto_235451 ?auto_235455 ) ) ( not ( = ?auto_235451 ?auto_235456 ) ) ( not ( = ?auto_235451 ?auto_235457 ) ) ( not ( = ?auto_235451 ?auto_235458 ) ) ( not ( = ?auto_235451 ?auto_235459 ) ) ( not ( = ?auto_235451 ?auto_235460 ) ) ( not ( = ?auto_235451 ?auto_235461 ) ) ( not ( = ?auto_235452 ?auto_235453 ) ) ( not ( = ?auto_235452 ?auto_235454 ) ) ( not ( = ?auto_235452 ?auto_235455 ) ) ( not ( = ?auto_235452 ?auto_235456 ) ) ( not ( = ?auto_235452 ?auto_235457 ) ) ( not ( = ?auto_235452 ?auto_235458 ) ) ( not ( = ?auto_235452 ?auto_235459 ) ) ( not ( = ?auto_235452 ?auto_235460 ) ) ( not ( = ?auto_235452 ?auto_235461 ) ) ( not ( = ?auto_235453 ?auto_235454 ) ) ( not ( = ?auto_235453 ?auto_235455 ) ) ( not ( = ?auto_235453 ?auto_235456 ) ) ( not ( = ?auto_235453 ?auto_235457 ) ) ( not ( = ?auto_235453 ?auto_235458 ) ) ( not ( = ?auto_235453 ?auto_235459 ) ) ( not ( = ?auto_235453 ?auto_235460 ) ) ( not ( = ?auto_235453 ?auto_235461 ) ) ( not ( = ?auto_235454 ?auto_235455 ) ) ( not ( = ?auto_235454 ?auto_235456 ) ) ( not ( = ?auto_235454 ?auto_235457 ) ) ( not ( = ?auto_235454 ?auto_235458 ) ) ( not ( = ?auto_235454 ?auto_235459 ) ) ( not ( = ?auto_235454 ?auto_235460 ) ) ( not ( = ?auto_235454 ?auto_235461 ) ) ( not ( = ?auto_235455 ?auto_235456 ) ) ( not ( = ?auto_235455 ?auto_235457 ) ) ( not ( = ?auto_235455 ?auto_235458 ) ) ( not ( = ?auto_235455 ?auto_235459 ) ) ( not ( = ?auto_235455 ?auto_235460 ) ) ( not ( = ?auto_235455 ?auto_235461 ) ) ( not ( = ?auto_235456 ?auto_235457 ) ) ( not ( = ?auto_235456 ?auto_235458 ) ) ( not ( = ?auto_235456 ?auto_235459 ) ) ( not ( = ?auto_235456 ?auto_235460 ) ) ( not ( = ?auto_235456 ?auto_235461 ) ) ( not ( = ?auto_235457 ?auto_235458 ) ) ( not ( = ?auto_235457 ?auto_235459 ) ) ( not ( = ?auto_235457 ?auto_235460 ) ) ( not ( = ?auto_235457 ?auto_235461 ) ) ( not ( = ?auto_235458 ?auto_235459 ) ) ( not ( = ?auto_235458 ?auto_235460 ) ) ( not ( = ?auto_235458 ?auto_235461 ) ) ( not ( = ?auto_235459 ?auto_235460 ) ) ( not ( = ?auto_235459 ?auto_235461 ) ) ( not ( = ?auto_235460 ?auto_235461 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_235460 ?auto_235461 )
      ( !STACK ?auto_235460 ?auto_235459 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_235474 - BLOCK
      ?auto_235475 - BLOCK
      ?auto_235476 - BLOCK
      ?auto_235477 - BLOCK
      ?auto_235478 - BLOCK
      ?auto_235479 - BLOCK
      ?auto_235480 - BLOCK
      ?auto_235481 - BLOCK
      ?auto_235482 - BLOCK
      ?auto_235483 - BLOCK
      ?auto_235484 - BLOCK
      ?auto_235485 - BLOCK
    )
    :vars
    (
      ?auto_235486 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_235485 ?auto_235486 ) ( ON-TABLE ?auto_235474 ) ( ON ?auto_235475 ?auto_235474 ) ( ON ?auto_235476 ?auto_235475 ) ( ON ?auto_235477 ?auto_235476 ) ( ON ?auto_235478 ?auto_235477 ) ( ON ?auto_235479 ?auto_235478 ) ( ON ?auto_235480 ?auto_235479 ) ( ON ?auto_235481 ?auto_235480 ) ( ON ?auto_235482 ?auto_235481 ) ( ON ?auto_235483 ?auto_235482 ) ( not ( = ?auto_235474 ?auto_235475 ) ) ( not ( = ?auto_235474 ?auto_235476 ) ) ( not ( = ?auto_235474 ?auto_235477 ) ) ( not ( = ?auto_235474 ?auto_235478 ) ) ( not ( = ?auto_235474 ?auto_235479 ) ) ( not ( = ?auto_235474 ?auto_235480 ) ) ( not ( = ?auto_235474 ?auto_235481 ) ) ( not ( = ?auto_235474 ?auto_235482 ) ) ( not ( = ?auto_235474 ?auto_235483 ) ) ( not ( = ?auto_235474 ?auto_235484 ) ) ( not ( = ?auto_235474 ?auto_235485 ) ) ( not ( = ?auto_235474 ?auto_235486 ) ) ( not ( = ?auto_235475 ?auto_235476 ) ) ( not ( = ?auto_235475 ?auto_235477 ) ) ( not ( = ?auto_235475 ?auto_235478 ) ) ( not ( = ?auto_235475 ?auto_235479 ) ) ( not ( = ?auto_235475 ?auto_235480 ) ) ( not ( = ?auto_235475 ?auto_235481 ) ) ( not ( = ?auto_235475 ?auto_235482 ) ) ( not ( = ?auto_235475 ?auto_235483 ) ) ( not ( = ?auto_235475 ?auto_235484 ) ) ( not ( = ?auto_235475 ?auto_235485 ) ) ( not ( = ?auto_235475 ?auto_235486 ) ) ( not ( = ?auto_235476 ?auto_235477 ) ) ( not ( = ?auto_235476 ?auto_235478 ) ) ( not ( = ?auto_235476 ?auto_235479 ) ) ( not ( = ?auto_235476 ?auto_235480 ) ) ( not ( = ?auto_235476 ?auto_235481 ) ) ( not ( = ?auto_235476 ?auto_235482 ) ) ( not ( = ?auto_235476 ?auto_235483 ) ) ( not ( = ?auto_235476 ?auto_235484 ) ) ( not ( = ?auto_235476 ?auto_235485 ) ) ( not ( = ?auto_235476 ?auto_235486 ) ) ( not ( = ?auto_235477 ?auto_235478 ) ) ( not ( = ?auto_235477 ?auto_235479 ) ) ( not ( = ?auto_235477 ?auto_235480 ) ) ( not ( = ?auto_235477 ?auto_235481 ) ) ( not ( = ?auto_235477 ?auto_235482 ) ) ( not ( = ?auto_235477 ?auto_235483 ) ) ( not ( = ?auto_235477 ?auto_235484 ) ) ( not ( = ?auto_235477 ?auto_235485 ) ) ( not ( = ?auto_235477 ?auto_235486 ) ) ( not ( = ?auto_235478 ?auto_235479 ) ) ( not ( = ?auto_235478 ?auto_235480 ) ) ( not ( = ?auto_235478 ?auto_235481 ) ) ( not ( = ?auto_235478 ?auto_235482 ) ) ( not ( = ?auto_235478 ?auto_235483 ) ) ( not ( = ?auto_235478 ?auto_235484 ) ) ( not ( = ?auto_235478 ?auto_235485 ) ) ( not ( = ?auto_235478 ?auto_235486 ) ) ( not ( = ?auto_235479 ?auto_235480 ) ) ( not ( = ?auto_235479 ?auto_235481 ) ) ( not ( = ?auto_235479 ?auto_235482 ) ) ( not ( = ?auto_235479 ?auto_235483 ) ) ( not ( = ?auto_235479 ?auto_235484 ) ) ( not ( = ?auto_235479 ?auto_235485 ) ) ( not ( = ?auto_235479 ?auto_235486 ) ) ( not ( = ?auto_235480 ?auto_235481 ) ) ( not ( = ?auto_235480 ?auto_235482 ) ) ( not ( = ?auto_235480 ?auto_235483 ) ) ( not ( = ?auto_235480 ?auto_235484 ) ) ( not ( = ?auto_235480 ?auto_235485 ) ) ( not ( = ?auto_235480 ?auto_235486 ) ) ( not ( = ?auto_235481 ?auto_235482 ) ) ( not ( = ?auto_235481 ?auto_235483 ) ) ( not ( = ?auto_235481 ?auto_235484 ) ) ( not ( = ?auto_235481 ?auto_235485 ) ) ( not ( = ?auto_235481 ?auto_235486 ) ) ( not ( = ?auto_235482 ?auto_235483 ) ) ( not ( = ?auto_235482 ?auto_235484 ) ) ( not ( = ?auto_235482 ?auto_235485 ) ) ( not ( = ?auto_235482 ?auto_235486 ) ) ( not ( = ?auto_235483 ?auto_235484 ) ) ( not ( = ?auto_235483 ?auto_235485 ) ) ( not ( = ?auto_235483 ?auto_235486 ) ) ( not ( = ?auto_235484 ?auto_235485 ) ) ( not ( = ?auto_235484 ?auto_235486 ) ) ( not ( = ?auto_235485 ?auto_235486 ) ) ( CLEAR ?auto_235483 ) ( ON ?auto_235484 ?auto_235485 ) ( CLEAR ?auto_235484 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_235474 ?auto_235475 ?auto_235476 ?auto_235477 ?auto_235478 ?auto_235479 ?auto_235480 ?auto_235481 ?auto_235482 ?auto_235483 ?auto_235484 )
      ( MAKE-12PILE ?auto_235474 ?auto_235475 ?auto_235476 ?auto_235477 ?auto_235478 ?auto_235479 ?auto_235480 ?auto_235481 ?auto_235482 ?auto_235483 ?auto_235484 ?auto_235485 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_235499 - BLOCK
      ?auto_235500 - BLOCK
      ?auto_235501 - BLOCK
      ?auto_235502 - BLOCK
      ?auto_235503 - BLOCK
      ?auto_235504 - BLOCK
      ?auto_235505 - BLOCK
      ?auto_235506 - BLOCK
      ?auto_235507 - BLOCK
      ?auto_235508 - BLOCK
      ?auto_235509 - BLOCK
      ?auto_235510 - BLOCK
    )
    :vars
    (
      ?auto_235511 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_235510 ?auto_235511 ) ( ON-TABLE ?auto_235499 ) ( ON ?auto_235500 ?auto_235499 ) ( ON ?auto_235501 ?auto_235500 ) ( ON ?auto_235502 ?auto_235501 ) ( ON ?auto_235503 ?auto_235502 ) ( ON ?auto_235504 ?auto_235503 ) ( ON ?auto_235505 ?auto_235504 ) ( ON ?auto_235506 ?auto_235505 ) ( ON ?auto_235507 ?auto_235506 ) ( ON ?auto_235508 ?auto_235507 ) ( not ( = ?auto_235499 ?auto_235500 ) ) ( not ( = ?auto_235499 ?auto_235501 ) ) ( not ( = ?auto_235499 ?auto_235502 ) ) ( not ( = ?auto_235499 ?auto_235503 ) ) ( not ( = ?auto_235499 ?auto_235504 ) ) ( not ( = ?auto_235499 ?auto_235505 ) ) ( not ( = ?auto_235499 ?auto_235506 ) ) ( not ( = ?auto_235499 ?auto_235507 ) ) ( not ( = ?auto_235499 ?auto_235508 ) ) ( not ( = ?auto_235499 ?auto_235509 ) ) ( not ( = ?auto_235499 ?auto_235510 ) ) ( not ( = ?auto_235499 ?auto_235511 ) ) ( not ( = ?auto_235500 ?auto_235501 ) ) ( not ( = ?auto_235500 ?auto_235502 ) ) ( not ( = ?auto_235500 ?auto_235503 ) ) ( not ( = ?auto_235500 ?auto_235504 ) ) ( not ( = ?auto_235500 ?auto_235505 ) ) ( not ( = ?auto_235500 ?auto_235506 ) ) ( not ( = ?auto_235500 ?auto_235507 ) ) ( not ( = ?auto_235500 ?auto_235508 ) ) ( not ( = ?auto_235500 ?auto_235509 ) ) ( not ( = ?auto_235500 ?auto_235510 ) ) ( not ( = ?auto_235500 ?auto_235511 ) ) ( not ( = ?auto_235501 ?auto_235502 ) ) ( not ( = ?auto_235501 ?auto_235503 ) ) ( not ( = ?auto_235501 ?auto_235504 ) ) ( not ( = ?auto_235501 ?auto_235505 ) ) ( not ( = ?auto_235501 ?auto_235506 ) ) ( not ( = ?auto_235501 ?auto_235507 ) ) ( not ( = ?auto_235501 ?auto_235508 ) ) ( not ( = ?auto_235501 ?auto_235509 ) ) ( not ( = ?auto_235501 ?auto_235510 ) ) ( not ( = ?auto_235501 ?auto_235511 ) ) ( not ( = ?auto_235502 ?auto_235503 ) ) ( not ( = ?auto_235502 ?auto_235504 ) ) ( not ( = ?auto_235502 ?auto_235505 ) ) ( not ( = ?auto_235502 ?auto_235506 ) ) ( not ( = ?auto_235502 ?auto_235507 ) ) ( not ( = ?auto_235502 ?auto_235508 ) ) ( not ( = ?auto_235502 ?auto_235509 ) ) ( not ( = ?auto_235502 ?auto_235510 ) ) ( not ( = ?auto_235502 ?auto_235511 ) ) ( not ( = ?auto_235503 ?auto_235504 ) ) ( not ( = ?auto_235503 ?auto_235505 ) ) ( not ( = ?auto_235503 ?auto_235506 ) ) ( not ( = ?auto_235503 ?auto_235507 ) ) ( not ( = ?auto_235503 ?auto_235508 ) ) ( not ( = ?auto_235503 ?auto_235509 ) ) ( not ( = ?auto_235503 ?auto_235510 ) ) ( not ( = ?auto_235503 ?auto_235511 ) ) ( not ( = ?auto_235504 ?auto_235505 ) ) ( not ( = ?auto_235504 ?auto_235506 ) ) ( not ( = ?auto_235504 ?auto_235507 ) ) ( not ( = ?auto_235504 ?auto_235508 ) ) ( not ( = ?auto_235504 ?auto_235509 ) ) ( not ( = ?auto_235504 ?auto_235510 ) ) ( not ( = ?auto_235504 ?auto_235511 ) ) ( not ( = ?auto_235505 ?auto_235506 ) ) ( not ( = ?auto_235505 ?auto_235507 ) ) ( not ( = ?auto_235505 ?auto_235508 ) ) ( not ( = ?auto_235505 ?auto_235509 ) ) ( not ( = ?auto_235505 ?auto_235510 ) ) ( not ( = ?auto_235505 ?auto_235511 ) ) ( not ( = ?auto_235506 ?auto_235507 ) ) ( not ( = ?auto_235506 ?auto_235508 ) ) ( not ( = ?auto_235506 ?auto_235509 ) ) ( not ( = ?auto_235506 ?auto_235510 ) ) ( not ( = ?auto_235506 ?auto_235511 ) ) ( not ( = ?auto_235507 ?auto_235508 ) ) ( not ( = ?auto_235507 ?auto_235509 ) ) ( not ( = ?auto_235507 ?auto_235510 ) ) ( not ( = ?auto_235507 ?auto_235511 ) ) ( not ( = ?auto_235508 ?auto_235509 ) ) ( not ( = ?auto_235508 ?auto_235510 ) ) ( not ( = ?auto_235508 ?auto_235511 ) ) ( not ( = ?auto_235509 ?auto_235510 ) ) ( not ( = ?auto_235509 ?auto_235511 ) ) ( not ( = ?auto_235510 ?auto_235511 ) ) ( CLEAR ?auto_235508 ) ( ON ?auto_235509 ?auto_235510 ) ( CLEAR ?auto_235509 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_235499 ?auto_235500 ?auto_235501 ?auto_235502 ?auto_235503 ?auto_235504 ?auto_235505 ?auto_235506 ?auto_235507 ?auto_235508 ?auto_235509 )
      ( MAKE-12PILE ?auto_235499 ?auto_235500 ?auto_235501 ?auto_235502 ?auto_235503 ?auto_235504 ?auto_235505 ?auto_235506 ?auto_235507 ?auto_235508 ?auto_235509 ?auto_235510 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_235524 - BLOCK
      ?auto_235525 - BLOCK
      ?auto_235526 - BLOCK
      ?auto_235527 - BLOCK
      ?auto_235528 - BLOCK
      ?auto_235529 - BLOCK
      ?auto_235530 - BLOCK
      ?auto_235531 - BLOCK
      ?auto_235532 - BLOCK
      ?auto_235533 - BLOCK
      ?auto_235534 - BLOCK
      ?auto_235535 - BLOCK
    )
    :vars
    (
      ?auto_235536 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_235535 ?auto_235536 ) ( ON-TABLE ?auto_235524 ) ( ON ?auto_235525 ?auto_235524 ) ( ON ?auto_235526 ?auto_235525 ) ( ON ?auto_235527 ?auto_235526 ) ( ON ?auto_235528 ?auto_235527 ) ( ON ?auto_235529 ?auto_235528 ) ( ON ?auto_235530 ?auto_235529 ) ( ON ?auto_235531 ?auto_235530 ) ( ON ?auto_235532 ?auto_235531 ) ( not ( = ?auto_235524 ?auto_235525 ) ) ( not ( = ?auto_235524 ?auto_235526 ) ) ( not ( = ?auto_235524 ?auto_235527 ) ) ( not ( = ?auto_235524 ?auto_235528 ) ) ( not ( = ?auto_235524 ?auto_235529 ) ) ( not ( = ?auto_235524 ?auto_235530 ) ) ( not ( = ?auto_235524 ?auto_235531 ) ) ( not ( = ?auto_235524 ?auto_235532 ) ) ( not ( = ?auto_235524 ?auto_235533 ) ) ( not ( = ?auto_235524 ?auto_235534 ) ) ( not ( = ?auto_235524 ?auto_235535 ) ) ( not ( = ?auto_235524 ?auto_235536 ) ) ( not ( = ?auto_235525 ?auto_235526 ) ) ( not ( = ?auto_235525 ?auto_235527 ) ) ( not ( = ?auto_235525 ?auto_235528 ) ) ( not ( = ?auto_235525 ?auto_235529 ) ) ( not ( = ?auto_235525 ?auto_235530 ) ) ( not ( = ?auto_235525 ?auto_235531 ) ) ( not ( = ?auto_235525 ?auto_235532 ) ) ( not ( = ?auto_235525 ?auto_235533 ) ) ( not ( = ?auto_235525 ?auto_235534 ) ) ( not ( = ?auto_235525 ?auto_235535 ) ) ( not ( = ?auto_235525 ?auto_235536 ) ) ( not ( = ?auto_235526 ?auto_235527 ) ) ( not ( = ?auto_235526 ?auto_235528 ) ) ( not ( = ?auto_235526 ?auto_235529 ) ) ( not ( = ?auto_235526 ?auto_235530 ) ) ( not ( = ?auto_235526 ?auto_235531 ) ) ( not ( = ?auto_235526 ?auto_235532 ) ) ( not ( = ?auto_235526 ?auto_235533 ) ) ( not ( = ?auto_235526 ?auto_235534 ) ) ( not ( = ?auto_235526 ?auto_235535 ) ) ( not ( = ?auto_235526 ?auto_235536 ) ) ( not ( = ?auto_235527 ?auto_235528 ) ) ( not ( = ?auto_235527 ?auto_235529 ) ) ( not ( = ?auto_235527 ?auto_235530 ) ) ( not ( = ?auto_235527 ?auto_235531 ) ) ( not ( = ?auto_235527 ?auto_235532 ) ) ( not ( = ?auto_235527 ?auto_235533 ) ) ( not ( = ?auto_235527 ?auto_235534 ) ) ( not ( = ?auto_235527 ?auto_235535 ) ) ( not ( = ?auto_235527 ?auto_235536 ) ) ( not ( = ?auto_235528 ?auto_235529 ) ) ( not ( = ?auto_235528 ?auto_235530 ) ) ( not ( = ?auto_235528 ?auto_235531 ) ) ( not ( = ?auto_235528 ?auto_235532 ) ) ( not ( = ?auto_235528 ?auto_235533 ) ) ( not ( = ?auto_235528 ?auto_235534 ) ) ( not ( = ?auto_235528 ?auto_235535 ) ) ( not ( = ?auto_235528 ?auto_235536 ) ) ( not ( = ?auto_235529 ?auto_235530 ) ) ( not ( = ?auto_235529 ?auto_235531 ) ) ( not ( = ?auto_235529 ?auto_235532 ) ) ( not ( = ?auto_235529 ?auto_235533 ) ) ( not ( = ?auto_235529 ?auto_235534 ) ) ( not ( = ?auto_235529 ?auto_235535 ) ) ( not ( = ?auto_235529 ?auto_235536 ) ) ( not ( = ?auto_235530 ?auto_235531 ) ) ( not ( = ?auto_235530 ?auto_235532 ) ) ( not ( = ?auto_235530 ?auto_235533 ) ) ( not ( = ?auto_235530 ?auto_235534 ) ) ( not ( = ?auto_235530 ?auto_235535 ) ) ( not ( = ?auto_235530 ?auto_235536 ) ) ( not ( = ?auto_235531 ?auto_235532 ) ) ( not ( = ?auto_235531 ?auto_235533 ) ) ( not ( = ?auto_235531 ?auto_235534 ) ) ( not ( = ?auto_235531 ?auto_235535 ) ) ( not ( = ?auto_235531 ?auto_235536 ) ) ( not ( = ?auto_235532 ?auto_235533 ) ) ( not ( = ?auto_235532 ?auto_235534 ) ) ( not ( = ?auto_235532 ?auto_235535 ) ) ( not ( = ?auto_235532 ?auto_235536 ) ) ( not ( = ?auto_235533 ?auto_235534 ) ) ( not ( = ?auto_235533 ?auto_235535 ) ) ( not ( = ?auto_235533 ?auto_235536 ) ) ( not ( = ?auto_235534 ?auto_235535 ) ) ( not ( = ?auto_235534 ?auto_235536 ) ) ( not ( = ?auto_235535 ?auto_235536 ) ) ( ON ?auto_235534 ?auto_235535 ) ( CLEAR ?auto_235532 ) ( ON ?auto_235533 ?auto_235534 ) ( CLEAR ?auto_235533 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_235524 ?auto_235525 ?auto_235526 ?auto_235527 ?auto_235528 ?auto_235529 ?auto_235530 ?auto_235531 ?auto_235532 ?auto_235533 )
      ( MAKE-12PILE ?auto_235524 ?auto_235525 ?auto_235526 ?auto_235527 ?auto_235528 ?auto_235529 ?auto_235530 ?auto_235531 ?auto_235532 ?auto_235533 ?auto_235534 ?auto_235535 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_235549 - BLOCK
      ?auto_235550 - BLOCK
      ?auto_235551 - BLOCK
      ?auto_235552 - BLOCK
      ?auto_235553 - BLOCK
      ?auto_235554 - BLOCK
      ?auto_235555 - BLOCK
      ?auto_235556 - BLOCK
      ?auto_235557 - BLOCK
      ?auto_235558 - BLOCK
      ?auto_235559 - BLOCK
      ?auto_235560 - BLOCK
    )
    :vars
    (
      ?auto_235561 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_235560 ?auto_235561 ) ( ON-TABLE ?auto_235549 ) ( ON ?auto_235550 ?auto_235549 ) ( ON ?auto_235551 ?auto_235550 ) ( ON ?auto_235552 ?auto_235551 ) ( ON ?auto_235553 ?auto_235552 ) ( ON ?auto_235554 ?auto_235553 ) ( ON ?auto_235555 ?auto_235554 ) ( ON ?auto_235556 ?auto_235555 ) ( ON ?auto_235557 ?auto_235556 ) ( not ( = ?auto_235549 ?auto_235550 ) ) ( not ( = ?auto_235549 ?auto_235551 ) ) ( not ( = ?auto_235549 ?auto_235552 ) ) ( not ( = ?auto_235549 ?auto_235553 ) ) ( not ( = ?auto_235549 ?auto_235554 ) ) ( not ( = ?auto_235549 ?auto_235555 ) ) ( not ( = ?auto_235549 ?auto_235556 ) ) ( not ( = ?auto_235549 ?auto_235557 ) ) ( not ( = ?auto_235549 ?auto_235558 ) ) ( not ( = ?auto_235549 ?auto_235559 ) ) ( not ( = ?auto_235549 ?auto_235560 ) ) ( not ( = ?auto_235549 ?auto_235561 ) ) ( not ( = ?auto_235550 ?auto_235551 ) ) ( not ( = ?auto_235550 ?auto_235552 ) ) ( not ( = ?auto_235550 ?auto_235553 ) ) ( not ( = ?auto_235550 ?auto_235554 ) ) ( not ( = ?auto_235550 ?auto_235555 ) ) ( not ( = ?auto_235550 ?auto_235556 ) ) ( not ( = ?auto_235550 ?auto_235557 ) ) ( not ( = ?auto_235550 ?auto_235558 ) ) ( not ( = ?auto_235550 ?auto_235559 ) ) ( not ( = ?auto_235550 ?auto_235560 ) ) ( not ( = ?auto_235550 ?auto_235561 ) ) ( not ( = ?auto_235551 ?auto_235552 ) ) ( not ( = ?auto_235551 ?auto_235553 ) ) ( not ( = ?auto_235551 ?auto_235554 ) ) ( not ( = ?auto_235551 ?auto_235555 ) ) ( not ( = ?auto_235551 ?auto_235556 ) ) ( not ( = ?auto_235551 ?auto_235557 ) ) ( not ( = ?auto_235551 ?auto_235558 ) ) ( not ( = ?auto_235551 ?auto_235559 ) ) ( not ( = ?auto_235551 ?auto_235560 ) ) ( not ( = ?auto_235551 ?auto_235561 ) ) ( not ( = ?auto_235552 ?auto_235553 ) ) ( not ( = ?auto_235552 ?auto_235554 ) ) ( not ( = ?auto_235552 ?auto_235555 ) ) ( not ( = ?auto_235552 ?auto_235556 ) ) ( not ( = ?auto_235552 ?auto_235557 ) ) ( not ( = ?auto_235552 ?auto_235558 ) ) ( not ( = ?auto_235552 ?auto_235559 ) ) ( not ( = ?auto_235552 ?auto_235560 ) ) ( not ( = ?auto_235552 ?auto_235561 ) ) ( not ( = ?auto_235553 ?auto_235554 ) ) ( not ( = ?auto_235553 ?auto_235555 ) ) ( not ( = ?auto_235553 ?auto_235556 ) ) ( not ( = ?auto_235553 ?auto_235557 ) ) ( not ( = ?auto_235553 ?auto_235558 ) ) ( not ( = ?auto_235553 ?auto_235559 ) ) ( not ( = ?auto_235553 ?auto_235560 ) ) ( not ( = ?auto_235553 ?auto_235561 ) ) ( not ( = ?auto_235554 ?auto_235555 ) ) ( not ( = ?auto_235554 ?auto_235556 ) ) ( not ( = ?auto_235554 ?auto_235557 ) ) ( not ( = ?auto_235554 ?auto_235558 ) ) ( not ( = ?auto_235554 ?auto_235559 ) ) ( not ( = ?auto_235554 ?auto_235560 ) ) ( not ( = ?auto_235554 ?auto_235561 ) ) ( not ( = ?auto_235555 ?auto_235556 ) ) ( not ( = ?auto_235555 ?auto_235557 ) ) ( not ( = ?auto_235555 ?auto_235558 ) ) ( not ( = ?auto_235555 ?auto_235559 ) ) ( not ( = ?auto_235555 ?auto_235560 ) ) ( not ( = ?auto_235555 ?auto_235561 ) ) ( not ( = ?auto_235556 ?auto_235557 ) ) ( not ( = ?auto_235556 ?auto_235558 ) ) ( not ( = ?auto_235556 ?auto_235559 ) ) ( not ( = ?auto_235556 ?auto_235560 ) ) ( not ( = ?auto_235556 ?auto_235561 ) ) ( not ( = ?auto_235557 ?auto_235558 ) ) ( not ( = ?auto_235557 ?auto_235559 ) ) ( not ( = ?auto_235557 ?auto_235560 ) ) ( not ( = ?auto_235557 ?auto_235561 ) ) ( not ( = ?auto_235558 ?auto_235559 ) ) ( not ( = ?auto_235558 ?auto_235560 ) ) ( not ( = ?auto_235558 ?auto_235561 ) ) ( not ( = ?auto_235559 ?auto_235560 ) ) ( not ( = ?auto_235559 ?auto_235561 ) ) ( not ( = ?auto_235560 ?auto_235561 ) ) ( ON ?auto_235559 ?auto_235560 ) ( CLEAR ?auto_235557 ) ( ON ?auto_235558 ?auto_235559 ) ( CLEAR ?auto_235558 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_235549 ?auto_235550 ?auto_235551 ?auto_235552 ?auto_235553 ?auto_235554 ?auto_235555 ?auto_235556 ?auto_235557 ?auto_235558 )
      ( MAKE-12PILE ?auto_235549 ?auto_235550 ?auto_235551 ?auto_235552 ?auto_235553 ?auto_235554 ?auto_235555 ?auto_235556 ?auto_235557 ?auto_235558 ?auto_235559 ?auto_235560 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_235574 - BLOCK
      ?auto_235575 - BLOCK
      ?auto_235576 - BLOCK
      ?auto_235577 - BLOCK
      ?auto_235578 - BLOCK
      ?auto_235579 - BLOCK
      ?auto_235580 - BLOCK
      ?auto_235581 - BLOCK
      ?auto_235582 - BLOCK
      ?auto_235583 - BLOCK
      ?auto_235584 - BLOCK
      ?auto_235585 - BLOCK
    )
    :vars
    (
      ?auto_235586 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_235585 ?auto_235586 ) ( ON-TABLE ?auto_235574 ) ( ON ?auto_235575 ?auto_235574 ) ( ON ?auto_235576 ?auto_235575 ) ( ON ?auto_235577 ?auto_235576 ) ( ON ?auto_235578 ?auto_235577 ) ( ON ?auto_235579 ?auto_235578 ) ( ON ?auto_235580 ?auto_235579 ) ( ON ?auto_235581 ?auto_235580 ) ( not ( = ?auto_235574 ?auto_235575 ) ) ( not ( = ?auto_235574 ?auto_235576 ) ) ( not ( = ?auto_235574 ?auto_235577 ) ) ( not ( = ?auto_235574 ?auto_235578 ) ) ( not ( = ?auto_235574 ?auto_235579 ) ) ( not ( = ?auto_235574 ?auto_235580 ) ) ( not ( = ?auto_235574 ?auto_235581 ) ) ( not ( = ?auto_235574 ?auto_235582 ) ) ( not ( = ?auto_235574 ?auto_235583 ) ) ( not ( = ?auto_235574 ?auto_235584 ) ) ( not ( = ?auto_235574 ?auto_235585 ) ) ( not ( = ?auto_235574 ?auto_235586 ) ) ( not ( = ?auto_235575 ?auto_235576 ) ) ( not ( = ?auto_235575 ?auto_235577 ) ) ( not ( = ?auto_235575 ?auto_235578 ) ) ( not ( = ?auto_235575 ?auto_235579 ) ) ( not ( = ?auto_235575 ?auto_235580 ) ) ( not ( = ?auto_235575 ?auto_235581 ) ) ( not ( = ?auto_235575 ?auto_235582 ) ) ( not ( = ?auto_235575 ?auto_235583 ) ) ( not ( = ?auto_235575 ?auto_235584 ) ) ( not ( = ?auto_235575 ?auto_235585 ) ) ( not ( = ?auto_235575 ?auto_235586 ) ) ( not ( = ?auto_235576 ?auto_235577 ) ) ( not ( = ?auto_235576 ?auto_235578 ) ) ( not ( = ?auto_235576 ?auto_235579 ) ) ( not ( = ?auto_235576 ?auto_235580 ) ) ( not ( = ?auto_235576 ?auto_235581 ) ) ( not ( = ?auto_235576 ?auto_235582 ) ) ( not ( = ?auto_235576 ?auto_235583 ) ) ( not ( = ?auto_235576 ?auto_235584 ) ) ( not ( = ?auto_235576 ?auto_235585 ) ) ( not ( = ?auto_235576 ?auto_235586 ) ) ( not ( = ?auto_235577 ?auto_235578 ) ) ( not ( = ?auto_235577 ?auto_235579 ) ) ( not ( = ?auto_235577 ?auto_235580 ) ) ( not ( = ?auto_235577 ?auto_235581 ) ) ( not ( = ?auto_235577 ?auto_235582 ) ) ( not ( = ?auto_235577 ?auto_235583 ) ) ( not ( = ?auto_235577 ?auto_235584 ) ) ( not ( = ?auto_235577 ?auto_235585 ) ) ( not ( = ?auto_235577 ?auto_235586 ) ) ( not ( = ?auto_235578 ?auto_235579 ) ) ( not ( = ?auto_235578 ?auto_235580 ) ) ( not ( = ?auto_235578 ?auto_235581 ) ) ( not ( = ?auto_235578 ?auto_235582 ) ) ( not ( = ?auto_235578 ?auto_235583 ) ) ( not ( = ?auto_235578 ?auto_235584 ) ) ( not ( = ?auto_235578 ?auto_235585 ) ) ( not ( = ?auto_235578 ?auto_235586 ) ) ( not ( = ?auto_235579 ?auto_235580 ) ) ( not ( = ?auto_235579 ?auto_235581 ) ) ( not ( = ?auto_235579 ?auto_235582 ) ) ( not ( = ?auto_235579 ?auto_235583 ) ) ( not ( = ?auto_235579 ?auto_235584 ) ) ( not ( = ?auto_235579 ?auto_235585 ) ) ( not ( = ?auto_235579 ?auto_235586 ) ) ( not ( = ?auto_235580 ?auto_235581 ) ) ( not ( = ?auto_235580 ?auto_235582 ) ) ( not ( = ?auto_235580 ?auto_235583 ) ) ( not ( = ?auto_235580 ?auto_235584 ) ) ( not ( = ?auto_235580 ?auto_235585 ) ) ( not ( = ?auto_235580 ?auto_235586 ) ) ( not ( = ?auto_235581 ?auto_235582 ) ) ( not ( = ?auto_235581 ?auto_235583 ) ) ( not ( = ?auto_235581 ?auto_235584 ) ) ( not ( = ?auto_235581 ?auto_235585 ) ) ( not ( = ?auto_235581 ?auto_235586 ) ) ( not ( = ?auto_235582 ?auto_235583 ) ) ( not ( = ?auto_235582 ?auto_235584 ) ) ( not ( = ?auto_235582 ?auto_235585 ) ) ( not ( = ?auto_235582 ?auto_235586 ) ) ( not ( = ?auto_235583 ?auto_235584 ) ) ( not ( = ?auto_235583 ?auto_235585 ) ) ( not ( = ?auto_235583 ?auto_235586 ) ) ( not ( = ?auto_235584 ?auto_235585 ) ) ( not ( = ?auto_235584 ?auto_235586 ) ) ( not ( = ?auto_235585 ?auto_235586 ) ) ( ON ?auto_235584 ?auto_235585 ) ( ON ?auto_235583 ?auto_235584 ) ( CLEAR ?auto_235581 ) ( ON ?auto_235582 ?auto_235583 ) ( CLEAR ?auto_235582 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_235574 ?auto_235575 ?auto_235576 ?auto_235577 ?auto_235578 ?auto_235579 ?auto_235580 ?auto_235581 ?auto_235582 )
      ( MAKE-12PILE ?auto_235574 ?auto_235575 ?auto_235576 ?auto_235577 ?auto_235578 ?auto_235579 ?auto_235580 ?auto_235581 ?auto_235582 ?auto_235583 ?auto_235584 ?auto_235585 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_235599 - BLOCK
      ?auto_235600 - BLOCK
      ?auto_235601 - BLOCK
      ?auto_235602 - BLOCK
      ?auto_235603 - BLOCK
      ?auto_235604 - BLOCK
      ?auto_235605 - BLOCK
      ?auto_235606 - BLOCK
      ?auto_235607 - BLOCK
      ?auto_235608 - BLOCK
      ?auto_235609 - BLOCK
      ?auto_235610 - BLOCK
    )
    :vars
    (
      ?auto_235611 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_235610 ?auto_235611 ) ( ON-TABLE ?auto_235599 ) ( ON ?auto_235600 ?auto_235599 ) ( ON ?auto_235601 ?auto_235600 ) ( ON ?auto_235602 ?auto_235601 ) ( ON ?auto_235603 ?auto_235602 ) ( ON ?auto_235604 ?auto_235603 ) ( ON ?auto_235605 ?auto_235604 ) ( ON ?auto_235606 ?auto_235605 ) ( not ( = ?auto_235599 ?auto_235600 ) ) ( not ( = ?auto_235599 ?auto_235601 ) ) ( not ( = ?auto_235599 ?auto_235602 ) ) ( not ( = ?auto_235599 ?auto_235603 ) ) ( not ( = ?auto_235599 ?auto_235604 ) ) ( not ( = ?auto_235599 ?auto_235605 ) ) ( not ( = ?auto_235599 ?auto_235606 ) ) ( not ( = ?auto_235599 ?auto_235607 ) ) ( not ( = ?auto_235599 ?auto_235608 ) ) ( not ( = ?auto_235599 ?auto_235609 ) ) ( not ( = ?auto_235599 ?auto_235610 ) ) ( not ( = ?auto_235599 ?auto_235611 ) ) ( not ( = ?auto_235600 ?auto_235601 ) ) ( not ( = ?auto_235600 ?auto_235602 ) ) ( not ( = ?auto_235600 ?auto_235603 ) ) ( not ( = ?auto_235600 ?auto_235604 ) ) ( not ( = ?auto_235600 ?auto_235605 ) ) ( not ( = ?auto_235600 ?auto_235606 ) ) ( not ( = ?auto_235600 ?auto_235607 ) ) ( not ( = ?auto_235600 ?auto_235608 ) ) ( not ( = ?auto_235600 ?auto_235609 ) ) ( not ( = ?auto_235600 ?auto_235610 ) ) ( not ( = ?auto_235600 ?auto_235611 ) ) ( not ( = ?auto_235601 ?auto_235602 ) ) ( not ( = ?auto_235601 ?auto_235603 ) ) ( not ( = ?auto_235601 ?auto_235604 ) ) ( not ( = ?auto_235601 ?auto_235605 ) ) ( not ( = ?auto_235601 ?auto_235606 ) ) ( not ( = ?auto_235601 ?auto_235607 ) ) ( not ( = ?auto_235601 ?auto_235608 ) ) ( not ( = ?auto_235601 ?auto_235609 ) ) ( not ( = ?auto_235601 ?auto_235610 ) ) ( not ( = ?auto_235601 ?auto_235611 ) ) ( not ( = ?auto_235602 ?auto_235603 ) ) ( not ( = ?auto_235602 ?auto_235604 ) ) ( not ( = ?auto_235602 ?auto_235605 ) ) ( not ( = ?auto_235602 ?auto_235606 ) ) ( not ( = ?auto_235602 ?auto_235607 ) ) ( not ( = ?auto_235602 ?auto_235608 ) ) ( not ( = ?auto_235602 ?auto_235609 ) ) ( not ( = ?auto_235602 ?auto_235610 ) ) ( not ( = ?auto_235602 ?auto_235611 ) ) ( not ( = ?auto_235603 ?auto_235604 ) ) ( not ( = ?auto_235603 ?auto_235605 ) ) ( not ( = ?auto_235603 ?auto_235606 ) ) ( not ( = ?auto_235603 ?auto_235607 ) ) ( not ( = ?auto_235603 ?auto_235608 ) ) ( not ( = ?auto_235603 ?auto_235609 ) ) ( not ( = ?auto_235603 ?auto_235610 ) ) ( not ( = ?auto_235603 ?auto_235611 ) ) ( not ( = ?auto_235604 ?auto_235605 ) ) ( not ( = ?auto_235604 ?auto_235606 ) ) ( not ( = ?auto_235604 ?auto_235607 ) ) ( not ( = ?auto_235604 ?auto_235608 ) ) ( not ( = ?auto_235604 ?auto_235609 ) ) ( not ( = ?auto_235604 ?auto_235610 ) ) ( not ( = ?auto_235604 ?auto_235611 ) ) ( not ( = ?auto_235605 ?auto_235606 ) ) ( not ( = ?auto_235605 ?auto_235607 ) ) ( not ( = ?auto_235605 ?auto_235608 ) ) ( not ( = ?auto_235605 ?auto_235609 ) ) ( not ( = ?auto_235605 ?auto_235610 ) ) ( not ( = ?auto_235605 ?auto_235611 ) ) ( not ( = ?auto_235606 ?auto_235607 ) ) ( not ( = ?auto_235606 ?auto_235608 ) ) ( not ( = ?auto_235606 ?auto_235609 ) ) ( not ( = ?auto_235606 ?auto_235610 ) ) ( not ( = ?auto_235606 ?auto_235611 ) ) ( not ( = ?auto_235607 ?auto_235608 ) ) ( not ( = ?auto_235607 ?auto_235609 ) ) ( not ( = ?auto_235607 ?auto_235610 ) ) ( not ( = ?auto_235607 ?auto_235611 ) ) ( not ( = ?auto_235608 ?auto_235609 ) ) ( not ( = ?auto_235608 ?auto_235610 ) ) ( not ( = ?auto_235608 ?auto_235611 ) ) ( not ( = ?auto_235609 ?auto_235610 ) ) ( not ( = ?auto_235609 ?auto_235611 ) ) ( not ( = ?auto_235610 ?auto_235611 ) ) ( ON ?auto_235609 ?auto_235610 ) ( ON ?auto_235608 ?auto_235609 ) ( CLEAR ?auto_235606 ) ( ON ?auto_235607 ?auto_235608 ) ( CLEAR ?auto_235607 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_235599 ?auto_235600 ?auto_235601 ?auto_235602 ?auto_235603 ?auto_235604 ?auto_235605 ?auto_235606 ?auto_235607 )
      ( MAKE-12PILE ?auto_235599 ?auto_235600 ?auto_235601 ?auto_235602 ?auto_235603 ?auto_235604 ?auto_235605 ?auto_235606 ?auto_235607 ?auto_235608 ?auto_235609 ?auto_235610 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_235624 - BLOCK
      ?auto_235625 - BLOCK
      ?auto_235626 - BLOCK
      ?auto_235627 - BLOCK
      ?auto_235628 - BLOCK
      ?auto_235629 - BLOCK
      ?auto_235630 - BLOCK
      ?auto_235631 - BLOCK
      ?auto_235632 - BLOCK
      ?auto_235633 - BLOCK
      ?auto_235634 - BLOCK
      ?auto_235635 - BLOCK
    )
    :vars
    (
      ?auto_235636 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_235635 ?auto_235636 ) ( ON-TABLE ?auto_235624 ) ( ON ?auto_235625 ?auto_235624 ) ( ON ?auto_235626 ?auto_235625 ) ( ON ?auto_235627 ?auto_235626 ) ( ON ?auto_235628 ?auto_235627 ) ( ON ?auto_235629 ?auto_235628 ) ( ON ?auto_235630 ?auto_235629 ) ( not ( = ?auto_235624 ?auto_235625 ) ) ( not ( = ?auto_235624 ?auto_235626 ) ) ( not ( = ?auto_235624 ?auto_235627 ) ) ( not ( = ?auto_235624 ?auto_235628 ) ) ( not ( = ?auto_235624 ?auto_235629 ) ) ( not ( = ?auto_235624 ?auto_235630 ) ) ( not ( = ?auto_235624 ?auto_235631 ) ) ( not ( = ?auto_235624 ?auto_235632 ) ) ( not ( = ?auto_235624 ?auto_235633 ) ) ( not ( = ?auto_235624 ?auto_235634 ) ) ( not ( = ?auto_235624 ?auto_235635 ) ) ( not ( = ?auto_235624 ?auto_235636 ) ) ( not ( = ?auto_235625 ?auto_235626 ) ) ( not ( = ?auto_235625 ?auto_235627 ) ) ( not ( = ?auto_235625 ?auto_235628 ) ) ( not ( = ?auto_235625 ?auto_235629 ) ) ( not ( = ?auto_235625 ?auto_235630 ) ) ( not ( = ?auto_235625 ?auto_235631 ) ) ( not ( = ?auto_235625 ?auto_235632 ) ) ( not ( = ?auto_235625 ?auto_235633 ) ) ( not ( = ?auto_235625 ?auto_235634 ) ) ( not ( = ?auto_235625 ?auto_235635 ) ) ( not ( = ?auto_235625 ?auto_235636 ) ) ( not ( = ?auto_235626 ?auto_235627 ) ) ( not ( = ?auto_235626 ?auto_235628 ) ) ( not ( = ?auto_235626 ?auto_235629 ) ) ( not ( = ?auto_235626 ?auto_235630 ) ) ( not ( = ?auto_235626 ?auto_235631 ) ) ( not ( = ?auto_235626 ?auto_235632 ) ) ( not ( = ?auto_235626 ?auto_235633 ) ) ( not ( = ?auto_235626 ?auto_235634 ) ) ( not ( = ?auto_235626 ?auto_235635 ) ) ( not ( = ?auto_235626 ?auto_235636 ) ) ( not ( = ?auto_235627 ?auto_235628 ) ) ( not ( = ?auto_235627 ?auto_235629 ) ) ( not ( = ?auto_235627 ?auto_235630 ) ) ( not ( = ?auto_235627 ?auto_235631 ) ) ( not ( = ?auto_235627 ?auto_235632 ) ) ( not ( = ?auto_235627 ?auto_235633 ) ) ( not ( = ?auto_235627 ?auto_235634 ) ) ( not ( = ?auto_235627 ?auto_235635 ) ) ( not ( = ?auto_235627 ?auto_235636 ) ) ( not ( = ?auto_235628 ?auto_235629 ) ) ( not ( = ?auto_235628 ?auto_235630 ) ) ( not ( = ?auto_235628 ?auto_235631 ) ) ( not ( = ?auto_235628 ?auto_235632 ) ) ( not ( = ?auto_235628 ?auto_235633 ) ) ( not ( = ?auto_235628 ?auto_235634 ) ) ( not ( = ?auto_235628 ?auto_235635 ) ) ( not ( = ?auto_235628 ?auto_235636 ) ) ( not ( = ?auto_235629 ?auto_235630 ) ) ( not ( = ?auto_235629 ?auto_235631 ) ) ( not ( = ?auto_235629 ?auto_235632 ) ) ( not ( = ?auto_235629 ?auto_235633 ) ) ( not ( = ?auto_235629 ?auto_235634 ) ) ( not ( = ?auto_235629 ?auto_235635 ) ) ( not ( = ?auto_235629 ?auto_235636 ) ) ( not ( = ?auto_235630 ?auto_235631 ) ) ( not ( = ?auto_235630 ?auto_235632 ) ) ( not ( = ?auto_235630 ?auto_235633 ) ) ( not ( = ?auto_235630 ?auto_235634 ) ) ( not ( = ?auto_235630 ?auto_235635 ) ) ( not ( = ?auto_235630 ?auto_235636 ) ) ( not ( = ?auto_235631 ?auto_235632 ) ) ( not ( = ?auto_235631 ?auto_235633 ) ) ( not ( = ?auto_235631 ?auto_235634 ) ) ( not ( = ?auto_235631 ?auto_235635 ) ) ( not ( = ?auto_235631 ?auto_235636 ) ) ( not ( = ?auto_235632 ?auto_235633 ) ) ( not ( = ?auto_235632 ?auto_235634 ) ) ( not ( = ?auto_235632 ?auto_235635 ) ) ( not ( = ?auto_235632 ?auto_235636 ) ) ( not ( = ?auto_235633 ?auto_235634 ) ) ( not ( = ?auto_235633 ?auto_235635 ) ) ( not ( = ?auto_235633 ?auto_235636 ) ) ( not ( = ?auto_235634 ?auto_235635 ) ) ( not ( = ?auto_235634 ?auto_235636 ) ) ( not ( = ?auto_235635 ?auto_235636 ) ) ( ON ?auto_235634 ?auto_235635 ) ( ON ?auto_235633 ?auto_235634 ) ( ON ?auto_235632 ?auto_235633 ) ( CLEAR ?auto_235630 ) ( ON ?auto_235631 ?auto_235632 ) ( CLEAR ?auto_235631 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_235624 ?auto_235625 ?auto_235626 ?auto_235627 ?auto_235628 ?auto_235629 ?auto_235630 ?auto_235631 )
      ( MAKE-12PILE ?auto_235624 ?auto_235625 ?auto_235626 ?auto_235627 ?auto_235628 ?auto_235629 ?auto_235630 ?auto_235631 ?auto_235632 ?auto_235633 ?auto_235634 ?auto_235635 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_235649 - BLOCK
      ?auto_235650 - BLOCK
      ?auto_235651 - BLOCK
      ?auto_235652 - BLOCK
      ?auto_235653 - BLOCK
      ?auto_235654 - BLOCK
      ?auto_235655 - BLOCK
      ?auto_235656 - BLOCK
      ?auto_235657 - BLOCK
      ?auto_235658 - BLOCK
      ?auto_235659 - BLOCK
      ?auto_235660 - BLOCK
    )
    :vars
    (
      ?auto_235661 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_235660 ?auto_235661 ) ( ON-TABLE ?auto_235649 ) ( ON ?auto_235650 ?auto_235649 ) ( ON ?auto_235651 ?auto_235650 ) ( ON ?auto_235652 ?auto_235651 ) ( ON ?auto_235653 ?auto_235652 ) ( ON ?auto_235654 ?auto_235653 ) ( ON ?auto_235655 ?auto_235654 ) ( not ( = ?auto_235649 ?auto_235650 ) ) ( not ( = ?auto_235649 ?auto_235651 ) ) ( not ( = ?auto_235649 ?auto_235652 ) ) ( not ( = ?auto_235649 ?auto_235653 ) ) ( not ( = ?auto_235649 ?auto_235654 ) ) ( not ( = ?auto_235649 ?auto_235655 ) ) ( not ( = ?auto_235649 ?auto_235656 ) ) ( not ( = ?auto_235649 ?auto_235657 ) ) ( not ( = ?auto_235649 ?auto_235658 ) ) ( not ( = ?auto_235649 ?auto_235659 ) ) ( not ( = ?auto_235649 ?auto_235660 ) ) ( not ( = ?auto_235649 ?auto_235661 ) ) ( not ( = ?auto_235650 ?auto_235651 ) ) ( not ( = ?auto_235650 ?auto_235652 ) ) ( not ( = ?auto_235650 ?auto_235653 ) ) ( not ( = ?auto_235650 ?auto_235654 ) ) ( not ( = ?auto_235650 ?auto_235655 ) ) ( not ( = ?auto_235650 ?auto_235656 ) ) ( not ( = ?auto_235650 ?auto_235657 ) ) ( not ( = ?auto_235650 ?auto_235658 ) ) ( not ( = ?auto_235650 ?auto_235659 ) ) ( not ( = ?auto_235650 ?auto_235660 ) ) ( not ( = ?auto_235650 ?auto_235661 ) ) ( not ( = ?auto_235651 ?auto_235652 ) ) ( not ( = ?auto_235651 ?auto_235653 ) ) ( not ( = ?auto_235651 ?auto_235654 ) ) ( not ( = ?auto_235651 ?auto_235655 ) ) ( not ( = ?auto_235651 ?auto_235656 ) ) ( not ( = ?auto_235651 ?auto_235657 ) ) ( not ( = ?auto_235651 ?auto_235658 ) ) ( not ( = ?auto_235651 ?auto_235659 ) ) ( not ( = ?auto_235651 ?auto_235660 ) ) ( not ( = ?auto_235651 ?auto_235661 ) ) ( not ( = ?auto_235652 ?auto_235653 ) ) ( not ( = ?auto_235652 ?auto_235654 ) ) ( not ( = ?auto_235652 ?auto_235655 ) ) ( not ( = ?auto_235652 ?auto_235656 ) ) ( not ( = ?auto_235652 ?auto_235657 ) ) ( not ( = ?auto_235652 ?auto_235658 ) ) ( not ( = ?auto_235652 ?auto_235659 ) ) ( not ( = ?auto_235652 ?auto_235660 ) ) ( not ( = ?auto_235652 ?auto_235661 ) ) ( not ( = ?auto_235653 ?auto_235654 ) ) ( not ( = ?auto_235653 ?auto_235655 ) ) ( not ( = ?auto_235653 ?auto_235656 ) ) ( not ( = ?auto_235653 ?auto_235657 ) ) ( not ( = ?auto_235653 ?auto_235658 ) ) ( not ( = ?auto_235653 ?auto_235659 ) ) ( not ( = ?auto_235653 ?auto_235660 ) ) ( not ( = ?auto_235653 ?auto_235661 ) ) ( not ( = ?auto_235654 ?auto_235655 ) ) ( not ( = ?auto_235654 ?auto_235656 ) ) ( not ( = ?auto_235654 ?auto_235657 ) ) ( not ( = ?auto_235654 ?auto_235658 ) ) ( not ( = ?auto_235654 ?auto_235659 ) ) ( not ( = ?auto_235654 ?auto_235660 ) ) ( not ( = ?auto_235654 ?auto_235661 ) ) ( not ( = ?auto_235655 ?auto_235656 ) ) ( not ( = ?auto_235655 ?auto_235657 ) ) ( not ( = ?auto_235655 ?auto_235658 ) ) ( not ( = ?auto_235655 ?auto_235659 ) ) ( not ( = ?auto_235655 ?auto_235660 ) ) ( not ( = ?auto_235655 ?auto_235661 ) ) ( not ( = ?auto_235656 ?auto_235657 ) ) ( not ( = ?auto_235656 ?auto_235658 ) ) ( not ( = ?auto_235656 ?auto_235659 ) ) ( not ( = ?auto_235656 ?auto_235660 ) ) ( not ( = ?auto_235656 ?auto_235661 ) ) ( not ( = ?auto_235657 ?auto_235658 ) ) ( not ( = ?auto_235657 ?auto_235659 ) ) ( not ( = ?auto_235657 ?auto_235660 ) ) ( not ( = ?auto_235657 ?auto_235661 ) ) ( not ( = ?auto_235658 ?auto_235659 ) ) ( not ( = ?auto_235658 ?auto_235660 ) ) ( not ( = ?auto_235658 ?auto_235661 ) ) ( not ( = ?auto_235659 ?auto_235660 ) ) ( not ( = ?auto_235659 ?auto_235661 ) ) ( not ( = ?auto_235660 ?auto_235661 ) ) ( ON ?auto_235659 ?auto_235660 ) ( ON ?auto_235658 ?auto_235659 ) ( ON ?auto_235657 ?auto_235658 ) ( CLEAR ?auto_235655 ) ( ON ?auto_235656 ?auto_235657 ) ( CLEAR ?auto_235656 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_235649 ?auto_235650 ?auto_235651 ?auto_235652 ?auto_235653 ?auto_235654 ?auto_235655 ?auto_235656 )
      ( MAKE-12PILE ?auto_235649 ?auto_235650 ?auto_235651 ?auto_235652 ?auto_235653 ?auto_235654 ?auto_235655 ?auto_235656 ?auto_235657 ?auto_235658 ?auto_235659 ?auto_235660 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_235674 - BLOCK
      ?auto_235675 - BLOCK
      ?auto_235676 - BLOCK
      ?auto_235677 - BLOCK
      ?auto_235678 - BLOCK
      ?auto_235679 - BLOCK
      ?auto_235680 - BLOCK
      ?auto_235681 - BLOCK
      ?auto_235682 - BLOCK
      ?auto_235683 - BLOCK
      ?auto_235684 - BLOCK
      ?auto_235685 - BLOCK
    )
    :vars
    (
      ?auto_235686 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_235685 ?auto_235686 ) ( ON-TABLE ?auto_235674 ) ( ON ?auto_235675 ?auto_235674 ) ( ON ?auto_235676 ?auto_235675 ) ( ON ?auto_235677 ?auto_235676 ) ( ON ?auto_235678 ?auto_235677 ) ( ON ?auto_235679 ?auto_235678 ) ( not ( = ?auto_235674 ?auto_235675 ) ) ( not ( = ?auto_235674 ?auto_235676 ) ) ( not ( = ?auto_235674 ?auto_235677 ) ) ( not ( = ?auto_235674 ?auto_235678 ) ) ( not ( = ?auto_235674 ?auto_235679 ) ) ( not ( = ?auto_235674 ?auto_235680 ) ) ( not ( = ?auto_235674 ?auto_235681 ) ) ( not ( = ?auto_235674 ?auto_235682 ) ) ( not ( = ?auto_235674 ?auto_235683 ) ) ( not ( = ?auto_235674 ?auto_235684 ) ) ( not ( = ?auto_235674 ?auto_235685 ) ) ( not ( = ?auto_235674 ?auto_235686 ) ) ( not ( = ?auto_235675 ?auto_235676 ) ) ( not ( = ?auto_235675 ?auto_235677 ) ) ( not ( = ?auto_235675 ?auto_235678 ) ) ( not ( = ?auto_235675 ?auto_235679 ) ) ( not ( = ?auto_235675 ?auto_235680 ) ) ( not ( = ?auto_235675 ?auto_235681 ) ) ( not ( = ?auto_235675 ?auto_235682 ) ) ( not ( = ?auto_235675 ?auto_235683 ) ) ( not ( = ?auto_235675 ?auto_235684 ) ) ( not ( = ?auto_235675 ?auto_235685 ) ) ( not ( = ?auto_235675 ?auto_235686 ) ) ( not ( = ?auto_235676 ?auto_235677 ) ) ( not ( = ?auto_235676 ?auto_235678 ) ) ( not ( = ?auto_235676 ?auto_235679 ) ) ( not ( = ?auto_235676 ?auto_235680 ) ) ( not ( = ?auto_235676 ?auto_235681 ) ) ( not ( = ?auto_235676 ?auto_235682 ) ) ( not ( = ?auto_235676 ?auto_235683 ) ) ( not ( = ?auto_235676 ?auto_235684 ) ) ( not ( = ?auto_235676 ?auto_235685 ) ) ( not ( = ?auto_235676 ?auto_235686 ) ) ( not ( = ?auto_235677 ?auto_235678 ) ) ( not ( = ?auto_235677 ?auto_235679 ) ) ( not ( = ?auto_235677 ?auto_235680 ) ) ( not ( = ?auto_235677 ?auto_235681 ) ) ( not ( = ?auto_235677 ?auto_235682 ) ) ( not ( = ?auto_235677 ?auto_235683 ) ) ( not ( = ?auto_235677 ?auto_235684 ) ) ( not ( = ?auto_235677 ?auto_235685 ) ) ( not ( = ?auto_235677 ?auto_235686 ) ) ( not ( = ?auto_235678 ?auto_235679 ) ) ( not ( = ?auto_235678 ?auto_235680 ) ) ( not ( = ?auto_235678 ?auto_235681 ) ) ( not ( = ?auto_235678 ?auto_235682 ) ) ( not ( = ?auto_235678 ?auto_235683 ) ) ( not ( = ?auto_235678 ?auto_235684 ) ) ( not ( = ?auto_235678 ?auto_235685 ) ) ( not ( = ?auto_235678 ?auto_235686 ) ) ( not ( = ?auto_235679 ?auto_235680 ) ) ( not ( = ?auto_235679 ?auto_235681 ) ) ( not ( = ?auto_235679 ?auto_235682 ) ) ( not ( = ?auto_235679 ?auto_235683 ) ) ( not ( = ?auto_235679 ?auto_235684 ) ) ( not ( = ?auto_235679 ?auto_235685 ) ) ( not ( = ?auto_235679 ?auto_235686 ) ) ( not ( = ?auto_235680 ?auto_235681 ) ) ( not ( = ?auto_235680 ?auto_235682 ) ) ( not ( = ?auto_235680 ?auto_235683 ) ) ( not ( = ?auto_235680 ?auto_235684 ) ) ( not ( = ?auto_235680 ?auto_235685 ) ) ( not ( = ?auto_235680 ?auto_235686 ) ) ( not ( = ?auto_235681 ?auto_235682 ) ) ( not ( = ?auto_235681 ?auto_235683 ) ) ( not ( = ?auto_235681 ?auto_235684 ) ) ( not ( = ?auto_235681 ?auto_235685 ) ) ( not ( = ?auto_235681 ?auto_235686 ) ) ( not ( = ?auto_235682 ?auto_235683 ) ) ( not ( = ?auto_235682 ?auto_235684 ) ) ( not ( = ?auto_235682 ?auto_235685 ) ) ( not ( = ?auto_235682 ?auto_235686 ) ) ( not ( = ?auto_235683 ?auto_235684 ) ) ( not ( = ?auto_235683 ?auto_235685 ) ) ( not ( = ?auto_235683 ?auto_235686 ) ) ( not ( = ?auto_235684 ?auto_235685 ) ) ( not ( = ?auto_235684 ?auto_235686 ) ) ( not ( = ?auto_235685 ?auto_235686 ) ) ( ON ?auto_235684 ?auto_235685 ) ( ON ?auto_235683 ?auto_235684 ) ( ON ?auto_235682 ?auto_235683 ) ( ON ?auto_235681 ?auto_235682 ) ( CLEAR ?auto_235679 ) ( ON ?auto_235680 ?auto_235681 ) ( CLEAR ?auto_235680 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_235674 ?auto_235675 ?auto_235676 ?auto_235677 ?auto_235678 ?auto_235679 ?auto_235680 )
      ( MAKE-12PILE ?auto_235674 ?auto_235675 ?auto_235676 ?auto_235677 ?auto_235678 ?auto_235679 ?auto_235680 ?auto_235681 ?auto_235682 ?auto_235683 ?auto_235684 ?auto_235685 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_235699 - BLOCK
      ?auto_235700 - BLOCK
      ?auto_235701 - BLOCK
      ?auto_235702 - BLOCK
      ?auto_235703 - BLOCK
      ?auto_235704 - BLOCK
      ?auto_235705 - BLOCK
      ?auto_235706 - BLOCK
      ?auto_235707 - BLOCK
      ?auto_235708 - BLOCK
      ?auto_235709 - BLOCK
      ?auto_235710 - BLOCK
    )
    :vars
    (
      ?auto_235711 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_235710 ?auto_235711 ) ( ON-TABLE ?auto_235699 ) ( ON ?auto_235700 ?auto_235699 ) ( ON ?auto_235701 ?auto_235700 ) ( ON ?auto_235702 ?auto_235701 ) ( ON ?auto_235703 ?auto_235702 ) ( ON ?auto_235704 ?auto_235703 ) ( not ( = ?auto_235699 ?auto_235700 ) ) ( not ( = ?auto_235699 ?auto_235701 ) ) ( not ( = ?auto_235699 ?auto_235702 ) ) ( not ( = ?auto_235699 ?auto_235703 ) ) ( not ( = ?auto_235699 ?auto_235704 ) ) ( not ( = ?auto_235699 ?auto_235705 ) ) ( not ( = ?auto_235699 ?auto_235706 ) ) ( not ( = ?auto_235699 ?auto_235707 ) ) ( not ( = ?auto_235699 ?auto_235708 ) ) ( not ( = ?auto_235699 ?auto_235709 ) ) ( not ( = ?auto_235699 ?auto_235710 ) ) ( not ( = ?auto_235699 ?auto_235711 ) ) ( not ( = ?auto_235700 ?auto_235701 ) ) ( not ( = ?auto_235700 ?auto_235702 ) ) ( not ( = ?auto_235700 ?auto_235703 ) ) ( not ( = ?auto_235700 ?auto_235704 ) ) ( not ( = ?auto_235700 ?auto_235705 ) ) ( not ( = ?auto_235700 ?auto_235706 ) ) ( not ( = ?auto_235700 ?auto_235707 ) ) ( not ( = ?auto_235700 ?auto_235708 ) ) ( not ( = ?auto_235700 ?auto_235709 ) ) ( not ( = ?auto_235700 ?auto_235710 ) ) ( not ( = ?auto_235700 ?auto_235711 ) ) ( not ( = ?auto_235701 ?auto_235702 ) ) ( not ( = ?auto_235701 ?auto_235703 ) ) ( not ( = ?auto_235701 ?auto_235704 ) ) ( not ( = ?auto_235701 ?auto_235705 ) ) ( not ( = ?auto_235701 ?auto_235706 ) ) ( not ( = ?auto_235701 ?auto_235707 ) ) ( not ( = ?auto_235701 ?auto_235708 ) ) ( not ( = ?auto_235701 ?auto_235709 ) ) ( not ( = ?auto_235701 ?auto_235710 ) ) ( not ( = ?auto_235701 ?auto_235711 ) ) ( not ( = ?auto_235702 ?auto_235703 ) ) ( not ( = ?auto_235702 ?auto_235704 ) ) ( not ( = ?auto_235702 ?auto_235705 ) ) ( not ( = ?auto_235702 ?auto_235706 ) ) ( not ( = ?auto_235702 ?auto_235707 ) ) ( not ( = ?auto_235702 ?auto_235708 ) ) ( not ( = ?auto_235702 ?auto_235709 ) ) ( not ( = ?auto_235702 ?auto_235710 ) ) ( not ( = ?auto_235702 ?auto_235711 ) ) ( not ( = ?auto_235703 ?auto_235704 ) ) ( not ( = ?auto_235703 ?auto_235705 ) ) ( not ( = ?auto_235703 ?auto_235706 ) ) ( not ( = ?auto_235703 ?auto_235707 ) ) ( not ( = ?auto_235703 ?auto_235708 ) ) ( not ( = ?auto_235703 ?auto_235709 ) ) ( not ( = ?auto_235703 ?auto_235710 ) ) ( not ( = ?auto_235703 ?auto_235711 ) ) ( not ( = ?auto_235704 ?auto_235705 ) ) ( not ( = ?auto_235704 ?auto_235706 ) ) ( not ( = ?auto_235704 ?auto_235707 ) ) ( not ( = ?auto_235704 ?auto_235708 ) ) ( not ( = ?auto_235704 ?auto_235709 ) ) ( not ( = ?auto_235704 ?auto_235710 ) ) ( not ( = ?auto_235704 ?auto_235711 ) ) ( not ( = ?auto_235705 ?auto_235706 ) ) ( not ( = ?auto_235705 ?auto_235707 ) ) ( not ( = ?auto_235705 ?auto_235708 ) ) ( not ( = ?auto_235705 ?auto_235709 ) ) ( not ( = ?auto_235705 ?auto_235710 ) ) ( not ( = ?auto_235705 ?auto_235711 ) ) ( not ( = ?auto_235706 ?auto_235707 ) ) ( not ( = ?auto_235706 ?auto_235708 ) ) ( not ( = ?auto_235706 ?auto_235709 ) ) ( not ( = ?auto_235706 ?auto_235710 ) ) ( not ( = ?auto_235706 ?auto_235711 ) ) ( not ( = ?auto_235707 ?auto_235708 ) ) ( not ( = ?auto_235707 ?auto_235709 ) ) ( not ( = ?auto_235707 ?auto_235710 ) ) ( not ( = ?auto_235707 ?auto_235711 ) ) ( not ( = ?auto_235708 ?auto_235709 ) ) ( not ( = ?auto_235708 ?auto_235710 ) ) ( not ( = ?auto_235708 ?auto_235711 ) ) ( not ( = ?auto_235709 ?auto_235710 ) ) ( not ( = ?auto_235709 ?auto_235711 ) ) ( not ( = ?auto_235710 ?auto_235711 ) ) ( ON ?auto_235709 ?auto_235710 ) ( ON ?auto_235708 ?auto_235709 ) ( ON ?auto_235707 ?auto_235708 ) ( ON ?auto_235706 ?auto_235707 ) ( CLEAR ?auto_235704 ) ( ON ?auto_235705 ?auto_235706 ) ( CLEAR ?auto_235705 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_235699 ?auto_235700 ?auto_235701 ?auto_235702 ?auto_235703 ?auto_235704 ?auto_235705 )
      ( MAKE-12PILE ?auto_235699 ?auto_235700 ?auto_235701 ?auto_235702 ?auto_235703 ?auto_235704 ?auto_235705 ?auto_235706 ?auto_235707 ?auto_235708 ?auto_235709 ?auto_235710 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_235724 - BLOCK
      ?auto_235725 - BLOCK
      ?auto_235726 - BLOCK
      ?auto_235727 - BLOCK
      ?auto_235728 - BLOCK
      ?auto_235729 - BLOCK
      ?auto_235730 - BLOCK
      ?auto_235731 - BLOCK
      ?auto_235732 - BLOCK
      ?auto_235733 - BLOCK
      ?auto_235734 - BLOCK
      ?auto_235735 - BLOCK
    )
    :vars
    (
      ?auto_235736 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_235735 ?auto_235736 ) ( ON-TABLE ?auto_235724 ) ( ON ?auto_235725 ?auto_235724 ) ( ON ?auto_235726 ?auto_235725 ) ( ON ?auto_235727 ?auto_235726 ) ( ON ?auto_235728 ?auto_235727 ) ( not ( = ?auto_235724 ?auto_235725 ) ) ( not ( = ?auto_235724 ?auto_235726 ) ) ( not ( = ?auto_235724 ?auto_235727 ) ) ( not ( = ?auto_235724 ?auto_235728 ) ) ( not ( = ?auto_235724 ?auto_235729 ) ) ( not ( = ?auto_235724 ?auto_235730 ) ) ( not ( = ?auto_235724 ?auto_235731 ) ) ( not ( = ?auto_235724 ?auto_235732 ) ) ( not ( = ?auto_235724 ?auto_235733 ) ) ( not ( = ?auto_235724 ?auto_235734 ) ) ( not ( = ?auto_235724 ?auto_235735 ) ) ( not ( = ?auto_235724 ?auto_235736 ) ) ( not ( = ?auto_235725 ?auto_235726 ) ) ( not ( = ?auto_235725 ?auto_235727 ) ) ( not ( = ?auto_235725 ?auto_235728 ) ) ( not ( = ?auto_235725 ?auto_235729 ) ) ( not ( = ?auto_235725 ?auto_235730 ) ) ( not ( = ?auto_235725 ?auto_235731 ) ) ( not ( = ?auto_235725 ?auto_235732 ) ) ( not ( = ?auto_235725 ?auto_235733 ) ) ( not ( = ?auto_235725 ?auto_235734 ) ) ( not ( = ?auto_235725 ?auto_235735 ) ) ( not ( = ?auto_235725 ?auto_235736 ) ) ( not ( = ?auto_235726 ?auto_235727 ) ) ( not ( = ?auto_235726 ?auto_235728 ) ) ( not ( = ?auto_235726 ?auto_235729 ) ) ( not ( = ?auto_235726 ?auto_235730 ) ) ( not ( = ?auto_235726 ?auto_235731 ) ) ( not ( = ?auto_235726 ?auto_235732 ) ) ( not ( = ?auto_235726 ?auto_235733 ) ) ( not ( = ?auto_235726 ?auto_235734 ) ) ( not ( = ?auto_235726 ?auto_235735 ) ) ( not ( = ?auto_235726 ?auto_235736 ) ) ( not ( = ?auto_235727 ?auto_235728 ) ) ( not ( = ?auto_235727 ?auto_235729 ) ) ( not ( = ?auto_235727 ?auto_235730 ) ) ( not ( = ?auto_235727 ?auto_235731 ) ) ( not ( = ?auto_235727 ?auto_235732 ) ) ( not ( = ?auto_235727 ?auto_235733 ) ) ( not ( = ?auto_235727 ?auto_235734 ) ) ( not ( = ?auto_235727 ?auto_235735 ) ) ( not ( = ?auto_235727 ?auto_235736 ) ) ( not ( = ?auto_235728 ?auto_235729 ) ) ( not ( = ?auto_235728 ?auto_235730 ) ) ( not ( = ?auto_235728 ?auto_235731 ) ) ( not ( = ?auto_235728 ?auto_235732 ) ) ( not ( = ?auto_235728 ?auto_235733 ) ) ( not ( = ?auto_235728 ?auto_235734 ) ) ( not ( = ?auto_235728 ?auto_235735 ) ) ( not ( = ?auto_235728 ?auto_235736 ) ) ( not ( = ?auto_235729 ?auto_235730 ) ) ( not ( = ?auto_235729 ?auto_235731 ) ) ( not ( = ?auto_235729 ?auto_235732 ) ) ( not ( = ?auto_235729 ?auto_235733 ) ) ( not ( = ?auto_235729 ?auto_235734 ) ) ( not ( = ?auto_235729 ?auto_235735 ) ) ( not ( = ?auto_235729 ?auto_235736 ) ) ( not ( = ?auto_235730 ?auto_235731 ) ) ( not ( = ?auto_235730 ?auto_235732 ) ) ( not ( = ?auto_235730 ?auto_235733 ) ) ( not ( = ?auto_235730 ?auto_235734 ) ) ( not ( = ?auto_235730 ?auto_235735 ) ) ( not ( = ?auto_235730 ?auto_235736 ) ) ( not ( = ?auto_235731 ?auto_235732 ) ) ( not ( = ?auto_235731 ?auto_235733 ) ) ( not ( = ?auto_235731 ?auto_235734 ) ) ( not ( = ?auto_235731 ?auto_235735 ) ) ( not ( = ?auto_235731 ?auto_235736 ) ) ( not ( = ?auto_235732 ?auto_235733 ) ) ( not ( = ?auto_235732 ?auto_235734 ) ) ( not ( = ?auto_235732 ?auto_235735 ) ) ( not ( = ?auto_235732 ?auto_235736 ) ) ( not ( = ?auto_235733 ?auto_235734 ) ) ( not ( = ?auto_235733 ?auto_235735 ) ) ( not ( = ?auto_235733 ?auto_235736 ) ) ( not ( = ?auto_235734 ?auto_235735 ) ) ( not ( = ?auto_235734 ?auto_235736 ) ) ( not ( = ?auto_235735 ?auto_235736 ) ) ( ON ?auto_235734 ?auto_235735 ) ( ON ?auto_235733 ?auto_235734 ) ( ON ?auto_235732 ?auto_235733 ) ( ON ?auto_235731 ?auto_235732 ) ( ON ?auto_235730 ?auto_235731 ) ( CLEAR ?auto_235728 ) ( ON ?auto_235729 ?auto_235730 ) ( CLEAR ?auto_235729 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_235724 ?auto_235725 ?auto_235726 ?auto_235727 ?auto_235728 ?auto_235729 )
      ( MAKE-12PILE ?auto_235724 ?auto_235725 ?auto_235726 ?auto_235727 ?auto_235728 ?auto_235729 ?auto_235730 ?auto_235731 ?auto_235732 ?auto_235733 ?auto_235734 ?auto_235735 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_235749 - BLOCK
      ?auto_235750 - BLOCK
      ?auto_235751 - BLOCK
      ?auto_235752 - BLOCK
      ?auto_235753 - BLOCK
      ?auto_235754 - BLOCK
      ?auto_235755 - BLOCK
      ?auto_235756 - BLOCK
      ?auto_235757 - BLOCK
      ?auto_235758 - BLOCK
      ?auto_235759 - BLOCK
      ?auto_235760 - BLOCK
    )
    :vars
    (
      ?auto_235761 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_235760 ?auto_235761 ) ( ON-TABLE ?auto_235749 ) ( ON ?auto_235750 ?auto_235749 ) ( ON ?auto_235751 ?auto_235750 ) ( ON ?auto_235752 ?auto_235751 ) ( ON ?auto_235753 ?auto_235752 ) ( not ( = ?auto_235749 ?auto_235750 ) ) ( not ( = ?auto_235749 ?auto_235751 ) ) ( not ( = ?auto_235749 ?auto_235752 ) ) ( not ( = ?auto_235749 ?auto_235753 ) ) ( not ( = ?auto_235749 ?auto_235754 ) ) ( not ( = ?auto_235749 ?auto_235755 ) ) ( not ( = ?auto_235749 ?auto_235756 ) ) ( not ( = ?auto_235749 ?auto_235757 ) ) ( not ( = ?auto_235749 ?auto_235758 ) ) ( not ( = ?auto_235749 ?auto_235759 ) ) ( not ( = ?auto_235749 ?auto_235760 ) ) ( not ( = ?auto_235749 ?auto_235761 ) ) ( not ( = ?auto_235750 ?auto_235751 ) ) ( not ( = ?auto_235750 ?auto_235752 ) ) ( not ( = ?auto_235750 ?auto_235753 ) ) ( not ( = ?auto_235750 ?auto_235754 ) ) ( not ( = ?auto_235750 ?auto_235755 ) ) ( not ( = ?auto_235750 ?auto_235756 ) ) ( not ( = ?auto_235750 ?auto_235757 ) ) ( not ( = ?auto_235750 ?auto_235758 ) ) ( not ( = ?auto_235750 ?auto_235759 ) ) ( not ( = ?auto_235750 ?auto_235760 ) ) ( not ( = ?auto_235750 ?auto_235761 ) ) ( not ( = ?auto_235751 ?auto_235752 ) ) ( not ( = ?auto_235751 ?auto_235753 ) ) ( not ( = ?auto_235751 ?auto_235754 ) ) ( not ( = ?auto_235751 ?auto_235755 ) ) ( not ( = ?auto_235751 ?auto_235756 ) ) ( not ( = ?auto_235751 ?auto_235757 ) ) ( not ( = ?auto_235751 ?auto_235758 ) ) ( not ( = ?auto_235751 ?auto_235759 ) ) ( not ( = ?auto_235751 ?auto_235760 ) ) ( not ( = ?auto_235751 ?auto_235761 ) ) ( not ( = ?auto_235752 ?auto_235753 ) ) ( not ( = ?auto_235752 ?auto_235754 ) ) ( not ( = ?auto_235752 ?auto_235755 ) ) ( not ( = ?auto_235752 ?auto_235756 ) ) ( not ( = ?auto_235752 ?auto_235757 ) ) ( not ( = ?auto_235752 ?auto_235758 ) ) ( not ( = ?auto_235752 ?auto_235759 ) ) ( not ( = ?auto_235752 ?auto_235760 ) ) ( not ( = ?auto_235752 ?auto_235761 ) ) ( not ( = ?auto_235753 ?auto_235754 ) ) ( not ( = ?auto_235753 ?auto_235755 ) ) ( not ( = ?auto_235753 ?auto_235756 ) ) ( not ( = ?auto_235753 ?auto_235757 ) ) ( not ( = ?auto_235753 ?auto_235758 ) ) ( not ( = ?auto_235753 ?auto_235759 ) ) ( not ( = ?auto_235753 ?auto_235760 ) ) ( not ( = ?auto_235753 ?auto_235761 ) ) ( not ( = ?auto_235754 ?auto_235755 ) ) ( not ( = ?auto_235754 ?auto_235756 ) ) ( not ( = ?auto_235754 ?auto_235757 ) ) ( not ( = ?auto_235754 ?auto_235758 ) ) ( not ( = ?auto_235754 ?auto_235759 ) ) ( not ( = ?auto_235754 ?auto_235760 ) ) ( not ( = ?auto_235754 ?auto_235761 ) ) ( not ( = ?auto_235755 ?auto_235756 ) ) ( not ( = ?auto_235755 ?auto_235757 ) ) ( not ( = ?auto_235755 ?auto_235758 ) ) ( not ( = ?auto_235755 ?auto_235759 ) ) ( not ( = ?auto_235755 ?auto_235760 ) ) ( not ( = ?auto_235755 ?auto_235761 ) ) ( not ( = ?auto_235756 ?auto_235757 ) ) ( not ( = ?auto_235756 ?auto_235758 ) ) ( not ( = ?auto_235756 ?auto_235759 ) ) ( not ( = ?auto_235756 ?auto_235760 ) ) ( not ( = ?auto_235756 ?auto_235761 ) ) ( not ( = ?auto_235757 ?auto_235758 ) ) ( not ( = ?auto_235757 ?auto_235759 ) ) ( not ( = ?auto_235757 ?auto_235760 ) ) ( not ( = ?auto_235757 ?auto_235761 ) ) ( not ( = ?auto_235758 ?auto_235759 ) ) ( not ( = ?auto_235758 ?auto_235760 ) ) ( not ( = ?auto_235758 ?auto_235761 ) ) ( not ( = ?auto_235759 ?auto_235760 ) ) ( not ( = ?auto_235759 ?auto_235761 ) ) ( not ( = ?auto_235760 ?auto_235761 ) ) ( ON ?auto_235759 ?auto_235760 ) ( ON ?auto_235758 ?auto_235759 ) ( ON ?auto_235757 ?auto_235758 ) ( ON ?auto_235756 ?auto_235757 ) ( ON ?auto_235755 ?auto_235756 ) ( CLEAR ?auto_235753 ) ( ON ?auto_235754 ?auto_235755 ) ( CLEAR ?auto_235754 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_235749 ?auto_235750 ?auto_235751 ?auto_235752 ?auto_235753 ?auto_235754 )
      ( MAKE-12PILE ?auto_235749 ?auto_235750 ?auto_235751 ?auto_235752 ?auto_235753 ?auto_235754 ?auto_235755 ?auto_235756 ?auto_235757 ?auto_235758 ?auto_235759 ?auto_235760 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_235774 - BLOCK
      ?auto_235775 - BLOCK
      ?auto_235776 - BLOCK
      ?auto_235777 - BLOCK
      ?auto_235778 - BLOCK
      ?auto_235779 - BLOCK
      ?auto_235780 - BLOCK
      ?auto_235781 - BLOCK
      ?auto_235782 - BLOCK
      ?auto_235783 - BLOCK
      ?auto_235784 - BLOCK
      ?auto_235785 - BLOCK
    )
    :vars
    (
      ?auto_235786 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_235785 ?auto_235786 ) ( ON-TABLE ?auto_235774 ) ( ON ?auto_235775 ?auto_235774 ) ( ON ?auto_235776 ?auto_235775 ) ( ON ?auto_235777 ?auto_235776 ) ( not ( = ?auto_235774 ?auto_235775 ) ) ( not ( = ?auto_235774 ?auto_235776 ) ) ( not ( = ?auto_235774 ?auto_235777 ) ) ( not ( = ?auto_235774 ?auto_235778 ) ) ( not ( = ?auto_235774 ?auto_235779 ) ) ( not ( = ?auto_235774 ?auto_235780 ) ) ( not ( = ?auto_235774 ?auto_235781 ) ) ( not ( = ?auto_235774 ?auto_235782 ) ) ( not ( = ?auto_235774 ?auto_235783 ) ) ( not ( = ?auto_235774 ?auto_235784 ) ) ( not ( = ?auto_235774 ?auto_235785 ) ) ( not ( = ?auto_235774 ?auto_235786 ) ) ( not ( = ?auto_235775 ?auto_235776 ) ) ( not ( = ?auto_235775 ?auto_235777 ) ) ( not ( = ?auto_235775 ?auto_235778 ) ) ( not ( = ?auto_235775 ?auto_235779 ) ) ( not ( = ?auto_235775 ?auto_235780 ) ) ( not ( = ?auto_235775 ?auto_235781 ) ) ( not ( = ?auto_235775 ?auto_235782 ) ) ( not ( = ?auto_235775 ?auto_235783 ) ) ( not ( = ?auto_235775 ?auto_235784 ) ) ( not ( = ?auto_235775 ?auto_235785 ) ) ( not ( = ?auto_235775 ?auto_235786 ) ) ( not ( = ?auto_235776 ?auto_235777 ) ) ( not ( = ?auto_235776 ?auto_235778 ) ) ( not ( = ?auto_235776 ?auto_235779 ) ) ( not ( = ?auto_235776 ?auto_235780 ) ) ( not ( = ?auto_235776 ?auto_235781 ) ) ( not ( = ?auto_235776 ?auto_235782 ) ) ( not ( = ?auto_235776 ?auto_235783 ) ) ( not ( = ?auto_235776 ?auto_235784 ) ) ( not ( = ?auto_235776 ?auto_235785 ) ) ( not ( = ?auto_235776 ?auto_235786 ) ) ( not ( = ?auto_235777 ?auto_235778 ) ) ( not ( = ?auto_235777 ?auto_235779 ) ) ( not ( = ?auto_235777 ?auto_235780 ) ) ( not ( = ?auto_235777 ?auto_235781 ) ) ( not ( = ?auto_235777 ?auto_235782 ) ) ( not ( = ?auto_235777 ?auto_235783 ) ) ( not ( = ?auto_235777 ?auto_235784 ) ) ( not ( = ?auto_235777 ?auto_235785 ) ) ( not ( = ?auto_235777 ?auto_235786 ) ) ( not ( = ?auto_235778 ?auto_235779 ) ) ( not ( = ?auto_235778 ?auto_235780 ) ) ( not ( = ?auto_235778 ?auto_235781 ) ) ( not ( = ?auto_235778 ?auto_235782 ) ) ( not ( = ?auto_235778 ?auto_235783 ) ) ( not ( = ?auto_235778 ?auto_235784 ) ) ( not ( = ?auto_235778 ?auto_235785 ) ) ( not ( = ?auto_235778 ?auto_235786 ) ) ( not ( = ?auto_235779 ?auto_235780 ) ) ( not ( = ?auto_235779 ?auto_235781 ) ) ( not ( = ?auto_235779 ?auto_235782 ) ) ( not ( = ?auto_235779 ?auto_235783 ) ) ( not ( = ?auto_235779 ?auto_235784 ) ) ( not ( = ?auto_235779 ?auto_235785 ) ) ( not ( = ?auto_235779 ?auto_235786 ) ) ( not ( = ?auto_235780 ?auto_235781 ) ) ( not ( = ?auto_235780 ?auto_235782 ) ) ( not ( = ?auto_235780 ?auto_235783 ) ) ( not ( = ?auto_235780 ?auto_235784 ) ) ( not ( = ?auto_235780 ?auto_235785 ) ) ( not ( = ?auto_235780 ?auto_235786 ) ) ( not ( = ?auto_235781 ?auto_235782 ) ) ( not ( = ?auto_235781 ?auto_235783 ) ) ( not ( = ?auto_235781 ?auto_235784 ) ) ( not ( = ?auto_235781 ?auto_235785 ) ) ( not ( = ?auto_235781 ?auto_235786 ) ) ( not ( = ?auto_235782 ?auto_235783 ) ) ( not ( = ?auto_235782 ?auto_235784 ) ) ( not ( = ?auto_235782 ?auto_235785 ) ) ( not ( = ?auto_235782 ?auto_235786 ) ) ( not ( = ?auto_235783 ?auto_235784 ) ) ( not ( = ?auto_235783 ?auto_235785 ) ) ( not ( = ?auto_235783 ?auto_235786 ) ) ( not ( = ?auto_235784 ?auto_235785 ) ) ( not ( = ?auto_235784 ?auto_235786 ) ) ( not ( = ?auto_235785 ?auto_235786 ) ) ( ON ?auto_235784 ?auto_235785 ) ( ON ?auto_235783 ?auto_235784 ) ( ON ?auto_235782 ?auto_235783 ) ( ON ?auto_235781 ?auto_235782 ) ( ON ?auto_235780 ?auto_235781 ) ( ON ?auto_235779 ?auto_235780 ) ( CLEAR ?auto_235777 ) ( ON ?auto_235778 ?auto_235779 ) ( CLEAR ?auto_235778 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_235774 ?auto_235775 ?auto_235776 ?auto_235777 ?auto_235778 )
      ( MAKE-12PILE ?auto_235774 ?auto_235775 ?auto_235776 ?auto_235777 ?auto_235778 ?auto_235779 ?auto_235780 ?auto_235781 ?auto_235782 ?auto_235783 ?auto_235784 ?auto_235785 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_235799 - BLOCK
      ?auto_235800 - BLOCK
      ?auto_235801 - BLOCK
      ?auto_235802 - BLOCK
      ?auto_235803 - BLOCK
      ?auto_235804 - BLOCK
      ?auto_235805 - BLOCK
      ?auto_235806 - BLOCK
      ?auto_235807 - BLOCK
      ?auto_235808 - BLOCK
      ?auto_235809 - BLOCK
      ?auto_235810 - BLOCK
    )
    :vars
    (
      ?auto_235811 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_235810 ?auto_235811 ) ( ON-TABLE ?auto_235799 ) ( ON ?auto_235800 ?auto_235799 ) ( ON ?auto_235801 ?auto_235800 ) ( ON ?auto_235802 ?auto_235801 ) ( not ( = ?auto_235799 ?auto_235800 ) ) ( not ( = ?auto_235799 ?auto_235801 ) ) ( not ( = ?auto_235799 ?auto_235802 ) ) ( not ( = ?auto_235799 ?auto_235803 ) ) ( not ( = ?auto_235799 ?auto_235804 ) ) ( not ( = ?auto_235799 ?auto_235805 ) ) ( not ( = ?auto_235799 ?auto_235806 ) ) ( not ( = ?auto_235799 ?auto_235807 ) ) ( not ( = ?auto_235799 ?auto_235808 ) ) ( not ( = ?auto_235799 ?auto_235809 ) ) ( not ( = ?auto_235799 ?auto_235810 ) ) ( not ( = ?auto_235799 ?auto_235811 ) ) ( not ( = ?auto_235800 ?auto_235801 ) ) ( not ( = ?auto_235800 ?auto_235802 ) ) ( not ( = ?auto_235800 ?auto_235803 ) ) ( not ( = ?auto_235800 ?auto_235804 ) ) ( not ( = ?auto_235800 ?auto_235805 ) ) ( not ( = ?auto_235800 ?auto_235806 ) ) ( not ( = ?auto_235800 ?auto_235807 ) ) ( not ( = ?auto_235800 ?auto_235808 ) ) ( not ( = ?auto_235800 ?auto_235809 ) ) ( not ( = ?auto_235800 ?auto_235810 ) ) ( not ( = ?auto_235800 ?auto_235811 ) ) ( not ( = ?auto_235801 ?auto_235802 ) ) ( not ( = ?auto_235801 ?auto_235803 ) ) ( not ( = ?auto_235801 ?auto_235804 ) ) ( not ( = ?auto_235801 ?auto_235805 ) ) ( not ( = ?auto_235801 ?auto_235806 ) ) ( not ( = ?auto_235801 ?auto_235807 ) ) ( not ( = ?auto_235801 ?auto_235808 ) ) ( not ( = ?auto_235801 ?auto_235809 ) ) ( not ( = ?auto_235801 ?auto_235810 ) ) ( not ( = ?auto_235801 ?auto_235811 ) ) ( not ( = ?auto_235802 ?auto_235803 ) ) ( not ( = ?auto_235802 ?auto_235804 ) ) ( not ( = ?auto_235802 ?auto_235805 ) ) ( not ( = ?auto_235802 ?auto_235806 ) ) ( not ( = ?auto_235802 ?auto_235807 ) ) ( not ( = ?auto_235802 ?auto_235808 ) ) ( not ( = ?auto_235802 ?auto_235809 ) ) ( not ( = ?auto_235802 ?auto_235810 ) ) ( not ( = ?auto_235802 ?auto_235811 ) ) ( not ( = ?auto_235803 ?auto_235804 ) ) ( not ( = ?auto_235803 ?auto_235805 ) ) ( not ( = ?auto_235803 ?auto_235806 ) ) ( not ( = ?auto_235803 ?auto_235807 ) ) ( not ( = ?auto_235803 ?auto_235808 ) ) ( not ( = ?auto_235803 ?auto_235809 ) ) ( not ( = ?auto_235803 ?auto_235810 ) ) ( not ( = ?auto_235803 ?auto_235811 ) ) ( not ( = ?auto_235804 ?auto_235805 ) ) ( not ( = ?auto_235804 ?auto_235806 ) ) ( not ( = ?auto_235804 ?auto_235807 ) ) ( not ( = ?auto_235804 ?auto_235808 ) ) ( not ( = ?auto_235804 ?auto_235809 ) ) ( not ( = ?auto_235804 ?auto_235810 ) ) ( not ( = ?auto_235804 ?auto_235811 ) ) ( not ( = ?auto_235805 ?auto_235806 ) ) ( not ( = ?auto_235805 ?auto_235807 ) ) ( not ( = ?auto_235805 ?auto_235808 ) ) ( not ( = ?auto_235805 ?auto_235809 ) ) ( not ( = ?auto_235805 ?auto_235810 ) ) ( not ( = ?auto_235805 ?auto_235811 ) ) ( not ( = ?auto_235806 ?auto_235807 ) ) ( not ( = ?auto_235806 ?auto_235808 ) ) ( not ( = ?auto_235806 ?auto_235809 ) ) ( not ( = ?auto_235806 ?auto_235810 ) ) ( not ( = ?auto_235806 ?auto_235811 ) ) ( not ( = ?auto_235807 ?auto_235808 ) ) ( not ( = ?auto_235807 ?auto_235809 ) ) ( not ( = ?auto_235807 ?auto_235810 ) ) ( not ( = ?auto_235807 ?auto_235811 ) ) ( not ( = ?auto_235808 ?auto_235809 ) ) ( not ( = ?auto_235808 ?auto_235810 ) ) ( not ( = ?auto_235808 ?auto_235811 ) ) ( not ( = ?auto_235809 ?auto_235810 ) ) ( not ( = ?auto_235809 ?auto_235811 ) ) ( not ( = ?auto_235810 ?auto_235811 ) ) ( ON ?auto_235809 ?auto_235810 ) ( ON ?auto_235808 ?auto_235809 ) ( ON ?auto_235807 ?auto_235808 ) ( ON ?auto_235806 ?auto_235807 ) ( ON ?auto_235805 ?auto_235806 ) ( ON ?auto_235804 ?auto_235805 ) ( CLEAR ?auto_235802 ) ( ON ?auto_235803 ?auto_235804 ) ( CLEAR ?auto_235803 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_235799 ?auto_235800 ?auto_235801 ?auto_235802 ?auto_235803 )
      ( MAKE-12PILE ?auto_235799 ?auto_235800 ?auto_235801 ?auto_235802 ?auto_235803 ?auto_235804 ?auto_235805 ?auto_235806 ?auto_235807 ?auto_235808 ?auto_235809 ?auto_235810 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_235824 - BLOCK
      ?auto_235825 - BLOCK
      ?auto_235826 - BLOCK
      ?auto_235827 - BLOCK
      ?auto_235828 - BLOCK
      ?auto_235829 - BLOCK
      ?auto_235830 - BLOCK
      ?auto_235831 - BLOCK
      ?auto_235832 - BLOCK
      ?auto_235833 - BLOCK
      ?auto_235834 - BLOCK
      ?auto_235835 - BLOCK
    )
    :vars
    (
      ?auto_235836 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_235835 ?auto_235836 ) ( ON-TABLE ?auto_235824 ) ( ON ?auto_235825 ?auto_235824 ) ( ON ?auto_235826 ?auto_235825 ) ( not ( = ?auto_235824 ?auto_235825 ) ) ( not ( = ?auto_235824 ?auto_235826 ) ) ( not ( = ?auto_235824 ?auto_235827 ) ) ( not ( = ?auto_235824 ?auto_235828 ) ) ( not ( = ?auto_235824 ?auto_235829 ) ) ( not ( = ?auto_235824 ?auto_235830 ) ) ( not ( = ?auto_235824 ?auto_235831 ) ) ( not ( = ?auto_235824 ?auto_235832 ) ) ( not ( = ?auto_235824 ?auto_235833 ) ) ( not ( = ?auto_235824 ?auto_235834 ) ) ( not ( = ?auto_235824 ?auto_235835 ) ) ( not ( = ?auto_235824 ?auto_235836 ) ) ( not ( = ?auto_235825 ?auto_235826 ) ) ( not ( = ?auto_235825 ?auto_235827 ) ) ( not ( = ?auto_235825 ?auto_235828 ) ) ( not ( = ?auto_235825 ?auto_235829 ) ) ( not ( = ?auto_235825 ?auto_235830 ) ) ( not ( = ?auto_235825 ?auto_235831 ) ) ( not ( = ?auto_235825 ?auto_235832 ) ) ( not ( = ?auto_235825 ?auto_235833 ) ) ( not ( = ?auto_235825 ?auto_235834 ) ) ( not ( = ?auto_235825 ?auto_235835 ) ) ( not ( = ?auto_235825 ?auto_235836 ) ) ( not ( = ?auto_235826 ?auto_235827 ) ) ( not ( = ?auto_235826 ?auto_235828 ) ) ( not ( = ?auto_235826 ?auto_235829 ) ) ( not ( = ?auto_235826 ?auto_235830 ) ) ( not ( = ?auto_235826 ?auto_235831 ) ) ( not ( = ?auto_235826 ?auto_235832 ) ) ( not ( = ?auto_235826 ?auto_235833 ) ) ( not ( = ?auto_235826 ?auto_235834 ) ) ( not ( = ?auto_235826 ?auto_235835 ) ) ( not ( = ?auto_235826 ?auto_235836 ) ) ( not ( = ?auto_235827 ?auto_235828 ) ) ( not ( = ?auto_235827 ?auto_235829 ) ) ( not ( = ?auto_235827 ?auto_235830 ) ) ( not ( = ?auto_235827 ?auto_235831 ) ) ( not ( = ?auto_235827 ?auto_235832 ) ) ( not ( = ?auto_235827 ?auto_235833 ) ) ( not ( = ?auto_235827 ?auto_235834 ) ) ( not ( = ?auto_235827 ?auto_235835 ) ) ( not ( = ?auto_235827 ?auto_235836 ) ) ( not ( = ?auto_235828 ?auto_235829 ) ) ( not ( = ?auto_235828 ?auto_235830 ) ) ( not ( = ?auto_235828 ?auto_235831 ) ) ( not ( = ?auto_235828 ?auto_235832 ) ) ( not ( = ?auto_235828 ?auto_235833 ) ) ( not ( = ?auto_235828 ?auto_235834 ) ) ( not ( = ?auto_235828 ?auto_235835 ) ) ( not ( = ?auto_235828 ?auto_235836 ) ) ( not ( = ?auto_235829 ?auto_235830 ) ) ( not ( = ?auto_235829 ?auto_235831 ) ) ( not ( = ?auto_235829 ?auto_235832 ) ) ( not ( = ?auto_235829 ?auto_235833 ) ) ( not ( = ?auto_235829 ?auto_235834 ) ) ( not ( = ?auto_235829 ?auto_235835 ) ) ( not ( = ?auto_235829 ?auto_235836 ) ) ( not ( = ?auto_235830 ?auto_235831 ) ) ( not ( = ?auto_235830 ?auto_235832 ) ) ( not ( = ?auto_235830 ?auto_235833 ) ) ( not ( = ?auto_235830 ?auto_235834 ) ) ( not ( = ?auto_235830 ?auto_235835 ) ) ( not ( = ?auto_235830 ?auto_235836 ) ) ( not ( = ?auto_235831 ?auto_235832 ) ) ( not ( = ?auto_235831 ?auto_235833 ) ) ( not ( = ?auto_235831 ?auto_235834 ) ) ( not ( = ?auto_235831 ?auto_235835 ) ) ( not ( = ?auto_235831 ?auto_235836 ) ) ( not ( = ?auto_235832 ?auto_235833 ) ) ( not ( = ?auto_235832 ?auto_235834 ) ) ( not ( = ?auto_235832 ?auto_235835 ) ) ( not ( = ?auto_235832 ?auto_235836 ) ) ( not ( = ?auto_235833 ?auto_235834 ) ) ( not ( = ?auto_235833 ?auto_235835 ) ) ( not ( = ?auto_235833 ?auto_235836 ) ) ( not ( = ?auto_235834 ?auto_235835 ) ) ( not ( = ?auto_235834 ?auto_235836 ) ) ( not ( = ?auto_235835 ?auto_235836 ) ) ( ON ?auto_235834 ?auto_235835 ) ( ON ?auto_235833 ?auto_235834 ) ( ON ?auto_235832 ?auto_235833 ) ( ON ?auto_235831 ?auto_235832 ) ( ON ?auto_235830 ?auto_235831 ) ( ON ?auto_235829 ?auto_235830 ) ( ON ?auto_235828 ?auto_235829 ) ( CLEAR ?auto_235826 ) ( ON ?auto_235827 ?auto_235828 ) ( CLEAR ?auto_235827 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_235824 ?auto_235825 ?auto_235826 ?auto_235827 )
      ( MAKE-12PILE ?auto_235824 ?auto_235825 ?auto_235826 ?auto_235827 ?auto_235828 ?auto_235829 ?auto_235830 ?auto_235831 ?auto_235832 ?auto_235833 ?auto_235834 ?auto_235835 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_235849 - BLOCK
      ?auto_235850 - BLOCK
      ?auto_235851 - BLOCK
      ?auto_235852 - BLOCK
      ?auto_235853 - BLOCK
      ?auto_235854 - BLOCK
      ?auto_235855 - BLOCK
      ?auto_235856 - BLOCK
      ?auto_235857 - BLOCK
      ?auto_235858 - BLOCK
      ?auto_235859 - BLOCK
      ?auto_235860 - BLOCK
    )
    :vars
    (
      ?auto_235861 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_235860 ?auto_235861 ) ( ON-TABLE ?auto_235849 ) ( ON ?auto_235850 ?auto_235849 ) ( ON ?auto_235851 ?auto_235850 ) ( not ( = ?auto_235849 ?auto_235850 ) ) ( not ( = ?auto_235849 ?auto_235851 ) ) ( not ( = ?auto_235849 ?auto_235852 ) ) ( not ( = ?auto_235849 ?auto_235853 ) ) ( not ( = ?auto_235849 ?auto_235854 ) ) ( not ( = ?auto_235849 ?auto_235855 ) ) ( not ( = ?auto_235849 ?auto_235856 ) ) ( not ( = ?auto_235849 ?auto_235857 ) ) ( not ( = ?auto_235849 ?auto_235858 ) ) ( not ( = ?auto_235849 ?auto_235859 ) ) ( not ( = ?auto_235849 ?auto_235860 ) ) ( not ( = ?auto_235849 ?auto_235861 ) ) ( not ( = ?auto_235850 ?auto_235851 ) ) ( not ( = ?auto_235850 ?auto_235852 ) ) ( not ( = ?auto_235850 ?auto_235853 ) ) ( not ( = ?auto_235850 ?auto_235854 ) ) ( not ( = ?auto_235850 ?auto_235855 ) ) ( not ( = ?auto_235850 ?auto_235856 ) ) ( not ( = ?auto_235850 ?auto_235857 ) ) ( not ( = ?auto_235850 ?auto_235858 ) ) ( not ( = ?auto_235850 ?auto_235859 ) ) ( not ( = ?auto_235850 ?auto_235860 ) ) ( not ( = ?auto_235850 ?auto_235861 ) ) ( not ( = ?auto_235851 ?auto_235852 ) ) ( not ( = ?auto_235851 ?auto_235853 ) ) ( not ( = ?auto_235851 ?auto_235854 ) ) ( not ( = ?auto_235851 ?auto_235855 ) ) ( not ( = ?auto_235851 ?auto_235856 ) ) ( not ( = ?auto_235851 ?auto_235857 ) ) ( not ( = ?auto_235851 ?auto_235858 ) ) ( not ( = ?auto_235851 ?auto_235859 ) ) ( not ( = ?auto_235851 ?auto_235860 ) ) ( not ( = ?auto_235851 ?auto_235861 ) ) ( not ( = ?auto_235852 ?auto_235853 ) ) ( not ( = ?auto_235852 ?auto_235854 ) ) ( not ( = ?auto_235852 ?auto_235855 ) ) ( not ( = ?auto_235852 ?auto_235856 ) ) ( not ( = ?auto_235852 ?auto_235857 ) ) ( not ( = ?auto_235852 ?auto_235858 ) ) ( not ( = ?auto_235852 ?auto_235859 ) ) ( not ( = ?auto_235852 ?auto_235860 ) ) ( not ( = ?auto_235852 ?auto_235861 ) ) ( not ( = ?auto_235853 ?auto_235854 ) ) ( not ( = ?auto_235853 ?auto_235855 ) ) ( not ( = ?auto_235853 ?auto_235856 ) ) ( not ( = ?auto_235853 ?auto_235857 ) ) ( not ( = ?auto_235853 ?auto_235858 ) ) ( not ( = ?auto_235853 ?auto_235859 ) ) ( not ( = ?auto_235853 ?auto_235860 ) ) ( not ( = ?auto_235853 ?auto_235861 ) ) ( not ( = ?auto_235854 ?auto_235855 ) ) ( not ( = ?auto_235854 ?auto_235856 ) ) ( not ( = ?auto_235854 ?auto_235857 ) ) ( not ( = ?auto_235854 ?auto_235858 ) ) ( not ( = ?auto_235854 ?auto_235859 ) ) ( not ( = ?auto_235854 ?auto_235860 ) ) ( not ( = ?auto_235854 ?auto_235861 ) ) ( not ( = ?auto_235855 ?auto_235856 ) ) ( not ( = ?auto_235855 ?auto_235857 ) ) ( not ( = ?auto_235855 ?auto_235858 ) ) ( not ( = ?auto_235855 ?auto_235859 ) ) ( not ( = ?auto_235855 ?auto_235860 ) ) ( not ( = ?auto_235855 ?auto_235861 ) ) ( not ( = ?auto_235856 ?auto_235857 ) ) ( not ( = ?auto_235856 ?auto_235858 ) ) ( not ( = ?auto_235856 ?auto_235859 ) ) ( not ( = ?auto_235856 ?auto_235860 ) ) ( not ( = ?auto_235856 ?auto_235861 ) ) ( not ( = ?auto_235857 ?auto_235858 ) ) ( not ( = ?auto_235857 ?auto_235859 ) ) ( not ( = ?auto_235857 ?auto_235860 ) ) ( not ( = ?auto_235857 ?auto_235861 ) ) ( not ( = ?auto_235858 ?auto_235859 ) ) ( not ( = ?auto_235858 ?auto_235860 ) ) ( not ( = ?auto_235858 ?auto_235861 ) ) ( not ( = ?auto_235859 ?auto_235860 ) ) ( not ( = ?auto_235859 ?auto_235861 ) ) ( not ( = ?auto_235860 ?auto_235861 ) ) ( ON ?auto_235859 ?auto_235860 ) ( ON ?auto_235858 ?auto_235859 ) ( ON ?auto_235857 ?auto_235858 ) ( ON ?auto_235856 ?auto_235857 ) ( ON ?auto_235855 ?auto_235856 ) ( ON ?auto_235854 ?auto_235855 ) ( ON ?auto_235853 ?auto_235854 ) ( CLEAR ?auto_235851 ) ( ON ?auto_235852 ?auto_235853 ) ( CLEAR ?auto_235852 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_235849 ?auto_235850 ?auto_235851 ?auto_235852 )
      ( MAKE-12PILE ?auto_235849 ?auto_235850 ?auto_235851 ?auto_235852 ?auto_235853 ?auto_235854 ?auto_235855 ?auto_235856 ?auto_235857 ?auto_235858 ?auto_235859 ?auto_235860 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_235874 - BLOCK
      ?auto_235875 - BLOCK
      ?auto_235876 - BLOCK
      ?auto_235877 - BLOCK
      ?auto_235878 - BLOCK
      ?auto_235879 - BLOCK
      ?auto_235880 - BLOCK
      ?auto_235881 - BLOCK
      ?auto_235882 - BLOCK
      ?auto_235883 - BLOCK
      ?auto_235884 - BLOCK
      ?auto_235885 - BLOCK
    )
    :vars
    (
      ?auto_235886 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_235885 ?auto_235886 ) ( ON-TABLE ?auto_235874 ) ( ON ?auto_235875 ?auto_235874 ) ( not ( = ?auto_235874 ?auto_235875 ) ) ( not ( = ?auto_235874 ?auto_235876 ) ) ( not ( = ?auto_235874 ?auto_235877 ) ) ( not ( = ?auto_235874 ?auto_235878 ) ) ( not ( = ?auto_235874 ?auto_235879 ) ) ( not ( = ?auto_235874 ?auto_235880 ) ) ( not ( = ?auto_235874 ?auto_235881 ) ) ( not ( = ?auto_235874 ?auto_235882 ) ) ( not ( = ?auto_235874 ?auto_235883 ) ) ( not ( = ?auto_235874 ?auto_235884 ) ) ( not ( = ?auto_235874 ?auto_235885 ) ) ( not ( = ?auto_235874 ?auto_235886 ) ) ( not ( = ?auto_235875 ?auto_235876 ) ) ( not ( = ?auto_235875 ?auto_235877 ) ) ( not ( = ?auto_235875 ?auto_235878 ) ) ( not ( = ?auto_235875 ?auto_235879 ) ) ( not ( = ?auto_235875 ?auto_235880 ) ) ( not ( = ?auto_235875 ?auto_235881 ) ) ( not ( = ?auto_235875 ?auto_235882 ) ) ( not ( = ?auto_235875 ?auto_235883 ) ) ( not ( = ?auto_235875 ?auto_235884 ) ) ( not ( = ?auto_235875 ?auto_235885 ) ) ( not ( = ?auto_235875 ?auto_235886 ) ) ( not ( = ?auto_235876 ?auto_235877 ) ) ( not ( = ?auto_235876 ?auto_235878 ) ) ( not ( = ?auto_235876 ?auto_235879 ) ) ( not ( = ?auto_235876 ?auto_235880 ) ) ( not ( = ?auto_235876 ?auto_235881 ) ) ( not ( = ?auto_235876 ?auto_235882 ) ) ( not ( = ?auto_235876 ?auto_235883 ) ) ( not ( = ?auto_235876 ?auto_235884 ) ) ( not ( = ?auto_235876 ?auto_235885 ) ) ( not ( = ?auto_235876 ?auto_235886 ) ) ( not ( = ?auto_235877 ?auto_235878 ) ) ( not ( = ?auto_235877 ?auto_235879 ) ) ( not ( = ?auto_235877 ?auto_235880 ) ) ( not ( = ?auto_235877 ?auto_235881 ) ) ( not ( = ?auto_235877 ?auto_235882 ) ) ( not ( = ?auto_235877 ?auto_235883 ) ) ( not ( = ?auto_235877 ?auto_235884 ) ) ( not ( = ?auto_235877 ?auto_235885 ) ) ( not ( = ?auto_235877 ?auto_235886 ) ) ( not ( = ?auto_235878 ?auto_235879 ) ) ( not ( = ?auto_235878 ?auto_235880 ) ) ( not ( = ?auto_235878 ?auto_235881 ) ) ( not ( = ?auto_235878 ?auto_235882 ) ) ( not ( = ?auto_235878 ?auto_235883 ) ) ( not ( = ?auto_235878 ?auto_235884 ) ) ( not ( = ?auto_235878 ?auto_235885 ) ) ( not ( = ?auto_235878 ?auto_235886 ) ) ( not ( = ?auto_235879 ?auto_235880 ) ) ( not ( = ?auto_235879 ?auto_235881 ) ) ( not ( = ?auto_235879 ?auto_235882 ) ) ( not ( = ?auto_235879 ?auto_235883 ) ) ( not ( = ?auto_235879 ?auto_235884 ) ) ( not ( = ?auto_235879 ?auto_235885 ) ) ( not ( = ?auto_235879 ?auto_235886 ) ) ( not ( = ?auto_235880 ?auto_235881 ) ) ( not ( = ?auto_235880 ?auto_235882 ) ) ( not ( = ?auto_235880 ?auto_235883 ) ) ( not ( = ?auto_235880 ?auto_235884 ) ) ( not ( = ?auto_235880 ?auto_235885 ) ) ( not ( = ?auto_235880 ?auto_235886 ) ) ( not ( = ?auto_235881 ?auto_235882 ) ) ( not ( = ?auto_235881 ?auto_235883 ) ) ( not ( = ?auto_235881 ?auto_235884 ) ) ( not ( = ?auto_235881 ?auto_235885 ) ) ( not ( = ?auto_235881 ?auto_235886 ) ) ( not ( = ?auto_235882 ?auto_235883 ) ) ( not ( = ?auto_235882 ?auto_235884 ) ) ( not ( = ?auto_235882 ?auto_235885 ) ) ( not ( = ?auto_235882 ?auto_235886 ) ) ( not ( = ?auto_235883 ?auto_235884 ) ) ( not ( = ?auto_235883 ?auto_235885 ) ) ( not ( = ?auto_235883 ?auto_235886 ) ) ( not ( = ?auto_235884 ?auto_235885 ) ) ( not ( = ?auto_235884 ?auto_235886 ) ) ( not ( = ?auto_235885 ?auto_235886 ) ) ( ON ?auto_235884 ?auto_235885 ) ( ON ?auto_235883 ?auto_235884 ) ( ON ?auto_235882 ?auto_235883 ) ( ON ?auto_235881 ?auto_235882 ) ( ON ?auto_235880 ?auto_235881 ) ( ON ?auto_235879 ?auto_235880 ) ( ON ?auto_235878 ?auto_235879 ) ( ON ?auto_235877 ?auto_235878 ) ( CLEAR ?auto_235875 ) ( ON ?auto_235876 ?auto_235877 ) ( CLEAR ?auto_235876 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_235874 ?auto_235875 ?auto_235876 )
      ( MAKE-12PILE ?auto_235874 ?auto_235875 ?auto_235876 ?auto_235877 ?auto_235878 ?auto_235879 ?auto_235880 ?auto_235881 ?auto_235882 ?auto_235883 ?auto_235884 ?auto_235885 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_235899 - BLOCK
      ?auto_235900 - BLOCK
      ?auto_235901 - BLOCK
      ?auto_235902 - BLOCK
      ?auto_235903 - BLOCK
      ?auto_235904 - BLOCK
      ?auto_235905 - BLOCK
      ?auto_235906 - BLOCK
      ?auto_235907 - BLOCK
      ?auto_235908 - BLOCK
      ?auto_235909 - BLOCK
      ?auto_235910 - BLOCK
    )
    :vars
    (
      ?auto_235911 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_235910 ?auto_235911 ) ( ON-TABLE ?auto_235899 ) ( ON ?auto_235900 ?auto_235899 ) ( not ( = ?auto_235899 ?auto_235900 ) ) ( not ( = ?auto_235899 ?auto_235901 ) ) ( not ( = ?auto_235899 ?auto_235902 ) ) ( not ( = ?auto_235899 ?auto_235903 ) ) ( not ( = ?auto_235899 ?auto_235904 ) ) ( not ( = ?auto_235899 ?auto_235905 ) ) ( not ( = ?auto_235899 ?auto_235906 ) ) ( not ( = ?auto_235899 ?auto_235907 ) ) ( not ( = ?auto_235899 ?auto_235908 ) ) ( not ( = ?auto_235899 ?auto_235909 ) ) ( not ( = ?auto_235899 ?auto_235910 ) ) ( not ( = ?auto_235899 ?auto_235911 ) ) ( not ( = ?auto_235900 ?auto_235901 ) ) ( not ( = ?auto_235900 ?auto_235902 ) ) ( not ( = ?auto_235900 ?auto_235903 ) ) ( not ( = ?auto_235900 ?auto_235904 ) ) ( not ( = ?auto_235900 ?auto_235905 ) ) ( not ( = ?auto_235900 ?auto_235906 ) ) ( not ( = ?auto_235900 ?auto_235907 ) ) ( not ( = ?auto_235900 ?auto_235908 ) ) ( not ( = ?auto_235900 ?auto_235909 ) ) ( not ( = ?auto_235900 ?auto_235910 ) ) ( not ( = ?auto_235900 ?auto_235911 ) ) ( not ( = ?auto_235901 ?auto_235902 ) ) ( not ( = ?auto_235901 ?auto_235903 ) ) ( not ( = ?auto_235901 ?auto_235904 ) ) ( not ( = ?auto_235901 ?auto_235905 ) ) ( not ( = ?auto_235901 ?auto_235906 ) ) ( not ( = ?auto_235901 ?auto_235907 ) ) ( not ( = ?auto_235901 ?auto_235908 ) ) ( not ( = ?auto_235901 ?auto_235909 ) ) ( not ( = ?auto_235901 ?auto_235910 ) ) ( not ( = ?auto_235901 ?auto_235911 ) ) ( not ( = ?auto_235902 ?auto_235903 ) ) ( not ( = ?auto_235902 ?auto_235904 ) ) ( not ( = ?auto_235902 ?auto_235905 ) ) ( not ( = ?auto_235902 ?auto_235906 ) ) ( not ( = ?auto_235902 ?auto_235907 ) ) ( not ( = ?auto_235902 ?auto_235908 ) ) ( not ( = ?auto_235902 ?auto_235909 ) ) ( not ( = ?auto_235902 ?auto_235910 ) ) ( not ( = ?auto_235902 ?auto_235911 ) ) ( not ( = ?auto_235903 ?auto_235904 ) ) ( not ( = ?auto_235903 ?auto_235905 ) ) ( not ( = ?auto_235903 ?auto_235906 ) ) ( not ( = ?auto_235903 ?auto_235907 ) ) ( not ( = ?auto_235903 ?auto_235908 ) ) ( not ( = ?auto_235903 ?auto_235909 ) ) ( not ( = ?auto_235903 ?auto_235910 ) ) ( not ( = ?auto_235903 ?auto_235911 ) ) ( not ( = ?auto_235904 ?auto_235905 ) ) ( not ( = ?auto_235904 ?auto_235906 ) ) ( not ( = ?auto_235904 ?auto_235907 ) ) ( not ( = ?auto_235904 ?auto_235908 ) ) ( not ( = ?auto_235904 ?auto_235909 ) ) ( not ( = ?auto_235904 ?auto_235910 ) ) ( not ( = ?auto_235904 ?auto_235911 ) ) ( not ( = ?auto_235905 ?auto_235906 ) ) ( not ( = ?auto_235905 ?auto_235907 ) ) ( not ( = ?auto_235905 ?auto_235908 ) ) ( not ( = ?auto_235905 ?auto_235909 ) ) ( not ( = ?auto_235905 ?auto_235910 ) ) ( not ( = ?auto_235905 ?auto_235911 ) ) ( not ( = ?auto_235906 ?auto_235907 ) ) ( not ( = ?auto_235906 ?auto_235908 ) ) ( not ( = ?auto_235906 ?auto_235909 ) ) ( not ( = ?auto_235906 ?auto_235910 ) ) ( not ( = ?auto_235906 ?auto_235911 ) ) ( not ( = ?auto_235907 ?auto_235908 ) ) ( not ( = ?auto_235907 ?auto_235909 ) ) ( not ( = ?auto_235907 ?auto_235910 ) ) ( not ( = ?auto_235907 ?auto_235911 ) ) ( not ( = ?auto_235908 ?auto_235909 ) ) ( not ( = ?auto_235908 ?auto_235910 ) ) ( not ( = ?auto_235908 ?auto_235911 ) ) ( not ( = ?auto_235909 ?auto_235910 ) ) ( not ( = ?auto_235909 ?auto_235911 ) ) ( not ( = ?auto_235910 ?auto_235911 ) ) ( ON ?auto_235909 ?auto_235910 ) ( ON ?auto_235908 ?auto_235909 ) ( ON ?auto_235907 ?auto_235908 ) ( ON ?auto_235906 ?auto_235907 ) ( ON ?auto_235905 ?auto_235906 ) ( ON ?auto_235904 ?auto_235905 ) ( ON ?auto_235903 ?auto_235904 ) ( ON ?auto_235902 ?auto_235903 ) ( CLEAR ?auto_235900 ) ( ON ?auto_235901 ?auto_235902 ) ( CLEAR ?auto_235901 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_235899 ?auto_235900 ?auto_235901 )
      ( MAKE-12PILE ?auto_235899 ?auto_235900 ?auto_235901 ?auto_235902 ?auto_235903 ?auto_235904 ?auto_235905 ?auto_235906 ?auto_235907 ?auto_235908 ?auto_235909 ?auto_235910 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_235924 - BLOCK
      ?auto_235925 - BLOCK
      ?auto_235926 - BLOCK
      ?auto_235927 - BLOCK
      ?auto_235928 - BLOCK
      ?auto_235929 - BLOCK
      ?auto_235930 - BLOCK
      ?auto_235931 - BLOCK
      ?auto_235932 - BLOCK
      ?auto_235933 - BLOCK
      ?auto_235934 - BLOCK
      ?auto_235935 - BLOCK
    )
    :vars
    (
      ?auto_235936 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_235935 ?auto_235936 ) ( ON-TABLE ?auto_235924 ) ( not ( = ?auto_235924 ?auto_235925 ) ) ( not ( = ?auto_235924 ?auto_235926 ) ) ( not ( = ?auto_235924 ?auto_235927 ) ) ( not ( = ?auto_235924 ?auto_235928 ) ) ( not ( = ?auto_235924 ?auto_235929 ) ) ( not ( = ?auto_235924 ?auto_235930 ) ) ( not ( = ?auto_235924 ?auto_235931 ) ) ( not ( = ?auto_235924 ?auto_235932 ) ) ( not ( = ?auto_235924 ?auto_235933 ) ) ( not ( = ?auto_235924 ?auto_235934 ) ) ( not ( = ?auto_235924 ?auto_235935 ) ) ( not ( = ?auto_235924 ?auto_235936 ) ) ( not ( = ?auto_235925 ?auto_235926 ) ) ( not ( = ?auto_235925 ?auto_235927 ) ) ( not ( = ?auto_235925 ?auto_235928 ) ) ( not ( = ?auto_235925 ?auto_235929 ) ) ( not ( = ?auto_235925 ?auto_235930 ) ) ( not ( = ?auto_235925 ?auto_235931 ) ) ( not ( = ?auto_235925 ?auto_235932 ) ) ( not ( = ?auto_235925 ?auto_235933 ) ) ( not ( = ?auto_235925 ?auto_235934 ) ) ( not ( = ?auto_235925 ?auto_235935 ) ) ( not ( = ?auto_235925 ?auto_235936 ) ) ( not ( = ?auto_235926 ?auto_235927 ) ) ( not ( = ?auto_235926 ?auto_235928 ) ) ( not ( = ?auto_235926 ?auto_235929 ) ) ( not ( = ?auto_235926 ?auto_235930 ) ) ( not ( = ?auto_235926 ?auto_235931 ) ) ( not ( = ?auto_235926 ?auto_235932 ) ) ( not ( = ?auto_235926 ?auto_235933 ) ) ( not ( = ?auto_235926 ?auto_235934 ) ) ( not ( = ?auto_235926 ?auto_235935 ) ) ( not ( = ?auto_235926 ?auto_235936 ) ) ( not ( = ?auto_235927 ?auto_235928 ) ) ( not ( = ?auto_235927 ?auto_235929 ) ) ( not ( = ?auto_235927 ?auto_235930 ) ) ( not ( = ?auto_235927 ?auto_235931 ) ) ( not ( = ?auto_235927 ?auto_235932 ) ) ( not ( = ?auto_235927 ?auto_235933 ) ) ( not ( = ?auto_235927 ?auto_235934 ) ) ( not ( = ?auto_235927 ?auto_235935 ) ) ( not ( = ?auto_235927 ?auto_235936 ) ) ( not ( = ?auto_235928 ?auto_235929 ) ) ( not ( = ?auto_235928 ?auto_235930 ) ) ( not ( = ?auto_235928 ?auto_235931 ) ) ( not ( = ?auto_235928 ?auto_235932 ) ) ( not ( = ?auto_235928 ?auto_235933 ) ) ( not ( = ?auto_235928 ?auto_235934 ) ) ( not ( = ?auto_235928 ?auto_235935 ) ) ( not ( = ?auto_235928 ?auto_235936 ) ) ( not ( = ?auto_235929 ?auto_235930 ) ) ( not ( = ?auto_235929 ?auto_235931 ) ) ( not ( = ?auto_235929 ?auto_235932 ) ) ( not ( = ?auto_235929 ?auto_235933 ) ) ( not ( = ?auto_235929 ?auto_235934 ) ) ( not ( = ?auto_235929 ?auto_235935 ) ) ( not ( = ?auto_235929 ?auto_235936 ) ) ( not ( = ?auto_235930 ?auto_235931 ) ) ( not ( = ?auto_235930 ?auto_235932 ) ) ( not ( = ?auto_235930 ?auto_235933 ) ) ( not ( = ?auto_235930 ?auto_235934 ) ) ( not ( = ?auto_235930 ?auto_235935 ) ) ( not ( = ?auto_235930 ?auto_235936 ) ) ( not ( = ?auto_235931 ?auto_235932 ) ) ( not ( = ?auto_235931 ?auto_235933 ) ) ( not ( = ?auto_235931 ?auto_235934 ) ) ( not ( = ?auto_235931 ?auto_235935 ) ) ( not ( = ?auto_235931 ?auto_235936 ) ) ( not ( = ?auto_235932 ?auto_235933 ) ) ( not ( = ?auto_235932 ?auto_235934 ) ) ( not ( = ?auto_235932 ?auto_235935 ) ) ( not ( = ?auto_235932 ?auto_235936 ) ) ( not ( = ?auto_235933 ?auto_235934 ) ) ( not ( = ?auto_235933 ?auto_235935 ) ) ( not ( = ?auto_235933 ?auto_235936 ) ) ( not ( = ?auto_235934 ?auto_235935 ) ) ( not ( = ?auto_235934 ?auto_235936 ) ) ( not ( = ?auto_235935 ?auto_235936 ) ) ( ON ?auto_235934 ?auto_235935 ) ( ON ?auto_235933 ?auto_235934 ) ( ON ?auto_235932 ?auto_235933 ) ( ON ?auto_235931 ?auto_235932 ) ( ON ?auto_235930 ?auto_235931 ) ( ON ?auto_235929 ?auto_235930 ) ( ON ?auto_235928 ?auto_235929 ) ( ON ?auto_235927 ?auto_235928 ) ( ON ?auto_235926 ?auto_235927 ) ( CLEAR ?auto_235924 ) ( ON ?auto_235925 ?auto_235926 ) ( CLEAR ?auto_235925 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_235924 ?auto_235925 )
      ( MAKE-12PILE ?auto_235924 ?auto_235925 ?auto_235926 ?auto_235927 ?auto_235928 ?auto_235929 ?auto_235930 ?auto_235931 ?auto_235932 ?auto_235933 ?auto_235934 ?auto_235935 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_235949 - BLOCK
      ?auto_235950 - BLOCK
      ?auto_235951 - BLOCK
      ?auto_235952 - BLOCK
      ?auto_235953 - BLOCK
      ?auto_235954 - BLOCK
      ?auto_235955 - BLOCK
      ?auto_235956 - BLOCK
      ?auto_235957 - BLOCK
      ?auto_235958 - BLOCK
      ?auto_235959 - BLOCK
      ?auto_235960 - BLOCK
    )
    :vars
    (
      ?auto_235961 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_235960 ?auto_235961 ) ( ON-TABLE ?auto_235949 ) ( not ( = ?auto_235949 ?auto_235950 ) ) ( not ( = ?auto_235949 ?auto_235951 ) ) ( not ( = ?auto_235949 ?auto_235952 ) ) ( not ( = ?auto_235949 ?auto_235953 ) ) ( not ( = ?auto_235949 ?auto_235954 ) ) ( not ( = ?auto_235949 ?auto_235955 ) ) ( not ( = ?auto_235949 ?auto_235956 ) ) ( not ( = ?auto_235949 ?auto_235957 ) ) ( not ( = ?auto_235949 ?auto_235958 ) ) ( not ( = ?auto_235949 ?auto_235959 ) ) ( not ( = ?auto_235949 ?auto_235960 ) ) ( not ( = ?auto_235949 ?auto_235961 ) ) ( not ( = ?auto_235950 ?auto_235951 ) ) ( not ( = ?auto_235950 ?auto_235952 ) ) ( not ( = ?auto_235950 ?auto_235953 ) ) ( not ( = ?auto_235950 ?auto_235954 ) ) ( not ( = ?auto_235950 ?auto_235955 ) ) ( not ( = ?auto_235950 ?auto_235956 ) ) ( not ( = ?auto_235950 ?auto_235957 ) ) ( not ( = ?auto_235950 ?auto_235958 ) ) ( not ( = ?auto_235950 ?auto_235959 ) ) ( not ( = ?auto_235950 ?auto_235960 ) ) ( not ( = ?auto_235950 ?auto_235961 ) ) ( not ( = ?auto_235951 ?auto_235952 ) ) ( not ( = ?auto_235951 ?auto_235953 ) ) ( not ( = ?auto_235951 ?auto_235954 ) ) ( not ( = ?auto_235951 ?auto_235955 ) ) ( not ( = ?auto_235951 ?auto_235956 ) ) ( not ( = ?auto_235951 ?auto_235957 ) ) ( not ( = ?auto_235951 ?auto_235958 ) ) ( not ( = ?auto_235951 ?auto_235959 ) ) ( not ( = ?auto_235951 ?auto_235960 ) ) ( not ( = ?auto_235951 ?auto_235961 ) ) ( not ( = ?auto_235952 ?auto_235953 ) ) ( not ( = ?auto_235952 ?auto_235954 ) ) ( not ( = ?auto_235952 ?auto_235955 ) ) ( not ( = ?auto_235952 ?auto_235956 ) ) ( not ( = ?auto_235952 ?auto_235957 ) ) ( not ( = ?auto_235952 ?auto_235958 ) ) ( not ( = ?auto_235952 ?auto_235959 ) ) ( not ( = ?auto_235952 ?auto_235960 ) ) ( not ( = ?auto_235952 ?auto_235961 ) ) ( not ( = ?auto_235953 ?auto_235954 ) ) ( not ( = ?auto_235953 ?auto_235955 ) ) ( not ( = ?auto_235953 ?auto_235956 ) ) ( not ( = ?auto_235953 ?auto_235957 ) ) ( not ( = ?auto_235953 ?auto_235958 ) ) ( not ( = ?auto_235953 ?auto_235959 ) ) ( not ( = ?auto_235953 ?auto_235960 ) ) ( not ( = ?auto_235953 ?auto_235961 ) ) ( not ( = ?auto_235954 ?auto_235955 ) ) ( not ( = ?auto_235954 ?auto_235956 ) ) ( not ( = ?auto_235954 ?auto_235957 ) ) ( not ( = ?auto_235954 ?auto_235958 ) ) ( not ( = ?auto_235954 ?auto_235959 ) ) ( not ( = ?auto_235954 ?auto_235960 ) ) ( not ( = ?auto_235954 ?auto_235961 ) ) ( not ( = ?auto_235955 ?auto_235956 ) ) ( not ( = ?auto_235955 ?auto_235957 ) ) ( not ( = ?auto_235955 ?auto_235958 ) ) ( not ( = ?auto_235955 ?auto_235959 ) ) ( not ( = ?auto_235955 ?auto_235960 ) ) ( not ( = ?auto_235955 ?auto_235961 ) ) ( not ( = ?auto_235956 ?auto_235957 ) ) ( not ( = ?auto_235956 ?auto_235958 ) ) ( not ( = ?auto_235956 ?auto_235959 ) ) ( not ( = ?auto_235956 ?auto_235960 ) ) ( not ( = ?auto_235956 ?auto_235961 ) ) ( not ( = ?auto_235957 ?auto_235958 ) ) ( not ( = ?auto_235957 ?auto_235959 ) ) ( not ( = ?auto_235957 ?auto_235960 ) ) ( not ( = ?auto_235957 ?auto_235961 ) ) ( not ( = ?auto_235958 ?auto_235959 ) ) ( not ( = ?auto_235958 ?auto_235960 ) ) ( not ( = ?auto_235958 ?auto_235961 ) ) ( not ( = ?auto_235959 ?auto_235960 ) ) ( not ( = ?auto_235959 ?auto_235961 ) ) ( not ( = ?auto_235960 ?auto_235961 ) ) ( ON ?auto_235959 ?auto_235960 ) ( ON ?auto_235958 ?auto_235959 ) ( ON ?auto_235957 ?auto_235958 ) ( ON ?auto_235956 ?auto_235957 ) ( ON ?auto_235955 ?auto_235956 ) ( ON ?auto_235954 ?auto_235955 ) ( ON ?auto_235953 ?auto_235954 ) ( ON ?auto_235952 ?auto_235953 ) ( ON ?auto_235951 ?auto_235952 ) ( CLEAR ?auto_235949 ) ( ON ?auto_235950 ?auto_235951 ) ( CLEAR ?auto_235950 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_235949 ?auto_235950 )
      ( MAKE-12PILE ?auto_235949 ?auto_235950 ?auto_235951 ?auto_235952 ?auto_235953 ?auto_235954 ?auto_235955 ?auto_235956 ?auto_235957 ?auto_235958 ?auto_235959 ?auto_235960 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_235974 - BLOCK
      ?auto_235975 - BLOCK
      ?auto_235976 - BLOCK
      ?auto_235977 - BLOCK
      ?auto_235978 - BLOCK
      ?auto_235979 - BLOCK
      ?auto_235980 - BLOCK
      ?auto_235981 - BLOCK
      ?auto_235982 - BLOCK
      ?auto_235983 - BLOCK
      ?auto_235984 - BLOCK
      ?auto_235985 - BLOCK
    )
    :vars
    (
      ?auto_235986 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_235985 ?auto_235986 ) ( not ( = ?auto_235974 ?auto_235975 ) ) ( not ( = ?auto_235974 ?auto_235976 ) ) ( not ( = ?auto_235974 ?auto_235977 ) ) ( not ( = ?auto_235974 ?auto_235978 ) ) ( not ( = ?auto_235974 ?auto_235979 ) ) ( not ( = ?auto_235974 ?auto_235980 ) ) ( not ( = ?auto_235974 ?auto_235981 ) ) ( not ( = ?auto_235974 ?auto_235982 ) ) ( not ( = ?auto_235974 ?auto_235983 ) ) ( not ( = ?auto_235974 ?auto_235984 ) ) ( not ( = ?auto_235974 ?auto_235985 ) ) ( not ( = ?auto_235974 ?auto_235986 ) ) ( not ( = ?auto_235975 ?auto_235976 ) ) ( not ( = ?auto_235975 ?auto_235977 ) ) ( not ( = ?auto_235975 ?auto_235978 ) ) ( not ( = ?auto_235975 ?auto_235979 ) ) ( not ( = ?auto_235975 ?auto_235980 ) ) ( not ( = ?auto_235975 ?auto_235981 ) ) ( not ( = ?auto_235975 ?auto_235982 ) ) ( not ( = ?auto_235975 ?auto_235983 ) ) ( not ( = ?auto_235975 ?auto_235984 ) ) ( not ( = ?auto_235975 ?auto_235985 ) ) ( not ( = ?auto_235975 ?auto_235986 ) ) ( not ( = ?auto_235976 ?auto_235977 ) ) ( not ( = ?auto_235976 ?auto_235978 ) ) ( not ( = ?auto_235976 ?auto_235979 ) ) ( not ( = ?auto_235976 ?auto_235980 ) ) ( not ( = ?auto_235976 ?auto_235981 ) ) ( not ( = ?auto_235976 ?auto_235982 ) ) ( not ( = ?auto_235976 ?auto_235983 ) ) ( not ( = ?auto_235976 ?auto_235984 ) ) ( not ( = ?auto_235976 ?auto_235985 ) ) ( not ( = ?auto_235976 ?auto_235986 ) ) ( not ( = ?auto_235977 ?auto_235978 ) ) ( not ( = ?auto_235977 ?auto_235979 ) ) ( not ( = ?auto_235977 ?auto_235980 ) ) ( not ( = ?auto_235977 ?auto_235981 ) ) ( not ( = ?auto_235977 ?auto_235982 ) ) ( not ( = ?auto_235977 ?auto_235983 ) ) ( not ( = ?auto_235977 ?auto_235984 ) ) ( not ( = ?auto_235977 ?auto_235985 ) ) ( not ( = ?auto_235977 ?auto_235986 ) ) ( not ( = ?auto_235978 ?auto_235979 ) ) ( not ( = ?auto_235978 ?auto_235980 ) ) ( not ( = ?auto_235978 ?auto_235981 ) ) ( not ( = ?auto_235978 ?auto_235982 ) ) ( not ( = ?auto_235978 ?auto_235983 ) ) ( not ( = ?auto_235978 ?auto_235984 ) ) ( not ( = ?auto_235978 ?auto_235985 ) ) ( not ( = ?auto_235978 ?auto_235986 ) ) ( not ( = ?auto_235979 ?auto_235980 ) ) ( not ( = ?auto_235979 ?auto_235981 ) ) ( not ( = ?auto_235979 ?auto_235982 ) ) ( not ( = ?auto_235979 ?auto_235983 ) ) ( not ( = ?auto_235979 ?auto_235984 ) ) ( not ( = ?auto_235979 ?auto_235985 ) ) ( not ( = ?auto_235979 ?auto_235986 ) ) ( not ( = ?auto_235980 ?auto_235981 ) ) ( not ( = ?auto_235980 ?auto_235982 ) ) ( not ( = ?auto_235980 ?auto_235983 ) ) ( not ( = ?auto_235980 ?auto_235984 ) ) ( not ( = ?auto_235980 ?auto_235985 ) ) ( not ( = ?auto_235980 ?auto_235986 ) ) ( not ( = ?auto_235981 ?auto_235982 ) ) ( not ( = ?auto_235981 ?auto_235983 ) ) ( not ( = ?auto_235981 ?auto_235984 ) ) ( not ( = ?auto_235981 ?auto_235985 ) ) ( not ( = ?auto_235981 ?auto_235986 ) ) ( not ( = ?auto_235982 ?auto_235983 ) ) ( not ( = ?auto_235982 ?auto_235984 ) ) ( not ( = ?auto_235982 ?auto_235985 ) ) ( not ( = ?auto_235982 ?auto_235986 ) ) ( not ( = ?auto_235983 ?auto_235984 ) ) ( not ( = ?auto_235983 ?auto_235985 ) ) ( not ( = ?auto_235983 ?auto_235986 ) ) ( not ( = ?auto_235984 ?auto_235985 ) ) ( not ( = ?auto_235984 ?auto_235986 ) ) ( not ( = ?auto_235985 ?auto_235986 ) ) ( ON ?auto_235984 ?auto_235985 ) ( ON ?auto_235983 ?auto_235984 ) ( ON ?auto_235982 ?auto_235983 ) ( ON ?auto_235981 ?auto_235982 ) ( ON ?auto_235980 ?auto_235981 ) ( ON ?auto_235979 ?auto_235980 ) ( ON ?auto_235978 ?auto_235979 ) ( ON ?auto_235977 ?auto_235978 ) ( ON ?auto_235976 ?auto_235977 ) ( ON ?auto_235975 ?auto_235976 ) ( ON ?auto_235974 ?auto_235975 ) ( CLEAR ?auto_235974 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_235974 )
      ( MAKE-12PILE ?auto_235974 ?auto_235975 ?auto_235976 ?auto_235977 ?auto_235978 ?auto_235979 ?auto_235980 ?auto_235981 ?auto_235982 ?auto_235983 ?auto_235984 ?auto_235985 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_235999 - BLOCK
      ?auto_236000 - BLOCK
      ?auto_236001 - BLOCK
      ?auto_236002 - BLOCK
      ?auto_236003 - BLOCK
      ?auto_236004 - BLOCK
      ?auto_236005 - BLOCK
      ?auto_236006 - BLOCK
      ?auto_236007 - BLOCK
      ?auto_236008 - BLOCK
      ?auto_236009 - BLOCK
      ?auto_236010 - BLOCK
    )
    :vars
    (
      ?auto_236011 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_236010 ?auto_236011 ) ( not ( = ?auto_235999 ?auto_236000 ) ) ( not ( = ?auto_235999 ?auto_236001 ) ) ( not ( = ?auto_235999 ?auto_236002 ) ) ( not ( = ?auto_235999 ?auto_236003 ) ) ( not ( = ?auto_235999 ?auto_236004 ) ) ( not ( = ?auto_235999 ?auto_236005 ) ) ( not ( = ?auto_235999 ?auto_236006 ) ) ( not ( = ?auto_235999 ?auto_236007 ) ) ( not ( = ?auto_235999 ?auto_236008 ) ) ( not ( = ?auto_235999 ?auto_236009 ) ) ( not ( = ?auto_235999 ?auto_236010 ) ) ( not ( = ?auto_235999 ?auto_236011 ) ) ( not ( = ?auto_236000 ?auto_236001 ) ) ( not ( = ?auto_236000 ?auto_236002 ) ) ( not ( = ?auto_236000 ?auto_236003 ) ) ( not ( = ?auto_236000 ?auto_236004 ) ) ( not ( = ?auto_236000 ?auto_236005 ) ) ( not ( = ?auto_236000 ?auto_236006 ) ) ( not ( = ?auto_236000 ?auto_236007 ) ) ( not ( = ?auto_236000 ?auto_236008 ) ) ( not ( = ?auto_236000 ?auto_236009 ) ) ( not ( = ?auto_236000 ?auto_236010 ) ) ( not ( = ?auto_236000 ?auto_236011 ) ) ( not ( = ?auto_236001 ?auto_236002 ) ) ( not ( = ?auto_236001 ?auto_236003 ) ) ( not ( = ?auto_236001 ?auto_236004 ) ) ( not ( = ?auto_236001 ?auto_236005 ) ) ( not ( = ?auto_236001 ?auto_236006 ) ) ( not ( = ?auto_236001 ?auto_236007 ) ) ( not ( = ?auto_236001 ?auto_236008 ) ) ( not ( = ?auto_236001 ?auto_236009 ) ) ( not ( = ?auto_236001 ?auto_236010 ) ) ( not ( = ?auto_236001 ?auto_236011 ) ) ( not ( = ?auto_236002 ?auto_236003 ) ) ( not ( = ?auto_236002 ?auto_236004 ) ) ( not ( = ?auto_236002 ?auto_236005 ) ) ( not ( = ?auto_236002 ?auto_236006 ) ) ( not ( = ?auto_236002 ?auto_236007 ) ) ( not ( = ?auto_236002 ?auto_236008 ) ) ( not ( = ?auto_236002 ?auto_236009 ) ) ( not ( = ?auto_236002 ?auto_236010 ) ) ( not ( = ?auto_236002 ?auto_236011 ) ) ( not ( = ?auto_236003 ?auto_236004 ) ) ( not ( = ?auto_236003 ?auto_236005 ) ) ( not ( = ?auto_236003 ?auto_236006 ) ) ( not ( = ?auto_236003 ?auto_236007 ) ) ( not ( = ?auto_236003 ?auto_236008 ) ) ( not ( = ?auto_236003 ?auto_236009 ) ) ( not ( = ?auto_236003 ?auto_236010 ) ) ( not ( = ?auto_236003 ?auto_236011 ) ) ( not ( = ?auto_236004 ?auto_236005 ) ) ( not ( = ?auto_236004 ?auto_236006 ) ) ( not ( = ?auto_236004 ?auto_236007 ) ) ( not ( = ?auto_236004 ?auto_236008 ) ) ( not ( = ?auto_236004 ?auto_236009 ) ) ( not ( = ?auto_236004 ?auto_236010 ) ) ( not ( = ?auto_236004 ?auto_236011 ) ) ( not ( = ?auto_236005 ?auto_236006 ) ) ( not ( = ?auto_236005 ?auto_236007 ) ) ( not ( = ?auto_236005 ?auto_236008 ) ) ( not ( = ?auto_236005 ?auto_236009 ) ) ( not ( = ?auto_236005 ?auto_236010 ) ) ( not ( = ?auto_236005 ?auto_236011 ) ) ( not ( = ?auto_236006 ?auto_236007 ) ) ( not ( = ?auto_236006 ?auto_236008 ) ) ( not ( = ?auto_236006 ?auto_236009 ) ) ( not ( = ?auto_236006 ?auto_236010 ) ) ( not ( = ?auto_236006 ?auto_236011 ) ) ( not ( = ?auto_236007 ?auto_236008 ) ) ( not ( = ?auto_236007 ?auto_236009 ) ) ( not ( = ?auto_236007 ?auto_236010 ) ) ( not ( = ?auto_236007 ?auto_236011 ) ) ( not ( = ?auto_236008 ?auto_236009 ) ) ( not ( = ?auto_236008 ?auto_236010 ) ) ( not ( = ?auto_236008 ?auto_236011 ) ) ( not ( = ?auto_236009 ?auto_236010 ) ) ( not ( = ?auto_236009 ?auto_236011 ) ) ( not ( = ?auto_236010 ?auto_236011 ) ) ( ON ?auto_236009 ?auto_236010 ) ( ON ?auto_236008 ?auto_236009 ) ( ON ?auto_236007 ?auto_236008 ) ( ON ?auto_236006 ?auto_236007 ) ( ON ?auto_236005 ?auto_236006 ) ( ON ?auto_236004 ?auto_236005 ) ( ON ?auto_236003 ?auto_236004 ) ( ON ?auto_236002 ?auto_236003 ) ( ON ?auto_236001 ?auto_236002 ) ( ON ?auto_236000 ?auto_236001 ) ( ON ?auto_235999 ?auto_236000 ) ( CLEAR ?auto_235999 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_235999 )
      ( MAKE-12PILE ?auto_235999 ?auto_236000 ?auto_236001 ?auto_236002 ?auto_236003 ?auto_236004 ?auto_236005 ?auto_236006 ?auto_236007 ?auto_236008 ?auto_236009 ?auto_236010 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_236025 - BLOCK
      ?auto_236026 - BLOCK
      ?auto_236027 - BLOCK
      ?auto_236028 - BLOCK
      ?auto_236029 - BLOCK
      ?auto_236030 - BLOCK
      ?auto_236031 - BLOCK
      ?auto_236032 - BLOCK
      ?auto_236033 - BLOCK
      ?auto_236034 - BLOCK
      ?auto_236035 - BLOCK
      ?auto_236036 - BLOCK
      ?auto_236037 - BLOCK
    )
    :vars
    (
      ?auto_236038 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_236036 ) ( ON ?auto_236037 ?auto_236038 ) ( CLEAR ?auto_236037 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_236025 ) ( ON ?auto_236026 ?auto_236025 ) ( ON ?auto_236027 ?auto_236026 ) ( ON ?auto_236028 ?auto_236027 ) ( ON ?auto_236029 ?auto_236028 ) ( ON ?auto_236030 ?auto_236029 ) ( ON ?auto_236031 ?auto_236030 ) ( ON ?auto_236032 ?auto_236031 ) ( ON ?auto_236033 ?auto_236032 ) ( ON ?auto_236034 ?auto_236033 ) ( ON ?auto_236035 ?auto_236034 ) ( ON ?auto_236036 ?auto_236035 ) ( not ( = ?auto_236025 ?auto_236026 ) ) ( not ( = ?auto_236025 ?auto_236027 ) ) ( not ( = ?auto_236025 ?auto_236028 ) ) ( not ( = ?auto_236025 ?auto_236029 ) ) ( not ( = ?auto_236025 ?auto_236030 ) ) ( not ( = ?auto_236025 ?auto_236031 ) ) ( not ( = ?auto_236025 ?auto_236032 ) ) ( not ( = ?auto_236025 ?auto_236033 ) ) ( not ( = ?auto_236025 ?auto_236034 ) ) ( not ( = ?auto_236025 ?auto_236035 ) ) ( not ( = ?auto_236025 ?auto_236036 ) ) ( not ( = ?auto_236025 ?auto_236037 ) ) ( not ( = ?auto_236025 ?auto_236038 ) ) ( not ( = ?auto_236026 ?auto_236027 ) ) ( not ( = ?auto_236026 ?auto_236028 ) ) ( not ( = ?auto_236026 ?auto_236029 ) ) ( not ( = ?auto_236026 ?auto_236030 ) ) ( not ( = ?auto_236026 ?auto_236031 ) ) ( not ( = ?auto_236026 ?auto_236032 ) ) ( not ( = ?auto_236026 ?auto_236033 ) ) ( not ( = ?auto_236026 ?auto_236034 ) ) ( not ( = ?auto_236026 ?auto_236035 ) ) ( not ( = ?auto_236026 ?auto_236036 ) ) ( not ( = ?auto_236026 ?auto_236037 ) ) ( not ( = ?auto_236026 ?auto_236038 ) ) ( not ( = ?auto_236027 ?auto_236028 ) ) ( not ( = ?auto_236027 ?auto_236029 ) ) ( not ( = ?auto_236027 ?auto_236030 ) ) ( not ( = ?auto_236027 ?auto_236031 ) ) ( not ( = ?auto_236027 ?auto_236032 ) ) ( not ( = ?auto_236027 ?auto_236033 ) ) ( not ( = ?auto_236027 ?auto_236034 ) ) ( not ( = ?auto_236027 ?auto_236035 ) ) ( not ( = ?auto_236027 ?auto_236036 ) ) ( not ( = ?auto_236027 ?auto_236037 ) ) ( not ( = ?auto_236027 ?auto_236038 ) ) ( not ( = ?auto_236028 ?auto_236029 ) ) ( not ( = ?auto_236028 ?auto_236030 ) ) ( not ( = ?auto_236028 ?auto_236031 ) ) ( not ( = ?auto_236028 ?auto_236032 ) ) ( not ( = ?auto_236028 ?auto_236033 ) ) ( not ( = ?auto_236028 ?auto_236034 ) ) ( not ( = ?auto_236028 ?auto_236035 ) ) ( not ( = ?auto_236028 ?auto_236036 ) ) ( not ( = ?auto_236028 ?auto_236037 ) ) ( not ( = ?auto_236028 ?auto_236038 ) ) ( not ( = ?auto_236029 ?auto_236030 ) ) ( not ( = ?auto_236029 ?auto_236031 ) ) ( not ( = ?auto_236029 ?auto_236032 ) ) ( not ( = ?auto_236029 ?auto_236033 ) ) ( not ( = ?auto_236029 ?auto_236034 ) ) ( not ( = ?auto_236029 ?auto_236035 ) ) ( not ( = ?auto_236029 ?auto_236036 ) ) ( not ( = ?auto_236029 ?auto_236037 ) ) ( not ( = ?auto_236029 ?auto_236038 ) ) ( not ( = ?auto_236030 ?auto_236031 ) ) ( not ( = ?auto_236030 ?auto_236032 ) ) ( not ( = ?auto_236030 ?auto_236033 ) ) ( not ( = ?auto_236030 ?auto_236034 ) ) ( not ( = ?auto_236030 ?auto_236035 ) ) ( not ( = ?auto_236030 ?auto_236036 ) ) ( not ( = ?auto_236030 ?auto_236037 ) ) ( not ( = ?auto_236030 ?auto_236038 ) ) ( not ( = ?auto_236031 ?auto_236032 ) ) ( not ( = ?auto_236031 ?auto_236033 ) ) ( not ( = ?auto_236031 ?auto_236034 ) ) ( not ( = ?auto_236031 ?auto_236035 ) ) ( not ( = ?auto_236031 ?auto_236036 ) ) ( not ( = ?auto_236031 ?auto_236037 ) ) ( not ( = ?auto_236031 ?auto_236038 ) ) ( not ( = ?auto_236032 ?auto_236033 ) ) ( not ( = ?auto_236032 ?auto_236034 ) ) ( not ( = ?auto_236032 ?auto_236035 ) ) ( not ( = ?auto_236032 ?auto_236036 ) ) ( not ( = ?auto_236032 ?auto_236037 ) ) ( not ( = ?auto_236032 ?auto_236038 ) ) ( not ( = ?auto_236033 ?auto_236034 ) ) ( not ( = ?auto_236033 ?auto_236035 ) ) ( not ( = ?auto_236033 ?auto_236036 ) ) ( not ( = ?auto_236033 ?auto_236037 ) ) ( not ( = ?auto_236033 ?auto_236038 ) ) ( not ( = ?auto_236034 ?auto_236035 ) ) ( not ( = ?auto_236034 ?auto_236036 ) ) ( not ( = ?auto_236034 ?auto_236037 ) ) ( not ( = ?auto_236034 ?auto_236038 ) ) ( not ( = ?auto_236035 ?auto_236036 ) ) ( not ( = ?auto_236035 ?auto_236037 ) ) ( not ( = ?auto_236035 ?auto_236038 ) ) ( not ( = ?auto_236036 ?auto_236037 ) ) ( not ( = ?auto_236036 ?auto_236038 ) ) ( not ( = ?auto_236037 ?auto_236038 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_236037 ?auto_236038 )
      ( !STACK ?auto_236037 ?auto_236036 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_236052 - BLOCK
      ?auto_236053 - BLOCK
      ?auto_236054 - BLOCK
      ?auto_236055 - BLOCK
      ?auto_236056 - BLOCK
      ?auto_236057 - BLOCK
      ?auto_236058 - BLOCK
      ?auto_236059 - BLOCK
      ?auto_236060 - BLOCK
      ?auto_236061 - BLOCK
      ?auto_236062 - BLOCK
      ?auto_236063 - BLOCK
      ?auto_236064 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_236063 ) ( ON-TABLE ?auto_236064 ) ( CLEAR ?auto_236064 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_236052 ) ( ON ?auto_236053 ?auto_236052 ) ( ON ?auto_236054 ?auto_236053 ) ( ON ?auto_236055 ?auto_236054 ) ( ON ?auto_236056 ?auto_236055 ) ( ON ?auto_236057 ?auto_236056 ) ( ON ?auto_236058 ?auto_236057 ) ( ON ?auto_236059 ?auto_236058 ) ( ON ?auto_236060 ?auto_236059 ) ( ON ?auto_236061 ?auto_236060 ) ( ON ?auto_236062 ?auto_236061 ) ( ON ?auto_236063 ?auto_236062 ) ( not ( = ?auto_236052 ?auto_236053 ) ) ( not ( = ?auto_236052 ?auto_236054 ) ) ( not ( = ?auto_236052 ?auto_236055 ) ) ( not ( = ?auto_236052 ?auto_236056 ) ) ( not ( = ?auto_236052 ?auto_236057 ) ) ( not ( = ?auto_236052 ?auto_236058 ) ) ( not ( = ?auto_236052 ?auto_236059 ) ) ( not ( = ?auto_236052 ?auto_236060 ) ) ( not ( = ?auto_236052 ?auto_236061 ) ) ( not ( = ?auto_236052 ?auto_236062 ) ) ( not ( = ?auto_236052 ?auto_236063 ) ) ( not ( = ?auto_236052 ?auto_236064 ) ) ( not ( = ?auto_236053 ?auto_236054 ) ) ( not ( = ?auto_236053 ?auto_236055 ) ) ( not ( = ?auto_236053 ?auto_236056 ) ) ( not ( = ?auto_236053 ?auto_236057 ) ) ( not ( = ?auto_236053 ?auto_236058 ) ) ( not ( = ?auto_236053 ?auto_236059 ) ) ( not ( = ?auto_236053 ?auto_236060 ) ) ( not ( = ?auto_236053 ?auto_236061 ) ) ( not ( = ?auto_236053 ?auto_236062 ) ) ( not ( = ?auto_236053 ?auto_236063 ) ) ( not ( = ?auto_236053 ?auto_236064 ) ) ( not ( = ?auto_236054 ?auto_236055 ) ) ( not ( = ?auto_236054 ?auto_236056 ) ) ( not ( = ?auto_236054 ?auto_236057 ) ) ( not ( = ?auto_236054 ?auto_236058 ) ) ( not ( = ?auto_236054 ?auto_236059 ) ) ( not ( = ?auto_236054 ?auto_236060 ) ) ( not ( = ?auto_236054 ?auto_236061 ) ) ( not ( = ?auto_236054 ?auto_236062 ) ) ( not ( = ?auto_236054 ?auto_236063 ) ) ( not ( = ?auto_236054 ?auto_236064 ) ) ( not ( = ?auto_236055 ?auto_236056 ) ) ( not ( = ?auto_236055 ?auto_236057 ) ) ( not ( = ?auto_236055 ?auto_236058 ) ) ( not ( = ?auto_236055 ?auto_236059 ) ) ( not ( = ?auto_236055 ?auto_236060 ) ) ( not ( = ?auto_236055 ?auto_236061 ) ) ( not ( = ?auto_236055 ?auto_236062 ) ) ( not ( = ?auto_236055 ?auto_236063 ) ) ( not ( = ?auto_236055 ?auto_236064 ) ) ( not ( = ?auto_236056 ?auto_236057 ) ) ( not ( = ?auto_236056 ?auto_236058 ) ) ( not ( = ?auto_236056 ?auto_236059 ) ) ( not ( = ?auto_236056 ?auto_236060 ) ) ( not ( = ?auto_236056 ?auto_236061 ) ) ( not ( = ?auto_236056 ?auto_236062 ) ) ( not ( = ?auto_236056 ?auto_236063 ) ) ( not ( = ?auto_236056 ?auto_236064 ) ) ( not ( = ?auto_236057 ?auto_236058 ) ) ( not ( = ?auto_236057 ?auto_236059 ) ) ( not ( = ?auto_236057 ?auto_236060 ) ) ( not ( = ?auto_236057 ?auto_236061 ) ) ( not ( = ?auto_236057 ?auto_236062 ) ) ( not ( = ?auto_236057 ?auto_236063 ) ) ( not ( = ?auto_236057 ?auto_236064 ) ) ( not ( = ?auto_236058 ?auto_236059 ) ) ( not ( = ?auto_236058 ?auto_236060 ) ) ( not ( = ?auto_236058 ?auto_236061 ) ) ( not ( = ?auto_236058 ?auto_236062 ) ) ( not ( = ?auto_236058 ?auto_236063 ) ) ( not ( = ?auto_236058 ?auto_236064 ) ) ( not ( = ?auto_236059 ?auto_236060 ) ) ( not ( = ?auto_236059 ?auto_236061 ) ) ( not ( = ?auto_236059 ?auto_236062 ) ) ( not ( = ?auto_236059 ?auto_236063 ) ) ( not ( = ?auto_236059 ?auto_236064 ) ) ( not ( = ?auto_236060 ?auto_236061 ) ) ( not ( = ?auto_236060 ?auto_236062 ) ) ( not ( = ?auto_236060 ?auto_236063 ) ) ( not ( = ?auto_236060 ?auto_236064 ) ) ( not ( = ?auto_236061 ?auto_236062 ) ) ( not ( = ?auto_236061 ?auto_236063 ) ) ( not ( = ?auto_236061 ?auto_236064 ) ) ( not ( = ?auto_236062 ?auto_236063 ) ) ( not ( = ?auto_236062 ?auto_236064 ) ) ( not ( = ?auto_236063 ?auto_236064 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_236064 )
      ( !STACK ?auto_236064 ?auto_236063 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_236078 - BLOCK
      ?auto_236079 - BLOCK
      ?auto_236080 - BLOCK
      ?auto_236081 - BLOCK
      ?auto_236082 - BLOCK
      ?auto_236083 - BLOCK
      ?auto_236084 - BLOCK
      ?auto_236085 - BLOCK
      ?auto_236086 - BLOCK
      ?auto_236087 - BLOCK
      ?auto_236088 - BLOCK
      ?auto_236089 - BLOCK
      ?auto_236090 - BLOCK
    )
    :vars
    (
      ?auto_236091 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_236090 ?auto_236091 ) ( ON-TABLE ?auto_236078 ) ( ON ?auto_236079 ?auto_236078 ) ( ON ?auto_236080 ?auto_236079 ) ( ON ?auto_236081 ?auto_236080 ) ( ON ?auto_236082 ?auto_236081 ) ( ON ?auto_236083 ?auto_236082 ) ( ON ?auto_236084 ?auto_236083 ) ( ON ?auto_236085 ?auto_236084 ) ( ON ?auto_236086 ?auto_236085 ) ( ON ?auto_236087 ?auto_236086 ) ( ON ?auto_236088 ?auto_236087 ) ( not ( = ?auto_236078 ?auto_236079 ) ) ( not ( = ?auto_236078 ?auto_236080 ) ) ( not ( = ?auto_236078 ?auto_236081 ) ) ( not ( = ?auto_236078 ?auto_236082 ) ) ( not ( = ?auto_236078 ?auto_236083 ) ) ( not ( = ?auto_236078 ?auto_236084 ) ) ( not ( = ?auto_236078 ?auto_236085 ) ) ( not ( = ?auto_236078 ?auto_236086 ) ) ( not ( = ?auto_236078 ?auto_236087 ) ) ( not ( = ?auto_236078 ?auto_236088 ) ) ( not ( = ?auto_236078 ?auto_236089 ) ) ( not ( = ?auto_236078 ?auto_236090 ) ) ( not ( = ?auto_236078 ?auto_236091 ) ) ( not ( = ?auto_236079 ?auto_236080 ) ) ( not ( = ?auto_236079 ?auto_236081 ) ) ( not ( = ?auto_236079 ?auto_236082 ) ) ( not ( = ?auto_236079 ?auto_236083 ) ) ( not ( = ?auto_236079 ?auto_236084 ) ) ( not ( = ?auto_236079 ?auto_236085 ) ) ( not ( = ?auto_236079 ?auto_236086 ) ) ( not ( = ?auto_236079 ?auto_236087 ) ) ( not ( = ?auto_236079 ?auto_236088 ) ) ( not ( = ?auto_236079 ?auto_236089 ) ) ( not ( = ?auto_236079 ?auto_236090 ) ) ( not ( = ?auto_236079 ?auto_236091 ) ) ( not ( = ?auto_236080 ?auto_236081 ) ) ( not ( = ?auto_236080 ?auto_236082 ) ) ( not ( = ?auto_236080 ?auto_236083 ) ) ( not ( = ?auto_236080 ?auto_236084 ) ) ( not ( = ?auto_236080 ?auto_236085 ) ) ( not ( = ?auto_236080 ?auto_236086 ) ) ( not ( = ?auto_236080 ?auto_236087 ) ) ( not ( = ?auto_236080 ?auto_236088 ) ) ( not ( = ?auto_236080 ?auto_236089 ) ) ( not ( = ?auto_236080 ?auto_236090 ) ) ( not ( = ?auto_236080 ?auto_236091 ) ) ( not ( = ?auto_236081 ?auto_236082 ) ) ( not ( = ?auto_236081 ?auto_236083 ) ) ( not ( = ?auto_236081 ?auto_236084 ) ) ( not ( = ?auto_236081 ?auto_236085 ) ) ( not ( = ?auto_236081 ?auto_236086 ) ) ( not ( = ?auto_236081 ?auto_236087 ) ) ( not ( = ?auto_236081 ?auto_236088 ) ) ( not ( = ?auto_236081 ?auto_236089 ) ) ( not ( = ?auto_236081 ?auto_236090 ) ) ( not ( = ?auto_236081 ?auto_236091 ) ) ( not ( = ?auto_236082 ?auto_236083 ) ) ( not ( = ?auto_236082 ?auto_236084 ) ) ( not ( = ?auto_236082 ?auto_236085 ) ) ( not ( = ?auto_236082 ?auto_236086 ) ) ( not ( = ?auto_236082 ?auto_236087 ) ) ( not ( = ?auto_236082 ?auto_236088 ) ) ( not ( = ?auto_236082 ?auto_236089 ) ) ( not ( = ?auto_236082 ?auto_236090 ) ) ( not ( = ?auto_236082 ?auto_236091 ) ) ( not ( = ?auto_236083 ?auto_236084 ) ) ( not ( = ?auto_236083 ?auto_236085 ) ) ( not ( = ?auto_236083 ?auto_236086 ) ) ( not ( = ?auto_236083 ?auto_236087 ) ) ( not ( = ?auto_236083 ?auto_236088 ) ) ( not ( = ?auto_236083 ?auto_236089 ) ) ( not ( = ?auto_236083 ?auto_236090 ) ) ( not ( = ?auto_236083 ?auto_236091 ) ) ( not ( = ?auto_236084 ?auto_236085 ) ) ( not ( = ?auto_236084 ?auto_236086 ) ) ( not ( = ?auto_236084 ?auto_236087 ) ) ( not ( = ?auto_236084 ?auto_236088 ) ) ( not ( = ?auto_236084 ?auto_236089 ) ) ( not ( = ?auto_236084 ?auto_236090 ) ) ( not ( = ?auto_236084 ?auto_236091 ) ) ( not ( = ?auto_236085 ?auto_236086 ) ) ( not ( = ?auto_236085 ?auto_236087 ) ) ( not ( = ?auto_236085 ?auto_236088 ) ) ( not ( = ?auto_236085 ?auto_236089 ) ) ( not ( = ?auto_236085 ?auto_236090 ) ) ( not ( = ?auto_236085 ?auto_236091 ) ) ( not ( = ?auto_236086 ?auto_236087 ) ) ( not ( = ?auto_236086 ?auto_236088 ) ) ( not ( = ?auto_236086 ?auto_236089 ) ) ( not ( = ?auto_236086 ?auto_236090 ) ) ( not ( = ?auto_236086 ?auto_236091 ) ) ( not ( = ?auto_236087 ?auto_236088 ) ) ( not ( = ?auto_236087 ?auto_236089 ) ) ( not ( = ?auto_236087 ?auto_236090 ) ) ( not ( = ?auto_236087 ?auto_236091 ) ) ( not ( = ?auto_236088 ?auto_236089 ) ) ( not ( = ?auto_236088 ?auto_236090 ) ) ( not ( = ?auto_236088 ?auto_236091 ) ) ( not ( = ?auto_236089 ?auto_236090 ) ) ( not ( = ?auto_236089 ?auto_236091 ) ) ( not ( = ?auto_236090 ?auto_236091 ) ) ( CLEAR ?auto_236088 ) ( ON ?auto_236089 ?auto_236090 ) ( CLEAR ?auto_236089 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_236078 ?auto_236079 ?auto_236080 ?auto_236081 ?auto_236082 ?auto_236083 ?auto_236084 ?auto_236085 ?auto_236086 ?auto_236087 ?auto_236088 ?auto_236089 )
      ( MAKE-13PILE ?auto_236078 ?auto_236079 ?auto_236080 ?auto_236081 ?auto_236082 ?auto_236083 ?auto_236084 ?auto_236085 ?auto_236086 ?auto_236087 ?auto_236088 ?auto_236089 ?auto_236090 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_236105 - BLOCK
      ?auto_236106 - BLOCK
      ?auto_236107 - BLOCK
      ?auto_236108 - BLOCK
      ?auto_236109 - BLOCK
      ?auto_236110 - BLOCK
      ?auto_236111 - BLOCK
      ?auto_236112 - BLOCK
      ?auto_236113 - BLOCK
      ?auto_236114 - BLOCK
      ?auto_236115 - BLOCK
      ?auto_236116 - BLOCK
      ?auto_236117 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_236117 ) ( ON-TABLE ?auto_236105 ) ( ON ?auto_236106 ?auto_236105 ) ( ON ?auto_236107 ?auto_236106 ) ( ON ?auto_236108 ?auto_236107 ) ( ON ?auto_236109 ?auto_236108 ) ( ON ?auto_236110 ?auto_236109 ) ( ON ?auto_236111 ?auto_236110 ) ( ON ?auto_236112 ?auto_236111 ) ( ON ?auto_236113 ?auto_236112 ) ( ON ?auto_236114 ?auto_236113 ) ( ON ?auto_236115 ?auto_236114 ) ( not ( = ?auto_236105 ?auto_236106 ) ) ( not ( = ?auto_236105 ?auto_236107 ) ) ( not ( = ?auto_236105 ?auto_236108 ) ) ( not ( = ?auto_236105 ?auto_236109 ) ) ( not ( = ?auto_236105 ?auto_236110 ) ) ( not ( = ?auto_236105 ?auto_236111 ) ) ( not ( = ?auto_236105 ?auto_236112 ) ) ( not ( = ?auto_236105 ?auto_236113 ) ) ( not ( = ?auto_236105 ?auto_236114 ) ) ( not ( = ?auto_236105 ?auto_236115 ) ) ( not ( = ?auto_236105 ?auto_236116 ) ) ( not ( = ?auto_236105 ?auto_236117 ) ) ( not ( = ?auto_236106 ?auto_236107 ) ) ( not ( = ?auto_236106 ?auto_236108 ) ) ( not ( = ?auto_236106 ?auto_236109 ) ) ( not ( = ?auto_236106 ?auto_236110 ) ) ( not ( = ?auto_236106 ?auto_236111 ) ) ( not ( = ?auto_236106 ?auto_236112 ) ) ( not ( = ?auto_236106 ?auto_236113 ) ) ( not ( = ?auto_236106 ?auto_236114 ) ) ( not ( = ?auto_236106 ?auto_236115 ) ) ( not ( = ?auto_236106 ?auto_236116 ) ) ( not ( = ?auto_236106 ?auto_236117 ) ) ( not ( = ?auto_236107 ?auto_236108 ) ) ( not ( = ?auto_236107 ?auto_236109 ) ) ( not ( = ?auto_236107 ?auto_236110 ) ) ( not ( = ?auto_236107 ?auto_236111 ) ) ( not ( = ?auto_236107 ?auto_236112 ) ) ( not ( = ?auto_236107 ?auto_236113 ) ) ( not ( = ?auto_236107 ?auto_236114 ) ) ( not ( = ?auto_236107 ?auto_236115 ) ) ( not ( = ?auto_236107 ?auto_236116 ) ) ( not ( = ?auto_236107 ?auto_236117 ) ) ( not ( = ?auto_236108 ?auto_236109 ) ) ( not ( = ?auto_236108 ?auto_236110 ) ) ( not ( = ?auto_236108 ?auto_236111 ) ) ( not ( = ?auto_236108 ?auto_236112 ) ) ( not ( = ?auto_236108 ?auto_236113 ) ) ( not ( = ?auto_236108 ?auto_236114 ) ) ( not ( = ?auto_236108 ?auto_236115 ) ) ( not ( = ?auto_236108 ?auto_236116 ) ) ( not ( = ?auto_236108 ?auto_236117 ) ) ( not ( = ?auto_236109 ?auto_236110 ) ) ( not ( = ?auto_236109 ?auto_236111 ) ) ( not ( = ?auto_236109 ?auto_236112 ) ) ( not ( = ?auto_236109 ?auto_236113 ) ) ( not ( = ?auto_236109 ?auto_236114 ) ) ( not ( = ?auto_236109 ?auto_236115 ) ) ( not ( = ?auto_236109 ?auto_236116 ) ) ( not ( = ?auto_236109 ?auto_236117 ) ) ( not ( = ?auto_236110 ?auto_236111 ) ) ( not ( = ?auto_236110 ?auto_236112 ) ) ( not ( = ?auto_236110 ?auto_236113 ) ) ( not ( = ?auto_236110 ?auto_236114 ) ) ( not ( = ?auto_236110 ?auto_236115 ) ) ( not ( = ?auto_236110 ?auto_236116 ) ) ( not ( = ?auto_236110 ?auto_236117 ) ) ( not ( = ?auto_236111 ?auto_236112 ) ) ( not ( = ?auto_236111 ?auto_236113 ) ) ( not ( = ?auto_236111 ?auto_236114 ) ) ( not ( = ?auto_236111 ?auto_236115 ) ) ( not ( = ?auto_236111 ?auto_236116 ) ) ( not ( = ?auto_236111 ?auto_236117 ) ) ( not ( = ?auto_236112 ?auto_236113 ) ) ( not ( = ?auto_236112 ?auto_236114 ) ) ( not ( = ?auto_236112 ?auto_236115 ) ) ( not ( = ?auto_236112 ?auto_236116 ) ) ( not ( = ?auto_236112 ?auto_236117 ) ) ( not ( = ?auto_236113 ?auto_236114 ) ) ( not ( = ?auto_236113 ?auto_236115 ) ) ( not ( = ?auto_236113 ?auto_236116 ) ) ( not ( = ?auto_236113 ?auto_236117 ) ) ( not ( = ?auto_236114 ?auto_236115 ) ) ( not ( = ?auto_236114 ?auto_236116 ) ) ( not ( = ?auto_236114 ?auto_236117 ) ) ( not ( = ?auto_236115 ?auto_236116 ) ) ( not ( = ?auto_236115 ?auto_236117 ) ) ( not ( = ?auto_236116 ?auto_236117 ) ) ( CLEAR ?auto_236115 ) ( ON ?auto_236116 ?auto_236117 ) ( CLEAR ?auto_236116 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_236105 ?auto_236106 ?auto_236107 ?auto_236108 ?auto_236109 ?auto_236110 ?auto_236111 ?auto_236112 ?auto_236113 ?auto_236114 ?auto_236115 ?auto_236116 )
      ( MAKE-13PILE ?auto_236105 ?auto_236106 ?auto_236107 ?auto_236108 ?auto_236109 ?auto_236110 ?auto_236111 ?auto_236112 ?auto_236113 ?auto_236114 ?auto_236115 ?auto_236116 ?auto_236117 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_236131 - BLOCK
      ?auto_236132 - BLOCK
      ?auto_236133 - BLOCK
      ?auto_236134 - BLOCK
      ?auto_236135 - BLOCK
      ?auto_236136 - BLOCK
      ?auto_236137 - BLOCK
      ?auto_236138 - BLOCK
      ?auto_236139 - BLOCK
      ?auto_236140 - BLOCK
      ?auto_236141 - BLOCK
      ?auto_236142 - BLOCK
      ?auto_236143 - BLOCK
    )
    :vars
    (
      ?auto_236144 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_236143 ?auto_236144 ) ( ON-TABLE ?auto_236131 ) ( ON ?auto_236132 ?auto_236131 ) ( ON ?auto_236133 ?auto_236132 ) ( ON ?auto_236134 ?auto_236133 ) ( ON ?auto_236135 ?auto_236134 ) ( ON ?auto_236136 ?auto_236135 ) ( ON ?auto_236137 ?auto_236136 ) ( ON ?auto_236138 ?auto_236137 ) ( ON ?auto_236139 ?auto_236138 ) ( ON ?auto_236140 ?auto_236139 ) ( not ( = ?auto_236131 ?auto_236132 ) ) ( not ( = ?auto_236131 ?auto_236133 ) ) ( not ( = ?auto_236131 ?auto_236134 ) ) ( not ( = ?auto_236131 ?auto_236135 ) ) ( not ( = ?auto_236131 ?auto_236136 ) ) ( not ( = ?auto_236131 ?auto_236137 ) ) ( not ( = ?auto_236131 ?auto_236138 ) ) ( not ( = ?auto_236131 ?auto_236139 ) ) ( not ( = ?auto_236131 ?auto_236140 ) ) ( not ( = ?auto_236131 ?auto_236141 ) ) ( not ( = ?auto_236131 ?auto_236142 ) ) ( not ( = ?auto_236131 ?auto_236143 ) ) ( not ( = ?auto_236131 ?auto_236144 ) ) ( not ( = ?auto_236132 ?auto_236133 ) ) ( not ( = ?auto_236132 ?auto_236134 ) ) ( not ( = ?auto_236132 ?auto_236135 ) ) ( not ( = ?auto_236132 ?auto_236136 ) ) ( not ( = ?auto_236132 ?auto_236137 ) ) ( not ( = ?auto_236132 ?auto_236138 ) ) ( not ( = ?auto_236132 ?auto_236139 ) ) ( not ( = ?auto_236132 ?auto_236140 ) ) ( not ( = ?auto_236132 ?auto_236141 ) ) ( not ( = ?auto_236132 ?auto_236142 ) ) ( not ( = ?auto_236132 ?auto_236143 ) ) ( not ( = ?auto_236132 ?auto_236144 ) ) ( not ( = ?auto_236133 ?auto_236134 ) ) ( not ( = ?auto_236133 ?auto_236135 ) ) ( not ( = ?auto_236133 ?auto_236136 ) ) ( not ( = ?auto_236133 ?auto_236137 ) ) ( not ( = ?auto_236133 ?auto_236138 ) ) ( not ( = ?auto_236133 ?auto_236139 ) ) ( not ( = ?auto_236133 ?auto_236140 ) ) ( not ( = ?auto_236133 ?auto_236141 ) ) ( not ( = ?auto_236133 ?auto_236142 ) ) ( not ( = ?auto_236133 ?auto_236143 ) ) ( not ( = ?auto_236133 ?auto_236144 ) ) ( not ( = ?auto_236134 ?auto_236135 ) ) ( not ( = ?auto_236134 ?auto_236136 ) ) ( not ( = ?auto_236134 ?auto_236137 ) ) ( not ( = ?auto_236134 ?auto_236138 ) ) ( not ( = ?auto_236134 ?auto_236139 ) ) ( not ( = ?auto_236134 ?auto_236140 ) ) ( not ( = ?auto_236134 ?auto_236141 ) ) ( not ( = ?auto_236134 ?auto_236142 ) ) ( not ( = ?auto_236134 ?auto_236143 ) ) ( not ( = ?auto_236134 ?auto_236144 ) ) ( not ( = ?auto_236135 ?auto_236136 ) ) ( not ( = ?auto_236135 ?auto_236137 ) ) ( not ( = ?auto_236135 ?auto_236138 ) ) ( not ( = ?auto_236135 ?auto_236139 ) ) ( not ( = ?auto_236135 ?auto_236140 ) ) ( not ( = ?auto_236135 ?auto_236141 ) ) ( not ( = ?auto_236135 ?auto_236142 ) ) ( not ( = ?auto_236135 ?auto_236143 ) ) ( not ( = ?auto_236135 ?auto_236144 ) ) ( not ( = ?auto_236136 ?auto_236137 ) ) ( not ( = ?auto_236136 ?auto_236138 ) ) ( not ( = ?auto_236136 ?auto_236139 ) ) ( not ( = ?auto_236136 ?auto_236140 ) ) ( not ( = ?auto_236136 ?auto_236141 ) ) ( not ( = ?auto_236136 ?auto_236142 ) ) ( not ( = ?auto_236136 ?auto_236143 ) ) ( not ( = ?auto_236136 ?auto_236144 ) ) ( not ( = ?auto_236137 ?auto_236138 ) ) ( not ( = ?auto_236137 ?auto_236139 ) ) ( not ( = ?auto_236137 ?auto_236140 ) ) ( not ( = ?auto_236137 ?auto_236141 ) ) ( not ( = ?auto_236137 ?auto_236142 ) ) ( not ( = ?auto_236137 ?auto_236143 ) ) ( not ( = ?auto_236137 ?auto_236144 ) ) ( not ( = ?auto_236138 ?auto_236139 ) ) ( not ( = ?auto_236138 ?auto_236140 ) ) ( not ( = ?auto_236138 ?auto_236141 ) ) ( not ( = ?auto_236138 ?auto_236142 ) ) ( not ( = ?auto_236138 ?auto_236143 ) ) ( not ( = ?auto_236138 ?auto_236144 ) ) ( not ( = ?auto_236139 ?auto_236140 ) ) ( not ( = ?auto_236139 ?auto_236141 ) ) ( not ( = ?auto_236139 ?auto_236142 ) ) ( not ( = ?auto_236139 ?auto_236143 ) ) ( not ( = ?auto_236139 ?auto_236144 ) ) ( not ( = ?auto_236140 ?auto_236141 ) ) ( not ( = ?auto_236140 ?auto_236142 ) ) ( not ( = ?auto_236140 ?auto_236143 ) ) ( not ( = ?auto_236140 ?auto_236144 ) ) ( not ( = ?auto_236141 ?auto_236142 ) ) ( not ( = ?auto_236141 ?auto_236143 ) ) ( not ( = ?auto_236141 ?auto_236144 ) ) ( not ( = ?auto_236142 ?auto_236143 ) ) ( not ( = ?auto_236142 ?auto_236144 ) ) ( not ( = ?auto_236143 ?auto_236144 ) ) ( ON ?auto_236142 ?auto_236143 ) ( CLEAR ?auto_236140 ) ( ON ?auto_236141 ?auto_236142 ) ( CLEAR ?auto_236141 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_236131 ?auto_236132 ?auto_236133 ?auto_236134 ?auto_236135 ?auto_236136 ?auto_236137 ?auto_236138 ?auto_236139 ?auto_236140 ?auto_236141 )
      ( MAKE-13PILE ?auto_236131 ?auto_236132 ?auto_236133 ?auto_236134 ?auto_236135 ?auto_236136 ?auto_236137 ?auto_236138 ?auto_236139 ?auto_236140 ?auto_236141 ?auto_236142 ?auto_236143 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_236158 - BLOCK
      ?auto_236159 - BLOCK
      ?auto_236160 - BLOCK
      ?auto_236161 - BLOCK
      ?auto_236162 - BLOCK
      ?auto_236163 - BLOCK
      ?auto_236164 - BLOCK
      ?auto_236165 - BLOCK
      ?auto_236166 - BLOCK
      ?auto_236167 - BLOCK
      ?auto_236168 - BLOCK
      ?auto_236169 - BLOCK
      ?auto_236170 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_236170 ) ( ON-TABLE ?auto_236158 ) ( ON ?auto_236159 ?auto_236158 ) ( ON ?auto_236160 ?auto_236159 ) ( ON ?auto_236161 ?auto_236160 ) ( ON ?auto_236162 ?auto_236161 ) ( ON ?auto_236163 ?auto_236162 ) ( ON ?auto_236164 ?auto_236163 ) ( ON ?auto_236165 ?auto_236164 ) ( ON ?auto_236166 ?auto_236165 ) ( ON ?auto_236167 ?auto_236166 ) ( not ( = ?auto_236158 ?auto_236159 ) ) ( not ( = ?auto_236158 ?auto_236160 ) ) ( not ( = ?auto_236158 ?auto_236161 ) ) ( not ( = ?auto_236158 ?auto_236162 ) ) ( not ( = ?auto_236158 ?auto_236163 ) ) ( not ( = ?auto_236158 ?auto_236164 ) ) ( not ( = ?auto_236158 ?auto_236165 ) ) ( not ( = ?auto_236158 ?auto_236166 ) ) ( not ( = ?auto_236158 ?auto_236167 ) ) ( not ( = ?auto_236158 ?auto_236168 ) ) ( not ( = ?auto_236158 ?auto_236169 ) ) ( not ( = ?auto_236158 ?auto_236170 ) ) ( not ( = ?auto_236159 ?auto_236160 ) ) ( not ( = ?auto_236159 ?auto_236161 ) ) ( not ( = ?auto_236159 ?auto_236162 ) ) ( not ( = ?auto_236159 ?auto_236163 ) ) ( not ( = ?auto_236159 ?auto_236164 ) ) ( not ( = ?auto_236159 ?auto_236165 ) ) ( not ( = ?auto_236159 ?auto_236166 ) ) ( not ( = ?auto_236159 ?auto_236167 ) ) ( not ( = ?auto_236159 ?auto_236168 ) ) ( not ( = ?auto_236159 ?auto_236169 ) ) ( not ( = ?auto_236159 ?auto_236170 ) ) ( not ( = ?auto_236160 ?auto_236161 ) ) ( not ( = ?auto_236160 ?auto_236162 ) ) ( not ( = ?auto_236160 ?auto_236163 ) ) ( not ( = ?auto_236160 ?auto_236164 ) ) ( not ( = ?auto_236160 ?auto_236165 ) ) ( not ( = ?auto_236160 ?auto_236166 ) ) ( not ( = ?auto_236160 ?auto_236167 ) ) ( not ( = ?auto_236160 ?auto_236168 ) ) ( not ( = ?auto_236160 ?auto_236169 ) ) ( not ( = ?auto_236160 ?auto_236170 ) ) ( not ( = ?auto_236161 ?auto_236162 ) ) ( not ( = ?auto_236161 ?auto_236163 ) ) ( not ( = ?auto_236161 ?auto_236164 ) ) ( not ( = ?auto_236161 ?auto_236165 ) ) ( not ( = ?auto_236161 ?auto_236166 ) ) ( not ( = ?auto_236161 ?auto_236167 ) ) ( not ( = ?auto_236161 ?auto_236168 ) ) ( not ( = ?auto_236161 ?auto_236169 ) ) ( not ( = ?auto_236161 ?auto_236170 ) ) ( not ( = ?auto_236162 ?auto_236163 ) ) ( not ( = ?auto_236162 ?auto_236164 ) ) ( not ( = ?auto_236162 ?auto_236165 ) ) ( not ( = ?auto_236162 ?auto_236166 ) ) ( not ( = ?auto_236162 ?auto_236167 ) ) ( not ( = ?auto_236162 ?auto_236168 ) ) ( not ( = ?auto_236162 ?auto_236169 ) ) ( not ( = ?auto_236162 ?auto_236170 ) ) ( not ( = ?auto_236163 ?auto_236164 ) ) ( not ( = ?auto_236163 ?auto_236165 ) ) ( not ( = ?auto_236163 ?auto_236166 ) ) ( not ( = ?auto_236163 ?auto_236167 ) ) ( not ( = ?auto_236163 ?auto_236168 ) ) ( not ( = ?auto_236163 ?auto_236169 ) ) ( not ( = ?auto_236163 ?auto_236170 ) ) ( not ( = ?auto_236164 ?auto_236165 ) ) ( not ( = ?auto_236164 ?auto_236166 ) ) ( not ( = ?auto_236164 ?auto_236167 ) ) ( not ( = ?auto_236164 ?auto_236168 ) ) ( not ( = ?auto_236164 ?auto_236169 ) ) ( not ( = ?auto_236164 ?auto_236170 ) ) ( not ( = ?auto_236165 ?auto_236166 ) ) ( not ( = ?auto_236165 ?auto_236167 ) ) ( not ( = ?auto_236165 ?auto_236168 ) ) ( not ( = ?auto_236165 ?auto_236169 ) ) ( not ( = ?auto_236165 ?auto_236170 ) ) ( not ( = ?auto_236166 ?auto_236167 ) ) ( not ( = ?auto_236166 ?auto_236168 ) ) ( not ( = ?auto_236166 ?auto_236169 ) ) ( not ( = ?auto_236166 ?auto_236170 ) ) ( not ( = ?auto_236167 ?auto_236168 ) ) ( not ( = ?auto_236167 ?auto_236169 ) ) ( not ( = ?auto_236167 ?auto_236170 ) ) ( not ( = ?auto_236168 ?auto_236169 ) ) ( not ( = ?auto_236168 ?auto_236170 ) ) ( not ( = ?auto_236169 ?auto_236170 ) ) ( ON ?auto_236169 ?auto_236170 ) ( CLEAR ?auto_236167 ) ( ON ?auto_236168 ?auto_236169 ) ( CLEAR ?auto_236168 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_236158 ?auto_236159 ?auto_236160 ?auto_236161 ?auto_236162 ?auto_236163 ?auto_236164 ?auto_236165 ?auto_236166 ?auto_236167 ?auto_236168 )
      ( MAKE-13PILE ?auto_236158 ?auto_236159 ?auto_236160 ?auto_236161 ?auto_236162 ?auto_236163 ?auto_236164 ?auto_236165 ?auto_236166 ?auto_236167 ?auto_236168 ?auto_236169 ?auto_236170 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_236184 - BLOCK
      ?auto_236185 - BLOCK
      ?auto_236186 - BLOCK
      ?auto_236187 - BLOCK
      ?auto_236188 - BLOCK
      ?auto_236189 - BLOCK
      ?auto_236190 - BLOCK
      ?auto_236191 - BLOCK
      ?auto_236192 - BLOCK
      ?auto_236193 - BLOCK
      ?auto_236194 - BLOCK
      ?auto_236195 - BLOCK
      ?auto_236196 - BLOCK
    )
    :vars
    (
      ?auto_236197 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_236196 ?auto_236197 ) ( ON-TABLE ?auto_236184 ) ( ON ?auto_236185 ?auto_236184 ) ( ON ?auto_236186 ?auto_236185 ) ( ON ?auto_236187 ?auto_236186 ) ( ON ?auto_236188 ?auto_236187 ) ( ON ?auto_236189 ?auto_236188 ) ( ON ?auto_236190 ?auto_236189 ) ( ON ?auto_236191 ?auto_236190 ) ( ON ?auto_236192 ?auto_236191 ) ( not ( = ?auto_236184 ?auto_236185 ) ) ( not ( = ?auto_236184 ?auto_236186 ) ) ( not ( = ?auto_236184 ?auto_236187 ) ) ( not ( = ?auto_236184 ?auto_236188 ) ) ( not ( = ?auto_236184 ?auto_236189 ) ) ( not ( = ?auto_236184 ?auto_236190 ) ) ( not ( = ?auto_236184 ?auto_236191 ) ) ( not ( = ?auto_236184 ?auto_236192 ) ) ( not ( = ?auto_236184 ?auto_236193 ) ) ( not ( = ?auto_236184 ?auto_236194 ) ) ( not ( = ?auto_236184 ?auto_236195 ) ) ( not ( = ?auto_236184 ?auto_236196 ) ) ( not ( = ?auto_236184 ?auto_236197 ) ) ( not ( = ?auto_236185 ?auto_236186 ) ) ( not ( = ?auto_236185 ?auto_236187 ) ) ( not ( = ?auto_236185 ?auto_236188 ) ) ( not ( = ?auto_236185 ?auto_236189 ) ) ( not ( = ?auto_236185 ?auto_236190 ) ) ( not ( = ?auto_236185 ?auto_236191 ) ) ( not ( = ?auto_236185 ?auto_236192 ) ) ( not ( = ?auto_236185 ?auto_236193 ) ) ( not ( = ?auto_236185 ?auto_236194 ) ) ( not ( = ?auto_236185 ?auto_236195 ) ) ( not ( = ?auto_236185 ?auto_236196 ) ) ( not ( = ?auto_236185 ?auto_236197 ) ) ( not ( = ?auto_236186 ?auto_236187 ) ) ( not ( = ?auto_236186 ?auto_236188 ) ) ( not ( = ?auto_236186 ?auto_236189 ) ) ( not ( = ?auto_236186 ?auto_236190 ) ) ( not ( = ?auto_236186 ?auto_236191 ) ) ( not ( = ?auto_236186 ?auto_236192 ) ) ( not ( = ?auto_236186 ?auto_236193 ) ) ( not ( = ?auto_236186 ?auto_236194 ) ) ( not ( = ?auto_236186 ?auto_236195 ) ) ( not ( = ?auto_236186 ?auto_236196 ) ) ( not ( = ?auto_236186 ?auto_236197 ) ) ( not ( = ?auto_236187 ?auto_236188 ) ) ( not ( = ?auto_236187 ?auto_236189 ) ) ( not ( = ?auto_236187 ?auto_236190 ) ) ( not ( = ?auto_236187 ?auto_236191 ) ) ( not ( = ?auto_236187 ?auto_236192 ) ) ( not ( = ?auto_236187 ?auto_236193 ) ) ( not ( = ?auto_236187 ?auto_236194 ) ) ( not ( = ?auto_236187 ?auto_236195 ) ) ( not ( = ?auto_236187 ?auto_236196 ) ) ( not ( = ?auto_236187 ?auto_236197 ) ) ( not ( = ?auto_236188 ?auto_236189 ) ) ( not ( = ?auto_236188 ?auto_236190 ) ) ( not ( = ?auto_236188 ?auto_236191 ) ) ( not ( = ?auto_236188 ?auto_236192 ) ) ( not ( = ?auto_236188 ?auto_236193 ) ) ( not ( = ?auto_236188 ?auto_236194 ) ) ( not ( = ?auto_236188 ?auto_236195 ) ) ( not ( = ?auto_236188 ?auto_236196 ) ) ( not ( = ?auto_236188 ?auto_236197 ) ) ( not ( = ?auto_236189 ?auto_236190 ) ) ( not ( = ?auto_236189 ?auto_236191 ) ) ( not ( = ?auto_236189 ?auto_236192 ) ) ( not ( = ?auto_236189 ?auto_236193 ) ) ( not ( = ?auto_236189 ?auto_236194 ) ) ( not ( = ?auto_236189 ?auto_236195 ) ) ( not ( = ?auto_236189 ?auto_236196 ) ) ( not ( = ?auto_236189 ?auto_236197 ) ) ( not ( = ?auto_236190 ?auto_236191 ) ) ( not ( = ?auto_236190 ?auto_236192 ) ) ( not ( = ?auto_236190 ?auto_236193 ) ) ( not ( = ?auto_236190 ?auto_236194 ) ) ( not ( = ?auto_236190 ?auto_236195 ) ) ( not ( = ?auto_236190 ?auto_236196 ) ) ( not ( = ?auto_236190 ?auto_236197 ) ) ( not ( = ?auto_236191 ?auto_236192 ) ) ( not ( = ?auto_236191 ?auto_236193 ) ) ( not ( = ?auto_236191 ?auto_236194 ) ) ( not ( = ?auto_236191 ?auto_236195 ) ) ( not ( = ?auto_236191 ?auto_236196 ) ) ( not ( = ?auto_236191 ?auto_236197 ) ) ( not ( = ?auto_236192 ?auto_236193 ) ) ( not ( = ?auto_236192 ?auto_236194 ) ) ( not ( = ?auto_236192 ?auto_236195 ) ) ( not ( = ?auto_236192 ?auto_236196 ) ) ( not ( = ?auto_236192 ?auto_236197 ) ) ( not ( = ?auto_236193 ?auto_236194 ) ) ( not ( = ?auto_236193 ?auto_236195 ) ) ( not ( = ?auto_236193 ?auto_236196 ) ) ( not ( = ?auto_236193 ?auto_236197 ) ) ( not ( = ?auto_236194 ?auto_236195 ) ) ( not ( = ?auto_236194 ?auto_236196 ) ) ( not ( = ?auto_236194 ?auto_236197 ) ) ( not ( = ?auto_236195 ?auto_236196 ) ) ( not ( = ?auto_236195 ?auto_236197 ) ) ( not ( = ?auto_236196 ?auto_236197 ) ) ( ON ?auto_236195 ?auto_236196 ) ( ON ?auto_236194 ?auto_236195 ) ( CLEAR ?auto_236192 ) ( ON ?auto_236193 ?auto_236194 ) ( CLEAR ?auto_236193 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_236184 ?auto_236185 ?auto_236186 ?auto_236187 ?auto_236188 ?auto_236189 ?auto_236190 ?auto_236191 ?auto_236192 ?auto_236193 )
      ( MAKE-13PILE ?auto_236184 ?auto_236185 ?auto_236186 ?auto_236187 ?auto_236188 ?auto_236189 ?auto_236190 ?auto_236191 ?auto_236192 ?auto_236193 ?auto_236194 ?auto_236195 ?auto_236196 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_236211 - BLOCK
      ?auto_236212 - BLOCK
      ?auto_236213 - BLOCK
      ?auto_236214 - BLOCK
      ?auto_236215 - BLOCK
      ?auto_236216 - BLOCK
      ?auto_236217 - BLOCK
      ?auto_236218 - BLOCK
      ?auto_236219 - BLOCK
      ?auto_236220 - BLOCK
      ?auto_236221 - BLOCK
      ?auto_236222 - BLOCK
      ?auto_236223 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_236223 ) ( ON-TABLE ?auto_236211 ) ( ON ?auto_236212 ?auto_236211 ) ( ON ?auto_236213 ?auto_236212 ) ( ON ?auto_236214 ?auto_236213 ) ( ON ?auto_236215 ?auto_236214 ) ( ON ?auto_236216 ?auto_236215 ) ( ON ?auto_236217 ?auto_236216 ) ( ON ?auto_236218 ?auto_236217 ) ( ON ?auto_236219 ?auto_236218 ) ( not ( = ?auto_236211 ?auto_236212 ) ) ( not ( = ?auto_236211 ?auto_236213 ) ) ( not ( = ?auto_236211 ?auto_236214 ) ) ( not ( = ?auto_236211 ?auto_236215 ) ) ( not ( = ?auto_236211 ?auto_236216 ) ) ( not ( = ?auto_236211 ?auto_236217 ) ) ( not ( = ?auto_236211 ?auto_236218 ) ) ( not ( = ?auto_236211 ?auto_236219 ) ) ( not ( = ?auto_236211 ?auto_236220 ) ) ( not ( = ?auto_236211 ?auto_236221 ) ) ( not ( = ?auto_236211 ?auto_236222 ) ) ( not ( = ?auto_236211 ?auto_236223 ) ) ( not ( = ?auto_236212 ?auto_236213 ) ) ( not ( = ?auto_236212 ?auto_236214 ) ) ( not ( = ?auto_236212 ?auto_236215 ) ) ( not ( = ?auto_236212 ?auto_236216 ) ) ( not ( = ?auto_236212 ?auto_236217 ) ) ( not ( = ?auto_236212 ?auto_236218 ) ) ( not ( = ?auto_236212 ?auto_236219 ) ) ( not ( = ?auto_236212 ?auto_236220 ) ) ( not ( = ?auto_236212 ?auto_236221 ) ) ( not ( = ?auto_236212 ?auto_236222 ) ) ( not ( = ?auto_236212 ?auto_236223 ) ) ( not ( = ?auto_236213 ?auto_236214 ) ) ( not ( = ?auto_236213 ?auto_236215 ) ) ( not ( = ?auto_236213 ?auto_236216 ) ) ( not ( = ?auto_236213 ?auto_236217 ) ) ( not ( = ?auto_236213 ?auto_236218 ) ) ( not ( = ?auto_236213 ?auto_236219 ) ) ( not ( = ?auto_236213 ?auto_236220 ) ) ( not ( = ?auto_236213 ?auto_236221 ) ) ( not ( = ?auto_236213 ?auto_236222 ) ) ( not ( = ?auto_236213 ?auto_236223 ) ) ( not ( = ?auto_236214 ?auto_236215 ) ) ( not ( = ?auto_236214 ?auto_236216 ) ) ( not ( = ?auto_236214 ?auto_236217 ) ) ( not ( = ?auto_236214 ?auto_236218 ) ) ( not ( = ?auto_236214 ?auto_236219 ) ) ( not ( = ?auto_236214 ?auto_236220 ) ) ( not ( = ?auto_236214 ?auto_236221 ) ) ( not ( = ?auto_236214 ?auto_236222 ) ) ( not ( = ?auto_236214 ?auto_236223 ) ) ( not ( = ?auto_236215 ?auto_236216 ) ) ( not ( = ?auto_236215 ?auto_236217 ) ) ( not ( = ?auto_236215 ?auto_236218 ) ) ( not ( = ?auto_236215 ?auto_236219 ) ) ( not ( = ?auto_236215 ?auto_236220 ) ) ( not ( = ?auto_236215 ?auto_236221 ) ) ( not ( = ?auto_236215 ?auto_236222 ) ) ( not ( = ?auto_236215 ?auto_236223 ) ) ( not ( = ?auto_236216 ?auto_236217 ) ) ( not ( = ?auto_236216 ?auto_236218 ) ) ( not ( = ?auto_236216 ?auto_236219 ) ) ( not ( = ?auto_236216 ?auto_236220 ) ) ( not ( = ?auto_236216 ?auto_236221 ) ) ( not ( = ?auto_236216 ?auto_236222 ) ) ( not ( = ?auto_236216 ?auto_236223 ) ) ( not ( = ?auto_236217 ?auto_236218 ) ) ( not ( = ?auto_236217 ?auto_236219 ) ) ( not ( = ?auto_236217 ?auto_236220 ) ) ( not ( = ?auto_236217 ?auto_236221 ) ) ( not ( = ?auto_236217 ?auto_236222 ) ) ( not ( = ?auto_236217 ?auto_236223 ) ) ( not ( = ?auto_236218 ?auto_236219 ) ) ( not ( = ?auto_236218 ?auto_236220 ) ) ( not ( = ?auto_236218 ?auto_236221 ) ) ( not ( = ?auto_236218 ?auto_236222 ) ) ( not ( = ?auto_236218 ?auto_236223 ) ) ( not ( = ?auto_236219 ?auto_236220 ) ) ( not ( = ?auto_236219 ?auto_236221 ) ) ( not ( = ?auto_236219 ?auto_236222 ) ) ( not ( = ?auto_236219 ?auto_236223 ) ) ( not ( = ?auto_236220 ?auto_236221 ) ) ( not ( = ?auto_236220 ?auto_236222 ) ) ( not ( = ?auto_236220 ?auto_236223 ) ) ( not ( = ?auto_236221 ?auto_236222 ) ) ( not ( = ?auto_236221 ?auto_236223 ) ) ( not ( = ?auto_236222 ?auto_236223 ) ) ( ON ?auto_236222 ?auto_236223 ) ( ON ?auto_236221 ?auto_236222 ) ( CLEAR ?auto_236219 ) ( ON ?auto_236220 ?auto_236221 ) ( CLEAR ?auto_236220 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_236211 ?auto_236212 ?auto_236213 ?auto_236214 ?auto_236215 ?auto_236216 ?auto_236217 ?auto_236218 ?auto_236219 ?auto_236220 )
      ( MAKE-13PILE ?auto_236211 ?auto_236212 ?auto_236213 ?auto_236214 ?auto_236215 ?auto_236216 ?auto_236217 ?auto_236218 ?auto_236219 ?auto_236220 ?auto_236221 ?auto_236222 ?auto_236223 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_236237 - BLOCK
      ?auto_236238 - BLOCK
      ?auto_236239 - BLOCK
      ?auto_236240 - BLOCK
      ?auto_236241 - BLOCK
      ?auto_236242 - BLOCK
      ?auto_236243 - BLOCK
      ?auto_236244 - BLOCK
      ?auto_236245 - BLOCK
      ?auto_236246 - BLOCK
      ?auto_236247 - BLOCK
      ?auto_236248 - BLOCK
      ?auto_236249 - BLOCK
    )
    :vars
    (
      ?auto_236250 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_236249 ?auto_236250 ) ( ON-TABLE ?auto_236237 ) ( ON ?auto_236238 ?auto_236237 ) ( ON ?auto_236239 ?auto_236238 ) ( ON ?auto_236240 ?auto_236239 ) ( ON ?auto_236241 ?auto_236240 ) ( ON ?auto_236242 ?auto_236241 ) ( ON ?auto_236243 ?auto_236242 ) ( ON ?auto_236244 ?auto_236243 ) ( not ( = ?auto_236237 ?auto_236238 ) ) ( not ( = ?auto_236237 ?auto_236239 ) ) ( not ( = ?auto_236237 ?auto_236240 ) ) ( not ( = ?auto_236237 ?auto_236241 ) ) ( not ( = ?auto_236237 ?auto_236242 ) ) ( not ( = ?auto_236237 ?auto_236243 ) ) ( not ( = ?auto_236237 ?auto_236244 ) ) ( not ( = ?auto_236237 ?auto_236245 ) ) ( not ( = ?auto_236237 ?auto_236246 ) ) ( not ( = ?auto_236237 ?auto_236247 ) ) ( not ( = ?auto_236237 ?auto_236248 ) ) ( not ( = ?auto_236237 ?auto_236249 ) ) ( not ( = ?auto_236237 ?auto_236250 ) ) ( not ( = ?auto_236238 ?auto_236239 ) ) ( not ( = ?auto_236238 ?auto_236240 ) ) ( not ( = ?auto_236238 ?auto_236241 ) ) ( not ( = ?auto_236238 ?auto_236242 ) ) ( not ( = ?auto_236238 ?auto_236243 ) ) ( not ( = ?auto_236238 ?auto_236244 ) ) ( not ( = ?auto_236238 ?auto_236245 ) ) ( not ( = ?auto_236238 ?auto_236246 ) ) ( not ( = ?auto_236238 ?auto_236247 ) ) ( not ( = ?auto_236238 ?auto_236248 ) ) ( not ( = ?auto_236238 ?auto_236249 ) ) ( not ( = ?auto_236238 ?auto_236250 ) ) ( not ( = ?auto_236239 ?auto_236240 ) ) ( not ( = ?auto_236239 ?auto_236241 ) ) ( not ( = ?auto_236239 ?auto_236242 ) ) ( not ( = ?auto_236239 ?auto_236243 ) ) ( not ( = ?auto_236239 ?auto_236244 ) ) ( not ( = ?auto_236239 ?auto_236245 ) ) ( not ( = ?auto_236239 ?auto_236246 ) ) ( not ( = ?auto_236239 ?auto_236247 ) ) ( not ( = ?auto_236239 ?auto_236248 ) ) ( not ( = ?auto_236239 ?auto_236249 ) ) ( not ( = ?auto_236239 ?auto_236250 ) ) ( not ( = ?auto_236240 ?auto_236241 ) ) ( not ( = ?auto_236240 ?auto_236242 ) ) ( not ( = ?auto_236240 ?auto_236243 ) ) ( not ( = ?auto_236240 ?auto_236244 ) ) ( not ( = ?auto_236240 ?auto_236245 ) ) ( not ( = ?auto_236240 ?auto_236246 ) ) ( not ( = ?auto_236240 ?auto_236247 ) ) ( not ( = ?auto_236240 ?auto_236248 ) ) ( not ( = ?auto_236240 ?auto_236249 ) ) ( not ( = ?auto_236240 ?auto_236250 ) ) ( not ( = ?auto_236241 ?auto_236242 ) ) ( not ( = ?auto_236241 ?auto_236243 ) ) ( not ( = ?auto_236241 ?auto_236244 ) ) ( not ( = ?auto_236241 ?auto_236245 ) ) ( not ( = ?auto_236241 ?auto_236246 ) ) ( not ( = ?auto_236241 ?auto_236247 ) ) ( not ( = ?auto_236241 ?auto_236248 ) ) ( not ( = ?auto_236241 ?auto_236249 ) ) ( not ( = ?auto_236241 ?auto_236250 ) ) ( not ( = ?auto_236242 ?auto_236243 ) ) ( not ( = ?auto_236242 ?auto_236244 ) ) ( not ( = ?auto_236242 ?auto_236245 ) ) ( not ( = ?auto_236242 ?auto_236246 ) ) ( not ( = ?auto_236242 ?auto_236247 ) ) ( not ( = ?auto_236242 ?auto_236248 ) ) ( not ( = ?auto_236242 ?auto_236249 ) ) ( not ( = ?auto_236242 ?auto_236250 ) ) ( not ( = ?auto_236243 ?auto_236244 ) ) ( not ( = ?auto_236243 ?auto_236245 ) ) ( not ( = ?auto_236243 ?auto_236246 ) ) ( not ( = ?auto_236243 ?auto_236247 ) ) ( not ( = ?auto_236243 ?auto_236248 ) ) ( not ( = ?auto_236243 ?auto_236249 ) ) ( not ( = ?auto_236243 ?auto_236250 ) ) ( not ( = ?auto_236244 ?auto_236245 ) ) ( not ( = ?auto_236244 ?auto_236246 ) ) ( not ( = ?auto_236244 ?auto_236247 ) ) ( not ( = ?auto_236244 ?auto_236248 ) ) ( not ( = ?auto_236244 ?auto_236249 ) ) ( not ( = ?auto_236244 ?auto_236250 ) ) ( not ( = ?auto_236245 ?auto_236246 ) ) ( not ( = ?auto_236245 ?auto_236247 ) ) ( not ( = ?auto_236245 ?auto_236248 ) ) ( not ( = ?auto_236245 ?auto_236249 ) ) ( not ( = ?auto_236245 ?auto_236250 ) ) ( not ( = ?auto_236246 ?auto_236247 ) ) ( not ( = ?auto_236246 ?auto_236248 ) ) ( not ( = ?auto_236246 ?auto_236249 ) ) ( not ( = ?auto_236246 ?auto_236250 ) ) ( not ( = ?auto_236247 ?auto_236248 ) ) ( not ( = ?auto_236247 ?auto_236249 ) ) ( not ( = ?auto_236247 ?auto_236250 ) ) ( not ( = ?auto_236248 ?auto_236249 ) ) ( not ( = ?auto_236248 ?auto_236250 ) ) ( not ( = ?auto_236249 ?auto_236250 ) ) ( ON ?auto_236248 ?auto_236249 ) ( ON ?auto_236247 ?auto_236248 ) ( ON ?auto_236246 ?auto_236247 ) ( CLEAR ?auto_236244 ) ( ON ?auto_236245 ?auto_236246 ) ( CLEAR ?auto_236245 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_236237 ?auto_236238 ?auto_236239 ?auto_236240 ?auto_236241 ?auto_236242 ?auto_236243 ?auto_236244 ?auto_236245 )
      ( MAKE-13PILE ?auto_236237 ?auto_236238 ?auto_236239 ?auto_236240 ?auto_236241 ?auto_236242 ?auto_236243 ?auto_236244 ?auto_236245 ?auto_236246 ?auto_236247 ?auto_236248 ?auto_236249 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_236264 - BLOCK
      ?auto_236265 - BLOCK
      ?auto_236266 - BLOCK
      ?auto_236267 - BLOCK
      ?auto_236268 - BLOCK
      ?auto_236269 - BLOCK
      ?auto_236270 - BLOCK
      ?auto_236271 - BLOCK
      ?auto_236272 - BLOCK
      ?auto_236273 - BLOCK
      ?auto_236274 - BLOCK
      ?auto_236275 - BLOCK
      ?auto_236276 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_236276 ) ( ON-TABLE ?auto_236264 ) ( ON ?auto_236265 ?auto_236264 ) ( ON ?auto_236266 ?auto_236265 ) ( ON ?auto_236267 ?auto_236266 ) ( ON ?auto_236268 ?auto_236267 ) ( ON ?auto_236269 ?auto_236268 ) ( ON ?auto_236270 ?auto_236269 ) ( ON ?auto_236271 ?auto_236270 ) ( not ( = ?auto_236264 ?auto_236265 ) ) ( not ( = ?auto_236264 ?auto_236266 ) ) ( not ( = ?auto_236264 ?auto_236267 ) ) ( not ( = ?auto_236264 ?auto_236268 ) ) ( not ( = ?auto_236264 ?auto_236269 ) ) ( not ( = ?auto_236264 ?auto_236270 ) ) ( not ( = ?auto_236264 ?auto_236271 ) ) ( not ( = ?auto_236264 ?auto_236272 ) ) ( not ( = ?auto_236264 ?auto_236273 ) ) ( not ( = ?auto_236264 ?auto_236274 ) ) ( not ( = ?auto_236264 ?auto_236275 ) ) ( not ( = ?auto_236264 ?auto_236276 ) ) ( not ( = ?auto_236265 ?auto_236266 ) ) ( not ( = ?auto_236265 ?auto_236267 ) ) ( not ( = ?auto_236265 ?auto_236268 ) ) ( not ( = ?auto_236265 ?auto_236269 ) ) ( not ( = ?auto_236265 ?auto_236270 ) ) ( not ( = ?auto_236265 ?auto_236271 ) ) ( not ( = ?auto_236265 ?auto_236272 ) ) ( not ( = ?auto_236265 ?auto_236273 ) ) ( not ( = ?auto_236265 ?auto_236274 ) ) ( not ( = ?auto_236265 ?auto_236275 ) ) ( not ( = ?auto_236265 ?auto_236276 ) ) ( not ( = ?auto_236266 ?auto_236267 ) ) ( not ( = ?auto_236266 ?auto_236268 ) ) ( not ( = ?auto_236266 ?auto_236269 ) ) ( not ( = ?auto_236266 ?auto_236270 ) ) ( not ( = ?auto_236266 ?auto_236271 ) ) ( not ( = ?auto_236266 ?auto_236272 ) ) ( not ( = ?auto_236266 ?auto_236273 ) ) ( not ( = ?auto_236266 ?auto_236274 ) ) ( not ( = ?auto_236266 ?auto_236275 ) ) ( not ( = ?auto_236266 ?auto_236276 ) ) ( not ( = ?auto_236267 ?auto_236268 ) ) ( not ( = ?auto_236267 ?auto_236269 ) ) ( not ( = ?auto_236267 ?auto_236270 ) ) ( not ( = ?auto_236267 ?auto_236271 ) ) ( not ( = ?auto_236267 ?auto_236272 ) ) ( not ( = ?auto_236267 ?auto_236273 ) ) ( not ( = ?auto_236267 ?auto_236274 ) ) ( not ( = ?auto_236267 ?auto_236275 ) ) ( not ( = ?auto_236267 ?auto_236276 ) ) ( not ( = ?auto_236268 ?auto_236269 ) ) ( not ( = ?auto_236268 ?auto_236270 ) ) ( not ( = ?auto_236268 ?auto_236271 ) ) ( not ( = ?auto_236268 ?auto_236272 ) ) ( not ( = ?auto_236268 ?auto_236273 ) ) ( not ( = ?auto_236268 ?auto_236274 ) ) ( not ( = ?auto_236268 ?auto_236275 ) ) ( not ( = ?auto_236268 ?auto_236276 ) ) ( not ( = ?auto_236269 ?auto_236270 ) ) ( not ( = ?auto_236269 ?auto_236271 ) ) ( not ( = ?auto_236269 ?auto_236272 ) ) ( not ( = ?auto_236269 ?auto_236273 ) ) ( not ( = ?auto_236269 ?auto_236274 ) ) ( not ( = ?auto_236269 ?auto_236275 ) ) ( not ( = ?auto_236269 ?auto_236276 ) ) ( not ( = ?auto_236270 ?auto_236271 ) ) ( not ( = ?auto_236270 ?auto_236272 ) ) ( not ( = ?auto_236270 ?auto_236273 ) ) ( not ( = ?auto_236270 ?auto_236274 ) ) ( not ( = ?auto_236270 ?auto_236275 ) ) ( not ( = ?auto_236270 ?auto_236276 ) ) ( not ( = ?auto_236271 ?auto_236272 ) ) ( not ( = ?auto_236271 ?auto_236273 ) ) ( not ( = ?auto_236271 ?auto_236274 ) ) ( not ( = ?auto_236271 ?auto_236275 ) ) ( not ( = ?auto_236271 ?auto_236276 ) ) ( not ( = ?auto_236272 ?auto_236273 ) ) ( not ( = ?auto_236272 ?auto_236274 ) ) ( not ( = ?auto_236272 ?auto_236275 ) ) ( not ( = ?auto_236272 ?auto_236276 ) ) ( not ( = ?auto_236273 ?auto_236274 ) ) ( not ( = ?auto_236273 ?auto_236275 ) ) ( not ( = ?auto_236273 ?auto_236276 ) ) ( not ( = ?auto_236274 ?auto_236275 ) ) ( not ( = ?auto_236274 ?auto_236276 ) ) ( not ( = ?auto_236275 ?auto_236276 ) ) ( ON ?auto_236275 ?auto_236276 ) ( ON ?auto_236274 ?auto_236275 ) ( ON ?auto_236273 ?auto_236274 ) ( CLEAR ?auto_236271 ) ( ON ?auto_236272 ?auto_236273 ) ( CLEAR ?auto_236272 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_236264 ?auto_236265 ?auto_236266 ?auto_236267 ?auto_236268 ?auto_236269 ?auto_236270 ?auto_236271 ?auto_236272 )
      ( MAKE-13PILE ?auto_236264 ?auto_236265 ?auto_236266 ?auto_236267 ?auto_236268 ?auto_236269 ?auto_236270 ?auto_236271 ?auto_236272 ?auto_236273 ?auto_236274 ?auto_236275 ?auto_236276 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_236290 - BLOCK
      ?auto_236291 - BLOCK
      ?auto_236292 - BLOCK
      ?auto_236293 - BLOCK
      ?auto_236294 - BLOCK
      ?auto_236295 - BLOCK
      ?auto_236296 - BLOCK
      ?auto_236297 - BLOCK
      ?auto_236298 - BLOCK
      ?auto_236299 - BLOCK
      ?auto_236300 - BLOCK
      ?auto_236301 - BLOCK
      ?auto_236302 - BLOCK
    )
    :vars
    (
      ?auto_236303 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_236302 ?auto_236303 ) ( ON-TABLE ?auto_236290 ) ( ON ?auto_236291 ?auto_236290 ) ( ON ?auto_236292 ?auto_236291 ) ( ON ?auto_236293 ?auto_236292 ) ( ON ?auto_236294 ?auto_236293 ) ( ON ?auto_236295 ?auto_236294 ) ( ON ?auto_236296 ?auto_236295 ) ( not ( = ?auto_236290 ?auto_236291 ) ) ( not ( = ?auto_236290 ?auto_236292 ) ) ( not ( = ?auto_236290 ?auto_236293 ) ) ( not ( = ?auto_236290 ?auto_236294 ) ) ( not ( = ?auto_236290 ?auto_236295 ) ) ( not ( = ?auto_236290 ?auto_236296 ) ) ( not ( = ?auto_236290 ?auto_236297 ) ) ( not ( = ?auto_236290 ?auto_236298 ) ) ( not ( = ?auto_236290 ?auto_236299 ) ) ( not ( = ?auto_236290 ?auto_236300 ) ) ( not ( = ?auto_236290 ?auto_236301 ) ) ( not ( = ?auto_236290 ?auto_236302 ) ) ( not ( = ?auto_236290 ?auto_236303 ) ) ( not ( = ?auto_236291 ?auto_236292 ) ) ( not ( = ?auto_236291 ?auto_236293 ) ) ( not ( = ?auto_236291 ?auto_236294 ) ) ( not ( = ?auto_236291 ?auto_236295 ) ) ( not ( = ?auto_236291 ?auto_236296 ) ) ( not ( = ?auto_236291 ?auto_236297 ) ) ( not ( = ?auto_236291 ?auto_236298 ) ) ( not ( = ?auto_236291 ?auto_236299 ) ) ( not ( = ?auto_236291 ?auto_236300 ) ) ( not ( = ?auto_236291 ?auto_236301 ) ) ( not ( = ?auto_236291 ?auto_236302 ) ) ( not ( = ?auto_236291 ?auto_236303 ) ) ( not ( = ?auto_236292 ?auto_236293 ) ) ( not ( = ?auto_236292 ?auto_236294 ) ) ( not ( = ?auto_236292 ?auto_236295 ) ) ( not ( = ?auto_236292 ?auto_236296 ) ) ( not ( = ?auto_236292 ?auto_236297 ) ) ( not ( = ?auto_236292 ?auto_236298 ) ) ( not ( = ?auto_236292 ?auto_236299 ) ) ( not ( = ?auto_236292 ?auto_236300 ) ) ( not ( = ?auto_236292 ?auto_236301 ) ) ( not ( = ?auto_236292 ?auto_236302 ) ) ( not ( = ?auto_236292 ?auto_236303 ) ) ( not ( = ?auto_236293 ?auto_236294 ) ) ( not ( = ?auto_236293 ?auto_236295 ) ) ( not ( = ?auto_236293 ?auto_236296 ) ) ( not ( = ?auto_236293 ?auto_236297 ) ) ( not ( = ?auto_236293 ?auto_236298 ) ) ( not ( = ?auto_236293 ?auto_236299 ) ) ( not ( = ?auto_236293 ?auto_236300 ) ) ( not ( = ?auto_236293 ?auto_236301 ) ) ( not ( = ?auto_236293 ?auto_236302 ) ) ( not ( = ?auto_236293 ?auto_236303 ) ) ( not ( = ?auto_236294 ?auto_236295 ) ) ( not ( = ?auto_236294 ?auto_236296 ) ) ( not ( = ?auto_236294 ?auto_236297 ) ) ( not ( = ?auto_236294 ?auto_236298 ) ) ( not ( = ?auto_236294 ?auto_236299 ) ) ( not ( = ?auto_236294 ?auto_236300 ) ) ( not ( = ?auto_236294 ?auto_236301 ) ) ( not ( = ?auto_236294 ?auto_236302 ) ) ( not ( = ?auto_236294 ?auto_236303 ) ) ( not ( = ?auto_236295 ?auto_236296 ) ) ( not ( = ?auto_236295 ?auto_236297 ) ) ( not ( = ?auto_236295 ?auto_236298 ) ) ( not ( = ?auto_236295 ?auto_236299 ) ) ( not ( = ?auto_236295 ?auto_236300 ) ) ( not ( = ?auto_236295 ?auto_236301 ) ) ( not ( = ?auto_236295 ?auto_236302 ) ) ( not ( = ?auto_236295 ?auto_236303 ) ) ( not ( = ?auto_236296 ?auto_236297 ) ) ( not ( = ?auto_236296 ?auto_236298 ) ) ( not ( = ?auto_236296 ?auto_236299 ) ) ( not ( = ?auto_236296 ?auto_236300 ) ) ( not ( = ?auto_236296 ?auto_236301 ) ) ( not ( = ?auto_236296 ?auto_236302 ) ) ( not ( = ?auto_236296 ?auto_236303 ) ) ( not ( = ?auto_236297 ?auto_236298 ) ) ( not ( = ?auto_236297 ?auto_236299 ) ) ( not ( = ?auto_236297 ?auto_236300 ) ) ( not ( = ?auto_236297 ?auto_236301 ) ) ( not ( = ?auto_236297 ?auto_236302 ) ) ( not ( = ?auto_236297 ?auto_236303 ) ) ( not ( = ?auto_236298 ?auto_236299 ) ) ( not ( = ?auto_236298 ?auto_236300 ) ) ( not ( = ?auto_236298 ?auto_236301 ) ) ( not ( = ?auto_236298 ?auto_236302 ) ) ( not ( = ?auto_236298 ?auto_236303 ) ) ( not ( = ?auto_236299 ?auto_236300 ) ) ( not ( = ?auto_236299 ?auto_236301 ) ) ( not ( = ?auto_236299 ?auto_236302 ) ) ( not ( = ?auto_236299 ?auto_236303 ) ) ( not ( = ?auto_236300 ?auto_236301 ) ) ( not ( = ?auto_236300 ?auto_236302 ) ) ( not ( = ?auto_236300 ?auto_236303 ) ) ( not ( = ?auto_236301 ?auto_236302 ) ) ( not ( = ?auto_236301 ?auto_236303 ) ) ( not ( = ?auto_236302 ?auto_236303 ) ) ( ON ?auto_236301 ?auto_236302 ) ( ON ?auto_236300 ?auto_236301 ) ( ON ?auto_236299 ?auto_236300 ) ( ON ?auto_236298 ?auto_236299 ) ( CLEAR ?auto_236296 ) ( ON ?auto_236297 ?auto_236298 ) ( CLEAR ?auto_236297 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_236290 ?auto_236291 ?auto_236292 ?auto_236293 ?auto_236294 ?auto_236295 ?auto_236296 ?auto_236297 )
      ( MAKE-13PILE ?auto_236290 ?auto_236291 ?auto_236292 ?auto_236293 ?auto_236294 ?auto_236295 ?auto_236296 ?auto_236297 ?auto_236298 ?auto_236299 ?auto_236300 ?auto_236301 ?auto_236302 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_236317 - BLOCK
      ?auto_236318 - BLOCK
      ?auto_236319 - BLOCK
      ?auto_236320 - BLOCK
      ?auto_236321 - BLOCK
      ?auto_236322 - BLOCK
      ?auto_236323 - BLOCK
      ?auto_236324 - BLOCK
      ?auto_236325 - BLOCK
      ?auto_236326 - BLOCK
      ?auto_236327 - BLOCK
      ?auto_236328 - BLOCK
      ?auto_236329 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_236329 ) ( ON-TABLE ?auto_236317 ) ( ON ?auto_236318 ?auto_236317 ) ( ON ?auto_236319 ?auto_236318 ) ( ON ?auto_236320 ?auto_236319 ) ( ON ?auto_236321 ?auto_236320 ) ( ON ?auto_236322 ?auto_236321 ) ( ON ?auto_236323 ?auto_236322 ) ( not ( = ?auto_236317 ?auto_236318 ) ) ( not ( = ?auto_236317 ?auto_236319 ) ) ( not ( = ?auto_236317 ?auto_236320 ) ) ( not ( = ?auto_236317 ?auto_236321 ) ) ( not ( = ?auto_236317 ?auto_236322 ) ) ( not ( = ?auto_236317 ?auto_236323 ) ) ( not ( = ?auto_236317 ?auto_236324 ) ) ( not ( = ?auto_236317 ?auto_236325 ) ) ( not ( = ?auto_236317 ?auto_236326 ) ) ( not ( = ?auto_236317 ?auto_236327 ) ) ( not ( = ?auto_236317 ?auto_236328 ) ) ( not ( = ?auto_236317 ?auto_236329 ) ) ( not ( = ?auto_236318 ?auto_236319 ) ) ( not ( = ?auto_236318 ?auto_236320 ) ) ( not ( = ?auto_236318 ?auto_236321 ) ) ( not ( = ?auto_236318 ?auto_236322 ) ) ( not ( = ?auto_236318 ?auto_236323 ) ) ( not ( = ?auto_236318 ?auto_236324 ) ) ( not ( = ?auto_236318 ?auto_236325 ) ) ( not ( = ?auto_236318 ?auto_236326 ) ) ( not ( = ?auto_236318 ?auto_236327 ) ) ( not ( = ?auto_236318 ?auto_236328 ) ) ( not ( = ?auto_236318 ?auto_236329 ) ) ( not ( = ?auto_236319 ?auto_236320 ) ) ( not ( = ?auto_236319 ?auto_236321 ) ) ( not ( = ?auto_236319 ?auto_236322 ) ) ( not ( = ?auto_236319 ?auto_236323 ) ) ( not ( = ?auto_236319 ?auto_236324 ) ) ( not ( = ?auto_236319 ?auto_236325 ) ) ( not ( = ?auto_236319 ?auto_236326 ) ) ( not ( = ?auto_236319 ?auto_236327 ) ) ( not ( = ?auto_236319 ?auto_236328 ) ) ( not ( = ?auto_236319 ?auto_236329 ) ) ( not ( = ?auto_236320 ?auto_236321 ) ) ( not ( = ?auto_236320 ?auto_236322 ) ) ( not ( = ?auto_236320 ?auto_236323 ) ) ( not ( = ?auto_236320 ?auto_236324 ) ) ( not ( = ?auto_236320 ?auto_236325 ) ) ( not ( = ?auto_236320 ?auto_236326 ) ) ( not ( = ?auto_236320 ?auto_236327 ) ) ( not ( = ?auto_236320 ?auto_236328 ) ) ( not ( = ?auto_236320 ?auto_236329 ) ) ( not ( = ?auto_236321 ?auto_236322 ) ) ( not ( = ?auto_236321 ?auto_236323 ) ) ( not ( = ?auto_236321 ?auto_236324 ) ) ( not ( = ?auto_236321 ?auto_236325 ) ) ( not ( = ?auto_236321 ?auto_236326 ) ) ( not ( = ?auto_236321 ?auto_236327 ) ) ( not ( = ?auto_236321 ?auto_236328 ) ) ( not ( = ?auto_236321 ?auto_236329 ) ) ( not ( = ?auto_236322 ?auto_236323 ) ) ( not ( = ?auto_236322 ?auto_236324 ) ) ( not ( = ?auto_236322 ?auto_236325 ) ) ( not ( = ?auto_236322 ?auto_236326 ) ) ( not ( = ?auto_236322 ?auto_236327 ) ) ( not ( = ?auto_236322 ?auto_236328 ) ) ( not ( = ?auto_236322 ?auto_236329 ) ) ( not ( = ?auto_236323 ?auto_236324 ) ) ( not ( = ?auto_236323 ?auto_236325 ) ) ( not ( = ?auto_236323 ?auto_236326 ) ) ( not ( = ?auto_236323 ?auto_236327 ) ) ( not ( = ?auto_236323 ?auto_236328 ) ) ( not ( = ?auto_236323 ?auto_236329 ) ) ( not ( = ?auto_236324 ?auto_236325 ) ) ( not ( = ?auto_236324 ?auto_236326 ) ) ( not ( = ?auto_236324 ?auto_236327 ) ) ( not ( = ?auto_236324 ?auto_236328 ) ) ( not ( = ?auto_236324 ?auto_236329 ) ) ( not ( = ?auto_236325 ?auto_236326 ) ) ( not ( = ?auto_236325 ?auto_236327 ) ) ( not ( = ?auto_236325 ?auto_236328 ) ) ( not ( = ?auto_236325 ?auto_236329 ) ) ( not ( = ?auto_236326 ?auto_236327 ) ) ( not ( = ?auto_236326 ?auto_236328 ) ) ( not ( = ?auto_236326 ?auto_236329 ) ) ( not ( = ?auto_236327 ?auto_236328 ) ) ( not ( = ?auto_236327 ?auto_236329 ) ) ( not ( = ?auto_236328 ?auto_236329 ) ) ( ON ?auto_236328 ?auto_236329 ) ( ON ?auto_236327 ?auto_236328 ) ( ON ?auto_236326 ?auto_236327 ) ( ON ?auto_236325 ?auto_236326 ) ( CLEAR ?auto_236323 ) ( ON ?auto_236324 ?auto_236325 ) ( CLEAR ?auto_236324 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_236317 ?auto_236318 ?auto_236319 ?auto_236320 ?auto_236321 ?auto_236322 ?auto_236323 ?auto_236324 )
      ( MAKE-13PILE ?auto_236317 ?auto_236318 ?auto_236319 ?auto_236320 ?auto_236321 ?auto_236322 ?auto_236323 ?auto_236324 ?auto_236325 ?auto_236326 ?auto_236327 ?auto_236328 ?auto_236329 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_236343 - BLOCK
      ?auto_236344 - BLOCK
      ?auto_236345 - BLOCK
      ?auto_236346 - BLOCK
      ?auto_236347 - BLOCK
      ?auto_236348 - BLOCK
      ?auto_236349 - BLOCK
      ?auto_236350 - BLOCK
      ?auto_236351 - BLOCK
      ?auto_236352 - BLOCK
      ?auto_236353 - BLOCK
      ?auto_236354 - BLOCK
      ?auto_236355 - BLOCK
    )
    :vars
    (
      ?auto_236356 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_236355 ?auto_236356 ) ( ON-TABLE ?auto_236343 ) ( ON ?auto_236344 ?auto_236343 ) ( ON ?auto_236345 ?auto_236344 ) ( ON ?auto_236346 ?auto_236345 ) ( ON ?auto_236347 ?auto_236346 ) ( ON ?auto_236348 ?auto_236347 ) ( not ( = ?auto_236343 ?auto_236344 ) ) ( not ( = ?auto_236343 ?auto_236345 ) ) ( not ( = ?auto_236343 ?auto_236346 ) ) ( not ( = ?auto_236343 ?auto_236347 ) ) ( not ( = ?auto_236343 ?auto_236348 ) ) ( not ( = ?auto_236343 ?auto_236349 ) ) ( not ( = ?auto_236343 ?auto_236350 ) ) ( not ( = ?auto_236343 ?auto_236351 ) ) ( not ( = ?auto_236343 ?auto_236352 ) ) ( not ( = ?auto_236343 ?auto_236353 ) ) ( not ( = ?auto_236343 ?auto_236354 ) ) ( not ( = ?auto_236343 ?auto_236355 ) ) ( not ( = ?auto_236343 ?auto_236356 ) ) ( not ( = ?auto_236344 ?auto_236345 ) ) ( not ( = ?auto_236344 ?auto_236346 ) ) ( not ( = ?auto_236344 ?auto_236347 ) ) ( not ( = ?auto_236344 ?auto_236348 ) ) ( not ( = ?auto_236344 ?auto_236349 ) ) ( not ( = ?auto_236344 ?auto_236350 ) ) ( not ( = ?auto_236344 ?auto_236351 ) ) ( not ( = ?auto_236344 ?auto_236352 ) ) ( not ( = ?auto_236344 ?auto_236353 ) ) ( not ( = ?auto_236344 ?auto_236354 ) ) ( not ( = ?auto_236344 ?auto_236355 ) ) ( not ( = ?auto_236344 ?auto_236356 ) ) ( not ( = ?auto_236345 ?auto_236346 ) ) ( not ( = ?auto_236345 ?auto_236347 ) ) ( not ( = ?auto_236345 ?auto_236348 ) ) ( not ( = ?auto_236345 ?auto_236349 ) ) ( not ( = ?auto_236345 ?auto_236350 ) ) ( not ( = ?auto_236345 ?auto_236351 ) ) ( not ( = ?auto_236345 ?auto_236352 ) ) ( not ( = ?auto_236345 ?auto_236353 ) ) ( not ( = ?auto_236345 ?auto_236354 ) ) ( not ( = ?auto_236345 ?auto_236355 ) ) ( not ( = ?auto_236345 ?auto_236356 ) ) ( not ( = ?auto_236346 ?auto_236347 ) ) ( not ( = ?auto_236346 ?auto_236348 ) ) ( not ( = ?auto_236346 ?auto_236349 ) ) ( not ( = ?auto_236346 ?auto_236350 ) ) ( not ( = ?auto_236346 ?auto_236351 ) ) ( not ( = ?auto_236346 ?auto_236352 ) ) ( not ( = ?auto_236346 ?auto_236353 ) ) ( not ( = ?auto_236346 ?auto_236354 ) ) ( not ( = ?auto_236346 ?auto_236355 ) ) ( not ( = ?auto_236346 ?auto_236356 ) ) ( not ( = ?auto_236347 ?auto_236348 ) ) ( not ( = ?auto_236347 ?auto_236349 ) ) ( not ( = ?auto_236347 ?auto_236350 ) ) ( not ( = ?auto_236347 ?auto_236351 ) ) ( not ( = ?auto_236347 ?auto_236352 ) ) ( not ( = ?auto_236347 ?auto_236353 ) ) ( not ( = ?auto_236347 ?auto_236354 ) ) ( not ( = ?auto_236347 ?auto_236355 ) ) ( not ( = ?auto_236347 ?auto_236356 ) ) ( not ( = ?auto_236348 ?auto_236349 ) ) ( not ( = ?auto_236348 ?auto_236350 ) ) ( not ( = ?auto_236348 ?auto_236351 ) ) ( not ( = ?auto_236348 ?auto_236352 ) ) ( not ( = ?auto_236348 ?auto_236353 ) ) ( not ( = ?auto_236348 ?auto_236354 ) ) ( not ( = ?auto_236348 ?auto_236355 ) ) ( not ( = ?auto_236348 ?auto_236356 ) ) ( not ( = ?auto_236349 ?auto_236350 ) ) ( not ( = ?auto_236349 ?auto_236351 ) ) ( not ( = ?auto_236349 ?auto_236352 ) ) ( not ( = ?auto_236349 ?auto_236353 ) ) ( not ( = ?auto_236349 ?auto_236354 ) ) ( not ( = ?auto_236349 ?auto_236355 ) ) ( not ( = ?auto_236349 ?auto_236356 ) ) ( not ( = ?auto_236350 ?auto_236351 ) ) ( not ( = ?auto_236350 ?auto_236352 ) ) ( not ( = ?auto_236350 ?auto_236353 ) ) ( not ( = ?auto_236350 ?auto_236354 ) ) ( not ( = ?auto_236350 ?auto_236355 ) ) ( not ( = ?auto_236350 ?auto_236356 ) ) ( not ( = ?auto_236351 ?auto_236352 ) ) ( not ( = ?auto_236351 ?auto_236353 ) ) ( not ( = ?auto_236351 ?auto_236354 ) ) ( not ( = ?auto_236351 ?auto_236355 ) ) ( not ( = ?auto_236351 ?auto_236356 ) ) ( not ( = ?auto_236352 ?auto_236353 ) ) ( not ( = ?auto_236352 ?auto_236354 ) ) ( not ( = ?auto_236352 ?auto_236355 ) ) ( not ( = ?auto_236352 ?auto_236356 ) ) ( not ( = ?auto_236353 ?auto_236354 ) ) ( not ( = ?auto_236353 ?auto_236355 ) ) ( not ( = ?auto_236353 ?auto_236356 ) ) ( not ( = ?auto_236354 ?auto_236355 ) ) ( not ( = ?auto_236354 ?auto_236356 ) ) ( not ( = ?auto_236355 ?auto_236356 ) ) ( ON ?auto_236354 ?auto_236355 ) ( ON ?auto_236353 ?auto_236354 ) ( ON ?auto_236352 ?auto_236353 ) ( ON ?auto_236351 ?auto_236352 ) ( ON ?auto_236350 ?auto_236351 ) ( CLEAR ?auto_236348 ) ( ON ?auto_236349 ?auto_236350 ) ( CLEAR ?auto_236349 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_236343 ?auto_236344 ?auto_236345 ?auto_236346 ?auto_236347 ?auto_236348 ?auto_236349 )
      ( MAKE-13PILE ?auto_236343 ?auto_236344 ?auto_236345 ?auto_236346 ?auto_236347 ?auto_236348 ?auto_236349 ?auto_236350 ?auto_236351 ?auto_236352 ?auto_236353 ?auto_236354 ?auto_236355 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_236370 - BLOCK
      ?auto_236371 - BLOCK
      ?auto_236372 - BLOCK
      ?auto_236373 - BLOCK
      ?auto_236374 - BLOCK
      ?auto_236375 - BLOCK
      ?auto_236376 - BLOCK
      ?auto_236377 - BLOCK
      ?auto_236378 - BLOCK
      ?auto_236379 - BLOCK
      ?auto_236380 - BLOCK
      ?auto_236381 - BLOCK
      ?auto_236382 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_236382 ) ( ON-TABLE ?auto_236370 ) ( ON ?auto_236371 ?auto_236370 ) ( ON ?auto_236372 ?auto_236371 ) ( ON ?auto_236373 ?auto_236372 ) ( ON ?auto_236374 ?auto_236373 ) ( ON ?auto_236375 ?auto_236374 ) ( not ( = ?auto_236370 ?auto_236371 ) ) ( not ( = ?auto_236370 ?auto_236372 ) ) ( not ( = ?auto_236370 ?auto_236373 ) ) ( not ( = ?auto_236370 ?auto_236374 ) ) ( not ( = ?auto_236370 ?auto_236375 ) ) ( not ( = ?auto_236370 ?auto_236376 ) ) ( not ( = ?auto_236370 ?auto_236377 ) ) ( not ( = ?auto_236370 ?auto_236378 ) ) ( not ( = ?auto_236370 ?auto_236379 ) ) ( not ( = ?auto_236370 ?auto_236380 ) ) ( not ( = ?auto_236370 ?auto_236381 ) ) ( not ( = ?auto_236370 ?auto_236382 ) ) ( not ( = ?auto_236371 ?auto_236372 ) ) ( not ( = ?auto_236371 ?auto_236373 ) ) ( not ( = ?auto_236371 ?auto_236374 ) ) ( not ( = ?auto_236371 ?auto_236375 ) ) ( not ( = ?auto_236371 ?auto_236376 ) ) ( not ( = ?auto_236371 ?auto_236377 ) ) ( not ( = ?auto_236371 ?auto_236378 ) ) ( not ( = ?auto_236371 ?auto_236379 ) ) ( not ( = ?auto_236371 ?auto_236380 ) ) ( not ( = ?auto_236371 ?auto_236381 ) ) ( not ( = ?auto_236371 ?auto_236382 ) ) ( not ( = ?auto_236372 ?auto_236373 ) ) ( not ( = ?auto_236372 ?auto_236374 ) ) ( not ( = ?auto_236372 ?auto_236375 ) ) ( not ( = ?auto_236372 ?auto_236376 ) ) ( not ( = ?auto_236372 ?auto_236377 ) ) ( not ( = ?auto_236372 ?auto_236378 ) ) ( not ( = ?auto_236372 ?auto_236379 ) ) ( not ( = ?auto_236372 ?auto_236380 ) ) ( not ( = ?auto_236372 ?auto_236381 ) ) ( not ( = ?auto_236372 ?auto_236382 ) ) ( not ( = ?auto_236373 ?auto_236374 ) ) ( not ( = ?auto_236373 ?auto_236375 ) ) ( not ( = ?auto_236373 ?auto_236376 ) ) ( not ( = ?auto_236373 ?auto_236377 ) ) ( not ( = ?auto_236373 ?auto_236378 ) ) ( not ( = ?auto_236373 ?auto_236379 ) ) ( not ( = ?auto_236373 ?auto_236380 ) ) ( not ( = ?auto_236373 ?auto_236381 ) ) ( not ( = ?auto_236373 ?auto_236382 ) ) ( not ( = ?auto_236374 ?auto_236375 ) ) ( not ( = ?auto_236374 ?auto_236376 ) ) ( not ( = ?auto_236374 ?auto_236377 ) ) ( not ( = ?auto_236374 ?auto_236378 ) ) ( not ( = ?auto_236374 ?auto_236379 ) ) ( not ( = ?auto_236374 ?auto_236380 ) ) ( not ( = ?auto_236374 ?auto_236381 ) ) ( not ( = ?auto_236374 ?auto_236382 ) ) ( not ( = ?auto_236375 ?auto_236376 ) ) ( not ( = ?auto_236375 ?auto_236377 ) ) ( not ( = ?auto_236375 ?auto_236378 ) ) ( not ( = ?auto_236375 ?auto_236379 ) ) ( not ( = ?auto_236375 ?auto_236380 ) ) ( not ( = ?auto_236375 ?auto_236381 ) ) ( not ( = ?auto_236375 ?auto_236382 ) ) ( not ( = ?auto_236376 ?auto_236377 ) ) ( not ( = ?auto_236376 ?auto_236378 ) ) ( not ( = ?auto_236376 ?auto_236379 ) ) ( not ( = ?auto_236376 ?auto_236380 ) ) ( not ( = ?auto_236376 ?auto_236381 ) ) ( not ( = ?auto_236376 ?auto_236382 ) ) ( not ( = ?auto_236377 ?auto_236378 ) ) ( not ( = ?auto_236377 ?auto_236379 ) ) ( not ( = ?auto_236377 ?auto_236380 ) ) ( not ( = ?auto_236377 ?auto_236381 ) ) ( not ( = ?auto_236377 ?auto_236382 ) ) ( not ( = ?auto_236378 ?auto_236379 ) ) ( not ( = ?auto_236378 ?auto_236380 ) ) ( not ( = ?auto_236378 ?auto_236381 ) ) ( not ( = ?auto_236378 ?auto_236382 ) ) ( not ( = ?auto_236379 ?auto_236380 ) ) ( not ( = ?auto_236379 ?auto_236381 ) ) ( not ( = ?auto_236379 ?auto_236382 ) ) ( not ( = ?auto_236380 ?auto_236381 ) ) ( not ( = ?auto_236380 ?auto_236382 ) ) ( not ( = ?auto_236381 ?auto_236382 ) ) ( ON ?auto_236381 ?auto_236382 ) ( ON ?auto_236380 ?auto_236381 ) ( ON ?auto_236379 ?auto_236380 ) ( ON ?auto_236378 ?auto_236379 ) ( ON ?auto_236377 ?auto_236378 ) ( CLEAR ?auto_236375 ) ( ON ?auto_236376 ?auto_236377 ) ( CLEAR ?auto_236376 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_236370 ?auto_236371 ?auto_236372 ?auto_236373 ?auto_236374 ?auto_236375 ?auto_236376 )
      ( MAKE-13PILE ?auto_236370 ?auto_236371 ?auto_236372 ?auto_236373 ?auto_236374 ?auto_236375 ?auto_236376 ?auto_236377 ?auto_236378 ?auto_236379 ?auto_236380 ?auto_236381 ?auto_236382 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_236396 - BLOCK
      ?auto_236397 - BLOCK
      ?auto_236398 - BLOCK
      ?auto_236399 - BLOCK
      ?auto_236400 - BLOCK
      ?auto_236401 - BLOCK
      ?auto_236402 - BLOCK
      ?auto_236403 - BLOCK
      ?auto_236404 - BLOCK
      ?auto_236405 - BLOCK
      ?auto_236406 - BLOCK
      ?auto_236407 - BLOCK
      ?auto_236408 - BLOCK
    )
    :vars
    (
      ?auto_236409 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_236408 ?auto_236409 ) ( ON-TABLE ?auto_236396 ) ( ON ?auto_236397 ?auto_236396 ) ( ON ?auto_236398 ?auto_236397 ) ( ON ?auto_236399 ?auto_236398 ) ( ON ?auto_236400 ?auto_236399 ) ( not ( = ?auto_236396 ?auto_236397 ) ) ( not ( = ?auto_236396 ?auto_236398 ) ) ( not ( = ?auto_236396 ?auto_236399 ) ) ( not ( = ?auto_236396 ?auto_236400 ) ) ( not ( = ?auto_236396 ?auto_236401 ) ) ( not ( = ?auto_236396 ?auto_236402 ) ) ( not ( = ?auto_236396 ?auto_236403 ) ) ( not ( = ?auto_236396 ?auto_236404 ) ) ( not ( = ?auto_236396 ?auto_236405 ) ) ( not ( = ?auto_236396 ?auto_236406 ) ) ( not ( = ?auto_236396 ?auto_236407 ) ) ( not ( = ?auto_236396 ?auto_236408 ) ) ( not ( = ?auto_236396 ?auto_236409 ) ) ( not ( = ?auto_236397 ?auto_236398 ) ) ( not ( = ?auto_236397 ?auto_236399 ) ) ( not ( = ?auto_236397 ?auto_236400 ) ) ( not ( = ?auto_236397 ?auto_236401 ) ) ( not ( = ?auto_236397 ?auto_236402 ) ) ( not ( = ?auto_236397 ?auto_236403 ) ) ( not ( = ?auto_236397 ?auto_236404 ) ) ( not ( = ?auto_236397 ?auto_236405 ) ) ( not ( = ?auto_236397 ?auto_236406 ) ) ( not ( = ?auto_236397 ?auto_236407 ) ) ( not ( = ?auto_236397 ?auto_236408 ) ) ( not ( = ?auto_236397 ?auto_236409 ) ) ( not ( = ?auto_236398 ?auto_236399 ) ) ( not ( = ?auto_236398 ?auto_236400 ) ) ( not ( = ?auto_236398 ?auto_236401 ) ) ( not ( = ?auto_236398 ?auto_236402 ) ) ( not ( = ?auto_236398 ?auto_236403 ) ) ( not ( = ?auto_236398 ?auto_236404 ) ) ( not ( = ?auto_236398 ?auto_236405 ) ) ( not ( = ?auto_236398 ?auto_236406 ) ) ( not ( = ?auto_236398 ?auto_236407 ) ) ( not ( = ?auto_236398 ?auto_236408 ) ) ( not ( = ?auto_236398 ?auto_236409 ) ) ( not ( = ?auto_236399 ?auto_236400 ) ) ( not ( = ?auto_236399 ?auto_236401 ) ) ( not ( = ?auto_236399 ?auto_236402 ) ) ( not ( = ?auto_236399 ?auto_236403 ) ) ( not ( = ?auto_236399 ?auto_236404 ) ) ( not ( = ?auto_236399 ?auto_236405 ) ) ( not ( = ?auto_236399 ?auto_236406 ) ) ( not ( = ?auto_236399 ?auto_236407 ) ) ( not ( = ?auto_236399 ?auto_236408 ) ) ( not ( = ?auto_236399 ?auto_236409 ) ) ( not ( = ?auto_236400 ?auto_236401 ) ) ( not ( = ?auto_236400 ?auto_236402 ) ) ( not ( = ?auto_236400 ?auto_236403 ) ) ( not ( = ?auto_236400 ?auto_236404 ) ) ( not ( = ?auto_236400 ?auto_236405 ) ) ( not ( = ?auto_236400 ?auto_236406 ) ) ( not ( = ?auto_236400 ?auto_236407 ) ) ( not ( = ?auto_236400 ?auto_236408 ) ) ( not ( = ?auto_236400 ?auto_236409 ) ) ( not ( = ?auto_236401 ?auto_236402 ) ) ( not ( = ?auto_236401 ?auto_236403 ) ) ( not ( = ?auto_236401 ?auto_236404 ) ) ( not ( = ?auto_236401 ?auto_236405 ) ) ( not ( = ?auto_236401 ?auto_236406 ) ) ( not ( = ?auto_236401 ?auto_236407 ) ) ( not ( = ?auto_236401 ?auto_236408 ) ) ( not ( = ?auto_236401 ?auto_236409 ) ) ( not ( = ?auto_236402 ?auto_236403 ) ) ( not ( = ?auto_236402 ?auto_236404 ) ) ( not ( = ?auto_236402 ?auto_236405 ) ) ( not ( = ?auto_236402 ?auto_236406 ) ) ( not ( = ?auto_236402 ?auto_236407 ) ) ( not ( = ?auto_236402 ?auto_236408 ) ) ( not ( = ?auto_236402 ?auto_236409 ) ) ( not ( = ?auto_236403 ?auto_236404 ) ) ( not ( = ?auto_236403 ?auto_236405 ) ) ( not ( = ?auto_236403 ?auto_236406 ) ) ( not ( = ?auto_236403 ?auto_236407 ) ) ( not ( = ?auto_236403 ?auto_236408 ) ) ( not ( = ?auto_236403 ?auto_236409 ) ) ( not ( = ?auto_236404 ?auto_236405 ) ) ( not ( = ?auto_236404 ?auto_236406 ) ) ( not ( = ?auto_236404 ?auto_236407 ) ) ( not ( = ?auto_236404 ?auto_236408 ) ) ( not ( = ?auto_236404 ?auto_236409 ) ) ( not ( = ?auto_236405 ?auto_236406 ) ) ( not ( = ?auto_236405 ?auto_236407 ) ) ( not ( = ?auto_236405 ?auto_236408 ) ) ( not ( = ?auto_236405 ?auto_236409 ) ) ( not ( = ?auto_236406 ?auto_236407 ) ) ( not ( = ?auto_236406 ?auto_236408 ) ) ( not ( = ?auto_236406 ?auto_236409 ) ) ( not ( = ?auto_236407 ?auto_236408 ) ) ( not ( = ?auto_236407 ?auto_236409 ) ) ( not ( = ?auto_236408 ?auto_236409 ) ) ( ON ?auto_236407 ?auto_236408 ) ( ON ?auto_236406 ?auto_236407 ) ( ON ?auto_236405 ?auto_236406 ) ( ON ?auto_236404 ?auto_236405 ) ( ON ?auto_236403 ?auto_236404 ) ( ON ?auto_236402 ?auto_236403 ) ( CLEAR ?auto_236400 ) ( ON ?auto_236401 ?auto_236402 ) ( CLEAR ?auto_236401 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_236396 ?auto_236397 ?auto_236398 ?auto_236399 ?auto_236400 ?auto_236401 )
      ( MAKE-13PILE ?auto_236396 ?auto_236397 ?auto_236398 ?auto_236399 ?auto_236400 ?auto_236401 ?auto_236402 ?auto_236403 ?auto_236404 ?auto_236405 ?auto_236406 ?auto_236407 ?auto_236408 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_236423 - BLOCK
      ?auto_236424 - BLOCK
      ?auto_236425 - BLOCK
      ?auto_236426 - BLOCK
      ?auto_236427 - BLOCK
      ?auto_236428 - BLOCK
      ?auto_236429 - BLOCK
      ?auto_236430 - BLOCK
      ?auto_236431 - BLOCK
      ?auto_236432 - BLOCK
      ?auto_236433 - BLOCK
      ?auto_236434 - BLOCK
      ?auto_236435 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_236435 ) ( ON-TABLE ?auto_236423 ) ( ON ?auto_236424 ?auto_236423 ) ( ON ?auto_236425 ?auto_236424 ) ( ON ?auto_236426 ?auto_236425 ) ( ON ?auto_236427 ?auto_236426 ) ( not ( = ?auto_236423 ?auto_236424 ) ) ( not ( = ?auto_236423 ?auto_236425 ) ) ( not ( = ?auto_236423 ?auto_236426 ) ) ( not ( = ?auto_236423 ?auto_236427 ) ) ( not ( = ?auto_236423 ?auto_236428 ) ) ( not ( = ?auto_236423 ?auto_236429 ) ) ( not ( = ?auto_236423 ?auto_236430 ) ) ( not ( = ?auto_236423 ?auto_236431 ) ) ( not ( = ?auto_236423 ?auto_236432 ) ) ( not ( = ?auto_236423 ?auto_236433 ) ) ( not ( = ?auto_236423 ?auto_236434 ) ) ( not ( = ?auto_236423 ?auto_236435 ) ) ( not ( = ?auto_236424 ?auto_236425 ) ) ( not ( = ?auto_236424 ?auto_236426 ) ) ( not ( = ?auto_236424 ?auto_236427 ) ) ( not ( = ?auto_236424 ?auto_236428 ) ) ( not ( = ?auto_236424 ?auto_236429 ) ) ( not ( = ?auto_236424 ?auto_236430 ) ) ( not ( = ?auto_236424 ?auto_236431 ) ) ( not ( = ?auto_236424 ?auto_236432 ) ) ( not ( = ?auto_236424 ?auto_236433 ) ) ( not ( = ?auto_236424 ?auto_236434 ) ) ( not ( = ?auto_236424 ?auto_236435 ) ) ( not ( = ?auto_236425 ?auto_236426 ) ) ( not ( = ?auto_236425 ?auto_236427 ) ) ( not ( = ?auto_236425 ?auto_236428 ) ) ( not ( = ?auto_236425 ?auto_236429 ) ) ( not ( = ?auto_236425 ?auto_236430 ) ) ( not ( = ?auto_236425 ?auto_236431 ) ) ( not ( = ?auto_236425 ?auto_236432 ) ) ( not ( = ?auto_236425 ?auto_236433 ) ) ( not ( = ?auto_236425 ?auto_236434 ) ) ( not ( = ?auto_236425 ?auto_236435 ) ) ( not ( = ?auto_236426 ?auto_236427 ) ) ( not ( = ?auto_236426 ?auto_236428 ) ) ( not ( = ?auto_236426 ?auto_236429 ) ) ( not ( = ?auto_236426 ?auto_236430 ) ) ( not ( = ?auto_236426 ?auto_236431 ) ) ( not ( = ?auto_236426 ?auto_236432 ) ) ( not ( = ?auto_236426 ?auto_236433 ) ) ( not ( = ?auto_236426 ?auto_236434 ) ) ( not ( = ?auto_236426 ?auto_236435 ) ) ( not ( = ?auto_236427 ?auto_236428 ) ) ( not ( = ?auto_236427 ?auto_236429 ) ) ( not ( = ?auto_236427 ?auto_236430 ) ) ( not ( = ?auto_236427 ?auto_236431 ) ) ( not ( = ?auto_236427 ?auto_236432 ) ) ( not ( = ?auto_236427 ?auto_236433 ) ) ( not ( = ?auto_236427 ?auto_236434 ) ) ( not ( = ?auto_236427 ?auto_236435 ) ) ( not ( = ?auto_236428 ?auto_236429 ) ) ( not ( = ?auto_236428 ?auto_236430 ) ) ( not ( = ?auto_236428 ?auto_236431 ) ) ( not ( = ?auto_236428 ?auto_236432 ) ) ( not ( = ?auto_236428 ?auto_236433 ) ) ( not ( = ?auto_236428 ?auto_236434 ) ) ( not ( = ?auto_236428 ?auto_236435 ) ) ( not ( = ?auto_236429 ?auto_236430 ) ) ( not ( = ?auto_236429 ?auto_236431 ) ) ( not ( = ?auto_236429 ?auto_236432 ) ) ( not ( = ?auto_236429 ?auto_236433 ) ) ( not ( = ?auto_236429 ?auto_236434 ) ) ( not ( = ?auto_236429 ?auto_236435 ) ) ( not ( = ?auto_236430 ?auto_236431 ) ) ( not ( = ?auto_236430 ?auto_236432 ) ) ( not ( = ?auto_236430 ?auto_236433 ) ) ( not ( = ?auto_236430 ?auto_236434 ) ) ( not ( = ?auto_236430 ?auto_236435 ) ) ( not ( = ?auto_236431 ?auto_236432 ) ) ( not ( = ?auto_236431 ?auto_236433 ) ) ( not ( = ?auto_236431 ?auto_236434 ) ) ( not ( = ?auto_236431 ?auto_236435 ) ) ( not ( = ?auto_236432 ?auto_236433 ) ) ( not ( = ?auto_236432 ?auto_236434 ) ) ( not ( = ?auto_236432 ?auto_236435 ) ) ( not ( = ?auto_236433 ?auto_236434 ) ) ( not ( = ?auto_236433 ?auto_236435 ) ) ( not ( = ?auto_236434 ?auto_236435 ) ) ( ON ?auto_236434 ?auto_236435 ) ( ON ?auto_236433 ?auto_236434 ) ( ON ?auto_236432 ?auto_236433 ) ( ON ?auto_236431 ?auto_236432 ) ( ON ?auto_236430 ?auto_236431 ) ( ON ?auto_236429 ?auto_236430 ) ( CLEAR ?auto_236427 ) ( ON ?auto_236428 ?auto_236429 ) ( CLEAR ?auto_236428 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_236423 ?auto_236424 ?auto_236425 ?auto_236426 ?auto_236427 ?auto_236428 )
      ( MAKE-13PILE ?auto_236423 ?auto_236424 ?auto_236425 ?auto_236426 ?auto_236427 ?auto_236428 ?auto_236429 ?auto_236430 ?auto_236431 ?auto_236432 ?auto_236433 ?auto_236434 ?auto_236435 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_236449 - BLOCK
      ?auto_236450 - BLOCK
      ?auto_236451 - BLOCK
      ?auto_236452 - BLOCK
      ?auto_236453 - BLOCK
      ?auto_236454 - BLOCK
      ?auto_236455 - BLOCK
      ?auto_236456 - BLOCK
      ?auto_236457 - BLOCK
      ?auto_236458 - BLOCK
      ?auto_236459 - BLOCK
      ?auto_236460 - BLOCK
      ?auto_236461 - BLOCK
    )
    :vars
    (
      ?auto_236462 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_236461 ?auto_236462 ) ( ON-TABLE ?auto_236449 ) ( ON ?auto_236450 ?auto_236449 ) ( ON ?auto_236451 ?auto_236450 ) ( ON ?auto_236452 ?auto_236451 ) ( not ( = ?auto_236449 ?auto_236450 ) ) ( not ( = ?auto_236449 ?auto_236451 ) ) ( not ( = ?auto_236449 ?auto_236452 ) ) ( not ( = ?auto_236449 ?auto_236453 ) ) ( not ( = ?auto_236449 ?auto_236454 ) ) ( not ( = ?auto_236449 ?auto_236455 ) ) ( not ( = ?auto_236449 ?auto_236456 ) ) ( not ( = ?auto_236449 ?auto_236457 ) ) ( not ( = ?auto_236449 ?auto_236458 ) ) ( not ( = ?auto_236449 ?auto_236459 ) ) ( not ( = ?auto_236449 ?auto_236460 ) ) ( not ( = ?auto_236449 ?auto_236461 ) ) ( not ( = ?auto_236449 ?auto_236462 ) ) ( not ( = ?auto_236450 ?auto_236451 ) ) ( not ( = ?auto_236450 ?auto_236452 ) ) ( not ( = ?auto_236450 ?auto_236453 ) ) ( not ( = ?auto_236450 ?auto_236454 ) ) ( not ( = ?auto_236450 ?auto_236455 ) ) ( not ( = ?auto_236450 ?auto_236456 ) ) ( not ( = ?auto_236450 ?auto_236457 ) ) ( not ( = ?auto_236450 ?auto_236458 ) ) ( not ( = ?auto_236450 ?auto_236459 ) ) ( not ( = ?auto_236450 ?auto_236460 ) ) ( not ( = ?auto_236450 ?auto_236461 ) ) ( not ( = ?auto_236450 ?auto_236462 ) ) ( not ( = ?auto_236451 ?auto_236452 ) ) ( not ( = ?auto_236451 ?auto_236453 ) ) ( not ( = ?auto_236451 ?auto_236454 ) ) ( not ( = ?auto_236451 ?auto_236455 ) ) ( not ( = ?auto_236451 ?auto_236456 ) ) ( not ( = ?auto_236451 ?auto_236457 ) ) ( not ( = ?auto_236451 ?auto_236458 ) ) ( not ( = ?auto_236451 ?auto_236459 ) ) ( not ( = ?auto_236451 ?auto_236460 ) ) ( not ( = ?auto_236451 ?auto_236461 ) ) ( not ( = ?auto_236451 ?auto_236462 ) ) ( not ( = ?auto_236452 ?auto_236453 ) ) ( not ( = ?auto_236452 ?auto_236454 ) ) ( not ( = ?auto_236452 ?auto_236455 ) ) ( not ( = ?auto_236452 ?auto_236456 ) ) ( not ( = ?auto_236452 ?auto_236457 ) ) ( not ( = ?auto_236452 ?auto_236458 ) ) ( not ( = ?auto_236452 ?auto_236459 ) ) ( not ( = ?auto_236452 ?auto_236460 ) ) ( not ( = ?auto_236452 ?auto_236461 ) ) ( not ( = ?auto_236452 ?auto_236462 ) ) ( not ( = ?auto_236453 ?auto_236454 ) ) ( not ( = ?auto_236453 ?auto_236455 ) ) ( not ( = ?auto_236453 ?auto_236456 ) ) ( not ( = ?auto_236453 ?auto_236457 ) ) ( not ( = ?auto_236453 ?auto_236458 ) ) ( not ( = ?auto_236453 ?auto_236459 ) ) ( not ( = ?auto_236453 ?auto_236460 ) ) ( not ( = ?auto_236453 ?auto_236461 ) ) ( not ( = ?auto_236453 ?auto_236462 ) ) ( not ( = ?auto_236454 ?auto_236455 ) ) ( not ( = ?auto_236454 ?auto_236456 ) ) ( not ( = ?auto_236454 ?auto_236457 ) ) ( not ( = ?auto_236454 ?auto_236458 ) ) ( not ( = ?auto_236454 ?auto_236459 ) ) ( not ( = ?auto_236454 ?auto_236460 ) ) ( not ( = ?auto_236454 ?auto_236461 ) ) ( not ( = ?auto_236454 ?auto_236462 ) ) ( not ( = ?auto_236455 ?auto_236456 ) ) ( not ( = ?auto_236455 ?auto_236457 ) ) ( not ( = ?auto_236455 ?auto_236458 ) ) ( not ( = ?auto_236455 ?auto_236459 ) ) ( not ( = ?auto_236455 ?auto_236460 ) ) ( not ( = ?auto_236455 ?auto_236461 ) ) ( not ( = ?auto_236455 ?auto_236462 ) ) ( not ( = ?auto_236456 ?auto_236457 ) ) ( not ( = ?auto_236456 ?auto_236458 ) ) ( not ( = ?auto_236456 ?auto_236459 ) ) ( not ( = ?auto_236456 ?auto_236460 ) ) ( not ( = ?auto_236456 ?auto_236461 ) ) ( not ( = ?auto_236456 ?auto_236462 ) ) ( not ( = ?auto_236457 ?auto_236458 ) ) ( not ( = ?auto_236457 ?auto_236459 ) ) ( not ( = ?auto_236457 ?auto_236460 ) ) ( not ( = ?auto_236457 ?auto_236461 ) ) ( not ( = ?auto_236457 ?auto_236462 ) ) ( not ( = ?auto_236458 ?auto_236459 ) ) ( not ( = ?auto_236458 ?auto_236460 ) ) ( not ( = ?auto_236458 ?auto_236461 ) ) ( not ( = ?auto_236458 ?auto_236462 ) ) ( not ( = ?auto_236459 ?auto_236460 ) ) ( not ( = ?auto_236459 ?auto_236461 ) ) ( not ( = ?auto_236459 ?auto_236462 ) ) ( not ( = ?auto_236460 ?auto_236461 ) ) ( not ( = ?auto_236460 ?auto_236462 ) ) ( not ( = ?auto_236461 ?auto_236462 ) ) ( ON ?auto_236460 ?auto_236461 ) ( ON ?auto_236459 ?auto_236460 ) ( ON ?auto_236458 ?auto_236459 ) ( ON ?auto_236457 ?auto_236458 ) ( ON ?auto_236456 ?auto_236457 ) ( ON ?auto_236455 ?auto_236456 ) ( ON ?auto_236454 ?auto_236455 ) ( CLEAR ?auto_236452 ) ( ON ?auto_236453 ?auto_236454 ) ( CLEAR ?auto_236453 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_236449 ?auto_236450 ?auto_236451 ?auto_236452 ?auto_236453 )
      ( MAKE-13PILE ?auto_236449 ?auto_236450 ?auto_236451 ?auto_236452 ?auto_236453 ?auto_236454 ?auto_236455 ?auto_236456 ?auto_236457 ?auto_236458 ?auto_236459 ?auto_236460 ?auto_236461 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_236476 - BLOCK
      ?auto_236477 - BLOCK
      ?auto_236478 - BLOCK
      ?auto_236479 - BLOCK
      ?auto_236480 - BLOCK
      ?auto_236481 - BLOCK
      ?auto_236482 - BLOCK
      ?auto_236483 - BLOCK
      ?auto_236484 - BLOCK
      ?auto_236485 - BLOCK
      ?auto_236486 - BLOCK
      ?auto_236487 - BLOCK
      ?auto_236488 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_236488 ) ( ON-TABLE ?auto_236476 ) ( ON ?auto_236477 ?auto_236476 ) ( ON ?auto_236478 ?auto_236477 ) ( ON ?auto_236479 ?auto_236478 ) ( not ( = ?auto_236476 ?auto_236477 ) ) ( not ( = ?auto_236476 ?auto_236478 ) ) ( not ( = ?auto_236476 ?auto_236479 ) ) ( not ( = ?auto_236476 ?auto_236480 ) ) ( not ( = ?auto_236476 ?auto_236481 ) ) ( not ( = ?auto_236476 ?auto_236482 ) ) ( not ( = ?auto_236476 ?auto_236483 ) ) ( not ( = ?auto_236476 ?auto_236484 ) ) ( not ( = ?auto_236476 ?auto_236485 ) ) ( not ( = ?auto_236476 ?auto_236486 ) ) ( not ( = ?auto_236476 ?auto_236487 ) ) ( not ( = ?auto_236476 ?auto_236488 ) ) ( not ( = ?auto_236477 ?auto_236478 ) ) ( not ( = ?auto_236477 ?auto_236479 ) ) ( not ( = ?auto_236477 ?auto_236480 ) ) ( not ( = ?auto_236477 ?auto_236481 ) ) ( not ( = ?auto_236477 ?auto_236482 ) ) ( not ( = ?auto_236477 ?auto_236483 ) ) ( not ( = ?auto_236477 ?auto_236484 ) ) ( not ( = ?auto_236477 ?auto_236485 ) ) ( not ( = ?auto_236477 ?auto_236486 ) ) ( not ( = ?auto_236477 ?auto_236487 ) ) ( not ( = ?auto_236477 ?auto_236488 ) ) ( not ( = ?auto_236478 ?auto_236479 ) ) ( not ( = ?auto_236478 ?auto_236480 ) ) ( not ( = ?auto_236478 ?auto_236481 ) ) ( not ( = ?auto_236478 ?auto_236482 ) ) ( not ( = ?auto_236478 ?auto_236483 ) ) ( not ( = ?auto_236478 ?auto_236484 ) ) ( not ( = ?auto_236478 ?auto_236485 ) ) ( not ( = ?auto_236478 ?auto_236486 ) ) ( not ( = ?auto_236478 ?auto_236487 ) ) ( not ( = ?auto_236478 ?auto_236488 ) ) ( not ( = ?auto_236479 ?auto_236480 ) ) ( not ( = ?auto_236479 ?auto_236481 ) ) ( not ( = ?auto_236479 ?auto_236482 ) ) ( not ( = ?auto_236479 ?auto_236483 ) ) ( not ( = ?auto_236479 ?auto_236484 ) ) ( not ( = ?auto_236479 ?auto_236485 ) ) ( not ( = ?auto_236479 ?auto_236486 ) ) ( not ( = ?auto_236479 ?auto_236487 ) ) ( not ( = ?auto_236479 ?auto_236488 ) ) ( not ( = ?auto_236480 ?auto_236481 ) ) ( not ( = ?auto_236480 ?auto_236482 ) ) ( not ( = ?auto_236480 ?auto_236483 ) ) ( not ( = ?auto_236480 ?auto_236484 ) ) ( not ( = ?auto_236480 ?auto_236485 ) ) ( not ( = ?auto_236480 ?auto_236486 ) ) ( not ( = ?auto_236480 ?auto_236487 ) ) ( not ( = ?auto_236480 ?auto_236488 ) ) ( not ( = ?auto_236481 ?auto_236482 ) ) ( not ( = ?auto_236481 ?auto_236483 ) ) ( not ( = ?auto_236481 ?auto_236484 ) ) ( not ( = ?auto_236481 ?auto_236485 ) ) ( not ( = ?auto_236481 ?auto_236486 ) ) ( not ( = ?auto_236481 ?auto_236487 ) ) ( not ( = ?auto_236481 ?auto_236488 ) ) ( not ( = ?auto_236482 ?auto_236483 ) ) ( not ( = ?auto_236482 ?auto_236484 ) ) ( not ( = ?auto_236482 ?auto_236485 ) ) ( not ( = ?auto_236482 ?auto_236486 ) ) ( not ( = ?auto_236482 ?auto_236487 ) ) ( not ( = ?auto_236482 ?auto_236488 ) ) ( not ( = ?auto_236483 ?auto_236484 ) ) ( not ( = ?auto_236483 ?auto_236485 ) ) ( not ( = ?auto_236483 ?auto_236486 ) ) ( not ( = ?auto_236483 ?auto_236487 ) ) ( not ( = ?auto_236483 ?auto_236488 ) ) ( not ( = ?auto_236484 ?auto_236485 ) ) ( not ( = ?auto_236484 ?auto_236486 ) ) ( not ( = ?auto_236484 ?auto_236487 ) ) ( not ( = ?auto_236484 ?auto_236488 ) ) ( not ( = ?auto_236485 ?auto_236486 ) ) ( not ( = ?auto_236485 ?auto_236487 ) ) ( not ( = ?auto_236485 ?auto_236488 ) ) ( not ( = ?auto_236486 ?auto_236487 ) ) ( not ( = ?auto_236486 ?auto_236488 ) ) ( not ( = ?auto_236487 ?auto_236488 ) ) ( ON ?auto_236487 ?auto_236488 ) ( ON ?auto_236486 ?auto_236487 ) ( ON ?auto_236485 ?auto_236486 ) ( ON ?auto_236484 ?auto_236485 ) ( ON ?auto_236483 ?auto_236484 ) ( ON ?auto_236482 ?auto_236483 ) ( ON ?auto_236481 ?auto_236482 ) ( CLEAR ?auto_236479 ) ( ON ?auto_236480 ?auto_236481 ) ( CLEAR ?auto_236480 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_236476 ?auto_236477 ?auto_236478 ?auto_236479 ?auto_236480 )
      ( MAKE-13PILE ?auto_236476 ?auto_236477 ?auto_236478 ?auto_236479 ?auto_236480 ?auto_236481 ?auto_236482 ?auto_236483 ?auto_236484 ?auto_236485 ?auto_236486 ?auto_236487 ?auto_236488 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_236502 - BLOCK
      ?auto_236503 - BLOCK
      ?auto_236504 - BLOCK
      ?auto_236505 - BLOCK
      ?auto_236506 - BLOCK
      ?auto_236507 - BLOCK
      ?auto_236508 - BLOCK
      ?auto_236509 - BLOCK
      ?auto_236510 - BLOCK
      ?auto_236511 - BLOCK
      ?auto_236512 - BLOCK
      ?auto_236513 - BLOCK
      ?auto_236514 - BLOCK
    )
    :vars
    (
      ?auto_236515 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_236514 ?auto_236515 ) ( ON-TABLE ?auto_236502 ) ( ON ?auto_236503 ?auto_236502 ) ( ON ?auto_236504 ?auto_236503 ) ( not ( = ?auto_236502 ?auto_236503 ) ) ( not ( = ?auto_236502 ?auto_236504 ) ) ( not ( = ?auto_236502 ?auto_236505 ) ) ( not ( = ?auto_236502 ?auto_236506 ) ) ( not ( = ?auto_236502 ?auto_236507 ) ) ( not ( = ?auto_236502 ?auto_236508 ) ) ( not ( = ?auto_236502 ?auto_236509 ) ) ( not ( = ?auto_236502 ?auto_236510 ) ) ( not ( = ?auto_236502 ?auto_236511 ) ) ( not ( = ?auto_236502 ?auto_236512 ) ) ( not ( = ?auto_236502 ?auto_236513 ) ) ( not ( = ?auto_236502 ?auto_236514 ) ) ( not ( = ?auto_236502 ?auto_236515 ) ) ( not ( = ?auto_236503 ?auto_236504 ) ) ( not ( = ?auto_236503 ?auto_236505 ) ) ( not ( = ?auto_236503 ?auto_236506 ) ) ( not ( = ?auto_236503 ?auto_236507 ) ) ( not ( = ?auto_236503 ?auto_236508 ) ) ( not ( = ?auto_236503 ?auto_236509 ) ) ( not ( = ?auto_236503 ?auto_236510 ) ) ( not ( = ?auto_236503 ?auto_236511 ) ) ( not ( = ?auto_236503 ?auto_236512 ) ) ( not ( = ?auto_236503 ?auto_236513 ) ) ( not ( = ?auto_236503 ?auto_236514 ) ) ( not ( = ?auto_236503 ?auto_236515 ) ) ( not ( = ?auto_236504 ?auto_236505 ) ) ( not ( = ?auto_236504 ?auto_236506 ) ) ( not ( = ?auto_236504 ?auto_236507 ) ) ( not ( = ?auto_236504 ?auto_236508 ) ) ( not ( = ?auto_236504 ?auto_236509 ) ) ( not ( = ?auto_236504 ?auto_236510 ) ) ( not ( = ?auto_236504 ?auto_236511 ) ) ( not ( = ?auto_236504 ?auto_236512 ) ) ( not ( = ?auto_236504 ?auto_236513 ) ) ( not ( = ?auto_236504 ?auto_236514 ) ) ( not ( = ?auto_236504 ?auto_236515 ) ) ( not ( = ?auto_236505 ?auto_236506 ) ) ( not ( = ?auto_236505 ?auto_236507 ) ) ( not ( = ?auto_236505 ?auto_236508 ) ) ( not ( = ?auto_236505 ?auto_236509 ) ) ( not ( = ?auto_236505 ?auto_236510 ) ) ( not ( = ?auto_236505 ?auto_236511 ) ) ( not ( = ?auto_236505 ?auto_236512 ) ) ( not ( = ?auto_236505 ?auto_236513 ) ) ( not ( = ?auto_236505 ?auto_236514 ) ) ( not ( = ?auto_236505 ?auto_236515 ) ) ( not ( = ?auto_236506 ?auto_236507 ) ) ( not ( = ?auto_236506 ?auto_236508 ) ) ( not ( = ?auto_236506 ?auto_236509 ) ) ( not ( = ?auto_236506 ?auto_236510 ) ) ( not ( = ?auto_236506 ?auto_236511 ) ) ( not ( = ?auto_236506 ?auto_236512 ) ) ( not ( = ?auto_236506 ?auto_236513 ) ) ( not ( = ?auto_236506 ?auto_236514 ) ) ( not ( = ?auto_236506 ?auto_236515 ) ) ( not ( = ?auto_236507 ?auto_236508 ) ) ( not ( = ?auto_236507 ?auto_236509 ) ) ( not ( = ?auto_236507 ?auto_236510 ) ) ( not ( = ?auto_236507 ?auto_236511 ) ) ( not ( = ?auto_236507 ?auto_236512 ) ) ( not ( = ?auto_236507 ?auto_236513 ) ) ( not ( = ?auto_236507 ?auto_236514 ) ) ( not ( = ?auto_236507 ?auto_236515 ) ) ( not ( = ?auto_236508 ?auto_236509 ) ) ( not ( = ?auto_236508 ?auto_236510 ) ) ( not ( = ?auto_236508 ?auto_236511 ) ) ( not ( = ?auto_236508 ?auto_236512 ) ) ( not ( = ?auto_236508 ?auto_236513 ) ) ( not ( = ?auto_236508 ?auto_236514 ) ) ( not ( = ?auto_236508 ?auto_236515 ) ) ( not ( = ?auto_236509 ?auto_236510 ) ) ( not ( = ?auto_236509 ?auto_236511 ) ) ( not ( = ?auto_236509 ?auto_236512 ) ) ( not ( = ?auto_236509 ?auto_236513 ) ) ( not ( = ?auto_236509 ?auto_236514 ) ) ( not ( = ?auto_236509 ?auto_236515 ) ) ( not ( = ?auto_236510 ?auto_236511 ) ) ( not ( = ?auto_236510 ?auto_236512 ) ) ( not ( = ?auto_236510 ?auto_236513 ) ) ( not ( = ?auto_236510 ?auto_236514 ) ) ( not ( = ?auto_236510 ?auto_236515 ) ) ( not ( = ?auto_236511 ?auto_236512 ) ) ( not ( = ?auto_236511 ?auto_236513 ) ) ( not ( = ?auto_236511 ?auto_236514 ) ) ( not ( = ?auto_236511 ?auto_236515 ) ) ( not ( = ?auto_236512 ?auto_236513 ) ) ( not ( = ?auto_236512 ?auto_236514 ) ) ( not ( = ?auto_236512 ?auto_236515 ) ) ( not ( = ?auto_236513 ?auto_236514 ) ) ( not ( = ?auto_236513 ?auto_236515 ) ) ( not ( = ?auto_236514 ?auto_236515 ) ) ( ON ?auto_236513 ?auto_236514 ) ( ON ?auto_236512 ?auto_236513 ) ( ON ?auto_236511 ?auto_236512 ) ( ON ?auto_236510 ?auto_236511 ) ( ON ?auto_236509 ?auto_236510 ) ( ON ?auto_236508 ?auto_236509 ) ( ON ?auto_236507 ?auto_236508 ) ( ON ?auto_236506 ?auto_236507 ) ( CLEAR ?auto_236504 ) ( ON ?auto_236505 ?auto_236506 ) ( CLEAR ?auto_236505 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_236502 ?auto_236503 ?auto_236504 ?auto_236505 )
      ( MAKE-13PILE ?auto_236502 ?auto_236503 ?auto_236504 ?auto_236505 ?auto_236506 ?auto_236507 ?auto_236508 ?auto_236509 ?auto_236510 ?auto_236511 ?auto_236512 ?auto_236513 ?auto_236514 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_236529 - BLOCK
      ?auto_236530 - BLOCK
      ?auto_236531 - BLOCK
      ?auto_236532 - BLOCK
      ?auto_236533 - BLOCK
      ?auto_236534 - BLOCK
      ?auto_236535 - BLOCK
      ?auto_236536 - BLOCK
      ?auto_236537 - BLOCK
      ?auto_236538 - BLOCK
      ?auto_236539 - BLOCK
      ?auto_236540 - BLOCK
      ?auto_236541 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_236541 ) ( ON-TABLE ?auto_236529 ) ( ON ?auto_236530 ?auto_236529 ) ( ON ?auto_236531 ?auto_236530 ) ( not ( = ?auto_236529 ?auto_236530 ) ) ( not ( = ?auto_236529 ?auto_236531 ) ) ( not ( = ?auto_236529 ?auto_236532 ) ) ( not ( = ?auto_236529 ?auto_236533 ) ) ( not ( = ?auto_236529 ?auto_236534 ) ) ( not ( = ?auto_236529 ?auto_236535 ) ) ( not ( = ?auto_236529 ?auto_236536 ) ) ( not ( = ?auto_236529 ?auto_236537 ) ) ( not ( = ?auto_236529 ?auto_236538 ) ) ( not ( = ?auto_236529 ?auto_236539 ) ) ( not ( = ?auto_236529 ?auto_236540 ) ) ( not ( = ?auto_236529 ?auto_236541 ) ) ( not ( = ?auto_236530 ?auto_236531 ) ) ( not ( = ?auto_236530 ?auto_236532 ) ) ( not ( = ?auto_236530 ?auto_236533 ) ) ( not ( = ?auto_236530 ?auto_236534 ) ) ( not ( = ?auto_236530 ?auto_236535 ) ) ( not ( = ?auto_236530 ?auto_236536 ) ) ( not ( = ?auto_236530 ?auto_236537 ) ) ( not ( = ?auto_236530 ?auto_236538 ) ) ( not ( = ?auto_236530 ?auto_236539 ) ) ( not ( = ?auto_236530 ?auto_236540 ) ) ( not ( = ?auto_236530 ?auto_236541 ) ) ( not ( = ?auto_236531 ?auto_236532 ) ) ( not ( = ?auto_236531 ?auto_236533 ) ) ( not ( = ?auto_236531 ?auto_236534 ) ) ( not ( = ?auto_236531 ?auto_236535 ) ) ( not ( = ?auto_236531 ?auto_236536 ) ) ( not ( = ?auto_236531 ?auto_236537 ) ) ( not ( = ?auto_236531 ?auto_236538 ) ) ( not ( = ?auto_236531 ?auto_236539 ) ) ( not ( = ?auto_236531 ?auto_236540 ) ) ( not ( = ?auto_236531 ?auto_236541 ) ) ( not ( = ?auto_236532 ?auto_236533 ) ) ( not ( = ?auto_236532 ?auto_236534 ) ) ( not ( = ?auto_236532 ?auto_236535 ) ) ( not ( = ?auto_236532 ?auto_236536 ) ) ( not ( = ?auto_236532 ?auto_236537 ) ) ( not ( = ?auto_236532 ?auto_236538 ) ) ( not ( = ?auto_236532 ?auto_236539 ) ) ( not ( = ?auto_236532 ?auto_236540 ) ) ( not ( = ?auto_236532 ?auto_236541 ) ) ( not ( = ?auto_236533 ?auto_236534 ) ) ( not ( = ?auto_236533 ?auto_236535 ) ) ( not ( = ?auto_236533 ?auto_236536 ) ) ( not ( = ?auto_236533 ?auto_236537 ) ) ( not ( = ?auto_236533 ?auto_236538 ) ) ( not ( = ?auto_236533 ?auto_236539 ) ) ( not ( = ?auto_236533 ?auto_236540 ) ) ( not ( = ?auto_236533 ?auto_236541 ) ) ( not ( = ?auto_236534 ?auto_236535 ) ) ( not ( = ?auto_236534 ?auto_236536 ) ) ( not ( = ?auto_236534 ?auto_236537 ) ) ( not ( = ?auto_236534 ?auto_236538 ) ) ( not ( = ?auto_236534 ?auto_236539 ) ) ( not ( = ?auto_236534 ?auto_236540 ) ) ( not ( = ?auto_236534 ?auto_236541 ) ) ( not ( = ?auto_236535 ?auto_236536 ) ) ( not ( = ?auto_236535 ?auto_236537 ) ) ( not ( = ?auto_236535 ?auto_236538 ) ) ( not ( = ?auto_236535 ?auto_236539 ) ) ( not ( = ?auto_236535 ?auto_236540 ) ) ( not ( = ?auto_236535 ?auto_236541 ) ) ( not ( = ?auto_236536 ?auto_236537 ) ) ( not ( = ?auto_236536 ?auto_236538 ) ) ( not ( = ?auto_236536 ?auto_236539 ) ) ( not ( = ?auto_236536 ?auto_236540 ) ) ( not ( = ?auto_236536 ?auto_236541 ) ) ( not ( = ?auto_236537 ?auto_236538 ) ) ( not ( = ?auto_236537 ?auto_236539 ) ) ( not ( = ?auto_236537 ?auto_236540 ) ) ( not ( = ?auto_236537 ?auto_236541 ) ) ( not ( = ?auto_236538 ?auto_236539 ) ) ( not ( = ?auto_236538 ?auto_236540 ) ) ( not ( = ?auto_236538 ?auto_236541 ) ) ( not ( = ?auto_236539 ?auto_236540 ) ) ( not ( = ?auto_236539 ?auto_236541 ) ) ( not ( = ?auto_236540 ?auto_236541 ) ) ( ON ?auto_236540 ?auto_236541 ) ( ON ?auto_236539 ?auto_236540 ) ( ON ?auto_236538 ?auto_236539 ) ( ON ?auto_236537 ?auto_236538 ) ( ON ?auto_236536 ?auto_236537 ) ( ON ?auto_236535 ?auto_236536 ) ( ON ?auto_236534 ?auto_236535 ) ( ON ?auto_236533 ?auto_236534 ) ( CLEAR ?auto_236531 ) ( ON ?auto_236532 ?auto_236533 ) ( CLEAR ?auto_236532 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_236529 ?auto_236530 ?auto_236531 ?auto_236532 )
      ( MAKE-13PILE ?auto_236529 ?auto_236530 ?auto_236531 ?auto_236532 ?auto_236533 ?auto_236534 ?auto_236535 ?auto_236536 ?auto_236537 ?auto_236538 ?auto_236539 ?auto_236540 ?auto_236541 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_236555 - BLOCK
      ?auto_236556 - BLOCK
      ?auto_236557 - BLOCK
      ?auto_236558 - BLOCK
      ?auto_236559 - BLOCK
      ?auto_236560 - BLOCK
      ?auto_236561 - BLOCK
      ?auto_236562 - BLOCK
      ?auto_236563 - BLOCK
      ?auto_236564 - BLOCK
      ?auto_236565 - BLOCK
      ?auto_236566 - BLOCK
      ?auto_236567 - BLOCK
    )
    :vars
    (
      ?auto_236568 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_236567 ?auto_236568 ) ( ON-TABLE ?auto_236555 ) ( ON ?auto_236556 ?auto_236555 ) ( not ( = ?auto_236555 ?auto_236556 ) ) ( not ( = ?auto_236555 ?auto_236557 ) ) ( not ( = ?auto_236555 ?auto_236558 ) ) ( not ( = ?auto_236555 ?auto_236559 ) ) ( not ( = ?auto_236555 ?auto_236560 ) ) ( not ( = ?auto_236555 ?auto_236561 ) ) ( not ( = ?auto_236555 ?auto_236562 ) ) ( not ( = ?auto_236555 ?auto_236563 ) ) ( not ( = ?auto_236555 ?auto_236564 ) ) ( not ( = ?auto_236555 ?auto_236565 ) ) ( not ( = ?auto_236555 ?auto_236566 ) ) ( not ( = ?auto_236555 ?auto_236567 ) ) ( not ( = ?auto_236555 ?auto_236568 ) ) ( not ( = ?auto_236556 ?auto_236557 ) ) ( not ( = ?auto_236556 ?auto_236558 ) ) ( not ( = ?auto_236556 ?auto_236559 ) ) ( not ( = ?auto_236556 ?auto_236560 ) ) ( not ( = ?auto_236556 ?auto_236561 ) ) ( not ( = ?auto_236556 ?auto_236562 ) ) ( not ( = ?auto_236556 ?auto_236563 ) ) ( not ( = ?auto_236556 ?auto_236564 ) ) ( not ( = ?auto_236556 ?auto_236565 ) ) ( not ( = ?auto_236556 ?auto_236566 ) ) ( not ( = ?auto_236556 ?auto_236567 ) ) ( not ( = ?auto_236556 ?auto_236568 ) ) ( not ( = ?auto_236557 ?auto_236558 ) ) ( not ( = ?auto_236557 ?auto_236559 ) ) ( not ( = ?auto_236557 ?auto_236560 ) ) ( not ( = ?auto_236557 ?auto_236561 ) ) ( not ( = ?auto_236557 ?auto_236562 ) ) ( not ( = ?auto_236557 ?auto_236563 ) ) ( not ( = ?auto_236557 ?auto_236564 ) ) ( not ( = ?auto_236557 ?auto_236565 ) ) ( not ( = ?auto_236557 ?auto_236566 ) ) ( not ( = ?auto_236557 ?auto_236567 ) ) ( not ( = ?auto_236557 ?auto_236568 ) ) ( not ( = ?auto_236558 ?auto_236559 ) ) ( not ( = ?auto_236558 ?auto_236560 ) ) ( not ( = ?auto_236558 ?auto_236561 ) ) ( not ( = ?auto_236558 ?auto_236562 ) ) ( not ( = ?auto_236558 ?auto_236563 ) ) ( not ( = ?auto_236558 ?auto_236564 ) ) ( not ( = ?auto_236558 ?auto_236565 ) ) ( not ( = ?auto_236558 ?auto_236566 ) ) ( not ( = ?auto_236558 ?auto_236567 ) ) ( not ( = ?auto_236558 ?auto_236568 ) ) ( not ( = ?auto_236559 ?auto_236560 ) ) ( not ( = ?auto_236559 ?auto_236561 ) ) ( not ( = ?auto_236559 ?auto_236562 ) ) ( not ( = ?auto_236559 ?auto_236563 ) ) ( not ( = ?auto_236559 ?auto_236564 ) ) ( not ( = ?auto_236559 ?auto_236565 ) ) ( not ( = ?auto_236559 ?auto_236566 ) ) ( not ( = ?auto_236559 ?auto_236567 ) ) ( not ( = ?auto_236559 ?auto_236568 ) ) ( not ( = ?auto_236560 ?auto_236561 ) ) ( not ( = ?auto_236560 ?auto_236562 ) ) ( not ( = ?auto_236560 ?auto_236563 ) ) ( not ( = ?auto_236560 ?auto_236564 ) ) ( not ( = ?auto_236560 ?auto_236565 ) ) ( not ( = ?auto_236560 ?auto_236566 ) ) ( not ( = ?auto_236560 ?auto_236567 ) ) ( not ( = ?auto_236560 ?auto_236568 ) ) ( not ( = ?auto_236561 ?auto_236562 ) ) ( not ( = ?auto_236561 ?auto_236563 ) ) ( not ( = ?auto_236561 ?auto_236564 ) ) ( not ( = ?auto_236561 ?auto_236565 ) ) ( not ( = ?auto_236561 ?auto_236566 ) ) ( not ( = ?auto_236561 ?auto_236567 ) ) ( not ( = ?auto_236561 ?auto_236568 ) ) ( not ( = ?auto_236562 ?auto_236563 ) ) ( not ( = ?auto_236562 ?auto_236564 ) ) ( not ( = ?auto_236562 ?auto_236565 ) ) ( not ( = ?auto_236562 ?auto_236566 ) ) ( not ( = ?auto_236562 ?auto_236567 ) ) ( not ( = ?auto_236562 ?auto_236568 ) ) ( not ( = ?auto_236563 ?auto_236564 ) ) ( not ( = ?auto_236563 ?auto_236565 ) ) ( not ( = ?auto_236563 ?auto_236566 ) ) ( not ( = ?auto_236563 ?auto_236567 ) ) ( not ( = ?auto_236563 ?auto_236568 ) ) ( not ( = ?auto_236564 ?auto_236565 ) ) ( not ( = ?auto_236564 ?auto_236566 ) ) ( not ( = ?auto_236564 ?auto_236567 ) ) ( not ( = ?auto_236564 ?auto_236568 ) ) ( not ( = ?auto_236565 ?auto_236566 ) ) ( not ( = ?auto_236565 ?auto_236567 ) ) ( not ( = ?auto_236565 ?auto_236568 ) ) ( not ( = ?auto_236566 ?auto_236567 ) ) ( not ( = ?auto_236566 ?auto_236568 ) ) ( not ( = ?auto_236567 ?auto_236568 ) ) ( ON ?auto_236566 ?auto_236567 ) ( ON ?auto_236565 ?auto_236566 ) ( ON ?auto_236564 ?auto_236565 ) ( ON ?auto_236563 ?auto_236564 ) ( ON ?auto_236562 ?auto_236563 ) ( ON ?auto_236561 ?auto_236562 ) ( ON ?auto_236560 ?auto_236561 ) ( ON ?auto_236559 ?auto_236560 ) ( ON ?auto_236558 ?auto_236559 ) ( CLEAR ?auto_236556 ) ( ON ?auto_236557 ?auto_236558 ) ( CLEAR ?auto_236557 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_236555 ?auto_236556 ?auto_236557 )
      ( MAKE-13PILE ?auto_236555 ?auto_236556 ?auto_236557 ?auto_236558 ?auto_236559 ?auto_236560 ?auto_236561 ?auto_236562 ?auto_236563 ?auto_236564 ?auto_236565 ?auto_236566 ?auto_236567 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_236582 - BLOCK
      ?auto_236583 - BLOCK
      ?auto_236584 - BLOCK
      ?auto_236585 - BLOCK
      ?auto_236586 - BLOCK
      ?auto_236587 - BLOCK
      ?auto_236588 - BLOCK
      ?auto_236589 - BLOCK
      ?auto_236590 - BLOCK
      ?auto_236591 - BLOCK
      ?auto_236592 - BLOCK
      ?auto_236593 - BLOCK
      ?auto_236594 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_236594 ) ( ON-TABLE ?auto_236582 ) ( ON ?auto_236583 ?auto_236582 ) ( not ( = ?auto_236582 ?auto_236583 ) ) ( not ( = ?auto_236582 ?auto_236584 ) ) ( not ( = ?auto_236582 ?auto_236585 ) ) ( not ( = ?auto_236582 ?auto_236586 ) ) ( not ( = ?auto_236582 ?auto_236587 ) ) ( not ( = ?auto_236582 ?auto_236588 ) ) ( not ( = ?auto_236582 ?auto_236589 ) ) ( not ( = ?auto_236582 ?auto_236590 ) ) ( not ( = ?auto_236582 ?auto_236591 ) ) ( not ( = ?auto_236582 ?auto_236592 ) ) ( not ( = ?auto_236582 ?auto_236593 ) ) ( not ( = ?auto_236582 ?auto_236594 ) ) ( not ( = ?auto_236583 ?auto_236584 ) ) ( not ( = ?auto_236583 ?auto_236585 ) ) ( not ( = ?auto_236583 ?auto_236586 ) ) ( not ( = ?auto_236583 ?auto_236587 ) ) ( not ( = ?auto_236583 ?auto_236588 ) ) ( not ( = ?auto_236583 ?auto_236589 ) ) ( not ( = ?auto_236583 ?auto_236590 ) ) ( not ( = ?auto_236583 ?auto_236591 ) ) ( not ( = ?auto_236583 ?auto_236592 ) ) ( not ( = ?auto_236583 ?auto_236593 ) ) ( not ( = ?auto_236583 ?auto_236594 ) ) ( not ( = ?auto_236584 ?auto_236585 ) ) ( not ( = ?auto_236584 ?auto_236586 ) ) ( not ( = ?auto_236584 ?auto_236587 ) ) ( not ( = ?auto_236584 ?auto_236588 ) ) ( not ( = ?auto_236584 ?auto_236589 ) ) ( not ( = ?auto_236584 ?auto_236590 ) ) ( not ( = ?auto_236584 ?auto_236591 ) ) ( not ( = ?auto_236584 ?auto_236592 ) ) ( not ( = ?auto_236584 ?auto_236593 ) ) ( not ( = ?auto_236584 ?auto_236594 ) ) ( not ( = ?auto_236585 ?auto_236586 ) ) ( not ( = ?auto_236585 ?auto_236587 ) ) ( not ( = ?auto_236585 ?auto_236588 ) ) ( not ( = ?auto_236585 ?auto_236589 ) ) ( not ( = ?auto_236585 ?auto_236590 ) ) ( not ( = ?auto_236585 ?auto_236591 ) ) ( not ( = ?auto_236585 ?auto_236592 ) ) ( not ( = ?auto_236585 ?auto_236593 ) ) ( not ( = ?auto_236585 ?auto_236594 ) ) ( not ( = ?auto_236586 ?auto_236587 ) ) ( not ( = ?auto_236586 ?auto_236588 ) ) ( not ( = ?auto_236586 ?auto_236589 ) ) ( not ( = ?auto_236586 ?auto_236590 ) ) ( not ( = ?auto_236586 ?auto_236591 ) ) ( not ( = ?auto_236586 ?auto_236592 ) ) ( not ( = ?auto_236586 ?auto_236593 ) ) ( not ( = ?auto_236586 ?auto_236594 ) ) ( not ( = ?auto_236587 ?auto_236588 ) ) ( not ( = ?auto_236587 ?auto_236589 ) ) ( not ( = ?auto_236587 ?auto_236590 ) ) ( not ( = ?auto_236587 ?auto_236591 ) ) ( not ( = ?auto_236587 ?auto_236592 ) ) ( not ( = ?auto_236587 ?auto_236593 ) ) ( not ( = ?auto_236587 ?auto_236594 ) ) ( not ( = ?auto_236588 ?auto_236589 ) ) ( not ( = ?auto_236588 ?auto_236590 ) ) ( not ( = ?auto_236588 ?auto_236591 ) ) ( not ( = ?auto_236588 ?auto_236592 ) ) ( not ( = ?auto_236588 ?auto_236593 ) ) ( not ( = ?auto_236588 ?auto_236594 ) ) ( not ( = ?auto_236589 ?auto_236590 ) ) ( not ( = ?auto_236589 ?auto_236591 ) ) ( not ( = ?auto_236589 ?auto_236592 ) ) ( not ( = ?auto_236589 ?auto_236593 ) ) ( not ( = ?auto_236589 ?auto_236594 ) ) ( not ( = ?auto_236590 ?auto_236591 ) ) ( not ( = ?auto_236590 ?auto_236592 ) ) ( not ( = ?auto_236590 ?auto_236593 ) ) ( not ( = ?auto_236590 ?auto_236594 ) ) ( not ( = ?auto_236591 ?auto_236592 ) ) ( not ( = ?auto_236591 ?auto_236593 ) ) ( not ( = ?auto_236591 ?auto_236594 ) ) ( not ( = ?auto_236592 ?auto_236593 ) ) ( not ( = ?auto_236592 ?auto_236594 ) ) ( not ( = ?auto_236593 ?auto_236594 ) ) ( ON ?auto_236593 ?auto_236594 ) ( ON ?auto_236592 ?auto_236593 ) ( ON ?auto_236591 ?auto_236592 ) ( ON ?auto_236590 ?auto_236591 ) ( ON ?auto_236589 ?auto_236590 ) ( ON ?auto_236588 ?auto_236589 ) ( ON ?auto_236587 ?auto_236588 ) ( ON ?auto_236586 ?auto_236587 ) ( ON ?auto_236585 ?auto_236586 ) ( CLEAR ?auto_236583 ) ( ON ?auto_236584 ?auto_236585 ) ( CLEAR ?auto_236584 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_236582 ?auto_236583 ?auto_236584 )
      ( MAKE-13PILE ?auto_236582 ?auto_236583 ?auto_236584 ?auto_236585 ?auto_236586 ?auto_236587 ?auto_236588 ?auto_236589 ?auto_236590 ?auto_236591 ?auto_236592 ?auto_236593 ?auto_236594 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_236608 - BLOCK
      ?auto_236609 - BLOCK
      ?auto_236610 - BLOCK
      ?auto_236611 - BLOCK
      ?auto_236612 - BLOCK
      ?auto_236613 - BLOCK
      ?auto_236614 - BLOCK
      ?auto_236615 - BLOCK
      ?auto_236616 - BLOCK
      ?auto_236617 - BLOCK
      ?auto_236618 - BLOCK
      ?auto_236619 - BLOCK
      ?auto_236620 - BLOCK
    )
    :vars
    (
      ?auto_236621 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_236620 ?auto_236621 ) ( ON-TABLE ?auto_236608 ) ( not ( = ?auto_236608 ?auto_236609 ) ) ( not ( = ?auto_236608 ?auto_236610 ) ) ( not ( = ?auto_236608 ?auto_236611 ) ) ( not ( = ?auto_236608 ?auto_236612 ) ) ( not ( = ?auto_236608 ?auto_236613 ) ) ( not ( = ?auto_236608 ?auto_236614 ) ) ( not ( = ?auto_236608 ?auto_236615 ) ) ( not ( = ?auto_236608 ?auto_236616 ) ) ( not ( = ?auto_236608 ?auto_236617 ) ) ( not ( = ?auto_236608 ?auto_236618 ) ) ( not ( = ?auto_236608 ?auto_236619 ) ) ( not ( = ?auto_236608 ?auto_236620 ) ) ( not ( = ?auto_236608 ?auto_236621 ) ) ( not ( = ?auto_236609 ?auto_236610 ) ) ( not ( = ?auto_236609 ?auto_236611 ) ) ( not ( = ?auto_236609 ?auto_236612 ) ) ( not ( = ?auto_236609 ?auto_236613 ) ) ( not ( = ?auto_236609 ?auto_236614 ) ) ( not ( = ?auto_236609 ?auto_236615 ) ) ( not ( = ?auto_236609 ?auto_236616 ) ) ( not ( = ?auto_236609 ?auto_236617 ) ) ( not ( = ?auto_236609 ?auto_236618 ) ) ( not ( = ?auto_236609 ?auto_236619 ) ) ( not ( = ?auto_236609 ?auto_236620 ) ) ( not ( = ?auto_236609 ?auto_236621 ) ) ( not ( = ?auto_236610 ?auto_236611 ) ) ( not ( = ?auto_236610 ?auto_236612 ) ) ( not ( = ?auto_236610 ?auto_236613 ) ) ( not ( = ?auto_236610 ?auto_236614 ) ) ( not ( = ?auto_236610 ?auto_236615 ) ) ( not ( = ?auto_236610 ?auto_236616 ) ) ( not ( = ?auto_236610 ?auto_236617 ) ) ( not ( = ?auto_236610 ?auto_236618 ) ) ( not ( = ?auto_236610 ?auto_236619 ) ) ( not ( = ?auto_236610 ?auto_236620 ) ) ( not ( = ?auto_236610 ?auto_236621 ) ) ( not ( = ?auto_236611 ?auto_236612 ) ) ( not ( = ?auto_236611 ?auto_236613 ) ) ( not ( = ?auto_236611 ?auto_236614 ) ) ( not ( = ?auto_236611 ?auto_236615 ) ) ( not ( = ?auto_236611 ?auto_236616 ) ) ( not ( = ?auto_236611 ?auto_236617 ) ) ( not ( = ?auto_236611 ?auto_236618 ) ) ( not ( = ?auto_236611 ?auto_236619 ) ) ( not ( = ?auto_236611 ?auto_236620 ) ) ( not ( = ?auto_236611 ?auto_236621 ) ) ( not ( = ?auto_236612 ?auto_236613 ) ) ( not ( = ?auto_236612 ?auto_236614 ) ) ( not ( = ?auto_236612 ?auto_236615 ) ) ( not ( = ?auto_236612 ?auto_236616 ) ) ( not ( = ?auto_236612 ?auto_236617 ) ) ( not ( = ?auto_236612 ?auto_236618 ) ) ( not ( = ?auto_236612 ?auto_236619 ) ) ( not ( = ?auto_236612 ?auto_236620 ) ) ( not ( = ?auto_236612 ?auto_236621 ) ) ( not ( = ?auto_236613 ?auto_236614 ) ) ( not ( = ?auto_236613 ?auto_236615 ) ) ( not ( = ?auto_236613 ?auto_236616 ) ) ( not ( = ?auto_236613 ?auto_236617 ) ) ( not ( = ?auto_236613 ?auto_236618 ) ) ( not ( = ?auto_236613 ?auto_236619 ) ) ( not ( = ?auto_236613 ?auto_236620 ) ) ( not ( = ?auto_236613 ?auto_236621 ) ) ( not ( = ?auto_236614 ?auto_236615 ) ) ( not ( = ?auto_236614 ?auto_236616 ) ) ( not ( = ?auto_236614 ?auto_236617 ) ) ( not ( = ?auto_236614 ?auto_236618 ) ) ( not ( = ?auto_236614 ?auto_236619 ) ) ( not ( = ?auto_236614 ?auto_236620 ) ) ( not ( = ?auto_236614 ?auto_236621 ) ) ( not ( = ?auto_236615 ?auto_236616 ) ) ( not ( = ?auto_236615 ?auto_236617 ) ) ( not ( = ?auto_236615 ?auto_236618 ) ) ( not ( = ?auto_236615 ?auto_236619 ) ) ( not ( = ?auto_236615 ?auto_236620 ) ) ( not ( = ?auto_236615 ?auto_236621 ) ) ( not ( = ?auto_236616 ?auto_236617 ) ) ( not ( = ?auto_236616 ?auto_236618 ) ) ( not ( = ?auto_236616 ?auto_236619 ) ) ( not ( = ?auto_236616 ?auto_236620 ) ) ( not ( = ?auto_236616 ?auto_236621 ) ) ( not ( = ?auto_236617 ?auto_236618 ) ) ( not ( = ?auto_236617 ?auto_236619 ) ) ( not ( = ?auto_236617 ?auto_236620 ) ) ( not ( = ?auto_236617 ?auto_236621 ) ) ( not ( = ?auto_236618 ?auto_236619 ) ) ( not ( = ?auto_236618 ?auto_236620 ) ) ( not ( = ?auto_236618 ?auto_236621 ) ) ( not ( = ?auto_236619 ?auto_236620 ) ) ( not ( = ?auto_236619 ?auto_236621 ) ) ( not ( = ?auto_236620 ?auto_236621 ) ) ( ON ?auto_236619 ?auto_236620 ) ( ON ?auto_236618 ?auto_236619 ) ( ON ?auto_236617 ?auto_236618 ) ( ON ?auto_236616 ?auto_236617 ) ( ON ?auto_236615 ?auto_236616 ) ( ON ?auto_236614 ?auto_236615 ) ( ON ?auto_236613 ?auto_236614 ) ( ON ?auto_236612 ?auto_236613 ) ( ON ?auto_236611 ?auto_236612 ) ( ON ?auto_236610 ?auto_236611 ) ( CLEAR ?auto_236608 ) ( ON ?auto_236609 ?auto_236610 ) ( CLEAR ?auto_236609 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_236608 ?auto_236609 )
      ( MAKE-13PILE ?auto_236608 ?auto_236609 ?auto_236610 ?auto_236611 ?auto_236612 ?auto_236613 ?auto_236614 ?auto_236615 ?auto_236616 ?auto_236617 ?auto_236618 ?auto_236619 ?auto_236620 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_236635 - BLOCK
      ?auto_236636 - BLOCK
      ?auto_236637 - BLOCK
      ?auto_236638 - BLOCK
      ?auto_236639 - BLOCK
      ?auto_236640 - BLOCK
      ?auto_236641 - BLOCK
      ?auto_236642 - BLOCK
      ?auto_236643 - BLOCK
      ?auto_236644 - BLOCK
      ?auto_236645 - BLOCK
      ?auto_236646 - BLOCK
      ?auto_236647 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_236647 ) ( ON-TABLE ?auto_236635 ) ( not ( = ?auto_236635 ?auto_236636 ) ) ( not ( = ?auto_236635 ?auto_236637 ) ) ( not ( = ?auto_236635 ?auto_236638 ) ) ( not ( = ?auto_236635 ?auto_236639 ) ) ( not ( = ?auto_236635 ?auto_236640 ) ) ( not ( = ?auto_236635 ?auto_236641 ) ) ( not ( = ?auto_236635 ?auto_236642 ) ) ( not ( = ?auto_236635 ?auto_236643 ) ) ( not ( = ?auto_236635 ?auto_236644 ) ) ( not ( = ?auto_236635 ?auto_236645 ) ) ( not ( = ?auto_236635 ?auto_236646 ) ) ( not ( = ?auto_236635 ?auto_236647 ) ) ( not ( = ?auto_236636 ?auto_236637 ) ) ( not ( = ?auto_236636 ?auto_236638 ) ) ( not ( = ?auto_236636 ?auto_236639 ) ) ( not ( = ?auto_236636 ?auto_236640 ) ) ( not ( = ?auto_236636 ?auto_236641 ) ) ( not ( = ?auto_236636 ?auto_236642 ) ) ( not ( = ?auto_236636 ?auto_236643 ) ) ( not ( = ?auto_236636 ?auto_236644 ) ) ( not ( = ?auto_236636 ?auto_236645 ) ) ( not ( = ?auto_236636 ?auto_236646 ) ) ( not ( = ?auto_236636 ?auto_236647 ) ) ( not ( = ?auto_236637 ?auto_236638 ) ) ( not ( = ?auto_236637 ?auto_236639 ) ) ( not ( = ?auto_236637 ?auto_236640 ) ) ( not ( = ?auto_236637 ?auto_236641 ) ) ( not ( = ?auto_236637 ?auto_236642 ) ) ( not ( = ?auto_236637 ?auto_236643 ) ) ( not ( = ?auto_236637 ?auto_236644 ) ) ( not ( = ?auto_236637 ?auto_236645 ) ) ( not ( = ?auto_236637 ?auto_236646 ) ) ( not ( = ?auto_236637 ?auto_236647 ) ) ( not ( = ?auto_236638 ?auto_236639 ) ) ( not ( = ?auto_236638 ?auto_236640 ) ) ( not ( = ?auto_236638 ?auto_236641 ) ) ( not ( = ?auto_236638 ?auto_236642 ) ) ( not ( = ?auto_236638 ?auto_236643 ) ) ( not ( = ?auto_236638 ?auto_236644 ) ) ( not ( = ?auto_236638 ?auto_236645 ) ) ( not ( = ?auto_236638 ?auto_236646 ) ) ( not ( = ?auto_236638 ?auto_236647 ) ) ( not ( = ?auto_236639 ?auto_236640 ) ) ( not ( = ?auto_236639 ?auto_236641 ) ) ( not ( = ?auto_236639 ?auto_236642 ) ) ( not ( = ?auto_236639 ?auto_236643 ) ) ( not ( = ?auto_236639 ?auto_236644 ) ) ( not ( = ?auto_236639 ?auto_236645 ) ) ( not ( = ?auto_236639 ?auto_236646 ) ) ( not ( = ?auto_236639 ?auto_236647 ) ) ( not ( = ?auto_236640 ?auto_236641 ) ) ( not ( = ?auto_236640 ?auto_236642 ) ) ( not ( = ?auto_236640 ?auto_236643 ) ) ( not ( = ?auto_236640 ?auto_236644 ) ) ( not ( = ?auto_236640 ?auto_236645 ) ) ( not ( = ?auto_236640 ?auto_236646 ) ) ( not ( = ?auto_236640 ?auto_236647 ) ) ( not ( = ?auto_236641 ?auto_236642 ) ) ( not ( = ?auto_236641 ?auto_236643 ) ) ( not ( = ?auto_236641 ?auto_236644 ) ) ( not ( = ?auto_236641 ?auto_236645 ) ) ( not ( = ?auto_236641 ?auto_236646 ) ) ( not ( = ?auto_236641 ?auto_236647 ) ) ( not ( = ?auto_236642 ?auto_236643 ) ) ( not ( = ?auto_236642 ?auto_236644 ) ) ( not ( = ?auto_236642 ?auto_236645 ) ) ( not ( = ?auto_236642 ?auto_236646 ) ) ( not ( = ?auto_236642 ?auto_236647 ) ) ( not ( = ?auto_236643 ?auto_236644 ) ) ( not ( = ?auto_236643 ?auto_236645 ) ) ( not ( = ?auto_236643 ?auto_236646 ) ) ( not ( = ?auto_236643 ?auto_236647 ) ) ( not ( = ?auto_236644 ?auto_236645 ) ) ( not ( = ?auto_236644 ?auto_236646 ) ) ( not ( = ?auto_236644 ?auto_236647 ) ) ( not ( = ?auto_236645 ?auto_236646 ) ) ( not ( = ?auto_236645 ?auto_236647 ) ) ( not ( = ?auto_236646 ?auto_236647 ) ) ( ON ?auto_236646 ?auto_236647 ) ( ON ?auto_236645 ?auto_236646 ) ( ON ?auto_236644 ?auto_236645 ) ( ON ?auto_236643 ?auto_236644 ) ( ON ?auto_236642 ?auto_236643 ) ( ON ?auto_236641 ?auto_236642 ) ( ON ?auto_236640 ?auto_236641 ) ( ON ?auto_236639 ?auto_236640 ) ( ON ?auto_236638 ?auto_236639 ) ( ON ?auto_236637 ?auto_236638 ) ( CLEAR ?auto_236635 ) ( ON ?auto_236636 ?auto_236637 ) ( CLEAR ?auto_236636 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_236635 ?auto_236636 )
      ( MAKE-13PILE ?auto_236635 ?auto_236636 ?auto_236637 ?auto_236638 ?auto_236639 ?auto_236640 ?auto_236641 ?auto_236642 ?auto_236643 ?auto_236644 ?auto_236645 ?auto_236646 ?auto_236647 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_236661 - BLOCK
      ?auto_236662 - BLOCK
      ?auto_236663 - BLOCK
      ?auto_236664 - BLOCK
      ?auto_236665 - BLOCK
      ?auto_236666 - BLOCK
      ?auto_236667 - BLOCK
      ?auto_236668 - BLOCK
      ?auto_236669 - BLOCK
      ?auto_236670 - BLOCK
      ?auto_236671 - BLOCK
      ?auto_236672 - BLOCK
      ?auto_236673 - BLOCK
    )
    :vars
    (
      ?auto_236674 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_236673 ?auto_236674 ) ( not ( = ?auto_236661 ?auto_236662 ) ) ( not ( = ?auto_236661 ?auto_236663 ) ) ( not ( = ?auto_236661 ?auto_236664 ) ) ( not ( = ?auto_236661 ?auto_236665 ) ) ( not ( = ?auto_236661 ?auto_236666 ) ) ( not ( = ?auto_236661 ?auto_236667 ) ) ( not ( = ?auto_236661 ?auto_236668 ) ) ( not ( = ?auto_236661 ?auto_236669 ) ) ( not ( = ?auto_236661 ?auto_236670 ) ) ( not ( = ?auto_236661 ?auto_236671 ) ) ( not ( = ?auto_236661 ?auto_236672 ) ) ( not ( = ?auto_236661 ?auto_236673 ) ) ( not ( = ?auto_236661 ?auto_236674 ) ) ( not ( = ?auto_236662 ?auto_236663 ) ) ( not ( = ?auto_236662 ?auto_236664 ) ) ( not ( = ?auto_236662 ?auto_236665 ) ) ( not ( = ?auto_236662 ?auto_236666 ) ) ( not ( = ?auto_236662 ?auto_236667 ) ) ( not ( = ?auto_236662 ?auto_236668 ) ) ( not ( = ?auto_236662 ?auto_236669 ) ) ( not ( = ?auto_236662 ?auto_236670 ) ) ( not ( = ?auto_236662 ?auto_236671 ) ) ( not ( = ?auto_236662 ?auto_236672 ) ) ( not ( = ?auto_236662 ?auto_236673 ) ) ( not ( = ?auto_236662 ?auto_236674 ) ) ( not ( = ?auto_236663 ?auto_236664 ) ) ( not ( = ?auto_236663 ?auto_236665 ) ) ( not ( = ?auto_236663 ?auto_236666 ) ) ( not ( = ?auto_236663 ?auto_236667 ) ) ( not ( = ?auto_236663 ?auto_236668 ) ) ( not ( = ?auto_236663 ?auto_236669 ) ) ( not ( = ?auto_236663 ?auto_236670 ) ) ( not ( = ?auto_236663 ?auto_236671 ) ) ( not ( = ?auto_236663 ?auto_236672 ) ) ( not ( = ?auto_236663 ?auto_236673 ) ) ( not ( = ?auto_236663 ?auto_236674 ) ) ( not ( = ?auto_236664 ?auto_236665 ) ) ( not ( = ?auto_236664 ?auto_236666 ) ) ( not ( = ?auto_236664 ?auto_236667 ) ) ( not ( = ?auto_236664 ?auto_236668 ) ) ( not ( = ?auto_236664 ?auto_236669 ) ) ( not ( = ?auto_236664 ?auto_236670 ) ) ( not ( = ?auto_236664 ?auto_236671 ) ) ( not ( = ?auto_236664 ?auto_236672 ) ) ( not ( = ?auto_236664 ?auto_236673 ) ) ( not ( = ?auto_236664 ?auto_236674 ) ) ( not ( = ?auto_236665 ?auto_236666 ) ) ( not ( = ?auto_236665 ?auto_236667 ) ) ( not ( = ?auto_236665 ?auto_236668 ) ) ( not ( = ?auto_236665 ?auto_236669 ) ) ( not ( = ?auto_236665 ?auto_236670 ) ) ( not ( = ?auto_236665 ?auto_236671 ) ) ( not ( = ?auto_236665 ?auto_236672 ) ) ( not ( = ?auto_236665 ?auto_236673 ) ) ( not ( = ?auto_236665 ?auto_236674 ) ) ( not ( = ?auto_236666 ?auto_236667 ) ) ( not ( = ?auto_236666 ?auto_236668 ) ) ( not ( = ?auto_236666 ?auto_236669 ) ) ( not ( = ?auto_236666 ?auto_236670 ) ) ( not ( = ?auto_236666 ?auto_236671 ) ) ( not ( = ?auto_236666 ?auto_236672 ) ) ( not ( = ?auto_236666 ?auto_236673 ) ) ( not ( = ?auto_236666 ?auto_236674 ) ) ( not ( = ?auto_236667 ?auto_236668 ) ) ( not ( = ?auto_236667 ?auto_236669 ) ) ( not ( = ?auto_236667 ?auto_236670 ) ) ( not ( = ?auto_236667 ?auto_236671 ) ) ( not ( = ?auto_236667 ?auto_236672 ) ) ( not ( = ?auto_236667 ?auto_236673 ) ) ( not ( = ?auto_236667 ?auto_236674 ) ) ( not ( = ?auto_236668 ?auto_236669 ) ) ( not ( = ?auto_236668 ?auto_236670 ) ) ( not ( = ?auto_236668 ?auto_236671 ) ) ( not ( = ?auto_236668 ?auto_236672 ) ) ( not ( = ?auto_236668 ?auto_236673 ) ) ( not ( = ?auto_236668 ?auto_236674 ) ) ( not ( = ?auto_236669 ?auto_236670 ) ) ( not ( = ?auto_236669 ?auto_236671 ) ) ( not ( = ?auto_236669 ?auto_236672 ) ) ( not ( = ?auto_236669 ?auto_236673 ) ) ( not ( = ?auto_236669 ?auto_236674 ) ) ( not ( = ?auto_236670 ?auto_236671 ) ) ( not ( = ?auto_236670 ?auto_236672 ) ) ( not ( = ?auto_236670 ?auto_236673 ) ) ( not ( = ?auto_236670 ?auto_236674 ) ) ( not ( = ?auto_236671 ?auto_236672 ) ) ( not ( = ?auto_236671 ?auto_236673 ) ) ( not ( = ?auto_236671 ?auto_236674 ) ) ( not ( = ?auto_236672 ?auto_236673 ) ) ( not ( = ?auto_236672 ?auto_236674 ) ) ( not ( = ?auto_236673 ?auto_236674 ) ) ( ON ?auto_236672 ?auto_236673 ) ( ON ?auto_236671 ?auto_236672 ) ( ON ?auto_236670 ?auto_236671 ) ( ON ?auto_236669 ?auto_236670 ) ( ON ?auto_236668 ?auto_236669 ) ( ON ?auto_236667 ?auto_236668 ) ( ON ?auto_236666 ?auto_236667 ) ( ON ?auto_236665 ?auto_236666 ) ( ON ?auto_236664 ?auto_236665 ) ( ON ?auto_236663 ?auto_236664 ) ( ON ?auto_236662 ?auto_236663 ) ( ON ?auto_236661 ?auto_236662 ) ( CLEAR ?auto_236661 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_236661 )
      ( MAKE-13PILE ?auto_236661 ?auto_236662 ?auto_236663 ?auto_236664 ?auto_236665 ?auto_236666 ?auto_236667 ?auto_236668 ?auto_236669 ?auto_236670 ?auto_236671 ?auto_236672 ?auto_236673 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_236688 - BLOCK
      ?auto_236689 - BLOCK
      ?auto_236690 - BLOCK
      ?auto_236691 - BLOCK
      ?auto_236692 - BLOCK
      ?auto_236693 - BLOCK
      ?auto_236694 - BLOCK
      ?auto_236695 - BLOCK
      ?auto_236696 - BLOCK
      ?auto_236697 - BLOCK
      ?auto_236698 - BLOCK
      ?auto_236699 - BLOCK
      ?auto_236700 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_236700 ) ( not ( = ?auto_236688 ?auto_236689 ) ) ( not ( = ?auto_236688 ?auto_236690 ) ) ( not ( = ?auto_236688 ?auto_236691 ) ) ( not ( = ?auto_236688 ?auto_236692 ) ) ( not ( = ?auto_236688 ?auto_236693 ) ) ( not ( = ?auto_236688 ?auto_236694 ) ) ( not ( = ?auto_236688 ?auto_236695 ) ) ( not ( = ?auto_236688 ?auto_236696 ) ) ( not ( = ?auto_236688 ?auto_236697 ) ) ( not ( = ?auto_236688 ?auto_236698 ) ) ( not ( = ?auto_236688 ?auto_236699 ) ) ( not ( = ?auto_236688 ?auto_236700 ) ) ( not ( = ?auto_236689 ?auto_236690 ) ) ( not ( = ?auto_236689 ?auto_236691 ) ) ( not ( = ?auto_236689 ?auto_236692 ) ) ( not ( = ?auto_236689 ?auto_236693 ) ) ( not ( = ?auto_236689 ?auto_236694 ) ) ( not ( = ?auto_236689 ?auto_236695 ) ) ( not ( = ?auto_236689 ?auto_236696 ) ) ( not ( = ?auto_236689 ?auto_236697 ) ) ( not ( = ?auto_236689 ?auto_236698 ) ) ( not ( = ?auto_236689 ?auto_236699 ) ) ( not ( = ?auto_236689 ?auto_236700 ) ) ( not ( = ?auto_236690 ?auto_236691 ) ) ( not ( = ?auto_236690 ?auto_236692 ) ) ( not ( = ?auto_236690 ?auto_236693 ) ) ( not ( = ?auto_236690 ?auto_236694 ) ) ( not ( = ?auto_236690 ?auto_236695 ) ) ( not ( = ?auto_236690 ?auto_236696 ) ) ( not ( = ?auto_236690 ?auto_236697 ) ) ( not ( = ?auto_236690 ?auto_236698 ) ) ( not ( = ?auto_236690 ?auto_236699 ) ) ( not ( = ?auto_236690 ?auto_236700 ) ) ( not ( = ?auto_236691 ?auto_236692 ) ) ( not ( = ?auto_236691 ?auto_236693 ) ) ( not ( = ?auto_236691 ?auto_236694 ) ) ( not ( = ?auto_236691 ?auto_236695 ) ) ( not ( = ?auto_236691 ?auto_236696 ) ) ( not ( = ?auto_236691 ?auto_236697 ) ) ( not ( = ?auto_236691 ?auto_236698 ) ) ( not ( = ?auto_236691 ?auto_236699 ) ) ( not ( = ?auto_236691 ?auto_236700 ) ) ( not ( = ?auto_236692 ?auto_236693 ) ) ( not ( = ?auto_236692 ?auto_236694 ) ) ( not ( = ?auto_236692 ?auto_236695 ) ) ( not ( = ?auto_236692 ?auto_236696 ) ) ( not ( = ?auto_236692 ?auto_236697 ) ) ( not ( = ?auto_236692 ?auto_236698 ) ) ( not ( = ?auto_236692 ?auto_236699 ) ) ( not ( = ?auto_236692 ?auto_236700 ) ) ( not ( = ?auto_236693 ?auto_236694 ) ) ( not ( = ?auto_236693 ?auto_236695 ) ) ( not ( = ?auto_236693 ?auto_236696 ) ) ( not ( = ?auto_236693 ?auto_236697 ) ) ( not ( = ?auto_236693 ?auto_236698 ) ) ( not ( = ?auto_236693 ?auto_236699 ) ) ( not ( = ?auto_236693 ?auto_236700 ) ) ( not ( = ?auto_236694 ?auto_236695 ) ) ( not ( = ?auto_236694 ?auto_236696 ) ) ( not ( = ?auto_236694 ?auto_236697 ) ) ( not ( = ?auto_236694 ?auto_236698 ) ) ( not ( = ?auto_236694 ?auto_236699 ) ) ( not ( = ?auto_236694 ?auto_236700 ) ) ( not ( = ?auto_236695 ?auto_236696 ) ) ( not ( = ?auto_236695 ?auto_236697 ) ) ( not ( = ?auto_236695 ?auto_236698 ) ) ( not ( = ?auto_236695 ?auto_236699 ) ) ( not ( = ?auto_236695 ?auto_236700 ) ) ( not ( = ?auto_236696 ?auto_236697 ) ) ( not ( = ?auto_236696 ?auto_236698 ) ) ( not ( = ?auto_236696 ?auto_236699 ) ) ( not ( = ?auto_236696 ?auto_236700 ) ) ( not ( = ?auto_236697 ?auto_236698 ) ) ( not ( = ?auto_236697 ?auto_236699 ) ) ( not ( = ?auto_236697 ?auto_236700 ) ) ( not ( = ?auto_236698 ?auto_236699 ) ) ( not ( = ?auto_236698 ?auto_236700 ) ) ( not ( = ?auto_236699 ?auto_236700 ) ) ( ON ?auto_236699 ?auto_236700 ) ( ON ?auto_236698 ?auto_236699 ) ( ON ?auto_236697 ?auto_236698 ) ( ON ?auto_236696 ?auto_236697 ) ( ON ?auto_236695 ?auto_236696 ) ( ON ?auto_236694 ?auto_236695 ) ( ON ?auto_236693 ?auto_236694 ) ( ON ?auto_236692 ?auto_236693 ) ( ON ?auto_236691 ?auto_236692 ) ( ON ?auto_236690 ?auto_236691 ) ( ON ?auto_236689 ?auto_236690 ) ( ON ?auto_236688 ?auto_236689 ) ( CLEAR ?auto_236688 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_236688 )
      ( MAKE-13PILE ?auto_236688 ?auto_236689 ?auto_236690 ?auto_236691 ?auto_236692 ?auto_236693 ?auto_236694 ?auto_236695 ?auto_236696 ?auto_236697 ?auto_236698 ?auto_236699 ?auto_236700 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_236714 - BLOCK
      ?auto_236715 - BLOCK
      ?auto_236716 - BLOCK
      ?auto_236717 - BLOCK
      ?auto_236718 - BLOCK
      ?auto_236719 - BLOCK
      ?auto_236720 - BLOCK
      ?auto_236721 - BLOCK
      ?auto_236722 - BLOCK
      ?auto_236723 - BLOCK
      ?auto_236724 - BLOCK
      ?auto_236725 - BLOCK
      ?auto_236726 - BLOCK
    )
    :vars
    (
      ?auto_236727 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_236714 ?auto_236715 ) ) ( not ( = ?auto_236714 ?auto_236716 ) ) ( not ( = ?auto_236714 ?auto_236717 ) ) ( not ( = ?auto_236714 ?auto_236718 ) ) ( not ( = ?auto_236714 ?auto_236719 ) ) ( not ( = ?auto_236714 ?auto_236720 ) ) ( not ( = ?auto_236714 ?auto_236721 ) ) ( not ( = ?auto_236714 ?auto_236722 ) ) ( not ( = ?auto_236714 ?auto_236723 ) ) ( not ( = ?auto_236714 ?auto_236724 ) ) ( not ( = ?auto_236714 ?auto_236725 ) ) ( not ( = ?auto_236714 ?auto_236726 ) ) ( not ( = ?auto_236715 ?auto_236716 ) ) ( not ( = ?auto_236715 ?auto_236717 ) ) ( not ( = ?auto_236715 ?auto_236718 ) ) ( not ( = ?auto_236715 ?auto_236719 ) ) ( not ( = ?auto_236715 ?auto_236720 ) ) ( not ( = ?auto_236715 ?auto_236721 ) ) ( not ( = ?auto_236715 ?auto_236722 ) ) ( not ( = ?auto_236715 ?auto_236723 ) ) ( not ( = ?auto_236715 ?auto_236724 ) ) ( not ( = ?auto_236715 ?auto_236725 ) ) ( not ( = ?auto_236715 ?auto_236726 ) ) ( not ( = ?auto_236716 ?auto_236717 ) ) ( not ( = ?auto_236716 ?auto_236718 ) ) ( not ( = ?auto_236716 ?auto_236719 ) ) ( not ( = ?auto_236716 ?auto_236720 ) ) ( not ( = ?auto_236716 ?auto_236721 ) ) ( not ( = ?auto_236716 ?auto_236722 ) ) ( not ( = ?auto_236716 ?auto_236723 ) ) ( not ( = ?auto_236716 ?auto_236724 ) ) ( not ( = ?auto_236716 ?auto_236725 ) ) ( not ( = ?auto_236716 ?auto_236726 ) ) ( not ( = ?auto_236717 ?auto_236718 ) ) ( not ( = ?auto_236717 ?auto_236719 ) ) ( not ( = ?auto_236717 ?auto_236720 ) ) ( not ( = ?auto_236717 ?auto_236721 ) ) ( not ( = ?auto_236717 ?auto_236722 ) ) ( not ( = ?auto_236717 ?auto_236723 ) ) ( not ( = ?auto_236717 ?auto_236724 ) ) ( not ( = ?auto_236717 ?auto_236725 ) ) ( not ( = ?auto_236717 ?auto_236726 ) ) ( not ( = ?auto_236718 ?auto_236719 ) ) ( not ( = ?auto_236718 ?auto_236720 ) ) ( not ( = ?auto_236718 ?auto_236721 ) ) ( not ( = ?auto_236718 ?auto_236722 ) ) ( not ( = ?auto_236718 ?auto_236723 ) ) ( not ( = ?auto_236718 ?auto_236724 ) ) ( not ( = ?auto_236718 ?auto_236725 ) ) ( not ( = ?auto_236718 ?auto_236726 ) ) ( not ( = ?auto_236719 ?auto_236720 ) ) ( not ( = ?auto_236719 ?auto_236721 ) ) ( not ( = ?auto_236719 ?auto_236722 ) ) ( not ( = ?auto_236719 ?auto_236723 ) ) ( not ( = ?auto_236719 ?auto_236724 ) ) ( not ( = ?auto_236719 ?auto_236725 ) ) ( not ( = ?auto_236719 ?auto_236726 ) ) ( not ( = ?auto_236720 ?auto_236721 ) ) ( not ( = ?auto_236720 ?auto_236722 ) ) ( not ( = ?auto_236720 ?auto_236723 ) ) ( not ( = ?auto_236720 ?auto_236724 ) ) ( not ( = ?auto_236720 ?auto_236725 ) ) ( not ( = ?auto_236720 ?auto_236726 ) ) ( not ( = ?auto_236721 ?auto_236722 ) ) ( not ( = ?auto_236721 ?auto_236723 ) ) ( not ( = ?auto_236721 ?auto_236724 ) ) ( not ( = ?auto_236721 ?auto_236725 ) ) ( not ( = ?auto_236721 ?auto_236726 ) ) ( not ( = ?auto_236722 ?auto_236723 ) ) ( not ( = ?auto_236722 ?auto_236724 ) ) ( not ( = ?auto_236722 ?auto_236725 ) ) ( not ( = ?auto_236722 ?auto_236726 ) ) ( not ( = ?auto_236723 ?auto_236724 ) ) ( not ( = ?auto_236723 ?auto_236725 ) ) ( not ( = ?auto_236723 ?auto_236726 ) ) ( not ( = ?auto_236724 ?auto_236725 ) ) ( not ( = ?auto_236724 ?auto_236726 ) ) ( not ( = ?auto_236725 ?auto_236726 ) ) ( ON ?auto_236714 ?auto_236727 ) ( not ( = ?auto_236726 ?auto_236727 ) ) ( not ( = ?auto_236725 ?auto_236727 ) ) ( not ( = ?auto_236724 ?auto_236727 ) ) ( not ( = ?auto_236723 ?auto_236727 ) ) ( not ( = ?auto_236722 ?auto_236727 ) ) ( not ( = ?auto_236721 ?auto_236727 ) ) ( not ( = ?auto_236720 ?auto_236727 ) ) ( not ( = ?auto_236719 ?auto_236727 ) ) ( not ( = ?auto_236718 ?auto_236727 ) ) ( not ( = ?auto_236717 ?auto_236727 ) ) ( not ( = ?auto_236716 ?auto_236727 ) ) ( not ( = ?auto_236715 ?auto_236727 ) ) ( not ( = ?auto_236714 ?auto_236727 ) ) ( ON ?auto_236715 ?auto_236714 ) ( ON ?auto_236716 ?auto_236715 ) ( ON ?auto_236717 ?auto_236716 ) ( ON ?auto_236718 ?auto_236717 ) ( ON ?auto_236719 ?auto_236718 ) ( ON ?auto_236720 ?auto_236719 ) ( ON ?auto_236721 ?auto_236720 ) ( ON ?auto_236722 ?auto_236721 ) ( ON ?auto_236723 ?auto_236722 ) ( ON ?auto_236724 ?auto_236723 ) ( ON ?auto_236725 ?auto_236724 ) ( ON ?auto_236726 ?auto_236725 ) ( CLEAR ?auto_236726 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_236726 ?auto_236725 ?auto_236724 ?auto_236723 ?auto_236722 ?auto_236721 ?auto_236720 ?auto_236719 ?auto_236718 ?auto_236717 ?auto_236716 ?auto_236715 ?auto_236714 )
      ( MAKE-13PILE ?auto_236714 ?auto_236715 ?auto_236716 ?auto_236717 ?auto_236718 ?auto_236719 ?auto_236720 ?auto_236721 ?auto_236722 ?auto_236723 ?auto_236724 ?auto_236725 ?auto_236726 ) )
  )

)

