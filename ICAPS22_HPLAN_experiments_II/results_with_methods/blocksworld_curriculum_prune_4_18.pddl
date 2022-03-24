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
      ?auto_4631 - BLOCK
    )
    :vars
    (
      ?auto_4632 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4631 ?auto_4632 ) ( CLEAR ?auto_4631 ) ( HAND-EMPTY ) ( not ( = ?auto_4631 ?auto_4632 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4631 ?auto_4632 )
      ( !PUTDOWN ?auto_4631 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4638 - BLOCK
      ?auto_4639 - BLOCK
    )
    :vars
    (
      ?auto_4640 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_4638 ) ( ON ?auto_4639 ?auto_4640 ) ( CLEAR ?auto_4639 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4638 ) ( not ( = ?auto_4638 ?auto_4639 ) ) ( not ( = ?auto_4638 ?auto_4640 ) ) ( not ( = ?auto_4639 ?auto_4640 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4639 ?auto_4640 )
      ( !STACK ?auto_4639 ?auto_4638 ) )
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
    ( and ( ON ?auto_4649 ?auto_4650 ) ( not ( = ?auto_4648 ?auto_4649 ) ) ( not ( = ?auto_4648 ?auto_4650 ) ) ( not ( = ?auto_4649 ?auto_4650 ) ) ( ON ?auto_4648 ?auto_4649 ) ( CLEAR ?auto_4648 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4648 )
      ( MAKE-2PILE ?auto_4648 ?auto_4649 ) )
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
    ( and ( CLEAR ?auto_4660 ) ( ON ?auto_4661 ?auto_4662 ) ( CLEAR ?auto_4661 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4659 ) ( ON ?auto_4660 ?auto_4659 ) ( not ( = ?auto_4659 ?auto_4660 ) ) ( not ( = ?auto_4659 ?auto_4661 ) ) ( not ( = ?auto_4659 ?auto_4662 ) ) ( not ( = ?auto_4660 ?auto_4661 ) ) ( not ( = ?auto_4660 ?auto_4662 ) ) ( not ( = ?auto_4661 ?auto_4662 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4661 ?auto_4662 )
      ( !STACK ?auto_4661 ?auto_4660 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4673 - BLOCK
      ?auto_4674 - BLOCK
      ?auto_4675 - BLOCK
    )
    :vars
    (
      ?auto_4676 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4675 ?auto_4676 ) ( ON-TABLE ?auto_4673 ) ( not ( = ?auto_4673 ?auto_4674 ) ) ( not ( = ?auto_4673 ?auto_4675 ) ) ( not ( = ?auto_4673 ?auto_4676 ) ) ( not ( = ?auto_4674 ?auto_4675 ) ) ( not ( = ?auto_4674 ?auto_4676 ) ) ( not ( = ?auto_4675 ?auto_4676 ) ) ( CLEAR ?auto_4673 ) ( ON ?auto_4674 ?auto_4675 ) ( CLEAR ?auto_4674 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4673 ?auto_4674 )
      ( MAKE-3PILE ?auto_4673 ?auto_4674 ?auto_4675 ) )
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
    ( and ( ON ?auto_4689 ?auto_4690 ) ( not ( = ?auto_4687 ?auto_4688 ) ) ( not ( = ?auto_4687 ?auto_4689 ) ) ( not ( = ?auto_4687 ?auto_4690 ) ) ( not ( = ?auto_4688 ?auto_4689 ) ) ( not ( = ?auto_4688 ?auto_4690 ) ) ( not ( = ?auto_4689 ?auto_4690 ) ) ( ON ?auto_4688 ?auto_4689 ) ( ON ?auto_4687 ?auto_4688 ) ( CLEAR ?auto_4687 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4687 )
      ( MAKE-3PILE ?auto_4687 ?auto_4688 ?auto_4689 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_4702 - BLOCK
      ?auto_4703 - BLOCK
      ?auto_4704 - BLOCK
      ?auto_4705 - BLOCK
    )
    :vars
    (
      ?auto_4706 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_4704 ) ( ON ?auto_4705 ?auto_4706 ) ( CLEAR ?auto_4705 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4702 ) ( ON ?auto_4703 ?auto_4702 ) ( ON ?auto_4704 ?auto_4703 ) ( not ( = ?auto_4702 ?auto_4703 ) ) ( not ( = ?auto_4702 ?auto_4704 ) ) ( not ( = ?auto_4702 ?auto_4705 ) ) ( not ( = ?auto_4702 ?auto_4706 ) ) ( not ( = ?auto_4703 ?auto_4704 ) ) ( not ( = ?auto_4703 ?auto_4705 ) ) ( not ( = ?auto_4703 ?auto_4706 ) ) ( not ( = ?auto_4704 ?auto_4705 ) ) ( not ( = ?auto_4704 ?auto_4706 ) ) ( not ( = ?auto_4705 ?auto_4706 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4705 ?auto_4706 )
      ( !STACK ?auto_4705 ?auto_4704 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_4711 - BLOCK
      ?auto_4712 - BLOCK
      ?auto_4713 - BLOCK
      ?auto_4714 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_4713 ) ( ON-TABLE ?auto_4714 ) ( CLEAR ?auto_4714 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4711 ) ( ON ?auto_4712 ?auto_4711 ) ( ON ?auto_4713 ?auto_4712 ) ( not ( = ?auto_4711 ?auto_4712 ) ) ( not ( = ?auto_4711 ?auto_4713 ) ) ( not ( = ?auto_4711 ?auto_4714 ) ) ( not ( = ?auto_4712 ?auto_4713 ) ) ( not ( = ?auto_4712 ?auto_4714 ) ) ( not ( = ?auto_4713 ?auto_4714 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_4714 )
      ( !STACK ?auto_4714 ?auto_4713 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_4719 - BLOCK
      ?auto_4720 - BLOCK
      ?auto_4721 - BLOCK
      ?auto_4722 - BLOCK
    )
    :vars
    (
      ?auto_4723 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4722 ?auto_4723 ) ( ON-TABLE ?auto_4719 ) ( ON ?auto_4720 ?auto_4719 ) ( not ( = ?auto_4719 ?auto_4720 ) ) ( not ( = ?auto_4719 ?auto_4721 ) ) ( not ( = ?auto_4719 ?auto_4722 ) ) ( not ( = ?auto_4719 ?auto_4723 ) ) ( not ( = ?auto_4720 ?auto_4721 ) ) ( not ( = ?auto_4720 ?auto_4722 ) ) ( not ( = ?auto_4720 ?auto_4723 ) ) ( not ( = ?auto_4721 ?auto_4722 ) ) ( not ( = ?auto_4721 ?auto_4723 ) ) ( not ( = ?auto_4722 ?auto_4723 ) ) ( CLEAR ?auto_4720 ) ( ON ?auto_4721 ?auto_4722 ) ( CLEAR ?auto_4721 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4719 ?auto_4720 ?auto_4721 )
      ( MAKE-4PILE ?auto_4719 ?auto_4720 ?auto_4721 ?auto_4722 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_4728 - BLOCK
      ?auto_4729 - BLOCK
      ?auto_4730 - BLOCK
      ?auto_4731 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_4731 ) ( ON-TABLE ?auto_4728 ) ( ON ?auto_4729 ?auto_4728 ) ( not ( = ?auto_4728 ?auto_4729 ) ) ( not ( = ?auto_4728 ?auto_4730 ) ) ( not ( = ?auto_4728 ?auto_4731 ) ) ( not ( = ?auto_4729 ?auto_4730 ) ) ( not ( = ?auto_4729 ?auto_4731 ) ) ( not ( = ?auto_4730 ?auto_4731 ) ) ( CLEAR ?auto_4729 ) ( ON ?auto_4730 ?auto_4731 ) ( CLEAR ?auto_4730 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4728 ?auto_4729 ?auto_4730 )
      ( MAKE-4PILE ?auto_4728 ?auto_4729 ?auto_4730 ?auto_4731 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_4736 - BLOCK
      ?auto_4737 - BLOCK
      ?auto_4738 - BLOCK
      ?auto_4739 - BLOCK
    )
    :vars
    (
      ?auto_4740 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4739 ?auto_4740 ) ( ON-TABLE ?auto_4736 ) ( not ( = ?auto_4736 ?auto_4737 ) ) ( not ( = ?auto_4736 ?auto_4738 ) ) ( not ( = ?auto_4736 ?auto_4739 ) ) ( not ( = ?auto_4736 ?auto_4740 ) ) ( not ( = ?auto_4737 ?auto_4738 ) ) ( not ( = ?auto_4737 ?auto_4739 ) ) ( not ( = ?auto_4737 ?auto_4740 ) ) ( not ( = ?auto_4738 ?auto_4739 ) ) ( not ( = ?auto_4738 ?auto_4740 ) ) ( not ( = ?auto_4739 ?auto_4740 ) ) ( ON ?auto_4738 ?auto_4739 ) ( CLEAR ?auto_4736 ) ( ON ?auto_4737 ?auto_4738 ) ( CLEAR ?auto_4737 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4736 ?auto_4737 )
      ( MAKE-4PILE ?auto_4736 ?auto_4737 ?auto_4738 ?auto_4739 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_4745 - BLOCK
      ?auto_4746 - BLOCK
      ?auto_4747 - BLOCK
      ?auto_4748 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_4748 ) ( ON-TABLE ?auto_4745 ) ( not ( = ?auto_4745 ?auto_4746 ) ) ( not ( = ?auto_4745 ?auto_4747 ) ) ( not ( = ?auto_4745 ?auto_4748 ) ) ( not ( = ?auto_4746 ?auto_4747 ) ) ( not ( = ?auto_4746 ?auto_4748 ) ) ( not ( = ?auto_4747 ?auto_4748 ) ) ( ON ?auto_4747 ?auto_4748 ) ( CLEAR ?auto_4745 ) ( ON ?auto_4746 ?auto_4747 ) ( CLEAR ?auto_4746 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4745 ?auto_4746 )
      ( MAKE-4PILE ?auto_4745 ?auto_4746 ?auto_4747 ?auto_4748 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_4753 - BLOCK
      ?auto_4754 - BLOCK
      ?auto_4755 - BLOCK
      ?auto_4756 - BLOCK
    )
    :vars
    (
      ?auto_4757 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4756 ?auto_4757 ) ( not ( = ?auto_4753 ?auto_4754 ) ) ( not ( = ?auto_4753 ?auto_4755 ) ) ( not ( = ?auto_4753 ?auto_4756 ) ) ( not ( = ?auto_4753 ?auto_4757 ) ) ( not ( = ?auto_4754 ?auto_4755 ) ) ( not ( = ?auto_4754 ?auto_4756 ) ) ( not ( = ?auto_4754 ?auto_4757 ) ) ( not ( = ?auto_4755 ?auto_4756 ) ) ( not ( = ?auto_4755 ?auto_4757 ) ) ( not ( = ?auto_4756 ?auto_4757 ) ) ( ON ?auto_4755 ?auto_4756 ) ( ON ?auto_4754 ?auto_4755 ) ( ON ?auto_4753 ?auto_4754 ) ( CLEAR ?auto_4753 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4753 )
      ( MAKE-4PILE ?auto_4753 ?auto_4754 ?auto_4755 ?auto_4756 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_4762 - BLOCK
      ?auto_4763 - BLOCK
      ?auto_4764 - BLOCK
      ?auto_4765 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_4765 ) ( not ( = ?auto_4762 ?auto_4763 ) ) ( not ( = ?auto_4762 ?auto_4764 ) ) ( not ( = ?auto_4762 ?auto_4765 ) ) ( not ( = ?auto_4763 ?auto_4764 ) ) ( not ( = ?auto_4763 ?auto_4765 ) ) ( not ( = ?auto_4764 ?auto_4765 ) ) ( ON ?auto_4764 ?auto_4765 ) ( ON ?auto_4763 ?auto_4764 ) ( ON ?auto_4762 ?auto_4763 ) ( CLEAR ?auto_4762 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4762 )
      ( MAKE-4PILE ?auto_4762 ?auto_4763 ?auto_4764 ?auto_4765 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_4770 - BLOCK
      ?auto_4771 - BLOCK
      ?auto_4772 - BLOCK
      ?auto_4773 - BLOCK
    )
    :vars
    (
      ?auto_4774 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4770 ?auto_4771 ) ) ( not ( = ?auto_4770 ?auto_4772 ) ) ( not ( = ?auto_4770 ?auto_4773 ) ) ( not ( = ?auto_4771 ?auto_4772 ) ) ( not ( = ?auto_4771 ?auto_4773 ) ) ( not ( = ?auto_4772 ?auto_4773 ) ) ( ON ?auto_4770 ?auto_4774 ) ( not ( = ?auto_4773 ?auto_4774 ) ) ( not ( = ?auto_4772 ?auto_4774 ) ) ( not ( = ?auto_4771 ?auto_4774 ) ) ( not ( = ?auto_4770 ?auto_4774 ) ) ( ON ?auto_4771 ?auto_4770 ) ( ON ?auto_4772 ?auto_4771 ) ( ON ?auto_4773 ?auto_4772 ) ( CLEAR ?auto_4773 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_4773 ?auto_4772 ?auto_4771 ?auto_4770 )
      ( MAKE-4PILE ?auto_4770 ?auto_4771 ?auto_4772 ?auto_4773 ) )
  )

)

