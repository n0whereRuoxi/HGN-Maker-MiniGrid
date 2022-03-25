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

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_17639 - BLOCK
      ?auto_17640 - BLOCK
      ?auto_17641 - BLOCK
      ?auto_17642 - BLOCK
      ?auto_17643 - BLOCK
    )
    :vars
    (
      ?auto_17644 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17644 ?auto_17643 ) ( CLEAR ?auto_17644 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17639 ) ( ON ?auto_17640 ?auto_17639 ) ( ON ?auto_17641 ?auto_17640 ) ( ON ?auto_17642 ?auto_17641 ) ( ON ?auto_17643 ?auto_17642 ) ( not ( = ?auto_17639 ?auto_17640 ) ) ( not ( = ?auto_17639 ?auto_17641 ) ) ( not ( = ?auto_17639 ?auto_17642 ) ) ( not ( = ?auto_17639 ?auto_17643 ) ) ( not ( = ?auto_17639 ?auto_17644 ) ) ( not ( = ?auto_17640 ?auto_17641 ) ) ( not ( = ?auto_17640 ?auto_17642 ) ) ( not ( = ?auto_17640 ?auto_17643 ) ) ( not ( = ?auto_17640 ?auto_17644 ) ) ( not ( = ?auto_17641 ?auto_17642 ) ) ( not ( = ?auto_17641 ?auto_17643 ) ) ( not ( = ?auto_17641 ?auto_17644 ) ) ( not ( = ?auto_17642 ?auto_17643 ) ) ( not ( = ?auto_17642 ?auto_17644 ) ) ( not ( = ?auto_17643 ?auto_17644 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17644 ?auto_17643 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17646 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_17646 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_17646 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17647 - BLOCK
    )
    :vars
    (
      ?auto_17648 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17647 ?auto_17648 ) ( CLEAR ?auto_17647 ) ( HAND-EMPTY ) ( not ( = ?auto_17647 ?auto_17648 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17647 ?auto_17648 )
      ( MAKE-1PILE ?auto_17647 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17653 - BLOCK
      ?auto_17654 - BLOCK
      ?auto_17655 - BLOCK
      ?auto_17656 - BLOCK
    )
    :vars
    (
      ?auto_17657 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17657 ?auto_17656 ) ( CLEAR ?auto_17657 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17653 ) ( ON ?auto_17654 ?auto_17653 ) ( ON ?auto_17655 ?auto_17654 ) ( ON ?auto_17656 ?auto_17655 ) ( not ( = ?auto_17653 ?auto_17654 ) ) ( not ( = ?auto_17653 ?auto_17655 ) ) ( not ( = ?auto_17653 ?auto_17656 ) ) ( not ( = ?auto_17653 ?auto_17657 ) ) ( not ( = ?auto_17654 ?auto_17655 ) ) ( not ( = ?auto_17654 ?auto_17656 ) ) ( not ( = ?auto_17654 ?auto_17657 ) ) ( not ( = ?auto_17655 ?auto_17656 ) ) ( not ( = ?auto_17655 ?auto_17657 ) ) ( not ( = ?auto_17656 ?auto_17657 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17657 ?auto_17656 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17658 - BLOCK
      ?auto_17659 - BLOCK
      ?auto_17660 - BLOCK
      ?auto_17661 - BLOCK
    )
    :vars
    (
      ?auto_17662 - BLOCK
      ?auto_17663 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17662 ?auto_17661 ) ( CLEAR ?auto_17662 ) ( ON-TABLE ?auto_17658 ) ( ON ?auto_17659 ?auto_17658 ) ( ON ?auto_17660 ?auto_17659 ) ( ON ?auto_17661 ?auto_17660 ) ( not ( = ?auto_17658 ?auto_17659 ) ) ( not ( = ?auto_17658 ?auto_17660 ) ) ( not ( = ?auto_17658 ?auto_17661 ) ) ( not ( = ?auto_17658 ?auto_17662 ) ) ( not ( = ?auto_17659 ?auto_17660 ) ) ( not ( = ?auto_17659 ?auto_17661 ) ) ( not ( = ?auto_17659 ?auto_17662 ) ) ( not ( = ?auto_17660 ?auto_17661 ) ) ( not ( = ?auto_17660 ?auto_17662 ) ) ( not ( = ?auto_17661 ?auto_17662 ) ) ( HOLDING ?auto_17663 ) ( not ( = ?auto_17658 ?auto_17663 ) ) ( not ( = ?auto_17659 ?auto_17663 ) ) ( not ( = ?auto_17660 ?auto_17663 ) ) ( not ( = ?auto_17661 ?auto_17663 ) ) ( not ( = ?auto_17662 ?auto_17663 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_17663 )
      ( MAKE-4PILE ?auto_17658 ?auto_17659 ?auto_17660 ?auto_17661 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17664 - BLOCK
      ?auto_17665 - BLOCK
      ?auto_17666 - BLOCK
      ?auto_17667 - BLOCK
    )
    :vars
    (
      ?auto_17669 - BLOCK
      ?auto_17668 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17669 ?auto_17667 ) ( ON-TABLE ?auto_17664 ) ( ON ?auto_17665 ?auto_17664 ) ( ON ?auto_17666 ?auto_17665 ) ( ON ?auto_17667 ?auto_17666 ) ( not ( = ?auto_17664 ?auto_17665 ) ) ( not ( = ?auto_17664 ?auto_17666 ) ) ( not ( = ?auto_17664 ?auto_17667 ) ) ( not ( = ?auto_17664 ?auto_17669 ) ) ( not ( = ?auto_17665 ?auto_17666 ) ) ( not ( = ?auto_17665 ?auto_17667 ) ) ( not ( = ?auto_17665 ?auto_17669 ) ) ( not ( = ?auto_17666 ?auto_17667 ) ) ( not ( = ?auto_17666 ?auto_17669 ) ) ( not ( = ?auto_17667 ?auto_17669 ) ) ( not ( = ?auto_17664 ?auto_17668 ) ) ( not ( = ?auto_17665 ?auto_17668 ) ) ( not ( = ?auto_17666 ?auto_17668 ) ) ( not ( = ?auto_17667 ?auto_17668 ) ) ( not ( = ?auto_17669 ?auto_17668 ) ) ( ON ?auto_17668 ?auto_17669 ) ( CLEAR ?auto_17668 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_17664 ?auto_17665 ?auto_17666 ?auto_17667 ?auto_17669 )
      ( MAKE-4PILE ?auto_17664 ?auto_17665 ?auto_17666 ?auto_17667 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17672 - BLOCK
      ?auto_17673 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_17673 ) ( CLEAR ?auto_17672 ) ( ON-TABLE ?auto_17672 ) ( not ( = ?auto_17672 ?auto_17673 ) ) )
    :subtasks
    ( ( !STACK ?auto_17673 ?auto_17672 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17674 - BLOCK
      ?auto_17675 - BLOCK
    )
    :vars
    (
      ?auto_17676 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_17674 ) ( ON-TABLE ?auto_17674 ) ( not ( = ?auto_17674 ?auto_17675 ) ) ( ON ?auto_17675 ?auto_17676 ) ( CLEAR ?auto_17675 ) ( HAND-EMPTY ) ( not ( = ?auto_17674 ?auto_17676 ) ) ( not ( = ?auto_17675 ?auto_17676 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17675 ?auto_17676 )
      ( MAKE-2PILE ?auto_17674 ?auto_17675 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17677 - BLOCK
      ?auto_17678 - BLOCK
    )
    :vars
    (
      ?auto_17679 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17677 ?auto_17678 ) ) ( ON ?auto_17678 ?auto_17679 ) ( CLEAR ?auto_17678 ) ( not ( = ?auto_17677 ?auto_17679 ) ) ( not ( = ?auto_17678 ?auto_17679 ) ) ( HOLDING ?auto_17677 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_17677 )
      ( MAKE-2PILE ?auto_17677 ?auto_17678 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17680 - BLOCK
      ?auto_17681 - BLOCK
    )
    :vars
    (
      ?auto_17682 - BLOCK
      ?auto_17685 - BLOCK
      ?auto_17684 - BLOCK
      ?auto_17683 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17680 ?auto_17681 ) ) ( ON ?auto_17681 ?auto_17682 ) ( not ( = ?auto_17680 ?auto_17682 ) ) ( not ( = ?auto_17681 ?auto_17682 ) ) ( ON ?auto_17680 ?auto_17681 ) ( CLEAR ?auto_17680 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17685 ) ( ON ?auto_17684 ?auto_17685 ) ( ON ?auto_17683 ?auto_17684 ) ( ON ?auto_17682 ?auto_17683 ) ( not ( = ?auto_17685 ?auto_17684 ) ) ( not ( = ?auto_17685 ?auto_17683 ) ) ( not ( = ?auto_17685 ?auto_17682 ) ) ( not ( = ?auto_17685 ?auto_17681 ) ) ( not ( = ?auto_17685 ?auto_17680 ) ) ( not ( = ?auto_17684 ?auto_17683 ) ) ( not ( = ?auto_17684 ?auto_17682 ) ) ( not ( = ?auto_17684 ?auto_17681 ) ) ( not ( = ?auto_17684 ?auto_17680 ) ) ( not ( = ?auto_17683 ?auto_17682 ) ) ( not ( = ?auto_17683 ?auto_17681 ) ) ( not ( = ?auto_17683 ?auto_17680 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_17685 ?auto_17684 ?auto_17683 ?auto_17682 ?auto_17681 )
      ( MAKE-2PILE ?auto_17680 ?auto_17681 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17689 - BLOCK
      ?auto_17690 - BLOCK
      ?auto_17691 - BLOCK
    )
    :vars
    (
      ?auto_17692 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17692 ?auto_17691 ) ( CLEAR ?auto_17692 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17689 ) ( ON ?auto_17690 ?auto_17689 ) ( ON ?auto_17691 ?auto_17690 ) ( not ( = ?auto_17689 ?auto_17690 ) ) ( not ( = ?auto_17689 ?auto_17691 ) ) ( not ( = ?auto_17689 ?auto_17692 ) ) ( not ( = ?auto_17690 ?auto_17691 ) ) ( not ( = ?auto_17690 ?auto_17692 ) ) ( not ( = ?auto_17691 ?auto_17692 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17692 ?auto_17691 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17693 - BLOCK
      ?auto_17694 - BLOCK
      ?auto_17695 - BLOCK
    )
    :vars
    (
      ?auto_17696 - BLOCK
      ?auto_17697 - BLOCK
      ?auto_17698 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17696 ?auto_17695 ) ( CLEAR ?auto_17696 ) ( ON-TABLE ?auto_17693 ) ( ON ?auto_17694 ?auto_17693 ) ( ON ?auto_17695 ?auto_17694 ) ( not ( = ?auto_17693 ?auto_17694 ) ) ( not ( = ?auto_17693 ?auto_17695 ) ) ( not ( = ?auto_17693 ?auto_17696 ) ) ( not ( = ?auto_17694 ?auto_17695 ) ) ( not ( = ?auto_17694 ?auto_17696 ) ) ( not ( = ?auto_17695 ?auto_17696 ) ) ( HOLDING ?auto_17697 ) ( CLEAR ?auto_17698 ) ( not ( = ?auto_17693 ?auto_17697 ) ) ( not ( = ?auto_17693 ?auto_17698 ) ) ( not ( = ?auto_17694 ?auto_17697 ) ) ( not ( = ?auto_17694 ?auto_17698 ) ) ( not ( = ?auto_17695 ?auto_17697 ) ) ( not ( = ?auto_17695 ?auto_17698 ) ) ( not ( = ?auto_17696 ?auto_17697 ) ) ( not ( = ?auto_17696 ?auto_17698 ) ) ( not ( = ?auto_17697 ?auto_17698 ) ) )
    :subtasks
    ( ( !STACK ?auto_17697 ?auto_17698 )
      ( MAKE-3PILE ?auto_17693 ?auto_17694 ?auto_17695 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_18061 - BLOCK
      ?auto_18062 - BLOCK
      ?auto_18063 - BLOCK
    )
    :vars
    (
      ?auto_18064 - BLOCK
      ?auto_18065 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18064 ?auto_18063 ) ( ON-TABLE ?auto_18061 ) ( ON ?auto_18062 ?auto_18061 ) ( ON ?auto_18063 ?auto_18062 ) ( not ( = ?auto_18061 ?auto_18062 ) ) ( not ( = ?auto_18061 ?auto_18063 ) ) ( not ( = ?auto_18061 ?auto_18064 ) ) ( not ( = ?auto_18062 ?auto_18063 ) ) ( not ( = ?auto_18062 ?auto_18064 ) ) ( not ( = ?auto_18063 ?auto_18064 ) ) ( not ( = ?auto_18061 ?auto_18065 ) ) ( not ( = ?auto_18062 ?auto_18065 ) ) ( not ( = ?auto_18063 ?auto_18065 ) ) ( not ( = ?auto_18064 ?auto_18065 ) ) ( ON ?auto_18065 ?auto_18064 ) ( CLEAR ?auto_18065 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_18061 ?auto_18062 ?auto_18063 ?auto_18064 )
      ( MAKE-3PILE ?auto_18061 ?auto_18062 ?auto_18063 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17705 - BLOCK
      ?auto_17706 - BLOCK
      ?auto_17707 - BLOCK
    )
    :vars
    (
      ?auto_17709 - BLOCK
      ?auto_17710 - BLOCK
      ?auto_17708 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17709 ?auto_17707 ) ( ON-TABLE ?auto_17705 ) ( ON ?auto_17706 ?auto_17705 ) ( ON ?auto_17707 ?auto_17706 ) ( not ( = ?auto_17705 ?auto_17706 ) ) ( not ( = ?auto_17705 ?auto_17707 ) ) ( not ( = ?auto_17705 ?auto_17709 ) ) ( not ( = ?auto_17706 ?auto_17707 ) ) ( not ( = ?auto_17706 ?auto_17709 ) ) ( not ( = ?auto_17707 ?auto_17709 ) ) ( not ( = ?auto_17705 ?auto_17710 ) ) ( not ( = ?auto_17705 ?auto_17708 ) ) ( not ( = ?auto_17706 ?auto_17710 ) ) ( not ( = ?auto_17706 ?auto_17708 ) ) ( not ( = ?auto_17707 ?auto_17710 ) ) ( not ( = ?auto_17707 ?auto_17708 ) ) ( not ( = ?auto_17709 ?auto_17710 ) ) ( not ( = ?auto_17709 ?auto_17708 ) ) ( not ( = ?auto_17710 ?auto_17708 ) ) ( ON ?auto_17710 ?auto_17709 ) ( CLEAR ?auto_17710 ) ( HOLDING ?auto_17708 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_17708 )
      ( MAKE-3PILE ?auto_17705 ?auto_17706 ?auto_17707 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17711 - BLOCK
      ?auto_17712 - BLOCK
      ?auto_17713 - BLOCK
    )
    :vars
    (
      ?auto_17715 - BLOCK
      ?auto_17714 - BLOCK
      ?auto_17716 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17715 ?auto_17713 ) ( ON-TABLE ?auto_17711 ) ( ON ?auto_17712 ?auto_17711 ) ( ON ?auto_17713 ?auto_17712 ) ( not ( = ?auto_17711 ?auto_17712 ) ) ( not ( = ?auto_17711 ?auto_17713 ) ) ( not ( = ?auto_17711 ?auto_17715 ) ) ( not ( = ?auto_17712 ?auto_17713 ) ) ( not ( = ?auto_17712 ?auto_17715 ) ) ( not ( = ?auto_17713 ?auto_17715 ) ) ( not ( = ?auto_17711 ?auto_17714 ) ) ( not ( = ?auto_17711 ?auto_17716 ) ) ( not ( = ?auto_17712 ?auto_17714 ) ) ( not ( = ?auto_17712 ?auto_17716 ) ) ( not ( = ?auto_17713 ?auto_17714 ) ) ( not ( = ?auto_17713 ?auto_17716 ) ) ( not ( = ?auto_17715 ?auto_17714 ) ) ( not ( = ?auto_17715 ?auto_17716 ) ) ( not ( = ?auto_17714 ?auto_17716 ) ) ( ON ?auto_17714 ?auto_17715 ) ( ON ?auto_17716 ?auto_17714 ) ( CLEAR ?auto_17716 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_17711 ?auto_17712 ?auto_17713 ?auto_17715 ?auto_17714 )
      ( MAKE-3PILE ?auto_17711 ?auto_17712 ?auto_17713 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17720 - BLOCK
      ?auto_17721 - BLOCK
      ?auto_17722 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_17722 ) ( CLEAR ?auto_17721 ) ( ON-TABLE ?auto_17720 ) ( ON ?auto_17721 ?auto_17720 ) ( not ( = ?auto_17720 ?auto_17721 ) ) ( not ( = ?auto_17720 ?auto_17722 ) ) ( not ( = ?auto_17721 ?auto_17722 ) ) )
    :subtasks
    ( ( !STACK ?auto_17722 ?auto_17721 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17723 - BLOCK
      ?auto_17724 - BLOCK
      ?auto_17725 - BLOCK
    )
    :vars
    (
      ?auto_17726 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_17724 ) ( ON-TABLE ?auto_17723 ) ( ON ?auto_17724 ?auto_17723 ) ( not ( = ?auto_17723 ?auto_17724 ) ) ( not ( = ?auto_17723 ?auto_17725 ) ) ( not ( = ?auto_17724 ?auto_17725 ) ) ( ON ?auto_17725 ?auto_17726 ) ( CLEAR ?auto_17725 ) ( HAND-EMPTY ) ( not ( = ?auto_17723 ?auto_17726 ) ) ( not ( = ?auto_17724 ?auto_17726 ) ) ( not ( = ?auto_17725 ?auto_17726 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17725 ?auto_17726 )
      ( MAKE-3PILE ?auto_17723 ?auto_17724 ?auto_17725 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17727 - BLOCK
      ?auto_17728 - BLOCK
      ?auto_17729 - BLOCK
    )
    :vars
    (
      ?auto_17730 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_17727 ) ( not ( = ?auto_17727 ?auto_17728 ) ) ( not ( = ?auto_17727 ?auto_17729 ) ) ( not ( = ?auto_17728 ?auto_17729 ) ) ( ON ?auto_17729 ?auto_17730 ) ( CLEAR ?auto_17729 ) ( not ( = ?auto_17727 ?auto_17730 ) ) ( not ( = ?auto_17728 ?auto_17730 ) ) ( not ( = ?auto_17729 ?auto_17730 ) ) ( HOLDING ?auto_17728 ) ( CLEAR ?auto_17727 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17727 ?auto_17728 )
      ( MAKE-3PILE ?auto_17727 ?auto_17728 ?auto_17729 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17731 - BLOCK
      ?auto_17732 - BLOCK
      ?auto_17733 - BLOCK
    )
    :vars
    (
      ?auto_17734 - BLOCK
      ?auto_17736 - BLOCK
      ?auto_17735 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_17731 ) ( not ( = ?auto_17731 ?auto_17732 ) ) ( not ( = ?auto_17731 ?auto_17733 ) ) ( not ( = ?auto_17732 ?auto_17733 ) ) ( ON ?auto_17733 ?auto_17734 ) ( not ( = ?auto_17731 ?auto_17734 ) ) ( not ( = ?auto_17732 ?auto_17734 ) ) ( not ( = ?auto_17733 ?auto_17734 ) ) ( CLEAR ?auto_17731 ) ( ON ?auto_17732 ?auto_17733 ) ( CLEAR ?auto_17732 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17736 ) ( ON ?auto_17735 ?auto_17736 ) ( ON ?auto_17734 ?auto_17735 ) ( not ( = ?auto_17736 ?auto_17735 ) ) ( not ( = ?auto_17736 ?auto_17734 ) ) ( not ( = ?auto_17736 ?auto_17733 ) ) ( not ( = ?auto_17736 ?auto_17732 ) ) ( not ( = ?auto_17735 ?auto_17734 ) ) ( not ( = ?auto_17735 ?auto_17733 ) ) ( not ( = ?auto_17735 ?auto_17732 ) ) ( not ( = ?auto_17731 ?auto_17736 ) ) ( not ( = ?auto_17731 ?auto_17735 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_17736 ?auto_17735 ?auto_17734 ?auto_17733 )
      ( MAKE-3PILE ?auto_17731 ?auto_17732 ?auto_17733 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17737 - BLOCK
      ?auto_17738 - BLOCK
      ?auto_17739 - BLOCK
    )
    :vars
    (
      ?auto_17740 - BLOCK
      ?auto_17742 - BLOCK
      ?auto_17741 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17737 ?auto_17738 ) ) ( not ( = ?auto_17737 ?auto_17739 ) ) ( not ( = ?auto_17738 ?auto_17739 ) ) ( ON ?auto_17739 ?auto_17740 ) ( not ( = ?auto_17737 ?auto_17740 ) ) ( not ( = ?auto_17738 ?auto_17740 ) ) ( not ( = ?auto_17739 ?auto_17740 ) ) ( ON ?auto_17738 ?auto_17739 ) ( CLEAR ?auto_17738 ) ( ON-TABLE ?auto_17742 ) ( ON ?auto_17741 ?auto_17742 ) ( ON ?auto_17740 ?auto_17741 ) ( not ( = ?auto_17742 ?auto_17741 ) ) ( not ( = ?auto_17742 ?auto_17740 ) ) ( not ( = ?auto_17742 ?auto_17739 ) ) ( not ( = ?auto_17742 ?auto_17738 ) ) ( not ( = ?auto_17741 ?auto_17740 ) ) ( not ( = ?auto_17741 ?auto_17739 ) ) ( not ( = ?auto_17741 ?auto_17738 ) ) ( not ( = ?auto_17737 ?auto_17742 ) ) ( not ( = ?auto_17737 ?auto_17741 ) ) ( HOLDING ?auto_17737 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_17737 )
      ( MAKE-3PILE ?auto_17737 ?auto_17738 ?auto_17739 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17743 - BLOCK
      ?auto_17744 - BLOCK
      ?auto_17745 - BLOCK
    )
    :vars
    (
      ?auto_17746 - BLOCK
      ?auto_17747 - BLOCK
      ?auto_17748 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17743 ?auto_17744 ) ) ( not ( = ?auto_17743 ?auto_17745 ) ) ( not ( = ?auto_17744 ?auto_17745 ) ) ( ON ?auto_17745 ?auto_17746 ) ( not ( = ?auto_17743 ?auto_17746 ) ) ( not ( = ?auto_17744 ?auto_17746 ) ) ( not ( = ?auto_17745 ?auto_17746 ) ) ( ON ?auto_17744 ?auto_17745 ) ( ON-TABLE ?auto_17747 ) ( ON ?auto_17748 ?auto_17747 ) ( ON ?auto_17746 ?auto_17748 ) ( not ( = ?auto_17747 ?auto_17748 ) ) ( not ( = ?auto_17747 ?auto_17746 ) ) ( not ( = ?auto_17747 ?auto_17745 ) ) ( not ( = ?auto_17747 ?auto_17744 ) ) ( not ( = ?auto_17748 ?auto_17746 ) ) ( not ( = ?auto_17748 ?auto_17745 ) ) ( not ( = ?auto_17748 ?auto_17744 ) ) ( not ( = ?auto_17743 ?auto_17747 ) ) ( not ( = ?auto_17743 ?auto_17748 ) ) ( ON ?auto_17743 ?auto_17744 ) ( CLEAR ?auto_17743 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_17747 ?auto_17748 ?auto_17746 ?auto_17745 ?auto_17744 )
      ( MAKE-3PILE ?auto_17743 ?auto_17744 ?auto_17745 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17751 - BLOCK
      ?auto_17752 - BLOCK
    )
    :vars
    (
      ?auto_17753 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17753 ?auto_17752 ) ( CLEAR ?auto_17753 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17751 ) ( ON ?auto_17752 ?auto_17751 ) ( not ( = ?auto_17751 ?auto_17752 ) ) ( not ( = ?auto_17751 ?auto_17753 ) ) ( not ( = ?auto_17752 ?auto_17753 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17753 ?auto_17752 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17754 - BLOCK
      ?auto_17755 - BLOCK
    )
    :vars
    (
      ?auto_17756 - BLOCK
      ?auto_17757 - BLOCK
      ?auto_17758 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17756 ?auto_17755 ) ( CLEAR ?auto_17756 ) ( ON-TABLE ?auto_17754 ) ( ON ?auto_17755 ?auto_17754 ) ( not ( = ?auto_17754 ?auto_17755 ) ) ( not ( = ?auto_17754 ?auto_17756 ) ) ( not ( = ?auto_17755 ?auto_17756 ) ) ( HOLDING ?auto_17757 ) ( CLEAR ?auto_17758 ) ( not ( = ?auto_17754 ?auto_17757 ) ) ( not ( = ?auto_17754 ?auto_17758 ) ) ( not ( = ?auto_17755 ?auto_17757 ) ) ( not ( = ?auto_17755 ?auto_17758 ) ) ( not ( = ?auto_17756 ?auto_17757 ) ) ( not ( = ?auto_17756 ?auto_17758 ) ) ( not ( = ?auto_17757 ?auto_17758 ) ) )
    :subtasks
    ( ( !STACK ?auto_17757 ?auto_17758 )
      ( MAKE-2PILE ?auto_17754 ?auto_17755 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17759 - BLOCK
      ?auto_17760 - BLOCK
    )
    :vars
    (
      ?auto_17761 - BLOCK
      ?auto_17763 - BLOCK
      ?auto_17762 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17761 ?auto_17760 ) ( ON-TABLE ?auto_17759 ) ( ON ?auto_17760 ?auto_17759 ) ( not ( = ?auto_17759 ?auto_17760 ) ) ( not ( = ?auto_17759 ?auto_17761 ) ) ( not ( = ?auto_17760 ?auto_17761 ) ) ( CLEAR ?auto_17763 ) ( not ( = ?auto_17759 ?auto_17762 ) ) ( not ( = ?auto_17759 ?auto_17763 ) ) ( not ( = ?auto_17760 ?auto_17762 ) ) ( not ( = ?auto_17760 ?auto_17763 ) ) ( not ( = ?auto_17761 ?auto_17762 ) ) ( not ( = ?auto_17761 ?auto_17763 ) ) ( not ( = ?auto_17762 ?auto_17763 ) ) ( ON ?auto_17762 ?auto_17761 ) ( CLEAR ?auto_17762 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_17759 ?auto_17760 ?auto_17761 )
      ( MAKE-2PILE ?auto_17759 ?auto_17760 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17764 - BLOCK
      ?auto_17765 - BLOCK
    )
    :vars
    (
      ?auto_17768 - BLOCK
      ?auto_17766 - BLOCK
      ?auto_17767 - BLOCK
      ?auto_17769 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17768 ?auto_17765 ) ( ON-TABLE ?auto_17764 ) ( ON ?auto_17765 ?auto_17764 ) ( not ( = ?auto_17764 ?auto_17765 ) ) ( not ( = ?auto_17764 ?auto_17768 ) ) ( not ( = ?auto_17765 ?auto_17768 ) ) ( not ( = ?auto_17764 ?auto_17766 ) ) ( not ( = ?auto_17764 ?auto_17767 ) ) ( not ( = ?auto_17765 ?auto_17766 ) ) ( not ( = ?auto_17765 ?auto_17767 ) ) ( not ( = ?auto_17768 ?auto_17766 ) ) ( not ( = ?auto_17768 ?auto_17767 ) ) ( not ( = ?auto_17766 ?auto_17767 ) ) ( ON ?auto_17766 ?auto_17768 ) ( CLEAR ?auto_17766 ) ( HOLDING ?auto_17767 ) ( CLEAR ?auto_17769 ) ( ON-TABLE ?auto_17769 ) ( not ( = ?auto_17769 ?auto_17767 ) ) ( not ( = ?auto_17764 ?auto_17769 ) ) ( not ( = ?auto_17765 ?auto_17769 ) ) ( not ( = ?auto_17768 ?auto_17769 ) ) ( not ( = ?auto_17766 ?auto_17769 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17769 ?auto_17767 )
      ( MAKE-2PILE ?auto_17764 ?auto_17765 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_18188 - BLOCK
      ?auto_18189 - BLOCK
    )
    :vars
    (
      ?auto_18192 - BLOCK
      ?auto_18191 - BLOCK
      ?auto_18190 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18192 ?auto_18189 ) ( ON-TABLE ?auto_18188 ) ( ON ?auto_18189 ?auto_18188 ) ( not ( = ?auto_18188 ?auto_18189 ) ) ( not ( = ?auto_18188 ?auto_18192 ) ) ( not ( = ?auto_18189 ?auto_18192 ) ) ( not ( = ?auto_18188 ?auto_18191 ) ) ( not ( = ?auto_18188 ?auto_18190 ) ) ( not ( = ?auto_18189 ?auto_18191 ) ) ( not ( = ?auto_18189 ?auto_18190 ) ) ( not ( = ?auto_18192 ?auto_18191 ) ) ( not ( = ?auto_18192 ?auto_18190 ) ) ( not ( = ?auto_18191 ?auto_18190 ) ) ( ON ?auto_18191 ?auto_18192 ) ( ON ?auto_18190 ?auto_18191 ) ( CLEAR ?auto_18190 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_18188 ?auto_18189 ?auto_18192 ?auto_18191 )
      ( MAKE-2PILE ?auto_18188 ?auto_18189 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17776 - BLOCK
      ?auto_17777 - BLOCK
    )
    :vars
    (
      ?auto_17778 - BLOCK
      ?auto_17779 - BLOCK
      ?auto_17781 - BLOCK
      ?auto_17780 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17778 ?auto_17777 ) ( ON-TABLE ?auto_17776 ) ( ON ?auto_17777 ?auto_17776 ) ( not ( = ?auto_17776 ?auto_17777 ) ) ( not ( = ?auto_17776 ?auto_17778 ) ) ( not ( = ?auto_17777 ?auto_17778 ) ) ( not ( = ?auto_17776 ?auto_17779 ) ) ( not ( = ?auto_17776 ?auto_17781 ) ) ( not ( = ?auto_17777 ?auto_17779 ) ) ( not ( = ?auto_17777 ?auto_17781 ) ) ( not ( = ?auto_17778 ?auto_17779 ) ) ( not ( = ?auto_17778 ?auto_17781 ) ) ( not ( = ?auto_17779 ?auto_17781 ) ) ( ON ?auto_17779 ?auto_17778 ) ( not ( = ?auto_17780 ?auto_17781 ) ) ( not ( = ?auto_17776 ?auto_17780 ) ) ( not ( = ?auto_17777 ?auto_17780 ) ) ( not ( = ?auto_17778 ?auto_17780 ) ) ( not ( = ?auto_17779 ?auto_17780 ) ) ( ON ?auto_17781 ?auto_17779 ) ( CLEAR ?auto_17781 ) ( HOLDING ?auto_17780 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_17780 )
      ( MAKE-2PILE ?auto_17776 ?auto_17777 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17782 - BLOCK
      ?auto_17783 - BLOCK
    )
    :vars
    (
      ?auto_17786 - BLOCK
      ?auto_17787 - BLOCK
      ?auto_17784 - BLOCK
      ?auto_17785 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17786 ?auto_17783 ) ( ON-TABLE ?auto_17782 ) ( ON ?auto_17783 ?auto_17782 ) ( not ( = ?auto_17782 ?auto_17783 ) ) ( not ( = ?auto_17782 ?auto_17786 ) ) ( not ( = ?auto_17783 ?auto_17786 ) ) ( not ( = ?auto_17782 ?auto_17787 ) ) ( not ( = ?auto_17782 ?auto_17784 ) ) ( not ( = ?auto_17783 ?auto_17787 ) ) ( not ( = ?auto_17783 ?auto_17784 ) ) ( not ( = ?auto_17786 ?auto_17787 ) ) ( not ( = ?auto_17786 ?auto_17784 ) ) ( not ( = ?auto_17787 ?auto_17784 ) ) ( ON ?auto_17787 ?auto_17786 ) ( not ( = ?auto_17785 ?auto_17784 ) ) ( not ( = ?auto_17782 ?auto_17785 ) ) ( not ( = ?auto_17783 ?auto_17785 ) ) ( not ( = ?auto_17786 ?auto_17785 ) ) ( not ( = ?auto_17787 ?auto_17785 ) ) ( ON ?auto_17784 ?auto_17787 ) ( ON ?auto_17785 ?auto_17784 ) ( CLEAR ?auto_17785 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_17782 ?auto_17783 ?auto_17786 ?auto_17787 ?auto_17784 )
      ( MAKE-2PILE ?auto_17782 ?auto_17783 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17792 - BLOCK
      ?auto_17793 - BLOCK
      ?auto_17794 - BLOCK
      ?auto_17795 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_17795 ) ( CLEAR ?auto_17794 ) ( ON-TABLE ?auto_17792 ) ( ON ?auto_17793 ?auto_17792 ) ( ON ?auto_17794 ?auto_17793 ) ( not ( = ?auto_17792 ?auto_17793 ) ) ( not ( = ?auto_17792 ?auto_17794 ) ) ( not ( = ?auto_17792 ?auto_17795 ) ) ( not ( = ?auto_17793 ?auto_17794 ) ) ( not ( = ?auto_17793 ?auto_17795 ) ) ( not ( = ?auto_17794 ?auto_17795 ) ) )
    :subtasks
    ( ( !STACK ?auto_17795 ?auto_17794 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17796 - BLOCK
      ?auto_17797 - BLOCK
      ?auto_17798 - BLOCK
      ?auto_17799 - BLOCK
    )
    :vars
    (
      ?auto_17800 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_17798 ) ( ON-TABLE ?auto_17796 ) ( ON ?auto_17797 ?auto_17796 ) ( ON ?auto_17798 ?auto_17797 ) ( not ( = ?auto_17796 ?auto_17797 ) ) ( not ( = ?auto_17796 ?auto_17798 ) ) ( not ( = ?auto_17796 ?auto_17799 ) ) ( not ( = ?auto_17797 ?auto_17798 ) ) ( not ( = ?auto_17797 ?auto_17799 ) ) ( not ( = ?auto_17798 ?auto_17799 ) ) ( ON ?auto_17799 ?auto_17800 ) ( CLEAR ?auto_17799 ) ( HAND-EMPTY ) ( not ( = ?auto_17796 ?auto_17800 ) ) ( not ( = ?auto_17797 ?auto_17800 ) ) ( not ( = ?auto_17798 ?auto_17800 ) ) ( not ( = ?auto_17799 ?auto_17800 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17799 ?auto_17800 )
      ( MAKE-4PILE ?auto_17796 ?auto_17797 ?auto_17798 ?auto_17799 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17801 - BLOCK
      ?auto_17802 - BLOCK
      ?auto_17803 - BLOCK
      ?auto_17804 - BLOCK
    )
    :vars
    (
      ?auto_17805 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_17801 ) ( ON ?auto_17802 ?auto_17801 ) ( not ( = ?auto_17801 ?auto_17802 ) ) ( not ( = ?auto_17801 ?auto_17803 ) ) ( not ( = ?auto_17801 ?auto_17804 ) ) ( not ( = ?auto_17802 ?auto_17803 ) ) ( not ( = ?auto_17802 ?auto_17804 ) ) ( not ( = ?auto_17803 ?auto_17804 ) ) ( ON ?auto_17804 ?auto_17805 ) ( CLEAR ?auto_17804 ) ( not ( = ?auto_17801 ?auto_17805 ) ) ( not ( = ?auto_17802 ?auto_17805 ) ) ( not ( = ?auto_17803 ?auto_17805 ) ) ( not ( = ?auto_17804 ?auto_17805 ) ) ( HOLDING ?auto_17803 ) ( CLEAR ?auto_17802 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_17801 ?auto_17802 ?auto_17803 )
      ( MAKE-4PILE ?auto_17801 ?auto_17802 ?auto_17803 ?auto_17804 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17806 - BLOCK
      ?auto_17807 - BLOCK
      ?auto_17808 - BLOCK
      ?auto_17809 - BLOCK
    )
    :vars
    (
      ?auto_17810 - BLOCK
      ?auto_17811 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_17806 ) ( ON ?auto_17807 ?auto_17806 ) ( not ( = ?auto_17806 ?auto_17807 ) ) ( not ( = ?auto_17806 ?auto_17808 ) ) ( not ( = ?auto_17806 ?auto_17809 ) ) ( not ( = ?auto_17807 ?auto_17808 ) ) ( not ( = ?auto_17807 ?auto_17809 ) ) ( not ( = ?auto_17808 ?auto_17809 ) ) ( ON ?auto_17809 ?auto_17810 ) ( not ( = ?auto_17806 ?auto_17810 ) ) ( not ( = ?auto_17807 ?auto_17810 ) ) ( not ( = ?auto_17808 ?auto_17810 ) ) ( not ( = ?auto_17809 ?auto_17810 ) ) ( CLEAR ?auto_17807 ) ( ON ?auto_17808 ?auto_17809 ) ( CLEAR ?auto_17808 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17811 ) ( ON ?auto_17810 ?auto_17811 ) ( not ( = ?auto_17811 ?auto_17810 ) ) ( not ( = ?auto_17811 ?auto_17809 ) ) ( not ( = ?auto_17811 ?auto_17808 ) ) ( not ( = ?auto_17806 ?auto_17811 ) ) ( not ( = ?auto_17807 ?auto_17811 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_17811 ?auto_17810 ?auto_17809 )
      ( MAKE-4PILE ?auto_17806 ?auto_17807 ?auto_17808 ?auto_17809 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17812 - BLOCK
      ?auto_17813 - BLOCK
      ?auto_17814 - BLOCK
      ?auto_17815 - BLOCK
    )
    :vars
    (
      ?auto_17817 - BLOCK
      ?auto_17816 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_17812 ) ( not ( = ?auto_17812 ?auto_17813 ) ) ( not ( = ?auto_17812 ?auto_17814 ) ) ( not ( = ?auto_17812 ?auto_17815 ) ) ( not ( = ?auto_17813 ?auto_17814 ) ) ( not ( = ?auto_17813 ?auto_17815 ) ) ( not ( = ?auto_17814 ?auto_17815 ) ) ( ON ?auto_17815 ?auto_17817 ) ( not ( = ?auto_17812 ?auto_17817 ) ) ( not ( = ?auto_17813 ?auto_17817 ) ) ( not ( = ?auto_17814 ?auto_17817 ) ) ( not ( = ?auto_17815 ?auto_17817 ) ) ( ON ?auto_17814 ?auto_17815 ) ( CLEAR ?auto_17814 ) ( ON-TABLE ?auto_17816 ) ( ON ?auto_17817 ?auto_17816 ) ( not ( = ?auto_17816 ?auto_17817 ) ) ( not ( = ?auto_17816 ?auto_17815 ) ) ( not ( = ?auto_17816 ?auto_17814 ) ) ( not ( = ?auto_17812 ?auto_17816 ) ) ( not ( = ?auto_17813 ?auto_17816 ) ) ( HOLDING ?auto_17813 ) ( CLEAR ?auto_17812 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17812 ?auto_17813 )
      ( MAKE-4PILE ?auto_17812 ?auto_17813 ?auto_17814 ?auto_17815 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17818 - BLOCK
      ?auto_17819 - BLOCK
      ?auto_17820 - BLOCK
      ?auto_17821 - BLOCK
    )
    :vars
    (
      ?auto_17822 - BLOCK
      ?auto_17823 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_17818 ) ( not ( = ?auto_17818 ?auto_17819 ) ) ( not ( = ?auto_17818 ?auto_17820 ) ) ( not ( = ?auto_17818 ?auto_17821 ) ) ( not ( = ?auto_17819 ?auto_17820 ) ) ( not ( = ?auto_17819 ?auto_17821 ) ) ( not ( = ?auto_17820 ?auto_17821 ) ) ( ON ?auto_17821 ?auto_17822 ) ( not ( = ?auto_17818 ?auto_17822 ) ) ( not ( = ?auto_17819 ?auto_17822 ) ) ( not ( = ?auto_17820 ?auto_17822 ) ) ( not ( = ?auto_17821 ?auto_17822 ) ) ( ON ?auto_17820 ?auto_17821 ) ( ON-TABLE ?auto_17823 ) ( ON ?auto_17822 ?auto_17823 ) ( not ( = ?auto_17823 ?auto_17822 ) ) ( not ( = ?auto_17823 ?auto_17821 ) ) ( not ( = ?auto_17823 ?auto_17820 ) ) ( not ( = ?auto_17818 ?auto_17823 ) ) ( not ( = ?auto_17819 ?auto_17823 ) ) ( CLEAR ?auto_17818 ) ( ON ?auto_17819 ?auto_17820 ) ( CLEAR ?auto_17819 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_17823 ?auto_17822 ?auto_17821 ?auto_17820 )
      ( MAKE-4PILE ?auto_17818 ?auto_17819 ?auto_17820 ?auto_17821 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17824 - BLOCK
      ?auto_17825 - BLOCK
      ?auto_17826 - BLOCK
      ?auto_17827 - BLOCK
    )
    :vars
    (
      ?auto_17829 - BLOCK
      ?auto_17828 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17824 ?auto_17825 ) ) ( not ( = ?auto_17824 ?auto_17826 ) ) ( not ( = ?auto_17824 ?auto_17827 ) ) ( not ( = ?auto_17825 ?auto_17826 ) ) ( not ( = ?auto_17825 ?auto_17827 ) ) ( not ( = ?auto_17826 ?auto_17827 ) ) ( ON ?auto_17827 ?auto_17829 ) ( not ( = ?auto_17824 ?auto_17829 ) ) ( not ( = ?auto_17825 ?auto_17829 ) ) ( not ( = ?auto_17826 ?auto_17829 ) ) ( not ( = ?auto_17827 ?auto_17829 ) ) ( ON ?auto_17826 ?auto_17827 ) ( ON-TABLE ?auto_17828 ) ( ON ?auto_17829 ?auto_17828 ) ( not ( = ?auto_17828 ?auto_17829 ) ) ( not ( = ?auto_17828 ?auto_17827 ) ) ( not ( = ?auto_17828 ?auto_17826 ) ) ( not ( = ?auto_17824 ?auto_17828 ) ) ( not ( = ?auto_17825 ?auto_17828 ) ) ( ON ?auto_17825 ?auto_17826 ) ( CLEAR ?auto_17825 ) ( HOLDING ?auto_17824 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_17824 )
      ( MAKE-4PILE ?auto_17824 ?auto_17825 ?auto_17826 ?auto_17827 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17830 - BLOCK
      ?auto_17831 - BLOCK
      ?auto_17832 - BLOCK
      ?auto_17833 - BLOCK
    )
    :vars
    (
      ?auto_17834 - BLOCK
      ?auto_17835 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17830 ?auto_17831 ) ) ( not ( = ?auto_17830 ?auto_17832 ) ) ( not ( = ?auto_17830 ?auto_17833 ) ) ( not ( = ?auto_17831 ?auto_17832 ) ) ( not ( = ?auto_17831 ?auto_17833 ) ) ( not ( = ?auto_17832 ?auto_17833 ) ) ( ON ?auto_17833 ?auto_17834 ) ( not ( = ?auto_17830 ?auto_17834 ) ) ( not ( = ?auto_17831 ?auto_17834 ) ) ( not ( = ?auto_17832 ?auto_17834 ) ) ( not ( = ?auto_17833 ?auto_17834 ) ) ( ON ?auto_17832 ?auto_17833 ) ( ON-TABLE ?auto_17835 ) ( ON ?auto_17834 ?auto_17835 ) ( not ( = ?auto_17835 ?auto_17834 ) ) ( not ( = ?auto_17835 ?auto_17833 ) ) ( not ( = ?auto_17835 ?auto_17832 ) ) ( not ( = ?auto_17830 ?auto_17835 ) ) ( not ( = ?auto_17831 ?auto_17835 ) ) ( ON ?auto_17831 ?auto_17832 ) ( ON ?auto_17830 ?auto_17831 ) ( CLEAR ?auto_17830 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_17835 ?auto_17834 ?auto_17833 ?auto_17832 ?auto_17831 )
      ( MAKE-4PILE ?auto_17830 ?auto_17831 ?auto_17832 ?auto_17833 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17837 - BLOCK
    )
    :vars
    (
      ?auto_17838 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17838 ?auto_17837 ) ( CLEAR ?auto_17838 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17837 ) ( not ( = ?auto_17837 ?auto_17838 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17838 ?auto_17837 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17839 - BLOCK
    )
    :vars
    (
      ?auto_17840 - BLOCK
      ?auto_17841 - BLOCK
      ?auto_17842 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17840 ?auto_17839 ) ( CLEAR ?auto_17840 ) ( ON-TABLE ?auto_17839 ) ( not ( = ?auto_17839 ?auto_17840 ) ) ( HOLDING ?auto_17841 ) ( CLEAR ?auto_17842 ) ( not ( = ?auto_17839 ?auto_17841 ) ) ( not ( = ?auto_17839 ?auto_17842 ) ) ( not ( = ?auto_17840 ?auto_17841 ) ) ( not ( = ?auto_17840 ?auto_17842 ) ) ( not ( = ?auto_17841 ?auto_17842 ) ) )
    :subtasks
    ( ( !STACK ?auto_17841 ?auto_17842 )
      ( MAKE-1PILE ?auto_17839 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17843 - BLOCK
    )
    :vars
    (
      ?auto_17844 - BLOCK
      ?auto_17845 - BLOCK
      ?auto_17846 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17844 ?auto_17843 ) ( ON-TABLE ?auto_17843 ) ( not ( = ?auto_17843 ?auto_17844 ) ) ( CLEAR ?auto_17845 ) ( not ( = ?auto_17843 ?auto_17846 ) ) ( not ( = ?auto_17843 ?auto_17845 ) ) ( not ( = ?auto_17844 ?auto_17846 ) ) ( not ( = ?auto_17844 ?auto_17845 ) ) ( not ( = ?auto_17846 ?auto_17845 ) ) ( ON ?auto_17846 ?auto_17844 ) ( CLEAR ?auto_17846 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17843 ?auto_17844 )
      ( MAKE-1PILE ?auto_17843 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17847 - BLOCK
    )
    :vars
    (
      ?auto_17849 - BLOCK
      ?auto_17850 - BLOCK
      ?auto_17848 - BLOCK
      ?auto_17852 - BLOCK
      ?auto_17851 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17849 ?auto_17847 ) ( ON-TABLE ?auto_17847 ) ( not ( = ?auto_17847 ?auto_17849 ) ) ( not ( = ?auto_17847 ?auto_17850 ) ) ( not ( = ?auto_17847 ?auto_17848 ) ) ( not ( = ?auto_17849 ?auto_17850 ) ) ( not ( = ?auto_17849 ?auto_17848 ) ) ( not ( = ?auto_17850 ?auto_17848 ) ) ( ON ?auto_17850 ?auto_17849 ) ( CLEAR ?auto_17850 ) ( HOLDING ?auto_17848 ) ( CLEAR ?auto_17852 ) ( ON-TABLE ?auto_17851 ) ( ON ?auto_17852 ?auto_17851 ) ( not ( = ?auto_17851 ?auto_17852 ) ) ( not ( = ?auto_17851 ?auto_17848 ) ) ( not ( = ?auto_17852 ?auto_17848 ) ) ( not ( = ?auto_17847 ?auto_17852 ) ) ( not ( = ?auto_17847 ?auto_17851 ) ) ( not ( = ?auto_17849 ?auto_17852 ) ) ( not ( = ?auto_17849 ?auto_17851 ) ) ( not ( = ?auto_17850 ?auto_17852 ) ) ( not ( = ?auto_17850 ?auto_17851 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_17851 ?auto_17852 ?auto_17848 )
      ( MAKE-1PILE ?auto_17847 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17853 - BLOCK
    )
    :vars
    (
      ?auto_17857 - BLOCK
      ?auto_17858 - BLOCK
      ?auto_17856 - BLOCK
      ?auto_17855 - BLOCK
      ?auto_17854 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17857 ?auto_17853 ) ( ON-TABLE ?auto_17853 ) ( not ( = ?auto_17853 ?auto_17857 ) ) ( not ( = ?auto_17853 ?auto_17858 ) ) ( not ( = ?auto_17853 ?auto_17856 ) ) ( not ( = ?auto_17857 ?auto_17858 ) ) ( not ( = ?auto_17857 ?auto_17856 ) ) ( not ( = ?auto_17858 ?auto_17856 ) ) ( ON ?auto_17858 ?auto_17857 ) ( CLEAR ?auto_17855 ) ( ON-TABLE ?auto_17854 ) ( ON ?auto_17855 ?auto_17854 ) ( not ( = ?auto_17854 ?auto_17855 ) ) ( not ( = ?auto_17854 ?auto_17856 ) ) ( not ( = ?auto_17855 ?auto_17856 ) ) ( not ( = ?auto_17853 ?auto_17855 ) ) ( not ( = ?auto_17853 ?auto_17854 ) ) ( not ( = ?auto_17857 ?auto_17855 ) ) ( not ( = ?auto_17857 ?auto_17854 ) ) ( not ( = ?auto_17858 ?auto_17855 ) ) ( not ( = ?auto_17858 ?auto_17854 ) ) ( ON ?auto_17856 ?auto_17858 ) ( CLEAR ?auto_17856 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_17853 ?auto_17857 ?auto_17858 )
      ( MAKE-1PILE ?auto_17853 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17859 - BLOCK
    )
    :vars
    (
      ?auto_17860 - BLOCK
      ?auto_17862 - BLOCK
      ?auto_17863 - BLOCK
      ?auto_17864 - BLOCK
      ?auto_17861 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17860 ?auto_17859 ) ( ON-TABLE ?auto_17859 ) ( not ( = ?auto_17859 ?auto_17860 ) ) ( not ( = ?auto_17859 ?auto_17862 ) ) ( not ( = ?auto_17859 ?auto_17863 ) ) ( not ( = ?auto_17860 ?auto_17862 ) ) ( not ( = ?auto_17860 ?auto_17863 ) ) ( not ( = ?auto_17862 ?auto_17863 ) ) ( ON ?auto_17862 ?auto_17860 ) ( ON-TABLE ?auto_17864 ) ( not ( = ?auto_17864 ?auto_17861 ) ) ( not ( = ?auto_17864 ?auto_17863 ) ) ( not ( = ?auto_17861 ?auto_17863 ) ) ( not ( = ?auto_17859 ?auto_17861 ) ) ( not ( = ?auto_17859 ?auto_17864 ) ) ( not ( = ?auto_17860 ?auto_17861 ) ) ( not ( = ?auto_17860 ?auto_17864 ) ) ( not ( = ?auto_17862 ?auto_17861 ) ) ( not ( = ?auto_17862 ?auto_17864 ) ) ( ON ?auto_17863 ?auto_17862 ) ( CLEAR ?auto_17863 ) ( HOLDING ?auto_17861 ) ( CLEAR ?auto_17864 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17864 ?auto_17861 )
      ( MAKE-1PILE ?auto_17859 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_18328 - BLOCK
    )
    :vars
    (
      ?auto_18329 - BLOCK
      ?auto_18332 - BLOCK
      ?auto_18331 - BLOCK
      ?auto_18330 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18329 ?auto_18328 ) ( ON-TABLE ?auto_18328 ) ( not ( = ?auto_18328 ?auto_18329 ) ) ( not ( = ?auto_18328 ?auto_18332 ) ) ( not ( = ?auto_18328 ?auto_18331 ) ) ( not ( = ?auto_18329 ?auto_18332 ) ) ( not ( = ?auto_18329 ?auto_18331 ) ) ( not ( = ?auto_18332 ?auto_18331 ) ) ( ON ?auto_18332 ?auto_18329 ) ( not ( = ?auto_18330 ?auto_18331 ) ) ( not ( = ?auto_18328 ?auto_18330 ) ) ( not ( = ?auto_18329 ?auto_18330 ) ) ( not ( = ?auto_18332 ?auto_18330 ) ) ( ON ?auto_18331 ?auto_18332 ) ( ON ?auto_18330 ?auto_18331 ) ( CLEAR ?auto_18330 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_18328 ?auto_18329 ?auto_18332 ?auto_18331 )
      ( MAKE-1PILE ?auto_18328 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17871 - BLOCK
    )
    :vars
    (
      ?auto_17873 - BLOCK
      ?auto_17875 - BLOCK
      ?auto_17874 - BLOCK
      ?auto_17876 - BLOCK
      ?auto_17872 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17873 ?auto_17871 ) ( ON-TABLE ?auto_17871 ) ( not ( = ?auto_17871 ?auto_17873 ) ) ( not ( = ?auto_17871 ?auto_17875 ) ) ( not ( = ?auto_17871 ?auto_17874 ) ) ( not ( = ?auto_17873 ?auto_17875 ) ) ( not ( = ?auto_17873 ?auto_17874 ) ) ( not ( = ?auto_17875 ?auto_17874 ) ) ( ON ?auto_17875 ?auto_17873 ) ( not ( = ?auto_17876 ?auto_17872 ) ) ( not ( = ?auto_17876 ?auto_17874 ) ) ( not ( = ?auto_17872 ?auto_17874 ) ) ( not ( = ?auto_17871 ?auto_17872 ) ) ( not ( = ?auto_17871 ?auto_17876 ) ) ( not ( = ?auto_17873 ?auto_17872 ) ) ( not ( = ?auto_17873 ?auto_17876 ) ) ( not ( = ?auto_17875 ?auto_17872 ) ) ( not ( = ?auto_17875 ?auto_17876 ) ) ( ON ?auto_17874 ?auto_17875 ) ( ON ?auto_17872 ?auto_17874 ) ( CLEAR ?auto_17872 ) ( HOLDING ?auto_17876 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_17876 )
      ( MAKE-1PILE ?auto_17871 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17877 - BLOCK
    )
    :vars
    (
      ?auto_17878 - BLOCK
      ?auto_17881 - BLOCK
      ?auto_17879 - BLOCK
      ?auto_17882 - BLOCK
      ?auto_17880 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17878 ?auto_17877 ) ( ON-TABLE ?auto_17877 ) ( not ( = ?auto_17877 ?auto_17878 ) ) ( not ( = ?auto_17877 ?auto_17881 ) ) ( not ( = ?auto_17877 ?auto_17879 ) ) ( not ( = ?auto_17878 ?auto_17881 ) ) ( not ( = ?auto_17878 ?auto_17879 ) ) ( not ( = ?auto_17881 ?auto_17879 ) ) ( ON ?auto_17881 ?auto_17878 ) ( not ( = ?auto_17882 ?auto_17880 ) ) ( not ( = ?auto_17882 ?auto_17879 ) ) ( not ( = ?auto_17880 ?auto_17879 ) ) ( not ( = ?auto_17877 ?auto_17880 ) ) ( not ( = ?auto_17877 ?auto_17882 ) ) ( not ( = ?auto_17878 ?auto_17880 ) ) ( not ( = ?auto_17878 ?auto_17882 ) ) ( not ( = ?auto_17881 ?auto_17880 ) ) ( not ( = ?auto_17881 ?auto_17882 ) ) ( ON ?auto_17879 ?auto_17881 ) ( ON ?auto_17880 ?auto_17879 ) ( ON ?auto_17882 ?auto_17880 ) ( CLEAR ?auto_17882 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_17877 ?auto_17878 ?auto_17881 ?auto_17879 ?auto_17880 )
      ( MAKE-1PILE ?auto_17877 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_17888 - BLOCK
      ?auto_17889 - BLOCK
      ?auto_17890 - BLOCK
      ?auto_17891 - BLOCK
      ?auto_17892 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_17892 ) ( CLEAR ?auto_17891 ) ( ON-TABLE ?auto_17888 ) ( ON ?auto_17889 ?auto_17888 ) ( ON ?auto_17890 ?auto_17889 ) ( ON ?auto_17891 ?auto_17890 ) ( not ( = ?auto_17888 ?auto_17889 ) ) ( not ( = ?auto_17888 ?auto_17890 ) ) ( not ( = ?auto_17888 ?auto_17891 ) ) ( not ( = ?auto_17888 ?auto_17892 ) ) ( not ( = ?auto_17889 ?auto_17890 ) ) ( not ( = ?auto_17889 ?auto_17891 ) ) ( not ( = ?auto_17889 ?auto_17892 ) ) ( not ( = ?auto_17890 ?auto_17891 ) ) ( not ( = ?auto_17890 ?auto_17892 ) ) ( not ( = ?auto_17891 ?auto_17892 ) ) )
    :subtasks
    ( ( !STACK ?auto_17892 ?auto_17891 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_17893 - BLOCK
      ?auto_17894 - BLOCK
      ?auto_17895 - BLOCK
      ?auto_17896 - BLOCK
      ?auto_17897 - BLOCK
    )
    :vars
    (
      ?auto_17898 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_17896 ) ( ON-TABLE ?auto_17893 ) ( ON ?auto_17894 ?auto_17893 ) ( ON ?auto_17895 ?auto_17894 ) ( ON ?auto_17896 ?auto_17895 ) ( not ( = ?auto_17893 ?auto_17894 ) ) ( not ( = ?auto_17893 ?auto_17895 ) ) ( not ( = ?auto_17893 ?auto_17896 ) ) ( not ( = ?auto_17893 ?auto_17897 ) ) ( not ( = ?auto_17894 ?auto_17895 ) ) ( not ( = ?auto_17894 ?auto_17896 ) ) ( not ( = ?auto_17894 ?auto_17897 ) ) ( not ( = ?auto_17895 ?auto_17896 ) ) ( not ( = ?auto_17895 ?auto_17897 ) ) ( not ( = ?auto_17896 ?auto_17897 ) ) ( ON ?auto_17897 ?auto_17898 ) ( CLEAR ?auto_17897 ) ( HAND-EMPTY ) ( not ( = ?auto_17893 ?auto_17898 ) ) ( not ( = ?auto_17894 ?auto_17898 ) ) ( not ( = ?auto_17895 ?auto_17898 ) ) ( not ( = ?auto_17896 ?auto_17898 ) ) ( not ( = ?auto_17897 ?auto_17898 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17897 ?auto_17898 )
      ( MAKE-5PILE ?auto_17893 ?auto_17894 ?auto_17895 ?auto_17896 ?auto_17897 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_17899 - BLOCK
      ?auto_17900 - BLOCK
      ?auto_17901 - BLOCK
      ?auto_17902 - BLOCK
      ?auto_17903 - BLOCK
    )
    :vars
    (
      ?auto_17904 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_17899 ) ( ON ?auto_17900 ?auto_17899 ) ( ON ?auto_17901 ?auto_17900 ) ( not ( = ?auto_17899 ?auto_17900 ) ) ( not ( = ?auto_17899 ?auto_17901 ) ) ( not ( = ?auto_17899 ?auto_17902 ) ) ( not ( = ?auto_17899 ?auto_17903 ) ) ( not ( = ?auto_17900 ?auto_17901 ) ) ( not ( = ?auto_17900 ?auto_17902 ) ) ( not ( = ?auto_17900 ?auto_17903 ) ) ( not ( = ?auto_17901 ?auto_17902 ) ) ( not ( = ?auto_17901 ?auto_17903 ) ) ( not ( = ?auto_17902 ?auto_17903 ) ) ( ON ?auto_17903 ?auto_17904 ) ( CLEAR ?auto_17903 ) ( not ( = ?auto_17899 ?auto_17904 ) ) ( not ( = ?auto_17900 ?auto_17904 ) ) ( not ( = ?auto_17901 ?auto_17904 ) ) ( not ( = ?auto_17902 ?auto_17904 ) ) ( not ( = ?auto_17903 ?auto_17904 ) ) ( HOLDING ?auto_17902 ) ( CLEAR ?auto_17901 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_17899 ?auto_17900 ?auto_17901 ?auto_17902 )
      ( MAKE-5PILE ?auto_17899 ?auto_17900 ?auto_17901 ?auto_17902 ?auto_17903 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_17905 - BLOCK
      ?auto_17906 - BLOCK
      ?auto_17907 - BLOCK
      ?auto_17908 - BLOCK
      ?auto_17909 - BLOCK
    )
    :vars
    (
      ?auto_17910 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_17905 ) ( ON ?auto_17906 ?auto_17905 ) ( ON ?auto_17907 ?auto_17906 ) ( not ( = ?auto_17905 ?auto_17906 ) ) ( not ( = ?auto_17905 ?auto_17907 ) ) ( not ( = ?auto_17905 ?auto_17908 ) ) ( not ( = ?auto_17905 ?auto_17909 ) ) ( not ( = ?auto_17906 ?auto_17907 ) ) ( not ( = ?auto_17906 ?auto_17908 ) ) ( not ( = ?auto_17906 ?auto_17909 ) ) ( not ( = ?auto_17907 ?auto_17908 ) ) ( not ( = ?auto_17907 ?auto_17909 ) ) ( not ( = ?auto_17908 ?auto_17909 ) ) ( ON ?auto_17909 ?auto_17910 ) ( not ( = ?auto_17905 ?auto_17910 ) ) ( not ( = ?auto_17906 ?auto_17910 ) ) ( not ( = ?auto_17907 ?auto_17910 ) ) ( not ( = ?auto_17908 ?auto_17910 ) ) ( not ( = ?auto_17909 ?auto_17910 ) ) ( CLEAR ?auto_17907 ) ( ON ?auto_17908 ?auto_17909 ) ( CLEAR ?auto_17908 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17910 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17910 ?auto_17909 )
      ( MAKE-5PILE ?auto_17905 ?auto_17906 ?auto_17907 ?auto_17908 ?auto_17909 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_17911 - BLOCK
      ?auto_17912 - BLOCK
      ?auto_17913 - BLOCK
      ?auto_17914 - BLOCK
      ?auto_17915 - BLOCK
    )
    :vars
    (
      ?auto_17916 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_17911 ) ( ON ?auto_17912 ?auto_17911 ) ( not ( = ?auto_17911 ?auto_17912 ) ) ( not ( = ?auto_17911 ?auto_17913 ) ) ( not ( = ?auto_17911 ?auto_17914 ) ) ( not ( = ?auto_17911 ?auto_17915 ) ) ( not ( = ?auto_17912 ?auto_17913 ) ) ( not ( = ?auto_17912 ?auto_17914 ) ) ( not ( = ?auto_17912 ?auto_17915 ) ) ( not ( = ?auto_17913 ?auto_17914 ) ) ( not ( = ?auto_17913 ?auto_17915 ) ) ( not ( = ?auto_17914 ?auto_17915 ) ) ( ON ?auto_17915 ?auto_17916 ) ( not ( = ?auto_17911 ?auto_17916 ) ) ( not ( = ?auto_17912 ?auto_17916 ) ) ( not ( = ?auto_17913 ?auto_17916 ) ) ( not ( = ?auto_17914 ?auto_17916 ) ) ( not ( = ?auto_17915 ?auto_17916 ) ) ( ON ?auto_17914 ?auto_17915 ) ( CLEAR ?auto_17914 ) ( ON-TABLE ?auto_17916 ) ( HOLDING ?auto_17913 ) ( CLEAR ?auto_17912 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_17911 ?auto_17912 ?auto_17913 )
      ( MAKE-5PILE ?auto_17911 ?auto_17912 ?auto_17913 ?auto_17914 ?auto_17915 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_17917 - BLOCK
      ?auto_17918 - BLOCK
      ?auto_17919 - BLOCK
      ?auto_17920 - BLOCK
      ?auto_17921 - BLOCK
    )
    :vars
    (
      ?auto_17922 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_17917 ) ( ON ?auto_17918 ?auto_17917 ) ( not ( = ?auto_17917 ?auto_17918 ) ) ( not ( = ?auto_17917 ?auto_17919 ) ) ( not ( = ?auto_17917 ?auto_17920 ) ) ( not ( = ?auto_17917 ?auto_17921 ) ) ( not ( = ?auto_17918 ?auto_17919 ) ) ( not ( = ?auto_17918 ?auto_17920 ) ) ( not ( = ?auto_17918 ?auto_17921 ) ) ( not ( = ?auto_17919 ?auto_17920 ) ) ( not ( = ?auto_17919 ?auto_17921 ) ) ( not ( = ?auto_17920 ?auto_17921 ) ) ( ON ?auto_17921 ?auto_17922 ) ( not ( = ?auto_17917 ?auto_17922 ) ) ( not ( = ?auto_17918 ?auto_17922 ) ) ( not ( = ?auto_17919 ?auto_17922 ) ) ( not ( = ?auto_17920 ?auto_17922 ) ) ( not ( = ?auto_17921 ?auto_17922 ) ) ( ON ?auto_17920 ?auto_17921 ) ( ON-TABLE ?auto_17922 ) ( CLEAR ?auto_17918 ) ( ON ?auto_17919 ?auto_17920 ) ( CLEAR ?auto_17919 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_17922 ?auto_17921 ?auto_17920 )
      ( MAKE-5PILE ?auto_17917 ?auto_17918 ?auto_17919 ?auto_17920 ?auto_17921 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_17923 - BLOCK
      ?auto_17924 - BLOCK
      ?auto_17925 - BLOCK
      ?auto_17926 - BLOCK
      ?auto_17927 - BLOCK
    )
    :vars
    (
      ?auto_17928 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_17923 ) ( not ( = ?auto_17923 ?auto_17924 ) ) ( not ( = ?auto_17923 ?auto_17925 ) ) ( not ( = ?auto_17923 ?auto_17926 ) ) ( not ( = ?auto_17923 ?auto_17927 ) ) ( not ( = ?auto_17924 ?auto_17925 ) ) ( not ( = ?auto_17924 ?auto_17926 ) ) ( not ( = ?auto_17924 ?auto_17927 ) ) ( not ( = ?auto_17925 ?auto_17926 ) ) ( not ( = ?auto_17925 ?auto_17927 ) ) ( not ( = ?auto_17926 ?auto_17927 ) ) ( ON ?auto_17927 ?auto_17928 ) ( not ( = ?auto_17923 ?auto_17928 ) ) ( not ( = ?auto_17924 ?auto_17928 ) ) ( not ( = ?auto_17925 ?auto_17928 ) ) ( not ( = ?auto_17926 ?auto_17928 ) ) ( not ( = ?auto_17927 ?auto_17928 ) ) ( ON ?auto_17926 ?auto_17927 ) ( ON-TABLE ?auto_17928 ) ( ON ?auto_17925 ?auto_17926 ) ( CLEAR ?auto_17925 ) ( HOLDING ?auto_17924 ) ( CLEAR ?auto_17923 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17923 ?auto_17924 )
      ( MAKE-5PILE ?auto_17923 ?auto_17924 ?auto_17925 ?auto_17926 ?auto_17927 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_17929 - BLOCK
      ?auto_17930 - BLOCK
      ?auto_17931 - BLOCK
      ?auto_17932 - BLOCK
      ?auto_17933 - BLOCK
    )
    :vars
    (
      ?auto_17934 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_17929 ) ( not ( = ?auto_17929 ?auto_17930 ) ) ( not ( = ?auto_17929 ?auto_17931 ) ) ( not ( = ?auto_17929 ?auto_17932 ) ) ( not ( = ?auto_17929 ?auto_17933 ) ) ( not ( = ?auto_17930 ?auto_17931 ) ) ( not ( = ?auto_17930 ?auto_17932 ) ) ( not ( = ?auto_17930 ?auto_17933 ) ) ( not ( = ?auto_17931 ?auto_17932 ) ) ( not ( = ?auto_17931 ?auto_17933 ) ) ( not ( = ?auto_17932 ?auto_17933 ) ) ( ON ?auto_17933 ?auto_17934 ) ( not ( = ?auto_17929 ?auto_17934 ) ) ( not ( = ?auto_17930 ?auto_17934 ) ) ( not ( = ?auto_17931 ?auto_17934 ) ) ( not ( = ?auto_17932 ?auto_17934 ) ) ( not ( = ?auto_17933 ?auto_17934 ) ) ( ON ?auto_17932 ?auto_17933 ) ( ON-TABLE ?auto_17934 ) ( ON ?auto_17931 ?auto_17932 ) ( CLEAR ?auto_17929 ) ( ON ?auto_17930 ?auto_17931 ) ( CLEAR ?auto_17930 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_17934 ?auto_17933 ?auto_17932 ?auto_17931 )
      ( MAKE-5PILE ?auto_17929 ?auto_17930 ?auto_17931 ?auto_17932 ?auto_17933 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_17935 - BLOCK
      ?auto_17936 - BLOCK
      ?auto_17937 - BLOCK
      ?auto_17938 - BLOCK
      ?auto_17939 - BLOCK
    )
    :vars
    (
      ?auto_17940 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17935 ?auto_17936 ) ) ( not ( = ?auto_17935 ?auto_17937 ) ) ( not ( = ?auto_17935 ?auto_17938 ) ) ( not ( = ?auto_17935 ?auto_17939 ) ) ( not ( = ?auto_17936 ?auto_17937 ) ) ( not ( = ?auto_17936 ?auto_17938 ) ) ( not ( = ?auto_17936 ?auto_17939 ) ) ( not ( = ?auto_17937 ?auto_17938 ) ) ( not ( = ?auto_17937 ?auto_17939 ) ) ( not ( = ?auto_17938 ?auto_17939 ) ) ( ON ?auto_17939 ?auto_17940 ) ( not ( = ?auto_17935 ?auto_17940 ) ) ( not ( = ?auto_17936 ?auto_17940 ) ) ( not ( = ?auto_17937 ?auto_17940 ) ) ( not ( = ?auto_17938 ?auto_17940 ) ) ( not ( = ?auto_17939 ?auto_17940 ) ) ( ON ?auto_17938 ?auto_17939 ) ( ON-TABLE ?auto_17940 ) ( ON ?auto_17937 ?auto_17938 ) ( ON ?auto_17936 ?auto_17937 ) ( CLEAR ?auto_17936 ) ( HOLDING ?auto_17935 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_17935 )
      ( MAKE-5PILE ?auto_17935 ?auto_17936 ?auto_17937 ?auto_17938 ?auto_17939 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_17941 - BLOCK
      ?auto_17942 - BLOCK
      ?auto_17943 - BLOCK
      ?auto_17944 - BLOCK
      ?auto_17945 - BLOCK
    )
    :vars
    (
      ?auto_17946 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17941 ?auto_17942 ) ) ( not ( = ?auto_17941 ?auto_17943 ) ) ( not ( = ?auto_17941 ?auto_17944 ) ) ( not ( = ?auto_17941 ?auto_17945 ) ) ( not ( = ?auto_17942 ?auto_17943 ) ) ( not ( = ?auto_17942 ?auto_17944 ) ) ( not ( = ?auto_17942 ?auto_17945 ) ) ( not ( = ?auto_17943 ?auto_17944 ) ) ( not ( = ?auto_17943 ?auto_17945 ) ) ( not ( = ?auto_17944 ?auto_17945 ) ) ( ON ?auto_17945 ?auto_17946 ) ( not ( = ?auto_17941 ?auto_17946 ) ) ( not ( = ?auto_17942 ?auto_17946 ) ) ( not ( = ?auto_17943 ?auto_17946 ) ) ( not ( = ?auto_17944 ?auto_17946 ) ) ( not ( = ?auto_17945 ?auto_17946 ) ) ( ON ?auto_17944 ?auto_17945 ) ( ON-TABLE ?auto_17946 ) ( ON ?auto_17943 ?auto_17944 ) ( ON ?auto_17942 ?auto_17943 ) ( ON ?auto_17941 ?auto_17942 ) ( CLEAR ?auto_17941 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_17946 ?auto_17945 ?auto_17944 ?auto_17943 ?auto_17942 )
      ( MAKE-5PILE ?auto_17941 ?auto_17942 ?auto_17943 ?auto_17944 ?auto_17945 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_18005 - BLOCK
    )
    :vars
    (
      ?auto_18006 - BLOCK
      ?auto_18007 - BLOCK
      ?auto_18008 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18005 ?auto_18006 ) ( CLEAR ?auto_18005 ) ( not ( = ?auto_18005 ?auto_18006 ) ) ( HOLDING ?auto_18007 ) ( CLEAR ?auto_18008 ) ( not ( = ?auto_18005 ?auto_18007 ) ) ( not ( = ?auto_18005 ?auto_18008 ) ) ( not ( = ?auto_18006 ?auto_18007 ) ) ( not ( = ?auto_18006 ?auto_18008 ) ) ( not ( = ?auto_18007 ?auto_18008 ) ) )
    :subtasks
    ( ( !STACK ?auto_18007 ?auto_18008 )
      ( MAKE-1PILE ?auto_18005 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_18009 - BLOCK
    )
    :vars
    (
      ?auto_18010 - BLOCK
      ?auto_18011 - BLOCK
      ?auto_18012 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18009 ?auto_18010 ) ( not ( = ?auto_18009 ?auto_18010 ) ) ( CLEAR ?auto_18011 ) ( not ( = ?auto_18009 ?auto_18012 ) ) ( not ( = ?auto_18009 ?auto_18011 ) ) ( not ( = ?auto_18010 ?auto_18012 ) ) ( not ( = ?auto_18010 ?auto_18011 ) ) ( not ( = ?auto_18012 ?auto_18011 ) ) ( ON ?auto_18012 ?auto_18009 ) ( CLEAR ?auto_18012 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_18010 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_18010 ?auto_18009 )
      ( MAKE-1PILE ?auto_18009 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_18013 - BLOCK
    )
    :vars
    (
      ?auto_18016 - BLOCK
      ?auto_18015 - BLOCK
      ?auto_18014 - BLOCK
      ?auto_18018 - BLOCK
      ?auto_18017 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18013 ?auto_18016 ) ( not ( = ?auto_18013 ?auto_18016 ) ) ( not ( = ?auto_18013 ?auto_18015 ) ) ( not ( = ?auto_18013 ?auto_18014 ) ) ( not ( = ?auto_18016 ?auto_18015 ) ) ( not ( = ?auto_18016 ?auto_18014 ) ) ( not ( = ?auto_18015 ?auto_18014 ) ) ( ON ?auto_18015 ?auto_18013 ) ( CLEAR ?auto_18015 ) ( ON-TABLE ?auto_18016 ) ( HOLDING ?auto_18014 ) ( CLEAR ?auto_18018 ) ( ON-TABLE ?auto_18017 ) ( ON ?auto_18018 ?auto_18017 ) ( not ( = ?auto_18017 ?auto_18018 ) ) ( not ( = ?auto_18017 ?auto_18014 ) ) ( not ( = ?auto_18018 ?auto_18014 ) ) ( not ( = ?auto_18013 ?auto_18018 ) ) ( not ( = ?auto_18013 ?auto_18017 ) ) ( not ( = ?auto_18016 ?auto_18018 ) ) ( not ( = ?auto_18016 ?auto_18017 ) ) ( not ( = ?auto_18015 ?auto_18018 ) ) ( not ( = ?auto_18015 ?auto_18017 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_18017 ?auto_18018 ?auto_18014 )
      ( MAKE-1PILE ?auto_18013 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_18019 - BLOCK
    )
    :vars
    (
      ?auto_18023 - BLOCK
      ?auto_18021 - BLOCK
      ?auto_18020 - BLOCK
      ?auto_18024 - BLOCK
      ?auto_18022 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18019 ?auto_18023 ) ( not ( = ?auto_18019 ?auto_18023 ) ) ( not ( = ?auto_18019 ?auto_18021 ) ) ( not ( = ?auto_18019 ?auto_18020 ) ) ( not ( = ?auto_18023 ?auto_18021 ) ) ( not ( = ?auto_18023 ?auto_18020 ) ) ( not ( = ?auto_18021 ?auto_18020 ) ) ( ON ?auto_18021 ?auto_18019 ) ( ON-TABLE ?auto_18023 ) ( CLEAR ?auto_18024 ) ( ON-TABLE ?auto_18022 ) ( ON ?auto_18024 ?auto_18022 ) ( not ( = ?auto_18022 ?auto_18024 ) ) ( not ( = ?auto_18022 ?auto_18020 ) ) ( not ( = ?auto_18024 ?auto_18020 ) ) ( not ( = ?auto_18019 ?auto_18024 ) ) ( not ( = ?auto_18019 ?auto_18022 ) ) ( not ( = ?auto_18023 ?auto_18024 ) ) ( not ( = ?auto_18023 ?auto_18022 ) ) ( not ( = ?auto_18021 ?auto_18024 ) ) ( not ( = ?auto_18021 ?auto_18022 ) ) ( ON ?auto_18020 ?auto_18021 ) ( CLEAR ?auto_18020 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_18023 ?auto_18019 ?auto_18021 )
      ( MAKE-1PILE ?auto_18019 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_18025 - BLOCK
    )
    :vars
    (
      ?auto_18027 - BLOCK
      ?auto_18026 - BLOCK
      ?auto_18029 - BLOCK
      ?auto_18028 - BLOCK
      ?auto_18030 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18025 ?auto_18027 ) ( not ( = ?auto_18025 ?auto_18027 ) ) ( not ( = ?auto_18025 ?auto_18026 ) ) ( not ( = ?auto_18025 ?auto_18029 ) ) ( not ( = ?auto_18027 ?auto_18026 ) ) ( not ( = ?auto_18027 ?auto_18029 ) ) ( not ( = ?auto_18026 ?auto_18029 ) ) ( ON ?auto_18026 ?auto_18025 ) ( ON-TABLE ?auto_18027 ) ( ON-TABLE ?auto_18028 ) ( not ( = ?auto_18028 ?auto_18030 ) ) ( not ( = ?auto_18028 ?auto_18029 ) ) ( not ( = ?auto_18030 ?auto_18029 ) ) ( not ( = ?auto_18025 ?auto_18030 ) ) ( not ( = ?auto_18025 ?auto_18028 ) ) ( not ( = ?auto_18027 ?auto_18030 ) ) ( not ( = ?auto_18027 ?auto_18028 ) ) ( not ( = ?auto_18026 ?auto_18030 ) ) ( not ( = ?auto_18026 ?auto_18028 ) ) ( ON ?auto_18029 ?auto_18026 ) ( CLEAR ?auto_18029 ) ( HOLDING ?auto_18030 ) ( CLEAR ?auto_18028 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_18028 ?auto_18030 )
      ( MAKE-1PILE ?auto_18025 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_18031 - BLOCK
    )
    :vars
    (
      ?auto_18033 - BLOCK
      ?auto_18035 - BLOCK
      ?auto_18036 - BLOCK
      ?auto_18032 - BLOCK
      ?auto_18034 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18031 ?auto_18033 ) ( not ( = ?auto_18031 ?auto_18033 ) ) ( not ( = ?auto_18031 ?auto_18035 ) ) ( not ( = ?auto_18031 ?auto_18036 ) ) ( not ( = ?auto_18033 ?auto_18035 ) ) ( not ( = ?auto_18033 ?auto_18036 ) ) ( not ( = ?auto_18035 ?auto_18036 ) ) ( ON ?auto_18035 ?auto_18031 ) ( ON-TABLE ?auto_18033 ) ( ON-TABLE ?auto_18032 ) ( not ( = ?auto_18032 ?auto_18034 ) ) ( not ( = ?auto_18032 ?auto_18036 ) ) ( not ( = ?auto_18034 ?auto_18036 ) ) ( not ( = ?auto_18031 ?auto_18034 ) ) ( not ( = ?auto_18031 ?auto_18032 ) ) ( not ( = ?auto_18033 ?auto_18034 ) ) ( not ( = ?auto_18033 ?auto_18032 ) ) ( not ( = ?auto_18035 ?auto_18034 ) ) ( not ( = ?auto_18035 ?auto_18032 ) ) ( ON ?auto_18036 ?auto_18035 ) ( CLEAR ?auto_18032 ) ( ON ?auto_18034 ?auto_18036 ) ( CLEAR ?auto_18034 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_18033 ?auto_18031 ?auto_18035 ?auto_18036 )
      ( MAKE-1PILE ?auto_18031 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_18037 - BLOCK
    )
    :vars
    (
      ?auto_18038 - BLOCK
      ?auto_18041 - BLOCK
      ?auto_18040 - BLOCK
      ?auto_18039 - BLOCK
      ?auto_18042 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18037 ?auto_18038 ) ( not ( = ?auto_18037 ?auto_18038 ) ) ( not ( = ?auto_18037 ?auto_18041 ) ) ( not ( = ?auto_18037 ?auto_18040 ) ) ( not ( = ?auto_18038 ?auto_18041 ) ) ( not ( = ?auto_18038 ?auto_18040 ) ) ( not ( = ?auto_18041 ?auto_18040 ) ) ( ON ?auto_18041 ?auto_18037 ) ( ON-TABLE ?auto_18038 ) ( not ( = ?auto_18039 ?auto_18042 ) ) ( not ( = ?auto_18039 ?auto_18040 ) ) ( not ( = ?auto_18042 ?auto_18040 ) ) ( not ( = ?auto_18037 ?auto_18042 ) ) ( not ( = ?auto_18037 ?auto_18039 ) ) ( not ( = ?auto_18038 ?auto_18042 ) ) ( not ( = ?auto_18038 ?auto_18039 ) ) ( not ( = ?auto_18041 ?auto_18042 ) ) ( not ( = ?auto_18041 ?auto_18039 ) ) ( ON ?auto_18040 ?auto_18041 ) ( ON ?auto_18042 ?auto_18040 ) ( CLEAR ?auto_18042 ) ( HOLDING ?auto_18039 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_18039 )
      ( MAKE-1PILE ?auto_18037 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_18043 - BLOCK
    )
    :vars
    (
      ?auto_18044 - BLOCK
      ?auto_18045 - BLOCK
      ?auto_18047 - BLOCK
      ?auto_18046 - BLOCK
      ?auto_18048 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18043 ?auto_18044 ) ( not ( = ?auto_18043 ?auto_18044 ) ) ( not ( = ?auto_18043 ?auto_18045 ) ) ( not ( = ?auto_18043 ?auto_18047 ) ) ( not ( = ?auto_18044 ?auto_18045 ) ) ( not ( = ?auto_18044 ?auto_18047 ) ) ( not ( = ?auto_18045 ?auto_18047 ) ) ( ON ?auto_18045 ?auto_18043 ) ( ON-TABLE ?auto_18044 ) ( not ( = ?auto_18046 ?auto_18048 ) ) ( not ( = ?auto_18046 ?auto_18047 ) ) ( not ( = ?auto_18048 ?auto_18047 ) ) ( not ( = ?auto_18043 ?auto_18048 ) ) ( not ( = ?auto_18043 ?auto_18046 ) ) ( not ( = ?auto_18044 ?auto_18048 ) ) ( not ( = ?auto_18044 ?auto_18046 ) ) ( not ( = ?auto_18045 ?auto_18048 ) ) ( not ( = ?auto_18045 ?auto_18046 ) ) ( ON ?auto_18047 ?auto_18045 ) ( ON ?auto_18048 ?auto_18047 ) ( ON ?auto_18046 ?auto_18048 ) ( CLEAR ?auto_18046 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_18044 ?auto_18043 ?auto_18045 ?auto_18047 ?auto_18048 )
      ( MAKE-1PILE ?auto_18043 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_18056 - BLOCK
      ?auto_18057 - BLOCK
      ?auto_18058 - BLOCK
    )
    :vars
    (
      ?auto_18059 - BLOCK
      ?auto_18060 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18059 ?auto_18058 ) ( CLEAR ?auto_18059 ) ( ON-TABLE ?auto_18056 ) ( ON ?auto_18057 ?auto_18056 ) ( ON ?auto_18058 ?auto_18057 ) ( not ( = ?auto_18056 ?auto_18057 ) ) ( not ( = ?auto_18056 ?auto_18058 ) ) ( not ( = ?auto_18056 ?auto_18059 ) ) ( not ( = ?auto_18057 ?auto_18058 ) ) ( not ( = ?auto_18057 ?auto_18059 ) ) ( not ( = ?auto_18058 ?auto_18059 ) ) ( HOLDING ?auto_18060 ) ( not ( = ?auto_18056 ?auto_18060 ) ) ( not ( = ?auto_18057 ?auto_18060 ) ) ( not ( = ?auto_18058 ?auto_18060 ) ) ( not ( = ?auto_18059 ?auto_18060 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_18060 )
      ( MAKE-3PILE ?auto_18056 ?auto_18057 ?auto_18058 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_18109 - BLOCK
      ?auto_18110 - BLOCK
    )
    :vars
    (
      ?auto_18111 - BLOCK
      ?auto_18113 - BLOCK
      ?auto_18112 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18109 ?auto_18110 ) ) ( ON ?auto_18110 ?auto_18111 ) ( not ( = ?auto_18109 ?auto_18111 ) ) ( not ( = ?auto_18110 ?auto_18111 ) ) ( ON ?auto_18109 ?auto_18110 ) ( CLEAR ?auto_18109 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_18113 ) ( ON ?auto_18112 ?auto_18113 ) ( ON ?auto_18111 ?auto_18112 ) ( not ( = ?auto_18113 ?auto_18112 ) ) ( not ( = ?auto_18113 ?auto_18111 ) ) ( not ( = ?auto_18113 ?auto_18110 ) ) ( not ( = ?auto_18113 ?auto_18109 ) ) ( not ( = ?auto_18112 ?auto_18111 ) ) ( not ( = ?auto_18112 ?auto_18110 ) ) ( not ( = ?auto_18112 ?auto_18109 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_18113 ?auto_18112 ?auto_18111 ?auto_18110 )
      ( MAKE-2PILE ?auto_18109 ?auto_18110 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_18116 - BLOCK
      ?auto_18117 - BLOCK
    )
    :vars
    (
      ?auto_18118 - BLOCK
      ?auto_18119 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18116 ?auto_18117 ) ) ( ON ?auto_18117 ?auto_18118 ) ( CLEAR ?auto_18117 ) ( not ( = ?auto_18116 ?auto_18118 ) ) ( not ( = ?auto_18117 ?auto_18118 ) ) ( ON ?auto_18116 ?auto_18119 ) ( CLEAR ?auto_18116 ) ( HAND-EMPTY ) ( not ( = ?auto_18116 ?auto_18119 ) ) ( not ( = ?auto_18117 ?auto_18119 ) ) ( not ( = ?auto_18118 ?auto_18119 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_18116 ?auto_18119 )
      ( MAKE-2PILE ?auto_18116 ?auto_18117 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_18120 - BLOCK
      ?auto_18121 - BLOCK
    )
    :vars
    (
      ?auto_18123 - BLOCK
      ?auto_18122 - BLOCK
      ?auto_18124 - BLOCK
      ?auto_18125 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18120 ?auto_18121 ) ) ( not ( = ?auto_18120 ?auto_18123 ) ) ( not ( = ?auto_18121 ?auto_18123 ) ) ( ON ?auto_18120 ?auto_18122 ) ( CLEAR ?auto_18120 ) ( not ( = ?auto_18120 ?auto_18122 ) ) ( not ( = ?auto_18121 ?auto_18122 ) ) ( not ( = ?auto_18123 ?auto_18122 ) ) ( HOLDING ?auto_18121 ) ( CLEAR ?auto_18123 ) ( ON-TABLE ?auto_18124 ) ( ON ?auto_18125 ?auto_18124 ) ( ON ?auto_18123 ?auto_18125 ) ( not ( = ?auto_18124 ?auto_18125 ) ) ( not ( = ?auto_18124 ?auto_18123 ) ) ( not ( = ?auto_18124 ?auto_18121 ) ) ( not ( = ?auto_18125 ?auto_18123 ) ) ( not ( = ?auto_18125 ?auto_18121 ) ) ( not ( = ?auto_18120 ?auto_18124 ) ) ( not ( = ?auto_18120 ?auto_18125 ) ) ( not ( = ?auto_18122 ?auto_18124 ) ) ( not ( = ?auto_18122 ?auto_18125 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_18124 ?auto_18125 ?auto_18123 ?auto_18121 )
      ( MAKE-2PILE ?auto_18120 ?auto_18121 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_18126 - BLOCK
      ?auto_18127 - BLOCK
    )
    :vars
    (
      ?auto_18128 - BLOCK
      ?auto_18129 - BLOCK
      ?auto_18131 - BLOCK
      ?auto_18130 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18126 ?auto_18127 ) ) ( not ( = ?auto_18126 ?auto_18128 ) ) ( not ( = ?auto_18127 ?auto_18128 ) ) ( ON ?auto_18126 ?auto_18129 ) ( not ( = ?auto_18126 ?auto_18129 ) ) ( not ( = ?auto_18127 ?auto_18129 ) ) ( not ( = ?auto_18128 ?auto_18129 ) ) ( CLEAR ?auto_18128 ) ( ON-TABLE ?auto_18131 ) ( ON ?auto_18130 ?auto_18131 ) ( ON ?auto_18128 ?auto_18130 ) ( not ( = ?auto_18131 ?auto_18130 ) ) ( not ( = ?auto_18131 ?auto_18128 ) ) ( not ( = ?auto_18131 ?auto_18127 ) ) ( not ( = ?auto_18130 ?auto_18128 ) ) ( not ( = ?auto_18130 ?auto_18127 ) ) ( not ( = ?auto_18126 ?auto_18131 ) ) ( not ( = ?auto_18126 ?auto_18130 ) ) ( not ( = ?auto_18129 ?auto_18131 ) ) ( not ( = ?auto_18129 ?auto_18130 ) ) ( ON ?auto_18127 ?auto_18126 ) ( CLEAR ?auto_18127 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_18129 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_18129 ?auto_18126 )
      ( MAKE-2PILE ?auto_18126 ?auto_18127 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_18132 - BLOCK
      ?auto_18133 - BLOCK
    )
    :vars
    (
      ?auto_18134 - BLOCK
      ?auto_18135 - BLOCK
      ?auto_18136 - BLOCK
      ?auto_18137 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18132 ?auto_18133 ) ) ( not ( = ?auto_18132 ?auto_18134 ) ) ( not ( = ?auto_18133 ?auto_18134 ) ) ( ON ?auto_18132 ?auto_18135 ) ( not ( = ?auto_18132 ?auto_18135 ) ) ( not ( = ?auto_18133 ?auto_18135 ) ) ( not ( = ?auto_18134 ?auto_18135 ) ) ( ON-TABLE ?auto_18136 ) ( ON ?auto_18137 ?auto_18136 ) ( not ( = ?auto_18136 ?auto_18137 ) ) ( not ( = ?auto_18136 ?auto_18134 ) ) ( not ( = ?auto_18136 ?auto_18133 ) ) ( not ( = ?auto_18137 ?auto_18134 ) ) ( not ( = ?auto_18137 ?auto_18133 ) ) ( not ( = ?auto_18132 ?auto_18136 ) ) ( not ( = ?auto_18132 ?auto_18137 ) ) ( not ( = ?auto_18135 ?auto_18136 ) ) ( not ( = ?auto_18135 ?auto_18137 ) ) ( ON ?auto_18133 ?auto_18132 ) ( CLEAR ?auto_18133 ) ( ON-TABLE ?auto_18135 ) ( HOLDING ?auto_18134 ) ( CLEAR ?auto_18137 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_18136 ?auto_18137 ?auto_18134 )
      ( MAKE-2PILE ?auto_18132 ?auto_18133 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_18138 - BLOCK
      ?auto_18139 - BLOCK
    )
    :vars
    (
      ?auto_18142 - BLOCK
      ?auto_18141 - BLOCK
      ?auto_18140 - BLOCK
      ?auto_18143 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18138 ?auto_18139 ) ) ( not ( = ?auto_18138 ?auto_18142 ) ) ( not ( = ?auto_18139 ?auto_18142 ) ) ( ON ?auto_18138 ?auto_18141 ) ( not ( = ?auto_18138 ?auto_18141 ) ) ( not ( = ?auto_18139 ?auto_18141 ) ) ( not ( = ?auto_18142 ?auto_18141 ) ) ( ON-TABLE ?auto_18140 ) ( ON ?auto_18143 ?auto_18140 ) ( not ( = ?auto_18140 ?auto_18143 ) ) ( not ( = ?auto_18140 ?auto_18142 ) ) ( not ( = ?auto_18140 ?auto_18139 ) ) ( not ( = ?auto_18143 ?auto_18142 ) ) ( not ( = ?auto_18143 ?auto_18139 ) ) ( not ( = ?auto_18138 ?auto_18140 ) ) ( not ( = ?auto_18138 ?auto_18143 ) ) ( not ( = ?auto_18141 ?auto_18140 ) ) ( not ( = ?auto_18141 ?auto_18143 ) ) ( ON ?auto_18139 ?auto_18138 ) ( ON-TABLE ?auto_18141 ) ( CLEAR ?auto_18143 ) ( ON ?auto_18142 ?auto_18139 ) ( CLEAR ?auto_18142 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_18141 ?auto_18138 ?auto_18139 )
      ( MAKE-2PILE ?auto_18138 ?auto_18139 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_18144 - BLOCK
      ?auto_18145 - BLOCK
    )
    :vars
    (
      ?auto_18146 - BLOCK
      ?auto_18147 - BLOCK
      ?auto_18148 - BLOCK
      ?auto_18149 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18144 ?auto_18145 ) ) ( not ( = ?auto_18144 ?auto_18146 ) ) ( not ( = ?auto_18145 ?auto_18146 ) ) ( ON ?auto_18144 ?auto_18147 ) ( not ( = ?auto_18144 ?auto_18147 ) ) ( not ( = ?auto_18145 ?auto_18147 ) ) ( not ( = ?auto_18146 ?auto_18147 ) ) ( ON-TABLE ?auto_18148 ) ( not ( = ?auto_18148 ?auto_18149 ) ) ( not ( = ?auto_18148 ?auto_18146 ) ) ( not ( = ?auto_18148 ?auto_18145 ) ) ( not ( = ?auto_18149 ?auto_18146 ) ) ( not ( = ?auto_18149 ?auto_18145 ) ) ( not ( = ?auto_18144 ?auto_18148 ) ) ( not ( = ?auto_18144 ?auto_18149 ) ) ( not ( = ?auto_18147 ?auto_18148 ) ) ( not ( = ?auto_18147 ?auto_18149 ) ) ( ON ?auto_18145 ?auto_18144 ) ( ON-TABLE ?auto_18147 ) ( ON ?auto_18146 ?auto_18145 ) ( CLEAR ?auto_18146 ) ( HOLDING ?auto_18149 ) ( CLEAR ?auto_18148 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_18148 ?auto_18149 )
      ( MAKE-2PILE ?auto_18144 ?auto_18145 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_18150 - BLOCK
      ?auto_18151 - BLOCK
    )
    :vars
    (
      ?auto_18153 - BLOCK
      ?auto_18155 - BLOCK
      ?auto_18154 - BLOCK
      ?auto_18152 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18150 ?auto_18151 ) ) ( not ( = ?auto_18150 ?auto_18153 ) ) ( not ( = ?auto_18151 ?auto_18153 ) ) ( ON ?auto_18150 ?auto_18155 ) ( not ( = ?auto_18150 ?auto_18155 ) ) ( not ( = ?auto_18151 ?auto_18155 ) ) ( not ( = ?auto_18153 ?auto_18155 ) ) ( ON-TABLE ?auto_18154 ) ( not ( = ?auto_18154 ?auto_18152 ) ) ( not ( = ?auto_18154 ?auto_18153 ) ) ( not ( = ?auto_18154 ?auto_18151 ) ) ( not ( = ?auto_18152 ?auto_18153 ) ) ( not ( = ?auto_18152 ?auto_18151 ) ) ( not ( = ?auto_18150 ?auto_18154 ) ) ( not ( = ?auto_18150 ?auto_18152 ) ) ( not ( = ?auto_18155 ?auto_18154 ) ) ( not ( = ?auto_18155 ?auto_18152 ) ) ( ON ?auto_18151 ?auto_18150 ) ( ON-TABLE ?auto_18155 ) ( ON ?auto_18153 ?auto_18151 ) ( CLEAR ?auto_18154 ) ( ON ?auto_18152 ?auto_18153 ) ( CLEAR ?auto_18152 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_18155 ?auto_18150 ?auto_18151 ?auto_18153 )
      ( MAKE-2PILE ?auto_18150 ?auto_18151 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_18156 - BLOCK
      ?auto_18157 - BLOCK
    )
    :vars
    (
      ?auto_18160 - BLOCK
      ?auto_18159 - BLOCK
      ?auto_18161 - BLOCK
      ?auto_18158 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18156 ?auto_18157 ) ) ( not ( = ?auto_18156 ?auto_18160 ) ) ( not ( = ?auto_18157 ?auto_18160 ) ) ( ON ?auto_18156 ?auto_18159 ) ( not ( = ?auto_18156 ?auto_18159 ) ) ( not ( = ?auto_18157 ?auto_18159 ) ) ( not ( = ?auto_18160 ?auto_18159 ) ) ( not ( = ?auto_18161 ?auto_18158 ) ) ( not ( = ?auto_18161 ?auto_18160 ) ) ( not ( = ?auto_18161 ?auto_18157 ) ) ( not ( = ?auto_18158 ?auto_18160 ) ) ( not ( = ?auto_18158 ?auto_18157 ) ) ( not ( = ?auto_18156 ?auto_18161 ) ) ( not ( = ?auto_18156 ?auto_18158 ) ) ( not ( = ?auto_18159 ?auto_18161 ) ) ( not ( = ?auto_18159 ?auto_18158 ) ) ( ON ?auto_18157 ?auto_18156 ) ( ON-TABLE ?auto_18159 ) ( ON ?auto_18160 ?auto_18157 ) ( ON ?auto_18158 ?auto_18160 ) ( CLEAR ?auto_18158 ) ( HOLDING ?auto_18161 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_18161 )
      ( MAKE-2PILE ?auto_18156 ?auto_18157 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_18162 - BLOCK
      ?auto_18163 - BLOCK
    )
    :vars
    (
      ?auto_18164 - BLOCK
      ?auto_18167 - BLOCK
      ?auto_18165 - BLOCK
      ?auto_18166 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18162 ?auto_18163 ) ) ( not ( = ?auto_18162 ?auto_18164 ) ) ( not ( = ?auto_18163 ?auto_18164 ) ) ( ON ?auto_18162 ?auto_18167 ) ( not ( = ?auto_18162 ?auto_18167 ) ) ( not ( = ?auto_18163 ?auto_18167 ) ) ( not ( = ?auto_18164 ?auto_18167 ) ) ( not ( = ?auto_18165 ?auto_18166 ) ) ( not ( = ?auto_18165 ?auto_18164 ) ) ( not ( = ?auto_18165 ?auto_18163 ) ) ( not ( = ?auto_18166 ?auto_18164 ) ) ( not ( = ?auto_18166 ?auto_18163 ) ) ( not ( = ?auto_18162 ?auto_18165 ) ) ( not ( = ?auto_18162 ?auto_18166 ) ) ( not ( = ?auto_18167 ?auto_18165 ) ) ( not ( = ?auto_18167 ?auto_18166 ) ) ( ON ?auto_18163 ?auto_18162 ) ( ON-TABLE ?auto_18167 ) ( ON ?auto_18164 ?auto_18163 ) ( ON ?auto_18166 ?auto_18164 ) ( ON ?auto_18165 ?auto_18166 ) ( CLEAR ?auto_18165 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_18167 ?auto_18162 ?auto_18163 ?auto_18164 ?auto_18166 )
      ( MAKE-2PILE ?auto_18162 ?auto_18163 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_18183 - BLOCK
      ?auto_18184 - BLOCK
    )
    :vars
    (
      ?auto_18187 - BLOCK
      ?auto_18186 - BLOCK
      ?auto_18185 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18187 ?auto_18184 ) ( ON-TABLE ?auto_18183 ) ( ON ?auto_18184 ?auto_18183 ) ( not ( = ?auto_18183 ?auto_18184 ) ) ( not ( = ?auto_18183 ?auto_18187 ) ) ( not ( = ?auto_18184 ?auto_18187 ) ) ( not ( = ?auto_18183 ?auto_18186 ) ) ( not ( = ?auto_18183 ?auto_18185 ) ) ( not ( = ?auto_18184 ?auto_18186 ) ) ( not ( = ?auto_18184 ?auto_18185 ) ) ( not ( = ?auto_18187 ?auto_18186 ) ) ( not ( = ?auto_18187 ?auto_18185 ) ) ( not ( = ?auto_18186 ?auto_18185 ) ) ( ON ?auto_18186 ?auto_18187 ) ( CLEAR ?auto_18186 ) ( HOLDING ?auto_18185 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_18185 )
      ( MAKE-2PILE ?auto_18183 ?auto_18184 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_18230 - BLOCK
      ?auto_18231 - BLOCK
      ?auto_18232 - BLOCK
    )
    :vars
    (
      ?auto_18233 - BLOCK
      ?auto_18234 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_18230 ) ( not ( = ?auto_18230 ?auto_18231 ) ) ( not ( = ?auto_18230 ?auto_18232 ) ) ( not ( = ?auto_18231 ?auto_18232 ) ) ( ON ?auto_18232 ?auto_18233 ) ( not ( = ?auto_18230 ?auto_18233 ) ) ( not ( = ?auto_18231 ?auto_18233 ) ) ( not ( = ?auto_18232 ?auto_18233 ) ) ( CLEAR ?auto_18230 ) ( ON ?auto_18231 ?auto_18232 ) ( CLEAR ?auto_18231 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_18234 ) ( ON ?auto_18233 ?auto_18234 ) ( not ( = ?auto_18234 ?auto_18233 ) ) ( not ( = ?auto_18234 ?auto_18232 ) ) ( not ( = ?auto_18234 ?auto_18231 ) ) ( not ( = ?auto_18230 ?auto_18234 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_18234 ?auto_18233 ?auto_18232 )
      ( MAKE-3PILE ?auto_18230 ?auto_18231 ?auto_18232 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_18235 - BLOCK
      ?auto_18236 - BLOCK
      ?auto_18237 - BLOCK
    )
    :vars
    (
      ?auto_18238 - BLOCK
      ?auto_18239 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18235 ?auto_18236 ) ) ( not ( = ?auto_18235 ?auto_18237 ) ) ( not ( = ?auto_18236 ?auto_18237 ) ) ( ON ?auto_18237 ?auto_18238 ) ( not ( = ?auto_18235 ?auto_18238 ) ) ( not ( = ?auto_18236 ?auto_18238 ) ) ( not ( = ?auto_18237 ?auto_18238 ) ) ( ON ?auto_18236 ?auto_18237 ) ( CLEAR ?auto_18236 ) ( ON-TABLE ?auto_18239 ) ( ON ?auto_18238 ?auto_18239 ) ( not ( = ?auto_18239 ?auto_18238 ) ) ( not ( = ?auto_18239 ?auto_18237 ) ) ( not ( = ?auto_18239 ?auto_18236 ) ) ( not ( = ?auto_18235 ?auto_18239 ) ) ( HOLDING ?auto_18235 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_18235 )
      ( MAKE-3PILE ?auto_18235 ?auto_18236 ?auto_18237 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_18240 - BLOCK
      ?auto_18241 - BLOCK
      ?auto_18242 - BLOCK
    )
    :vars
    (
      ?auto_18243 - BLOCK
      ?auto_18244 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18240 ?auto_18241 ) ) ( not ( = ?auto_18240 ?auto_18242 ) ) ( not ( = ?auto_18241 ?auto_18242 ) ) ( ON ?auto_18242 ?auto_18243 ) ( not ( = ?auto_18240 ?auto_18243 ) ) ( not ( = ?auto_18241 ?auto_18243 ) ) ( not ( = ?auto_18242 ?auto_18243 ) ) ( ON ?auto_18241 ?auto_18242 ) ( ON-TABLE ?auto_18244 ) ( ON ?auto_18243 ?auto_18244 ) ( not ( = ?auto_18244 ?auto_18243 ) ) ( not ( = ?auto_18244 ?auto_18242 ) ) ( not ( = ?auto_18244 ?auto_18241 ) ) ( not ( = ?auto_18240 ?auto_18244 ) ) ( ON ?auto_18240 ?auto_18241 ) ( CLEAR ?auto_18240 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_18244 ?auto_18243 ?auto_18242 ?auto_18241 )
      ( MAKE-3PILE ?auto_18240 ?auto_18241 ?auto_18242 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_18248 - BLOCK
      ?auto_18249 - BLOCK
      ?auto_18250 - BLOCK
    )
    :vars
    (
      ?auto_18251 - BLOCK
      ?auto_18252 - BLOCK
      ?auto_18253 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18248 ?auto_18249 ) ) ( not ( = ?auto_18248 ?auto_18250 ) ) ( not ( = ?auto_18249 ?auto_18250 ) ) ( ON ?auto_18250 ?auto_18251 ) ( not ( = ?auto_18248 ?auto_18251 ) ) ( not ( = ?auto_18249 ?auto_18251 ) ) ( not ( = ?auto_18250 ?auto_18251 ) ) ( ON ?auto_18249 ?auto_18250 ) ( CLEAR ?auto_18249 ) ( ON-TABLE ?auto_18252 ) ( ON ?auto_18251 ?auto_18252 ) ( not ( = ?auto_18252 ?auto_18251 ) ) ( not ( = ?auto_18252 ?auto_18250 ) ) ( not ( = ?auto_18252 ?auto_18249 ) ) ( not ( = ?auto_18248 ?auto_18252 ) ) ( ON ?auto_18248 ?auto_18253 ) ( CLEAR ?auto_18248 ) ( HAND-EMPTY ) ( not ( = ?auto_18248 ?auto_18253 ) ) ( not ( = ?auto_18249 ?auto_18253 ) ) ( not ( = ?auto_18250 ?auto_18253 ) ) ( not ( = ?auto_18251 ?auto_18253 ) ) ( not ( = ?auto_18252 ?auto_18253 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_18248 ?auto_18253 )
      ( MAKE-3PILE ?auto_18248 ?auto_18249 ?auto_18250 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_18254 - BLOCK
      ?auto_18255 - BLOCK
      ?auto_18256 - BLOCK
    )
    :vars
    (
      ?auto_18259 - BLOCK
      ?auto_18258 - BLOCK
      ?auto_18257 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18254 ?auto_18255 ) ) ( not ( = ?auto_18254 ?auto_18256 ) ) ( not ( = ?auto_18255 ?auto_18256 ) ) ( ON ?auto_18256 ?auto_18259 ) ( not ( = ?auto_18254 ?auto_18259 ) ) ( not ( = ?auto_18255 ?auto_18259 ) ) ( not ( = ?auto_18256 ?auto_18259 ) ) ( ON-TABLE ?auto_18258 ) ( ON ?auto_18259 ?auto_18258 ) ( not ( = ?auto_18258 ?auto_18259 ) ) ( not ( = ?auto_18258 ?auto_18256 ) ) ( not ( = ?auto_18258 ?auto_18255 ) ) ( not ( = ?auto_18254 ?auto_18258 ) ) ( ON ?auto_18254 ?auto_18257 ) ( CLEAR ?auto_18254 ) ( not ( = ?auto_18254 ?auto_18257 ) ) ( not ( = ?auto_18255 ?auto_18257 ) ) ( not ( = ?auto_18256 ?auto_18257 ) ) ( not ( = ?auto_18259 ?auto_18257 ) ) ( not ( = ?auto_18258 ?auto_18257 ) ) ( HOLDING ?auto_18255 ) ( CLEAR ?auto_18256 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_18258 ?auto_18259 ?auto_18256 ?auto_18255 )
      ( MAKE-3PILE ?auto_18254 ?auto_18255 ?auto_18256 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_18260 - BLOCK
      ?auto_18261 - BLOCK
      ?auto_18262 - BLOCK
    )
    :vars
    (
      ?auto_18264 - BLOCK
      ?auto_18265 - BLOCK
      ?auto_18263 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18260 ?auto_18261 ) ) ( not ( = ?auto_18260 ?auto_18262 ) ) ( not ( = ?auto_18261 ?auto_18262 ) ) ( ON ?auto_18262 ?auto_18264 ) ( not ( = ?auto_18260 ?auto_18264 ) ) ( not ( = ?auto_18261 ?auto_18264 ) ) ( not ( = ?auto_18262 ?auto_18264 ) ) ( ON-TABLE ?auto_18265 ) ( ON ?auto_18264 ?auto_18265 ) ( not ( = ?auto_18265 ?auto_18264 ) ) ( not ( = ?auto_18265 ?auto_18262 ) ) ( not ( = ?auto_18265 ?auto_18261 ) ) ( not ( = ?auto_18260 ?auto_18265 ) ) ( ON ?auto_18260 ?auto_18263 ) ( not ( = ?auto_18260 ?auto_18263 ) ) ( not ( = ?auto_18261 ?auto_18263 ) ) ( not ( = ?auto_18262 ?auto_18263 ) ) ( not ( = ?auto_18264 ?auto_18263 ) ) ( not ( = ?auto_18265 ?auto_18263 ) ) ( CLEAR ?auto_18262 ) ( ON ?auto_18261 ?auto_18260 ) ( CLEAR ?auto_18261 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_18263 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_18263 ?auto_18260 )
      ( MAKE-3PILE ?auto_18260 ?auto_18261 ?auto_18262 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_18266 - BLOCK
      ?auto_18267 - BLOCK
      ?auto_18268 - BLOCK
    )
    :vars
    (
      ?auto_18269 - BLOCK
      ?auto_18271 - BLOCK
      ?auto_18270 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18266 ?auto_18267 ) ) ( not ( = ?auto_18266 ?auto_18268 ) ) ( not ( = ?auto_18267 ?auto_18268 ) ) ( not ( = ?auto_18266 ?auto_18269 ) ) ( not ( = ?auto_18267 ?auto_18269 ) ) ( not ( = ?auto_18268 ?auto_18269 ) ) ( ON-TABLE ?auto_18271 ) ( ON ?auto_18269 ?auto_18271 ) ( not ( = ?auto_18271 ?auto_18269 ) ) ( not ( = ?auto_18271 ?auto_18268 ) ) ( not ( = ?auto_18271 ?auto_18267 ) ) ( not ( = ?auto_18266 ?auto_18271 ) ) ( ON ?auto_18266 ?auto_18270 ) ( not ( = ?auto_18266 ?auto_18270 ) ) ( not ( = ?auto_18267 ?auto_18270 ) ) ( not ( = ?auto_18268 ?auto_18270 ) ) ( not ( = ?auto_18269 ?auto_18270 ) ) ( not ( = ?auto_18271 ?auto_18270 ) ) ( ON ?auto_18267 ?auto_18266 ) ( CLEAR ?auto_18267 ) ( ON-TABLE ?auto_18270 ) ( HOLDING ?auto_18268 ) ( CLEAR ?auto_18269 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_18271 ?auto_18269 ?auto_18268 )
      ( MAKE-3PILE ?auto_18266 ?auto_18267 ?auto_18268 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_18272 - BLOCK
      ?auto_18273 - BLOCK
      ?auto_18274 - BLOCK
    )
    :vars
    (
      ?auto_18276 - BLOCK
      ?auto_18277 - BLOCK
      ?auto_18275 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18272 ?auto_18273 ) ) ( not ( = ?auto_18272 ?auto_18274 ) ) ( not ( = ?auto_18273 ?auto_18274 ) ) ( not ( = ?auto_18272 ?auto_18276 ) ) ( not ( = ?auto_18273 ?auto_18276 ) ) ( not ( = ?auto_18274 ?auto_18276 ) ) ( ON-TABLE ?auto_18277 ) ( ON ?auto_18276 ?auto_18277 ) ( not ( = ?auto_18277 ?auto_18276 ) ) ( not ( = ?auto_18277 ?auto_18274 ) ) ( not ( = ?auto_18277 ?auto_18273 ) ) ( not ( = ?auto_18272 ?auto_18277 ) ) ( ON ?auto_18272 ?auto_18275 ) ( not ( = ?auto_18272 ?auto_18275 ) ) ( not ( = ?auto_18273 ?auto_18275 ) ) ( not ( = ?auto_18274 ?auto_18275 ) ) ( not ( = ?auto_18276 ?auto_18275 ) ) ( not ( = ?auto_18277 ?auto_18275 ) ) ( ON ?auto_18273 ?auto_18272 ) ( ON-TABLE ?auto_18275 ) ( CLEAR ?auto_18276 ) ( ON ?auto_18274 ?auto_18273 ) ( CLEAR ?auto_18274 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_18275 ?auto_18272 ?auto_18273 )
      ( MAKE-3PILE ?auto_18272 ?auto_18273 ?auto_18274 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_18278 - BLOCK
      ?auto_18279 - BLOCK
      ?auto_18280 - BLOCK
    )
    :vars
    (
      ?auto_18283 - BLOCK
      ?auto_18281 - BLOCK
      ?auto_18282 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18278 ?auto_18279 ) ) ( not ( = ?auto_18278 ?auto_18280 ) ) ( not ( = ?auto_18279 ?auto_18280 ) ) ( not ( = ?auto_18278 ?auto_18283 ) ) ( not ( = ?auto_18279 ?auto_18283 ) ) ( not ( = ?auto_18280 ?auto_18283 ) ) ( ON-TABLE ?auto_18281 ) ( not ( = ?auto_18281 ?auto_18283 ) ) ( not ( = ?auto_18281 ?auto_18280 ) ) ( not ( = ?auto_18281 ?auto_18279 ) ) ( not ( = ?auto_18278 ?auto_18281 ) ) ( ON ?auto_18278 ?auto_18282 ) ( not ( = ?auto_18278 ?auto_18282 ) ) ( not ( = ?auto_18279 ?auto_18282 ) ) ( not ( = ?auto_18280 ?auto_18282 ) ) ( not ( = ?auto_18283 ?auto_18282 ) ) ( not ( = ?auto_18281 ?auto_18282 ) ) ( ON ?auto_18279 ?auto_18278 ) ( ON-TABLE ?auto_18282 ) ( ON ?auto_18280 ?auto_18279 ) ( CLEAR ?auto_18280 ) ( HOLDING ?auto_18283 ) ( CLEAR ?auto_18281 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_18281 ?auto_18283 )
      ( MAKE-3PILE ?auto_18278 ?auto_18279 ?auto_18280 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_18284 - BLOCK
      ?auto_18285 - BLOCK
      ?auto_18286 - BLOCK
    )
    :vars
    (
      ?auto_18288 - BLOCK
      ?auto_18287 - BLOCK
      ?auto_18289 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18284 ?auto_18285 ) ) ( not ( = ?auto_18284 ?auto_18286 ) ) ( not ( = ?auto_18285 ?auto_18286 ) ) ( not ( = ?auto_18284 ?auto_18288 ) ) ( not ( = ?auto_18285 ?auto_18288 ) ) ( not ( = ?auto_18286 ?auto_18288 ) ) ( ON-TABLE ?auto_18287 ) ( not ( = ?auto_18287 ?auto_18288 ) ) ( not ( = ?auto_18287 ?auto_18286 ) ) ( not ( = ?auto_18287 ?auto_18285 ) ) ( not ( = ?auto_18284 ?auto_18287 ) ) ( ON ?auto_18284 ?auto_18289 ) ( not ( = ?auto_18284 ?auto_18289 ) ) ( not ( = ?auto_18285 ?auto_18289 ) ) ( not ( = ?auto_18286 ?auto_18289 ) ) ( not ( = ?auto_18288 ?auto_18289 ) ) ( not ( = ?auto_18287 ?auto_18289 ) ) ( ON ?auto_18285 ?auto_18284 ) ( ON-TABLE ?auto_18289 ) ( ON ?auto_18286 ?auto_18285 ) ( CLEAR ?auto_18287 ) ( ON ?auto_18288 ?auto_18286 ) ( CLEAR ?auto_18288 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_18289 ?auto_18284 ?auto_18285 ?auto_18286 )
      ( MAKE-3PILE ?auto_18284 ?auto_18285 ?auto_18286 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_18290 - BLOCK
      ?auto_18291 - BLOCK
      ?auto_18292 - BLOCK
    )
    :vars
    (
      ?auto_18295 - BLOCK
      ?auto_18294 - BLOCK
      ?auto_18293 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18290 ?auto_18291 ) ) ( not ( = ?auto_18290 ?auto_18292 ) ) ( not ( = ?auto_18291 ?auto_18292 ) ) ( not ( = ?auto_18290 ?auto_18295 ) ) ( not ( = ?auto_18291 ?auto_18295 ) ) ( not ( = ?auto_18292 ?auto_18295 ) ) ( not ( = ?auto_18294 ?auto_18295 ) ) ( not ( = ?auto_18294 ?auto_18292 ) ) ( not ( = ?auto_18294 ?auto_18291 ) ) ( not ( = ?auto_18290 ?auto_18294 ) ) ( ON ?auto_18290 ?auto_18293 ) ( not ( = ?auto_18290 ?auto_18293 ) ) ( not ( = ?auto_18291 ?auto_18293 ) ) ( not ( = ?auto_18292 ?auto_18293 ) ) ( not ( = ?auto_18295 ?auto_18293 ) ) ( not ( = ?auto_18294 ?auto_18293 ) ) ( ON ?auto_18291 ?auto_18290 ) ( ON-TABLE ?auto_18293 ) ( ON ?auto_18292 ?auto_18291 ) ( ON ?auto_18295 ?auto_18292 ) ( CLEAR ?auto_18295 ) ( HOLDING ?auto_18294 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_18294 )
      ( MAKE-3PILE ?auto_18290 ?auto_18291 ?auto_18292 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_18296 - BLOCK
      ?auto_18297 - BLOCK
      ?auto_18298 - BLOCK
    )
    :vars
    (
      ?auto_18301 - BLOCK
      ?auto_18300 - BLOCK
      ?auto_18299 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18296 ?auto_18297 ) ) ( not ( = ?auto_18296 ?auto_18298 ) ) ( not ( = ?auto_18297 ?auto_18298 ) ) ( not ( = ?auto_18296 ?auto_18301 ) ) ( not ( = ?auto_18297 ?auto_18301 ) ) ( not ( = ?auto_18298 ?auto_18301 ) ) ( not ( = ?auto_18300 ?auto_18301 ) ) ( not ( = ?auto_18300 ?auto_18298 ) ) ( not ( = ?auto_18300 ?auto_18297 ) ) ( not ( = ?auto_18296 ?auto_18300 ) ) ( ON ?auto_18296 ?auto_18299 ) ( not ( = ?auto_18296 ?auto_18299 ) ) ( not ( = ?auto_18297 ?auto_18299 ) ) ( not ( = ?auto_18298 ?auto_18299 ) ) ( not ( = ?auto_18301 ?auto_18299 ) ) ( not ( = ?auto_18300 ?auto_18299 ) ) ( ON ?auto_18297 ?auto_18296 ) ( ON-TABLE ?auto_18299 ) ( ON ?auto_18298 ?auto_18297 ) ( ON ?auto_18301 ?auto_18298 ) ( ON ?auto_18300 ?auto_18301 ) ( CLEAR ?auto_18300 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_18299 ?auto_18296 ?auto_18297 ?auto_18298 ?auto_18301 )
      ( MAKE-3PILE ?auto_18296 ?auto_18297 ?auto_18298 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_18313 - BLOCK
    )
    :vars
    (
      ?auto_18314 - BLOCK
      ?auto_18316 - BLOCK
      ?auto_18315 - BLOCK
      ?auto_18317 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18314 ?auto_18313 ) ( ON-TABLE ?auto_18313 ) ( not ( = ?auto_18313 ?auto_18314 ) ) ( not ( = ?auto_18313 ?auto_18316 ) ) ( not ( = ?auto_18313 ?auto_18315 ) ) ( not ( = ?auto_18314 ?auto_18316 ) ) ( not ( = ?auto_18314 ?auto_18315 ) ) ( not ( = ?auto_18316 ?auto_18315 ) ) ( ON ?auto_18316 ?auto_18314 ) ( CLEAR ?auto_18316 ) ( HOLDING ?auto_18315 ) ( CLEAR ?auto_18317 ) ( ON-TABLE ?auto_18317 ) ( not ( = ?auto_18317 ?auto_18315 ) ) ( not ( = ?auto_18313 ?auto_18317 ) ) ( not ( = ?auto_18314 ?auto_18317 ) ) ( not ( = ?auto_18316 ?auto_18317 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_18317 ?auto_18315 )
      ( MAKE-1PILE ?auto_18313 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_18318 - BLOCK
    )
    :vars
    (
      ?auto_18321 - BLOCK
      ?auto_18322 - BLOCK
      ?auto_18320 - BLOCK
      ?auto_18319 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18321 ?auto_18318 ) ( ON-TABLE ?auto_18318 ) ( not ( = ?auto_18318 ?auto_18321 ) ) ( not ( = ?auto_18318 ?auto_18322 ) ) ( not ( = ?auto_18318 ?auto_18320 ) ) ( not ( = ?auto_18321 ?auto_18322 ) ) ( not ( = ?auto_18321 ?auto_18320 ) ) ( not ( = ?auto_18322 ?auto_18320 ) ) ( ON ?auto_18322 ?auto_18321 ) ( CLEAR ?auto_18319 ) ( ON-TABLE ?auto_18319 ) ( not ( = ?auto_18319 ?auto_18320 ) ) ( not ( = ?auto_18318 ?auto_18319 ) ) ( not ( = ?auto_18321 ?auto_18319 ) ) ( not ( = ?auto_18322 ?auto_18319 ) ) ( ON ?auto_18320 ?auto_18322 ) ( CLEAR ?auto_18320 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_18318 ?auto_18321 ?auto_18322 )
      ( MAKE-1PILE ?auto_18318 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_18323 - BLOCK
    )
    :vars
    (
      ?auto_18325 - BLOCK
      ?auto_18327 - BLOCK
      ?auto_18326 - BLOCK
      ?auto_18324 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18325 ?auto_18323 ) ( ON-TABLE ?auto_18323 ) ( not ( = ?auto_18323 ?auto_18325 ) ) ( not ( = ?auto_18323 ?auto_18327 ) ) ( not ( = ?auto_18323 ?auto_18326 ) ) ( not ( = ?auto_18325 ?auto_18327 ) ) ( not ( = ?auto_18325 ?auto_18326 ) ) ( not ( = ?auto_18327 ?auto_18326 ) ) ( ON ?auto_18327 ?auto_18325 ) ( not ( = ?auto_18324 ?auto_18326 ) ) ( not ( = ?auto_18323 ?auto_18324 ) ) ( not ( = ?auto_18325 ?auto_18324 ) ) ( not ( = ?auto_18327 ?auto_18324 ) ) ( ON ?auto_18326 ?auto_18327 ) ( CLEAR ?auto_18326 ) ( HOLDING ?auto_18324 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_18324 )
      ( MAKE-1PILE ?auto_18323 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_18334 - BLOCK
    )
    :vars
    (
      ?auto_18337 - BLOCK
      ?auto_18338 - BLOCK
      ?auto_18336 - BLOCK
      ?auto_18335 - BLOCK
      ?auto_18339 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18337 ?auto_18334 ) ( ON-TABLE ?auto_18334 ) ( not ( = ?auto_18334 ?auto_18337 ) ) ( not ( = ?auto_18334 ?auto_18338 ) ) ( not ( = ?auto_18334 ?auto_18336 ) ) ( not ( = ?auto_18337 ?auto_18338 ) ) ( not ( = ?auto_18337 ?auto_18336 ) ) ( not ( = ?auto_18338 ?auto_18336 ) ) ( ON ?auto_18338 ?auto_18337 ) ( not ( = ?auto_18335 ?auto_18336 ) ) ( not ( = ?auto_18334 ?auto_18335 ) ) ( not ( = ?auto_18337 ?auto_18335 ) ) ( not ( = ?auto_18338 ?auto_18335 ) ) ( ON ?auto_18336 ?auto_18338 ) ( CLEAR ?auto_18336 ) ( ON ?auto_18335 ?auto_18339 ) ( CLEAR ?auto_18335 ) ( HAND-EMPTY ) ( not ( = ?auto_18334 ?auto_18339 ) ) ( not ( = ?auto_18337 ?auto_18339 ) ) ( not ( = ?auto_18338 ?auto_18339 ) ) ( not ( = ?auto_18336 ?auto_18339 ) ) ( not ( = ?auto_18335 ?auto_18339 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_18335 ?auto_18339 )
      ( MAKE-1PILE ?auto_18334 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_18340 - BLOCK
    )
    :vars
    (
      ?auto_18344 - BLOCK
      ?auto_18342 - BLOCK
      ?auto_18343 - BLOCK
      ?auto_18341 - BLOCK
      ?auto_18345 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18344 ?auto_18340 ) ( ON-TABLE ?auto_18340 ) ( not ( = ?auto_18340 ?auto_18344 ) ) ( not ( = ?auto_18340 ?auto_18342 ) ) ( not ( = ?auto_18340 ?auto_18343 ) ) ( not ( = ?auto_18344 ?auto_18342 ) ) ( not ( = ?auto_18344 ?auto_18343 ) ) ( not ( = ?auto_18342 ?auto_18343 ) ) ( ON ?auto_18342 ?auto_18344 ) ( not ( = ?auto_18341 ?auto_18343 ) ) ( not ( = ?auto_18340 ?auto_18341 ) ) ( not ( = ?auto_18344 ?auto_18341 ) ) ( not ( = ?auto_18342 ?auto_18341 ) ) ( ON ?auto_18341 ?auto_18345 ) ( CLEAR ?auto_18341 ) ( not ( = ?auto_18340 ?auto_18345 ) ) ( not ( = ?auto_18344 ?auto_18345 ) ) ( not ( = ?auto_18342 ?auto_18345 ) ) ( not ( = ?auto_18343 ?auto_18345 ) ) ( not ( = ?auto_18341 ?auto_18345 ) ) ( HOLDING ?auto_18343 ) ( CLEAR ?auto_18342 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_18340 ?auto_18344 ?auto_18342 ?auto_18343 )
      ( MAKE-1PILE ?auto_18340 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_18374 - BLOCK
      ?auto_18375 - BLOCK
      ?auto_18376 - BLOCK
      ?auto_18377 - BLOCK
    )
    :vars
    (
      ?auto_18378 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_18374 ) ( ON ?auto_18375 ?auto_18374 ) ( not ( = ?auto_18374 ?auto_18375 ) ) ( not ( = ?auto_18374 ?auto_18376 ) ) ( not ( = ?auto_18374 ?auto_18377 ) ) ( not ( = ?auto_18375 ?auto_18376 ) ) ( not ( = ?auto_18375 ?auto_18377 ) ) ( not ( = ?auto_18376 ?auto_18377 ) ) ( ON ?auto_18377 ?auto_18378 ) ( not ( = ?auto_18374 ?auto_18378 ) ) ( not ( = ?auto_18375 ?auto_18378 ) ) ( not ( = ?auto_18376 ?auto_18378 ) ) ( not ( = ?auto_18377 ?auto_18378 ) ) ( CLEAR ?auto_18375 ) ( ON ?auto_18376 ?auto_18377 ) ( CLEAR ?auto_18376 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_18378 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_18378 ?auto_18377 )
      ( MAKE-4PILE ?auto_18374 ?auto_18375 ?auto_18376 ?auto_18377 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_18379 - BLOCK
      ?auto_18380 - BLOCK
      ?auto_18381 - BLOCK
      ?auto_18382 - BLOCK
    )
    :vars
    (
      ?auto_18383 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_18379 ) ( not ( = ?auto_18379 ?auto_18380 ) ) ( not ( = ?auto_18379 ?auto_18381 ) ) ( not ( = ?auto_18379 ?auto_18382 ) ) ( not ( = ?auto_18380 ?auto_18381 ) ) ( not ( = ?auto_18380 ?auto_18382 ) ) ( not ( = ?auto_18381 ?auto_18382 ) ) ( ON ?auto_18382 ?auto_18383 ) ( not ( = ?auto_18379 ?auto_18383 ) ) ( not ( = ?auto_18380 ?auto_18383 ) ) ( not ( = ?auto_18381 ?auto_18383 ) ) ( not ( = ?auto_18382 ?auto_18383 ) ) ( ON ?auto_18381 ?auto_18382 ) ( CLEAR ?auto_18381 ) ( ON-TABLE ?auto_18383 ) ( HOLDING ?auto_18380 ) ( CLEAR ?auto_18379 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_18379 ?auto_18380 )
      ( MAKE-4PILE ?auto_18379 ?auto_18380 ?auto_18381 ?auto_18382 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_18384 - BLOCK
      ?auto_18385 - BLOCK
      ?auto_18386 - BLOCK
      ?auto_18387 - BLOCK
    )
    :vars
    (
      ?auto_18388 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_18384 ) ( not ( = ?auto_18384 ?auto_18385 ) ) ( not ( = ?auto_18384 ?auto_18386 ) ) ( not ( = ?auto_18384 ?auto_18387 ) ) ( not ( = ?auto_18385 ?auto_18386 ) ) ( not ( = ?auto_18385 ?auto_18387 ) ) ( not ( = ?auto_18386 ?auto_18387 ) ) ( ON ?auto_18387 ?auto_18388 ) ( not ( = ?auto_18384 ?auto_18388 ) ) ( not ( = ?auto_18385 ?auto_18388 ) ) ( not ( = ?auto_18386 ?auto_18388 ) ) ( not ( = ?auto_18387 ?auto_18388 ) ) ( ON ?auto_18386 ?auto_18387 ) ( ON-TABLE ?auto_18388 ) ( CLEAR ?auto_18384 ) ( ON ?auto_18385 ?auto_18386 ) ( CLEAR ?auto_18385 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_18388 ?auto_18387 ?auto_18386 )
      ( MAKE-4PILE ?auto_18384 ?auto_18385 ?auto_18386 ?auto_18387 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_18389 - BLOCK
      ?auto_18390 - BLOCK
      ?auto_18391 - BLOCK
      ?auto_18392 - BLOCK
    )
    :vars
    (
      ?auto_18393 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18389 ?auto_18390 ) ) ( not ( = ?auto_18389 ?auto_18391 ) ) ( not ( = ?auto_18389 ?auto_18392 ) ) ( not ( = ?auto_18390 ?auto_18391 ) ) ( not ( = ?auto_18390 ?auto_18392 ) ) ( not ( = ?auto_18391 ?auto_18392 ) ) ( ON ?auto_18392 ?auto_18393 ) ( not ( = ?auto_18389 ?auto_18393 ) ) ( not ( = ?auto_18390 ?auto_18393 ) ) ( not ( = ?auto_18391 ?auto_18393 ) ) ( not ( = ?auto_18392 ?auto_18393 ) ) ( ON ?auto_18391 ?auto_18392 ) ( ON-TABLE ?auto_18393 ) ( ON ?auto_18390 ?auto_18391 ) ( CLEAR ?auto_18390 ) ( HOLDING ?auto_18389 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_18389 )
      ( MAKE-4PILE ?auto_18389 ?auto_18390 ?auto_18391 ?auto_18392 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_18394 - BLOCK
      ?auto_18395 - BLOCK
      ?auto_18396 - BLOCK
      ?auto_18397 - BLOCK
    )
    :vars
    (
      ?auto_18398 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18394 ?auto_18395 ) ) ( not ( = ?auto_18394 ?auto_18396 ) ) ( not ( = ?auto_18394 ?auto_18397 ) ) ( not ( = ?auto_18395 ?auto_18396 ) ) ( not ( = ?auto_18395 ?auto_18397 ) ) ( not ( = ?auto_18396 ?auto_18397 ) ) ( ON ?auto_18397 ?auto_18398 ) ( not ( = ?auto_18394 ?auto_18398 ) ) ( not ( = ?auto_18395 ?auto_18398 ) ) ( not ( = ?auto_18396 ?auto_18398 ) ) ( not ( = ?auto_18397 ?auto_18398 ) ) ( ON ?auto_18396 ?auto_18397 ) ( ON-TABLE ?auto_18398 ) ( ON ?auto_18395 ?auto_18396 ) ( ON ?auto_18394 ?auto_18395 ) ( CLEAR ?auto_18394 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_18398 ?auto_18397 ?auto_18396 ?auto_18395 )
      ( MAKE-4PILE ?auto_18394 ?auto_18395 ?auto_18396 ?auto_18397 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_18403 - BLOCK
      ?auto_18404 - BLOCK
      ?auto_18405 - BLOCK
      ?auto_18406 - BLOCK
    )
    :vars
    (
      ?auto_18407 - BLOCK
      ?auto_18408 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18403 ?auto_18404 ) ) ( not ( = ?auto_18403 ?auto_18405 ) ) ( not ( = ?auto_18403 ?auto_18406 ) ) ( not ( = ?auto_18404 ?auto_18405 ) ) ( not ( = ?auto_18404 ?auto_18406 ) ) ( not ( = ?auto_18405 ?auto_18406 ) ) ( ON ?auto_18406 ?auto_18407 ) ( not ( = ?auto_18403 ?auto_18407 ) ) ( not ( = ?auto_18404 ?auto_18407 ) ) ( not ( = ?auto_18405 ?auto_18407 ) ) ( not ( = ?auto_18406 ?auto_18407 ) ) ( ON ?auto_18405 ?auto_18406 ) ( ON-TABLE ?auto_18407 ) ( ON ?auto_18404 ?auto_18405 ) ( CLEAR ?auto_18404 ) ( ON ?auto_18403 ?auto_18408 ) ( CLEAR ?auto_18403 ) ( HAND-EMPTY ) ( not ( = ?auto_18403 ?auto_18408 ) ) ( not ( = ?auto_18404 ?auto_18408 ) ) ( not ( = ?auto_18405 ?auto_18408 ) ) ( not ( = ?auto_18406 ?auto_18408 ) ) ( not ( = ?auto_18407 ?auto_18408 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_18403 ?auto_18408 )
      ( MAKE-4PILE ?auto_18403 ?auto_18404 ?auto_18405 ?auto_18406 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_18409 - BLOCK
      ?auto_18410 - BLOCK
      ?auto_18411 - BLOCK
      ?auto_18412 - BLOCK
    )
    :vars
    (
      ?auto_18413 - BLOCK
      ?auto_18414 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18409 ?auto_18410 ) ) ( not ( = ?auto_18409 ?auto_18411 ) ) ( not ( = ?auto_18409 ?auto_18412 ) ) ( not ( = ?auto_18410 ?auto_18411 ) ) ( not ( = ?auto_18410 ?auto_18412 ) ) ( not ( = ?auto_18411 ?auto_18412 ) ) ( ON ?auto_18412 ?auto_18413 ) ( not ( = ?auto_18409 ?auto_18413 ) ) ( not ( = ?auto_18410 ?auto_18413 ) ) ( not ( = ?auto_18411 ?auto_18413 ) ) ( not ( = ?auto_18412 ?auto_18413 ) ) ( ON ?auto_18411 ?auto_18412 ) ( ON-TABLE ?auto_18413 ) ( ON ?auto_18409 ?auto_18414 ) ( CLEAR ?auto_18409 ) ( not ( = ?auto_18409 ?auto_18414 ) ) ( not ( = ?auto_18410 ?auto_18414 ) ) ( not ( = ?auto_18411 ?auto_18414 ) ) ( not ( = ?auto_18412 ?auto_18414 ) ) ( not ( = ?auto_18413 ?auto_18414 ) ) ( HOLDING ?auto_18410 ) ( CLEAR ?auto_18411 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_18413 ?auto_18412 ?auto_18411 ?auto_18410 )
      ( MAKE-4PILE ?auto_18409 ?auto_18410 ?auto_18411 ?auto_18412 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_18415 - BLOCK
      ?auto_18416 - BLOCK
      ?auto_18417 - BLOCK
      ?auto_18418 - BLOCK
    )
    :vars
    (
      ?auto_18420 - BLOCK
      ?auto_18419 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18415 ?auto_18416 ) ) ( not ( = ?auto_18415 ?auto_18417 ) ) ( not ( = ?auto_18415 ?auto_18418 ) ) ( not ( = ?auto_18416 ?auto_18417 ) ) ( not ( = ?auto_18416 ?auto_18418 ) ) ( not ( = ?auto_18417 ?auto_18418 ) ) ( ON ?auto_18418 ?auto_18420 ) ( not ( = ?auto_18415 ?auto_18420 ) ) ( not ( = ?auto_18416 ?auto_18420 ) ) ( not ( = ?auto_18417 ?auto_18420 ) ) ( not ( = ?auto_18418 ?auto_18420 ) ) ( ON ?auto_18417 ?auto_18418 ) ( ON-TABLE ?auto_18420 ) ( ON ?auto_18415 ?auto_18419 ) ( not ( = ?auto_18415 ?auto_18419 ) ) ( not ( = ?auto_18416 ?auto_18419 ) ) ( not ( = ?auto_18417 ?auto_18419 ) ) ( not ( = ?auto_18418 ?auto_18419 ) ) ( not ( = ?auto_18420 ?auto_18419 ) ) ( CLEAR ?auto_18417 ) ( ON ?auto_18416 ?auto_18415 ) ( CLEAR ?auto_18416 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_18419 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_18419 ?auto_18415 )
      ( MAKE-4PILE ?auto_18415 ?auto_18416 ?auto_18417 ?auto_18418 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_18421 - BLOCK
      ?auto_18422 - BLOCK
      ?auto_18423 - BLOCK
      ?auto_18424 - BLOCK
    )
    :vars
    (
      ?auto_18426 - BLOCK
      ?auto_18425 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18421 ?auto_18422 ) ) ( not ( = ?auto_18421 ?auto_18423 ) ) ( not ( = ?auto_18421 ?auto_18424 ) ) ( not ( = ?auto_18422 ?auto_18423 ) ) ( not ( = ?auto_18422 ?auto_18424 ) ) ( not ( = ?auto_18423 ?auto_18424 ) ) ( ON ?auto_18424 ?auto_18426 ) ( not ( = ?auto_18421 ?auto_18426 ) ) ( not ( = ?auto_18422 ?auto_18426 ) ) ( not ( = ?auto_18423 ?auto_18426 ) ) ( not ( = ?auto_18424 ?auto_18426 ) ) ( ON-TABLE ?auto_18426 ) ( ON ?auto_18421 ?auto_18425 ) ( not ( = ?auto_18421 ?auto_18425 ) ) ( not ( = ?auto_18422 ?auto_18425 ) ) ( not ( = ?auto_18423 ?auto_18425 ) ) ( not ( = ?auto_18424 ?auto_18425 ) ) ( not ( = ?auto_18426 ?auto_18425 ) ) ( ON ?auto_18422 ?auto_18421 ) ( CLEAR ?auto_18422 ) ( ON-TABLE ?auto_18425 ) ( HOLDING ?auto_18423 ) ( CLEAR ?auto_18424 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_18426 ?auto_18424 ?auto_18423 )
      ( MAKE-4PILE ?auto_18421 ?auto_18422 ?auto_18423 ?auto_18424 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_18427 - BLOCK
      ?auto_18428 - BLOCK
      ?auto_18429 - BLOCK
      ?auto_18430 - BLOCK
    )
    :vars
    (
      ?auto_18431 - BLOCK
      ?auto_18432 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18427 ?auto_18428 ) ) ( not ( = ?auto_18427 ?auto_18429 ) ) ( not ( = ?auto_18427 ?auto_18430 ) ) ( not ( = ?auto_18428 ?auto_18429 ) ) ( not ( = ?auto_18428 ?auto_18430 ) ) ( not ( = ?auto_18429 ?auto_18430 ) ) ( ON ?auto_18430 ?auto_18431 ) ( not ( = ?auto_18427 ?auto_18431 ) ) ( not ( = ?auto_18428 ?auto_18431 ) ) ( not ( = ?auto_18429 ?auto_18431 ) ) ( not ( = ?auto_18430 ?auto_18431 ) ) ( ON-TABLE ?auto_18431 ) ( ON ?auto_18427 ?auto_18432 ) ( not ( = ?auto_18427 ?auto_18432 ) ) ( not ( = ?auto_18428 ?auto_18432 ) ) ( not ( = ?auto_18429 ?auto_18432 ) ) ( not ( = ?auto_18430 ?auto_18432 ) ) ( not ( = ?auto_18431 ?auto_18432 ) ) ( ON ?auto_18428 ?auto_18427 ) ( ON-TABLE ?auto_18432 ) ( CLEAR ?auto_18430 ) ( ON ?auto_18429 ?auto_18428 ) ( CLEAR ?auto_18429 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_18432 ?auto_18427 ?auto_18428 )
      ( MAKE-4PILE ?auto_18427 ?auto_18428 ?auto_18429 ?auto_18430 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_18433 - BLOCK
      ?auto_18434 - BLOCK
      ?auto_18435 - BLOCK
      ?auto_18436 - BLOCK
    )
    :vars
    (
      ?auto_18437 - BLOCK
      ?auto_18438 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18433 ?auto_18434 ) ) ( not ( = ?auto_18433 ?auto_18435 ) ) ( not ( = ?auto_18433 ?auto_18436 ) ) ( not ( = ?auto_18434 ?auto_18435 ) ) ( not ( = ?auto_18434 ?auto_18436 ) ) ( not ( = ?auto_18435 ?auto_18436 ) ) ( not ( = ?auto_18433 ?auto_18437 ) ) ( not ( = ?auto_18434 ?auto_18437 ) ) ( not ( = ?auto_18435 ?auto_18437 ) ) ( not ( = ?auto_18436 ?auto_18437 ) ) ( ON-TABLE ?auto_18437 ) ( ON ?auto_18433 ?auto_18438 ) ( not ( = ?auto_18433 ?auto_18438 ) ) ( not ( = ?auto_18434 ?auto_18438 ) ) ( not ( = ?auto_18435 ?auto_18438 ) ) ( not ( = ?auto_18436 ?auto_18438 ) ) ( not ( = ?auto_18437 ?auto_18438 ) ) ( ON ?auto_18434 ?auto_18433 ) ( ON-TABLE ?auto_18438 ) ( ON ?auto_18435 ?auto_18434 ) ( CLEAR ?auto_18435 ) ( HOLDING ?auto_18436 ) ( CLEAR ?auto_18437 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_18437 ?auto_18436 )
      ( MAKE-4PILE ?auto_18433 ?auto_18434 ?auto_18435 ?auto_18436 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_18439 - BLOCK
      ?auto_18440 - BLOCK
      ?auto_18441 - BLOCK
      ?auto_18442 - BLOCK
    )
    :vars
    (
      ?auto_18443 - BLOCK
      ?auto_18444 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18439 ?auto_18440 ) ) ( not ( = ?auto_18439 ?auto_18441 ) ) ( not ( = ?auto_18439 ?auto_18442 ) ) ( not ( = ?auto_18440 ?auto_18441 ) ) ( not ( = ?auto_18440 ?auto_18442 ) ) ( not ( = ?auto_18441 ?auto_18442 ) ) ( not ( = ?auto_18439 ?auto_18443 ) ) ( not ( = ?auto_18440 ?auto_18443 ) ) ( not ( = ?auto_18441 ?auto_18443 ) ) ( not ( = ?auto_18442 ?auto_18443 ) ) ( ON-TABLE ?auto_18443 ) ( ON ?auto_18439 ?auto_18444 ) ( not ( = ?auto_18439 ?auto_18444 ) ) ( not ( = ?auto_18440 ?auto_18444 ) ) ( not ( = ?auto_18441 ?auto_18444 ) ) ( not ( = ?auto_18442 ?auto_18444 ) ) ( not ( = ?auto_18443 ?auto_18444 ) ) ( ON ?auto_18440 ?auto_18439 ) ( ON-TABLE ?auto_18444 ) ( ON ?auto_18441 ?auto_18440 ) ( CLEAR ?auto_18443 ) ( ON ?auto_18442 ?auto_18441 ) ( CLEAR ?auto_18442 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_18444 ?auto_18439 ?auto_18440 ?auto_18441 )
      ( MAKE-4PILE ?auto_18439 ?auto_18440 ?auto_18441 ?auto_18442 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_18445 - BLOCK
      ?auto_18446 - BLOCK
      ?auto_18447 - BLOCK
      ?auto_18448 - BLOCK
    )
    :vars
    (
      ?auto_18449 - BLOCK
      ?auto_18450 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18445 ?auto_18446 ) ) ( not ( = ?auto_18445 ?auto_18447 ) ) ( not ( = ?auto_18445 ?auto_18448 ) ) ( not ( = ?auto_18446 ?auto_18447 ) ) ( not ( = ?auto_18446 ?auto_18448 ) ) ( not ( = ?auto_18447 ?auto_18448 ) ) ( not ( = ?auto_18445 ?auto_18449 ) ) ( not ( = ?auto_18446 ?auto_18449 ) ) ( not ( = ?auto_18447 ?auto_18449 ) ) ( not ( = ?auto_18448 ?auto_18449 ) ) ( ON ?auto_18445 ?auto_18450 ) ( not ( = ?auto_18445 ?auto_18450 ) ) ( not ( = ?auto_18446 ?auto_18450 ) ) ( not ( = ?auto_18447 ?auto_18450 ) ) ( not ( = ?auto_18448 ?auto_18450 ) ) ( not ( = ?auto_18449 ?auto_18450 ) ) ( ON ?auto_18446 ?auto_18445 ) ( ON-TABLE ?auto_18450 ) ( ON ?auto_18447 ?auto_18446 ) ( ON ?auto_18448 ?auto_18447 ) ( CLEAR ?auto_18448 ) ( HOLDING ?auto_18449 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_18449 )
      ( MAKE-4PILE ?auto_18445 ?auto_18446 ?auto_18447 ?auto_18448 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_18451 - BLOCK
      ?auto_18452 - BLOCK
      ?auto_18453 - BLOCK
      ?auto_18454 - BLOCK
    )
    :vars
    (
      ?auto_18455 - BLOCK
      ?auto_18456 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18451 ?auto_18452 ) ) ( not ( = ?auto_18451 ?auto_18453 ) ) ( not ( = ?auto_18451 ?auto_18454 ) ) ( not ( = ?auto_18452 ?auto_18453 ) ) ( not ( = ?auto_18452 ?auto_18454 ) ) ( not ( = ?auto_18453 ?auto_18454 ) ) ( not ( = ?auto_18451 ?auto_18455 ) ) ( not ( = ?auto_18452 ?auto_18455 ) ) ( not ( = ?auto_18453 ?auto_18455 ) ) ( not ( = ?auto_18454 ?auto_18455 ) ) ( ON ?auto_18451 ?auto_18456 ) ( not ( = ?auto_18451 ?auto_18456 ) ) ( not ( = ?auto_18452 ?auto_18456 ) ) ( not ( = ?auto_18453 ?auto_18456 ) ) ( not ( = ?auto_18454 ?auto_18456 ) ) ( not ( = ?auto_18455 ?auto_18456 ) ) ( ON ?auto_18452 ?auto_18451 ) ( ON-TABLE ?auto_18456 ) ( ON ?auto_18453 ?auto_18452 ) ( ON ?auto_18454 ?auto_18453 ) ( ON ?auto_18455 ?auto_18454 ) ( CLEAR ?auto_18455 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_18456 ?auto_18451 ?auto_18452 ?auto_18453 ?auto_18454 )
      ( MAKE-4PILE ?auto_18451 ?auto_18452 ?auto_18453 ?auto_18454 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_18467 - BLOCK
      ?auto_18468 - BLOCK
      ?auto_18469 - BLOCK
      ?auto_18470 - BLOCK
      ?auto_18471 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_18470 ) ( ON-TABLE ?auto_18467 ) ( ON ?auto_18468 ?auto_18467 ) ( ON ?auto_18469 ?auto_18468 ) ( ON ?auto_18470 ?auto_18469 ) ( not ( = ?auto_18467 ?auto_18468 ) ) ( not ( = ?auto_18467 ?auto_18469 ) ) ( not ( = ?auto_18467 ?auto_18470 ) ) ( not ( = ?auto_18467 ?auto_18471 ) ) ( not ( = ?auto_18468 ?auto_18469 ) ) ( not ( = ?auto_18468 ?auto_18470 ) ) ( not ( = ?auto_18468 ?auto_18471 ) ) ( not ( = ?auto_18469 ?auto_18470 ) ) ( not ( = ?auto_18469 ?auto_18471 ) ) ( not ( = ?auto_18470 ?auto_18471 ) ) ( ON-TABLE ?auto_18471 ) ( CLEAR ?auto_18471 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_18471 )
      ( MAKE-5PILE ?auto_18467 ?auto_18468 ?auto_18469 ?auto_18470 ?auto_18471 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_18472 - BLOCK
      ?auto_18473 - BLOCK
      ?auto_18474 - BLOCK
      ?auto_18475 - BLOCK
      ?auto_18476 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_18472 ) ( ON ?auto_18473 ?auto_18472 ) ( ON ?auto_18474 ?auto_18473 ) ( not ( = ?auto_18472 ?auto_18473 ) ) ( not ( = ?auto_18472 ?auto_18474 ) ) ( not ( = ?auto_18472 ?auto_18475 ) ) ( not ( = ?auto_18472 ?auto_18476 ) ) ( not ( = ?auto_18473 ?auto_18474 ) ) ( not ( = ?auto_18473 ?auto_18475 ) ) ( not ( = ?auto_18473 ?auto_18476 ) ) ( not ( = ?auto_18474 ?auto_18475 ) ) ( not ( = ?auto_18474 ?auto_18476 ) ) ( not ( = ?auto_18475 ?auto_18476 ) ) ( ON-TABLE ?auto_18476 ) ( CLEAR ?auto_18476 ) ( HOLDING ?auto_18475 ) ( CLEAR ?auto_18474 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_18472 ?auto_18473 ?auto_18474 ?auto_18475 )
      ( MAKE-5PILE ?auto_18472 ?auto_18473 ?auto_18474 ?auto_18475 ?auto_18476 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_18477 - BLOCK
      ?auto_18478 - BLOCK
      ?auto_18479 - BLOCK
      ?auto_18480 - BLOCK
      ?auto_18481 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_18477 ) ( ON ?auto_18478 ?auto_18477 ) ( ON ?auto_18479 ?auto_18478 ) ( not ( = ?auto_18477 ?auto_18478 ) ) ( not ( = ?auto_18477 ?auto_18479 ) ) ( not ( = ?auto_18477 ?auto_18480 ) ) ( not ( = ?auto_18477 ?auto_18481 ) ) ( not ( = ?auto_18478 ?auto_18479 ) ) ( not ( = ?auto_18478 ?auto_18480 ) ) ( not ( = ?auto_18478 ?auto_18481 ) ) ( not ( = ?auto_18479 ?auto_18480 ) ) ( not ( = ?auto_18479 ?auto_18481 ) ) ( not ( = ?auto_18480 ?auto_18481 ) ) ( ON-TABLE ?auto_18481 ) ( CLEAR ?auto_18479 ) ( ON ?auto_18480 ?auto_18481 ) ( CLEAR ?auto_18480 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_18481 )
      ( MAKE-5PILE ?auto_18477 ?auto_18478 ?auto_18479 ?auto_18480 ?auto_18481 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_18482 - BLOCK
      ?auto_18483 - BLOCK
      ?auto_18484 - BLOCK
      ?auto_18485 - BLOCK
      ?auto_18486 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_18482 ) ( ON ?auto_18483 ?auto_18482 ) ( not ( = ?auto_18482 ?auto_18483 ) ) ( not ( = ?auto_18482 ?auto_18484 ) ) ( not ( = ?auto_18482 ?auto_18485 ) ) ( not ( = ?auto_18482 ?auto_18486 ) ) ( not ( = ?auto_18483 ?auto_18484 ) ) ( not ( = ?auto_18483 ?auto_18485 ) ) ( not ( = ?auto_18483 ?auto_18486 ) ) ( not ( = ?auto_18484 ?auto_18485 ) ) ( not ( = ?auto_18484 ?auto_18486 ) ) ( not ( = ?auto_18485 ?auto_18486 ) ) ( ON-TABLE ?auto_18486 ) ( ON ?auto_18485 ?auto_18486 ) ( CLEAR ?auto_18485 ) ( HOLDING ?auto_18484 ) ( CLEAR ?auto_18483 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_18482 ?auto_18483 ?auto_18484 )
      ( MAKE-5PILE ?auto_18482 ?auto_18483 ?auto_18484 ?auto_18485 ?auto_18486 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_18487 - BLOCK
      ?auto_18488 - BLOCK
      ?auto_18489 - BLOCK
      ?auto_18490 - BLOCK
      ?auto_18491 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_18487 ) ( ON ?auto_18488 ?auto_18487 ) ( not ( = ?auto_18487 ?auto_18488 ) ) ( not ( = ?auto_18487 ?auto_18489 ) ) ( not ( = ?auto_18487 ?auto_18490 ) ) ( not ( = ?auto_18487 ?auto_18491 ) ) ( not ( = ?auto_18488 ?auto_18489 ) ) ( not ( = ?auto_18488 ?auto_18490 ) ) ( not ( = ?auto_18488 ?auto_18491 ) ) ( not ( = ?auto_18489 ?auto_18490 ) ) ( not ( = ?auto_18489 ?auto_18491 ) ) ( not ( = ?auto_18490 ?auto_18491 ) ) ( ON-TABLE ?auto_18491 ) ( ON ?auto_18490 ?auto_18491 ) ( CLEAR ?auto_18488 ) ( ON ?auto_18489 ?auto_18490 ) ( CLEAR ?auto_18489 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_18491 ?auto_18490 )
      ( MAKE-5PILE ?auto_18487 ?auto_18488 ?auto_18489 ?auto_18490 ?auto_18491 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_18492 - BLOCK
      ?auto_18493 - BLOCK
      ?auto_18494 - BLOCK
      ?auto_18495 - BLOCK
      ?auto_18496 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_18492 ) ( not ( = ?auto_18492 ?auto_18493 ) ) ( not ( = ?auto_18492 ?auto_18494 ) ) ( not ( = ?auto_18492 ?auto_18495 ) ) ( not ( = ?auto_18492 ?auto_18496 ) ) ( not ( = ?auto_18493 ?auto_18494 ) ) ( not ( = ?auto_18493 ?auto_18495 ) ) ( not ( = ?auto_18493 ?auto_18496 ) ) ( not ( = ?auto_18494 ?auto_18495 ) ) ( not ( = ?auto_18494 ?auto_18496 ) ) ( not ( = ?auto_18495 ?auto_18496 ) ) ( ON-TABLE ?auto_18496 ) ( ON ?auto_18495 ?auto_18496 ) ( ON ?auto_18494 ?auto_18495 ) ( CLEAR ?auto_18494 ) ( HOLDING ?auto_18493 ) ( CLEAR ?auto_18492 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_18492 ?auto_18493 )
      ( MAKE-5PILE ?auto_18492 ?auto_18493 ?auto_18494 ?auto_18495 ?auto_18496 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_18497 - BLOCK
      ?auto_18498 - BLOCK
      ?auto_18499 - BLOCK
      ?auto_18500 - BLOCK
      ?auto_18501 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_18497 ) ( not ( = ?auto_18497 ?auto_18498 ) ) ( not ( = ?auto_18497 ?auto_18499 ) ) ( not ( = ?auto_18497 ?auto_18500 ) ) ( not ( = ?auto_18497 ?auto_18501 ) ) ( not ( = ?auto_18498 ?auto_18499 ) ) ( not ( = ?auto_18498 ?auto_18500 ) ) ( not ( = ?auto_18498 ?auto_18501 ) ) ( not ( = ?auto_18499 ?auto_18500 ) ) ( not ( = ?auto_18499 ?auto_18501 ) ) ( not ( = ?auto_18500 ?auto_18501 ) ) ( ON-TABLE ?auto_18501 ) ( ON ?auto_18500 ?auto_18501 ) ( ON ?auto_18499 ?auto_18500 ) ( CLEAR ?auto_18497 ) ( ON ?auto_18498 ?auto_18499 ) ( CLEAR ?auto_18498 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_18501 ?auto_18500 ?auto_18499 )
      ( MAKE-5PILE ?auto_18497 ?auto_18498 ?auto_18499 ?auto_18500 ?auto_18501 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_18502 - BLOCK
      ?auto_18503 - BLOCK
      ?auto_18504 - BLOCK
      ?auto_18505 - BLOCK
      ?auto_18506 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18502 ?auto_18503 ) ) ( not ( = ?auto_18502 ?auto_18504 ) ) ( not ( = ?auto_18502 ?auto_18505 ) ) ( not ( = ?auto_18502 ?auto_18506 ) ) ( not ( = ?auto_18503 ?auto_18504 ) ) ( not ( = ?auto_18503 ?auto_18505 ) ) ( not ( = ?auto_18503 ?auto_18506 ) ) ( not ( = ?auto_18504 ?auto_18505 ) ) ( not ( = ?auto_18504 ?auto_18506 ) ) ( not ( = ?auto_18505 ?auto_18506 ) ) ( ON-TABLE ?auto_18506 ) ( ON ?auto_18505 ?auto_18506 ) ( ON ?auto_18504 ?auto_18505 ) ( ON ?auto_18503 ?auto_18504 ) ( CLEAR ?auto_18503 ) ( HOLDING ?auto_18502 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_18502 )
      ( MAKE-5PILE ?auto_18502 ?auto_18503 ?auto_18504 ?auto_18505 ?auto_18506 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_18507 - BLOCK
      ?auto_18508 - BLOCK
      ?auto_18509 - BLOCK
      ?auto_18510 - BLOCK
      ?auto_18511 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18507 ?auto_18508 ) ) ( not ( = ?auto_18507 ?auto_18509 ) ) ( not ( = ?auto_18507 ?auto_18510 ) ) ( not ( = ?auto_18507 ?auto_18511 ) ) ( not ( = ?auto_18508 ?auto_18509 ) ) ( not ( = ?auto_18508 ?auto_18510 ) ) ( not ( = ?auto_18508 ?auto_18511 ) ) ( not ( = ?auto_18509 ?auto_18510 ) ) ( not ( = ?auto_18509 ?auto_18511 ) ) ( not ( = ?auto_18510 ?auto_18511 ) ) ( ON-TABLE ?auto_18511 ) ( ON ?auto_18510 ?auto_18511 ) ( ON ?auto_18509 ?auto_18510 ) ( ON ?auto_18508 ?auto_18509 ) ( ON ?auto_18507 ?auto_18508 ) ( CLEAR ?auto_18507 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_18511 ?auto_18510 ?auto_18509 ?auto_18508 )
      ( MAKE-5PILE ?auto_18507 ?auto_18508 ?auto_18509 ?auto_18510 ?auto_18511 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_18517 - BLOCK
      ?auto_18518 - BLOCK
      ?auto_18519 - BLOCK
      ?auto_18520 - BLOCK
      ?auto_18521 - BLOCK
    )
    :vars
    (
      ?auto_18522 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18517 ?auto_18518 ) ) ( not ( = ?auto_18517 ?auto_18519 ) ) ( not ( = ?auto_18517 ?auto_18520 ) ) ( not ( = ?auto_18517 ?auto_18521 ) ) ( not ( = ?auto_18518 ?auto_18519 ) ) ( not ( = ?auto_18518 ?auto_18520 ) ) ( not ( = ?auto_18518 ?auto_18521 ) ) ( not ( = ?auto_18519 ?auto_18520 ) ) ( not ( = ?auto_18519 ?auto_18521 ) ) ( not ( = ?auto_18520 ?auto_18521 ) ) ( ON-TABLE ?auto_18521 ) ( ON ?auto_18520 ?auto_18521 ) ( ON ?auto_18519 ?auto_18520 ) ( ON ?auto_18518 ?auto_18519 ) ( CLEAR ?auto_18518 ) ( ON ?auto_18517 ?auto_18522 ) ( CLEAR ?auto_18517 ) ( HAND-EMPTY ) ( not ( = ?auto_18517 ?auto_18522 ) ) ( not ( = ?auto_18518 ?auto_18522 ) ) ( not ( = ?auto_18519 ?auto_18522 ) ) ( not ( = ?auto_18520 ?auto_18522 ) ) ( not ( = ?auto_18521 ?auto_18522 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_18517 ?auto_18522 )
      ( MAKE-5PILE ?auto_18517 ?auto_18518 ?auto_18519 ?auto_18520 ?auto_18521 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_18523 - BLOCK
      ?auto_18524 - BLOCK
      ?auto_18525 - BLOCK
      ?auto_18526 - BLOCK
      ?auto_18527 - BLOCK
    )
    :vars
    (
      ?auto_18528 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18523 ?auto_18524 ) ) ( not ( = ?auto_18523 ?auto_18525 ) ) ( not ( = ?auto_18523 ?auto_18526 ) ) ( not ( = ?auto_18523 ?auto_18527 ) ) ( not ( = ?auto_18524 ?auto_18525 ) ) ( not ( = ?auto_18524 ?auto_18526 ) ) ( not ( = ?auto_18524 ?auto_18527 ) ) ( not ( = ?auto_18525 ?auto_18526 ) ) ( not ( = ?auto_18525 ?auto_18527 ) ) ( not ( = ?auto_18526 ?auto_18527 ) ) ( ON-TABLE ?auto_18527 ) ( ON ?auto_18526 ?auto_18527 ) ( ON ?auto_18525 ?auto_18526 ) ( ON ?auto_18523 ?auto_18528 ) ( CLEAR ?auto_18523 ) ( not ( = ?auto_18523 ?auto_18528 ) ) ( not ( = ?auto_18524 ?auto_18528 ) ) ( not ( = ?auto_18525 ?auto_18528 ) ) ( not ( = ?auto_18526 ?auto_18528 ) ) ( not ( = ?auto_18527 ?auto_18528 ) ) ( HOLDING ?auto_18524 ) ( CLEAR ?auto_18525 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_18527 ?auto_18526 ?auto_18525 ?auto_18524 )
      ( MAKE-5PILE ?auto_18523 ?auto_18524 ?auto_18525 ?auto_18526 ?auto_18527 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_18529 - BLOCK
      ?auto_18530 - BLOCK
      ?auto_18531 - BLOCK
      ?auto_18532 - BLOCK
      ?auto_18533 - BLOCK
    )
    :vars
    (
      ?auto_18534 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18529 ?auto_18530 ) ) ( not ( = ?auto_18529 ?auto_18531 ) ) ( not ( = ?auto_18529 ?auto_18532 ) ) ( not ( = ?auto_18529 ?auto_18533 ) ) ( not ( = ?auto_18530 ?auto_18531 ) ) ( not ( = ?auto_18530 ?auto_18532 ) ) ( not ( = ?auto_18530 ?auto_18533 ) ) ( not ( = ?auto_18531 ?auto_18532 ) ) ( not ( = ?auto_18531 ?auto_18533 ) ) ( not ( = ?auto_18532 ?auto_18533 ) ) ( ON-TABLE ?auto_18533 ) ( ON ?auto_18532 ?auto_18533 ) ( ON ?auto_18531 ?auto_18532 ) ( ON ?auto_18529 ?auto_18534 ) ( not ( = ?auto_18529 ?auto_18534 ) ) ( not ( = ?auto_18530 ?auto_18534 ) ) ( not ( = ?auto_18531 ?auto_18534 ) ) ( not ( = ?auto_18532 ?auto_18534 ) ) ( not ( = ?auto_18533 ?auto_18534 ) ) ( CLEAR ?auto_18531 ) ( ON ?auto_18530 ?auto_18529 ) ( CLEAR ?auto_18530 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_18534 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_18534 ?auto_18529 )
      ( MAKE-5PILE ?auto_18529 ?auto_18530 ?auto_18531 ?auto_18532 ?auto_18533 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_18535 - BLOCK
      ?auto_18536 - BLOCK
      ?auto_18537 - BLOCK
      ?auto_18538 - BLOCK
      ?auto_18539 - BLOCK
    )
    :vars
    (
      ?auto_18540 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18535 ?auto_18536 ) ) ( not ( = ?auto_18535 ?auto_18537 ) ) ( not ( = ?auto_18535 ?auto_18538 ) ) ( not ( = ?auto_18535 ?auto_18539 ) ) ( not ( = ?auto_18536 ?auto_18537 ) ) ( not ( = ?auto_18536 ?auto_18538 ) ) ( not ( = ?auto_18536 ?auto_18539 ) ) ( not ( = ?auto_18537 ?auto_18538 ) ) ( not ( = ?auto_18537 ?auto_18539 ) ) ( not ( = ?auto_18538 ?auto_18539 ) ) ( ON-TABLE ?auto_18539 ) ( ON ?auto_18538 ?auto_18539 ) ( ON ?auto_18535 ?auto_18540 ) ( not ( = ?auto_18535 ?auto_18540 ) ) ( not ( = ?auto_18536 ?auto_18540 ) ) ( not ( = ?auto_18537 ?auto_18540 ) ) ( not ( = ?auto_18538 ?auto_18540 ) ) ( not ( = ?auto_18539 ?auto_18540 ) ) ( ON ?auto_18536 ?auto_18535 ) ( CLEAR ?auto_18536 ) ( ON-TABLE ?auto_18540 ) ( HOLDING ?auto_18537 ) ( CLEAR ?auto_18538 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_18539 ?auto_18538 ?auto_18537 )
      ( MAKE-5PILE ?auto_18535 ?auto_18536 ?auto_18537 ?auto_18538 ?auto_18539 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_18541 - BLOCK
      ?auto_18542 - BLOCK
      ?auto_18543 - BLOCK
      ?auto_18544 - BLOCK
      ?auto_18545 - BLOCK
    )
    :vars
    (
      ?auto_18546 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18541 ?auto_18542 ) ) ( not ( = ?auto_18541 ?auto_18543 ) ) ( not ( = ?auto_18541 ?auto_18544 ) ) ( not ( = ?auto_18541 ?auto_18545 ) ) ( not ( = ?auto_18542 ?auto_18543 ) ) ( not ( = ?auto_18542 ?auto_18544 ) ) ( not ( = ?auto_18542 ?auto_18545 ) ) ( not ( = ?auto_18543 ?auto_18544 ) ) ( not ( = ?auto_18543 ?auto_18545 ) ) ( not ( = ?auto_18544 ?auto_18545 ) ) ( ON-TABLE ?auto_18545 ) ( ON ?auto_18544 ?auto_18545 ) ( ON ?auto_18541 ?auto_18546 ) ( not ( = ?auto_18541 ?auto_18546 ) ) ( not ( = ?auto_18542 ?auto_18546 ) ) ( not ( = ?auto_18543 ?auto_18546 ) ) ( not ( = ?auto_18544 ?auto_18546 ) ) ( not ( = ?auto_18545 ?auto_18546 ) ) ( ON ?auto_18542 ?auto_18541 ) ( ON-TABLE ?auto_18546 ) ( CLEAR ?auto_18544 ) ( ON ?auto_18543 ?auto_18542 ) ( CLEAR ?auto_18543 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_18546 ?auto_18541 ?auto_18542 )
      ( MAKE-5PILE ?auto_18541 ?auto_18542 ?auto_18543 ?auto_18544 ?auto_18545 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_18547 - BLOCK
      ?auto_18548 - BLOCK
      ?auto_18549 - BLOCK
      ?auto_18550 - BLOCK
      ?auto_18551 - BLOCK
    )
    :vars
    (
      ?auto_18552 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18547 ?auto_18548 ) ) ( not ( = ?auto_18547 ?auto_18549 ) ) ( not ( = ?auto_18547 ?auto_18550 ) ) ( not ( = ?auto_18547 ?auto_18551 ) ) ( not ( = ?auto_18548 ?auto_18549 ) ) ( not ( = ?auto_18548 ?auto_18550 ) ) ( not ( = ?auto_18548 ?auto_18551 ) ) ( not ( = ?auto_18549 ?auto_18550 ) ) ( not ( = ?auto_18549 ?auto_18551 ) ) ( not ( = ?auto_18550 ?auto_18551 ) ) ( ON-TABLE ?auto_18551 ) ( ON ?auto_18547 ?auto_18552 ) ( not ( = ?auto_18547 ?auto_18552 ) ) ( not ( = ?auto_18548 ?auto_18552 ) ) ( not ( = ?auto_18549 ?auto_18552 ) ) ( not ( = ?auto_18550 ?auto_18552 ) ) ( not ( = ?auto_18551 ?auto_18552 ) ) ( ON ?auto_18548 ?auto_18547 ) ( ON-TABLE ?auto_18552 ) ( ON ?auto_18549 ?auto_18548 ) ( CLEAR ?auto_18549 ) ( HOLDING ?auto_18550 ) ( CLEAR ?auto_18551 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_18551 ?auto_18550 )
      ( MAKE-5PILE ?auto_18547 ?auto_18548 ?auto_18549 ?auto_18550 ?auto_18551 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_18553 - BLOCK
      ?auto_18554 - BLOCK
      ?auto_18555 - BLOCK
      ?auto_18556 - BLOCK
      ?auto_18557 - BLOCK
    )
    :vars
    (
      ?auto_18558 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18553 ?auto_18554 ) ) ( not ( = ?auto_18553 ?auto_18555 ) ) ( not ( = ?auto_18553 ?auto_18556 ) ) ( not ( = ?auto_18553 ?auto_18557 ) ) ( not ( = ?auto_18554 ?auto_18555 ) ) ( not ( = ?auto_18554 ?auto_18556 ) ) ( not ( = ?auto_18554 ?auto_18557 ) ) ( not ( = ?auto_18555 ?auto_18556 ) ) ( not ( = ?auto_18555 ?auto_18557 ) ) ( not ( = ?auto_18556 ?auto_18557 ) ) ( ON-TABLE ?auto_18557 ) ( ON ?auto_18553 ?auto_18558 ) ( not ( = ?auto_18553 ?auto_18558 ) ) ( not ( = ?auto_18554 ?auto_18558 ) ) ( not ( = ?auto_18555 ?auto_18558 ) ) ( not ( = ?auto_18556 ?auto_18558 ) ) ( not ( = ?auto_18557 ?auto_18558 ) ) ( ON ?auto_18554 ?auto_18553 ) ( ON-TABLE ?auto_18558 ) ( ON ?auto_18555 ?auto_18554 ) ( CLEAR ?auto_18557 ) ( ON ?auto_18556 ?auto_18555 ) ( CLEAR ?auto_18556 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_18558 ?auto_18553 ?auto_18554 ?auto_18555 )
      ( MAKE-5PILE ?auto_18553 ?auto_18554 ?auto_18555 ?auto_18556 ?auto_18557 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_18559 - BLOCK
      ?auto_18560 - BLOCK
      ?auto_18561 - BLOCK
      ?auto_18562 - BLOCK
      ?auto_18563 - BLOCK
    )
    :vars
    (
      ?auto_18564 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18559 ?auto_18560 ) ) ( not ( = ?auto_18559 ?auto_18561 ) ) ( not ( = ?auto_18559 ?auto_18562 ) ) ( not ( = ?auto_18559 ?auto_18563 ) ) ( not ( = ?auto_18560 ?auto_18561 ) ) ( not ( = ?auto_18560 ?auto_18562 ) ) ( not ( = ?auto_18560 ?auto_18563 ) ) ( not ( = ?auto_18561 ?auto_18562 ) ) ( not ( = ?auto_18561 ?auto_18563 ) ) ( not ( = ?auto_18562 ?auto_18563 ) ) ( ON ?auto_18559 ?auto_18564 ) ( not ( = ?auto_18559 ?auto_18564 ) ) ( not ( = ?auto_18560 ?auto_18564 ) ) ( not ( = ?auto_18561 ?auto_18564 ) ) ( not ( = ?auto_18562 ?auto_18564 ) ) ( not ( = ?auto_18563 ?auto_18564 ) ) ( ON ?auto_18560 ?auto_18559 ) ( ON-TABLE ?auto_18564 ) ( ON ?auto_18561 ?auto_18560 ) ( ON ?auto_18562 ?auto_18561 ) ( CLEAR ?auto_18562 ) ( HOLDING ?auto_18563 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_18563 )
      ( MAKE-5PILE ?auto_18559 ?auto_18560 ?auto_18561 ?auto_18562 ?auto_18563 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_18565 - BLOCK
      ?auto_18566 - BLOCK
      ?auto_18567 - BLOCK
      ?auto_18568 - BLOCK
      ?auto_18569 - BLOCK
    )
    :vars
    (
      ?auto_18570 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18565 ?auto_18566 ) ) ( not ( = ?auto_18565 ?auto_18567 ) ) ( not ( = ?auto_18565 ?auto_18568 ) ) ( not ( = ?auto_18565 ?auto_18569 ) ) ( not ( = ?auto_18566 ?auto_18567 ) ) ( not ( = ?auto_18566 ?auto_18568 ) ) ( not ( = ?auto_18566 ?auto_18569 ) ) ( not ( = ?auto_18567 ?auto_18568 ) ) ( not ( = ?auto_18567 ?auto_18569 ) ) ( not ( = ?auto_18568 ?auto_18569 ) ) ( ON ?auto_18565 ?auto_18570 ) ( not ( = ?auto_18565 ?auto_18570 ) ) ( not ( = ?auto_18566 ?auto_18570 ) ) ( not ( = ?auto_18567 ?auto_18570 ) ) ( not ( = ?auto_18568 ?auto_18570 ) ) ( not ( = ?auto_18569 ?auto_18570 ) ) ( ON ?auto_18566 ?auto_18565 ) ( ON-TABLE ?auto_18570 ) ( ON ?auto_18567 ?auto_18566 ) ( ON ?auto_18568 ?auto_18567 ) ( ON ?auto_18569 ?auto_18568 ) ( CLEAR ?auto_18569 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_18570 ?auto_18565 ?auto_18566 ?auto_18567 ?auto_18568 )
      ( MAKE-5PILE ?auto_18565 ?auto_18566 ?auto_18567 ?auto_18568 ?auto_18569 ) )
  )

)

