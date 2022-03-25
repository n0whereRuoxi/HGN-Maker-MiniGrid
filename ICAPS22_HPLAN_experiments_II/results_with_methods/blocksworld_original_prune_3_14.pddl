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
      ?auto_4591 - BLOCK
      ?auto_4592 - BLOCK
      ?auto_4593 - BLOCK
    )
    :vars
    (
      ?auto_4594 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4594 ?auto_4593 ) ( CLEAR ?auto_4594 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4591 ) ( ON ?auto_4592 ?auto_4591 ) ( ON ?auto_4593 ?auto_4592 ) ( not ( = ?auto_4591 ?auto_4592 ) ) ( not ( = ?auto_4591 ?auto_4593 ) ) ( not ( = ?auto_4591 ?auto_4594 ) ) ( not ( = ?auto_4592 ?auto_4593 ) ) ( not ( = ?auto_4592 ?auto_4594 ) ) ( not ( = ?auto_4593 ?auto_4594 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4594 ?auto_4593 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4596 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_4596 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_4596 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4597 - BLOCK
    )
    :vars
    (
      ?auto_4598 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4597 ?auto_4598 ) ( CLEAR ?auto_4597 ) ( HAND-EMPTY ) ( not ( = ?auto_4597 ?auto_4598 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4597 ?auto_4598 )
      ( MAKE-1PILE ?auto_4597 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4601 - BLOCK
      ?auto_4602 - BLOCK
    )
    :vars
    (
      ?auto_4603 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4603 ?auto_4602 ) ( CLEAR ?auto_4603 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4601 ) ( ON ?auto_4602 ?auto_4601 ) ( not ( = ?auto_4601 ?auto_4602 ) ) ( not ( = ?auto_4601 ?auto_4603 ) ) ( not ( = ?auto_4602 ?auto_4603 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4603 ?auto_4602 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4604 - BLOCK
      ?auto_4605 - BLOCK
    )
    :vars
    (
      ?auto_4606 - BLOCK
      ?auto_4607 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4606 ?auto_4605 ) ( CLEAR ?auto_4606 ) ( ON-TABLE ?auto_4604 ) ( ON ?auto_4605 ?auto_4604 ) ( not ( = ?auto_4604 ?auto_4605 ) ) ( not ( = ?auto_4604 ?auto_4606 ) ) ( not ( = ?auto_4605 ?auto_4606 ) ) ( HOLDING ?auto_4607 ) ( not ( = ?auto_4604 ?auto_4607 ) ) ( not ( = ?auto_4605 ?auto_4607 ) ) ( not ( = ?auto_4606 ?auto_4607 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_4607 )
      ( MAKE-2PILE ?auto_4604 ?auto_4605 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4608 - BLOCK
      ?auto_4609 - BLOCK
    )
    :vars
    (
      ?auto_4610 - BLOCK
      ?auto_4611 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4610 ?auto_4609 ) ( ON-TABLE ?auto_4608 ) ( ON ?auto_4609 ?auto_4608 ) ( not ( = ?auto_4608 ?auto_4609 ) ) ( not ( = ?auto_4608 ?auto_4610 ) ) ( not ( = ?auto_4609 ?auto_4610 ) ) ( not ( = ?auto_4608 ?auto_4611 ) ) ( not ( = ?auto_4609 ?auto_4611 ) ) ( not ( = ?auto_4610 ?auto_4611 ) ) ( ON ?auto_4611 ?auto_4610 ) ( CLEAR ?auto_4611 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4608 ?auto_4609 ?auto_4610 )
      ( MAKE-2PILE ?auto_4608 ?auto_4609 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4614 - BLOCK
      ?auto_4615 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_4615 ) ( CLEAR ?auto_4614 ) ( ON-TABLE ?auto_4614 ) ( not ( = ?auto_4614 ?auto_4615 ) ) )
    :subtasks
    ( ( !STACK ?auto_4615 ?auto_4614 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4616 - BLOCK
      ?auto_4617 - BLOCK
    )
    :vars
    (
      ?auto_4618 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_4616 ) ( ON-TABLE ?auto_4616 ) ( not ( = ?auto_4616 ?auto_4617 ) ) ( ON ?auto_4617 ?auto_4618 ) ( CLEAR ?auto_4617 ) ( HAND-EMPTY ) ( not ( = ?auto_4616 ?auto_4618 ) ) ( not ( = ?auto_4617 ?auto_4618 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4617 ?auto_4618 )
      ( MAKE-2PILE ?auto_4616 ?auto_4617 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4619 - BLOCK
      ?auto_4620 - BLOCK
    )
    :vars
    (
      ?auto_4621 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4619 ?auto_4620 ) ) ( ON ?auto_4620 ?auto_4621 ) ( CLEAR ?auto_4620 ) ( not ( = ?auto_4619 ?auto_4621 ) ) ( not ( = ?auto_4620 ?auto_4621 ) ) ( HOLDING ?auto_4619 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4619 )
      ( MAKE-2PILE ?auto_4619 ?auto_4620 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4622 - BLOCK
      ?auto_4623 - BLOCK
    )
    :vars
    (
      ?auto_4624 - BLOCK
      ?auto_4625 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4622 ?auto_4623 ) ) ( ON ?auto_4623 ?auto_4624 ) ( not ( = ?auto_4622 ?auto_4624 ) ) ( not ( = ?auto_4623 ?auto_4624 ) ) ( ON ?auto_4622 ?auto_4623 ) ( CLEAR ?auto_4622 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4625 ) ( ON ?auto_4624 ?auto_4625 ) ( not ( = ?auto_4625 ?auto_4624 ) ) ( not ( = ?auto_4625 ?auto_4623 ) ) ( not ( = ?auto_4625 ?auto_4622 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4625 ?auto_4624 ?auto_4623 )
      ( MAKE-2PILE ?auto_4622 ?auto_4623 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4627 - BLOCK
    )
    :vars
    (
      ?auto_4628 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4628 ?auto_4627 ) ( CLEAR ?auto_4628 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4627 ) ( not ( = ?auto_4627 ?auto_4628 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4628 ?auto_4627 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4629 - BLOCK
    )
    :vars
    (
      ?auto_4630 - BLOCK
      ?auto_4631 - BLOCK
      ?auto_4632 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4630 ?auto_4629 ) ( CLEAR ?auto_4630 ) ( ON-TABLE ?auto_4629 ) ( not ( = ?auto_4629 ?auto_4630 ) ) ( HOLDING ?auto_4631 ) ( CLEAR ?auto_4632 ) ( not ( = ?auto_4629 ?auto_4631 ) ) ( not ( = ?auto_4629 ?auto_4632 ) ) ( not ( = ?auto_4630 ?auto_4631 ) ) ( not ( = ?auto_4630 ?auto_4632 ) ) ( not ( = ?auto_4631 ?auto_4632 ) ) )
    :subtasks
    ( ( !STACK ?auto_4631 ?auto_4632 )
      ( MAKE-1PILE ?auto_4629 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4719 - BLOCK
    )
    :vars
    (
      ?auto_4720 - BLOCK
      ?auto_4721 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4720 ?auto_4719 ) ( ON-TABLE ?auto_4719 ) ( not ( = ?auto_4719 ?auto_4720 ) ) ( not ( = ?auto_4719 ?auto_4721 ) ) ( not ( = ?auto_4720 ?auto_4721 ) ) ( ON ?auto_4721 ?auto_4720 ) ( CLEAR ?auto_4721 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4719 ?auto_4720 )
      ( MAKE-1PILE ?auto_4719 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4637 - BLOCK
    )
    :vars
    (
      ?auto_4639 - BLOCK
      ?auto_4640 - BLOCK
      ?auto_4638 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4639 ?auto_4637 ) ( ON-TABLE ?auto_4637 ) ( not ( = ?auto_4637 ?auto_4639 ) ) ( not ( = ?auto_4637 ?auto_4640 ) ) ( not ( = ?auto_4637 ?auto_4638 ) ) ( not ( = ?auto_4639 ?auto_4640 ) ) ( not ( = ?auto_4639 ?auto_4638 ) ) ( not ( = ?auto_4640 ?auto_4638 ) ) ( ON ?auto_4640 ?auto_4639 ) ( CLEAR ?auto_4640 ) ( HOLDING ?auto_4638 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4638 )
      ( MAKE-1PILE ?auto_4637 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4641 - BLOCK
    )
    :vars
    (
      ?auto_4642 - BLOCK
      ?auto_4643 - BLOCK
      ?auto_4644 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4642 ?auto_4641 ) ( ON-TABLE ?auto_4641 ) ( not ( = ?auto_4641 ?auto_4642 ) ) ( not ( = ?auto_4641 ?auto_4643 ) ) ( not ( = ?auto_4641 ?auto_4644 ) ) ( not ( = ?auto_4642 ?auto_4643 ) ) ( not ( = ?auto_4642 ?auto_4644 ) ) ( not ( = ?auto_4643 ?auto_4644 ) ) ( ON ?auto_4643 ?auto_4642 ) ( ON ?auto_4644 ?auto_4643 ) ( CLEAR ?auto_4644 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4641 ?auto_4642 ?auto_4643 )
      ( MAKE-1PILE ?auto_4641 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4648 - BLOCK
      ?auto_4649 - BLOCK
      ?auto_4650 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_4650 ) ( CLEAR ?auto_4649 ) ( ON-TABLE ?auto_4648 ) ( ON ?auto_4649 ?auto_4648 ) ( not ( = ?auto_4648 ?auto_4649 ) ) ( not ( = ?auto_4648 ?auto_4650 ) ) ( not ( = ?auto_4649 ?auto_4650 ) ) )
    :subtasks
    ( ( !STACK ?auto_4650 ?auto_4649 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4651 - BLOCK
      ?auto_4652 - BLOCK
      ?auto_4653 - BLOCK
    )
    :vars
    (
      ?auto_4654 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_4652 ) ( ON-TABLE ?auto_4651 ) ( ON ?auto_4652 ?auto_4651 ) ( not ( = ?auto_4651 ?auto_4652 ) ) ( not ( = ?auto_4651 ?auto_4653 ) ) ( not ( = ?auto_4652 ?auto_4653 ) ) ( ON ?auto_4653 ?auto_4654 ) ( CLEAR ?auto_4653 ) ( HAND-EMPTY ) ( not ( = ?auto_4651 ?auto_4654 ) ) ( not ( = ?auto_4652 ?auto_4654 ) ) ( not ( = ?auto_4653 ?auto_4654 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4653 ?auto_4654 )
      ( MAKE-3PILE ?auto_4651 ?auto_4652 ?auto_4653 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4655 - BLOCK
      ?auto_4656 - BLOCK
      ?auto_4657 - BLOCK
    )
    :vars
    (
      ?auto_4658 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_4655 ) ( not ( = ?auto_4655 ?auto_4656 ) ) ( not ( = ?auto_4655 ?auto_4657 ) ) ( not ( = ?auto_4656 ?auto_4657 ) ) ( ON ?auto_4657 ?auto_4658 ) ( CLEAR ?auto_4657 ) ( not ( = ?auto_4655 ?auto_4658 ) ) ( not ( = ?auto_4656 ?auto_4658 ) ) ( not ( = ?auto_4657 ?auto_4658 ) ) ( HOLDING ?auto_4656 ) ( CLEAR ?auto_4655 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4655 ?auto_4656 )
      ( MAKE-3PILE ?auto_4655 ?auto_4656 ?auto_4657 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4659 - BLOCK
      ?auto_4660 - BLOCK
      ?auto_4661 - BLOCK
    )
    :vars
    (
      ?auto_4662 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_4659 ) ( not ( = ?auto_4659 ?auto_4660 ) ) ( not ( = ?auto_4659 ?auto_4661 ) ) ( not ( = ?auto_4660 ?auto_4661 ) ) ( ON ?auto_4661 ?auto_4662 ) ( not ( = ?auto_4659 ?auto_4662 ) ) ( not ( = ?auto_4660 ?auto_4662 ) ) ( not ( = ?auto_4661 ?auto_4662 ) ) ( CLEAR ?auto_4659 ) ( ON ?auto_4660 ?auto_4661 ) ( CLEAR ?auto_4660 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4662 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4662 ?auto_4661 )
      ( MAKE-3PILE ?auto_4659 ?auto_4660 ?auto_4661 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4663 - BLOCK
      ?auto_4664 - BLOCK
      ?auto_4665 - BLOCK
    )
    :vars
    (
      ?auto_4666 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4663 ?auto_4664 ) ) ( not ( = ?auto_4663 ?auto_4665 ) ) ( not ( = ?auto_4664 ?auto_4665 ) ) ( ON ?auto_4665 ?auto_4666 ) ( not ( = ?auto_4663 ?auto_4666 ) ) ( not ( = ?auto_4664 ?auto_4666 ) ) ( not ( = ?auto_4665 ?auto_4666 ) ) ( ON ?auto_4664 ?auto_4665 ) ( CLEAR ?auto_4664 ) ( ON-TABLE ?auto_4666 ) ( HOLDING ?auto_4663 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4663 )
      ( MAKE-3PILE ?auto_4663 ?auto_4664 ?auto_4665 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4667 - BLOCK
      ?auto_4668 - BLOCK
      ?auto_4669 - BLOCK
    )
    :vars
    (
      ?auto_4670 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4667 ?auto_4668 ) ) ( not ( = ?auto_4667 ?auto_4669 ) ) ( not ( = ?auto_4668 ?auto_4669 ) ) ( ON ?auto_4669 ?auto_4670 ) ( not ( = ?auto_4667 ?auto_4670 ) ) ( not ( = ?auto_4668 ?auto_4670 ) ) ( not ( = ?auto_4669 ?auto_4670 ) ) ( ON ?auto_4668 ?auto_4669 ) ( ON-TABLE ?auto_4670 ) ( ON ?auto_4667 ?auto_4668 ) ( CLEAR ?auto_4667 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4670 ?auto_4669 ?auto_4668 )
      ( MAKE-3PILE ?auto_4667 ?auto_4668 ?auto_4669 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4697 - BLOCK
    )
    :vars
    (
      ?auto_4698 - BLOCK
      ?auto_4699 - BLOCK
      ?auto_4700 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4697 ?auto_4698 ) ( CLEAR ?auto_4697 ) ( not ( = ?auto_4697 ?auto_4698 ) ) ( HOLDING ?auto_4699 ) ( CLEAR ?auto_4700 ) ( not ( = ?auto_4697 ?auto_4699 ) ) ( not ( = ?auto_4697 ?auto_4700 ) ) ( not ( = ?auto_4698 ?auto_4699 ) ) ( not ( = ?auto_4698 ?auto_4700 ) ) ( not ( = ?auto_4699 ?auto_4700 ) ) )
    :subtasks
    ( ( !STACK ?auto_4699 ?auto_4700 )
      ( MAKE-1PILE ?auto_4697 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4701 - BLOCK
    )
    :vars
    (
      ?auto_4703 - BLOCK
      ?auto_4704 - BLOCK
      ?auto_4702 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4701 ?auto_4703 ) ( not ( = ?auto_4701 ?auto_4703 ) ) ( CLEAR ?auto_4704 ) ( not ( = ?auto_4701 ?auto_4702 ) ) ( not ( = ?auto_4701 ?auto_4704 ) ) ( not ( = ?auto_4703 ?auto_4702 ) ) ( not ( = ?auto_4703 ?auto_4704 ) ) ( not ( = ?auto_4702 ?auto_4704 ) ) ( ON ?auto_4702 ?auto_4701 ) ( CLEAR ?auto_4702 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4703 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4703 ?auto_4701 )
      ( MAKE-1PILE ?auto_4701 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4705 - BLOCK
    )
    :vars
    (
      ?auto_4706 - BLOCK
      ?auto_4707 - BLOCK
      ?auto_4708 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4705 ?auto_4706 ) ( not ( = ?auto_4705 ?auto_4706 ) ) ( not ( = ?auto_4705 ?auto_4707 ) ) ( not ( = ?auto_4705 ?auto_4708 ) ) ( not ( = ?auto_4706 ?auto_4707 ) ) ( not ( = ?auto_4706 ?auto_4708 ) ) ( not ( = ?auto_4707 ?auto_4708 ) ) ( ON ?auto_4707 ?auto_4705 ) ( CLEAR ?auto_4707 ) ( ON-TABLE ?auto_4706 ) ( HOLDING ?auto_4708 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4708 )
      ( MAKE-1PILE ?auto_4705 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4709 - BLOCK
    )
    :vars
    (
      ?auto_4711 - BLOCK
      ?auto_4710 - BLOCK
      ?auto_4712 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4709 ?auto_4711 ) ( not ( = ?auto_4709 ?auto_4711 ) ) ( not ( = ?auto_4709 ?auto_4710 ) ) ( not ( = ?auto_4709 ?auto_4712 ) ) ( not ( = ?auto_4711 ?auto_4710 ) ) ( not ( = ?auto_4711 ?auto_4712 ) ) ( not ( = ?auto_4710 ?auto_4712 ) ) ( ON ?auto_4710 ?auto_4709 ) ( ON-TABLE ?auto_4711 ) ( ON ?auto_4712 ?auto_4710 ) ( CLEAR ?auto_4712 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4711 ?auto_4709 ?auto_4710 )
      ( MAKE-1PILE ?auto_4709 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4716 - BLOCK
    )
    :vars
    (
      ?auto_4717 - BLOCK
      ?auto_4718 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4717 ?auto_4716 ) ( CLEAR ?auto_4717 ) ( ON-TABLE ?auto_4716 ) ( not ( = ?auto_4716 ?auto_4717 ) ) ( HOLDING ?auto_4718 ) ( not ( = ?auto_4716 ?auto_4718 ) ) ( not ( = ?auto_4717 ?auto_4718 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_4718 )
      ( MAKE-1PILE ?auto_4716 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4741 - BLOCK
      ?auto_4742 - BLOCK
    )
    :vars
    (
      ?auto_4743 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4741 ?auto_4742 ) ) ( ON ?auto_4742 ?auto_4743 ) ( not ( = ?auto_4741 ?auto_4743 ) ) ( not ( = ?auto_4742 ?auto_4743 ) ) ( ON ?auto_4741 ?auto_4742 ) ( CLEAR ?auto_4741 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4743 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4743 ?auto_4742 )
      ( MAKE-2PILE ?auto_4741 ?auto_4742 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4746 - BLOCK
      ?auto_4747 - BLOCK
    )
    :vars
    (
      ?auto_4748 - BLOCK
      ?auto_4749 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4746 ?auto_4747 ) ) ( ON ?auto_4747 ?auto_4748 ) ( CLEAR ?auto_4747 ) ( not ( = ?auto_4746 ?auto_4748 ) ) ( not ( = ?auto_4747 ?auto_4748 ) ) ( ON ?auto_4746 ?auto_4749 ) ( CLEAR ?auto_4746 ) ( HAND-EMPTY ) ( not ( = ?auto_4746 ?auto_4749 ) ) ( not ( = ?auto_4747 ?auto_4749 ) ) ( not ( = ?auto_4748 ?auto_4749 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4746 ?auto_4749 )
      ( MAKE-2PILE ?auto_4746 ?auto_4747 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4750 - BLOCK
      ?auto_4751 - BLOCK
    )
    :vars
    (
      ?auto_4753 - BLOCK
      ?auto_4752 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4750 ?auto_4751 ) ) ( not ( = ?auto_4750 ?auto_4753 ) ) ( not ( = ?auto_4751 ?auto_4753 ) ) ( ON ?auto_4750 ?auto_4752 ) ( CLEAR ?auto_4750 ) ( not ( = ?auto_4750 ?auto_4752 ) ) ( not ( = ?auto_4751 ?auto_4752 ) ) ( not ( = ?auto_4753 ?auto_4752 ) ) ( HOLDING ?auto_4751 ) ( CLEAR ?auto_4753 ) ( ON-TABLE ?auto_4753 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4753 ?auto_4751 )
      ( MAKE-2PILE ?auto_4750 ?auto_4751 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4754 - BLOCK
      ?auto_4755 - BLOCK
    )
    :vars
    (
      ?auto_4757 - BLOCK
      ?auto_4756 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4754 ?auto_4755 ) ) ( not ( = ?auto_4754 ?auto_4757 ) ) ( not ( = ?auto_4755 ?auto_4757 ) ) ( ON ?auto_4754 ?auto_4756 ) ( not ( = ?auto_4754 ?auto_4756 ) ) ( not ( = ?auto_4755 ?auto_4756 ) ) ( not ( = ?auto_4757 ?auto_4756 ) ) ( CLEAR ?auto_4757 ) ( ON-TABLE ?auto_4757 ) ( ON ?auto_4755 ?auto_4754 ) ( CLEAR ?auto_4755 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4756 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4756 ?auto_4754 )
      ( MAKE-2PILE ?auto_4754 ?auto_4755 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4758 - BLOCK
      ?auto_4759 - BLOCK
    )
    :vars
    (
      ?auto_4760 - BLOCK
      ?auto_4761 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4758 ?auto_4759 ) ) ( not ( = ?auto_4758 ?auto_4760 ) ) ( not ( = ?auto_4759 ?auto_4760 ) ) ( ON ?auto_4758 ?auto_4761 ) ( not ( = ?auto_4758 ?auto_4761 ) ) ( not ( = ?auto_4759 ?auto_4761 ) ) ( not ( = ?auto_4760 ?auto_4761 ) ) ( ON ?auto_4759 ?auto_4758 ) ( CLEAR ?auto_4759 ) ( ON-TABLE ?auto_4761 ) ( HOLDING ?auto_4760 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4760 )
      ( MAKE-2PILE ?auto_4758 ?auto_4759 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4762 - BLOCK
      ?auto_4763 - BLOCK
    )
    :vars
    (
      ?auto_4764 - BLOCK
      ?auto_4765 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4762 ?auto_4763 ) ) ( not ( = ?auto_4762 ?auto_4764 ) ) ( not ( = ?auto_4763 ?auto_4764 ) ) ( ON ?auto_4762 ?auto_4765 ) ( not ( = ?auto_4762 ?auto_4765 ) ) ( not ( = ?auto_4763 ?auto_4765 ) ) ( not ( = ?auto_4764 ?auto_4765 ) ) ( ON ?auto_4763 ?auto_4762 ) ( ON-TABLE ?auto_4765 ) ( ON ?auto_4764 ?auto_4763 ) ( CLEAR ?auto_4764 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4765 ?auto_4762 ?auto_4763 )
      ( MAKE-2PILE ?auto_4762 ?auto_4763 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4772 - BLOCK
      ?auto_4773 - BLOCK
      ?auto_4774 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_4773 ) ( ON-TABLE ?auto_4772 ) ( ON ?auto_4773 ?auto_4772 ) ( not ( = ?auto_4772 ?auto_4773 ) ) ( not ( = ?auto_4772 ?auto_4774 ) ) ( not ( = ?auto_4773 ?auto_4774 ) ) ( ON-TABLE ?auto_4774 ) ( CLEAR ?auto_4774 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_4774 )
      ( MAKE-3PILE ?auto_4772 ?auto_4773 ?auto_4774 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4775 - BLOCK
      ?auto_4776 - BLOCK
      ?auto_4777 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_4775 ) ( not ( = ?auto_4775 ?auto_4776 ) ) ( not ( = ?auto_4775 ?auto_4777 ) ) ( not ( = ?auto_4776 ?auto_4777 ) ) ( ON-TABLE ?auto_4777 ) ( CLEAR ?auto_4777 ) ( HOLDING ?auto_4776 ) ( CLEAR ?auto_4775 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4775 ?auto_4776 )
      ( MAKE-3PILE ?auto_4775 ?auto_4776 ?auto_4777 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4778 - BLOCK
      ?auto_4779 - BLOCK
      ?auto_4780 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_4778 ) ( not ( = ?auto_4778 ?auto_4779 ) ) ( not ( = ?auto_4778 ?auto_4780 ) ) ( not ( = ?auto_4779 ?auto_4780 ) ) ( ON-TABLE ?auto_4780 ) ( CLEAR ?auto_4778 ) ( ON ?auto_4779 ?auto_4780 ) ( CLEAR ?auto_4779 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4780 )
      ( MAKE-3PILE ?auto_4778 ?auto_4779 ?auto_4780 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4781 - BLOCK
      ?auto_4782 - BLOCK
      ?auto_4783 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4781 ?auto_4782 ) ) ( not ( = ?auto_4781 ?auto_4783 ) ) ( not ( = ?auto_4782 ?auto_4783 ) ) ( ON-TABLE ?auto_4783 ) ( ON ?auto_4782 ?auto_4783 ) ( CLEAR ?auto_4782 ) ( HOLDING ?auto_4781 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4781 )
      ( MAKE-3PILE ?auto_4781 ?auto_4782 ?auto_4783 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4784 - BLOCK
      ?auto_4785 - BLOCK
      ?auto_4786 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4784 ?auto_4785 ) ) ( not ( = ?auto_4784 ?auto_4786 ) ) ( not ( = ?auto_4785 ?auto_4786 ) ) ( ON-TABLE ?auto_4786 ) ( ON ?auto_4785 ?auto_4786 ) ( ON ?auto_4784 ?auto_4785 ) ( CLEAR ?auto_4784 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4786 ?auto_4785 )
      ( MAKE-3PILE ?auto_4784 ?auto_4785 ?auto_4786 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4790 - BLOCK
      ?auto_4791 - BLOCK
      ?auto_4792 - BLOCK
    )
    :vars
    (
      ?auto_4793 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4790 ?auto_4791 ) ) ( not ( = ?auto_4790 ?auto_4792 ) ) ( not ( = ?auto_4791 ?auto_4792 ) ) ( ON-TABLE ?auto_4792 ) ( ON ?auto_4791 ?auto_4792 ) ( CLEAR ?auto_4791 ) ( ON ?auto_4790 ?auto_4793 ) ( CLEAR ?auto_4790 ) ( HAND-EMPTY ) ( not ( = ?auto_4790 ?auto_4793 ) ) ( not ( = ?auto_4791 ?auto_4793 ) ) ( not ( = ?auto_4792 ?auto_4793 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4790 ?auto_4793 )
      ( MAKE-3PILE ?auto_4790 ?auto_4791 ?auto_4792 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4794 - BLOCK
      ?auto_4795 - BLOCK
      ?auto_4796 - BLOCK
    )
    :vars
    (
      ?auto_4797 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4794 ?auto_4795 ) ) ( not ( = ?auto_4794 ?auto_4796 ) ) ( not ( = ?auto_4795 ?auto_4796 ) ) ( ON-TABLE ?auto_4796 ) ( ON ?auto_4794 ?auto_4797 ) ( CLEAR ?auto_4794 ) ( not ( = ?auto_4794 ?auto_4797 ) ) ( not ( = ?auto_4795 ?auto_4797 ) ) ( not ( = ?auto_4796 ?auto_4797 ) ) ( HOLDING ?auto_4795 ) ( CLEAR ?auto_4796 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4796 ?auto_4795 )
      ( MAKE-3PILE ?auto_4794 ?auto_4795 ?auto_4796 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4798 - BLOCK
      ?auto_4799 - BLOCK
      ?auto_4800 - BLOCK
    )
    :vars
    (
      ?auto_4801 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4798 ?auto_4799 ) ) ( not ( = ?auto_4798 ?auto_4800 ) ) ( not ( = ?auto_4799 ?auto_4800 ) ) ( ON-TABLE ?auto_4800 ) ( ON ?auto_4798 ?auto_4801 ) ( not ( = ?auto_4798 ?auto_4801 ) ) ( not ( = ?auto_4799 ?auto_4801 ) ) ( not ( = ?auto_4800 ?auto_4801 ) ) ( CLEAR ?auto_4800 ) ( ON ?auto_4799 ?auto_4798 ) ( CLEAR ?auto_4799 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4801 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4801 ?auto_4798 )
      ( MAKE-3PILE ?auto_4798 ?auto_4799 ?auto_4800 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4802 - BLOCK
      ?auto_4803 - BLOCK
      ?auto_4804 - BLOCK
    )
    :vars
    (
      ?auto_4805 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4802 ?auto_4803 ) ) ( not ( = ?auto_4802 ?auto_4804 ) ) ( not ( = ?auto_4803 ?auto_4804 ) ) ( ON ?auto_4802 ?auto_4805 ) ( not ( = ?auto_4802 ?auto_4805 ) ) ( not ( = ?auto_4803 ?auto_4805 ) ) ( not ( = ?auto_4804 ?auto_4805 ) ) ( ON ?auto_4803 ?auto_4802 ) ( CLEAR ?auto_4803 ) ( ON-TABLE ?auto_4805 ) ( HOLDING ?auto_4804 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4804 )
      ( MAKE-3PILE ?auto_4802 ?auto_4803 ?auto_4804 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4806 - BLOCK
      ?auto_4807 - BLOCK
      ?auto_4808 - BLOCK
    )
    :vars
    (
      ?auto_4809 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4806 ?auto_4807 ) ) ( not ( = ?auto_4806 ?auto_4808 ) ) ( not ( = ?auto_4807 ?auto_4808 ) ) ( ON ?auto_4806 ?auto_4809 ) ( not ( = ?auto_4806 ?auto_4809 ) ) ( not ( = ?auto_4807 ?auto_4809 ) ) ( not ( = ?auto_4808 ?auto_4809 ) ) ( ON ?auto_4807 ?auto_4806 ) ( ON-TABLE ?auto_4809 ) ( ON ?auto_4808 ?auto_4807 ) ( CLEAR ?auto_4808 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4809 ?auto_4806 ?auto_4807 )
      ( MAKE-3PILE ?auto_4806 ?auto_4807 ?auto_4808 ) )
  )

)

