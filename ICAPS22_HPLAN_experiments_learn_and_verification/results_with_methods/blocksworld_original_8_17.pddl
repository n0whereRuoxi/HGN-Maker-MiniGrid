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

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_204653 - BLOCK
      ?auto_204654 - BLOCK
      ?auto_204655 - BLOCK
      ?auto_204656 - BLOCK
      ?auto_204657 - BLOCK
      ?auto_204658 - BLOCK
      ?auto_204659 - BLOCK
      ?auto_204660 - BLOCK
    )
    :vars
    (
      ?auto_204661 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_204661 ?auto_204660 ) ( CLEAR ?auto_204661 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_204653 ) ( ON ?auto_204654 ?auto_204653 ) ( ON ?auto_204655 ?auto_204654 ) ( ON ?auto_204656 ?auto_204655 ) ( ON ?auto_204657 ?auto_204656 ) ( ON ?auto_204658 ?auto_204657 ) ( ON ?auto_204659 ?auto_204658 ) ( ON ?auto_204660 ?auto_204659 ) ( not ( = ?auto_204653 ?auto_204654 ) ) ( not ( = ?auto_204653 ?auto_204655 ) ) ( not ( = ?auto_204653 ?auto_204656 ) ) ( not ( = ?auto_204653 ?auto_204657 ) ) ( not ( = ?auto_204653 ?auto_204658 ) ) ( not ( = ?auto_204653 ?auto_204659 ) ) ( not ( = ?auto_204653 ?auto_204660 ) ) ( not ( = ?auto_204653 ?auto_204661 ) ) ( not ( = ?auto_204654 ?auto_204655 ) ) ( not ( = ?auto_204654 ?auto_204656 ) ) ( not ( = ?auto_204654 ?auto_204657 ) ) ( not ( = ?auto_204654 ?auto_204658 ) ) ( not ( = ?auto_204654 ?auto_204659 ) ) ( not ( = ?auto_204654 ?auto_204660 ) ) ( not ( = ?auto_204654 ?auto_204661 ) ) ( not ( = ?auto_204655 ?auto_204656 ) ) ( not ( = ?auto_204655 ?auto_204657 ) ) ( not ( = ?auto_204655 ?auto_204658 ) ) ( not ( = ?auto_204655 ?auto_204659 ) ) ( not ( = ?auto_204655 ?auto_204660 ) ) ( not ( = ?auto_204655 ?auto_204661 ) ) ( not ( = ?auto_204656 ?auto_204657 ) ) ( not ( = ?auto_204656 ?auto_204658 ) ) ( not ( = ?auto_204656 ?auto_204659 ) ) ( not ( = ?auto_204656 ?auto_204660 ) ) ( not ( = ?auto_204656 ?auto_204661 ) ) ( not ( = ?auto_204657 ?auto_204658 ) ) ( not ( = ?auto_204657 ?auto_204659 ) ) ( not ( = ?auto_204657 ?auto_204660 ) ) ( not ( = ?auto_204657 ?auto_204661 ) ) ( not ( = ?auto_204658 ?auto_204659 ) ) ( not ( = ?auto_204658 ?auto_204660 ) ) ( not ( = ?auto_204658 ?auto_204661 ) ) ( not ( = ?auto_204659 ?auto_204660 ) ) ( not ( = ?auto_204659 ?auto_204661 ) ) ( not ( = ?auto_204660 ?auto_204661 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_204661 ?auto_204660 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_204663 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_204663 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_204663 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_204664 - BLOCK
    )
    :vars
    (
      ?auto_204665 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_204664 ?auto_204665 ) ( CLEAR ?auto_204664 ) ( HAND-EMPTY ) ( not ( = ?auto_204664 ?auto_204665 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_204664 ?auto_204665 )
      ( MAKE-1PILE ?auto_204664 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_204673 - BLOCK
      ?auto_204674 - BLOCK
      ?auto_204675 - BLOCK
      ?auto_204676 - BLOCK
      ?auto_204677 - BLOCK
      ?auto_204678 - BLOCK
      ?auto_204679 - BLOCK
    )
    :vars
    (
      ?auto_204680 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_204680 ?auto_204679 ) ( CLEAR ?auto_204680 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_204673 ) ( ON ?auto_204674 ?auto_204673 ) ( ON ?auto_204675 ?auto_204674 ) ( ON ?auto_204676 ?auto_204675 ) ( ON ?auto_204677 ?auto_204676 ) ( ON ?auto_204678 ?auto_204677 ) ( ON ?auto_204679 ?auto_204678 ) ( not ( = ?auto_204673 ?auto_204674 ) ) ( not ( = ?auto_204673 ?auto_204675 ) ) ( not ( = ?auto_204673 ?auto_204676 ) ) ( not ( = ?auto_204673 ?auto_204677 ) ) ( not ( = ?auto_204673 ?auto_204678 ) ) ( not ( = ?auto_204673 ?auto_204679 ) ) ( not ( = ?auto_204673 ?auto_204680 ) ) ( not ( = ?auto_204674 ?auto_204675 ) ) ( not ( = ?auto_204674 ?auto_204676 ) ) ( not ( = ?auto_204674 ?auto_204677 ) ) ( not ( = ?auto_204674 ?auto_204678 ) ) ( not ( = ?auto_204674 ?auto_204679 ) ) ( not ( = ?auto_204674 ?auto_204680 ) ) ( not ( = ?auto_204675 ?auto_204676 ) ) ( not ( = ?auto_204675 ?auto_204677 ) ) ( not ( = ?auto_204675 ?auto_204678 ) ) ( not ( = ?auto_204675 ?auto_204679 ) ) ( not ( = ?auto_204675 ?auto_204680 ) ) ( not ( = ?auto_204676 ?auto_204677 ) ) ( not ( = ?auto_204676 ?auto_204678 ) ) ( not ( = ?auto_204676 ?auto_204679 ) ) ( not ( = ?auto_204676 ?auto_204680 ) ) ( not ( = ?auto_204677 ?auto_204678 ) ) ( not ( = ?auto_204677 ?auto_204679 ) ) ( not ( = ?auto_204677 ?auto_204680 ) ) ( not ( = ?auto_204678 ?auto_204679 ) ) ( not ( = ?auto_204678 ?auto_204680 ) ) ( not ( = ?auto_204679 ?auto_204680 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_204680 ?auto_204679 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_204681 - BLOCK
      ?auto_204682 - BLOCK
      ?auto_204683 - BLOCK
      ?auto_204684 - BLOCK
      ?auto_204685 - BLOCK
      ?auto_204686 - BLOCK
      ?auto_204687 - BLOCK
    )
    :vars
    (
      ?auto_204688 - BLOCK
      ?auto_204689 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_204688 ?auto_204687 ) ( CLEAR ?auto_204688 ) ( ON-TABLE ?auto_204681 ) ( ON ?auto_204682 ?auto_204681 ) ( ON ?auto_204683 ?auto_204682 ) ( ON ?auto_204684 ?auto_204683 ) ( ON ?auto_204685 ?auto_204684 ) ( ON ?auto_204686 ?auto_204685 ) ( ON ?auto_204687 ?auto_204686 ) ( not ( = ?auto_204681 ?auto_204682 ) ) ( not ( = ?auto_204681 ?auto_204683 ) ) ( not ( = ?auto_204681 ?auto_204684 ) ) ( not ( = ?auto_204681 ?auto_204685 ) ) ( not ( = ?auto_204681 ?auto_204686 ) ) ( not ( = ?auto_204681 ?auto_204687 ) ) ( not ( = ?auto_204681 ?auto_204688 ) ) ( not ( = ?auto_204682 ?auto_204683 ) ) ( not ( = ?auto_204682 ?auto_204684 ) ) ( not ( = ?auto_204682 ?auto_204685 ) ) ( not ( = ?auto_204682 ?auto_204686 ) ) ( not ( = ?auto_204682 ?auto_204687 ) ) ( not ( = ?auto_204682 ?auto_204688 ) ) ( not ( = ?auto_204683 ?auto_204684 ) ) ( not ( = ?auto_204683 ?auto_204685 ) ) ( not ( = ?auto_204683 ?auto_204686 ) ) ( not ( = ?auto_204683 ?auto_204687 ) ) ( not ( = ?auto_204683 ?auto_204688 ) ) ( not ( = ?auto_204684 ?auto_204685 ) ) ( not ( = ?auto_204684 ?auto_204686 ) ) ( not ( = ?auto_204684 ?auto_204687 ) ) ( not ( = ?auto_204684 ?auto_204688 ) ) ( not ( = ?auto_204685 ?auto_204686 ) ) ( not ( = ?auto_204685 ?auto_204687 ) ) ( not ( = ?auto_204685 ?auto_204688 ) ) ( not ( = ?auto_204686 ?auto_204687 ) ) ( not ( = ?auto_204686 ?auto_204688 ) ) ( not ( = ?auto_204687 ?auto_204688 ) ) ( HOLDING ?auto_204689 ) ( not ( = ?auto_204681 ?auto_204689 ) ) ( not ( = ?auto_204682 ?auto_204689 ) ) ( not ( = ?auto_204683 ?auto_204689 ) ) ( not ( = ?auto_204684 ?auto_204689 ) ) ( not ( = ?auto_204685 ?auto_204689 ) ) ( not ( = ?auto_204686 ?auto_204689 ) ) ( not ( = ?auto_204687 ?auto_204689 ) ) ( not ( = ?auto_204688 ?auto_204689 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_204689 )
      ( MAKE-7PILE ?auto_204681 ?auto_204682 ?auto_204683 ?auto_204684 ?auto_204685 ?auto_204686 ?auto_204687 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_204690 - BLOCK
      ?auto_204691 - BLOCK
      ?auto_204692 - BLOCK
      ?auto_204693 - BLOCK
      ?auto_204694 - BLOCK
      ?auto_204695 - BLOCK
      ?auto_204696 - BLOCK
    )
    :vars
    (
      ?auto_204698 - BLOCK
      ?auto_204697 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_204698 ?auto_204696 ) ( ON-TABLE ?auto_204690 ) ( ON ?auto_204691 ?auto_204690 ) ( ON ?auto_204692 ?auto_204691 ) ( ON ?auto_204693 ?auto_204692 ) ( ON ?auto_204694 ?auto_204693 ) ( ON ?auto_204695 ?auto_204694 ) ( ON ?auto_204696 ?auto_204695 ) ( not ( = ?auto_204690 ?auto_204691 ) ) ( not ( = ?auto_204690 ?auto_204692 ) ) ( not ( = ?auto_204690 ?auto_204693 ) ) ( not ( = ?auto_204690 ?auto_204694 ) ) ( not ( = ?auto_204690 ?auto_204695 ) ) ( not ( = ?auto_204690 ?auto_204696 ) ) ( not ( = ?auto_204690 ?auto_204698 ) ) ( not ( = ?auto_204691 ?auto_204692 ) ) ( not ( = ?auto_204691 ?auto_204693 ) ) ( not ( = ?auto_204691 ?auto_204694 ) ) ( not ( = ?auto_204691 ?auto_204695 ) ) ( not ( = ?auto_204691 ?auto_204696 ) ) ( not ( = ?auto_204691 ?auto_204698 ) ) ( not ( = ?auto_204692 ?auto_204693 ) ) ( not ( = ?auto_204692 ?auto_204694 ) ) ( not ( = ?auto_204692 ?auto_204695 ) ) ( not ( = ?auto_204692 ?auto_204696 ) ) ( not ( = ?auto_204692 ?auto_204698 ) ) ( not ( = ?auto_204693 ?auto_204694 ) ) ( not ( = ?auto_204693 ?auto_204695 ) ) ( not ( = ?auto_204693 ?auto_204696 ) ) ( not ( = ?auto_204693 ?auto_204698 ) ) ( not ( = ?auto_204694 ?auto_204695 ) ) ( not ( = ?auto_204694 ?auto_204696 ) ) ( not ( = ?auto_204694 ?auto_204698 ) ) ( not ( = ?auto_204695 ?auto_204696 ) ) ( not ( = ?auto_204695 ?auto_204698 ) ) ( not ( = ?auto_204696 ?auto_204698 ) ) ( not ( = ?auto_204690 ?auto_204697 ) ) ( not ( = ?auto_204691 ?auto_204697 ) ) ( not ( = ?auto_204692 ?auto_204697 ) ) ( not ( = ?auto_204693 ?auto_204697 ) ) ( not ( = ?auto_204694 ?auto_204697 ) ) ( not ( = ?auto_204695 ?auto_204697 ) ) ( not ( = ?auto_204696 ?auto_204697 ) ) ( not ( = ?auto_204698 ?auto_204697 ) ) ( ON ?auto_204697 ?auto_204698 ) ( CLEAR ?auto_204697 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_204690 ?auto_204691 ?auto_204692 ?auto_204693 ?auto_204694 ?auto_204695 ?auto_204696 ?auto_204698 )
      ( MAKE-7PILE ?auto_204690 ?auto_204691 ?auto_204692 ?auto_204693 ?auto_204694 ?auto_204695 ?auto_204696 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_204701 - BLOCK
      ?auto_204702 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_204702 ) ( CLEAR ?auto_204701 ) ( ON-TABLE ?auto_204701 ) ( not ( = ?auto_204701 ?auto_204702 ) ) )
    :subtasks
    ( ( !STACK ?auto_204702 ?auto_204701 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_204703 - BLOCK
      ?auto_204704 - BLOCK
    )
    :vars
    (
      ?auto_204705 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_204703 ) ( ON-TABLE ?auto_204703 ) ( not ( = ?auto_204703 ?auto_204704 ) ) ( ON ?auto_204704 ?auto_204705 ) ( CLEAR ?auto_204704 ) ( HAND-EMPTY ) ( not ( = ?auto_204703 ?auto_204705 ) ) ( not ( = ?auto_204704 ?auto_204705 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_204704 ?auto_204705 )
      ( MAKE-2PILE ?auto_204703 ?auto_204704 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_204706 - BLOCK
      ?auto_204707 - BLOCK
    )
    :vars
    (
      ?auto_204708 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_204706 ?auto_204707 ) ) ( ON ?auto_204707 ?auto_204708 ) ( CLEAR ?auto_204707 ) ( not ( = ?auto_204706 ?auto_204708 ) ) ( not ( = ?auto_204707 ?auto_204708 ) ) ( HOLDING ?auto_204706 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_204706 )
      ( MAKE-2PILE ?auto_204706 ?auto_204707 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_204709 - BLOCK
      ?auto_204710 - BLOCK
    )
    :vars
    (
      ?auto_204711 - BLOCK
      ?auto_204715 - BLOCK
      ?auto_204713 - BLOCK
      ?auto_204717 - BLOCK
      ?auto_204714 - BLOCK
      ?auto_204712 - BLOCK
      ?auto_204716 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_204709 ?auto_204710 ) ) ( ON ?auto_204710 ?auto_204711 ) ( not ( = ?auto_204709 ?auto_204711 ) ) ( not ( = ?auto_204710 ?auto_204711 ) ) ( ON ?auto_204709 ?auto_204710 ) ( CLEAR ?auto_204709 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_204715 ) ( ON ?auto_204713 ?auto_204715 ) ( ON ?auto_204717 ?auto_204713 ) ( ON ?auto_204714 ?auto_204717 ) ( ON ?auto_204712 ?auto_204714 ) ( ON ?auto_204716 ?auto_204712 ) ( ON ?auto_204711 ?auto_204716 ) ( not ( = ?auto_204715 ?auto_204713 ) ) ( not ( = ?auto_204715 ?auto_204717 ) ) ( not ( = ?auto_204715 ?auto_204714 ) ) ( not ( = ?auto_204715 ?auto_204712 ) ) ( not ( = ?auto_204715 ?auto_204716 ) ) ( not ( = ?auto_204715 ?auto_204711 ) ) ( not ( = ?auto_204715 ?auto_204710 ) ) ( not ( = ?auto_204715 ?auto_204709 ) ) ( not ( = ?auto_204713 ?auto_204717 ) ) ( not ( = ?auto_204713 ?auto_204714 ) ) ( not ( = ?auto_204713 ?auto_204712 ) ) ( not ( = ?auto_204713 ?auto_204716 ) ) ( not ( = ?auto_204713 ?auto_204711 ) ) ( not ( = ?auto_204713 ?auto_204710 ) ) ( not ( = ?auto_204713 ?auto_204709 ) ) ( not ( = ?auto_204717 ?auto_204714 ) ) ( not ( = ?auto_204717 ?auto_204712 ) ) ( not ( = ?auto_204717 ?auto_204716 ) ) ( not ( = ?auto_204717 ?auto_204711 ) ) ( not ( = ?auto_204717 ?auto_204710 ) ) ( not ( = ?auto_204717 ?auto_204709 ) ) ( not ( = ?auto_204714 ?auto_204712 ) ) ( not ( = ?auto_204714 ?auto_204716 ) ) ( not ( = ?auto_204714 ?auto_204711 ) ) ( not ( = ?auto_204714 ?auto_204710 ) ) ( not ( = ?auto_204714 ?auto_204709 ) ) ( not ( = ?auto_204712 ?auto_204716 ) ) ( not ( = ?auto_204712 ?auto_204711 ) ) ( not ( = ?auto_204712 ?auto_204710 ) ) ( not ( = ?auto_204712 ?auto_204709 ) ) ( not ( = ?auto_204716 ?auto_204711 ) ) ( not ( = ?auto_204716 ?auto_204710 ) ) ( not ( = ?auto_204716 ?auto_204709 ) ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_204715 ?auto_204713 ?auto_204717 ?auto_204714 ?auto_204712 ?auto_204716 ?auto_204711 ?auto_204710 )
      ( MAKE-2PILE ?auto_204709 ?auto_204710 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_204724 - BLOCK
      ?auto_204725 - BLOCK
      ?auto_204726 - BLOCK
      ?auto_204727 - BLOCK
      ?auto_204728 - BLOCK
      ?auto_204729 - BLOCK
    )
    :vars
    (
      ?auto_204730 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_204730 ?auto_204729 ) ( CLEAR ?auto_204730 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_204724 ) ( ON ?auto_204725 ?auto_204724 ) ( ON ?auto_204726 ?auto_204725 ) ( ON ?auto_204727 ?auto_204726 ) ( ON ?auto_204728 ?auto_204727 ) ( ON ?auto_204729 ?auto_204728 ) ( not ( = ?auto_204724 ?auto_204725 ) ) ( not ( = ?auto_204724 ?auto_204726 ) ) ( not ( = ?auto_204724 ?auto_204727 ) ) ( not ( = ?auto_204724 ?auto_204728 ) ) ( not ( = ?auto_204724 ?auto_204729 ) ) ( not ( = ?auto_204724 ?auto_204730 ) ) ( not ( = ?auto_204725 ?auto_204726 ) ) ( not ( = ?auto_204725 ?auto_204727 ) ) ( not ( = ?auto_204725 ?auto_204728 ) ) ( not ( = ?auto_204725 ?auto_204729 ) ) ( not ( = ?auto_204725 ?auto_204730 ) ) ( not ( = ?auto_204726 ?auto_204727 ) ) ( not ( = ?auto_204726 ?auto_204728 ) ) ( not ( = ?auto_204726 ?auto_204729 ) ) ( not ( = ?auto_204726 ?auto_204730 ) ) ( not ( = ?auto_204727 ?auto_204728 ) ) ( not ( = ?auto_204727 ?auto_204729 ) ) ( not ( = ?auto_204727 ?auto_204730 ) ) ( not ( = ?auto_204728 ?auto_204729 ) ) ( not ( = ?auto_204728 ?auto_204730 ) ) ( not ( = ?auto_204729 ?auto_204730 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_204730 ?auto_204729 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_204731 - BLOCK
      ?auto_204732 - BLOCK
      ?auto_204733 - BLOCK
      ?auto_204734 - BLOCK
      ?auto_204735 - BLOCK
      ?auto_204736 - BLOCK
    )
    :vars
    (
      ?auto_204737 - BLOCK
      ?auto_204738 - BLOCK
      ?auto_204739 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_204737 ?auto_204736 ) ( CLEAR ?auto_204737 ) ( ON-TABLE ?auto_204731 ) ( ON ?auto_204732 ?auto_204731 ) ( ON ?auto_204733 ?auto_204732 ) ( ON ?auto_204734 ?auto_204733 ) ( ON ?auto_204735 ?auto_204734 ) ( ON ?auto_204736 ?auto_204735 ) ( not ( = ?auto_204731 ?auto_204732 ) ) ( not ( = ?auto_204731 ?auto_204733 ) ) ( not ( = ?auto_204731 ?auto_204734 ) ) ( not ( = ?auto_204731 ?auto_204735 ) ) ( not ( = ?auto_204731 ?auto_204736 ) ) ( not ( = ?auto_204731 ?auto_204737 ) ) ( not ( = ?auto_204732 ?auto_204733 ) ) ( not ( = ?auto_204732 ?auto_204734 ) ) ( not ( = ?auto_204732 ?auto_204735 ) ) ( not ( = ?auto_204732 ?auto_204736 ) ) ( not ( = ?auto_204732 ?auto_204737 ) ) ( not ( = ?auto_204733 ?auto_204734 ) ) ( not ( = ?auto_204733 ?auto_204735 ) ) ( not ( = ?auto_204733 ?auto_204736 ) ) ( not ( = ?auto_204733 ?auto_204737 ) ) ( not ( = ?auto_204734 ?auto_204735 ) ) ( not ( = ?auto_204734 ?auto_204736 ) ) ( not ( = ?auto_204734 ?auto_204737 ) ) ( not ( = ?auto_204735 ?auto_204736 ) ) ( not ( = ?auto_204735 ?auto_204737 ) ) ( not ( = ?auto_204736 ?auto_204737 ) ) ( HOLDING ?auto_204738 ) ( CLEAR ?auto_204739 ) ( not ( = ?auto_204731 ?auto_204738 ) ) ( not ( = ?auto_204731 ?auto_204739 ) ) ( not ( = ?auto_204732 ?auto_204738 ) ) ( not ( = ?auto_204732 ?auto_204739 ) ) ( not ( = ?auto_204733 ?auto_204738 ) ) ( not ( = ?auto_204733 ?auto_204739 ) ) ( not ( = ?auto_204734 ?auto_204738 ) ) ( not ( = ?auto_204734 ?auto_204739 ) ) ( not ( = ?auto_204735 ?auto_204738 ) ) ( not ( = ?auto_204735 ?auto_204739 ) ) ( not ( = ?auto_204736 ?auto_204738 ) ) ( not ( = ?auto_204736 ?auto_204739 ) ) ( not ( = ?auto_204737 ?auto_204738 ) ) ( not ( = ?auto_204737 ?auto_204739 ) ) ( not ( = ?auto_204738 ?auto_204739 ) ) )
    :subtasks
    ( ( !STACK ?auto_204738 ?auto_204739 )
      ( MAKE-6PILE ?auto_204731 ?auto_204732 ?auto_204733 ?auto_204734 ?auto_204735 ?auto_204736 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_204740 - BLOCK
      ?auto_204741 - BLOCK
      ?auto_204742 - BLOCK
      ?auto_204743 - BLOCK
      ?auto_204744 - BLOCK
      ?auto_204745 - BLOCK
    )
    :vars
    (
      ?auto_204747 - BLOCK
      ?auto_204746 - BLOCK
      ?auto_204748 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_204747 ?auto_204745 ) ( ON-TABLE ?auto_204740 ) ( ON ?auto_204741 ?auto_204740 ) ( ON ?auto_204742 ?auto_204741 ) ( ON ?auto_204743 ?auto_204742 ) ( ON ?auto_204744 ?auto_204743 ) ( ON ?auto_204745 ?auto_204744 ) ( not ( = ?auto_204740 ?auto_204741 ) ) ( not ( = ?auto_204740 ?auto_204742 ) ) ( not ( = ?auto_204740 ?auto_204743 ) ) ( not ( = ?auto_204740 ?auto_204744 ) ) ( not ( = ?auto_204740 ?auto_204745 ) ) ( not ( = ?auto_204740 ?auto_204747 ) ) ( not ( = ?auto_204741 ?auto_204742 ) ) ( not ( = ?auto_204741 ?auto_204743 ) ) ( not ( = ?auto_204741 ?auto_204744 ) ) ( not ( = ?auto_204741 ?auto_204745 ) ) ( not ( = ?auto_204741 ?auto_204747 ) ) ( not ( = ?auto_204742 ?auto_204743 ) ) ( not ( = ?auto_204742 ?auto_204744 ) ) ( not ( = ?auto_204742 ?auto_204745 ) ) ( not ( = ?auto_204742 ?auto_204747 ) ) ( not ( = ?auto_204743 ?auto_204744 ) ) ( not ( = ?auto_204743 ?auto_204745 ) ) ( not ( = ?auto_204743 ?auto_204747 ) ) ( not ( = ?auto_204744 ?auto_204745 ) ) ( not ( = ?auto_204744 ?auto_204747 ) ) ( not ( = ?auto_204745 ?auto_204747 ) ) ( CLEAR ?auto_204746 ) ( not ( = ?auto_204740 ?auto_204748 ) ) ( not ( = ?auto_204740 ?auto_204746 ) ) ( not ( = ?auto_204741 ?auto_204748 ) ) ( not ( = ?auto_204741 ?auto_204746 ) ) ( not ( = ?auto_204742 ?auto_204748 ) ) ( not ( = ?auto_204742 ?auto_204746 ) ) ( not ( = ?auto_204743 ?auto_204748 ) ) ( not ( = ?auto_204743 ?auto_204746 ) ) ( not ( = ?auto_204744 ?auto_204748 ) ) ( not ( = ?auto_204744 ?auto_204746 ) ) ( not ( = ?auto_204745 ?auto_204748 ) ) ( not ( = ?auto_204745 ?auto_204746 ) ) ( not ( = ?auto_204747 ?auto_204748 ) ) ( not ( = ?auto_204747 ?auto_204746 ) ) ( not ( = ?auto_204748 ?auto_204746 ) ) ( ON ?auto_204748 ?auto_204747 ) ( CLEAR ?auto_204748 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_204740 ?auto_204741 ?auto_204742 ?auto_204743 ?auto_204744 ?auto_204745 ?auto_204747 )
      ( MAKE-6PILE ?auto_204740 ?auto_204741 ?auto_204742 ?auto_204743 ?auto_204744 ?auto_204745 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_204749 - BLOCK
      ?auto_204750 - BLOCK
      ?auto_204751 - BLOCK
      ?auto_204752 - BLOCK
      ?auto_204753 - BLOCK
      ?auto_204754 - BLOCK
    )
    :vars
    (
      ?auto_204755 - BLOCK
      ?auto_204757 - BLOCK
      ?auto_204756 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_204755 ?auto_204754 ) ( ON-TABLE ?auto_204749 ) ( ON ?auto_204750 ?auto_204749 ) ( ON ?auto_204751 ?auto_204750 ) ( ON ?auto_204752 ?auto_204751 ) ( ON ?auto_204753 ?auto_204752 ) ( ON ?auto_204754 ?auto_204753 ) ( not ( = ?auto_204749 ?auto_204750 ) ) ( not ( = ?auto_204749 ?auto_204751 ) ) ( not ( = ?auto_204749 ?auto_204752 ) ) ( not ( = ?auto_204749 ?auto_204753 ) ) ( not ( = ?auto_204749 ?auto_204754 ) ) ( not ( = ?auto_204749 ?auto_204755 ) ) ( not ( = ?auto_204750 ?auto_204751 ) ) ( not ( = ?auto_204750 ?auto_204752 ) ) ( not ( = ?auto_204750 ?auto_204753 ) ) ( not ( = ?auto_204750 ?auto_204754 ) ) ( not ( = ?auto_204750 ?auto_204755 ) ) ( not ( = ?auto_204751 ?auto_204752 ) ) ( not ( = ?auto_204751 ?auto_204753 ) ) ( not ( = ?auto_204751 ?auto_204754 ) ) ( not ( = ?auto_204751 ?auto_204755 ) ) ( not ( = ?auto_204752 ?auto_204753 ) ) ( not ( = ?auto_204752 ?auto_204754 ) ) ( not ( = ?auto_204752 ?auto_204755 ) ) ( not ( = ?auto_204753 ?auto_204754 ) ) ( not ( = ?auto_204753 ?auto_204755 ) ) ( not ( = ?auto_204754 ?auto_204755 ) ) ( not ( = ?auto_204749 ?auto_204757 ) ) ( not ( = ?auto_204749 ?auto_204756 ) ) ( not ( = ?auto_204750 ?auto_204757 ) ) ( not ( = ?auto_204750 ?auto_204756 ) ) ( not ( = ?auto_204751 ?auto_204757 ) ) ( not ( = ?auto_204751 ?auto_204756 ) ) ( not ( = ?auto_204752 ?auto_204757 ) ) ( not ( = ?auto_204752 ?auto_204756 ) ) ( not ( = ?auto_204753 ?auto_204757 ) ) ( not ( = ?auto_204753 ?auto_204756 ) ) ( not ( = ?auto_204754 ?auto_204757 ) ) ( not ( = ?auto_204754 ?auto_204756 ) ) ( not ( = ?auto_204755 ?auto_204757 ) ) ( not ( = ?auto_204755 ?auto_204756 ) ) ( not ( = ?auto_204757 ?auto_204756 ) ) ( ON ?auto_204757 ?auto_204755 ) ( CLEAR ?auto_204757 ) ( HOLDING ?auto_204756 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_204756 )
      ( MAKE-6PILE ?auto_204749 ?auto_204750 ?auto_204751 ?auto_204752 ?auto_204753 ?auto_204754 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_204758 - BLOCK
      ?auto_204759 - BLOCK
      ?auto_204760 - BLOCK
      ?auto_204761 - BLOCK
      ?auto_204762 - BLOCK
      ?auto_204763 - BLOCK
    )
    :vars
    (
      ?auto_204766 - BLOCK
      ?auto_204765 - BLOCK
      ?auto_204764 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_204766 ?auto_204763 ) ( ON-TABLE ?auto_204758 ) ( ON ?auto_204759 ?auto_204758 ) ( ON ?auto_204760 ?auto_204759 ) ( ON ?auto_204761 ?auto_204760 ) ( ON ?auto_204762 ?auto_204761 ) ( ON ?auto_204763 ?auto_204762 ) ( not ( = ?auto_204758 ?auto_204759 ) ) ( not ( = ?auto_204758 ?auto_204760 ) ) ( not ( = ?auto_204758 ?auto_204761 ) ) ( not ( = ?auto_204758 ?auto_204762 ) ) ( not ( = ?auto_204758 ?auto_204763 ) ) ( not ( = ?auto_204758 ?auto_204766 ) ) ( not ( = ?auto_204759 ?auto_204760 ) ) ( not ( = ?auto_204759 ?auto_204761 ) ) ( not ( = ?auto_204759 ?auto_204762 ) ) ( not ( = ?auto_204759 ?auto_204763 ) ) ( not ( = ?auto_204759 ?auto_204766 ) ) ( not ( = ?auto_204760 ?auto_204761 ) ) ( not ( = ?auto_204760 ?auto_204762 ) ) ( not ( = ?auto_204760 ?auto_204763 ) ) ( not ( = ?auto_204760 ?auto_204766 ) ) ( not ( = ?auto_204761 ?auto_204762 ) ) ( not ( = ?auto_204761 ?auto_204763 ) ) ( not ( = ?auto_204761 ?auto_204766 ) ) ( not ( = ?auto_204762 ?auto_204763 ) ) ( not ( = ?auto_204762 ?auto_204766 ) ) ( not ( = ?auto_204763 ?auto_204766 ) ) ( not ( = ?auto_204758 ?auto_204765 ) ) ( not ( = ?auto_204758 ?auto_204764 ) ) ( not ( = ?auto_204759 ?auto_204765 ) ) ( not ( = ?auto_204759 ?auto_204764 ) ) ( not ( = ?auto_204760 ?auto_204765 ) ) ( not ( = ?auto_204760 ?auto_204764 ) ) ( not ( = ?auto_204761 ?auto_204765 ) ) ( not ( = ?auto_204761 ?auto_204764 ) ) ( not ( = ?auto_204762 ?auto_204765 ) ) ( not ( = ?auto_204762 ?auto_204764 ) ) ( not ( = ?auto_204763 ?auto_204765 ) ) ( not ( = ?auto_204763 ?auto_204764 ) ) ( not ( = ?auto_204766 ?auto_204765 ) ) ( not ( = ?auto_204766 ?auto_204764 ) ) ( not ( = ?auto_204765 ?auto_204764 ) ) ( ON ?auto_204765 ?auto_204766 ) ( ON ?auto_204764 ?auto_204765 ) ( CLEAR ?auto_204764 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_204758 ?auto_204759 ?auto_204760 ?auto_204761 ?auto_204762 ?auto_204763 ?auto_204766 ?auto_204765 )
      ( MAKE-6PILE ?auto_204758 ?auto_204759 ?auto_204760 ?auto_204761 ?auto_204762 ?auto_204763 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_204770 - BLOCK
      ?auto_204771 - BLOCK
      ?auto_204772 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_204772 ) ( CLEAR ?auto_204771 ) ( ON-TABLE ?auto_204770 ) ( ON ?auto_204771 ?auto_204770 ) ( not ( = ?auto_204770 ?auto_204771 ) ) ( not ( = ?auto_204770 ?auto_204772 ) ) ( not ( = ?auto_204771 ?auto_204772 ) ) )
    :subtasks
    ( ( !STACK ?auto_204772 ?auto_204771 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_204773 - BLOCK
      ?auto_204774 - BLOCK
      ?auto_204775 - BLOCK
    )
    :vars
    (
      ?auto_204776 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_204774 ) ( ON-TABLE ?auto_204773 ) ( ON ?auto_204774 ?auto_204773 ) ( not ( = ?auto_204773 ?auto_204774 ) ) ( not ( = ?auto_204773 ?auto_204775 ) ) ( not ( = ?auto_204774 ?auto_204775 ) ) ( ON ?auto_204775 ?auto_204776 ) ( CLEAR ?auto_204775 ) ( HAND-EMPTY ) ( not ( = ?auto_204773 ?auto_204776 ) ) ( not ( = ?auto_204774 ?auto_204776 ) ) ( not ( = ?auto_204775 ?auto_204776 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_204775 ?auto_204776 )
      ( MAKE-3PILE ?auto_204773 ?auto_204774 ?auto_204775 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_204777 - BLOCK
      ?auto_204778 - BLOCK
      ?auto_204779 - BLOCK
    )
    :vars
    (
      ?auto_204780 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_204777 ) ( not ( = ?auto_204777 ?auto_204778 ) ) ( not ( = ?auto_204777 ?auto_204779 ) ) ( not ( = ?auto_204778 ?auto_204779 ) ) ( ON ?auto_204779 ?auto_204780 ) ( CLEAR ?auto_204779 ) ( not ( = ?auto_204777 ?auto_204780 ) ) ( not ( = ?auto_204778 ?auto_204780 ) ) ( not ( = ?auto_204779 ?auto_204780 ) ) ( HOLDING ?auto_204778 ) ( CLEAR ?auto_204777 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_204777 ?auto_204778 )
      ( MAKE-3PILE ?auto_204777 ?auto_204778 ?auto_204779 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_204781 - BLOCK
      ?auto_204782 - BLOCK
      ?auto_204783 - BLOCK
    )
    :vars
    (
      ?auto_204784 - BLOCK
      ?auto_204786 - BLOCK
      ?auto_204788 - BLOCK
      ?auto_204785 - BLOCK
      ?auto_204789 - BLOCK
      ?auto_204787 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_204781 ) ( not ( = ?auto_204781 ?auto_204782 ) ) ( not ( = ?auto_204781 ?auto_204783 ) ) ( not ( = ?auto_204782 ?auto_204783 ) ) ( ON ?auto_204783 ?auto_204784 ) ( not ( = ?auto_204781 ?auto_204784 ) ) ( not ( = ?auto_204782 ?auto_204784 ) ) ( not ( = ?auto_204783 ?auto_204784 ) ) ( CLEAR ?auto_204781 ) ( ON ?auto_204782 ?auto_204783 ) ( CLEAR ?auto_204782 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_204786 ) ( ON ?auto_204788 ?auto_204786 ) ( ON ?auto_204785 ?auto_204788 ) ( ON ?auto_204789 ?auto_204785 ) ( ON ?auto_204787 ?auto_204789 ) ( ON ?auto_204784 ?auto_204787 ) ( not ( = ?auto_204786 ?auto_204788 ) ) ( not ( = ?auto_204786 ?auto_204785 ) ) ( not ( = ?auto_204786 ?auto_204789 ) ) ( not ( = ?auto_204786 ?auto_204787 ) ) ( not ( = ?auto_204786 ?auto_204784 ) ) ( not ( = ?auto_204786 ?auto_204783 ) ) ( not ( = ?auto_204786 ?auto_204782 ) ) ( not ( = ?auto_204788 ?auto_204785 ) ) ( not ( = ?auto_204788 ?auto_204789 ) ) ( not ( = ?auto_204788 ?auto_204787 ) ) ( not ( = ?auto_204788 ?auto_204784 ) ) ( not ( = ?auto_204788 ?auto_204783 ) ) ( not ( = ?auto_204788 ?auto_204782 ) ) ( not ( = ?auto_204785 ?auto_204789 ) ) ( not ( = ?auto_204785 ?auto_204787 ) ) ( not ( = ?auto_204785 ?auto_204784 ) ) ( not ( = ?auto_204785 ?auto_204783 ) ) ( not ( = ?auto_204785 ?auto_204782 ) ) ( not ( = ?auto_204789 ?auto_204787 ) ) ( not ( = ?auto_204789 ?auto_204784 ) ) ( not ( = ?auto_204789 ?auto_204783 ) ) ( not ( = ?auto_204789 ?auto_204782 ) ) ( not ( = ?auto_204787 ?auto_204784 ) ) ( not ( = ?auto_204787 ?auto_204783 ) ) ( not ( = ?auto_204787 ?auto_204782 ) ) ( not ( = ?auto_204781 ?auto_204786 ) ) ( not ( = ?auto_204781 ?auto_204788 ) ) ( not ( = ?auto_204781 ?auto_204785 ) ) ( not ( = ?auto_204781 ?auto_204789 ) ) ( not ( = ?auto_204781 ?auto_204787 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_204786 ?auto_204788 ?auto_204785 ?auto_204789 ?auto_204787 ?auto_204784 ?auto_204783 )
      ( MAKE-3PILE ?auto_204781 ?auto_204782 ?auto_204783 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_204790 - BLOCK
      ?auto_204791 - BLOCK
      ?auto_204792 - BLOCK
    )
    :vars
    (
      ?auto_204797 - BLOCK
      ?auto_204793 - BLOCK
      ?auto_204795 - BLOCK
      ?auto_204798 - BLOCK
      ?auto_204796 - BLOCK
      ?auto_204794 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_204790 ?auto_204791 ) ) ( not ( = ?auto_204790 ?auto_204792 ) ) ( not ( = ?auto_204791 ?auto_204792 ) ) ( ON ?auto_204792 ?auto_204797 ) ( not ( = ?auto_204790 ?auto_204797 ) ) ( not ( = ?auto_204791 ?auto_204797 ) ) ( not ( = ?auto_204792 ?auto_204797 ) ) ( ON ?auto_204791 ?auto_204792 ) ( CLEAR ?auto_204791 ) ( ON-TABLE ?auto_204793 ) ( ON ?auto_204795 ?auto_204793 ) ( ON ?auto_204798 ?auto_204795 ) ( ON ?auto_204796 ?auto_204798 ) ( ON ?auto_204794 ?auto_204796 ) ( ON ?auto_204797 ?auto_204794 ) ( not ( = ?auto_204793 ?auto_204795 ) ) ( not ( = ?auto_204793 ?auto_204798 ) ) ( not ( = ?auto_204793 ?auto_204796 ) ) ( not ( = ?auto_204793 ?auto_204794 ) ) ( not ( = ?auto_204793 ?auto_204797 ) ) ( not ( = ?auto_204793 ?auto_204792 ) ) ( not ( = ?auto_204793 ?auto_204791 ) ) ( not ( = ?auto_204795 ?auto_204798 ) ) ( not ( = ?auto_204795 ?auto_204796 ) ) ( not ( = ?auto_204795 ?auto_204794 ) ) ( not ( = ?auto_204795 ?auto_204797 ) ) ( not ( = ?auto_204795 ?auto_204792 ) ) ( not ( = ?auto_204795 ?auto_204791 ) ) ( not ( = ?auto_204798 ?auto_204796 ) ) ( not ( = ?auto_204798 ?auto_204794 ) ) ( not ( = ?auto_204798 ?auto_204797 ) ) ( not ( = ?auto_204798 ?auto_204792 ) ) ( not ( = ?auto_204798 ?auto_204791 ) ) ( not ( = ?auto_204796 ?auto_204794 ) ) ( not ( = ?auto_204796 ?auto_204797 ) ) ( not ( = ?auto_204796 ?auto_204792 ) ) ( not ( = ?auto_204796 ?auto_204791 ) ) ( not ( = ?auto_204794 ?auto_204797 ) ) ( not ( = ?auto_204794 ?auto_204792 ) ) ( not ( = ?auto_204794 ?auto_204791 ) ) ( not ( = ?auto_204790 ?auto_204793 ) ) ( not ( = ?auto_204790 ?auto_204795 ) ) ( not ( = ?auto_204790 ?auto_204798 ) ) ( not ( = ?auto_204790 ?auto_204796 ) ) ( not ( = ?auto_204790 ?auto_204794 ) ) ( HOLDING ?auto_204790 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_204790 )
      ( MAKE-3PILE ?auto_204790 ?auto_204791 ?auto_204792 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_204799 - BLOCK
      ?auto_204800 - BLOCK
      ?auto_204801 - BLOCK
    )
    :vars
    (
      ?auto_204805 - BLOCK
      ?auto_204802 - BLOCK
      ?auto_204806 - BLOCK
      ?auto_204803 - BLOCK
      ?auto_204807 - BLOCK
      ?auto_204804 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_204799 ?auto_204800 ) ) ( not ( = ?auto_204799 ?auto_204801 ) ) ( not ( = ?auto_204800 ?auto_204801 ) ) ( ON ?auto_204801 ?auto_204805 ) ( not ( = ?auto_204799 ?auto_204805 ) ) ( not ( = ?auto_204800 ?auto_204805 ) ) ( not ( = ?auto_204801 ?auto_204805 ) ) ( ON ?auto_204800 ?auto_204801 ) ( ON-TABLE ?auto_204802 ) ( ON ?auto_204806 ?auto_204802 ) ( ON ?auto_204803 ?auto_204806 ) ( ON ?auto_204807 ?auto_204803 ) ( ON ?auto_204804 ?auto_204807 ) ( ON ?auto_204805 ?auto_204804 ) ( not ( = ?auto_204802 ?auto_204806 ) ) ( not ( = ?auto_204802 ?auto_204803 ) ) ( not ( = ?auto_204802 ?auto_204807 ) ) ( not ( = ?auto_204802 ?auto_204804 ) ) ( not ( = ?auto_204802 ?auto_204805 ) ) ( not ( = ?auto_204802 ?auto_204801 ) ) ( not ( = ?auto_204802 ?auto_204800 ) ) ( not ( = ?auto_204806 ?auto_204803 ) ) ( not ( = ?auto_204806 ?auto_204807 ) ) ( not ( = ?auto_204806 ?auto_204804 ) ) ( not ( = ?auto_204806 ?auto_204805 ) ) ( not ( = ?auto_204806 ?auto_204801 ) ) ( not ( = ?auto_204806 ?auto_204800 ) ) ( not ( = ?auto_204803 ?auto_204807 ) ) ( not ( = ?auto_204803 ?auto_204804 ) ) ( not ( = ?auto_204803 ?auto_204805 ) ) ( not ( = ?auto_204803 ?auto_204801 ) ) ( not ( = ?auto_204803 ?auto_204800 ) ) ( not ( = ?auto_204807 ?auto_204804 ) ) ( not ( = ?auto_204807 ?auto_204805 ) ) ( not ( = ?auto_204807 ?auto_204801 ) ) ( not ( = ?auto_204807 ?auto_204800 ) ) ( not ( = ?auto_204804 ?auto_204805 ) ) ( not ( = ?auto_204804 ?auto_204801 ) ) ( not ( = ?auto_204804 ?auto_204800 ) ) ( not ( = ?auto_204799 ?auto_204802 ) ) ( not ( = ?auto_204799 ?auto_204806 ) ) ( not ( = ?auto_204799 ?auto_204803 ) ) ( not ( = ?auto_204799 ?auto_204807 ) ) ( not ( = ?auto_204799 ?auto_204804 ) ) ( ON ?auto_204799 ?auto_204800 ) ( CLEAR ?auto_204799 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_204802 ?auto_204806 ?auto_204803 ?auto_204807 ?auto_204804 ?auto_204805 ?auto_204801 ?auto_204800 )
      ( MAKE-3PILE ?auto_204799 ?auto_204800 ?auto_204801 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_204813 - BLOCK
      ?auto_204814 - BLOCK
      ?auto_204815 - BLOCK
      ?auto_204816 - BLOCK
      ?auto_204817 - BLOCK
    )
    :vars
    (
      ?auto_204818 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_204818 ?auto_204817 ) ( CLEAR ?auto_204818 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_204813 ) ( ON ?auto_204814 ?auto_204813 ) ( ON ?auto_204815 ?auto_204814 ) ( ON ?auto_204816 ?auto_204815 ) ( ON ?auto_204817 ?auto_204816 ) ( not ( = ?auto_204813 ?auto_204814 ) ) ( not ( = ?auto_204813 ?auto_204815 ) ) ( not ( = ?auto_204813 ?auto_204816 ) ) ( not ( = ?auto_204813 ?auto_204817 ) ) ( not ( = ?auto_204813 ?auto_204818 ) ) ( not ( = ?auto_204814 ?auto_204815 ) ) ( not ( = ?auto_204814 ?auto_204816 ) ) ( not ( = ?auto_204814 ?auto_204817 ) ) ( not ( = ?auto_204814 ?auto_204818 ) ) ( not ( = ?auto_204815 ?auto_204816 ) ) ( not ( = ?auto_204815 ?auto_204817 ) ) ( not ( = ?auto_204815 ?auto_204818 ) ) ( not ( = ?auto_204816 ?auto_204817 ) ) ( not ( = ?auto_204816 ?auto_204818 ) ) ( not ( = ?auto_204817 ?auto_204818 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_204818 ?auto_204817 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_204819 - BLOCK
      ?auto_204820 - BLOCK
      ?auto_204821 - BLOCK
      ?auto_204822 - BLOCK
      ?auto_204823 - BLOCK
    )
    :vars
    (
      ?auto_204824 - BLOCK
      ?auto_204825 - BLOCK
      ?auto_204826 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_204824 ?auto_204823 ) ( CLEAR ?auto_204824 ) ( ON-TABLE ?auto_204819 ) ( ON ?auto_204820 ?auto_204819 ) ( ON ?auto_204821 ?auto_204820 ) ( ON ?auto_204822 ?auto_204821 ) ( ON ?auto_204823 ?auto_204822 ) ( not ( = ?auto_204819 ?auto_204820 ) ) ( not ( = ?auto_204819 ?auto_204821 ) ) ( not ( = ?auto_204819 ?auto_204822 ) ) ( not ( = ?auto_204819 ?auto_204823 ) ) ( not ( = ?auto_204819 ?auto_204824 ) ) ( not ( = ?auto_204820 ?auto_204821 ) ) ( not ( = ?auto_204820 ?auto_204822 ) ) ( not ( = ?auto_204820 ?auto_204823 ) ) ( not ( = ?auto_204820 ?auto_204824 ) ) ( not ( = ?auto_204821 ?auto_204822 ) ) ( not ( = ?auto_204821 ?auto_204823 ) ) ( not ( = ?auto_204821 ?auto_204824 ) ) ( not ( = ?auto_204822 ?auto_204823 ) ) ( not ( = ?auto_204822 ?auto_204824 ) ) ( not ( = ?auto_204823 ?auto_204824 ) ) ( HOLDING ?auto_204825 ) ( CLEAR ?auto_204826 ) ( not ( = ?auto_204819 ?auto_204825 ) ) ( not ( = ?auto_204819 ?auto_204826 ) ) ( not ( = ?auto_204820 ?auto_204825 ) ) ( not ( = ?auto_204820 ?auto_204826 ) ) ( not ( = ?auto_204821 ?auto_204825 ) ) ( not ( = ?auto_204821 ?auto_204826 ) ) ( not ( = ?auto_204822 ?auto_204825 ) ) ( not ( = ?auto_204822 ?auto_204826 ) ) ( not ( = ?auto_204823 ?auto_204825 ) ) ( not ( = ?auto_204823 ?auto_204826 ) ) ( not ( = ?auto_204824 ?auto_204825 ) ) ( not ( = ?auto_204824 ?auto_204826 ) ) ( not ( = ?auto_204825 ?auto_204826 ) ) )
    :subtasks
    ( ( !STACK ?auto_204825 ?auto_204826 )
      ( MAKE-5PILE ?auto_204819 ?auto_204820 ?auto_204821 ?auto_204822 ?auto_204823 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_204827 - BLOCK
      ?auto_204828 - BLOCK
      ?auto_204829 - BLOCK
      ?auto_204830 - BLOCK
      ?auto_204831 - BLOCK
    )
    :vars
    (
      ?auto_204833 - BLOCK
      ?auto_204834 - BLOCK
      ?auto_204832 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_204833 ?auto_204831 ) ( ON-TABLE ?auto_204827 ) ( ON ?auto_204828 ?auto_204827 ) ( ON ?auto_204829 ?auto_204828 ) ( ON ?auto_204830 ?auto_204829 ) ( ON ?auto_204831 ?auto_204830 ) ( not ( = ?auto_204827 ?auto_204828 ) ) ( not ( = ?auto_204827 ?auto_204829 ) ) ( not ( = ?auto_204827 ?auto_204830 ) ) ( not ( = ?auto_204827 ?auto_204831 ) ) ( not ( = ?auto_204827 ?auto_204833 ) ) ( not ( = ?auto_204828 ?auto_204829 ) ) ( not ( = ?auto_204828 ?auto_204830 ) ) ( not ( = ?auto_204828 ?auto_204831 ) ) ( not ( = ?auto_204828 ?auto_204833 ) ) ( not ( = ?auto_204829 ?auto_204830 ) ) ( not ( = ?auto_204829 ?auto_204831 ) ) ( not ( = ?auto_204829 ?auto_204833 ) ) ( not ( = ?auto_204830 ?auto_204831 ) ) ( not ( = ?auto_204830 ?auto_204833 ) ) ( not ( = ?auto_204831 ?auto_204833 ) ) ( CLEAR ?auto_204834 ) ( not ( = ?auto_204827 ?auto_204832 ) ) ( not ( = ?auto_204827 ?auto_204834 ) ) ( not ( = ?auto_204828 ?auto_204832 ) ) ( not ( = ?auto_204828 ?auto_204834 ) ) ( not ( = ?auto_204829 ?auto_204832 ) ) ( not ( = ?auto_204829 ?auto_204834 ) ) ( not ( = ?auto_204830 ?auto_204832 ) ) ( not ( = ?auto_204830 ?auto_204834 ) ) ( not ( = ?auto_204831 ?auto_204832 ) ) ( not ( = ?auto_204831 ?auto_204834 ) ) ( not ( = ?auto_204833 ?auto_204832 ) ) ( not ( = ?auto_204833 ?auto_204834 ) ) ( not ( = ?auto_204832 ?auto_204834 ) ) ( ON ?auto_204832 ?auto_204833 ) ( CLEAR ?auto_204832 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_204827 ?auto_204828 ?auto_204829 ?auto_204830 ?auto_204831 ?auto_204833 )
      ( MAKE-5PILE ?auto_204827 ?auto_204828 ?auto_204829 ?auto_204830 ?auto_204831 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_204835 - BLOCK
      ?auto_204836 - BLOCK
      ?auto_204837 - BLOCK
      ?auto_204838 - BLOCK
      ?auto_204839 - BLOCK
    )
    :vars
    (
      ?auto_204840 - BLOCK
      ?auto_204842 - BLOCK
      ?auto_204841 - BLOCK
      ?auto_204843 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_204840 ?auto_204839 ) ( ON-TABLE ?auto_204835 ) ( ON ?auto_204836 ?auto_204835 ) ( ON ?auto_204837 ?auto_204836 ) ( ON ?auto_204838 ?auto_204837 ) ( ON ?auto_204839 ?auto_204838 ) ( not ( = ?auto_204835 ?auto_204836 ) ) ( not ( = ?auto_204835 ?auto_204837 ) ) ( not ( = ?auto_204835 ?auto_204838 ) ) ( not ( = ?auto_204835 ?auto_204839 ) ) ( not ( = ?auto_204835 ?auto_204840 ) ) ( not ( = ?auto_204836 ?auto_204837 ) ) ( not ( = ?auto_204836 ?auto_204838 ) ) ( not ( = ?auto_204836 ?auto_204839 ) ) ( not ( = ?auto_204836 ?auto_204840 ) ) ( not ( = ?auto_204837 ?auto_204838 ) ) ( not ( = ?auto_204837 ?auto_204839 ) ) ( not ( = ?auto_204837 ?auto_204840 ) ) ( not ( = ?auto_204838 ?auto_204839 ) ) ( not ( = ?auto_204838 ?auto_204840 ) ) ( not ( = ?auto_204839 ?auto_204840 ) ) ( not ( = ?auto_204835 ?auto_204842 ) ) ( not ( = ?auto_204835 ?auto_204841 ) ) ( not ( = ?auto_204836 ?auto_204842 ) ) ( not ( = ?auto_204836 ?auto_204841 ) ) ( not ( = ?auto_204837 ?auto_204842 ) ) ( not ( = ?auto_204837 ?auto_204841 ) ) ( not ( = ?auto_204838 ?auto_204842 ) ) ( not ( = ?auto_204838 ?auto_204841 ) ) ( not ( = ?auto_204839 ?auto_204842 ) ) ( not ( = ?auto_204839 ?auto_204841 ) ) ( not ( = ?auto_204840 ?auto_204842 ) ) ( not ( = ?auto_204840 ?auto_204841 ) ) ( not ( = ?auto_204842 ?auto_204841 ) ) ( ON ?auto_204842 ?auto_204840 ) ( CLEAR ?auto_204842 ) ( HOLDING ?auto_204841 ) ( CLEAR ?auto_204843 ) ( ON-TABLE ?auto_204843 ) ( not ( = ?auto_204843 ?auto_204841 ) ) ( not ( = ?auto_204835 ?auto_204843 ) ) ( not ( = ?auto_204836 ?auto_204843 ) ) ( not ( = ?auto_204837 ?auto_204843 ) ) ( not ( = ?auto_204838 ?auto_204843 ) ) ( not ( = ?auto_204839 ?auto_204843 ) ) ( not ( = ?auto_204840 ?auto_204843 ) ) ( not ( = ?auto_204842 ?auto_204843 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_204843 ?auto_204841 )
      ( MAKE-5PILE ?auto_204835 ?auto_204836 ?auto_204837 ?auto_204838 ?auto_204839 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_204844 - BLOCK
      ?auto_204845 - BLOCK
      ?auto_204846 - BLOCK
      ?auto_204847 - BLOCK
      ?auto_204848 - BLOCK
    )
    :vars
    (
      ?auto_204850 - BLOCK
      ?auto_204851 - BLOCK
      ?auto_204849 - BLOCK
      ?auto_204852 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_204850 ?auto_204848 ) ( ON-TABLE ?auto_204844 ) ( ON ?auto_204845 ?auto_204844 ) ( ON ?auto_204846 ?auto_204845 ) ( ON ?auto_204847 ?auto_204846 ) ( ON ?auto_204848 ?auto_204847 ) ( not ( = ?auto_204844 ?auto_204845 ) ) ( not ( = ?auto_204844 ?auto_204846 ) ) ( not ( = ?auto_204844 ?auto_204847 ) ) ( not ( = ?auto_204844 ?auto_204848 ) ) ( not ( = ?auto_204844 ?auto_204850 ) ) ( not ( = ?auto_204845 ?auto_204846 ) ) ( not ( = ?auto_204845 ?auto_204847 ) ) ( not ( = ?auto_204845 ?auto_204848 ) ) ( not ( = ?auto_204845 ?auto_204850 ) ) ( not ( = ?auto_204846 ?auto_204847 ) ) ( not ( = ?auto_204846 ?auto_204848 ) ) ( not ( = ?auto_204846 ?auto_204850 ) ) ( not ( = ?auto_204847 ?auto_204848 ) ) ( not ( = ?auto_204847 ?auto_204850 ) ) ( not ( = ?auto_204848 ?auto_204850 ) ) ( not ( = ?auto_204844 ?auto_204851 ) ) ( not ( = ?auto_204844 ?auto_204849 ) ) ( not ( = ?auto_204845 ?auto_204851 ) ) ( not ( = ?auto_204845 ?auto_204849 ) ) ( not ( = ?auto_204846 ?auto_204851 ) ) ( not ( = ?auto_204846 ?auto_204849 ) ) ( not ( = ?auto_204847 ?auto_204851 ) ) ( not ( = ?auto_204847 ?auto_204849 ) ) ( not ( = ?auto_204848 ?auto_204851 ) ) ( not ( = ?auto_204848 ?auto_204849 ) ) ( not ( = ?auto_204850 ?auto_204851 ) ) ( not ( = ?auto_204850 ?auto_204849 ) ) ( not ( = ?auto_204851 ?auto_204849 ) ) ( ON ?auto_204851 ?auto_204850 ) ( CLEAR ?auto_204852 ) ( ON-TABLE ?auto_204852 ) ( not ( = ?auto_204852 ?auto_204849 ) ) ( not ( = ?auto_204844 ?auto_204852 ) ) ( not ( = ?auto_204845 ?auto_204852 ) ) ( not ( = ?auto_204846 ?auto_204852 ) ) ( not ( = ?auto_204847 ?auto_204852 ) ) ( not ( = ?auto_204848 ?auto_204852 ) ) ( not ( = ?auto_204850 ?auto_204852 ) ) ( not ( = ?auto_204851 ?auto_204852 ) ) ( ON ?auto_204849 ?auto_204851 ) ( CLEAR ?auto_204849 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_204844 ?auto_204845 ?auto_204846 ?auto_204847 ?auto_204848 ?auto_204850 ?auto_204851 )
      ( MAKE-5PILE ?auto_204844 ?auto_204845 ?auto_204846 ?auto_204847 ?auto_204848 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_204853 - BLOCK
      ?auto_204854 - BLOCK
      ?auto_204855 - BLOCK
      ?auto_204856 - BLOCK
      ?auto_204857 - BLOCK
    )
    :vars
    (
      ?auto_204858 - BLOCK
      ?auto_204859 - BLOCK
      ?auto_204860 - BLOCK
      ?auto_204861 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_204858 ?auto_204857 ) ( ON-TABLE ?auto_204853 ) ( ON ?auto_204854 ?auto_204853 ) ( ON ?auto_204855 ?auto_204854 ) ( ON ?auto_204856 ?auto_204855 ) ( ON ?auto_204857 ?auto_204856 ) ( not ( = ?auto_204853 ?auto_204854 ) ) ( not ( = ?auto_204853 ?auto_204855 ) ) ( not ( = ?auto_204853 ?auto_204856 ) ) ( not ( = ?auto_204853 ?auto_204857 ) ) ( not ( = ?auto_204853 ?auto_204858 ) ) ( not ( = ?auto_204854 ?auto_204855 ) ) ( not ( = ?auto_204854 ?auto_204856 ) ) ( not ( = ?auto_204854 ?auto_204857 ) ) ( not ( = ?auto_204854 ?auto_204858 ) ) ( not ( = ?auto_204855 ?auto_204856 ) ) ( not ( = ?auto_204855 ?auto_204857 ) ) ( not ( = ?auto_204855 ?auto_204858 ) ) ( not ( = ?auto_204856 ?auto_204857 ) ) ( not ( = ?auto_204856 ?auto_204858 ) ) ( not ( = ?auto_204857 ?auto_204858 ) ) ( not ( = ?auto_204853 ?auto_204859 ) ) ( not ( = ?auto_204853 ?auto_204860 ) ) ( not ( = ?auto_204854 ?auto_204859 ) ) ( not ( = ?auto_204854 ?auto_204860 ) ) ( not ( = ?auto_204855 ?auto_204859 ) ) ( not ( = ?auto_204855 ?auto_204860 ) ) ( not ( = ?auto_204856 ?auto_204859 ) ) ( not ( = ?auto_204856 ?auto_204860 ) ) ( not ( = ?auto_204857 ?auto_204859 ) ) ( not ( = ?auto_204857 ?auto_204860 ) ) ( not ( = ?auto_204858 ?auto_204859 ) ) ( not ( = ?auto_204858 ?auto_204860 ) ) ( not ( = ?auto_204859 ?auto_204860 ) ) ( ON ?auto_204859 ?auto_204858 ) ( not ( = ?auto_204861 ?auto_204860 ) ) ( not ( = ?auto_204853 ?auto_204861 ) ) ( not ( = ?auto_204854 ?auto_204861 ) ) ( not ( = ?auto_204855 ?auto_204861 ) ) ( not ( = ?auto_204856 ?auto_204861 ) ) ( not ( = ?auto_204857 ?auto_204861 ) ) ( not ( = ?auto_204858 ?auto_204861 ) ) ( not ( = ?auto_204859 ?auto_204861 ) ) ( ON ?auto_204860 ?auto_204859 ) ( CLEAR ?auto_204860 ) ( HOLDING ?auto_204861 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_204861 )
      ( MAKE-5PILE ?auto_204853 ?auto_204854 ?auto_204855 ?auto_204856 ?auto_204857 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_204862 - BLOCK
      ?auto_204863 - BLOCK
      ?auto_204864 - BLOCK
      ?auto_204865 - BLOCK
      ?auto_204866 - BLOCK
    )
    :vars
    (
      ?auto_204867 - BLOCK
      ?auto_204870 - BLOCK
      ?auto_204869 - BLOCK
      ?auto_204868 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_204867 ?auto_204866 ) ( ON-TABLE ?auto_204862 ) ( ON ?auto_204863 ?auto_204862 ) ( ON ?auto_204864 ?auto_204863 ) ( ON ?auto_204865 ?auto_204864 ) ( ON ?auto_204866 ?auto_204865 ) ( not ( = ?auto_204862 ?auto_204863 ) ) ( not ( = ?auto_204862 ?auto_204864 ) ) ( not ( = ?auto_204862 ?auto_204865 ) ) ( not ( = ?auto_204862 ?auto_204866 ) ) ( not ( = ?auto_204862 ?auto_204867 ) ) ( not ( = ?auto_204863 ?auto_204864 ) ) ( not ( = ?auto_204863 ?auto_204865 ) ) ( not ( = ?auto_204863 ?auto_204866 ) ) ( not ( = ?auto_204863 ?auto_204867 ) ) ( not ( = ?auto_204864 ?auto_204865 ) ) ( not ( = ?auto_204864 ?auto_204866 ) ) ( not ( = ?auto_204864 ?auto_204867 ) ) ( not ( = ?auto_204865 ?auto_204866 ) ) ( not ( = ?auto_204865 ?auto_204867 ) ) ( not ( = ?auto_204866 ?auto_204867 ) ) ( not ( = ?auto_204862 ?auto_204870 ) ) ( not ( = ?auto_204862 ?auto_204869 ) ) ( not ( = ?auto_204863 ?auto_204870 ) ) ( not ( = ?auto_204863 ?auto_204869 ) ) ( not ( = ?auto_204864 ?auto_204870 ) ) ( not ( = ?auto_204864 ?auto_204869 ) ) ( not ( = ?auto_204865 ?auto_204870 ) ) ( not ( = ?auto_204865 ?auto_204869 ) ) ( not ( = ?auto_204866 ?auto_204870 ) ) ( not ( = ?auto_204866 ?auto_204869 ) ) ( not ( = ?auto_204867 ?auto_204870 ) ) ( not ( = ?auto_204867 ?auto_204869 ) ) ( not ( = ?auto_204870 ?auto_204869 ) ) ( ON ?auto_204870 ?auto_204867 ) ( not ( = ?auto_204868 ?auto_204869 ) ) ( not ( = ?auto_204862 ?auto_204868 ) ) ( not ( = ?auto_204863 ?auto_204868 ) ) ( not ( = ?auto_204864 ?auto_204868 ) ) ( not ( = ?auto_204865 ?auto_204868 ) ) ( not ( = ?auto_204866 ?auto_204868 ) ) ( not ( = ?auto_204867 ?auto_204868 ) ) ( not ( = ?auto_204870 ?auto_204868 ) ) ( ON ?auto_204869 ?auto_204870 ) ( ON ?auto_204868 ?auto_204869 ) ( CLEAR ?auto_204868 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_204862 ?auto_204863 ?auto_204864 ?auto_204865 ?auto_204866 ?auto_204867 ?auto_204870 ?auto_204869 )
      ( MAKE-5PILE ?auto_204862 ?auto_204863 ?auto_204864 ?auto_204865 ?auto_204866 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_204875 - BLOCK
      ?auto_204876 - BLOCK
      ?auto_204877 - BLOCK
      ?auto_204878 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_204878 ) ( CLEAR ?auto_204877 ) ( ON-TABLE ?auto_204875 ) ( ON ?auto_204876 ?auto_204875 ) ( ON ?auto_204877 ?auto_204876 ) ( not ( = ?auto_204875 ?auto_204876 ) ) ( not ( = ?auto_204875 ?auto_204877 ) ) ( not ( = ?auto_204875 ?auto_204878 ) ) ( not ( = ?auto_204876 ?auto_204877 ) ) ( not ( = ?auto_204876 ?auto_204878 ) ) ( not ( = ?auto_204877 ?auto_204878 ) ) )
    :subtasks
    ( ( !STACK ?auto_204878 ?auto_204877 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_204879 - BLOCK
      ?auto_204880 - BLOCK
      ?auto_204881 - BLOCK
      ?auto_204882 - BLOCK
    )
    :vars
    (
      ?auto_204883 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_204881 ) ( ON-TABLE ?auto_204879 ) ( ON ?auto_204880 ?auto_204879 ) ( ON ?auto_204881 ?auto_204880 ) ( not ( = ?auto_204879 ?auto_204880 ) ) ( not ( = ?auto_204879 ?auto_204881 ) ) ( not ( = ?auto_204879 ?auto_204882 ) ) ( not ( = ?auto_204880 ?auto_204881 ) ) ( not ( = ?auto_204880 ?auto_204882 ) ) ( not ( = ?auto_204881 ?auto_204882 ) ) ( ON ?auto_204882 ?auto_204883 ) ( CLEAR ?auto_204882 ) ( HAND-EMPTY ) ( not ( = ?auto_204879 ?auto_204883 ) ) ( not ( = ?auto_204880 ?auto_204883 ) ) ( not ( = ?auto_204881 ?auto_204883 ) ) ( not ( = ?auto_204882 ?auto_204883 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_204882 ?auto_204883 )
      ( MAKE-4PILE ?auto_204879 ?auto_204880 ?auto_204881 ?auto_204882 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_204884 - BLOCK
      ?auto_204885 - BLOCK
      ?auto_204886 - BLOCK
      ?auto_204887 - BLOCK
    )
    :vars
    (
      ?auto_204888 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_204884 ) ( ON ?auto_204885 ?auto_204884 ) ( not ( = ?auto_204884 ?auto_204885 ) ) ( not ( = ?auto_204884 ?auto_204886 ) ) ( not ( = ?auto_204884 ?auto_204887 ) ) ( not ( = ?auto_204885 ?auto_204886 ) ) ( not ( = ?auto_204885 ?auto_204887 ) ) ( not ( = ?auto_204886 ?auto_204887 ) ) ( ON ?auto_204887 ?auto_204888 ) ( CLEAR ?auto_204887 ) ( not ( = ?auto_204884 ?auto_204888 ) ) ( not ( = ?auto_204885 ?auto_204888 ) ) ( not ( = ?auto_204886 ?auto_204888 ) ) ( not ( = ?auto_204887 ?auto_204888 ) ) ( HOLDING ?auto_204886 ) ( CLEAR ?auto_204885 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_204884 ?auto_204885 ?auto_204886 )
      ( MAKE-4PILE ?auto_204884 ?auto_204885 ?auto_204886 ?auto_204887 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_204889 - BLOCK
      ?auto_204890 - BLOCK
      ?auto_204891 - BLOCK
      ?auto_204892 - BLOCK
    )
    :vars
    (
      ?auto_204893 - BLOCK
      ?auto_204896 - BLOCK
      ?auto_204897 - BLOCK
      ?auto_204894 - BLOCK
      ?auto_204895 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_204889 ) ( ON ?auto_204890 ?auto_204889 ) ( not ( = ?auto_204889 ?auto_204890 ) ) ( not ( = ?auto_204889 ?auto_204891 ) ) ( not ( = ?auto_204889 ?auto_204892 ) ) ( not ( = ?auto_204890 ?auto_204891 ) ) ( not ( = ?auto_204890 ?auto_204892 ) ) ( not ( = ?auto_204891 ?auto_204892 ) ) ( ON ?auto_204892 ?auto_204893 ) ( not ( = ?auto_204889 ?auto_204893 ) ) ( not ( = ?auto_204890 ?auto_204893 ) ) ( not ( = ?auto_204891 ?auto_204893 ) ) ( not ( = ?auto_204892 ?auto_204893 ) ) ( CLEAR ?auto_204890 ) ( ON ?auto_204891 ?auto_204892 ) ( CLEAR ?auto_204891 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_204896 ) ( ON ?auto_204897 ?auto_204896 ) ( ON ?auto_204894 ?auto_204897 ) ( ON ?auto_204895 ?auto_204894 ) ( ON ?auto_204893 ?auto_204895 ) ( not ( = ?auto_204896 ?auto_204897 ) ) ( not ( = ?auto_204896 ?auto_204894 ) ) ( not ( = ?auto_204896 ?auto_204895 ) ) ( not ( = ?auto_204896 ?auto_204893 ) ) ( not ( = ?auto_204896 ?auto_204892 ) ) ( not ( = ?auto_204896 ?auto_204891 ) ) ( not ( = ?auto_204897 ?auto_204894 ) ) ( not ( = ?auto_204897 ?auto_204895 ) ) ( not ( = ?auto_204897 ?auto_204893 ) ) ( not ( = ?auto_204897 ?auto_204892 ) ) ( not ( = ?auto_204897 ?auto_204891 ) ) ( not ( = ?auto_204894 ?auto_204895 ) ) ( not ( = ?auto_204894 ?auto_204893 ) ) ( not ( = ?auto_204894 ?auto_204892 ) ) ( not ( = ?auto_204894 ?auto_204891 ) ) ( not ( = ?auto_204895 ?auto_204893 ) ) ( not ( = ?auto_204895 ?auto_204892 ) ) ( not ( = ?auto_204895 ?auto_204891 ) ) ( not ( = ?auto_204889 ?auto_204896 ) ) ( not ( = ?auto_204889 ?auto_204897 ) ) ( not ( = ?auto_204889 ?auto_204894 ) ) ( not ( = ?auto_204889 ?auto_204895 ) ) ( not ( = ?auto_204890 ?auto_204896 ) ) ( not ( = ?auto_204890 ?auto_204897 ) ) ( not ( = ?auto_204890 ?auto_204894 ) ) ( not ( = ?auto_204890 ?auto_204895 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_204896 ?auto_204897 ?auto_204894 ?auto_204895 ?auto_204893 ?auto_204892 )
      ( MAKE-4PILE ?auto_204889 ?auto_204890 ?auto_204891 ?auto_204892 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_204898 - BLOCK
      ?auto_204899 - BLOCK
      ?auto_204900 - BLOCK
      ?auto_204901 - BLOCK
    )
    :vars
    (
      ?auto_204902 - BLOCK
      ?auto_204905 - BLOCK
      ?auto_204906 - BLOCK
      ?auto_204903 - BLOCK
      ?auto_204904 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_204898 ) ( not ( = ?auto_204898 ?auto_204899 ) ) ( not ( = ?auto_204898 ?auto_204900 ) ) ( not ( = ?auto_204898 ?auto_204901 ) ) ( not ( = ?auto_204899 ?auto_204900 ) ) ( not ( = ?auto_204899 ?auto_204901 ) ) ( not ( = ?auto_204900 ?auto_204901 ) ) ( ON ?auto_204901 ?auto_204902 ) ( not ( = ?auto_204898 ?auto_204902 ) ) ( not ( = ?auto_204899 ?auto_204902 ) ) ( not ( = ?auto_204900 ?auto_204902 ) ) ( not ( = ?auto_204901 ?auto_204902 ) ) ( ON ?auto_204900 ?auto_204901 ) ( CLEAR ?auto_204900 ) ( ON-TABLE ?auto_204905 ) ( ON ?auto_204906 ?auto_204905 ) ( ON ?auto_204903 ?auto_204906 ) ( ON ?auto_204904 ?auto_204903 ) ( ON ?auto_204902 ?auto_204904 ) ( not ( = ?auto_204905 ?auto_204906 ) ) ( not ( = ?auto_204905 ?auto_204903 ) ) ( not ( = ?auto_204905 ?auto_204904 ) ) ( not ( = ?auto_204905 ?auto_204902 ) ) ( not ( = ?auto_204905 ?auto_204901 ) ) ( not ( = ?auto_204905 ?auto_204900 ) ) ( not ( = ?auto_204906 ?auto_204903 ) ) ( not ( = ?auto_204906 ?auto_204904 ) ) ( not ( = ?auto_204906 ?auto_204902 ) ) ( not ( = ?auto_204906 ?auto_204901 ) ) ( not ( = ?auto_204906 ?auto_204900 ) ) ( not ( = ?auto_204903 ?auto_204904 ) ) ( not ( = ?auto_204903 ?auto_204902 ) ) ( not ( = ?auto_204903 ?auto_204901 ) ) ( not ( = ?auto_204903 ?auto_204900 ) ) ( not ( = ?auto_204904 ?auto_204902 ) ) ( not ( = ?auto_204904 ?auto_204901 ) ) ( not ( = ?auto_204904 ?auto_204900 ) ) ( not ( = ?auto_204898 ?auto_204905 ) ) ( not ( = ?auto_204898 ?auto_204906 ) ) ( not ( = ?auto_204898 ?auto_204903 ) ) ( not ( = ?auto_204898 ?auto_204904 ) ) ( not ( = ?auto_204899 ?auto_204905 ) ) ( not ( = ?auto_204899 ?auto_204906 ) ) ( not ( = ?auto_204899 ?auto_204903 ) ) ( not ( = ?auto_204899 ?auto_204904 ) ) ( HOLDING ?auto_204899 ) ( CLEAR ?auto_204898 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_204898 ?auto_204899 )
      ( MAKE-4PILE ?auto_204898 ?auto_204899 ?auto_204900 ?auto_204901 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_204907 - BLOCK
      ?auto_204908 - BLOCK
      ?auto_204909 - BLOCK
      ?auto_204910 - BLOCK
    )
    :vars
    (
      ?auto_204914 - BLOCK
      ?auto_204913 - BLOCK
      ?auto_204911 - BLOCK
      ?auto_204912 - BLOCK
      ?auto_204915 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_204907 ) ( not ( = ?auto_204907 ?auto_204908 ) ) ( not ( = ?auto_204907 ?auto_204909 ) ) ( not ( = ?auto_204907 ?auto_204910 ) ) ( not ( = ?auto_204908 ?auto_204909 ) ) ( not ( = ?auto_204908 ?auto_204910 ) ) ( not ( = ?auto_204909 ?auto_204910 ) ) ( ON ?auto_204910 ?auto_204914 ) ( not ( = ?auto_204907 ?auto_204914 ) ) ( not ( = ?auto_204908 ?auto_204914 ) ) ( not ( = ?auto_204909 ?auto_204914 ) ) ( not ( = ?auto_204910 ?auto_204914 ) ) ( ON ?auto_204909 ?auto_204910 ) ( ON-TABLE ?auto_204913 ) ( ON ?auto_204911 ?auto_204913 ) ( ON ?auto_204912 ?auto_204911 ) ( ON ?auto_204915 ?auto_204912 ) ( ON ?auto_204914 ?auto_204915 ) ( not ( = ?auto_204913 ?auto_204911 ) ) ( not ( = ?auto_204913 ?auto_204912 ) ) ( not ( = ?auto_204913 ?auto_204915 ) ) ( not ( = ?auto_204913 ?auto_204914 ) ) ( not ( = ?auto_204913 ?auto_204910 ) ) ( not ( = ?auto_204913 ?auto_204909 ) ) ( not ( = ?auto_204911 ?auto_204912 ) ) ( not ( = ?auto_204911 ?auto_204915 ) ) ( not ( = ?auto_204911 ?auto_204914 ) ) ( not ( = ?auto_204911 ?auto_204910 ) ) ( not ( = ?auto_204911 ?auto_204909 ) ) ( not ( = ?auto_204912 ?auto_204915 ) ) ( not ( = ?auto_204912 ?auto_204914 ) ) ( not ( = ?auto_204912 ?auto_204910 ) ) ( not ( = ?auto_204912 ?auto_204909 ) ) ( not ( = ?auto_204915 ?auto_204914 ) ) ( not ( = ?auto_204915 ?auto_204910 ) ) ( not ( = ?auto_204915 ?auto_204909 ) ) ( not ( = ?auto_204907 ?auto_204913 ) ) ( not ( = ?auto_204907 ?auto_204911 ) ) ( not ( = ?auto_204907 ?auto_204912 ) ) ( not ( = ?auto_204907 ?auto_204915 ) ) ( not ( = ?auto_204908 ?auto_204913 ) ) ( not ( = ?auto_204908 ?auto_204911 ) ) ( not ( = ?auto_204908 ?auto_204912 ) ) ( not ( = ?auto_204908 ?auto_204915 ) ) ( CLEAR ?auto_204907 ) ( ON ?auto_204908 ?auto_204909 ) ( CLEAR ?auto_204908 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_204913 ?auto_204911 ?auto_204912 ?auto_204915 ?auto_204914 ?auto_204910 ?auto_204909 )
      ( MAKE-4PILE ?auto_204907 ?auto_204908 ?auto_204909 ?auto_204910 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_204916 - BLOCK
      ?auto_204917 - BLOCK
      ?auto_204918 - BLOCK
      ?auto_204919 - BLOCK
    )
    :vars
    (
      ?auto_204920 - BLOCK
      ?auto_204922 - BLOCK
      ?auto_204923 - BLOCK
      ?auto_204921 - BLOCK
      ?auto_204924 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_204916 ?auto_204917 ) ) ( not ( = ?auto_204916 ?auto_204918 ) ) ( not ( = ?auto_204916 ?auto_204919 ) ) ( not ( = ?auto_204917 ?auto_204918 ) ) ( not ( = ?auto_204917 ?auto_204919 ) ) ( not ( = ?auto_204918 ?auto_204919 ) ) ( ON ?auto_204919 ?auto_204920 ) ( not ( = ?auto_204916 ?auto_204920 ) ) ( not ( = ?auto_204917 ?auto_204920 ) ) ( not ( = ?auto_204918 ?auto_204920 ) ) ( not ( = ?auto_204919 ?auto_204920 ) ) ( ON ?auto_204918 ?auto_204919 ) ( ON-TABLE ?auto_204922 ) ( ON ?auto_204923 ?auto_204922 ) ( ON ?auto_204921 ?auto_204923 ) ( ON ?auto_204924 ?auto_204921 ) ( ON ?auto_204920 ?auto_204924 ) ( not ( = ?auto_204922 ?auto_204923 ) ) ( not ( = ?auto_204922 ?auto_204921 ) ) ( not ( = ?auto_204922 ?auto_204924 ) ) ( not ( = ?auto_204922 ?auto_204920 ) ) ( not ( = ?auto_204922 ?auto_204919 ) ) ( not ( = ?auto_204922 ?auto_204918 ) ) ( not ( = ?auto_204923 ?auto_204921 ) ) ( not ( = ?auto_204923 ?auto_204924 ) ) ( not ( = ?auto_204923 ?auto_204920 ) ) ( not ( = ?auto_204923 ?auto_204919 ) ) ( not ( = ?auto_204923 ?auto_204918 ) ) ( not ( = ?auto_204921 ?auto_204924 ) ) ( not ( = ?auto_204921 ?auto_204920 ) ) ( not ( = ?auto_204921 ?auto_204919 ) ) ( not ( = ?auto_204921 ?auto_204918 ) ) ( not ( = ?auto_204924 ?auto_204920 ) ) ( not ( = ?auto_204924 ?auto_204919 ) ) ( not ( = ?auto_204924 ?auto_204918 ) ) ( not ( = ?auto_204916 ?auto_204922 ) ) ( not ( = ?auto_204916 ?auto_204923 ) ) ( not ( = ?auto_204916 ?auto_204921 ) ) ( not ( = ?auto_204916 ?auto_204924 ) ) ( not ( = ?auto_204917 ?auto_204922 ) ) ( not ( = ?auto_204917 ?auto_204923 ) ) ( not ( = ?auto_204917 ?auto_204921 ) ) ( not ( = ?auto_204917 ?auto_204924 ) ) ( ON ?auto_204917 ?auto_204918 ) ( CLEAR ?auto_204917 ) ( HOLDING ?auto_204916 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_204916 )
      ( MAKE-4PILE ?auto_204916 ?auto_204917 ?auto_204918 ?auto_204919 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_204925 - BLOCK
      ?auto_204926 - BLOCK
      ?auto_204927 - BLOCK
      ?auto_204928 - BLOCK
    )
    :vars
    (
      ?auto_204932 - BLOCK
      ?auto_204930 - BLOCK
      ?auto_204933 - BLOCK
      ?auto_204929 - BLOCK
      ?auto_204931 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_204925 ?auto_204926 ) ) ( not ( = ?auto_204925 ?auto_204927 ) ) ( not ( = ?auto_204925 ?auto_204928 ) ) ( not ( = ?auto_204926 ?auto_204927 ) ) ( not ( = ?auto_204926 ?auto_204928 ) ) ( not ( = ?auto_204927 ?auto_204928 ) ) ( ON ?auto_204928 ?auto_204932 ) ( not ( = ?auto_204925 ?auto_204932 ) ) ( not ( = ?auto_204926 ?auto_204932 ) ) ( not ( = ?auto_204927 ?auto_204932 ) ) ( not ( = ?auto_204928 ?auto_204932 ) ) ( ON ?auto_204927 ?auto_204928 ) ( ON-TABLE ?auto_204930 ) ( ON ?auto_204933 ?auto_204930 ) ( ON ?auto_204929 ?auto_204933 ) ( ON ?auto_204931 ?auto_204929 ) ( ON ?auto_204932 ?auto_204931 ) ( not ( = ?auto_204930 ?auto_204933 ) ) ( not ( = ?auto_204930 ?auto_204929 ) ) ( not ( = ?auto_204930 ?auto_204931 ) ) ( not ( = ?auto_204930 ?auto_204932 ) ) ( not ( = ?auto_204930 ?auto_204928 ) ) ( not ( = ?auto_204930 ?auto_204927 ) ) ( not ( = ?auto_204933 ?auto_204929 ) ) ( not ( = ?auto_204933 ?auto_204931 ) ) ( not ( = ?auto_204933 ?auto_204932 ) ) ( not ( = ?auto_204933 ?auto_204928 ) ) ( not ( = ?auto_204933 ?auto_204927 ) ) ( not ( = ?auto_204929 ?auto_204931 ) ) ( not ( = ?auto_204929 ?auto_204932 ) ) ( not ( = ?auto_204929 ?auto_204928 ) ) ( not ( = ?auto_204929 ?auto_204927 ) ) ( not ( = ?auto_204931 ?auto_204932 ) ) ( not ( = ?auto_204931 ?auto_204928 ) ) ( not ( = ?auto_204931 ?auto_204927 ) ) ( not ( = ?auto_204925 ?auto_204930 ) ) ( not ( = ?auto_204925 ?auto_204933 ) ) ( not ( = ?auto_204925 ?auto_204929 ) ) ( not ( = ?auto_204925 ?auto_204931 ) ) ( not ( = ?auto_204926 ?auto_204930 ) ) ( not ( = ?auto_204926 ?auto_204933 ) ) ( not ( = ?auto_204926 ?auto_204929 ) ) ( not ( = ?auto_204926 ?auto_204931 ) ) ( ON ?auto_204926 ?auto_204927 ) ( ON ?auto_204925 ?auto_204926 ) ( CLEAR ?auto_204925 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_204930 ?auto_204933 ?auto_204929 ?auto_204931 ?auto_204932 ?auto_204928 ?auto_204927 ?auto_204926 )
      ( MAKE-4PILE ?auto_204925 ?auto_204926 ?auto_204927 ?auto_204928 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_204938 - BLOCK
      ?auto_204939 - BLOCK
      ?auto_204940 - BLOCK
      ?auto_204941 - BLOCK
    )
    :vars
    (
      ?auto_204942 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_204942 ?auto_204941 ) ( CLEAR ?auto_204942 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_204938 ) ( ON ?auto_204939 ?auto_204938 ) ( ON ?auto_204940 ?auto_204939 ) ( ON ?auto_204941 ?auto_204940 ) ( not ( = ?auto_204938 ?auto_204939 ) ) ( not ( = ?auto_204938 ?auto_204940 ) ) ( not ( = ?auto_204938 ?auto_204941 ) ) ( not ( = ?auto_204938 ?auto_204942 ) ) ( not ( = ?auto_204939 ?auto_204940 ) ) ( not ( = ?auto_204939 ?auto_204941 ) ) ( not ( = ?auto_204939 ?auto_204942 ) ) ( not ( = ?auto_204940 ?auto_204941 ) ) ( not ( = ?auto_204940 ?auto_204942 ) ) ( not ( = ?auto_204941 ?auto_204942 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_204942 ?auto_204941 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_204943 - BLOCK
      ?auto_204944 - BLOCK
      ?auto_204945 - BLOCK
      ?auto_204946 - BLOCK
    )
    :vars
    (
      ?auto_204947 - BLOCK
      ?auto_204948 - BLOCK
      ?auto_204949 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_204947 ?auto_204946 ) ( CLEAR ?auto_204947 ) ( ON-TABLE ?auto_204943 ) ( ON ?auto_204944 ?auto_204943 ) ( ON ?auto_204945 ?auto_204944 ) ( ON ?auto_204946 ?auto_204945 ) ( not ( = ?auto_204943 ?auto_204944 ) ) ( not ( = ?auto_204943 ?auto_204945 ) ) ( not ( = ?auto_204943 ?auto_204946 ) ) ( not ( = ?auto_204943 ?auto_204947 ) ) ( not ( = ?auto_204944 ?auto_204945 ) ) ( not ( = ?auto_204944 ?auto_204946 ) ) ( not ( = ?auto_204944 ?auto_204947 ) ) ( not ( = ?auto_204945 ?auto_204946 ) ) ( not ( = ?auto_204945 ?auto_204947 ) ) ( not ( = ?auto_204946 ?auto_204947 ) ) ( HOLDING ?auto_204948 ) ( CLEAR ?auto_204949 ) ( not ( = ?auto_204943 ?auto_204948 ) ) ( not ( = ?auto_204943 ?auto_204949 ) ) ( not ( = ?auto_204944 ?auto_204948 ) ) ( not ( = ?auto_204944 ?auto_204949 ) ) ( not ( = ?auto_204945 ?auto_204948 ) ) ( not ( = ?auto_204945 ?auto_204949 ) ) ( not ( = ?auto_204946 ?auto_204948 ) ) ( not ( = ?auto_204946 ?auto_204949 ) ) ( not ( = ?auto_204947 ?auto_204948 ) ) ( not ( = ?auto_204947 ?auto_204949 ) ) ( not ( = ?auto_204948 ?auto_204949 ) ) )
    :subtasks
    ( ( !STACK ?auto_204948 ?auto_204949 )
      ( MAKE-4PILE ?auto_204943 ?auto_204944 ?auto_204945 ?auto_204946 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_204950 - BLOCK
      ?auto_204951 - BLOCK
      ?auto_204952 - BLOCK
      ?auto_204953 - BLOCK
    )
    :vars
    (
      ?auto_204956 - BLOCK
      ?auto_204955 - BLOCK
      ?auto_204954 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_204956 ?auto_204953 ) ( ON-TABLE ?auto_204950 ) ( ON ?auto_204951 ?auto_204950 ) ( ON ?auto_204952 ?auto_204951 ) ( ON ?auto_204953 ?auto_204952 ) ( not ( = ?auto_204950 ?auto_204951 ) ) ( not ( = ?auto_204950 ?auto_204952 ) ) ( not ( = ?auto_204950 ?auto_204953 ) ) ( not ( = ?auto_204950 ?auto_204956 ) ) ( not ( = ?auto_204951 ?auto_204952 ) ) ( not ( = ?auto_204951 ?auto_204953 ) ) ( not ( = ?auto_204951 ?auto_204956 ) ) ( not ( = ?auto_204952 ?auto_204953 ) ) ( not ( = ?auto_204952 ?auto_204956 ) ) ( not ( = ?auto_204953 ?auto_204956 ) ) ( CLEAR ?auto_204955 ) ( not ( = ?auto_204950 ?auto_204954 ) ) ( not ( = ?auto_204950 ?auto_204955 ) ) ( not ( = ?auto_204951 ?auto_204954 ) ) ( not ( = ?auto_204951 ?auto_204955 ) ) ( not ( = ?auto_204952 ?auto_204954 ) ) ( not ( = ?auto_204952 ?auto_204955 ) ) ( not ( = ?auto_204953 ?auto_204954 ) ) ( not ( = ?auto_204953 ?auto_204955 ) ) ( not ( = ?auto_204956 ?auto_204954 ) ) ( not ( = ?auto_204956 ?auto_204955 ) ) ( not ( = ?auto_204954 ?auto_204955 ) ) ( ON ?auto_204954 ?auto_204956 ) ( CLEAR ?auto_204954 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_204950 ?auto_204951 ?auto_204952 ?auto_204953 ?auto_204956 )
      ( MAKE-4PILE ?auto_204950 ?auto_204951 ?auto_204952 ?auto_204953 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_204957 - BLOCK
      ?auto_204958 - BLOCK
      ?auto_204959 - BLOCK
      ?auto_204960 - BLOCK
    )
    :vars
    (
      ?auto_204963 - BLOCK
      ?auto_204961 - BLOCK
      ?auto_204962 - BLOCK
      ?auto_204965 - BLOCK
      ?auto_204964 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_204963 ?auto_204960 ) ( ON-TABLE ?auto_204957 ) ( ON ?auto_204958 ?auto_204957 ) ( ON ?auto_204959 ?auto_204958 ) ( ON ?auto_204960 ?auto_204959 ) ( not ( = ?auto_204957 ?auto_204958 ) ) ( not ( = ?auto_204957 ?auto_204959 ) ) ( not ( = ?auto_204957 ?auto_204960 ) ) ( not ( = ?auto_204957 ?auto_204963 ) ) ( not ( = ?auto_204958 ?auto_204959 ) ) ( not ( = ?auto_204958 ?auto_204960 ) ) ( not ( = ?auto_204958 ?auto_204963 ) ) ( not ( = ?auto_204959 ?auto_204960 ) ) ( not ( = ?auto_204959 ?auto_204963 ) ) ( not ( = ?auto_204960 ?auto_204963 ) ) ( not ( = ?auto_204957 ?auto_204961 ) ) ( not ( = ?auto_204957 ?auto_204962 ) ) ( not ( = ?auto_204958 ?auto_204961 ) ) ( not ( = ?auto_204958 ?auto_204962 ) ) ( not ( = ?auto_204959 ?auto_204961 ) ) ( not ( = ?auto_204959 ?auto_204962 ) ) ( not ( = ?auto_204960 ?auto_204961 ) ) ( not ( = ?auto_204960 ?auto_204962 ) ) ( not ( = ?auto_204963 ?auto_204961 ) ) ( not ( = ?auto_204963 ?auto_204962 ) ) ( not ( = ?auto_204961 ?auto_204962 ) ) ( ON ?auto_204961 ?auto_204963 ) ( CLEAR ?auto_204961 ) ( HOLDING ?auto_204962 ) ( CLEAR ?auto_204965 ) ( ON-TABLE ?auto_204964 ) ( ON ?auto_204965 ?auto_204964 ) ( not ( = ?auto_204964 ?auto_204965 ) ) ( not ( = ?auto_204964 ?auto_204962 ) ) ( not ( = ?auto_204965 ?auto_204962 ) ) ( not ( = ?auto_204957 ?auto_204965 ) ) ( not ( = ?auto_204957 ?auto_204964 ) ) ( not ( = ?auto_204958 ?auto_204965 ) ) ( not ( = ?auto_204958 ?auto_204964 ) ) ( not ( = ?auto_204959 ?auto_204965 ) ) ( not ( = ?auto_204959 ?auto_204964 ) ) ( not ( = ?auto_204960 ?auto_204965 ) ) ( not ( = ?auto_204960 ?auto_204964 ) ) ( not ( = ?auto_204963 ?auto_204965 ) ) ( not ( = ?auto_204963 ?auto_204964 ) ) ( not ( = ?auto_204961 ?auto_204965 ) ) ( not ( = ?auto_204961 ?auto_204964 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_204964 ?auto_204965 ?auto_204962 )
      ( MAKE-4PILE ?auto_204957 ?auto_204958 ?auto_204959 ?auto_204960 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_204966 - BLOCK
      ?auto_204967 - BLOCK
      ?auto_204968 - BLOCK
      ?auto_204969 - BLOCK
    )
    :vars
    (
      ?auto_204972 - BLOCK
      ?auto_204970 - BLOCK
      ?auto_204971 - BLOCK
      ?auto_204973 - BLOCK
      ?auto_204974 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_204972 ?auto_204969 ) ( ON-TABLE ?auto_204966 ) ( ON ?auto_204967 ?auto_204966 ) ( ON ?auto_204968 ?auto_204967 ) ( ON ?auto_204969 ?auto_204968 ) ( not ( = ?auto_204966 ?auto_204967 ) ) ( not ( = ?auto_204966 ?auto_204968 ) ) ( not ( = ?auto_204966 ?auto_204969 ) ) ( not ( = ?auto_204966 ?auto_204972 ) ) ( not ( = ?auto_204967 ?auto_204968 ) ) ( not ( = ?auto_204967 ?auto_204969 ) ) ( not ( = ?auto_204967 ?auto_204972 ) ) ( not ( = ?auto_204968 ?auto_204969 ) ) ( not ( = ?auto_204968 ?auto_204972 ) ) ( not ( = ?auto_204969 ?auto_204972 ) ) ( not ( = ?auto_204966 ?auto_204970 ) ) ( not ( = ?auto_204966 ?auto_204971 ) ) ( not ( = ?auto_204967 ?auto_204970 ) ) ( not ( = ?auto_204967 ?auto_204971 ) ) ( not ( = ?auto_204968 ?auto_204970 ) ) ( not ( = ?auto_204968 ?auto_204971 ) ) ( not ( = ?auto_204969 ?auto_204970 ) ) ( not ( = ?auto_204969 ?auto_204971 ) ) ( not ( = ?auto_204972 ?auto_204970 ) ) ( not ( = ?auto_204972 ?auto_204971 ) ) ( not ( = ?auto_204970 ?auto_204971 ) ) ( ON ?auto_204970 ?auto_204972 ) ( CLEAR ?auto_204973 ) ( ON-TABLE ?auto_204974 ) ( ON ?auto_204973 ?auto_204974 ) ( not ( = ?auto_204974 ?auto_204973 ) ) ( not ( = ?auto_204974 ?auto_204971 ) ) ( not ( = ?auto_204973 ?auto_204971 ) ) ( not ( = ?auto_204966 ?auto_204973 ) ) ( not ( = ?auto_204966 ?auto_204974 ) ) ( not ( = ?auto_204967 ?auto_204973 ) ) ( not ( = ?auto_204967 ?auto_204974 ) ) ( not ( = ?auto_204968 ?auto_204973 ) ) ( not ( = ?auto_204968 ?auto_204974 ) ) ( not ( = ?auto_204969 ?auto_204973 ) ) ( not ( = ?auto_204969 ?auto_204974 ) ) ( not ( = ?auto_204972 ?auto_204973 ) ) ( not ( = ?auto_204972 ?auto_204974 ) ) ( not ( = ?auto_204970 ?auto_204973 ) ) ( not ( = ?auto_204970 ?auto_204974 ) ) ( ON ?auto_204971 ?auto_204970 ) ( CLEAR ?auto_204971 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_204966 ?auto_204967 ?auto_204968 ?auto_204969 ?auto_204972 ?auto_204970 )
      ( MAKE-4PILE ?auto_204966 ?auto_204967 ?auto_204968 ?auto_204969 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_204975 - BLOCK
      ?auto_204976 - BLOCK
      ?auto_204977 - BLOCK
      ?auto_204978 - BLOCK
    )
    :vars
    (
      ?auto_204980 - BLOCK
      ?auto_204979 - BLOCK
      ?auto_204982 - BLOCK
      ?auto_204981 - BLOCK
      ?auto_204983 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_204980 ?auto_204978 ) ( ON-TABLE ?auto_204975 ) ( ON ?auto_204976 ?auto_204975 ) ( ON ?auto_204977 ?auto_204976 ) ( ON ?auto_204978 ?auto_204977 ) ( not ( = ?auto_204975 ?auto_204976 ) ) ( not ( = ?auto_204975 ?auto_204977 ) ) ( not ( = ?auto_204975 ?auto_204978 ) ) ( not ( = ?auto_204975 ?auto_204980 ) ) ( not ( = ?auto_204976 ?auto_204977 ) ) ( not ( = ?auto_204976 ?auto_204978 ) ) ( not ( = ?auto_204976 ?auto_204980 ) ) ( not ( = ?auto_204977 ?auto_204978 ) ) ( not ( = ?auto_204977 ?auto_204980 ) ) ( not ( = ?auto_204978 ?auto_204980 ) ) ( not ( = ?auto_204975 ?auto_204979 ) ) ( not ( = ?auto_204975 ?auto_204982 ) ) ( not ( = ?auto_204976 ?auto_204979 ) ) ( not ( = ?auto_204976 ?auto_204982 ) ) ( not ( = ?auto_204977 ?auto_204979 ) ) ( not ( = ?auto_204977 ?auto_204982 ) ) ( not ( = ?auto_204978 ?auto_204979 ) ) ( not ( = ?auto_204978 ?auto_204982 ) ) ( not ( = ?auto_204980 ?auto_204979 ) ) ( not ( = ?auto_204980 ?auto_204982 ) ) ( not ( = ?auto_204979 ?auto_204982 ) ) ( ON ?auto_204979 ?auto_204980 ) ( ON-TABLE ?auto_204981 ) ( not ( = ?auto_204981 ?auto_204983 ) ) ( not ( = ?auto_204981 ?auto_204982 ) ) ( not ( = ?auto_204983 ?auto_204982 ) ) ( not ( = ?auto_204975 ?auto_204983 ) ) ( not ( = ?auto_204975 ?auto_204981 ) ) ( not ( = ?auto_204976 ?auto_204983 ) ) ( not ( = ?auto_204976 ?auto_204981 ) ) ( not ( = ?auto_204977 ?auto_204983 ) ) ( not ( = ?auto_204977 ?auto_204981 ) ) ( not ( = ?auto_204978 ?auto_204983 ) ) ( not ( = ?auto_204978 ?auto_204981 ) ) ( not ( = ?auto_204980 ?auto_204983 ) ) ( not ( = ?auto_204980 ?auto_204981 ) ) ( not ( = ?auto_204979 ?auto_204983 ) ) ( not ( = ?auto_204979 ?auto_204981 ) ) ( ON ?auto_204982 ?auto_204979 ) ( CLEAR ?auto_204982 ) ( HOLDING ?auto_204983 ) ( CLEAR ?auto_204981 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_204981 ?auto_204983 )
      ( MAKE-4PILE ?auto_204975 ?auto_204976 ?auto_204977 ?auto_204978 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_204984 - BLOCK
      ?auto_204985 - BLOCK
      ?auto_204986 - BLOCK
      ?auto_204987 - BLOCK
    )
    :vars
    (
      ?auto_204988 - BLOCK
      ?auto_204990 - BLOCK
      ?auto_204989 - BLOCK
      ?auto_204991 - BLOCK
      ?auto_204992 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_204988 ?auto_204987 ) ( ON-TABLE ?auto_204984 ) ( ON ?auto_204985 ?auto_204984 ) ( ON ?auto_204986 ?auto_204985 ) ( ON ?auto_204987 ?auto_204986 ) ( not ( = ?auto_204984 ?auto_204985 ) ) ( not ( = ?auto_204984 ?auto_204986 ) ) ( not ( = ?auto_204984 ?auto_204987 ) ) ( not ( = ?auto_204984 ?auto_204988 ) ) ( not ( = ?auto_204985 ?auto_204986 ) ) ( not ( = ?auto_204985 ?auto_204987 ) ) ( not ( = ?auto_204985 ?auto_204988 ) ) ( not ( = ?auto_204986 ?auto_204987 ) ) ( not ( = ?auto_204986 ?auto_204988 ) ) ( not ( = ?auto_204987 ?auto_204988 ) ) ( not ( = ?auto_204984 ?auto_204990 ) ) ( not ( = ?auto_204984 ?auto_204989 ) ) ( not ( = ?auto_204985 ?auto_204990 ) ) ( not ( = ?auto_204985 ?auto_204989 ) ) ( not ( = ?auto_204986 ?auto_204990 ) ) ( not ( = ?auto_204986 ?auto_204989 ) ) ( not ( = ?auto_204987 ?auto_204990 ) ) ( not ( = ?auto_204987 ?auto_204989 ) ) ( not ( = ?auto_204988 ?auto_204990 ) ) ( not ( = ?auto_204988 ?auto_204989 ) ) ( not ( = ?auto_204990 ?auto_204989 ) ) ( ON ?auto_204990 ?auto_204988 ) ( ON-TABLE ?auto_204991 ) ( not ( = ?auto_204991 ?auto_204992 ) ) ( not ( = ?auto_204991 ?auto_204989 ) ) ( not ( = ?auto_204992 ?auto_204989 ) ) ( not ( = ?auto_204984 ?auto_204992 ) ) ( not ( = ?auto_204984 ?auto_204991 ) ) ( not ( = ?auto_204985 ?auto_204992 ) ) ( not ( = ?auto_204985 ?auto_204991 ) ) ( not ( = ?auto_204986 ?auto_204992 ) ) ( not ( = ?auto_204986 ?auto_204991 ) ) ( not ( = ?auto_204987 ?auto_204992 ) ) ( not ( = ?auto_204987 ?auto_204991 ) ) ( not ( = ?auto_204988 ?auto_204992 ) ) ( not ( = ?auto_204988 ?auto_204991 ) ) ( not ( = ?auto_204990 ?auto_204992 ) ) ( not ( = ?auto_204990 ?auto_204991 ) ) ( ON ?auto_204989 ?auto_204990 ) ( CLEAR ?auto_204991 ) ( ON ?auto_204992 ?auto_204989 ) ( CLEAR ?auto_204992 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_204984 ?auto_204985 ?auto_204986 ?auto_204987 ?auto_204988 ?auto_204990 ?auto_204989 )
      ( MAKE-4PILE ?auto_204984 ?auto_204985 ?auto_204986 ?auto_204987 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_204993 - BLOCK
      ?auto_204994 - BLOCK
      ?auto_204995 - BLOCK
      ?auto_204996 - BLOCK
    )
    :vars
    (
      ?auto_205001 - BLOCK
      ?auto_204999 - BLOCK
      ?auto_204997 - BLOCK
      ?auto_204998 - BLOCK
      ?auto_205000 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205001 ?auto_204996 ) ( ON-TABLE ?auto_204993 ) ( ON ?auto_204994 ?auto_204993 ) ( ON ?auto_204995 ?auto_204994 ) ( ON ?auto_204996 ?auto_204995 ) ( not ( = ?auto_204993 ?auto_204994 ) ) ( not ( = ?auto_204993 ?auto_204995 ) ) ( not ( = ?auto_204993 ?auto_204996 ) ) ( not ( = ?auto_204993 ?auto_205001 ) ) ( not ( = ?auto_204994 ?auto_204995 ) ) ( not ( = ?auto_204994 ?auto_204996 ) ) ( not ( = ?auto_204994 ?auto_205001 ) ) ( not ( = ?auto_204995 ?auto_204996 ) ) ( not ( = ?auto_204995 ?auto_205001 ) ) ( not ( = ?auto_204996 ?auto_205001 ) ) ( not ( = ?auto_204993 ?auto_204999 ) ) ( not ( = ?auto_204993 ?auto_204997 ) ) ( not ( = ?auto_204994 ?auto_204999 ) ) ( not ( = ?auto_204994 ?auto_204997 ) ) ( not ( = ?auto_204995 ?auto_204999 ) ) ( not ( = ?auto_204995 ?auto_204997 ) ) ( not ( = ?auto_204996 ?auto_204999 ) ) ( not ( = ?auto_204996 ?auto_204997 ) ) ( not ( = ?auto_205001 ?auto_204999 ) ) ( not ( = ?auto_205001 ?auto_204997 ) ) ( not ( = ?auto_204999 ?auto_204997 ) ) ( ON ?auto_204999 ?auto_205001 ) ( not ( = ?auto_204998 ?auto_205000 ) ) ( not ( = ?auto_204998 ?auto_204997 ) ) ( not ( = ?auto_205000 ?auto_204997 ) ) ( not ( = ?auto_204993 ?auto_205000 ) ) ( not ( = ?auto_204993 ?auto_204998 ) ) ( not ( = ?auto_204994 ?auto_205000 ) ) ( not ( = ?auto_204994 ?auto_204998 ) ) ( not ( = ?auto_204995 ?auto_205000 ) ) ( not ( = ?auto_204995 ?auto_204998 ) ) ( not ( = ?auto_204996 ?auto_205000 ) ) ( not ( = ?auto_204996 ?auto_204998 ) ) ( not ( = ?auto_205001 ?auto_205000 ) ) ( not ( = ?auto_205001 ?auto_204998 ) ) ( not ( = ?auto_204999 ?auto_205000 ) ) ( not ( = ?auto_204999 ?auto_204998 ) ) ( ON ?auto_204997 ?auto_204999 ) ( ON ?auto_205000 ?auto_204997 ) ( CLEAR ?auto_205000 ) ( HOLDING ?auto_204998 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_204998 )
      ( MAKE-4PILE ?auto_204993 ?auto_204994 ?auto_204995 ?auto_204996 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_205002 - BLOCK
      ?auto_205003 - BLOCK
      ?auto_205004 - BLOCK
      ?auto_205005 - BLOCK
    )
    :vars
    (
      ?auto_205009 - BLOCK
      ?auto_205006 - BLOCK
      ?auto_205007 - BLOCK
      ?auto_205010 - BLOCK
      ?auto_205008 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205009 ?auto_205005 ) ( ON-TABLE ?auto_205002 ) ( ON ?auto_205003 ?auto_205002 ) ( ON ?auto_205004 ?auto_205003 ) ( ON ?auto_205005 ?auto_205004 ) ( not ( = ?auto_205002 ?auto_205003 ) ) ( not ( = ?auto_205002 ?auto_205004 ) ) ( not ( = ?auto_205002 ?auto_205005 ) ) ( not ( = ?auto_205002 ?auto_205009 ) ) ( not ( = ?auto_205003 ?auto_205004 ) ) ( not ( = ?auto_205003 ?auto_205005 ) ) ( not ( = ?auto_205003 ?auto_205009 ) ) ( not ( = ?auto_205004 ?auto_205005 ) ) ( not ( = ?auto_205004 ?auto_205009 ) ) ( not ( = ?auto_205005 ?auto_205009 ) ) ( not ( = ?auto_205002 ?auto_205006 ) ) ( not ( = ?auto_205002 ?auto_205007 ) ) ( not ( = ?auto_205003 ?auto_205006 ) ) ( not ( = ?auto_205003 ?auto_205007 ) ) ( not ( = ?auto_205004 ?auto_205006 ) ) ( not ( = ?auto_205004 ?auto_205007 ) ) ( not ( = ?auto_205005 ?auto_205006 ) ) ( not ( = ?auto_205005 ?auto_205007 ) ) ( not ( = ?auto_205009 ?auto_205006 ) ) ( not ( = ?auto_205009 ?auto_205007 ) ) ( not ( = ?auto_205006 ?auto_205007 ) ) ( ON ?auto_205006 ?auto_205009 ) ( not ( = ?auto_205010 ?auto_205008 ) ) ( not ( = ?auto_205010 ?auto_205007 ) ) ( not ( = ?auto_205008 ?auto_205007 ) ) ( not ( = ?auto_205002 ?auto_205008 ) ) ( not ( = ?auto_205002 ?auto_205010 ) ) ( not ( = ?auto_205003 ?auto_205008 ) ) ( not ( = ?auto_205003 ?auto_205010 ) ) ( not ( = ?auto_205004 ?auto_205008 ) ) ( not ( = ?auto_205004 ?auto_205010 ) ) ( not ( = ?auto_205005 ?auto_205008 ) ) ( not ( = ?auto_205005 ?auto_205010 ) ) ( not ( = ?auto_205009 ?auto_205008 ) ) ( not ( = ?auto_205009 ?auto_205010 ) ) ( not ( = ?auto_205006 ?auto_205008 ) ) ( not ( = ?auto_205006 ?auto_205010 ) ) ( ON ?auto_205007 ?auto_205006 ) ( ON ?auto_205008 ?auto_205007 ) ( ON ?auto_205010 ?auto_205008 ) ( CLEAR ?auto_205010 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_205002 ?auto_205003 ?auto_205004 ?auto_205005 ?auto_205009 ?auto_205006 ?auto_205007 ?auto_205008 )
      ( MAKE-4PILE ?auto_205002 ?auto_205003 ?auto_205004 ?auto_205005 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_205016 - BLOCK
      ?auto_205017 - BLOCK
      ?auto_205018 - BLOCK
      ?auto_205019 - BLOCK
      ?auto_205020 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_205020 ) ( CLEAR ?auto_205019 ) ( ON-TABLE ?auto_205016 ) ( ON ?auto_205017 ?auto_205016 ) ( ON ?auto_205018 ?auto_205017 ) ( ON ?auto_205019 ?auto_205018 ) ( not ( = ?auto_205016 ?auto_205017 ) ) ( not ( = ?auto_205016 ?auto_205018 ) ) ( not ( = ?auto_205016 ?auto_205019 ) ) ( not ( = ?auto_205016 ?auto_205020 ) ) ( not ( = ?auto_205017 ?auto_205018 ) ) ( not ( = ?auto_205017 ?auto_205019 ) ) ( not ( = ?auto_205017 ?auto_205020 ) ) ( not ( = ?auto_205018 ?auto_205019 ) ) ( not ( = ?auto_205018 ?auto_205020 ) ) ( not ( = ?auto_205019 ?auto_205020 ) ) )
    :subtasks
    ( ( !STACK ?auto_205020 ?auto_205019 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_205021 - BLOCK
      ?auto_205022 - BLOCK
      ?auto_205023 - BLOCK
      ?auto_205024 - BLOCK
      ?auto_205025 - BLOCK
    )
    :vars
    (
      ?auto_205026 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_205024 ) ( ON-TABLE ?auto_205021 ) ( ON ?auto_205022 ?auto_205021 ) ( ON ?auto_205023 ?auto_205022 ) ( ON ?auto_205024 ?auto_205023 ) ( not ( = ?auto_205021 ?auto_205022 ) ) ( not ( = ?auto_205021 ?auto_205023 ) ) ( not ( = ?auto_205021 ?auto_205024 ) ) ( not ( = ?auto_205021 ?auto_205025 ) ) ( not ( = ?auto_205022 ?auto_205023 ) ) ( not ( = ?auto_205022 ?auto_205024 ) ) ( not ( = ?auto_205022 ?auto_205025 ) ) ( not ( = ?auto_205023 ?auto_205024 ) ) ( not ( = ?auto_205023 ?auto_205025 ) ) ( not ( = ?auto_205024 ?auto_205025 ) ) ( ON ?auto_205025 ?auto_205026 ) ( CLEAR ?auto_205025 ) ( HAND-EMPTY ) ( not ( = ?auto_205021 ?auto_205026 ) ) ( not ( = ?auto_205022 ?auto_205026 ) ) ( not ( = ?auto_205023 ?auto_205026 ) ) ( not ( = ?auto_205024 ?auto_205026 ) ) ( not ( = ?auto_205025 ?auto_205026 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_205025 ?auto_205026 )
      ( MAKE-5PILE ?auto_205021 ?auto_205022 ?auto_205023 ?auto_205024 ?auto_205025 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_205027 - BLOCK
      ?auto_205028 - BLOCK
      ?auto_205029 - BLOCK
      ?auto_205030 - BLOCK
      ?auto_205031 - BLOCK
    )
    :vars
    (
      ?auto_205032 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_205027 ) ( ON ?auto_205028 ?auto_205027 ) ( ON ?auto_205029 ?auto_205028 ) ( not ( = ?auto_205027 ?auto_205028 ) ) ( not ( = ?auto_205027 ?auto_205029 ) ) ( not ( = ?auto_205027 ?auto_205030 ) ) ( not ( = ?auto_205027 ?auto_205031 ) ) ( not ( = ?auto_205028 ?auto_205029 ) ) ( not ( = ?auto_205028 ?auto_205030 ) ) ( not ( = ?auto_205028 ?auto_205031 ) ) ( not ( = ?auto_205029 ?auto_205030 ) ) ( not ( = ?auto_205029 ?auto_205031 ) ) ( not ( = ?auto_205030 ?auto_205031 ) ) ( ON ?auto_205031 ?auto_205032 ) ( CLEAR ?auto_205031 ) ( not ( = ?auto_205027 ?auto_205032 ) ) ( not ( = ?auto_205028 ?auto_205032 ) ) ( not ( = ?auto_205029 ?auto_205032 ) ) ( not ( = ?auto_205030 ?auto_205032 ) ) ( not ( = ?auto_205031 ?auto_205032 ) ) ( HOLDING ?auto_205030 ) ( CLEAR ?auto_205029 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_205027 ?auto_205028 ?auto_205029 ?auto_205030 )
      ( MAKE-5PILE ?auto_205027 ?auto_205028 ?auto_205029 ?auto_205030 ?auto_205031 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_205033 - BLOCK
      ?auto_205034 - BLOCK
      ?auto_205035 - BLOCK
      ?auto_205036 - BLOCK
      ?auto_205037 - BLOCK
    )
    :vars
    (
      ?auto_205038 - BLOCK
      ?auto_205040 - BLOCK
      ?auto_205039 - BLOCK
      ?auto_205041 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_205033 ) ( ON ?auto_205034 ?auto_205033 ) ( ON ?auto_205035 ?auto_205034 ) ( not ( = ?auto_205033 ?auto_205034 ) ) ( not ( = ?auto_205033 ?auto_205035 ) ) ( not ( = ?auto_205033 ?auto_205036 ) ) ( not ( = ?auto_205033 ?auto_205037 ) ) ( not ( = ?auto_205034 ?auto_205035 ) ) ( not ( = ?auto_205034 ?auto_205036 ) ) ( not ( = ?auto_205034 ?auto_205037 ) ) ( not ( = ?auto_205035 ?auto_205036 ) ) ( not ( = ?auto_205035 ?auto_205037 ) ) ( not ( = ?auto_205036 ?auto_205037 ) ) ( ON ?auto_205037 ?auto_205038 ) ( not ( = ?auto_205033 ?auto_205038 ) ) ( not ( = ?auto_205034 ?auto_205038 ) ) ( not ( = ?auto_205035 ?auto_205038 ) ) ( not ( = ?auto_205036 ?auto_205038 ) ) ( not ( = ?auto_205037 ?auto_205038 ) ) ( CLEAR ?auto_205035 ) ( ON ?auto_205036 ?auto_205037 ) ( CLEAR ?auto_205036 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_205040 ) ( ON ?auto_205039 ?auto_205040 ) ( ON ?auto_205041 ?auto_205039 ) ( ON ?auto_205038 ?auto_205041 ) ( not ( = ?auto_205040 ?auto_205039 ) ) ( not ( = ?auto_205040 ?auto_205041 ) ) ( not ( = ?auto_205040 ?auto_205038 ) ) ( not ( = ?auto_205040 ?auto_205037 ) ) ( not ( = ?auto_205040 ?auto_205036 ) ) ( not ( = ?auto_205039 ?auto_205041 ) ) ( not ( = ?auto_205039 ?auto_205038 ) ) ( not ( = ?auto_205039 ?auto_205037 ) ) ( not ( = ?auto_205039 ?auto_205036 ) ) ( not ( = ?auto_205041 ?auto_205038 ) ) ( not ( = ?auto_205041 ?auto_205037 ) ) ( not ( = ?auto_205041 ?auto_205036 ) ) ( not ( = ?auto_205033 ?auto_205040 ) ) ( not ( = ?auto_205033 ?auto_205039 ) ) ( not ( = ?auto_205033 ?auto_205041 ) ) ( not ( = ?auto_205034 ?auto_205040 ) ) ( not ( = ?auto_205034 ?auto_205039 ) ) ( not ( = ?auto_205034 ?auto_205041 ) ) ( not ( = ?auto_205035 ?auto_205040 ) ) ( not ( = ?auto_205035 ?auto_205039 ) ) ( not ( = ?auto_205035 ?auto_205041 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_205040 ?auto_205039 ?auto_205041 ?auto_205038 ?auto_205037 )
      ( MAKE-5PILE ?auto_205033 ?auto_205034 ?auto_205035 ?auto_205036 ?auto_205037 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_205042 - BLOCK
      ?auto_205043 - BLOCK
      ?auto_205044 - BLOCK
      ?auto_205045 - BLOCK
      ?auto_205046 - BLOCK
    )
    :vars
    (
      ?auto_205047 - BLOCK
      ?auto_205049 - BLOCK
      ?auto_205048 - BLOCK
      ?auto_205050 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_205042 ) ( ON ?auto_205043 ?auto_205042 ) ( not ( = ?auto_205042 ?auto_205043 ) ) ( not ( = ?auto_205042 ?auto_205044 ) ) ( not ( = ?auto_205042 ?auto_205045 ) ) ( not ( = ?auto_205042 ?auto_205046 ) ) ( not ( = ?auto_205043 ?auto_205044 ) ) ( not ( = ?auto_205043 ?auto_205045 ) ) ( not ( = ?auto_205043 ?auto_205046 ) ) ( not ( = ?auto_205044 ?auto_205045 ) ) ( not ( = ?auto_205044 ?auto_205046 ) ) ( not ( = ?auto_205045 ?auto_205046 ) ) ( ON ?auto_205046 ?auto_205047 ) ( not ( = ?auto_205042 ?auto_205047 ) ) ( not ( = ?auto_205043 ?auto_205047 ) ) ( not ( = ?auto_205044 ?auto_205047 ) ) ( not ( = ?auto_205045 ?auto_205047 ) ) ( not ( = ?auto_205046 ?auto_205047 ) ) ( ON ?auto_205045 ?auto_205046 ) ( CLEAR ?auto_205045 ) ( ON-TABLE ?auto_205049 ) ( ON ?auto_205048 ?auto_205049 ) ( ON ?auto_205050 ?auto_205048 ) ( ON ?auto_205047 ?auto_205050 ) ( not ( = ?auto_205049 ?auto_205048 ) ) ( not ( = ?auto_205049 ?auto_205050 ) ) ( not ( = ?auto_205049 ?auto_205047 ) ) ( not ( = ?auto_205049 ?auto_205046 ) ) ( not ( = ?auto_205049 ?auto_205045 ) ) ( not ( = ?auto_205048 ?auto_205050 ) ) ( not ( = ?auto_205048 ?auto_205047 ) ) ( not ( = ?auto_205048 ?auto_205046 ) ) ( not ( = ?auto_205048 ?auto_205045 ) ) ( not ( = ?auto_205050 ?auto_205047 ) ) ( not ( = ?auto_205050 ?auto_205046 ) ) ( not ( = ?auto_205050 ?auto_205045 ) ) ( not ( = ?auto_205042 ?auto_205049 ) ) ( not ( = ?auto_205042 ?auto_205048 ) ) ( not ( = ?auto_205042 ?auto_205050 ) ) ( not ( = ?auto_205043 ?auto_205049 ) ) ( not ( = ?auto_205043 ?auto_205048 ) ) ( not ( = ?auto_205043 ?auto_205050 ) ) ( not ( = ?auto_205044 ?auto_205049 ) ) ( not ( = ?auto_205044 ?auto_205048 ) ) ( not ( = ?auto_205044 ?auto_205050 ) ) ( HOLDING ?auto_205044 ) ( CLEAR ?auto_205043 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_205042 ?auto_205043 ?auto_205044 )
      ( MAKE-5PILE ?auto_205042 ?auto_205043 ?auto_205044 ?auto_205045 ?auto_205046 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_205051 - BLOCK
      ?auto_205052 - BLOCK
      ?auto_205053 - BLOCK
      ?auto_205054 - BLOCK
      ?auto_205055 - BLOCK
    )
    :vars
    (
      ?auto_205057 - BLOCK
      ?auto_205058 - BLOCK
      ?auto_205059 - BLOCK
      ?auto_205056 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_205051 ) ( ON ?auto_205052 ?auto_205051 ) ( not ( = ?auto_205051 ?auto_205052 ) ) ( not ( = ?auto_205051 ?auto_205053 ) ) ( not ( = ?auto_205051 ?auto_205054 ) ) ( not ( = ?auto_205051 ?auto_205055 ) ) ( not ( = ?auto_205052 ?auto_205053 ) ) ( not ( = ?auto_205052 ?auto_205054 ) ) ( not ( = ?auto_205052 ?auto_205055 ) ) ( not ( = ?auto_205053 ?auto_205054 ) ) ( not ( = ?auto_205053 ?auto_205055 ) ) ( not ( = ?auto_205054 ?auto_205055 ) ) ( ON ?auto_205055 ?auto_205057 ) ( not ( = ?auto_205051 ?auto_205057 ) ) ( not ( = ?auto_205052 ?auto_205057 ) ) ( not ( = ?auto_205053 ?auto_205057 ) ) ( not ( = ?auto_205054 ?auto_205057 ) ) ( not ( = ?auto_205055 ?auto_205057 ) ) ( ON ?auto_205054 ?auto_205055 ) ( ON-TABLE ?auto_205058 ) ( ON ?auto_205059 ?auto_205058 ) ( ON ?auto_205056 ?auto_205059 ) ( ON ?auto_205057 ?auto_205056 ) ( not ( = ?auto_205058 ?auto_205059 ) ) ( not ( = ?auto_205058 ?auto_205056 ) ) ( not ( = ?auto_205058 ?auto_205057 ) ) ( not ( = ?auto_205058 ?auto_205055 ) ) ( not ( = ?auto_205058 ?auto_205054 ) ) ( not ( = ?auto_205059 ?auto_205056 ) ) ( not ( = ?auto_205059 ?auto_205057 ) ) ( not ( = ?auto_205059 ?auto_205055 ) ) ( not ( = ?auto_205059 ?auto_205054 ) ) ( not ( = ?auto_205056 ?auto_205057 ) ) ( not ( = ?auto_205056 ?auto_205055 ) ) ( not ( = ?auto_205056 ?auto_205054 ) ) ( not ( = ?auto_205051 ?auto_205058 ) ) ( not ( = ?auto_205051 ?auto_205059 ) ) ( not ( = ?auto_205051 ?auto_205056 ) ) ( not ( = ?auto_205052 ?auto_205058 ) ) ( not ( = ?auto_205052 ?auto_205059 ) ) ( not ( = ?auto_205052 ?auto_205056 ) ) ( not ( = ?auto_205053 ?auto_205058 ) ) ( not ( = ?auto_205053 ?auto_205059 ) ) ( not ( = ?auto_205053 ?auto_205056 ) ) ( CLEAR ?auto_205052 ) ( ON ?auto_205053 ?auto_205054 ) ( CLEAR ?auto_205053 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_205058 ?auto_205059 ?auto_205056 ?auto_205057 ?auto_205055 ?auto_205054 )
      ( MAKE-5PILE ?auto_205051 ?auto_205052 ?auto_205053 ?auto_205054 ?auto_205055 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_205060 - BLOCK
      ?auto_205061 - BLOCK
      ?auto_205062 - BLOCK
      ?auto_205063 - BLOCK
      ?auto_205064 - BLOCK
    )
    :vars
    (
      ?auto_205068 - BLOCK
      ?auto_205065 - BLOCK
      ?auto_205066 - BLOCK
      ?auto_205067 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_205060 ) ( not ( = ?auto_205060 ?auto_205061 ) ) ( not ( = ?auto_205060 ?auto_205062 ) ) ( not ( = ?auto_205060 ?auto_205063 ) ) ( not ( = ?auto_205060 ?auto_205064 ) ) ( not ( = ?auto_205061 ?auto_205062 ) ) ( not ( = ?auto_205061 ?auto_205063 ) ) ( not ( = ?auto_205061 ?auto_205064 ) ) ( not ( = ?auto_205062 ?auto_205063 ) ) ( not ( = ?auto_205062 ?auto_205064 ) ) ( not ( = ?auto_205063 ?auto_205064 ) ) ( ON ?auto_205064 ?auto_205068 ) ( not ( = ?auto_205060 ?auto_205068 ) ) ( not ( = ?auto_205061 ?auto_205068 ) ) ( not ( = ?auto_205062 ?auto_205068 ) ) ( not ( = ?auto_205063 ?auto_205068 ) ) ( not ( = ?auto_205064 ?auto_205068 ) ) ( ON ?auto_205063 ?auto_205064 ) ( ON-TABLE ?auto_205065 ) ( ON ?auto_205066 ?auto_205065 ) ( ON ?auto_205067 ?auto_205066 ) ( ON ?auto_205068 ?auto_205067 ) ( not ( = ?auto_205065 ?auto_205066 ) ) ( not ( = ?auto_205065 ?auto_205067 ) ) ( not ( = ?auto_205065 ?auto_205068 ) ) ( not ( = ?auto_205065 ?auto_205064 ) ) ( not ( = ?auto_205065 ?auto_205063 ) ) ( not ( = ?auto_205066 ?auto_205067 ) ) ( not ( = ?auto_205066 ?auto_205068 ) ) ( not ( = ?auto_205066 ?auto_205064 ) ) ( not ( = ?auto_205066 ?auto_205063 ) ) ( not ( = ?auto_205067 ?auto_205068 ) ) ( not ( = ?auto_205067 ?auto_205064 ) ) ( not ( = ?auto_205067 ?auto_205063 ) ) ( not ( = ?auto_205060 ?auto_205065 ) ) ( not ( = ?auto_205060 ?auto_205066 ) ) ( not ( = ?auto_205060 ?auto_205067 ) ) ( not ( = ?auto_205061 ?auto_205065 ) ) ( not ( = ?auto_205061 ?auto_205066 ) ) ( not ( = ?auto_205061 ?auto_205067 ) ) ( not ( = ?auto_205062 ?auto_205065 ) ) ( not ( = ?auto_205062 ?auto_205066 ) ) ( not ( = ?auto_205062 ?auto_205067 ) ) ( ON ?auto_205062 ?auto_205063 ) ( CLEAR ?auto_205062 ) ( HOLDING ?auto_205061 ) ( CLEAR ?auto_205060 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_205060 ?auto_205061 )
      ( MAKE-5PILE ?auto_205060 ?auto_205061 ?auto_205062 ?auto_205063 ?auto_205064 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_205069 - BLOCK
      ?auto_205070 - BLOCK
      ?auto_205071 - BLOCK
      ?auto_205072 - BLOCK
      ?auto_205073 - BLOCK
    )
    :vars
    (
      ?auto_205077 - BLOCK
      ?auto_205076 - BLOCK
      ?auto_205075 - BLOCK
      ?auto_205074 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_205069 ) ( not ( = ?auto_205069 ?auto_205070 ) ) ( not ( = ?auto_205069 ?auto_205071 ) ) ( not ( = ?auto_205069 ?auto_205072 ) ) ( not ( = ?auto_205069 ?auto_205073 ) ) ( not ( = ?auto_205070 ?auto_205071 ) ) ( not ( = ?auto_205070 ?auto_205072 ) ) ( not ( = ?auto_205070 ?auto_205073 ) ) ( not ( = ?auto_205071 ?auto_205072 ) ) ( not ( = ?auto_205071 ?auto_205073 ) ) ( not ( = ?auto_205072 ?auto_205073 ) ) ( ON ?auto_205073 ?auto_205077 ) ( not ( = ?auto_205069 ?auto_205077 ) ) ( not ( = ?auto_205070 ?auto_205077 ) ) ( not ( = ?auto_205071 ?auto_205077 ) ) ( not ( = ?auto_205072 ?auto_205077 ) ) ( not ( = ?auto_205073 ?auto_205077 ) ) ( ON ?auto_205072 ?auto_205073 ) ( ON-TABLE ?auto_205076 ) ( ON ?auto_205075 ?auto_205076 ) ( ON ?auto_205074 ?auto_205075 ) ( ON ?auto_205077 ?auto_205074 ) ( not ( = ?auto_205076 ?auto_205075 ) ) ( not ( = ?auto_205076 ?auto_205074 ) ) ( not ( = ?auto_205076 ?auto_205077 ) ) ( not ( = ?auto_205076 ?auto_205073 ) ) ( not ( = ?auto_205076 ?auto_205072 ) ) ( not ( = ?auto_205075 ?auto_205074 ) ) ( not ( = ?auto_205075 ?auto_205077 ) ) ( not ( = ?auto_205075 ?auto_205073 ) ) ( not ( = ?auto_205075 ?auto_205072 ) ) ( not ( = ?auto_205074 ?auto_205077 ) ) ( not ( = ?auto_205074 ?auto_205073 ) ) ( not ( = ?auto_205074 ?auto_205072 ) ) ( not ( = ?auto_205069 ?auto_205076 ) ) ( not ( = ?auto_205069 ?auto_205075 ) ) ( not ( = ?auto_205069 ?auto_205074 ) ) ( not ( = ?auto_205070 ?auto_205076 ) ) ( not ( = ?auto_205070 ?auto_205075 ) ) ( not ( = ?auto_205070 ?auto_205074 ) ) ( not ( = ?auto_205071 ?auto_205076 ) ) ( not ( = ?auto_205071 ?auto_205075 ) ) ( not ( = ?auto_205071 ?auto_205074 ) ) ( ON ?auto_205071 ?auto_205072 ) ( CLEAR ?auto_205069 ) ( ON ?auto_205070 ?auto_205071 ) ( CLEAR ?auto_205070 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_205076 ?auto_205075 ?auto_205074 ?auto_205077 ?auto_205073 ?auto_205072 ?auto_205071 )
      ( MAKE-5PILE ?auto_205069 ?auto_205070 ?auto_205071 ?auto_205072 ?auto_205073 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_205078 - BLOCK
      ?auto_205079 - BLOCK
      ?auto_205080 - BLOCK
      ?auto_205081 - BLOCK
      ?auto_205082 - BLOCK
    )
    :vars
    (
      ?auto_205083 - BLOCK
      ?auto_205084 - BLOCK
      ?auto_205086 - BLOCK
      ?auto_205085 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_205078 ?auto_205079 ) ) ( not ( = ?auto_205078 ?auto_205080 ) ) ( not ( = ?auto_205078 ?auto_205081 ) ) ( not ( = ?auto_205078 ?auto_205082 ) ) ( not ( = ?auto_205079 ?auto_205080 ) ) ( not ( = ?auto_205079 ?auto_205081 ) ) ( not ( = ?auto_205079 ?auto_205082 ) ) ( not ( = ?auto_205080 ?auto_205081 ) ) ( not ( = ?auto_205080 ?auto_205082 ) ) ( not ( = ?auto_205081 ?auto_205082 ) ) ( ON ?auto_205082 ?auto_205083 ) ( not ( = ?auto_205078 ?auto_205083 ) ) ( not ( = ?auto_205079 ?auto_205083 ) ) ( not ( = ?auto_205080 ?auto_205083 ) ) ( not ( = ?auto_205081 ?auto_205083 ) ) ( not ( = ?auto_205082 ?auto_205083 ) ) ( ON ?auto_205081 ?auto_205082 ) ( ON-TABLE ?auto_205084 ) ( ON ?auto_205086 ?auto_205084 ) ( ON ?auto_205085 ?auto_205086 ) ( ON ?auto_205083 ?auto_205085 ) ( not ( = ?auto_205084 ?auto_205086 ) ) ( not ( = ?auto_205084 ?auto_205085 ) ) ( not ( = ?auto_205084 ?auto_205083 ) ) ( not ( = ?auto_205084 ?auto_205082 ) ) ( not ( = ?auto_205084 ?auto_205081 ) ) ( not ( = ?auto_205086 ?auto_205085 ) ) ( not ( = ?auto_205086 ?auto_205083 ) ) ( not ( = ?auto_205086 ?auto_205082 ) ) ( not ( = ?auto_205086 ?auto_205081 ) ) ( not ( = ?auto_205085 ?auto_205083 ) ) ( not ( = ?auto_205085 ?auto_205082 ) ) ( not ( = ?auto_205085 ?auto_205081 ) ) ( not ( = ?auto_205078 ?auto_205084 ) ) ( not ( = ?auto_205078 ?auto_205086 ) ) ( not ( = ?auto_205078 ?auto_205085 ) ) ( not ( = ?auto_205079 ?auto_205084 ) ) ( not ( = ?auto_205079 ?auto_205086 ) ) ( not ( = ?auto_205079 ?auto_205085 ) ) ( not ( = ?auto_205080 ?auto_205084 ) ) ( not ( = ?auto_205080 ?auto_205086 ) ) ( not ( = ?auto_205080 ?auto_205085 ) ) ( ON ?auto_205080 ?auto_205081 ) ( ON ?auto_205079 ?auto_205080 ) ( CLEAR ?auto_205079 ) ( HOLDING ?auto_205078 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_205078 )
      ( MAKE-5PILE ?auto_205078 ?auto_205079 ?auto_205080 ?auto_205081 ?auto_205082 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_205087 - BLOCK
      ?auto_205088 - BLOCK
      ?auto_205089 - BLOCK
      ?auto_205090 - BLOCK
      ?auto_205091 - BLOCK
    )
    :vars
    (
      ?auto_205094 - BLOCK
      ?auto_205092 - BLOCK
      ?auto_205095 - BLOCK
      ?auto_205093 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_205087 ?auto_205088 ) ) ( not ( = ?auto_205087 ?auto_205089 ) ) ( not ( = ?auto_205087 ?auto_205090 ) ) ( not ( = ?auto_205087 ?auto_205091 ) ) ( not ( = ?auto_205088 ?auto_205089 ) ) ( not ( = ?auto_205088 ?auto_205090 ) ) ( not ( = ?auto_205088 ?auto_205091 ) ) ( not ( = ?auto_205089 ?auto_205090 ) ) ( not ( = ?auto_205089 ?auto_205091 ) ) ( not ( = ?auto_205090 ?auto_205091 ) ) ( ON ?auto_205091 ?auto_205094 ) ( not ( = ?auto_205087 ?auto_205094 ) ) ( not ( = ?auto_205088 ?auto_205094 ) ) ( not ( = ?auto_205089 ?auto_205094 ) ) ( not ( = ?auto_205090 ?auto_205094 ) ) ( not ( = ?auto_205091 ?auto_205094 ) ) ( ON ?auto_205090 ?auto_205091 ) ( ON-TABLE ?auto_205092 ) ( ON ?auto_205095 ?auto_205092 ) ( ON ?auto_205093 ?auto_205095 ) ( ON ?auto_205094 ?auto_205093 ) ( not ( = ?auto_205092 ?auto_205095 ) ) ( not ( = ?auto_205092 ?auto_205093 ) ) ( not ( = ?auto_205092 ?auto_205094 ) ) ( not ( = ?auto_205092 ?auto_205091 ) ) ( not ( = ?auto_205092 ?auto_205090 ) ) ( not ( = ?auto_205095 ?auto_205093 ) ) ( not ( = ?auto_205095 ?auto_205094 ) ) ( not ( = ?auto_205095 ?auto_205091 ) ) ( not ( = ?auto_205095 ?auto_205090 ) ) ( not ( = ?auto_205093 ?auto_205094 ) ) ( not ( = ?auto_205093 ?auto_205091 ) ) ( not ( = ?auto_205093 ?auto_205090 ) ) ( not ( = ?auto_205087 ?auto_205092 ) ) ( not ( = ?auto_205087 ?auto_205095 ) ) ( not ( = ?auto_205087 ?auto_205093 ) ) ( not ( = ?auto_205088 ?auto_205092 ) ) ( not ( = ?auto_205088 ?auto_205095 ) ) ( not ( = ?auto_205088 ?auto_205093 ) ) ( not ( = ?auto_205089 ?auto_205092 ) ) ( not ( = ?auto_205089 ?auto_205095 ) ) ( not ( = ?auto_205089 ?auto_205093 ) ) ( ON ?auto_205089 ?auto_205090 ) ( ON ?auto_205088 ?auto_205089 ) ( ON ?auto_205087 ?auto_205088 ) ( CLEAR ?auto_205087 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_205092 ?auto_205095 ?auto_205093 ?auto_205094 ?auto_205091 ?auto_205090 ?auto_205089 ?auto_205088 )
      ( MAKE-5PILE ?auto_205087 ?auto_205088 ?auto_205089 ?auto_205090 ?auto_205091 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_205099 - BLOCK
      ?auto_205100 - BLOCK
      ?auto_205101 - BLOCK
    )
    :vars
    (
      ?auto_205102 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205102 ?auto_205101 ) ( CLEAR ?auto_205102 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_205099 ) ( ON ?auto_205100 ?auto_205099 ) ( ON ?auto_205101 ?auto_205100 ) ( not ( = ?auto_205099 ?auto_205100 ) ) ( not ( = ?auto_205099 ?auto_205101 ) ) ( not ( = ?auto_205099 ?auto_205102 ) ) ( not ( = ?auto_205100 ?auto_205101 ) ) ( not ( = ?auto_205100 ?auto_205102 ) ) ( not ( = ?auto_205101 ?auto_205102 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_205102 ?auto_205101 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_205103 - BLOCK
      ?auto_205104 - BLOCK
      ?auto_205105 - BLOCK
    )
    :vars
    (
      ?auto_205106 - BLOCK
      ?auto_205107 - BLOCK
      ?auto_205108 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205106 ?auto_205105 ) ( CLEAR ?auto_205106 ) ( ON-TABLE ?auto_205103 ) ( ON ?auto_205104 ?auto_205103 ) ( ON ?auto_205105 ?auto_205104 ) ( not ( = ?auto_205103 ?auto_205104 ) ) ( not ( = ?auto_205103 ?auto_205105 ) ) ( not ( = ?auto_205103 ?auto_205106 ) ) ( not ( = ?auto_205104 ?auto_205105 ) ) ( not ( = ?auto_205104 ?auto_205106 ) ) ( not ( = ?auto_205105 ?auto_205106 ) ) ( HOLDING ?auto_205107 ) ( CLEAR ?auto_205108 ) ( not ( = ?auto_205103 ?auto_205107 ) ) ( not ( = ?auto_205103 ?auto_205108 ) ) ( not ( = ?auto_205104 ?auto_205107 ) ) ( not ( = ?auto_205104 ?auto_205108 ) ) ( not ( = ?auto_205105 ?auto_205107 ) ) ( not ( = ?auto_205105 ?auto_205108 ) ) ( not ( = ?auto_205106 ?auto_205107 ) ) ( not ( = ?auto_205106 ?auto_205108 ) ) ( not ( = ?auto_205107 ?auto_205108 ) ) )
    :subtasks
    ( ( !STACK ?auto_205107 ?auto_205108 )
      ( MAKE-3PILE ?auto_205103 ?auto_205104 ?auto_205105 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_205109 - BLOCK
      ?auto_205110 - BLOCK
      ?auto_205111 - BLOCK
    )
    :vars
    (
      ?auto_205114 - BLOCK
      ?auto_205113 - BLOCK
      ?auto_205112 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205114 ?auto_205111 ) ( ON-TABLE ?auto_205109 ) ( ON ?auto_205110 ?auto_205109 ) ( ON ?auto_205111 ?auto_205110 ) ( not ( = ?auto_205109 ?auto_205110 ) ) ( not ( = ?auto_205109 ?auto_205111 ) ) ( not ( = ?auto_205109 ?auto_205114 ) ) ( not ( = ?auto_205110 ?auto_205111 ) ) ( not ( = ?auto_205110 ?auto_205114 ) ) ( not ( = ?auto_205111 ?auto_205114 ) ) ( CLEAR ?auto_205113 ) ( not ( = ?auto_205109 ?auto_205112 ) ) ( not ( = ?auto_205109 ?auto_205113 ) ) ( not ( = ?auto_205110 ?auto_205112 ) ) ( not ( = ?auto_205110 ?auto_205113 ) ) ( not ( = ?auto_205111 ?auto_205112 ) ) ( not ( = ?auto_205111 ?auto_205113 ) ) ( not ( = ?auto_205114 ?auto_205112 ) ) ( not ( = ?auto_205114 ?auto_205113 ) ) ( not ( = ?auto_205112 ?auto_205113 ) ) ( ON ?auto_205112 ?auto_205114 ) ( CLEAR ?auto_205112 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_205109 ?auto_205110 ?auto_205111 ?auto_205114 )
      ( MAKE-3PILE ?auto_205109 ?auto_205110 ?auto_205111 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_205115 - BLOCK
      ?auto_205116 - BLOCK
      ?auto_205117 - BLOCK
    )
    :vars
    (
      ?auto_205118 - BLOCK
      ?auto_205119 - BLOCK
      ?auto_205120 - BLOCK
      ?auto_205122 - BLOCK
      ?auto_205123 - BLOCK
      ?auto_205121 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205118 ?auto_205117 ) ( ON-TABLE ?auto_205115 ) ( ON ?auto_205116 ?auto_205115 ) ( ON ?auto_205117 ?auto_205116 ) ( not ( = ?auto_205115 ?auto_205116 ) ) ( not ( = ?auto_205115 ?auto_205117 ) ) ( not ( = ?auto_205115 ?auto_205118 ) ) ( not ( = ?auto_205116 ?auto_205117 ) ) ( not ( = ?auto_205116 ?auto_205118 ) ) ( not ( = ?auto_205117 ?auto_205118 ) ) ( not ( = ?auto_205115 ?auto_205119 ) ) ( not ( = ?auto_205115 ?auto_205120 ) ) ( not ( = ?auto_205116 ?auto_205119 ) ) ( not ( = ?auto_205116 ?auto_205120 ) ) ( not ( = ?auto_205117 ?auto_205119 ) ) ( not ( = ?auto_205117 ?auto_205120 ) ) ( not ( = ?auto_205118 ?auto_205119 ) ) ( not ( = ?auto_205118 ?auto_205120 ) ) ( not ( = ?auto_205119 ?auto_205120 ) ) ( ON ?auto_205119 ?auto_205118 ) ( CLEAR ?auto_205119 ) ( HOLDING ?auto_205120 ) ( CLEAR ?auto_205122 ) ( ON-TABLE ?auto_205123 ) ( ON ?auto_205121 ?auto_205123 ) ( ON ?auto_205122 ?auto_205121 ) ( not ( = ?auto_205123 ?auto_205121 ) ) ( not ( = ?auto_205123 ?auto_205122 ) ) ( not ( = ?auto_205123 ?auto_205120 ) ) ( not ( = ?auto_205121 ?auto_205122 ) ) ( not ( = ?auto_205121 ?auto_205120 ) ) ( not ( = ?auto_205122 ?auto_205120 ) ) ( not ( = ?auto_205115 ?auto_205122 ) ) ( not ( = ?auto_205115 ?auto_205123 ) ) ( not ( = ?auto_205115 ?auto_205121 ) ) ( not ( = ?auto_205116 ?auto_205122 ) ) ( not ( = ?auto_205116 ?auto_205123 ) ) ( not ( = ?auto_205116 ?auto_205121 ) ) ( not ( = ?auto_205117 ?auto_205122 ) ) ( not ( = ?auto_205117 ?auto_205123 ) ) ( not ( = ?auto_205117 ?auto_205121 ) ) ( not ( = ?auto_205118 ?auto_205122 ) ) ( not ( = ?auto_205118 ?auto_205123 ) ) ( not ( = ?auto_205118 ?auto_205121 ) ) ( not ( = ?auto_205119 ?auto_205122 ) ) ( not ( = ?auto_205119 ?auto_205123 ) ) ( not ( = ?auto_205119 ?auto_205121 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_205123 ?auto_205121 ?auto_205122 ?auto_205120 )
      ( MAKE-3PILE ?auto_205115 ?auto_205116 ?auto_205117 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_205124 - BLOCK
      ?auto_205125 - BLOCK
      ?auto_205126 - BLOCK
    )
    :vars
    (
      ?auto_205127 - BLOCK
      ?auto_205132 - BLOCK
      ?auto_205130 - BLOCK
      ?auto_205131 - BLOCK
      ?auto_205129 - BLOCK
      ?auto_205128 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205127 ?auto_205126 ) ( ON-TABLE ?auto_205124 ) ( ON ?auto_205125 ?auto_205124 ) ( ON ?auto_205126 ?auto_205125 ) ( not ( = ?auto_205124 ?auto_205125 ) ) ( not ( = ?auto_205124 ?auto_205126 ) ) ( not ( = ?auto_205124 ?auto_205127 ) ) ( not ( = ?auto_205125 ?auto_205126 ) ) ( not ( = ?auto_205125 ?auto_205127 ) ) ( not ( = ?auto_205126 ?auto_205127 ) ) ( not ( = ?auto_205124 ?auto_205132 ) ) ( not ( = ?auto_205124 ?auto_205130 ) ) ( not ( = ?auto_205125 ?auto_205132 ) ) ( not ( = ?auto_205125 ?auto_205130 ) ) ( not ( = ?auto_205126 ?auto_205132 ) ) ( not ( = ?auto_205126 ?auto_205130 ) ) ( not ( = ?auto_205127 ?auto_205132 ) ) ( not ( = ?auto_205127 ?auto_205130 ) ) ( not ( = ?auto_205132 ?auto_205130 ) ) ( ON ?auto_205132 ?auto_205127 ) ( CLEAR ?auto_205131 ) ( ON-TABLE ?auto_205129 ) ( ON ?auto_205128 ?auto_205129 ) ( ON ?auto_205131 ?auto_205128 ) ( not ( = ?auto_205129 ?auto_205128 ) ) ( not ( = ?auto_205129 ?auto_205131 ) ) ( not ( = ?auto_205129 ?auto_205130 ) ) ( not ( = ?auto_205128 ?auto_205131 ) ) ( not ( = ?auto_205128 ?auto_205130 ) ) ( not ( = ?auto_205131 ?auto_205130 ) ) ( not ( = ?auto_205124 ?auto_205131 ) ) ( not ( = ?auto_205124 ?auto_205129 ) ) ( not ( = ?auto_205124 ?auto_205128 ) ) ( not ( = ?auto_205125 ?auto_205131 ) ) ( not ( = ?auto_205125 ?auto_205129 ) ) ( not ( = ?auto_205125 ?auto_205128 ) ) ( not ( = ?auto_205126 ?auto_205131 ) ) ( not ( = ?auto_205126 ?auto_205129 ) ) ( not ( = ?auto_205126 ?auto_205128 ) ) ( not ( = ?auto_205127 ?auto_205131 ) ) ( not ( = ?auto_205127 ?auto_205129 ) ) ( not ( = ?auto_205127 ?auto_205128 ) ) ( not ( = ?auto_205132 ?auto_205131 ) ) ( not ( = ?auto_205132 ?auto_205129 ) ) ( not ( = ?auto_205132 ?auto_205128 ) ) ( ON ?auto_205130 ?auto_205132 ) ( CLEAR ?auto_205130 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_205124 ?auto_205125 ?auto_205126 ?auto_205127 ?auto_205132 )
      ( MAKE-3PILE ?auto_205124 ?auto_205125 ?auto_205126 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_205133 - BLOCK
      ?auto_205134 - BLOCK
      ?auto_205135 - BLOCK
    )
    :vars
    (
      ?auto_205141 - BLOCK
      ?auto_205140 - BLOCK
      ?auto_205138 - BLOCK
      ?auto_205136 - BLOCK
      ?auto_205139 - BLOCK
      ?auto_205137 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205141 ?auto_205135 ) ( ON-TABLE ?auto_205133 ) ( ON ?auto_205134 ?auto_205133 ) ( ON ?auto_205135 ?auto_205134 ) ( not ( = ?auto_205133 ?auto_205134 ) ) ( not ( = ?auto_205133 ?auto_205135 ) ) ( not ( = ?auto_205133 ?auto_205141 ) ) ( not ( = ?auto_205134 ?auto_205135 ) ) ( not ( = ?auto_205134 ?auto_205141 ) ) ( not ( = ?auto_205135 ?auto_205141 ) ) ( not ( = ?auto_205133 ?auto_205140 ) ) ( not ( = ?auto_205133 ?auto_205138 ) ) ( not ( = ?auto_205134 ?auto_205140 ) ) ( not ( = ?auto_205134 ?auto_205138 ) ) ( not ( = ?auto_205135 ?auto_205140 ) ) ( not ( = ?auto_205135 ?auto_205138 ) ) ( not ( = ?auto_205141 ?auto_205140 ) ) ( not ( = ?auto_205141 ?auto_205138 ) ) ( not ( = ?auto_205140 ?auto_205138 ) ) ( ON ?auto_205140 ?auto_205141 ) ( ON-TABLE ?auto_205136 ) ( ON ?auto_205139 ?auto_205136 ) ( not ( = ?auto_205136 ?auto_205139 ) ) ( not ( = ?auto_205136 ?auto_205137 ) ) ( not ( = ?auto_205136 ?auto_205138 ) ) ( not ( = ?auto_205139 ?auto_205137 ) ) ( not ( = ?auto_205139 ?auto_205138 ) ) ( not ( = ?auto_205137 ?auto_205138 ) ) ( not ( = ?auto_205133 ?auto_205137 ) ) ( not ( = ?auto_205133 ?auto_205136 ) ) ( not ( = ?auto_205133 ?auto_205139 ) ) ( not ( = ?auto_205134 ?auto_205137 ) ) ( not ( = ?auto_205134 ?auto_205136 ) ) ( not ( = ?auto_205134 ?auto_205139 ) ) ( not ( = ?auto_205135 ?auto_205137 ) ) ( not ( = ?auto_205135 ?auto_205136 ) ) ( not ( = ?auto_205135 ?auto_205139 ) ) ( not ( = ?auto_205141 ?auto_205137 ) ) ( not ( = ?auto_205141 ?auto_205136 ) ) ( not ( = ?auto_205141 ?auto_205139 ) ) ( not ( = ?auto_205140 ?auto_205137 ) ) ( not ( = ?auto_205140 ?auto_205136 ) ) ( not ( = ?auto_205140 ?auto_205139 ) ) ( ON ?auto_205138 ?auto_205140 ) ( CLEAR ?auto_205138 ) ( HOLDING ?auto_205137 ) ( CLEAR ?auto_205139 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_205136 ?auto_205139 ?auto_205137 )
      ( MAKE-3PILE ?auto_205133 ?auto_205134 ?auto_205135 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_205142 - BLOCK
      ?auto_205143 - BLOCK
      ?auto_205144 - BLOCK
    )
    :vars
    (
      ?auto_205147 - BLOCK
      ?auto_205148 - BLOCK
      ?auto_205146 - BLOCK
      ?auto_205150 - BLOCK
      ?auto_205145 - BLOCK
      ?auto_205149 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205147 ?auto_205144 ) ( ON-TABLE ?auto_205142 ) ( ON ?auto_205143 ?auto_205142 ) ( ON ?auto_205144 ?auto_205143 ) ( not ( = ?auto_205142 ?auto_205143 ) ) ( not ( = ?auto_205142 ?auto_205144 ) ) ( not ( = ?auto_205142 ?auto_205147 ) ) ( not ( = ?auto_205143 ?auto_205144 ) ) ( not ( = ?auto_205143 ?auto_205147 ) ) ( not ( = ?auto_205144 ?auto_205147 ) ) ( not ( = ?auto_205142 ?auto_205148 ) ) ( not ( = ?auto_205142 ?auto_205146 ) ) ( not ( = ?auto_205143 ?auto_205148 ) ) ( not ( = ?auto_205143 ?auto_205146 ) ) ( not ( = ?auto_205144 ?auto_205148 ) ) ( not ( = ?auto_205144 ?auto_205146 ) ) ( not ( = ?auto_205147 ?auto_205148 ) ) ( not ( = ?auto_205147 ?auto_205146 ) ) ( not ( = ?auto_205148 ?auto_205146 ) ) ( ON ?auto_205148 ?auto_205147 ) ( ON-TABLE ?auto_205150 ) ( ON ?auto_205145 ?auto_205150 ) ( not ( = ?auto_205150 ?auto_205145 ) ) ( not ( = ?auto_205150 ?auto_205149 ) ) ( not ( = ?auto_205150 ?auto_205146 ) ) ( not ( = ?auto_205145 ?auto_205149 ) ) ( not ( = ?auto_205145 ?auto_205146 ) ) ( not ( = ?auto_205149 ?auto_205146 ) ) ( not ( = ?auto_205142 ?auto_205149 ) ) ( not ( = ?auto_205142 ?auto_205150 ) ) ( not ( = ?auto_205142 ?auto_205145 ) ) ( not ( = ?auto_205143 ?auto_205149 ) ) ( not ( = ?auto_205143 ?auto_205150 ) ) ( not ( = ?auto_205143 ?auto_205145 ) ) ( not ( = ?auto_205144 ?auto_205149 ) ) ( not ( = ?auto_205144 ?auto_205150 ) ) ( not ( = ?auto_205144 ?auto_205145 ) ) ( not ( = ?auto_205147 ?auto_205149 ) ) ( not ( = ?auto_205147 ?auto_205150 ) ) ( not ( = ?auto_205147 ?auto_205145 ) ) ( not ( = ?auto_205148 ?auto_205149 ) ) ( not ( = ?auto_205148 ?auto_205150 ) ) ( not ( = ?auto_205148 ?auto_205145 ) ) ( ON ?auto_205146 ?auto_205148 ) ( CLEAR ?auto_205145 ) ( ON ?auto_205149 ?auto_205146 ) ( CLEAR ?auto_205149 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_205142 ?auto_205143 ?auto_205144 ?auto_205147 ?auto_205148 ?auto_205146 )
      ( MAKE-3PILE ?auto_205142 ?auto_205143 ?auto_205144 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_205151 - BLOCK
      ?auto_205152 - BLOCK
      ?auto_205153 - BLOCK
    )
    :vars
    (
      ?auto_205154 - BLOCK
      ?auto_205159 - BLOCK
      ?auto_205157 - BLOCK
      ?auto_205156 - BLOCK
      ?auto_205158 - BLOCK
      ?auto_205155 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205154 ?auto_205153 ) ( ON-TABLE ?auto_205151 ) ( ON ?auto_205152 ?auto_205151 ) ( ON ?auto_205153 ?auto_205152 ) ( not ( = ?auto_205151 ?auto_205152 ) ) ( not ( = ?auto_205151 ?auto_205153 ) ) ( not ( = ?auto_205151 ?auto_205154 ) ) ( not ( = ?auto_205152 ?auto_205153 ) ) ( not ( = ?auto_205152 ?auto_205154 ) ) ( not ( = ?auto_205153 ?auto_205154 ) ) ( not ( = ?auto_205151 ?auto_205159 ) ) ( not ( = ?auto_205151 ?auto_205157 ) ) ( not ( = ?auto_205152 ?auto_205159 ) ) ( not ( = ?auto_205152 ?auto_205157 ) ) ( not ( = ?auto_205153 ?auto_205159 ) ) ( not ( = ?auto_205153 ?auto_205157 ) ) ( not ( = ?auto_205154 ?auto_205159 ) ) ( not ( = ?auto_205154 ?auto_205157 ) ) ( not ( = ?auto_205159 ?auto_205157 ) ) ( ON ?auto_205159 ?auto_205154 ) ( ON-TABLE ?auto_205156 ) ( not ( = ?auto_205156 ?auto_205158 ) ) ( not ( = ?auto_205156 ?auto_205155 ) ) ( not ( = ?auto_205156 ?auto_205157 ) ) ( not ( = ?auto_205158 ?auto_205155 ) ) ( not ( = ?auto_205158 ?auto_205157 ) ) ( not ( = ?auto_205155 ?auto_205157 ) ) ( not ( = ?auto_205151 ?auto_205155 ) ) ( not ( = ?auto_205151 ?auto_205156 ) ) ( not ( = ?auto_205151 ?auto_205158 ) ) ( not ( = ?auto_205152 ?auto_205155 ) ) ( not ( = ?auto_205152 ?auto_205156 ) ) ( not ( = ?auto_205152 ?auto_205158 ) ) ( not ( = ?auto_205153 ?auto_205155 ) ) ( not ( = ?auto_205153 ?auto_205156 ) ) ( not ( = ?auto_205153 ?auto_205158 ) ) ( not ( = ?auto_205154 ?auto_205155 ) ) ( not ( = ?auto_205154 ?auto_205156 ) ) ( not ( = ?auto_205154 ?auto_205158 ) ) ( not ( = ?auto_205159 ?auto_205155 ) ) ( not ( = ?auto_205159 ?auto_205156 ) ) ( not ( = ?auto_205159 ?auto_205158 ) ) ( ON ?auto_205157 ?auto_205159 ) ( ON ?auto_205155 ?auto_205157 ) ( CLEAR ?auto_205155 ) ( HOLDING ?auto_205158 ) ( CLEAR ?auto_205156 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_205156 ?auto_205158 )
      ( MAKE-3PILE ?auto_205151 ?auto_205152 ?auto_205153 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_205160 - BLOCK
      ?auto_205161 - BLOCK
      ?auto_205162 - BLOCK
    )
    :vars
    (
      ?auto_205167 - BLOCK
      ?auto_205165 - BLOCK
      ?auto_205164 - BLOCK
      ?auto_205166 - BLOCK
      ?auto_205168 - BLOCK
      ?auto_205163 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205167 ?auto_205162 ) ( ON-TABLE ?auto_205160 ) ( ON ?auto_205161 ?auto_205160 ) ( ON ?auto_205162 ?auto_205161 ) ( not ( = ?auto_205160 ?auto_205161 ) ) ( not ( = ?auto_205160 ?auto_205162 ) ) ( not ( = ?auto_205160 ?auto_205167 ) ) ( not ( = ?auto_205161 ?auto_205162 ) ) ( not ( = ?auto_205161 ?auto_205167 ) ) ( not ( = ?auto_205162 ?auto_205167 ) ) ( not ( = ?auto_205160 ?auto_205165 ) ) ( not ( = ?auto_205160 ?auto_205164 ) ) ( not ( = ?auto_205161 ?auto_205165 ) ) ( not ( = ?auto_205161 ?auto_205164 ) ) ( not ( = ?auto_205162 ?auto_205165 ) ) ( not ( = ?auto_205162 ?auto_205164 ) ) ( not ( = ?auto_205167 ?auto_205165 ) ) ( not ( = ?auto_205167 ?auto_205164 ) ) ( not ( = ?auto_205165 ?auto_205164 ) ) ( ON ?auto_205165 ?auto_205167 ) ( ON-TABLE ?auto_205166 ) ( not ( = ?auto_205166 ?auto_205168 ) ) ( not ( = ?auto_205166 ?auto_205163 ) ) ( not ( = ?auto_205166 ?auto_205164 ) ) ( not ( = ?auto_205168 ?auto_205163 ) ) ( not ( = ?auto_205168 ?auto_205164 ) ) ( not ( = ?auto_205163 ?auto_205164 ) ) ( not ( = ?auto_205160 ?auto_205163 ) ) ( not ( = ?auto_205160 ?auto_205166 ) ) ( not ( = ?auto_205160 ?auto_205168 ) ) ( not ( = ?auto_205161 ?auto_205163 ) ) ( not ( = ?auto_205161 ?auto_205166 ) ) ( not ( = ?auto_205161 ?auto_205168 ) ) ( not ( = ?auto_205162 ?auto_205163 ) ) ( not ( = ?auto_205162 ?auto_205166 ) ) ( not ( = ?auto_205162 ?auto_205168 ) ) ( not ( = ?auto_205167 ?auto_205163 ) ) ( not ( = ?auto_205167 ?auto_205166 ) ) ( not ( = ?auto_205167 ?auto_205168 ) ) ( not ( = ?auto_205165 ?auto_205163 ) ) ( not ( = ?auto_205165 ?auto_205166 ) ) ( not ( = ?auto_205165 ?auto_205168 ) ) ( ON ?auto_205164 ?auto_205165 ) ( ON ?auto_205163 ?auto_205164 ) ( CLEAR ?auto_205166 ) ( ON ?auto_205168 ?auto_205163 ) ( CLEAR ?auto_205168 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_205160 ?auto_205161 ?auto_205162 ?auto_205167 ?auto_205165 ?auto_205164 ?auto_205163 )
      ( MAKE-3PILE ?auto_205160 ?auto_205161 ?auto_205162 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_205169 - BLOCK
      ?auto_205170 - BLOCK
      ?auto_205171 - BLOCK
    )
    :vars
    (
      ?auto_205176 - BLOCK
      ?auto_205175 - BLOCK
      ?auto_205177 - BLOCK
      ?auto_205172 - BLOCK
      ?auto_205173 - BLOCK
      ?auto_205174 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205176 ?auto_205171 ) ( ON-TABLE ?auto_205169 ) ( ON ?auto_205170 ?auto_205169 ) ( ON ?auto_205171 ?auto_205170 ) ( not ( = ?auto_205169 ?auto_205170 ) ) ( not ( = ?auto_205169 ?auto_205171 ) ) ( not ( = ?auto_205169 ?auto_205176 ) ) ( not ( = ?auto_205170 ?auto_205171 ) ) ( not ( = ?auto_205170 ?auto_205176 ) ) ( not ( = ?auto_205171 ?auto_205176 ) ) ( not ( = ?auto_205169 ?auto_205175 ) ) ( not ( = ?auto_205169 ?auto_205177 ) ) ( not ( = ?auto_205170 ?auto_205175 ) ) ( not ( = ?auto_205170 ?auto_205177 ) ) ( not ( = ?auto_205171 ?auto_205175 ) ) ( not ( = ?auto_205171 ?auto_205177 ) ) ( not ( = ?auto_205176 ?auto_205175 ) ) ( not ( = ?auto_205176 ?auto_205177 ) ) ( not ( = ?auto_205175 ?auto_205177 ) ) ( ON ?auto_205175 ?auto_205176 ) ( not ( = ?auto_205172 ?auto_205173 ) ) ( not ( = ?auto_205172 ?auto_205174 ) ) ( not ( = ?auto_205172 ?auto_205177 ) ) ( not ( = ?auto_205173 ?auto_205174 ) ) ( not ( = ?auto_205173 ?auto_205177 ) ) ( not ( = ?auto_205174 ?auto_205177 ) ) ( not ( = ?auto_205169 ?auto_205174 ) ) ( not ( = ?auto_205169 ?auto_205172 ) ) ( not ( = ?auto_205169 ?auto_205173 ) ) ( not ( = ?auto_205170 ?auto_205174 ) ) ( not ( = ?auto_205170 ?auto_205172 ) ) ( not ( = ?auto_205170 ?auto_205173 ) ) ( not ( = ?auto_205171 ?auto_205174 ) ) ( not ( = ?auto_205171 ?auto_205172 ) ) ( not ( = ?auto_205171 ?auto_205173 ) ) ( not ( = ?auto_205176 ?auto_205174 ) ) ( not ( = ?auto_205176 ?auto_205172 ) ) ( not ( = ?auto_205176 ?auto_205173 ) ) ( not ( = ?auto_205175 ?auto_205174 ) ) ( not ( = ?auto_205175 ?auto_205172 ) ) ( not ( = ?auto_205175 ?auto_205173 ) ) ( ON ?auto_205177 ?auto_205175 ) ( ON ?auto_205174 ?auto_205177 ) ( ON ?auto_205173 ?auto_205174 ) ( CLEAR ?auto_205173 ) ( HOLDING ?auto_205172 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_205172 )
      ( MAKE-3PILE ?auto_205169 ?auto_205170 ?auto_205171 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_205178 - BLOCK
      ?auto_205179 - BLOCK
      ?auto_205180 - BLOCK
    )
    :vars
    (
      ?auto_205184 - BLOCK
      ?auto_205182 - BLOCK
      ?auto_205186 - BLOCK
      ?auto_205185 - BLOCK
      ?auto_205183 - BLOCK
      ?auto_205181 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205184 ?auto_205180 ) ( ON-TABLE ?auto_205178 ) ( ON ?auto_205179 ?auto_205178 ) ( ON ?auto_205180 ?auto_205179 ) ( not ( = ?auto_205178 ?auto_205179 ) ) ( not ( = ?auto_205178 ?auto_205180 ) ) ( not ( = ?auto_205178 ?auto_205184 ) ) ( not ( = ?auto_205179 ?auto_205180 ) ) ( not ( = ?auto_205179 ?auto_205184 ) ) ( not ( = ?auto_205180 ?auto_205184 ) ) ( not ( = ?auto_205178 ?auto_205182 ) ) ( not ( = ?auto_205178 ?auto_205186 ) ) ( not ( = ?auto_205179 ?auto_205182 ) ) ( not ( = ?auto_205179 ?auto_205186 ) ) ( not ( = ?auto_205180 ?auto_205182 ) ) ( not ( = ?auto_205180 ?auto_205186 ) ) ( not ( = ?auto_205184 ?auto_205182 ) ) ( not ( = ?auto_205184 ?auto_205186 ) ) ( not ( = ?auto_205182 ?auto_205186 ) ) ( ON ?auto_205182 ?auto_205184 ) ( not ( = ?auto_205185 ?auto_205183 ) ) ( not ( = ?auto_205185 ?auto_205181 ) ) ( not ( = ?auto_205185 ?auto_205186 ) ) ( not ( = ?auto_205183 ?auto_205181 ) ) ( not ( = ?auto_205183 ?auto_205186 ) ) ( not ( = ?auto_205181 ?auto_205186 ) ) ( not ( = ?auto_205178 ?auto_205181 ) ) ( not ( = ?auto_205178 ?auto_205185 ) ) ( not ( = ?auto_205178 ?auto_205183 ) ) ( not ( = ?auto_205179 ?auto_205181 ) ) ( not ( = ?auto_205179 ?auto_205185 ) ) ( not ( = ?auto_205179 ?auto_205183 ) ) ( not ( = ?auto_205180 ?auto_205181 ) ) ( not ( = ?auto_205180 ?auto_205185 ) ) ( not ( = ?auto_205180 ?auto_205183 ) ) ( not ( = ?auto_205184 ?auto_205181 ) ) ( not ( = ?auto_205184 ?auto_205185 ) ) ( not ( = ?auto_205184 ?auto_205183 ) ) ( not ( = ?auto_205182 ?auto_205181 ) ) ( not ( = ?auto_205182 ?auto_205185 ) ) ( not ( = ?auto_205182 ?auto_205183 ) ) ( ON ?auto_205186 ?auto_205182 ) ( ON ?auto_205181 ?auto_205186 ) ( ON ?auto_205183 ?auto_205181 ) ( ON ?auto_205185 ?auto_205183 ) ( CLEAR ?auto_205185 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_205178 ?auto_205179 ?auto_205180 ?auto_205184 ?auto_205182 ?auto_205186 ?auto_205181 ?auto_205183 )
      ( MAKE-3PILE ?auto_205178 ?auto_205179 ?auto_205180 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_205193 - BLOCK
      ?auto_205194 - BLOCK
      ?auto_205195 - BLOCK
      ?auto_205196 - BLOCK
      ?auto_205197 - BLOCK
      ?auto_205198 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_205198 ) ( CLEAR ?auto_205197 ) ( ON-TABLE ?auto_205193 ) ( ON ?auto_205194 ?auto_205193 ) ( ON ?auto_205195 ?auto_205194 ) ( ON ?auto_205196 ?auto_205195 ) ( ON ?auto_205197 ?auto_205196 ) ( not ( = ?auto_205193 ?auto_205194 ) ) ( not ( = ?auto_205193 ?auto_205195 ) ) ( not ( = ?auto_205193 ?auto_205196 ) ) ( not ( = ?auto_205193 ?auto_205197 ) ) ( not ( = ?auto_205193 ?auto_205198 ) ) ( not ( = ?auto_205194 ?auto_205195 ) ) ( not ( = ?auto_205194 ?auto_205196 ) ) ( not ( = ?auto_205194 ?auto_205197 ) ) ( not ( = ?auto_205194 ?auto_205198 ) ) ( not ( = ?auto_205195 ?auto_205196 ) ) ( not ( = ?auto_205195 ?auto_205197 ) ) ( not ( = ?auto_205195 ?auto_205198 ) ) ( not ( = ?auto_205196 ?auto_205197 ) ) ( not ( = ?auto_205196 ?auto_205198 ) ) ( not ( = ?auto_205197 ?auto_205198 ) ) )
    :subtasks
    ( ( !STACK ?auto_205198 ?auto_205197 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_205199 - BLOCK
      ?auto_205200 - BLOCK
      ?auto_205201 - BLOCK
      ?auto_205202 - BLOCK
      ?auto_205203 - BLOCK
      ?auto_205204 - BLOCK
    )
    :vars
    (
      ?auto_205205 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_205203 ) ( ON-TABLE ?auto_205199 ) ( ON ?auto_205200 ?auto_205199 ) ( ON ?auto_205201 ?auto_205200 ) ( ON ?auto_205202 ?auto_205201 ) ( ON ?auto_205203 ?auto_205202 ) ( not ( = ?auto_205199 ?auto_205200 ) ) ( not ( = ?auto_205199 ?auto_205201 ) ) ( not ( = ?auto_205199 ?auto_205202 ) ) ( not ( = ?auto_205199 ?auto_205203 ) ) ( not ( = ?auto_205199 ?auto_205204 ) ) ( not ( = ?auto_205200 ?auto_205201 ) ) ( not ( = ?auto_205200 ?auto_205202 ) ) ( not ( = ?auto_205200 ?auto_205203 ) ) ( not ( = ?auto_205200 ?auto_205204 ) ) ( not ( = ?auto_205201 ?auto_205202 ) ) ( not ( = ?auto_205201 ?auto_205203 ) ) ( not ( = ?auto_205201 ?auto_205204 ) ) ( not ( = ?auto_205202 ?auto_205203 ) ) ( not ( = ?auto_205202 ?auto_205204 ) ) ( not ( = ?auto_205203 ?auto_205204 ) ) ( ON ?auto_205204 ?auto_205205 ) ( CLEAR ?auto_205204 ) ( HAND-EMPTY ) ( not ( = ?auto_205199 ?auto_205205 ) ) ( not ( = ?auto_205200 ?auto_205205 ) ) ( not ( = ?auto_205201 ?auto_205205 ) ) ( not ( = ?auto_205202 ?auto_205205 ) ) ( not ( = ?auto_205203 ?auto_205205 ) ) ( not ( = ?auto_205204 ?auto_205205 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_205204 ?auto_205205 )
      ( MAKE-6PILE ?auto_205199 ?auto_205200 ?auto_205201 ?auto_205202 ?auto_205203 ?auto_205204 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_205206 - BLOCK
      ?auto_205207 - BLOCK
      ?auto_205208 - BLOCK
      ?auto_205209 - BLOCK
      ?auto_205210 - BLOCK
      ?auto_205211 - BLOCK
    )
    :vars
    (
      ?auto_205212 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_205206 ) ( ON ?auto_205207 ?auto_205206 ) ( ON ?auto_205208 ?auto_205207 ) ( ON ?auto_205209 ?auto_205208 ) ( not ( = ?auto_205206 ?auto_205207 ) ) ( not ( = ?auto_205206 ?auto_205208 ) ) ( not ( = ?auto_205206 ?auto_205209 ) ) ( not ( = ?auto_205206 ?auto_205210 ) ) ( not ( = ?auto_205206 ?auto_205211 ) ) ( not ( = ?auto_205207 ?auto_205208 ) ) ( not ( = ?auto_205207 ?auto_205209 ) ) ( not ( = ?auto_205207 ?auto_205210 ) ) ( not ( = ?auto_205207 ?auto_205211 ) ) ( not ( = ?auto_205208 ?auto_205209 ) ) ( not ( = ?auto_205208 ?auto_205210 ) ) ( not ( = ?auto_205208 ?auto_205211 ) ) ( not ( = ?auto_205209 ?auto_205210 ) ) ( not ( = ?auto_205209 ?auto_205211 ) ) ( not ( = ?auto_205210 ?auto_205211 ) ) ( ON ?auto_205211 ?auto_205212 ) ( CLEAR ?auto_205211 ) ( not ( = ?auto_205206 ?auto_205212 ) ) ( not ( = ?auto_205207 ?auto_205212 ) ) ( not ( = ?auto_205208 ?auto_205212 ) ) ( not ( = ?auto_205209 ?auto_205212 ) ) ( not ( = ?auto_205210 ?auto_205212 ) ) ( not ( = ?auto_205211 ?auto_205212 ) ) ( HOLDING ?auto_205210 ) ( CLEAR ?auto_205209 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_205206 ?auto_205207 ?auto_205208 ?auto_205209 ?auto_205210 )
      ( MAKE-6PILE ?auto_205206 ?auto_205207 ?auto_205208 ?auto_205209 ?auto_205210 ?auto_205211 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_205213 - BLOCK
      ?auto_205214 - BLOCK
      ?auto_205215 - BLOCK
      ?auto_205216 - BLOCK
      ?auto_205217 - BLOCK
      ?auto_205218 - BLOCK
    )
    :vars
    (
      ?auto_205219 - BLOCK
      ?auto_205221 - BLOCK
      ?auto_205220 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_205213 ) ( ON ?auto_205214 ?auto_205213 ) ( ON ?auto_205215 ?auto_205214 ) ( ON ?auto_205216 ?auto_205215 ) ( not ( = ?auto_205213 ?auto_205214 ) ) ( not ( = ?auto_205213 ?auto_205215 ) ) ( not ( = ?auto_205213 ?auto_205216 ) ) ( not ( = ?auto_205213 ?auto_205217 ) ) ( not ( = ?auto_205213 ?auto_205218 ) ) ( not ( = ?auto_205214 ?auto_205215 ) ) ( not ( = ?auto_205214 ?auto_205216 ) ) ( not ( = ?auto_205214 ?auto_205217 ) ) ( not ( = ?auto_205214 ?auto_205218 ) ) ( not ( = ?auto_205215 ?auto_205216 ) ) ( not ( = ?auto_205215 ?auto_205217 ) ) ( not ( = ?auto_205215 ?auto_205218 ) ) ( not ( = ?auto_205216 ?auto_205217 ) ) ( not ( = ?auto_205216 ?auto_205218 ) ) ( not ( = ?auto_205217 ?auto_205218 ) ) ( ON ?auto_205218 ?auto_205219 ) ( not ( = ?auto_205213 ?auto_205219 ) ) ( not ( = ?auto_205214 ?auto_205219 ) ) ( not ( = ?auto_205215 ?auto_205219 ) ) ( not ( = ?auto_205216 ?auto_205219 ) ) ( not ( = ?auto_205217 ?auto_205219 ) ) ( not ( = ?auto_205218 ?auto_205219 ) ) ( CLEAR ?auto_205216 ) ( ON ?auto_205217 ?auto_205218 ) ( CLEAR ?auto_205217 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_205221 ) ( ON ?auto_205220 ?auto_205221 ) ( ON ?auto_205219 ?auto_205220 ) ( not ( = ?auto_205221 ?auto_205220 ) ) ( not ( = ?auto_205221 ?auto_205219 ) ) ( not ( = ?auto_205221 ?auto_205218 ) ) ( not ( = ?auto_205221 ?auto_205217 ) ) ( not ( = ?auto_205220 ?auto_205219 ) ) ( not ( = ?auto_205220 ?auto_205218 ) ) ( not ( = ?auto_205220 ?auto_205217 ) ) ( not ( = ?auto_205213 ?auto_205221 ) ) ( not ( = ?auto_205213 ?auto_205220 ) ) ( not ( = ?auto_205214 ?auto_205221 ) ) ( not ( = ?auto_205214 ?auto_205220 ) ) ( not ( = ?auto_205215 ?auto_205221 ) ) ( not ( = ?auto_205215 ?auto_205220 ) ) ( not ( = ?auto_205216 ?auto_205221 ) ) ( not ( = ?auto_205216 ?auto_205220 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_205221 ?auto_205220 ?auto_205219 ?auto_205218 )
      ( MAKE-6PILE ?auto_205213 ?auto_205214 ?auto_205215 ?auto_205216 ?auto_205217 ?auto_205218 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_205222 - BLOCK
      ?auto_205223 - BLOCK
      ?auto_205224 - BLOCK
      ?auto_205225 - BLOCK
      ?auto_205226 - BLOCK
      ?auto_205227 - BLOCK
    )
    :vars
    (
      ?auto_205230 - BLOCK
      ?auto_205228 - BLOCK
      ?auto_205229 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_205222 ) ( ON ?auto_205223 ?auto_205222 ) ( ON ?auto_205224 ?auto_205223 ) ( not ( = ?auto_205222 ?auto_205223 ) ) ( not ( = ?auto_205222 ?auto_205224 ) ) ( not ( = ?auto_205222 ?auto_205225 ) ) ( not ( = ?auto_205222 ?auto_205226 ) ) ( not ( = ?auto_205222 ?auto_205227 ) ) ( not ( = ?auto_205223 ?auto_205224 ) ) ( not ( = ?auto_205223 ?auto_205225 ) ) ( not ( = ?auto_205223 ?auto_205226 ) ) ( not ( = ?auto_205223 ?auto_205227 ) ) ( not ( = ?auto_205224 ?auto_205225 ) ) ( not ( = ?auto_205224 ?auto_205226 ) ) ( not ( = ?auto_205224 ?auto_205227 ) ) ( not ( = ?auto_205225 ?auto_205226 ) ) ( not ( = ?auto_205225 ?auto_205227 ) ) ( not ( = ?auto_205226 ?auto_205227 ) ) ( ON ?auto_205227 ?auto_205230 ) ( not ( = ?auto_205222 ?auto_205230 ) ) ( not ( = ?auto_205223 ?auto_205230 ) ) ( not ( = ?auto_205224 ?auto_205230 ) ) ( not ( = ?auto_205225 ?auto_205230 ) ) ( not ( = ?auto_205226 ?auto_205230 ) ) ( not ( = ?auto_205227 ?auto_205230 ) ) ( ON ?auto_205226 ?auto_205227 ) ( CLEAR ?auto_205226 ) ( ON-TABLE ?auto_205228 ) ( ON ?auto_205229 ?auto_205228 ) ( ON ?auto_205230 ?auto_205229 ) ( not ( = ?auto_205228 ?auto_205229 ) ) ( not ( = ?auto_205228 ?auto_205230 ) ) ( not ( = ?auto_205228 ?auto_205227 ) ) ( not ( = ?auto_205228 ?auto_205226 ) ) ( not ( = ?auto_205229 ?auto_205230 ) ) ( not ( = ?auto_205229 ?auto_205227 ) ) ( not ( = ?auto_205229 ?auto_205226 ) ) ( not ( = ?auto_205222 ?auto_205228 ) ) ( not ( = ?auto_205222 ?auto_205229 ) ) ( not ( = ?auto_205223 ?auto_205228 ) ) ( not ( = ?auto_205223 ?auto_205229 ) ) ( not ( = ?auto_205224 ?auto_205228 ) ) ( not ( = ?auto_205224 ?auto_205229 ) ) ( not ( = ?auto_205225 ?auto_205228 ) ) ( not ( = ?auto_205225 ?auto_205229 ) ) ( HOLDING ?auto_205225 ) ( CLEAR ?auto_205224 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_205222 ?auto_205223 ?auto_205224 ?auto_205225 )
      ( MAKE-6PILE ?auto_205222 ?auto_205223 ?auto_205224 ?auto_205225 ?auto_205226 ?auto_205227 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_205231 - BLOCK
      ?auto_205232 - BLOCK
      ?auto_205233 - BLOCK
      ?auto_205234 - BLOCK
      ?auto_205235 - BLOCK
      ?auto_205236 - BLOCK
    )
    :vars
    (
      ?auto_205237 - BLOCK
      ?auto_205238 - BLOCK
      ?auto_205239 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_205231 ) ( ON ?auto_205232 ?auto_205231 ) ( ON ?auto_205233 ?auto_205232 ) ( not ( = ?auto_205231 ?auto_205232 ) ) ( not ( = ?auto_205231 ?auto_205233 ) ) ( not ( = ?auto_205231 ?auto_205234 ) ) ( not ( = ?auto_205231 ?auto_205235 ) ) ( not ( = ?auto_205231 ?auto_205236 ) ) ( not ( = ?auto_205232 ?auto_205233 ) ) ( not ( = ?auto_205232 ?auto_205234 ) ) ( not ( = ?auto_205232 ?auto_205235 ) ) ( not ( = ?auto_205232 ?auto_205236 ) ) ( not ( = ?auto_205233 ?auto_205234 ) ) ( not ( = ?auto_205233 ?auto_205235 ) ) ( not ( = ?auto_205233 ?auto_205236 ) ) ( not ( = ?auto_205234 ?auto_205235 ) ) ( not ( = ?auto_205234 ?auto_205236 ) ) ( not ( = ?auto_205235 ?auto_205236 ) ) ( ON ?auto_205236 ?auto_205237 ) ( not ( = ?auto_205231 ?auto_205237 ) ) ( not ( = ?auto_205232 ?auto_205237 ) ) ( not ( = ?auto_205233 ?auto_205237 ) ) ( not ( = ?auto_205234 ?auto_205237 ) ) ( not ( = ?auto_205235 ?auto_205237 ) ) ( not ( = ?auto_205236 ?auto_205237 ) ) ( ON ?auto_205235 ?auto_205236 ) ( ON-TABLE ?auto_205238 ) ( ON ?auto_205239 ?auto_205238 ) ( ON ?auto_205237 ?auto_205239 ) ( not ( = ?auto_205238 ?auto_205239 ) ) ( not ( = ?auto_205238 ?auto_205237 ) ) ( not ( = ?auto_205238 ?auto_205236 ) ) ( not ( = ?auto_205238 ?auto_205235 ) ) ( not ( = ?auto_205239 ?auto_205237 ) ) ( not ( = ?auto_205239 ?auto_205236 ) ) ( not ( = ?auto_205239 ?auto_205235 ) ) ( not ( = ?auto_205231 ?auto_205238 ) ) ( not ( = ?auto_205231 ?auto_205239 ) ) ( not ( = ?auto_205232 ?auto_205238 ) ) ( not ( = ?auto_205232 ?auto_205239 ) ) ( not ( = ?auto_205233 ?auto_205238 ) ) ( not ( = ?auto_205233 ?auto_205239 ) ) ( not ( = ?auto_205234 ?auto_205238 ) ) ( not ( = ?auto_205234 ?auto_205239 ) ) ( CLEAR ?auto_205233 ) ( ON ?auto_205234 ?auto_205235 ) ( CLEAR ?auto_205234 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_205238 ?auto_205239 ?auto_205237 ?auto_205236 ?auto_205235 )
      ( MAKE-6PILE ?auto_205231 ?auto_205232 ?auto_205233 ?auto_205234 ?auto_205235 ?auto_205236 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_205240 - BLOCK
      ?auto_205241 - BLOCK
      ?auto_205242 - BLOCK
      ?auto_205243 - BLOCK
      ?auto_205244 - BLOCK
      ?auto_205245 - BLOCK
    )
    :vars
    (
      ?auto_205248 - BLOCK
      ?auto_205246 - BLOCK
      ?auto_205247 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_205240 ) ( ON ?auto_205241 ?auto_205240 ) ( not ( = ?auto_205240 ?auto_205241 ) ) ( not ( = ?auto_205240 ?auto_205242 ) ) ( not ( = ?auto_205240 ?auto_205243 ) ) ( not ( = ?auto_205240 ?auto_205244 ) ) ( not ( = ?auto_205240 ?auto_205245 ) ) ( not ( = ?auto_205241 ?auto_205242 ) ) ( not ( = ?auto_205241 ?auto_205243 ) ) ( not ( = ?auto_205241 ?auto_205244 ) ) ( not ( = ?auto_205241 ?auto_205245 ) ) ( not ( = ?auto_205242 ?auto_205243 ) ) ( not ( = ?auto_205242 ?auto_205244 ) ) ( not ( = ?auto_205242 ?auto_205245 ) ) ( not ( = ?auto_205243 ?auto_205244 ) ) ( not ( = ?auto_205243 ?auto_205245 ) ) ( not ( = ?auto_205244 ?auto_205245 ) ) ( ON ?auto_205245 ?auto_205248 ) ( not ( = ?auto_205240 ?auto_205248 ) ) ( not ( = ?auto_205241 ?auto_205248 ) ) ( not ( = ?auto_205242 ?auto_205248 ) ) ( not ( = ?auto_205243 ?auto_205248 ) ) ( not ( = ?auto_205244 ?auto_205248 ) ) ( not ( = ?auto_205245 ?auto_205248 ) ) ( ON ?auto_205244 ?auto_205245 ) ( ON-TABLE ?auto_205246 ) ( ON ?auto_205247 ?auto_205246 ) ( ON ?auto_205248 ?auto_205247 ) ( not ( = ?auto_205246 ?auto_205247 ) ) ( not ( = ?auto_205246 ?auto_205248 ) ) ( not ( = ?auto_205246 ?auto_205245 ) ) ( not ( = ?auto_205246 ?auto_205244 ) ) ( not ( = ?auto_205247 ?auto_205248 ) ) ( not ( = ?auto_205247 ?auto_205245 ) ) ( not ( = ?auto_205247 ?auto_205244 ) ) ( not ( = ?auto_205240 ?auto_205246 ) ) ( not ( = ?auto_205240 ?auto_205247 ) ) ( not ( = ?auto_205241 ?auto_205246 ) ) ( not ( = ?auto_205241 ?auto_205247 ) ) ( not ( = ?auto_205242 ?auto_205246 ) ) ( not ( = ?auto_205242 ?auto_205247 ) ) ( not ( = ?auto_205243 ?auto_205246 ) ) ( not ( = ?auto_205243 ?auto_205247 ) ) ( ON ?auto_205243 ?auto_205244 ) ( CLEAR ?auto_205243 ) ( HOLDING ?auto_205242 ) ( CLEAR ?auto_205241 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_205240 ?auto_205241 ?auto_205242 )
      ( MAKE-6PILE ?auto_205240 ?auto_205241 ?auto_205242 ?auto_205243 ?auto_205244 ?auto_205245 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_205249 - BLOCK
      ?auto_205250 - BLOCK
      ?auto_205251 - BLOCK
      ?auto_205252 - BLOCK
      ?auto_205253 - BLOCK
      ?auto_205254 - BLOCK
    )
    :vars
    (
      ?auto_205256 - BLOCK
      ?auto_205255 - BLOCK
      ?auto_205257 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_205249 ) ( ON ?auto_205250 ?auto_205249 ) ( not ( = ?auto_205249 ?auto_205250 ) ) ( not ( = ?auto_205249 ?auto_205251 ) ) ( not ( = ?auto_205249 ?auto_205252 ) ) ( not ( = ?auto_205249 ?auto_205253 ) ) ( not ( = ?auto_205249 ?auto_205254 ) ) ( not ( = ?auto_205250 ?auto_205251 ) ) ( not ( = ?auto_205250 ?auto_205252 ) ) ( not ( = ?auto_205250 ?auto_205253 ) ) ( not ( = ?auto_205250 ?auto_205254 ) ) ( not ( = ?auto_205251 ?auto_205252 ) ) ( not ( = ?auto_205251 ?auto_205253 ) ) ( not ( = ?auto_205251 ?auto_205254 ) ) ( not ( = ?auto_205252 ?auto_205253 ) ) ( not ( = ?auto_205252 ?auto_205254 ) ) ( not ( = ?auto_205253 ?auto_205254 ) ) ( ON ?auto_205254 ?auto_205256 ) ( not ( = ?auto_205249 ?auto_205256 ) ) ( not ( = ?auto_205250 ?auto_205256 ) ) ( not ( = ?auto_205251 ?auto_205256 ) ) ( not ( = ?auto_205252 ?auto_205256 ) ) ( not ( = ?auto_205253 ?auto_205256 ) ) ( not ( = ?auto_205254 ?auto_205256 ) ) ( ON ?auto_205253 ?auto_205254 ) ( ON-TABLE ?auto_205255 ) ( ON ?auto_205257 ?auto_205255 ) ( ON ?auto_205256 ?auto_205257 ) ( not ( = ?auto_205255 ?auto_205257 ) ) ( not ( = ?auto_205255 ?auto_205256 ) ) ( not ( = ?auto_205255 ?auto_205254 ) ) ( not ( = ?auto_205255 ?auto_205253 ) ) ( not ( = ?auto_205257 ?auto_205256 ) ) ( not ( = ?auto_205257 ?auto_205254 ) ) ( not ( = ?auto_205257 ?auto_205253 ) ) ( not ( = ?auto_205249 ?auto_205255 ) ) ( not ( = ?auto_205249 ?auto_205257 ) ) ( not ( = ?auto_205250 ?auto_205255 ) ) ( not ( = ?auto_205250 ?auto_205257 ) ) ( not ( = ?auto_205251 ?auto_205255 ) ) ( not ( = ?auto_205251 ?auto_205257 ) ) ( not ( = ?auto_205252 ?auto_205255 ) ) ( not ( = ?auto_205252 ?auto_205257 ) ) ( ON ?auto_205252 ?auto_205253 ) ( CLEAR ?auto_205250 ) ( ON ?auto_205251 ?auto_205252 ) ( CLEAR ?auto_205251 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_205255 ?auto_205257 ?auto_205256 ?auto_205254 ?auto_205253 ?auto_205252 )
      ( MAKE-6PILE ?auto_205249 ?auto_205250 ?auto_205251 ?auto_205252 ?auto_205253 ?auto_205254 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_205258 - BLOCK
      ?auto_205259 - BLOCK
      ?auto_205260 - BLOCK
      ?auto_205261 - BLOCK
      ?auto_205262 - BLOCK
      ?auto_205263 - BLOCK
    )
    :vars
    (
      ?auto_205266 - BLOCK
      ?auto_205265 - BLOCK
      ?auto_205264 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_205258 ) ( not ( = ?auto_205258 ?auto_205259 ) ) ( not ( = ?auto_205258 ?auto_205260 ) ) ( not ( = ?auto_205258 ?auto_205261 ) ) ( not ( = ?auto_205258 ?auto_205262 ) ) ( not ( = ?auto_205258 ?auto_205263 ) ) ( not ( = ?auto_205259 ?auto_205260 ) ) ( not ( = ?auto_205259 ?auto_205261 ) ) ( not ( = ?auto_205259 ?auto_205262 ) ) ( not ( = ?auto_205259 ?auto_205263 ) ) ( not ( = ?auto_205260 ?auto_205261 ) ) ( not ( = ?auto_205260 ?auto_205262 ) ) ( not ( = ?auto_205260 ?auto_205263 ) ) ( not ( = ?auto_205261 ?auto_205262 ) ) ( not ( = ?auto_205261 ?auto_205263 ) ) ( not ( = ?auto_205262 ?auto_205263 ) ) ( ON ?auto_205263 ?auto_205266 ) ( not ( = ?auto_205258 ?auto_205266 ) ) ( not ( = ?auto_205259 ?auto_205266 ) ) ( not ( = ?auto_205260 ?auto_205266 ) ) ( not ( = ?auto_205261 ?auto_205266 ) ) ( not ( = ?auto_205262 ?auto_205266 ) ) ( not ( = ?auto_205263 ?auto_205266 ) ) ( ON ?auto_205262 ?auto_205263 ) ( ON-TABLE ?auto_205265 ) ( ON ?auto_205264 ?auto_205265 ) ( ON ?auto_205266 ?auto_205264 ) ( not ( = ?auto_205265 ?auto_205264 ) ) ( not ( = ?auto_205265 ?auto_205266 ) ) ( not ( = ?auto_205265 ?auto_205263 ) ) ( not ( = ?auto_205265 ?auto_205262 ) ) ( not ( = ?auto_205264 ?auto_205266 ) ) ( not ( = ?auto_205264 ?auto_205263 ) ) ( not ( = ?auto_205264 ?auto_205262 ) ) ( not ( = ?auto_205258 ?auto_205265 ) ) ( not ( = ?auto_205258 ?auto_205264 ) ) ( not ( = ?auto_205259 ?auto_205265 ) ) ( not ( = ?auto_205259 ?auto_205264 ) ) ( not ( = ?auto_205260 ?auto_205265 ) ) ( not ( = ?auto_205260 ?auto_205264 ) ) ( not ( = ?auto_205261 ?auto_205265 ) ) ( not ( = ?auto_205261 ?auto_205264 ) ) ( ON ?auto_205261 ?auto_205262 ) ( ON ?auto_205260 ?auto_205261 ) ( CLEAR ?auto_205260 ) ( HOLDING ?auto_205259 ) ( CLEAR ?auto_205258 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_205258 ?auto_205259 )
      ( MAKE-6PILE ?auto_205258 ?auto_205259 ?auto_205260 ?auto_205261 ?auto_205262 ?auto_205263 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_205267 - BLOCK
      ?auto_205268 - BLOCK
      ?auto_205269 - BLOCK
      ?auto_205270 - BLOCK
      ?auto_205271 - BLOCK
      ?auto_205272 - BLOCK
    )
    :vars
    (
      ?auto_205273 - BLOCK
      ?auto_205275 - BLOCK
      ?auto_205274 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_205267 ) ( not ( = ?auto_205267 ?auto_205268 ) ) ( not ( = ?auto_205267 ?auto_205269 ) ) ( not ( = ?auto_205267 ?auto_205270 ) ) ( not ( = ?auto_205267 ?auto_205271 ) ) ( not ( = ?auto_205267 ?auto_205272 ) ) ( not ( = ?auto_205268 ?auto_205269 ) ) ( not ( = ?auto_205268 ?auto_205270 ) ) ( not ( = ?auto_205268 ?auto_205271 ) ) ( not ( = ?auto_205268 ?auto_205272 ) ) ( not ( = ?auto_205269 ?auto_205270 ) ) ( not ( = ?auto_205269 ?auto_205271 ) ) ( not ( = ?auto_205269 ?auto_205272 ) ) ( not ( = ?auto_205270 ?auto_205271 ) ) ( not ( = ?auto_205270 ?auto_205272 ) ) ( not ( = ?auto_205271 ?auto_205272 ) ) ( ON ?auto_205272 ?auto_205273 ) ( not ( = ?auto_205267 ?auto_205273 ) ) ( not ( = ?auto_205268 ?auto_205273 ) ) ( not ( = ?auto_205269 ?auto_205273 ) ) ( not ( = ?auto_205270 ?auto_205273 ) ) ( not ( = ?auto_205271 ?auto_205273 ) ) ( not ( = ?auto_205272 ?auto_205273 ) ) ( ON ?auto_205271 ?auto_205272 ) ( ON-TABLE ?auto_205275 ) ( ON ?auto_205274 ?auto_205275 ) ( ON ?auto_205273 ?auto_205274 ) ( not ( = ?auto_205275 ?auto_205274 ) ) ( not ( = ?auto_205275 ?auto_205273 ) ) ( not ( = ?auto_205275 ?auto_205272 ) ) ( not ( = ?auto_205275 ?auto_205271 ) ) ( not ( = ?auto_205274 ?auto_205273 ) ) ( not ( = ?auto_205274 ?auto_205272 ) ) ( not ( = ?auto_205274 ?auto_205271 ) ) ( not ( = ?auto_205267 ?auto_205275 ) ) ( not ( = ?auto_205267 ?auto_205274 ) ) ( not ( = ?auto_205268 ?auto_205275 ) ) ( not ( = ?auto_205268 ?auto_205274 ) ) ( not ( = ?auto_205269 ?auto_205275 ) ) ( not ( = ?auto_205269 ?auto_205274 ) ) ( not ( = ?auto_205270 ?auto_205275 ) ) ( not ( = ?auto_205270 ?auto_205274 ) ) ( ON ?auto_205270 ?auto_205271 ) ( ON ?auto_205269 ?auto_205270 ) ( CLEAR ?auto_205267 ) ( ON ?auto_205268 ?auto_205269 ) ( CLEAR ?auto_205268 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_205275 ?auto_205274 ?auto_205273 ?auto_205272 ?auto_205271 ?auto_205270 ?auto_205269 )
      ( MAKE-6PILE ?auto_205267 ?auto_205268 ?auto_205269 ?auto_205270 ?auto_205271 ?auto_205272 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_205276 - BLOCK
      ?auto_205277 - BLOCK
      ?auto_205278 - BLOCK
      ?auto_205279 - BLOCK
      ?auto_205280 - BLOCK
      ?auto_205281 - BLOCK
    )
    :vars
    (
      ?auto_205284 - BLOCK
      ?auto_205283 - BLOCK
      ?auto_205282 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_205276 ?auto_205277 ) ) ( not ( = ?auto_205276 ?auto_205278 ) ) ( not ( = ?auto_205276 ?auto_205279 ) ) ( not ( = ?auto_205276 ?auto_205280 ) ) ( not ( = ?auto_205276 ?auto_205281 ) ) ( not ( = ?auto_205277 ?auto_205278 ) ) ( not ( = ?auto_205277 ?auto_205279 ) ) ( not ( = ?auto_205277 ?auto_205280 ) ) ( not ( = ?auto_205277 ?auto_205281 ) ) ( not ( = ?auto_205278 ?auto_205279 ) ) ( not ( = ?auto_205278 ?auto_205280 ) ) ( not ( = ?auto_205278 ?auto_205281 ) ) ( not ( = ?auto_205279 ?auto_205280 ) ) ( not ( = ?auto_205279 ?auto_205281 ) ) ( not ( = ?auto_205280 ?auto_205281 ) ) ( ON ?auto_205281 ?auto_205284 ) ( not ( = ?auto_205276 ?auto_205284 ) ) ( not ( = ?auto_205277 ?auto_205284 ) ) ( not ( = ?auto_205278 ?auto_205284 ) ) ( not ( = ?auto_205279 ?auto_205284 ) ) ( not ( = ?auto_205280 ?auto_205284 ) ) ( not ( = ?auto_205281 ?auto_205284 ) ) ( ON ?auto_205280 ?auto_205281 ) ( ON-TABLE ?auto_205283 ) ( ON ?auto_205282 ?auto_205283 ) ( ON ?auto_205284 ?auto_205282 ) ( not ( = ?auto_205283 ?auto_205282 ) ) ( not ( = ?auto_205283 ?auto_205284 ) ) ( not ( = ?auto_205283 ?auto_205281 ) ) ( not ( = ?auto_205283 ?auto_205280 ) ) ( not ( = ?auto_205282 ?auto_205284 ) ) ( not ( = ?auto_205282 ?auto_205281 ) ) ( not ( = ?auto_205282 ?auto_205280 ) ) ( not ( = ?auto_205276 ?auto_205283 ) ) ( not ( = ?auto_205276 ?auto_205282 ) ) ( not ( = ?auto_205277 ?auto_205283 ) ) ( not ( = ?auto_205277 ?auto_205282 ) ) ( not ( = ?auto_205278 ?auto_205283 ) ) ( not ( = ?auto_205278 ?auto_205282 ) ) ( not ( = ?auto_205279 ?auto_205283 ) ) ( not ( = ?auto_205279 ?auto_205282 ) ) ( ON ?auto_205279 ?auto_205280 ) ( ON ?auto_205278 ?auto_205279 ) ( ON ?auto_205277 ?auto_205278 ) ( CLEAR ?auto_205277 ) ( HOLDING ?auto_205276 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_205276 )
      ( MAKE-6PILE ?auto_205276 ?auto_205277 ?auto_205278 ?auto_205279 ?auto_205280 ?auto_205281 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_205285 - BLOCK
      ?auto_205286 - BLOCK
      ?auto_205287 - BLOCK
      ?auto_205288 - BLOCK
      ?auto_205289 - BLOCK
      ?auto_205290 - BLOCK
    )
    :vars
    (
      ?auto_205293 - BLOCK
      ?auto_205291 - BLOCK
      ?auto_205292 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_205285 ?auto_205286 ) ) ( not ( = ?auto_205285 ?auto_205287 ) ) ( not ( = ?auto_205285 ?auto_205288 ) ) ( not ( = ?auto_205285 ?auto_205289 ) ) ( not ( = ?auto_205285 ?auto_205290 ) ) ( not ( = ?auto_205286 ?auto_205287 ) ) ( not ( = ?auto_205286 ?auto_205288 ) ) ( not ( = ?auto_205286 ?auto_205289 ) ) ( not ( = ?auto_205286 ?auto_205290 ) ) ( not ( = ?auto_205287 ?auto_205288 ) ) ( not ( = ?auto_205287 ?auto_205289 ) ) ( not ( = ?auto_205287 ?auto_205290 ) ) ( not ( = ?auto_205288 ?auto_205289 ) ) ( not ( = ?auto_205288 ?auto_205290 ) ) ( not ( = ?auto_205289 ?auto_205290 ) ) ( ON ?auto_205290 ?auto_205293 ) ( not ( = ?auto_205285 ?auto_205293 ) ) ( not ( = ?auto_205286 ?auto_205293 ) ) ( not ( = ?auto_205287 ?auto_205293 ) ) ( not ( = ?auto_205288 ?auto_205293 ) ) ( not ( = ?auto_205289 ?auto_205293 ) ) ( not ( = ?auto_205290 ?auto_205293 ) ) ( ON ?auto_205289 ?auto_205290 ) ( ON-TABLE ?auto_205291 ) ( ON ?auto_205292 ?auto_205291 ) ( ON ?auto_205293 ?auto_205292 ) ( not ( = ?auto_205291 ?auto_205292 ) ) ( not ( = ?auto_205291 ?auto_205293 ) ) ( not ( = ?auto_205291 ?auto_205290 ) ) ( not ( = ?auto_205291 ?auto_205289 ) ) ( not ( = ?auto_205292 ?auto_205293 ) ) ( not ( = ?auto_205292 ?auto_205290 ) ) ( not ( = ?auto_205292 ?auto_205289 ) ) ( not ( = ?auto_205285 ?auto_205291 ) ) ( not ( = ?auto_205285 ?auto_205292 ) ) ( not ( = ?auto_205286 ?auto_205291 ) ) ( not ( = ?auto_205286 ?auto_205292 ) ) ( not ( = ?auto_205287 ?auto_205291 ) ) ( not ( = ?auto_205287 ?auto_205292 ) ) ( not ( = ?auto_205288 ?auto_205291 ) ) ( not ( = ?auto_205288 ?auto_205292 ) ) ( ON ?auto_205288 ?auto_205289 ) ( ON ?auto_205287 ?auto_205288 ) ( ON ?auto_205286 ?auto_205287 ) ( ON ?auto_205285 ?auto_205286 ) ( CLEAR ?auto_205285 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_205291 ?auto_205292 ?auto_205293 ?auto_205290 ?auto_205289 ?auto_205288 ?auto_205287 ?auto_205286 )
      ( MAKE-6PILE ?auto_205285 ?auto_205286 ?auto_205287 ?auto_205288 ?auto_205289 ?auto_205290 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_205296 - BLOCK
      ?auto_205297 - BLOCK
    )
    :vars
    (
      ?auto_205298 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205298 ?auto_205297 ) ( CLEAR ?auto_205298 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_205296 ) ( ON ?auto_205297 ?auto_205296 ) ( not ( = ?auto_205296 ?auto_205297 ) ) ( not ( = ?auto_205296 ?auto_205298 ) ) ( not ( = ?auto_205297 ?auto_205298 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_205298 ?auto_205297 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_205299 - BLOCK
      ?auto_205300 - BLOCK
    )
    :vars
    (
      ?auto_205301 - BLOCK
      ?auto_205302 - BLOCK
      ?auto_205303 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205301 ?auto_205300 ) ( CLEAR ?auto_205301 ) ( ON-TABLE ?auto_205299 ) ( ON ?auto_205300 ?auto_205299 ) ( not ( = ?auto_205299 ?auto_205300 ) ) ( not ( = ?auto_205299 ?auto_205301 ) ) ( not ( = ?auto_205300 ?auto_205301 ) ) ( HOLDING ?auto_205302 ) ( CLEAR ?auto_205303 ) ( not ( = ?auto_205299 ?auto_205302 ) ) ( not ( = ?auto_205299 ?auto_205303 ) ) ( not ( = ?auto_205300 ?auto_205302 ) ) ( not ( = ?auto_205300 ?auto_205303 ) ) ( not ( = ?auto_205301 ?auto_205302 ) ) ( not ( = ?auto_205301 ?auto_205303 ) ) ( not ( = ?auto_205302 ?auto_205303 ) ) )
    :subtasks
    ( ( !STACK ?auto_205302 ?auto_205303 )
      ( MAKE-2PILE ?auto_205299 ?auto_205300 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_205304 - BLOCK
      ?auto_205305 - BLOCK
    )
    :vars
    (
      ?auto_205306 - BLOCK
      ?auto_205308 - BLOCK
      ?auto_205307 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205306 ?auto_205305 ) ( ON-TABLE ?auto_205304 ) ( ON ?auto_205305 ?auto_205304 ) ( not ( = ?auto_205304 ?auto_205305 ) ) ( not ( = ?auto_205304 ?auto_205306 ) ) ( not ( = ?auto_205305 ?auto_205306 ) ) ( CLEAR ?auto_205308 ) ( not ( = ?auto_205304 ?auto_205307 ) ) ( not ( = ?auto_205304 ?auto_205308 ) ) ( not ( = ?auto_205305 ?auto_205307 ) ) ( not ( = ?auto_205305 ?auto_205308 ) ) ( not ( = ?auto_205306 ?auto_205307 ) ) ( not ( = ?auto_205306 ?auto_205308 ) ) ( not ( = ?auto_205307 ?auto_205308 ) ) ( ON ?auto_205307 ?auto_205306 ) ( CLEAR ?auto_205307 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_205304 ?auto_205305 ?auto_205306 )
      ( MAKE-2PILE ?auto_205304 ?auto_205305 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_205309 - BLOCK
      ?auto_205310 - BLOCK
    )
    :vars
    (
      ?auto_205313 - BLOCK
      ?auto_205312 - BLOCK
      ?auto_205311 - BLOCK
      ?auto_205317 - BLOCK
      ?auto_205315 - BLOCK
      ?auto_205316 - BLOCK
      ?auto_205314 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205313 ?auto_205310 ) ( ON-TABLE ?auto_205309 ) ( ON ?auto_205310 ?auto_205309 ) ( not ( = ?auto_205309 ?auto_205310 ) ) ( not ( = ?auto_205309 ?auto_205313 ) ) ( not ( = ?auto_205310 ?auto_205313 ) ) ( not ( = ?auto_205309 ?auto_205312 ) ) ( not ( = ?auto_205309 ?auto_205311 ) ) ( not ( = ?auto_205310 ?auto_205312 ) ) ( not ( = ?auto_205310 ?auto_205311 ) ) ( not ( = ?auto_205313 ?auto_205312 ) ) ( not ( = ?auto_205313 ?auto_205311 ) ) ( not ( = ?auto_205312 ?auto_205311 ) ) ( ON ?auto_205312 ?auto_205313 ) ( CLEAR ?auto_205312 ) ( HOLDING ?auto_205311 ) ( CLEAR ?auto_205317 ) ( ON-TABLE ?auto_205315 ) ( ON ?auto_205316 ?auto_205315 ) ( ON ?auto_205314 ?auto_205316 ) ( ON ?auto_205317 ?auto_205314 ) ( not ( = ?auto_205315 ?auto_205316 ) ) ( not ( = ?auto_205315 ?auto_205314 ) ) ( not ( = ?auto_205315 ?auto_205317 ) ) ( not ( = ?auto_205315 ?auto_205311 ) ) ( not ( = ?auto_205316 ?auto_205314 ) ) ( not ( = ?auto_205316 ?auto_205317 ) ) ( not ( = ?auto_205316 ?auto_205311 ) ) ( not ( = ?auto_205314 ?auto_205317 ) ) ( not ( = ?auto_205314 ?auto_205311 ) ) ( not ( = ?auto_205317 ?auto_205311 ) ) ( not ( = ?auto_205309 ?auto_205317 ) ) ( not ( = ?auto_205309 ?auto_205315 ) ) ( not ( = ?auto_205309 ?auto_205316 ) ) ( not ( = ?auto_205309 ?auto_205314 ) ) ( not ( = ?auto_205310 ?auto_205317 ) ) ( not ( = ?auto_205310 ?auto_205315 ) ) ( not ( = ?auto_205310 ?auto_205316 ) ) ( not ( = ?auto_205310 ?auto_205314 ) ) ( not ( = ?auto_205313 ?auto_205317 ) ) ( not ( = ?auto_205313 ?auto_205315 ) ) ( not ( = ?auto_205313 ?auto_205316 ) ) ( not ( = ?auto_205313 ?auto_205314 ) ) ( not ( = ?auto_205312 ?auto_205317 ) ) ( not ( = ?auto_205312 ?auto_205315 ) ) ( not ( = ?auto_205312 ?auto_205316 ) ) ( not ( = ?auto_205312 ?auto_205314 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_205315 ?auto_205316 ?auto_205314 ?auto_205317 ?auto_205311 )
      ( MAKE-2PILE ?auto_205309 ?auto_205310 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_205318 - BLOCK
      ?auto_205319 - BLOCK
    )
    :vars
    (
      ?auto_205326 - BLOCK
      ?auto_205320 - BLOCK
      ?auto_205324 - BLOCK
      ?auto_205323 - BLOCK
      ?auto_205325 - BLOCK
      ?auto_205322 - BLOCK
      ?auto_205321 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205326 ?auto_205319 ) ( ON-TABLE ?auto_205318 ) ( ON ?auto_205319 ?auto_205318 ) ( not ( = ?auto_205318 ?auto_205319 ) ) ( not ( = ?auto_205318 ?auto_205326 ) ) ( not ( = ?auto_205319 ?auto_205326 ) ) ( not ( = ?auto_205318 ?auto_205320 ) ) ( not ( = ?auto_205318 ?auto_205324 ) ) ( not ( = ?auto_205319 ?auto_205320 ) ) ( not ( = ?auto_205319 ?auto_205324 ) ) ( not ( = ?auto_205326 ?auto_205320 ) ) ( not ( = ?auto_205326 ?auto_205324 ) ) ( not ( = ?auto_205320 ?auto_205324 ) ) ( ON ?auto_205320 ?auto_205326 ) ( CLEAR ?auto_205323 ) ( ON-TABLE ?auto_205325 ) ( ON ?auto_205322 ?auto_205325 ) ( ON ?auto_205321 ?auto_205322 ) ( ON ?auto_205323 ?auto_205321 ) ( not ( = ?auto_205325 ?auto_205322 ) ) ( not ( = ?auto_205325 ?auto_205321 ) ) ( not ( = ?auto_205325 ?auto_205323 ) ) ( not ( = ?auto_205325 ?auto_205324 ) ) ( not ( = ?auto_205322 ?auto_205321 ) ) ( not ( = ?auto_205322 ?auto_205323 ) ) ( not ( = ?auto_205322 ?auto_205324 ) ) ( not ( = ?auto_205321 ?auto_205323 ) ) ( not ( = ?auto_205321 ?auto_205324 ) ) ( not ( = ?auto_205323 ?auto_205324 ) ) ( not ( = ?auto_205318 ?auto_205323 ) ) ( not ( = ?auto_205318 ?auto_205325 ) ) ( not ( = ?auto_205318 ?auto_205322 ) ) ( not ( = ?auto_205318 ?auto_205321 ) ) ( not ( = ?auto_205319 ?auto_205323 ) ) ( not ( = ?auto_205319 ?auto_205325 ) ) ( not ( = ?auto_205319 ?auto_205322 ) ) ( not ( = ?auto_205319 ?auto_205321 ) ) ( not ( = ?auto_205326 ?auto_205323 ) ) ( not ( = ?auto_205326 ?auto_205325 ) ) ( not ( = ?auto_205326 ?auto_205322 ) ) ( not ( = ?auto_205326 ?auto_205321 ) ) ( not ( = ?auto_205320 ?auto_205323 ) ) ( not ( = ?auto_205320 ?auto_205325 ) ) ( not ( = ?auto_205320 ?auto_205322 ) ) ( not ( = ?auto_205320 ?auto_205321 ) ) ( ON ?auto_205324 ?auto_205320 ) ( CLEAR ?auto_205324 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_205318 ?auto_205319 ?auto_205326 ?auto_205320 )
      ( MAKE-2PILE ?auto_205318 ?auto_205319 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_205327 - BLOCK
      ?auto_205328 - BLOCK
    )
    :vars
    (
      ?auto_205331 - BLOCK
      ?auto_205335 - BLOCK
      ?auto_205332 - BLOCK
      ?auto_205329 - BLOCK
      ?auto_205333 - BLOCK
      ?auto_205330 - BLOCK
      ?auto_205334 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205331 ?auto_205328 ) ( ON-TABLE ?auto_205327 ) ( ON ?auto_205328 ?auto_205327 ) ( not ( = ?auto_205327 ?auto_205328 ) ) ( not ( = ?auto_205327 ?auto_205331 ) ) ( not ( = ?auto_205328 ?auto_205331 ) ) ( not ( = ?auto_205327 ?auto_205335 ) ) ( not ( = ?auto_205327 ?auto_205332 ) ) ( not ( = ?auto_205328 ?auto_205335 ) ) ( not ( = ?auto_205328 ?auto_205332 ) ) ( not ( = ?auto_205331 ?auto_205335 ) ) ( not ( = ?auto_205331 ?auto_205332 ) ) ( not ( = ?auto_205335 ?auto_205332 ) ) ( ON ?auto_205335 ?auto_205331 ) ( ON-TABLE ?auto_205329 ) ( ON ?auto_205333 ?auto_205329 ) ( ON ?auto_205330 ?auto_205333 ) ( not ( = ?auto_205329 ?auto_205333 ) ) ( not ( = ?auto_205329 ?auto_205330 ) ) ( not ( = ?auto_205329 ?auto_205334 ) ) ( not ( = ?auto_205329 ?auto_205332 ) ) ( not ( = ?auto_205333 ?auto_205330 ) ) ( not ( = ?auto_205333 ?auto_205334 ) ) ( not ( = ?auto_205333 ?auto_205332 ) ) ( not ( = ?auto_205330 ?auto_205334 ) ) ( not ( = ?auto_205330 ?auto_205332 ) ) ( not ( = ?auto_205334 ?auto_205332 ) ) ( not ( = ?auto_205327 ?auto_205334 ) ) ( not ( = ?auto_205327 ?auto_205329 ) ) ( not ( = ?auto_205327 ?auto_205333 ) ) ( not ( = ?auto_205327 ?auto_205330 ) ) ( not ( = ?auto_205328 ?auto_205334 ) ) ( not ( = ?auto_205328 ?auto_205329 ) ) ( not ( = ?auto_205328 ?auto_205333 ) ) ( not ( = ?auto_205328 ?auto_205330 ) ) ( not ( = ?auto_205331 ?auto_205334 ) ) ( not ( = ?auto_205331 ?auto_205329 ) ) ( not ( = ?auto_205331 ?auto_205333 ) ) ( not ( = ?auto_205331 ?auto_205330 ) ) ( not ( = ?auto_205335 ?auto_205334 ) ) ( not ( = ?auto_205335 ?auto_205329 ) ) ( not ( = ?auto_205335 ?auto_205333 ) ) ( not ( = ?auto_205335 ?auto_205330 ) ) ( ON ?auto_205332 ?auto_205335 ) ( CLEAR ?auto_205332 ) ( HOLDING ?auto_205334 ) ( CLEAR ?auto_205330 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_205329 ?auto_205333 ?auto_205330 ?auto_205334 )
      ( MAKE-2PILE ?auto_205327 ?auto_205328 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_205336 - BLOCK
      ?auto_205337 - BLOCK
    )
    :vars
    (
      ?auto_205341 - BLOCK
      ?auto_205338 - BLOCK
      ?auto_205339 - BLOCK
      ?auto_205343 - BLOCK
      ?auto_205344 - BLOCK
      ?auto_205342 - BLOCK
      ?auto_205340 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205341 ?auto_205337 ) ( ON-TABLE ?auto_205336 ) ( ON ?auto_205337 ?auto_205336 ) ( not ( = ?auto_205336 ?auto_205337 ) ) ( not ( = ?auto_205336 ?auto_205341 ) ) ( not ( = ?auto_205337 ?auto_205341 ) ) ( not ( = ?auto_205336 ?auto_205338 ) ) ( not ( = ?auto_205336 ?auto_205339 ) ) ( not ( = ?auto_205337 ?auto_205338 ) ) ( not ( = ?auto_205337 ?auto_205339 ) ) ( not ( = ?auto_205341 ?auto_205338 ) ) ( not ( = ?auto_205341 ?auto_205339 ) ) ( not ( = ?auto_205338 ?auto_205339 ) ) ( ON ?auto_205338 ?auto_205341 ) ( ON-TABLE ?auto_205343 ) ( ON ?auto_205344 ?auto_205343 ) ( ON ?auto_205342 ?auto_205344 ) ( not ( = ?auto_205343 ?auto_205344 ) ) ( not ( = ?auto_205343 ?auto_205342 ) ) ( not ( = ?auto_205343 ?auto_205340 ) ) ( not ( = ?auto_205343 ?auto_205339 ) ) ( not ( = ?auto_205344 ?auto_205342 ) ) ( not ( = ?auto_205344 ?auto_205340 ) ) ( not ( = ?auto_205344 ?auto_205339 ) ) ( not ( = ?auto_205342 ?auto_205340 ) ) ( not ( = ?auto_205342 ?auto_205339 ) ) ( not ( = ?auto_205340 ?auto_205339 ) ) ( not ( = ?auto_205336 ?auto_205340 ) ) ( not ( = ?auto_205336 ?auto_205343 ) ) ( not ( = ?auto_205336 ?auto_205344 ) ) ( not ( = ?auto_205336 ?auto_205342 ) ) ( not ( = ?auto_205337 ?auto_205340 ) ) ( not ( = ?auto_205337 ?auto_205343 ) ) ( not ( = ?auto_205337 ?auto_205344 ) ) ( not ( = ?auto_205337 ?auto_205342 ) ) ( not ( = ?auto_205341 ?auto_205340 ) ) ( not ( = ?auto_205341 ?auto_205343 ) ) ( not ( = ?auto_205341 ?auto_205344 ) ) ( not ( = ?auto_205341 ?auto_205342 ) ) ( not ( = ?auto_205338 ?auto_205340 ) ) ( not ( = ?auto_205338 ?auto_205343 ) ) ( not ( = ?auto_205338 ?auto_205344 ) ) ( not ( = ?auto_205338 ?auto_205342 ) ) ( ON ?auto_205339 ?auto_205338 ) ( CLEAR ?auto_205342 ) ( ON ?auto_205340 ?auto_205339 ) ( CLEAR ?auto_205340 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_205336 ?auto_205337 ?auto_205341 ?auto_205338 ?auto_205339 )
      ( MAKE-2PILE ?auto_205336 ?auto_205337 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_205345 - BLOCK
      ?auto_205346 - BLOCK
    )
    :vars
    (
      ?auto_205348 - BLOCK
      ?auto_205351 - BLOCK
      ?auto_205353 - BLOCK
      ?auto_205349 - BLOCK
      ?auto_205350 - BLOCK
      ?auto_205352 - BLOCK
      ?auto_205347 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205348 ?auto_205346 ) ( ON-TABLE ?auto_205345 ) ( ON ?auto_205346 ?auto_205345 ) ( not ( = ?auto_205345 ?auto_205346 ) ) ( not ( = ?auto_205345 ?auto_205348 ) ) ( not ( = ?auto_205346 ?auto_205348 ) ) ( not ( = ?auto_205345 ?auto_205351 ) ) ( not ( = ?auto_205345 ?auto_205353 ) ) ( not ( = ?auto_205346 ?auto_205351 ) ) ( not ( = ?auto_205346 ?auto_205353 ) ) ( not ( = ?auto_205348 ?auto_205351 ) ) ( not ( = ?auto_205348 ?auto_205353 ) ) ( not ( = ?auto_205351 ?auto_205353 ) ) ( ON ?auto_205351 ?auto_205348 ) ( ON-TABLE ?auto_205349 ) ( ON ?auto_205350 ?auto_205349 ) ( not ( = ?auto_205349 ?auto_205350 ) ) ( not ( = ?auto_205349 ?auto_205352 ) ) ( not ( = ?auto_205349 ?auto_205347 ) ) ( not ( = ?auto_205349 ?auto_205353 ) ) ( not ( = ?auto_205350 ?auto_205352 ) ) ( not ( = ?auto_205350 ?auto_205347 ) ) ( not ( = ?auto_205350 ?auto_205353 ) ) ( not ( = ?auto_205352 ?auto_205347 ) ) ( not ( = ?auto_205352 ?auto_205353 ) ) ( not ( = ?auto_205347 ?auto_205353 ) ) ( not ( = ?auto_205345 ?auto_205347 ) ) ( not ( = ?auto_205345 ?auto_205349 ) ) ( not ( = ?auto_205345 ?auto_205350 ) ) ( not ( = ?auto_205345 ?auto_205352 ) ) ( not ( = ?auto_205346 ?auto_205347 ) ) ( not ( = ?auto_205346 ?auto_205349 ) ) ( not ( = ?auto_205346 ?auto_205350 ) ) ( not ( = ?auto_205346 ?auto_205352 ) ) ( not ( = ?auto_205348 ?auto_205347 ) ) ( not ( = ?auto_205348 ?auto_205349 ) ) ( not ( = ?auto_205348 ?auto_205350 ) ) ( not ( = ?auto_205348 ?auto_205352 ) ) ( not ( = ?auto_205351 ?auto_205347 ) ) ( not ( = ?auto_205351 ?auto_205349 ) ) ( not ( = ?auto_205351 ?auto_205350 ) ) ( not ( = ?auto_205351 ?auto_205352 ) ) ( ON ?auto_205353 ?auto_205351 ) ( ON ?auto_205347 ?auto_205353 ) ( CLEAR ?auto_205347 ) ( HOLDING ?auto_205352 ) ( CLEAR ?auto_205350 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_205349 ?auto_205350 ?auto_205352 )
      ( MAKE-2PILE ?auto_205345 ?auto_205346 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_205354 - BLOCK
      ?auto_205355 - BLOCK
    )
    :vars
    (
      ?auto_205358 - BLOCK
      ?auto_205357 - BLOCK
      ?auto_205362 - BLOCK
      ?auto_205359 - BLOCK
      ?auto_205356 - BLOCK
      ?auto_205361 - BLOCK
      ?auto_205360 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205358 ?auto_205355 ) ( ON-TABLE ?auto_205354 ) ( ON ?auto_205355 ?auto_205354 ) ( not ( = ?auto_205354 ?auto_205355 ) ) ( not ( = ?auto_205354 ?auto_205358 ) ) ( not ( = ?auto_205355 ?auto_205358 ) ) ( not ( = ?auto_205354 ?auto_205357 ) ) ( not ( = ?auto_205354 ?auto_205362 ) ) ( not ( = ?auto_205355 ?auto_205357 ) ) ( not ( = ?auto_205355 ?auto_205362 ) ) ( not ( = ?auto_205358 ?auto_205357 ) ) ( not ( = ?auto_205358 ?auto_205362 ) ) ( not ( = ?auto_205357 ?auto_205362 ) ) ( ON ?auto_205357 ?auto_205358 ) ( ON-TABLE ?auto_205359 ) ( ON ?auto_205356 ?auto_205359 ) ( not ( = ?auto_205359 ?auto_205356 ) ) ( not ( = ?auto_205359 ?auto_205361 ) ) ( not ( = ?auto_205359 ?auto_205360 ) ) ( not ( = ?auto_205359 ?auto_205362 ) ) ( not ( = ?auto_205356 ?auto_205361 ) ) ( not ( = ?auto_205356 ?auto_205360 ) ) ( not ( = ?auto_205356 ?auto_205362 ) ) ( not ( = ?auto_205361 ?auto_205360 ) ) ( not ( = ?auto_205361 ?auto_205362 ) ) ( not ( = ?auto_205360 ?auto_205362 ) ) ( not ( = ?auto_205354 ?auto_205360 ) ) ( not ( = ?auto_205354 ?auto_205359 ) ) ( not ( = ?auto_205354 ?auto_205356 ) ) ( not ( = ?auto_205354 ?auto_205361 ) ) ( not ( = ?auto_205355 ?auto_205360 ) ) ( not ( = ?auto_205355 ?auto_205359 ) ) ( not ( = ?auto_205355 ?auto_205356 ) ) ( not ( = ?auto_205355 ?auto_205361 ) ) ( not ( = ?auto_205358 ?auto_205360 ) ) ( not ( = ?auto_205358 ?auto_205359 ) ) ( not ( = ?auto_205358 ?auto_205356 ) ) ( not ( = ?auto_205358 ?auto_205361 ) ) ( not ( = ?auto_205357 ?auto_205360 ) ) ( not ( = ?auto_205357 ?auto_205359 ) ) ( not ( = ?auto_205357 ?auto_205356 ) ) ( not ( = ?auto_205357 ?auto_205361 ) ) ( ON ?auto_205362 ?auto_205357 ) ( ON ?auto_205360 ?auto_205362 ) ( CLEAR ?auto_205356 ) ( ON ?auto_205361 ?auto_205360 ) ( CLEAR ?auto_205361 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_205354 ?auto_205355 ?auto_205358 ?auto_205357 ?auto_205362 ?auto_205360 )
      ( MAKE-2PILE ?auto_205354 ?auto_205355 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_205363 - BLOCK
      ?auto_205364 - BLOCK
    )
    :vars
    (
      ?auto_205367 - BLOCK
      ?auto_205366 - BLOCK
      ?auto_205368 - BLOCK
      ?auto_205369 - BLOCK
      ?auto_205365 - BLOCK
      ?auto_205371 - BLOCK
      ?auto_205370 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205367 ?auto_205364 ) ( ON-TABLE ?auto_205363 ) ( ON ?auto_205364 ?auto_205363 ) ( not ( = ?auto_205363 ?auto_205364 ) ) ( not ( = ?auto_205363 ?auto_205367 ) ) ( not ( = ?auto_205364 ?auto_205367 ) ) ( not ( = ?auto_205363 ?auto_205366 ) ) ( not ( = ?auto_205363 ?auto_205368 ) ) ( not ( = ?auto_205364 ?auto_205366 ) ) ( not ( = ?auto_205364 ?auto_205368 ) ) ( not ( = ?auto_205367 ?auto_205366 ) ) ( not ( = ?auto_205367 ?auto_205368 ) ) ( not ( = ?auto_205366 ?auto_205368 ) ) ( ON ?auto_205366 ?auto_205367 ) ( ON-TABLE ?auto_205369 ) ( not ( = ?auto_205369 ?auto_205365 ) ) ( not ( = ?auto_205369 ?auto_205371 ) ) ( not ( = ?auto_205369 ?auto_205370 ) ) ( not ( = ?auto_205369 ?auto_205368 ) ) ( not ( = ?auto_205365 ?auto_205371 ) ) ( not ( = ?auto_205365 ?auto_205370 ) ) ( not ( = ?auto_205365 ?auto_205368 ) ) ( not ( = ?auto_205371 ?auto_205370 ) ) ( not ( = ?auto_205371 ?auto_205368 ) ) ( not ( = ?auto_205370 ?auto_205368 ) ) ( not ( = ?auto_205363 ?auto_205370 ) ) ( not ( = ?auto_205363 ?auto_205369 ) ) ( not ( = ?auto_205363 ?auto_205365 ) ) ( not ( = ?auto_205363 ?auto_205371 ) ) ( not ( = ?auto_205364 ?auto_205370 ) ) ( not ( = ?auto_205364 ?auto_205369 ) ) ( not ( = ?auto_205364 ?auto_205365 ) ) ( not ( = ?auto_205364 ?auto_205371 ) ) ( not ( = ?auto_205367 ?auto_205370 ) ) ( not ( = ?auto_205367 ?auto_205369 ) ) ( not ( = ?auto_205367 ?auto_205365 ) ) ( not ( = ?auto_205367 ?auto_205371 ) ) ( not ( = ?auto_205366 ?auto_205370 ) ) ( not ( = ?auto_205366 ?auto_205369 ) ) ( not ( = ?auto_205366 ?auto_205365 ) ) ( not ( = ?auto_205366 ?auto_205371 ) ) ( ON ?auto_205368 ?auto_205366 ) ( ON ?auto_205370 ?auto_205368 ) ( ON ?auto_205371 ?auto_205370 ) ( CLEAR ?auto_205371 ) ( HOLDING ?auto_205365 ) ( CLEAR ?auto_205369 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_205369 ?auto_205365 )
      ( MAKE-2PILE ?auto_205363 ?auto_205364 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_205372 - BLOCK
      ?auto_205373 - BLOCK
    )
    :vars
    (
      ?auto_205380 - BLOCK
      ?auto_205374 - BLOCK
      ?auto_205376 - BLOCK
      ?auto_205379 - BLOCK
      ?auto_205378 - BLOCK
      ?auto_205375 - BLOCK
      ?auto_205377 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205380 ?auto_205373 ) ( ON-TABLE ?auto_205372 ) ( ON ?auto_205373 ?auto_205372 ) ( not ( = ?auto_205372 ?auto_205373 ) ) ( not ( = ?auto_205372 ?auto_205380 ) ) ( not ( = ?auto_205373 ?auto_205380 ) ) ( not ( = ?auto_205372 ?auto_205374 ) ) ( not ( = ?auto_205372 ?auto_205376 ) ) ( not ( = ?auto_205373 ?auto_205374 ) ) ( not ( = ?auto_205373 ?auto_205376 ) ) ( not ( = ?auto_205380 ?auto_205374 ) ) ( not ( = ?auto_205380 ?auto_205376 ) ) ( not ( = ?auto_205374 ?auto_205376 ) ) ( ON ?auto_205374 ?auto_205380 ) ( ON-TABLE ?auto_205379 ) ( not ( = ?auto_205379 ?auto_205378 ) ) ( not ( = ?auto_205379 ?auto_205375 ) ) ( not ( = ?auto_205379 ?auto_205377 ) ) ( not ( = ?auto_205379 ?auto_205376 ) ) ( not ( = ?auto_205378 ?auto_205375 ) ) ( not ( = ?auto_205378 ?auto_205377 ) ) ( not ( = ?auto_205378 ?auto_205376 ) ) ( not ( = ?auto_205375 ?auto_205377 ) ) ( not ( = ?auto_205375 ?auto_205376 ) ) ( not ( = ?auto_205377 ?auto_205376 ) ) ( not ( = ?auto_205372 ?auto_205377 ) ) ( not ( = ?auto_205372 ?auto_205379 ) ) ( not ( = ?auto_205372 ?auto_205378 ) ) ( not ( = ?auto_205372 ?auto_205375 ) ) ( not ( = ?auto_205373 ?auto_205377 ) ) ( not ( = ?auto_205373 ?auto_205379 ) ) ( not ( = ?auto_205373 ?auto_205378 ) ) ( not ( = ?auto_205373 ?auto_205375 ) ) ( not ( = ?auto_205380 ?auto_205377 ) ) ( not ( = ?auto_205380 ?auto_205379 ) ) ( not ( = ?auto_205380 ?auto_205378 ) ) ( not ( = ?auto_205380 ?auto_205375 ) ) ( not ( = ?auto_205374 ?auto_205377 ) ) ( not ( = ?auto_205374 ?auto_205379 ) ) ( not ( = ?auto_205374 ?auto_205378 ) ) ( not ( = ?auto_205374 ?auto_205375 ) ) ( ON ?auto_205376 ?auto_205374 ) ( ON ?auto_205377 ?auto_205376 ) ( ON ?auto_205375 ?auto_205377 ) ( CLEAR ?auto_205379 ) ( ON ?auto_205378 ?auto_205375 ) ( CLEAR ?auto_205378 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_205372 ?auto_205373 ?auto_205380 ?auto_205374 ?auto_205376 ?auto_205377 ?auto_205375 )
      ( MAKE-2PILE ?auto_205372 ?auto_205373 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_205381 - BLOCK
      ?auto_205382 - BLOCK
    )
    :vars
    (
      ?auto_205386 - BLOCK
      ?auto_205388 - BLOCK
      ?auto_205384 - BLOCK
      ?auto_205387 - BLOCK
      ?auto_205385 - BLOCK
      ?auto_205383 - BLOCK
      ?auto_205389 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205386 ?auto_205382 ) ( ON-TABLE ?auto_205381 ) ( ON ?auto_205382 ?auto_205381 ) ( not ( = ?auto_205381 ?auto_205382 ) ) ( not ( = ?auto_205381 ?auto_205386 ) ) ( not ( = ?auto_205382 ?auto_205386 ) ) ( not ( = ?auto_205381 ?auto_205388 ) ) ( not ( = ?auto_205381 ?auto_205384 ) ) ( not ( = ?auto_205382 ?auto_205388 ) ) ( not ( = ?auto_205382 ?auto_205384 ) ) ( not ( = ?auto_205386 ?auto_205388 ) ) ( not ( = ?auto_205386 ?auto_205384 ) ) ( not ( = ?auto_205388 ?auto_205384 ) ) ( ON ?auto_205388 ?auto_205386 ) ( not ( = ?auto_205387 ?auto_205385 ) ) ( not ( = ?auto_205387 ?auto_205383 ) ) ( not ( = ?auto_205387 ?auto_205389 ) ) ( not ( = ?auto_205387 ?auto_205384 ) ) ( not ( = ?auto_205385 ?auto_205383 ) ) ( not ( = ?auto_205385 ?auto_205389 ) ) ( not ( = ?auto_205385 ?auto_205384 ) ) ( not ( = ?auto_205383 ?auto_205389 ) ) ( not ( = ?auto_205383 ?auto_205384 ) ) ( not ( = ?auto_205389 ?auto_205384 ) ) ( not ( = ?auto_205381 ?auto_205389 ) ) ( not ( = ?auto_205381 ?auto_205387 ) ) ( not ( = ?auto_205381 ?auto_205385 ) ) ( not ( = ?auto_205381 ?auto_205383 ) ) ( not ( = ?auto_205382 ?auto_205389 ) ) ( not ( = ?auto_205382 ?auto_205387 ) ) ( not ( = ?auto_205382 ?auto_205385 ) ) ( not ( = ?auto_205382 ?auto_205383 ) ) ( not ( = ?auto_205386 ?auto_205389 ) ) ( not ( = ?auto_205386 ?auto_205387 ) ) ( not ( = ?auto_205386 ?auto_205385 ) ) ( not ( = ?auto_205386 ?auto_205383 ) ) ( not ( = ?auto_205388 ?auto_205389 ) ) ( not ( = ?auto_205388 ?auto_205387 ) ) ( not ( = ?auto_205388 ?auto_205385 ) ) ( not ( = ?auto_205388 ?auto_205383 ) ) ( ON ?auto_205384 ?auto_205388 ) ( ON ?auto_205389 ?auto_205384 ) ( ON ?auto_205383 ?auto_205389 ) ( ON ?auto_205385 ?auto_205383 ) ( CLEAR ?auto_205385 ) ( HOLDING ?auto_205387 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_205387 )
      ( MAKE-2PILE ?auto_205381 ?auto_205382 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_205390 - BLOCK
      ?auto_205391 - BLOCK
    )
    :vars
    (
      ?auto_205398 - BLOCK
      ?auto_205397 - BLOCK
      ?auto_205394 - BLOCK
      ?auto_205392 - BLOCK
      ?auto_205393 - BLOCK
      ?auto_205395 - BLOCK
      ?auto_205396 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205398 ?auto_205391 ) ( ON-TABLE ?auto_205390 ) ( ON ?auto_205391 ?auto_205390 ) ( not ( = ?auto_205390 ?auto_205391 ) ) ( not ( = ?auto_205390 ?auto_205398 ) ) ( not ( = ?auto_205391 ?auto_205398 ) ) ( not ( = ?auto_205390 ?auto_205397 ) ) ( not ( = ?auto_205390 ?auto_205394 ) ) ( not ( = ?auto_205391 ?auto_205397 ) ) ( not ( = ?auto_205391 ?auto_205394 ) ) ( not ( = ?auto_205398 ?auto_205397 ) ) ( not ( = ?auto_205398 ?auto_205394 ) ) ( not ( = ?auto_205397 ?auto_205394 ) ) ( ON ?auto_205397 ?auto_205398 ) ( not ( = ?auto_205392 ?auto_205393 ) ) ( not ( = ?auto_205392 ?auto_205395 ) ) ( not ( = ?auto_205392 ?auto_205396 ) ) ( not ( = ?auto_205392 ?auto_205394 ) ) ( not ( = ?auto_205393 ?auto_205395 ) ) ( not ( = ?auto_205393 ?auto_205396 ) ) ( not ( = ?auto_205393 ?auto_205394 ) ) ( not ( = ?auto_205395 ?auto_205396 ) ) ( not ( = ?auto_205395 ?auto_205394 ) ) ( not ( = ?auto_205396 ?auto_205394 ) ) ( not ( = ?auto_205390 ?auto_205396 ) ) ( not ( = ?auto_205390 ?auto_205392 ) ) ( not ( = ?auto_205390 ?auto_205393 ) ) ( not ( = ?auto_205390 ?auto_205395 ) ) ( not ( = ?auto_205391 ?auto_205396 ) ) ( not ( = ?auto_205391 ?auto_205392 ) ) ( not ( = ?auto_205391 ?auto_205393 ) ) ( not ( = ?auto_205391 ?auto_205395 ) ) ( not ( = ?auto_205398 ?auto_205396 ) ) ( not ( = ?auto_205398 ?auto_205392 ) ) ( not ( = ?auto_205398 ?auto_205393 ) ) ( not ( = ?auto_205398 ?auto_205395 ) ) ( not ( = ?auto_205397 ?auto_205396 ) ) ( not ( = ?auto_205397 ?auto_205392 ) ) ( not ( = ?auto_205397 ?auto_205393 ) ) ( not ( = ?auto_205397 ?auto_205395 ) ) ( ON ?auto_205394 ?auto_205397 ) ( ON ?auto_205396 ?auto_205394 ) ( ON ?auto_205395 ?auto_205396 ) ( ON ?auto_205393 ?auto_205395 ) ( ON ?auto_205392 ?auto_205393 ) ( CLEAR ?auto_205392 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_205390 ?auto_205391 ?auto_205398 ?auto_205397 ?auto_205394 ?auto_205396 ?auto_205395 ?auto_205393 )
      ( MAKE-2PILE ?auto_205390 ?auto_205391 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_205406 - BLOCK
      ?auto_205407 - BLOCK
      ?auto_205408 - BLOCK
      ?auto_205409 - BLOCK
      ?auto_205410 - BLOCK
      ?auto_205411 - BLOCK
      ?auto_205412 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_205412 ) ( CLEAR ?auto_205411 ) ( ON-TABLE ?auto_205406 ) ( ON ?auto_205407 ?auto_205406 ) ( ON ?auto_205408 ?auto_205407 ) ( ON ?auto_205409 ?auto_205408 ) ( ON ?auto_205410 ?auto_205409 ) ( ON ?auto_205411 ?auto_205410 ) ( not ( = ?auto_205406 ?auto_205407 ) ) ( not ( = ?auto_205406 ?auto_205408 ) ) ( not ( = ?auto_205406 ?auto_205409 ) ) ( not ( = ?auto_205406 ?auto_205410 ) ) ( not ( = ?auto_205406 ?auto_205411 ) ) ( not ( = ?auto_205406 ?auto_205412 ) ) ( not ( = ?auto_205407 ?auto_205408 ) ) ( not ( = ?auto_205407 ?auto_205409 ) ) ( not ( = ?auto_205407 ?auto_205410 ) ) ( not ( = ?auto_205407 ?auto_205411 ) ) ( not ( = ?auto_205407 ?auto_205412 ) ) ( not ( = ?auto_205408 ?auto_205409 ) ) ( not ( = ?auto_205408 ?auto_205410 ) ) ( not ( = ?auto_205408 ?auto_205411 ) ) ( not ( = ?auto_205408 ?auto_205412 ) ) ( not ( = ?auto_205409 ?auto_205410 ) ) ( not ( = ?auto_205409 ?auto_205411 ) ) ( not ( = ?auto_205409 ?auto_205412 ) ) ( not ( = ?auto_205410 ?auto_205411 ) ) ( not ( = ?auto_205410 ?auto_205412 ) ) ( not ( = ?auto_205411 ?auto_205412 ) ) )
    :subtasks
    ( ( !STACK ?auto_205412 ?auto_205411 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_205413 - BLOCK
      ?auto_205414 - BLOCK
      ?auto_205415 - BLOCK
      ?auto_205416 - BLOCK
      ?auto_205417 - BLOCK
      ?auto_205418 - BLOCK
      ?auto_205419 - BLOCK
    )
    :vars
    (
      ?auto_205420 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_205418 ) ( ON-TABLE ?auto_205413 ) ( ON ?auto_205414 ?auto_205413 ) ( ON ?auto_205415 ?auto_205414 ) ( ON ?auto_205416 ?auto_205415 ) ( ON ?auto_205417 ?auto_205416 ) ( ON ?auto_205418 ?auto_205417 ) ( not ( = ?auto_205413 ?auto_205414 ) ) ( not ( = ?auto_205413 ?auto_205415 ) ) ( not ( = ?auto_205413 ?auto_205416 ) ) ( not ( = ?auto_205413 ?auto_205417 ) ) ( not ( = ?auto_205413 ?auto_205418 ) ) ( not ( = ?auto_205413 ?auto_205419 ) ) ( not ( = ?auto_205414 ?auto_205415 ) ) ( not ( = ?auto_205414 ?auto_205416 ) ) ( not ( = ?auto_205414 ?auto_205417 ) ) ( not ( = ?auto_205414 ?auto_205418 ) ) ( not ( = ?auto_205414 ?auto_205419 ) ) ( not ( = ?auto_205415 ?auto_205416 ) ) ( not ( = ?auto_205415 ?auto_205417 ) ) ( not ( = ?auto_205415 ?auto_205418 ) ) ( not ( = ?auto_205415 ?auto_205419 ) ) ( not ( = ?auto_205416 ?auto_205417 ) ) ( not ( = ?auto_205416 ?auto_205418 ) ) ( not ( = ?auto_205416 ?auto_205419 ) ) ( not ( = ?auto_205417 ?auto_205418 ) ) ( not ( = ?auto_205417 ?auto_205419 ) ) ( not ( = ?auto_205418 ?auto_205419 ) ) ( ON ?auto_205419 ?auto_205420 ) ( CLEAR ?auto_205419 ) ( HAND-EMPTY ) ( not ( = ?auto_205413 ?auto_205420 ) ) ( not ( = ?auto_205414 ?auto_205420 ) ) ( not ( = ?auto_205415 ?auto_205420 ) ) ( not ( = ?auto_205416 ?auto_205420 ) ) ( not ( = ?auto_205417 ?auto_205420 ) ) ( not ( = ?auto_205418 ?auto_205420 ) ) ( not ( = ?auto_205419 ?auto_205420 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_205419 ?auto_205420 )
      ( MAKE-7PILE ?auto_205413 ?auto_205414 ?auto_205415 ?auto_205416 ?auto_205417 ?auto_205418 ?auto_205419 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_205421 - BLOCK
      ?auto_205422 - BLOCK
      ?auto_205423 - BLOCK
      ?auto_205424 - BLOCK
      ?auto_205425 - BLOCK
      ?auto_205426 - BLOCK
      ?auto_205427 - BLOCK
    )
    :vars
    (
      ?auto_205428 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_205421 ) ( ON ?auto_205422 ?auto_205421 ) ( ON ?auto_205423 ?auto_205422 ) ( ON ?auto_205424 ?auto_205423 ) ( ON ?auto_205425 ?auto_205424 ) ( not ( = ?auto_205421 ?auto_205422 ) ) ( not ( = ?auto_205421 ?auto_205423 ) ) ( not ( = ?auto_205421 ?auto_205424 ) ) ( not ( = ?auto_205421 ?auto_205425 ) ) ( not ( = ?auto_205421 ?auto_205426 ) ) ( not ( = ?auto_205421 ?auto_205427 ) ) ( not ( = ?auto_205422 ?auto_205423 ) ) ( not ( = ?auto_205422 ?auto_205424 ) ) ( not ( = ?auto_205422 ?auto_205425 ) ) ( not ( = ?auto_205422 ?auto_205426 ) ) ( not ( = ?auto_205422 ?auto_205427 ) ) ( not ( = ?auto_205423 ?auto_205424 ) ) ( not ( = ?auto_205423 ?auto_205425 ) ) ( not ( = ?auto_205423 ?auto_205426 ) ) ( not ( = ?auto_205423 ?auto_205427 ) ) ( not ( = ?auto_205424 ?auto_205425 ) ) ( not ( = ?auto_205424 ?auto_205426 ) ) ( not ( = ?auto_205424 ?auto_205427 ) ) ( not ( = ?auto_205425 ?auto_205426 ) ) ( not ( = ?auto_205425 ?auto_205427 ) ) ( not ( = ?auto_205426 ?auto_205427 ) ) ( ON ?auto_205427 ?auto_205428 ) ( CLEAR ?auto_205427 ) ( not ( = ?auto_205421 ?auto_205428 ) ) ( not ( = ?auto_205422 ?auto_205428 ) ) ( not ( = ?auto_205423 ?auto_205428 ) ) ( not ( = ?auto_205424 ?auto_205428 ) ) ( not ( = ?auto_205425 ?auto_205428 ) ) ( not ( = ?auto_205426 ?auto_205428 ) ) ( not ( = ?auto_205427 ?auto_205428 ) ) ( HOLDING ?auto_205426 ) ( CLEAR ?auto_205425 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_205421 ?auto_205422 ?auto_205423 ?auto_205424 ?auto_205425 ?auto_205426 )
      ( MAKE-7PILE ?auto_205421 ?auto_205422 ?auto_205423 ?auto_205424 ?auto_205425 ?auto_205426 ?auto_205427 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_205429 - BLOCK
      ?auto_205430 - BLOCK
      ?auto_205431 - BLOCK
      ?auto_205432 - BLOCK
      ?auto_205433 - BLOCK
      ?auto_205434 - BLOCK
      ?auto_205435 - BLOCK
    )
    :vars
    (
      ?auto_205436 - BLOCK
      ?auto_205437 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_205429 ) ( ON ?auto_205430 ?auto_205429 ) ( ON ?auto_205431 ?auto_205430 ) ( ON ?auto_205432 ?auto_205431 ) ( ON ?auto_205433 ?auto_205432 ) ( not ( = ?auto_205429 ?auto_205430 ) ) ( not ( = ?auto_205429 ?auto_205431 ) ) ( not ( = ?auto_205429 ?auto_205432 ) ) ( not ( = ?auto_205429 ?auto_205433 ) ) ( not ( = ?auto_205429 ?auto_205434 ) ) ( not ( = ?auto_205429 ?auto_205435 ) ) ( not ( = ?auto_205430 ?auto_205431 ) ) ( not ( = ?auto_205430 ?auto_205432 ) ) ( not ( = ?auto_205430 ?auto_205433 ) ) ( not ( = ?auto_205430 ?auto_205434 ) ) ( not ( = ?auto_205430 ?auto_205435 ) ) ( not ( = ?auto_205431 ?auto_205432 ) ) ( not ( = ?auto_205431 ?auto_205433 ) ) ( not ( = ?auto_205431 ?auto_205434 ) ) ( not ( = ?auto_205431 ?auto_205435 ) ) ( not ( = ?auto_205432 ?auto_205433 ) ) ( not ( = ?auto_205432 ?auto_205434 ) ) ( not ( = ?auto_205432 ?auto_205435 ) ) ( not ( = ?auto_205433 ?auto_205434 ) ) ( not ( = ?auto_205433 ?auto_205435 ) ) ( not ( = ?auto_205434 ?auto_205435 ) ) ( ON ?auto_205435 ?auto_205436 ) ( not ( = ?auto_205429 ?auto_205436 ) ) ( not ( = ?auto_205430 ?auto_205436 ) ) ( not ( = ?auto_205431 ?auto_205436 ) ) ( not ( = ?auto_205432 ?auto_205436 ) ) ( not ( = ?auto_205433 ?auto_205436 ) ) ( not ( = ?auto_205434 ?auto_205436 ) ) ( not ( = ?auto_205435 ?auto_205436 ) ) ( CLEAR ?auto_205433 ) ( ON ?auto_205434 ?auto_205435 ) ( CLEAR ?auto_205434 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_205437 ) ( ON ?auto_205436 ?auto_205437 ) ( not ( = ?auto_205437 ?auto_205436 ) ) ( not ( = ?auto_205437 ?auto_205435 ) ) ( not ( = ?auto_205437 ?auto_205434 ) ) ( not ( = ?auto_205429 ?auto_205437 ) ) ( not ( = ?auto_205430 ?auto_205437 ) ) ( not ( = ?auto_205431 ?auto_205437 ) ) ( not ( = ?auto_205432 ?auto_205437 ) ) ( not ( = ?auto_205433 ?auto_205437 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_205437 ?auto_205436 ?auto_205435 )
      ( MAKE-7PILE ?auto_205429 ?auto_205430 ?auto_205431 ?auto_205432 ?auto_205433 ?auto_205434 ?auto_205435 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_205438 - BLOCK
      ?auto_205439 - BLOCK
      ?auto_205440 - BLOCK
      ?auto_205441 - BLOCK
      ?auto_205442 - BLOCK
      ?auto_205443 - BLOCK
      ?auto_205444 - BLOCK
    )
    :vars
    (
      ?auto_205445 - BLOCK
      ?auto_205446 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_205438 ) ( ON ?auto_205439 ?auto_205438 ) ( ON ?auto_205440 ?auto_205439 ) ( ON ?auto_205441 ?auto_205440 ) ( not ( = ?auto_205438 ?auto_205439 ) ) ( not ( = ?auto_205438 ?auto_205440 ) ) ( not ( = ?auto_205438 ?auto_205441 ) ) ( not ( = ?auto_205438 ?auto_205442 ) ) ( not ( = ?auto_205438 ?auto_205443 ) ) ( not ( = ?auto_205438 ?auto_205444 ) ) ( not ( = ?auto_205439 ?auto_205440 ) ) ( not ( = ?auto_205439 ?auto_205441 ) ) ( not ( = ?auto_205439 ?auto_205442 ) ) ( not ( = ?auto_205439 ?auto_205443 ) ) ( not ( = ?auto_205439 ?auto_205444 ) ) ( not ( = ?auto_205440 ?auto_205441 ) ) ( not ( = ?auto_205440 ?auto_205442 ) ) ( not ( = ?auto_205440 ?auto_205443 ) ) ( not ( = ?auto_205440 ?auto_205444 ) ) ( not ( = ?auto_205441 ?auto_205442 ) ) ( not ( = ?auto_205441 ?auto_205443 ) ) ( not ( = ?auto_205441 ?auto_205444 ) ) ( not ( = ?auto_205442 ?auto_205443 ) ) ( not ( = ?auto_205442 ?auto_205444 ) ) ( not ( = ?auto_205443 ?auto_205444 ) ) ( ON ?auto_205444 ?auto_205445 ) ( not ( = ?auto_205438 ?auto_205445 ) ) ( not ( = ?auto_205439 ?auto_205445 ) ) ( not ( = ?auto_205440 ?auto_205445 ) ) ( not ( = ?auto_205441 ?auto_205445 ) ) ( not ( = ?auto_205442 ?auto_205445 ) ) ( not ( = ?auto_205443 ?auto_205445 ) ) ( not ( = ?auto_205444 ?auto_205445 ) ) ( ON ?auto_205443 ?auto_205444 ) ( CLEAR ?auto_205443 ) ( ON-TABLE ?auto_205446 ) ( ON ?auto_205445 ?auto_205446 ) ( not ( = ?auto_205446 ?auto_205445 ) ) ( not ( = ?auto_205446 ?auto_205444 ) ) ( not ( = ?auto_205446 ?auto_205443 ) ) ( not ( = ?auto_205438 ?auto_205446 ) ) ( not ( = ?auto_205439 ?auto_205446 ) ) ( not ( = ?auto_205440 ?auto_205446 ) ) ( not ( = ?auto_205441 ?auto_205446 ) ) ( not ( = ?auto_205442 ?auto_205446 ) ) ( HOLDING ?auto_205442 ) ( CLEAR ?auto_205441 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_205438 ?auto_205439 ?auto_205440 ?auto_205441 ?auto_205442 )
      ( MAKE-7PILE ?auto_205438 ?auto_205439 ?auto_205440 ?auto_205441 ?auto_205442 ?auto_205443 ?auto_205444 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_205447 - BLOCK
      ?auto_205448 - BLOCK
      ?auto_205449 - BLOCK
      ?auto_205450 - BLOCK
      ?auto_205451 - BLOCK
      ?auto_205452 - BLOCK
      ?auto_205453 - BLOCK
    )
    :vars
    (
      ?auto_205454 - BLOCK
      ?auto_205455 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_205447 ) ( ON ?auto_205448 ?auto_205447 ) ( ON ?auto_205449 ?auto_205448 ) ( ON ?auto_205450 ?auto_205449 ) ( not ( = ?auto_205447 ?auto_205448 ) ) ( not ( = ?auto_205447 ?auto_205449 ) ) ( not ( = ?auto_205447 ?auto_205450 ) ) ( not ( = ?auto_205447 ?auto_205451 ) ) ( not ( = ?auto_205447 ?auto_205452 ) ) ( not ( = ?auto_205447 ?auto_205453 ) ) ( not ( = ?auto_205448 ?auto_205449 ) ) ( not ( = ?auto_205448 ?auto_205450 ) ) ( not ( = ?auto_205448 ?auto_205451 ) ) ( not ( = ?auto_205448 ?auto_205452 ) ) ( not ( = ?auto_205448 ?auto_205453 ) ) ( not ( = ?auto_205449 ?auto_205450 ) ) ( not ( = ?auto_205449 ?auto_205451 ) ) ( not ( = ?auto_205449 ?auto_205452 ) ) ( not ( = ?auto_205449 ?auto_205453 ) ) ( not ( = ?auto_205450 ?auto_205451 ) ) ( not ( = ?auto_205450 ?auto_205452 ) ) ( not ( = ?auto_205450 ?auto_205453 ) ) ( not ( = ?auto_205451 ?auto_205452 ) ) ( not ( = ?auto_205451 ?auto_205453 ) ) ( not ( = ?auto_205452 ?auto_205453 ) ) ( ON ?auto_205453 ?auto_205454 ) ( not ( = ?auto_205447 ?auto_205454 ) ) ( not ( = ?auto_205448 ?auto_205454 ) ) ( not ( = ?auto_205449 ?auto_205454 ) ) ( not ( = ?auto_205450 ?auto_205454 ) ) ( not ( = ?auto_205451 ?auto_205454 ) ) ( not ( = ?auto_205452 ?auto_205454 ) ) ( not ( = ?auto_205453 ?auto_205454 ) ) ( ON ?auto_205452 ?auto_205453 ) ( ON-TABLE ?auto_205455 ) ( ON ?auto_205454 ?auto_205455 ) ( not ( = ?auto_205455 ?auto_205454 ) ) ( not ( = ?auto_205455 ?auto_205453 ) ) ( not ( = ?auto_205455 ?auto_205452 ) ) ( not ( = ?auto_205447 ?auto_205455 ) ) ( not ( = ?auto_205448 ?auto_205455 ) ) ( not ( = ?auto_205449 ?auto_205455 ) ) ( not ( = ?auto_205450 ?auto_205455 ) ) ( not ( = ?auto_205451 ?auto_205455 ) ) ( CLEAR ?auto_205450 ) ( ON ?auto_205451 ?auto_205452 ) ( CLEAR ?auto_205451 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_205455 ?auto_205454 ?auto_205453 ?auto_205452 )
      ( MAKE-7PILE ?auto_205447 ?auto_205448 ?auto_205449 ?auto_205450 ?auto_205451 ?auto_205452 ?auto_205453 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_205456 - BLOCK
      ?auto_205457 - BLOCK
      ?auto_205458 - BLOCK
      ?auto_205459 - BLOCK
      ?auto_205460 - BLOCK
      ?auto_205461 - BLOCK
      ?auto_205462 - BLOCK
    )
    :vars
    (
      ?auto_205463 - BLOCK
      ?auto_205464 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_205456 ) ( ON ?auto_205457 ?auto_205456 ) ( ON ?auto_205458 ?auto_205457 ) ( not ( = ?auto_205456 ?auto_205457 ) ) ( not ( = ?auto_205456 ?auto_205458 ) ) ( not ( = ?auto_205456 ?auto_205459 ) ) ( not ( = ?auto_205456 ?auto_205460 ) ) ( not ( = ?auto_205456 ?auto_205461 ) ) ( not ( = ?auto_205456 ?auto_205462 ) ) ( not ( = ?auto_205457 ?auto_205458 ) ) ( not ( = ?auto_205457 ?auto_205459 ) ) ( not ( = ?auto_205457 ?auto_205460 ) ) ( not ( = ?auto_205457 ?auto_205461 ) ) ( not ( = ?auto_205457 ?auto_205462 ) ) ( not ( = ?auto_205458 ?auto_205459 ) ) ( not ( = ?auto_205458 ?auto_205460 ) ) ( not ( = ?auto_205458 ?auto_205461 ) ) ( not ( = ?auto_205458 ?auto_205462 ) ) ( not ( = ?auto_205459 ?auto_205460 ) ) ( not ( = ?auto_205459 ?auto_205461 ) ) ( not ( = ?auto_205459 ?auto_205462 ) ) ( not ( = ?auto_205460 ?auto_205461 ) ) ( not ( = ?auto_205460 ?auto_205462 ) ) ( not ( = ?auto_205461 ?auto_205462 ) ) ( ON ?auto_205462 ?auto_205463 ) ( not ( = ?auto_205456 ?auto_205463 ) ) ( not ( = ?auto_205457 ?auto_205463 ) ) ( not ( = ?auto_205458 ?auto_205463 ) ) ( not ( = ?auto_205459 ?auto_205463 ) ) ( not ( = ?auto_205460 ?auto_205463 ) ) ( not ( = ?auto_205461 ?auto_205463 ) ) ( not ( = ?auto_205462 ?auto_205463 ) ) ( ON ?auto_205461 ?auto_205462 ) ( ON-TABLE ?auto_205464 ) ( ON ?auto_205463 ?auto_205464 ) ( not ( = ?auto_205464 ?auto_205463 ) ) ( not ( = ?auto_205464 ?auto_205462 ) ) ( not ( = ?auto_205464 ?auto_205461 ) ) ( not ( = ?auto_205456 ?auto_205464 ) ) ( not ( = ?auto_205457 ?auto_205464 ) ) ( not ( = ?auto_205458 ?auto_205464 ) ) ( not ( = ?auto_205459 ?auto_205464 ) ) ( not ( = ?auto_205460 ?auto_205464 ) ) ( ON ?auto_205460 ?auto_205461 ) ( CLEAR ?auto_205460 ) ( HOLDING ?auto_205459 ) ( CLEAR ?auto_205458 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_205456 ?auto_205457 ?auto_205458 ?auto_205459 )
      ( MAKE-7PILE ?auto_205456 ?auto_205457 ?auto_205458 ?auto_205459 ?auto_205460 ?auto_205461 ?auto_205462 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_205465 - BLOCK
      ?auto_205466 - BLOCK
      ?auto_205467 - BLOCK
      ?auto_205468 - BLOCK
      ?auto_205469 - BLOCK
      ?auto_205470 - BLOCK
      ?auto_205471 - BLOCK
    )
    :vars
    (
      ?auto_205473 - BLOCK
      ?auto_205472 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_205465 ) ( ON ?auto_205466 ?auto_205465 ) ( ON ?auto_205467 ?auto_205466 ) ( not ( = ?auto_205465 ?auto_205466 ) ) ( not ( = ?auto_205465 ?auto_205467 ) ) ( not ( = ?auto_205465 ?auto_205468 ) ) ( not ( = ?auto_205465 ?auto_205469 ) ) ( not ( = ?auto_205465 ?auto_205470 ) ) ( not ( = ?auto_205465 ?auto_205471 ) ) ( not ( = ?auto_205466 ?auto_205467 ) ) ( not ( = ?auto_205466 ?auto_205468 ) ) ( not ( = ?auto_205466 ?auto_205469 ) ) ( not ( = ?auto_205466 ?auto_205470 ) ) ( not ( = ?auto_205466 ?auto_205471 ) ) ( not ( = ?auto_205467 ?auto_205468 ) ) ( not ( = ?auto_205467 ?auto_205469 ) ) ( not ( = ?auto_205467 ?auto_205470 ) ) ( not ( = ?auto_205467 ?auto_205471 ) ) ( not ( = ?auto_205468 ?auto_205469 ) ) ( not ( = ?auto_205468 ?auto_205470 ) ) ( not ( = ?auto_205468 ?auto_205471 ) ) ( not ( = ?auto_205469 ?auto_205470 ) ) ( not ( = ?auto_205469 ?auto_205471 ) ) ( not ( = ?auto_205470 ?auto_205471 ) ) ( ON ?auto_205471 ?auto_205473 ) ( not ( = ?auto_205465 ?auto_205473 ) ) ( not ( = ?auto_205466 ?auto_205473 ) ) ( not ( = ?auto_205467 ?auto_205473 ) ) ( not ( = ?auto_205468 ?auto_205473 ) ) ( not ( = ?auto_205469 ?auto_205473 ) ) ( not ( = ?auto_205470 ?auto_205473 ) ) ( not ( = ?auto_205471 ?auto_205473 ) ) ( ON ?auto_205470 ?auto_205471 ) ( ON-TABLE ?auto_205472 ) ( ON ?auto_205473 ?auto_205472 ) ( not ( = ?auto_205472 ?auto_205473 ) ) ( not ( = ?auto_205472 ?auto_205471 ) ) ( not ( = ?auto_205472 ?auto_205470 ) ) ( not ( = ?auto_205465 ?auto_205472 ) ) ( not ( = ?auto_205466 ?auto_205472 ) ) ( not ( = ?auto_205467 ?auto_205472 ) ) ( not ( = ?auto_205468 ?auto_205472 ) ) ( not ( = ?auto_205469 ?auto_205472 ) ) ( ON ?auto_205469 ?auto_205470 ) ( CLEAR ?auto_205467 ) ( ON ?auto_205468 ?auto_205469 ) ( CLEAR ?auto_205468 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_205472 ?auto_205473 ?auto_205471 ?auto_205470 ?auto_205469 )
      ( MAKE-7PILE ?auto_205465 ?auto_205466 ?auto_205467 ?auto_205468 ?auto_205469 ?auto_205470 ?auto_205471 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_205474 - BLOCK
      ?auto_205475 - BLOCK
      ?auto_205476 - BLOCK
      ?auto_205477 - BLOCK
      ?auto_205478 - BLOCK
      ?auto_205479 - BLOCK
      ?auto_205480 - BLOCK
    )
    :vars
    (
      ?auto_205481 - BLOCK
      ?auto_205482 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_205474 ) ( ON ?auto_205475 ?auto_205474 ) ( not ( = ?auto_205474 ?auto_205475 ) ) ( not ( = ?auto_205474 ?auto_205476 ) ) ( not ( = ?auto_205474 ?auto_205477 ) ) ( not ( = ?auto_205474 ?auto_205478 ) ) ( not ( = ?auto_205474 ?auto_205479 ) ) ( not ( = ?auto_205474 ?auto_205480 ) ) ( not ( = ?auto_205475 ?auto_205476 ) ) ( not ( = ?auto_205475 ?auto_205477 ) ) ( not ( = ?auto_205475 ?auto_205478 ) ) ( not ( = ?auto_205475 ?auto_205479 ) ) ( not ( = ?auto_205475 ?auto_205480 ) ) ( not ( = ?auto_205476 ?auto_205477 ) ) ( not ( = ?auto_205476 ?auto_205478 ) ) ( not ( = ?auto_205476 ?auto_205479 ) ) ( not ( = ?auto_205476 ?auto_205480 ) ) ( not ( = ?auto_205477 ?auto_205478 ) ) ( not ( = ?auto_205477 ?auto_205479 ) ) ( not ( = ?auto_205477 ?auto_205480 ) ) ( not ( = ?auto_205478 ?auto_205479 ) ) ( not ( = ?auto_205478 ?auto_205480 ) ) ( not ( = ?auto_205479 ?auto_205480 ) ) ( ON ?auto_205480 ?auto_205481 ) ( not ( = ?auto_205474 ?auto_205481 ) ) ( not ( = ?auto_205475 ?auto_205481 ) ) ( not ( = ?auto_205476 ?auto_205481 ) ) ( not ( = ?auto_205477 ?auto_205481 ) ) ( not ( = ?auto_205478 ?auto_205481 ) ) ( not ( = ?auto_205479 ?auto_205481 ) ) ( not ( = ?auto_205480 ?auto_205481 ) ) ( ON ?auto_205479 ?auto_205480 ) ( ON-TABLE ?auto_205482 ) ( ON ?auto_205481 ?auto_205482 ) ( not ( = ?auto_205482 ?auto_205481 ) ) ( not ( = ?auto_205482 ?auto_205480 ) ) ( not ( = ?auto_205482 ?auto_205479 ) ) ( not ( = ?auto_205474 ?auto_205482 ) ) ( not ( = ?auto_205475 ?auto_205482 ) ) ( not ( = ?auto_205476 ?auto_205482 ) ) ( not ( = ?auto_205477 ?auto_205482 ) ) ( not ( = ?auto_205478 ?auto_205482 ) ) ( ON ?auto_205478 ?auto_205479 ) ( ON ?auto_205477 ?auto_205478 ) ( CLEAR ?auto_205477 ) ( HOLDING ?auto_205476 ) ( CLEAR ?auto_205475 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_205474 ?auto_205475 ?auto_205476 )
      ( MAKE-7PILE ?auto_205474 ?auto_205475 ?auto_205476 ?auto_205477 ?auto_205478 ?auto_205479 ?auto_205480 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_205483 - BLOCK
      ?auto_205484 - BLOCK
      ?auto_205485 - BLOCK
      ?auto_205486 - BLOCK
      ?auto_205487 - BLOCK
      ?auto_205488 - BLOCK
      ?auto_205489 - BLOCK
    )
    :vars
    (
      ?auto_205490 - BLOCK
      ?auto_205491 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_205483 ) ( ON ?auto_205484 ?auto_205483 ) ( not ( = ?auto_205483 ?auto_205484 ) ) ( not ( = ?auto_205483 ?auto_205485 ) ) ( not ( = ?auto_205483 ?auto_205486 ) ) ( not ( = ?auto_205483 ?auto_205487 ) ) ( not ( = ?auto_205483 ?auto_205488 ) ) ( not ( = ?auto_205483 ?auto_205489 ) ) ( not ( = ?auto_205484 ?auto_205485 ) ) ( not ( = ?auto_205484 ?auto_205486 ) ) ( not ( = ?auto_205484 ?auto_205487 ) ) ( not ( = ?auto_205484 ?auto_205488 ) ) ( not ( = ?auto_205484 ?auto_205489 ) ) ( not ( = ?auto_205485 ?auto_205486 ) ) ( not ( = ?auto_205485 ?auto_205487 ) ) ( not ( = ?auto_205485 ?auto_205488 ) ) ( not ( = ?auto_205485 ?auto_205489 ) ) ( not ( = ?auto_205486 ?auto_205487 ) ) ( not ( = ?auto_205486 ?auto_205488 ) ) ( not ( = ?auto_205486 ?auto_205489 ) ) ( not ( = ?auto_205487 ?auto_205488 ) ) ( not ( = ?auto_205487 ?auto_205489 ) ) ( not ( = ?auto_205488 ?auto_205489 ) ) ( ON ?auto_205489 ?auto_205490 ) ( not ( = ?auto_205483 ?auto_205490 ) ) ( not ( = ?auto_205484 ?auto_205490 ) ) ( not ( = ?auto_205485 ?auto_205490 ) ) ( not ( = ?auto_205486 ?auto_205490 ) ) ( not ( = ?auto_205487 ?auto_205490 ) ) ( not ( = ?auto_205488 ?auto_205490 ) ) ( not ( = ?auto_205489 ?auto_205490 ) ) ( ON ?auto_205488 ?auto_205489 ) ( ON-TABLE ?auto_205491 ) ( ON ?auto_205490 ?auto_205491 ) ( not ( = ?auto_205491 ?auto_205490 ) ) ( not ( = ?auto_205491 ?auto_205489 ) ) ( not ( = ?auto_205491 ?auto_205488 ) ) ( not ( = ?auto_205483 ?auto_205491 ) ) ( not ( = ?auto_205484 ?auto_205491 ) ) ( not ( = ?auto_205485 ?auto_205491 ) ) ( not ( = ?auto_205486 ?auto_205491 ) ) ( not ( = ?auto_205487 ?auto_205491 ) ) ( ON ?auto_205487 ?auto_205488 ) ( ON ?auto_205486 ?auto_205487 ) ( CLEAR ?auto_205484 ) ( ON ?auto_205485 ?auto_205486 ) ( CLEAR ?auto_205485 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_205491 ?auto_205490 ?auto_205489 ?auto_205488 ?auto_205487 ?auto_205486 )
      ( MAKE-7PILE ?auto_205483 ?auto_205484 ?auto_205485 ?auto_205486 ?auto_205487 ?auto_205488 ?auto_205489 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_205492 - BLOCK
      ?auto_205493 - BLOCK
      ?auto_205494 - BLOCK
      ?auto_205495 - BLOCK
      ?auto_205496 - BLOCK
      ?auto_205497 - BLOCK
      ?auto_205498 - BLOCK
    )
    :vars
    (
      ?auto_205499 - BLOCK
      ?auto_205500 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_205492 ) ( not ( = ?auto_205492 ?auto_205493 ) ) ( not ( = ?auto_205492 ?auto_205494 ) ) ( not ( = ?auto_205492 ?auto_205495 ) ) ( not ( = ?auto_205492 ?auto_205496 ) ) ( not ( = ?auto_205492 ?auto_205497 ) ) ( not ( = ?auto_205492 ?auto_205498 ) ) ( not ( = ?auto_205493 ?auto_205494 ) ) ( not ( = ?auto_205493 ?auto_205495 ) ) ( not ( = ?auto_205493 ?auto_205496 ) ) ( not ( = ?auto_205493 ?auto_205497 ) ) ( not ( = ?auto_205493 ?auto_205498 ) ) ( not ( = ?auto_205494 ?auto_205495 ) ) ( not ( = ?auto_205494 ?auto_205496 ) ) ( not ( = ?auto_205494 ?auto_205497 ) ) ( not ( = ?auto_205494 ?auto_205498 ) ) ( not ( = ?auto_205495 ?auto_205496 ) ) ( not ( = ?auto_205495 ?auto_205497 ) ) ( not ( = ?auto_205495 ?auto_205498 ) ) ( not ( = ?auto_205496 ?auto_205497 ) ) ( not ( = ?auto_205496 ?auto_205498 ) ) ( not ( = ?auto_205497 ?auto_205498 ) ) ( ON ?auto_205498 ?auto_205499 ) ( not ( = ?auto_205492 ?auto_205499 ) ) ( not ( = ?auto_205493 ?auto_205499 ) ) ( not ( = ?auto_205494 ?auto_205499 ) ) ( not ( = ?auto_205495 ?auto_205499 ) ) ( not ( = ?auto_205496 ?auto_205499 ) ) ( not ( = ?auto_205497 ?auto_205499 ) ) ( not ( = ?auto_205498 ?auto_205499 ) ) ( ON ?auto_205497 ?auto_205498 ) ( ON-TABLE ?auto_205500 ) ( ON ?auto_205499 ?auto_205500 ) ( not ( = ?auto_205500 ?auto_205499 ) ) ( not ( = ?auto_205500 ?auto_205498 ) ) ( not ( = ?auto_205500 ?auto_205497 ) ) ( not ( = ?auto_205492 ?auto_205500 ) ) ( not ( = ?auto_205493 ?auto_205500 ) ) ( not ( = ?auto_205494 ?auto_205500 ) ) ( not ( = ?auto_205495 ?auto_205500 ) ) ( not ( = ?auto_205496 ?auto_205500 ) ) ( ON ?auto_205496 ?auto_205497 ) ( ON ?auto_205495 ?auto_205496 ) ( ON ?auto_205494 ?auto_205495 ) ( CLEAR ?auto_205494 ) ( HOLDING ?auto_205493 ) ( CLEAR ?auto_205492 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_205492 ?auto_205493 )
      ( MAKE-7PILE ?auto_205492 ?auto_205493 ?auto_205494 ?auto_205495 ?auto_205496 ?auto_205497 ?auto_205498 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_205501 - BLOCK
      ?auto_205502 - BLOCK
      ?auto_205503 - BLOCK
      ?auto_205504 - BLOCK
      ?auto_205505 - BLOCK
      ?auto_205506 - BLOCK
      ?auto_205507 - BLOCK
    )
    :vars
    (
      ?auto_205509 - BLOCK
      ?auto_205508 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_205501 ) ( not ( = ?auto_205501 ?auto_205502 ) ) ( not ( = ?auto_205501 ?auto_205503 ) ) ( not ( = ?auto_205501 ?auto_205504 ) ) ( not ( = ?auto_205501 ?auto_205505 ) ) ( not ( = ?auto_205501 ?auto_205506 ) ) ( not ( = ?auto_205501 ?auto_205507 ) ) ( not ( = ?auto_205502 ?auto_205503 ) ) ( not ( = ?auto_205502 ?auto_205504 ) ) ( not ( = ?auto_205502 ?auto_205505 ) ) ( not ( = ?auto_205502 ?auto_205506 ) ) ( not ( = ?auto_205502 ?auto_205507 ) ) ( not ( = ?auto_205503 ?auto_205504 ) ) ( not ( = ?auto_205503 ?auto_205505 ) ) ( not ( = ?auto_205503 ?auto_205506 ) ) ( not ( = ?auto_205503 ?auto_205507 ) ) ( not ( = ?auto_205504 ?auto_205505 ) ) ( not ( = ?auto_205504 ?auto_205506 ) ) ( not ( = ?auto_205504 ?auto_205507 ) ) ( not ( = ?auto_205505 ?auto_205506 ) ) ( not ( = ?auto_205505 ?auto_205507 ) ) ( not ( = ?auto_205506 ?auto_205507 ) ) ( ON ?auto_205507 ?auto_205509 ) ( not ( = ?auto_205501 ?auto_205509 ) ) ( not ( = ?auto_205502 ?auto_205509 ) ) ( not ( = ?auto_205503 ?auto_205509 ) ) ( not ( = ?auto_205504 ?auto_205509 ) ) ( not ( = ?auto_205505 ?auto_205509 ) ) ( not ( = ?auto_205506 ?auto_205509 ) ) ( not ( = ?auto_205507 ?auto_205509 ) ) ( ON ?auto_205506 ?auto_205507 ) ( ON-TABLE ?auto_205508 ) ( ON ?auto_205509 ?auto_205508 ) ( not ( = ?auto_205508 ?auto_205509 ) ) ( not ( = ?auto_205508 ?auto_205507 ) ) ( not ( = ?auto_205508 ?auto_205506 ) ) ( not ( = ?auto_205501 ?auto_205508 ) ) ( not ( = ?auto_205502 ?auto_205508 ) ) ( not ( = ?auto_205503 ?auto_205508 ) ) ( not ( = ?auto_205504 ?auto_205508 ) ) ( not ( = ?auto_205505 ?auto_205508 ) ) ( ON ?auto_205505 ?auto_205506 ) ( ON ?auto_205504 ?auto_205505 ) ( ON ?auto_205503 ?auto_205504 ) ( CLEAR ?auto_205501 ) ( ON ?auto_205502 ?auto_205503 ) ( CLEAR ?auto_205502 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_205508 ?auto_205509 ?auto_205507 ?auto_205506 ?auto_205505 ?auto_205504 ?auto_205503 )
      ( MAKE-7PILE ?auto_205501 ?auto_205502 ?auto_205503 ?auto_205504 ?auto_205505 ?auto_205506 ?auto_205507 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_205510 - BLOCK
      ?auto_205511 - BLOCK
      ?auto_205512 - BLOCK
      ?auto_205513 - BLOCK
      ?auto_205514 - BLOCK
      ?auto_205515 - BLOCK
      ?auto_205516 - BLOCK
    )
    :vars
    (
      ?auto_205517 - BLOCK
      ?auto_205518 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_205510 ?auto_205511 ) ) ( not ( = ?auto_205510 ?auto_205512 ) ) ( not ( = ?auto_205510 ?auto_205513 ) ) ( not ( = ?auto_205510 ?auto_205514 ) ) ( not ( = ?auto_205510 ?auto_205515 ) ) ( not ( = ?auto_205510 ?auto_205516 ) ) ( not ( = ?auto_205511 ?auto_205512 ) ) ( not ( = ?auto_205511 ?auto_205513 ) ) ( not ( = ?auto_205511 ?auto_205514 ) ) ( not ( = ?auto_205511 ?auto_205515 ) ) ( not ( = ?auto_205511 ?auto_205516 ) ) ( not ( = ?auto_205512 ?auto_205513 ) ) ( not ( = ?auto_205512 ?auto_205514 ) ) ( not ( = ?auto_205512 ?auto_205515 ) ) ( not ( = ?auto_205512 ?auto_205516 ) ) ( not ( = ?auto_205513 ?auto_205514 ) ) ( not ( = ?auto_205513 ?auto_205515 ) ) ( not ( = ?auto_205513 ?auto_205516 ) ) ( not ( = ?auto_205514 ?auto_205515 ) ) ( not ( = ?auto_205514 ?auto_205516 ) ) ( not ( = ?auto_205515 ?auto_205516 ) ) ( ON ?auto_205516 ?auto_205517 ) ( not ( = ?auto_205510 ?auto_205517 ) ) ( not ( = ?auto_205511 ?auto_205517 ) ) ( not ( = ?auto_205512 ?auto_205517 ) ) ( not ( = ?auto_205513 ?auto_205517 ) ) ( not ( = ?auto_205514 ?auto_205517 ) ) ( not ( = ?auto_205515 ?auto_205517 ) ) ( not ( = ?auto_205516 ?auto_205517 ) ) ( ON ?auto_205515 ?auto_205516 ) ( ON-TABLE ?auto_205518 ) ( ON ?auto_205517 ?auto_205518 ) ( not ( = ?auto_205518 ?auto_205517 ) ) ( not ( = ?auto_205518 ?auto_205516 ) ) ( not ( = ?auto_205518 ?auto_205515 ) ) ( not ( = ?auto_205510 ?auto_205518 ) ) ( not ( = ?auto_205511 ?auto_205518 ) ) ( not ( = ?auto_205512 ?auto_205518 ) ) ( not ( = ?auto_205513 ?auto_205518 ) ) ( not ( = ?auto_205514 ?auto_205518 ) ) ( ON ?auto_205514 ?auto_205515 ) ( ON ?auto_205513 ?auto_205514 ) ( ON ?auto_205512 ?auto_205513 ) ( ON ?auto_205511 ?auto_205512 ) ( CLEAR ?auto_205511 ) ( HOLDING ?auto_205510 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_205510 )
      ( MAKE-7PILE ?auto_205510 ?auto_205511 ?auto_205512 ?auto_205513 ?auto_205514 ?auto_205515 ?auto_205516 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_205519 - BLOCK
      ?auto_205520 - BLOCK
      ?auto_205521 - BLOCK
      ?auto_205522 - BLOCK
      ?auto_205523 - BLOCK
      ?auto_205524 - BLOCK
      ?auto_205525 - BLOCK
    )
    :vars
    (
      ?auto_205526 - BLOCK
      ?auto_205527 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_205519 ?auto_205520 ) ) ( not ( = ?auto_205519 ?auto_205521 ) ) ( not ( = ?auto_205519 ?auto_205522 ) ) ( not ( = ?auto_205519 ?auto_205523 ) ) ( not ( = ?auto_205519 ?auto_205524 ) ) ( not ( = ?auto_205519 ?auto_205525 ) ) ( not ( = ?auto_205520 ?auto_205521 ) ) ( not ( = ?auto_205520 ?auto_205522 ) ) ( not ( = ?auto_205520 ?auto_205523 ) ) ( not ( = ?auto_205520 ?auto_205524 ) ) ( not ( = ?auto_205520 ?auto_205525 ) ) ( not ( = ?auto_205521 ?auto_205522 ) ) ( not ( = ?auto_205521 ?auto_205523 ) ) ( not ( = ?auto_205521 ?auto_205524 ) ) ( not ( = ?auto_205521 ?auto_205525 ) ) ( not ( = ?auto_205522 ?auto_205523 ) ) ( not ( = ?auto_205522 ?auto_205524 ) ) ( not ( = ?auto_205522 ?auto_205525 ) ) ( not ( = ?auto_205523 ?auto_205524 ) ) ( not ( = ?auto_205523 ?auto_205525 ) ) ( not ( = ?auto_205524 ?auto_205525 ) ) ( ON ?auto_205525 ?auto_205526 ) ( not ( = ?auto_205519 ?auto_205526 ) ) ( not ( = ?auto_205520 ?auto_205526 ) ) ( not ( = ?auto_205521 ?auto_205526 ) ) ( not ( = ?auto_205522 ?auto_205526 ) ) ( not ( = ?auto_205523 ?auto_205526 ) ) ( not ( = ?auto_205524 ?auto_205526 ) ) ( not ( = ?auto_205525 ?auto_205526 ) ) ( ON ?auto_205524 ?auto_205525 ) ( ON-TABLE ?auto_205527 ) ( ON ?auto_205526 ?auto_205527 ) ( not ( = ?auto_205527 ?auto_205526 ) ) ( not ( = ?auto_205527 ?auto_205525 ) ) ( not ( = ?auto_205527 ?auto_205524 ) ) ( not ( = ?auto_205519 ?auto_205527 ) ) ( not ( = ?auto_205520 ?auto_205527 ) ) ( not ( = ?auto_205521 ?auto_205527 ) ) ( not ( = ?auto_205522 ?auto_205527 ) ) ( not ( = ?auto_205523 ?auto_205527 ) ) ( ON ?auto_205523 ?auto_205524 ) ( ON ?auto_205522 ?auto_205523 ) ( ON ?auto_205521 ?auto_205522 ) ( ON ?auto_205520 ?auto_205521 ) ( ON ?auto_205519 ?auto_205520 ) ( CLEAR ?auto_205519 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_205527 ?auto_205526 ?auto_205525 ?auto_205524 ?auto_205523 ?auto_205522 ?auto_205521 ?auto_205520 )
      ( MAKE-7PILE ?auto_205519 ?auto_205520 ?auto_205521 ?auto_205522 ?auto_205523 ?auto_205524 ?auto_205525 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_205529 - BLOCK
    )
    :vars
    (
      ?auto_205530 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205530 ?auto_205529 ) ( CLEAR ?auto_205530 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_205529 ) ( not ( = ?auto_205529 ?auto_205530 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_205530 ?auto_205529 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_205531 - BLOCK
    )
    :vars
    (
      ?auto_205532 - BLOCK
      ?auto_205533 - BLOCK
      ?auto_205534 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205532 ?auto_205531 ) ( CLEAR ?auto_205532 ) ( ON-TABLE ?auto_205531 ) ( not ( = ?auto_205531 ?auto_205532 ) ) ( HOLDING ?auto_205533 ) ( CLEAR ?auto_205534 ) ( not ( = ?auto_205531 ?auto_205533 ) ) ( not ( = ?auto_205531 ?auto_205534 ) ) ( not ( = ?auto_205532 ?auto_205533 ) ) ( not ( = ?auto_205532 ?auto_205534 ) ) ( not ( = ?auto_205533 ?auto_205534 ) ) )
    :subtasks
    ( ( !STACK ?auto_205533 ?auto_205534 )
      ( MAKE-1PILE ?auto_205531 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_205535 - BLOCK
    )
    :vars
    (
      ?auto_205537 - BLOCK
      ?auto_205538 - BLOCK
      ?auto_205536 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205537 ?auto_205535 ) ( ON-TABLE ?auto_205535 ) ( not ( = ?auto_205535 ?auto_205537 ) ) ( CLEAR ?auto_205538 ) ( not ( = ?auto_205535 ?auto_205536 ) ) ( not ( = ?auto_205535 ?auto_205538 ) ) ( not ( = ?auto_205537 ?auto_205536 ) ) ( not ( = ?auto_205537 ?auto_205538 ) ) ( not ( = ?auto_205536 ?auto_205538 ) ) ( ON ?auto_205536 ?auto_205537 ) ( CLEAR ?auto_205536 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_205535 ?auto_205537 )
      ( MAKE-1PILE ?auto_205535 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_205539 - BLOCK
    )
    :vars
    (
      ?auto_205540 - BLOCK
      ?auto_205542 - BLOCK
      ?auto_205541 - BLOCK
      ?auto_205544 - BLOCK
      ?auto_205546 - BLOCK
      ?auto_205543 - BLOCK
      ?auto_205547 - BLOCK
      ?auto_205545 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205540 ?auto_205539 ) ( ON-TABLE ?auto_205539 ) ( not ( = ?auto_205539 ?auto_205540 ) ) ( not ( = ?auto_205539 ?auto_205542 ) ) ( not ( = ?auto_205539 ?auto_205541 ) ) ( not ( = ?auto_205540 ?auto_205542 ) ) ( not ( = ?auto_205540 ?auto_205541 ) ) ( not ( = ?auto_205542 ?auto_205541 ) ) ( ON ?auto_205542 ?auto_205540 ) ( CLEAR ?auto_205542 ) ( HOLDING ?auto_205541 ) ( CLEAR ?auto_205544 ) ( ON-TABLE ?auto_205546 ) ( ON ?auto_205543 ?auto_205546 ) ( ON ?auto_205547 ?auto_205543 ) ( ON ?auto_205545 ?auto_205547 ) ( ON ?auto_205544 ?auto_205545 ) ( not ( = ?auto_205546 ?auto_205543 ) ) ( not ( = ?auto_205546 ?auto_205547 ) ) ( not ( = ?auto_205546 ?auto_205545 ) ) ( not ( = ?auto_205546 ?auto_205544 ) ) ( not ( = ?auto_205546 ?auto_205541 ) ) ( not ( = ?auto_205543 ?auto_205547 ) ) ( not ( = ?auto_205543 ?auto_205545 ) ) ( not ( = ?auto_205543 ?auto_205544 ) ) ( not ( = ?auto_205543 ?auto_205541 ) ) ( not ( = ?auto_205547 ?auto_205545 ) ) ( not ( = ?auto_205547 ?auto_205544 ) ) ( not ( = ?auto_205547 ?auto_205541 ) ) ( not ( = ?auto_205545 ?auto_205544 ) ) ( not ( = ?auto_205545 ?auto_205541 ) ) ( not ( = ?auto_205544 ?auto_205541 ) ) ( not ( = ?auto_205539 ?auto_205544 ) ) ( not ( = ?auto_205539 ?auto_205546 ) ) ( not ( = ?auto_205539 ?auto_205543 ) ) ( not ( = ?auto_205539 ?auto_205547 ) ) ( not ( = ?auto_205539 ?auto_205545 ) ) ( not ( = ?auto_205540 ?auto_205544 ) ) ( not ( = ?auto_205540 ?auto_205546 ) ) ( not ( = ?auto_205540 ?auto_205543 ) ) ( not ( = ?auto_205540 ?auto_205547 ) ) ( not ( = ?auto_205540 ?auto_205545 ) ) ( not ( = ?auto_205542 ?auto_205544 ) ) ( not ( = ?auto_205542 ?auto_205546 ) ) ( not ( = ?auto_205542 ?auto_205543 ) ) ( not ( = ?auto_205542 ?auto_205547 ) ) ( not ( = ?auto_205542 ?auto_205545 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_205546 ?auto_205543 ?auto_205547 ?auto_205545 ?auto_205544 ?auto_205541 )
      ( MAKE-1PILE ?auto_205539 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_205548 - BLOCK
    )
    :vars
    (
      ?auto_205551 - BLOCK
      ?auto_205554 - BLOCK
      ?auto_205555 - BLOCK
      ?auto_205556 - BLOCK
      ?auto_205550 - BLOCK
      ?auto_205549 - BLOCK
      ?auto_205553 - BLOCK
      ?auto_205552 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205551 ?auto_205548 ) ( ON-TABLE ?auto_205548 ) ( not ( = ?auto_205548 ?auto_205551 ) ) ( not ( = ?auto_205548 ?auto_205554 ) ) ( not ( = ?auto_205548 ?auto_205555 ) ) ( not ( = ?auto_205551 ?auto_205554 ) ) ( not ( = ?auto_205551 ?auto_205555 ) ) ( not ( = ?auto_205554 ?auto_205555 ) ) ( ON ?auto_205554 ?auto_205551 ) ( CLEAR ?auto_205556 ) ( ON-TABLE ?auto_205550 ) ( ON ?auto_205549 ?auto_205550 ) ( ON ?auto_205553 ?auto_205549 ) ( ON ?auto_205552 ?auto_205553 ) ( ON ?auto_205556 ?auto_205552 ) ( not ( = ?auto_205550 ?auto_205549 ) ) ( not ( = ?auto_205550 ?auto_205553 ) ) ( not ( = ?auto_205550 ?auto_205552 ) ) ( not ( = ?auto_205550 ?auto_205556 ) ) ( not ( = ?auto_205550 ?auto_205555 ) ) ( not ( = ?auto_205549 ?auto_205553 ) ) ( not ( = ?auto_205549 ?auto_205552 ) ) ( not ( = ?auto_205549 ?auto_205556 ) ) ( not ( = ?auto_205549 ?auto_205555 ) ) ( not ( = ?auto_205553 ?auto_205552 ) ) ( not ( = ?auto_205553 ?auto_205556 ) ) ( not ( = ?auto_205553 ?auto_205555 ) ) ( not ( = ?auto_205552 ?auto_205556 ) ) ( not ( = ?auto_205552 ?auto_205555 ) ) ( not ( = ?auto_205556 ?auto_205555 ) ) ( not ( = ?auto_205548 ?auto_205556 ) ) ( not ( = ?auto_205548 ?auto_205550 ) ) ( not ( = ?auto_205548 ?auto_205549 ) ) ( not ( = ?auto_205548 ?auto_205553 ) ) ( not ( = ?auto_205548 ?auto_205552 ) ) ( not ( = ?auto_205551 ?auto_205556 ) ) ( not ( = ?auto_205551 ?auto_205550 ) ) ( not ( = ?auto_205551 ?auto_205549 ) ) ( not ( = ?auto_205551 ?auto_205553 ) ) ( not ( = ?auto_205551 ?auto_205552 ) ) ( not ( = ?auto_205554 ?auto_205556 ) ) ( not ( = ?auto_205554 ?auto_205550 ) ) ( not ( = ?auto_205554 ?auto_205549 ) ) ( not ( = ?auto_205554 ?auto_205553 ) ) ( not ( = ?auto_205554 ?auto_205552 ) ) ( ON ?auto_205555 ?auto_205554 ) ( CLEAR ?auto_205555 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_205548 ?auto_205551 ?auto_205554 )
      ( MAKE-1PILE ?auto_205548 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_205557 - BLOCK
    )
    :vars
    (
      ?auto_205560 - BLOCK
      ?auto_205564 - BLOCK
      ?auto_205565 - BLOCK
      ?auto_205559 - BLOCK
      ?auto_205561 - BLOCK
      ?auto_205562 - BLOCK
      ?auto_205563 - BLOCK
      ?auto_205558 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205560 ?auto_205557 ) ( ON-TABLE ?auto_205557 ) ( not ( = ?auto_205557 ?auto_205560 ) ) ( not ( = ?auto_205557 ?auto_205564 ) ) ( not ( = ?auto_205557 ?auto_205565 ) ) ( not ( = ?auto_205560 ?auto_205564 ) ) ( not ( = ?auto_205560 ?auto_205565 ) ) ( not ( = ?auto_205564 ?auto_205565 ) ) ( ON ?auto_205564 ?auto_205560 ) ( ON-TABLE ?auto_205559 ) ( ON ?auto_205561 ?auto_205559 ) ( ON ?auto_205562 ?auto_205561 ) ( ON ?auto_205563 ?auto_205562 ) ( not ( = ?auto_205559 ?auto_205561 ) ) ( not ( = ?auto_205559 ?auto_205562 ) ) ( not ( = ?auto_205559 ?auto_205563 ) ) ( not ( = ?auto_205559 ?auto_205558 ) ) ( not ( = ?auto_205559 ?auto_205565 ) ) ( not ( = ?auto_205561 ?auto_205562 ) ) ( not ( = ?auto_205561 ?auto_205563 ) ) ( not ( = ?auto_205561 ?auto_205558 ) ) ( not ( = ?auto_205561 ?auto_205565 ) ) ( not ( = ?auto_205562 ?auto_205563 ) ) ( not ( = ?auto_205562 ?auto_205558 ) ) ( not ( = ?auto_205562 ?auto_205565 ) ) ( not ( = ?auto_205563 ?auto_205558 ) ) ( not ( = ?auto_205563 ?auto_205565 ) ) ( not ( = ?auto_205558 ?auto_205565 ) ) ( not ( = ?auto_205557 ?auto_205558 ) ) ( not ( = ?auto_205557 ?auto_205559 ) ) ( not ( = ?auto_205557 ?auto_205561 ) ) ( not ( = ?auto_205557 ?auto_205562 ) ) ( not ( = ?auto_205557 ?auto_205563 ) ) ( not ( = ?auto_205560 ?auto_205558 ) ) ( not ( = ?auto_205560 ?auto_205559 ) ) ( not ( = ?auto_205560 ?auto_205561 ) ) ( not ( = ?auto_205560 ?auto_205562 ) ) ( not ( = ?auto_205560 ?auto_205563 ) ) ( not ( = ?auto_205564 ?auto_205558 ) ) ( not ( = ?auto_205564 ?auto_205559 ) ) ( not ( = ?auto_205564 ?auto_205561 ) ) ( not ( = ?auto_205564 ?auto_205562 ) ) ( not ( = ?auto_205564 ?auto_205563 ) ) ( ON ?auto_205565 ?auto_205564 ) ( CLEAR ?auto_205565 ) ( HOLDING ?auto_205558 ) ( CLEAR ?auto_205563 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_205559 ?auto_205561 ?auto_205562 ?auto_205563 ?auto_205558 )
      ( MAKE-1PILE ?auto_205557 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_205566 - BLOCK
    )
    :vars
    (
      ?auto_205571 - BLOCK
      ?auto_205572 - BLOCK
      ?auto_205569 - BLOCK
      ?auto_205570 - BLOCK
      ?auto_205567 - BLOCK
      ?auto_205568 - BLOCK
      ?auto_205573 - BLOCK
      ?auto_205574 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205571 ?auto_205566 ) ( ON-TABLE ?auto_205566 ) ( not ( = ?auto_205566 ?auto_205571 ) ) ( not ( = ?auto_205566 ?auto_205572 ) ) ( not ( = ?auto_205566 ?auto_205569 ) ) ( not ( = ?auto_205571 ?auto_205572 ) ) ( not ( = ?auto_205571 ?auto_205569 ) ) ( not ( = ?auto_205572 ?auto_205569 ) ) ( ON ?auto_205572 ?auto_205571 ) ( ON-TABLE ?auto_205570 ) ( ON ?auto_205567 ?auto_205570 ) ( ON ?auto_205568 ?auto_205567 ) ( ON ?auto_205573 ?auto_205568 ) ( not ( = ?auto_205570 ?auto_205567 ) ) ( not ( = ?auto_205570 ?auto_205568 ) ) ( not ( = ?auto_205570 ?auto_205573 ) ) ( not ( = ?auto_205570 ?auto_205574 ) ) ( not ( = ?auto_205570 ?auto_205569 ) ) ( not ( = ?auto_205567 ?auto_205568 ) ) ( not ( = ?auto_205567 ?auto_205573 ) ) ( not ( = ?auto_205567 ?auto_205574 ) ) ( not ( = ?auto_205567 ?auto_205569 ) ) ( not ( = ?auto_205568 ?auto_205573 ) ) ( not ( = ?auto_205568 ?auto_205574 ) ) ( not ( = ?auto_205568 ?auto_205569 ) ) ( not ( = ?auto_205573 ?auto_205574 ) ) ( not ( = ?auto_205573 ?auto_205569 ) ) ( not ( = ?auto_205574 ?auto_205569 ) ) ( not ( = ?auto_205566 ?auto_205574 ) ) ( not ( = ?auto_205566 ?auto_205570 ) ) ( not ( = ?auto_205566 ?auto_205567 ) ) ( not ( = ?auto_205566 ?auto_205568 ) ) ( not ( = ?auto_205566 ?auto_205573 ) ) ( not ( = ?auto_205571 ?auto_205574 ) ) ( not ( = ?auto_205571 ?auto_205570 ) ) ( not ( = ?auto_205571 ?auto_205567 ) ) ( not ( = ?auto_205571 ?auto_205568 ) ) ( not ( = ?auto_205571 ?auto_205573 ) ) ( not ( = ?auto_205572 ?auto_205574 ) ) ( not ( = ?auto_205572 ?auto_205570 ) ) ( not ( = ?auto_205572 ?auto_205567 ) ) ( not ( = ?auto_205572 ?auto_205568 ) ) ( not ( = ?auto_205572 ?auto_205573 ) ) ( ON ?auto_205569 ?auto_205572 ) ( CLEAR ?auto_205573 ) ( ON ?auto_205574 ?auto_205569 ) ( CLEAR ?auto_205574 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_205566 ?auto_205571 ?auto_205572 ?auto_205569 )
      ( MAKE-1PILE ?auto_205566 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_205575 - BLOCK
    )
    :vars
    (
      ?auto_205577 - BLOCK
      ?auto_205583 - BLOCK
      ?auto_205582 - BLOCK
      ?auto_205579 - BLOCK
      ?auto_205578 - BLOCK
      ?auto_205576 - BLOCK
      ?auto_205580 - BLOCK
      ?auto_205581 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205577 ?auto_205575 ) ( ON-TABLE ?auto_205575 ) ( not ( = ?auto_205575 ?auto_205577 ) ) ( not ( = ?auto_205575 ?auto_205583 ) ) ( not ( = ?auto_205575 ?auto_205582 ) ) ( not ( = ?auto_205577 ?auto_205583 ) ) ( not ( = ?auto_205577 ?auto_205582 ) ) ( not ( = ?auto_205583 ?auto_205582 ) ) ( ON ?auto_205583 ?auto_205577 ) ( ON-TABLE ?auto_205579 ) ( ON ?auto_205578 ?auto_205579 ) ( ON ?auto_205576 ?auto_205578 ) ( not ( = ?auto_205579 ?auto_205578 ) ) ( not ( = ?auto_205579 ?auto_205576 ) ) ( not ( = ?auto_205579 ?auto_205580 ) ) ( not ( = ?auto_205579 ?auto_205581 ) ) ( not ( = ?auto_205579 ?auto_205582 ) ) ( not ( = ?auto_205578 ?auto_205576 ) ) ( not ( = ?auto_205578 ?auto_205580 ) ) ( not ( = ?auto_205578 ?auto_205581 ) ) ( not ( = ?auto_205578 ?auto_205582 ) ) ( not ( = ?auto_205576 ?auto_205580 ) ) ( not ( = ?auto_205576 ?auto_205581 ) ) ( not ( = ?auto_205576 ?auto_205582 ) ) ( not ( = ?auto_205580 ?auto_205581 ) ) ( not ( = ?auto_205580 ?auto_205582 ) ) ( not ( = ?auto_205581 ?auto_205582 ) ) ( not ( = ?auto_205575 ?auto_205581 ) ) ( not ( = ?auto_205575 ?auto_205579 ) ) ( not ( = ?auto_205575 ?auto_205578 ) ) ( not ( = ?auto_205575 ?auto_205576 ) ) ( not ( = ?auto_205575 ?auto_205580 ) ) ( not ( = ?auto_205577 ?auto_205581 ) ) ( not ( = ?auto_205577 ?auto_205579 ) ) ( not ( = ?auto_205577 ?auto_205578 ) ) ( not ( = ?auto_205577 ?auto_205576 ) ) ( not ( = ?auto_205577 ?auto_205580 ) ) ( not ( = ?auto_205583 ?auto_205581 ) ) ( not ( = ?auto_205583 ?auto_205579 ) ) ( not ( = ?auto_205583 ?auto_205578 ) ) ( not ( = ?auto_205583 ?auto_205576 ) ) ( not ( = ?auto_205583 ?auto_205580 ) ) ( ON ?auto_205582 ?auto_205583 ) ( ON ?auto_205581 ?auto_205582 ) ( CLEAR ?auto_205581 ) ( HOLDING ?auto_205580 ) ( CLEAR ?auto_205576 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_205579 ?auto_205578 ?auto_205576 ?auto_205580 )
      ( MAKE-1PILE ?auto_205575 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_205584 - BLOCK
    )
    :vars
    (
      ?auto_205589 - BLOCK
      ?auto_205586 - BLOCK
      ?auto_205588 - BLOCK
      ?auto_205591 - BLOCK
      ?auto_205587 - BLOCK
      ?auto_205585 - BLOCK
      ?auto_205590 - BLOCK
      ?auto_205592 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205589 ?auto_205584 ) ( ON-TABLE ?auto_205584 ) ( not ( = ?auto_205584 ?auto_205589 ) ) ( not ( = ?auto_205584 ?auto_205586 ) ) ( not ( = ?auto_205584 ?auto_205588 ) ) ( not ( = ?auto_205589 ?auto_205586 ) ) ( not ( = ?auto_205589 ?auto_205588 ) ) ( not ( = ?auto_205586 ?auto_205588 ) ) ( ON ?auto_205586 ?auto_205589 ) ( ON-TABLE ?auto_205591 ) ( ON ?auto_205587 ?auto_205591 ) ( ON ?auto_205585 ?auto_205587 ) ( not ( = ?auto_205591 ?auto_205587 ) ) ( not ( = ?auto_205591 ?auto_205585 ) ) ( not ( = ?auto_205591 ?auto_205590 ) ) ( not ( = ?auto_205591 ?auto_205592 ) ) ( not ( = ?auto_205591 ?auto_205588 ) ) ( not ( = ?auto_205587 ?auto_205585 ) ) ( not ( = ?auto_205587 ?auto_205590 ) ) ( not ( = ?auto_205587 ?auto_205592 ) ) ( not ( = ?auto_205587 ?auto_205588 ) ) ( not ( = ?auto_205585 ?auto_205590 ) ) ( not ( = ?auto_205585 ?auto_205592 ) ) ( not ( = ?auto_205585 ?auto_205588 ) ) ( not ( = ?auto_205590 ?auto_205592 ) ) ( not ( = ?auto_205590 ?auto_205588 ) ) ( not ( = ?auto_205592 ?auto_205588 ) ) ( not ( = ?auto_205584 ?auto_205592 ) ) ( not ( = ?auto_205584 ?auto_205591 ) ) ( not ( = ?auto_205584 ?auto_205587 ) ) ( not ( = ?auto_205584 ?auto_205585 ) ) ( not ( = ?auto_205584 ?auto_205590 ) ) ( not ( = ?auto_205589 ?auto_205592 ) ) ( not ( = ?auto_205589 ?auto_205591 ) ) ( not ( = ?auto_205589 ?auto_205587 ) ) ( not ( = ?auto_205589 ?auto_205585 ) ) ( not ( = ?auto_205589 ?auto_205590 ) ) ( not ( = ?auto_205586 ?auto_205592 ) ) ( not ( = ?auto_205586 ?auto_205591 ) ) ( not ( = ?auto_205586 ?auto_205587 ) ) ( not ( = ?auto_205586 ?auto_205585 ) ) ( not ( = ?auto_205586 ?auto_205590 ) ) ( ON ?auto_205588 ?auto_205586 ) ( ON ?auto_205592 ?auto_205588 ) ( CLEAR ?auto_205585 ) ( ON ?auto_205590 ?auto_205592 ) ( CLEAR ?auto_205590 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_205584 ?auto_205589 ?auto_205586 ?auto_205588 ?auto_205592 )
      ( MAKE-1PILE ?auto_205584 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_205593 - BLOCK
    )
    :vars
    (
      ?auto_205595 - BLOCK
      ?auto_205600 - BLOCK
      ?auto_205597 - BLOCK
      ?auto_205601 - BLOCK
      ?auto_205598 - BLOCK
      ?auto_205599 - BLOCK
      ?auto_205596 - BLOCK
      ?auto_205594 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205595 ?auto_205593 ) ( ON-TABLE ?auto_205593 ) ( not ( = ?auto_205593 ?auto_205595 ) ) ( not ( = ?auto_205593 ?auto_205600 ) ) ( not ( = ?auto_205593 ?auto_205597 ) ) ( not ( = ?auto_205595 ?auto_205600 ) ) ( not ( = ?auto_205595 ?auto_205597 ) ) ( not ( = ?auto_205600 ?auto_205597 ) ) ( ON ?auto_205600 ?auto_205595 ) ( ON-TABLE ?auto_205601 ) ( ON ?auto_205598 ?auto_205601 ) ( not ( = ?auto_205601 ?auto_205598 ) ) ( not ( = ?auto_205601 ?auto_205599 ) ) ( not ( = ?auto_205601 ?auto_205596 ) ) ( not ( = ?auto_205601 ?auto_205594 ) ) ( not ( = ?auto_205601 ?auto_205597 ) ) ( not ( = ?auto_205598 ?auto_205599 ) ) ( not ( = ?auto_205598 ?auto_205596 ) ) ( not ( = ?auto_205598 ?auto_205594 ) ) ( not ( = ?auto_205598 ?auto_205597 ) ) ( not ( = ?auto_205599 ?auto_205596 ) ) ( not ( = ?auto_205599 ?auto_205594 ) ) ( not ( = ?auto_205599 ?auto_205597 ) ) ( not ( = ?auto_205596 ?auto_205594 ) ) ( not ( = ?auto_205596 ?auto_205597 ) ) ( not ( = ?auto_205594 ?auto_205597 ) ) ( not ( = ?auto_205593 ?auto_205594 ) ) ( not ( = ?auto_205593 ?auto_205601 ) ) ( not ( = ?auto_205593 ?auto_205598 ) ) ( not ( = ?auto_205593 ?auto_205599 ) ) ( not ( = ?auto_205593 ?auto_205596 ) ) ( not ( = ?auto_205595 ?auto_205594 ) ) ( not ( = ?auto_205595 ?auto_205601 ) ) ( not ( = ?auto_205595 ?auto_205598 ) ) ( not ( = ?auto_205595 ?auto_205599 ) ) ( not ( = ?auto_205595 ?auto_205596 ) ) ( not ( = ?auto_205600 ?auto_205594 ) ) ( not ( = ?auto_205600 ?auto_205601 ) ) ( not ( = ?auto_205600 ?auto_205598 ) ) ( not ( = ?auto_205600 ?auto_205599 ) ) ( not ( = ?auto_205600 ?auto_205596 ) ) ( ON ?auto_205597 ?auto_205600 ) ( ON ?auto_205594 ?auto_205597 ) ( ON ?auto_205596 ?auto_205594 ) ( CLEAR ?auto_205596 ) ( HOLDING ?auto_205599 ) ( CLEAR ?auto_205598 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_205601 ?auto_205598 ?auto_205599 )
      ( MAKE-1PILE ?auto_205593 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_205602 - BLOCK
    )
    :vars
    (
      ?auto_205606 - BLOCK
      ?auto_205610 - BLOCK
      ?auto_205609 - BLOCK
      ?auto_205603 - BLOCK
      ?auto_205605 - BLOCK
      ?auto_205607 - BLOCK
      ?auto_205604 - BLOCK
      ?auto_205608 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205606 ?auto_205602 ) ( ON-TABLE ?auto_205602 ) ( not ( = ?auto_205602 ?auto_205606 ) ) ( not ( = ?auto_205602 ?auto_205610 ) ) ( not ( = ?auto_205602 ?auto_205609 ) ) ( not ( = ?auto_205606 ?auto_205610 ) ) ( not ( = ?auto_205606 ?auto_205609 ) ) ( not ( = ?auto_205610 ?auto_205609 ) ) ( ON ?auto_205610 ?auto_205606 ) ( ON-TABLE ?auto_205603 ) ( ON ?auto_205605 ?auto_205603 ) ( not ( = ?auto_205603 ?auto_205605 ) ) ( not ( = ?auto_205603 ?auto_205607 ) ) ( not ( = ?auto_205603 ?auto_205604 ) ) ( not ( = ?auto_205603 ?auto_205608 ) ) ( not ( = ?auto_205603 ?auto_205609 ) ) ( not ( = ?auto_205605 ?auto_205607 ) ) ( not ( = ?auto_205605 ?auto_205604 ) ) ( not ( = ?auto_205605 ?auto_205608 ) ) ( not ( = ?auto_205605 ?auto_205609 ) ) ( not ( = ?auto_205607 ?auto_205604 ) ) ( not ( = ?auto_205607 ?auto_205608 ) ) ( not ( = ?auto_205607 ?auto_205609 ) ) ( not ( = ?auto_205604 ?auto_205608 ) ) ( not ( = ?auto_205604 ?auto_205609 ) ) ( not ( = ?auto_205608 ?auto_205609 ) ) ( not ( = ?auto_205602 ?auto_205608 ) ) ( not ( = ?auto_205602 ?auto_205603 ) ) ( not ( = ?auto_205602 ?auto_205605 ) ) ( not ( = ?auto_205602 ?auto_205607 ) ) ( not ( = ?auto_205602 ?auto_205604 ) ) ( not ( = ?auto_205606 ?auto_205608 ) ) ( not ( = ?auto_205606 ?auto_205603 ) ) ( not ( = ?auto_205606 ?auto_205605 ) ) ( not ( = ?auto_205606 ?auto_205607 ) ) ( not ( = ?auto_205606 ?auto_205604 ) ) ( not ( = ?auto_205610 ?auto_205608 ) ) ( not ( = ?auto_205610 ?auto_205603 ) ) ( not ( = ?auto_205610 ?auto_205605 ) ) ( not ( = ?auto_205610 ?auto_205607 ) ) ( not ( = ?auto_205610 ?auto_205604 ) ) ( ON ?auto_205609 ?auto_205610 ) ( ON ?auto_205608 ?auto_205609 ) ( ON ?auto_205604 ?auto_205608 ) ( CLEAR ?auto_205605 ) ( ON ?auto_205607 ?auto_205604 ) ( CLEAR ?auto_205607 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_205602 ?auto_205606 ?auto_205610 ?auto_205609 ?auto_205608 ?auto_205604 )
      ( MAKE-1PILE ?auto_205602 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_205611 - BLOCK
    )
    :vars
    (
      ?auto_205612 - BLOCK
      ?auto_205616 - BLOCK
      ?auto_205615 - BLOCK
      ?auto_205617 - BLOCK
      ?auto_205619 - BLOCK
      ?auto_205618 - BLOCK
      ?auto_205613 - BLOCK
      ?auto_205614 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205612 ?auto_205611 ) ( ON-TABLE ?auto_205611 ) ( not ( = ?auto_205611 ?auto_205612 ) ) ( not ( = ?auto_205611 ?auto_205616 ) ) ( not ( = ?auto_205611 ?auto_205615 ) ) ( not ( = ?auto_205612 ?auto_205616 ) ) ( not ( = ?auto_205612 ?auto_205615 ) ) ( not ( = ?auto_205616 ?auto_205615 ) ) ( ON ?auto_205616 ?auto_205612 ) ( ON-TABLE ?auto_205617 ) ( not ( = ?auto_205617 ?auto_205619 ) ) ( not ( = ?auto_205617 ?auto_205618 ) ) ( not ( = ?auto_205617 ?auto_205613 ) ) ( not ( = ?auto_205617 ?auto_205614 ) ) ( not ( = ?auto_205617 ?auto_205615 ) ) ( not ( = ?auto_205619 ?auto_205618 ) ) ( not ( = ?auto_205619 ?auto_205613 ) ) ( not ( = ?auto_205619 ?auto_205614 ) ) ( not ( = ?auto_205619 ?auto_205615 ) ) ( not ( = ?auto_205618 ?auto_205613 ) ) ( not ( = ?auto_205618 ?auto_205614 ) ) ( not ( = ?auto_205618 ?auto_205615 ) ) ( not ( = ?auto_205613 ?auto_205614 ) ) ( not ( = ?auto_205613 ?auto_205615 ) ) ( not ( = ?auto_205614 ?auto_205615 ) ) ( not ( = ?auto_205611 ?auto_205614 ) ) ( not ( = ?auto_205611 ?auto_205617 ) ) ( not ( = ?auto_205611 ?auto_205619 ) ) ( not ( = ?auto_205611 ?auto_205618 ) ) ( not ( = ?auto_205611 ?auto_205613 ) ) ( not ( = ?auto_205612 ?auto_205614 ) ) ( not ( = ?auto_205612 ?auto_205617 ) ) ( not ( = ?auto_205612 ?auto_205619 ) ) ( not ( = ?auto_205612 ?auto_205618 ) ) ( not ( = ?auto_205612 ?auto_205613 ) ) ( not ( = ?auto_205616 ?auto_205614 ) ) ( not ( = ?auto_205616 ?auto_205617 ) ) ( not ( = ?auto_205616 ?auto_205619 ) ) ( not ( = ?auto_205616 ?auto_205618 ) ) ( not ( = ?auto_205616 ?auto_205613 ) ) ( ON ?auto_205615 ?auto_205616 ) ( ON ?auto_205614 ?auto_205615 ) ( ON ?auto_205613 ?auto_205614 ) ( ON ?auto_205618 ?auto_205613 ) ( CLEAR ?auto_205618 ) ( HOLDING ?auto_205619 ) ( CLEAR ?auto_205617 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_205617 ?auto_205619 )
      ( MAKE-1PILE ?auto_205611 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_205620 - BLOCK
    )
    :vars
    (
      ?auto_205625 - BLOCK
      ?auto_205624 - BLOCK
      ?auto_205623 - BLOCK
      ?auto_205621 - BLOCK
      ?auto_205628 - BLOCK
      ?auto_205627 - BLOCK
      ?auto_205626 - BLOCK
      ?auto_205622 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205625 ?auto_205620 ) ( ON-TABLE ?auto_205620 ) ( not ( = ?auto_205620 ?auto_205625 ) ) ( not ( = ?auto_205620 ?auto_205624 ) ) ( not ( = ?auto_205620 ?auto_205623 ) ) ( not ( = ?auto_205625 ?auto_205624 ) ) ( not ( = ?auto_205625 ?auto_205623 ) ) ( not ( = ?auto_205624 ?auto_205623 ) ) ( ON ?auto_205624 ?auto_205625 ) ( ON-TABLE ?auto_205621 ) ( not ( = ?auto_205621 ?auto_205628 ) ) ( not ( = ?auto_205621 ?auto_205627 ) ) ( not ( = ?auto_205621 ?auto_205626 ) ) ( not ( = ?auto_205621 ?auto_205622 ) ) ( not ( = ?auto_205621 ?auto_205623 ) ) ( not ( = ?auto_205628 ?auto_205627 ) ) ( not ( = ?auto_205628 ?auto_205626 ) ) ( not ( = ?auto_205628 ?auto_205622 ) ) ( not ( = ?auto_205628 ?auto_205623 ) ) ( not ( = ?auto_205627 ?auto_205626 ) ) ( not ( = ?auto_205627 ?auto_205622 ) ) ( not ( = ?auto_205627 ?auto_205623 ) ) ( not ( = ?auto_205626 ?auto_205622 ) ) ( not ( = ?auto_205626 ?auto_205623 ) ) ( not ( = ?auto_205622 ?auto_205623 ) ) ( not ( = ?auto_205620 ?auto_205622 ) ) ( not ( = ?auto_205620 ?auto_205621 ) ) ( not ( = ?auto_205620 ?auto_205628 ) ) ( not ( = ?auto_205620 ?auto_205627 ) ) ( not ( = ?auto_205620 ?auto_205626 ) ) ( not ( = ?auto_205625 ?auto_205622 ) ) ( not ( = ?auto_205625 ?auto_205621 ) ) ( not ( = ?auto_205625 ?auto_205628 ) ) ( not ( = ?auto_205625 ?auto_205627 ) ) ( not ( = ?auto_205625 ?auto_205626 ) ) ( not ( = ?auto_205624 ?auto_205622 ) ) ( not ( = ?auto_205624 ?auto_205621 ) ) ( not ( = ?auto_205624 ?auto_205628 ) ) ( not ( = ?auto_205624 ?auto_205627 ) ) ( not ( = ?auto_205624 ?auto_205626 ) ) ( ON ?auto_205623 ?auto_205624 ) ( ON ?auto_205622 ?auto_205623 ) ( ON ?auto_205626 ?auto_205622 ) ( ON ?auto_205627 ?auto_205626 ) ( CLEAR ?auto_205621 ) ( ON ?auto_205628 ?auto_205627 ) ( CLEAR ?auto_205628 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_205620 ?auto_205625 ?auto_205624 ?auto_205623 ?auto_205622 ?auto_205626 ?auto_205627 )
      ( MAKE-1PILE ?auto_205620 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_205629 - BLOCK
    )
    :vars
    (
      ?auto_205635 - BLOCK
      ?auto_205631 - BLOCK
      ?auto_205633 - BLOCK
      ?auto_205637 - BLOCK
      ?auto_205630 - BLOCK
      ?auto_205634 - BLOCK
      ?auto_205636 - BLOCK
      ?auto_205632 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205635 ?auto_205629 ) ( ON-TABLE ?auto_205629 ) ( not ( = ?auto_205629 ?auto_205635 ) ) ( not ( = ?auto_205629 ?auto_205631 ) ) ( not ( = ?auto_205629 ?auto_205633 ) ) ( not ( = ?auto_205635 ?auto_205631 ) ) ( not ( = ?auto_205635 ?auto_205633 ) ) ( not ( = ?auto_205631 ?auto_205633 ) ) ( ON ?auto_205631 ?auto_205635 ) ( not ( = ?auto_205637 ?auto_205630 ) ) ( not ( = ?auto_205637 ?auto_205634 ) ) ( not ( = ?auto_205637 ?auto_205636 ) ) ( not ( = ?auto_205637 ?auto_205632 ) ) ( not ( = ?auto_205637 ?auto_205633 ) ) ( not ( = ?auto_205630 ?auto_205634 ) ) ( not ( = ?auto_205630 ?auto_205636 ) ) ( not ( = ?auto_205630 ?auto_205632 ) ) ( not ( = ?auto_205630 ?auto_205633 ) ) ( not ( = ?auto_205634 ?auto_205636 ) ) ( not ( = ?auto_205634 ?auto_205632 ) ) ( not ( = ?auto_205634 ?auto_205633 ) ) ( not ( = ?auto_205636 ?auto_205632 ) ) ( not ( = ?auto_205636 ?auto_205633 ) ) ( not ( = ?auto_205632 ?auto_205633 ) ) ( not ( = ?auto_205629 ?auto_205632 ) ) ( not ( = ?auto_205629 ?auto_205637 ) ) ( not ( = ?auto_205629 ?auto_205630 ) ) ( not ( = ?auto_205629 ?auto_205634 ) ) ( not ( = ?auto_205629 ?auto_205636 ) ) ( not ( = ?auto_205635 ?auto_205632 ) ) ( not ( = ?auto_205635 ?auto_205637 ) ) ( not ( = ?auto_205635 ?auto_205630 ) ) ( not ( = ?auto_205635 ?auto_205634 ) ) ( not ( = ?auto_205635 ?auto_205636 ) ) ( not ( = ?auto_205631 ?auto_205632 ) ) ( not ( = ?auto_205631 ?auto_205637 ) ) ( not ( = ?auto_205631 ?auto_205630 ) ) ( not ( = ?auto_205631 ?auto_205634 ) ) ( not ( = ?auto_205631 ?auto_205636 ) ) ( ON ?auto_205633 ?auto_205631 ) ( ON ?auto_205632 ?auto_205633 ) ( ON ?auto_205636 ?auto_205632 ) ( ON ?auto_205634 ?auto_205636 ) ( ON ?auto_205630 ?auto_205634 ) ( CLEAR ?auto_205630 ) ( HOLDING ?auto_205637 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_205637 )
      ( MAKE-1PILE ?auto_205629 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_205638 - BLOCK
    )
    :vars
    (
      ?auto_205639 - BLOCK
      ?auto_205642 - BLOCK
      ?auto_205643 - BLOCK
      ?auto_205646 - BLOCK
      ?auto_205641 - BLOCK
      ?auto_205645 - BLOCK
      ?auto_205640 - BLOCK
      ?auto_205644 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205639 ?auto_205638 ) ( ON-TABLE ?auto_205638 ) ( not ( = ?auto_205638 ?auto_205639 ) ) ( not ( = ?auto_205638 ?auto_205642 ) ) ( not ( = ?auto_205638 ?auto_205643 ) ) ( not ( = ?auto_205639 ?auto_205642 ) ) ( not ( = ?auto_205639 ?auto_205643 ) ) ( not ( = ?auto_205642 ?auto_205643 ) ) ( ON ?auto_205642 ?auto_205639 ) ( not ( = ?auto_205646 ?auto_205641 ) ) ( not ( = ?auto_205646 ?auto_205645 ) ) ( not ( = ?auto_205646 ?auto_205640 ) ) ( not ( = ?auto_205646 ?auto_205644 ) ) ( not ( = ?auto_205646 ?auto_205643 ) ) ( not ( = ?auto_205641 ?auto_205645 ) ) ( not ( = ?auto_205641 ?auto_205640 ) ) ( not ( = ?auto_205641 ?auto_205644 ) ) ( not ( = ?auto_205641 ?auto_205643 ) ) ( not ( = ?auto_205645 ?auto_205640 ) ) ( not ( = ?auto_205645 ?auto_205644 ) ) ( not ( = ?auto_205645 ?auto_205643 ) ) ( not ( = ?auto_205640 ?auto_205644 ) ) ( not ( = ?auto_205640 ?auto_205643 ) ) ( not ( = ?auto_205644 ?auto_205643 ) ) ( not ( = ?auto_205638 ?auto_205644 ) ) ( not ( = ?auto_205638 ?auto_205646 ) ) ( not ( = ?auto_205638 ?auto_205641 ) ) ( not ( = ?auto_205638 ?auto_205645 ) ) ( not ( = ?auto_205638 ?auto_205640 ) ) ( not ( = ?auto_205639 ?auto_205644 ) ) ( not ( = ?auto_205639 ?auto_205646 ) ) ( not ( = ?auto_205639 ?auto_205641 ) ) ( not ( = ?auto_205639 ?auto_205645 ) ) ( not ( = ?auto_205639 ?auto_205640 ) ) ( not ( = ?auto_205642 ?auto_205644 ) ) ( not ( = ?auto_205642 ?auto_205646 ) ) ( not ( = ?auto_205642 ?auto_205641 ) ) ( not ( = ?auto_205642 ?auto_205645 ) ) ( not ( = ?auto_205642 ?auto_205640 ) ) ( ON ?auto_205643 ?auto_205642 ) ( ON ?auto_205644 ?auto_205643 ) ( ON ?auto_205640 ?auto_205644 ) ( ON ?auto_205645 ?auto_205640 ) ( ON ?auto_205641 ?auto_205645 ) ( ON ?auto_205646 ?auto_205641 ) ( CLEAR ?auto_205646 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_205638 ?auto_205639 ?auto_205642 ?auto_205643 ?auto_205644 ?auto_205640 ?auto_205645 ?auto_205641 )
      ( MAKE-1PILE ?auto_205638 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_205655 - BLOCK
      ?auto_205656 - BLOCK
      ?auto_205657 - BLOCK
      ?auto_205658 - BLOCK
      ?auto_205659 - BLOCK
      ?auto_205660 - BLOCK
      ?auto_205661 - BLOCK
      ?auto_205662 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_205662 ) ( CLEAR ?auto_205661 ) ( ON-TABLE ?auto_205655 ) ( ON ?auto_205656 ?auto_205655 ) ( ON ?auto_205657 ?auto_205656 ) ( ON ?auto_205658 ?auto_205657 ) ( ON ?auto_205659 ?auto_205658 ) ( ON ?auto_205660 ?auto_205659 ) ( ON ?auto_205661 ?auto_205660 ) ( not ( = ?auto_205655 ?auto_205656 ) ) ( not ( = ?auto_205655 ?auto_205657 ) ) ( not ( = ?auto_205655 ?auto_205658 ) ) ( not ( = ?auto_205655 ?auto_205659 ) ) ( not ( = ?auto_205655 ?auto_205660 ) ) ( not ( = ?auto_205655 ?auto_205661 ) ) ( not ( = ?auto_205655 ?auto_205662 ) ) ( not ( = ?auto_205656 ?auto_205657 ) ) ( not ( = ?auto_205656 ?auto_205658 ) ) ( not ( = ?auto_205656 ?auto_205659 ) ) ( not ( = ?auto_205656 ?auto_205660 ) ) ( not ( = ?auto_205656 ?auto_205661 ) ) ( not ( = ?auto_205656 ?auto_205662 ) ) ( not ( = ?auto_205657 ?auto_205658 ) ) ( not ( = ?auto_205657 ?auto_205659 ) ) ( not ( = ?auto_205657 ?auto_205660 ) ) ( not ( = ?auto_205657 ?auto_205661 ) ) ( not ( = ?auto_205657 ?auto_205662 ) ) ( not ( = ?auto_205658 ?auto_205659 ) ) ( not ( = ?auto_205658 ?auto_205660 ) ) ( not ( = ?auto_205658 ?auto_205661 ) ) ( not ( = ?auto_205658 ?auto_205662 ) ) ( not ( = ?auto_205659 ?auto_205660 ) ) ( not ( = ?auto_205659 ?auto_205661 ) ) ( not ( = ?auto_205659 ?auto_205662 ) ) ( not ( = ?auto_205660 ?auto_205661 ) ) ( not ( = ?auto_205660 ?auto_205662 ) ) ( not ( = ?auto_205661 ?auto_205662 ) ) )
    :subtasks
    ( ( !STACK ?auto_205662 ?auto_205661 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_205663 - BLOCK
      ?auto_205664 - BLOCK
      ?auto_205665 - BLOCK
      ?auto_205666 - BLOCK
      ?auto_205667 - BLOCK
      ?auto_205668 - BLOCK
      ?auto_205669 - BLOCK
      ?auto_205670 - BLOCK
    )
    :vars
    (
      ?auto_205671 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_205669 ) ( ON-TABLE ?auto_205663 ) ( ON ?auto_205664 ?auto_205663 ) ( ON ?auto_205665 ?auto_205664 ) ( ON ?auto_205666 ?auto_205665 ) ( ON ?auto_205667 ?auto_205666 ) ( ON ?auto_205668 ?auto_205667 ) ( ON ?auto_205669 ?auto_205668 ) ( not ( = ?auto_205663 ?auto_205664 ) ) ( not ( = ?auto_205663 ?auto_205665 ) ) ( not ( = ?auto_205663 ?auto_205666 ) ) ( not ( = ?auto_205663 ?auto_205667 ) ) ( not ( = ?auto_205663 ?auto_205668 ) ) ( not ( = ?auto_205663 ?auto_205669 ) ) ( not ( = ?auto_205663 ?auto_205670 ) ) ( not ( = ?auto_205664 ?auto_205665 ) ) ( not ( = ?auto_205664 ?auto_205666 ) ) ( not ( = ?auto_205664 ?auto_205667 ) ) ( not ( = ?auto_205664 ?auto_205668 ) ) ( not ( = ?auto_205664 ?auto_205669 ) ) ( not ( = ?auto_205664 ?auto_205670 ) ) ( not ( = ?auto_205665 ?auto_205666 ) ) ( not ( = ?auto_205665 ?auto_205667 ) ) ( not ( = ?auto_205665 ?auto_205668 ) ) ( not ( = ?auto_205665 ?auto_205669 ) ) ( not ( = ?auto_205665 ?auto_205670 ) ) ( not ( = ?auto_205666 ?auto_205667 ) ) ( not ( = ?auto_205666 ?auto_205668 ) ) ( not ( = ?auto_205666 ?auto_205669 ) ) ( not ( = ?auto_205666 ?auto_205670 ) ) ( not ( = ?auto_205667 ?auto_205668 ) ) ( not ( = ?auto_205667 ?auto_205669 ) ) ( not ( = ?auto_205667 ?auto_205670 ) ) ( not ( = ?auto_205668 ?auto_205669 ) ) ( not ( = ?auto_205668 ?auto_205670 ) ) ( not ( = ?auto_205669 ?auto_205670 ) ) ( ON ?auto_205670 ?auto_205671 ) ( CLEAR ?auto_205670 ) ( HAND-EMPTY ) ( not ( = ?auto_205663 ?auto_205671 ) ) ( not ( = ?auto_205664 ?auto_205671 ) ) ( not ( = ?auto_205665 ?auto_205671 ) ) ( not ( = ?auto_205666 ?auto_205671 ) ) ( not ( = ?auto_205667 ?auto_205671 ) ) ( not ( = ?auto_205668 ?auto_205671 ) ) ( not ( = ?auto_205669 ?auto_205671 ) ) ( not ( = ?auto_205670 ?auto_205671 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_205670 ?auto_205671 )
      ( MAKE-8PILE ?auto_205663 ?auto_205664 ?auto_205665 ?auto_205666 ?auto_205667 ?auto_205668 ?auto_205669 ?auto_205670 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_205672 - BLOCK
      ?auto_205673 - BLOCK
      ?auto_205674 - BLOCK
      ?auto_205675 - BLOCK
      ?auto_205676 - BLOCK
      ?auto_205677 - BLOCK
      ?auto_205678 - BLOCK
      ?auto_205679 - BLOCK
    )
    :vars
    (
      ?auto_205680 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_205672 ) ( ON ?auto_205673 ?auto_205672 ) ( ON ?auto_205674 ?auto_205673 ) ( ON ?auto_205675 ?auto_205674 ) ( ON ?auto_205676 ?auto_205675 ) ( ON ?auto_205677 ?auto_205676 ) ( not ( = ?auto_205672 ?auto_205673 ) ) ( not ( = ?auto_205672 ?auto_205674 ) ) ( not ( = ?auto_205672 ?auto_205675 ) ) ( not ( = ?auto_205672 ?auto_205676 ) ) ( not ( = ?auto_205672 ?auto_205677 ) ) ( not ( = ?auto_205672 ?auto_205678 ) ) ( not ( = ?auto_205672 ?auto_205679 ) ) ( not ( = ?auto_205673 ?auto_205674 ) ) ( not ( = ?auto_205673 ?auto_205675 ) ) ( not ( = ?auto_205673 ?auto_205676 ) ) ( not ( = ?auto_205673 ?auto_205677 ) ) ( not ( = ?auto_205673 ?auto_205678 ) ) ( not ( = ?auto_205673 ?auto_205679 ) ) ( not ( = ?auto_205674 ?auto_205675 ) ) ( not ( = ?auto_205674 ?auto_205676 ) ) ( not ( = ?auto_205674 ?auto_205677 ) ) ( not ( = ?auto_205674 ?auto_205678 ) ) ( not ( = ?auto_205674 ?auto_205679 ) ) ( not ( = ?auto_205675 ?auto_205676 ) ) ( not ( = ?auto_205675 ?auto_205677 ) ) ( not ( = ?auto_205675 ?auto_205678 ) ) ( not ( = ?auto_205675 ?auto_205679 ) ) ( not ( = ?auto_205676 ?auto_205677 ) ) ( not ( = ?auto_205676 ?auto_205678 ) ) ( not ( = ?auto_205676 ?auto_205679 ) ) ( not ( = ?auto_205677 ?auto_205678 ) ) ( not ( = ?auto_205677 ?auto_205679 ) ) ( not ( = ?auto_205678 ?auto_205679 ) ) ( ON ?auto_205679 ?auto_205680 ) ( CLEAR ?auto_205679 ) ( not ( = ?auto_205672 ?auto_205680 ) ) ( not ( = ?auto_205673 ?auto_205680 ) ) ( not ( = ?auto_205674 ?auto_205680 ) ) ( not ( = ?auto_205675 ?auto_205680 ) ) ( not ( = ?auto_205676 ?auto_205680 ) ) ( not ( = ?auto_205677 ?auto_205680 ) ) ( not ( = ?auto_205678 ?auto_205680 ) ) ( not ( = ?auto_205679 ?auto_205680 ) ) ( HOLDING ?auto_205678 ) ( CLEAR ?auto_205677 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_205672 ?auto_205673 ?auto_205674 ?auto_205675 ?auto_205676 ?auto_205677 ?auto_205678 )
      ( MAKE-8PILE ?auto_205672 ?auto_205673 ?auto_205674 ?auto_205675 ?auto_205676 ?auto_205677 ?auto_205678 ?auto_205679 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_205681 - BLOCK
      ?auto_205682 - BLOCK
      ?auto_205683 - BLOCK
      ?auto_205684 - BLOCK
      ?auto_205685 - BLOCK
      ?auto_205686 - BLOCK
      ?auto_205687 - BLOCK
      ?auto_205688 - BLOCK
    )
    :vars
    (
      ?auto_205689 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_205681 ) ( ON ?auto_205682 ?auto_205681 ) ( ON ?auto_205683 ?auto_205682 ) ( ON ?auto_205684 ?auto_205683 ) ( ON ?auto_205685 ?auto_205684 ) ( ON ?auto_205686 ?auto_205685 ) ( not ( = ?auto_205681 ?auto_205682 ) ) ( not ( = ?auto_205681 ?auto_205683 ) ) ( not ( = ?auto_205681 ?auto_205684 ) ) ( not ( = ?auto_205681 ?auto_205685 ) ) ( not ( = ?auto_205681 ?auto_205686 ) ) ( not ( = ?auto_205681 ?auto_205687 ) ) ( not ( = ?auto_205681 ?auto_205688 ) ) ( not ( = ?auto_205682 ?auto_205683 ) ) ( not ( = ?auto_205682 ?auto_205684 ) ) ( not ( = ?auto_205682 ?auto_205685 ) ) ( not ( = ?auto_205682 ?auto_205686 ) ) ( not ( = ?auto_205682 ?auto_205687 ) ) ( not ( = ?auto_205682 ?auto_205688 ) ) ( not ( = ?auto_205683 ?auto_205684 ) ) ( not ( = ?auto_205683 ?auto_205685 ) ) ( not ( = ?auto_205683 ?auto_205686 ) ) ( not ( = ?auto_205683 ?auto_205687 ) ) ( not ( = ?auto_205683 ?auto_205688 ) ) ( not ( = ?auto_205684 ?auto_205685 ) ) ( not ( = ?auto_205684 ?auto_205686 ) ) ( not ( = ?auto_205684 ?auto_205687 ) ) ( not ( = ?auto_205684 ?auto_205688 ) ) ( not ( = ?auto_205685 ?auto_205686 ) ) ( not ( = ?auto_205685 ?auto_205687 ) ) ( not ( = ?auto_205685 ?auto_205688 ) ) ( not ( = ?auto_205686 ?auto_205687 ) ) ( not ( = ?auto_205686 ?auto_205688 ) ) ( not ( = ?auto_205687 ?auto_205688 ) ) ( ON ?auto_205688 ?auto_205689 ) ( not ( = ?auto_205681 ?auto_205689 ) ) ( not ( = ?auto_205682 ?auto_205689 ) ) ( not ( = ?auto_205683 ?auto_205689 ) ) ( not ( = ?auto_205684 ?auto_205689 ) ) ( not ( = ?auto_205685 ?auto_205689 ) ) ( not ( = ?auto_205686 ?auto_205689 ) ) ( not ( = ?auto_205687 ?auto_205689 ) ) ( not ( = ?auto_205688 ?auto_205689 ) ) ( CLEAR ?auto_205686 ) ( ON ?auto_205687 ?auto_205688 ) ( CLEAR ?auto_205687 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_205689 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_205689 ?auto_205688 )
      ( MAKE-8PILE ?auto_205681 ?auto_205682 ?auto_205683 ?auto_205684 ?auto_205685 ?auto_205686 ?auto_205687 ?auto_205688 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_205690 - BLOCK
      ?auto_205691 - BLOCK
      ?auto_205692 - BLOCK
      ?auto_205693 - BLOCK
      ?auto_205694 - BLOCK
      ?auto_205695 - BLOCK
      ?auto_205696 - BLOCK
      ?auto_205697 - BLOCK
    )
    :vars
    (
      ?auto_205698 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_205690 ) ( ON ?auto_205691 ?auto_205690 ) ( ON ?auto_205692 ?auto_205691 ) ( ON ?auto_205693 ?auto_205692 ) ( ON ?auto_205694 ?auto_205693 ) ( not ( = ?auto_205690 ?auto_205691 ) ) ( not ( = ?auto_205690 ?auto_205692 ) ) ( not ( = ?auto_205690 ?auto_205693 ) ) ( not ( = ?auto_205690 ?auto_205694 ) ) ( not ( = ?auto_205690 ?auto_205695 ) ) ( not ( = ?auto_205690 ?auto_205696 ) ) ( not ( = ?auto_205690 ?auto_205697 ) ) ( not ( = ?auto_205691 ?auto_205692 ) ) ( not ( = ?auto_205691 ?auto_205693 ) ) ( not ( = ?auto_205691 ?auto_205694 ) ) ( not ( = ?auto_205691 ?auto_205695 ) ) ( not ( = ?auto_205691 ?auto_205696 ) ) ( not ( = ?auto_205691 ?auto_205697 ) ) ( not ( = ?auto_205692 ?auto_205693 ) ) ( not ( = ?auto_205692 ?auto_205694 ) ) ( not ( = ?auto_205692 ?auto_205695 ) ) ( not ( = ?auto_205692 ?auto_205696 ) ) ( not ( = ?auto_205692 ?auto_205697 ) ) ( not ( = ?auto_205693 ?auto_205694 ) ) ( not ( = ?auto_205693 ?auto_205695 ) ) ( not ( = ?auto_205693 ?auto_205696 ) ) ( not ( = ?auto_205693 ?auto_205697 ) ) ( not ( = ?auto_205694 ?auto_205695 ) ) ( not ( = ?auto_205694 ?auto_205696 ) ) ( not ( = ?auto_205694 ?auto_205697 ) ) ( not ( = ?auto_205695 ?auto_205696 ) ) ( not ( = ?auto_205695 ?auto_205697 ) ) ( not ( = ?auto_205696 ?auto_205697 ) ) ( ON ?auto_205697 ?auto_205698 ) ( not ( = ?auto_205690 ?auto_205698 ) ) ( not ( = ?auto_205691 ?auto_205698 ) ) ( not ( = ?auto_205692 ?auto_205698 ) ) ( not ( = ?auto_205693 ?auto_205698 ) ) ( not ( = ?auto_205694 ?auto_205698 ) ) ( not ( = ?auto_205695 ?auto_205698 ) ) ( not ( = ?auto_205696 ?auto_205698 ) ) ( not ( = ?auto_205697 ?auto_205698 ) ) ( ON ?auto_205696 ?auto_205697 ) ( CLEAR ?auto_205696 ) ( ON-TABLE ?auto_205698 ) ( HOLDING ?auto_205695 ) ( CLEAR ?auto_205694 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_205690 ?auto_205691 ?auto_205692 ?auto_205693 ?auto_205694 ?auto_205695 )
      ( MAKE-8PILE ?auto_205690 ?auto_205691 ?auto_205692 ?auto_205693 ?auto_205694 ?auto_205695 ?auto_205696 ?auto_205697 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_205699 - BLOCK
      ?auto_205700 - BLOCK
      ?auto_205701 - BLOCK
      ?auto_205702 - BLOCK
      ?auto_205703 - BLOCK
      ?auto_205704 - BLOCK
      ?auto_205705 - BLOCK
      ?auto_205706 - BLOCK
    )
    :vars
    (
      ?auto_205707 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_205699 ) ( ON ?auto_205700 ?auto_205699 ) ( ON ?auto_205701 ?auto_205700 ) ( ON ?auto_205702 ?auto_205701 ) ( ON ?auto_205703 ?auto_205702 ) ( not ( = ?auto_205699 ?auto_205700 ) ) ( not ( = ?auto_205699 ?auto_205701 ) ) ( not ( = ?auto_205699 ?auto_205702 ) ) ( not ( = ?auto_205699 ?auto_205703 ) ) ( not ( = ?auto_205699 ?auto_205704 ) ) ( not ( = ?auto_205699 ?auto_205705 ) ) ( not ( = ?auto_205699 ?auto_205706 ) ) ( not ( = ?auto_205700 ?auto_205701 ) ) ( not ( = ?auto_205700 ?auto_205702 ) ) ( not ( = ?auto_205700 ?auto_205703 ) ) ( not ( = ?auto_205700 ?auto_205704 ) ) ( not ( = ?auto_205700 ?auto_205705 ) ) ( not ( = ?auto_205700 ?auto_205706 ) ) ( not ( = ?auto_205701 ?auto_205702 ) ) ( not ( = ?auto_205701 ?auto_205703 ) ) ( not ( = ?auto_205701 ?auto_205704 ) ) ( not ( = ?auto_205701 ?auto_205705 ) ) ( not ( = ?auto_205701 ?auto_205706 ) ) ( not ( = ?auto_205702 ?auto_205703 ) ) ( not ( = ?auto_205702 ?auto_205704 ) ) ( not ( = ?auto_205702 ?auto_205705 ) ) ( not ( = ?auto_205702 ?auto_205706 ) ) ( not ( = ?auto_205703 ?auto_205704 ) ) ( not ( = ?auto_205703 ?auto_205705 ) ) ( not ( = ?auto_205703 ?auto_205706 ) ) ( not ( = ?auto_205704 ?auto_205705 ) ) ( not ( = ?auto_205704 ?auto_205706 ) ) ( not ( = ?auto_205705 ?auto_205706 ) ) ( ON ?auto_205706 ?auto_205707 ) ( not ( = ?auto_205699 ?auto_205707 ) ) ( not ( = ?auto_205700 ?auto_205707 ) ) ( not ( = ?auto_205701 ?auto_205707 ) ) ( not ( = ?auto_205702 ?auto_205707 ) ) ( not ( = ?auto_205703 ?auto_205707 ) ) ( not ( = ?auto_205704 ?auto_205707 ) ) ( not ( = ?auto_205705 ?auto_205707 ) ) ( not ( = ?auto_205706 ?auto_205707 ) ) ( ON ?auto_205705 ?auto_205706 ) ( ON-TABLE ?auto_205707 ) ( CLEAR ?auto_205703 ) ( ON ?auto_205704 ?auto_205705 ) ( CLEAR ?auto_205704 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_205707 ?auto_205706 ?auto_205705 )
      ( MAKE-8PILE ?auto_205699 ?auto_205700 ?auto_205701 ?auto_205702 ?auto_205703 ?auto_205704 ?auto_205705 ?auto_205706 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_205708 - BLOCK
      ?auto_205709 - BLOCK
      ?auto_205710 - BLOCK
      ?auto_205711 - BLOCK
      ?auto_205712 - BLOCK
      ?auto_205713 - BLOCK
      ?auto_205714 - BLOCK
      ?auto_205715 - BLOCK
    )
    :vars
    (
      ?auto_205716 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_205708 ) ( ON ?auto_205709 ?auto_205708 ) ( ON ?auto_205710 ?auto_205709 ) ( ON ?auto_205711 ?auto_205710 ) ( not ( = ?auto_205708 ?auto_205709 ) ) ( not ( = ?auto_205708 ?auto_205710 ) ) ( not ( = ?auto_205708 ?auto_205711 ) ) ( not ( = ?auto_205708 ?auto_205712 ) ) ( not ( = ?auto_205708 ?auto_205713 ) ) ( not ( = ?auto_205708 ?auto_205714 ) ) ( not ( = ?auto_205708 ?auto_205715 ) ) ( not ( = ?auto_205709 ?auto_205710 ) ) ( not ( = ?auto_205709 ?auto_205711 ) ) ( not ( = ?auto_205709 ?auto_205712 ) ) ( not ( = ?auto_205709 ?auto_205713 ) ) ( not ( = ?auto_205709 ?auto_205714 ) ) ( not ( = ?auto_205709 ?auto_205715 ) ) ( not ( = ?auto_205710 ?auto_205711 ) ) ( not ( = ?auto_205710 ?auto_205712 ) ) ( not ( = ?auto_205710 ?auto_205713 ) ) ( not ( = ?auto_205710 ?auto_205714 ) ) ( not ( = ?auto_205710 ?auto_205715 ) ) ( not ( = ?auto_205711 ?auto_205712 ) ) ( not ( = ?auto_205711 ?auto_205713 ) ) ( not ( = ?auto_205711 ?auto_205714 ) ) ( not ( = ?auto_205711 ?auto_205715 ) ) ( not ( = ?auto_205712 ?auto_205713 ) ) ( not ( = ?auto_205712 ?auto_205714 ) ) ( not ( = ?auto_205712 ?auto_205715 ) ) ( not ( = ?auto_205713 ?auto_205714 ) ) ( not ( = ?auto_205713 ?auto_205715 ) ) ( not ( = ?auto_205714 ?auto_205715 ) ) ( ON ?auto_205715 ?auto_205716 ) ( not ( = ?auto_205708 ?auto_205716 ) ) ( not ( = ?auto_205709 ?auto_205716 ) ) ( not ( = ?auto_205710 ?auto_205716 ) ) ( not ( = ?auto_205711 ?auto_205716 ) ) ( not ( = ?auto_205712 ?auto_205716 ) ) ( not ( = ?auto_205713 ?auto_205716 ) ) ( not ( = ?auto_205714 ?auto_205716 ) ) ( not ( = ?auto_205715 ?auto_205716 ) ) ( ON ?auto_205714 ?auto_205715 ) ( ON-TABLE ?auto_205716 ) ( ON ?auto_205713 ?auto_205714 ) ( CLEAR ?auto_205713 ) ( HOLDING ?auto_205712 ) ( CLEAR ?auto_205711 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_205708 ?auto_205709 ?auto_205710 ?auto_205711 ?auto_205712 )
      ( MAKE-8PILE ?auto_205708 ?auto_205709 ?auto_205710 ?auto_205711 ?auto_205712 ?auto_205713 ?auto_205714 ?auto_205715 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_205717 - BLOCK
      ?auto_205718 - BLOCK
      ?auto_205719 - BLOCK
      ?auto_205720 - BLOCK
      ?auto_205721 - BLOCK
      ?auto_205722 - BLOCK
      ?auto_205723 - BLOCK
      ?auto_205724 - BLOCK
    )
    :vars
    (
      ?auto_205725 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_205717 ) ( ON ?auto_205718 ?auto_205717 ) ( ON ?auto_205719 ?auto_205718 ) ( ON ?auto_205720 ?auto_205719 ) ( not ( = ?auto_205717 ?auto_205718 ) ) ( not ( = ?auto_205717 ?auto_205719 ) ) ( not ( = ?auto_205717 ?auto_205720 ) ) ( not ( = ?auto_205717 ?auto_205721 ) ) ( not ( = ?auto_205717 ?auto_205722 ) ) ( not ( = ?auto_205717 ?auto_205723 ) ) ( not ( = ?auto_205717 ?auto_205724 ) ) ( not ( = ?auto_205718 ?auto_205719 ) ) ( not ( = ?auto_205718 ?auto_205720 ) ) ( not ( = ?auto_205718 ?auto_205721 ) ) ( not ( = ?auto_205718 ?auto_205722 ) ) ( not ( = ?auto_205718 ?auto_205723 ) ) ( not ( = ?auto_205718 ?auto_205724 ) ) ( not ( = ?auto_205719 ?auto_205720 ) ) ( not ( = ?auto_205719 ?auto_205721 ) ) ( not ( = ?auto_205719 ?auto_205722 ) ) ( not ( = ?auto_205719 ?auto_205723 ) ) ( not ( = ?auto_205719 ?auto_205724 ) ) ( not ( = ?auto_205720 ?auto_205721 ) ) ( not ( = ?auto_205720 ?auto_205722 ) ) ( not ( = ?auto_205720 ?auto_205723 ) ) ( not ( = ?auto_205720 ?auto_205724 ) ) ( not ( = ?auto_205721 ?auto_205722 ) ) ( not ( = ?auto_205721 ?auto_205723 ) ) ( not ( = ?auto_205721 ?auto_205724 ) ) ( not ( = ?auto_205722 ?auto_205723 ) ) ( not ( = ?auto_205722 ?auto_205724 ) ) ( not ( = ?auto_205723 ?auto_205724 ) ) ( ON ?auto_205724 ?auto_205725 ) ( not ( = ?auto_205717 ?auto_205725 ) ) ( not ( = ?auto_205718 ?auto_205725 ) ) ( not ( = ?auto_205719 ?auto_205725 ) ) ( not ( = ?auto_205720 ?auto_205725 ) ) ( not ( = ?auto_205721 ?auto_205725 ) ) ( not ( = ?auto_205722 ?auto_205725 ) ) ( not ( = ?auto_205723 ?auto_205725 ) ) ( not ( = ?auto_205724 ?auto_205725 ) ) ( ON ?auto_205723 ?auto_205724 ) ( ON-TABLE ?auto_205725 ) ( ON ?auto_205722 ?auto_205723 ) ( CLEAR ?auto_205720 ) ( ON ?auto_205721 ?auto_205722 ) ( CLEAR ?auto_205721 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_205725 ?auto_205724 ?auto_205723 ?auto_205722 )
      ( MAKE-8PILE ?auto_205717 ?auto_205718 ?auto_205719 ?auto_205720 ?auto_205721 ?auto_205722 ?auto_205723 ?auto_205724 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_205726 - BLOCK
      ?auto_205727 - BLOCK
      ?auto_205728 - BLOCK
      ?auto_205729 - BLOCK
      ?auto_205730 - BLOCK
      ?auto_205731 - BLOCK
      ?auto_205732 - BLOCK
      ?auto_205733 - BLOCK
    )
    :vars
    (
      ?auto_205734 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_205726 ) ( ON ?auto_205727 ?auto_205726 ) ( ON ?auto_205728 ?auto_205727 ) ( not ( = ?auto_205726 ?auto_205727 ) ) ( not ( = ?auto_205726 ?auto_205728 ) ) ( not ( = ?auto_205726 ?auto_205729 ) ) ( not ( = ?auto_205726 ?auto_205730 ) ) ( not ( = ?auto_205726 ?auto_205731 ) ) ( not ( = ?auto_205726 ?auto_205732 ) ) ( not ( = ?auto_205726 ?auto_205733 ) ) ( not ( = ?auto_205727 ?auto_205728 ) ) ( not ( = ?auto_205727 ?auto_205729 ) ) ( not ( = ?auto_205727 ?auto_205730 ) ) ( not ( = ?auto_205727 ?auto_205731 ) ) ( not ( = ?auto_205727 ?auto_205732 ) ) ( not ( = ?auto_205727 ?auto_205733 ) ) ( not ( = ?auto_205728 ?auto_205729 ) ) ( not ( = ?auto_205728 ?auto_205730 ) ) ( not ( = ?auto_205728 ?auto_205731 ) ) ( not ( = ?auto_205728 ?auto_205732 ) ) ( not ( = ?auto_205728 ?auto_205733 ) ) ( not ( = ?auto_205729 ?auto_205730 ) ) ( not ( = ?auto_205729 ?auto_205731 ) ) ( not ( = ?auto_205729 ?auto_205732 ) ) ( not ( = ?auto_205729 ?auto_205733 ) ) ( not ( = ?auto_205730 ?auto_205731 ) ) ( not ( = ?auto_205730 ?auto_205732 ) ) ( not ( = ?auto_205730 ?auto_205733 ) ) ( not ( = ?auto_205731 ?auto_205732 ) ) ( not ( = ?auto_205731 ?auto_205733 ) ) ( not ( = ?auto_205732 ?auto_205733 ) ) ( ON ?auto_205733 ?auto_205734 ) ( not ( = ?auto_205726 ?auto_205734 ) ) ( not ( = ?auto_205727 ?auto_205734 ) ) ( not ( = ?auto_205728 ?auto_205734 ) ) ( not ( = ?auto_205729 ?auto_205734 ) ) ( not ( = ?auto_205730 ?auto_205734 ) ) ( not ( = ?auto_205731 ?auto_205734 ) ) ( not ( = ?auto_205732 ?auto_205734 ) ) ( not ( = ?auto_205733 ?auto_205734 ) ) ( ON ?auto_205732 ?auto_205733 ) ( ON-TABLE ?auto_205734 ) ( ON ?auto_205731 ?auto_205732 ) ( ON ?auto_205730 ?auto_205731 ) ( CLEAR ?auto_205730 ) ( HOLDING ?auto_205729 ) ( CLEAR ?auto_205728 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_205726 ?auto_205727 ?auto_205728 ?auto_205729 )
      ( MAKE-8PILE ?auto_205726 ?auto_205727 ?auto_205728 ?auto_205729 ?auto_205730 ?auto_205731 ?auto_205732 ?auto_205733 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_205735 - BLOCK
      ?auto_205736 - BLOCK
      ?auto_205737 - BLOCK
      ?auto_205738 - BLOCK
      ?auto_205739 - BLOCK
      ?auto_205740 - BLOCK
      ?auto_205741 - BLOCK
      ?auto_205742 - BLOCK
    )
    :vars
    (
      ?auto_205743 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_205735 ) ( ON ?auto_205736 ?auto_205735 ) ( ON ?auto_205737 ?auto_205736 ) ( not ( = ?auto_205735 ?auto_205736 ) ) ( not ( = ?auto_205735 ?auto_205737 ) ) ( not ( = ?auto_205735 ?auto_205738 ) ) ( not ( = ?auto_205735 ?auto_205739 ) ) ( not ( = ?auto_205735 ?auto_205740 ) ) ( not ( = ?auto_205735 ?auto_205741 ) ) ( not ( = ?auto_205735 ?auto_205742 ) ) ( not ( = ?auto_205736 ?auto_205737 ) ) ( not ( = ?auto_205736 ?auto_205738 ) ) ( not ( = ?auto_205736 ?auto_205739 ) ) ( not ( = ?auto_205736 ?auto_205740 ) ) ( not ( = ?auto_205736 ?auto_205741 ) ) ( not ( = ?auto_205736 ?auto_205742 ) ) ( not ( = ?auto_205737 ?auto_205738 ) ) ( not ( = ?auto_205737 ?auto_205739 ) ) ( not ( = ?auto_205737 ?auto_205740 ) ) ( not ( = ?auto_205737 ?auto_205741 ) ) ( not ( = ?auto_205737 ?auto_205742 ) ) ( not ( = ?auto_205738 ?auto_205739 ) ) ( not ( = ?auto_205738 ?auto_205740 ) ) ( not ( = ?auto_205738 ?auto_205741 ) ) ( not ( = ?auto_205738 ?auto_205742 ) ) ( not ( = ?auto_205739 ?auto_205740 ) ) ( not ( = ?auto_205739 ?auto_205741 ) ) ( not ( = ?auto_205739 ?auto_205742 ) ) ( not ( = ?auto_205740 ?auto_205741 ) ) ( not ( = ?auto_205740 ?auto_205742 ) ) ( not ( = ?auto_205741 ?auto_205742 ) ) ( ON ?auto_205742 ?auto_205743 ) ( not ( = ?auto_205735 ?auto_205743 ) ) ( not ( = ?auto_205736 ?auto_205743 ) ) ( not ( = ?auto_205737 ?auto_205743 ) ) ( not ( = ?auto_205738 ?auto_205743 ) ) ( not ( = ?auto_205739 ?auto_205743 ) ) ( not ( = ?auto_205740 ?auto_205743 ) ) ( not ( = ?auto_205741 ?auto_205743 ) ) ( not ( = ?auto_205742 ?auto_205743 ) ) ( ON ?auto_205741 ?auto_205742 ) ( ON-TABLE ?auto_205743 ) ( ON ?auto_205740 ?auto_205741 ) ( ON ?auto_205739 ?auto_205740 ) ( CLEAR ?auto_205737 ) ( ON ?auto_205738 ?auto_205739 ) ( CLEAR ?auto_205738 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_205743 ?auto_205742 ?auto_205741 ?auto_205740 ?auto_205739 )
      ( MAKE-8PILE ?auto_205735 ?auto_205736 ?auto_205737 ?auto_205738 ?auto_205739 ?auto_205740 ?auto_205741 ?auto_205742 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_205744 - BLOCK
      ?auto_205745 - BLOCK
      ?auto_205746 - BLOCK
      ?auto_205747 - BLOCK
      ?auto_205748 - BLOCK
      ?auto_205749 - BLOCK
      ?auto_205750 - BLOCK
      ?auto_205751 - BLOCK
    )
    :vars
    (
      ?auto_205752 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_205744 ) ( ON ?auto_205745 ?auto_205744 ) ( not ( = ?auto_205744 ?auto_205745 ) ) ( not ( = ?auto_205744 ?auto_205746 ) ) ( not ( = ?auto_205744 ?auto_205747 ) ) ( not ( = ?auto_205744 ?auto_205748 ) ) ( not ( = ?auto_205744 ?auto_205749 ) ) ( not ( = ?auto_205744 ?auto_205750 ) ) ( not ( = ?auto_205744 ?auto_205751 ) ) ( not ( = ?auto_205745 ?auto_205746 ) ) ( not ( = ?auto_205745 ?auto_205747 ) ) ( not ( = ?auto_205745 ?auto_205748 ) ) ( not ( = ?auto_205745 ?auto_205749 ) ) ( not ( = ?auto_205745 ?auto_205750 ) ) ( not ( = ?auto_205745 ?auto_205751 ) ) ( not ( = ?auto_205746 ?auto_205747 ) ) ( not ( = ?auto_205746 ?auto_205748 ) ) ( not ( = ?auto_205746 ?auto_205749 ) ) ( not ( = ?auto_205746 ?auto_205750 ) ) ( not ( = ?auto_205746 ?auto_205751 ) ) ( not ( = ?auto_205747 ?auto_205748 ) ) ( not ( = ?auto_205747 ?auto_205749 ) ) ( not ( = ?auto_205747 ?auto_205750 ) ) ( not ( = ?auto_205747 ?auto_205751 ) ) ( not ( = ?auto_205748 ?auto_205749 ) ) ( not ( = ?auto_205748 ?auto_205750 ) ) ( not ( = ?auto_205748 ?auto_205751 ) ) ( not ( = ?auto_205749 ?auto_205750 ) ) ( not ( = ?auto_205749 ?auto_205751 ) ) ( not ( = ?auto_205750 ?auto_205751 ) ) ( ON ?auto_205751 ?auto_205752 ) ( not ( = ?auto_205744 ?auto_205752 ) ) ( not ( = ?auto_205745 ?auto_205752 ) ) ( not ( = ?auto_205746 ?auto_205752 ) ) ( not ( = ?auto_205747 ?auto_205752 ) ) ( not ( = ?auto_205748 ?auto_205752 ) ) ( not ( = ?auto_205749 ?auto_205752 ) ) ( not ( = ?auto_205750 ?auto_205752 ) ) ( not ( = ?auto_205751 ?auto_205752 ) ) ( ON ?auto_205750 ?auto_205751 ) ( ON-TABLE ?auto_205752 ) ( ON ?auto_205749 ?auto_205750 ) ( ON ?auto_205748 ?auto_205749 ) ( ON ?auto_205747 ?auto_205748 ) ( CLEAR ?auto_205747 ) ( HOLDING ?auto_205746 ) ( CLEAR ?auto_205745 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_205744 ?auto_205745 ?auto_205746 )
      ( MAKE-8PILE ?auto_205744 ?auto_205745 ?auto_205746 ?auto_205747 ?auto_205748 ?auto_205749 ?auto_205750 ?auto_205751 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_205753 - BLOCK
      ?auto_205754 - BLOCK
      ?auto_205755 - BLOCK
      ?auto_205756 - BLOCK
      ?auto_205757 - BLOCK
      ?auto_205758 - BLOCK
      ?auto_205759 - BLOCK
      ?auto_205760 - BLOCK
    )
    :vars
    (
      ?auto_205761 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_205753 ) ( ON ?auto_205754 ?auto_205753 ) ( not ( = ?auto_205753 ?auto_205754 ) ) ( not ( = ?auto_205753 ?auto_205755 ) ) ( not ( = ?auto_205753 ?auto_205756 ) ) ( not ( = ?auto_205753 ?auto_205757 ) ) ( not ( = ?auto_205753 ?auto_205758 ) ) ( not ( = ?auto_205753 ?auto_205759 ) ) ( not ( = ?auto_205753 ?auto_205760 ) ) ( not ( = ?auto_205754 ?auto_205755 ) ) ( not ( = ?auto_205754 ?auto_205756 ) ) ( not ( = ?auto_205754 ?auto_205757 ) ) ( not ( = ?auto_205754 ?auto_205758 ) ) ( not ( = ?auto_205754 ?auto_205759 ) ) ( not ( = ?auto_205754 ?auto_205760 ) ) ( not ( = ?auto_205755 ?auto_205756 ) ) ( not ( = ?auto_205755 ?auto_205757 ) ) ( not ( = ?auto_205755 ?auto_205758 ) ) ( not ( = ?auto_205755 ?auto_205759 ) ) ( not ( = ?auto_205755 ?auto_205760 ) ) ( not ( = ?auto_205756 ?auto_205757 ) ) ( not ( = ?auto_205756 ?auto_205758 ) ) ( not ( = ?auto_205756 ?auto_205759 ) ) ( not ( = ?auto_205756 ?auto_205760 ) ) ( not ( = ?auto_205757 ?auto_205758 ) ) ( not ( = ?auto_205757 ?auto_205759 ) ) ( not ( = ?auto_205757 ?auto_205760 ) ) ( not ( = ?auto_205758 ?auto_205759 ) ) ( not ( = ?auto_205758 ?auto_205760 ) ) ( not ( = ?auto_205759 ?auto_205760 ) ) ( ON ?auto_205760 ?auto_205761 ) ( not ( = ?auto_205753 ?auto_205761 ) ) ( not ( = ?auto_205754 ?auto_205761 ) ) ( not ( = ?auto_205755 ?auto_205761 ) ) ( not ( = ?auto_205756 ?auto_205761 ) ) ( not ( = ?auto_205757 ?auto_205761 ) ) ( not ( = ?auto_205758 ?auto_205761 ) ) ( not ( = ?auto_205759 ?auto_205761 ) ) ( not ( = ?auto_205760 ?auto_205761 ) ) ( ON ?auto_205759 ?auto_205760 ) ( ON-TABLE ?auto_205761 ) ( ON ?auto_205758 ?auto_205759 ) ( ON ?auto_205757 ?auto_205758 ) ( ON ?auto_205756 ?auto_205757 ) ( CLEAR ?auto_205754 ) ( ON ?auto_205755 ?auto_205756 ) ( CLEAR ?auto_205755 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_205761 ?auto_205760 ?auto_205759 ?auto_205758 ?auto_205757 ?auto_205756 )
      ( MAKE-8PILE ?auto_205753 ?auto_205754 ?auto_205755 ?auto_205756 ?auto_205757 ?auto_205758 ?auto_205759 ?auto_205760 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_205762 - BLOCK
      ?auto_205763 - BLOCK
      ?auto_205764 - BLOCK
      ?auto_205765 - BLOCK
      ?auto_205766 - BLOCK
      ?auto_205767 - BLOCK
      ?auto_205768 - BLOCK
      ?auto_205769 - BLOCK
    )
    :vars
    (
      ?auto_205770 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_205762 ) ( not ( = ?auto_205762 ?auto_205763 ) ) ( not ( = ?auto_205762 ?auto_205764 ) ) ( not ( = ?auto_205762 ?auto_205765 ) ) ( not ( = ?auto_205762 ?auto_205766 ) ) ( not ( = ?auto_205762 ?auto_205767 ) ) ( not ( = ?auto_205762 ?auto_205768 ) ) ( not ( = ?auto_205762 ?auto_205769 ) ) ( not ( = ?auto_205763 ?auto_205764 ) ) ( not ( = ?auto_205763 ?auto_205765 ) ) ( not ( = ?auto_205763 ?auto_205766 ) ) ( not ( = ?auto_205763 ?auto_205767 ) ) ( not ( = ?auto_205763 ?auto_205768 ) ) ( not ( = ?auto_205763 ?auto_205769 ) ) ( not ( = ?auto_205764 ?auto_205765 ) ) ( not ( = ?auto_205764 ?auto_205766 ) ) ( not ( = ?auto_205764 ?auto_205767 ) ) ( not ( = ?auto_205764 ?auto_205768 ) ) ( not ( = ?auto_205764 ?auto_205769 ) ) ( not ( = ?auto_205765 ?auto_205766 ) ) ( not ( = ?auto_205765 ?auto_205767 ) ) ( not ( = ?auto_205765 ?auto_205768 ) ) ( not ( = ?auto_205765 ?auto_205769 ) ) ( not ( = ?auto_205766 ?auto_205767 ) ) ( not ( = ?auto_205766 ?auto_205768 ) ) ( not ( = ?auto_205766 ?auto_205769 ) ) ( not ( = ?auto_205767 ?auto_205768 ) ) ( not ( = ?auto_205767 ?auto_205769 ) ) ( not ( = ?auto_205768 ?auto_205769 ) ) ( ON ?auto_205769 ?auto_205770 ) ( not ( = ?auto_205762 ?auto_205770 ) ) ( not ( = ?auto_205763 ?auto_205770 ) ) ( not ( = ?auto_205764 ?auto_205770 ) ) ( not ( = ?auto_205765 ?auto_205770 ) ) ( not ( = ?auto_205766 ?auto_205770 ) ) ( not ( = ?auto_205767 ?auto_205770 ) ) ( not ( = ?auto_205768 ?auto_205770 ) ) ( not ( = ?auto_205769 ?auto_205770 ) ) ( ON ?auto_205768 ?auto_205769 ) ( ON-TABLE ?auto_205770 ) ( ON ?auto_205767 ?auto_205768 ) ( ON ?auto_205766 ?auto_205767 ) ( ON ?auto_205765 ?auto_205766 ) ( ON ?auto_205764 ?auto_205765 ) ( CLEAR ?auto_205764 ) ( HOLDING ?auto_205763 ) ( CLEAR ?auto_205762 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_205762 ?auto_205763 )
      ( MAKE-8PILE ?auto_205762 ?auto_205763 ?auto_205764 ?auto_205765 ?auto_205766 ?auto_205767 ?auto_205768 ?auto_205769 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_205771 - BLOCK
      ?auto_205772 - BLOCK
      ?auto_205773 - BLOCK
      ?auto_205774 - BLOCK
      ?auto_205775 - BLOCK
      ?auto_205776 - BLOCK
      ?auto_205777 - BLOCK
      ?auto_205778 - BLOCK
    )
    :vars
    (
      ?auto_205779 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_205771 ) ( not ( = ?auto_205771 ?auto_205772 ) ) ( not ( = ?auto_205771 ?auto_205773 ) ) ( not ( = ?auto_205771 ?auto_205774 ) ) ( not ( = ?auto_205771 ?auto_205775 ) ) ( not ( = ?auto_205771 ?auto_205776 ) ) ( not ( = ?auto_205771 ?auto_205777 ) ) ( not ( = ?auto_205771 ?auto_205778 ) ) ( not ( = ?auto_205772 ?auto_205773 ) ) ( not ( = ?auto_205772 ?auto_205774 ) ) ( not ( = ?auto_205772 ?auto_205775 ) ) ( not ( = ?auto_205772 ?auto_205776 ) ) ( not ( = ?auto_205772 ?auto_205777 ) ) ( not ( = ?auto_205772 ?auto_205778 ) ) ( not ( = ?auto_205773 ?auto_205774 ) ) ( not ( = ?auto_205773 ?auto_205775 ) ) ( not ( = ?auto_205773 ?auto_205776 ) ) ( not ( = ?auto_205773 ?auto_205777 ) ) ( not ( = ?auto_205773 ?auto_205778 ) ) ( not ( = ?auto_205774 ?auto_205775 ) ) ( not ( = ?auto_205774 ?auto_205776 ) ) ( not ( = ?auto_205774 ?auto_205777 ) ) ( not ( = ?auto_205774 ?auto_205778 ) ) ( not ( = ?auto_205775 ?auto_205776 ) ) ( not ( = ?auto_205775 ?auto_205777 ) ) ( not ( = ?auto_205775 ?auto_205778 ) ) ( not ( = ?auto_205776 ?auto_205777 ) ) ( not ( = ?auto_205776 ?auto_205778 ) ) ( not ( = ?auto_205777 ?auto_205778 ) ) ( ON ?auto_205778 ?auto_205779 ) ( not ( = ?auto_205771 ?auto_205779 ) ) ( not ( = ?auto_205772 ?auto_205779 ) ) ( not ( = ?auto_205773 ?auto_205779 ) ) ( not ( = ?auto_205774 ?auto_205779 ) ) ( not ( = ?auto_205775 ?auto_205779 ) ) ( not ( = ?auto_205776 ?auto_205779 ) ) ( not ( = ?auto_205777 ?auto_205779 ) ) ( not ( = ?auto_205778 ?auto_205779 ) ) ( ON ?auto_205777 ?auto_205778 ) ( ON-TABLE ?auto_205779 ) ( ON ?auto_205776 ?auto_205777 ) ( ON ?auto_205775 ?auto_205776 ) ( ON ?auto_205774 ?auto_205775 ) ( ON ?auto_205773 ?auto_205774 ) ( CLEAR ?auto_205771 ) ( ON ?auto_205772 ?auto_205773 ) ( CLEAR ?auto_205772 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_205779 ?auto_205778 ?auto_205777 ?auto_205776 ?auto_205775 ?auto_205774 ?auto_205773 )
      ( MAKE-8PILE ?auto_205771 ?auto_205772 ?auto_205773 ?auto_205774 ?auto_205775 ?auto_205776 ?auto_205777 ?auto_205778 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_205780 - BLOCK
      ?auto_205781 - BLOCK
      ?auto_205782 - BLOCK
      ?auto_205783 - BLOCK
      ?auto_205784 - BLOCK
      ?auto_205785 - BLOCK
      ?auto_205786 - BLOCK
      ?auto_205787 - BLOCK
    )
    :vars
    (
      ?auto_205788 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_205780 ?auto_205781 ) ) ( not ( = ?auto_205780 ?auto_205782 ) ) ( not ( = ?auto_205780 ?auto_205783 ) ) ( not ( = ?auto_205780 ?auto_205784 ) ) ( not ( = ?auto_205780 ?auto_205785 ) ) ( not ( = ?auto_205780 ?auto_205786 ) ) ( not ( = ?auto_205780 ?auto_205787 ) ) ( not ( = ?auto_205781 ?auto_205782 ) ) ( not ( = ?auto_205781 ?auto_205783 ) ) ( not ( = ?auto_205781 ?auto_205784 ) ) ( not ( = ?auto_205781 ?auto_205785 ) ) ( not ( = ?auto_205781 ?auto_205786 ) ) ( not ( = ?auto_205781 ?auto_205787 ) ) ( not ( = ?auto_205782 ?auto_205783 ) ) ( not ( = ?auto_205782 ?auto_205784 ) ) ( not ( = ?auto_205782 ?auto_205785 ) ) ( not ( = ?auto_205782 ?auto_205786 ) ) ( not ( = ?auto_205782 ?auto_205787 ) ) ( not ( = ?auto_205783 ?auto_205784 ) ) ( not ( = ?auto_205783 ?auto_205785 ) ) ( not ( = ?auto_205783 ?auto_205786 ) ) ( not ( = ?auto_205783 ?auto_205787 ) ) ( not ( = ?auto_205784 ?auto_205785 ) ) ( not ( = ?auto_205784 ?auto_205786 ) ) ( not ( = ?auto_205784 ?auto_205787 ) ) ( not ( = ?auto_205785 ?auto_205786 ) ) ( not ( = ?auto_205785 ?auto_205787 ) ) ( not ( = ?auto_205786 ?auto_205787 ) ) ( ON ?auto_205787 ?auto_205788 ) ( not ( = ?auto_205780 ?auto_205788 ) ) ( not ( = ?auto_205781 ?auto_205788 ) ) ( not ( = ?auto_205782 ?auto_205788 ) ) ( not ( = ?auto_205783 ?auto_205788 ) ) ( not ( = ?auto_205784 ?auto_205788 ) ) ( not ( = ?auto_205785 ?auto_205788 ) ) ( not ( = ?auto_205786 ?auto_205788 ) ) ( not ( = ?auto_205787 ?auto_205788 ) ) ( ON ?auto_205786 ?auto_205787 ) ( ON-TABLE ?auto_205788 ) ( ON ?auto_205785 ?auto_205786 ) ( ON ?auto_205784 ?auto_205785 ) ( ON ?auto_205783 ?auto_205784 ) ( ON ?auto_205782 ?auto_205783 ) ( ON ?auto_205781 ?auto_205782 ) ( CLEAR ?auto_205781 ) ( HOLDING ?auto_205780 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_205780 )
      ( MAKE-8PILE ?auto_205780 ?auto_205781 ?auto_205782 ?auto_205783 ?auto_205784 ?auto_205785 ?auto_205786 ?auto_205787 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_205789 - BLOCK
      ?auto_205790 - BLOCK
      ?auto_205791 - BLOCK
      ?auto_205792 - BLOCK
      ?auto_205793 - BLOCK
      ?auto_205794 - BLOCK
      ?auto_205795 - BLOCK
      ?auto_205796 - BLOCK
    )
    :vars
    (
      ?auto_205797 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_205789 ?auto_205790 ) ) ( not ( = ?auto_205789 ?auto_205791 ) ) ( not ( = ?auto_205789 ?auto_205792 ) ) ( not ( = ?auto_205789 ?auto_205793 ) ) ( not ( = ?auto_205789 ?auto_205794 ) ) ( not ( = ?auto_205789 ?auto_205795 ) ) ( not ( = ?auto_205789 ?auto_205796 ) ) ( not ( = ?auto_205790 ?auto_205791 ) ) ( not ( = ?auto_205790 ?auto_205792 ) ) ( not ( = ?auto_205790 ?auto_205793 ) ) ( not ( = ?auto_205790 ?auto_205794 ) ) ( not ( = ?auto_205790 ?auto_205795 ) ) ( not ( = ?auto_205790 ?auto_205796 ) ) ( not ( = ?auto_205791 ?auto_205792 ) ) ( not ( = ?auto_205791 ?auto_205793 ) ) ( not ( = ?auto_205791 ?auto_205794 ) ) ( not ( = ?auto_205791 ?auto_205795 ) ) ( not ( = ?auto_205791 ?auto_205796 ) ) ( not ( = ?auto_205792 ?auto_205793 ) ) ( not ( = ?auto_205792 ?auto_205794 ) ) ( not ( = ?auto_205792 ?auto_205795 ) ) ( not ( = ?auto_205792 ?auto_205796 ) ) ( not ( = ?auto_205793 ?auto_205794 ) ) ( not ( = ?auto_205793 ?auto_205795 ) ) ( not ( = ?auto_205793 ?auto_205796 ) ) ( not ( = ?auto_205794 ?auto_205795 ) ) ( not ( = ?auto_205794 ?auto_205796 ) ) ( not ( = ?auto_205795 ?auto_205796 ) ) ( ON ?auto_205796 ?auto_205797 ) ( not ( = ?auto_205789 ?auto_205797 ) ) ( not ( = ?auto_205790 ?auto_205797 ) ) ( not ( = ?auto_205791 ?auto_205797 ) ) ( not ( = ?auto_205792 ?auto_205797 ) ) ( not ( = ?auto_205793 ?auto_205797 ) ) ( not ( = ?auto_205794 ?auto_205797 ) ) ( not ( = ?auto_205795 ?auto_205797 ) ) ( not ( = ?auto_205796 ?auto_205797 ) ) ( ON ?auto_205795 ?auto_205796 ) ( ON-TABLE ?auto_205797 ) ( ON ?auto_205794 ?auto_205795 ) ( ON ?auto_205793 ?auto_205794 ) ( ON ?auto_205792 ?auto_205793 ) ( ON ?auto_205791 ?auto_205792 ) ( ON ?auto_205790 ?auto_205791 ) ( ON ?auto_205789 ?auto_205790 ) ( CLEAR ?auto_205789 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_205797 ?auto_205796 ?auto_205795 ?auto_205794 ?auto_205793 ?auto_205792 ?auto_205791 ?auto_205790 )
      ( MAKE-8PILE ?auto_205789 ?auto_205790 ?auto_205791 ?auto_205792 ?auto_205793 ?auto_205794 ?auto_205795 ?auto_205796 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_205805 - BLOCK
      ?auto_205806 - BLOCK
      ?auto_205807 - BLOCK
      ?auto_205808 - BLOCK
      ?auto_205809 - BLOCK
      ?auto_205810 - BLOCK
      ?auto_205811 - BLOCK
    )
    :vars
    (
      ?auto_205812 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205812 ?auto_205811 ) ( CLEAR ?auto_205812 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_205805 ) ( ON ?auto_205806 ?auto_205805 ) ( ON ?auto_205807 ?auto_205806 ) ( ON ?auto_205808 ?auto_205807 ) ( ON ?auto_205809 ?auto_205808 ) ( ON ?auto_205810 ?auto_205809 ) ( ON ?auto_205811 ?auto_205810 ) ( not ( = ?auto_205805 ?auto_205806 ) ) ( not ( = ?auto_205805 ?auto_205807 ) ) ( not ( = ?auto_205805 ?auto_205808 ) ) ( not ( = ?auto_205805 ?auto_205809 ) ) ( not ( = ?auto_205805 ?auto_205810 ) ) ( not ( = ?auto_205805 ?auto_205811 ) ) ( not ( = ?auto_205805 ?auto_205812 ) ) ( not ( = ?auto_205806 ?auto_205807 ) ) ( not ( = ?auto_205806 ?auto_205808 ) ) ( not ( = ?auto_205806 ?auto_205809 ) ) ( not ( = ?auto_205806 ?auto_205810 ) ) ( not ( = ?auto_205806 ?auto_205811 ) ) ( not ( = ?auto_205806 ?auto_205812 ) ) ( not ( = ?auto_205807 ?auto_205808 ) ) ( not ( = ?auto_205807 ?auto_205809 ) ) ( not ( = ?auto_205807 ?auto_205810 ) ) ( not ( = ?auto_205807 ?auto_205811 ) ) ( not ( = ?auto_205807 ?auto_205812 ) ) ( not ( = ?auto_205808 ?auto_205809 ) ) ( not ( = ?auto_205808 ?auto_205810 ) ) ( not ( = ?auto_205808 ?auto_205811 ) ) ( not ( = ?auto_205808 ?auto_205812 ) ) ( not ( = ?auto_205809 ?auto_205810 ) ) ( not ( = ?auto_205809 ?auto_205811 ) ) ( not ( = ?auto_205809 ?auto_205812 ) ) ( not ( = ?auto_205810 ?auto_205811 ) ) ( not ( = ?auto_205810 ?auto_205812 ) ) ( not ( = ?auto_205811 ?auto_205812 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_205812 ?auto_205811 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_205830 - BLOCK
      ?auto_205831 - BLOCK
      ?auto_205832 - BLOCK
      ?auto_205833 - BLOCK
      ?auto_205834 - BLOCK
      ?auto_205835 - BLOCK
      ?auto_205836 - BLOCK
    )
    :vars
    (
      ?auto_205837 - BLOCK
      ?auto_205838 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_205830 ) ( ON ?auto_205831 ?auto_205830 ) ( ON ?auto_205832 ?auto_205831 ) ( ON ?auto_205833 ?auto_205832 ) ( ON ?auto_205834 ?auto_205833 ) ( ON ?auto_205835 ?auto_205834 ) ( not ( = ?auto_205830 ?auto_205831 ) ) ( not ( = ?auto_205830 ?auto_205832 ) ) ( not ( = ?auto_205830 ?auto_205833 ) ) ( not ( = ?auto_205830 ?auto_205834 ) ) ( not ( = ?auto_205830 ?auto_205835 ) ) ( not ( = ?auto_205830 ?auto_205836 ) ) ( not ( = ?auto_205830 ?auto_205837 ) ) ( not ( = ?auto_205831 ?auto_205832 ) ) ( not ( = ?auto_205831 ?auto_205833 ) ) ( not ( = ?auto_205831 ?auto_205834 ) ) ( not ( = ?auto_205831 ?auto_205835 ) ) ( not ( = ?auto_205831 ?auto_205836 ) ) ( not ( = ?auto_205831 ?auto_205837 ) ) ( not ( = ?auto_205832 ?auto_205833 ) ) ( not ( = ?auto_205832 ?auto_205834 ) ) ( not ( = ?auto_205832 ?auto_205835 ) ) ( not ( = ?auto_205832 ?auto_205836 ) ) ( not ( = ?auto_205832 ?auto_205837 ) ) ( not ( = ?auto_205833 ?auto_205834 ) ) ( not ( = ?auto_205833 ?auto_205835 ) ) ( not ( = ?auto_205833 ?auto_205836 ) ) ( not ( = ?auto_205833 ?auto_205837 ) ) ( not ( = ?auto_205834 ?auto_205835 ) ) ( not ( = ?auto_205834 ?auto_205836 ) ) ( not ( = ?auto_205834 ?auto_205837 ) ) ( not ( = ?auto_205835 ?auto_205836 ) ) ( not ( = ?auto_205835 ?auto_205837 ) ) ( not ( = ?auto_205836 ?auto_205837 ) ) ( ON ?auto_205837 ?auto_205838 ) ( CLEAR ?auto_205837 ) ( not ( = ?auto_205830 ?auto_205838 ) ) ( not ( = ?auto_205831 ?auto_205838 ) ) ( not ( = ?auto_205832 ?auto_205838 ) ) ( not ( = ?auto_205833 ?auto_205838 ) ) ( not ( = ?auto_205834 ?auto_205838 ) ) ( not ( = ?auto_205835 ?auto_205838 ) ) ( not ( = ?auto_205836 ?auto_205838 ) ) ( not ( = ?auto_205837 ?auto_205838 ) ) ( HOLDING ?auto_205836 ) ( CLEAR ?auto_205835 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_205830 ?auto_205831 ?auto_205832 ?auto_205833 ?auto_205834 ?auto_205835 ?auto_205836 ?auto_205837 )
      ( MAKE-7PILE ?auto_205830 ?auto_205831 ?auto_205832 ?auto_205833 ?auto_205834 ?auto_205835 ?auto_205836 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_205839 - BLOCK
      ?auto_205840 - BLOCK
      ?auto_205841 - BLOCK
      ?auto_205842 - BLOCK
      ?auto_205843 - BLOCK
      ?auto_205844 - BLOCK
      ?auto_205845 - BLOCK
    )
    :vars
    (
      ?auto_205846 - BLOCK
      ?auto_205847 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_205839 ) ( ON ?auto_205840 ?auto_205839 ) ( ON ?auto_205841 ?auto_205840 ) ( ON ?auto_205842 ?auto_205841 ) ( ON ?auto_205843 ?auto_205842 ) ( ON ?auto_205844 ?auto_205843 ) ( not ( = ?auto_205839 ?auto_205840 ) ) ( not ( = ?auto_205839 ?auto_205841 ) ) ( not ( = ?auto_205839 ?auto_205842 ) ) ( not ( = ?auto_205839 ?auto_205843 ) ) ( not ( = ?auto_205839 ?auto_205844 ) ) ( not ( = ?auto_205839 ?auto_205845 ) ) ( not ( = ?auto_205839 ?auto_205846 ) ) ( not ( = ?auto_205840 ?auto_205841 ) ) ( not ( = ?auto_205840 ?auto_205842 ) ) ( not ( = ?auto_205840 ?auto_205843 ) ) ( not ( = ?auto_205840 ?auto_205844 ) ) ( not ( = ?auto_205840 ?auto_205845 ) ) ( not ( = ?auto_205840 ?auto_205846 ) ) ( not ( = ?auto_205841 ?auto_205842 ) ) ( not ( = ?auto_205841 ?auto_205843 ) ) ( not ( = ?auto_205841 ?auto_205844 ) ) ( not ( = ?auto_205841 ?auto_205845 ) ) ( not ( = ?auto_205841 ?auto_205846 ) ) ( not ( = ?auto_205842 ?auto_205843 ) ) ( not ( = ?auto_205842 ?auto_205844 ) ) ( not ( = ?auto_205842 ?auto_205845 ) ) ( not ( = ?auto_205842 ?auto_205846 ) ) ( not ( = ?auto_205843 ?auto_205844 ) ) ( not ( = ?auto_205843 ?auto_205845 ) ) ( not ( = ?auto_205843 ?auto_205846 ) ) ( not ( = ?auto_205844 ?auto_205845 ) ) ( not ( = ?auto_205844 ?auto_205846 ) ) ( not ( = ?auto_205845 ?auto_205846 ) ) ( ON ?auto_205846 ?auto_205847 ) ( not ( = ?auto_205839 ?auto_205847 ) ) ( not ( = ?auto_205840 ?auto_205847 ) ) ( not ( = ?auto_205841 ?auto_205847 ) ) ( not ( = ?auto_205842 ?auto_205847 ) ) ( not ( = ?auto_205843 ?auto_205847 ) ) ( not ( = ?auto_205844 ?auto_205847 ) ) ( not ( = ?auto_205845 ?auto_205847 ) ) ( not ( = ?auto_205846 ?auto_205847 ) ) ( CLEAR ?auto_205844 ) ( ON ?auto_205845 ?auto_205846 ) ( CLEAR ?auto_205845 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_205847 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_205847 ?auto_205846 )
      ( MAKE-7PILE ?auto_205839 ?auto_205840 ?auto_205841 ?auto_205842 ?auto_205843 ?auto_205844 ?auto_205845 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_205848 - BLOCK
      ?auto_205849 - BLOCK
      ?auto_205850 - BLOCK
      ?auto_205851 - BLOCK
      ?auto_205852 - BLOCK
      ?auto_205853 - BLOCK
      ?auto_205854 - BLOCK
    )
    :vars
    (
      ?auto_205856 - BLOCK
      ?auto_205855 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_205848 ) ( ON ?auto_205849 ?auto_205848 ) ( ON ?auto_205850 ?auto_205849 ) ( ON ?auto_205851 ?auto_205850 ) ( ON ?auto_205852 ?auto_205851 ) ( not ( = ?auto_205848 ?auto_205849 ) ) ( not ( = ?auto_205848 ?auto_205850 ) ) ( not ( = ?auto_205848 ?auto_205851 ) ) ( not ( = ?auto_205848 ?auto_205852 ) ) ( not ( = ?auto_205848 ?auto_205853 ) ) ( not ( = ?auto_205848 ?auto_205854 ) ) ( not ( = ?auto_205848 ?auto_205856 ) ) ( not ( = ?auto_205849 ?auto_205850 ) ) ( not ( = ?auto_205849 ?auto_205851 ) ) ( not ( = ?auto_205849 ?auto_205852 ) ) ( not ( = ?auto_205849 ?auto_205853 ) ) ( not ( = ?auto_205849 ?auto_205854 ) ) ( not ( = ?auto_205849 ?auto_205856 ) ) ( not ( = ?auto_205850 ?auto_205851 ) ) ( not ( = ?auto_205850 ?auto_205852 ) ) ( not ( = ?auto_205850 ?auto_205853 ) ) ( not ( = ?auto_205850 ?auto_205854 ) ) ( not ( = ?auto_205850 ?auto_205856 ) ) ( not ( = ?auto_205851 ?auto_205852 ) ) ( not ( = ?auto_205851 ?auto_205853 ) ) ( not ( = ?auto_205851 ?auto_205854 ) ) ( not ( = ?auto_205851 ?auto_205856 ) ) ( not ( = ?auto_205852 ?auto_205853 ) ) ( not ( = ?auto_205852 ?auto_205854 ) ) ( not ( = ?auto_205852 ?auto_205856 ) ) ( not ( = ?auto_205853 ?auto_205854 ) ) ( not ( = ?auto_205853 ?auto_205856 ) ) ( not ( = ?auto_205854 ?auto_205856 ) ) ( ON ?auto_205856 ?auto_205855 ) ( not ( = ?auto_205848 ?auto_205855 ) ) ( not ( = ?auto_205849 ?auto_205855 ) ) ( not ( = ?auto_205850 ?auto_205855 ) ) ( not ( = ?auto_205851 ?auto_205855 ) ) ( not ( = ?auto_205852 ?auto_205855 ) ) ( not ( = ?auto_205853 ?auto_205855 ) ) ( not ( = ?auto_205854 ?auto_205855 ) ) ( not ( = ?auto_205856 ?auto_205855 ) ) ( ON ?auto_205854 ?auto_205856 ) ( CLEAR ?auto_205854 ) ( ON-TABLE ?auto_205855 ) ( HOLDING ?auto_205853 ) ( CLEAR ?auto_205852 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_205848 ?auto_205849 ?auto_205850 ?auto_205851 ?auto_205852 ?auto_205853 )
      ( MAKE-7PILE ?auto_205848 ?auto_205849 ?auto_205850 ?auto_205851 ?auto_205852 ?auto_205853 ?auto_205854 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_205857 - BLOCK
      ?auto_205858 - BLOCK
      ?auto_205859 - BLOCK
      ?auto_205860 - BLOCK
      ?auto_205861 - BLOCK
      ?auto_205862 - BLOCK
      ?auto_205863 - BLOCK
    )
    :vars
    (
      ?auto_205865 - BLOCK
      ?auto_205864 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_205857 ) ( ON ?auto_205858 ?auto_205857 ) ( ON ?auto_205859 ?auto_205858 ) ( ON ?auto_205860 ?auto_205859 ) ( ON ?auto_205861 ?auto_205860 ) ( not ( = ?auto_205857 ?auto_205858 ) ) ( not ( = ?auto_205857 ?auto_205859 ) ) ( not ( = ?auto_205857 ?auto_205860 ) ) ( not ( = ?auto_205857 ?auto_205861 ) ) ( not ( = ?auto_205857 ?auto_205862 ) ) ( not ( = ?auto_205857 ?auto_205863 ) ) ( not ( = ?auto_205857 ?auto_205865 ) ) ( not ( = ?auto_205858 ?auto_205859 ) ) ( not ( = ?auto_205858 ?auto_205860 ) ) ( not ( = ?auto_205858 ?auto_205861 ) ) ( not ( = ?auto_205858 ?auto_205862 ) ) ( not ( = ?auto_205858 ?auto_205863 ) ) ( not ( = ?auto_205858 ?auto_205865 ) ) ( not ( = ?auto_205859 ?auto_205860 ) ) ( not ( = ?auto_205859 ?auto_205861 ) ) ( not ( = ?auto_205859 ?auto_205862 ) ) ( not ( = ?auto_205859 ?auto_205863 ) ) ( not ( = ?auto_205859 ?auto_205865 ) ) ( not ( = ?auto_205860 ?auto_205861 ) ) ( not ( = ?auto_205860 ?auto_205862 ) ) ( not ( = ?auto_205860 ?auto_205863 ) ) ( not ( = ?auto_205860 ?auto_205865 ) ) ( not ( = ?auto_205861 ?auto_205862 ) ) ( not ( = ?auto_205861 ?auto_205863 ) ) ( not ( = ?auto_205861 ?auto_205865 ) ) ( not ( = ?auto_205862 ?auto_205863 ) ) ( not ( = ?auto_205862 ?auto_205865 ) ) ( not ( = ?auto_205863 ?auto_205865 ) ) ( ON ?auto_205865 ?auto_205864 ) ( not ( = ?auto_205857 ?auto_205864 ) ) ( not ( = ?auto_205858 ?auto_205864 ) ) ( not ( = ?auto_205859 ?auto_205864 ) ) ( not ( = ?auto_205860 ?auto_205864 ) ) ( not ( = ?auto_205861 ?auto_205864 ) ) ( not ( = ?auto_205862 ?auto_205864 ) ) ( not ( = ?auto_205863 ?auto_205864 ) ) ( not ( = ?auto_205865 ?auto_205864 ) ) ( ON ?auto_205863 ?auto_205865 ) ( ON-TABLE ?auto_205864 ) ( CLEAR ?auto_205861 ) ( ON ?auto_205862 ?auto_205863 ) ( CLEAR ?auto_205862 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_205864 ?auto_205865 ?auto_205863 )
      ( MAKE-7PILE ?auto_205857 ?auto_205858 ?auto_205859 ?auto_205860 ?auto_205861 ?auto_205862 ?auto_205863 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_205866 - BLOCK
      ?auto_205867 - BLOCK
      ?auto_205868 - BLOCK
      ?auto_205869 - BLOCK
      ?auto_205870 - BLOCK
      ?auto_205871 - BLOCK
      ?auto_205872 - BLOCK
    )
    :vars
    (
      ?auto_205873 - BLOCK
      ?auto_205874 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_205866 ) ( ON ?auto_205867 ?auto_205866 ) ( ON ?auto_205868 ?auto_205867 ) ( ON ?auto_205869 ?auto_205868 ) ( not ( = ?auto_205866 ?auto_205867 ) ) ( not ( = ?auto_205866 ?auto_205868 ) ) ( not ( = ?auto_205866 ?auto_205869 ) ) ( not ( = ?auto_205866 ?auto_205870 ) ) ( not ( = ?auto_205866 ?auto_205871 ) ) ( not ( = ?auto_205866 ?auto_205872 ) ) ( not ( = ?auto_205866 ?auto_205873 ) ) ( not ( = ?auto_205867 ?auto_205868 ) ) ( not ( = ?auto_205867 ?auto_205869 ) ) ( not ( = ?auto_205867 ?auto_205870 ) ) ( not ( = ?auto_205867 ?auto_205871 ) ) ( not ( = ?auto_205867 ?auto_205872 ) ) ( not ( = ?auto_205867 ?auto_205873 ) ) ( not ( = ?auto_205868 ?auto_205869 ) ) ( not ( = ?auto_205868 ?auto_205870 ) ) ( not ( = ?auto_205868 ?auto_205871 ) ) ( not ( = ?auto_205868 ?auto_205872 ) ) ( not ( = ?auto_205868 ?auto_205873 ) ) ( not ( = ?auto_205869 ?auto_205870 ) ) ( not ( = ?auto_205869 ?auto_205871 ) ) ( not ( = ?auto_205869 ?auto_205872 ) ) ( not ( = ?auto_205869 ?auto_205873 ) ) ( not ( = ?auto_205870 ?auto_205871 ) ) ( not ( = ?auto_205870 ?auto_205872 ) ) ( not ( = ?auto_205870 ?auto_205873 ) ) ( not ( = ?auto_205871 ?auto_205872 ) ) ( not ( = ?auto_205871 ?auto_205873 ) ) ( not ( = ?auto_205872 ?auto_205873 ) ) ( ON ?auto_205873 ?auto_205874 ) ( not ( = ?auto_205866 ?auto_205874 ) ) ( not ( = ?auto_205867 ?auto_205874 ) ) ( not ( = ?auto_205868 ?auto_205874 ) ) ( not ( = ?auto_205869 ?auto_205874 ) ) ( not ( = ?auto_205870 ?auto_205874 ) ) ( not ( = ?auto_205871 ?auto_205874 ) ) ( not ( = ?auto_205872 ?auto_205874 ) ) ( not ( = ?auto_205873 ?auto_205874 ) ) ( ON ?auto_205872 ?auto_205873 ) ( ON-TABLE ?auto_205874 ) ( ON ?auto_205871 ?auto_205872 ) ( CLEAR ?auto_205871 ) ( HOLDING ?auto_205870 ) ( CLEAR ?auto_205869 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_205866 ?auto_205867 ?auto_205868 ?auto_205869 ?auto_205870 )
      ( MAKE-7PILE ?auto_205866 ?auto_205867 ?auto_205868 ?auto_205869 ?auto_205870 ?auto_205871 ?auto_205872 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_205875 - BLOCK
      ?auto_205876 - BLOCK
      ?auto_205877 - BLOCK
      ?auto_205878 - BLOCK
      ?auto_205879 - BLOCK
      ?auto_205880 - BLOCK
      ?auto_205881 - BLOCK
    )
    :vars
    (
      ?auto_205883 - BLOCK
      ?auto_205882 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_205875 ) ( ON ?auto_205876 ?auto_205875 ) ( ON ?auto_205877 ?auto_205876 ) ( ON ?auto_205878 ?auto_205877 ) ( not ( = ?auto_205875 ?auto_205876 ) ) ( not ( = ?auto_205875 ?auto_205877 ) ) ( not ( = ?auto_205875 ?auto_205878 ) ) ( not ( = ?auto_205875 ?auto_205879 ) ) ( not ( = ?auto_205875 ?auto_205880 ) ) ( not ( = ?auto_205875 ?auto_205881 ) ) ( not ( = ?auto_205875 ?auto_205883 ) ) ( not ( = ?auto_205876 ?auto_205877 ) ) ( not ( = ?auto_205876 ?auto_205878 ) ) ( not ( = ?auto_205876 ?auto_205879 ) ) ( not ( = ?auto_205876 ?auto_205880 ) ) ( not ( = ?auto_205876 ?auto_205881 ) ) ( not ( = ?auto_205876 ?auto_205883 ) ) ( not ( = ?auto_205877 ?auto_205878 ) ) ( not ( = ?auto_205877 ?auto_205879 ) ) ( not ( = ?auto_205877 ?auto_205880 ) ) ( not ( = ?auto_205877 ?auto_205881 ) ) ( not ( = ?auto_205877 ?auto_205883 ) ) ( not ( = ?auto_205878 ?auto_205879 ) ) ( not ( = ?auto_205878 ?auto_205880 ) ) ( not ( = ?auto_205878 ?auto_205881 ) ) ( not ( = ?auto_205878 ?auto_205883 ) ) ( not ( = ?auto_205879 ?auto_205880 ) ) ( not ( = ?auto_205879 ?auto_205881 ) ) ( not ( = ?auto_205879 ?auto_205883 ) ) ( not ( = ?auto_205880 ?auto_205881 ) ) ( not ( = ?auto_205880 ?auto_205883 ) ) ( not ( = ?auto_205881 ?auto_205883 ) ) ( ON ?auto_205883 ?auto_205882 ) ( not ( = ?auto_205875 ?auto_205882 ) ) ( not ( = ?auto_205876 ?auto_205882 ) ) ( not ( = ?auto_205877 ?auto_205882 ) ) ( not ( = ?auto_205878 ?auto_205882 ) ) ( not ( = ?auto_205879 ?auto_205882 ) ) ( not ( = ?auto_205880 ?auto_205882 ) ) ( not ( = ?auto_205881 ?auto_205882 ) ) ( not ( = ?auto_205883 ?auto_205882 ) ) ( ON ?auto_205881 ?auto_205883 ) ( ON-TABLE ?auto_205882 ) ( ON ?auto_205880 ?auto_205881 ) ( CLEAR ?auto_205878 ) ( ON ?auto_205879 ?auto_205880 ) ( CLEAR ?auto_205879 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_205882 ?auto_205883 ?auto_205881 ?auto_205880 )
      ( MAKE-7PILE ?auto_205875 ?auto_205876 ?auto_205877 ?auto_205878 ?auto_205879 ?auto_205880 ?auto_205881 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_205884 - BLOCK
      ?auto_205885 - BLOCK
      ?auto_205886 - BLOCK
      ?auto_205887 - BLOCK
      ?auto_205888 - BLOCK
      ?auto_205889 - BLOCK
      ?auto_205890 - BLOCK
    )
    :vars
    (
      ?auto_205891 - BLOCK
      ?auto_205892 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_205884 ) ( ON ?auto_205885 ?auto_205884 ) ( ON ?auto_205886 ?auto_205885 ) ( not ( = ?auto_205884 ?auto_205885 ) ) ( not ( = ?auto_205884 ?auto_205886 ) ) ( not ( = ?auto_205884 ?auto_205887 ) ) ( not ( = ?auto_205884 ?auto_205888 ) ) ( not ( = ?auto_205884 ?auto_205889 ) ) ( not ( = ?auto_205884 ?auto_205890 ) ) ( not ( = ?auto_205884 ?auto_205891 ) ) ( not ( = ?auto_205885 ?auto_205886 ) ) ( not ( = ?auto_205885 ?auto_205887 ) ) ( not ( = ?auto_205885 ?auto_205888 ) ) ( not ( = ?auto_205885 ?auto_205889 ) ) ( not ( = ?auto_205885 ?auto_205890 ) ) ( not ( = ?auto_205885 ?auto_205891 ) ) ( not ( = ?auto_205886 ?auto_205887 ) ) ( not ( = ?auto_205886 ?auto_205888 ) ) ( not ( = ?auto_205886 ?auto_205889 ) ) ( not ( = ?auto_205886 ?auto_205890 ) ) ( not ( = ?auto_205886 ?auto_205891 ) ) ( not ( = ?auto_205887 ?auto_205888 ) ) ( not ( = ?auto_205887 ?auto_205889 ) ) ( not ( = ?auto_205887 ?auto_205890 ) ) ( not ( = ?auto_205887 ?auto_205891 ) ) ( not ( = ?auto_205888 ?auto_205889 ) ) ( not ( = ?auto_205888 ?auto_205890 ) ) ( not ( = ?auto_205888 ?auto_205891 ) ) ( not ( = ?auto_205889 ?auto_205890 ) ) ( not ( = ?auto_205889 ?auto_205891 ) ) ( not ( = ?auto_205890 ?auto_205891 ) ) ( ON ?auto_205891 ?auto_205892 ) ( not ( = ?auto_205884 ?auto_205892 ) ) ( not ( = ?auto_205885 ?auto_205892 ) ) ( not ( = ?auto_205886 ?auto_205892 ) ) ( not ( = ?auto_205887 ?auto_205892 ) ) ( not ( = ?auto_205888 ?auto_205892 ) ) ( not ( = ?auto_205889 ?auto_205892 ) ) ( not ( = ?auto_205890 ?auto_205892 ) ) ( not ( = ?auto_205891 ?auto_205892 ) ) ( ON ?auto_205890 ?auto_205891 ) ( ON-TABLE ?auto_205892 ) ( ON ?auto_205889 ?auto_205890 ) ( ON ?auto_205888 ?auto_205889 ) ( CLEAR ?auto_205888 ) ( HOLDING ?auto_205887 ) ( CLEAR ?auto_205886 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_205884 ?auto_205885 ?auto_205886 ?auto_205887 )
      ( MAKE-7PILE ?auto_205884 ?auto_205885 ?auto_205886 ?auto_205887 ?auto_205888 ?auto_205889 ?auto_205890 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_205893 - BLOCK
      ?auto_205894 - BLOCK
      ?auto_205895 - BLOCK
      ?auto_205896 - BLOCK
      ?auto_205897 - BLOCK
      ?auto_205898 - BLOCK
      ?auto_205899 - BLOCK
    )
    :vars
    (
      ?auto_205901 - BLOCK
      ?auto_205900 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_205893 ) ( ON ?auto_205894 ?auto_205893 ) ( ON ?auto_205895 ?auto_205894 ) ( not ( = ?auto_205893 ?auto_205894 ) ) ( not ( = ?auto_205893 ?auto_205895 ) ) ( not ( = ?auto_205893 ?auto_205896 ) ) ( not ( = ?auto_205893 ?auto_205897 ) ) ( not ( = ?auto_205893 ?auto_205898 ) ) ( not ( = ?auto_205893 ?auto_205899 ) ) ( not ( = ?auto_205893 ?auto_205901 ) ) ( not ( = ?auto_205894 ?auto_205895 ) ) ( not ( = ?auto_205894 ?auto_205896 ) ) ( not ( = ?auto_205894 ?auto_205897 ) ) ( not ( = ?auto_205894 ?auto_205898 ) ) ( not ( = ?auto_205894 ?auto_205899 ) ) ( not ( = ?auto_205894 ?auto_205901 ) ) ( not ( = ?auto_205895 ?auto_205896 ) ) ( not ( = ?auto_205895 ?auto_205897 ) ) ( not ( = ?auto_205895 ?auto_205898 ) ) ( not ( = ?auto_205895 ?auto_205899 ) ) ( not ( = ?auto_205895 ?auto_205901 ) ) ( not ( = ?auto_205896 ?auto_205897 ) ) ( not ( = ?auto_205896 ?auto_205898 ) ) ( not ( = ?auto_205896 ?auto_205899 ) ) ( not ( = ?auto_205896 ?auto_205901 ) ) ( not ( = ?auto_205897 ?auto_205898 ) ) ( not ( = ?auto_205897 ?auto_205899 ) ) ( not ( = ?auto_205897 ?auto_205901 ) ) ( not ( = ?auto_205898 ?auto_205899 ) ) ( not ( = ?auto_205898 ?auto_205901 ) ) ( not ( = ?auto_205899 ?auto_205901 ) ) ( ON ?auto_205901 ?auto_205900 ) ( not ( = ?auto_205893 ?auto_205900 ) ) ( not ( = ?auto_205894 ?auto_205900 ) ) ( not ( = ?auto_205895 ?auto_205900 ) ) ( not ( = ?auto_205896 ?auto_205900 ) ) ( not ( = ?auto_205897 ?auto_205900 ) ) ( not ( = ?auto_205898 ?auto_205900 ) ) ( not ( = ?auto_205899 ?auto_205900 ) ) ( not ( = ?auto_205901 ?auto_205900 ) ) ( ON ?auto_205899 ?auto_205901 ) ( ON-TABLE ?auto_205900 ) ( ON ?auto_205898 ?auto_205899 ) ( ON ?auto_205897 ?auto_205898 ) ( CLEAR ?auto_205895 ) ( ON ?auto_205896 ?auto_205897 ) ( CLEAR ?auto_205896 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_205900 ?auto_205901 ?auto_205899 ?auto_205898 ?auto_205897 )
      ( MAKE-7PILE ?auto_205893 ?auto_205894 ?auto_205895 ?auto_205896 ?auto_205897 ?auto_205898 ?auto_205899 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_205902 - BLOCK
      ?auto_205903 - BLOCK
      ?auto_205904 - BLOCK
      ?auto_205905 - BLOCK
      ?auto_205906 - BLOCK
      ?auto_205907 - BLOCK
      ?auto_205908 - BLOCK
    )
    :vars
    (
      ?auto_205909 - BLOCK
      ?auto_205910 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_205902 ) ( ON ?auto_205903 ?auto_205902 ) ( not ( = ?auto_205902 ?auto_205903 ) ) ( not ( = ?auto_205902 ?auto_205904 ) ) ( not ( = ?auto_205902 ?auto_205905 ) ) ( not ( = ?auto_205902 ?auto_205906 ) ) ( not ( = ?auto_205902 ?auto_205907 ) ) ( not ( = ?auto_205902 ?auto_205908 ) ) ( not ( = ?auto_205902 ?auto_205909 ) ) ( not ( = ?auto_205903 ?auto_205904 ) ) ( not ( = ?auto_205903 ?auto_205905 ) ) ( not ( = ?auto_205903 ?auto_205906 ) ) ( not ( = ?auto_205903 ?auto_205907 ) ) ( not ( = ?auto_205903 ?auto_205908 ) ) ( not ( = ?auto_205903 ?auto_205909 ) ) ( not ( = ?auto_205904 ?auto_205905 ) ) ( not ( = ?auto_205904 ?auto_205906 ) ) ( not ( = ?auto_205904 ?auto_205907 ) ) ( not ( = ?auto_205904 ?auto_205908 ) ) ( not ( = ?auto_205904 ?auto_205909 ) ) ( not ( = ?auto_205905 ?auto_205906 ) ) ( not ( = ?auto_205905 ?auto_205907 ) ) ( not ( = ?auto_205905 ?auto_205908 ) ) ( not ( = ?auto_205905 ?auto_205909 ) ) ( not ( = ?auto_205906 ?auto_205907 ) ) ( not ( = ?auto_205906 ?auto_205908 ) ) ( not ( = ?auto_205906 ?auto_205909 ) ) ( not ( = ?auto_205907 ?auto_205908 ) ) ( not ( = ?auto_205907 ?auto_205909 ) ) ( not ( = ?auto_205908 ?auto_205909 ) ) ( ON ?auto_205909 ?auto_205910 ) ( not ( = ?auto_205902 ?auto_205910 ) ) ( not ( = ?auto_205903 ?auto_205910 ) ) ( not ( = ?auto_205904 ?auto_205910 ) ) ( not ( = ?auto_205905 ?auto_205910 ) ) ( not ( = ?auto_205906 ?auto_205910 ) ) ( not ( = ?auto_205907 ?auto_205910 ) ) ( not ( = ?auto_205908 ?auto_205910 ) ) ( not ( = ?auto_205909 ?auto_205910 ) ) ( ON ?auto_205908 ?auto_205909 ) ( ON-TABLE ?auto_205910 ) ( ON ?auto_205907 ?auto_205908 ) ( ON ?auto_205906 ?auto_205907 ) ( ON ?auto_205905 ?auto_205906 ) ( CLEAR ?auto_205905 ) ( HOLDING ?auto_205904 ) ( CLEAR ?auto_205903 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_205902 ?auto_205903 ?auto_205904 )
      ( MAKE-7PILE ?auto_205902 ?auto_205903 ?auto_205904 ?auto_205905 ?auto_205906 ?auto_205907 ?auto_205908 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_205911 - BLOCK
      ?auto_205912 - BLOCK
      ?auto_205913 - BLOCK
      ?auto_205914 - BLOCK
      ?auto_205915 - BLOCK
      ?auto_205916 - BLOCK
      ?auto_205917 - BLOCK
    )
    :vars
    (
      ?auto_205918 - BLOCK
      ?auto_205919 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_205911 ) ( ON ?auto_205912 ?auto_205911 ) ( not ( = ?auto_205911 ?auto_205912 ) ) ( not ( = ?auto_205911 ?auto_205913 ) ) ( not ( = ?auto_205911 ?auto_205914 ) ) ( not ( = ?auto_205911 ?auto_205915 ) ) ( not ( = ?auto_205911 ?auto_205916 ) ) ( not ( = ?auto_205911 ?auto_205917 ) ) ( not ( = ?auto_205911 ?auto_205918 ) ) ( not ( = ?auto_205912 ?auto_205913 ) ) ( not ( = ?auto_205912 ?auto_205914 ) ) ( not ( = ?auto_205912 ?auto_205915 ) ) ( not ( = ?auto_205912 ?auto_205916 ) ) ( not ( = ?auto_205912 ?auto_205917 ) ) ( not ( = ?auto_205912 ?auto_205918 ) ) ( not ( = ?auto_205913 ?auto_205914 ) ) ( not ( = ?auto_205913 ?auto_205915 ) ) ( not ( = ?auto_205913 ?auto_205916 ) ) ( not ( = ?auto_205913 ?auto_205917 ) ) ( not ( = ?auto_205913 ?auto_205918 ) ) ( not ( = ?auto_205914 ?auto_205915 ) ) ( not ( = ?auto_205914 ?auto_205916 ) ) ( not ( = ?auto_205914 ?auto_205917 ) ) ( not ( = ?auto_205914 ?auto_205918 ) ) ( not ( = ?auto_205915 ?auto_205916 ) ) ( not ( = ?auto_205915 ?auto_205917 ) ) ( not ( = ?auto_205915 ?auto_205918 ) ) ( not ( = ?auto_205916 ?auto_205917 ) ) ( not ( = ?auto_205916 ?auto_205918 ) ) ( not ( = ?auto_205917 ?auto_205918 ) ) ( ON ?auto_205918 ?auto_205919 ) ( not ( = ?auto_205911 ?auto_205919 ) ) ( not ( = ?auto_205912 ?auto_205919 ) ) ( not ( = ?auto_205913 ?auto_205919 ) ) ( not ( = ?auto_205914 ?auto_205919 ) ) ( not ( = ?auto_205915 ?auto_205919 ) ) ( not ( = ?auto_205916 ?auto_205919 ) ) ( not ( = ?auto_205917 ?auto_205919 ) ) ( not ( = ?auto_205918 ?auto_205919 ) ) ( ON ?auto_205917 ?auto_205918 ) ( ON-TABLE ?auto_205919 ) ( ON ?auto_205916 ?auto_205917 ) ( ON ?auto_205915 ?auto_205916 ) ( ON ?auto_205914 ?auto_205915 ) ( CLEAR ?auto_205912 ) ( ON ?auto_205913 ?auto_205914 ) ( CLEAR ?auto_205913 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_205919 ?auto_205918 ?auto_205917 ?auto_205916 ?auto_205915 ?auto_205914 )
      ( MAKE-7PILE ?auto_205911 ?auto_205912 ?auto_205913 ?auto_205914 ?auto_205915 ?auto_205916 ?auto_205917 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_205920 - BLOCK
      ?auto_205921 - BLOCK
      ?auto_205922 - BLOCK
      ?auto_205923 - BLOCK
      ?auto_205924 - BLOCK
      ?auto_205925 - BLOCK
      ?auto_205926 - BLOCK
    )
    :vars
    (
      ?auto_205928 - BLOCK
      ?auto_205927 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_205920 ) ( not ( = ?auto_205920 ?auto_205921 ) ) ( not ( = ?auto_205920 ?auto_205922 ) ) ( not ( = ?auto_205920 ?auto_205923 ) ) ( not ( = ?auto_205920 ?auto_205924 ) ) ( not ( = ?auto_205920 ?auto_205925 ) ) ( not ( = ?auto_205920 ?auto_205926 ) ) ( not ( = ?auto_205920 ?auto_205928 ) ) ( not ( = ?auto_205921 ?auto_205922 ) ) ( not ( = ?auto_205921 ?auto_205923 ) ) ( not ( = ?auto_205921 ?auto_205924 ) ) ( not ( = ?auto_205921 ?auto_205925 ) ) ( not ( = ?auto_205921 ?auto_205926 ) ) ( not ( = ?auto_205921 ?auto_205928 ) ) ( not ( = ?auto_205922 ?auto_205923 ) ) ( not ( = ?auto_205922 ?auto_205924 ) ) ( not ( = ?auto_205922 ?auto_205925 ) ) ( not ( = ?auto_205922 ?auto_205926 ) ) ( not ( = ?auto_205922 ?auto_205928 ) ) ( not ( = ?auto_205923 ?auto_205924 ) ) ( not ( = ?auto_205923 ?auto_205925 ) ) ( not ( = ?auto_205923 ?auto_205926 ) ) ( not ( = ?auto_205923 ?auto_205928 ) ) ( not ( = ?auto_205924 ?auto_205925 ) ) ( not ( = ?auto_205924 ?auto_205926 ) ) ( not ( = ?auto_205924 ?auto_205928 ) ) ( not ( = ?auto_205925 ?auto_205926 ) ) ( not ( = ?auto_205925 ?auto_205928 ) ) ( not ( = ?auto_205926 ?auto_205928 ) ) ( ON ?auto_205928 ?auto_205927 ) ( not ( = ?auto_205920 ?auto_205927 ) ) ( not ( = ?auto_205921 ?auto_205927 ) ) ( not ( = ?auto_205922 ?auto_205927 ) ) ( not ( = ?auto_205923 ?auto_205927 ) ) ( not ( = ?auto_205924 ?auto_205927 ) ) ( not ( = ?auto_205925 ?auto_205927 ) ) ( not ( = ?auto_205926 ?auto_205927 ) ) ( not ( = ?auto_205928 ?auto_205927 ) ) ( ON ?auto_205926 ?auto_205928 ) ( ON-TABLE ?auto_205927 ) ( ON ?auto_205925 ?auto_205926 ) ( ON ?auto_205924 ?auto_205925 ) ( ON ?auto_205923 ?auto_205924 ) ( ON ?auto_205922 ?auto_205923 ) ( CLEAR ?auto_205922 ) ( HOLDING ?auto_205921 ) ( CLEAR ?auto_205920 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_205920 ?auto_205921 )
      ( MAKE-7PILE ?auto_205920 ?auto_205921 ?auto_205922 ?auto_205923 ?auto_205924 ?auto_205925 ?auto_205926 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_205929 - BLOCK
      ?auto_205930 - BLOCK
      ?auto_205931 - BLOCK
      ?auto_205932 - BLOCK
      ?auto_205933 - BLOCK
      ?auto_205934 - BLOCK
      ?auto_205935 - BLOCK
    )
    :vars
    (
      ?auto_205937 - BLOCK
      ?auto_205936 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_205929 ) ( not ( = ?auto_205929 ?auto_205930 ) ) ( not ( = ?auto_205929 ?auto_205931 ) ) ( not ( = ?auto_205929 ?auto_205932 ) ) ( not ( = ?auto_205929 ?auto_205933 ) ) ( not ( = ?auto_205929 ?auto_205934 ) ) ( not ( = ?auto_205929 ?auto_205935 ) ) ( not ( = ?auto_205929 ?auto_205937 ) ) ( not ( = ?auto_205930 ?auto_205931 ) ) ( not ( = ?auto_205930 ?auto_205932 ) ) ( not ( = ?auto_205930 ?auto_205933 ) ) ( not ( = ?auto_205930 ?auto_205934 ) ) ( not ( = ?auto_205930 ?auto_205935 ) ) ( not ( = ?auto_205930 ?auto_205937 ) ) ( not ( = ?auto_205931 ?auto_205932 ) ) ( not ( = ?auto_205931 ?auto_205933 ) ) ( not ( = ?auto_205931 ?auto_205934 ) ) ( not ( = ?auto_205931 ?auto_205935 ) ) ( not ( = ?auto_205931 ?auto_205937 ) ) ( not ( = ?auto_205932 ?auto_205933 ) ) ( not ( = ?auto_205932 ?auto_205934 ) ) ( not ( = ?auto_205932 ?auto_205935 ) ) ( not ( = ?auto_205932 ?auto_205937 ) ) ( not ( = ?auto_205933 ?auto_205934 ) ) ( not ( = ?auto_205933 ?auto_205935 ) ) ( not ( = ?auto_205933 ?auto_205937 ) ) ( not ( = ?auto_205934 ?auto_205935 ) ) ( not ( = ?auto_205934 ?auto_205937 ) ) ( not ( = ?auto_205935 ?auto_205937 ) ) ( ON ?auto_205937 ?auto_205936 ) ( not ( = ?auto_205929 ?auto_205936 ) ) ( not ( = ?auto_205930 ?auto_205936 ) ) ( not ( = ?auto_205931 ?auto_205936 ) ) ( not ( = ?auto_205932 ?auto_205936 ) ) ( not ( = ?auto_205933 ?auto_205936 ) ) ( not ( = ?auto_205934 ?auto_205936 ) ) ( not ( = ?auto_205935 ?auto_205936 ) ) ( not ( = ?auto_205937 ?auto_205936 ) ) ( ON ?auto_205935 ?auto_205937 ) ( ON-TABLE ?auto_205936 ) ( ON ?auto_205934 ?auto_205935 ) ( ON ?auto_205933 ?auto_205934 ) ( ON ?auto_205932 ?auto_205933 ) ( ON ?auto_205931 ?auto_205932 ) ( CLEAR ?auto_205929 ) ( ON ?auto_205930 ?auto_205931 ) ( CLEAR ?auto_205930 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_205936 ?auto_205937 ?auto_205935 ?auto_205934 ?auto_205933 ?auto_205932 ?auto_205931 )
      ( MAKE-7PILE ?auto_205929 ?auto_205930 ?auto_205931 ?auto_205932 ?auto_205933 ?auto_205934 ?auto_205935 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_205938 - BLOCK
      ?auto_205939 - BLOCK
      ?auto_205940 - BLOCK
      ?auto_205941 - BLOCK
      ?auto_205942 - BLOCK
      ?auto_205943 - BLOCK
      ?auto_205944 - BLOCK
    )
    :vars
    (
      ?auto_205946 - BLOCK
      ?auto_205945 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_205938 ?auto_205939 ) ) ( not ( = ?auto_205938 ?auto_205940 ) ) ( not ( = ?auto_205938 ?auto_205941 ) ) ( not ( = ?auto_205938 ?auto_205942 ) ) ( not ( = ?auto_205938 ?auto_205943 ) ) ( not ( = ?auto_205938 ?auto_205944 ) ) ( not ( = ?auto_205938 ?auto_205946 ) ) ( not ( = ?auto_205939 ?auto_205940 ) ) ( not ( = ?auto_205939 ?auto_205941 ) ) ( not ( = ?auto_205939 ?auto_205942 ) ) ( not ( = ?auto_205939 ?auto_205943 ) ) ( not ( = ?auto_205939 ?auto_205944 ) ) ( not ( = ?auto_205939 ?auto_205946 ) ) ( not ( = ?auto_205940 ?auto_205941 ) ) ( not ( = ?auto_205940 ?auto_205942 ) ) ( not ( = ?auto_205940 ?auto_205943 ) ) ( not ( = ?auto_205940 ?auto_205944 ) ) ( not ( = ?auto_205940 ?auto_205946 ) ) ( not ( = ?auto_205941 ?auto_205942 ) ) ( not ( = ?auto_205941 ?auto_205943 ) ) ( not ( = ?auto_205941 ?auto_205944 ) ) ( not ( = ?auto_205941 ?auto_205946 ) ) ( not ( = ?auto_205942 ?auto_205943 ) ) ( not ( = ?auto_205942 ?auto_205944 ) ) ( not ( = ?auto_205942 ?auto_205946 ) ) ( not ( = ?auto_205943 ?auto_205944 ) ) ( not ( = ?auto_205943 ?auto_205946 ) ) ( not ( = ?auto_205944 ?auto_205946 ) ) ( ON ?auto_205946 ?auto_205945 ) ( not ( = ?auto_205938 ?auto_205945 ) ) ( not ( = ?auto_205939 ?auto_205945 ) ) ( not ( = ?auto_205940 ?auto_205945 ) ) ( not ( = ?auto_205941 ?auto_205945 ) ) ( not ( = ?auto_205942 ?auto_205945 ) ) ( not ( = ?auto_205943 ?auto_205945 ) ) ( not ( = ?auto_205944 ?auto_205945 ) ) ( not ( = ?auto_205946 ?auto_205945 ) ) ( ON ?auto_205944 ?auto_205946 ) ( ON-TABLE ?auto_205945 ) ( ON ?auto_205943 ?auto_205944 ) ( ON ?auto_205942 ?auto_205943 ) ( ON ?auto_205941 ?auto_205942 ) ( ON ?auto_205940 ?auto_205941 ) ( ON ?auto_205939 ?auto_205940 ) ( CLEAR ?auto_205939 ) ( HOLDING ?auto_205938 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_205938 )
      ( MAKE-7PILE ?auto_205938 ?auto_205939 ?auto_205940 ?auto_205941 ?auto_205942 ?auto_205943 ?auto_205944 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_205947 - BLOCK
      ?auto_205948 - BLOCK
      ?auto_205949 - BLOCK
      ?auto_205950 - BLOCK
      ?auto_205951 - BLOCK
      ?auto_205952 - BLOCK
      ?auto_205953 - BLOCK
    )
    :vars
    (
      ?auto_205955 - BLOCK
      ?auto_205954 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_205947 ?auto_205948 ) ) ( not ( = ?auto_205947 ?auto_205949 ) ) ( not ( = ?auto_205947 ?auto_205950 ) ) ( not ( = ?auto_205947 ?auto_205951 ) ) ( not ( = ?auto_205947 ?auto_205952 ) ) ( not ( = ?auto_205947 ?auto_205953 ) ) ( not ( = ?auto_205947 ?auto_205955 ) ) ( not ( = ?auto_205948 ?auto_205949 ) ) ( not ( = ?auto_205948 ?auto_205950 ) ) ( not ( = ?auto_205948 ?auto_205951 ) ) ( not ( = ?auto_205948 ?auto_205952 ) ) ( not ( = ?auto_205948 ?auto_205953 ) ) ( not ( = ?auto_205948 ?auto_205955 ) ) ( not ( = ?auto_205949 ?auto_205950 ) ) ( not ( = ?auto_205949 ?auto_205951 ) ) ( not ( = ?auto_205949 ?auto_205952 ) ) ( not ( = ?auto_205949 ?auto_205953 ) ) ( not ( = ?auto_205949 ?auto_205955 ) ) ( not ( = ?auto_205950 ?auto_205951 ) ) ( not ( = ?auto_205950 ?auto_205952 ) ) ( not ( = ?auto_205950 ?auto_205953 ) ) ( not ( = ?auto_205950 ?auto_205955 ) ) ( not ( = ?auto_205951 ?auto_205952 ) ) ( not ( = ?auto_205951 ?auto_205953 ) ) ( not ( = ?auto_205951 ?auto_205955 ) ) ( not ( = ?auto_205952 ?auto_205953 ) ) ( not ( = ?auto_205952 ?auto_205955 ) ) ( not ( = ?auto_205953 ?auto_205955 ) ) ( ON ?auto_205955 ?auto_205954 ) ( not ( = ?auto_205947 ?auto_205954 ) ) ( not ( = ?auto_205948 ?auto_205954 ) ) ( not ( = ?auto_205949 ?auto_205954 ) ) ( not ( = ?auto_205950 ?auto_205954 ) ) ( not ( = ?auto_205951 ?auto_205954 ) ) ( not ( = ?auto_205952 ?auto_205954 ) ) ( not ( = ?auto_205953 ?auto_205954 ) ) ( not ( = ?auto_205955 ?auto_205954 ) ) ( ON ?auto_205953 ?auto_205955 ) ( ON-TABLE ?auto_205954 ) ( ON ?auto_205952 ?auto_205953 ) ( ON ?auto_205951 ?auto_205952 ) ( ON ?auto_205950 ?auto_205951 ) ( ON ?auto_205949 ?auto_205950 ) ( ON ?auto_205948 ?auto_205949 ) ( ON ?auto_205947 ?auto_205948 ) ( CLEAR ?auto_205947 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_205954 ?auto_205955 ?auto_205953 ?auto_205952 ?auto_205951 ?auto_205950 ?auto_205949 ?auto_205948 )
      ( MAKE-7PILE ?auto_205947 ?auto_205948 ?auto_205949 ?auto_205950 ?auto_205951 ?auto_205952 ?auto_205953 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_205957 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_205957 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_205957 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_205958 - BLOCK
    )
    :vars
    (
      ?auto_205959 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205958 ?auto_205959 ) ( CLEAR ?auto_205958 ) ( HAND-EMPTY ) ( not ( = ?auto_205958 ?auto_205959 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_205958 ?auto_205959 )
      ( MAKE-1PILE ?auto_205958 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_205960 - BLOCK
    )
    :vars
    (
      ?auto_205961 - BLOCK
      ?auto_205967 - BLOCK
      ?auto_205966 - BLOCK
      ?auto_205963 - BLOCK
      ?auto_205962 - BLOCK
      ?auto_205964 - BLOCK
      ?auto_205965 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_205960 ?auto_205961 ) ) ( HOLDING ?auto_205960 ) ( CLEAR ?auto_205961 ) ( ON-TABLE ?auto_205967 ) ( ON ?auto_205966 ?auto_205967 ) ( ON ?auto_205963 ?auto_205966 ) ( ON ?auto_205962 ?auto_205963 ) ( ON ?auto_205964 ?auto_205962 ) ( ON ?auto_205965 ?auto_205964 ) ( ON ?auto_205961 ?auto_205965 ) ( not ( = ?auto_205967 ?auto_205966 ) ) ( not ( = ?auto_205967 ?auto_205963 ) ) ( not ( = ?auto_205967 ?auto_205962 ) ) ( not ( = ?auto_205967 ?auto_205964 ) ) ( not ( = ?auto_205967 ?auto_205965 ) ) ( not ( = ?auto_205967 ?auto_205961 ) ) ( not ( = ?auto_205967 ?auto_205960 ) ) ( not ( = ?auto_205966 ?auto_205963 ) ) ( not ( = ?auto_205966 ?auto_205962 ) ) ( not ( = ?auto_205966 ?auto_205964 ) ) ( not ( = ?auto_205966 ?auto_205965 ) ) ( not ( = ?auto_205966 ?auto_205961 ) ) ( not ( = ?auto_205966 ?auto_205960 ) ) ( not ( = ?auto_205963 ?auto_205962 ) ) ( not ( = ?auto_205963 ?auto_205964 ) ) ( not ( = ?auto_205963 ?auto_205965 ) ) ( not ( = ?auto_205963 ?auto_205961 ) ) ( not ( = ?auto_205963 ?auto_205960 ) ) ( not ( = ?auto_205962 ?auto_205964 ) ) ( not ( = ?auto_205962 ?auto_205965 ) ) ( not ( = ?auto_205962 ?auto_205961 ) ) ( not ( = ?auto_205962 ?auto_205960 ) ) ( not ( = ?auto_205964 ?auto_205965 ) ) ( not ( = ?auto_205964 ?auto_205961 ) ) ( not ( = ?auto_205964 ?auto_205960 ) ) ( not ( = ?auto_205965 ?auto_205961 ) ) ( not ( = ?auto_205965 ?auto_205960 ) ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_205967 ?auto_205966 ?auto_205963 ?auto_205962 ?auto_205964 ?auto_205965 ?auto_205961 ?auto_205960 )
      ( MAKE-1PILE ?auto_205960 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_205968 - BLOCK
    )
    :vars
    (
      ?auto_205973 - BLOCK
      ?auto_205969 - BLOCK
      ?auto_205970 - BLOCK
      ?auto_205971 - BLOCK
      ?auto_205972 - BLOCK
      ?auto_205974 - BLOCK
      ?auto_205975 - BLOCK
      ?auto_205976 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_205968 ?auto_205973 ) ) ( CLEAR ?auto_205973 ) ( ON-TABLE ?auto_205969 ) ( ON ?auto_205970 ?auto_205969 ) ( ON ?auto_205971 ?auto_205970 ) ( ON ?auto_205972 ?auto_205971 ) ( ON ?auto_205974 ?auto_205972 ) ( ON ?auto_205975 ?auto_205974 ) ( ON ?auto_205973 ?auto_205975 ) ( not ( = ?auto_205969 ?auto_205970 ) ) ( not ( = ?auto_205969 ?auto_205971 ) ) ( not ( = ?auto_205969 ?auto_205972 ) ) ( not ( = ?auto_205969 ?auto_205974 ) ) ( not ( = ?auto_205969 ?auto_205975 ) ) ( not ( = ?auto_205969 ?auto_205973 ) ) ( not ( = ?auto_205969 ?auto_205968 ) ) ( not ( = ?auto_205970 ?auto_205971 ) ) ( not ( = ?auto_205970 ?auto_205972 ) ) ( not ( = ?auto_205970 ?auto_205974 ) ) ( not ( = ?auto_205970 ?auto_205975 ) ) ( not ( = ?auto_205970 ?auto_205973 ) ) ( not ( = ?auto_205970 ?auto_205968 ) ) ( not ( = ?auto_205971 ?auto_205972 ) ) ( not ( = ?auto_205971 ?auto_205974 ) ) ( not ( = ?auto_205971 ?auto_205975 ) ) ( not ( = ?auto_205971 ?auto_205973 ) ) ( not ( = ?auto_205971 ?auto_205968 ) ) ( not ( = ?auto_205972 ?auto_205974 ) ) ( not ( = ?auto_205972 ?auto_205975 ) ) ( not ( = ?auto_205972 ?auto_205973 ) ) ( not ( = ?auto_205972 ?auto_205968 ) ) ( not ( = ?auto_205974 ?auto_205975 ) ) ( not ( = ?auto_205974 ?auto_205973 ) ) ( not ( = ?auto_205974 ?auto_205968 ) ) ( not ( = ?auto_205975 ?auto_205973 ) ) ( not ( = ?auto_205975 ?auto_205968 ) ) ( ON ?auto_205968 ?auto_205976 ) ( CLEAR ?auto_205968 ) ( HAND-EMPTY ) ( not ( = ?auto_205968 ?auto_205976 ) ) ( not ( = ?auto_205973 ?auto_205976 ) ) ( not ( = ?auto_205969 ?auto_205976 ) ) ( not ( = ?auto_205970 ?auto_205976 ) ) ( not ( = ?auto_205971 ?auto_205976 ) ) ( not ( = ?auto_205972 ?auto_205976 ) ) ( not ( = ?auto_205974 ?auto_205976 ) ) ( not ( = ?auto_205975 ?auto_205976 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_205968 ?auto_205976 )
      ( MAKE-1PILE ?auto_205968 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_205977 - BLOCK
    )
    :vars
    (
      ?auto_205981 - BLOCK
      ?auto_205980 - BLOCK
      ?auto_205983 - BLOCK
      ?auto_205984 - BLOCK
      ?auto_205985 - BLOCK
      ?auto_205978 - BLOCK
      ?auto_205982 - BLOCK
      ?auto_205979 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_205977 ?auto_205981 ) ) ( ON-TABLE ?auto_205980 ) ( ON ?auto_205983 ?auto_205980 ) ( ON ?auto_205984 ?auto_205983 ) ( ON ?auto_205985 ?auto_205984 ) ( ON ?auto_205978 ?auto_205985 ) ( ON ?auto_205982 ?auto_205978 ) ( not ( = ?auto_205980 ?auto_205983 ) ) ( not ( = ?auto_205980 ?auto_205984 ) ) ( not ( = ?auto_205980 ?auto_205985 ) ) ( not ( = ?auto_205980 ?auto_205978 ) ) ( not ( = ?auto_205980 ?auto_205982 ) ) ( not ( = ?auto_205980 ?auto_205981 ) ) ( not ( = ?auto_205980 ?auto_205977 ) ) ( not ( = ?auto_205983 ?auto_205984 ) ) ( not ( = ?auto_205983 ?auto_205985 ) ) ( not ( = ?auto_205983 ?auto_205978 ) ) ( not ( = ?auto_205983 ?auto_205982 ) ) ( not ( = ?auto_205983 ?auto_205981 ) ) ( not ( = ?auto_205983 ?auto_205977 ) ) ( not ( = ?auto_205984 ?auto_205985 ) ) ( not ( = ?auto_205984 ?auto_205978 ) ) ( not ( = ?auto_205984 ?auto_205982 ) ) ( not ( = ?auto_205984 ?auto_205981 ) ) ( not ( = ?auto_205984 ?auto_205977 ) ) ( not ( = ?auto_205985 ?auto_205978 ) ) ( not ( = ?auto_205985 ?auto_205982 ) ) ( not ( = ?auto_205985 ?auto_205981 ) ) ( not ( = ?auto_205985 ?auto_205977 ) ) ( not ( = ?auto_205978 ?auto_205982 ) ) ( not ( = ?auto_205978 ?auto_205981 ) ) ( not ( = ?auto_205978 ?auto_205977 ) ) ( not ( = ?auto_205982 ?auto_205981 ) ) ( not ( = ?auto_205982 ?auto_205977 ) ) ( ON ?auto_205977 ?auto_205979 ) ( CLEAR ?auto_205977 ) ( not ( = ?auto_205977 ?auto_205979 ) ) ( not ( = ?auto_205981 ?auto_205979 ) ) ( not ( = ?auto_205980 ?auto_205979 ) ) ( not ( = ?auto_205983 ?auto_205979 ) ) ( not ( = ?auto_205984 ?auto_205979 ) ) ( not ( = ?auto_205985 ?auto_205979 ) ) ( not ( = ?auto_205978 ?auto_205979 ) ) ( not ( = ?auto_205982 ?auto_205979 ) ) ( HOLDING ?auto_205981 ) ( CLEAR ?auto_205982 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_205980 ?auto_205983 ?auto_205984 ?auto_205985 ?auto_205978 ?auto_205982 ?auto_205981 )
      ( MAKE-1PILE ?auto_205977 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_205986 - BLOCK
    )
    :vars
    (
      ?auto_205989 - BLOCK
      ?auto_205991 - BLOCK
      ?auto_205987 - BLOCK
      ?auto_205993 - BLOCK
      ?auto_205988 - BLOCK
      ?auto_205992 - BLOCK
      ?auto_205990 - BLOCK
      ?auto_205994 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_205986 ?auto_205989 ) ) ( ON-TABLE ?auto_205991 ) ( ON ?auto_205987 ?auto_205991 ) ( ON ?auto_205993 ?auto_205987 ) ( ON ?auto_205988 ?auto_205993 ) ( ON ?auto_205992 ?auto_205988 ) ( ON ?auto_205990 ?auto_205992 ) ( not ( = ?auto_205991 ?auto_205987 ) ) ( not ( = ?auto_205991 ?auto_205993 ) ) ( not ( = ?auto_205991 ?auto_205988 ) ) ( not ( = ?auto_205991 ?auto_205992 ) ) ( not ( = ?auto_205991 ?auto_205990 ) ) ( not ( = ?auto_205991 ?auto_205989 ) ) ( not ( = ?auto_205991 ?auto_205986 ) ) ( not ( = ?auto_205987 ?auto_205993 ) ) ( not ( = ?auto_205987 ?auto_205988 ) ) ( not ( = ?auto_205987 ?auto_205992 ) ) ( not ( = ?auto_205987 ?auto_205990 ) ) ( not ( = ?auto_205987 ?auto_205989 ) ) ( not ( = ?auto_205987 ?auto_205986 ) ) ( not ( = ?auto_205993 ?auto_205988 ) ) ( not ( = ?auto_205993 ?auto_205992 ) ) ( not ( = ?auto_205993 ?auto_205990 ) ) ( not ( = ?auto_205993 ?auto_205989 ) ) ( not ( = ?auto_205993 ?auto_205986 ) ) ( not ( = ?auto_205988 ?auto_205992 ) ) ( not ( = ?auto_205988 ?auto_205990 ) ) ( not ( = ?auto_205988 ?auto_205989 ) ) ( not ( = ?auto_205988 ?auto_205986 ) ) ( not ( = ?auto_205992 ?auto_205990 ) ) ( not ( = ?auto_205992 ?auto_205989 ) ) ( not ( = ?auto_205992 ?auto_205986 ) ) ( not ( = ?auto_205990 ?auto_205989 ) ) ( not ( = ?auto_205990 ?auto_205986 ) ) ( ON ?auto_205986 ?auto_205994 ) ( not ( = ?auto_205986 ?auto_205994 ) ) ( not ( = ?auto_205989 ?auto_205994 ) ) ( not ( = ?auto_205991 ?auto_205994 ) ) ( not ( = ?auto_205987 ?auto_205994 ) ) ( not ( = ?auto_205993 ?auto_205994 ) ) ( not ( = ?auto_205988 ?auto_205994 ) ) ( not ( = ?auto_205992 ?auto_205994 ) ) ( not ( = ?auto_205990 ?auto_205994 ) ) ( CLEAR ?auto_205990 ) ( ON ?auto_205989 ?auto_205986 ) ( CLEAR ?auto_205989 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_205994 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_205994 ?auto_205986 )
      ( MAKE-1PILE ?auto_205986 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_205995 - BLOCK
    )
    :vars
    (
      ?auto_206002 - BLOCK
      ?auto_206001 - BLOCK
      ?auto_206000 - BLOCK
      ?auto_205997 - BLOCK
      ?auto_205998 - BLOCK
      ?auto_205999 - BLOCK
      ?auto_206003 - BLOCK
      ?auto_205996 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_205995 ?auto_206002 ) ) ( ON-TABLE ?auto_206001 ) ( ON ?auto_206000 ?auto_206001 ) ( ON ?auto_205997 ?auto_206000 ) ( ON ?auto_205998 ?auto_205997 ) ( ON ?auto_205999 ?auto_205998 ) ( not ( = ?auto_206001 ?auto_206000 ) ) ( not ( = ?auto_206001 ?auto_205997 ) ) ( not ( = ?auto_206001 ?auto_205998 ) ) ( not ( = ?auto_206001 ?auto_205999 ) ) ( not ( = ?auto_206001 ?auto_206003 ) ) ( not ( = ?auto_206001 ?auto_206002 ) ) ( not ( = ?auto_206001 ?auto_205995 ) ) ( not ( = ?auto_206000 ?auto_205997 ) ) ( not ( = ?auto_206000 ?auto_205998 ) ) ( not ( = ?auto_206000 ?auto_205999 ) ) ( not ( = ?auto_206000 ?auto_206003 ) ) ( not ( = ?auto_206000 ?auto_206002 ) ) ( not ( = ?auto_206000 ?auto_205995 ) ) ( not ( = ?auto_205997 ?auto_205998 ) ) ( not ( = ?auto_205997 ?auto_205999 ) ) ( not ( = ?auto_205997 ?auto_206003 ) ) ( not ( = ?auto_205997 ?auto_206002 ) ) ( not ( = ?auto_205997 ?auto_205995 ) ) ( not ( = ?auto_205998 ?auto_205999 ) ) ( not ( = ?auto_205998 ?auto_206003 ) ) ( not ( = ?auto_205998 ?auto_206002 ) ) ( not ( = ?auto_205998 ?auto_205995 ) ) ( not ( = ?auto_205999 ?auto_206003 ) ) ( not ( = ?auto_205999 ?auto_206002 ) ) ( not ( = ?auto_205999 ?auto_205995 ) ) ( not ( = ?auto_206003 ?auto_206002 ) ) ( not ( = ?auto_206003 ?auto_205995 ) ) ( ON ?auto_205995 ?auto_205996 ) ( not ( = ?auto_205995 ?auto_205996 ) ) ( not ( = ?auto_206002 ?auto_205996 ) ) ( not ( = ?auto_206001 ?auto_205996 ) ) ( not ( = ?auto_206000 ?auto_205996 ) ) ( not ( = ?auto_205997 ?auto_205996 ) ) ( not ( = ?auto_205998 ?auto_205996 ) ) ( not ( = ?auto_205999 ?auto_205996 ) ) ( not ( = ?auto_206003 ?auto_205996 ) ) ( ON ?auto_206002 ?auto_205995 ) ( CLEAR ?auto_206002 ) ( ON-TABLE ?auto_205996 ) ( HOLDING ?auto_206003 ) ( CLEAR ?auto_205999 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_206001 ?auto_206000 ?auto_205997 ?auto_205998 ?auto_205999 ?auto_206003 )
      ( MAKE-1PILE ?auto_205995 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_206004 - BLOCK
    )
    :vars
    (
      ?auto_206009 - BLOCK
      ?auto_206008 - BLOCK
      ?auto_206005 - BLOCK
      ?auto_206011 - BLOCK
      ?auto_206010 - BLOCK
      ?auto_206006 - BLOCK
      ?auto_206012 - BLOCK
      ?auto_206007 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_206004 ?auto_206009 ) ) ( ON-TABLE ?auto_206008 ) ( ON ?auto_206005 ?auto_206008 ) ( ON ?auto_206011 ?auto_206005 ) ( ON ?auto_206010 ?auto_206011 ) ( ON ?auto_206006 ?auto_206010 ) ( not ( = ?auto_206008 ?auto_206005 ) ) ( not ( = ?auto_206008 ?auto_206011 ) ) ( not ( = ?auto_206008 ?auto_206010 ) ) ( not ( = ?auto_206008 ?auto_206006 ) ) ( not ( = ?auto_206008 ?auto_206012 ) ) ( not ( = ?auto_206008 ?auto_206009 ) ) ( not ( = ?auto_206008 ?auto_206004 ) ) ( not ( = ?auto_206005 ?auto_206011 ) ) ( not ( = ?auto_206005 ?auto_206010 ) ) ( not ( = ?auto_206005 ?auto_206006 ) ) ( not ( = ?auto_206005 ?auto_206012 ) ) ( not ( = ?auto_206005 ?auto_206009 ) ) ( not ( = ?auto_206005 ?auto_206004 ) ) ( not ( = ?auto_206011 ?auto_206010 ) ) ( not ( = ?auto_206011 ?auto_206006 ) ) ( not ( = ?auto_206011 ?auto_206012 ) ) ( not ( = ?auto_206011 ?auto_206009 ) ) ( not ( = ?auto_206011 ?auto_206004 ) ) ( not ( = ?auto_206010 ?auto_206006 ) ) ( not ( = ?auto_206010 ?auto_206012 ) ) ( not ( = ?auto_206010 ?auto_206009 ) ) ( not ( = ?auto_206010 ?auto_206004 ) ) ( not ( = ?auto_206006 ?auto_206012 ) ) ( not ( = ?auto_206006 ?auto_206009 ) ) ( not ( = ?auto_206006 ?auto_206004 ) ) ( not ( = ?auto_206012 ?auto_206009 ) ) ( not ( = ?auto_206012 ?auto_206004 ) ) ( ON ?auto_206004 ?auto_206007 ) ( not ( = ?auto_206004 ?auto_206007 ) ) ( not ( = ?auto_206009 ?auto_206007 ) ) ( not ( = ?auto_206008 ?auto_206007 ) ) ( not ( = ?auto_206005 ?auto_206007 ) ) ( not ( = ?auto_206011 ?auto_206007 ) ) ( not ( = ?auto_206010 ?auto_206007 ) ) ( not ( = ?auto_206006 ?auto_206007 ) ) ( not ( = ?auto_206012 ?auto_206007 ) ) ( ON ?auto_206009 ?auto_206004 ) ( ON-TABLE ?auto_206007 ) ( CLEAR ?auto_206006 ) ( ON ?auto_206012 ?auto_206009 ) ( CLEAR ?auto_206012 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_206007 ?auto_206004 ?auto_206009 )
      ( MAKE-1PILE ?auto_206004 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_206013 - BLOCK
    )
    :vars
    (
      ?auto_206014 - BLOCK
      ?auto_206020 - BLOCK
      ?auto_206016 - BLOCK
      ?auto_206017 - BLOCK
      ?auto_206021 - BLOCK
      ?auto_206019 - BLOCK
      ?auto_206015 - BLOCK
      ?auto_206018 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_206013 ?auto_206014 ) ) ( ON-TABLE ?auto_206020 ) ( ON ?auto_206016 ?auto_206020 ) ( ON ?auto_206017 ?auto_206016 ) ( ON ?auto_206021 ?auto_206017 ) ( not ( = ?auto_206020 ?auto_206016 ) ) ( not ( = ?auto_206020 ?auto_206017 ) ) ( not ( = ?auto_206020 ?auto_206021 ) ) ( not ( = ?auto_206020 ?auto_206019 ) ) ( not ( = ?auto_206020 ?auto_206015 ) ) ( not ( = ?auto_206020 ?auto_206014 ) ) ( not ( = ?auto_206020 ?auto_206013 ) ) ( not ( = ?auto_206016 ?auto_206017 ) ) ( not ( = ?auto_206016 ?auto_206021 ) ) ( not ( = ?auto_206016 ?auto_206019 ) ) ( not ( = ?auto_206016 ?auto_206015 ) ) ( not ( = ?auto_206016 ?auto_206014 ) ) ( not ( = ?auto_206016 ?auto_206013 ) ) ( not ( = ?auto_206017 ?auto_206021 ) ) ( not ( = ?auto_206017 ?auto_206019 ) ) ( not ( = ?auto_206017 ?auto_206015 ) ) ( not ( = ?auto_206017 ?auto_206014 ) ) ( not ( = ?auto_206017 ?auto_206013 ) ) ( not ( = ?auto_206021 ?auto_206019 ) ) ( not ( = ?auto_206021 ?auto_206015 ) ) ( not ( = ?auto_206021 ?auto_206014 ) ) ( not ( = ?auto_206021 ?auto_206013 ) ) ( not ( = ?auto_206019 ?auto_206015 ) ) ( not ( = ?auto_206019 ?auto_206014 ) ) ( not ( = ?auto_206019 ?auto_206013 ) ) ( not ( = ?auto_206015 ?auto_206014 ) ) ( not ( = ?auto_206015 ?auto_206013 ) ) ( ON ?auto_206013 ?auto_206018 ) ( not ( = ?auto_206013 ?auto_206018 ) ) ( not ( = ?auto_206014 ?auto_206018 ) ) ( not ( = ?auto_206020 ?auto_206018 ) ) ( not ( = ?auto_206016 ?auto_206018 ) ) ( not ( = ?auto_206017 ?auto_206018 ) ) ( not ( = ?auto_206021 ?auto_206018 ) ) ( not ( = ?auto_206019 ?auto_206018 ) ) ( not ( = ?auto_206015 ?auto_206018 ) ) ( ON ?auto_206014 ?auto_206013 ) ( ON-TABLE ?auto_206018 ) ( ON ?auto_206015 ?auto_206014 ) ( CLEAR ?auto_206015 ) ( HOLDING ?auto_206019 ) ( CLEAR ?auto_206021 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_206020 ?auto_206016 ?auto_206017 ?auto_206021 ?auto_206019 )
      ( MAKE-1PILE ?auto_206013 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_206022 - BLOCK
    )
    :vars
    (
      ?auto_206023 - BLOCK
      ?auto_206026 - BLOCK
      ?auto_206029 - BLOCK
      ?auto_206028 - BLOCK
      ?auto_206025 - BLOCK
      ?auto_206027 - BLOCK
      ?auto_206024 - BLOCK
      ?auto_206030 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_206022 ?auto_206023 ) ) ( ON-TABLE ?auto_206026 ) ( ON ?auto_206029 ?auto_206026 ) ( ON ?auto_206028 ?auto_206029 ) ( ON ?auto_206025 ?auto_206028 ) ( not ( = ?auto_206026 ?auto_206029 ) ) ( not ( = ?auto_206026 ?auto_206028 ) ) ( not ( = ?auto_206026 ?auto_206025 ) ) ( not ( = ?auto_206026 ?auto_206027 ) ) ( not ( = ?auto_206026 ?auto_206024 ) ) ( not ( = ?auto_206026 ?auto_206023 ) ) ( not ( = ?auto_206026 ?auto_206022 ) ) ( not ( = ?auto_206029 ?auto_206028 ) ) ( not ( = ?auto_206029 ?auto_206025 ) ) ( not ( = ?auto_206029 ?auto_206027 ) ) ( not ( = ?auto_206029 ?auto_206024 ) ) ( not ( = ?auto_206029 ?auto_206023 ) ) ( not ( = ?auto_206029 ?auto_206022 ) ) ( not ( = ?auto_206028 ?auto_206025 ) ) ( not ( = ?auto_206028 ?auto_206027 ) ) ( not ( = ?auto_206028 ?auto_206024 ) ) ( not ( = ?auto_206028 ?auto_206023 ) ) ( not ( = ?auto_206028 ?auto_206022 ) ) ( not ( = ?auto_206025 ?auto_206027 ) ) ( not ( = ?auto_206025 ?auto_206024 ) ) ( not ( = ?auto_206025 ?auto_206023 ) ) ( not ( = ?auto_206025 ?auto_206022 ) ) ( not ( = ?auto_206027 ?auto_206024 ) ) ( not ( = ?auto_206027 ?auto_206023 ) ) ( not ( = ?auto_206027 ?auto_206022 ) ) ( not ( = ?auto_206024 ?auto_206023 ) ) ( not ( = ?auto_206024 ?auto_206022 ) ) ( ON ?auto_206022 ?auto_206030 ) ( not ( = ?auto_206022 ?auto_206030 ) ) ( not ( = ?auto_206023 ?auto_206030 ) ) ( not ( = ?auto_206026 ?auto_206030 ) ) ( not ( = ?auto_206029 ?auto_206030 ) ) ( not ( = ?auto_206028 ?auto_206030 ) ) ( not ( = ?auto_206025 ?auto_206030 ) ) ( not ( = ?auto_206027 ?auto_206030 ) ) ( not ( = ?auto_206024 ?auto_206030 ) ) ( ON ?auto_206023 ?auto_206022 ) ( ON-TABLE ?auto_206030 ) ( ON ?auto_206024 ?auto_206023 ) ( CLEAR ?auto_206025 ) ( ON ?auto_206027 ?auto_206024 ) ( CLEAR ?auto_206027 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_206030 ?auto_206022 ?auto_206023 ?auto_206024 )
      ( MAKE-1PILE ?auto_206022 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_206031 - BLOCK
    )
    :vars
    (
      ?auto_206033 - BLOCK
      ?auto_206039 - BLOCK
      ?auto_206036 - BLOCK
      ?auto_206037 - BLOCK
      ?auto_206035 - BLOCK
      ?auto_206038 - BLOCK
      ?auto_206034 - BLOCK
      ?auto_206032 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_206031 ?auto_206033 ) ) ( ON-TABLE ?auto_206039 ) ( ON ?auto_206036 ?auto_206039 ) ( ON ?auto_206037 ?auto_206036 ) ( not ( = ?auto_206039 ?auto_206036 ) ) ( not ( = ?auto_206039 ?auto_206037 ) ) ( not ( = ?auto_206039 ?auto_206035 ) ) ( not ( = ?auto_206039 ?auto_206038 ) ) ( not ( = ?auto_206039 ?auto_206034 ) ) ( not ( = ?auto_206039 ?auto_206033 ) ) ( not ( = ?auto_206039 ?auto_206031 ) ) ( not ( = ?auto_206036 ?auto_206037 ) ) ( not ( = ?auto_206036 ?auto_206035 ) ) ( not ( = ?auto_206036 ?auto_206038 ) ) ( not ( = ?auto_206036 ?auto_206034 ) ) ( not ( = ?auto_206036 ?auto_206033 ) ) ( not ( = ?auto_206036 ?auto_206031 ) ) ( not ( = ?auto_206037 ?auto_206035 ) ) ( not ( = ?auto_206037 ?auto_206038 ) ) ( not ( = ?auto_206037 ?auto_206034 ) ) ( not ( = ?auto_206037 ?auto_206033 ) ) ( not ( = ?auto_206037 ?auto_206031 ) ) ( not ( = ?auto_206035 ?auto_206038 ) ) ( not ( = ?auto_206035 ?auto_206034 ) ) ( not ( = ?auto_206035 ?auto_206033 ) ) ( not ( = ?auto_206035 ?auto_206031 ) ) ( not ( = ?auto_206038 ?auto_206034 ) ) ( not ( = ?auto_206038 ?auto_206033 ) ) ( not ( = ?auto_206038 ?auto_206031 ) ) ( not ( = ?auto_206034 ?auto_206033 ) ) ( not ( = ?auto_206034 ?auto_206031 ) ) ( ON ?auto_206031 ?auto_206032 ) ( not ( = ?auto_206031 ?auto_206032 ) ) ( not ( = ?auto_206033 ?auto_206032 ) ) ( not ( = ?auto_206039 ?auto_206032 ) ) ( not ( = ?auto_206036 ?auto_206032 ) ) ( not ( = ?auto_206037 ?auto_206032 ) ) ( not ( = ?auto_206035 ?auto_206032 ) ) ( not ( = ?auto_206038 ?auto_206032 ) ) ( not ( = ?auto_206034 ?auto_206032 ) ) ( ON ?auto_206033 ?auto_206031 ) ( ON-TABLE ?auto_206032 ) ( ON ?auto_206034 ?auto_206033 ) ( ON ?auto_206038 ?auto_206034 ) ( CLEAR ?auto_206038 ) ( HOLDING ?auto_206035 ) ( CLEAR ?auto_206037 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_206039 ?auto_206036 ?auto_206037 ?auto_206035 )
      ( MAKE-1PILE ?auto_206031 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_206040 - BLOCK
    )
    :vars
    (
      ?auto_206045 - BLOCK
      ?auto_206041 - BLOCK
      ?auto_206043 - BLOCK
      ?auto_206046 - BLOCK
      ?auto_206042 - BLOCK
      ?auto_206044 - BLOCK
      ?auto_206047 - BLOCK
      ?auto_206048 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_206040 ?auto_206045 ) ) ( ON-TABLE ?auto_206041 ) ( ON ?auto_206043 ?auto_206041 ) ( ON ?auto_206046 ?auto_206043 ) ( not ( = ?auto_206041 ?auto_206043 ) ) ( not ( = ?auto_206041 ?auto_206046 ) ) ( not ( = ?auto_206041 ?auto_206042 ) ) ( not ( = ?auto_206041 ?auto_206044 ) ) ( not ( = ?auto_206041 ?auto_206047 ) ) ( not ( = ?auto_206041 ?auto_206045 ) ) ( not ( = ?auto_206041 ?auto_206040 ) ) ( not ( = ?auto_206043 ?auto_206046 ) ) ( not ( = ?auto_206043 ?auto_206042 ) ) ( not ( = ?auto_206043 ?auto_206044 ) ) ( not ( = ?auto_206043 ?auto_206047 ) ) ( not ( = ?auto_206043 ?auto_206045 ) ) ( not ( = ?auto_206043 ?auto_206040 ) ) ( not ( = ?auto_206046 ?auto_206042 ) ) ( not ( = ?auto_206046 ?auto_206044 ) ) ( not ( = ?auto_206046 ?auto_206047 ) ) ( not ( = ?auto_206046 ?auto_206045 ) ) ( not ( = ?auto_206046 ?auto_206040 ) ) ( not ( = ?auto_206042 ?auto_206044 ) ) ( not ( = ?auto_206042 ?auto_206047 ) ) ( not ( = ?auto_206042 ?auto_206045 ) ) ( not ( = ?auto_206042 ?auto_206040 ) ) ( not ( = ?auto_206044 ?auto_206047 ) ) ( not ( = ?auto_206044 ?auto_206045 ) ) ( not ( = ?auto_206044 ?auto_206040 ) ) ( not ( = ?auto_206047 ?auto_206045 ) ) ( not ( = ?auto_206047 ?auto_206040 ) ) ( ON ?auto_206040 ?auto_206048 ) ( not ( = ?auto_206040 ?auto_206048 ) ) ( not ( = ?auto_206045 ?auto_206048 ) ) ( not ( = ?auto_206041 ?auto_206048 ) ) ( not ( = ?auto_206043 ?auto_206048 ) ) ( not ( = ?auto_206046 ?auto_206048 ) ) ( not ( = ?auto_206042 ?auto_206048 ) ) ( not ( = ?auto_206044 ?auto_206048 ) ) ( not ( = ?auto_206047 ?auto_206048 ) ) ( ON ?auto_206045 ?auto_206040 ) ( ON-TABLE ?auto_206048 ) ( ON ?auto_206047 ?auto_206045 ) ( ON ?auto_206044 ?auto_206047 ) ( CLEAR ?auto_206046 ) ( ON ?auto_206042 ?auto_206044 ) ( CLEAR ?auto_206042 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_206048 ?auto_206040 ?auto_206045 ?auto_206047 ?auto_206044 )
      ( MAKE-1PILE ?auto_206040 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_206049 - BLOCK
    )
    :vars
    (
      ?auto_206057 - BLOCK
      ?auto_206055 - BLOCK
      ?auto_206054 - BLOCK
      ?auto_206052 - BLOCK
      ?auto_206053 - BLOCK
      ?auto_206050 - BLOCK
      ?auto_206056 - BLOCK
      ?auto_206051 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_206049 ?auto_206057 ) ) ( ON-TABLE ?auto_206055 ) ( ON ?auto_206054 ?auto_206055 ) ( not ( = ?auto_206055 ?auto_206054 ) ) ( not ( = ?auto_206055 ?auto_206052 ) ) ( not ( = ?auto_206055 ?auto_206053 ) ) ( not ( = ?auto_206055 ?auto_206050 ) ) ( not ( = ?auto_206055 ?auto_206056 ) ) ( not ( = ?auto_206055 ?auto_206057 ) ) ( not ( = ?auto_206055 ?auto_206049 ) ) ( not ( = ?auto_206054 ?auto_206052 ) ) ( not ( = ?auto_206054 ?auto_206053 ) ) ( not ( = ?auto_206054 ?auto_206050 ) ) ( not ( = ?auto_206054 ?auto_206056 ) ) ( not ( = ?auto_206054 ?auto_206057 ) ) ( not ( = ?auto_206054 ?auto_206049 ) ) ( not ( = ?auto_206052 ?auto_206053 ) ) ( not ( = ?auto_206052 ?auto_206050 ) ) ( not ( = ?auto_206052 ?auto_206056 ) ) ( not ( = ?auto_206052 ?auto_206057 ) ) ( not ( = ?auto_206052 ?auto_206049 ) ) ( not ( = ?auto_206053 ?auto_206050 ) ) ( not ( = ?auto_206053 ?auto_206056 ) ) ( not ( = ?auto_206053 ?auto_206057 ) ) ( not ( = ?auto_206053 ?auto_206049 ) ) ( not ( = ?auto_206050 ?auto_206056 ) ) ( not ( = ?auto_206050 ?auto_206057 ) ) ( not ( = ?auto_206050 ?auto_206049 ) ) ( not ( = ?auto_206056 ?auto_206057 ) ) ( not ( = ?auto_206056 ?auto_206049 ) ) ( ON ?auto_206049 ?auto_206051 ) ( not ( = ?auto_206049 ?auto_206051 ) ) ( not ( = ?auto_206057 ?auto_206051 ) ) ( not ( = ?auto_206055 ?auto_206051 ) ) ( not ( = ?auto_206054 ?auto_206051 ) ) ( not ( = ?auto_206052 ?auto_206051 ) ) ( not ( = ?auto_206053 ?auto_206051 ) ) ( not ( = ?auto_206050 ?auto_206051 ) ) ( not ( = ?auto_206056 ?auto_206051 ) ) ( ON ?auto_206057 ?auto_206049 ) ( ON-TABLE ?auto_206051 ) ( ON ?auto_206056 ?auto_206057 ) ( ON ?auto_206050 ?auto_206056 ) ( ON ?auto_206053 ?auto_206050 ) ( CLEAR ?auto_206053 ) ( HOLDING ?auto_206052 ) ( CLEAR ?auto_206054 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_206055 ?auto_206054 ?auto_206052 )
      ( MAKE-1PILE ?auto_206049 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_206058 - BLOCK
    )
    :vars
    (
      ?auto_206065 - BLOCK
      ?auto_206060 - BLOCK
      ?auto_206063 - BLOCK
      ?auto_206066 - BLOCK
      ?auto_206064 - BLOCK
      ?auto_206059 - BLOCK
      ?auto_206062 - BLOCK
      ?auto_206061 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_206058 ?auto_206065 ) ) ( ON-TABLE ?auto_206060 ) ( ON ?auto_206063 ?auto_206060 ) ( not ( = ?auto_206060 ?auto_206063 ) ) ( not ( = ?auto_206060 ?auto_206066 ) ) ( not ( = ?auto_206060 ?auto_206064 ) ) ( not ( = ?auto_206060 ?auto_206059 ) ) ( not ( = ?auto_206060 ?auto_206062 ) ) ( not ( = ?auto_206060 ?auto_206065 ) ) ( not ( = ?auto_206060 ?auto_206058 ) ) ( not ( = ?auto_206063 ?auto_206066 ) ) ( not ( = ?auto_206063 ?auto_206064 ) ) ( not ( = ?auto_206063 ?auto_206059 ) ) ( not ( = ?auto_206063 ?auto_206062 ) ) ( not ( = ?auto_206063 ?auto_206065 ) ) ( not ( = ?auto_206063 ?auto_206058 ) ) ( not ( = ?auto_206066 ?auto_206064 ) ) ( not ( = ?auto_206066 ?auto_206059 ) ) ( not ( = ?auto_206066 ?auto_206062 ) ) ( not ( = ?auto_206066 ?auto_206065 ) ) ( not ( = ?auto_206066 ?auto_206058 ) ) ( not ( = ?auto_206064 ?auto_206059 ) ) ( not ( = ?auto_206064 ?auto_206062 ) ) ( not ( = ?auto_206064 ?auto_206065 ) ) ( not ( = ?auto_206064 ?auto_206058 ) ) ( not ( = ?auto_206059 ?auto_206062 ) ) ( not ( = ?auto_206059 ?auto_206065 ) ) ( not ( = ?auto_206059 ?auto_206058 ) ) ( not ( = ?auto_206062 ?auto_206065 ) ) ( not ( = ?auto_206062 ?auto_206058 ) ) ( ON ?auto_206058 ?auto_206061 ) ( not ( = ?auto_206058 ?auto_206061 ) ) ( not ( = ?auto_206065 ?auto_206061 ) ) ( not ( = ?auto_206060 ?auto_206061 ) ) ( not ( = ?auto_206063 ?auto_206061 ) ) ( not ( = ?auto_206066 ?auto_206061 ) ) ( not ( = ?auto_206064 ?auto_206061 ) ) ( not ( = ?auto_206059 ?auto_206061 ) ) ( not ( = ?auto_206062 ?auto_206061 ) ) ( ON ?auto_206065 ?auto_206058 ) ( ON-TABLE ?auto_206061 ) ( ON ?auto_206062 ?auto_206065 ) ( ON ?auto_206059 ?auto_206062 ) ( ON ?auto_206064 ?auto_206059 ) ( CLEAR ?auto_206063 ) ( ON ?auto_206066 ?auto_206064 ) ( CLEAR ?auto_206066 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_206061 ?auto_206058 ?auto_206065 ?auto_206062 ?auto_206059 ?auto_206064 )
      ( MAKE-1PILE ?auto_206058 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_206067 - BLOCK
    )
    :vars
    (
      ?auto_206068 - BLOCK
      ?auto_206069 - BLOCK
      ?auto_206073 - BLOCK
      ?auto_206072 - BLOCK
      ?auto_206074 - BLOCK
      ?auto_206075 - BLOCK
      ?auto_206070 - BLOCK
      ?auto_206071 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_206067 ?auto_206068 ) ) ( ON-TABLE ?auto_206069 ) ( not ( = ?auto_206069 ?auto_206073 ) ) ( not ( = ?auto_206069 ?auto_206072 ) ) ( not ( = ?auto_206069 ?auto_206074 ) ) ( not ( = ?auto_206069 ?auto_206075 ) ) ( not ( = ?auto_206069 ?auto_206070 ) ) ( not ( = ?auto_206069 ?auto_206068 ) ) ( not ( = ?auto_206069 ?auto_206067 ) ) ( not ( = ?auto_206073 ?auto_206072 ) ) ( not ( = ?auto_206073 ?auto_206074 ) ) ( not ( = ?auto_206073 ?auto_206075 ) ) ( not ( = ?auto_206073 ?auto_206070 ) ) ( not ( = ?auto_206073 ?auto_206068 ) ) ( not ( = ?auto_206073 ?auto_206067 ) ) ( not ( = ?auto_206072 ?auto_206074 ) ) ( not ( = ?auto_206072 ?auto_206075 ) ) ( not ( = ?auto_206072 ?auto_206070 ) ) ( not ( = ?auto_206072 ?auto_206068 ) ) ( not ( = ?auto_206072 ?auto_206067 ) ) ( not ( = ?auto_206074 ?auto_206075 ) ) ( not ( = ?auto_206074 ?auto_206070 ) ) ( not ( = ?auto_206074 ?auto_206068 ) ) ( not ( = ?auto_206074 ?auto_206067 ) ) ( not ( = ?auto_206075 ?auto_206070 ) ) ( not ( = ?auto_206075 ?auto_206068 ) ) ( not ( = ?auto_206075 ?auto_206067 ) ) ( not ( = ?auto_206070 ?auto_206068 ) ) ( not ( = ?auto_206070 ?auto_206067 ) ) ( ON ?auto_206067 ?auto_206071 ) ( not ( = ?auto_206067 ?auto_206071 ) ) ( not ( = ?auto_206068 ?auto_206071 ) ) ( not ( = ?auto_206069 ?auto_206071 ) ) ( not ( = ?auto_206073 ?auto_206071 ) ) ( not ( = ?auto_206072 ?auto_206071 ) ) ( not ( = ?auto_206074 ?auto_206071 ) ) ( not ( = ?auto_206075 ?auto_206071 ) ) ( not ( = ?auto_206070 ?auto_206071 ) ) ( ON ?auto_206068 ?auto_206067 ) ( ON-TABLE ?auto_206071 ) ( ON ?auto_206070 ?auto_206068 ) ( ON ?auto_206075 ?auto_206070 ) ( ON ?auto_206074 ?auto_206075 ) ( ON ?auto_206072 ?auto_206074 ) ( CLEAR ?auto_206072 ) ( HOLDING ?auto_206073 ) ( CLEAR ?auto_206069 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_206069 ?auto_206073 )
      ( MAKE-1PILE ?auto_206067 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_206076 - BLOCK
    )
    :vars
    (
      ?auto_206081 - BLOCK
      ?auto_206078 - BLOCK
      ?auto_206077 - BLOCK
      ?auto_206080 - BLOCK
      ?auto_206084 - BLOCK
      ?auto_206079 - BLOCK
      ?auto_206082 - BLOCK
      ?auto_206083 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_206076 ?auto_206081 ) ) ( ON-TABLE ?auto_206078 ) ( not ( = ?auto_206078 ?auto_206077 ) ) ( not ( = ?auto_206078 ?auto_206080 ) ) ( not ( = ?auto_206078 ?auto_206084 ) ) ( not ( = ?auto_206078 ?auto_206079 ) ) ( not ( = ?auto_206078 ?auto_206082 ) ) ( not ( = ?auto_206078 ?auto_206081 ) ) ( not ( = ?auto_206078 ?auto_206076 ) ) ( not ( = ?auto_206077 ?auto_206080 ) ) ( not ( = ?auto_206077 ?auto_206084 ) ) ( not ( = ?auto_206077 ?auto_206079 ) ) ( not ( = ?auto_206077 ?auto_206082 ) ) ( not ( = ?auto_206077 ?auto_206081 ) ) ( not ( = ?auto_206077 ?auto_206076 ) ) ( not ( = ?auto_206080 ?auto_206084 ) ) ( not ( = ?auto_206080 ?auto_206079 ) ) ( not ( = ?auto_206080 ?auto_206082 ) ) ( not ( = ?auto_206080 ?auto_206081 ) ) ( not ( = ?auto_206080 ?auto_206076 ) ) ( not ( = ?auto_206084 ?auto_206079 ) ) ( not ( = ?auto_206084 ?auto_206082 ) ) ( not ( = ?auto_206084 ?auto_206081 ) ) ( not ( = ?auto_206084 ?auto_206076 ) ) ( not ( = ?auto_206079 ?auto_206082 ) ) ( not ( = ?auto_206079 ?auto_206081 ) ) ( not ( = ?auto_206079 ?auto_206076 ) ) ( not ( = ?auto_206082 ?auto_206081 ) ) ( not ( = ?auto_206082 ?auto_206076 ) ) ( ON ?auto_206076 ?auto_206083 ) ( not ( = ?auto_206076 ?auto_206083 ) ) ( not ( = ?auto_206081 ?auto_206083 ) ) ( not ( = ?auto_206078 ?auto_206083 ) ) ( not ( = ?auto_206077 ?auto_206083 ) ) ( not ( = ?auto_206080 ?auto_206083 ) ) ( not ( = ?auto_206084 ?auto_206083 ) ) ( not ( = ?auto_206079 ?auto_206083 ) ) ( not ( = ?auto_206082 ?auto_206083 ) ) ( ON ?auto_206081 ?auto_206076 ) ( ON-TABLE ?auto_206083 ) ( ON ?auto_206082 ?auto_206081 ) ( ON ?auto_206079 ?auto_206082 ) ( ON ?auto_206084 ?auto_206079 ) ( ON ?auto_206080 ?auto_206084 ) ( CLEAR ?auto_206078 ) ( ON ?auto_206077 ?auto_206080 ) ( CLEAR ?auto_206077 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_206083 ?auto_206076 ?auto_206081 ?auto_206082 ?auto_206079 ?auto_206084 ?auto_206080 )
      ( MAKE-1PILE ?auto_206076 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_206085 - BLOCK
    )
    :vars
    (
      ?auto_206086 - BLOCK
      ?auto_206087 - BLOCK
      ?auto_206089 - BLOCK
      ?auto_206092 - BLOCK
      ?auto_206093 - BLOCK
      ?auto_206088 - BLOCK
      ?auto_206090 - BLOCK
      ?auto_206091 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_206085 ?auto_206086 ) ) ( not ( = ?auto_206087 ?auto_206089 ) ) ( not ( = ?auto_206087 ?auto_206092 ) ) ( not ( = ?auto_206087 ?auto_206093 ) ) ( not ( = ?auto_206087 ?auto_206088 ) ) ( not ( = ?auto_206087 ?auto_206090 ) ) ( not ( = ?auto_206087 ?auto_206086 ) ) ( not ( = ?auto_206087 ?auto_206085 ) ) ( not ( = ?auto_206089 ?auto_206092 ) ) ( not ( = ?auto_206089 ?auto_206093 ) ) ( not ( = ?auto_206089 ?auto_206088 ) ) ( not ( = ?auto_206089 ?auto_206090 ) ) ( not ( = ?auto_206089 ?auto_206086 ) ) ( not ( = ?auto_206089 ?auto_206085 ) ) ( not ( = ?auto_206092 ?auto_206093 ) ) ( not ( = ?auto_206092 ?auto_206088 ) ) ( not ( = ?auto_206092 ?auto_206090 ) ) ( not ( = ?auto_206092 ?auto_206086 ) ) ( not ( = ?auto_206092 ?auto_206085 ) ) ( not ( = ?auto_206093 ?auto_206088 ) ) ( not ( = ?auto_206093 ?auto_206090 ) ) ( not ( = ?auto_206093 ?auto_206086 ) ) ( not ( = ?auto_206093 ?auto_206085 ) ) ( not ( = ?auto_206088 ?auto_206090 ) ) ( not ( = ?auto_206088 ?auto_206086 ) ) ( not ( = ?auto_206088 ?auto_206085 ) ) ( not ( = ?auto_206090 ?auto_206086 ) ) ( not ( = ?auto_206090 ?auto_206085 ) ) ( ON ?auto_206085 ?auto_206091 ) ( not ( = ?auto_206085 ?auto_206091 ) ) ( not ( = ?auto_206086 ?auto_206091 ) ) ( not ( = ?auto_206087 ?auto_206091 ) ) ( not ( = ?auto_206089 ?auto_206091 ) ) ( not ( = ?auto_206092 ?auto_206091 ) ) ( not ( = ?auto_206093 ?auto_206091 ) ) ( not ( = ?auto_206088 ?auto_206091 ) ) ( not ( = ?auto_206090 ?auto_206091 ) ) ( ON ?auto_206086 ?auto_206085 ) ( ON-TABLE ?auto_206091 ) ( ON ?auto_206090 ?auto_206086 ) ( ON ?auto_206088 ?auto_206090 ) ( ON ?auto_206093 ?auto_206088 ) ( ON ?auto_206092 ?auto_206093 ) ( ON ?auto_206089 ?auto_206092 ) ( CLEAR ?auto_206089 ) ( HOLDING ?auto_206087 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_206087 )
      ( MAKE-1PILE ?auto_206085 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_206094 - BLOCK
    )
    :vars
    (
      ?auto_206098 - BLOCK
      ?auto_206099 - BLOCK
      ?auto_206095 - BLOCK
      ?auto_206100 - BLOCK
      ?auto_206102 - BLOCK
      ?auto_206097 - BLOCK
      ?auto_206101 - BLOCK
      ?auto_206096 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_206094 ?auto_206098 ) ) ( not ( = ?auto_206099 ?auto_206095 ) ) ( not ( = ?auto_206099 ?auto_206100 ) ) ( not ( = ?auto_206099 ?auto_206102 ) ) ( not ( = ?auto_206099 ?auto_206097 ) ) ( not ( = ?auto_206099 ?auto_206101 ) ) ( not ( = ?auto_206099 ?auto_206098 ) ) ( not ( = ?auto_206099 ?auto_206094 ) ) ( not ( = ?auto_206095 ?auto_206100 ) ) ( not ( = ?auto_206095 ?auto_206102 ) ) ( not ( = ?auto_206095 ?auto_206097 ) ) ( not ( = ?auto_206095 ?auto_206101 ) ) ( not ( = ?auto_206095 ?auto_206098 ) ) ( not ( = ?auto_206095 ?auto_206094 ) ) ( not ( = ?auto_206100 ?auto_206102 ) ) ( not ( = ?auto_206100 ?auto_206097 ) ) ( not ( = ?auto_206100 ?auto_206101 ) ) ( not ( = ?auto_206100 ?auto_206098 ) ) ( not ( = ?auto_206100 ?auto_206094 ) ) ( not ( = ?auto_206102 ?auto_206097 ) ) ( not ( = ?auto_206102 ?auto_206101 ) ) ( not ( = ?auto_206102 ?auto_206098 ) ) ( not ( = ?auto_206102 ?auto_206094 ) ) ( not ( = ?auto_206097 ?auto_206101 ) ) ( not ( = ?auto_206097 ?auto_206098 ) ) ( not ( = ?auto_206097 ?auto_206094 ) ) ( not ( = ?auto_206101 ?auto_206098 ) ) ( not ( = ?auto_206101 ?auto_206094 ) ) ( ON ?auto_206094 ?auto_206096 ) ( not ( = ?auto_206094 ?auto_206096 ) ) ( not ( = ?auto_206098 ?auto_206096 ) ) ( not ( = ?auto_206099 ?auto_206096 ) ) ( not ( = ?auto_206095 ?auto_206096 ) ) ( not ( = ?auto_206100 ?auto_206096 ) ) ( not ( = ?auto_206102 ?auto_206096 ) ) ( not ( = ?auto_206097 ?auto_206096 ) ) ( not ( = ?auto_206101 ?auto_206096 ) ) ( ON ?auto_206098 ?auto_206094 ) ( ON-TABLE ?auto_206096 ) ( ON ?auto_206101 ?auto_206098 ) ( ON ?auto_206097 ?auto_206101 ) ( ON ?auto_206102 ?auto_206097 ) ( ON ?auto_206100 ?auto_206102 ) ( ON ?auto_206095 ?auto_206100 ) ( ON ?auto_206099 ?auto_206095 ) ( CLEAR ?auto_206099 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_206096 ?auto_206094 ?auto_206098 ?auto_206101 ?auto_206097 ?auto_206102 ?auto_206100 ?auto_206095 )
      ( MAKE-1PILE ?auto_206094 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_206109 - BLOCK
      ?auto_206110 - BLOCK
      ?auto_206111 - BLOCK
      ?auto_206112 - BLOCK
      ?auto_206113 - BLOCK
      ?auto_206114 - BLOCK
    )
    :vars
    (
      ?auto_206115 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206115 ?auto_206114 ) ( CLEAR ?auto_206115 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_206109 ) ( ON ?auto_206110 ?auto_206109 ) ( ON ?auto_206111 ?auto_206110 ) ( ON ?auto_206112 ?auto_206111 ) ( ON ?auto_206113 ?auto_206112 ) ( ON ?auto_206114 ?auto_206113 ) ( not ( = ?auto_206109 ?auto_206110 ) ) ( not ( = ?auto_206109 ?auto_206111 ) ) ( not ( = ?auto_206109 ?auto_206112 ) ) ( not ( = ?auto_206109 ?auto_206113 ) ) ( not ( = ?auto_206109 ?auto_206114 ) ) ( not ( = ?auto_206109 ?auto_206115 ) ) ( not ( = ?auto_206110 ?auto_206111 ) ) ( not ( = ?auto_206110 ?auto_206112 ) ) ( not ( = ?auto_206110 ?auto_206113 ) ) ( not ( = ?auto_206110 ?auto_206114 ) ) ( not ( = ?auto_206110 ?auto_206115 ) ) ( not ( = ?auto_206111 ?auto_206112 ) ) ( not ( = ?auto_206111 ?auto_206113 ) ) ( not ( = ?auto_206111 ?auto_206114 ) ) ( not ( = ?auto_206111 ?auto_206115 ) ) ( not ( = ?auto_206112 ?auto_206113 ) ) ( not ( = ?auto_206112 ?auto_206114 ) ) ( not ( = ?auto_206112 ?auto_206115 ) ) ( not ( = ?auto_206113 ?auto_206114 ) ) ( not ( = ?auto_206113 ?auto_206115 ) ) ( not ( = ?auto_206114 ?auto_206115 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_206115 ?auto_206114 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_206116 - BLOCK
      ?auto_206117 - BLOCK
      ?auto_206118 - BLOCK
      ?auto_206119 - BLOCK
      ?auto_206120 - BLOCK
      ?auto_206121 - BLOCK
    )
    :vars
    (
      ?auto_206122 - BLOCK
      ?auto_206123 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206122 ?auto_206121 ) ( CLEAR ?auto_206122 ) ( ON-TABLE ?auto_206116 ) ( ON ?auto_206117 ?auto_206116 ) ( ON ?auto_206118 ?auto_206117 ) ( ON ?auto_206119 ?auto_206118 ) ( ON ?auto_206120 ?auto_206119 ) ( ON ?auto_206121 ?auto_206120 ) ( not ( = ?auto_206116 ?auto_206117 ) ) ( not ( = ?auto_206116 ?auto_206118 ) ) ( not ( = ?auto_206116 ?auto_206119 ) ) ( not ( = ?auto_206116 ?auto_206120 ) ) ( not ( = ?auto_206116 ?auto_206121 ) ) ( not ( = ?auto_206116 ?auto_206122 ) ) ( not ( = ?auto_206117 ?auto_206118 ) ) ( not ( = ?auto_206117 ?auto_206119 ) ) ( not ( = ?auto_206117 ?auto_206120 ) ) ( not ( = ?auto_206117 ?auto_206121 ) ) ( not ( = ?auto_206117 ?auto_206122 ) ) ( not ( = ?auto_206118 ?auto_206119 ) ) ( not ( = ?auto_206118 ?auto_206120 ) ) ( not ( = ?auto_206118 ?auto_206121 ) ) ( not ( = ?auto_206118 ?auto_206122 ) ) ( not ( = ?auto_206119 ?auto_206120 ) ) ( not ( = ?auto_206119 ?auto_206121 ) ) ( not ( = ?auto_206119 ?auto_206122 ) ) ( not ( = ?auto_206120 ?auto_206121 ) ) ( not ( = ?auto_206120 ?auto_206122 ) ) ( not ( = ?auto_206121 ?auto_206122 ) ) ( HOLDING ?auto_206123 ) ( not ( = ?auto_206116 ?auto_206123 ) ) ( not ( = ?auto_206117 ?auto_206123 ) ) ( not ( = ?auto_206118 ?auto_206123 ) ) ( not ( = ?auto_206119 ?auto_206123 ) ) ( not ( = ?auto_206120 ?auto_206123 ) ) ( not ( = ?auto_206121 ?auto_206123 ) ) ( not ( = ?auto_206122 ?auto_206123 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_206123 )
      ( MAKE-6PILE ?auto_206116 ?auto_206117 ?auto_206118 ?auto_206119 ?auto_206120 ?auto_206121 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_206124 - BLOCK
      ?auto_206125 - BLOCK
      ?auto_206126 - BLOCK
      ?auto_206127 - BLOCK
      ?auto_206128 - BLOCK
      ?auto_206129 - BLOCK
    )
    :vars
    (
      ?auto_206130 - BLOCK
      ?auto_206131 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206130 ?auto_206129 ) ( ON-TABLE ?auto_206124 ) ( ON ?auto_206125 ?auto_206124 ) ( ON ?auto_206126 ?auto_206125 ) ( ON ?auto_206127 ?auto_206126 ) ( ON ?auto_206128 ?auto_206127 ) ( ON ?auto_206129 ?auto_206128 ) ( not ( = ?auto_206124 ?auto_206125 ) ) ( not ( = ?auto_206124 ?auto_206126 ) ) ( not ( = ?auto_206124 ?auto_206127 ) ) ( not ( = ?auto_206124 ?auto_206128 ) ) ( not ( = ?auto_206124 ?auto_206129 ) ) ( not ( = ?auto_206124 ?auto_206130 ) ) ( not ( = ?auto_206125 ?auto_206126 ) ) ( not ( = ?auto_206125 ?auto_206127 ) ) ( not ( = ?auto_206125 ?auto_206128 ) ) ( not ( = ?auto_206125 ?auto_206129 ) ) ( not ( = ?auto_206125 ?auto_206130 ) ) ( not ( = ?auto_206126 ?auto_206127 ) ) ( not ( = ?auto_206126 ?auto_206128 ) ) ( not ( = ?auto_206126 ?auto_206129 ) ) ( not ( = ?auto_206126 ?auto_206130 ) ) ( not ( = ?auto_206127 ?auto_206128 ) ) ( not ( = ?auto_206127 ?auto_206129 ) ) ( not ( = ?auto_206127 ?auto_206130 ) ) ( not ( = ?auto_206128 ?auto_206129 ) ) ( not ( = ?auto_206128 ?auto_206130 ) ) ( not ( = ?auto_206129 ?auto_206130 ) ) ( not ( = ?auto_206124 ?auto_206131 ) ) ( not ( = ?auto_206125 ?auto_206131 ) ) ( not ( = ?auto_206126 ?auto_206131 ) ) ( not ( = ?auto_206127 ?auto_206131 ) ) ( not ( = ?auto_206128 ?auto_206131 ) ) ( not ( = ?auto_206129 ?auto_206131 ) ) ( not ( = ?auto_206130 ?auto_206131 ) ) ( ON ?auto_206131 ?auto_206130 ) ( CLEAR ?auto_206131 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_206124 ?auto_206125 ?auto_206126 ?auto_206127 ?auto_206128 ?auto_206129 ?auto_206130 )
      ( MAKE-6PILE ?auto_206124 ?auto_206125 ?auto_206126 ?auto_206127 ?auto_206128 ?auto_206129 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_206132 - BLOCK
      ?auto_206133 - BLOCK
      ?auto_206134 - BLOCK
      ?auto_206135 - BLOCK
      ?auto_206136 - BLOCK
      ?auto_206137 - BLOCK
    )
    :vars
    (
      ?auto_206139 - BLOCK
      ?auto_206138 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206139 ?auto_206137 ) ( ON-TABLE ?auto_206132 ) ( ON ?auto_206133 ?auto_206132 ) ( ON ?auto_206134 ?auto_206133 ) ( ON ?auto_206135 ?auto_206134 ) ( ON ?auto_206136 ?auto_206135 ) ( ON ?auto_206137 ?auto_206136 ) ( not ( = ?auto_206132 ?auto_206133 ) ) ( not ( = ?auto_206132 ?auto_206134 ) ) ( not ( = ?auto_206132 ?auto_206135 ) ) ( not ( = ?auto_206132 ?auto_206136 ) ) ( not ( = ?auto_206132 ?auto_206137 ) ) ( not ( = ?auto_206132 ?auto_206139 ) ) ( not ( = ?auto_206133 ?auto_206134 ) ) ( not ( = ?auto_206133 ?auto_206135 ) ) ( not ( = ?auto_206133 ?auto_206136 ) ) ( not ( = ?auto_206133 ?auto_206137 ) ) ( not ( = ?auto_206133 ?auto_206139 ) ) ( not ( = ?auto_206134 ?auto_206135 ) ) ( not ( = ?auto_206134 ?auto_206136 ) ) ( not ( = ?auto_206134 ?auto_206137 ) ) ( not ( = ?auto_206134 ?auto_206139 ) ) ( not ( = ?auto_206135 ?auto_206136 ) ) ( not ( = ?auto_206135 ?auto_206137 ) ) ( not ( = ?auto_206135 ?auto_206139 ) ) ( not ( = ?auto_206136 ?auto_206137 ) ) ( not ( = ?auto_206136 ?auto_206139 ) ) ( not ( = ?auto_206137 ?auto_206139 ) ) ( not ( = ?auto_206132 ?auto_206138 ) ) ( not ( = ?auto_206133 ?auto_206138 ) ) ( not ( = ?auto_206134 ?auto_206138 ) ) ( not ( = ?auto_206135 ?auto_206138 ) ) ( not ( = ?auto_206136 ?auto_206138 ) ) ( not ( = ?auto_206137 ?auto_206138 ) ) ( not ( = ?auto_206139 ?auto_206138 ) ) ( HOLDING ?auto_206138 ) ( CLEAR ?auto_206139 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_206132 ?auto_206133 ?auto_206134 ?auto_206135 ?auto_206136 ?auto_206137 ?auto_206139 ?auto_206138 )
      ( MAKE-6PILE ?auto_206132 ?auto_206133 ?auto_206134 ?auto_206135 ?auto_206136 ?auto_206137 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_206140 - BLOCK
      ?auto_206141 - BLOCK
      ?auto_206142 - BLOCK
      ?auto_206143 - BLOCK
      ?auto_206144 - BLOCK
      ?auto_206145 - BLOCK
    )
    :vars
    (
      ?auto_206146 - BLOCK
      ?auto_206147 - BLOCK
      ?auto_206148 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206146 ?auto_206145 ) ( ON-TABLE ?auto_206140 ) ( ON ?auto_206141 ?auto_206140 ) ( ON ?auto_206142 ?auto_206141 ) ( ON ?auto_206143 ?auto_206142 ) ( ON ?auto_206144 ?auto_206143 ) ( ON ?auto_206145 ?auto_206144 ) ( not ( = ?auto_206140 ?auto_206141 ) ) ( not ( = ?auto_206140 ?auto_206142 ) ) ( not ( = ?auto_206140 ?auto_206143 ) ) ( not ( = ?auto_206140 ?auto_206144 ) ) ( not ( = ?auto_206140 ?auto_206145 ) ) ( not ( = ?auto_206140 ?auto_206146 ) ) ( not ( = ?auto_206141 ?auto_206142 ) ) ( not ( = ?auto_206141 ?auto_206143 ) ) ( not ( = ?auto_206141 ?auto_206144 ) ) ( not ( = ?auto_206141 ?auto_206145 ) ) ( not ( = ?auto_206141 ?auto_206146 ) ) ( not ( = ?auto_206142 ?auto_206143 ) ) ( not ( = ?auto_206142 ?auto_206144 ) ) ( not ( = ?auto_206142 ?auto_206145 ) ) ( not ( = ?auto_206142 ?auto_206146 ) ) ( not ( = ?auto_206143 ?auto_206144 ) ) ( not ( = ?auto_206143 ?auto_206145 ) ) ( not ( = ?auto_206143 ?auto_206146 ) ) ( not ( = ?auto_206144 ?auto_206145 ) ) ( not ( = ?auto_206144 ?auto_206146 ) ) ( not ( = ?auto_206145 ?auto_206146 ) ) ( not ( = ?auto_206140 ?auto_206147 ) ) ( not ( = ?auto_206141 ?auto_206147 ) ) ( not ( = ?auto_206142 ?auto_206147 ) ) ( not ( = ?auto_206143 ?auto_206147 ) ) ( not ( = ?auto_206144 ?auto_206147 ) ) ( not ( = ?auto_206145 ?auto_206147 ) ) ( not ( = ?auto_206146 ?auto_206147 ) ) ( CLEAR ?auto_206146 ) ( ON ?auto_206147 ?auto_206148 ) ( CLEAR ?auto_206147 ) ( HAND-EMPTY ) ( not ( = ?auto_206140 ?auto_206148 ) ) ( not ( = ?auto_206141 ?auto_206148 ) ) ( not ( = ?auto_206142 ?auto_206148 ) ) ( not ( = ?auto_206143 ?auto_206148 ) ) ( not ( = ?auto_206144 ?auto_206148 ) ) ( not ( = ?auto_206145 ?auto_206148 ) ) ( not ( = ?auto_206146 ?auto_206148 ) ) ( not ( = ?auto_206147 ?auto_206148 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_206147 ?auto_206148 )
      ( MAKE-6PILE ?auto_206140 ?auto_206141 ?auto_206142 ?auto_206143 ?auto_206144 ?auto_206145 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_206167 - BLOCK
      ?auto_206168 - BLOCK
      ?auto_206169 - BLOCK
      ?auto_206170 - BLOCK
      ?auto_206171 - BLOCK
      ?auto_206172 - BLOCK
    )
    :vars
    (
      ?auto_206175 - BLOCK
      ?auto_206174 - BLOCK
      ?auto_206173 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_206167 ) ( ON ?auto_206168 ?auto_206167 ) ( ON ?auto_206169 ?auto_206168 ) ( ON ?auto_206170 ?auto_206169 ) ( ON ?auto_206171 ?auto_206170 ) ( not ( = ?auto_206167 ?auto_206168 ) ) ( not ( = ?auto_206167 ?auto_206169 ) ) ( not ( = ?auto_206167 ?auto_206170 ) ) ( not ( = ?auto_206167 ?auto_206171 ) ) ( not ( = ?auto_206167 ?auto_206172 ) ) ( not ( = ?auto_206167 ?auto_206175 ) ) ( not ( = ?auto_206168 ?auto_206169 ) ) ( not ( = ?auto_206168 ?auto_206170 ) ) ( not ( = ?auto_206168 ?auto_206171 ) ) ( not ( = ?auto_206168 ?auto_206172 ) ) ( not ( = ?auto_206168 ?auto_206175 ) ) ( not ( = ?auto_206169 ?auto_206170 ) ) ( not ( = ?auto_206169 ?auto_206171 ) ) ( not ( = ?auto_206169 ?auto_206172 ) ) ( not ( = ?auto_206169 ?auto_206175 ) ) ( not ( = ?auto_206170 ?auto_206171 ) ) ( not ( = ?auto_206170 ?auto_206172 ) ) ( not ( = ?auto_206170 ?auto_206175 ) ) ( not ( = ?auto_206171 ?auto_206172 ) ) ( not ( = ?auto_206171 ?auto_206175 ) ) ( not ( = ?auto_206172 ?auto_206175 ) ) ( not ( = ?auto_206167 ?auto_206174 ) ) ( not ( = ?auto_206168 ?auto_206174 ) ) ( not ( = ?auto_206169 ?auto_206174 ) ) ( not ( = ?auto_206170 ?auto_206174 ) ) ( not ( = ?auto_206171 ?auto_206174 ) ) ( not ( = ?auto_206172 ?auto_206174 ) ) ( not ( = ?auto_206175 ?auto_206174 ) ) ( ON ?auto_206174 ?auto_206173 ) ( not ( = ?auto_206167 ?auto_206173 ) ) ( not ( = ?auto_206168 ?auto_206173 ) ) ( not ( = ?auto_206169 ?auto_206173 ) ) ( not ( = ?auto_206170 ?auto_206173 ) ) ( not ( = ?auto_206171 ?auto_206173 ) ) ( not ( = ?auto_206172 ?auto_206173 ) ) ( not ( = ?auto_206175 ?auto_206173 ) ) ( not ( = ?auto_206174 ?auto_206173 ) ) ( ON ?auto_206175 ?auto_206174 ) ( CLEAR ?auto_206175 ) ( HOLDING ?auto_206172 ) ( CLEAR ?auto_206171 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_206167 ?auto_206168 ?auto_206169 ?auto_206170 ?auto_206171 ?auto_206172 ?auto_206175 )
      ( MAKE-6PILE ?auto_206167 ?auto_206168 ?auto_206169 ?auto_206170 ?auto_206171 ?auto_206172 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_206176 - BLOCK
      ?auto_206177 - BLOCK
      ?auto_206178 - BLOCK
      ?auto_206179 - BLOCK
      ?auto_206180 - BLOCK
      ?auto_206181 - BLOCK
    )
    :vars
    (
      ?auto_206183 - BLOCK
      ?auto_206184 - BLOCK
      ?auto_206182 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_206176 ) ( ON ?auto_206177 ?auto_206176 ) ( ON ?auto_206178 ?auto_206177 ) ( ON ?auto_206179 ?auto_206178 ) ( ON ?auto_206180 ?auto_206179 ) ( not ( = ?auto_206176 ?auto_206177 ) ) ( not ( = ?auto_206176 ?auto_206178 ) ) ( not ( = ?auto_206176 ?auto_206179 ) ) ( not ( = ?auto_206176 ?auto_206180 ) ) ( not ( = ?auto_206176 ?auto_206181 ) ) ( not ( = ?auto_206176 ?auto_206183 ) ) ( not ( = ?auto_206177 ?auto_206178 ) ) ( not ( = ?auto_206177 ?auto_206179 ) ) ( not ( = ?auto_206177 ?auto_206180 ) ) ( not ( = ?auto_206177 ?auto_206181 ) ) ( not ( = ?auto_206177 ?auto_206183 ) ) ( not ( = ?auto_206178 ?auto_206179 ) ) ( not ( = ?auto_206178 ?auto_206180 ) ) ( not ( = ?auto_206178 ?auto_206181 ) ) ( not ( = ?auto_206178 ?auto_206183 ) ) ( not ( = ?auto_206179 ?auto_206180 ) ) ( not ( = ?auto_206179 ?auto_206181 ) ) ( not ( = ?auto_206179 ?auto_206183 ) ) ( not ( = ?auto_206180 ?auto_206181 ) ) ( not ( = ?auto_206180 ?auto_206183 ) ) ( not ( = ?auto_206181 ?auto_206183 ) ) ( not ( = ?auto_206176 ?auto_206184 ) ) ( not ( = ?auto_206177 ?auto_206184 ) ) ( not ( = ?auto_206178 ?auto_206184 ) ) ( not ( = ?auto_206179 ?auto_206184 ) ) ( not ( = ?auto_206180 ?auto_206184 ) ) ( not ( = ?auto_206181 ?auto_206184 ) ) ( not ( = ?auto_206183 ?auto_206184 ) ) ( ON ?auto_206184 ?auto_206182 ) ( not ( = ?auto_206176 ?auto_206182 ) ) ( not ( = ?auto_206177 ?auto_206182 ) ) ( not ( = ?auto_206178 ?auto_206182 ) ) ( not ( = ?auto_206179 ?auto_206182 ) ) ( not ( = ?auto_206180 ?auto_206182 ) ) ( not ( = ?auto_206181 ?auto_206182 ) ) ( not ( = ?auto_206183 ?auto_206182 ) ) ( not ( = ?auto_206184 ?auto_206182 ) ) ( ON ?auto_206183 ?auto_206184 ) ( CLEAR ?auto_206180 ) ( ON ?auto_206181 ?auto_206183 ) ( CLEAR ?auto_206181 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_206182 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_206182 ?auto_206184 ?auto_206183 )
      ( MAKE-6PILE ?auto_206176 ?auto_206177 ?auto_206178 ?auto_206179 ?auto_206180 ?auto_206181 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_206185 - BLOCK
      ?auto_206186 - BLOCK
      ?auto_206187 - BLOCK
      ?auto_206188 - BLOCK
      ?auto_206189 - BLOCK
      ?auto_206190 - BLOCK
    )
    :vars
    (
      ?auto_206191 - BLOCK
      ?auto_206192 - BLOCK
      ?auto_206193 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_206185 ) ( ON ?auto_206186 ?auto_206185 ) ( ON ?auto_206187 ?auto_206186 ) ( ON ?auto_206188 ?auto_206187 ) ( not ( = ?auto_206185 ?auto_206186 ) ) ( not ( = ?auto_206185 ?auto_206187 ) ) ( not ( = ?auto_206185 ?auto_206188 ) ) ( not ( = ?auto_206185 ?auto_206189 ) ) ( not ( = ?auto_206185 ?auto_206190 ) ) ( not ( = ?auto_206185 ?auto_206191 ) ) ( not ( = ?auto_206186 ?auto_206187 ) ) ( not ( = ?auto_206186 ?auto_206188 ) ) ( not ( = ?auto_206186 ?auto_206189 ) ) ( not ( = ?auto_206186 ?auto_206190 ) ) ( not ( = ?auto_206186 ?auto_206191 ) ) ( not ( = ?auto_206187 ?auto_206188 ) ) ( not ( = ?auto_206187 ?auto_206189 ) ) ( not ( = ?auto_206187 ?auto_206190 ) ) ( not ( = ?auto_206187 ?auto_206191 ) ) ( not ( = ?auto_206188 ?auto_206189 ) ) ( not ( = ?auto_206188 ?auto_206190 ) ) ( not ( = ?auto_206188 ?auto_206191 ) ) ( not ( = ?auto_206189 ?auto_206190 ) ) ( not ( = ?auto_206189 ?auto_206191 ) ) ( not ( = ?auto_206190 ?auto_206191 ) ) ( not ( = ?auto_206185 ?auto_206192 ) ) ( not ( = ?auto_206186 ?auto_206192 ) ) ( not ( = ?auto_206187 ?auto_206192 ) ) ( not ( = ?auto_206188 ?auto_206192 ) ) ( not ( = ?auto_206189 ?auto_206192 ) ) ( not ( = ?auto_206190 ?auto_206192 ) ) ( not ( = ?auto_206191 ?auto_206192 ) ) ( ON ?auto_206192 ?auto_206193 ) ( not ( = ?auto_206185 ?auto_206193 ) ) ( not ( = ?auto_206186 ?auto_206193 ) ) ( not ( = ?auto_206187 ?auto_206193 ) ) ( not ( = ?auto_206188 ?auto_206193 ) ) ( not ( = ?auto_206189 ?auto_206193 ) ) ( not ( = ?auto_206190 ?auto_206193 ) ) ( not ( = ?auto_206191 ?auto_206193 ) ) ( not ( = ?auto_206192 ?auto_206193 ) ) ( ON ?auto_206191 ?auto_206192 ) ( ON ?auto_206190 ?auto_206191 ) ( CLEAR ?auto_206190 ) ( ON-TABLE ?auto_206193 ) ( HOLDING ?auto_206189 ) ( CLEAR ?auto_206188 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_206185 ?auto_206186 ?auto_206187 ?auto_206188 ?auto_206189 )
      ( MAKE-6PILE ?auto_206185 ?auto_206186 ?auto_206187 ?auto_206188 ?auto_206189 ?auto_206190 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_206194 - BLOCK
      ?auto_206195 - BLOCK
      ?auto_206196 - BLOCK
      ?auto_206197 - BLOCK
      ?auto_206198 - BLOCK
      ?auto_206199 - BLOCK
    )
    :vars
    (
      ?auto_206200 - BLOCK
      ?auto_206202 - BLOCK
      ?auto_206201 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_206194 ) ( ON ?auto_206195 ?auto_206194 ) ( ON ?auto_206196 ?auto_206195 ) ( ON ?auto_206197 ?auto_206196 ) ( not ( = ?auto_206194 ?auto_206195 ) ) ( not ( = ?auto_206194 ?auto_206196 ) ) ( not ( = ?auto_206194 ?auto_206197 ) ) ( not ( = ?auto_206194 ?auto_206198 ) ) ( not ( = ?auto_206194 ?auto_206199 ) ) ( not ( = ?auto_206194 ?auto_206200 ) ) ( not ( = ?auto_206195 ?auto_206196 ) ) ( not ( = ?auto_206195 ?auto_206197 ) ) ( not ( = ?auto_206195 ?auto_206198 ) ) ( not ( = ?auto_206195 ?auto_206199 ) ) ( not ( = ?auto_206195 ?auto_206200 ) ) ( not ( = ?auto_206196 ?auto_206197 ) ) ( not ( = ?auto_206196 ?auto_206198 ) ) ( not ( = ?auto_206196 ?auto_206199 ) ) ( not ( = ?auto_206196 ?auto_206200 ) ) ( not ( = ?auto_206197 ?auto_206198 ) ) ( not ( = ?auto_206197 ?auto_206199 ) ) ( not ( = ?auto_206197 ?auto_206200 ) ) ( not ( = ?auto_206198 ?auto_206199 ) ) ( not ( = ?auto_206198 ?auto_206200 ) ) ( not ( = ?auto_206199 ?auto_206200 ) ) ( not ( = ?auto_206194 ?auto_206202 ) ) ( not ( = ?auto_206195 ?auto_206202 ) ) ( not ( = ?auto_206196 ?auto_206202 ) ) ( not ( = ?auto_206197 ?auto_206202 ) ) ( not ( = ?auto_206198 ?auto_206202 ) ) ( not ( = ?auto_206199 ?auto_206202 ) ) ( not ( = ?auto_206200 ?auto_206202 ) ) ( ON ?auto_206202 ?auto_206201 ) ( not ( = ?auto_206194 ?auto_206201 ) ) ( not ( = ?auto_206195 ?auto_206201 ) ) ( not ( = ?auto_206196 ?auto_206201 ) ) ( not ( = ?auto_206197 ?auto_206201 ) ) ( not ( = ?auto_206198 ?auto_206201 ) ) ( not ( = ?auto_206199 ?auto_206201 ) ) ( not ( = ?auto_206200 ?auto_206201 ) ) ( not ( = ?auto_206202 ?auto_206201 ) ) ( ON ?auto_206200 ?auto_206202 ) ( ON ?auto_206199 ?auto_206200 ) ( ON-TABLE ?auto_206201 ) ( CLEAR ?auto_206197 ) ( ON ?auto_206198 ?auto_206199 ) ( CLEAR ?auto_206198 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_206201 ?auto_206202 ?auto_206200 ?auto_206199 )
      ( MAKE-6PILE ?auto_206194 ?auto_206195 ?auto_206196 ?auto_206197 ?auto_206198 ?auto_206199 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_206203 - BLOCK
      ?auto_206204 - BLOCK
      ?auto_206205 - BLOCK
      ?auto_206206 - BLOCK
      ?auto_206207 - BLOCK
      ?auto_206208 - BLOCK
    )
    :vars
    (
      ?auto_206210 - BLOCK
      ?auto_206209 - BLOCK
      ?auto_206211 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_206203 ) ( ON ?auto_206204 ?auto_206203 ) ( ON ?auto_206205 ?auto_206204 ) ( not ( = ?auto_206203 ?auto_206204 ) ) ( not ( = ?auto_206203 ?auto_206205 ) ) ( not ( = ?auto_206203 ?auto_206206 ) ) ( not ( = ?auto_206203 ?auto_206207 ) ) ( not ( = ?auto_206203 ?auto_206208 ) ) ( not ( = ?auto_206203 ?auto_206210 ) ) ( not ( = ?auto_206204 ?auto_206205 ) ) ( not ( = ?auto_206204 ?auto_206206 ) ) ( not ( = ?auto_206204 ?auto_206207 ) ) ( not ( = ?auto_206204 ?auto_206208 ) ) ( not ( = ?auto_206204 ?auto_206210 ) ) ( not ( = ?auto_206205 ?auto_206206 ) ) ( not ( = ?auto_206205 ?auto_206207 ) ) ( not ( = ?auto_206205 ?auto_206208 ) ) ( not ( = ?auto_206205 ?auto_206210 ) ) ( not ( = ?auto_206206 ?auto_206207 ) ) ( not ( = ?auto_206206 ?auto_206208 ) ) ( not ( = ?auto_206206 ?auto_206210 ) ) ( not ( = ?auto_206207 ?auto_206208 ) ) ( not ( = ?auto_206207 ?auto_206210 ) ) ( not ( = ?auto_206208 ?auto_206210 ) ) ( not ( = ?auto_206203 ?auto_206209 ) ) ( not ( = ?auto_206204 ?auto_206209 ) ) ( not ( = ?auto_206205 ?auto_206209 ) ) ( not ( = ?auto_206206 ?auto_206209 ) ) ( not ( = ?auto_206207 ?auto_206209 ) ) ( not ( = ?auto_206208 ?auto_206209 ) ) ( not ( = ?auto_206210 ?auto_206209 ) ) ( ON ?auto_206209 ?auto_206211 ) ( not ( = ?auto_206203 ?auto_206211 ) ) ( not ( = ?auto_206204 ?auto_206211 ) ) ( not ( = ?auto_206205 ?auto_206211 ) ) ( not ( = ?auto_206206 ?auto_206211 ) ) ( not ( = ?auto_206207 ?auto_206211 ) ) ( not ( = ?auto_206208 ?auto_206211 ) ) ( not ( = ?auto_206210 ?auto_206211 ) ) ( not ( = ?auto_206209 ?auto_206211 ) ) ( ON ?auto_206210 ?auto_206209 ) ( ON ?auto_206208 ?auto_206210 ) ( ON-TABLE ?auto_206211 ) ( ON ?auto_206207 ?auto_206208 ) ( CLEAR ?auto_206207 ) ( HOLDING ?auto_206206 ) ( CLEAR ?auto_206205 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_206203 ?auto_206204 ?auto_206205 ?auto_206206 )
      ( MAKE-6PILE ?auto_206203 ?auto_206204 ?auto_206205 ?auto_206206 ?auto_206207 ?auto_206208 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_206212 - BLOCK
      ?auto_206213 - BLOCK
      ?auto_206214 - BLOCK
      ?auto_206215 - BLOCK
      ?auto_206216 - BLOCK
      ?auto_206217 - BLOCK
    )
    :vars
    (
      ?auto_206218 - BLOCK
      ?auto_206219 - BLOCK
      ?auto_206220 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_206212 ) ( ON ?auto_206213 ?auto_206212 ) ( ON ?auto_206214 ?auto_206213 ) ( not ( = ?auto_206212 ?auto_206213 ) ) ( not ( = ?auto_206212 ?auto_206214 ) ) ( not ( = ?auto_206212 ?auto_206215 ) ) ( not ( = ?auto_206212 ?auto_206216 ) ) ( not ( = ?auto_206212 ?auto_206217 ) ) ( not ( = ?auto_206212 ?auto_206218 ) ) ( not ( = ?auto_206213 ?auto_206214 ) ) ( not ( = ?auto_206213 ?auto_206215 ) ) ( not ( = ?auto_206213 ?auto_206216 ) ) ( not ( = ?auto_206213 ?auto_206217 ) ) ( not ( = ?auto_206213 ?auto_206218 ) ) ( not ( = ?auto_206214 ?auto_206215 ) ) ( not ( = ?auto_206214 ?auto_206216 ) ) ( not ( = ?auto_206214 ?auto_206217 ) ) ( not ( = ?auto_206214 ?auto_206218 ) ) ( not ( = ?auto_206215 ?auto_206216 ) ) ( not ( = ?auto_206215 ?auto_206217 ) ) ( not ( = ?auto_206215 ?auto_206218 ) ) ( not ( = ?auto_206216 ?auto_206217 ) ) ( not ( = ?auto_206216 ?auto_206218 ) ) ( not ( = ?auto_206217 ?auto_206218 ) ) ( not ( = ?auto_206212 ?auto_206219 ) ) ( not ( = ?auto_206213 ?auto_206219 ) ) ( not ( = ?auto_206214 ?auto_206219 ) ) ( not ( = ?auto_206215 ?auto_206219 ) ) ( not ( = ?auto_206216 ?auto_206219 ) ) ( not ( = ?auto_206217 ?auto_206219 ) ) ( not ( = ?auto_206218 ?auto_206219 ) ) ( ON ?auto_206219 ?auto_206220 ) ( not ( = ?auto_206212 ?auto_206220 ) ) ( not ( = ?auto_206213 ?auto_206220 ) ) ( not ( = ?auto_206214 ?auto_206220 ) ) ( not ( = ?auto_206215 ?auto_206220 ) ) ( not ( = ?auto_206216 ?auto_206220 ) ) ( not ( = ?auto_206217 ?auto_206220 ) ) ( not ( = ?auto_206218 ?auto_206220 ) ) ( not ( = ?auto_206219 ?auto_206220 ) ) ( ON ?auto_206218 ?auto_206219 ) ( ON ?auto_206217 ?auto_206218 ) ( ON-TABLE ?auto_206220 ) ( ON ?auto_206216 ?auto_206217 ) ( CLEAR ?auto_206214 ) ( ON ?auto_206215 ?auto_206216 ) ( CLEAR ?auto_206215 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_206220 ?auto_206219 ?auto_206218 ?auto_206217 ?auto_206216 )
      ( MAKE-6PILE ?auto_206212 ?auto_206213 ?auto_206214 ?auto_206215 ?auto_206216 ?auto_206217 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_206221 - BLOCK
      ?auto_206222 - BLOCK
      ?auto_206223 - BLOCK
      ?auto_206224 - BLOCK
      ?auto_206225 - BLOCK
      ?auto_206226 - BLOCK
    )
    :vars
    (
      ?auto_206227 - BLOCK
      ?auto_206229 - BLOCK
      ?auto_206228 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_206221 ) ( ON ?auto_206222 ?auto_206221 ) ( not ( = ?auto_206221 ?auto_206222 ) ) ( not ( = ?auto_206221 ?auto_206223 ) ) ( not ( = ?auto_206221 ?auto_206224 ) ) ( not ( = ?auto_206221 ?auto_206225 ) ) ( not ( = ?auto_206221 ?auto_206226 ) ) ( not ( = ?auto_206221 ?auto_206227 ) ) ( not ( = ?auto_206222 ?auto_206223 ) ) ( not ( = ?auto_206222 ?auto_206224 ) ) ( not ( = ?auto_206222 ?auto_206225 ) ) ( not ( = ?auto_206222 ?auto_206226 ) ) ( not ( = ?auto_206222 ?auto_206227 ) ) ( not ( = ?auto_206223 ?auto_206224 ) ) ( not ( = ?auto_206223 ?auto_206225 ) ) ( not ( = ?auto_206223 ?auto_206226 ) ) ( not ( = ?auto_206223 ?auto_206227 ) ) ( not ( = ?auto_206224 ?auto_206225 ) ) ( not ( = ?auto_206224 ?auto_206226 ) ) ( not ( = ?auto_206224 ?auto_206227 ) ) ( not ( = ?auto_206225 ?auto_206226 ) ) ( not ( = ?auto_206225 ?auto_206227 ) ) ( not ( = ?auto_206226 ?auto_206227 ) ) ( not ( = ?auto_206221 ?auto_206229 ) ) ( not ( = ?auto_206222 ?auto_206229 ) ) ( not ( = ?auto_206223 ?auto_206229 ) ) ( not ( = ?auto_206224 ?auto_206229 ) ) ( not ( = ?auto_206225 ?auto_206229 ) ) ( not ( = ?auto_206226 ?auto_206229 ) ) ( not ( = ?auto_206227 ?auto_206229 ) ) ( ON ?auto_206229 ?auto_206228 ) ( not ( = ?auto_206221 ?auto_206228 ) ) ( not ( = ?auto_206222 ?auto_206228 ) ) ( not ( = ?auto_206223 ?auto_206228 ) ) ( not ( = ?auto_206224 ?auto_206228 ) ) ( not ( = ?auto_206225 ?auto_206228 ) ) ( not ( = ?auto_206226 ?auto_206228 ) ) ( not ( = ?auto_206227 ?auto_206228 ) ) ( not ( = ?auto_206229 ?auto_206228 ) ) ( ON ?auto_206227 ?auto_206229 ) ( ON ?auto_206226 ?auto_206227 ) ( ON-TABLE ?auto_206228 ) ( ON ?auto_206225 ?auto_206226 ) ( ON ?auto_206224 ?auto_206225 ) ( CLEAR ?auto_206224 ) ( HOLDING ?auto_206223 ) ( CLEAR ?auto_206222 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_206221 ?auto_206222 ?auto_206223 )
      ( MAKE-6PILE ?auto_206221 ?auto_206222 ?auto_206223 ?auto_206224 ?auto_206225 ?auto_206226 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_206230 - BLOCK
      ?auto_206231 - BLOCK
      ?auto_206232 - BLOCK
      ?auto_206233 - BLOCK
      ?auto_206234 - BLOCK
      ?auto_206235 - BLOCK
    )
    :vars
    (
      ?auto_206238 - BLOCK
      ?auto_206236 - BLOCK
      ?auto_206237 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_206230 ) ( ON ?auto_206231 ?auto_206230 ) ( not ( = ?auto_206230 ?auto_206231 ) ) ( not ( = ?auto_206230 ?auto_206232 ) ) ( not ( = ?auto_206230 ?auto_206233 ) ) ( not ( = ?auto_206230 ?auto_206234 ) ) ( not ( = ?auto_206230 ?auto_206235 ) ) ( not ( = ?auto_206230 ?auto_206238 ) ) ( not ( = ?auto_206231 ?auto_206232 ) ) ( not ( = ?auto_206231 ?auto_206233 ) ) ( not ( = ?auto_206231 ?auto_206234 ) ) ( not ( = ?auto_206231 ?auto_206235 ) ) ( not ( = ?auto_206231 ?auto_206238 ) ) ( not ( = ?auto_206232 ?auto_206233 ) ) ( not ( = ?auto_206232 ?auto_206234 ) ) ( not ( = ?auto_206232 ?auto_206235 ) ) ( not ( = ?auto_206232 ?auto_206238 ) ) ( not ( = ?auto_206233 ?auto_206234 ) ) ( not ( = ?auto_206233 ?auto_206235 ) ) ( not ( = ?auto_206233 ?auto_206238 ) ) ( not ( = ?auto_206234 ?auto_206235 ) ) ( not ( = ?auto_206234 ?auto_206238 ) ) ( not ( = ?auto_206235 ?auto_206238 ) ) ( not ( = ?auto_206230 ?auto_206236 ) ) ( not ( = ?auto_206231 ?auto_206236 ) ) ( not ( = ?auto_206232 ?auto_206236 ) ) ( not ( = ?auto_206233 ?auto_206236 ) ) ( not ( = ?auto_206234 ?auto_206236 ) ) ( not ( = ?auto_206235 ?auto_206236 ) ) ( not ( = ?auto_206238 ?auto_206236 ) ) ( ON ?auto_206236 ?auto_206237 ) ( not ( = ?auto_206230 ?auto_206237 ) ) ( not ( = ?auto_206231 ?auto_206237 ) ) ( not ( = ?auto_206232 ?auto_206237 ) ) ( not ( = ?auto_206233 ?auto_206237 ) ) ( not ( = ?auto_206234 ?auto_206237 ) ) ( not ( = ?auto_206235 ?auto_206237 ) ) ( not ( = ?auto_206238 ?auto_206237 ) ) ( not ( = ?auto_206236 ?auto_206237 ) ) ( ON ?auto_206238 ?auto_206236 ) ( ON ?auto_206235 ?auto_206238 ) ( ON-TABLE ?auto_206237 ) ( ON ?auto_206234 ?auto_206235 ) ( ON ?auto_206233 ?auto_206234 ) ( CLEAR ?auto_206231 ) ( ON ?auto_206232 ?auto_206233 ) ( CLEAR ?auto_206232 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_206237 ?auto_206236 ?auto_206238 ?auto_206235 ?auto_206234 ?auto_206233 )
      ( MAKE-6PILE ?auto_206230 ?auto_206231 ?auto_206232 ?auto_206233 ?auto_206234 ?auto_206235 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_206239 - BLOCK
      ?auto_206240 - BLOCK
      ?auto_206241 - BLOCK
      ?auto_206242 - BLOCK
      ?auto_206243 - BLOCK
      ?auto_206244 - BLOCK
    )
    :vars
    (
      ?auto_206246 - BLOCK
      ?auto_206247 - BLOCK
      ?auto_206245 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_206239 ) ( not ( = ?auto_206239 ?auto_206240 ) ) ( not ( = ?auto_206239 ?auto_206241 ) ) ( not ( = ?auto_206239 ?auto_206242 ) ) ( not ( = ?auto_206239 ?auto_206243 ) ) ( not ( = ?auto_206239 ?auto_206244 ) ) ( not ( = ?auto_206239 ?auto_206246 ) ) ( not ( = ?auto_206240 ?auto_206241 ) ) ( not ( = ?auto_206240 ?auto_206242 ) ) ( not ( = ?auto_206240 ?auto_206243 ) ) ( not ( = ?auto_206240 ?auto_206244 ) ) ( not ( = ?auto_206240 ?auto_206246 ) ) ( not ( = ?auto_206241 ?auto_206242 ) ) ( not ( = ?auto_206241 ?auto_206243 ) ) ( not ( = ?auto_206241 ?auto_206244 ) ) ( not ( = ?auto_206241 ?auto_206246 ) ) ( not ( = ?auto_206242 ?auto_206243 ) ) ( not ( = ?auto_206242 ?auto_206244 ) ) ( not ( = ?auto_206242 ?auto_206246 ) ) ( not ( = ?auto_206243 ?auto_206244 ) ) ( not ( = ?auto_206243 ?auto_206246 ) ) ( not ( = ?auto_206244 ?auto_206246 ) ) ( not ( = ?auto_206239 ?auto_206247 ) ) ( not ( = ?auto_206240 ?auto_206247 ) ) ( not ( = ?auto_206241 ?auto_206247 ) ) ( not ( = ?auto_206242 ?auto_206247 ) ) ( not ( = ?auto_206243 ?auto_206247 ) ) ( not ( = ?auto_206244 ?auto_206247 ) ) ( not ( = ?auto_206246 ?auto_206247 ) ) ( ON ?auto_206247 ?auto_206245 ) ( not ( = ?auto_206239 ?auto_206245 ) ) ( not ( = ?auto_206240 ?auto_206245 ) ) ( not ( = ?auto_206241 ?auto_206245 ) ) ( not ( = ?auto_206242 ?auto_206245 ) ) ( not ( = ?auto_206243 ?auto_206245 ) ) ( not ( = ?auto_206244 ?auto_206245 ) ) ( not ( = ?auto_206246 ?auto_206245 ) ) ( not ( = ?auto_206247 ?auto_206245 ) ) ( ON ?auto_206246 ?auto_206247 ) ( ON ?auto_206244 ?auto_206246 ) ( ON-TABLE ?auto_206245 ) ( ON ?auto_206243 ?auto_206244 ) ( ON ?auto_206242 ?auto_206243 ) ( ON ?auto_206241 ?auto_206242 ) ( CLEAR ?auto_206241 ) ( HOLDING ?auto_206240 ) ( CLEAR ?auto_206239 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_206239 ?auto_206240 )
      ( MAKE-6PILE ?auto_206239 ?auto_206240 ?auto_206241 ?auto_206242 ?auto_206243 ?auto_206244 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_206248 - BLOCK
      ?auto_206249 - BLOCK
      ?auto_206250 - BLOCK
      ?auto_206251 - BLOCK
      ?auto_206252 - BLOCK
      ?auto_206253 - BLOCK
    )
    :vars
    (
      ?auto_206254 - BLOCK
      ?auto_206256 - BLOCK
      ?auto_206255 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_206248 ) ( not ( = ?auto_206248 ?auto_206249 ) ) ( not ( = ?auto_206248 ?auto_206250 ) ) ( not ( = ?auto_206248 ?auto_206251 ) ) ( not ( = ?auto_206248 ?auto_206252 ) ) ( not ( = ?auto_206248 ?auto_206253 ) ) ( not ( = ?auto_206248 ?auto_206254 ) ) ( not ( = ?auto_206249 ?auto_206250 ) ) ( not ( = ?auto_206249 ?auto_206251 ) ) ( not ( = ?auto_206249 ?auto_206252 ) ) ( not ( = ?auto_206249 ?auto_206253 ) ) ( not ( = ?auto_206249 ?auto_206254 ) ) ( not ( = ?auto_206250 ?auto_206251 ) ) ( not ( = ?auto_206250 ?auto_206252 ) ) ( not ( = ?auto_206250 ?auto_206253 ) ) ( not ( = ?auto_206250 ?auto_206254 ) ) ( not ( = ?auto_206251 ?auto_206252 ) ) ( not ( = ?auto_206251 ?auto_206253 ) ) ( not ( = ?auto_206251 ?auto_206254 ) ) ( not ( = ?auto_206252 ?auto_206253 ) ) ( not ( = ?auto_206252 ?auto_206254 ) ) ( not ( = ?auto_206253 ?auto_206254 ) ) ( not ( = ?auto_206248 ?auto_206256 ) ) ( not ( = ?auto_206249 ?auto_206256 ) ) ( not ( = ?auto_206250 ?auto_206256 ) ) ( not ( = ?auto_206251 ?auto_206256 ) ) ( not ( = ?auto_206252 ?auto_206256 ) ) ( not ( = ?auto_206253 ?auto_206256 ) ) ( not ( = ?auto_206254 ?auto_206256 ) ) ( ON ?auto_206256 ?auto_206255 ) ( not ( = ?auto_206248 ?auto_206255 ) ) ( not ( = ?auto_206249 ?auto_206255 ) ) ( not ( = ?auto_206250 ?auto_206255 ) ) ( not ( = ?auto_206251 ?auto_206255 ) ) ( not ( = ?auto_206252 ?auto_206255 ) ) ( not ( = ?auto_206253 ?auto_206255 ) ) ( not ( = ?auto_206254 ?auto_206255 ) ) ( not ( = ?auto_206256 ?auto_206255 ) ) ( ON ?auto_206254 ?auto_206256 ) ( ON ?auto_206253 ?auto_206254 ) ( ON-TABLE ?auto_206255 ) ( ON ?auto_206252 ?auto_206253 ) ( ON ?auto_206251 ?auto_206252 ) ( ON ?auto_206250 ?auto_206251 ) ( CLEAR ?auto_206248 ) ( ON ?auto_206249 ?auto_206250 ) ( CLEAR ?auto_206249 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_206255 ?auto_206256 ?auto_206254 ?auto_206253 ?auto_206252 ?auto_206251 ?auto_206250 )
      ( MAKE-6PILE ?auto_206248 ?auto_206249 ?auto_206250 ?auto_206251 ?auto_206252 ?auto_206253 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_206257 - BLOCK
      ?auto_206258 - BLOCK
      ?auto_206259 - BLOCK
      ?auto_206260 - BLOCK
      ?auto_206261 - BLOCK
      ?auto_206262 - BLOCK
    )
    :vars
    (
      ?auto_206263 - BLOCK
      ?auto_206265 - BLOCK
      ?auto_206264 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_206257 ?auto_206258 ) ) ( not ( = ?auto_206257 ?auto_206259 ) ) ( not ( = ?auto_206257 ?auto_206260 ) ) ( not ( = ?auto_206257 ?auto_206261 ) ) ( not ( = ?auto_206257 ?auto_206262 ) ) ( not ( = ?auto_206257 ?auto_206263 ) ) ( not ( = ?auto_206258 ?auto_206259 ) ) ( not ( = ?auto_206258 ?auto_206260 ) ) ( not ( = ?auto_206258 ?auto_206261 ) ) ( not ( = ?auto_206258 ?auto_206262 ) ) ( not ( = ?auto_206258 ?auto_206263 ) ) ( not ( = ?auto_206259 ?auto_206260 ) ) ( not ( = ?auto_206259 ?auto_206261 ) ) ( not ( = ?auto_206259 ?auto_206262 ) ) ( not ( = ?auto_206259 ?auto_206263 ) ) ( not ( = ?auto_206260 ?auto_206261 ) ) ( not ( = ?auto_206260 ?auto_206262 ) ) ( not ( = ?auto_206260 ?auto_206263 ) ) ( not ( = ?auto_206261 ?auto_206262 ) ) ( not ( = ?auto_206261 ?auto_206263 ) ) ( not ( = ?auto_206262 ?auto_206263 ) ) ( not ( = ?auto_206257 ?auto_206265 ) ) ( not ( = ?auto_206258 ?auto_206265 ) ) ( not ( = ?auto_206259 ?auto_206265 ) ) ( not ( = ?auto_206260 ?auto_206265 ) ) ( not ( = ?auto_206261 ?auto_206265 ) ) ( not ( = ?auto_206262 ?auto_206265 ) ) ( not ( = ?auto_206263 ?auto_206265 ) ) ( ON ?auto_206265 ?auto_206264 ) ( not ( = ?auto_206257 ?auto_206264 ) ) ( not ( = ?auto_206258 ?auto_206264 ) ) ( not ( = ?auto_206259 ?auto_206264 ) ) ( not ( = ?auto_206260 ?auto_206264 ) ) ( not ( = ?auto_206261 ?auto_206264 ) ) ( not ( = ?auto_206262 ?auto_206264 ) ) ( not ( = ?auto_206263 ?auto_206264 ) ) ( not ( = ?auto_206265 ?auto_206264 ) ) ( ON ?auto_206263 ?auto_206265 ) ( ON ?auto_206262 ?auto_206263 ) ( ON-TABLE ?auto_206264 ) ( ON ?auto_206261 ?auto_206262 ) ( ON ?auto_206260 ?auto_206261 ) ( ON ?auto_206259 ?auto_206260 ) ( ON ?auto_206258 ?auto_206259 ) ( CLEAR ?auto_206258 ) ( HOLDING ?auto_206257 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_206257 )
      ( MAKE-6PILE ?auto_206257 ?auto_206258 ?auto_206259 ?auto_206260 ?auto_206261 ?auto_206262 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_206266 - BLOCK
      ?auto_206267 - BLOCK
      ?auto_206268 - BLOCK
      ?auto_206269 - BLOCK
      ?auto_206270 - BLOCK
      ?auto_206271 - BLOCK
    )
    :vars
    (
      ?auto_206274 - BLOCK
      ?auto_206272 - BLOCK
      ?auto_206273 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_206266 ?auto_206267 ) ) ( not ( = ?auto_206266 ?auto_206268 ) ) ( not ( = ?auto_206266 ?auto_206269 ) ) ( not ( = ?auto_206266 ?auto_206270 ) ) ( not ( = ?auto_206266 ?auto_206271 ) ) ( not ( = ?auto_206266 ?auto_206274 ) ) ( not ( = ?auto_206267 ?auto_206268 ) ) ( not ( = ?auto_206267 ?auto_206269 ) ) ( not ( = ?auto_206267 ?auto_206270 ) ) ( not ( = ?auto_206267 ?auto_206271 ) ) ( not ( = ?auto_206267 ?auto_206274 ) ) ( not ( = ?auto_206268 ?auto_206269 ) ) ( not ( = ?auto_206268 ?auto_206270 ) ) ( not ( = ?auto_206268 ?auto_206271 ) ) ( not ( = ?auto_206268 ?auto_206274 ) ) ( not ( = ?auto_206269 ?auto_206270 ) ) ( not ( = ?auto_206269 ?auto_206271 ) ) ( not ( = ?auto_206269 ?auto_206274 ) ) ( not ( = ?auto_206270 ?auto_206271 ) ) ( not ( = ?auto_206270 ?auto_206274 ) ) ( not ( = ?auto_206271 ?auto_206274 ) ) ( not ( = ?auto_206266 ?auto_206272 ) ) ( not ( = ?auto_206267 ?auto_206272 ) ) ( not ( = ?auto_206268 ?auto_206272 ) ) ( not ( = ?auto_206269 ?auto_206272 ) ) ( not ( = ?auto_206270 ?auto_206272 ) ) ( not ( = ?auto_206271 ?auto_206272 ) ) ( not ( = ?auto_206274 ?auto_206272 ) ) ( ON ?auto_206272 ?auto_206273 ) ( not ( = ?auto_206266 ?auto_206273 ) ) ( not ( = ?auto_206267 ?auto_206273 ) ) ( not ( = ?auto_206268 ?auto_206273 ) ) ( not ( = ?auto_206269 ?auto_206273 ) ) ( not ( = ?auto_206270 ?auto_206273 ) ) ( not ( = ?auto_206271 ?auto_206273 ) ) ( not ( = ?auto_206274 ?auto_206273 ) ) ( not ( = ?auto_206272 ?auto_206273 ) ) ( ON ?auto_206274 ?auto_206272 ) ( ON ?auto_206271 ?auto_206274 ) ( ON-TABLE ?auto_206273 ) ( ON ?auto_206270 ?auto_206271 ) ( ON ?auto_206269 ?auto_206270 ) ( ON ?auto_206268 ?auto_206269 ) ( ON ?auto_206267 ?auto_206268 ) ( ON ?auto_206266 ?auto_206267 ) ( CLEAR ?auto_206266 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_206273 ?auto_206272 ?auto_206274 ?auto_206271 ?auto_206270 ?auto_206269 ?auto_206268 ?auto_206267 )
      ( MAKE-6PILE ?auto_206266 ?auto_206267 ?auto_206268 ?auto_206269 ?auto_206270 ?auto_206271 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_206277 - BLOCK
      ?auto_206278 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_206278 ) ( CLEAR ?auto_206277 ) ( ON-TABLE ?auto_206277 ) ( not ( = ?auto_206277 ?auto_206278 ) ) )
    :subtasks
    ( ( !STACK ?auto_206278 ?auto_206277 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_206279 - BLOCK
      ?auto_206280 - BLOCK
    )
    :vars
    (
      ?auto_206281 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_206279 ) ( ON-TABLE ?auto_206279 ) ( not ( = ?auto_206279 ?auto_206280 ) ) ( ON ?auto_206280 ?auto_206281 ) ( CLEAR ?auto_206280 ) ( HAND-EMPTY ) ( not ( = ?auto_206279 ?auto_206281 ) ) ( not ( = ?auto_206280 ?auto_206281 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_206280 ?auto_206281 )
      ( MAKE-2PILE ?auto_206279 ?auto_206280 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_206282 - BLOCK
      ?auto_206283 - BLOCK
    )
    :vars
    (
      ?auto_206284 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_206282 ?auto_206283 ) ) ( ON ?auto_206283 ?auto_206284 ) ( CLEAR ?auto_206283 ) ( not ( = ?auto_206282 ?auto_206284 ) ) ( not ( = ?auto_206283 ?auto_206284 ) ) ( HOLDING ?auto_206282 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_206282 )
      ( MAKE-2PILE ?auto_206282 ?auto_206283 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_206285 - BLOCK
      ?auto_206286 - BLOCK
    )
    :vars
    (
      ?auto_206287 - BLOCK
      ?auto_206291 - BLOCK
      ?auto_206288 - BLOCK
      ?auto_206292 - BLOCK
      ?auto_206289 - BLOCK
      ?auto_206290 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_206285 ?auto_206286 ) ) ( ON ?auto_206286 ?auto_206287 ) ( not ( = ?auto_206285 ?auto_206287 ) ) ( not ( = ?auto_206286 ?auto_206287 ) ) ( ON ?auto_206285 ?auto_206286 ) ( CLEAR ?auto_206285 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_206291 ) ( ON ?auto_206288 ?auto_206291 ) ( ON ?auto_206292 ?auto_206288 ) ( ON ?auto_206289 ?auto_206292 ) ( ON ?auto_206290 ?auto_206289 ) ( ON ?auto_206287 ?auto_206290 ) ( not ( = ?auto_206291 ?auto_206288 ) ) ( not ( = ?auto_206291 ?auto_206292 ) ) ( not ( = ?auto_206291 ?auto_206289 ) ) ( not ( = ?auto_206291 ?auto_206290 ) ) ( not ( = ?auto_206291 ?auto_206287 ) ) ( not ( = ?auto_206291 ?auto_206286 ) ) ( not ( = ?auto_206291 ?auto_206285 ) ) ( not ( = ?auto_206288 ?auto_206292 ) ) ( not ( = ?auto_206288 ?auto_206289 ) ) ( not ( = ?auto_206288 ?auto_206290 ) ) ( not ( = ?auto_206288 ?auto_206287 ) ) ( not ( = ?auto_206288 ?auto_206286 ) ) ( not ( = ?auto_206288 ?auto_206285 ) ) ( not ( = ?auto_206292 ?auto_206289 ) ) ( not ( = ?auto_206292 ?auto_206290 ) ) ( not ( = ?auto_206292 ?auto_206287 ) ) ( not ( = ?auto_206292 ?auto_206286 ) ) ( not ( = ?auto_206292 ?auto_206285 ) ) ( not ( = ?auto_206289 ?auto_206290 ) ) ( not ( = ?auto_206289 ?auto_206287 ) ) ( not ( = ?auto_206289 ?auto_206286 ) ) ( not ( = ?auto_206289 ?auto_206285 ) ) ( not ( = ?auto_206290 ?auto_206287 ) ) ( not ( = ?auto_206290 ?auto_206286 ) ) ( not ( = ?auto_206290 ?auto_206285 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_206291 ?auto_206288 ?auto_206292 ?auto_206289 ?auto_206290 ?auto_206287 ?auto_206286 )
      ( MAKE-2PILE ?auto_206285 ?auto_206286 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_206293 - BLOCK
      ?auto_206294 - BLOCK
    )
    :vars
    (
      ?auto_206295 - BLOCK
      ?auto_206299 - BLOCK
      ?auto_206300 - BLOCK
      ?auto_206296 - BLOCK
      ?auto_206298 - BLOCK
      ?auto_206297 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_206293 ?auto_206294 ) ) ( ON ?auto_206294 ?auto_206295 ) ( not ( = ?auto_206293 ?auto_206295 ) ) ( not ( = ?auto_206294 ?auto_206295 ) ) ( ON-TABLE ?auto_206299 ) ( ON ?auto_206300 ?auto_206299 ) ( ON ?auto_206296 ?auto_206300 ) ( ON ?auto_206298 ?auto_206296 ) ( ON ?auto_206297 ?auto_206298 ) ( ON ?auto_206295 ?auto_206297 ) ( not ( = ?auto_206299 ?auto_206300 ) ) ( not ( = ?auto_206299 ?auto_206296 ) ) ( not ( = ?auto_206299 ?auto_206298 ) ) ( not ( = ?auto_206299 ?auto_206297 ) ) ( not ( = ?auto_206299 ?auto_206295 ) ) ( not ( = ?auto_206299 ?auto_206294 ) ) ( not ( = ?auto_206299 ?auto_206293 ) ) ( not ( = ?auto_206300 ?auto_206296 ) ) ( not ( = ?auto_206300 ?auto_206298 ) ) ( not ( = ?auto_206300 ?auto_206297 ) ) ( not ( = ?auto_206300 ?auto_206295 ) ) ( not ( = ?auto_206300 ?auto_206294 ) ) ( not ( = ?auto_206300 ?auto_206293 ) ) ( not ( = ?auto_206296 ?auto_206298 ) ) ( not ( = ?auto_206296 ?auto_206297 ) ) ( not ( = ?auto_206296 ?auto_206295 ) ) ( not ( = ?auto_206296 ?auto_206294 ) ) ( not ( = ?auto_206296 ?auto_206293 ) ) ( not ( = ?auto_206298 ?auto_206297 ) ) ( not ( = ?auto_206298 ?auto_206295 ) ) ( not ( = ?auto_206298 ?auto_206294 ) ) ( not ( = ?auto_206298 ?auto_206293 ) ) ( not ( = ?auto_206297 ?auto_206295 ) ) ( not ( = ?auto_206297 ?auto_206294 ) ) ( not ( = ?auto_206297 ?auto_206293 ) ) ( HOLDING ?auto_206293 ) ( CLEAR ?auto_206294 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_206299 ?auto_206300 ?auto_206296 ?auto_206298 ?auto_206297 ?auto_206295 ?auto_206294 ?auto_206293 )
      ( MAKE-2PILE ?auto_206293 ?auto_206294 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_206301 - BLOCK
      ?auto_206302 - BLOCK
    )
    :vars
    (
      ?auto_206305 - BLOCK
      ?auto_206308 - BLOCK
      ?auto_206303 - BLOCK
      ?auto_206307 - BLOCK
      ?auto_206304 - BLOCK
      ?auto_206306 - BLOCK
      ?auto_206309 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_206301 ?auto_206302 ) ) ( ON ?auto_206302 ?auto_206305 ) ( not ( = ?auto_206301 ?auto_206305 ) ) ( not ( = ?auto_206302 ?auto_206305 ) ) ( ON-TABLE ?auto_206308 ) ( ON ?auto_206303 ?auto_206308 ) ( ON ?auto_206307 ?auto_206303 ) ( ON ?auto_206304 ?auto_206307 ) ( ON ?auto_206306 ?auto_206304 ) ( ON ?auto_206305 ?auto_206306 ) ( not ( = ?auto_206308 ?auto_206303 ) ) ( not ( = ?auto_206308 ?auto_206307 ) ) ( not ( = ?auto_206308 ?auto_206304 ) ) ( not ( = ?auto_206308 ?auto_206306 ) ) ( not ( = ?auto_206308 ?auto_206305 ) ) ( not ( = ?auto_206308 ?auto_206302 ) ) ( not ( = ?auto_206308 ?auto_206301 ) ) ( not ( = ?auto_206303 ?auto_206307 ) ) ( not ( = ?auto_206303 ?auto_206304 ) ) ( not ( = ?auto_206303 ?auto_206306 ) ) ( not ( = ?auto_206303 ?auto_206305 ) ) ( not ( = ?auto_206303 ?auto_206302 ) ) ( not ( = ?auto_206303 ?auto_206301 ) ) ( not ( = ?auto_206307 ?auto_206304 ) ) ( not ( = ?auto_206307 ?auto_206306 ) ) ( not ( = ?auto_206307 ?auto_206305 ) ) ( not ( = ?auto_206307 ?auto_206302 ) ) ( not ( = ?auto_206307 ?auto_206301 ) ) ( not ( = ?auto_206304 ?auto_206306 ) ) ( not ( = ?auto_206304 ?auto_206305 ) ) ( not ( = ?auto_206304 ?auto_206302 ) ) ( not ( = ?auto_206304 ?auto_206301 ) ) ( not ( = ?auto_206306 ?auto_206305 ) ) ( not ( = ?auto_206306 ?auto_206302 ) ) ( not ( = ?auto_206306 ?auto_206301 ) ) ( CLEAR ?auto_206302 ) ( ON ?auto_206301 ?auto_206309 ) ( CLEAR ?auto_206301 ) ( HAND-EMPTY ) ( not ( = ?auto_206301 ?auto_206309 ) ) ( not ( = ?auto_206302 ?auto_206309 ) ) ( not ( = ?auto_206305 ?auto_206309 ) ) ( not ( = ?auto_206308 ?auto_206309 ) ) ( not ( = ?auto_206303 ?auto_206309 ) ) ( not ( = ?auto_206307 ?auto_206309 ) ) ( not ( = ?auto_206304 ?auto_206309 ) ) ( not ( = ?auto_206306 ?auto_206309 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_206301 ?auto_206309 )
      ( MAKE-2PILE ?auto_206301 ?auto_206302 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_206310 - BLOCK
      ?auto_206311 - BLOCK
    )
    :vars
    (
      ?auto_206318 - BLOCK
      ?auto_206313 - BLOCK
      ?auto_206317 - BLOCK
      ?auto_206314 - BLOCK
      ?auto_206316 - BLOCK
      ?auto_206312 - BLOCK
      ?auto_206315 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_206310 ?auto_206311 ) ) ( not ( = ?auto_206310 ?auto_206318 ) ) ( not ( = ?auto_206311 ?auto_206318 ) ) ( ON-TABLE ?auto_206313 ) ( ON ?auto_206317 ?auto_206313 ) ( ON ?auto_206314 ?auto_206317 ) ( ON ?auto_206316 ?auto_206314 ) ( ON ?auto_206312 ?auto_206316 ) ( ON ?auto_206318 ?auto_206312 ) ( not ( = ?auto_206313 ?auto_206317 ) ) ( not ( = ?auto_206313 ?auto_206314 ) ) ( not ( = ?auto_206313 ?auto_206316 ) ) ( not ( = ?auto_206313 ?auto_206312 ) ) ( not ( = ?auto_206313 ?auto_206318 ) ) ( not ( = ?auto_206313 ?auto_206311 ) ) ( not ( = ?auto_206313 ?auto_206310 ) ) ( not ( = ?auto_206317 ?auto_206314 ) ) ( not ( = ?auto_206317 ?auto_206316 ) ) ( not ( = ?auto_206317 ?auto_206312 ) ) ( not ( = ?auto_206317 ?auto_206318 ) ) ( not ( = ?auto_206317 ?auto_206311 ) ) ( not ( = ?auto_206317 ?auto_206310 ) ) ( not ( = ?auto_206314 ?auto_206316 ) ) ( not ( = ?auto_206314 ?auto_206312 ) ) ( not ( = ?auto_206314 ?auto_206318 ) ) ( not ( = ?auto_206314 ?auto_206311 ) ) ( not ( = ?auto_206314 ?auto_206310 ) ) ( not ( = ?auto_206316 ?auto_206312 ) ) ( not ( = ?auto_206316 ?auto_206318 ) ) ( not ( = ?auto_206316 ?auto_206311 ) ) ( not ( = ?auto_206316 ?auto_206310 ) ) ( not ( = ?auto_206312 ?auto_206318 ) ) ( not ( = ?auto_206312 ?auto_206311 ) ) ( not ( = ?auto_206312 ?auto_206310 ) ) ( ON ?auto_206310 ?auto_206315 ) ( CLEAR ?auto_206310 ) ( not ( = ?auto_206310 ?auto_206315 ) ) ( not ( = ?auto_206311 ?auto_206315 ) ) ( not ( = ?auto_206318 ?auto_206315 ) ) ( not ( = ?auto_206313 ?auto_206315 ) ) ( not ( = ?auto_206317 ?auto_206315 ) ) ( not ( = ?auto_206314 ?auto_206315 ) ) ( not ( = ?auto_206316 ?auto_206315 ) ) ( not ( = ?auto_206312 ?auto_206315 ) ) ( HOLDING ?auto_206311 ) ( CLEAR ?auto_206318 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_206313 ?auto_206317 ?auto_206314 ?auto_206316 ?auto_206312 ?auto_206318 ?auto_206311 )
      ( MAKE-2PILE ?auto_206310 ?auto_206311 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_206319 - BLOCK
      ?auto_206320 - BLOCK
    )
    :vars
    (
      ?auto_206327 - BLOCK
      ?auto_206323 - BLOCK
      ?auto_206321 - BLOCK
      ?auto_206325 - BLOCK
      ?auto_206322 - BLOCK
      ?auto_206326 - BLOCK
      ?auto_206324 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_206319 ?auto_206320 ) ) ( not ( = ?auto_206319 ?auto_206327 ) ) ( not ( = ?auto_206320 ?auto_206327 ) ) ( ON-TABLE ?auto_206323 ) ( ON ?auto_206321 ?auto_206323 ) ( ON ?auto_206325 ?auto_206321 ) ( ON ?auto_206322 ?auto_206325 ) ( ON ?auto_206326 ?auto_206322 ) ( ON ?auto_206327 ?auto_206326 ) ( not ( = ?auto_206323 ?auto_206321 ) ) ( not ( = ?auto_206323 ?auto_206325 ) ) ( not ( = ?auto_206323 ?auto_206322 ) ) ( not ( = ?auto_206323 ?auto_206326 ) ) ( not ( = ?auto_206323 ?auto_206327 ) ) ( not ( = ?auto_206323 ?auto_206320 ) ) ( not ( = ?auto_206323 ?auto_206319 ) ) ( not ( = ?auto_206321 ?auto_206325 ) ) ( not ( = ?auto_206321 ?auto_206322 ) ) ( not ( = ?auto_206321 ?auto_206326 ) ) ( not ( = ?auto_206321 ?auto_206327 ) ) ( not ( = ?auto_206321 ?auto_206320 ) ) ( not ( = ?auto_206321 ?auto_206319 ) ) ( not ( = ?auto_206325 ?auto_206322 ) ) ( not ( = ?auto_206325 ?auto_206326 ) ) ( not ( = ?auto_206325 ?auto_206327 ) ) ( not ( = ?auto_206325 ?auto_206320 ) ) ( not ( = ?auto_206325 ?auto_206319 ) ) ( not ( = ?auto_206322 ?auto_206326 ) ) ( not ( = ?auto_206322 ?auto_206327 ) ) ( not ( = ?auto_206322 ?auto_206320 ) ) ( not ( = ?auto_206322 ?auto_206319 ) ) ( not ( = ?auto_206326 ?auto_206327 ) ) ( not ( = ?auto_206326 ?auto_206320 ) ) ( not ( = ?auto_206326 ?auto_206319 ) ) ( ON ?auto_206319 ?auto_206324 ) ( not ( = ?auto_206319 ?auto_206324 ) ) ( not ( = ?auto_206320 ?auto_206324 ) ) ( not ( = ?auto_206327 ?auto_206324 ) ) ( not ( = ?auto_206323 ?auto_206324 ) ) ( not ( = ?auto_206321 ?auto_206324 ) ) ( not ( = ?auto_206325 ?auto_206324 ) ) ( not ( = ?auto_206322 ?auto_206324 ) ) ( not ( = ?auto_206326 ?auto_206324 ) ) ( CLEAR ?auto_206327 ) ( ON ?auto_206320 ?auto_206319 ) ( CLEAR ?auto_206320 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_206324 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_206324 ?auto_206319 )
      ( MAKE-2PILE ?auto_206319 ?auto_206320 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_206328 - BLOCK
      ?auto_206329 - BLOCK
    )
    :vars
    (
      ?auto_206333 - BLOCK
      ?auto_206332 - BLOCK
      ?auto_206335 - BLOCK
      ?auto_206331 - BLOCK
      ?auto_206336 - BLOCK
      ?auto_206330 - BLOCK
      ?auto_206334 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_206328 ?auto_206329 ) ) ( not ( = ?auto_206328 ?auto_206333 ) ) ( not ( = ?auto_206329 ?auto_206333 ) ) ( ON-TABLE ?auto_206332 ) ( ON ?auto_206335 ?auto_206332 ) ( ON ?auto_206331 ?auto_206335 ) ( ON ?auto_206336 ?auto_206331 ) ( ON ?auto_206330 ?auto_206336 ) ( not ( = ?auto_206332 ?auto_206335 ) ) ( not ( = ?auto_206332 ?auto_206331 ) ) ( not ( = ?auto_206332 ?auto_206336 ) ) ( not ( = ?auto_206332 ?auto_206330 ) ) ( not ( = ?auto_206332 ?auto_206333 ) ) ( not ( = ?auto_206332 ?auto_206329 ) ) ( not ( = ?auto_206332 ?auto_206328 ) ) ( not ( = ?auto_206335 ?auto_206331 ) ) ( not ( = ?auto_206335 ?auto_206336 ) ) ( not ( = ?auto_206335 ?auto_206330 ) ) ( not ( = ?auto_206335 ?auto_206333 ) ) ( not ( = ?auto_206335 ?auto_206329 ) ) ( not ( = ?auto_206335 ?auto_206328 ) ) ( not ( = ?auto_206331 ?auto_206336 ) ) ( not ( = ?auto_206331 ?auto_206330 ) ) ( not ( = ?auto_206331 ?auto_206333 ) ) ( not ( = ?auto_206331 ?auto_206329 ) ) ( not ( = ?auto_206331 ?auto_206328 ) ) ( not ( = ?auto_206336 ?auto_206330 ) ) ( not ( = ?auto_206336 ?auto_206333 ) ) ( not ( = ?auto_206336 ?auto_206329 ) ) ( not ( = ?auto_206336 ?auto_206328 ) ) ( not ( = ?auto_206330 ?auto_206333 ) ) ( not ( = ?auto_206330 ?auto_206329 ) ) ( not ( = ?auto_206330 ?auto_206328 ) ) ( ON ?auto_206328 ?auto_206334 ) ( not ( = ?auto_206328 ?auto_206334 ) ) ( not ( = ?auto_206329 ?auto_206334 ) ) ( not ( = ?auto_206333 ?auto_206334 ) ) ( not ( = ?auto_206332 ?auto_206334 ) ) ( not ( = ?auto_206335 ?auto_206334 ) ) ( not ( = ?auto_206331 ?auto_206334 ) ) ( not ( = ?auto_206336 ?auto_206334 ) ) ( not ( = ?auto_206330 ?auto_206334 ) ) ( ON ?auto_206329 ?auto_206328 ) ( CLEAR ?auto_206329 ) ( ON-TABLE ?auto_206334 ) ( HOLDING ?auto_206333 ) ( CLEAR ?auto_206330 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_206332 ?auto_206335 ?auto_206331 ?auto_206336 ?auto_206330 ?auto_206333 )
      ( MAKE-2PILE ?auto_206328 ?auto_206329 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_206337 - BLOCK
      ?auto_206338 - BLOCK
    )
    :vars
    (
      ?auto_206342 - BLOCK
      ?auto_206344 - BLOCK
      ?auto_206340 - BLOCK
      ?auto_206345 - BLOCK
      ?auto_206339 - BLOCK
      ?auto_206343 - BLOCK
      ?auto_206341 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_206337 ?auto_206338 ) ) ( not ( = ?auto_206337 ?auto_206342 ) ) ( not ( = ?auto_206338 ?auto_206342 ) ) ( ON-TABLE ?auto_206344 ) ( ON ?auto_206340 ?auto_206344 ) ( ON ?auto_206345 ?auto_206340 ) ( ON ?auto_206339 ?auto_206345 ) ( ON ?auto_206343 ?auto_206339 ) ( not ( = ?auto_206344 ?auto_206340 ) ) ( not ( = ?auto_206344 ?auto_206345 ) ) ( not ( = ?auto_206344 ?auto_206339 ) ) ( not ( = ?auto_206344 ?auto_206343 ) ) ( not ( = ?auto_206344 ?auto_206342 ) ) ( not ( = ?auto_206344 ?auto_206338 ) ) ( not ( = ?auto_206344 ?auto_206337 ) ) ( not ( = ?auto_206340 ?auto_206345 ) ) ( not ( = ?auto_206340 ?auto_206339 ) ) ( not ( = ?auto_206340 ?auto_206343 ) ) ( not ( = ?auto_206340 ?auto_206342 ) ) ( not ( = ?auto_206340 ?auto_206338 ) ) ( not ( = ?auto_206340 ?auto_206337 ) ) ( not ( = ?auto_206345 ?auto_206339 ) ) ( not ( = ?auto_206345 ?auto_206343 ) ) ( not ( = ?auto_206345 ?auto_206342 ) ) ( not ( = ?auto_206345 ?auto_206338 ) ) ( not ( = ?auto_206345 ?auto_206337 ) ) ( not ( = ?auto_206339 ?auto_206343 ) ) ( not ( = ?auto_206339 ?auto_206342 ) ) ( not ( = ?auto_206339 ?auto_206338 ) ) ( not ( = ?auto_206339 ?auto_206337 ) ) ( not ( = ?auto_206343 ?auto_206342 ) ) ( not ( = ?auto_206343 ?auto_206338 ) ) ( not ( = ?auto_206343 ?auto_206337 ) ) ( ON ?auto_206337 ?auto_206341 ) ( not ( = ?auto_206337 ?auto_206341 ) ) ( not ( = ?auto_206338 ?auto_206341 ) ) ( not ( = ?auto_206342 ?auto_206341 ) ) ( not ( = ?auto_206344 ?auto_206341 ) ) ( not ( = ?auto_206340 ?auto_206341 ) ) ( not ( = ?auto_206345 ?auto_206341 ) ) ( not ( = ?auto_206339 ?auto_206341 ) ) ( not ( = ?auto_206343 ?auto_206341 ) ) ( ON ?auto_206338 ?auto_206337 ) ( ON-TABLE ?auto_206341 ) ( CLEAR ?auto_206343 ) ( ON ?auto_206342 ?auto_206338 ) ( CLEAR ?auto_206342 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_206341 ?auto_206337 ?auto_206338 )
      ( MAKE-2PILE ?auto_206337 ?auto_206338 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_206346 - BLOCK
      ?auto_206347 - BLOCK
    )
    :vars
    (
      ?auto_206349 - BLOCK
      ?auto_206353 - BLOCK
      ?auto_206350 - BLOCK
      ?auto_206348 - BLOCK
      ?auto_206351 - BLOCK
      ?auto_206354 - BLOCK
      ?auto_206352 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_206346 ?auto_206347 ) ) ( not ( = ?auto_206346 ?auto_206349 ) ) ( not ( = ?auto_206347 ?auto_206349 ) ) ( ON-TABLE ?auto_206353 ) ( ON ?auto_206350 ?auto_206353 ) ( ON ?auto_206348 ?auto_206350 ) ( ON ?auto_206351 ?auto_206348 ) ( not ( = ?auto_206353 ?auto_206350 ) ) ( not ( = ?auto_206353 ?auto_206348 ) ) ( not ( = ?auto_206353 ?auto_206351 ) ) ( not ( = ?auto_206353 ?auto_206354 ) ) ( not ( = ?auto_206353 ?auto_206349 ) ) ( not ( = ?auto_206353 ?auto_206347 ) ) ( not ( = ?auto_206353 ?auto_206346 ) ) ( not ( = ?auto_206350 ?auto_206348 ) ) ( not ( = ?auto_206350 ?auto_206351 ) ) ( not ( = ?auto_206350 ?auto_206354 ) ) ( not ( = ?auto_206350 ?auto_206349 ) ) ( not ( = ?auto_206350 ?auto_206347 ) ) ( not ( = ?auto_206350 ?auto_206346 ) ) ( not ( = ?auto_206348 ?auto_206351 ) ) ( not ( = ?auto_206348 ?auto_206354 ) ) ( not ( = ?auto_206348 ?auto_206349 ) ) ( not ( = ?auto_206348 ?auto_206347 ) ) ( not ( = ?auto_206348 ?auto_206346 ) ) ( not ( = ?auto_206351 ?auto_206354 ) ) ( not ( = ?auto_206351 ?auto_206349 ) ) ( not ( = ?auto_206351 ?auto_206347 ) ) ( not ( = ?auto_206351 ?auto_206346 ) ) ( not ( = ?auto_206354 ?auto_206349 ) ) ( not ( = ?auto_206354 ?auto_206347 ) ) ( not ( = ?auto_206354 ?auto_206346 ) ) ( ON ?auto_206346 ?auto_206352 ) ( not ( = ?auto_206346 ?auto_206352 ) ) ( not ( = ?auto_206347 ?auto_206352 ) ) ( not ( = ?auto_206349 ?auto_206352 ) ) ( not ( = ?auto_206353 ?auto_206352 ) ) ( not ( = ?auto_206350 ?auto_206352 ) ) ( not ( = ?auto_206348 ?auto_206352 ) ) ( not ( = ?auto_206351 ?auto_206352 ) ) ( not ( = ?auto_206354 ?auto_206352 ) ) ( ON ?auto_206347 ?auto_206346 ) ( ON-TABLE ?auto_206352 ) ( ON ?auto_206349 ?auto_206347 ) ( CLEAR ?auto_206349 ) ( HOLDING ?auto_206354 ) ( CLEAR ?auto_206351 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_206353 ?auto_206350 ?auto_206348 ?auto_206351 ?auto_206354 )
      ( MAKE-2PILE ?auto_206346 ?auto_206347 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_206355 - BLOCK
      ?auto_206356 - BLOCK
    )
    :vars
    (
      ?auto_206357 - BLOCK
      ?auto_206359 - BLOCK
      ?auto_206358 - BLOCK
      ?auto_206362 - BLOCK
      ?auto_206360 - BLOCK
      ?auto_206363 - BLOCK
      ?auto_206361 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_206355 ?auto_206356 ) ) ( not ( = ?auto_206355 ?auto_206357 ) ) ( not ( = ?auto_206356 ?auto_206357 ) ) ( ON-TABLE ?auto_206359 ) ( ON ?auto_206358 ?auto_206359 ) ( ON ?auto_206362 ?auto_206358 ) ( ON ?auto_206360 ?auto_206362 ) ( not ( = ?auto_206359 ?auto_206358 ) ) ( not ( = ?auto_206359 ?auto_206362 ) ) ( not ( = ?auto_206359 ?auto_206360 ) ) ( not ( = ?auto_206359 ?auto_206363 ) ) ( not ( = ?auto_206359 ?auto_206357 ) ) ( not ( = ?auto_206359 ?auto_206356 ) ) ( not ( = ?auto_206359 ?auto_206355 ) ) ( not ( = ?auto_206358 ?auto_206362 ) ) ( not ( = ?auto_206358 ?auto_206360 ) ) ( not ( = ?auto_206358 ?auto_206363 ) ) ( not ( = ?auto_206358 ?auto_206357 ) ) ( not ( = ?auto_206358 ?auto_206356 ) ) ( not ( = ?auto_206358 ?auto_206355 ) ) ( not ( = ?auto_206362 ?auto_206360 ) ) ( not ( = ?auto_206362 ?auto_206363 ) ) ( not ( = ?auto_206362 ?auto_206357 ) ) ( not ( = ?auto_206362 ?auto_206356 ) ) ( not ( = ?auto_206362 ?auto_206355 ) ) ( not ( = ?auto_206360 ?auto_206363 ) ) ( not ( = ?auto_206360 ?auto_206357 ) ) ( not ( = ?auto_206360 ?auto_206356 ) ) ( not ( = ?auto_206360 ?auto_206355 ) ) ( not ( = ?auto_206363 ?auto_206357 ) ) ( not ( = ?auto_206363 ?auto_206356 ) ) ( not ( = ?auto_206363 ?auto_206355 ) ) ( ON ?auto_206355 ?auto_206361 ) ( not ( = ?auto_206355 ?auto_206361 ) ) ( not ( = ?auto_206356 ?auto_206361 ) ) ( not ( = ?auto_206357 ?auto_206361 ) ) ( not ( = ?auto_206359 ?auto_206361 ) ) ( not ( = ?auto_206358 ?auto_206361 ) ) ( not ( = ?auto_206362 ?auto_206361 ) ) ( not ( = ?auto_206360 ?auto_206361 ) ) ( not ( = ?auto_206363 ?auto_206361 ) ) ( ON ?auto_206356 ?auto_206355 ) ( ON-TABLE ?auto_206361 ) ( ON ?auto_206357 ?auto_206356 ) ( CLEAR ?auto_206360 ) ( ON ?auto_206363 ?auto_206357 ) ( CLEAR ?auto_206363 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_206361 ?auto_206355 ?auto_206356 ?auto_206357 )
      ( MAKE-2PILE ?auto_206355 ?auto_206356 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_206364 - BLOCK
      ?auto_206365 - BLOCK
    )
    :vars
    (
      ?auto_206368 - BLOCK
      ?auto_206371 - BLOCK
      ?auto_206367 - BLOCK
      ?auto_206370 - BLOCK
      ?auto_206372 - BLOCK
      ?auto_206369 - BLOCK
      ?auto_206366 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_206364 ?auto_206365 ) ) ( not ( = ?auto_206364 ?auto_206368 ) ) ( not ( = ?auto_206365 ?auto_206368 ) ) ( ON-TABLE ?auto_206371 ) ( ON ?auto_206367 ?auto_206371 ) ( ON ?auto_206370 ?auto_206367 ) ( not ( = ?auto_206371 ?auto_206367 ) ) ( not ( = ?auto_206371 ?auto_206370 ) ) ( not ( = ?auto_206371 ?auto_206372 ) ) ( not ( = ?auto_206371 ?auto_206369 ) ) ( not ( = ?auto_206371 ?auto_206368 ) ) ( not ( = ?auto_206371 ?auto_206365 ) ) ( not ( = ?auto_206371 ?auto_206364 ) ) ( not ( = ?auto_206367 ?auto_206370 ) ) ( not ( = ?auto_206367 ?auto_206372 ) ) ( not ( = ?auto_206367 ?auto_206369 ) ) ( not ( = ?auto_206367 ?auto_206368 ) ) ( not ( = ?auto_206367 ?auto_206365 ) ) ( not ( = ?auto_206367 ?auto_206364 ) ) ( not ( = ?auto_206370 ?auto_206372 ) ) ( not ( = ?auto_206370 ?auto_206369 ) ) ( not ( = ?auto_206370 ?auto_206368 ) ) ( not ( = ?auto_206370 ?auto_206365 ) ) ( not ( = ?auto_206370 ?auto_206364 ) ) ( not ( = ?auto_206372 ?auto_206369 ) ) ( not ( = ?auto_206372 ?auto_206368 ) ) ( not ( = ?auto_206372 ?auto_206365 ) ) ( not ( = ?auto_206372 ?auto_206364 ) ) ( not ( = ?auto_206369 ?auto_206368 ) ) ( not ( = ?auto_206369 ?auto_206365 ) ) ( not ( = ?auto_206369 ?auto_206364 ) ) ( ON ?auto_206364 ?auto_206366 ) ( not ( = ?auto_206364 ?auto_206366 ) ) ( not ( = ?auto_206365 ?auto_206366 ) ) ( not ( = ?auto_206368 ?auto_206366 ) ) ( not ( = ?auto_206371 ?auto_206366 ) ) ( not ( = ?auto_206367 ?auto_206366 ) ) ( not ( = ?auto_206370 ?auto_206366 ) ) ( not ( = ?auto_206372 ?auto_206366 ) ) ( not ( = ?auto_206369 ?auto_206366 ) ) ( ON ?auto_206365 ?auto_206364 ) ( ON-TABLE ?auto_206366 ) ( ON ?auto_206368 ?auto_206365 ) ( ON ?auto_206369 ?auto_206368 ) ( CLEAR ?auto_206369 ) ( HOLDING ?auto_206372 ) ( CLEAR ?auto_206370 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_206371 ?auto_206367 ?auto_206370 ?auto_206372 )
      ( MAKE-2PILE ?auto_206364 ?auto_206365 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_206373 - BLOCK
      ?auto_206374 - BLOCK
    )
    :vars
    (
      ?auto_206381 - BLOCK
      ?auto_206376 - BLOCK
      ?auto_206377 - BLOCK
      ?auto_206379 - BLOCK
      ?auto_206375 - BLOCK
      ?auto_206378 - BLOCK
      ?auto_206380 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_206373 ?auto_206374 ) ) ( not ( = ?auto_206373 ?auto_206381 ) ) ( not ( = ?auto_206374 ?auto_206381 ) ) ( ON-TABLE ?auto_206376 ) ( ON ?auto_206377 ?auto_206376 ) ( ON ?auto_206379 ?auto_206377 ) ( not ( = ?auto_206376 ?auto_206377 ) ) ( not ( = ?auto_206376 ?auto_206379 ) ) ( not ( = ?auto_206376 ?auto_206375 ) ) ( not ( = ?auto_206376 ?auto_206378 ) ) ( not ( = ?auto_206376 ?auto_206381 ) ) ( not ( = ?auto_206376 ?auto_206374 ) ) ( not ( = ?auto_206376 ?auto_206373 ) ) ( not ( = ?auto_206377 ?auto_206379 ) ) ( not ( = ?auto_206377 ?auto_206375 ) ) ( not ( = ?auto_206377 ?auto_206378 ) ) ( not ( = ?auto_206377 ?auto_206381 ) ) ( not ( = ?auto_206377 ?auto_206374 ) ) ( not ( = ?auto_206377 ?auto_206373 ) ) ( not ( = ?auto_206379 ?auto_206375 ) ) ( not ( = ?auto_206379 ?auto_206378 ) ) ( not ( = ?auto_206379 ?auto_206381 ) ) ( not ( = ?auto_206379 ?auto_206374 ) ) ( not ( = ?auto_206379 ?auto_206373 ) ) ( not ( = ?auto_206375 ?auto_206378 ) ) ( not ( = ?auto_206375 ?auto_206381 ) ) ( not ( = ?auto_206375 ?auto_206374 ) ) ( not ( = ?auto_206375 ?auto_206373 ) ) ( not ( = ?auto_206378 ?auto_206381 ) ) ( not ( = ?auto_206378 ?auto_206374 ) ) ( not ( = ?auto_206378 ?auto_206373 ) ) ( ON ?auto_206373 ?auto_206380 ) ( not ( = ?auto_206373 ?auto_206380 ) ) ( not ( = ?auto_206374 ?auto_206380 ) ) ( not ( = ?auto_206381 ?auto_206380 ) ) ( not ( = ?auto_206376 ?auto_206380 ) ) ( not ( = ?auto_206377 ?auto_206380 ) ) ( not ( = ?auto_206379 ?auto_206380 ) ) ( not ( = ?auto_206375 ?auto_206380 ) ) ( not ( = ?auto_206378 ?auto_206380 ) ) ( ON ?auto_206374 ?auto_206373 ) ( ON-TABLE ?auto_206380 ) ( ON ?auto_206381 ?auto_206374 ) ( ON ?auto_206378 ?auto_206381 ) ( CLEAR ?auto_206379 ) ( ON ?auto_206375 ?auto_206378 ) ( CLEAR ?auto_206375 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_206380 ?auto_206373 ?auto_206374 ?auto_206381 ?auto_206378 )
      ( MAKE-2PILE ?auto_206373 ?auto_206374 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_206382 - BLOCK
      ?auto_206383 - BLOCK
    )
    :vars
    (
      ?auto_206390 - BLOCK
      ?auto_206388 - BLOCK
      ?auto_206385 - BLOCK
      ?auto_206389 - BLOCK
      ?auto_206387 - BLOCK
      ?auto_206386 - BLOCK
      ?auto_206384 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_206382 ?auto_206383 ) ) ( not ( = ?auto_206382 ?auto_206390 ) ) ( not ( = ?auto_206383 ?auto_206390 ) ) ( ON-TABLE ?auto_206388 ) ( ON ?auto_206385 ?auto_206388 ) ( not ( = ?auto_206388 ?auto_206385 ) ) ( not ( = ?auto_206388 ?auto_206389 ) ) ( not ( = ?auto_206388 ?auto_206387 ) ) ( not ( = ?auto_206388 ?auto_206386 ) ) ( not ( = ?auto_206388 ?auto_206390 ) ) ( not ( = ?auto_206388 ?auto_206383 ) ) ( not ( = ?auto_206388 ?auto_206382 ) ) ( not ( = ?auto_206385 ?auto_206389 ) ) ( not ( = ?auto_206385 ?auto_206387 ) ) ( not ( = ?auto_206385 ?auto_206386 ) ) ( not ( = ?auto_206385 ?auto_206390 ) ) ( not ( = ?auto_206385 ?auto_206383 ) ) ( not ( = ?auto_206385 ?auto_206382 ) ) ( not ( = ?auto_206389 ?auto_206387 ) ) ( not ( = ?auto_206389 ?auto_206386 ) ) ( not ( = ?auto_206389 ?auto_206390 ) ) ( not ( = ?auto_206389 ?auto_206383 ) ) ( not ( = ?auto_206389 ?auto_206382 ) ) ( not ( = ?auto_206387 ?auto_206386 ) ) ( not ( = ?auto_206387 ?auto_206390 ) ) ( not ( = ?auto_206387 ?auto_206383 ) ) ( not ( = ?auto_206387 ?auto_206382 ) ) ( not ( = ?auto_206386 ?auto_206390 ) ) ( not ( = ?auto_206386 ?auto_206383 ) ) ( not ( = ?auto_206386 ?auto_206382 ) ) ( ON ?auto_206382 ?auto_206384 ) ( not ( = ?auto_206382 ?auto_206384 ) ) ( not ( = ?auto_206383 ?auto_206384 ) ) ( not ( = ?auto_206390 ?auto_206384 ) ) ( not ( = ?auto_206388 ?auto_206384 ) ) ( not ( = ?auto_206385 ?auto_206384 ) ) ( not ( = ?auto_206389 ?auto_206384 ) ) ( not ( = ?auto_206387 ?auto_206384 ) ) ( not ( = ?auto_206386 ?auto_206384 ) ) ( ON ?auto_206383 ?auto_206382 ) ( ON-TABLE ?auto_206384 ) ( ON ?auto_206390 ?auto_206383 ) ( ON ?auto_206386 ?auto_206390 ) ( ON ?auto_206387 ?auto_206386 ) ( CLEAR ?auto_206387 ) ( HOLDING ?auto_206389 ) ( CLEAR ?auto_206385 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_206388 ?auto_206385 ?auto_206389 )
      ( MAKE-2PILE ?auto_206382 ?auto_206383 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_206391 - BLOCK
      ?auto_206392 - BLOCK
    )
    :vars
    (
      ?auto_206394 - BLOCK
      ?auto_206395 - BLOCK
      ?auto_206399 - BLOCK
      ?auto_206398 - BLOCK
      ?auto_206393 - BLOCK
      ?auto_206397 - BLOCK
      ?auto_206396 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_206391 ?auto_206392 ) ) ( not ( = ?auto_206391 ?auto_206394 ) ) ( not ( = ?auto_206392 ?auto_206394 ) ) ( ON-TABLE ?auto_206395 ) ( ON ?auto_206399 ?auto_206395 ) ( not ( = ?auto_206395 ?auto_206399 ) ) ( not ( = ?auto_206395 ?auto_206398 ) ) ( not ( = ?auto_206395 ?auto_206393 ) ) ( not ( = ?auto_206395 ?auto_206397 ) ) ( not ( = ?auto_206395 ?auto_206394 ) ) ( not ( = ?auto_206395 ?auto_206392 ) ) ( not ( = ?auto_206395 ?auto_206391 ) ) ( not ( = ?auto_206399 ?auto_206398 ) ) ( not ( = ?auto_206399 ?auto_206393 ) ) ( not ( = ?auto_206399 ?auto_206397 ) ) ( not ( = ?auto_206399 ?auto_206394 ) ) ( not ( = ?auto_206399 ?auto_206392 ) ) ( not ( = ?auto_206399 ?auto_206391 ) ) ( not ( = ?auto_206398 ?auto_206393 ) ) ( not ( = ?auto_206398 ?auto_206397 ) ) ( not ( = ?auto_206398 ?auto_206394 ) ) ( not ( = ?auto_206398 ?auto_206392 ) ) ( not ( = ?auto_206398 ?auto_206391 ) ) ( not ( = ?auto_206393 ?auto_206397 ) ) ( not ( = ?auto_206393 ?auto_206394 ) ) ( not ( = ?auto_206393 ?auto_206392 ) ) ( not ( = ?auto_206393 ?auto_206391 ) ) ( not ( = ?auto_206397 ?auto_206394 ) ) ( not ( = ?auto_206397 ?auto_206392 ) ) ( not ( = ?auto_206397 ?auto_206391 ) ) ( ON ?auto_206391 ?auto_206396 ) ( not ( = ?auto_206391 ?auto_206396 ) ) ( not ( = ?auto_206392 ?auto_206396 ) ) ( not ( = ?auto_206394 ?auto_206396 ) ) ( not ( = ?auto_206395 ?auto_206396 ) ) ( not ( = ?auto_206399 ?auto_206396 ) ) ( not ( = ?auto_206398 ?auto_206396 ) ) ( not ( = ?auto_206393 ?auto_206396 ) ) ( not ( = ?auto_206397 ?auto_206396 ) ) ( ON ?auto_206392 ?auto_206391 ) ( ON-TABLE ?auto_206396 ) ( ON ?auto_206394 ?auto_206392 ) ( ON ?auto_206397 ?auto_206394 ) ( ON ?auto_206393 ?auto_206397 ) ( CLEAR ?auto_206399 ) ( ON ?auto_206398 ?auto_206393 ) ( CLEAR ?auto_206398 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_206396 ?auto_206391 ?auto_206392 ?auto_206394 ?auto_206397 ?auto_206393 )
      ( MAKE-2PILE ?auto_206391 ?auto_206392 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_206400 - BLOCK
      ?auto_206401 - BLOCK
    )
    :vars
    (
      ?auto_206407 - BLOCK
      ?auto_206404 - BLOCK
      ?auto_206402 - BLOCK
      ?auto_206405 - BLOCK
      ?auto_206406 - BLOCK
      ?auto_206403 - BLOCK
      ?auto_206408 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_206400 ?auto_206401 ) ) ( not ( = ?auto_206400 ?auto_206407 ) ) ( not ( = ?auto_206401 ?auto_206407 ) ) ( ON-TABLE ?auto_206404 ) ( not ( = ?auto_206404 ?auto_206402 ) ) ( not ( = ?auto_206404 ?auto_206405 ) ) ( not ( = ?auto_206404 ?auto_206406 ) ) ( not ( = ?auto_206404 ?auto_206403 ) ) ( not ( = ?auto_206404 ?auto_206407 ) ) ( not ( = ?auto_206404 ?auto_206401 ) ) ( not ( = ?auto_206404 ?auto_206400 ) ) ( not ( = ?auto_206402 ?auto_206405 ) ) ( not ( = ?auto_206402 ?auto_206406 ) ) ( not ( = ?auto_206402 ?auto_206403 ) ) ( not ( = ?auto_206402 ?auto_206407 ) ) ( not ( = ?auto_206402 ?auto_206401 ) ) ( not ( = ?auto_206402 ?auto_206400 ) ) ( not ( = ?auto_206405 ?auto_206406 ) ) ( not ( = ?auto_206405 ?auto_206403 ) ) ( not ( = ?auto_206405 ?auto_206407 ) ) ( not ( = ?auto_206405 ?auto_206401 ) ) ( not ( = ?auto_206405 ?auto_206400 ) ) ( not ( = ?auto_206406 ?auto_206403 ) ) ( not ( = ?auto_206406 ?auto_206407 ) ) ( not ( = ?auto_206406 ?auto_206401 ) ) ( not ( = ?auto_206406 ?auto_206400 ) ) ( not ( = ?auto_206403 ?auto_206407 ) ) ( not ( = ?auto_206403 ?auto_206401 ) ) ( not ( = ?auto_206403 ?auto_206400 ) ) ( ON ?auto_206400 ?auto_206408 ) ( not ( = ?auto_206400 ?auto_206408 ) ) ( not ( = ?auto_206401 ?auto_206408 ) ) ( not ( = ?auto_206407 ?auto_206408 ) ) ( not ( = ?auto_206404 ?auto_206408 ) ) ( not ( = ?auto_206402 ?auto_206408 ) ) ( not ( = ?auto_206405 ?auto_206408 ) ) ( not ( = ?auto_206406 ?auto_206408 ) ) ( not ( = ?auto_206403 ?auto_206408 ) ) ( ON ?auto_206401 ?auto_206400 ) ( ON-TABLE ?auto_206408 ) ( ON ?auto_206407 ?auto_206401 ) ( ON ?auto_206403 ?auto_206407 ) ( ON ?auto_206406 ?auto_206403 ) ( ON ?auto_206405 ?auto_206406 ) ( CLEAR ?auto_206405 ) ( HOLDING ?auto_206402 ) ( CLEAR ?auto_206404 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_206404 ?auto_206402 )
      ( MAKE-2PILE ?auto_206400 ?auto_206401 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_206409 - BLOCK
      ?auto_206410 - BLOCK
    )
    :vars
    (
      ?auto_206413 - BLOCK
      ?auto_206414 - BLOCK
      ?auto_206417 - BLOCK
      ?auto_206416 - BLOCK
      ?auto_206412 - BLOCK
      ?auto_206415 - BLOCK
      ?auto_206411 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_206409 ?auto_206410 ) ) ( not ( = ?auto_206409 ?auto_206413 ) ) ( not ( = ?auto_206410 ?auto_206413 ) ) ( ON-TABLE ?auto_206414 ) ( not ( = ?auto_206414 ?auto_206417 ) ) ( not ( = ?auto_206414 ?auto_206416 ) ) ( not ( = ?auto_206414 ?auto_206412 ) ) ( not ( = ?auto_206414 ?auto_206415 ) ) ( not ( = ?auto_206414 ?auto_206413 ) ) ( not ( = ?auto_206414 ?auto_206410 ) ) ( not ( = ?auto_206414 ?auto_206409 ) ) ( not ( = ?auto_206417 ?auto_206416 ) ) ( not ( = ?auto_206417 ?auto_206412 ) ) ( not ( = ?auto_206417 ?auto_206415 ) ) ( not ( = ?auto_206417 ?auto_206413 ) ) ( not ( = ?auto_206417 ?auto_206410 ) ) ( not ( = ?auto_206417 ?auto_206409 ) ) ( not ( = ?auto_206416 ?auto_206412 ) ) ( not ( = ?auto_206416 ?auto_206415 ) ) ( not ( = ?auto_206416 ?auto_206413 ) ) ( not ( = ?auto_206416 ?auto_206410 ) ) ( not ( = ?auto_206416 ?auto_206409 ) ) ( not ( = ?auto_206412 ?auto_206415 ) ) ( not ( = ?auto_206412 ?auto_206413 ) ) ( not ( = ?auto_206412 ?auto_206410 ) ) ( not ( = ?auto_206412 ?auto_206409 ) ) ( not ( = ?auto_206415 ?auto_206413 ) ) ( not ( = ?auto_206415 ?auto_206410 ) ) ( not ( = ?auto_206415 ?auto_206409 ) ) ( ON ?auto_206409 ?auto_206411 ) ( not ( = ?auto_206409 ?auto_206411 ) ) ( not ( = ?auto_206410 ?auto_206411 ) ) ( not ( = ?auto_206413 ?auto_206411 ) ) ( not ( = ?auto_206414 ?auto_206411 ) ) ( not ( = ?auto_206417 ?auto_206411 ) ) ( not ( = ?auto_206416 ?auto_206411 ) ) ( not ( = ?auto_206412 ?auto_206411 ) ) ( not ( = ?auto_206415 ?auto_206411 ) ) ( ON ?auto_206410 ?auto_206409 ) ( ON-TABLE ?auto_206411 ) ( ON ?auto_206413 ?auto_206410 ) ( ON ?auto_206415 ?auto_206413 ) ( ON ?auto_206412 ?auto_206415 ) ( ON ?auto_206416 ?auto_206412 ) ( CLEAR ?auto_206414 ) ( ON ?auto_206417 ?auto_206416 ) ( CLEAR ?auto_206417 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_206411 ?auto_206409 ?auto_206410 ?auto_206413 ?auto_206415 ?auto_206412 ?auto_206416 )
      ( MAKE-2PILE ?auto_206409 ?auto_206410 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_206418 - BLOCK
      ?auto_206419 - BLOCK
    )
    :vars
    (
      ?auto_206422 - BLOCK
      ?auto_206421 - BLOCK
      ?auto_206420 - BLOCK
      ?auto_206426 - BLOCK
      ?auto_206424 - BLOCK
      ?auto_206425 - BLOCK
      ?auto_206423 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_206418 ?auto_206419 ) ) ( not ( = ?auto_206418 ?auto_206422 ) ) ( not ( = ?auto_206419 ?auto_206422 ) ) ( not ( = ?auto_206421 ?auto_206420 ) ) ( not ( = ?auto_206421 ?auto_206426 ) ) ( not ( = ?auto_206421 ?auto_206424 ) ) ( not ( = ?auto_206421 ?auto_206425 ) ) ( not ( = ?auto_206421 ?auto_206422 ) ) ( not ( = ?auto_206421 ?auto_206419 ) ) ( not ( = ?auto_206421 ?auto_206418 ) ) ( not ( = ?auto_206420 ?auto_206426 ) ) ( not ( = ?auto_206420 ?auto_206424 ) ) ( not ( = ?auto_206420 ?auto_206425 ) ) ( not ( = ?auto_206420 ?auto_206422 ) ) ( not ( = ?auto_206420 ?auto_206419 ) ) ( not ( = ?auto_206420 ?auto_206418 ) ) ( not ( = ?auto_206426 ?auto_206424 ) ) ( not ( = ?auto_206426 ?auto_206425 ) ) ( not ( = ?auto_206426 ?auto_206422 ) ) ( not ( = ?auto_206426 ?auto_206419 ) ) ( not ( = ?auto_206426 ?auto_206418 ) ) ( not ( = ?auto_206424 ?auto_206425 ) ) ( not ( = ?auto_206424 ?auto_206422 ) ) ( not ( = ?auto_206424 ?auto_206419 ) ) ( not ( = ?auto_206424 ?auto_206418 ) ) ( not ( = ?auto_206425 ?auto_206422 ) ) ( not ( = ?auto_206425 ?auto_206419 ) ) ( not ( = ?auto_206425 ?auto_206418 ) ) ( ON ?auto_206418 ?auto_206423 ) ( not ( = ?auto_206418 ?auto_206423 ) ) ( not ( = ?auto_206419 ?auto_206423 ) ) ( not ( = ?auto_206422 ?auto_206423 ) ) ( not ( = ?auto_206421 ?auto_206423 ) ) ( not ( = ?auto_206420 ?auto_206423 ) ) ( not ( = ?auto_206426 ?auto_206423 ) ) ( not ( = ?auto_206424 ?auto_206423 ) ) ( not ( = ?auto_206425 ?auto_206423 ) ) ( ON ?auto_206419 ?auto_206418 ) ( ON-TABLE ?auto_206423 ) ( ON ?auto_206422 ?auto_206419 ) ( ON ?auto_206425 ?auto_206422 ) ( ON ?auto_206424 ?auto_206425 ) ( ON ?auto_206426 ?auto_206424 ) ( ON ?auto_206420 ?auto_206426 ) ( CLEAR ?auto_206420 ) ( HOLDING ?auto_206421 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_206421 )
      ( MAKE-2PILE ?auto_206418 ?auto_206419 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_206427 - BLOCK
      ?auto_206428 - BLOCK
    )
    :vars
    (
      ?auto_206433 - BLOCK
      ?auto_206432 - BLOCK
      ?auto_206430 - BLOCK
      ?auto_206429 - BLOCK
      ?auto_206434 - BLOCK
      ?auto_206431 - BLOCK
      ?auto_206435 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_206427 ?auto_206428 ) ) ( not ( = ?auto_206427 ?auto_206433 ) ) ( not ( = ?auto_206428 ?auto_206433 ) ) ( not ( = ?auto_206432 ?auto_206430 ) ) ( not ( = ?auto_206432 ?auto_206429 ) ) ( not ( = ?auto_206432 ?auto_206434 ) ) ( not ( = ?auto_206432 ?auto_206431 ) ) ( not ( = ?auto_206432 ?auto_206433 ) ) ( not ( = ?auto_206432 ?auto_206428 ) ) ( not ( = ?auto_206432 ?auto_206427 ) ) ( not ( = ?auto_206430 ?auto_206429 ) ) ( not ( = ?auto_206430 ?auto_206434 ) ) ( not ( = ?auto_206430 ?auto_206431 ) ) ( not ( = ?auto_206430 ?auto_206433 ) ) ( not ( = ?auto_206430 ?auto_206428 ) ) ( not ( = ?auto_206430 ?auto_206427 ) ) ( not ( = ?auto_206429 ?auto_206434 ) ) ( not ( = ?auto_206429 ?auto_206431 ) ) ( not ( = ?auto_206429 ?auto_206433 ) ) ( not ( = ?auto_206429 ?auto_206428 ) ) ( not ( = ?auto_206429 ?auto_206427 ) ) ( not ( = ?auto_206434 ?auto_206431 ) ) ( not ( = ?auto_206434 ?auto_206433 ) ) ( not ( = ?auto_206434 ?auto_206428 ) ) ( not ( = ?auto_206434 ?auto_206427 ) ) ( not ( = ?auto_206431 ?auto_206433 ) ) ( not ( = ?auto_206431 ?auto_206428 ) ) ( not ( = ?auto_206431 ?auto_206427 ) ) ( ON ?auto_206427 ?auto_206435 ) ( not ( = ?auto_206427 ?auto_206435 ) ) ( not ( = ?auto_206428 ?auto_206435 ) ) ( not ( = ?auto_206433 ?auto_206435 ) ) ( not ( = ?auto_206432 ?auto_206435 ) ) ( not ( = ?auto_206430 ?auto_206435 ) ) ( not ( = ?auto_206429 ?auto_206435 ) ) ( not ( = ?auto_206434 ?auto_206435 ) ) ( not ( = ?auto_206431 ?auto_206435 ) ) ( ON ?auto_206428 ?auto_206427 ) ( ON-TABLE ?auto_206435 ) ( ON ?auto_206433 ?auto_206428 ) ( ON ?auto_206431 ?auto_206433 ) ( ON ?auto_206434 ?auto_206431 ) ( ON ?auto_206429 ?auto_206434 ) ( ON ?auto_206430 ?auto_206429 ) ( ON ?auto_206432 ?auto_206430 ) ( CLEAR ?auto_206432 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_206435 ?auto_206427 ?auto_206428 ?auto_206433 ?auto_206431 ?auto_206434 ?auto_206429 ?auto_206430 )
      ( MAKE-2PILE ?auto_206427 ?auto_206428 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_206441 - BLOCK
      ?auto_206442 - BLOCK
      ?auto_206443 - BLOCK
      ?auto_206444 - BLOCK
      ?auto_206445 - BLOCK
    )
    :vars
    (
      ?auto_206446 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206446 ?auto_206445 ) ( CLEAR ?auto_206446 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_206441 ) ( ON ?auto_206442 ?auto_206441 ) ( ON ?auto_206443 ?auto_206442 ) ( ON ?auto_206444 ?auto_206443 ) ( ON ?auto_206445 ?auto_206444 ) ( not ( = ?auto_206441 ?auto_206442 ) ) ( not ( = ?auto_206441 ?auto_206443 ) ) ( not ( = ?auto_206441 ?auto_206444 ) ) ( not ( = ?auto_206441 ?auto_206445 ) ) ( not ( = ?auto_206441 ?auto_206446 ) ) ( not ( = ?auto_206442 ?auto_206443 ) ) ( not ( = ?auto_206442 ?auto_206444 ) ) ( not ( = ?auto_206442 ?auto_206445 ) ) ( not ( = ?auto_206442 ?auto_206446 ) ) ( not ( = ?auto_206443 ?auto_206444 ) ) ( not ( = ?auto_206443 ?auto_206445 ) ) ( not ( = ?auto_206443 ?auto_206446 ) ) ( not ( = ?auto_206444 ?auto_206445 ) ) ( not ( = ?auto_206444 ?auto_206446 ) ) ( not ( = ?auto_206445 ?auto_206446 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_206446 ?auto_206445 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_206447 - BLOCK
      ?auto_206448 - BLOCK
      ?auto_206449 - BLOCK
      ?auto_206450 - BLOCK
      ?auto_206451 - BLOCK
    )
    :vars
    (
      ?auto_206452 - BLOCK
      ?auto_206453 - BLOCK
      ?auto_206454 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206452 ?auto_206451 ) ( CLEAR ?auto_206452 ) ( ON-TABLE ?auto_206447 ) ( ON ?auto_206448 ?auto_206447 ) ( ON ?auto_206449 ?auto_206448 ) ( ON ?auto_206450 ?auto_206449 ) ( ON ?auto_206451 ?auto_206450 ) ( not ( = ?auto_206447 ?auto_206448 ) ) ( not ( = ?auto_206447 ?auto_206449 ) ) ( not ( = ?auto_206447 ?auto_206450 ) ) ( not ( = ?auto_206447 ?auto_206451 ) ) ( not ( = ?auto_206447 ?auto_206452 ) ) ( not ( = ?auto_206448 ?auto_206449 ) ) ( not ( = ?auto_206448 ?auto_206450 ) ) ( not ( = ?auto_206448 ?auto_206451 ) ) ( not ( = ?auto_206448 ?auto_206452 ) ) ( not ( = ?auto_206449 ?auto_206450 ) ) ( not ( = ?auto_206449 ?auto_206451 ) ) ( not ( = ?auto_206449 ?auto_206452 ) ) ( not ( = ?auto_206450 ?auto_206451 ) ) ( not ( = ?auto_206450 ?auto_206452 ) ) ( not ( = ?auto_206451 ?auto_206452 ) ) ( HOLDING ?auto_206453 ) ( CLEAR ?auto_206454 ) ( not ( = ?auto_206447 ?auto_206453 ) ) ( not ( = ?auto_206447 ?auto_206454 ) ) ( not ( = ?auto_206448 ?auto_206453 ) ) ( not ( = ?auto_206448 ?auto_206454 ) ) ( not ( = ?auto_206449 ?auto_206453 ) ) ( not ( = ?auto_206449 ?auto_206454 ) ) ( not ( = ?auto_206450 ?auto_206453 ) ) ( not ( = ?auto_206450 ?auto_206454 ) ) ( not ( = ?auto_206451 ?auto_206453 ) ) ( not ( = ?auto_206451 ?auto_206454 ) ) ( not ( = ?auto_206452 ?auto_206453 ) ) ( not ( = ?auto_206452 ?auto_206454 ) ) ( not ( = ?auto_206453 ?auto_206454 ) ) )
    :subtasks
    ( ( !STACK ?auto_206453 ?auto_206454 )
      ( MAKE-5PILE ?auto_206447 ?auto_206448 ?auto_206449 ?auto_206450 ?auto_206451 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_206455 - BLOCK
      ?auto_206456 - BLOCK
      ?auto_206457 - BLOCK
      ?auto_206458 - BLOCK
      ?auto_206459 - BLOCK
    )
    :vars
    (
      ?auto_206462 - BLOCK
      ?auto_206461 - BLOCK
      ?auto_206460 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206462 ?auto_206459 ) ( ON-TABLE ?auto_206455 ) ( ON ?auto_206456 ?auto_206455 ) ( ON ?auto_206457 ?auto_206456 ) ( ON ?auto_206458 ?auto_206457 ) ( ON ?auto_206459 ?auto_206458 ) ( not ( = ?auto_206455 ?auto_206456 ) ) ( not ( = ?auto_206455 ?auto_206457 ) ) ( not ( = ?auto_206455 ?auto_206458 ) ) ( not ( = ?auto_206455 ?auto_206459 ) ) ( not ( = ?auto_206455 ?auto_206462 ) ) ( not ( = ?auto_206456 ?auto_206457 ) ) ( not ( = ?auto_206456 ?auto_206458 ) ) ( not ( = ?auto_206456 ?auto_206459 ) ) ( not ( = ?auto_206456 ?auto_206462 ) ) ( not ( = ?auto_206457 ?auto_206458 ) ) ( not ( = ?auto_206457 ?auto_206459 ) ) ( not ( = ?auto_206457 ?auto_206462 ) ) ( not ( = ?auto_206458 ?auto_206459 ) ) ( not ( = ?auto_206458 ?auto_206462 ) ) ( not ( = ?auto_206459 ?auto_206462 ) ) ( CLEAR ?auto_206461 ) ( not ( = ?auto_206455 ?auto_206460 ) ) ( not ( = ?auto_206455 ?auto_206461 ) ) ( not ( = ?auto_206456 ?auto_206460 ) ) ( not ( = ?auto_206456 ?auto_206461 ) ) ( not ( = ?auto_206457 ?auto_206460 ) ) ( not ( = ?auto_206457 ?auto_206461 ) ) ( not ( = ?auto_206458 ?auto_206460 ) ) ( not ( = ?auto_206458 ?auto_206461 ) ) ( not ( = ?auto_206459 ?auto_206460 ) ) ( not ( = ?auto_206459 ?auto_206461 ) ) ( not ( = ?auto_206462 ?auto_206460 ) ) ( not ( = ?auto_206462 ?auto_206461 ) ) ( not ( = ?auto_206460 ?auto_206461 ) ) ( ON ?auto_206460 ?auto_206462 ) ( CLEAR ?auto_206460 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_206455 ?auto_206456 ?auto_206457 ?auto_206458 ?auto_206459 ?auto_206462 )
      ( MAKE-5PILE ?auto_206455 ?auto_206456 ?auto_206457 ?auto_206458 ?auto_206459 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_206463 - BLOCK
      ?auto_206464 - BLOCK
      ?auto_206465 - BLOCK
      ?auto_206466 - BLOCK
      ?auto_206467 - BLOCK
    )
    :vars
    (
      ?auto_206470 - BLOCK
      ?auto_206468 - BLOCK
      ?auto_206469 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206470 ?auto_206467 ) ( ON-TABLE ?auto_206463 ) ( ON ?auto_206464 ?auto_206463 ) ( ON ?auto_206465 ?auto_206464 ) ( ON ?auto_206466 ?auto_206465 ) ( ON ?auto_206467 ?auto_206466 ) ( not ( = ?auto_206463 ?auto_206464 ) ) ( not ( = ?auto_206463 ?auto_206465 ) ) ( not ( = ?auto_206463 ?auto_206466 ) ) ( not ( = ?auto_206463 ?auto_206467 ) ) ( not ( = ?auto_206463 ?auto_206470 ) ) ( not ( = ?auto_206464 ?auto_206465 ) ) ( not ( = ?auto_206464 ?auto_206466 ) ) ( not ( = ?auto_206464 ?auto_206467 ) ) ( not ( = ?auto_206464 ?auto_206470 ) ) ( not ( = ?auto_206465 ?auto_206466 ) ) ( not ( = ?auto_206465 ?auto_206467 ) ) ( not ( = ?auto_206465 ?auto_206470 ) ) ( not ( = ?auto_206466 ?auto_206467 ) ) ( not ( = ?auto_206466 ?auto_206470 ) ) ( not ( = ?auto_206467 ?auto_206470 ) ) ( not ( = ?auto_206463 ?auto_206468 ) ) ( not ( = ?auto_206463 ?auto_206469 ) ) ( not ( = ?auto_206464 ?auto_206468 ) ) ( not ( = ?auto_206464 ?auto_206469 ) ) ( not ( = ?auto_206465 ?auto_206468 ) ) ( not ( = ?auto_206465 ?auto_206469 ) ) ( not ( = ?auto_206466 ?auto_206468 ) ) ( not ( = ?auto_206466 ?auto_206469 ) ) ( not ( = ?auto_206467 ?auto_206468 ) ) ( not ( = ?auto_206467 ?auto_206469 ) ) ( not ( = ?auto_206470 ?auto_206468 ) ) ( not ( = ?auto_206470 ?auto_206469 ) ) ( not ( = ?auto_206468 ?auto_206469 ) ) ( ON ?auto_206468 ?auto_206470 ) ( CLEAR ?auto_206468 ) ( HOLDING ?auto_206469 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_206469 )
      ( MAKE-5PILE ?auto_206463 ?auto_206464 ?auto_206465 ?auto_206466 ?auto_206467 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_206471 - BLOCK
      ?auto_206472 - BLOCK
      ?auto_206473 - BLOCK
      ?auto_206474 - BLOCK
      ?auto_206475 - BLOCK
    )
    :vars
    (
      ?auto_206477 - BLOCK
      ?auto_206478 - BLOCK
      ?auto_206476 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206477 ?auto_206475 ) ( ON-TABLE ?auto_206471 ) ( ON ?auto_206472 ?auto_206471 ) ( ON ?auto_206473 ?auto_206472 ) ( ON ?auto_206474 ?auto_206473 ) ( ON ?auto_206475 ?auto_206474 ) ( not ( = ?auto_206471 ?auto_206472 ) ) ( not ( = ?auto_206471 ?auto_206473 ) ) ( not ( = ?auto_206471 ?auto_206474 ) ) ( not ( = ?auto_206471 ?auto_206475 ) ) ( not ( = ?auto_206471 ?auto_206477 ) ) ( not ( = ?auto_206472 ?auto_206473 ) ) ( not ( = ?auto_206472 ?auto_206474 ) ) ( not ( = ?auto_206472 ?auto_206475 ) ) ( not ( = ?auto_206472 ?auto_206477 ) ) ( not ( = ?auto_206473 ?auto_206474 ) ) ( not ( = ?auto_206473 ?auto_206475 ) ) ( not ( = ?auto_206473 ?auto_206477 ) ) ( not ( = ?auto_206474 ?auto_206475 ) ) ( not ( = ?auto_206474 ?auto_206477 ) ) ( not ( = ?auto_206475 ?auto_206477 ) ) ( not ( = ?auto_206471 ?auto_206478 ) ) ( not ( = ?auto_206471 ?auto_206476 ) ) ( not ( = ?auto_206472 ?auto_206478 ) ) ( not ( = ?auto_206472 ?auto_206476 ) ) ( not ( = ?auto_206473 ?auto_206478 ) ) ( not ( = ?auto_206473 ?auto_206476 ) ) ( not ( = ?auto_206474 ?auto_206478 ) ) ( not ( = ?auto_206474 ?auto_206476 ) ) ( not ( = ?auto_206475 ?auto_206478 ) ) ( not ( = ?auto_206475 ?auto_206476 ) ) ( not ( = ?auto_206477 ?auto_206478 ) ) ( not ( = ?auto_206477 ?auto_206476 ) ) ( not ( = ?auto_206478 ?auto_206476 ) ) ( ON ?auto_206478 ?auto_206477 ) ( ON ?auto_206476 ?auto_206478 ) ( CLEAR ?auto_206476 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_206471 ?auto_206472 ?auto_206473 ?auto_206474 ?auto_206475 ?auto_206477 ?auto_206478 )
      ( MAKE-5PILE ?auto_206471 ?auto_206472 ?auto_206473 ?auto_206474 ?auto_206475 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_206479 - BLOCK
      ?auto_206480 - BLOCK
      ?auto_206481 - BLOCK
      ?auto_206482 - BLOCK
      ?auto_206483 - BLOCK
    )
    :vars
    (
      ?auto_206486 - BLOCK
      ?auto_206484 - BLOCK
      ?auto_206485 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206486 ?auto_206483 ) ( ON-TABLE ?auto_206479 ) ( ON ?auto_206480 ?auto_206479 ) ( ON ?auto_206481 ?auto_206480 ) ( ON ?auto_206482 ?auto_206481 ) ( ON ?auto_206483 ?auto_206482 ) ( not ( = ?auto_206479 ?auto_206480 ) ) ( not ( = ?auto_206479 ?auto_206481 ) ) ( not ( = ?auto_206479 ?auto_206482 ) ) ( not ( = ?auto_206479 ?auto_206483 ) ) ( not ( = ?auto_206479 ?auto_206486 ) ) ( not ( = ?auto_206480 ?auto_206481 ) ) ( not ( = ?auto_206480 ?auto_206482 ) ) ( not ( = ?auto_206480 ?auto_206483 ) ) ( not ( = ?auto_206480 ?auto_206486 ) ) ( not ( = ?auto_206481 ?auto_206482 ) ) ( not ( = ?auto_206481 ?auto_206483 ) ) ( not ( = ?auto_206481 ?auto_206486 ) ) ( not ( = ?auto_206482 ?auto_206483 ) ) ( not ( = ?auto_206482 ?auto_206486 ) ) ( not ( = ?auto_206483 ?auto_206486 ) ) ( not ( = ?auto_206479 ?auto_206484 ) ) ( not ( = ?auto_206479 ?auto_206485 ) ) ( not ( = ?auto_206480 ?auto_206484 ) ) ( not ( = ?auto_206480 ?auto_206485 ) ) ( not ( = ?auto_206481 ?auto_206484 ) ) ( not ( = ?auto_206481 ?auto_206485 ) ) ( not ( = ?auto_206482 ?auto_206484 ) ) ( not ( = ?auto_206482 ?auto_206485 ) ) ( not ( = ?auto_206483 ?auto_206484 ) ) ( not ( = ?auto_206483 ?auto_206485 ) ) ( not ( = ?auto_206486 ?auto_206484 ) ) ( not ( = ?auto_206486 ?auto_206485 ) ) ( not ( = ?auto_206484 ?auto_206485 ) ) ( ON ?auto_206484 ?auto_206486 ) ( HOLDING ?auto_206485 ) ( CLEAR ?auto_206484 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_206479 ?auto_206480 ?auto_206481 ?auto_206482 ?auto_206483 ?auto_206486 ?auto_206484 ?auto_206485 )
      ( MAKE-5PILE ?auto_206479 ?auto_206480 ?auto_206481 ?auto_206482 ?auto_206483 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_206487 - BLOCK
      ?auto_206488 - BLOCK
      ?auto_206489 - BLOCK
      ?auto_206490 - BLOCK
      ?auto_206491 - BLOCK
    )
    :vars
    (
      ?auto_206494 - BLOCK
      ?auto_206492 - BLOCK
      ?auto_206493 - BLOCK
      ?auto_206495 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206494 ?auto_206491 ) ( ON-TABLE ?auto_206487 ) ( ON ?auto_206488 ?auto_206487 ) ( ON ?auto_206489 ?auto_206488 ) ( ON ?auto_206490 ?auto_206489 ) ( ON ?auto_206491 ?auto_206490 ) ( not ( = ?auto_206487 ?auto_206488 ) ) ( not ( = ?auto_206487 ?auto_206489 ) ) ( not ( = ?auto_206487 ?auto_206490 ) ) ( not ( = ?auto_206487 ?auto_206491 ) ) ( not ( = ?auto_206487 ?auto_206494 ) ) ( not ( = ?auto_206488 ?auto_206489 ) ) ( not ( = ?auto_206488 ?auto_206490 ) ) ( not ( = ?auto_206488 ?auto_206491 ) ) ( not ( = ?auto_206488 ?auto_206494 ) ) ( not ( = ?auto_206489 ?auto_206490 ) ) ( not ( = ?auto_206489 ?auto_206491 ) ) ( not ( = ?auto_206489 ?auto_206494 ) ) ( not ( = ?auto_206490 ?auto_206491 ) ) ( not ( = ?auto_206490 ?auto_206494 ) ) ( not ( = ?auto_206491 ?auto_206494 ) ) ( not ( = ?auto_206487 ?auto_206492 ) ) ( not ( = ?auto_206487 ?auto_206493 ) ) ( not ( = ?auto_206488 ?auto_206492 ) ) ( not ( = ?auto_206488 ?auto_206493 ) ) ( not ( = ?auto_206489 ?auto_206492 ) ) ( not ( = ?auto_206489 ?auto_206493 ) ) ( not ( = ?auto_206490 ?auto_206492 ) ) ( not ( = ?auto_206490 ?auto_206493 ) ) ( not ( = ?auto_206491 ?auto_206492 ) ) ( not ( = ?auto_206491 ?auto_206493 ) ) ( not ( = ?auto_206494 ?auto_206492 ) ) ( not ( = ?auto_206494 ?auto_206493 ) ) ( not ( = ?auto_206492 ?auto_206493 ) ) ( ON ?auto_206492 ?auto_206494 ) ( CLEAR ?auto_206492 ) ( ON ?auto_206493 ?auto_206495 ) ( CLEAR ?auto_206493 ) ( HAND-EMPTY ) ( not ( = ?auto_206487 ?auto_206495 ) ) ( not ( = ?auto_206488 ?auto_206495 ) ) ( not ( = ?auto_206489 ?auto_206495 ) ) ( not ( = ?auto_206490 ?auto_206495 ) ) ( not ( = ?auto_206491 ?auto_206495 ) ) ( not ( = ?auto_206494 ?auto_206495 ) ) ( not ( = ?auto_206492 ?auto_206495 ) ) ( not ( = ?auto_206493 ?auto_206495 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_206493 ?auto_206495 )
      ( MAKE-5PILE ?auto_206487 ?auto_206488 ?auto_206489 ?auto_206490 ?auto_206491 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_206496 - BLOCK
      ?auto_206497 - BLOCK
      ?auto_206498 - BLOCK
      ?auto_206499 - BLOCK
      ?auto_206500 - BLOCK
    )
    :vars
    (
      ?auto_206502 - BLOCK
      ?auto_206501 - BLOCK
      ?auto_206503 - BLOCK
      ?auto_206504 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206502 ?auto_206500 ) ( ON-TABLE ?auto_206496 ) ( ON ?auto_206497 ?auto_206496 ) ( ON ?auto_206498 ?auto_206497 ) ( ON ?auto_206499 ?auto_206498 ) ( ON ?auto_206500 ?auto_206499 ) ( not ( = ?auto_206496 ?auto_206497 ) ) ( not ( = ?auto_206496 ?auto_206498 ) ) ( not ( = ?auto_206496 ?auto_206499 ) ) ( not ( = ?auto_206496 ?auto_206500 ) ) ( not ( = ?auto_206496 ?auto_206502 ) ) ( not ( = ?auto_206497 ?auto_206498 ) ) ( not ( = ?auto_206497 ?auto_206499 ) ) ( not ( = ?auto_206497 ?auto_206500 ) ) ( not ( = ?auto_206497 ?auto_206502 ) ) ( not ( = ?auto_206498 ?auto_206499 ) ) ( not ( = ?auto_206498 ?auto_206500 ) ) ( not ( = ?auto_206498 ?auto_206502 ) ) ( not ( = ?auto_206499 ?auto_206500 ) ) ( not ( = ?auto_206499 ?auto_206502 ) ) ( not ( = ?auto_206500 ?auto_206502 ) ) ( not ( = ?auto_206496 ?auto_206501 ) ) ( not ( = ?auto_206496 ?auto_206503 ) ) ( not ( = ?auto_206497 ?auto_206501 ) ) ( not ( = ?auto_206497 ?auto_206503 ) ) ( not ( = ?auto_206498 ?auto_206501 ) ) ( not ( = ?auto_206498 ?auto_206503 ) ) ( not ( = ?auto_206499 ?auto_206501 ) ) ( not ( = ?auto_206499 ?auto_206503 ) ) ( not ( = ?auto_206500 ?auto_206501 ) ) ( not ( = ?auto_206500 ?auto_206503 ) ) ( not ( = ?auto_206502 ?auto_206501 ) ) ( not ( = ?auto_206502 ?auto_206503 ) ) ( not ( = ?auto_206501 ?auto_206503 ) ) ( ON ?auto_206503 ?auto_206504 ) ( CLEAR ?auto_206503 ) ( not ( = ?auto_206496 ?auto_206504 ) ) ( not ( = ?auto_206497 ?auto_206504 ) ) ( not ( = ?auto_206498 ?auto_206504 ) ) ( not ( = ?auto_206499 ?auto_206504 ) ) ( not ( = ?auto_206500 ?auto_206504 ) ) ( not ( = ?auto_206502 ?auto_206504 ) ) ( not ( = ?auto_206501 ?auto_206504 ) ) ( not ( = ?auto_206503 ?auto_206504 ) ) ( HOLDING ?auto_206501 ) ( CLEAR ?auto_206502 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_206496 ?auto_206497 ?auto_206498 ?auto_206499 ?auto_206500 ?auto_206502 ?auto_206501 )
      ( MAKE-5PILE ?auto_206496 ?auto_206497 ?auto_206498 ?auto_206499 ?auto_206500 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_206505 - BLOCK
      ?auto_206506 - BLOCK
      ?auto_206507 - BLOCK
      ?auto_206508 - BLOCK
      ?auto_206509 - BLOCK
    )
    :vars
    (
      ?auto_206512 - BLOCK
      ?auto_206510 - BLOCK
      ?auto_206511 - BLOCK
      ?auto_206513 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206512 ?auto_206509 ) ( ON-TABLE ?auto_206505 ) ( ON ?auto_206506 ?auto_206505 ) ( ON ?auto_206507 ?auto_206506 ) ( ON ?auto_206508 ?auto_206507 ) ( ON ?auto_206509 ?auto_206508 ) ( not ( = ?auto_206505 ?auto_206506 ) ) ( not ( = ?auto_206505 ?auto_206507 ) ) ( not ( = ?auto_206505 ?auto_206508 ) ) ( not ( = ?auto_206505 ?auto_206509 ) ) ( not ( = ?auto_206505 ?auto_206512 ) ) ( not ( = ?auto_206506 ?auto_206507 ) ) ( not ( = ?auto_206506 ?auto_206508 ) ) ( not ( = ?auto_206506 ?auto_206509 ) ) ( not ( = ?auto_206506 ?auto_206512 ) ) ( not ( = ?auto_206507 ?auto_206508 ) ) ( not ( = ?auto_206507 ?auto_206509 ) ) ( not ( = ?auto_206507 ?auto_206512 ) ) ( not ( = ?auto_206508 ?auto_206509 ) ) ( not ( = ?auto_206508 ?auto_206512 ) ) ( not ( = ?auto_206509 ?auto_206512 ) ) ( not ( = ?auto_206505 ?auto_206510 ) ) ( not ( = ?auto_206505 ?auto_206511 ) ) ( not ( = ?auto_206506 ?auto_206510 ) ) ( not ( = ?auto_206506 ?auto_206511 ) ) ( not ( = ?auto_206507 ?auto_206510 ) ) ( not ( = ?auto_206507 ?auto_206511 ) ) ( not ( = ?auto_206508 ?auto_206510 ) ) ( not ( = ?auto_206508 ?auto_206511 ) ) ( not ( = ?auto_206509 ?auto_206510 ) ) ( not ( = ?auto_206509 ?auto_206511 ) ) ( not ( = ?auto_206512 ?auto_206510 ) ) ( not ( = ?auto_206512 ?auto_206511 ) ) ( not ( = ?auto_206510 ?auto_206511 ) ) ( ON ?auto_206511 ?auto_206513 ) ( not ( = ?auto_206505 ?auto_206513 ) ) ( not ( = ?auto_206506 ?auto_206513 ) ) ( not ( = ?auto_206507 ?auto_206513 ) ) ( not ( = ?auto_206508 ?auto_206513 ) ) ( not ( = ?auto_206509 ?auto_206513 ) ) ( not ( = ?auto_206512 ?auto_206513 ) ) ( not ( = ?auto_206510 ?auto_206513 ) ) ( not ( = ?auto_206511 ?auto_206513 ) ) ( CLEAR ?auto_206512 ) ( ON ?auto_206510 ?auto_206511 ) ( CLEAR ?auto_206510 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_206513 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_206513 ?auto_206511 )
      ( MAKE-5PILE ?auto_206505 ?auto_206506 ?auto_206507 ?auto_206508 ?auto_206509 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_206532 - BLOCK
      ?auto_206533 - BLOCK
      ?auto_206534 - BLOCK
      ?auto_206535 - BLOCK
      ?auto_206536 - BLOCK
    )
    :vars
    (
      ?auto_206540 - BLOCK
      ?auto_206539 - BLOCK
      ?auto_206537 - BLOCK
      ?auto_206538 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_206532 ) ( ON ?auto_206533 ?auto_206532 ) ( ON ?auto_206534 ?auto_206533 ) ( ON ?auto_206535 ?auto_206534 ) ( not ( = ?auto_206532 ?auto_206533 ) ) ( not ( = ?auto_206532 ?auto_206534 ) ) ( not ( = ?auto_206532 ?auto_206535 ) ) ( not ( = ?auto_206532 ?auto_206536 ) ) ( not ( = ?auto_206532 ?auto_206540 ) ) ( not ( = ?auto_206533 ?auto_206534 ) ) ( not ( = ?auto_206533 ?auto_206535 ) ) ( not ( = ?auto_206533 ?auto_206536 ) ) ( not ( = ?auto_206533 ?auto_206540 ) ) ( not ( = ?auto_206534 ?auto_206535 ) ) ( not ( = ?auto_206534 ?auto_206536 ) ) ( not ( = ?auto_206534 ?auto_206540 ) ) ( not ( = ?auto_206535 ?auto_206536 ) ) ( not ( = ?auto_206535 ?auto_206540 ) ) ( not ( = ?auto_206536 ?auto_206540 ) ) ( not ( = ?auto_206532 ?auto_206539 ) ) ( not ( = ?auto_206532 ?auto_206537 ) ) ( not ( = ?auto_206533 ?auto_206539 ) ) ( not ( = ?auto_206533 ?auto_206537 ) ) ( not ( = ?auto_206534 ?auto_206539 ) ) ( not ( = ?auto_206534 ?auto_206537 ) ) ( not ( = ?auto_206535 ?auto_206539 ) ) ( not ( = ?auto_206535 ?auto_206537 ) ) ( not ( = ?auto_206536 ?auto_206539 ) ) ( not ( = ?auto_206536 ?auto_206537 ) ) ( not ( = ?auto_206540 ?auto_206539 ) ) ( not ( = ?auto_206540 ?auto_206537 ) ) ( not ( = ?auto_206539 ?auto_206537 ) ) ( ON ?auto_206537 ?auto_206538 ) ( not ( = ?auto_206532 ?auto_206538 ) ) ( not ( = ?auto_206533 ?auto_206538 ) ) ( not ( = ?auto_206534 ?auto_206538 ) ) ( not ( = ?auto_206535 ?auto_206538 ) ) ( not ( = ?auto_206536 ?auto_206538 ) ) ( not ( = ?auto_206540 ?auto_206538 ) ) ( not ( = ?auto_206539 ?auto_206538 ) ) ( not ( = ?auto_206537 ?auto_206538 ) ) ( ON ?auto_206539 ?auto_206537 ) ( ON-TABLE ?auto_206538 ) ( ON ?auto_206540 ?auto_206539 ) ( CLEAR ?auto_206540 ) ( HOLDING ?auto_206536 ) ( CLEAR ?auto_206535 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_206532 ?auto_206533 ?auto_206534 ?auto_206535 ?auto_206536 ?auto_206540 )
      ( MAKE-5PILE ?auto_206532 ?auto_206533 ?auto_206534 ?auto_206535 ?auto_206536 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_206541 - BLOCK
      ?auto_206542 - BLOCK
      ?auto_206543 - BLOCK
      ?auto_206544 - BLOCK
      ?auto_206545 - BLOCK
    )
    :vars
    (
      ?auto_206546 - BLOCK
      ?auto_206548 - BLOCK
      ?auto_206549 - BLOCK
      ?auto_206547 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_206541 ) ( ON ?auto_206542 ?auto_206541 ) ( ON ?auto_206543 ?auto_206542 ) ( ON ?auto_206544 ?auto_206543 ) ( not ( = ?auto_206541 ?auto_206542 ) ) ( not ( = ?auto_206541 ?auto_206543 ) ) ( not ( = ?auto_206541 ?auto_206544 ) ) ( not ( = ?auto_206541 ?auto_206545 ) ) ( not ( = ?auto_206541 ?auto_206546 ) ) ( not ( = ?auto_206542 ?auto_206543 ) ) ( not ( = ?auto_206542 ?auto_206544 ) ) ( not ( = ?auto_206542 ?auto_206545 ) ) ( not ( = ?auto_206542 ?auto_206546 ) ) ( not ( = ?auto_206543 ?auto_206544 ) ) ( not ( = ?auto_206543 ?auto_206545 ) ) ( not ( = ?auto_206543 ?auto_206546 ) ) ( not ( = ?auto_206544 ?auto_206545 ) ) ( not ( = ?auto_206544 ?auto_206546 ) ) ( not ( = ?auto_206545 ?auto_206546 ) ) ( not ( = ?auto_206541 ?auto_206548 ) ) ( not ( = ?auto_206541 ?auto_206549 ) ) ( not ( = ?auto_206542 ?auto_206548 ) ) ( not ( = ?auto_206542 ?auto_206549 ) ) ( not ( = ?auto_206543 ?auto_206548 ) ) ( not ( = ?auto_206543 ?auto_206549 ) ) ( not ( = ?auto_206544 ?auto_206548 ) ) ( not ( = ?auto_206544 ?auto_206549 ) ) ( not ( = ?auto_206545 ?auto_206548 ) ) ( not ( = ?auto_206545 ?auto_206549 ) ) ( not ( = ?auto_206546 ?auto_206548 ) ) ( not ( = ?auto_206546 ?auto_206549 ) ) ( not ( = ?auto_206548 ?auto_206549 ) ) ( ON ?auto_206549 ?auto_206547 ) ( not ( = ?auto_206541 ?auto_206547 ) ) ( not ( = ?auto_206542 ?auto_206547 ) ) ( not ( = ?auto_206543 ?auto_206547 ) ) ( not ( = ?auto_206544 ?auto_206547 ) ) ( not ( = ?auto_206545 ?auto_206547 ) ) ( not ( = ?auto_206546 ?auto_206547 ) ) ( not ( = ?auto_206548 ?auto_206547 ) ) ( not ( = ?auto_206549 ?auto_206547 ) ) ( ON ?auto_206548 ?auto_206549 ) ( ON-TABLE ?auto_206547 ) ( ON ?auto_206546 ?auto_206548 ) ( CLEAR ?auto_206544 ) ( ON ?auto_206545 ?auto_206546 ) ( CLEAR ?auto_206545 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_206547 ?auto_206549 ?auto_206548 ?auto_206546 )
      ( MAKE-5PILE ?auto_206541 ?auto_206542 ?auto_206543 ?auto_206544 ?auto_206545 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_206550 - BLOCK
      ?auto_206551 - BLOCK
      ?auto_206552 - BLOCK
      ?auto_206553 - BLOCK
      ?auto_206554 - BLOCK
    )
    :vars
    (
      ?auto_206555 - BLOCK
      ?auto_206558 - BLOCK
      ?auto_206556 - BLOCK
      ?auto_206557 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_206550 ) ( ON ?auto_206551 ?auto_206550 ) ( ON ?auto_206552 ?auto_206551 ) ( not ( = ?auto_206550 ?auto_206551 ) ) ( not ( = ?auto_206550 ?auto_206552 ) ) ( not ( = ?auto_206550 ?auto_206553 ) ) ( not ( = ?auto_206550 ?auto_206554 ) ) ( not ( = ?auto_206550 ?auto_206555 ) ) ( not ( = ?auto_206551 ?auto_206552 ) ) ( not ( = ?auto_206551 ?auto_206553 ) ) ( not ( = ?auto_206551 ?auto_206554 ) ) ( not ( = ?auto_206551 ?auto_206555 ) ) ( not ( = ?auto_206552 ?auto_206553 ) ) ( not ( = ?auto_206552 ?auto_206554 ) ) ( not ( = ?auto_206552 ?auto_206555 ) ) ( not ( = ?auto_206553 ?auto_206554 ) ) ( not ( = ?auto_206553 ?auto_206555 ) ) ( not ( = ?auto_206554 ?auto_206555 ) ) ( not ( = ?auto_206550 ?auto_206558 ) ) ( not ( = ?auto_206550 ?auto_206556 ) ) ( not ( = ?auto_206551 ?auto_206558 ) ) ( not ( = ?auto_206551 ?auto_206556 ) ) ( not ( = ?auto_206552 ?auto_206558 ) ) ( not ( = ?auto_206552 ?auto_206556 ) ) ( not ( = ?auto_206553 ?auto_206558 ) ) ( not ( = ?auto_206553 ?auto_206556 ) ) ( not ( = ?auto_206554 ?auto_206558 ) ) ( not ( = ?auto_206554 ?auto_206556 ) ) ( not ( = ?auto_206555 ?auto_206558 ) ) ( not ( = ?auto_206555 ?auto_206556 ) ) ( not ( = ?auto_206558 ?auto_206556 ) ) ( ON ?auto_206556 ?auto_206557 ) ( not ( = ?auto_206550 ?auto_206557 ) ) ( not ( = ?auto_206551 ?auto_206557 ) ) ( not ( = ?auto_206552 ?auto_206557 ) ) ( not ( = ?auto_206553 ?auto_206557 ) ) ( not ( = ?auto_206554 ?auto_206557 ) ) ( not ( = ?auto_206555 ?auto_206557 ) ) ( not ( = ?auto_206558 ?auto_206557 ) ) ( not ( = ?auto_206556 ?auto_206557 ) ) ( ON ?auto_206558 ?auto_206556 ) ( ON-TABLE ?auto_206557 ) ( ON ?auto_206555 ?auto_206558 ) ( ON ?auto_206554 ?auto_206555 ) ( CLEAR ?auto_206554 ) ( HOLDING ?auto_206553 ) ( CLEAR ?auto_206552 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_206550 ?auto_206551 ?auto_206552 ?auto_206553 )
      ( MAKE-5PILE ?auto_206550 ?auto_206551 ?auto_206552 ?auto_206553 ?auto_206554 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_206559 - BLOCK
      ?auto_206560 - BLOCK
      ?auto_206561 - BLOCK
      ?auto_206562 - BLOCK
      ?auto_206563 - BLOCK
    )
    :vars
    (
      ?auto_206565 - BLOCK
      ?auto_206564 - BLOCK
      ?auto_206566 - BLOCK
      ?auto_206567 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_206559 ) ( ON ?auto_206560 ?auto_206559 ) ( ON ?auto_206561 ?auto_206560 ) ( not ( = ?auto_206559 ?auto_206560 ) ) ( not ( = ?auto_206559 ?auto_206561 ) ) ( not ( = ?auto_206559 ?auto_206562 ) ) ( not ( = ?auto_206559 ?auto_206563 ) ) ( not ( = ?auto_206559 ?auto_206565 ) ) ( not ( = ?auto_206560 ?auto_206561 ) ) ( not ( = ?auto_206560 ?auto_206562 ) ) ( not ( = ?auto_206560 ?auto_206563 ) ) ( not ( = ?auto_206560 ?auto_206565 ) ) ( not ( = ?auto_206561 ?auto_206562 ) ) ( not ( = ?auto_206561 ?auto_206563 ) ) ( not ( = ?auto_206561 ?auto_206565 ) ) ( not ( = ?auto_206562 ?auto_206563 ) ) ( not ( = ?auto_206562 ?auto_206565 ) ) ( not ( = ?auto_206563 ?auto_206565 ) ) ( not ( = ?auto_206559 ?auto_206564 ) ) ( not ( = ?auto_206559 ?auto_206566 ) ) ( not ( = ?auto_206560 ?auto_206564 ) ) ( not ( = ?auto_206560 ?auto_206566 ) ) ( not ( = ?auto_206561 ?auto_206564 ) ) ( not ( = ?auto_206561 ?auto_206566 ) ) ( not ( = ?auto_206562 ?auto_206564 ) ) ( not ( = ?auto_206562 ?auto_206566 ) ) ( not ( = ?auto_206563 ?auto_206564 ) ) ( not ( = ?auto_206563 ?auto_206566 ) ) ( not ( = ?auto_206565 ?auto_206564 ) ) ( not ( = ?auto_206565 ?auto_206566 ) ) ( not ( = ?auto_206564 ?auto_206566 ) ) ( ON ?auto_206566 ?auto_206567 ) ( not ( = ?auto_206559 ?auto_206567 ) ) ( not ( = ?auto_206560 ?auto_206567 ) ) ( not ( = ?auto_206561 ?auto_206567 ) ) ( not ( = ?auto_206562 ?auto_206567 ) ) ( not ( = ?auto_206563 ?auto_206567 ) ) ( not ( = ?auto_206565 ?auto_206567 ) ) ( not ( = ?auto_206564 ?auto_206567 ) ) ( not ( = ?auto_206566 ?auto_206567 ) ) ( ON ?auto_206564 ?auto_206566 ) ( ON-TABLE ?auto_206567 ) ( ON ?auto_206565 ?auto_206564 ) ( ON ?auto_206563 ?auto_206565 ) ( CLEAR ?auto_206561 ) ( ON ?auto_206562 ?auto_206563 ) ( CLEAR ?auto_206562 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_206567 ?auto_206566 ?auto_206564 ?auto_206565 ?auto_206563 )
      ( MAKE-5PILE ?auto_206559 ?auto_206560 ?auto_206561 ?auto_206562 ?auto_206563 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_206568 - BLOCK
      ?auto_206569 - BLOCK
      ?auto_206570 - BLOCK
      ?auto_206571 - BLOCK
      ?auto_206572 - BLOCK
    )
    :vars
    (
      ?auto_206573 - BLOCK
      ?auto_206574 - BLOCK
      ?auto_206575 - BLOCK
      ?auto_206576 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_206568 ) ( ON ?auto_206569 ?auto_206568 ) ( not ( = ?auto_206568 ?auto_206569 ) ) ( not ( = ?auto_206568 ?auto_206570 ) ) ( not ( = ?auto_206568 ?auto_206571 ) ) ( not ( = ?auto_206568 ?auto_206572 ) ) ( not ( = ?auto_206568 ?auto_206573 ) ) ( not ( = ?auto_206569 ?auto_206570 ) ) ( not ( = ?auto_206569 ?auto_206571 ) ) ( not ( = ?auto_206569 ?auto_206572 ) ) ( not ( = ?auto_206569 ?auto_206573 ) ) ( not ( = ?auto_206570 ?auto_206571 ) ) ( not ( = ?auto_206570 ?auto_206572 ) ) ( not ( = ?auto_206570 ?auto_206573 ) ) ( not ( = ?auto_206571 ?auto_206572 ) ) ( not ( = ?auto_206571 ?auto_206573 ) ) ( not ( = ?auto_206572 ?auto_206573 ) ) ( not ( = ?auto_206568 ?auto_206574 ) ) ( not ( = ?auto_206568 ?auto_206575 ) ) ( not ( = ?auto_206569 ?auto_206574 ) ) ( not ( = ?auto_206569 ?auto_206575 ) ) ( not ( = ?auto_206570 ?auto_206574 ) ) ( not ( = ?auto_206570 ?auto_206575 ) ) ( not ( = ?auto_206571 ?auto_206574 ) ) ( not ( = ?auto_206571 ?auto_206575 ) ) ( not ( = ?auto_206572 ?auto_206574 ) ) ( not ( = ?auto_206572 ?auto_206575 ) ) ( not ( = ?auto_206573 ?auto_206574 ) ) ( not ( = ?auto_206573 ?auto_206575 ) ) ( not ( = ?auto_206574 ?auto_206575 ) ) ( ON ?auto_206575 ?auto_206576 ) ( not ( = ?auto_206568 ?auto_206576 ) ) ( not ( = ?auto_206569 ?auto_206576 ) ) ( not ( = ?auto_206570 ?auto_206576 ) ) ( not ( = ?auto_206571 ?auto_206576 ) ) ( not ( = ?auto_206572 ?auto_206576 ) ) ( not ( = ?auto_206573 ?auto_206576 ) ) ( not ( = ?auto_206574 ?auto_206576 ) ) ( not ( = ?auto_206575 ?auto_206576 ) ) ( ON ?auto_206574 ?auto_206575 ) ( ON-TABLE ?auto_206576 ) ( ON ?auto_206573 ?auto_206574 ) ( ON ?auto_206572 ?auto_206573 ) ( ON ?auto_206571 ?auto_206572 ) ( CLEAR ?auto_206571 ) ( HOLDING ?auto_206570 ) ( CLEAR ?auto_206569 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_206568 ?auto_206569 ?auto_206570 )
      ( MAKE-5PILE ?auto_206568 ?auto_206569 ?auto_206570 ?auto_206571 ?auto_206572 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_206577 - BLOCK
      ?auto_206578 - BLOCK
      ?auto_206579 - BLOCK
      ?auto_206580 - BLOCK
      ?auto_206581 - BLOCK
    )
    :vars
    (
      ?auto_206585 - BLOCK
      ?auto_206584 - BLOCK
      ?auto_206582 - BLOCK
      ?auto_206583 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_206577 ) ( ON ?auto_206578 ?auto_206577 ) ( not ( = ?auto_206577 ?auto_206578 ) ) ( not ( = ?auto_206577 ?auto_206579 ) ) ( not ( = ?auto_206577 ?auto_206580 ) ) ( not ( = ?auto_206577 ?auto_206581 ) ) ( not ( = ?auto_206577 ?auto_206585 ) ) ( not ( = ?auto_206578 ?auto_206579 ) ) ( not ( = ?auto_206578 ?auto_206580 ) ) ( not ( = ?auto_206578 ?auto_206581 ) ) ( not ( = ?auto_206578 ?auto_206585 ) ) ( not ( = ?auto_206579 ?auto_206580 ) ) ( not ( = ?auto_206579 ?auto_206581 ) ) ( not ( = ?auto_206579 ?auto_206585 ) ) ( not ( = ?auto_206580 ?auto_206581 ) ) ( not ( = ?auto_206580 ?auto_206585 ) ) ( not ( = ?auto_206581 ?auto_206585 ) ) ( not ( = ?auto_206577 ?auto_206584 ) ) ( not ( = ?auto_206577 ?auto_206582 ) ) ( not ( = ?auto_206578 ?auto_206584 ) ) ( not ( = ?auto_206578 ?auto_206582 ) ) ( not ( = ?auto_206579 ?auto_206584 ) ) ( not ( = ?auto_206579 ?auto_206582 ) ) ( not ( = ?auto_206580 ?auto_206584 ) ) ( not ( = ?auto_206580 ?auto_206582 ) ) ( not ( = ?auto_206581 ?auto_206584 ) ) ( not ( = ?auto_206581 ?auto_206582 ) ) ( not ( = ?auto_206585 ?auto_206584 ) ) ( not ( = ?auto_206585 ?auto_206582 ) ) ( not ( = ?auto_206584 ?auto_206582 ) ) ( ON ?auto_206582 ?auto_206583 ) ( not ( = ?auto_206577 ?auto_206583 ) ) ( not ( = ?auto_206578 ?auto_206583 ) ) ( not ( = ?auto_206579 ?auto_206583 ) ) ( not ( = ?auto_206580 ?auto_206583 ) ) ( not ( = ?auto_206581 ?auto_206583 ) ) ( not ( = ?auto_206585 ?auto_206583 ) ) ( not ( = ?auto_206584 ?auto_206583 ) ) ( not ( = ?auto_206582 ?auto_206583 ) ) ( ON ?auto_206584 ?auto_206582 ) ( ON-TABLE ?auto_206583 ) ( ON ?auto_206585 ?auto_206584 ) ( ON ?auto_206581 ?auto_206585 ) ( ON ?auto_206580 ?auto_206581 ) ( CLEAR ?auto_206578 ) ( ON ?auto_206579 ?auto_206580 ) ( CLEAR ?auto_206579 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_206583 ?auto_206582 ?auto_206584 ?auto_206585 ?auto_206581 ?auto_206580 )
      ( MAKE-5PILE ?auto_206577 ?auto_206578 ?auto_206579 ?auto_206580 ?auto_206581 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_206586 - BLOCK
      ?auto_206587 - BLOCK
      ?auto_206588 - BLOCK
      ?auto_206589 - BLOCK
      ?auto_206590 - BLOCK
    )
    :vars
    (
      ?auto_206591 - BLOCK
      ?auto_206592 - BLOCK
      ?auto_206594 - BLOCK
      ?auto_206593 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_206586 ) ( not ( = ?auto_206586 ?auto_206587 ) ) ( not ( = ?auto_206586 ?auto_206588 ) ) ( not ( = ?auto_206586 ?auto_206589 ) ) ( not ( = ?auto_206586 ?auto_206590 ) ) ( not ( = ?auto_206586 ?auto_206591 ) ) ( not ( = ?auto_206587 ?auto_206588 ) ) ( not ( = ?auto_206587 ?auto_206589 ) ) ( not ( = ?auto_206587 ?auto_206590 ) ) ( not ( = ?auto_206587 ?auto_206591 ) ) ( not ( = ?auto_206588 ?auto_206589 ) ) ( not ( = ?auto_206588 ?auto_206590 ) ) ( not ( = ?auto_206588 ?auto_206591 ) ) ( not ( = ?auto_206589 ?auto_206590 ) ) ( not ( = ?auto_206589 ?auto_206591 ) ) ( not ( = ?auto_206590 ?auto_206591 ) ) ( not ( = ?auto_206586 ?auto_206592 ) ) ( not ( = ?auto_206586 ?auto_206594 ) ) ( not ( = ?auto_206587 ?auto_206592 ) ) ( not ( = ?auto_206587 ?auto_206594 ) ) ( not ( = ?auto_206588 ?auto_206592 ) ) ( not ( = ?auto_206588 ?auto_206594 ) ) ( not ( = ?auto_206589 ?auto_206592 ) ) ( not ( = ?auto_206589 ?auto_206594 ) ) ( not ( = ?auto_206590 ?auto_206592 ) ) ( not ( = ?auto_206590 ?auto_206594 ) ) ( not ( = ?auto_206591 ?auto_206592 ) ) ( not ( = ?auto_206591 ?auto_206594 ) ) ( not ( = ?auto_206592 ?auto_206594 ) ) ( ON ?auto_206594 ?auto_206593 ) ( not ( = ?auto_206586 ?auto_206593 ) ) ( not ( = ?auto_206587 ?auto_206593 ) ) ( not ( = ?auto_206588 ?auto_206593 ) ) ( not ( = ?auto_206589 ?auto_206593 ) ) ( not ( = ?auto_206590 ?auto_206593 ) ) ( not ( = ?auto_206591 ?auto_206593 ) ) ( not ( = ?auto_206592 ?auto_206593 ) ) ( not ( = ?auto_206594 ?auto_206593 ) ) ( ON ?auto_206592 ?auto_206594 ) ( ON-TABLE ?auto_206593 ) ( ON ?auto_206591 ?auto_206592 ) ( ON ?auto_206590 ?auto_206591 ) ( ON ?auto_206589 ?auto_206590 ) ( ON ?auto_206588 ?auto_206589 ) ( CLEAR ?auto_206588 ) ( HOLDING ?auto_206587 ) ( CLEAR ?auto_206586 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_206586 ?auto_206587 )
      ( MAKE-5PILE ?auto_206586 ?auto_206587 ?auto_206588 ?auto_206589 ?auto_206590 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_206595 - BLOCK
      ?auto_206596 - BLOCK
      ?auto_206597 - BLOCK
      ?auto_206598 - BLOCK
      ?auto_206599 - BLOCK
    )
    :vars
    (
      ?auto_206601 - BLOCK
      ?auto_206603 - BLOCK
      ?auto_206600 - BLOCK
      ?auto_206602 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_206595 ) ( not ( = ?auto_206595 ?auto_206596 ) ) ( not ( = ?auto_206595 ?auto_206597 ) ) ( not ( = ?auto_206595 ?auto_206598 ) ) ( not ( = ?auto_206595 ?auto_206599 ) ) ( not ( = ?auto_206595 ?auto_206601 ) ) ( not ( = ?auto_206596 ?auto_206597 ) ) ( not ( = ?auto_206596 ?auto_206598 ) ) ( not ( = ?auto_206596 ?auto_206599 ) ) ( not ( = ?auto_206596 ?auto_206601 ) ) ( not ( = ?auto_206597 ?auto_206598 ) ) ( not ( = ?auto_206597 ?auto_206599 ) ) ( not ( = ?auto_206597 ?auto_206601 ) ) ( not ( = ?auto_206598 ?auto_206599 ) ) ( not ( = ?auto_206598 ?auto_206601 ) ) ( not ( = ?auto_206599 ?auto_206601 ) ) ( not ( = ?auto_206595 ?auto_206603 ) ) ( not ( = ?auto_206595 ?auto_206600 ) ) ( not ( = ?auto_206596 ?auto_206603 ) ) ( not ( = ?auto_206596 ?auto_206600 ) ) ( not ( = ?auto_206597 ?auto_206603 ) ) ( not ( = ?auto_206597 ?auto_206600 ) ) ( not ( = ?auto_206598 ?auto_206603 ) ) ( not ( = ?auto_206598 ?auto_206600 ) ) ( not ( = ?auto_206599 ?auto_206603 ) ) ( not ( = ?auto_206599 ?auto_206600 ) ) ( not ( = ?auto_206601 ?auto_206603 ) ) ( not ( = ?auto_206601 ?auto_206600 ) ) ( not ( = ?auto_206603 ?auto_206600 ) ) ( ON ?auto_206600 ?auto_206602 ) ( not ( = ?auto_206595 ?auto_206602 ) ) ( not ( = ?auto_206596 ?auto_206602 ) ) ( not ( = ?auto_206597 ?auto_206602 ) ) ( not ( = ?auto_206598 ?auto_206602 ) ) ( not ( = ?auto_206599 ?auto_206602 ) ) ( not ( = ?auto_206601 ?auto_206602 ) ) ( not ( = ?auto_206603 ?auto_206602 ) ) ( not ( = ?auto_206600 ?auto_206602 ) ) ( ON ?auto_206603 ?auto_206600 ) ( ON-TABLE ?auto_206602 ) ( ON ?auto_206601 ?auto_206603 ) ( ON ?auto_206599 ?auto_206601 ) ( ON ?auto_206598 ?auto_206599 ) ( ON ?auto_206597 ?auto_206598 ) ( CLEAR ?auto_206595 ) ( ON ?auto_206596 ?auto_206597 ) ( CLEAR ?auto_206596 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_206602 ?auto_206600 ?auto_206603 ?auto_206601 ?auto_206599 ?auto_206598 ?auto_206597 )
      ( MAKE-5PILE ?auto_206595 ?auto_206596 ?auto_206597 ?auto_206598 ?auto_206599 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_206604 - BLOCK
      ?auto_206605 - BLOCK
      ?auto_206606 - BLOCK
      ?auto_206607 - BLOCK
      ?auto_206608 - BLOCK
    )
    :vars
    (
      ?auto_206612 - BLOCK
      ?auto_206611 - BLOCK
      ?auto_206609 - BLOCK
      ?auto_206610 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_206604 ?auto_206605 ) ) ( not ( = ?auto_206604 ?auto_206606 ) ) ( not ( = ?auto_206604 ?auto_206607 ) ) ( not ( = ?auto_206604 ?auto_206608 ) ) ( not ( = ?auto_206604 ?auto_206612 ) ) ( not ( = ?auto_206605 ?auto_206606 ) ) ( not ( = ?auto_206605 ?auto_206607 ) ) ( not ( = ?auto_206605 ?auto_206608 ) ) ( not ( = ?auto_206605 ?auto_206612 ) ) ( not ( = ?auto_206606 ?auto_206607 ) ) ( not ( = ?auto_206606 ?auto_206608 ) ) ( not ( = ?auto_206606 ?auto_206612 ) ) ( not ( = ?auto_206607 ?auto_206608 ) ) ( not ( = ?auto_206607 ?auto_206612 ) ) ( not ( = ?auto_206608 ?auto_206612 ) ) ( not ( = ?auto_206604 ?auto_206611 ) ) ( not ( = ?auto_206604 ?auto_206609 ) ) ( not ( = ?auto_206605 ?auto_206611 ) ) ( not ( = ?auto_206605 ?auto_206609 ) ) ( not ( = ?auto_206606 ?auto_206611 ) ) ( not ( = ?auto_206606 ?auto_206609 ) ) ( not ( = ?auto_206607 ?auto_206611 ) ) ( not ( = ?auto_206607 ?auto_206609 ) ) ( not ( = ?auto_206608 ?auto_206611 ) ) ( not ( = ?auto_206608 ?auto_206609 ) ) ( not ( = ?auto_206612 ?auto_206611 ) ) ( not ( = ?auto_206612 ?auto_206609 ) ) ( not ( = ?auto_206611 ?auto_206609 ) ) ( ON ?auto_206609 ?auto_206610 ) ( not ( = ?auto_206604 ?auto_206610 ) ) ( not ( = ?auto_206605 ?auto_206610 ) ) ( not ( = ?auto_206606 ?auto_206610 ) ) ( not ( = ?auto_206607 ?auto_206610 ) ) ( not ( = ?auto_206608 ?auto_206610 ) ) ( not ( = ?auto_206612 ?auto_206610 ) ) ( not ( = ?auto_206611 ?auto_206610 ) ) ( not ( = ?auto_206609 ?auto_206610 ) ) ( ON ?auto_206611 ?auto_206609 ) ( ON-TABLE ?auto_206610 ) ( ON ?auto_206612 ?auto_206611 ) ( ON ?auto_206608 ?auto_206612 ) ( ON ?auto_206607 ?auto_206608 ) ( ON ?auto_206606 ?auto_206607 ) ( ON ?auto_206605 ?auto_206606 ) ( CLEAR ?auto_206605 ) ( HOLDING ?auto_206604 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_206604 )
      ( MAKE-5PILE ?auto_206604 ?auto_206605 ?auto_206606 ?auto_206607 ?auto_206608 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_206613 - BLOCK
      ?auto_206614 - BLOCK
      ?auto_206615 - BLOCK
      ?auto_206616 - BLOCK
      ?auto_206617 - BLOCK
    )
    :vars
    (
      ?auto_206618 - BLOCK
      ?auto_206620 - BLOCK
      ?auto_206621 - BLOCK
      ?auto_206619 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_206613 ?auto_206614 ) ) ( not ( = ?auto_206613 ?auto_206615 ) ) ( not ( = ?auto_206613 ?auto_206616 ) ) ( not ( = ?auto_206613 ?auto_206617 ) ) ( not ( = ?auto_206613 ?auto_206618 ) ) ( not ( = ?auto_206614 ?auto_206615 ) ) ( not ( = ?auto_206614 ?auto_206616 ) ) ( not ( = ?auto_206614 ?auto_206617 ) ) ( not ( = ?auto_206614 ?auto_206618 ) ) ( not ( = ?auto_206615 ?auto_206616 ) ) ( not ( = ?auto_206615 ?auto_206617 ) ) ( not ( = ?auto_206615 ?auto_206618 ) ) ( not ( = ?auto_206616 ?auto_206617 ) ) ( not ( = ?auto_206616 ?auto_206618 ) ) ( not ( = ?auto_206617 ?auto_206618 ) ) ( not ( = ?auto_206613 ?auto_206620 ) ) ( not ( = ?auto_206613 ?auto_206621 ) ) ( not ( = ?auto_206614 ?auto_206620 ) ) ( not ( = ?auto_206614 ?auto_206621 ) ) ( not ( = ?auto_206615 ?auto_206620 ) ) ( not ( = ?auto_206615 ?auto_206621 ) ) ( not ( = ?auto_206616 ?auto_206620 ) ) ( not ( = ?auto_206616 ?auto_206621 ) ) ( not ( = ?auto_206617 ?auto_206620 ) ) ( not ( = ?auto_206617 ?auto_206621 ) ) ( not ( = ?auto_206618 ?auto_206620 ) ) ( not ( = ?auto_206618 ?auto_206621 ) ) ( not ( = ?auto_206620 ?auto_206621 ) ) ( ON ?auto_206621 ?auto_206619 ) ( not ( = ?auto_206613 ?auto_206619 ) ) ( not ( = ?auto_206614 ?auto_206619 ) ) ( not ( = ?auto_206615 ?auto_206619 ) ) ( not ( = ?auto_206616 ?auto_206619 ) ) ( not ( = ?auto_206617 ?auto_206619 ) ) ( not ( = ?auto_206618 ?auto_206619 ) ) ( not ( = ?auto_206620 ?auto_206619 ) ) ( not ( = ?auto_206621 ?auto_206619 ) ) ( ON ?auto_206620 ?auto_206621 ) ( ON-TABLE ?auto_206619 ) ( ON ?auto_206618 ?auto_206620 ) ( ON ?auto_206617 ?auto_206618 ) ( ON ?auto_206616 ?auto_206617 ) ( ON ?auto_206615 ?auto_206616 ) ( ON ?auto_206614 ?auto_206615 ) ( ON ?auto_206613 ?auto_206614 ) ( CLEAR ?auto_206613 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_206619 ?auto_206621 ?auto_206620 ?auto_206618 ?auto_206617 ?auto_206616 ?auto_206615 ?auto_206614 )
      ( MAKE-5PILE ?auto_206613 ?auto_206614 ?auto_206615 ?auto_206616 ?auto_206617 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_206625 - BLOCK
      ?auto_206626 - BLOCK
      ?auto_206627 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_206627 ) ( CLEAR ?auto_206626 ) ( ON-TABLE ?auto_206625 ) ( ON ?auto_206626 ?auto_206625 ) ( not ( = ?auto_206625 ?auto_206626 ) ) ( not ( = ?auto_206625 ?auto_206627 ) ) ( not ( = ?auto_206626 ?auto_206627 ) ) )
    :subtasks
    ( ( !STACK ?auto_206627 ?auto_206626 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_206628 - BLOCK
      ?auto_206629 - BLOCK
      ?auto_206630 - BLOCK
    )
    :vars
    (
      ?auto_206631 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_206629 ) ( ON-TABLE ?auto_206628 ) ( ON ?auto_206629 ?auto_206628 ) ( not ( = ?auto_206628 ?auto_206629 ) ) ( not ( = ?auto_206628 ?auto_206630 ) ) ( not ( = ?auto_206629 ?auto_206630 ) ) ( ON ?auto_206630 ?auto_206631 ) ( CLEAR ?auto_206630 ) ( HAND-EMPTY ) ( not ( = ?auto_206628 ?auto_206631 ) ) ( not ( = ?auto_206629 ?auto_206631 ) ) ( not ( = ?auto_206630 ?auto_206631 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_206630 ?auto_206631 )
      ( MAKE-3PILE ?auto_206628 ?auto_206629 ?auto_206630 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_206632 - BLOCK
      ?auto_206633 - BLOCK
      ?auto_206634 - BLOCK
    )
    :vars
    (
      ?auto_206635 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_206632 ) ( not ( = ?auto_206632 ?auto_206633 ) ) ( not ( = ?auto_206632 ?auto_206634 ) ) ( not ( = ?auto_206633 ?auto_206634 ) ) ( ON ?auto_206634 ?auto_206635 ) ( CLEAR ?auto_206634 ) ( not ( = ?auto_206632 ?auto_206635 ) ) ( not ( = ?auto_206633 ?auto_206635 ) ) ( not ( = ?auto_206634 ?auto_206635 ) ) ( HOLDING ?auto_206633 ) ( CLEAR ?auto_206632 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_206632 ?auto_206633 )
      ( MAKE-3PILE ?auto_206632 ?auto_206633 ?auto_206634 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_206636 - BLOCK
      ?auto_206637 - BLOCK
      ?auto_206638 - BLOCK
    )
    :vars
    (
      ?auto_206639 - BLOCK
      ?auto_206643 - BLOCK
      ?auto_206641 - BLOCK
      ?auto_206640 - BLOCK
      ?auto_206642 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_206636 ) ( not ( = ?auto_206636 ?auto_206637 ) ) ( not ( = ?auto_206636 ?auto_206638 ) ) ( not ( = ?auto_206637 ?auto_206638 ) ) ( ON ?auto_206638 ?auto_206639 ) ( not ( = ?auto_206636 ?auto_206639 ) ) ( not ( = ?auto_206637 ?auto_206639 ) ) ( not ( = ?auto_206638 ?auto_206639 ) ) ( CLEAR ?auto_206636 ) ( ON ?auto_206637 ?auto_206638 ) ( CLEAR ?auto_206637 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_206643 ) ( ON ?auto_206641 ?auto_206643 ) ( ON ?auto_206640 ?auto_206641 ) ( ON ?auto_206642 ?auto_206640 ) ( ON ?auto_206639 ?auto_206642 ) ( not ( = ?auto_206643 ?auto_206641 ) ) ( not ( = ?auto_206643 ?auto_206640 ) ) ( not ( = ?auto_206643 ?auto_206642 ) ) ( not ( = ?auto_206643 ?auto_206639 ) ) ( not ( = ?auto_206643 ?auto_206638 ) ) ( not ( = ?auto_206643 ?auto_206637 ) ) ( not ( = ?auto_206641 ?auto_206640 ) ) ( not ( = ?auto_206641 ?auto_206642 ) ) ( not ( = ?auto_206641 ?auto_206639 ) ) ( not ( = ?auto_206641 ?auto_206638 ) ) ( not ( = ?auto_206641 ?auto_206637 ) ) ( not ( = ?auto_206640 ?auto_206642 ) ) ( not ( = ?auto_206640 ?auto_206639 ) ) ( not ( = ?auto_206640 ?auto_206638 ) ) ( not ( = ?auto_206640 ?auto_206637 ) ) ( not ( = ?auto_206642 ?auto_206639 ) ) ( not ( = ?auto_206642 ?auto_206638 ) ) ( not ( = ?auto_206642 ?auto_206637 ) ) ( not ( = ?auto_206636 ?auto_206643 ) ) ( not ( = ?auto_206636 ?auto_206641 ) ) ( not ( = ?auto_206636 ?auto_206640 ) ) ( not ( = ?auto_206636 ?auto_206642 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_206643 ?auto_206641 ?auto_206640 ?auto_206642 ?auto_206639 ?auto_206638 )
      ( MAKE-3PILE ?auto_206636 ?auto_206637 ?auto_206638 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_206644 - BLOCK
      ?auto_206645 - BLOCK
      ?auto_206646 - BLOCK
    )
    :vars
    (
      ?auto_206649 - BLOCK
      ?auto_206651 - BLOCK
      ?auto_206650 - BLOCK
      ?auto_206648 - BLOCK
      ?auto_206647 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_206644 ?auto_206645 ) ) ( not ( = ?auto_206644 ?auto_206646 ) ) ( not ( = ?auto_206645 ?auto_206646 ) ) ( ON ?auto_206646 ?auto_206649 ) ( not ( = ?auto_206644 ?auto_206649 ) ) ( not ( = ?auto_206645 ?auto_206649 ) ) ( not ( = ?auto_206646 ?auto_206649 ) ) ( ON ?auto_206645 ?auto_206646 ) ( CLEAR ?auto_206645 ) ( ON-TABLE ?auto_206651 ) ( ON ?auto_206650 ?auto_206651 ) ( ON ?auto_206648 ?auto_206650 ) ( ON ?auto_206647 ?auto_206648 ) ( ON ?auto_206649 ?auto_206647 ) ( not ( = ?auto_206651 ?auto_206650 ) ) ( not ( = ?auto_206651 ?auto_206648 ) ) ( not ( = ?auto_206651 ?auto_206647 ) ) ( not ( = ?auto_206651 ?auto_206649 ) ) ( not ( = ?auto_206651 ?auto_206646 ) ) ( not ( = ?auto_206651 ?auto_206645 ) ) ( not ( = ?auto_206650 ?auto_206648 ) ) ( not ( = ?auto_206650 ?auto_206647 ) ) ( not ( = ?auto_206650 ?auto_206649 ) ) ( not ( = ?auto_206650 ?auto_206646 ) ) ( not ( = ?auto_206650 ?auto_206645 ) ) ( not ( = ?auto_206648 ?auto_206647 ) ) ( not ( = ?auto_206648 ?auto_206649 ) ) ( not ( = ?auto_206648 ?auto_206646 ) ) ( not ( = ?auto_206648 ?auto_206645 ) ) ( not ( = ?auto_206647 ?auto_206649 ) ) ( not ( = ?auto_206647 ?auto_206646 ) ) ( not ( = ?auto_206647 ?auto_206645 ) ) ( not ( = ?auto_206644 ?auto_206651 ) ) ( not ( = ?auto_206644 ?auto_206650 ) ) ( not ( = ?auto_206644 ?auto_206648 ) ) ( not ( = ?auto_206644 ?auto_206647 ) ) ( HOLDING ?auto_206644 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_206644 )
      ( MAKE-3PILE ?auto_206644 ?auto_206645 ?auto_206646 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_206652 - BLOCK
      ?auto_206653 - BLOCK
      ?auto_206654 - BLOCK
    )
    :vars
    (
      ?auto_206658 - BLOCK
      ?auto_206657 - BLOCK
      ?auto_206659 - BLOCK
      ?auto_206655 - BLOCK
      ?auto_206656 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_206652 ?auto_206653 ) ) ( not ( = ?auto_206652 ?auto_206654 ) ) ( not ( = ?auto_206653 ?auto_206654 ) ) ( ON ?auto_206654 ?auto_206658 ) ( not ( = ?auto_206652 ?auto_206658 ) ) ( not ( = ?auto_206653 ?auto_206658 ) ) ( not ( = ?auto_206654 ?auto_206658 ) ) ( ON ?auto_206653 ?auto_206654 ) ( ON-TABLE ?auto_206657 ) ( ON ?auto_206659 ?auto_206657 ) ( ON ?auto_206655 ?auto_206659 ) ( ON ?auto_206656 ?auto_206655 ) ( ON ?auto_206658 ?auto_206656 ) ( not ( = ?auto_206657 ?auto_206659 ) ) ( not ( = ?auto_206657 ?auto_206655 ) ) ( not ( = ?auto_206657 ?auto_206656 ) ) ( not ( = ?auto_206657 ?auto_206658 ) ) ( not ( = ?auto_206657 ?auto_206654 ) ) ( not ( = ?auto_206657 ?auto_206653 ) ) ( not ( = ?auto_206659 ?auto_206655 ) ) ( not ( = ?auto_206659 ?auto_206656 ) ) ( not ( = ?auto_206659 ?auto_206658 ) ) ( not ( = ?auto_206659 ?auto_206654 ) ) ( not ( = ?auto_206659 ?auto_206653 ) ) ( not ( = ?auto_206655 ?auto_206656 ) ) ( not ( = ?auto_206655 ?auto_206658 ) ) ( not ( = ?auto_206655 ?auto_206654 ) ) ( not ( = ?auto_206655 ?auto_206653 ) ) ( not ( = ?auto_206656 ?auto_206658 ) ) ( not ( = ?auto_206656 ?auto_206654 ) ) ( not ( = ?auto_206656 ?auto_206653 ) ) ( not ( = ?auto_206652 ?auto_206657 ) ) ( not ( = ?auto_206652 ?auto_206659 ) ) ( not ( = ?auto_206652 ?auto_206655 ) ) ( not ( = ?auto_206652 ?auto_206656 ) ) ( ON ?auto_206652 ?auto_206653 ) ( CLEAR ?auto_206652 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_206657 ?auto_206659 ?auto_206655 ?auto_206656 ?auto_206658 ?auto_206654 ?auto_206653 )
      ( MAKE-3PILE ?auto_206652 ?auto_206653 ?auto_206654 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_206660 - BLOCK
      ?auto_206661 - BLOCK
      ?auto_206662 - BLOCK
    )
    :vars
    (
      ?auto_206664 - BLOCK
      ?auto_206665 - BLOCK
      ?auto_206666 - BLOCK
      ?auto_206663 - BLOCK
      ?auto_206667 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_206660 ?auto_206661 ) ) ( not ( = ?auto_206660 ?auto_206662 ) ) ( not ( = ?auto_206661 ?auto_206662 ) ) ( ON ?auto_206662 ?auto_206664 ) ( not ( = ?auto_206660 ?auto_206664 ) ) ( not ( = ?auto_206661 ?auto_206664 ) ) ( not ( = ?auto_206662 ?auto_206664 ) ) ( ON ?auto_206661 ?auto_206662 ) ( ON-TABLE ?auto_206665 ) ( ON ?auto_206666 ?auto_206665 ) ( ON ?auto_206663 ?auto_206666 ) ( ON ?auto_206667 ?auto_206663 ) ( ON ?auto_206664 ?auto_206667 ) ( not ( = ?auto_206665 ?auto_206666 ) ) ( not ( = ?auto_206665 ?auto_206663 ) ) ( not ( = ?auto_206665 ?auto_206667 ) ) ( not ( = ?auto_206665 ?auto_206664 ) ) ( not ( = ?auto_206665 ?auto_206662 ) ) ( not ( = ?auto_206665 ?auto_206661 ) ) ( not ( = ?auto_206666 ?auto_206663 ) ) ( not ( = ?auto_206666 ?auto_206667 ) ) ( not ( = ?auto_206666 ?auto_206664 ) ) ( not ( = ?auto_206666 ?auto_206662 ) ) ( not ( = ?auto_206666 ?auto_206661 ) ) ( not ( = ?auto_206663 ?auto_206667 ) ) ( not ( = ?auto_206663 ?auto_206664 ) ) ( not ( = ?auto_206663 ?auto_206662 ) ) ( not ( = ?auto_206663 ?auto_206661 ) ) ( not ( = ?auto_206667 ?auto_206664 ) ) ( not ( = ?auto_206667 ?auto_206662 ) ) ( not ( = ?auto_206667 ?auto_206661 ) ) ( not ( = ?auto_206660 ?auto_206665 ) ) ( not ( = ?auto_206660 ?auto_206666 ) ) ( not ( = ?auto_206660 ?auto_206663 ) ) ( not ( = ?auto_206660 ?auto_206667 ) ) ( HOLDING ?auto_206660 ) ( CLEAR ?auto_206661 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_206665 ?auto_206666 ?auto_206663 ?auto_206667 ?auto_206664 ?auto_206662 ?auto_206661 ?auto_206660 )
      ( MAKE-3PILE ?auto_206660 ?auto_206661 ?auto_206662 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_206668 - BLOCK
      ?auto_206669 - BLOCK
      ?auto_206670 - BLOCK
    )
    :vars
    (
      ?auto_206671 - BLOCK
      ?auto_206673 - BLOCK
      ?auto_206675 - BLOCK
      ?auto_206672 - BLOCK
      ?auto_206674 - BLOCK
      ?auto_206676 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_206668 ?auto_206669 ) ) ( not ( = ?auto_206668 ?auto_206670 ) ) ( not ( = ?auto_206669 ?auto_206670 ) ) ( ON ?auto_206670 ?auto_206671 ) ( not ( = ?auto_206668 ?auto_206671 ) ) ( not ( = ?auto_206669 ?auto_206671 ) ) ( not ( = ?auto_206670 ?auto_206671 ) ) ( ON ?auto_206669 ?auto_206670 ) ( ON-TABLE ?auto_206673 ) ( ON ?auto_206675 ?auto_206673 ) ( ON ?auto_206672 ?auto_206675 ) ( ON ?auto_206674 ?auto_206672 ) ( ON ?auto_206671 ?auto_206674 ) ( not ( = ?auto_206673 ?auto_206675 ) ) ( not ( = ?auto_206673 ?auto_206672 ) ) ( not ( = ?auto_206673 ?auto_206674 ) ) ( not ( = ?auto_206673 ?auto_206671 ) ) ( not ( = ?auto_206673 ?auto_206670 ) ) ( not ( = ?auto_206673 ?auto_206669 ) ) ( not ( = ?auto_206675 ?auto_206672 ) ) ( not ( = ?auto_206675 ?auto_206674 ) ) ( not ( = ?auto_206675 ?auto_206671 ) ) ( not ( = ?auto_206675 ?auto_206670 ) ) ( not ( = ?auto_206675 ?auto_206669 ) ) ( not ( = ?auto_206672 ?auto_206674 ) ) ( not ( = ?auto_206672 ?auto_206671 ) ) ( not ( = ?auto_206672 ?auto_206670 ) ) ( not ( = ?auto_206672 ?auto_206669 ) ) ( not ( = ?auto_206674 ?auto_206671 ) ) ( not ( = ?auto_206674 ?auto_206670 ) ) ( not ( = ?auto_206674 ?auto_206669 ) ) ( not ( = ?auto_206668 ?auto_206673 ) ) ( not ( = ?auto_206668 ?auto_206675 ) ) ( not ( = ?auto_206668 ?auto_206672 ) ) ( not ( = ?auto_206668 ?auto_206674 ) ) ( CLEAR ?auto_206669 ) ( ON ?auto_206668 ?auto_206676 ) ( CLEAR ?auto_206668 ) ( HAND-EMPTY ) ( not ( = ?auto_206668 ?auto_206676 ) ) ( not ( = ?auto_206669 ?auto_206676 ) ) ( not ( = ?auto_206670 ?auto_206676 ) ) ( not ( = ?auto_206671 ?auto_206676 ) ) ( not ( = ?auto_206673 ?auto_206676 ) ) ( not ( = ?auto_206675 ?auto_206676 ) ) ( not ( = ?auto_206672 ?auto_206676 ) ) ( not ( = ?auto_206674 ?auto_206676 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_206668 ?auto_206676 )
      ( MAKE-3PILE ?auto_206668 ?auto_206669 ?auto_206670 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_206677 - BLOCK
      ?auto_206678 - BLOCK
      ?auto_206679 - BLOCK
    )
    :vars
    (
      ?auto_206683 - BLOCK
      ?auto_206682 - BLOCK
      ?auto_206684 - BLOCK
      ?auto_206680 - BLOCK
      ?auto_206685 - BLOCK
      ?auto_206681 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_206677 ?auto_206678 ) ) ( not ( = ?auto_206677 ?auto_206679 ) ) ( not ( = ?auto_206678 ?auto_206679 ) ) ( ON ?auto_206679 ?auto_206683 ) ( not ( = ?auto_206677 ?auto_206683 ) ) ( not ( = ?auto_206678 ?auto_206683 ) ) ( not ( = ?auto_206679 ?auto_206683 ) ) ( ON-TABLE ?auto_206682 ) ( ON ?auto_206684 ?auto_206682 ) ( ON ?auto_206680 ?auto_206684 ) ( ON ?auto_206685 ?auto_206680 ) ( ON ?auto_206683 ?auto_206685 ) ( not ( = ?auto_206682 ?auto_206684 ) ) ( not ( = ?auto_206682 ?auto_206680 ) ) ( not ( = ?auto_206682 ?auto_206685 ) ) ( not ( = ?auto_206682 ?auto_206683 ) ) ( not ( = ?auto_206682 ?auto_206679 ) ) ( not ( = ?auto_206682 ?auto_206678 ) ) ( not ( = ?auto_206684 ?auto_206680 ) ) ( not ( = ?auto_206684 ?auto_206685 ) ) ( not ( = ?auto_206684 ?auto_206683 ) ) ( not ( = ?auto_206684 ?auto_206679 ) ) ( not ( = ?auto_206684 ?auto_206678 ) ) ( not ( = ?auto_206680 ?auto_206685 ) ) ( not ( = ?auto_206680 ?auto_206683 ) ) ( not ( = ?auto_206680 ?auto_206679 ) ) ( not ( = ?auto_206680 ?auto_206678 ) ) ( not ( = ?auto_206685 ?auto_206683 ) ) ( not ( = ?auto_206685 ?auto_206679 ) ) ( not ( = ?auto_206685 ?auto_206678 ) ) ( not ( = ?auto_206677 ?auto_206682 ) ) ( not ( = ?auto_206677 ?auto_206684 ) ) ( not ( = ?auto_206677 ?auto_206680 ) ) ( not ( = ?auto_206677 ?auto_206685 ) ) ( ON ?auto_206677 ?auto_206681 ) ( CLEAR ?auto_206677 ) ( not ( = ?auto_206677 ?auto_206681 ) ) ( not ( = ?auto_206678 ?auto_206681 ) ) ( not ( = ?auto_206679 ?auto_206681 ) ) ( not ( = ?auto_206683 ?auto_206681 ) ) ( not ( = ?auto_206682 ?auto_206681 ) ) ( not ( = ?auto_206684 ?auto_206681 ) ) ( not ( = ?auto_206680 ?auto_206681 ) ) ( not ( = ?auto_206685 ?auto_206681 ) ) ( HOLDING ?auto_206678 ) ( CLEAR ?auto_206679 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_206682 ?auto_206684 ?auto_206680 ?auto_206685 ?auto_206683 ?auto_206679 ?auto_206678 )
      ( MAKE-3PILE ?auto_206677 ?auto_206678 ?auto_206679 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_206686 - BLOCK
      ?auto_206687 - BLOCK
      ?auto_206688 - BLOCK
    )
    :vars
    (
      ?auto_206689 - BLOCK
      ?auto_206690 - BLOCK
      ?auto_206692 - BLOCK
      ?auto_206693 - BLOCK
      ?auto_206694 - BLOCK
      ?auto_206691 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_206686 ?auto_206687 ) ) ( not ( = ?auto_206686 ?auto_206688 ) ) ( not ( = ?auto_206687 ?auto_206688 ) ) ( ON ?auto_206688 ?auto_206689 ) ( not ( = ?auto_206686 ?auto_206689 ) ) ( not ( = ?auto_206687 ?auto_206689 ) ) ( not ( = ?auto_206688 ?auto_206689 ) ) ( ON-TABLE ?auto_206690 ) ( ON ?auto_206692 ?auto_206690 ) ( ON ?auto_206693 ?auto_206692 ) ( ON ?auto_206694 ?auto_206693 ) ( ON ?auto_206689 ?auto_206694 ) ( not ( = ?auto_206690 ?auto_206692 ) ) ( not ( = ?auto_206690 ?auto_206693 ) ) ( not ( = ?auto_206690 ?auto_206694 ) ) ( not ( = ?auto_206690 ?auto_206689 ) ) ( not ( = ?auto_206690 ?auto_206688 ) ) ( not ( = ?auto_206690 ?auto_206687 ) ) ( not ( = ?auto_206692 ?auto_206693 ) ) ( not ( = ?auto_206692 ?auto_206694 ) ) ( not ( = ?auto_206692 ?auto_206689 ) ) ( not ( = ?auto_206692 ?auto_206688 ) ) ( not ( = ?auto_206692 ?auto_206687 ) ) ( not ( = ?auto_206693 ?auto_206694 ) ) ( not ( = ?auto_206693 ?auto_206689 ) ) ( not ( = ?auto_206693 ?auto_206688 ) ) ( not ( = ?auto_206693 ?auto_206687 ) ) ( not ( = ?auto_206694 ?auto_206689 ) ) ( not ( = ?auto_206694 ?auto_206688 ) ) ( not ( = ?auto_206694 ?auto_206687 ) ) ( not ( = ?auto_206686 ?auto_206690 ) ) ( not ( = ?auto_206686 ?auto_206692 ) ) ( not ( = ?auto_206686 ?auto_206693 ) ) ( not ( = ?auto_206686 ?auto_206694 ) ) ( ON ?auto_206686 ?auto_206691 ) ( not ( = ?auto_206686 ?auto_206691 ) ) ( not ( = ?auto_206687 ?auto_206691 ) ) ( not ( = ?auto_206688 ?auto_206691 ) ) ( not ( = ?auto_206689 ?auto_206691 ) ) ( not ( = ?auto_206690 ?auto_206691 ) ) ( not ( = ?auto_206692 ?auto_206691 ) ) ( not ( = ?auto_206693 ?auto_206691 ) ) ( not ( = ?auto_206694 ?auto_206691 ) ) ( CLEAR ?auto_206688 ) ( ON ?auto_206687 ?auto_206686 ) ( CLEAR ?auto_206687 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_206691 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_206691 ?auto_206686 )
      ( MAKE-3PILE ?auto_206686 ?auto_206687 ?auto_206688 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_206695 - BLOCK
      ?auto_206696 - BLOCK
      ?auto_206697 - BLOCK
    )
    :vars
    (
      ?auto_206701 - BLOCK
      ?auto_206700 - BLOCK
      ?auto_206699 - BLOCK
      ?auto_206702 - BLOCK
      ?auto_206703 - BLOCK
      ?auto_206698 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_206695 ?auto_206696 ) ) ( not ( = ?auto_206695 ?auto_206697 ) ) ( not ( = ?auto_206696 ?auto_206697 ) ) ( not ( = ?auto_206695 ?auto_206701 ) ) ( not ( = ?auto_206696 ?auto_206701 ) ) ( not ( = ?auto_206697 ?auto_206701 ) ) ( ON-TABLE ?auto_206700 ) ( ON ?auto_206699 ?auto_206700 ) ( ON ?auto_206702 ?auto_206699 ) ( ON ?auto_206703 ?auto_206702 ) ( ON ?auto_206701 ?auto_206703 ) ( not ( = ?auto_206700 ?auto_206699 ) ) ( not ( = ?auto_206700 ?auto_206702 ) ) ( not ( = ?auto_206700 ?auto_206703 ) ) ( not ( = ?auto_206700 ?auto_206701 ) ) ( not ( = ?auto_206700 ?auto_206697 ) ) ( not ( = ?auto_206700 ?auto_206696 ) ) ( not ( = ?auto_206699 ?auto_206702 ) ) ( not ( = ?auto_206699 ?auto_206703 ) ) ( not ( = ?auto_206699 ?auto_206701 ) ) ( not ( = ?auto_206699 ?auto_206697 ) ) ( not ( = ?auto_206699 ?auto_206696 ) ) ( not ( = ?auto_206702 ?auto_206703 ) ) ( not ( = ?auto_206702 ?auto_206701 ) ) ( not ( = ?auto_206702 ?auto_206697 ) ) ( not ( = ?auto_206702 ?auto_206696 ) ) ( not ( = ?auto_206703 ?auto_206701 ) ) ( not ( = ?auto_206703 ?auto_206697 ) ) ( not ( = ?auto_206703 ?auto_206696 ) ) ( not ( = ?auto_206695 ?auto_206700 ) ) ( not ( = ?auto_206695 ?auto_206699 ) ) ( not ( = ?auto_206695 ?auto_206702 ) ) ( not ( = ?auto_206695 ?auto_206703 ) ) ( ON ?auto_206695 ?auto_206698 ) ( not ( = ?auto_206695 ?auto_206698 ) ) ( not ( = ?auto_206696 ?auto_206698 ) ) ( not ( = ?auto_206697 ?auto_206698 ) ) ( not ( = ?auto_206701 ?auto_206698 ) ) ( not ( = ?auto_206700 ?auto_206698 ) ) ( not ( = ?auto_206699 ?auto_206698 ) ) ( not ( = ?auto_206702 ?auto_206698 ) ) ( not ( = ?auto_206703 ?auto_206698 ) ) ( ON ?auto_206696 ?auto_206695 ) ( CLEAR ?auto_206696 ) ( ON-TABLE ?auto_206698 ) ( HOLDING ?auto_206697 ) ( CLEAR ?auto_206701 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_206700 ?auto_206699 ?auto_206702 ?auto_206703 ?auto_206701 ?auto_206697 )
      ( MAKE-3PILE ?auto_206695 ?auto_206696 ?auto_206697 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_206704 - BLOCK
      ?auto_206705 - BLOCK
      ?auto_206706 - BLOCK
    )
    :vars
    (
      ?auto_206708 - BLOCK
      ?auto_206711 - BLOCK
      ?auto_206712 - BLOCK
      ?auto_206709 - BLOCK
      ?auto_206707 - BLOCK
      ?auto_206710 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_206704 ?auto_206705 ) ) ( not ( = ?auto_206704 ?auto_206706 ) ) ( not ( = ?auto_206705 ?auto_206706 ) ) ( not ( = ?auto_206704 ?auto_206708 ) ) ( not ( = ?auto_206705 ?auto_206708 ) ) ( not ( = ?auto_206706 ?auto_206708 ) ) ( ON-TABLE ?auto_206711 ) ( ON ?auto_206712 ?auto_206711 ) ( ON ?auto_206709 ?auto_206712 ) ( ON ?auto_206707 ?auto_206709 ) ( ON ?auto_206708 ?auto_206707 ) ( not ( = ?auto_206711 ?auto_206712 ) ) ( not ( = ?auto_206711 ?auto_206709 ) ) ( not ( = ?auto_206711 ?auto_206707 ) ) ( not ( = ?auto_206711 ?auto_206708 ) ) ( not ( = ?auto_206711 ?auto_206706 ) ) ( not ( = ?auto_206711 ?auto_206705 ) ) ( not ( = ?auto_206712 ?auto_206709 ) ) ( not ( = ?auto_206712 ?auto_206707 ) ) ( not ( = ?auto_206712 ?auto_206708 ) ) ( not ( = ?auto_206712 ?auto_206706 ) ) ( not ( = ?auto_206712 ?auto_206705 ) ) ( not ( = ?auto_206709 ?auto_206707 ) ) ( not ( = ?auto_206709 ?auto_206708 ) ) ( not ( = ?auto_206709 ?auto_206706 ) ) ( not ( = ?auto_206709 ?auto_206705 ) ) ( not ( = ?auto_206707 ?auto_206708 ) ) ( not ( = ?auto_206707 ?auto_206706 ) ) ( not ( = ?auto_206707 ?auto_206705 ) ) ( not ( = ?auto_206704 ?auto_206711 ) ) ( not ( = ?auto_206704 ?auto_206712 ) ) ( not ( = ?auto_206704 ?auto_206709 ) ) ( not ( = ?auto_206704 ?auto_206707 ) ) ( ON ?auto_206704 ?auto_206710 ) ( not ( = ?auto_206704 ?auto_206710 ) ) ( not ( = ?auto_206705 ?auto_206710 ) ) ( not ( = ?auto_206706 ?auto_206710 ) ) ( not ( = ?auto_206708 ?auto_206710 ) ) ( not ( = ?auto_206711 ?auto_206710 ) ) ( not ( = ?auto_206712 ?auto_206710 ) ) ( not ( = ?auto_206709 ?auto_206710 ) ) ( not ( = ?auto_206707 ?auto_206710 ) ) ( ON ?auto_206705 ?auto_206704 ) ( ON-TABLE ?auto_206710 ) ( CLEAR ?auto_206708 ) ( ON ?auto_206706 ?auto_206705 ) ( CLEAR ?auto_206706 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_206710 ?auto_206704 ?auto_206705 )
      ( MAKE-3PILE ?auto_206704 ?auto_206705 ?auto_206706 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_206713 - BLOCK
      ?auto_206714 - BLOCK
      ?auto_206715 - BLOCK
    )
    :vars
    (
      ?auto_206721 - BLOCK
      ?auto_206718 - BLOCK
      ?auto_206719 - BLOCK
      ?auto_206717 - BLOCK
      ?auto_206716 - BLOCK
      ?auto_206720 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_206713 ?auto_206714 ) ) ( not ( = ?auto_206713 ?auto_206715 ) ) ( not ( = ?auto_206714 ?auto_206715 ) ) ( not ( = ?auto_206713 ?auto_206721 ) ) ( not ( = ?auto_206714 ?auto_206721 ) ) ( not ( = ?auto_206715 ?auto_206721 ) ) ( ON-TABLE ?auto_206718 ) ( ON ?auto_206719 ?auto_206718 ) ( ON ?auto_206717 ?auto_206719 ) ( ON ?auto_206716 ?auto_206717 ) ( not ( = ?auto_206718 ?auto_206719 ) ) ( not ( = ?auto_206718 ?auto_206717 ) ) ( not ( = ?auto_206718 ?auto_206716 ) ) ( not ( = ?auto_206718 ?auto_206721 ) ) ( not ( = ?auto_206718 ?auto_206715 ) ) ( not ( = ?auto_206718 ?auto_206714 ) ) ( not ( = ?auto_206719 ?auto_206717 ) ) ( not ( = ?auto_206719 ?auto_206716 ) ) ( not ( = ?auto_206719 ?auto_206721 ) ) ( not ( = ?auto_206719 ?auto_206715 ) ) ( not ( = ?auto_206719 ?auto_206714 ) ) ( not ( = ?auto_206717 ?auto_206716 ) ) ( not ( = ?auto_206717 ?auto_206721 ) ) ( not ( = ?auto_206717 ?auto_206715 ) ) ( not ( = ?auto_206717 ?auto_206714 ) ) ( not ( = ?auto_206716 ?auto_206721 ) ) ( not ( = ?auto_206716 ?auto_206715 ) ) ( not ( = ?auto_206716 ?auto_206714 ) ) ( not ( = ?auto_206713 ?auto_206718 ) ) ( not ( = ?auto_206713 ?auto_206719 ) ) ( not ( = ?auto_206713 ?auto_206717 ) ) ( not ( = ?auto_206713 ?auto_206716 ) ) ( ON ?auto_206713 ?auto_206720 ) ( not ( = ?auto_206713 ?auto_206720 ) ) ( not ( = ?auto_206714 ?auto_206720 ) ) ( not ( = ?auto_206715 ?auto_206720 ) ) ( not ( = ?auto_206721 ?auto_206720 ) ) ( not ( = ?auto_206718 ?auto_206720 ) ) ( not ( = ?auto_206719 ?auto_206720 ) ) ( not ( = ?auto_206717 ?auto_206720 ) ) ( not ( = ?auto_206716 ?auto_206720 ) ) ( ON ?auto_206714 ?auto_206713 ) ( ON-TABLE ?auto_206720 ) ( ON ?auto_206715 ?auto_206714 ) ( CLEAR ?auto_206715 ) ( HOLDING ?auto_206721 ) ( CLEAR ?auto_206716 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_206718 ?auto_206719 ?auto_206717 ?auto_206716 ?auto_206721 )
      ( MAKE-3PILE ?auto_206713 ?auto_206714 ?auto_206715 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_206722 - BLOCK
      ?auto_206723 - BLOCK
      ?auto_206724 - BLOCK
    )
    :vars
    (
      ?auto_206727 - BLOCK
      ?auto_206730 - BLOCK
      ?auto_206729 - BLOCK
      ?auto_206725 - BLOCK
      ?auto_206726 - BLOCK
      ?auto_206728 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_206722 ?auto_206723 ) ) ( not ( = ?auto_206722 ?auto_206724 ) ) ( not ( = ?auto_206723 ?auto_206724 ) ) ( not ( = ?auto_206722 ?auto_206727 ) ) ( not ( = ?auto_206723 ?auto_206727 ) ) ( not ( = ?auto_206724 ?auto_206727 ) ) ( ON-TABLE ?auto_206730 ) ( ON ?auto_206729 ?auto_206730 ) ( ON ?auto_206725 ?auto_206729 ) ( ON ?auto_206726 ?auto_206725 ) ( not ( = ?auto_206730 ?auto_206729 ) ) ( not ( = ?auto_206730 ?auto_206725 ) ) ( not ( = ?auto_206730 ?auto_206726 ) ) ( not ( = ?auto_206730 ?auto_206727 ) ) ( not ( = ?auto_206730 ?auto_206724 ) ) ( not ( = ?auto_206730 ?auto_206723 ) ) ( not ( = ?auto_206729 ?auto_206725 ) ) ( not ( = ?auto_206729 ?auto_206726 ) ) ( not ( = ?auto_206729 ?auto_206727 ) ) ( not ( = ?auto_206729 ?auto_206724 ) ) ( not ( = ?auto_206729 ?auto_206723 ) ) ( not ( = ?auto_206725 ?auto_206726 ) ) ( not ( = ?auto_206725 ?auto_206727 ) ) ( not ( = ?auto_206725 ?auto_206724 ) ) ( not ( = ?auto_206725 ?auto_206723 ) ) ( not ( = ?auto_206726 ?auto_206727 ) ) ( not ( = ?auto_206726 ?auto_206724 ) ) ( not ( = ?auto_206726 ?auto_206723 ) ) ( not ( = ?auto_206722 ?auto_206730 ) ) ( not ( = ?auto_206722 ?auto_206729 ) ) ( not ( = ?auto_206722 ?auto_206725 ) ) ( not ( = ?auto_206722 ?auto_206726 ) ) ( ON ?auto_206722 ?auto_206728 ) ( not ( = ?auto_206722 ?auto_206728 ) ) ( not ( = ?auto_206723 ?auto_206728 ) ) ( not ( = ?auto_206724 ?auto_206728 ) ) ( not ( = ?auto_206727 ?auto_206728 ) ) ( not ( = ?auto_206730 ?auto_206728 ) ) ( not ( = ?auto_206729 ?auto_206728 ) ) ( not ( = ?auto_206725 ?auto_206728 ) ) ( not ( = ?auto_206726 ?auto_206728 ) ) ( ON ?auto_206723 ?auto_206722 ) ( ON-TABLE ?auto_206728 ) ( ON ?auto_206724 ?auto_206723 ) ( CLEAR ?auto_206726 ) ( ON ?auto_206727 ?auto_206724 ) ( CLEAR ?auto_206727 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_206728 ?auto_206722 ?auto_206723 ?auto_206724 )
      ( MAKE-3PILE ?auto_206722 ?auto_206723 ?auto_206724 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_206731 - BLOCK
      ?auto_206732 - BLOCK
      ?auto_206733 - BLOCK
    )
    :vars
    (
      ?auto_206737 - BLOCK
      ?auto_206739 - BLOCK
      ?auto_206738 - BLOCK
      ?auto_206736 - BLOCK
      ?auto_206734 - BLOCK
      ?auto_206735 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_206731 ?auto_206732 ) ) ( not ( = ?auto_206731 ?auto_206733 ) ) ( not ( = ?auto_206732 ?auto_206733 ) ) ( not ( = ?auto_206731 ?auto_206737 ) ) ( not ( = ?auto_206732 ?auto_206737 ) ) ( not ( = ?auto_206733 ?auto_206737 ) ) ( ON-TABLE ?auto_206739 ) ( ON ?auto_206738 ?auto_206739 ) ( ON ?auto_206736 ?auto_206738 ) ( not ( = ?auto_206739 ?auto_206738 ) ) ( not ( = ?auto_206739 ?auto_206736 ) ) ( not ( = ?auto_206739 ?auto_206734 ) ) ( not ( = ?auto_206739 ?auto_206737 ) ) ( not ( = ?auto_206739 ?auto_206733 ) ) ( not ( = ?auto_206739 ?auto_206732 ) ) ( not ( = ?auto_206738 ?auto_206736 ) ) ( not ( = ?auto_206738 ?auto_206734 ) ) ( not ( = ?auto_206738 ?auto_206737 ) ) ( not ( = ?auto_206738 ?auto_206733 ) ) ( not ( = ?auto_206738 ?auto_206732 ) ) ( not ( = ?auto_206736 ?auto_206734 ) ) ( not ( = ?auto_206736 ?auto_206737 ) ) ( not ( = ?auto_206736 ?auto_206733 ) ) ( not ( = ?auto_206736 ?auto_206732 ) ) ( not ( = ?auto_206734 ?auto_206737 ) ) ( not ( = ?auto_206734 ?auto_206733 ) ) ( not ( = ?auto_206734 ?auto_206732 ) ) ( not ( = ?auto_206731 ?auto_206739 ) ) ( not ( = ?auto_206731 ?auto_206738 ) ) ( not ( = ?auto_206731 ?auto_206736 ) ) ( not ( = ?auto_206731 ?auto_206734 ) ) ( ON ?auto_206731 ?auto_206735 ) ( not ( = ?auto_206731 ?auto_206735 ) ) ( not ( = ?auto_206732 ?auto_206735 ) ) ( not ( = ?auto_206733 ?auto_206735 ) ) ( not ( = ?auto_206737 ?auto_206735 ) ) ( not ( = ?auto_206739 ?auto_206735 ) ) ( not ( = ?auto_206738 ?auto_206735 ) ) ( not ( = ?auto_206736 ?auto_206735 ) ) ( not ( = ?auto_206734 ?auto_206735 ) ) ( ON ?auto_206732 ?auto_206731 ) ( ON-TABLE ?auto_206735 ) ( ON ?auto_206733 ?auto_206732 ) ( ON ?auto_206737 ?auto_206733 ) ( CLEAR ?auto_206737 ) ( HOLDING ?auto_206734 ) ( CLEAR ?auto_206736 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_206739 ?auto_206738 ?auto_206736 ?auto_206734 )
      ( MAKE-3PILE ?auto_206731 ?auto_206732 ?auto_206733 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_206740 - BLOCK
      ?auto_206741 - BLOCK
      ?auto_206742 - BLOCK
    )
    :vars
    (
      ?auto_206746 - BLOCK
      ?auto_206743 - BLOCK
      ?auto_206747 - BLOCK
      ?auto_206744 - BLOCK
      ?auto_206748 - BLOCK
      ?auto_206745 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_206740 ?auto_206741 ) ) ( not ( = ?auto_206740 ?auto_206742 ) ) ( not ( = ?auto_206741 ?auto_206742 ) ) ( not ( = ?auto_206740 ?auto_206746 ) ) ( not ( = ?auto_206741 ?auto_206746 ) ) ( not ( = ?auto_206742 ?auto_206746 ) ) ( ON-TABLE ?auto_206743 ) ( ON ?auto_206747 ?auto_206743 ) ( ON ?auto_206744 ?auto_206747 ) ( not ( = ?auto_206743 ?auto_206747 ) ) ( not ( = ?auto_206743 ?auto_206744 ) ) ( not ( = ?auto_206743 ?auto_206748 ) ) ( not ( = ?auto_206743 ?auto_206746 ) ) ( not ( = ?auto_206743 ?auto_206742 ) ) ( not ( = ?auto_206743 ?auto_206741 ) ) ( not ( = ?auto_206747 ?auto_206744 ) ) ( not ( = ?auto_206747 ?auto_206748 ) ) ( not ( = ?auto_206747 ?auto_206746 ) ) ( not ( = ?auto_206747 ?auto_206742 ) ) ( not ( = ?auto_206747 ?auto_206741 ) ) ( not ( = ?auto_206744 ?auto_206748 ) ) ( not ( = ?auto_206744 ?auto_206746 ) ) ( not ( = ?auto_206744 ?auto_206742 ) ) ( not ( = ?auto_206744 ?auto_206741 ) ) ( not ( = ?auto_206748 ?auto_206746 ) ) ( not ( = ?auto_206748 ?auto_206742 ) ) ( not ( = ?auto_206748 ?auto_206741 ) ) ( not ( = ?auto_206740 ?auto_206743 ) ) ( not ( = ?auto_206740 ?auto_206747 ) ) ( not ( = ?auto_206740 ?auto_206744 ) ) ( not ( = ?auto_206740 ?auto_206748 ) ) ( ON ?auto_206740 ?auto_206745 ) ( not ( = ?auto_206740 ?auto_206745 ) ) ( not ( = ?auto_206741 ?auto_206745 ) ) ( not ( = ?auto_206742 ?auto_206745 ) ) ( not ( = ?auto_206746 ?auto_206745 ) ) ( not ( = ?auto_206743 ?auto_206745 ) ) ( not ( = ?auto_206747 ?auto_206745 ) ) ( not ( = ?auto_206744 ?auto_206745 ) ) ( not ( = ?auto_206748 ?auto_206745 ) ) ( ON ?auto_206741 ?auto_206740 ) ( ON-TABLE ?auto_206745 ) ( ON ?auto_206742 ?auto_206741 ) ( ON ?auto_206746 ?auto_206742 ) ( CLEAR ?auto_206744 ) ( ON ?auto_206748 ?auto_206746 ) ( CLEAR ?auto_206748 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_206745 ?auto_206740 ?auto_206741 ?auto_206742 ?auto_206746 )
      ( MAKE-3PILE ?auto_206740 ?auto_206741 ?auto_206742 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_206749 - BLOCK
      ?auto_206750 - BLOCK
      ?auto_206751 - BLOCK
    )
    :vars
    (
      ?auto_206756 - BLOCK
      ?auto_206757 - BLOCK
      ?auto_206754 - BLOCK
      ?auto_206752 - BLOCK
      ?auto_206755 - BLOCK
      ?auto_206753 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_206749 ?auto_206750 ) ) ( not ( = ?auto_206749 ?auto_206751 ) ) ( not ( = ?auto_206750 ?auto_206751 ) ) ( not ( = ?auto_206749 ?auto_206756 ) ) ( not ( = ?auto_206750 ?auto_206756 ) ) ( not ( = ?auto_206751 ?auto_206756 ) ) ( ON-TABLE ?auto_206757 ) ( ON ?auto_206754 ?auto_206757 ) ( not ( = ?auto_206757 ?auto_206754 ) ) ( not ( = ?auto_206757 ?auto_206752 ) ) ( not ( = ?auto_206757 ?auto_206755 ) ) ( not ( = ?auto_206757 ?auto_206756 ) ) ( not ( = ?auto_206757 ?auto_206751 ) ) ( not ( = ?auto_206757 ?auto_206750 ) ) ( not ( = ?auto_206754 ?auto_206752 ) ) ( not ( = ?auto_206754 ?auto_206755 ) ) ( not ( = ?auto_206754 ?auto_206756 ) ) ( not ( = ?auto_206754 ?auto_206751 ) ) ( not ( = ?auto_206754 ?auto_206750 ) ) ( not ( = ?auto_206752 ?auto_206755 ) ) ( not ( = ?auto_206752 ?auto_206756 ) ) ( not ( = ?auto_206752 ?auto_206751 ) ) ( not ( = ?auto_206752 ?auto_206750 ) ) ( not ( = ?auto_206755 ?auto_206756 ) ) ( not ( = ?auto_206755 ?auto_206751 ) ) ( not ( = ?auto_206755 ?auto_206750 ) ) ( not ( = ?auto_206749 ?auto_206757 ) ) ( not ( = ?auto_206749 ?auto_206754 ) ) ( not ( = ?auto_206749 ?auto_206752 ) ) ( not ( = ?auto_206749 ?auto_206755 ) ) ( ON ?auto_206749 ?auto_206753 ) ( not ( = ?auto_206749 ?auto_206753 ) ) ( not ( = ?auto_206750 ?auto_206753 ) ) ( not ( = ?auto_206751 ?auto_206753 ) ) ( not ( = ?auto_206756 ?auto_206753 ) ) ( not ( = ?auto_206757 ?auto_206753 ) ) ( not ( = ?auto_206754 ?auto_206753 ) ) ( not ( = ?auto_206752 ?auto_206753 ) ) ( not ( = ?auto_206755 ?auto_206753 ) ) ( ON ?auto_206750 ?auto_206749 ) ( ON-TABLE ?auto_206753 ) ( ON ?auto_206751 ?auto_206750 ) ( ON ?auto_206756 ?auto_206751 ) ( ON ?auto_206755 ?auto_206756 ) ( CLEAR ?auto_206755 ) ( HOLDING ?auto_206752 ) ( CLEAR ?auto_206754 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_206757 ?auto_206754 ?auto_206752 )
      ( MAKE-3PILE ?auto_206749 ?auto_206750 ?auto_206751 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_206758 - BLOCK
      ?auto_206759 - BLOCK
      ?auto_206760 - BLOCK
    )
    :vars
    (
      ?auto_206763 - BLOCK
      ?auto_206761 - BLOCK
      ?auto_206764 - BLOCK
      ?auto_206765 - BLOCK
      ?auto_206762 - BLOCK
      ?auto_206766 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_206758 ?auto_206759 ) ) ( not ( = ?auto_206758 ?auto_206760 ) ) ( not ( = ?auto_206759 ?auto_206760 ) ) ( not ( = ?auto_206758 ?auto_206763 ) ) ( not ( = ?auto_206759 ?auto_206763 ) ) ( not ( = ?auto_206760 ?auto_206763 ) ) ( ON-TABLE ?auto_206761 ) ( ON ?auto_206764 ?auto_206761 ) ( not ( = ?auto_206761 ?auto_206764 ) ) ( not ( = ?auto_206761 ?auto_206765 ) ) ( not ( = ?auto_206761 ?auto_206762 ) ) ( not ( = ?auto_206761 ?auto_206763 ) ) ( not ( = ?auto_206761 ?auto_206760 ) ) ( not ( = ?auto_206761 ?auto_206759 ) ) ( not ( = ?auto_206764 ?auto_206765 ) ) ( not ( = ?auto_206764 ?auto_206762 ) ) ( not ( = ?auto_206764 ?auto_206763 ) ) ( not ( = ?auto_206764 ?auto_206760 ) ) ( not ( = ?auto_206764 ?auto_206759 ) ) ( not ( = ?auto_206765 ?auto_206762 ) ) ( not ( = ?auto_206765 ?auto_206763 ) ) ( not ( = ?auto_206765 ?auto_206760 ) ) ( not ( = ?auto_206765 ?auto_206759 ) ) ( not ( = ?auto_206762 ?auto_206763 ) ) ( not ( = ?auto_206762 ?auto_206760 ) ) ( not ( = ?auto_206762 ?auto_206759 ) ) ( not ( = ?auto_206758 ?auto_206761 ) ) ( not ( = ?auto_206758 ?auto_206764 ) ) ( not ( = ?auto_206758 ?auto_206765 ) ) ( not ( = ?auto_206758 ?auto_206762 ) ) ( ON ?auto_206758 ?auto_206766 ) ( not ( = ?auto_206758 ?auto_206766 ) ) ( not ( = ?auto_206759 ?auto_206766 ) ) ( not ( = ?auto_206760 ?auto_206766 ) ) ( not ( = ?auto_206763 ?auto_206766 ) ) ( not ( = ?auto_206761 ?auto_206766 ) ) ( not ( = ?auto_206764 ?auto_206766 ) ) ( not ( = ?auto_206765 ?auto_206766 ) ) ( not ( = ?auto_206762 ?auto_206766 ) ) ( ON ?auto_206759 ?auto_206758 ) ( ON-TABLE ?auto_206766 ) ( ON ?auto_206760 ?auto_206759 ) ( ON ?auto_206763 ?auto_206760 ) ( ON ?auto_206762 ?auto_206763 ) ( CLEAR ?auto_206764 ) ( ON ?auto_206765 ?auto_206762 ) ( CLEAR ?auto_206765 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_206766 ?auto_206758 ?auto_206759 ?auto_206760 ?auto_206763 ?auto_206762 )
      ( MAKE-3PILE ?auto_206758 ?auto_206759 ?auto_206760 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_206767 - BLOCK
      ?auto_206768 - BLOCK
      ?auto_206769 - BLOCK
    )
    :vars
    (
      ?auto_206770 - BLOCK
      ?auto_206773 - BLOCK
      ?auto_206774 - BLOCK
      ?auto_206772 - BLOCK
      ?auto_206775 - BLOCK
      ?auto_206771 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_206767 ?auto_206768 ) ) ( not ( = ?auto_206767 ?auto_206769 ) ) ( not ( = ?auto_206768 ?auto_206769 ) ) ( not ( = ?auto_206767 ?auto_206770 ) ) ( not ( = ?auto_206768 ?auto_206770 ) ) ( not ( = ?auto_206769 ?auto_206770 ) ) ( ON-TABLE ?auto_206773 ) ( not ( = ?auto_206773 ?auto_206774 ) ) ( not ( = ?auto_206773 ?auto_206772 ) ) ( not ( = ?auto_206773 ?auto_206775 ) ) ( not ( = ?auto_206773 ?auto_206770 ) ) ( not ( = ?auto_206773 ?auto_206769 ) ) ( not ( = ?auto_206773 ?auto_206768 ) ) ( not ( = ?auto_206774 ?auto_206772 ) ) ( not ( = ?auto_206774 ?auto_206775 ) ) ( not ( = ?auto_206774 ?auto_206770 ) ) ( not ( = ?auto_206774 ?auto_206769 ) ) ( not ( = ?auto_206774 ?auto_206768 ) ) ( not ( = ?auto_206772 ?auto_206775 ) ) ( not ( = ?auto_206772 ?auto_206770 ) ) ( not ( = ?auto_206772 ?auto_206769 ) ) ( not ( = ?auto_206772 ?auto_206768 ) ) ( not ( = ?auto_206775 ?auto_206770 ) ) ( not ( = ?auto_206775 ?auto_206769 ) ) ( not ( = ?auto_206775 ?auto_206768 ) ) ( not ( = ?auto_206767 ?auto_206773 ) ) ( not ( = ?auto_206767 ?auto_206774 ) ) ( not ( = ?auto_206767 ?auto_206772 ) ) ( not ( = ?auto_206767 ?auto_206775 ) ) ( ON ?auto_206767 ?auto_206771 ) ( not ( = ?auto_206767 ?auto_206771 ) ) ( not ( = ?auto_206768 ?auto_206771 ) ) ( not ( = ?auto_206769 ?auto_206771 ) ) ( not ( = ?auto_206770 ?auto_206771 ) ) ( not ( = ?auto_206773 ?auto_206771 ) ) ( not ( = ?auto_206774 ?auto_206771 ) ) ( not ( = ?auto_206772 ?auto_206771 ) ) ( not ( = ?auto_206775 ?auto_206771 ) ) ( ON ?auto_206768 ?auto_206767 ) ( ON-TABLE ?auto_206771 ) ( ON ?auto_206769 ?auto_206768 ) ( ON ?auto_206770 ?auto_206769 ) ( ON ?auto_206775 ?auto_206770 ) ( ON ?auto_206772 ?auto_206775 ) ( CLEAR ?auto_206772 ) ( HOLDING ?auto_206774 ) ( CLEAR ?auto_206773 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_206773 ?auto_206774 )
      ( MAKE-3PILE ?auto_206767 ?auto_206768 ?auto_206769 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_206776 - BLOCK
      ?auto_206777 - BLOCK
      ?auto_206778 - BLOCK
    )
    :vars
    (
      ?auto_206779 - BLOCK
      ?auto_206780 - BLOCK
      ?auto_206784 - BLOCK
      ?auto_206782 - BLOCK
      ?auto_206781 - BLOCK
      ?auto_206783 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_206776 ?auto_206777 ) ) ( not ( = ?auto_206776 ?auto_206778 ) ) ( not ( = ?auto_206777 ?auto_206778 ) ) ( not ( = ?auto_206776 ?auto_206779 ) ) ( not ( = ?auto_206777 ?auto_206779 ) ) ( not ( = ?auto_206778 ?auto_206779 ) ) ( ON-TABLE ?auto_206780 ) ( not ( = ?auto_206780 ?auto_206784 ) ) ( not ( = ?auto_206780 ?auto_206782 ) ) ( not ( = ?auto_206780 ?auto_206781 ) ) ( not ( = ?auto_206780 ?auto_206779 ) ) ( not ( = ?auto_206780 ?auto_206778 ) ) ( not ( = ?auto_206780 ?auto_206777 ) ) ( not ( = ?auto_206784 ?auto_206782 ) ) ( not ( = ?auto_206784 ?auto_206781 ) ) ( not ( = ?auto_206784 ?auto_206779 ) ) ( not ( = ?auto_206784 ?auto_206778 ) ) ( not ( = ?auto_206784 ?auto_206777 ) ) ( not ( = ?auto_206782 ?auto_206781 ) ) ( not ( = ?auto_206782 ?auto_206779 ) ) ( not ( = ?auto_206782 ?auto_206778 ) ) ( not ( = ?auto_206782 ?auto_206777 ) ) ( not ( = ?auto_206781 ?auto_206779 ) ) ( not ( = ?auto_206781 ?auto_206778 ) ) ( not ( = ?auto_206781 ?auto_206777 ) ) ( not ( = ?auto_206776 ?auto_206780 ) ) ( not ( = ?auto_206776 ?auto_206784 ) ) ( not ( = ?auto_206776 ?auto_206782 ) ) ( not ( = ?auto_206776 ?auto_206781 ) ) ( ON ?auto_206776 ?auto_206783 ) ( not ( = ?auto_206776 ?auto_206783 ) ) ( not ( = ?auto_206777 ?auto_206783 ) ) ( not ( = ?auto_206778 ?auto_206783 ) ) ( not ( = ?auto_206779 ?auto_206783 ) ) ( not ( = ?auto_206780 ?auto_206783 ) ) ( not ( = ?auto_206784 ?auto_206783 ) ) ( not ( = ?auto_206782 ?auto_206783 ) ) ( not ( = ?auto_206781 ?auto_206783 ) ) ( ON ?auto_206777 ?auto_206776 ) ( ON-TABLE ?auto_206783 ) ( ON ?auto_206778 ?auto_206777 ) ( ON ?auto_206779 ?auto_206778 ) ( ON ?auto_206781 ?auto_206779 ) ( ON ?auto_206782 ?auto_206781 ) ( CLEAR ?auto_206780 ) ( ON ?auto_206784 ?auto_206782 ) ( CLEAR ?auto_206784 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_206783 ?auto_206776 ?auto_206777 ?auto_206778 ?auto_206779 ?auto_206781 ?auto_206782 )
      ( MAKE-3PILE ?auto_206776 ?auto_206777 ?auto_206778 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_206785 - BLOCK
      ?auto_206786 - BLOCK
      ?auto_206787 - BLOCK
    )
    :vars
    (
      ?auto_206789 - BLOCK
      ?auto_206792 - BLOCK
      ?auto_206788 - BLOCK
      ?auto_206793 - BLOCK
      ?auto_206790 - BLOCK
      ?auto_206791 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_206785 ?auto_206786 ) ) ( not ( = ?auto_206785 ?auto_206787 ) ) ( not ( = ?auto_206786 ?auto_206787 ) ) ( not ( = ?auto_206785 ?auto_206789 ) ) ( not ( = ?auto_206786 ?auto_206789 ) ) ( not ( = ?auto_206787 ?auto_206789 ) ) ( not ( = ?auto_206792 ?auto_206788 ) ) ( not ( = ?auto_206792 ?auto_206793 ) ) ( not ( = ?auto_206792 ?auto_206790 ) ) ( not ( = ?auto_206792 ?auto_206789 ) ) ( not ( = ?auto_206792 ?auto_206787 ) ) ( not ( = ?auto_206792 ?auto_206786 ) ) ( not ( = ?auto_206788 ?auto_206793 ) ) ( not ( = ?auto_206788 ?auto_206790 ) ) ( not ( = ?auto_206788 ?auto_206789 ) ) ( not ( = ?auto_206788 ?auto_206787 ) ) ( not ( = ?auto_206788 ?auto_206786 ) ) ( not ( = ?auto_206793 ?auto_206790 ) ) ( not ( = ?auto_206793 ?auto_206789 ) ) ( not ( = ?auto_206793 ?auto_206787 ) ) ( not ( = ?auto_206793 ?auto_206786 ) ) ( not ( = ?auto_206790 ?auto_206789 ) ) ( not ( = ?auto_206790 ?auto_206787 ) ) ( not ( = ?auto_206790 ?auto_206786 ) ) ( not ( = ?auto_206785 ?auto_206792 ) ) ( not ( = ?auto_206785 ?auto_206788 ) ) ( not ( = ?auto_206785 ?auto_206793 ) ) ( not ( = ?auto_206785 ?auto_206790 ) ) ( ON ?auto_206785 ?auto_206791 ) ( not ( = ?auto_206785 ?auto_206791 ) ) ( not ( = ?auto_206786 ?auto_206791 ) ) ( not ( = ?auto_206787 ?auto_206791 ) ) ( not ( = ?auto_206789 ?auto_206791 ) ) ( not ( = ?auto_206792 ?auto_206791 ) ) ( not ( = ?auto_206788 ?auto_206791 ) ) ( not ( = ?auto_206793 ?auto_206791 ) ) ( not ( = ?auto_206790 ?auto_206791 ) ) ( ON ?auto_206786 ?auto_206785 ) ( ON-TABLE ?auto_206791 ) ( ON ?auto_206787 ?auto_206786 ) ( ON ?auto_206789 ?auto_206787 ) ( ON ?auto_206790 ?auto_206789 ) ( ON ?auto_206793 ?auto_206790 ) ( ON ?auto_206788 ?auto_206793 ) ( CLEAR ?auto_206788 ) ( HOLDING ?auto_206792 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_206792 )
      ( MAKE-3PILE ?auto_206785 ?auto_206786 ?auto_206787 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_206794 - BLOCK
      ?auto_206795 - BLOCK
      ?auto_206796 - BLOCK
    )
    :vars
    (
      ?auto_206798 - BLOCK
      ?auto_206797 - BLOCK
      ?auto_206802 - BLOCK
      ?auto_206801 - BLOCK
      ?auto_206800 - BLOCK
      ?auto_206799 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_206794 ?auto_206795 ) ) ( not ( = ?auto_206794 ?auto_206796 ) ) ( not ( = ?auto_206795 ?auto_206796 ) ) ( not ( = ?auto_206794 ?auto_206798 ) ) ( not ( = ?auto_206795 ?auto_206798 ) ) ( not ( = ?auto_206796 ?auto_206798 ) ) ( not ( = ?auto_206797 ?auto_206802 ) ) ( not ( = ?auto_206797 ?auto_206801 ) ) ( not ( = ?auto_206797 ?auto_206800 ) ) ( not ( = ?auto_206797 ?auto_206798 ) ) ( not ( = ?auto_206797 ?auto_206796 ) ) ( not ( = ?auto_206797 ?auto_206795 ) ) ( not ( = ?auto_206802 ?auto_206801 ) ) ( not ( = ?auto_206802 ?auto_206800 ) ) ( not ( = ?auto_206802 ?auto_206798 ) ) ( not ( = ?auto_206802 ?auto_206796 ) ) ( not ( = ?auto_206802 ?auto_206795 ) ) ( not ( = ?auto_206801 ?auto_206800 ) ) ( not ( = ?auto_206801 ?auto_206798 ) ) ( not ( = ?auto_206801 ?auto_206796 ) ) ( not ( = ?auto_206801 ?auto_206795 ) ) ( not ( = ?auto_206800 ?auto_206798 ) ) ( not ( = ?auto_206800 ?auto_206796 ) ) ( not ( = ?auto_206800 ?auto_206795 ) ) ( not ( = ?auto_206794 ?auto_206797 ) ) ( not ( = ?auto_206794 ?auto_206802 ) ) ( not ( = ?auto_206794 ?auto_206801 ) ) ( not ( = ?auto_206794 ?auto_206800 ) ) ( ON ?auto_206794 ?auto_206799 ) ( not ( = ?auto_206794 ?auto_206799 ) ) ( not ( = ?auto_206795 ?auto_206799 ) ) ( not ( = ?auto_206796 ?auto_206799 ) ) ( not ( = ?auto_206798 ?auto_206799 ) ) ( not ( = ?auto_206797 ?auto_206799 ) ) ( not ( = ?auto_206802 ?auto_206799 ) ) ( not ( = ?auto_206801 ?auto_206799 ) ) ( not ( = ?auto_206800 ?auto_206799 ) ) ( ON ?auto_206795 ?auto_206794 ) ( ON-TABLE ?auto_206799 ) ( ON ?auto_206796 ?auto_206795 ) ( ON ?auto_206798 ?auto_206796 ) ( ON ?auto_206800 ?auto_206798 ) ( ON ?auto_206801 ?auto_206800 ) ( ON ?auto_206802 ?auto_206801 ) ( ON ?auto_206797 ?auto_206802 ) ( CLEAR ?auto_206797 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_206799 ?auto_206794 ?auto_206795 ?auto_206796 ?auto_206798 ?auto_206800 ?auto_206801 ?auto_206802 )
      ( MAKE-3PILE ?auto_206794 ?auto_206795 ?auto_206796 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_206807 - BLOCK
      ?auto_206808 - BLOCK
      ?auto_206809 - BLOCK
      ?auto_206810 - BLOCK
    )
    :vars
    (
      ?auto_206811 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206811 ?auto_206810 ) ( CLEAR ?auto_206811 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_206807 ) ( ON ?auto_206808 ?auto_206807 ) ( ON ?auto_206809 ?auto_206808 ) ( ON ?auto_206810 ?auto_206809 ) ( not ( = ?auto_206807 ?auto_206808 ) ) ( not ( = ?auto_206807 ?auto_206809 ) ) ( not ( = ?auto_206807 ?auto_206810 ) ) ( not ( = ?auto_206807 ?auto_206811 ) ) ( not ( = ?auto_206808 ?auto_206809 ) ) ( not ( = ?auto_206808 ?auto_206810 ) ) ( not ( = ?auto_206808 ?auto_206811 ) ) ( not ( = ?auto_206809 ?auto_206810 ) ) ( not ( = ?auto_206809 ?auto_206811 ) ) ( not ( = ?auto_206810 ?auto_206811 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_206811 ?auto_206810 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_206812 - BLOCK
      ?auto_206813 - BLOCK
      ?auto_206814 - BLOCK
      ?auto_206815 - BLOCK
    )
    :vars
    (
      ?auto_206816 - BLOCK
      ?auto_206817 - BLOCK
      ?auto_206818 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206816 ?auto_206815 ) ( CLEAR ?auto_206816 ) ( ON-TABLE ?auto_206812 ) ( ON ?auto_206813 ?auto_206812 ) ( ON ?auto_206814 ?auto_206813 ) ( ON ?auto_206815 ?auto_206814 ) ( not ( = ?auto_206812 ?auto_206813 ) ) ( not ( = ?auto_206812 ?auto_206814 ) ) ( not ( = ?auto_206812 ?auto_206815 ) ) ( not ( = ?auto_206812 ?auto_206816 ) ) ( not ( = ?auto_206813 ?auto_206814 ) ) ( not ( = ?auto_206813 ?auto_206815 ) ) ( not ( = ?auto_206813 ?auto_206816 ) ) ( not ( = ?auto_206814 ?auto_206815 ) ) ( not ( = ?auto_206814 ?auto_206816 ) ) ( not ( = ?auto_206815 ?auto_206816 ) ) ( HOLDING ?auto_206817 ) ( CLEAR ?auto_206818 ) ( not ( = ?auto_206812 ?auto_206817 ) ) ( not ( = ?auto_206812 ?auto_206818 ) ) ( not ( = ?auto_206813 ?auto_206817 ) ) ( not ( = ?auto_206813 ?auto_206818 ) ) ( not ( = ?auto_206814 ?auto_206817 ) ) ( not ( = ?auto_206814 ?auto_206818 ) ) ( not ( = ?auto_206815 ?auto_206817 ) ) ( not ( = ?auto_206815 ?auto_206818 ) ) ( not ( = ?auto_206816 ?auto_206817 ) ) ( not ( = ?auto_206816 ?auto_206818 ) ) ( not ( = ?auto_206817 ?auto_206818 ) ) )
    :subtasks
    ( ( !STACK ?auto_206817 ?auto_206818 )
      ( MAKE-4PILE ?auto_206812 ?auto_206813 ?auto_206814 ?auto_206815 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_206819 - BLOCK
      ?auto_206820 - BLOCK
      ?auto_206821 - BLOCK
      ?auto_206822 - BLOCK
    )
    :vars
    (
      ?auto_206825 - BLOCK
      ?auto_206824 - BLOCK
      ?auto_206823 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206825 ?auto_206822 ) ( ON-TABLE ?auto_206819 ) ( ON ?auto_206820 ?auto_206819 ) ( ON ?auto_206821 ?auto_206820 ) ( ON ?auto_206822 ?auto_206821 ) ( not ( = ?auto_206819 ?auto_206820 ) ) ( not ( = ?auto_206819 ?auto_206821 ) ) ( not ( = ?auto_206819 ?auto_206822 ) ) ( not ( = ?auto_206819 ?auto_206825 ) ) ( not ( = ?auto_206820 ?auto_206821 ) ) ( not ( = ?auto_206820 ?auto_206822 ) ) ( not ( = ?auto_206820 ?auto_206825 ) ) ( not ( = ?auto_206821 ?auto_206822 ) ) ( not ( = ?auto_206821 ?auto_206825 ) ) ( not ( = ?auto_206822 ?auto_206825 ) ) ( CLEAR ?auto_206824 ) ( not ( = ?auto_206819 ?auto_206823 ) ) ( not ( = ?auto_206819 ?auto_206824 ) ) ( not ( = ?auto_206820 ?auto_206823 ) ) ( not ( = ?auto_206820 ?auto_206824 ) ) ( not ( = ?auto_206821 ?auto_206823 ) ) ( not ( = ?auto_206821 ?auto_206824 ) ) ( not ( = ?auto_206822 ?auto_206823 ) ) ( not ( = ?auto_206822 ?auto_206824 ) ) ( not ( = ?auto_206825 ?auto_206823 ) ) ( not ( = ?auto_206825 ?auto_206824 ) ) ( not ( = ?auto_206823 ?auto_206824 ) ) ( ON ?auto_206823 ?auto_206825 ) ( CLEAR ?auto_206823 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_206819 ?auto_206820 ?auto_206821 ?auto_206822 ?auto_206825 )
      ( MAKE-4PILE ?auto_206819 ?auto_206820 ?auto_206821 ?auto_206822 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_206826 - BLOCK
      ?auto_206827 - BLOCK
      ?auto_206828 - BLOCK
      ?auto_206829 - BLOCK
    )
    :vars
    (
      ?auto_206831 - BLOCK
      ?auto_206830 - BLOCK
      ?auto_206832 - BLOCK
      ?auto_206833 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206831 ?auto_206829 ) ( ON-TABLE ?auto_206826 ) ( ON ?auto_206827 ?auto_206826 ) ( ON ?auto_206828 ?auto_206827 ) ( ON ?auto_206829 ?auto_206828 ) ( not ( = ?auto_206826 ?auto_206827 ) ) ( not ( = ?auto_206826 ?auto_206828 ) ) ( not ( = ?auto_206826 ?auto_206829 ) ) ( not ( = ?auto_206826 ?auto_206831 ) ) ( not ( = ?auto_206827 ?auto_206828 ) ) ( not ( = ?auto_206827 ?auto_206829 ) ) ( not ( = ?auto_206827 ?auto_206831 ) ) ( not ( = ?auto_206828 ?auto_206829 ) ) ( not ( = ?auto_206828 ?auto_206831 ) ) ( not ( = ?auto_206829 ?auto_206831 ) ) ( not ( = ?auto_206826 ?auto_206830 ) ) ( not ( = ?auto_206826 ?auto_206832 ) ) ( not ( = ?auto_206827 ?auto_206830 ) ) ( not ( = ?auto_206827 ?auto_206832 ) ) ( not ( = ?auto_206828 ?auto_206830 ) ) ( not ( = ?auto_206828 ?auto_206832 ) ) ( not ( = ?auto_206829 ?auto_206830 ) ) ( not ( = ?auto_206829 ?auto_206832 ) ) ( not ( = ?auto_206831 ?auto_206830 ) ) ( not ( = ?auto_206831 ?auto_206832 ) ) ( not ( = ?auto_206830 ?auto_206832 ) ) ( ON ?auto_206830 ?auto_206831 ) ( CLEAR ?auto_206830 ) ( HOLDING ?auto_206832 ) ( CLEAR ?auto_206833 ) ( ON-TABLE ?auto_206833 ) ( not ( = ?auto_206833 ?auto_206832 ) ) ( not ( = ?auto_206826 ?auto_206833 ) ) ( not ( = ?auto_206827 ?auto_206833 ) ) ( not ( = ?auto_206828 ?auto_206833 ) ) ( not ( = ?auto_206829 ?auto_206833 ) ) ( not ( = ?auto_206831 ?auto_206833 ) ) ( not ( = ?auto_206830 ?auto_206833 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_206833 ?auto_206832 )
      ( MAKE-4PILE ?auto_206826 ?auto_206827 ?auto_206828 ?auto_206829 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_206834 - BLOCK
      ?auto_206835 - BLOCK
      ?auto_206836 - BLOCK
      ?auto_206837 - BLOCK
    )
    :vars
    (
      ?auto_206840 - BLOCK
      ?auto_206838 - BLOCK
      ?auto_206839 - BLOCK
      ?auto_206841 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206840 ?auto_206837 ) ( ON-TABLE ?auto_206834 ) ( ON ?auto_206835 ?auto_206834 ) ( ON ?auto_206836 ?auto_206835 ) ( ON ?auto_206837 ?auto_206836 ) ( not ( = ?auto_206834 ?auto_206835 ) ) ( not ( = ?auto_206834 ?auto_206836 ) ) ( not ( = ?auto_206834 ?auto_206837 ) ) ( not ( = ?auto_206834 ?auto_206840 ) ) ( not ( = ?auto_206835 ?auto_206836 ) ) ( not ( = ?auto_206835 ?auto_206837 ) ) ( not ( = ?auto_206835 ?auto_206840 ) ) ( not ( = ?auto_206836 ?auto_206837 ) ) ( not ( = ?auto_206836 ?auto_206840 ) ) ( not ( = ?auto_206837 ?auto_206840 ) ) ( not ( = ?auto_206834 ?auto_206838 ) ) ( not ( = ?auto_206834 ?auto_206839 ) ) ( not ( = ?auto_206835 ?auto_206838 ) ) ( not ( = ?auto_206835 ?auto_206839 ) ) ( not ( = ?auto_206836 ?auto_206838 ) ) ( not ( = ?auto_206836 ?auto_206839 ) ) ( not ( = ?auto_206837 ?auto_206838 ) ) ( not ( = ?auto_206837 ?auto_206839 ) ) ( not ( = ?auto_206840 ?auto_206838 ) ) ( not ( = ?auto_206840 ?auto_206839 ) ) ( not ( = ?auto_206838 ?auto_206839 ) ) ( ON ?auto_206838 ?auto_206840 ) ( CLEAR ?auto_206841 ) ( ON-TABLE ?auto_206841 ) ( not ( = ?auto_206841 ?auto_206839 ) ) ( not ( = ?auto_206834 ?auto_206841 ) ) ( not ( = ?auto_206835 ?auto_206841 ) ) ( not ( = ?auto_206836 ?auto_206841 ) ) ( not ( = ?auto_206837 ?auto_206841 ) ) ( not ( = ?auto_206840 ?auto_206841 ) ) ( not ( = ?auto_206838 ?auto_206841 ) ) ( ON ?auto_206839 ?auto_206838 ) ( CLEAR ?auto_206839 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_206834 ?auto_206835 ?auto_206836 ?auto_206837 ?auto_206840 ?auto_206838 )
      ( MAKE-4PILE ?auto_206834 ?auto_206835 ?auto_206836 ?auto_206837 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_206842 - BLOCK
      ?auto_206843 - BLOCK
      ?auto_206844 - BLOCK
      ?auto_206845 - BLOCK
    )
    :vars
    (
      ?auto_206848 - BLOCK
      ?auto_206847 - BLOCK
      ?auto_206849 - BLOCK
      ?auto_206846 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206848 ?auto_206845 ) ( ON-TABLE ?auto_206842 ) ( ON ?auto_206843 ?auto_206842 ) ( ON ?auto_206844 ?auto_206843 ) ( ON ?auto_206845 ?auto_206844 ) ( not ( = ?auto_206842 ?auto_206843 ) ) ( not ( = ?auto_206842 ?auto_206844 ) ) ( not ( = ?auto_206842 ?auto_206845 ) ) ( not ( = ?auto_206842 ?auto_206848 ) ) ( not ( = ?auto_206843 ?auto_206844 ) ) ( not ( = ?auto_206843 ?auto_206845 ) ) ( not ( = ?auto_206843 ?auto_206848 ) ) ( not ( = ?auto_206844 ?auto_206845 ) ) ( not ( = ?auto_206844 ?auto_206848 ) ) ( not ( = ?auto_206845 ?auto_206848 ) ) ( not ( = ?auto_206842 ?auto_206847 ) ) ( not ( = ?auto_206842 ?auto_206849 ) ) ( not ( = ?auto_206843 ?auto_206847 ) ) ( not ( = ?auto_206843 ?auto_206849 ) ) ( not ( = ?auto_206844 ?auto_206847 ) ) ( not ( = ?auto_206844 ?auto_206849 ) ) ( not ( = ?auto_206845 ?auto_206847 ) ) ( not ( = ?auto_206845 ?auto_206849 ) ) ( not ( = ?auto_206848 ?auto_206847 ) ) ( not ( = ?auto_206848 ?auto_206849 ) ) ( not ( = ?auto_206847 ?auto_206849 ) ) ( ON ?auto_206847 ?auto_206848 ) ( not ( = ?auto_206846 ?auto_206849 ) ) ( not ( = ?auto_206842 ?auto_206846 ) ) ( not ( = ?auto_206843 ?auto_206846 ) ) ( not ( = ?auto_206844 ?auto_206846 ) ) ( not ( = ?auto_206845 ?auto_206846 ) ) ( not ( = ?auto_206848 ?auto_206846 ) ) ( not ( = ?auto_206847 ?auto_206846 ) ) ( ON ?auto_206849 ?auto_206847 ) ( CLEAR ?auto_206849 ) ( HOLDING ?auto_206846 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_206846 )
      ( MAKE-4PILE ?auto_206842 ?auto_206843 ?auto_206844 ?auto_206845 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_206850 - BLOCK
      ?auto_206851 - BLOCK
      ?auto_206852 - BLOCK
      ?auto_206853 - BLOCK
    )
    :vars
    (
      ?auto_206854 - BLOCK
      ?auto_206857 - BLOCK
      ?auto_206855 - BLOCK
      ?auto_206856 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206854 ?auto_206853 ) ( ON-TABLE ?auto_206850 ) ( ON ?auto_206851 ?auto_206850 ) ( ON ?auto_206852 ?auto_206851 ) ( ON ?auto_206853 ?auto_206852 ) ( not ( = ?auto_206850 ?auto_206851 ) ) ( not ( = ?auto_206850 ?auto_206852 ) ) ( not ( = ?auto_206850 ?auto_206853 ) ) ( not ( = ?auto_206850 ?auto_206854 ) ) ( not ( = ?auto_206851 ?auto_206852 ) ) ( not ( = ?auto_206851 ?auto_206853 ) ) ( not ( = ?auto_206851 ?auto_206854 ) ) ( not ( = ?auto_206852 ?auto_206853 ) ) ( not ( = ?auto_206852 ?auto_206854 ) ) ( not ( = ?auto_206853 ?auto_206854 ) ) ( not ( = ?auto_206850 ?auto_206857 ) ) ( not ( = ?auto_206850 ?auto_206855 ) ) ( not ( = ?auto_206851 ?auto_206857 ) ) ( not ( = ?auto_206851 ?auto_206855 ) ) ( not ( = ?auto_206852 ?auto_206857 ) ) ( not ( = ?auto_206852 ?auto_206855 ) ) ( not ( = ?auto_206853 ?auto_206857 ) ) ( not ( = ?auto_206853 ?auto_206855 ) ) ( not ( = ?auto_206854 ?auto_206857 ) ) ( not ( = ?auto_206854 ?auto_206855 ) ) ( not ( = ?auto_206857 ?auto_206855 ) ) ( ON ?auto_206857 ?auto_206854 ) ( not ( = ?auto_206856 ?auto_206855 ) ) ( not ( = ?auto_206850 ?auto_206856 ) ) ( not ( = ?auto_206851 ?auto_206856 ) ) ( not ( = ?auto_206852 ?auto_206856 ) ) ( not ( = ?auto_206853 ?auto_206856 ) ) ( not ( = ?auto_206854 ?auto_206856 ) ) ( not ( = ?auto_206857 ?auto_206856 ) ) ( ON ?auto_206855 ?auto_206857 ) ( ON ?auto_206856 ?auto_206855 ) ( CLEAR ?auto_206856 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_206850 ?auto_206851 ?auto_206852 ?auto_206853 ?auto_206854 ?auto_206857 ?auto_206855 )
      ( MAKE-4PILE ?auto_206850 ?auto_206851 ?auto_206852 ?auto_206853 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_206858 - BLOCK
      ?auto_206859 - BLOCK
      ?auto_206860 - BLOCK
      ?auto_206861 - BLOCK
    )
    :vars
    (
      ?auto_206863 - BLOCK
      ?auto_206864 - BLOCK
      ?auto_206865 - BLOCK
      ?auto_206862 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206863 ?auto_206861 ) ( ON-TABLE ?auto_206858 ) ( ON ?auto_206859 ?auto_206858 ) ( ON ?auto_206860 ?auto_206859 ) ( ON ?auto_206861 ?auto_206860 ) ( not ( = ?auto_206858 ?auto_206859 ) ) ( not ( = ?auto_206858 ?auto_206860 ) ) ( not ( = ?auto_206858 ?auto_206861 ) ) ( not ( = ?auto_206858 ?auto_206863 ) ) ( not ( = ?auto_206859 ?auto_206860 ) ) ( not ( = ?auto_206859 ?auto_206861 ) ) ( not ( = ?auto_206859 ?auto_206863 ) ) ( not ( = ?auto_206860 ?auto_206861 ) ) ( not ( = ?auto_206860 ?auto_206863 ) ) ( not ( = ?auto_206861 ?auto_206863 ) ) ( not ( = ?auto_206858 ?auto_206864 ) ) ( not ( = ?auto_206858 ?auto_206865 ) ) ( not ( = ?auto_206859 ?auto_206864 ) ) ( not ( = ?auto_206859 ?auto_206865 ) ) ( not ( = ?auto_206860 ?auto_206864 ) ) ( not ( = ?auto_206860 ?auto_206865 ) ) ( not ( = ?auto_206861 ?auto_206864 ) ) ( not ( = ?auto_206861 ?auto_206865 ) ) ( not ( = ?auto_206863 ?auto_206864 ) ) ( not ( = ?auto_206863 ?auto_206865 ) ) ( not ( = ?auto_206864 ?auto_206865 ) ) ( ON ?auto_206864 ?auto_206863 ) ( not ( = ?auto_206862 ?auto_206865 ) ) ( not ( = ?auto_206858 ?auto_206862 ) ) ( not ( = ?auto_206859 ?auto_206862 ) ) ( not ( = ?auto_206860 ?auto_206862 ) ) ( not ( = ?auto_206861 ?auto_206862 ) ) ( not ( = ?auto_206863 ?auto_206862 ) ) ( not ( = ?auto_206864 ?auto_206862 ) ) ( ON ?auto_206865 ?auto_206864 ) ( HOLDING ?auto_206862 ) ( CLEAR ?auto_206865 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_206858 ?auto_206859 ?auto_206860 ?auto_206861 ?auto_206863 ?auto_206864 ?auto_206865 ?auto_206862 )
      ( MAKE-4PILE ?auto_206858 ?auto_206859 ?auto_206860 ?auto_206861 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_206866 - BLOCK
      ?auto_206867 - BLOCK
      ?auto_206868 - BLOCK
      ?auto_206869 - BLOCK
    )
    :vars
    (
      ?auto_206872 - BLOCK
      ?auto_206870 - BLOCK
      ?auto_206871 - BLOCK
      ?auto_206873 - BLOCK
      ?auto_206874 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206872 ?auto_206869 ) ( ON-TABLE ?auto_206866 ) ( ON ?auto_206867 ?auto_206866 ) ( ON ?auto_206868 ?auto_206867 ) ( ON ?auto_206869 ?auto_206868 ) ( not ( = ?auto_206866 ?auto_206867 ) ) ( not ( = ?auto_206866 ?auto_206868 ) ) ( not ( = ?auto_206866 ?auto_206869 ) ) ( not ( = ?auto_206866 ?auto_206872 ) ) ( not ( = ?auto_206867 ?auto_206868 ) ) ( not ( = ?auto_206867 ?auto_206869 ) ) ( not ( = ?auto_206867 ?auto_206872 ) ) ( not ( = ?auto_206868 ?auto_206869 ) ) ( not ( = ?auto_206868 ?auto_206872 ) ) ( not ( = ?auto_206869 ?auto_206872 ) ) ( not ( = ?auto_206866 ?auto_206870 ) ) ( not ( = ?auto_206866 ?auto_206871 ) ) ( not ( = ?auto_206867 ?auto_206870 ) ) ( not ( = ?auto_206867 ?auto_206871 ) ) ( not ( = ?auto_206868 ?auto_206870 ) ) ( not ( = ?auto_206868 ?auto_206871 ) ) ( not ( = ?auto_206869 ?auto_206870 ) ) ( not ( = ?auto_206869 ?auto_206871 ) ) ( not ( = ?auto_206872 ?auto_206870 ) ) ( not ( = ?auto_206872 ?auto_206871 ) ) ( not ( = ?auto_206870 ?auto_206871 ) ) ( ON ?auto_206870 ?auto_206872 ) ( not ( = ?auto_206873 ?auto_206871 ) ) ( not ( = ?auto_206866 ?auto_206873 ) ) ( not ( = ?auto_206867 ?auto_206873 ) ) ( not ( = ?auto_206868 ?auto_206873 ) ) ( not ( = ?auto_206869 ?auto_206873 ) ) ( not ( = ?auto_206872 ?auto_206873 ) ) ( not ( = ?auto_206870 ?auto_206873 ) ) ( ON ?auto_206871 ?auto_206870 ) ( CLEAR ?auto_206871 ) ( ON ?auto_206873 ?auto_206874 ) ( CLEAR ?auto_206873 ) ( HAND-EMPTY ) ( not ( = ?auto_206866 ?auto_206874 ) ) ( not ( = ?auto_206867 ?auto_206874 ) ) ( not ( = ?auto_206868 ?auto_206874 ) ) ( not ( = ?auto_206869 ?auto_206874 ) ) ( not ( = ?auto_206872 ?auto_206874 ) ) ( not ( = ?auto_206870 ?auto_206874 ) ) ( not ( = ?auto_206871 ?auto_206874 ) ) ( not ( = ?auto_206873 ?auto_206874 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_206873 ?auto_206874 )
      ( MAKE-4PILE ?auto_206866 ?auto_206867 ?auto_206868 ?auto_206869 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_206875 - BLOCK
      ?auto_206876 - BLOCK
      ?auto_206877 - BLOCK
      ?auto_206878 - BLOCK
    )
    :vars
    (
      ?auto_206880 - BLOCK
      ?auto_206883 - BLOCK
      ?auto_206881 - BLOCK
      ?auto_206879 - BLOCK
      ?auto_206882 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206880 ?auto_206878 ) ( ON-TABLE ?auto_206875 ) ( ON ?auto_206876 ?auto_206875 ) ( ON ?auto_206877 ?auto_206876 ) ( ON ?auto_206878 ?auto_206877 ) ( not ( = ?auto_206875 ?auto_206876 ) ) ( not ( = ?auto_206875 ?auto_206877 ) ) ( not ( = ?auto_206875 ?auto_206878 ) ) ( not ( = ?auto_206875 ?auto_206880 ) ) ( not ( = ?auto_206876 ?auto_206877 ) ) ( not ( = ?auto_206876 ?auto_206878 ) ) ( not ( = ?auto_206876 ?auto_206880 ) ) ( not ( = ?auto_206877 ?auto_206878 ) ) ( not ( = ?auto_206877 ?auto_206880 ) ) ( not ( = ?auto_206878 ?auto_206880 ) ) ( not ( = ?auto_206875 ?auto_206883 ) ) ( not ( = ?auto_206875 ?auto_206881 ) ) ( not ( = ?auto_206876 ?auto_206883 ) ) ( not ( = ?auto_206876 ?auto_206881 ) ) ( not ( = ?auto_206877 ?auto_206883 ) ) ( not ( = ?auto_206877 ?auto_206881 ) ) ( not ( = ?auto_206878 ?auto_206883 ) ) ( not ( = ?auto_206878 ?auto_206881 ) ) ( not ( = ?auto_206880 ?auto_206883 ) ) ( not ( = ?auto_206880 ?auto_206881 ) ) ( not ( = ?auto_206883 ?auto_206881 ) ) ( ON ?auto_206883 ?auto_206880 ) ( not ( = ?auto_206879 ?auto_206881 ) ) ( not ( = ?auto_206875 ?auto_206879 ) ) ( not ( = ?auto_206876 ?auto_206879 ) ) ( not ( = ?auto_206877 ?auto_206879 ) ) ( not ( = ?auto_206878 ?auto_206879 ) ) ( not ( = ?auto_206880 ?auto_206879 ) ) ( not ( = ?auto_206883 ?auto_206879 ) ) ( ON ?auto_206879 ?auto_206882 ) ( CLEAR ?auto_206879 ) ( not ( = ?auto_206875 ?auto_206882 ) ) ( not ( = ?auto_206876 ?auto_206882 ) ) ( not ( = ?auto_206877 ?auto_206882 ) ) ( not ( = ?auto_206878 ?auto_206882 ) ) ( not ( = ?auto_206880 ?auto_206882 ) ) ( not ( = ?auto_206883 ?auto_206882 ) ) ( not ( = ?auto_206881 ?auto_206882 ) ) ( not ( = ?auto_206879 ?auto_206882 ) ) ( HOLDING ?auto_206881 ) ( CLEAR ?auto_206883 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_206875 ?auto_206876 ?auto_206877 ?auto_206878 ?auto_206880 ?auto_206883 ?auto_206881 )
      ( MAKE-4PILE ?auto_206875 ?auto_206876 ?auto_206877 ?auto_206878 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_206884 - BLOCK
      ?auto_206885 - BLOCK
      ?auto_206886 - BLOCK
      ?auto_206887 - BLOCK
    )
    :vars
    (
      ?auto_206890 - BLOCK
      ?auto_206892 - BLOCK
      ?auto_206888 - BLOCK
      ?auto_206891 - BLOCK
      ?auto_206889 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206890 ?auto_206887 ) ( ON-TABLE ?auto_206884 ) ( ON ?auto_206885 ?auto_206884 ) ( ON ?auto_206886 ?auto_206885 ) ( ON ?auto_206887 ?auto_206886 ) ( not ( = ?auto_206884 ?auto_206885 ) ) ( not ( = ?auto_206884 ?auto_206886 ) ) ( not ( = ?auto_206884 ?auto_206887 ) ) ( not ( = ?auto_206884 ?auto_206890 ) ) ( not ( = ?auto_206885 ?auto_206886 ) ) ( not ( = ?auto_206885 ?auto_206887 ) ) ( not ( = ?auto_206885 ?auto_206890 ) ) ( not ( = ?auto_206886 ?auto_206887 ) ) ( not ( = ?auto_206886 ?auto_206890 ) ) ( not ( = ?auto_206887 ?auto_206890 ) ) ( not ( = ?auto_206884 ?auto_206892 ) ) ( not ( = ?auto_206884 ?auto_206888 ) ) ( not ( = ?auto_206885 ?auto_206892 ) ) ( not ( = ?auto_206885 ?auto_206888 ) ) ( not ( = ?auto_206886 ?auto_206892 ) ) ( not ( = ?auto_206886 ?auto_206888 ) ) ( not ( = ?auto_206887 ?auto_206892 ) ) ( not ( = ?auto_206887 ?auto_206888 ) ) ( not ( = ?auto_206890 ?auto_206892 ) ) ( not ( = ?auto_206890 ?auto_206888 ) ) ( not ( = ?auto_206892 ?auto_206888 ) ) ( ON ?auto_206892 ?auto_206890 ) ( not ( = ?auto_206891 ?auto_206888 ) ) ( not ( = ?auto_206884 ?auto_206891 ) ) ( not ( = ?auto_206885 ?auto_206891 ) ) ( not ( = ?auto_206886 ?auto_206891 ) ) ( not ( = ?auto_206887 ?auto_206891 ) ) ( not ( = ?auto_206890 ?auto_206891 ) ) ( not ( = ?auto_206892 ?auto_206891 ) ) ( ON ?auto_206891 ?auto_206889 ) ( not ( = ?auto_206884 ?auto_206889 ) ) ( not ( = ?auto_206885 ?auto_206889 ) ) ( not ( = ?auto_206886 ?auto_206889 ) ) ( not ( = ?auto_206887 ?auto_206889 ) ) ( not ( = ?auto_206890 ?auto_206889 ) ) ( not ( = ?auto_206892 ?auto_206889 ) ) ( not ( = ?auto_206888 ?auto_206889 ) ) ( not ( = ?auto_206891 ?auto_206889 ) ) ( CLEAR ?auto_206892 ) ( ON ?auto_206888 ?auto_206891 ) ( CLEAR ?auto_206888 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_206889 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_206889 ?auto_206891 )
      ( MAKE-4PILE ?auto_206884 ?auto_206885 ?auto_206886 ?auto_206887 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_206893 - BLOCK
      ?auto_206894 - BLOCK
      ?auto_206895 - BLOCK
      ?auto_206896 - BLOCK
    )
    :vars
    (
      ?auto_206901 - BLOCK
      ?auto_206898 - BLOCK
      ?auto_206897 - BLOCK
      ?auto_206899 - BLOCK
      ?auto_206900 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206901 ?auto_206896 ) ( ON-TABLE ?auto_206893 ) ( ON ?auto_206894 ?auto_206893 ) ( ON ?auto_206895 ?auto_206894 ) ( ON ?auto_206896 ?auto_206895 ) ( not ( = ?auto_206893 ?auto_206894 ) ) ( not ( = ?auto_206893 ?auto_206895 ) ) ( not ( = ?auto_206893 ?auto_206896 ) ) ( not ( = ?auto_206893 ?auto_206901 ) ) ( not ( = ?auto_206894 ?auto_206895 ) ) ( not ( = ?auto_206894 ?auto_206896 ) ) ( not ( = ?auto_206894 ?auto_206901 ) ) ( not ( = ?auto_206895 ?auto_206896 ) ) ( not ( = ?auto_206895 ?auto_206901 ) ) ( not ( = ?auto_206896 ?auto_206901 ) ) ( not ( = ?auto_206893 ?auto_206898 ) ) ( not ( = ?auto_206893 ?auto_206897 ) ) ( not ( = ?auto_206894 ?auto_206898 ) ) ( not ( = ?auto_206894 ?auto_206897 ) ) ( not ( = ?auto_206895 ?auto_206898 ) ) ( not ( = ?auto_206895 ?auto_206897 ) ) ( not ( = ?auto_206896 ?auto_206898 ) ) ( not ( = ?auto_206896 ?auto_206897 ) ) ( not ( = ?auto_206901 ?auto_206898 ) ) ( not ( = ?auto_206901 ?auto_206897 ) ) ( not ( = ?auto_206898 ?auto_206897 ) ) ( not ( = ?auto_206899 ?auto_206897 ) ) ( not ( = ?auto_206893 ?auto_206899 ) ) ( not ( = ?auto_206894 ?auto_206899 ) ) ( not ( = ?auto_206895 ?auto_206899 ) ) ( not ( = ?auto_206896 ?auto_206899 ) ) ( not ( = ?auto_206901 ?auto_206899 ) ) ( not ( = ?auto_206898 ?auto_206899 ) ) ( ON ?auto_206899 ?auto_206900 ) ( not ( = ?auto_206893 ?auto_206900 ) ) ( not ( = ?auto_206894 ?auto_206900 ) ) ( not ( = ?auto_206895 ?auto_206900 ) ) ( not ( = ?auto_206896 ?auto_206900 ) ) ( not ( = ?auto_206901 ?auto_206900 ) ) ( not ( = ?auto_206898 ?auto_206900 ) ) ( not ( = ?auto_206897 ?auto_206900 ) ) ( not ( = ?auto_206899 ?auto_206900 ) ) ( ON ?auto_206897 ?auto_206899 ) ( CLEAR ?auto_206897 ) ( ON-TABLE ?auto_206900 ) ( HOLDING ?auto_206898 ) ( CLEAR ?auto_206901 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_206893 ?auto_206894 ?auto_206895 ?auto_206896 ?auto_206901 ?auto_206898 )
      ( MAKE-4PILE ?auto_206893 ?auto_206894 ?auto_206895 ?auto_206896 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_206902 - BLOCK
      ?auto_206903 - BLOCK
      ?auto_206904 - BLOCK
      ?auto_206905 - BLOCK
    )
    :vars
    (
      ?auto_206907 - BLOCK
      ?auto_206908 - BLOCK
      ?auto_206906 - BLOCK
      ?auto_206910 - BLOCK
      ?auto_206909 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206907 ?auto_206905 ) ( ON-TABLE ?auto_206902 ) ( ON ?auto_206903 ?auto_206902 ) ( ON ?auto_206904 ?auto_206903 ) ( ON ?auto_206905 ?auto_206904 ) ( not ( = ?auto_206902 ?auto_206903 ) ) ( not ( = ?auto_206902 ?auto_206904 ) ) ( not ( = ?auto_206902 ?auto_206905 ) ) ( not ( = ?auto_206902 ?auto_206907 ) ) ( not ( = ?auto_206903 ?auto_206904 ) ) ( not ( = ?auto_206903 ?auto_206905 ) ) ( not ( = ?auto_206903 ?auto_206907 ) ) ( not ( = ?auto_206904 ?auto_206905 ) ) ( not ( = ?auto_206904 ?auto_206907 ) ) ( not ( = ?auto_206905 ?auto_206907 ) ) ( not ( = ?auto_206902 ?auto_206908 ) ) ( not ( = ?auto_206902 ?auto_206906 ) ) ( not ( = ?auto_206903 ?auto_206908 ) ) ( not ( = ?auto_206903 ?auto_206906 ) ) ( not ( = ?auto_206904 ?auto_206908 ) ) ( not ( = ?auto_206904 ?auto_206906 ) ) ( not ( = ?auto_206905 ?auto_206908 ) ) ( not ( = ?auto_206905 ?auto_206906 ) ) ( not ( = ?auto_206907 ?auto_206908 ) ) ( not ( = ?auto_206907 ?auto_206906 ) ) ( not ( = ?auto_206908 ?auto_206906 ) ) ( not ( = ?auto_206910 ?auto_206906 ) ) ( not ( = ?auto_206902 ?auto_206910 ) ) ( not ( = ?auto_206903 ?auto_206910 ) ) ( not ( = ?auto_206904 ?auto_206910 ) ) ( not ( = ?auto_206905 ?auto_206910 ) ) ( not ( = ?auto_206907 ?auto_206910 ) ) ( not ( = ?auto_206908 ?auto_206910 ) ) ( ON ?auto_206910 ?auto_206909 ) ( not ( = ?auto_206902 ?auto_206909 ) ) ( not ( = ?auto_206903 ?auto_206909 ) ) ( not ( = ?auto_206904 ?auto_206909 ) ) ( not ( = ?auto_206905 ?auto_206909 ) ) ( not ( = ?auto_206907 ?auto_206909 ) ) ( not ( = ?auto_206908 ?auto_206909 ) ) ( not ( = ?auto_206906 ?auto_206909 ) ) ( not ( = ?auto_206910 ?auto_206909 ) ) ( ON ?auto_206906 ?auto_206910 ) ( ON-TABLE ?auto_206909 ) ( CLEAR ?auto_206907 ) ( ON ?auto_206908 ?auto_206906 ) ( CLEAR ?auto_206908 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_206909 ?auto_206910 ?auto_206906 )
      ( MAKE-4PILE ?auto_206902 ?auto_206903 ?auto_206904 ?auto_206905 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_206929 - BLOCK
      ?auto_206930 - BLOCK
      ?auto_206931 - BLOCK
      ?auto_206932 - BLOCK
    )
    :vars
    (
      ?auto_206934 - BLOCK
      ?auto_206936 - BLOCK
      ?auto_206937 - BLOCK
      ?auto_206935 - BLOCK
      ?auto_206933 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_206929 ) ( ON ?auto_206930 ?auto_206929 ) ( ON ?auto_206931 ?auto_206930 ) ( not ( = ?auto_206929 ?auto_206930 ) ) ( not ( = ?auto_206929 ?auto_206931 ) ) ( not ( = ?auto_206929 ?auto_206932 ) ) ( not ( = ?auto_206929 ?auto_206934 ) ) ( not ( = ?auto_206930 ?auto_206931 ) ) ( not ( = ?auto_206930 ?auto_206932 ) ) ( not ( = ?auto_206930 ?auto_206934 ) ) ( not ( = ?auto_206931 ?auto_206932 ) ) ( not ( = ?auto_206931 ?auto_206934 ) ) ( not ( = ?auto_206932 ?auto_206934 ) ) ( not ( = ?auto_206929 ?auto_206936 ) ) ( not ( = ?auto_206929 ?auto_206937 ) ) ( not ( = ?auto_206930 ?auto_206936 ) ) ( not ( = ?auto_206930 ?auto_206937 ) ) ( not ( = ?auto_206931 ?auto_206936 ) ) ( not ( = ?auto_206931 ?auto_206937 ) ) ( not ( = ?auto_206932 ?auto_206936 ) ) ( not ( = ?auto_206932 ?auto_206937 ) ) ( not ( = ?auto_206934 ?auto_206936 ) ) ( not ( = ?auto_206934 ?auto_206937 ) ) ( not ( = ?auto_206936 ?auto_206937 ) ) ( not ( = ?auto_206935 ?auto_206937 ) ) ( not ( = ?auto_206929 ?auto_206935 ) ) ( not ( = ?auto_206930 ?auto_206935 ) ) ( not ( = ?auto_206931 ?auto_206935 ) ) ( not ( = ?auto_206932 ?auto_206935 ) ) ( not ( = ?auto_206934 ?auto_206935 ) ) ( not ( = ?auto_206936 ?auto_206935 ) ) ( ON ?auto_206935 ?auto_206933 ) ( not ( = ?auto_206929 ?auto_206933 ) ) ( not ( = ?auto_206930 ?auto_206933 ) ) ( not ( = ?auto_206931 ?auto_206933 ) ) ( not ( = ?auto_206932 ?auto_206933 ) ) ( not ( = ?auto_206934 ?auto_206933 ) ) ( not ( = ?auto_206936 ?auto_206933 ) ) ( not ( = ?auto_206937 ?auto_206933 ) ) ( not ( = ?auto_206935 ?auto_206933 ) ) ( ON ?auto_206937 ?auto_206935 ) ( ON-TABLE ?auto_206933 ) ( ON ?auto_206936 ?auto_206937 ) ( ON ?auto_206934 ?auto_206936 ) ( CLEAR ?auto_206934 ) ( HOLDING ?auto_206932 ) ( CLEAR ?auto_206931 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_206929 ?auto_206930 ?auto_206931 ?auto_206932 ?auto_206934 )
      ( MAKE-4PILE ?auto_206929 ?auto_206930 ?auto_206931 ?auto_206932 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_206938 - BLOCK
      ?auto_206939 - BLOCK
      ?auto_206940 - BLOCK
      ?auto_206941 - BLOCK
    )
    :vars
    (
      ?auto_206945 - BLOCK
      ?auto_206943 - BLOCK
      ?auto_206942 - BLOCK
      ?auto_206946 - BLOCK
      ?auto_206944 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_206938 ) ( ON ?auto_206939 ?auto_206938 ) ( ON ?auto_206940 ?auto_206939 ) ( not ( = ?auto_206938 ?auto_206939 ) ) ( not ( = ?auto_206938 ?auto_206940 ) ) ( not ( = ?auto_206938 ?auto_206941 ) ) ( not ( = ?auto_206938 ?auto_206945 ) ) ( not ( = ?auto_206939 ?auto_206940 ) ) ( not ( = ?auto_206939 ?auto_206941 ) ) ( not ( = ?auto_206939 ?auto_206945 ) ) ( not ( = ?auto_206940 ?auto_206941 ) ) ( not ( = ?auto_206940 ?auto_206945 ) ) ( not ( = ?auto_206941 ?auto_206945 ) ) ( not ( = ?auto_206938 ?auto_206943 ) ) ( not ( = ?auto_206938 ?auto_206942 ) ) ( not ( = ?auto_206939 ?auto_206943 ) ) ( not ( = ?auto_206939 ?auto_206942 ) ) ( not ( = ?auto_206940 ?auto_206943 ) ) ( not ( = ?auto_206940 ?auto_206942 ) ) ( not ( = ?auto_206941 ?auto_206943 ) ) ( not ( = ?auto_206941 ?auto_206942 ) ) ( not ( = ?auto_206945 ?auto_206943 ) ) ( not ( = ?auto_206945 ?auto_206942 ) ) ( not ( = ?auto_206943 ?auto_206942 ) ) ( not ( = ?auto_206946 ?auto_206942 ) ) ( not ( = ?auto_206938 ?auto_206946 ) ) ( not ( = ?auto_206939 ?auto_206946 ) ) ( not ( = ?auto_206940 ?auto_206946 ) ) ( not ( = ?auto_206941 ?auto_206946 ) ) ( not ( = ?auto_206945 ?auto_206946 ) ) ( not ( = ?auto_206943 ?auto_206946 ) ) ( ON ?auto_206946 ?auto_206944 ) ( not ( = ?auto_206938 ?auto_206944 ) ) ( not ( = ?auto_206939 ?auto_206944 ) ) ( not ( = ?auto_206940 ?auto_206944 ) ) ( not ( = ?auto_206941 ?auto_206944 ) ) ( not ( = ?auto_206945 ?auto_206944 ) ) ( not ( = ?auto_206943 ?auto_206944 ) ) ( not ( = ?auto_206942 ?auto_206944 ) ) ( not ( = ?auto_206946 ?auto_206944 ) ) ( ON ?auto_206942 ?auto_206946 ) ( ON-TABLE ?auto_206944 ) ( ON ?auto_206943 ?auto_206942 ) ( ON ?auto_206945 ?auto_206943 ) ( CLEAR ?auto_206940 ) ( ON ?auto_206941 ?auto_206945 ) ( CLEAR ?auto_206941 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_206944 ?auto_206946 ?auto_206942 ?auto_206943 ?auto_206945 )
      ( MAKE-4PILE ?auto_206938 ?auto_206939 ?auto_206940 ?auto_206941 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_206947 - BLOCK
      ?auto_206948 - BLOCK
      ?auto_206949 - BLOCK
      ?auto_206950 - BLOCK
    )
    :vars
    (
      ?auto_206954 - BLOCK
      ?auto_206953 - BLOCK
      ?auto_206955 - BLOCK
      ?auto_206951 - BLOCK
      ?auto_206952 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_206947 ) ( ON ?auto_206948 ?auto_206947 ) ( not ( = ?auto_206947 ?auto_206948 ) ) ( not ( = ?auto_206947 ?auto_206949 ) ) ( not ( = ?auto_206947 ?auto_206950 ) ) ( not ( = ?auto_206947 ?auto_206954 ) ) ( not ( = ?auto_206948 ?auto_206949 ) ) ( not ( = ?auto_206948 ?auto_206950 ) ) ( not ( = ?auto_206948 ?auto_206954 ) ) ( not ( = ?auto_206949 ?auto_206950 ) ) ( not ( = ?auto_206949 ?auto_206954 ) ) ( not ( = ?auto_206950 ?auto_206954 ) ) ( not ( = ?auto_206947 ?auto_206953 ) ) ( not ( = ?auto_206947 ?auto_206955 ) ) ( not ( = ?auto_206948 ?auto_206953 ) ) ( not ( = ?auto_206948 ?auto_206955 ) ) ( not ( = ?auto_206949 ?auto_206953 ) ) ( not ( = ?auto_206949 ?auto_206955 ) ) ( not ( = ?auto_206950 ?auto_206953 ) ) ( not ( = ?auto_206950 ?auto_206955 ) ) ( not ( = ?auto_206954 ?auto_206953 ) ) ( not ( = ?auto_206954 ?auto_206955 ) ) ( not ( = ?auto_206953 ?auto_206955 ) ) ( not ( = ?auto_206951 ?auto_206955 ) ) ( not ( = ?auto_206947 ?auto_206951 ) ) ( not ( = ?auto_206948 ?auto_206951 ) ) ( not ( = ?auto_206949 ?auto_206951 ) ) ( not ( = ?auto_206950 ?auto_206951 ) ) ( not ( = ?auto_206954 ?auto_206951 ) ) ( not ( = ?auto_206953 ?auto_206951 ) ) ( ON ?auto_206951 ?auto_206952 ) ( not ( = ?auto_206947 ?auto_206952 ) ) ( not ( = ?auto_206948 ?auto_206952 ) ) ( not ( = ?auto_206949 ?auto_206952 ) ) ( not ( = ?auto_206950 ?auto_206952 ) ) ( not ( = ?auto_206954 ?auto_206952 ) ) ( not ( = ?auto_206953 ?auto_206952 ) ) ( not ( = ?auto_206955 ?auto_206952 ) ) ( not ( = ?auto_206951 ?auto_206952 ) ) ( ON ?auto_206955 ?auto_206951 ) ( ON-TABLE ?auto_206952 ) ( ON ?auto_206953 ?auto_206955 ) ( ON ?auto_206954 ?auto_206953 ) ( ON ?auto_206950 ?auto_206954 ) ( CLEAR ?auto_206950 ) ( HOLDING ?auto_206949 ) ( CLEAR ?auto_206948 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_206947 ?auto_206948 ?auto_206949 )
      ( MAKE-4PILE ?auto_206947 ?auto_206948 ?auto_206949 ?auto_206950 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_206956 - BLOCK
      ?auto_206957 - BLOCK
      ?auto_206958 - BLOCK
      ?auto_206959 - BLOCK
    )
    :vars
    (
      ?auto_206960 - BLOCK
      ?auto_206964 - BLOCK
      ?auto_206962 - BLOCK
      ?auto_206963 - BLOCK
      ?auto_206961 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_206956 ) ( ON ?auto_206957 ?auto_206956 ) ( not ( = ?auto_206956 ?auto_206957 ) ) ( not ( = ?auto_206956 ?auto_206958 ) ) ( not ( = ?auto_206956 ?auto_206959 ) ) ( not ( = ?auto_206956 ?auto_206960 ) ) ( not ( = ?auto_206957 ?auto_206958 ) ) ( not ( = ?auto_206957 ?auto_206959 ) ) ( not ( = ?auto_206957 ?auto_206960 ) ) ( not ( = ?auto_206958 ?auto_206959 ) ) ( not ( = ?auto_206958 ?auto_206960 ) ) ( not ( = ?auto_206959 ?auto_206960 ) ) ( not ( = ?auto_206956 ?auto_206964 ) ) ( not ( = ?auto_206956 ?auto_206962 ) ) ( not ( = ?auto_206957 ?auto_206964 ) ) ( not ( = ?auto_206957 ?auto_206962 ) ) ( not ( = ?auto_206958 ?auto_206964 ) ) ( not ( = ?auto_206958 ?auto_206962 ) ) ( not ( = ?auto_206959 ?auto_206964 ) ) ( not ( = ?auto_206959 ?auto_206962 ) ) ( not ( = ?auto_206960 ?auto_206964 ) ) ( not ( = ?auto_206960 ?auto_206962 ) ) ( not ( = ?auto_206964 ?auto_206962 ) ) ( not ( = ?auto_206963 ?auto_206962 ) ) ( not ( = ?auto_206956 ?auto_206963 ) ) ( not ( = ?auto_206957 ?auto_206963 ) ) ( not ( = ?auto_206958 ?auto_206963 ) ) ( not ( = ?auto_206959 ?auto_206963 ) ) ( not ( = ?auto_206960 ?auto_206963 ) ) ( not ( = ?auto_206964 ?auto_206963 ) ) ( ON ?auto_206963 ?auto_206961 ) ( not ( = ?auto_206956 ?auto_206961 ) ) ( not ( = ?auto_206957 ?auto_206961 ) ) ( not ( = ?auto_206958 ?auto_206961 ) ) ( not ( = ?auto_206959 ?auto_206961 ) ) ( not ( = ?auto_206960 ?auto_206961 ) ) ( not ( = ?auto_206964 ?auto_206961 ) ) ( not ( = ?auto_206962 ?auto_206961 ) ) ( not ( = ?auto_206963 ?auto_206961 ) ) ( ON ?auto_206962 ?auto_206963 ) ( ON-TABLE ?auto_206961 ) ( ON ?auto_206964 ?auto_206962 ) ( ON ?auto_206960 ?auto_206964 ) ( ON ?auto_206959 ?auto_206960 ) ( CLEAR ?auto_206957 ) ( ON ?auto_206958 ?auto_206959 ) ( CLEAR ?auto_206958 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_206961 ?auto_206963 ?auto_206962 ?auto_206964 ?auto_206960 ?auto_206959 )
      ( MAKE-4PILE ?auto_206956 ?auto_206957 ?auto_206958 ?auto_206959 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_206965 - BLOCK
      ?auto_206966 - BLOCK
      ?auto_206967 - BLOCK
      ?auto_206968 - BLOCK
    )
    :vars
    (
      ?auto_206969 - BLOCK
      ?auto_206973 - BLOCK
      ?auto_206972 - BLOCK
      ?auto_206971 - BLOCK
      ?auto_206970 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_206965 ) ( not ( = ?auto_206965 ?auto_206966 ) ) ( not ( = ?auto_206965 ?auto_206967 ) ) ( not ( = ?auto_206965 ?auto_206968 ) ) ( not ( = ?auto_206965 ?auto_206969 ) ) ( not ( = ?auto_206966 ?auto_206967 ) ) ( not ( = ?auto_206966 ?auto_206968 ) ) ( not ( = ?auto_206966 ?auto_206969 ) ) ( not ( = ?auto_206967 ?auto_206968 ) ) ( not ( = ?auto_206967 ?auto_206969 ) ) ( not ( = ?auto_206968 ?auto_206969 ) ) ( not ( = ?auto_206965 ?auto_206973 ) ) ( not ( = ?auto_206965 ?auto_206972 ) ) ( not ( = ?auto_206966 ?auto_206973 ) ) ( not ( = ?auto_206966 ?auto_206972 ) ) ( not ( = ?auto_206967 ?auto_206973 ) ) ( not ( = ?auto_206967 ?auto_206972 ) ) ( not ( = ?auto_206968 ?auto_206973 ) ) ( not ( = ?auto_206968 ?auto_206972 ) ) ( not ( = ?auto_206969 ?auto_206973 ) ) ( not ( = ?auto_206969 ?auto_206972 ) ) ( not ( = ?auto_206973 ?auto_206972 ) ) ( not ( = ?auto_206971 ?auto_206972 ) ) ( not ( = ?auto_206965 ?auto_206971 ) ) ( not ( = ?auto_206966 ?auto_206971 ) ) ( not ( = ?auto_206967 ?auto_206971 ) ) ( not ( = ?auto_206968 ?auto_206971 ) ) ( not ( = ?auto_206969 ?auto_206971 ) ) ( not ( = ?auto_206973 ?auto_206971 ) ) ( ON ?auto_206971 ?auto_206970 ) ( not ( = ?auto_206965 ?auto_206970 ) ) ( not ( = ?auto_206966 ?auto_206970 ) ) ( not ( = ?auto_206967 ?auto_206970 ) ) ( not ( = ?auto_206968 ?auto_206970 ) ) ( not ( = ?auto_206969 ?auto_206970 ) ) ( not ( = ?auto_206973 ?auto_206970 ) ) ( not ( = ?auto_206972 ?auto_206970 ) ) ( not ( = ?auto_206971 ?auto_206970 ) ) ( ON ?auto_206972 ?auto_206971 ) ( ON-TABLE ?auto_206970 ) ( ON ?auto_206973 ?auto_206972 ) ( ON ?auto_206969 ?auto_206973 ) ( ON ?auto_206968 ?auto_206969 ) ( ON ?auto_206967 ?auto_206968 ) ( CLEAR ?auto_206967 ) ( HOLDING ?auto_206966 ) ( CLEAR ?auto_206965 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_206965 ?auto_206966 )
      ( MAKE-4PILE ?auto_206965 ?auto_206966 ?auto_206967 ?auto_206968 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_206974 - BLOCK
      ?auto_206975 - BLOCK
      ?auto_206976 - BLOCK
      ?auto_206977 - BLOCK
    )
    :vars
    (
      ?auto_206978 - BLOCK
      ?auto_206980 - BLOCK
      ?auto_206982 - BLOCK
      ?auto_206979 - BLOCK
      ?auto_206981 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_206974 ) ( not ( = ?auto_206974 ?auto_206975 ) ) ( not ( = ?auto_206974 ?auto_206976 ) ) ( not ( = ?auto_206974 ?auto_206977 ) ) ( not ( = ?auto_206974 ?auto_206978 ) ) ( not ( = ?auto_206975 ?auto_206976 ) ) ( not ( = ?auto_206975 ?auto_206977 ) ) ( not ( = ?auto_206975 ?auto_206978 ) ) ( not ( = ?auto_206976 ?auto_206977 ) ) ( not ( = ?auto_206976 ?auto_206978 ) ) ( not ( = ?auto_206977 ?auto_206978 ) ) ( not ( = ?auto_206974 ?auto_206980 ) ) ( not ( = ?auto_206974 ?auto_206982 ) ) ( not ( = ?auto_206975 ?auto_206980 ) ) ( not ( = ?auto_206975 ?auto_206982 ) ) ( not ( = ?auto_206976 ?auto_206980 ) ) ( not ( = ?auto_206976 ?auto_206982 ) ) ( not ( = ?auto_206977 ?auto_206980 ) ) ( not ( = ?auto_206977 ?auto_206982 ) ) ( not ( = ?auto_206978 ?auto_206980 ) ) ( not ( = ?auto_206978 ?auto_206982 ) ) ( not ( = ?auto_206980 ?auto_206982 ) ) ( not ( = ?auto_206979 ?auto_206982 ) ) ( not ( = ?auto_206974 ?auto_206979 ) ) ( not ( = ?auto_206975 ?auto_206979 ) ) ( not ( = ?auto_206976 ?auto_206979 ) ) ( not ( = ?auto_206977 ?auto_206979 ) ) ( not ( = ?auto_206978 ?auto_206979 ) ) ( not ( = ?auto_206980 ?auto_206979 ) ) ( ON ?auto_206979 ?auto_206981 ) ( not ( = ?auto_206974 ?auto_206981 ) ) ( not ( = ?auto_206975 ?auto_206981 ) ) ( not ( = ?auto_206976 ?auto_206981 ) ) ( not ( = ?auto_206977 ?auto_206981 ) ) ( not ( = ?auto_206978 ?auto_206981 ) ) ( not ( = ?auto_206980 ?auto_206981 ) ) ( not ( = ?auto_206982 ?auto_206981 ) ) ( not ( = ?auto_206979 ?auto_206981 ) ) ( ON ?auto_206982 ?auto_206979 ) ( ON-TABLE ?auto_206981 ) ( ON ?auto_206980 ?auto_206982 ) ( ON ?auto_206978 ?auto_206980 ) ( ON ?auto_206977 ?auto_206978 ) ( ON ?auto_206976 ?auto_206977 ) ( CLEAR ?auto_206974 ) ( ON ?auto_206975 ?auto_206976 ) ( CLEAR ?auto_206975 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_206981 ?auto_206979 ?auto_206982 ?auto_206980 ?auto_206978 ?auto_206977 ?auto_206976 )
      ( MAKE-4PILE ?auto_206974 ?auto_206975 ?auto_206976 ?auto_206977 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_206983 - BLOCK
      ?auto_206984 - BLOCK
      ?auto_206985 - BLOCK
      ?auto_206986 - BLOCK
    )
    :vars
    (
      ?auto_206990 - BLOCK
      ?auto_206987 - BLOCK
      ?auto_206989 - BLOCK
      ?auto_206991 - BLOCK
      ?auto_206988 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_206983 ?auto_206984 ) ) ( not ( = ?auto_206983 ?auto_206985 ) ) ( not ( = ?auto_206983 ?auto_206986 ) ) ( not ( = ?auto_206983 ?auto_206990 ) ) ( not ( = ?auto_206984 ?auto_206985 ) ) ( not ( = ?auto_206984 ?auto_206986 ) ) ( not ( = ?auto_206984 ?auto_206990 ) ) ( not ( = ?auto_206985 ?auto_206986 ) ) ( not ( = ?auto_206985 ?auto_206990 ) ) ( not ( = ?auto_206986 ?auto_206990 ) ) ( not ( = ?auto_206983 ?auto_206987 ) ) ( not ( = ?auto_206983 ?auto_206989 ) ) ( not ( = ?auto_206984 ?auto_206987 ) ) ( not ( = ?auto_206984 ?auto_206989 ) ) ( not ( = ?auto_206985 ?auto_206987 ) ) ( not ( = ?auto_206985 ?auto_206989 ) ) ( not ( = ?auto_206986 ?auto_206987 ) ) ( not ( = ?auto_206986 ?auto_206989 ) ) ( not ( = ?auto_206990 ?auto_206987 ) ) ( not ( = ?auto_206990 ?auto_206989 ) ) ( not ( = ?auto_206987 ?auto_206989 ) ) ( not ( = ?auto_206991 ?auto_206989 ) ) ( not ( = ?auto_206983 ?auto_206991 ) ) ( not ( = ?auto_206984 ?auto_206991 ) ) ( not ( = ?auto_206985 ?auto_206991 ) ) ( not ( = ?auto_206986 ?auto_206991 ) ) ( not ( = ?auto_206990 ?auto_206991 ) ) ( not ( = ?auto_206987 ?auto_206991 ) ) ( ON ?auto_206991 ?auto_206988 ) ( not ( = ?auto_206983 ?auto_206988 ) ) ( not ( = ?auto_206984 ?auto_206988 ) ) ( not ( = ?auto_206985 ?auto_206988 ) ) ( not ( = ?auto_206986 ?auto_206988 ) ) ( not ( = ?auto_206990 ?auto_206988 ) ) ( not ( = ?auto_206987 ?auto_206988 ) ) ( not ( = ?auto_206989 ?auto_206988 ) ) ( not ( = ?auto_206991 ?auto_206988 ) ) ( ON ?auto_206989 ?auto_206991 ) ( ON-TABLE ?auto_206988 ) ( ON ?auto_206987 ?auto_206989 ) ( ON ?auto_206990 ?auto_206987 ) ( ON ?auto_206986 ?auto_206990 ) ( ON ?auto_206985 ?auto_206986 ) ( ON ?auto_206984 ?auto_206985 ) ( CLEAR ?auto_206984 ) ( HOLDING ?auto_206983 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_206983 )
      ( MAKE-4PILE ?auto_206983 ?auto_206984 ?auto_206985 ?auto_206986 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_206992 - BLOCK
      ?auto_206993 - BLOCK
      ?auto_206994 - BLOCK
      ?auto_206995 - BLOCK
    )
    :vars
    (
      ?auto_207000 - BLOCK
      ?auto_206997 - BLOCK
      ?auto_206998 - BLOCK
      ?auto_206999 - BLOCK
      ?auto_206996 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_206992 ?auto_206993 ) ) ( not ( = ?auto_206992 ?auto_206994 ) ) ( not ( = ?auto_206992 ?auto_206995 ) ) ( not ( = ?auto_206992 ?auto_207000 ) ) ( not ( = ?auto_206993 ?auto_206994 ) ) ( not ( = ?auto_206993 ?auto_206995 ) ) ( not ( = ?auto_206993 ?auto_207000 ) ) ( not ( = ?auto_206994 ?auto_206995 ) ) ( not ( = ?auto_206994 ?auto_207000 ) ) ( not ( = ?auto_206995 ?auto_207000 ) ) ( not ( = ?auto_206992 ?auto_206997 ) ) ( not ( = ?auto_206992 ?auto_206998 ) ) ( not ( = ?auto_206993 ?auto_206997 ) ) ( not ( = ?auto_206993 ?auto_206998 ) ) ( not ( = ?auto_206994 ?auto_206997 ) ) ( not ( = ?auto_206994 ?auto_206998 ) ) ( not ( = ?auto_206995 ?auto_206997 ) ) ( not ( = ?auto_206995 ?auto_206998 ) ) ( not ( = ?auto_207000 ?auto_206997 ) ) ( not ( = ?auto_207000 ?auto_206998 ) ) ( not ( = ?auto_206997 ?auto_206998 ) ) ( not ( = ?auto_206999 ?auto_206998 ) ) ( not ( = ?auto_206992 ?auto_206999 ) ) ( not ( = ?auto_206993 ?auto_206999 ) ) ( not ( = ?auto_206994 ?auto_206999 ) ) ( not ( = ?auto_206995 ?auto_206999 ) ) ( not ( = ?auto_207000 ?auto_206999 ) ) ( not ( = ?auto_206997 ?auto_206999 ) ) ( ON ?auto_206999 ?auto_206996 ) ( not ( = ?auto_206992 ?auto_206996 ) ) ( not ( = ?auto_206993 ?auto_206996 ) ) ( not ( = ?auto_206994 ?auto_206996 ) ) ( not ( = ?auto_206995 ?auto_206996 ) ) ( not ( = ?auto_207000 ?auto_206996 ) ) ( not ( = ?auto_206997 ?auto_206996 ) ) ( not ( = ?auto_206998 ?auto_206996 ) ) ( not ( = ?auto_206999 ?auto_206996 ) ) ( ON ?auto_206998 ?auto_206999 ) ( ON-TABLE ?auto_206996 ) ( ON ?auto_206997 ?auto_206998 ) ( ON ?auto_207000 ?auto_206997 ) ( ON ?auto_206995 ?auto_207000 ) ( ON ?auto_206994 ?auto_206995 ) ( ON ?auto_206993 ?auto_206994 ) ( ON ?auto_206992 ?auto_206993 ) ( CLEAR ?auto_206992 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_206996 ?auto_206999 ?auto_206998 ?auto_206997 ?auto_207000 ?auto_206995 ?auto_206994 ?auto_206993 )
      ( MAKE-4PILE ?auto_206992 ?auto_206993 ?auto_206994 ?auto_206995 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_207005 - BLOCK
      ?auto_207006 - BLOCK
      ?auto_207007 - BLOCK
      ?auto_207008 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_207008 ) ( CLEAR ?auto_207007 ) ( ON-TABLE ?auto_207005 ) ( ON ?auto_207006 ?auto_207005 ) ( ON ?auto_207007 ?auto_207006 ) ( not ( = ?auto_207005 ?auto_207006 ) ) ( not ( = ?auto_207005 ?auto_207007 ) ) ( not ( = ?auto_207005 ?auto_207008 ) ) ( not ( = ?auto_207006 ?auto_207007 ) ) ( not ( = ?auto_207006 ?auto_207008 ) ) ( not ( = ?auto_207007 ?auto_207008 ) ) )
    :subtasks
    ( ( !STACK ?auto_207008 ?auto_207007 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_207009 - BLOCK
      ?auto_207010 - BLOCK
      ?auto_207011 - BLOCK
      ?auto_207012 - BLOCK
    )
    :vars
    (
      ?auto_207013 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_207011 ) ( ON-TABLE ?auto_207009 ) ( ON ?auto_207010 ?auto_207009 ) ( ON ?auto_207011 ?auto_207010 ) ( not ( = ?auto_207009 ?auto_207010 ) ) ( not ( = ?auto_207009 ?auto_207011 ) ) ( not ( = ?auto_207009 ?auto_207012 ) ) ( not ( = ?auto_207010 ?auto_207011 ) ) ( not ( = ?auto_207010 ?auto_207012 ) ) ( not ( = ?auto_207011 ?auto_207012 ) ) ( ON ?auto_207012 ?auto_207013 ) ( CLEAR ?auto_207012 ) ( HAND-EMPTY ) ( not ( = ?auto_207009 ?auto_207013 ) ) ( not ( = ?auto_207010 ?auto_207013 ) ) ( not ( = ?auto_207011 ?auto_207013 ) ) ( not ( = ?auto_207012 ?auto_207013 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_207012 ?auto_207013 )
      ( MAKE-4PILE ?auto_207009 ?auto_207010 ?auto_207011 ?auto_207012 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_207014 - BLOCK
      ?auto_207015 - BLOCK
      ?auto_207016 - BLOCK
      ?auto_207017 - BLOCK
    )
    :vars
    (
      ?auto_207018 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_207014 ) ( ON ?auto_207015 ?auto_207014 ) ( not ( = ?auto_207014 ?auto_207015 ) ) ( not ( = ?auto_207014 ?auto_207016 ) ) ( not ( = ?auto_207014 ?auto_207017 ) ) ( not ( = ?auto_207015 ?auto_207016 ) ) ( not ( = ?auto_207015 ?auto_207017 ) ) ( not ( = ?auto_207016 ?auto_207017 ) ) ( ON ?auto_207017 ?auto_207018 ) ( CLEAR ?auto_207017 ) ( not ( = ?auto_207014 ?auto_207018 ) ) ( not ( = ?auto_207015 ?auto_207018 ) ) ( not ( = ?auto_207016 ?auto_207018 ) ) ( not ( = ?auto_207017 ?auto_207018 ) ) ( HOLDING ?auto_207016 ) ( CLEAR ?auto_207015 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_207014 ?auto_207015 ?auto_207016 )
      ( MAKE-4PILE ?auto_207014 ?auto_207015 ?auto_207016 ?auto_207017 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_207019 - BLOCK
      ?auto_207020 - BLOCK
      ?auto_207021 - BLOCK
      ?auto_207022 - BLOCK
    )
    :vars
    (
      ?auto_207023 - BLOCK
      ?auto_207024 - BLOCK
      ?auto_207026 - BLOCK
      ?auto_207025 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_207019 ) ( ON ?auto_207020 ?auto_207019 ) ( not ( = ?auto_207019 ?auto_207020 ) ) ( not ( = ?auto_207019 ?auto_207021 ) ) ( not ( = ?auto_207019 ?auto_207022 ) ) ( not ( = ?auto_207020 ?auto_207021 ) ) ( not ( = ?auto_207020 ?auto_207022 ) ) ( not ( = ?auto_207021 ?auto_207022 ) ) ( ON ?auto_207022 ?auto_207023 ) ( not ( = ?auto_207019 ?auto_207023 ) ) ( not ( = ?auto_207020 ?auto_207023 ) ) ( not ( = ?auto_207021 ?auto_207023 ) ) ( not ( = ?auto_207022 ?auto_207023 ) ) ( CLEAR ?auto_207020 ) ( ON ?auto_207021 ?auto_207022 ) ( CLEAR ?auto_207021 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_207024 ) ( ON ?auto_207026 ?auto_207024 ) ( ON ?auto_207025 ?auto_207026 ) ( ON ?auto_207023 ?auto_207025 ) ( not ( = ?auto_207024 ?auto_207026 ) ) ( not ( = ?auto_207024 ?auto_207025 ) ) ( not ( = ?auto_207024 ?auto_207023 ) ) ( not ( = ?auto_207024 ?auto_207022 ) ) ( not ( = ?auto_207024 ?auto_207021 ) ) ( not ( = ?auto_207026 ?auto_207025 ) ) ( not ( = ?auto_207026 ?auto_207023 ) ) ( not ( = ?auto_207026 ?auto_207022 ) ) ( not ( = ?auto_207026 ?auto_207021 ) ) ( not ( = ?auto_207025 ?auto_207023 ) ) ( not ( = ?auto_207025 ?auto_207022 ) ) ( not ( = ?auto_207025 ?auto_207021 ) ) ( not ( = ?auto_207019 ?auto_207024 ) ) ( not ( = ?auto_207019 ?auto_207026 ) ) ( not ( = ?auto_207019 ?auto_207025 ) ) ( not ( = ?auto_207020 ?auto_207024 ) ) ( not ( = ?auto_207020 ?auto_207026 ) ) ( not ( = ?auto_207020 ?auto_207025 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_207024 ?auto_207026 ?auto_207025 ?auto_207023 ?auto_207022 )
      ( MAKE-4PILE ?auto_207019 ?auto_207020 ?auto_207021 ?auto_207022 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_207027 - BLOCK
      ?auto_207028 - BLOCK
      ?auto_207029 - BLOCK
      ?auto_207030 - BLOCK
    )
    :vars
    (
      ?auto_207034 - BLOCK
      ?auto_207031 - BLOCK
      ?auto_207033 - BLOCK
      ?auto_207032 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_207027 ) ( not ( = ?auto_207027 ?auto_207028 ) ) ( not ( = ?auto_207027 ?auto_207029 ) ) ( not ( = ?auto_207027 ?auto_207030 ) ) ( not ( = ?auto_207028 ?auto_207029 ) ) ( not ( = ?auto_207028 ?auto_207030 ) ) ( not ( = ?auto_207029 ?auto_207030 ) ) ( ON ?auto_207030 ?auto_207034 ) ( not ( = ?auto_207027 ?auto_207034 ) ) ( not ( = ?auto_207028 ?auto_207034 ) ) ( not ( = ?auto_207029 ?auto_207034 ) ) ( not ( = ?auto_207030 ?auto_207034 ) ) ( ON ?auto_207029 ?auto_207030 ) ( CLEAR ?auto_207029 ) ( ON-TABLE ?auto_207031 ) ( ON ?auto_207033 ?auto_207031 ) ( ON ?auto_207032 ?auto_207033 ) ( ON ?auto_207034 ?auto_207032 ) ( not ( = ?auto_207031 ?auto_207033 ) ) ( not ( = ?auto_207031 ?auto_207032 ) ) ( not ( = ?auto_207031 ?auto_207034 ) ) ( not ( = ?auto_207031 ?auto_207030 ) ) ( not ( = ?auto_207031 ?auto_207029 ) ) ( not ( = ?auto_207033 ?auto_207032 ) ) ( not ( = ?auto_207033 ?auto_207034 ) ) ( not ( = ?auto_207033 ?auto_207030 ) ) ( not ( = ?auto_207033 ?auto_207029 ) ) ( not ( = ?auto_207032 ?auto_207034 ) ) ( not ( = ?auto_207032 ?auto_207030 ) ) ( not ( = ?auto_207032 ?auto_207029 ) ) ( not ( = ?auto_207027 ?auto_207031 ) ) ( not ( = ?auto_207027 ?auto_207033 ) ) ( not ( = ?auto_207027 ?auto_207032 ) ) ( not ( = ?auto_207028 ?auto_207031 ) ) ( not ( = ?auto_207028 ?auto_207033 ) ) ( not ( = ?auto_207028 ?auto_207032 ) ) ( HOLDING ?auto_207028 ) ( CLEAR ?auto_207027 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_207027 ?auto_207028 )
      ( MAKE-4PILE ?auto_207027 ?auto_207028 ?auto_207029 ?auto_207030 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_207035 - BLOCK
      ?auto_207036 - BLOCK
      ?auto_207037 - BLOCK
      ?auto_207038 - BLOCK
    )
    :vars
    (
      ?auto_207040 - BLOCK
      ?auto_207042 - BLOCK
      ?auto_207041 - BLOCK
      ?auto_207039 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_207035 ) ( not ( = ?auto_207035 ?auto_207036 ) ) ( not ( = ?auto_207035 ?auto_207037 ) ) ( not ( = ?auto_207035 ?auto_207038 ) ) ( not ( = ?auto_207036 ?auto_207037 ) ) ( not ( = ?auto_207036 ?auto_207038 ) ) ( not ( = ?auto_207037 ?auto_207038 ) ) ( ON ?auto_207038 ?auto_207040 ) ( not ( = ?auto_207035 ?auto_207040 ) ) ( not ( = ?auto_207036 ?auto_207040 ) ) ( not ( = ?auto_207037 ?auto_207040 ) ) ( not ( = ?auto_207038 ?auto_207040 ) ) ( ON ?auto_207037 ?auto_207038 ) ( ON-TABLE ?auto_207042 ) ( ON ?auto_207041 ?auto_207042 ) ( ON ?auto_207039 ?auto_207041 ) ( ON ?auto_207040 ?auto_207039 ) ( not ( = ?auto_207042 ?auto_207041 ) ) ( not ( = ?auto_207042 ?auto_207039 ) ) ( not ( = ?auto_207042 ?auto_207040 ) ) ( not ( = ?auto_207042 ?auto_207038 ) ) ( not ( = ?auto_207042 ?auto_207037 ) ) ( not ( = ?auto_207041 ?auto_207039 ) ) ( not ( = ?auto_207041 ?auto_207040 ) ) ( not ( = ?auto_207041 ?auto_207038 ) ) ( not ( = ?auto_207041 ?auto_207037 ) ) ( not ( = ?auto_207039 ?auto_207040 ) ) ( not ( = ?auto_207039 ?auto_207038 ) ) ( not ( = ?auto_207039 ?auto_207037 ) ) ( not ( = ?auto_207035 ?auto_207042 ) ) ( not ( = ?auto_207035 ?auto_207041 ) ) ( not ( = ?auto_207035 ?auto_207039 ) ) ( not ( = ?auto_207036 ?auto_207042 ) ) ( not ( = ?auto_207036 ?auto_207041 ) ) ( not ( = ?auto_207036 ?auto_207039 ) ) ( CLEAR ?auto_207035 ) ( ON ?auto_207036 ?auto_207037 ) ( CLEAR ?auto_207036 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_207042 ?auto_207041 ?auto_207039 ?auto_207040 ?auto_207038 ?auto_207037 )
      ( MAKE-4PILE ?auto_207035 ?auto_207036 ?auto_207037 ?auto_207038 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_207043 - BLOCK
      ?auto_207044 - BLOCK
      ?auto_207045 - BLOCK
      ?auto_207046 - BLOCK
    )
    :vars
    (
      ?auto_207047 - BLOCK
      ?auto_207048 - BLOCK
      ?auto_207049 - BLOCK
      ?auto_207050 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_207043 ?auto_207044 ) ) ( not ( = ?auto_207043 ?auto_207045 ) ) ( not ( = ?auto_207043 ?auto_207046 ) ) ( not ( = ?auto_207044 ?auto_207045 ) ) ( not ( = ?auto_207044 ?auto_207046 ) ) ( not ( = ?auto_207045 ?auto_207046 ) ) ( ON ?auto_207046 ?auto_207047 ) ( not ( = ?auto_207043 ?auto_207047 ) ) ( not ( = ?auto_207044 ?auto_207047 ) ) ( not ( = ?auto_207045 ?auto_207047 ) ) ( not ( = ?auto_207046 ?auto_207047 ) ) ( ON ?auto_207045 ?auto_207046 ) ( ON-TABLE ?auto_207048 ) ( ON ?auto_207049 ?auto_207048 ) ( ON ?auto_207050 ?auto_207049 ) ( ON ?auto_207047 ?auto_207050 ) ( not ( = ?auto_207048 ?auto_207049 ) ) ( not ( = ?auto_207048 ?auto_207050 ) ) ( not ( = ?auto_207048 ?auto_207047 ) ) ( not ( = ?auto_207048 ?auto_207046 ) ) ( not ( = ?auto_207048 ?auto_207045 ) ) ( not ( = ?auto_207049 ?auto_207050 ) ) ( not ( = ?auto_207049 ?auto_207047 ) ) ( not ( = ?auto_207049 ?auto_207046 ) ) ( not ( = ?auto_207049 ?auto_207045 ) ) ( not ( = ?auto_207050 ?auto_207047 ) ) ( not ( = ?auto_207050 ?auto_207046 ) ) ( not ( = ?auto_207050 ?auto_207045 ) ) ( not ( = ?auto_207043 ?auto_207048 ) ) ( not ( = ?auto_207043 ?auto_207049 ) ) ( not ( = ?auto_207043 ?auto_207050 ) ) ( not ( = ?auto_207044 ?auto_207048 ) ) ( not ( = ?auto_207044 ?auto_207049 ) ) ( not ( = ?auto_207044 ?auto_207050 ) ) ( ON ?auto_207044 ?auto_207045 ) ( CLEAR ?auto_207044 ) ( HOLDING ?auto_207043 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_207043 )
      ( MAKE-4PILE ?auto_207043 ?auto_207044 ?auto_207045 ?auto_207046 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_207051 - BLOCK
      ?auto_207052 - BLOCK
      ?auto_207053 - BLOCK
      ?auto_207054 - BLOCK
    )
    :vars
    (
      ?auto_207055 - BLOCK
      ?auto_207057 - BLOCK
      ?auto_207058 - BLOCK
      ?auto_207056 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_207051 ?auto_207052 ) ) ( not ( = ?auto_207051 ?auto_207053 ) ) ( not ( = ?auto_207051 ?auto_207054 ) ) ( not ( = ?auto_207052 ?auto_207053 ) ) ( not ( = ?auto_207052 ?auto_207054 ) ) ( not ( = ?auto_207053 ?auto_207054 ) ) ( ON ?auto_207054 ?auto_207055 ) ( not ( = ?auto_207051 ?auto_207055 ) ) ( not ( = ?auto_207052 ?auto_207055 ) ) ( not ( = ?auto_207053 ?auto_207055 ) ) ( not ( = ?auto_207054 ?auto_207055 ) ) ( ON ?auto_207053 ?auto_207054 ) ( ON-TABLE ?auto_207057 ) ( ON ?auto_207058 ?auto_207057 ) ( ON ?auto_207056 ?auto_207058 ) ( ON ?auto_207055 ?auto_207056 ) ( not ( = ?auto_207057 ?auto_207058 ) ) ( not ( = ?auto_207057 ?auto_207056 ) ) ( not ( = ?auto_207057 ?auto_207055 ) ) ( not ( = ?auto_207057 ?auto_207054 ) ) ( not ( = ?auto_207057 ?auto_207053 ) ) ( not ( = ?auto_207058 ?auto_207056 ) ) ( not ( = ?auto_207058 ?auto_207055 ) ) ( not ( = ?auto_207058 ?auto_207054 ) ) ( not ( = ?auto_207058 ?auto_207053 ) ) ( not ( = ?auto_207056 ?auto_207055 ) ) ( not ( = ?auto_207056 ?auto_207054 ) ) ( not ( = ?auto_207056 ?auto_207053 ) ) ( not ( = ?auto_207051 ?auto_207057 ) ) ( not ( = ?auto_207051 ?auto_207058 ) ) ( not ( = ?auto_207051 ?auto_207056 ) ) ( not ( = ?auto_207052 ?auto_207057 ) ) ( not ( = ?auto_207052 ?auto_207058 ) ) ( not ( = ?auto_207052 ?auto_207056 ) ) ( ON ?auto_207052 ?auto_207053 ) ( ON ?auto_207051 ?auto_207052 ) ( CLEAR ?auto_207051 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_207057 ?auto_207058 ?auto_207056 ?auto_207055 ?auto_207054 ?auto_207053 ?auto_207052 )
      ( MAKE-4PILE ?auto_207051 ?auto_207052 ?auto_207053 ?auto_207054 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_207059 - BLOCK
      ?auto_207060 - BLOCK
      ?auto_207061 - BLOCK
      ?auto_207062 - BLOCK
    )
    :vars
    (
      ?auto_207064 - BLOCK
      ?auto_207066 - BLOCK
      ?auto_207065 - BLOCK
      ?auto_207063 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_207059 ?auto_207060 ) ) ( not ( = ?auto_207059 ?auto_207061 ) ) ( not ( = ?auto_207059 ?auto_207062 ) ) ( not ( = ?auto_207060 ?auto_207061 ) ) ( not ( = ?auto_207060 ?auto_207062 ) ) ( not ( = ?auto_207061 ?auto_207062 ) ) ( ON ?auto_207062 ?auto_207064 ) ( not ( = ?auto_207059 ?auto_207064 ) ) ( not ( = ?auto_207060 ?auto_207064 ) ) ( not ( = ?auto_207061 ?auto_207064 ) ) ( not ( = ?auto_207062 ?auto_207064 ) ) ( ON ?auto_207061 ?auto_207062 ) ( ON-TABLE ?auto_207066 ) ( ON ?auto_207065 ?auto_207066 ) ( ON ?auto_207063 ?auto_207065 ) ( ON ?auto_207064 ?auto_207063 ) ( not ( = ?auto_207066 ?auto_207065 ) ) ( not ( = ?auto_207066 ?auto_207063 ) ) ( not ( = ?auto_207066 ?auto_207064 ) ) ( not ( = ?auto_207066 ?auto_207062 ) ) ( not ( = ?auto_207066 ?auto_207061 ) ) ( not ( = ?auto_207065 ?auto_207063 ) ) ( not ( = ?auto_207065 ?auto_207064 ) ) ( not ( = ?auto_207065 ?auto_207062 ) ) ( not ( = ?auto_207065 ?auto_207061 ) ) ( not ( = ?auto_207063 ?auto_207064 ) ) ( not ( = ?auto_207063 ?auto_207062 ) ) ( not ( = ?auto_207063 ?auto_207061 ) ) ( not ( = ?auto_207059 ?auto_207066 ) ) ( not ( = ?auto_207059 ?auto_207065 ) ) ( not ( = ?auto_207059 ?auto_207063 ) ) ( not ( = ?auto_207060 ?auto_207066 ) ) ( not ( = ?auto_207060 ?auto_207065 ) ) ( not ( = ?auto_207060 ?auto_207063 ) ) ( ON ?auto_207060 ?auto_207061 ) ( HOLDING ?auto_207059 ) ( CLEAR ?auto_207060 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_207066 ?auto_207065 ?auto_207063 ?auto_207064 ?auto_207062 ?auto_207061 ?auto_207060 ?auto_207059 )
      ( MAKE-4PILE ?auto_207059 ?auto_207060 ?auto_207061 ?auto_207062 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_207067 - BLOCK
      ?auto_207068 - BLOCK
      ?auto_207069 - BLOCK
      ?auto_207070 - BLOCK
    )
    :vars
    (
      ?auto_207073 - BLOCK
      ?auto_207074 - BLOCK
      ?auto_207071 - BLOCK
      ?auto_207072 - BLOCK
      ?auto_207075 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_207067 ?auto_207068 ) ) ( not ( = ?auto_207067 ?auto_207069 ) ) ( not ( = ?auto_207067 ?auto_207070 ) ) ( not ( = ?auto_207068 ?auto_207069 ) ) ( not ( = ?auto_207068 ?auto_207070 ) ) ( not ( = ?auto_207069 ?auto_207070 ) ) ( ON ?auto_207070 ?auto_207073 ) ( not ( = ?auto_207067 ?auto_207073 ) ) ( not ( = ?auto_207068 ?auto_207073 ) ) ( not ( = ?auto_207069 ?auto_207073 ) ) ( not ( = ?auto_207070 ?auto_207073 ) ) ( ON ?auto_207069 ?auto_207070 ) ( ON-TABLE ?auto_207074 ) ( ON ?auto_207071 ?auto_207074 ) ( ON ?auto_207072 ?auto_207071 ) ( ON ?auto_207073 ?auto_207072 ) ( not ( = ?auto_207074 ?auto_207071 ) ) ( not ( = ?auto_207074 ?auto_207072 ) ) ( not ( = ?auto_207074 ?auto_207073 ) ) ( not ( = ?auto_207074 ?auto_207070 ) ) ( not ( = ?auto_207074 ?auto_207069 ) ) ( not ( = ?auto_207071 ?auto_207072 ) ) ( not ( = ?auto_207071 ?auto_207073 ) ) ( not ( = ?auto_207071 ?auto_207070 ) ) ( not ( = ?auto_207071 ?auto_207069 ) ) ( not ( = ?auto_207072 ?auto_207073 ) ) ( not ( = ?auto_207072 ?auto_207070 ) ) ( not ( = ?auto_207072 ?auto_207069 ) ) ( not ( = ?auto_207067 ?auto_207074 ) ) ( not ( = ?auto_207067 ?auto_207071 ) ) ( not ( = ?auto_207067 ?auto_207072 ) ) ( not ( = ?auto_207068 ?auto_207074 ) ) ( not ( = ?auto_207068 ?auto_207071 ) ) ( not ( = ?auto_207068 ?auto_207072 ) ) ( ON ?auto_207068 ?auto_207069 ) ( CLEAR ?auto_207068 ) ( ON ?auto_207067 ?auto_207075 ) ( CLEAR ?auto_207067 ) ( HAND-EMPTY ) ( not ( = ?auto_207067 ?auto_207075 ) ) ( not ( = ?auto_207068 ?auto_207075 ) ) ( not ( = ?auto_207069 ?auto_207075 ) ) ( not ( = ?auto_207070 ?auto_207075 ) ) ( not ( = ?auto_207073 ?auto_207075 ) ) ( not ( = ?auto_207074 ?auto_207075 ) ) ( not ( = ?auto_207071 ?auto_207075 ) ) ( not ( = ?auto_207072 ?auto_207075 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_207067 ?auto_207075 )
      ( MAKE-4PILE ?auto_207067 ?auto_207068 ?auto_207069 ?auto_207070 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_207076 - BLOCK
      ?auto_207077 - BLOCK
      ?auto_207078 - BLOCK
      ?auto_207079 - BLOCK
    )
    :vars
    (
      ?auto_207082 - BLOCK
      ?auto_207081 - BLOCK
      ?auto_207083 - BLOCK
      ?auto_207080 - BLOCK
      ?auto_207084 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_207076 ?auto_207077 ) ) ( not ( = ?auto_207076 ?auto_207078 ) ) ( not ( = ?auto_207076 ?auto_207079 ) ) ( not ( = ?auto_207077 ?auto_207078 ) ) ( not ( = ?auto_207077 ?auto_207079 ) ) ( not ( = ?auto_207078 ?auto_207079 ) ) ( ON ?auto_207079 ?auto_207082 ) ( not ( = ?auto_207076 ?auto_207082 ) ) ( not ( = ?auto_207077 ?auto_207082 ) ) ( not ( = ?auto_207078 ?auto_207082 ) ) ( not ( = ?auto_207079 ?auto_207082 ) ) ( ON ?auto_207078 ?auto_207079 ) ( ON-TABLE ?auto_207081 ) ( ON ?auto_207083 ?auto_207081 ) ( ON ?auto_207080 ?auto_207083 ) ( ON ?auto_207082 ?auto_207080 ) ( not ( = ?auto_207081 ?auto_207083 ) ) ( not ( = ?auto_207081 ?auto_207080 ) ) ( not ( = ?auto_207081 ?auto_207082 ) ) ( not ( = ?auto_207081 ?auto_207079 ) ) ( not ( = ?auto_207081 ?auto_207078 ) ) ( not ( = ?auto_207083 ?auto_207080 ) ) ( not ( = ?auto_207083 ?auto_207082 ) ) ( not ( = ?auto_207083 ?auto_207079 ) ) ( not ( = ?auto_207083 ?auto_207078 ) ) ( not ( = ?auto_207080 ?auto_207082 ) ) ( not ( = ?auto_207080 ?auto_207079 ) ) ( not ( = ?auto_207080 ?auto_207078 ) ) ( not ( = ?auto_207076 ?auto_207081 ) ) ( not ( = ?auto_207076 ?auto_207083 ) ) ( not ( = ?auto_207076 ?auto_207080 ) ) ( not ( = ?auto_207077 ?auto_207081 ) ) ( not ( = ?auto_207077 ?auto_207083 ) ) ( not ( = ?auto_207077 ?auto_207080 ) ) ( ON ?auto_207076 ?auto_207084 ) ( CLEAR ?auto_207076 ) ( not ( = ?auto_207076 ?auto_207084 ) ) ( not ( = ?auto_207077 ?auto_207084 ) ) ( not ( = ?auto_207078 ?auto_207084 ) ) ( not ( = ?auto_207079 ?auto_207084 ) ) ( not ( = ?auto_207082 ?auto_207084 ) ) ( not ( = ?auto_207081 ?auto_207084 ) ) ( not ( = ?auto_207083 ?auto_207084 ) ) ( not ( = ?auto_207080 ?auto_207084 ) ) ( HOLDING ?auto_207077 ) ( CLEAR ?auto_207078 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_207081 ?auto_207083 ?auto_207080 ?auto_207082 ?auto_207079 ?auto_207078 ?auto_207077 )
      ( MAKE-4PILE ?auto_207076 ?auto_207077 ?auto_207078 ?auto_207079 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_207085 - BLOCK
      ?auto_207086 - BLOCK
      ?auto_207087 - BLOCK
      ?auto_207088 - BLOCK
    )
    :vars
    (
      ?auto_207091 - BLOCK
      ?auto_207093 - BLOCK
      ?auto_207092 - BLOCK
      ?auto_207089 - BLOCK
      ?auto_207090 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_207085 ?auto_207086 ) ) ( not ( = ?auto_207085 ?auto_207087 ) ) ( not ( = ?auto_207085 ?auto_207088 ) ) ( not ( = ?auto_207086 ?auto_207087 ) ) ( not ( = ?auto_207086 ?auto_207088 ) ) ( not ( = ?auto_207087 ?auto_207088 ) ) ( ON ?auto_207088 ?auto_207091 ) ( not ( = ?auto_207085 ?auto_207091 ) ) ( not ( = ?auto_207086 ?auto_207091 ) ) ( not ( = ?auto_207087 ?auto_207091 ) ) ( not ( = ?auto_207088 ?auto_207091 ) ) ( ON ?auto_207087 ?auto_207088 ) ( ON-TABLE ?auto_207093 ) ( ON ?auto_207092 ?auto_207093 ) ( ON ?auto_207089 ?auto_207092 ) ( ON ?auto_207091 ?auto_207089 ) ( not ( = ?auto_207093 ?auto_207092 ) ) ( not ( = ?auto_207093 ?auto_207089 ) ) ( not ( = ?auto_207093 ?auto_207091 ) ) ( not ( = ?auto_207093 ?auto_207088 ) ) ( not ( = ?auto_207093 ?auto_207087 ) ) ( not ( = ?auto_207092 ?auto_207089 ) ) ( not ( = ?auto_207092 ?auto_207091 ) ) ( not ( = ?auto_207092 ?auto_207088 ) ) ( not ( = ?auto_207092 ?auto_207087 ) ) ( not ( = ?auto_207089 ?auto_207091 ) ) ( not ( = ?auto_207089 ?auto_207088 ) ) ( not ( = ?auto_207089 ?auto_207087 ) ) ( not ( = ?auto_207085 ?auto_207093 ) ) ( not ( = ?auto_207085 ?auto_207092 ) ) ( not ( = ?auto_207085 ?auto_207089 ) ) ( not ( = ?auto_207086 ?auto_207093 ) ) ( not ( = ?auto_207086 ?auto_207092 ) ) ( not ( = ?auto_207086 ?auto_207089 ) ) ( ON ?auto_207085 ?auto_207090 ) ( not ( = ?auto_207085 ?auto_207090 ) ) ( not ( = ?auto_207086 ?auto_207090 ) ) ( not ( = ?auto_207087 ?auto_207090 ) ) ( not ( = ?auto_207088 ?auto_207090 ) ) ( not ( = ?auto_207091 ?auto_207090 ) ) ( not ( = ?auto_207093 ?auto_207090 ) ) ( not ( = ?auto_207092 ?auto_207090 ) ) ( not ( = ?auto_207089 ?auto_207090 ) ) ( CLEAR ?auto_207087 ) ( ON ?auto_207086 ?auto_207085 ) ( CLEAR ?auto_207086 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_207090 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_207090 ?auto_207085 )
      ( MAKE-4PILE ?auto_207085 ?auto_207086 ?auto_207087 ?auto_207088 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_207094 - BLOCK
      ?auto_207095 - BLOCK
      ?auto_207096 - BLOCK
      ?auto_207097 - BLOCK
    )
    :vars
    (
      ?auto_207098 - BLOCK
      ?auto_207102 - BLOCK
      ?auto_207101 - BLOCK
      ?auto_207100 - BLOCK
      ?auto_207099 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_207094 ?auto_207095 ) ) ( not ( = ?auto_207094 ?auto_207096 ) ) ( not ( = ?auto_207094 ?auto_207097 ) ) ( not ( = ?auto_207095 ?auto_207096 ) ) ( not ( = ?auto_207095 ?auto_207097 ) ) ( not ( = ?auto_207096 ?auto_207097 ) ) ( ON ?auto_207097 ?auto_207098 ) ( not ( = ?auto_207094 ?auto_207098 ) ) ( not ( = ?auto_207095 ?auto_207098 ) ) ( not ( = ?auto_207096 ?auto_207098 ) ) ( not ( = ?auto_207097 ?auto_207098 ) ) ( ON-TABLE ?auto_207102 ) ( ON ?auto_207101 ?auto_207102 ) ( ON ?auto_207100 ?auto_207101 ) ( ON ?auto_207098 ?auto_207100 ) ( not ( = ?auto_207102 ?auto_207101 ) ) ( not ( = ?auto_207102 ?auto_207100 ) ) ( not ( = ?auto_207102 ?auto_207098 ) ) ( not ( = ?auto_207102 ?auto_207097 ) ) ( not ( = ?auto_207102 ?auto_207096 ) ) ( not ( = ?auto_207101 ?auto_207100 ) ) ( not ( = ?auto_207101 ?auto_207098 ) ) ( not ( = ?auto_207101 ?auto_207097 ) ) ( not ( = ?auto_207101 ?auto_207096 ) ) ( not ( = ?auto_207100 ?auto_207098 ) ) ( not ( = ?auto_207100 ?auto_207097 ) ) ( not ( = ?auto_207100 ?auto_207096 ) ) ( not ( = ?auto_207094 ?auto_207102 ) ) ( not ( = ?auto_207094 ?auto_207101 ) ) ( not ( = ?auto_207094 ?auto_207100 ) ) ( not ( = ?auto_207095 ?auto_207102 ) ) ( not ( = ?auto_207095 ?auto_207101 ) ) ( not ( = ?auto_207095 ?auto_207100 ) ) ( ON ?auto_207094 ?auto_207099 ) ( not ( = ?auto_207094 ?auto_207099 ) ) ( not ( = ?auto_207095 ?auto_207099 ) ) ( not ( = ?auto_207096 ?auto_207099 ) ) ( not ( = ?auto_207097 ?auto_207099 ) ) ( not ( = ?auto_207098 ?auto_207099 ) ) ( not ( = ?auto_207102 ?auto_207099 ) ) ( not ( = ?auto_207101 ?auto_207099 ) ) ( not ( = ?auto_207100 ?auto_207099 ) ) ( ON ?auto_207095 ?auto_207094 ) ( CLEAR ?auto_207095 ) ( ON-TABLE ?auto_207099 ) ( HOLDING ?auto_207096 ) ( CLEAR ?auto_207097 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_207102 ?auto_207101 ?auto_207100 ?auto_207098 ?auto_207097 ?auto_207096 )
      ( MAKE-4PILE ?auto_207094 ?auto_207095 ?auto_207096 ?auto_207097 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_207103 - BLOCK
      ?auto_207104 - BLOCK
      ?auto_207105 - BLOCK
      ?auto_207106 - BLOCK
    )
    :vars
    (
      ?auto_207107 - BLOCK
      ?auto_207109 - BLOCK
      ?auto_207108 - BLOCK
      ?auto_207111 - BLOCK
      ?auto_207110 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_207103 ?auto_207104 ) ) ( not ( = ?auto_207103 ?auto_207105 ) ) ( not ( = ?auto_207103 ?auto_207106 ) ) ( not ( = ?auto_207104 ?auto_207105 ) ) ( not ( = ?auto_207104 ?auto_207106 ) ) ( not ( = ?auto_207105 ?auto_207106 ) ) ( ON ?auto_207106 ?auto_207107 ) ( not ( = ?auto_207103 ?auto_207107 ) ) ( not ( = ?auto_207104 ?auto_207107 ) ) ( not ( = ?auto_207105 ?auto_207107 ) ) ( not ( = ?auto_207106 ?auto_207107 ) ) ( ON-TABLE ?auto_207109 ) ( ON ?auto_207108 ?auto_207109 ) ( ON ?auto_207111 ?auto_207108 ) ( ON ?auto_207107 ?auto_207111 ) ( not ( = ?auto_207109 ?auto_207108 ) ) ( not ( = ?auto_207109 ?auto_207111 ) ) ( not ( = ?auto_207109 ?auto_207107 ) ) ( not ( = ?auto_207109 ?auto_207106 ) ) ( not ( = ?auto_207109 ?auto_207105 ) ) ( not ( = ?auto_207108 ?auto_207111 ) ) ( not ( = ?auto_207108 ?auto_207107 ) ) ( not ( = ?auto_207108 ?auto_207106 ) ) ( not ( = ?auto_207108 ?auto_207105 ) ) ( not ( = ?auto_207111 ?auto_207107 ) ) ( not ( = ?auto_207111 ?auto_207106 ) ) ( not ( = ?auto_207111 ?auto_207105 ) ) ( not ( = ?auto_207103 ?auto_207109 ) ) ( not ( = ?auto_207103 ?auto_207108 ) ) ( not ( = ?auto_207103 ?auto_207111 ) ) ( not ( = ?auto_207104 ?auto_207109 ) ) ( not ( = ?auto_207104 ?auto_207108 ) ) ( not ( = ?auto_207104 ?auto_207111 ) ) ( ON ?auto_207103 ?auto_207110 ) ( not ( = ?auto_207103 ?auto_207110 ) ) ( not ( = ?auto_207104 ?auto_207110 ) ) ( not ( = ?auto_207105 ?auto_207110 ) ) ( not ( = ?auto_207106 ?auto_207110 ) ) ( not ( = ?auto_207107 ?auto_207110 ) ) ( not ( = ?auto_207109 ?auto_207110 ) ) ( not ( = ?auto_207108 ?auto_207110 ) ) ( not ( = ?auto_207111 ?auto_207110 ) ) ( ON ?auto_207104 ?auto_207103 ) ( ON-TABLE ?auto_207110 ) ( CLEAR ?auto_207106 ) ( ON ?auto_207105 ?auto_207104 ) ( CLEAR ?auto_207105 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_207110 ?auto_207103 ?auto_207104 )
      ( MAKE-4PILE ?auto_207103 ?auto_207104 ?auto_207105 ?auto_207106 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_207112 - BLOCK
      ?auto_207113 - BLOCK
      ?auto_207114 - BLOCK
      ?auto_207115 - BLOCK
    )
    :vars
    (
      ?auto_207118 - BLOCK
      ?auto_207120 - BLOCK
      ?auto_207119 - BLOCK
      ?auto_207116 - BLOCK
      ?auto_207117 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_207112 ?auto_207113 ) ) ( not ( = ?auto_207112 ?auto_207114 ) ) ( not ( = ?auto_207112 ?auto_207115 ) ) ( not ( = ?auto_207113 ?auto_207114 ) ) ( not ( = ?auto_207113 ?auto_207115 ) ) ( not ( = ?auto_207114 ?auto_207115 ) ) ( not ( = ?auto_207112 ?auto_207118 ) ) ( not ( = ?auto_207113 ?auto_207118 ) ) ( not ( = ?auto_207114 ?auto_207118 ) ) ( not ( = ?auto_207115 ?auto_207118 ) ) ( ON-TABLE ?auto_207120 ) ( ON ?auto_207119 ?auto_207120 ) ( ON ?auto_207116 ?auto_207119 ) ( ON ?auto_207118 ?auto_207116 ) ( not ( = ?auto_207120 ?auto_207119 ) ) ( not ( = ?auto_207120 ?auto_207116 ) ) ( not ( = ?auto_207120 ?auto_207118 ) ) ( not ( = ?auto_207120 ?auto_207115 ) ) ( not ( = ?auto_207120 ?auto_207114 ) ) ( not ( = ?auto_207119 ?auto_207116 ) ) ( not ( = ?auto_207119 ?auto_207118 ) ) ( not ( = ?auto_207119 ?auto_207115 ) ) ( not ( = ?auto_207119 ?auto_207114 ) ) ( not ( = ?auto_207116 ?auto_207118 ) ) ( not ( = ?auto_207116 ?auto_207115 ) ) ( not ( = ?auto_207116 ?auto_207114 ) ) ( not ( = ?auto_207112 ?auto_207120 ) ) ( not ( = ?auto_207112 ?auto_207119 ) ) ( not ( = ?auto_207112 ?auto_207116 ) ) ( not ( = ?auto_207113 ?auto_207120 ) ) ( not ( = ?auto_207113 ?auto_207119 ) ) ( not ( = ?auto_207113 ?auto_207116 ) ) ( ON ?auto_207112 ?auto_207117 ) ( not ( = ?auto_207112 ?auto_207117 ) ) ( not ( = ?auto_207113 ?auto_207117 ) ) ( not ( = ?auto_207114 ?auto_207117 ) ) ( not ( = ?auto_207115 ?auto_207117 ) ) ( not ( = ?auto_207118 ?auto_207117 ) ) ( not ( = ?auto_207120 ?auto_207117 ) ) ( not ( = ?auto_207119 ?auto_207117 ) ) ( not ( = ?auto_207116 ?auto_207117 ) ) ( ON ?auto_207113 ?auto_207112 ) ( ON-TABLE ?auto_207117 ) ( ON ?auto_207114 ?auto_207113 ) ( CLEAR ?auto_207114 ) ( HOLDING ?auto_207115 ) ( CLEAR ?auto_207118 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_207120 ?auto_207119 ?auto_207116 ?auto_207118 ?auto_207115 )
      ( MAKE-4PILE ?auto_207112 ?auto_207113 ?auto_207114 ?auto_207115 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_207121 - BLOCK
      ?auto_207122 - BLOCK
      ?auto_207123 - BLOCK
      ?auto_207124 - BLOCK
    )
    :vars
    (
      ?auto_207129 - BLOCK
      ?auto_207125 - BLOCK
      ?auto_207126 - BLOCK
      ?auto_207127 - BLOCK
      ?auto_207128 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_207121 ?auto_207122 ) ) ( not ( = ?auto_207121 ?auto_207123 ) ) ( not ( = ?auto_207121 ?auto_207124 ) ) ( not ( = ?auto_207122 ?auto_207123 ) ) ( not ( = ?auto_207122 ?auto_207124 ) ) ( not ( = ?auto_207123 ?auto_207124 ) ) ( not ( = ?auto_207121 ?auto_207129 ) ) ( not ( = ?auto_207122 ?auto_207129 ) ) ( not ( = ?auto_207123 ?auto_207129 ) ) ( not ( = ?auto_207124 ?auto_207129 ) ) ( ON-TABLE ?auto_207125 ) ( ON ?auto_207126 ?auto_207125 ) ( ON ?auto_207127 ?auto_207126 ) ( ON ?auto_207129 ?auto_207127 ) ( not ( = ?auto_207125 ?auto_207126 ) ) ( not ( = ?auto_207125 ?auto_207127 ) ) ( not ( = ?auto_207125 ?auto_207129 ) ) ( not ( = ?auto_207125 ?auto_207124 ) ) ( not ( = ?auto_207125 ?auto_207123 ) ) ( not ( = ?auto_207126 ?auto_207127 ) ) ( not ( = ?auto_207126 ?auto_207129 ) ) ( not ( = ?auto_207126 ?auto_207124 ) ) ( not ( = ?auto_207126 ?auto_207123 ) ) ( not ( = ?auto_207127 ?auto_207129 ) ) ( not ( = ?auto_207127 ?auto_207124 ) ) ( not ( = ?auto_207127 ?auto_207123 ) ) ( not ( = ?auto_207121 ?auto_207125 ) ) ( not ( = ?auto_207121 ?auto_207126 ) ) ( not ( = ?auto_207121 ?auto_207127 ) ) ( not ( = ?auto_207122 ?auto_207125 ) ) ( not ( = ?auto_207122 ?auto_207126 ) ) ( not ( = ?auto_207122 ?auto_207127 ) ) ( ON ?auto_207121 ?auto_207128 ) ( not ( = ?auto_207121 ?auto_207128 ) ) ( not ( = ?auto_207122 ?auto_207128 ) ) ( not ( = ?auto_207123 ?auto_207128 ) ) ( not ( = ?auto_207124 ?auto_207128 ) ) ( not ( = ?auto_207129 ?auto_207128 ) ) ( not ( = ?auto_207125 ?auto_207128 ) ) ( not ( = ?auto_207126 ?auto_207128 ) ) ( not ( = ?auto_207127 ?auto_207128 ) ) ( ON ?auto_207122 ?auto_207121 ) ( ON-TABLE ?auto_207128 ) ( ON ?auto_207123 ?auto_207122 ) ( CLEAR ?auto_207129 ) ( ON ?auto_207124 ?auto_207123 ) ( CLEAR ?auto_207124 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_207128 ?auto_207121 ?auto_207122 ?auto_207123 )
      ( MAKE-4PILE ?auto_207121 ?auto_207122 ?auto_207123 ?auto_207124 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_207130 - BLOCK
      ?auto_207131 - BLOCK
      ?auto_207132 - BLOCK
      ?auto_207133 - BLOCK
    )
    :vars
    (
      ?auto_207136 - BLOCK
      ?auto_207138 - BLOCK
      ?auto_207134 - BLOCK
      ?auto_207137 - BLOCK
      ?auto_207135 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_207130 ?auto_207131 ) ) ( not ( = ?auto_207130 ?auto_207132 ) ) ( not ( = ?auto_207130 ?auto_207133 ) ) ( not ( = ?auto_207131 ?auto_207132 ) ) ( not ( = ?auto_207131 ?auto_207133 ) ) ( not ( = ?auto_207132 ?auto_207133 ) ) ( not ( = ?auto_207130 ?auto_207136 ) ) ( not ( = ?auto_207131 ?auto_207136 ) ) ( not ( = ?auto_207132 ?auto_207136 ) ) ( not ( = ?auto_207133 ?auto_207136 ) ) ( ON-TABLE ?auto_207138 ) ( ON ?auto_207134 ?auto_207138 ) ( ON ?auto_207137 ?auto_207134 ) ( not ( = ?auto_207138 ?auto_207134 ) ) ( not ( = ?auto_207138 ?auto_207137 ) ) ( not ( = ?auto_207138 ?auto_207136 ) ) ( not ( = ?auto_207138 ?auto_207133 ) ) ( not ( = ?auto_207138 ?auto_207132 ) ) ( not ( = ?auto_207134 ?auto_207137 ) ) ( not ( = ?auto_207134 ?auto_207136 ) ) ( not ( = ?auto_207134 ?auto_207133 ) ) ( not ( = ?auto_207134 ?auto_207132 ) ) ( not ( = ?auto_207137 ?auto_207136 ) ) ( not ( = ?auto_207137 ?auto_207133 ) ) ( not ( = ?auto_207137 ?auto_207132 ) ) ( not ( = ?auto_207130 ?auto_207138 ) ) ( not ( = ?auto_207130 ?auto_207134 ) ) ( not ( = ?auto_207130 ?auto_207137 ) ) ( not ( = ?auto_207131 ?auto_207138 ) ) ( not ( = ?auto_207131 ?auto_207134 ) ) ( not ( = ?auto_207131 ?auto_207137 ) ) ( ON ?auto_207130 ?auto_207135 ) ( not ( = ?auto_207130 ?auto_207135 ) ) ( not ( = ?auto_207131 ?auto_207135 ) ) ( not ( = ?auto_207132 ?auto_207135 ) ) ( not ( = ?auto_207133 ?auto_207135 ) ) ( not ( = ?auto_207136 ?auto_207135 ) ) ( not ( = ?auto_207138 ?auto_207135 ) ) ( not ( = ?auto_207134 ?auto_207135 ) ) ( not ( = ?auto_207137 ?auto_207135 ) ) ( ON ?auto_207131 ?auto_207130 ) ( ON-TABLE ?auto_207135 ) ( ON ?auto_207132 ?auto_207131 ) ( ON ?auto_207133 ?auto_207132 ) ( CLEAR ?auto_207133 ) ( HOLDING ?auto_207136 ) ( CLEAR ?auto_207137 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_207138 ?auto_207134 ?auto_207137 ?auto_207136 )
      ( MAKE-4PILE ?auto_207130 ?auto_207131 ?auto_207132 ?auto_207133 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_207139 - BLOCK
      ?auto_207140 - BLOCK
      ?auto_207141 - BLOCK
      ?auto_207142 - BLOCK
    )
    :vars
    (
      ?auto_207143 - BLOCK
      ?auto_207146 - BLOCK
      ?auto_207144 - BLOCK
      ?auto_207145 - BLOCK
      ?auto_207147 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_207139 ?auto_207140 ) ) ( not ( = ?auto_207139 ?auto_207141 ) ) ( not ( = ?auto_207139 ?auto_207142 ) ) ( not ( = ?auto_207140 ?auto_207141 ) ) ( not ( = ?auto_207140 ?auto_207142 ) ) ( not ( = ?auto_207141 ?auto_207142 ) ) ( not ( = ?auto_207139 ?auto_207143 ) ) ( not ( = ?auto_207140 ?auto_207143 ) ) ( not ( = ?auto_207141 ?auto_207143 ) ) ( not ( = ?auto_207142 ?auto_207143 ) ) ( ON-TABLE ?auto_207146 ) ( ON ?auto_207144 ?auto_207146 ) ( ON ?auto_207145 ?auto_207144 ) ( not ( = ?auto_207146 ?auto_207144 ) ) ( not ( = ?auto_207146 ?auto_207145 ) ) ( not ( = ?auto_207146 ?auto_207143 ) ) ( not ( = ?auto_207146 ?auto_207142 ) ) ( not ( = ?auto_207146 ?auto_207141 ) ) ( not ( = ?auto_207144 ?auto_207145 ) ) ( not ( = ?auto_207144 ?auto_207143 ) ) ( not ( = ?auto_207144 ?auto_207142 ) ) ( not ( = ?auto_207144 ?auto_207141 ) ) ( not ( = ?auto_207145 ?auto_207143 ) ) ( not ( = ?auto_207145 ?auto_207142 ) ) ( not ( = ?auto_207145 ?auto_207141 ) ) ( not ( = ?auto_207139 ?auto_207146 ) ) ( not ( = ?auto_207139 ?auto_207144 ) ) ( not ( = ?auto_207139 ?auto_207145 ) ) ( not ( = ?auto_207140 ?auto_207146 ) ) ( not ( = ?auto_207140 ?auto_207144 ) ) ( not ( = ?auto_207140 ?auto_207145 ) ) ( ON ?auto_207139 ?auto_207147 ) ( not ( = ?auto_207139 ?auto_207147 ) ) ( not ( = ?auto_207140 ?auto_207147 ) ) ( not ( = ?auto_207141 ?auto_207147 ) ) ( not ( = ?auto_207142 ?auto_207147 ) ) ( not ( = ?auto_207143 ?auto_207147 ) ) ( not ( = ?auto_207146 ?auto_207147 ) ) ( not ( = ?auto_207144 ?auto_207147 ) ) ( not ( = ?auto_207145 ?auto_207147 ) ) ( ON ?auto_207140 ?auto_207139 ) ( ON-TABLE ?auto_207147 ) ( ON ?auto_207141 ?auto_207140 ) ( ON ?auto_207142 ?auto_207141 ) ( CLEAR ?auto_207145 ) ( ON ?auto_207143 ?auto_207142 ) ( CLEAR ?auto_207143 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_207147 ?auto_207139 ?auto_207140 ?auto_207141 ?auto_207142 )
      ( MAKE-4PILE ?auto_207139 ?auto_207140 ?auto_207141 ?auto_207142 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_207148 - BLOCK
      ?auto_207149 - BLOCK
      ?auto_207150 - BLOCK
      ?auto_207151 - BLOCK
    )
    :vars
    (
      ?auto_207152 - BLOCK
      ?auto_207153 - BLOCK
      ?auto_207156 - BLOCK
      ?auto_207154 - BLOCK
      ?auto_207155 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_207148 ?auto_207149 ) ) ( not ( = ?auto_207148 ?auto_207150 ) ) ( not ( = ?auto_207148 ?auto_207151 ) ) ( not ( = ?auto_207149 ?auto_207150 ) ) ( not ( = ?auto_207149 ?auto_207151 ) ) ( not ( = ?auto_207150 ?auto_207151 ) ) ( not ( = ?auto_207148 ?auto_207152 ) ) ( not ( = ?auto_207149 ?auto_207152 ) ) ( not ( = ?auto_207150 ?auto_207152 ) ) ( not ( = ?auto_207151 ?auto_207152 ) ) ( ON-TABLE ?auto_207153 ) ( ON ?auto_207156 ?auto_207153 ) ( not ( = ?auto_207153 ?auto_207156 ) ) ( not ( = ?auto_207153 ?auto_207154 ) ) ( not ( = ?auto_207153 ?auto_207152 ) ) ( not ( = ?auto_207153 ?auto_207151 ) ) ( not ( = ?auto_207153 ?auto_207150 ) ) ( not ( = ?auto_207156 ?auto_207154 ) ) ( not ( = ?auto_207156 ?auto_207152 ) ) ( not ( = ?auto_207156 ?auto_207151 ) ) ( not ( = ?auto_207156 ?auto_207150 ) ) ( not ( = ?auto_207154 ?auto_207152 ) ) ( not ( = ?auto_207154 ?auto_207151 ) ) ( not ( = ?auto_207154 ?auto_207150 ) ) ( not ( = ?auto_207148 ?auto_207153 ) ) ( not ( = ?auto_207148 ?auto_207156 ) ) ( not ( = ?auto_207148 ?auto_207154 ) ) ( not ( = ?auto_207149 ?auto_207153 ) ) ( not ( = ?auto_207149 ?auto_207156 ) ) ( not ( = ?auto_207149 ?auto_207154 ) ) ( ON ?auto_207148 ?auto_207155 ) ( not ( = ?auto_207148 ?auto_207155 ) ) ( not ( = ?auto_207149 ?auto_207155 ) ) ( not ( = ?auto_207150 ?auto_207155 ) ) ( not ( = ?auto_207151 ?auto_207155 ) ) ( not ( = ?auto_207152 ?auto_207155 ) ) ( not ( = ?auto_207153 ?auto_207155 ) ) ( not ( = ?auto_207156 ?auto_207155 ) ) ( not ( = ?auto_207154 ?auto_207155 ) ) ( ON ?auto_207149 ?auto_207148 ) ( ON-TABLE ?auto_207155 ) ( ON ?auto_207150 ?auto_207149 ) ( ON ?auto_207151 ?auto_207150 ) ( ON ?auto_207152 ?auto_207151 ) ( CLEAR ?auto_207152 ) ( HOLDING ?auto_207154 ) ( CLEAR ?auto_207156 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_207153 ?auto_207156 ?auto_207154 )
      ( MAKE-4PILE ?auto_207148 ?auto_207149 ?auto_207150 ?auto_207151 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_207157 - BLOCK
      ?auto_207158 - BLOCK
      ?auto_207159 - BLOCK
      ?auto_207160 - BLOCK
    )
    :vars
    (
      ?auto_207165 - BLOCK
      ?auto_207162 - BLOCK
      ?auto_207161 - BLOCK
      ?auto_207164 - BLOCK
      ?auto_207163 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_207157 ?auto_207158 ) ) ( not ( = ?auto_207157 ?auto_207159 ) ) ( not ( = ?auto_207157 ?auto_207160 ) ) ( not ( = ?auto_207158 ?auto_207159 ) ) ( not ( = ?auto_207158 ?auto_207160 ) ) ( not ( = ?auto_207159 ?auto_207160 ) ) ( not ( = ?auto_207157 ?auto_207165 ) ) ( not ( = ?auto_207158 ?auto_207165 ) ) ( not ( = ?auto_207159 ?auto_207165 ) ) ( not ( = ?auto_207160 ?auto_207165 ) ) ( ON-TABLE ?auto_207162 ) ( ON ?auto_207161 ?auto_207162 ) ( not ( = ?auto_207162 ?auto_207161 ) ) ( not ( = ?auto_207162 ?auto_207164 ) ) ( not ( = ?auto_207162 ?auto_207165 ) ) ( not ( = ?auto_207162 ?auto_207160 ) ) ( not ( = ?auto_207162 ?auto_207159 ) ) ( not ( = ?auto_207161 ?auto_207164 ) ) ( not ( = ?auto_207161 ?auto_207165 ) ) ( not ( = ?auto_207161 ?auto_207160 ) ) ( not ( = ?auto_207161 ?auto_207159 ) ) ( not ( = ?auto_207164 ?auto_207165 ) ) ( not ( = ?auto_207164 ?auto_207160 ) ) ( not ( = ?auto_207164 ?auto_207159 ) ) ( not ( = ?auto_207157 ?auto_207162 ) ) ( not ( = ?auto_207157 ?auto_207161 ) ) ( not ( = ?auto_207157 ?auto_207164 ) ) ( not ( = ?auto_207158 ?auto_207162 ) ) ( not ( = ?auto_207158 ?auto_207161 ) ) ( not ( = ?auto_207158 ?auto_207164 ) ) ( ON ?auto_207157 ?auto_207163 ) ( not ( = ?auto_207157 ?auto_207163 ) ) ( not ( = ?auto_207158 ?auto_207163 ) ) ( not ( = ?auto_207159 ?auto_207163 ) ) ( not ( = ?auto_207160 ?auto_207163 ) ) ( not ( = ?auto_207165 ?auto_207163 ) ) ( not ( = ?auto_207162 ?auto_207163 ) ) ( not ( = ?auto_207161 ?auto_207163 ) ) ( not ( = ?auto_207164 ?auto_207163 ) ) ( ON ?auto_207158 ?auto_207157 ) ( ON-TABLE ?auto_207163 ) ( ON ?auto_207159 ?auto_207158 ) ( ON ?auto_207160 ?auto_207159 ) ( ON ?auto_207165 ?auto_207160 ) ( CLEAR ?auto_207161 ) ( ON ?auto_207164 ?auto_207165 ) ( CLEAR ?auto_207164 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_207163 ?auto_207157 ?auto_207158 ?auto_207159 ?auto_207160 ?auto_207165 )
      ( MAKE-4PILE ?auto_207157 ?auto_207158 ?auto_207159 ?auto_207160 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_207166 - BLOCK
      ?auto_207167 - BLOCK
      ?auto_207168 - BLOCK
      ?auto_207169 - BLOCK
    )
    :vars
    (
      ?auto_207174 - BLOCK
      ?auto_207171 - BLOCK
      ?auto_207173 - BLOCK
      ?auto_207172 - BLOCK
      ?auto_207170 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_207166 ?auto_207167 ) ) ( not ( = ?auto_207166 ?auto_207168 ) ) ( not ( = ?auto_207166 ?auto_207169 ) ) ( not ( = ?auto_207167 ?auto_207168 ) ) ( not ( = ?auto_207167 ?auto_207169 ) ) ( not ( = ?auto_207168 ?auto_207169 ) ) ( not ( = ?auto_207166 ?auto_207174 ) ) ( not ( = ?auto_207167 ?auto_207174 ) ) ( not ( = ?auto_207168 ?auto_207174 ) ) ( not ( = ?auto_207169 ?auto_207174 ) ) ( ON-TABLE ?auto_207171 ) ( not ( = ?auto_207171 ?auto_207173 ) ) ( not ( = ?auto_207171 ?auto_207172 ) ) ( not ( = ?auto_207171 ?auto_207174 ) ) ( not ( = ?auto_207171 ?auto_207169 ) ) ( not ( = ?auto_207171 ?auto_207168 ) ) ( not ( = ?auto_207173 ?auto_207172 ) ) ( not ( = ?auto_207173 ?auto_207174 ) ) ( not ( = ?auto_207173 ?auto_207169 ) ) ( not ( = ?auto_207173 ?auto_207168 ) ) ( not ( = ?auto_207172 ?auto_207174 ) ) ( not ( = ?auto_207172 ?auto_207169 ) ) ( not ( = ?auto_207172 ?auto_207168 ) ) ( not ( = ?auto_207166 ?auto_207171 ) ) ( not ( = ?auto_207166 ?auto_207173 ) ) ( not ( = ?auto_207166 ?auto_207172 ) ) ( not ( = ?auto_207167 ?auto_207171 ) ) ( not ( = ?auto_207167 ?auto_207173 ) ) ( not ( = ?auto_207167 ?auto_207172 ) ) ( ON ?auto_207166 ?auto_207170 ) ( not ( = ?auto_207166 ?auto_207170 ) ) ( not ( = ?auto_207167 ?auto_207170 ) ) ( not ( = ?auto_207168 ?auto_207170 ) ) ( not ( = ?auto_207169 ?auto_207170 ) ) ( not ( = ?auto_207174 ?auto_207170 ) ) ( not ( = ?auto_207171 ?auto_207170 ) ) ( not ( = ?auto_207173 ?auto_207170 ) ) ( not ( = ?auto_207172 ?auto_207170 ) ) ( ON ?auto_207167 ?auto_207166 ) ( ON-TABLE ?auto_207170 ) ( ON ?auto_207168 ?auto_207167 ) ( ON ?auto_207169 ?auto_207168 ) ( ON ?auto_207174 ?auto_207169 ) ( ON ?auto_207172 ?auto_207174 ) ( CLEAR ?auto_207172 ) ( HOLDING ?auto_207173 ) ( CLEAR ?auto_207171 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_207171 ?auto_207173 )
      ( MAKE-4PILE ?auto_207166 ?auto_207167 ?auto_207168 ?auto_207169 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_207175 - BLOCK
      ?auto_207176 - BLOCK
      ?auto_207177 - BLOCK
      ?auto_207178 - BLOCK
    )
    :vars
    (
      ?auto_207180 - BLOCK
      ?auto_207181 - BLOCK
      ?auto_207179 - BLOCK
      ?auto_207183 - BLOCK
      ?auto_207182 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_207175 ?auto_207176 ) ) ( not ( = ?auto_207175 ?auto_207177 ) ) ( not ( = ?auto_207175 ?auto_207178 ) ) ( not ( = ?auto_207176 ?auto_207177 ) ) ( not ( = ?auto_207176 ?auto_207178 ) ) ( not ( = ?auto_207177 ?auto_207178 ) ) ( not ( = ?auto_207175 ?auto_207180 ) ) ( not ( = ?auto_207176 ?auto_207180 ) ) ( not ( = ?auto_207177 ?auto_207180 ) ) ( not ( = ?auto_207178 ?auto_207180 ) ) ( ON-TABLE ?auto_207181 ) ( not ( = ?auto_207181 ?auto_207179 ) ) ( not ( = ?auto_207181 ?auto_207183 ) ) ( not ( = ?auto_207181 ?auto_207180 ) ) ( not ( = ?auto_207181 ?auto_207178 ) ) ( not ( = ?auto_207181 ?auto_207177 ) ) ( not ( = ?auto_207179 ?auto_207183 ) ) ( not ( = ?auto_207179 ?auto_207180 ) ) ( not ( = ?auto_207179 ?auto_207178 ) ) ( not ( = ?auto_207179 ?auto_207177 ) ) ( not ( = ?auto_207183 ?auto_207180 ) ) ( not ( = ?auto_207183 ?auto_207178 ) ) ( not ( = ?auto_207183 ?auto_207177 ) ) ( not ( = ?auto_207175 ?auto_207181 ) ) ( not ( = ?auto_207175 ?auto_207179 ) ) ( not ( = ?auto_207175 ?auto_207183 ) ) ( not ( = ?auto_207176 ?auto_207181 ) ) ( not ( = ?auto_207176 ?auto_207179 ) ) ( not ( = ?auto_207176 ?auto_207183 ) ) ( ON ?auto_207175 ?auto_207182 ) ( not ( = ?auto_207175 ?auto_207182 ) ) ( not ( = ?auto_207176 ?auto_207182 ) ) ( not ( = ?auto_207177 ?auto_207182 ) ) ( not ( = ?auto_207178 ?auto_207182 ) ) ( not ( = ?auto_207180 ?auto_207182 ) ) ( not ( = ?auto_207181 ?auto_207182 ) ) ( not ( = ?auto_207179 ?auto_207182 ) ) ( not ( = ?auto_207183 ?auto_207182 ) ) ( ON ?auto_207176 ?auto_207175 ) ( ON-TABLE ?auto_207182 ) ( ON ?auto_207177 ?auto_207176 ) ( ON ?auto_207178 ?auto_207177 ) ( ON ?auto_207180 ?auto_207178 ) ( ON ?auto_207183 ?auto_207180 ) ( CLEAR ?auto_207181 ) ( ON ?auto_207179 ?auto_207183 ) ( CLEAR ?auto_207179 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_207182 ?auto_207175 ?auto_207176 ?auto_207177 ?auto_207178 ?auto_207180 ?auto_207183 )
      ( MAKE-4PILE ?auto_207175 ?auto_207176 ?auto_207177 ?auto_207178 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_207184 - BLOCK
      ?auto_207185 - BLOCK
      ?auto_207186 - BLOCK
      ?auto_207187 - BLOCK
    )
    :vars
    (
      ?auto_207191 - BLOCK
      ?auto_207190 - BLOCK
      ?auto_207192 - BLOCK
      ?auto_207188 - BLOCK
      ?auto_207189 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_207184 ?auto_207185 ) ) ( not ( = ?auto_207184 ?auto_207186 ) ) ( not ( = ?auto_207184 ?auto_207187 ) ) ( not ( = ?auto_207185 ?auto_207186 ) ) ( not ( = ?auto_207185 ?auto_207187 ) ) ( not ( = ?auto_207186 ?auto_207187 ) ) ( not ( = ?auto_207184 ?auto_207191 ) ) ( not ( = ?auto_207185 ?auto_207191 ) ) ( not ( = ?auto_207186 ?auto_207191 ) ) ( not ( = ?auto_207187 ?auto_207191 ) ) ( not ( = ?auto_207190 ?auto_207192 ) ) ( not ( = ?auto_207190 ?auto_207188 ) ) ( not ( = ?auto_207190 ?auto_207191 ) ) ( not ( = ?auto_207190 ?auto_207187 ) ) ( not ( = ?auto_207190 ?auto_207186 ) ) ( not ( = ?auto_207192 ?auto_207188 ) ) ( not ( = ?auto_207192 ?auto_207191 ) ) ( not ( = ?auto_207192 ?auto_207187 ) ) ( not ( = ?auto_207192 ?auto_207186 ) ) ( not ( = ?auto_207188 ?auto_207191 ) ) ( not ( = ?auto_207188 ?auto_207187 ) ) ( not ( = ?auto_207188 ?auto_207186 ) ) ( not ( = ?auto_207184 ?auto_207190 ) ) ( not ( = ?auto_207184 ?auto_207192 ) ) ( not ( = ?auto_207184 ?auto_207188 ) ) ( not ( = ?auto_207185 ?auto_207190 ) ) ( not ( = ?auto_207185 ?auto_207192 ) ) ( not ( = ?auto_207185 ?auto_207188 ) ) ( ON ?auto_207184 ?auto_207189 ) ( not ( = ?auto_207184 ?auto_207189 ) ) ( not ( = ?auto_207185 ?auto_207189 ) ) ( not ( = ?auto_207186 ?auto_207189 ) ) ( not ( = ?auto_207187 ?auto_207189 ) ) ( not ( = ?auto_207191 ?auto_207189 ) ) ( not ( = ?auto_207190 ?auto_207189 ) ) ( not ( = ?auto_207192 ?auto_207189 ) ) ( not ( = ?auto_207188 ?auto_207189 ) ) ( ON ?auto_207185 ?auto_207184 ) ( ON-TABLE ?auto_207189 ) ( ON ?auto_207186 ?auto_207185 ) ( ON ?auto_207187 ?auto_207186 ) ( ON ?auto_207191 ?auto_207187 ) ( ON ?auto_207188 ?auto_207191 ) ( ON ?auto_207192 ?auto_207188 ) ( CLEAR ?auto_207192 ) ( HOLDING ?auto_207190 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_207190 )
      ( MAKE-4PILE ?auto_207184 ?auto_207185 ?auto_207186 ?auto_207187 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_207193 - BLOCK
      ?auto_207194 - BLOCK
      ?auto_207195 - BLOCK
      ?auto_207196 - BLOCK
    )
    :vars
    (
      ?auto_207200 - BLOCK
      ?auto_207198 - BLOCK
      ?auto_207197 - BLOCK
      ?auto_207199 - BLOCK
      ?auto_207201 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_207193 ?auto_207194 ) ) ( not ( = ?auto_207193 ?auto_207195 ) ) ( not ( = ?auto_207193 ?auto_207196 ) ) ( not ( = ?auto_207194 ?auto_207195 ) ) ( not ( = ?auto_207194 ?auto_207196 ) ) ( not ( = ?auto_207195 ?auto_207196 ) ) ( not ( = ?auto_207193 ?auto_207200 ) ) ( not ( = ?auto_207194 ?auto_207200 ) ) ( not ( = ?auto_207195 ?auto_207200 ) ) ( not ( = ?auto_207196 ?auto_207200 ) ) ( not ( = ?auto_207198 ?auto_207197 ) ) ( not ( = ?auto_207198 ?auto_207199 ) ) ( not ( = ?auto_207198 ?auto_207200 ) ) ( not ( = ?auto_207198 ?auto_207196 ) ) ( not ( = ?auto_207198 ?auto_207195 ) ) ( not ( = ?auto_207197 ?auto_207199 ) ) ( not ( = ?auto_207197 ?auto_207200 ) ) ( not ( = ?auto_207197 ?auto_207196 ) ) ( not ( = ?auto_207197 ?auto_207195 ) ) ( not ( = ?auto_207199 ?auto_207200 ) ) ( not ( = ?auto_207199 ?auto_207196 ) ) ( not ( = ?auto_207199 ?auto_207195 ) ) ( not ( = ?auto_207193 ?auto_207198 ) ) ( not ( = ?auto_207193 ?auto_207197 ) ) ( not ( = ?auto_207193 ?auto_207199 ) ) ( not ( = ?auto_207194 ?auto_207198 ) ) ( not ( = ?auto_207194 ?auto_207197 ) ) ( not ( = ?auto_207194 ?auto_207199 ) ) ( ON ?auto_207193 ?auto_207201 ) ( not ( = ?auto_207193 ?auto_207201 ) ) ( not ( = ?auto_207194 ?auto_207201 ) ) ( not ( = ?auto_207195 ?auto_207201 ) ) ( not ( = ?auto_207196 ?auto_207201 ) ) ( not ( = ?auto_207200 ?auto_207201 ) ) ( not ( = ?auto_207198 ?auto_207201 ) ) ( not ( = ?auto_207197 ?auto_207201 ) ) ( not ( = ?auto_207199 ?auto_207201 ) ) ( ON ?auto_207194 ?auto_207193 ) ( ON-TABLE ?auto_207201 ) ( ON ?auto_207195 ?auto_207194 ) ( ON ?auto_207196 ?auto_207195 ) ( ON ?auto_207200 ?auto_207196 ) ( ON ?auto_207199 ?auto_207200 ) ( ON ?auto_207197 ?auto_207199 ) ( ON ?auto_207198 ?auto_207197 ) ( CLEAR ?auto_207198 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_207201 ?auto_207193 ?auto_207194 ?auto_207195 ?auto_207196 ?auto_207200 ?auto_207199 ?auto_207197 )
      ( MAKE-4PILE ?auto_207193 ?auto_207194 ?auto_207195 ?auto_207196 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_207205 - BLOCK
      ?auto_207206 - BLOCK
      ?auto_207207 - BLOCK
    )
    :vars
    (
      ?auto_207208 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207208 ?auto_207207 ) ( CLEAR ?auto_207208 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_207205 ) ( ON ?auto_207206 ?auto_207205 ) ( ON ?auto_207207 ?auto_207206 ) ( not ( = ?auto_207205 ?auto_207206 ) ) ( not ( = ?auto_207205 ?auto_207207 ) ) ( not ( = ?auto_207205 ?auto_207208 ) ) ( not ( = ?auto_207206 ?auto_207207 ) ) ( not ( = ?auto_207206 ?auto_207208 ) ) ( not ( = ?auto_207207 ?auto_207208 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_207208 ?auto_207207 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_207209 - BLOCK
      ?auto_207210 - BLOCK
      ?auto_207211 - BLOCK
    )
    :vars
    (
      ?auto_207212 - BLOCK
      ?auto_207213 - BLOCK
      ?auto_207214 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207212 ?auto_207211 ) ( CLEAR ?auto_207212 ) ( ON-TABLE ?auto_207209 ) ( ON ?auto_207210 ?auto_207209 ) ( ON ?auto_207211 ?auto_207210 ) ( not ( = ?auto_207209 ?auto_207210 ) ) ( not ( = ?auto_207209 ?auto_207211 ) ) ( not ( = ?auto_207209 ?auto_207212 ) ) ( not ( = ?auto_207210 ?auto_207211 ) ) ( not ( = ?auto_207210 ?auto_207212 ) ) ( not ( = ?auto_207211 ?auto_207212 ) ) ( HOLDING ?auto_207213 ) ( CLEAR ?auto_207214 ) ( not ( = ?auto_207209 ?auto_207213 ) ) ( not ( = ?auto_207209 ?auto_207214 ) ) ( not ( = ?auto_207210 ?auto_207213 ) ) ( not ( = ?auto_207210 ?auto_207214 ) ) ( not ( = ?auto_207211 ?auto_207213 ) ) ( not ( = ?auto_207211 ?auto_207214 ) ) ( not ( = ?auto_207212 ?auto_207213 ) ) ( not ( = ?auto_207212 ?auto_207214 ) ) ( not ( = ?auto_207213 ?auto_207214 ) ) )
    :subtasks
    ( ( !STACK ?auto_207213 ?auto_207214 )
      ( MAKE-3PILE ?auto_207209 ?auto_207210 ?auto_207211 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_207215 - BLOCK
      ?auto_207216 - BLOCK
      ?auto_207217 - BLOCK
    )
    :vars
    (
      ?auto_207218 - BLOCK
      ?auto_207220 - BLOCK
      ?auto_207219 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207218 ?auto_207217 ) ( ON-TABLE ?auto_207215 ) ( ON ?auto_207216 ?auto_207215 ) ( ON ?auto_207217 ?auto_207216 ) ( not ( = ?auto_207215 ?auto_207216 ) ) ( not ( = ?auto_207215 ?auto_207217 ) ) ( not ( = ?auto_207215 ?auto_207218 ) ) ( not ( = ?auto_207216 ?auto_207217 ) ) ( not ( = ?auto_207216 ?auto_207218 ) ) ( not ( = ?auto_207217 ?auto_207218 ) ) ( CLEAR ?auto_207220 ) ( not ( = ?auto_207215 ?auto_207219 ) ) ( not ( = ?auto_207215 ?auto_207220 ) ) ( not ( = ?auto_207216 ?auto_207219 ) ) ( not ( = ?auto_207216 ?auto_207220 ) ) ( not ( = ?auto_207217 ?auto_207219 ) ) ( not ( = ?auto_207217 ?auto_207220 ) ) ( not ( = ?auto_207218 ?auto_207219 ) ) ( not ( = ?auto_207218 ?auto_207220 ) ) ( not ( = ?auto_207219 ?auto_207220 ) ) ( ON ?auto_207219 ?auto_207218 ) ( CLEAR ?auto_207219 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_207215 ?auto_207216 ?auto_207217 ?auto_207218 )
      ( MAKE-3PILE ?auto_207215 ?auto_207216 ?auto_207217 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_207221 - BLOCK
      ?auto_207222 - BLOCK
      ?auto_207223 - BLOCK
    )
    :vars
    (
      ?auto_207226 - BLOCK
      ?auto_207224 - BLOCK
      ?auto_207225 - BLOCK
      ?auto_207227 - BLOCK
      ?auto_207228 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207226 ?auto_207223 ) ( ON-TABLE ?auto_207221 ) ( ON ?auto_207222 ?auto_207221 ) ( ON ?auto_207223 ?auto_207222 ) ( not ( = ?auto_207221 ?auto_207222 ) ) ( not ( = ?auto_207221 ?auto_207223 ) ) ( not ( = ?auto_207221 ?auto_207226 ) ) ( not ( = ?auto_207222 ?auto_207223 ) ) ( not ( = ?auto_207222 ?auto_207226 ) ) ( not ( = ?auto_207223 ?auto_207226 ) ) ( not ( = ?auto_207221 ?auto_207224 ) ) ( not ( = ?auto_207221 ?auto_207225 ) ) ( not ( = ?auto_207222 ?auto_207224 ) ) ( not ( = ?auto_207222 ?auto_207225 ) ) ( not ( = ?auto_207223 ?auto_207224 ) ) ( not ( = ?auto_207223 ?auto_207225 ) ) ( not ( = ?auto_207226 ?auto_207224 ) ) ( not ( = ?auto_207226 ?auto_207225 ) ) ( not ( = ?auto_207224 ?auto_207225 ) ) ( ON ?auto_207224 ?auto_207226 ) ( CLEAR ?auto_207224 ) ( HOLDING ?auto_207225 ) ( CLEAR ?auto_207227 ) ( ON-TABLE ?auto_207228 ) ( ON ?auto_207227 ?auto_207228 ) ( not ( = ?auto_207228 ?auto_207227 ) ) ( not ( = ?auto_207228 ?auto_207225 ) ) ( not ( = ?auto_207227 ?auto_207225 ) ) ( not ( = ?auto_207221 ?auto_207227 ) ) ( not ( = ?auto_207221 ?auto_207228 ) ) ( not ( = ?auto_207222 ?auto_207227 ) ) ( not ( = ?auto_207222 ?auto_207228 ) ) ( not ( = ?auto_207223 ?auto_207227 ) ) ( not ( = ?auto_207223 ?auto_207228 ) ) ( not ( = ?auto_207226 ?auto_207227 ) ) ( not ( = ?auto_207226 ?auto_207228 ) ) ( not ( = ?auto_207224 ?auto_207227 ) ) ( not ( = ?auto_207224 ?auto_207228 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_207228 ?auto_207227 ?auto_207225 )
      ( MAKE-3PILE ?auto_207221 ?auto_207222 ?auto_207223 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_207229 - BLOCK
      ?auto_207230 - BLOCK
      ?auto_207231 - BLOCK
    )
    :vars
    (
      ?auto_207234 - BLOCK
      ?auto_207232 - BLOCK
      ?auto_207233 - BLOCK
      ?auto_207236 - BLOCK
      ?auto_207235 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207234 ?auto_207231 ) ( ON-TABLE ?auto_207229 ) ( ON ?auto_207230 ?auto_207229 ) ( ON ?auto_207231 ?auto_207230 ) ( not ( = ?auto_207229 ?auto_207230 ) ) ( not ( = ?auto_207229 ?auto_207231 ) ) ( not ( = ?auto_207229 ?auto_207234 ) ) ( not ( = ?auto_207230 ?auto_207231 ) ) ( not ( = ?auto_207230 ?auto_207234 ) ) ( not ( = ?auto_207231 ?auto_207234 ) ) ( not ( = ?auto_207229 ?auto_207232 ) ) ( not ( = ?auto_207229 ?auto_207233 ) ) ( not ( = ?auto_207230 ?auto_207232 ) ) ( not ( = ?auto_207230 ?auto_207233 ) ) ( not ( = ?auto_207231 ?auto_207232 ) ) ( not ( = ?auto_207231 ?auto_207233 ) ) ( not ( = ?auto_207234 ?auto_207232 ) ) ( not ( = ?auto_207234 ?auto_207233 ) ) ( not ( = ?auto_207232 ?auto_207233 ) ) ( ON ?auto_207232 ?auto_207234 ) ( CLEAR ?auto_207236 ) ( ON-TABLE ?auto_207235 ) ( ON ?auto_207236 ?auto_207235 ) ( not ( = ?auto_207235 ?auto_207236 ) ) ( not ( = ?auto_207235 ?auto_207233 ) ) ( not ( = ?auto_207236 ?auto_207233 ) ) ( not ( = ?auto_207229 ?auto_207236 ) ) ( not ( = ?auto_207229 ?auto_207235 ) ) ( not ( = ?auto_207230 ?auto_207236 ) ) ( not ( = ?auto_207230 ?auto_207235 ) ) ( not ( = ?auto_207231 ?auto_207236 ) ) ( not ( = ?auto_207231 ?auto_207235 ) ) ( not ( = ?auto_207234 ?auto_207236 ) ) ( not ( = ?auto_207234 ?auto_207235 ) ) ( not ( = ?auto_207232 ?auto_207236 ) ) ( not ( = ?auto_207232 ?auto_207235 ) ) ( ON ?auto_207233 ?auto_207232 ) ( CLEAR ?auto_207233 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_207229 ?auto_207230 ?auto_207231 ?auto_207234 ?auto_207232 )
      ( MAKE-3PILE ?auto_207229 ?auto_207230 ?auto_207231 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_207237 - BLOCK
      ?auto_207238 - BLOCK
      ?auto_207239 - BLOCK
    )
    :vars
    (
      ?auto_207241 - BLOCK
      ?auto_207243 - BLOCK
      ?auto_207242 - BLOCK
      ?auto_207240 - BLOCK
      ?auto_207244 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207241 ?auto_207239 ) ( ON-TABLE ?auto_207237 ) ( ON ?auto_207238 ?auto_207237 ) ( ON ?auto_207239 ?auto_207238 ) ( not ( = ?auto_207237 ?auto_207238 ) ) ( not ( = ?auto_207237 ?auto_207239 ) ) ( not ( = ?auto_207237 ?auto_207241 ) ) ( not ( = ?auto_207238 ?auto_207239 ) ) ( not ( = ?auto_207238 ?auto_207241 ) ) ( not ( = ?auto_207239 ?auto_207241 ) ) ( not ( = ?auto_207237 ?auto_207243 ) ) ( not ( = ?auto_207237 ?auto_207242 ) ) ( not ( = ?auto_207238 ?auto_207243 ) ) ( not ( = ?auto_207238 ?auto_207242 ) ) ( not ( = ?auto_207239 ?auto_207243 ) ) ( not ( = ?auto_207239 ?auto_207242 ) ) ( not ( = ?auto_207241 ?auto_207243 ) ) ( not ( = ?auto_207241 ?auto_207242 ) ) ( not ( = ?auto_207243 ?auto_207242 ) ) ( ON ?auto_207243 ?auto_207241 ) ( ON-TABLE ?auto_207240 ) ( not ( = ?auto_207240 ?auto_207244 ) ) ( not ( = ?auto_207240 ?auto_207242 ) ) ( not ( = ?auto_207244 ?auto_207242 ) ) ( not ( = ?auto_207237 ?auto_207244 ) ) ( not ( = ?auto_207237 ?auto_207240 ) ) ( not ( = ?auto_207238 ?auto_207244 ) ) ( not ( = ?auto_207238 ?auto_207240 ) ) ( not ( = ?auto_207239 ?auto_207244 ) ) ( not ( = ?auto_207239 ?auto_207240 ) ) ( not ( = ?auto_207241 ?auto_207244 ) ) ( not ( = ?auto_207241 ?auto_207240 ) ) ( not ( = ?auto_207243 ?auto_207244 ) ) ( not ( = ?auto_207243 ?auto_207240 ) ) ( ON ?auto_207242 ?auto_207243 ) ( CLEAR ?auto_207242 ) ( HOLDING ?auto_207244 ) ( CLEAR ?auto_207240 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_207240 ?auto_207244 )
      ( MAKE-3PILE ?auto_207237 ?auto_207238 ?auto_207239 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_207245 - BLOCK
      ?auto_207246 - BLOCK
      ?auto_207247 - BLOCK
    )
    :vars
    (
      ?auto_207248 - BLOCK
      ?auto_207252 - BLOCK
      ?auto_207251 - BLOCK
      ?auto_207250 - BLOCK
      ?auto_207249 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207248 ?auto_207247 ) ( ON-TABLE ?auto_207245 ) ( ON ?auto_207246 ?auto_207245 ) ( ON ?auto_207247 ?auto_207246 ) ( not ( = ?auto_207245 ?auto_207246 ) ) ( not ( = ?auto_207245 ?auto_207247 ) ) ( not ( = ?auto_207245 ?auto_207248 ) ) ( not ( = ?auto_207246 ?auto_207247 ) ) ( not ( = ?auto_207246 ?auto_207248 ) ) ( not ( = ?auto_207247 ?auto_207248 ) ) ( not ( = ?auto_207245 ?auto_207252 ) ) ( not ( = ?auto_207245 ?auto_207251 ) ) ( not ( = ?auto_207246 ?auto_207252 ) ) ( not ( = ?auto_207246 ?auto_207251 ) ) ( not ( = ?auto_207247 ?auto_207252 ) ) ( not ( = ?auto_207247 ?auto_207251 ) ) ( not ( = ?auto_207248 ?auto_207252 ) ) ( not ( = ?auto_207248 ?auto_207251 ) ) ( not ( = ?auto_207252 ?auto_207251 ) ) ( ON ?auto_207252 ?auto_207248 ) ( ON-TABLE ?auto_207250 ) ( not ( = ?auto_207250 ?auto_207249 ) ) ( not ( = ?auto_207250 ?auto_207251 ) ) ( not ( = ?auto_207249 ?auto_207251 ) ) ( not ( = ?auto_207245 ?auto_207249 ) ) ( not ( = ?auto_207245 ?auto_207250 ) ) ( not ( = ?auto_207246 ?auto_207249 ) ) ( not ( = ?auto_207246 ?auto_207250 ) ) ( not ( = ?auto_207247 ?auto_207249 ) ) ( not ( = ?auto_207247 ?auto_207250 ) ) ( not ( = ?auto_207248 ?auto_207249 ) ) ( not ( = ?auto_207248 ?auto_207250 ) ) ( not ( = ?auto_207252 ?auto_207249 ) ) ( not ( = ?auto_207252 ?auto_207250 ) ) ( ON ?auto_207251 ?auto_207252 ) ( CLEAR ?auto_207250 ) ( ON ?auto_207249 ?auto_207251 ) ( CLEAR ?auto_207249 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_207245 ?auto_207246 ?auto_207247 ?auto_207248 ?auto_207252 ?auto_207251 )
      ( MAKE-3PILE ?auto_207245 ?auto_207246 ?auto_207247 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_207253 - BLOCK
      ?auto_207254 - BLOCK
      ?auto_207255 - BLOCK
    )
    :vars
    (
      ?auto_207260 - BLOCK
      ?auto_207256 - BLOCK
      ?auto_207258 - BLOCK
      ?auto_207259 - BLOCK
      ?auto_207257 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207260 ?auto_207255 ) ( ON-TABLE ?auto_207253 ) ( ON ?auto_207254 ?auto_207253 ) ( ON ?auto_207255 ?auto_207254 ) ( not ( = ?auto_207253 ?auto_207254 ) ) ( not ( = ?auto_207253 ?auto_207255 ) ) ( not ( = ?auto_207253 ?auto_207260 ) ) ( not ( = ?auto_207254 ?auto_207255 ) ) ( not ( = ?auto_207254 ?auto_207260 ) ) ( not ( = ?auto_207255 ?auto_207260 ) ) ( not ( = ?auto_207253 ?auto_207256 ) ) ( not ( = ?auto_207253 ?auto_207258 ) ) ( not ( = ?auto_207254 ?auto_207256 ) ) ( not ( = ?auto_207254 ?auto_207258 ) ) ( not ( = ?auto_207255 ?auto_207256 ) ) ( not ( = ?auto_207255 ?auto_207258 ) ) ( not ( = ?auto_207260 ?auto_207256 ) ) ( not ( = ?auto_207260 ?auto_207258 ) ) ( not ( = ?auto_207256 ?auto_207258 ) ) ( ON ?auto_207256 ?auto_207260 ) ( not ( = ?auto_207259 ?auto_207257 ) ) ( not ( = ?auto_207259 ?auto_207258 ) ) ( not ( = ?auto_207257 ?auto_207258 ) ) ( not ( = ?auto_207253 ?auto_207257 ) ) ( not ( = ?auto_207253 ?auto_207259 ) ) ( not ( = ?auto_207254 ?auto_207257 ) ) ( not ( = ?auto_207254 ?auto_207259 ) ) ( not ( = ?auto_207255 ?auto_207257 ) ) ( not ( = ?auto_207255 ?auto_207259 ) ) ( not ( = ?auto_207260 ?auto_207257 ) ) ( not ( = ?auto_207260 ?auto_207259 ) ) ( not ( = ?auto_207256 ?auto_207257 ) ) ( not ( = ?auto_207256 ?auto_207259 ) ) ( ON ?auto_207258 ?auto_207256 ) ( ON ?auto_207257 ?auto_207258 ) ( CLEAR ?auto_207257 ) ( HOLDING ?auto_207259 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_207259 )
      ( MAKE-3PILE ?auto_207253 ?auto_207254 ?auto_207255 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_207261 - BLOCK
      ?auto_207262 - BLOCK
      ?auto_207263 - BLOCK
    )
    :vars
    (
      ?auto_207267 - BLOCK
      ?auto_207264 - BLOCK
      ?auto_207266 - BLOCK
      ?auto_207268 - BLOCK
      ?auto_207265 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207267 ?auto_207263 ) ( ON-TABLE ?auto_207261 ) ( ON ?auto_207262 ?auto_207261 ) ( ON ?auto_207263 ?auto_207262 ) ( not ( = ?auto_207261 ?auto_207262 ) ) ( not ( = ?auto_207261 ?auto_207263 ) ) ( not ( = ?auto_207261 ?auto_207267 ) ) ( not ( = ?auto_207262 ?auto_207263 ) ) ( not ( = ?auto_207262 ?auto_207267 ) ) ( not ( = ?auto_207263 ?auto_207267 ) ) ( not ( = ?auto_207261 ?auto_207264 ) ) ( not ( = ?auto_207261 ?auto_207266 ) ) ( not ( = ?auto_207262 ?auto_207264 ) ) ( not ( = ?auto_207262 ?auto_207266 ) ) ( not ( = ?auto_207263 ?auto_207264 ) ) ( not ( = ?auto_207263 ?auto_207266 ) ) ( not ( = ?auto_207267 ?auto_207264 ) ) ( not ( = ?auto_207267 ?auto_207266 ) ) ( not ( = ?auto_207264 ?auto_207266 ) ) ( ON ?auto_207264 ?auto_207267 ) ( not ( = ?auto_207268 ?auto_207265 ) ) ( not ( = ?auto_207268 ?auto_207266 ) ) ( not ( = ?auto_207265 ?auto_207266 ) ) ( not ( = ?auto_207261 ?auto_207265 ) ) ( not ( = ?auto_207261 ?auto_207268 ) ) ( not ( = ?auto_207262 ?auto_207265 ) ) ( not ( = ?auto_207262 ?auto_207268 ) ) ( not ( = ?auto_207263 ?auto_207265 ) ) ( not ( = ?auto_207263 ?auto_207268 ) ) ( not ( = ?auto_207267 ?auto_207265 ) ) ( not ( = ?auto_207267 ?auto_207268 ) ) ( not ( = ?auto_207264 ?auto_207265 ) ) ( not ( = ?auto_207264 ?auto_207268 ) ) ( ON ?auto_207266 ?auto_207264 ) ( ON ?auto_207265 ?auto_207266 ) ( ON ?auto_207268 ?auto_207265 ) ( CLEAR ?auto_207268 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_207261 ?auto_207262 ?auto_207263 ?auto_207267 ?auto_207264 ?auto_207266 ?auto_207265 )
      ( MAKE-3PILE ?auto_207261 ?auto_207262 ?auto_207263 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_207269 - BLOCK
      ?auto_207270 - BLOCK
      ?auto_207271 - BLOCK
    )
    :vars
    (
      ?auto_207272 - BLOCK
      ?auto_207273 - BLOCK
      ?auto_207275 - BLOCK
      ?auto_207276 - BLOCK
      ?auto_207274 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207272 ?auto_207271 ) ( ON-TABLE ?auto_207269 ) ( ON ?auto_207270 ?auto_207269 ) ( ON ?auto_207271 ?auto_207270 ) ( not ( = ?auto_207269 ?auto_207270 ) ) ( not ( = ?auto_207269 ?auto_207271 ) ) ( not ( = ?auto_207269 ?auto_207272 ) ) ( not ( = ?auto_207270 ?auto_207271 ) ) ( not ( = ?auto_207270 ?auto_207272 ) ) ( not ( = ?auto_207271 ?auto_207272 ) ) ( not ( = ?auto_207269 ?auto_207273 ) ) ( not ( = ?auto_207269 ?auto_207275 ) ) ( not ( = ?auto_207270 ?auto_207273 ) ) ( not ( = ?auto_207270 ?auto_207275 ) ) ( not ( = ?auto_207271 ?auto_207273 ) ) ( not ( = ?auto_207271 ?auto_207275 ) ) ( not ( = ?auto_207272 ?auto_207273 ) ) ( not ( = ?auto_207272 ?auto_207275 ) ) ( not ( = ?auto_207273 ?auto_207275 ) ) ( ON ?auto_207273 ?auto_207272 ) ( not ( = ?auto_207276 ?auto_207274 ) ) ( not ( = ?auto_207276 ?auto_207275 ) ) ( not ( = ?auto_207274 ?auto_207275 ) ) ( not ( = ?auto_207269 ?auto_207274 ) ) ( not ( = ?auto_207269 ?auto_207276 ) ) ( not ( = ?auto_207270 ?auto_207274 ) ) ( not ( = ?auto_207270 ?auto_207276 ) ) ( not ( = ?auto_207271 ?auto_207274 ) ) ( not ( = ?auto_207271 ?auto_207276 ) ) ( not ( = ?auto_207272 ?auto_207274 ) ) ( not ( = ?auto_207272 ?auto_207276 ) ) ( not ( = ?auto_207273 ?auto_207274 ) ) ( not ( = ?auto_207273 ?auto_207276 ) ) ( ON ?auto_207275 ?auto_207273 ) ( ON ?auto_207274 ?auto_207275 ) ( HOLDING ?auto_207276 ) ( CLEAR ?auto_207274 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_207269 ?auto_207270 ?auto_207271 ?auto_207272 ?auto_207273 ?auto_207275 ?auto_207274 ?auto_207276 )
      ( MAKE-3PILE ?auto_207269 ?auto_207270 ?auto_207271 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_207277 - BLOCK
      ?auto_207278 - BLOCK
      ?auto_207279 - BLOCK
    )
    :vars
    (
      ?auto_207280 - BLOCK
      ?auto_207284 - BLOCK
      ?auto_207282 - BLOCK
      ?auto_207283 - BLOCK
      ?auto_207281 - BLOCK
      ?auto_207285 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207280 ?auto_207279 ) ( ON-TABLE ?auto_207277 ) ( ON ?auto_207278 ?auto_207277 ) ( ON ?auto_207279 ?auto_207278 ) ( not ( = ?auto_207277 ?auto_207278 ) ) ( not ( = ?auto_207277 ?auto_207279 ) ) ( not ( = ?auto_207277 ?auto_207280 ) ) ( not ( = ?auto_207278 ?auto_207279 ) ) ( not ( = ?auto_207278 ?auto_207280 ) ) ( not ( = ?auto_207279 ?auto_207280 ) ) ( not ( = ?auto_207277 ?auto_207284 ) ) ( not ( = ?auto_207277 ?auto_207282 ) ) ( not ( = ?auto_207278 ?auto_207284 ) ) ( not ( = ?auto_207278 ?auto_207282 ) ) ( not ( = ?auto_207279 ?auto_207284 ) ) ( not ( = ?auto_207279 ?auto_207282 ) ) ( not ( = ?auto_207280 ?auto_207284 ) ) ( not ( = ?auto_207280 ?auto_207282 ) ) ( not ( = ?auto_207284 ?auto_207282 ) ) ( ON ?auto_207284 ?auto_207280 ) ( not ( = ?auto_207283 ?auto_207281 ) ) ( not ( = ?auto_207283 ?auto_207282 ) ) ( not ( = ?auto_207281 ?auto_207282 ) ) ( not ( = ?auto_207277 ?auto_207281 ) ) ( not ( = ?auto_207277 ?auto_207283 ) ) ( not ( = ?auto_207278 ?auto_207281 ) ) ( not ( = ?auto_207278 ?auto_207283 ) ) ( not ( = ?auto_207279 ?auto_207281 ) ) ( not ( = ?auto_207279 ?auto_207283 ) ) ( not ( = ?auto_207280 ?auto_207281 ) ) ( not ( = ?auto_207280 ?auto_207283 ) ) ( not ( = ?auto_207284 ?auto_207281 ) ) ( not ( = ?auto_207284 ?auto_207283 ) ) ( ON ?auto_207282 ?auto_207284 ) ( ON ?auto_207281 ?auto_207282 ) ( CLEAR ?auto_207281 ) ( ON ?auto_207283 ?auto_207285 ) ( CLEAR ?auto_207283 ) ( HAND-EMPTY ) ( not ( = ?auto_207277 ?auto_207285 ) ) ( not ( = ?auto_207278 ?auto_207285 ) ) ( not ( = ?auto_207279 ?auto_207285 ) ) ( not ( = ?auto_207280 ?auto_207285 ) ) ( not ( = ?auto_207284 ?auto_207285 ) ) ( not ( = ?auto_207282 ?auto_207285 ) ) ( not ( = ?auto_207283 ?auto_207285 ) ) ( not ( = ?auto_207281 ?auto_207285 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_207283 ?auto_207285 )
      ( MAKE-3PILE ?auto_207277 ?auto_207278 ?auto_207279 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_207286 - BLOCK
      ?auto_207287 - BLOCK
      ?auto_207288 - BLOCK
    )
    :vars
    (
      ?auto_207291 - BLOCK
      ?auto_207289 - BLOCK
      ?auto_207292 - BLOCK
      ?auto_207294 - BLOCK
      ?auto_207290 - BLOCK
      ?auto_207293 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207291 ?auto_207288 ) ( ON-TABLE ?auto_207286 ) ( ON ?auto_207287 ?auto_207286 ) ( ON ?auto_207288 ?auto_207287 ) ( not ( = ?auto_207286 ?auto_207287 ) ) ( not ( = ?auto_207286 ?auto_207288 ) ) ( not ( = ?auto_207286 ?auto_207291 ) ) ( not ( = ?auto_207287 ?auto_207288 ) ) ( not ( = ?auto_207287 ?auto_207291 ) ) ( not ( = ?auto_207288 ?auto_207291 ) ) ( not ( = ?auto_207286 ?auto_207289 ) ) ( not ( = ?auto_207286 ?auto_207292 ) ) ( not ( = ?auto_207287 ?auto_207289 ) ) ( not ( = ?auto_207287 ?auto_207292 ) ) ( not ( = ?auto_207288 ?auto_207289 ) ) ( not ( = ?auto_207288 ?auto_207292 ) ) ( not ( = ?auto_207291 ?auto_207289 ) ) ( not ( = ?auto_207291 ?auto_207292 ) ) ( not ( = ?auto_207289 ?auto_207292 ) ) ( ON ?auto_207289 ?auto_207291 ) ( not ( = ?auto_207294 ?auto_207290 ) ) ( not ( = ?auto_207294 ?auto_207292 ) ) ( not ( = ?auto_207290 ?auto_207292 ) ) ( not ( = ?auto_207286 ?auto_207290 ) ) ( not ( = ?auto_207286 ?auto_207294 ) ) ( not ( = ?auto_207287 ?auto_207290 ) ) ( not ( = ?auto_207287 ?auto_207294 ) ) ( not ( = ?auto_207288 ?auto_207290 ) ) ( not ( = ?auto_207288 ?auto_207294 ) ) ( not ( = ?auto_207291 ?auto_207290 ) ) ( not ( = ?auto_207291 ?auto_207294 ) ) ( not ( = ?auto_207289 ?auto_207290 ) ) ( not ( = ?auto_207289 ?auto_207294 ) ) ( ON ?auto_207292 ?auto_207289 ) ( ON ?auto_207294 ?auto_207293 ) ( CLEAR ?auto_207294 ) ( not ( = ?auto_207286 ?auto_207293 ) ) ( not ( = ?auto_207287 ?auto_207293 ) ) ( not ( = ?auto_207288 ?auto_207293 ) ) ( not ( = ?auto_207291 ?auto_207293 ) ) ( not ( = ?auto_207289 ?auto_207293 ) ) ( not ( = ?auto_207292 ?auto_207293 ) ) ( not ( = ?auto_207294 ?auto_207293 ) ) ( not ( = ?auto_207290 ?auto_207293 ) ) ( HOLDING ?auto_207290 ) ( CLEAR ?auto_207292 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_207286 ?auto_207287 ?auto_207288 ?auto_207291 ?auto_207289 ?auto_207292 ?auto_207290 )
      ( MAKE-3PILE ?auto_207286 ?auto_207287 ?auto_207288 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_207295 - BLOCK
      ?auto_207296 - BLOCK
      ?auto_207297 - BLOCK
    )
    :vars
    (
      ?auto_207298 - BLOCK
      ?auto_207299 - BLOCK
      ?auto_207301 - BLOCK
      ?auto_207302 - BLOCK
      ?auto_207303 - BLOCK
      ?auto_207300 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207298 ?auto_207297 ) ( ON-TABLE ?auto_207295 ) ( ON ?auto_207296 ?auto_207295 ) ( ON ?auto_207297 ?auto_207296 ) ( not ( = ?auto_207295 ?auto_207296 ) ) ( not ( = ?auto_207295 ?auto_207297 ) ) ( not ( = ?auto_207295 ?auto_207298 ) ) ( not ( = ?auto_207296 ?auto_207297 ) ) ( not ( = ?auto_207296 ?auto_207298 ) ) ( not ( = ?auto_207297 ?auto_207298 ) ) ( not ( = ?auto_207295 ?auto_207299 ) ) ( not ( = ?auto_207295 ?auto_207301 ) ) ( not ( = ?auto_207296 ?auto_207299 ) ) ( not ( = ?auto_207296 ?auto_207301 ) ) ( not ( = ?auto_207297 ?auto_207299 ) ) ( not ( = ?auto_207297 ?auto_207301 ) ) ( not ( = ?auto_207298 ?auto_207299 ) ) ( not ( = ?auto_207298 ?auto_207301 ) ) ( not ( = ?auto_207299 ?auto_207301 ) ) ( ON ?auto_207299 ?auto_207298 ) ( not ( = ?auto_207302 ?auto_207303 ) ) ( not ( = ?auto_207302 ?auto_207301 ) ) ( not ( = ?auto_207303 ?auto_207301 ) ) ( not ( = ?auto_207295 ?auto_207303 ) ) ( not ( = ?auto_207295 ?auto_207302 ) ) ( not ( = ?auto_207296 ?auto_207303 ) ) ( not ( = ?auto_207296 ?auto_207302 ) ) ( not ( = ?auto_207297 ?auto_207303 ) ) ( not ( = ?auto_207297 ?auto_207302 ) ) ( not ( = ?auto_207298 ?auto_207303 ) ) ( not ( = ?auto_207298 ?auto_207302 ) ) ( not ( = ?auto_207299 ?auto_207303 ) ) ( not ( = ?auto_207299 ?auto_207302 ) ) ( ON ?auto_207301 ?auto_207299 ) ( ON ?auto_207302 ?auto_207300 ) ( not ( = ?auto_207295 ?auto_207300 ) ) ( not ( = ?auto_207296 ?auto_207300 ) ) ( not ( = ?auto_207297 ?auto_207300 ) ) ( not ( = ?auto_207298 ?auto_207300 ) ) ( not ( = ?auto_207299 ?auto_207300 ) ) ( not ( = ?auto_207301 ?auto_207300 ) ) ( not ( = ?auto_207302 ?auto_207300 ) ) ( not ( = ?auto_207303 ?auto_207300 ) ) ( CLEAR ?auto_207301 ) ( ON ?auto_207303 ?auto_207302 ) ( CLEAR ?auto_207303 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_207300 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_207300 ?auto_207302 )
      ( MAKE-3PILE ?auto_207295 ?auto_207296 ?auto_207297 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_207304 - BLOCK
      ?auto_207305 - BLOCK
      ?auto_207306 - BLOCK
    )
    :vars
    (
      ?auto_207308 - BLOCK
      ?auto_207309 - BLOCK
      ?auto_207307 - BLOCK
      ?auto_207311 - BLOCK
      ?auto_207312 - BLOCK
      ?auto_207310 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207308 ?auto_207306 ) ( ON-TABLE ?auto_207304 ) ( ON ?auto_207305 ?auto_207304 ) ( ON ?auto_207306 ?auto_207305 ) ( not ( = ?auto_207304 ?auto_207305 ) ) ( not ( = ?auto_207304 ?auto_207306 ) ) ( not ( = ?auto_207304 ?auto_207308 ) ) ( not ( = ?auto_207305 ?auto_207306 ) ) ( not ( = ?auto_207305 ?auto_207308 ) ) ( not ( = ?auto_207306 ?auto_207308 ) ) ( not ( = ?auto_207304 ?auto_207309 ) ) ( not ( = ?auto_207304 ?auto_207307 ) ) ( not ( = ?auto_207305 ?auto_207309 ) ) ( not ( = ?auto_207305 ?auto_207307 ) ) ( not ( = ?auto_207306 ?auto_207309 ) ) ( not ( = ?auto_207306 ?auto_207307 ) ) ( not ( = ?auto_207308 ?auto_207309 ) ) ( not ( = ?auto_207308 ?auto_207307 ) ) ( not ( = ?auto_207309 ?auto_207307 ) ) ( ON ?auto_207309 ?auto_207308 ) ( not ( = ?auto_207311 ?auto_207312 ) ) ( not ( = ?auto_207311 ?auto_207307 ) ) ( not ( = ?auto_207312 ?auto_207307 ) ) ( not ( = ?auto_207304 ?auto_207312 ) ) ( not ( = ?auto_207304 ?auto_207311 ) ) ( not ( = ?auto_207305 ?auto_207312 ) ) ( not ( = ?auto_207305 ?auto_207311 ) ) ( not ( = ?auto_207306 ?auto_207312 ) ) ( not ( = ?auto_207306 ?auto_207311 ) ) ( not ( = ?auto_207308 ?auto_207312 ) ) ( not ( = ?auto_207308 ?auto_207311 ) ) ( not ( = ?auto_207309 ?auto_207312 ) ) ( not ( = ?auto_207309 ?auto_207311 ) ) ( ON ?auto_207311 ?auto_207310 ) ( not ( = ?auto_207304 ?auto_207310 ) ) ( not ( = ?auto_207305 ?auto_207310 ) ) ( not ( = ?auto_207306 ?auto_207310 ) ) ( not ( = ?auto_207308 ?auto_207310 ) ) ( not ( = ?auto_207309 ?auto_207310 ) ) ( not ( = ?auto_207307 ?auto_207310 ) ) ( not ( = ?auto_207311 ?auto_207310 ) ) ( not ( = ?auto_207312 ?auto_207310 ) ) ( ON ?auto_207312 ?auto_207311 ) ( CLEAR ?auto_207312 ) ( ON-TABLE ?auto_207310 ) ( HOLDING ?auto_207307 ) ( CLEAR ?auto_207309 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_207304 ?auto_207305 ?auto_207306 ?auto_207308 ?auto_207309 ?auto_207307 )
      ( MAKE-3PILE ?auto_207304 ?auto_207305 ?auto_207306 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_207313 - BLOCK
      ?auto_207314 - BLOCK
      ?auto_207315 - BLOCK
    )
    :vars
    (
      ?auto_207317 - BLOCK
      ?auto_207318 - BLOCK
      ?auto_207316 - BLOCK
      ?auto_207320 - BLOCK
      ?auto_207321 - BLOCK
      ?auto_207319 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207317 ?auto_207315 ) ( ON-TABLE ?auto_207313 ) ( ON ?auto_207314 ?auto_207313 ) ( ON ?auto_207315 ?auto_207314 ) ( not ( = ?auto_207313 ?auto_207314 ) ) ( not ( = ?auto_207313 ?auto_207315 ) ) ( not ( = ?auto_207313 ?auto_207317 ) ) ( not ( = ?auto_207314 ?auto_207315 ) ) ( not ( = ?auto_207314 ?auto_207317 ) ) ( not ( = ?auto_207315 ?auto_207317 ) ) ( not ( = ?auto_207313 ?auto_207318 ) ) ( not ( = ?auto_207313 ?auto_207316 ) ) ( not ( = ?auto_207314 ?auto_207318 ) ) ( not ( = ?auto_207314 ?auto_207316 ) ) ( not ( = ?auto_207315 ?auto_207318 ) ) ( not ( = ?auto_207315 ?auto_207316 ) ) ( not ( = ?auto_207317 ?auto_207318 ) ) ( not ( = ?auto_207317 ?auto_207316 ) ) ( not ( = ?auto_207318 ?auto_207316 ) ) ( ON ?auto_207318 ?auto_207317 ) ( not ( = ?auto_207320 ?auto_207321 ) ) ( not ( = ?auto_207320 ?auto_207316 ) ) ( not ( = ?auto_207321 ?auto_207316 ) ) ( not ( = ?auto_207313 ?auto_207321 ) ) ( not ( = ?auto_207313 ?auto_207320 ) ) ( not ( = ?auto_207314 ?auto_207321 ) ) ( not ( = ?auto_207314 ?auto_207320 ) ) ( not ( = ?auto_207315 ?auto_207321 ) ) ( not ( = ?auto_207315 ?auto_207320 ) ) ( not ( = ?auto_207317 ?auto_207321 ) ) ( not ( = ?auto_207317 ?auto_207320 ) ) ( not ( = ?auto_207318 ?auto_207321 ) ) ( not ( = ?auto_207318 ?auto_207320 ) ) ( ON ?auto_207320 ?auto_207319 ) ( not ( = ?auto_207313 ?auto_207319 ) ) ( not ( = ?auto_207314 ?auto_207319 ) ) ( not ( = ?auto_207315 ?auto_207319 ) ) ( not ( = ?auto_207317 ?auto_207319 ) ) ( not ( = ?auto_207318 ?auto_207319 ) ) ( not ( = ?auto_207316 ?auto_207319 ) ) ( not ( = ?auto_207320 ?auto_207319 ) ) ( not ( = ?auto_207321 ?auto_207319 ) ) ( ON ?auto_207321 ?auto_207320 ) ( ON-TABLE ?auto_207319 ) ( CLEAR ?auto_207318 ) ( ON ?auto_207316 ?auto_207321 ) ( CLEAR ?auto_207316 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_207319 ?auto_207320 ?auto_207321 )
      ( MAKE-3PILE ?auto_207313 ?auto_207314 ?auto_207315 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_207322 - BLOCK
      ?auto_207323 - BLOCK
      ?auto_207324 - BLOCK
    )
    :vars
    (
      ?auto_207326 - BLOCK
      ?auto_207325 - BLOCK
      ?auto_207327 - BLOCK
      ?auto_207328 - BLOCK
      ?auto_207330 - BLOCK
      ?auto_207329 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207326 ?auto_207324 ) ( ON-TABLE ?auto_207322 ) ( ON ?auto_207323 ?auto_207322 ) ( ON ?auto_207324 ?auto_207323 ) ( not ( = ?auto_207322 ?auto_207323 ) ) ( not ( = ?auto_207322 ?auto_207324 ) ) ( not ( = ?auto_207322 ?auto_207326 ) ) ( not ( = ?auto_207323 ?auto_207324 ) ) ( not ( = ?auto_207323 ?auto_207326 ) ) ( not ( = ?auto_207324 ?auto_207326 ) ) ( not ( = ?auto_207322 ?auto_207325 ) ) ( not ( = ?auto_207322 ?auto_207327 ) ) ( not ( = ?auto_207323 ?auto_207325 ) ) ( not ( = ?auto_207323 ?auto_207327 ) ) ( not ( = ?auto_207324 ?auto_207325 ) ) ( not ( = ?auto_207324 ?auto_207327 ) ) ( not ( = ?auto_207326 ?auto_207325 ) ) ( not ( = ?auto_207326 ?auto_207327 ) ) ( not ( = ?auto_207325 ?auto_207327 ) ) ( not ( = ?auto_207328 ?auto_207330 ) ) ( not ( = ?auto_207328 ?auto_207327 ) ) ( not ( = ?auto_207330 ?auto_207327 ) ) ( not ( = ?auto_207322 ?auto_207330 ) ) ( not ( = ?auto_207322 ?auto_207328 ) ) ( not ( = ?auto_207323 ?auto_207330 ) ) ( not ( = ?auto_207323 ?auto_207328 ) ) ( not ( = ?auto_207324 ?auto_207330 ) ) ( not ( = ?auto_207324 ?auto_207328 ) ) ( not ( = ?auto_207326 ?auto_207330 ) ) ( not ( = ?auto_207326 ?auto_207328 ) ) ( not ( = ?auto_207325 ?auto_207330 ) ) ( not ( = ?auto_207325 ?auto_207328 ) ) ( ON ?auto_207328 ?auto_207329 ) ( not ( = ?auto_207322 ?auto_207329 ) ) ( not ( = ?auto_207323 ?auto_207329 ) ) ( not ( = ?auto_207324 ?auto_207329 ) ) ( not ( = ?auto_207326 ?auto_207329 ) ) ( not ( = ?auto_207325 ?auto_207329 ) ) ( not ( = ?auto_207327 ?auto_207329 ) ) ( not ( = ?auto_207328 ?auto_207329 ) ) ( not ( = ?auto_207330 ?auto_207329 ) ) ( ON ?auto_207330 ?auto_207328 ) ( ON-TABLE ?auto_207329 ) ( ON ?auto_207327 ?auto_207330 ) ( CLEAR ?auto_207327 ) ( HOLDING ?auto_207325 ) ( CLEAR ?auto_207326 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_207322 ?auto_207323 ?auto_207324 ?auto_207326 ?auto_207325 )
      ( MAKE-3PILE ?auto_207322 ?auto_207323 ?auto_207324 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_207331 - BLOCK
      ?auto_207332 - BLOCK
      ?auto_207333 - BLOCK
    )
    :vars
    (
      ?auto_207339 - BLOCK
      ?auto_207334 - BLOCK
      ?auto_207335 - BLOCK
      ?auto_207336 - BLOCK
      ?auto_207338 - BLOCK
      ?auto_207337 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207339 ?auto_207333 ) ( ON-TABLE ?auto_207331 ) ( ON ?auto_207332 ?auto_207331 ) ( ON ?auto_207333 ?auto_207332 ) ( not ( = ?auto_207331 ?auto_207332 ) ) ( not ( = ?auto_207331 ?auto_207333 ) ) ( not ( = ?auto_207331 ?auto_207339 ) ) ( not ( = ?auto_207332 ?auto_207333 ) ) ( not ( = ?auto_207332 ?auto_207339 ) ) ( not ( = ?auto_207333 ?auto_207339 ) ) ( not ( = ?auto_207331 ?auto_207334 ) ) ( not ( = ?auto_207331 ?auto_207335 ) ) ( not ( = ?auto_207332 ?auto_207334 ) ) ( not ( = ?auto_207332 ?auto_207335 ) ) ( not ( = ?auto_207333 ?auto_207334 ) ) ( not ( = ?auto_207333 ?auto_207335 ) ) ( not ( = ?auto_207339 ?auto_207334 ) ) ( not ( = ?auto_207339 ?auto_207335 ) ) ( not ( = ?auto_207334 ?auto_207335 ) ) ( not ( = ?auto_207336 ?auto_207338 ) ) ( not ( = ?auto_207336 ?auto_207335 ) ) ( not ( = ?auto_207338 ?auto_207335 ) ) ( not ( = ?auto_207331 ?auto_207338 ) ) ( not ( = ?auto_207331 ?auto_207336 ) ) ( not ( = ?auto_207332 ?auto_207338 ) ) ( not ( = ?auto_207332 ?auto_207336 ) ) ( not ( = ?auto_207333 ?auto_207338 ) ) ( not ( = ?auto_207333 ?auto_207336 ) ) ( not ( = ?auto_207339 ?auto_207338 ) ) ( not ( = ?auto_207339 ?auto_207336 ) ) ( not ( = ?auto_207334 ?auto_207338 ) ) ( not ( = ?auto_207334 ?auto_207336 ) ) ( ON ?auto_207336 ?auto_207337 ) ( not ( = ?auto_207331 ?auto_207337 ) ) ( not ( = ?auto_207332 ?auto_207337 ) ) ( not ( = ?auto_207333 ?auto_207337 ) ) ( not ( = ?auto_207339 ?auto_207337 ) ) ( not ( = ?auto_207334 ?auto_207337 ) ) ( not ( = ?auto_207335 ?auto_207337 ) ) ( not ( = ?auto_207336 ?auto_207337 ) ) ( not ( = ?auto_207338 ?auto_207337 ) ) ( ON ?auto_207338 ?auto_207336 ) ( ON-TABLE ?auto_207337 ) ( ON ?auto_207335 ?auto_207338 ) ( CLEAR ?auto_207339 ) ( ON ?auto_207334 ?auto_207335 ) ( CLEAR ?auto_207334 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_207337 ?auto_207336 ?auto_207338 ?auto_207335 )
      ( MAKE-3PILE ?auto_207331 ?auto_207332 ?auto_207333 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_207358 - BLOCK
      ?auto_207359 - BLOCK
      ?auto_207360 - BLOCK
    )
    :vars
    (
      ?auto_207366 - BLOCK
      ?auto_207365 - BLOCK
      ?auto_207364 - BLOCK
      ?auto_207361 - BLOCK
      ?auto_207362 - BLOCK
      ?auto_207363 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_207358 ) ( ON ?auto_207359 ?auto_207358 ) ( not ( = ?auto_207358 ?auto_207359 ) ) ( not ( = ?auto_207358 ?auto_207360 ) ) ( not ( = ?auto_207358 ?auto_207366 ) ) ( not ( = ?auto_207359 ?auto_207360 ) ) ( not ( = ?auto_207359 ?auto_207366 ) ) ( not ( = ?auto_207360 ?auto_207366 ) ) ( not ( = ?auto_207358 ?auto_207365 ) ) ( not ( = ?auto_207358 ?auto_207364 ) ) ( not ( = ?auto_207359 ?auto_207365 ) ) ( not ( = ?auto_207359 ?auto_207364 ) ) ( not ( = ?auto_207360 ?auto_207365 ) ) ( not ( = ?auto_207360 ?auto_207364 ) ) ( not ( = ?auto_207366 ?auto_207365 ) ) ( not ( = ?auto_207366 ?auto_207364 ) ) ( not ( = ?auto_207365 ?auto_207364 ) ) ( not ( = ?auto_207361 ?auto_207362 ) ) ( not ( = ?auto_207361 ?auto_207364 ) ) ( not ( = ?auto_207362 ?auto_207364 ) ) ( not ( = ?auto_207358 ?auto_207362 ) ) ( not ( = ?auto_207358 ?auto_207361 ) ) ( not ( = ?auto_207359 ?auto_207362 ) ) ( not ( = ?auto_207359 ?auto_207361 ) ) ( not ( = ?auto_207360 ?auto_207362 ) ) ( not ( = ?auto_207360 ?auto_207361 ) ) ( not ( = ?auto_207366 ?auto_207362 ) ) ( not ( = ?auto_207366 ?auto_207361 ) ) ( not ( = ?auto_207365 ?auto_207362 ) ) ( not ( = ?auto_207365 ?auto_207361 ) ) ( ON ?auto_207361 ?auto_207363 ) ( not ( = ?auto_207358 ?auto_207363 ) ) ( not ( = ?auto_207359 ?auto_207363 ) ) ( not ( = ?auto_207360 ?auto_207363 ) ) ( not ( = ?auto_207366 ?auto_207363 ) ) ( not ( = ?auto_207365 ?auto_207363 ) ) ( not ( = ?auto_207364 ?auto_207363 ) ) ( not ( = ?auto_207361 ?auto_207363 ) ) ( not ( = ?auto_207362 ?auto_207363 ) ) ( ON ?auto_207362 ?auto_207361 ) ( ON-TABLE ?auto_207363 ) ( ON ?auto_207364 ?auto_207362 ) ( ON ?auto_207365 ?auto_207364 ) ( ON ?auto_207366 ?auto_207365 ) ( CLEAR ?auto_207366 ) ( HOLDING ?auto_207360 ) ( CLEAR ?auto_207359 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_207358 ?auto_207359 ?auto_207360 ?auto_207366 )
      ( MAKE-3PILE ?auto_207358 ?auto_207359 ?auto_207360 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_207367 - BLOCK
      ?auto_207368 - BLOCK
      ?auto_207369 - BLOCK
    )
    :vars
    (
      ?auto_207372 - BLOCK
      ?auto_207375 - BLOCK
      ?auto_207370 - BLOCK
      ?auto_207373 - BLOCK
      ?auto_207371 - BLOCK
      ?auto_207374 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_207367 ) ( ON ?auto_207368 ?auto_207367 ) ( not ( = ?auto_207367 ?auto_207368 ) ) ( not ( = ?auto_207367 ?auto_207369 ) ) ( not ( = ?auto_207367 ?auto_207372 ) ) ( not ( = ?auto_207368 ?auto_207369 ) ) ( not ( = ?auto_207368 ?auto_207372 ) ) ( not ( = ?auto_207369 ?auto_207372 ) ) ( not ( = ?auto_207367 ?auto_207375 ) ) ( not ( = ?auto_207367 ?auto_207370 ) ) ( not ( = ?auto_207368 ?auto_207375 ) ) ( not ( = ?auto_207368 ?auto_207370 ) ) ( not ( = ?auto_207369 ?auto_207375 ) ) ( not ( = ?auto_207369 ?auto_207370 ) ) ( not ( = ?auto_207372 ?auto_207375 ) ) ( not ( = ?auto_207372 ?auto_207370 ) ) ( not ( = ?auto_207375 ?auto_207370 ) ) ( not ( = ?auto_207373 ?auto_207371 ) ) ( not ( = ?auto_207373 ?auto_207370 ) ) ( not ( = ?auto_207371 ?auto_207370 ) ) ( not ( = ?auto_207367 ?auto_207371 ) ) ( not ( = ?auto_207367 ?auto_207373 ) ) ( not ( = ?auto_207368 ?auto_207371 ) ) ( not ( = ?auto_207368 ?auto_207373 ) ) ( not ( = ?auto_207369 ?auto_207371 ) ) ( not ( = ?auto_207369 ?auto_207373 ) ) ( not ( = ?auto_207372 ?auto_207371 ) ) ( not ( = ?auto_207372 ?auto_207373 ) ) ( not ( = ?auto_207375 ?auto_207371 ) ) ( not ( = ?auto_207375 ?auto_207373 ) ) ( ON ?auto_207373 ?auto_207374 ) ( not ( = ?auto_207367 ?auto_207374 ) ) ( not ( = ?auto_207368 ?auto_207374 ) ) ( not ( = ?auto_207369 ?auto_207374 ) ) ( not ( = ?auto_207372 ?auto_207374 ) ) ( not ( = ?auto_207375 ?auto_207374 ) ) ( not ( = ?auto_207370 ?auto_207374 ) ) ( not ( = ?auto_207373 ?auto_207374 ) ) ( not ( = ?auto_207371 ?auto_207374 ) ) ( ON ?auto_207371 ?auto_207373 ) ( ON-TABLE ?auto_207374 ) ( ON ?auto_207370 ?auto_207371 ) ( ON ?auto_207375 ?auto_207370 ) ( ON ?auto_207372 ?auto_207375 ) ( CLEAR ?auto_207368 ) ( ON ?auto_207369 ?auto_207372 ) ( CLEAR ?auto_207369 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_207374 ?auto_207373 ?auto_207371 ?auto_207370 ?auto_207375 ?auto_207372 )
      ( MAKE-3PILE ?auto_207367 ?auto_207368 ?auto_207369 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_207376 - BLOCK
      ?auto_207377 - BLOCK
      ?auto_207378 - BLOCK
    )
    :vars
    (
      ?auto_207380 - BLOCK
      ?auto_207379 - BLOCK
      ?auto_207382 - BLOCK
      ?auto_207383 - BLOCK
      ?auto_207384 - BLOCK
      ?auto_207381 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_207376 ) ( not ( = ?auto_207376 ?auto_207377 ) ) ( not ( = ?auto_207376 ?auto_207378 ) ) ( not ( = ?auto_207376 ?auto_207380 ) ) ( not ( = ?auto_207377 ?auto_207378 ) ) ( not ( = ?auto_207377 ?auto_207380 ) ) ( not ( = ?auto_207378 ?auto_207380 ) ) ( not ( = ?auto_207376 ?auto_207379 ) ) ( not ( = ?auto_207376 ?auto_207382 ) ) ( not ( = ?auto_207377 ?auto_207379 ) ) ( not ( = ?auto_207377 ?auto_207382 ) ) ( not ( = ?auto_207378 ?auto_207379 ) ) ( not ( = ?auto_207378 ?auto_207382 ) ) ( not ( = ?auto_207380 ?auto_207379 ) ) ( not ( = ?auto_207380 ?auto_207382 ) ) ( not ( = ?auto_207379 ?auto_207382 ) ) ( not ( = ?auto_207383 ?auto_207384 ) ) ( not ( = ?auto_207383 ?auto_207382 ) ) ( not ( = ?auto_207384 ?auto_207382 ) ) ( not ( = ?auto_207376 ?auto_207384 ) ) ( not ( = ?auto_207376 ?auto_207383 ) ) ( not ( = ?auto_207377 ?auto_207384 ) ) ( not ( = ?auto_207377 ?auto_207383 ) ) ( not ( = ?auto_207378 ?auto_207384 ) ) ( not ( = ?auto_207378 ?auto_207383 ) ) ( not ( = ?auto_207380 ?auto_207384 ) ) ( not ( = ?auto_207380 ?auto_207383 ) ) ( not ( = ?auto_207379 ?auto_207384 ) ) ( not ( = ?auto_207379 ?auto_207383 ) ) ( ON ?auto_207383 ?auto_207381 ) ( not ( = ?auto_207376 ?auto_207381 ) ) ( not ( = ?auto_207377 ?auto_207381 ) ) ( not ( = ?auto_207378 ?auto_207381 ) ) ( not ( = ?auto_207380 ?auto_207381 ) ) ( not ( = ?auto_207379 ?auto_207381 ) ) ( not ( = ?auto_207382 ?auto_207381 ) ) ( not ( = ?auto_207383 ?auto_207381 ) ) ( not ( = ?auto_207384 ?auto_207381 ) ) ( ON ?auto_207384 ?auto_207383 ) ( ON-TABLE ?auto_207381 ) ( ON ?auto_207382 ?auto_207384 ) ( ON ?auto_207379 ?auto_207382 ) ( ON ?auto_207380 ?auto_207379 ) ( ON ?auto_207378 ?auto_207380 ) ( CLEAR ?auto_207378 ) ( HOLDING ?auto_207377 ) ( CLEAR ?auto_207376 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_207376 ?auto_207377 )
      ( MAKE-3PILE ?auto_207376 ?auto_207377 ?auto_207378 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_207385 - BLOCK
      ?auto_207386 - BLOCK
      ?auto_207387 - BLOCK
    )
    :vars
    (
      ?auto_207390 - BLOCK
      ?auto_207388 - BLOCK
      ?auto_207393 - BLOCK
      ?auto_207392 - BLOCK
      ?auto_207391 - BLOCK
      ?auto_207389 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_207385 ) ( not ( = ?auto_207385 ?auto_207386 ) ) ( not ( = ?auto_207385 ?auto_207387 ) ) ( not ( = ?auto_207385 ?auto_207390 ) ) ( not ( = ?auto_207386 ?auto_207387 ) ) ( not ( = ?auto_207386 ?auto_207390 ) ) ( not ( = ?auto_207387 ?auto_207390 ) ) ( not ( = ?auto_207385 ?auto_207388 ) ) ( not ( = ?auto_207385 ?auto_207393 ) ) ( not ( = ?auto_207386 ?auto_207388 ) ) ( not ( = ?auto_207386 ?auto_207393 ) ) ( not ( = ?auto_207387 ?auto_207388 ) ) ( not ( = ?auto_207387 ?auto_207393 ) ) ( not ( = ?auto_207390 ?auto_207388 ) ) ( not ( = ?auto_207390 ?auto_207393 ) ) ( not ( = ?auto_207388 ?auto_207393 ) ) ( not ( = ?auto_207392 ?auto_207391 ) ) ( not ( = ?auto_207392 ?auto_207393 ) ) ( not ( = ?auto_207391 ?auto_207393 ) ) ( not ( = ?auto_207385 ?auto_207391 ) ) ( not ( = ?auto_207385 ?auto_207392 ) ) ( not ( = ?auto_207386 ?auto_207391 ) ) ( not ( = ?auto_207386 ?auto_207392 ) ) ( not ( = ?auto_207387 ?auto_207391 ) ) ( not ( = ?auto_207387 ?auto_207392 ) ) ( not ( = ?auto_207390 ?auto_207391 ) ) ( not ( = ?auto_207390 ?auto_207392 ) ) ( not ( = ?auto_207388 ?auto_207391 ) ) ( not ( = ?auto_207388 ?auto_207392 ) ) ( ON ?auto_207392 ?auto_207389 ) ( not ( = ?auto_207385 ?auto_207389 ) ) ( not ( = ?auto_207386 ?auto_207389 ) ) ( not ( = ?auto_207387 ?auto_207389 ) ) ( not ( = ?auto_207390 ?auto_207389 ) ) ( not ( = ?auto_207388 ?auto_207389 ) ) ( not ( = ?auto_207393 ?auto_207389 ) ) ( not ( = ?auto_207392 ?auto_207389 ) ) ( not ( = ?auto_207391 ?auto_207389 ) ) ( ON ?auto_207391 ?auto_207392 ) ( ON-TABLE ?auto_207389 ) ( ON ?auto_207393 ?auto_207391 ) ( ON ?auto_207388 ?auto_207393 ) ( ON ?auto_207390 ?auto_207388 ) ( ON ?auto_207387 ?auto_207390 ) ( CLEAR ?auto_207385 ) ( ON ?auto_207386 ?auto_207387 ) ( CLEAR ?auto_207386 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_207389 ?auto_207392 ?auto_207391 ?auto_207393 ?auto_207388 ?auto_207390 ?auto_207387 )
      ( MAKE-3PILE ?auto_207385 ?auto_207386 ?auto_207387 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_207394 - BLOCK
      ?auto_207395 - BLOCK
      ?auto_207396 - BLOCK
    )
    :vars
    (
      ?auto_207399 - BLOCK
      ?auto_207397 - BLOCK
      ?auto_207398 - BLOCK
      ?auto_207400 - BLOCK
      ?auto_207401 - BLOCK
      ?auto_207402 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_207394 ?auto_207395 ) ) ( not ( = ?auto_207394 ?auto_207396 ) ) ( not ( = ?auto_207394 ?auto_207399 ) ) ( not ( = ?auto_207395 ?auto_207396 ) ) ( not ( = ?auto_207395 ?auto_207399 ) ) ( not ( = ?auto_207396 ?auto_207399 ) ) ( not ( = ?auto_207394 ?auto_207397 ) ) ( not ( = ?auto_207394 ?auto_207398 ) ) ( not ( = ?auto_207395 ?auto_207397 ) ) ( not ( = ?auto_207395 ?auto_207398 ) ) ( not ( = ?auto_207396 ?auto_207397 ) ) ( not ( = ?auto_207396 ?auto_207398 ) ) ( not ( = ?auto_207399 ?auto_207397 ) ) ( not ( = ?auto_207399 ?auto_207398 ) ) ( not ( = ?auto_207397 ?auto_207398 ) ) ( not ( = ?auto_207400 ?auto_207401 ) ) ( not ( = ?auto_207400 ?auto_207398 ) ) ( not ( = ?auto_207401 ?auto_207398 ) ) ( not ( = ?auto_207394 ?auto_207401 ) ) ( not ( = ?auto_207394 ?auto_207400 ) ) ( not ( = ?auto_207395 ?auto_207401 ) ) ( not ( = ?auto_207395 ?auto_207400 ) ) ( not ( = ?auto_207396 ?auto_207401 ) ) ( not ( = ?auto_207396 ?auto_207400 ) ) ( not ( = ?auto_207399 ?auto_207401 ) ) ( not ( = ?auto_207399 ?auto_207400 ) ) ( not ( = ?auto_207397 ?auto_207401 ) ) ( not ( = ?auto_207397 ?auto_207400 ) ) ( ON ?auto_207400 ?auto_207402 ) ( not ( = ?auto_207394 ?auto_207402 ) ) ( not ( = ?auto_207395 ?auto_207402 ) ) ( not ( = ?auto_207396 ?auto_207402 ) ) ( not ( = ?auto_207399 ?auto_207402 ) ) ( not ( = ?auto_207397 ?auto_207402 ) ) ( not ( = ?auto_207398 ?auto_207402 ) ) ( not ( = ?auto_207400 ?auto_207402 ) ) ( not ( = ?auto_207401 ?auto_207402 ) ) ( ON ?auto_207401 ?auto_207400 ) ( ON-TABLE ?auto_207402 ) ( ON ?auto_207398 ?auto_207401 ) ( ON ?auto_207397 ?auto_207398 ) ( ON ?auto_207399 ?auto_207397 ) ( ON ?auto_207396 ?auto_207399 ) ( ON ?auto_207395 ?auto_207396 ) ( CLEAR ?auto_207395 ) ( HOLDING ?auto_207394 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_207394 )
      ( MAKE-3PILE ?auto_207394 ?auto_207395 ?auto_207396 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_207403 - BLOCK
      ?auto_207404 - BLOCK
      ?auto_207405 - BLOCK
    )
    :vars
    (
      ?auto_207410 - BLOCK
      ?auto_207407 - BLOCK
      ?auto_207406 - BLOCK
      ?auto_207411 - BLOCK
      ?auto_207409 - BLOCK
      ?auto_207408 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_207403 ?auto_207404 ) ) ( not ( = ?auto_207403 ?auto_207405 ) ) ( not ( = ?auto_207403 ?auto_207410 ) ) ( not ( = ?auto_207404 ?auto_207405 ) ) ( not ( = ?auto_207404 ?auto_207410 ) ) ( not ( = ?auto_207405 ?auto_207410 ) ) ( not ( = ?auto_207403 ?auto_207407 ) ) ( not ( = ?auto_207403 ?auto_207406 ) ) ( not ( = ?auto_207404 ?auto_207407 ) ) ( not ( = ?auto_207404 ?auto_207406 ) ) ( not ( = ?auto_207405 ?auto_207407 ) ) ( not ( = ?auto_207405 ?auto_207406 ) ) ( not ( = ?auto_207410 ?auto_207407 ) ) ( not ( = ?auto_207410 ?auto_207406 ) ) ( not ( = ?auto_207407 ?auto_207406 ) ) ( not ( = ?auto_207411 ?auto_207409 ) ) ( not ( = ?auto_207411 ?auto_207406 ) ) ( not ( = ?auto_207409 ?auto_207406 ) ) ( not ( = ?auto_207403 ?auto_207409 ) ) ( not ( = ?auto_207403 ?auto_207411 ) ) ( not ( = ?auto_207404 ?auto_207409 ) ) ( not ( = ?auto_207404 ?auto_207411 ) ) ( not ( = ?auto_207405 ?auto_207409 ) ) ( not ( = ?auto_207405 ?auto_207411 ) ) ( not ( = ?auto_207410 ?auto_207409 ) ) ( not ( = ?auto_207410 ?auto_207411 ) ) ( not ( = ?auto_207407 ?auto_207409 ) ) ( not ( = ?auto_207407 ?auto_207411 ) ) ( ON ?auto_207411 ?auto_207408 ) ( not ( = ?auto_207403 ?auto_207408 ) ) ( not ( = ?auto_207404 ?auto_207408 ) ) ( not ( = ?auto_207405 ?auto_207408 ) ) ( not ( = ?auto_207410 ?auto_207408 ) ) ( not ( = ?auto_207407 ?auto_207408 ) ) ( not ( = ?auto_207406 ?auto_207408 ) ) ( not ( = ?auto_207411 ?auto_207408 ) ) ( not ( = ?auto_207409 ?auto_207408 ) ) ( ON ?auto_207409 ?auto_207411 ) ( ON-TABLE ?auto_207408 ) ( ON ?auto_207406 ?auto_207409 ) ( ON ?auto_207407 ?auto_207406 ) ( ON ?auto_207410 ?auto_207407 ) ( ON ?auto_207405 ?auto_207410 ) ( ON ?auto_207404 ?auto_207405 ) ( ON ?auto_207403 ?auto_207404 ) ( CLEAR ?auto_207403 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_207408 ?auto_207411 ?auto_207409 ?auto_207406 ?auto_207407 ?auto_207410 ?auto_207405 ?auto_207404 )
      ( MAKE-3PILE ?auto_207403 ?auto_207404 ?auto_207405 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_207417 - BLOCK
      ?auto_207418 - BLOCK
      ?auto_207419 - BLOCK
      ?auto_207420 - BLOCK
      ?auto_207421 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_207421 ) ( CLEAR ?auto_207420 ) ( ON-TABLE ?auto_207417 ) ( ON ?auto_207418 ?auto_207417 ) ( ON ?auto_207419 ?auto_207418 ) ( ON ?auto_207420 ?auto_207419 ) ( not ( = ?auto_207417 ?auto_207418 ) ) ( not ( = ?auto_207417 ?auto_207419 ) ) ( not ( = ?auto_207417 ?auto_207420 ) ) ( not ( = ?auto_207417 ?auto_207421 ) ) ( not ( = ?auto_207418 ?auto_207419 ) ) ( not ( = ?auto_207418 ?auto_207420 ) ) ( not ( = ?auto_207418 ?auto_207421 ) ) ( not ( = ?auto_207419 ?auto_207420 ) ) ( not ( = ?auto_207419 ?auto_207421 ) ) ( not ( = ?auto_207420 ?auto_207421 ) ) )
    :subtasks
    ( ( !STACK ?auto_207421 ?auto_207420 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_207422 - BLOCK
      ?auto_207423 - BLOCK
      ?auto_207424 - BLOCK
      ?auto_207425 - BLOCK
      ?auto_207426 - BLOCK
    )
    :vars
    (
      ?auto_207427 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_207425 ) ( ON-TABLE ?auto_207422 ) ( ON ?auto_207423 ?auto_207422 ) ( ON ?auto_207424 ?auto_207423 ) ( ON ?auto_207425 ?auto_207424 ) ( not ( = ?auto_207422 ?auto_207423 ) ) ( not ( = ?auto_207422 ?auto_207424 ) ) ( not ( = ?auto_207422 ?auto_207425 ) ) ( not ( = ?auto_207422 ?auto_207426 ) ) ( not ( = ?auto_207423 ?auto_207424 ) ) ( not ( = ?auto_207423 ?auto_207425 ) ) ( not ( = ?auto_207423 ?auto_207426 ) ) ( not ( = ?auto_207424 ?auto_207425 ) ) ( not ( = ?auto_207424 ?auto_207426 ) ) ( not ( = ?auto_207425 ?auto_207426 ) ) ( ON ?auto_207426 ?auto_207427 ) ( CLEAR ?auto_207426 ) ( HAND-EMPTY ) ( not ( = ?auto_207422 ?auto_207427 ) ) ( not ( = ?auto_207423 ?auto_207427 ) ) ( not ( = ?auto_207424 ?auto_207427 ) ) ( not ( = ?auto_207425 ?auto_207427 ) ) ( not ( = ?auto_207426 ?auto_207427 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_207426 ?auto_207427 )
      ( MAKE-5PILE ?auto_207422 ?auto_207423 ?auto_207424 ?auto_207425 ?auto_207426 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_207428 - BLOCK
      ?auto_207429 - BLOCK
      ?auto_207430 - BLOCK
      ?auto_207431 - BLOCK
      ?auto_207432 - BLOCK
    )
    :vars
    (
      ?auto_207433 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_207428 ) ( ON ?auto_207429 ?auto_207428 ) ( ON ?auto_207430 ?auto_207429 ) ( not ( = ?auto_207428 ?auto_207429 ) ) ( not ( = ?auto_207428 ?auto_207430 ) ) ( not ( = ?auto_207428 ?auto_207431 ) ) ( not ( = ?auto_207428 ?auto_207432 ) ) ( not ( = ?auto_207429 ?auto_207430 ) ) ( not ( = ?auto_207429 ?auto_207431 ) ) ( not ( = ?auto_207429 ?auto_207432 ) ) ( not ( = ?auto_207430 ?auto_207431 ) ) ( not ( = ?auto_207430 ?auto_207432 ) ) ( not ( = ?auto_207431 ?auto_207432 ) ) ( ON ?auto_207432 ?auto_207433 ) ( CLEAR ?auto_207432 ) ( not ( = ?auto_207428 ?auto_207433 ) ) ( not ( = ?auto_207429 ?auto_207433 ) ) ( not ( = ?auto_207430 ?auto_207433 ) ) ( not ( = ?auto_207431 ?auto_207433 ) ) ( not ( = ?auto_207432 ?auto_207433 ) ) ( HOLDING ?auto_207431 ) ( CLEAR ?auto_207430 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_207428 ?auto_207429 ?auto_207430 ?auto_207431 )
      ( MAKE-5PILE ?auto_207428 ?auto_207429 ?auto_207430 ?auto_207431 ?auto_207432 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_207434 - BLOCK
      ?auto_207435 - BLOCK
      ?auto_207436 - BLOCK
      ?auto_207437 - BLOCK
      ?auto_207438 - BLOCK
    )
    :vars
    (
      ?auto_207439 - BLOCK
      ?auto_207441 - BLOCK
      ?auto_207440 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_207434 ) ( ON ?auto_207435 ?auto_207434 ) ( ON ?auto_207436 ?auto_207435 ) ( not ( = ?auto_207434 ?auto_207435 ) ) ( not ( = ?auto_207434 ?auto_207436 ) ) ( not ( = ?auto_207434 ?auto_207437 ) ) ( not ( = ?auto_207434 ?auto_207438 ) ) ( not ( = ?auto_207435 ?auto_207436 ) ) ( not ( = ?auto_207435 ?auto_207437 ) ) ( not ( = ?auto_207435 ?auto_207438 ) ) ( not ( = ?auto_207436 ?auto_207437 ) ) ( not ( = ?auto_207436 ?auto_207438 ) ) ( not ( = ?auto_207437 ?auto_207438 ) ) ( ON ?auto_207438 ?auto_207439 ) ( not ( = ?auto_207434 ?auto_207439 ) ) ( not ( = ?auto_207435 ?auto_207439 ) ) ( not ( = ?auto_207436 ?auto_207439 ) ) ( not ( = ?auto_207437 ?auto_207439 ) ) ( not ( = ?auto_207438 ?auto_207439 ) ) ( CLEAR ?auto_207436 ) ( ON ?auto_207437 ?auto_207438 ) ( CLEAR ?auto_207437 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_207441 ) ( ON ?auto_207440 ?auto_207441 ) ( ON ?auto_207439 ?auto_207440 ) ( not ( = ?auto_207441 ?auto_207440 ) ) ( not ( = ?auto_207441 ?auto_207439 ) ) ( not ( = ?auto_207441 ?auto_207438 ) ) ( not ( = ?auto_207441 ?auto_207437 ) ) ( not ( = ?auto_207440 ?auto_207439 ) ) ( not ( = ?auto_207440 ?auto_207438 ) ) ( not ( = ?auto_207440 ?auto_207437 ) ) ( not ( = ?auto_207434 ?auto_207441 ) ) ( not ( = ?auto_207434 ?auto_207440 ) ) ( not ( = ?auto_207435 ?auto_207441 ) ) ( not ( = ?auto_207435 ?auto_207440 ) ) ( not ( = ?auto_207436 ?auto_207441 ) ) ( not ( = ?auto_207436 ?auto_207440 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_207441 ?auto_207440 ?auto_207439 ?auto_207438 )
      ( MAKE-5PILE ?auto_207434 ?auto_207435 ?auto_207436 ?auto_207437 ?auto_207438 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_207442 - BLOCK
      ?auto_207443 - BLOCK
      ?auto_207444 - BLOCK
      ?auto_207445 - BLOCK
      ?auto_207446 - BLOCK
    )
    :vars
    (
      ?auto_207448 - BLOCK
      ?auto_207447 - BLOCK
      ?auto_207449 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_207442 ) ( ON ?auto_207443 ?auto_207442 ) ( not ( = ?auto_207442 ?auto_207443 ) ) ( not ( = ?auto_207442 ?auto_207444 ) ) ( not ( = ?auto_207442 ?auto_207445 ) ) ( not ( = ?auto_207442 ?auto_207446 ) ) ( not ( = ?auto_207443 ?auto_207444 ) ) ( not ( = ?auto_207443 ?auto_207445 ) ) ( not ( = ?auto_207443 ?auto_207446 ) ) ( not ( = ?auto_207444 ?auto_207445 ) ) ( not ( = ?auto_207444 ?auto_207446 ) ) ( not ( = ?auto_207445 ?auto_207446 ) ) ( ON ?auto_207446 ?auto_207448 ) ( not ( = ?auto_207442 ?auto_207448 ) ) ( not ( = ?auto_207443 ?auto_207448 ) ) ( not ( = ?auto_207444 ?auto_207448 ) ) ( not ( = ?auto_207445 ?auto_207448 ) ) ( not ( = ?auto_207446 ?auto_207448 ) ) ( ON ?auto_207445 ?auto_207446 ) ( CLEAR ?auto_207445 ) ( ON-TABLE ?auto_207447 ) ( ON ?auto_207449 ?auto_207447 ) ( ON ?auto_207448 ?auto_207449 ) ( not ( = ?auto_207447 ?auto_207449 ) ) ( not ( = ?auto_207447 ?auto_207448 ) ) ( not ( = ?auto_207447 ?auto_207446 ) ) ( not ( = ?auto_207447 ?auto_207445 ) ) ( not ( = ?auto_207449 ?auto_207448 ) ) ( not ( = ?auto_207449 ?auto_207446 ) ) ( not ( = ?auto_207449 ?auto_207445 ) ) ( not ( = ?auto_207442 ?auto_207447 ) ) ( not ( = ?auto_207442 ?auto_207449 ) ) ( not ( = ?auto_207443 ?auto_207447 ) ) ( not ( = ?auto_207443 ?auto_207449 ) ) ( not ( = ?auto_207444 ?auto_207447 ) ) ( not ( = ?auto_207444 ?auto_207449 ) ) ( HOLDING ?auto_207444 ) ( CLEAR ?auto_207443 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_207442 ?auto_207443 ?auto_207444 )
      ( MAKE-5PILE ?auto_207442 ?auto_207443 ?auto_207444 ?auto_207445 ?auto_207446 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_207450 - BLOCK
      ?auto_207451 - BLOCK
      ?auto_207452 - BLOCK
      ?auto_207453 - BLOCK
      ?auto_207454 - BLOCK
    )
    :vars
    (
      ?auto_207456 - BLOCK
      ?auto_207455 - BLOCK
      ?auto_207457 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_207450 ) ( ON ?auto_207451 ?auto_207450 ) ( not ( = ?auto_207450 ?auto_207451 ) ) ( not ( = ?auto_207450 ?auto_207452 ) ) ( not ( = ?auto_207450 ?auto_207453 ) ) ( not ( = ?auto_207450 ?auto_207454 ) ) ( not ( = ?auto_207451 ?auto_207452 ) ) ( not ( = ?auto_207451 ?auto_207453 ) ) ( not ( = ?auto_207451 ?auto_207454 ) ) ( not ( = ?auto_207452 ?auto_207453 ) ) ( not ( = ?auto_207452 ?auto_207454 ) ) ( not ( = ?auto_207453 ?auto_207454 ) ) ( ON ?auto_207454 ?auto_207456 ) ( not ( = ?auto_207450 ?auto_207456 ) ) ( not ( = ?auto_207451 ?auto_207456 ) ) ( not ( = ?auto_207452 ?auto_207456 ) ) ( not ( = ?auto_207453 ?auto_207456 ) ) ( not ( = ?auto_207454 ?auto_207456 ) ) ( ON ?auto_207453 ?auto_207454 ) ( ON-TABLE ?auto_207455 ) ( ON ?auto_207457 ?auto_207455 ) ( ON ?auto_207456 ?auto_207457 ) ( not ( = ?auto_207455 ?auto_207457 ) ) ( not ( = ?auto_207455 ?auto_207456 ) ) ( not ( = ?auto_207455 ?auto_207454 ) ) ( not ( = ?auto_207455 ?auto_207453 ) ) ( not ( = ?auto_207457 ?auto_207456 ) ) ( not ( = ?auto_207457 ?auto_207454 ) ) ( not ( = ?auto_207457 ?auto_207453 ) ) ( not ( = ?auto_207450 ?auto_207455 ) ) ( not ( = ?auto_207450 ?auto_207457 ) ) ( not ( = ?auto_207451 ?auto_207455 ) ) ( not ( = ?auto_207451 ?auto_207457 ) ) ( not ( = ?auto_207452 ?auto_207455 ) ) ( not ( = ?auto_207452 ?auto_207457 ) ) ( CLEAR ?auto_207451 ) ( ON ?auto_207452 ?auto_207453 ) ( CLEAR ?auto_207452 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_207455 ?auto_207457 ?auto_207456 ?auto_207454 ?auto_207453 )
      ( MAKE-5PILE ?auto_207450 ?auto_207451 ?auto_207452 ?auto_207453 ?auto_207454 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_207458 - BLOCK
      ?auto_207459 - BLOCK
      ?auto_207460 - BLOCK
      ?auto_207461 - BLOCK
      ?auto_207462 - BLOCK
    )
    :vars
    (
      ?auto_207465 - BLOCK
      ?auto_207464 - BLOCK
      ?auto_207463 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_207458 ) ( not ( = ?auto_207458 ?auto_207459 ) ) ( not ( = ?auto_207458 ?auto_207460 ) ) ( not ( = ?auto_207458 ?auto_207461 ) ) ( not ( = ?auto_207458 ?auto_207462 ) ) ( not ( = ?auto_207459 ?auto_207460 ) ) ( not ( = ?auto_207459 ?auto_207461 ) ) ( not ( = ?auto_207459 ?auto_207462 ) ) ( not ( = ?auto_207460 ?auto_207461 ) ) ( not ( = ?auto_207460 ?auto_207462 ) ) ( not ( = ?auto_207461 ?auto_207462 ) ) ( ON ?auto_207462 ?auto_207465 ) ( not ( = ?auto_207458 ?auto_207465 ) ) ( not ( = ?auto_207459 ?auto_207465 ) ) ( not ( = ?auto_207460 ?auto_207465 ) ) ( not ( = ?auto_207461 ?auto_207465 ) ) ( not ( = ?auto_207462 ?auto_207465 ) ) ( ON ?auto_207461 ?auto_207462 ) ( ON-TABLE ?auto_207464 ) ( ON ?auto_207463 ?auto_207464 ) ( ON ?auto_207465 ?auto_207463 ) ( not ( = ?auto_207464 ?auto_207463 ) ) ( not ( = ?auto_207464 ?auto_207465 ) ) ( not ( = ?auto_207464 ?auto_207462 ) ) ( not ( = ?auto_207464 ?auto_207461 ) ) ( not ( = ?auto_207463 ?auto_207465 ) ) ( not ( = ?auto_207463 ?auto_207462 ) ) ( not ( = ?auto_207463 ?auto_207461 ) ) ( not ( = ?auto_207458 ?auto_207464 ) ) ( not ( = ?auto_207458 ?auto_207463 ) ) ( not ( = ?auto_207459 ?auto_207464 ) ) ( not ( = ?auto_207459 ?auto_207463 ) ) ( not ( = ?auto_207460 ?auto_207464 ) ) ( not ( = ?auto_207460 ?auto_207463 ) ) ( ON ?auto_207460 ?auto_207461 ) ( CLEAR ?auto_207460 ) ( HOLDING ?auto_207459 ) ( CLEAR ?auto_207458 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_207458 ?auto_207459 )
      ( MAKE-5PILE ?auto_207458 ?auto_207459 ?auto_207460 ?auto_207461 ?auto_207462 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_207466 - BLOCK
      ?auto_207467 - BLOCK
      ?auto_207468 - BLOCK
      ?auto_207469 - BLOCK
      ?auto_207470 - BLOCK
    )
    :vars
    (
      ?auto_207471 - BLOCK
      ?auto_207472 - BLOCK
      ?auto_207473 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_207466 ) ( not ( = ?auto_207466 ?auto_207467 ) ) ( not ( = ?auto_207466 ?auto_207468 ) ) ( not ( = ?auto_207466 ?auto_207469 ) ) ( not ( = ?auto_207466 ?auto_207470 ) ) ( not ( = ?auto_207467 ?auto_207468 ) ) ( not ( = ?auto_207467 ?auto_207469 ) ) ( not ( = ?auto_207467 ?auto_207470 ) ) ( not ( = ?auto_207468 ?auto_207469 ) ) ( not ( = ?auto_207468 ?auto_207470 ) ) ( not ( = ?auto_207469 ?auto_207470 ) ) ( ON ?auto_207470 ?auto_207471 ) ( not ( = ?auto_207466 ?auto_207471 ) ) ( not ( = ?auto_207467 ?auto_207471 ) ) ( not ( = ?auto_207468 ?auto_207471 ) ) ( not ( = ?auto_207469 ?auto_207471 ) ) ( not ( = ?auto_207470 ?auto_207471 ) ) ( ON ?auto_207469 ?auto_207470 ) ( ON-TABLE ?auto_207472 ) ( ON ?auto_207473 ?auto_207472 ) ( ON ?auto_207471 ?auto_207473 ) ( not ( = ?auto_207472 ?auto_207473 ) ) ( not ( = ?auto_207472 ?auto_207471 ) ) ( not ( = ?auto_207472 ?auto_207470 ) ) ( not ( = ?auto_207472 ?auto_207469 ) ) ( not ( = ?auto_207473 ?auto_207471 ) ) ( not ( = ?auto_207473 ?auto_207470 ) ) ( not ( = ?auto_207473 ?auto_207469 ) ) ( not ( = ?auto_207466 ?auto_207472 ) ) ( not ( = ?auto_207466 ?auto_207473 ) ) ( not ( = ?auto_207467 ?auto_207472 ) ) ( not ( = ?auto_207467 ?auto_207473 ) ) ( not ( = ?auto_207468 ?auto_207472 ) ) ( not ( = ?auto_207468 ?auto_207473 ) ) ( ON ?auto_207468 ?auto_207469 ) ( CLEAR ?auto_207466 ) ( ON ?auto_207467 ?auto_207468 ) ( CLEAR ?auto_207467 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_207472 ?auto_207473 ?auto_207471 ?auto_207470 ?auto_207469 ?auto_207468 )
      ( MAKE-5PILE ?auto_207466 ?auto_207467 ?auto_207468 ?auto_207469 ?auto_207470 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_207474 - BLOCK
      ?auto_207475 - BLOCK
      ?auto_207476 - BLOCK
      ?auto_207477 - BLOCK
      ?auto_207478 - BLOCK
    )
    :vars
    (
      ?auto_207481 - BLOCK
      ?auto_207480 - BLOCK
      ?auto_207479 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_207474 ?auto_207475 ) ) ( not ( = ?auto_207474 ?auto_207476 ) ) ( not ( = ?auto_207474 ?auto_207477 ) ) ( not ( = ?auto_207474 ?auto_207478 ) ) ( not ( = ?auto_207475 ?auto_207476 ) ) ( not ( = ?auto_207475 ?auto_207477 ) ) ( not ( = ?auto_207475 ?auto_207478 ) ) ( not ( = ?auto_207476 ?auto_207477 ) ) ( not ( = ?auto_207476 ?auto_207478 ) ) ( not ( = ?auto_207477 ?auto_207478 ) ) ( ON ?auto_207478 ?auto_207481 ) ( not ( = ?auto_207474 ?auto_207481 ) ) ( not ( = ?auto_207475 ?auto_207481 ) ) ( not ( = ?auto_207476 ?auto_207481 ) ) ( not ( = ?auto_207477 ?auto_207481 ) ) ( not ( = ?auto_207478 ?auto_207481 ) ) ( ON ?auto_207477 ?auto_207478 ) ( ON-TABLE ?auto_207480 ) ( ON ?auto_207479 ?auto_207480 ) ( ON ?auto_207481 ?auto_207479 ) ( not ( = ?auto_207480 ?auto_207479 ) ) ( not ( = ?auto_207480 ?auto_207481 ) ) ( not ( = ?auto_207480 ?auto_207478 ) ) ( not ( = ?auto_207480 ?auto_207477 ) ) ( not ( = ?auto_207479 ?auto_207481 ) ) ( not ( = ?auto_207479 ?auto_207478 ) ) ( not ( = ?auto_207479 ?auto_207477 ) ) ( not ( = ?auto_207474 ?auto_207480 ) ) ( not ( = ?auto_207474 ?auto_207479 ) ) ( not ( = ?auto_207475 ?auto_207480 ) ) ( not ( = ?auto_207475 ?auto_207479 ) ) ( not ( = ?auto_207476 ?auto_207480 ) ) ( not ( = ?auto_207476 ?auto_207479 ) ) ( ON ?auto_207476 ?auto_207477 ) ( ON ?auto_207475 ?auto_207476 ) ( CLEAR ?auto_207475 ) ( HOLDING ?auto_207474 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_207474 )
      ( MAKE-5PILE ?auto_207474 ?auto_207475 ?auto_207476 ?auto_207477 ?auto_207478 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_207482 - BLOCK
      ?auto_207483 - BLOCK
      ?auto_207484 - BLOCK
      ?auto_207485 - BLOCK
      ?auto_207486 - BLOCK
    )
    :vars
    (
      ?auto_207489 - BLOCK
      ?auto_207488 - BLOCK
      ?auto_207487 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_207482 ?auto_207483 ) ) ( not ( = ?auto_207482 ?auto_207484 ) ) ( not ( = ?auto_207482 ?auto_207485 ) ) ( not ( = ?auto_207482 ?auto_207486 ) ) ( not ( = ?auto_207483 ?auto_207484 ) ) ( not ( = ?auto_207483 ?auto_207485 ) ) ( not ( = ?auto_207483 ?auto_207486 ) ) ( not ( = ?auto_207484 ?auto_207485 ) ) ( not ( = ?auto_207484 ?auto_207486 ) ) ( not ( = ?auto_207485 ?auto_207486 ) ) ( ON ?auto_207486 ?auto_207489 ) ( not ( = ?auto_207482 ?auto_207489 ) ) ( not ( = ?auto_207483 ?auto_207489 ) ) ( not ( = ?auto_207484 ?auto_207489 ) ) ( not ( = ?auto_207485 ?auto_207489 ) ) ( not ( = ?auto_207486 ?auto_207489 ) ) ( ON ?auto_207485 ?auto_207486 ) ( ON-TABLE ?auto_207488 ) ( ON ?auto_207487 ?auto_207488 ) ( ON ?auto_207489 ?auto_207487 ) ( not ( = ?auto_207488 ?auto_207487 ) ) ( not ( = ?auto_207488 ?auto_207489 ) ) ( not ( = ?auto_207488 ?auto_207486 ) ) ( not ( = ?auto_207488 ?auto_207485 ) ) ( not ( = ?auto_207487 ?auto_207489 ) ) ( not ( = ?auto_207487 ?auto_207486 ) ) ( not ( = ?auto_207487 ?auto_207485 ) ) ( not ( = ?auto_207482 ?auto_207488 ) ) ( not ( = ?auto_207482 ?auto_207487 ) ) ( not ( = ?auto_207483 ?auto_207488 ) ) ( not ( = ?auto_207483 ?auto_207487 ) ) ( not ( = ?auto_207484 ?auto_207488 ) ) ( not ( = ?auto_207484 ?auto_207487 ) ) ( ON ?auto_207484 ?auto_207485 ) ( ON ?auto_207483 ?auto_207484 ) ( ON ?auto_207482 ?auto_207483 ) ( CLEAR ?auto_207482 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_207488 ?auto_207487 ?auto_207489 ?auto_207486 ?auto_207485 ?auto_207484 ?auto_207483 )
      ( MAKE-5PILE ?auto_207482 ?auto_207483 ?auto_207484 ?auto_207485 ?auto_207486 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_207490 - BLOCK
      ?auto_207491 - BLOCK
      ?auto_207492 - BLOCK
      ?auto_207493 - BLOCK
      ?auto_207494 - BLOCK
    )
    :vars
    (
      ?auto_207495 - BLOCK
      ?auto_207496 - BLOCK
      ?auto_207497 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_207490 ?auto_207491 ) ) ( not ( = ?auto_207490 ?auto_207492 ) ) ( not ( = ?auto_207490 ?auto_207493 ) ) ( not ( = ?auto_207490 ?auto_207494 ) ) ( not ( = ?auto_207491 ?auto_207492 ) ) ( not ( = ?auto_207491 ?auto_207493 ) ) ( not ( = ?auto_207491 ?auto_207494 ) ) ( not ( = ?auto_207492 ?auto_207493 ) ) ( not ( = ?auto_207492 ?auto_207494 ) ) ( not ( = ?auto_207493 ?auto_207494 ) ) ( ON ?auto_207494 ?auto_207495 ) ( not ( = ?auto_207490 ?auto_207495 ) ) ( not ( = ?auto_207491 ?auto_207495 ) ) ( not ( = ?auto_207492 ?auto_207495 ) ) ( not ( = ?auto_207493 ?auto_207495 ) ) ( not ( = ?auto_207494 ?auto_207495 ) ) ( ON ?auto_207493 ?auto_207494 ) ( ON-TABLE ?auto_207496 ) ( ON ?auto_207497 ?auto_207496 ) ( ON ?auto_207495 ?auto_207497 ) ( not ( = ?auto_207496 ?auto_207497 ) ) ( not ( = ?auto_207496 ?auto_207495 ) ) ( not ( = ?auto_207496 ?auto_207494 ) ) ( not ( = ?auto_207496 ?auto_207493 ) ) ( not ( = ?auto_207497 ?auto_207495 ) ) ( not ( = ?auto_207497 ?auto_207494 ) ) ( not ( = ?auto_207497 ?auto_207493 ) ) ( not ( = ?auto_207490 ?auto_207496 ) ) ( not ( = ?auto_207490 ?auto_207497 ) ) ( not ( = ?auto_207491 ?auto_207496 ) ) ( not ( = ?auto_207491 ?auto_207497 ) ) ( not ( = ?auto_207492 ?auto_207496 ) ) ( not ( = ?auto_207492 ?auto_207497 ) ) ( ON ?auto_207492 ?auto_207493 ) ( ON ?auto_207491 ?auto_207492 ) ( HOLDING ?auto_207490 ) ( CLEAR ?auto_207491 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_207496 ?auto_207497 ?auto_207495 ?auto_207494 ?auto_207493 ?auto_207492 ?auto_207491 ?auto_207490 )
      ( MAKE-5PILE ?auto_207490 ?auto_207491 ?auto_207492 ?auto_207493 ?auto_207494 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_207498 - BLOCK
      ?auto_207499 - BLOCK
      ?auto_207500 - BLOCK
      ?auto_207501 - BLOCK
      ?auto_207502 - BLOCK
    )
    :vars
    (
      ?auto_207503 - BLOCK
      ?auto_207505 - BLOCK
      ?auto_207504 - BLOCK
      ?auto_207506 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_207498 ?auto_207499 ) ) ( not ( = ?auto_207498 ?auto_207500 ) ) ( not ( = ?auto_207498 ?auto_207501 ) ) ( not ( = ?auto_207498 ?auto_207502 ) ) ( not ( = ?auto_207499 ?auto_207500 ) ) ( not ( = ?auto_207499 ?auto_207501 ) ) ( not ( = ?auto_207499 ?auto_207502 ) ) ( not ( = ?auto_207500 ?auto_207501 ) ) ( not ( = ?auto_207500 ?auto_207502 ) ) ( not ( = ?auto_207501 ?auto_207502 ) ) ( ON ?auto_207502 ?auto_207503 ) ( not ( = ?auto_207498 ?auto_207503 ) ) ( not ( = ?auto_207499 ?auto_207503 ) ) ( not ( = ?auto_207500 ?auto_207503 ) ) ( not ( = ?auto_207501 ?auto_207503 ) ) ( not ( = ?auto_207502 ?auto_207503 ) ) ( ON ?auto_207501 ?auto_207502 ) ( ON-TABLE ?auto_207505 ) ( ON ?auto_207504 ?auto_207505 ) ( ON ?auto_207503 ?auto_207504 ) ( not ( = ?auto_207505 ?auto_207504 ) ) ( not ( = ?auto_207505 ?auto_207503 ) ) ( not ( = ?auto_207505 ?auto_207502 ) ) ( not ( = ?auto_207505 ?auto_207501 ) ) ( not ( = ?auto_207504 ?auto_207503 ) ) ( not ( = ?auto_207504 ?auto_207502 ) ) ( not ( = ?auto_207504 ?auto_207501 ) ) ( not ( = ?auto_207498 ?auto_207505 ) ) ( not ( = ?auto_207498 ?auto_207504 ) ) ( not ( = ?auto_207499 ?auto_207505 ) ) ( not ( = ?auto_207499 ?auto_207504 ) ) ( not ( = ?auto_207500 ?auto_207505 ) ) ( not ( = ?auto_207500 ?auto_207504 ) ) ( ON ?auto_207500 ?auto_207501 ) ( ON ?auto_207499 ?auto_207500 ) ( CLEAR ?auto_207499 ) ( ON ?auto_207498 ?auto_207506 ) ( CLEAR ?auto_207498 ) ( HAND-EMPTY ) ( not ( = ?auto_207498 ?auto_207506 ) ) ( not ( = ?auto_207499 ?auto_207506 ) ) ( not ( = ?auto_207500 ?auto_207506 ) ) ( not ( = ?auto_207501 ?auto_207506 ) ) ( not ( = ?auto_207502 ?auto_207506 ) ) ( not ( = ?auto_207503 ?auto_207506 ) ) ( not ( = ?auto_207505 ?auto_207506 ) ) ( not ( = ?auto_207504 ?auto_207506 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_207498 ?auto_207506 )
      ( MAKE-5PILE ?auto_207498 ?auto_207499 ?auto_207500 ?auto_207501 ?auto_207502 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_207507 - BLOCK
      ?auto_207508 - BLOCK
      ?auto_207509 - BLOCK
      ?auto_207510 - BLOCK
      ?auto_207511 - BLOCK
    )
    :vars
    (
      ?auto_207513 - BLOCK
      ?auto_207515 - BLOCK
      ?auto_207514 - BLOCK
      ?auto_207512 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_207507 ?auto_207508 ) ) ( not ( = ?auto_207507 ?auto_207509 ) ) ( not ( = ?auto_207507 ?auto_207510 ) ) ( not ( = ?auto_207507 ?auto_207511 ) ) ( not ( = ?auto_207508 ?auto_207509 ) ) ( not ( = ?auto_207508 ?auto_207510 ) ) ( not ( = ?auto_207508 ?auto_207511 ) ) ( not ( = ?auto_207509 ?auto_207510 ) ) ( not ( = ?auto_207509 ?auto_207511 ) ) ( not ( = ?auto_207510 ?auto_207511 ) ) ( ON ?auto_207511 ?auto_207513 ) ( not ( = ?auto_207507 ?auto_207513 ) ) ( not ( = ?auto_207508 ?auto_207513 ) ) ( not ( = ?auto_207509 ?auto_207513 ) ) ( not ( = ?auto_207510 ?auto_207513 ) ) ( not ( = ?auto_207511 ?auto_207513 ) ) ( ON ?auto_207510 ?auto_207511 ) ( ON-TABLE ?auto_207515 ) ( ON ?auto_207514 ?auto_207515 ) ( ON ?auto_207513 ?auto_207514 ) ( not ( = ?auto_207515 ?auto_207514 ) ) ( not ( = ?auto_207515 ?auto_207513 ) ) ( not ( = ?auto_207515 ?auto_207511 ) ) ( not ( = ?auto_207515 ?auto_207510 ) ) ( not ( = ?auto_207514 ?auto_207513 ) ) ( not ( = ?auto_207514 ?auto_207511 ) ) ( not ( = ?auto_207514 ?auto_207510 ) ) ( not ( = ?auto_207507 ?auto_207515 ) ) ( not ( = ?auto_207507 ?auto_207514 ) ) ( not ( = ?auto_207508 ?auto_207515 ) ) ( not ( = ?auto_207508 ?auto_207514 ) ) ( not ( = ?auto_207509 ?auto_207515 ) ) ( not ( = ?auto_207509 ?auto_207514 ) ) ( ON ?auto_207509 ?auto_207510 ) ( ON ?auto_207507 ?auto_207512 ) ( CLEAR ?auto_207507 ) ( not ( = ?auto_207507 ?auto_207512 ) ) ( not ( = ?auto_207508 ?auto_207512 ) ) ( not ( = ?auto_207509 ?auto_207512 ) ) ( not ( = ?auto_207510 ?auto_207512 ) ) ( not ( = ?auto_207511 ?auto_207512 ) ) ( not ( = ?auto_207513 ?auto_207512 ) ) ( not ( = ?auto_207515 ?auto_207512 ) ) ( not ( = ?auto_207514 ?auto_207512 ) ) ( HOLDING ?auto_207508 ) ( CLEAR ?auto_207509 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_207515 ?auto_207514 ?auto_207513 ?auto_207511 ?auto_207510 ?auto_207509 ?auto_207508 )
      ( MAKE-5PILE ?auto_207507 ?auto_207508 ?auto_207509 ?auto_207510 ?auto_207511 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_207516 - BLOCK
      ?auto_207517 - BLOCK
      ?auto_207518 - BLOCK
      ?auto_207519 - BLOCK
      ?auto_207520 - BLOCK
    )
    :vars
    (
      ?auto_207524 - BLOCK
      ?auto_207522 - BLOCK
      ?auto_207521 - BLOCK
      ?auto_207523 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_207516 ?auto_207517 ) ) ( not ( = ?auto_207516 ?auto_207518 ) ) ( not ( = ?auto_207516 ?auto_207519 ) ) ( not ( = ?auto_207516 ?auto_207520 ) ) ( not ( = ?auto_207517 ?auto_207518 ) ) ( not ( = ?auto_207517 ?auto_207519 ) ) ( not ( = ?auto_207517 ?auto_207520 ) ) ( not ( = ?auto_207518 ?auto_207519 ) ) ( not ( = ?auto_207518 ?auto_207520 ) ) ( not ( = ?auto_207519 ?auto_207520 ) ) ( ON ?auto_207520 ?auto_207524 ) ( not ( = ?auto_207516 ?auto_207524 ) ) ( not ( = ?auto_207517 ?auto_207524 ) ) ( not ( = ?auto_207518 ?auto_207524 ) ) ( not ( = ?auto_207519 ?auto_207524 ) ) ( not ( = ?auto_207520 ?auto_207524 ) ) ( ON ?auto_207519 ?auto_207520 ) ( ON-TABLE ?auto_207522 ) ( ON ?auto_207521 ?auto_207522 ) ( ON ?auto_207524 ?auto_207521 ) ( not ( = ?auto_207522 ?auto_207521 ) ) ( not ( = ?auto_207522 ?auto_207524 ) ) ( not ( = ?auto_207522 ?auto_207520 ) ) ( not ( = ?auto_207522 ?auto_207519 ) ) ( not ( = ?auto_207521 ?auto_207524 ) ) ( not ( = ?auto_207521 ?auto_207520 ) ) ( not ( = ?auto_207521 ?auto_207519 ) ) ( not ( = ?auto_207516 ?auto_207522 ) ) ( not ( = ?auto_207516 ?auto_207521 ) ) ( not ( = ?auto_207517 ?auto_207522 ) ) ( not ( = ?auto_207517 ?auto_207521 ) ) ( not ( = ?auto_207518 ?auto_207522 ) ) ( not ( = ?auto_207518 ?auto_207521 ) ) ( ON ?auto_207518 ?auto_207519 ) ( ON ?auto_207516 ?auto_207523 ) ( not ( = ?auto_207516 ?auto_207523 ) ) ( not ( = ?auto_207517 ?auto_207523 ) ) ( not ( = ?auto_207518 ?auto_207523 ) ) ( not ( = ?auto_207519 ?auto_207523 ) ) ( not ( = ?auto_207520 ?auto_207523 ) ) ( not ( = ?auto_207524 ?auto_207523 ) ) ( not ( = ?auto_207522 ?auto_207523 ) ) ( not ( = ?auto_207521 ?auto_207523 ) ) ( CLEAR ?auto_207518 ) ( ON ?auto_207517 ?auto_207516 ) ( CLEAR ?auto_207517 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_207523 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_207523 ?auto_207516 )
      ( MAKE-5PILE ?auto_207516 ?auto_207517 ?auto_207518 ?auto_207519 ?auto_207520 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_207525 - BLOCK
      ?auto_207526 - BLOCK
      ?auto_207527 - BLOCK
      ?auto_207528 - BLOCK
      ?auto_207529 - BLOCK
    )
    :vars
    (
      ?auto_207532 - BLOCK
      ?auto_207530 - BLOCK
      ?auto_207531 - BLOCK
      ?auto_207533 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_207525 ?auto_207526 ) ) ( not ( = ?auto_207525 ?auto_207527 ) ) ( not ( = ?auto_207525 ?auto_207528 ) ) ( not ( = ?auto_207525 ?auto_207529 ) ) ( not ( = ?auto_207526 ?auto_207527 ) ) ( not ( = ?auto_207526 ?auto_207528 ) ) ( not ( = ?auto_207526 ?auto_207529 ) ) ( not ( = ?auto_207527 ?auto_207528 ) ) ( not ( = ?auto_207527 ?auto_207529 ) ) ( not ( = ?auto_207528 ?auto_207529 ) ) ( ON ?auto_207529 ?auto_207532 ) ( not ( = ?auto_207525 ?auto_207532 ) ) ( not ( = ?auto_207526 ?auto_207532 ) ) ( not ( = ?auto_207527 ?auto_207532 ) ) ( not ( = ?auto_207528 ?auto_207532 ) ) ( not ( = ?auto_207529 ?auto_207532 ) ) ( ON ?auto_207528 ?auto_207529 ) ( ON-TABLE ?auto_207530 ) ( ON ?auto_207531 ?auto_207530 ) ( ON ?auto_207532 ?auto_207531 ) ( not ( = ?auto_207530 ?auto_207531 ) ) ( not ( = ?auto_207530 ?auto_207532 ) ) ( not ( = ?auto_207530 ?auto_207529 ) ) ( not ( = ?auto_207530 ?auto_207528 ) ) ( not ( = ?auto_207531 ?auto_207532 ) ) ( not ( = ?auto_207531 ?auto_207529 ) ) ( not ( = ?auto_207531 ?auto_207528 ) ) ( not ( = ?auto_207525 ?auto_207530 ) ) ( not ( = ?auto_207525 ?auto_207531 ) ) ( not ( = ?auto_207526 ?auto_207530 ) ) ( not ( = ?auto_207526 ?auto_207531 ) ) ( not ( = ?auto_207527 ?auto_207530 ) ) ( not ( = ?auto_207527 ?auto_207531 ) ) ( ON ?auto_207525 ?auto_207533 ) ( not ( = ?auto_207525 ?auto_207533 ) ) ( not ( = ?auto_207526 ?auto_207533 ) ) ( not ( = ?auto_207527 ?auto_207533 ) ) ( not ( = ?auto_207528 ?auto_207533 ) ) ( not ( = ?auto_207529 ?auto_207533 ) ) ( not ( = ?auto_207532 ?auto_207533 ) ) ( not ( = ?auto_207530 ?auto_207533 ) ) ( not ( = ?auto_207531 ?auto_207533 ) ) ( ON ?auto_207526 ?auto_207525 ) ( CLEAR ?auto_207526 ) ( ON-TABLE ?auto_207533 ) ( HOLDING ?auto_207527 ) ( CLEAR ?auto_207528 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_207530 ?auto_207531 ?auto_207532 ?auto_207529 ?auto_207528 ?auto_207527 )
      ( MAKE-5PILE ?auto_207525 ?auto_207526 ?auto_207527 ?auto_207528 ?auto_207529 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_207534 - BLOCK
      ?auto_207535 - BLOCK
      ?auto_207536 - BLOCK
      ?auto_207537 - BLOCK
      ?auto_207538 - BLOCK
    )
    :vars
    (
      ?auto_207541 - BLOCK
      ?auto_207540 - BLOCK
      ?auto_207542 - BLOCK
      ?auto_207539 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_207534 ?auto_207535 ) ) ( not ( = ?auto_207534 ?auto_207536 ) ) ( not ( = ?auto_207534 ?auto_207537 ) ) ( not ( = ?auto_207534 ?auto_207538 ) ) ( not ( = ?auto_207535 ?auto_207536 ) ) ( not ( = ?auto_207535 ?auto_207537 ) ) ( not ( = ?auto_207535 ?auto_207538 ) ) ( not ( = ?auto_207536 ?auto_207537 ) ) ( not ( = ?auto_207536 ?auto_207538 ) ) ( not ( = ?auto_207537 ?auto_207538 ) ) ( ON ?auto_207538 ?auto_207541 ) ( not ( = ?auto_207534 ?auto_207541 ) ) ( not ( = ?auto_207535 ?auto_207541 ) ) ( not ( = ?auto_207536 ?auto_207541 ) ) ( not ( = ?auto_207537 ?auto_207541 ) ) ( not ( = ?auto_207538 ?auto_207541 ) ) ( ON ?auto_207537 ?auto_207538 ) ( ON-TABLE ?auto_207540 ) ( ON ?auto_207542 ?auto_207540 ) ( ON ?auto_207541 ?auto_207542 ) ( not ( = ?auto_207540 ?auto_207542 ) ) ( not ( = ?auto_207540 ?auto_207541 ) ) ( not ( = ?auto_207540 ?auto_207538 ) ) ( not ( = ?auto_207540 ?auto_207537 ) ) ( not ( = ?auto_207542 ?auto_207541 ) ) ( not ( = ?auto_207542 ?auto_207538 ) ) ( not ( = ?auto_207542 ?auto_207537 ) ) ( not ( = ?auto_207534 ?auto_207540 ) ) ( not ( = ?auto_207534 ?auto_207542 ) ) ( not ( = ?auto_207535 ?auto_207540 ) ) ( not ( = ?auto_207535 ?auto_207542 ) ) ( not ( = ?auto_207536 ?auto_207540 ) ) ( not ( = ?auto_207536 ?auto_207542 ) ) ( ON ?auto_207534 ?auto_207539 ) ( not ( = ?auto_207534 ?auto_207539 ) ) ( not ( = ?auto_207535 ?auto_207539 ) ) ( not ( = ?auto_207536 ?auto_207539 ) ) ( not ( = ?auto_207537 ?auto_207539 ) ) ( not ( = ?auto_207538 ?auto_207539 ) ) ( not ( = ?auto_207541 ?auto_207539 ) ) ( not ( = ?auto_207540 ?auto_207539 ) ) ( not ( = ?auto_207542 ?auto_207539 ) ) ( ON ?auto_207535 ?auto_207534 ) ( ON-TABLE ?auto_207539 ) ( CLEAR ?auto_207537 ) ( ON ?auto_207536 ?auto_207535 ) ( CLEAR ?auto_207536 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_207539 ?auto_207534 ?auto_207535 )
      ( MAKE-5PILE ?auto_207534 ?auto_207535 ?auto_207536 ?auto_207537 ?auto_207538 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_207543 - BLOCK
      ?auto_207544 - BLOCK
      ?auto_207545 - BLOCK
      ?auto_207546 - BLOCK
      ?auto_207547 - BLOCK
    )
    :vars
    (
      ?auto_207550 - BLOCK
      ?auto_207549 - BLOCK
      ?auto_207551 - BLOCK
      ?auto_207548 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_207543 ?auto_207544 ) ) ( not ( = ?auto_207543 ?auto_207545 ) ) ( not ( = ?auto_207543 ?auto_207546 ) ) ( not ( = ?auto_207543 ?auto_207547 ) ) ( not ( = ?auto_207544 ?auto_207545 ) ) ( not ( = ?auto_207544 ?auto_207546 ) ) ( not ( = ?auto_207544 ?auto_207547 ) ) ( not ( = ?auto_207545 ?auto_207546 ) ) ( not ( = ?auto_207545 ?auto_207547 ) ) ( not ( = ?auto_207546 ?auto_207547 ) ) ( ON ?auto_207547 ?auto_207550 ) ( not ( = ?auto_207543 ?auto_207550 ) ) ( not ( = ?auto_207544 ?auto_207550 ) ) ( not ( = ?auto_207545 ?auto_207550 ) ) ( not ( = ?auto_207546 ?auto_207550 ) ) ( not ( = ?auto_207547 ?auto_207550 ) ) ( ON-TABLE ?auto_207549 ) ( ON ?auto_207551 ?auto_207549 ) ( ON ?auto_207550 ?auto_207551 ) ( not ( = ?auto_207549 ?auto_207551 ) ) ( not ( = ?auto_207549 ?auto_207550 ) ) ( not ( = ?auto_207549 ?auto_207547 ) ) ( not ( = ?auto_207549 ?auto_207546 ) ) ( not ( = ?auto_207551 ?auto_207550 ) ) ( not ( = ?auto_207551 ?auto_207547 ) ) ( not ( = ?auto_207551 ?auto_207546 ) ) ( not ( = ?auto_207543 ?auto_207549 ) ) ( not ( = ?auto_207543 ?auto_207551 ) ) ( not ( = ?auto_207544 ?auto_207549 ) ) ( not ( = ?auto_207544 ?auto_207551 ) ) ( not ( = ?auto_207545 ?auto_207549 ) ) ( not ( = ?auto_207545 ?auto_207551 ) ) ( ON ?auto_207543 ?auto_207548 ) ( not ( = ?auto_207543 ?auto_207548 ) ) ( not ( = ?auto_207544 ?auto_207548 ) ) ( not ( = ?auto_207545 ?auto_207548 ) ) ( not ( = ?auto_207546 ?auto_207548 ) ) ( not ( = ?auto_207547 ?auto_207548 ) ) ( not ( = ?auto_207550 ?auto_207548 ) ) ( not ( = ?auto_207549 ?auto_207548 ) ) ( not ( = ?auto_207551 ?auto_207548 ) ) ( ON ?auto_207544 ?auto_207543 ) ( ON-TABLE ?auto_207548 ) ( ON ?auto_207545 ?auto_207544 ) ( CLEAR ?auto_207545 ) ( HOLDING ?auto_207546 ) ( CLEAR ?auto_207547 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_207549 ?auto_207551 ?auto_207550 ?auto_207547 ?auto_207546 )
      ( MAKE-5PILE ?auto_207543 ?auto_207544 ?auto_207545 ?auto_207546 ?auto_207547 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_207552 - BLOCK
      ?auto_207553 - BLOCK
      ?auto_207554 - BLOCK
      ?auto_207555 - BLOCK
      ?auto_207556 - BLOCK
    )
    :vars
    (
      ?auto_207557 - BLOCK
      ?auto_207558 - BLOCK
      ?auto_207560 - BLOCK
      ?auto_207559 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_207552 ?auto_207553 ) ) ( not ( = ?auto_207552 ?auto_207554 ) ) ( not ( = ?auto_207552 ?auto_207555 ) ) ( not ( = ?auto_207552 ?auto_207556 ) ) ( not ( = ?auto_207553 ?auto_207554 ) ) ( not ( = ?auto_207553 ?auto_207555 ) ) ( not ( = ?auto_207553 ?auto_207556 ) ) ( not ( = ?auto_207554 ?auto_207555 ) ) ( not ( = ?auto_207554 ?auto_207556 ) ) ( not ( = ?auto_207555 ?auto_207556 ) ) ( ON ?auto_207556 ?auto_207557 ) ( not ( = ?auto_207552 ?auto_207557 ) ) ( not ( = ?auto_207553 ?auto_207557 ) ) ( not ( = ?auto_207554 ?auto_207557 ) ) ( not ( = ?auto_207555 ?auto_207557 ) ) ( not ( = ?auto_207556 ?auto_207557 ) ) ( ON-TABLE ?auto_207558 ) ( ON ?auto_207560 ?auto_207558 ) ( ON ?auto_207557 ?auto_207560 ) ( not ( = ?auto_207558 ?auto_207560 ) ) ( not ( = ?auto_207558 ?auto_207557 ) ) ( not ( = ?auto_207558 ?auto_207556 ) ) ( not ( = ?auto_207558 ?auto_207555 ) ) ( not ( = ?auto_207560 ?auto_207557 ) ) ( not ( = ?auto_207560 ?auto_207556 ) ) ( not ( = ?auto_207560 ?auto_207555 ) ) ( not ( = ?auto_207552 ?auto_207558 ) ) ( not ( = ?auto_207552 ?auto_207560 ) ) ( not ( = ?auto_207553 ?auto_207558 ) ) ( not ( = ?auto_207553 ?auto_207560 ) ) ( not ( = ?auto_207554 ?auto_207558 ) ) ( not ( = ?auto_207554 ?auto_207560 ) ) ( ON ?auto_207552 ?auto_207559 ) ( not ( = ?auto_207552 ?auto_207559 ) ) ( not ( = ?auto_207553 ?auto_207559 ) ) ( not ( = ?auto_207554 ?auto_207559 ) ) ( not ( = ?auto_207555 ?auto_207559 ) ) ( not ( = ?auto_207556 ?auto_207559 ) ) ( not ( = ?auto_207557 ?auto_207559 ) ) ( not ( = ?auto_207558 ?auto_207559 ) ) ( not ( = ?auto_207560 ?auto_207559 ) ) ( ON ?auto_207553 ?auto_207552 ) ( ON-TABLE ?auto_207559 ) ( ON ?auto_207554 ?auto_207553 ) ( CLEAR ?auto_207556 ) ( ON ?auto_207555 ?auto_207554 ) ( CLEAR ?auto_207555 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_207559 ?auto_207552 ?auto_207553 ?auto_207554 )
      ( MAKE-5PILE ?auto_207552 ?auto_207553 ?auto_207554 ?auto_207555 ?auto_207556 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_207561 - BLOCK
      ?auto_207562 - BLOCK
      ?auto_207563 - BLOCK
      ?auto_207564 - BLOCK
      ?auto_207565 - BLOCK
    )
    :vars
    (
      ?auto_207566 - BLOCK
      ?auto_207569 - BLOCK
      ?auto_207567 - BLOCK
      ?auto_207568 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_207561 ?auto_207562 ) ) ( not ( = ?auto_207561 ?auto_207563 ) ) ( not ( = ?auto_207561 ?auto_207564 ) ) ( not ( = ?auto_207561 ?auto_207565 ) ) ( not ( = ?auto_207562 ?auto_207563 ) ) ( not ( = ?auto_207562 ?auto_207564 ) ) ( not ( = ?auto_207562 ?auto_207565 ) ) ( not ( = ?auto_207563 ?auto_207564 ) ) ( not ( = ?auto_207563 ?auto_207565 ) ) ( not ( = ?auto_207564 ?auto_207565 ) ) ( not ( = ?auto_207561 ?auto_207566 ) ) ( not ( = ?auto_207562 ?auto_207566 ) ) ( not ( = ?auto_207563 ?auto_207566 ) ) ( not ( = ?auto_207564 ?auto_207566 ) ) ( not ( = ?auto_207565 ?auto_207566 ) ) ( ON-TABLE ?auto_207569 ) ( ON ?auto_207567 ?auto_207569 ) ( ON ?auto_207566 ?auto_207567 ) ( not ( = ?auto_207569 ?auto_207567 ) ) ( not ( = ?auto_207569 ?auto_207566 ) ) ( not ( = ?auto_207569 ?auto_207565 ) ) ( not ( = ?auto_207569 ?auto_207564 ) ) ( not ( = ?auto_207567 ?auto_207566 ) ) ( not ( = ?auto_207567 ?auto_207565 ) ) ( not ( = ?auto_207567 ?auto_207564 ) ) ( not ( = ?auto_207561 ?auto_207569 ) ) ( not ( = ?auto_207561 ?auto_207567 ) ) ( not ( = ?auto_207562 ?auto_207569 ) ) ( not ( = ?auto_207562 ?auto_207567 ) ) ( not ( = ?auto_207563 ?auto_207569 ) ) ( not ( = ?auto_207563 ?auto_207567 ) ) ( ON ?auto_207561 ?auto_207568 ) ( not ( = ?auto_207561 ?auto_207568 ) ) ( not ( = ?auto_207562 ?auto_207568 ) ) ( not ( = ?auto_207563 ?auto_207568 ) ) ( not ( = ?auto_207564 ?auto_207568 ) ) ( not ( = ?auto_207565 ?auto_207568 ) ) ( not ( = ?auto_207566 ?auto_207568 ) ) ( not ( = ?auto_207569 ?auto_207568 ) ) ( not ( = ?auto_207567 ?auto_207568 ) ) ( ON ?auto_207562 ?auto_207561 ) ( ON-TABLE ?auto_207568 ) ( ON ?auto_207563 ?auto_207562 ) ( ON ?auto_207564 ?auto_207563 ) ( CLEAR ?auto_207564 ) ( HOLDING ?auto_207565 ) ( CLEAR ?auto_207566 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_207569 ?auto_207567 ?auto_207566 ?auto_207565 )
      ( MAKE-5PILE ?auto_207561 ?auto_207562 ?auto_207563 ?auto_207564 ?auto_207565 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_207570 - BLOCK
      ?auto_207571 - BLOCK
      ?auto_207572 - BLOCK
      ?auto_207573 - BLOCK
      ?auto_207574 - BLOCK
    )
    :vars
    (
      ?auto_207576 - BLOCK
      ?auto_207575 - BLOCK
      ?auto_207578 - BLOCK
      ?auto_207577 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_207570 ?auto_207571 ) ) ( not ( = ?auto_207570 ?auto_207572 ) ) ( not ( = ?auto_207570 ?auto_207573 ) ) ( not ( = ?auto_207570 ?auto_207574 ) ) ( not ( = ?auto_207571 ?auto_207572 ) ) ( not ( = ?auto_207571 ?auto_207573 ) ) ( not ( = ?auto_207571 ?auto_207574 ) ) ( not ( = ?auto_207572 ?auto_207573 ) ) ( not ( = ?auto_207572 ?auto_207574 ) ) ( not ( = ?auto_207573 ?auto_207574 ) ) ( not ( = ?auto_207570 ?auto_207576 ) ) ( not ( = ?auto_207571 ?auto_207576 ) ) ( not ( = ?auto_207572 ?auto_207576 ) ) ( not ( = ?auto_207573 ?auto_207576 ) ) ( not ( = ?auto_207574 ?auto_207576 ) ) ( ON-TABLE ?auto_207575 ) ( ON ?auto_207578 ?auto_207575 ) ( ON ?auto_207576 ?auto_207578 ) ( not ( = ?auto_207575 ?auto_207578 ) ) ( not ( = ?auto_207575 ?auto_207576 ) ) ( not ( = ?auto_207575 ?auto_207574 ) ) ( not ( = ?auto_207575 ?auto_207573 ) ) ( not ( = ?auto_207578 ?auto_207576 ) ) ( not ( = ?auto_207578 ?auto_207574 ) ) ( not ( = ?auto_207578 ?auto_207573 ) ) ( not ( = ?auto_207570 ?auto_207575 ) ) ( not ( = ?auto_207570 ?auto_207578 ) ) ( not ( = ?auto_207571 ?auto_207575 ) ) ( not ( = ?auto_207571 ?auto_207578 ) ) ( not ( = ?auto_207572 ?auto_207575 ) ) ( not ( = ?auto_207572 ?auto_207578 ) ) ( ON ?auto_207570 ?auto_207577 ) ( not ( = ?auto_207570 ?auto_207577 ) ) ( not ( = ?auto_207571 ?auto_207577 ) ) ( not ( = ?auto_207572 ?auto_207577 ) ) ( not ( = ?auto_207573 ?auto_207577 ) ) ( not ( = ?auto_207574 ?auto_207577 ) ) ( not ( = ?auto_207576 ?auto_207577 ) ) ( not ( = ?auto_207575 ?auto_207577 ) ) ( not ( = ?auto_207578 ?auto_207577 ) ) ( ON ?auto_207571 ?auto_207570 ) ( ON-TABLE ?auto_207577 ) ( ON ?auto_207572 ?auto_207571 ) ( ON ?auto_207573 ?auto_207572 ) ( CLEAR ?auto_207576 ) ( ON ?auto_207574 ?auto_207573 ) ( CLEAR ?auto_207574 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_207577 ?auto_207570 ?auto_207571 ?auto_207572 ?auto_207573 )
      ( MAKE-5PILE ?auto_207570 ?auto_207571 ?auto_207572 ?auto_207573 ?auto_207574 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_207579 - BLOCK
      ?auto_207580 - BLOCK
      ?auto_207581 - BLOCK
      ?auto_207582 - BLOCK
      ?auto_207583 - BLOCK
    )
    :vars
    (
      ?auto_207585 - BLOCK
      ?auto_207584 - BLOCK
      ?auto_207586 - BLOCK
      ?auto_207587 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_207579 ?auto_207580 ) ) ( not ( = ?auto_207579 ?auto_207581 ) ) ( not ( = ?auto_207579 ?auto_207582 ) ) ( not ( = ?auto_207579 ?auto_207583 ) ) ( not ( = ?auto_207580 ?auto_207581 ) ) ( not ( = ?auto_207580 ?auto_207582 ) ) ( not ( = ?auto_207580 ?auto_207583 ) ) ( not ( = ?auto_207581 ?auto_207582 ) ) ( not ( = ?auto_207581 ?auto_207583 ) ) ( not ( = ?auto_207582 ?auto_207583 ) ) ( not ( = ?auto_207579 ?auto_207585 ) ) ( not ( = ?auto_207580 ?auto_207585 ) ) ( not ( = ?auto_207581 ?auto_207585 ) ) ( not ( = ?auto_207582 ?auto_207585 ) ) ( not ( = ?auto_207583 ?auto_207585 ) ) ( ON-TABLE ?auto_207584 ) ( ON ?auto_207586 ?auto_207584 ) ( not ( = ?auto_207584 ?auto_207586 ) ) ( not ( = ?auto_207584 ?auto_207585 ) ) ( not ( = ?auto_207584 ?auto_207583 ) ) ( not ( = ?auto_207584 ?auto_207582 ) ) ( not ( = ?auto_207586 ?auto_207585 ) ) ( not ( = ?auto_207586 ?auto_207583 ) ) ( not ( = ?auto_207586 ?auto_207582 ) ) ( not ( = ?auto_207579 ?auto_207584 ) ) ( not ( = ?auto_207579 ?auto_207586 ) ) ( not ( = ?auto_207580 ?auto_207584 ) ) ( not ( = ?auto_207580 ?auto_207586 ) ) ( not ( = ?auto_207581 ?auto_207584 ) ) ( not ( = ?auto_207581 ?auto_207586 ) ) ( ON ?auto_207579 ?auto_207587 ) ( not ( = ?auto_207579 ?auto_207587 ) ) ( not ( = ?auto_207580 ?auto_207587 ) ) ( not ( = ?auto_207581 ?auto_207587 ) ) ( not ( = ?auto_207582 ?auto_207587 ) ) ( not ( = ?auto_207583 ?auto_207587 ) ) ( not ( = ?auto_207585 ?auto_207587 ) ) ( not ( = ?auto_207584 ?auto_207587 ) ) ( not ( = ?auto_207586 ?auto_207587 ) ) ( ON ?auto_207580 ?auto_207579 ) ( ON-TABLE ?auto_207587 ) ( ON ?auto_207581 ?auto_207580 ) ( ON ?auto_207582 ?auto_207581 ) ( ON ?auto_207583 ?auto_207582 ) ( CLEAR ?auto_207583 ) ( HOLDING ?auto_207585 ) ( CLEAR ?auto_207586 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_207584 ?auto_207586 ?auto_207585 )
      ( MAKE-5PILE ?auto_207579 ?auto_207580 ?auto_207581 ?auto_207582 ?auto_207583 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_207588 - BLOCK
      ?auto_207589 - BLOCK
      ?auto_207590 - BLOCK
      ?auto_207591 - BLOCK
      ?auto_207592 - BLOCK
    )
    :vars
    (
      ?auto_207594 - BLOCK
      ?auto_207595 - BLOCK
      ?auto_207593 - BLOCK
      ?auto_207596 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_207588 ?auto_207589 ) ) ( not ( = ?auto_207588 ?auto_207590 ) ) ( not ( = ?auto_207588 ?auto_207591 ) ) ( not ( = ?auto_207588 ?auto_207592 ) ) ( not ( = ?auto_207589 ?auto_207590 ) ) ( not ( = ?auto_207589 ?auto_207591 ) ) ( not ( = ?auto_207589 ?auto_207592 ) ) ( not ( = ?auto_207590 ?auto_207591 ) ) ( not ( = ?auto_207590 ?auto_207592 ) ) ( not ( = ?auto_207591 ?auto_207592 ) ) ( not ( = ?auto_207588 ?auto_207594 ) ) ( not ( = ?auto_207589 ?auto_207594 ) ) ( not ( = ?auto_207590 ?auto_207594 ) ) ( not ( = ?auto_207591 ?auto_207594 ) ) ( not ( = ?auto_207592 ?auto_207594 ) ) ( ON-TABLE ?auto_207595 ) ( ON ?auto_207593 ?auto_207595 ) ( not ( = ?auto_207595 ?auto_207593 ) ) ( not ( = ?auto_207595 ?auto_207594 ) ) ( not ( = ?auto_207595 ?auto_207592 ) ) ( not ( = ?auto_207595 ?auto_207591 ) ) ( not ( = ?auto_207593 ?auto_207594 ) ) ( not ( = ?auto_207593 ?auto_207592 ) ) ( not ( = ?auto_207593 ?auto_207591 ) ) ( not ( = ?auto_207588 ?auto_207595 ) ) ( not ( = ?auto_207588 ?auto_207593 ) ) ( not ( = ?auto_207589 ?auto_207595 ) ) ( not ( = ?auto_207589 ?auto_207593 ) ) ( not ( = ?auto_207590 ?auto_207595 ) ) ( not ( = ?auto_207590 ?auto_207593 ) ) ( ON ?auto_207588 ?auto_207596 ) ( not ( = ?auto_207588 ?auto_207596 ) ) ( not ( = ?auto_207589 ?auto_207596 ) ) ( not ( = ?auto_207590 ?auto_207596 ) ) ( not ( = ?auto_207591 ?auto_207596 ) ) ( not ( = ?auto_207592 ?auto_207596 ) ) ( not ( = ?auto_207594 ?auto_207596 ) ) ( not ( = ?auto_207595 ?auto_207596 ) ) ( not ( = ?auto_207593 ?auto_207596 ) ) ( ON ?auto_207589 ?auto_207588 ) ( ON-TABLE ?auto_207596 ) ( ON ?auto_207590 ?auto_207589 ) ( ON ?auto_207591 ?auto_207590 ) ( ON ?auto_207592 ?auto_207591 ) ( CLEAR ?auto_207593 ) ( ON ?auto_207594 ?auto_207592 ) ( CLEAR ?auto_207594 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_207596 ?auto_207588 ?auto_207589 ?auto_207590 ?auto_207591 ?auto_207592 )
      ( MAKE-5PILE ?auto_207588 ?auto_207589 ?auto_207590 ?auto_207591 ?auto_207592 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_207597 - BLOCK
      ?auto_207598 - BLOCK
      ?auto_207599 - BLOCK
      ?auto_207600 - BLOCK
      ?auto_207601 - BLOCK
    )
    :vars
    (
      ?auto_207605 - BLOCK
      ?auto_207602 - BLOCK
      ?auto_207604 - BLOCK
      ?auto_207603 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_207597 ?auto_207598 ) ) ( not ( = ?auto_207597 ?auto_207599 ) ) ( not ( = ?auto_207597 ?auto_207600 ) ) ( not ( = ?auto_207597 ?auto_207601 ) ) ( not ( = ?auto_207598 ?auto_207599 ) ) ( not ( = ?auto_207598 ?auto_207600 ) ) ( not ( = ?auto_207598 ?auto_207601 ) ) ( not ( = ?auto_207599 ?auto_207600 ) ) ( not ( = ?auto_207599 ?auto_207601 ) ) ( not ( = ?auto_207600 ?auto_207601 ) ) ( not ( = ?auto_207597 ?auto_207605 ) ) ( not ( = ?auto_207598 ?auto_207605 ) ) ( not ( = ?auto_207599 ?auto_207605 ) ) ( not ( = ?auto_207600 ?auto_207605 ) ) ( not ( = ?auto_207601 ?auto_207605 ) ) ( ON-TABLE ?auto_207602 ) ( not ( = ?auto_207602 ?auto_207604 ) ) ( not ( = ?auto_207602 ?auto_207605 ) ) ( not ( = ?auto_207602 ?auto_207601 ) ) ( not ( = ?auto_207602 ?auto_207600 ) ) ( not ( = ?auto_207604 ?auto_207605 ) ) ( not ( = ?auto_207604 ?auto_207601 ) ) ( not ( = ?auto_207604 ?auto_207600 ) ) ( not ( = ?auto_207597 ?auto_207602 ) ) ( not ( = ?auto_207597 ?auto_207604 ) ) ( not ( = ?auto_207598 ?auto_207602 ) ) ( not ( = ?auto_207598 ?auto_207604 ) ) ( not ( = ?auto_207599 ?auto_207602 ) ) ( not ( = ?auto_207599 ?auto_207604 ) ) ( ON ?auto_207597 ?auto_207603 ) ( not ( = ?auto_207597 ?auto_207603 ) ) ( not ( = ?auto_207598 ?auto_207603 ) ) ( not ( = ?auto_207599 ?auto_207603 ) ) ( not ( = ?auto_207600 ?auto_207603 ) ) ( not ( = ?auto_207601 ?auto_207603 ) ) ( not ( = ?auto_207605 ?auto_207603 ) ) ( not ( = ?auto_207602 ?auto_207603 ) ) ( not ( = ?auto_207604 ?auto_207603 ) ) ( ON ?auto_207598 ?auto_207597 ) ( ON-TABLE ?auto_207603 ) ( ON ?auto_207599 ?auto_207598 ) ( ON ?auto_207600 ?auto_207599 ) ( ON ?auto_207601 ?auto_207600 ) ( ON ?auto_207605 ?auto_207601 ) ( CLEAR ?auto_207605 ) ( HOLDING ?auto_207604 ) ( CLEAR ?auto_207602 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_207602 ?auto_207604 )
      ( MAKE-5PILE ?auto_207597 ?auto_207598 ?auto_207599 ?auto_207600 ?auto_207601 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_207606 - BLOCK
      ?auto_207607 - BLOCK
      ?auto_207608 - BLOCK
      ?auto_207609 - BLOCK
      ?auto_207610 - BLOCK
    )
    :vars
    (
      ?auto_207613 - BLOCK
      ?auto_207612 - BLOCK
      ?auto_207611 - BLOCK
      ?auto_207614 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_207606 ?auto_207607 ) ) ( not ( = ?auto_207606 ?auto_207608 ) ) ( not ( = ?auto_207606 ?auto_207609 ) ) ( not ( = ?auto_207606 ?auto_207610 ) ) ( not ( = ?auto_207607 ?auto_207608 ) ) ( not ( = ?auto_207607 ?auto_207609 ) ) ( not ( = ?auto_207607 ?auto_207610 ) ) ( not ( = ?auto_207608 ?auto_207609 ) ) ( not ( = ?auto_207608 ?auto_207610 ) ) ( not ( = ?auto_207609 ?auto_207610 ) ) ( not ( = ?auto_207606 ?auto_207613 ) ) ( not ( = ?auto_207607 ?auto_207613 ) ) ( not ( = ?auto_207608 ?auto_207613 ) ) ( not ( = ?auto_207609 ?auto_207613 ) ) ( not ( = ?auto_207610 ?auto_207613 ) ) ( ON-TABLE ?auto_207612 ) ( not ( = ?auto_207612 ?auto_207611 ) ) ( not ( = ?auto_207612 ?auto_207613 ) ) ( not ( = ?auto_207612 ?auto_207610 ) ) ( not ( = ?auto_207612 ?auto_207609 ) ) ( not ( = ?auto_207611 ?auto_207613 ) ) ( not ( = ?auto_207611 ?auto_207610 ) ) ( not ( = ?auto_207611 ?auto_207609 ) ) ( not ( = ?auto_207606 ?auto_207612 ) ) ( not ( = ?auto_207606 ?auto_207611 ) ) ( not ( = ?auto_207607 ?auto_207612 ) ) ( not ( = ?auto_207607 ?auto_207611 ) ) ( not ( = ?auto_207608 ?auto_207612 ) ) ( not ( = ?auto_207608 ?auto_207611 ) ) ( ON ?auto_207606 ?auto_207614 ) ( not ( = ?auto_207606 ?auto_207614 ) ) ( not ( = ?auto_207607 ?auto_207614 ) ) ( not ( = ?auto_207608 ?auto_207614 ) ) ( not ( = ?auto_207609 ?auto_207614 ) ) ( not ( = ?auto_207610 ?auto_207614 ) ) ( not ( = ?auto_207613 ?auto_207614 ) ) ( not ( = ?auto_207612 ?auto_207614 ) ) ( not ( = ?auto_207611 ?auto_207614 ) ) ( ON ?auto_207607 ?auto_207606 ) ( ON-TABLE ?auto_207614 ) ( ON ?auto_207608 ?auto_207607 ) ( ON ?auto_207609 ?auto_207608 ) ( ON ?auto_207610 ?auto_207609 ) ( ON ?auto_207613 ?auto_207610 ) ( CLEAR ?auto_207612 ) ( ON ?auto_207611 ?auto_207613 ) ( CLEAR ?auto_207611 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_207614 ?auto_207606 ?auto_207607 ?auto_207608 ?auto_207609 ?auto_207610 ?auto_207613 )
      ( MAKE-5PILE ?auto_207606 ?auto_207607 ?auto_207608 ?auto_207609 ?auto_207610 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_207615 - BLOCK
      ?auto_207616 - BLOCK
      ?auto_207617 - BLOCK
      ?auto_207618 - BLOCK
      ?auto_207619 - BLOCK
    )
    :vars
    (
      ?auto_207621 - BLOCK
      ?auto_207623 - BLOCK
      ?auto_207622 - BLOCK
      ?auto_207620 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_207615 ?auto_207616 ) ) ( not ( = ?auto_207615 ?auto_207617 ) ) ( not ( = ?auto_207615 ?auto_207618 ) ) ( not ( = ?auto_207615 ?auto_207619 ) ) ( not ( = ?auto_207616 ?auto_207617 ) ) ( not ( = ?auto_207616 ?auto_207618 ) ) ( not ( = ?auto_207616 ?auto_207619 ) ) ( not ( = ?auto_207617 ?auto_207618 ) ) ( not ( = ?auto_207617 ?auto_207619 ) ) ( not ( = ?auto_207618 ?auto_207619 ) ) ( not ( = ?auto_207615 ?auto_207621 ) ) ( not ( = ?auto_207616 ?auto_207621 ) ) ( not ( = ?auto_207617 ?auto_207621 ) ) ( not ( = ?auto_207618 ?auto_207621 ) ) ( not ( = ?auto_207619 ?auto_207621 ) ) ( not ( = ?auto_207623 ?auto_207622 ) ) ( not ( = ?auto_207623 ?auto_207621 ) ) ( not ( = ?auto_207623 ?auto_207619 ) ) ( not ( = ?auto_207623 ?auto_207618 ) ) ( not ( = ?auto_207622 ?auto_207621 ) ) ( not ( = ?auto_207622 ?auto_207619 ) ) ( not ( = ?auto_207622 ?auto_207618 ) ) ( not ( = ?auto_207615 ?auto_207623 ) ) ( not ( = ?auto_207615 ?auto_207622 ) ) ( not ( = ?auto_207616 ?auto_207623 ) ) ( not ( = ?auto_207616 ?auto_207622 ) ) ( not ( = ?auto_207617 ?auto_207623 ) ) ( not ( = ?auto_207617 ?auto_207622 ) ) ( ON ?auto_207615 ?auto_207620 ) ( not ( = ?auto_207615 ?auto_207620 ) ) ( not ( = ?auto_207616 ?auto_207620 ) ) ( not ( = ?auto_207617 ?auto_207620 ) ) ( not ( = ?auto_207618 ?auto_207620 ) ) ( not ( = ?auto_207619 ?auto_207620 ) ) ( not ( = ?auto_207621 ?auto_207620 ) ) ( not ( = ?auto_207623 ?auto_207620 ) ) ( not ( = ?auto_207622 ?auto_207620 ) ) ( ON ?auto_207616 ?auto_207615 ) ( ON-TABLE ?auto_207620 ) ( ON ?auto_207617 ?auto_207616 ) ( ON ?auto_207618 ?auto_207617 ) ( ON ?auto_207619 ?auto_207618 ) ( ON ?auto_207621 ?auto_207619 ) ( ON ?auto_207622 ?auto_207621 ) ( CLEAR ?auto_207622 ) ( HOLDING ?auto_207623 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_207623 )
      ( MAKE-5PILE ?auto_207615 ?auto_207616 ?auto_207617 ?auto_207618 ?auto_207619 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_207624 - BLOCK
      ?auto_207625 - BLOCK
      ?auto_207626 - BLOCK
      ?auto_207627 - BLOCK
      ?auto_207628 - BLOCK
    )
    :vars
    (
      ?auto_207632 - BLOCK
      ?auto_207629 - BLOCK
      ?auto_207631 - BLOCK
      ?auto_207630 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_207624 ?auto_207625 ) ) ( not ( = ?auto_207624 ?auto_207626 ) ) ( not ( = ?auto_207624 ?auto_207627 ) ) ( not ( = ?auto_207624 ?auto_207628 ) ) ( not ( = ?auto_207625 ?auto_207626 ) ) ( not ( = ?auto_207625 ?auto_207627 ) ) ( not ( = ?auto_207625 ?auto_207628 ) ) ( not ( = ?auto_207626 ?auto_207627 ) ) ( not ( = ?auto_207626 ?auto_207628 ) ) ( not ( = ?auto_207627 ?auto_207628 ) ) ( not ( = ?auto_207624 ?auto_207632 ) ) ( not ( = ?auto_207625 ?auto_207632 ) ) ( not ( = ?auto_207626 ?auto_207632 ) ) ( not ( = ?auto_207627 ?auto_207632 ) ) ( not ( = ?auto_207628 ?auto_207632 ) ) ( not ( = ?auto_207629 ?auto_207631 ) ) ( not ( = ?auto_207629 ?auto_207632 ) ) ( not ( = ?auto_207629 ?auto_207628 ) ) ( not ( = ?auto_207629 ?auto_207627 ) ) ( not ( = ?auto_207631 ?auto_207632 ) ) ( not ( = ?auto_207631 ?auto_207628 ) ) ( not ( = ?auto_207631 ?auto_207627 ) ) ( not ( = ?auto_207624 ?auto_207629 ) ) ( not ( = ?auto_207624 ?auto_207631 ) ) ( not ( = ?auto_207625 ?auto_207629 ) ) ( not ( = ?auto_207625 ?auto_207631 ) ) ( not ( = ?auto_207626 ?auto_207629 ) ) ( not ( = ?auto_207626 ?auto_207631 ) ) ( ON ?auto_207624 ?auto_207630 ) ( not ( = ?auto_207624 ?auto_207630 ) ) ( not ( = ?auto_207625 ?auto_207630 ) ) ( not ( = ?auto_207626 ?auto_207630 ) ) ( not ( = ?auto_207627 ?auto_207630 ) ) ( not ( = ?auto_207628 ?auto_207630 ) ) ( not ( = ?auto_207632 ?auto_207630 ) ) ( not ( = ?auto_207629 ?auto_207630 ) ) ( not ( = ?auto_207631 ?auto_207630 ) ) ( ON ?auto_207625 ?auto_207624 ) ( ON-TABLE ?auto_207630 ) ( ON ?auto_207626 ?auto_207625 ) ( ON ?auto_207627 ?auto_207626 ) ( ON ?auto_207628 ?auto_207627 ) ( ON ?auto_207632 ?auto_207628 ) ( ON ?auto_207631 ?auto_207632 ) ( ON ?auto_207629 ?auto_207631 ) ( CLEAR ?auto_207629 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_207630 ?auto_207624 ?auto_207625 ?auto_207626 ?auto_207627 ?auto_207628 ?auto_207632 ?auto_207631 )
      ( MAKE-5PILE ?auto_207624 ?auto_207625 ?auto_207626 ?auto_207627 ?auto_207628 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_207635 - BLOCK
      ?auto_207636 - BLOCK
    )
    :vars
    (
      ?auto_207637 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207637 ?auto_207636 ) ( CLEAR ?auto_207637 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_207635 ) ( ON ?auto_207636 ?auto_207635 ) ( not ( = ?auto_207635 ?auto_207636 ) ) ( not ( = ?auto_207635 ?auto_207637 ) ) ( not ( = ?auto_207636 ?auto_207637 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_207637 ?auto_207636 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_207638 - BLOCK
      ?auto_207639 - BLOCK
    )
    :vars
    (
      ?auto_207640 - BLOCK
      ?auto_207641 - BLOCK
      ?auto_207642 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207640 ?auto_207639 ) ( CLEAR ?auto_207640 ) ( ON-TABLE ?auto_207638 ) ( ON ?auto_207639 ?auto_207638 ) ( not ( = ?auto_207638 ?auto_207639 ) ) ( not ( = ?auto_207638 ?auto_207640 ) ) ( not ( = ?auto_207639 ?auto_207640 ) ) ( HOLDING ?auto_207641 ) ( CLEAR ?auto_207642 ) ( not ( = ?auto_207638 ?auto_207641 ) ) ( not ( = ?auto_207638 ?auto_207642 ) ) ( not ( = ?auto_207639 ?auto_207641 ) ) ( not ( = ?auto_207639 ?auto_207642 ) ) ( not ( = ?auto_207640 ?auto_207641 ) ) ( not ( = ?auto_207640 ?auto_207642 ) ) ( not ( = ?auto_207641 ?auto_207642 ) ) )
    :subtasks
    ( ( !STACK ?auto_207641 ?auto_207642 )
      ( MAKE-2PILE ?auto_207638 ?auto_207639 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_207643 - BLOCK
      ?auto_207644 - BLOCK
    )
    :vars
    (
      ?auto_207646 - BLOCK
      ?auto_207647 - BLOCK
      ?auto_207645 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207646 ?auto_207644 ) ( ON-TABLE ?auto_207643 ) ( ON ?auto_207644 ?auto_207643 ) ( not ( = ?auto_207643 ?auto_207644 ) ) ( not ( = ?auto_207643 ?auto_207646 ) ) ( not ( = ?auto_207644 ?auto_207646 ) ) ( CLEAR ?auto_207647 ) ( not ( = ?auto_207643 ?auto_207645 ) ) ( not ( = ?auto_207643 ?auto_207647 ) ) ( not ( = ?auto_207644 ?auto_207645 ) ) ( not ( = ?auto_207644 ?auto_207647 ) ) ( not ( = ?auto_207646 ?auto_207645 ) ) ( not ( = ?auto_207646 ?auto_207647 ) ) ( not ( = ?auto_207645 ?auto_207647 ) ) ( ON ?auto_207645 ?auto_207646 ) ( CLEAR ?auto_207645 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_207643 ?auto_207644 ?auto_207646 )
      ( MAKE-2PILE ?auto_207643 ?auto_207644 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_207648 - BLOCK
      ?auto_207649 - BLOCK
    )
    :vars
    (
      ?auto_207651 - BLOCK
      ?auto_207652 - BLOCK
      ?auto_207650 - BLOCK
      ?auto_207654 - BLOCK
      ?auto_207653 - BLOCK
      ?auto_207655 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207651 ?auto_207649 ) ( ON-TABLE ?auto_207648 ) ( ON ?auto_207649 ?auto_207648 ) ( not ( = ?auto_207648 ?auto_207649 ) ) ( not ( = ?auto_207648 ?auto_207651 ) ) ( not ( = ?auto_207649 ?auto_207651 ) ) ( not ( = ?auto_207648 ?auto_207652 ) ) ( not ( = ?auto_207648 ?auto_207650 ) ) ( not ( = ?auto_207649 ?auto_207652 ) ) ( not ( = ?auto_207649 ?auto_207650 ) ) ( not ( = ?auto_207651 ?auto_207652 ) ) ( not ( = ?auto_207651 ?auto_207650 ) ) ( not ( = ?auto_207652 ?auto_207650 ) ) ( ON ?auto_207652 ?auto_207651 ) ( CLEAR ?auto_207652 ) ( HOLDING ?auto_207650 ) ( CLEAR ?auto_207654 ) ( ON-TABLE ?auto_207653 ) ( ON ?auto_207655 ?auto_207653 ) ( ON ?auto_207654 ?auto_207655 ) ( not ( = ?auto_207653 ?auto_207655 ) ) ( not ( = ?auto_207653 ?auto_207654 ) ) ( not ( = ?auto_207653 ?auto_207650 ) ) ( not ( = ?auto_207655 ?auto_207654 ) ) ( not ( = ?auto_207655 ?auto_207650 ) ) ( not ( = ?auto_207654 ?auto_207650 ) ) ( not ( = ?auto_207648 ?auto_207654 ) ) ( not ( = ?auto_207648 ?auto_207653 ) ) ( not ( = ?auto_207648 ?auto_207655 ) ) ( not ( = ?auto_207649 ?auto_207654 ) ) ( not ( = ?auto_207649 ?auto_207653 ) ) ( not ( = ?auto_207649 ?auto_207655 ) ) ( not ( = ?auto_207651 ?auto_207654 ) ) ( not ( = ?auto_207651 ?auto_207653 ) ) ( not ( = ?auto_207651 ?auto_207655 ) ) ( not ( = ?auto_207652 ?auto_207654 ) ) ( not ( = ?auto_207652 ?auto_207653 ) ) ( not ( = ?auto_207652 ?auto_207655 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_207653 ?auto_207655 ?auto_207654 ?auto_207650 )
      ( MAKE-2PILE ?auto_207648 ?auto_207649 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_207656 - BLOCK
      ?auto_207657 - BLOCK
    )
    :vars
    (
      ?auto_207661 - BLOCK
      ?auto_207663 - BLOCK
      ?auto_207662 - BLOCK
      ?auto_207659 - BLOCK
      ?auto_207658 - BLOCK
      ?auto_207660 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207661 ?auto_207657 ) ( ON-TABLE ?auto_207656 ) ( ON ?auto_207657 ?auto_207656 ) ( not ( = ?auto_207656 ?auto_207657 ) ) ( not ( = ?auto_207656 ?auto_207661 ) ) ( not ( = ?auto_207657 ?auto_207661 ) ) ( not ( = ?auto_207656 ?auto_207663 ) ) ( not ( = ?auto_207656 ?auto_207662 ) ) ( not ( = ?auto_207657 ?auto_207663 ) ) ( not ( = ?auto_207657 ?auto_207662 ) ) ( not ( = ?auto_207661 ?auto_207663 ) ) ( not ( = ?auto_207661 ?auto_207662 ) ) ( not ( = ?auto_207663 ?auto_207662 ) ) ( ON ?auto_207663 ?auto_207661 ) ( CLEAR ?auto_207659 ) ( ON-TABLE ?auto_207658 ) ( ON ?auto_207660 ?auto_207658 ) ( ON ?auto_207659 ?auto_207660 ) ( not ( = ?auto_207658 ?auto_207660 ) ) ( not ( = ?auto_207658 ?auto_207659 ) ) ( not ( = ?auto_207658 ?auto_207662 ) ) ( not ( = ?auto_207660 ?auto_207659 ) ) ( not ( = ?auto_207660 ?auto_207662 ) ) ( not ( = ?auto_207659 ?auto_207662 ) ) ( not ( = ?auto_207656 ?auto_207659 ) ) ( not ( = ?auto_207656 ?auto_207658 ) ) ( not ( = ?auto_207656 ?auto_207660 ) ) ( not ( = ?auto_207657 ?auto_207659 ) ) ( not ( = ?auto_207657 ?auto_207658 ) ) ( not ( = ?auto_207657 ?auto_207660 ) ) ( not ( = ?auto_207661 ?auto_207659 ) ) ( not ( = ?auto_207661 ?auto_207658 ) ) ( not ( = ?auto_207661 ?auto_207660 ) ) ( not ( = ?auto_207663 ?auto_207659 ) ) ( not ( = ?auto_207663 ?auto_207658 ) ) ( not ( = ?auto_207663 ?auto_207660 ) ) ( ON ?auto_207662 ?auto_207663 ) ( CLEAR ?auto_207662 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_207656 ?auto_207657 ?auto_207661 ?auto_207663 )
      ( MAKE-2PILE ?auto_207656 ?auto_207657 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_207664 - BLOCK
      ?auto_207665 - BLOCK
    )
    :vars
    (
      ?auto_207670 - BLOCK
      ?auto_207671 - BLOCK
      ?auto_207667 - BLOCK
      ?auto_207669 - BLOCK
      ?auto_207666 - BLOCK
      ?auto_207668 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207670 ?auto_207665 ) ( ON-TABLE ?auto_207664 ) ( ON ?auto_207665 ?auto_207664 ) ( not ( = ?auto_207664 ?auto_207665 ) ) ( not ( = ?auto_207664 ?auto_207670 ) ) ( not ( = ?auto_207665 ?auto_207670 ) ) ( not ( = ?auto_207664 ?auto_207671 ) ) ( not ( = ?auto_207664 ?auto_207667 ) ) ( not ( = ?auto_207665 ?auto_207671 ) ) ( not ( = ?auto_207665 ?auto_207667 ) ) ( not ( = ?auto_207670 ?auto_207671 ) ) ( not ( = ?auto_207670 ?auto_207667 ) ) ( not ( = ?auto_207671 ?auto_207667 ) ) ( ON ?auto_207671 ?auto_207670 ) ( ON-TABLE ?auto_207669 ) ( ON ?auto_207666 ?auto_207669 ) ( not ( = ?auto_207669 ?auto_207666 ) ) ( not ( = ?auto_207669 ?auto_207668 ) ) ( not ( = ?auto_207669 ?auto_207667 ) ) ( not ( = ?auto_207666 ?auto_207668 ) ) ( not ( = ?auto_207666 ?auto_207667 ) ) ( not ( = ?auto_207668 ?auto_207667 ) ) ( not ( = ?auto_207664 ?auto_207668 ) ) ( not ( = ?auto_207664 ?auto_207669 ) ) ( not ( = ?auto_207664 ?auto_207666 ) ) ( not ( = ?auto_207665 ?auto_207668 ) ) ( not ( = ?auto_207665 ?auto_207669 ) ) ( not ( = ?auto_207665 ?auto_207666 ) ) ( not ( = ?auto_207670 ?auto_207668 ) ) ( not ( = ?auto_207670 ?auto_207669 ) ) ( not ( = ?auto_207670 ?auto_207666 ) ) ( not ( = ?auto_207671 ?auto_207668 ) ) ( not ( = ?auto_207671 ?auto_207669 ) ) ( not ( = ?auto_207671 ?auto_207666 ) ) ( ON ?auto_207667 ?auto_207671 ) ( CLEAR ?auto_207667 ) ( HOLDING ?auto_207668 ) ( CLEAR ?auto_207666 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_207669 ?auto_207666 ?auto_207668 )
      ( MAKE-2PILE ?auto_207664 ?auto_207665 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_207672 - BLOCK
      ?auto_207673 - BLOCK
    )
    :vars
    (
      ?auto_207679 - BLOCK
      ?auto_207674 - BLOCK
      ?auto_207677 - BLOCK
      ?auto_207675 - BLOCK
      ?auto_207678 - BLOCK
      ?auto_207676 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207679 ?auto_207673 ) ( ON-TABLE ?auto_207672 ) ( ON ?auto_207673 ?auto_207672 ) ( not ( = ?auto_207672 ?auto_207673 ) ) ( not ( = ?auto_207672 ?auto_207679 ) ) ( not ( = ?auto_207673 ?auto_207679 ) ) ( not ( = ?auto_207672 ?auto_207674 ) ) ( not ( = ?auto_207672 ?auto_207677 ) ) ( not ( = ?auto_207673 ?auto_207674 ) ) ( not ( = ?auto_207673 ?auto_207677 ) ) ( not ( = ?auto_207679 ?auto_207674 ) ) ( not ( = ?auto_207679 ?auto_207677 ) ) ( not ( = ?auto_207674 ?auto_207677 ) ) ( ON ?auto_207674 ?auto_207679 ) ( ON-TABLE ?auto_207675 ) ( ON ?auto_207678 ?auto_207675 ) ( not ( = ?auto_207675 ?auto_207678 ) ) ( not ( = ?auto_207675 ?auto_207676 ) ) ( not ( = ?auto_207675 ?auto_207677 ) ) ( not ( = ?auto_207678 ?auto_207676 ) ) ( not ( = ?auto_207678 ?auto_207677 ) ) ( not ( = ?auto_207676 ?auto_207677 ) ) ( not ( = ?auto_207672 ?auto_207676 ) ) ( not ( = ?auto_207672 ?auto_207675 ) ) ( not ( = ?auto_207672 ?auto_207678 ) ) ( not ( = ?auto_207673 ?auto_207676 ) ) ( not ( = ?auto_207673 ?auto_207675 ) ) ( not ( = ?auto_207673 ?auto_207678 ) ) ( not ( = ?auto_207679 ?auto_207676 ) ) ( not ( = ?auto_207679 ?auto_207675 ) ) ( not ( = ?auto_207679 ?auto_207678 ) ) ( not ( = ?auto_207674 ?auto_207676 ) ) ( not ( = ?auto_207674 ?auto_207675 ) ) ( not ( = ?auto_207674 ?auto_207678 ) ) ( ON ?auto_207677 ?auto_207674 ) ( CLEAR ?auto_207678 ) ( ON ?auto_207676 ?auto_207677 ) ( CLEAR ?auto_207676 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_207672 ?auto_207673 ?auto_207679 ?auto_207674 ?auto_207677 )
      ( MAKE-2PILE ?auto_207672 ?auto_207673 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_207680 - BLOCK
      ?auto_207681 - BLOCK
    )
    :vars
    (
      ?auto_207685 - BLOCK
      ?auto_207683 - BLOCK
      ?auto_207686 - BLOCK
      ?auto_207687 - BLOCK
      ?auto_207682 - BLOCK
      ?auto_207684 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207685 ?auto_207681 ) ( ON-TABLE ?auto_207680 ) ( ON ?auto_207681 ?auto_207680 ) ( not ( = ?auto_207680 ?auto_207681 ) ) ( not ( = ?auto_207680 ?auto_207685 ) ) ( not ( = ?auto_207681 ?auto_207685 ) ) ( not ( = ?auto_207680 ?auto_207683 ) ) ( not ( = ?auto_207680 ?auto_207686 ) ) ( not ( = ?auto_207681 ?auto_207683 ) ) ( not ( = ?auto_207681 ?auto_207686 ) ) ( not ( = ?auto_207685 ?auto_207683 ) ) ( not ( = ?auto_207685 ?auto_207686 ) ) ( not ( = ?auto_207683 ?auto_207686 ) ) ( ON ?auto_207683 ?auto_207685 ) ( ON-TABLE ?auto_207687 ) ( not ( = ?auto_207687 ?auto_207682 ) ) ( not ( = ?auto_207687 ?auto_207684 ) ) ( not ( = ?auto_207687 ?auto_207686 ) ) ( not ( = ?auto_207682 ?auto_207684 ) ) ( not ( = ?auto_207682 ?auto_207686 ) ) ( not ( = ?auto_207684 ?auto_207686 ) ) ( not ( = ?auto_207680 ?auto_207684 ) ) ( not ( = ?auto_207680 ?auto_207687 ) ) ( not ( = ?auto_207680 ?auto_207682 ) ) ( not ( = ?auto_207681 ?auto_207684 ) ) ( not ( = ?auto_207681 ?auto_207687 ) ) ( not ( = ?auto_207681 ?auto_207682 ) ) ( not ( = ?auto_207685 ?auto_207684 ) ) ( not ( = ?auto_207685 ?auto_207687 ) ) ( not ( = ?auto_207685 ?auto_207682 ) ) ( not ( = ?auto_207683 ?auto_207684 ) ) ( not ( = ?auto_207683 ?auto_207687 ) ) ( not ( = ?auto_207683 ?auto_207682 ) ) ( ON ?auto_207686 ?auto_207683 ) ( ON ?auto_207684 ?auto_207686 ) ( CLEAR ?auto_207684 ) ( HOLDING ?auto_207682 ) ( CLEAR ?auto_207687 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_207687 ?auto_207682 )
      ( MAKE-2PILE ?auto_207680 ?auto_207681 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_207688 - BLOCK
      ?auto_207689 - BLOCK
    )
    :vars
    (
      ?auto_207693 - BLOCK
      ?auto_207692 - BLOCK
      ?auto_207695 - BLOCK
      ?auto_207691 - BLOCK
      ?auto_207690 - BLOCK
      ?auto_207694 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207693 ?auto_207689 ) ( ON-TABLE ?auto_207688 ) ( ON ?auto_207689 ?auto_207688 ) ( not ( = ?auto_207688 ?auto_207689 ) ) ( not ( = ?auto_207688 ?auto_207693 ) ) ( not ( = ?auto_207689 ?auto_207693 ) ) ( not ( = ?auto_207688 ?auto_207692 ) ) ( not ( = ?auto_207688 ?auto_207695 ) ) ( not ( = ?auto_207689 ?auto_207692 ) ) ( not ( = ?auto_207689 ?auto_207695 ) ) ( not ( = ?auto_207693 ?auto_207692 ) ) ( not ( = ?auto_207693 ?auto_207695 ) ) ( not ( = ?auto_207692 ?auto_207695 ) ) ( ON ?auto_207692 ?auto_207693 ) ( ON-TABLE ?auto_207691 ) ( not ( = ?auto_207691 ?auto_207690 ) ) ( not ( = ?auto_207691 ?auto_207694 ) ) ( not ( = ?auto_207691 ?auto_207695 ) ) ( not ( = ?auto_207690 ?auto_207694 ) ) ( not ( = ?auto_207690 ?auto_207695 ) ) ( not ( = ?auto_207694 ?auto_207695 ) ) ( not ( = ?auto_207688 ?auto_207694 ) ) ( not ( = ?auto_207688 ?auto_207691 ) ) ( not ( = ?auto_207688 ?auto_207690 ) ) ( not ( = ?auto_207689 ?auto_207694 ) ) ( not ( = ?auto_207689 ?auto_207691 ) ) ( not ( = ?auto_207689 ?auto_207690 ) ) ( not ( = ?auto_207693 ?auto_207694 ) ) ( not ( = ?auto_207693 ?auto_207691 ) ) ( not ( = ?auto_207693 ?auto_207690 ) ) ( not ( = ?auto_207692 ?auto_207694 ) ) ( not ( = ?auto_207692 ?auto_207691 ) ) ( not ( = ?auto_207692 ?auto_207690 ) ) ( ON ?auto_207695 ?auto_207692 ) ( ON ?auto_207694 ?auto_207695 ) ( CLEAR ?auto_207691 ) ( ON ?auto_207690 ?auto_207694 ) ( CLEAR ?auto_207690 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_207688 ?auto_207689 ?auto_207693 ?auto_207692 ?auto_207695 ?auto_207694 )
      ( MAKE-2PILE ?auto_207688 ?auto_207689 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_207696 - BLOCK
      ?auto_207697 - BLOCK
    )
    :vars
    (
      ?auto_207701 - BLOCK
      ?auto_207702 - BLOCK
      ?auto_207698 - BLOCK
      ?auto_207700 - BLOCK
      ?auto_207699 - BLOCK
      ?auto_207703 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207701 ?auto_207697 ) ( ON-TABLE ?auto_207696 ) ( ON ?auto_207697 ?auto_207696 ) ( not ( = ?auto_207696 ?auto_207697 ) ) ( not ( = ?auto_207696 ?auto_207701 ) ) ( not ( = ?auto_207697 ?auto_207701 ) ) ( not ( = ?auto_207696 ?auto_207702 ) ) ( not ( = ?auto_207696 ?auto_207698 ) ) ( not ( = ?auto_207697 ?auto_207702 ) ) ( not ( = ?auto_207697 ?auto_207698 ) ) ( not ( = ?auto_207701 ?auto_207702 ) ) ( not ( = ?auto_207701 ?auto_207698 ) ) ( not ( = ?auto_207702 ?auto_207698 ) ) ( ON ?auto_207702 ?auto_207701 ) ( not ( = ?auto_207700 ?auto_207699 ) ) ( not ( = ?auto_207700 ?auto_207703 ) ) ( not ( = ?auto_207700 ?auto_207698 ) ) ( not ( = ?auto_207699 ?auto_207703 ) ) ( not ( = ?auto_207699 ?auto_207698 ) ) ( not ( = ?auto_207703 ?auto_207698 ) ) ( not ( = ?auto_207696 ?auto_207703 ) ) ( not ( = ?auto_207696 ?auto_207700 ) ) ( not ( = ?auto_207696 ?auto_207699 ) ) ( not ( = ?auto_207697 ?auto_207703 ) ) ( not ( = ?auto_207697 ?auto_207700 ) ) ( not ( = ?auto_207697 ?auto_207699 ) ) ( not ( = ?auto_207701 ?auto_207703 ) ) ( not ( = ?auto_207701 ?auto_207700 ) ) ( not ( = ?auto_207701 ?auto_207699 ) ) ( not ( = ?auto_207702 ?auto_207703 ) ) ( not ( = ?auto_207702 ?auto_207700 ) ) ( not ( = ?auto_207702 ?auto_207699 ) ) ( ON ?auto_207698 ?auto_207702 ) ( ON ?auto_207703 ?auto_207698 ) ( ON ?auto_207699 ?auto_207703 ) ( CLEAR ?auto_207699 ) ( HOLDING ?auto_207700 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_207700 )
      ( MAKE-2PILE ?auto_207696 ?auto_207697 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_207704 - BLOCK
      ?auto_207705 - BLOCK
    )
    :vars
    (
      ?auto_207706 - BLOCK
      ?auto_207710 - BLOCK
      ?auto_207709 - BLOCK
      ?auto_207707 - BLOCK
      ?auto_207708 - BLOCK
      ?auto_207711 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207706 ?auto_207705 ) ( ON-TABLE ?auto_207704 ) ( ON ?auto_207705 ?auto_207704 ) ( not ( = ?auto_207704 ?auto_207705 ) ) ( not ( = ?auto_207704 ?auto_207706 ) ) ( not ( = ?auto_207705 ?auto_207706 ) ) ( not ( = ?auto_207704 ?auto_207710 ) ) ( not ( = ?auto_207704 ?auto_207709 ) ) ( not ( = ?auto_207705 ?auto_207710 ) ) ( not ( = ?auto_207705 ?auto_207709 ) ) ( not ( = ?auto_207706 ?auto_207710 ) ) ( not ( = ?auto_207706 ?auto_207709 ) ) ( not ( = ?auto_207710 ?auto_207709 ) ) ( ON ?auto_207710 ?auto_207706 ) ( not ( = ?auto_207707 ?auto_207708 ) ) ( not ( = ?auto_207707 ?auto_207711 ) ) ( not ( = ?auto_207707 ?auto_207709 ) ) ( not ( = ?auto_207708 ?auto_207711 ) ) ( not ( = ?auto_207708 ?auto_207709 ) ) ( not ( = ?auto_207711 ?auto_207709 ) ) ( not ( = ?auto_207704 ?auto_207711 ) ) ( not ( = ?auto_207704 ?auto_207707 ) ) ( not ( = ?auto_207704 ?auto_207708 ) ) ( not ( = ?auto_207705 ?auto_207711 ) ) ( not ( = ?auto_207705 ?auto_207707 ) ) ( not ( = ?auto_207705 ?auto_207708 ) ) ( not ( = ?auto_207706 ?auto_207711 ) ) ( not ( = ?auto_207706 ?auto_207707 ) ) ( not ( = ?auto_207706 ?auto_207708 ) ) ( not ( = ?auto_207710 ?auto_207711 ) ) ( not ( = ?auto_207710 ?auto_207707 ) ) ( not ( = ?auto_207710 ?auto_207708 ) ) ( ON ?auto_207709 ?auto_207710 ) ( ON ?auto_207711 ?auto_207709 ) ( ON ?auto_207708 ?auto_207711 ) ( ON ?auto_207707 ?auto_207708 ) ( CLEAR ?auto_207707 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_207704 ?auto_207705 ?auto_207706 ?auto_207710 ?auto_207709 ?auto_207711 ?auto_207708 )
      ( MAKE-2PILE ?auto_207704 ?auto_207705 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_207712 - BLOCK
      ?auto_207713 - BLOCK
    )
    :vars
    (
      ?auto_207719 - BLOCK
      ?auto_207718 - BLOCK
      ?auto_207716 - BLOCK
      ?auto_207715 - BLOCK
      ?auto_207717 - BLOCK
      ?auto_207714 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207719 ?auto_207713 ) ( ON-TABLE ?auto_207712 ) ( ON ?auto_207713 ?auto_207712 ) ( not ( = ?auto_207712 ?auto_207713 ) ) ( not ( = ?auto_207712 ?auto_207719 ) ) ( not ( = ?auto_207713 ?auto_207719 ) ) ( not ( = ?auto_207712 ?auto_207718 ) ) ( not ( = ?auto_207712 ?auto_207716 ) ) ( not ( = ?auto_207713 ?auto_207718 ) ) ( not ( = ?auto_207713 ?auto_207716 ) ) ( not ( = ?auto_207719 ?auto_207718 ) ) ( not ( = ?auto_207719 ?auto_207716 ) ) ( not ( = ?auto_207718 ?auto_207716 ) ) ( ON ?auto_207718 ?auto_207719 ) ( not ( = ?auto_207715 ?auto_207717 ) ) ( not ( = ?auto_207715 ?auto_207714 ) ) ( not ( = ?auto_207715 ?auto_207716 ) ) ( not ( = ?auto_207717 ?auto_207714 ) ) ( not ( = ?auto_207717 ?auto_207716 ) ) ( not ( = ?auto_207714 ?auto_207716 ) ) ( not ( = ?auto_207712 ?auto_207714 ) ) ( not ( = ?auto_207712 ?auto_207715 ) ) ( not ( = ?auto_207712 ?auto_207717 ) ) ( not ( = ?auto_207713 ?auto_207714 ) ) ( not ( = ?auto_207713 ?auto_207715 ) ) ( not ( = ?auto_207713 ?auto_207717 ) ) ( not ( = ?auto_207719 ?auto_207714 ) ) ( not ( = ?auto_207719 ?auto_207715 ) ) ( not ( = ?auto_207719 ?auto_207717 ) ) ( not ( = ?auto_207718 ?auto_207714 ) ) ( not ( = ?auto_207718 ?auto_207715 ) ) ( not ( = ?auto_207718 ?auto_207717 ) ) ( ON ?auto_207716 ?auto_207718 ) ( ON ?auto_207714 ?auto_207716 ) ( ON ?auto_207717 ?auto_207714 ) ( HOLDING ?auto_207715 ) ( CLEAR ?auto_207717 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_207712 ?auto_207713 ?auto_207719 ?auto_207718 ?auto_207716 ?auto_207714 ?auto_207717 ?auto_207715 )
      ( MAKE-2PILE ?auto_207712 ?auto_207713 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_207720 - BLOCK
      ?auto_207721 - BLOCK
    )
    :vars
    (
      ?auto_207723 - BLOCK
      ?auto_207726 - BLOCK
      ?auto_207722 - BLOCK
      ?auto_207724 - BLOCK
      ?auto_207727 - BLOCK
      ?auto_207725 - BLOCK
      ?auto_207728 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207723 ?auto_207721 ) ( ON-TABLE ?auto_207720 ) ( ON ?auto_207721 ?auto_207720 ) ( not ( = ?auto_207720 ?auto_207721 ) ) ( not ( = ?auto_207720 ?auto_207723 ) ) ( not ( = ?auto_207721 ?auto_207723 ) ) ( not ( = ?auto_207720 ?auto_207726 ) ) ( not ( = ?auto_207720 ?auto_207722 ) ) ( not ( = ?auto_207721 ?auto_207726 ) ) ( not ( = ?auto_207721 ?auto_207722 ) ) ( not ( = ?auto_207723 ?auto_207726 ) ) ( not ( = ?auto_207723 ?auto_207722 ) ) ( not ( = ?auto_207726 ?auto_207722 ) ) ( ON ?auto_207726 ?auto_207723 ) ( not ( = ?auto_207724 ?auto_207727 ) ) ( not ( = ?auto_207724 ?auto_207725 ) ) ( not ( = ?auto_207724 ?auto_207722 ) ) ( not ( = ?auto_207727 ?auto_207725 ) ) ( not ( = ?auto_207727 ?auto_207722 ) ) ( not ( = ?auto_207725 ?auto_207722 ) ) ( not ( = ?auto_207720 ?auto_207725 ) ) ( not ( = ?auto_207720 ?auto_207724 ) ) ( not ( = ?auto_207720 ?auto_207727 ) ) ( not ( = ?auto_207721 ?auto_207725 ) ) ( not ( = ?auto_207721 ?auto_207724 ) ) ( not ( = ?auto_207721 ?auto_207727 ) ) ( not ( = ?auto_207723 ?auto_207725 ) ) ( not ( = ?auto_207723 ?auto_207724 ) ) ( not ( = ?auto_207723 ?auto_207727 ) ) ( not ( = ?auto_207726 ?auto_207725 ) ) ( not ( = ?auto_207726 ?auto_207724 ) ) ( not ( = ?auto_207726 ?auto_207727 ) ) ( ON ?auto_207722 ?auto_207726 ) ( ON ?auto_207725 ?auto_207722 ) ( ON ?auto_207727 ?auto_207725 ) ( CLEAR ?auto_207727 ) ( ON ?auto_207724 ?auto_207728 ) ( CLEAR ?auto_207724 ) ( HAND-EMPTY ) ( not ( = ?auto_207720 ?auto_207728 ) ) ( not ( = ?auto_207721 ?auto_207728 ) ) ( not ( = ?auto_207723 ?auto_207728 ) ) ( not ( = ?auto_207726 ?auto_207728 ) ) ( not ( = ?auto_207722 ?auto_207728 ) ) ( not ( = ?auto_207724 ?auto_207728 ) ) ( not ( = ?auto_207727 ?auto_207728 ) ) ( not ( = ?auto_207725 ?auto_207728 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_207724 ?auto_207728 )
      ( MAKE-2PILE ?auto_207720 ?auto_207721 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_207729 - BLOCK
      ?auto_207730 - BLOCK
    )
    :vars
    (
      ?auto_207735 - BLOCK
      ?auto_207733 - BLOCK
      ?auto_207734 - BLOCK
      ?auto_207737 - BLOCK
      ?auto_207731 - BLOCK
      ?auto_207736 - BLOCK
      ?auto_207732 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207735 ?auto_207730 ) ( ON-TABLE ?auto_207729 ) ( ON ?auto_207730 ?auto_207729 ) ( not ( = ?auto_207729 ?auto_207730 ) ) ( not ( = ?auto_207729 ?auto_207735 ) ) ( not ( = ?auto_207730 ?auto_207735 ) ) ( not ( = ?auto_207729 ?auto_207733 ) ) ( not ( = ?auto_207729 ?auto_207734 ) ) ( not ( = ?auto_207730 ?auto_207733 ) ) ( not ( = ?auto_207730 ?auto_207734 ) ) ( not ( = ?auto_207735 ?auto_207733 ) ) ( not ( = ?auto_207735 ?auto_207734 ) ) ( not ( = ?auto_207733 ?auto_207734 ) ) ( ON ?auto_207733 ?auto_207735 ) ( not ( = ?auto_207737 ?auto_207731 ) ) ( not ( = ?auto_207737 ?auto_207736 ) ) ( not ( = ?auto_207737 ?auto_207734 ) ) ( not ( = ?auto_207731 ?auto_207736 ) ) ( not ( = ?auto_207731 ?auto_207734 ) ) ( not ( = ?auto_207736 ?auto_207734 ) ) ( not ( = ?auto_207729 ?auto_207736 ) ) ( not ( = ?auto_207729 ?auto_207737 ) ) ( not ( = ?auto_207729 ?auto_207731 ) ) ( not ( = ?auto_207730 ?auto_207736 ) ) ( not ( = ?auto_207730 ?auto_207737 ) ) ( not ( = ?auto_207730 ?auto_207731 ) ) ( not ( = ?auto_207735 ?auto_207736 ) ) ( not ( = ?auto_207735 ?auto_207737 ) ) ( not ( = ?auto_207735 ?auto_207731 ) ) ( not ( = ?auto_207733 ?auto_207736 ) ) ( not ( = ?auto_207733 ?auto_207737 ) ) ( not ( = ?auto_207733 ?auto_207731 ) ) ( ON ?auto_207734 ?auto_207733 ) ( ON ?auto_207736 ?auto_207734 ) ( ON ?auto_207737 ?auto_207732 ) ( CLEAR ?auto_207737 ) ( not ( = ?auto_207729 ?auto_207732 ) ) ( not ( = ?auto_207730 ?auto_207732 ) ) ( not ( = ?auto_207735 ?auto_207732 ) ) ( not ( = ?auto_207733 ?auto_207732 ) ) ( not ( = ?auto_207734 ?auto_207732 ) ) ( not ( = ?auto_207737 ?auto_207732 ) ) ( not ( = ?auto_207731 ?auto_207732 ) ) ( not ( = ?auto_207736 ?auto_207732 ) ) ( HOLDING ?auto_207731 ) ( CLEAR ?auto_207736 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_207729 ?auto_207730 ?auto_207735 ?auto_207733 ?auto_207734 ?auto_207736 ?auto_207731 )
      ( MAKE-2PILE ?auto_207729 ?auto_207730 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_207738 - BLOCK
      ?auto_207739 - BLOCK
    )
    :vars
    (
      ?auto_207745 - BLOCK
      ?auto_207741 - BLOCK
      ?auto_207746 - BLOCK
      ?auto_207744 - BLOCK
      ?auto_207742 - BLOCK
      ?auto_207740 - BLOCK
      ?auto_207743 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207745 ?auto_207739 ) ( ON-TABLE ?auto_207738 ) ( ON ?auto_207739 ?auto_207738 ) ( not ( = ?auto_207738 ?auto_207739 ) ) ( not ( = ?auto_207738 ?auto_207745 ) ) ( not ( = ?auto_207739 ?auto_207745 ) ) ( not ( = ?auto_207738 ?auto_207741 ) ) ( not ( = ?auto_207738 ?auto_207746 ) ) ( not ( = ?auto_207739 ?auto_207741 ) ) ( not ( = ?auto_207739 ?auto_207746 ) ) ( not ( = ?auto_207745 ?auto_207741 ) ) ( not ( = ?auto_207745 ?auto_207746 ) ) ( not ( = ?auto_207741 ?auto_207746 ) ) ( ON ?auto_207741 ?auto_207745 ) ( not ( = ?auto_207744 ?auto_207742 ) ) ( not ( = ?auto_207744 ?auto_207740 ) ) ( not ( = ?auto_207744 ?auto_207746 ) ) ( not ( = ?auto_207742 ?auto_207740 ) ) ( not ( = ?auto_207742 ?auto_207746 ) ) ( not ( = ?auto_207740 ?auto_207746 ) ) ( not ( = ?auto_207738 ?auto_207740 ) ) ( not ( = ?auto_207738 ?auto_207744 ) ) ( not ( = ?auto_207738 ?auto_207742 ) ) ( not ( = ?auto_207739 ?auto_207740 ) ) ( not ( = ?auto_207739 ?auto_207744 ) ) ( not ( = ?auto_207739 ?auto_207742 ) ) ( not ( = ?auto_207745 ?auto_207740 ) ) ( not ( = ?auto_207745 ?auto_207744 ) ) ( not ( = ?auto_207745 ?auto_207742 ) ) ( not ( = ?auto_207741 ?auto_207740 ) ) ( not ( = ?auto_207741 ?auto_207744 ) ) ( not ( = ?auto_207741 ?auto_207742 ) ) ( ON ?auto_207746 ?auto_207741 ) ( ON ?auto_207740 ?auto_207746 ) ( ON ?auto_207744 ?auto_207743 ) ( not ( = ?auto_207738 ?auto_207743 ) ) ( not ( = ?auto_207739 ?auto_207743 ) ) ( not ( = ?auto_207745 ?auto_207743 ) ) ( not ( = ?auto_207741 ?auto_207743 ) ) ( not ( = ?auto_207746 ?auto_207743 ) ) ( not ( = ?auto_207744 ?auto_207743 ) ) ( not ( = ?auto_207742 ?auto_207743 ) ) ( not ( = ?auto_207740 ?auto_207743 ) ) ( CLEAR ?auto_207740 ) ( ON ?auto_207742 ?auto_207744 ) ( CLEAR ?auto_207742 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_207743 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_207743 ?auto_207744 )
      ( MAKE-2PILE ?auto_207738 ?auto_207739 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_207747 - BLOCK
      ?auto_207748 - BLOCK
    )
    :vars
    (
      ?auto_207755 - BLOCK
      ?auto_207750 - BLOCK
      ?auto_207752 - BLOCK
      ?auto_207753 - BLOCK
      ?auto_207749 - BLOCK
      ?auto_207751 - BLOCK
      ?auto_207754 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207755 ?auto_207748 ) ( ON-TABLE ?auto_207747 ) ( ON ?auto_207748 ?auto_207747 ) ( not ( = ?auto_207747 ?auto_207748 ) ) ( not ( = ?auto_207747 ?auto_207755 ) ) ( not ( = ?auto_207748 ?auto_207755 ) ) ( not ( = ?auto_207747 ?auto_207750 ) ) ( not ( = ?auto_207747 ?auto_207752 ) ) ( not ( = ?auto_207748 ?auto_207750 ) ) ( not ( = ?auto_207748 ?auto_207752 ) ) ( not ( = ?auto_207755 ?auto_207750 ) ) ( not ( = ?auto_207755 ?auto_207752 ) ) ( not ( = ?auto_207750 ?auto_207752 ) ) ( ON ?auto_207750 ?auto_207755 ) ( not ( = ?auto_207753 ?auto_207749 ) ) ( not ( = ?auto_207753 ?auto_207751 ) ) ( not ( = ?auto_207753 ?auto_207752 ) ) ( not ( = ?auto_207749 ?auto_207751 ) ) ( not ( = ?auto_207749 ?auto_207752 ) ) ( not ( = ?auto_207751 ?auto_207752 ) ) ( not ( = ?auto_207747 ?auto_207751 ) ) ( not ( = ?auto_207747 ?auto_207753 ) ) ( not ( = ?auto_207747 ?auto_207749 ) ) ( not ( = ?auto_207748 ?auto_207751 ) ) ( not ( = ?auto_207748 ?auto_207753 ) ) ( not ( = ?auto_207748 ?auto_207749 ) ) ( not ( = ?auto_207755 ?auto_207751 ) ) ( not ( = ?auto_207755 ?auto_207753 ) ) ( not ( = ?auto_207755 ?auto_207749 ) ) ( not ( = ?auto_207750 ?auto_207751 ) ) ( not ( = ?auto_207750 ?auto_207753 ) ) ( not ( = ?auto_207750 ?auto_207749 ) ) ( ON ?auto_207752 ?auto_207750 ) ( ON ?auto_207753 ?auto_207754 ) ( not ( = ?auto_207747 ?auto_207754 ) ) ( not ( = ?auto_207748 ?auto_207754 ) ) ( not ( = ?auto_207755 ?auto_207754 ) ) ( not ( = ?auto_207750 ?auto_207754 ) ) ( not ( = ?auto_207752 ?auto_207754 ) ) ( not ( = ?auto_207753 ?auto_207754 ) ) ( not ( = ?auto_207749 ?auto_207754 ) ) ( not ( = ?auto_207751 ?auto_207754 ) ) ( ON ?auto_207749 ?auto_207753 ) ( CLEAR ?auto_207749 ) ( ON-TABLE ?auto_207754 ) ( HOLDING ?auto_207751 ) ( CLEAR ?auto_207752 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_207747 ?auto_207748 ?auto_207755 ?auto_207750 ?auto_207752 ?auto_207751 )
      ( MAKE-2PILE ?auto_207747 ?auto_207748 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_207756 - BLOCK
      ?auto_207757 - BLOCK
    )
    :vars
    (
      ?auto_207758 - BLOCK
      ?auto_207763 - BLOCK
      ?auto_207762 - BLOCK
      ?auto_207764 - BLOCK
      ?auto_207759 - BLOCK
      ?auto_207760 - BLOCK
      ?auto_207761 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207758 ?auto_207757 ) ( ON-TABLE ?auto_207756 ) ( ON ?auto_207757 ?auto_207756 ) ( not ( = ?auto_207756 ?auto_207757 ) ) ( not ( = ?auto_207756 ?auto_207758 ) ) ( not ( = ?auto_207757 ?auto_207758 ) ) ( not ( = ?auto_207756 ?auto_207763 ) ) ( not ( = ?auto_207756 ?auto_207762 ) ) ( not ( = ?auto_207757 ?auto_207763 ) ) ( not ( = ?auto_207757 ?auto_207762 ) ) ( not ( = ?auto_207758 ?auto_207763 ) ) ( not ( = ?auto_207758 ?auto_207762 ) ) ( not ( = ?auto_207763 ?auto_207762 ) ) ( ON ?auto_207763 ?auto_207758 ) ( not ( = ?auto_207764 ?auto_207759 ) ) ( not ( = ?auto_207764 ?auto_207760 ) ) ( not ( = ?auto_207764 ?auto_207762 ) ) ( not ( = ?auto_207759 ?auto_207760 ) ) ( not ( = ?auto_207759 ?auto_207762 ) ) ( not ( = ?auto_207760 ?auto_207762 ) ) ( not ( = ?auto_207756 ?auto_207760 ) ) ( not ( = ?auto_207756 ?auto_207764 ) ) ( not ( = ?auto_207756 ?auto_207759 ) ) ( not ( = ?auto_207757 ?auto_207760 ) ) ( not ( = ?auto_207757 ?auto_207764 ) ) ( not ( = ?auto_207757 ?auto_207759 ) ) ( not ( = ?auto_207758 ?auto_207760 ) ) ( not ( = ?auto_207758 ?auto_207764 ) ) ( not ( = ?auto_207758 ?auto_207759 ) ) ( not ( = ?auto_207763 ?auto_207760 ) ) ( not ( = ?auto_207763 ?auto_207764 ) ) ( not ( = ?auto_207763 ?auto_207759 ) ) ( ON ?auto_207762 ?auto_207763 ) ( ON ?auto_207764 ?auto_207761 ) ( not ( = ?auto_207756 ?auto_207761 ) ) ( not ( = ?auto_207757 ?auto_207761 ) ) ( not ( = ?auto_207758 ?auto_207761 ) ) ( not ( = ?auto_207763 ?auto_207761 ) ) ( not ( = ?auto_207762 ?auto_207761 ) ) ( not ( = ?auto_207764 ?auto_207761 ) ) ( not ( = ?auto_207759 ?auto_207761 ) ) ( not ( = ?auto_207760 ?auto_207761 ) ) ( ON ?auto_207759 ?auto_207764 ) ( ON-TABLE ?auto_207761 ) ( CLEAR ?auto_207762 ) ( ON ?auto_207760 ?auto_207759 ) ( CLEAR ?auto_207760 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_207761 ?auto_207764 ?auto_207759 )
      ( MAKE-2PILE ?auto_207756 ?auto_207757 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_207765 - BLOCK
      ?auto_207766 - BLOCK
    )
    :vars
    (
      ?auto_207767 - BLOCK
      ?auto_207768 - BLOCK
      ?auto_207770 - BLOCK
      ?auto_207769 - BLOCK
      ?auto_207773 - BLOCK
      ?auto_207772 - BLOCK
      ?auto_207771 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207767 ?auto_207766 ) ( ON-TABLE ?auto_207765 ) ( ON ?auto_207766 ?auto_207765 ) ( not ( = ?auto_207765 ?auto_207766 ) ) ( not ( = ?auto_207765 ?auto_207767 ) ) ( not ( = ?auto_207766 ?auto_207767 ) ) ( not ( = ?auto_207765 ?auto_207768 ) ) ( not ( = ?auto_207765 ?auto_207770 ) ) ( not ( = ?auto_207766 ?auto_207768 ) ) ( not ( = ?auto_207766 ?auto_207770 ) ) ( not ( = ?auto_207767 ?auto_207768 ) ) ( not ( = ?auto_207767 ?auto_207770 ) ) ( not ( = ?auto_207768 ?auto_207770 ) ) ( ON ?auto_207768 ?auto_207767 ) ( not ( = ?auto_207769 ?auto_207773 ) ) ( not ( = ?auto_207769 ?auto_207772 ) ) ( not ( = ?auto_207769 ?auto_207770 ) ) ( not ( = ?auto_207773 ?auto_207772 ) ) ( not ( = ?auto_207773 ?auto_207770 ) ) ( not ( = ?auto_207772 ?auto_207770 ) ) ( not ( = ?auto_207765 ?auto_207772 ) ) ( not ( = ?auto_207765 ?auto_207769 ) ) ( not ( = ?auto_207765 ?auto_207773 ) ) ( not ( = ?auto_207766 ?auto_207772 ) ) ( not ( = ?auto_207766 ?auto_207769 ) ) ( not ( = ?auto_207766 ?auto_207773 ) ) ( not ( = ?auto_207767 ?auto_207772 ) ) ( not ( = ?auto_207767 ?auto_207769 ) ) ( not ( = ?auto_207767 ?auto_207773 ) ) ( not ( = ?auto_207768 ?auto_207772 ) ) ( not ( = ?auto_207768 ?auto_207769 ) ) ( not ( = ?auto_207768 ?auto_207773 ) ) ( ON ?auto_207769 ?auto_207771 ) ( not ( = ?auto_207765 ?auto_207771 ) ) ( not ( = ?auto_207766 ?auto_207771 ) ) ( not ( = ?auto_207767 ?auto_207771 ) ) ( not ( = ?auto_207768 ?auto_207771 ) ) ( not ( = ?auto_207770 ?auto_207771 ) ) ( not ( = ?auto_207769 ?auto_207771 ) ) ( not ( = ?auto_207773 ?auto_207771 ) ) ( not ( = ?auto_207772 ?auto_207771 ) ) ( ON ?auto_207773 ?auto_207769 ) ( ON-TABLE ?auto_207771 ) ( ON ?auto_207772 ?auto_207773 ) ( CLEAR ?auto_207772 ) ( HOLDING ?auto_207770 ) ( CLEAR ?auto_207768 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_207765 ?auto_207766 ?auto_207767 ?auto_207768 ?auto_207770 )
      ( MAKE-2PILE ?auto_207765 ?auto_207766 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_207774 - BLOCK
      ?auto_207775 - BLOCK
    )
    :vars
    (
      ?auto_207776 - BLOCK
      ?auto_207780 - BLOCK
      ?auto_207779 - BLOCK
      ?auto_207778 - BLOCK
      ?auto_207782 - BLOCK
      ?auto_207777 - BLOCK
      ?auto_207781 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207776 ?auto_207775 ) ( ON-TABLE ?auto_207774 ) ( ON ?auto_207775 ?auto_207774 ) ( not ( = ?auto_207774 ?auto_207775 ) ) ( not ( = ?auto_207774 ?auto_207776 ) ) ( not ( = ?auto_207775 ?auto_207776 ) ) ( not ( = ?auto_207774 ?auto_207780 ) ) ( not ( = ?auto_207774 ?auto_207779 ) ) ( not ( = ?auto_207775 ?auto_207780 ) ) ( not ( = ?auto_207775 ?auto_207779 ) ) ( not ( = ?auto_207776 ?auto_207780 ) ) ( not ( = ?auto_207776 ?auto_207779 ) ) ( not ( = ?auto_207780 ?auto_207779 ) ) ( ON ?auto_207780 ?auto_207776 ) ( not ( = ?auto_207778 ?auto_207782 ) ) ( not ( = ?auto_207778 ?auto_207777 ) ) ( not ( = ?auto_207778 ?auto_207779 ) ) ( not ( = ?auto_207782 ?auto_207777 ) ) ( not ( = ?auto_207782 ?auto_207779 ) ) ( not ( = ?auto_207777 ?auto_207779 ) ) ( not ( = ?auto_207774 ?auto_207777 ) ) ( not ( = ?auto_207774 ?auto_207778 ) ) ( not ( = ?auto_207774 ?auto_207782 ) ) ( not ( = ?auto_207775 ?auto_207777 ) ) ( not ( = ?auto_207775 ?auto_207778 ) ) ( not ( = ?auto_207775 ?auto_207782 ) ) ( not ( = ?auto_207776 ?auto_207777 ) ) ( not ( = ?auto_207776 ?auto_207778 ) ) ( not ( = ?auto_207776 ?auto_207782 ) ) ( not ( = ?auto_207780 ?auto_207777 ) ) ( not ( = ?auto_207780 ?auto_207778 ) ) ( not ( = ?auto_207780 ?auto_207782 ) ) ( ON ?auto_207778 ?auto_207781 ) ( not ( = ?auto_207774 ?auto_207781 ) ) ( not ( = ?auto_207775 ?auto_207781 ) ) ( not ( = ?auto_207776 ?auto_207781 ) ) ( not ( = ?auto_207780 ?auto_207781 ) ) ( not ( = ?auto_207779 ?auto_207781 ) ) ( not ( = ?auto_207778 ?auto_207781 ) ) ( not ( = ?auto_207782 ?auto_207781 ) ) ( not ( = ?auto_207777 ?auto_207781 ) ) ( ON ?auto_207782 ?auto_207778 ) ( ON-TABLE ?auto_207781 ) ( ON ?auto_207777 ?auto_207782 ) ( CLEAR ?auto_207780 ) ( ON ?auto_207779 ?auto_207777 ) ( CLEAR ?auto_207779 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_207781 ?auto_207778 ?auto_207782 ?auto_207777 )
      ( MAKE-2PILE ?auto_207774 ?auto_207775 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_207783 - BLOCK
      ?auto_207784 - BLOCK
    )
    :vars
    (
      ?auto_207787 - BLOCK
      ?auto_207788 - BLOCK
      ?auto_207790 - BLOCK
      ?auto_207791 - BLOCK
      ?auto_207786 - BLOCK
      ?auto_207785 - BLOCK
      ?auto_207789 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207787 ?auto_207784 ) ( ON-TABLE ?auto_207783 ) ( ON ?auto_207784 ?auto_207783 ) ( not ( = ?auto_207783 ?auto_207784 ) ) ( not ( = ?auto_207783 ?auto_207787 ) ) ( not ( = ?auto_207784 ?auto_207787 ) ) ( not ( = ?auto_207783 ?auto_207788 ) ) ( not ( = ?auto_207783 ?auto_207790 ) ) ( not ( = ?auto_207784 ?auto_207788 ) ) ( not ( = ?auto_207784 ?auto_207790 ) ) ( not ( = ?auto_207787 ?auto_207788 ) ) ( not ( = ?auto_207787 ?auto_207790 ) ) ( not ( = ?auto_207788 ?auto_207790 ) ) ( not ( = ?auto_207791 ?auto_207786 ) ) ( not ( = ?auto_207791 ?auto_207785 ) ) ( not ( = ?auto_207791 ?auto_207790 ) ) ( not ( = ?auto_207786 ?auto_207785 ) ) ( not ( = ?auto_207786 ?auto_207790 ) ) ( not ( = ?auto_207785 ?auto_207790 ) ) ( not ( = ?auto_207783 ?auto_207785 ) ) ( not ( = ?auto_207783 ?auto_207791 ) ) ( not ( = ?auto_207783 ?auto_207786 ) ) ( not ( = ?auto_207784 ?auto_207785 ) ) ( not ( = ?auto_207784 ?auto_207791 ) ) ( not ( = ?auto_207784 ?auto_207786 ) ) ( not ( = ?auto_207787 ?auto_207785 ) ) ( not ( = ?auto_207787 ?auto_207791 ) ) ( not ( = ?auto_207787 ?auto_207786 ) ) ( not ( = ?auto_207788 ?auto_207785 ) ) ( not ( = ?auto_207788 ?auto_207791 ) ) ( not ( = ?auto_207788 ?auto_207786 ) ) ( ON ?auto_207791 ?auto_207789 ) ( not ( = ?auto_207783 ?auto_207789 ) ) ( not ( = ?auto_207784 ?auto_207789 ) ) ( not ( = ?auto_207787 ?auto_207789 ) ) ( not ( = ?auto_207788 ?auto_207789 ) ) ( not ( = ?auto_207790 ?auto_207789 ) ) ( not ( = ?auto_207791 ?auto_207789 ) ) ( not ( = ?auto_207786 ?auto_207789 ) ) ( not ( = ?auto_207785 ?auto_207789 ) ) ( ON ?auto_207786 ?auto_207791 ) ( ON-TABLE ?auto_207789 ) ( ON ?auto_207785 ?auto_207786 ) ( ON ?auto_207790 ?auto_207785 ) ( CLEAR ?auto_207790 ) ( HOLDING ?auto_207788 ) ( CLEAR ?auto_207787 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_207783 ?auto_207784 ?auto_207787 ?auto_207788 )
      ( MAKE-2PILE ?auto_207783 ?auto_207784 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_207792 - BLOCK
      ?auto_207793 - BLOCK
    )
    :vars
    (
      ?auto_207796 - BLOCK
      ?auto_207799 - BLOCK
      ?auto_207800 - BLOCK
      ?auto_207798 - BLOCK
      ?auto_207797 - BLOCK
      ?auto_207794 - BLOCK
      ?auto_207795 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207796 ?auto_207793 ) ( ON-TABLE ?auto_207792 ) ( ON ?auto_207793 ?auto_207792 ) ( not ( = ?auto_207792 ?auto_207793 ) ) ( not ( = ?auto_207792 ?auto_207796 ) ) ( not ( = ?auto_207793 ?auto_207796 ) ) ( not ( = ?auto_207792 ?auto_207799 ) ) ( not ( = ?auto_207792 ?auto_207800 ) ) ( not ( = ?auto_207793 ?auto_207799 ) ) ( not ( = ?auto_207793 ?auto_207800 ) ) ( not ( = ?auto_207796 ?auto_207799 ) ) ( not ( = ?auto_207796 ?auto_207800 ) ) ( not ( = ?auto_207799 ?auto_207800 ) ) ( not ( = ?auto_207798 ?auto_207797 ) ) ( not ( = ?auto_207798 ?auto_207794 ) ) ( not ( = ?auto_207798 ?auto_207800 ) ) ( not ( = ?auto_207797 ?auto_207794 ) ) ( not ( = ?auto_207797 ?auto_207800 ) ) ( not ( = ?auto_207794 ?auto_207800 ) ) ( not ( = ?auto_207792 ?auto_207794 ) ) ( not ( = ?auto_207792 ?auto_207798 ) ) ( not ( = ?auto_207792 ?auto_207797 ) ) ( not ( = ?auto_207793 ?auto_207794 ) ) ( not ( = ?auto_207793 ?auto_207798 ) ) ( not ( = ?auto_207793 ?auto_207797 ) ) ( not ( = ?auto_207796 ?auto_207794 ) ) ( not ( = ?auto_207796 ?auto_207798 ) ) ( not ( = ?auto_207796 ?auto_207797 ) ) ( not ( = ?auto_207799 ?auto_207794 ) ) ( not ( = ?auto_207799 ?auto_207798 ) ) ( not ( = ?auto_207799 ?auto_207797 ) ) ( ON ?auto_207798 ?auto_207795 ) ( not ( = ?auto_207792 ?auto_207795 ) ) ( not ( = ?auto_207793 ?auto_207795 ) ) ( not ( = ?auto_207796 ?auto_207795 ) ) ( not ( = ?auto_207799 ?auto_207795 ) ) ( not ( = ?auto_207800 ?auto_207795 ) ) ( not ( = ?auto_207798 ?auto_207795 ) ) ( not ( = ?auto_207797 ?auto_207795 ) ) ( not ( = ?auto_207794 ?auto_207795 ) ) ( ON ?auto_207797 ?auto_207798 ) ( ON-TABLE ?auto_207795 ) ( ON ?auto_207794 ?auto_207797 ) ( ON ?auto_207800 ?auto_207794 ) ( CLEAR ?auto_207796 ) ( ON ?auto_207799 ?auto_207800 ) ( CLEAR ?auto_207799 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_207795 ?auto_207798 ?auto_207797 ?auto_207794 ?auto_207800 )
      ( MAKE-2PILE ?auto_207792 ?auto_207793 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_207819 - BLOCK
      ?auto_207820 - BLOCK
    )
    :vars
    (
      ?auto_207821 - BLOCK
      ?auto_207825 - BLOCK
      ?auto_207822 - BLOCK
      ?auto_207824 - BLOCK
      ?auto_207826 - BLOCK
      ?auto_207823 - BLOCK
      ?auto_207827 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_207819 ) ( not ( = ?auto_207819 ?auto_207820 ) ) ( not ( = ?auto_207819 ?auto_207821 ) ) ( not ( = ?auto_207820 ?auto_207821 ) ) ( not ( = ?auto_207819 ?auto_207825 ) ) ( not ( = ?auto_207819 ?auto_207822 ) ) ( not ( = ?auto_207820 ?auto_207825 ) ) ( not ( = ?auto_207820 ?auto_207822 ) ) ( not ( = ?auto_207821 ?auto_207825 ) ) ( not ( = ?auto_207821 ?auto_207822 ) ) ( not ( = ?auto_207825 ?auto_207822 ) ) ( not ( = ?auto_207824 ?auto_207826 ) ) ( not ( = ?auto_207824 ?auto_207823 ) ) ( not ( = ?auto_207824 ?auto_207822 ) ) ( not ( = ?auto_207826 ?auto_207823 ) ) ( not ( = ?auto_207826 ?auto_207822 ) ) ( not ( = ?auto_207823 ?auto_207822 ) ) ( not ( = ?auto_207819 ?auto_207823 ) ) ( not ( = ?auto_207819 ?auto_207824 ) ) ( not ( = ?auto_207819 ?auto_207826 ) ) ( not ( = ?auto_207820 ?auto_207823 ) ) ( not ( = ?auto_207820 ?auto_207824 ) ) ( not ( = ?auto_207820 ?auto_207826 ) ) ( not ( = ?auto_207821 ?auto_207823 ) ) ( not ( = ?auto_207821 ?auto_207824 ) ) ( not ( = ?auto_207821 ?auto_207826 ) ) ( not ( = ?auto_207825 ?auto_207823 ) ) ( not ( = ?auto_207825 ?auto_207824 ) ) ( not ( = ?auto_207825 ?auto_207826 ) ) ( ON ?auto_207824 ?auto_207827 ) ( not ( = ?auto_207819 ?auto_207827 ) ) ( not ( = ?auto_207820 ?auto_207827 ) ) ( not ( = ?auto_207821 ?auto_207827 ) ) ( not ( = ?auto_207825 ?auto_207827 ) ) ( not ( = ?auto_207822 ?auto_207827 ) ) ( not ( = ?auto_207824 ?auto_207827 ) ) ( not ( = ?auto_207826 ?auto_207827 ) ) ( not ( = ?auto_207823 ?auto_207827 ) ) ( ON ?auto_207826 ?auto_207824 ) ( ON-TABLE ?auto_207827 ) ( ON ?auto_207823 ?auto_207826 ) ( ON ?auto_207822 ?auto_207823 ) ( ON ?auto_207825 ?auto_207822 ) ( ON ?auto_207821 ?auto_207825 ) ( CLEAR ?auto_207821 ) ( HOLDING ?auto_207820 ) ( CLEAR ?auto_207819 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_207819 ?auto_207820 ?auto_207821 )
      ( MAKE-2PILE ?auto_207819 ?auto_207820 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_207828 - BLOCK
      ?auto_207829 - BLOCK
    )
    :vars
    (
      ?auto_207834 - BLOCK
      ?auto_207831 - BLOCK
      ?auto_207835 - BLOCK
      ?auto_207832 - BLOCK
      ?auto_207833 - BLOCK
      ?auto_207836 - BLOCK
      ?auto_207830 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_207828 ) ( not ( = ?auto_207828 ?auto_207829 ) ) ( not ( = ?auto_207828 ?auto_207834 ) ) ( not ( = ?auto_207829 ?auto_207834 ) ) ( not ( = ?auto_207828 ?auto_207831 ) ) ( not ( = ?auto_207828 ?auto_207835 ) ) ( not ( = ?auto_207829 ?auto_207831 ) ) ( not ( = ?auto_207829 ?auto_207835 ) ) ( not ( = ?auto_207834 ?auto_207831 ) ) ( not ( = ?auto_207834 ?auto_207835 ) ) ( not ( = ?auto_207831 ?auto_207835 ) ) ( not ( = ?auto_207832 ?auto_207833 ) ) ( not ( = ?auto_207832 ?auto_207836 ) ) ( not ( = ?auto_207832 ?auto_207835 ) ) ( not ( = ?auto_207833 ?auto_207836 ) ) ( not ( = ?auto_207833 ?auto_207835 ) ) ( not ( = ?auto_207836 ?auto_207835 ) ) ( not ( = ?auto_207828 ?auto_207836 ) ) ( not ( = ?auto_207828 ?auto_207832 ) ) ( not ( = ?auto_207828 ?auto_207833 ) ) ( not ( = ?auto_207829 ?auto_207836 ) ) ( not ( = ?auto_207829 ?auto_207832 ) ) ( not ( = ?auto_207829 ?auto_207833 ) ) ( not ( = ?auto_207834 ?auto_207836 ) ) ( not ( = ?auto_207834 ?auto_207832 ) ) ( not ( = ?auto_207834 ?auto_207833 ) ) ( not ( = ?auto_207831 ?auto_207836 ) ) ( not ( = ?auto_207831 ?auto_207832 ) ) ( not ( = ?auto_207831 ?auto_207833 ) ) ( ON ?auto_207832 ?auto_207830 ) ( not ( = ?auto_207828 ?auto_207830 ) ) ( not ( = ?auto_207829 ?auto_207830 ) ) ( not ( = ?auto_207834 ?auto_207830 ) ) ( not ( = ?auto_207831 ?auto_207830 ) ) ( not ( = ?auto_207835 ?auto_207830 ) ) ( not ( = ?auto_207832 ?auto_207830 ) ) ( not ( = ?auto_207833 ?auto_207830 ) ) ( not ( = ?auto_207836 ?auto_207830 ) ) ( ON ?auto_207833 ?auto_207832 ) ( ON-TABLE ?auto_207830 ) ( ON ?auto_207836 ?auto_207833 ) ( ON ?auto_207835 ?auto_207836 ) ( ON ?auto_207831 ?auto_207835 ) ( ON ?auto_207834 ?auto_207831 ) ( CLEAR ?auto_207828 ) ( ON ?auto_207829 ?auto_207834 ) ( CLEAR ?auto_207829 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_207830 ?auto_207832 ?auto_207833 ?auto_207836 ?auto_207835 ?auto_207831 ?auto_207834 )
      ( MAKE-2PILE ?auto_207828 ?auto_207829 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_207837 - BLOCK
      ?auto_207838 - BLOCK
    )
    :vars
    (
      ?auto_207843 - BLOCK
      ?auto_207841 - BLOCK
      ?auto_207840 - BLOCK
      ?auto_207844 - BLOCK
      ?auto_207839 - BLOCK
      ?auto_207845 - BLOCK
      ?auto_207842 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_207837 ?auto_207838 ) ) ( not ( = ?auto_207837 ?auto_207843 ) ) ( not ( = ?auto_207838 ?auto_207843 ) ) ( not ( = ?auto_207837 ?auto_207841 ) ) ( not ( = ?auto_207837 ?auto_207840 ) ) ( not ( = ?auto_207838 ?auto_207841 ) ) ( not ( = ?auto_207838 ?auto_207840 ) ) ( not ( = ?auto_207843 ?auto_207841 ) ) ( not ( = ?auto_207843 ?auto_207840 ) ) ( not ( = ?auto_207841 ?auto_207840 ) ) ( not ( = ?auto_207844 ?auto_207839 ) ) ( not ( = ?auto_207844 ?auto_207845 ) ) ( not ( = ?auto_207844 ?auto_207840 ) ) ( not ( = ?auto_207839 ?auto_207845 ) ) ( not ( = ?auto_207839 ?auto_207840 ) ) ( not ( = ?auto_207845 ?auto_207840 ) ) ( not ( = ?auto_207837 ?auto_207845 ) ) ( not ( = ?auto_207837 ?auto_207844 ) ) ( not ( = ?auto_207837 ?auto_207839 ) ) ( not ( = ?auto_207838 ?auto_207845 ) ) ( not ( = ?auto_207838 ?auto_207844 ) ) ( not ( = ?auto_207838 ?auto_207839 ) ) ( not ( = ?auto_207843 ?auto_207845 ) ) ( not ( = ?auto_207843 ?auto_207844 ) ) ( not ( = ?auto_207843 ?auto_207839 ) ) ( not ( = ?auto_207841 ?auto_207845 ) ) ( not ( = ?auto_207841 ?auto_207844 ) ) ( not ( = ?auto_207841 ?auto_207839 ) ) ( ON ?auto_207844 ?auto_207842 ) ( not ( = ?auto_207837 ?auto_207842 ) ) ( not ( = ?auto_207838 ?auto_207842 ) ) ( not ( = ?auto_207843 ?auto_207842 ) ) ( not ( = ?auto_207841 ?auto_207842 ) ) ( not ( = ?auto_207840 ?auto_207842 ) ) ( not ( = ?auto_207844 ?auto_207842 ) ) ( not ( = ?auto_207839 ?auto_207842 ) ) ( not ( = ?auto_207845 ?auto_207842 ) ) ( ON ?auto_207839 ?auto_207844 ) ( ON-TABLE ?auto_207842 ) ( ON ?auto_207845 ?auto_207839 ) ( ON ?auto_207840 ?auto_207845 ) ( ON ?auto_207841 ?auto_207840 ) ( ON ?auto_207843 ?auto_207841 ) ( ON ?auto_207838 ?auto_207843 ) ( CLEAR ?auto_207838 ) ( HOLDING ?auto_207837 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_207837 )
      ( MAKE-2PILE ?auto_207837 ?auto_207838 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_207846 - BLOCK
      ?auto_207847 - BLOCK
    )
    :vars
    (
      ?auto_207852 - BLOCK
      ?auto_207851 - BLOCK
      ?auto_207854 - BLOCK
      ?auto_207853 - BLOCK
      ?auto_207849 - BLOCK
      ?auto_207848 - BLOCK
      ?auto_207850 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_207846 ?auto_207847 ) ) ( not ( = ?auto_207846 ?auto_207852 ) ) ( not ( = ?auto_207847 ?auto_207852 ) ) ( not ( = ?auto_207846 ?auto_207851 ) ) ( not ( = ?auto_207846 ?auto_207854 ) ) ( not ( = ?auto_207847 ?auto_207851 ) ) ( not ( = ?auto_207847 ?auto_207854 ) ) ( not ( = ?auto_207852 ?auto_207851 ) ) ( not ( = ?auto_207852 ?auto_207854 ) ) ( not ( = ?auto_207851 ?auto_207854 ) ) ( not ( = ?auto_207853 ?auto_207849 ) ) ( not ( = ?auto_207853 ?auto_207848 ) ) ( not ( = ?auto_207853 ?auto_207854 ) ) ( not ( = ?auto_207849 ?auto_207848 ) ) ( not ( = ?auto_207849 ?auto_207854 ) ) ( not ( = ?auto_207848 ?auto_207854 ) ) ( not ( = ?auto_207846 ?auto_207848 ) ) ( not ( = ?auto_207846 ?auto_207853 ) ) ( not ( = ?auto_207846 ?auto_207849 ) ) ( not ( = ?auto_207847 ?auto_207848 ) ) ( not ( = ?auto_207847 ?auto_207853 ) ) ( not ( = ?auto_207847 ?auto_207849 ) ) ( not ( = ?auto_207852 ?auto_207848 ) ) ( not ( = ?auto_207852 ?auto_207853 ) ) ( not ( = ?auto_207852 ?auto_207849 ) ) ( not ( = ?auto_207851 ?auto_207848 ) ) ( not ( = ?auto_207851 ?auto_207853 ) ) ( not ( = ?auto_207851 ?auto_207849 ) ) ( ON ?auto_207853 ?auto_207850 ) ( not ( = ?auto_207846 ?auto_207850 ) ) ( not ( = ?auto_207847 ?auto_207850 ) ) ( not ( = ?auto_207852 ?auto_207850 ) ) ( not ( = ?auto_207851 ?auto_207850 ) ) ( not ( = ?auto_207854 ?auto_207850 ) ) ( not ( = ?auto_207853 ?auto_207850 ) ) ( not ( = ?auto_207849 ?auto_207850 ) ) ( not ( = ?auto_207848 ?auto_207850 ) ) ( ON ?auto_207849 ?auto_207853 ) ( ON-TABLE ?auto_207850 ) ( ON ?auto_207848 ?auto_207849 ) ( ON ?auto_207854 ?auto_207848 ) ( ON ?auto_207851 ?auto_207854 ) ( ON ?auto_207852 ?auto_207851 ) ( ON ?auto_207847 ?auto_207852 ) ( ON ?auto_207846 ?auto_207847 ) ( CLEAR ?auto_207846 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_207850 ?auto_207853 ?auto_207849 ?auto_207848 ?auto_207854 ?auto_207851 ?auto_207852 ?auto_207847 )
      ( MAKE-2PILE ?auto_207846 ?auto_207847 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_207861 - BLOCK
      ?auto_207862 - BLOCK
      ?auto_207863 - BLOCK
      ?auto_207864 - BLOCK
      ?auto_207865 - BLOCK
      ?auto_207866 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_207866 ) ( CLEAR ?auto_207865 ) ( ON-TABLE ?auto_207861 ) ( ON ?auto_207862 ?auto_207861 ) ( ON ?auto_207863 ?auto_207862 ) ( ON ?auto_207864 ?auto_207863 ) ( ON ?auto_207865 ?auto_207864 ) ( not ( = ?auto_207861 ?auto_207862 ) ) ( not ( = ?auto_207861 ?auto_207863 ) ) ( not ( = ?auto_207861 ?auto_207864 ) ) ( not ( = ?auto_207861 ?auto_207865 ) ) ( not ( = ?auto_207861 ?auto_207866 ) ) ( not ( = ?auto_207862 ?auto_207863 ) ) ( not ( = ?auto_207862 ?auto_207864 ) ) ( not ( = ?auto_207862 ?auto_207865 ) ) ( not ( = ?auto_207862 ?auto_207866 ) ) ( not ( = ?auto_207863 ?auto_207864 ) ) ( not ( = ?auto_207863 ?auto_207865 ) ) ( not ( = ?auto_207863 ?auto_207866 ) ) ( not ( = ?auto_207864 ?auto_207865 ) ) ( not ( = ?auto_207864 ?auto_207866 ) ) ( not ( = ?auto_207865 ?auto_207866 ) ) )
    :subtasks
    ( ( !STACK ?auto_207866 ?auto_207865 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_207867 - BLOCK
      ?auto_207868 - BLOCK
      ?auto_207869 - BLOCK
      ?auto_207870 - BLOCK
      ?auto_207871 - BLOCK
      ?auto_207872 - BLOCK
    )
    :vars
    (
      ?auto_207873 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_207871 ) ( ON-TABLE ?auto_207867 ) ( ON ?auto_207868 ?auto_207867 ) ( ON ?auto_207869 ?auto_207868 ) ( ON ?auto_207870 ?auto_207869 ) ( ON ?auto_207871 ?auto_207870 ) ( not ( = ?auto_207867 ?auto_207868 ) ) ( not ( = ?auto_207867 ?auto_207869 ) ) ( not ( = ?auto_207867 ?auto_207870 ) ) ( not ( = ?auto_207867 ?auto_207871 ) ) ( not ( = ?auto_207867 ?auto_207872 ) ) ( not ( = ?auto_207868 ?auto_207869 ) ) ( not ( = ?auto_207868 ?auto_207870 ) ) ( not ( = ?auto_207868 ?auto_207871 ) ) ( not ( = ?auto_207868 ?auto_207872 ) ) ( not ( = ?auto_207869 ?auto_207870 ) ) ( not ( = ?auto_207869 ?auto_207871 ) ) ( not ( = ?auto_207869 ?auto_207872 ) ) ( not ( = ?auto_207870 ?auto_207871 ) ) ( not ( = ?auto_207870 ?auto_207872 ) ) ( not ( = ?auto_207871 ?auto_207872 ) ) ( ON ?auto_207872 ?auto_207873 ) ( CLEAR ?auto_207872 ) ( HAND-EMPTY ) ( not ( = ?auto_207867 ?auto_207873 ) ) ( not ( = ?auto_207868 ?auto_207873 ) ) ( not ( = ?auto_207869 ?auto_207873 ) ) ( not ( = ?auto_207870 ?auto_207873 ) ) ( not ( = ?auto_207871 ?auto_207873 ) ) ( not ( = ?auto_207872 ?auto_207873 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_207872 ?auto_207873 )
      ( MAKE-6PILE ?auto_207867 ?auto_207868 ?auto_207869 ?auto_207870 ?auto_207871 ?auto_207872 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_207874 - BLOCK
      ?auto_207875 - BLOCK
      ?auto_207876 - BLOCK
      ?auto_207877 - BLOCK
      ?auto_207878 - BLOCK
      ?auto_207879 - BLOCK
    )
    :vars
    (
      ?auto_207880 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_207874 ) ( ON ?auto_207875 ?auto_207874 ) ( ON ?auto_207876 ?auto_207875 ) ( ON ?auto_207877 ?auto_207876 ) ( not ( = ?auto_207874 ?auto_207875 ) ) ( not ( = ?auto_207874 ?auto_207876 ) ) ( not ( = ?auto_207874 ?auto_207877 ) ) ( not ( = ?auto_207874 ?auto_207878 ) ) ( not ( = ?auto_207874 ?auto_207879 ) ) ( not ( = ?auto_207875 ?auto_207876 ) ) ( not ( = ?auto_207875 ?auto_207877 ) ) ( not ( = ?auto_207875 ?auto_207878 ) ) ( not ( = ?auto_207875 ?auto_207879 ) ) ( not ( = ?auto_207876 ?auto_207877 ) ) ( not ( = ?auto_207876 ?auto_207878 ) ) ( not ( = ?auto_207876 ?auto_207879 ) ) ( not ( = ?auto_207877 ?auto_207878 ) ) ( not ( = ?auto_207877 ?auto_207879 ) ) ( not ( = ?auto_207878 ?auto_207879 ) ) ( ON ?auto_207879 ?auto_207880 ) ( CLEAR ?auto_207879 ) ( not ( = ?auto_207874 ?auto_207880 ) ) ( not ( = ?auto_207875 ?auto_207880 ) ) ( not ( = ?auto_207876 ?auto_207880 ) ) ( not ( = ?auto_207877 ?auto_207880 ) ) ( not ( = ?auto_207878 ?auto_207880 ) ) ( not ( = ?auto_207879 ?auto_207880 ) ) ( HOLDING ?auto_207878 ) ( CLEAR ?auto_207877 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_207874 ?auto_207875 ?auto_207876 ?auto_207877 ?auto_207878 )
      ( MAKE-6PILE ?auto_207874 ?auto_207875 ?auto_207876 ?auto_207877 ?auto_207878 ?auto_207879 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_207881 - BLOCK
      ?auto_207882 - BLOCK
      ?auto_207883 - BLOCK
      ?auto_207884 - BLOCK
      ?auto_207885 - BLOCK
      ?auto_207886 - BLOCK
    )
    :vars
    (
      ?auto_207887 - BLOCK
      ?auto_207888 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_207881 ) ( ON ?auto_207882 ?auto_207881 ) ( ON ?auto_207883 ?auto_207882 ) ( ON ?auto_207884 ?auto_207883 ) ( not ( = ?auto_207881 ?auto_207882 ) ) ( not ( = ?auto_207881 ?auto_207883 ) ) ( not ( = ?auto_207881 ?auto_207884 ) ) ( not ( = ?auto_207881 ?auto_207885 ) ) ( not ( = ?auto_207881 ?auto_207886 ) ) ( not ( = ?auto_207882 ?auto_207883 ) ) ( not ( = ?auto_207882 ?auto_207884 ) ) ( not ( = ?auto_207882 ?auto_207885 ) ) ( not ( = ?auto_207882 ?auto_207886 ) ) ( not ( = ?auto_207883 ?auto_207884 ) ) ( not ( = ?auto_207883 ?auto_207885 ) ) ( not ( = ?auto_207883 ?auto_207886 ) ) ( not ( = ?auto_207884 ?auto_207885 ) ) ( not ( = ?auto_207884 ?auto_207886 ) ) ( not ( = ?auto_207885 ?auto_207886 ) ) ( ON ?auto_207886 ?auto_207887 ) ( not ( = ?auto_207881 ?auto_207887 ) ) ( not ( = ?auto_207882 ?auto_207887 ) ) ( not ( = ?auto_207883 ?auto_207887 ) ) ( not ( = ?auto_207884 ?auto_207887 ) ) ( not ( = ?auto_207885 ?auto_207887 ) ) ( not ( = ?auto_207886 ?auto_207887 ) ) ( CLEAR ?auto_207884 ) ( ON ?auto_207885 ?auto_207886 ) ( CLEAR ?auto_207885 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_207888 ) ( ON ?auto_207887 ?auto_207888 ) ( not ( = ?auto_207888 ?auto_207887 ) ) ( not ( = ?auto_207888 ?auto_207886 ) ) ( not ( = ?auto_207888 ?auto_207885 ) ) ( not ( = ?auto_207881 ?auto_207888 ) ) ( not ( = ?auto_207882 ?auto_207888 ) ) ( not ( = ?auto_207883 ?auto_207888 ) ) ( not ( = ?auto_207884 ?auto_207888 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_207888 ?auto_207887 ?auto_207886 )
      ( MAKE-6PILE ?auto_207881 ?auto_207882 ?auto_207883 ?auto_207884 ?auto_207885 ?auto_207886 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_207889 - BLOCK
      ?auto_207890 - BLOCK
      ?auto_207891 - BLOCK
      ?auto_207892 - BLOCK
      ?auto_207893 - BLOCK
      ?auto_207894 - BLOCK
    )
    :vars
    (
      ?auto_207896 - BLOCK
      ?auto_207895 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_207889 ) ( ON ?auto_207890 ?auto_207889 ) ( ON ?auto_207891 ?auto_207890 ) ( not ( = ?auto_207889 ?auto_207890 ) ) ( not ( = ?auto_207889 ?auto_207891 ) ) ( not ( = ?auto_207889 ?auto_207892 ) ) ( not ( = ?auto_207889 ?auto_207893 ) ) ( not ( = ?auto_207889 ?auto_207894 ) ) ( not ( = ?auto_207890 ?auto_207891 ) ) ( not ( = ?auto_207890 ?auto_207892 ) ) ( not ( = ?auto_207890 ?auto_207893 ) ) ( not ( = ?auto_207890 ?auto_207894 ) ) ( not ( = ?auto_207891 ?auto_207892 ) ) ( not ( = ?auto_207891 ?auto_207893 ) ) ( not ( = ?auto_207891 ?auto_207894 ) ) ( not ( = ?auto_207892 ?auto_207893 ) ) ( not ( = ?auto_207892 ?auto_207894 ) ) ( not ( = ?auto_207893 ?auto_207894 ) ) ( ON ?auto_207894 ?auto_207896 ) ( not ( = ?auto_207889 ?auto_207896 ) ) ( not ( = ?auto_207890 ?auto_207896 ) ) ( not ( = ?auto_207891 ?auto_207896 ) ) ( not ( = ?auto_207892 ?auto_207896 ) ) ( not ( = ?auto_207893 ?auto_207896 ) ) ( not ( = ?auto_207894 ?auto_207896 ) ) ( ON ?auto_207893 ?auto_207894 ) ( CLEAR ?auto_207893 ) ( ON-TABLE ?auto_207895 ) ( ON ?auto_207896 ?auto_207895 ) ( not ( = ?auto_207895 ?auto_207896 ) ) ( not ( = ?auto_207895 ?auto_207894 ) ) ( not ( = ?auto_207895 ?auto_207893 ) ) ( not ( = ?auto_207889 ?auto_207895 ) ) ( not ( = ?auto_207890 ?auto_207895 ) ) ( not ( = ?auto_207891 ?auto_207895 ) ) ( not ( = ?auto_207892 ?auto_207895 ) ) ( HOLDING ?auto_207892 ) ( CLEAR ?auto_207891 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_207889 ?auto_207890 ?auto_207891 ?auto_207892 )
      ( MAKE-6PILE ?auto_207889 ?auto_207890 ?auto_207891 ?auto_207892 ?auto_207893 ?auto_207894 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_207897 - BLOCK
      ?auto_207898 - BLOCK
      ?auto_207899 - BLOCK
      ?auto_207900 - BLOCK
      ?auto_207901 - BLOCK
      ?auto_207902 - BLOCK
    )
    :vars
    (
      ?auto_207903 - BLOCK
      ?auto_207904 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_207897 ) ( ON ?auto_207898 ?auto_207897 ) ( ON ?auto_207899 ?auto_207898 ) ( not ( = ?auto_207897 ?auto_207898 ) ) ( not ( = ?auto_207897 ?auto_207899 ) ) ( not ( = ?auto_207897 ?auto_207900 ) ) ( not ( = ?auto_207897 ?auto_207901 ) ) ( not ( = ?auto_207897 ?auto_207902 ) ) ( not ( = ?auto_207898 ?auto_207899 ) ) ( not ( = ?auto_207898 ?auto_207900 ) ) ( not ( = ?auto_207898 ?auto_207901 ) ) ( not ( = ?auto_207898 ?auto_207902 ) ) ( not ( = ?auto_207899 ?auto_207900 ) ) ( not ( = ?auto_207899 ?auto_207901 ) ) ( not ( = ?auto_207899 ?auto_207902 ) ) ( not ( = ?auto_207900 ?auto_207901 ) ) ( not ( = ?auto_207900 ?auto_207902 ) ) ( not ( = ?auto_207901 ?auto_207902 ) ) ( ON ?auto_207902 ?auto_207903 ) ( not ( = ?auto_207897 ?auto_207903 ) ) ( not ( = ?auto_207898 ?auto_207903 ) ) ( not ( = ?auto_207899 ?auto_207903 ) ) ( not ( = ?auto_207900 ?auto_207903 ) ) ( not ( = ?auto_207901 ?auto_207903 ) ) ( not ( = ?auto_207902 ?auto_207903 ) ) ( ON ?auto_207901 ?auto_207902 ) ( ON-TABLE ?auto_207904 ) ( ON ?auto_207903 ?auto_207904 ) ( not ( = ?auto_207904 ?auto_207903 ) ) ( not ( = ?auto_207904 ?auto_207902 ) ) ( not ( = ?auto_207904 ?auto_207901 ) ) ( not ( = ?auto_207897 ?auto_207904 ) ) ( not ( = ?auto_207898 ?auto_207904 ) ) ( not ( = ?auto_207899 ?auto_207904 ) ) ( not ( = ?auto_207900 ?auto_207904 ) ) ( CLEAR ?auto_207899 ) ( ON ?auto_207900 ?auto_207901 ) ( CLEAR ?auto_207900 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_207904 ?auto_207903 ?auto_207902 ?auto_207901 )
      ( MAKE-6PILE ?auto_207897 ?auto_207898 ?auto_207899 ?auto_207900 ?auto_207901 ?auto_207902 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_207905 - BLOCK
      ?auto_207906 - BLOCK
      ?auto_207907 - BLOCK
      ?auto_207908 - BLOCK
      ?auto_207909 - BLOCK
      ?auto_207910 - BLOCK
    )
    :vars
    (
      ?auto_207911 - BLOCK
      ?auto_207912 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_207905 ) ( ON ?auto_207906 ?auto_207905 ) ( not ( = ?auto_207905 ?auto_207906 ) ) ( not ( = ?auto_207905 ?auto_207907 ) ) ( not ( = ?auto_207905 ?auto_207908 ) ) ( not ( = ?auto_207905 ?auto_207909 ) ) ( not ( = ?auto_207905 ?auto_207910 ) ) ( not ( = ?auto_207906 ?auto_207907 ) ) ( not ( = ?auto_207906 ?auto_207908 ) ) ( not ( = ?auto_207906 ?auto_207909 ) ) ( not ( = ?auto_207906 ?auto_207910 ) ) ( not ( = ?auto_207907 ?auto_207908 ) ) ( not ( = ?auto_207907 ?auto_207909 ) ) ( not ( = ?auto_207907 ?auto_207910 ) ) ( not ( = ?auto_207908 ?auto_207909 ) ) ( not ( = ?auto_207908 ?auto_207910 ) ) ( not ( = ?auto_207909 ?auto_207910 ) ) ( ON ?auto_207910 ?auto_207911 ) ( not ( = ?auto_207905 ?auto_207911 ) ) ( not ( = ?auto_207906 ?auto_207911 ) ) ( not ( = ?auto_207907 ?auto_207911 ) ) ( not ( = ?auto_207908 ?auto_207911 ) ) ( not ( = ?auto_207909 ?auto_207911 ) ) ( not ( = ?auto_207910 ?auto_207911 ) ) ( ON ?auto_207909 ?auto_207910 ) ( ON-TABLE ?auto_207912 ) ( ON ?auto_207911 ?auto_207912 ) ( not ( = ?auto_207912 ?auto_207911 ) ) ( not ( = ?auto_207912 ?auto_207910 ) ) ( not ( = ?auto_207912 ?auto_207909 ) ) ( not ( = ?auto_207905 ?auto_207912 ) ) ( not ( = ?auto_207906 ?auto_207912 ) ) ( not ( = ?auto_207907 ?auto_207912 ) ) ( not ( = ?auto_207908 ?auto_207912 ) ) ( ON ?auto_207908 ?auto_207909 ) ( CLEAR ?auto_207908 ) ( HOLDING ?auto_207907 ) ( CLEAR ?auto_207906 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_207905 ?auto_207906 ?auto_207907 )
      ( MAKE-6PILE ?auto_207905 ?auto_207906 ?auto_207907 ?auto_207908 ?auto_207909 ?auto_207910 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_207913 - BLOCK
      ?auto_207914 - BLOCK
      ?auto_207915 - BLOCK
      ?auto_207916 - BLOCK
      ?auto_207917 - BLOCK
      ?auto_207918 - BLOCK
    )
    :vars
    (
      ?auto_207919 - BLOCK
      ?auto_207920 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_207913 ) ( ON ?auto_207914 ?auto_207913 ) ( not ( = ?auto_207913 ?auto_207914 ) ) ( not ( = ?auto_207913 ?auto_207915 ) ) ( not ( = ?auto_207913 ?auto_207916 ) ) ( not ( = ?auto_207913 ?auto_207917 ) ) ( not ( = ?auto_207913 ?auto_207918 ) ) ( not ( = ?auto_207914 ?auto_207915 ) ) ( not ( = ?auto_207914 ?auto_207916 ) ) ( not ( = ?auto_207914 ?auto_207917 ) ) ( not ( = ?auto_207914 ?auto_207918 ) ) ( not ( = ?auto_207915 ?auto_207916 ) ) ( not ( = ?auto_207915 ?auto_207917 ) ) ( not ( = ?auto_207915 ?auto_207918 ) ) ( not ( = ?auto_207916 ?auto_207917 ) ) ( not ( = ?auto_207916 ?auto_207918 ) ) ( not ( = ?auto_207917 ?auto_207918 ) ) ( ON ?auto_207918 ?auto_207919 ) ( not ( = ?auto_207913 ?auto_207919 ) ) ( not ( = ?auto_207914 ?auto_207919 ) ) ( not ( = ?auto_207915 ?auto_207919 ) ) ( not ( = ?auto_207916 ?auto_207919 ) ) ( not ( = ?auto_207917 ?auto_207919 ) ) ( not ( = ?auto_207918 ?auto_207919 ) ) ( ON ?auto_207917 ?auto_207918 ) ( ON-TABLE ?auto_207920 ) ( ON ?auto_207919 ?auto_207920 ) ( not ( = ?auto_207920 ?auto_207919 ) ) ( not ( = ?auto_207920 ?auto_207918 ) ) ( not ( = ?auto_207920 ?auto_207917 ) ) ( not ( = ?auto_207913 ?auto_207920 ) ) ( not ( = ?auto_207914 ?auto_207920 ) ) ( not ( = ?auto_207915 ?auto_207920 ) ) ( not ( = ?auto_207916 ?auto_207920 ) ) ( ON ?auto_207916 ?auto_207917 ) ( CLEAR ?auto_207914 ) ( ON ?auto_207915 ?auto_207916 ) ( CLEAR ?auto_207915 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_207920 ?auto_207919 ?auto_207918 ?auto_207917 ?auto_207916 )
      ( MAKE-6PILE ?auto_207913 ?auto_207914 ?auto_207915 ?auto_207916 ?auto_207917 ?auto_207918 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_207921 - BLOCK
      ?auto_207922 - BLOCK
      ?auto_207923 - BLOCK
      ?auto_207924 - BLOCK
      ?auto_207925 - BLOCK
      ?auto_207926 - BLOCK
    )
    :vars
    (
      ?auto_207928 - BLOCK
      ?auto_207927 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_207921 ) ( not ( = ?auto_207921 ?auto_207922 ) ) ( not ( = ?auto_207921 ?auto_207923 ) ) ( not ( = ?auto_207921 ?auto_207924 ) ) ( not ( = ?auto_207921 ?auto_207925 ) ) ( not ( = ?auto_207921 ?auto_207926 ) ) ( not ( = ?auto_207922 ?auto_207923 ) ) ( not ( = ?auto_207922 ?auto_207924 ) ) ( not ( = ?auto_207922 ?auto_207925 ) ) ( not ( = ?auto_207922 ?auto_207926 ) ) ( not ( = ?auto_207923 ?auto_207924 ) ) ( not ( = ?auto_207923 ?auto_207925 ) ) ( not ( = ?auto_207923 ?auto_207926 ) ) ( not ( = ?auto_207924 ?auto_207925 ) ) ( not ( = ?auto_207924 ?auto_207926 ) ) ( not ( = ?auto_207925 ?auto_207926 ) ) ( ON ?auto_207926 ?auto_207928 ) ( not ( = ?auto_207921 ?auto_207928 ) ) ( not ( = ?auto_207922 ?auto_207928 ) ) ( not ( = ?auto_207923 ?auto_207928 ) ) ( not ( = ?auto_207924 ?auto_207928 ) ) ( not ( = ?auto_207925 ?auto_207928 ) ) ( not ( = ?auto_207926 ?auto_207928 ) ) ( ON ?auto_207925 ?auto_207926 ) ( ON-TABLE ?auto_207927 ) ( ON ?auto_207928 ?auto_207927 ) ( not ( = ?auto_207927 ?auto_207928 ) ) ( not ( = ?auto_207927 ?auto_207926 ) ) ( not ( = ?auto_207927 ?auto_207925 ) ) ( not ( = ?auto_207921 ?auto_207927 ) ) ( not ( = ?auto_207922 ?auto_207927 ) ) ( not ( = ?auto_207923 ?auto_207927 ) ) ( not ( = ?auto_207924 ?auto_207927 ) ) ( ON ?auto_207924 ?auto_207925 ) ( ON ?auto_207923 ?auto_207924 ) ( CLEAR ?auto_207923 ) ( HOLDING ?auto_207922 ) ( CLEAR ?auto_207921 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_207921 ?auto_207922 )
      ( MAKE-6PILE ?auto_207921 ?auto_207922 ?auto_207923 ?auto_207924 ?auto_207925 ?auto_207926 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_207929 - BLOCK
      ?auto_207930 - BLOCK
      ?auto_207931 - BLOCK
      ?auto_207932 - BLOCK
      ?auto_207933 - BLOCK
      ?auto_207934 - BLOCK
    )
    :vars
    (
      ?auto_207935 - BLOCK
      ?auto_207936 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_207929 ) ( not ( = ?auto_207929 ?auto_207930 ) ) ( not ( = ?auto_207929 ?auto_207931 ) ) ( not ( = ?auto_207929 ?auto_207932 ) ) ( not ( = ?auto_207929 ?auto_207933 ) ) ( not ( = ?auto_207929 ?auto_207934 ) ) ( not ( = ?auto_207930 ?auto_207931 ) ) ( not ( = ?auto_207930 ?auto_207932 ) ) ( not ( = ?auto_207930 ?auto_207933 ) ) ( not ( = ?auto_207930 ?auto_207934 ) ) ( not ( = ?auto_207931 ?auto_207932 ) ) ( not ( = ?auto_207931 ?auto_207933 ) ) ( not ( = ?auto_207931 ?auto_207934 ) ) ( not ( = ?auto_207932 ?auto_207933 ) ) ( not ( = ?auto_207932 ?auto_207934 ) ) ( not ( = ?auto_207933 ?auto_207934 ) ) ( ON ?auto_207934 ?auto_207935 ) ( not ( = ?auto_207929 ?auto_207935 ) ) ( not ( = ?auto_207930 ?auto_207935 ) ) ( not ( = ?auto_207931 ?auto_207935 ) ) ( not ( = ?auto_207932 ?auto_207935 ) ) ( not ( = ?auto_207933 ?auto_207935 ) ) ( not ( = ?auto_207934 ?auto_207935 ) ) ( ON ?auto_207933 ?auto_207934 ) ( ON-TABLE ?auto_207936 ) ( ON ?auto_207935 ?auto_207936 ) ( not ( = ?auto_207936 ?auto_207935 ) ) ( not ( = ?auto_207936 ?auto_207934 ) ) ( not ( = ?auto_207936 ?auto_207933 ) ) ( not ( = ?auto_207929 ?auto_207936 ) ) ( not ( = ?auto_207930 ?auto_207936 ) ) ( not ( = ?auto_207931 ?auto_207936 ) ) ( not ( = ?auto_207932 ?auto_207936 ) ) ( ON ?auto_207932 ?auto_207933 ) ( ON ?auto_207931 ?auto_207932 ) ( CLEAR ?auto_207929 ) ( ON ?auto_207930 ?auto_207931 ) ( CLEAR ?auto_207930 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_207936 ?auto_207935 ?auto_207934 ?auto_207933 ?auto_207932 ?auto_207931 )
      ( MAKE-6PILE ?auto_207929 ?auto_207930 ?auto_207931 ?auto_207932 ?auto_207933 ?auto_207934 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_207937 - BLOCK
      ?auto_207938 - BLOCK
      ?auto_207939 - BLOCK
      ?auto_207940 - BLOCK
      ?auto_207941 - BLOCK
      ?auto_207942 - BLOCK
    )
    :vars
    (
      ?auto_207944 - BLOCK
      ?auto_207943 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_207937 ?auto_207938 ) ) ( not ( = ?auto_207937 ?auto_207939 ) ) ( not ( = ?auto_207937 ?auto_207940 ) ) ( not ( = ?auto_207937 ?auto_207941 ) ) ( not ( = ?auto_207937 ?auto_207942 ) ) ( not ( = ?auto_207938 ?auto_207939 ) ) ( not ( = ?auto_207938 ?auto_207940 ) ) ( not ( = ?auto_207938 ?auto_207941 ) ) ( not ( = ?auto_207938 ?auto_207942 ) ) ( not ( = ?auto_207939 ?auto_207940 ) ) ( not ( = ?auto_207939 ?auto_207941 ) ) ( not ( = ?auto_207939 ?auto_207942 ) ) ( not ( = ?auto_207940 ?auto_207941 ) ) ( not ( = ?auto_207940 ?auto_207942 ) ) ( not ( = ?auto_207941 ?auto_207942 ) ) ( ON ?auto_207942 ?auto_207944 ) ( not ( = ?auto_207937 ?auto_207944 ) ) ( not ( = ?auto_207938 ?auto_207944 ) ) ( not ( = ?auto_207939 ?auto_207944 ) ) ( not ( = ?auto_207940 ?auto_207944 ) ) ( not ( = ?auto_207941 ?auto_207944 ) ) ( not ( = ?auto_207942 ?auto_207944 ) ) ( ON ?auto_207941 ?auto_207942 ) ( ON-TABLE ?auto_207943 ) ( ON ?auto_207944 ?auto_207943 ) ( not ( = ?auto_207943 ?auto_207944 ) ) ( not ( = ?auto_207943 ?auto_207942 ) ) ( not ( = ?auto_207943 ?auto_207941 ) ) ( not ( = ?auto_207937 ?auto_207943 ) ) ( not ( = ?auto_207938 ?auto_207943 ) ) ( not ( = ?auto_207939 ?auto_207943 ) ) ( not ( = ?auto_207940 ?auto_207943 ) ) ( ON ?auto_207940 ?auto_207941 ) ( ON ?auto_207939 ?auto_207940 ) ( ON ?auto_207938 ?auto_207939 ) ( CLEAR ?auto_207938 ) ( HOLDING ?auto_207937 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_207937 )
      ( MAKE-6PILE ?auto_207937 ?auto_207938 ?auto_207939 ?auto_207940 ?auto_207941 ?auto_207942 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_207945 - BLOCK
      ?auto_207946 - BLOCK
      ?auto_207947 - BLOCK
      ?auto_207948 - BLOCK
      ?auto_207949 - BLOCK
      ?auto_207950 - BLOCK
    )
    :vars
    (
      ?auto_207951 - BLOCK
      ?auto_207952 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_207945 ?auto_207946 ) ) ( not ( = ?auto_207945 ?auto_207947 ) ) ( not ( = ?auto_207945 ?auto_207948 ) ) ( not ( = ?auto_207945 ?auto_207949 ) ) ( not ( = ?auto_207945 ?auto_207950 ) ) ( not ( = ?auto_207946 ?auto_207947 ) ) ( not ( = ?auto_207946 ?auto_207948 ) ) ( not ( = ?auto_207946 ?auto_207949 ) ) ( not ( = ?auto_207946 ?auto_207950 ) ) ( not ( = ?auto_207947 ?auto_207948 ) ) ( not ( = ?auto_207947 ?auto_207949 ) ) ( not ( = ?auto_207947 ?auto_207950 ) ) ( not ( = ?auto_207948 ?auto_207949 ) ) ( not ( = ?auto_207948 ?auto_207950 ) ) ( not ( = ?auto_207949 ?auto_207950 ) ) ( ON ?auto_207950 ?auto_207951 ) ( not ( = ?auto_207945 ?auto_207951 ) ) ( not ( = ?auto_207946 ?auto_207951 ) ) ( not ( = ?auto_207947 ?auto_207951 ) ) ( not ( = ?auto_207948 ?auto_207951 ) ) ( not ( = ?auto_207949 ?auto_207951 ) ) ( not ( = ?auto_207950 ?auto_207951 ) ) ( ON ?auto_207949 ?auto_207950 ) ( ON-TABLE ?auto_207952 ) ( ON ?auto_207951 ?auto_207952 ) ( not ( = ?auto_207952 ?auto_207951 ) ) ( not ( = ?auto_207952 ?auto_207950 ) ) ( not ( = ?auto_207952 ?auto_207949 ) ) ( not ( = ?auto_207945 ?auto_207952 ) ) ( not ( = ?auto_207946 ?auto_207952 ) ) ( not ( = ?auto_207947 ?auto_207952 ) ) ( not ( = ?auto_207948 ?auto_207952 ) ) ( ON ?auto_207948 ?auto_207949 ) ( ON ?auto_207947 ?auto_207948 ) ( ON ?auto_207946 ?auto_207947 ) ( ON ?auto_207945 ?auto_207946 ) ( CLEAR ?auto_207945 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_207952 ?auto_207951 ?auto_207950 ?auto_207949 ?auto_207948 ?auto_207947 ?auto_207946 )
      ( MAKE-6PILE ?auto_207945 ?auto_207946 ?auto_207947 ?auto_207948 ?auto_207949 ?auto_207950 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_207953 - BLOCK
      ?auto_207954 - BLOCK
      ?auto_207955 - BLOCK
      ?auto_207956 - BLOCK
      ?auto_207957 - BLOCK
      ?auto_207958 - BLOCK
    )
    :vars
    (
      ?auto_207960 - BLOCK
      ?auto_207959 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_207953 ?auto_207954 ) ) ( not ( = ?auto_207953 ?auto_207955 ) ) ( not ( = ?auto_207953 ?auto_207956 ) ) ( not ( = ?auto_207953 ?auto_207957 ) ) ( not ( = ?auto_207953 ?auto_207958 ) ) ( not ( = ?auto_207954 ?auto_207955 ) ) ( not ( = ?auto_207954 ?auto_207956 ) ) ( not ( = ?auto_207954 ?auto_207957 ) ) ( not ( = ?auto_207954 ?auto_207958 ) ) ( not ( = ?auto_207955 ?auto_207956 ) ) ( not ( = ?auto_207955 ?auto_207957 ) ) ( not ( = ?auto_207955 ?auto_207958 ) ) ( not ( = ?auto_207956 ?auto_207957 ) ) ( not ( = ?auto_207956 ?auto_207958 ) ) ( not ( = ?auto_207957 ?auto_207958 ) ) ( ON ?auto_207958 ?auto_207960 ) ( not ( = ?auto_207953 ?auto_207960 ) ) ( not ( = ?auto_207954 ?auto_207960 ) ) ( not ( = ?auto_207955 ?auto_207960 ) ) ( not ( = ?auto_207956 ?auto_207960 ) ) ( not ( = ?auto_207957 ?auto_207960 ) ) ( not ( = ?auto_207958 ?auto_207960 ) ) ( ON ?auto_207957 ?auto_207958 ) ( ON-TABLE ?auto_207959 ) ( ON ?auto_207960 ?auto_207959 ) ( not ( = ?auto_207959 ?auto_207960 ) ) ( not ( = ?auto_207959 ?auto_207958 ) ) ( not ( = ?auto_207959 ?auto_207957 ) ) ( not ( = ?auto_207953 ?auto_207959 ) ) ( not ( = ?auto_207954 ?auto_207959 ) ) ( not ( = ?auto_207955 ?auto_207959 ) ) ( not ( = ?auto_207956 ?auto_207959 ) ) ( ON ?auto_207956 ?auto_207957 ) ( ON ?auto_207955 ?auto_207956 ) ( ON ?auto_207954 ?auto_207955 ) ( HOLDING ?auto_207953 ) ( CLEAR ?auto_207954 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_207959 ?auto_207960 ?auto_207958 ?auto_207957 ?auto_207956 ?auto_207955 ?auto_207954 ?auto_207953 )
      ( MAKE-6PILE ?auto_207953 ?auto_207954 ?auto_207955 ?auto_207956 ?auto_207957 ?auto_207958 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_207961 - BLOCK
      ?auto_207962 - BLOCK
      ?auto_207963 - BLOCK
      ?auto_207964 - BLOCK
      ?auto_207965 - BLOCK
      ?auto_207966 - BLOCK
    )
    :vars
    (
      ?auto_207968 - BLOCK
      ?auto_207967 - BLOCK
      ?auto_207969 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_207961 ?auto_207962 ) ) ( not ( = ?auto_207961 ?auto_207963 ) ) ( not ( = ?auto_207961 ?auto_207964 ) ) ( not ( = ?auto_207961 ?auto_207965 ) ) ( not ( = ?auto_207961 ?auto_207966 ) ) ( not ( = ?auto_207962 ?auto_207963 ) ) ( not ( = ?auto_207962 ?auto_207964 ) ) ( not ( = ?auto_207962 ?auto_207965 ) ) ( not ( = ?auto_207962 ?auto_207966 ) ) ( not ( = ?auto_207963 ?auto_207964 ) ) ( not ( = ?auto_207963 ?auto_207965 ) ) ( not ( = ?auto_207963 ?auto_207966 ) ) ( not ( = ?auto_207964 ?auto_207965 ) ) ( not ( = ?auto_207964 ?auto_207966 ) ) ( not ( = ?auto_207965 ?auto_207966 ) ) ( ON ?auto_207966 ?auto_207968 ) ( not ( = ?auto_207961 ?auto_207968 ) ) ( not ( = ?auto_207962 ?auto_207968 ) ) ( not ( = ?auto_207963 ?auto_207968 ) ) ( not ( = ?auto_207964 ?auto_207968 ) ) ( not ( = ?auto_207965 ?auto_207968 ) ) ( not ( = ?auto_207966 ?auto_207968 ) ) ( ON ?auto_207965 ?auto_207966 ) ( ON-TABLE ?auto_207967 ) ( ON ?auto_207968 ?auto_207967 ) ( not ( = ?auto_207967 ?auto_207968 ) ) ( not ( = ?auto_207967 ?auto_207966 ) ) ( not ( = ?auto_207967 ?auto_207965 ) ) ( not ( = ?auto_207961 ?auto_207967 ) ) ( not ( = ?auto_207962 ?auto_207967 ) ) ( not ( = ?auto_207963 ?auto_207967 ) ) ( not ( = ?auto_207964 ?auto_207967 ) ) ( ON ?auto_207964 ?auto_207965 ) ( ON ?auto_207963 ?auto_207964 ) ( ON ?auto_207962 ?auto_207963 ) ( CLEAR ?auto_207962 ) ( ON ?auto_207961 ?auto_207969 ) ( CLEAR ?auto_207961 ) ( HAND-EMPTY ) ( not ( = ?auto_207961 ?auto_207969 ) ) ( not ( = ?auto_207962 ?auto_207969 ) ) ( not ( = ?auto_207963 ?auto_207969 ) ) ( not ( = ?auto_207964 ?auto_207969 ) ) ( not ( = ?auto_207965 ?auto_207969 ) ) ( not ( = ?auto_207966 ?auto_207969 ) ) ( not ( = ?auto_207968 ?auto_207969 ) ) ( not ( = ?auto_207967 ?auto_207969 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_207961 ?auto_207969 )
      ( MAKE-6PILE ?auto_207961 ?auto_207962 ?auto_207963 ?auto_207964 ?auto_207965 ?auto_207966 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_207970 - BLOCK
      ?auto_207971 - BLOCK
      ?auto_207972 - BLOCK
      ?auto_207973 - BLOCK
      ?auto_207974 - BLOCK
      ?auto_207975 - BLOCK
    )
    :vars
    (
      ?auto_207977 - BLOCK
      ?auto_207976 - BLOCK
      ?auto_207978 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_207970 ?auto_207971 ) ) ( not ( = ?auto_207970 ?auto_207972 ) ) ( not ( = ?auto_207970 ?auto_207973 ) ) ( not ( = ?auto_207970 ?auto_207974 ) ) ( not ( = ?auto_207970 ?auto_207975 ) ) ( not ( = ?auto_207971 ?auto_207972 ) ) ( not ( = ?auto_207971 ?auto_207973 ) ) ( not ( = ?auto_207971 ?auto_207974 ) ) ( not ( = ?auto_207971 ?auto_207975 ) ) ( not ( = ?auto_207972 ?auto_207973 ) ) ( not ( = ?auto_207972 ?auto_207974 ) ) ( not ( = ?auto_207972 ?auto_207975 ) ) ( not ( = ?auto_207973 ?auto_207974 ) ) ( not ( = ?auto_207973 ?auto_207975 ) ) ( not ( = ?auto_207974 ?auto_207975 ) ) ( ON ?auto_207975 ?auto_207977 ) ( not ( = ?auto_207970 ?auto_207977 ) ) ( not ( = ?auto_207971 ?auto_207977 ) ) ( not ( = ?auto_207972 ?auto_207977 ) ) ( not ( = ?auto_207973 ?auto_207977 ) ) ( not ( = ?auto_207974 ?auto_207977 ) ) ( not ( = ?auto_207975 ?auto_207977 ) ) ( ON ?auto_207974 ?auto_207975 ) ( ON-TABLE ?auto_207976 ) ( ON ?auto_207977 ?auto_207976 ) ( not ( = ?auto_207976 ?auto_207977 ) ) ( not ( = ?auto_207976 ?auto_207975 ) ) ( not ( = ?auto_207976 ?auto_207974 ) ) ( not ( = ?auto_207970 ?auto_207976 ) ) ( not ( = ?auto_207971 ?auto_207976 ) ) ( not ( = ?auto_207972 ?auto_207976 ) ) ( not ( = ?auto_207973 ?auto_207976 ) ) ( ON ?auto_207973 ?auto_207974 ) ( ON ?auto_207972 ?auto_207973 ) ( ON ?auto_207970 ?auto_207978 ) ( CLEAR ?auto_207970 ) ( not ( = ?auto_207970 ?auto_207978 ) ) ( not ( = ?auto_207971 ?auto_207978 ) ) ( not ( = ?auto_207972 ?auto_207978 ) ) ( not ( = ?auto_207973 ?auto_207978 ) ) ( not ( = ?auto_207974 ?auto_207978 ) ) ( not ( = ?auto_207975 ?auto_207978 ) ) ( not ( = ?auto_207977 ?auto_207978 ) ) ( not ( = ?auto_207976 ?auto_207978 ) ) ( HOLDING ?auto_207971 ) ( CLEAR ?auto_207972 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_207976 ?auto_207977 ?auto_207975 ?auto_207974 ?auto_207973 ?auto_207972 ?auto_207971 )
      ( MAKE-6PILE ?auto_207970 ?auto_207971 ?auto_207972 ?auto_207973 ?auto_207974 ?auto_207975 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_207979 - BLOCK
      ?auto_207980 - BLOCK
      ?auto_207981 - BLOCK
      ?auto_207982 - BLOCK
      ?auto_207983 - BLOCK
      ?auto_207984 - BLOCK
    )
    :vars
    (
      ?auto_207987 - BLOCK
      ?auto_207986 - BLOCK
      ?auto_207985 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_207979 ?auto_207980 ) ) ( not ( = ?auto_207979 ?auto_207981 ) ) ( not ( = ?auto_207979 ?auto_207982 ) ) ( not ( = ?auto_207979 ?auto_207983 ) ) ( not ( = ?auto_207979 ?auto_207984 ) ) ( not ( = ?auto_207980 ?auto_207981 ) ) ( not ( = ?auto_207980 ?auto_207982 ) ) ( not ( = ?auto_207980 ?auto_207983 ) ) ( not ( = ?auto_207980 ?auto_207984 ) ) ( not ( = ?auto_207981 ?auto_207982 ) ) ( not ( = ?auto_207981 ?auto_207983 ) ) ( not ( = ?auto_207981 ?auto_207984 ) ) ( not ( = ?auto_207982 ?auto_207983 ) ) ( not ( = ?auto_207982 ?auto_207984 ) ) ( not ( = ?auto_207983 ?auto_207984 ) ) ( ON ?auto_207984 ?auto_207987 ) ( not ( = ?auto_207979 ?auto_207987 ) ) ( not ( = ?auto_207980 ?auto_207987 ) ) ( not ( = ?auto_207981 ?auto_207987 ) ) ( not ( = ?auto_207982 ?auto_207987 ) ) ( not ( = ?auto_207983 ?auto_207987 ) ) ( not ( = ?auto_207984 ?auto_207987 ) ) ( ON ?auto_207983 ?auto_207984 ) ( ON-TABLE ?auto_207986 ) ( ON ?auto_207987 ?auto_207986 ) ( not ( = ?auto_207986 ?auto_207987 ) ) ( not ( = ?auto_207986 ?auto_207984 ) ) ( not ( = ?auto_207986 ?auto_207983 ) ) ( not ( = ?auto_207979 ?auto_207986 ) ) ( not ( = ?auto_207980 ?auto_207986 ) ) ( not ( = ?auto_207981 ?auto_207986 ) ) ( not ( = ?auto_207982 ?auto_207986 ) ) ( ON ?auto_207982 ?auto_207983 ) ( ON ?auto_207981 ?auto_207982 ) ( ON ?auto_207979 ?auto_207985 ) ( not ( = ?auto_207979 ?auto_207985 ) ) ( not ( = ?auto_207980 ?auto_207985 ) ) ( not ( = ?auto_207981 ?auto_207985 ) ) ( not ( = ?auto_207982 ?auto_207985 ) ) ( not ( = ?auto_207983 ?auto_207985 ) ) ( not ( = ?auto_207984 ?auto_207985 ) ) ( not ( = ?auto_207987 ?auto_207985 ) ) ( not ( = ?auto_207986 ?auto_207985 ) ) ( CLEAR ?auto_207981 ) ( ON ?auto_207980 ?auto_207979 ) ( CLEAR ?auto_207980 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_207985 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_207985 ?auto_207979 )
      ( MAKE-6PILE ?auto_207979 ?auto_207980 ?auto_207981 ?auto_207982 ?auto_207983 ?auto_207984 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_207988 - BLOCK
      ?auto_207989 - BLOCK
      ?auto_207990 - BLOCK
      ?auto_207991 - BLOCK
      ?auto_207992 - BLOCK
      ?auto_207993 - BLOCK
    )
    :vars
    (
      ?auto_207994 - BLOCK
      ?auto_207995 - BLOCK
      ?auto_207996 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_207988 ?auto_207989 ) ) ( not ( = ?auto_207988 ?auto_207990 ) ) ( not ( = ?auto_207988 ?auto_207991 ) ) ( not ( = ?auto_207988 ?auto_207992 ) ) ( not ( = ?auto_207988 ?auto_207993 ) ) ( not ( = ?auto_207989 ?auto_207990 ) ) ( not ( = ?auto_207989 ?auto_207991 ) ) ( not ( = ?auto_207989 ?auto_207992 ) ) ( not ( = ?auto_207989 ?auto_207993 ) ) ( not ( = ?auto_207990 ?auto_207991 ) ) ( not ( = ?auto_207990 ?auto_207992 ) ) ( not ( = ?auto_207990 ?auto_207993 ) ) ( not ( = ?auto_207991 ?auto_207992 ) ) ( not ( = ?auto_207991 ?auto_207993 ) ) ( not ( = ?auto_207992 ?auto_207993 ) ) ( ON ?auto_207993 ?auto_207994 ) ( not ( = ?auto_207988 ?auto_207994 ) ) ( not ( = ?auto_207989 ?auto_207994 ) ) ( not ( = ?auto_207990 ?auto_207994 ) ) ( not ( = ?auto_207991 ?auto_207994 ) ) ( not ( = ?auto_207992 ?auto_207994 ) ) ( not ( = ?auto_207993 ?auto_207994 ) ) ( ON ?auto_207992 ?auto_207993 ) ( ON-TABLE ?auto_207995 ) ( ON ?auto_207994 ?auto_207995 ) ( not ( = ?auto_207995 ?auto_207994 ) ) ( not ( = ?auto_207995 ?auto_207993 ) ) ( not ( = ?auto_207995 ?auto_207992 ) ) ( not ( = ?auto_207988 ?auto_207995 ) ) ( not ( = ?auto_207989 ?auto_207995 ) ) ( not ( = ?auto_207990 ?auto_207995 ) ) ( not ( = ?auto_207991 ?auto_207995 ) ) ( ON ?auto_207991 ?auto_207992 ) ( ON ?auto_207988 ?auto_207996 ) ( not ( = ?auto_207988 ?auto_207996 ) ) ( not ( = ?auto_207989 ?auto_207996 ) ) ( not ( = ?auto_207990 ?auto_207996 ) ) ( not ( = ?auto_207991 ?auto_207996 ) ) ( not ( = ?auto_207992 ?auto_207996 ) ) ( not ( = ?auto_207993 ?auto_207996 ) ) ( not ( = ?auto_207994 ?auto_207996 ) ) ( not ( = ?auto_207995 ?auto_207996 ) ) ( ON ?auto_207989 ?auto_207988 ) ( CLEAR ?auto_207989 ) ( ON-TABLE ?auto_207996 ) ( HOLDING ?auto_207990 ) ( CLEAR ?auto_207991 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_207995 ?auto_207994 ?auto_207993 ?auto_207992 ?auto_207991 ?auto_207990 )
      ( MAKE-6PILE ?auto_207988 ?auto_207989 ?auto_207990 ?auto_207991 ?auto_207992 ?auto_207993 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_207997 - BLOCK
      ?auto_207998 - BLOCK
      ?auto_207999 - BLOCK
      ?auto_208000 - BLOCK
      ?auto_208001 - BLOCK
      ?auto_208002 - BLOCK
    )
    :vars
    (
      ?auto_208003 - BLOCK
      ?auto_208004 - BLOCK
      ?auto_208005 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_207997 ?auto_207998 ) ) ( not ( = ?auto_207997 ?auto_207999 ) ) ( not ( = ?auto_207997 ?auto_208000 ) ) ( not ( = ?auto_207997 ?auto_208001 ) ) ( not ( = ?auto_207997 ?auto_208002 ) ) ( not ( = ?auto_207998 ?auto_207999 ) ) ( not ( = ?auto_207998 ?auto_208000 ) ) ( not ( = ?auto_207998 ?auto_208001 ) ) ( not ( = ?auto_207998 ?auto_208002 ) ) ( not ( = ?auto_207999 ?auto_208000 ) ) ( not ( = ?auto_207999 ?auto_208001 ) ) ( not ( = ?auto_207999 ?auto_208002 ) ) ( not ( = ?auto_208000 ?auto_208001 ) ) ( not ( = ?auto_208000 ?auto_208002 ) ) ( not ( = ?auto_208001 ?auto_208002 ) ) ( ON ?auto_208002 ?auto_208003 ) ( not ( = ?auto_207997 ?auto_208003 ) ) ( not ( = ?auto_207998 ?auto_208003 ) ) ( not ( = ?auto_207999 ?auto_208003 ) ) ( not ( = ?auto_208000 ?auto_208003 ) ) ( not ( = ?auto_208001 ?auto_208003 ) ) ( not ( = ?auto_208002 ?auto_208003 ) ) ( ON ?auto_208001 ?auto_208002 ) ( ON-TABLE ?auto_208004 ) ( ON ?auto_208003 ?auto_208004 ) ( not ( = ?auto_208004 ?auto_208003 ) ) ( not ( = ?auto_208004 ?auto_208002 ) ) ( not ( = ?auto_208004 ?auto_208001 ) ) ( not ( = ?auto_207997 ?auto_208004 ) ) ( not ( = ?auto_207998 ?auto_208004 ) ) ( not ( = ?auto_207999 ?auto_208004 ) ) ( not ( = ?auto_208000 ?auto_208004 ) ) ( ON ?auto_208000 ?auto_208001 ) ( ON ?auto_207997 ?auto_208005 ) ( not ( = ?auto_207997 ?auto_208005 ) ) ( not ( = ?auto_207998 ?auto_208005 ) ) ( not ( = ?auto_207999 ?auto_208005 ) ) ( not ( = ?auto_208000 ?auto_208005 ) ) ( not ( = ?auto_208001 ?auto_208005 ) ) ( not ( = ?auto_208002 ?auto_208005 ) ) ( not ( = ?auto_208003 ?auto_208005 ) ) ( not ( = ?auto_208004 ?auto_208005 ) ) ( ON ?auto_207998 ?auto_207997 ) ( ON-TABLE ?auto_208005 ) ( CLEAR ?auto_208000 ) ( ON ?auto_207999 ?auto_207998 ) ( CLEAR ?auto_207999 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_208005 ?auto_207997 ?auto_207998 )
      ( MAKE-6PILE ?auto_207997 ?auto_207998 ?auto_207999 ?auto_208000 ?auto_208001 ?auto_208002 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_208006 - BLOCK
      ?auto_208007 - BLOCK
      ?auto_208008 - BLOCK
      ?auto_208009 - BLOCK
      ?auto_208010 - BLOCK
      ?auto_208011 - BLOCK
    )
    :vars
    (
      ?auto_208012 - BLOCK
      ?auto_208013 - BLOCK
      ?auto_208014 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_208006 ?auto_208007 ) ) ( not ( = ?auto_208006 ?auto_208008 ) ) ( not ( = ?auto_208006 ?auto_208009 ) ) ( not ( = ?auto_208006 ?auto_208010 ) ) ( not ( = ?auto_208006 ?auto_208011 ) ) ( not ( = ?auto_208007 ?auto_208008 ) ) ( not ( = ?auto_208007 ?auto_208009 ) ) ( not ( = ?auto_208007 ?auto_208010 ) ) ( not ( = ?auto_208007 ?auto_208011 ) ) ( not ( = ?auto_208008 ?auto_208009 ) ) ( not ( = ?auto_208008 ?auto_208010 ) ) ( not ( = ?auto_208008 ?auto_208011 ) ) ( not ( = ?auto_208009 ?auto_208010 ) ) ( not ( = ?auto_208009 ?auto_208011 ) ) ( not ( = ?auto_208010 ?auto_208011 ) ) ( ON ?auto_208011 ?auto_208012 ) ( not ( = ?auto_208006 ?auto_208012 ) ) ( not ( = ?auto_208007 ?auto_208012 ) ) ( not ( = ?auto_208008 ?auto_208012 ) ) ( not ( = ?auto_208009 ?auto_208012 ) ) ( not ( = ?auto_208010 ?auto_208012 ) ) ( not ( = ?auto_208011 ?auto_208012 ) ) ( ON ?auto_208010 ?auto_208011 ) ( ON-TABLE ?auto_208013 ) ( ON ?auto_208012 ?auto_208013 ) ( not ( = ?auto_208013 ?auto_208012 ) ) ( not ( = ?auto_208013 ?auto_208011 ) ) ( not ( = ?auto_208013 ?auto_208010 ) ) ( not ( = ?auto_208006 ?auto_208013 ) ) ( not ( = ?auto_208007 ?auto_208013 ) ) ( not ( = ?auto_208008 ?auto_208013 ) ) ( not ( = ?auto_208009 ?auto_208013 ) ) ( ON ?auto_208006 ?auto_208014 ) ( not ( = ?auto_208006 ?auto_208014 ) ) ( not ( = ?auto_208007 ?auto_208014 ) ) ( not ( = ?auto_208008 ?auto_208014 ) ) ( not ( = ?auto_208009 ?auto_208014 ) ) ( not ( = ?auto_208010 ?auto_208014 ) ) ( not ( = ?auto_208011 ?auto_208014 ) ) ( not ( = ?auto_208012 ?auto_208014 ) ) ( not ( = ?auto_208013 ?auto_208014 ) ) ( ON ?auto_208007 ?auto_208006 ) ( ON-TABLE ?auto_208014 ) ( ON ?auto_208008 ?auto_208007 ) ( CLEAR ?auto_208008 ) ( HOLDING ?auto_208009 ) ( CLEAR ?auto_208010 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_208013 ?auto_208012 ?auto_208011 ?auto_208010 ?auto_208009 )
      ( MAKE-6PILE ?auto_208006 ?auto_208007 ?auto_208008 ?auto_208009 ?auto_208010 ?auto_208011 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_208015 - BLOCK
      ?auto_208016 - BLOCK
      ?auto_208017 - BLOCK
      ?auto_208018 - BLOCK
      ?auto_208019 - BLOCK
      ?auto_208020 - BLOCK
    )
    :vars
    (
      ?auto_208021 - BLOCK
      ?auto_208023 - BLOCK
      ?auto_208022 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_208015 ?auto_208016 ) ) ( not ( = ?auto_208015 ?auto_208017 ) ) ( not ( = ?auto_208015 ?auto_208018 ) ) ( not ( = ?auto_208015 ?auto_208019 ) ) ( not ( = ?auto_208015 ?auto_208020 ) ) ( not ( = ?auto_208016 ?auto_208017 ) ) ( not ( = ?auto_208016 ?auto_208018 ) ) ( not ( = ?auto_208016 ?auto_208019 ) ) ( not ( = ?auto_208016 ?auto_208020 ) ) ( not ( = ?auto_208017 ?auto_208018 ) ) ( not ( = ?auto_208017 ?auto_208019 ) ) ( not ( = ?auto_208017 ?auto_208020 ) ) ( not ( = ?auto_208018 ?auto_208019 ) ) ( not ( = ?auto_208018 ?auto_208020 ) ) ( not ( = ?auto_208019 ?auto_208020 ) ) ( ON ?auto_208020 ?auto_208021 ) ( not ( = ?auto_208015 ?auto_208021 ) ) ( not ( = ?auto_208016 ?auto_208021 ) ) ( not ( = ?auto_208017 ?auto_208021 ) ) ( not ( = ?auto_208018 ?auto_208021 ) ) ( not ( = ?auto_208019 ?auto_208021 ) ) ( not ( = ?auto_208020 ?auto_208021 ) ) ( ON ?auto_208019 ?auto_208020 ) ( ON-TABLE ?auto_208023 ) ( ON ?auto_208021 ?auto_208023 ) ( not ( = ?auto_208023 ?auto_208021 ) ) ( not ( = ?auto_208023 ?auto_208020 ) ) ( not ( = ?auto_208023 ?auto_208019 ) ) ( not ( = ?auto_208015 ?auto_208023 ) ) ( not ( = ?auto_208016 ?auto_208023 ) ) ( not ( = ?auto_208017 ?auto_208023 ) ) ( not ( = ?auto_208018 ?auto_208023 ) ) ( ON ?auto_208015 ?auto_208022 ) ( not ( = ?auto_208015 ?auto_208022 ) ) ( not ( = ?auto_208016 ?auto_208022 ) ) ( not ( = ?auto_208017 ?auto_208022 ) ) ( not ( = ?auto_208018 ?auto_208022 ) ) ( not ( = ?auto_208019 ?auto_208022 ) ) ( not ( = ?auto_208020 ?auto_208022 ) ) ( not ( = ?auto_208021 ?auto_208022 ) ) ( not ( = ?auto_208023 ?auto_208022 ) ) ( ON ?auto_208016 ?auto_208015 ) ( ON-TABLE ?auto_208022 ) ( ON ?auto_208017 ?auto_208016 ) ( CLEAR ?auto_208019 ) ( ON ?auto_208018 ?auto_208017 ) ( CLEAR ?auto_208018 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_208022 ?auto_208015 ?auto_208016 ?auto_208017 )
      ( MAKE-6PILE ?auto_208015 ?auto_208016 ?auto_208017 ?auto_208018 ?auto_208019 ?auto_208020 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_208024 - BLOCK
      ?auto_208025 - BLOCK
      ?auto_208026 - BLOCK
      ?auto_208027 - BLOCK
      ?auto_208028 - BLOCK
      ?auto_208029 - BLOCK
    )
    :vars
    (
      ?auto_208030 - BLOCK
      ?auto_208032 - BLOCK
      ?auto_208031 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_208024 ?auto_208025 ) ) ( not ( = ?auto_208024 ?auto_208026 ) ) ( not ( = ?auto_208024 ?auto_208027 ) ) ( not ( = ?auto_208024 ?auto_208028 ) ) ( not ( = ?auto_208024 ?auto_208029 ) ) ( not ( = ?auto_208025 ?auto_208026 ) ) ( not ( = ?auto_208025 ?auto_208027 ) ) ( not ( = ?auto_208025 ?auto_208028 ) ) ( not ( = ?auto_208025 ?auto_208029 ) ) ( not ( = ?auto_208026 ?auto_208027 ) ) ( not ( = ?auto_208026 ?auto_208028 ) ) ( not ( = ?auto_208026 ?auto_208029 ) ) ( not ( = ?auto_208027 ?auto_208028 ) ) ( not ( = ?auto_208027 ?auto_208029 ) ) ( not ( = ?auto_208028 ?auto_208029 ) ) ( ON ?auto_208029 ?auto_208030 ) ( not ( = ?auto_208024 ?auto_208030 ) ) ( not ( = ?auto_208025 ?auto_208030 ) ) ( not ( = ?auto_208026 ?auto_208030 ) ) ( not ( = ?auto_208027 ?auto_208030 ) ) ( not ( = ?auto_208028 ?auto_208030 ) ) ( not ( = ?auto_208029 ?auto_208030 ) ) ( ON-TABLE ?auto_208032 ) ( ON ?auto_208030 ?auto_208032 ) ( not ( = ?auto_208032 ?auto_208030 ) ) ( not ( = ?auto_208032 ?auto_208029 ) ) ( not ( = ?auto_208032 ?auto_208028 ) ) ( not ( = ?auto_208024 ?auto_208032 ) ) ( not ( = ?auto_208025 ?auto_208032 ) ) ( not ( = ?auto_208026 ?auto_208032 ) ) ( not ( = ?auto_208027 ?auto_208032 ) ) ( ON ?auto_208024 ?auto_208031 ) ( not ( = ?auto_208024 ?auto_208031 ) ) ( not ( = ?auto_208025 ?auto_208031 ) ) ( not ( = ?auto_208026 ?auto_208031 ) ) ( not ( = ?auto_208027 ?auto_208031 ) ) ( not ( = ?auto_208028 ?auto_208031 ) ) ( not ( = ?auto_208029 ?auto_208031 ) ) ( not ( = ?auto_208030 ?auto_208031 ) ) ( not ( = ?auto_208032 ?auto_208031 ) ) ( ON ?auto_208025 ?auto_208024 ) ( ON-TABLE ?auto_208031 ) ( ON ?auto_208026 ?auto_208025 ) ( ON ?auto_208027 ?auto_208026 ) ( CLEAR ?auto_208027 ) ( HOLDING ?auto_208028 ) ( CLEAR ?auto_208029 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_208032 ?auto_208030 ?auto_208029 ?auto_208028 )
      ( MAKE-6PILE ?auto_208024 ?auto_208025 ?auto_208026 ?auto_208027 ?auto_208028 ?auto_208029 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_208033 - BLOCK
      ?auto_208034 - BLOCK
      ?auto_208035 - BLOCK
      ?auto_208036 - BLOCK
      ?auto_208037 - BLOCK
      ?auto_208038 - BLOCK
    )
    :vars
    (
      ?auto_208039 - BLOCK
      ?auto_208041 - BLOCK
      ?auto_208040 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_208033 ?auto_208034 ) ) ( not ( = ?auto_208033 ?auto_208035 ) ) ( not ( = ?auto_208033 ?auto_208036 ) ) ( not ( = ?auto_208033 ?auto_208037 ) ) ( not ( = ?auto_208033 ?auto_208038 ) ) ( not ( = ?auto_208034 ?auto_208035 ) ) ( not ( = ?auto_208034 ?auto_208036 ) ) ( not ( = ?auto_208034 ?auto_208037 ) ) ( not ( = ?auto_208034 ?auto_208038 ) ) ( not ( = ?auto_208035 ?auto_208036 ) ) ( not ( = ?auto_208035 ?auto_208037 ) ) ( not ( = ?auto_208035 ?auto_208038 ) ) ( not ( = ?auto_208036 ?auto_208037 ) ) ( not ( = ?auto_208036 ?auto_208038 ) ) ( not ( = ?auto_208037 ?auto_208038 ) ) ( ON ?auto_208038 ?auto_208039 ) ( not ( = ?auto_208033 ?auto_208039 ) ) ( not ( = ?auto_208034 ?auto_208039 ) ) ( not ( = ?auto_208035 ?auto_208039 ) ) ( not ( = ?auto_208036 ?auto_208039 ) ) ( not ( = ?auto_208037 ?auto_208039 ) ) ( not ( = ?auto_208038 ?auto_208039 ) ) ( ON-TABLE ?auto_208041 ) ( ON ?auto_208039 ?auto_208041 ) ( not ( = ?auto_208041 ?auto_208039 ) ) ( not ( = ?auto_208041 ?auto_208038 ) ) ( not ( = ?auto_208041 ?auto_208037 ) ) ( not ( = ?auto_208033 ?auto_208041 ) ) ( not ( = ?auto_208034 ?auto_208041 ) ) ( not ( = ?auto_208035 ?auto_208041 ) ) ( not ( = ?auto_208036 ?auto_208041 ) ) ( ON ?auto_208033 ?auto_208040 ) ( not ( = ?auto_208033 ?auto_208040 ) ) ( not ( = ?auto_208034 ?auto_208040 ) ) ( not ( = ?auto_208035 ?auto_208040 ) ) ( not ( = ?auto_208036 ?auto_208040 ) ) ( not ( = ?auto_208037 ?auto_208040 ) ) ( not ( = ?auto_208038 ?auto_208040 ) ) ( not ( = ?auto_208039 ?auto_208040 ) ) ( not ( = ?auto_208041 ?auto_208040 ) ) ( ON ?auto_208034 ?auto_208033 ) ( ON-TABLE ?auto_208040 ) ( ON ?auto_208035 ?auto_208034 ) ( ON ?auto_208036 ?auto_208035 ) ( CLEAR ?auto_208038 ) ( ON ?auto_208037 ?auto_208036 ) ( CLEAR ?auto_208037 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_208040 ?auto_208033 ?auto_208034 ?auto_208035 ?auto_208036 )
      ( MAKE-6PILE ?auto_208033 ?auto_208034 ?auto_208035 ?auto_208036 ?auto_208037 ?auto_208038 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_208042 - BLOCK
      ?auto_208043 - BLOCK
      ?auto_208044 - BLOCK
      ?auto_208045 - BLOCK
      ?auto_208046 - BLOCK
      ?auto_208047 - BLOCK
    )
    :vars
    (
      ?auto_208048 - BLOCK
      ?auto_208049 - BLOCK
      ?auto_208050 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_208042 ?auto_208043 ) ) ( not ( = ?auto_208042 ?auto_208044 ) ) ( not ( = ?auto_208042 ?auto_208045 ) ) ( not ( = ?auto_208042 ?auto_208046 ) ) ( not ( = ?auto_208042 ?auto_208047 ) ) ( not ( = ?auto_208043 ?auto_208044 ) ) ( not ( = ?auto_208043 ?auto_208045 ) ) ( not ( = ?auto_208043 ?auto_208046 ) ) ( not ( = ?auto_208043 ?auto_208047 ) ) ( not ( = ?auto_208044 ?auto_208045 ) ) ( not ( = ?auto_208044 ?auto_208046 ) ) ( not ( = ?auto_208044 ?auto_208047 ) ) ( not ( = ?auto_208045 ?auto_208046 ) ) ( not ( = ?auto_208045 ?auto_208047 ) ) ( not ( = ?auto_208046 ?auto_208047 ) ) ( not ( = ?auto_208042 ?auto_208048 ) ) ( not ( = ?auto_208043 ?auto_208048 ) ) ( not ( = ?auto_208044 ?auto_208048 ) ) ( not ( = ?auto_208045 ?auto_208048 ) ) ( not ( = ?auto_208046 ?auto_208048 ) ) ( not ( = ?auto_208047 ?auto_208048 ) ) ( ON-TABLE ?auto_208049 ) ( ON ?auto_208048 ?auto_208049 ) ( not ( = ?auto_208049 ?auto_208048 ) ) ( not ( = ?auto_208049 ?auto_208047 ) ) ( not ( = ?auto_208049 ?auto_208046 ) ) ( not ( = ?auto_208042 ?auto_208049 ) ) ( not ( = ?auto_208043 ?auto_208049 ) ) ( not ( = ?auto_208044 ?auto_208049 ) ) ( not ( = ?auto_208045 ?auto_208049 ) ) ( ON ?auto_208042 ?auto_208050 ) ( not ( = ?auto_208042 ?auto_208050 ) ) ( not ( = ?auto_208043 ?auto_208050 ) ) ( not ( = ?auto_208044 ?auto_208050 ) ) ( not ( = ?auto_208045 ?auto_208050 ) ) ( not ( = ?auto_208046 ?auto_208050 ) ) ( not ( = ?auto_208047 ?auto_208050 ) ) ( not ( = ?auto_208048 ?auto_208050 ) ) ( not ( = ?auto_208049 ?auto_208050 ) ) ( ON ?auto_208043 ?auto_208042 ) ( ON-TABLE ?auto_208050 ) ( ON ?auto_208044 ?auto_208043 ) ( ON ?auto_208045 ?auto_208044 ) ( ON ?auto_208046 ?auto_208045 ) ( CLEAR ?auto_208046 ) ( HOLDING ?auto_208047 ) ( CLEAR ?auto_208048 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_208049 ?auto_208048 ?auto_208047 )
      ( MAKE-6PILE ?auto_208042 ?auto_208043 ?auto_208044 ?auto_208045 ?auto_208046 ?auto_208047 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_208051 - BLOCK
      ?auto_208052 - BLOCK
      ?auto_208053 - BLOCK
      ?auto_208054 - BLOCK
      ?auto_208055 - BLOCK
      ?auto_208056 - BLOCK
    )
    :vars
    (
      ?auto_208059 - BLOCK
      ?auto_208058 - BLOCK
      ?auto_208057 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_208051 ?auto_208052 ) ) ( not ( = ?auto_208051 ?auto_208053 ) ) ( not ( = ?auto_208051 ?auto_208054 ) ) ( not ( = ?auto_208051 ?auto_208055 ) ) ( not ( = ?auto_208051 ?auto_208056 ) ) ( not ( = ?auto_208052 ?auto_208053 ) ) ( not ( = ?auto_208052 ?auto_208054 ) ) ( not ( = ?auto_208052 ?auto_208055 ) ) ( not ( = ?auto_208052 ?auto_208056 ) ) ( not ( = ?auto_208053 ?auto_208054 ) ) ( not ( = ?auto_208053 ?auto_208055 ) ) ( not ( = ?auto_208053 ?auto_208056 ) ) ( not ( = ?auto_208054 ?auto_208055 ) ) ( not ( = ?auto_208054 ?auto_208056 ) ) ( not ( = ?auto_208055 ?auto_208056 ) ) ( not ( = ?auto_208051 ?auto_208059 ) ) ( not ( = ?auto_208052 ?auto_208059 ) ) ( not ( = ?auto_208053 ?auto_208059 ) ) ( not ( = ?auto_208054 ?auto_208059 ) ) ( not ( = ?auto_208055 ?auto_208059 ) ) ( not ( = ?auto_208056 ?auto_208059 ) ) ( ON-TABLE ?auto_208058 ) ( ON ?auto_208059 ?auto_208058 ) ( not ( = ?auto_208058 ?auto_208059 ) ) ( not ( = ?auto_208058 ?auto_208056 ) ) ( not ( = ?auto_208058 ?auto_208055 ) ) ( not ( = ?auto_208051 ?auto_208058 ) ) ( not ( = ?auto_208052 ?auto_208058 ) ) ( not ( = ?auto_208053 ?auto_208058 ) ) ( not ( = ?auto_208054 ?auto_208058 ) ) ( ON ?auto_208051 ?auto_208057 ) ( not ( = ?auto_208051 ?auto_208057 ) ) ( not ( = ?auto_208052 ?auto_208057 ) ) ( not ( = ?auto_208053 ?auto_208057 ) ) ( not ( = ?auto_208054 ?auto_208057 ) ) ( not ( = ?auto_208055 ?auto_208057 ) ) ( not ( = ?auto_208056 ?auto_208057 ) ) ( not ( = ?auto_208059 ?auto_208057 ) ) ( not ( = ?auto_208058 ?auto_208057 ) ) ( ON ?auto_208052 ?auto_208051 ) ( ON-TABLE ?auto_208057 ) ( ON ?auto_208053 ?auto_208052 ) ( ON ?auto_208054 ?auto_208053 ) ( ON ?auto_208055 ?auto_208054 ) ( CLEAR ?auto_208059 ) ( ON ?auto_208056 ?auto_208055 ) ( CLEAR ?auto_208056 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_208057 ?auto_208051 ?auto_208052 ?auto_208053 ?auto_208054 ?auto_208055 )
      ( MAKE-6PILE ?auto_208051 ?auto_208052 ?auto_208053 ?auto_208054 ?auto_208055 ?auto_208056 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_208060 - BLOCK
      ?auto_208061 - BLOCK
      ?auto_208062 - BLOCK
      ?auto_208063 - BLOCK
      ?auto_208064 - BLOCK
      ?auto_208065 - BLOCK
    )
    :vars
    (
      ?auto_208068 - BLOCK
      ?auto_208067 - BLOCK
      ?auto_208066 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_208060 ?auto_208061 ) ) ( not ( = ?auto_208060 ?auto_208062 ) ) ( not ( = ?auto_208060 ?auto_208063 ) ) ( not ( = ?auto_208060 ?auto_208064 ) ) ( not ( = ?auto_208060 ?auto_208065 ) ) ( not ( = ?auto_208061 ?auto_208062 ) ) ( not ( = ?auto_208061 ?auto_208063 ) ) ( not ( = ?auto_208061 ?auto_208064 ) ) ( not ( = ?auto_208061 ?auto_208065 ) ) ( not ( = ?auto_208062 ?auto_208063 ) ) ( not ( = ?auto_208062 ?auto_208064 ) ) ( not ( = ?auto_208062 ?auto_208065 ) ) ( not ( = ?auto_208063 ?auto_208064 ) ) ( not ( = ?auto_208063 ?auto_208065 ) ) ( not ( = ?auto_208064 ?auto_208065 ) ) ( not ( = ?auto_208060 ?auto_208068 ) ) ( not ( = ?auto_208061 ?auto_208068 ) ) ( not ( = ?auto_208062 ?auto_208068 ) ) ( not ( = ?auto_208063 ?auto_208068 ) ) ( not ( = ?auto_208064 ?auto_208068 ) ) ( not ( = ?auto_208065 ?auto_208068 ) ) ( ON-TABLE ?auto_208067 ) ( not ( = ?auto_208067 ?auto_208068 ) ) ( not ( = ?auto_208067 ?auto_208065 ) ) ( not ( = ?auto_208067 ?auto_208064 ) ) ( not ( = ?auto_208060 ?auto_208067 ) ) ( not ( = ?auto_208061 ?auto_208067 ) ) ( not ( = ?auto_208062 ?auto_208067 ) ) ( not ( = ?auto_208063 ?auto_208067 ) ) ( ON ?auto_208060 ?auto_208066 ) ( not ( = ?auto_208060 ?auto_208066 ) ) ( not ( = ?auto_208061 ?auto_208066 ) ) ( not ( = ?auto_208062 ?auto_208066 ) ) ( not ( = ?auto_208063 ?auto_208066 ) ) ( not ( = ?auto_208064 ?auto_208066 ) ) ( not ( = ?auto_208065 ?auto_208066 ) ) ( not ( = ?auto_208068 ?auto_208066 ) ) ( not ( = ?auto_208067 ?auto_208066 ) ) ( ON ?auto_208061 ?auto_208060 ) ( ON-TABLE ?auto_208066 ) ( ON ?auto_208062 ?auto_208061 ) ( ON ?auto_208063 ?auto_208062 ) ( ON ?auto_208064 ?auto_208063 ) ( ON ?auto_208065 ?auto_208064 ) ( CLEAR ?auto_208065 ) ( HOLDING ?auto_208068 ) ( CLEAR ?auto_208067 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_208067 ?auto_208068 )
      ( MAKE-6PILE ?auto_208060 ?auto_208061 ?auto_208062 ?auto_208063 ?auto_208064 ?auto_208065 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_208069 - BLOCK
      ?auto_208070 - BLOCK
      ?auto_208071 - BLOCK
      ?auto_208072 - BLOCK
      ?auto_208073 - BLOCK
      ?auto_208074 - BLOCK
    )
    :vars
    (
      ?auto_208077 - BLOCK
      ?auto_208075 - BLOCK
      ?auto_208076 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_208069 ?auto_208070 ) ) ( not ( = ?auto_208069 ?auto_208071 ) ) ( not ( = ?auto_208069 ?auto_208072 ) ) ( not ( = ?auto_208069 ?auto_208073 ) ) ( not ( = ?auto_208069 ?auto_208074 ) ) ( not ( = ?auto_208070 ?auto_208071 ) ) ( not ( = ?auto_208070 ?auto_208072 ) ) ( not ( = ?auto_208070 ?auto_208073 ) ) ( not ( = ?auto_208070 ?auto_208074 ) ) ( not ( = ?auto_208071 ?auto_208072 ) ) ( not ( = ?auto_208071 ?auto_208073 ) ) ( not ( = ?auto_208071 ?auto_208074 ) ) ( not ( = ?auto_208072 ?auto_208073 ) ) ( not ( = ?auto_208072 ?auto_208074 ) ) ( not ( = ?auto_208073 ?auto_208074 ) ) ( not ( = ?auto_208069 ?auto_208077 ) ) ( not ( = ?auto_208070 ?auto_208077 ) ) ( not ( = ?auto_208071 ?auto_208077 ) ) ( not ( = ?auto_208072 ?auto_208077 ) ) ( not ( = ?auto_208073 ?auto_208077 ) ) ( not ( = ?auto_208074 ?auto_208077 ) ) ( ON-TABLE ?auto_208075 ) ( not ( = ?auto_208075 ?auto_208077 ) ) ( not ( = ?auto_208075 ?auto_208074 ) ) ( not ( = ?auto_208075 ?auto_208073 ) ) ( not ( = ?auto_208069 ?auto_208075 ) ) ( not ( = ?auto_208070 ?auto_208075 ) ) ( not ( = ?auto_208071 ?auto_208075 ) ) ( not ( = ?auto_208072 ?auto_208075 ) ) ( ON ?auto_208069 ?auto_208076 ) ( not ( = ?auto_208069 ?auto_208076 ) ) ( not ( = ?auto_208070 ?auto_208076 ) ) ( not ( = ?auto_208071 ?auto_208076 ) ) ( not ( = ?auto_208072 ?auto_208076 ) ) ( not ( = ?auto_208073 ?auto_208076 ) ) ( not ( = ?auto_208074 ?auto_208076 ) ) ( not ( = ?auto_208077 ?auto_208076 ) ) ( not ( = ?auto_208075 ?auto_208076 ) ) ( ON ?auto_208070 ?auto_208069 ) ( ON-TABLE ?auto_208076 ) ( ON ?auto_208071 ?auto_208070 ) ( ON ?auto_208072 ?auto_208071 ) ( ON ?auto_208073 ?auto_208072 ) ( ON ?auto_208074 ?auto_208073 ) ( CLEAR ?auto_208075 ) ( ON ?auto_208077 ?auto_208074 ) ( CLEAR ?auto_208077 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_208076 ?auto_208069 ?auto_208070 ?auto_208071 ?auto_208072 ?auto_208073 ?auto_208074 )
      ( MAKE-6PILE ?auto_208069 ?auto_208070 ?auto_208071 ?auto_208072 ?auto_208073 ?auto_208074 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_208078 - BLOCK
      ?auto_208079 - BLOCK
      ?auto_208080 - BLOCK
      ?auto_208081 - BLOCK
      ?auto_208082 - BLOCK
      ?auto_208083 - BLOCK
    )
    :vars
    (
      ?auto_208084 - BLOCK
      ?auto_208086 - BLOCK
      ?auto_208085 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_208078 ?auto_208079 ) ) ( not ( = ?auto_208078 ?auto_208080 ) ) ( not ( = ?auto_208078 ?auto_208081 ) ) ( not ( = ?auto_208078 ?auto_208082 ) ) ( not ( = ?auto_208078 ?auto_208083 ) ) ( not ( = ?auto_208079 ?auto_208080 ) ) ( not ( = ?auto_208079 ?auto_208081 ) ) ( not ( = ?auto_208079 ?auto_208082 ) ) ( not ( = ?auto_208079 ?auto_208083 ) ) ( not ( = ?auto_208080 ?auto_208081 ) ) ( not ( = ?auto_208080 ?auto_208082 ) ) ( not ( = ?auto_208080 ?auto_208083 ) ) ( not ( = ?auto_208081 ?auto_208082 ) ) ( not ( = ?auto_208081 ?auto_208083 ) ) ( not ( = ?auto_208082 ?auto_208083 ) ) ( not ( = ?auto_208078 ?auto_208084 ) ) ( not ( = ?auto_208079 ?auto_208084 ) ) ( not ( = ?auto_208080 ?auto_208084 ) ) ( not ( = ?auto_208081 ?auto_208084 ) ) ( not ( = ?auto_208082 ?auto_208084 ) ) ( not ( = ?auto_208083 ?auto_208084 ) ) ( not ( = ?auto_208086 ?auto_208084 ) ) ( not ( = ?auto_208086 ?auto_208083 ) ) ( not ( = ?auto_208086 ?auto_208082 ) ) ( not ( = ?auto_208078 ?auto_208086 ) ) ( not ( = ?auto_208079 ?auto_208086 ) ) ( not ( = ?auto_208080 ?auto_208086 ) ) ( not ( = ?auto_208081 ?auto_208086 ) ) ( ON ?auto_208078 ?auto_208085 ) ( not ( = ?auto_208078 ?auto_208085 ) ) ( not ( = ?auto_208079 ?auto_208085 ) ) ( not ( = ?auto_208080 ?auto_208085 ) ) ( not ( = ?auto_208081 ?auto_208085 ) ) ( not ( = ?auto_208082 ?auto_208085 ) ) ( not ( = ?auto_208083 ?auto_208085 ) ) ( not ( = ?auto_208084 ?auto_208085 ) ) ( not ( = ?auto_208086 ?auto_208085 ) ) ( ON ?auto_208079 ?auto_208078 ) ( ON-TABLE ?auto_208085 ) ( ON ?auto_208080 ?auto_208079 ) ( ON ?auto_208081 ?auto_208080 ) ( ON ?auto_208082 ?auto_208081 ) ( ON ?auto_208083 ?auto_208082 ) ( ON ?auto_208084 ?auto_208083 ) ( CLEAR ?auto_208084 ) ( HOLDING ?auto_208086 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_208086 )
      ( MAKE-6PILE ?auto_208078 ?auto_208079 ?auto_208080 ?auto_208081 ?auto_208082 ?auto_208083 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_208087 - BLOCK
      ?auto_208088 - BLOCK
      ?auto_208089 - BLOCK
      ?auto_208090 - BLOCK
      ?auto_208091 - BLOCK
      ?auto_208092 - BLOCK
    )
    :vars
    (
      ?auto_208094 - BLOCK
      ?auto_208093 - BLOCK
      ?auto_208095 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_208087 ?auto_208088 ) ) ( not ( = ?auto_208087 ?auto_208089 ) ) ( not ( = ?auto_208087 ?auto_208090 ) ) ( not ( = ?auto_208087 ?auto_208091 ) ) ( not ( = ?auto_208087 ?auto_208092 ) ) ( not ( = ?auto_208088 ?auto_208089 ) ) ( not ( = ?auto_208088 ?auto_208090 ) ) ( not ( = ?auto_208088 ?auto_208091 ) ) ( not ( = ?auto_208088 ?auto_208092 ) ) ( not ( = ?auto_208089 ?auto_208090 ) ) ( not ( = ?auto_208089 ?auto_208091 ) ) ( not ( = ?auto_208089 ?auto_208092 ) ) ( not ( = ?auto_208090 ?auto_208091 ) ) ( not ( = ?auto_208090 ?auto_208092 ) ) ( not ( = ?auto_208091 ?auto_208092 ) ) ( not ( = ?auto_208087 ?auto_208094 ) ) ( not ( = ?auto_208088 ?auto_208094 ) ) ( not ( = ?auto_208089 ?auto_208094 ) ) ( not ( = ?auto_208090 ?auto_208094 ) ) ( not ( = ?auto_208091 ?auto_208094 ) ) ( not ( = ?auto_208092 ?auto_208094 ) ) ( not ( = ?auto_208093 ?auto_208094 ) ) ( not ( = ?auto_208093 ?auto_208092 ) ) ( not ( = ?auto_208093 ?auto_208091 ) ) ( not ( = ?auto_208087 ?auto_208093 ) ) ( not ( = ?auto_208088 ?auto_208093 ) ) ( not ( = ?auto_208089 ?auto_208093 ) ) ( not ( = ?auto_208090 ?auto_208093 ) ) ( ON ?auto_208087 ?auto_208095 ) ( not ( = ?auto_208087 ?auto_208095 ) ) ( not ( = ?auto_208088 ?auto_208095 ) ) ( not ( = ?auto_208089 ?auto_208095 ) ) ( not ( = ?auto_208090 ?auto_208095 ) ) ( not ( = ?auto_208091 ?auto_208095 ) ) ( not ( = ?auto_208092 ?auto_208095 ) ) ( not ( = ?auto_208094 ?auto_208095 ) ) ( not ( = ?auto_208093 ?auto_208095 ) ) ( ON ?auto_208088 ?auto_208087 ) ( ON-TABLE ?auto_208095 ) ( ON ?auto_208089 ?auto_208088 ) ( ON ?auto_208090 ?auto_208089 ) ( ON ?auto_208091 ?auto_208090 ) ( ON ?auto_208092 ?auto_208091 ) ( ON ?auto_208094 ?auto_208092 ) ( ON ?auto_208093 ?auto_208094 ) ( CLEAR ?auto_208093 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_208095 ?auto_208087 ?auto_208088 ?auto_208089 ?auto_208090 ?auto_208091 ?auto_208092 ?auto_208094 )
      ( MAKE-6PILE ?auto_208087 ?auto_208088 ?auto_208089 ?auto_208090 ?auto_208091 ?auto_208092 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_208097 - BLOCK
    )
    :vars
    (
      ?auto_208098 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_208098 ?auto_208097 ) ( CLEAR ?auto_208098 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_208097 ) ( not ( = ?auto_208097 ?auto_208098 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_208098 ?auto_208097 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_208099 - BLOCK
    )
    :vars
    (
      ?auto_208100 - BLOCK
      ?auto_208101 - BLOCK
      ?auto_208102 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_208100 ?auto_208099 ) ( CLEAR ?auto_208100 ) ( ON-TABLE ?auto_208099 ) ( not ( = ?auto_208099 ?auto_208100 ) ) ( HOLDING ?auto_208101 ) ( CLEAR ?auto_208102 ) ( not ( = ?auto_208099 ?auto_208101 ) ) ( not ( = ?auto_208099 ?auto_208102 ) ) ( not ( = ?auto_208100 ?auto_208101 ) ) ( not ( = ?auto_208100 ?auto_208102 ) ) ( not ( = ?auto_208101 ?auto_208102 ) ) )
    :subtasks
    ( ( !STACK ?auto_208101 ?auto_208102 )
      ( MAKE-1PILE ?auto_208099 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_208103 - BLOCK
    )
    :vars
    (
      ?auto_208106 - BLOCK
      ?auto_208105 - BLOCK
      ?auto_208104 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_208106 ?auto_208103 ) ( ON-TABLE ?auto_208103 ) ( not ( = ?auto_208103 ?auto_208106 ) ) ( CLEAR ?auto_208105 ) ( not ( = ?auto_208103 ?auto_208104 ) ) ( not ( = ?auto_208103 ?auto_208105 ) ) ( not ( = ?auto_208106 ?auto_208104 ) ) ( not ( = ?auto_208106 ?auto_208105 ) ) ( not ( = ?auto_208104 ?auto_208105 ) ) ( ON ?auto_208104 ?auto_208106 ) ( CLEAR ?auto_208104 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_208103 ?auto_208106 )
      ( MAKE-1PILE ?auto_208103 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_208107 - BLOCK
    )
    :vars
    (
      ?auto_208109 - BLOCK
      ?auto_208108 - BLOCK
      ?auto_208110 - BLOCK
      ?auto_208112 - BLOCK
      ?auto_208113 - BLOCK
      ?auto_208114 - BLOCK
      ?auto_208111 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_208109 ?auto_208107 ) ( ON-TABLE ?auto_208107 ) ( not ( = ?auto_208107 ?auto_208109 ) ) ( not ( = ?auto_208107 ?auto_208108 ) ) ( not ( = ?auto_208107 ?auto_208110 ) ) ( not ( = ?auto_208109 ?auto_208108 ) ) ( not ( = ?auto_208109 ?auto_208110 ) ) ( not ( = ?auto_208108 ?auto_208110 ) ) ( ON ?auto_208108 ?auto_208109 ) ( CLEAR ?auto_208108 ) ( HOLDING ?auto_208110 ) ( CLEAR ?auto_208112 ) ( ON-TABLE ?auto_208113 ) ( ON ?auto_208114 ?auto_208113 ) ( ON ?auto_208111 ?auto_208114 ) ( ON ?auto_208112 ?auto_208111 ) ( not ( = ?auto_208113 ?auto_208114 ) ) ( not ( = ?auto_208113 ?auto_208111 ) ) ( not ( = ?auto_208113 ?auto_208112 ) ) ( not ( = ?auto_208113 ?auto_208110 ) ) ( not ( = ?auto_208114 ?auto_208111 ) ) ( not ( = ?auto_208114 ?auto_208112 ) ) ( not ( = ?auto_208114 ?auto_208110 ) ) ( not ( = ?auto_208111 ?auto_208112 ) ) ( not ( = ?auto_208111 ?auto_208110 ) ) ( not ( = ?auto_208112 ?auto_208110 ) ) ( not ( = ?auto_208107 ?auto_208112 ) ) ( not ( = ?auto_208107 ?auto_208113 ) ) ( not ( = ?auto_208107 ?auto_208114 ) ) ( not ( = ?auto_208107 ?auto_208111 ) ) ( not ( = ?auto_208109 ?auto_208112 ) ) ( not ( = ?auto_208109 ?auto_208113 ) ) ( not ( = ?auto_208109 ?auto_208114 ) ) ( not ( = ?auto_208109 ?auto_208111 ) ) ( not ( = ?auto_208108 ?auto_208112 ) ) ( not ( = ?auto_208108 ?auto_208113 ) ) ( not ( = ?auto_208108 ?auto_208114 ) ) ( not ( = ?auto_208108 ?auto_208111 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_208113 ?auto_208114 ?auto_208111 ?auto_208112 ?auto_208110 )
      ( MAKE-1PILE ?auto_208107 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_208115 - BLOCK
    )
    :vars
    (
      ?auto_208116 - BLOCK
      ?auto_208122 - BLOCK
      ?auto_208117 - BLOCK
      ?auto_208118 - BLOCK
      ?auto_208119 - BLOCK
      ?auto_208121 - BLOCK
      ?auto_208120 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_208116 ?auto_208115 ) ( ON-TABLE ?auto_208115 ) ( not ( = ?auto_208115 ?auto_208116 ) ) ( not ( = ?auto_208115 ?auto_208122 ) ) ( not ( = ?auto_208115 ?auto_208117 ) ) ( not ( = ?auto_208116 ?auto_208122 ) ) ( not ( = ?auto_208116 ?auto_208117 ) ) ( not ( = ?auto_208122 ?auto_208117 ) ) ( ON ?auto_208122 ?auto_208116 ) ( CLEAR ?auto_208118 ) ( ON-TABLE ?auto_208119 ) ( ON ?auto_208121 ?auto_208119 ) ( ON ?auto_208120 ?auto_208121 ) ( ON ?auto_208118 ?auto_208120 ) ( not ( = ?auto_208119 ?auto_208121 ) ) ( not ( = ?auto_208119 ?auto_208120 ) ) ( not ( = ?auto_208119 ?auto_208118 ) ) ( not ( = ?auto_208119 ?auto_208117 ) ) ( not ( = ?auto_208121 ?auto_208120 ) ) ( not ( = ?auto_208121 ?auto_208118 ) ) ( not ( = ?auto_208121 ?auto_208117 ) ) ( not ( = ?auto_208120 ?auto_208118 ) ) ( not ( = ?auto_208120 ?auto_208117 ) ) ( not ( = ?auto_208118 ?auto_208117 ) ) ( not ( = ?auto_208115 ?auto_208118 ) ) ( not ( = ?auto_208115 ?auto_208119 ) ) ( not ( = ?auto_208115 ?auto_208121 ) ) ( not ( = ?auto_208115 ?auto_208120 ) ) ( not ( = ?auto_208116 ?auto_208118 ) ) ( not ( = ?auto_208116 ?auto_208119 ) ) ( not ( = ?auto_208116 ?auto_208121 ) ) ( not ( = ?auto_208116 ?auto_208120 ) ) ( not ( = ?auto_208122 ?auto_208118 ) ) ( not ( = ?auto_208122 ?auto_208119 ) ) ( not ( = ?auto_208122 ?auto_208121 ) ) ( not ( = ?auto_208122 ?auto_208120 ) ) ( ON ?auto_208117 ?auto_208122 ) ( CLEAR ?auto_208117 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_208115 ?auto_208116 ?auto_208122 )
      ( MAKE-1PILE ?auto_208115 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_208123 - BLOCK
    )
    :vars
    (
      ?auto_208129 - BLOCK
      ?auto_208128 - BLOCK
      ?auto_208126 - BLOCK
      ?auto_208124 - BLOCK
      ?auto_208127 - BLOCK
      ?auto_208130 - BLOCK
      ?auto_208125 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_208129 ?auto_208123 ) ( ON-TABLE ?auto_208123 ) ( not ( = ?auto_208123 ?auto_208129 ) ) ( not ( = ?auto_208123 ?auto_208128 ) ) ( not ( = ?auto_208123 ?auto_208126 ) ) ( not ( = ?auto_208129 ?auto_208128 ) ) ( not ( = ?auto_208129 ?auto_208126 ) ) ( not ( = ?auto_208128 ?auto_208126 ) ) ( ON ?auto_208128 ?auto_208129 ) ( ON-TABLE ?auto_208124 ) ( ON ?auto_208127 ?auto_208124 ) ( ON ?auto_208130 ?auto_208127 ) ( not ( = ?auto_208124 ?auto_208127 ) ) ( not ( = ?auto_208124 ?auto_208130 ) ) ( not ( = ?auto_208124 ?auto_208125 ) ) ( not ( = ?auto_208124 ?auto_208126 ) ) ( not ( = ?auto_208127 ?auto_208130 ) ) ( not ( = ?auto_208127 ?auto_208125 ) ) ( not ( = ?auto_208127 ?auto_208126 ) ) ( not ( = ?auto_208130 ?auto_208125 ) ) ( not ( = ?auto_208130 ?auto_208126 ) ) ( not ( = ?auto_208125 ?auto_208126 ) ) ( not ( = ?auto_208123 ?auto_208125 ) ) ( not ( = ?auto_208123 ?auto_208124 ) ) ( not ( = ?auto_208123 ?auto_208127 ) ) ( not ( = ?auto_208123 ?auto_208130 ) ) ( not ( = ?auto_208129 ?auto_208125 ) ) ( not ( = ?auto_208129 ?auto_208124 ) ) ( not ( = ?auto_208129 ?auto_208127 ) ) ( not ( = ?auto_208129 ?auto_208130 ) ) ( not ( = ?auto_208128 ?auto_208125 ) ) ( not ( = ?auto_208128 ?auto_208124 ) ) ( not ( = ?auto_208128 ?auto_208127 ) ) ( not ( = ?auto_208128 ?auto_208130 ) ) ( ON ?auto_208126 ?auto_208128 ) ( CLEAR ?auto_208126 ) ( HOLDING ?auto_208125 ) ( CLEAR ?auto_208130 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_208124 ?auto_208127 ?auto_208130 ?auto_208125 )
      ( MAKE-1PILE ?auto_208123 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_208131 - BLOCK
    )
    :vars
    (
      ?auto_208134 - BLOCK
      ?auto_208132 - BLOCK
      ?auto_208138 - BLOCK
      ?auto_208136 - BLOCK
      ?auto_208135 - BLOCK
      ?auto_208133 - BLOCK
      ?auto_208137 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_208134 ?auto_208131 ) ( ON-TABLE ?auto_208131 ) ( not ( = ?auto_208131 ?auto_208134 ) ) ( not ( = ?auto_208131 ?auto_208132 ) ) ( not ( = ?auto_208131 ?auto_208138 ) ) ( not ( = ?auto_208134 ?auto_208132 ) ) ( not ( = ?auto_208134 ?auto_208138 ) ) ( not ( = ?auto_208132 ?auto_208138 ) ) ( ON ?auto_208132 ?auto_208134 ) ( ON-TABLE ?auto_208136 ) ( ON ?auto_208135 ?auto_208136 ) ( ON ?auto_208133 ?auto_208135 ) ( not ( = ?auto_208136 ?auto_208135 ) ) ( not ( = ?auto_208136 ?auto_208133 ) ) ( not ( = ?auto_208136 ?auto_208137 ) ) ( not ( = ?auto_208136 ?auto_208138 ) ) ( not ( = ?auto_208135 ?auto_208133 ) ) ( not ( = ?auto_208135 ?auto_208137 ) ) ( not ( = ?auto_208135 ?auto_208138 ) ) ( not ( = ?auto_208133 ?auto_208137 ) ) ( not ( = ?auto_208133 ?auto_208138 ) ) ( not ( = ?auto_208137 ?auto_208138 ) ) ( not ( = ?auto_208131 ?auto_208137 ) ) ( not ( = ?auto_208131 ?auto_208136 ) ) ( not ( = ?auto_208131 ?auto_208135 ) ) ( not ( = ?auto_208131 ?auto_208133 ) ) ( not ( = ?auto_208134 ?auto_208137 ) ) ( not ( = ?auto_208134 ?auto_208136 ) ) ( not ( = ?auto_208134 ?auto_208135 ) ) ( not ( = ?auto_208134 ?auto_208133 ) ) ( not ( = ?auto_208132 ?auto_208137 ) ) ( not ( = ?auto_208132 ?auto_208136 ) ) ( not ( = ?auto_208132 ?auto_208135 ) ) ( not ( = ?auto_208132 ?auto_208133 ) ) ( ON ?auto_208138 ?auto_208132 ) ( CLEAR ?auto_208133 ) ( ON ?auto_208137 ?auto_208138 ) ( CLEAR ?auto_208137 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_208131 ?auto_208134 ?auto_208132 ?auto_208138 )
      ( MAKE-1PILE ?auto_208131 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_208139 - BLOCK
    )
    :vars
    (
      ?auto_208140 - BLOCK
      ?auto_208145 - BLOCK
      ?auto_208146 - BLOCK
      ?auto_208141 - BLOCK
      ?auto_208142 - BLOCK
      ?auto_208144 - BLOCK
      ?auto_208143 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_208140 ?auto_208139 ) ( ON-TABLE ?auto_208139 ) ( not ( = ?auto_208139 ?auto_208140 ) ) ( not ( = ?auto_208139 ?auto_208145 ) ) ( not ( = ?auto_208139 ?auto_208146 ) ) ( not ( = ?auto_208140 ?auto_208145 ) ) ( not ( = ?auto_208140 ?auto_208146 ) ) ( not ( = ?auto_208145 ?auto_208146 ) ) ( ON ?auto_208145 ?auto_208140 ) ( ON-TABLE ?auto_208141 ) ( ON ?auto_208142 ?auto_208141 ) ( not ( = ?auto_208141 ?auto_208142 ) ) ( not ( = ?auto_208141 ?auto_208144 ) ) ( not ( = ?auto_208141 ?auto_208143 ) ) ( not ( = ?auto_208141 ?auto_208146 ) ) ( not ( = ?auto_208142 ?auto_208144 ) ) ( not ( = ?auto_208142 ?auto_208143 ) ) ( not ( = ?auto_208142 ?auto_208146 ) ) ( not ( = ?auto_208144 ?auto_208143 ) ) ( not ( = ?auto_208144 ?auto_208146 ) ) ( not ( = ?auto_208143 ?auto_208146 ) ) ( not ( = ?auto_208139 ?auto_208143 ) ) ( not ( = ?auto_208139 ?auto_208141 ) ) ( not ( = ?auto_208139 ?auto_208142 ) ) ( not ( = ?auto_208139 ?auto_208144 ) ) ( not ( = ?auto_208140 ?auto_208143 ) ) ( not ( = ?auto_208140 ?auto_208141 ) ) ( not ( = ?auto_208140 ?auto_208142 ) ) ( not ( = ?auto_208140 ?auto_208144 ) ) ( not ( = ?auto_208145 ?auto_208143 ) ) ( not ( = ?auto_208145 ?auto_208141 ) ) ( not ( = ?auto_208145 ?auto_208142 ) ) ( not ( = ?auto_208145 ?auto_208144 ) ) ( ON ?auto_208146 ?auto_208145 ) ( ON ?auto_208143 ?auto_208146 ) ( CLEAR ?auto_208143 ) ( HOLDING ?auto_208144 ) ( CLEAR ?auto_208142 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_208141 ?auto_208142 ?auto_208144 )
      ( MAKE-1PILE ?auto_208139 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_208147 - BLOCK
    )
    :vars
    (
      ?auto_208153 - BLOCK
      ?auto_208151 - BLOCK
      ?auto_208150 - BLOCK
      ?auto_208152 - BLOCK
      ?auto_208148 - BLOCK
      ?auto_208154 - BLOCK
      ?auto_208149 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_208153 ?auto_208147 ) ( ON-TABLE ?auto_208147 ) ( not ( = ?auto_208147 ?auto_208153 ) ) ( not ( = ?auto_208147 ?auto_208151 ) ) ( not ( = ?auto_208147 ?auto_208150 ) ) ( not ( = ?auto_208153 ?auto_208151 ) ) ( not ( = ?auto_208153 ?auto_208150 ) ) ( not ( = ?auto_208151 ?auto_208150 ) ) ( ON ?auto_208151 ?auto_208153 ) ( ON-TABLE ?auto_208152 ) ( ON ?auto_208148 ?auto_208152 ) ( not ( = ?auto_208152 ?auto_208148 ) ) ( not ( = ?auto_208152 ?auto_208154 ) ) ( not ( = ?auto_208152 ?auto_208149 ) ) ( not ( = ?auto_208152 ?auto_208150 ) ) ( not ( = ?auto_208148 ?auto_208154 ) ) ( not ( = ?auto_208148 ?auto_208149 ) ) ( not ( = ?auto_208148 ?auto_208150 ) ) ( not ( = ?auto_208154 ?auto_208149 ) ) ( not ( = ?auto_208154 ?auto_208150 ) ) ( not ( = ?auto_208149 ?auto_208150 ) ) ( not ( = ?auto_208147 ?auto_208149 ) ) ( not ( = ?auto_208147 ?auto_208152 ) ) ( not ( = ?auto_208147 ?auto_208148 ) ) ( not ( = ?auto_208147 ?auto_208154 ) ) ( not ( = ?auto_208153 ?auto_208149 ) ) ( not ( = ?auto_208153 ?auto_208152 ) ) ( not ( = ?auto_208153 ?auto_208148 ) ) ( not ( = ?auto_208153 ?auto_208154 ) ) ( not ( = ?auto_208151 ?auto_208149 ) ) ( not ( = ?auto_208151 ?auto_208152 ) ) ( not ( = ?auto_208151 ?auto_208148 ) ) ( not ( = ?auto_208151 ?auto_208154 ) ) ( ON ?auto_208150 ?auto_208151 ) ( ON ?auto_208149 ?auto_208150 ) ( CLEAR ?auto_208148 ) ( ON ?auto_208154 ?auto_208149 ) ( CLEAR ?auto_208154 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_208147 ?auto_208153 ?auto_208151 ?auto_208150 ?auto_208149 )
      ( MAKE-1PILE ?auto_208147 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_208155 - BLOCK
    )
    :vars
    (
      ?auto_208162 - BLOCK
      ?auto_208158 - BLOCK
      ?auto_208157 - BLOCK
      ?auto_208160 - BLOCK
      ?auto_208161 - BLOCK
      ?auto_208159 - BLOCK
      ?auto_208156 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_208162 ?auto_208155 ) ( ON-TABLE ?auto_208155 ) ( not ( = ?auto_208155 ?auto_208162 ) ) ( not ( = ?auto_208155 ?auto_208158 ) ) ( not ( = ?auto_208155 ?auto_208157 ) ) ( not ( = ?auto_208162 ?auto_208158 ) ) ( not ( = ?auto_208162 ?auto_208157 ) ) ( not ( = ?auto_208158 ?auto_208157 ) ) ( ON ?auto_208158 ?auto_208162 ) ( ON-TABLE ?auto_208160 ) ( not ( = ?auto_208160 ?auto_208161 ) ) ( not ( = ?auto_208160 ?auto_208159 ) ) ( not ( = ?auto_208160 ?auto_208156 ) ) ( not ( = ?auto_208160 ?auto_208157 ) ) ( not ( = ?auto_208161 ?auto_208159 ) ) ( not ( = ?auto_208161 ?auto_208156 ) ) ( not ( = ?auto_208161 ?auto_208157 ) ) ( not ( = ?auto_208159 ?auto_208156 ) ) ( not ( = ?auto_208159 ?auto_208157 ) ) ( not ( = ?auto_208156 ?auto_208157 ) ) ( not ( = ?auto_208155 ?auto_208156 ) ) ( not ( = ?auto_208155 ?auto_208160 ) ) ( not ( = ?auto_208155 ?auto_208161 ) ) ( not ( = ?auto_208155 ?auto_208159 ) ) ( not ( = ?auto_208162 ?auto_208156 ) ) ( not ( = ?auto_208162 ?auto_208160 ) ) ( not ( = ?auto_208162 ?auto_208161 ) ) ( not ( = ?auto_208162 ?auto_208159 ) ) ( not ( = ?auto_208158 ?auto_208156 ) ) ( not ( = ?auto_208158 ?auto_208160 ) ) ( not ( = ?auto_208158 ?auto_208161 ) ) ( not ( = ?auto_208158 ?auto_208159 ) ) ( ON ?auto_208157 ?auto_208158 ) ( ON ?auto_208156 ?auto_208157 ) ( ON ?auto_208159 ?auto_208156 ) ( CLEAR ?auto_208159 ) ( HOLDING ?auto_208161 ) ( CLEAR ?auto_208160 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_208160 ?auto_208161 )
      ( MAKE-1PILE ?auto_208155 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_208163 - BLOCK
    )
    :vars
    (
      ?auto_208169 - BLOCK
      ?auto_208165 - BLOCK
      ?auto_208166 - BLOCK
      ?auto_208170 - BLOCK
      ?auto_208168 - BLOCK
      ?auto_208164 - BLOCK
      ?auto_208167 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_208169 ?auto_208163 ) ( ON-TABLE ?auto_208163 ) ( not ( = ?auto_208163 ?auto_208169 ) ) ( not ( = ?auto_208163 ?auto_208165 ) ) ( not ( = ?auto_208163 ?auto_208166 ) ) ( not ( = ?auto_208169 ?auto_208165 ) ) ( not ( = ?auto_208169 ?auto_208166 ) ) ( not ( = ?auto_208165 ?auto_208166 ) ) ( ON ?auto_208165 ?auto_208169 ) ( ON-TABLE ?auto_208170 ) ( not ( = ?auto_208170 ?auto_208168 ) ) ( not ( = ?auto_208170 ?auto_208164 ) ) ( not ( = ?auto_208170 ?auto_208167 ) ) ( not ( = ?auto_208170 ?auto_208166 ) ) ( not ( = ?auto_208168 ?auto_208164 ) ) ( not ( = ?auto_208168 ?auto_208167 ) ) ( not ( = ?auto_208168 ?auto_208166 ) ) ( not ( = ?auto_208164 ?auto_208167 ) ) ( not ( = ?auto_208164 ?auto_208166 ) ) ( not ( = ?auto_208167 ?auto_208166 ) ) ( not ( = ?auto_208163 ?auto_208167 ) ) ( not ( = ?auto_208163 ?auto_208170 ) ) ( not ( = ?auto_208163 ?auto_208168 ) ) ( not ( = ?auto_208163 ?auto_208164 ) ) ( not ( = ?auto_208169 ?auto_208167 ) ) ( not ( = ?auto_208169 ?auto_208170 ) ) ( not ( = ?auto_208169 ?auto_208168 ) ) ( not ( = ?auto_208169 ?auto_208164 ) ) ( not ( = ?auto_208165 ?auto_208167 ) ) ( not ( = ?auto_208165 ?auto_208170 ) ) ( not ( = ?auto_208165 ?auto_208168 ) ) ( not ( = ?auto_208165 ?auto_208164 ) ) ( ON ?auto_208166 ?auto_208165 ) ( ON ?auto_208167 ?auto_208166 ) ( ON ?auto_208164 ?auto_208167 ) ( CLEAR ?auto_208170 ) ( ON ?auto_208168 ?auto_208164 ) ( CLEAR ?auto_208168 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_208163 ?auto_208169 ?auto_208165 ?auto_208166 ?auto_208167 ?auto_208164 )
      ( MAKE-1PILE ?auto_208163 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_208171 - BLOCK
    )
    :vars
    (
      ?auto_208175 - BLOCK
      ?auto_208173 - BLOCK
      ?auto_208178 - BLOCK
      ?auto_208177 - BLOCK
      ?auto_208172 - BLOCK
      ?auto_208174 - BLOCK
      ?auto_208176 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_208175 ?auto_208171 ) ( ON-TABLE ?auto_208171 ) ( not ( = ?auto_208171 ?auto_208175 ) ) ( not ( = ?auto_208171 ?auto_208173 ) ) ( not ( = ?auto_208171 ?auto_208178 ) ) ( not ( = ?auto_208175 ?auto_208173 ) ) ( not ( = ?auto_208175 ?auto_208178 ) ) ( not ( = ?auto_208173 ?auto_208178 ) ) ( ON ?auto_208173 ?auto_208175 ) ( not ( = ?auto_208177 ?auto_208172 ) ) ( not ( = ?auto_208177 ?auto_208174 ) ) ( not ( = ?auto_208177 ?auto_208176 ) ) ( not ( = ?auto_208177 ?auto_208178 ) ) ( not ( = ?auto_208172 ?auto_208174 ) ) ( not ( = ?auto_208172 ?auto_208176 ) ) ( not ( = ?auto_208172 ?auto_208178 ) ) ( not ( = ?auto_208174 ?auto_208176 ) ) ( not ( = ?auto_208174 ?auto_208178 ) ) ( not ( = ?auto_208176 ?auto_208178 ) ) ( not ( = ?auto_208171 ?auto_208176 ) ) ( not ( = ?auto_208171 ?auto_208177 ) ) ( not ( = ?auto_208171 ?auto_208172 ) ) ( not ( = ?auto_208171 ?auto_208174 ) ) ( not ( = ?auto_208175 ?auto_208176 ) ) ( not ( = ?auto_208175 ?auto_208177 ) ) ( not ( = ?auto_208175 ?auto_208172 ) ) ( not ( = ?auto_208175 ?auto_208174 ) ) ( not ( = ?auto_208173 ?auto_208176 ) ) ( not ( = ?auto_208173 ?auto_208177 ) ) ( not ( = ?auto_208173 ?auto_208172 ) ) ( not ( = ?auto_208173 ?auto_208174 ) ) ( ON ?auto_208178 ?auto_208173 ) ( ON ?auto_208176 ?auto_208178 ) ( ON ?auto_208174 ?auto_208176 ) ( ON ?auto_208172 ?auto_208174 ) ( CLEAR ?auto_208172 ) ( HOLDING ?auto_208177 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_208177 )
      ( MAKE-1PILE ?auto_208171 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_208179 - BLOCK
    )
    :vars
    (
      ?auto_208181 - BLOCK
      ?auto_208184 - BLOCK
      ?auto_208180 - BLOCK
      ?auto_208183 - BLOCK
      ?auto_208185 - BLOCK
      ?auto_208182 - BLOCK
      ?auto_208186 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_208181 ?auto_208179 ) ( ON-TABLE ?auto_208179 ) ( not ( = ?auto_208179 ?auto_208181 ) ) ( not ( = ?auto_208179 ?auto_208184 ) ) ( not ( = ?auto_208179 ?auto_208180 ) ) ( not ( = ?auto_208181 ?auto_208184 ) ) ( not ( = ?auto_208181 ?auto_208180 ) ) ( not ( = ?auto_208184 ?auto_208180 ) ) ( ON ?auto_208184 ?auto_208181 ) ( not ( = ?auto_208183 ?auto_208185 ) ) ( not ( = ?auto_208183 ?auto_208182 ) ) ( not ( = ?auto_208183 ?auto_208186 ) ) ( not ( = ?auto_208183 ?auto_208180 ) ) ( not ( = ?auto_208185 ?auto_208182 ) ) ( not ( = ?auto_208185 ?auto_208186 ) ) ( not ( = ?auto_208185 ?auto_208180 ) ) ( not ( = ?auto_208182 ?auto_208186 ) ) ( not ( = ?auto_208182 ?auto_208180 ) ) ( not ( = ?auto_208186 ?auto_208180 ) ) ( not ( = ?auto_208179 ?auto_208186 ) ) ( not ( = ?auto_208179 ?auto_208183 ) ) ( not ( = ?auto_208179 ?auto_208185 ) ) ( not ( = ?auto_208179 ?auto_208182 ) ) ( not ( = ?auto_208181 ?auto_208186 ) ) ( not ( = ?auto_208181 ?auto_208183 ) ) ( not ( = ?auto_208181 ?auto_208185 ) ) ( not ( = ?auto_208181 ?auto_208182 ) ) ( not ( = ?auto_208184 ?auto_208186 ) ) ( not ( = ?auto_208184 ?auto_208183 ) ) ( not ( = ?auto_208184 ?auto_208185 ) ) ( not ( = ?auto_208184 ?auto_208182 ) ) ( ON ?auto_208180 ?auto_208184 ) ( ON ?auto_208186 ?auto_208180 ) ( ON ?auto_208182 ?auto_208186 ) ( ON ?auto_208185 ?auto_208182 ) ( ON ?auto_208183 ?auto_208185 ) ( CLEAR ?auto_208183 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_208179 ?auto_208181 ?auto_208184 ?auto_208180 ?auto_208186 ?auto_208182 ?auto_208185 )
      ( MAKE-1PILE ?auto_208179 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_208187 - BLOCK
    )
    :vars
    (
      ?auto_208188 - BLOCK
      ?auto_208189 - BLOCK
      ?auto_208193 - BLOCK
      ?auto_208190 - BLOCK
      ?auto_208192 - BLOCK
      ?auto_208194 - BLOCK
      ?auto_208191 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_208188 ?auto_208187 ) ( ON-TABLE ?auto_208187 ) ( not ( = ?auto_208187 ?auto_208188 ) ) ( not ( = ?auto_208187 ?auto_208189 ) ) ( not ( = ?auto_208187 ?auto_208193 ) ) ( not ( = ?auto_208188 ?auto_208189 ) ) ( not ( = ?auto_208188 ?auto_208193 ) ) ( not ( = ?auto_208189 ?auto_208193 ) ) ( ON ?auto_208189 ?auto_208188 ) ( not ( = ?auto_208190 ?auto_208192 ) ) ( not ( = ?auto_208190 ?auto_208194 ) ) ( not ( = ?auto_208190 ?auto_208191 ) ) ( not ( = ?auto_208190 ?auto_208193 ) ) ( not ( = ?auto_208192 ?auto_208194 ) ) ( not ( = ?auto_208192 ?auto_208191 ) ) ( not ( = ?auto_208192 ?auto_208193 ) ) ( not ( = ?auto_208194 ?auto_208191 ) ) ( not ( = ?auto_208194 ?auto_208193 ) ) ( not ( = ?auto_208191 ?auto_208193 ) ) ( not ( = ?auto_208187 ?auto_208191 ) ) ( not ( = ?auto_208187 ?auto_208190 ) ) ( not ( = ?auto_208187 ?auto_208192 ) ) ( not ( = ?auto_208187 ?auto_208194 ) ) ( not ( = ?auto_208188 ?auto_208191 ) ) ( not ( = ?auto_208188 ?auto_208190 ) ) ( not ( = ?auto_208188 ?auto_208192 ) ) ( not ( = ?auto_208188 ?auto_208194 ) ) ( not ( = ?auto_208189 ?auto_208191 ) ) ( not ( = ?auto_208189 ?auto_208190 ) ) ( not ( = ?auto_208189 ?auto_208192 ) ) ( not ( = ?auto_208189 ?auto_208194 ) ) ( ON ?auto_208193 ?auto_208189 ) ( ON ?auto_208191 ?auto_208193 ) ( ON ?auto_208194 ?auto_208191 ) ( ON ?auto_208192 ?auto_208194 ) ( HOLDING ?auto_208190 ) ( CLEAR ?auto_208192 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_208187 ?auto_208188 ?auto_208189 ?auto_208193 ?auto_208191 ?auto_208194 ?auto_208192 ?auto_208190 )
      ( MAKE-1PILE ?auto_208187 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_208195 - BLOCK
    )
    :vars
    (
      ?auto_208198 - BLOCK
      ?auto_208196 - BLOCK
      ?auto_208200 - BLOCK
      ?auto_208197 - BLOCK
      ?auto_208201 - BLOCK
      ?auto_208202 - BLOCK
      ?auto_208199 - BLOCK
      ?auto_208203 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_208198 ?auto_208195 ) ( ON-TABLE ?auto_208195 ) ( not ( = ?auto_208195 ?auto_208198 ) ) ( not ( = ?auto_208195 ?auto_208196 ) ) ( not ( = ?auto_208195 ?auto_208200 ) ) ( not ( = ?auto_208198 ?auto_208196 ) ) ( not ( = ?auto_208198 ?auto_208200 ) ) ( not ( = ?auto_208196 ?auto_208200 ) ) ( ON ?auto_208196 ?auto_208198 ) ( not ( = ?auto_208197 ?auto_208201 ) ) ( not ( = ?auto_208197 ?auto_208202 ) ) ( not ( = ?auto_208197 ?auto_208199 ) ) ( not ( = ?auto_208197 ?auto_208200 ) ) ( not ( = ?auto_208201 ?auto_208202 ) ) ( not ( = ?auto_208201 ?auto_208199 ) ) ( not ( = ?auto_208201 ?auto_208200 ) ) ( not ( = ?auto_208202 ?auto_208199 ) ) ( not ( = ?auto_208202 ?auto_208200 ) ) ( not ( = ?auto_208199 ?auto_208200 ) ) ( not ( = ?auto_208195 ?auto_208199 ) ) ( not ( = ?auto_208195 ?auto_208197 ) ) ( not ( = ?auto_208195 ?auto_208201 ) ) ( not ( = ?auto_208195 ?auto_208202 ) ) ( not ( = ?auto_208198 ?auto_208199 ) ) ( not ( = ?auto_208198 ?auto_208197 ) ) ( not ( = ?auto_208198 ?auto_208201 ) ) ( not ( = ?auto_208198 ?auto_208202 ) ) ( not ( = ?auto_208196 ?auto_208199 ) ) ( not ( = ?auto_208196 ?auto_208197 ) ) ( not ( = ?auto_208196 ?auto_208201 ) ) ( not ( = ?auto_208196 ?auto_208202 ) ) ( ON ?auto_208200 ?auto_208196 ) ( ON ?auto_208199 ?auto_208200 ) ( ON ?auto_208202 ?auto_208199 ) ( ON ?auto_208201 ?auto_208202 ) ( CLEAR ?auto_208201 ) ( ON ?auto_208197 ?auto_208203 ) ( CLEAR ?auto_208197 ) ( HAND-EMPTY ) ( not ( = ?auto_208195 ?auto_208203 ) ) ( not ( = ?auto_208198 ?auto_208203 ) ) ( not ( = ?auto_208196 ?auto_208203 ) ) ( not ( = ?auto_208200 ?auto_208203 ) ) ( not ( = ?auto_208197 ?auto_208203 ) ) ( not ( = ?auto_208201 ?auto_208203 ) ) ( not ( = ?auto_208202 ?auto_208203 ) ) ( not ( = ?auto_208199 ?auto_208203 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_208197 ?auto_208203 )
      ( MAKE-1PILE ?auto_208195 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_208204 - BLOCK
    )
    :vars
    (
      ?auto_208210 - BLOCK
      ?auto_208206 - BLOCK
      ?auto_208211 - BLOCK
      ?auto_208207 - BLOCK
      ?auto_208208 - BLOCK
      ?auto_208205 - BLOCK
      ?auto_208209 - BLOCK
      ?auto_208212 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_208210 ?auto_208204 ) ( ON-TABLE ?auto_208204 ) ( not ( = ?auto_208204 ?auto_208210 ) ) ( not ( = ?auto_208204 ?auto_208206 ) ) ( not ( = ?auto_208204 ?auto_208211 ) ) ( not ( = ?auto_208210 ?auto_208206 ) ) ( not ( = ?auto_208210 ?auto_208211 ) ) ( not ( = ?auto_208206 ?auto_208211 ) ) ( ON ?auto_208206 ?auto_208210 ) ( not ( = ?auto_208207 ?auto_208208 ) ) ( not ( = ?auto_208207 ?auto_208205 ) ) ( not ( = ?auto_208207 ?auto_208209 ) ) ( not ( = ?auto_208207 ?auto_208211 ) ) ( not ( = ?auto_208208 ?auto_208205 ) ) ( not ( = ?auto_208208 ?auto_208209 ) ) ( not ( = ?auto_208208 ?auto_208211 ) ) ( not ( = ?auto_208205 ?auto_208209 ) ) ( not ( = ?auto_208205 ?auto_208211 ) ) ( not ( = ?auto_208209 ?auto_208211 ) ) ( not ( = ?auto_208204 ?auto_208209 ) ) ( not ( = ?auto_208204 ?auto_208207 ) ) ( not ( = ?auto_208204 ?auto_208208 ) ) ( not ( = ?auto_208204 ?auto_208205 ) ) ( not ( = ?auto_208210 ?auto_208209 ) ) ( not ( = ?auto_208210 ?auto_208207 ) ) ( not ( = ?auto_208210 ?auto_208208 ) ) ( not ( = ?auto_208210 ?auto_208205 ) ) ( not ( = ?auto_208206 ?auto_208209 ) ) ( not ( = ?auto_208206 ?auto_208207 ) ) ( not ( = ?auto_208206 ?auto_208208 ) ) ( not ( = ?auto_208206 ?auto_208205 ) ) ( ON ?auto_208211 ?auto_208206 ) ( ON ?auto_208209 ?auto_208211 ) ( ON ?auto_208205 ?auto_208209 ) ( ON ?auto_208207 ?auto_208212 ) ( CLEAR ?auto_208207 ) ( not ( = ?auto_208204 ?auto_208212 ) ) ( not ( = ?auto_208210 ?auto_208212 ) ) ( not ( = ?auto_208206 ?auto_208212 ) ) ( not ( = ?auto_208211 ?auto_208212 ) ) ( not ( = ?auto_208207 ?auto_208212 ) ) ( not ( = ?auto_208208 ?auto_208212 ) ) ( not ( = ?auto_208205 ?auto_208212 ) ) ( not ( = ?auto_208209 ?auto_208212 ) ) ( HOLDING ?auto_208208 ) ( CLEAR ?auto_208205 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_208204 ?auto_208210 ?auto_208206 ?auto_208211 ?auto_208209 ?auto_208205 ?auto_208208 )
      ( MAKE-1PILE ?auto_208204 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_208213 - BLOCK
    )
    :vars
    (
      ?auto_208217 - BLOCK
      ?auto_208219 - BLOCK
      ?auto_208221 - BLOCK
      ?auto_208214 - BLOCK
      ?auto_208216 - BLOCK
      ?auto_208218 - BLOCK
      ?auto_208220 - BLOCK
      ?auto_208215 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_208217 ?auto_208213 ) ( ON-TABLE ?auto_208213 ) ( not ( = ?auto_208213 ?auto_208217 ) ) ( not ( = ?auto_208213 ?auto_208219 ) ) ( not ( = ?auto_208213 ?auto_208221 ) ) ( not ( = ?auto_208217 ?auto_208219 ) ) ( not ( = ?auto_208217 ?auto_208221 ) ) ( not ( = ?auto_208219 ?auto_208221 ) ) ( ON ?auto_208219 ?auto_208217 ) ( not ( = ?auto_208214 ?auto_208216 ) ) ( not ( = ?auto_208214 ?auto_208218 ) ) ( not ( = ?auto_208214 ?auto_208220 ) ) ( not ( = ?auto_208214 ?auto_208221 ) ) ( not ( = ?auto_208216 ?auto_208218 ) ) ( not ( = ?auto_208216 ?auto_208220 ) ) ( not ( = ?auto_208216 ?auto_208221 ) ) ( not ( = ?auto_208218 ?auto_208220 ) ) ( not ( = ?auto_208218 ?auto_208221 ) ) ( not ( = ?auto_208220 ?auto_208221 ) ) ( not ( = ?auto_208213 ?auto_208220 ) ) ( not ( = ?auto_208213 ?auto_208214 ) ) ( not ( = ?auto_208213 ?auto_208216 ) ) ( not ( = ?auto_208213 ?auto_208218 ) ) ( not ( = ?auto_208217 ?auto_208220 ) ) ( not ( = ?auto_208217 ?auto_208214 ) ) ( not ( = ?auto_208217 ?auto_208216 ) ) ( not ( = ?auto_208217 ?auto_208218 ) ) ( not ( = ?auto_208219 ?auto_208220 ) ) ( not ( = ?auto_208219 ?auto_208214 ) ) ( not ( = ?auto_208219 ?auto_208216 ) ) ( not ( = ?auto_208219 ?auto_208218 ) ) ( ON ?auto_208221 ?auto_208219 ) ( ON ?auto_208220 ?auto_208221 ) ( ON ?auto_208218 ?auto_208220 ) ( ON ?auto_208214 ?auto_208215 ) ( not ( = ?auto_208213 ?auto_208215 ) ) ( not ( = ?auto_208217 ?auto_208215 ) ) ( not ( = ?auto_208219 ?auto_208215 ) ) ( not ( = ?auto_208221 ?auto_208215 ) ) ( not ( = ?auto_208214 ?auto_208215 ) ) ( not ( = ?auto_208216 ?auto_208215 ) ) ( not ( = ?auto_208218 ?auto_208215 ) ) ( not ( = ?auto_208220 ?auto_208215 ) ) ( CLEAR ?auto_208218 ) ( ON ?auto_208216 ?auto_208214 ) ( CLEAR ?auto_208216 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_208215 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_208215 ?auto_208214 )
      ( MAKE-1PILE ?auto_208213 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_208222 - BLOCK
    )
    :vars
    (
      ?auto_208224 - BLOCK
      ?auto_208230 - BLOCK
      ?auto_208229 - BLOCK
      ?auto_208228 - BLOCK
      ?auto_208225 - BLOCK
      ?auto_208223 - BLOCK
      ?auto_208227 - BLOCK
      ?auto_208226 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_208224 ?auto_208222 ) ( ON-TABLE ?auto_208222 ) ( not ( = ?auto_208222 ?auto_208224 ) ) ( not ( = ?auto_208222 ?auto_208230 ) ) ( not ( = ?auto_208222 ?auto_208229 ) ) ( not ( = ?auto_208224 ?auto_208230 ) ) ( not ( = ?auto_208224 ?auto_208229 ) ) ( not ( = ?auto_208230 ?auto_208229 ) ) ( ON ?auto_208230 ?auto_208224 ) ( not ( = ?auto_208228 ?auto_208225 ) ) ( not ( = ?auto_208228 ?auto_208223 ) ) ( not ( = ?auto_208228 ?auto_208227 ) ) ( not ( = ?auto_208228 ?auto_208229 ) ) ( not ( = ?auto_208225 ?auto_208223 ) ) ( not ( = ?auto_208225 ?auto_208227 ) ) ( not ( = ?auto_208225 ?auto_208229 ) ) ( not ( = ?auto_208223 ?auto_208227 ) ) ( not ( = ?auto_208223 ?auto_208229 ) ) ( not ( = ?auto_208227 ?auto_208229 ) ) ( not ( = ?auto_208222 ?auto_208227 ) ) ( not ( = ?auto_208222 ?auto_208228 ) ) ( not ( = ?auto_208222 ?auto_208225 ) ) ( not ( = ?auto_208222 ?auto_208223 ) ) ( not ( = ?auto_208224 ?auto_208227 ) ) ( not ( = ?auto_208224 ?auto_208228 ) ) ( not ( = ?auto_208224 ?auto_208225 ) ) ( not ( = ?auto_208224 ?auto_208223 ) ) ( not ( = ?auto_208230 ?auto_208227 ) ) ( not ( = ?auto_208230 ?auto_208228 ) ) ( not ( = ?auto_208230 ?auto_208225 ) ) ( not ( = ?auto_208230 ?auto_208223 ) ) ( ON ?auto_208229 ?auto_208230 ) ( ON ?auto_208227 ?auto_208229 ) ( ON ?auto_208228 ?auto_208226 ) ( not ( = ?auto_208222 ?auto_208226 ) ) ( not ( = ?auto_208224 ?auto_208226 ) ) ( not ( = ?auto_208230 ?auto_208226 ) ) ( not ( = ?auto_208229 ?auto_208226 ) ) ( not ( = ?auto_208228 ?auto_208226 ) ) ( not ( = ?auto_208225 ?auto_208226 ) ) ( not ( = ?auto_208223 ?auto_208226 ) ) ( not ( = ?auto_208227 ?auto_208226 ) ) ( ON ?auto_208225 ?auto_208228 ) ( CLEAR ?auto_208225 ) ( ON-TABLE ?auto_208226 ) ( HOLDING ?auto_208223 ) ( CLEAR ?auto_208227 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_208222 ?auto_208224 ?auto_208230 ?auto_208229 ?auto_208227 ?auto_208223 )
      ( MAKE-1PILE ?auto_208222 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_208231 - BLOCK
    )
    :vars
    (
      ?auto_208239 - BLOCK
      ?auto_208234 - BLOCK
      ?auto_208237 - BLOCK
      ?auto_208236 - BLOCK
      ?auto_208232 - BLOCK
      ?auto_208235 - BLOCK
      ?auto_208238 - BLOCK
      ?auto_208233 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_208239 ?auto_208231 ) ( ON-TABLE ?auto_208231 ) ( not ( = ?auto_208231 ?auto_208239 ) ) ( not ( = ?auto_208231 ?auto_208234 ) ) ( not ( = ?auto_208231 ?auto_208237 ) ) ( not ( = ?auto_208239 ?auto_208234 ) ) ( not ( = ?auto_208239 ?auto_208237 ) ) ( not ( = ?auto_208234 ?auto_208237 ) ) ( ON ?auto_208234 ?auto_208239 ) ( not ( = ?auto_208236 ?auto_208232 ) ) ( not ( = ?auto_208236 ?auto_208235 ) ) ( not ( = ?auto_208236 ?auto_208238 ) ) ( not ( = ?auto_208236 ?auto_208237 ) ) ( not ( = ?auto_208232 ?auto_208235 ) ) ( not ( = ?auto_208232 ?auto_208238 ) ) ( not ( = ?auto_208232 ?auto_208237 ) ) ( not ( = ?auto_208235 ?auto_208238 ) ) ( not ( = ?auto_208235 ?auto_208237 ) ) ( not ( = ?auto_208238 ?auto_208237 ) ) ( not ( = ?auto_208231 ?auto_208238 ) ) ( not ( = ?auto_208231 ?auto_208236 ) ) ( not ( = ?auto_208231 ?auto_208232 ) ) ( not ( = ?auto_208231 ?auto_208235 ) ) ( not ( = ?auto_208239 ?auto_208238 ) ) ( not ( = ?auto_208239 ?auto_208236 ) ) ( not ( = ?auto_208239 ?auto_208232 ) ) ( not ( = ?auto_208239 ?auto_208235 ) ) ( not ( = ?auto_208234 ?auto_208238 ) ) ( not ( = ?auto_208234 ?auto_208236 ) ) ( not ( = ?auto_208234 ?auto_208232 ) ) ( not ( = ?auto_208234 ?auto_208235 ) ) ( ON ?auto_208237 ?auto_208234 ) ( ON ?auto_208238 ?auto_208237 ) ( ON ?auto_208236 ?auto_208233 ) ( not ( = ?auto_208231 ?auto_208233 ) ) ( not ( = ?auto_208239 ?auto_208233 ) ) ( not ( = ?auto_208234 ?auto_208233 ) ) ( not ( = ?auto_208237 ?auto_208233 ) ) ( not ( = ?auto_208236 ?auto_208233 ) ) ( not ( = ?auto_208232 ?auto_208233 ) ) ( not ( = ?auto_208235 ?auto_208233 ) ) ( not ( = ?auto_208238 ?auto_208233 ) ) ( ON ?auto_208232 ?auto_208236 ) ( ON-TABLE ?auto_208233 ) ( CLEAR ?auto_208238 ) ( ON ?auto_208235 ?auto_208232 ) ( CLEAR ?auto_208235 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_208233 ?auto_208236 ?auto_208232 )
      ( MAKE-1PILE ?auto_208231 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_208240 - BLOCK
    )
    :vars
    (
      ?auto_208245 - BLOCK
      ?auto_208247 - BLOCK
      ?auto_208246 - BLOCK
      ?auto_208241 - BLOCK
      ?auto_208243 - BLOCK
      ?auto_208242 - BLOCK
      ?auto_208244 - BLOCK
      ?auto_208248 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_208245 ?auto_208240 ) ( ON-TABLE ?auto_208240 ) ( not ( = ?auto_208240 ?auto_208245 ) ) ( not ( = ?auto_208240 ?auto_208247 ) ) ( not ( = ?auto_208240 ?auto_208246 ) ) ( not ( = ?auto_208245 ?auto_208247 ) ) ( not ( = ?auto_208245 ?auto_208246 ) ) ( not ( = ?auto_208247 ?auto_208246 ) ) ( ON ?auto_208247 ?auto_208245 ) ( not ( = ?auto_208241 ?auto_208243 ) ) ( not ( = ?auto_208241 ?auto_208242 ) ) ( not ( = ?auto_208241 ?auto_208244 ) ) ( not ( = ?auto_208241 ?auto_208246 ) ) ( not ( = ?auto_208243 ?auto_208242 ) ) ( not ( = ?auto_208243 ?auto_208244 ) ) ( not ( = ?auto_208243 ?auto_208246 ) ) ( not ( = ?auto_208242 ?auto_208244 ) ) ( not ( = ?auto_208242 ?auto_208246 ) ) ( not ( = ?auto_208244 ?auto_208246 ) ) ( not ( = ?auto_208240 ?auto_208244 ) ) ( not ( = ?auto_208240 ?auto_208241 ) ) ( not ( = ?auto_208240 ?auto_208243 ) ) ( not ( = ?auto_208240 ?auto_208242 ) ) ( not ( = ?auto_208245 ?auto_208244 ) ) ( not ( = ?auto_208245 ?auto_208241 ) ) ( not ( = ?auto_208245 ?auto_208243 ) ) ( not ( = ?auto_208245 ?auto_208242 ) ) ( not ( = ?auto_208247 ?auto_208244 ) ) ( not ( = ?auto_208247 ?auto_208241 ) ) ( not ( = ?auto_208247 ?auto_208243 ) ) ( not ( = ?auto_208247 ?auto_208242 ) ) ( ON ?auto_208246 ?auto_208247 ) ( ON ?auto_208241 ?auto_208248 ) ( not ( = ?auto_208240 ?auto_208248 ) ) ( not ( = ?auto_208245 ?auto_208248 ) ) ( not ( = ?auto_208247 ?auto_208248 ) ) ( not ( = ?auto_208246 ?auto_208248 ) ) ( not ( = ?auto_208241 ?auto_208248 ) ) ( not ( = ?auto_208243 ?auto_208248 ) ) ( not ( = ?auto_208242 ?auto_208248 ) ) ( not ( = ?auto_208244 ?auto_208248 ) ) ( ON ?auto_208243 ?auto_208241 ) ( ON-TABLE ?auto_208248 ) ( ON ?auto_208242 ?auto_208243 ) ( CLEAR ?auto_208242 ) ( HOLDING ?auto_208244 ) ( CLEAR ?auto_208246 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_208240 ?auto_208245 ?auto_208247 ?auto_208246 ?auto_208244 )
      ( MAKE-1PILE ?auto_208240 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_208249 - BLOCK
    )
    :vars
    (
      ?auto_208251 - BLOCK
      ?auto_208254 - BLOCK
      ?auto_208252 - BLOCK
      ?auto_208257 - BLOCK
      ?auto_208255 - BLOCK
      ?auto_208253 - BLOCK
      ?auto_208250 - BLOCK
      ?auto_208256 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_208251 ?auto_208249 ) ( ON-TABLE ?auto_208249 ) ( not ( = ?auto_208249 ?auto_208251 ) ) ( not ( = ?auto_208249 ?auto_208254 ) ) ( not ( = ?auto_208249 ?auto_208252 ) ) ( not ( = ?auto_208251 ?auto_208254 ) ) ( not ( = ?auto_208251 ?auto_208252 ) ) ( not ( = ?auto_208254 ?auto_208252 ) ) ( ON ?auto_208254 ?auto_208251 ) ( not ( = ?auto_208257 ?auto_208255 ) ) ( not ( = ?auto_208257 ?auto_208253 ) ) ( not ( = ?auto_208257 ?auto_208250 ) ) ( not ( = ?auto_208257 ?auto_208252 ) ) ( not ( = ?auto_208255 ?auto_208253 ) ) ( not ( = ?auto_208255 ?auto_208250 ) ) ( not ( = ?auto_208255 ?auto_208252 ) ) ( not ( = ?auto_208253 ?auto_208250 ) ) ( not ( = ?auto_208253 ?auto_208252 ) ) ( not ( = ?auto_208250 ?auto_208252 ) ) ( not ( = ?auto_208249 ?auto_208250 ) ) ( not ( = ?auto_208249 ?auto_208257 ) ) ( not ( = ?auto_208249 ?auto_208255 ) ) ( not ( = ?auto_208249 ?auto_208253 ) ) ( not ( = ?auto_208251 ?auto_208250 ) ) ( not ( = ?auto_208251 ?auto_208257 ) ) ( not ( = ?auto_208251 ?auto_208255 ) ) ( not ( = ?auto_208251 ?auto_208253 ) ) ( not ( = ?auto_208254 ?auto_208250 ) ) ( not ( = ?auto_208254 ?auto_208257 ) ) ( not ( = ?auto_208254 ?auto_208255 ) ) ( not ( = ?auto_208254 ?auto_208253 ) ) ( ON ?auto_208252 ?auto_208254 ) ( ON ?auto_208257 ?auto_208256 ) ( not ( = ?auto_208249 ?auto_208256 ) ) ( not ( = ?auto_208251 ?auto_208256 ) ) ( not ( = ?auto_208254 ?auto_208256 ) ) ( not ( = ?auto_208252 ?auto_208256 ) ) ( not ( = ?auto_208257 ?auto_208256 ) ) ( not ( = ?auto_208255 ?auto_208256 ) ) ( not ( = ?auto_208253 ?auto_208256 ) ) ( not ( = ?auto_208250 ?auto_208256 ) ) ( ON ?auto_208255 ?auto_208257 ) ( ON-TABLE ?auto_208256 ) ( ON ?auto_208253 ?auto_208255 ) ( CLEAR ?auto_208252 ) ( ON ?auto_208250 ?auto_208253 ) ( CLEAR ?auto_208250 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_208256 ?auto_208257 ?auto_208255 ?auto_208253 )
      ( MAKE-1PILE ?auto_208249 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_208258 - BLOCK
    )
    :vars
    (
      ?auto_208261 - BLOCK
      ?auto_208259 - BLOCK
      ?auto_208262 - BLOCK
      ?auto_208266 - BLOCK
      ?auto_208263 - BLOCK
      ?auto_208264 - BLOCK
      ?auto_208265 - BLOCK
      ?auto_208260 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_208261 ?auto_208258 ) ( ON-TABLE ?auto_208258 ) ( not ( = ?auto_208258 ?auto_208261 ) ) ( not ( = ?auto_208258 ?auto_208259 ) ) ( not ( = ?auto_208258 ?auto_208262 ) ) ( not ( = ?auto_208261 ?auto_208259 ) ) ( not ( = ?auto_208261 ?auto_208262 ) ) ( not ( = ?auto_208259 ?auto_208262 ) ) ( ON ?auto_208259 ?auto_208261 ) ( not ( = ?auto_208266 ?auto_208263 ) ) ( not ( = ?auto_208266 ?auto_208264 ) ) ( not ( = ?auto_208266 ?auto_208265 ) ) ( not ( = ?auto_208266 ?auto_208262 ) ) ( not ( = ?auto_208263 ?auto_208264 ) ) ( not ( = ?auto_208263 ?auto_208265 ) ) ( not ( = ?auto_208263 ?auto_208262 ) ) ( not ( = ?auto_208264 ?auto_208265 ) ) ( not ( = ?auto_208264 ?auto_208262 ) ) ( not ( = ?auto_208265 ?auto_208262 ) ) ( not ( = ?auto_208258 ?auto_208265 ) ) ( not ( = ?auto_208258 ?auto_208266 ) ) ( not ( = ?auto_208258 ?auto_208263 ) ) ( not ( = ?auto_208258 ?auto_208264 ) ) ( not ( = ?auto_208261 ?auto_208265 ) ) ( not ( = ?auto_208261 ?auto_208266 ) ) ( not ( = ?auto_208261 ?auto_208263 ) ) ( not ( = ?auto_208261 ?auto_208264 ) ) ( not ( = ?auto_208259 ?auto_208265 ) ) ( not ( = ?auto_208259 ?auto_208266 ) ) ( not ( = ?auto_208259 ?auto_208263 ) ) ( not ( = ?auto_208259 ?auto_208264 ) ) ( ON ?auto_208266 ?auto_208260 ) ( not ( = ?auto_208258 ?auto_208260 ) ) ( not ( = ?auto_208261 ?auto_208260 ) ) ( not ( = ?auto_208259 ?auto_208260 ) ) ( not ( = ?auto_208262 ?auto_208260 ) ) ( not ( = ?auto_208266 ?auto_208260 ) ) ( not ( = ?auto_208263 ?auto_208260 ) ) ( not ( = ?auto_208264 ?auto_208260 ) ) ( not ( = ?auto_208265 ?auto_208260 ) ) ( ON ?auto_208263 ?auto_208266 ) ( ON-TABLE ?auto_208260 ) ( ON ?auto_208264 ?auto_208263 ) ( ON ?auto_208265 ?auto_208264 ) ( CLEAR ?auto_208265 ) ( HOLDING ?auto_208262 ) ( CLEAR ?auto_208259 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_208258 ?auto_208261 ?auto_208259 ?auto_208262 )
      ( MAKE-1PILE ?auto_208258 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_208267 - BLOCK
    )
    :vars
    (
      ?auto_208270 - BLOCK
      ?auto_208272 - BLOCK
      ?auto_208269 - BLOCK
      ?auto_208275 - BLOCK
      ?auto_208274 - BLOCK
      ?auto_208271 - BLOCK
      ?auto_208273 - BLOCK
      ?auto_208268 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_208270 ?auto_208267 ) ( ON-TABLE ?auto_208267 ) ( not ( = ?auto_208267 ?auto_208270 ) ) ( not ( = ?auto_208267 ?auto_208272 ) ) ( not ( = ?auto_208267 ?auto_208269 ) ) ( not ( = ?auto_208270 ?auto_208272 ) ) ( not ( = ?auto_208270 ?auto_208269 ) ) ( not ( = ?auto_208272 ?auto_208269 ) ) ( ON ?auto_208272 ?auto_208270 ) ( not ( = ?auto_208275 ?auto_208274 ) ) ( not ( = ?auto_208275 ?auto_208271 ) ) ( not ( = ?auto_208275 ?auto_208273 ) ) ( not ( = ?auto_208275 ?auto_208269 ) ) ( not ( = ?auto_208274 ?auto_208271 ) ) ( not ( = ?auto_208274 ?auto_208273 ) ) ( not ( = ?auto_208274 ?auto_208269 ) ) ( not ( = ?auto_208271 ?auto_208273 ) ) ( not ( = ?auto_208271 ?auto_208269 ) ) ( not ( = ?auto_208273 ?auto_208269 ) ) ( not ( = ?auto_208267 ?auto_208273 ) ) ( not ( = ?auto_208267 ?auto_208275 ) ) ( not ( = ?auto_208267 ?auto_208274 ) ) ( not ( = ?auto_208267 ?auto_208271 ) ) ( not ( = ?auto_208270 ?auto_208273 ) ) ( not ( = ?auto_208270 ?auto_208275 ) ) ( not ( = ?auto_208270 ?auto_208274 ) ) ( not ( = ?auto_208270 ?auto_208271 ) ) ( not ( = ?auto_208272 ?auto_208273 ) ) ( not ( = ?auto_208272 ?auto_208275 ) ) ( not ( = ?auto_208272 ?auto_208274 ) ) ( not ( = ?auto_208272 ?auto_208271 ) ) ( ON ?auto_208275 ?auto_208268 ) ( not ( = ?auto_208267 ?auto_208268 ) ) ( not ( = ?auto_208270 ?auto_208268 ) ) ( not ( = ?auto_208272 ?auto_208268 ) ) ( not ( = ?auto_208269 ?auto_208268 ) ) ( not ( = ?auto_208275 ?auto_208268 ) ) ( not ( = ?auto_208274 ?auto_208268 ) ) ( not ( = ?auto_208271 ?auto_208268 ) ) ( not ( = ?auto_208273 ?auto_208268 ) ) ( ON ?auto_208274 ?auto_208275 ) ( ON-TABLE ?auto_208268 ) ( ON ?auto_208271 ?auto_208274 ) ( ON ?auto_208273 ?auto_208271 ) ( CLEAR ?auto_208272 ) ( ON ?auto_208269 ?auto_208273 ) ( CLEAR ?auto_208269 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_208268 ?auto_208275 ?auto_208274 ?auto_208271 ?auto_208273 )
      ( MAKE-1PILE ?auto_208267 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_208276 - BLOCK
    )
    :vars
    (
      ?auto_208280 - BLOCK
      ?auto_208278 - BLOCK
      ?auto_208281 - BLOCK
      ?auto_208284 - BLOCK
      ?auto_208283 - BLOCK
      ?auto_208279 - BLOCK
      ?auto_208282 - BLOCK
      ?auto_208277 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_208280 ?auto_208276 ) ( ON-TABLE ?auto_208276 ) ( not ( = ?auto_208276 ?auto_208280 ) ) ( not ( = ?auto_208276 ?auto_208278 ) ) ( not ( = ?auto_208276 ?auto_208281 ) ) ( not ( = ?auto_208280 ?auto_208278 ) ) ( not ( = ?auto_208280 ?auto_208281 ) ) ( not ( = ?auto_208278 ?auto_208281 ) ) ( not ( = ?auto_208284 ?auto_208283 ) ) ( not ( = ?auto_208284 ?auto_208279 ) ) ( not ( = ?auto_208284 ?auto_208282 ) ) ( not ( = ?auto_208284 ?auto_208281 ) ) ( not ( = ?auto_208283 ?auto_208279 ) ) ( not ( = ?auto_208283 ?auto_208282 ) ) ( not ( = ?auto_208283 ?auto_208281 ) ) ( not ( = ?auto_208279 ?auto_208282 ) ) ( not ( = ?auto_208279 ?auto_208281 ) ) ( not ( = ?auto_208282 ?auto_208281 ) ) ( not ( = ?auto_208276 ?auto_208282 ) ) ( not ( = ?auto_208276 ?auto_208284 ) ) ( not ( = ?auto_208276 ?auto_208283 ) ) ( not ( = ?auto_208276 ?auto_208279 ) ) ( not ( = ?auto_208280 ?auto_208282 ) ) ( not ( = ?auto_208280 ?auto_208284 ) ) ( not ( = ?auto_208280 ?auto_208283 ) ) ( not ( = ?auto_208280 ?auto_208279 ) ) ( not ( = ?auto_208278 ?auto_208282 ) ) ( not ( = ?auto_208278 ?auto_208284 ) ) ( not ( = ?auto_208278 ?auto_208283 ) ) ( not ( = ?auto_208278 ?auto_208279 ) ) ( ON ?auto_208284 ?auto_208277 ) ( not ( = ?auto_208276 ?auto_208277 ) ) ( not ( = ?auto_208280 ?auto_208277 ) ) ( not ( = ?auto_208278 ?auto_208277 ) ) ( not ( = ?auto_208281 ?auto_208277 ) ) ( not ( = ?auto_208284 ?auto_208277 ) ) ( not ( = ?auto_208283 ?auto_208277 ) ) ( not ( = ?auto_208279 ?auto_208277 ) ) ( not ( = ?auto_208282 ?auto_208277 ) ) ( ON ?auto_208283 ?auto_208284 ) ( ON-TABLE ?auto_208277 ) ( ON ?auto_208279 ?auto_208283 ) ( ON ?auto_208282 ?auto_208279 ) ( ON ?auto_208281 ?auto_208282 ) ( CLEAR ?auto_208281 ) ( HOLDING ?auto_208278 ) ( CLEAR ?auto_208280 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_208276 ?auto_208280 ?auto_208278 )
      ( MAKE-1PILE ?auto_208276 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_208285 - BLOCK
    )
    :vars
    (
      ?auto_208288 - BLOCK
      ?auto_208293 - BLOCK
      ?auto_208291 - BLOCK
      ?auto_208287 - BLOCK
      ?auto_208286 - BLOCK
      ?auto_208292 - BLOCK
      ?auto_208289 - BLOCK
      ?auto_208290 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_208288 ?auto_208285 ) ( ON-TABLE ?auto_208285 ) ( not ( = ?auto_208285 ?auto_208288 ) ) ( not ( = ?auto_208285 ?auto_208293 ) ) ( not ( = ?auto_208285 ?auto_208291 ) ) ( not ( = ?auto_208288 ?auto_208293 ) ) ( not ( = ?auto_208288 ?auto_208291 ) ) ( not ( = ?auto_208293 ?auto_208291 ) ) ( not ( = ?auto_208287 ?auto_208286 ) ) ( not ( = ?auto_208287 ?auto_208292 ) ) ( not ( = ?auto_208287 ?auto_208289 ) ) ( not ( = ?auto_208287 ?auto_208291 ) ) ( not ( = ?auto_208286 ?auto_208292 ) ) ( not ( = ?auto_208286 ?auto_208289 ) ) ( not ( = ?auto_208286 ?auto_208291 ) ) ( not ( = ?auto_208292 ?auto_208289 ) ) ( not ( = ?auto_208292 ?auto_208291 ) ) ( not ( = ?auto_208289 ?auto_208291 ) ) ( not ( = ?auto_208285 ?auto_208289 ) ) ( not ( = ?auto_208285 ?auto_208287 ) ) ( not ( = ?auto_208285 ?auto_208286 ) ) ( not ( = ?auto_208285 ?auto_208292 ) ) ( not ( = ?auto_208288 ?auto_208289 ) ) ( not ( = ?auto_208288 ?auto_208287 ) ) ( not ( = ?auto_208288 ?auto_208286 ) ) ( not ( = ?auto_208288 ?auto_208292 ) ) ( not ( = ?auto_208293 ?auto_208289 ) ) ( not ( = ?auto_208293 ?auto_208287 ) ) ( not ( = ?auto_208293 ?auto_208286 ) ) ( not ( = ?auto_208293 ?auto_208292 ) ) ( ON ?auto_208287 ?auto_208290 ) ( not ( = ?auto_208285 ?auto_208290 ) ) ( not ( = ?auto_208288 ?auto_208290 ) ) ( not ( = ?auto_208293 ?auto_208290 ) ) ( not ( = ?auto_208291 ?auto_208290 ) ) ( not ( = ?auto_208287 ?auto_208290 ) ) ( not ( = ?auto_208286 ?auto_208290 ) ) ( not ( = ?auto_208292 ?auto_208290 ) ) ( not ( = ?auto_208289 ?auto_208290 ) ) ( ON ?auto_208286 ?auto_208287 ) ( ON-TABLE ?auto_208290 ) ( ON ?auto_208292 ?auto_208286 ) ( ON ?auto_208289 ?auto_208292 ) ( ON ?auto_208291 ?auto_208289 ) ( CLEAR ?auto_208288 ) ( ON ?auto_208293 ?auto_208291 ) ( CLEAR ?auto_208293 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_208290 ?auto_208287 ?auto_208286 ?auto_208292 ?auto_208289 ?auto_208291 )
      ( MAKE-1PILE ?auto_208285 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_208312 - BLOCK
    )
    :vars
    (
      ?auto_208315 - BLOCK
      ?auto_208317 - BLOCK
      ?auto_208316 - BLOCK
      ?auto_208319 - BLOCK
      ?auto_208318 - BLOCK
      ?auto_208314 - BLOCK
      ?auto_208313 - BLOCK
      ?auto_208320 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_208312 ?auto_208315 ) ) ( not ( = ?auto_208312 ?auto_208317 ) ) ( not ( = ?auto_208312 ?auto_208316 ) ) ( not ( = ?auto_208315 ?auto_208317 ) ) ( not ( = ?auto_208315 ?auto_208316 ) ) ( not ( = ?auto_208317 ?auto_208316 ) ) ( not ( = ?auto_208319 ?auto_208318 ) ) ( not ( = ?auto_208319 ?auto_208314 ) ) ( not ( = ?auto_208319 ?auto_208313 ) ) ( not ( = ?auto_208319 ?auto_208316 ) ) ( not ( = ?auto_208318 ?auto_208314 ) ) ( not ( = ?auto_208318 ?auto_208313 ) ) ( not ( = ?auto_208318 ?auto_208316 ) ) ( not ( = ?auto_208314 ?auto_208313 ) ) ( not ( = ?auto_208314 ?auto_208316 ) ) ( not ( = ?auto_208313 ?auto_208316 ) ) ( not ( = ?auto_208312 ?auto_208313 ) ) ( not ( = ?auto_208312 ?auto_208319 ) ) ( not ( = ?auto_208312 ?auto_208318 ) ) ( not ( = ?auto_208312 ?auto_208314 ) ) ( not ( = ?auto_208315 ?auto_208313 ) ) ( not ( = ?auto_208315 ?auto_208319 ) ) ( not ( = ?auto_208315 ?auto_208318 ) ) ( not ( = ?auto_208315 ?auto_208314 ) ) ( not ( = ?auto_208317 ?auto_208313 ) ) ( not ( = ?auto_208317 ?auto_208319 ) ) ( not ( = ?auto_208317 ?auto_208318 ) ) ( not ( = ?auto_208317 ?auto_208314 ) ) ( ON ?auto_208319 ?auto_208320 ) ( not ( = ?auto_208312 ?auto_208320 ) ) ( not ( = ?auto_208315 ?auto_208320 ) ) ( not ( = ?auto_208317 ?auto_208320 ) ) ( not ( = ?auto_208316 ?auto_208320 ) ) ( not ( = ?auto_208319 ?auto_208320 ) ) ( not ( = ?auto_208318 ?auto_208320 ) ) ( not ( = ?auto_208314 ?auto_208320 ) ) ( not ( = ?auto_208313 ?auto_208320 ) ) ( ON ?auto_208318 ?auto_208319 ) ( ON-TABLE ?auto_208320 ) ( ON ?auto_208314 ?auto_208318 ) ( ON ?auto_208313 ?auto_208314 ) ( ON ?auto_208316 ?auto_208313 ) ( ON ?auto_208317 ?auto_208316 ) ( ON ?auto_208315 ?auto_208317 ) ( CLEAR ?auto_208315 ) ( HOLDING ?auto_208312 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_208312 ?auto_208315 )
      ( MAKE-1PILE ?auto_208312 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_208321 - BLOCK
    )
    :vars
    (
      ?auto_208328 - BLOCK
      ?auto_208324 - BLOCK
      ?auto_208325 - BLOCK
      ?auto_208327 - BLOCK
      ?auto_208329 - BLOCK
      ?auto_208323 - BLOCK
      ?auto_208326 - BLOCK
      ?auto_208322 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_208321 ?auto_208328 ) ) ( not ( = ?auto_208321 ?auto_208324 ) ) ( not ( = ?auto_208321 ?auto_208325 ) ) ( not ( = ?auto_208328 ?auto_208324 ) ) ( not ( = ?auto_208328 ?auto_208325 ) ) ( not ( = ?auto_208324 ?auto_208325 ) ) ( not ( = ?auto_208327 ?auto_208329 ) ) ( not ( = ?auto_208327 ?auto_208323 ) ) ( not ( = ?auto_208327 ?auto_208326 ) ) ( not ( = ?auto_208327 ?auto_208325 ) ) ( not ( = ?auto_208329 ?auto_208323 ) ) ( not ( = ?auto_208329 ?auto_208326 ) ) ( not ( = ?auto_208329 ?auto_208325 ) ) ( not ( = ?auto_208323 ?auto_208326 ) ) ( not ( = ?auto_208323 ?auto_208325 ) ) ( not ( = ?auto_208326 ?auto_208325 ) ) ( not ( = ?auto_208321 ?auto_208326 ) ) ( not ( = ?auto_208321 ?auto_208327 ) ) ( not ( = ?auto_208321 ?auto_208329 ) ) ( not ( = ?auto_208321 ?auto_208323 ) ) ( not ( = ?auto_208328 ?auto_208326 ) ) ( not ( = ?auto_208328 ?auto_208327 ) ) ( not ( = ?auto_208328 ?auto_208329 ) ) ( not ( = ?auto_208328 ?auto_208323 ) ) ( not ( = ?auto_208324 ?auto_208326 ) ) ( not ( = ?auto_208324 ?auto_208327 ) ) ( not ( = ?auto_208324 ?auto_208329 ) ) ( not ( = ?auto_208324 ?auto_208323 ) ) ( ON ?auto_208327 ?auto_208322 ) ( not ( = ?auto_208321 ?auto_208322 ) ) ( not ( = ?auto_208328 ?auto_208322 ) ) ( not ( = ?auto_208324 ?auto_208322 ) ) ( not ( = ?auto_208325 ?auto_208322 ) ) ( not ( = ?auto_208327 ?auto_208322 ) ) ( not ( = ?auto_208329 ?auto_208322 ) ) ( not ( = ?auto_208323 ?auto_208322 ) ) ( not ( = ?auto_208326 ?auto_208322 ) ) ( ON ?auto_208329 ?auto_208327 ) ( ON-TABLE ?auto_208322 ) ( ON ?auto_208323 ?auto_208329 ) ( ON ?auto_208326 ?auto_208323 ) ( ON ?auto_208325 ?auto_208326 ) ( ON ?auto_208324 ?auto_208325 ) ( ON ?auto_208328 ?auto_208324 ) ( ON ?auto_208321 ?auto_208328 ) ( CLEAR ?auto_208321 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_208322 ?auto_208327 ?auto_208329 ?auto_208323 ?auto_208326 ?auto_208325 ?auto_208324 ?auto_208328 )
      ( MAKE-1PILE ?auto_208321 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_208337 - BLOCK
      ?auto_208338 - BLOCK
      ?auto_208339 - BLOCK
      ?auto_208340 - BLOCK
      ?auto_208341 - BLOCK
      ?auto_208342 - BLOCK
      ?auto_208343 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_208343 ) ( CLEAR ?auto_208342 ) ( ON-TABLE ?auto_208337 ) ( ON ?auto_208338 ?auto_208337 ) ( ON ?auto_208339 ?auto_208338 ) ( ON ?auto_208340 ?auto_208339 ) ( ON ?auto_208341 ?auto_208340 ) ( ON ?auto_208342 ?auto_208341 ) ( not ( = ?auto_208337 ?auto_208338 ) ) ( not ( = ?auto_208337 ?auto_208339 ) ) ( not ( = ?auto_208337 ?auto_208340 ) ) ( not ( = ?auto_208337 ?auto_208341 ) ) ( not ( = ?auto_208337 ?auto_208342 ) ) ( not ( = ?auto_208337 ?auto_208343 ) ) ( not ( = ?auto_208338 ?auto_208339 ) ) ( not ( = ?auto_208338 ?auto_208340 ) ) ( not ( = ?auto_208338 ?auto_208341 ) ) ( not ( = ?auto_208338 ?auto_208342 ) ) ( not ( = ?auto_208338 ?auto_208343 ) ) ( not ( = ?auto_208339 ?auto_208340 ) ) ( not ( = ?auto_208339 ?auto_208341 ) ) ( not ( = ?auto_208339 ?auto_208342 ) ) ( not ( = ?auto_208339 ?auto_208343 ) ) ( not ( = ?auto_208340 ?auto_208341 ) ) ( not ( = ?auto_208340 ?auto_208342 ) ) ( not ( = ?auto_208340 ?auto_208343 ) ) ( not ( = ?auto_208341 ?auto_208342 ) ) ( not ( = ?auto_208341 ?auto_208343 ) ) ( not ( = ?auto_208342 ?auto_208343 ) ) )
    :subtasks
    ( ( !STACK ?auto_208343 ?auto_208342 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_208344 - BLOCK
      ?auto_208345 - BLOCK
      ?auto_208346 - BLOCK
      ?auto_208347 - BLOCK
      ?auto_208348 - BLOCK
      ?auto_208349 - BLOCK
      ?auto_208350 - BLOCK
    )
    :vars
    (
      ?auto_208351 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_208349 ) ( ON-TABLE ?auto_208344 ) ( ON ?auto_208345 ?auto_208344 ) ( ON ?auto_208346 ?auto_208345 ) ( ON ?auto_208347 ?auto_208346 ) ( ON ?auto_208348 ?auto_208347 ) ( ON ?auto_208349 ?auto_208348 ) ( not ( = ?auto_208344 ?auto_208345 ) ) ( not ( = ?auto_208344 ?auto_208346 ) ) ( not ( = ?auto_208344 ?auto_208347 ) ) ( not ( = ?auto_208344 ?auto_208348 ) ) ( not ( = ?auto_208344 ?auto_208349 ) ) ( not ( = ?auto_208344 ?auto_208350 ) ) ( not ( = ?auto_208345 ?auto_208346 ) ) ( not ( = ?auto_208345 ?auto_208347 ) ) ( not ( = ?auto_208345 ?auto_208348 ) ) ( not ( = ?auto_208345 ?auto_208349 ) ) ( not ( = ?auto_208345 ?auto_208350 ) ) ( not ( = ?auto_208346 ?auto_208347 ) ) ( not ( = ?auto_208346 ?auto_208348 ) ) ( not ( = ?auto_208346 ?auto_208349 ) ) ( not ( = ?auto_208346 ?auto_208350 ) ) ( not ( = ?auto_208347 ?auto_208348 ) ) ( not ( = ?auto_208347 ?auto_208349 ) ) ( not ( = ?auto_208347 ?auto_208350 ) ) ( not ( = ?auto_208348 ?auto_208349 ) ) ( not ( = ?auto_208348 ?auto_208350 ) ) ( not ( = ?auto_208349 ?auto_208350 ) ) ( ON ?auto_208350 ?auto_208351 ) ( CLEAR ?auto_208350 ) ( HAND-EMPTY ) ( not ( = ?auto_208344 ?auto_208351 ) ) ( not ( = ?auto_208345 ?auto_208351 ) ) ( not ( = ?auto_208346 ?auto_208351 ) ) ( not ( = ?auto_208347 ?auto_208351 ) ) ( not ( = ?auto_208348 ?auto_208351 ) ) ( not ( = ?auto_208349 ?auto_208351 ) ) ( not ( = ?auto_208350 ?auto_208351 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_208350 ?auto_208351 )
      ( MAKE-7PILE ?auto_208344 ?auto_208345 ?auto_208346 ?auto_208347 ?auto_208348 ?auto_208349 ?auto_208350 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_208352 - BLOCK
      ?auto_208353 - BLOCK
      ?auto_208354 - BLOCK
      ?auto_208355 - BLOCK
      ?auto_208356 - BLOCK
      ?auto_208357 - BLOCK
      ?auto_208358 - BLOCK
    )
    :vars
    (
      ?auto_208359 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_208352 ) ( ON ?auto_208353 ?auto_208352 ) ( ON ?auto_208354 ?auto_208353 ) ( ON ?auto_208355 ?auto_208354 ) ( ON ?auto_208356 ?auto_208355 ) ( not ( = ?auto_208352 ?auto_208353 ) ) ( not ( = ?auto_208352 ?auto_208354 ) ) ( not ( = ?auto_208352 ?auto_208355 ) ) ( not ( = ?auto_208352 ?auto_208356 ) ) ( not ( = ?auto_208352 ?auto_208357 ) ) ( not ( = ?auto_208352 ?auto_208358 ) ) ( not ( = ?auto_208353 ?auto_208354 ) ) ( not ( = ?auto_208353 ?auto_208355 ) ) ( not ( = ?auto_208353 ?auto_208356 ) ) ( not ( = ?auto_208353 ?auto_208357 ) ) ( not ( = ?auto_208353 ?auto_208358 ) ) ( not ( = ?auto_208354 ?auto_208355 ) ) ( not ( = ?auto_208354 ?auto_208356 ) ) ( not ( = ?auto_208354 ?auto_208357 ) ) ( not ( = ?auto_208354 ?auto_208358 ) ) ( not ( = ?auto_208355 ?auto_208356 ) ) ( not ( = ?auto_208355 ?auto_208357 ) ) ( not ( = ?auto_208355 ?auto_208358 ) ) ( not ( = ?auto_208356 ?auto_208357 ) ) ( not ( = ?auto_208356 ?auto_208358 ) ) ( not ( = ?auto_208357 ?auto_208358 ) ) ( ON ?auto_208358 ?auto_208359 ) ( CLEAR ?auto_208358 ) ( not ( = ?auto_208352 ?auto_208359 ) ) ( not ( = ?auto_208353 ?auto_208359 ) ) ( not ( = ?auto_208354 ?auto_208359 ) ) ( not ( = ?auto_208355 ?auto_208359 ) ) ( not ( = ?auto_208356 ?auto_208359 ) ) ( not ( = ?auto_208357 ?auto_208359 ) ) ( not ( = ?auto_208358 ?auto_208359 ) ) ( HOLDING ?auto_208357 ) ( CLEAR ?auto_208356 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_208352 ?auto_208353 ?auto_208354 ?auto_208355 ?auto_208356 ?auto_208357 )
      ( MAKE-7PILE ?auto_208352 ?auto_208353 ?auto_208354 ?auto_208355 ?auto_208356 ?auto_208357 ?auto_208358 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_208360 - BLOCK
      ?auto_208361 - BLOCK
      ?auto_208362 - BLOCK
      ?auto_208363 - BLOCK
      ?auto_208364 - BLOCK
      ?auto_208365 - BLOCK
      ?auto_208366 - BLOCK
    )
    :vars
    (
      ?auto_208367 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_208360 ) ( ON ?auto_208361 ?auto_208360 ) ( ON ?auto_208362 ?auto_208361 ) ( ON ?auto_208363 ?auto_208362 ) ( ON ?auto_208364 ?auto_208363 ) ( not ( = ?auto_208360 ?auto_208361 ) ) ( not ( = ?auto_208360 ?auto_208362 ) ) ( not ( = ?auto_208360 ?auto_208363 ) ) ( not ( = ?auto_208360 ?auto_208364 ) ) ( not ( = ?auto_208360 ?auto_208365 ) ) ( not ( = ?auto_208360 ?auto_208366 ) ) ( not ( = ?auto_208361 ?auto_208362 ) ) ( not ( = ?auto_208361 ?auto_208363 ) ) ( not ( = ?auto_208361 ?auto_208364 ) ) ( not ( = ?auto_208361 ?auto_208365 ) ) ( not ( = ?auto_208361 ?auto_208366 ) ) ( not ( = ?auto_208362 ?auto_208363 ) ) ( not ( = ?auto_208362 ?auto_208364 ) ) ( not ( = ?auto_208362 ?auto_208365 ) ) ( not ( = ?auto_208362 ?auto_208366 ) ) ( not ( = ?auto_208363 ?auto_208364 ) ) ( not ( = ?auto_208363 ?auto_208365 ) ) ( not ( = ?auto_208363 ?auto_208366 ) ) ( not ( = ?auto_208364 ?auto_208365 ) ) ( not ( = ?auto_208364 ?auto_208366 ) ) ( not ( = ?auto_208365 ?auto_208366 ) ) ( ON ?auto_208366 ?auto_208367 ) ( not ( = ?auto_208360 ?auto_208367 ) ) ( not ( = ?auto_208361 ?auto_208367 ) ) ( not ( = ?auto_208362 ?auto_208367 ) ) ( not ( = ?auto_208363 ?auto_208367 ) ) ( not ( = ?auto_208364 ?auto_208367 ) ) ( not ( = ?auto_208365 ?auto_208367 ) ) ( not ( = ?auto_208366 ?auto_208367 ) ) ( CLEAR ?auto_208364 ) ( ON ?auto_208365 ?auto_208366 ) ( CLEAR ?auto_208365 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_208367 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_208367 ?auto_208366 )
      ( MAKE-7PILE ?auto_208360 ?auto_208361 ?auto_208362 ?auto_208363 ?auto_208364 ?auto_208365 ?auto_208366 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_208368 - BLOCK
      ?auto_208369 - BLOCK
      ?auto_208370 - BLOCK
      ?auto_208371 - BLOCK
      ?auto_208372 - BLOCK
      ?auto_208373 - BLOCK
      ?auto_208374 - BLOCK
    )
    :vars
    (
      ?auto_208375 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_208368 ) ( ON ?auto_208369 ?auto_208368 ) ( ON ?auto_208370 ?auto_208369 ) ( ON ?auto_208371 ?auto_208370 ) ( not ( = ?auto_208368 ?auto_208369 ) ) ( not ( = ?auto_208368 ?auto_208370 ) ) ( not ( = ?auto_208368 ?auto_208371 ) ) ( not ( = ?auto_208368 ?auto_208372 ) ) ( not ( = ?auto_208368 ?auto_208373 ) ) ( not ( = ?auto_208368 ?auto_208374 ) ) ( not ( = ?auto_208369 ?auto_208370 ) ) ( not ( = ?auto_208369 ?auto_208371 ) ) ( not ( = ?auto_208369 ?auto_208372 ) ) ( not ( = ?auto_208369 ?auto_208373 ) ) ( not ( = ?auto_208369 ?auto_208374 ) ) ( not ( = ?auto_208370 ?auto_208371 ) ) ( not ( = ?auto_208370 ?auto_208372 ) ) ( not ( = ?auto_208370 ?auto_208373 ) ) ( not ( = ?auto_208370 ?auto_208374 ) ) ( not ( = ?auto_208371 ?auto_208372 ) ) ( not ( = ?auto_208371 ?auto_208373 ) ) ( not ( = ?auto_208371 ?auto_208374 ) ) ( not ( = ?auto_208372 ?auto_208373 ) ) ( not ( = ?auto_208372 ?auto_208374 ) ) ( not ( = ?auto_208373 ?auto_208374 ) ) ( ON ?auto_208374 ?auto_208375 ) ( not ( = ?auto_208368 ?auto_208375 ) ) ( not ( = ?auto_208369 ?auto_208375 ) ) ( not ( = ?auto_208370 ?auto_208375 ) ) ( not ( = ?auto_208371 ?auto_208375 ) ) ( not ( = ?auto_208372 ?auto_208375 ) ) ( not ( = ?auto_208373 ?auto_208375 ) ) ( not ( = ?auto_208374 ?auto_208375 ) ) ( ON ?auto_208373 ?auto_208374 ) ( CLEAR ?auto_208373 ) ( ON-TABLE ?auto_208375 ) ( HOLDING ?auto_208372 ) ( CLEAR ?auto_208371 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_208368 ?auto_208369 ?auto_208370 ?auto_208371 ?auto_208372 )
      ( MAKE-7PILE ?auto_208368 ?auto_208369 ?auto_208370 ?auto_208371 ?auto_208372 ?auto_208373 ?auto_208374 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_208376 - BLOCK
      ?auto_208377 - BLOCK
      ?auto_208378 - BLOCK
      ?auto_208379 - BLOCK
      ?auto_208380 - BLOCK
      ?auto_208381 - BLOCK
      ?auto_208382 - BLOCK
    )
    :vars
    (
      ?auto_208383 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_208376 ) ( ON ?auto_208377 ?auto_208376 ) ( ON ?auto_208378 ?auto_208377 ) ( ON ?auto_208379 ?auto_208378 ) ( not ( = ?auto_208376 ?auto_208377 ) ) ( not ( = ?auto_208376 ?auto_208378 ) ) ( not ( = ?auto_208376 ?auto_208379 ) ) ( not ( = ?auto_208376 ?auto_208380 ) ) ( not ( = ?auto_208376 ?auto_208381 ) ) ( not ( = ?auto_208376 ?auto_208382 ) ) ( not ( = ?auto_208377 ?auto_208378 ) ) ( not ( = ?auto_208377 ?auto_208379 ) ) ( not ( = ?auto_208377 ?auto_208380 ) ) ( not ( = ?auto_208377 ?auto_208381 ) ) ( not ( = ?auto_208377 ?auto_208382 ) ) ( not ( = ?auto_208378 ?auto_208379 ) ) ( not ( = ?auto_208378 ?auto_208380 ) ) ( not ( = ?auto_208378 ?auto_208381 ) ) ( not ( = ?auto_208378 ?auto_208382 ) ) ( not ( = ?auto_208379 ?auto_208380 ) ) ( not ( = ?auto_208379 ?auto_208381 ) ) ( not ( = ?auto_208379 ?auto_208382 ) ) ( not ( = ?auto_208380 ?auto_208381 ) ) ( not ( = ?auto_208380 ?auto_208382 ) ) ( not ( = ?auto_208381 ?auto_208382 ) ) ( ON ?auto_208382 ?auto_208383 ) ( not ( = ?auto_208376 ?auto_208383 ) ) ( not ( = ?auto_208377 ?auto_208383 ) ) ( not ( = ?auto_208378 ?auto_208383 ) ) ( not ( = ?auto_208379 ?auto_208383 ) ) ( not ( = ?auto_208380 ?auto_208383 ) ) ( not ( = ?auto_208381 ?auto_208383 ) ) ( not ( = ?auto_208382 ?auto_208383 ) ) ( ON ?auto_208381 ?auto_208382 ) ( ON-TABLE ?auto_208383 ) ( CLEAR ?auto_208379 ) ( ON ?auto_208380 ?auto_208381 ) ( CLEAR ?auto_208380 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_208383 ?auto_208382 ?auto_208381 )
      ( MAKE-7PILE ?auto_208376 ?auto_208377 ?auto_208378 ?auto_208379 ?auto_208380 ?auto_208381 ?auto_208382 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_208384 - BLOCK
      ?auto_208385 - BLOCK
      ?auto_208386 - BLOCK
      ?auto_208387 - BLOCK
      ?auto_208388 - BLOCK
      ?auto_208389 - BLOCK
      ?auto_208390 - BLOCK
    )
    :vars
    (
      ?auto_208391 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_208384 ) ( ON ?auto_208385 ?auto_208384 ) ( ON ?auto_208386 ?auto_208385 ) ( not ( = ?auto_208384 ?auto_208385 ) ) ( not ( = ?auto_208384 ?auto_208386 ) ) ( not ( = ?auto_208384 ?auto_208387 ) ) ( not ( = ?auto_208384 ?auto_208388 ) ) ( not ( = ?auto_208384 ?auto_208389 ) ) ( not ( = ?auto_208384 ?auto_208390 ) ) ( not ( = ?auto_208385 ?auto_208386 ) ) ( not ( = ?auto_208385 ?auto_208387 ) ) ( not ( = ?auto_208385 ?auto_208388 ) ) ( not ( = ?auto_208385 ?auto_208389 ) ) ( not ( = ?auto_208385 ?auto_208390 ) ) ( not ( = ?auto_208386 ?auto_208387 ) ) ( not ( = ?auto_208386 ?auto_208388 ) ) ( not ( = ?auto_208386 ?auto_208389 ) ) ( not ( = ?auto_208386 ?auto_208390 ) ) ( not ( = ?auto_208387 ?auto_208388 ) ) ( not ( = ?auto_208387 ?auto_208389 ) ) ( not ( = ?auto_208387 ?auto_208390 ) ) ( not ( = ?auto_208388 ?auto_208389 ) ) ( not ( = ?auto_208388 ?auto_208390 ) ) ( not ( = ?auto_208389 ?auto_208390 ) ) ( ON ?auto_208390 ?auto_208391 ) ( not ( = ?auto_208384 ?auto_208391 ) ) ( not ( = ?auto_208385 ?auto_208391 ) ) ( not ( = ?auto_208386 ?auto_208391 ) ) ( not ( = ?auto_208387 ?auto_208391 ) ) ( not ( = ?auto_208388 ?auto_208391 ) ) ( not ( = ?auto_208389 ?auto_208391 ) ) ( not ( = ?auto_208390 ?auto_208391 ) ) ( ON ?auto_208389 ?auto_208390 ) ( ON-TABLE ?auto_208391 ) ( ON ?auto_208388 ?auto_208389 ) ( CLEAR ?auto_208388 ) ( HOLDING ?auto_208387 ) ( CLEAR ?auto_208386 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_208384 ?auto_208385 ?auto_208386 ?auto_208387 )
      ( MAKE-7PILE ?auto_208384 ?auto_208385 ?auto_208386 ?auto_208387 ?auto_208388 ?auto_208389 ?auto_208390 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_208392 - BLOCK
      ?auto_208393 - BLOCK
      ?auto_208394 - BLOCK
      ?auto_208395 - BLOCK
      ?auto_208396 - BLOCK
      ?auto_208397 - BLOCK
      ?auto_208398 - BLOCK
    )
    :vars
    (
      ?auto_208399 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_208392 ) ( ON ?auto_208393 ?auto_208392 ) ( ON ?auto_208394 ?auto_208393 ) ( not ( = ?auto_208392 ?auto_208393 ) ) ( not ( = ?auto_208392 ?auto_208394 ) ) ( not ( = ?auto_208392 ?auto_208395 ) ) ( not ( = ?auto_208392 ?auto_208396 ) ) ( not ( = ?auto_208392 ?auto_208397 ) ) ( not ( = ?auto_208392 ?auto_208398 ) ) ( not ( = ?auto_208393 ?auto_208394 ) ) ( not ( = ?auto_208393 ?auto_208395 ) ) ( not ( = ?auto_208393 ?auto_208396 ) ) ( not ( = ?auto_208393 ?auto_208397 ) ) ( not ( = ?auto_208393 ?auto_208398 ) ) ( not ( = ?auto_208394 ?auto_208395 ) ) ( not ( = ?auto_208394 ?auto_208396 ) ) ( not ( = ?auto_208394 ?auto_208397 ) ) ( not ( = ?auto_208394 ?auto_208398 ) ) ( not ( = ?auto_208395 ?auto_208396 ) ) ( not ( = ?auto_208395 ?auto_208397 ) ) ( not ( = ?auto_208395 ?auto_208398 ) ) ( not ( = ?auto_208396 ?auto_208397 ) ) ( not ( = ?auto_208396 ?auto_208398 ) ) ( not ( = ?auto_208397 ?auto_208398 ) ) ( ON ?auto_208398 ?auto_208399 ) ( not ( = ?auto_208392 ?auto_208399 ) ) ( not ( = ?auto_208393 ?auto_208399 ) ) ( not ( = ?auto_208394 ?auto_208399 ) ) ( not ( = ?auto_208395 ?auto_208399 ) ) ( not ( = ?auto_208396 ?auto_208399 ) ) ( not ( = ?auto_208397 ?auto_208399 ) ) ( not ( = ?auto_208398 ?auto_208399 ) ) ( ON ?auto_208397 ?auto_208398 ) ( ON-TABLE ?auto_208399 ) ( ON ?auto_208396 ?auto_208397 ) ( CLEAR ?auto_208394 ) ( ON ?auto_208395 ?auto_208396 ) ( CLEAR ?auto_208395 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_208399 ?auto_208398 ?auto_208397 ?auto_208396 )
      ( MAKE-7PILE ?auto_208392 ?auto_208393 ?auto_208394 ?auto_208395 ?auto_208396 ?auto_208397 ?auto_208398 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_208400 - BLOCK
      ?auto_208401 - BLOCK
      ?auto_208402 - BLOCK
      ?auto_208403 - BLOCK
      ?auto_208404 - BLOCK
      ?auto_208405 - BLOCK
      ?auto_208406 - BLOCK
    )
    :vars
    (
      ?auto_208407 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_208400 ) ( ON ?auto_208401 ?auto_208400 ) ( not ( = ?auto_208400 ?auto_208401 ) ) ( not ( = ?auto_208400 ?auto_208402 ) ) ( not ( = ?auto_208400 ?auto_208403 ) ) ( not ( = ?auto_208400 ?auto_208404 ) ) ( not ( = ?auto_208400 ?auto_208405 ) ) ( not ( = ?auto_208400 ?auto_208406 ) ) ( not ( = ?auto_208401 ?auto_208402 ) ) ( not ( = ?auto_208401 ?auto_208403 ) ) ( not ( = ?auto_208401 ?auto_208404 ) ) ( not ( = ?auto_208401 ?auto_208405 ) ) ( not ( = ?auto_208401 ?auto_208406 ) ) ( not ( = ?auto_208402 ?auto_208403 ) ) ( not ( = ?auto_208402 ?auto_208404 ) ) ( not ( = ?auto_208402 ?auto_208405 ) ) ( not ( = ?auto_208402 ?auto_208406 ) ) ( not ( = ?auto_208403 ?auto_208404 ) ) ( not ( = ?auto_208403 ?auto_208405 ) ) ( not ( = ?auto_208403 ?auto_208406 ) ) ( not ( = ?auto_208404 ?auto_208405 ) ) ( not ( = ?auto_208404 ?auto_208406 ) ) ( not ( = ?auto_208405 ?auto_208406 ) ) ( ON ?auto_208406 ?auto_208407 ) ( not ( = ?auto_208400 ?auto_208407 ) ) ( not ( = ?auto_208401 ?auto_208407 ) ) ( not ( = ?auto_208402 ?auto_208407 ) ) ( not ( = ?auto_208403 ?auto_208407 ) ) ( not ( = ?auto_208404 ?auto_208407 ) ) ( not ( = ?auto_208405 ?auto_208407 ) ) ( not ( = ?auto_208406 ?auto_208407 ) ) ( ON ?auto_208405 ?auto_208406 ) ( ON-TABLE ?auto_208407 ) ( ON ?auto_208404 ?auto_208405 ) ( ON ?auto_208403 ?auto_208404 ) ( CLEAR ?auto_208403 ) ( HOLDING ?auto_208402 ) ( CLEAR ?auto_208401 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_208400 ?auto_208401 ?auto_208402 )
      ( MAKE-7PILE ?auto_208400 ?auto_208401 ?auto_208402 ?auto_208403 ?auto_208404 ?auto_208405 ?auto_208406 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_208408 - BLOCK
      ?auto_208409 - BLOCK
      ?auto_208410 - BLOCK
      ?auto_208411 - BLOCK
      ?auto_208412 - BLOCK
      ?auto_208413 - BLOCK
      ?auto_208414 - BLOCK
    )
    :vars
    (
      ?auto_208415 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_208408 ) ( ON ?auto_208409 ?auto_208408 ) ( not ( = ?auto_208408 ?auto_208409 ) ) ( not ( = ?auto_208408 ?auto_208410 ) ) ( not ( = ?auto_208408 ?auto_208411 ) ) ( not ( = ?auto_208408 ?auto_208412 ) ) ( not ( = ?auto_208408 ?auto_208413 ) ) ( not ( = ?auto_208408 ?auto_208414 ) ) ( not ( = ?auto_208409 ?auto_208410 ) ) ( not ( = ?auto_208409 ?auto_208411 ) ) ( not ( = ?auto_208409 ?auto_208412 ) ) ( not ( = ?auto_208409 ?auto_208413 ) ) ( not ( = ?auto_208409 ?auto_208414 ) ) ( not ( = ?auto_208410 ?auto_208411 ) ) ( not ( = ?auto_208410 ?auto_208412 ) ) ( not ( = ?auto_208410 ?auto_208413 ) ) ( not ( = ?auto_208410 ?auto_208414 ) ) ( not ( = ?auto_208411 ?auto_208412 ) ) ( not ( = ?auto_208411 ?auto_208413 ) ) ( not ( = ?auto_208411 ?auto_208414 ) ) ( not ( = ?auto_208412 ?auto_208413 ) ) ( not ( = ?auto_208412 ?auto_208414 ) ) ( not ( = ?auto_208413 ?auto_208414 ) ) ( ON ?auto_208414 ?auto_208415 ) ( not ( = ?auto_208408 ?auto_208415 ) ) ( not ( = ?auto_208409 ?auto_208415 ) ) ( not ( = ?auto_208410 ?auto_208415 ) ) ( not ( = ?auto_208411 ?auto_208415 ) ) ( not ( = ?auto_208412 ?auto_208415 ) ) ( not ( = ?auto_208413 ?auto_208415 ) ) ( not ( = ?auto_208414 ?auto_208415 ) ) ( ON ?auto_208413 ?auto_208414 ) ( ON-TABLE ?auto_208415 ) ( ON ?auto_208412 ?auto_208413 ) ( ON ?auto_208411 ?auto_208412 ) ( CLEAR ?auto_208409 ) ( ON ?auto_208410 ?auto_208411 ) ( CLEAR ?auto_208410 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_208415 ?auto_208414 ?auto_208413 ?auto_208412 ?auto_208411 )
      ( MAKE-7PILE ?auto_208408 ?auto_208409 ?auto_208410 ?auto_208411 ?auto_208412 ?auto_208413 ?auto_208414 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_208416 - BLOCK
      ?auto_208417 - BLOCK
      ?auto_208418 - BLOCK
      ?auto_208419 - BLOCK
      ?auto_208420 - BLOCK
      ?auto_208421 - BLOCK
      ?auto_208422 - BLOCK
    )
    :vars
    (
      ?auto_208423 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_208416 ) ( not ( = ?auto_208416 ?auto_208417 ) ) ( not ( = ?auto_208416 ?auto_208418 ) ) ( not ( = ?auto_208416 ?auto_208419 ) ) ( not ( = ?auto_208416 ?auto_208420 ) ) ( not ( = ?auto_208416 ?auto_208421 ) ) ( not ( = ?auto_208416 ?auto_208422 ) ) ( not ( = ?auto_208417 ?auto_208418 ) ) ( not ( = ?auto_208417 ?auto_208419 ) ) ( not ( = ?auto_208417 ?auto_208420 ) ) ( not ( = ?auto_208417 ?auto_208421 ) ) ( not ( = ?auto_208417 ?auto_208422 ) ) ( not ( = ?auto_208418 ?auto_208419 ) ) ( not ( = ?auto_208418 ?auto_208420 ) ) ( not ( = ?auto_208418 ?auto_208421 ) ) ( not ( = ?auto_208418 ?auto_208422 ) ) ( not ( = ?auto_208419 ?auto_208420 ) ) ( not ( = ?auto_208419 ?auto_208421 ) ) ( not ( = ?auto_208419 ?auto_208422 ) ) ( not ( = ?auto_208420 ?auto_208421 ) ) ( not ( = ?auto_208420 ?auto_208422 ) ) ( not ( = ?auto_208421 ?auto_208422 ) ) ( ON ?auto_208422 ?auto_208423 ) ( not ( = ?auto_208416 ?auto_208423 ) ) ( not ( = ?auto_208417 ?auto_208423 ) ) ( not ( = ?auto_208418 ?auto_208423 ) ) ( not ( = ?auto_208419 ?auto_208423 ) ) ( not ( = ?auto_208420 ?auto_208423 ) ) ( not ( = ?auto_208421 ?auto_208423 ) ) ( not ( = ?auto_208422 ?auto_208423 ) ) ( ON ?auto_208421 ?auto_208422 ) ( ON-TABLE ?auto_208423 ) ( ON ?auto_208420 ?auto_208421 ) ( ON ?auto_208419 ?auto_208420 ) ( ON ?auto_208418 ?auto_208419 ) ( CLEAR ?auto_208418 ) ( HOLDING ?auto_208417 ) ( CLEAR ?auto_208416 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_208416 ?auto_208417 )
      ( MAKE-7PILE ?auto_208416 ?auto_208417 ?auto_208418 ?auto_208419 ?auto_208420 ?auto_208421 ?auto_208422 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_208424 - BLOCK
      ?auto_208425 - BLOCK
      ?auto_208426 - BLOCK
      ?auto_208427 - BLOCK
      ?auto_208428 - BLOCK
      ?auto_208429 - BLOCK
      ?auto_208430 - BLOCK
    )
    :vars
    (
      ?auto_208431 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_208424 ) ( not ( = ?auto_208424 ?auto_208425 ) ) ( not ( = ?auto_208424 ?auto_208426 ) ) ( not ( = ?auto_208424 ?auto_208427 ) ) ( not ( = ?auto_208424 ?auto_208428 ) ) ( not ( = ?auto_208424 ?auto_208429 ) ) ( not ( = ?auto_208424 ?auto_208430 ) ) ( not ( = ?auto_208425 ?auto_208426 ) ) ( not ( = ?auto_208425 ?auto_208427 ) ) ( not ( = ?auto_208425 ?auto_208428 ) ) ( not ( = ?auto_208425 ?auto_208429 ) ) ( not ( = ?auto_208425 ?auto_208430 ) ) ( not ( = ?auto_208426 ?auto_208427 ) ) ( not ( = ?auto_208426 ?auto_208428 ) ) ( not ( = ?auto_208426 ?auto_208429 ) ) ( not ( = ?auto_208426 ?auto_208430 ) ) ( not ( = ?auto_208427 ?auto_208428 ) ) ( not ( = ?auto_208427 ?auto_208429 ) ) ( not ( = ?auto_208427 ?auto_208430 ) ) ( not ( = ?auto_208428 ?auto_208429 ) ) ( not ( = ?auto_208428 ?auto_208430 ) ) ( not ( = ?auto_208429 ?auto_208430 ) ) ( ON ?auto_208430 ?auto_208431 ) ( not ( = ?auto_208424 ?auto_208431 ) ) ( not ( = ?auto_208425 ?auto_208431 ) ) ( not ( = ?auto_208426 ?auto_208431 ) ) ( not ( = ?auto_208427 ?auto_208431 ) ) ( not ( = ?auto_208428 ?auto_208431 ) ) ( not ( = ?auto_208429 ?auto_208431 ) ) ( not ( = ?auto_208430 ?auto_208431 ) ) ( ON ?auto_208429 ?auto_208430 ) ( ON-TABLE ?auto_208431 ) ( ON ?auto_208428 ?auto_208429 ) ( ON ?auto_208427 ?auto_208428 ) ( ON ?auto_208426 ?auto_208427 ) ( CLEAR ?auto_208424 ) ( ON ?auto_208425 ?auto_208426 ) ( CLEAR ?auto_208425 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_208431 ?auto_208430 ?auto_208429 ?auto_208428 ?auto_208427 ?auto_208426 )
      ( MAKE-7PILE ?auto_208424 ?auto_208425 ?auto_208426 ?auto_208427 ?auto_208428 ?auto_208429 ?auto_208430 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_208432 - BLOCK
      ?auto_208433 - BLOCK
      ?auto_208434 - BLOCK
      ?auto_208435 - BLOCK
      ?auto_208436 - BLOCK
      ?auto_208437 - BLOCK
      ?auto_208438 - BLOCK
    )
    :vars
    (
      ?auto_208439 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_208432 ?auto_208433 ) ) ( not ( = ?auto_208432 ?auto_208434 ) ) ( not ( = ?auto_208432 ?auto_208435 ) ) ( not ( = ?auto_208432 ?auto_208436 ) ) ( not ( = ?auto_208432 ?auto_208437 ) ) ( not ( = ?auto_208432 ?auto_208438 ) ) ( not ( = ?auto_208433 ?auto_208434 ) ) ( not ( = ?auto_208433 ?auto_208435 ) ) ( not ( = ?auto_208433 ?auto_208436 ) ) ( not ( = ?auto_208433 ?auto_208437 ) ) ( not ( = ?auto_208433 ?auto_208438 ) ) ( not ( = ?auto_208434 ?auto_208435 ) ) ( not ( = ?auto_208434 ?auto_208436 ) ) ( not ( = ?auto_208434 ?auto_208437 ) ) ( not ( = ?auto_208434 ?auto_208438 ) ) ( not ( = ?auto_208435 ?auto_208436 ) ) ( not ( = ?auto_208435 ?auto_208437 ) ) ( not ( = ?auto_208435 ?auto_208438 ) ) ( not ( = ?auto_208436 ?auto_208437 ) ) ( not ( = ?auto_208436 ?auto_208438 ) ) ( not ( = ?auto_208437 ?auto_208438 ) ) ( ON ?auto_208438 ?auto_208439 ) ( not ( = ?auto_208432 ?auto_208439 ) ) ( not ( = ?auto_208433 ?auto_208439 ) ) ( not ( = ?auto_208434 ?auto_208439 ) ) ( not ( = ?auto_208435 ?auto_208439 ) ) ( not ( = ?auto_208436 ?auto_208439 ) ) ( not ( = ?auto_208437 ?auto_208439 ) ) ( not ( = ?auto_208438 ?auto_208439 ) ) ( ON ?auto_208437 ?auto_208438 ) ( ON-TABLE ?auto_208439 ) ( ON ?auto_208436 ?auto_208437 ) ( ON ?auto_208435 ?auto_208436 ) ( ON ?auto_208434 ?auto_208435 ) ( ON ?auto_208433 ?auto_208434 ) ( CLEAR ?auto_208433 ) ( HOLDING ?auto_208432 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_208432 )
      ( MAKE-7PILE ?auto_208432 ?auto_208433 ?auto_208434 ?auto_208435 ?auto_208436 ?auto_208437 ?auto_208438 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_208440 - BLOCK
      ?auto_208441 - BLOCK
      ?auto_208442 - BLOCK
      ?auto_208443 - BLOCK
      ?auto_208444 - BLOCK
      ?auto_208445 - BLOCK
      ?auto_208446 - BLOCK
    )
    :vars
    (
      ?auto_208447 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_208440 ?auto_208441 ) ) ( not ( = ?auto_208440 ?auto_208442 ) ) ( not ( = ?auto_208440 ?auto_208443 ) ) ( not ( = ?auto_208440 ?auto_208444 ) ) ( not ( = ?auto_208440 ?auto_208445 ) ) ( not ( = ?auto_208440 ?auto_208446 ) ) ( not ( = ?auto_208441 ?auto_208442 ) ) ( not ( = ?auto_208441 ?auto_208443 ) ) ( not ( = ?auto_208441 ?auto_208444 ) ) ( not ( = ?auto_208441 ?auto_208445 ) ) ( not ( = ?auto_208441 ?auto_208446 ) ) ( not ( = ?auto_208442 ?auto_208443 ) ) ( not ( = ?auto_208442 ?auto_208444 ) ) ( not ( = ?auto_208442 ?auto_208445 ) ) ( not ( = ?auto_208442 ?auto_208446 ) ) ( not ( = ?auto_208443 ?auto_208444 ) ) ( not ( = ?auto_208443 ?auto_208445 ) ) ( not ( = ?auto_208443 ?auto_208446 ) ) ( not ( = ?auto_208444 ?auto_208445 ) ) ( not ( = ?auto_208444 ?auto_208446 ) ) ( not ( = ?auto_208445 ?auto_208446 ) ) ( ON ?auto_208446 ?auto_208447 ) ( not ( = ?auto_208440 ?auto_208447 ) ) ( not ( = ?auto_208441 ?auto_208447 ) ) ( not ( = ?auto_208442 ?auto_208447 ) ) ( not ( = ?auto_208443 ?auto_208447 ) ) ( not ( = ?auto_208444 ?auto_208447 ) ) ( not ( = ?auto_208445 ?auto_208447 ) ) ( not ( = ?auto_208446 ?auto_208447 ) ) ( ON ?auto_208445 ?auto_208446 ) ( ON-TABLE ?auto_208447 ) ( ON ?auto_208444 ?auto_208445 ) ( ON ?auto_208443 ?auto_208444 ) ( ON ?auto_208442 ?auto_208443 ) ( ON ?auto_208441 ?auto_208442 ) ( ON ?auto_208440 ?auto_208441 ) ( CLEAR ?auto_208440 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_208447 ?auto_208446 ?auto_208445 ?auto_208444 ?auto_208443 ?auto_208442 ?auto_208441 )
      ( MAKE-7PILE ?auto_208440 ?auto_208441 ?auto_208442 ?auto_208443 ?auto_208444 ?auto_208445 ?auto_208446 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_208448 - BLOCK
      ?auto_208449 - BLOCK
      ?auto_208450 - BLOCK
      ?auto_208451 - BLOCK
      ?auto_208452 - BLOCK
      ?auto_208453 - BLOCK
      ?auto_208454 - BLOCK
    )
    :vars
    (
      ?auto_208455 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_208448 ?auto_208449 ) ) ( not ( = ?auto_208448 ?auto_208450 ) ) ( not ( = ?auto_208448 ?auto_208451 ) ) ( not ( = ?auto_208448 ?auto_208452 ) ) ( not ( = ?auto_208448 ?auto_208453 ) ) ( not ( = ?auto_208448 ?auto_208454 ) ) ( not ( = ?auto_208449 ?auto_208450 ) ) ( not ( = ?auto_208449 ?auto_208451 ) ) ( not ( = ?auto_208449 ?auto_208452 ) ) ( not ( = ?auto_208449 ?auto_208453 ) ) ( not ( = ?auto_208449 ?auto_208454 ) ) ( not ( = ?auto_208450 ?auto_208451 ) ) ( not ( = ?auto_208450 ?auto_208452 ) ) ( not ( = ?auto_208450 ?auto_208453 ) ) ( not ( = ?auto_208450 ?auto_208454 ) ) ( not ( = ?auto_208451 ?auto_208452 ) ) ( not ( = ?auto_208451 ?auto_208453 ) ) ( not ( = ?auto_208451 ?auto_208454 ) ) ( not ( = ?auto_208452 ?auto_208453 ) ) ( not ( = ?auto_208452 ?auto_208454 ) ) ( not ( = ?auto_208453 ?auto_208454 ) ) ( ON ?auto_208454 ?auto_208455 ) ( not ( = ?auto_208448 ?auto_208455 ) ) ( not ( = ?auto_208449 ?auto_208455 ) ) ( not ( = ?auto_208450 ?auto_208455 ) ) ( not ( = ?auto_208451 ?auto_208455 ) ) ( not ( = ?auto_208452 ?auto_208455 ) ) ( not ( = ?auto_208453 ?auto_208455 ) ) ( not ( = ?auto_208454 ?auto_208455 ) ) ( ON ?auto_208453 ?auto_208454 ) ( ON-TABLE ?auto_208455 ) ( ON ?auto_208452 ?auto_208453 ) ( ON ?auto_208451 ?auto_208452 ) ( ON ?auto_208450 ?auto_208451 ) ( ON ?auto_208449 ?auto_208450 ) ( HOLDING ?auto_208448 ) ( CLEAR ?auto_208449 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_208455 ?auto_208454 ?auto_208453 ?auto_208452 ?auto_208451 ?auto_208450 ?auto_208449 ?auto_208448 )
      ( MAKE-7PILE ?auto_208448 ?auto_208449 ?auto_208450 ?auto_208451 ?auto_208452 ?auto_208453 ?auto_208454 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_208456 - BLOCK
      ?auto_208457 - BLOCK
      ?auto_208458 - BLOCK
      ?auto_208459 - BLOCK
      ?auto_208460 - BLOCK
      ?auto_208461 - BLOCK
      ?auto_208462 - BLOCK
    )
    :vars
    (
      ?auto_208463 - BLOCK
      ?auto_208464 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_208456 ?auto_208457 ) ) ( not ( = ?auto_208456 ?auto_208458 ) ) ( not ( = ?auto_208456 ?auto_208459 ) ) ( not ( = ?auto_208456 ?auto_208460 ) ) ( not ( = ?auto_208456 ?auto_208461 ) ) ( not ( = ?auto_208456 ?auto_208462 ) ) ( not ( = ?auto_208457 ?auto_208458 ) ) ( not ( = ?auto_208457 ?auto_208459 ) ) ( not ( = ?auto_208457 ?auto_208460 ) ) ( not ( = ?auto_208457 ?auto_208461 ) ) ( not ( = ?auto_208457 ?auto_208462 ) ) ( not ( = ?auto_208458 ?auto_208459 ) ) ( not ( = ?auto_208458 ?auto_208460 ) ) ( not ( = ?auto_208458 ?auto_208461 ) ) ( not ( = ?auto_208458 ?auto_208462 ) ) ( not ( = ?auto_208459 ?auto_208460 ) ) ( not ( = ?auto_208459 ?auto_208461 ) ) ( not ( = ?auto_208459 ?auto_208462 ) ) ( not ( = ?auto_208460 ?auto_208461 ) ) ( not ( = ?auto_208460 ?auto_208462 ) ) ( not ( = ?auto_208461 ?auto_208462 ) ) ( ON ?auto_208462 ?auto_208463 ) ( not ( = ?auto_208456 ?auto_208463 ) ) ( not ( = ?auto_208457 ?auto_208463 ) ) ( not ( = ?auto_208458 ?auto_208463 ) ) ( not ( = ?auto_208459 ?auto_208463 ) ) ( not ( = ?auto_208460 ?auto_208463 ) ) ( not ( = ?auto_208461 ?auto_208463 ) ) ( not ( = ?auto_208462 ?auto_208463 ) ) ( ON ?auto_208461 ?auto_208462 ) ( ON-TABLE ?auto_208463 ) ( ON ?auto_208460 ?auto_208461 ) ( ON ?auto_208459 ?auto_208460 ) ( ON ?auto_208458 ?auto_208459 ) ( ON ?auto_208457 ?auto_208458 ) ( CLEAR ?auto_208457 ) ( ON ?auto_208456 ?auto_208464 ) ( CLEAR ?auto_208456 ) ( HAND-EMPTY ) ( not ( = ?auto_208456 ?auto_208464 ) ) ( not ( = ?auto_208457 ?auto_208464 ) ) ( not ( = ?auto_208458 ?auto_208464 ) ) ( not ( = ?auto_208459 ?auto_208464 ) ) ( not ( = ?auto_208460 ?auto_208464 ) ) ( not ( = ?auto_208461 ?auto_208464 ) ) ( not ( = ?auto_208462 ?auto_208464 ) ) ( not ( = ?auto_208463 ?auto_208464 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_208456 ?auto_208464 )
      ( MAKE-7PILE ?auto_208456 ?auto_208457 ?auto_208458 ?auto_208459 ?auto_208460 ?auto_208461 ?auto_208462 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_208465 - BLOCK
      ?auto_208466 - BLOCK
      ?auto_208467 - BLOCK
      ?auto_208468 - BLOCK
      ?auto_208469 - BLOCK
      ?auto_208470 - BLOCK
      ?auto_208471 - BLOCK
    )
    :vars
    (
      ?auto_208473 - BLOCK
      ?auto_208472 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_208465 ?auto_208466 ) ) ( not ( = ?auto_208465 ?auto_208467 ) ) ( not ( = ?auto_208465 ?auto_208468 ) ) ( not ( = ?auto_208465 ?auto_208469 ) ) ( not ( = ?auto_208465 ?auto_208470 ) ) ( not ( = ?auto_208465 ?auto_208471 ) ) ( not ( = ?auto_208466 ?auto_208467 ) ) ( not ( = ?auto_208466 ?auto_208468 ) ) ( not ( = ?auto_208466 ?auto_208469 ) ) ( not ( = ?auto_208466 ?auto_208470 ) ) ( not ( = ?auto_208466 ?auto_208471 ) ) ( not ( = ?auto_208467 ?auto_208468 ) ) ( not ( = ?auto_208467 ?auto_208469 ) ) ( not ( = ?auto_208467 ?auto_208470 ) ) ( not ( = ?auto_208467 ?auto_208471 ) ) ( not ( = ?auto_208468 ?auto_208469 ) ) ( not ( = ?auto_208468 ?auto_208470 ) ) ( not ( = ?auto_208468 ?auto_208471 ) ) ( not ( = ?auto_208469 ?auto_208470 ) ) ( not ( = ?auto_208469 ?auto_208471 ) ) ( not ( = ?auto_208470 ?auto_208471 ) ) ( ON ?auto_208471 ?auto_208473 ) ( not ( = ?auto_208465 ?auto_208473 ) ) ( not ( = ?auto_208466 ?auto_208473 ) ) ( not ( = ?auto_208467 ?auto_208473 ) ) ( not ( = ?auto_208468 ?auto_208473 ) ) ( not ( = ?auto_208469 ?auto_208473 ) ) ( not ( = ?auto_208470 ?auto_208473 ) ) ( not ( = ?auto_208471 ?auto_208473 ) ) ( ON ?auto_208470 ?auto_208471 ) ( ON-TABLE ?auto_208473 ) ( ON ?auto_208469 ?auto_208470 ) ( ON ?auto_208468 ?auto_208469 ) ( ON ?auto_208467 ?auto_208468 ) ( ON ?auto_208465 ?auto_208472 ) ( CLEAR ?auto_208465 ) ( not ( = ?auto_208465 ?auto_208472 ) ) ( not ( = ?auto_208466 ?auto_208472 ) ) ( not ( = ?auto_208467 ?auto_208472 ) ) ( not ( = ?auto_208468 ?auto_208472 ) ) ( not ( = ?auto_208469 ?auto_208472 ) ) ( not ( = ?auto_208470 ?auto_208472 ) ) ( not ( = ?auto_208471 ?auto_208472 ) ) ( not ( = ?auto_208473 ?auto_208472 ) ) ( HOLDING ?auto_208466 ) ( CLEAR ?auto_208467 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_208473 ?auto_208471 ?auto_208470 ?auto_208469 ?auto_208468 ?auto_208467 ?auto_208466 )
      ( MAKE-7PILE ?auto_208465 ?auto_208466 ?auto_208467 ?auto_208468 ?auto_208469 ?auto_208470 ?auto_208471 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_208474 - BLOCK
      ?auto_208475 - BLOCK
      ?auto_208476 - BLOCK
      ?auto_208477 - BLOCK
      ?auto_208478 - BLOCK
      ?auto_208479 - BLOCK
      ?auto_208480 - BLOCK
    )
    :vars
    (
      ?auto_208481 - BLOCK
      ?auto_208482 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_208474 ?auto_208475 ) ) ( not ( = ?auto_208474 ?auto_208476 ) ) ( not ( = ?auto_208474 ?auto_208477 ) ) ( not ( = ?auto_208474 ?auto_208478 ) ) ( not ( = ?auto_208474 ?auto_208479 ) ) ( not ( = ?auto_208474 ?auto_208480 ) ) ( not ( = ?auto_208475 ?auto_208476 ) ) ( not ( = ?auto_208475 ?auto_208477 ) ) ( not ( = ?auto_208475 ?auto_208478 ) ) ( not ( = ?auto_208475 ?auto_208479 ) ) ( not ( = ?auto_208475 ?auto_208480 ) ) ( not ( = ?auto_208476 ?auto_208477 ) ) ( not ( = ?auto_208476 ?auto_208478 ) ) ( not ( = ?auto_208476 ?auto_208479 ) ) ( not ( = ?auto_208476 ?auto_208480 ) ) ( not ( = ?auto_208477 ?auto_208478 ) ) ( not ( = ?auto_208477 ?auto_208479 ) ) ( not ( = ?auto_208477 ?auto_208480 ) ) ( not ( = ?auto_208478 ?auto_208479 ) ) ( not ( = ?auto_208478 ?auto_208480 ) ) ( not ( = ?auto_208479 ?auto_208480 ) ) ( ON ?auto_208480 ?auto_208481 ) ( not ( = ?auto_208474 ?auto_208481 ) ) ( not ( = ?auto_208475 ?auto_208481 ) ) ( not ( = ?auto_208476 ?auto_208481 ) ) ( not ( = ?auto_208477 ?auto_208481 ) ) ( not ( = ?auto_208478 ?auto_208481 ) ) ( not ( = ?auto_208479 ?auto_208481 ) ) ( not ( = ?auto_208480 ?auto_208481 ) ) ( ON ?auto_208479 ?auto_208480 ) ( ON-TABLE ?auto_208481 ) ( ON ?auto_208478 ?auto_208479 ) ( ON ?auto_208477 ?auto_208478 ) ( ON ?auto_208476 ?auto_208477 ) ( ON ?auto_208474 ?auto_208482 ) ( not ( = ?auto_208474 ?auto_208482 ) ) ( not ( = ?auto_208475 ?auto_208482 ) ) ( not ( = ?auto_208476 ?auto_208482 ) ) ( not ( = ?auto_208477 ?auto_208482 ) ) ( not ( = ?auto_208478 ?auto_208482 ) ) ( not ( = ?auto_208479 ?auto_208482 ) ) ( not ( = ?auto_208480 ?auto_208482 ) ) ( not ( = ?auto_208481 ?auto_208482 ) ) ( CLEAR ?auto_208476 ) ( ON ?auto_208475 ?auto_208474 ) ( CLEAR ?auto_208475 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_208482 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_208482 ?auto_208474 )
      ( MAKE-7PILE ?auto_208474 ?auto_208475 ?auto_208476 ?auto_208477 ?auto_208478 ?auto_208479 ?auto_208480 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_208483 - BLOCK
      ?auto_208484 - BLOCK
      ?auto_208485 - BLOCK
      ?auto_208486 - BLOCK
      ?auto_208487 - BLOCK
      ?auto_208488 - BLOCK
      ?auto_208489 - BLOCK
    )
    :vars
    (
      ?auto_208491 - BLOCK
      ?auto_208490 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_208483 ?auto_208484 ) ) ( not ( = ?auto_208483 ?auto_208485 ) ) ( not ( = ?auto_208483 ?auto_208486 ) ) ( not ( = ?auto_208483 ?auto_208487 ) ) ( not ( = ?auto_208483 ?auto_208488 ) ) ( not ( = ?auto_208483 ?auto_208489 ) ) ( not ( = ?auto_208484 ?auto_208485 ) ) ( not ( = ?auto_208484 ?auto_208486 ) ) ( not ( = ?auto_208484 ?auto_208487 ) ) ( not ( = ?auto_208484 ?auto_208488 ) ) ( not ( = ?auto_208484 ?auto_208489 ) ) ( not ( = ?auto_208485 ?auto_208486 ) ) ( not ( = ?auto_208485 ?auto_208487 ) ) ( not ( = ?auto_208485 ?auto_208488 ) ) ( not ( = ?auto_208485 ?auto_208489 ) ) ( not ( = ?auto_208486 ?auto_208487 ) ) ( not ( = ?auto_208486 ?auto_208488 ) ) ( not ( = ?auto_208486 ?auto_208489 ) ) ( not ( = ?auto_208487 ?auto_208488 ) ) ( not ( = ?auto_208487 ?auto_208489 ) ) ( not ( = ?auto_208488 ?auto_208489 ) ) ( ON ?auto_208489 ?auto_208491 ) ( not ( = ?auto_208483 ?auto_208491 ) ) ( not ( = ?auto_208484 ?auto_208491 ) ) ( not ( = ?auto_208485 ?auto_208491 ) ) ( not ( = ?auto_208486 ?auto_208491 ) ) ( not ( = ?auto_208487 ?auto_208491 ) ) ( not ( = ?auto_208488 ?auto_208491 ) ) ( not ( = ?auto_208489 ?auto_208491 ) ) ( ON ?auto_208488 ?auto_208489 ) ( ON-TABLE ?auto_208491 ) ( ON ?auto_208487 ?auto_208488 ) ( ON ?auto_208486 ?auto_208487 ) ( ON ?auto_208483 ?auto_208490 ) ( not ( = ?auto_208483 ?auto_208490 ) ) ( not ( = ?auto_208484 ?auto_208490 ) ) ( not ( = ?auto_208485 ?auto_208490 ) ) ( not ( = ?auto_208486 ?auto_208490 ) ) ( not ( = ?auto_208487 ?auto_208490 ) ) ( not ( = ?auto_208488 ?auto_208490 ) ) ( not ( = ?auto_208489 ?auto_208490 ) ) ( not ( = ?auto_208491 ?auto_208490 ) ) ( ON ?auto_208484 ?auto_208483 ) ( CLEAR ?auto_208484 ) ( ON-TABLE ?auto_208490 ) ( HOLDING ?auto_208485 ) ( CLEAR ?auto_208486 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_208491 ?auto_208489 ?auto_208488 ?auto_208487 ?auto_208486 ?auto_208485 )
      ( MAKE-7PILE ?auto_208483 ?auto_208484 ?auto_208485 ?auto_208486 ?auto_208487 ?auto_208488 ?auto_208489 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_208492 - BLOCK
      ?auto_208493 - BLOCK
      ?auto_208494 - BLOCK
      ?auto_208495 - BLOCK
      ?auto_208496 - BLOCK
      ?auto_208497 - BLOCK
      ?auto_208498 - BLOCK
    )
    :vars
    (
      ?auto_208499 - BLOCK
      ?auto_208500 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_208492 ?auto_208493 ) ) ( not ( = ?auto_208492 ?auto_208494 ) ) ( not ( = ?auto_208492 ?auto_208495 ) ) ( not ( = ?auto_208492 ?auto_208496 ) ) ( not ( = ?auto_208492 ?auto_208497 ) ) ( not ( = ?auto_208492 ?auto_208498 ) ) ( not ( = ?auto_208493 ?auto_208494 ) ) ( not ( = ?auto_208493 ?auto_208495 ) ) ( not ( = ?auto_208493 ?auto_208496 ) ) ( not ( = ?auto_208493 ?auto_208497 ) ) ( not ( = ?auto_208493 ?auto_208498 ) ) ( not ( = ?auto_208494 ?auto_208495 ) ) ( not ( = ?auto_208494 ?auto_208496 ) ) ( not ( = ?auto_208494 ?auto_208497 ) ) ( not ( = ?auto_208494 ?auto_208498 ) ) ( not ( = ?auto_208495 ?auto_208496 ) ) ( not ( = ?auto_208495 ?auto_208497 ) ) ( not ( = ?auto_208495 ?auto_208498 ) ) ( not ( = ?auto_208496 ?auto_208497 ) ) ( not ( = ?auto_208496 ?auto_208498 ) ) ( not ( = ?auto_208497 ?auto_208498 ) ) ( ON ?auto_208498 ?auto_208499 ) ( not ( = ?auto_208492 ?auto_208499 ) ) ( not ( = ?auto_208493 ?auto_208499 ) ) ( not ( = ?auto_208494 ?auto_208499 ) ) ( not ( = ?auto_208495 ?auto_208499 ) ) ( not ( = ?auto_208496 ?auto_208499 ) ) ( not ( = ?auto_208497 ?auto_208499 ) ) ( not ( = ?auto_208498 ?auto_208499 ) ) ( ON ?auto_208497 ?auto_208498 ) ( ON-TABLE ?auto_208499 ) ( ON ?auto_208496 ?auto_208497 ) ( ON ?auto_208495 ?auto_208496 ) ( ON ?auto_208492 ?auto_208500 ) ( not ( = ?auto_208492 ?auto_208500 ) ) ( not ( = ?auto_208493 ?auto_208500 ) ) ( not ( = ?auto_208494 ?auto_208500 ) ) ( not ( = ?auto_208495 ?auto_208500 ) ) ( not ( = ?auto_208496 ?auto_208500 ) ) ( not ( = ?auto_208497 ?auto_208500 ) ) ( not ( = ?auto_208498 ?auto_208500 ) ) ( not ( = ?auto_208499 ?auto_208500 ) ) ( ON ?auto_208493 ?auto_208492 ) ( ON-TABLE ?auto_208500 ) ( CLEAR ?auto_208495 ) ( ON ?auto_208494 ?auto_208493 ) ( CLEAR ?auto_208494 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_208500 ?auto_208492 ?auto_208493 )
      ( MAKE-7PILE ?auto_208492 ?auto_208493 ?auto_208494 ?auto_208495 ?auto_208496 ?auto_208497 ?auto_208498 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_208501 - BLOCK
      ?auto_208502 - BLOCK
      ?auto_208503 - BLOCK
      ?auto_208504 - BLOCK
      ?auto_208505 - BLOCK
      ?auto_208506 - BLOCK
      ?auto_208507 - BLOCK
    )
    :vars
    (
      ?auto_208509 - BLOCK
      ?auto_208508 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_208501 ?auto_208502 ) ) ( not ( = ?auto_208501 ?auto_208503 ) ) ( not ( = ?auto_208501 ?auto_208504 ) ) ( not ( = ?auto_208501 ?auto_208505 ) ) ( not ( = ?auto_208501 ?auto_208506 ) ) ( not ( = ?auto_208501 ?auto_208507 ) ) ( not ( = ?auto_208502 ?auto_208503 ) ) ( not ( = ?auto_208502 ?auto_208504 ) ) ( not ( = ?auto_208502 ?auto_208505 ) ) ( not ( = ?auto_208502 ?auto_208506 ) ) ( not ( = ?auto_208502 ?auto_208507 ) ) ( not ( = ?auto_208503 ?auto_208504 ) ) ( not ( = ?auto_208503 ?auto_208505 ) ) ( not ( = ?auto_208503 ?auto_208506 ) ) ( not ( = ?auto_208503 ?auto_208507 ) ) ( not ( = ?auto_208504 ?auto_208505 ) ) ( not ( = ?auto_208504 ?auto_208506 ) ) ( not ( = ?auto_208504 ?auto_208507 ) ) ( not ( = ?auto_208505 ?auto_208506 ) ) ( not ( = ?auto_208505 ?auto_208507 ) ) ( not ( = ?auto_208506 ?auto_208507 ) ) ( ON ?auto_208507 ?auto_208509 ) ( not ( = ?auto_208501 ?auto_208509 ) ) ( not ( = ?auto_208502 ?auto_208509 ) ) ( not ( = ?auto_208503 ?auto_208509 ) ) ( not ( = ?auto_208504 ?auto_208509 ) ) ( not ( = ?auto_208505 ?auto_208509 ) ) ( not ( = ?auto_208506 ?auto_208509 ) ) ( not ( = ?auto_208507 ?auto_208509 ) ) ( ON ?auto_208506 ?auto_208507 ) ( ON-TABLE ?auto_208509 ) ( ON ?auto_208505 ?auto_208506 ) ( ON ?auto_208501 ?auto_208508 ) ( not ( = ?auto_208501 ?auto_208508 ) ) ( not ( = ?auto_208502 ?auto_208508 ) ) ( not ( = ?auto_208503 ?auto_208508 ) ) ( not ( = ?auto_208504 ?auto_208508 ) ) ( not ( = ?auto_208505 ?auto_208508 ) ) ( not ( = ?auto_208506 ?auto_208508 ) ) ( not ( = ?auto_208507 ?auto_208508 ) ) ( not ( = ?auto_208509 ?auto_208508 ) ) ( ON ?auto_208502 ?auto_208501 ) ( ON-TABLE ?auto_208508 ) ( ON ?auto_208503 ?auto_208502 ) ( CLEAR ?auto_208503 ) ( HOLDING ?auto_208504 ) ( CLEAR ?auto_208505 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_208509 ?auto_208507 ?auto_208506 ?auto_208505 ?auto_208504 )
      ( MAKE-7PILE ?auto_208501 ?auto_208502 ?auto_208503 ?auto_208504 ?auto_208505 ?auto_208506 ?auto_208507 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_208510 - BLOCK
      ?auto_208511 - BLOCK
      ?auto_208512 - BLOCK
      ?auto_208513 - BLOCK
      ?auto_208514 - BLOCK
      ?auto_208515 - BLOCK
      ?auto_208516 - BLOCK
    )
    :vars
    (
      ?auto_208517 - BLOCK
      ?auto_208518 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_208510 ?auto_208511 ) ) ( not ( = ?auto_208510 ?auto_208512 ) ) ( not ( = ?auto_208510 ?auto_208513 ) ) ( not ( = ?auto_208510 ?auto_208514 ) ) ( not ( = ?auto_208510 ?auto_208515 ) ) ( not ( = ?auto_208510 ?auto_208516 ) ) ( not ( = ?auto_208511 ?auto_208512 ) ) ( not ( = ?auto_208511 ?auto_208513 ) ) ( not ( = ?auto_208511 ?auto_208514 ) ) ( not ( = ?auto_208511 ?auto_208515 ) ) ( not ( = ?auto_208511 ?auto_208516 ) ) ( not ( = ?auto_208512 ?auto_208513 ) ) ( not ( = ?auto_208512 ?auto_208514 ) ) ( not ( = ?auto_208512 ?auto_208515 ) ) ( not ( = ?auto_208512 ?auto_208516 ) ) ( not ( = ?auto_208513 ?auto_208514 ) ) ( not ( = ?auto_208513 ?auto_208515 ) ) ( not ( = ?auto_208513 ?auto_208516 ) ) ( not ( = ?auto_208514 ?auto_208515 ) ) ( not ( = ?auto_208514 ?auto_208516 ) ) ( not ( = ?auto_208515 ?auto_208516 ) ) ( ON ?auto_208516 ?auto_208517 ) ( not ( = ?auto_208510 ?auto_208517 ) ) ( not ( = ?auto_208511 ?auto_208517 ) ) ( not ( = ?auto_208512 ?auto_208517 ) ) ( not ( = ?auto_208513 ?auto_208517 ) ) ( not ( = ?auto_208514 ?auto_208517 ) ) ( not ( = ?auto_208515 ?auto_208517 ) ) ( not ( = ?auto_208516 ?auto_208517 ) ) ( ON ?auto_208515 ?auto_208516 ) ( ON-TABLE ?auto_208517 ) ( ON ?auto_208514 ?auto_208515 ) ( ON ?auto_208510 ?auto_208518 ) ( not ( = ?auto_208510 ?auto_208518 ) ) ( not ( = ?auto_208511 ?auto_208518 ) ) ( not ( = ?auto_208512 ?auto_208518 ) ) ( not ( = ?auto_208513 ?auto_208518 ) ) ( not ( = ?auto_208514 ?auto_208518 ) ) ( not ( = ?auto_208515 ?auto_208518 ) ) ( not ( = ?auto_208516 ?auto_208518 ) ) ( not ( = ?auto_208517 ?auto_208518 ) ) ( ON ?auto_208511 ?auto_208510 ) ( ON-TABLE ?auto_208518 ) ( ON ?auto_208512 ?auto_208511 ) ( CLEAR ?auto_208514 ) ( ON ?auto_208513 ?auto_208512 ) ( CLEAR ?auto_208513 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_208518 ?auto_208510 ?auto_208511 ?auto_208512 )
      ( MAKE-7PILE ?auto_208510 ?auto_208511 ?auto_208512 ?auto_208513 ?auto_208514 ?auto_208515 ?auto_208516 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_208519 - BLOCK
      ?auto_208520 - BLOCK
      ?auto_208521 - BLOCK
      ?auto_208522 - BLOCK
      ?auto_208523 - BLOCK
      ?auto_208524 - BLOCK
      ?auto_208525 - BLOCK
    )
    :vars
    (
      ?auto_208527 - BLOCK
      ?auto_208526 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_208519 ?auto_208520 ) ) ( not ( = ?auto_208519 ?auto_208521 ) ) ( not ( = ?auto_208519 ?auto_208522 ) ) ( not ( = ?auto_208519 ?auto_208523 ) ) ( not ( = ?auto_208519 ?auto_208524 ) ) ( not ( = ?auto_208519 ?auto_208525 ) ) ( not ( = ?auto_208520 ?auto_208521 ) ) ( not ( = ?auto_208520 ?auto_208522 ) ) ( not ( = ?auto_208520 ?auto_208523 ) ) ( not ( = ?auto_208520 ?auto_208524 ) ) ( not ( = ?auto_208520 ?auto_208525 ) ) ( not ( = ?auto_208521 ?auto_208522 ) ) ( not ( = ?auto_208521 ?auto_208523 ) ) ( not ( = ?auto_208521 ?auto_208524 ) ) ( not ( = ?auto_208521 ?auto_208525 ) ) ( not ( = ?auto_208522 ?auto_208523 ) ) ( not ( = ?auto_208522 ?auto_208524 ) ) ( not ( = ?auto_208522 ?auto_208525 ) ) ( not ( = ?auto_208523 ?auto_208524 ) ) ( not ( = ?auto_208523 ?auto_208525 ) ) ( not ( = ?auto_208524 ?auto_208525 ) ) ( ON ?auto_208525 ?auto_208527 ) ( not ( = ?auto_208519 ?auto_208527 ) ) ( not ( = ?auto_208520 ?auto_208527 ) ) ( not ( = ?auto_208521 ?auto_208527 ) ) ( not ( = ?auto_208522 ?auto_208527 ) ) ( not ( = ?auto_208523 ?auto_208527 ) ) ( not ( = ?auto_208524 ?auto_208527 ) ) ( not ( = ?auto_208525 ?auto_208527 ) ) ( ON ?auto_208524 ?auto_208525 ) ( ON-TABLE ?auto_208527 ) ( ON ?auto_208519 ?auto_208526 ) ( not ( = ?auto_208519 ?auto_208526 ) ) ( not ( = ?auto_208520 ?auto_208526 ) ) ( not ( = ?auto_208521 ?auto_208526 ) ) ( not ( = ?auto_208522 ?auto_208526 ) ) ( not ( = ?auto_208523 ?auto_208526 ) ) ( not ( = ?auto_208524 ?auto_208526 ) ) ( not ( = ?auto_208525 ?auto_208526 ) ) ( not ( = ?auto_208527 ?auto_208526 ) ) ( ON ?auto_208520 ?auto_208519 ) ( ON-TABLE ?auto_208526 ) ( ON ?auto_208521 ?auto_208520 ) ( ON ?auto_208522 ?auto_208521 ) ( CLEAR ?auto_208522 ) ( HOLDING ?auto_208523 ) ( CLEAR ?auto_208524 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_208527 ?auto_208525 ?auto_208524 ?auto_208523 )
      ( MAKE-7PILE ?auto_208519 ?auto_208520 ?auto_208521 ?auto_208522 ?auto_208523 ?auto_208524 ?auto_208525 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_208528 - BLOCK
      ?auto_208529 - BLOCK
      ?auto_208530 - BLOCK
      ?auto_208531 - BLOCK
      ?auto_208532 - BLOCK
      ?auto_208533 - BLOCK
      ?auto_208534 - BLOCK
    )
    :vars
    (
      ?auto_208535 - BLOCK
      ?auto_208536 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_208528 ?auto_208529 ) ) ( not ( = ?auto_208528 ?auto_208530 ) ) ( not ( = ?auto_208528 ?auto_208531 ) ) ( not ( = ?auto_208528 ?auto_208532 ) ) ( not ( = ?auto_208528 ?auto_208533 ) ) ( not ( = ?auto_208528 ?auto_208534 ) ) ( not ( = ?auto_208529 ?auto_208530 ) ) ( not ( = ?auto_208529 ?auto_208531 ) ) ( not ( = ?auto_208529 ?auto_208532 ) ) ( not ( = ?auto_208529 ?auto_208533 ) ) ( not ( = ?auto_208529 ?auto_208534 ) ) ( not ( = ?auto_208530 ?auto_208531 ) ) ( not ( = ?auto_208530 ?auto_208532 ) ) ( not ( = ?auto_208530 ?auto_208533 ) ) ( not ( = ?auto_208530 ?auto_208534 ) ) ( not ( = ?auto_208531 ?auto_208532 ) ) ( not ( = ?auto_208531 ?auto_208533 ) ) ( not ( = ?auto_208531 ?auto_208534 ) ) ( not ( = ?auto_208532 ?auto_208533 ) ) ( not ( = ?auto_208532 ?auto_208534 ) ) ( not ( = ?auto_208533 ?auto_208534 ) ) ( ON ?auto_208534 ?auto_208535 ) ( not ( = ?auto_208528 ?auto_208535 ) ) ( not ( = ?auto_208529 ?auto_208535 ) ) ( not ( = ?auto_208530 ?auto_208535 ) ) ( not ( = ?auto_208531 ?auto_208535 ) ) ( not ( = ?auto_208532 ?auto_208535 ) ) ( not ( = ?auto_208533 ?auto_208535 ) ) ( not ( = ?auto_208534 ?auto_208535 ) ) ( ON ?auto_208533 ?auto_208534 ) ( ON-TABLE ?auto_208535 ) ( ON ?auto_208528 ?auto_208536 ) ( not ( = ?auto_208528 ?auto_208536 ) ) ( not ( = ?auto_208529 ?auto_208536 ) ) ( not ( = ?auto_208530 ?auto_208536 ) ) ( not ( = ?auto_208531 ?auto_208536 ) ) ( not ( = ?auto_208532 ?auto_208536 ) ) ( not ( = ?auto_208533 ?auto_208536 ) ) ( not ( = ?auto_208534 ?auto_208536 ) ) ( not ( = ?auto_208535 ?auto_208536 ) ) ( ON ?auto_208529 ?auto_208528 ) ( ON-TABLE ?auto_208536 ) ( ON ?auto_208530 ?auto_208529 ) ( ON ?auto_208531 ?auto_208530 ) ( CLEAR ?auto_208533 ) ( ON ?auto_208532 ?auto_208531 ) ( CLEAR ?auto_208532 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_208536 ?auto_208528 ?auto_208529 ?auto_208530 ?auto_208531 )
      ( MAKE-7PILE ?auto_208528 ?auto_208529 ?auto_208530 ?auto_208531 ?auto_208532 ?auto_208533 ?auto_208534 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_208537 - BLOCK
      ?auto_208538 - BLOCK
      ?auto_208539 - BLOCK
      ?auto_208540 - BLOCK
      ?auto_208541 - BLOCK
      ?auto_208542 - BLOCK
      ?auto_208543 - BLOCK
    )
    :vars
    (
      ?auto_208544 - BLOCK
      ?auto_208545 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_208537 ?auto_208538 ) ) ( not ( = ?auto_208537 ?auto_208539 ) ) ( not ( = ?auto_208537 ?auto_208540 ) ) ( not ( = ?auto_208537 ?auto_208541 ) ) ( not ( = ?auto_208537 ?auto_208542 ) ) ( not ( = ?auto_208537 ?auto_208543 ) ) ( not ( = ?auto_208538 ?auto_208539 ) ) ( not ( = ?auto_208538 ?auto_208540 ) ) ( not ( = ?auto_208538 ?auto_208541 ) ) ( not ( = ?auto_208538 ?auto_208542 ) ) ( not ( = ?auto_208538 ?auto_208543 ) ) ( not ( = ?auto_208539 ?auto_208540 ) ) ( not ( = ?auto_208539 ?auto_208541 ) ) ( not ( = ?auto_208539 ?auto_208542 ) ) ( not ( = ?auto_208539 ?auto_208543 ) ) ( not ( = ?auto_208540 ?auto_208541 ) ) ( not ( = ?auto_208540 ?auto_208542 ) ) ( not ( = ?auto_208540 ?auto_208543 ) ) ( not ( = ?auto_208541 ?auto_208542 ) ) ( not ( = ?auto_208541 ?auto_208543 ) ) ( not ( = ?auto_208542 ?auto_208543 ) ) ( ON ?auto_208543 ?auto_208544 ) ( not ( = ?auto_208537 ?auto_208544 ) ) ( not ( = ?auto_208538 ?auto_208544 ) ) ( not ( = ?auto_208539 ?auto_208544 ) ) ( not ( = ?auto_208540 ?auto_208544 ) ) ( not ( = ?auto_208541 ?auto_208544 ) ) ( not ( = ?auto_208542 ?auto_208544 ) ) ( not ( = ?auto_208543 ?auto_208544 ) ) ( ON-TABLE ?auto_208544 ) ( ON ?auto_208537 ?auto_208545 ) ( not ( = ?auto_208537 ?auto_208545 ) ) ( not ( = ?auto_208538 ?auto_208545 ) ) ( not ( = ?auto_208539 ?auto_208545 ) ) ( not ( = ?auto_208540 ?auto_208545 ) ) ( not ( = ?auto_208541 ?auto_208545 ) ) ( not ( = ?auto_208542 ?auto_208545 ) ) ( not ( = ?auto_208543 ?auto_208545 ) ) ( not ( = ?auto_208544 ?auto_208545 ) ) ( ON ?auto_208538 ?auto_208537 ) ( ON-TABLE ?auto_208545 ) ( ON ?auto_208539 ?auto_208538 ) ( ON ?auto_208540 ?auto_208539 ) ( ON ?auto_208541 ?auto_208540 ) ( CLEAR ?auto_208541 ) ( HOLDING ?auto_208542 ) ( CLEAR ?auto_208543 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_208544 ?auto_208543 ?auto_208542 )
      ( MAKE-7PILE ?auto_208537 ?auto_208538 ?auto_208539 ?auto_208540 ?auto_208541 ?auto_208542 ?auto_208543 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_208546 - BLOCK
      ?auto_208547 - BLOCK
      ?auto_208548 - BLOCK
      ?auto_208549 - BLOCK
      ?auto_208550 - BLOCK
      ?auto_208551 - BLOCK
      ?auto_208552 - BLOCK
    )
    :vars
    (
      ?auto_208553 - BLOCK
      ?auto_208554 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_208546 ?auto_208547 ) ) ( not ( = ?auto_208546 ?auto_208548 ) ) ( not ( = ?auto_208546 ?auto_208549 ) ) ( not ( = ?auto_208546 ?auto_208550 ) ) ( not ( = ?auto_208546 ?auto_208551 ) ) ( not ( = ?auto_208546 ?auto_208552 ) ) ( not ( = ?auto_208547 ?auto_208548 ) ) ( not ( = ?auto_208547 ?auto_208549 ) ) ( not ( = ?auto_208547 ?auto_208550 ) ) ( not ( = ?auto_208547 ?auto_208551 ) ) ( not ( = ?auto_208547 ?auto_208552 ) ) ( not ( = ?auto_208548 ?auto_208549 ) ) ( not ( = ?auto_208548 ?auto_208550 ) ) ( not ( = ?auto_208548 ?auto_208551 ) ) ( not ( = ?auto_208548 ?auto_208552 ) ) ( not ( = ?auto_208549 ?auto_208550 ) ) ( not ( = ?auto_208549 ?auto_208551 ) ) ( not ( = ?auto_208549 ?auto_208552 ) ) ( not ( = ?auto_208550 ?auto_208551 ) ) ( not ( = ?auto_208550 ?auto_208552 ) ) ( not ( = ?auto_208551 ?auto_208552 ) ) ( ON ?auto_208552 ?auto_208553 ) ( not ( = ?auto_208546 ?auto_208553 ) ) ( not ( = ?auto_208547 ?auto_208553 ) ) ( not ( = ?auto_208548 ?auto_208553 ) ) ( not ( = ?auto_208549 ?auto_208553 ) ) ( not ( = ?auto_208550 ?auto_208553 ) ) ( not ( = ?auto_208551 ?auto_208553 ) ) ( not ( = ?auto_208552 ?auto_208553 ) ) ( ON-TABLE ?auto_208553 ) ( ON ?auto_208546 ?auto_208554 ) ( not ( = ?auto_208546 ?auto_208554 ) ) ( not ( = ?auto_208547 ?auto_208554 ) ) ( not ( = ?auto_208548 ?auto_208554 ) ) ( not ( = ?auto_208549 ?auto_208554 ) ) ( not ( = ?auto_208550 ?auto_208554 ) ) ( not ( = ?auto_208551 ?auto_208554 ) ) ( not ( = ?auto_208552 ?auto_208554 ) ) ( not ( = ?auto_208553 ?auto_208554 ) ) ( ON ?auto_208547 ?auto_208546 ) ( ON-TABLE ?auto_208554 ) ( ON ?auto_208548 ?auto_208547 ) ( ON ?auto_208549 ?auto_208548 ) ( ON ?auto_208550 ?auto_208549 ) ( CLEAR ?auto_208552 ) ( ON ?auto_208551 ?auto_208550 ) ( CLEAR ?auto_208551 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_208554 ?auto_208546 ?auto_208547 ?auto_208548 ?auto_208549 ?auto_208550 )
      ( MAKE-7PILE ?auto_208546 ?auto_208547 ?auto_208548 ?auto_208549 ?auto_208550 ?auto_208551 ?auto_208552 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_208555 - BLOCK
      ?auto_208556 - BLOCK
      ?auto_208557 - BLOCK
      ?auto_208558 - BLOCK
      ?auto_208559 - BLOCK
      ?auto_208560 - BLOCK
      ?auto_208561 - BLOCK
    )
    :vars
    (
      ?auto_208563 - BLOCK
      ?auto_208562 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_208555 ?auto_208556 ) ) ( not ( = ?auto_208555 ?auto_208557 ) ) ( not ( = ?auto_208555 ?auto_208558 ) ) ( not ( = ?auto_208555 ?auto_208559 ) ) ( not ( = ?auto_208555 ?auto_208560 ) ) ( not ( = ?auto_208555 ?auto_208561 ) ) ( not ( = ?auto_208556 ?auto_208557 ) ) ( not ( = ?auto_208556 ?auto_208558 ) ) ( not ( = ?auto_208556 ?auto_208559 ) ) ( not ( = ?auto_208556 ?auto_208560 ) ) ( not ( = ?auto_208556 ?auto_208561 ) ) ( not ( = ?auto_208557 ?auto_208558 ) ) ( not ( = ?auto_208557 ?auto_208559 ) ) ( not ( = ?auto_208557 ?auto_208560 ) ) ( not ( = ?auto_208557 ?auto_208561 ) ) ( not ( = ?auto_208558 ?auto_208559 ) ) ( not ( = ?auto_208558 ?auto_208560 ) ) ( not ( = ?auto_208558 ?auto_208561 ) ) ( not ( = ?auto_208559 ?auto_208560 ) ) ( not ( = ?auto_208559 ?auto_208561 ) ) ( not ( = ?auto_208560 ?auto_208561 ) ) ( not ( = ?auto_208555 ?auto_208563 ) ) ( not ( = ?auto_208556 ?auto_208563 ) ) ( not ( = ?auto_208557 ?auto_208563 ) ) ( not ( = ?auto_208558 ?auto_208563 ) ) ( not ( = ?auto_208559 ?auto_208563 ) ) ( not ( = ?auto_208560 ?auto_208563 ) ) ( not ( = ?auto_208561 ?auto_208563 ) ) ( ON-TABLE ?auto_208563 ) ( ON ?auto_208555 ?auto_208562 ) ( not ( = ?auto_208555 ?auto_208562 ) ) ( not ( = ?auto_208556 ?auto_208562 ) ) ( not ( = ?auto_208557 ?auto_208562 ) ) ( not ( = ?auto_208558 ?auto_208562 ) ) ( not ( = ?auto_208559 ?auto_208562 ) ) ( not ( = ?auto_208560 ?auto_208562 ) ) ( not ( = ?auto_208561 ?auto_208562 ) ) ( not ( = ?auto_208563 ?auto_208562 ) ) ( ON ?auto_208556 ?auto_208555 ) ( ON-TABLE ?auto_208562 ) ( ON ?auto_208557 ?auto_208556 ) ( ON ?auto_208558 ?auto_208557 ) ( ON ?auto_208559 ?auto_208558 ) ( ON ?auto_208560 ?auto_208559 ) ( CLEAR ?auto_208560 ) ( HOLDING ?auto_208561 ) ( CLEAR ?auto_208563 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_208563 ?auto_208561 )
      ( MAKE-7PILE ?auto_208555 ?auto_208556 ?auto_208557 ?auto_208558 ?auto_208559 ?auto_208560 ?auto_208561 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_208564 - BLOCK
      ?auto_208565 - BLOCK
      ?auto_208566 - BLOCK
      ?auto_208567 - BLOCK
      ?auto_208568 - BLOCK
      ?auto_208569 - BLOCK
      ?auto_208570 - BLOCK
    )
    :vars
    (
      ?auto_208572 - BLOCK
      ?auto_208571 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_208564 ?auto_208565 ) ) ( not ( = ?auto_208564 ?auto_208566 ) ) ( not ( = ?auto_208564 ?auto_208567 ) ) ( not ( = ?auto_208564 ?auto_208568 ) ) ( not ( = ?auto_208564 ?auto_208569 ) ) ( not ( = ?auto_208564 ?auto_208570 ) ) ( not ( = ?auto_208565 ?auto_208566 ) ) ( not ( = ?auto_208565 ?auto_208567 ) ) ( not ( = ?auto_208565 ?auto_208568 ) ) ( not ( = ?auto_208565 ?auto_208569 ) ) ( not ( = ?auto_208565 ?auto_208570 ) ) ( not ( = ?auto_208566 ?auto_208567 ) ) ( not ( = ?auto_208566 ?auto_208568 ) ) ( not ( = ?auto_208566 ?auto_208569 ) ) ( not ( = ?auto_208566 ?auto_208570 ) ) ( not ( = ?auto_208567 ?auto_208568 ) ) ( not ( = ?auto_208567 ?auto_208569 ) ) ( not ( = ?auto_208567 ?auto_208570 ) ) ( not ( = ?auto_208568 ?auto_208569 ) ) ( not ( = ?auto_208568 ?auto_208570 ) ) ( not ( = ?auto_208569 ?auto_208570 ) ) ( not ( = ?auto_208564 ?auto_208572 ) ) ( not ( = ?auto_208565 ?auto_208572 ) ) ( not ( = ?auto_208566 ?auto_208572 ) ) ( not ( = ?auto_208567 ?auto_208572 ) ) ( not ( = ?auto_208568 ?auto_208572 ) ) ( not ( = ?auto_208569 ?auto_208572 ) ) ( not ( = ?auto_208570 ?auto_208572 ) ) ( ON-TABLE ?auto_208572 ) ( ON ?auto_208564 ?auto_208571 ) ( not ( = ?auto_208564 ?auto_208571 ) ) ( not ( = ?auto_208565 ?auto_208571 ) ) ( not ( = ?auto_208566 ?auto_208571 ) ) ( not ( = ?auto_208567 ?auto_208571 ) ) ( not ( = ?auto_208568 ?auto_208571 ) ) ( not ( = ?auto_208569 ?auto_208571 ) ) ( not ( = ?auto_208570 ?auto_208571 ) ) ( not ( = ?auto_208572 ?auto_208571 ) ) ( ON ?auto_208565 ?auto_208564 ) ( ON-TABLE ?auto_208571 ) ( ON ?auto_208566 ?auto_208565 ) ( ON ?auto_208567 ?auto_208566 ) ( ON ?auto_208568 ?auto_208567 ) ( ON ?auto_208569 ?auto_208568 ) ( CLEAR ?auto_208572 ) ( ON ?auto_208570 ?auto_208569 ) ( CLEAR ?auto_208570 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_208571 ?auto_208564 ?auto_208565 ?auto_208566 ?auto_208567 ?auto_208568 ?auto_208569 )
      ( MAKE-7PILE ?auto_208564 ?auto_208565 ?auto_208566 ?auto_208567 ?auto_208568 ?auto_208569 ?auto_208570 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_208573 - BLOCK
      ?auto_208574 - BLOCK
      ?auto_208575 - BLOCK
      ?auto_208576 - BLOCK
      ?auto_208577 - BLOCK
      ?auto_208578 - BLOCK
      ?auto_208579 - BLOCK
    )
    :vars
    (
      ?auto_208581 - BLOCK
      ?auto_208580 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_208573 ?auto_208574 ) ) ( not ( = ?auto_208573 ?auto_208575 ) ) ( not ( = ?auto_208573 ?auto_208576 ) ) ( not ( = ?auto_208573 ?auto_208577 ) ) ( not ( = ?auto_208573 ?auto_208578 ) ) ( not ( = ?auto_208573 ?auto_208579 ) ) ( not ( = ?auto_208574 ?auto_208575 ) ) ( not ( = ?auto_208574 ?auto_208576 ) ) ( not ( = ?auto_208574 ?auto_208577 ) ) ( not ( = ?auto_208574 ?auto_208578 ) ) ( not ( = ?auto_208574 ?auto_208579 ) ) ( not ( = ?auto_208575 ?auto_208576 ) ) ( not ( = ?auto_208575 ?auto_208577 ) ) ( not ( = ?auto_208575 ?auto_208578 ) ) ( not ( = ?auto_208575 ?auto_208579 ) ) ( not ( = ?auto_208576 ?auto_208577 ) ) ( not ( = ?auto_208576 ?auto_208578 ) ) ( not ( = ?auto_208576 ?auto_208579 ) ) ( not ( = ?auto_208577 ?auto_208578 ) ) ( not ( = ?auto_208577 ?auto_208579 ) ) ( not ( = ?auto_208578 ?auto_208579 ) ) ( not ( = ?auto_208573 ?auto_208581 ) ) ( not ( = ?auto_208574 ?auto_208581 ) ) ( not ( = ?auto_208575 ?auto_208581 ) ) ( not ( = ?auto_208576 ?auto_208581 ) ) ( not ( = ?auto_208577 ?auto_208581 ) ) ( not ( = ?auto_208578 ?auto_208581 ) ) ( not ( = ?auto_208579 ?auto_208581 ) ) ( ON ?auto_208573 ?auto_208580 ) ( not ( = ?auto_208573 ?auto_208580 ) ) ( not ( = ?auto_208574 ?auto_208580 ) ) ( not ( = ?auto_208575 ?auto_208580 ) ) ( not ( = ?auto_208576 ?auto_208580 ) ) ( not ( = ?auto_208577 ?auto_208580 ) ) ( not ( = ?auto_208578 ?auto_208580 ) ) ( not ( = ?auto_208579 ?auto_208580 ) ) ( not ( = ?auto_208581 ?auto_208580 ) ) ( ON ?auto_208574 ?auto_208573 ) ( ON-TABLE ?auto_208580 ) ( ON ?auto_208575 ?auto_208574 ) ( ON ?auto_208576 ?auto_208575 ) ( ON ?auto_208577 ?auto_208576 ) ( ON ?auto_208578 ?auto_208577 ) ( ON ?auto_208579 ?auto_208578 ) ( CLEAR ?auto_208579 ) ( HOLDING ?auto_208581 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_208581 )
      ( MAKE-7PILE ?auto_208573 ?auto_208574 ?auto_208575 ?auto_208576 ?auto_208577 ?auto_208578 ?auto_208579 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_208582 - BLOCK
      ?auto_208583 - BLOCK
      ?auto_208584 - BLOCK
      ?auto_208585 - BLOCK
      ?auto_208586 - BLOCK
      ?auto_208587 - BLOCK
      ?auto_208588 - BLOCK
    )
    :vars
    (
      ?auto_208590 - BLOCK
      ?auto_208589 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_208582 ?auto_208583 ) ) ( not ( = ?auto_208582 ?auto_208584 ) ) ( not ( = ?auto_208582 ?auto_208585 ) ) ( not ( = ?auto_208582 ?auto_208586 ) ) ( not ( = ?auto_208582 ?auto_208587 ) ) ( not ( = ?auto_208582 ?auto_208588 ) ) ( not ( = ?auto_208583 ?auto_208584 ) ) ( not ( = ?auto_208583 ?auto_208585 ) ) ( not ( = ?auto_208583 ?auto_208586 ) ) ( not ( = ?auto_208583 ?auto_208587 ) ) ( not ( = ?auto_208583 ?auto_208588 ) ) ( not ( = ?auto_208584 ?auto_208585 ) ) ( not ( = ?auto_208584 ?auto_208586 ) ) ( not ( = ?auto_208584 ?auto_208587 ) ) ( not ( = ?auto_208584 ?auto_208588 ) ) ( not ( = ?auto_208585 ?auto_208586 ) ) ( not ( = ?auto_208585 ?auto_208587 ) ) ( not ( = ?auto_208585 ?auto_208588 ) ) ( not ( = ?auto_208586 ?auto_208587 ) ) ( not ( = ?auto_208586 ?auto_208588 ) ) ( not ( = ?auto_208587 ?auto_208588 ) ) ( not ( = ?auto_208582 ?auto_208590 ) ) ( not ( = ?auto_208583 ?auto_208590 ) ) ( not ( = ?auto_208584 ?auto_208590 ) ) ( not ( = ?auto_208585 ?auto_208590 ) ) ( not ( = ?auto_208586 ?auto_208590 ) ) ( not ( = ?auto_208587 ?auto_208590 ) ) ( not ( = ?auto_208588 ?auto_208590 ) ) ( ON ?auto_208582 ?auto_208589 ) ( not ( = ?auto_208582 ?auto_208589 ) ) ( not ( = ?auto_208583 ?auto_208589 ) ) ( not ( = ?auto_208584 ?auto_208589 ) ) ( not ( = ?auto_208585 ?auto_208589 ) ) ( not ( = ?auto_208586 ?auto_208589 ) ) ( not ( = ?auto_208587 ?auto_208589 ) ) ( not ( = ?auto_208588 ?auto_208589 ) ) ( not ( = ?auto_208590 ?auto_208589 ) ) ( ON ?auto_208583 ?auto_208582 ) ( ON-TABLE ?auto_208589 ) ( ON ?auto_208584 ?auto_208583 ) ( ON ?auto_208585 ?auto_208584 ) ( ON ?auto_208586 ?auto_208585 ) ( ON ?auto_208587 ?auto_208586 ) ( ON ?auto_208588 ?auto_208587 ) ( ON ?auto_208590 ?auto_208588 ) ( CLEAR ?auto_208590 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_208589 ?auto_208582 ?auto_208583 ?auto_208584 ?auto_208585 ?auto_208586 ?auto_208587 ?auto_208588 )
      ( MAKE-7PILE ?auto_208582 ?auto_208583 ?auto_208584 ?auto_208585 ?auto_208586 ?auto_208587 ?auto_208588 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_208599 - BLOCK
      ?auto_208600 - BLOCK
      ?auto_208601 - BLOCK
      ?auto_208602 - BLOCK
      ?auto_208603 - BLOCK
      ?auto_208604 - BLOCK
      ?auto_208605 - BLOCK
      ?auto_208606 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_208606 ) ( CLEAR ?auto_208605 ) ( ON-TABLE ?auto_208599 ) ( ON ?auto_208600 ?auto_208599 ) ( ON ?auto_208601 ?auto_208600 ) ( ON ?auto_208602 ?auto_208601 ) ( ON ?auto_208603 ?auto_208602 ) ( ON ?auto_208604 ?auto_208603 ) ( ON ?auto_208605 ?auto_208604 ) ( not ( = ?auto_208599 ?auto_208600 ) ) ( not ( = ?auto_208599 ?auto_208601 ) ) ( not ( = ?auto_208599 ?auto_208602 ) ) ( not ( = ?auto_208599 ?auto_208603 ) ) ( not ( = ?auto_208599 ?auto_208604 ) ) ( not ( = ?auto_208599 ?auto_208605 ) ) ( not ( = ?auto_208599 ?auto_208606 ) ) ( not ( = ?auto_208600 ?auto_208601 ) ) ( not ( = ?auto_208600 ?auto_208602 ) ) ( not ( = ?auto_208600 ?auto_208603 ) ) ( not ( = ?auto_208600 ?auto_208604 ) ) ( not ( = ?auto_208600 ?auto_208605 ) ) ( not ( = ?auto_208600 ?auto_208606 ) ) ( not ( = ?auto_208601 ?auto_208602 ) ) ( not ( = ?auto_208601 ?auto_208603 ) ) ( not ( = ?auto_208601 ?auto_208604 ) ) ( not ( = ?auto_208601 ?auto_208605 ) ) ( not ( = ?auto_208601 ?auto_208606 ) ) ( not ( = ?auto_208602 ?auto_208603 ) ) ( not ( = ?auto_208602 ?auto_208604 ) ) ( not ( = ?auto_208602 ?auto_208605 ) ) ( not ( = ?auto_208602 ?auto_208606 ) ) ( not ( = ?auto_208603 ?auto_208604 ) ) ( not ( = ?auto_208603 ?auto_208605 ) ) ( not ( = ?auto_208603 ?auto_208606 ) ) ( not ( = ?auto_208604 ?auto_208605 ) ) ( not ( = ?auto_208604 ?auto_208606 ) ) ( not ( = ?auto_208605 ?auto_208606 ) ) )
    :subtasks
    ( ( !STACK ?auto_208606 ?auto_208605 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_208607 - BLOCK
      ?auto_208608 - BLOCK
      ?auto_208609 - BLOCK
      ?auto_208610 - BLOCK
      ?auto_208611 - BLOCK
      ?auto_208612 - BLOCK
      ?auto_208613 - BLOCK
      ?auto_208614 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_208613 ) ( ON-TABLE ?auto_208607 ) ( ON ?auto_208608 ?auto_208607 ) ( ON ?auto_208609 ?auto_208608 ) ( ON ?auto_208610 ?auto_208609 ) ( ON ?auto_208611 ?auto_208610 ) ( ON ?auto_208612 ?auto_208611 ) ( ON ?auto_208613 ?auto_208612 ) ( not ( = ?auto_208607 ?auto_208608 ) ) ( not ( = ?auto_208607 ?auto_208609 ) ) ( not ( = ?auto_208607 ?auto_208610 ) ) ( not ( = ?auto_208607 ?auto_208611 ) ) ( not ( = ?auto_208607 ?auto_208612 ) ) ( not ( = ?auto_208607 ?auto_208613 ) ) ( not ( = ?auto_208607 ?auto_208614 ) ) ( not ( = ?auto_208608 ?auto_208609 ) ) ( not ( = ?auto_208608 ?auto_208610 ) ) ( not ( = ?auto_208608 ?auto_208611 ) ) ( not ( = ?auto_208608 ?auto_208612 ) ) ( not ( = ?auto_208608 ?auto_208613 ) ) ( not ( = ?auto_208608 ?auto_208614 ) ) ( not ( = ?auto_208609 ?auto_208610 ) ) ( not ( = ?auto_208609 ?auto_208611 ) ) ( not ( = ?auto_208609 ?auto_208612 ) ) ( not ( = ?auto_208609 ?auto_208613 ) ) ( not ( = ?auto_208609 ?auto_208614 ) ) ( not ( = ?auto_208610 ?auto_208611 ) ) ( not ( = ?auto_208610 ?auto_208612 ) ) ( not ( = ?auto_208610 ?auto_208613 ) ) ( not ( = ?auto_208610 ?auto_208614 ) ) ( not ( = ?auto_208611 ?auto_208612 ) ) ( not ( = ?auto_208611 ?auto_208613 ) ) ( not ( = ?auto_208611 ?auto_208614 ) ) ( not ( = ?auto_208612 ?auto_208613 ) ) ( not ( = ?auto_208612 ?auto_208614 ) ) ( not ( = ?auto_208613 ?auto_208614 ) ) ( ON-TABLE ?auto_208614 ) ( CLEAR ?auto_208614 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_208614 )
      ( MAKE-8PILE ?auto_208607 ?auto_208608 ?auto_208609 ?auto_208610 ?auto_208611 ?auto_208612 ?auto_208613 ?auto_208614 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_208615 - BLOCK
      ?auto_208616 - BLOCK
      ?auto_208617 - BLOCK
      ?auto_208618 - BLOCK
      ?auto_208619 - BLOCK
      ?auto_208620 - BLOCK
      ?auto_208621 - BLOCK
      ?auto_208622 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_208615 ) ( ON ?auto_208616 ?auto_208615 ) ( ON ?auto_208617 ?auto_208616 ) ( ON ?auto_208618 ?auto_208617 ) ( ON ?auto_208619 ?auto_208618 ) ( ON ?auto_208620 ?auto_208619 ) ( not ( = ?auto_208615 ?auto_208616 ) ) ( not ( = ?auto_208615 ?auto_208617 ) ) ( not ( = ?auto_208615 ?auto_208618 ) ) ( not ( = ?auto_208615 ?auto_208619 ) ) ( not ( = ?auto_208615 ?auto_208620 ) ) ( not ( = ?auto_208615 ?auto_208621 ) ) ( not ( = ?auto_208615 ?auto_208622 ) ) ( not ( = ?auto_208616 ?auto_208617 ) ) ( not ( = ?auto_208616 ?auto_208618 ) ) ( not ( = ?auto_208616 ?auto_208619 ) ) ( not ( = ?auto_208616 ?auto_208620 ) ) ( not ( = ?auto_208616 ?auto_208621 ) ) ( not ( = ?auto_208616 ?auto_208622 ) ) ( not ( = ?auto_208617 ?auto_208618 ) ) ( not ( = ?auto_208617 ?auto_208619 ) ) ( not ( = ?auto_208617 ?auto_208620 ) ) ( not ( = ?auto_208617 ?auto_208621 ) ) ( not ( = ?auto_208617 ?auto_208622 ) ) ( not ( = ?auto_208618 ?auto_208619 ) ) ( not ( = ?auto_208618 ?auto_208620 ) ) ( not ( = ?auto_208618 ?auto_208621 ) ) ( not ( = ?auto_208618 ?auto_208622 ) ) ( not ( = ?auto_208619 ?auto_208620 ) ) ( not ( = ?auto_208619 ?auto_208621 ) ) ( not ( = ?auto_208619 ?auto_208622 ) ) ( not ( = ?auto_208620 ?auto_208621 ) ) ( not ( = ?auto_208620 ?auto_208622 ) ) ( not ( = ?auto_208621 ?auto_208622 ) ) ( ON-TABLE ?auto_208622 ) ( CLEAR ?auto_208622 ) ( HOLDING ?auto_208621 ) ( CLEAR ?auto_208620 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_208615 ?auto_208616 ?auto_208617 ?auto_208618 ?auto_208619 ?auto_208620 ?auto_208621 )
      ( MAKE-8PILE ?auto_208615 ?auto_208616 ?auto_208617 ?auto_208618 ?auto_208619 ?auto_208620 ?auto_208621 ?auto_208622 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_208623 - BLOCK
      ?auto_208624 - BLOCK
      ?auto_208625 - BLOCK
      ?auto_208626 - BLOCK
      ?auto_208627 - BLOCK
      ?auto_208628 - BLOCK
      ?auto_208629 - BLOCK
      ?auto_208630 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_208623 ) ( ON ?auto_208624 ?auto_208623 ) ( ON ?auto_208625 ?auto_208624 ) ( ON ?auto_208626 ?auto_208625 ) ( ON ?auto_208627 ?auto_208626 ) ( ON ?auto_208628 ?auto_208627 ) ( not ( = ?auto_208623 ?auto_208624 ) ) ( not ( = ?auto_208623 ?auto_208625 ) ) ( not ( = ?auto_208623 ?auto_208626 ) ) ( not ( = ?auto_208623 ?auto_208627 ) ) ( not ( = ?auto_208623 ?auto_208628 ) ) ( not ( = ?auto_208623 ?auto_208629 ) ) ( not ( = ?auto_208623 ?auto_208630 ) ) ( not ( = ?auto_208624 ?auto_208625 ) ) ( not ( = ?auto_208624 ?auto_208626 ) ) ( not ( = ?auto_208624 ?auto_208627 ) ) ( not ( = ?auto_208624 ?auto_208628 ) ) ( not ( = ?auto_208624 ?auto_208629 ) ) ( not ( = ?auto_208624 ?auto_208630 ) ) ( not ( = ?auto_208625 ?auto_208626 ) ) ( not ( = ?auto_208625 ?auto_208627 ) ) ( not ( = ?auto_208625 ?auto_208628 ) ) ( not ( = ?auto_208625 ?auto_208629 ) ) ( not ( = ?auto_208625 ?auto_208630 ) ) ( not ( = ?auto_208626 ?auto_208627 ) ) ( not ( = ?auto_208626 ?auto_208628 ) ) ( not ( = ?auto_208626 ?auto_208629 ) ) ( not ( = ?auto_208626 ?auto_208630 ) ) ( not ( = ?auto_208627 ?auto_208628 ) ) ( not ( = ?auto_208627 ?auto_208629 ) ) ( not ( = ?auto_208627 ?auto_208630 ) ) ( not ( = ?auto_208628 ?auto_208629 ) ) ( not ( = ?auto_208628 ?auto_208630 ) ) ( not ( = ?auto_208629 ?auto_208630 ) ) ( ON-TABLE ?auto_208630 ) ( CLEAR ?auto_208628 ) ( ON ?auto_208629 ?auto_208630 ) ( CLEAR ?auto_208629 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_208630 )
      ( MAKE-8PILE ?auto_208623 ?auto_208624 ?auto_208625 ?auto_208626 ?auto_208627 ?auto_208628 ?auto_208629 ?auto_208630 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_208631 - BLOCK
      ?auto_208632 - BLOCK
      ?auto_208633 - BLOCK
      ?auto_208634 - BLOCK
      ?auto_208635 - BLOCK
      ?auto_208636 - BLOCK
      ?auto_208637 - BLOCK
      ?auto_208638 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_208631 ) ( ON ?auto_208632 ?auto_208631 ) ( ON ?auto_208633 ?auto_208632 ) ( ON ?auto_208634 ?auto_208633 ) ( ON ?auto_208635 ?auto_208634 ) ( not ( = ?auto_208631 ?auto_208632 ) ) ( not ( = ?auto_208631 ?auto_208633 ) ) ( not ( = ?auto_208631 ?auto_208634 ) ) ( not ( = ?auto_208631 ?auto_208635 ) ) ( not ( = ?auto_208631 ?auto_208636 ) ) ( not ( = ?auto_208631 ?auto_208637 ) ) ( not ( = ?auto_208631 ?auto_208638 ) ) ( not ( = ?auto_208632 ?auto_208633 ) ) ( not ( = ?auto_208632 ?auto_208634 ) ) ( not ( = ?auto_208632 ?auto_208635 ) ) ( not ( = ?auto_208632 ?auto_208636 ) ) ( not ( = ?auto_208632 ?auto_208637 ) ) ( not ( = ?auto_208632 ?auto_208638 ) ) ( not ( = ?auto_208633 ?auto_208634 ) ) ( not ( = ?auto_208633 ?auto_208635 ) ) ( not ( = ?auto_208633 ?auto_208636 ) ) ( not ( = ?auto_208633 ?auto_208637 ) ) ( not ( = ?auto_208633 ?auto_208638 ) ) ( not ( = ?auto_208634 ?auto_208635 ) ) ( not ( = ?auto_208634 ?auto_208636 ) ) ( not ( = ?auto_208634 ?auto_208637 ) ) ( not ( = ?auto_208634 ?auto_208638 ) ) ( not ( = ?auto_208635 ?auto_208636 ) ) ( not ( = ?auto_208635 ?auto_208637 ) ) ( not ( = ?auto_208635 ?auto_208638 ) ) ( not ( = ?auto_208636 ?auto_208637 ) ) ( not ( = ?auto_208636 ?auto_208638 ) ) ( not ( = ?auto_208637 ?auto_208638 ) ) ( ON-TABLE ?auto_208638 ) ( ON ?auto_208637 ?auto_208638 ) ( CLEAR ?auto_208637 ) ( HOLDING ?auto_208636 ) ( CLEAR ?auto_208635 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_208631 ?auto_208632 ?auto_208633 ?auto_208634 ?auto_208635 ?auto_208636 )
      ( MAKE-8PILE ?auto_208631 ?auto_208632 ?auto_208633 ?auto_208634 ?auto_208635 ?auto_208636 ?auto_208637 ?auto_208638 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_208639 - BLOCK
      ?auto_208640 - BLOCK
      ?auto_208641 - BLOCK
      ?auto_208642 - BLOCK
      ?auto_208643 - BLOCK
      ?auto_208644 - BLOCK
      ?auto_208645 - BLOCK
      ?auto_208646 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_208639 ) ( ON ?auto_208640 ?auto_208639 ) ( ON ?auto_208641 ?auto_208640 ) ( ON ?auto_208642 ?auto_208641 ) ( ON ?auto_208643 ?auto_208642 ) ( not ( = ?auto_208639 ?auto_208640 ) ) ( not ( = ?auto_208639 ?auto_208641 ) ) ( not ( = ?auto_208639 ?auto_208642 ) ) ( not ( = ?auto_208639 ?auto_208643 ) ) ( not ( = ?auto_208639 ?auto_208644 ) ) ( not ( = ?auto_208639 ?auto_208645 ) ) ( not ( = ?auto_208639 ?auto_208646 ) ) ( not ( = ?auto_208640 ?auto_208641 ) ) ( not ( = ?auto_208640 ?auto_208642 ) ) ( not ( = ?auto_208640 ?auto_208643 ) ) ( not ( = ?auto_208640 ?auto_208644 ) ) ( not ( = ?auto_208640 ?auto_208645 ) ) ( not ( = ?auto_208640 ?auto_208646 ) ) ( not ( = ?auto_208641 ?auto_208642 ) ) ( not ( = ?auto_208641 ?auto_208643 ) ) ( not ( = ?auto_208641 ?auto_208644 ) ) ( not ( = ?auto_208641 ?auto_208645 ) ) ( not ( = ?auto_208641 ?auto_208646 ) ) ( not ( = ?auto_208642 ?auto_208643 ) ) ( not ( = ?auto_208642 ?auto_208644 ) ) ( not ( = ?auto_208642 ?auto_208645 ) ) ( not ( = ?auto_208642 ?auto_208646 ) ) ( not ( = ?auto_208643 ?auto_208644 ) ) ( not ( = ?auto_208643 ?auto_208645 ) ) ( not ( = ?auto_208643 ?auto_208646 ) ) ( not ( = ?auto_208644 ?auto_208645 ) ) ( not ( = ?auto_208644 ?auto_208646 ) ) ( not ( = ?auto_208645 ?auto_208646 ) ) ( ON-TABLE ?auto_208646 ) ( ON ?auto_208645 ?auto_208646 ) ( CLEAR ?auto_208643 ) ( ON ?auto_208644 ?auto_208645 ) ( CLEAR ?auto_208644 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_208646 ?auto_208645 )
      ( MAKE-8PILE ?auto_208639 ?auto_208640 ?auto_208641 ?auto_208642 ?auto_208643 ?auto_208644 ?auto_208645 ?auto_208646 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_208647 - BLOCK
      ?auto_208648 - BLOCK
      ?auto_208649 - BLOCK
      ?auto_208650 - BLOCK
      ?auto_208651 - BLOCK
      ?auto_208652 - BLOCK
      ?auto_208653 - BLOCK
      ?auto_208654 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_208647 ) ( ON ?auto_208648 ?auto_208647 ) ( ON ?auto_208649 ?auto_208648 ) ( ON ?auto_208650 ?auto_208649 ) ( not ( = ?auto_208647 ?auto_208648 ) ) ( not ( = ?auto_208647 ?auto_208649 ) ) ( not ( = ?auto_208647 ?auto_208650 ) ) ( not ( = ?auto_208647 ?auto_208651 ) ) ( not ( = ?auto_208647 ?auto_208652 ) ) ( not ( = ?auto_208647 ?auto_208653 ) ) ( not ( = ?auto_208647 ?auto_208654 ) ) ( not ( = ?auto_208648 ?auto_208649 ) ) ( not ( = ?auto_208648 ?auto_208650 ) ) ( not ( = ?auto_208648 ?auto_208651 ) ) ( not ( = ?auto_208648 ?auto_208652 ) ) ( not ( = ?auto_208648 ?auto_208653 ) ) ( not ( = ?auto_208648 ?auto_208654 ) ) ( not ( = ?auto_208649 ?auto_208650 ) ) ( not ( = ?auto_208649 ?auto_208651 ) ) ( not ( = ?auto_208649 ?auto_208652 ) ) ( not ( = ?auto_208649 ?auto_208653 ) ) ( not ( = ?auto_208649 ?auto_208654 ) ) ( not ( = ?auto_208650 ?auto_208651 ) ) ( not ( = ?auto_208650 ?auto_208652 ) ) ( not ( = ?auto_208650 ?auto_208653 ) ) ( not ( = ?auto_208650 ?auto_208654 ) ) ( not ( = ?auto_208651 ?auto_208652 ) ) ( not ( = ?auto_208651 ?auto_208653 ) ) ( not ( = ?auto_208651 ?auto_208654 ) ) ( not ( = ?auto_208652 ?auto_208653 ) ) ( not ( = ?auto_208652 ?auto_208654 ) ) ( not ( = ?auto_208653 ?auto_208654 ) ) ( ON-TABLE ?auto_208654 ) ( ON ?auto_208653 ?auto_208654 ) ( ON ?auto_208652 ?auto_208653 ) ( CLEAR ?auto_208652 ) ( HOLDING ?auto_208651 ) ( CLEAR ?auto_208650 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_208647 ?auto_208648 ?auto_208649 ?auto_208650 ?auto_208651 )
      ( MAKE-8PILE ?auto_208647 ?auto_208648 ?auto_208649 ?auto_208650 ?auto_208651 ?auto_208652 ?auto_208653 ?auto_208654 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_208655 - BLOCK
      ?auto_208656 - BLOCK
      ?auto_208657 - BLOCK
      ?auto_208658 - BLOCK
      ?auto_208659 - BLOCK
      ?auto_208660 - BLOCK
      ?auto_208661 - BLOCK
      ?auto_208662 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_208655 ) ( ON ?auto_208656 ?auto_208655 ) ( ON ?auto_208657 ?auto_208656 ) ( ON ?auto_208658 ?auto_208657 ) ( not ( = ?auto_208655 ?auto_208656 ) ) ( not ( = ?auto_208655 ?auto_208657 ) ) ( not ( = ?auto_208655 ?auto_208658 ) ) ( not ( = ?auto_208655 ?auto_208659 ) ) ( not ( = ?auto_208655 ?auto_208660 ) ) ( not ( = ?auto_208655 ?auto_208661 ) ) ( not ( = ?auto_208655 ?auto_208662 ) ) ( not ( = ?auto_208656 ?auto_208657 ) ) ( not ( = ?auto_208656 ?auto_208658 ) ) ( not ( = ?auto_208656 ?auto_208659 ) ) ( not ( = ?auto_208656 ?auto_208660 ) ) ( not ( = ?auto_208656 ?auto_208661 ) ) ( not ( = ?auto_208656 ?auto_208662 ) ) ( not ( = ?auto_208657 ?auto_208658 ) ) ( not ( = ?auto_208657 ?auto_208659 ) ) ( not ( = ?auto_208657 ?auto_208660 ) ) ( not ( = ?auto_208657 ?auto_208661 ) ) ( not ( = ?auto_208657 ?auto_208662 ) ) ( not ( = ?auto_208658 ?auto_208659 ) ) ( not ( = ?auto_208658 ?auto_208660 ) ) ( not ( = ?auto_208658 ?auto_208661 ) ) ( not ( = ?auto_208658 ?auto_208662 ) ) ( not ( = ?auto_208659 ?auto_208660 ) ) ( not ( = ?auto_208659 ?auto_208661 ) ) ( not ( = ?auto_208659 ?auto_208662 ) ) ( not ( = ?auto_208660 ?auto_208661 ) ) ( not ( = ?auto_208660 ?auto_208662 ) ) ( not ( = ?auto_208661 ?auto_208662 ) ) ( ON-TABLE ?auto_208662 ) ( ON ?auto_208661 ?auto_208662 ) ( ON ?auto_208660 ?auto_208661 ) ( CLEAR ?auto_208658 ) ( ON ?auto_208659 ?auto_208660 ) ( CLEAR ?auto_208659 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_208662 ?auto_208661 ?auto_208660 )
      ( MAKE-8PILE ?auto_208655 ?auto_208656 ?auto_208657 ?auto_208658 ?auto_208659 ?auto_208660 ?auto_208661 ?auto_208662 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_208663 - BLOCK
      ?auto_208664 - BLOCK
      ?auto_208665 - BLOCK
      ?auto_208666 - BLOCK
      ?auto_208667 - BLOCK
      ?auto_208668 - BLOCK
      ?auto_208669 - BLOCK
      ?auto_208670 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_208663 ) ( ON ?auto_208664 ?auto_208663 ) ( ON ?auto_208665 ?auto_208664 ) ( not ( = ?auto_208663 ?auto_208664 ) ) ( not ( = ?auto_208663 ?auto_208665 ) ) ( not ( = ?auto_208663 ?auto_208666 ) ) ( not ( = ?auto_208663 ?auto_208667 ) ) ( not ( = ?auto_208663 ?auto_208668 ) ) ( not ( = ?auto_208663 ?auto_208669 ) ) ( not ( = ?auto_208663 ?auto_208670 ) ) ( not ( = ?auto_208664 ?auto_208665 ) ) ( not ( = ?auto_208664 ?auto_208666 ) ) ( not ( = ?auto_208664 ?auto_208667 ) ) ( not ( = ?auto_208664 ?auto_208668 ) ) ( not ( = ?auto_208664 ?auto_208669 ) ) ( not ( = ?auto_208664 ?auto_208670 ) ) ( not ( = ?auto_208665 ?auto_208666 ) ) ( not ( = ?auto_208665 ?auto_208667 ) ) ( not ( = ?auto_208665 ?auto_208668 ) ) ( not ( = ?auto_208665 ?auto_208669 ) ) ( not ( = ?auto_208665 ?auto_208670 ) ) ( not ( = ?auto_208666 ?auto_208667 ) ) ( not ( = ?auto_208666 ?auto_208668 ) ) ( not ( = ?auto_208666 ?auto_208669 ) ) ( not ( = ?auto_208666 ?auto_208670 ) ) ( not ( = ?auto_208667 ?auto_208668 ) ) ( not ( = ?auto_208667 ?auto_208669 ) ) ( not ( = ?auto_208667 ?auto_208670 ) ) ( not ( = ?auto_208668 ?auto_208669 ) ) ( not ( = ?auto_208668 ?auto_208670 ) ) ( not ( = ?auto_208669 ?auto_208670 ) ) ( ON-TABLE ?auto_208670 ) ( ON ?auto_208669 ?auto_208670 ) ( ON ?auto_208668 ?auto_208669 ) ( ON ?auto_208667 ?auto_208668 ) ( CLEAR ?auto_208667 ) ( HOLDING ?auto_208666 ) ( CLEAR ?auto_208665 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_208663 ?auto_208664 ?auto_208665 ?auto_208666 )
      ( MAKE-8PILE ?auto_208663 ?auto_208664 ?auto_208665 ?auto_208666 ?auto_208667 ?auto_208668 ?auto_208669 ?auto_208670 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_208671 - BLOCK
      ?auto_208672 - BLOCK
      ?auto_208673 - BLOCK
      ?auto_208674 - BLOCK
      ?auto_208675 - BLOCK
      ?auto_208676 - BLOCK
      ?auto_208677 - BLOCK
      ?auto_208678 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_208671 ) ( ON ?auto_208672 ?auto_208671 ) ( ON ?auto_208673 ?auto_208672 ) ( not ( = ?auto_208671 ?auto_208672 ) ) ( not ( = ?auto_208671 ?auto_208673 ) ) ( not ( = ?auto_208671 ?auto_208674 ) ) ( not ( = ?auto_208671 ?auto_208675 ) ) ( not ( = ?auto_208671 ?auto_208676 ) ) ( not ( = ?auto_208671 ?auto_208677 ) ) ( not ( = ?auto_208671 ?auto_208678 ) ) ( not ( = ?auto_208672 ?auto_208673 ) ) ( not ( = ?auto_208672 ?auto_208674 ) ) ( not ( = ?auto_208672 ?auto_208675 ) ) ( not ( = ?auto_208672 ?auto_208676 ) ) ( not ( = ?auto_208672 ?auto_208677 ) ) ( not ( = ?auto_208672 ?auto_208678 ) ) ( not ( = ?auto_208673 ?auto_208674 ) ) ( not ( = ?auto_208673 ?auto_208675 ) ) ( not ( = ?auto_208673 ?auto_208676 ) ) ( not ( = ?auto_208673 ?auto_208677 ) ) ( not ( = ?auto_208673 ?auto_208678 ) ) ( not ( = ?auto_208674 ?auto_208675 ) ) ( not ( = ?auto_208674 ?auto_208676 ) ) ( not ( = ?auto_208674 ?auto_208677 ) ) ( not ( = ?auto_208674 ?auto_208678 ) ) ( not ( = ?auto_208675 ?auto_208676 ) ) ( not ( = ?auto_208675 ?auto_208677 ) ) ( not ( = ?auto_208675 ?auto_208678 ) ) ( not ( = ?auto_208676 ?auto_208677 ) ) ( not ( = ?auto_208676 ?auto_208678 ) ) ( not ( = ?auto_208677 ?auto_208678 ) ) ( ON-TABLE ?auto_208678 ) ( ON ?auto_208677 ?auto_208678 ) ( ON ?auto_208676 ?auto_208677 ) ( ON ?auto_208675 ?auto_208676 ) ( CLEAR ?auto_208673 ) ( ON ?auto_208674 ?auto_208675 ) ( CLEAR ?auto_208674 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_208678 ?auto_208677 ?auto_208676 ?auto_208675 )
      ( MAKE-8PILE ?auto_208671 ?auto_208672 ?auto_208673 ?auto_208674 ?auto_208675 ?auto_208676 ?auto_208677 ?auto_208678 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_208679 - BLOCK
      ?auto_208680 - BLOCK
      ?auto_208681 - BLOCK
      ?auto_208682 - BLOCK
      ?auto_208683 - BLOCK
      ?auto_208684 - BLOCK
      ?auto_208685 - BLOCK
      ?auto_208686 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_208679 ) ( ON ?auto_208680 ?auto_208679 ) ( not ( = ?auto_208679 ?auto_208680 ) ) ( not ( = ?auto_208679 ?auto_208681 ) ) ( not ( = ?auto_208679 ?auto_208682 ) ) ( not ( = ?auto_208679 ?auto_208683 ) ) ( not ( = ?auto_208679 ?auto_208684 ) ) ( not ( = ?auto_208679 ?auto_208685 ) ) ( not ( = ?auto_208679 ?auto_208686 ) ) ( not ( = ?auto_208680 ?auto_208681 ) ) ( not ( = ?auto_208680 ?auto_208682 ) ) ( not ( = ?auto_208680 ?auto_208683 ) ) ( not ( = ?auto_208680 ?auto_208684 ) ) ( not ( = ?auto_208680 ?auto_208685 ) ) ( not ( = ?auto_208680 ?auto_208686 ) ) ( not ( = ?auto_208681 ?auto_208682 ) ) ( not ( = ?auto_208681 ?auto_208683 ) ) ( not ( = ?auto_208681 ?auto_208684 ) ) ( not ( = ?auto_208681 ?auto_208685 ) ) ( not ( = ?auto_208681 ?auto_208686 ) ) ( not ( = ?auto_208682 ?auto_208683 ) ) ( not ( = ?auto_208682 ?auto_208684 ) ) ( not ( = ?auto_208682 ?auto_208685 ) ) ( not ( = ?auto_208682 ?auto_208686 ) ) ( not ( = ?auto_208683 ?auto_208684 ) ) ( not ( = ?auto_208683 ?auto_208685 ) ) ( not ( = ?auto_208683 ?auto_208686 ) ) ( not ( = ?auto_208684 ?auto_208685 ) ) ( not ( = ?auto_208684 ?auto_208686 ) ) ( not ( = ?auto_208685 ?auto_208686 ) ) ( ON-TABLE ?auto_208686 ) ( ON ?auto_208685 ?auto_208686 ) ( ON ?auto_208684 ?auto_208685 ) ( ON ?auto_208683 ?auto_208684 ) ( ON ?auto_208682 ?auto_208683 ) ( CLEAR ?auto_208682 ) ( HOLDING ?auto_208681 ) ( CLEAR ?auto_208680 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_208679 ?auto_208680 ?auto_208681 )
      ( MAKE-8PILE ?auto_208679 ?auto_208680 ?auto_208681 ?auto_208682 ?auto_208683 ?auto_208684 ?auto_208685 ?auto_208686 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_208687 - BLOCK
      ?auto_208688 - BLOCK
      ?auto_208689 - BLOCK
      ?auto_208690 - BLOCK
      ?auto_208691 - BLOCK
      ?auto_208692 - BLOCK
      ?auto_208693 - BLOCK
      ?auto_208694 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_208687 ) ( ON ?auto_208688 ?auto_208687 ) ( not ( = ?auto_208687 ?auto_208688 ) ) ( not ( = ?auto_208687 ?auto_208689 ) ) ( not ( = ?auto_208687 ?auto_208690 ) ) ( not ( = ?auto_208687 ?auto_208691 ) ) ( not ( = ?auto_208687 ?auto_208692 ) ) ( not ( = ?auto_208687 ?auto_208693 ) ) ( not ( = ?auto_208687 ?auto_208694 ) ) ( not ( = ?auto_208688 ?auto_208689 ) ) ( not ( = ?auto_208688 ?auto_208690 ) ) ( not ( = ?auto_208688 ?auto_208691 ) ) ( not ( = ?auto_208688 ?auto_208692 ) ) ( not ( = ?auto_208688 ?auto_208693 ) ) ( not ( = ?auto_208688 ?auto_208694 ) ) ( not ( = ?auto_208689 ?auto_208690 ) ) ( not ( = ?auto_208689 ?auto_208691 ) ) ( not ( = ?auto_208689 ?auto_208692 ) ) ( not ( = ?auto_208689 ?auto_208693 ) ) ( not ( = ?auto_208689 ?auto_208694 ) ) ( not ( = ?auto_208690 ?auto_208691 ) ) ( not ( = ?auto_208690 ?auto_208692 ) ) ( not ( = ?auto_208690 ?auto_208693 ) ) ( not ( = ?auto_208690 ?auto_208694 ) ) ( not ( = ?auto_208691 ?auto_208692 ) ) ( not ( = ?auto_208691 ?auto_208693 ) ) ( not ( = ?auto_208691 ?auto_208694 ) ) ( not ( = ?auto_208692 ?auto_208693 ) ) ( not ( = ?auto_208692 ?auto_208694 ) ) ( not ( = ?auto_208693 ?auto_208694 ) ) ( ON-TABLE ?auto_208694 ) ( ON ?auto_208693 ?auto_208694 ) ( ON ?auto_208692 ?auto_208693 ) ( ON ?auto_208691 ?auto_208692 ) ( ON ?auto_208690 ?auto_208691 ) ( CLEAR ?auto_208688 ) ( ON ?auto_208689 ?auto_208690 ) ( CLEAR ?auto_208689 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_208694 ?auto_208693 ?auto_208692 ?auto_208691 ?auto_208690 )
      ( MAKE-8PILE ?auto_208687 ?auto_208688 ?auto_208689 ?auto_208690 ?auto_208691 ?auto_208692 ?auto_208693 ?auto_208694 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_208695 - BLOCK
      ?auto_208696 - BLOCK
      ?auto_208697 - BLOCK
      ?auto_208698 - BLOCK
      ?auto_208699 - BLOCK
      ?auto_208700 - BLOCK
      ?auto_208701 - BLOCK
      ?auto_208702 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_208695 ) ( not ( = ?auto_208695 ?auto_208696 ) ) ( not ( = ?auto_208695 ?auto_208697 ) ) ( not ( = ?auto_208695 ?auto_208698 ) ) ( not ( = ?auto_208695 ?auto_208699 ) ) ( not ( = ?auto_208695 ?auto_208700 ) ) ( not ( = ?auto_208695 ?auto_208701 ) ) ( not ( = ?auto_208695 ?auto_208702 ) ) ( not ( = ?auto_208696 ?auto_208697 ) ) ( not ( = ?auto_208696 ?auto_208698 ) ) ( not ( = ?auto_208696 ?auto_208699 ) ) ( not ( = ?auto_208696 ?auto_208700 ) ) ( not ( = ?auto_208696 ?auto_208701 ) ) ( not ( = ?auto_208696 ?auto_208702 ) ) ( not ( = ?auto_208697 ?auto_208698 ) ) ( not ( = ?auto_208697 ?auto_208699 ) ) ( not ( = ?auto_208697 ?auto_208700 ) ) ( not ( = ?auto_208697 ?auto_208701 ) ) ( not ( = ?auto_208697 ?auto_208702 ) ) ( not ( = ?auto_208698 ?auto_208699 ) ) ( not ( = ?auto_208698 ?auto_208700 ) ) ( not ( = ?auto_208698 ?auto_208701 ) ) ( not ( = ?auto_208698 ?auto_208702 ) ) ( not ( = ?auto_208699 ?auto_208700 ) ) ( not ( = ?auto_208699 ?auto_208701 ) ) ( not ( = ?auto_208699 ?auto_208702 ) ) ( not ( = ?auto_208700 ?auto_208701 ) ) ( not ( = ?auto_208700 ?auto_208702 ) ) ( not ( = ?auto_208701 ?auto_208702 ) ) ( ON-TABLE ?auto_208702 ) ( ON ?auto_208701 ?auto_208702 ) ( ON ?auto_208700 ?auto_208701 ) ( ON ?auto_208699 ?auto_208700 ) ( ON ?auto_208698 ?auto_208699 ) ( ON ?auto_208697 ?auto_208698 ) ( CLEAR ?auto_208697 ) ( HOLDING ?auto_208696 ) ( CLEAR ?auto_208695 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_208695 ?auto_208696 )
      ( MAKE-8PILE ?auto_208695 ?auto_208696 ?auto_208697 ?auto_208698 ?auto_208699 ?auto_208700 ?auto_208701 ?auto_208702 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_208703 - BLOCK
      ?auto_208704 - BLOCK
      ?auto_208705 - BLOCK
      ?auto_208706 - BLOCK
      ?auto_208707 - BLOCK
      ?auto_208708 - BLOCK
      ?auto_208709 - BLOCK
      ?auto_208710 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_208703 ) ( not ( = ?auto_208703 ?auto_208704 ) ) ( not ( = ?auto_208703 ?auto_208705 ) ) ( not ( = ?auto_208703 ?auto_208706 ) ) ( not ( = ?auto_208703 ?auto_208707 ) ) ( not ( = ?auto_208703 ?auto_208708 ) ) ( not ( = ?auto_208703 ?auto_208709 ) ) ( not ( = ?auto_208703 ?auto_208710 ) ) ( not ( = ?auto_208704 ?auto_208705 ) ) ( not ( = ?auto_208704 ?auto_208706 ) ) ( not ( = ?auto_208704 ?auto_208707 ) ) ( not ( = ?auto_208704 ?auto_208708 ) ) ( not ( = ?auto_208704 ?auto_208709 ) ) ( not ( = ?auto_208704 ?auto_208710 ) ) ( not ( = ?auto_208705 ?auto_208706 ) ) ( not ( = ?auto_208705 ?auto_208707 ) ) ( not ( = ?auto_208705 ?auto_208708 ) ) ( not ( = ?auto_208705 ?auto_208709 ) ) ( not ( = ?auto_208705 ?auto_208710 ) ) ( not ( = ?auto_208706 ?auto_208707 ) ) ( not ( = ?auto_208706 ?auto_208708 ) ) ( not ( = ?auto_208706 ?auto_208709 ) ) ( not ( = ?auto_208706 ?auto_208710 ) ) ( not ( = ?auto_208707 ?auto_208708 ) ) ( not ( = ?auto_208707 ?auto_208709 ) ) ( not ( = ?auto_208707 ?auto_208710 ) ) ( not ( = ?auto_208708 ?auto_208709 ) ) ( not ( = ?auto_208708 ?auto_208710 ) ) ( not ( = ?auto_208709 ?auto_208710 ) ) ( ON-TABLE ?auto_208710 ) ( ON ?auto_208709 ?auto_208710 ) ( ON ?auto_208708 ?auto_208709 ) ( ON ?auto_208707 ?auto_208708 ) ( ON ?auto_208706 ?auto_208707 ) ( ON ?auto_208705 ?auto_208706 ) ( CLEAR ?auto_208703 ) ( ON ?auto_208704 ?auto_208705 ) ( CLEAR ?auto_208704 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_208710 ?auto_208709 ?auto_208708 ?auto_208707 ?auto_208706 ?auto_208705 )
      ( MAKE-8PILE ?auto_208703 ?auto_208704 ?auto_208705 ?auto_208706 ?auto_208707 ?auto_208708 ?auto_208709 ?auto_208710 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_208711 - BLOCK
      ?auto_208712 - BLOCK
      ?auto_208713 - BLOCK
      ?auto_208714 - BLOCK
      ?auto_208715 - BLOCK
      ?auto_208716 - BLOCK
      ?auto_208717 - BLOCK
      ?auto_208718 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_208711 ?auto_208712 ) ) ( not ( = ?auto_208711 ?auto_208713 ) ) ( not ( = ?auto_208711 ?auto_208714 ) ) ( not ( = ?auto_208711 ?auto_208715 ) ) ( not ( = ?auto_208711 ?auto_208716 ) ) ( not ( = ?auto_208711 ?auto_208717 ) ) ( not ( = ?auto_208711 ?auto_208718 ) ) ( not ( = ?auto_208712 ?auto_208713 ) ) ( not ( = ?auto_208712 ?auto_208714 ) ) ( not ( = ?auto_208712 ?auto_208715 ) ) ( not ( = ?auto_208712 ?auto_208716 ) ) ( not ( = ?auto_208712 ?auto_208717 ) ) ( not ( = ?auto_208712 ?auto_208718 ) ) ( not ( = ?auto_208713 ?auto_208714 ) ) ( not ( = ?auto_208713 ?auto_208715 ) ) ( not ( = ?auto_208713 ?auto_208716 ) ) ( not ( = ?auto_208713 ?auto_208717 ) ) ( not ( = ?auto_208713 ?auto_208718 ) ) ( not ( = ?auto_208714 ?auto_208715 ) ) ( not ( = ?auto_208714 ?auto_208716 ) ) ( not ( = ?auto_208714 ?auto_208717 ) ) ( not ( = ?auto_208714 ?auto_208718 ) ) ( not ( = ?auto_208715 ?auto_208716 ) ) ( not ( = ?auto_208715 ?auto_208717 ) ) ( not ( = ?auto_208715 ?auto_208718 ) ) ( not ( = ?auto_208716 ?auto_208717 ) ) ( not ( = ?auto_208716 ?auto_208718 ) ) ( not ( = ?auto_208717 ?auto_208718 ) ) ( ON-TABLE ?auto_208718 ) ( ON ?auto_208717 ?auto_208718 ) ( ON ?auto_208716 ?auto_208717 ) ( ON ?auto_208715 ?auto_208716 ) ( ON ?auto_208714 ?auto_208715 ) ( ON ?auto_208713 ?auto_208714 ) ( ON ?auto_208712 ?auto_208713 ) ( CLEAR ?auto_208712 ) ( HOLDING ?auto_208711 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_208711 )
      ( MAKE-8PILE ?auto_208711 ?auto_208712 ?auto_208713 ?auto_208714 ?auto_208715 ?auto_208716 ?auto_208717 ?auto_208718 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_208719 - BLOCK
      ?auto_208720 - BLOCK
      ?auto_208721 - BLOCK
      ?auto_208722 - BLOCK
      ?auto_208723 - BLOCK
      ?auto_208724 - BLOCK
      ?auto_208725 - BLOCK
      ?auto_208726 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_208719 ?auto_208720 ) ) ( not ( = ?auto_208719 ?auto_208721 ) ) ( not ( = ?auto_208719 ?auto_208722 ) ) ( not ( = ?auto_208719 ?auto_208723 ) ) ( not ( = ?auto_208719 ?auto_208724 ) ) ( not ( = ?auto_208719 ?auto_208725 ) ) ( not ( = ?auto_208719 ?auto_208726 ) ) ( not ( = ?auto_208720 ?auto_208721 ) ) ( not ( = ?auto_208720 ?auto_208722 ) ) ( not ( = ?auto_208720 ?auto_208723 ) ) ( not ( = ?auto_208720 ?auto_208724 ) ) ( not ( = ?auto_208720 ?auto_208725 ) ) ( not ( = ?auto_208720 ?auto_208726 ) ) ( not ( = ?auto_208721 ?auto_208722 ) ) ( not ( = ?auto_208721 ?auto_208723 ) ) ( not ( = ?auto_208721 ?auto_208724 ) ) ( not ( = ?auto_208721 ?auto_208725 ) ) ( not ( = ?auto_208721 ?auto_208726 ) ) ( not ( = ?auto_208722 ?auto_208723 ) ) ( not ( = ?auto_208722 ?auto_208724 ) ) ( not ( = ?auto_208722 ?auto_208725 ) ) ( not ( = ?auto_208722 ?auto_208726 ) ) ( not ( = ?auto_208723 ?auto_208724 ) ) ( not ( = ?auto_208723 ?auto_208725 ) ) ( not ( = ?auto_208723 ?auto_208726 ) ) ( not ( = ?auto_208724 ?auto_208725 ) ) ( not ( = ?auto_208724 ?auto_208726 ) ) ( not ( = ?auto_208725 ?auto_208726 ) ) ( ON-TABLE ?auto_208726 ) ( ON ?auto_208725 ?auto_208726 ) ( ON ?auto_208724 ?auto_208725 ) ( ON ?auto_208723 ?auto_208724 ) ( ON ?auto_208722 ?auto_208723 ) ( ON ?auto_208721 ?auto_208722 ) ( ON ?auto_208720 ?auto_208721 ) ( ON ?auto_208719 ?auto_208720 ) ( CLEAR ?auto_208719 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_208726 ?auto_208725 ?auto_208724 ?auto_208723 ?auto_208722 ?auto_208721 ?auto_208720 )
      ( MAKE-8PILE ?auto_208719 ?auto_208720 ?auto_208721 ?auto_208722 ?auto_208723 ?auto_208724 ?auto_208725 ?auto_208726 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_208727 - BLOCK
      ?auto_208728 - BLOCK
      ?auto_208729 - BLOCK
      ?auto_208730 - BLOCK
      ?auto_208731 - BLOCK
      ?auto_208732 - BLOCK
      ?auto_208733 - BLOCK
      ?auto_208734 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_208727 ?auto_208728 ) ) ( not ( = ?auto_208727 ?auto_208729 ) ) ( not ( = ?auto_208727 ?auto_208730 ) ) ( not ( = ?auto_208727 ?auto_208731 ) ) ( not ( = ?auto_208727 ?auto_208732 ) ) ( not ( = ?auto_208727 ?auto_208733 ) ) ( not ( = ?auto_208727 ?auto_208734 ) ) ( not ( = ?auto_208728 ?auto_208729 ) ) ( not ( = ?auto_208728 ?auto_208730 ) ) ( not ( = ?auto_208728 ?auto_208731 ) ) ( not ( = ?auto_208728 ?auto_208732 ) ) ( not ( = ?auto_208728 ?auto_208733 ) ) ( not ( = ?auto_208728 ?auto_208734 ) ) ( not ( = ?auto_208729 ?auto_208730 ) ) ( not ( = ?auto_208729 ?auto_208731 ) ) ( not ( = ?auto_208729 ?auto_208732 ) ) ( not ( = ?auto_208729 ?auto_208733 ) ) ( not ( = ?auto_208729 ?auto_208734 ) ) ( not ( = ?auto_208730 ?auto_208731 ) ) ( not ( = ?auto_208730 ?auto_208732 ) ) ( not ( = ?auto_208730 ?auto_208733 ) ) ( not ( = ?auto_208730 ?auto_208734 ) ) ( not ( = ?auto_208731 ?auto_208732 ) ) ( not ( = ?auto_208731 ?auto_208733 ) ) ( not ( = ?auto_208731 ?auto_208734 ) ) ( not ( = ?auto_208732 ?auto_208733 ) ) ( not ( = ?auto_208732 ?auto_208734 ) ) ( not ( = ?auto_208733 ?auto_208734 ) ) ( ON-TABLE ?auto_208734 ) ( ON ?auto_208733 ?auto_208734 ) ( ON ?auto_208732 ?auto_208733 ) ( ON ?auto_208731 ?auto_208732 ) ( ON ?auto_208730 ?auto_208731 ) ( ON ?auto_208729 ?auto_208730 ) ( ON ?auto_208728 ?auto_208729 ) ( HOLDING ?auto_208727 ) ( CLEAR ?auto_208728 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_208734 ?auto_208733 ?auto_208732 ?auto_208731 ?auto_208730 ?auto_208729 ?auto_208728 ?auto_208727 )
      ( MAKE-8PILE ?auto_208727 ?auto_208728 ?auto_208729 ?auto_208730 ?auto_208731 ?auto_208732 ?auto_208733 ?auto_208734 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_208735 - BLOCK
      ?auto_208736 - BLOCK
      ?auto_208737 - BLOCK
      ?auto_208738 - BLOCK
      ?auto_208739 - BLOCK
      ?auto_208740 - BLOCK
      ?auto_208741 - BLOCK
      ?auto_208742 - BLOCK
    )
    :vars
    (
      ?auto_208743 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_208735 ?auto_208736 ) ) ( not ( = ?auto_208735 ?auto_208737 ) ) ( not ( = ?auto_208735 ?auto_208738 ) ) ( not ( = ?auto_208735 ?auto_208739 ) ) ( not ( = ?auto_208735 ?auto_208740 ) ) ( not ( = ?auto_208735 ?auto_208741 ) ) ( not ( = ?auto_208735 ?auto_208742 ) ) ( not ( = ?auto_208736 ?auto_208737 ) ) ( not ( = ?auto_208736 ?auto_208738 ) ) ( not ( = ?auto_208736 ?auto_208739 ) ) ( not ( = ?auto_208736 ?auto_208740 ) ) ( not ( = ?auto_208736 ?auto_208741 ) ) ( not ( = ?auto_208736 ?auto_208742 ) ) ( not ( = ?auto_208737 ?auto_208738 ) ) ( not ( = ?auto_208737 ?auto_208739 ) ) ( not ( = ?auto_208737 ?auto_208740 ) ) ( not ( = ?auto_208737 ?auto_208741 ) ) ( not ( = ?auto_208737 ?auto_208742 ) ) ( not ( = ?auto_208738 ?auto_208739 ) ) ( not ( = ?auto_208738 ?auto_208740 ) ) ( not ( = ?auto_208738 ?auto_208741 ) ) ( not ( = ?auto_208738 ?auto_208742 ) ) ( not ( = ?auto_208739 ?auto_208740 ) ) ( not ( = ?auto_208739 ?auto_208741 ) ) ( not ( = ?auto_208739 ?auto_208742 ) ) ( not ( = ?auto_208740 ?auto_208741 ) ) ( not ( = ?auto_208740 ?auto_208742 ) ) ( not ( = ?auto_208741 ?auto_208742 ) ) ( ON-TABLE ?auto_208742 ) ( ON ?auto_208741 ?auto_208742 ) ( ON ?auto_208740 ?auto_208741 ) ( ON ?auto_208739 ?auto_208740 ) ( ON ?auto_208738 ?auto_208739 ) ( ON ?auto_208737 ?auto_208738 ) ( ON ?auto_208736 ?auto_208737 ) ( CLEAR ?auto_208736 ) ( ON ?auto_208735 ?auto_208743 ) ( CLEAR ?auto_208735 ) ( HAND-EMPTY ) ( not ( = ?auto_208735 ?auto_208743 ) ) ( not ( = ?auto_208736 ?auto_208743 ) ) ( not ( = ?auto_208737 ?auto_208743 ) ) ( not ( = ?auto_208738 ?auto_208743 ) ) ( not ( = ?auto_208739 ?auto_208743 ) ) ( not ( = ?auto_208740 ?auto_208743 ) ) ( not ( = ?auto_208741 ?auto_208743 ) ) ( not ( = ?auto_208742 ?auto_208743 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_208735 ?auto_208743 )
      ( MAKE-8PILE ?auto_208735 ?auto_208736 ?auto_208737 ?auto_208738 ?auto_208739 ?auto_208740 ?auto_208741 ?auto_208742 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_208744 - BLOCK
      ?auto_208745 - BLOCK
      ?auto_208746 - BLOCK
      ?auto_208747 - BLOCK
      ?auto_208748 - BLOCK
      ?auto_208749 - BLOCK
      ?auto_208750 - BLOCK
      ?auto_208751 - BLOCK
    )
    :vars
    (
      ?auto_208752 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_208744 ?auto_208745 ) ) ( not ( = ?auto_208744 ?auto_208746 ) ) ( not ( = ?auto_208744 ?auto_208747 ) ) ( not ( = ?auto_208744 ?auto_208748 ) ) ( not ( = ?auto_208744 ?auto_208749 ) ) ( not ( = ?auto_208744 ?auto_208750 ) ) ( not ( = ?auto_208744 ?auto_208751 ) ) ( not ( = ?auto_208745 ?auto_208746 ) ) ( not ( = ?auto_208745 ?auto_208747 ) ) ( not ( = ?auto_208745 ?auto_208748 ) ) ( not ( = ?auto_208745 ?auto_208749 ) ) ( not ( = ?auto_208745 ?auto_208750 ) ) ( not ( = ?auto_208745 ?auto_208751 ) ) ( not ( = ?auto_208746 ?auto_208747 ) ) ( not ( = ?auto_208746 ?auto_208748 ) ) ( not ( = ?auto_208746 ?auto_208749 ) ) ( not ( = ?auto_208746 ?auto_208750 ) ) ( not ( = ?auto_208746 ?auto_208751 ) ) ( not ( = ?auto_208747 ?auto_208748 ) ) ( not ( = ?auto_208747 ?auto_208749 ) ) ( not ( = ?auto_208747 ?auto_208750 ) ) ( not ( = ?auto_208747 ?auto_208751 ) ) ( not ( = ?auto_208748 ?auto_208749 ) ) ( not ( = ?auto_208748 ?auto_208750 ) ) ( not ( = ?auto_208748 ?auto_208751 ) ) ( not ( = ?auto_208749 ?auto_208750 ) ) ( not ( = ?auto_208749 ?auto_208751 ) ) ( not ( = ?auto_208750 ?auto_208751 ) ) ( ON-TABLE ?auto_208751 ) ( ON ?auto_208750 ?auto_208751 ) ( ON ?auto_208749 ?auto_208750 ) ( ON ?auto_208748 ?auto_208749 ) ( ON ?auto_208747 ?auto_208748 ) ( ON ?auto_208746 ?auto_208747 ) ( ON ?auto_208744 ?auto_208752 ) ( CLEAR ?auto_208744 ) ( not ( = ?auto_208744 ?auto_208752 ) ) ( not ( = ?auto_208745 ?auto_208752 ) ) ( not ( = ?auto_208746 ?auto_208752 ) ) ( not ( = ?auto_208747 ?auto_208752 ) ) ( not ( = ?auto_208748 ?auto_208752 ) ) ( not ( = ?auto_208749 ?auto_208752 ) ) ( not ( = ?auto_208750 ?auto_208752 ) ) ( not ( = ?auto_208751 ?auto_208752 ) ) ( HOLDING ?auto_208745 ) ( CLEAR ?auto_208746 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_208751 ?auto_208750 ?auto_208749 ?auto_208748 ?auto_208747 ?auto_208746 ?auto_208745 )
      ( MAKE-8PILE ?auto_208744 ?auto_208745 ?auto_208746 ?auto_208747 ?auto_208748 ?auto_208749 ?auto_208750 ?auto_208751 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_208753 - BLOCK
      ?auto_208754 - BLOCK
      ?auto_208755 - BLOCK
      ?auto_208756 - BLOCK
      ?auto_208757 - BLOCK
      ?auto_208758 - BLOCK
      ?auto_208759 - BLOCK
      ?auto_208760 - BLOCK
    )
    :vars
    (
      ?auto_208761 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_208753 ?auto_208754 ) ) ( not ( = ?auto_208753 ?auto_208755 ) ) ( not ( = ?auto_208753 ?auto_208756 ) ) ( not ( = ?auto_208753 ?auto_208757 ) ) ( not ( = ?auto_208753 ?auto_208758 ) ) ( not ( = ?auto_208753 ?auto_208759 ) ) ( not ( = ?auto_208753 ?auto_208760 ) ) ( not ( = ?auto_208754 ?auto_208755 ) ) ( not ( = ?auto_208754 ?auto_208756 ) ) ( not ( = ?auto_208754 ?auto_208757 ) ) ( not ( = ?auto_208754 ?auto_208758 ) ) ( not ( = ?auto_208754 ?auto_208759 ) ) ( not ( = ?auto_208754 ?auto_208760 ) ) ( not ( = ?auto_208755 ?auto_208756 ) ) ( not ( = ?auto_208755 ?auto_208757 ) ) ( not ( = ?auto_208755 ?auto_208758 ) ) ( not ( = ?auto_208755 ?auto_208759 ) ) ( not ( = ?auto_208755 ?auto_208760 ) ) ( not ( = ?auto_208756 ?auto_208757 ) ) ( not ( = ?auto_208756 ?auto_208758 ) ) ( not ( = ?auto_208756 ?auto_208759 ) ) ( not ( = ?auto_208756 ?auto_208760 ) ) ( not ( = ?auto_208757 ?auto_208758 ) ) ( not ( = ?auto_208757 ?auto_208759 ) ) ( not ( = ?auto_208757 ?auto_208760 ) ) ( not ( = ?auto_208758 ?auto_208759 ) ) ( not ( = ?auto_208758 ?auto_208760 ) ) ( not ( = ?auto_208759 ?auto_208760 ) ) ( ON-TABLE ?auto_208760 ) ( ON ?auto_208759 ?auto_208760 ) ( ON ?auto_208758 ?auto_208759 ) ( ON ?auto_208757 ?auto_208758 ) ( ON ?auto_208756 ?auto_208757 ) ( ON ?auto_208755 ?auto_208756 ) ( ON ?auto_208753 ?auto_208761 ) ( not ( = ?auto_208753 ?auto_208761 ) ) ( not ( = ?auto_208754 ?auto_208761 ) ) ( not ( = ?auto_208755 ?auto_208761 ) ) ( not ( = ?auto_208756 ?auto_208761 ) ) ( not ( = ?auto_208757 ?auto_208761 ) ) ( not ( = ?auto_208758 ?auto_208761 ) ) ( not ( = ?auto_208759 ?auto_208761 ) ) ( not ( = ?auto_208760 ?auto_208761 ) ) ( CLEAR ?auto_208755 ) ( ON ?auto_208754 ?auto_208753 ) ( CLEAR ?auto_208754 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_208761 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_208761 ?auto_208753 )
      ( MAKE-8PILE ?auto_208753 ?auto_208754 ?auto_208755 ?auto_208756 ?auto_208757 ?auto_208758 ?auto_208759 ?auto_208760 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_208762 - BLOCK
      ?auto_208763 - BLOCK
      ?auto_208764 - BLOCK
      ?auto_208765 - BLOCK
      ?auto_208766 - BLOCK
      ?auto_208767 - BLOCK
      ?auto_208768 - BLOCK
      ?auto_208769 - BLOCK
    )
    :vars
    (
      ?auto_208770 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_208762 ?auto_208763 ) ) ( not ( = ?auto_208762 ?auto_208764 ) ) ( not ( = ?auto_208762 ?auto_208765 ) ) ( not ( = ?auto_208762 ?auto_208766 ) ) ( not ( = ?auto_208762 ?auto_208767 ) ) ( not ( = ?auto_208762 ?auto_208768 ) ) ( not ( = ?auto_208762 ?auto_208769 ) ) ( not ( = ?auto_208763 ?auto_208764 ) ) ( not ( = ?auto_208763 ?auto_208765 ) ) ( not ( = ?auto_208763 ?auto_208766 ) ) ( not ( = ?auto_208763 ?auto_208767 ) ) ( not ( = ?auto_208763 ?auto_208768 ) ) ( not ( = ?auto_208763 ?auto_208769 ) ) ( not ( = ?auto_208764 ?auto_208765 ) ) ( not ( = ?auto_208764 ?auto_208766 ) ) ( not ( = ?auto_208764 ?auto_208767 ) ) ( not ( = ?auto_208764 ?auto_208768 ) ) ( not ( = ?auto_208764 ?auto_208769 ) ) ( not ( = ?auto_208765 ?auto_208766 ) ) ( not ( = ?auto_208765 ?auto_208767 ) ) ( not ( = ?auto_208765 ?auto_208768 ) ) ( not ( = ?auto_208765 ?auto_208769 ) ) ( not ( = ?auto_208766 ?auto_208767 ) ) ( not ( = ?auto_208766 ?auto_208768 ) ) ( not ( = ?auto_208766 ?auto_208769 ) ) ( not ( = ?auto_208767 ?auto_208768 ) ) ( not ( = ?auto_208767 ?auto_208769 ) ) ( not ( = ?auto_208768 ?auto_208769 ) ) ( ON-TABLE ?auto_208769 ) ( ON ?auto_208768 ?auto_208769 ) ( ON ?auto_208767 ?auto_208768 ) ( ON ?auto_208766 ?auto_208767 ) ( ON ?auto_208765 ?auto_208766 ) ( ON ?auto_208762 ?auto_208770 ) ( not ( = ?auto_208762 ?auto_208770 ) ) ( not ( = ?auto_208763 ?auto_208770 ) ) ( not ( = ?auto_208764 ?auto_208770 ) ) ( not ( = ?auto_208765 ?auto_208770 ) ) ( not ( = ?auto_208766 ?auto_208770 ) ) ( not ( = ?auto_208767 ?auto_208770 ) ) ( not ( = ?auto_208768 ?auto_208770 ) ) ( not ( = ?auto_208769 ?auto_208770 ) ) ( ON ?auto_208763 ?auto_208762 ) ( CLEAR ?auto_208763 ) ( ON-TABLE ?auto_208770 ) ( HOLDING ?auto_208764 ) ( CLEAR ?auto_208765 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_208769 ?auto_208768 ?auto_208767 ?auto_208766 ?auto_208765 ?auto_208764 )
      ( MAKE-8PILE ?auto_208762 ?auto_208763 ?auto_208764 ?auto_208765 ?auto_208766 ?auto_208767 ?auto_208768 ?auto_208769 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_208771 - BLOCK
      ?auto_208772 - BLOCK
      ?auto_208773 - BLOCK
      ?auto_208774 - BLOCK
      ?auto_208775 - BLOCK
      ?auto_208776 - BLOCK
      ?auto_208777 - BLOCK
      ?auto_208778 - BLOCK
    )
    :vars
    (
      ?auto_208779 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_208771 ?auto_208772 ) ) ( not ( = ?auto_208771 ?auto_208773 ) ) ( not ( = ?auto_208771 ?auto_208774 ) ) ( not ( = ?auto_208771 ?auto_208775 ) ) ( not ( = ?auto_208771 ?auto_208776 ) ) ( not ( = ?auto_208771 ?auto_208777 ) ) ( not ( = ?auto_208771 ?auto_208778 ) ) ( not ( = ?auto_208772 ?auto_208773 ) ) ( not ( = ?auto_208772 ?auto_208774 ) ) ( not ( = ?auto_208772 ?auto_208775 ) ) ( not ( = ?auto_208772 ?auto_208776 ) ) ( not ( = ?auto_208772 ?auto_208777 ) ) ( not ( = ?auto_208772 ?auto_208778 ) ) ( not ( = ?auto_208773 ?auto_208774 ) ) ( not ( = ?auto_208773 ?auto_208775 ) ) ( not ( = ?auto_208773 ?auto_208776 ) ) ( not ( = ?auto_208773 ?auto_208777 ) ) ( not ( = ?auto_208773 ?auto_208778 ) ) ( not ( = ?auto_208774 ?auto_208775 ) ) ( not ( = ?auto_208774 ?auto_208776 ) ) ( not ( = ?auto_208774 ?auto_208777 ) ) ( not ( = ?auto_208774 ?auto_208778 ) ) ( not ( = ?auto_208775 ?auto_208776 ) ) ( not ( = ?auto_208775 ?auto_208777 ) ) ( not ( = ?auto_208775 ?auto_208778 ) ) ( not ( = ?auto_208776 ?auto_208777 ) ) ( not ( = ?auto_208776 ?auto_208778 ) ) ( not ( = ?auto_208777 ?auto_208778 ) ) ( ON-TABLE ?auto_208778 ) ( ON ?auto_208777 ?auto_208778 ) ( ON ?auto_208776 ?auto_208777 ) ( ON ?auto_208775 ?auto_208776 ) ( ON ?auto_208774 ?auto_208775 ) ( ON ?auto_208771 ?auto_208779 ) ( not ( = ?auto_208771 ?auto_208779 ) ) ( not ( = ?auto_208772 ?auto_208779 ) ) ( not ( = ?auto_208773 ?auto_208779 ) ) ( not ( = ?auto_208774 ?auto_208779 ) ) ( not ( = ?auto_208775 ?auto_208779 ) ) ( not ( = ?auto_208776 ?auto_208779 ) ) ( not ( = ?auto_208777 ?auto_208779 ) ) ( not ( = ?auto_208778 ?auto_208779 ) ) ( ON ?auto_208772 ?auto_208771 ) ( ON-TABLE ?auto_208779 ) ( CLEAR ?auto_208774 ) ( ON ?auto_208773 ?auto_208772 ) ( CLEAR ?auto_208773 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_208779 ?auto_208771 ?auto_208772 )
      ( MAKE-8PILE ?auto_208771 ?auto_208772 ?auto_208773 ?auto_208774 ?auto_208775 ?auto_208776 ?auto_208777 ?auto_208778 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_208780 - BLOCK
      ?auto_208781 - BLOCK
      ?auto_208782 - BLOCK
      ?auto_208783 - BLOCK
      ?auto_208784 - BLOCK
      ?auto_208785 - BLOCK
      ?auto_208786 - BLOCK
      ?auto_208787 - BLOCK
    )
    :vars
    (
      ?auto_208788 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_208780 ?auto_208781 ) ) ( not ( = ?auto_208780 ?auto_208782 ) ) ( not ( = ?auto_208780 ?auto_208783 ) ) ( not ( = ?auto_208780 ?auto_208784 ) ) ( not ( = ?auto_208780 ?auto_208785 ) ) ( not ( = ?auto_208780 ?auto_208786 ) ) ( not ( = ?auto_208780 ?auto_208787 ) ) ( not ( = ?auto_208781 ?auto_208782 ) ) ( not ( = ?auto_208781 ?auto_208783 ) ) ( not ( = ?auto_208781 ?auto_208784 ) ) ( not ( = ?auto_208781 ?auto_208785 ) ) ( not ( = ?auto_208781 ?auto_208786 ) ) ( not ( = ?auto_208781 ?auto_208787 ) ) ( not ( = ?auto_208782 ?auto_208783 ) ) ( not ( = ?auto_208782 ?auto_208784 ) ) ( not ( = ?auto_208782 ?auto_208785 ) ) ( not ( = ?auto_208782 ?auto_208786 ) ) ( not ( = ?auto_208782 ?auto_208787 ) ) ( not ( = ?auto_208783 ?auto_208784 ) ) ( not ( = ?auto_208783 ?auto_208785 ) ) ( not ( = ?auto_208783 ?auto_208786 ) ) ( not ( = ?auto_208783 ?auto_208787 ) ) ( not ( = ?auto_208784 ?auto_208785 ) ) ( not ( = ?auto_208784 ?auto_208786 ) ) ( not ( = ?auto_208784 ?auto_208787 ) ) ( not ( = ?auto_208785 ?auto_208786 ) ) ( not ( = ?auto_208785 ?auto_208787 ) ) ( not ( = ?auto_208786 ?auto_208787 ) ) ( ON-TABLE ?auto_208787 ) ( ON ?auto_208786 ?auto_208787 ) ( ON ?auto_208785 ?auto_208786 ) ( ON ?auto_208784 ?auto_208785 ) ( ON ?auto_208780 ?auto_208788 ) ( not ( = ?auto_208780 ?auto_208788 ) ) ( not ( = ?auto_208781 ?auto_208788 ) ) ( not ( = ?auto_208782 ?auto_208788 ) ) ( not ( = ?auto_208783 ?auto_208788 ) ) ( not ( = ?auto_208784 ?auto_208788 ) ) ( not ( = ?auto_208785 ?auto_208788 ) ) ( not ( = ?auto_208786 ?auto_208788 ) ) ( not ( = ?auto_208787 ?auto_208788 ) ) ( ON ?auto_208781 ?auto_208780 ) ( ON-TABLE ?auto_208788 ) ( ON ?auto_208782 ?auto_208781 ) ( CLEAR ?auto_208782 ) ( HOLDING ?auto_208783 ) ( CLEAR ?auto_208784 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_208787 ?auto_208786 ?auto_208785 ?auto_208784 ?auto_208783 )
      ( MAKE-8PILE ?auto_208780 ?auto_208781 ?auto_208782 ?auto_208783 ?auto_208784 ?auto_208785 ?auto_208786 ?auto_208787 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_208789 - BLOCK
      ?auto_208790 - BLOCK
      ?auto_208791 - BLOCK
      ?auto_208792 - BLOCK
      ?auto_208793 - BLOCK
      ?auto_208794 - BLOCK
      ?auto_208795 - BLOCK
      ?auto_208796 - BLOCK
    )
    :vars
    (
      ?auto_208797 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_208789 ?auto_208790 ) ) ( not ( = ?auto_208789 ?auto_208791 ) ) ( not ( = ?auto_208789 ?auto_208792 ) ) ( not ( = ?auto_208789 ?auto_208793 ) ) ( not ( = ?auto_208789 ?auto_208794 ) ) ( not ( = ?auto_208789 ?auto_208795 ) ) ( not ( = ?auto_208789 ?auto_208796 ) ) ( not ( = ?auto_208790 ?auto_208791 ) ) ( not ( = ?auto_208790 ?auto_208792 ) ) ( not ( = ?auto_208790 ?auto_208793 ) ) ( not ( = ?auto_208790 ?auto_208794 ) ) ( not ( = ?auto_208790 ?auto_208795 ) ) ( not ( = ?auto_208790 ?auto_208796 ) ) ( not ( = ?auto_208791 ?auto_208792 ) ) ( not ( = ?auto_208791 ?auto_208793 ) ) ( not ( = ?auto_208791 ?auto_208794 ) ) ( not ( = ?auto_208791 ?auto_208795 ) ) ( not ( = ?auto_208791 ?auto_208796 ) ) ( not ( = ?auto_208792 ?auto_208793 ) ) ( not ( = ?auto_208792 ?auto_208794 ) ) ( not ( = ?auto_208792 ?auto_208795 ) ) ( not ( = ?auto_208792 ?auto_208796 ) ) ( not ( = ?auto_208793 ?auto_208794 ) ) ( not ( = ?auto_208793 ?auto_208795 ) ) ( not ( = ?auto_208793 ?auto_208796 ) ) ( not ( = ?auto_208794 ?auto_208795 ) ) ( not ( = ?auto_208794 ?auto_208796 ) ) ( not ( = ?auto_208795 ?auto_208796 ) ) ( ON-TABLE ?auto_208796 ) ( ON ?auto_208795 ?auto_208796 ) ( ON ?auto_208794 ?auto_208795 ) ( ON ?auto_208793 ?auto_208794 ) ( ON ?auto_208789 ?auto_208797 ) ( not ( = ?auto_208789 ?auto_208797 ) ) ( not ( = ?auto_208790 ?auto_208797 ) ) ( not ( = ?auto_208791 ?auto_208797 ) ) ( not ( = ?auto_208792 ?auto_208797 ) ) ( not ( = ?auto_208793 ?auto_208797 ) ) ( not ( = ?auto_208794 ?auto_208797 ) ) ( not ( = ?auto_208795 ?auto_208797 ) ) ( not ( = ?auto_208796 ?auto_208797 ) ) ( ON ?auto_208790 ?auto_208789 ) ( ON-TABLE ?auto_208797 ) ( ON ?auto_208791 ?auto_208790 ) ( CLEAR ?auto_208793 ) ( ON ?auto_208792 ?auto_208791 ) ( CLEAR ?auto_208792 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_208797 ?auto_208789 ?auto_208790 ?auto_208791 )
      ( MAKE-8PILE ?auto_208789 ?auto_208790 ?auto_208791 ?auto_208792 ?auto_208793 ?auto_208794 ?auto_208795 ?auto_208796 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_208798 - BLOCK
      ?auto_208799 - BLOCK
      ?auto_208800 - BLOCK
      ?auto_208801 - BLOCK
      ?auto_208802 - BLOCK
      ?auto_208803 - BLOCK
      ?auto_208804 - BLOCK
      ?auto_208805 - BLOCK
    )
    :vars
    (
      ?auto_208806 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_208798 ?auto_208799 ) ) ( not ( = ?auto_208798 ?auto_208800 ) ) ( not ( = ?auto_208798 ?auto_208801 ) ) ( not ( = ?auto_208798 ?auto_208802 ) ) ( not ( = ?auto_208798 ?auto_208803 ) ) ( not ( = ?auto_208798 ?auto_208804 ) ) ( not ( = ?auto_208798 ?auto_208805 ) ) ( not ( = ?auto_208799 ?auto_208800 ) ) ( not ( = ?auto_208799 ?auto_208801 ) ) ( not ( = ?auto_208799 ?auto_208802 ) ) ( not ( = ?auto_208799 ?auto_208803 ) ) ( not ( = ?auto_208799 ?auto_208804 ) ) ( not ( = ?auto_208799 ?auto_208805 ) ) ( not ( = ?auto_208800 ?auto_208801 ) ) ( not ( = ?auto_208800 ?auto_208802 ) ) ( not ( = ?auto_208800 ?auto_208803 ) ) ( not ( = ?auto_208800 ?auto_208804 ) ) ( not ( = ?auto_208800 ?auto_208805 ) ) ( not ( = ?auto_208801 ?auto_208802 ) ) ( not ( = ?auto_208801 ?auto_208803 ) ) ( not ( = ?auto_208801 ?auto_208804 ) ) ( not ( = ?auto_208801 ?auto_208805 ) ) ( not ( = ?auto_208802 ?auto_208803 ) ) ( not ( = ?auto_208802 ?auto_208804 ) ) ( not ( = ?auto_208802 ?auto_208805 ) ) ( not ( = ?auto_208803 ?auto_208804 ) ) ( not ( = ?auto_208803 ?auto_208805 ) ) ( not ( = ?auto_208804 ?auto_208805 ) ) ( ON-TABLE ?auto_208805 ) ( ON ?auto_208804 ?auto_208805 ) ( ON ?auto_208803 ?auto_208804 ) ( ON ?auto_208798 ?auto_208806 ) ( not ( = ?auto_208798 ?auto_208806 ) ) ( not ( = ?auto_208799 ?auto_208806 ) ) ( not ( = ?auto_208800 ?auto_208806 ) ) ( not ( = ?auto_208801 ?auto_208806 ) ) ( not ( = ?auto_208802 ?auto_208806 ) ) ( not ( = ?auto_208803 ?auto_208806 ) ) ( not ( = ?auto_208804 ?auto_208806 ) ) ( not ( = ?auto_208805 ?auto_208806 ) ) ( ON ?auto_208799 ?auto_208798 ) ( ON-TABLE ?auto_208806 ) ( ON ?auto_208800 ?auto_208799 ) ( ON ?auto_208801 ?auto_208800 ) ( CLEAR ?auto_208801 ) ( HOLDING ?auto_208802 ) ( CLEAR ?auto_208803 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_208805 ?auto_208804 ?auto_208803 ?auto_208802 )
      ( MAKE-8PILE ?auto_208798 ?auto_208799 ?auto_208800 ?auto_208801 ?auto_208802 ?auto_208803 ?auto_208804 ?auto_208805 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_208807 - BLOCK
      ?auto_208808 - BLOCK
      ?auto_208809 - BLOCK
      ?auto_208810 - BLOCK
      ?auto_208811 - BLOCK
      ?auto_208812 - BLOCK
      ?auto_208813 - BLOCK
      ?auto_208814 - BLOCK
    )
    :vars
    (
      ?auto_208815 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_208807 ?auto_208808 ) ) ( not ( = ?auto_208807 ?auto_208809 ) ) ( not ( = ?auto_208807 ?auto_208810 ) ) ( not ( = ?auto_208807 ?auto_208811 ) ) ( not ( = ?auto_208807 ?auto_208812 ) ) ( not ( = ?auto_208807 ?auto_208813 ) ) ( not ( = ?auto_208807 ?auto_208814 ) ) ( not ( = ?auto_208808 ?auto_208809 ) ) ( not ( = ?auto_208808 ?auto_208810 ) ) ( not ( = ?auto_208808 ?auto_208811 ) ) ( not ( = ?auto_208808 ?auto_208812 ) ) ( not ( = ?auto_208808 ?auto_208813 ) ) ( not ( = ?auto_208808 ?auto_208814 ) ) ( not ( = ?auto_208809 ?auto_208810 ) ) ( not ( = ?auto_208809 ?auto_208811 ) ) ( not ( = ?auto_208809 ?auto_208812 ) ) ( not ( = ?auto_208809 ?auto_208813 ) ) ( not ( = ?auto_208809 ?auto_208814 ) ) ( not ( = ?auto_208810 ?auto_208811 ) ) ( not ( = ?auto_208810 ?auto_208812 ) ) ( not ( = ?auto_208810 ?auto_208813 ) ) ( not ( = ?auto_208810 ?auto_208814 ) ) ( not ( = ?auto_208811 ?auto_208812 ) ) ( not ( = ?auto_208811 ?auto_208813 ) ) ( not ( = ?auto_208811 ?auto_208814 ) ) ( not ( = ?auto_208812 ?auto_208813 ) ) ( not ( = ?auto_208812 ?auto_208814 ) ) ( not ( = ?auto_208813 ?auto_208814 ) ) ( ON-TABLE ?auto_208814 ) ( ON ?auto_208813 ?auto_208814 ) ( ON ?auto_208812 ?auto_208813 ) ( ON ?auto_208807 ?auto_208815 ) ( not ( = ?auto_208807 ?auto_208815 ) ) ( not ( = ?auto_208808 ?auto_208815 ) ) ( not ( = ?auto_208809 ?auto_208815 ) ) ( not ( = ?auto_208810 ?auto_208815 ) ) ( not ( = ?auto_208811 ?auto_208815 ) ) ( not ( = ?auto_208812 ?auto_208815 ) ) ( not ( = ?auto_208813 ?auto_208815 ) ) ( not ( = ?auto_208814 ?auto_208815 ) ) ( ON ?auto_208808 ?auto_208807 ) ( ON-TABLE ?auto_208815 ) ( ON ?auto_208809 ?auto_208808 ) ( ON ?auto_208810 ?auto_208809 ) ( CLEAR ?auto_208812 ) ( ON ?auto_208811 ?auto_208810 ) ( CLEAR ?auto_208811 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_208815 ?auto_208807 ?auto_208808 ?auto_208809 ?auto_208810 )
      ( MAKE-8PILE ?auto_208807 ?auto_208808 ?auto_208809 ?auto_208810 ?auto_208811 ?auto_208812 ?auto_208813 ?auto_208814 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_208816 - BLOCK
      ?auto_208817 - BLOCK
      ?auto_208818 - BLOCK
      ?auto_208819 - BLOCK
      ?auto_208820 - BLOCK
      ?auto_208821 - BLOCK
      ?auto_208822 - BLOCK
      ?auto_208823 - BLOCK
    )
    :vars
    (
      ?auto_208824 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_208816 ?auto_208817 ) ) ( not ( = ?auto_208816 ?auto_208818 ) ) ( not ( = ?auto_208816 ?auto_208819 ) ) ( not ( = ?auto_208816 ?auto_208820 ) ) ( not ( = ?auto_208816 ?auto_208821 ) ) ( not ( = ?auto_208816 ?auto_208822 ) ) ( not ( = ?auto_208816 ?auto_208823 ) ) ( not ( = ?auto_208817 ?auto_208818 ) ) ( not ( = ?auto_208817 ?auto_208819 ) ) ( not ( = ?auto_208817 ?auto_208820 ) ) ( not ( = ?auto_208817 ?auto_208821 ) ) ( not ( = ?auto_208817 ?auto_208822 ) ) ( not ( = ?auto_208817 ?auto_208823 ) ) ( not ( = ?auto_208818 ?auto_208819 ) ) ( not ( = ?auto_208818 ?auto_208820 ) ) ( not ( = ?auto_208818 ?auto_208821 ) ) ( not ( = ?auto_208818 ?auto_208822 ) ) ( not ( = ?auto_208818 ?auto_208823 ) ) ( not ( = ?auto_208819 ?auto_208820 ) ) ( not ( = ?auto_208819 ?auto_208821 ) ) ( not ( = ?auto_208819 ?auto_208822 ) ) ( not ( = ?auto_208819 ?auto_208823 ) ) ( not ( = ?auto_208820 ?auto_208821 ) ) ( not ( = ?auto_208820 ?auto_208822 ) ) ( not ( = ?auto_208820 ?auto_208823 ) ) ( not ( = ?auto_208821 ?auto_208822 ) ) ( not ( = ?auto_208821 ?auto_208823 ) ) ( not ( = ?auto_208822 ?auto_208823 ) ) ( ON-TABLE ?auto_208823 ) ( ON ?auto_208822 ?auto_208823 ) ( ON ?auto_208816 ?auto_208824 ) ( not ( = ?auto_208816 ?auto_208824 ) ) ( not ( = ?auto_208817 ?auto_208824 ) ) ( not ( = ?auto_208818 ?auto_208824 ) ) ( not ( = ?auto_208819 ?auto_208824 ) ) ( not ( = ?auto_208820 ?auto_208824 ) ) ( not ( = ?auto_208821 ?auto_208824 ) ) ( not ( = ?auto_208822 ?auto_208824 ) ) ( not ( = ?auto_208823 ?auto_208824 ) ) ( ON ?auto_208817 ?auto_208816 ) ( ON-TABLE ?auto_208824 ) ( ON ?auto_208818 ?auto_208817 ) ( ON ?auto_208819 ?auto_208818 ) ( ON ?auto_208820 ?auto_208819 ) ( CLEAR ?auto_208820 ) ( HOLDING ?auto_208821 ) ( CLEAR ?auto_208822 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_208823 ?auto_208822 ?auto_208821 )
      ( MAKE-8PILE ?auto_208816 ?auto_208817 ?auto_208818 ?auto_208819 ?auto_208820 ?auto_208821 ?auto_208822 ?auto_208823 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_208825 - BLOCK
      ?auto_208826 - BLOCK
      ?auto_208827 - BLOCK
      ?auto_208828 - BLOCK
      ?auto_208829 - BLOCK
      ?auto_208830 - BLOCK
      ?auto_208831 - BLOCK
      ?auto_208832 - BLOCK
    )
    :vars
    (
      ?auto_208833 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_208825 ?auto_208826 ) ) ( not ( = ?auto_208825 ?auto_208827 ) ) ( not ( = ?auto_208825 ?auto_208828 ) ) ( not ( = ?auto_208825 ?auto_208829 ) ) ( not ( = ?auto_208825 ?auto_208830 ) ) ( not ( = ?auto_208825 ?auto_208831 ) ) ( not ( = ?auto_208825 ?auto_208832 ) ) ( not ( = ?auto_208826 ?auto_208827 ) ) ( not ( = ?auto_208826 ?auto_208828 ) ) ( not ( = ?auto_208826 ?auto_208829 ) ) ( not ( = ?auto_208826 ?auto_208830 ) ) ( not ( = ?auto_208826 ?auto_208831 ) ) ( not ( = ?auto_208826 ?auto_208832 ) ) ( not ( = ?auto_208827 ?auto_208828 ) ) ( not ( = ?auto_208827 ?auto_208829 ) ) ( not ( = ?auto_208827 ?auto_208830 ) ) ( not ( = ?auto_208827 ?auto_208831 ) ) ( not ( = ?auto_208827 ?auto_208832 ) ) ( not ( = ?auto_208828 ?auto_208829 ) ) ( not ( = ?auto_208828 ?auto_208830 ) ) ( not ( = ?auto_208828 ?auto_208831 ) ) ( not ( = ?auto_208828 ?auto_208832 ) ) ( not ( = ?auto_208829 ?auto_208830 ) ) ( not ( = ?auto_208829 ?auto_208831 ) ) ( not ( = ?auto_208829 ?auto_208832 ) ) ( not ( = ?auto_208830 ?auto_208831 ) ) ( not ( = ?auto_208830 ?auto_208832 ) ) ( not ( = ?auto_208831 ?auto_208832 ) ) ( ON-TABLE ?auto_208832 ) ( ON ?auto_208831 ?auto_208832 ) ( ON ?auto_208825 ?auto_208833 ) ( not ( = ?auto_208825 ?auto_208833 ) ) ( not ( = ?auto_208826 ?auto_208833 ) ) ( not ( = ?auto_208827 ?auto_208833 ) ) ( not ( = ?auto_208828 ?auto_208833 ) ) ( not ( = ?auto_208829 ?auto_208833 ) ) ( not ( = ?auto_208830 ?auto_208833 ) ) ( not ( = ?auto_208831 ?auto_208833 ) ) ( not ( = ?auto_208832 ?auto_208833 ) ) ( ON ?auto_208826 ?auto_208825 ) ( ON-TABLE ?auto_208833 ) ( ON ?auto_208827 ?auto_208826 ) ( ON ?auto_208828 ?auto_208827 ) ( ON ?auto_208829 ?auto_208828 ) ( CLEAR ?auto_208831 ) ( ON ?auto_208830 ?auto_208829 ) ( CLEAR ?auto_208830 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_208833 ?auto_208825 ?auto_208826 ?auto_208827 ?auto_208828 ?auto_208829 )
      ( MAKE-8PILE ?auto_208825 ?auto_208826 ?auto_208827 ?auto_208828 ?auto_208829 ?auto_208830 ?auto_208831 ?auto_208832 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_208834 - BLOCK
      ?auto_208835 - BLOCK
      ?auto_208836 - BLOCK
      ?auto_208837 - BLOCK
      ?auto_208838 - BLOCK
      ?auto_208839 - BLOCK
      ?auto_208840 - BLOCK
      ?auto_208841 - BLOCK
    )
    :vars
    (
      ?auto_208842 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_208834 ?auto_208835 ) ) ( not ( = ?auto_208834 ?auto_208836 ) ) ( not ( = ?auto_208834 ?auto_208837 ) ) ( not ( = ?auto_208834 ?auto_208838 ) ) ( not ( = ?auto_208834 ?auto_208839 ) ) ( not ( = ?auto_208834 ?auto_208840 ) ) ( not ( = ?auto_208834 ?auto_208841 ) ) ( not ( = ?auto_208835 ?auto_208836 ) ) ( not ( = ?auto_208835 ?auto_208837 ) ) ( not ( = ?auto_208835 ?auto_208838 ) ) ( not ( = ?auto_208835 ?auto_208839 ) ) ( not ( = ?auto_208835 ?auto_208840 ) ) ( not ( = ?auto_208835 ?auto_208841 ) ) ( not ( = ?auto_208836 ?auto_208837 ) ) ( not ( = ?auto_208836 ?auto_208838 ) ) ( not ( = ?auto_208836 ?auto_208839 ) ) ( not ( = ?auto_208836 ?auto_208840 ) ) ( not ( = ?auto_208836 ?auto_208841 ) ) ( not ( = ?auto_208837 ?auto_208838 ) ) ( not ( = ?auto_208837 ?auto_208839 ) ) ( not ( = ?auto_208837 ?auto_208840 ) ) ( not ( = ?auto_208837 ?auto_208841 ) ) ( not ( = ?auto_208838 ?auto_208839 ) ) ( not ( = ?auto_208838 ?auto_208840 ) ) ( not ( = ?auto_208838 ?auto_208841 ) ) ( not ( = ?auto_208839 ?auto_208840 ) ) ( not ( = ?auto_208839 ?auto_208841 ) ) ( not ( = ?auto_208840 ?auto_208841 ) ) ( ON-TABLE ?auto_208841 ) ( ON ?auto_208834 ?auto_208842 ) ( not ( = ?auto_208834 ?auto_208842 ) ) ( not ( = ?auto_208835 ?auto_208842 ) ) ( not ( = ?auto_208836 ?auto_208842 ) ) ( not ( = ?auto_208837 ?auto_208842 ) ) ( not ( = ?auto_208838 ?auto_208842 ) ) ( not ( = ?auto_208839 ?auto_208842 ) ) ( not ( = ?auto_208840 ?auto_208842 ) ) ( not ( = ?auto_208841 ?auto_208842 ) ) ( ON ?auto_208835 ?auto_208834 ) ( ON-TABLE ?auto_208842 ) ( ON ?auto_208836 ?auto_208835 ) ( ON ?auto_208837 ?auto_208836 ) ( ON ?auto_208838 ?auto_208837 ) ( ON ?auto_208839 ?auto_208838 ) ( CLEAR ?auto_208839 ) ( HOLDING ?auto_208840 ) ( CLEAR ?auto_208841 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_208841 ?auto_208840 )
      ( MAKE-8PILE ?auto_208834 ?auto_208835 ?auto_208836 ?auto_208837 ?auto_208838 ?auto_208839 ?auto_208840 ?auto_208841 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_208843 - BLOCK
      ?auto_208844 - BLOCK
      ?auto_208845 - BLOCK
      ?auto_208846 - BLOCK
      ?auto_208847 - BLOCK
      ?auto_208848 - BLOCK
      ?auto_208849 - BLOCK
      ?auto_208850 - BLOCK
    )
    :vars
    (
      ?auto_208851 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_208843 ?auto_208844 ) ) ( not ( = ?auto_208843 ?auto_208845 ) ) ( not ( = ?auto_208843 ?auto_208846 ) ) ( not ( = ?auto_208843 ?auto_208847 ) ) ( not ( = ?auto_208843 ?auto_208848 ) ) ( not ( = ?auto_208843 ?auto_208849 ) ) ( not ( = ?auto_208843 ?auto_208850 ) ) ( not ( = ?auto_208844 ?auto_208845 ) ) ( not ( = ?auto_208844 ?auto_208846 ) ) ( not ( = ?auto_208844 ?auto_208847 ) ) ( not ( = ?auto_208844 ?auto_208848 ) ) ( not ( = ?auto_208844 ?auto_208849 ) ) ( not ( = ?auto_208844 ?auto_208850 ) ) ( not ( = ?auto_208845 ?auto_208846 ) ) ( not ( = ?auto_208845 ?auto_208847 ) ) ( not ( = ?auto_208845 ?auto_208848 ) ) ( not ( = ?auto_208845 ?auto_208849 ) ) ( not ( = ?auto_208845 ?auto_208850 ) ) ( not ( = ?auto_208846 ?auto_208847 ) ) ( not ( = ?auto_208846 ?auto_208848 ) ) ( not ( = ?auto_208846 ?auto_208849 ) ) ( not ( = ?auto_208846 ?auto_208850 ) ) ( not ( = ?auto_208847 ?auto_208848 ) ) ( not ( = ?auto_208847 ?auto_208849 ) ) ( not ( = ?auto_208847 ?auto_208850 ) ) ( not ( = ?auto_208848 ?auto_208849 ) ) ( not ( = ?auto_208848 ?auto_208850 ) ) ( not ( = ?auto_208849 ?auto_208850 ) ) ( ON-TABLE ?auto_208850 ) ( ON ?auto_208843 ?auto_208851 ) ( not ( = ?auto_208843 ?auto_208851 ) ) ( not ( = ?auto_208844 ?auto_208851 ) ) ( not ( = ?auto_208845 ?auto_208851 ) ) ( not ( = ?auto_208846 ?auto_208851 ) ) ( not ( = ?auto_208847 ?auto_208851 ) ) ( not ( = ?auto_208848 ?auto_208851 ) ) ( not ( = ?auto_208849 ?auto_208851 ) ) ( not ( = ?auto_208850 ?auto_208851 ) ) ( ON ?auto_208844 ?auto_208843 ) ( ON-TABLE ?auto_208851 ) ( ON ?auto_208845 ?auto_208844 ) ( ON ?auto_208846 ?auto_208845 ) ( ON ?auto_208847 ?auto_208846 ) ( ON ?auto_208848 ?auto_208847 ) ( CLEAR ?auto_208850 ) ( ON ?auto_208849 ?auto_208848 ) ( CLEAR ?auto_208849 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_208851 ?auto_208843 ?auto_208844 ?auto_208845 ?auto_208846 ?auto_208847 ?auto_208848 )
      ( MAKE-8PILE ?auto_208843 ?auto_208844 ?auto_208845 ?auto_208846 ?auto_208847 ?auto_208848 ?auto_208849 ?auto_208850 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_208852 - BLOCK
      ?auto_208853 - BLOCK
      ?auto_208854 - BLOCK
      ?auto_208855 - BLOCK
      ?auto_208856 - BLOCK
      ?auto_208857 - BLOCK
      ?auto_208858 - BLOCK
      ?auto_208859 - BLOCK
    )
    :vars
    (
      ?auto_208860 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_208852 ?auto_208853 ) ) ( not ( = ?auto_208852 ?auto_208854 ) ) ( not ( = ?auto_208852 ?auto_208855 ) ) ( not ( = ?auto_208852 ?auto_208856 ) ) ( not ( = ?auto_208852 ?auto_208857 ) ) ( not ( = ?auto_208852 ?auto_208858 ) ) ( not ( = ?auto_208852 ?auto_208859 ) ) ( not ( = ?auto_208853 ?auto_208854 ) ) ( not ( = ?auto_208853 ?auto_208855 ) ) ( not ( = ?auto_208853 ?auto_208856 ) ) ( not ( = ?auto_208853 ?auto_208857 ) ) ( not ( = ?auto_208853 ?auto_208858 ) ) ( not ( = ?auto_208853 ?auto_208859 ) ) ( not ( = ?auto_208854 ?auto_208855 ) ) ( not ( = ?auto_208854 ?auto_208856 ) ) ( not ( = ?auto_208854 ?auto_208857 ) ) ( not ( = ?auto_208854 ?auto_208858 ) ) ( not ( = ?auto_208854 ?auto_208859 ) ) ( not ( = ?auto_208855 ?auto_208856 ) ) ( not ( = ?auto_208855 ?auto_208857 ) ) ( not ( = ?auto_208855 ?auto_208858 ) ) ( not ( = ?auto_208855 ?auto_208859 ) ) ( not ( = ?auto_208856 ?auto_208857 ) ) ( not ( = ?auto_208856 ?auto_208858 ) ) ( not ( = ?auto_208856 ?auto_208859 ) ) ( not ( = ?auto_208857 ?auto_208858 ) ) ( not ( = ?auto_208857 ?auto_208859 ) ) ( not ( = ?auto_208858 ?auto_208859 ) ) ( ON ?auto_208852 ?auto_208860 ) ( not ( = ?auto_208852 ?auto_208860 ) ) ( not ( = ?auto_208853 ?auto_208860 ) ) ( not ( = ?auto_208854 ?auto_208860 ) ) ( not ( = ?auto_208855 ?auto_208860 ) ) ( not ( = ?auto_208856 ?auto_208860 ) ) ( not ( = ?auto_208857 ?auto_208860 ) ) ( not ( = ?auto_208858 ?auto_208860 ) ) ( not ( = ?auto_208859 ?auto_208860 ) ) ( ON ?auto_208853 ?auto_208852 ) ( ON-TABLE ?auto_208860 ) ( ON ?auto_208854 ?auto_208853 ) ( ON ?auto_208855 ?auto_208854 ) ( ON ?auto_208856 ?auto_208855 ) ( ON ?auto_208857 ?auto_208856 ) ( ON ?auto_208858 ?auto_208857 ) ( CLEAR ?auto_208858 ) ( HOLDING ?auto_208859 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_208859 )
      ( MAKE-8PILE ?auto_208852 ?auto_208853 ?auto_208854 ?auto_208855 ?auto_208856 ?auto_208857 ?auto_208858 ?auto_208859 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_208861 - BLOCK
      ?auto_208862 - BLOCK
      ?auto_208863 - BLOCK
      ?auto_208864 - BLOCK
      ?auto_208865 - BLOCK
      ?auto_208866 - BLOCK
      ?auto_208867 - BLOCK
      ?auto_208868 - BLOCK
    )
    :vars
    (
      ?auto_208869 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_208861 ?auto_208862 ) ) ( not ( = ?auto_208861 ?auto_208863 ) ) ( not ( = ?auto_208861 ?auto_208864 ) ) ( not ( = ?auto_208861 ?auto_208865 ) ) ( not ( = ?auto_208861 ?auto_208866 ) ) ( not ( = ?auto_208861 ?auto_208867 ) ) ( not ( = ?auto_208861 ?auto_208868 ) ) ( not ( = ?auto_208862 ?auto_208863 ) ) ( not ( = ?auto_208862 ?auto_208864 ) ) ( not ( = ?auto_208862 ?auto_208865 ) ) ( not ( = ?auto_208862 ?auto_208866 ) ) ( not ( = ?auto_208862 ?auto_208867 ) ) ( not ( = ?auto_208862 ?auto_208868 ) ) ( not ( = ?auto_208863 ?auto_208864 ) ) ( not ( = ?auto_208863 ?auto_208865 ) ) ( not ( = ?auto_208863 ?auto_208866 ) ) ( not ( = ?auto_208863 ?auto_208867 ) ) ( not ( = ?auto_208863 ?auto_208868 ) ) ( not ( = ?auto_208864 ?auto_208865 ) ) ( not ( = ?auto_208864 ?auto_208866 ) ) ( not ( = ?auto_208864 ?auto_208867 ) ) ( not ( = ?auto_208864 ?auto_208868 ) ) ( not ( = ?auto_208865 ?auto_208866 ) ) ( not ( = ?auto_208865 ?auto_208867 ) ) ( not ( = ?auto_208865 ?auto_208868 ) ) ( not ( = ?auto_208866 ?auto_208867 ) ) ( not ( = ?auto_208866 ?auto_208868 ) ) ( not ( = ?auto_208867 ?auto_208868 ) ) ( ON ?auto_208861 ?auto_208869 ) ( not ( = ?auto_208861 ?auto_208869 ) ) ( not ( = ?auto_208862 ?auto_208869 ) ) ( not ( = ?auto_208863 ?auto_208869 ) ) ( not ( = ?auto_208864 ?auto_208869 ) ) ( not ( = ?auto_208865 ?auto_208869 ) ) ( not ( = ?auto_208866 ?auto_208869 ) ) ( not ( = ?auto_208867 ?auto_208869 ) ) ( not ( = ?auto_208868 ?auto_208869 ) ) ( ON ?auto_208862 ?auto_208861 ) ( ON-TABLE ?auto_208869 ) ( ON ?auto_208863 ?auto_208862 ) ( ON ?auto_208864 ?auto_208863 ) ( ON ?auto_208865 ?auto_208864 ) ( ON ?auto_208866 ?auto_208865 ) ( ON ?auto_208867 ?auto_208866 ) ( ON ?auto_208868 ?auto_208867 ) ( CLEAR ?auto_208868 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_208869 ?auto_208861 ?auto_208862 ?auto_208863 ?auto_208864 ?auto_208865 ?auto_208866 ?auto_208867 )
      ( MAKE-8PILE ?auto_208861 ?auto_208862 ?auto_208863 ?auto_208864 ?auto_208865 ?auto_208866 ?auto_208867 ?auto_208868 ) )
  )

)

