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
      ?auto_4623 - BLOCK
      ?auto_4624 - BLOCK
      ?auto_4625 - BLOCK
    )
    :vars
    (
      ?auto_4626 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4626 ?auto_4625 ) ( CLEAR ?auto_4626 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4623 ) ( ON ?auto_4624 ?auto_4623 ) ( ON ?auto_4625 ?auto_4624 ) ( not ( = ?auto_4623 ?auto_4624 ) ) ( not ( = ?auto_4623 ?auto_4625 ) ) ( not ( = ?auto_4623 ?auto_4626 ) ) ( not ( = ?auto_4624 ?auto_4625 ) ) ( not ( = ?auto_4624 ?auto_4626 ) ) ( not ( = ?auto_4625 ?auto_4626 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4626 ?auto_4625 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4628 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_4628 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_4628 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4629 - BLOCK
    )
    :vars
    (
      ?auto_4630 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4629 ?auto_4630 ) ( CLEAR ?auto_4629 ) ( HAND-EMPTY ) ( not ( = ?auto_4629 ?auto_4630 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4629 ?auto_4630 )
      ( MAKE-1PILE ?auto_4629 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4633 - BLOCK
      ?auto_4634 - BLOCK
    )
    :vars
    (
      ?auto_4635 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4635 ?auto_4634 ) ( CLEAR ?auto_4635 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4633 ) ( ON ?auto_4634 ?auto_4633 ) ( not ( = ?auto_4633 ?auto_4634 ) ) ( not ( = ?auto_4633 ?auto_4635 ) ) ( not ( = ?auto_4634 ?auto_4635 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4635 ?auto_4634 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4636 - BLOCK
      ?auto_4637 - BLOCK
    )
    :vars
    (
      ?auto_4638 - BLOCK
      ?auto_4639 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4638 ?auto_4637 ) ( CLEAR ?auto_4638 ) ( ON-TABLE ?auto_4636 ) ( ON ?auto_4637 ?auto_4636 ) ( not ( = ?auto_4636 ?auto_4637 ) ) ( not ( = ?auto_4636 ?auto_4638 ) ) ( not ( = ?auto_4637 ?auto_4638 ) ) ( HOLDING ?auto_4639 ) ( not ( = ?auto_4636 ?auto_4639 ) ) ( not ( = ?auto_4637 ?auto_4639 ) ) ( not ( = ?auto_4638 ?auto_4639 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_4639 )
      ( MAKE-2PILE ?auto_4636 ?auto_4637 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4640 - BLOCK
      ?auto_4641 - BLOCK
    )
    :vars
    (
      ?auto_4642 - BLOCK
      ?auto_4643 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4642 ?auto_4641 ) ( ON-TABLE ?auto_4640 ) ( ON ?auto_4641 ?auto_4640 ) ( not ( = ?auto_4640 ?auto_4641 ) ) ( not ( = ?auto_4640 ?auto_4642 ) ) ( not ( = ?auto_4641 ?auto_4642 ) ) ( not ( = ?auto_4640 ?auto_4643 ) ) ( not ( = ?auto_4641 ?auto_4643 ) ) ( not ( = ?auto_4642 ?auto_4643 ) ) ( ON ?auto_4643 ?auto_4642 ) ( CLEAR ?auto_4643 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4640 ?auto_4641 ?auto_4642 )
      ( MAKE-2PILE ?auto_4640 ?auto_4641 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4646 - BLOCK
      ?auto_4647 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_4647 ) ( CLEAR ?auto_4646 ) ( ON-TABLE ?auto_4646 ) ( not ( = ?auto_4646 ?auto_4647 ) ) )
    :subtasks
    ( ( !STACK ?auto_4647 ?auto_4646 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4648 - BLOCK
      ?auto_4649 - BLOCK
    )
    :vars
    (
      ?auto_4650 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_4648 ) ( ON-TABLE ?auto_4648 ) ( not ( = ?auto_4648 ?auto_4649 ) ) ( ON ?auto_4649 ?auto_4650 ) ( CLEAR ?auto_4649 ) ( HAND-EMPTY ) ( not ( = ?auto_4648 ?auto_4650 ) ) ( not ( = ?auto_4649 ?auto_4650 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4649 ?auto_4650 )
      ( MAKE-2PILE ?auto_4648 ?auto_4649 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4651 - BLOCK
      ?auto_4652 - BLOCK
    )
    :vars
    (
      ?auto_4653 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4651 ?auto_4652 ) ) ( ON ?auto_4652 ?auto_4653 ) ( CLEAR ?auto_4652 ) ( not ( = ?auto_4651 ?auto_4653 ) ) ( not ( = ?auto_4652 ?auto_4653 ) ) ( HOLDING ?auto_4651 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4651 )
      ( MAKE-2PILE ?auto_4651 ?auto_4652 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4654 - BLOCK
      ?auto_4655 - BLOCK
    )
    :vars
    (
      ?auto_4656 - BLOCK
      ?auto_4657 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4654 ?auto_4655 ) ) ( ON ?auto_4655 ?auto_4656 ) ( not ( = ?auto_4654 ?auto_4656 ) ) ( not ( = ?auto_4655 ?auto_4656 ) ) ( ON ?auto_4654 ?auto_4655 ) ( CLEAR ?auto_4654 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4657 ) ( ON ?auto_4656 ?auto_4657 ) ( not ( = ?auto_4657 ?auto_4656 ) ) ( not ( = ?auto_4657 ?auto_4655 ) ) ( not ( = ?auto_4657 ?auto_4654 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4657 ?auto_4656 ?auto_4655 )
      ( MAKE-2PILE ?auto_4654 ?auto_4655 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4659 - BLOCK
    )
    :vars
    (
      ?auto_4660 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4660 ?auto_4659 ) ( CLEAR ?auto_4660 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4659 ) ( not ( = ?auto_4659 ?auto_4660 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4660 ?auto_4659 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4661 - BLOCK
    )
    :vars
    (
      ?auto_4662 - BLOCK
      ?auto_4663 - BLOCK
      ?auto_4664 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4662 ?auto_4661 ) ( CLEAR ?auto_4662 ) ( ON-TABLE ?auto_4661 ) ( not ( = ?auto_4661 ?auto_4662 ) ) ( HOLDING ?auto_4663 ) ( CLEAR ?auto_4664 ) ( not ( = ?auto_4661 ?auto_4663 ) ) ( not ( = ?auto_4661 ?auto_4664 ) ) ( not ( = ?auto_4662 ?auto_4663 ) ) ( not ( = ?auto_4662 ?auto_4664 ) ) ( not ( = ?auto_4663 ?auto_4664 ) ) )
    :subtasks
    ( ( !STACK ?auto_4663 ?auto_4664 )
      ( MAKE-1PILE ?auto_4661 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4665 - BLOCK
    )
    :vars
    (
      ?auto_4667 - BLOCK
      ?auto_4666 - BLOCK
      ?auto_4668 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4667 ?auto_4665 ) ( ON-TABLE ?auto_4665 ) ( not ( = ?auto_4665 ?auto_4667 ) ) ( CLEAR ?auto_4666 ) ( not ( = ?auto_4665 ?auto_4668 ) ) ( not ( = ?auto_4665 ?auto_4666 ) ) ( not ( = ?auto_4667 ?auto_4668 ) ) ( not ( = ?auto_4667 ?auto_4666 ) ) ( not ( = ?auto_4668 ?auto_4666 ) ) ( ON ?auto_4668 ?auto_4667 ) ( CLEAR ?auto_4668 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4665 ?auto_4667 )
      ( MAKE-1PILE ?auto_4665 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4669 - BLOCK
    )
    :vars
    (
      ?auto_4671 - BLOCK
      ?auto_4672 - BLOCK
      ?auto_4670 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4671 ?auto_4669 ) ( ON-TABLE ?auto_4669 ) ( not ( = ?auto_4669 ?auto_4671 ) ) ( not ( = ?auto_4669 ?auto_4672 ) ) ( not ( = ?auto_4669 ?auto_4670 ) ) ( not ( = ?auto_4671 ?auto_4672 ) ) ( not ( = ?auto_4671 ?auto_4670 ) ) ( not ( = ?auto_4672 ?auto_4670 ) ) ( ON ?auto_4672 ?auto_4671 ) ( CLEAR ?auto_4672 ) ( HOLDING ?auto_4670 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4670 )
      ( MAKE-1PILE ?auto_4669 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4673 - BLOCK
    )
    :vars
    (
      ?auto_4676 - BLOCK
      ?auto_4674 - BLOCK
      ?auto_4675 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4676 ?auto_4673 ) ( ON-TABLE ?auto_4673 ) ( not ( = ?auto_4673 ?auto_4676 ) ) ( not ( = ?auto_4673 ?auto_4674 ) ) ( not ( = ?auto_4673 ?auto_4675 ) ) ( not ( = ?auto_4676 ?auto_4674 ) ) ( not ( = ?auto_4676 ?auto_4675 ) ) ( not ( = ?auto_4674 ?auto_4675 ) ) ( ON ?auto_4674 ?auto_4676 ) ( ON ?auto_4675 ?auto_4674 ) ( CLEAR ?auto_4675 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4673 ?auto_4676 ?auto_4674 )
      ( MAKE-1PILE ?auto_4673 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4680 - BLOCK
      ?auto_4681 - BLOCK
      ?auto_4682 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_4682 ) ( CLEAR ?auto_4681 ) ( ON-TABLE ?auto_4680 ) ( ON ?auto_4681 ?auto_4680 ) ( not ( = ?auto_4680 ?auto_4681 ) ) ( not ( = ?auto_4680 ?auto_4682 ) ) ( not ( = ?auto_4681 ?auto_4682 ) ) )
    :subtasks
    ( ( !STACK ?auto_4682 ?auto_4681 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4683 - BLOCK
      ?auto_4684 - BLOCK
      ?auto_4685 - BLOCK
    )
    :vars
    (
      ?auto_4686 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_4684 ) ( ON-TABLE ?auto_4683 ) ( ON ?auto_4684 ?auto_4683 ) ( not ( = ?auto_4683 ?auto_4684 ) ) ( not ( = ?auto_4683 ?auto_4685 ) ) ( not ( = ?auto_4684 ?auto_4685 ) ) ( ON ?auto_4685 ?auto_4686 ) ( CLEAR ?auto_4685 ) ( HAND-EMPTY ) ( not ( = ?auto_4683 ?auto_4686 ) ) ( not ( = ?auto_4684 ?auto_4686 ) ) ( not ( = ?auto_4685 ?auto_4686 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4685 ?auto_4686 )
      ( MAKE-3PILE ?auto_4683 ?auto_4684 ?auto_4685 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4687 - BLOCK
      ?auto_4688 - BLOCK
      ?auto_4689 - BLOCK
    )
    :vars
    (
      ?auto_4690 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_4687 ) ( not ( = ?auto_4687 ?auto_4688 ) ) ( not ( = ?auto_4687 ?auto_4689 ) ) ( not ( = ?auto_4688 ?auto_4689 ) ) ( ON ?auto_4689 ?auto_4690 ) ( CLEAR ?auto_4689 ) ( not ( = ?auto_4687 ?auto_4690 ) ) ( not ( = ?auto_4688 ?auto_4690 ) ) ( not ( = ?auto_4689 ?auto_4690 ) ) ( HOLDING ?auto_4688 ) ( CLEAR ?auto_4687 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4687 ?auto_4688 )
      ( MAKE-3PILE ?auto_4687 ?auto_4688 ?auto_4689 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4691 - BLOCK
      ?auto_4692 - BLOCK
      ?auto_4693 - BLOCK
    )
    :vars
    (
      ?auto_4694 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_4691 ) ( not ( = ?auto_4691 ?auto_4692 ) ) ( not ( = ?auto_4691 ?auto_4693 ) ) ( not ( = ?auto_4692 ?auto_4693 ) ) ( ON ?auto_4693 ?auto_4694 ) ( not ( = ?auto_4691 ?auto_4694 ) ) ( not ( = ?auto_4692 ?auto_4694 ) ) ( not ( = ?auto_4693 ?auto_4694 ) ) ( CLEAR ?auto_4691 ) ( ON ?auto_4692 ?auto_4693 ) ( CLEAR ?auto_4692 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4694 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4694 ?auto_4693 )
      ( MAKE-3PILE ?auto_4691 ?auto_4692 ?auto_4693 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4695 - BLOCK
      ?auto_4696 - BLOCK
      ?auto_4697 - BLOCK
    )
    :vars
    (
      ?auto_4698 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4695 ?auto_4696 ) ) ( not ( = ?auto_4695 ?auto_4697 ) ) ( not ( = ?auto_4696 ?auto_4697 ) ) ( ON ?auto_4697 ?auto_4698 ) ( not ( = ?auto_4695 ?auto_4698 ) ) ( not ( = ?auto_4696 ?auto_4698 ) ) ( not ( = ?auto_4697 ?auto_4698 ) ) ( ON ?auto_4696 ?auto_4697 ) ( CLEAR ?auto_4696 ) ( ON-TABLE ?auto_4698 ) ( HOLDING ?auto_4695 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4695 )
      ( MAKE-3PILE ?auto_4695 ?auto_4696 ?auto_4697 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4699 - BLOCK
      ?auto_4700 - BLOCK
      ?auto_4701 - BLOCK
    )
    :vars
    (
      ?auto_4702 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4699 ?auto_4700 ) ) ( not ( = ?auto_4699 ?auto_4701 ) ) ( not ( = ?auto_4700 ?auto_4701 ) ) ( ON ?auto_4701 ?auto_4702 ) ( not ( = ?auto_4699 ?auto_4702 ) ) ( not ( = ?auto_4700 ?auto_4702 ) ) ( not ( = ?auto_4701 ?auto_4702 ) ) ( ON ?auto_4700 ?auto_4701 ) ( ON-TABLE ?auto_4702 ) ( ON ?auto_4699 ?auto_4700 ) ( CLEAR ?auto_4699 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4702 ?auto_4701 ?auto_4700 )
      ( MAKE-3PILE ?auto_4699 ?auto_4700 ?auto_4701 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4705 - BLOCK
      ?auto_4706 - BLOCK
    )
    :vars
    (
      ?auto_4707 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4707 ?auto_4706 ) ( CLEAR ?auto_4707 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4705 ) ( ON ?auto_4706 ?auto_4705 ) ( not ( = ?auto_4705 ?auto_4706 ) ) ( not ( = ?auto_4705 ?auto_4707 ) ) ( not ( = ?auto_4706 ?auto_4707 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4707 ?auto_4706 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4715 - BLOCK
      ?auto_4716 - BLOCK
    )
    :vars
    (
      ?auto_4717 - BLOCK
      ?auto_4718 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_4715 ) ( not ( = ?auto_4715 ?auto_4716 ) ) ( not ( = ?auto_4715 ?auto_4717 ) ) ( not ( = ?auto_4716 ?auto_4717 ) ) ( ON ?auto_4717 ?auto_4718 ) ( CLEAR ?auto_4717 ) ( not ( = ?auto_4715 ?auto_4718 ) ) ( not ( = ?auto_4716 ?auto_4718 ) ) ( not ( = ?auto_4717 ?auto_4718 ) ) ( HOLDING ?auto_4716 ) ( CLEAR ?auto_4715 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4715 ?auto_4716 ?auto_4717 )
      ( MAKE-2PILE ?auto_4715 ?auto_4716 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4719 - BLOCK
      ?auto_4720 - BLOCK
    )
    :vars
    (
      ?auto_4722 - BLOCK
      ?auto_4721 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_4719 ) ( not ( = ?auto_4719 ?auto_4720 ) ) ( not ( = ?auto_4719 ?auto_4722 ) ) ( not ( = ?auto_4720 ?auto_4722 ) ) ( ON ?auto_4722 ?auto_4721 ) ( not ( = ?auto_4719 ?auto_4721 ) ) ( not ( = ?auto_4720 ?auto_4721 ) ) ( not ( = ?auto_4722 ?auto_4721 ) ) ( CLEAR ?auto_4719 ) ( ON ?auto_4720 ?auto_4722 ) ( CLEAR ?auto_4720 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4721 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4721 ?auto_4722 )
      ( MAKE-2PILE ?auto_4719 ?auto_4720 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4723 - BLOCK
      ?auto_4724 - BLOCK
    )
    :vars
    (
      ?auto_4726 - BLOCK
      ?auto_4725 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4723 ?auto_4724 ) ) ( not ( = ?auto_4723 ?auto_4726 ) ) ( not ( = ?auto_4724 ?auto_4726 ) ) ( ON ?auto_4726 ?auto_4725 ) ( not ( = ?auto_4723 ?auto_4725 ) ) ( not ( = ?auto_4724 ?auto_4725 ) ) ( not ( = ?auto_4726 ?auto_4725 ) ) ( ON ?auto_4724 ?auto_4726 ) ( CLEAR ?auto_4724 ) ( ON-TABLE ?auto_4725 ) ( HOLDING ?auto_4723 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4723 )
      ( MAKE-2PILE ?auto_4723 ?auto_4724 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4727 - BLOCK
      ?auto_4728 - BLOCK
    )
    :vars
    (
      ?auto_4730 - BLOCK
      ?auto_4729 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4727 ?auto_4728 ) ) ( not ( = ?auto_4727 ?auto_4730 ) ) ( not ( = ?auto_4728 ?auto_4730 ) ) ( ON ?auto_4730 ?auto_4729 ) ( not ( = ?auto_4727 ?auto_4729 ) ) ( not ( = ?auto_4728 ?auto_4729 ) ) ( not ( = ?auto_4730 ?auto_4729 ) ) ( ON ?auto_4728 ?auto_4730 ) ( ON-TABLE ?auto_4729 ) ( ON ?auto_4727 ?auto_4728 ) ( CLEAR ?auto_4727 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4729 ?auto_4730 ?auto_4728 )
      ( MAKE-2PILE ?auto_4727 ?auto_4728 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4732 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_4732 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_4732 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4733 - BLOCK
    )
    :vars
    (
      ?auto_4734 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4733 ?auto_4734 ) ( CLEAR ?auto_4733 ) ( HAND-EMPTY ) ( not ( = ?auto_4733 ?auto_4734 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4733 ?auto_4734 )
      ( MAKE-1PILE ?auto_4733 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4735 - BLOCK
    )
    :vars
    (
      ?auto_4736 - BLOCK
      ?auto_4737 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4735 ?auto_4736 ) ) ( HOLDING ?auto_4735 ) ( CLEAR ?auto_4736 ) ( ON-TABLE ?auto_4737 ) ( ON ?auto_4736 ?auto_4737 ) ( not ( = ?auto_4737 ?auto_4736 ) ) ( not ( = ?auto_4737 ?auto_4735 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4737 ?auto_4736 ?auto_4735 )
      ( MAKE-1PILE ?auto_4735 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4738 - BLOCK
    )
    :vars
    (
      ?auto_4739 - BLOCK
      ?auto_4740 - BLOCK
      ?auto_4741 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4738 ?auto_4739 ) ) ( CLEAR ?auto_4739 ) ( ON-TABLE ?auto_4740 ) ( ON ?auto_4739 ?auto_4740 ) ( not ( = ?auto_4740 ?auto_4739 ) ) ( not ( = ?auto_4740 ?auto_4738 ) ) ( ON ?auto_4738 ?auto_4741 ) ( CLEAR ?auto_4738 ) ( HAND-EMPTY ) ( not ( = ?auto_4738 ?auto_4741 ) ) ( not ( = ?auto_4739 ?auto_4741 ) ) ( not ( = ?auto_4740 ?auto_4741 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4738 ?auto_4741 )
      ( MAKE-1PILE ?auto_4738 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4742 - BLOCK
    )
    :vars
    (
      ?auto_4745 - BLOCK
      ?auto_4743 - BLOCK
      ?auto_4744 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4742 ?auto_4745 ) ) ( ON-TABLE ?auto_4743 ) ( not ( = ?auto_4743 ?auto_4745 ) ) ( not ( = ?auto_4743 ?auto_4742 ) ) ( ON ?auto_4742 ?auto_4744 ) ( CLEAR ?auto_4742 ) ( not ( = ?auto_4742 ?auto_4744 ) ) ( not ( = ?auto_4745 ?auto_4744 ) ) ( not ( = ?auto_4743 ?auto_4744 ) ) ( HOLDING ?auto_4745 ) ( CLEAR ?auto_4743 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4743 ?auto_4745 )
      ( MAKE-1PILE ?auto_4742 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4746 - BLOCK
    )
    :vars
    (
      ?auto_4748 - BLOCK
      ?auto_4749 - BLOCK
      ?auto_4747 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4746 ?auto_4748 ) ) ( ON-TABLE ?auto_4749 ) ( not ( = ?auto_4749 ?auto_4748 ) ) ( not ( = ?auto_4749 ?auto_4746 ) ) ( ON ?auto_4746 ?auto_4747 ) ( not ( = ?auto_4746 ?auto_4747 ) ) ( not ( = ?auto_4748 ?auto_4747 ) ) ( not ( = ?auto_4749 ?auto_4747 ) ) ( CLEAR ?auto_4749 ) ( ON ?auto_4748 ?auto_4746 ) ( CLEAR ?auto_4748 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4747 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4747 ?auto_4746 )
      ( MAKE-1PILE ?auto_4746 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4750 - BLOCK
    )
    :vars
    (
      ?auto_4752 - BLOCK
      ?auto_4753 - BLOCK
      ?auto_4751 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4750 ?auto_4752 ) ) ( not ( = ?auto_4753 ?auto_4752 ) ) ( not ( = ?auto_4753 ?auto_4750 ) ) ( ON ?auto_4750 ?auto_4751 ) ( not ( = ?auto_4750 ?auto_4751 ) ) ( not ( = ?auto_4752 ?auto_4751 ) ) ( not ( = ?auto_4753 ?auto_4751 ) ) ( ON ?auto_4752 ?auto_4750 ) ( CLEAR ?auto_4752 ) ( ON-TABLE ?auto_4751 ) ( HOLDING ?auto_4753 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4753 )
      ( MAKE-1PILE ?auto_4750 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4754 - BLOCK
    )
    :vars
    (
      ?auto_4757 - BLOCK
      ?auto_4755 - BLOCK
      ?auto_4756 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4754 ?auto_4757 ) ) ( not ( = ?auto_4755 ?auto_4757 ) ) ( not ( = ?auto_4755 ?auto_4754 ) ) ( ON ?auto_4754 ?auto_4756 ) ( not ( = ?auto_4754 ?auto_4756 ) ) ( not ( = ?auto_4757 ?auto_4756 ) ) ( not ( = ?auto_4755 ?auto_4756 ) ) ( ON ?auto_4757 ?auto_4754 ) ( ON-TABLE ?auto_4756 ) ( ON ?auto_4755 ?auto_4757 ) ( CLEAR ?auto_4755 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4756 ?auto_4754 ?auto_4757 )
      ( MAKE-1PILE ?auto_4754 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4759 - BLOCK
    )
    :vars
    (
      ?auto_4760 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4760 ?auto_4759 ) ( CLEAR ?auto_4760 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4759 ) ( not ( = ?auto_4759 ?auto_4760 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4760 ?auto_4759 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4761 - BLOCK
    )
    :vars
    (
      ?auto_4762 - BLOCK
      ?auto_4763 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4762 ?auto_4761 ) ( CLEAR ?auto_4762 ) ( ON-TABLE ?auto_4761 ) ( not ( = ?auto_4761 ?auto_4762 ) ) ( HOLDING ?auto_4763 ) ( not ( = ?auto_4761 ?auto_4763 ) ) ( not ( = ?auto_4762 ?auto_4763 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_4763 )
      ( MAKE-1PILE ?auto_4761 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4764 - BLOCK
    )
    :vars
    (
      ?auto_4765 - BLOCK
      ?auto_4766 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4765 ?auto_4764 ) ( ON-TABLE ?auto_4764 ) ( not ( = ?auto_4764 ?auto_4765 ) ) ( not ( = ?auto_4764 ?auto_4766 ) ) ( not ( = ?auto_4765 ?auto_4766 ) ) ( ON ?auto_4766 ?auto_4765 ) ( CLEAR ?auto_4766 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4764 ?auto_4765 )
      ( MAKE-1PILE ?auto_4764 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4767 - BLOCK
    )
    :vars
    (
      ?auto_4768 - BLOCK
      ?auto_4769 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4768 ?auto_4767 ) ( ON-TABLE ?auto_4767 ) ( not ( = ?auto_4767 ?auto_4768 ) ) ( not ( = ?auto_4767 ?auto_4769 ) ) ( not ( = ?auto_4768 ?auto_4769 ) ) ( HOLDING ?auto_4769 ) ( CLEAR ?auto_4768 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4767 ?auto_4768 ?auto_4769 )
      ( MAKE-1PILE ?auto_4767 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4770 - BLOCK
    )
    :vars
    (
      ?auto_4772 - BLOCK
      ?auto_4771 - BLOCK
      ?auto_4773 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4772 ?auto_4770 ) ( ON-TABLE ?auto_4770 ) ( not ( = ?auto_4770 ?auto_4772 ) ) ( not ( = ?auto_4770 ?auto_4771 ) ) ( not ( = ?auto_4772 ?auto_4771 ) ) ( CLEAR ?auto_4772 ) ( ON ?auto_4771 ?auto_4773 ) ( CLEAR ?auto_4771 ) ( HAND-EMPTY ) ( not ( = ?auto_4770 ?auto_4773 ) ) ( not ( = ?auto_4772 ?auto_4773 ) ) ( not ( = ?auto_4771 ?auto_4773 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4771 ?auto_4773 )
      ( MAKE-1PILE ?auto_4770 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4782 - BLOCK
    )
    :vars
    (
      ?auto_4783 - BLOCK
      ?auto_4784 - BLOCK
      ?auto_4785 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4782 ?auto_4783 ) ) ( not ( = ?auto_4782 ?auto_4784 ) ) ( not ( = ?auto_4783 ?auto_4784 ) ) ( ON ?auto_4784 ?auto_4785 ) ( not ( = ?auto_4782 ?auto_4785 ) ) ( not ( = ?auto_4783 ?auto_4785 ) ) ( not ( = ?auto_4784 ?auto_4785 ) ) ( ON ?auto_4783 ?auto_4784 ) ( CLEAR ?auto_4783 ) ( HOLDING ?auto_4782 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4782 ?auto_4783 )
      ( MAKE-1PILE ?auto_4782 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4786 - BLOCK
    )
    :vars
    (
      ?auto_4788 - BLOCK
      ?auto_4789 - BLOCK
      ?auto_4787 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4786 ?auto_4788 ) ) ( not ( = ?auto_4786 ?auto_4789 ) ) ( not ( = ?auto_4788 ?auto_4789 ) ) ( ON ?auto_4789 ?auto_4787 ) ( not ( = ?auto_4786 ?auto_4787 ) ) ( not ( = ?auto_4788 ?auto_4787 ) ) ( not ( = ?auto_4789 ?auto_4787 ) ) ( ON ?auto_4788 ?auto_4789 ) ( ON ?auto_4786 ?auto_4788 ) ( CLEAR ?auto_4786 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4787 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4787 ?auto_4789 ?auto_4788 )
      ( MAKE-1PILE ?auto_4786 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4792 - BLOCK
      ?auto_4793 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_4793 ) ( CLEAR ?auto_4792 ) ( ON-TABLE ?auto_4792 ) ( not ( = ?auto_4792 ?auto_4793 ) ) )
    :subtasks
    ( ( !STACK ?auto_4793 ?auto_4792 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4794 - BLOCK
      ?auto_4795 - BLOCK
    )
    :vars
    (
      ?auto_4796 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_4794 ) ( ON-TABLE ?auto_4794 ) ( not ( = ?auto_4794 ?auto_4795 ) ) ( ON ?auto_4795 ?auto_4796 ) ( CLEAR ?auto_4795 ) ( HAND-EMPTY ) ( not ( = ?auto_4794 ?auto_4796 ) ) ( not ( = ?auto_4795 ?auto_4796 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4795 ?auto_4796 )
      ( MAKE-2PILE ?auto_4794 ?auto_4795 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4797 - BLOCK
      ?auto_4798 - BLOCK
    )
    :vars
    (
      ?auto_4799 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4797 ?auto_4798 ) ) ( ON ?auto_4798 ?auto_4799 ) ( CLEAR ?auto_4798 ) ( not ( = ?auto_4797 ?auto_4799 ) ) ( not ( = ?auto_4798 ?auto_4799 ) ) ( HOLDING ?auto_4797 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4797 )
      ( MAKE-2PILE ?auto_4797 ?auto_4798 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4800 - BLOCK
      ?auto_4801 - BLOCK
    )
    :vars
    (
      ?auto_4802 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4800 ?auto_4801 ) ) ( ON ?auto_4801 ?auto_4802 ) ( not ( = ?auto_4800 ?auto_4802 ) ) ( not ( = ?auto_4801 ?auto_4802 ) ) ( ON ?auto_4800 ?auto_4801 ) ( CLEAR ?auto_4800 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4802 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4802 ?auto_4801 )
      ( MAKE-2PILE ?auto_4800 ?auto_4801 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4803 - BLOCK
      ?auto_4804 - BLOCK
    )
    :vars
    (
      ?auto_4805 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4803 ?auto_4804 ) ) ( ON ?auto_4804 ?auto_4805 ) ( not ( = ?auto_4803 ?auto_4805 ) ) ( not ( = ?auto_4804 ?auto_4805 ) ) ( ON-TABLE ?auto_4805 ) ( HOLDING ?auto_4803 ) ( CLEAR ?auto_4804 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4805 ?auto_4804 ?auto_4803 )
      ( MAKE-2PILE ?auto_4803 ?auto_4804 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4806 - BLOCK
      ?auto_4807 - BLOCK
    )
    :vars
    (
      ?auto_4808 - BLOCK
      ?auto_4809 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4806 ?auto_4807 ) ) ( ON ?auto_4807 ?auto_4808 ) ( not ( = ?auto_4806 ?auto_4808 ) ) ( not ( = ?auto_4807 ?auto_4808 ) ) ( ON-TABLE ?auto_4808 ) ( CLEAR ?auto_4807 ) ( ON ?auto_4806 ?auto_4809 ) ( CLEAR ?auto_4806 ) ( HAND-EMPTY ) ( not ( = ?auto_4806 ?auto_4809 ) ) ( not ( = ?auto_4807 ?auto_4809 ) ) ( not ( = ?auto_4808 ?auto_4809 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4806 ?auto_4809 )
      ( MAKE-2PILE ?auto_4806 ?auto_4807 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4810 - BLOCK
      ?auto_4811 - BLOCK
    )
    :vars
    (
      ?auto_4812 - BLOCK
      ?auto_4813 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4810 ?auto_4811 ) ) ( not ( = ?auto_4810 ?auto_4812 ) ) ( not ( = ?auto_4811 ?auto_4812 ) ) ( ON-TABLE ?auto_4812 ) ( ON ?auto_4810 ?auto_4813 ) ( CLEAR ?auto_4810 ) ( not ( = ?auto_4810 ?auto_4813 ) ) ( not ( = ?auto_4811 ?auto_4813 ) ) ( not ( = ?auto_4812 ?auto_4813 ) ) ( HOLDING ?auto_4811 ) ( CLEAR ?auto_4812 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4812 ?auto_4811 )
      ( MAKE-2PILE ?auto_4810 ?auto_4811 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4814 - BLOCK
      ?auto_4815 - BLOCK
    )
    :vars
    (
      ?auto_4817 - BLOCK
      ?auto_4816 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4814 ?auto_4815 ) ) ( not ( = ?auto_4814 ?auto_4817 ) ) ( not ( = ?auto_4815 ?auto_4817 ) ) ( ON-TABLE ?auto_4817 ) ( ON ?auto_4814 ?auto_4816 ) ( not ( = ?auto_4814 ?auto_4816 ) ) ( not ( = ?auto_4815 ?auto_4816 ) ) ( not ( = ?auto_4817 ?auto_4816 ) ) ( CLEAR ?auto_4817 ) ( ON ?auto_4815 ?auto_4814 ) ( CLEAR ?auto_4815 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4816 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4816 ?auto_4814 )
      ( MAKE-2PILE ?auto_4814 ?auto_4815 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4818 - BLOCK
      ?auto_4819 - BLOCK
    )
    :vars
    (
      ?auto_4820 - BLOCK
      ?auto_4821 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4818 ?auto_4819 ) ) ( not ( = ?auto_4818 ?auto_4820 ) ) ( not ( = ?auto_4819 ?auto_4820 ) ) ( ON ?auto_4818 ?auto_4821 ) ( not ( = ?auto_4818 ?auto_4821 ) ) ( not ( = ?auto_4819 ?auto_4821 ) ) ( not ( = ?auto_4820 ?auto_4821 ) ) ( ON ?auto_4819 ?auto_4818 ) ( CLEAR ?auto_4819 ) ( ON-TABLE ?auto_4821 ) ( HOLDING ?auto_4820 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4820 )
      ( MAKE-2PILE ?auto_4818 ?auto_4819 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4822 - BLOCK
      ?auto_4823 - BLOCK
    )
    :vars
    (
      ?auto_4825 - BLOCK
      ?auto_4824 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4822 ?auto_4823 ) ) ( not ( = ?auto_4822 ?auto_4825 ) ) ( not ( = ?auto_4823 ?auto_4825 ) ) ( ON ?auto_4822 ?auto_4824 ) ( not ( = ?auto_4822 ?auto_4824 ) ) ( not ( = ?auto_4823 ?auto_4824 ) ) ( not ( = ?auto_4825 ?auto_4824 ) ) ( ON ?auto_4823 ?auto_4822 ) ( ON-TABLE ?auto_4824 ) ( ON ?auto_4825 ?auto_4823 ) ( CLEAR ?auto_4825 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4824 ?auto_4822 ?auto_4823 )
      ( MAKE-2PILE ?auto_4822 ?auto_4823 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4829 - BLOCK
      ?auto_4830 - BLOCK
      ?auto_4831 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_4831 ) ( CLEAR ?auto_4830 ) ( ON-TABLE ?auto_4829 ) ( ON ?auto_4830 ?auto_4829 ) ( not ( = ?auto_4829 ?auto_4830 ) ) ( not ( = ?auto_4829 ?auto_4831 ) ) ( not ( = ?auto_4830 ?auto_4831 ) ) )
    :subtasks
    ( ( !STACK ?auto_4831 ?auto_4830 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4832 - BLOCK
      ?auto_4833 - BLOCK
      ?auto_4834 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_4833 ) ( ON-TABLE ?auto_4832 ) ( ON ?auto_4833 ?auto_4832 ) ( not ( = ?auto_4832 ?auto_4833 ) ) ( not ( = ?auto_4832 ?auto_4834 ) ) ( not ( = ?auto_4833 ?auto_4834 ) ) ( ON-TABLE ?auto_4834 ) ( CLEAR ?auto_4834 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_4834 )
      ( MAKE-3PILE ?auto_4832 ?auto_4833 ?auto_4834 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4835 - BLOCK
      ?auto_4836 - BLOCK
      ?auto_4837 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_4835 ) ( not ( = ?auto_4835 ?auto_4836 ) ) ( not ( = ?auto_4835 ?auto_4837 ) ) ( not ( = ?auto_4836 ?auto_4837 ) ) ( ON-TABLE ?auto_4837 ) ( CLEAR ?auto_4837 ) ( HOLDING ?auto_4836 ) ( CLEAR ?auto_4835 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4835 ?auto_4836 )
      ( MAKE-3PILE ?auto_4835 ?auto_4836 ?auto_4837 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4838 - BLOCK
      ?auto_4839 - BLOCK
      ?auto_4840 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_4838 ) ( not ( = ?auto_4838 ?auto_4839 ) ) ( not ( = ?auto_4838 ?auto_4840 ) ) ( not ( = ?auto_4839 ?auto_4840 ) ) ( ON-TABLE ?auto_4840 ) ( CLEAR ?auto_4838 ) ( ON ?auto_4839 ?auto_4840 ) ( CLEAR ?auto_4839 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4840 )
      ( MAKE-3PILE ?auto_4838 ?auto_4839 ?auto_4840 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4841 - BLOCK
      ?auto_4842 - BLOCK
      ?auto_4843 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4841 ?auto_4842 ) ) ( not ( = ?auto_4841 ?auto_4843 ) ) ( not ( = ?auto_4842 ?auto_4843 ) ) ( ON-TABLE ?auto_4843 ) ( ON ?auto_4842 ?auto_4843 ) ( CLEAR ?auto_4842 ) ( HOLDING ?auto_4841 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4841 )
      ( MAKE-3PILE ?auto_4841 ?auto_4842 ?auto_4843 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4844 - BLOCK
      ?auto_4845 - BLOCK
      ?auto_4846 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4844 ?auto_4845 ) ) ( not ( = ?auto_4844 ?auto_4846 ) ) ( not ( = ?auto_4845 ?auto_4846 ) ) ( ON-TABLE ?auto_4846 ) ( ON ?auto_4845 ?auto_4846 ) ( ON ?auto_4844 ?auto_4845 ) ( CLEAR ?auto_4844 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4846 ?auto_4845 )
      ( MAKE-3PILE ?auto_4844 ?auto_4845 ?auto_4846 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4847 - BLOCK
      ?auto_4848 - BLOCK
      ?auto_4849 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4847 ?auto_4848 ) ) ( not ( = ?auto_4847 ?auto_4849 ) ) ( not ( = ?auto_4848 ?auto_4849 ) ) ( ON-TABLE ?auto_4849 ) ( ON ?auto_4848 ?auto_4849 ) ( HOLDING ?auto_4847 ) ( CLEAR ?auto_4848 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4849 ?auto_4848 ?auto_4847 )
      ( MAKE-3PILE ?auto_4847 ?auto_4848 ?auto_4849 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4850 - BLOCK
      ?auto_4851 - BLOCK
      ?auto_4852 - BLOCK
    )
    :vars
    (
      ?auto_4853 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4850 ?auto_4851 ) ) ( not ( = ?auto_4850 ?auto_4852 ) ) ( not ( = ?auto_4851 ?auto_4852 ) ) ( ON-TABLE ?auto_4852 ) ( ON ?auto_4851 ?auto_4852 ) ( CLEAR ?auto_4851 ) ( ON ?auto_4850 ?auto_4853 ) ( CLEAR ?auto_4850 ) ( HAND-EMPTY ) ( not ( = ?auto_4850 ?auto_4853 ) ) ( not ( = ?auto_4851 ?auto_4853 ) ) ( not ( = ?auto_4852 ?auto_4853 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4850 ?auto_4853 )
      ( MAKE-3PILE ?auto_4850 ?auto_4851 ?auto_4852 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4854 - BLOCK
      ?auto_4855 - BLOCK
      ?auto_4856 - BLOCK
    )
    :vars
    (
      ?auto_4857 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4854 ?auto_4855 ) ) ( not ( = ?auto_4854 ?auto_4856 ) ) ( not ( = ?auto_4855 ?auto_4856 ) ) ( ON-TABLE ?auto_4856 ) ( ON ?auto_4854 ?auto_4857 ) ( CLEAR ?auto_4854 ) ( not ( = ?auto_4854 ?auto_4857 ) ) ( not ( = ?auto_4855 ?auto_4857 ) ) ( not ( = ?auto_4856 ?auto_4857 ) ) ( HOLDING ?auto_4855 ) ( CLEAR ?auto_4856 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4856 ?auto_4855 )
      ( MAKE-3PILE ?auto_4854 ?auto_4855 ?auto_4856 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4858 - BLOCK
      ?auto_4859 - BLOCK
      ?auto_4860 - BLOCK
    )
    :vars
    (
      ?auto_4861 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4858 ?auto_4859 ) ) ( not ( = ?auto_4858 ?auto_4860 ) ) ( not ( = ?auto_4859 ?auto_4860 ) ) ( ON-TABLE ?auto_4860 ) ( ON ?auto_4858 ?auto_4861 ) ( not ( = ?auto_4858 ?auto_4861 ) ) ( not ( = ?auto_4859 ?auto_4861 ) ) ( not ( = ?auto_4860 ?auto_4861 ) ) ( CLEAR ?auto_4860 ) ( ON ?auto_4859 ?auto_4858 ) ( CLEAR ?auto_4859 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4861 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4861 ?auto_4858 )
      ( MAKE-3PILE ?auto_4858 ?auto_4859 ?auto_4860 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4862 - BLOCK
      ?auto_4863 - BLOCK
      ?auto_4864 - BLOCK
    )
    :vars
    (
      ?auto_4865 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4862 ?auto_4863 ) ) ( not ( = ?auto_4862 ?auto_4864 ) ) ( not ( = ?auto_4863 ?auto_4864 ) ) ( ON ?auto_4862 ?auto_4865 ) ( not ( = ?auto_4862 ?auto_4865 ) ) ( not ( = ?auto_4863 ?auto_4865 ) ) ( not ( = ?auto_4864 ?auto_4865 ) ) ( ON ?auto_4863 ?auto_4862 ) ( CLEAR ?auto_4863 ) ( ON-TABLE ?auto_4865 ) ( HOLDING ?auto_4864 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4864 )
      ( MAKE-3PILE ?auto_4862 ?auto_4863 ?auto_4864 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4866 - BLOCK
      ?auto_4867 - BLOCK
      ?auto_4868 - BLOCK
    )
    :vars
    (
      ?auto_4869 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4866 ?auto_4867 ) ) ( not ( = ?auto_4866 ?auto_4868 ) ) ( not ( = ?auto_4867 ?auto_4868 ) ) ( ON ?auto_4866 ?auto_4869 ) ( not ( = ?auto_4866 ?auto_4869 ) ) ( not ( = ?auto_4867 ?auto_4869 ) ) ( not ( = ?auto_4868 ?auto_4869 ) ) ( ON ?auto_4867 ?auto_4866 ) ( ON-TABLE ?auto_4869 ) ( ON ?auto_4868 ?auto_4867 ) ( CLEAR ?auto_4868 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4869 ?auto_4866 ?auto_4867 )
      ( MAKE-3PILE ?auto_4866 ?auto_4867 ?auto_4868 ) )
  )

)

