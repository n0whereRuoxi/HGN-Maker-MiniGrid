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

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4373 - BLOCK
      ?auto_4374 - BLOCK
      ?auto_4375 - BLOCK
    )
    :vars
    (
      ?auto_4376 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4376 ?auto_4375 ) ( CLEAR ?auto_4376 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4373 ) ( ON ?auto_4374 ?auto_4373 ) ( ON ?auto_4375 ?auto_4374 ) ( not ( = ?auto_4373 ?auto_4374 ) ) ( not ( = ?auto_4373 ?auto_4375 ) ) ( not ( = ?auto_4373 ?auto_4376 ) ) ( not ( = ?auto_4374 ?auto_4375 ) ) ( not ( = ?auto_4374 ?auto_4376 ) ) ( not ( = ?auto_4375 ?auto_4376 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4376 ?auto_4375 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4378 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_4378 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_4378 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4379 - BLOCK
    )
    :vars
    (
      ?auto_4380 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4379 ?auto_4380 ) ( CLEAR ?auto_4379 ) ( HAND-EMPTY ) ( not ( = ?auto_4379 ?auto_4380 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4379 ?auto_4380 )
      ( MAKE-1PILE ?auto_4379 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4383 - BLOCK
      ?auto_4384 - BLOCK
    )
    :vars
    (
      ?auto_4385 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4385 ?auto_4384 ) ( CLEAR ?auto_4385 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4383 ) ( ON ?auto_4384 ?auto_4383 ) ( not ( = ?auto_4383 ?auto_4384 ) ) ( not ( = ?auto_4383 ?auto_4385 ) ) ( not ( = ?auto_4384 ?auto_4385 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4385 ?auto_4384 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4386 - BLOCK
      ?auto_4387 - BLOCK
    )
    :vars
    (
      ?auto_4388 - BLOCK
      ?auto_4389 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4388 ?auto_4387 ) ( CLEAR ?auto_4388 ) ( ON-TABLE ?auto_4386 ) ( ON ?auto_4387 ?auto_4386 ) ( not ( = ?auto_4386 ?auto_4387 ) ) ( not ( = ?auto_4386 ?auto_4388 ) ) ( not ( = ?auto_4387 ?auto_4388 ) ) ( HOLDING ?auto_4389 ) ( not ( = ?auto_4386 ?auto_4389 ) ) ( not ( = ?auto_4387 ?auto_4389 ) ) ( not ( = ?auto_4388 ?auto_4389 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_4389 )
      ( MAKE-2PILE ?auto_4386 ?auto_4387 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4390 - BLOCK
      ?auto_4391 - BLOCK
    )
    :vars
    (
      ?auto_4392 - BLOCK
      ?auto_4393 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4392 ?auto_4391 ) ( ON-TABLE ?auto_4390 ) ( ON ?auto_4391 ?auto_4390 ) ( not ( = ?auto_4390 ?auto_4391 ) ) ( not ( = ?auto_4390 ?auto_4392 ) ) ( not ( = ?auto_4391 ?auto_4392 ) ) ( not ( = ?auto_4390 ?auto_4393 ) ) ( not ( = ?auto_4391 ?auto_4393 ) ) ( not ( = ?auto_4392 ?auto_4393 ) ) ( ON ?auto_4393 ?auto_4392 ) ( CLEAR ?auto_4393 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4390 ?auto_4391 ?auto_4392 )
      ( MAKE-2PILE ?auto_4390 ?auto_4391 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4396 - BLOCK
      ?auto_4397 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_4397 ) ( CLEAR ?auto_4396 ) ( ON-TABLE ?auto_4396 ) ( not ( = ?auto_4396 ?auto_4397 ) ) )
    :subtasks
    ( ( !STACK ?auto_4397 ?auto_4396 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4398 - BLOCK
      ?auto_4399 - BLOCK
    )
    :vars
    (
      ?auto_4400 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_4398 ) ( ON-TABLE ?auto_4398 ) ( not ( = ?auto_4398 ?auto_4399 ) ) ( ON ?auto_4399 ?auto_4400 ) ( CLEAR ?auto_4399 ) ( HAND-EMPTY ) ( not ( = ?auto_4398 ?auto_4400 ) ) ( not ( = ?auto_4399 ?auto_4400 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4399 ?auto_4400 )
      ( MAKE-2PILE ?auto_4398 ?auto_4399 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4401 - BLOCK
      ?auto_4402 - BLOCK
    )
    :vars
    (
      ?auto_4403 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4401 ?auto_4402 ) ) ( ON ?auto_4402 ?auto_4403 ) ( CLEAR ?auto_4402 ) ( not ( = ?auto_4401 ?auto_4403 ) ) ( not ( = ?auto_4402 ?auto_4403 ) ) ( HOLDING ?auto_4401 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4401 )
      ( MAKE-2PILE ?auto_4401 ?auto_4402 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4404 - BLOCK
      ?auto_4405 - BLOCK
    )
    :vars
    (
      ?auto_4406 - BLOCK
      ?auto_4407 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4404 ?auto_4405 ) ) ( ON ?auto_4405 ?auto_4406 ) ( not ( = ?auto_4404 ?auto_4406 ) ) ( not ( = ?auto_4405 ?auto_4406 ) ) ( ON ?auto_4404 ?auto_4405 ) ( CLEAR ?auto_4404 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4407 ) ( ON ?auto_4406 ?auto_4407 ) ( not ( = ?auto_4407 ?auto_4406 ) ) ( not ( = ?auto_4407 ?auto_4405 ) ) ( not ( = ?auto_4407 ?auto_4404 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4407 ?auto_4406 ?auto_4405 )
      ( MAKE-2PILE ?auto_4404 ?auto_4405 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4409 - BLOCK
    )
    :vars
    (
      ?auto_4410 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4410 ?auto_4409 ) ( CLEAR ?auto_4410 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4409 ) ( not ( = ?auto_4409 ?auto_4410 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4410 ?auto_4409 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4411 - BLOCK
    )
    :vars
    (
      ?auto_4412 - BLOCK
      ?auto_4413 - BLOCK
      ?auto_4414 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4412 ?auto_4411 ) ( CLEAR ?auto_4412 ) ( ON-TABLE ?auto_4411 ) ( not ( = ?auto_4411 ?auto_4412 ) ) ( HOLDING ?auto_4413 ) ( CLEAR ?auto_4414 ) ( not ( = ?auto_4411 ?auto_4413 ) ) ( not ( = ?auto_4411 ?auto_4414 ) ) ( not ( = ?auto_4412 ?auto_4413 ) ) ( not ( = ?auto_4412 ?auto_4414 ) ) ( not ( = ?auto_4413 ?auto_4414 ) ) )
    :subtasks
    ( ( !STACK ?auto_4413 ?auto_4414 )
      ( MAKE-1PILE ?auto_4411 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4415 - BLOCK
    )
    :vars
    (
      ?auto_4416 - BLOCK
      ?auto_4418 - BLOCK
      ?auto_4417 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4416 ?auto_4415 ) ( ON-TABLE ?auto_4415 ) ( not ( = ?auto_4415 ?auto_4416 ) ) ( CLEAR ?auto_4418 ) ( not ( = ?auto_4415 ?auto_4417 ) ) ( not ( = ?auto_4415 ?auto_4418 ) ) ( not ( = ?auto_4416 ?auto_4417 ) ) ( not ( = ?auto_4416 ?auto_4418 ) ) ( not ( = ?auto_4417 ?auto_4418 ) ) ( ON ?auto_4417 ?auto_4416 ) ( CLEAR ?auto_4417 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4415 ?auto_4416 )
      ( MAKE-1PILE ?auto_4415 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4419 - BLOCK
    )
    :vars
    (
      ?auto_4420 - BLOCK
      ?auto_4421 - BLOCK
      ?auto_4422 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4420 ?auto_4419 ) ( ON-TABLE ?auto_4419 ) ( not ( = ?auto_4419 ?auto_4420 ) ) ( not ( = ?auto_4419 ?auto_4421 ) ) ( not ( = ?auto_4419 ?auto_4422 ) ) ( not ( = ?auto_4420 ?auto_4421 ) ) ( not ( = ?auto_4420 ?auto_4422 ) ) ( not ( = ?auto_4421 ?auto_4422 ) ) ( ON ?auto_4421 ?auto_4420 ) ( CLEAR ?auto_4421 ) ( HOLDING ?auto_4422 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4422 )
      ( MAKE-1PILE ?auto_4419 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4423 - BLOCK
    )
    :vars
    (
      ?auto_4425 - BLOCK
      ?auto_4424 - BLOCK
      ?auto_4426 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4425 ?auto_4423 ) ( ON-TABLE ?auto_4423 ) ( not ( = ?auto_4423 ?auto_4425 ) ) ( not ( = ?auto_4423 ?auto_4424 ) ) ( not ( = ?auto_4423 ?auto_4426 ) ) ( not ( = ?auto_4425 ?auto_4424 ) ) ( not ( = ?auto_4425 ?auto_4426 ) ) ( not ( = ?auto_4424 ?auto_4426 ) ) ( ON ?auto_4424 ?auto_4425 ) ( ON ?auto_4426 ?auto_4424 ) ( CLEAR ?auto_4426 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4423 ?auto_4425 ?auto_4424 )
      ( MAKE-1PILE ?auto_4423 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4430 - BLOCK
      ?auto_4431 - BLOCK
      ?auto_4432 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_4432 ) ( CLEAR ?auto_4431 ) ( ON-TABLE ?auto_4430 ) ( ON ?auto_4431 ?auto_4430 ) ( not ( = ?auto_4430 ?auto_4431 ) ) ( not ( = ?auto_4430 ?auto_4432 ) ) ( not ( = ?auto_4431 ?auto_4432 ) ) )
    :subtasks
    ( ( !STACK ?auto_4432 ?auto_4431 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4433 - BLOCK
      ?auto_4434 - BLOCK
      ?auto_4435 - BLOCK
    )
    :vars
    (
      ?auto_4436 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_4434 ) ( ON-TABLE ?auto_4433 ) ( ON ?auto_4434 ?auto_4433 ) ( not ( = ?auto_4433 ?auto_4434 ) ) ( not ( = ?auto_4433 ?auto_4435 ) ) ( not ( = ?auto_4434 ?auto_4435 ) ) ( ON ?auto_4435 ?auto_4436 ) ( CLEAR ?auto_4435 ) ( HAND-EMPTY ) ( not ( = ?auto_4433 ?auto_4436 ) ) ( not ( = ?auto_4434 ?auto_4436 ) ) ( not ( = ?auto_4435 ?auto_4436 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4435 ?auto_4436 )
      ( MAKE-3PILE ?auto_4433 ?auto_4434 ?auto_4435 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4437 - BLOCK
      ?auto_4438 - BLOCK
      ?auto_4439 - BLOCK
    )
    :vars
    (
      ?auto_4440 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_4437 ) ( not ( = ?auto_4437 ?auto_4438 ) ) ( not ( = ?auto_4437 ?auto_4439 ) ) ( not ( = ?auto_4438 ?auto_4439 ) ) ( ON ?auto_4439 ?auto_4440 ) ( CLEAR ?auto_4439 ) ( not ( = ?auto_4437 ?auto_4440 ) ) ( not ( = ?auto_4438 ?auto_4440 ) ) ( not ( = ?auto_4439 ?auto_4440 ) ) ( HOLDING ?auto_4438 ) ( CLEAR ?auto_4437 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4437 ?auto_4438 )
      ( MAKE-3PILE ?auto_4437 ?auto_4438 ?auto_4439 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4441 - BLOCK
      ?auto_4442 - BLOCK
      ?auto_4443 - BLOCK
    )
    :vars
    (
      ?auto_4444 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_4441 ) ( not ( = ?auto_4441 ?auto_4442 ) ) ( not ( = ?auto_4441 ?auto_4443 ) ) ( not ( = ?auto_4442 ?auto_4443 ) ) ( ON ?auto_4443 ?auto_4444 ) ( not ( = ?auto_4441 ?auto_4444 ) ) ( not ( = ?auto_4442 ?auto_4444 ) ) ( not ( = ?auto_4443 ?auto_4444 ) ) ( CLEAR ?auto_4441 ) ( ON ?auto_4442 ?auto_4443 ) ( CLEAR ?auto_4442 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4444 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4444 ?auto_4443 )
      ( MAKE-3PILE ?auto_4441 ?auto_4442 ?auto_4443 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4445 - BLOCK
      ?auto_4446 - BLOCK
      ?auto_4447 - BLOCK
    )
    :vars
    (
      ?auto_4448 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4445 ?auto_4446 ) ) ( not ( = ?auto_4445 ?auto_4447 ) ) ( not ( = ?auto_4446 ?auto_4447 ) ) ( ON ?auto_4447 ?auto_4448 ) ( not ( = ?auto_4445 ?auto_4448 ) ) ( not ( = ?auto_4446 ?auto_4448 ) ) ( not ( = ?auto_4447 ?auto_4448 ) ) ( ON ?auto_4446 ?auto_4447 ) ( CLEAR ?auto_4446 ) ( ON-TABLE ?auto_4448 ) ( HOLDING ?auto_4445 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4445 )
      ( MAKE-3PILE ?auto_4445 ?auto_4446 ?auto_4447 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4449 - BLOCK
      ?auto_4450 - BLOCK
      ?auto_4451 - BLOCK
    )
    :vars
    (
      ?auto_4452 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4449 ?auto_4450 ) ) ( not ( = ?auto_4449 ?auto_4451 ) ) ( not ( = ?auto_4450 ?auto_4451 ) ) ( ON ?auto_4451 ?auto_4452 ) ( not ( = ?auto_4449 ?auto_4452 ) ) ( not ( = ?auto_4450 ?auto_4452 ) ) ( not ( = ?auto_4451 ?auto_4452 ) ) ( ON ?auto_4450 ?auto_4451 ) ( ON-TABLE ?auto_4452 ) ( ON ?auto_4449 ?auto_4450 ) ( CLEAR ?auto_4449 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4452 ?auto_4451 ?auto_4450 )
      ( MAKE-3PILE ?auto_4449 ?auto_4450 ?auto_4451 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4455 - BLOCK
      ?auto_4456 - BLOCK
    )
    :vars
    (
      ?auto_4457 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4457 ?auto_4456 ) ( CLEAR ?auto_4457 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4455 ) ( ON ?auto_4456 ?auto_4455 ) ( not ( = ?auto_4455 ?auto_4456 ) ) ( not ( = ?auto_4455 ?auto_4457 ) ) ( not ( = ?auto_4456 ?auto_4457 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4457 ?auto_4456 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4465 - BLOCK
      ?auto_4466 - BLOCK
    )
    :vars
    (
      ?auto_4467 - BLOCK
      ?auto_4468 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_4465 ) ( not ( = ?auto_4465 ?auto_4466 ) ) ( not ( = ?auto_4465 ?auto_4467 ) ) ( not ( = ?auto_4466 ?auto_4467 ) ) ( ON ?auto_4467 ?auto_4468 ) ( CLEAR ?auto_4467 ) ( not ( = ?auto_4465 ?auto_4468 ) ) ( not ( = ?auto_4466 ?auto_4468 ) ) ( not ( = ?auto_4467 ?auto_4468 ) ) ( HOLDING ?auto_4466 ) ( CLEAR ?auto_4465 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4465 ?auto_4466 ?auto_4467 )
      ( MAKE-2PILE ?auto_4465 ?auto_4466 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4469 - BLOCK
      ?auto_4470 - BLOCK
    )
    :vars
    (
      ?auto_4472 - BLOCK
      ?auto_4471 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_4469 ) ( not ( = ?auto_4469 ?auto_4470 ) ) ( not ( = ?auto_4469 ?auto_4472 ) ) ( not ( = ?auto_4470 ?auto_4472 ) ) ( ON ?auto_4472 ?auto_4471 ) ( not ( = ?auto_4469 ?auto_4471 ) ) ( not ( = ?auto_4470 ?auto_4471 ) ) ( not ( = ?auto_4472 ?auto_4471 ) ) ( CLEAR ?auto_4469 ) ( ON ?auto_4470 ?auto_4472 ) ( CLEAR ?auto_4470 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4471 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4471 ?auto_4472 )
      ( MAKE-2PILE ?auto_4469 ?auto_4470 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4473 - BLOCK
      ?auto_4474 - BLOCK
    )
    :vars
    (
      ?auto_4476 - BLOCK
      ?auto_4475 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4473 ?auto_4474 ) ) ( not ( = ?auto_4473 ?auto_4476 ) ) ( not ( = ?auto_4474 ?auto_4476 ) ) ( ON ?auto_4476 ?auto_4475 ) ( not ( = ?auto_4473 ?auto_4475 ) ) ( not ( = ?auto_4474 ?auto_4475 ) ) ( not ( = ?auto_4476 ?auto_4475 ) ) ( ON ?auto_4474 ?auto_4476 ) ( CLEAR ?auto_4474 ) ( ON-TABLE ?auto_4475 ) ( HOLDING ?auto_4473 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4473 )
      ( MAKE-2PILE ?auto_4473 ?auto_4474 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4477 - BLOCK
      ?auto_4478 - BLOCK
    )
    :vars
    (
      ?auto_4480 - BLOCK
      ?auto_4479 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4477 ?auto_4478 ) ) ( not ( = ?auto_4477 ?auto_4480 ) ) ( not ( = ?auto_4478 ?auto_4480 ) ) ( ON ?auto_4480 ?auto_4479 ) ( not ( = ?auto_4477 ?auto_4479 ) ) ( not ( = ?auto_4478 ?auto_4479 ) ) ( not ( = ?auto_4480 ?auto_4479 ) ) ( ON ?auto_4478 ?auto_4480 ) ( ON-TABLE ?auto_4479 ) ( ON ?auto_4477 ?auto_4478 ) ( CLEAR ?auto_4477 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4479 ?auto_4480 ?auto_4478 )
      ( MAKE-2PILE ?auto_4477 ?auto_4478 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4482 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_4482 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_4482 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4483 - BLOCK
    )
    :vars
    (
      ?auto_4484 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4483 ?auto_4484 ) ( CLEAR ?auto_4483 ) ( HAND-EMPTY ) ( not ( = ?auto_4483 ?auto_4484 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4483 ?auto_4484 )
      ( MAKE-1PILE ?auto_4483 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4485 - BLOCK
    )
    :vars
    (
      ?auto_4486 - BLOCK
      ?auto_4487 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4485 ?auto_4486 ) ) ( HOLDING ?auto_4485 ) ( CLEAR ?auto_4486 ) ( ON-TABLE ?auto_4487 ) ( ON ?auto_4486 ?auto_4487 ) ( not ( = ?auto_4487 ?auto_4486 ) ) ( not ( = ?auto_4487 ?auto_4485 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4487 ?auto_4486 ?auto_4485 )
      ( MAKE-1PILE ?auto_4485 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4488 - BLOCK
    )
    :vars
    (
      ?auto_4490 - BLOCK
      ?auto_4489 - BLOCK
      ?auto_4491 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4488 ?auto_4490 ) ) ( CLEAR ?auto_4490 ) ( ON-TABLE ?auto_4489 ) ( ON ?auto_4490 ?auto_4489 ) ( not ( = ?auto_4489 ?auto_4490 ) ) ( not ( = ?auto_4489 ?auto_4488 ) ) ( ON ?auto_4488 ?auto_4491 ) ( CLEAR ?auto_4488 ) ( HAND-EMPTY ) ( not ( = ?auto_4488 ?auto_4491 ) ) ( not ( = ?auto_4490 ?auto_4491 ) ) ( not ( = ?auto_4489 ?auto_4491 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4488 ?auto_4491 )
      ( MAKE-1PILE ?auto_4488 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4492 - BLOCK
    )
    :vars
    (
      ?auto_4494 - BLOCK
      ?auto_4493 - BLOCK
      ?auto_4495 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4492 ?auto_4494 ) ) ( ON-TABLE ?auto_4493 ) ( not ( = ?auto_4493 ?auto_4494 ) ) ( not ( = ?auto_4493 ?auto_4492 ) ) ( ON ?auto_4492 ?auto_4495 ) ( CLEAR ?auto_4492 ) ( not ( = ?auto_4492 ?auto_4495 ) ) ( not ( = ?auto_4494 ?auto_4495 ) ) ( not ( = ?auto_4493 ?auto_4495 ) ) ( HOLDING ?auto_4494 ) ( CLEAR ?auto_4493 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4493 ?auto_4494 )
      ( MAKE-1PILE ?auto_4492 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4496 - BLOCK
    )
    :vars
    (
      ?auto_4498 - BLOCK
      ?auto_4497 - BLOCK
      ?auto_4499 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4496 ?auto_4498 ) ) ( ON-TABLE ?auto_4497 ) ( not ( = ?auto_4497 ?auto_4498 ) ) ( not ( = ?auto_4497 ?auto_4496 ) ) ( ON ?auto_4496 ?auto_4499 ) ( not ( = ?auto_4496 ?auto_4499 ) ) ( not ( = ?auto_4498 ?auto_4499 ) ) ( not ( = ?auto_4497 ?auto_4499 ) ) ( CLEAR ?auto_4497 ) ( ON ?auto_4498 ?auto_4496 ) ( CLEAR ?auto_4498 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4499 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4499 ?auto_4496 )
      ( MAKE-1PILE ?auto_4496 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4500 - BLOCK
    )
    :vars
    (
      ?auto_4501 - BLOCK
      ?auto_4503 - BLOCK
      ?auto_4502 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4500 ?auto_4501 ) ) ( not ( = ?auto_4503 ?auto_4501 ) ) ( not ( = ?auto_4503 ?auto_4500 ) ) ( ON ?auto_4500 ?auto_4502 ) ( not ( = ?auto_4500 ?auto_4502 ) ) ( not ( = ?auto_4501 ?auto_4502 ) ) ( not ( = ?auto_4503 ?auto_4502 ) ) ( ON ?auto_4501 ?auto_4500 ) ( CLEAR ?auto_4501 ) ( ON-TABLE ?auto_4502 ) ( HOLDING ?auto_4503 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4503 )
      ( MAKE-1PILE ?auto_4500 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4504 - BLOCK
    )
    :vars
    (
      ?auto_4506 - BLOCK
      ?auto_4505 - BLOCK
      ?auto_4507 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4504 ?auto_4506 ) ) ( not ( = ?auto_4505 ?auto_4506 ) ) ( not ( = ?auto_4505 ?auto_4504 ) ) ( ON ?auto_4504 ?auto_4507 ) ( not ( = ?auto_4504 ?auto_4507 ) ) ( not ( = ?auto_4506 ?auto_4507 ) ) ( not ( = ?auto_4505 ?auto_4507 ) ) ( ON ?auto_4506 ?auto_4504 ) ( ON-TABLE ?auto_4507 ) ( ON ?auto_4505 ?auto_4506 ) ( CLEAR ?auto_4505 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4507 ?auto_4504 ?auto_4506 )
      ( MAKE-1PILE ?auto_4504 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4509 - BLOCK
    )
    :vars
    (
      ?auto_4510 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4510 ?auto_4509 ) ( CLEAR ?auto_4510 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4509 ) ( not ( = ?auto_4509 ?auto_4510 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4510 ?auto_4509 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4511 - BLOCK
    )
    :vars
    (
      ?auto_4512 - BLOCK
      ?auto_4513 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4512 ?auto_4511 ) ( CLEAR ?auto_4512 ) ( ON-TABLE ?auto_4511 ) ( not ( = ?auto_4511 ?auto_4512 ) ) ( HOLDING ?auto_4513 ) ( not ( = ?auto_4511 ?auto_4513 ) ) ( not ( = ?auto_4512 ?auto_4513 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_4513 )
      ( MAKE-1PILE ?auto_4511 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4514 - BLOCK
    )
    :vars
    (
      ?auto_4516 - BLOCK
      ?auto_4515 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4516 ?auto_4514 ) ( ON-TABLE ?auto_4514 ) ( not ( = ?auto_4514 ?auto_4516 ) ) ( not ( = ?auto_4514 ?auto_4515 ) ) ( not ( = ?auto_4516 ?auto_4515 ) ) ( ON ?auto_4515 ?auto_4516 ) ( CLEAR ?auto_4515 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4514 ?auto_4516 )
      ( MAKE-1PILE ?auto_4514 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4517 - BLOCK
    )
    :vars
    (
      ?auto_4519 - BLOCK
      ?auto_4518 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4519 ?auto_4517 ) ( ON-TABLE ?auto_4517 ) ( not ( = ?auto_4517 ?auto_4519 ) ) ( not ( = ?auto_4517 ?auto_4518 ) ) ( not ( = ?auto_4519 ?auto_4518 ) ) ( HOLDING ?auto_4518 ) ( CLEAR ?auto_4519 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4517 ?auto_4519 ?auto_4518 )
      ( MAKE-1PILE ?auto_4517 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4520 - BLOCK
    )
    :vars
    (
      ?auto_4521 - BLOCK
      ?auto_4522 - BLOCK
      ?auto_4523 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4521 ?auto_4520 ) ( ON-TABLE ?auto_4520 ) ( not ( = ?auto_4520 ?auto_4521 ) ) ( not ( = ?auto_4520 ?auto_4522 ) ) ( not ( = ?auto_4521 ?auto_4522 ) ) ( CLEAR ?auto_4521 ) ( ON ?auto_4522 ?auto_4523 ) ( CLEAR ?auto_4522 ) ( HAND-EMPTY ) ( not ( = ?auto_4520 ?auto_4523 ) ) ( not ( = ?auto_4521 ?auto_4523 ) ) ( not ( = ?auto_4522 ?auto_4523 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4522 ?auto_4523 )
      ( MAKE-1PILE ?auto_4520 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4532 - BLOCK
    )
    :vars
    (
      ?auto_4535 - BLOCK
      ?auto_4534 - BLOCK
      ?auto_4533 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4532 ?auto_4535 ) ) ( not ( = ?auto_4532 ?auto_4534 ) ) ( not ( = ?auto_4535 ?auto_4534 ) ) ( ON ?auto_4534 ?auto_4533 ) ( not ( = ?auto_4532 ?auto_4533 ) ) ( not ( = ?auto_4535 ?auto_4533 ) ) ( not ( = ?auto_4534 ?auto_4533 ) ) ( ON ?auto_4535 ?auto_4534 ) ( CLEAR ?auto_4535 ) ( HOLDING ?auto_4532 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4532 ?auto_4535 )
      ( MAKE-1PILE ?auto_4532 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4536 - BLOCK
    )
    :vars
    (
      ?auto_4537 - BLOCK
      ?auto_4538 - BLOCK
      ?auto_4539 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4536 ?auto_4537 ) ) ( not ( = ?auto_4536 ?auto_4538 ) ) ( not ( = ?auto_4537 ?auto_4538 ) ) ( ON ?auto_4538 ?auto_4539 ) ( not ( = ?auto_4536 ?auto_4539 ) ) ( not ( = ?auto_4537 ?auto_4539 ) ) ( not ( = ?auto_4538 ?auto_4539 ) ) ( ON ?auto_4537 ?auto_4538 ) ( ON ?auto_4536 ?auto_4537 ) ( CLEAR ?auto_4536 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4539 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4539 ?auto_4538 ?auto_4537 )
      ( MAKE-1PILE ?auto_4536 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4542 - BLOCK
      ?auto_4543 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_4543 ) ( CLEAR ?auto_4542 ) ( ON-TABLE ?auto_4542 ) ( not ( = ?auto_4542 ?auto_4543 ) ) )
    :subtasks
    ( ( !STACK ?auto_4543 ?auto_4542 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4544 - BLOCK
      ?auto_4545 - BLOCK
    )
    :vars
    (
      ?auto_4546 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_4544 ) ( ON-TABLE ?auto_4544 ) ( not ( = ?auto_4544 ?auto_4545 ) ) ( ON ?auto_4545 ?auto_4546 ) ( CLEAR ?auto_4545 ) ( HAND-EMPTY ) ( not ( = ?auto_4544 ?auto_4546 ) ) ( not ( = ?auto_4545 ?auto_4546 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4545 ?auto_4546 )
      ( MAKE-2PILE ?auto_4544 ?auto_4545 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4547 - BLOCK
      ?auto_4548 - BLOCK
    )
    :vars
    (
      ?auto_4549 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4547 ?auto_4548 ) ) ( ON ?auto_4548 ?auto_4549 ) ( CLEAR ?auto_4548 ) ( not ( = ?auto_4547 ?auto_4549 ) ) ( not ( = ?auto_4548 ?auto_4549 ) ) ( HOLDING ?auto_4547 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4547 )
      ( MAKE-2PILE ?auto_4547 ?auto_4548 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4550 - BLOCK
      ?auto_4551 - BLOCK
    )
    :vars
    (
      ?auto_4552 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4550 ?auto_4551 ) ) ( ON ?auto_4551 ?auto_4552 ) ( not ( = ?auto_4550 ?auto_4552 ) ) ( not ( = ?auto_4551 ?auto_4552 ) ) ( ON ?auto_4550 ?auto_4551 ) ( CLEAR ?auto_4550 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4552 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4552 ?auto_4551 )
      ( MAKE-2PILE ?auto_4550 ?auto_4551 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4553 - BLOCK
      ?auto_4554 - BLOCK
    )
    :vars
    (
      ?auto_4555 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4553 ?auto_4554 ) ) ( ON ?auto_4554 ?auto_4555 ) ( not ( = ?auto_4553 ?auto_4555 ) ) ( not ( = ?auto_4554 ?auto_4555 ) ) ( ON-TABLE ?auto_4555 ) ( HOLDING ?auto_4553 ) ( CLEAR ?auto_4554 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4555 ?auto_4554 ?auto_4553 )
      ( MAKE-2PILE ?auto_4553 ?auto_4554 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4556 - BLOCK
      ?auto_4557 - BLOCK
    )
    :vars
    (
      ?auto_4558 - BLOCK
      ?auto_4559 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4556 ?auto_4557 ) ) ( ON ?auto_4557 ?auto_4558 ) ( not ( = ?auto_4556 ?auto_4558 ) ) ( not ( = ?auto_4557 ?auto_4558 ) ) ( ON-TABLE ?auto_4558 ) ( CLEAR ?auto_4557 ) ( ON ?auto_4556 ?auto_4559 ) ( CLEAR ?auto_4556 ) ( HAND-EMPTY ) ( not ( = ?auto_4556 ?auto_4559 ) ) ( not ( = ?auto_4557 ?auto_4559 ) ) ( not ( = ?auto_4558 ?auto_4559 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4556 ?auto_4559 )
      ( MAKE-2PILE ?auto_4556 ?auto_4557 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4560 - BLOCK
      ?auto_4561 - BLOCK
    )
    :vars
    (
      ?auto_4562 - BLOCK
      ?auto_4563 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4560 ?auto_4561 ) ) ( not ( = ?auto_4560 ?auto_4562 ) ) ( not ( = ?auto_4561 ?auto_4562 ) ) ( ON-TABLE ?auto_4562 ) ( ON ?auto_4560 ?auto_4563 ) ( CLEAR ?auto_4560 ) ( not ( = ?auto_4560 ?auto_4563 ) ) ( not ( = ?auto_4561 ?auto_4563 ) ) ( not ( = ?auto_4562 ?auto_4563 ) ) ( HOLDING ?auto_4561 ) ( CLEAR ?auto_4562 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4562 ?auto_4561 )
      ( MAKE-2PILE ?auto_4560 ?auto_4561 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4564 - BLOCK
      ?auto_4565 - BLOCK
    )
    :vars
    (
      ?auto_4567 - BLOCK
      ?auto_4566 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4564 ?auto_4565 ) ) ( not ( = ?auto_4564 ?auto_4567 ) ) ( not ( = ?auto_4565 ?auto_4567 ) ) ( ON-TABLE ?auto_4567 ) ( ON ?auto_4564 ?auto_4566 ) ( not ( = ?auto_4564 ?auto_4566 ) ) ( not ( = ?auto_4565 ?auto_4566 ) ) ( not ( = ?auto_4567 ?auto_4566 ) ) ( CLEAR ?auto_4567 ) ( ON ?auto_4565 ?auto_4564 ) ( CLEAR ?auto_4565 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4566 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4566 ?auto_4564 )
      ( MAKE-2PILE ?auto_4564 ?auto_4565 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4568 - BLOCK
      ?auto_4569 - BLOCK
    )
    :vars
    (
      ?auto_4571 - BLOCK
      ?auto_4570 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4568 ?auto_4569 ) ) ( not ( = ?auto_4568 ?auto_4571 ) ) ( not ( = ?auto_4569 ?auto_4571 ) ) ( ON ?auto_4568 ?auto_4570 ) ( not ( = ?auto_4568 ?auto_4570 ) ) ( not ( = ?auto_4569 ?auto_4570 ) ) ( not ( = ?auto_4571 ?auto_4570 ) ) ( ON ?auto_4569 ?auto_4568 ) ( CLEAR ?auto_4569 ) ( ON-TABLE ?auto_4570 ) ( HOLDING ?auto_4571 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4571 )
      ( MAKE-2PILE ?auto_4568 ?auto_4569 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4572 - BLOCK
      ?auto_4573 - BLOCK
    )
    :vars
    (
      ?auto_4574 - BLOCK
      ?auto_4575 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4572 ?auto_4573 ) ) ( not ( = ?auto_4572 ?auto_4574 ) ) ( not ( = ?auto_4573 ?auto_4574 ) ) ( ON ?auto_4572 ?auto_4575 ) ( not ( = ?auto_4572 ?auto_4575 ) ) ( not ( = ?auto_4573 ?auto_4575 ) ) ( not ( = ?auto_4574 ?auto_4575 ) ) ( ON ?auto_4573 ?auto_4572 ) ( ON-TABLE ?auto_4575 ) ( ON ?auto_4574 ?auto_4573 ) ( CLEAR ?auto_4574 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4575 ?auto_4572 ?auto_4573 )
      ( MAKE-2PILE ?auto_4572 ?auto_4573 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4579 - BLOCK
      ?auto_4580 - BLOCK
      ?auto_4581 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_4581 ) ( CLEAR ?auto_4580 ) ( ON-TABLE ?auto_4579 ) ( ON ?auto_4580 ?auto_4579 ) ( not ( = ?auto_4579 ?auto_4580 ) ) ( not ( = ?auto_4579 ?auto_4581 ) ) ( not ( = ?auto_4580 ?auto_4581 ) ) )
    :subtasks
    ( ( !STACK ?auto_4581 ?auto_4580 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4582 - BLOCK
      ?auto_4583 - BLOCK
      ?auto_4584 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_4583 ) ( ON-TABLE ?auto_4582 ) ( ON ?auto_4583 ?auto_4582 ) ( not ( = ?auto_4582 ?auto_4583 ) ) ( not ( = ?auto_4582 ?auto_4584 ) ) ( not ( = ?auto_4583 ?auto_4584 ) ) ( ON-TABLE ?auto_4584 ) ( CLEAR ?auto_4584 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_4584 )
      ( MAKE-3PILE ?auto_4582 ?auto_4583 ?auto_4584 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4585 - BLOCK
      ?auto_4586 - BLOCK
      ?auto_4587 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_4585 ) ( not ( = ?auto_4585 ?auto_4586 ) ) ( not ( = ?auto_4585 ?auto_4587 ) ) ( not ( = ?auto_4586 ?auto_4587 ) ) ( ON-TABLE ?auto_4587 ) ( CLEAR ?auto_4587 ) ( HOLDING ?auto_4586 ) ( CLEAR ?auto_4585 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4585 ?auto_4586 )
      ( MAKE-3PILE ?auto_4585 ?auto_4586 ?auto_4587 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4588 - BLOCK
      ?auto_4589 - BLOCK
      ?auto_4590 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_4588 ) ( not ( = ?auto_4588 ?auto_4589 ) ) ( not ( = ?auto_4588 ?auto_4590 ) ) ( not ( = ?auto_4589 ?auto_4590 ) ) ( ON-TABLE ?auto_4590 ) ( CLEAR ?auto_4588 ) ( ON ?auto_4589 ?auto_4590 ) ( CLEAR ?auto_4589 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4590 )
      ( MAKE-3PILE ?auto_4588 ?auto_4589 ?auto_4590 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4591 - BLOCK
      ?auto_4592 - BLOCK
      ?auto_4593 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4591 ?auto_4592 ) ) ( not ( = ?auto_4591 ?auto_4593 ) ) ( not ( = ?auto_4592 ?auto_4593 ) ) ( ON-TABLE ?auto_4593 ) ( ON ?auto_4592 ?auto_4593 ) ( CLEAR ?auto_4592 ) ( HOLDING ?auto_4591 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4591 )
      ( MAKE-3PILE ?auto_4591 ?auto_4592 ?auto_4593 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4594 - BLOCK
      ?auto_4595 - BLOCK
      ?auto_4596 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4594 ?auto_4595 ) ) ( not ( = ?auto_4594 ?auto_4596 ) ) ( not ( = ?auto_4595 ?auto_4596 ) ) ( ON-TABLE ?auto_4596 ) ( ON ?auto_4595 ?auto_4596 ) ( ON ?auto_4594 ?auto_4595 ) ( CLEAR ?auto_4594 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4596 ?auto_4595 )
      ( MAKE-3PILE ?auto_4594 ?auto_4595 ?auto_4596 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4597 - BLOCK
      ?auto_4598 - BLOCK
      ?auto_4599 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4597 ?auto_4598 ) ) ( not ( = ?auto_4597 ?auto_4599 ) ) ( not ( = ?auto_4598 ?auto_4599 ) ) ( ON-TABLE ?auto_4599 ) ( ON ?auto_4598 ?auto_4599 ) ( HOLDING ?auto_4597 ) ( CLEAR ?auto_4598 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4599 ?auto_4598 ?auto_4597 )
      ( MAKE-3PILE ?auto_4597 ?auto_4598 ?auto_4599 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4600 - BLOCK
      ?auto_4601 - BLOCK
      ?auto_4602 - BLOCK
    )
    :vars
    (
      ?auto_4603 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4600 ?auto_4601 ) ) ( not ( = ?auto_4600 ?auto_4602 ) ) ( not ( = ?auto_4601 ?auto_4602 ) ) ( ON-TABLE ?auto_4602 ) ( ON ?auto_4601 ?auto_4602 ) ( CLEAR ?auto_4601 ) ( ON ?auto_4600 ?auto_4603 ) ( CLEAR ?auto_4600 ) ( HAND-EMPTY ) ( not ( = ?auto_4600 ?auto_4603 ) ) ( not ( = ?auto_4601 ?auto_4603 ) ) ( not ( = ?auto_4602 ?auto_4603 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4600 ?auto_4603 )
      ( MAKE-3PILE ?auto_4600 ?auto_4601 ?auto_4602 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4604 - BLOCK
      ?auto_4605 - BLOCK
      ?auto_4606 - BLOCK
    )
    :vars
    (
      ?auto_4607 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4604 ?auto_4605 ) ) ( not ( = ?auto_4604 ?auto_4606 ) ) ( not ( = ?auto_4605 ?auto_4606 ) ) ( ON-TABLE ?auto_4606 ) ( ON ?auto_4604 ?auto_4607 ) ( CLEAR ?auto_4604 ) ( not ( = ?auto_4604 ?auto_4607 ) ) ( not ( = ?auto_4605 ?auto_4607 ) ) ( not ( = ?auto_4606 ?auto_4607 ) ) ( HOLDING ?auto_4605 ) ( CLEAR ?auto_4606 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4606 ?auto_4605 )
      ( MAKE-3PILE ?auto_4604 ?auto_4605 ?auto_4606 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4608 - BLOCK
      ?auto_4609 - BLOCK
      ?auto_4610 - BLOCK
    )
    :vars
    (
      ?auto_4611 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4608 ?auto_4609 ) ) ( not ( = ?auto_4608 ?auto_4610 ) ) ( not ( = ?auto_4609 ?auto_4610 ) ) ( ON-TABLE ?auto_4610 ) ( ON ?auto_4608 ?auto_4611 ) ( not ( = ?auto_4608 ?auto_4611 ) ) ( not ( = ?auto_4609 ?auto_4611 ) ) ( not ( = ?auto_4610 ?auto_4611 ) ) ( CLEAR ?auto_4610 ) ( ON ?auto_4609 ?auto_4608 ) ( CLEAR ?auto_4609 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4611 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4611 ?auto_4608 )
      ( MAKE-3PILE ?auto_4608 ?auto_4609 ?auto_4610 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4612 - BLOCK
      ?auto_4613 - BLOCK
      ?auto_4614 - BLOCK
    )
    :vars
    (
      ?auto_4615 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4612 ?auto_4613 ) ) ( not ( = ?auto_4612 ?auto_4614 ) ) ( not ( = ?auto_4613 ?auto_4614 ) ) ( ON ?auto_4612 ?auto_4615 ) ( not ( = ?auto_4612 ?auto_4615 ) ) ( not ( = ?auto_4613 ?auto_4615 ) ) ( not ( = ?auto_4614 ?auto_4615 ) ) ( ON ?auto_4613 ?auto_4612 ) ( CLEAR ?auto_4613 ) ( ON-TABLE ?auto_4615 ) ( HOLDING ?auto_4614 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4614 )
      ( MAKE-3PILE ?auto_4612 ?auto_4613 ?auto_4614 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4616 - BLOCK
      ?auto_4617 - BLOCK
      ?auto_4618 - BLOCK
    )
    :vars
    (
      ?auto_4619 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4616 ?auto_4617 ) ) ( not ( = ?auto_4616 ?auto_4618 ) ) ( not ( = ?auto_4617 ?auto_4618 ) ) ( ON ?auto_4616 ?auto_4619 ) ( not ( = ?auto_4616 ?auto_4619 ) ) ( not ( = ?auto_4617 ?auto_4619 ) ) ( not ( = ?auto_4618 ?auto_4619 ) ) ( ON ?auto_4617 ?auto_4616 ) ( ON-TABLE ?auto_4619 ) ( ON ?auto_4618 ?auto_4617 ) ( CLEAR ?auto_4618 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4619 ?auto_4616 ?auto_4617 )
      ( MAKE-3PILE ?auto_4616 ?auto_4617 ?auto_4618 ) )
  )

)

