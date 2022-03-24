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

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12320 - BLOCK
      ?auto_12321 - BLOCK
      ?auto_12322 - BLOCK
      ?auto_12323 - BLOCK
    )
    :vars
    (
      ?auto_12324 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12324 ?auto_12323 ) ( CLEAR ?auto_12324 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_12320 ) ( ON ?auto_12321 ?auto_12320 ) ( ON ?auto_12322 ?auto_12321 ) ( ON ?auto_12323 ?auto_12322 ) ( not ( = ?auto_12320 ?auto_12321 ) ) ( not ( = ?auto_12320 ?auto_12322 ) ) ( not ( = ?auto_12320 ?auto_12323 ) ) ( not ( = ?auto_12320 ?auto_12324 ) ) ( not ( = ?auto_12321 ?auto_12322 ) ) ( not ( = ?auto_12321 ?auto_12323 ) ) ( not ( = ?auto_12321 ?auto_12324 ) ) ( not ( = ?auto_12322 ?auto_12323 ) ) ( not ( = ?auto_12322 ?auto_12324 ) ) ( not ( = ?auto_12323 ?auto_12324 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_12324 ?auto_12323 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12326 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_12326 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_12326 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12327 - BLOCK
    )
    :vars
    (
      ?auto_12328 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12327 ?auto_12328 ) ( CLEAR ?auto_12327 ) ( HAND-EMPTY ) ( not ( = ?auto_12327 ?auto_12328 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_12327 ?auto_12328 )
      ( MAKE-1PILE ?auto_12327 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12332 - BLOCK
      ?auto_12333 - BLOCK
      ?auto_12334 - BLOCK
    )
    :vars
    (
      ?auto_12335 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12335 ?auto_12334 ) ( CLEAR ?auto_12335 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_12332 ) ( ON ?auto_12333 ?auto_12332 ) ( ON ?auto_12334 ?auto_12333 ) ( not ( = ?auto_12332 ?auto_12333 ) ) ( not ( = ?auto_12332 ?auto_12334 ) ) ( not ( = ?auto_12332 ?auto_12335 ) ) ( not ( = ?auto_12333 ?auto_12334 ) ) ( not ( = ?auto_12333 ?auto_12335 ) ) ( not ( = ?auto_12334 ?auto_12335 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_12335 ?auto_12334 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12336 - BLOCK
      ?auto_12337 - BLOCK
      ?auto_12338 - BLOCK
    )
    :vars
    (
      ?auto_12339 - BLOCK
      ?auto_12340 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12339 ?auto_12338 ) ( CLEAR ?auto_12339 ) ( ON-TABLE ?auto_12336 ) ( ON ?auto_12337 ?auto_12336 ) ( ON ?auto_12338 ?auto_12337 ) ( not ( = ?auto_12336 ?auto_12337 ) ) ( not ( = ?auto_12336 ?auto_12338 ) ) ( not ( = ?auto_12336 ?auto_12339 ) ) ( not ( = ?auto_12337 ?auto_12338 ) ) ( not ( = ?auto_12337 ?auto_12339 ) ) ( not ( = ?auto_12338 ?auto_12339 ) ) ( HOLDING ?auto_12340 ) ( not ( = ?auto_12336 ?auto_12340 ) ) ( not ( = ?auto_12337 ?auto_12340 ) ) ( not ( = ?auto_12338 ?auto_12340 ) ) ( not ( = ?auto_12339 ?auto_12340 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_12340 )
      ( MAKE-3PILE ?auto_12336 ?auto_12337 ?auto_12338 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12341 - BLOCK
      ?auto_12342 - BLOCK
      ?auto_12343 - BLOCK
    )
    :vars
    (
      ?auto_12345 - BLOCK
      ?auto_12344 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12345 ?auto_12343 ) ( ON-TABLE ?auto_12341 ) ( ON ?auto_12342 ?auto_12341 ) ( ON ?auto_12343 ?auto_12342 ) ( not ( = ?auto_12341 ?auto_12342 ) ) ( not ( = ?auto_12341 ?auto_12343 ) ) ( not ( = ?auto_12341 ?auto_12345 ) ) ( not ( = ?auto_12342 ?auto_12343 ) ) ( not ( = ?auto_12342 ?auto_12345 ) ) ( not ( = ?auto_12343 ?auto_12345 ) ) ( not ( = ?auto_12341 ?auto_12344 ) ) ( not ( = ?auto_12342 ?auto_12344 ) ) ( not ( = ?auto_12343 ?auto_12344 ) ) ( not ( = ?auto_12345 ?auto_12344 ) ) ( ON ?auto_12344 ?auto_12345 ) ( CLEAR ?auto_12344 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_12341 ?auto_12342 ?auto_12343 ?auto_12345 )
      ( MAKE-3PILE ?auto_12341 ?auto_12342 ?auto_12343 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12348 - BLOCK
      ?auto_12349 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_12349 ) ( CLEAR ?auto_12348 ) ( ON-TABLE ?auto_12348 ) ( not ( = ?auto_12348 ?auto_12349 ) ) )
    :subtasks
    ( ( !STACK ?auto_12349 ?auto_12348 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12350 - BLOCK
      ?auto_12351 - BLOCK
    )
    :vars
    (
      ?auto_12352 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_12350 ) ( ON-TABLE ?auto_12350 ) ( not ( = ?auto_12350 ?auto_12351 ) ) ( ON ?auto_12351 ?auto_12352 ) ( CLEAR ?auto_12351 ) ( HAND-EMPTY ) ( not ( = ?auto_12350 ?auto_12352 ) ) ( not ( = ?auto_12351 ?auto_12352 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_12351 ?auto_12352 )
      ( MAKE-2PILE ?auto_12350 ?auto_12351 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12353 - BLOCK
      ?auto_12354 - BLOCK
    )
    :vars
    (
      ?auto_12355 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12353 ?auto_12354 ) ) ( ON ?auto_12354 ?auto_12355 ) ( CLEAR ?auto_12354 ) ( not ( = ?auto_12353 ?auto_12355 ) ) ( not ( = ?auto_12354 ?auto_12355 ) ) ( HOLDING ?auto_12353 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_12353 )
      ( MAKE-2PILE ?auto_12353 ?auto_12354 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12356 - BLOCK
      ?auto_12357 - BLOCK
    )
    :vars
    (
      ?auto_12358 - BLOCK
      ?auto_12360 - BLOCK
      ?auto_12359 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12356 ?auto_12357 ) ) ( ON ?auto_12357 ?auto_12358 ) ( not ( = ?auto_12356 ?auto_12358 ) ) ( not ( = ?auto_12357 ?auto_12358 ) ) ( ON ?auto_12356 ?auto_12357 ) ( CLEAR ?auto_12356 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_12360 ) ( ON ?auto_12359 ?auto_12360 ) ( ON ?auto_12358 ?auto_12359 ) ( not ( = ?auto_12360 ?auto_12359 ) ) ( not ( = ?auto_12360 ?auto_12358 ) ) ( not ( = ?auto_12360 ?auto_12357 ) ) ( not ( = ?auto_12360 ?auto_12356 ) ) ( not ( = ?auto_12359 ?auto_12358 ) ) ( not ( = ?auto_12359 ?auto_12357 ) ) ( not ( = ?auto_12359 ?auto_12356 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_12360 ?auto_12359 ?auto_12358 ?auto_12357 )
      ( MAKE-2PILE ?auto_12356 ?auto_12357 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12363 - BLOCK
      ?auto_12364 - BLOCK
    )
    :vars
    (
      ?auto_12365 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12365 ?auto_12364 ) ( CLEAR ?auto_12365 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_12363 ) ( ON ?auto_12364 ?auto_12363 ) ( not ( = ?auto_12363 ?auto_12364 ) ) ( not ( = ?auto_12363 ?auto_12365 ) ) ( not ( = ?auto_12364 ?auto_12365 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_12365 ?auto_12364 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12366 - BLOCK
      ?auto_12367 - BLOCK
    )
    :vars
    (
      ?auto_12368 - BLOCK
      ?auto_12369 - BLOCK
      ?auto_12370 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12368 ?auto_12367 ) ( CLEAR ?auto_12368 ) ( ON-TABLE ?auto_12366 ) ( ON ?auto_12367 ?auto_12366 ) ( not ( = ?auto_12366 ?auto_12367 ) ) ( not ( = ?auto_12366 ?auto_12368 ) ) ( not ( = ?auto_12367 ?auto_12368 ) ) ( HOLDING ?auto_12369 ) ( CLEAR ?auto_12370 ) ( not ( = ?auto_12366 ?auto_12369 ) ) ( not ( = ?auto_12366 ?auto_12370 ) ) ( not ( = ?auto_12367 ?auto_12369 ) ) ( not ( = ?auto_12367 ?auto_12370 ) ) ( not ( = ?auto_12368 ?auto_12369 ) ) ( not ( = ?auto_12368 ?auto_12370 ) ) ( not ( = ?auto_12369 ?auto_12370 ) ) )
    :subtasks
    ( ( !STACK ?auto_12369 ?auto_12370 )
      ( MAKE-2PILE ?auto_12366 ?auto_12367 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12566 - BLOCK
      ?auto_12567 - BLOCK
    )
    :vars
    (
      ?auto_12568 - BLOCK
      ?auto_12569 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12568 ?auto_12567 ) ( ON-TABLE ?auto_12566 ) ( ON ?auto_12567 ?auto_12566 ) ( not ( = ?auto_12566 ?auto_12567 ) ) ( not ( = ?auto_12566 ?auto_12568 ) ) ( not ( = ?auto_12567 ?auto_12568 ) ) ( not ( = ?auto_12566 ?auto_12569 ) ) ( not ( = ?auto_12567 ?auto_12569 ) ) ( not ( = ?auto_12568 ?auto_12569 ) ) ( ON ?auto_12569 ?auto_12568 ) ( CLEAR ?auto_12569 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12566 ?auto_12567 ?auto_12568 )
      ( MAKE-2PILE ?auto_12566 ?auto_12567 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12376 - BLOCK
      ?auto_12377 - BLOCK
    )
    :vars
    (
      ?auto_12380 - BLOCK
      ?auto_12379 - BLOCK
      ?auto_12378 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12380 ?auto_12377 ) ( ON-TABLE ?auto_12376 ) ( ON ?auto_12377 ?auto_12376 ) ( not ( = ?auto_12376 ?auto_12377 ) ) ( not ( = ?auto_12376 ?auto_12380 ) ) ( not ( = ?auto_12377 ?auto_12380 ) ) ( not ( = ?auto_12376 ?auto_12379 ) ) ( not ( = ?auto_12376 ?auto_12378 ) ) ( not ( = ?auto_12377 ?auto_12379 ) ) ( not ( = ?auto_12377 ?auto_12378 ) ) ( not ( = ?auto_12380 ?auto_12379 ) ) ( not ( = ?auto_12380 ?auto_12378 ) ) ( not ( = ?auto_12379 ?auto_12378 ) ) ( ON ?auto_12379 ?auto_12380 ) ( CLEAR ?auto_12379 ) ( HOLDING ?auto_12378 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_12378 )
      ( MAKE-2PILE ?auto_12376 ?auto_12377 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12381 - BLOCK
      ?auto_12382 - BLOCK
    )
    :vars
    (
      ?auto_12383 - BLOCK
      ?auto_12385 - BLOCK
      ?auto_12384 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12383 ?auto_12382 ) ( ON-TABLE ?auto_12381 ) ( ON ?auto_12382 ?auto_12381 ) ( not ( = ?auto_12381 ?auto_12382 ) ) ( not ( = ?auto_12381 ?auto_12383 ) ) ( not ( = ?auto_12382 ?auto_12383 ) ) ( not ( = ?auto_12381 ?auto_12385 ) ) ( not ( = ?auto_12381 ?auto_12384 ) ) ( not ( = ?auto_12382 ?auto_12385 ) ) ( not ( = ?auto_12382 ?auto_12384 ) ) ( not ( = ?auto_12383 ?auto_12385 ) ) ( not ( = ?auto_12383 ?auto_12384 ) ) ( not ( = ?auto_12385 ?auto_12384 ) ) ( ON ?auto_12385 ?auto_12383 ) ( ON ?auto_12384 ?auto_12385 ) ( CLEAR ?auto_12384 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_12381 ?auto_12382 ?auto_12383 ?auto_12385 )
      ( MAKE-2PILE ?auto_12381 ?auto_12382 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12389 - BLOCK
      ?auto_12390 - BLOCK
      ?auto_12391 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_12391 ) ( CLEAR ?auto_12390 ) ( ON-TABLE ?auto_12389 ) ( ON ?auto_12390 ?auto_12389 ) ( not ( = ?auto_12389 ?auto_12390 ) ) ( not ( = ?auto_12389 ?auto_12391 ) ) ( not ( = ?auto_12390 ?auto_12391 ) ) )
    :subtasks
    ( ( !STACK ?auto_12391 ?auto_12390 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12392 - BLOCK
      ?auto_12393 - BLOCK
      ?auto_12394 - BLOCK
    )
    :vars
    (
      ?auto_12395 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_12393 ) ( ON-TABLE ?auto_12392 ) ( ON ?auto_12393 ?auto_12392 ) ( not ( = ?auto_12392 ?auto_12393 ) ) ( not ( = ?auto_12392 ?auto_12394 ) ) ( not ( = ?auto_12393 ?auto_12394 ) ) ( ON ?auto_12394 ?auto_12395 ) ( CLEAR ?auto_12394 ) ( HAND-EMPTY ) ( not ( = ?auto_12392 ?auto_12395 ) ) ( not ( = ?auto_12393 ?auto_12395 ) ) ( not ( = ?auto_12394 ?auto_12395 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_12394 ?auto_12395 )
      ( MAKE-3PILE ?auto_12392 ?auto_12393 ?auto_12394 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12396 - BLOCK
      ?auto_12397 - BLOCK
      ?auto_12398 - BLOCK
    )
    :vars
    (
      ?auto_12399 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_12396 ) ( not ( = ?auto_12396 ?auto_12397 ) ) ( not ( = ?auto_12396 ?auto_12398 ) ) ( not ( = ?auto_12397 ?auto_12398 ) ) ( ON ?auto_12398 ?auto_12399 ) ( CLEAR ?auto_12398 ) ( not ( = ?auto_12396 ?auto_12399 ) ) ( not ( = ?auto_12397 ?auto_12399 ) ) ( not ( = ?auto_12398 ?auto_12399 ) ) ( HOLDING ?auto_12397 ) ( CLEAR ?auto_12396 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12396 ?auto_12397 )
      ( MAKE-3PILE ?auto_12396 ?auto_12397 ?auto_12398 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12400 - BLOCK
      ?auto_12401 - BLOCK
      ?auto_12402 - BLOCK
    )
    :vars
    (
      ?auto_12403 - BLOCK
      ?auto_12404 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_12400 ) ( not ( = ?auto_12400 ?auto_12401 ) ) ( not ( = ?auto_12400 ?auto_12402 ) ) ( not ( = ?auto_12401 ?auto_12402 ) ) ( ON ?auto_12402 ?auto_12403 ) ( not ( = ?auto_12400 ?auto_12403 ) ) ( not ( = ?auto_12401 ?auto_12403 ) ) ( not ( = ?auto_12402 ?auto_12403 ) ) ( CLEAR ?auto_12400 ) ( ON ?auto_12401 ?auto_12402 ) ( CLEAR ?auto_12401 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_12404 ) ( ON ?auto_12403 ?auto_12404 ) ( not ( = ?auto_12404 ?auto_12403 ) ) ( not ( = ?auto_12404 ?auto_12402 ) ) ( not ( = ?auto_12404 ?auto_12401 ) ) ( not ( = ?auto_12400 ?auto_12404 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12404 ?auto_12403 ?auto_12402 )
      ( MAKE-3PILE ?auto_12400 ?auto_12401 ?auto_12402 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12405 - BLOCK
      ?auto_12406 - BLOCK
      ?auto_12407 - BLOCK
    )
    :vars
    (
      ?auto_12408 - BLOCK
      ?auto_12409 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12405 ?auto_12406 ) ) ( not ( = ?auto_12405 ?auto_12407 ) ) ( not ( = ?auto_12406 ?auto_12407 ) ) ( ON ?auto_12407 ?auto_12408 ) ( not ( = ?auto_12405 ?auto_12408 ) ) ( not ( = ?auto_12406 ?auto_12408 ) ) ( not ( = ?auto_12407 ?auto_12408 ) ) ( ON ?auto_12406 ?auto_12407 ) ( CLEAR ?auto_12406 ) ( ON-TABLE ?auto_12409 ) ( ON ?auto_12408 ?auto_12409 ) ( not ( = ?auto_12409 ?auto_12408 ) ) ( not ( = ?auto_12409 ?auto_12407 ) ) ( not ( = ?auto_12409 ?auto_12406 ) ) ( not ( = ?auto_12405 ?auto_12409 ) ) ( HOLDING ?auto_12405 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_12405 )
      ( MAKE-3PILE ?auto_12405 ?auto_12406 ?auto_12407 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12410 - BLOCK
      ?auto_12411 - BLOCK
      ?auto_12412 - BLOCK
    )
    :vars
    (
      ?auto_12413 - BLOCK
      ?auto_12414 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12410 ?auto_12411 ) ) ( not ( = ?auto_12410 ?auto_12412 ) ) ( not ( = ?auto_12411 ?auto_12412 ) ) ( ON ?auto_12412 ?auto_12413 ) ( not ( = ?auto_12410 ?auto_12413 ) ) ( not ( = ?auto_12411 ?auto_12413 ) ) ( not ( = ?auto_12412 ?auto_12413 ) ) ( ON ?auto_12411 ?auto_12412 ) ( ON-TABLE ?auto_12414 ) ( ON ?auto_12413 ?auto_12414 ) ( not ( = ?auto_12414 ?auto_12413 ) ) ( not ( = ?auto_12414 ?auto_12412 ) ) ( not ( = ?auto_12414 ?auto_12411 ) ) ( not ( = ?auto_12410 ?auto_12414 ) ) ( ON ?auto_12410 ?auto_12411 ) ( CLEAR ?auto_12410 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_12414 ?auto_12413 ?auto_12412 ?auto_12411 )
      ( MAKE-3PILE ?auto_12410 ?auto_12411 ?auto_12412 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12416 - BLOCK
    )
    :vars
    (
      ?auto_12417 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12417 ?auto_12416 ) ( CLEAR ?auto_12417 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_12416 ) ( not ( = ?auto_12416 ?auto_12417 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_12417 ?auto_12416 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12418 - BLOCK
    )
    :vars
    (
      ?auto_12419 - BLOCK
      ?auto_12420 - BLOCK
      ?auto_12421 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12419 ?auto_12418 ) ( CLEAR ?auto_12419 ) ( ON-TABLE ?auto_12418 ) ( not ( = ?auto_12418 ?auto_12419 ) ) ( HOLDING ?auto_12420 ) ( CLEAR ?auto_12421 ) ( not ( = ?auto_12418 ?auto_12420 ) ) ( not ( = ?auto_12418 ?auto_12421 ) ) ( not ( = ?auto_12419 ?auto_12420 ) ) ( not ( = ?auto_12419 ?auto_12421 ) ) ( not ( = ?auto_12420 ?auto_12421 ) ) )
    :subtasks
    ( ( !STACK ?auto_12420 ?auto_12421 )
      ( MAKE-1PILE ?auto_12418 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12422 - BLOCK
    )
    :vars
    (
      ?auto_12424 - BLOCK
      ?auto_12425 - BLOCK
      ?auto_12423 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12424 ?auto_12422 ) ( ON-TABLE ?auto_12422 ) ( not ( = ?auto_12422 ?auto_12424 ) ) ( CLEAR ?auto_12425 ) ( not ( = ?auto_12422 ?auto_12423 ) ) ( not ( = ?auto_12422 ?auto_12425 ) ) ( not ( = ?auto_12424 ?auto_12423 ) ) ( not ( = ?auto_12424 ?auto_12425 ) ) ( not ( = ?auto_12423 ?auto_12425 ) ) ( ON ?auto_12423 ?auto_12424 ) ( CLEAR ?auto_12423 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12422 ?auto_12424 )
      ( MAKE-1PILE ?auto_12422 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12426 - BLOCK
    )
    :vars
    (
      ?auto_12429 - BLOCK
      ?auto_12428 - BLOCK
      ?auto_12427 - BLOCK
      ?auto_12430 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12429 ?auto_12426 ) ( ON-TABLE ?auto_12426 ) ( not ( = ?auto_12426 ?auto_12429 ) ) ( not ( = ?auto_12426 ?auto_12428 ) ) ( not ( = ?auto_12426 ?auto_12427 ) ) ( not ( = ?auto_12429 ?auto_12428 ) ) ( not ( = ?auto_12429 ?auto_12427 ) ) ( not ( = ?auto_12428 ?auto_12427 ) ) ( ON ?auto_12428 ?auto_12429 ) ( CLEAR ?auto_12428 ) ( HOLDING ?auto_12427 ) ( CLEAR ?auto_12430 ) ( ON-TABLE ?auto_12430 ) ( not ( = ?auto_12430 ?auto_12427 ) ) ( not ( = ?auto_12426 ?auto_12430 ) ) ( not ( = ?auto_12429 ?auto_12430 ) ) ( not ( = ?auto_12428 ?auto_12430 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12430 ?auto_12427 )
      ( MAKE-1PILE ?auto_12426 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12654 - BLOCK
    )
    :vars
    (
      ?auto_12655 - BLOCK
      ?auto_12656 - BLOCK
      ?auto_12657 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12655 ?auto_12654 ) ( ON-TABLE ?auto_12654 ) ( not ( = ?auto_12654 ?auto_12655 ) ) ( not ( = ?auto_12654 ?auto_12656 ) ) ( not ( = ?auto_12654 ?auto_12657 ) ) ( not ( = ?auto_12655 ?auto_12656 ) ) ( not ( = ?auto_12655 ?auto_12657 ) ) ( not ( = ?auto_12656 ?auto_12657 ) ) ( ON ?auto_12656 ?auto_12655 ) ( ON ?auto_12657 ?auto_12656 ) ( CLEAR ?auto_12657 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12654 ?auto_12655 ?auto_12656 )
      ( MAKE-1PILE ?auto_12654 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12436 - BLOCK
    )
    :vars
    (
      ?auto_12439 - BLOCK
      ?auto_12437 - BLOCK
      ?auto_12440 - BLOCK
      ?auto_12438 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12439 ?auto_12436 ) ( ON-TABLE ?auto_12436 ) ( not ( = ?auto_12436 ?auto_12439 ) ) ( not ( = ?auto_12436 ?auto_12437 ) ) ( not ( = ?auto_12436 ?auto_12440 ) ) ( not ( = ?auto_12439 ?auto_12437 ) ) ( not ( = ?auto_12439 ?auto_12440 ) ) ( not ( = ?auto_12437 ?auto_12440 ) ) ( ON ?auto_12437 ?auto_12439 ) ( not ( = ?auto_12438 ?auto_12440 ) ) ( not ( = ?auto_12436 ?auto_12438 ) ) ( not ( = ?auto_12439 ?auto_12438 ) ) ( not ( = ?auto_12437 ?auto_12438 ) ) ( ON ?auto_12440 ?auto_12437 ) ( CLEAR ?auto_12440 ) ( HOLDING ?auto_12438 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_12438 )
      ( MAKE-1PILE ?auto_12436 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12441 - BLOCK
    )
    :vars
    (
      ?auto_12445 - BLOCK
      ?auto_12442 - BLOCK
      ?auto_12443 - BLOCK
      ?auto_12444 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12445 ?auto_12441 ) ( ON-TABLE ?auto_12441 ) ( not ( = ?auto_12441 ?auto_12445 ) ) ( not ( = ?auto_12441 ?auto_12442 ) ) ( not ( = ?auto_12441 ?auto_12443 ) ) ( not ( = ?auto_12445 ?auto_12442 ) ) ( not ( = ?auto_12445 ?auto_12443 ) ) ( not ( = ?auto_12442 ?auto_12443 ) ) ( ON ?auto_12442 ?auto_12445 ) ( not ( = ?auto_12444 ?auto_12443 ) ) ( not ( = ?auto_12441 ?auto_12444 ) ) ( not ( = ?auto_12445 ?auto_12444 ) ) ( not ( = ?auto_12442 ?auto_12444 ) ) ( ON ?auto_12443 ?auto_12442 ) ( ON ?auto_12444 ?auto_12443 ) ( CLEAR ?auto_12444 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_12441 ?auto_12445 ?auto_12442 ?auto_12443 )
      ( MAKE-1PILE ?auto_12441 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12450 - BLOCK
      ?auto_12451 - BLOCK
      ?auto_12452 - BLOCK
      ?auto_12453 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_12453 ) ( CLEAR ?auto_12452 ) ( ON-TABLE ?auto_12450 ) ( ON ?auto_12451 ?auto_12450 ) ( ON ?auto_12452 ?auto_12451 ) ( not ( = ?auto_12450 ?auto_12451 ) ) ( not ( = ?auto_12450 ?auto_12452 ) ) ( not ( = ?auto_12450 ?auto_12453 ) ) ( not ( = ?auto_12451 ?auto_12452 ) ) ( not ( = ?auto_12451 ?auto_12453 ) ) ( not ( = ?auto_12452 ?auto_12453 ) ) )
    :subtasks
    ( ( !STACK ?auto_12453 ?auto_12452 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12454 - BLOCK
      ?auto_12455 - BLOCK
      ?auto_12456 - BLOCK
      ?auto_12457 - BLOCK
    )
    :vars
    (
      ?auto_12458 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_12456 ) ( ON-TABLE ?auto_12454 ) ( ON ?auto_12455 ?auto_12454 ) ( ON ?auto_12456 ?auto_12455 ) ( not ( = ?auto_12454 ?auto_12455 ) ) ( not ( = ?auto_12454 ?auto_12456 ) ) ( not ( = ?auto_12454 ?auto_12457 ) ) ( not ( = ?auto_12455 ?auto_12456 ) ) ( not ( = ?auto_12455 ?auto_12457 ) ) ( not ( = ?auto_12456 ?auto_12457 ) ) ( ON ?auto_12457 ?auto_12458 ) ( CLEAR ?auto_12457 ) ( HAND-EMPTY ) ( not ( = ?auto_12454 ?auto_12458 ) ) ( not ( = ?auto_12455 ?auto_12458 ) ) ( not ( = ?auto_12456 ?auto_12458 ) ) ( not ( = ?auto_12457 ?auto_12458 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_12457 ?auto_12458 )
      ( MAKE-4PILE ?auto_12454 ?auto_12455 ?auto_12456 ?auto_12457 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12459 - BLOCK
      ?auto_12460 - BLOCK
      ?auto_12461 - BLOCK
      ?auto_12462 - BLOCK
    )
    :vars
    (
      ?auto_12463 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_12459 ) ( ON ?auto_12460 ?auto_12459 ) ( not ( = ?auto_12459 ?auto_12460 ) ) ( not ( = ?auto_12459 ?auto_12461 ) ) ( not ( = ?auto_12459 ?auto_12462 ) ) ( not ( = ?auto_12460 ?auto_12461 ) ) ( not ( = ?auto_12460 ?auto_12462 ) ) ( not ( = ?auto_12461 ?auto_12462 ) ) ( ON ?auto_12462 ?auto_12463 ) ( CLEAR ?auto_12462 ) ( not ( = ?auto_12459 ?auto_12463 ) ) ( not ( = ?auto_12460 ?auto_12463 ) ) ( not ( = ?auto_12461 ?auto_12463 ) ) ( not ( = ?auto_12462 ?auto_12463 ) ) ( HOLDING ?auto_12461 ) ( CLEAR ?auto_12460 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12459 ?auto_12460 ?auto_12461 )
      ( MAKE-4PILE ?auto_12459 ?auto_12460 ?auto_12461 ?auto_12462 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12464 - BLOCK
      ?auto_12465 - BLOCK
      ?auto_12466 - BLOCK
      ?auto_12467 - BLOCK
    )
    :vars
    (
      ?auto_12468 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_12464 ) ( ON ?auto_12465 ?auto_12464 ) ( not ( = ?auto_12464 ?auto_12465 ) ) ( not ( = ?auto_12464 ?auto_12466 ) ) ( not ( = ?auto_12464 ?auto_12467 ) ) ( not ( = ?auto_12465 ?auto_12466 ) ) ( not ( = ?auto_12465 ?auto_12467 ) ) ( not ( = ?auto_12466 ?auto_12467 ) ) ( ON ?auto_12467 ?auto_12468 ) ( not ( = ?auto_12464 ?auto_12468 ) ) ( not ( = ?auto_12465 ?auto_12468 ) ) ( not ( = ?auto_12466 ?auto_12468 ) ) ( not ( = ?auto_12467 ?auto_12468 ) ) ( CLEAR ?auto_12465 ) ( ON ?auto_12466 ?auto_12467 ) ( CLEAR ?auto_12466 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_12468 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12468 ?auto_12467 )
      ( MAKE-4PILE ?auto_12464 ?auto_12465 ?auto_12466 ?auto_12467 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12469 - BLOCK
      ?auto_12470 - BLOCK
      ?auto_12471 - BLOCK
      ?auto_12472 - BLOCK
    )
    :vars
    (
      ?auto_12473 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_12469 ) ( not ( = ?auto_12469 ?auto_12470 ) ) ( not ( = ?auto_12469 ?auto_12471 ) ) ( not ( = ?auto_12469 ?auto_12472 ) ) ( not ( = ?auto_12470 ?auto_12471 ) ) ( not ( = ?auto_12470 ?auto_12472 ) ) ( not ( = ?auto_12471 ?auto_12472 ) ) ( ON ?auto_12472 ?auto_12473 ) ( not ( = ?auto_12469 ?auto_12473 ) ) ( not ( = ?auto_12470 ?auto_12473 ) ) ( not ( = ?auto_12471 ?auto_12473 ) ) ( not ( = ?auto_12472 ?auto_12473 ) ) ( ON ?auto_12471 ?auto_12472 ) ( CLEAR ?auto_12471 ) ( ON-TABLE ?auto_12473 ) ( HOLDING ?auto_12470 ) ( CLEAR ?auto_12469 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12469 ?auto_12470 )
      ( MAKE-4PILE ?auto_12469 ?auto_12470 ?auto_12471 ?auto_12472 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12474 - BLOCK
      ?auto_12475 - BLOCK
      ?auto_12476 - BLOCK
      ?auto_12477 - BLOCK
    )
    :vars
    (
      ?auto_12478 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_12474 ) ( not ( = ?auto_12474 ?auto_12475 ) ) ( not ( = ?auto_12474 ?auto_12476 ) ) ( not ( = ?auto_12474 ?auto_12477 ) ) ( not ( = ?auto_12475 ?auto_12476 ) ) ( not ( = ?auto_12475 ?auto_12477 ) ) ( not ( = ?auto_12476 ?auto_12477 ) ) ( ON ?auto_12477 ?auto_12478 ) ( not ( = ?auto_12474 ?auto_12478 ) ) ( not ( = ?auto_12475 ?auto_12478 ) ) ( not ( = ?auto_12476 ?auto_12478 ) ) ( not ( = ?auto_12477 ?auto_12478 ) ) ( ON ?auto_12476 ?auto_12477 ) ( ON-TABLE ?auto_12478 ) ( CLEAR ?auto_12474 ) ( ON ?auto_12475 ?auto_12476 ) ( CLEAR ?auto_12475 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12478 ?auto_12477 ?auto_12476 )
      ( MAKE-4PILE ?auto_12474 ?auto_12475 ?auto_12476 ?auto_12477 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12479 - BLOCK
      ?auto_12480 - BLOCK
      ?auto_12481 - BLOCK
      ?auto_12482 - BLOCK
    )
    :vars
    (
      ?auto_12483 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12479 ?auto_12480 ) ) ( not ( = ?auto_12479 ?auto_12481 ) ) ( not ( = ?auto_12479 ?auto_12482 ) ) ( not ( = ?auto_12480 ?auto_12481 ) ) ( not ( = ?auto_12480 ?auto_12482 ) ) ( not ( = ?auto_12481 ?auto_12482 ) ) ( ON ?auto_12482 ?auto_12483 ) ( not ( = ?auto_12479 ?auto_12483 ) ) ( not ( = ?auto_12480 ?auto_12483 ) ) ( not ( = ?auto_12481 ?auto_12483 ) ) ( not ( = ?auto_12482 ?auto_12483 ) ) ( ON ?auto_12481 ?auto_12482 ) ( ON-TABLE ?auto_12483 ) ( ON ?auto_12480 ?auto_12481 ) ( CLEAR ?auto_12480 ) ( HOLDING ?auto_12479 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_12479 )
      ( MAKE-4PILE ?auto_12479 ?auto_12480 ?auto_12481 ?auto_12482 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12484 - BLOCK
      ?auto_12485 - BLOCK
      ?auto_12486 - BLOCK
      ?auto_12487 - BLOCK
    )
    :vars
    (
      ?auto_12488 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12484 ?auto_12485 ) ) ( not ( = ?auto_12484 ?auto_12486 ) ) ( not ( = ?auto_12484 ?auto_12487 ) ) ( not ( = ?auto_12485 ?auto_12486 ) ) ( not ( = ?auto_12485 ?auto_12487 ) ) ( not ( = ?auto_12486 ?auto_12487 ) ) ( ON ?auto_12487 ?auto_12488 ) ( not ( = ?auto_12484 ?auto_12488 ) ) ( not ( = ?auto_12485 ?auto_12488 ) ) ( not ( = ?auto_12486 ?auto_12488 ) ) ( not ( = ?auto_12487 ?auto_12488 ) ) ( ON ?auto_12486 ?auto_12487 ) ( ON-TABLE ?auto_12488 ) ( ON ?auto_12485 ?auto_12486 ) ( ON ?auto_12484 ?auto_12485 ) ( CLEAR ?auto_12484 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_12488 ?auto_12487 ?auto_12486 ?auto_12485 )
      ( MAKE-4PILE ?auto_12484 ?auto_12485 ?auto_12486 ?auto_12487 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12529 - BLOCK
    )
    :vars
    (
      ?auto_12530 - BLOCK
      ?auto_12531 - BLOCK
      ?auto_12532 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12529 ?auto_12530 ) ( CLEAR ?auto_12529 ) ( not ( = ?auto_12529 ?auto_12530 ) ) ( HOLDING ?auto_12531 ) ( CLEAR ?auto_12532 ) ( not ( = ?auto_12529 ?auto_12531 ) ) ( not ( = ?auto_12529 ?auto_12532 ) ) ( not ( = ?auto_12530 ?auto_12531 ) ) ( not ( = ?auto_12530 ?auto_12532 ) ) ( not ( = ?auto_12531 ?auto_12532 ) ) )
    :subtasks
    ( ( !STACK ?auto_12531 ?auto_12532 )
      ( MAKE-1PILE ?auto_12529 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12533 - BLOCK
    )
    :vars
    (
      ?auto_12535 - BLOCK
      ?auto_12534 - BLOCK
      ?auto_12536 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12533 ?auto_12535 ) ( not ( = ?auto_12533 ?auto_12535 ) ) ( CLEAR ?auto_12534 ) ( not ( = ?auto_12533 ?auto_12536 ) ) ( not ( = ?auto_12533 ?auto_12534 ) ) ( not ( = ?auto_12535 ?auto_12536 ) ) ( not ( = ?auto_12535 ?auto_12534 ) ) ( not ( = ?auto_12536 ?auto_12534 ) ) ( ON ?auto_12536 ?auto_12533 ) ( CLEAR ?auto_12536 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_12535 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12535 ?auto_12533 )
      ( MAKE-1PILE ?auto_12533 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12537 - BLOCK
    )
    :vars
    (
      ?auto_12540 - BLOCK
      ?auto_12538 - BLOCK
      ?auto_12539 - BLOCK
      ?auto_12541 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12537 ?auto_12540 ) ( not ( = ?auto_12537 ?auto_12540 ) ) ( not ( = ?auto_12537 ?auto_12538 ) ) ( not ( = ?auto_12537 ?auto_12539 ) ) ( not ( = ?auto_12540 ?auto_12538 ) ) ( not ( = ?auto_12540 ?auto_12539 ) ) ( not ( = ?auto_12538 ?auto_12539 ) ) ( ON ?auto_12538 ?auto_12537 ) ( CLEAR ?auto_12538 ) ( ON-TABLE ?auto_12540 ) ( HOLDING ?auto_12539 ) ( CLEAR ?auto_12541 ) ( ON-TABLE ?auto_12541 ) ( not ( = ?auto_12541 ?auto_12539 ) ) ( not ( = ?auto_12537 ?auto_12541 ) ) ( not ( = ?auto_12540 ?auto_12541 ) ) ( not ( = ?auto_12538 ?auto_12541 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12541 ?auto_12539 )
      ( MAKE-1PILE ?auto_12537 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12542 - BLOCK
    )
    :vars
    (
      ?auto_12544 - BLOCK
      ?auto_12543 - BLOCK
      ?auto_12546 - BLOCK
      ?auto_12545 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12542 ?auto_12544 ) ( not ( = ?auto_12542 ?auto_12544 ) ) ( not ( = ?auto_12542 ?auto_12543 ) ) ( not ( = ?auto_12542 ?auto_12546 ) ) ( not ( = ?auto_12544 ?auto_12543 ) ) ( not ( = ?auto_12544 ?auto_12546 ) ) ( not ( = ?auto_12543 ?auto_12546 ) ) ( ON ?auto_12543 ?auto_12542 ) ( ON-TABLE ?auto_12544 ) ( CLEAR ?auto_12545 ) ( ON-TABLE ?auto_12545 ) ( not ( = ?auto_12545 ?auto_12546 ) ) ( not ( = ?auto_12542 ?auto_12545 ) ) ( not ( = ?auto_12544 ?auto_12545 ) ) ( not ( = ?auto_12543 ?auto_12545 ) ) ( ON ?auto_12546 ?auto_12543 ) ( CLEAR ?auto_12546 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12544 ?auto_12542 ?auto_12543 )
      ( MAKE-1PILE ?auto_12542 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12547 - BLOCK
    )
    :vars
    (
      ?auto_12548 - BLOCK
      ?auto_12550 - BLOCK
      ?auto_12551 - BLOCK
      ?auto_12549 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12547 ?auto_12548 ) ( not ( = ?auto_12547 ?auto_12548 ) ) ( not ( = ?auto_12547 ?auto_12550 ) ) ( not ( = ?auto_12547 ?auto_12551 ) ) ( not ( = ?auto_12548 ?auto_12550 ) ) ( not ( = ?auto_12548 ?auto_12551 ) ) ( not ( = ?auto_12550 ?auto_12551 ) ) ( ON ?auto_12550 ?auto_12547 ) ( ON-TABLE ?auto_12548 ) ( not ( = ?auto_12549 ?auto_12551 ) ) ( not ( = ?auto_12547 ?auto_12549 ) ) ( not ( = ?auto_12548 ?auto_12549 ) ) ( not ( = ?auto_12550 ?auto_12549 ) ) ( ON ?auto_12551 ?auto_12550 ) ( CLEAR ?auto_12551 ) ( HOLDING ?auto_12549 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_12549 )
      ( MAKE-1PILE ?auto_12547 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12552 - BLOCK
    )
    :vars
    (
      ?auto_12556 - BLOCK
      ?auto_12554 - BLOCK
      ?auto_12553 - BLOCK
      ?auto_12555 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12552 ?auto_12556 ) ( not ( = ?auto_12552 ?auto_12556 ) ) ( not ( = ?auto_12552 ?auto_12554 ) ) ( not ( = ?auto_12552 ?auto_12553 ) ) ( not ( = ?auto_12556 ?auto_12554 ) ) ( not ( = ?auto_12556 ?auto_12553 ) ) ( not ( = ?auto_12554 ?auto_12553 ) ) ( ON ?auto_12554 ?auto_12552 ) ( ON-TABLE ?auto_12556 ) ( not ( = ?auto_12555 ?auto_12553 ) ) ( not ( = ?auto_12552 ?auto_12555 ) ) ( not ( = ?auto_12556 ?auto_12555 ) ) ( not ( = ?auto_12554 ?auto_12555 ) ) ( ON ?auto_12553 ?auto_12554 ) ( ON ?auto_12555 ?auto_12553 ) ( CLEAR ?auto_12555 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_12556 ?auto_12552 ?auto_12554 ?auto_12553 )
      ( MAKE-1PILE ?auto_12552 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12562 - BLOCK
      ?auto_12563 - BLOCK
    )
    :vars
    (
      ?auto_12564 - BLOCK
      ?auto_12565 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12564 ?auto_12563 ) ( CLEAR ?auto_12564 ) ( ON-TABLE ?auto_12562 ) ( ON ?auto_12563 ?auto_12562 ) ( not ( = ?auto_12562 ?auto_12563 ) ) ( not ( = ?auto_12562 ?auto_12564 ) ) ( not ( = ?auto_12563 ?auto_12564 ) ) ( HOLDING ?auto_12565 ) ( not ( = ?auto_12562 ?auto_12565 ) ) ( not ( = ?auto_12563 ?auto_12565 ) ) ( not ( = ?auto_12564 ?auto_12565 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_12565 )
      ( MAKE-2PILE ?auto_12562 ?auto_12563 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12599 - BLOCK
      ?auto_12600 - BLOCK
    )
    :vars
    (
      ?auto_12601 - BLOCK
      ?auto_12602 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12599 ?auto_12600 ) ) ( ON ?auto_12600 ?auto_12601 ) ( not ( = ?auto_12599 ?auto_12601 ) ) ( not ( = ?auto_12600 ?auto_12601 ) ) ( ON ?auto_12599 ?auto_12600 ) ( CLEAR ?auto_12599 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_12602 ) ( ON ?auto_12601 ?auto_12602 ) ( not ( = ?auto_12602 ?auto_12601 ) ) ( not ( = ?auto_12602 ?auto_12600 ) ) ( not ( = ?auto_12602 ?auto_12599 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12602 ?auto_12601 ?auto_12600 )
      ( MAKE-2PILE ?auto_12599 ?auto_12600 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12605 - BLOCK
      ?auto_12606 - BLOCK
    )
    :vars
    (
      ?auto_12607 - BLOCK
      ?auto_12608 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12605 ?auto_12606 ) ) ( ON ?auto_12606 ?auto_12607 ) ( CLEAR ?auto_12606 ) ( not ( = ?auto_12605 ?auto_12607 ) ) ( not ( = ?auto_12606 ?auto_12607 ) ) ( ON ?auto_12605 ?auto_12608 ) ( CLEAR ?auto_12605 ) ( HAND-EMPTY ) ( not ( = ?auto_12605 ?auto_12608 ) ) ( not ( = ?auto_12606 ?auto_12608 ) ) ( not ( = ?auto_12607 ?auto_12608 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_12605 ?auto_12608 )
      ( MAKE-2PILE ?auto_12605 ?auto_12606 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12609 - BLOCK
      ?auto_12610 - BLOCK
    )
    :vars
    (
      ?auto_12611 - BLOCK
      ?auto_12612 - BLOCK
      ?auto_12613 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12609 ?auto_12610 ) ) ( not ( = ?auto_12609 ?auto_12611 ) ) ( not ( = ?auto_12610 ?auto_12611 ) ) ( ON ?auto_12609 ?auto_12612 ) ( CLEAR ?auto_12609 ) ( not ( = ?auto_12609 ?auto_12612 ) ) ( not ( = ?auto_12610 ?auto_12612 ) ) ( not ( = ?auto_12611 ?auto_12612 ) ) ( HOLDING ?auto_12610 ) ( CLEAR ?auto_12611 ) ( ON-TABLE ?auto_12613 ) ( ON ?auto_12611 ?auto_12613 ) ( not ( = ?auto_12613 ?auto_12611 ) ) ( not ( = ?auto_12613 ?auto_12610 ) ) ( not ( = ?auto_12609 ?auto_12613 ) ) ( not ( = ?auto_12612 ?auto_12613 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12613 ?auto_12611 ?auto_12610 )
      ( MAKE-2PILE ?auto_12609 ?auto_12610 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12614 - BLOCK
      ?auto_12615 - BLOCK
    )
    :vars
    (
      ?auto_12618 - BLOCK
      ?auto_12616 - BLOCK
      ?auto_12617 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12614 ?auto_12615 ) ) ( not ( = ?auto_12614 ?auto_12618 ) ) ( not ( = ?auto_12615 ?auto_12618 ) ) ( ON ?auto_12614 ?auto_12616 ) ( not ( = ?auto_12614 ?auto_12616 ) ) ( not ( = ?auto_12615 ?auto_12616 ) ) ( not ( = ?auto_12618 ?auto_12616 ) ) ( CLEAR ?auto_12618 ) ( ON-TABLE ?auto_12617 ) ( ON ?auto_12618 ?auto_12617 ) ( not ( = ?auto_12617 ?auto_12618 ) ) ( not ( = ?auto_12617 ?auto_12615 ) ) ( not ( = ?auto_12614 ?auto_12617 ) ) ( not ( = ?auto_12616 ?auto_12617 ) ) ( ON ?auto_12615 ?auto_12614 ) ( CLEAR ?auto_12615 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_12616 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12616 ?auto_12614 )
      ( MAKE-2PILE ?auto_12614 ?auto_12615 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12619 - BLOCK
      ?auto_12620 - BLOCK
    )
    :vars
    (
      ?auto_12621 - BLOCK
      ?auto_12622 - BLOCK
      ?auto_12623 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12619 ?auto_12620 ) ) ( not ( = ?auto_12619 ?auto_12621 ) ) ( not ( = ?auto_12620 ?auto_12621 ) ) ( ON ?auto_12619 ?auto_12622 ) ( not ( = ?auto_12619 ?auto_12622 ) ) ( not ( = ?auto_12620 ?auto_12622 ) ) ( not ( = ?auto_12621 ?auto_12622 ) ) ( ON-TABLE ?auto_12623 ) ( not ( = ?auto_12623 ?auto_12621 ) ) ( not ( = ?auto_12623 ?auto_12620 ) ) ( not ( = ?auto_12619 ?auto_12623 ) ) ( not ( = ?auto_12622 ?auto_12623 ) ) ( ON ?auto_12620 ?auto_12619 ) ( CLEAR ?auto_12620 ) ( ON-TABLE ?auto_12622 ) ( HOLDING ?auto_12621 ) ( CLEAR ?auto_12623 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12623 ?auto_12621 )
      ( MAKE-2PILE ?auto_12619 ?auto_12620 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12624 - BLOCK
      ?auto_12625 - BLOCK
    )
    :vars
    (
      ?auto_12627 - BLOCK
      ?auto_12626 - BLOCK
      ?auto_12628 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12624 ?auto_12625 ) ) ( not ( = ?auto_12624 ?auto_12627 ) ) ( not ( = ?auto_12625 ?auto_12627 ) ) ( ON ?auto_12624 ?auto_12626 ) ( not ( = ?auto_12624 ?auto_12626 ) ) ( not ( = ?auto_12625 ?auto_12626 ) ) ( not ( = ?auto_12627 ?auto_12626 ) ) ( ON-TABLE ?auto_12628 ) ( not ( = ?auto_12628 ?auto_12627 ) ) ( not ( = ?auto_12628 ?auto_12625 ) ) ( not ( = ?auto_12624 ?auto_12628 ) ) ( not ( = ?auto_12626 ?auto_12628 ) ) ( ON ?auto_12625 ?auto_12624 ) ( ON-TABLE ?auto_12626 ) ( CLEAR ?auto_12628 ) ( ON ?auto_12627 ?auto_12625 ) ( CLEAR ?auto_12627 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12626 ?auto_12624 ?auto_12625 )
      ( MAKE-2PILE ?auto_12624 ?auto_12625 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12629 - BLOCK
      ?auto_12630 - BLOCK
    )
    :vars
    (
      ?auto_12632 - BLOCK
      ?auto_12631 - BLOCK
      ?auto_12633 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12629 ?auto_12630 ) ) ( not ( = ?auto_12629 ?auto_12632 ) ) ( not ( = ?auto_12630 ?auto_12632 ) ) ( ON ?auto_12629 ?auto_12631 ) ( not ( = ?auto_12629 ?auto_12631 ) ) ( not ( = ?auto_12630 ?auto_12631 ) ) ( not ( = ?auto_12632 ?auto_12631 ) ) ( not ( = ?auto_12633 ?auto_12632 ) ) ( not ( = ?auto_12633 ?auto_12630 ) ) ( not ( = ?auto_12629 ?auto_12633 ) ) ( not ( = ?auto_12631 ?auto_12633 ) ) ( ON ?auto_12630 ?auto_12629 ) ( ON-TABLE ?auto_12631 ) ( ON ?auto_12632 ?auto_12630 ) ( CLEAR ?auto_12632 ) ( HOLDING ?auto_12633 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_12633 )
      ( MAKE-2PILE ?auto_12629 ?auto_12630 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12634 - BLOCK
      ?auto_12635 - BLOCK
    )
    :vars
    (
      ?auto_12636 - BLOCK
      ?auto_12638 - BLOCK
      ?auto_12637 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12634 ?auto_12635 ) ) ( not ( = ?auto_12634 ?auto_12636 ) ) ( not ( = ?auto_12635 ?auto_12636 ) ) ( ON ?auto_12634 ?auto_12638 ) ( not ( = ?auto_12634 ?auto_12638 ) ) ( not ( = ?auto_12635 ?auto_12638 ) ) ( not ( = ?auto_12636 ?auto_12638 ) ) ( not ( = ?auto_12637 ?auto_12636 ) ) ( not ( = ?auto_12637 ?auto_12635 ) ) ( not ( = ?auto_12634 ?auto_12637 ) ) ( not ( = ?auto_12638 ?auto_12637 ) ) ( ON ?auto_12635 ?auto_12634 ) ( ON-TABLE ?auto_12638 ) ( ON ?auto_12636 ?auto_12635 ) ( ON ?auto_12637 ?auto_12636 ) ( CLEAR ?auto_12637 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_12638 ?auto_12634 ?auto_12635 ?auto_12636 )
      ( MAKE-2PILE ?auto_12634 ?auto_12635 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12650 - BLOCK
    )
    :vars
    (
      ?auto_12653 - BLOCK
      ?auto_12651 - BLOCK
      ?auto_12652 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12653 ?auto_12650 ) ( ON-TABLE ?auto_12650 ) ( not ( = ?auto_12650 ?auto_12653 ) ) ( not ( = ?auto_12650 ?auto_12651 ) ) ( not ( = ?auto_12650 ?auto_12652 ) ) ( not ( = ?auto_12653 ?auto_12651 ) ) ( not ( = ?auto_12653 ?auto_12652 ) ) ( not ( = ?auto_12651 ?auto_12652 ) ) ( ON ?auto_12651 ?auto_12653 ) ( CLEAR ?auto_12651 ) ( HOLDING ?auto_12652 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_12652 )
      ( MAKE-1PILE ?auto_12650 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12683 - BLOCK
      ?auto_12684 - BLOCK
      ?auto_12685 - BLOCK
    )
    :vars
    (
      ?auto_12686 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_12683 ) ( not ( = ?auto_12683 ?auto_12684 ) ) ( not ( = ?auto_12683 ?auto_12685 ) ) ( not ( = ?auto_12684 ?auto_12685 ) ) ( ON ?auto_12685 ?auto_12686 ) ( not ( = ?auto_12683 ?auto_12686 ) ) ( not ( = ?auto_12684 ?auto_12686 ) ) ( not ( = ?auto_12685 ?auto_12686 ) ) ( CLEAR ?auto_12683 ) ( ON ?auto_12684 ?auto_12685 ) ( CLEAR ?auto_12684 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_12686 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12686 ?auto_12685 )
      ( MAKE-3PILE ?auto_12683 ?auto_12684 ?auto_12685 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12687 - BLOCK
      ?auto_12688 - BLOCK
      ?auto_12689 - BLOCK
    )
    :vars
    (
      ?auto_12690 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12687 ?auto_12688 ) ) ( not ( = ?auto_12687 ?auto_12689 ) ) ( not ( = ?auto_12688 ?auto_12689 ) ) ( ON ?auto_12689 ?auto_12690 ) ( not ( = ?auto_12687 ?auto_12690 ) ) ( not ( = ?auto_12688 ?auto_12690 ) ) ( not ( = ?auto_12689 ?auto_12690 ) ) ( ON ?auto_12688 ?auto_12689 ) ( CLEAR ?auto_12688 ) ( ON-TABLE ?auto_12690 ) ( HOLDING ?auto_12687 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_12687 )
      ( MAKE-3PILE ?auto_12687 ?auto_12688 ?auto_12689 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12691 - BLOCK
      ?auto_12692 - BLOCK
      ?auto_12693 - BLOCK
    )
    :vars
    (
      ?auto_12694 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12691 ?auto_12692 ) ) ( not ( = ?auto_12691 ?auto_12693 ) ) ( not ( = ?auto_12692 ?auto_12693 ) ) ( ON ?auto_12693 ?auto_12694 ) ( not ( = ?auto_12691 ?auto_12694 ) ) ( not ( = ?auto_12692 ?auto_12694 ) ) ( not ( = ?auto_12693 ?auto_12694 ) ) ( ON ?auto_12692 ?auto_12693 ) ( ON-TABLE ?auto_12694 ) ( ON ?auto_12691 ?auto_12692 ) ( CLEAR ?auto_12691 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12694 ?auto_12693 ?auto_12692 )
      ( MAKE-3PILE ?auto_12691 ?auto_12692 ?auto_12693 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12698 - BLOCK
      ?auto_12699 - BLOCK
      ?auto_12700 - BLOCK
    )
    :vars
    (
      ?auto_12701 - BLOCK
      ?auto_12702 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12698 ?auto_12699 ) ) ( not ( = ?auto_12698 ?auto_12700 ) ) ( not ( = ?auto_12699 ?auto_12700 ) ) ( ON ?auto_12700 ?auto_12701 ) ( not ( = ?auto_12698 ?auto_12701 ) ) ( not ( = ?auto_12699 ?auto_12701 ) ) ( not ( = ?auto_12700 ?auto_12701 ) ) ( ON ?auto_12699 ?auto_12700 ) ( CLEAR ?auto_12699 ) ( ON-TABLE ?auto_12701 ) ( ON ?auto_12698 ?auto_12702 ) ( CLEAR ?auto_12698 ) ( HAND-EMPTY ) ( not ( = ?auto_12698 ?auto_12702 ) ) ( not ( = ?auto_12699 ?auto_12702 ) ) ( not ( = ?auto_12700 ?auto_12702 ) ) ( not ( = ?auto_12701 ?auto_12702 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_12698 ?auto_12702 )
      ( MAKE-3PILE ?auto_12698 ?auto_12699 ?auto_12700 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12703 - BLOCK
      ?auto_12704 - BLOCK
      ?auto_12705 - BLOCK
    )
    :vars
    (
      ?auto_12707 - BLOCK
      ?auto_12706 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12703 ?auto_12704 ) ) ( not ( = ?auto_12703 ?auto_12705 ) ) ( not ( = ?auto_12704 ?auto_12705 ) ) ( ON ?auto_12705 ?auto_12707 ) ( not ( = ?auto_12703 ?auto_12707 ) ) ( not ( = ?auto_12704 ?auto_12707 ) ) ( not ( = ?auto_12705 ?auto_12707 ) ) ( ON-TABLE ?auto_12707 ) ( ON ?auto_12703 ?auto_12706 ) ( CLEAR ?auto_12703 ) ( not ( = ?auto_12703 ?auto_12706 ) ) ( not ( = ?auto_12704 ?auto_12706 ) ) ( not ( = ?auto_12705 ?auto_12706 ) ) ( not ( = ?auto_12707 ?auto_12706 ) ) ( HOLDING ?auto_12704 ) ( CLEAR ?auto_12705 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12707 ?auto_12705 ?auto_12704 )
      ( MAKE-3PILE ?auto_12703 ?auto_12704 ?auto_12705 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12708 - BLOCK
      ?auto_12709 - BLOCK
      ?auto_12710 - BLOCK
    )
    :vars
    (
      ?auto_12712 - BLOCK
      ?auto_12711 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12708 ?auto_12709 ) ) ( not ( = ?auto_12708 ?auto_12710 ) ) ( not ( = ?auto_12709 ?auto_12710 ) ) ( ON ?auto_12710 ?auto_12712 ) ( not ( = ?auto_12708 ?auto_12712 ) ) ( not ( = ?auto_12709 ?auto_12712 ) ) ( not ( = ?auto_12710 ?auto_12712 ) ) ( ON-TABLE ?auto_12712 ) ( ON ?auto_12708 ?auto_12711 ) ( not ( = ?auto_12708 ?auto_12711 ) ) ( not ( = ?auto_12709 ?auto_12711 ) ) ( not ( = ?auto_12710 ?auto_12711 ) ) ( not ( = ?auto_12712 ?auto_12711 ) ) ( CLEAR ?auto_12710 ) ( ON ?auto_12709 ?auto_12708 ) ( CLEAR ?auto_12709 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_12711 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12711 ?auto_12708 )
      ( MAKE-3PILE ?auto_12708 ?auto_12709 ?auto_12710 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12713 - BLOCK
      ?auto_12714 - BLOCK
      ?auto_12715 - BLOCK
    )
    :vars
    (
      ?auto_12716 - BLOCK
      ?auto_12717 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12713 ?auto_12714 ) ) ( not ( = ?auto_12713 ?auto_12715 ) ) ( not ( = ?auto_12714 ?auto_12715 ) ) ( not ( = ?auto_12713 ?auto_12716 ) ) ( not ( = ?auto_12714 ?auto_12716 ) ) ( not ( = ?auto_12715 ?auto_12716 ) ) ( ON-TABLE ?auto_12716 ) ( ON ?auto_12713 ?auto_12717 ) ( not ( = ?auto_12713 ?auto_12717 ) ) ( not ( = ?auto_12714 ?auto_12717 ) ) ( not ( = ?auto_12715 ?auto_12717 ) ) ( not ( = ?auto_12716 ?auto_12717 ) ) ( ON ?auto_12714 ?auto_12713 ) ( CLEAR ?auto_12714 ) ( ON-TABLE ?auto_12717 ) ( HOLDING ?auto_12715 ) ( CLEAR ?auto_12716 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12716 ?auto_12715 )
      ( MAKE-3PILE ?auto_12713 ?auto_12714 ?auto_12715 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12718 - BLOCK
      ?auto_12719 - BLOCK
      ?auto_12720 - BLOCK
    )
    :vars
    (
      ?auto_12721 - BLOCK
      ?auto_12722 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12718 ?auto_12719 ) ) ( not ( = ?auto_12718 ?auto_12720 ) ) ( not ( = ?auto_12719 ?auto_12720 ) ) ( not ( = ?auto_12718 ?auto_12721 ) ) ( not ( = ?auto_12719 ?auto_12721 ) ) ( not ( = ?auto_12720 ?auto_12721 ) ) ( ON-TABLE ?auto_12721 ) ( ON ?auto_12718 ?auto_12722 ) ( not ( = ?auto_12718 ?auto_12722 ) ) ( not ( = ?auto_12719 ?auto_12722 ) ) ( not ( = ?auto_12720 ?auto_12722 ) ) ( not ( = ?auto_12721 ?auto_12722 ) ) ( ON ?auto_12719 ?auto_12718 ) ( ON-TABLE ?auto_12722 ) ( CLEAR ?auto_12721 ) ( ON ?auto_12720 ?auto_12719 ) ( CLEAR ?auto_12720 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12722 ?auto_12718 ?auto_12719 )
      ( MAKE-3PILE ?auto_12718 ?auto_12719 ?auto_12720 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12723 - BLOCK
      ?auto_12724 - BLOCK
      ?auto_12725 - BLOCK
    )
    :vars
    (
      ?auto_12726 - BLOCK
      ?auto_12727 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12723 ?auto_12724 ) ) ( not ( = ?auto_12723 ?auto_12725 ) ) ( not ( = ?auto_12724 ?auto_12725 ) ) ( not ( = ?auto_12723 ?auto_12726 ) ) ( not ( = ?auto_12724 ?auto_12726 ) ) ( not ( = ?auto_12725 ?auto_12726 ) ) ( ON ?auto_12723 ?auto_12727 ) ( not ( = ?auto_12723 ?auto_12727 ) ) ( not ( = ?auto_12724 ?auto_12727 ) ) ( not ( = ?auto_12725 ?auto_12727 ) ) ( not ( = ?auto_12726 ?auto_12727 ) ) ( ON ?auto_12724 ?auto_12723 ) ( ON-TABLE ?auto_12727 ) ( ON ?auto_12725 ?auto_12724 ) ( CLEAR ?auto_12725 ) ( HOLDING ?auto_12726 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_12726 )
      ( MAKE-3PILE ?auto_12723 ?auto_12724 ?auto_12725 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12728 - BLOCK
      ?auto_12729 - BLOCK
      ?auto_12730 - BLOCK
    )
    :vars
    (
      ?auto_12731 - BLOCK
      ?auto_12732 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12728 ?auto_12729 ) ) ( not ( = ?auto_12728 ?auto_12730 ) ) ( not ( = ?auto_12729 ?auto_12730 ) ) ( not ( = ?auto_12728 ?auto_12731 ) ) ( not ( = ?auto_12729 ?auto_12731 ) ) ( not ( = ?auto_12730 ?auto_12731 ) ) ( ON ?auto_12728 ?auto_12732 ) ( not ( = ?auto_12728 ?auto_12732 ) ) ( not ( = ?auto_12729 ?auto_12732 ) ) ( not ( = ?auto_12730 ?auto_12732 ) ) ( not ( = ?auto_12731 ?auto_12732 ) ) ( ON ?auto_12729 ?auto_12728 ) ( ON-TABLE ?auto_12732 ) ( ON ?auto_12730 ?auto_12729 ) ( ON ?auto_12731 ?auto_12730 ) ( CLEAR ?auto_12731 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_12732 ?auto_12728 ?auto_12729 ?auto_12730 )
      ( MAKE-3PILE ?auto_12728 ?auto_12729 ?auto_12730 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12741 - BLOCK
      ?auto_12742 - BLOCK
      ?auto_12743 - BLOCK
      ?auto_12744 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_12743 ) ( ON-TABLE ?auto_12741 ) ( ON ?auto_12742 ?auto_12741 ) ( ON ?auto_12743 ?auto_12742 ) ( not ( = ?auto_12741 ?auto_12742 ) ) ( not ( = ?auto_12741 ?auto_12743 ) ) ( not ( = ?auto_12741 ?auto_12744 ) ) ( not ( = ?auto_12742 ?auto_12743 ) ) ( not ( = ?auto_12742 ?auto_12744 ) ) ( not ( = ?auto_12743 ?auto_12744 ) ) ( ON-TABLE ?auto_12744 ) ( CLEAR ?auto_12744 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_12744 )
      ( MAKE-4PILE ?auto_12741 ?auto_12742 ?auto_12743 ?auto_12744 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12745 - BLOCK
      ?auto_12746 - BLOCK
      ?auto_12747 - BLOCK
      ?auto_12748 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_12745 ) ( ON ?auto_12746 ?auto_12745 ) ( not ( = ?auto_12745 ?auto_12746 ) ) ( not ( = ?auto_12745 ?auto_12747 ) ) ( not ( = ?auto_12745 ?auto_12748 ) ) ( not ( = ?auto_12746 ?auto_12747 ) ) ( not ( = ?auto_12746 ?auto_12748 ) ) ( not ( = ?auto_12747 ?auto_12748 ) ) ( ON-TABLE ?auto_12748 ) ( CLEAR ?auto_12748 ) ( HOLDING ?auto_12747 ) ( CLEAR ?auto_12746 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12745 ?auto_12746 ?auto_12747 )
      ( MAKE-4PILE ?auto_12745 ?auto_12746 ?auto_12747 ?auto_12748 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12749 - BLOCK
      ?auto_12750 - BLOCK
      ?auto_12751 - BLOCK
      ?auto_12752 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_12749 ) ( ON ?auto_12750 ?auto_12749 ) ( not ( = ?auto_12749 ?auto_12750 ) ) ( not ( = ?auto_12749 ?auto_12751 ) ) ( not ( = ?auto_12749 ?auto_12752 ) ) ( not ( = ?auto_12750 ?auto_12751 ) ) ( not ( = ?auto_12750 ?auto_12752 ) ) ( not ( = ?auto_12751 ?auto_12752 ) ) ( ON-TABLE ?auto_12752 ) ( CLEAR ?auto_12750 ) ( ON ?auto_12751 ?auto_12752 ) ( CLEAR ?auto_12751 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_12752 )
      ( MAKE-4PILE ?auto_12749 ?auto_12750 ?auto_12751 ?auto_12752 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12753 - BLOCK
      ?auto_12754 - BLOCK
      ?auto_12755 - BLOCK
      ?auto_12756 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_12753 ) ( not ( = ?auto_12753 ?auto_12754 ) ) ( not ( = ?auto_12753 ?auto_12755 ) ) ( not ( = ?auto_12753 ?auto_12756 ) ) ( not ( = ?auto_12754 ?auto_12755 ) ) ( not ( = ?auto_12754 ?auto_12756 ) ) ( not ( = ?auto_12755 ?auto_12756 ) ) ( ON-TABLE ?auto_12756 ) ( ON ?auto_12755 ?auto_12756 ) ( CLEAR ?auto_12755 ) ( HOLDING ?auto_12754 ) ( CLEAR ?auto_12753 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12753 ?auto_12754 )
      ( MAKE-4PILE ?auto_12753 ?auto_12754 ?auto_12755 ?auto_12756 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12757 - BLOCK
      ?auto_12758 - BLOCK
      ?auto_12759 - BLOCK
      ?auto_12760 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_12757 ) ( not ( = ?auto_12757 ?auto_12758 ) ) ( not ( = ?auto_12757 ?auto_12759 ) ) ( not ( = ?auto_12757 ?auto_12760 ) ) ( not ( = ?auto_12758 ?auto_12759 ) ) ( not ( = ?auto_12758 ?auto_12760 ) ) ( not ( = ?auto_12759 ?auto_12760 ) ) ( ON-TABLE ?auto_12760 ) ( ON ?auto_12759 ?auto_12760 ) ( CLEAR ?auto_12757 ) ( ON ?auto_12758 ?auto_12759 ) ( CLEAR ?auto_12758 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12760 ?auto_12759 )
      ( MAKE-4PILE ?auto_12757 ?auto_12758 ?auto_12759 ?auto_12760 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12761 - BLOCK
      ?auto_12762 - BLOCK
      ?auto_12763 - BLOCK
      ?auto_12764 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12761 ?auto_12762 ) ) ( not ( = ?auto_12761 ?auto_12763 ) ) ( not ( = ?auto_12761 ?auto_12764 ) ) ( not ( = ?auto_12762 ?auto_12763 ) ) ( not ( = ?auto_12762 ?auto_12764 ) ) ( not ( = ?auto_12763 ?auto_12764 ) ) ( ON-TABLE ?auto_12764 ) ( ON ?auto_12763 ?auto_12764 ) ( ON ?auto_12762 ?auto_12763 ) ( CLEAR ?auto_12762 ) ( HOLDING ?auto_12761 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_12761 )
      ( MAKE-4PILE ?auto_12761 ?auto_12762 ?auto_12763 ?auto_12764 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12765 - BLOCK
      ?auto_12766 - BLOCK
      ?auto_12767 - BLOCK
      ?auto_12768 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12765 ?auto_12766 ) ) ( not ( = ?auto_12765 ?auto_12767 ) ) ( not ( = ?auto_12765 ?auto_12768 ) ) ( not ( = ?auto_12766 ?auto_12767 ) ) ( not ( = ?auto_12766 ?auto_12768 ) ) ( not ( = ?auto_12767 ?auto_12768 ) ) ( ON-TABLE ?auto_12768 ) ( ON ?auto_12767 ?auto_12768 ) ( ON ?auto_12766 ?auto_12767 ) ( ON ?auto_12765 ?auto_12766 ) ( CLEAR ?auto_12765 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12768 ?auto_12767 ?auto_12766 )
      ( MAKE-4PILE ?auto_12765 ?auto_12766 ?auto_12767 ?auto_12768 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12773 - BLOCK
      ?auto_12774 - BLOCK
      ?auto_12775 - BLOCK
      ?auto_12776 - BLOCK
    )
    :vars
    (
      ?auto_12777 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12773 ?auto_12774 ) ) ( not ( = ?auto_12773 ?auto_12775 ) ) ( not ( = ?auto_12773 ?auto_12776 ) ) ( not ( = ?auto_12774 ?auto_12775 ) ) ( not ( = ?auto_12774 ?auto_12776 ) ) ( not ( = ?auto_12775 ?auto_12776 ) ) ( ON-TABLE ?auto_12776 ) ( ON ?auto_12775 ?auto_12776 ) ( ON ?auto_12774 ?auto_12775 ) ( CLEAR ?auto_12774 ) ( ON ?auto_12773 ?auto_12777 ) ( CLEAR ?auto_12773 ) ( HAND-EMPTY ) ( not ( = ?auto_12773 ?auto_12777 ) ) ( not ( = ?auto_12774 ?auto_12777 ) ) ( not ( = ?auto_12775 ?auto_12777 ) ) ( not ( = ?auto_12776 ?auto_12777 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_12773 ?auto_12777 )
      ( MAKE-4PILE ?auto_12773 ?auto_12774 ?auto_12775 ?auto_12776 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12778 - BLOCK
      ?auto_12779 - BLOCK
      ?auto_12780 - BLOCK
      ?auto_12781 - BLOCK
    )
    :vars
    (
      ?auto_12782 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12778 ?auto_12779 ) ) ( not ( = ?auto_12778 ?auto_12780 ) ) ( not ( = ?auto_12778 ?auto_12781 ) ) ( not ( = ?auto_12779 ?auto_12780 ) ) ( not ( = ?auto_12779 ?auto_12781 ) ) ( not ( = ?auto_12780 ?auto_12781 ) ) ( ON-TABLE ?auto_12781 ) ( ON ?auto_12780 ?auto_12781 ) ( ON ?auto_12778 ?auto_12782 ) ( CLEAR ?auto_12778 ) ( not ( = ?auto_12778 ?auto_12782 ) ) ( not ( = ?auto_12779 ?auto_12782 ) ) ( not ( = ?auto_12780 ?auto_12782 ) ) ( not ( = ?auto_12781 ?auto_12782 ) ) ( HOLDING ?auto_12779 ) ( CLEAR ?auto_12780 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12781 ?auto_12780 ?auto_12779 )
      ( MAKE-4PILE ?auto_12778 ?auto_12779 ?auto_12780 ?auto_12781 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12783 - BLOCK
      ?auto_12784 - BLOCK
      ?auto_12785 - BLOCK
      ?auto_12786 - BLOCK
    )
    :vars
    (
      ?auto_12787 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12783 ?auto_12784 ) ) ( not ( = ?auto_12783 ?auto_12785 ) ) ( not ( = ?auto_12783 ?auto_12786 ) ) ( not ( = ?auto_12784 ?auto_12785 ) ) ( not ( = ?auto_12784 ?auto_12786 ) ) ( not ( = ?auto_12785 ?auto_12786 ) ) ( ON-TABLE ?auto_12786 ) ( ON ?auto_12785 ?auto_12786 ) ( ON ?auto_12783 ?auto_12787 ) ( not ( = ?auto_12783 ?auto_12787 ) ) ( not ( = ?auto_12784 ?auto_12787 ) ) ( not ( = ?auto_12785 ?auto_12787 ) ) ( not ( = ?auto_12786 ?auto_12787 ) ) ( CLEAR ?auto_12785 ) ( ON ?auto_12784 ?auto_12783 ) ( CLEAR ?auto_12784 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_12787 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12787 ?auto_12783 )
      ( MAKE-4PILE ?auto_12783 ?auto_12784 ?auto_12785 ?auto_12786 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12788 - BLOCK
      ?auto_12789 - BLOCK
      ?auto_12790 - BLOCK
      ?auto_12791 - BLOCK
    )
    :vars
    (
      ?auto_12792 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12788 ?auto_12789 ) ) ( not ( = ?auto_12788 ?auto_12790 ) ) ( not ( = ?auto_12788 ?auto_12791 ) ) ( not ( = ?auto_12789 ?auto_12790 ) ) ( not ( = ?auto_12789 ?auto_12791 ) ) ( not ( = ?auto_12790 ?auto_12791 ) ) ( ON-TABLE ?auto_12791 ) ( ON ?auto_12788 ?auto_12792 ) ( not ( = ?auto_12788 ?auto_12792 ) ) ( not ( = ?auto_12789 ?auto_12792 ) ) ( not ( = ?auto_12790 ?auto_12792 ) ) ( not ( = ?auto_12791 ?auto_12792 ) ) ( ON ?auto_12789 ?auto_12788 ) ( CLEAR ?auto_12789 ) ( ON-TABLE ?auto_12792 ) ( HOLDING ?auto_12790 ) ( CLEAR ?auto_12791 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12791 ?auto_12790 )
      ( MAKE-4PILE ?auto_12788 ?auto_12789 ?auto_12790 ?auto_12791 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12793 - BLOCK
      ?auto_12794 - BLOCK
      ?auto_12795 - BLOCK
      ?auto_12796 - BLOCK
    )
    :vars
    (
      ?auto_12797 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12793 ?auto_12794 ) ) ( not ( = ?auto_12793 ?auto_12795 ) ) ( not ( = ?auto_12793 ?auto_12796 ) ) ( not ( = ?auto_12794 ?auto_12795 ) ) ( not ( = ?auto_12794 ?auto_12796 ) ) ( not ( = ?auto_12795 ?auto_12796 ) ) ( ON-TABLE ?auto_12796 ) ( ON ?auto_12793 ?auto_12797 ) ( not ( = ?auto_12793 ?auto_12797 ) ) ( not ( = ?auto_12794 ?auto_12797 ) ) ( not ( = ?auto_12795 ?auto_12797 ) ) ( not ( = ?auto_12796 ?auto_12797 ) ) ( ON ?auto_12794 ?auto_12793 ) ( ON-TABLE ?auto_12797 ) ( CLEAR ?auto_12796 ) ( ON ?auto_12795 ?auto_12794 ) ( CLEAR ?auto_12795 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12797 ?auto_12793 ?auto_12794 )
      ( MAKE-4PILE ?auto_12793 ?auto_12794 ?auto_12795 ?auto_12796 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12798 - BLOCK
      ?auto_12799 - BLOCK
      ?auto_12800 - BLOCK
      ?auto_12801 - BLOCK
    )
    :vars
    (
      ?auto_12802 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12798 ?auto_12799 ) ) ( not ( = ?auto_12798 ?auto_12800 ) ) ( not ( = ?auto_12798 ?auto_12801 ) ) ( not ( = ?auto_12799 ?auto_12800 ) ) ( not ( = ?auto_12799 ?auto_12801 ) ) ( not ( = ?auto_12800 ?auto_12801 ) ) ( ON ?auto_12798 ?auto_12802 ) ( not ( = ?auto_12798 ?auto_12802 ) ) ( not ( = ?auto_12799 ?auto_12802 ) ) ( not ( = ?auto_12800 ?auto_12802 ) ) ( not ( = ?auto_12801 ?auto_12802 ) ) ( ON ?auto_12799 ?auto_12798 ) ( ON-TABLE ?auto_12802 ) ( ON ?auto_12800 ?auto_12799 ) ( CLEAR ?auto_12800 ) ( HOLDING ?auto_12801 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_12801 )
      ( MAKE-4PILE ?auto_12798 ?auto_12799 ?auto_12800 ?auto_12801 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12803 - BLOCK
      ?auto_12804 - BLOCK
      ?auto_12805 - BLOCK
      ?auto_12806 - BLOCK
    )
    :vars
    (
      ?auto_12807 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12803 ?auto_12804 ) ) ( not ( = ?auto_12803 ?auto_12805 ) ) ( not ( = ?auto_12803 ?auto_12806 ) ) ( not ( = ?auto_12804 ?auto_12805 ) ) ( not ( = ?auto_12804 ?auto_12806 ) ) ( not ( = ?auto_12805 ?auto_12806 ) ) ( ON ?auto_12803 ?auto_12807 ) ( not ( = ?auto_12803 ?auto_12807 ) ) ( not ( = ?auto_12804 ?auto_12807 ) ) ( not ( = ?auto_12805 ?auto_12807 ) ) ( not ( = ?auto_12806 ?auto_12807 ) ) ( ON ?auto_12804 ?auto_12803 ) ( ON-TABLE ?auto_12807 ) ( ON ?auto_12805 ?auto_12804 ) ( ON ?auto_12806 ?auto_12805 ) ( CLEAR ?auto_12806 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_12807 ?auto_12803 ?auto_12804 ?auto_12805 )
      ( MAKE-4PILE ?auto_12803 ?auto_12804 ?auto_12805 ?auto_12806 ) )
  )

)

