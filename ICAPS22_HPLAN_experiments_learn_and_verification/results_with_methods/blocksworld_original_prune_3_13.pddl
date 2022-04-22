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
      ?auto_4369 - BLOCK
      ?auto_4370 - BLOCK
      ?auto_4371 - BLOCK
    )
    :vars
    (
      ?auto_4372 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4372 ?auto_4371 ) ( CLEAR ?auto_4372 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4369 ) ( ON ?auto_4370 ?auto_4369 ) ( ON ?auto_4371 ?auto_4370 ) ( not ( = ?auto_4369 ?auto_4370 ) ) ( not ( = ?auto_4369 ?auto_4371 ) ) ( not ( = ?auto_4369 ?auto_4372 ) ) ( not ( = ?auto_4370 ?auto_4371 ) ) ( not ( = ?auto_4370 ?auto_4372 ) ) ( not ( = ?auto_4371 ?auto_4372 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4372 ?auto_4371 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4374 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_4374 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_4374 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4375 - BLOCK
    )
    :vars
    (
      ?auto_4376 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4375 ?auto_4376 ) ( CLEAR ?auto_4375 ) ( HAND-EMPTY ) ( not ( = ?auto_4375 ?auto_4376 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4375 ?auto_4376 )
      ( MAKE-1PILE ?auto_4375 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4379 - BLOCK
      ?auto_4380 - BLOCK
    )
    :vars
    (
      ?auto_4381 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4381 ?auto_4380 ) ( CLEAR ?auto_4381 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4379 ) ( ON ?auto_4380 ?auto_4379 ) ( not ( = ?auto_4379 ?auto_4380 ) ) ( not ( = ?auto_4379 ?auto_4381 ) ) ( not ( = ?auto_4380 ?auto_4381 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4381 ?auto_4380 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4382 - BLOCK
      ?auto_4383 - BLOCK
    )
    :vars
    (
      ?auto_4384 - BLOCK
      ?auto_4385 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4384 ?auto_4383 ) ( CLEAR ?auto_4384 ) ( ON-TABLE ?auto_4382 ) ( ON ?auto_4383 ?auto_4382 ) ( not ( = ?auto_4382 ?auto_4383 ) ) ( not ( = ?auto_4382 ?auto_4384 ) ) ( not ( = ?auto_4383 ?auto_4384 ) ) ( HOLDING ?auto_4385 ) ( not ( = ?auto_4382 ?auto_4385 ) ) ( not ( = ?auto_4383 ?auto_4385 ) ) ( not ( = ?auto_4384 ?auto_4385 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_4385 )
      ( MAKE-2PILE ?auto_4382 ?auto_4383 ) )
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
    ( and ( ON ?auto_4388 ?auto_4387 ) ( ON-TABLE ?auto_4386 ) ( ON ?auto_4387 ?auto_4386 ) ( not ( = ?auto_4386 ?auto_4387 ) ) ( not ( = ?auto_4386 ?auto_4388 ) ) ( not ( = ?auto_4387 ?auto_4388 ) ) ( not ( = ?auto_4386 ?auto_4389 ) ) ( not ( = ?auto_4387 ?auto_4389 ) ) ( not ( = ?auto_4388 ?auto_4389 ) ) ( ON ?auto_4389 ?auto_4388 ) ( CLEAR ?auto_4389 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4386 ?auto_4387 ?auto_4388 )
      ( MAKE-2PILE ?auto_4386 ?auto_4387 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4392 - BLOCK
      ?auto_4393 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_4393 ) ( CLEAR ?auto_4392 ) ( ON-TABLE ?auto_4392 ) ( not ( = ?auto_4392 ?auto_4393 ) ) )
    :subtasks
    ( ( !STACK ?auto_4393 ?auto_4392 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4394 - BLOCK
      ?auto_4395 - BLOCK
    )
    :vars
    (
      ?auto_4396 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_4394 ) ( ON-TABLE ?auto_4394 ) ( not ( = ?auto_4394 ?auto_4395 ) ) ( ON ?auto_4395 ?auto_4396 ) ( CLEAR ?auto_4395 ) ( HAND-EMPTY ) ( not ( = ?auto_4394 ?auto_4396 ) ) ( not ( = ?auto_4395 ?auto_4396 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4395 ?auto_4396 )
      ( MAKE-2PILE ?auto_4394 ?auto_4395 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4397 - BLOCK
      ?auto_4398 - BLOCK
    )
    :vars
    (
      ?auto_4399 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4397 ?auto_4398 ) ) ( ON ?auto_4398 ?auto_4399 ) ( CLEAR ?auto_4398 ) ( not ( = ?auto_4397 ?auto_4399 ) ) ( not ( = ?auto_4398 ?auto_4399 ) ) ( HOLDING ?auto_4397 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4397 )
      ( MAKE-2PILE ?auto_4397 ?auto_4398 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4400 - BLOCK
      ?auto_4401 - BLOCK
    )
    :vars
    (
      ?auto_4402 - BLOCK
      ?auto_4403 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4400 ?auto_4401 ) ) ( ON ?auto_4401 ?auto_4402 ) ( not ( = ?auto_4400 ?auto_4402 ) ) ( not ( = ?auto_4401 ?auto_4402 ) ) ( ON ?auto_4400 ?auto_4401 ) ( CLEAR ?auto_4400 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4403 ) ( ON ?auto_4402 ?auto_4403 ) ( not ( = ?auto_4403 ?auto_4402 ) ) ( not ( = ?auto_4403 ?auto_4401 ) ) ( not ( = ?auto_4403 ?auto_4400 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4403 ?auto_4402 ?auto_4401 )
      ( MAKE-2PILE ?auto_4400 ?auto_4401 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4405 - BLOCK
    )
    :vars
    (
      ?auto_4406 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4406 ?auto_4405 ) ( CLEAR ?auto_4406 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4405 ) ( not ( = ?auto_4405 ?auto_4406 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4406 ?auto_4405 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4407 - BLOCK
    )
    :vars
    (
      ?auto_4408 - BLOCK
      ?auto_4409 - BLOCK
      ?auto_4410 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4408 ?auto_4407 ) ( CLEAR ?auto_4408 ) ( ON-TABLE ?auto_4407 ) ( not ( = ?auto_4407 ?auto_4408 ) ) ( HOLDING ?auto_4409 ) ( CLEAR ?auto_4410 ) ( not ( = ?auto_4407 ?auto_4409 ) ) ( not ( = ?auto_4407 ?auto_4410 ) ) ( not ( = ?auto_4408 ?auto_4409 ) ) ( not ( = ?auto_4408 ?auto_4410 ) ) ( not ( = ?auto_4409 ?auto_4410 ) ) )
    :subtasks
    ( ( !STACK ?auto_4409 ?auto_4410 )
      ( MAKE-1PILE ?auto_4407 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4497 - BLOCK
    )
    :vars
    (
      ?auto_4498 - BLOCK
      ?auto_4499 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4498 ?auto_4497 ) ( ON-TABLE ?auto_4497 ) ( not ( = ?auto_4497 ?auto_4498 ) ) ( not ( = ?auto_4497 ?auto_4499 ) ) ( not ( = ?auto_4498 ?auto_4499 ) ) ( ON ?auto_4499 ?auto_4498 ) ( CLEAR ?auto_4499 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4497 ?auto_4498 )
      ( MAKE-1PILE ?auto_4497 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4415 - BLOCK
    )
    :vars
    (
      ?auto_4418 - BLOCK
      ?auto_4416 - BLOCK
      ?auto_4417 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4418 ?auto_4415 ) ( ON-TABLE ?auto_4415 ) ( not ( = ?auto_4415 ?auto_4418 ) ) ( not ( = ?auto_4415 ?auto_4416 ) ) ( not ( = ?auto_4415 ?auto_4417 ) ) ( not ( = ?auto_4418 ?auto_4416 ) ) ( not ( = ?auto_4418 ?auto_4417 ) ) ( not ( = ?auto_4416 ?auto_4417 ) ) ( ON ?auto_4416 ?auto_4418 ) ( CLEAR ?auto_4416 ) ( HOLDING ?auto_4417 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4417 )
      ( MAKE-1PILE ?auto_4415 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4419 - BLOCK
    )
    :vars
    (
      ?auto_4421 - BLOCK
      ?auto_4420 - BLOCK
      ?auto_4422 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4421 ?auto_4419 ) ( ON-TABLE ?auto_4419 ) ( not ( = ?auto_4419 ?auto_4421 ) ) ( not ( = ?auto_4419 ?auto_4420 ) ) ( not ( = ?auto_4419 ?auto_4422 ) ) ( not ( = ?auto_4421 ?auto_4420 ) ) ( not ( = ?auto_4421 ?auto_4422 ) ) ( not ( = ?auto_4420 ?auto_4422 ) ) ( ON ?auto_4420 ?auto_4421 ) ( ON ?auto_4422 ?auto_4420 ) ( CLEAR ?auto_4422 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4419 ?auto_4421 ?auto_4420 )
      ( MAKE-1PILE ?auto_4419 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4426 - BLOCK
      ?auto_4427 - BLOCK
      ?auto_4428 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_4428 ) ( CLEAR ?auto_4427 ) ( ON-TABLE ?auto_4426 ) ( ON ?auto_4427 ?auto_4426 ) ( not ( = ?auto_4426 ?auto_4427 ) ) ( not ( = ?auto_4426 ?auto_4428 ) ) ( not ( = ?auto_4427 ?auto_4428 ) ) )
    :subtasks
    ( ( !STACK ?auto_4428 ?auto_4427 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4429 - BLOCK
      ?auto_4430 - BLOCK
      ?auto_4431 - BLOCK
    )
    :vars
    (
      ?auto_4432 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_4430 ) ( ON-TABLE ?auto_4429 ) ( ON ?auto_4430 ?auto_4429 ) ( not ( = ?auto_4429 ?auto_4430 ) ) ( not ( = ?auto_4429 ?auto_4431 ) ) ( not ( = ?auto_4430 ?auto_4431 ) ) ( ON ?auto_4431 ?auto_4432 ) ( CLEAR ?auto_4431 ) ( HAND-EMPTY ) ( not ( = ?auto_4429 ?auto_4432 ) ) ( not ( = ?auto_4430 ?auto_4432 ) ) ( not ( = ?auto_4431 ?auto_4432 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4431 ?auto_4432 )
      ( MAKE-3PILE ?auto_4429 ?auto_4430 ?auto_4431 ) )
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
    ( and ( ON-TABLE ?auto_4433 ) ( not ( = ?auto_4433 ?auto_4434 ) ) ( not ( = ?auto_4433 ?auto_4435 ) ) ( not ( = ?auto_4434 ?auto_4435 ) ) ( ON ?auto_4435 ?auto_4436 ) ( CLEAR ?auto_4435 ) ( not ( = ?auto_4433 ?auto_4436 ) ) ( not ( = ?auto_4434 ?auto_4436 ) ) ( not ( = ?auto_4435 ?auto_4436 ) ) ( HOLDING ?auto_4434 ) ( CLEAR ?auto_4433 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4433 ?auto_4434 )
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
    ( and ( ON-TABLE ?auto_4437 ) ( not ( = ?auto_4437 ?auto_4438 ) ) ( not ( = ?auto_4437 ?auto_4439 ) ) ( not ( = ?auto_4438 ?auto_4439 ) ) ( ON ?auto_4439 ?auto_4440 ) ( not ( = ?auto_4437 ?auto_4440 ) ) ( not ( = ?auto_4438 ?auto_4440 ) ) ( not ( = ?auto_4439 ?auto_4440 ) ) ( CLEAR ?auto_4437 ) ( ON ?auto_4438 ?auto_4439 ) ( CLEAR ?auto_4438 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4440 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4440 ?auto_4439 )
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
    ( and ( not ( = ?auto_4441 ?auto_4442 ) ) ( not ( = ?auto_4441 ?auto_4443 ) ) ( not ( = ?auto_4442 ?auto_4443 ) ) ( ON ?auto_4443 ?auto_4444 ) ( not ( = ?auto_4441 ?auto_4444 ) ) ( not ( = ?auto_4442 ?auto_4444 ) ) ( not ( = ?auto_4443 ?auto_4444 ) ) ( ON ?auto_4442 ?auto_4443 ) ( CLEAR ?auto_4442 ) ( ON-TABLE ?auto_4444 ) ( HOLDING ?auto_4441 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4441 )
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
    ( and ( not ( = ?auto_4445 ?auto_4446 ) ) ( not ( = ?auto_4445 ?auto_4447 ) ) ( not ( = ?auto_4446 ?auto_4447 ) ) ( ON ?auto_4447 ?auto_4448 ) ( not ( = ?auto_4445 ?auto_4448 ) ) ( not ( = ?auto_4446 ?auto_4448 ) ) ( not ( = ?auto_4447 ?auto_4448 ) ) ( ON ?auto_4446 ?auto_4447 ) ( ON-TABLE ?auto_4448 ) ( ON ?auto_4445 ?auto_4446 ) ( CLEAR ?auto_4445 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4448 ?auto_4447 ?auto_4446 )
      ( MAKE-3PILE ?auto_4445 ?auto_4446 ?auto_4447 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4475 - BLOCK
    )
    :vars
    (
      ?auto_4476 - BLOCK
      ?auto_4477 - BLOCK
      ?auto_4478 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4475 ?auto_4476 ) ( CLEAR ?auto_4475 ) ( not ( = ?auto_4475 ?auto_4476 ) ) ( HOLDING ?auto_4477 ) ( CLEAR ?auto_4478 ) ( not ( = ?auto_4475 ?auto_4477 ) ) ( not ( = ?auto_4475 ?auto_4478 ) ) ( not ( = ?auto_4476 ?auto_4477 ) ) ( not ( = ?auto_4476 ?auto_4478 ) ) ( not ( = ?auto_4477 ?auto_4478 ) ) )
    :subtasks
    ( ( !STACK ?auto_4477 ?auto_4478 )
      ( MAKE-1PILE ?auto_4475 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4479 - BLOCK
    )
    :vars
    (
      ?auto_4480 - BLOCK
      ?auto_4482 - BLOCK
      ?auto_4481 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4479 ?auto_4480 ) ( not ( = ?auto_4479 ?auto_4480 ) ) ( CLEAR ?auto_4482 ) ( not ( = ?auto_4479 ?auto_4481 ) ) ( not ( = ?auto_4479 ?auto_4482 ) ) ( not ( = ?auto_4480 ?auto_4481 ) ) ( not ( = ?auto_4480 ?auto_4482 ) ) ( not ( = ?auto_4481 ?auto_4482 ) ) ( ON ?auto_4481 ?auto_4479 ) ( CLEAR ?auto_4481 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4480 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4480 ?auto_4479 )
      ( MAKE-1PILE ?auto_4479 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4483 - BLOCK
    )
    :vars
    (
      ?auto_4484 - BLOCK
      ?auto_4486 - BLOCK
      ?auto_4485 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4483 ?auto_4484 ) ( not ( = ?auto_4483 ?auto_4484 ) ) ( not ( = ?auto_4483 ?auto_4486 ) ) ( not ( = ?auto_4483 ?auto_4485 ) ) ( not ( = ?auto_4484 ?auto_4486 ) ) ( not ( = ?auto_4484 ?auto_4485 ) ) ( not ( = ?auto_4486 ?auto_4485 ) ) ( ON ?auto_4486 ?auto_4483 ) ( CLEAR ?auto_4486 ) ( ON-TABLE ?auto_4484 ) ( HOLDING ?auto_4485 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4485 )
      ( MAKE-1PILE ?auto_4483 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4487 - BLOCK
    )
    :vars
    (
      ?auto_4490 - BLOCK
      ?auto_4489 - BLOCK
      ?auto_4488 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4487 ?auto_4490 ) ( not ( = ?auto_4487 ?auto_4490 ) ) ( not ( = ?auto_4487 ?auto_4489 ) ) ( not ( = ?auto_4487 ?auto_4488 ) ) ( not ( = ?auto_4490 ?auto_4489 ) ) ( not ( = ?auto_4490 ?auto_4488 ) ) ( not ( = ?auto_4489 ?auto_4488 ) ) ( ON ?auto_4489 ?auto_4487 ) ( ON-TABLE ?auto_4490 ) ( ON ?auto_4488 ?auto_4489 ) ( CLEAR ?auto_4488 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4490 ?auto_4487 ?auto_4489 )
      ( MAKE-1PILE ?auto_4487 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4494 - BLOCK
    )
    :vars
    (
      ?auto_4495 - BLOCK
      ?auto_4496 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4495 ?auto_4494 ) ( CLEAR ?auto_4495 ) ( ON-TABLE ?auto_4494 ) ( not ( = ?auto_4494 ?auto_4495 ) ) ( HOLDING ?auto_4496 ) ( not ( = ?auto_4494 ?auto_4496 ) ) ( not ( = ?auto_4495 ?auto_4496 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_4496 )
      ( MAKE-1PILE ?auto_4494 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4519 - BLOCK
      ?auto_4520 - BLOCK
    )
    :vars
    (
      ?auto_4521 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4519 ?auto_4520 ) ) ( ON ?auto_4520 ?auto_4521 ) ( not ( = ?auto_4519 ?auto_4521 ) ) ( not ( = ?auto_4520 ?auto_4521 ) ) ( ON ?auto_4519 ?auto_4520 ) ( CLEAR ?auto_4519 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4521 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4521 ?auto_4520 )
      ( MAKE-2PILE ?auto_4519 ?auto_4520 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4524 - BLOCK
      ?auto_4525 - BLOCK
    )
    :vars
    (
      ?auto_4526 - BLOCK
      ?auto_4527 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4524 ?auto_4525 ) ) ( ON ?auto_4525 ?auto_4526 ) ( CLEAR ?auto_4525 ) ( not ( = ?auto_4524 ?auto_4526 ) ) ( not ( = ?auto_4525 ?auto_4526 ) ) ( ON ?auto_4524 ?auto_4527 ) ( CLEAR ?auto_4524 ) ( HAND-EMPTY ) ( not ( = ?auto_4524 ?auto_4527 ) ) ( not ( = ?auto_4525 ?auto_4527 ) ) ( not ( = ?auto_4526 ?auto_4527 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4524 ?auto_4527 )
      ( MAKE-2PILE ?auto_4524 ?auto_4525 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4528 - BLOCK
      ?auto_4529 - BLOCK
    )
    :vars
    (
      ?auto_4531 - BLOCK
      ?auto_4530 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4528 ?auto_4529 ) ) ( not ( = ?auto_4528 ?auto_4531 ) ) ( not ( = ?auto_4529 ?auto_4531 ) ) ( ON ?auto_4528 ?auto_4530 ) ( CLEAR ?auto_4528 ) ( not ( = ?auto_4528 ?auto_4530 ) ) ( not ( = ?auto_4529 ?auto_4530 ) ) ( not ( = ?auto_4531 ?auto_4530 ) ) ( HOLDING ?auto_4529 ) ( CLEAR ?auto_4531 ) ( ON-TABLE ?auto_4531 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4531 ?auto_4529 )
      ( MAKE-2PILE ?auto_4528 ?auto_4529 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4532 - BLOCK
      ?auto_4533 - BLOCK
    )
    :vars
    (
      ?auto_4534 - BLOCK
      ?auto_4535 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4532 ?auto_4533 ) ) ( not ( = ?auto_4532 ?auto_4534 ) ) ( not ( = ?auto_4533 ?auto_4534 ) ) ( ON ?auto_4532 ?auto_4535 ) ( not ( = ?auto_4532 ?auto_4535 ) ) ( not ( = ?auto_4533 ?auto_4535 ) ) ( not ( = ?auto_4534 ?auto_4535 ) ) ( CLEAR ?auto_4534 ) ( ON-TABLE ?auto_4534 ) ( ON ?auto_4533 ?auto_4532 ) ( CLEAR ?auto_4533 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4535 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4535 ?auto_4532 )
      ( MAKE-2PILE ?auto_4532 ?auto_4533 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4536 - BLOCK
      ?auto_4537 - BLOCK
    )
    :vars
    (
      ?auto_4538 - BLOCK
      ?auto_4539 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4536 ?auto_4537 ) ) ( not ( = ?auto_4536 ?auto_4538 ) ) ( not ( = ?auto_4537 ?auto_4538 ) ) ( ON ?auto_4536 ?auto_4539 ) ( not ( = ?auto_4536 ?auto_4539 ) ) ( not ( = ?auto_4537 ?auto_4539 ) ) ( not ( = ?auto_4538 ?auto_4539 ) ) ( ON ?auto_4537 ?auto_4536 ) ( CLEAR ?auto_4537 ) ( ON-TABLE ?auto_4539 ) ( HOLDING ?auto_4538 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4538 )
      ( MAKE-2PILE ?auto_4536 ?auto_4537 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4540 - BLOCK
      ?auto_4541 - BLOCK
    )
    :vars
    (
      ?auto_4542 - BLOCK
      ?auto_4543 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4540 ?auto_4541 ) ) ( not ( = ?auto_4540 ?auto_4542 ) ) ( not ( = ?auto_4541 ?auto_4542 ) ) ( ON ?auto_4540 ?auto_4543 ) ( not ( = ?auto_4540 ?auto_4543 ) ) ( not ( = ?auto_4541 ?auto_4543 ) ) ( not ( = ?auto_4542 ?auto_4543 ) ) ( ON ?auto_4541 ?auto_4540 ) ( ON-TABLE ?auto_4543 ) ( ON ?auto_4542 ?auto_4541 ) ( CLEAR ?auto_4542 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4543 ?auto_4540 ?auto_4541 )
      ( MAKE-2PILE ?auto_4540 ?auto_4541 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4550 - BLOCK
      ?auto_4551 - BLOCK
      ?auto_4552 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_4551 ) ( ON-TABLE ?auto_4550 ) ( ON ?auto_4551 ?auto_4550 ) ( not ( = ?auto_4550 ?auto_4551 ) ) ( not ( = ?auto_4550 ?auto_4552 ) ) ( not ( = ?auto_4551 ?auto_4552 ) ) ( ON-TABLE ?auto_4552 ) ( CLEAR ?auto_4552 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_4552 )
      ( MAKE-3PILE ?auto_4550 ?auto_4551 ?auto_4552 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4553 - BLOCK
      ?auto_4554 - BLOCK
      ?auto_4555 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_4553 ) ( not ( = ?auto_4553 ?auto_4554 ) ) ( not ( = ?auto_4553 ?auto_4555 ) ) ( not ( = ?auto_4554 ?auto_4555 ) ) ( ON-TABLE ?auto_4555 ) ( CLEAR ?auto_4555 ) ( HOLDING ?auto_4554 ) ( CLEAR ?auto_4553 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4553 ?auto_4554 )
      ( MAKE-3PILE ?auto_4553 ?auto_4554 ?auto_4555 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4556 - BLOCK
      ?auto_4557 - BLOCK
      ?auto_4558 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_4556 ) ( not ( = ?auto_4556 ?auto_4557 ) ) ( not ( = ?auto_4556 ?auto_4558 ) ) ( not ( = ?auto_4557 ?auto_4558 ) ) ( ON-TABLE ?auto_4558 ) ( CLEAR ?auto_4556 ) ( ON ?auto_4557 ?auto_4558 ) ( CLEAR ?auto_4557 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4558 )
      ( MAKE-3PILE ?auto_4556 ?auto_4557 ?auto_4558 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4559 - BLOCK
      ?auto_4560 - BLOCK
      ?auto_4561 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4559 ?auto_4560 ) ) ( not ( = ?auto_4559 ?auto_4561 ) ) ( not ( = ?auto_4560 ?auto_4561 ) ) ( ON-TABLE ?auto_4561 ) ( ON ?auto_4560 ?auto_4561 ) ( CLEAR ?auto_4560 ) ( HOLDING ?auto_4559 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4559 )
      ( MAKE-3PILE ?auto_4559 ?auto_4560 ?auto_4561 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4562 - BLOCK
      ?auto_4563 - BLOCK
      ?auto_4564 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4562 ?auto_4563 ) ) ( not ( = ?auto_4562 ?auto_4564 ) ) ( not ( = ?auto_4563 ?auto_4564 ) ) ( ON-TABLE ?auto_4564 ) ( ON ?auto_4563 ?auto_4564 ) ( ON ?auto_4562 ?auto_4563 ) ( CLEAR ?auto_4562 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4564 ?auto_4563 )
      ( MAKE-3PILE ?auto_4562 ?auto_4563 ?auto_4564 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4568 - BLOCK
      ?auto_4569 - BLOCK
      ?auto_4570 - BLOCK
    )
    :vars
    (
      ?auto_4571 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4568 ?auto_4569 ) ) ( not ( = ?auto_4568 ?auto_4570 ) ) ( not ( = ?auto_4569 ?auto_4570 ) ) ( ON-TABLE ?auto_4570 ) ( ON ?auto_4569 ?auto_4570 ) ( CLEAR ?auto_4569 ) ( ON ?auto_4568 ?auto_4571 ) ( CLEAR ?auto_4568 ) ( HAND-EMPTY ) ( not ( = ?auto_4568 ?auto_4571 ) ) ( not ( = ?auto_4569 ?auto_4571 ) ) ( not ( = ?auto_4570 ?auto_4571 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4568 ?auto_4571 )
      ( MAKE-3PILE ?auto_4568 ?auto_4569 ?auto_4570 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4572 - BLOCK
      ?auto_4573 - BLOCK
      ?auto_4574 - BLOCK
    )
    :vars
    (
      ?auto_4575 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4572 ?auto_4573 ) ) ( not ( = ?auto_4572 ?auto_4574 ) ) ( not ( = ?auto_4573 ?auto_4574 ) ) ( ON-TABLE ?auto_4574 ) ( ON ?auto_4572 ?auto_4575 ) ( CLEAR ?auto_4572 ) ( not ( = ?auto_4572 ?auto_4575 ) ) ( not ( = ?auto_4573 ?auto_4575 ) ) ( not ( = ?auto_4574 ?auto_4575 ) ) ( HOLDING ?auto_4573 ) ( CLEAR ?auto_4574 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4574 ?auto_4573 )
      ( MAKE-3PILE ?auto_4572 ?auto_4573 ?auto_4574 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4576 - BLOCK
      ?auto_4577 - BLOCK
      ?auto_4578 - BLOCK
    )
    :vars
    (
      ?auto_4579 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4576 ?auto_4577 ) ) ( not ( = ?auto_4576 ?auto_4578 ) ) ( not ( = ?auto_4577 ?auto_4578 ) ) ( ON-TABLE ?auto_4578 ) ( ON ?auto_4576 ?auto_4579 ) ( not ( = ?auto_4576 ?auto_4579 ) ) ( not ( = ?auto_4577 ?auto_4579 ) ) ( not ( = ?auto_4578 ?auto_4579 ) ) ( CLEAR ?auto_4578 ) ( ON ?auto_4577 ?auto_4576 ) ( CLEAR ?auto_4577 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4579 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4579 ?auto_4576 )
      ( MAKE-3PILE ?auto_4576 ?auto_4577 ?auto_4578 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4580 - BLOCK
      ?auto_4581 - BLOCK
      ?auto_4582 - BLOCK
    )
    :vars
    (
      ?auto_4583 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4580 ?auto_4581 ) ) ( not ( = ?auto_4580 ?auto_4582 ) ) ( not ( = ?auto_4581 ?auto_4582 ) ) ( ON ?auto_4580 ?auto_4583 ) ( not ( = ?auto_4580 ?auto_4583 ) ) ( not ( = ?auto_4581 ?auto_4583 ) ) ( not ( = ?auto_4582 ?auto_4583 ) ) ( ON ?auto_4581 ?auto_4580 ) ( CLEAR ?auto_4581 ) ( ON-TABLE ?auto_4583 ) ( HOLDING ?auto_4582 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4582 )
      ( MAKE-3PILE ?auto_4580 ?auto_4581 ?auto_4582 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4584 - BLOCK
      ?auto_4585 - BLOCK
      ?auto_4586 - BLOCK
    )
    :vars
    (
      ?auto_4587 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4584 ?auto_4585 ) ) ( not ( = ?auto_4584 ?auto_4586 ) ) ( not ( = ?auto_4585 ?auto_4586 ) ) ( ON ?auto_4584 ?auto_4587 ) ( not ( = ?auto_4584 ?auto_4587 ) ) ( not ( = ?auto_4585 ?auto_4587 ) ) ( not ( = ?auto_4586 ?auto_4587 ) ) ( ON ?auto_4585 ?auto_4584 ) ( ON-TABLE ?auto_4587 ) ( ON ?auto_4586 ?auto_4585 ) ( CLEAR ?auto_4586 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4587 ?auto_4584 ?auto_4585 )
      ( MAKE-3PILE ?auto_4584 ?auto_4585 ?auto_4586 ) )
  )

)

