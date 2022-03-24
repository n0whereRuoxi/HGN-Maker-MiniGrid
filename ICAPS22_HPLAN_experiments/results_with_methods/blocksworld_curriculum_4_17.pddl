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
      ?auto_4486 - BLOCK
    )
    :vars
    (
      ?auto_4487 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4486 ?auto_4487 ) ( CLEAR ?auto_4486 ) ( HAND-EMPTY ) ( not ( = ?auto_4486 ?auto_4487 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4486 ?auto_4487 )
      ( !PUTDOWN ?auto_4486 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4489 - BLOCK
    )
    :vars
    (
      ?auto_4490 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4489 ?auto_4490 ) ( CLEAR ?auto_4489 ) ( HAND-EMPTY ) ( not ( = ?auto_4489 ?auto_4490 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4489 ?auto_4490 )
      ( !PUTDOWN ?auto_4489 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4493 - BLOCK
      ?auto_4494 - BLOCK
    )
    :vars
    (
      ?auto_4495 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_4493 ) ( ON ?auto_4494 ?auto_4495 ) ( CLEAR ?auto_4494 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4493 ) ( not ( = ?auto_4493 ?auto_4494 ) ) ( not ( = ?auto_4493 ?auto_4495 ) ) ( not ( = ?auto_4494 ?auto_4495 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4494 ?auto_4495 )
      ( !STACK ?auto_4494 ?auto_4493 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4498 - BLOCK
      ?auto_4499 - BLOCK
    )
    :vars
    (
      ?auto_4500 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_4498 ) ( ON ?auto_4499 ?auto_4500 ) ( CLEAR ?auto_4499 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4498 ) ( not ( = ?auto_4498 ?auto_4499 ) ) ( not ( = ?auto_4498 ?auto_4500 ) ) ( not ( = ?auto_4499 ?auto_4500 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4499 ?auto_4500 )
      ( !STACK ?auto_4499 ?auto_4498 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4503 - BLOCK
      ?auto_4504 - BLOCK
    )
    :vars
    (
      ?auto_4505 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4504 ?auto_4505 ) ( not ( = ?auto_4503 ?auto_4504 ) ) ( not ( = ?auto_4503 ?auto_4505 ) ) ( not ( = ?auto_4504 ?auto_4505 ) ) ( ON ?auto_4503 ?auto_4504 ) ( CLEAR ?auto_4503 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4503 )
      ( MAKE-2PILE ?auto_4503 ?auto_4504 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4508 - BLOCK
      ?auto_4509 - BLOCK
    )
    :vars
    (
      ?auto_4510 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4509 ?auto_4510 ) ( not ( = ?auto_4508 ?auto_4509 ) ) ( not ( = ?auto_4508 ?auto_4510 ) ) ( not ( = ?auto_4509 ?auto_4510 ) ) ( ON ?auto_4508 ?auto_4509 ) ( CLEAR ?auto_4508 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4508 )
      ( MAKE-2PILE ?auto_4508 ?auto_4509 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4514 - BLOCK
      ?auto_4515 - BLOCK
      ?auto_4516 - BLOCK
    )
    :vars
    (
      ?auto_4517 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_4515 ) ( ON ?auto_4516 ?auto_4517 ) ( CLEAR ?auto_4516 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4514 ) ( ON ?auto_4515 ?auto_4514 ) ( not ( = ?auto_4514 ?auto_4515 ) ) ( not ( = ?auto_4514 ?auto_4516 ) ) ( not ( = ?auto_4514 ?auto_4517 ) ) ( not ( = ?auto_4515 ?auto_4516 ) ) ( not ( = ?auto_4515 ?auto_4517 ) ) ( not ( = ?auto_4516 ?auto_4517 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4516 ?auto_4517 )
      ( !STACK ?auto_4516 ?auto_4515 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4521 - BLOCK
      ?auto_4522 - BLOCK
      ?auto_4523 - BLOCK
    )
    :vars
    (
      ?auto_4524 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_4522 ) ( ON ?auto_4523 ?auto_4524 ) ( CLEAR ?auto_4523 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4521 ) ( ON ?auto_4522 ?auto_4521 ) ( not ( = ?auto_4521 ?auto_4522 ) ) ( not ( = ?auto_4521 ?auto_4523 ) ) ( not ( = ?auto_4521 ?auto_4524 ) ) ( not ( = ?auto_4522 ?auto_4523 ) ) ( not ( = ?auto_4522 ?auto_4524 ) ) ( not ( = ?auto_4523 ?auto_4524 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4523 ?auto_4524 )
      ( !STACK ?auto_4523 ?auto_4522 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4528 - BLOCK
      ?auto_4529 - BLOCK
      ?auto_4530 - BLOCK
    )
    :vars
    (
      ?auto_4531 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4530 ?auto_4531 ) ( ON-TABLE ?auto_4528 ) ( not ( = ?auto_4528 ?auto_4529 ) ) ( not ( = ?auto_4528 ?auto_4530 ) ) ( not ( = ?auto_4528 ?auto_4531 ) ) ( not ( = ?auto_4529 ?auto_4530 ) ) ( not ( = ?auto_4529 ?auto_4531 ) ) ( not ( = ?auto_4530 ?auto_4531 ) ) ( CLEAR ?auto_4528 ) ( ON ?auto_4529 ?auto_4530 ) ( CLEAR ?auto_4529 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4528 ?auto_4529 )
      ( MAKE-3PILE ?auto_4528 ?auto_4529 ?auto_4530 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4535 - BLOCK
      ?auto_4536 - BLOCK
      ?auto_4537 - BLOCK
    )
    :vars
    (
      ?auto_4538 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4537 ?auto_4538 ) ( ON-TABLE ?auto_4535 ) ( not ( = ?auto_4535 ?auto_4536 ) ) ( not ( = ?auto_4535 ?auto_4537 ) ) ( not ( = ?auto_4535 ?auto_4538 ) ) ( not ( = ?auto_4536 ?auto_4537 ) ) ( not ( = ?auto_4536 ?auto_4538 ) ) ( not ( = ?auto_4537 ?auto_4538 ) ) ( CLEAR ?auto_4535 ) ( ON ?auto_4536 ?auto_4537 ) ( CLEAR ?auto_4536 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4535 ?auto_4536 )
      ( MAKE-3PILE ?auto_4535 ?auto_4536 ?auto_4537 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4542 - BLOCK
      ?auto_4543 - BLOCK
      ?auto_4544 - BLOCK
    )
    :vars
    (
      ?auto_4545 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4544 ?auto_4545 ) ( not ( = ?auto_4542 ?auto_4543 ) ) ( not ( = ?auto_4542 ?auto_4544 ) ) ( not ( = ?auto_4542 ?auto_4545 ) ) ( not ( = ?auto_4543 ?auto_4544 ) ) ( not ( = ?auto_4543 ?auto_4545 ) ) ( not ( = ?auto_4544 ?auto_4545 ) ) ( ON ?auto_4543 ?auto_4544 ) ( ON ?auto_4542 ?auto_4543 ) ( CLEAR ?auto_4542 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4542 )
      ( MAKE-3PILE ?auto_4542 ?auto_4543 ?auto_4544 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4549 - BLOCK
      ?auto_4550 - BLOCK
      ?auto_4551 - BLOCK
    )
    :vars
    (
      ?auto_4552 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4551 ?auto_4552 ) ( not ( = ?auto_4549 ?auto_4550 ) ) ( not ( = ?auto_4549 ?auto_4551 ) ) ( not ( = ?auto_4549 ?auto_4552 ) ) ( not ( = ?auto_4550 ?auto_4551 ) ) ( not ( = ?auto_4550 ?auto_4552 ) ) ( not ( = ?auto_4551 ?auto_4552 ) ) ( ON ?auto_4550 ?auto_4551 ) ( ON ?auto_4549 ?auto_4550 ) ( CLEAR ?auto_4549 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4549 )
      ( MAKE-3PILE ?auto_4549 ?auto_4550 ?auto_4551 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_4557 - BLOCK
      ?auto_4558 - BLOCK
      ?auto_4559 - BLOCK
      ?auto_4560 - BLOCK
    )
    :vars
    (
      ?auto_4561 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_4559 ) ( ON ?auto_4560 ?auto_4561 ) ( CLEAR ?auto_4560 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4557 ) ( ON ?auto_4558 ?auto_4557 ) ( ON ?auto_4559 ?auto_4558 ) ( not ( = ?auto_4557 ?auto_4558 ) ) ( not ( = ?auto_4557 ?auto_4559 ) ) ( not ( = ?auto_4557 ?auto_4560 ) ) ( not ( = ?auto_4557 ?auto_4561 ) ) ( not ( = ?auto_4558 ?auto_4559 ) ) ( not ( = ?auto_4558 ?auto_4560 ) ) ( not ( = ?auto_4558 ?auto_4561 ) ) ( not ( = ?auto_4559 ?auto_4560 ) ) ( not ( = ?auto_4559 ?auto_4561 ) ) ( not ( = ?auto_4560 ?auto_4561 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4560 ?auto_4561 )
      ( !STACK ?auto_4560 ?auto_4559 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_4566 - BLOCK
      ?auto_4567 - BLOCK
      ?auto_4568 - BLOCK
      ?auto_4569 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_4568 ) ( ON-TABLE ?auto_4569 ) ( CLEAR ?auto_4569 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4566 ) ( ON ?auto_4567 ?auto_4566 ) ( ON ?auto_4568 ?auto_4567 ) ( not ( = ?auto_4566 ?auto_4567 ) ) ( not ( = ?auto_4566 ?auto_4568 ) ) ( not ( = ?auto_4566 ?auto_4569 ) ) ( not ( = ?auto_4567 ?auto_4568 ) ) ( not ( = ?auto_4567 ?auto_4569 ) ) ( not ( = ?auto_4568 ?auto_4569 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_4569 )
      ( !STACK ?auto_4569 ?auto_4568 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_4574 - BLOCK
      ?auto_4575 - BLOCK
      ?auto_4576 - BLOCK
      ?auto_4577 - BLOCK
    )
    :vars
    (
      ?auto_4578 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4577 ?auto_4578 ) ( ON-TABLE ?auto_4574 ) ( ON ?auto_4575 ?auto_4574 ) ( not ( = ?auto_4574 ?auto_4575 ) ) ( not ( = ?auto_4574 ?auto_4576 ) ) ( not ( = ?auto_4574 ?auto_4577 ) ) ( not ( = ?auto_4574 ?auto_4578 ) ) ( not ( = ?auto_4575 ?auto_4576 ) ) ( not ( = ?auto_4575 ?auto_4577 ) ) ( not ( = ?auto_4575 ?auto_4578 ) ) ( not ( = ?auto_4576 ?auto_4577 ) ) ( not ( = ?auto_4576 ?auto_4578 ) ) ( not ( = ?auto_4577 ?auto_4578 ) ) ( CLEAR ?auto_4575 ) ( ON ?auto_4576 ?auto_4577 ) ( CLEAR ?auto_4576 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4574 ?auto_4575 ?auto_4576 )
      ( MAKE-4PILE ?auto_4574 ?auto_4575 ?auto_4576 ?auto_4577 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_4583 - BLOCK
      ?auto_4584 - BLOCK
      ?auto_4585 - BLOCK
      ?auto_4586 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_4586 ) ( ON-TABLE ?auto_4583 ) ( ON ?auto_4584 ?auto_4583 ) ( not ( = ?auto_4583 ?auto_4584 ) ) ( not ( = ?auto_4583 ?auto_4585 ) ) ( not ( = ?auto_4583 ?auto_4586 ) ) ( not ( = ?auto_4584 ?auto_4585 ) ) ( not ( = ?auto_4584 ?auto_4586 ) ) ( not ( = ?auto_4585 ?auto_4586 ) ) ( CLEAR ?auto_4584 ) ( ON ?auto_4585 ?auto_4586 ) ( CLEAR ?auto_4585 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4583 ?auto_4584 ?auto_4585 )
      ( MAKE-4PILE ?auto_4583 ?auto_4584 ?auto_4585 ?auto_4586 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_4591 - BLOCK
      ?auto_4592 - BLOCK
      ?auto_4593 - BLOCK
      ?auto_4594 - BLOCK
    )
    :vars
    (
      ?auto_4595 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4594 ?auto_4595 ) ( ON-TABLE ?auto_4591 ) ( not ( = ?auto_4591 ?auto_4592 ) ) ( not ( = ?auto_4591 ?auto_4593 ) ) ( not ( = ?auto_4591 ?auto_4594 ) ) ( not ( = ?auto_4591 ?auto_4595 ) ) ( not ( = ?auto_4592 ?auto_4593 ) ) ( not ( = ?auto_4592 ?auto_4594 ) ) ( not ( = ?auto_4592 ?auto_4595 ) ) ( not ( = ?auto_4593 ?auto_4594 ) ) ( not ( = ?auto_4593 ?auto_4595 ) ) ( not ( = ?auto_4594 ?auto_4595 ) ) ( ON ?auto_4593 ?auto_4594 ) ( CLEAR ?auto_4591 ) ( ON ?auto_4592 ?auto_4593 ) ( CLEAR ?auto_4592 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4591 ?auto_4592 )
      ( MAKE-4PILE ?auto_4591 ?auto_4592 ?auto_4593 ?auto_4594 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_4600 - BLOCK
      ?auto_4601 - BLOCK
      ?auto_4602 - BLOCK
      ?auto_4603 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_4603 ) ( ON-TABLE ?auto_4600 ) ( not ( = ?auto_4600 ?auto_4601 ) ) ( not ( = ?auto_4600 ?auto_4602 ) ) ( not ( = ?auto_4600 ?auto_4603 ) ) ( not ( = ?auto_4601 ?auto_4602 ) ) ( not ( = ?auto_4601 ?auto_4603 ) ) ( not ( = ?auto_4602 ?auto_4603 ) ) ( ON ?auto_4602 ?auto_4603 ) ( CLEAR ?auto_4600 ) ( ON ?auto_4601 ?auto_4602 ) ( CLEAR ?auto_4601 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4600 ?auto_4601 )
      ( MAKE-4PILE ?auto_4600 ?auto_4601 ?auto_4602 ?auto_4603 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_4608 - BLOCK
      ?auto_4609 - BLOCK
      ?auto_4610 - BLOCK
      ?auto_4611 - BLOCK
    )
    :vars
    (
      ?auto_4612 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4611 ?auto_4612 ) ( not ( = ?auto_4608 ?auto_4609 ) ) ( not ( = ?auto_4608 ?auto_4610 ) ) ( not ( = ?auto_4608 ?auto_4611 ) ) ( not ( = ?auto_4608 ?auto_4612 ) ) ( not ( = ?auto_4609 ?auto_4610 ) ) ( not ( = ?auto_4609 ?auto_4611 ) ) ( not ( = ?auto_4609 ?auto_4612 ) ) ( not ( = ?auto_4610 ?auto_4611 ) ) ( not ( = ?auto_4610 ?auto_4612 ) ) ( not ( = ?auto_4611 ?auto_4612 ) ) ( ON ?auto_4610 ?auto_4611 ) ( ON ?auto_4609 ?auto_4610 ) ( ON ?auto_4608 ?auto_4609 ) ( CLEAR ?auto_4608 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4608 )
      ( MAKE-4PILE ?auto_4608 ?auto_4609 ?auto_4610 ?auto_4611 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_4617 - BLOCK
      ?auto_4618 - BLOCK
      ?auto_4619 - BLOCK
      ?auto_4620 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_4620 ) ( not ( = ?auto_4617 ?auto_4618 ) ) ( not ( = ?auto_4617 ?auto_4619 ) ) ( not ( = ?auto_4617 ?auto_4620 ) ) ( not ( = ?auto_4618 ?auto_4619 ) ) ( not ( = ?auto_4618 ?auto_4620 ) ) ( not ( = ?auto_4619 ?auto_4620 ) ) ( ON ?auto_4619 ?auto_4620 ) ( ON ?auto_4618 ?auto_4619 ) ( ON ?auto_4617 ?auto_4618 ) ( CLEAR ?auto_4617 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4617 )
      ( MAKE-4PILE ?auto_4617 ?auto_4618 ?auto_4619 ?auto_4620 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_4625 - BLOCK
      ?auto_4626 - BLOCK
      ?auto_4627 - BLOCK
      ?auto_4628 - BLOCK
    )
    :vars
    (
      ?auto_4629 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4625 ?auto_4626 ) ) ( not ( = ?auto_4625 ?auto_4627 ) ) ( not ( = ?auto_4625 ?auto_4628 ) ) ( not ( = ?auto_4626 ?auto_4627 ) ) ( not ( = ?auto_4626 ?auto_4628 ) ) ( not ( = ?auto_4627 ?auto_4628 ) ) ( ON ?auto_4625 ?auto_4629 ) ( not ( = ?auto_4628 ?auto_4629 ) ) ( not ( = ?auto_4627 ?auto_4629 ) ) ( not ( = ?auto_4626 ?auto_4629 ) ) ( not ( = ?auto_4625 ?auto_4629 ) ) ( ON ?auto_4626 ?auto_4625 ) ( ON ?auto_4627 ?auto_4626 ) ( ON ?auto_4628 ?auto_4627 ) ( CLEAR ?auto_4628 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_4628 ?auto_4627 ?auto_4626 ?auto_4625 )
      ( MAKE-4PILE ?auto_4625 ?auto_4626 ?auto_4627 ?auto_4628 ) )
  )

)

