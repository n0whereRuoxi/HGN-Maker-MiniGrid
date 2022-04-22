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
      ?auto_4341 - BLOCK
    )
    :vars
    (
      ?auto_4342 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4341 ?auto_4342 ) ( CLEAR ?auto_4341 ) ( HAND-EMPTY ) ( not ( = ?auto_4341 ?auto_4342 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4341 ?auto_4342 )
      ( !PUTDOWN ?auto_4341 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4348 - BLOCK
      ?auto_4349 - BLOCK
    )
    :vars
    (
      ?auto_4350 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_4348 ) ( ON ?auto_4349 ?auto_4350 ) ( CLEAR ?auto_4349 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4348 ) ( not ( = ?auto_4348 ?auto_4349 ) ) ( not ( = ?auto_4348 ?auto_4350 ) ) ( not ( = ?auto_4349 ?auto_4350 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4349 ?auto_4350 )
      ( !STACK ?auto_4349 ?auto_4348 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4358 - BLOCK
      ?auto_4359 - BLOCK
    )
    :vars
    (
      ?auto_4360 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4359 ?auto_4360 ) ( not ( = ?auto_4358 ?auto_4359 ) ) ( not ( = ?auto_4358 ?auto_4360 ) ) ( not ( = ?auto_4359 ?auto_4360 ) ) ( ON ?auto_4358 ?auto_4359 ) ( CLEAR ?auto_4358 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4358 )
      ( MAKE-2PILE ?auto_4358 ?auto_4359 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4369 - BLOCK
      ?auto_4370 - BLOCK
      ?auto_4371 - BLOCK
    )
    :vars
    (
      ?auto_4372 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_4370 ) ( ON ?auto_4371 ?auto_4372 ) ( CLEAR ?auto_4371 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4369 ) ( ON ?auto_4370 ?auto_4369 ) ( not ( = ?auto_4369 ?auto_4370 ) ) ( not ( = ?auto_4369 ?auto_4371 ) ) ( not ( = ?auto_4369 ?auto_4372 ) ) ( not ( = ?auto_4370 ?auto_4371 ) ) ( not ( = ?auto_4370 ?auto_4372 ) ) ( not ( = ?auto_4371 ?auto_4372 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4371 ?auto_4372 )
      ( !STACK ?auto_4371 ?auto_4370 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4383 - BLOCK
      ?auto_4384 - BLOCK
      ?auto_4385 - BLOCK
    )
    :vars
    (
      ?auto_4386 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4385 ?auto_4386 ) ( ON-TABLE ?auto_4383 ) ( not ( = ?auto_4383 ?auto_4384 ) ) ( not ( = ?auto_4383 ?auto_4385 ) ) ( not ( = ?auto_4383 ?auto_4386 ) ) ( not ( = ?auto_4384 ?auto_4385 ) ) ( not ( = ?auto_4384 ?auto_4386 ) ) ( not ( = ?auto_4385 ?auto_4386 ) ) ( CLEAR ?auto_4383 ) ( ON ?auto_4384 ?auto_4385 ) ( CLEAR ?auto_4384 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4383 ?auto_4384 )
      ( MAKE-3PILE ?auto_4383 ?auto_4384 ?auto_4385 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4397 - BLOCK
      ?auto_4398 - BLOCK
      ?auto_4399 - BLOCK
    )
    :vars
    (
      ?auto_4400 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4399 ?auto_4400 ) ( not ( = ?auto_4397 ?auto_4398 ) ) ( not ( = ?auto_4397 ?auto_4399 ) ) ( not ( = ?auto_4397 ?auto_4400 ) ) ( not ( = ?auto_4398 ?auto_4399 ) ) ( not ( = ?auto_4398 ?auto_4400 ) ) ( not ( = ?auto_4399 ?auto_4400 ) ) ( ON ?auto_4398 ?auto_4399 ) ( ON ?auto_4397 ?auto_4398 ) ( CLEAR ?auto_4397 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4397 )
      ( MAKE-3PILE ?auto_4397 ?auto_4398 ?auto_4399 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_4412 - BLOCK
      ?auto_4413 - BLOCK
      ?auto_4414 - BLOCK
      ?auto_4415 - BLOCK
    )
    :vars
    (
      ?auto_4416 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_4414 ) ( ON ?auto_4415 ?auto_4416 ) ( CLEAR ?auto_4415 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4412 ) ( ON ?auto_4413 ?auto_4412 ) ( ON ?auto_4414 ?auto_4413 ) ( not ( = ?auto_4412 ?auto_4413 ) ) ( not ( = ?auto_4412 ?auto_4414 ) ) ( not ( = ?auto_4412 ?auto_4415 ) ) ( not ( = ?auto_4412 ?auto_4416 ) ) ( not ( = ?auto_4413 ?auto_4414 ) ) ( not ( = ?auto_4413 ?auto_4415 ) ) ( not ( = ?auto_4413 ?auto_4416 ) ) ( not ( = ?auto_4414 ?auto_4415 ) ) ( not ( = ?auto_4414 ?auto_4416 ) ) ( not ( = ?auto_4415 ?auto_4416 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4415 ?auto_4416 )
      ( !STACK ?auto_4415 ?auto_4414 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_4421 - BLOCK
      ?auto_4422 - BLOCK
      ?auto_4423 - BLOCK
      ?auto_4424 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_4423 ) ( ON-TABLE ?auto_4424 ) ( CLEAR ?auto_4424 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4421 ) ( ON ?auto_4422 ?auto_4421 ) ( ON ?auto_4423 ?auto_4422 ) ( not ( = ?auto_4421 ?auto_4422 ) ) ( not ( = ?auto_4421 ?auto_4423 ) ) ( not ( = ?auto_4421 ?auto_4424 ) ) ( not ( = ?auto_4422 ?auto_4423 ) ) ( not ( = ?auto_4422 ?auto_4424 ) ) ( not ( = ?auto_4423 ?auto_4424 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_4424 )
      ( !STACK ?auto_4424 ?auto_4423 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_4429 - BLOCK
      ?auto_4430 - BLOCK
      ?auto_4431 - BLOCK
      ?auto_4432 - BLOCK
    )
    :vars
    (
      ?auto_4433 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4432 ?auto_4433 ) ( ON-TABLE ?auto_4429 ) ( ON ?auto_4430 ?auto_4429 ) ( not ( = ?auto_4429 ?auto_4430 ) ) ( not ( = ?auto_4429 ?auto_4431 ) ) ( not ( = ?auto_4429 ?auto_4432 ) ) ( not ( = ?auto_4429 ?auto_4433 ) ) ( not ( = ?auto_4430 ?auto_4431 ) ) ( not ( = ?auto_4430 ?auto_4432 ) ) ( not ( = ?auto_4430 ?auto_4433 ) ) ( not ( = ?auto_4431 ?auto_4432 ) ) ( not ( = ?auto_4431 ?auto_4433 ) ) ( not ( = ?auto_4432 ?auto_4433 ) ) ( CLEAR ?auto_4430 ) ( ON ?auto_4431 ?auto_4432 ) ( CLEAR ?auto_4431 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4429 ?auto_4430 ?auto_4431 )
      ( MAKE-4PILE ?auto_4429 ?auto_4430 ?auto_4431 ?auto_4432 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_4438 - BLOCK
      ?auto_4439 - BLOCK
      ?auto_4440 - BLOCK
      ?auto_4441 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_4441 ) ( ON-TABLE ?auto_4438 ) ( ON ?auto_4439 ?auto_4438 ) ( not ( = ?auto_4438 ?auto_4439 ) ) ( not ( = ?auto_4438 ?auto_4440 ) ) ( not ( = ?auto_4438 ?auto_4441 ) ) ( not ( = ?auto_4439 ?auto_4440 ) ) ( not ( = ?auto_4439 ?auto_4441 ) ) ( not ( = ?auto_4440 ?auto_4441 ) ) ( CLEAR ?auto_4439 ) ( ON ?auto_4440 ?auto_4441 ) ( CLEAR ?auto_4440 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4438 ?auto_4439 ?auto_4440 )
      ( MAKE-4PILE ?auto_4438 ?auto_4439 ?auto_4440 ?auto_4441 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_4446 - BLOCK
      ?auto_4447 - BLOCK
      ?auto_4448 - BLOCK
      ?auto_4449 - BLOCK
    )
    :vars
    (
      ?auto_4450 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4449 ?auto_4450 ) ( ON-TABLE ?auto_4446 ) ( not ( = ?auto_4446 ?auto_4447 ) ) ( not ( = ?auto_4446 ?auto_4448 ) ) ( not ( = ?auto_4446 ?auto_4449 ) ) ( not ( = ?auto_4446 ?auto_4450 ) ) ( not ( = ?auto_4447 ?auto_4448 ) ) ( not ( = ?auto_4447 ?auto_4449 ) ) ( not ( = ?auto_4447 ?auto_4450 ) ) ( not ( = ?auto_4448 ?auto_4449 ) ) ( not ( = ?auto_4448 ?auto_4450 ) ) ( not ( = ?auto_4449 ?auto_4450 ) ) ( ON ?auto_4448 ?auto_4449 ) ( CLEAR ?auto_4446 ) ( ON ?auto_4447 ?auto_4448 ) ( CLEAR ?auto_4447 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4446 ?auto_4447 )
      ( MAKE-4PILE ?auto_4446 ?auto_4447 ?auto_4448 ?auto_4449 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_4455 - BLOCK
      ?auto_4456 - BLOCK
      ?auto_4457 - BLOCK
      ?auto_4458 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_4458 ) ( ON-TABLE ?auto_4455 ) ( not ( = ?auto_4455 ?auto_4456 ) ) ( not ( = ?auto_4455 ?auto_4457 ) ) ( not ( = ?auto_4455 ?auto_4458 ) ) ( not ( = ?auto_4456 ?auto_4457 ) ) ( not ( = ?auto_4456 ?auto_4458 ) ) ( not ( = ?auto_4457 ?auto_4458 ) ) ( ON ?auto_4457 ?auto_4458 ) ( CLEAR ?auto_4455 ) ( ON ?auto_4456 ?auto_4457 ) ( CLEAR ?auto_4456 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4455 ?auto_4456 )
      ( MAKE-4PILE ?auto_4455 ?auto_4456 ?auto_4457 ?auto_4458 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_4463 - BLOCK
      ?auto_4464 - BLOCK
      ?auto_4465 - BLOCK
      ?auto_4466 - BLOCK
    )
    :vars
    (
      ?auto_4467 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4466 ?auto_4467 ) ( not ( = ?auto_4463 ?auto_4464 ) ) ( not ( = ?auto_4463 ?auto_4465 ) ) ( not ( = ?auto_4463 ?auto_4466 ) ) ( not ( = ?auto_4463 ?auto_4467 ) ) ( not ( = ?auto_4464 ?auto_4465 ) ) ( not ( = ?auto_4464 ?auto_4466 ) ) ( not ( = ?auto_4464 ?auto_4467 ) ) ( not ( = ?auto_4465 ?auto_4466 ) ) ( not ( = ?auto_4465 ?auto_4467 ) ) ( not ( = ?auto_4466 ?auto_4467 ) ) ( ON ?auto_4465 ?auto_4466 ) ( ON ?auto_4464 ?auto_4465 ) ( ON ?auto_4463 ?auto_4464 ) ( CLEAR ?auto_4463 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4463 )
      ( MAKE-4PILE ?auto_4463 ?auto_4464 ?auto_4465 ?auto_4466 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_4472 - BLOCK
      ?auto_4473 - BLOCK
      ?auto_4474 - BLOCK
      ?auto_4475 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_4475 ) ( not ( = ?auto_4472 ?auto_4473 ) ) ( not ( = ?auto_4472 ?auto_4474 ) ) ( not ( = ?auto_4472 ?auto_4475 ) ) ( not ( = ?auto_4473 ?auto_4474 ) ) ( not ( = ?auto_4473 ?auto_4475 ) ) ( not ( = ?auto_4474 ?auto_4475 ) ) ( ON ?auto_4474 ?auto_4475 ) ( ON ?auto_4473 ?auto_4474 ) ( ON ?auto_4472 ?auto_4473 ) ( CLEAR ?auto_4472 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4472 )
      ( MAKE-4PILE ?auto_4472 ?auto_4473 ?auto_4474 ?auto_4475 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_4480 - BLOCK
      ?auto_4481 - BLOCK
      ?auto_4482 - BLOCK
      ?auto_4483 - BLOCK
    )
    :vars
    (
      ?auto_4484 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4480 ?auto_4481 ) ) ( not ( = ?auto_4480 ?auto_4482 ) ) ( not ( = ?auto_4480 ?auto_4483 ) ) ( not ( = ?auto_4481 ?auto_4482 ) ) ( not ( = ?auto_4481 ?auto_4483 ) ) ( not ( = ?auto_4482 ?auto_4483 ) ) ( ON ?auto_4480 ?auto_4484 ) ( not ( = ?auto_4483 ?auto_4484 ) ) ( not ( = ?auto_4482 ?auto_4484 ) ) ( not ( = ?auto_4481 ?auto_4484 ) ) ( not ( = ?auto_4480 ?auto_4484 ) ) ( ON ?auto_4481 ?auto_4480 ) ( ON ?auto_4482 ?auto_4481 ) ( ON ?auto_4483 ?auto_4482 ) ( CLEAR ?auto_4483 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_4483 ?auto_4482 ?auto_4481 ?auto_4480 )
      ( MAKE-4PILE ?auto_4480 ?auto_4481 ?auto_4482 ?auto_4483 ) )
  )

)

