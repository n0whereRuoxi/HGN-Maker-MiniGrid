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
      ?auto_9529 - BLOCK
    )
    :vars
    (
      ?auto_9530 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9529 ?auto_9530 ) ( CLEAR ?auto_9529 ) ( HAND-EMPTY ) ( not ( = ?auto_9529 ?auto_9530 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9529 ?auto_9530 )
      ( !PUTDOWN ?auto_9529 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9536 - BLOCK
      ?auto_9537 - BLOCK
    )
    :vars
    (
      ?auto_9538 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_9536 ) ( ON ?auto_9537 ?auto_9538 ) ( CLEAR ?auto_9537 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9536 ) ( not ( = ?auto_9536 ?auto_9537 ) ) ( not ( = ?auto_9536 ?auto_9538 ) ) ( not ( = ?auto_9537 ?auto_9538 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9537 ?auto_9538 )
      ( !STACK ?auto_9537 ?auto_9536 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9546 - BLOCK
      ?auto_9547 - BLOCK
    )
    :vars
    (
      ?auto_9548 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9547 ?auto_9548 ) ( not ( = ?auto_9546 ?auto_9547 ) ) ( not ( = ?auto_9546 ?auto_9548 ) ) ( not ( = ?auto_9547 ?auto_9548 ) ) ( ON ?auto_9546 ?auto_9547 ) ( CLEAR ?auto_9546 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9546 )
      ( MAKE-2PILE ?auto_9546 ?auto_9547 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9557 - BLOCK
      ?auto_9558 - BLOCK
      ?auto_9559 - BLOCK
    )
    :vars
    (
      ?auto_9560 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_9558 ) ( ON ?auto_9559 ?auto_9560 ) ( CLEAR ?auto_9559 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9557 ) ( ON ?auto_9558 ?auto_9557 ) ( not ( = ?auto_9557 ?auto_9558 ) ) ( not ( = ?auto_9557 ?auto_9559 ) ) ( not ( = ?auto_9557 ?auto_9560 ) ) ( not ( = ?auto_9558 ?auto_9559 ) ) ( not ( = ?auto_9558 ?auto_9560 ) ) ( not ( = ?auto_9559 ?auto_9560 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9559 ?auto_9560 )
      ( !STACK ?auto_9559 ?auto_9558 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9571 - BLOCK
      ?auto_9572 - BLOCK
      ?auto_9573 - BLOCK
    )
    :vars
    (
      ?auto_9574 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9573 ?auto_9574 ) ( ON-TABLE ?auto_9571 ) ( not ( = ?auto_9571 ?auto_9572 ) ) ( not ( = ?auto_9571 ?auto_9573 ) ) ( not ( = ?auto_9571 ?auto_9574 ) ) ( not ( = ?auto_9572 ?auto_9573 ) ) ( not ( = ?auto_9572 ?auto_9574 ) ) ( not ( = ?auto_9573 ?auto_9574 ) ) ( CLEAR ?auto_9571 ) ( ON ?auto_9572 ?auto_9573 ) ( CLEAR ?auto_9572 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9571 ?auto_9572 )
      ( MAKE-3PILE ?auto_9571 ?auto_9572 ?auto_9573 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9585 - BLOCK
      ?auto_9586 - BLOCK
      ?auto_9587 - BLOCK
    )
    :vars
    (
      ?auto_9588 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9587 ?auto_9588 ) ( not ( = ?auto_9585 ?auto_9586 ) ) ( not ( = ?auto_9585 ?auto_9587 ) ) ( not ( = ?auto_9585 ?auto_9588 ) ) ( not ( = ?auto_9586 ?auto_9587 ) ) ( not ( = ?auto_9586 ?auto_9588 ) ) ( not ( = ?auto_9587 ?auto_9588 ) ) ( ON ?auto_9586 ?auto_9587 ) ( ON ?auto_9585 ?auto_9586 ) ( CLEAR ?auto_9585 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9585 )
      ( MAKE-3PILE ?auto_9585 ?auto_9586 ?auto_9587 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9600 - BLOCK
      ?auto_9601 - BLOCK
      ?auto_9602 - BLOCK
      ?auto_9603 - BLOCK
    )
    :vars
    (
      ?auto_9604 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_9602 ) ( ON ?auto_9603 ?auto_9604 ) ( CLEAR ?auto_9603 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9600 ) ( ON ?auto_9601 ?auto_9600 ) ( ON ?auto_9602 ?auto_9601 ) ( not ( = ?auto_9600 ?auto_9601 ) ) ( not ( = ?auto_9600 ?auto_9602 ) ) ( not ( = ?auto_9600 ?auto_9603 ) ) ( not ( = ?auto_9600 ?auto_9604 ) ) ( not ( = ?auto_9601 ?auto_9602 ) ) ( not ( = ?auto_9601 ?auto_9603 ) ) ( not ( = ?auto_9601 ?auto_9604 ) ) ( not ( = ?auto_9602 ?auto_9603 ) ) ( not ( = ?auto_9602 ?auto_9604 ) ) ( not ( = ?auto_9603 ?auto_9604 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9603 ?auto_9604 )
      ( !STACK ?auto_9603 ?auto_9602 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9618 - BLOCK
      ?auto_9619 - BLOCK
      ?auto_9620 - BLOCK
      ?auto_9621 - BLOCK
    )
    :vars
    (
      ?auto_9622 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9621 ?auto_9622 ) ( ON-TABLE ?auto_9618 ) ( ON ?auto_9619 ?auto_9618 ) ( not ( = ?auto_9618 ?auto_9619 ) ) ( not ( = ?auto_9618 ?auto_9620 ) ) ( not ( = ?auto_9618 ?auto_9621 ) ) ( not ( = ?auto_9618 ?auto_9622 ) ) ( not ( = ?auto_9619 ?auto_9620 ) ) ( not ( = ?auto_9619 ?auto_9621 ) ) ( not ( = ?auto_9619 ?auto_9622 ) ) ( not ( = ?auto_9620 ?auto_9621 ) ) ( not ( = ?auto_9620 ?auto_9622 ) ) ( not ( = ?auto_9621 ?auto_9622 ) ) ( CLEAR ?auto_9619 ) ( ON ?auto_9620 ?auto_9621 ) ( CLEAR ?auto_9620 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9618 ?auto_9619 ?auto_9620 )
      ( MAKE-4PILE ?auto_9618 ?auto_9619 ?auto_9620 ?auto_9621 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9636 - BLOCK
      ?auto_9637 - BLOCK
      ?auto_9638 - BLOCK
      ?auto_9639 - BLOCK
    )
    :vars
    (
      ?auto_9640 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9639 ?auto_9640 ) ( ON-TABLE ?auto_9636 ) ( not ( = ?auto_9636 ?auto_9637 ) ) ( not ( = ?auto_9636 ?auto_9638 ) ) ( not ( = ?auto_9636 ?auto_9639 ) ) ( not ( = ?auto_9636 ?auto_9640 ) ) ( not ( = ?auto_9637 ?auto_9638 ) ) ( not ( = ?auto_9637 ?auto_9639 ) ) ( not ( = ?auto_9637 ?auto_9640 ) ) ( not ( = ?auto_9638 ?auto_9639 ) ) ( not ( = ?auto_9638 ?auto_9640 ) ) ( not ( = ?auto_9639 ?auto_9640 ) ) ( ON ?auto_9638 ?auto_9639 ) ( CLEAR ?auto_9636 ) ( ON ?auto_9637 ?auto_9638 ) ( CLEAR ?auto_9637 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9636 ?auto_9637 )
      ( MAKE-4PILE ?auto_9636 ?auto_9637 ?auto_9638 ?auto_9639 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9654 - BLOCK
      ?auto_9655 - BLOCK
      ?auto_9656 - BLOCK
      ?auto_9657 - BLOCK
    )
    :vars
    (
      ?auto_9658 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9657 ?auto_9658 ) ( not ( = ?auto_9654 ?auto_9655 ) ) ( not ( = ?auto_9654 ?auto_9656 ) ) ( not ( = ?auto_9654 ?auto_9657 ) ) ( not ( = ?auto_9654 ?auto_9658 ) ) ( not ( = ?auto_9655 ?auto_9656 ) ) ( not ( = ?auto_9655 ?auto_9657 ) ) ( not ( = ?auto_9655 ?auto_9658 ) ) ( not ( = ?auto_9656 ?auto_9657 ) ) ( not ( = ?auto_9656 ?auto_9658 ) ) ( not ( = ?auto_9657 ?auto_9658 ) ) ( ON ?auto_9656 ?auto_9657 ) ( ON ?auto_9655 ?auto_9656 ) ( ON ?auto_9654 ?auto_9655 ) ( CLEAR ?auto_9654 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9654 )
      ( MAKE-4PILE ?auto_9654 ?auto_9655 ?auto_9656 ?auto_9657 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_9673 - BLOCK
      ?auto_9674 - BLOCK
      ?auto_9675 - BLOCK
      ?auto_9676 - BLOCK
      ?auto_9677 - BLOCK
    )
    :vars
    (
      ?auto_9678 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_9676 ) ( ON ?auto_9677 ?auto_9678 ) ( CLEAR ?auto_9677 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9673 ) ( ON ?auto_9674 ?auto_9673 ) ( ON ?auto_9675 ?auto_9674 ) ( ON ?auto_9676 ?auto_9675 ) ( not ( = ?auto_9673 ?auto_9674 ) ) ( not ( = ?auto_9673 ?auto_9675 ) ) ( not ( = ?auto_9673 ?auto_9676 ) ) ( not ( = ?auto_9673 ?auto_9677 ) ) ( not ( = ?auto_9673 ?auto_9678 ) ) ( not ( = ?auto_9674 ?auto_9675 ) ) ( not ( = ?auto_9674 ?auto_9676 ) ) ( not ( = ?auto_9674 ?auto_9677 ) ) ( not ( = ?auto_9674 ?auto_9678 ) ) ( not ( = ?auto_9675 ?auto_9676 ) ) ( not ( = ?auto_9675 ?auto_9677 ) ) ( not ( = ?auto_9675 ?auto_9678 ) ) ( not ( = ?auto_9676 ?auto_9677 ) ) ( not ( = ?auto_9676 ?auto_9678 ) ) ( not ( = ?auto_9677 ?auto_9678 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9677 ?auto_9678 )
      ( !STACK ?auto_9677 ?auto_9676 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_9684 - BLOCK
      ?auto_9685 - BLOCK
      ?auto_9686 - BLOCK
      ?auto_9687 - BLOCK
      ?auto_9688 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_9687 ) ( ON-TABLE ?auto_9688 ) ( CLEAR ?auto_9688 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9684 ) ( ON ?auto_9685 ?auto_9684 ) ( ON ?auto_9686 ?auto_9685 ) ( ON ?auto_9687 ?auto_9686 ) ( not ( = ?auto_9684 ?auto_9685 ) ) ( not ( = ?auto_9684 ?auto_9686 ) ) ( not ( = ?auto_9684 ?auto_9687 ) ) ( not ( = ?auto_9684 ?auto_9688 ) ) ( not ( = ?auto_9685 ?auto_9686 ) ) ( not ( = ?auto_9685 ?auto_9687 ) ) ( not ( = ?auto_9685 ?auto_9688 ) ) ( not ( = ?auto_9686 ?auto_9687 ) ) ( not ( = ?auto_9686 ?auto_9688 ) ) ( not ( = ?auto_9687 ?auto_9688 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_9688 )
      ( !STACK ?auto_9688 ?auto_9687 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_9694 - BLOCK
      ?auto_9695 - BLOCK
      ?auto_9696 - BLOCK
      ?auto_9697 - BLOCK
      ?auto_9698 - BLOCK
    )
    :vars
    (
      ?auto_9699 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9698 ?auto_9699 ) ( ON-TABLE ?auto_9694 ) ( ON ?auto_9695 ?auto_9694 ) ( ON ?auto_9696 ?auto_9695 ) ( not ( = ?auto_9694 ?auto_9695 ) ) ( not ( = ?auto_9694 ?auto_9696 ) ) ( not ( = ?auto_9694 ?auto_9697 ) ) ( not ( = ?auto_9694 ?auto_9698 ) ) ( not ( = ?auto_9694 ?auto_9699 ) ) ( not ( = ?auto_9695 ?auto_9696 ) ) ( not ( = ?auto_9695 ?auto_9697 ) ) ( not ( = ?auto_9695 ?auto_9698 ) ) ( not ( = ?auto_9695 ?auto_9699 ) ) ( not ( = ?auto_9696 ?auto_9697 ) ) ( not ( = ?auto_9696 ?auto_9698 ) ) ( not ( = ?auto_9696 ?auto_9699 ) ) ( not ( = ?auto_9697 ?auto_9698 ) ) ( not ( = ?auto_9697 ?auto_9699 ) ) ( not ( = ?auto_9698 ?auto_9699 ) ) ( CLEAR ?auto_9696 ) ( ON ?auto_9697 ?auto_9698 ) ( CLEAR ?auto_9697 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_9694 ?auto_9695 ?auto_9696 ?auto_9697 )
      ( MAKE-5PILE ?auto_9694 ?auto_9695 ?auto_9696 ?auto_9697 ?auto_9698 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_9705 - BLOCK
      ?auto_9706 - BLOCK
      ?auto_9707 - BLOCK
      ?auto_9708 - BLOCK
      ?auto_9709 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_9709 ) ( ON-TABLE ?auto_9705 ) ( ON ?auto_9706 ?auto_9705 ) ( ON ?auto_9707 ?auto_9706 ) ( not ( = ?auto_9705 ?auto_9706 ) ) ( not ( = ?auto_9705 ?auto_9707 ) ) ( not ( = ?auto_9705 ?auto_9708 ) ) ( not ( = ?auto_9705 ?auto_9709 ) ) ( not ( = ?auto_9706 ?auto_9707 ) ) ( not ( = ?auto_9706 ?auto_9708 ) ) ( not ( = ?auto_9706 ?auto_9709 ) ) ( not ( = ?auto_9707 ?auto_9708 ) ) ( not ( = ?auto_9707 ?auto_9709 ) ) ( not ( = ?auto_9708 ?auto_9709 ) ) ( CLEAR ?auto_9707 ) ( ON ?auto_9708 ?auto_9709 ) ( CLEAR ?auto_9708 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_9705 ?auto_9706 ?auto_9707 ?auto_9708 )
      ( MAKE-5PILE ?auto_9705 ?auto_9706 ?auto_9707 ?auto_9708 ?auto_9709 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_9715 - BLOCK
      ?auto_9716 - BLOCK
      ?auto_9717 - BLOCK
      ?auto_9718 - BLOCK
      ?auto_9719 - BLOCK
    )
    :vars
    (
      ?auto_9720 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9719 ?auto_9720 ) ( ON-TABLE ?auto_9715 ) ( ON ?auto_9716 ?auto_9715 ) ( not ( = ?auto_9715 ?auto_9716 ) ) ( not ( = ?auto_9715 ?auto_9717 ) ) ( not ( = ?auto_9715 ?auto_9718 ) ) ( not ( = ?auto_9715 ?auto_9719 ) ) ( not ( = ?auto_9715 ?auto_9720 ) ) ( not ( = ?auto_9716 ?auto_9717 ) ) ( not ( = ?auto_9716 ?auto_9718 ) ) ( not ( = ?auto_9716 ?auto_9719 ) ) ( not ( = ?auto_9716 ?auto_9720 ) ) ( not ( = ?auto_9717 ?auto_9718 ) ) ( not ( = ?auto_9717 ?auto_9719 ) ) ( not ( = ?auto_9717 ?auto_9720 ) ) ( not ( = ?auto_9718 ?auto_9719 ) ) ( not ( = ?auto_9718 ?auto_9720 ) ) ( not ( = ?auto_9719 ?auto_9720 ) ) ( ON ?auto_9718 ?auto_9719 ) ( CLEAR ?auto_9716 ) ( ON ?auto_9717 ?auto_9718 ) ( CLEAR ?auto_9717 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9715 ?auto_9716 ?auto_9717 )
      ( MAKE-5PILE ?auto_9715 ?auto_9716 ?auto_9717 ?auto_9718 ?auto_9719 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_9726 - BLOCK
      ?auto_9727 - BLOCK
      ?auto_9728 - BLOCK
      ?auto_9729 - BLOCK
      ?auto_9730 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_9730 ) ( ON-TABLE ?auto_9726 ) ( ON ?auto_9727 ?auto_9726 ) ( not ( = ?auto_9726 ?auto_9727 ) ) ( not ( = ?auto_9726 ?auto_9728 ) ) ( not ( = ?auto_9726 ?auto_9729 ) ) ( not ( = ?auto_9726 ?auto_9730 ) ) ( not ( = ?auto_9727 ?auto_9728 ) ) ( not ( = ?auto_9727 ?auto_9729 ) ) ( not ( = ?auto_9727 ?auto_9730 ) ) ( not ( = ?auto_9728 ?auto_9729 ) ) ( not ( = ?auto_9728 ?auto_9730 ) ) ( not ( = ?auto_9729 ?auto_9730 ) ) ( ON ?auto_9729 ?auto_9730 ) ( CLEAR ?auto_9727 ) ( ON ?auto_9728 ?auto_9729 ) ( CLEAR ?auto_9728 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9726 ?auto_9727 ?auto_9728 )
      ( MAKE-5PILE ?auto_9726 ?auto_9727 ?auto_9728 ?auto_9729 ?auto_9730 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_9736 - BLOCK
      ?auto_9737 - BLOCK
      ?auto_9738 - BLOCK
      ?auto_9739 - BLOCK
      ?auto_9740 - BLOCK
    )
    :vars
    (
      ?auto_9741 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9740 ?auto_9741 ) ( ON-TABLE ?auto_9736 ) ( not ( = ?auto_9736 ?auto_9737 ) ) ( not ( = ?auto_9736 ?auto_9738 ) ) ( not ( = ?auto_9736 ?auto_9739 ) ) ( not ( = ?auto_9736 ?auto_9740 ) ) ( not ( = ?auto_9736 ?auto_9741 ) ) ( not ( = ?auto_9737 ?auto_9738 ) ) ( not ( = ?auto_9737 ?auto_9739 ) ) ( not ( = ?auto_9737 ?auto_9740 ) ) ( not ( = ?auto_9737 ?auto_9741 ) ) ( not ( = ?auto_9738 ?auto_9739 ) ) ( not ( = ?auto_9738 ?auto_9740 ) ) ( not ( = ?auto_9738 ?auto_9741 ) ) ( not ( = ?auto_9739 ?auto_9740 ) ) ( not ( = ?auto_9739 ?auto_9741 ) ) ( not ( = ?auto_9740 ?auto_9741 ) ) ( ON ?auto_9739 ?auto_9740 ) ( ON ?auto_9738 ?auto_9739 ) ( CLEAR ?auto_9736 ) ( ON ?auto_9737 ?auto_9738 ) ( CLEAR ?auto_9737 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9736 ?auto_9737 )
      ( MAKE-5PILE ?auto_9736 ?auto_9737 ?auto_9738 ?auto_9739 ?auto_9740 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_9747 - BLOCK
      ?auto_9748 - BLOCK
      ?auto_9749 - BLOCK
      ?auto_9750 - BLOCK
      ?auto_9751 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_9751 ) ( ON-TABLE ?auto_9747 ) ( not ( = ?auto_9747 ?auto_9748 ) ) ( not ( = ?auto_9747 ?auto_9749 ) ) ( not ( = ?auto_9747 ?auto_9750 ) ) ( not ( = ?auto_9747 ?auto_9751 ) ) ( not ( = ?auto_9748 ?auto_9749 ) ) ( not ( = ?auto_9748 ?auto_9750 ) ) ( not ( = ?auto_9748 ?auto_9751 ) ) ( not ( = ?auto_9749 ?auto_9750 ) ) ( not ( = ?auto_9749 ?auto_9751 ) ) ( not ( = ?auto_9750 ?auto_9751 ) ) ( ON ?auto_9750 ?auto_9751 ) ( ON ?auto_9749 ?auto_9750 ) ( CLEAR ?auto_9747 ) ( ON ?auto_9748 ?auto_9749 ) ( CLEAR ?auto_9748 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9747 ?auto_9748 )
      ( MAKE-5PILE ?auto_9747 ?auto_9748 ?auto_9749 ?auto_9750 ?auto_9751 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_9757 - BLOCK
      ?auto_9758 - BLOCK
      ?auto_9759 - BLOCK
      ?auto_9760 - BLOCK
      ?auto_9761 - BLOCK
    )
    :vars
    (
      ?auto_9762 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9761 ?auto_9762 ) ( not ( = ?auto_9757 ?auto_9758 ) ) ( not ( = ?auto_9757 ?auto_9759 ) ) ( not ( = ?auto_9757 ?auto_9760 ) ) ( not ( = ?auto_9757 ?auto_9761 ) ) ( not ( = ?auto_9757 ?auto_9762 ) ) ( not ( = ?auto_9758 ?auto_9759 ) ) ( not ( = ?auto_9758 ?auto_9760 ) ) ( not ( = ?auto_9758 ?auto_9761 ) ) ( not ( = ?auto_9758 ?auto_9762 ) ) ( not ( = ?auto_9759 ?auto_9760 ) ) ( not ( = ?auto_9759 ?auto_9761 ) ) ( not ( = ?auto_9759 ?auto_9762 ) ) ( not ( = ?auto_9760 ?auto_9761 ) ) ( not ( = ?auto_9760 ?auto_9762 ) ) ( not ( = ?auto_9761 ?auto_9762 ) ) ( ON ?auto_9760 ?auto_9761 ) ( ON ?auto_9759 ?auto_9760 ) ( ON ?auto_9758 ?auto_9759 ) ( ON ?auto_9757 ?auto_9758 ) ( CLEAR ?auto_9757 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9757 )
      ( MAKE-5PILE ?auto_9757 ?auto_9758 ?auto_9759 ?auto_9760 ?auto_9761 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_9768 - BLOCK
      ?auto_9769 - BLOCK
      ?auto_9770 - BLOCK
      ?auto_9771 - BLOCK
      ?auto_9772 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_9772 ) ( not ( = ?auto_9768 ?auto_9769 ) ) ( not ( = ?auto_9768 ?auto_9770 ) ) ( not ( = ?auto_9768 ?auto_9771 ) ) ( not ( = ?auto_9768 ?auto_9772 ) ) ( not ( = ?auto_9769 ?auto_9770 ) ) ( not ( = ?auto_9769 ?auto_9771 ) ) ( not ( = ?auto_9769 ?auto_9772 ) ) ( not ( = ?auto_9770 ?auto_9771 ) ) ( not ( = ?auto_9770 ?auto_9772 ) ) ( not ( = ?auto_9771 ?auto_9772 ) ) ( ON ?auto_9771 ?auto_9772 ) ( ON ?auto_9770 ?auto_9771 ) ( ON ?auto_9769 ?auto_9770 ) ( ON ?auto_9768 ?auto_9769 ) ( CLEAR ?auto_9768 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9768 )
      ( MAKE-5PILE ?auto_9768 ?auto_9769 ?auto_9770 ?auto_9771 ?auto_9772 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_9778 - BLOCK
      ?auto_9779 - BLOCK
      ?auto_9780 - BLOCK
      ?auto_9781 - BLOCK
      ?auto_9782 - BLOCK
    )
    :vars
    (
      ?auto_9783 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9778 ?auto_9779 ) ) ( not ( = ?auto_9778 ?auto_9780 ) ) ( not ( = ?auto_9778 ?auto_9781 ) ) ( not ( = ?auto_9778 ?auto_9782 ) ) ( not ( = ?auto_9779 ?auto_9780 ) ) ( not ( = ?auto_9779 ?auto_9781 ) ) ( not ( = ?auto_9779 ?auto_9782 ) ) ( not ( = ?auto_9780 ?auto_9781 ) ) ( not ( = ?auto_9780 ?auto_9782 ) ) ( not ( = ?auto_9781 ?auto_9782 ) ) ( ON ?auto_9778 ?auto_9783 ) ( not ( = ?auto_9782 ?auto_9783 ) ) ( not ( = ?auto_9781 ?auto_9783 ) ) ( not ( = ?auto_9780 ?auto_9783 ) ) ( not ( = ?auto_9779 ?auto_9783 ) ) ( not ( = ?auto_9778 ?auto_9783 ) ) ( ON ?auto_9779 ?auto_9778 ) ( ON ?auto_9780 ?auto_9779 ) ( ON ?auto_9781 ?auto_9780 ) ( ON ?auto_9782 ?auto_9781 ) ( CLEAR ?auto_9782 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_9782 ?auto_9781 ?auto_9780 ?auto_9779 ?auto_9778 )
      ( MAKE-5PILE ?auto_9778 ?auto_9779 ?auto_9780 ?auto_9781 ?auto_9782 ) )
  )

)

