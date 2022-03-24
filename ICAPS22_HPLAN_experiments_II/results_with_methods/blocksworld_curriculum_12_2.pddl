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
      ?auto_155639 - BLOCK
    )
    :vars
    (
      ?auto_155640 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155639 ?auto_155640 ) ( CLEAR ?auto_155639 ) ( HAND-EMPTY ) ( not ( = ?auto_155639 ?auto_155640 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_155639 ?auto_155640 )
      ( !PUTDOWN ?auto_155639 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_155642 - BLOCK
    )
    :vars
    (
      ?auto_155643 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155642 ?auto_155643 ) ( CLEAR ?auto_155642 ) ( HAND-EMPTY ) ( not ( = ?auto_155642 ?auto_155643 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_155642 ?auto_155643 )
      ( !PUTDOWN ?auto_155642 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_155646 - BLOCK
      ?auto_155647 - BLOCK
    )
    :vars
    (
      ?auto_155648 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_155646 ) ( ON ?auto_155647 ?auto_155648 ) ( CLEAR ?auto_155647 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_155646 ) ( not ( = ?auto_155646 ?auto_155647 ) ) ( not ( = ?auto_155646 ?auto_155648 ) ) ( not ( = ?auto_155647 ?auto_155648 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_155647 ?auto_155648 )
      ( !STACK ?auto_155647 ?auto_155646 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_155651 - BLOCK
      ?auto_155652 - BLOCK
    )
    :vars
    (
      ?auto_155653 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_155651 ) ( ON ?auto_155652 ?auto_155653 ) ( CLEAR ?auto_155652 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_155651 ) ( not ( = ?auto_155651 ?auto_155652 ) ) ( not ( = ?auto_155651 ?auto_155653 ) ) ( not ( = ?auto_155652 ?auto_155653 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_155652 ?auto_155653 )
      ( !STACK ?auto_155652 ?auto_155651 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_155656 - BLOCK
      ?auto_155657 - BLOCK
    )
    :vars
    (
      ?auto_155658 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155657 ?auto_155658 ) ( not ( = ?auto_155656 ?auto_155657 ) ) ( not ( = ?auto_155656 ?auto_155658 ) ) ( not ( = ?auto_155657 ?auto_155658 ) ) ( ON ?auto_155656 ?auto_155657 ) ( CLEAR ?auto_155656 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_155656 )
      ( MAKE-2PILE ?auto_155656 ?auto_155657 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_155661 - BLOCK
      ?auto_155662 - BLOCK
    )
    :vars
    (
      ?auto_155663 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155662 ?auto_155663 ) ( not ( = ?auto_155661 ?auto_155662 ) ) ( not ( = ?auto_155661 ?auto_155663 ) ) ( not ( = ?auto_155662 ?auto_155663 ) ) ( ON ?auto_155661 ?auto_155662 ) ( CLEAR ?auto_155661 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_155661 )
      ( MAKE-2PILE ?auto_155661 ?auto_155662 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_155667 - BLOCK
      ?auto_155668 - BLOCK
      ?auto_155669 - BLOCK
    )
    :vars
    (
      ?auto_155670 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_155668 ) ( ON ?auto_155669 ?auto_155670 ) ( CLEAR ?auto_155669 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_155667 ) ( ON ?auto_155668 ?auto_155667 ) ( not ( = ?auto_155667 ?auto_155668 ) ) ( not ( = ?auto_155667 ?auto_155669 ) ) ( not ( = ?auto_155667 ?auto_155670 ) ) ( not ( = ?auto_155668 ?auto_155669 ) ) ( not ( = ?auto_155668 ?auto_155670 ) ) ( not ( = ?auto_155669 ?auto_155670 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_155669 ?auto_155670 )
      ( !STACK ?auto_155669 ?auto_155668 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_155674 - BLOCK
      ?auto_155675 - BLOCK
      ?auto_155676 - BLOCK
    )
    :vars
    (
      ?auto_155677 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_155675 ) ( ON ?auto_155676 ?auto_155677 ) ( CLEAR ?auto_155676 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_155674 ) ( ON ?auto_155675 ?auto_155674 ) ( not ( = ?auto_155674 ?auto_155675 ) ) ( not ( = ?auto_155674 ?auto_155676 ) ) ( not ( = ?auto_155674 ?auto_155677 ) ) ( not ( = ?auto_155675 ?auto_155676 ) ) ( not ( = ?auto_155675 ?auto_155677 ) ) ( not ( = ?auto_155676 ?auto_155677 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_155676 ?auto_155677 )
      ( !STACK ?auto_155676 ?auto_155675 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_155681 - BLOCK
      ?auto_155682 - BLOCK
      ?auto_155683 - BLOCK
    )
    :vars
    (
      ?auto_155684 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155683 ?auto_155684 ) ( ON-TABLE ?auto_155681 ) ( not ( = ?auto_155681 ?auto_155682 ) ) ( not ( = ?auto_155681 ?auto_155683 ) ) ( not ( = ?auto_155681 ?auto_155684 ) ) ( not ( = ?auto_155682 ?auto_155683 ) ) ( not ( = ?auto_155682 ?auto_155684 ) ) ( not ( = ?auto_155683 ?auto_155684 ) ) ( CLEAR ?auto_155681 ) ( ON ?auto_155682 ?auto_155683 ) ( CLEAR ?auto_155682 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_155681 ?auto_155682 )
      ( MAKE-3PILE ?auto_155681 ?auto_155682 ?auto_155683 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_155688 - BLOCK
      ?auto_155689 - BLOCK
      ?auto_155690 - BLOCK
    )
    :vars
    (
      ?auto_155691 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155690 ?auto_155691 ) ( ON-TABLE ?auto_155688 ) ( not ( = ?auto_155688 ?auto_155689 ) ) ( not ( = ?auto_155688 ?auto_155690 ) ) ( not ( = ?auto_155688 ?auto_155691 ) ) ( not ( = ?auto_155689 ?auto_155690 ) ) ( not ( = ?auto_155689 ?auto_155691 ) ) ( not ( = ?auto_155690 ?auto_155691 ) ) ( CLEAR ?auto_155688 ) ( ON ?auto_155689 ?auto_155690 ) ( CLEAR ?auto_155689 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_155688 ?auto_155689 )
      ( MAKE-3PILE ?auto_155688 ?auto_155689 ?auto_155690 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_155695 - BLOCK
      ?auto_155696 - BLOCK
      ?auto_155697 - BLOCK
    )
    :vars
    (
      ?auto_155698 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155697 ?auto_155698 ) ( not ( = ?auto_155695 ?auto_155696 ) ) ( not ( = ?auto_155695 ?auto_155697 ) ) ( not ( = ?auto_155695 ?auto_155698 ) ) ( not ( = ?auto_155696 ?auto_155697 ) ) ( not ( = ?auto_155696 ?auto_155698 ) ) ( not ( = ?auto_155697 ?auto_155698 ) ) ( ON ?auto_155696 ?auto_155697 ) ( ON ?auto_155695 ?auto_155696 ) ( CLEAR ?auto_155695 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_155695 )
      ( MAKE-3PILE ?auto_155695 ?auto_155696 ?auto_155697 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_155702 - BLOCK
      ?auto_155703 - BLOCK
      ?auto_155704 - BLOCK
    )
    :vars
    (
      ?auto_155705 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155704 ?auto_155705 ) ( not ( = ?auto_155702 ?auto_155703 ) ) ( not ( = ?auto_155702 ?auto_155704 ) ) ( not ( = ?auto_155702 ?auto_155705 ) ) ( not ( = ?auto_155703 ?auto_155704 ) ) ( not ( = ?auto_155703 ?auto_155705 ) ) ( not ( = ?auto_155704 ?auto_155705 ) ) ( ON ?auto_155703 ?auto_155704 ) ( ON ?auto_155702 ?auto_155703 ) ( CLEAR ?auto_155702 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_155702 )
      ( MAKE-3PILE ?auto_155702 ?auto_155703 ?auto_155704 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_155710 - BLOCK
      ?auto_155711 - BLOCK
      ?auto_155712 - BLOCK
      ?auto_155713 - BLOCK
    )
    :vars
    (
      ?auto_155714 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_155712 ) ( ON ?auto_155713 ?auto_155714 ) ( CLEAR ?auto_155713 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_155710 ) ( ON ?auto_155711 ?auto_155710 ) ( ON ?auto_155712 ?auto_155711 ) ( not ( = ?auto_155710 ?auto_155711 ) ) ( not ( = ?auto_155710 ?auto_155712 ) ) ( not ( = ?auto_155710 ?auto_155713 ) ) ( not ( = ?auto_155710 ?auto_155714 ) ) ( not ( = ?auto_155711 ?auto_155712 ) ) ( not ( = ?auto_155711 ?auto_155713 ) ) ( not ( = ?auto_155711 ?auto_155714 ) ) ( not ( = ?auto_155712 ?auto_155713 ) ) ( not ( = ?auto_155712 ?auto_155714 ) ) ( not ( = ?auto_155713 ?auto_155714 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_155713 ?auto_155714 )
      ( !STACK ?auto_155713 ?auto_155712 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_155719 - BLOCK
      ?auto_155720 - BLOCK
      ?auto_155721 - BLOCK
      ?auto_155722 - BLOCK
    )
    :vars
    (
      ?auto_155723 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_155721 ) ( ON ?auto_155722 ?auto_155723 ) ( CLEAR ?auto_155722 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_155719 ) ( ON ?auto_155720 ?auto_155719 ) ( ON ?auto_155721 ?auto_155720 ) ( not ( = ?auto_155719 ?auto_155720 ) ) ( not ( = ?auto_155719 ?auto_155721 ) ) ( not ( = ?auto_155719 ?auto_155722 ) ) ( not ( = ?auto_155719 ?auto_155723 ) ) ( not ( = ?auto_155720 ?auto_155721 ) ) ( not ( = ?auto_155720 ?auto_155722 ) ) ( not ( = ?auto_155720 ?auto_155723 ) ) ( not ( = ?auto_155721 ?auto_155722 ) ) ( not ( = ?auto_155721 ?auto_155723 ) ) ( not ( = ?auto_155722 ?auto_155723 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_155722 ?auto_155723 )
      ( !STACK ?auto_155722 ?auto_155721 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_155728 - BLOCK
      ?auto_155729 - BLOCK
      ?auto_155730 - BLOCK
      ?auto_155731 - BLOCK
    )
    :vars
    (
      ?auto_155732 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155731 ?auto_155732 ) ( ON-TABLE ?auto_155728 ) ( ON ?auto_155729 ?auto_155728 ) ( not ( = ?auto_155728 ?auto_155729 ) ) ( not ( = ?auto_155728 ?auto_155730 ) ) ( not ( = ?auto_155728 ?auto_155731 ) ) ( not ( = ?auto_155728 ?auto_155732 ) ) ( not ( = ?auto_155729 ?auto_155730 ) ) ( not ( = ?auto_155729 ?auto_155731 ) ) ( not ( = ?auto_155729 ?auto_155732 ) ) ( not ( = ?auto_155730 ?auto_155731 ) ) ( not ( = ?auto_155730 ?auto_155732 ) ) ( not ( = ?auto_155731 ?auto_155732 ) ) ( CLEAR ?auto_155729 ) ( ON ?auto_155730 ?auto_155731 ) ( CLEAR ?auto_155730 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_155728 ?auto_155729 ?auto_155730 )
      ( MAKE-4PILE ?auto_155728 ?auto_155729 ?auto_155730 ?auto_155731 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_155737 - BLOCK
      ?auto_155738 - BLOCK
      ?auto_155739 - BLOCK
      ?auto_155740 - BLOCK
    )
    :vars
    (
      ?auto_155741 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155740 ?auto_155741 ) ( ON-TABLE ?auto_155737 ) ( ON ?auto_155738 ?auto_155737 ) ( not ( = ?auto_155737 ?auto_155738 ) ) ( not ( = ?auto_155737 ?auto_155739 ) ) ( not ( = ?auto_155737 ?auto_155740 ) ) ( not ( = ?auto_155737 ?auto_155741 ) ) ( not ( = ?auto_155738 ?auto_155739 ) ) ( not ( = ?auto_155738 ?auto_155740 ) ) ( not ( = ?auto_155738 ?auto_155741 ) ) ( not ( = ?auto_155739 ?auto_155740 ) ) ( not ( = ?auto_155739 ?auto_155741 ) ) ( not ( = ?auto_155740 ?auto_155741 ) ) ( CLEAR ?auto_155738 ) ( ON ?auto_155739 ?auto_155740 ) ( CLEAR ?auto_155739 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_155737 ?auto_155738 ?auto_155739 )
      ( MAKE-4PILE ?auto_155737 ?auto_155738 ?auto_155739 ?auto_155740 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_155746 - BLOCK
      ?auto_155747 - BLOCK
      ?auto_155748 - BLOCK
      ?auto_155749 - BLOCK
    )
    :vars
    (
      ?auto_155750 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155749 ?auto_155750 ) ( ON-TABLE ?auto_155746 ) ( not ( = ?auto_155746 ?auto_155747 ) ) ( not ( = ?auto_155746 ?auto_155748 ) ) ( not ( = ?auto_155746 ?auto_155749 ) ) ( not ( = ?auto_155746 ?auto_155750 ) ) ( not ( = ?auto_155747 ?auto_155748 ) ) ( not ( = ?auto_155747 ?auto_155749 ) ) ( not ( = ?auto_155747 ?auto_155750 ) ) ( not ( = ?auto_155748 ?auto_155749 ) ) ( not ( = ?auto_155748 ?auto_155750 ) ) ( not ( = ?auto_155749 ?auto_155750 ) ) ( ON ?auto_155748 ?auto_155749 ) ( CLEAR ?auto_155746 ) ( ON ?auto_155747 ?auto_155748 ) ( CLEAR ?auto_155747 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_155746 ?auto_155747 )
      ( MAKE-4PILE ?auto_155746 ?auto_155747 ?auto_155748 ?auto_155749 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_155755 - BLOCK
      ?auto_155756 - BLOCK
      ?auto_155757 - BLOCK
      ?auto_155758 - BLOCK
    )
    :vars
    (
      ?auto_155759 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155758 ?auto_155759 ) ( ON-TABLE ?auto_155755 ) ( not ( = ?auto_155755 ?auto_155756 ) ) ( not ( = ?auto_155755 ?auto_155757 ) ) ( not ( = ?auto_155755 ?auto_155758 ) ) ( not ( = ?auto_155755 ?auto_155759 ) ) ( not ( = ?auto_155756 ?auto_155757 ) ) ( not ( = ?auto_155756 ?auto_155758 ) ) ( not ( = ?auto_155756 ?auto_155759 ) ) ( not ( = ?auto_155757 ?auto_155758 ) ) ( not ( = ?auto_155757 ?auto_155759 ) ) ( not ( = ?auto_155758 ?auto_155759 ) ) ( ON ?auto_155757 ?auto_155758 ) ( CLEAR ?auto_155755 ) ( ON ?auto_155756 ?auto_155757 ) ( CLEAR ?auto_155756 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_155755 ?auto_155756 )
      ( MAKE-4PILE ?auto_155755 ?auto_155756 ?auto_155757 ?auto_155758 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_155764 - BLOCK
      ?auto_155765 - BLOCK
      ?auto_155766 - BLOCK
      ?auto_155767 - BLOCK
    )
    :vars
    (
      ?auto_155768 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155767 ?auto_155768 ) ( not ( = ?auto_155764 ?auto_155765 ) ) ( not ( = ?auto_155764 ?auto_155766 ) ) ( not ( = ?auto_155764 ?auto_155767 ) ) ( not ( = ?auto_155764 ?auto_155768 ) ) ( not ( = ?auto_155765 ?auto_155766 ) ) ( not ( = ?auto_155765 ?auto_155767 ) ) ( not ( = ?auto_155765 ?auto_155768 ) ) ( not ( = ?auto_155766 ?auto_155767 ) ) ( not ( = ?auto_155766 ?auto_155768 ) ) ( not ( = ?auto_155767 ?auto_155768 ) ) ( ON ?auto_155766 ?auto_155767 ) ( ON ?auto_155765 ?auto_155766 ) ( ON ?auto_155764 ?auto_155765 ) ( CLEAR ?auto_155764 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_155764 )
      ( MAKE-4PILE ?auto_155764 ?auto_155765 ?auto_155766 ?auto_155767 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_155773 - BLOCK
      ?auto_155774 - BLOCK
      ?auto_155775 - BLOCK
      ?auto_155776 - BLOCK
    )
    :vars
    (
      ?auto_155777 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155776 ?auto_155777 ) ( not ( = ?auto_155773 ?auto_155774 ) ) ( not ( = ?auto_155773 ?auto_155775 ) ) ( not ( = ?auto_155773 ?auto_155776 ) ) ( not ( = ?auto_155773 ?auto_155777 ) ) ( not ( = ?auto_155774 ?auto_155775 ) ) ( not ( = ?auto_155774 ?auto_155776 ) ) ( not ( = ?auto_155774 ?auto_155777 ) ) ( not ( = ?auto_155775 ?auto_155776 ) ) ( not ( = ?auto_155775 ?auto_155777 ) ) ( not ( = ?auto_155776 ?auto_155777 ) ) ( ON ?auto_155775 ?auto_155776 ) ( ON ?auto_155774 ?auto_155775 ) ( ON ?auto_155773 ?auto_155774 ) ( CLEAR ?auto_155773 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_155773 )
      ( MAKE-4PILE ?auto_155773 ?auto_155774 ?auto_155775 ?auto_155776 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_155783 - BLOCK
      ?auto_155784 - BLOCK
      ?auto_155785 - BLOCK
      ?auto_155786 - BLOCK
      ?auto_155787 - BLOCK
    )
    :vars
    (
      ?auto_155788 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_155786 ) ( ON ?auto_155787 ?auto_155788 ) ( CLEAR ?auto_155787 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_155783 ) ( ON ?auto_155784 ?auto_155783 ) ( ON ?auto_155785 ?auto_155784 ) ( ON ?auto_155786 ?auto_155785 ) ( not ( = ?auto_155783 ?auto_155784 ) ) ( not ( = ?auto_155783 ?auto_155785 ) ) ( not ( = ?auto_155783 ?auto_155786 ) ) ( not ( = ?auto_155783 ?auto_155787 ) ) ( not ( = ?auto_155783 ?auto_155788 ) ) ( not ( = ?auto_155784 ?auto_155785 ) ) ( not ( = ?auto_155784 ?auto_155786 ) ) ( not ( = ?auto_155784 ?auto_155787 ) ) ( not ( = ?auto_155784 ?auto_155788 ) ) ( not ( = ?auto_155785 ?auto_155786 ) ) ( not ( = ?auto_155785 ?auto_155787 ) ) ( not ( = ?auto_155785 ?auto_155788 ) ) ( not ( = ?auto_155786 ?auto_155787 ) ) ( not ( = ?auto_155786 ?auto_155788 ) ) ( not ( = ?auto_155787 ?auto_155788 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_155787 ?auto_155788 )
      ( !STACK ?auto_155787 ?auto_155786 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_155794 - BLOCK
      ?auto_155795 - BLOCK
      ?auto_155796 - BLOCK
      ?auto_155797 - BLOCK
      ?auto_155798 - BLOCK
    )
    :vars
    (
      ?auto_155799 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_155797 ) ( ON ?auto_155798 ?auto_155799 ) ( CLEAR ?auto_155798 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_155794 ) ( ON ?auto_155795 ?auto_155794 ) ( ON ?auto_155796 ?auto_155795 ) ( ON ?auto_155797 ?auto_155796 ) ( not ( = ?auto_155794 ?auto_155795 ) ) ( not ( = ?auto_155794 ?auto_155796 ) ) ( not ( = ?auto_155794 ?auto_155797 ) ) ( not ( = ?auto_155794 ?auto_155798 ) ) ( not ( = ?auto_155794 ?auto_155799 ) ) ( not ( = ?auto_155795 ?auto_155796 ) ) ( not ( = ?auto_155795 ?auto_155797 ) ) ( not ( = ?auto_155795 ?auto_155798 ) ) ( not ( = ?auto_155795 ?auto_155799 ) ) ( not ( = ?auto_155796 ?auto_155797 ) ) ( not ( = ?auto_155796 ?auto_155798 ) ) ( not ( = ?auto_155796 ?auto_155799 ) ) ( not ( = ?auto_155797 ?auto_155798 ) ) ( not ( = ?auto_155797 ?auto_155799 ) ) ( not ( = ?auto_155798 ?auto_155799 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_155798 ?auto_155799 )
      ( !STACK ?auto_155798 ?auto_155797 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_155805 - BLOCK
      ?auto_155806 - BLOCK
      ?auto_155807 - BLOCK
      ?auto_155808 - BLOCK
      ?auto_155809 - BLOCK
    )
    :vars
    (
      ?auto_155810 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155809 ?auto_155810 ) ( ON-TABLE ?auto_155805 ) ( ON ?auto_155806 ?auto_155805 ) ( ON ?auto_155807 ?auto_155806 ) ( not ( = ?auto_155805 ?auto_155806 ) ) ( not ( = ?auto_155805 ?auto_155807 ) ) ( not ( = ?auto_155805 ?auto_155808 ) ) ( not ( = ?auto_155805 ?auto_155809 ) ) ( not ( = ?auto_155805 ?auto_155810 ) ) ( not ( = ?auto_155806 ?auto_155807 ) ) ( not ( = ?auto_155806 ?auto_155808 ) ) ( not ( = ?auto_155806 ?auto_155809 ) ) ( not ( = ?auto_155806 ?auto_155810 ) ) ( not ( = ?auto_155807 ?auto_155808 ) ) ( not ( = ?auto_155807 ?auto_155809 ) ) ( not ( = ?auto_155807 ?auto_155810 ) ) ( not ( = ?auto_155808 ?auto_155809 ) ) ( not ( = ?auto_155808 ?auto_155810 ) ) ( not ( = ?auto_155809 ?auto_155810 ) ) ( CLEAR ?auto_155807 ) ( ON ?auto_155808 ?auto_155809 ) ( CLEAR ?auto_155808 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_155805 ?auto_155806 ?auto_155807 ?auto_155808 )
      ( MAKE-5PILE ?auto_155805 ?auto_155806 ?auto_155807 ?auto_155808 ?auto_155809 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_155816 - BLOCK
      ?auto_155817 - BLOCK
      ?auto_155818 - BLOCK
      ?auto_155819 - BLOCK
      ?auto_155820 - BLOCK
    )
    :vars
    (
      ?auto_155821 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155820 ?auto_155821 ) ( ON-TABLE ?auto_155816 ) ( ON ?auto_155817 ?auto_155816 ) ( ON ?auto_155818 ?auto_155817 ) ( not ( = ?auto_155816 ?auto_155817 ) ) ( not ( = ?auto_155816 ?auto_155818 ) ) ( not ( = ?auto_155816 ?auto_155819 ) ) ( not ( = ?auto_155816 ?auto_155820 ) ) ( not ( = ?auto_155816 ?auto_155821 ) ) ( not ( = ?auto_155817 ?auto_155818 ) ) ( not ( = ?auto_155817 ?auto_155819 ) ) ( not ( = ?auto_155817 ?auto_155820 ) ) ( not ( = ?auto_155817 ?auto_155821 ) ) ( not ( = ?auto_155818 ?auto_155819 ) ) ( not ( = ?auto_155818 ?auto_155820 ) ) ( not ( = ?auto_155818 ?auto_155821 ) ) ( not ( = ?auto_155819 ?auto_155820 ) ) ( not ( = ?auto_155819 ?auto_155821 ) ) ( not ( = ?auto_155820 ?auto_155821 ) ) ( CLEAR ?auto_155818 ) ( ON ?auto_155819 ?auto_155820 ) ( CLEAR ?auto_155819 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_155816 ?auto_155817 ?auto_155818 ?auto_155819 )
      ( MAKE-5PILE ?auto_155816 ?auto_155817 ?auto_155818 ?auto_155819 ?auto_155820 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_155827 - BLOCK
      ?auto_155828 - BLOCK
      ?auto_155829 - BLOCK
      ?auto_155830 - BLOCK
      ?auto_155831 - BLOCK
    )
    :vars
    (
      ?auto_155832 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155831 ?auto_155832 ) ( ON-TABLE ?auto_155827 ) ( ON ?auto_155828 ?auto_155827 ) ( not ( = ?auto_155827 ?auto_155828 ) ) ( not ( = ?auto_155827 ?auto_155829 ) ) ( not ( = ?auto_155827 ?auto_155830 ) ) ( not ( = ?auto_155827 ?auto_155831 ) ) ( not ( = ?auto_155827 ?auto_155832 ) ) ( not ( = ?auto_155828 ?auto_155829 ) ) ( not ( = ?auto_155828 ?auto_155830 ) ) ( not ( = ?auto_155828 ?auto_155831 ) ) ( not ( = ?auto_155828 ?auto_155832 ) ) ( not ( = ?auto_155829 ?auto_155830 ) ) ( not ( = ?auto_155829 ?auto_155831 ) ) ( not ( = ?auto_155829 ?auto_155832 ) ) ( not ( = ?auto_155830 ?auto_155831 ) ) ( not ( = ?auto_155830 ?auto_155832 ) ) ( not ( = ?auto_155831 ?auto_155832 ) ) ( ON ?auto_155830 ?auto_155831 ) ( CLEAR ?auto_155828 ) ( ON ?auto_155829 ?auto_155830 ) ( CLEAR ?auto_155829 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_155827 ?auto_155828 ?auto_155829 )
      ( MAKE-5PILE ?auto_155827 ?auto_155828 ?auto_155829 ?auto_155830 ?auto_155831 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_155838 - BLOCK
      ?auto_155839 - BLOCK
      ?auto_155840 - BLOCK
      ?auto_155841 - BLOCK
      ?auto_155842 - BLOCK
    )
    :vars
    (
      ?auto_155843 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155842 ?auto_155843 ) ( ON-TABLE ?auto_155838 ) ( ON ?auto_155839 ?auto_155838 ) ( not ( = ?auto_155838 ?auto_155839 ) ) ( not ( = ?auto_155838 ?auto_155840 ) ) ( not ( = ?auto_155838 ?auto_155841 ) ) ( not ( = ?auto_155838 ?auto_155842 ) ) ( not ( = ?auto_155838 ?auto_155843 ) ) ( not ( = ?auto_155839 ?auto_155840 ) ) ( not ( = ?auto_155839 ?auto_155841 ) ) ( not ( = ?auto_155839 ?auto_155842 ) ) ( not ( = ?auto_155839 ?auto_155843 ) ) ( not ( = ?auto_155840 ?auto_155841 ) ) ( not ( = ?auto_155840 ?auto_155842 ) ) ( not ( = ?auto_155840 ?auto_155843 ) ) ( not ( = ?auto_155841 ?auto_155842 ) ) ( not ( = ?auto_155841 ?auto_155843 ) ) ( not ( = ?auto_155842 ?auto_155843 ) ) ( ON ?auto_155841 ?auto_155842 ) ( CLEAR ?auto_155839 ) ( ON ?auto_155840 ?auto_155841 ) ( CLEAR ?auto_155840 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_155838 ?auto_155839 ?auto_155840 )
      ( MAKE-5PILE ?auto_155838 ?auto_155839 ?auto_155840 ?auto_155841 ?auto_155842 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_155849 - BLOCK
      ?auto_155850 - BLOCK
      ?auto_155851 - BLOCK
      ?auto_155852 - BLOCK
      ?auto_155853 - BLOCK
    )
    :vars
    (
      ?auto_155854 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155853 ?auto_155854 ) ( ON-TABLE ?auto_155849 ) ( not ( = ?auto_155849 ?auto_155850 ) ) ( not ( = ?auto_155849 ?auto_155851 ) ) ( not ( = ?auto_155849 ?auto_155852 ) ) ( not ( = ?auto_155849 ?auto_155853 ) ) ( not ( = ?auto_155849 ?auto_155854 ) ) ( not ( = ?auto_155850 ?auto_155851 ) ) ( not ( = ?auto_155850 ?auto_155852 ) ) ( not ( = ?auto_155850 ?auto_155853 ) ) ( not ( = ?auto_155850 ?auto_155854 ) ) ( not ( = ?auto_155851 ?auto_155852 ) ) ( not ( = ?auto_155851 ?auto_155853 ) ) ( not ( = ?auto_155851 ?auto_155854 ) ) ( not ( = ?auto_155852 ?auto_155853 ) ) ( not ( = ?auto_155852 ?auto_155854 ) ) ( not ( = ?auto_155853 ?auto_155854 ) ) ( ON ?auto_155852 ?auto_155853 ) ( ON ?auto_155851 ?auto_155852 ) ( CLEAR ?auto_155849 ) ( ON ?auto_155850 ?auto_155851 ) ( CLEAR ?auto_155850 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_155849 ?auto_155850 )
      ( MAKE-5PILE ?auto_155849 ?auto_155850 ?auto_155851 ?auto_155852 ?auto_155853 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_155860 - BLOCK
      ?auto_155861 - BLOCK
      ?auto_155862 - BLOCK
      ?auto_155863 - BLOCK
      ?auto_155864 - BLOCK
    )
    :vars
    (
      ?auto_155865 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155864 ?auto_155865 ) ( ON-TABLE ?auto_155860 ) ( not ( = ?auto_155860 ?auto_155861 ) ) ( not ( = ?auto_155860 ?auto_155862 ) ) ( not ( = ?auto_155860 ?auto_155863 ) ) ( not ( = ?auto_155860 ?auto_155864 ) ) ( not ( = ?auto_155860 ?auto_155865 ) ) ( not ( = ?auto_155861 ?auto_155862 ) ) ( not ( = ?auto_155861 ?auto_155863 ) ) ( not ( = ?auto_155861 ?auto_155864 ) ) ( not ( = ?auto_155861 ?auto_155865 ) ) ( not ( = ?auto_155862 ?auto_155863 ) ) ( not ( = ?auto_155862 ?auto_155864 ) ) ( not ( = ?auto_155862 ?auto_155865 ) ) ( not ( = ?auto_155863 ?auto_155864 ) ) ( not ( = ?auto_155863 ?auto_155865 ) ) ( not ( = ?auto_155864 ?auto_155865 ) ) ( ON ?auto_155863 ?auto_155864 ) ( ON ?auto_155862 ?auto_155863 ) ( CLEAR ?auto_155860 ) ( ON ?auto_155861 ?auto_155862 ) ( CLEAR ?auto_155861 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_155860 ?auto_155861 )
      ( MAKE-5PILE ?auto_155860 ?auto_155861 ?auto_155862 ?auto_155863 ?auto_155864 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_155871 - BLOCK
      ?auto_155872 - BLOCK
      ?auto_155873 - BLOCK
      ?auto_155874 - BLOCK
      ?auto_155875 - BLOCK
    )
    :vars
    (
      ?auto_155876 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155875 ?auto_155876 ) ( not ( = ?auto_155871 ?auto_155872 ) ) ( not ( = ?auto_155871 ?auto_155873 ) ) ( not ( = ?auto_155871 ?auto_155874 ) ) ( not ( = ?auto_155871 ?auto_155875 ) ) ( not ( = ?auto_155871 ?auto_155876 ) ) ( not ( = ?auto_155872 ?auto_155873 ) ) ( not ( = ?auto_155872 ?auto_155874 ) ) ( not ( = ?auto_155872 ?auto_155875 ) ) ( not ( = ?auto_155872 ?auto_155876 ) ) ( not ( = ?auto_155873 ?auto_155874 ) ) ( not ( = ?auto_155873 ?auto_155875 ) ) ( not ( = ?auto_155873 ?auto_155876 ) ) ( not ( = ?auto_155874 ?auto_155875 ) ) ( not ( = ?auto_155874 ?auto_155876 ) ) ( not ( = ?auto_155875 ?auto_155876 ) ) ( ON ?auto_155874 ?auto_155875 ) ( ON ?auto_155873 ?auto_155874 ) ( ON ?auto_155872 ?auto_155873 ) ( ON ?auto_155871 ?auto_155872 ) ( CLEAR ?auto_155871 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_155871 )
      ( MAKE-5PILE ?auto_155871 ?auto_155872 ?auto_155873 ?auto_155874 ?auto_155875 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_155882 - BLOCK
      ?auto_155883 - BLOCK
      ?auto_155884 - BLOCK
      ?auto_155885 - BLOCK
      ?auto_155886 - BLOCK
    )
    :vars
    (
      ?auto_155887 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155886 ?auto_155887 ) ( not ( = ?auto_155882 ?auto_155883 ) ) ( not ( = ?auto_155882 ?auto_155884 ) ) ( not ( = ?auto_155882 ?auto_155885 ) ) ( not ( = ?auto_155882 ?auto_155886 ) ) ( not ( = ?auto_155882 ?auto_155887 ) ) ( not ( = ?auto_155883 ?auto_155884 ) ) ( not ( = ?auto_155883 ?auto_155885 ) ) ( not ( = ?auto_155883 ?auto_155886 ) ) ( not ( = ?auto_155883 ?auto_155887 ) ) ( not ( = ?auto_155884 ?auto_155885 ) ) ( not ( = ?auto_155884 ?auto_155886 ) ) ( not ( = ?auto_155884 ?auto_155887 ) ) ( not ( = ?auto_155885 ?auto_155886 ) ) ( not ( = ?auto_155885 ?auto_155887 ) ) ( not ( = ?auto_155886 ?auto_155887 ) ) ( ON ?auto_155885 ?auto_155886 ) ( ON ?auto_155884 ?auto_155885 ) ( ON ?auto_155883 ?auto_155884 ) ( ON ?auto_155882 ?auto_155883 ) ( CLEAR ?auto_155882 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_155882 )
      ( MAKE-5PILE ?auto_155882 ?auto_155883 ?auto_155884 ?auto_155885 ?auto_155886 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_155894 - BLOCK
      ?auto_155895 - BLOCK
      ?auto_155896 - BLOCK
      ?auto_155897 - BLOCK
      ?auto_155898 - BLOCK
      ?auto_155899 - BLOCK
    )
    :vars
    (
      ?auto_155900 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_155898 ) ( ON ?auto_155899 ?auto_155900 ) ( CLEAR ?auto_155899 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_155894 ) ( ON ?auto_155895 ?auto_155894 ) ( ON ?auto_155896 ?auto_155895 ) ( ON ?auto_155897 ?auto_155896 ) ( ON ?auto_155898 ?auto_155897 ) ( not ( = ?auto_155894 ?auto_155895 ) ) ( not ( = ?auto_155894 ?auto_155896 ) ) ( not ( = ?auto_155894 ?auto_155897 ) ) ( not ( = ?auto_155894 ?auto_155898 ) ) ( not ( = ?auto_155894 ?auto_155899 ) ) ( not ( = ?auto_155894 ?auto_155900 ) ) ( not ( = ?auto_155895 ?auto_155896 ) ) ( not ( = ?auto_155895 ?auto_155897 ) ) ( not ( = ?auto_155895 ?auto_155898 ) ) ( not ( = ?auto_155895 ?auto_155899 ) ) ( not ( = ?auto_155895 ?auto_155900 ) ) ( not ( = ?auto_155896 ?auto_155897 ) ) ( not ( = ?auto_155896 ?auto_155898 ) ) ( not ( = ?auto_155896 ?auto_155899 ) ) ( not ( = ?auto_155896 ?auto_155900 ) ) ( not ( = ?auto_155897 ?auto_155898 ) ) ( not ( = ?auto_155897 ?auto_155899 ) ) ( not ( = ?auto_155897 ?auto_155900 ) ) ( not ( = ?auto_155898 ?auto_155899 ) ) ( not ( = ?auto_155898 ?auto_155900 ) ) ( not ( = ?auto_155899 ?auto_155900 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_155899 ?auto_155900 )
      ( !STACK ?auto_155899 ?auto_155898 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_155907 - BLOCK
      ?auto_155908 - BLOCK
      ?auto_155909 - BLOCK
      ?auto_155910 - BLOCK
      ?auto_155911 - BLOCK
      ?auto_155912 - BLOCK
    )
    :vars
    (
      ?auto_155913 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_155911 ) ( ON ?auto_155912 ?auto_155913 ) ( CLEAR ?auto_155912 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_155907 ) ( ON ?auto_155908 ?auto_155907 ) ( ON ?auto_155909 ?auto_155908 ) ( ON ?auto_155910 ?auto_155909 ) ( ON ?auto_155911 ?auto_155910 ) ( not ( = ?auto_155907 ?auto_155908 ) ) ( not ( = ?auto_155907 ?auto_155909 ) ) ( not ( = ?auto_155907 ?auto_155910 ) ) ( not ( = ?auto_155907 ?auto_155911 ) ) ( not ( = ?auto_155907 ?auto_155912 ) ) ( not ( = ?auto_155907 ?auto_155913 ) ) ( not ( = ?auto_155908 ?auto_155909 ) ) ( not ( = ?auto_155908 ?auto_155910 ) ) ( not ( = ?auto_155908 ?auto_155911 ) ) ( not ( = ?auto_155908 ?auto_155912 ) ) ( not ( = ?auto_155908 ?auto_155913 ) ) ( not ( = ?auto_155909 ?auto_155910 ) ) ( not ( = ?auto_155909 ?auto_155911 ) ) ( not ( = ?auto_155909 ?auto_155912 ) ) ( not ( = ?auto_155909 ?auto_155913 ) ) ( not ( = ?auto_155910 ?auto_155911 ) ) ( not ( = ?auto_155910 ?auto_155912 ) ) ( not ( = ?auto_155910 ?auto_155913 ) ) ( not ( = ?auto_155911 ?auto_155912 ) ) ( not ( = ?auto_155911 ?auto_155913 ) ) ( not ( = ?auto_155912 ?auto_155913 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_155912 ?auto_155913 )
      ( !STACK ?auto_155912 ?auto_155911 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_155920 - BLOCK
      ?auto_155921 - BLOCK
      ?auto_155922 - BLOCK
      ?auto_155923 - BLOCK
      ?auto_155924 - BLOCK
      ?auto_155925 - BLOCK
    )
    :vars
    (
      ?auto_155926 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155925 ?auto_155926 ) ( ON-TABLE ?auto_155920 ) ( ON ?auto_155921 ?auto_155920 ) ( ON ?auto_155922 ?auto_155921 ) ( ON ?auto_155923 ?auto_155922 ) ( not ( = ?auto_155920 ?auto_155921 ) ) ( not ( = ?auto_155920 ?auto_155922 ) ) ( not ( = ?auto_155920 ?auto_155923 ) ) ( not ( = ?auto_155920 ?auto_155924 ) ) ( not ( = ?auto_155920 ?auto_155925 ) ) ( not ( = ?auto_155920 ?auto_155926 ) ) ( not ( = ?auto_155921 ?auto_155922 ) ) ( not ( = ?auto_155921 ?auto_155923 ) ) ( not ( = ?auto_155921 ?auto_155924 ) ) ( not ( = ?auto_155921 ?auto_155925 ) ) ( not ( = ?auto_155921 ?auto_155926 ) ) ( not ( = ?auto_155922 ?auto_155923 ) ) ( not ( = ?auto_155922 ?auto_155924 ) ) ( not ( = ?auto_155922 ?auto_155925 ) ) ( not ( = ?auto_155922 ?auto_155926 ) ) ( not ( = ?auto_155923 ?auto_155924 ) ) ( not ( = ?auto_155923 ?auto_155925 ) ) ( not ( = ?auto_155923 ?auto_155926 ) ) ( not ( = ?auto_155924 ?auto_155925 ) ) ( not ( = ?auto_155924 ?auto_155926 ) ) ( not ( = ?auto_155925 ?auto_155926 ) ) ( CLEAR ?auto_155923 ) ( ON ?auto_155924 ?auto_155925 ) ( CLEAR ?auto_155924 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_155920 ?auto_155921 ?auto_155922 ?auto_155923 ?auto_155924 )
      ( MAKE-6PILE ?auto_155920 ?auto_155921 ?auto_155922 ?auto_155923 ?auto_155924 ?auto_155925 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_155933 - BLOCK
      ?auto_155934 - BLOCK
      ?auto_155935 - BLOCK
      ?auto_155936 - BLOCK
      ?auto_155937 - BLOCK
      ?auto_155938 - BLOCK
    )
    :vars
    (
      ?auto_155939 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155938 ?auto_155939 ) ( ON-TABLE ?auto_155933 ) ( ON ?auto_155934 ?auto_155933 ) ( ON ?auto_155935 ?auto_155934 ) ( ON ?auto_155936 ?auto_155935 ) ( not ( = ?auto_155933 ?auto_155934 ) ) ( not ( = ?auto_155933 ?auto_155935 ) ) ( not ( = ?auto_155933 ?auto_155936 ) ) ( not ( = ?auto_155933 ?auto_155937 ) ) ( not ( = ?auto_155933 ?auto_155938 ) ) ( not ( = ?auto_155933 ?auto_155939 ) ) ( not ( = ?auto_155934 ?auto_155935 ) ) ( not ( = ?auto_155934 ?auto_155936 ) ) ( not ( = ?auto_155934 ?auto_155937 ) ) ( not ( = ?auto_155934 ?auto_155938 ) ) ( not ( = ?auto_155934 ?auto_155939 ) ) ( not ( = ?auto_155935 ?auto_155936 ) ) ( not ( = ?auto_155935 ?auto_155937 ) ) ( not ( = ?auto_155935 ?auto_155938 ) ) ( not ( = ?auto_155935 ?auto_155939 ) ) ( not ( = ?auto_155936 ?auto_155937 ) ) ( not ( = ?auto_155936 ?auto_155938 ) ) ( not ( = ?auto_155936 ?auto_155939 ) ) ( not ( = ?auto_155937 ?auto_155938 ) ) ( not ( = ?auto_155937 ?auto_155939 ) ) ( not ( = ?auto_155938 ?auto_155939 ) ) ( CLEAR ?auto_155936 ) ( ON ?auto_155937 ?auto_155938 ) ( CLEAR ?auto_155937 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_155933 ?auto_155934 ?auto_155935 ?auto_155936 ?auto_155937 )
      ( MAKE-6PILE ?auto_155933 ?auto_155934 ?auto_155935 ?auto_155936 ?auto_155937 ?auto_155938 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_155946 - BLOCK
      ?auto_155947 - BLOCK
      ?auto_155948 - BLOCK
      ?auto_155949 - BLOCK
      ?auto_155950 - BLOCK
      ?auto_155951 - BLOCK
    )
    :vars
    (
      ?auto_155952 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155951 ?auto_155952 ) ( ON-TABLE ?auto_155946 ) ( ON ?auto_155947 ?auto_155946 ) ( ON ?auto_155948 ?auto_155947 ) ( not ( = ?auto_155946 ?auto_155947 ) ) ( not ( = ?auto_155946 ?auto_155948 ) ) ( not ( = ?auto_155946 ?auto_155949 ) ) ( not ( = ?auto_155946 ?auto_155950 ) ) ( not ( = ?auto_155946 ?auto_155951 ) ) ( not ( = ?auto_155946 ?auto_155952 ) ) ( not ( = ?auto_155947 ?auto_155948 ) ) ( not ( = ?auto_155947 ?auto_155949 ) ) ( not ( = ?auto_155947 ?auto_155950 ) ) ( not ( = ?auto_155947 ?auto_155951 ) ) ( not ( = ?auto_155947 ?auto_155952 ) ) ( not ( = ?auto_155948 ?auto_155949 ) ) ( not ( = ?auto_155948 ?auto_155950 ) ) ( not ( = ?auto_155948 ?auto_155951 ) ) ( not ( = ?auto_155948 ?auto_155952 ) ) ( not ( = ?auto_155949 ?auto_155950 ) ) ( not ( = ?auto_155949 ?auto_155951 ) ) ( not ( = ?auto_155949 ?auto_155952 ) ) ( not ( = ?auto_155950 ?auto_155951 ) ) ( not ( = ?auto_155950 ?auto_155952 ) ) ( not ( = ?auto_155951 ?auto_155952 ) ) ( ON ?auto_155950 ?auto_155951 ) ( CLEAR ?auto_155948 ) ( ON ?auto_155949 ?auto_155950 ) ( CLEAR ?auto_155949 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_155946 ?auto_155947 ?auto_155948 ?auto_155949 )
      ( MAKE-6PILE ?auto_155946 ?auto_155947 ?auto_155948 ?auto_155949 ?auto_155950 ?auto_155951 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_155959 - BLOCK
      ?auto_155960 - BLOCK
      ?auto_155961 - BLOCK
      ?auto_155962 - BLOCK
      ?auto_155963 - BLOCK
      ?auto_155964 - BLOCK
    )
    :vars
    (
      ?auto_155965 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155964 ?auto_155965 ) ( ON-TABLE ?auto_155959 ) ( ON ?auto_155960 ?auto_155959 ) ( ON ?auto_155961 ?auto_155960 ) ( not ( = ?auto_155959 ?auto_155960 ) ) ( not ( = ?auto_155959 ?auto_155961 ) ) ( not ( = ?auto_155959 ?auto_155962 ) ) ( not ( = ?auto_155959 ?auto_155963 ) ) ( not ( = ?auto_155959 ?auto_155964 ) ) ( not ( = ?auto_155959 ?auto_155965 ) ) ( not ( = ?auto_155960 ?auto_155961 ) ) ( not ( = ?auto_155960 ?auto_155962 ) ) ( not ( = ?auto_155960 ?auto_155963 ) ) ( not ( = ?auto_155960 ?auto_155964 ) ) ( not ( = ?auto_155960 ?auto_155965 ) ) ( not ( = ?auto_155961 ?auto_155962 ) ) ( not ( = ?auto_155961 ?auto_155963 ) ) ( not ( = ?auto_155961 ?auto_155964 ) ) ( not ( = ?auto_155961 ?auto_155965 ) ) ( not ( = ?auto_155962 ?auto_155963 ) ) ( not ( = ?auto_155962 ?auto_155964 ) ) ( not ( = ?auto_155962 ?auto_155965 ) ) ( not ( = ?auto_155963 ?auto_155964 ) ) ( not ( = ?auto_155963 ?auto_155965 ) ) ( not ( = ?auto_155964 ?auto_155965 ) ) ( ON ?auto_155963 ?auto_155964 ) ( CLEAR ?auto_155961 ) ( ON ?auto_155962 ?auto_155963 ) ( CLEAR ?auto_155962 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_155959 ?auto_155960 ?auto_155961 ?auto_155962 )
      ( MAKE-6PILE ?auto_155959 ?auto_155960 ?auto_155961 ?auto_155962 ?auto_155963 ?auto_155964 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_155972 - BLOCK
      ?auto_155973 - BLOCK
      ?auto_155974 - BLOCK
      ?auto_155975 - BLOCK
      ?auto_155976 - BLOCK
      ?auto_155977 - BLOCK
    )
    :vars
    (
      ?auto_155978 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155977 ?auto_155978 ) ( ON-TABLE ?auto_155972 ) ( ON ?auto_155973 ?auto_155972 ) ( not ( = ?auto_155972 ?auto_155973 ) ) ( not ( = ?auto_155972 ?auto_155974 ) ) ( not ( = ?auto_155972 ?auto_155975 ) ) ( not ( = ?auto_155972 ?auto_155976 ) ) ( not ( = ?auto_155972 ?auto_155977 ) ) ( not ( = ?auto_155972 ?auto_155978 ) ) ( not ( = ?auto_155973 ?auto_155974 ) ) ( not ( = ?auto_155973 ?auto_155975 ) ) ( not ( = ?auto_155973 ?auto_155976 ) ) ( not ( = ?auto_155973 ?auto_155977 ) ) ( not ( = ?auto_155973 ?auto_155978 ) ) ( not ( = ?auto_155974 ?auto_155975 ) ) ( not ( = ?auto_155974 ?auto_155976 ) ) ( not ( = ?auto_155974 ?auto_155977 ) ) ( not ( = ?auto_155974 ?auto_155978 ) ) ( not ( = ?auto_155975 ?auto_155976 ) ) ( not ( = ?auto_155975 ?auto_155977 ) ) ( not ( = ?auto_155975 ?auto_155978 ) ) ( not ( = ?auto_155976 ?auto_155977 ) ) ( not ( = ?auto_155976 ?auto_155978 ) ) ( not ( = ?auto_155977 ?auto_155978 ) ) ( ON ?auto_155976 ?auto_155977 ) ( ON ?auto_155975 ?auto_155976 ) ( CLEAR ?auto_155973 ) ( ON ?auto_155974 ?auto_155975 ) ( CLEAR ?auto_155974 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_155972 ?auto_155973 ?auto_155974 )
      ( MAKE-6PILE ?auto_155972 ?auto_155973 ?auto_155974 ?auto_155975 ?auto_155976 ?auto_155977 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_155985 - BLOCK
      ?auto_155986 - BLOCK
      ?auto_155987 - BLOCK
      ?auto_155988 - BLOCK
      ?auto_155989 - BLOCK
      ?auto_155990 - BLOCK
    )
    :vars
    (
      ?auto_155991 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155990 ?auto_155991 ) ( ON-TABLE ?auto_155985 ) ( ON ?auto_155986 ?auto_155985 ) ( not ( = ?auto_155985 ?auto_155986 ) ) ( not ( = ?auto_155985 ?auto_155987 ) ) ( not ( = ?auto_155985 ?auto_155988 ) ) ( not ( = ?auto_155985 ?auto_155989 ) ) ( not ( = ?auto_155985 ?auto_155990 ) ) ( not ( = ?auto_155985 ?auto_155991 ) ) ( not ( = ?auto_155986 ?auto_155987 ) ) ( not ( = ?auto_155986 ?auto_155988 ) ) ( not ( = ?auto_155986 ?auto_155989 ) ) ( not ( = ?auto_155986 ?auto_155990 ) ) ( not ( = ?auto_155986 ?auto_155991 ) ) ( not ( = ?auto_155987 ?auto_155988 ) ) ( not ( = ?auto_155987 ?auto_155989 ) ) ( not ( = ?auto_155987 ?auto_155990 ) ) ( not ( = ?auto_155987 ?auto_155991 ) ) ( not ( = ?auto_155988 ?auto_155989 ) ) ( not ( = ?auto_155988 ?auto_155990 ) ) ( not ( = ?auto_155988 ?auto_155991 ) ) ( not ( = ?auto_155989 ?auto_155990 ) ) ( not ( = ?auto_155989 ?auto_155991 ) ) ( not ( = ?auto_155990 ?auto_155991 ) ) ( ON ?auto_155989 ?auto_155990 ) ( ON ?auto_155988 ?auto_155989 ) ( CLEAR ?auto_155986 ) ( ON ?auto_155987 ?auto_155988 ) ( CLEAR ?auto_155987 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_155985 ?auto_155986 ?auto_155987 )
      ( MAKE-6PILE ?auto_155985 ?auto_155986 ?auto_155987 ?auto_155988 ?auto_155989 ?auto_155990 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_155998 - BLOCK
      ?auto_155999 - BLOCK
      ?auto_156000 - BLOCK
      ?auto_156001 - BLOCK
      ?auto_156002 - BLOCK
      ?auto_156003 - BLOCK
    )
    :vars
    (
      ?auto_156004 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156003 ?auto_156004 ) ( ON-TABLE ?auto_155998 ) ( not ( = ?auto_155998 ?auto_155999 ) ) ( not ( = ?auto_155998 ?auto_156000 ) ) ( not ( = ?auto_155998 ?auto_156001 ) ) ( not ( = ?auto_155998 ?auto_156002 ) ) ( not ( = ?auto_155998 ?auto_156003 ) ) ( not ( = ?auto_155998 ?auto_156004 ) ) ( not ( = ?auto_155999 ?auto_156000 ) ) ( not ( = ?auto_155999 ?auto_156001 ) ) ( not ( = ?auto_155999 ?auto_156002 ) ) ( not ( = ?auto_155999 ?auto_156003 ) ) ( not ( = ?auto_155999 ?auto_156004 ) ) ( not ( = ?auto_156000 ?auto_156001 ) ) ( not ( = ?auto_156000 ?auto_156002 ) ) ( not ( = ?auto_156000 ?auto_156003 ) ) ( not ( = ?auto_156000 ?auto_156004 ) ) ( not ( = ?auto_156001 ?auto_156002 ) ) ( not ( = ?auto_156001 ?auto_156003 ) ) ( not ( = ?auto_156001 ?auto_156004 ) ) ( not ( = ?auto_156002 ?auto_156003 ) ) ( not ( = ?auto_156002 ?auto_156004 ) ) ( not ( = ?auto_156003 ?auto_156004 ) ) ( ON ?auto_156002 ?auto_156003 ) ( ON ?auto_156001 ?auto_156002 ) ( ON ?auto_156000 ?auto_156001 ) ( CLEAR ?auto_155998 ) ( ON ?auto_155999 ?auto_156000 ) ( CLEAR ?auto_155999 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_155998 ?auto_155999 )
      ( MAKE-6PILE ?auto_155998 ?auto_155999 ?auto_156000 ?auto_156001 ?auto_156002 ?auto_156003 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_156011 - BLOCK
      ?auto_156012 - BLOCK
      ?auto_156013 - BLOCK
      ?auto_156014 - BLOCK
      ?auto_156015 - BLOCK
      ?auto_156016 - BLOCK
    )
    :vars
    (
      ?auto_156017 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156016 ?auto_156017 ) ( ON-TABLE ?auto_156011 ) ( not ( = ?auto_156011 ?auto_156012 ) ) ( not ( = ?auto_156011 ?auto_156013 ) ) ( not ( = ?auto_156011 ?auto_156014 ) ) ( not ( = ?auto_156011 ?auto_156015 ) ) ( not ( = ?auto_156011 ?auto_156016 ) ) ( not ( = ?auto_156011 ?auto_156017 ) ) ( not ( = ?auto_156012 ?auto_156013 ) ) ( not ( = ?auto_156012 ?auto_156014 ) ) ( not ( = ?auto_156012 ?auto_156015 ) ) ( not ( = ?auto_156012 ?auto_156016 ) ) ( not ( = ?auto_156012 ?auto_156017 ) ) ( not ( = ?auto_156013 ?auto_156014 ) ) ( not ( = ?auto_156013 ?auto_156015 ) ) ( not ( = ?auto_156013 ?auto_156016 ) ) ( not ( = ?auto_156013 ?auto_156017 ) ) ( not ( = ?auto_156014 ?auto_156015 ) ) ( not ( = ?auto_156014 ?auto_156016 ) ) ( not ( = ?auto_156014 ?auto_156017 ) ) ( not ( = ?auto_156015 ?auto_156016 ) ) ( not ( = ?auto_156015 ?auto_156017 ) ) ( not ( = ?auto_156016 ?auto_156017 ) ) ( ON ?auto_156015 ?auto_156016 ) ( ON ?auto_156014 ?auto_156015 ) ( ON ?auto_156013 ?auto_156014 ) ( CLEAR ?auto_156011 ) ( ON ?auto_156012 ?auto_156013 ) ( CLEAR ?auto_156012 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_156011 ?auto_156012 )
      ( MAKE-6PILE ?auto_156011 ?auto_156012 ?auto_156013 ?auto_156014 ?auto_156015 ?auto_156016 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_156024 - BLOCK
      ?auto_156025 - BLOCK
      ?auto_156026 - BLOCK
      ?auto_156027 - BLOCK
      ?auto_156028 - BLOCK
      ?auto_156029 - BLOCK
    )
    :vars
    (
      ?auto_156030 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156029 ?auto_156030 ) ( not ( = ?auto_156024 ?auto_156025 ) ) ( not ( = ?auto_156024 ?auto_156026 ) ) ( not ( = ?auto_156024 ?auto_156027 ) ) ( not ( = ?auto_156024 ?auto_156028 ) ) ( not ( = ?auto_156024 ?auto_156029 ) ) ( not ( = ?auto_156024 ?auto_156030 ) ) ( not ( = ?auto_156025 ?auto_156026 ) ) ( not ( = ?auto_156025 ?auto_156027 ) ) ( not ( = ?auto_156025 ?auto_156028 ) ) ( not ( = ?auto_156025 ?auto_156029 ) ) ( not ( = ?auto_156025 ?auto_156030 ) ) ( not ( = ?auto_156026 ?auto_156027 ) ) ( not ( = ?auto_156026 ?auto_156028 ) ) ( not ( = ?auto_156026 ?auto_156029 ) ) ( not ( = ?auto_156026 ?auto_156030 ) ) ( not ( = ?auto_156027 ?auto_156028 ) ) ( not ( = ?auto_156027 ?auto_156029 ) ) ( not ( = ?auto_156027 ?auto_156030 ) ) ( not ( = ?auto_156028 ?auto_156029 ) ) ( not ( = ?auto_156028 ?auto_156030 ) ) ( not ( = ?auto_156029 ?auto_156030 ) ) ( ON ?auto_156028 ?auto_156029 ) ( ON ?auto_156027 ?auto_156028 ) ( ON ?auto_156026 ?auto_156027 ) ( ON ?auto_156025 ?auto_156026 ) ( ON ?auto_156024 ?auto_156025 ) ( CLEAR ?auto_156024 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_156024 )
      ( MAKE-6PILE ?auto_156024 ?auto_156025 ?auto_156026 ?auto_156027 ?auto_156028 ?auto_156029 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_156037 - BLOCK
      ?auto_156038 - BLOCK
      ?auto_156039 - BLOCK
      ?auto_156040 - BLOCK
      ?auto_156041 - BLOCK
      ?auto_156042 - BLOCK
    )
    :vars
    (
      ?auto_156043 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156042 ?auto_156043 ) ( not ( = ?auto_156037 ?auto_156038 ) ) ( not ( = ?auto_156037 ?auto_156039 ) ) ( not ( = ?auto_156037 ?auto_156040 ) ) ( not ( = ?auto_156037 ?auto_156041 ) ) ( not ( = ?auto_156037 ?auto_156042 ) ) ( not ( = ?auto_156037 ?auto_156043 ) ) ( not ( = ?auto_156038 ?auto_156039 ) ) ( not ( = ?auto_156038 ?auto_156040 ) ) ( not ( = ?auto_156038 ?auto_156041 ) ) ( not ( = ?auto_156038 ?auto_156042 ) ) ( not ( = ?auto_156038 ?auto_156043 ) ) ( not ( = ?auto_156039 ?auto_156040 ) ) ( not ( = ?auto_156039 ?auto_156041 ) ) ( not ( = ?auto_156039 ?auto_156042 ) ) ( not ( = ?auto_156039 ?auto_156043 ) ) ( not ( = ?auto_156040 ?auto_156041 ) ) ( not ( = ?auto_156040 ?auto_156042 ) ) ( not ( = ?auto_156040 ?auto_156043 ) ) ( not ( = ?auto_156041 ?auto_156042 ) ) ( not ( = ?auto_156041 ?auto_156043 ) ) ( not ( = ?auto_156042 ?auto_156043 ) ) ( ON ?auto_156041 ?auto_156042 ) ( ON ?auto_156040 ?auto_156041 ) ( ON ?auto_156039 ?auto_156040 ) ( ON ?auto_156038 ?auto_156039 ) ( ON ?auto_156037 ?auto_156038 ) ( CLEAR ?auto_156037 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_156037 )
      ( MAKE-6PILE ?auto_156037 ?auto_156038 ?auto_156039 ?auto_156040 ?auto_156041 ?auto_156042 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_156051 - BLOCK
      ?auto_156052 - BLOCK
      ?auto_156053 - BLOCK
      ?auto_156054 - BLOCK
      ?auto_156055 - BLOCK
      ?auto_156056 - BLOCK
      ?auto_156057 - BLOCK
    )
    :vars
    (
      ?auto_156058 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_156056 ) ( ON ?auto_156057 ?auto_156058 ) ( CLEAR ?auto_156057 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_156051 ) ( ON ?auto_156052 ?auto_156051 ) ( ON ?auto_156053 ?auto_156052 ) ( ON ?auto_156054 ?auto_156053 ) ( ON ?auto_156055 ?auto_156054 ) ( ON ?auto_156056 ?auto_156055 ) ( not ( = ?auto_156051 ?auto_156052 ) ) ( not ( = ?auto_156051 ?auto_156053 ) ) ( not ( = ?auto_156051 ?auto_156054 ) ) ( not ( = ?auto_156051 ?auto_156055 ) ) ( not ( = ?auto_156051 ?auto_156056 ) ) ( not ( = ?auto_156051 ?auto_156057 ) ) ( not ( = ?auto_156051 ?auto_156058 ) ) ( not ( = ?auto_156052 ?auto_156053 ) ) ( not ( = ?auto_156052 ?auto_156054 ) ) ( not ( = ?auto_156052 ?auto_156055 ) ) ( not ( = ?auto_156052 ?auto_156056 ) ) ( not ( = ?auto_156052 ?auto_156057 ) ) ( not ( = ?auto_156052 ?auto_156058 ) ) ( not ( = ?auto_156053 ?auto_156054 ) ) ( not ( = ?auto_156053 ?auto_156055 ) ) ( not ( = ?auto_156053 ?auto_156056 ) ) ( not ( = ?auto_156053 ?auto_156057 ) ) ( not ( = ?auto_156053 ?auto_156058 ) ) ( not ( = ?auto_156054 ?auto_156055 ) ) ( not ( = ?auto_156054 ?auto_156056 ) ) ( not ( = ?auto_156054 ?auto_156057 ) ) ( not ( = ?auto_156054 ?auto_156058 ) ) ( not ( = ?auto_156055 ?auto_156056 ) ) ( not ( = ?auto_156055 ?auto_156057 ) ) ( not ( = ?auto_156055 ?auto_156058 ) ) ( not ( = ?auto_156056 ?auto_156057 ) ) ( not ( = ?auto_156056 ?auto_156058 ) ) ( not ( = ?auto_156057 ?auto_156058 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_156057 ?auto_156058 )
      ( !STACK ?auto_156057 ?auto_156056 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_156066 - BLOCK
      ?auto_156067 - BLOCK
      ?auto_156068 - BLOCK
      ?auto_156069 - BLOCK
      ?auto_156070 - BLOCK
      ?auto_156071 - BLOCK
      ?auto_156072 - BLOCK
    )
    :vars
    (
      ?auto_156073 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_156071 ) ( ON ?auto_156072 ?auto_156073 ) ( CLEAR ?auto_156072 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_156066 ) ( ON ?auto_156067 ?auto_156066 ) ( ON ?auto_156068 ?auto_156067 ) ( ON ?auto_156069 ?auto_156068 ) ( ON ?auto_156070 ?auto_156069 ) ( ON ?auto_156071 ?auto_156070 ) ( not ( = ?auto_156066 ?auto_156067 ) ) ( not ( = ?auto_156066 ?auto_156068 ) ) ( not ( = ?auto_156066 ?auto_156069 ) ) ( not ( = ?auto_156066 ?auto_156070 ) ) ( not ( = ?auto_156066 ?auto_156071 ) ) ( not ( = ?auto_156066 ?auto_156072 ) ) ( not ( = ?auto_156066 ?auto_156073 ) ) ( not ( = ?auto_156067 ?auto_156068 ) ) ( not ( = ?auto_156067 ?auto_156069 ) ) ( not ( = ?auto_156067 ?auto_156070 ) ) ( not ( = ?auto_156067 ?auto_156071 ) ) ( not ( = ?auto_156067 ?auto_156072 ) ) ( not ( = ?auto_156067 ?auto_156073 ) ) ( not ( = ?auto_156068 ?auto_156069 ) ) ( not ( = ?auto_156068 ?auto_156070 ) ) ( not ( = ?auto_156068 ?auto_156071 ) ) ( not ( = ?auto_156068 ?auto_156072 ) ) ( not ( = ?auto_156068 ?auto_156073 ) ) ( not ( = ?auto_156069 ?auto_156070 ) ) ( not ( = ?auto_156069 ?auto_156071 ) ) ( not ( = ?auto_156069 ?auto_156072 ) ) ( not ( = ?auto_156069 ?auto_156073 ) ) ( not ( = ?auto_156070 ?auto_156071 ) ) ( not ( = ?auto_156070 ?auto_156072 ) ) ( not ( = ?auto_156070 ?auto_156073 ) ) ( not ( = ?auto_156071 ?auto_156072 ) ) ( not ( = ?auto_156071 ?auto_156073 ) ) ( not ( = ?auto_156072 ?auto_156073 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_156072 ?auto_156073 )
      ( !STACK ?auto_156072 ?auto_156071 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_156081 - BLOCK
      ?auto_156082 - BLOCK
      ?auto_156083 - BLOCK
      ?auto_156084 - BLOCK
      ?auto_156085 - BLOCK
      ?auto_156086 - BLOCK
      ?auto_156087 - BLOCK
    )
    :vars
    (
      ?auto_156088 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156087 ?auto_156088 ) ( ON-TABLE ?auto_156081 ) ( ON ?auto_156082 ?auto_156081 ) ( ON ?auto_156083 ?auto_156082 ) ( ON ?auto_156084 ?auto_156083 ) ( ON ?auto_156085 ?auto_156084 ) ( not ( = ?auto_156081 ?auto_156082 ) ) ( not ( = ?auto_156081 ?auto_156083 ) ) ( not ( = ?auto_156081 ?auto_156084 ) ) ( not ( = ?auto_156081 ?auto_156085 ) ) ( not ( = ?auto_156081 ?auto_156086 ) ) ( not ( = ?auto_156081 ?auto_156087 ) ) ( not ( = ?auto_156081 ?auto_156088 ) ) ( not ( = ?auto_156082 ?auto_156083 ) ) ( not ( = ?auto_156082 ?auto_156084 ) ) ( not ( = ?auto_156082 ?auto_156085 ) ) ( not ( = ?auto_156082 ?auto_156086 ) ) ( not ( = ?auto_156082 ?auto_156087 ) ) ( not ( = ?auto_156082 ?auto_156088 ) ) ( not ( = ?auto_156083 ?auto_156084 ) ) ( not ( = ?auto_156083 ?auto_156085 ) ) ( not ( = ?auto_156083 ?auto_156086 ) ) ( not ( = ?auto_156083 ?auto_156087 ) ) ( not ( = ?auto_156083 ?auto_156088 ) ) ( not ( = ?auto_156084 ?auto_156085 ) ) ( not ( = ?auto_156084 ?auto_156086 ) ) ( not ( = ?auto_156084 ?auto_156087 ) ) ( not ( = ?auto_156084 ?auto_156088 ) ) ( not ( = ?auto_156085 ?auto_156086 ) ) ( not ( = ?auto_156085 ?auto_156087 ) ) ( not ( = ?auto_156085 ?auto_156088 ) ) ( not ( = ?auto_156086 ?auto_156087 ) ) ( not ( = ?auto_156086 ?auto_156088 ) ) ( not ( = ?auto_156087 ?auto_156088 ) ) ( CLEAR ?auto_156085 ) ( ON ?auto_156086 ?auto_156087 ) ( CLEAR ?auto_156086 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_156081 ?auto_156082 ?auto_156083 ?auto_156084 ?auto_156085 ?auto_156086 )
      ( MAKE-7PILE ?auto_156081 ?auto_156082 ?auto_156083 ?auto_156084 ?auto_156085 ?auto_156086 ?auto_156087 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_156096 - BLOCK
      ?auto_156097 - BLOCK
      ?auto_156098 - BLOCK
      ?auto_156099 - BLOCK
      ?auto_156100 - BLOCK
      ?auto_156101 - BLOCK
      ?auto_156102 - BLOCK
    )
    :vars
    (
      ?auto_156103 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156102 ?auto_156103 ) ( ON-TABLE ?auto_156096 ) ( ON ?auto_156097 ?auto_156096 ) ( ON ?auto_156098 ?auto_156097 ) ( ON ?auto_156099 ?auto_156098 ) ( ON ?auto_156100 ?auto_156099 ) ( not ( = ?auto_156096 ?auto_156097 ) ) ( not ( = ?auto_156096 ?auto_156098 ) ) ( not ( = ?auto_156096 ?auto_156099 ) ) ( not ( = ?auto_156096 ?auto_156100 ) ) ( not ( = ?auto_156096 ?auto_156101 ) ) ( not ( = ?auto_156096 ?auto_156102 ) ) ( not ( = ?auto_156096 ?auto_156103 ) ) ( not ( = ?auto_156097 ?auto_156098 ) ) ( not ( = ?auto_156097 ?auto_156099 ) ) ( not ( = ?auto_156097 ?auto_156100 ) ) ( not ( = ?auto_156097 ?auto_156101 ) ) ( not ( = ?auto_156097 ?auto_156102 ) ) ( not ( = ?auto_156097 ?auto_156103 ) ) ( not ( = ?auto_156098 ?auto_156099 ) ) ( not ( = ?auto_156098 ?auto_156100 ) ) ( not ( = ?auto_156098 ?auto_156101 ) ) ( not ( = ?auto_156098 ?auto_156102 ) ) ( not ( = ?auto_156098 ?auto_156103 ) ) ( not ( = ?auto_156099 ?auto_156100 ) ) ( not ( = ?auto_156099 ?auto_156101 ) ) ( not ( = ?auto_156099 ?auto_156102 ) ) ( not ( = ?auto_156099 ?auto_156103 ) ) ( not ( = ?auto_156100 ?auto_156101 ) ) ( not ( = ?auto_156100 ?auto_156102 ) ) ( not ( = ?auto_156100 ?auto_156103 ) ) ( not ( = ?auto_156101 ?auto_156102 ) ) ( not ( = ?auto_156101 ?auto_156103 ) ) ( not ( = ?auto_156102 ?auto_156103 ) ) ( CLEAR ?auto_156100 ) ( ON ?auto_156101 ?auto_156102 ) ( CLEAR ?auto_156101 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_156096 ?auto_156097 ?auto_156098 ?auto_156099 ?auto_156100 ?auto_156101 )
      ( MAKE-7PILE ?auto_156096 ?auto_156097 ?auto_156098 ?auto_156099 ?auto_156100 ?auto_156101 ?auto_156102 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_156111 - BLOCK
      ?auto_156112 - BLOCK
      ?auto_156113 - BLOCK
      ?auto_156114 - BLOCK
      ?auto_156115 - BLOCK
      ?auto_156116 - BLOCK
      ?auto_156117 - BLOCK
    )
    :vars
    (
      ?auto_156118 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156117 ?auto_156118 ) ( ON-TABLE ?auto_156111 ) ( ON ?auto_156112 ?auto_156111 ) ( ON ?auto_156113 ?auto_156112 ) ( ON ?auto_156114 ?auto_156113 ) ( not ( = ?auto_156111 ?auto_156112 ) ) ( not ( = ?auto_156111 ?auto_156113 ) ) ( not ( = ?auto_156111 ?auto_156114 ) ) ( not ( = ?auto_156111 ?auto_156115 ) ) ( not ( = ?auto_156111 ?auto_156116 ) ) ( not ( = ?auto_156111 ?auto_156117 ) ) ( not ( = ?auto_156111 ?auto_156118 ) ) ( not ( = ?auto_156112 ?auto_156113 ) ) ( not ( = ?auto_156112 ?auto_156114 ) ) ( not ( = ?auto_156112 ?auto_156115 ) ) ( not ( = ?auto_156112 ?auto_156116 ) ) ( not ( = ?auto_156112 ?auto_156117 ) ) ( not ( = ?auto_156112 ?auto_156118 ) ) ( not ( = ?auto_156113 ?auto_156114 ) ) ( not ( = ?auto_156113 ?auto_156115 ) ) ( not ( = ?auto_156113 ?auto_156116 ) ) ( not ( = ?auto_156113 ?auto_156117 ) ) ( not ( = ?auto_156113 ?auto_156118 ) ) ( not ( = ?auto_156114 ?auto_156115 ) ) ( not ( = ?auto_156114 ?auto_156116 ) ) ( not ( = ?auto_156114 ?auto_156117 ) ) ( not ( = ?auto_156114 ?auto_156118 ) ) ( not ( = ?auto_156115 ?auto_156116 ) ) ( not ( = ?auto_156115 ?auto_156117 ) ) ( not ( = ?auto_156115 ?auto_156118 ) ) ( not ( = ?auto_156116 ?auto_156117 ) ) ( not ( = ?auto_156116 ?auto_156118 ) ) ( not ( = ?auto_156117 ?auto_156118 ) ) ( ON ?auto_156116 ?auto_156117 ) ( CLEAR ?auto_156114 ) ( ON ?auto_156115 ?auto_156116 ) ( CLEAR ?auto_156115 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_156111 ?auto_156112 ?auto_156113 ?auto_156114 ?auto_156115 )
      ( MAKE-7PILE ?auto_156111 ?auto_156112 ?auto_156113 ?auto_156114 ?auto_156115 ?auto_156116 ?auto_156117 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_156126 - BLOCK
      ?auto_156127 - BLOCK
      ?auto_156128 - BLOCK
      ?auto_156129 - BLOCK
      ?auto_156130 - BLOCK
      ?auto_156131 - BLOCK
      ?auto_156132 - BLOCK
    )
    :vars
    (
      ?auto_156133 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156132 ?auto_156133 ) ( ON-TABLE ?auto_156126 ) ( ON ?auto_156127 ?auto_156126 ) ( ON ?auto_156128 ?auto_156127 ) ( ON ?auto_156129 ?auto_156128 ) ( not ( = ?auto_156126 ?auto_156127 ) ) ( not ( = ?auto_156126 ?auto_156128 ) ) ( not ( = ?auto_156126 ?auto_156129 ) ) ( not ( = ?auto_156126 ?auto_156130 ) ) ( not ( = ?auto_156126 ?auto_156131 ) ) ( not ( = ?auto_156126 ?auto_156132 ) ) ( not ( = ?auto_156126 ?auto_156133 ) ) ( not ( = ?auto_156127 ?auto_156128 ) ) ( not ( = ?auto_156127 ?auto_156129 ) ) ( not ( = ?auto_156127 ?auto_156130 ) ) ( not ( = ?auto_156127 ?auto_156131 ) ) ( not ( = ?auto_156127 ?auto_156132 ) ) ( not ( = ?auto_156127 ?auto_156133 ) ) ( not ( = ?auto_156128 ?auto_156129 ) ) ( not ( = ?auto_156128 ?auto_156130 ) ) ( not ( = ?auto_156128 ?auto_156131 ) ) ( not ( = ?auto_156128 ?auto_156132 ) ) ( not ( = ?auto_156128 ?auto_156133 ) ) ( not ( = ?auto_156129 ?auto_156130 ) ) ( not ( = ?auto_156129 ?auto_156131 ) ) ( not ( = ?auto_156129 ?auto_156132 ) ) ( not ( = ?auto_156129 ?auto_156133 ) ) ( not ( = ?auto_156130 ?auto_156131 ) ) ( not ( = ?auto_156130 ?auto_156132 ) ) ( not ( = ?auto_156130 ?auto_156133 ) ) ( not ( = ?auto_156131 ?auto_156132 ) ) ( not ( = ?auto_156131 ?auto_156133 ) ) ( not ( = ?auto_156132 ?auto_156133 ) ) ( ON ?auto_156131 ?auto_156132 ) ( CLEAR ?auto_156129 ) ( ON ?auto_156130 ?auto_156131 ) ( CLEAR ?auto_156130 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_156126 ?auto_156127 ?auto_156128 ?auto_156129 ?auto_156130 )
      ( MAKE-7PILE ?auto_156126 ?auto_156127 ?auto_156128 ?auto_156129 ?auto_156130 ?auto_156131 ?auto_156132 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_156141 - BLOCK
      ?auto_156142 - BLOCK
      ?auto_156143 - BLOCK
      ?auto_156144 - BLOCK
      ?auto_156145 - BLOCK
      ?auto_156146 - BLOCK
      ?auto_156147 - BLOCK
    )
    :vars
    (
      ?auto_156148 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156147 ?auto_156148 ) ( ON-TABLE ?auto_156141 ) ( ON ?auto_156142 ?auto_156141 ) ( ON ?auto_156143 ?auto_156142 ) ( not ( = ?auto_156141 ?auto_156142 ) ) ( not ( = ?auto_156141 ?auto_156143 ) ) ( not ( = ?auto_156141 ?auto_156144 ) ) ( not ( = ?auto_156141 ?auto_156145 ) ) ( not ( = ?auto_156141 ?auto_156146 ) ) ( not ( = ?auto_156141 ?auto_156147 ) ) ( not ( = ?auto_156141 ?auto_156148 ) ) ( not ( = ?auto_156142 ?auto_156143 ) ) ( not ( = ?auto_156142 ?auto_156144 ) ) ( not ( = ?auto_156142 ?auto_156145 ) ) ( not ( = ?auto_156142 ?auto_156146 ) ) ( not ( = ?auto_156142 ?auto_156147 ) ) ( not ( = ?auto_156142 ?auto_156148 ) ) ( not ( = ?auto_156143 ?auto_156144 ) ) ( not ( = ?auto_156143 ?auto_156145 ) ) ( not ( = ?auto_156143 ?auto_156146 ) ) ( not ( = ?auto_156143 ?auto_156147 ) ) ( not ( = ?auto_156143 ?auto_156148 ) ) ( not ( = ?auto_156144 ?auto_156145 ) ) ( not ( = ?auto_156144 ?auto_156146 ) ) ( not ( = ?auto_156144 ?auto_156147 ) ) ( not ( = ?auto_156144 ?auto_156148 ) ) ( not ( = ?auto_156145 ?auto_156146 ) ) ( not ( = ?auto_156145 ?auto_156147 ) ) ( not ( = ?auto_156145 ?auto_156148 ) ) ( not ( = ?auto_156146 ?auto_156147 ) ) ( not ( = ?auto_156146 ?auto_156148 ) ) ( not ( = ?auto_156147 ?auto_156148 ) ) ( ON ?auto_156146 ?auto_156147 ) ( ON ?auto_156145 ?auto_156146 ) ( CLEAR ?auto_156143 ) ( ON ?auto_156144 ?auto_156145 ) ( CLEAR ?auto_156144 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_156141 ?auto_156142 ?auto_156143 ?auto_156144 )
      ( MAKE-7PILE ?auto_156141 ?auto_156142 ?auto_156143 ?auto_156144 ?auto_156145 ?auto_156146 ?auto_156147 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_156156 - BLOCK
      ?auto_156157 - BLOCK
      ?auto_156158 - BLOCK
      ?auto_156159 - BLOCK
      ?auto_156160 - BLOCK
      ?auto_156161 - BLOCK
      ?auto_156162 - BLOCK
    )
    :vars
    (
      ?auto_156163 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156162 ?auto_156163 ) ( ON-TABLE ?auto_156156 ) ( ON ?auto_156157 ?auto_156156 ) ( ON ?auto_156158 ?auto_156157 ) ( not ( = ?auto_156156 ?auto_156157 ) ) ( not ( = ?auto_156156 ?auto_156158 ) ) ( not ( = ?auto_156156 ?auto_156159 ) ) ( not ( = ?auto_156156 ?auto_156160 ) ) ( not ( = ?auto_156156 ?auto_156161 ) ) ( not ( = ?auto_156156 ?auto_156162 ) ) ( not ( = ?auto_156156 ?auto_156163 ) ) ( not ( = ?auto_156157 ?auto_156158 ) ) ( not ( = ?auto_156157 ?auto_156159 ) ) ( not ( = ?auto_156157 ?auto_156160 ) ) ( not ( = ?auto_156157 ?auto_156161 ) ) ( not ( = ?auto_156157 ?auto_156162 ) ) ( not ( = ?auto_156157 ?auto_156163 ) ) ( not ( = ?auto_156158 ?auto_156159 ) ) ( not ( = ?auto_156158 ?auto_156160 ) ) ( not ( = ?auto_156158 ?auto_156161 ) ) ( not ( = ?auto_156158 ?auto_156162 ) ) ( not ( = ?auto_156158 ?auto_156163 ) ) ( not ( = ?auto_156159 ?auto_156160 ) ) ( not ( = ?auto_156159 ?auto_156161 ) ) ( not ( = ?auto_156159 ?auto_156162 ) ) ( not ( = ?auto_156159 ?auto_156163 ) ) ( not ( = ?auto_156160 ?auto_156161 ) ) ( not ( = ?auto_156160 ?auto_156162 ) ) ( not ( = ?auto_156160 ?auto_156163 ) ) ( not ( = ?auto_156161 ?auto_156162 ) ) ( not ( = ?auto_156161 ?auto_156163 ) ) ( not ( = ?auto_156162 ?auto_156163 ) ) ( ON ?auto_156161 ?auto_156162 ) ( ON ?auto_156160 ?auto_156161 ) ( CLEAR ?auto_156158 ) ( ON ?auto_156159 ?auto_156160 ) ( CLEAR ?auto_156159 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_156156 ?auto_156157 ?auto_156158 ?auto_156159 )
      ( MAKE-7PILE ?auto_156156 ?auto_156157 ?auto_156158 ?auto_156159 ?auto_156160 ?auto_156161 ?auto_156162 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_156171 - BLOCK
      ?auto_156172 - BLOCK
      ?auto_156173 - BLOCK
      ?auto_156174 - BLOCK
      ?auto_156175 - BLOCK
      ?auto_156176 - BLOCK
      ?auto_156177 - BLOCK
    )
    :vars
    (
      ?auto_156178 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156177 ?auto_156178 ) ( ON-TABLE ?auto_156171 ) ( ON ?auto_156172 ?auto_156171 ) ( not ( = ?auto_156171 ?auto_156172 ) ) ( not ( = ?auto_156171 ?auto_156173 ) ) ( not ( = ?auto_156171 ?auto_156174 ) ) ( not ( = ?auto_156171 ?auto_156175 ) ) ( not ( = ?auto_156171 ?auto_156176 ) ) ( not ( = ?auto_156171 ?auto_156177 ) ) ( not ( = ?auto_156171 ?auto_156178 ) ) ( not ( = ?auto_156172 ?auto_156173 ) ) ( not ( = ?auto_156172 ?auto_156174 ) ) ( not ( = ?auto_156172 ?auto_156175 ) ) ( not ( = ?auto_156172 ?auto_156176 ) ) ( not ( = ?auto_156172 ?auto_156177 ) ) ( not ( = ?auto_156172 ?auto_156178 ) ) ( not ( = ?auto_156173 ?auto_156174 ) ) ( not ( = ?auto_156173 ?auto_156175 ) ) ( not ( = ?auto_156173 ?auto_156176 ) ) ( not ( = ?auto_156173 ?auto_156177 ) ) ( not ( = ?auto_156173 ?auto_156178 ) ) ( not ( = ?auto_156174 ?auto_156175 ) ) ( not ( = ?auto_156174 ?auto_156176 ) ) ( not ( = ?auto_156174 ?auto_156177 ) ) ( not ( = ?auto_156174 ?auto_156178 ) ) ( not ( = ?auto_156175 ?auto_156176 ) ) ( not ( = ?auto_156175 ?auto_156177 ) ) ( not ( = ?auto_156175 ?auto_156178 ) ) ( not ( = ?auto_156176 ?auto_156177 ) ) ( not ( = ?auto_156176 ?auto_156178 ) ) ( not ( = ?auto_156177 ?auto_156178 ) ) ( ON ?auto_156176 ?auto_156177 ) ( ON ?auto_156175 ?auto_156176 ) ( ON ?auto_156174 ?auto_156175 ) ( CLEAR ?auto_156172 ) ( ON ?auto_156173 ?auto_156174 ) ( CLEAR ?auto_156173 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_156171 ?auto_156172 ?auto_156173 )
      ( MAKE-7PILE ?auto_156171 ?auto_156172 ?auto_156173 ?auto_156174 ?auto_156175 ?auto_156176 ?auto_156177 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_156186 - BLOCK
      ?auto_156187 - BLOCK
      ?auto_156188 - BLOCK
      ?auto_156189 - BLOCK
      ?auto_156190 - BLOCK
      ?auto_156191 - BLOCK
      ?auto_156192 - BLOCK
    )
    :vars
    (
      ?auto_156193 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156192 ?auto_156193 ) ( ON-TABLE ?auto_156186 ) ( ON ?auto_156187 ?auto_156186 ) ( not ( = ?auto_156186 ?auto_156187 ) ) ( not ( = ?auto_156186 ?auto_156188 ) ) ( not ( = ?auto_156186 ?auto_156189 ) ) ( not ( = ?auto_156186 ?auto_156190 ) ) ( not ( = ?auto_156186 ?auto_156191 ) ) ( not ( = ?auto_156186 ?auto_156192 ) ) ( not ( = ?auto_156186 ?auto_156193 ) ) ( not ( = ?auto_156187 ?auto_156188 ) ) ( not ( = ?auto_156187 ?auto_156189 ) ) ( not ( = ?auto_156187 ?auto_156190 ) ) ( not ( = ?auto_156187 ?auto_156191 ) ) ( not ( = ?auto_156187 ?auto_156192 ) ) ( not ( = ?auto_156187 ?auto_156193 ) ) ( not ( = ?auto_156188 ?auto_156189 ) ) ( not ( = ?auto_156188 ?auto_156190 ) ) ( not ( = ?auto_156188 ?auto_156191 ) ) ( not ( = ?auto_156188 ?auto_156192 ) ) ( not ( = ?auto_156188 ?auto_156193 ) ) ( not ( = ?auto_156189 ?auto_156190 ) ) ( not ( = ?auto_156189 ?auto_156191 ) ) ( not ( = ?auto_156189 ?auto_156192 ) ) ( not ( = ?auto_156189 ?auto_156193 ) ) ( not ( = ?auto_156190 ?auto_156191 ) ) ( not ( = ?auto_156190 ?auto_156192 ) ) ( not ( = ?auto_156190 ?auto_156193 ) ) ( not ( = ?auto_156191 ?auto_156192 ) ) ( not ( = ?auto_156191 ?auto_156193 ) ) ( not ( = ?auto_156192 ?auto_156193 ) ) ( ON ?auto_156191 ?auto_156192 ) ( ON ?auto_156190 ?auto_156191 ) ( ON ?auto_156189 ?auto_156190 ) ( CLEAR ?auto_156187 ) ( ON ?auto_156188 ?auto_156189 ) ( CLEAR ?auto_156188 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_156186 ?auto_156187 ?auto_156188 )
      ( MAKE-7PILE ?auto_156186 ?auto_156187 ?auto_156188 ?auto_156189 ?auto_156190 ?auto_156191 ?auto_156192 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_156201 - BLOCK
      ?auto_156202 - BLOCK
      ?auto_156203 - BLOCK
      ?auto_156204 - BLOCK
      ?auto_156205 - BLOCK
      ?auto_156206 - BLOCK
      ?auto_156207 - BLOCK
    )
    :vars
    (
      ?auto_156208 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156207 ?auto_156208 ) ( ON-TABLE ?auto_156201 ) ( not ( = ?auto_156201 ?auto_156202 ) ) ( not ( = ?auto_156201 ?auto_156203 ) ) ( not ( = ?auto_156201 ?auto_156204 ) ) ( not ( = ?auto_156201 ?auto_156205 ) ) ( not ( = ?auto_156201 ?auto_156206 ) ) ( not ( = ?auto_156201 ?auto_156207 ) ) ( not ( = ?auto_156201 ?auto_156208 ) ) ( not ( = ?auto_156202 ?auto_156203 ) ) ( not ( = ?auto_156202 ?auto_156204 ) ) ( not ( = ?auto_156202 ?auto_156205 ) ) ( not ( = ?auto_156202 ?auto_156206 ) ) ( not ( = ?auto_156202 ?auto_156207 ) ) ( not ( = ?auto_156202 ?auto_156208 ) ) ( not ( = ?auto_156203 ?auto_156204 ) ) ( not ( = ?auto_156203 ?auto_156205 ) ) ( not ( = ?auto_156203 ?auto_156206 ) ) ( not ( = ?auto_156203 ?auto_156207 ) ) ( not ( = ?auto_156203 ?auto_156208 ) ) ( not ( = ?auto_156204 ?auto_156205 ) ) ( not ( = ?auto_156204 ?auto_156206 ) ) ( not ( = ?auto_156204 ?auto_156207 ) ) ( not ( = ?auto_156204 ?auto_156208 ) ) ( not ( = ?auto_156205 ?auto_156206 ) ) ( not ( = ?auto_156205 ?auto_156207 ) ) ( not ( = ?auto_156205 ?auto_156208 ) ) ( not ( = ?auto_156206 ?auto_156207 ) ) ( not ( = ?auto_156206 ?auto_156208 ) ) ( not ( = ?auto_156207 ?auto_156208 ) ) ( ON ?auto_156206 ?auto_156207 ) ( ON ?auto_156205 ?auto_156206 ) ( ON ?auto_156204 ?auto_156205 ) ( ON ?auto_156203 ?auto_156204 ) ( CLEAR ?auto_156201 ) ( ON ?auto_156202 ?auto_156203 ) ( CLEAR ?auto_156202 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_156201 ?auto_156202 )
      ( MAKE-7PILE ?auto_156201 ?auto_156202 ?auto_156203 ?auto_156204 ?auto_156205 ?auto_156206 ?auto_156207 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_156216 - BLOCK
      ?auto_156217 - BLOCK
      ?auto_156218 - BLOCK
      ?auto_156219 - BLOCK
      ?auto_156220 - BLOCK
      ?auto_156221 - BLOCK
      ?auto_156222 - BLOCK
    )
    :vars
    (
      ?auto_156223 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156222 ?auto_156223 ) ( ON-TABLE ?auto_156216 ) ( not ( = ?auto_156216 ?auto_156217 ) ) ( not ( = ?auto_156216 ?auto_156218 ) ) ( not ( = ?auto_156216 ?auto_156219 ) ) ( not ( = ?auto_156216 ?auto_156220 ) ) ( not ( = ?auto_156216 ?auto_156221 ) ) ( not ( = ?auto_156216 ?auto_156222 ) ) ( not ( = ?auto_156216 ?auto_156223 ) ) ( not ( = ?auto_156217 ?auto_156218 ) ) ( not ( = ?auto_156217 ?auto_156219 ) ) ( not ( = ?auto_156217 ?auto_156220 ) ) ( not ( = ?auto_156217 ?auto_156221 ) ) ( not ( = ?auto_156217 ?auto_156222 ) ) ( not ( = ?auto_156217 ?auto_156223 ) ) ( not ( = ?auto_156218 ?auto_156219 ) ) ( not ( = ?auto_156218 ?auto_156220 ) ) ( not ( = ?auto_156218 ?auto_156221 ) ) ( not ( = ?auto_156218 ?auto_156222 ) ) ( not ( = ?auto_156218 ?auto_156223 ) ) ( not ( = ?auto_156219 ?auto_156220 ) ) ( not ( = ?auto_156219 ?auto_156221 ) ) ( not ( = ?auto_156219 ?auto_156222 ) ) ( not ( = ?auto_156219 ?auto_156223 ) ) ( not ( = ?auto_156220 ?auto_156221 ) ) ( not ( = ?auto_156220 ?auto_156222 ) ) ( not ( = ?auto_156220 ?auto_156223 ) ) ( not ( = ?auto_156221 ?auto_156222 ) ) ( not ( = ?auto_156221 ?auto_156223 ) ) ( not ( = ?auto_156222 ?auto_156223 ) ) ( ON ?auto_156221 ?auto_156222 ) ( ON ?auto_156220 ?auto_156221 ) ( ON ?auto_156219 ?auto_156220 ) ( ON ?auto_156218 ?auto_156219 ) ( CLEAR ?auto_156216 ) ( ON ?auto_156217 ?auto_156218 ) ( CLEAR ?auto_156217 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_156216 ?auto_156217 )
      ( MAKE-7PILE ?auto_156216 ?auto_156217 ?auto_156218 ?auto_156219 ?auto_156220 ?auto_156221 ?auto_156222 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_156231 - BLOCK
      ?auto_156232 - BLOCK
      ?auto_156233 - BLOCK
      ?auto_156234 - BLOCK
      ?auto_156235 - BLOCK
      ?auto_156236 - BLOCK
      ?auto_156237 - BLOCK
    )
    :vars
    (
      ?auto_156238 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156237 ?auto_156238 ) ( not ( = ?auto_156231 ?auto_156232 ) ) ( not ( = ?auto_156231 ?auto_156233 ) ) ( not ( = ?auto_156231 ?auto_156234 ) ) ( not ( = ?auto_156231 ?auto_156235 ) ) ( not ( = ?auto_156231 ?auto_156236 ) ) ( not ( = ?auto_156231 ?auto_156237 ) ) ( not ( = ?auto_156231 ?auto_156238 ) ) ( not ( = ?auto_156232 ?auto_156233 ) ) ( not ( = ?auto_156232 ?auto_156234 ) ) ( not ( = ?auto_156232 ?auto_156235 ) ) ( not ( = ?auto_156232 ?auto_156236 ) ) ( not ( = ?auto_156232 ?auto_156237 ) ) ( not ( = ?auto_156232 ?auto_156238 ) ) ( not ( = ?auto_156233 ?auto_156234 ) ) ( not ( = ?auto_156233 ?auto_156235 ) ) ( not ( = ?auto_156233 ?auto_156236 ) ) ( not ( = ?auto_156233 ?auto_156237 ) ) ( not ( = ?auto_156233 ?auto_156238 ) ) ( not ( = ?auto_156234 ?auto_156235 ) ) ( not ( = ?auto_156234 ?auto_156236 ) ) ( not ( = ?auto_156234 ?auto_156237 ) ) ( not ( = ?auto_156234 ?auto_156238 ) ) ( not ( = ?auto_156235 ?auto_156236 ) ) ( not ( = ?auto_156235 ?auto_156237 ) ) ( not ( = ?auto_156235 ?auto_156238 ) ) ( not ( = ?auto_156236 ?auto_156237 ) ) ( not ( = ?auto_156236 ?auto_156238 ) ) ( not ( = ?auto_156237 ?auto_156238 ) ) ( ON ?auto_156236 ?auto_156237 ) ( ON ?auto_156235 ?auto_156236 ) ( ON ?auto_156234 ?auto_156235 ) ( ON ?auto_156233 ?auto_156234 ) ( ON ?auto_156232 ?auto_156233 ) ( ON ?auto_156231 ?auto_156232 ) ( CLEAR ?auto_156231 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_156231 )
      ( MAKE-7PILE ?auto_156231 ?auto_156232 ?auto_156233 ?auto_156234 ?auto_156235 ?auto_156236 ?auto_156237 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_156246 - BLOCK
      ?auto_156247 - BLOCK
      ?auto_156248 - BLOCK
      ?auto_156249 - BLOCK
      ?auto_156250 - BLOCK
      ?auto_156251 - BLOCK
      ?auto_156252 - BLOCK
    )
    :vars
    (
      ?auto_156253 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156252 ?auto_156253 ) ( not ( = ?auto_156246 ?auto_156247 ) ) ( not ( = ?auto_156246 ?auto_156248 ) ) ( not ( = ?auto_156246 ?auto_156249 ) ) ( not ( = ?auto_156246 ?auto_156250 ) ) ( not ( = ?auto_156246 ?auto_156251 ) ) ( not ( = ?auto_156246 ?auto_156252 ) ) ( not ( = ?auto_156246 ?auto_156253 ) ) ( not ( = ?auto_156247 ?auto_156248 ) ) ( not ( = ?auto_156247 ?auto_156249 ) ) ( not ( = ?auto_156247 ?auto_156250 ) ) ( not ( = ?auto_156247 ?auto_156251 ) ) ( not ( = ?auto_156247 ?auto_156252 ) ) ( not ( = ?auto_156247 ?auto_156253 ) ) ( not ( = ?auto_156248 ?auto_156249 ) ) ( not ( = ?auto_156248 ?auto_156250 ) ) ( not ( = ?auto_156248 ?auto_156251 ) ) ( not ( = ?auto_156248 ?auto_156252 ) ) ( not ( = ?auto_156248 ?auto_156253 ) ) ( not ( = ?auto_156249 ?auto_156250 ) ) ( not ( = ?auto_156249 ?auto_156251 ) ) ( not ( = ?auto_156249 ?auto_156252 ) ) ( not ( = ?auto_156249 ?auto_156253 ) ) ( not ( = ?auto_156250 ?auto_156251 ) ) ( not ( = ?auto_156250 ?auto_156252 ) ) ( not ( = ?auto_156250 ?auto_156253 ) ) ( not ( = ?auto_156251 ?auto_156252 ) ) ( not ( = ?auto_156251 ?auto_156253 ) ) ( not ( = ?auto_156252 ?auto_156253 ) ) ( ON ?auto_156251 ?auto_156252 ) ( ON ?auto_156250 ?auto_156251 ) ( ON ?auto_156249 ?auto_156250 ) ( ON ?auto_156248 ?auto_156249 ) ( ON ?auto_156247 ?auto_156248 ) ( ON ?auto_156246 ?auto_156247 ) ( CLEAR ?auto_156246 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_156246 )
      ( MAKE-7PILE ?auto_156246 ?auto_156247 ?auto_156248 ?auto_156249 ?auto_156250 ?auto_156251 ?auto_156252 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_156262 - BLOCK
      ?auto_156263 - BLOCK
      ?auto_156264 - BLOCK
      ?auto_156265 - BLOCK
      ?auto_156266 - BLOCK
      ?auto_156267 - BLOCK
      ?auto_156268 - BLOCK
      ?auto_156269 - BLOCK
    )
    :vars
    (
      ?auto_156270 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_156268 ) ( ON ?auto_156269 ?auto_156270 ) ( CLEAR ?auto_156269 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_156262 ) ( ON ?auto_156263 ?auto_156262 ) ( ON ?auto_156264 ?auto_156263 ) ( ON ?auto_156265 ?auto_156264 ) ( ON ?auto_156266 ?auto_156265 ) ( ON ?auto_156267 ?auto_156266 ) ( ON ?auto_156268 ?auto_156267 ) ( not ( = ?auto_156262 ?auto_156263 ) ) ( not ( = ?auto_156262 ?auto_156264 ) ) ( not ( = ?auto_156262 ?auto_156265 ) ) ( not ( = ?auto_156262 ?auto_156266 ) ) ( not ( = ?auto_156262 ?auto_156267 ) ) ( not ( = ?auto_156262 ?auto_156268 ) ) ( not ( = ?auto_156262 ?auto_156269 ) ) ( not ( = ?auto_156262 ?auto_156270 ) ) ( not ( = ?auto_156263 ?auto_156264 ) ) ( not ( = ?auto_156263 ?auto_156265 ) ) ( not ( = ?auto_156263 ?auto_156266 ) ) ( not ( = ?auto_156263 ?auto_156267 ) ) ( not ( = ?auto_156263 ?auto_156268 ) ) ( not ( = ?auto_156263 ?auto_156269 ) ) ( not ( = ?auto_156263 ?auto_156270 ) ) ( not ( = ?auto_156264 ?auto_156265 ) ) ( not ( = ?auto_156264 ?auto_156266 ) ) ( not ( = ?auto_156264 ?auto_156267 ) ) ( not ( = ?auto_156264 ?auto_156268 ) ) ( not ( = ?auto_156264 ?auto_156269 ) ) ( not ( = ?auto_156264 ?auto_156270 ) ) ( not ( = ?auto_156265 ?auto_156266 ) ) ( not ( = ?auto_156265 ?auto_156267 ) ) ( not ( = ?auto_156265 ?auto_156268 ) ) ( not ( = ?auto_156265 ?auto_156269 ) ) ( not ( = ?auto_156265 ?auto_156270 ) ) ( not ( = ?auto_156266 ?auto_156267 ) ) ( not ( = ?auto_156266 ?auto_156268 ) ) ( not ( = ?auto_156266 ?auto_156269 ) ) ( not ( = ?auto_156266 ?auto_156270 ) ) ( not ( = ?auto_156267 ?auto_156268 ) ) ( not ( = ?auto_156267 ?auto_156269 ) ) ( not ( = ?auto_156267 ?auto_156270 ) ) ( not ( = ?auto_156268 ?auto_156269 ) ) ( not ( = ?auto_156268 ?auto_156270 ) ) ( not ( = ?auto_156269 ?auto_156270 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_156269 ?auto_156270 )
      ( !STACK ?auto_156269 ?auto_156268 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_156279 - BLOCK
      ?auto_156280 - BLOCK
      ?auto_156281 - BLOCK
      ?auto_156282 - BLOCK
      ?auto_156283 - BLOCK
      ?auto_156284 - BLOCK
      ?auto_156285 - BLOCK
      ?auto_156286 - BLOCK
    )
    :vars
    (
      ?auto_156287 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_156285 ) ( ON ?auto_156286 ?auto_156287 ) ( CLEAR ?auto_156286 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_156279 ) ( ON ?auto_156280 ?auto_156279 ) ( ON ?auto_156281 ?auto_156280 ) ( ON ?auto_156282 ?auto_156281 ) ( ON ?auto_156283 ?auto_156282 ) ( ON ?auto_156284 ?auto_156283 ) ( ON ?auto_156285 ?auto_156284 ) ( not ( = ?auto_156279 ?auto_156280 ) ) ( not ( = ?auto_156279 ?auto_156281 ) ) ( not ( = ?auto_156279 ?auto_156282 ) ) ( not ( = ?auto_156279 ?auto_156283 ) ) ( not ( = ?auto_156279 ?auto_156284 ) ) ( not ( = ?auto_156279 ?auto_156285 ) ) ( not ( = ?auto_156279 ?auto_156286 ) ) ( not ( = ?auto_156279 ?auto_156287 ) ) ( not ( = ?auto_156280 ?auto_156281 ) ) ( not ( = ?auto_156280 ?auto_156282 ) ) ( not ( = ?auto_156280 ?auto_156283 ) ) ( not ( = ?auto_156280 ?auto_156284 ) ) ( not ( = ?auto_156280 ?auto_156285 ) ) ( not ( = ?auto_156280 ?auto_156286 ) ) ( not ( = ?auto_156280 ?auto_156287 ) ) ( not ( = ?auto_156281 ?auto_156282 ) ) ( not ( = ?auto_156281 ?auto_156283 ) ) ( not ( = ?auto_156281 ?auto_156284 ) ) ( not ( = ?auto_156281 ?auto_156285 ) ) ( not ( = ?auto_156281 ?auto_156286 ) ) ( not ( = ?auto_156281 ?auto_156287 ) ) ( not ( = ?auto_156282 ?auto_156283 ) ) ( not ( = ?auto_156282 ?auto_156284 ) ) ( not ( = ?auto_156282 ?auto_156285 ) ) ( not ( = ?auto_156282 ?auto_156286 ) ) ( not ( = ?auto_156282 ?auto_156287 ) ) ( not ( = ?auto_156283 ?auto_156284 ) ) ( not ( = ?auto_156283 ?auto_156285 ) ) ( not ( = ?auto_156283 ?auto_156286 ) ) ( not ( = ?auto_156283 ?auto_156287 ) ) ( not ( = ?auto_156284 ?auto_156285 ) ) ( not ( = ?auto_156284 ?auto_156286 ) ) ( not ( = ?auto_156284 ?auto_156287 ) ) ( not ( = ?auto_156285 ?auto_156286 ) ) ( not ( = ?auto_156285 ?auto_156287 ) ) ( not ( = ?auto_156286 ?auto_156287 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_156286 ?auto_156287 )
      ( !STACK ?auto_156286 ?auto_156285 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_156296 - BLOCK
      ?auto_156297 - BLOCK
      ?auto_156298 - BLOCK
      ?auto_156299 - BLOCK
      ?auto_156300 - BLOCK
      ?auto_156301 - BLOCK
      ?auto_156302 - BLOCK
      ?auto_156303 - BLOCK
    )
    :vars
    (
      ?auto_156304 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156303 ?auto_156304 ) ( ON-TABLE ?auto_156296 ) ( ON ?auto_156297 ?auto_156296 ) ( ON ?auto_156298 ?auto_156297 ) ( ON ?auto_156299 ?auto_156298 ) ( ON ?auto_156300 ?auto_156299 ) ( ON ?auto_156301 ?auto_156300 ) ( not ( = ?auto_156296 ?auto_156297 ) ) ( not ( = ?auto_156296 ?auto_156298 ) ) ( not ( = ?auto_156296 ?auto_156299 ) ) ( not ( = ?auto_156296 ?auto_156300 ) ) ( not ( = ?auto_156296 ?auto_156301 ) ) ( not ( = ?auto_156296 ?auto_156302 ) ) ( not ( = ?auto_156296 ?auto_156303 ) ) ( not ( = ?auto_156296 ?auto_156304 ) ) ( not ( = ?auto_156297 ?auto_156298 ) ) ( not ( = ?auto_156297 ?auto_156299 ) ) ( not ( = ?auto_156297 ?auto_156300 ) ) ( not ( = ?auto_156297 ?auto_156301 ) ) ( not ( = ?auto_156297 ?auto_156302 ) ) ( not ( = ?auto_156297 ?auto_156303 ) ) ( not ( = ?auto_156297 ?auto_156304 ) ) ( not ( = ?auto_156298 ?auto_156299 ) ) ( not ( = ?auto_156298 ?auto_156300 ) ) ( not ( = ?auto_156298 ?auto_156301 ) ) ( not ( = ?auto_156298 ?auto_156302 ) ) ( not ( = ?auto_156298 ?auto_156303 ) ) ( not ( = ?auto_156298 ?auto_156304 ) ) ( not ( = ?auto_156299 ?auto_156300 ) ) ( not ( = ?auto_156299 ?auto_156301 ) ) ( not ( = ?auto_156299 ?auto_156302 ) ) ( not ( = ?auto_156299 ?auto_156303 ) ) ( not ( = ?auto_156299 ?auto_156304 ) ) ( not ( = ?auto_156300 ?auto_156301 ) ) ( not ( = ?auto_156300 ?auto_156302 ) ) ( not ( = ?auto_156300 ?auto_156303 ) ) ( not ( = ?auto_156300 ?auto_156304 ) ) ( not ( = ?auto_156301 ?auto_156302 ) ) ( not ( = ?auto_156301 ?auto_156303 ) ) ( not ( = ?auto_156301 ?auto_156304 ) ) ( not ( = ?auto_156302 ?auto_156303 ) ) ( not ( = ?auto_156302 ?auto_156304 ) ) ( not ( = ?auto_156303 ?auto_156304 ) ) ( CLEAR ?auto_156301 ) ( ON ?auto_156302 ?auto_156303 ) ( CLEAR ?auto_156302 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_156296 ?auto_156297 ?auto_156298 ?auto_156299 ?auto_156300 ?auto_156301 ?auto_156302 )
      ( MAKE-8PILE ?auto_156296 ?auto_156297 ?auto_156298 ?auto_156299 ?auto_156300 ?auto_156301 ?auto_156302 ?auto_156303 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_156313 - BLOCK
      ?auto_156314 - BLOCK
      ?auto_156315 - BLOCK
      ?auto_156316 - BLOCK
      ?auto_156317 - BLOCK
      ?auto_156318 - BLOCK
      ?auto_156319 - BLOCK
      ?auto_156320 - BLOCK
    )
    :vars
    (
      ?auto_156321 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156320 ?auto_156321 ) ( ON-TABLE ?auto_156313 ) ( ON ?auto_156314 ?auto_156313 ) ( ON ?auto_156315 ?auto_156314 ) ( ON ?auto_156316 ?auto_156315 ) ( ON ?auto_156317 ?auto_156316 ) ( ON ?auto_156318 ?auto_156317 ) ( not ( = ?auto_156313 ?auto_156314 ) ) ( not ( = ?auto_156313 ?auto_156315 ) ) ( not ( = ?auto_156313 ?auto_156316 ) ) ( not ( = ?auto_156313 ?auto_156317 ) ) ( not ( = ?auto_156313 ?auto_156318 ) ) ( not ( = ?auto_156313 ?auto_156319 ) ) ( not ( = ?auto_156313 ?auto_156320 ) ) ( not ( = ?auto_156313 ?auto_156321 ) ) ( not ( = ?auto_156314 ?auto_156315 ) ) ( not ( = ?auto_156314 ?auto_156316 ) ) ( not ( = ?auto_156314 ?auto_156317 ) ) ( not ( = ?auto_156314 ?auto_156318 ) ) ( not ( = ?auto_156314 ?auto_156319 ) ) ( not ( = ?auto_156314 ?auto_156320 ) ) ( not ( = ?auto_156314 ?auto_156321 ) ) ( not ( = ?auto_156315 ?auto_156316 ) ) ( not ( = ?auto_156315 ?auto_156317 ) ) ( not ( = ?auto_156315 ?auto_156318 ) ) ( not ( = ?auto_156315 ?auto_156319 ) ) ( not ( = ?auto_156315 ?auto_156320 ) ) ( not ( = ?auto_156315 ?auto_156321 ) ) ( not ( = ?auto_156316 ?auto_156317 ) ) ( not ( = ?auto_156316 ?auto_156318 ) ) ( not ( = ?auto_156316 ?auto_156319 ) ) ( not ( = ?auto_156316 ?auto_156320 ) ) ( not ( = ?auto_156316 ?auto_156321 ) ) ( not ( = ?auto_156317 ?auto_156318 ) ) ( not ( = ?auto_156317 ?auto_156319 ) ) ( not ( = ?auto_156317 ?auto_156320 ) ) ( not ( = ?auto_156317 ?auto_156321 ) ) ( not ( = ?auto_156318 ?auto_156319 ) ) ( not ( = ?auto_156318 ?auto_156320 ) ) ( not ( = ?auto_156318 ?auto_156321 ) ) ( not ( = ?auto_156319 ?auto_156320 ) ) ( not ( = ?auto_156319 ?auto_156321 ) ) ( not ( = ?auto_156320 ?auto_156321 ) ) ( CLEAR ?auto_156318 ) ( ON ?auto_156319 ?auto_156320 ) ( CLEAR ?auto_156319 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_156313 ?auto_156314 ?auto_156315 ?auto_156316 ?auto_156317 ?auto_156318 ?auto_156319 )
      ( MAKE-8PILE ?auto_156313 ?auto_156314 ?auto_156315 ?auto_156316 ?auto_156317 ?auto_156318 ?auto_156319 ?auto_156320 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_156330 - BLOCK
      ?auto_156331 - BLOCK
      ?auto_156332 - BLOCK
      ?auto_156333 - BLOCK
      ?auto_156334 - BLOCK
      ?auto_156335 - BLOCK
      ?auto_156336 - BLOCK
      ?auto_156337 - BLOCK
    )
    :vars
    (
      ?auto_156338 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156337 ?auto_156338 ) ( ON-TABLE ?auto_156330 ) ( ON ?auto_156331 ?auto_156330 ) ( ON ?auto_156332 ?auto_156331 ) ( ON ?auto_156333 ?auto_156332 ) ( ON ?auto_156334 ?auto_156333 ) ( not ( = ?auto_156330 ?auto_156331 ) ) ( not ( = ?auto_156330 ?auto_156332 ) ) ( not ( = ?auto_156330 ?auto_156333 ) ) ( not ( = ?auto_156330 ?auto_156334 ) ) ( not ( = ?auto_156330 ?auto_156335 ) ) ( not ( = ?auto_156330 ?auto_156336 ) ) ( not ( = ?auto_156330 ?auto_156337 ) ) ( not ( = ?auto_156330 ?auto_156338 ) ) ( not ( = ?auto_156331 ?auto_156332 ) ) ( not ( = ?auto_156331 ?auto_156333 ) ) ( not ( = ?auto_156331 ?auto_156334 ) ) ( not ( = ?auto_156331 ?auto_156335 ) ) ( not ( = ?auto_156331 ?auto_156336 ) ) ( not ( = ?auto_156331 ?auto_156337 ) ) ( not ( = ?auto_156331 ?auto_156338 ) ) ( not ( = ?auto_156332 ?auto_156333 ) ) ( not ( = ?auto_156332 ?auto_156334 ) ) ( not ( = ?auto_156332 ?auto_156335 ) ) ( not ( = ?auto_156332 ?auto_156336 ) ) ( not ( = ?auto_156332 ?auto_156337 ) ) ( not ( = ?auto_156332 ?auto_156338 ) ) ( not ( = ?auto_156333 ?auto_156334 ) ) ( not ( = ?auto_156333 ?auto_156335 ) ) ( not ( = ?auto_156333 ?auto_156336 ) ) ( not ( = ?auto_156333 ?auto_156337 ) ) ( not ( = ?auto_156333 ?auto_156338 ) ) ( not ( = ?auto_156334 ?auto_156335 ) ) ( not ( = ?auto_156334 ?auto_156336 ) ) ( not ( = ?auto_156334 ?auto_156337 ) ) ( not ( = ?auto_156334 ?auto_156338 ) ) ( not ( = ?auto_156335 ?auto_156336 ) ) ( not ( = ?auto_156335 ?auto_156337 ) ) ( not ( = ?auto_156335 ?auto_156338 ) ) ( not ( = ?auto_156336 ?auto_156337 ) ) ( not ( = ?auto_156336 ?auto_156338 ) ) ( not ( = ?auto_156337 ?auto_156338 ) ) ( ON ?auto_156336 ?auto_156337 ) ( CLEAR ?auto_156334 ) ( ON ?auto_156335 ?auto_156336 ) ( CLEAR ?auto_156335 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_156330 ?auto_156331 ?auto_156332 ?auto_156333 ?auto_156334 ?auto_156335 )
      ( MAKE-8PILE ?auto_156330 ?auto_156331 ?auto_156332 ?auto_156333 ?auto_156334 ?auto_156335 ?auto_156336 ?auto_156337 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_156347 - BLOCK
      ?auto_156348 - BLOCK
      ?auto_156349 - BLOCK
      ?auto_156350 - BLOCK
      ?auto_156351 - BLOCK
      ?auto_156352 - BLOCK
      ?auto_156353 - BLOCK
      ?auto_156354 - BLOCK
    )
    :vars
    (
      ?auto_156355 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156354 ?auto_156355 ) ( ON-TABLE ?auto_156347 ) ( ON ?auto_156348 ?auto_156347 ) ( ON ?auto_156349 ?auto_156348 ) ( ON ?auto_156350 ?auto_156349 ) ( ON ?auto_156351 ?auto_156350 ) ( not ( = ?auto_156347 ?auto_156348 ) ) ( not ( = ?auto_156347 ?auto_156349 ) ) ( not ( = ?auto_156347 ?auto_156350 ) ) ( not ( = ?auto_156347 ?auto_156351 ) ) ( not ( = ?auto_156347 ?auto_156352 ) ) ( not ( = ?auto_156347 ?auto_156353 ) ) ( not ( = ?auto_156347 ?auto_156354 ) ) ( not ( = ?auto_156347 ?auto_156355 ) ) ( not ( = ?auto_156348 ?auto_156349 ) ) ( not ( = ?auto_156348 ?auto_156350 ) ) ( not ( = ?auto_156348 ?auto_156351 ) ) ( not ( = ?auto_156348 ?auto_156352 ) ) ( not ( = ?auto_156348 ?auto_156353 ) ) ( not ( = ?auto_156348 ?auto_156354 ) ) ( not ( = ?auto_156348 ?auto_156355 ) ) ( not ( = ?auto_156349 ?auto_156350 ) ) ( not ( = ?auto_156349 ?auto_156351 ) ) ( not ( = ?auto_156349 ?auto_156352 ) ) ( not ( = ?auto_156349 ?auto_156353 ) ) ( not ( = ?auto_156349 ?auto_156354 ) ) ( not ( = ?auto_156349 ?auto_156355 ) ) ( not ( = ?auto_156350 ?auto_156351 ) ) ( not ( = ?auto_156350 ?auto_156352 ) ) ( not ( = ?auto_156350 ?auto_156353 ) ) ( not ( = ?auto_156350 ?auto_156354 ) ) ( not ( = ?auto_156350 ?auto_156355 ) ) ( not ( = ?auto_156351 ?auto_156352 ) ) ( not ( = ?auto_156351 ?auto_156353 ) ) ( not ( = ?auto_156351 ?auto_156354 ) ) ( not ( = ?auto_156351 ?auto_156355 ) ) ( not ( = ?auto_156352 ?auto_156353 ) ) ( not ( = ?auto_156352 ?auto_156354 ) ) ( not ( = ?auto_156352 ?auto_156355 ) ) ( not ( = ?auto_156353 ?auto_156354 ) ) ( not ( = ?auto_156353 ?auto_156355 ) ) ( not ( = ?auto_156354 ?auto_156355 ) ) ( ON ?auto_156353 ?auto_156354 ) ( CLEAR ?auto_156351 ) ( ON ?auto_156352 ?auto_156353 ) ( CLEAR ?auto_156352 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_156347 ?auto_156348 ?auto_156349 ?auto_156350 ?auto_156351 ?auto_156352 )
      ( MAKE-8PILE ?auto_156347 ?auto_156348 ?auto_156349 ?auto_156350 ?auto_156351 ?auto_156352 ?auto_156353 ?auto_156354 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_156364 - BLOCK
      ?auto_156365 - BLOCK
      ?auto_156366 - BLOCK
      ?auto_156367 - BLOCK
      ?auto_156368 - BLOCK
      ?auto_156369 - BLOCK
      ?auto_156370 - BLOCK
      ?auto_156371 - BLOCK
    )
    :vars
    (
      ?auto_156372 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156371 ?auto_156372 ) ( ON-TABLE ?auto_156364 ) ( ON ?auto_156365 ?auto_156364 ) ( ON ?auto_156366 ?auto_156365 ) ( ON ?auto_156367 ?auto_156366 ) ( not ( = ?auto_156364 ?auto_156365 ) ) ( not ( = ?auto_156364 ?auto_156366 ) ) ( not ( = ?auto_156364 ?auto_156367 ) ) ( not ( = ?auto_156364 ?auto_156368 ) ) ( not ( = ?auto_156364 ?auto_156369 ) ) ( not ( = ?auto_156364 ?auto_156370 ) ) ( not ( = ?auto_156364 ?auto_156371 ) ) ( not ( = ?auto_156364 ?auto_156372 ) ) ( not ( = ?auto_156365 ?auto_156366 ) ) ( not ( = ?auto_156365 ?auto_156367 ) ) ( not ( = ?auto_156365 ?auto_156368 ) ) ( not ( = ?auto_156365 ?auto_156369 ) ) ( not ( = ?auto_156365 ?auto_156370 ) ) ( not ( = ?auto_156365 ?auto_156371 ) ) ( not ( = ?auto_156365 ?auto_156372 ) ) ( not ( = ?auto_156366 ?auto_156367 ) ) ( not ( = ?auto_156366 ?auto_156368 ) ) ( not ( = ?auto_156366 ?auto_156369 ) ) ( not ( = ?auto_156366 ?auto_156370 ) ) ( not ( = ?auto_156366 ?auto_156371 ) ) ( not ( = ?auto_156366 ?auto_156372 ) ) ( not ( = ?auto_156367 ?auto_156368 ) ) ( not ( = ?auto_156367 ?auto_156369 ) ) ( not ( = ?auto_156367 ?auto_156370 ) ) ( not ( = ?auto_156367 ?auto_156371 ) ) ( not ( = ?auto_156367 ?auto_156372 ) ) ( not ( = ?auto_156368 ?auto_156369 ) ) ( not ( = ?auto_156368 ?auto_156370 ) ) ( not ( = ?auto_156368 ?auto_156371 ) ) ( not ( = ?auto_156368 ?auto_156372 ) ) ( not ( = ?auto_156369 ?auto_156370 ) ) ( not ( = ?auto_156369 ?auto_156371 ) ) ( not ( = ?auto_156369 ?auto_156372 ) ) ( not ( = ?auto_156370 ?auto_156371 ) ) ( not ( = ?auto_156370 ?auto_156372 ) ) ( not ( = ?auto_156371 ?auto_156372 ) ) ( ON ?auto_156370 ?auto_156371 ) ( ON ?auto_156369 ?auto_156370 ) ( CLEAR ?auto_156367 ) ( ON ?auto_156368 ?auto_156369 ) ( CLEAR ?auto_156368 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_156364 ?auto_156365 ?auto_156366 ?auto_156367 ?auto_156368 )
      ( MAKE-8PILE ?auto_156364 ?auto_156365 ?auto_156366 ?auto_156367 ?auto_156368 ?auto_156369 ?auto_156370 ?auto_156371 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_156381 - BLOCK
      ?auto_156382 - BLOCK
      ?auto_156383 - BLOCK
      ?auto_156384 - BLOCK
      ?auto_156385 - BLOCK
      ?auto_156386 - BLOCK
      ?auto_156387 - BLOCK
      ?auto_156388 - BLOCK
    )
    :vars
    (
      ?auto_156389 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156388 ?auto_156389 ) ( ON-TABLE ?auto_156381 ) ( ON ?auto_156382 ?auto_156381 ) ( ON ?auto_156383 ?auto_156382 ) ( ON ?auto_156384 ?auto_156383 ) ( not ( = ?auto_156381 ?auto_156382 ) ) ( not ( = ?auto_156381 ?auto_156383 ) ) ( not ( = ?auto_156381 ?auto_156384 ) ) ( not ( = ?auto_156381 ?auto_156385 ) ) ( not ( = ?auto_156381 ?auto_156386 ) ) ( not ( = ?auto_156381 ?auto_156387 ) ) ( not ( = ?auto_156381 ?auto_156388 ) ) ( not ( = ?auto_156381 ?auto_156389 ) ) ( not ( = ?auto_156382 ?auto_156383 ) ) ( not ( = ?auto_156382 ?auto_156384 ) ) ( not ( = ?auto_156382 ?auto_156385 ) ) ( not ( = ?auto_156382 ?auto_156386 ) ) ( not ( = ?auto_156382 ?auto_156387 ) ) ( not ( = ?auto_156382 ?auto_156388 ) ) ( not ( = ?auto_156382 ?auto_156389 ) ) ( not ( = ?auto_156383 ?auto_156384 ) ) ( not ( = ?auto_156383 ?auto_156385 ) ) ( not ( = ?auto_156383 ?auto_156386 ) ) ( not ( = ?auto_156383 ?auto_156387 ) ) ( not ( = ?auto_156383 ?auto_156388 ) ) ( not ( = ?auto_156383 ?auto_156389 ) ) ( not ( = ?auto_156384 ?auto_156385 ) ) ( not ( = ?auto_156384 ?auto_156386 ) ) ( not ( = ?auto_156384 ?auto_156387 ) ) ( not ( = ?auto_156384 ?auto_156388 ) ) ( not ( = ?auto_156384 ?auto_156389 ) ) ( not ( = ?auto_156385 ?auto_156386 ) ) ( not ( = ?auto_156385 ?auto_156387 ) ) ( not ( = ?auto_156385 ?auto_156388 ) ) ( not ( = ?auto_156385 ?auto_156389 ) ) ( not ( = ?auto_156386 ?auto_156387 ) ) ( not ( = ?auto_156386 ?auto_156388 ) ) ( not ( = ?auto_156386 ?auto_156389 ) ) ( not ( = ?auto_156387 ?auto_156388 ) ) ( not ( = ?auto_156387 ?auto_156389 ) ) ( not ( = ?auto_156388 ?auto_156389 ) ) ( ON ?auto_156387 ?auto_156388 ) ( ON ?auto_156386 ?auto_156387 ) ( CLEAR ?auto_156384 ) ( ON ?auto_156385 ?auto_156386 ) ( CLEAR ?auto_156385 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_156381 ?auto_156382 ?auto_156383 ?auto_156384 ?auto_156385 )
      ( MAKE-8PILE ?auto_156381 ?auto_156382 ?auto_156383 ?auto_156384 ?auto_156385 ?auto_156386 ?auto_156387 ?auto_156388 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_156398 - BLOCK
      ?auto_156399 - BLOCK
      ?auto_156400 - BLOCK
      ?auto_156401 - BLOCK
      ?auto_156402 - BLOCK
      ?auto_156403 - BLOCK
      ?auto_156404 - BLOCK
      ?auto_156405 - BLOCK
    )
    :vars
    (
      ?auto_156406 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156405 ?auto_156406 ) ( ON-TABLE ?auto_156398 ) ( ON ?auto_156399 ?auto_156398 ) ( ON ?auto_156400 ?auto_156399 ) ( not ( = ?auto_156398 ?auto_156399 ) ) ( not ( = ?auto_156398 ?auto_156400 ) ) ( not ( = ?auto_156398 ?auto_156401 ) ) ( not ( = ?auto_156398 ?auto_156402 ) ) ( not ( = ?auto_156398 ?auto_156403 ) ) ( not ( = ?auto_156398 ?auto_156404 ) ) ( not ( = ?auto_156398 ?auto_156405 ) ) ( not ( = ?auto_156398 ?auto_156406 ) ) ( not ( = ?auto_156399 ?auto_156400 ) ) ( not ( = ?auto_156399 ?auto_156401 ) ) ( not ( = ?auto_156399 ?auto_156402 ) ) ( not ( = ?auto_156399 ?auto_156403 ) ) ( not ( = ?auto_156399 ?auto_156404 ) ) ( not ( = ?auto_156399 ?auto_156405 ) ) ( not ( = ?auto_156399 ?auto_156406 ) ) ( not ( = ?auto_156400 ?auto_156401 ) ) ( not ( = ?auto_156400 ?auto_156402 ) ) ( not ( = ?auto_156400 ?auto_156403 ) ) ( not ( = ?auto_156400 ?auto_156404 ) ) ( not ( = ?auto_156400 ?auto_156405 ) ) ( not ( = ?auto_156400 ?auto_156406 ) ) ( not ( = ?auto_156401 ?auto_156402 ) ) ( not ( = ?auto_156401 ?auto_156403 ) ) ( not ( = ?auto_156401 ?auto_156404 ) ) ( not ( = ?auto_156401 ?auto_156405 ) ) ( not ( = ?auto_156401 ?auto_156406 ) ) ( not ( = ?auto_156402 ?auto_156403 ) ) ( not ( = ?auto_156402 ?auto_156404 ) ) ( not ( = ?auto_156402 ?auto_156405 ) ) ( not ( = ?auto_156402 ?auto_156406 ) ) ( not ( = ?auto_156403 ?auto_156404 ) ) ( not ( = ?auto_156403 ?auto_156405 ) ) ( not ( = ?auto_156403 ?auto_156406 ) ) ( not ( = ?auto_156404 ?auto_156405 ) ) ( not ( = ?auto_156404 ?auto_156406 ) ) ( not ( = ?auto_156405 ?auto_156406 ) ) ( ON ?auto_156404 ?auto_156405 ) ( ON ?auto_156403 ?auto_156404 ) ( ON ?auto_156402 ?auto_156403 ) ( CLEAR ?auto_156400 ) ( ON ?auto_156401 ?auto_156402 ) ( CLEAR ?auto_156401 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_156398 ?auto_156399 ?auto_156400 ?auto_156401 )
      ( MAKE-8PILE ?auto_156398 ?auto_156399 ?auto_156400 ?auto_156401 ?auto_156402 ?auto_156403 ?auto_156404 ?auto_156405 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_156415 - BLOCK
      ?auto_156416 - BLOCK
      ?auto_156417 - BLOCK
      ?auto_156418 - BLOCK
      ?auto_156419 - BLOCK
      ?auto_156420 - BLOCK
      ?auto_156421 - BLOCK
      ?auto_156422 - BLOCK
    )
    :vars
    (
      ?auto_156423 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156422 ?auto_156423 ) ( ON-TABLE ?auto_156415 ) ( ON ?auto_156416 ?auto_156415 ) ( ON ?auto_156417 ?auto_156416 ) ( not ( = ?auto_156415 ?auto_156416 ) ) ( not ( = ?auto_156415 ?auto_156417 ) ) ( not ( = ?auto_156415 ?auto_156418 ) ) ( not ( = ?auto_156415 ?auto_156419 ) ) ( not ( = ?auto_156415 ?auto_156420 ) ) ( not ( = ?auto_156415 ?auto_156421 ) ) ( not ( = ?auto_156415 ?auto_156422 ) ) ( not ( = ?auto_156415 ?auto_156423 ) ) ( not ( = ?auto_156416 ?auto_156417 ) ) ( not ( = ?auto_156416 ?auto_156418 ) ) ( not ( = ?auto_156416 ?auto_156419 ) ) ( not ( = ?auto_156416 ?auto_156420 ) ) ( not ( = ?auto_156416 ?auto_156421 ) ) ( not ( = ?auto_156416 ?auto_156422 ) ) ( not ( = ?auto_156416 ?auto_156423 ) ) ( not ( = ?auto_156417 ?auto_156418 ) ) ( not ( = ?auto_156417 ?auto_156419 ) ) ( not ( = ?auto_156417 ?auto_156420 ) ) ( not ( = ?auto_156417 ?auto_156421 ) ) ( not ( = ?auto_156417 ?auto_156422 ) ) ( not ( = ?auto_156417 ?auto_156423 ) ) ( not ( = ?auto_156418 ?auto_156419 ) ) ( not ( = ?auto_156418 ?auto_156420 ) ) ( not ( = ?auto_156418 ?auto_156421 ) ) ( not ( = ?auto_156418 ?auto_156422 ) ) ( not ( = ?auto_156418 ?auto_156423 ) ) ( not ( = ?auto_156419 ?auto_156420 ) ) ( not ( = ?auto_156419 ?auto_156421 ) ) ( not ( = ?auto_156419 ?auto_156422 ) ) ( not ( = ?auto_156419 ?auto_156423 ) ) ( not ( = ?auto_156420 ?auto_156421 ) ) ( not ( = ?auto_156420 ?auto_156422 ) ) ( not ( = ?auto_156420 ?auto_156423 ) ) ( not ( = ?auto_156421 ?auto_156422 ) ) ( not ( = ?auto_156421 ?auto_156423 ) ) ( not ( = ?auto_156422 ?auto_156423 ) ) ( ON ?auto_156421 ?auto_156422 ) ( ON ?auto_156420 ?auto_156421 ) ( ON ?auto_156419 ?auto_156420 ) ( CLEAR ?auto_156417 ) ( ON ?auto_156418 ?auto_156419 ) ( CLEAR ?auto_156418 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_156415 ?auto_156416 ?auto_156417 ?auto_156418 )
      ( MAKE-8PILE ?auto_156415 ?auto_156416 ?auto_156417 ?auto_156418 ?auto_156419 ?auto_156420 ?auto_156421 ?auto_156422 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_156432 - BLOCK
      ?auto_156433 - BLOCK
      ?auto_156434 - BLOCK
      ?auto_156435 - BLOCK
      ?auto_156436 - BLOCK
      ?auto_156437 - BLOCK
      ?auto_156438 - BLOCK
      ?auto_156439 - BLOCK
    )
    :vars
    (
      ?auto_156440 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156439 ?auto_156440 ) ( ON-TABLE ?auto_156432 ) ( ON ?auto_156433 ?auto_156432 ) ( not ( = ?auto_156432 ?auto_156433 ) ) ( not ( = ?auto_156432 ?auto_156434 ) ) ( not ( = ?auto_156432 ?auto_156435 ) ) ( not ( = ?auto_156432 ?auto_156436 ) ) ( not ( = ?auto_156432 ?auto_156437 ) ) ( not ( = ?auto_156432 ?auto_156438 ) ) ( not ( = ?auto_156432 ?auto_156439 ) ) ( not ( = ?auto_156432 ?auto_156440 ) ) ( not ( = ?auto_156433 ?auto_156434 ) ) ( not ( = ?auto_156433 ?auto_156435 ) ) ( not ( = ?auto_156433 ?auto_156436 ) ) ( not ( = ?auto_156433 ?auto_156437 ) ) ( not ( = ?auto_156433 ?auto_156438 ) ) ( not ( = ?auto_156433 ?auto_156439 ) ) ( not ( = ?auto_156433 ?auto_156440 ) ) ( not ( = ?auto_156434 ?auto_156435 ) ) ( not ( = ?auto_156434 ?auto_156436 ) ) ( not ( = ?auto_156434 ?auto_156437 ) ) ( not ( = ?auto_156434 ?auto_156438 ) ) ( not ( = ?auto_156434 ?auto_156439 ) ) ( not ( = ?auto_156434 ?auto_156440 ) ) ( not ( = ?auto_156435 ?auto_156436 ) ) ( not ( = ?auto_156435 ?auto_156437 ) ) ( not ( = ?auto_156435 ?auto_156438 ) ) ( not ( = ?auto_156435 ?auto_156439 ) ) ( not ( = ?auto_156435 ?auto_156440 ) ) ( not ( = ?auto_156436 ?auto_156437 ) ) ( not ( = ?auto_156436 ?auto_156438 ) ) ( not ( = ?auto_156436 ?auto_156439 ) ) ( not ( = ?auto_156436 ?auto_156440 ) ) ( not ( = ?auto_156437 ?auto_156438 ) ) ( not ( = ?auto_156437 ?auto_156439 ) ) ( not ( = ?auto_156437 ?auto_156440 ) ) ( not ( = ?auto_156438 ?auto_156439 ) ) ( not ( = ?auto_156438 ?auto_156440 ) ) ( not ( = ?auto_156439 ?auto_156440 ) ) ( ON ?auto_156438 ?auto_156439 ) ( ON ?auto_156437 ?auto_156438 ) ( ON ?auto_156436 ?auto_156437 ) ( ON ?auto_156435 ?auto_156436 ) ( CLEAR ?auto_156433 ) ( ON ?auto_156434 ?auto_156435 ) ( CLEAR ?auto_156434 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_156432 ?auto_156433 ?auto_156434 )
      ( MAKE-8PILE ?auto_156432 ?auto_156433 ?auto_156434 ?auto_156435 ?auto_156436 ?auto_156437 ?auto_156438 ?auto_156439 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_156449 - BLOCK
      ?auto_156450 - BLOCK
      ?auto_156451 - BLOCK
      ?auto_156452 - BLOCK
      ?auto_156453 - BLOCK
      ?auto_156454 - BLOCK
      ?auto_156455 - BLOCK
      ?auto_156456 - BLOCK
    )
    :vars
    (
      ?auto_156457 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156456 ?auto_156457 ) ( ON-TABLE ?auto_156449 ) ( ON ?auto_156450 ?auto_156449 ) ( not ( = ?auto_156449 ?auto_156450 ) ) ( not ( = ?auto_156449 ?auto_156451 ) ) ( not ( = ?auto_156449 ?auto_156452 ) ) ( not ( = ?auto_156449 ?auto_156453 ) ) ( not ( = ?auto_156449 ?auto_156454 ) ) ( not ( = ?auto_156449 ?auto_156455 ) ) ( not ( = ?auto_156449 ?auto_156456 ) ) ( not ( = ?auto_156449 ?auto_156457 ) ) ( not ( = ?auto_156450 ?auto_156451 ) ) ( not ( = ?auto_156450 ?auto_156452 ) ) ( not ( = ?auto_156450 ?auto_156453 ) ) ( not ( = ?auto_156450 ?auto_156454 ) ) ( not ( = ?auto_156450 ?auto_156455 ) ) ( not ( = ?auto_156450 ?auto_156456 ) ) ( not ( = ?auto_156450 ?auto_156457 ) ) ( not ( = ?auto_156451 ?auto_156452 ) ) ( not ( = ?auto_156451 ?auto_156453 ) ) ( not ( = ?auto_156451 ?auto_156454 ) ) ( not ( = ?auto_156451 ?auto_156455 ) ) ( not ( = ?auto_156451 ?auto_156456 ) ) ( not ( = ?auto_156451 ?auto_156457 ) ) ( not ( = ?auto_156452 ?auto_156453 ) ) ( not ( = ?auto_156452 ?auto_156454 ) ) ( not ( = ?auto_156452 ?auto_156455 ) ) ( not ( = ?auto_156452 ?auto_156456 ) ) ( not ( = ?auto_156452 ?auto_156457 ) ) ( not ( = ?auto_156453 ?auto_156454 ) ) ( not ( = ?auto_156453 ?auto_156455 ) ) ( not ( = ?auto_156453 ?auto_156456 ) ) ( not ( = ?auto_156453 ?auto_156457 ) ) ( not ( = ?auto_156454 ?auto_156455 ) ) ( not ( = ?auto_156454 ?auto_156456 ) ) ( not ( = ?auto_156454 ?auto_156457 ) ) ( not ( = ?auto_156455 ?auto_156456 ) ) ( not ( = ?auto_156455 ?auto_156457 ) ) ( not ( = ?auto_156456 ?auto_156457 ) ) ( ON ?auto_156455 ?auto_156456 ) ( ON ?auto_156454 ?auto_156455 ) ( ON ?auto_156453 ?auto_156454 ) ( ON ?auto_156452 ?auto_156453 ) ( CLEAR ?auto_156450 ) ( ON ?auto_156451 ?auto_156452 ) ( CLEAR ?auto_156451 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_156449 ?auto_156450 ?auto_156451 )
      ( MAKE-8PILE ?auto_156449 ?auto_156450 ?auto_156451 ?auto_156452 ?auto_156453 ?auto_156454 ?auto_156455 ?auto_156456 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_156466 - BLOCK
      ?auto_156467 - BLOCK
      ?auto_156468 - BLOCK
      ?auto_156469 - BLOCK
      ?auto_156470 - BLOCK
      ?auto_156471 - BLOCK
      ?auto_156472 - BLOCK
      ?auto_156473 - BLOCK
    )
    :vars
    (
      ?auto_156474 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156473 ?auto_156474 ) ( ON-TABLE ?auto_156466 ) ( not ( = ?auto_156466 ?auto_156467 ) ) ( not ( = ?auto_156466 ?auto_156468 ) ) ( not ( = ?auto_156466 ?auto_156469 ) ) ( not ( = ?auto_156466 ?auto_156470 ) ) ( not ( = ?auto_156466 ?auto_156471 ) ) ( not ( = ?auto_156466 ?auto_156472 ) ) ( not ( = ?auto_156466 ?auto_156473 ) ) ( not ( = ?auto_156466 ?auto_156474 ) ) ( not ( = ?auto_156467 ?auto_156468 ) ) ( not ( = ?auto_156467 ?auto_156469 ) ) ( not ( = ?auto_156467 ?auto_156470 ) ) ( not ( = ?auto_156467 ?auto_156471 ) ) ( not ( = ?auto_156467 ?auto_156472 ) ) ( not ( = ?auto_156467 ?auto_156473 ) ) ( not ( = ?auto_156467 ?auto_156474 ) ) ( not ( = ?auto_156468 ?auto_156469 ) ) ( not ( = ?auto_156468 ?auto_156470 ) ) ( not ( = ?auto_156468 ?auto_156471 ) ) ( not ( = ?auto_156468 ?auto_156472 ) ) ( not ( = ?auto_156468 ?auto_156473 ) ) ( not ( = ?auto_156468 ?auto_156474 ) ) ( not ( = ?auto_156469 ?auto_156470 ) ) ( not ( = ?auto_156469 ?auto_156471 ) ) ( not ( = ?auto_156469 ?auto_156472 ) ) ( not ( = ?auto_156469 ?auto_156473 ) ) ( not ( = ?auto_156469 ?auto_156474 ) ) ( not ( = ?auto_156470 ?auto_156471 ) ) ( not ( = ?auto_156470 ?auto_156472 ) ) ( not ( = ?auto_156470 ?auto_156473 ) ) ( not ( = ?auto_156470 ?auto_156474 ) ) ( not ( = ?auto_156471 ?auto_156472 ) ) ( not ( = ?auto_156471 ?auto_156473 ) ) ( not ( = ?auto_156471 ?auto_156474 ) ) ( not ( = ?auto_156472 ?auto_156473 ) ) ( not ( = ?auto_156472 ?auto_156474 ) ) ( not ( = ?auto_156473 ?auto_156474 ) ) ( ON ?auto_156472 ?auto_156473 ) ( ON ?auto_156471 ?auto_156472 ) ( ON ?auto_156470 ?auto_156471 ) ( ON ?auto_156469 ?auto_156470 ) ( ON ?auto_156468 ?auto_156469 ) ( CLEAR ?auto_156466 ) ( ON ?auto_156467 ?auto_156468 ) ( CLEAR ?auto_156467 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_156466 ?auto_156467 )
      ( MAKE-8PILE ?auto_156466 ?auto_156467 ?auto_156468 ?auto_156469 ?auto_156470 ?auto_156471 ?auto_156472 ?auto_156473 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_156483 - BLOCK
      ?auto_156484 - BLOCK
      ?auto_156485 - BLOCK
      ?auto_156486 - BLOCK
      ?auto_156487 - BLOCK
      ?auto_156488 - BLOCK
      ?auto_156489 - BLOCK
      ?auto_156490 - BLOCK
    )
    :vars
    (
      ?auto_156491 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156490 ?auto_156491 ) ( ON-TABLE ?auto_156483 ) ( not ( = ?auto_156483 ?auto_156484 ) ) ( not ( = ?auto_156483 ?auto_156485 ) ) ( not ( = ?auto_156483 ?auto_156486 ) ) ( not ( = ?auto_156483 ?auto_156487 ) ) ( not ( = ?auto_156483 ?auto_156488 ) ) ( not ( = ?auto_156483 ?auto_156489 ) ) ( not ( = ?auto_156483 ?auto_156490 ) ) ( not ( = ?auto_156483 ?auto_156491 ) ) ( not ( = ?auto_156484 ?auto_156485 ) ) ( not ( = ?auto_156484 ?auto_156486 ) ) ( not ( = ?auto_156484 ?auto_156487 ) ) ( not ( = ?auto_156484 ?auto_156488 ) ) ( not ( = ?auto_156484 ?auto_156489 ) ) ( not ( = ?auto_156484 ?auto_156490 ) ) ( not ( = ?auto_156484 ?auto_156491 ) ) ( not ( = ?auto_156485 ?auto_156486 ) ) ( not ( = ?auto_156485 ?auto_156487 ) ) ( not ( = ?auto_156485 ?auto_156488 ) ) ( not ( = ?auto_156485 ?auto_156489 ) ) ( not ( = ?auto_156485 ?auto_156490 ) ) ( not ( = ?auto_156485 ?auto_156491 ) ) ( not ( = ?auto_156486 ?auto_156487 ) ) ( not ( = ?auto_156486 ?auto_156488 ) ) ( not ( = ?auto_156486 ?auto_156489 ) ) ( not ( = ?auto_156486 ?auto_156490 ) ) ( not ( = ?auto_156486 ?auto_156491 ) ) ( not ( = ?auto_156487 ?auto_156488 ) ) ( not ( = ?auto_156487 ?auto_156489 ) ) ( not ( = ?auto_156487 ?auto_156490 ) ) ( not ( = ?auto_156487 ?auto_156491 ) ) ( not ( = ?auto_156488 ?auto_156489 ) ) ( not ( = ?auto_156488 ?auto_156490 ) ) ( not ( = ?auto_156488 ?auto_156491 ) ) ( not ( = ?auto_156489 ?auto_156490 ) ) ( not ( = ?auto_156489 ?auto_156491 ) ) ( not ( = ?auto_156490 ?auto_156491 ) ) ( ON ?auto_156489 ?auto_156490 ) ( ON ?auto_156488 ?auto_156489 ) ( ON ?auto_156487 ?auto_156488 ) ( ON ?auto_156486 ?auto_156487 ) ( ON ?auto_156485 ?auto_156486 ) ( CLEAR ?auto_156483 ) ( ON ?auto_156484 ?auto_156485 ) ( CLEAR ?auto_156484 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_156483 ?auto_156484 )
      ( MAKE-8PILE ?auto_156483 ?auto_156484 ?auto_156485 ?auto_156486 ?auto_156487 ?auto_156488 ?auto_156489 ?auto_156490 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_156500 - BLOCK
      ?auto_156501 - BLOCK
      ?auto_156502 - BLOCK
      ?auto_156503 - BLOCK
      ?auto_156504 - BLOCK
      ?auto_156505 - BLOCK
      ?auto_156506 - BLOCK
      ?auto_156507 - BLOCK
    )
    :vars
    (
      ?auto_156508 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156507 ?auto_156508 ) ( not ( = ?auto_156500 ?auto_156501 ) ) ( not ( = ?auto_156500 ?auto_156502 ) ) ( not ( = ?auto_156500 ?auto_156503 ) ) ( not ( = ?auto_156500 ?auto_156504 ) ) ( not ( = ?auto_156500 ?auto_156505 ) ) ( not ( = ?auto_156500 ?auto_156506 ) ) ( not ( = ?auto_156500 ?auto_156507 ) ) ( not ( = ?auto_156500 ?auto_156508 ) ) ( not ( = ?auto_156501 ?auto_156502 ) ) ( not ( = ?auto_156501 ?auto_156503 ) ) ( not ( = ?auto_156501 ?auto_156504 ) ) ( not ( = ?auto_156501 ?auto_156505 ) ) ( not ( = ?auto_156501 ?auto_156506 ) ) ( not ( = ?auto_156501 ?auto_156507 ) ) ( not ( = ?auto_156501 ?auto_156508 ) ) ( not ( = ?auto_156502 ?auto_156503 ) ) ( not ( = ?auto_156502 ?auto_156504 ) ) ( not ( = ?auto_156502 ?auto_156505 ) ) ( not ( = ?auto_156502 ?auto_156506 ) ) ( not ( = ?auto_156502 ?auto_156507 ) ) ( not ( = ?auto_156502 ?auto_156508 ) ) ( not ( = ?auto_156503 ?auto_156504 ) ) ( not ( = ?auto_156503 ?auto_156505 ) ) ( not ( = ?auto_156503 ?auto_156506 ) ) ( not ( = ?auto_156503 ?auto_156507 ) ) ( not ( = ?auto_156503 ?auto_156508 ) ) ( not ( = ?auto_156504 ?auto_156505 ) ) ( not ( = ?auto_156504 ?auto_156506 ) ) ( not ( = ?auto_156504 ?auto_156507 ) ) ( not ( = ?auto_156504 ?auto_156508 ) ) ( not ( = ?auto_156505 ?auto_156506 ) ) ( not ( = ?auto_156505 ?auto_156507 ) ) ( not ( = ?auto_156505 ?auto_156508 ) ) ( not ( = ?auto_156506 ?auto_156507 ) ) ( not ( = ?auto_156506 ?auto_156508 ) ) ( not ( = ?auto_156507 ?auto_156508 ) ) ( ON ?auto_156506 ?auto_156507 ) ( ON ?auto_156505 ?auto_156506 ) ( ON ?auto_156504 ?auto_156505 ) ( ON ?auto_156503 ?auto_156504 ) ( ON ?auto_156502 ?auto_156503 ) ( ON ?auto_156501 ?auto_156502 ) ( ON ?auto_156500 ?auto_156501 ) ( CLEAR ?auto_156500 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_156500 )
      ( MAKE-8PILE ?auto_156500 ?auto_156501 ?auto_156502 ?auto_156503 ?auto_156504 ?auto_156505 ?auto_156506 ?auto_156507 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_156517 - BLOCK
      ?auto_156518 - BLOCK
      ?auto_156519 - BLOCK
      ?auto_156520 - BLOCK
      ?auto_156521 - BLOCK
      ?auto_156522 - BLOCK
      ?auto_156523 - BLOCK
      ?auto_156524 - BLOCK
    )
    :vars
    (
      ?auto_156525 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156524 ?auto_156525 ) ( not ( = ?auto_156517 ?auto_156518 ) ) ( not ( = ?auto_156517 ?auto_156519 ) ) ( not ( = ?auto_156517 ?auto_156520 ) ) ( not ( = ?auto_156517 ?auto_156521 ) ) ( not ( = ?auto_156517 ?auto_156522 ) ) ( not ( = ?auto_156517 ?auto_156523 ) ) ( not ( = ?auto_156517 ?auto_156524 ) ) ( not ( = ?auto_156517 ?auto_156525 ) ) ( not ( = ?auto_156518 ?auto_156519 ) ) ( not ( = ?auto_156518 ?auto_156520 ) ) ( not ( = ?auto_156518 ?auto_156521 ) ) ( not ( = ?auto_156518 ?auto_156522 ) ) ( not ( = ?auto_156518 ?auto_156523 ) ) ( not ( = ?auto_156518 ?auto_156524 ) ) ( not ( = ?auto_156518 ?auto_156525 ) ) ( not ( = ?auto_156519 ?auto_156520 ) ) ( not ( = ?auto_156519 ?auto_156521 ) ) ( not ( = ?auto_156519 ?auto_156522 ) ) ( not ( = ?auto_156519 ?auto_156523 ) ) ( not ( = ?auto_156519 ?auto_156524 ) ) ( not ( = ?auto_156519 ?auto_156525 ) ) ( not ( = ?auto_156520 ?auto_156521 ) ) ( not ( = ?auto_156520 ?auto_156522 ) ) ( not ( = ?auto_156520 ?auto_156523 ) ) ( not ( = ?auto_156520 ?auto_156524 ) ) ( not ( = ?auto_156520 ?auto_156525 ) ) ( not ( = ?auto_156521 ?auto_156522 ) ) ( not ( = ?auto_156521 ?auto_156523 ) ) ( not ( = ?auto_156521 ?auto_156524 ) ) ( not ( = ?auto_156521 ?auto_156525 ) ) ( not ( = ?auto_156522 ?auto_156523 ) ) ( not ( = ?auto_156522 ?auto_156524 ) ) ( not ( = ?auto_156522 ?auto_156525 ) ) ( not ( = ?auto_156523 ?auto_156524 ) ) ( not ( = ?auto_156523 ?auto_156525 ) ) ( not ( = ?auto_156524 ?auto_156525 ) ) ( ON ?auto_156523 ?auto_156524 ) ( ON ?auto_156522 ?auto_156523 ) ( ON ?auto_156521 ?auto_156522 ) ( ON ?auto_156520 ?auto_156521 ) ( ON ?auto_156519 ?auto_156520 ) ( ON ?auto_156518 ?auto_156519 ) ( ON ?auto_156517 ?auto_156518 ) ( CLEAR ?auto_156517 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_156517 )
      ( MAKE-8PILE ?auto_156517 ?auto_156518 ?auto_156519 ?auto_156520 ?auto_156521 ?auto_156522 ?auto_156523 ?auto_156524 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_156535 - BLOCK
      ?auto_156536 - BLOCK
      ?auto_156537 - BLOCK
      ?auto_156538 - BLOCK
      ?auto_156539 - BLOCK
      ?auto_156540 - BLOCK
      ?auto_156541 - BLOCK
      ?auto_156542 - BLOCK
      ?auto_156543 - BLOCK
    )
    :vars
    (
      ?auto_156544 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_156542 ) ( ON ?auto_156543 ?auto_156544 ) ( CLEAR ?auto_156543 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_156535 ) ( ON ?auto_156536 ?auto_156535 ) ( ON ?auto_156537 ?auto_156536 ) ( ON ?auto_156538 ?auto_156537 ) ( ON ?auto_156539 ?auto_156538 ) ( ON ?auto_156540 ?auto_156539 ) ( ON ?auto_156541 ?auto_156540 ) ( ON ?auto_156542 ?auto_156541 ) ( not ( = ?auto_156535 ?auto_156536 ) ) ( not ( = ?auto_156535 ?auto_156537 ) ) ( not ( = ?auto_156535 ?auto_156538 ) ) ( not ( = ?auto_156535 ?auto_156539 ) ) ( not ( = ?auto_156535 ?auto_156540 ) ) ( not ( = ?auto_156535 ?auto_156541 ) ) ( not ( = ?auto_156535 ?auto_156542 ) ) ( not ( = ?auto_156535 ?auto_156543 ) ) ( not ( = ?auto_156535 ?auto_156544 ) ) ( not ( = ?auto_156536 ?auto_156537 ) ) ( not ( = ?auto_156536 ?auto_156538 ) ) ( not ( = ?auto_156536 ?auto_156539 ) ) ( not ( = ?auto_156536 ?auto_156540 ) ) ( not ( = ?auto_156536 ?auto_156541 ) ) ( not ( = ?auto_156536 ?auto_156542 ) ) ( not ( = ?auto_156536 ?auto_156543 ) ) ( not ( = ?auto_156536 ?auto_156544 ) ) ( not ( = ?auto_156537 ?auto_156538 ) ) ( not ( = ?auto_156537 ?auto_156539 ) ) ( not ( = ?auto_156537 ?auto_156540 ) ) ( not ( = ?auto_156537 ?auto_156541 ) ) ( not ( = ?auto_156537 ?auto_156542 ) ) ( not ( = ?auto_156537 ?auto_156543 ) ) ( not ( = ?auto_156537 ?auto_156544 ) ) ( not ( = ?auto_156538 ?auto_156539 ) ) ( not ( = ?auto_156538 ?auto_156540 ) ) ( not ( = ?auto_156538 ?auto_156541 ) ) ( not ( = ?auto_156538 ?auto_156542 ) ) ( not ( = ?auto_156538 ?auto_156543 ) ) ( not ( = ?auto_156538 ?auto_156544 ) ) ( not ( = ?auto_156539 ?auto_156540 ) ) ( not ( = ?auto_156539 ?auto_156541 ) ) ( not ( = ?auto_156539 ?auto_156542 ) ) ( not ( = ?auto_156539 ?auto_156543 ) ) ( not ( = ?auto_156539 ?auto_156544 ) ) ( not ( = ?auto_156540 ?auto_156541 ) ) ( not ( = ?auto_156540 ?auto_156542 ) ) ( not ( = ?auto_156540 ?auto_156543 ) ) ( not ( = ?auto_156540 ?auto_156544 ) ) ( not ( = ?auto_156541 ?auto_156542 ) ) ( not ( = ?auto_156541 ?auto_156543 ) ) ( not ( = ?auto_156541 ?auto_156544 ) ) ( not ( = ?auto_156542 ?auto_156543 ) ) ( not ( = ?auto_156542 ?auto_156544 ) ) ( not ( = ?auto_156543 ?auto_156544 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_156543 ?auto_156544 )
      ( !STACK ?auto_156543 ?auto_156542 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_156554 - BLOCK
      ?auto_156555 - BLOCK
      ?auto_156556 - BLOCK
      ?auto_156557 - BLOCK
      ?auto_156558 - BLOCK
      ?auto_156559 - BLOCK
      ?auto_156560 - BLOCK
      ?auto_156561 - BLOCK
      ?auto_156562 - BLOCK
    )
    :vars
    (
      ?auto_156563 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_156561 ) ( ON ?auto_156562 ?auto_156563 ) ( CLEAR ?auto_156562 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_156554 ) ( ON ?auto_156555 ?auto_156554 ) ( ON ?auto_156556 ?auto_156555 ) ( ON ?auto_156557 ?auto_156556 ) ( ON ?auto_156558 ?auto_156557 ) ( ON ?auto_156559 ?auto_156558 ) ( ON ?auto_156560 ?auto_156559 ) ( ON ?auto_156561 ?auto_156560 ) ( not ( = ?auto_156554 ?auto_156555 ) ) ( not ( = ?auto_156554 ?auto_156556 ) ) ( not ( = ?auto_156554 ?auto_156557 ) ) ( not ( = ?auto_156554 ?auto_156558 ) ) ( not ( = ?auto_156554 ?auto_156559 ) ) ( not ( = ?auto_156554 ?auto_156560 ) ) ( not ( = ?auto_156554 ?auto_156561 ) ) ( not ( = ?auto_156554 ?auto_156562 ) ) ( not ( = ?auto_156554 ?auto_156563 ) ) ( not ( = ?auto_156555 ?auto_156556 ) ) ( not ( = ?auto_156555 ?auto_156557 ) ) ( not ( = ?auto_156555 ?auto_156558 ) ) ( not ( = ?auto_156555 ?auto_156559 ) ) ( not ( = ?auto_156555 ?auto_156560 ) ) ( not ( = ?auto_156555 ?auto_156561 ) ) ( not ( = ?auto_156555 ?auto_156562 ) ) ( not ( = ?auto_156555 ?auto_156563 ) ) ( not ( = ?auto_156556 ?auto_156557 ) ) ( not ( = ?auto_156556 ?auto_156558 ) ) ( not ( = ?auto_156556 ?auto_156559 ) ) ( not ( = ?auto_156556 ?auto_156560 ) ) ( not ( = ?auto_156556 ?auto_156561 ) ) ( not ( = ?auto_156556 ?auto_156562 ) ) ( not ( = ?auto_156556 ?auto_156563 ) ) ( not ( = ?auto_156557 ?auto_156558 ) ) ( not ( = ?auto_156557 ?auto_156559 ) ) ( not ( = ?auto_156557 ?auto_156560 ) ) ( not ( = ?auto_156557 ?auto_156561 ) ) ( not ( = ?auto_156557 ?auto_156562 ) ) ( not ( = ?auto_156557 ?auto_156563 ) ) ( not ( = ?auto_156558 ?auto_156559 ) ) ( not ( = ?auto_156558 ?auto_156560 ) ) ( not ( = ?auto_156558 ?auto_156561 ) ) ( not ( = ?auto_156558 ?auto_156562 ) ) ( not ( = ?auto_156558 ?auto_156563 ) ) ( not ( = ?auto_156559 ?auto_156560 ) ) ( not ( = ?auto_156559 ?auto_156561 ) ) ( not ( = ?auto_156559 ?auto_156562 ) ) ( not ( = ?auto_156559 ?auto_156563 ) ) ( not ( = ?auto_156560 ?auto_156561 ) ) ( not ( = ?auto_156560 ?auto_156562 ) ) ( not ( = ?auto_156560 ?auto_156563 ) ) ( not ( = ?auto_156561 ?auto_156562 ) ) ( not ( = ?auto_156561 ?auto_156563 ) ) ( not ( = ?auto_156562 ?auto_156563 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_156562 ?auto_156563 )
      ( !STACK ?auto_156562 ?auto_156561 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_156573 - BLOCK
      ?auto_156574 - BLOCK
      ?auto_156575 - BLOCK
      ?auto_156576 - BLOCK
      ?auto_156577 - BLOCK
      ?auto_156578 - BLOCK
      ?auto_156579 - BLOCK
      ?auto_156580 - BLOCK
      ?auto_156581 - BLOCK
    )
    :vars
    (
      ?auto_156582 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156581 ?auto_156582 ) ( ON-TABLE ?auto_156573 ) ( ON ?auto_156574 ?auto_156573 ) ( ON ?auto_156575 ?auto_156574 ) ( ON ?auto_156576 ?auto_156575 ) ( ON ?auto_156577 ?auto_156576 ) ( ON ?auto_156578 ?auto_156577 ) ( ON ?auto_156579 ?auto_156578 ) ( not ( = ?auto_156573 ?auto_156574 ) ) ( not ( = ?auto_156573 ?auto_156575 ) ) ( not ( = ?auto_156573 ?auto_156576 ) ) ( not ( = ?auto_156573 ?auto_156577 ) ) ( not ( = ?auto_156573 ?auto_156578 ) ) ( not ( = ?auto_156573 ?auto_156579 ) ) ( not ( = ?auto_156573 ?auto_156580 ) ) ( not ( = ?auto_156573 ?auto_156581 ) ) ( not ( = ?auto_156573 ?auto_156582 ) ) ( not ( = ?auto_156574 ?auto_156575 ) ) ( not ( = ?auto_156574 ?auto_156576 ) ) ( not ( = ?auto_156574 ?auto_156577 ) ) ( not ( = ?auto_156574 ?auto_156578 ) ) ( not ( = ?auto_156574 ?auto_156579 ) ) ( not ( = ?auto_156574 ?auto_156580 ) ) ( not ( = ?auto_156574 ?auto_156581 ) ) ( not ( = ?auto_156574 ?auto_156582 ) ) ( not ( = ?auto_156575 ?auto_156576 ) ) ( not ( = ?auto_156575 ?auto_156577 ) ) ( not ( = ?auto_156575 ?auto_156578 ) ) ( not ( = ?auto_156575 ?auto_156579 ) ) ( not ( = ?auto_156575 ?auto_156580 ) ) ( not ( = ?auto_156575 ?auto_156581 ) ) ( not ( = ?auto_156575 ?auto_156582 ) ) ( not ( = ?auto_156576 ?auto_156577 ) ) ( not ( = ?auto_156576 ?auto_156578 ) ) ( not ( = ?auto_156576 ?auto_156579 ) ) ( not ( = ?auto_156576 ?auto_156580 ) ) ( not ( = ?auto_156576 ?auto_156581 ) ) ( not ( = ?auto_156576 ?auto_156582 ) ) ( not ( = ?auto_156577 ?auto_156578 ) ) ( not ( = ?auto_156577 ?auto_156579 ) ) ( not ( = ?auto_156577 ?auto_156580 ) ) ( not ( = ?auto_156577 ?auto_156581 ) ) ( not ( = ?auto_156577 ?auto_156582 ) ) ( not ( = ?auto_156578 ?auto_156579 ) ) ( not ( = ?auto_156578 ?auto_156580 ) ) ( not ( = ?auto_156578 ?auto_156581 ) ) ( not ( = ?auto_156578 ?auto_156582 ) ) ( not ( = ?auto_156579 ?auto_156580 ) ) ( not ( = ?auto_156579 ?auto_156581 ) ) ( not ( = ?auto_156579 ?auto_156582 ) ) ( not ( = ?auto_156580 ?auto_156581 ) ) ( not ( = ?auto_156580 ?auto_156582 ) ) ( not ( = ?auto_156581 ?auto_156582 ) ) ( CLEAR ?auto_156579 ) ( ON ?auto_156580 ?auto_156581 ) ( CLEAR ?auto_156580 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_156573 ?auto_156574 ?auto_156575 ?auto_156576 ?auto_156577 ?auto_156578 ?auto_156579 ?auto_156580 )
      ( MAKE-9PILE ?auto_156573 ?auto_156574 ?auto_156575 ?auto_156576 ?auto_156577 ?auto_156578 ?auto_156579 ?auto_156580 ?auto_156581 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_156592 - BLOCK
      ?auto_156593 - BLOCK
      ?auto_156594 - BLOCK
      ?auto_156595 - BLOCK
      ?auto_156596 - BLOCK
      ?auto_156597 - BLOCK
      ?auto_156598 - BLOCK
      ?auto_156599 - BLOCK
      ?auto_156600 - BLOCK
    )
    :vars
    (
      ?auto_156601 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156600 ?auto_156601 ) ( ON-TABLE ?auto_156592 ) ( ON ?auto_156593 ?auto_156592 ) ( ON ?auto_156594 ?auto_156593 ) ( ON ?auto_156595 ?auto_156594 ) ( ON ?auto_156596 ?auto_156595 ) ( ON ?auto_156597 ?auto_156596 ) ( ON ?auto_156598 ?auto_156597 ) ( not ( = ?auto_156592 ?auto_156593 ) ) ( not ( = ?auto_156592 ?auto_156594 ) ) ( not ( = ?auto_156592 ?auto_156595 ) ) ( not ( = ?auto_156592 ?auto_156596 ) ) ( not ( = ?auto_156592 ?auto_156597 ) ) ( not ( = ?auto_156592 ?auto_156598 ) ) ( not ( = ?auto_156592 ?auto_156599 ) ) ( not ( = ?auto_156592 ?auto_156600 ) ) ( not ( = ?auto_156592 ?auto_156601 ) ) ( not ( = ?auto_156593 ?auto_156594 ) ) ( not ( = ?auto_156593 ?auto_156595 ) ) ( not ( = ?auto_156593 ?auto_156596 ) ) ( not ( = ?auto_156593 ?auto_156597 ) ) ( not ( = ?auto_156593 ?auto_156598 ) ) ( not ( = ?auto_156593 ?auto_156599 ) ) ( not ( = ?auto_156593 ?auto_156600 ) ) ( not ( = ?auto_156593 ?auto_156601 ) ) ( not ( = ?auto_156594 ?auto_156595 ) ) ( not ( = ?auto_156594 ?auto_156596 ) ) ( not ( = ?auto_156594 ?auto_156597 ) ) ( not ( = ?auto_156594 ?auto_156598 ) ) ( not ( = ?auto_156594 ?auto_156599 ) ) ( not ( = ?auto_156594 ?auto_156600 ) ) ( not ( = ?auto_156594 ?auto_156601 ) ) ( not ( = ?auto_156595 ?auto_156596 ) ) ( not ( = ?auto_156595 ?auto_156597 ) ) ( not ( = ?auto_156595 ?auto_156598 ) ) ( not ( = ?auto_156595 ?auto_156599 ) ) ( not ( = ?auto_156595 ?auto_156600 ) ) ( not ( = ?auto_156595 ?auto_156601 ) ) ( not ( = ?auto_156596 ?auto_156597 ) ) ( not ( = ?auto_156596 ?auto_156598 ) ) ( not ( = ?auto_156596 ?auto_156599 ) ) ( not ( = ?auto_156596 ?auto_156600 ) ) ( not ( = ?auto_156596 ?auto_156601 ) ) ( not ( = ?auto_156597 ?auto_156598 ) ) ( not ( = ?auto_156597 ?auto_156599 ) ) ( not ( = ?auto_156597 ?auto_156600 ) ) ( not ( = ?auto_156597 ?auto_156601 ) ) ( not ( = ?auto_156598 ?auto_156599 ) ) ( not ( = ?auto_156598 ?auto_156600 ) ) ( not ( = ?auto_156598 ?auto_156601 ) ) ( not ( = ?auto_156599 ?auto_156600 ) ) ( not ( = ?auto_156599 ?auto_156601 ) ) ( not ( = ?auto_156600 ?auto_156601 ) ) ( CLEAR ?auto_156598 ) ( ON ?auto_156599 ?auto_156600 ) ( CLEAR ?auto_156599 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_156592 ?auto_156593 ?auto_156594 ?auto_156595 ?auto_156596 ?auto_156597 ?auto_156598 ?auto_156599 )
      ( MAKE-9PILE ?auto_156592 ?auto_156593 ?auto_156594 ?auto_156595 ?auto_156596 ?auto_156597 ?auto_156598 ?auto_156599 ?auto_156600 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_156611 - BLOCK
      ?auto_156612 - BLOCK
      ?auto_156613 - BLOCK
      ?auto_156614 - BLOCK
      ?auto_156615 - BLOCK
      ?auto_156616 - BLOCK
      ?auto_156617 - BLOCK
      ?auto_156618 - BLOCK
      ?auto_156619 - BLOCK
    )
    :vars
    (
      ?auto_156620 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156619 ?auto_156620 ) ( ON-TABLE ?auto_156611 ) ( ON ?auto_156612 ?auto_156611 ) ( ON ?auto_156613 ?auto_156612 ) ( ON ?auto_156614 ?auto_156613 ) ( ON ?auto_156615 ?auto_156614 ) ( ON ?auto_156616 ?auto_156615 ) ( not ( = ?auto_156611 ?auto_156612 ) ) ( not ( = ?auto_156611 ?auto_156613 ) ) ( not ( = ?auto_156611 ?auto_156614 ) ) ( not ( = ?auto_156611 ?auto_156615 ) ) ( not ( = ?auto_156611 ?auto_156616 ) ) ( not ( = ?auto_156611 ?auto_156617 ) ) ( not ( = ?auto_156611 ?auto_156618 ) ) ( not ( = ?auto_156611 ?auto_156619 ) ) ( not ( = ?auto_156611 ?auto_156620 ) ) ( not ( = ?auto_156612 ?auto_156613 ) ) ( not ( = ?auto_156612 ?auto_156614 ) ) ( not ( = ?auto_156612 ?auto_156615 ) ) ( not ( = ?auto_156612 ?auto_156616 ) ) ( not ( = ?auto_156612 ?auto_156617 ) ) ( not ( = ?auto_156612 ?auto_156618 ) ) ( not ( = ?auto_156612 ?auto_156619 ) ) ( not ( = ?auto_156612 ?auto_156620 ) ) ( not ( = ?auto_156613 ?auto_156614 ) ) ( not ( = ?auto_156613 ?auto_156615 ) ) ( not ( = ?auto_156613 ?auto_156616 ) ) ( not ( = ?auto_156613 ?auto_156617 ) ) ( not ( = ?auto_156613 ?auto_156618 ) ) ( not ( = ?auto_156613 ?auto_156619 ) ) ( not ( = ?auto_156613 ?auto_156620 ) ) ( not ( = ?auto_156614 ?auto_156615 ) ) ( not ( = ?auto_156614 ?auto_156616 ) ) ( not ( = ?auto_156614 ?auto_156617 ) ) ( not ( = ?auto_156614 ?auto_156618 ) ) ( not ( = ?auto_156614 ?auto_156619 ) ) ( not ( = ?auto_156614 ?auto_156620 ) ) ( not ( = ?auto_156615 ?auto_156616 ) ) ( not ( = ?auto_156615 ?auto_156617 ) ) ( not ( = ?auto_156615 ?auto_156618 ) ) ( not ( = ?auto_156615 ?auto_156619 ) ) ( not ( = ?auto_156615 ?auto_156620 ) ) ( not ( = ?auto_156616 ?auto_156617 ) ) ( not ( = ?auto_156616 ?auto_156618 ) ) ( not ( = ?auto_156616 ?auto_156619 ) ) ( not ( = ?auto_156616 ?auto_156620 ) ) ( not ( = ?auto_156617 ?auto_156618 ) ) ( not ( = ?auto_156617 ?auto_156619 ) ) ( not ( = ?auto_156617 ?auto_156620 ) ) ( not ( = ?auto_156618 ?auto_156619 ) ) ( not ( = ?auto_156618 ?auto_156620 ) ) ( not ( = ?auto_156619 ?auto_156620 ) ) ( ON ?auto_156618 ?auto_156619 ) ( CLEAR ?auto_156616 ) ( ON ?auto_156617 ?auto_156618 ) ( CLEAR ?auto_156617 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_156611 ?auto_156612 ?auto_156613 ?auto_156614 ?auto_156615 ?auto_156616 ?auto_156617 )
      ( MAKE-9PILE ?auto_156611 ?auto_156612 ?auto_156613 ?auto_156614 ?auto_156615 ?auto_156616 ?auto_156617 ?auto_156618 ?auto_156619 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_156630 - BLOCK
      ?auto_156631 - BLOCK
      ?auto_156632 - BLOCK
      ?auto_156633 - BLOCK
      ?auto_156634 - BLOCK
      ?auto_156635 - BLOCK
      ?auto_156636 - BLOCK
      ?auto_156637 - BLOCK
      ?auto_156638 - BLOCK
    )
    :vars
    (
      ?auto_156639 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156638 ?auto_156639 ) ( ON-TABLE ?auto_156630 ) ( ON ?auto_156631 ?auto_156630 ) ( ON ?auto_156632 ?auto_156631 ) ( ON ?auto_156633 ?auto_156632 ) ( ON ?auto_156634 ?auto_156633 ) ( ON ?auto_156635 ?auto_156634 ) ( not ( = ?auto_156630 ?auto_156631 ) ) ( not ( = ?auto_156630 ?auto_156632 ) ) ( not ( = ?auto_156630 ?auto_156633 ) ) ( not ( = ?auto_156630 ?auto_156634 ) ) ( not ( = ?auto_156630 ?auto_156635 ) ) ( not ( = ?auto_156630 ?auto_156636 ) ) ( not ( = ?auto_156630 ?auto_156637 ) ) ( not ( = ?auto_156630 ?auto_156638 ) ) ( not ( = ?auto_156630 ?auto_156639 ) ) ( not ( = ?auto_156631 ?auto_156632 ) ) ( not ( = ?auto_156631 ?auto_156633 ) ) ( not ( = ?auto_156631 ?auto_156634 ) ) ( not ( = ?auto_156631 ?auto_156635 ) ) ( not ( = ?auto_156631 ?auto_156636 ) ) ( not ( = ?auto_156631 ?auto_156637 ) ) ( not ( = ?auto_156631 ?auto_156638 ) ) ( not ( = ?auto_156631 ?auto_156639 ) ) ( not ( = ?auto_156632 ?auto_156633 ) ) ( not ( = ?auto_156632 ?auto_156634 ) ) ( not ( = ?auto_156632 ?auto_156635 ) ) ( not ( = ?auto_156632 ?auto_156636 ) ) ( not ( = ?auto_156632 ?auto_156637 ) ) ( not ( = ?auto_156632 ?auto_156638 ) ) ( not ( = ?auto_156632 ?auto_156639 ) ) ( not ( = ?auto_156633 ?auto_156634 ) ) ( not ( = ?auto_156633 ?auto_156635 ) ) ( not ( = ?auto_156633 ?auto_156636 ) ) ( not ( = ?auto_156633 ?auto_156637 ) ) ( not ( = ?auto_156633 ?auto_156638 ) ) ( not ( = ?auto_156633 ?auto_156639 ) ) ( not ( = ?auto_156634 ?auto_156635 ) ) ( not ( = ?auto_156634 ?auto_156636 ) ) ( not ( = ?auto_156634 ?auto_156637 ) ) ( not ( = ?auto_156634 ?auto_156638 ) ) ( not ( = ?auto_156634 ?auto_156639 ) ) ( not ( = ?auto_156635 ?auto_156636 ) ) ( not ( = ?auto_156635 ?auto_156637 ) ) ( not ( = ?auto_156635 ?auto_156638 ) ) ( not ( = ?auto_156635 ?auto_156639 ) ) ( not ( = ?auto_156636 ?auto_156637 ) ) ( not ( = ?auto_156636 ?auto_156638 ) ) ( not ( = ?auto_156636 ?auto_156639 ) ) ( not ( = ?auto_156637 ?auto_156638 ) ) ( not ( = ?auto_156637 ?auto_156639 ) ) ( not ( = ?auto_156638 ?auto_156639 ) ) ( ON ?auto_156637 ?auto_156638 ) ( CLEAR ?auto_156635 ) ( ON ?auto_156636 ?auto_156637 ) ( CLEAR ?auto_156636 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_156630 ?auto_156631 ?auto_156632 ?auto_156633 ?auto_156634 ?auto_156635 ?auto_156636 )
      ( MAKE-9PILE ?auto_156630 ?auto_156631 ?auto_156632 ?auto_156633 ?auto_156634 ?auto_156635 ?auto_156636 ?auto_156637 ?auto_156638 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_156649 - BLOCK
      ?auto_156650 - BLOCK
      ?auto_156651 - BLOCK
      ?auto_156652 - BLOCK
      ?auto_156653 - BLOCK
      ?auto_156654 - BLOCK
      ?auto_156655 - BLOCK
      ?auto_156656 - BLOCK
      ?auto_156657 - BLOCK
    )
    :vars
    (
      ?auto_156658 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156657 ?auto_156658 ) ( ON-TABLE ?auto_156649 ) ( ON ?auto_156650 ?auto_156649 ) ( ON ?auto_156651 ?auto_156650 ) ( ON ?auto_156652 ?auto_156651 ) ( ON ?auto_156653 ?auto_156652 ) ( not ( = ?auto_156649 ?auto_156650 ) ) ( not ( = ?auto_156649 ?auto_156651 ) ) ( not ( = ?auto_156649 ?auto_156652 ) ) ( not ( = ?auto_156649 ?auto_156653 ) ) ( not ( = ?auto_156649 ?auto_156654 ) ) ( not ( = ?auto_156649 ?auto_156655 ) ) ( not ( = ?auto_156649 ?auto_156656 ) ) ( not ( = ?auto_156649 ?auto_156657 ) ) ( not ( = ?auto_156649 ?auto_156658 ) ) ( not ( = ?auto_156650 ?auto_156651 ) ) ( not ( = ?auto_156650 ?auto_156652 ) ) ( not ( = ?auto_156650 ?auto_156653 ) ) ( not ( = ?auto_156650 ?auto_156654 ) ) ( not ( = ?auto_156650 ?auto_156655 ) ) ( not ( = ?auto_156650 ?auto_156656 ) ) ( not ( = ?auto_156650 ?auto_156657 ) ) ( not ( = ?auto_156650 ?auto_156658 ) ) ( not ( = ?auto_156651 ?auto_156652 ) ) ( not ( = ?auto_156651 ?auto_156653 ) ) ( not ( = ?auto_156651 ?auto_156654 ) ) ( not ( = ?auto_156651 ?auto_156655 ) ) ( not ( = ?auto_156651 ?auto_156656 ) ) ( not ( = ?auto_156651 ?auto_156657 ) ) ( not ( = ?auto_156651 ?auto_156658 ) ) ( not ( = ?auto_156652 ?auto_156653 ) ) ( not ( = ?auto_156652 ?auto_156654 ) ) ( not ( = ?auto_156652 ?auto_156655 ) ) ( not ( = ?auto_156652 ?auto_156656 ) ) ( not ( = ?auto_156652 ?auto_156657 ) ) ( not ( = ?auto_156652 ?auto_156658 ) ) ( not ( = ?auto_156653 ?auto_156654 ) ) ( not ( = ?auto_156653 ?auto_156655 ) ) ( not ( = ?auto_156653 ?auto_156656 ) ) ( not ( = ?auto_156653 ?auto_156657 ) ) ( not ( = ?auto_156653 ?auto_156658 ) ) ( not ( = ?auto_156654 ?auto_156655 ) ) ( not ( = ?auto_156654 ?auto_156656 ) ) ( not ( = ?auto_156654 ?auto_156657 ) ) ( not ( = ?auto_156654 ?auto_156658 ) ) ( not ( = ?auto_156655 ?auto_156656 ) ) ( not ( = ?auto_156655 ?auto_156657 ) ) ( not ( = ?auto_156655 ?auto_156658 ) ) ( not ( = ?auto_156656 ?auto_156657 ) ) ( not ( = ?auto_156656 ?auto_156658 ) ) ( not ( = ?auto_156657 ?auto_156658 ) ) ( ON ?auto_156656 ?auto_156657 ) ( ON ?auto_156655 ?auto_156656 ) ( CLEAR ?auto_156653 ) ( ON ?auto_156654 ?auto_156655 ) ( CLEAR ?auto_156654 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_156649 ?auto_156650 ?auto_156651 ?auto_156652 ?auto_156653 ?auto_156654 )
      ( MAKE-9PILE ?auto_156649 ?auto_156650 ?auto_156651 ?auto_156652 ?auto_156653 ?auto_156654 ?auto_156655 ?auto_156656 ?auto_156657 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_156668 - BLOCK
      ?auto_156669 - BLOCK
      ?auto_156670 - BLOCK
      ?auto_156671 - BLOCK
      ?auto_156672 - BLOCK
      ?auto_156673 - BLOCK
      ?auto_156674 - BLOCK
      ?auto_156675 - BLOCK
      ?auto_156676 - BLOCK
    )
    :vars
    (
      ?auto_156677 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156676 ?auto_156677 ) ( ON-TABLE ?auto_156668 ) ( ON ?auto_156669 ?auto_156668 ) ( ON ?auto_156670 ?auto_156669 ) ( ON ?auto_156671 ?auto_156670 ) ( ON ?auto_156672 ?auto_156671 ) ( not ( = ?auto_156668 ?auto_156669 ) ) ( not ( = ?auto_156668 ?auto_156670 ) ) ( not ( = ?auto_156668 ?auto_156671 ) ) ( not ( = ?auto_156668 ?auto_156672 ) ) ( not ( = ?auto_156668 ?auto_156673 ) ) ( not ( = ?auto_156668 ?auto_156674 ) ) ( not ( = ?auto_156668 ?auto_156675 ) ) ( not ( = ?auto_156668 ?auto_156676 ) ) ( not ( = ?auto_156668 ?auto_156677 ) ) ( not ( = ?auto_156669 ?auto_156670 ) ) ( not ( = ?auto_156669 ?auto_156671 ) ) ( not ( = ?auto_156669 ?auto_156672 ) ) ( not ( = ?auto_156669 ?auto_156673 ) ) ( not ( = ?auto_156669 ?auto_156674 ) ) ( not ( = ?auto_156669 ?auto_156675 ) ) ( not ( = ?auto_156669 ?auto_156676 ) ) ( not ( = ?auto_156669 ?auto_156677 ) ) ( not ( = ?auto_156670 ?auto_156671 ) ) ( not ( = ?auto_156670 ?auto_156672 ) ) ( not ( = ?auto_156670 ?auto_156673 ) ) ( not ( = ?auto_156670 ?auto_156674 ) ) ( not ( = ?auto_156670 ?auto_156675 ) ) ( not ( = ?auto_156670 ?auto_156676 ) ) ( not ( = ?auto_156670 ?auto_156677 ) ) ( not ( = ?auto_156671 ?auto_156672 ) ) ( not ( = ?auto_156671 ?auto_156673 ) ) ( not ( = ?auto_156671 ?auto_156674 ) ) ( not ( = ?auto_156671 ?auto_156675 ) ) ( not ( = ?auto_156671 ?auto_156676 ) ) ( not ( = ?auto_156671 ?auto_156677 ) ) ( not ( = ?auto_156672 ?auto_156673 ) ) ( not ( = ?auto_156672 ?auto_156674 ) ) ( not ( = ?auto_156672 ?auto_156675 ) ) ( not ( = ?auto_156672 ?auto_156676 ) ) ( not ( = ?auto_156672 ?auto_156677 ) ) ( not ( = ?auto_156673 ?auto_156674 ) ) ( not ( = ?auto_156673 ?auto_156675 ) ) ( not ( = ?auto_156673 ?auto_156676 ) ) ( not ( = ?auto_156673 ?auto_156677 ) ) ( not ( = ?auto_156674 ?auto_156675 ) ) ( not ( = ?auto_156674 ?auto_156676 ) ) ( not ( = ?auto_156674 ?auto_156677 ) ) ( not ( = ?auto_156675 ?auto_156676 ) ) ( not ( = ?auto_156675 ?auto_156677 ) ) ( not ( = ?auto_156676 ?auto_156677 ) ) ( ON ?auto_156675 ?auto_156676 ) ( ON ?auto_156674 ?auto_156675 ) ( CLEAR ?auto_156672 ) ( ON ?auto_156673 ?auto_156674 ) ( CLEAR ?auto_156673 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_156668 ?auto_156669 ?auto_156670 ?auto_156671 ?auto_156672 ?auto_156673 )
      ( MAKE-9PILE ?auto_156668 ?auto_156669 ?auto_156670 ?auto_156671 ?auto_156672 ?auto_156673 ?auto_156674 ?auto_156675 ?auto_156676 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_156687 - BLOCK
      ?auto_156688 - BLOCK
      ?auto_156689 - BLOCK
      ?auto_156690 - BLOCK
      ?auto_156691 - BLOCK
      ?auto_156692 - BLOCK
      ?auto_156693 - BLOCK
      ?auto_156694 - BLOCK
      ?auto_156695 - BLOCK
    )
    :vars
    (
      ?auto_156696 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156695 ?auto_156696 ) ( ON-TABLE ?auto_156687 ) ( ON ?auto_156688 ?auto_156687 ) ( ON ?auto_156689 ?auto_156688 ) ( ON ?auto_156690 ?auto_156689 ) ( not ( = ?auto_156687 ?auto_156688 ) ) ( not ( = ?auto_156687 ?auto_156689 ) ) ( not ( = ?auto_156687 ?auto_156690 ) ) ( not ( = ?auto_156687 ?auto_156691 ) ) ( not ( = ?auto_156687 ?auto_156692 ) ) ( not ( = ?auto_156687 ?auto_156693 ) ) ( not ( = ?auto_156687 ?auto_156694 ) ) ( not ( = ?auto_156687 ?auto_156695 ) ) ( not ( = ?auto_156687 ?auto_156696 ) ) ( not ( = ?auto_156688 ?auto_156689 ) ) ( not ( = ?auto_156688 ?auto_156690 ) ) ( not ( = ?auto_156688 ?auto_156691 ) ) ( not ( = ?auto_156688 ?auto_156692 ) ) ( not ( = ?auto_156688 ?auto_156693 ) ) ( not ( = ?auto_156688 ?auto_156694 ) ) ( not ( = ?auto_156688 ?auto_156695 ) ) ( not ( = ?auto_156688 ?auto_156696 ) ) ( not ( = ?auto_156689 ?auto_156690 ) ) ( not ( = ?auto_156689 ?auto_156691 ) ) ( not ( = ?auto_156689 ?auto_156692 ) ) ( not ( = ?auto_156689 ?auto_156693 ) ) ( not ( = ?auto_156689 ?auto_156694 ) ) ( not ( = ?auto_156689 ?auto_156695 ) ) ( not ( = ?auto_156689 ?auto_156696 ) ) ( not ( = ?auto_156690 ?auto_156691 ) ) ( not ( = ?auto_156690 ?auto_156692 ) ) ( not ( = ?auto_156690 ?auto_156693 ) ) ( not ( = ?auto_156690 ?auto_156694 ) ) ( not ( = ?auto_156690 ?auto_156695 ) ) ( not ( = ?auto_156690 ?auto_156696 ) ) ( not ( = ?auto_156691 ?auto_156692 ) ) ( not ( = ?auto_156691 ?auto_156693 ) ) ( not ( = ?auto_156691 ?auto_156694 ) ) ( not ( = ?auto_156691 ?auto_156695 ) ) ( not ( = ?auto_156691 ?auto_156696 ) ) ( not ( = ?auto_156692 ?auto_156693 ) ) ( not ( = ?auto_156692 ?auto_156694 ) ) ( not ( = ?auto_156692 ?auto_156695 ) ) ( not ( = ?auto_156692 ?auto_156696 ) ) ( not ( = ?auto_156693 ?auto_156694 ) ) ( not ( = ?auto_156693 ?auto_156695 ) ) ( not ( = ?auto_156693 ?auto_156696 ) ) ( not ( = ?auto_156694 ?auto_156695 ) ) ( not ( = ?auto_156694 ?auto_156696 ) ) ( not ( = ?auto_156695 ?auto_156696 ) ) ( ON ?auto_156694 ?auto_156695 ) ( ON ?auto_156693 ?auto_156694 ) ( ON ?auto_156692 ?auto_156693 ) ( CLEAR ?auto_156690 ) ( ON ?auto_156691 ?auto_156692 ) ( CLEAR ?auto_156691 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_156687 ?auto_156688 ?auto_156689 ?auto_156690 ?auto_156691 )
      ( MAKE-9PILE ?auto_156687 ?auto_156688 ?auto_156689 ?auto_156690 ?auto_156691 ?auto_156692 ?auto_156693 ?auto_156694 ?auto_156695 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_156706 - BLOCK
      ?auto_156707 - BLOCK
      ?auto_156708 - BLOCK
      ?auto_156709 - BLOCK
      ?auto_156710 - BLOCK
      ?auto_156711 - BLOCK
      ?auto_156712 - BLOCK
      ?auto_156713 - BLOCK
      ?auto_156714 - BLOCK
    )
    :vars
    (
      ?auto_156715 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156714 ?auto_156715 ) ( ON-TABLE ?auto_156706 ) ( ON ?auto_156707 ?auto_156706 ) ( ON ?auto_156708 ?auto_156707 ) ( ON ?auto_156709 ?auto_156708 ) ( not ( = ?auto_156706 ?auto_156707 ) ) ( not ( = ?auto_156706 ?auto_156708 ) ) ( not ( = ?auto_156706 ?auto_156709 ) ) ( not ( = ?auto_156706 ?auto_156710 ) ) ( not ( = ?auto_156706 ?auto_156711 ) ) ( not ( = ?auto_156706 ?auto_156712 ) ) ( not ( = ?auto_156706 ?auto_156713 ) ) ( not ( = ?auto_156706 ?auto_156714 ) ) ( not ( = ?auto_156706 ?auto_156715 ) ) ( not ( = ?auto_156707 ?auto_156708 ) ) ( not ( = ?auto_156707 ?auto_156709 ) ) ( not ( = ?auto_156707 ?auto_156710 ) ) ( not ( = ?auto_156707 ?auto_156711 ) ) ( not ( = ?auto_156707 ?auto_156712 ) ) ( not ( = ?auto_156707 ?auto_156713 ) ) ( not ( = ?auto_156707 ?auto_156714 ) ) ( not ( = ?auto_156707 ?auto_156715 ) ) ( not ( = ?auto_156708 ?auto_156709 ) ) ( not ( = ?auto_156708 ?auto_156710 ) ) ( not ( = ?auto_156708 ?auto_156711 ) ) ( not ( = ?auto_156708 ?auto_156712 ) ) ( not ( = ?auto_156708 ?auto_156713 ) ) ( not ( = ?auto_156708 ?auto_156714 ) ) ( not ( = ?auto_156708 ?auto_156715 ) ) ( not ( = ?auto_156709 ?auto_156710 ) ) ( not ( = ?auto_156709 ?auto_156711 ) ) ( not ( = ?auto_156709 ?auto_156712 ) ) ( not ( = ?auto_156709 ?auto_156713 ) ) ( not ( = ?auto_156709 ?auto_156714 ) ) ( not ( = ?auto_156709 ?auto_156715 ) ) ( not ( = ?auto_156710 ?auto_156711 ) ) ( not ( = ?auto_156710 ?auto_156712 ) ) ( not ( = ?auto_156710 ?auto_156713 ) ) ( not ( = ?auto_156710 ?auto_156714 ) ) ( not ( = ?auto_156710 ?auto_156715 ) ) ( not ( = ?auto_156711 ?auto_156712 ) ) ( not ( = ?auto_156711 ?auto_156713 ) ) ( not ( = ?auto_156711 ?auto_156714 ) ) ( not ( = ?auto_156711 ?auto_156715 ) ) ( not ( = ?auto_156712 ?auto_156713 ) ) ( not ( = ?auto_156712 ?auto_156714 ) ) ( not ( = ?auto_156712 ?auto_156715 ) ) ( not ( = ?auto_156713 ?auto_156714 ) ) ( not ( = ?auto_156713 ?auto_156715 ) ) ( not ( = ?auto_156714 ?auto_156715 ) ) ( ON ?auto_156713 ?auto_156714 ) ( ON ?auto_156712 ?auto_156713 ) ( ON ?auto_156711 ?auto_156712 ) ( CLEAR ?auto_156709 ) ( ON ?auto_156710 ?auto_156711 ) ( CLEAR ?auto_156710 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_156706 ?auto_156707 ?auto_156708 ?auto_156709 ?auto_156710 )
      ( MAKE-9PILE ?auto_156706 ?auto_156707 ?auto_156708 ?auto_156709 ?auto_156710 ?auto_156711 ?auto_156712 ?auto_156713 ?auto_156714 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_156725 - BLOCK
      ?auto_156726 - BLOCK
      ?auto_156727 - BLOCK
      ?auto_156728 - BLOCK
      ?auto_156729 - BLOCK
      ?auto_156730 - BLOCK
      ?auto_156731 - BLOCK
      ?auto_156732 - BLOCK
      ?auto_156733 - BLOCK
    )
    :vars
    (
      ?auto_156734 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156733 ?auto_156734 ) ( ON-TABLE ?auto_156725 ) ( ON ?auto_156726 ?auto_156725 ) ( ON ?auto_156727 ?auto_156726 ) ( not ( = ?auto_156725 ?auto_156726 ) ) ( not ( = ?auto_156725 ?auto_156727 ) ) ( not ( = ?auto_156725 ?auto_156728 ) ) ( not ( = ?auto_156725 ?auto_156729 ) ) ( not ( = ?auto_156725 ?auto_156730 ) ) ( not ( = ?auto_156725 ?auto_156731 ) ) ( not ( = ?auto_156725 ?auto_156732 ) ) ( not ( = ?auto_156725 ?auto_156733 ) ) ( not ( = ?auto_156725 ?auto_156734 ) ) ( not ( = ?auto_156726 ?auto_156727 ) ) ( not ( = ?auto_156726 ?auto_156728 ) ) ( not ( = ?auto_156726 ?auto_156729 ) ) ( not ( = ?auto_156726 ?auto_156730 ) ) ( not ( = ?auto_156726 ?auto_156731 ) ) ( not ( = ?auto_156726 ?auto_156732 ) ) ( not ( = ?auto_156726 ?auto_156733 ) ) ( not ( = ?auto_156726 ?auto_156734 ) ) ( not ( = ?auto_156727 ?auto_156728 ) ) ( not ( = ?auto_156727 ?auto_156729 ) ) ( not ( = ?auto_156727 ?auto_156730 ) ) ( not ( = ?auto_156727 ?auto_156731 ) ) ( not ( = ?auto_156727 ?auto_156732 ) ) ( not ( = ?auto_156727 ?auto_156733 ) ) ( not ( = ?auto_156727 ?auto_156734 ) ) ( not ( = ?auto_156728 ?auto_156729 ) ) ( not ( = ?auto_156728 ?auto_156730 ) ) ( not ( = ?auto_156728 ?auto_156731 ) ) ( not ( = ?auto_156728 ?auto_156732 ) ) ( not ( = ?auto_156728 ?auto_156733 ) ) ( not ( = ?auto_156728 ?auto_156734 ) ) ( not ( = ?auto_156729 ?auto_156730 ) ) ( not ( = ?auto_156729 ?auto_156731 ) ) ( not ( = ?auto_156729 ?auto_156732 ) ) ( not ( = ?auto_156729 ?auto_156733 ) ) ( not ( = ?auto_156729 ?auto_156734 ) ) ( not ( = ?auto_156730 ?auto_156731 ) ) ( not ( = ?auto_156730 ?auto_156732 ) ) ( not ( = ?auto_156730 ?auto_156733 ) ) ( not ( = ?auto_156730 ?auto_156734 ) ) ( not ( = ?auto_156731 ?auto_156732 ) ) ( not ( = ?auto_156731 ?auto_156733 ) ) ( not ( = ?auto_156731 ?auto_156734 ) ) ( not ( = ?auto_156732 ?auto_156733 ) ) ( not ( = ?auto_156732 ?auto_156734 ) ) ( not ( = ?auto_156733 ?auto_156734 ) ) ( ON ?auto_156732 ?auto_156733 ) ( ON ?auto_156731 ?auto_156732 ) ( ON ?auto_156730 ?auto_156731 ) ( ON ?auto_156729 ?auto_156730 ) ( CLEAR ?auto_156727 ) ( ON ?auto_156728 ?auto_156729 ) ( CLEAR ?auto_156728 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_156725 ?auto_156726 ?auto_156727 ?auto_156728 )
      ( MAKE-9PILE ?auto_156725 ?auto_156726 ?auto_156727 ?auto_156728 ?auto_156729 ?auto_156730 ?auto_156731 ?auto_156732 ?auto_156733 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_156744 - BLOCK
      ?auto_156745 - BLOCK
      ?auto_156746 - BLOCK
      ?auto_156747 - BLOCK
      ?auto_156748 - BLOCK
      ?auto_156749 - BLOCK
      ?auto_156750 - BLOCK
      ?auto_156751 - BLOCK
      ?auto_156752 - BLOCK
    )
    :vars
    (
      ?auto_156753 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156752 ?auto_156753 ) ( ON-TABLE ?auto_156744 ) ( ON ?auto_156745 ?auto_156744 ) ( ON ?auto_156746 ?auto_156745 ) ( not ( = ?auto_156744 ?auto_156745 ) ) ( not ( = ?auto_156744 ?auto_156746 ) ) ( not ( = ?auto_156744 ?auto_156747 ) ) ( not ( = ?auto_156744 ?auto_156748 ) ) ( not ( = ?auto_156744 ?auto_156749 ) ) ( not ( = ?auto_156744 ?auto_156750 ) ) ( not ( = ?auto_156744 ?auto_156751 ) ) ( not ( = ?auto_156744 ?auto_156752 ) ) ( not ( = ?auto_156744 ?auto_156753 ) ) ( not ( = ?auto_156745 ?auto_156746 ) ) ( not ( = ?auto_156745 ?auto_156747 ) ) ( not ( = ?auto_156745 ?auto_156748 ) ) ( not ( = ?auto_156745 ?auto_156749 ) ) ( not ( = ?auto_156745 ?auto_156750 ) ) ( not ( = ?auto_156745 ?auto_156751 ) ) ( not ( = ?auto_156745 ?auto_156752 ) ) ( not ( = ?auto_156745 ?auto_156753 ) ) ( not ( = ?auto_156746 ?auto_156747 ) ) ( not ( = ?auto_156746 ?auto_156748 ) ) ( not ( = ?auto_156746 ?auto_156749 ) ) ( not ( = ?auto_156746 ?auto_156750 ) ) ( not ( = ?auto_156746 ?auto_156751 ) ) ( not ( = ?auto_156746 ?auto_156752 ) ) ( not ( = ?auto_156746 ?auto_156753 ) ) ( not ( = ?auto_156747 ?auto_156748 ) ) ( not ( = ?auto_156747 ?auto_156749 ) ) ( not ( = ?auto_156747 ?auto_156750 ) ) ( not ( = ?auto_156747 ?auto_156751 ) ) ( not ( = ?auto_156747 ?auto_156752 ) ) ( not ( = ?auto_156747 ?auto_156753 ) ) ( not ( = ?auto_156748 ?auto_156749 ) ) ( not ( = ?auto_156748 ?auto_156750 ) ) ( not ( = ?auto_156748 ?auto_156751 ) ) ( not ( = ?auto_156748 ?auto_156752 ) ) ( not ( = ?auto_156748 ?auto_156753 ) ) ( not ( = ?auto_156749 ?auto_156750 ) ) ( not ( = ?auto_156749 ?auto_156751 ) ) ( not ( = ?auto_156749 ?auto_156752 ) ) ( not ( = ?auto_156749 ?auto_156753 ) ) ( not ( = ?auto_156750 ?auto_156751 ) ) ( not ( = ?auto_156750 ?auto_156752 ) ) ( not ( = ?auto_156750 ?auto_156753 ) ) ( not ( = ?auto_156751 ?auto_156752 ) ) ( not ( = ?auto_156751 ?auto_156753 ) ) ( not ( = ?auto_156752 ?auto_156753 ) ) ( ON ?auto_156751 ?auto_156752 ) ( ON ?auto_156750 ?auto_156751 ) ( ON ?auto_156749 ?auto_156750 ) ( ON ?auto_156748 ?auto_156749 ) ( CLEAR ?auto_156746 ) ( ON ?auto_156747 ?auto_156748 ) ( CLEAR ?auto_156747 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_156744 ?auto_156745 ?auto_156746 ?auto_156747 )
      ( MAKE-9PILE ?auto_156744 ?auto_156745 ?auto_156746 ?auto_156747 ?auto_156748 ?auto_156749 ?auto_156750 ?auto_156751 ?auto_156752 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_156763 - BLOCK
      ?auto_156764 - BLOCK
      ?auto_156765 - BLOCK
      ?auto_156766 - BLOCK
      ?auto_156767 - BLOCK
      ?auto_156768 - BLOCK
      ?auto_156769 - BLOCK
      ?auto_156770 - BLOCK
      ?auto_156771 - BLOCK
    )
    :vars
    (
      ?auto_156772 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156771 ?auto_156772 ) ( ON-TABLE ?auto_156763 ) ( ON ?auto_156764 ?auto_156763 ) ( not ( = ?auto_156763 ?auto_156764 ) ) ( not ( = ?auto_156763 ?auto_156765 ) ) ( not ( = ?auto_156763 ?auto_156766 ) ) ( not ( = ?auto_156763 ?auto_156767 ) ) ( not ( = ?auto_156763 ?auto_156768 ) ) ( not ( = ?auto_156763 ?auto_156769 ) ) ( not ( = ?auto_156763 ?auto_156770 ) ) ( not ( = ?auto_156763 ?auto_156771 ) ) ( not ( = ?auto_156763 ?auto_156772 ) ) ( not ( = ?auto_156764 ?auto_156765 ) ) ( not ( = ?auto_156764 ?auto_156766 ) ) ( not ( = ?auto_156764 ?auto_156767 ) ) ( not ( = ?auto_156764 ?auto_156768 ) ) ( not ( = ?auto_156764 ?auto_156769 ) ) ( not ( = ?auto_156764 ?auto_156770 ) ) ( not ( = ?auto_156764 ?auto_156771 ) ) ( not ( = ?auto_156764 ?auto_156772 ) ) ( not ( = ?auto_156765 ?auto_156766 ) ) ( not ( = ?auto_156765 ?auto_156767 ) ) ( not ( = ?auto_156765 ?auto_156768 ) ) ( not ( = ?auto_156765 ?auto_156769 ) ) ( not ( = ?auto_156765 ?auto_156770 ) ) ( not ( = ?auto_156765 ?auto_156771 ) ) ( not ( = ?auto_156765 ?auto_156772 ) ) ( not ( = ?auto_156766 ?auto_156767 ) ) ( not ( = ?auto_156766 ?auto_156768 ) ) ( not ( = ?auto_156766 ?auto_156769 ) ) ( not ( = ?auto_156766 ?auto_156770 ) ) ( not ( = ?auto_156766 ?auto_156771 ) ) ( not ( = ?auto_156766 ?auto_156772 ) ) ( not ( = ?auto_156767 ?auto_156768 ) ) ( not ( = ?auto_156767 ?auto_156769 ) ) ( not ( = ?auto_156767 ?auto_156770 ) ) ( not ( = ?auto_156767 ?auto_156771 ) ) ( not ( = ?auto_156767 ?auto_156772 ) ) ( not ( = ?auto_156768 ?auto_156769 ) ) ( not ( = ?auto_156768 ?auto_156770 ) ) ( not ( = ?auto_156768 ?auto_156771 ) ) ( not ( = ?auto_156768 ?auto_156772 ) ) ( not ( = ?auto_156769 ?auto_156770 ) ) ( not ( = ?auto_156769 ?auto_156771 ) ) ( not ( = ?auto_156769 ?auto_156772 ) ) ( not ( = ?auto_156770 ?auto_156771 ) ) ( not ( = ?auto_156770 ?auto_156772 ) ) ( not ( = ?auto_156771 ?auto_156772 ) ) ( ON ?auto_156770 ?auto_156771 ) ( ON ?auto_156769 ?auto_156770 ) ( ON ?auto_156768 ?auto_156769 ) ( ON ?auto_156767 ?auto_156768 ) ( ON ?auto_156766 ?auto_156767 ) ( CLEAR ?auto_156764 ) ( ON ?auto_156765 ?auto_156766 ) ( CLEAR ?auto_156765 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_156763 ?auto_156764 ?auto_156765 )
      ( MAKE-9PILE ?auto_156763 ?auto_156764 ?auto_156765 ?auto_156766 ?auto_156767 ?auto_156768 ?auto_156769 ?auto_156770 ?auto_156771 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_156782 - BLOCK
      ?auto_156783 - BLOCK
      ?auto_156784 - BLOCK
      ?auto_156785 - BLOCK
      ?auto_156786 - BLOCK
      ?auto_156787 - BLOCK
      ?auto_156788 - BLOCK
      ?auto_156789 - BLOCK
      ?auto_156790 - BLOCK
    )
    :vars
    (
      ?auto_156791 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156790 ?auto_156791 ) ( ON-TABLE ?auto_156782 ) ( ON ?auto_156783 ?auto_156782 ) ( not ( = ?auto_156782 ?auto_156783 ) ) ( not ( = ?auto_156782 ?auto_156784 ) ) ( not ( = ?auto_156782 ?auto_156785 ) ) ( not ( = ?auto_156782 ?auto_156786 ) ) ( not ( = ?auto_156782 ?auto_156787 ) ) ( not ( = ?auto_156782 ?auto_156788 ) ) ( not ( = ?auto_156782 ?auto_156789 ) ) ( not ( = ?auto_156782 ?auto_156790 ) ) ( not ( = ?auto_156782 ?auto_156791 ) ) ( not ( = ?auto_156783 ?auto_156784 ) ) ( not ( = ?auto_156783 ?auto_156785 ) ) ( not ( = ?auto_156783 ?auto_156786 ) ) ( not ( = ?auto_156783 ?auto_156787 ) ) ( not ( = ?auto_156783 ?auto_156788 ) ) ( not ( = ?auto_156783 ?auto_156789 ) ) ( not ( = ?auto_156783 ?auto_156790 ) ) ( not ( = ?auto_156783 ?auto_156791 ) ) ( not ( = ?auto_156784 ?auto_156785 ) ) ( not ( = ?auto_156784 ?auto_156786 ) ) ( not ( = ?auto_156784 ?auto_156787 ) ) ( not ( = ?auto_156784 ?auto_156788 ) ) ( not ( = ?auto_156784 ?auto_156789 ) ) ( not ( = ?auto_156784 ?auto_156790 ) ) ( not ( = ?auto_156784 ?auto_156791 ) ) ( not ( = ?auto_156785 ?auto_156786 ) ) ( not ( = ?auto_156785 ?auto_156787 ) ) ( not ( = ?auto_156785 ?auto_156788 ) ) ( not ( = ?auto_156785 ?auto_156789 ) ) ( not ( = ?auto_156785 ?auto_156790 ) ) ( not ( = ?auto_156785 ?auto_156791 ) ) ( not ( = ?auto_156786 ?auto_156787 ) ) ( not ( = ?auto_156786 ?auto_156788 ) ) ( not ( = ?auto_156786 ?auto_156789 ) ) ( not ( = ?auto_156786 ?auto_156790 ) ) ( not ( = ?auto_156786 ?auto_156791 ) ) ( not ( = ?auto_156787 ?auto_156788 ) ) ( not ( = ?auto_156787 ?auto_156789 ) ) ( not ( = ?auto_156787 ?auto_156790 ) ) ( not ( = ?auto_156787 ?auto_156791 ) ) ( not ( = ?auto_156788 ?auto_156789 ) ) ( not ( = ?auto_156788 ?auto_156790 ) ) ( not ( = ?auto_156788 ?auto_156791 ) ) ( not ( = ?auto_156789 ?auto_156790 ) ) ( not ( = ?auto_156789 ?auto_156791 ) ) ( not ( = ?auto_156790 ?auto_156791 ) ) ( ON ?auto_156789 ?auto_156790 ) ( ON ?auto_156788 ?auto_156789 ) ( ON ?auto_156787 ?auto_156788 ) ( ON ?auto_156786 ?auto_156787 ) ( ON ?auto_156785 ?auto_156786 ) ( CLEAR ?auto_156783 ) ( ON ?auto_156784 ?auto_156785 ) ( CLEAR ?auto_156784 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_156782 ?auto_156783 ?auto_156784 )
      ( MAKE-9PILE ?auto_156782 ?auto_156783 ?auto_156784 ?auto_156785 ?auto_156786 ?auto_156787 ?auto_156788 ?auto_156789 ?auto_156790 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_156801 - BLOCK
      ?auto_156802 - BLOCK
      ?auto_156803 - BLOCK
      ?auto_156804 - BLOCK
      ?auto_156805 - BLOCK
      ?auto_156806 - BLOCK
      ?auto_156807 - BLOCK
      ?auto_156808 - BLOCK
      ?auto_156809 - BLOCK
    )
    :vars
    (
      ?auto_156810 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156809 ?auto_156810 ) ( ON-TABLE ?auto_156801 ) ( not ( = ?auto_156801 ?auto_156802 ) ) ( not ( = ?auto_156801 ?auto_156803 ) ) ( not ( = ?auto_156801 ?auto_156804 ) ) ( not ( = ?auto_156801 ?auto_156805 ) ) ( not ( = ?auto_156801 ?auto_156806 ) ) ( not ( = ?auto_156801 ?auto_156807 ) ) ( not ( = ?auto_156801 ?auto_156808 ) ) ( not ( = ?auto_156801 ?auto_156809 ) ) ( not ( = ?auto_156801 ?auto_156810 ) ) ( not ( = ?auto_156802 ?auto_156803 ) ) ( not ( = ?auto_156802 ?auto_156804 ) ) ( not ( = ?auto_156802 ?auto_156805 ) ) ( not ( = ?auto_156802 ?auto_156806 ) ) ( not ( = ?auto_156802 ?auto_156807 ) ) ( not ( = ?auto_156802 ?auto_156808 ) ) ( not ( = ?auto_156802 ?auto_156809 ) ) ( not ( = ?auto_156802 ?auto_156810 ) ) ( not ( = ?auto_156803 ?auto_156804 ) ) ( not ( = ?auto_156803 ?auto_156805 ) ) ( not ( = ?auto_156803 ?auto_156806 ) ) ( not ( = ?auto_156803 ?auto_156807 ) ) ( not ( = ?auto_156803 ?auto_156808 ) ) ( not ( = ?auto_156803 ?auto_156809 ) ) ( not ( = ?auto_156803 ?auto_156810 ) ) ( not ( = ?auto_156804 ?auto_156805 ) ) ( not ( = ?auto_156804 ?auto_156806 ) ) ( not ( = ?auto_156804 ?auto_156807 ) ) ( not ( = ?auto_156804 ?auto_156808 ) ) ( not ( = ?auto_156804 ?auto_156809 ) ) ( not ( = ?auto_156804 ?auto_156810 ) ) ( not ( = ?auto_156805 ?auto_156806 ) ) ( not ( = ?auto_156805 ?auto_156807 ) ) ( not ( = ?auto_156805 ?auto_156808 ) ) ( not ( = ?auto_156805 ?auto_156809 ) ) ( not ( = ?auto_156805 ?auto_156810 ) ) ( not ( = ?auto_156806 ?auto_156807 ) ) ( not ( = ?auto_156806 ?auto_156808 ) ) ( not ( = ?auto_156806 ?auto_156809 ) ) ( not ( = ?auto_156806 ?auto_156810 ) ) ( not ( = ?auto_156807 ?auto_156808 ) ) ( not ( = ?auto_156807 ?auto_156809 ) ) ( not ( = ?auto_156807 ?auto_156810 ) ) ( not ( = ?auto_156808 ?auto_156809 ) ) ( not ( = ?auto_156808 ?auto_156810 ) ) ( not ( = ?auto_156809 ?auto_156810 ) ) ( ON ?auto_156808 ?auto_156809 ) ( ON ?auto_156807 ?auto_156808 ) ( ON ?auto_156806 ?auto_156807 ) ( ON ?auto_156805 ?auto_156806 ) ( ON ?auto_156804 ?auto_156805 ) ( ON ?auto_156803 ?auto_156804 ) ( CLEAR ?auto_156801 ) ( ON ?auto_156802 ?auto_156803 ) ( CLEAR ?auto_156802 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_156801 ?auto_156802 )
      ( MAKE-9PILE ?auto_156801 ?auto_156802 ?auto_156803 ?auto_156804 ?auto_156805 ?auto_156806 ?auto_156807 ?auto_156808 ?auto_156809 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_156820 - BLOCK
      ?auto_156821 - BLOCK
      ?auto_156822 - BLOCK
      ?auto_156823 - BLOCK
      ?auto_156824 - BLOCK
      ?auto_156825 - BLOCK
      ?auto_156826 - BLOCK
      ?auto_156827 - BLOCK
      ?auto_156828 - BLOCK
    )
    :vars
    (
      ?auto_156829 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156828 ?auto_156829 ) ( ON-TABLE ?auto_156820 ) ( not ( = ?auto_156820 ?auto_156821 ) ) ( not ( = ?auto_156820 ?auto_156822 ) ) ( not ( = ?auto_156820 ?auto_156823 ) ) ( not ( = ?auto_156820 ?auto_156824 ) ) ( not ( = ?auto_156820 ?auto_156825 ) ) ( not ( = ?auto_156820 ?auto_156826 ) ) ( not ( = ?auto_156820 ?auto_156827 ) ) ( not ( = ?auto_156820 ?auto_156828 ) ) ( not ( = ?auto_156820 ?auto_156829 ) ) ( not ( = ?auto_156821 ?auto_156822 ) ) ( not ( = ?auto_156821 ?auto_156823 ) ) ( not ( = ?auto_156821 ?auto_156824 ) ) ( not ( = ?auto_156821 ?auto_156825 ) ) ( not ( = ?auto_156821 ?auto_156826 ) ) ( not ( = ?auto_156821 ?auto_156827 ) ) ( not ( = ?auto_156821 ?auto_156828 ) ) ( not ( = ?auto_156821 ?auto_156829 ) ) ( not ( = ?auto_156822 ?auto_156823 ) ) ( not ( = ?auto_156822 ?auto_156824 ) ) ( not ( = ?auto_156822 ?auto_156825 ) ) ( not ( = ?auto_156822 ?auto_156826 ) ) ( not ( = ?auto_156822 ?auto_156827 ) ) ( not ( = ?auto_156822 ?auto_156828 ) ) ( not ( = ?auto_156822 ?auto_156829 ) ) ( not ( = ?auto_156823 ?auto_156824 ) ) ( not ( = ?auto_156823 ?auto_156825 ) ) ( not ( = ?auto_156823 ?auto_156826 ) ) ( not ( = ?auto_156823 ?auto_156827 ) ) ( not ( = ?auto_156823 ?auto_156828 ) ) ( not ( = ?auto_156823 ?auto_156829 ) ) ( not ( = ?auto_156824 ?auto_156825 ) ) ( not ( = ?auto_156824 ?auto_156826 ) ) ( not ( = ?auto_156824 ?auto_156827 ) ) ( not ( = ?auto_156824 ?auto_156828 ) ) ( not ( = ?auto_156824 ?auto_156829 ) ) ( not ( = ?auto_156825 ?auto_156826 ) ) ( not ( = ?auto_156825 ?auto_156827 ) ) ( not ( = ?auto_156825 ?auto_156828 ) ) ( not ( = ?auto_156825 ?auto_156829 ) ) ( not ( = ?auto_156826 ?auto_156827 ) ) ( not ( = ?auto_156826 ?auto_156828 ) ) ( not ( = ?auto_156826 ?auto_156829 ) ) ( not ( = ?auto_156827 ?auto_156828 ) ) ( not ( = ?auto_156827 ?auto_156829 ) ) ( not ( = ?auto_156828 ?auto_156829 ) ) ( ON ?auto_156827 ?auto_156828 ) ( ON ?auto_156826 ?auto_156827 ) ( ON ?auto_156825 ?auto_156826 ) ( ON ?auto_156824 ?auto_156825 ) ( ON ?auto_156823 ?auto_156824 ) ( ON ?auto_156822 ?auto_156823 ) ( CLEAR ?auto_156820 ) ( ON ?auto_156821 ?auto_156822 ) ( CLEAR ?auto_156821 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_156820 ?auto_156821 )
      ( MAKE-9PILE ?auto_156820 ?auto_156821 ?auto_156822 ?auto_156823 ?auto_156824 ?auto_156825 ?auto_156826 ?auto_156827 ?auto_156828 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_156839 - BLOCK
      ?auto_156840 - BLOCK
      ?auto_156841 - BLOCK
      ?auto_156842 - BLOCK
      ?auto_156843 - BLOCK
      ?auto_156844 - BLOCK
      ?auto_156845 - BLOCK
      ?auto_156846 - BLOCK
      ?auto_156847 - BLOCK
    )
    :vars
    (
      ?auto_156848 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156847 ?auto_156848 ) ( not ( = ?auto_156839 ?auto_156840 ) ) ( not ( = ?auto_156839 ?auto_156841 ) ) ( not ( = ?auto_156839 ?auto_156842 ) ) ( not ( = ?auto_156839 ?auto_156843 ) ) ( not ( = ?auto_156839 ?auto_156844 ) ) ( not ( = ?auto_156839 ?auto_156845 ) ) ( not ( = ?auto_156839 ?auto_156846 ) ) ( not ( = ?auto_156839 ?auto_156847 ) ) ( not ( = ?auto_156839 ?auto_156848 ) ) ( not ( = ?auto_156840 ?auto_156841 ) ) ( not ( = ?auto_156840 ?auto_156842 ) ) ( not ( = ?auto_156840 ?auto_156843 ) ) ( not ( = ?auto_156840 ?auto_156844 ) ) ( not ( = ?auto_156840 ?auto_156845 ) ) ( not ( = ?auto_156840 ?auto_156846 ) ) ( not ( = ?auto_156840 ?auto_156847 ) ) ( not ( = ?auto_156840 ?auto_156848 ) ) ( not ( = ?auto_156841 ?auto_156842 ) ) ( not ( = ?auto_156841 ?auto_156843 ) ) ( not ( = ?auto_156841 ?auto_156844 ) ) ( not ( = ?auto_156841 ?auto_156845 ) ) ( not ( = ?auto_156841 ?auto_156846 ) ) ( not ( = ?auto_156841 ?auto_156847 ) ) ( not ( = ?auto_156841 ?auto_156848 ) ) ( not ( = ?auto_156842 ?auto_156843 ) ) ( not ( = ?auto_156842 ?auto_156844 ) ) ( not ( = ?auto_156842 ?auto_156845 ) ) ( not ( = ?auto_156842 ?auto_156846 ) ) ( not ( = ?auto_156842 ?auto_156847 ) ) ( not ( = ?auto_156842 ?auto_156848 ) ) ( not ( = ?auto_156843 ?auto_156844 ) ) ( not ( = ?auto_156843 ?auto_156845 ) ) ( not ( = ?auto_156843 ?auto_156846 ) ) ( not ( = ?auto_156843 ?auto_156847 ) ) ( not ( = ?auto_156843 ?auto_156848 ) ) ( not ( = ?auto_156844 ?auto_156845 ) ) ( not ( = ?auto_156844 ?auto_156846 ) ) ( not ( = ?auto_156844 ?auto_156847 ) ) ( not ( = ?auto_156844 ?auto_156848 ) ) ( not ( = ?auto_156845 ?auto_156846 ) ) ( not ( = ?auto_156845 ?auto_156847 ) ) ( not ( = ?auto_156845 ?auto_156848 ) ) ( not ( = ?auto_156846 ?auto_156847 ) ) ( not ( = ?auto_156846 ?auto_156848 ) ) ( not ( = ?auto_156847 ?auto_156848 ) ) ( ON ?auto_156846 ?auto_156847 ) ( ON ?auto_156845 ?auto_156846 ) ( ON ?auto_156844 ?auto_156845 ) ( ON ?auto_156843 ?auto_156844 ) ( ON ?auto_156842 ?auto_156843 ) ( ON ?auto_156841 ?auto_156842 ) ( ON ?auto_156840 ?auto_156841 ) ( ON ?auto_156839 ?auto_156840 ) ( CLEAR ?auto_156839 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_156839 )
      ( MAKE-9PILE ?auto_156839 ?auto_156840 ?auto_156841 ?auto_156842 ?auto_156843 ?auto_156844 ?auto_156845 ?auto_156846 ?auto_156847 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_156858 - BLOCK
      ?auto_156859 - BLOCK
      ?auto_156860 - BLOCK
      ?auto_156861 - BLOCK
      ?auto_156862 - BLOCK
      ?auto_156863 - BLOCK
      ?auto_156864 - BLOCK
      ?auto_156865 - BLOCK
      ?auto_156866 - BLOCK
    )
    :vars
    (
      ?auto_156867 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156866 ?auto_156867 ) ( not ( = ?auto_156858 ?auto_156859 ) ) ( not ( = ?auto_156858 ?auto_156860 ) ) ( not ( = ?auto_156858 ?auto_156861 ) ) ( not ( = ?auto_156858 ?auto_156862 ) ) ( not ( = ?auto_156858 ?auto_156863 ) ) ( not ( = ?auto_156858 ?auto_156864 ) ) ( not ( = ?auto_156858 ?auto_156865 ) ) ( not ( = ?auto_156858 ?auto_156866 ) ) ( not ( = ?auto_156858 ?auto_156867 ) ) ( not ( = ?auto_156859 ?auto_156860 ) ) ( not ( = ?auto_156859 ?auto_156861 ) ) ( not ( = ?auto_156859 ?auto_156862 ) ) ( not ( = ?auto_156859 ?auto_156863 ) ) ( not ( = ?auto_156859 ?auto_156864 ) ) ( not ( = ?auto_156859 ?auto_156865 ) ) ( not ( = ?auto_156859 ?auto_156866 ) ) ( not ( = ?auto_156859 ?auto_156867 ) ) ( not ( = ?auto_156860 ?auto_156861 ) ) ( not ( = ?auto_156860 ?auto_156862 ) ) ( not ( = ?auto_156860 ?auto_156863 ) ) ( not ( = ?auto_156860 ?auto_156864 ) ) ( not ( = ?auto_156860 ?auto_156865 ) ) ( not ( = ?auto_156860 ?auto_156866 ) ) ( not ( = ?auto_156860 ?auto_156867 ) ) ( not ( = ?auto_156861 ?auto_156862 ) ) ( not ( = ?auto_156861 ?auto_156863 ) ) ( not ( = ?auto_156861 ?auto_156864 ) ) ( not ( = ?auto_156861 ?auto_156865 ) ) ( not ( = ?auto_156861 ?auto_156866 ) ) ( not ( = ?auto_156861 ?auto_156867 ) ) ( not ( = ?auto_156862 ?auto_156863 ) ) ( not ( = ?auto_156862 ?auto_156864 ) ) ( not ( = ?auto_156862 ?auto_156865 ) ) ( not ( = ?auto_156862 ?auto_156866 ) ) ( not ( = ?auto_156862 ?auto_156867 ) ) ( not ( = ?auto_156863 ?auto_156864 ) ) ( not ( = ?auto_156863 ?auto_156865 ) ) ( not ( = ?auto_156863 ?auto_156866 ) ) ( not ( = ?auto_156863 ?auto_156867 ) ) ( not ( = ?auto_156864 ?auto_156865 ) ) ( not ( = ?auto_156864 ?auto_156866 ) ) ( not ( = ?auto_156864 ?auto_156867 ) ) ( not ( = ?auto_156865 ?auto_156866 ) ) ( not ( = ?auto_156865 ?auto_156867 ) ) ( not ( = ?auto_156866 ?auto_156867 ) ) ( ON ?auto_156865 ?auto_156866 ) ( ON ?auto_156864 ?auto_156865 ) ( ON ?auto_156863 ?auto_156864 ) ( ON ?auto_156862 ?auto_156863 ) ( ON ?auto_156861 ?auto_156862 ) ( ON ?auto_156860 ?auto_156861 ) ( ON ?auto_156859 ?auto_156860 ) ( ON ?auto_156858 ?auto_156859 ) ( CLEAR ?auto_156858 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_156858 )
      ( MAKE-9PILE ?auto_156858 ?auto_156859 ?auto_156860 ?auto_156861 ?auto_156862 ?auto_156863 ?auto_156864 ?auto_156865 ?auto_156866 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_156878 - BLOCK
      ?auto_156879 - BLOCK
      ?auto_156880 - BLOCK
      ?auto_156881 - BLOCK
      ?auto_156882 - BLOCK
      ?auto_156883 - BLOCK
      ?auto_156884 - BLOCK
      ?auto_156885 - BLOCK
      ?auto_156886 - BLOCK
      ?auto_156887 - BLOCK
    )
    :vars
    (
      ?auto_156888 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_156886 ) ( ON ?auto_156887 ?auto_156888 ) ( CLEAR ?auto_156887 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_156878 ) ( ON ?auto_156879 ?auto_156878 ) ( ON ?auto_156880 ?auto_156879 ) ( ON ?auto_156881 ?auto_156880 ) ( ON ?auto_156882 ?auto_156881 ) ( ON ?auto_156883 ?auto_156882 ) ( ON ?auto_156884 ?auto_156883 ) ( ON ?auto_156885 ?auto_156884 ) ( ON ?auto_156886 ?auto_156885 ) ( not ( = ?auto_156878 ?auto_156879 ) ) ( not ( = ?auto_156878 ?auto_156880 ) ) ( not ( = ?auto_156878 ?auto_156881 ) ) ( not ( = ?auto_156878 ?auto_156882 ) ) ( not ( = ?auto_156878 ?auto_156883 ) ) ( not ( = ?auto_156878 ?auto_156884 ) ) ( not ( = ?auto_156878 ?auto_156885 ) ) ( not ( = ?auto_156878 ?auto_156886 ) ) ( not ( = ?auto_156878 ?auto_156887 ) ) ( not ( = ?auto_156878 ?auto_156888 ) ) ( not ( = ?auto_156879 ?auto_156880 ) ) ( not ( = ?auto_156879 ?auto_156881 ) ) ( not ( = ?auto_156879 ?auto_156882 ) ) ( not ( = ?auto_156879 ?auto_156883 ) ) ( not ( = ?auto_156879 ?auto_156884 ) ) ( not ( = ?auto_156879 ?auto_156885 ) ) ( not ( = ?auto_156879 ?auto_156886 ) ) ( not ( = ?auto_156879 ?auto_156887 ) ) ( not ( = ?auto_156879 ?auto_156888 ) ) ( not ( = ?auto_156880 ?auto_156881 ) ) ( not ( = ?auto_156880 ?auto_156882 ) ) ( not ( = ?auto_156880 ?auto_156883 ) ) ( not ( = ?auto_156880 ?auto_156884 ) ) ( not ( = ?auto_156880 ?auto_156885 ) ) ( not ( = ?auto_156880 ?auto_156886 ) ) ( not ( = ?auto_156880 ?auto_156887 ) ) ( not ( = ?auto_156880 ?auto_156888 ) ) ( not ( = ?auto_156881 ?auto_156882 ) ) ( not ( = ?auto_156881 ?auto_156883 ) ) ( not ( = ?auto_156881 ?auto_156884 ) ) ( not ( = ?auto_156881 ?auto_156885 ) ) ( not ( = ?auto_156881 ?auto_156886 ) ) ( not ( = ?auto_156881 ?auto_156887 ) ) ( not ( = ?auto_156881 ?auto_156888 ) ) ( not ( = ?auto_156882 ?auto_156883 ) ) ( not ( = ?auto_156882 ?auto_156884 ) ) ( not ( = ?auto_156882 ?auto_156885 ) ) ( not ( = ?auto_156882 ?auto_156886 ) ) ( not ( = ?auto_156882 ?auto_156887 ) ) ( not ( = ?auto_156882 ?auto_156888 ) ) ( not ( = ?auto_156883 ?auto_156884 ) ) ( not ( = ?auto_156883 ?auto_156885 ) ) ( not ( = ?auto_156883 ?auto_156886 ) ) ( not ( = ?auto_156883 ?auto_156887 ) ) ( not ( = ?auto_156883 ?auto_156888 ) ) ( not ( = ?auto_156884 ?auto_156885 ) ) ( not ( = ?auto_156884 ?auto_156886 ) ) ( not ( = ?auto_156884 ?auto_156887 ) ) ( not ( = ?auto_156884 ?auto_156888 ) ) ( not ( = ?auto_156885 ?auto_156886 ) ) ( not ( = ?auto_156885 ?auto_156887 ) ) ( not ( = ?auto_156885 ?auto_156888 ) ) ( not ( = ?auto_156886 ?auto_156887 ) ) ( not ( = ?auto_156886 ?auto_156888 ) ) ( not ( = ?auto_156887 ?auto_156888 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_156887 ?auto_156888 )
      ( !STACK ?auto_156887 ?auto_156886 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_156899 - BLOCK
      ?auto_156900 - BLOCK
      ?auto_156901 - BLOCK
      ?auto_156902 - BLOCK
      ?auto_156903 - BLOCK
      ?auto_156904 - BLOCK
      ?auto_156905 - BLOCK
      ?auto_156906 - BLOCK
      ?auto_156907 - BLOCK
      ?auto_156908 - BLOCK
    )
    :vars
    (
      ?auto_156909 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_156907 ) ( ON ?auto_156908 ?auto_156909 ) ( CLEAR ?auto_156908 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_156899 ) ( ON ?auto_156900 ?auto_156899 ) ( ON ?auto_156901 ?auto_156900 ) ( ON ?auto_156902 ?auto_156901 ) ( ON ?auto_156903 ?auto_156902 ) ( ON ?auto_156904 ?auto_156903 ) ( ON ?auto_156905 ?auto_156904 ) ( ON ?auto_156906 ?auto_156905 ) ( ON ?auto_156907 ?auto_156906 ) ( not ( = ?auto_156899 ?auto_156900 ) ) ( not ( = ?auto_156899 ?auto_156901 ) ) ( not ( = ?auto_156899 ?auto_156902 ) ) ( not ( = ?auto_156899 ?auto_156903 ) ) ( not ( = ?auto_156899 ?auto_156904 ) ) ( not ( = ?auto_156899 ?auto_156905 ) ) ( not ( = ?auto_156899 ?auto_156906 ) ) ( not ( = ?auto_156899 ?auto_156907 ) ) ( not ( = ?auto_156899 ?auto_156908 ) ) ( not ( = ?auto_156899 ?auto_156909 ) ) ( not ( = ?auto_156900 ?auto_156901 ) ) ( not ( = ?auto_156900 ?auto_156902 ) ) ( not ( = ?auto_156900 ?auto_156903 ) ) ( not ( = ?auto_156900 ?auto_156904 ) ) ( not ( = ?auto_156900 ?auto_156905 ) ) ( not ( = ?auto_156900 ?auto_156906 ) ) ( not ( = ?auto_156900 ?auto_156907 ) ) ( not ( = ?auto_156900 ?auto_156908 ) ) ( not ( = ?auto_156900 ?auto_156909 ) ) ( not ( = ?auto_156901 ?auto_156902 ) ) ( not ( = ?auto_156901 ?auto_156903 ) ) ( not ( = ?auto_156901 ?auto_156904 ) ) ( not ( = ?auto_156901 ?auto_156905 ) ) ( not ( = ?auto_156901 ?auto_156906 ) ) ( not ( = ?auto_156901 ?auto_156907 ) ) ( not ( = ?auto_156901 ?auto_156908 ) ) ( not ( = ?auto_156901 ?auto_156909 ) ) ( not ( = ?auto_156902 ?auto_156903 ) ) ( not ( = ?auto_156902 ?auto_156904 ) ) ( not ( = ?auto_156902 ?auto_156905 ) ) ( not ( = ?auto_156902 ?auto_156906 ) ) ( not ( = ?auto_156902 ?auto_156907 ) ) ( not ( = ?auto_156902 ?auto_156908 ) ) ( not ( = ?auto_156902 ?auto_156909 ) ) ( not ( = ?auto_156903 ?auto_156904 ) ) ( not ( = ?auto_156903 ?auto_156905 ) ) ( not ( = ?auto_156903 ?auto_156906 ) ) ( not ( = ?auto_156903 ?auto_156907 ) ) ( not ( = ?auto_156903 ?auto_156908 ) ) ( not ( = ?auto_156903 ?auto_156909 ) ) ( not ( = ?auto_156904 ?auto_156905 ) ) ( not ( = ?auto_156904 ?auto_156906 ) ) ( not ( = ?auto_156904 ?auto_156907 ) ) ( not ( = ?auto_156904 ?auto_156908 ) ) ( not ( = ?auto_156904 ?auto_156909 ) ) ( not ( = ?auto_156905 ?auto_156906 ) ) ( not ( = ?auto_156905 ?auto_156907 ) ) ( not ( = ?auto_156905 ?auto_156908 ) ) ( not ( = ?auto_156905 ?auto_156909 ) ) ( not ( = ?auto_156906 ?auto_156907 ) ) ( not ( = ?auto_156906 ?auto_156908 ) ) ( not ( = ?auto_156906 ?auto_156909 ) ) ( not ( = ?auto_156907 ?auto_156908 ) ) ( not ( = ?auto_156907 ?auto_156909 ) ) ( not ( = ?auto_156908 ?auto_156909 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_156908 ?auto_156909 )
      ( !STACK ?auto_156908 ?auto_156907 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_156920 - BLOCK
      ?auto_156921 - BLOCK
      ?auto_156922 - BLOCK
      ?auto_156923 - BLOCK
      ?auto_156924 - BLOCK
      ?auto_156925 - BLOCK
      ?auto_156926 - BLOCK
      ?auto_156927 - BLOCK
      ?auto_156928 - BLOCK
      ?auto_156929 - BLOCK
    )
    :vars
    (
      ?auto_156930 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156929 ?auto_156930 ) ( ON-TABLE ?auto_156920 ) ( ON ?auto_156921 ?auto_156920 ) ( ON ?auto_156922 ?auto_156921 ) ( ON ?auto_156923 ?auto_156922 ) ( ON ?auto_156924 ?auto_156923 ) ( ON ?auto_156925 ?auto_156924 ) ( ON ?auto_156926 ?auto_156925 ) ( ON ?auto_156927 ?auto_156926 ) ( not ( = ?auto_156920 ?auto_156921 ) ) ( not ( = ?auto_156920 ?auto_156922 ) ) ( not ( = ?auto_156920 ?auto_156923 ) ) ( not ( = ?auto_156920 ?auto_156924 ) ) ( not ( = ?auto_156920 ?auto_156925 ) ) ( not ( = ?auto_156920 ?auto_156926 ) ) ( not ( = ?auto_156920 ?auto_156927 ) ) ( not ( = ?auto_156920 ?auto_156928 ) ) ( not ( = ?auto_156920 ?auto_156929 ) ) ( not ( = ?auto_156920 ?auto_156930 ) ) ( not ( = ?auto_156921 ?auto_156922 ) ) ( not ( = ?auto_156921 ?auto_156923 ) ) ( not ( = ?auto_156921 ?auto_156924 ) ) ( not ( = ?auto_156921 ?auto_156925 ) ) ( not ( = ?auto_156921 ?auto_156926 ) ) ( not ( = ?auto_156921 ?auto_156927 ) ) ( not ( = ?auto_156921 ?auto_156928 ) ) ( not ( = ?auto_156921 ?auto_156929 ) ) ( not ( = ?auto_156921 ?auto_156930 ) ) ( not ( = ?auto_156922 ?auto_156923 ) ) ( not ( = ?auto_156922 ?auto_156924 ) ) ( not ( = ?auto_156922 ?auto_156925 ) ) ( not ( = ?auto_156922 ?auto_156926 ) ) ( not ( = ?auto_156922 ?auto_156927 ) ) ( not ( = ?auto_156922 ?auto_156928 ) ) ( not ( = ?auto_156922 ?auto_156929 ) ) ( not ( = ?auto_156922 ?auto_156930 ) ) ( not ( = ?auto_156923 ?auto_156924 ) ) ( not ( = ?auto_156923 ?auto_156925 ) ) ( not ( = ?auto_156923 ?auto_156926 ) ) ( not ( = ?auto_156923 ?auto_156927 ) ) ( not ( = ?auto_156923 ?auto_156928 ) ) ( not ( = ?auto_156923 ?auto_156929 ) ) ( not ( = ?auto_156923 ?auto_156930 ) ) ( not ( = ?auto_156924 ?auto_156925 ) ) ( not ( = ?auto_156924 ?auto_156926 ) ) ( not ( = ?auto_156924 ?auto_156927 ) ) ( not ( = ?auto_156924 ?auto_156928 ) ) ( not ( = ?auto_156924 ?auto_156929 ) ) ( not ( = ?auto_156924 ?auto_156930 ) ) ( not ( = ?auto_156925 ?auto_156926 ) ) ( not ( = ?auto_156925 ?auto_156927 ) ) ( not ( = ?auto_156925 ?auto_156928 ) ) ( not ( = ?auto_156925 ?auto_156929 ) ) ( not ( = ?auto_156925 ?auto_156930 ) ) ( not ( = ?auto_156926 ?auto_156927 ) ) ( not ( = ?auto_156926 ?auto_156928 ) ) ( not ( = ?auto_156926 ?auto_156929 ) ) ( not ( = ?auto_156926 ?auto_156930 ) ) ( not ( = ?auto_156927 ?auto_156928 ) ) ( not ( = ?auto_156927 ?auto_156929 ) ) ( not ( = ?auto_156927 ?auto_156930 ) ) ( not ( = ?auto_156928 ?auto_156929 ) ) ( not ( = ?auto_156928 ?auto_156930 ) ) ( not ( = ?auto_156929 ?auto_156930 ) ) ( CLEAR ?auto_156927 ) ( ON ?auto_156928 ?auto_156929 ) ( CLEAR ?auto_156928 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_156920 ?auto_156921 ?auto_156922 ?auto_156923 ?auto_156924 ?auto_156925 ?auto_156926 ?auto_156927 ?auto_156928 )
      ( MAKE-10PILE ?auto_156920 ?auto_156921 ?auto_156922 ?auto_156923 ?auto_156924 ?auto_156925 ?auto_156926 ?auto_156927 ?auto_156928 ?auto_156929 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_156941 - BLOCK
      ?auto_156942 - BLOCK
      ?auto_156943 - BLOCK
      ?auto_156944 - BLOCK
      ?auto_156945 - BLOCK
      ?auto_156946 - BLOCK
      ?auto_156947 - BLOCK
      ?auto_156948 - BLOCK
      ?auto_156949 - BLOCK
      ?auto_156950 - BLOCK
    )
    :vars
    (
      ?auto_156951 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156950 ?auto_156951 ) ( ON-TABLE ?auto_156941 ) ( ON ?auto_156942 ?auto_156941 ) ( ON ?auto_156943 ?auto_156942 ) ( ON ?auto_156944 ?auto_156943 ) ( ON ?auto_156945 ?auto_156944 ) ( ON ?auto_156946 ?auto_156945 ) ( ON ?auto_156947 ?auto_156946 ) ( ON ?auto_156948 ?auto_156947 ) ( not ( = ?auto_156941 ?auto_156942 ) ) ( not ( = ?auto_156941 ?auto_156943 ) ) ( not ( = ?auto_156941 ?auto_156944 ) ) ( not ( = ?auto_156941 ?auto_156945 ) ) ( not ( = ?auto_156941 ?auto_156946 ) ) ( not ( = ?auto_156941 ?auto_156947 ) ) ( not ( = ?auto_156941 ?auto_156948 ) ) ( not ( = ?auto_156941 ?auto_156949 ) ) ( not ( = ?auto_156941 ?auto_156950 ) ) ( not ( = ?auto_156941 ?auto_156951 ) ) ( not ( = ?auto_156942 ?auto_156943 ) ) ( not ( = ?auto_156942 ?auto_156944 ) ) ( not ( = ?auto_156942 ?auto_156945 ) ) ( not ( = ?auto_156942 ?auto_156946 ) ) ( not ( = ?auto_156942 ?auto_156947 ) ) ( not ( = ?auto_156942 ?auto_156948 ) ) ( not ( = ?auto_156942 ?auto_156949 ) ) ( not ( = ?auto_156942 ?auto_156950 ) ) ( not ( = ?auto_156942 ?auto_156951 ) ) ( not ( = ?auto_156943 ?auto_156944 ) ) ( not ( = ?auto_156943 ?auto_156945 ) ) ( not ( = ?auto_156943 ?auto_156946 ) ) ( not ( = ?auto_156943 ?auto_156947 ) ) ( not ( = ?auto_156943 ?auto_156948 ) ) ( not ( = ?auto_156943 ?auto_156949 ) ) ( not ( = ?auto_156943 ?auto_156950 ) ) ( not ( = ?auto_156943 ?auto_156951 ) ) ( not ( = ?auto_156944 ?auto_156945 ) ) ( not ( = ?auto_156944 ?auto_156946 ) ) ( not ( = ?auto_156944 ?auto_156947 ) ) ( not ( = ?auto_156944 ?auto_156948 ) ) ( not ( = ?auto_156944 ?auto_156949 ) ) ( not ( = ?auto_156944 ?auto_156950 ) ) ( not ( = ?auto_156944 ?auto_156951 ) ) ( not ( = ?auto_156945 ?auto_156946 ) ) ( not ( = ?auto_156945 ?auto_156947 ) ) ( not ( = ?auto_156945 ?auto_156948 ) ) ( not ( = ?auto_156945 ?auto_156949 ) ) ( not ( = ?auto_156945 ?auto_156950 ) ) ( not ( = ?auto_156945 ?auto_156951 ) ) ( not ( = ?auto_156946 ?auto_156947 ) ) ( not ( = ?auto_156946 ?auto_156948 ) ) ( not ( = ?auto_156946 ?auto_156949 ) ) ( not ( = ?auto_156946 ?auto_156950 ) ) ( not ( = ?auto_156946 ?auto_156951 ) ) ( not ( = ?auto_156947 ?auto_156948 ) ) ( not ( = ?auto_156947 ?auto_156949 ) ) ( not ( = ?auto_156947 ?auto_156950 ) ) ( not ( = ?auto_156947 ?auto_156951 ) ) ( not ( = ?auto_156948 ?auto_156949 ) ) ( not ( = ?auto_156948 ?auto_156950 ) ) ( not ( = ?auto_156948 ?auto_156951 ) ) ( not ( = ?auto_156949 ?auto_156950 ) ) ( not ( = ?auto_156949 ?auto_156951 ) ) ( not ( = ?auto_156950 ?auto_156951 ) ) ( CLEAR ?auto_156948 ) ( ON ?auto_156949 ?auto_156950 ) ( CLEAR ?auto_156949 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_156941 ?auto_156942 ?auto_156943 ?auto_156944 ?auto_156945 ?auto_156946 ?auto_156947 ?auto_156948 ?auto_156949 )
      ( MAKE-10PILE ?auto_156941 ?auto_156942 ?auto_156943 ?auto_156944 ?auto_156945 ?auto_156946 ?auto_156947 ?auto_156948 ?auto_156949 ?auto_156950 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_156962 - BLOCK
      ?auto_156963 - BLOCK
      ?auto_156964 - BLOCK
      ?auto_156965 - BLOCK
      ?auto_156966 - BLOCK
      ?auto_156967 - BLOCK
      ?auto_156968 - BLOCK
      ?auto_156969 - BLOCK
      ?auto_156970 - BLOCK
      ?auto_156971 - BLOCK
    )
    :vars
    (
      ?auto_156972 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156971 ?auto_156972 ) ( ON-TABLE ?auto_156962 ) ( ON ?auto_156963 ?auto_156962 ) ( ON ?auto_156964 ?auto_156963 ) ( ON ?auto_156965 ?auto_156964 ) ( ON ?auto_156966 ?auto_156965 ) ( ON ?auto_156967 ?auto_156966 ) ( ON ?auto_156968 ?auto_156967 ) ( not ( = ?auto_156962 ?auto_156963 ) ) ( not ( = ?auto_156962 ?auto_156964 ) ) ( not ( = ?auto_156962 ?auto_156965 ) ) ( not ( = ?auto_156962 ?auto_156966 ) ) ( not ( = ?auto_156962 ?auto_156967 ) ) ( not ( = ?auto_156962 ?auto_156968 ) ) ( not ( = ?auto_156962 ?auto_156969 ) ) ( not ( = ?auto_156962 ?auto_156970 ) ) ( not ( = ?auto_156962 ?auto_156971 ) ) ( not ( = ?auto_156962 ?auto_156972 ) ) ( not ( = ?auto_156963 ?auto_156964 ) ) ( not ( = ?auto_156963 ?auto_156965 ) ) ( not ( = ?auto_156963 ?auto_156966 ) ) ( not ( = ?auto_156963 ?auto_156967 ) ) ( not ( = ?auto_156963 ?auto_156968 ) ) ( not ( = ?auto_156963 ?auto_156969 ) ) ( not ( = ?auto_156963 ?auto_156970 ) ) ( not ( = ?auto_156963 ?auto_156971 ) ) ( not ( = ?auto_156963 ?auto_156972 ) ) ( not ( = ?auto_156964 ?auto_156965 ) ) ( not ( = ?auto_156964 ?auto_156966 ) ) ( not ( = ?auto_156964 ?auto_156967 ) ) ( not ( = ?auto_156964 ?auto_156968 ) ) ( not ( = ?auto_156964 ?auto_156969 ) ) ( not ( = ?auto_156964 ?auto_156970 ) ) ( not ( = ?auto_156964 ?auto_156971 ) ) ( not ( = ?auto_156964 ?auto_156972 ) ) ( not ( = ?auto_156965 ?auto_156966 ) ) ( not ( = ?auto_156965 ?auto_156967 ) ) ( not ( = ?auto_156965 ?auto_156968 ) ) ( not ( = ?auto_156965 ?auto_156969 ) ) ( not ( = ?auto_156965 ?auto_156970 ) ) ( not ( = ?auto_156965 ?auto_156971 ) ) ( not ( = ?auto_156965 ?auto_156972 ) ) ( not ( = ?auto_156966 ?auto_156967 ) ) ( not ( = ?auto_156966 ?auto_156968 ) ) ( not ( = ?auto_156966 ?auto_156969 ) ) ( not ( = ?auto_156966 ?auto_156970 ) ) ( not ( = ?auto_156966 ?auto_156971 ) ) ( not ( = ?auto_156966 ?auto_156972 ) ) ( not ( = ?auto_156967 ?auto_156968 ) ) ( not ( = ?auto_156967 ?auto_156969 ) ) ( not ( = ?auto_156967 ?auto_156970 ) ) ( not ( = ?auto_156967 ?auto_156971 ) ) ( not ( = ?auto_156967 ?auto_156972 ) ) ( not ( = ?auto_156968 ?auto_156969 ) ) ( not ( = ?auto_156968 ?auto_156970 ) ) ( not ( = ?auto_156968 ?auto_156971 ) ) ( not ( = ?auto_156968 ?auto_156972 ) ) ( not ( = ?auto_156969 ?auto_156970 ) ) ( not ( = ?auto_156969 ?auto_156971 ) ) ( not ( = ?auto_156969 ?auto_156972 ) ) ( not ( = ?auto_156970 ?auto_156971 ) ) ( not ( = ?auto_156970 ?auto_156972 ) ) ( not ( = ?auto_156971 ?auto_156972 ) ) ( ON ?auto_156970 ?auto_156971 ) ( CLEAR ?auto_156968 ) ( ON ?auto_156969 ?auto_156970 ) ( CLEAR ?auto_156969 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_156962 ?auto_156963 ?auto_156964 ?auto_156965 ?auto_156966 ?auto_156967 ?auto_156968 ?auto_156969 )
      ( MAKE-10PILE ?auto_156962 ?auto_156963 ?auto_156964 ?auto_156965 ?auto_156966 ?auto_156967 ?auto_156968 ?auto_156969 ?auto_156970 ?auto_156971 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_156983 - BLOCK
      ?auto_156984 - BLOCK
      ?auto_156985 - BLOCK
      ?auto_156986 - BLOCK
      ?auto_156987 - BLOCK
      ?auto_156988 - BLOCK
      ?auto_156989 - BLOCK
      ?auto_156990 - BLOCK
      ?auto_156991 - BLOCK
      ?auto_156992 - BLOCK
    )
    :vars
    (
      ?auto_156993 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156992 ?auto_156993 ) ( ON-TABLE ?auto_156983 ) ( ON ?auto_156984 ?auto_156983 ) ( ON ?auto_156985 ?auto_156984 ) ( ON ?auto_156986 ?auto_156985 ) ( ON ?auto_156987 ?auto_156986 ) ( ON ?auto_156988 ?auto_156987 ) ( ON ?auto_156989 ?auto_156988 ) ( not ( = ?auto_156983 ?auto_156984 ) ) ( not ( = ?auto_156983 ?auto_156985 ) ) ( not ( = ?auto_156983 ?auto_156986 ) ) ( not ( = ?auto_156983 ?auto_156987 ) ) ( not ( = ?auto_156983 ?auto_156988 ) ) ( not ( = ?auto_156983 ?auto_156989 ) ) ( not ( = ?auto_156983 ?auto_156990 ) ) ( not ( = ?auto_156983 ?auto_156991 ) ) ( not ( = ?auto_156983 ?auto_156992 ) ) ( not ( = ?auto_156983 ?auto_156993 ) ) ( not ( = ?auto_156984 ?auto_156985 ) ) ( not ( = ?auto_156984 ?auto_156986 ) ) ( not ( = ?auto_156984 ?auto_156987 ) ) ( not ( = ?auto_156984 ?auto_156988 ) ) ( not ( = ?auto_156984 ?auto_156989 ) ) ( not ( = ?auto_156984 ?auto_156990 ) ) ( not ( = ?auto_156984 ?auto_156991 ) ) ( not ( = ?auto_156984 ?auto_156992 ) ) ( not ( = ?auto_156984 ?auto_156993 ) ) ( not ( = ?auto_156985 ?auto_156986 ) ) ( not ( = ?auto_156985 ?auto_156987 ) ) ( not ( = ?auto_156985 ?auto_156988 ) ) ( not ( = ?auto_156985 ?auto_156989 ) ) ( not ( = ?auto_156985 ?auto_156990 ) ) ( not ( = ?auto_156985 ?auto_156991 ) ) ( not ( = ?auto_156985 ?auto_156992 ) ) ( not ( = ?auto_156985 ?auto_156993 ) ) ( not ( = ?auto_156986 ?auto_156987 ) ) ( not ( = ?auto_156986 ?auto_156988 ) ) ( not ( = ?auto_156986 ?auto_156989 ) ) ( not ( = ?auto_156986 ?auto_156990 ) ) ( not ( = ?auto_156986 ?auto_156991 ) ) ( not ( = ?auto_156986 ?auto_156992 ) ) ( not ( = ?auto_156986 ?auto_156993 ) ) ( not ( = ?auto_156987 ?auto_156988 ) ) ( not ( = ?auto_156987 ?auto_156989 ) ) ( not ( = ?auto_156987 ?auto_156990 ) ) ( not ( = ?auto_156987 ?auto_156991 ) ) ( not ( = ?auto_156987 ?auto_156992 ) ) ( not ( = ?auto_156987 ?auto_156993 ) ) ( not ( = ?auto_156988 ?auto_156989 ) ) ( not ( = ?auto_156988 ?auto_156990 ) ) ( not ( = ?auto_156988 ?auto_156991 ) ) ( not ( = ?auto_156988 ?auto_156992 ) ) ( not ( = ?auto_156988 ?auto_156993 ) ) ( not ( = ?auto_156989 ?auto_156990 ) ) ( not ( = ?auto_156989 ?auto_156991 ) ) ( not ( = ?auto_156989 ?auto_156992 ) ) ( not ( = ?auto_156989 ?auto_156993 ) ) ( not ( = ?auto_156990 ?auto_156991 ) ) ( not ( = ?auto_156990 ?auto_156992 ) ) ( not ( = ?auto_156990 ?auto_156993 ) ) ( not ( = ?auto_156991 ?auto_156992 ) ) ( not ( = ?auto_156991 ?auto_156993 ) ) ( not ( = ?auto_156992 ?auto_156993 ) ) ( ON ?auto_156991 ?auto_156992 ) ( CLEAR ?auto_156989 ) ( ON ?auto_156990 ?auto_156991 ) ( CLEAR ?auto_156990 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_156983 ?auto_156984 ?auto_156985 ?auto_156986 ?auto_156987 ?auto_156988 ?auto_156989 ?auto_156990 )
      ( MAKE-10PILE ?auto_156983 ?auto_156984 ?auto_156985 ?auto_156986 ?auto_156987 ?auto_156988 ?auto_156989 ?auto_156990 ?auto_156991 ?auto_156992 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_157004 - BLOCK
      ?auto_157005 - BLOCK
      ?auto_157006 - BLOCK
      ?auto_157007 - BLOCK
      ?auto_157008 - BLOCK
      ?auto_157009 - BLOCK
      ?auto_157010 - BLOCK
      ?auto_157011 - BLOCK
      ?auto_157012 - BLOCK
      ?auto_157013 - BLOCK
    )
    :vars
    (
      ?auto_157014 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157013 ?auto_157014 ) ( ON-TABLE ?auto_157004 ) ( ON ?auto_157005 ?auto_157004 ) ( ON ?auto_157006 ?auto_157005 ) ( ON ?auto_157007 ?auto_157006 ) ( ON ?auto_157008 ?auto_157007 ) ( ON ?auto_157009 ?auto_157008 ) ( not ( = ?auto_157004 ?auto_157005 ) ) ( not ( = ?auto_157004 ?auto_157006 ) ) ( not ( = ?auto_157004 ?auto_157007 ) ) ( not ( = ?auto_157004 ?auto_157008 ) ) ( not ( = ?auto_157004 ?auto_157009 ) ) ( not ( = ?auto_157004 ?auto_157010 ) ) ( not ( = ?auto_157004 ?auto_157011 ) ) ( not ( = ?auto_157004 ?auto_157012 ) ) ( not ( = ?auto_157004 ?auto_157013 ) ) ( not ( = ?auto_157004 ?auto_157014 ) ) ( not ( = ?auto_157005 ?auto_157006 ) ) ( not ( = ?auto_157005 ?auto_157007 ) ) ( not ( = ?auto_157005 ?auto_157008 ) ) ( not ( = ?auto_157005 ?auto_157009 ) ) ( not ( = ?auto_157005 ?auto_157010 ) ) ( not ( = ?auto_157005 ?auto_157011 ) ) ( not ( = ?auto_157005 ?auto_157012 ) ) ( not ( = ?auto_157005 ?auto_157013 ) ) ( not ( = ?auto_157005 ?auto_157014 ) ) ( not ( = ?auto_157006 ?auto_157007 ) ) ( not ( = ?auto_157006 ?auto_157008 ) ) ( not ( = ?auto_157006 ?auto_157009 ) ) ( not ( = ?auto_157006 ?auto_157010 ) ) ( not ( = ?auto_157006 ?auto_157011 ) ) ( not ( = ?auto_157006 ?auto_157012 ) ) ( not ( = ?auto_157006 ?auto_157013 ) ) ( not ( = ?auto_157006 ?auto_157014 ) ) ( not ( = ?auto_157007 ?auto_157008 ) ) ( not ( = ?auto_157007 ?auto_157009 ) ) ( not ( = ?auto_157007 ?auto_157010 ) ) ( not ( = ?auto_157007 ?auto_157011 ) ) ( not ( = ?auto_157007 ?auto_157012 ) ) ( not ( = ?auto_157007 ?auto_157013 ) ) ( not ( = ?auto_157007 ?auto_157014 ) ) ( not ( = ?auto_157008 ?auto_157009 ) ) ( not ( = ?auto_157008 ?auto_157010 ) ) ( not ( = ?auto_157008 ?auto_157011 ) ) ( not ( = ?auto_157008 ?auto_157012 ) ) ( not ( = ?auto_157008 ?auto_157013 ) ) ( not ( = ?auto_157008 ?auto_157014 ) ) ( not ( = ?auto_157009 ?auto_157010 ) ) ( not ( = ?auto_157009 ?auto_157011 ) ) ( not ( = ?auto_157009 ?auto_157012 ) ) ( not ( = ?auto_157009 ?auto_157013 ) ) ( not ( = ?auto_157009 ?auto_157014 ) ) ( not ( = ?auto_157010 ?auto_157011 ) ) ( not ( = ?auto_157010 ?auto_157012 ) ) ( not ( = ?auto_157010 ?auto_157013 ) ) ( not ( = ?auto_157010 ?auto_157014 ) ) ( not ( = ?auto_157011 ?auto_157012 ) ) ( not ( = ?auto_157011 ?auto_157013 ) ) ( not ( = ?auto_157011 ?auto_157014 ) ) ( not ( = ?auto_157012 ?auto_157013 ) ) ( not ( = ?auto_157012 ?auto_157014 ) ) ( not ( = ?auto_157013 ?auto_157014 ) ) ( ON ?auto_157012 ?auto_157013 ) ( ON ?auto_157011 ?auto_157012 ) ( CLEAR ?auto_157009 ) ( ON ?auto_157010 ?auto_157011 ) ( CLEAR ?auto_157010 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_157004 ?auto_157005 ?auto_157006 ?auto_157007 ?auto_157008 ?auto_157009 ?auto_157010 )
      ( MAKE-10PILE ?auto_157004 ?auto_157005 ?auto_157006 ?auto_157007 ?auto_157008 ?auto_157009 ?auto_157010 ?auto_157011 ?auto_157012 ?auto_157013 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_157025 - BLOCK
      ?auto_157026 - BLOCK
      ?auto_157027 - BLOCK
      ?auto_157028 - BLOCK
      ?auto_157029 - BLOCK
      ?auto_157030 - BLOCK
      ?auto_157031 - BLOCK
      ?auto_157032 - BLOCK
      ?auto_157033 - BLOCK
      ?auto_157034 - BLOCK
    )
    :vars
    (
      ?auto_157035 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157034 ?auto_157035 ) ( ON-TABLE ?auto_157025 ) ( ON ?auto_157026 ?auto_157025 ) ( ON ?auto_157027 ?auto_157026 ) ( ON ?auto_157028 ?auto_157027 ) ( ON ?auto_157029 ?auto_157028 ) ( ON ?auto_157030 ?auto_157029 ) ( not ( = ?auto_157025 ?auto_157026 ) ) ( not ( = ?auto_157025 ?auto_157027 ) ) ( not ( = ?auto_157025 ?auto_157028 ) ) ( not ( = ?auto_157025 ?auto_157029 ) ) ( not ( = ?auto_157025 ?auto_157030 ) ) ( not ( = ?auto_157025 ?auto_157031 ) ) ( not ( = ?auto_157025 ?auto_157032 ) ) ( not ( = ?auto_157025 ?auto_157033 ) ) ( not ( = ?auto_157025 ?auto_157034 ) ) ( not ( = ?auto_157025 ?auto_157035 ) ) ( not ( = ?auto_157026 ?auto_157027 ) ) ( not ( = ?auto_157026 ?auto_157028 ) ) ( not ( = ?auto_157026 ?auto_157029 ) ) ( not ( = ?auto_157026 ?auto_157030 ) ) ( not ( = ?auto_157026 ?auto_157031 ) ) ( not ( = ?auto_157026 ?auto_157032 ) ) ( not ( = ?auto_157026 ?auto_157033 ) ) ( not ( = ?auto_157026 ?auto_157034 ) ) ( not ( = ?auto_157026 ?auto_157035 ) ) ( not ( = ?auto_157027 ?auto_157028 ) ) ( not ( = ?auto_157027 ?auto_157029 ) ) ( not ( = ?auto_157027 ?auto_157030 ) ) ( not ( = ?auto_157027 ?auto_157031 ) ) ( not ( = ?auto_157027 ?auto_157032 ) ) ( not ( = ?auto_157027 ?auto_157033 ) ) ( not ( = ?auto_157027 ?auto_157034 ) ) ( not ( = ?auto_157027 ?auto_157035 ) ) ( not ( = ?auto_157028 ?auto_157029 ) ) ( not ( = ?auto_157028 ?auto_157030 ) ) ( not ( = ?auto_157028 ?auto_157031 ) ) ( not ( = ?auto_157028 ?auto_157032 ) ) ( not ( = ?auto_157028 ?auto_157033 ) ) ( not ( = ?auto_157028 ?auto_157034 ) ) ( not ( = ?auto_157028 ?auto_157035 ) ) ( not ( = ?auto_157029 ?auto_157030 ) ) ( not ( = ?auto_157029 ?auto_157031 ) ) ( not ( = ?auto_157029 ?auto_157032 ) ) ( not ( = ?auto_157029 ?auto_157033 ) ) ( not ( = ?auto_157029 ?auto_157034 ) ) ( not ( = ?auto_157029 ?auto_157035 ) ) ( not ( = ?auto_157030 ?auto_157031 ) ) ( not ( = ?auto_157030 ?auto_157032 ) ) ( not ( = ?auto_157030 ?auto_157033 ) ) ( not ( = ?auto_157030 ?auto_157034 ) ) ( not ( = ?auto_157030 ?auto_157035 ) ) ( not ( = ?auto_157031 ?auto_157032 ) ) ( not ( = ?auto_157031 ?auto_157033 ) ) ( not ( = ?auto_157031 ?auto_157034 ) ) ( not ( = ?auto_157031 ?auto_157035 ) ) ( not ( = ?auto_157032 ?auto_157033 ) ) ( not ( = ?auto_157032 ?auto_157034 ) ) ( not ( = ?auto_157032 ?auto_157035 ) ) ( not ( = ?auto_157033 ?auto_157034 ) ) ( not ( = ?auto_157033 ?auto_157035 ) ) ( not ( = ?auto_157034 ?auto_157035 ) ) ( ON ?auto_157033 ?auto_157034 ) ( ON ?auto_157032 ?auto_157033 ) ( CLEAR ?auto_157030 ) ( ON ?auto_157031 ?auto_157032 ) ( CLEAR ?auto_157031 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_157025 ?auto_157026 ?auto_157027 ?auto_157028 ?auto_157029 ?auto_157030 ?auto_157031 )
      ( MAKE-10PILE ?auto_157025 ?auto_157026 ?auto_157027 ?auto_157028 ?auto_157029 ?auto_157030 ?auto_157031 ?auto_157032 ?auto_157033 ?auto_157034 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_157046 - BLOCK
      ?auto_157047 - BLOCK
      ?auto_157048 - BLOCK
      ?auto_157049 - BLOCK
      ?auto_157050 - BLOCK
      ?auto_157051 - BLOCK
      ?auto_157052 - BLOCK
      ?auto_157053 - BLOCK
      ?auto_157054 - BLOCK
      ?auto_157055 - BLOCK
    )
    :vars
    (
      ?auto_157056 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157055 ?auto_157056 ) ( ON-TABLE ?auto_157046 ) ( ON ?auto_157047 ?auto_157046 ) ( ON ?auto_157048 ?auto_157047 ) ( ON ?auto_157049 ?auto_157048 ) ( ON ?auto_157050 ?auto_157049 ) ( not ( = ?auto_157046 ?auto_157047 ) ) ( not ( = ?auto_157046 ?auto_157048 ) ) ( not ( = ?auto_157046 ?auto_157049 ) ) ( not ( = ?auto_157046 ?auto_157050 ) ) ( not ( = ?auto_157046 ?auto_157051 ) ) ( not ( = ?auto_157046 ?auto_157052 ) ) ( not ( = ?auto_157046 ?auto_157053 ) ) ( not ( = ?auto_157046 ?auto_157054 ) ) ( not ( = ?auto_157046 ?auto_157055 ) ) ( not ( = ?auto_157046 ?auto_157056 ) ) ( not ( = ?auto_157047 ?auto_157048 ) ) ( not ( = ?auto_157047 ?auto_157049 ) ) ( not ( = ?auto_157047 ?auto_157050 ) ) ( not ( = ?auto_157047 ?auto_157051 ) ) ( not ( = ?auto_157047 ?auto_157052 ) ) ( not ( = ?auto_157047 ?auto_157053 ) ) ( not ( = ?auto_157047 ?auto_157054 ) ) ( not ( = ?auto_157047 ?auto_157055 ) ) ( not ( = ?auto_157047 ?auto_157056 ) ) ( not ( = ?auto_157048 ?auto_157049 ) ) ( not ( = ?auto_157048 ?auto_157050 ) ) ( not ( = ?auto_157048 ?auto_157051 ) ) ( not ( = ?auto_157048 ?auto_157052 ) ) ( not ( = ?auto_157048 ?auto_157053 ) ) ( not ( = ?auto_157048 ?auto_157054 ) ) ( not ( = ?auto_157048 ?auto_157055 ) ) ( not ( = ?auto_157048 ?auto_157056 ) ) ( not ( = ?auto_157049 ?auto_157050 ) ) ( not ( = ?auto_157049 ?auto_157051 ) ) ( not ( = ?auto_157049 ?auto_157052 ) ) ( not ( = ?auto_157049 ?auto_157053 ) ) ( not ( = ?auto_157049 ?auto_157054 ) ) ( not ( = ?auto_157049 ?auto_157055 ) ) ( not ( = ?auto_157049 ?auto_157056 ) ) ( not ( = ?auto_157050 ?auto_157051 ) ) ( not ( = ?auto_157050 ?auto_157052 ) ) ( not ( = ?auto_157050 ?auto_157053 ) ) ( not ( = ?auto_157050 ?auto_157054 ) ) ( not ( = ?auto_157050 ?auto_157055 ) ) ( not ( = ?auto_157050 ?auto_157056 ) ) ( not ( = ?auto_157051 ?auto_157052 ) ) ( not ( = ?auto_157051 ?auto_157053 ) ) ( not ( = ?auto_157051 ?auto_157054 ) ) ( not ( = ?auto_157051 ?auto_157055 ) ) ( not ( = ?auto_157051 ?auto_157056 ) ) ( not ( = ?auto_157052 ?auto_157053 ) ) ( not ( = ?auto_157052 ?auto_157054 ) ) ( not ( = ?auto_157052 ?auto_157055 ) ) ( not ( = ?auto_157052 ?auto_157056 ) ) ( not ( = ?auto_157053 ?auto_157054 ) ) ( not ( = ?auto_157053 ?auto_157055 ) ) ( not ( = ?auto_157053 ?auto_157056 ) ) ( not ( = ?auto_157054 ?auto_157055 ) ) ( not ( = ?auto_157054 ?auto_157056 ) ) ( not ( = ?auto_157055 ?auto_157056 ) ) ( ON ?auto_157054 ?auto_157055 ) ( ON ?auto_157053 ?auto_157054 ) ( ON ?auto_157052 ?auto_157053 ) ( CLEAR ?auto_157050 ) ( ON ?auto_157051 ?auto_157052 ) ( CLEAR ?auto_157051 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_157046 ?auto_157047 ?auto_157048 ?auto_157049 ?auto_157050 ?auto_157051 )
      ( MAKE-10PILE ?auto_157046 ?auto_157047 ?auto_157048 ?auto_157049 ?auto_157050 ?auto_157051 ?auto_157052 ?auto_157053 ?auto_157054 ?auto_157055 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_157067 - BLOCK
      ?auto_157068 - BLOCK
      ?auto_157069 - BLOCK
      ?auto_157070 - BLOCK
      ?auto_157071 - BLOCK
      ?auto_157072 - BLOCK
      ?auto_157073 - BLOCK
      ?auto_157074 - BLOCK
      ?auto_157075 - BLOCK
      ?auto_157076 - BLOCK
    )
    :vars
    (
      ?auto_157077 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157076 ?auto_157077 ) ( ON-TABLE ?auto_157067 ) ( ON ?auto_157068 ?auto_157067 ) ( ON ?auto_157069 ?auto_157068 ) ( ON ?auto_157070 ?auto_157069 ) ( ON ?auto_157071 ?auto_157070 ) ( not ( = ?auto_157067 ?auto_157068 ) ) ( not ( = ?auto_157067 ?auto_157069 ) ) ( not ( = ?auto_157067 ?auto_157070 ) ) ( not ( = ?auto_157067 ?auto_157071 ) ) ( not ( = ?auto_157067 ?auto_157072 ) ) ( not ( = ?auto_157067 ?auto_157073 ) ) ( not ( = ?auto_157067 ?auto_157074 ) ) ( not ( = ?auto_157067 ?auto_157075 ) ) ( not ( = ?auto_157067 ?auto_157076 ) ) ( not ( = ?auto_157067 ?auto_157077 ) ) ( not ( = ?auto_157068 ?auto_157069 ) ) ( not ( = ?auto_157068 ?auto_157070 ) ) ( not ( = ?auto_157068 ?auto_157071 ) ) ( not ( = ?auto_157068 ?auto_157072 ) ) ( not ( = ?auto_157068 ?auto_157073 ) ) ( not ( = ?auto_157068 ?auto_157074 ) ) ( not ( = ?auto_157068 ?auto_157075 ) ) ( not ( = ?auto_157068 ?auto_157076 ) ) ( not ( = ?auto_157068 ?auto_157077 ) ) ( not ( = ?auto_157069 ?auto_157070 ) ) ( not ( = ?auto_157069 ?auto_157071 ) ) ( not ( = ?auto_157069 ?auto_157072 ) ) ( not ( = ?auto_157069 ?auto_157073 ) ) ( not ( = ?auto_157069 ?auto_157074 ) ) ( not ( = ?auto_157069 ?auto_157075 ) ) ( not ( = ?auto_157069 ?auto_157076 ) ) ( not ( = ?auto_157069 ?auto_157077 ) ) ( not ( = ?auto_157070 ?auto_157071 ) ) ( not ( = ?auto_157070 ?auto_157072 ) ) ( not ( = ?auto_157070 ?auto_157073 ) ) ( not ( = ?auto_157070 ?auto_157074 ) ) ( not ( = ?auto_157070 ?auto_157075 ) ) ( not ( = ?auto_157070 ?auto_157076 ) ) ( not ( = ?auto_157070 ?auto_157077 ) ) ( not ( = ?auto_157071 ?auto_157072 ) ) ( not ( = ?auto_157071 ?auto_157073 ) ) ( not ( = ?auto_157071 ?auto_157074 ) ) ( not ( = ?auto_157071 ?auto_157075 ) ) ( not ( = ?auto_157071 ?auto_157076 ) ) ( not ( = ?auto_157071 ?auto_157077 ) ) ( not ( = ?auto_157072 ?auto_157073 ) ) ( not ( = ?auto_157072 ?auto_157074 ) ) ( not ( = ?auto_157072 ?auto_157075 ) ) ( not ( = ?auto_157072 ?auto_157076 ) ) ( not ( = ?auto_157072 ?auto_157077 ) ) ( not ( = ?auto_157073 ?auto_157074 ) ) ( not ( = ?auto_157073 ?auto_157075 ) ) ( not ( = ?auto_157073 ?auto_157076 ) ) ( not ( = ?auto_157073 ?auto_157077 ) ) ( not ( = ?auto_157074 ?auto_157075 ) ) ( not ( = ?auto_157074 ?auto_157076 ) ) ( not ( = ?auto_157074 ?auto_157077 ) ) ( not ( = ?auto_157075 ?auto_157076 ) ) ( not ( = ?auto_157075 ?auto_157077 ) ) ( not ( = ?auto_157076 ?auto_157077 ) ) ( ON ?auto_157075 ?auto_157076 ) ( ON ?auto_157074 ?auto_157075 ) ( ON ?auto_157073 ?auto_157074 ) ( CLEAR ?auto_157071 ) ( ON ?auto_157072 ?auto_157073 ) ( CLEAR ?auto_157072 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_157067 ?auto_157068 ?auto_157069 ?auto_157070 ?auto_157071 ?auto_157072 )
      ( MAKE-10PILE ?auto_157067 ?auto_157068 ?auto_157069 ?auto_157070 ?auto_157071 ?auto_157072 ?auto_157073 ?auto_157074 ?auto_157075 ?auto_157076 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_157088 - BLOCK
      ?auto_157089 - BLOCK
      ?auto_157090 - BLOCK
      ?auto_157091 - BLOCK
      ?auto_157092 - BLOCK
      ?auto_157093 - BLOCK
      ?auto_157094 - BLOCK
      ?auto_157095 - BLOCK
      ?auto_157096 - BLOCK
      ?auto_157097 - BLOCK
    )
    :vars
    (
      ?auto_157098 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157097 ?auto_157098 ) ( ON-TABLE ?auto_157088 ) ( ON ?auto_157089 ?auto_157088 ) ( ON ?auto_157090 ?auto_157089 ) ( ON ?auto_157091 ?auto_157090 ) ( not ( = ?auto_157088 ?auto_157089 ) ) ( not ( = ?auto_157088 ?auto_157090 ) ) ( not ( = ?auto_157088 ?auto_157091 ) ) ( not ( = ?auto_157088 ?auto_157092 ) ) ( not ( = ?auto_157088 ?auto_157093 ) ) ( not ( = ?auto_157088 ?auto_157094 ) ) ( not ( = ?auto_157088 ?auto_157095 ) ) ( not ( = ?auto_157088 ?auto_157096 ) ) ( not ( = ?auto_157088 ?auto_157097 ) ) ( not ( = ?auto_157088 ?auto_157098 ) ) ( not ( = ?auto_157089 ?auto_157090 ) ) ( not ( = ?auto_157089 ?auto_157091 ) ) ( not ( = ?auto_157089 ?auto_157092 ) ) ( not ( = ?auto_157089 ?auto_157093 ) ) ( not ( = ?auto_157089 ?auto_157094 ) ) ( not ( = ?auto_157089 ?auto_157095 ) ) ( not ( = ?auto_157089 ?auto_157096 ) ) ( not ( = ?auto_157089 ?auto_157097 ) ) ( not ( = ?auto_157089 ?auto_157098 ) ) ( not ( = ?auto_157090 ?auto_157091 ) ) ( not ( = ?auto_157090 ?auto_157092 ) ) ( not ( = ?auto_157090 ?auto_157093 ) ) ( not ( = ?auto_157090 ?auto_157094 ) ) ( not ( = ?auto_157090 ?auto_157095 ) ) ( not ( = ?auto_157090 ?auto_157096 ) ) ( not ( = ?auto_157090 ?auto_157097 ) ) ( not ( = ?auto_157090 ?auto_157098 ) ) ( not ( = ?auto_157091 ?auto_157092 ) ) ( not ( = ?auto_157091 ?auto_157093 ) ) ( not ( = ?auto_157091 ?auto_157094 ) ) ( not ( = ?auto_157091 ?auto_157095 ) ) ( not ( = ?auto_157091 ?auto_157096 ) ) ( not ( = ?auto_157091 ?auto_157097 ) ) ( not ( = ?auto_157091 ?auto_157098 ) ) ( not ( = ?auto_157092 ?auto_157093 ) ) ( not ( = ?auto_157092 ?auto_157094 ) ) ( not ( = ?auto_157092 ?auto_157095 ) ) ( not ( = ?auto_157092 ?auto_157096 ) ) ( not ( = ?auto_157092 ?auto_157097 ) ) ( not ( = ?auto_157092 ?auto_157098 ) ) ( not ( = ?auto_157093 ?auto_157094 ) ) ( not ( = ?auto_157093 ?auto_157095 ) ) ( not ( = ?auto_157093 ?auto_157096 ) ) ( not ( = ?auto_157093 ?auto_157097 ) ) ( not ( = ?auto_157093 ?auto_157098 ) ) ( not ( = ?auto_157094 ?auto_157095 ) ) ( not ( = ?auto_157094 ?auto_157096 ) ) ( not ( = ?auto_157094 ?auto_157097 ) ) ( not ( = ?auto_157094 ?auto_157098 ) ) ( not ( = ?auto_157095 ?auto_157096 ) ) ( not ( = ?auto_157095 ?auto_157097 ) ) ( not ( = ?auto_157095 ?auto_157098 ) ) ( not ( = ?auto_157096 ?auto_157097 ) ) ( not ( = ?auto_157096 ?auto_157098 ) ) ( not ( = ?auto_157097 ?auto_157098 ) ) ( ON ?auto_157096 ?auto_157097 ) ( ON ?auto_157095 ?auto_157096 ) ( ON ?auto_157094 ?auto_157095 ) ( ON ?auto_157093 ?auto_157094 ) ( CLEAR ?auto_157091 ) ( ON ?auto_157092 ?auto_157093 ) ( CLEAR ?auto_157092 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_157088 ?auto_157089 ?auto_157090 ?auto_157091 ?auto_157092 )
      ( MAKE-10PILE ?auto_157088 ?auto_157089 ?auto_157090 ?auto_157091 ?auto_157092 ?auto_157093 ?auto_157094 ?auto_157095 ?auto_157096 ?auto_157097 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_157109 - BLOCK
      ?auto_157110 - BLOCK
      ?auto_157111 - BLOCK
      ?auto_157112 - BLOCK
      ?auto_157113 - BLOCK
      ?auto_157114 - BLOCK
      ?auto_157115 - BLOCK
      ?auto_157116 - BLOCK
      ?auto_157117 - BLOCK
      ?auto_157118 - BLOCK
    )
    :vars
    (
      ?auto_157119 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157118 ?auto_157119 ) ( ON-TABLE ?auto_157109 ) ( ON ?auto_157110 ?auto_157109 ) ( ON ?auto_157111 ?auto_157110 ) ( ON ?auto_157112 ?auto_157111 ) ( not ( = ?auto_157109 ?auto_157110 ) ) ( not ( = ?auto_157109 ?auto_157111 ) ) ( not ( = ?auto_157109 ?auto_157112 ) ) ( not ( = ?auto_157109 ?auto_157113 ) ) ( not ( = ?auto_157109 ?auto_157114 ) ) ( not ( = ?auto_157109 ?auto_157115 ) ) ( not ( = ?auto_157109 ?auto_157116 ) ) ( not ( = ?auto_157109 ?auto_157117 ) ) ( not ( = ?auto_157109 ?auto_157118 ) ) ( not ( = ?auto_157109 ?auto_157119 ) ) ( not ( = ?auto_157110 ?auto_157111 ) ) ( not ( = ?auto_157110 ?auto_157112 ) ) ( not ( = ?auto_157110 ?auto_157113 ) ) ( not ( = ?auto_157110 ?auto_157114 ) ) ( not ( = ?auto_157110 ?auto_157115 ) ) ( not ( = ?auto_157110 ?auto_157116 ) ) ( not ( = ?auto_157110 ?auto_157117 ) ) ( not ( = ?auto_157110 ?auto_157118 ) ) ( not ( = ?auto_157110 ?auto_157119 ) ) ( not ( = ?auto_157111 ?auto_157112 ) ) ( not ( = ?auto_157111 ?auto_157113 ) ) ( not ( = ?auto_157111 ?auto_157114 ) ) ( not ( = ?auto_157111 ?auto_157115 ) ) ( not ( = ?auto_157111 ?auto_157116 ) ) ( not ( = ?auto_157111 ?auto_157117 ) ) ( not ( = ?auto_157111 ?auto_157118 ) ) ( not ( = ?auto_157111 ?auto_157119 ) ) ( not ( = ?auto_157112 ?auto_157113 ) ) ( not ( = ?auto_157112 ?auto_157114 ) ) ( not ( = ?auto_157112 ?auto_157115 ) ) ( not ( = ?auto_157112 ?auto_157116 ) ) ( not ( = ?auto_157112 ?auto_157117 ) ) ( not ( = ?auto_157112 ?auto_157118 ) ) ( not ( = ?auto_157112 ?auto_157119 ) ) ( not ( = ?auto_157113 ?auto_157114 ) ) ( not ( = ?auto_157113 ?auto_157115 ) ) ( not ( = ?auto_157113 ?auto_157116 ) ) ( not ( = ?auto_157113 ?auto_157117 ) ) ( not ( = ?auto_157113 ?auto_157118 ) ) ( not ( = ?auto_157113 ?auto_157119 ) ) ( not ( = ?auto_157114 ?auto_157115 ) ) ( not ( = ?auto_157114 ?auto_157116 ) ) ( not ( = ?auto_157114 ?auto_157117 ) ) ( not ( = ?auto_157114 ?auto_157118 ) ) ( not ( = ?auto_157114 ?auto_157119 ) ) ( not ( = ?auto_157115 ?auto_157116 ) ) ( not ( = ?auto_157115 ?auto_157117 ) ) ( not ( = ?auto_157115 ?auto_157118 ) ) ( not ( = ?auto_157115 ?auto_157119 ) ) ( not ( = ?auto_157116 ?auto_157117 ) ) ( not ( = ?auto_157116 ?auto_157118 ) ) ( not ( = ?auto_157116 ?auto_157119 ) ) ( not ( = ?auto_157117 ?auto_157118 ) ) ( not ( = ?auto_157117 ?auto_157119 ) ) ( not ( = ?auto_157118 ?auto_157119 ) ) ( ON ?auto_157117 ?auto_157118 ) ( ON ?auto_157116 ?auto_157117 ) ( ON ?auto_157115 ?auto_157116 ) ( ON ?auto_157114 ?auto_157115 ) ( CLEAR ?auto_157112 ) ( ON ?auto_157113 ?auto_157114 ) ( CLEAR ?auto_157113 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_157109 ?auto_157110 ?auto_157111 ?auto_157112 ?auto_157113 )
      ( MAKE-10PILE ?auto_157109 ?auto_157110 ?auto_157111 ?auto_157112 ?auto_157113 ?auto_157114 ?auto_157115 ?auto_157116 ?auto_157117 ?auto_157118 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_157130 - BLOCK
      ?auto_157131 - BLOCK
      ?auto_157132 - BLOCK
      ?auto_157133 - BLOCK
      ?auto_157134 - BLOCK
      ?auto_157135 - BLOCK
      ?auto_157136 - BLOCK
      ?auto_157137 - BLOCK
      ?auto_157138 - BLOCK
      ?auto_157139 - BLOCK
    )
    :vars
    (
      ?auto_157140 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157139 ?auto_157140 ) ( ON-TABLE ?auto_157130 ) ( ON ?auto_157131 ?auto_157130 ) ( ON ?auto_157132 ?auto_157131 ) ( not ( = ?auto_157130 ?auto_157131 ) ) ( not ( = ?auto_157130 ?auto_157132 ) ) ( not ( = ?auto_157130 ?auto_157133 ) ) ( not ( = ?auto_157130 ?auto_157134 ) ) ( not ( = ?auto_157130 ?auto_157135 ) ) ( not ( = ?auto_157130 ?auto_157136 ) ) ( not ( = ?auto_157130 ?auto_157137 ) ) ( not ( = ?auto_157130 ?auto_157138 ) ) ( not ( = ?auto_157130 ?auto_157139 ) ) ( not ( = ?auto_157130 ?auto_157140 ) ) ( not ( = ?auto_157131 ?auto_157132 ) ) ( not ( = ?auto_157131 ?auto_157133 ) ) ( not ( = ?auto_157131 ?auto_157134 ) ) ( not ( = ?auto_157131 ?auto_157135 ) ) ( not ( = ?auto_157131 ?auto_157136 ) ) ( not ( = ?auto_157131 ?auto_157137 ) ) ( not ( = ?auto_157131 ?auto_157138 ) ) ( not ( = ?auto_157131 ?auto_157139 ) ) ( not ( = ?auto_157131 ?auto_157140 ) ) ( not ( = ?auto_157132 ?auto_157133 ) ) ( not ( = ?auto_157132 ?auto_157134 ) ) ( not ( = ?auto_157132 ?auto_157135 ) ) ( not ( = ?auto_157132 ?auto_157136 ) ) ( not ( = ?auto_157132 ?auto_157137 ) ) ( not ( = ?auto_157132 ?auto_157138 ) ) ( not ( = ?auto_157132 ?auto_157139 ) ) ( not ( = ?auto_157132 ?auto_157140 ) ) ( not ( = ?auto_157133 ?auto_157134 ) ) ( not ( = ?auto_157133 ?auto_157135 ) ) ( not ( = ?auto_157133 ?auto_157136 ) ) ( not ( = ?auto_157133 ?auto_157137 ) ) ( not ( = ?auto_157133 ?auto_157138 ) ) ( not ( = ?auto_157133 ?auto_157139 ) ) ( not ( = ?auto_157133 ?auto_157140 ) ) ( not ( = ?auto_157134 ?auto_157135 ) ) ( not ( = ?auto_157134 ?auto_157136 ) ) ( not ( = ?auto_157134 ?auto_157137 ) ) ( not ( = ?auto_157134 ?auto_157138 ) ) ( not ( = ?auto_157134 ?auto_157139 ) ) ( not ( = ?auto_157134 ?auto_157140 ) ) ( not ( = ?auto_157135 ?auto_157136 ) ) ( not ( = ?auto_157135 ?auto_157137 ) ) ( not ( = ?auto_157135 ?auto_157138 ) ) ( not ( = ?auto_157135 ?auto_157139 ) ) ( not ( = ?auto_157135 ?auto_157140 ) ) ( not ( = ?auto_157136 ?auto_157137 ) ) ( not ( = ?auto_157136 ?auto_157138 ) ) ( not ( = ?auto_157136 ?auto_157139 ) ) ( not ( = ?auto_157136 ?auto_157140 ) ) ( not ( = ?auto_157137 ?auto_157138 ) ) ( not ( = ?auto_157137 ?auto_157139 ) ) ( not ( = ?auto_157137 ?auto_157140 ) ) ( not ( = ?auto_157138 ?auto_157139 ) ) ( not ( = ?auto_157138 ?auto_157140 ) ) ( not ( = ?auto_157139 ?auto_157140 ) ) ( ON ?auto_157138 ?auto_157139 ) ( ON ?auto_157137 ?auto_157138 ) ( ON ?auto_157136 ?auto_157137 ) ( ON ?auto_157135 ?auto_157136 ) ( ON ?auto_157134 ?auto_157135 ) ( CLEAR ?auto_157132 ) ( ON ?auto_157133 ?auto_157134 ) ( CLEAR ?auto_157133 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_157130 ?auto_157131 ?auto_157132 ?auto_157133 )
      ( MAKE-10PILE ?auto_157130 ?auto_157131 ?auto_157132 ?auto_157133 ?auto_157134 ?auto_157135 ?auto_157136 ?auto_157137 ?auto_157138 ?auto_157139 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_157151 - BLOCK
      ?auto_157152 - BLOCK
      ?auto_157153 - BLOCK
      ?auto_157154 - BLOCK
      ?auto_157155 - BLOCK
      ?auto_157156 - BLOCK
      ?auto_157157 - BLOCK
      ?auto_157158 - BLOCK
      ?auto_157159 - BLOCK
      ?auto_157160 - BLOCK
    )
    :vars
    (
      ?auto_157161 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157160 ?auto_157161 ) ( ON-TABLE ?auto_157151 ) ( ON ?auto_157152 ?auto_157151 ) ( ON ?auto_157153 ?auto_157152 ) ( not ( = ?auto_157151 ?auto_157152 ) ) ( not ( = ?auto_157151 ?auto_157153 ) ) ( not ( = ?auto_157151 ?auto_157154 ) ) ( not ( = ?auto_157151 ?auto_157155 ) ) ( not ( = ?auto_157151 ?auto_157156 ) ) ( not ( = ?auto_157151 ?auto_157157 ) ) ( not ( = ?auto_157151 ?auto_157158 ) ) ( not ( = ?auto_157151 ?auto_157159 ) ) ( not ( = ?auto_157151 ?auto_157160 ) ) ( not ( = ?auto_157151 ?auto_157161 ) ) ( not ( = ?auto_157152 ?auto_157153 ) ) ( not ( = ?auto_157152 ?auto_157154 ) ) ( not ( = ?auto_157152 ?auto_157155 ) ) ( not ( = ?auto_157152 ?auto_157156 ) ) ( not ( = ?auto_157152 ?auto_157157 ) ) ( not ( = ?auto_157152 ?auto_157158 ) ) ( not ( = ?auto_157152 ?auto_157159 ) ) ( not ( = ?auto_157152 ?auto_157160 ) ) ( not ( = ?auto_157152 ?auto_157161 ) ) ( not ( = ?auto_157153 ?auto_157154 ) ) ( not ( = ?auto_157153 ?auto_157155 ) ) ( not ( = ?auto_157153 ?auto_157156 ) ) ( not ( = ?auto_157153 ?auto_157157 ) ) ( not ( = ?auto_157153 ?auto_157158 ) ) ( not ( = ?auto_157153 ?auto_157159 ) ) ( not ( = ?auto_157153 ?auto_157160 ) ) ( not ( = ?auto_157153 ?auto_157161 ) ) ( not ( = ?auto_157154 ?auto_157155 ) ) ( not ( = ?auto_157154 ?auto_157156 ) ) ( not ( = ?auto_157154 ?auto_157157 ) ) ( not ( = ?auto_157154 ?auto_157158 ) ) ( not ( = ?auto_157154 ?auto_157159 ) ) ( not ( = ?auto_157154 ?auto_157160 ) ) ( not ( = ?auto_157154 ?auto_157161 ) ) ( not ( = ?auto_157155 ?auto_157156 ) ) ( not ( = ?auto_157155 ?auto_157157 ) ) ( not ( = ?auto_157155 ?auto_157158 ) ) ( not ( = ?auto_157155 ?auto_157159 ) ) ( not ( = ?auto_157155 ?auto_157160 ) ) ( not ( = ?auto_157155 ?auto_157161 ) ) ( not ( = ?auto_157156 ?auto_157157 ) ) ( not ( = ?auto_157156 ?auto_157158 ) ) ( not ( = ?auto_157156 ?auto_157159 ) ) ( not ( = ?auto_157156 ?auto_157160 ) ) ( not ( = ?auto_157156 ?auto_157161 ) ) ( not ( = ?auto_157157 ?auto_157158 ) ) ( not ( = ?auto_157157 ?auto_157159 ) ) ( not ( = ?auto_157157 ?auto_157160 ) ) ( not ( = ?auto_157157 ?auto_157161 ) ) ( not ( = ?auto_157158 ?auto_157159 ) ) ( not ( = ?auto_157158 ?auto_157160 ) ) ( not ( = ?auto_157158 ?auto_157161 ) ) ( not ( = ?auto_157159 ?auto_157160 ) ) ( not ( = ?auto_157159 ?auto_157161 ) ) ( not ( = ?auto_157160 ?auto_157161 ) ) ( ON ?auto_157159 ?auto_157160 ) ( ON ?auto_157158 ?auto_157159 ) ( ON ?auto_157157 ?auto_157158 ) ( ON ?auto_157156 ?auto_157157 ) ( ON ?auto_157155 ?auto_157156 ) ( CLEAR ?auto_157153 ) ( ON ?auto_157154 ?auto_157155 ) ( CLEAR ?auto_157154 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_157151 ?auto_157152 ?auto_157153 ?auto_157154 )
      ( MAKE-10PILE ?auto_157151 ?auto_157152 ?auto_157153 ?auto_157154 ?auto_157155 ?auto_157156 ?auto_157157 ?auto_157158 ?auto_157159 ?auto_157160 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_157172 - BLOCK
      ?auto_157173 - BLOCK
      ?auto_157174 - BLOCK
      ?auto_157175 - BLOCK
      ?auto_157176 - BLOCK
      ?auto_157177 - BLOCK
      ?auto_157178 - BLOCK
      ?auto_157179 - BLOCK
      ?auto_157180 - BLOCK
      ?auto_157181 - BLOCK
    )
    :vars
    (
      ?auto_157182 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157181 ?auto_157182 ) ( ON-TABLE ?auto_157172 ) ( ON ?auto_157173 ?auto_157172 ) ( not ( = ?auto_157172 ?auto_157173 ) ) ( not ( = ?auto_157172 ?auto_157174 ) ) ( not ( = ?auto_157172 ?auto_157175 ) ) ( not ( = ?auto_157172 ?auto_157176 ) ) ( not ( = ?auto_157172 ?auto_157177 ) ) ( not ( = ?auto_157172 ?auto_157178 ) ) ( not ( = ?auto_157172 ?auto_157179 ) ) ( not ( = ?auto_157172 ?auto_157180 ) ) ( not ( = ?auto_157172 ?auto_157181 ) ) ( not ( = ?auto_157172 ?auto_157182 ) ) ( not ( = ?auto_157173 ?auto_157174 ) ) ( not ( = ?auto_157173 ?auto_157175 ) ) ( not ( = ?auto_157173 ?auto_157176 ) ) ( not ( = ?auto_157173 ?auto_157177 ) ) ( not ( = ?auto_157173 ?auto_157178 ) ) ( not ( = ?auto_157173 ?auto_157179 ) ) ( not ( = ?auto_157173 ?auto_157180 ) ) ( not ( = ?auto_157173 ?auto_157181 ) ) ( not ( = ?auto_157173 ?auto_157182 ) ) ( not ( = ?auto_157174 ?auto_157175 ) ) ( not ( = ?auto_157174 ?auto_157176 ) ) ( not ( = ?auto_157174 ?auto_157177 ) ) ( not ( = ?auto_157174 ?auto_157178 ) ) ( not ( = ?auto_157174 ?auto_157179 ) ) ( not ( = ?auto_157174 ?auto_157180 ) ) ( not ( = ?auto_157174 ?auto_157181 ) ) ( not ( = ?auto_157174 ?auto_157182 ) ) ( not ( = ?auto_157175 ?auto_157176 ) ) ( not ( = ?auto_157175 ?auto_157177 ) ) ( not ( = ?auto_157175 ?auto_157178 ) ) ( not ( = ?auto_157175 ?auto_157179 ) ) ( not ( = ?auto_157175 ?auto_157180 ) ) ( not ( = ?auto_157175 ?auto_157181 ) ) ( not ( = ?auto_157175 ?auto_157182 ) ) ( not ( = ?auto_157176 ?auto_157177 ) ) ( not ( = ?auto_157176 ?auto_157178 ) ) ( not ( = ?auto_157176 ?auto_157179 ) ) ( not ( = ?auto_157176 ?auto_157180 ) ) ( not ( = ?auto_157176 ?auto_157181 ) ) ( not ( = ?auto_157176 ?auto_157182 ) ) ( not ( = ?auto_157177 ?auto_157178 ) ) ( not ( = ?auto_157177 ?auto_157179 ) ) ( not ( = ?auto_157177 ?auto_157180 ) ) ( not ( = ?auto_157177 ?auto_157181 ) ) ( not ( = ?auto_157177 ?auto_157182 ) ) ( not ( = ?auto_157178 ?auto_157179 ) ) ( not ( = ?auto_157178 ?auto_157180 ) ) ( not ( = ?auto_157178 ?auto_157181 ) ) ( not ( = ?auto_157178 ?auto_157182 ) ) ( not ( = ?auto_157179 ?auto_157180 ) ) ( not ( = ?auto_157179 ?auto_157181 ) ) ( not ( = ?auto_157179 ?auto_157182 ) ) ( not ( = ?auto_157180 ?auto_157181 ) ) ( not ( = ?auto_157180 ?auto_157182 ) ) ( not ( = ?auto_157181 ?auto_157182 ) ) ( ON ?auto_157180 ?auto_157181 ) ( ON ?auto_157179 ?auto_157180 ) ( ON ?auto_157178 ?auto_157179 ) ( ON ?auto_157177 ?auto_157178 ) ( ON ?auto_157176 ?auto_157177 ) ( ON ?auto_157175 ?auto_157176 ) ( CLEAR ?auto_157173 ) ( ON ?auto_157174 ?auto_157175 ) ( CLEAR ?auto_157174 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_157172 ?auto_157173 ?auto_157174 )
      ( MAKE-10PILE ?auto_157172 ?auto_157173 ?auto_157174 ?auto_157175 ?auto_157176 ?auto_157177 ?auto_157178 ?auto_157179 ?auto_157180 ?auto_157181 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_157193 - BLOCK
      ?auto_157194 - BLOCK
      ?auto_157195 - BLOCK
      ?auto_157196 - BLOCK
      ?auto_157197 - BLOCK
      ?auto_157198 - BLOCK
      ?auto_157199 - BLOCK
      ?auto_157200 - BLOCK
      ?auto_157201 - BLOCK
      ?auto_157202 - BLOCK
    )
    :vars
    (
      ?auto_157203 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157202 ?auto_157203 ) ( ON-TABLE ?auto_157193 ) ( ON ?auto_157194 ?auto_157193 ) ( not ( = ?auto_157193 ?auto_157194 ) ) ( not ( = ?auto_157193 ?auto_157195 ) ) ( not ( = ?auto_157193 ?auto_157196 ) ) ( not ( = ?auto_157193 ?auto_157197 ) ) ( not ( = ?auto_157193 ?auto_157198 ) ) ( not ( = ?auto_157193 ?auto_157199 ) ) ( not ( = ?auto_157193 ?auto_157200 ) ) ( not ( = ?auto_157193 ?auto_157201 ) ) ( not ( = ?auto_157193 ?auto_157202 ) ) ( not ( = ?auto_157193 ?auto_157203 ) ) ( not ( = ?auto_157194 ?auto_157195 ) ) ( not ( = ?auto_157194 ?auto_157196 ) ) ( not ( = ?auto_157194 ?auto_157197 ) ) ( not ( = ?auto_157194 ?auto_157198 ) ) ( not ( = ?auto_157194 ?auto_157199 ) ) ( not ( = ?auto_157194 ?auto_157200 ) ) ( not ( = ?auto_157194 ?auto_157201 ) ) ( not ( = ?auto_157194 ?auto_157202 ) ) ( not ( = ?auto_157194 ?auto_157203 ) ) ( not ( = ?auto_157195 ?auto_157196 ) ) ( not ( = ?auto_157195 ?auto_157197 ) ) ( not ( = ?auto_157195 ?auto_157198 ) ) ( not ( = ?auto_157195 ?auto_157199 ) ) ( not ( = ?auto_157195 ?auto_157200 ) ) ( not ( = ?auto_157195 ?auto_157201 ) ) ( not ( = ?auto_157195 ?auto_157202 ) ) ( not ( = ?auto_157195 ?auto_157203 ) ) ( not ( = ?auto_157196 ?auto_157197 ) ) ( not ( = ?auto_157196 ?auto_157198 ) ) ( not ( = ?auto_157196 ?auto_157199 ) ) ( not ( = ?auto_157196 ?auto_157200 ) ) ( not ( = ?auto_157196 ?auto_157201 ) ) ( not ( = ?auto_157196 ?auto_157202 ) ) ( not ( = ?auto_157196 ?auto_157203 ) ) ( not ( = ?auto_157197 ?auto_157198 ) ) ( not ( = ?auto_157197 ?auto_157199 ) ) ( not ( = ?auto_157197 ?auto_157200 ) ) ( not ( = ?auto_157197 ?auto_157201 ) ) ( not ( = ?auto_157197 ?auto_157202 ) ) ( not ( = ?auto_157197 ?auto_157203 ) ) ( not ( = ?auto_157198 ?auto_157199 ) ) ( not ( = ?auto_157198 ?auto_157200 ) ) ( not ( = ?auto_157198 ?auto_157201 ) ) ( not ( = ?auto_157198 ?auto_157202 ) ) ( not ( = ?auto_157198 ?auto_157203 ) ) ( not ( = ?auto_157199 ?auto_157200 ) ) ( not ( = ?auto_157199 ?auto_157201 ) ) ( not ( = ?auto_157199 ?auto_157202 ) ) ( not ( = ?auto_157199 ?auto_157203 ) ) ( not ( = ?auto_157200 ?auto_157201 ) ) ( not ( = ?auto_157200 ?auto_157202 ) ) ( not ( = ?auto_157200 ?auto_157203 ) ) ( not ( = ?auto_157201 ?auto_157202 ) ) ( not ( = ?auto_157201 ?auto_157203 ) ) ( not ( = ?auto_157202 ?auto_157203 ) ) ( ON ?auto_157201 ?auto_157202 ) ( ON ?auto_157200 ?auto_157201 ) ( ON ?auto_157199 ?auto_157200 ) ( ON ?auto_157198 ?auto_157199 ) ( ON ?auto_157197 ?auto_157198 ) ( ON ?auto_157196 ?auto_157197 ) ( CLEAR ?auto_157194 ) ( ON ?auto_157195 ?auto_157196 ) ( CLEAR ?auto_157195 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_157193 ?auto_157194 ?auto_157195 )
      ( MAKE-10PILE ?auto_157193 ?auto_157194 ?auto_157195 ?auto_157196 ?auto_157197 ?auto_157198 ?auto_157199 ?auto_157200 ?auto_157201 ?auto_157202 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_157214 - BLOCK
      ?auto_157215 - BLOCK
      ?auto_157216 - BLOCK
      ?auto_157217 - BLOCK
      ?auto_157218 - BLOCK
      ?auto_157219 - BLOCK
      ?auto_157220 - BLOCK
      ?auto_157221 - BLOCK
      ?auto_157222 - BLOCK
      ?auto_157223 - BLOCK
    )
    :vars
    (
      ?auto_157224 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157223 ?auto_157224 ) ( ON-TABLE ?auto_157214 ) ( not ( = ?auto_157214 ?auto_157215 ) ) ( not ( = ?auto_157214 ?auto_157216 ) ) ( not ( = ?auto_157214 ?auto_157217 ) ) ( not ( = ?auto_157214 ?auto_157218 ) ) ( not ( = ?auto_157214 ?auto_157219 ) ) ( not ( = ?auto_157214 ?auto_157220 ) ) ( not ( = ?auto_157214 ?auto_157221 ) ) ( not ( = ?auto_157214 ?auto_157222 ) ) ( not ( = ?auto_157214 ?auto_157223 ) ) ( not ( = ?auto_157214 ?auto_157224 ) ) ( not ( = ?auto_157215 ?auto_157216 ) ) ( not ( = ?auto_157215 ?auto_157217 ) ) ( not ( = ?auto_157215 ?auto_157218 ) ) ( not ( = ?auto_157215 ?auto_157219 ) ) ( not ( = ?auto_157215 ?auto_157220 ) ) ( not ( = ?auto_157215 ?auto_157221 ) ) ( not ( = ?auto_157215 ?auto_157222 ) ) ( not ( = ?auto_157215 ?auto_157223 ) ) ( not ( = ?auto_157215 ?auto_157224 ) ) ( not ( = ?auto_157216 ?auto_157217 ) ) ( not ( = ?auto_157216 ?auto_157218 ) ) ( not ( = ?auto_157216 ?auto_157219 ) ) ( not ( = ?auto_157216 ?auto_157220 ) ) ( not ( = ?auto_157216 ?auto_157221 ) ) ( not ( = ?auto_157216 ?auto_157222 ) ) ( not ( = ?auto_157216 ?auto_157223 ) ) ( not ( = ?auto_157216 ?auto_157224 ) ) ( not ( = ?auto_157217 ?auto_157218 ) ) ( not ( = ?auto_157217 ?auto_157219 ) ) ( not ( = ?auto_157217 ?auto_157220 ) ) ( not ( = ?auto_157217 ?auto_157221 ) ) ( not ( = ?auto_157217 ?auto_157222 ) ) ( not ( = ?auto_157217 ?auto_157223 ) ) ( not ( = ?auto_157217 ?auto_157224 ) ) ( not ( = ?auto_157218 ?auto_157219 ) ) ( not ( = ?auto_157218 ?auto_157220 ) ) ( not ( = ?auto_157218 ?auto_157221 ) ) ( not ( = ?auto_157218 ?auto_157222 ) ) ( not ( = ?auto_157218 ?auto_157223 ) ) ( not ( = ?auto_157218 ?auto_157224 ) ) ( not ( = ?auto_157219 ?auto_157220 ) ) ( not ( = ?auto_157219 ?auto_157221 ) ) ( not ( = ?auto_157219 ?auto_157222 ) ) ( not ( = ?auto_157219 ?auto_157223 ) ) ( not ( = ?auto_157219 ?auto_157224 ) ) ( not ( = ?auto_157220 ?auto_157221 ) ) ( not ( = ?auto_157220 ?auto_157222 ) ) ( not ( = ?auto_157220 ?auto_157223 ) ) ( not ( = ?auto_157220 ?auto_157224 ) ) ( not ( = ?auto_157221 ?auto_157222 ) ) ( not ( = ?auto_157221 ?auto_157223 ) ) ( not ( = ?auto_157221 ?auto_157224 ) ) ( not ( = ?auto_157222 ?auto_157223 ) ) ( not ( = ?auto_157222 ?auto_157224 ) ) ( not ( = ?auto_157223 ?auto_157224 ) ) ( ON ?auto_157222 ?auto_157223 ) ( ON ?auto_157221 ?auto_157222 ) ( ON ?auto_157220 ?auto_157221 ) ( ON ?auto_157219 ?auto_157220 ) ( ON ?auto_157218 ?auto_157219 ) ( ON ?auto_157217 ?auto_157218 ) ( ON ?auto_157216 ?auto_157217 ) ( CLEAR ?auto_157214 ) ( ON ?auto_157215 ?auto_157216 ) ( CLEAR ?auto_157215 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_157214 ?auto_157215 )
      ( MAKE-10PILE ?auto_157214 ?auto_157215 ?auto_157216 ?auto_157217 ?auto_157218 ?auto_157219 ?auto_157220 ?auto_157221 ?auto_157222 ?auto_157223 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_157235 - BLOCK
      ?auto_157236 - BLOCK
      ?auto_157237 - BLOCK
      ?auto_157238 - BLOCK
      ?auto_157239 - BLOCK
      ?auto_157240 - BLOCK
      ?auto_157241 - BLOCK
      ?auto_157242 - BLOCK
      ?auto_157243 - BLOCK
      ?auto_157244 - BLOCK
    )
    :vars
    (
      ?auto_157245 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157244 ?auto_157245 ) ( ON-TABLE ?auto_157235 ) ( not ( = ?auto_157235 ?auto_157236 ) ) ( not ( = ?auto_157235 ?auto_157237 ) ) ( not ( = ?auto_157235 ?auto_157238 ) ) ( not ( = ?auto_157235 ?auto_157239 ) ) ( not ( = ?auto_157235 ?auto_157240 ) ) ( not ( = ?auto_157235 ?auto_157241 ) ) ( not ( = ?auto_157235 ?auto_157242 ) ) ( not ( = ?auto_157235 ?auto_157243 ) ) ( not ( = ?auto_157235 ?auto_157244 ) ) ( not ( = ?auto_157235 ?auto_157245 ) ) ( not ( = ?auto_157236 ?auto_157237 ) ) ( not ( = ?auto_157236 ?auto_157238 ) ) ( not ( = ?auto_157236 ?auto_157239 ) ) ( not ( = ?auto_157236 ?auto_157240 ) ) ( not ( = ?auto_157236 ?auto_157241 ) ) ( not ( = ?auto_157236 ?auto_157242 ) ) ( not ( = ?auto_157236 ?auto_157243 ) ) ( not ( = ?auto_157236 ?auto_157244 ) ) ( not ( = ?auto_157236 ?auto_157245 ) ) ( not ( = ?auto_157237 ?auto_157238 ) ) ( not ( = ?auto_157237 ?auto_157239 ) ) ( not ( = ?auto_157237 ?auto_157240 ) ) ( not ( = ?auto_157237 ?auto_157241 ) ) ( not ( = ?auto_157237 ?auto_157242 ) ) ( not ( = ?auto_157237 ?auto_157243 ) ) ( not ( = ?auto_157237 ?auto_157244 ) ) ( not ( = ?auto_157237 ?auto_157245 ) ) ( not ( = ?auto_157238 ?auto_157239 ) ) ( not ( = ?auto_157238 ?auto_157240 ) ) ( not ( = ?auto_157238 ?auto_157241 ) ) ( not ( = ?auto_157238 ?auto_157242 ) ) ( not ( = ?auto_157238 ?auto_157243 ) ) ( not ( = ?auto_157238 ?auto_157244 ) ) ( not ( = ?auto_157238 ?auto_157245 ) ) ( not ( = ?auto_157239 ?auto_157240 ) ) ( not ( = ?auto_157239 ?auto_157241 ) ) ( not ( = ?auto_157239 ?auto_157242 ) ) ( not ( = ?auto_157239 ?auto_157243 ) ) ( not ( = ?auto_157239 ?auto_157244 ) ) ( not ( = ?auto_157239 ?auto_157245 ) ) ( not ( = ?auto_157240 ?auto_157241 ) ) ( not ( = ?auto_157240 ?auto_157242 ) ) ( not ( = ?auto_157240 ?auto_157243 ) ) ( not ( = ?auto_157240 ?auto_157244 ) ) ( not ( = ?auto_157240 ?auto_157245 ) ) ( not ( = ?auto_157241 ?auto_157242 ) ) ( not ( = ?auto_157241 ?auto_157243 ) ) ( not ( = ?auto_157241 ?auto_157244 ) ) ( not ( = ?auto_157241 ?auto_157245 ) ) ( not ( = ?auto_157242 ?auto_157243 ) ) ( not ( = ?auto_157242 ?auto_157244 ) ) ( not ( = ?auto_157242 ?auto_157245 ) ) ( not ( = ?auto_157243 ?auto_157244 ) ) ( not ( = ?auto_157243 ?auto_157245 ) ) ( not ( = ?auto_157244 ?auto_157245 ) ) ( ON ?auto_157243 ?auto_157244 ) ( ON ?auto_157242 ?auto_157243 ) ( ON ?auto_157241 ?auto_157242 ) ( ON ?auto_157240 ?auto_157241 ) ( ON ?auto_157239 ?auto_157240 ) ( ON ?auto_157238 ?auto_157239 ) ( ON ?auto_157237 ?auto_157238 ) ( CLEAR ?auto_157235 ) ( ON ?auto_157236 ?auto_157237 ) ( CLEAR ?auto_157236 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_157235 ?auto_157236 )
      ( MAKE-10PILE ?auto_157235 ?auto_157236 ?auto_157237 ?auto_157238 ?auto_157239 ?auto_157240 ?auto_157241 ?auto_157242 ?auto_157243 ?auto_157244 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_157256 - BLOCK
      ?auto_157257 - BLOCK
      ?auto_157258 - BLOCK
      ?auto_157259 - BLOCK
      ?auto_157260 - BLOCK
      ?auto_157261 - BLOCK
      ?auto_157262 - BLOCK
      ?auto_157263 - BLOCK
      ?auto_157264 - BLOCK
      ?auto_157265 - BLOCK
    )
    :vars
    (
      ?auto_157266 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157265 ?auto_157266 ) ( not ( = ?auto_157256 ?auto_157257 ) ) ( not ( = ?auto_157256 ?auto_157258 ) ) ( not ( = ?auto_157256 ?auto_157259 ) ) ( not ( = ?auto_157256 ?auto_157260 ) ) ( not ( = ?auto_157256 ?auto_157261 ) ) ( not ( = ?auto_157256 ?auto_157262 ) ) ( not ( = ?auto_157256 ?auto_157263 ) ) ( not ( = ?auto_157256 ?auto_157264 ) ) ( not ( = ?auto_157256 ?auto_157265 ) ) ( not ( = ?auto_157256 ?auto_157266 ) ) ( not ( = ?auto_157257 ?auto_157258 ) ) ( not ( = ?auto_157257 ?auto_157259 ) ) ( not ( = ?auto_157257 ?auto_157260 ) ) ( not ( = ?auto_157257 ?auto_157261 ) ) ( not ( = ?auto_157257 ?auto_157262 ) ) ( not ( = ?auto_157257 ?auto_157263 ) ) ( not ( = ?auto_157257 ?auto_157264 ) ) ( not ( = ?auto_157257 ?auto_157265 ) ) ( not ( = ?auto_157257 ?auto_157266 ) ) ( not ( = ?auto_157258 ?auto_157259 ) ) ( not ( = ?auto_157258 ?auto_157260 ) ) ( not ( = ?auto_157258 ?auto_157261 ) ) ( not ( = ?auto_157258 ?auto_157262 ) ) ( not ( = ?auto_157258 ?auto_157263 ) ) ( not ( = ?auto_157258 ?auto_157264 ) ) ( not ( = ?auto_157258 ?auto_157265 ) ) ( not ( = ?auto_157258 ?auto_157266 ) ) ( not ( = ?auto_157259 ?auto_157260 ) ) ( not ( = ?auto_157259 ?auto_157261 ) ) ( not ( = ?auto_157259 ?auto_157262 ) ) ( not ( = ?auto_157259 ?auto_157263 ) ) ( not ( = ?auto_157259 ?auto_157264 ) ) ( not ( = ?auto_157259 ?auto_157265 ) ) ( not ( = ?auto_157259 ?auto_157266 ) ) ( not ( = ?auto_157260 ?auto_157261 ) ) ( not ( = ?auto_157260 ?auto_157262 ) ) ( not ( = ?auto_157260 ?auto_157263 ) ) ( not ( = ?auto_157260 ?auto_157264 ) ) ( not ( = ?auto_157260 ?auto_157265 ) ) ( not ( = ?auto_157260 ?auto_157266 ) ) ( not ( = ?auto_157261 ?auto_157262 ) ) ( not ( = ?auto_157261 ?auto_157263 ) ) ( not ( = ?auto_157261 ?auto_157264 ) ) ( not ( = ?auto_157261 ?auto_157265 ) ) ( not ( = ?auto_157261 ?auto_157266 ) ) ( not ( = ?auto_157262 ?auto_157263 ) ) ( not ( = ?auto_157262 ?auto_157264 ) ) ( not ( = ?auto_157262 ?auto_157265 ) ) ( not ( = ?auto_157262 ?auto_157266 ) ) ( not ( = ?auto_157263 ?auto_157264 ) ) ( not ( = ?auto_157263 ?auto_157265 ) ) ( not ( = ?auto_157263 ?auto_157266 ) ) ( not ( = ?auto_157264 ?auto_157265 ) ) ( not ( = ?auto_157264 ?auto_157266 ) ) ( not ( = ?auto_157265 ?auto_157266 ) ) ( ON ?auto_157264 ?auto_157265 ) ( ON ?auto_157263 ?auto_157264 ) ( ON ?auto_157262 ?auto_157263 ) ( ON ?auto_157261 ?auto_157262 ) ( ON ?auto_157260 ?auto_157261 ) ( ON ?auto_157259 ?auto_157260 ) ( ON ?auto_157258 ?auto_157259 ) ( ON ?auto_157257 ?auto_157258 ) ( ON ?auto_157256 ?auto_157257 ) ( CLEAR ?auto_157256 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_157256 )
      ( MAKE-10PILE ?auto_157256 ?auto_157257 ?auto_157258 ?auto_157259 ?auto_157260 ?auto_157261 ?auto_157262 ?auto_157263 ?auto_157264 ?auto_157265 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_157277 - BLOCK
      ?auto_157278 - BLOCK
      ?auto_157279 - BLOCK
      ?auto_157280 - BLOCK
      ?auto_157281 - BLOCK
      ?auto_157282 - BLOCK
      ?auto_157283 - BLOCK
      ?auto_157284 - BLOCK
      ?auto_157285 - BLOCK
      ?auto_157286 - BLOCK
    )
    :vars
    (
      ?auto_157287 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157286 ?auto_157287 ) ( not ( = ?auto_157277 ?auto_157278 ) ) ( not ( = ?auto_157277 ?auto_157279 ) ) ( not ( = ?auto_157277 ?auto_157280 ) ) ( not ( = ?auto_157277 ?auto_157281 ) ) ( not ( = ?auto_157277 ?auto_157282 ) ) ( not ( = ?auto_157277 ?auto_157283 ) ) ( not ( = ?auto_157277 ?auto_157284 ) ) ( not ( = ?auto_157277 ?auto_157285 ) ) ( not ( = ?auto_157277 ?auto_157286 ) ) ( not ( = ?auto_157277 ?auto_157287 ) ) ( not ( = ?auto_157278 ?auto_157279 ) ) ( not ( = ?auto_157278 ?auto_157280 ) ) ( not ( = ?auto_157278 ?auto_157281 ) ) ( not ( = ?auto_157278 ?auto_157282 ) ) ( not ( = ?auto_157278 ?auto_157283 ) ) ( not ( = ?auto_157278 ?auto_157284 ) ) ( not ( = ?auto_157278 ?auto_157285 ) ) ( not ( = ?auto_157278 ?auto_157286 ) ) ( not ( = ?auto_157278 ?auto_157287 ) ) ( not ( = ?auto_157279 ?auto_157280 ) ) ( not ( = ?auto_157279 ?auto_157281 ) ) ( not ( = ?auto_157279 ?auto_157282 ) ) ( not ( = ?auto_157279 ?auto_157283 ) ) ( not ( = ?auto_157279 ?auto_157284 ) ) ( not ( = ?auto_157279 ?auto_157285 ) ) ( not ( = ?auto_157279 ?auto_157286 ) ) ( not ( = ?auto_157279 ?auto_157287 ) ) ( not ( = ?auto_157280 ?auto_157281 ) ) ( not ( = ?auto_157280 ?auto_157282 ) ) ( not ( = ?auto_157280 ?auto_157283 ) ) ( not ( = ?auto_157280 ?auto_157284 ) ) ( not ( = ?auto_157280 ?auto_157285 ) ) ( not ( = ?auto_157280 ?auto_157286 ) ) ( not ( = ?auto_157280 ?auto_157287 ) ) ( not ( = ?auto_157281 ?auto_157282 ) ) ( not ( = ?auto_157281 ?auto_157283 ) ) ( not ( = ?auto_157281 ?auto_157284 ) ) ( not ( = ?auto_157281 ?auto_157285 ) ) ( not ( = ?auto_157281 ?auto_157286 ) ) ( not ( = ?auto_157281 ?auto_157287 ) ) ( not ( = ?auto_157282 ?auto_157283 ) ) ( not ( = ?auto_157282 ?auto_157284 ) ) ( not ( = ?auto_157282 ?auto_157285 ) ) ( not ( = ?auto_157282 ?auto_157286 ) ) ( not ( = ?auto_157282 ?auto_157287 ) ) ( not ( = ?auto_157283 ?auto_157284 ) ) ( not ( = ?auto_157283 ?auto_157285 ) ) ( not ( = ?auto_157283 ?auto_157286 ) ) ( not ( = ?auto_157283 ?auto_157287 ) ) ( not ( = ?auto_157284 ?auto_157285 ) ) ( not ( = ?auto_157284 ?auto_157286 ) ) ( not ( = ?auto_157284 ?auto_157287 ) ) ( not ( = ?auto_157285 ?auto_157286 ) ) ( not ( = ?auto_157285 ?auto_157287 ) ) ( not ( = ?auto_157286 ?auto_157287 ) ) ( ON ?auto_157285 ?auto_157286 ) ( ON ?auto_157284 ?auto_157285 ) ( ON ?auto_157283 ?auto_157284 ) ( ON ?auto_157282 ?auto_157283 ) ( ON ?auto_157281 ?auto_157282 ) ( ON ?auto_157280 ?auto_157281 ) ( ON ?auto_157279 ?auto_157280 ) ( ON ?auto_157278 ?auto_157279 ) ( ON ?auto_157277 ?auto_157278 ) ( CLEAR ?auto_157277 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_157277 )
      ( MAKE-10PILE ?auto_157277 ?auto_157278 ?auto_157279 ?auto_157280 ?auto_157281 ?auto_157282 ?auto_157283 ?auto_157284 ?auto_157285 ?auto_157286 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_157299 - BLOCK
      ?auto_157300 - BLOCK
      ?auto_157301 - BLOCK
      ?auto_157302 - BLOCK
      ?auto_157303 - BLOCK
      ?auto_157304 - BLOCK
      ?auto_157305 - BLOCK
      ?auto_157306 - BLOCK
      ?auto_157307 - BLOCK
      ?auto_157308 - BLOCK
      ?auto_157309 - BLOCK
    )
    :vars
    (
      ?auto_157310 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_157308 ) ( ON ?auto_157309 ?auto_157310 ) ( CLEAR ?auto_157309 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_157299 ) ( ON ?auto_157300 ?auto_157299 ) ( ON ?auto_157301 ?auto_157300 ) ( ON ?auto_157302 ?auto_157301 ) ( ON ?auto_157303 ?auto_157302 ) ( ON ?auto_157304 ?auto_157303 ) ( ON ?auto_157305 ?auto_157304 ) ( ON ?auto_157306 ?auto_157305 ) ( ON ?auto_157307 ?auto_157306 ) ( ON ?auto_157308 ?auto_157307 ) ( not ( = ?auto_157299 ?auto_157300 ) ) ( not ( = ?auto_157299 ?auto_157301 ) ) ( not ( = ?auto_157299 ?auto_157302 ) ) ( not ( = ?auto_157299 ?auto_157303 ) ) ( not ( = ?auto_157299 ?auto_157304 ) ) ( not ( = ?auto_157299 ?auto_157305 ) ) ( not ( = ?auto_157299 ?auto_157306 ) ) ( not ( = ?auto_157299 ?auto_157307 ) ) ( not ( = ?auto_157299 ?auto_157308 ) ) ( not ( = ?auto_157299 ?auto_157309 ) ) ( not ( = ?auto_157299 ?auto_157310 ) ) ( not ( = ?auto_157300 ?auto_157301 ) ) ( not ( = ?auto_157300 ?auto_157302 ) ) ( not ( = ?auto_157300 ?auto_157303 ) ) ( not ( = ?auto_157300 ?auto_157304 ) ) ( not ( = ?auto_157300 ?auto_157305 ) ) ( not ( = ?auto_157300 ?auto_157306 ) ) ( not ( = ?auto_157300 ?auto_157307 ) ) ( not ( = ?auto_157300 ?auto_157308 ) ) ( not ( = ?auto_157300 ?auto_157309 ) ) ( not ( = ?auto_157300 ?auto_157310 ) ) ( not ( = ?auto_157301 ?auto_157302 ) ) ( not ( = ?auto_157301 ?auto_157303 ) ) ( not ( = ?auto_157301 ?auto_157304 ) ) ( not ( = ?auto_157301 ?auto_157305 ) ) ( not ( = ?auto_157301 ?auto_157306 ) ) ( not ( = ?auto_157301 ?auto_157307 ) ) ( not ( = ?auto_157301 ?auto_157308 ) ) ( not ( = ?auto_157301 ?auto_157309 ) ) ( not ( = ?auto_157301 ?auto_157310 ) ) ( not ( = ?auto_157302 ?auto_157303 ) ) ( not ( = ?auto_157302 ?auto_157304 ) ) ( not ( = ?auto_157302 ?auto_157305 ) ) ( not ( = ?auto_157302 ?auto_157306 ) ) ( not ( = ?auto_157302 ?auto_157307 ) ) ( not ( = ?auto_157302 ?auto_157308 ) ) ( not ( = ?auto_157302 ?auto_157309 ) ) ( not ( = ?auto_157302 ?auto_157310 ) ) ( not ( = ?auto_157303 ?auto_157304 ) ) ( not ( = ?auto_157303 ?auto_157305 ) ) ( not ( = ?auto_157303 ?auto_157306 ) ) ( not ( = ?auto_157303 ?auto_157307 ) ) ( not ( = ?auto_157303 ?auto_157308 ) ) ( not ( = ?auto_157303 ?auto_157309 ) ) ( not ( = ?auto_157303 ?auto_157310 ) ) ( not ( = ?auto_157304 ?auto_157305 ) ) ( not ( = ?auto_157304 ?auto_157306 ) ) ( not ( = ?auto_157304 ?auto_157307 ) ) ( not ( = ?auto_157304 ?auto_157308 ) ) ( not ( = ?auto_157304 ?auto_157309 ) ) ( not ( = ?auto_157304 ?auto_157310 ) ) ( not ( = ?auto_157305 ?auto_157306 ) ) ( not ( = ?auto_157305 ?auto_157307 ) ) ( not ( = ?auto_157305 ?auto_157308 ) ) ( not ( = ?auto_157305 ?auto_157309 ) ) ( not ( = ?auto_157305 ?auto_157310 ) ) ( not ( = ?auto_157306 ?auto_157307 ) ) ( not ( = ?auto_157306 ?auto_157308 ) ) ( not ( = ?auto_157306 ?auto_157309 ) ) ( not ( = ?auto_157306 ?auto_157310 ) ) ( not ( = ?auto_157307 ?auto_157308 ) ) ( not ( = ?auto_157307 ?auto_157309 ) ) ( not ( = ?auto_157307 ?auto_157310 ) ) ( not ( = ?auto_157308 ?auto_157309 ) ) ( not ( = ?auto_157308 ?auto_157310 ) ) ( not ( = ?auto_157309 ?auto_157310 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_157309 ?auto_157310 )
      ( !STACK ?auto_157309 ?auto_157308 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_157322 - BLOCK
      ?auto_157323 - BLOCK
      ?auto_157324 - BLOCK
      ?auto_157325 - BLOCK
      ?auto_157326 - BLOCK
      ?auto_157327 - BLOCK
      ?auto_157328 - BLOCK
      ?auto_157329 - BLOCK
      ?auto_157330 - BLOCK
      ?auto_157331 - BLOCK
      ?auto_157332 - BLOCK
    )
    :vars
    (
      ?auto_157333 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_157331 ) ( ON ?auto_157332 ?auto_157333 ) ( CLEAR ?auto_157332 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_157322 ) ( ON ?auto_157323 ?auto_157322 ) ( ON ?auto_157324 ?auto_157323 ) ( ON ?auto_157325 ?auto_157324 ) ( ON ?auto_157326 ?auto_157325 ) ( ON ?auto_157327 ?auto_157326 ) ( ON ?auto_157328 ?auto_157327 ) ( ON ?auto_157329 ?auto_157328 ) ( ON ?auto_157330 ?auto_157329 ) ( ON ?auto_157331 ?auto_157330 ) ( not ( = ?auto_157322 ?auto_157323 ) ) ( not ( = ?auto_157322 ?auto_157324 ) ) ( not ( = ?auto_157322 ?auto_157325 ) ) ( not ( = ?auto_157322 ?auto_157326 ) ) ( not ( = ?auto_157322 ?auto_157327 ) ) ( not ( = ?auto_157322 ?auto_157328 ) ) ( not ( = ?auto_157322 ?auto_157329 ) ) ( not ( = ?auto_157322 ?auto_157330 ) ) ( not ( = ?auto_157322 ?auto_157331 ) ) ( not ( = ?auto_157322 ?auto_157332 ) ) ( not ( = ?auto_157322 ?auto_157333 ) ) ( not ( = ?auto_157323 ?auto_157324 ) ) ( not ( = ?auto_157323 ?auto_157325 ) ) ( not ( = ?auto_157323 ?auto_157326 ) ) ( not ( = ?auto_157323 ?auto_157327 ) ) ( not ( = ?auto_157323 ?auto_157328 ) ) ( not ( = ?auto_157323 ?auto_157329 ) ) ( not ( = ?auto_157323 ?auto_157330 ) ) ( not ( = ?auto_157323 ?auto_157331 ) ) ( not ( = ?auto_157323 ?auto_157332 ) ) ( not ( = ?auto_157323 ?auto_157333 ) ) ( not ( = ?auto_157324 ?auto_157325 ) ) ( not ( = ?auto_157324 ?auto_157326 ) ) ( not ( = ?auto_157324 ?auto_157327 ) ) ( not ( = ?auto_157324 ?auto_157328 ) ) ( not ( = ?auto_157324 ?auto_157329 ) ) ( not ( = ?auto_157324 ?auto_157330 ) ) ( not ( = ?auto_157324 ?auto_157331 ) ) ( not ( = ?auto_157324 ?auto_157332 ) ) ( not ( = ?auto_157324 ?auto_157333 ) ) ( not ( = ?auto_157325 ?auto_157326 ) ) ( not ( = ?auto_157325 ?auto_157327 ) ) ( not ( = ?auto_157325 ?auto_157328 ) ) ( not ( = ?auto_157325 ?auto_157329 ) ) ( not ( = ?auto_157325 ?auto_157330 ) ) ( not ( = ?auto_157325 ?auto_157331 ) ) ( not ( = ?auto_157325 ?auto_157332 ) ) ( not ( = ?auto_157325 ?auto_157333 ) ) ( not ( = ?auto_157326 ?auto_157327 ) ) ( not ( = ?auto_157326 ?auto_157328 ) ) ( not ( = ?auto_157326 ?auto_157329 ) ) ( not ( = ?auto_157326 ?auto_157330 ) ) ( not ( = ?auto_157326 ?auto_157331 ) ) ( not ( = ?auto_157326 ?auto_157332 ) ) ( not ( = ?auto_157326 ?auto_157333 ) ) ( not ( = ?auto_157327 ?auto_157328 ) ) ( not ( = ?auto_157327 ?auto_157329 ) ) ( not ( = ?auto_157327 ?auto_157330 ) ) ( not ( = ?auto_157327 ?auto_157331 ) ) ( not ( = ?auto_157327 ?auto_157332 ) ) ( not ( = ?auto_157327 ?auto_157333 ) ) ( not ( = ?auto_157328 ?auto_157329 ) ) ( not ( = ?auto_157328 ?auto_157330 ) ) ( not ( = ?auto_157328 ?auto_157331 ) ) ( not ( = ?auto_157328 ?auto_157332 ) ) ( not ( = ?auto_157328 ?auto_157333 ) ) ( not ( = ?auto_157329 ?auto_157330 ) ) ( not ( = ?auto_157329 ?auto_157331 ) ) ( not ( = ?auto_157329 ?auto_157332 ) ) ( not ( = ?auto_157329 ?auto_157333 ) ) ( not ( = ?auto_157330 ?auto_157331 ) ) ( not ( = ?auto_157330 ?auto_157332 ) ) ( not ( = ?auto_157330 ?auto_157333 ) ) ( not ( = ?auto_157331 ?auto_157332 ) ) ( not ( = ?auto_157331 ?auto_157333 ) ) ( not ( = ?auto_157332 ?auto_157333 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_157332 ?auto_157333 )
      ( !STACK ?auto_157332 ?auto_157331 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_157345 - BLOCK
      ?auto_157346 - BLOCK
      ?auto_157347 - BLOCK
      ?auto_157348 - BLOCK
      ?auto_157349 - BLOCK
      ?auto_157350 - BLOCK
      ?auto_157351 - BLOCK
      ?auto_157352 - BLOCK
      ?auto_157353 - BLOCK
      ?auto_157354 - BLOCK
      ?auto_157355 - BLOCK
    )
    :vars
    (
      ?auto_157356 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157355 ?auto_157356 ) ( ON-TABLE ?auto_157345 ) ( ON ?auto_157346 ?auto_157345 ) ( ON ?auto_157347 ?auto_157346 ) ( ON ?auto_157348 ?auto_157347 ) ( ON ?auto_157349 ?auto_157348 ) ( ON ?auto_157350 ?auto_157349 ) ( ON ?auto_157351 ?auto_157350 ) ( ON ?auto_157352 ?auto_157351 ) ( ON ?auto_157353 ?auto_157352 ) ( not ( = ?auto_157345 ?auto_157346 ) ) ( not ( = ?auto_157345 ?auto_157347 ) ) ( not ( = ?auto_157345 ?auto_157348 ) ) ( not ( = ?auto_157345 ?auto_157349 ) ) ( not ( = ?auto_157345 ?auto_157350 ) ) ( not ( = ?auto_157345 ?auto_157351 ) ) ( not ( = ?auto_157345 ?auto_157352 ) ) ( not ( = ?auto_157345 ?auto_157353 ) ) ( not ( = ?auto_157345 ?auto_157354 ) ) ( not ( = ?auto_157345 ?auto_157355 ) ) ( not ( = ?auto_157345 ?auto_157356 ) ) ( not ( = ?auto_157346 ?auto_157347 ) ) ( not ( = ?auto_157346 ?auto_157348 ) ) ( not ( = ?auto_157346 ?auto_157349 ) ) ( not ( = ?auto_157346 ?auto_157350 ) ) ( not ( = ?auto_157346 ?auto_157351 ) ) ( not ( = ?auto_157346 ?auto_157352 ) ) ( not ( = ?auto_157346 ?auto_157353 ) ) ( not ( = ?auto_157346 ?auto_157354 ) ) ( not ( = ?auto_157346 ?auto_157355 ) ) ( not ( = ?auto_157346 ?auto_157356 ) ) ( not ( = ?auto_157347 ?auto_157348 ) ) ( not ( = ?auto_157347 ?auto_157349 ) ) ( not ( = ?auto_157347 ?auto_157350 ) ) ( not ( = ?auto_157347 ?auto_157351 ) ) ( not ( = ?auto_157347 ?auto_157352 ) ) ( not ( = ?auto_157347 ?auto_157353 ) ) ( not ( = ?auto_157347 ?auto_157354 ) ) ( not ( = ?auto_157347 ?auto_157355 ) ) ( not ( = ?auto_157347 ?auto_157356 ) ) ( not ( = ?auto_157348 ?auto_157349 ) ) ( not ( = ?auto_157348 ?auto_157350 ) ) ( not ( = ?auto_157348 ?auto_157351 ) ) ( not ( = ?auto_157348 ?auto_157352 ) ) ( not ( = ?auto_157348 ?auto_157353 ) ) ( not ( = ?auto_157348 ?auto_157354 ) ) ( not ( = ?auto_157348 ?auto_157355 ) ) ( not ( = ?auto_157348 ?auto_157356 ) ) ( not ( = ?auto_157349 ?auto_157350 ) ) ( not ( = ?auto_157349 ?auto_157351 ) ) ( not ( = ?auto_157349 ?auto_157352 ) ) ( not ( = ?auto_157349 ?auto_157353 ) ) ( not ( = ?auto_157349 ?auto_157354 ) ) ( not ( = ?auto_157349 ?auto_157355 ) ) ( not ( = ?auto_157349 ?auto_157356 ) ) ( not ( = ?auto_157350 ?auto_157351 ) ) ( not ( = ?auto_157350 ?auto_157352 ) ) ( not ( = ?auto_157350 ?auto_157353 ) ) ( not ( = ?auto_157350 ?auto_157354 ) ) ( not ( = ?auto_157350 ?auto_157355 ) ) ( not ( = ?auto_157350 ?auto_157356 ) ) ( not ( = ?auto_157351 ?auto_157352 ) ) ( not ( = ?auto_157351 ?auto_157353 ) ) ( not ( = ?auto_157351 ?auto_157354 ) ) ( not ( = ?auto_157351 ?auto_157355 ) ) ( not ( = ?auto_157351 ?auto_157356 ) ) ( not ( = ?auto_157352 ?auto_157353 ) ) ( not ( = ?auto_157352 ?auto_157354 ) ) ( not ( = ?auto_157352 ?auto_157355 ) ) ( not ( = ?auto_157352 ?auto_157356 ) ) ( not ( = ?auto_157353 ?auto_157354 ) ) ( not ( = ?auto_157353 ?auto_157355 ) ) ( not ( = ?auto_157353 ?auto_157356 ) ) ( not ( = ?auto_157354 ?auto_157355 ) ) ( not ( = ?auto_157354 ?auto_157356 ) ) ( not ( = ?auto_157355 ?auto_157356 ) ) ( CLEAR ?auto_157353 ) ( ON ?auto_157354 ?auto_157355 ) ( CLEAR ?auto_157354 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_157345 ?auto_157346 ?auto_157347 ?auto_157348 ?auto_157349 ?auto_157350 ?auto_157351 ?auto_157352 ?auto_157353 ?auto_157354 )
      ( MAKE-11PILE ?auto_157345 ?auto_157346 ?auto_157347 ?auto_157348 ?auto_157349 ?auto_157350 ?auto_157351 ?auto_157352 ?auto_157353 ?auto_157354 ?auto_157355 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_157368 - BLOCK
      ?auto_157369 - BLOCK
      ?auto_157370 - BLOCK
      ?auto_157371 - BLOCK
      ?auto_157372 - BLOCK
      ?auto_157373 - BLOCK
      ?auto_157374 - BLOCK
      ?auto_157375 - BLOCK
      ?auto_157376 - BLOCK
      ?auto_157377 - BLOCK
      ?auto_157378 - BLOCK
    )
    :vars
    (
      ?auto_157379 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157378 ?auto_157379 ) ( ON-TABLE ?auto_157368 ) ( ON ?auto_157369 ?auto_157368 ) ( ON ?auto_157370 ?auto_157369 ) ( ON ?auto_157371 ?auto_157370 ) ( ON ?auto_157372 ?auto_157371 ) ( ON ?auto_157373 ?auto_157372 ) ( ON ?auto_157374 ?auto_157373 ) ( ON ?auto_157375 ?auto_157374 ) ( ON ?auto_157376 ?auto_157375 ) ( not ( = ?auto_157368 ?auto_157369 ) ) ( not ( = ?auto_157368 ?auto_157370 ) ) ( not ( = ?auto_157368 ?auto_157371 ) ) ( not ( = ?auto_157368 ?auto_157372 ) ) ( not ( = ?auto_157368 ?auto_157373 ) ) ( not ( = ?auto_157368 ?auto_157374 ) ) ( not ( = ?auto_157368 ?auto_157375 ) ) ( not ( = ?auto_157368 ?auto_157376 ) ) ( not ( = ?auto_157368 ?auto_157377 ) ) ( not ( = ?auto_157368 ?auto_157378 ) ) ( not ( = ?auto_157368 ?auto_157379 ) ) ( not ( = ?auto_157369 ?auto_157370 ) ) ( not ( = ?auto_157369 ?auto_157371 ) ) ( not ( = ?auto_157369 ?auto_157372 ) ) ( not ( = ?auto_157369 ?auto_157373 ) ) ( not ( = ?auto_157369 ?auto_157374 ) ) ( not ( = ?auto_157369 ?auto_157375 ) ) ( not ( = ?auto_157369 ?auto_157376 ) ) ( not ( = ?auto_157369 ?auto_157377 ) ) ( not ( = ?auto_157369 ?auto_157378 ) ) ( not ( = ?auto_157369 ?auto_157379 ) ) ( not ( = ?auto_157370 ?auto_157371 ) ) ( not ( = ?auto_157370 ?auto_157372 ) ) ( not ( = ?auto_157370 ?auto_157373 ) ) ( not ( = ?auto_157370 ?auto_157374 ) ) ( not ( = ?auto_157370 ?auto_157375 ) ) ( not ( = ?auto_157370 ?auto_157376 ) ) ( not ( = ?auto_157370 ?auto_157377 ) ) ( not ( = ?auto_157370 ?auto_157378 ) ) ( not ( = ?auto_157370 ?auto_157379 ) ) ( not ( = ?auto_157371 ?auto_157372 ) ) ( not ( = ?auto_157371 ?auto_157373 ) ) ( not ( = ?auto_157371 ?auto_157374 ) ) ( not ( = ?auto_157371 ?auto_157375 ) ) ( not ( = ?auto_157371 ?auto_157376 ) ) ( not ( = ?auto_157371 ?auto_157377 ) ) ( not ( = ?auto_157371 ?auto_157378 ) ) ( not ( = ?auto_157371 ?auto_157379 ) ) ( not ( = ?auto_157372 ?auto_157373 ) ) ( not ( = ?auto_157372 ?auto_157374 ) ) ( not ( = ?auto_157372 ?auto_157375 ) ) ( not ( = ?auto_157372 ?auto_157376 ) ) ( not ( = ?auto_157372 ?auto_157377 ) ) ( not ( = ?auto_157372 ?auto_157378 ) ) ( not ( = ?auto_157372 ?auto_157379 ) ) ( not ( = ?auto_157373 ?auto_157374 ) ) ( not ( = ?auto_157373 ?auto_157375 ) ) ( not ( = ?auto_157373 ?auto_157376 ) ) ( not ( = ?auto_157373 ?auto_157377 ) ) ( not ( = ?auto_157373 ?auto_157378 ) ) ( not ( = ?auto_157373 ?auto_157379 ) ) ( not ( = ?auto_157374 ?auto_157375 ) ) ( not ( = ?auto_157374 ?auto_157376 ) ) ( not ( = ?auto_157374 ?auto_157377 ) ) ( not ( = ?auto_157374 ?auto_157378 ) ) ( not ( = ?auto_157374 ?auto_157379 ) ) ( not ( = ?auto_157375 ?auto_157376 ) ) ( not ( = ?auto_157375 ?auto_157377 ) ) ( not ( = ?auto_157375 ?auto_157378 ) ) ( not ( = ?auto_157375 ?auto_157379 ) ) ( not ( = ?auto_157376 ?auto_157377 ) ) ( not ( = ?auto_157376 ?auto_157378 ) ) ( not ( = ?auto_157376 ?auto_157379 ) ) ( not ( = ?auto_157377 ?auto_157378 ) ) ( not ( = ?auto_157377 ?auto_157379 ) ) ( not ( = ?auto_157378 ?auto_157379 ) ) ( CLEAR ?auto_157376 ) ( ON ?auto_157377 ?auto_157378 ) ( CLEAR ?auto_157377 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_157368 ?auto_157369 ?auto_157370 ?auto_157371 ?auto_157372 ?auto_157373 ?auto_157374 ?auto_157375 ?auto_157376 ?auto_157377 )
      ( MAKE-11PILE ?auto_157368 ?auto_157369 ?auto_157370 ?auto_157371 ?auto_157372 ?auto_157373 ?auto_157374 ?auto_157375 ?auto_157376 ?auto_157377 ?auto_157378 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_157391 - BLOCK
      ?auto_157392 - BLOCK
      ?auto_157393 - BLOCK
      ?auto_157394 - BLOCK
      ?auto_157395 - BLOCK
      ?auto_157396 - BLOCK
      ?auto_157397 - BLOCK
      ?auto_157398 - BLOCK
      ?auto_157399 - BLOCK
      ?auto_157400 - BLOCK
      ?auto_157401 - BLOCK
    )
    :vars
    (
      ?auto_157402 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157401 ?auto_157402 ) ( ON-TABLE ?auto_157391 ) ( ON ?auto_157392 ?auto_157391 ) ( ON ?auto_157393 ?auto_157392 ) ( ON ?auto_157394 ?auto_157393 ) ( ON ?auto_157395 ?auto_157394 ) ( ON ?auto_157396 ?auto_157395 ) ( ON ?auto_157397 ?auto_157396 ) ( ON ?auto_157398 ?auto_157397 ) ( not ( = ?auto_157391 ?auto_157392 ) ) ( not ( = ?auto_157391 ?auto_157393 ) ) ( not ( = ?auto_157391 ?auto_157394 ) ) ( not ( = ?auto_157391 ?auto_157395 ) ) ( not ( = ?auto_157391 ?auto_157396 ) ) ( not ( = ?auto_157391 ?auto_157397 ) ) ( not ( = ?auto_157391 ?auto_157398 ) ) ( not ( = ?auto_157391 ?auto_157399 ) ) ( not ( = ?auto_157391 ?auto_157400 ) ) ( not ( = ?auto_157391 ?auto_157401 ) ) ( not ( = ?auto_157391 ?auto_157402 ) ) ( not ( = ?auto_157392 ?auto_157393 ) ) ( not ( = ?auto_157392 ?auto_157394 ) ) ( not ( = ?auto_157392 ?auto_157395 ) ) ( not ( = ?auto_157392 ?auto_157396 ) ) ( not ( = ?auto_157392 ?auto_157397 ) ) ( not ( = ?auto_157392 ?auto_157398 ) ) ( not ( = ?auto_157392 ?auto_157399 ) ) ( not ( = ?auto_157392 ?auto_157400 ) ) ( not ( = ?auto_157392 ?auto_157401 ) ) ( not ( = ?auto_157392 ?auto_157402 ) ) ( not ( = ?auto_157393 ?auto_157394 ) ) ( not ( = ?auto_157393 ?auto_157395 ) ) ( not ( = ?auto_157393 ?auto_157396 ) ) ( not ( = ?auto_157393 ?auto_157397 ) ) ( not ( = ?auto_157393 ?auto_157398 ) ) ( not ( = ?auto_157393 ?auto_157399 ) ) ( not ( = ?auto_157393 ?auto_157400 ) ) ( not ( = ?auto_157393 ?auto_157401 ) ) ( not ( = ?auto_157393 ?auto_157402 ) ) ( not ( = ?auto_157394 ?auto_157395 ) ) ( not ( = ?auto_157394 ?auto_157396 ) ) ( not ( = ?auto_157394 ?auto_157397 ) ) ( not ( = ?auto_157394 ?auto_157398 ) ) ( not ( = ?auto_157394 ?auto_157399 ) ) ( not ( = ?auto_157394 ?auto_157400 ) ) ( not ( = ?auto_157394 ?auto_157401 ) ) ( not ( = ?auto_157394 ?auto_157402 ) ) ( not ( = ?auto_157395 ?auto_157396 ) ) ( not ( = ?auto_157395 ?auto_157397 ) ) ( not ( = ?auto_157395 ?auto_157398 ) ) ( not ( = ?auto_157395 ?auto_157399 ) ) ( not ( = ?auto_157395 ?auto_157400 ) ) ( not ( = ?auto_157395 ?auto_157401 ) ) ( not ( = ?auto_157395 ?auto_157402 ) ) ( not ( = ?auto_157396 ?auto_157397 ) ) ( not ( = ?auto_157396 ?auto_157398 ) ) ( not ( = ?auto_157396 ?auto_157399 ) ) ( not ( = ?auto_157396 ?auto_157400 ) ) ( not ( = ?auto_157396 ?auto_157401 ) ) ( not ( = ?auto_157396 ?auto_157402 ) ) ( not ( = ?auto_157397 ?auto_157398 ) ) ( not ( = ?auto_157397 ?auto_157399 ) ) ( not ( = ?auto_157397 ?auto_157400 ) ) ( not ( = ?auto_157397 ?auto_157401 ) ) ( not ( = ?auto_157397 ?auto_157402 ) ) ( not ( = ?auto_157398 ?auto_157399 ) ) ( not ( = ?auto_157398 ?auto_157400 ) ) ( not ( = ?auto_157398 ?auto_157401 ) ) ( not ( = ?auto_157398 ?auto_157402 ) ) ( not ( = ?auto_157399 ?auto_157400 ) ) ( not ( = ?auto_157399 ?auto_157401 ) ) ( not ( = ?auto_157399 ?auto_157402 ) ) ( not ( = ?auto_157400 ?auto_157401 ) ) ( not ( = ?auto_157400 ?auto_157402 ) ) ( not ( = ?auto_157401 ?auto_157402 ) ) ( ON ?auto_157400 ?auto_157401 ) ( CLEAR ?auto_157398 ) ( ON ?auto_157399 ?auto_157400 ) ( CLEAR ?auto_157399 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_157391 ?auto_157392 ?auto_157393 ?auto_157394 ?auto_157395 ?auto_157396 ?auto_157397 ?auto_157398 ?auto_157399 )
      ( MAKE-11PILE ?auto_157391 ?auto_157392 ?auto_157393 ?auto_157394 ?auto_157395 ?auto_157396 ?auto_157397 ?auto_157398 ?auto_157399 ?auto_157400 ?auto_157401 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_157414 - BLOCK
      ?auto_157415 - BLOCK
      ?auto_157416 - BLOCK
      ?auto_157417 - BLOCK
      ?auto_157418 - BLOCK
      ?auto_157419 - BLOCK
      ?auto_157420 - BLOCK
      ?auto_157421 - BLOCK
      ?auto_157422 - BLOCK
      ?auto_157423 - BLOCK
      ?auto_157424 - BLOCK
    )
    :vars
    (
      ?auto_157425 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157424 ?auto_157425 ) ( ON-TABLE ?auto_157414 ) ( ON ?auto_157415 ?auto_157414 ) ( ON ?auto_157416 ?auto_157415 ) ( ON ?auto_157417 ?auto_157416 ) ( ON ?auto_157418 ?auto_157417 ) ( ON ?auto_157419 ?auto_157418 ) ( ON ?auto_157420 ?auto_157419 ) ( ON ?auto_157421 ?auto_157420 ) ( not ( = ?auto_157414 ?auto_157415 ) ) ( not ( = ?auto_157414 ?auto_157416 ) ) ( not ( = ?auto_157414 ?auto_157417 ) ) ( not ( = ?auto_157414 ?auto_157418 ) ) ( not ( = ?auto_157414 ?auto_157419 ) ) ( not ( = ?auto_157414 ?auto_157420 ) ) ( not ( = ?auto_157414 ?auto_157421 ) ) ( not ( = ?auto_157414 ?auto_157422 ) ) ( not ( = ?auto_157414 ?auto_157423 ) ) ( not ( = ?auto_157414 ?auto_157424 ) ) ( not ( = ?auto_157414 ?auto_157425 ) ) ( not ( = ?auto_157415 ?auto_157416 ) ) ( not ( = ?auto_157415 ?auto_157417 ) ) ( not ( = ?auto_157415 ?auto_157418 ) ) ( not ( = ?auto_157415 ?auto_157419 ) ) ( not ( = ?auto_157415 ?auto_157420 ) ) ( not ( = ?auto_157415 ?auto_157421 ) ) ( not ( = ?auto_157415 ?auto_157422 ) ) ( not ( = ?auto_157415 ?auto_157423 ) ) ( not ( = ?auto_157415 ?auto_157424 ) ) ( not ( = ?auto_157415 ?auto_157425 ) ) ( not ( = ?auto_157416 ?auto_157417 ) ) ( not ( = ?auto_157416 ?auto_157418 ) ) ( not ( = ?auto_157416 ?auto_157419 ) ) ( not ( = ?auto_157416 ?auto_157420 ) ) ( not ( = ?auto_157416 ?auto_157421 ) ) ( not ( = ?auto_157416 ?auto_157422 ) ) ( not ( = ?auto_157416 ?auto_157423 ) ) ( not ( = ?auto_157416 ?auto_157424 ) ) ( not ( = ?auto_157416 ?auto_157425 ) ) ( not ( = ?auto_157417 ?auto_157418 ) ) ( not ( = ?auto_157417 ?auto_157419 ) ) ( not ( = ?auto_157417 ?auto_157420 ) ) ( not ( = ?auto_157417 ?auto_157421 ) ) ( not ( = ?auto_157417 ?auto_157422 ) ) ( not ( = ?auto_157417 ?auto_157423 ) ) ( not ( = ?auto_157417 ?auto_157424 ) ) ( not ( = ?auto_157417 ?auto_157425 ) ) ( not ( = ?auto_157418 ?auto_157419 ) ) ( not ( = ?auto_157418 ?auto_157420 ) ) ( not ( = ?auto_157418 ?auto_157421 ) ) ( not ( = ?auto_157418 ?auto_157422 ) ) ( not ( = ?auto_157418 ?auto_157423 ) ) ( not ( = ?auto_157418 ?auto_157424 ) ) ( not ( = ?auto_157418 ?auto_157425 ) ) ( not ( = ?auto_157419 ?auto_157420 ) ) ( not ( = ?auto_157419 ?auto_157421 ) ) ( not ( = ?auto_157419 ?auto_157422 ) ) ( not ( = ?auto_157419 ?auto_157423 ) ) ( not ( = ?auto_157419 ?auto_157424 ) ) ( not ( = ?auto_157419 ?auto_157425 ) ) ( not ( = ?auto_157420 ?auto_157421 ) ) ( not ( = ?auto_157420 ?auto_157422 ) ) ( not ( = ?auto_157420 ?auto_157423 ) ) ( not ( = ?auto_157420 ?auto_157424 ) ) ( not ( = ?auto_157420 ?auto_157425 ) ) ( not ( = ?auto_157421 ?auto_157422 ) ) ( not ( = ?auto_157421 ?auto_157423 ) ) ( not ( = ?auto_157421 ?auto_157424 ) ) ( not ( = ?auto_157421 ?auto_157425 ) ) ( not ( = ?auto_157422 ?auto_157423 ) ) ( not ( = ?auto_157422 ?auto_157424 ) ) ( not ( = ?auto_157422 ?auto_157425 ) ) ( not ( = ?auto_157423 ?auto_157424 ) ) ( not ( = ?auto_157423 ?auto_157425 ) ) ( not ( = ?auto_157424 ?auto_157425 ) ) ( ON ?auto_157423 ?auto_157424 ) ( CLEAR ?auto_157421 ) ( ON ?auto_157422 ?auto_157423 ) ( CLEAR ?auto_157422 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_157414 ?auto_157415 ?auto_157416 ?auto_157417 ?auto_157418 ?auto_157419 ?auto_157420 ?auto_157421 ?auto_157422 )
      ( MAKE-11PILE ?auto_157414 ?auto_157415 ?auto_157416 ?auto_157417 ?auto_157418 ?auto_157419 ?auto_157420 ?auto_157421 ?auto_157422 ?auto_157423 ?auto_157424 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_157437 - BLOCK
      ?auto_157438 - BLOCK
      ?auto_157439 - BLOCK
      ?auto_157440 - BLOCK
      ?auto_157441 - BLOCK
      ?auto_157442 - BLOCK
      ?auto_157443 - BLOCK
      ?auto_157444 - BLOCK
      ?auto_157445 - BLOCK
      ?auto_157446 - BLOCK
      ?auto_157447 - BLOCK
    )
    :vars
    (
      ?auto_157448 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157447 ?auto_157448 ) ( ON-TABLE ?auto_157437 ) ( ON ?auto_157438 ?auto_157437 ) ( ON ?auto_157439 ?auto_157438 ) ( ON ?auto_157440 ?auto_157439 ) ( ON ?auto_157441 ?auto_157440 ) ( ON ?auto_157442 ?auto_157441 ) ( ON ?auto_157443 ?auto_157442 ) ( not ( = ?auto_157437 ?auto_157438 ) ) ( not ( = ?auto_157437 ?auto_157439 ) ) ( not ( = ?auto_157437 ?auto_157440 ) ) ( not ( = ?auto_157437 ?auto_157441 ) ) ( not ( = ?auto_157437 ?auto_157442 ) ) ( not ( = ?auto_157437 ?auto_157443 ) ) ( not ( = ?auto_157437 ?auto_157444 ) ) ( not ( = ?auto_157437 ?auto_157445 ) ) ( not ( = ?auto_157437 ?auto_157446 ) ) ( not ( = ?auto_157437 ?auto_157447 ) ) ( not ( = ?auto_157437 ?auto_157448 ) ) ( not ( = ?auto_157438 ?auto_157439 ) ) ( not ( = ?auto_157438 ?auto_157440 ) ) ( not ( = ?auto_157438 ?auto_157441 ) ) ( not ( = ?auto_157438 ?auto_157442 ) ) ( not ( = ?auto_157438 ?auto_157443 ) ) ( not ( = ?auto_157438 ?auto_157444 ) ) ( not ( = ?auto_157438 ?auto_157445 ) ) ( not ( = ?auto_157438 ?auto_157446 ) ) ( not ( = ?auto_157438 ?auto_157447 ) ) ( not ( = ?auto_157438 ?auto_157448 ) ) ( not ( = ?auto_157439 ?auto_157440 ) ) ( not ( = ?auto_157439 ?auto_157441 ) ) ( not ( = ?auto_157439 ?auto_157442 ) ) ( not ( = ?auto_157439 ?auto_157443 ) ) ( not ( = ?auto_157439 ?auto_157444 ) ) ( not ( = ?auto_157439 ?auto_157445 ) ) ( not ( = ?auto_157439 ?auto_157446 ) ) ( not ( = ?auto_157439 ?auto_157447 ) ) ( not ( = ?auto_157439 ?auto_157448 ) ) ( not ( = ?auto_157440 ?auto_157441 ) ) ( not ( = ?auto_157440 ?auto_157442 ) ) ( not ( = ?auto_157440 ?auto_157443 ) ) ( not ( = ?auto_157440 ?auto_157444 ) ) ( not ( = ?auto_157440 ?auto_157445 ) ) ( not ( = ?auto_157440 ?auto_157446 ) ) ( not ( = ?auto_157440 ?auto_157447 ) ) ( not ( = ?auto_157440 ?auto_157448 ) ) ( not ( = ?auto_157441 ?auto_157442 ) ) ( not ( = ?auto_157441 ?auto_157443 ) ) ( not ( = ?auto_157441 ?auto_157444 ) ) ( not ( = ?auto_157441 ?auto_157445 ) ) ( not ( = ?auto_157441 ?auto_157446 ) ) ( not ( = ?auto_157441 ?auto_157447 ) ) ( not ( = ?auto_157441 ?auto_157448 ) ) ( not ( = ?auto_157442 ?auto_157443 ) ) ( not ( = ?auto_157442 ?auto_157444 ) ) ( not ( = ?auto_157442 ?auto_157445 ) ) ( not ( = ?auto_157442 ?auto_157446 ) ) ( not ( = ?auto_157442 ?auto_157447 ) ) ( not ( = ?auto_157442 ?auto_157448 ) ) ( not ( = ?auto_157443 ?auto_157444 ) ) ( not ( = ?auto_157443 ?auto_157445 ) ) ( not ( = ?auto_157443 ?auto_157446 ) ) ( not ( = ?auto_157443 ?auto_157447 ) ) ( not ( = ?auto_157443 ?auto_157448 ) ) ( not ( = ?auto_157444 ?auto_157445 ) ) ( not ( = ?auto_157444 ?auto_157446 ) ) ( not ( = ?auto_157444 ?auto_157447 ) ) ( not ( = ?auto_157444 ?auto_157448 ) ) ( not ( = ?auto_157445 ?auto_157446 ) ) ( not ( = ?auto_157445 ?auto_157447 ) ) ( not ( = ?auto_157445 ?auto_157448 ) ) ( not ( = ?auto_157446 ?auto_157447 ) ) ( not ( = ?auto_157446 ?auto_157448 ) ) ( not ( = ?auto_157447 ?auto_157448 ) ) ( ON ?auto_157446 ?auto_157447 ) ( ON ?auto_157445 ?auto_157446 ) ( CLEAR ?auto_157443 ) ( ON ?auto_157444 ?auto_157445 ) ( CLEAR ?auto_157444 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_157437 ?auto_157438 ?auto_157439 ?auto_157440 ?auto_157441 ?auto_157442 ?auto_157443 ?auto_157444 )
      ( MAKE-11PILE ?auto_157437 ?auto_157438 ?auto_157439 ?auto_157440 ?auto_157441 ?auto_157442 ?auto_157443 ?auto_157444 ?auto_157445 ?auto_157446 ?auto_157447 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_157460 - BLOCK
      ?auto_157461 - BLOCK
      ?auto_157462 - BLOCK
      ?auto_157463 - BLOCK
      ?auto_157464 - BLOCK
      ?auto_157465 - BLOCK
      ?auto_157466 - BLOCK
      ?auto_157467 - BLOCK
      ?auto_157468 - BLOCK
      ?auto_157469 - BLOCK
      ?auto_157470 - BLOCK
    )
    :vars
    (
      ?auto_157471 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157470 ?auto_157471 ) ( ON-TABLE ?auto_157460 ) ( ON ?auto_157461 ?auto_157460 ) ( ON ?auto_157462 ?auto_157461 ) ( ON ?auto_157463 ?auto_157462 ) ( ON ?auto_157464 ?auto_157463 ) ( ON ?auto_157465 ?auto_157464 ) ( ON ?auto_157466 ?auto_157465 ) ( not ( = ?auto_157460 ?auto_157461 ) ) ( not ( = ?auto_157460 ?auto_157462 ) ) ( not ( = ?auto_157460 ?auto_157463 ) ) ( not ( = ?auto_157460 ?auto_157464 ) ) ( not ( = ?auto_157460 ?auto_157465 ) ) ( not ( = ?auto_157460 ?auto_157466 ) ) ( not ( = ?auto_157460 ?auto_157467 ) ) ( not ( = ?auto_157460 ?auto_157468 ) ) ( not ( = ?auto_157460 ?auto_157469 ) ) ( not ( = ?auto_157460 ?auto_157470 ) ) ( not ( = ?auto_157460 ?auto_157471 ) ) ( not ( = ?auto_157461 ?auto_157462 ) ) ( not ( = ?auto_157461 ?auto_157463 ) ) ( not ( = ?auto_157461 ?auto_157464 ) ) ( not ( = ?auto_157461 ?auto_157465 ) ) ( not ( = ?auto_157461 ?auto_157466 ) ) ( not ( = ?auto_157461 ?auto_157467 ) ) ( not ( = ?auto_157461 ?auto_157468 ) ) ( not ( = ?auto_157461 ?auto_157469 ) ) ( not ( = ?auto_157461 ?auto_157470 ) ) ( not ( = ?auto_157461 ?auto_157471 ) ) ( not ( = ?auto_157462 ?auto_157463 ) ) ( not ( = ?auto_157462 ?auto_157464 ) ) ( not ( = ?auto_157462 ?auto_157465 ) ) ( not ( = ?auto_157462 ?auto_157466 ) ) ( not ( = ?auto_157462 ?auto_157467 ) ) ( not ( = ?auto_157462 ?auto_157468 ) ) ( not ( = ?auto_157462 ?auto_157469 ) ) ( not ( = ?auto_157462 ?auto_157470 ) ) ( not ( = ?auto_157462 ?auto_157471 ) ) ( not ( = ?auto_157463 ?auto_157464 ) ) ( not ( = ?auto_157463 ?auto_157465 ) ) ( not ( = ?auto_157463 ?auto_157466 ) ) ( not ( = ?auto_157463 ?auto_157467 ) ) ( not ( = ?auto_157463 ?auto_157468 ) ) ( not ( = ?auto_157463 ?auto_157469 ) ) ( not ( = ?auto_157463 ?auto_157470 ) ) ( not ( = ?auto_157463 ?auto_157471 ) ) ( not ( = ?auto_157464 ?auto_157465 ) ) ( not ( = ?auto_157464 ?auto_157466 ) ) ( not ( = ?auto_157464 ?auto_157467 ) ) ( not ( = ?auto_157464 ?auto_157468 ) ) ( not ( = ?auto_157464 ?auto_157469 ) ) ( not ( = ?auto_157464 ?auto_157470 ) ) ( not ( = ?auto_157464 ?auto_157471 ) ) ( not ( = ?auto_157465 ?auto_157466 ) ) ( not ( = ?auto_157465 ?auto_157467 ) ) ( not ( = ?auto_157465 ?auto_157468 ) ) ( not ( = ?auto_157465 ?auto_157469 ) ) ( not ( = ?auto_157465 ?auto_157470 ) ) ( not ( = ?auto_157465 ?auto_157471 ) ) ( not ( = ?auto_157466 ?auto_157467 ) ) ( not ( = ?auto_157466 ?auto_157468 ) ) ( not ( = ?auto_157466 ?auto_157469 ) ) ( not ( = ?auto_157466 ?auto_157470 ) ) ( not ( = ?auto_157466 ?auto_157471 ) ) ( not ( = ?auto_157467 ?auto_157468 ) ) ( not ( = ?auto_157467 ?auto_157469 ) ) ( not ( = ?auto_157467 ?auto_157470 ) ) ( not ( = ?auto_157467 ?auto_157471 ) ) ( not ( = ?auto_157468 ?auto_157469 ) ) ( not ( = ?auto_157468 ?auto_157470 ) ) ( not ( = ?auto_157468 ?auto_157471 ) ) ( not ( = ?auto_157469 ?auto_157470 ) ) ( not ( = ?auto_157469 ?auto_157471 ) ) ( not ( = ?auto_157470 ?auto_157471 ) ) ( ON ?auto_157469 ?auto_157470 ) ( ON ?auto_157468 ?auto_157469 ) ( CLEAR ?auto_157466 ) ( ON ?auto_157467 ?auto_157468 ) ( CLEAR ?auto_157467 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_157460 ?auto_157461 ?auto_157462 ?auto_157463 ?auto_157464 ?auto_157465 ?auto_157466 ?auto_157467 )
      ( MAKE-11PILE ?auto_157460 ?auto_157461 ?auto_157462 ?auto_157463 ?auto_157464 ?auto_157465 ?auto_157466 ?auto_157467 ?auto_157468 ?auto_157469 ?auto_157470 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_157483 - BLOCK
      ?auto_157484 - BLOCK
      ?auto_157485 - BLOCK
      ?auto_157486 - BLOCK
      ?auto_157487 - BLOCK
      ?auto_157488 - BLOCK
      ?auto_157489 - BLOCK
      ?auto_157490 - BLOCK
      ?auto_157491 - BLOCK
      ?auto_157492 - BLOCK
      ?auto_157493 - BLOCK
    )
    :vars
    (
      ?auto_157494 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157493 ?auto_157494 ) ( ON-TABLE ?auto_157483 ) ( ON ?auto_157484 ?auto_157483 ) ( ON ?auto_157485 ?auto_157484 ) ( ON ?auto_157486 ?auto_157485 ) ( ON ?auto_157487 ?auto_157486 ) ( ON ?auto_157488 ?auto_157487 ) ( not ( = ?auto_157483 ?auto_157484 ) ) ( not ( = ?auto_157483 ?auto_157485 ) ) ( not ( = ?auto_157483 ?auto_157486 ) ) ( not ( = ?auto_157483 ?auto_157487 ) ) ( not ( = ?auto_157483 ?auto_157488 ) ) ( not ( = ?auto_157483 ?auto_157489 ) ) ( not ( = ?auto_157483 ?auto_157490 ) ) ( not ( = ?auto_157483 ?auto_157491 ) ) ( not ( = ?auto_157483 ?auto_157492 ) ) ( not ( = ?auto_157483 ?auto_157493 ) ) ( not ( = ?auto_157483 ?auto_157494 ) ) ( not ( = ?auto_157484 ?auto_157485 ) ) ( not ( = ?auto_157484 ?auto_157486 ) ) ( not ( = ?auto_157484 ?auto_157487 ) ) ( not ( = ?auto_157484 ?auto_157488 ) ) ( not ( = ?auto_157484 ?auto_157489 ) ) ( not ( = ?auto_157484 ?auto_157490 ) ) ( not ( = ?auto_157484 ?auto_157491 ) ) ( not ( = ?auto_157484 ?auto_157492 ) ) ( not ( = ?auto_157484 ?auto_157493 ) ) ( not ( = ?auto_157484 ?auto_157494 ) ) ( not ( = ?auto_157485 ?auto_157486 ) ) ( not ( = ?auto_157485 ?auto_157487 ) ) ( not ( = ?auto_157485 ?auto_157488 ) ) ( not ( = ?auto_157485 ?auto_157489 ) ) ( not ( = ?auto_157485 ?auto_157490 ) ) ( not ( = ?auto_157485 ?auto_157491 ) ) ( not ( = ?auto_157485 ?auto_157492 ) ) ( not ( = ?auto_157485 ?auto_157493 ) ) ( not ( = ?auto_157485 ?auto_157494 ) ) ( not ( = ?auto_157486 ?auto_157487 ) ) ( not ( = ?auto_157486 ?auto_157488 ) ) ( not ( = ?auto_157486 ?auto_157489 ) ) ( not ( = ?auto_157486 ?auto_157490 ) ) ( not ( = ?auto_157486 ?auto_157491 ) ) ( not ( = ?auto_157486 ?auto_157492 ) ) ( not ( = ?auto_157486 ?auto_157493 ) ) ( not ( = ?auto_157486 ?auto_157494 ) ) ( not ( = ?auto_157487 ?auto_157488 ) ) ( not ( = ?auto_157487 ?auto_157489 ) ) ( not ( = ?auto_157487 ?auto_157490 ) ) ( not ( = ?auto_157487 ?auto_157491 ) ) ( not ( = ?auto_157487 ?auto_157492 ) ) ( not ( = ?auto_157487 ?auto_157493 ) ) ( not ( = ?auto_157487 ?auto_157494 ) ) ( not ( = ?auto_157488 ?auto_157489 ) ) ( not ( = ?auto_157488 ?auto_157490 ) ) ( not ( = ?auto_157488 ?auto_157491 ) ) ( not ( = ?auto_157488 ?auto_157492 ) ) ( not ( = ?auto_157488 ?auto_157493 ) ) ( not ( = ?auto_157488 ?auto_157494 ) ) ( not ( = ?auto_157489 ?auto_157490 ) ) ( not ( = ?auto_157489 ?auto_157491 ) ) ( not ( = ?auto_157489 ?auto_157492 ) ) ( not ( = ?auto_157489 ?auto_157493 ) ) ( not ( = ?auto_157489 ?auto_157494 ) ) ( not ( = ?auto_157490 ?auto_157491 ) ) ( not ( = ?auto_157490 ?auto_157492 ) ) ( not ( = ?auto_157490 ?auto_157493 ) ) ( not ( = ?auto_157490 ?auto_157494 ) ) ( not ( = ?auto_157491 ?auto_157492 ) ) ( not ( = ?auto_157491 ?auto_157493 ) ) ( not ( = ?auto_157491 ?auto_157494 ) ) ( not ( = ?auto_157492 ?auto_157493 ) ) ( not ( = ?auto_157492 ?auto_157494 ) ) ( not ( = ?auto_157493 ?auto_157494 ) ) ( ON ?auto_157492 ?auto_157493 ) ( ON ?auto_157491 ?auto_157492 ) ( ON ?auto_157490 ?auto_157491 ) ( CLEAR ?auto_157488 ) ( ON ?auto_157489 ?auto_157490 ) ( CLEAR ?auto_157489 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_157483 ?auto_157484 ?auto_157485 ?auto_157486 ?auto_157487 ?auto_157488 ?auto_157489 )
      ( MAKE-11PILE ?auto_157483 ?auto_157484 ?auto_157485 ?auto_157486 ?auto_157487 ?auto_157488 ?auto_157489 ?auto_157490 ?auto_157491 ?auto_157492 ?auto_157493 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_157506 - BLOCK
      ?auto_157507 - BLOCK
      ?auto_157508 - BLOCK
      ?auto_157509 - BLOCK
      ?auto_157510 - BLOCK
      ?auto_157511 - BLOCK
      ?auto_157512 - BLOCK
      ?auto_157513 - BLOCK
      ?auto_157514 - BLOCK
      ?auto_157515 - BLOCK
      ?auto_157516 - BLOCK
    )
    :vars
    (
      ?auto_157517 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157516 ?auto_157517 ) ( ON-TABLE ?auto_157506 ) ( ON ?auto_157507 ?auto_157506 ) ( ON ?auto_157508 ?auto_157507 ) ( ON ?auto_157509 ?auto_157508 ) ( ON ?auto_157510 ?auto_157509 ) ( ON ?auto_157511 ?auto_157510 ) ( not ( = ?auto_157506 ?auto_157507 ) ) ( not ( = ?auto_157506 ?auto_157508 ) ) ( not ( = ?auto_157506 ?auto_157509 ) ) ( not ( = ?auto_157506 ?auto_157510 ) ) ( not ( = ?auto_157506 ?auto_157511 ) ) ( not ( = ?auto_157506 ?auto_157512 ) ) ( not ( = ?auto_157506 ?auto_157513 ) ) ( not ( = ?auto_157506 ?auto_157514 ) ) ( not ( = ?auto_157506 ?auto_157515 ) ) ( not ( = ?auto_157506 ?auto_157516 ) ) ( not ( = ?auto_157506 ?auto_157517 ) ) ( not ( = ?auto_157507 ?auto_157508 ) ) ( not ( = ?auto_157507 ?auto_157509 ) ) ( not ( = ?auto_157507 ?auto_157510 ) ) ( not ( = ?auto_157507 ?auto_157511 ) ) ( not ( = ?auto_157507 ?auto_157512 ) ) ( not ( = ?auto_157507 ?auto_157513 ) ) ( not ( = ?auto_157507 ?auto_157514 ) ) ( not ( = ?auto_157507 ?auto_157515 ) ) ( not ( = ?auto_157507 ?auto_157516 ) ) ( not ( = ?auto_157507 ?auto_157517 ) ) ( not ( = ?auto_157508 ?auto_157509 ) ) ( not ( = ?auto_157508 ?auto_157510 ) ) ( not ( = ?auto_157508 ?auto_157511 ) ) ( not ( = ?auto_157508 ?auto_157512 ) ) ( not ( = ?auto_157508 ?auto_157513 ) ) ( not ( = ?auto_157508 ?auto_157514 ) ) ( not ( = ?auto_157508 ?auto_157515 ) ) ( not ( = ?auto_157508 ?auto_157516 ) ) ( not ( = ?auto_157508 ?auto_157517 ) ) ( not ( = ?auto_157509 ?auto_157510 ) ) ( not ( = ?auto_157509 ?auto_157511 ) ) ( not ( = ?auto_157509 ?auto_157512 ) ) ( not ( = ?auto_157509 ?auto_157513 ) ) ( not ( = ?auto_157509 ?auto_157514 ) ) ( not ( = ?auto_157509 ?auto_157515 ) ) ( not ( = ?auto_157509 ?auto_157516 ) ) ( not ( = ?auto_157509 ?auto_157517 ) ) ( not ( = ?auto_157510 ?auto_157511 ) ) ( not ( = ?auto_157510 ?auto_157512 ) ) ( not ( = ?auto_157510 ?auto_157513 ) ) ( not ( = ?auto_157510 ?auto_157514 ) ) ( not ( = ?auto_157510 ?auto_157515 ) ) ( not ( = ?auto_157510 ?auto_157516 ) ) ( not ( = ?auto_157510 ?auto_157517 ) ) ( not ( = ?auto_157511 ?auto_157512 ) ) ( not ( = ?auto_157511 ?auto_157513 ) ) ( not ( = ?auto_157511 ?auto_157514 ) ) ( not ( = ?auto_157511 ?auto_157515 ) ) ( not ( = ?auto_157511 ?auto_157516 ) ) ( not ( = ?auto_157511 ?auto_157517 ) ) ( not ( = ?auto_157512 ?auto_157513 ) ) ( not ( = ?auto_157512 ?auto_157514 ) ) ( not ( = ?auto_157512 ?auto_157515 ) ) ( not ( = ?auto_157512 ?auto_157516 ) ) ( not ( = ?auto_157512 ?auto_157517 ) ) ( not ( = ?auto_157513 ?auto_157514 ) ) ( not ( = ?auto_157513 ?auto_157515 ) ) ( not ( = ?auto_157513 ?auto_157516 ) ) ( not ( = ?auto_157513 ?auto_157517 ) ) ( not ( = ?auto_157514 ?auto_157515 ) ) ( not ( = ?auto_157514 ?auto_157516 ) ) ( not ( = ?auto_157514 ?auto_157517 ) ) ( not ( = ?auto_157515 ?auto_157516 ) ) ( not ( = ?auto_157515 ?auto_157517 ) ) ( not ( = ?auto_157516 ?auto_157517 ) ) ( ON ?auto_157515 ?auto_157516 ) ( ON ?auto_157514 ?auto_157515 ) ( ON ?auto_157513 ?auto_157514 ) ( CLEAR ?auto_157511 ) ( ON ?auto_157512 ?auto_157513 ) ( CLEAR ?auto_157512 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_157506 ?auto_157507 ?auto_157508 ?auto_157509 ?auto_157510 ?auto_157511 ?auto_157512 )
      ( MAKE-11PILE ?auto_157506 ?auto_157507 ?auto_157508 ?auto_157509 ?auto_157510 ?auto_157511 ?auto_157512 ?auto_157513 ?auto_157514 ?auto_157515 ?auto_157516 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_157529 - BLOCK
      ?auto_157530 - BLOCK
      ?auto_157531 - BLOCK
      ?auto_157532 - BLOCK
      ?auto_157533 - BLOCK
      ?auto_157534 - BLOCK
      ?auto_157535 - BLOCK
      ?auto_157536 - BLOCK
      ?auto_157537 - BLOCK
      ?auto_157538 - BLOCK
      ?auto_157539 - BLOCK
    )
    :vars
    (
      ?auto_157540 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157539 ?auto_157540 ) ( ON-TABLE ?auto_157529 ) ( ON ?auto_157530 ?auto_157529 ) ( ON ?auto_157531 ?auto_157530 ) ( ON ?auto_157532 ?auto_157531 ) ( ON ?auto_157533 ?auto_157532 ) ( not ( = ?auto_157529 ?auto_157530 ) ) ( not ( = ?auto_157529 ?auto_157531 ) ) ( not ( = ?auto_157529 ?auto_157532 ) ) ( not ( = ?auto_157529 ?auto_157533 ) ) ( not ( = ?auto_157529 ?auto_157534 ) ) ( not ( = ?auto_157529 ?auto_157535 ) ) ( not ( = ?auto_157529 ?auto_157536 ) ) ( not ( = ?auto_157529 ?auto_157537 ) ) ( not ( = ?auto_157529 ?auto_157538 ) ) ( not ( = ?auto_157529 ?auto_157539 ) ) ( not ( = ?auto_157529 ?auto_157540 ) ) ( not ( = ?auto_157530 ?auto_157531 ) ) ( not ( = ?auto_157530 ?auto_157532 ) ) ( not ( = ?auto_157530 ?auto_157533 ) ) ( not ( = ?auto_157530 ?auto_157534 ) ) ( not ( = ?auto_157530 ?auto_157535 ) ) ( not ( = ?auto_157530 ?auto_157536 ) ) ( not ( = ?auto_157530 ?auto_157537 ) ) ( not ( = ?auto_157530 ?auto_157538 ) ) ( not ( = ?auto_157530 ?auto_157539 ) ) ( not ( = ?auto_157530 ?auto_157540 ) ) ( not ( = ?auto_157531 ?auto_157532 ) ) ( not ( = ?auto_157531 ?auto_157533 ) ) ( not ( = ?auto_157531 ?auto_157534 ) ) ( not ( = ?auto_157531 ?auto_157535 ) ) ( not ( = ?auto_157531 ?auto_157536 ) ) ( not ( = ?auto_157531 ?auto_157537 ) ) ( not ( = ?auto_157531 ?auto_157538 ) ) ( not ( = ?auto_157531 ?auto_157539 ) ) ( not ( = ?auto_157531 ?auto_157540 ) ) ( not ( = ?auto_157532 ?auto_157533 ) ) ( not ( = ?auto_157532 ?auto_157534 ) ) ( not ( = ?auto_157532 ?auto_157535 ) ) ( not ( = ?auto_157532 ?auto_157536 ) ) ( not ( = ?auto_157532 ?auto_157537 ) ) ( not ( = ?auto_157532 ?auto_157538 ) ) ( not ( = ?auto_157532 ?auto_157539 ) ) ( not ( = ?auto_157532 ?auto_157540 ) ) ( not ( = ?auto_157533 ?auto_157534 ) ) ( not ( = ?auto_157533 ?auto_157535 ) ) ( not ( = ?auto_157533 ?auto_157536 ) ) ( not ( = ?auto_157533 ?auto_157537 ) ) ( not ( = ?auto_157533 ?auto_157538 ) ) ( not ( = ?auto_157533 ?auto_157539 ) ) ( not ( = ?auto_157533 ?auto_157540 ) ) ( not ( = ?auto_157534 ?auto_157535 ) ) ( not ( = ?auto_157534 ?auto_157536 ) ) ( not ( = ?auto_157534 ?auto_157537 ) ) ( not ( = ?auto_157534 ?auto_157538 ) ) ( not ( = ?auto_157534 ?auto_157539 ) ) ( not ( = ?auto_157534 ?auto_157540 ) ) ( not ( = ?auto_157535 ?auto_157536 ) ) ( not ( = ?auto_157535 ?auto_157537 ) ) ( not ( = ?auto_157535 ?auto_157538 ) ) ( not ( = ?auto_157535 ?auto_157539 ) ) ( not ( = ?auto_157535 ?auto_157540 ) ) ( not ( = ?auto_157536 ?auto_157537 ) ) ( not ( = ?auto_157536 ?auto_157538 ) ) ( not ( = ?auto_157536 ?auto_157539 ) ) ( not ( = ?auto_157536 ?auto_157540 ) ) ( not ( = ?auto_157537 ?auto_157538 ) ) ( not ( = ?auto_157537 ?auto_157539 ) ) ( not ( = ?auto_157537 ?auto_157540 ) ) ( not ( = ?auto_157538 ?auto_157539 ) ) ( not ( = ?auto_157538 ?auto_157540 ) ) ( not ( = ?auto_157539 ?auto_157540 ) ) ( ON ?auto_157538 ?auto_157539 ) ( ON ?auto_157537 ?auto_157538 ) ( ON ?auto_157536 ?auto_157537 ) ( ON ?auto_157535 ?auto_157536 ) ( CLEAR ?auto_157533 ) ( ON ?auto_157534 ?auto_157535 ) ( CLEAR ?auto_157534 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_157529 ?auto_157530 ?auto_157531 ?auto_157532 ?auto_157533 ?auto_157534 )
      ( MAKE-11PILE ?auto_157529 ?auto_157530 ?auto_157531 ?auto_157532 ?auto_157533 ?auto_157534 ?auto_157535 ?auto_157536 ?auto_157537 ?auto_157538 ?auto_157539 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_157552 - BLOCK
      ?auto_157553 - BLOCK
      ?auto_157554 - BLOCK
      ?auto_157555 - BLOCK
      ?auto_157556 - BLOCK
      ?auto_157557 - BLOCK
      ?auto_157558 - BLOCK
      ?auto_157559 - BLOCK
      ?auto_157560 - BLOCK
      ?auto_157561 - BLOCK
      ?auto_157562 - BLOCK
    )
    :vars
    (
      ?auto_157563 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157562 ?auto_157563 ) ( ON-TABLE ?auto_157552 ) ( ON ?auto_157553 ?auto_157552 ) ( ON ?auto_157554 ?auto_157553 ) ( ON ?auto_157555 ?auto_157554 ) ( ON ?auto_157556 ?auto_157555 ) ( not ( = ?auto_157552 ?auto_157553 ) ) ( not ( = ?auto_157552 ?auto_157554 ) ) ( not ( = ?auto_157552 ?auto_157555 ) ) ( not ( = ?auto_157552 ?auto_157556 ) ) ( not ( = ?auto_157552 ?auto_157557 ) ) ( not ( = ?auto_157552 ?auto_157558 ) ) ( not ( = ?auto_157552 ?auto_157559 ) ) ( not ( = ?auto_157552 ?auto_157560 ) ) ( not ( = ?auto_157552 ?auto_157561 ) ) ( not ( = ?auto_157552 ?auto_157562 ) ) ( not ( = ?auto_157552 ?auto_157563 ) ) ( not ( = ?auto_157553 ?auto_157554 ) ) ( not ( = ?auto_157553 ?auto_157555 ) ) ( not ( = ?auto_157553 ?auto_157556 ) ) ( not ( = ?auto_157553 ?auto_157557 ) ) ( not ( = ?auto_157553 ?auto_157558 ) ) ( not ( = ?auto_157553 ?auto_157559 ) ) ( not ( = ?auto_157553 ?auto_157560 ) ) ( not ( = ?auto_157553 ?auto_157561 ) ) ( not ( = ?auto_157553 ?auto_157562 ) ) ( not ( = ?auto_157553 ?auto_157563 ) ) ( not ( = ?auto_157554 ?auto_157555 ) ) ( not ( = ?auto_157554 ?auto_157556 ) ) ( not ( = ?auto_157554 ?auto_157557 ) ) ( not ( = ?auto_157554 ?auto_157558 ) ) ( not ( = ?auto_157554 ?auto_157559 ) ) ( not ( = ?auto_157554 ?auto_157560 ) ) ( not ( = ?auto_157554 ?auto_157561 ) ) ( not ( = ?auto_157554 ?auto_157562 ) ) ( not ( = ?auto_157554 ?auto_157563 ) ) ( not ( = ?auto_157555 ?auto_157556 ) ) ( not ( = ?auto_157555 ?auto_157557 ) ) ( not ( = ?auto_157555 ?auto_157558 ) ) ( not ( = ?auto_157555 ?auto_157559 ) ) ( not ( = ?auto_157555 ?auto_157560 ) ) ( not ( = ?auto_157555 ?auto_157561 ) ) ( not ( = ?auto_157555 ?auto_157562 ) ) ( not ( = ?auto_157555 ?auto_157563 ) ) ( not ( = ?auto_157556 ?auto_157557 ) ) ( not ( = ?auto_157556 ?auto_157558 ) ) ( not ( = ?auto_157556 ?auto_157559 ) ) ( not ( = ?auto_157556 ?auto_157560 ) ) ( not ( = ?auto_157556 ?auto_157561 ) ) ( not ( = ?auto_157556 ?auto_157562 ) ) ( not ( = ?auto_157556 ?auto_157563 ) ) ( not ( = ?auto_157557 ?auto_157558 ) ) ( not ( = ?auto_157557 ?auto_157559 ) ) ( not ( = ?auto_157557 ?auto_157560 ) ) ( not ( = ?auto_157557 ?auto_157561 ) ) ( not ( = ?auto_157557 ?auto_157562 ) ) ( not ( = ?auto_157557 ?auto_157563 ) ) ( not ( = ?auto_157558 ?auto_157559 ) ) ( not ( = ?auto_157558 ?auto_157560 ) ) ( not ( = ?auto_157558 ?auto_157561 ) ) ( not ( = ?auto_157558 ?auto_157562 ) ) ( not ( = ?auto_157558 ?auto_157563 ) ) ( not ( = ?auto_157559 ?auto_157560 ) ) ( not ( = ?auto_157559 ?auto_157561 ) ) ( not ( = ?auto_157559 ?auto_157562 ) ) ( not ( = ?auto_157559 ?auto_157563 ) ) ( not ( = ?auto_157560 ?auto_157561 ) ) ( not ( = ?auto_157560 ?auto_157562 ) ) ( not ( = ?auto_157560 ?auto_157563 ) ) ( not ( = ?auto_157561 ?auto_157562 ) ) ( not ( = ?auto_157561 ?auto_157563 ) ) ( not ( = ?auto_157562 ?auto_157563 ) ) ( ON ?auto_157561 ?auto_157562 ) ( ON ?auto_157560 ?auto_157561 ) ( ON ?auto_157559 ?auto_157560 ) ( ON ?auto_157558 ?auto_157559 ) ( CLEAR ?auto_157556 ) ( ON ?auto_157557 ?auto_157558 ) ( CLEAR ?auto_157557 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_157552 ?auto_157553 ?auto_157554 ?auto_157555 ?auto_157556 ?auto_157557 )
      ( MAKE-11PILE ?auto_157552 ?auto_157553 ?auto_157554 ?auto_157555 ?auto_157556 ?auto_157557 ?auto_157558 ?auto_157559 ?auto_157560 ?auto_157561 ?auto_157562 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_157575 - BLOCK
      ?auto_157576 - BLOCK
      ?auto_157577 - BLOCK
      ?auto_157578 - BLOCK
      ?auto_157579 - BLOCK
      ?auto_157580 - BLOCK
      ?auto_157581 - BLOCK
      ?auto_157582 - BLOCK
      ?auto_157583 - BLOCK
      ?auto_157584 - BLOCK
      ?auto_157585 - BLOCK
    )
    :vars
    (
      ?auto_157586 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157585 ?auto_157586 ) ( ON-TABLE ?auto_157575 ) ( ON ?auto_157576 ?auto_157575 ) ( ON ?auto_157577 ?auto_157576 ) ( ON ?auto_157578 ?auto_157577 ) ( not ( = ?auto_157575 ?auto_157576 ) ) ( not ( = ?auto_157575 ?auto_157577 ) ) ( not ( = ?auto_157575 ?auto_157578 ) ) ( not ( = ?auto_157575 ?auto_157579 ) ) ( not ( = ?auto_157575 ?auto_157580 ) ) ( not ( = ?auto_157575 ?auto_157581 ) ) ( not ( = ?auto_157575 ?auto_157582 ) ) ( not ( = ?auto_157575 ?auto_157583 ) ) ( not ( = ?auto_157575 ?auto_157584 ) ) ( not ( = ?auto_157575 ?auto_157585 ) ) ( not ( = ?auto_157575 ?auto_157586 ) ) ( not ( = ?auto_157576 ?auto_157577 ) ) ( not ( = ?auto_157576 ?auto_157578 ) ) ( not ( = ?auto_157576 ?auto_157579 ) ) ( not ( = ?auto_157576 ?auto_157580 ) ) ( not ( = ?auto_157576 ?auto_157581 ) ) ( not ( = ?auto_157576 ?auto_157582 ) ) ( not ( = ?auto_157576 ?auto_157583 ) ) ( not ( = ?auto_157576 ?auto_157584 ) ) ( not ( = ?auto_157576 ?auto_157585 ) ) ( not ( = ?auto_157576 ?auto_157586 ) ) ( not ( = ?auto_157577 ?auto_157578 ) ) ( not ( = ?auto_157577 ?auto_157579 ) ) ( not ( = ?auto_157577 ?auto_157580 ) ) ( not ( = ?auto_157577 ?auto_157581 ) ) ( not ( = ?auto_157577 ?auto_157582 ) ) ( not ( = ?auto_157577 ?auto_157583 ) ) ( not ( = ?auto_157577 ?auto_157584 ) ) ( not ( = ?auto_157577 ?auto_157585 ) ) ( not ( = ?auto_157577 ?auto_157586 ) ) ( not ( = ?auto_157578 ?auto_157579 ) ) ( not ( = ?auto_157578 ?auto_157580 ) ) ( not ( = ?auto_157578 ?auto_157581 ) ) ( not ( = ?auto_157578 ?auto_157582 ) ) ( not ( = ?auto_157578 ?auto_157583 ) ) ( not ( = ?auto_157578 ?auto_157584 ) ) ( not ( = ?auto_157578 ?auto_157585 ) ) ( not ( = ?auto_157578 ?auto_157586 ) ) ( not ( = ?auto_157579 ?auto_157580 ) ) ( not ( = ?auto_157579 ?auto_157581 ) ) ( not ( = ?auto_157579 ?auto_157582 ) ) ( not ( = ?auto_157579 ?auto_157583 ) ) ( not ( = ?auto_157579 ?auto_157584 ) ) ( not ( = ?auto_157579 ?auto_157585 ) ) ( not ( = ?auto_157579 ?auto_157586 ) ) ( not ( = ?auto_157580 ?auto_157581 ) ) ( not ( = ?auto_157580 ?auto_157582 ) ) ( not ( = ?auto_157580 ?auto_157583 ) ) ( not ( = ?auto_157580 ?auto_157584 ) ) ( not ( = ?auto_157580 ?auto_157585 ) ) ( not ( = ?auto_157580 ?auto_157586 ) ) ( not ( = ?auto_157581 ?auto_157582 ) ) ( not ( = ?auto_157581 ?auto_157583 ) ) ( not ( = ?auto_157581 ?auto_157584 ) ) ( not ( = ?auto_157581 ?auto_157585 ) ) ( not ( = ?auto_157581 ?auto_157586 ) ) ( not ( = ?auto_157582 ?auto_157583 ) ) ( not ( = ?auto_157582 ?auto_157584 ) ) ( not ( = ?auto_157582 ?auto_157585 ) ) ( not ( = ?auto_157582 ?auto_157586 ) ) ( not ( = ?auto_157583 ?auto_157584 ) ) ( not ( = ?auto_157583 ?auto_157585 ) ) ( not ( = ?auto_157583 ?auto_157586 ) ) ( not ( = ?auto_157584 ?auto_157585 ) ) ( not ( = ?auto_157584 ?auto_157586 ) ) ( not ( = ?auto_157585 ?auto_157586 ) ) ( ON ?auto_157584 ?auto_157585 ) ( ON ?auto_157583 ?auto_157584 ) ( ON ?auto_157582 ?auto_157583 ) ( ON ?auto_157581 ?auto_157582 ) ( ON ?auto_157580 ?auto_157581 ) ( CLEAR ?auto_157578 ) ( ON ?auto_157579 ?auto_157580 ) ( CLEAR ?auto_157579 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_157575 ?auto_157576 ?auto_157577 ?auto_157578 ?auto_157579 )
      ( MAKE-11PILE ?auto_157575 ?auto_157576 ?auto_157577 ?auto_157578 ?auto_157579 ?auto_157580 ?auto_157581 ?auto_157582 ?auto_157583 ?auto_157584 ?auto_157585 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_157598 - BLOCK
      ?auto_157599 - BLOCK
      ?auto_157600 - BLOCK
      ?auto_157601 - BLOCK
      ?auto_157602 - BLOCK
      ?auto_157603 - BLOCK
      ?auto_157604 - BLOCK
      ?auto_157605 - BLOCK
      ?auto_157606 - BLOCK
      ?auto_157607 - BLOCK
      ?auto_157608 - BLOCK
    )
    :vars
    (
      ?auto_157609 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157608 ?auto_157609 ) ( ON-TABLE ?auto_157598 ) ( ON ?auto_157599 ?auto_157598 ) ( ON ?auto_157600 ?auto_157599 ) ( ON ?auto_157601 ?auto_157600 ) ( not ( = ?auto_157598 ?auto_157599 ) ) ( not ( = ?auto_157598 ?auto_157600 ) ) ( not ( = ?auto_157598 ?auto_157601 ) ) ( not ( = ?auto_157598 ?auto_157602 ) ) ( not ( = ?auto_157598 ?auto_157603 ) ) ( not ( = ?auto_157598 ?auto_157604 ) ) ( not ( = ?auto_157598 ?auto_157605 ) ) ( not ( = ?auto_157598 ?auto_157606 ) ) ( not ( = ?auto_157598 ?auto_157607 ) ) ( not ( = ?auto_157598 ?auto_157608 ) ) ( not ( = ?auto_157598 ?auto_157609 ) ) ( not ( = ?auto_157599 ?auto_157600 ) ) ( not ( = ?auto_157599 ?auto_157601 ) ) ( not ( = ?auto_157599 ?auto_157602 ) ) ( not ( = ?auto_157599 ?auto_157603 ) ) ( not ( = ?auto_157599 ?auto_157604 ) ) ( not ( = ?auto_157599 ?auto_157605 ) ) ( not ( = ?auto_157599 ?auto_157606 ) ) ( not ( = ?auto_157599 ?auto_157607 ) ) ( not ( = ?auto_157599 ?auto_157608 ) ) ( not ( = ?auto_157599 ?auto_157609 ) ) ( not ( = ?auto_157600 ?auto_157601 ) ) ( not ( = ?auto_157600 ?auto_157602 ) ) ( not ( = ?auto_157600 ?auto_157603 ) ) ( not ( = ?auto_157600 ?auto_157604 ) ) ( not ( = ?auto_157600 ?auto_157605 ) ) ( not ( = ?auto_157600 ?auto_157606 ) ) ( not ( = ?auto_157600 ?auto_157607 ) ) ( not ( = ?auto_157600 ?auto_157608 ) ) ( not ( = ?auto_157600 ?auto_157609 ) ) ( not ( = ?auto_157601 ?auto_157602 ) ) ( not ( = ?auto_157601 ?auto_157603 ) ) ( not ( = ?auto_157601 ?auto_157604 ) ) ( not ( = ?auto_157601 ?auto_157605 ) ) ( not ( = ?auto_157601 ?auto_157606 ) ) ( not ( = ?auto_157601 ?auto_157607 ) ) ( not ( = ?auto_157601 ?auto_157608 ) ) ( not ( = ?auto_157601 ?auto_157609 ) ) ( not ( = ?auto_157602 ?auto_157603 ) ) ( not ( = ?auto_157602 ?auto_157604 ) ) ( not ( = ?auto_157602 ?auto_157605 ) ) ( not ( = ?auto_157602 ?auto_157606 ) ) ( not ( = ?auto_157602 ?auto_157607 ) ) ( not ( = ?auto_157602 ?auto_157608 ) ) ( not ( = ?auto_157602 ?auto_157609 ) ) ( not ( = ?auto_157603 ?auto_157604 ) ) ( not ( = ?auto_157603 ?auto_157605 ) ) ( not ( = ?auto_157603 ?auto_157606 ) ) ( not ( = ?auto_157603 ?auto_157607 ) ) ( not ( = ?auto_157603 ?auto_157608 ) ) ( not ( = ?auto_157603 ?auto_157609 ) ) ( not ( = ?auto_157604 ?auto_157605 ) ) ( not ( = ?auto_157604 ?auto_157606 ) ) ( not ( = ?auto_157604 ?auto_157607 ) ) ( not ( = ?auto_157604 ?auto_157608 ) ) ( not ( = ?auto_157604 ?auto_157609 ) ) ( not ( = ?auto_157605 ?auto_157606 ) ) ( not ( = ?auto_157605 ?auto_157607 ) ) ( not ( = ?auto_157605 ?auto_157608 ) ) ( not ( = ?auto_157605 ?auto_157609 ) ) ( not ( = ?auto_157606 ?auto_157607 ) ) ( not ( = ?auto_157606 ?auto_157608 ) ) ( not ( = ?auto_157606 ?auto_157609 ) ) ( not ( = ?auto_157607 ?auto_157608 ) ) ( not ( = ?auto_157607 ?auto_157609 ) ) ( not ( = ?auto_157608 ?auto_157609 ) ) ( ON ?auto_157607 ?auto_157608 ) ( ON ?auto_157606 ?auto_157607 ) ( ON ?auto_157605 ?auto_157606 ) ( ON ?auto_157604 ?auto_157605 ) ( ON ?auto_157603 ?auto_157604 ) ( CLEAR ?auto_157601 ) ( ON ?auto_157602 ?auto_157603 ) ( CLEAR ?auto_157602 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_157598 ?auto_157599 ?auto_157600 ?auto_157601 ?auto_157602 )
      ( MAKE-11PILE ?auto_157598 ?auto_157599 ?auto_157600 ?auto_157601 ?auto_157602 ?auto_157603 ?auto_157604 ?auto_157605 ?auto_157606 ?auto_157607 ?auto_157608 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_157621 - BLOCK
      ?auto_157622 - BLOCK
      ?auto_157623 - BLOCK
      ?auto_157624 - BLOCK
      ?auto_157625 - BLOCK
      ?auto_157626 - BLOCK
      ?auto_157627 - BLOCK
      ?auto_157628 - BLOCK
      ?auto_157629 - BLOCK
      ?auto_157630 - BLOCK
      ?auto_157631 - BLOCK
    )
    :vars
    (
      ?auto_157632 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157631 ?auto_157632 ) ( ON-TABLE ?auto_157621 ) ( ON ?auto_157622 ?auto_157621 ) ( ON ?auto_157623 ?auto_157622 ) ( not ( = ?auto_157621 ?auto_157622 ) ) ( not ( = ?auto_157621 ?auto_157623 ) ) ( not ( = ?auto_157621 ?auto_157624 ) ) ( not ( = ?auto_157621 ?auto_157625 ) ) ( not ( = ?auto_157621 ?auto_157626 ) ) ( not ( = ?auto_157621 ?auto_157627 ) ) ( not ( = ?auto_157621 ?auto_157628 ) ) ( not ( = ?auto_157621 ?auto_157629 ) ) ( not ( = ?auto_157621 ?auto_157630 ) ) ( not ( = ?auto_157621 ?auto_157631 ) ) ( not ( = ?auto_157621 ?auto_157632 ) ) ( not ( = ?auto_157622 ?auto_157623 ) ) ( not ( = ?auto_157622 ?auto_157624 ) ) ( not ( = ?auto_157622 ?auto_157625 ) ) ( not ( = ?auto_157622 ?auto_157626 ) ) ( not ( = ?auto_157622 ?auto_157627 ) ) ( not ( = ?auto_157622 ?auto_157628 ) ) ( not ( = ?auto_157622 ?auto_157629 ) ) ( not ( = ?auto_157622 ?auto_157630 ) ) ( not ( = ?auto_157622 ?auto_157631 ) ) ( not ( = ?auto_157622 ?auto_157632 ) ) ( not ( = ?auto_157623 ?auto_157624 ) ) ( not ( = ?auto_157623 ?auto_157625 ) ) ( not ( = ?auto_157623 ?auto_157626 ) ) ( not ( = ?auto_157623 ?auto_157627 ) ) ( not ( = ?auto_157623 ?auto_157628 ) ) ( not ( = ?auto_157623 ?auto_157629 ) ) ( not ( = ?auto_157623 ?auto_157630 ) ) ( not ( = ?auto_157623 ?auto_157631 ) ) ( not ( = ?auto_157623 ?auto_157632 ) ) ( not ( = ?auto_157624 ?auto_157625 ) ) ( not ( = ?auto_157624 ?auto_157626 ) ) ( not ( = ?auto_157624 ?auto_157627 ) ) ( not ( = ?auto_157624 ?auto_157628 ) ) ( not ( = ?auto_157624 ?auto_157629 ) ) ( not ( = ?auto_157624 ?auto_157630 ) ) ( not ( = ?auto_157624 ?auto_157631 ) ) ( not ( = ?auto_157624 ?auto_157632 ) ) ( not ( = ?auto_157625 ?auto_157626 ) ) ( not ( = ?auto_157625 ?auto_157627 ) ) ( not ( = ?auto_157625 ?auto_157628 ) ) ( not ( = ?auto_157625 ?auto_157629 ) ) ( not ( = ?auto_157625 ?auto_157630 ) ) ( not ( = ?auto_157625 ?auto_157631 ) ) ( not ( = ?auto_157625 ?auto_157632 ) ) ( not ( = ?auto_157626 ?auto_157627 ) ) ( not ( = ?auto_157626 ?auto_157628 ) ) ( not ( = ?auto_157626 ?auto_157629 ) ) ( not ( = ?auto_157626 ?auto_157630 ) ) ( not ( = ?auto_157626 ?auto_157631 ) ) ( not ( = ?auto_157626 ?auto_157632 ) ) ( not ( = ?auto_157627 ?auto_157628 ) ) ( not ( = ?auto_157627 ?auto_157629 ) ) ( not ( = ?auto_157627 ?auto_157630 ) ) ( not ( = ?auto_157627 ?auto_157631 ) ) ( not ( = ?auto_157627 ?auto_157632 ) ) ( not ( = ?auto_157628 ?auto_157629 ) ) ( not ( = ?auto_157628 ?auto_157630 ) ) ( not ( = ?auto_157628 ?auto_157631 ) ) ( not ( = ?auto_157628 ?auto_157632 ) ) ( not ( = ?auto_157629 ?auto_157630 ) ) ( not ( = ?auto_157629 ?auto_157631 ) ) ( not ( = ?auto_157629 ?auto_157632 ) ) ( not ( = ?auto_157630 ?auto_157631 ) ) ( not ( = ?auto_157630 ?auto_157632 ) ) ( not ( = ?auto_157631 ?auto_157632 ) ) ( ON ?auto_157630 ?auto_157631 ) ( ON ?auto_157629 ?auto_157630 ) ( ON ?auto_157628 ?auto_157629 ) ( ON ?auto_157627 ?auto_157628 ) ( ON ?auto_157626 ?auto_157627 ) ( ON ?auto_157625 ?auto_157626 ) ( CLEAR ?auto_157623 ) ( ON ?auto_157624 ?auto_157625 ) ( CLEAR ?auto_157624 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_157621 ?auto_157622 ?auto_157623 ?auto_157624 )
      ( MAKE-11PILE ?auto_157621 ?auto_157622 ?auto_157623 ?auto_157624 ?auto_157625 ?auto_157626 ?auto_157627 ?auto_157628 ?auto_157629 ?auto_157630 ?auto_157631 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_157644 - BLOCK
      ?auto_157645 - BLOCK
      ?auto_157646 - BLOCK
      ?auto_157647 - BLOCK
      ?auto_157648 - BLOCK
      ?auto_157649 - BLOCK
      ?auto_157650 - BLOCK
      ?auto_157651 - BLOCK
      ?auto_157652 - BLOCK
      ?auto_157653 - BLOCK
      ?auto_157654 - BLOCK
    )
    :vars
    (
      ?auto_157655 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157654 ?auto_157655 ) ( ON-TABLE ?auto_157644 ) ( ON ?auto_157645 ?auto_157644 ) ( ON ?auto_157646 ?auto_157645 ) ( not ( = ?auto_157644 ?auto_157645 ) ) ( not ( = ?auto_157644 ?auto_157646 ) ) ( not ( = ?auto_157644 ?auto_157647 ) ) ( not ( = ?auto_157644 ?auto_157648 ) ) ( not ( = ?auto_157644 ?auto_157649 ) ) ( not ( = ?auto_157644 ?auto_157650 ) ) ( not ( = ?auto_157644 ?auto_157651 ) ) ( not ( = ?auto_157644 ?auto_157652 ) ) ( not ( = ?auto_157644 ?auto_157653 ) ) ( not ( = ?auto_157644 ?auto_157654 ) ) ( not ( = ?auto_157644 ?auto_157655 ) ) ( not ( = ?auto_157645 ?auto_157646 ) ) ( not ( = ?auto_157645 ?auto_157647 ) ) ( not ( = ?auto_157645 ?auto_157648 ) ) ( not ( = ?auto_157645 ?auto_157649 ) ) ( not ( = ?auto_157645 ?auto_157650 ) ) ( not ( = ?auto_157645 ?auto_157651 ) ) ( not ( = ?auto_157645 ?auto_157652 ) ) ( not ( = ?auto_157645 ?auto_157653 ) ) ( not ( = ?auto_157645 ?auto_157654 ) ) ( not ( = ?auto_157645 ?auto_157655 ) ) ( not ( = ?auto_157646 ?auto_157647 ) ) ( not ( = ?auto_157646 ?auto_157648 ) ) ( not ( = ?auto_157646 ?auto_157649 ) ) ( not ( = ?auto_157646 ?auto_157650 ) ) ( not ( = ?auto_157646 ?auto_157651 ) ) ( not ( = ?auto_157646 ?auto_157652 ) ) ( not ( = ?auto_157646 ?auto_157653 ) ) ( not ( = ?auto_157646 ?auto_157654 ) ) ( not ( = ?auto_157646 ?auto_157655 ) ) ( not ( = ?auto_157647 ?auto_157648 ) ) ( not ( = ?auto_157647 ?auto_157649 ) ) ( not ( = ?auto_157647 ?auto_157650 ) ) ( not ( = ?auto_157647 ?auto_157651 ) ) ( not ( = ?auto_157647 ?auto_157652 ) ) ( not ( = ?auto_157647 ?auto_157653 ) ) ( not ( = ?auto_157647 ?auto_157654 ) ) ( not ( = ?auto_157647 ?auto_157655 ) ) ( not ( = ?auto_157648 ?auto_157649 ) ) ( not ( = ?auto_157648 ?auto_157650 ) ) ( not ( = ?auto_157648 ?auto_157651 ) ) ( not ( = ?auto_157648 ?auto_157652 ) ) ( not ( = ?auto_157648 ?auto_157653 ) ) ( not ( = ?auto_157648 ?auto_157654 ) ) ( not ( = ?auto_157648 ?auto_157655 ) ) ( not ( = ?auto_157649 ?auto_157650 ) ) ( not ( = ?auto_157649 ?auto_157651 ) ) ( not ( = ?auto_157649 ?auto_157652 ) ) ( not ( = ?auto_157649 ?auto_157653 ) ) ( not ( = ?auto_157649 ?auto_157654 ) ) ( not ( = ?auto_157649 ?auto_157655 ) ) ( not ( = ?auto_157650 ?auto_157651 ) ) ( not ( = ?auto_157650 ?auto_157652 ) ) ( not ( = ?auto_157650 ?auto_157653 ) ) ( not ( = ?auto_157650 ?auto_157654 ) ) ( not ( = ?auto_157650 ?auto_157655 ) ) ( not ( = ?auto_157651 ?auto_157652 ) ) ( not ( = ?auto_157651 ?auto_157653 ) ) ( not ( = ?auto_157651 ?auto_157654 ) ) ( not ( = ?auto_157651 ?auto_157655 ) ) ( not ( = ?auto_157652 ?auto_157653 ) ) ( not ( = ?auto_157652 ?auto_157654 ) ) ( not ( = ?auto_157652 ?auto_157655 ) ) ( not ( = ?auto_157653 ?auto_157654 ) ) ( not ( = ?auto_157653 ?auto_157655 ) ) ( not ( = ?auto_157654 ?auto_157655 ) ) ( ON ?auto_157653 ?auto_157654 ) ( ON ?auto_157652 ?auto_157653 ) ( ON ?auto_157651 ?auto_157652 ) ( ON ?auto_157650 ?auto_157651 ) ( ON ?auto_157649 ?auto_157650 ) ( ON ?auto_157648 ?auto_157649 ) ( CLEAR ?auto_157646 ) ( ON ?auto_157647 ?auto_157648 ) ( CLEAR ?auto_157647 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_157644 ?auto_157645 ?auto_157646 ?auto_157647 )
      ( MAKE-11PILE ?auto_157644 ?auto_157645 ?auto_157646 ?auto_157647 ?auto_157648 ?auto_157649 ?auto_157650 ?auto_157651 ?auto_157652 ?auto_157653 ?auto_157654 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_157667 - BLOCK
      ?auto_157668 - BLOCK
      ?auto_157669 - BLOCK
      ?auto_157670 - BLOCK
      ?auto_157671 - BLOCK
      ?auto_157672 - BLOCK
      ?auto_157673 - BLOCK
      ?auto_157674 - BLOCK
      ?auto_157675 - BLOCK
      ?auto_157676 - BLOCK
      ?auto_157677 - BLOCK
    )
    :vars
    (
      ?auto_157678 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157677 ?auto_157678 ) ( ON-TABLE ?auto_157667 ) ( ON ?auto_157668 ?auto_157667 ) ( not ( = ?auto_157667 ?auto_157668 ) ) ( not ( = ?auto_157667 ?auto_157669 ) ) ( not ( = ?auto_157667 ?auto_157670 ) ) ( not ( = ?auto_157667 ?auto_157671 ) ) ( not ( = ?auto_157667 ?auto_157672 ) ) ( not ( = ?auto_157667 ?auto_157673 ) ) ( not ( = ?auto_157667 ?auto_157674 ) ) ( not ( = ?auto_157667 ?auto_157675 ) ) ( not ( = ?auto_157667 ?auto_157676 ) ) ( not ( = ?auto_157667 ?auto_157677 ) ) ( not ( = ?auto_157667 ?auto_157678 ) ) ( not ( = ?auto_157668 ?auto_157669 ) ) ( not ( = ?auto_157668 ?auto_157670 ) ) ( not ( = ?auto_157668 ?auto_157671 ) ) ( not ( = ?auto_157668 ?auto_157672 ) ) ( not ( = ?auto_157668 ?auto_157673 ) ) ( not ( = ?auto_157668 ?auto_157674 ) ) ( not ( = ?auto_157668 ?auto_157675 ) ) ( not ( = ?auto_157668 ?auto_157676 ) ) ( not ( = ?auto_157668 ?auto_157677 ) ) ( not ( = ?auto_157668 ?auto_157678 ) ) ( not ( = ?auto_157669 ?auto_157670 ) ) ( not ( = ?auto_157669 ?auto_157671 ) ) ( not ( = ?auto_157669 ?auto_157672 ) ) ( not ( = ?auto_157669 ?auto_157673 ) ) ( not ( = ?auto_157669 ?auto_157674 ) ) ( not ( = ?auto_157669 ?auto_157675 ) ) ( not ( = ?auto_157669 ?auto_157676 ) ) ( not ( = ?auto_157669 ?auto_157677 ) ) ( not ( = ?auto_157669 ?auto_157678 ) ) ( not ( = ?auto_157670 ?auto_157671 ) ) ( not ( = ?auto_157670 ?auto_157672 ) ) ( not ( = ?auto_157670 ?auto_157673 ) ) ( not ( = ?auto_157670 ?auto_157674 ) ) ( not ( = ?auto_157670 ?auto_157675 ) ) ( not ( = ?auto_157670 ?auto_157676 ) ) ( not ( = ?auto_157670 ?auto_157677 ) ) ( not ( = ?auto_157670 ?auto_157678 ) ) ( not ( = ?auto_157671 ?auto_157672 ) ) ( not ( = ?auto_157671 ?auto_157673 ) ) ( not ( = ?auto_157671 ?auto_157674 ) ) ( not ( = ?auto_157671 ?auto_157675 ) ) ( not ( = ?auto_157671 ?auto_157676 ) ) ( not ( = ?auto_157671 ?auto_157677 ) ) ( not ( = ?auto_157671 ?auto_157678 ) ) ( not ( = ?auto_157672 ?auto_157673 ) ) ( not ( = ?auto_157672 ?auto_157674 ) ) ( not ( = ?auto_157672 ?auto_157675 ) ) ( not ( = ?auto_157672 ?auto_157676 ) ) ( not ( = ?auto_157672 ?auto_157677 ) ) ( not ( = ?auto_157672 ?auto_157678 ) ) ( not ( = ?auto_157673 ?auto_157674 ) ) ( not ( = ?auto_157673 ?auto_157675 ) ) ( not ( = ?auto_157673 ?auto_157676 ) ) ( not ( = ?auto_157673 ?auto_157677 ) ) ( not ( = ?auto_157673 ?auto_157678 ) ) ( not ( = ?auto_157674 ?auto_157675 ) ) ( not ( = ?auto_157674 ?auto_157676 ) ) ( not ( = ?auto_157674 ?auto_157677 ) ) ( not ( = ?auto_157674 ?auto_157678 ) ) ( not ( = ?auto_157675 ?auto_157676 ) ) ( not ( = ?auto_157675 ?auto_157677 ) ) ( not ( = ?auto_157675 ?auto_157678 ) ) ( not ( = ?auto_157676 ?auto_157677 ) ) ( not ( = ?auto_157676 ?auto_157678 ) ) ( not ( = ?auto_157677 ?auto_157678 ) ) ( ON ?auto_157676 ?auto_157677 ) ( ON ?auto_157675 ?auto_157676 ) ( ON ?auto_157674 ?auto_157675 ) ( ON ?auto_157673 ?auto_157674 ) ( ON ?auto_157672 ?auto_157673 ) ( ON ?auto_157671 ?auto_157672 ) ( ON ?auto_157670 ?auto_157671 ) ( CLEAR ?auto_157668 ) ( ON ?auto_157669 ?auto_157670 ) ( CLEAR ?auto_157669 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_157667 ?auto_157668 ?auto_157669 )
      ( MAKE-11PILE ?auto_157667 ?auto_157668 ?auto_157669 ?auto_157670 ?auto_157671 ?auto_157672 ?auto_157673 ?auto_157674 ?auto_157675 ?auto_157676 ?auto_157677 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_157690 - BLOCK
      ?auto_157691 - BLOCK
      ?auto_157692 - BLOCK
      ?auto_157693 - BLOCK
      ?auto_157694 - BLOCK
      ?auto_157695 - BLOCK
      ?auto_157696 - BLOCK
      ?auto_157697 - BLOCK
      ?auto_157698 - BLOCK
      ?auto_157699 - BLOCK
      ?auto_157700 - BLOCK
    )
    :vars
    (
      ?auto_157701 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157700 ?auto_157701 ) ( ON-TABLE ?auto_157690 ) ( ON ?auto_157691 ?auto_157690 ) ( not ( = ?auto_157690 ?auto_157691 ) ) ( not ( = ?auto_157690 ?auto_157692 ) ) ( not ( = ?auto_157690 ?auto_157693 ) ) ( not ( = ?auto_157690 ?auto_157694 ) ) ( not ( = ?auto_157690 ?auto_157695 ) ) ( not ( = ?auto_157690 ?auto_157696 ) ) ( not ( = ?auto_157690 ?auto_157697 ) ) ( not ( = ?auto_157690 ?auto_157698 ) ) ( not ( = ?auto_157690 ?auto_157699 ) ) ( not ( = ?auto_157690 ?auto_157700 ) ) ( not ( = ?auto_157690 ?auto_157701 ) ) ( not ( = ?auto_157691 ?auto_157692 ) ) ( not ( = ?auto_157691 ?auto_157693 ) ) ( not ( = ?auto_157691 ?auto_157694 ) ) ( not ( = ?auto_157691 ?auto_157695 ) ) ( not ( = ?auto_157691 ?auto_157696 ) ) ( not ( = ?auto_157691 ?auto_157697 ) ) ( not ( = ?auto_157691 ?auto_157698 ) ) ( not ( = ?auto_157691 ?auto_157699 ) ) ( not ( = ?auto_157691 ?auto_157700 ) ) ( not ( = ?auto_157691 ?auto_157701 ) ) ( not ( = ?auto_157692 ?auto_157693 ) ) ( not ( = ?auto_157692 ?auto_157694 ) ) ( not ( = ?auto_157692 ?auto_157695 ) ) ( not ( = ?auto_157692 ?auto_157696 ) ) ( not ( = ?auto_157692 ?auto_157697 ) ) ( not ( = ?auto_157692 ?auto_157698 ) ) ( not ( = ?auto_157692 ?auto_157699 ) ) ( not ( = ?auto_157692 ?auto_157700 ) ) ( not ( = ?auto_157692 ?auto_157701 ) ) ( not ( = ?auto_157693 ?auto_157694 ) ) ( not ( = ?auto_157693 ?auto_157695 ) ) ( not ( = ?auto_157693 ?auto_157696 ) ) ( not ( = ?auto_157693 ?auto_157697 ) ) ( not ( = ?auto_157693 ?auto_157698 ) ) ( not ( = ?auto_157693 ?auto_157699 ) ) ( not ( = ?auto_157693 ?auto_157700 ) ) ( not ( = ?auto_157693 ?auto_157701 ) ) ( not ( = ?auto_157694 ?auto_157695 ) ) ( not ( = ?auto_157694 ?auto_157696 ) ) ( not ( = ?auto_157694 ?auto_157697 ) ) ( not ( = ?auto_157694 ?auto_157698 ) ) ( not ( = ?auto_157694 ?auto_157699 ) ) ( not ( = ?auto_157694 ?auto_157700 ) ) ( not ( = ?auto_157694 ?auto_157701 ) ) ( not ( = ?auto_157695 ?auto_157696 ) ) ( not ( = ?auto_157695 ?auto_157697 ) ) ( not ( = ?auto_157695 ?auto_157698 ) ) ( not ( = ?auto_157695 ?auto_157699 ) ) ( not ( = ?auto_157695 ?auto_157700 ) ) ( not ( = ?auto_157695 ?auto_157701 ) ) ( not ( = ?auto_157696 ?auto_157697 ) ) ( not ( = ?auto_157696 ?auto_157698 ) ) ( not ( = ?auto_157696 ?auto_157699 ) ) ( not ( = ?auto_157696 ?auto_157700 ) ) ( not ( = ?auto_157696 ?auto_157701 ) ) ( not ( = ?auto_157697 ?auto_157698 ) ) ( not ( = ?auto_157697 ?auto_157699 ) ) ( not ( = ?auto_157697 ?auto_157700 ) ) ( not ( = ?auto_157697 ?auto_157701 ) ) ( not ( = ?auto_157698 ?auto_157699 ) ) ( not ( = ?auto_157698 ?auto_157700 ) ) ( not ( = ?auto_157698 ?auto_157701 ) ) ( not ( = ?auto_157699 ?auto_157700 ) ) ( not ( = ?auto_157699 ?auto_157701 ) ) ( not ( = ?auto_157700 ?auto_157701 ) ) ( ON ?auto_157699 ?auto_157700 ) ( ON ?auto_157698 ?auto_157699 ) ( ON ?auto_157697 ?auto_157698 ) ( ON ?auto_157696 ?auto_157697 ) ( ON ?auto_157695 ?auto_157696 ) ( ON ?auto_157694 ?auto_157695 ) ( ON ?auto_157693 ?auto_157694 ) ( CLEAR ?auto_157691 ) ( ON ?auto_157692 ?auto_157693 ) ( CLEAR ?auto_157692 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_157690 ?auto_157691 ?auto_157692 )
      ( MAKE-11PILE ?auto_157690 ?auto_157691 ?auto_157692 ?auto_157693 ?auto_157694 ?auto_157695 ?auto_157696 ?auto_157697 ?auto_157698 ?auto_157699 ?auto_157700 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_157713 - BLOCK
      ?auto_157714 - BLOCK
      ?auto_157715 - BLOCK
      ?auto_157716 - BLOCK
      ?auto_157717 - BLOCK
      ?auto_157718 - BLOCK
      ?auto_157719 - BLOCK
      ?auto_157720 - BLOCK
      ?auto_157721 - BLOCK
      ?auto_157722 - BLOCK
      ?auto_157723 - BLOCK
    )
    :vars
    (
      ?auto_157724 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157723 ?auto_157724 ) ( ON-TABLE ?auto_157713 ) ( not ( = ?auto_157713 ?auto_157714 ) ) ( not ( = ?auto_157713 ?auto_157715 ) ) ( not ( = ?auto_157713 ?auto_157716 ) ) ( not ( = ?auto_157713 ?auto_157717 ) ) ( not ( = ?auto_157713 ?auto_157718 ) ) ( not ( = ?auto_157713 ?auto_157719 ) ) ( not ( = ?auto_157713 ?auto_157720 ) ) ( not ( = ?auto_157713 ?auto_157721 ) ) ( not ( = ?auto_157713 ?auto_157722 ) ) ( not ( = ?auto_157713 ?auto_157723 ) ) ( not ( = ?auto_157713 ?auto_157724 ) ) ( not ( = ?auto_157714 ?auto_157715 ) ) ( not ( = ?auto_157714 ?auto_157716 ) ) ( not ( = ?auto_157714 ?auto_157717 ) ) ( not ( = ?auto_157714 ?auto_157718 ) ) ( not ( = ?auto_157714 ?auto_157719 ) ) ( not ( = ?auto_157714 ?auto_157720 ) ) ( not ( = ?auto_157714 ?auto_157721 ) ) ( not ( = ?auto_157714 ?auto_157722 ) ) ( not ( = ?auto_157714 ?auto_157723 ) ) ( not ( = ?auto_157714 ?auto_157724 ) ) ( not ( = ?auto_157715 ?auto_157716 ) ) ( not ( = ?auto_157715 ?auto_157717 ) ) ( not ( = ?auto_157715 ?auto_157718 ) ) ( not ( = ?auto_157715 ?auto_157719 ) ) ( not ( = ?auto_157715 ?auto_157720 ) ) ( not ( = ?auto_157715 ?auto_157721 ) ) ( not ( = ?auto_157715 ?auto_157722 ) ) ( not ( = ?auto_157715 ?auto_157723 ) ) ( not ( = ?auto_157715 ?auto_157724 ) ) ( not ( = ?auto_157716 ?auto_157717 ) ) ( not ( = ?auto_157716 ?auto_157718 ) ) ( not ( = ?auto_157716 ?auto_157719 ) ) ( not ( = ?auto_157716 ?auto_157720 ) ) ( not ( = ?auto_157716 ?auto_157721 ) ) ( not ( = ?auto_157716 ?auto_157722 ) ) ( not ( = ?auto_157716 ?auto_157723 ) ) ( not ( = ?auto_157716 ?auto_157724 ) ) ( not ( = ?auto_157717 ?auto_157718 ) ) ( not ( = ?auto_157717 ?auto_157719 ) ) ( not ( = ?auto_157717 ?auto_157720 ) ) ( not ( = ?auto_157717 ?auto_157721 ) ) ( not ( = ?auto_157717 ?auto_157722 ) ) ( not ( = ?auto_157717 ?auto_157723 ) ) ( not ( = ?auto_157717 ?auto_157724 ) ) ( not ( = ?auto_157718 ?auto_157719 ) ) ( not ( = ?auto_157718 ?auto_157720 ) ) ( not ( = ?auto_157718 ?auto_157721 ) ) ( not ( = ?auto_157718 ?auto_157722 ) ) ( not ( = ?auto_157718 ?auto_157723 ) ) ( not ( = ?auto_157718 ?auto_157724 ) ) ( not ( = ?auto_157719 ?auto_157720 ) ) ( not ( = ?auto_157719 ?auto_157721 ) ) ( not ( = ?auto_157719 ?auto_157722 ) ) ( not ( = ?auto_157719 ?auto_157723 ) ) ( not ( = ?auto_157719 ?auto_157724 ) ) ( not ( = ?auto_157720 ?auto_157721 ) ) ( not ( = ?auto_157720 ?auto_157722 ) ) ( not ( = ?auto_157720 ?auto_157723 ) ) ( not ( = ?auto_157720 ?auto_157724 ) ) ( not ( = ?auto_157721 ?auto_157722 ) ) ( not ( = ?auto_157721 ?auto_157723 ) ) ( not ( = ?auto_157721 ?auto_157724 ) ) ( not ( = ?auto_157722 ?auto_157723 ) ) ( not ( = ?auto_157722 ?auto_157724 ) ) ( not ( = ?auto_157723 ?auto_157724 ) ) ( ON ?auto_157722 ?auto_157723 ) ( ON ?auto_157721 ?auto_157722 ) ( ON ?auto_157720 ?auto_157721 ) ( ON ?auto_157719 ?auto_157720 ) ( ON ?auto_157718 ?auto_157719 ) ( ON ?auto_157717 ?auto_157718 ) ( ON ?auto_157716 ?auto_157717 ) ( ON ?auto_157715 ?auto_157716 ) ( CLEAR ?auto_157713 ) ( ON ?auto_157714 ?auto_157715 ) ( CLEAR ?auto_157714 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_157713 ?auto_157714 )
      ( MAKE-11PILE ?auto_157713 ?auto_157714 ?auto_157715 ?auto_157716 ?auto_157717 ?auto_157718 ?auto_157719 ?auto_157720 ?auto_157721 ?auto_157722 ?auto_157723 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_157736 - BLOCK
      ?auto_157737 - BLOCK
      ?auto_157738 - BLOCK
      ?auto_157739 - BLOCK
      ?auto_157740 - BLOCK
      ?auto_157741 - BLOCK
      ?auto_157742 - BLOCK
      ?auto_157743 - BLOCK
      ?auto_157744 - BLOCK
      ?auto_157745 - BLOCK
      ?auto_157746 - BLOCK
    )
    :vars
    (
      ?auto_157747 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157746 ?auto_157747 ) ( ON-TABLE ?auto_157736 ) ( not ( = ?auto_157736 ?auto_157737 ) ) ( not ( = ?auto_157736 ?auto_157738 ) ) ( not ( = ?auto_157736 ?auto_157739 ) ) ( not ( = ?auto_157736 ?auto_157740 ) ) ( not ( = ?auto_157736 ?auto_157741 ) ) ( not ( = ?auto_157736 ?auto_157742 ) ) ( not ( = ?auto_157736 ?auto_157743 ) ) ( not ( = ?auto_157736 ?auto_157744 ) ) ( not ( = ?auto_157736 ?auto_157745 ) ) ( not ( = ?auto_157736 ?auto_157746 ) ) ( not ( = ?auto_157736 ?auto_157747 ) ) ( not ( = ?auto_157737 ?auto_157738 ) ) ( not ( = ?auto_157737 ?auto_157739 ) ) ( not ( = ?auto_157737 ?auto_157740 ) ) ( not ( = ?auto_157737 ?auto_157741 ) ) ( not ( = ?auto_157737 ?auto_157742 ) ) ( not ( = ?auto_157737 ?auto_157743 ) ) ( not ( = ?auto_157737 ?auto_157744 ) ) ( not ( = ?auto_157737 ?auto_157745 ) ) ( not ( = ?auto_157737 ?auto_157746 ) ) ( not ( = ?auto_157737 ?auto_157747 ) ) ( not ( = ?auto_157738 ?auto_157739 ) ) ( not ( = ?auto_157738 ?auto_157740 ) ) ( not ( = ?auto_157738 ?auto_157741 ) ) ( not ( = ?auto_157738 ?auto_157742 ) ) ( not ( = ?auto_157738 ?auto_157743 ) ) ( not ( = ?auto_157738 ?auto_157744 ) ) ( not ( = ?auto_157738 ?auto_157745 ) ) ( not ( = ?auto_157738 ?auto_157746 ) ) ( not ( = ?auto_157738 ?auto_157747 ) ) ( not ( = ?auto_157739 ?auto_157740 ) ) ( not ( = ?auto_157739 ?auto_157741 ) ) ( not ( = ?auto_157739 ?auto_157742 ) ) ( not ( = ?auto_157739 ?auto_157743 ) ) ( not ( = ?auto_157739 ?auto_157744 ) ) ( not ( = ?auto_157739 ?auto_157745 ) ) ( not ( = ?auto_157739 ?auto_157746 ) ) ( not ( = ?auto_157739 ?auto_157747 ) ) ( not ( = ?auto_157740 ?auto_157741 ) ) ( not ( = ?auto_157740 ?auto_157742 ) ) ( not ( = ?auto_157740 ?auto_157743 ) ) ( not ( = ?auto_157740 ?auto_157744 ) ) ( not ( = ?auto_157740 ?auto_157745 ) ) ( not ( = ?auto_157740 ?auto_157746 ) ) ( not ( = ?auto_157740 ?auto_157747 ) ) ( not ( = ?auto_157741 ?auto_157742 ) ) ( not ( = ?auto_157741 ?auto_157743 ) ) ( not ( = ?auto_157741 ?auto_157744 ) ) ( not ( = ?auto_157741 ?auto_157745 ) ) ( not ( = ?auto_157741 ?auto_157746 ) ) ( not ( = ?auto_157741 ?auto_157747 ) ) ( not ( = ?auto_157742 ?auto_157743 ) ) ( not ( = ?auto_157742 ?auto_157744 ) ) ( not ( = ?auto_157742 ?auto_157745 ) ) ( not ( = ?auto_157742 ?auto_157746 ) ) ( not ( = ?auto_157742 ?auto_157747 ) ) ( not ( = ?auto_157743 ?auto_157744 ) ) ( not ( = ?auto_157743 ?auto_157745 ) ) ( not ( = ?auto_157743 ?auto_157746 ) ) ( not ( = ?auto_157743 ?auto_157747 ) ) ( not ( = ?auto_157744 ?auto_157745 ) ) ( not ( = ?auto_157744 ?auto_157746 ) ) ( not ( = ?auto_157744 ?auto_157747 ) ) ( not ( = ?auto_157745 ?auto_157746 ) ) ( not ( = ?auto_157745 ?auto_157747 ) ) ( not ( = ?auto_157746 ?auto_157747 ) ) ( ON ?auto_157745 ?auto_157746 ) ( ON ?auto_157744 ?auto_157745 ) ( ON ?auto_157743 ?auto_157744 ) ( ON ?auto_157742 ?auto_157743 ) ( ON ?auto_157741 ?auto_157742 ) ( ON ?auto_157740 ?auto_157741 ) ( ON ?auto_157739 ?auto_157740 ) ( ON ?auto_157738 ?auto_157739 ) ( CLEAR ?auto_157736 ) ( ON ?auto_157737 ?auto_157738 ) ( CLEAR ?auto_157737 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_157736 ?auto_157737 )
      ( MAKE-11PILE ?auto_157736 ?auto_157737 ?auto_157738 ?auto_157739 ?auto_157740 ?auto_157741 ?auto_157742 ?auto_157743 ?auto_157744 ?auto_157745 ?auto_157746 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_157759 - BLOCK
      ?auto_157760 - BLOCK
      ?auto_157761 - BLOCK
      ?auto_157762 - BLOCK
      ?auto_157763 - BLOCK
      ?auto_157764 - BLOCK
      ?auto_157765 - BLOCK
      ?auto_157766 - BLOCK
      ?auto_157767 - BLOCK
      ?auto_157768 - BLOCK
      ?auto_157769 - BLOCK
    )
    :vars
    (
      ?auto_157770 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157769 ?auto_157770 ) ( not ( = ?auto_157759 ?auto_157760 ) ) ( not ( = ?auto_157759 ?auto_157761 ) ) ( not ( = ?auto_157759 ?auto_157762 ) ) ( not ( = ?auto_157759 ?auto_157763 ) ) ( not ( = ?auto_157759 ?auto_157764 ) ) ( not ( = ?auto_157759 ?auto_157765 ) ) ( not ( = ?auto_157759 ?auto_157766 ) ) ( not ( = ?auto_157759 ?auto_157767 ) ) ( not ( = ?auto_157759 ?auto_157768 ) ) ( not ( = ?auto_157759 ?auto_157769 ) ) ( not ( = ?auto_157759 ?auto_157770 ) ) ( not ( = ?auto_157760 ?auto_157761 ) ) ( not ( = ?auto_157760 ?auto_157762 ) ) ( not ( = ?auto_157760 ?auto_157763 ) ) ( not ( = ?auto_157760 ?auto_157764 ) ) ( not ( = ?auto_157760 ?auto_157765 ) ) ( not ( = ?auto_157760 ?auto_157766 ) ) ( not ( = ?auto_157760 ?auto_157767 ) ) ( not ( = ?auto_157760 ?auto_157768 ) ) ( not ( = ?auto_157760 ?auto_157769 ) ) ( not ( = ?auto_157760 ?auto_157770 ) ) ( not ( = ?auto_157761 ?auto_157762 ) ) ( not ( = ?auto_157761 ?auto_157763 ) ) ( not ( = ?auto_157761 ?auto_157764 ) ) ( not ( = ?auto_157761 ?auto_157765 ) ) ( not ( = ?auto_157761 ?auto_157766 ) ) ( not ( = ?auto_157761 ?auto_157767 ) ) ( not ( = ?auto_157761 ?auto_157768 ) ) ( not ( = ?auto_157761 ?auto_157769 ) ) ( not ( = ?auto_157761 ?auto_157770 ) ) ( not ( = ?auto_157762 ?auto_157763 ) ) ( not ( = ?auto_157762 ?auto_157764 ) ) ( not ( = ?auto_157762 ?auto_157765 ) ) ( not ( = ?auto_157762 ?auto_157766 ) ) ( not ( = ?auto_157762 ?auto_157767 ) ) ( not ( = ?auto_157762 ?auto_157768 ) ) ( not ( = ?auto_157762 ?auto_157769 ) ) ( not ( = ?auto_157762 ?auto_157770 ) ) ( not ( = ?auto_157763 ?auto_157764 ) ) ( not ( = ?auto_157763 ?auto_157765 ) ) ( not ( = ?auto_157763 ?auto_157766 ) ) ( not ( = ?auto_157763 ?auto_157767 ) ) ( not ( = ?auto_157763 ?auto_157768 ) ) ( not ( = ?auto_157763 ?auto_157769 ) ) ( not ( = ?auto_157763 ?auto_157770 ) ) ( not ( = ?auto_157764 ?auto_157765 ) ) ( not ( = ?auto_157764 ?auto_157766 ) ) ( not ( = ?auto_157764 ?auto_157767 ) ) ( not ( = ?auto_157764 ?auto_157768 ) ) ( not ( = ?auto_157764 ?auto_157769 ) ) ( not ( = ?auto_157764 ?auto_157770 ) ) ( not ( = ?auto_157765 ?auto_157766 ) ) ( not ( = ?auto_157765 ?auto_157767 ) ) ( not ( = ?auto_157765 ?auto_157768 ) ) ( not ( = ?auto_157765 ?auto_157769 ) ) ( not ( = ?auto_157765 ?auto_157770 ) ) ( not ( = ?auto_157766 ?auto_157767 ) ) ( not ( = ?auto_157766 ?auto_157768 ) ) ( not ( = ?auto_157766 ?auto_157769 ) ) ( not ( = ?auto_157766 ?auto_157770 ) ) ( not ( = ?auto_157767 ?auto_157768 ) ) ( not ( = ?auto_157767 ?auto_157769 ) ) ( not ( = ?auto_157767 ?auto_157770 ) ) ( not ( = ?auto_157768 ?auto_157769 ) ) ( not ( = ?auto_157768 ?auto_157770 ) ) ( not ( = ?auto_157769 ?auto_157770 ) ) ( ON ?auto_157768 ?auto_157769 ) ( ON ?auto_157767 ?auto_157768 ) ( ON ?auto_157766 ?auto_157767 ) ( ON ?auto_157765 ?auto_157766 ) ( ON ?auto_157764 ?auto_157765 ) ( ON ?auto_157763 ?auto_157764 ) ( ON ?auto_157762 ?auto_157763 ) ( ON ?auto_157761 ?auto_157762 ) ( ON ?auto_157760 ?auto_157761 ) ( ON ?auto_157759 ?auto_157760 ) ( CLEAR ?auto_157759 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_157759 )
      ( MAKE-11PILE ?auto_157759 ?auto_157760 ?auto_157761 ?auto_157762 ?auto_157763 ?auto_157764 ?auto_157765 ?auto_157766 ?auto_157767 ?auto_157768 ?auto_157769 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_157782 - BLOCK
      ?auto_157783 - BLOCK
      ?auto_157784 - BLOCK
      ?auto_157785 - BLOCK
      ?auto_157786 - BLOCK
      ?auto_157787 - BLOCK
      ?auto_157788 - BLOCK
      ?auto_157789 - BLOCK
      ?auto_157790 - BLOCK
      ?auto_157791 - BLOCK
      ?auto_157792 - BLOCK
    )
    :vars
    (
      ?auto_157793 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157792 ?auto_157793 ) ( not ( = ?auto_157782 ?auto_157783 ) ) ( not ( = ?auto_157782 ?auto_157784 ) ) ( not ( = ?auto_157782 ?auto_157785 ) ) ( not ( = ?auto_157782 ?auto_157786 ) ) ( not ( = ?auto_157782 ?auto_157787 ) ) ( not ( = ?auto_157782 ?auto_157788 ) ) ( not ( = ?auto_157782 ?auto_157789 ) ) ( not ( = ?auto_157782 ?auto_157790 ) ) ( not ( = ?auto_157782 ?auto_157791 ) ) ( not ( = ?auto_157782 ?auto_157792 ) ) ( not ( = ?auto_157782 ?auto_157793 ) ) ( not ( = ?auto_157783 ?auto_157784 ) ) ( not ( = ?auto_157783 ?auto_157785 ) ) ( not ( = ?auto_157783 ?auto_157786 ) ) ( not ( = ?auto_157783 ?auto_157787 ) ) ( not ( = ?auto_157783 ?auto_157788 ) ) ( not ( = ?auto_157783 ?auto_157789 ) ) ( not ( = ?auto_157783 ?auto_157790 ) ) ( not ( = ?auto_157783 ?auto_157791 ) ) ( not ( = ?auto_157783 ?auto_157792 ) ) ( not ( = ?auto_157783 ?auto_157793 ) ) ( not ( = ?auto_157784 ?auto_157785 ) ) ( not ( = ?auto_157784 ?auto_157786 ) ) ( not ( = ?auto_157784 ?auto_157787 ) ) ( not ( = ?auto_157784 ?auto_157788 ) ) ( not ( = ?auto_157784 ?auto_157789 ) ) ( not ( = ?auto_157784 ?auto_157790 ) ) ( not ( = ?auto_157784 ?auto_157791 ) ) ( not ( = ?auto_157784 ?auto_157792 ) ) ( not ( = ?auto_157784 ?auto_157793 ) ) ( not ( = ?auto_157785 ?auto_157786 ) ) ( not ( = ?auto_157785 ?auto_157787 ) ) ( not ( = ?auto_157785 ?auto_157788 ) ) ( not ( = ?auto_157785 ?auto_157789 ) ) ( not ( = ?auto_157785 ?auto_157790 ) ) ( not ( = ?auto_157785 ?auto_157791 ) ) ( not ( = ?auto_157785 ?auto_157792 ) ) ( not ( = ?auto_157785 ?auto_157793 ) ) ( not ( = ?auto_157786 ?auto_157787 ) ) ( not ( = ?auto_157786 ?auto_157788 ) ) ( not ( = ?auto_157786 ?auto_157789 ) ) ( not ( = ?auto_157786 ?auto_157790 ) ) ( not ( = ?auto_157786 ?auto_157791 ) ) ( not ( = ?auto_157786 ?auto_157792 ) ) ( not ( = ?auto_157786 ?auto_157793 ) ) ( not ( = ?auto_157787 ?auto_157788 ) ) ( not ( = ?auto_157787 ?auto_157789 ) ) ( not ( = ?auto_157787 ?auto_157790 ) ) ( not ( = ?auto_157787 ?auto_157791 ) ) ( not ( = ?auto_157787 ?auto_157792 ) ) ( not ( = ?auto_157787 ?auto_157793 ) ) ( not ( = ?auto_157788 ?auto_157789 ) ) ( not ( = ?auto_157788 ?auto_157790 ) ) ( not ( = ?auto_157788 ?auto_157791 ) ) ( not ( = ?auto_157788 ?auto_157792 ) ) ( not ( = ?auto_157788 ?auto_157793 ) ) ( not ( = ?auto_157789 ?auto_157790 ) ) ( not ( = ?auto_157789 ?auto_157791 ) ) ( not ( = ?auto_157789 ?auto_157792 ) ) ( not ( = ?auto_157789 ?auto_157793 ) ) ( not ( = ?auto_157790 ?auto_157791 ) ) ( not ( = ?auto_157790 ?auto_157792 ) ) ( not ( = ?auto_157790 ?auto_157793 ) ) ( not ( = ?auto_157791 ?auto_157792 ) ) ( not ( = ?auto_157791 ?auto_157793 ) ) ( not ( = ?auto_157792 ?auto_157793 ) ) ( ON ?auto_157791 ?auto_157792 ) ( ON ?auto_157790 ?auto_157791 ) ( ON ?auto_157789 ?auto_157790 ) ( ON ?auto_157788 ?auto_157789 ) ( ON ?auto_157787 ?auto_157788 ) ( ON ?auto_157786 ?auto_157787 ) ( ON ?auto_157785 ?auto_157786 ) ( ON ?auto_157784 ?auto_157785 ) ( ON ?auto_157783 ?auto_157784 ) ( ON ?auto_157782 ?auto_157783 ) ( CLEAR ?auto_157782 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_157782 )
      ( MAKE-11PILE ?auto_157782 ?auto_157783 ?auto_157784 ?auto_157785 ?auto_157786 ?auto_157787 ?auto_157788 ?auto_157789 ?auto_157790 ?auto_157791 ?auto_157792 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_157806 - BLOCK
      ?auto_157807 - BLOCK
      ?auto_157808 - BLOCK
      ?auto_157809 - BLOCK
      ?auto_157810 - BLOCK
      ?auto_157811 - BLOCK
      ?auto_157812 - BLOCK
      ?auto_157813 - BLOCK
      ?auto_157814 - BLOCK
      ?auto_157815 - BLOCK
      ?auto_157816 - BLOCK
      ?auto_157817 - BLOCK
    )
    :vars
    (
      ?auto_157818 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_157816 ) ( ON ?auto_157817 ?auto_157818 ) ( CLEAR ?auto_157817 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_157806 ) ( ON ?auto_157807 ?auto_157806 ) ( ON ?auto_157808 ?auto_157807 ) ( ON ?auto_157809 ?auto_157808 ) ( ON ?auto_157810 ?auto_157809 ) ( ON ?auto_157811 ?auto_157810 ) ( ON ?auto_157812 ?auto_157811 ) ( ON ?auto_157813 ?auto_157812 ) ( ON ?auto_157814 ?auto_157813 ) ( ON ?auto_157815 ?auto_157814 ) ( ON ?auto_157816 ?auto_157815 ) ( not ( = ?auto_157806 ?auto_157807 ) ) ( not ( = ?auto_157806 ?auto_157808 ) ) ( not ( = ?auto_157806 ?auto_157809 ) ) ( not ( = ?auto_157806 ?auto_157810 ) ) ( not ( = ?auto_157806 ?auto_157811 ) ) ( not ( = ?auto_157806 ?auto_157812 ) ) ( not ( = ?auto_157806 ?auto_157813 ) ) ( not ( = ?auto_157806 ?auto_157814 ) ) ( not ( = ?auto_157806 ?auto_157815 ) ) ( not ( = ?auto_157806 ?auto_157816 ) ) ( not ( = ?auto_157806 ?auto_157817 ) ) ( not ( = ?auto_157806 ?auto_157818 ) ) ( not ( = ?auto_157807 ?auto_157808 ) ) ( not ( = ?auto_157807 ?auto_157809 ) ) ( not ( = ?auto_157807 ?auto_157810 ) ) ( not ( = ?auto_157807 ?auto_157811 ) ) ( not ( = ?auto_157807 ?auto_157812 ) ) ( not ( = ?auto_157807 ?auto_157813 ) ) ( not ( = ?auto_157807 ?auto_157814 ) ) ( not ( = ?auto_157807 ?auto_157815 ) ) ( not ( = ?auto_157807 ?auto_157816 ) ) ( not ( = ?auto_157807 ?auto_157817 ) ) ( not ( = ?auto_157807 ?auto_157818 ) ) ( not ( = ?auto_157808 ?auto_157809 ) ) ( not ( = ?auto_157808 ?auto_157810 ) ) ( not ( = ?auto_157808 ?auto_157811 ) ) ( not ( = ?auto_157808 ?auto_157812 ) ) ( not ( = ?auto_157808 ?auto_157813 ) ) ( not ( = ?auto_157808 ?auto_157814 ) ) ( not ( = ?auto_157808 ?auto_157815 ) ) ( not ( = ?auto_157808 ?auto_157816 ) ) ( not ( = ?auto_157808 ?auto_157817 ) ) ( not ( = ?auto_157808 ?auto_157818 ) ) ( not ( = ?auto_157809 ?auto_157810 ) ) ( not ( = ?auto_157809 ?auto_157811 ) ) ( not ( = ?auto_157809 ?auto_157812 ) ) ( not ( = ?auto_157809 ?auto_157813 ) ) ( not ( = ?auto_157809 ?auto_157814 ) ) ( not ( = ?auto_157809 ?auto_157815 ) ) ( not ( = ?auto_157809 ?auto_157816 ) ) ( not ( = ?auto_157809 ?auto_157817 ) ) ( not ( = ?auto_157809 ?auto_157818 ) ) ( not ( = ?auto_157810 ?auto_157811 ) ) ( not ( = ?auto_157810 ?auto_157812 ) ) ( not ( = ?auto_157810 ?auto_157813 ) ) ( not ( = ?auto_157810 ?auto_157814 ) ) ( not ( = ?auto_157810 ?auto_157815 ) ) ( not ( = ?auto_157810 ?auto_157816 ) ) ( not ( = ?auto_157810 ?auto_157817 ) ) ( not ( = ?auto_157810 ?auto_157818 ) ) ( not ( = ?auto_157811 ?auto_157812 ) ) ( not ( = ?auto_157811 ?auto_157813 ) ) ( not ( = ?auto_157811 ?auto_157814 ) ) ( not ( = ?auto_157811 ?auto_157815 ) ) ( not ( = ?auto_157811 ?auto_157816 ) ) ( not ( = ?auto_157811 ?auto_157817 ) ) ( not ( = ?auto_157811 ?auto_157818 ) ) ( not ( = ?auto_157812 ?auto_157813 ) ) ( not ( = ?auto_157812 ?auto_157814 ) ) ( not ( = ?auto_157812 ?auto_157815 ) ) ( not ( = ?auto_157812 ?auto_157816 ) ) ( not ( = ?auto_157812 ?auto_157817 ) ) ( not ( = ?auto_157812 ?auto_157818 ) ) ( not ( = ?auto_157813 ?auto_157814 ) ) ( not ( = ?auto_157813 ?auto_157815 ) ) ( not ( = ?auto_157813 ?auto_157816 ) ) ( not ( = ?auto_157813 ?auto_157817 ) ) ( not ( = ?auto_157813 ?auto_157818 ) ) ( not ( = ?auto_157814 ?auto_157815 ) ) ( not ( = ?auto_157814 ?auto_157816 ) ) ( not ( = ?auto_157814 ?auto_157817 ) ) ( not ( = ?auto_157814 ?auto_157818 ) ) ( not ( = ?auto_157815 ?auto_157816 ) ) ( not ( = ?auto_157815 ?auto_157817 ) ) ( not ( = ?auto_157815 ?auto_157818 ) ) ( not ( = ?auto_157816 ?auto_157817 ) ) ( not ( = ?auto_157816 ?auto_157818 ) ) ( not ( = ?auto_157817 ?auto_157818 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_157817 ?auto_157818 )
      ( !STACK ?auto_157817 ?auto_157816 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_157831 - BLOCK
      ?auto_157832 - BLOCK
      ?auto_157833 - BLOCK
      ?auto_157834 - BLOCK
      ?auto_157835 - BLOCK
      ?auto_157836 - BLOCK
      ?auto_157837 - BLOCK
      ?auto_157838 - BLOCK
      ?auto_157839 - BLOCK
      ?auto_157840 - BLOCK
      ?auto_157841 - BLOCK
      ?auto_157842 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_157841 ) ( ON-TABLE ?auto_157842 ) ( CLEAR ?auto_157842 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_157831 ) ( ON ?auto_157832 ?auto_157831 ) ( ON ?auto_157833 ?auto_157832 ) ( ON ?auto_157834 ?auto_157833 ) ( ON ?auto_157835 ?auto_157834 ) ( ON ?auto_157836 ?auto_157835 ) ( ON ?auto_157837 ?auto_157836 ) ( ON ?auto_157838 ?auto_157837 ) ( ON ?auto_157839 ?auto_157838 ) ( ON ?auto_157840 ?auto_157839 ) ( ON ?auto_157841 ?auto_157840 ) ( not ( = ?auto_157831 ?auto_157832 ) ) ( not ( = ?auto_157831 ?auto_157833 ) ) ( not ( = ?auto_157831 ?auto_157834 ) ) ( not ( = ?auto_157831 ?auto_157835 ) ) ( not ( = ?auto_157831 ?auto_157836 ) ) ( not ( = ?auto_157831 ?auto_157837 ) ) ( not ( = ?auto_157831 ?auto_157838 ) ) ( not ( = ?auto_157831 ?auto_157839 ) ) ( not ( = ?auto_157831 ?auto_157840 ) ) ( not ( = ?auto_157831 ?auto_157841 ) ) ( not ( = ?auto_157831 ?auto_157842 ) ) ( not ( = ?auto_157832 ?auto_157833 ) ) ( not ( = ?auto_157832 ?auto_157834 ) ) ( not ( = ?auto_157832 ?auto_157835 ) ) ( not ( = ?auto_157832 ?auto_157836 ) ) ( not ( = ?auto_157832 ?auto_157837 ) ) ( not ( = ?auto_157832 ?auto_157838 ) ) ( not ( = ?auto_157832 ?auto_157839 ) ) ( not ( = ?auto_157832 ?auto_157840 ) ) ( not ( = ?auto_157832 ?auto_157841 ) ) ( not ( = ?auto_157832 ?auto_157842 ) ) ( not ( = ?auto_157833 ?auto_157834 ) ) ( not ( = ?auto_157833 ?auto_157835 ) ) ( not ( = ?auto_157833 ?auto_157836 ) ) ( not ( = ?auto_157833 ?auto_157837 ) ) ( not ( = ?auto_157833 ?auto_157838 ) ) ( not ( = ?auto_157833 ?auto_157839 ) ) ( not ( = ?auto_157833 ?auto_157840 ) ) ( not ( = ?auto_157833 ?auto_157841 ) ) ( not ( = ?auto_157833 ?auto_157842 ) ) ( not ( = ?auto_157834 ?auto_157835 ) ) ( not ( = ?auto_157834 ?auto_157836 ) ) ( not ( = ?auto_157834 ?auto_157837 ) ) ( not ( = ?auto_157834 ?auto_157838 ) ) ( not ( = ?auto_157834 ?auto_157839 ) ) ( not ( = ?auto_157834 ?auto_157840 ) ) ( not ( = ?auto_157834 ?auto_157841 ) ) ( not ( = ?auto_157834 ?auto_157842 ) ) ( not ( = ?auto_157835 ?auto_157836 ) ) ( not ( = ?auto_157835 ?auto_157837 ) ) ( not ( = ?auto_157835 ?auto_157838 ) ) ( not ( = ?auto_157835 ?auto_157839 ) ) ( not ( = ?auto_157835 ?auto_157840 ) ) ( not ( = ?auto_157835 ?auto_157841 ) ) ( not ( = ?auto_157835 ?auto_157842 ) ) ( not ( = ?auto_157836 ?auto_157837 ) ) ( not ( = ?auto_157836 ?auto_157838 ) ) ( not ( = ?auto_157836 ?auto_157839 ) ) ( not ( = ?auto_157836 ?auto_157840 ) ) ( not ( = ?auto_157836 ?auto_157841 ) ) ( not ( = ?auto_157836 ?auto_157842 ) ) ( not ( = ?auto_157837 ?auto_157838 ) ) ( not ( = ?auto_157837 ?auto_157839 ) ) ( not ( = ?auto_157837 ?auto_157840 ) ) ( not ( = ?auto_157837 ?auto_157841 ) ) ( not ( = ?auto_157837 ?auto_157842 ) ) ( not ( = ?auto_157838 ?auto_157839 ) ) ( not ( = ?auto_157838 ?auto_157840 ) ) ( not ( = ?auto_157838 ?auto_157841 ) ) ( not ( = ?auto_157838 ?auto_157842 ) ) ( not ( = ?auto_157839 ?auto_157840 ) ) ( not ( = ?auto_157839 ?auto_157841 ) ) ( not ( = ?auto_157839 ?auto_157842 ) ) ( not ( = ?auto_157840 ?auto_157841 ) ) ( not ( = ?auto_157840 ?auto_157842 ) ) ( not ( = ?auto_157841 ?auto_157842 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_157842 )
      ( !STACK ?auto_157842 ?auto_157841 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_157855 - BLOCK
      ?auto_157856 - BLOCK
      ?auto_157857 - BLOCK
      ?auto_157858 - BLOCK
      ?auto_157859 - BLOCK
      ?auto_157860 - BLOCK
      ?auto_157861 - BLOCK
      ?auto_157862 - BLOCK
      ?auto_157863 - BLOCK
      ?auto_157864 - BLOCK
      ?auto_157865 - BLOCK
      ?auto_157866 - BLOCK
    )
    :vars
    (
      ?auto_157867 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157866 ?auto_157867 ) ( ON-TABLE ?auto_157855 ) ( ON ?auto_157856 ?auto_157855 ) ( ON ?auto_157857 ?auto_157856 ) ( ON ?auto_157858 ?auto_157857 ) ( ON ?auto_157859 ?auto_157858 ) ( ON ?auto_157860 ?auto_157859 ) ( ON ?auto_157861 ?auto_157860 ) ( ON ?auto_157862 ?auto_157861 ) ( ON ?auto_157863 ?auto_157862 ) ( ON ?auto_157864 ?auto_157863 ) ( not ( = ?auto_157855 ?auto_157856 ) ) ( not ( = ?auto_157855 ?auto_157857 ) ) ( not ( = ?auto_157855 ?auto_157858 ) ) ( not ( = ?auto_157855 ?auto_157859 ) ) ( not ( = ?auto_157855 ?auto_157860 ) ) ( not ( = ?auto_157855 ?auto_157861 ) ) ( not ( = ?auto_157855 ?auto_157862 ) ) ( not ( = ?auto_157855 ?auto_157863 ) ) ( not ( = ?auto_157855 ?auto_157864 ) ) ( not ( = ?auto_157855 ?auto_157865 ) ) ( not ( = ?auto_157855 ?auto_157866 ) ) ( not ( = ?auto_157855 ?auto_157867 ) ) ( not ( = ?auto_157856 ?auto_157857 ) ) ( not ( = ?auto_157856 ?auto_157858 ) ) ( not ( = ?auto_157856 ?auto_157859 ) ) ( not ( = ?auto_157856 ?auto_157860 ) ) ( not ( = ?auto_157856 ?auto_157861 ) ) ( not ( = ?auto_157856 ?auto_157862 ) ) ( not ( = ?auto_157856 ?auto_157863 ) ) ( not ( = ?auto_157856 ?auto_157864 ) ) ( not ( = ?auto_157856 ?auto_157865 ) ) ( not ( = ?auto_157856 ?auto_157866 ) ) ( not ( = ?auto_157856 ?auto_157867 ) ) ( not ( = ?auto_157857 ?auto_157858 ) ) ( not ( = ?auto_157857 ?auto_157859 ) ) ( not ( = ?auto_157857 ?auto_157860 ) ) ( not ( = ?auto_157857 ?auto_157861 ) ) ( not ( = ?auto_157857 ?auto_157862 ) ) ( not ( = ?auto_157857 ?auto_157863 ) ) ( not ( = ?auto_157857 ?auto_157864 ) ) ( not ( = ?auto_157857 ?auto_157865 ) ) ( not ( = ?auto_157857 ?auto_157866 ) ) ( not ( = ?auto_157857 ?auto_157867 ) ) ( not ( = ?auto_157858 ?auto_157859 ) ) ( not ( = ?auto_157858 ?auto_157860 ) ) ( not ( = ?auto_157858 ?auto_157861 ) ) ( not ( = ?auto_157858 ?auto_157862 ) ) ( not ( = ?auto_157858 ?auto_157863 ) ) ( not ( = ?auto_157858 ?auto_157864 ) ) ( not ( = ?auto_157858 ?auto_157865 ) ) ( not ( = ?auto_157858 ?auto_157866 ) ) ( not ( = ?auto_157858 ?auto_157867 ) ) ( not ( = ?auto_157859 ?auto_157860 ) ) ( not ( = ?auto_157859 ?auto_157861 ) ) ( not ( = ?auto_157859 ?auto_157862 ) ) ( not ( = ?auto_157859 ?auto_157863 ) ) ( not ( = ?auto_157859 ?auto_157864 ) ) ( not ( = ?auto_157859 ?auto_157865 ) ) ( not ( = ?auto_157859 ?auto_157866 ) ) ( not ( = ?auto_157859 ?auto_157867 ) ) ( not ( = ?auto_157860 ?auto_157861 ) ) ( not ( = ?auto_157860 ?auto_157862 ) ) ( not ( = ?auto_157860 ?auto_157863 ) ) ( not ( = ?auto_157860 ?auto_157864 ) ) ( not ( = ?auto_157860 ?auto_157865 ) ) ( not ( = ?auto_157860 ?auto_157866 ) ) ( not ( = ?auto_157860 ?auto_157867 ) ) ( not ( = ?auto_157861 ?auto_157862 ) ) ( not ( = ?auto_157861 ?auto_157863 ) ) ( not ( = ?auto_157861 ?auto_157864 ) ) ( not ( = ?auto_157861 ?auto_157865 ) ) ( not ( = ?auto_157861 ?auto_157866 ) ) ( not ( = ?auto_157861 ?auto_157867 ) ) ( not ( = ?auto_157862 ?auto_157863 ) ) ( not ( = ?auto_157862 ?auto_157864 ) ) ( not ( = ?auto_157862 ?auto_157865 ) ) ( not ( = ?auto_157862 ?auto_157866 ) ) ( not ( = ?auto_157862 ?auto_157867 ) ) ( not ( = ?auto_157863 ?auto_157864 ) ) ( not ( = ?auto_157863 ?auto_157865 ) ) ( not ( = ?auto_157863 ?auto_157866 ) ) ( not ( = ?auto_157863 ?auto_157867 ) ) ( not ( = ?auto_157864 ?auto_157865 ) ) ( not ( = ?auto_157864 ?auto_157866 ) ) ( not ( = ?auto_157864 ?auto_157867 ) ) ( not ( = ?auto_157865 ?auto_157866 ) ) ( not ( = ?auto_157865 ?auto_157867 ) ) ( not ( = ?auto_157866 ?auto_157867 ) ) ( CLEAR ?auto_157864 ) ( ON ?auto_157865 ?auto_157866 ) ( CLEAR ?auto_157865 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_157855 ?auto_157856 ?auto_157857 ?auto_157858 ?auto_157859 ?auto_157860 ?auto_157861 ?auto_157862 ?auto_157863 ?auto_157864 ?auto_157865 )
      ( MAKE-12PILE ?auto_157855 ?auto_157856 ?auto_157857 ?auto_157858 ?auto_157859 ?auto_157860 ?auto_157861 ?auto_157862 ?auto_157863 ?auto_157864 ?auto_157865 ?auto_157866 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_157880 - BLOCK
      ?auto_157881 - BLOCK
      ?auto_157882 - BLOCK
      ?auto_157883 - BLOCK
      ?auto_157884 - BLOCK
      ?auto_157885 - BLOCK
      ?auto_157886 - BLOCK
      ?auto_157887 - BLOCK
      ?auto_157888 - BLOCK
      ?auto_157889 - BLOCK
      ?auto_157890 - BLOCK
      ?auto_157891 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_157891 ) ( ON-TABLE ?auto_157880 ) ( ON ?auto_157881 ?auto_157880 ) ( ON ?auto_157882 ?auto_157881 ) ( ON ?auto_157883 ?auto_157882 ) ( ON ?auto_157884 ?auto_157883 ) ( ON ?auto_157885 ?auto_157884 ) ( ON ?auto_157886 ?auto_157885 ) ( ON ?auto_157887 ?auto_157886 ) ( ON ?auto_157888 ?auto_157887 ) ( ON ?auto_157889 ?auto_157888 ) ( not ( = ?auto_157880 ?auto_157881 ) ) ( not ( = ?auto_157880 ?auto_157882 ) ) ( not ( = ?auto_157880 ?auto_157883 ) ) ( not ( = ?auto_157880 ?auto_157884 ) ) ( not ( = ?auto_157880 ?auto_157885 ) ) ( not ( = ?auto_157880 ?auto_157886 ) ) ( not ( = ?auto_157880 ?auto_157887 ) ) ( not ( = ?auto_157880 ?auto_157888 ) ) ( not ( = ?auto_157880 ?auto_157889 ) ) ( not ( = ?auto_157880 ?auto_157890 ) ) ( not ( = ?auto_157880 ?auto_157891 ) ) ( not ( = ?auto_157881 ?auto_157882 ) ) ( not ( = ?auto_157881 ?auto_157883 ) ) ( not ( = ?auto_157881 ?auto_157884 ) ) ( not ( = ?auto_157881 ?auto_157885 ) ) ( not ( = ?auto_157881 ?auto_157886 ) ) ( not ( = ?auto_157881 ?auto_157887 ) ) ( not ( = ?auto_157881 ?auto_157888 ) ) ( not ( = ?auto_157881 ?auto_157889 ) ) ( not ( = ?auto_157881 ?auto_157890 ) ) ( not ( = ?auto_157881 ?auto_157891 ) ) ( not ( = ?auto_157882 ?auto_157883 ) ) ( not ( = ?auto_157882 ?auto_157884 ) ) ( not ( = ?auto_157882 ?auto_157885 ) ) ( not ( = ?auto_157882 ?auto_157886 ) ) ( not ( = ?auto_157882 ?auto_157887 ) ) ( not ( = ?auto_157882 ?auto_157888 ) ) ( not ( = ?auto_157882 ?auto_157889 ) ) ( not ( = ?auto_157882 ?auto_157890 ) ) ( not ( = ?auto_157882 ?auto_157891 ) ) ( not ( = ?auto_157883 ?auto_157884 ) ) ( not ( = ?auto_157883 ?auto_157885 ) ) ( not ( = ?auto_157883 ?auto_157886 ) ) ( not ( = ?auto_157883 ?auto_157887 ) ) ( not ( = ?auto_157883 ?auto_157888 ) ) ( not ( = ?auto_157883 ?auto_157889 ) ) ( not ( = ?auto_157883 ?auto_157890 ) ) ( not ( = ?auto_157883 ?auto_157891 ) ) ( not ( = ?auto_157884 ?auto_157885 ) ) ( not ( = ?auto_157884 ?auto_157886 ) ) ( not ( = ?auto_157884 ?auto_157887 ) ) ( not ( = ?auto_157884 ?auto_157888 ) ) ( not ( = ?auto_157884 ?auto_157889 ) ) ( not ( = ?auto_157884 ?auto_157890 ) ) ( not ( = ?auto_157884 ?auto_157891 ) ) ( not ( = ?auto_157885 ?auto_157886 ) ) ( not ( = ?auto_157885 ?auto_157887 ) ) ( not ( = ?auto_157885 ?auto_157888 ) ) ( not ( = ?auto_157885 ?auto_157889 ) ) ( not ( = ?auto_157885 ?auto_157890 ) ) ( not ( = ?auto_157885 ?auto_157891 ) ) ( not ( = ?auto_157886 ?auto_157887 ) ) ( not ( = ?auto_157886 ?auto_157888 ) ) ( not ( = ?auto_157886 ?auto_157889 ) ) ( not ( = ?auto_157886 ?auto_157890 ) ) ( not ( = ?auto_157886 ?auto_157891 ) ) ( not ( = ?auto_157887 ?auto_157888 ) ) ( not ( = ?auto_157887 ?auto_157889 ) ) ( not ( = ?auto_157887 ?auto_157890 ) ) ( not ( = ?auto_157887 ?auto_157891 ) ) ( not ( = ?auto_157888 ?auto_157889 ) ) ( not ( = ?auto_157888 ?auto_157890 ) ) ( not ( = ?auto_157888 ?auto_157891 ) ) ( not ( = ?auto_157889 ?auto_157890 ) ) ( not ( = ?auto_157889 ?auto_157891 ) ) ( not ( = ?auto_157890 ?auto_157891 ) ) ( CLEAR ?auto_157889 ) ( ON ?auto_157890 ?auto_157891 ) ( CLEAR ?auto_157890 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_157880 ?auto_157881 ?auto_157882 ?auto_157883 ?auto_157884 ?auto_157885 ?auto_157886 ?auto_157887 ?auto_157888 ?auto_157889 ?auto_157890 )
      ( MAKE-12PILE ?auto_157880 ?auto_157881 ?auto_157882 ?auto_157883 ?auto_157884 ?auto_157885 ?auto_157886 ?auto_157887 ?auto_157888 ?auto_157889 ?auto_157890 ?auto_157891 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_157904 - BLOCK
      ?auto_157905 - BLOCK
      ?auto_157906 - BLOCK
      ?auto_157907 - BLOCK
      ?auto_157908 - BLOCK
      ?auto_157909 - BLOCK
      ?auto_157910 - BLOCK
      ?auto_157911 - BLOCK
      ?auto_157912 - BLOCK
      ?auto_157913 - BLOCK
      ?auto_157914 - BLOCK
      ?auto_157915 - BLOCK
    )
    :vars
    (
      ?auto_157916 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157915 ?auto_157916 ) ( ON-TABLE ?auto_157904 ) ( ON ?auto_157905 ?auto_157904 ) ( ON ?auto_157906 ?auto_157905 ) ( ON ?auto_157907 ?auto_157906 ) ( ON ?auto_157908 ?auto_157907 ) ( ON ?auto_157909 ?auto_157908 ) ( ON ?auto_157910 ?auto_157909 ) ( ON ?auto_157911 ?auto_157910 ) ( ON ?auto_157912 ?auto_157911 ) ( not ( = ?auto_157904 ?auto_157905 ) ) ( not ( = ?auto_157904 ?auto_157906 ) ) ( not ( = ?auto_157904 ?auto_157907 ) ) ( not ( = ?auto_157904 ?auto_157908 ) ) ( not ( = ?auto_157904 ?auto_157909 ) ) ( not ( = ?auto_157904 ?auto_157910 ) ) ( not ( = ?auto_157904 ?auto_157911 ) ) ( not ( = ?auto_157904 ?auto_157912 ) ) ( not ( = ?auto_157904 ?auto_157913 ) ) ( not ( = ?auto_157904 ?auto_157914 ) ) ( not ( = ?auto_157904 ?auto_157915 ) ) ( not ( = ?auto_157904 ?auto_157916 ) ) ( not ( = ?auto_157905 ?auto_157906 ) ) ( not ( = ?auto_157905 ?auto_157907 ) ) ( not ( = ?auto_157905 ?auto_157908 ) ) ( not ( = ?auto_157905 ?auto_157909 ) ) ( not ( = ?auto_157905 ?auto_157910 ) ) ( not ( = ?auto_157905 ?auto_157911 ) ) ( not ( = ?auto_157905 ?auto_157912 ) ) ( not ( = ?auto_157905 ?auto_157913 ) ) ( not ( = ?auto_157905 ?auto_157914 ) ) ( not ( = ?auto_157905 ?auto_157915 ) ) ( not ( = ?auto_157905 ?auto_157916 ) ) ( not ( = ?auto_157906 ?auto_157907 ) ) ( not ( = ?auto_157906 ?auto_157908 ) ) ( not ( = ?auto_157906 ?auto_157909 ) ) ( not ( = ?auto_157906 ?auto_157910 ) ) ( not ( = ?auto_157906 ?auto_157911 ) ) ( not ( = ?auto_157906 ?auto_157912 ) ) ( not ( = ?auto_157906 ?auto_157913 ) ) ( not ( = ?auto_157906 ?auto_157914 ) ) ( not ( = ?auto_157906 ?auto_157915 ) ) ( not ( = ?auto_157906 ?auto_157916 ) ) ( not ( = ?auto_157907 ?auto_157908 ) ) ( not ( = ?auto_157907 ?auto_157909 ) ) ( not ( = ?auto_157907 ?auto_157910 ) ) ( not ( = ?auto_157907 ?auto_157911 ) ) ( not ( = ?auto_157907 ?auto_157912 ) ) ( not ( = ?auto_157907 ?auto_157913 ) ) ( not ( = ?auto_157907 ?auto_157914 ) ) ( not ( = ?auto_157907 ?auto_157915 ) ) ( not ( = ?auto_157907 ?auto_157916 ) ) ( not ( = ?auto_157908 ?auto_157909 ) ) ( not ( = ?auto_157908 ?auto_157910 ) ) ( not ( = ?auto_157908 ?auto_157911 ) ) ( not ( = ?auto_157908 ?auto_157912 ) ) ( not ( = ?auto_157908 ?auto_157913 ) ) ( not ( = ?auto_157908 ?auto_157914 ) ) ( not ( = ?auto_157908 ?auto_157915 ) ) ( not ( = ?auto_157908 ?auto_157916 ) ) ( not ( = ?auto_157909 ?auto_157910 ) ) ( not ( = ?auto_157909 ?auto_157911 ) ) ( not ( = ?auto_157909 ?auto_157912 ) ) ( not ( = ?auto_157909 ?auto_157913 ) ) ( not ( = ?auto_157909 ?auto_157914 ) ) ( not ( = ?auto_157909 ?auto_157915 ) ) ( not ( = ?auto_157909 ?auto_157916 ) ) ( not ( = ?auto_157910 ?auto_157911 ) ) ( not ( = ?auto_157910 ?auto_157912 ) ) ( not ( = ?auto_157910 ?auto_157913 ) ) ( not ( = ?auto_157910 ?auto_157914 ) ) ( not ( = ?auto_157910 ?auto_157915 ) ) ( not ( = ?auto_157910 ?auto_157916 ) ) ( not ( = ?auto_157911 ?auto_157912 ) ) ( not ( = ?auto_157911 ?auto_157913 ) ) ( not ( = ?auto_157911 ?auto_157914 ) ) ( not ( = ?auto_157911 ?auto_157915 ) ) ( not ( = ?auto_157911 ?auto_157916 ) ) ( not ( = ?auto_157912 ?auto_157913 ) ) ( not ( = ?auto_157912 ?auto_157914 ) ) ( not ( = ?auto_157912 ?auto_157915 ) ) ( not ( = ?auto_157912 ?auto_157916 ) ) ( not ( = ?auto_157913 ?auto_157914 ) ) ( not ( = ?auto_157913 ?auto_157915 ) ) ( not ( = ?auto_157913 ?auto_157916 ) ) ( not ( = ?auto_157914 ?auto_157915 ) ) ( not ( = ?auto_157914 ?auto_157916 ) ) ( not ( = ?auto_157915 ?auto_157916 ) ) ( ON ?auto_157914 ?auto_157915 ) ( CLEAR ?auto_157912 ) ( ON ?auto_157913 ?auto_157914 ) ( CLEAR ?auto_157913 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_157904 ?auto_157905 ?auto_157906 ?auto_157907 ?auto_157908 ?auto_157909 ?auto_157910 ?auto_157911 ?auto_157912 ?auto_157913 )
      ( MAKE-12PILE ?auto_157904 ?auto_157905 ?auto_157906 ?auto_157907 ?auto_157908 ?auto_157909 ?auto_157910 ?auto_157911 ?auto_157912 ?auto_157913 ?auto_157914 ?auto_157915 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_157929 - BLOCK
      ?auto_157930 - BLOCK
      ?auto_157931 - BLOCK
      ?auto_157932 - BLOCK
      ?auto_157933 - BLOCK
      ?auto_157934 - BLOCK
      ?auto_157935 - BLOCK
      ?auto_157936 - BLOCK
      ?auto_157937 - BLOCK
      ?auto_157938 - BLOCK
      ?auto_157939 - BLOCK
      ?auto_157940 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_157940 ) ( ON-TABLE ?auto_157929 ) ( ON ?auto_157930 ?auto_157929 ) ( ON ?auto_157931 ?auto_157930 ) ( ON ?auto_157932 ?auto_157931 ) ( ON ?auto_157933 ?auto_157932 ) ( ON ?auto_157934 ?auto_157933 ) ( ON ?auto_157935 ?auto_157934 ) ( ON ?auto_157936 ?auto_157935 ) ( ON ?auto_157937 ?auto_157936 ) ( not ( = ?auto_157929 ?auto_157930 ) ) ( not ( = ?auto_157929 ?auto_157931 ) ) ( not ( = ?auto_157929 ?auto_157932 ) ) ( not ( = ?auto_157929 ?auto_157933 ) ) ( not ( = ?auto_157929 ?auto_157934 ) ) ( not ( = ?auto_157929 ?auto_157935 ) ) ( not ( = ?auto_157929 ?auto_157936 ) ) ( not ( = ?auto_157929 ?auto_157937 ) ) ( not ( = ?auto_157929 ?auto_157938 ) ) ( not ( = ?auto_157929 ?auto_157939 ) ) ( not ( = ?auto_157929 ?auto_157940 ) ) ( not ( = ?auto_157930 ?auto_157931 ) ) ( not ( = ?auto_157930 ?auto_157932 ) ) ( not ( = ?auto_157930 ?auto_157933 ) ) ( not ( = ?auto_157930 ?auto_157934 ) ) ( not ( = ?auto_157930 ?auto_157935 ) ) ( not ( = ?auto_157930 ?auto_157936 ) ) ( not ( = ?auto_157930 ?auto_157937 ) ) ( not ( = ?auto_157930 ?auto_157938 ) ) ( not ( = ?auto_157930 ?auto_157939 ) ) ( not ( = ?auto_157930 ?auto_157940 ) ) ( not ( = ?auto_157931 ?auto_157932 ) ) ( not ( = ?auto_157931 ?auto_157933 ) ) ( not ( = ?auto_157931 ?auto_157934 ) ) ( not ( = ?auto_157931 ?auto_157935 ) ) ( not ( = ?auto_157931 ?auto_157936 ) ) ( not ( = ?auto_157931 ?auto_157937 ) ) ( not ( = ?auto_157931 ?auto_157938 ) ) ( not ( = ?auto_157931 ?auto_157939 ) ) ( not ( = ?auto_157931 ?auto_157940 ) ) ( not ( = ?auto_157932 ?auto_157933 ) ) ( not ( = ?auto_157932 ?auto_157934 ) ) ( not ( = ?auto_157932 ?auto_157935 ) ) ( not ( = ?auto_157932 ?auto_157936 ) ) ( not ( = ?auto_157932 ?auto_157937 ) ) ( not ( = ?auto_157932 ?auto_157938 ) ) ( not ( = ?auto_157932 ?auto_157939 ) ) ( not ( = ?auto_157932 ?auto_157940 ) ) ( not ( = ?auto_157933 ?auto_157934 ) ) ( not ( = ?auto_157933 ?auto_157935 ) ) ( not ( = ?auto_157933 ?auto_157936 ) ) ( not ( = ?auto_157933 ?auto_157937 ) ) ( not ( = ?auto_157933 ?auto_157938 ) ) ( not ( = ?auto_157933 ?auto_157939 ) ) ( not ( = ?auto_157933 ?auto_157940 ) ) ( not ( = ?auto_157934 ?auto_157935 ) ) ( not ( = ?auto_157934 ?auto_157936 ) ) ( not ( = ?auto_157934 ?auto_157937 ) ) ( not ( = ?auto_157934 ?auto_157938 ) ) ( not ( = ?auto_157934 ?auto_157939 ) ) ( not ( = ?auto_157934 ?auto_157940 ) ) ( not ( = ?auto_157935 ?auto_157936 ) ) ( not ( = ?auto_157935 ?auto_157937 ) ) ( not ( = ?auto_157935 ?auto_157938 ) ) ( not ( = ?auto_157935 ?auto_157939 ) ) ( not ( = ?auto_157935 ?auto_157940 ) ) ( not ( = ?auto_157936 ?auto_157937 ) ) ( not ( = ?auto_157936 ?auto_157938 ) ) ( not ( = ?auto_157936 ?auto_157939 ) ) ( not ( = ?auto_157936 ?auto_157940 ) ) ( not ( = ?auto_157937 ?auto_157938 ) ) ( not ( = ?auto_157937 ?auto_157939 ) ) ( not ( = ?auto_157937 ?auto_157940 ) ) ( not ( = ?auto_157938 ?auto_157939 ) ) ( not ( = ?auto_157938 ?auto_157940 ) ) ( not ( = ?auto_157939 ?auto_157940 ) ) ( ON ?auto_157939 ?auto_157940 ) ( CLEAR ?auto_157937 ) ( ON ?auto_157938 ?auto_157939 ) ( CLEAR ?auto_157938 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_157929 ?auto_157930 ?auto_157931 ?auto_157932 ?auto_157933 ?auto_157934 ?auto_157935 ?auto_157936 ?auto_157937 ?auto_157938 )
      ( MAKE-12PILE ?auto_157929 ?auto_157930 ?auto_157931 ?auto_157932 ?auto_157933 ?auto_157934 ?auto_157935 ?auto_157936 ?auto_157937 ?auto_157938 ?auto_157939 ?auto_157940 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_157953 - BLOCK
      ?auto_157954 - BLOCK
      ?auto_157955 - BLOCK
      ?auto_157956 - BLOCK
      ?auto_157957 - BLOCK
      ?auto_157958 - BLOCK
      ?auto_157959 - BLOCK
      ?auto_157960 - BLOCK
      ?auto_157961 - BLOCK
      ?auto_157962 - BLOCK
      ?auto_157963 - BLOCK
      ?auto_157964 - BLOCK
    )
    :vars
    (
      ?auto_157965 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157964 ?auto_157965 ) ( ON-TABLE ?auto_157953 ) ( ON ?auto_157954 ?auto_157953 ) ( ON ?auto_157955 ?auto_157954 ) ( ON ?auto_157956 ?auto_157955 ) ( ON ?auto_157957 ?auto_157956 ) ( ON ?auto_157958 ?auto_157957 ) ( ON ?auto_157959 ?auto_157958 ) ( ON ?auto_157960 ?auto_157959 ) ( not ( = ?auto_157953 ?auto_157954 ) ) ( not ( = ?auto_157953 ?auto_157955 ) ) ( not ( = ?auto_157953 ?auto_157956 ) ) ( not ( = ?auto_157953 ?auto_157957 ) ) ( not ( = ?auto_157953 ?auto_157958 ) ) ( not ( = ?auto_157953 ?auto_157959 ) ) ( not ( = ?auto_157953 ?auto_157960 ) ) ( not ( = ?auto_157953 ?auto_157961 ) ) ( not ( = ?auto_157953 ?auto_157962 ) ) ( not ( = ?auto_157953 ?auto_157963 ) ) ( not ( = ?auto_157953 ?auto_157964 ) ) ( not ( = ?auto_157953 ?auto_157965 ) ) ( not ( = ?auto_157954 ?auto_157955 ) ) ( not ( = ?auto_157954 ?auto_157956 ) ) ( not ( = ?auto_157954 ?auto_157957 ) ) ( not ( = ?auto_157954 ?auto_157958 ) ) ( not ( = ?auto_157954 ?auto_157959 ) ) ( not ( = ?auto_157954 ?auto_157960 ) ) ( not ( = ?auto_157954 ?auto_157961 ) ) ( not ( = ?auto_157954 ?auto_157962 ) ) ( not ( = ?auto_157954 ?auto_157963 ) ) ( not ( = ?auto_157954 ?auto_157964 ) ) ( not ( = ?auto_157954 ?auto_157965 ) ) ( not ( = ?auto_157955 ?auto_157956 ) ) ( not ( = ?auto_157955 ?auto_157957 ) ) ( not ( = ?auto_157955 ?auto_157958 ) ) ( not ( = ?auto_157955 ?auto_157959 ) ) ( not ( = ?auto_157955 ?auto_157960 ) ) ( not ( = ?auto_157955 ?auto_157961 ) ) ( not ( = ?auto_157955 ?auto_157962 ) ) ( not ( = ?auto_157955 ?auto_157963 ) ) ( not ( = ?auto_157955 ?auto_157964 ) ) ( not ( = ?auto_157955 ?auto_157965 ) ) ( not ( = ?auto_157956 ?auto_157957 ) ) ( not ( = ?auto_157956 ?auto_157958 ) ) ( not ( = ?auto_157956 ?auto_157959 ) ) ( not ( = ?auto_157956 ?auto_157960 ) ) ( not ( = ?auto_157956 ?auto_157961 ) ) ( not ( = ?auto_157956 ?auto_157962 ) ) ( not ( = ?auto_157956 ?auto_157963 ) ) ( not ( = ?auto_157956 ?auto_157964 ) ) ( not ( = ?auto_157956 ?auto_157965 ) ) ( not ( = ?auto_157957 ?auto_157958 ) ) ( not ( = ?auto_157957 ?auto_157959 ) ) ( not ( = ?auto_157957 ?auto_157960 ) ) ( not ( = ?auto_157957 ?auto_157961 ) ) ( not ( = ?auto_157957 ?auto_157962 ) ) ( not ( = ?auto_157957 ?auto_157963 ) ) ( not ( = ?auto_157957 ?auto_157964 ) ) ( not ( = ?auto_157957 ?auto_157965 ) ) ( not ( = ?auto_157958 ?auto_157959 ) ) ( not ( = ?auto_157958 ?auto_157960 ) ) ( not ( = ?auto_157958 ?auto_157961 ) ) ( not ( = ?auto_157958 ?auto_157962 ) ) ( not ( = ?auto_157958 ?auto_157963 ) ) ( not ( = ?auto_157958 ?auto_157964 ) ) ( not ( = ?auto_157958 ?auto_157965 ) ) ( not ( = ?auto_157959 ?auto_157960 ) ) ( not ( = ?auto_157959 ?auto_157961 ) ) ( not ( = ?auto_157959 ?auto_157962 ) ) ( not ( = ?auto_157959 ?auto_157963 ) ) ( not ( = ?auto_157959 ?auto_157964 ) ) ( not ( = ?auto_157959 ?auto_157965 ) ) ( not ( = ?auto_157960 ?auto_157961 ) ) ( not ( = ?auto_157960 ?auto_157962 ) ) ( not ( = ?auto_157960 ?auto_157963 ) ) ( not ( = ?auto_157960 ?auto_157964 ) ) ( not ( = ?auto_157960 ?auto_157965 ) ) ( not ( = ?auto_157961 ?auto_157962 ) ) ( not ( = ?auto_157961 ?auto_157963 ) ) ( not ( = ?auto_157961 ?auto_157964 ) ) ( not ( = ?auto_157961 ?auto_157965 ) ) ( not ( = ?auto_157962 ?auto_157963 ) ) ( not ( = ?auto_157962 ?auto_157964 ) ) ( not ( = ?auto_157962 ?auto_157965 ) ) ( not ( = ?auto_157963 ?auto_157964 ) ) ( not ( = ?auto_157963 ?auto_157965 ) ) ( not ( = ?auto_157964 ?auto_157965 ) ) ( ON ?auto_157963 ?auto_157964 ) ( ON ?auto_157962 ?auto_157963 ) ( CLEAR ?auto_157960 ) ( ON ?auto_157961 ?auto_157962 ) ( CLEAR ?auto_157961 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_157953 ?auto_157954 ?auto_157955 ?auto_157956 ?auto_157957 ?auto_157958 ?auto_157959 ?auto_157960 ?auto_157961 )
      ( MAKE-12PILE ?auto_157953 ?auto_157954 ?auto_157955 ?auto_157956 ?auto_157957 ?auto_157958 ?auto_157959 ?auto_157960 ?auto_157961 ?auto_157962 ?auto_157963 ?auto_157964 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_157978 - BLOCK
      ?auto_157979 - BLOCK
      ?auto_157980 - BLOCK
      ?auto_157981 - BLOCK
      ?auto_157982 - BLOCK
      ?auto_157983 - BLOCK
      ?auto_157984 - BLOCK
      ?auto_157985 - BLOCK
      ?auto_157986 - BLOCK
      ?auto_157987 - BLOCK
      ?auto_157988 - BLOCK
      ?auto_157989 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_157989 ) ( ON-TABLE ?auto_157978 ) ( ON ?auto_157979 ?auto_157978 ) ( ON ?auto_157980 ?auto_157979 ) ( ON ?auto_157981 ?auto_157980 ) ( ON ?auto_157982 ?auto_157981 ) ( ON ?auto_157983 ?auto_157982 ) ( ON ?auto_157984 ?auto_157983 ) ( ON ?auto_157985 ?auto_157984 ) ( not ( = ?auto_157978 ?auto_157979 ) ) ( not ( = ?auto_157978 ?auto_157980 ) ) ( not ( = ?auto_157978 ?auto_157981 ) ) ( not ( = ?auto_157978 ?auto_157982 ) ) ( not ( = ?auto_157978 ?auto_157983 ) ) ( not ( = ?auto_157978 ?auto_157984 ) ) ( not ( = ?auto_157978 ?auto_157985 ) ) ( not ( = ?auto_157978 ?auto_157986 ) ) ( not ( = ?auto_157978 ?auto_157987 ) ) ( not ( = ?auto_157978 ?auto_157988 ) ) ( not ( = ?auto_157978 ?auto_157989 ) ) ( not ( = ?auto_157979 ?auto_157980 ) ) ( not ( = ?auto_157979 ?auto_157981 ) ) ( not ( = ?auto_157979 ?auto_157982 ) ) ( not ( = ?auto_157979 ?auto_157983 ) ) ( not ( = ?auto_157979 ?auto_157984 ) ) ( not ( = ?auto_157979 ?auto_157985 ) ) ( not ( = ?auto_157979 ?auto_157986 ) ) ( not ( = ?auto_157979 ?auto_157987 ) ) ( not ( = ?auto_157979 ?auto_157988 ) ) ( not ( = ?auto_157979 ?auto_157989 ) ) ( not ( = ?auto_157980 ?auto_157981 ) ) ( not ( = ?auto_157980 ?auto_157982 ) ) ( not ( = ?auto_157980 ?auto_157983 ) ) ( not ( = ?auto_157980 ?auto_157984 ) ) ( not ( = ?auto_157980 ?auto_157985 ) ) ( not ( = ?auto_157980 ?auto_157986 ) ) ( not ( = ?auto_157980 ?auto_157987 ) ) ( not ( = ?auto_157980 ?auto_157988 ) ) ( not ( = ?auto_157980 ?auto_157989 ) ) ( not ( = ?auto_157981 ?auto_157982 ) ) ( not ( = ?auto_157981 ?auto_157983 ) ) ( not ( = ?auto_157981 ?auto_157984 ) ) ( not ( = ?auto_157981 ?auto_157985 ) ) ( not ( = ?auto_157981 ?auto_157986 ) ) ( not ( = ?auto_157981 ?auto_157987 ) ) ( not ( = ?auto_157981 ?auto_157988 ) ) ( not ( = ?auto_157981 ?auto_157989 ) ) ( not ( = ?auto_157982 ?auto_157983 ) ) ( not ( = ?auto_157982 ?auto_157984 ) ) ( not ( = ?auto_157982 ?auto_157985 ) ) ( not ( = ?auto_157982 ?auto_157986 ) ) ( not ( = ?auto_157982 ?auto_157987 ) ) ( not ( = ?auto_157982 ?auto_157988 ) ) ( not ( = ?auto_157982 ?auto_157989 ) ) ( not ( = ?auto_157983 ?auto_157984 ) ) ( not ( = ?auto_157983 ?auto_157985 ) ) ( not ( = ?auto_157983 ?auto_157986 ) ) ( not ( = ?auto_157983 ?auto_157987 ) ) ( not ( = ?auto_157983 ?auto_157988 ) ) ( not ( = ?auto_157983 ?auto_157989 ) ) ( not ( = ?auto_157984 ?auto_157985 ) ) ( not ( = ?auto_157984 ?auto_157986 ) ) ( not ( = ?auto_157984 ?auto_157987 ) ) ( not ( = ?auto_157984 ?auto_157988 ) ) ( not ( = ?auto_157984 ?auto_157989 ) ) ( not ( = ?auto_157985 ?auto_157986 ) ) ( not ( = ?auto_157985 ?auto_157987 ) ) ( not ( = ?auto_157985 ?auto_157988 ) ) ( not ( = ?auto_157985 ?auto_157989 ) ) ( not ( = ?auto_157986 ?auto_157987 ) ) ( not ( = ?auto_157986 ?auto_157988 ) ) ( not ( = ?auto_157986 ?auto_157989 ) ) ( not ( = ?auto_157987 ?auto_157988 ) ) ( not ( = ?auto_157987 ?auto_157989 ) ) ( not ( = ?auto_157988 ?auto_157989 ) ) ( ON ?auto_157988 ?auto_157989 ) ( ON ?auto_157987 ?auto_157988 ) ( CLEAR ?auto_157985 ) ( ON ?auto_157986 ?auto_157987 ) ( CLEAR ?auto_157986 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_157978 ?auto_157979 ?auto_157980 ?auto_157981 ?auto_157982 ?auto_157983 ?auto_157984 ?auto_157985 ?auto_157986 )
      ( MAKE-12PILE ?auto_157978 ?auto_157979 ?auto_157980 ?auto_157981 ?auto_157982 ?auto_157983 ?auto_157984 ?auto_157985 ?auto_157986 ?auto_157987 ?auto_157988 ?auto_157989 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_158002 - BLOCK
      ?auto_158003 - BLOCK
      ?auto_158004 - BLOCK
      ?auto_158005 - BLOCK
      ?auto_158006 - BLOCK
      ?auto_158007 - BLOCK
      ?auto_158008 - BLOCK
      ?auto_158009 - BLOCK
      ?auto_158010 - BLOCK
      ?auto_158011 - BLOCK
      ?auto_158012 - BLOCK
      ?auto_158013 - BLOCK
    )
    :vars
    (
      ?auto_158014 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158013 ?auto_158014 ) ( ON-TABLE ?auto_158002 ) ( ON ?auto_158003 ?auto_158002 ) ( ON ?auto_158004 ?auto_158003 ) ( ON ?auto_158005 ?auto_158004 ) ( ON ?auto_158006 ?auto_158005 ) ( ON ?auto_158007 ?auto_158006 ) ( ON ?auto_158008 ?auto_158007 ) ( not ( = ?auto_158002 ?auto_158003 ) ) ( not ( = ?auto_158002 ?auto_158004 ) ) ( not ( = ?auto_158002 ?auto_158005 ) ) ( not ( = ?auto_158002 ?auto_158006 ) ) ( not ( = ?auto_158002 ?auto_158007 ) ) ( not ( = ?auto_158002 ?auto_158008 ) ) ( not ( = ?auto_158002 ?auto_158009 ) ) ( not ( = ?auto_158002 ?auto_158010 ) ) ( not ( = ?auto_158002 ?auto_158011 ) ) ( not ( = ?auto_158002 ?auto_158012 ) ) ( not ( = ?auto_158002 ?auto_158013 ) ) ( not ( = ?auto_158002 ?auto_158014 ) ) ( not ( = ?auto_158003 ?auto_158004 ) ) ( not ( = ?auto_158003 ?auto_158005 ) ) ( not ( = ?auto_158003 ?auto_158006 ) ) ( not ( = ?auto_158003 ?auto_158007 ) ) ( not ( = ?auto_158003 ?auto_158008 ) ) ( not ( = ?auto_158003 ?auto_158009 ) ) ( not ( = ?auto_158003 ?auto_158010 ) ) ( not ( = ?auto_158003 ?auto_158011 ) ) ( not ( = ?auto_158003 ?auto_158012 ) ) ( not ( = ?auto_158003 ?auto_158013 ) ) ( not ( = ?auto_158003 ?auto_158014 ) ) ( not ( = ?auto_158004 ?auto_158005 ) ) ( not ( = ?auto_158004 ?auto_158006 ) ) ( not ( = ?auto_158004 ?auto_158007 ) ) ( not ( = ?auto_158004 ?auto_158008 ) ) ( not ( = ?auto_158004 ?auto_158009 ) ) ( not ( = ?auto_158004 ?auto_158010 ) ) ( not ( = ?auto_158004 ?auto_158011 ) ) ( not ( = ?auto_158004 ?auto_158012 ) ) ( not ( = ?auto_158004 ?auto_158013 ) ) ( not ( = ?auto_158004 ?auto_158014 ) ) ( not ( = ?auto_158005 ?auto_158006 ) ) ( not ( = ?auto_158005 ?auto_158007 ) ) ( not ( = ?auto_158005 ?auto_158008 ) ) ( not ( = ?auto_158005 ?auto_158009 ) ) ( not ( = ?auto_158005 ?auto_158010 ) ) ( not ( = ?auto_158005 ?auto_158011 ) ) ( not ( = ?auto_158005 ?auto_158012 ) ) ( not ( = ?auto_158005 ?auto_158013 ) ) ( not ( = ?auto_158005 ?auto_158014 ) ) ( not ( = ?auto_158006 ?auto_158007 ) ) ( not ( = ?auto_158006 ?auto_158008 ) ) ( not ( = ?auto_158006 ?auto_158009 ) ) ( not ( = ?auto_158006 ?auto_158010 ) ) ( not ( = ?auto_158006 ?auto_158011 ) ) ( not ( = ?auto_158006 ?auto_158012 ) ) ( not ( = ?auto_158006 ?auto_158013 ) ) ( not ( = ?auto_158006 ?auto_158014 ) ) ( not ( = ?auto_158007 ?auto_158008 ) ) ( not ( = ?auto_158007 ?auto_158009 ) ) ( not ( = ?auto_158007 ?auto_158010 ) ) ( not ( = ?auto_158007 ?auto_158011 ) ) ( not ( = ?auto_158007 ?auto_158012 ) ) ( not ( = ?auto_158007 ?auto_158013 ) ) ( not ( = ?auto_158007 ?auto_158014 ) ) ( not ( = ?auto_158008 ?auto_158009 ) ) ( not ( = ?auto_158008 ?auto_158010 ) ) ( not ( = ?auto_158008 ?auto_158011 ) ) ( not ( = ?auto_158008 ?auto_158012 ) ) ( not ( = ?auto_158008 ?auto_158013 ) ) ( not ( = ?auto_158008 ?auto_158014 ) ) ( not ( = ?auto_158009 ?auto_158010 ) ) ( not ( = ?auto_158009 ?auto_158011 ) ) ( not ( = ?auto_158009 ?auto_158012 ) ) ( not ( = ?auto_158009 ?auto_158013 ) ) ( not ( = ?auto_158009 ?auto_158014 ) ) ( not ( = ?auto_158010 ?auto_158011 ) ) ( not ( = ?auto_158010 ?auto_158012 ) ) ( not ( = ?auto_158010 ?auto_158013 ) ) ( not ( = ?auto_158010 ?auto_158014 ) ) ( not ( = ?auto_158011 ?auto_158012 ) ) ( not ( = ?auto_158011 ?auto_158013 ) ) ( not ( = ?auto_158011 ?auto_158014 ) ) ( not ( = ?auto_158012 ?auto_158013 ) ) ( not ( = ?auto_158012 ?auto_158014 ) ) ( not ( = ?auto_158013 ?auto_158014 ) ) ( ON ?auto_158012 ?auto_158013 ) ( ON ?auto_158011 ?auto_158012 ) ( ON ?auto_158010 ?auto_158011 ) ( CLEAR ?auto_158008 ) ( ON ?auto_158009 ?auto_158010 ) ( CLEAR ?auto_158009 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_158002 ?auto_158003 ?auto_158004 ?auto_158005 ?auto_158006 ?auto_158007 ?auto_158008 ?auto_158009 )
      ( MAKE-12PILE ?auto_158002 ?auto_158003 ?auto_158004 ?auto_158005 ?auto_158006 ?auto_158007 ?auto_158008 ?auto_158009 ?auto_158010 ?auto_158011 ?auto_158012 ?auto_158013 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_158027 - BLOCK
      ?auto_158028 - BLOCK
      ?auto_158029 - BLOCK
      ?auto_158030 - BLOCK
      ?auto_158031 - BLOCK
      ?auto_158032 - BLOCK
      ?auto_158033 - BLOCK
      ?auto_158034 - BLOCK
      ?auto_158035 - BLOCK
      ?auto_158036 - BLOCK
      ?auto_158037 - BLOCK
      ?auto_158038 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_158038 ) ( ON-TABLE ?auto_158027 ) ( ON ?auto_158028 ?auto_158027 ) ( ON ?auto_158029 ?auto_158028 ) ( ON ?auto_158030 ?auto_158029 ) ( ON ?auto_158031 ?auto_158030 ) ( ON ?auto_158032 ?auto_158031 ) ( ON ?auto_158033 ?auto_158032 ) ( not ( = ?auto_158027 ?auto_158028 ) ) ( not ( = ?auto_158027 ?auto_158029 ) ) ( not ( = ?auto_158027 ?auto_158030 ) ) ( not ( = ?auto_158027 ?auto_158031 ) ) ( not ( = ?auto_158027 ?auto_158032 ) ) ( not ( = ?auto_158027 ?auto_158033 ) ) ( not ( = ?auto_158027 ?auto_158034 ) ) ( not ( = ?auto_158027 ?auto_158035 ) ) ( not ( = ?auto_158027 ?auto_158036 ) ) ( not ( = ?auto_158027 ?auto_158037 ) ) ( not ( = ?auto_158027 ?auto_158038 ) ) ( not ( = ?auto_158028 ?auto_158029 ) ) ( not ( = ?auto_158028 ?auto_158030 ) ) ( not ( = ?auto_158028 ?auto_158031 ) ) ( not ( = ?auto_158028 ?auto_158032 ) ) ( not ( = ?auto_158028 ?auto_158033 ) ) ( not ( = ?auto_158028 ?auto_158034 ) ) ( not ( = ?auto_158028 ?auto_158035 ) ) ( not ( = ?auto_158028 ?auto_158036 ) ) ( not ( = ?auto_158028 ?auto_158037 ) ) ( not ( = ?auto_158028 ?auto_158038 ) ) ( not ( = ?auto_158029 ?auto_158030 ) ) ( not ( = ?auto_158029 ?auto_158031 ) ) ( not ( = ?auto_158029 ?auto_158032 ) ) ( not ( = ?auto_158029 ?auto_158033 ) ) ( not ( = ?auto_158029 ?auto_158034 ) ) ( not ( = ?auto_158029 ?auto_158035 ) ) ( not ( = ?auto_158029 ?auto_158036 ) ) ( not ( = ?auto_158029 ?auto_158037 ) ) ( not ( = ?auto_158029 ?auto_158038 ) ) ( not ( = ?auto_158030 ?auto_158031 ) ) ( not ( = ?auto_158030 ?auto_158032 ) ) ( not ( = ?auto_158030 ?auto_158033 ) ) ( not ( = ?auto_158030 ?auto_158034 ) ) ( not ( = ?auto_158030 ?auto_158035 ) ) ( not ( = ?auto_158030 ?auto_158036 ) ) ( not ( = ?auto_158030 ?auto_158037 ) ) ( not ( = ?auto_158030 ?auto_158038 ) ) ( not ( = ?auto_158031 ?auto_158032 ) ) ( not ( = ?auto_158031 ?auto_158033 ) ) ( not ( = ?auto_158031 ?auto_158034 ) ) ( not ( = ?auto_158031 ?auto_158035 ) ) ( not ( = ?auto_158031 ?auto_158036 ) ) ( not ( = ?auto_158031 ?auto_158037 ) ) ( not ( = ?auto_158031 ?auto_158038 ) ) ( not ( = ?auto_158032 ?auto_158033 ) ) ( not ( = ?auto_158032 ?auto_158034 ) ) ( not ( = ?auto_158032 ?auto_158035 ) ) ( not ( = ?auto_158032 ?auto_158036 ) ) ( not ( = ?auto_158032 ?auto_158037 ) ) ( not ( = ?auto_158032 ?auto_158038 ) ) ( not ( = ?auto_158033 ?auto_158034 ) ) ( not ( = ?auto_158033 ?auto_158035 ) ) ( not ( = ?auto_158033 ?auto_158036 ) ) ( not ( = ?auto_158033 ?auto_158037 ) ) ( not ( = ?auto_158033 ?auto_158038 ) ) ( not ( = ?auto_158034 ?auto_158035 ) ) ( not ( = ?auto_158034 ?auto_158036 ) ) ( not ( = ?auto_158034 ?auto_158037 ) ) ( not ( = ?auto_158034 ?auto_158038 ) ) ( not ( = ?auto_158035 ?auto_158036 ) ) ( not ( = ?auto_158035 ?auto_158037 ) ) ( not ( = ?auto_158035 ?auto_158038 ) ) ( not ( = ?auto_158036 ?auto_158037 ) ) ( not ( = ?auto_158036 ?auto_158038 ) ) ( not ( = ?auto_158037 ?auto_158038 ) ) ( ON ?auto_158037 ?auto_158038 ) ( ON ?auto_158036 ?auto_158037 ) ( ON ?auto_158035 ?auto_158036 ) ( CLEAR ?auto_158033 ) ( ON ?auto_158034 ?auto_158035 ) ( CLEAR ?auto_158034 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_158027 ?auto_158028 ?auto_158029 ?auto_158030 ?auto_158031 ?auto_158032 ?auto_158033 ?auto_158034 )
      ( MAKE-12PILE ?auto_158027 ?auto_158028 ?auto_158029 ?auto_158030 ?auto_158031 ?auto_158032 ?auto_158033 ?auto_158034 ?auto_158035 ?auto_158036 ?auto_158037 ?auto_158038 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_158051 - BLOCK
      ?auto_158052 - BLOCK
      ?auto_158053 - BLOCK
      ?auto_158054 - BLOCK
      ?auto_158055 - BLOCK
      ?auto_158056 - BLOCK
      ?auto_158057 - BLOCK
      ?auto_158058 - BLOCK
      ?auto_158059 - BLOCK
      ?auto_158060 - BLOCK
      ?auto_158061 - BLOCK
      ?auto_158062 - BLOCK
    )
    :vars
    (
      ?auto_158063 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158062 ?auto_158063 ) ( ON-TABLE ?auto_158051 ) ( ON ?auto_158052 ?auto_158051 ) ( ON ?auto_158053 ?auto_158052 ) ( ON ?auto_158054 ?auto_158053 ) ( ON ?auto_158055 ?auto_158054 ) ( ON ?auto_158056 ?auto_158055 ) ( not ( = ?auto_158051 ?auto_158052 ) ) ( not ( = ?auto_158051 ?auto_158053 ) ) ( not ( = ?auto_158051 ?auto_158054 ) ) ( not ( = ?auto_158051 ?auto_158055 ) ) ( not ( = ?auto_158051 ?auto_158056 ) ) ( not ( = ?auto_158051 ?auto_158057 ) ) ( not ( = ?auto_158051 ?auto_158058 ) ) ( not ( = ?auto_158051 ?auto_158059 ) ) ( not ( = ?auto_158051 ?auto_158060 ) ) ( not ( = ?auto_158051 ?auto_158061 ) ) ( not ( = ?auto_158051 ?auto_158062 ) ) ( not ( = ?auto_158051 ?auto_158063 ) ) ( not ( = ?auto_158052 ?auto_158053 ) ) ( not ( = ?auto_158052 ?auto_158054 ) ) ( not ( = ?auto_158052 ?auto_158055 ) ) ( not ( = ?auto_158052 ?auto_158056 ) ) ( not ( = ?auto_158052 ?auto_158057 ) ) ( not ( = ?auto_158052 ?auto_158058 ) ) ( not ( = ?auto_158052 ?auto_158059 ) ) ( not ( = ?auto_158052 ?auto_158060 ) ) ( not ( = ?auto_158052 ?auto_158061 ) ) ( not ( = ?auto_158052 ?auto_158062 ) ) ( not ( = ?auto_158052 ?auto_158063 ) ) ( not ( = ?auto_158053 ?auto_158054 ) ) ( not ( = ?auto_158053 ?auto_158055 ) ) ( not ( = ?auto_158053 ?auto_158056 ) ) ( not ( = ?auto_158053 ?auto_158057 ) ) ( not ( = ?auto_158053 ?auto_158058 ) ) ( not ( = ?auto_158053 ?auto_158059 ) ) ( not ( = ?auto_158053 ?auto_158060 ) ) ( not ( = ?auto_158053 ?auto_158061 ) ) ( not ( = ?auto_158053 ?auto_158062 ) ) ( not ( = ?auto_158053 ?auto_158063 ) ) ( not ( = ?auto_158054 ?auto_158055 ) ) ( not ( = ?auto_158054 ?auto_158056 ) ) ( not ( = ?auto_158054 ?auto_158057 ) ) ( not ( = ?auto_158054 ?auto_158058 ) ) ( not ( = ?auto_158054 ?auto_158059 ) ) ( not ( = ?auto_158054 ?auto_158060 ) ) ( not ( = ?auto_158054 ?auto_158061 ) ) ( not ( = ?auto_158054 ?auto_158062 ) ) ( not ( = ?auto_158054 ?auto_158063 ) ) ( not ( = ?auto_158055 ?auto_158056 ) ) ( not ( = ?auto_158055 ?auto_158057 ) ) ( not ( = ?auto_158055 ?auto_158058 ) ) ( not ( = ?auto_158055 ?auto_158059 ) ) ( not ( = ?auto_158055 ?auto_158060 ) ) ( not ( = ?auto_158055 ?auto_158061 ) ) ( not ( = ?auto_158055 ?auto_158062 ) ) ( not ( = ?auto_158055 ?auto_158063 ) ) ( not ( = ?auto_158056 ?auto_158057 ) ) ( not ( = ?auto_158056 ?auto_158058 ) ) ( not ( = ?auto_158056 ?auto_158059 ) ) ( not ( = ?auto_158056 ?auto_158060 ) ) ( not ( = ?auto_158056 ?auto_158061 ) ) ( not ( = ?auto_158056 ?auto_158062 ) ) ( not ( = ?auto_158056 ?auto_158063 ) ) ( not ( = ?auto_158057 ?auto_158058 ) ) ( not ( = ?auto_158057 ?auto_158059 ) ) ( not ( = ?auto_158057 ?auto_158060 ) ) ( not ( = ?auto_158057 ?auto_158061 ) ) ( not ( = ?auto_158057 ?auto_158062 ) ) ( not ( = ?auto_158057 ?auto_158063 ) ) ( not ( = ?auto_158058 ?auto_158059 ) ) ( not ( = ?auto_158058 ?auto_158060 ) ) ( not ( = ?auto_158058 ?auto_158061 ) ) ( not ( = ?auto_158058 ?auto_158062 ) ) ( not ( = ?auto_158058 ?auto_158063 ) ) ( not ( = ?auto_158059 ?auto_158060 ) ) ( not ( = ?auto_158059 ?auto_158061 ) ) ( not ( = ?auto_158059 ?auto_158062 ) ) ( not ( = ?auto_158059 ?auto_158063 ) ) ( not ( = ?auto_158060 ?auto_158061 ) ) ( not ( = ?auto_158060 ?auto_158062 ) ) ( not ( = ?auto_158060 ?auto_158063 ) ) ( not ( = ?auto_158061 ?auto_158062 ) ) ( not ( = ?auto_158061 ?auto_158063 ) ) ( not ( = ?auto_158062 ?auto_158063 ) ) ( ON ?auto_158061 ?auto_158062 ) ( ON ?auto_158060 ?auto_158061 ) ( ON ?auto_158059 ?auto_158060 ) ( ON ?auto_158058 ?auto_158059 ) ( CLEAR ?auto_158056 ) ( ON ?auto_158057 ?auto_158058 ) ( CLEAR ?auto_158057 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_158051 ?auto_158052 ?auto_158053 ?auto_158054 ?auto_158055 ?auto_158056 ?auto_158057 )
      ( MAKE-12PILE ?auto_158051 ?auto_158052 ?auto_158053 ?auto_158054 ?auto_158055 ?auto_158056 ?auto_158057 ?auto_158058 ?auto_158059 ?auto_158060 ?auto_158061 ?auto_158062 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_158076 - BLOCK
      ?auto_158077 - BLOCK
      ?auto_158078 - BLOCK
      ?auto_158079 - BLOCK
      ?auto_158080 - BLOCK
      ?auto_158081 - BLOCK
      ?auto_158082 - BLOCK
      ?auto_158083 - BLOCK
      ?auto_158084 - BLOCK
      ?auto_158085 - BLOCK
      ?auto_158086 - BLOCK
      ?auto_158087 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_158087 ) ( ON-TABLE ?auto_158076 ) ( ON ?auto_158077 ?auto_158076 ) ( ON ?auto_158078 ?auto_158077 ) ( ON ?auto_158079 ?auto_158078 ) ( ON ?auto_158080 ?auto_158079 ) ( ON ?auto_158081 ?auto_158080 ) ( not ( = ?auto_158076 ?auto_158077 ) ) ( not ( = ?auto_158076 ?auto_158078 ) ) ( not ( = ?auto_158076 ?auto_158079 ) ) ( not ( = ?auto_158076 ?auto_158080 ) ) ( not ( = ?auto_158076 ?auto_158081 ) ) ( not ( = ?auto_158076 ?auto_158082 ) ) ( not ( = ?auto_158076 ?auto_158083 ) ) ( not ( = ?auto_158076 ?auto_158084 ) ) ( not ( = ?auto_158076 ?auto_158085 ) ) ( not ( = ?auto_158076 ?auto_158086 ) ) ( not ( = ?auto_158076 ?auto_158087 ) ) ( not ( = ?auto_158077 ?auto_158078 ) ) ( not ( = ?auto_158077 ?auto_158079 ) ) ( not ( = ?auto_158077 ?auto_158080 ) ) ( not ( = ?auto_158077 ?auto_158081 ) ) ( not ( = ?auto_158077 ?auto_158082 ) ) ( not ( = ?auto_158077 ?auto_158083 ) ) ( not ( = ?auto_158077 ?auto_158084 ) ) ( not ( = ?auto_158077 ?auto_158085 ) ) ( not ( = ?auto_158077 ?auto_158086 ) ) ( not ( = ?auto_158077 ?auto_158087 ) ) ( not ( = ?auto_158078 ?auto_158079 ) ) ( not ( = ?auto_158078 ?auto_158080 ) ) ( not ( = ?auto_158078 ?auto_158081 ) ) ( not ( = ?auto_158078 ?auto_158082 ) ) ( not ( = ?auto_158078 ?auto_158083 ) ) ( not ( = ?auto_158078 ?auto_158084 ) ) ( not ( = ?auto_158078 ?auto_158085 ) ) ( not ( = ?auto_158078 ?auto_158086 ) ) ( not ( = ?auto_158078 ?auto_158087 ) ) ( not ( = ?auto_158079 ?auto_158080 ) ) ( not ( = ?auto_158079 ?auto_158081 ) ) ( not ( = ?auto_158079 ?auto_158082 ) ) ( not ( = ?auto_158079 ?auto_158083 ) ) ( not ( = ?auto_158079 ?auto_158084 ) ) ( not ( = ?auto_158079 ?auto_158085 ) ) ( not ( = ?auto_158079 ?auto_158086 ) ) ( not ( = ?auto_158079 ?auto_158087 ) ) ( not ( = ?auto_158080 ?auto_158081 ) ) ( not ( = ?auto_158080 ?auto_158082 ) ) ( not ( = ?auto_158080 ?auto_158083 ) ) ( not ( = ?auto_158080 ?auto_158084 ) ) ( not ( = ?auto_158080 ?auto_158085 ) ) ( not ( = ?auto_158080 ?auto_158086 ) ) ( not ( = ?auto_158080 ?auto_158087 ) ) ( not ( = ?auto_158081 ?auto_158082 ) ) ( not ( = ?auto_158081 ?auto_158083 ) ) ( not ( = ?auto_158081 ?auto_158084 ) ) ( not ( = ?auto_158081 ?auto_158085 ) ) ( not ( = ?auto_158081 ?auto_158086 ) ) ( not ( = ?auto_158081 ?auto_158087 ) ) ( not ( = ?auto_158082 ?auto_158083 ) ) ( not ( = ?auto_158082 ?auto_158084 ) ) ( not ( = ?auto_158082 ?auto_158085 ) ) ( not ( = ?auto_158082 ?auto_158086 ) ) ( not ( = ?auto_158082 ?auto_158087 ) ) ( not ( = ?auto_158083 ?auto_158084 ) ) ( not ( = ?auto_158083 ?auto_158085 ) ) ( not ( = ?auto_158083 ?auto_158086 ) ) ( not ( = ?auto_158083 ?auto_158087 ) ) ( not ( = ?auto_158084 ?auto_158085 ) ) ( not ( = ?auto_158084 ?auto_158086 ) ) ( not ( = ?auto_158084 ?auto_158087 ) ) ( not ( = ?auto_158085 ?auto_158086 ) ) ( not ( = ?auto_158085 ?auto_158087 ) ) ( not ( = ?auto_158086 ?auto_158087 ) ) ( ON ?auto_158086 ?auto_158087 ) ( ON ?auto_158085 ?auto_158086 ) ( ON ?auto_158084 ?auto_158085 ) ( ON ?auto_158083 ?auto_158084 ) ( CLEAR ?auto_158081 ) ( ON ?auto_158082 ?auto_158083 ) ( CLEAR ?auto_158082 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_158076 ?auto_158077 ?auto_158078 ?auto_158079 ?auto_158080 ?auto_158081 ?auto_158082 )
      ( MAKE-12PILE ?auto_158076 ?auto_158077 ?auto_158078 ?auto_158079 ?auto_158080 ?auto_158081 ?auto_158082 ?auto_158083 ?auto_158084 ?auto_158085 ?auto_158086 ?auto_158087 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_158100 - BLOCK
      ?auto_158101 - BLOCK
      ?auto_158102 - BLOCK
      ?auto_158103 - BLOCK
      ?auto_158104 - BLOCK
      ?auto_158105 - BLOCK
      ?auto_158106 - BLOCK
      ?auto_158107 - BLOCK
      ?auto_158108 - BLOCK
      ?auto_158109 - BLOCK
      ?auto_158110 - BLOCK
      ?auto_158111 - BLOCK
    )
    :vars
    (
      ?auto_158112 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158111 ?auto_158112 ) ( ON-TABLE ?auto_158100 ) ( ON ?auto_158101 ?auto_158100 ) ( ON ?auto_158102 ?auto_158101 ) ( ON ?auto_158103 ?auto_158102 ) ( ON ?auto_158104 ?auto_158103 ) ( not ( = ?auto_158100 ?auto_158101 ) ) ( not ( = ?auto_158100 ?auto_158102 ) ) ( not ( = ?auto_158100 ?auto_158103 ) ) ( not ( = ?auto_158100 ?auto_158104 ) ) ( not ( = ?auto_158100 ?auto_158105 ) ) ( not ( = ?auto_158100 ?auto_158106 ) ) ( not ( = ?auto_158100 ?auto_158107 ) ) ( not ( = ?auto_158100 ?auto_158108 ) ) ( not ( = ?auto_158100 ?auto_158109 ) ) ( not ( = ?auto_158100 ?auto_158110 ) ) ( not ( = ?auto_158100 ?auto_158111 ) ) ( not ( = ?auto_158100 ?auto_158112 ) ) ( not ( = ?auto_158101 ?auto_158102 ) ) ( not ( = ?auto_158101 ?auto_158103 ) ) ( not ( = ?auto_158101 ?auto_158104 ) ) ( not ( = ?auto_158101 ?auto_158105 ) ) ( not ( = ?auto_158101 ?auto_158106 ) ) ( not ( = ?auto_158101 ?auto_158107 ) ) ( not ( = ?auto_158101 ?auto_158108 ) ) ( not ( = ?auto_158101 ?auto_158109 ) ) ( not ( = ?auto_158101 ?auto_158110 ) ) ( not ( = ?auto_158101 ?auto_158111 ) ) ( not ( = ?auto_158101 ?auto_158112 ) ) ( not ( = ?auto_158102 ?auto_158103 ) ) ( not ( = ?auto_158102 ?auto_158104 ) ) ( not ( = ?auto_158102 ?auto_158105 ) ) ( not ( = ?auto_158102 ?auto_158106 ) ) ( not ( = ?auto_158102 ?auto_158107 ) ) ( not ( = ?auto_158102 ?auto_158108 ) ) ( not ( = ?auto_158102 ?auto_158109 ) ) ( not ( = ?auto_158102 ?auto_158110 ) ) ( not ( = ?auto_158102 ?auto_158111 ) ) ( not ( = ?auto_158102 ?auto_158112 ) ) ( not ( = ?auto_158103 ?auto_158104 ) ) ( not ( = ?auto_158103 ?auto_158105 ) ) ( not ( = ?auto_158103 ?auto_158106 ) ) ( not ( = ?auto_158103 ?auto_158107 ) ) ( not ( = ?auto_158103 ?auto_158108 ) ) ( not ( = ?auto_158103 ?auto_158109 ) ) ( not ( = ?auto_158103 ?auto_158110 ) ) ( not ( = ?auto_158103 ?auto_158111 ) ) ( not ( = ?auto_158103 ?auto_158112 ) ) ( not ( = ?auto_158104 ?auto_158105 ) ) ( not ( = ?auto_158104 ?auto_158106 ) ) ( not ( = ?auto_158104 ?auto_158107 ) ) ( not ( = ?auto_158104 ?auto_158108 ) ) ( not ( = ?auto_158104 ?auto_158109 ) ) ( not ( = ?auto_158104 ?auto_158110 ) ) ( not ( = ?auto_158104 ?auto_158111 ) ) ( not ( = ?auto_158104 ?auto_158112 ) ) ( not ( = ?auto_158105 ?auto_158106 ) ) ( not ( = ?auto_158105 ?auto_158107 ) ) ( not ( = ?auto_158105 ?auto_158108 ) ) ( not ( = ?auto_158105 ?auto_158109 ) ) ( not ( = ?auto_158105 ?auto_158110 ) ) ( not ( = ?auto_158105 ?auto_158111 ) ) ( not ( = ?auto_158105 ?auto_158112 ) ) ( not ( = ?auto_158106 ?auto_158107 ) ) ( not ( = ?auto_158106 ?auto_158108 ) ) ( not ( = ?auto_158106 ?auto_158109 ) ) ( not ( = ?auto_158106 ?auto_158110 ) ) ( not ( = ?auto_158106 ?auto_158111 ) ) ( not ( = ?auto_158106 ?auto_158112 ) ) ( not ( = ?auto_158107 ?auto_158108 ) ) ( not ( = ?auto_158107 ?auto_158109 ) ) ( not ( = ?auto_158107 ?auto_158110 ) ) ( not ( = ?auto_158107 ?auto_158111 ) ) ( not ( = ?auto_158107 ?auto_158112 ) ) ( not ( = ?auto_158108 ?auto_158109 ) ) ( not ( = ?auto_158108 ?auto_158110 ) ) ( not ( = ?auto_158108 ?auto_158111 ) ) ( not ( = ?auto_158108 ?auto_158112 ) ) ( not ( = ?auto_158109 ?auto_158110 ) ) ( not ( = ?auto_158109 ?auto_158111 ) ) ( not ( = ?auto_158109 ?auto_158112 ) ) ( not ( = ?auto_158110 ?auto_158111 ) ) ( not ( = ?auto_158110 ?auto_158112 ) ) ( not ( = ?auto_158111 ?auto_158112 ) ) ( ON ?auto_158110 ?auto_158111 ) ( ON ?auto_158109 ?auto_158110 ) ( ON ?auto_158108 ?auto_158109 ) ( ON ?auto_158107 ?auto_158108 ) ( ON ?auto_158106 ?auto_158107 ) ( CLEAR ?auto_158104 ) ( ON ?auto_158105 ?auto_158106 ) ( CLEAR ?auto_158105 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_158100 ?auto_158101 ?auto_158102 ?auto_158103 ?auto_158104 ?auto_158105 )
      ( MAKE-12PILE ?auto_158100 ?auto_158101 ?auto_158102 ?auto_158103 ?auto_158104 ?auto_158105 ?auto_158106 ?auto_158107 ?auto_158108 ?auto_158109 ?auto_158110 ?auto_158111 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_158125 - BLOCK
      ?auto_158126 - BLOCK
      ?auto_158127 - BLOCK
      ?auto_158128 - BLOCK
      ?auto_158129 - BLOCK
      ?auto_158130 - BLOCK
      ?auto_158131 - BLOCK
      ?auto_158132 - BLOCK
      ?auto_158133 - BLOCK
      ?auto_158134 - BLOCK
      ?auto_158135 - BLOCK
      ?auto_158136 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_158136 ) ( ON-TABLE ?auto_158125 ) ( ON ?auto_158126 ?auto_158125 ) ( ON ?auto_158127 ?auto_158126 ) ( ON ?auto_158128 ?auto_158127 ) ( ON ?auto_158129 ?auto_158128 ) ( not ( = ?auto_158125 ?auto_158126 ) ) ( not ( = ?auto_158125 ?auto_158127 ) ) ( not ( = ?auto_158125 ?auto_158128 ) ) ( not ( = ?auto_158125 ?auto_158129 ) ) ( not ( = ?auto_158125 ?auto_158130 ) ) ( not ( = ?auto_158125 ?auto_158131 ) ) ( not ( = ?auto_158125 ?auto_158132 ) ) ( not ( = ?auto_158125 ?auto_158133 ) ) ( not ( = ?auto_158125 ?auto_158134 ) ) ( not ( = ?auto_158125 ?auto_158135 ) ) ( not ( = ?auto_158125 ?auto_158136 ) ) ( not ( = ?auto_158126 ?auto_158127 ) ) ( not ( = ?auto_158126 ?auto_158128 ) ) ( not ( = ?auto_158126 ?auto_158129 ) ) ( not ( = ?auto_158126 ?auto_158130 ) ) ( not ( = ?auto_158126 ?auto_158131 ) ) ( not ( = ?auto_158126 ?auto_158132 ) ) ( not ( = ?auto_158126 ?auto_158133 ) ) ( not ( = ?auto_158126 ?auto_158134 ) ) ( not ( = ?auto_158126 ?auto_158135 ) ) ( not ( = ?auto_158126 ?auto_158136 ) ) ( not ( = ?auto_158127 ?auto_158128 ) ) ( not ( = ?auto_158127 ?auto_158129 ) ) ( not ( = ?auto_158127 ?auto_158130 ) ) ( not ( = ?auto_158127 ?auto_158131 ) ) ( not ( = ?auto_158127 ?auto_158132 ) ) ( not ( = ?auto_158127 ?auto_158133 ) ) ( not ( = ?auto_158127 ?auto_158134 ) ) ( not ( = ?auto_158127 ?auto_158135 ) ) ( not ( = ?auto_158127 ?auto_158136 ) ) ( not ( = ?auto_158128 ?auto_158129 ) ) ( not ( = ?auto_158128 ?auto_158130 ) ) ( not ( = ?auto_158128 ?auto_158131 ) ) ( not ( = ?auto_158128 ?auto_158132 ) ) ( not ( = ?auto_158128 ?auto_158133 ) ) ( not ( = ?auto_158128 ?auto_158134 ) ) ( not ( = ?auto_158128 ?auto_158135 ) ) ( not ( = ?auto_158128 ?auto_158136 ) ) ( not ( = ?auto_158129 ?auto_158130 ) ) ( not ( = ?auto_158129 ?auto_158131 ) ) ( not ( = ?auto_158129 ?auto_158132 ) ) ( not ( = ?auto_158129 ?auto_158133 ) ) ( not ( = ?auto_158129 ?auto_158134 ) ) ( not ( = ?auto_158129 ?auto_158135 ) ) ( not ( = ?auto_158129 ?auto_158136 ) ) ( not ( = ?auto_158130 ?auto_158131 ) ) ( not ( = ?auto_158130 ?auto_158132 ) ) ( not ( = ?auto_158130 ?auto_158133 ) ) ( not ( = ?auto_158130 ?auto_158134 ) ) ( not ( = ?auto_158130 ?auto_158135 ) ) ( not ( = ?auto_158130 ?auto_158136 ) ) ( not ( = ?auto_158131 ?auto_158132 ) ) ( not ( = ?auto_158131 ?auto_158133 ) ) ( not ( = ?auto_158131 ?auto_158134 ) ) ( not ( = ?auto_158131 ?auto_158135 ) ) ( not ( = ?auto_158131 ?auto_158136 ) ) ( not ( = ?auto_158132 ?auto_158133 ) ) ( not ( = ?auto_158132 ?auto_158134 ) ) ( not ( = ?auto_158132 ?auto_158135 ) ) ( not ( = ?auto_158132 ?auto_158136 ) ) ( not ( = ?auto_158133 ?auto_158134 ) ) ( not ( = ?auto_158133 ?auto_158135 ) ) ( not ( = ?auto_158133 ?auto_158136 ) ) ( not ( = ?auto_158134 ?auto_158135 ) ) ( not ( = ?auto_158134 ?auto_158136 ) ) ( not ( = ?auto_158135 ?auto_158136 ) ) ( ON ?auto_158135 ?auto_158136 ) ( ON ?auto_158134 ?auto_158135 ) ( ON ?auto_158133 ?auto_158134 ) ( ON ?auto_158132 ?auto_158133 ) ( ON ?auto_158131 ?auto_158132 ) ( CLEAR ?auto_158129 ) ( ON ?auto_158130 ?auto_158131 ) ( CLEAR ?auto_158130 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_158125 ?auto_158126 ?auto_158127 ?auto_158128 ?auto_158129 ?auto_158130 )
      ( MAKE-12PILE ?auto_158125 ?auto_158126 ?auto_158127 ?auto_158128 ?auto_158129 ?auto_158130 ?auto_158131 ?auto_158132 ?auto_158133 ?auto_158134 ?auto_158135 ?auto_158136 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_158149 - BLOCK
      ?auto_158150 - BLOCK
      ?auto_158151 - BLOCK
      ?auto_158152 - BLOCK
      ?auto_158153 - BLOCK
      ?auto_158154 - BLOCK
      ?auto_158155 - BLOCK
      ?auto_158156 - BLOCK
      ?auto_158157 - BLOCK
      ?auto_158158 - BLOCK
      ?auto_158159 - BLOCK
      ?auto_158160 - BLOCK
    )
    :vars
    (
      ?auto_158161 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158160 ?auto_158161 ) ( ON-TABLE ?auto_158149 ) ( ON ?auto_158150 ?auto_158149 ) ( ON ?auto_158151 ?auto_158150 ) ( ON ?auto_158152 ?auto_158151 ) ( not ( = ?auto_158149 ?auto_158150 ) ) ( not ( = ?auto_158149 ?auto_158151 ) ) ( not ( = ?auto_158149 ?auto_158152 ) ) ( not ( = ?auto_158149 ?auto_158153 ) ) ( not ( = ?auto_158149 ?auto_158154 ) ) ( not ( = ?auto_158149 ?auto_158155 ) ) ( not ( = ?auto_158149 ?auto_158156 ) ) ( not ( = ?auto_158149 ?auto_158157 ) ) ( not ( = ?auto_158149 ?auto_158158 ) ) ( not ( = ?auto_158149 ?auto_158159 ) ) ( not ( = ?auto_158149 ?auto_158160 ) ) ( not ( = ?auto_158149 ?auto_158161 ) ) ( not ( = ?auto_158150 ?auto_158151 ) ) ( not ( = ?auto_158150 ?auto_158152 ) ) ( not ( = ?auto_158150 ?auto_158153 ) ) ( not ( = ?auto_158150 ?auto_158154 ) ) ( not ( = ?auto_158150 ?auto_158155 ) ) ( not ( = ?auto_158150 ?auto_158156 ) ) ( not ( = ?auto_158150 ?auto_158157 ) ) ( not ( = ?auto_158150 ?auto_158158 ) ) ( not ( = ?auto_158150 ?auto_158159 ) ) ( not ( = ?auto_158150 ?auto_158160 ) ) ( not ( = ?auto_158150 ?auto_158161 ) ) ( not ( = ?auto_158151 ?auto_158152 ) ) ( not ( = ?auto_158151 ?auto_158153 ) ) ( not ( = ?auto_158151 ?auto_158154 ) ) ( not ( = ?auto_158151 ?auto_158155 ) ) ( not ( = ?auto_158151 ?auto_158156 ) ) ( not ( = ?auto_158151 ?auto_158157 ) ) ( not ( = ?auto_158151 ?auto_158158 ) ) ( not ( = ?auto_158151 ?auto_158159 ) ) ( not ( = ?auto_158151 ?auto_158160 ) ) ( not ( = ?auto_158151 ?auto_158161 ) ) ( not ( = ?auto_158152 ?auto_158153 ) ) ( not ( = ?auto_158152 ?auto_158154 ) ) ( not ( = ?auto_158152 ?auto_158155 ) ) ( not ( = ?auto_158152 ?auto_158156 ) ) ( not ( = ?auto_158152 ?auto_158157 ) ) ( not ( = ?auto_158152 ?auto_158158 ) ) ( not ( = ?auto_158152 ?auto_158159 ) ) ( not ( = ?auto_158152 ?auto_158160 ) ) ( not ( = ?auto_158152 ?auto_158161 ) ) ( not ( = ?auto_158153 ?auto_158154 ) ) ( not ( = ?auto_158153 ?auto_158155 ) ) ( not ( = ?auto_158153 ?auto_158156 ) ) ( not ( = ?auto_158153 ?auto_158157 ) ) ( not ( = ?auto_158153 ?auto_158158 ) ) ( not ( = ?auto_158153 ?auto_158159 ) ) ( not ( = ?auto_158153 ?auto_158160 ) ) ( not ( = ?auto_158153 ?auto_158161 ) ) ( not ( = ?auto_158154 ?auto_158155 ) ) ( not ( = ?auto_158154 ?auto_158156 ) ) ( not ( = ?auto_158154 ?auto_158157 ) ) ( not ( = ?auto_158154 ?auto_158158 ) ) ( not ( = ?auto_158154 ?auto_158159 ) ) ( not ( = ?auto_158154 ?auto_158160 ) ) ( not ( = ?auto_158154 ?auto_158161 ) ) ( not ( = ?auto_158155 ?auto_158156 ) ) ( not ( = ?auto_158155 ?auto_158157 ) ) ( not ( = ?auto_158155 ?auto_158158 ) ) ( not ( = ?auto_158155 ?auto_158159 ) ) ( not ( = ?auto_158155 ?auto_158160 ) ) ( not ( = ?auto_158155 ?auto_158161 ) ) ( not ( = ?auto_158156 ?auto_158157 ) ) ( not ( = ?auto_158156 ?auto_158158 ) ) ( not ( = ?auto_158156 ?auto_158159 ) ) ( not ( = ?auto_158156 ?auto_158160 ) ) ( not ( = ?auto_158156 ?auto_158161 ) ) ( not ( = ?auto_158157 ?auto_158158 ) ) ( not ( = ?auto_158157 ?auto_158159 ) ) ( not ( = ?auto_158157 ?auto_158160 ) ) ( not ( = ?auto_158157 ?auto_158161 ) ) ( not ( = ?auto_158158 ?auto_158159 ) ) ( not ( = ?auto_158158 ?auto_158160 ) ) ( not ( = ?auto_158158 ?auto_158161 ) ) ( not ( = ?auto_158159 ?auto_158160 ) ) ( not ( = ?auto_158159 ?auto_158161 ) ) ( not ( = ?auto_158160 ?auto_158161 ) ) ( ON ?auto_158159 ?auto_158160 ) ( ON ?auto_158158 ?auto_158159 ) ( ON ?auto_158157 ?auto_158158 ) ( ON ?auto_158156 ?auto_158157 ) ( ON ?auto_158155 ?auto_158156 ) ( ON ?auto_158154 ?auto_158155 ) ( CLEAR ?auto_158152 ) ( ON ?auto_158153 ?auto_158154 ) ( CLEAR ?auto_158153 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_158149 ?auto_158150 ?auto_158151 ?auto_158152 ?auto_158153 )
      ( MAKE-12PILE ?auto_158149 ?auto_158150 ?auto_158151 ?auto_158152 ?auto_158153 ?auto_158154 ?auto_158155 ?auto_158156 ?auto_158157 ?auto_158158 ?auto_158159 ?auto_158160 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_158174 - BLOCK
      ?auto_158175 - BLOCK
      ?auto_158176 - BLOCK
      ?auto_158177 - BLOCK
      ?auto_158178 - BLOCK
      ?auto_158179 - BLOCK
      ?auto_158180 - BLOCK
      ?auto_158181 - BLOCK
      ?auto_158182 - BLOCK
      ?auto_158183 - BLOCK
      ?auto_158184 - BLOCK
      ?auto_158185 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_158185 ) ( ON-TABLE ?auto_158174 ) ( ON ?auto_158175 ?auto_158174 ) ( ON ?auto_158176 ?auto_158175 ) ( ON ?auto_158177 ?auto_158176 ) ( not ( = ?auto_158174 ?auto_158175 ) ) ( not ( = ?auto_158174 ?auto_158176 ) ) ( not ( = ?auto_158174 ?auto_158177 ) ) ( not ( = ?auto_158174 ?auto_158178 ) ) ( not ( = ?auto_158174 ?auto_158179 ) ) ( not ( = ?auto_158174 ?auto_158180 ) ) ( not ( = ?auto_158174 ?auto_158181 ) ) ( not ( = ?auto_158174 ?auto_158182 ) ) ( not ( = ?auto_158174 ?auto_158183 ) ) ( not ( = ?auto_158174 ?auto_158184 ) ) ( not ( = ?auto_158174 ?auto_158185 ) ) ( not ( = ?auto_158175 ?auto_158176 ) ) ( not ( = ?auto_158175 ?auto_158177 ) ) ( not ( = ?auto_158175 ?auto_158178 ) ) ( not ( = ?auto_158175 ?auto_158179 ) ) ( not ( = ?auto_158175 ?auto_158180 ) ) ( not ( = ?auto_158175 ?auto_158181 ) ) ( not ( = ?auto_158175 ?auto_158182 ) ) ( not ( = ?auto_158175 ?auto_158183 ) ) ( not ( = ?auto_158175 ?auto_158184 ) ) ( not ( = ?auto_158175 ?auto_158185 ) ) ( not ( = ?auto_158176 ?auto_158177 ) ) ( not ( = ?auto_158176 ?auto_158178 ) ) ( not ( = ?auto_158176 ?auto_158179 ) ) ( not ( = ?auto_158176 ?auto_158180 ) ) ( not ( = ?auto_158176 ?auto_158181 ) ) ( not ( = ?auto_158176 ?auto_158182 ) ) ( not ( = ?auto_158176 ?auto_158183 ) ) ( not ( = ?auto_158176 ?auto_158184 ) ) ( not ( = ?auto_158176 ?auto_158185 ) ) ( not ( = ?auto_158177 ?auto_158178 ) ) ( not ( = ?auto_158177 ?auto_158179 ) ) ( not ( = ?auto_158177 ?auto_158180 ) ) ( not ( = ?auto_158177 ?auto_158181 ) ) ( not ( = ?auto_158177 ?auto_158182 ) ) ( not ( = ?auto_158177 ?auto_158183 ) ) ( not ( = ?auto_158177 ?auto_158184 ) ) ( not ( = ?auto_158177 ?auto_158185 ) ) ( not ( = ?auto_158178 ?auto_158179 ) ) ( not ( = ?auto_158178 ?auto_158180 ) ) ( not ( = ?auto_158178 ?auto_158181 ) ) ( not ( = ?auto_158178 ?auto_158182 ) ) ( not ( = ?auto_158178 ?auto_158183 ) ) ( not ( = ?auto_158178 ?auto_158184 ) ) ( not ( = ?auto_158178 ?auto_158185 ) ) ( not ( = ?auto_158179 ?auto_158180 ) ) ( not ( = ?auto_158179 ?auto_158181 ) ) ( not ( = ?auto_158179 ?auto_158182 ) ) ( not ( = ?auto_158179 ?auto_158183 ) ) ( not ( = ?auto_158179 ?auto_158184 ) ) ( not ( = ?auto_158179 ?auto_158185 ) ) ( not ( = ?auto_158180 ?auto_158181 ) ) ( not ( = ?auto_158180 ?auto_158182 ) ) ( not ( = ?auto_158180 ?auto_158183 ) ) ( not ( = ?auto_158180 ?auto_158184 ) ) ( not ( = ?auto_158180 ?auto_158185 ) ) ( not ( = ?auto_158181 ?auto_158182 ) ) ( not ( = ?auto_158181 ?auto_158183 ) ) ( not ( = ?auto_158181 ?auto_158184 ) ) ( not ( = ?auto_158181 ?auto_158185 ) ) ( not ( = ?auto_158182 ?auto_158183 ) ) ( not ( = ?auto_158182 ?auto_158184 ) ) ( not ( = ?auto_158182 ?auto_158185 ) ) ( not ( = ?auto_158183 ?auto_158184 ) ) ( not ( = ?auto_158183 ?auto_158185 ) ) ( not ( = ?auto_158184 ?auto_158185 ) ) ( ON ?auto_158184 ?auto_158185 ) ( ON ?auto_158183 ?auto_158184 ) ( ON ?auto_158182 ?auto_158183 ) ( ON ?auto_158181 ?auto_158182 ) ( ON ?auto_158180 ?auto_158181 ) ( ON ?auto_158179 ?auto_158180 ) ( CLEAR ?auto_158177 ) ( ON ?auto_158178 ?auto_158179 ) ( CLEAR ?auto_158178 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_158174 ?auto_158175 ?auto_158176 ?auto_158177 ?auto_158178 )
      ( MAKE-12PILE ?auto_158174 ?auto_158175 ?auto_158176 ?auto_158177 ?auto_158178 ?auto_158179 ?auto_158180 ?auto_158181 ?auto_158182 ?auto_158183 ?auto_158184 ?auto_158185 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_158198 - BLOCK
      ?auto_158199 - BLOCK
      ?auto_158200 - BLOCK
      ?auto_158201 - BLOCK
      ?auto_158202 - BLOCK
      ?auto_158203 - BLOCK
      ?auto_158204 - BLOCK
      ?auto_158205 - BLOCK
      ?auto_158206 - BLOCK
      ?auto_158207 - BLOCK
      ?auto_158208 - BLOCK
      ?auto_158209 - BLOCK
    )
    :vars
    (
      ?auto_158210 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158209 ?auto_158210 ) ( ON-TABLE ?auto_158198 ) ( ON ?auto_158199 ?auto_158198 ) ( ON ?auto_158200 ?auto_158199 ) ( not ( = ?auto_158198 ?auto_158199 ) ) ( not ( = ?auto_158198 ?auto_158200 ) ) ( not ( = ?auto_158198 ?auto_158201 ) ) ( not ( = ?auto_158198 ?auto_158202 ) ) ( not ( = ?auto_158198 ?auto_158203 ) ) ( not ( = ?auto_158198 ?auto_158204 ) ) ( not ( = ?auto_158198 ?auto_158205 ) ) ( not ( = ?auto_158198 ?auto_158206 ) ) ( not ( = ?auto_158198 ?auto_158207 ) ) ( not ( = ?auto_158198 ?auto_158208 ) ) ( not ( = ?auto_158198 ?auto_158209 ) ) ( not ( = ?auto_158198 ?auto_158210 ) ) ( not ( = ?auto_158199 ?auto_158200 ) ) ( not ( = ?auto_158199 ?auto_158201 ) ) ( not ( = ?auto_158199 ?auto_158202 ) ) ( not ( = ?auto_158199 ?auto_158203 ) ) ( not ( = ?auto_158199 ?auto_158204 ) ) ( not ( = ?auto_158199 ?auto_158205 ) ) ( not ( = ?auto_158199 ?auto_158206 ) ) ( not ( = ?auto_158199 ?auto_158207 ) ) ( not ( = ?auto_158199 ?auto_158208 ) ) ( not ( = ?auto_158199 ?auto_158209 ) ) ( not ( = ?auto_158199 ?auto_158210 ) ) ( not ( = ?auto_158200 ?auto_158201 ) ) ( not ( = ?auto_158200 ?auto_158202 ) ) ( not ( = ?auto_158200 ?auto_158203 ) ) ( not ( = ?auto_158200 ?auto_158204 ) ) ( not ( = ?auto_158200 ?auto_158205 ) ) ( not ( = ?auto_158200 ?auto_158206 ) ) ( not ( = ?auto_158200 ?auto_158207 ) ) ( not ( = ?auto_158200 ?auto_158208 ) ) ( not ( = ?auto_158200 ?auto_158209 ) ) ( not ( = ?auto_158200 ?auto_158210 ) ) ( not ( = ?auto_158201 ?auto_158202 ) ) ( not ( = ?auto_158201 ?auto_158203 ) ) ( not ( = ?auto_158201 ?auto_158204 ) ) ( not ( = ?auto_158201 ?auto_158205 ) ) ( not ( = ?auto_158201 ?auto_158206 ) ) ( not ( = ?auto_158201 ?auto_158207 ) ) ( not ( = ?auto_158201 ?auto_158208 ) ) ( not ( = ?auto_158201 ?auto_158209 ) ) ( not ( = ?auto_158201 ?auto_158210 ) ) ( not ( = ?auto_158202 ?auto_158203 ) ) ( not ( = ?auto_158202 ?auto_158204 ) ) ( not ( = ?auto_158202 ?auto_158205 ) ) ( not ( = ?auto_158202 ?auto_158206 ) ) ( not ( = ?auto_158202 ?auto_158207 ) ) ( not ( = ?auto_158202 ?auto_158208 ) ) ( not ( = ?auto_158202 ?auto_158209 ) ) ( not ( = ?auto_158202 ?auto_158210 ) ) ( not ( = ?auto_158203 ?auto_158204 ) ) ( not ( = ?auto_158203 ?auto_158205 ) ) ( not ( = ?auto_158203 ?auto_158206 ) ) ( not ( = ?auto_158203 ?auto_158207 ) ) ( not ( = ?auto_158203 ?auto_158208 ) ) ( not ( = ?auto_158203 ?auto_158209 ) ) ( not ( = ?auto_158203 ?auto_158210 ) ) ( not ( = ?auto_158204 ?auto_158205 ) ) ( not ( = ?auto_158204 ?auto_158206 ) ) ( not ( = ?auto_158204 ?auto_158207 ) ) ( not ( = ?auto_158204 ?auto_158208 ) ) ( not ( = ?auto_158204 ?auto_158209 ) ) ( not ( = ?auto_158204 ?auto_158210 ) ) ( not ( = ?auto_158205 ?auto_158206 ) ) ( not ( = ?auto_158205 ?auto_158207 ) ) ( not ( = ?auto_158205 ?auto_158208 ) ) ( not ( = ?auto_158205 ?auto_158209 ) ) ( not ( = ?auto_158205 ?auto_158210 ) ) ( not ( = ?auto_158206 ?auto_158207 ) ) ( not ( = ?auto_158206 ?auto_158208 ) ) ( not ( = ?auto_158206 ?auto_158209 ) ) ( not ( = ?auto_158206 ?auto_158210 ) ) ( not ( = ?auto_158207 ?auto_158208 ) ) ( not ( = ?auto_158207 ?auto_158209 ) ) ( not ( = ?auto_158207 ?auto_158210 ) ) ( not ( = ?auto_158208 ?auto_158209 ) ) ( not ( = ?auto_158208 ?auto_158210 ) ) ( not ( = ?auto_158209 ?auto_158210 ) ) ( ON ?auto_158208 ?auto_158209 ) ( ON ?auto_158207 ?auto_158208 ) ( ON ?auto_158206 ?auto_158207 ) ( ON ?auto_158205 ?auto_158206 ) ( ON ?auto_158204 ?auto_158205 ) ( ON ?auto_158203 ?auto_158204 ) ( ON ?auto_158202 ?auto_158203 ) ( CLEAR ?auto_158200 ) ( ON ?auto_158201 ?auto_158202 ) ( CLEAR ?auto_158201 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_158198 ?auto_158199 ?auto_158200 ?auto_158201 )
      ( MAKE-12PILE ?auto_158198 ?auto_158199 ?auto_158200 ?auto_158201 ?auto_158202 ?auto_158203 ?auto_158204 ?auto_158205 ?auto_158206 ?auto_158207 ?auto_158208 ?auto_158209 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_158223 - BLOCK
      ?auto_158224 - BLOCK
      ?auto_158225 - BLOCK
      ?auto_158226 - BLOCK
      ?auto_158227 - BLOCK
      ?auto_158228 - BLOCK
      ?auto_158229 - BLOCK
      ?auto_158230 - BLOCK
      ?auto_158231 - BLOCK
      ?auto_158232 - BLOCK
      ?auto_158233 - BLOCK
      ?auto_158234 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_158234 ) ( ON-TABLE ?auto_158223 ) ( ON ?auto_158224 ?auto_158223 ) ( ON ?auto_158225 ?auto_158224 ) ( not ( = ?auto_158223 ?auto_158224 ) ) ( not ( = ?auto_158223 ?auto_158225 ) ) ( not ( = ?auto_158223 ?auto_158226 ) ) ( not ( = ?auto_158223 ?auto_158227 ) ) ( not ( = ?auto_158223 ?auto_158228 ) ) ( not ( = ?auto_158223 ?auto_158229 ) ) ( not ( = ?auto_158223 ?auto_158230 ) ) ( not ( = ?auto_158223 ?auto_158231 ) ) ( not ( = ?auto_158223 ?auto_158232 ) ) ( not ( = ?auto_158223 ?auto_158233 ) ) ( not ( = ?auto_158223 ?auto_158234 ) ) ( not ( = ?auto_158224 ?auto_158225 ) ) ( not ( = ?auto_158224 ?auto_158226 ) ) ( not ( = ?auto_158224 ?auto_158227 ) ) ( not ( = ?auto_158224 ?auto_158228 ) ) ( not ( = ?auto_158224 ?auto_158229 ) ) ( not ( = ?auto_158224 ?auto_158230 ) ) ( not ( = ?auto_158224 ?auto_158231 ) ) ( not ( = ?auto_158224 ?auto_158232 ) ) ( not ( = ?auto_158224 ?auto_158233 ) ) ( not ( = ?auto_158224 ?auto_158234 ) ) ( not ( = ?auto_158225 ?auto_158226 ) ) ( not ( = ?auto_158225 ?auto_158227 ) ) ( not ( = ?auto_158225 ?auto_158228 ) ) ( not ( = ?auto_158225 ?auto_158229 ) ) ( not ( = ?auto_158225 ?auto_158230 ) ) ( not ( = ?auto_158225 ?auto_158231 ) ) ( not ( = ?auto_158225 ?auto_158232 ) ) ( not ( = ?auto_158225 ?auto_158233 ) ) ( not ( = ?auto_158225 ?auto_158234 ) ) ( not ( = ?auto_158226 ?auto_158227 ) ) ( not ( = ?auto_158226 ?auto_158228 ) ) ( not ( = ?auto_158226 ?auto_158229 ) ) ( not ( = ?auto_158226 ?auto_158230 ) ) ( not ( = ?auto_158226 ?auto_158231 ) ) ( not ( = ?auto_158226 ?auto_158232 ) ) ( not ( = ?auto_158226 ?auto_158233 ) ) ( not ( = ?auto_158226 ?auto_158234 ) ) ( not ( = ?auto_158227 ?auto_158228 ) ) ( not ( = ?auto_158227 ?auto_158229 ) ) ( not ( = ?auto_158227 ?auto_158230 ) ) ( not ( = ?auto_158227 ?auto_158231 ) ) ( not ( = ?auto_158227 ?auto_158232 ) ) ( not ( = ?auto_158227 ?auto_158233 ) ) ( not ( = ?auto_158227 ?auto_158234 ) ) ( not ( = ?auto_158228 ?auto_158229 ) ) ( not ( = ?auto_158228 ?auto_158230 ) ) ( not ( = ?auto_158228 ?auto_158231 ) ) ( not ( = ?auto_158228 ?auto_158232 ) ) ( not ( = ?auto_158228 ?auto_158233 ) ) ( not ( = ?auto_158228 ?auto_158234 ) ) ( not ( = ?auto_158229 ?auto_158230 ) ) ( not ( = ?auto_158229 ?auto_158231 ) ) ( not ( = ?auto_158229 ?auto_158232 ) ) ( not ( = ?auto_158229 ?auto_158233 ) ) ( not ( = ?auto_158229 ?auto_158234 ) ) ( not ( = ?auto_158230 ?auto_158231 ) ) ( not ( = ?auto_158230 ?auto_158232 ) ) ( not ( = ?auto_158230 ?auto_158233 ) ) ( not ( = ?auto_158230 ?auto_158234 ) ) ( not ( = ?auto_158231 ?auto_158232 ) ) ( not ( = ?auto_158231 ?auto_158233 ) ) ( not ( = ?auto_158231 ?auto_158234 ) ) ( not ( = ?auto_158232 ?auto_158233 ) ) ( not ( = ?auto_158232 ?auto_158234 ) ) ( not ( = ?auto_158233 ?auto_158234 ) ) ( ON ?auto_158233 ?auto_158234 ) ( ON ?auto_158232 ?auto_158233 ) ( ON ?auto_158231 ?auto_158232 ) ( ON ?auto_158230 ?auto_158231 ) ( ON ?auto_158229 ?auto_158230 ) ( ON ?auto_158228 ?auto_158229 ) ( ON ?auto_158227 ?auto_158228 ) ( CLEAR ?auto_158225 ) ( ON ?auto_158226 ?auto_158227 ) ( CLEAR ?auto_158226 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_158223 ?auto_158224 ?auto_158225 ?auto_158226 )
      ( MAKE-12PILE ?auto_158223 ?auto_158224 ?auto_158225 ?auto_158226 ?auto_158227 ?auto_158228 ?auto_158229 ?auto_158230 ?auto_158231 ?auto_158232 ?auto_158233 ?auto_158234 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_158247 - BLOCK
      ?auto_158248 - BLOCK
      ?auto_158249 - BLOCK
      ?auto_158250 - BLOCK
      ?auto_158251 - BLOCK
      ?auto_158252 - BLOCK
      ?auto_158253 - BLOCK
      ?auto_158254 - BLOCK
      ?auto_158255 - BLOCK
      ?auto_158256 - BLOCK
      ?auto_158257 - BLOCK
      ?auto_158258 - BLOCK
    )
    :vars
    (
      ?auto_158259 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158258 ?auto_158259 ) ( ON-TABLE ?auto_158247 ) ( ON ?auto_158248 ?auto_158247 ) ( not ( = ?auto_158247 ?auto_158248 ) ) ( not ( = ?auto_158247 ?auto_158249 ) ) ( not ( = ?auto_158247 ?auto_158250 ) ) ( not ( = ?auto_158247 ?auto_158251 ) ) ( not ( = ?auto_158247 ?auto_158252 ) ) ( not ( = ?auto_158247 ?auto_158253 ) ) ( not ( = ?auto_158247 ?auto_158254 ) ) ( not ( = ?auto_158247 ?auto_158255 ) ) ( not ( = ?auto_158247 ?auto_158256 ) ) ( not ( = ?auto_158247 ?auto_158257 ) ) ( not ( = ?auto_158247 ?auto_158258 ) ) ( not ( = ?auto_158247 ?auto_158259 ) ) ( not ( = ?auto_158248 ?auto_158249 ) ) ( not ( = ?auto_158248 ?auto_158250 ) ) ( not ( = ?auto_158248 ?auto_158251 ) ) ( not ( = ?auto_158248 ?auto_158252 ) ) ( not ( = ?auto_158248 ?auto_158253 ) ) ( not ( = ?auto_158248 ?auto_158254 ) ) ( not ( = ?auto_158248 ?auto_158255 ) ) ( not ( = ?auto_158248 ?auto_158256 ) ) ( not ( = ?auto_158248 ?auto_158257 ) ) ( not ( = ?auto_158248 ?auto_158258 ) ) ( not ( = ?auto_158248 ?auto_158259 ) ) ( not ( = ?auto_158249 ?auto_158250 ) ) ( not ( = ?auto_158249 ?auto_158251 ) ) ( not ( = ?auto_158249 ?auto_158252 ) ) ( not ( = ?auto_158249 ?auto_158253 ) ) ( not ( = ?auto_158249 ?auto_158254 ) ) ( not ( = ?auto_158249 ?auto_158255 ) ) ( not ( = ?auto_158249 ?auto_158256 ) ) ( not ( = ?auto_158249 ?auto_158257 ) ) ( not ( = ?auto_158249 ?auto_158258 ) ) ( not ( = ?auto_158249 ?auto_158259 ) ) ( not ( = ?auto_158250 ?auto_158251 ) ) ( not ( = ?auto_158250 ?auto_158252 ) ) ( not ( = ?auto_158250 ?auto_158253 ) ) ( not ( = ?auto_158250 ?auto_158254 ) ) ( not ( = ?auto_158250 ?auto_158255 ) ) ( not ( = ?auto_158250 ?auto_158256 ) ) ( not ( = ?auto_158250 ?auto_158257 ) ) ( not ( = ?auto_158250 ?auto_158258 ) ) ( not ( = ?auto_158250 ?auto_158259 ) ) ( not ( = ?auto_158251 ?auto_158252 ) ) ( not ( = ?auto_158251 ?auto_158253 ) ) ( not ( = ?auto_158251 ?auto_158254 ) ) ( not ( = ?auto_158251 ?auto_158255 ) ) ( not ( = ?auto_158251 ?auto_158256 ) ) ( not ( = ?auto_158251 ?auto_158257 ) ) ( not ( = ?auto_158251 ?auto_158258 ) ) ( not ( = ?auto_158251 ?auto_158259 ) ) ( not ( = ?auto_158252 ?auto_158253 ) ) ( not ( = ?auto_158252 ?auto_158254 ) ) ( not ( = ?auto_158252 ?auto_158255 ) ) ( not ( = ?auto_158252 ?auto_158256 ) ) ( not ( = ?auto_158252 ?auto_158257 ) ) ( not ( = ?auto_158252 ?auto_158258 ) ) ( not ( = ?auto_158252 ?auto_158259 ) ) ( not ( = ?auto_158253 ?auto_158254 ) ) ( not ( = ?auto_158253 ?auto_158255 ) ) ( not ( = ?auto_158253 ?auto_158256 ) ) ( not ( = ?auto_158253 ?auto_158257 ) ) ( not ( = ?auto_158253 ?auto_158258 ) ) ( not ( = ?auto_158253 ?auto_158259 ) ) ( not ( = ?auto_158254 ?auto_158255 ) ) ( not ( = ?auto_158254 ?auto_158256 ) ) ( not ( = ?auto_158254 ?auto_158257 ) ) ( not ( = ?auto_158254 ?auto_158258 ) ) ( not ( = ?auto_158254 ?auto_158259 ) ) ( not ( = ?auto_158255 ?auto_158256 ) ) ( not ( = ?auto_158255 ?auto_158257 ) ) ( not ( = ?auto_158255 ?auto_158258 ) ) ( not ( = ?auto_158255 ?auto_158259 ) ) ( not ( = ?auto_158256 ?auto_158257 ) ) ( not ( = ?auto_158256 ?auto_158258 ) ) ( not ( = ?auto_158256 ?auto_158259 ) ) ( not ( = ?auto_158257 ?auto_158258 ) ) ( not ( = ?auto_158257 ?auto_158259 ) ) ( not ( = ?auto_158258 ?auto_158259 ) ) ( ON ?auto_158257 ?auto_158258 ) ( ON ?auto_158256 ?auto_158257 ) ( ON ?auto_158255 ?auto_158256 ) ( ON ?auto_158254 ?auto_158255 ) ( ON ?auto_158253 ?auto_158254 ) ( ON ?auto_158252 ?auto_158253 ) ( ON ?auto_158251 ?auto_158252 ) ( ON ?auto_158250 ?auto_158251 ) ( CLEAR ?auto_158248 ) ( ON ?auto_158249 ?auto_158250 ) ( CLEAR ?auto_158249 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_158247 ?auto_158248 ?auto_158249 )
      ( MAKE-12PILE ?auto_158247 ?auto_158248 ?auto_158249 ?auto_158250 ?auto_158251 ?auto_158252 ?auto_158253 ?auto_158254 ?auto_158255 ?auto_158256 ?auto_158257 ?auto_158258 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_158272 - BLOCK
      ?auto_158273 - BLOCK
      ?auto_158274 - BLOCK
      ?auto_158275 - BLOCK
      ?auto_158276 - BLOCK
      ?auto_158277 - BLOCK
      ?auto_158278 - BLOCK
      ?auto_158279 - BLOCK
      ?auto_158280 - BLOCK
      ?auto_158281 - BLOCK
      ?auto_158282 - BLOCK
      ?auto_158283 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_158283 ) ( ON-TABLE ?auto_158272 ) ( ON ?auto_158273 ?auto_158272 ) ( not ( = ?auto_158272 ?auto_158273 ) ) ( not ( = ?auto_158272 ?auto_158274 ) ) ( not ( = ?auto_158272 ?auto_158275 ) ) ( not ( = ?auto_158272 ?auto_158276 ) ) ( not ( = ?auto_158272 ?auto_158277 ) ) ( not ( = ?auto_158272 ?auto_158278 ) ) ( not ( = ?auto_158272 ?auto_158279 ) ) ( not ( = ?auto_158272 ?auto_158280 ) ) ( not ( = ?auto_158272 ?auto_158281 ) ) ( not ( = ?auto_158272 ?auto_158282 ) ) ( not ( = ?auto_158272 ?auto_158283 ) ) ( not ( = ?auto_158273 ?auto_158274 ) ) ( not ( = ?auto_158273 ?auto_158275 ) ) ( not ( = ?auto_158273 ?auto_158276 ) ) ( not ( = ?auto_158273 ?auto_158277 ) ) ( not ( = ?auto_158273 ?auto_158278 ) ) ( not ( = ?auto_158273 ?auto_158279 ) ) ( not ( = ?auto_158273 ?auto_158280 ) ) ( not ( = ?auto_158273 ?auto_158281 ) ) ( not ( = ?auto_158273 ?auto_158282 ) ) ( not ( = ?auto_158273 ?auto_158283 ) ) ( not ( = ?auto_158274 ?auto_158275 ) ) ( not ( = ?auto_158274 ?auto_158276 ) ) ( not ( = ?auto_158274 ?auto_158277 ) ) ( not ( = ?auto_158274 ?auto_158278 ) ) ( not ( = ?auto_158274 ?auto_158279 ) ) ( not ( = ?auto_158274 ?auto_158280 ) ) ( not ( = ?auto_158274 ?auto_158281 ) ) ( not ( = ?auto_158274 ?auto_158282 ) ) ( not ( = ?auto_158274 ?auto_158283 ) ) ( not ( = ?auto_158275 ?auto_158276 ) ) ( not ( = ?auto_158275 ?auto_158277 ) ) ( not ( = ?auto_158275 ?auto_158278 ) ) ( not ( = ?auto_158275 ?auto_158279 ) ) ( not ( = ?auto_158275 ?auto_158280 ) ) ( not ( = ?auto_158275 ?auto_158281 ) ) ( not ( = ?auto_158275 ?auto_158282 ) ) ( not ( = ?auto_158275 ?auto_158283 ) ) ( not ( = ?auto_158276 ?auto_158277 ) ) ( not ( = ?auto_158276 ?auto_158278 ) ) ( not ( = ?auto_158276 ?auto_158279 ) ) ( not ( = ?auto_158276 ?auto_158280 ) ) ( not ( = ?auto_158276 ?auto_158281 ) ) ( not ( = ?auto_158276 ?auto_158282 ) ) ( not ( = ?auto_158276 ?auto_158283 ) ) ( not ( = ?auto_158277 ?auto_158278 ) ) ( not ( = ?auto_158277 ?auto_158279 ) ) ( not ( = ?auto_158277 ?auto_158280 ) ) ( not ( = ?auto_158277 ?auto_158281 ) ) ( not ( = ?auto_158277 ?auto_158282 ) ) ( not ( = ?auto_158277 ?auto_158283 ) ) ( not ( = ?auto_158278 ?auto_158279 ) ) ( not ( = ?auto_158278 ?auto_158280 ) ) ( not ( = ?auto_158278 ?auto_158281 ) ) ( not ( = ?auto_158278 ?auto_158282 ) ) ( not ( = ?auto_158278 ?auto_158283 ) ) ( not ( = ?auto_158279 ?auto_158280 ) ) ( not ( = ?auto_158279 ?auto_158281 ) ) ( not ( = ?auto_158279 ?auto_158282 ) ) ( not ( = ?auto_158279 ?auto_158283 ) ) ( not ( = ?auto_158280 ?auto_158281 ) ) ( not ( = ?auto_158280 ?auto_158282 ) ) ( not ( = ?auto_158280 ?auto_158283 ) ) ( not ( = ?auto_158281 ?auto_158282 ) ) ( not ( = ?auto_158281 ?auto_158283 ) ) ( not ( = ?auto_158282 ?auto_158283 ) ) ( ON ?auto_158282 ?auto_158283 ) ( ON ?auto_158281 ?auto_158282 ) ( ON ?auto_158280 ?auto_158281 ) ( ON ?auto_158279 ?auto_158280 ) ( ON ?auto_158278 ?auto_158279 ) ( ON ?auto_158277 ?auto_158278 ) ( ON ?auto_158276 ?auto_158277 ) ( ON ?auto_158275 ?auto_158276 ) ( CLEAR ?auto_158273 ) ( ON ?auto_158274 ?auto_158275 ) ( CLEAR ?auto_158274 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_158272 ?auto_158273 ?auto_158274 )
      ( MAKE-12PILE ?auto_158272 ?auto_158273 ?auto_158274 ?auto_158275 ?auto_158276 ?auto_158277 ?auto_158278 ?auto_158279 ?auto_158280 ?auto_158281 ?auto_158282 ?auto_158283 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_158296 - BLOCK
      ?auto_158297 - BLOCK
      ?auto_158298 - BLOCK
      ?auto_158299 - BLOCK
      ?auto_158300 - BLOCK
      ?auto_158301 - BLOCK
      ?auto_158302 - BLOCK
      ?auto_158303 - BLOCK
      ?auto_158304 - BLOCK
      ?auto_158305 - BLOCK
      ?auto_158306 - BLOCK
      ?auto_158307 - BLOCK
    )
    :vars
    (
      ?auto_158308 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158307 ?auto_158308 ) ( ON-TABLE ?auto_158296 ) ( not ( = ?auto_158296 ?auto_158297 ) ) ( not ( = ?auto_158296 ?auto_158298 ) ) ( not ( = ?auto_158296 ?auto_158299 ) ) ( not ( = ?auto_158296 ?auto_158300 ) ) ( not ( = ?auto_158296 ?auto_158301 ) ) ( not ( = ?auto_158296 ?auto_158302 ) ) ( not ( = ?auto_158296 ?auto_158303 ) ) ( not ( = ?auto_158296 ?auto_158304 ) ) ( not ( = ?auto_158296 ?auto_158305 ) ) ( not ( = ?auto_158296 ?auto_158306 ) ) ( not ( = ?auto_158296 ?auto_158307 ) ) ( not ( = ?auto_158296 ?auto_158308 ) ) ( not ( = ?auto_158297 ?auto_158298 ) ) ( not ( = ?auto_158297 ?auto_158299 ) ) ( not ( = ?auto_158297 ?auto_158300 ) ) ( not ( = ?auto_158297 ?auto_158301 ) ) ( not ( = ?auto_158297 ?auto_158302 ) ) ( not ( = ?auto_158297 ?auto_158303 ) ) ( not ( = ?auto_158297 ?auto_158304 ) ) ( not ( = ?auto_158297 ?auto_158305 ) ) ( not ( = ?auto_158297 ?auto_158306 ) ) ( not ( = ?auto_158297 ?auto_158307 ) ) ( not ( = ?auto_158297 ?auto_158308 ) ) ( not ( = ?auto_158298 ?auto_158299 ) ) ( not ( = ?auto_158298 ?auto_158300 ) ) ( not ( = ?auto_158298 ?auto_158301 ) ) ( not ( = ?auto_158298 ?auto_158302 ) ) ( not ( = ?auto_158298 ?auto_158303 ) ) ( not ( = ?auto_158298 ?auto_158304 ) ) ( not ( = ?auto_158298 ?auto_158305 ) ) ( not ( = ?auto_158298 ?auto_158306 ) ) ( not ( = ?auto_158298 ?auto_158307 ) ) ( not ( = ?auto_158298 ?auto_158308 ) ) ( not ( = ?auto_158299 ?auto_158300 ) ) ( not ( = ?auto_158299 ?auto_158301 ) ) ( not ( = ?auto_158299 ?auto_158302 ) ) ( not ( = ?auto_158299 ?auto_158303 ) ) ( not ( = ?auto_158299 ?auto_158304 ) ) ( not ( = ?auto_158299 ?auto_158305 ) ) ( not ( = ?auto_158299 ?auto_158306 ) ) ( not ( = ?auto_158299 ?auto_158307 ) ) ( not ( = ?auto_158299 ?auto_158308 ) ) ( not ( = ?auto_158300 ?auto_158301 ) ) ( not ( = ?auto_158300 ?auto_158302 ) ) ( not ( = ?auto_158300 ?auto_158303 ) ) ( not ( = ?auto_158300 ?auto_158304 ) ) ( not ( = ?auto_158300 ?auto_158305 ) ) ( not ( = ?auto_158300 ?auto_158306 ) ) ( not ( = ?auto_158300 ?auto_158307 ) ) ( not ( = ?auto_158300 ?auto_158308 ) ) ( not ( = ?auto_158301 ?auto_158302 ) ) ( not ( = ?auto_158301 ?auto_158303 ) ) ( not ( = ?auto_158301 ?auto_158304 ) ) ( not ( = ?auto_158301 ?auto_158305 ) ) ( not ( = ?auto_158301 ?auto_158306 ) ) ( not ( = ?auto_158301 ?auto_158307 ) ) ( not ( = ?auto_158301 ?auto_158308 ) ) ( not ( = ?auto_158302 ?auto_158303 ) ) ( not ( = ?auto_158302 ?auto_158304 ) ) ( not ( = ?auto_158302 ?auto_158305 ) ) ( not ( = ?auto_158302 ?auto_158306 ) ) ( not ( = ?auto_158302 ?auto_158307 ) ) ( not ( = ?auto_158302 ?auto_158308 ) ) ( not ( = ?auto_158303 ?auto_158304 ) ) ( not ( = ?auto_158303 ?auto_158305 ) ) ( not ( = ?auto_158303 ?auto_158306 ) ) ( not ( = ?auto_158303 ?auto_158307 ) ) ( not ( = ?auto_158303 ?auto_158308 ) ) ( not ( = ?auto_158304 ?auto_158305 ) ) ( not ( = ?auto_158304 ?auto_158306 ) ) ( not ( = ?auto_158304 ?auto_158307 ) ) ( not ( = ?auto_158304 ?auto_158308 ) ) ( not ( = ?auto_158305 ?auto_158306 ) ) ( not ( = ?auto_158305 ?auto_158307 ) ) ( not ( = ?auto_158305 ?auto_158308 ) ) ( not ( = ?auto_158306 ?auto_158307 ) ) ( not ( = ?auto_158306 ?auto_158308 ) ) ( not ( = ?auto_158307 ?auto_158308 ) ) ( ON ?auto_158306 ?auto_158307 ) ( ON ?auto_158305 ?auto_158306 ) ( ON ?auto_158304 ?auto_158305 ) ( ON ?auto_158303 ?auto_158304 ) ( ON ?auto_158302 ?auto_158303 ) ( ON ?auto_158301 ?auto_158302 ) ( ON ?auto_158300 ?auto_158301 ) ( ON ?auto_158299 ?auto_158300 ) ( ON ?auto_158298 ?auto_158299 ) ( CLEAR ?auto_158296 ) ( ON ?auto_158297 ?auto_158298 ) ( CLEAR ?auto_158297 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_158296 ?auto_158297 )
      ( MAKE-12PILE ?auto_158296 ?auto_158297 ?auto_158298 ?auto_158299 ?auto_158300 ?auto_158301 ?auto_158302 ?auto_158303 ?auto_158304 ?auto_158305 ?auto_158306 ?auto_158307 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_158321 - BLOCK
      ?auto_158322 - BLOCK
      ?auto_158323 - BLOCK
      ?auto_158324 - BLOCK
      ?auto_158325 - BLOCK
      ?auto_158326 - BLOCK
      ?auto_158327 - BLOCK
      ?auto_158328 - BLOCK
      ?auto_158329 - BLOCK
      ?auto_158330 - BLOCK
      ?auto_158331 - BLOCK
      ?auto_158332 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_158332 ) ( ON-TABLE ?auto_158321 ) ( not ( = ?auto_158321 ?auto_158322 ) ) ( not ( = ?auto_158321 ?auto_158323 ) ) ( not ( = ?auto_158321 ?auto_158324 ) ) ( not ( = ?auto_158321 ?auto_158325 ) ) ( not ( = ?auto_158321 ?auto_158326 ) ) ( not ( = ?auto_158321 ?auto_158327 ) ) ( not ( = ?auto_158321 ?auto_158328 ) ) ( not ( = ?auto_158321 ?auto_158329 ) ) ( not ( = ?auto_158321 ?auto_158330 ) ) ( not ( = ?auto_158321 ?auto_158331 ) ) ( not ( = ?auto_158321 ?auto_158332 ) ) ( not ( = ?auto_158322 ?auto_158323 ) ) ( not ( = ?auto_158322 ?auto_158324 ) ) ( not ( = ?auto_158322 ?auto_158325 ) ) ( not ( = ?auto_158322 ?auto_158326 ) ) ( not ( = ?auto_158322 ?auto_158327 ) ) ( not ( = ?auto_158322 ?auto_158328 ) ) ( not ( = ?auto_158322 ?auto_158329 ) ) ( not ( = ?auto_158322 ?auto_158330 ) ) ( not ( = ?auto_158322 ?auto_158331 ) ) ( not ( = ?auto_158322 ?auto_158332 ) ) ( not ( = ?auto_158323 ?auto_158324 ) ) ( not ( = ?auto_158323 ?auto_158325 ) ) ( not ( = ?auto_158323 ?auto_158326 ) ) ( not ( = ?auto_158323 ?auto_158327 ) ) ( not ( = ?auto_158323 ?auto_158328 ) ) ( not ( = ?auto_158323 ?auto_158329 ) ) ( not ( = ?auto_158323 ?auto_158330 ) ) ( not ( = ?auto_158323 ?auto_158331 ) ) ( not ( = ?auto_158323 ?auto_158332 ) ) ( not ( = ?auto_158324 ?auto_158325 ) ) ( not ( = ?auto_158324 ?auto_158326 ) ) ( not ( = ?auto_158324 ?auto_158327 ) ) ( not ( = ?auto_158324 ?auto_158328 ) ) ( not ( = ?auto_158324 ?auto_158329 ) ) ( not ( = ?auto_158324 ?auto_158330 ) ) ( not ( = ?auto_158324 ?auto_158331 ) ) ( not ( = ?auto_158324 ?auto_158332 ) ) ( not ( = ?auto_158325 ?auto_158326 ) ) ( not ( = ?auto_158325 ?auto_158327 ) ) ( not ( = ?auto_158325 ?auto_158328 ) ) ( not ( = ?auto_158325 ?auto_158329 ) ) ( not ( = ?auto_158325 ?auto_158330 ) ) ( not ( = ?auto_158325 ?auto_158331 ) ) ( not ( = ?auto_158325 ?auto_158332 ) ) ( not ( = ?auto_158326 ?auto_158327 ) ) ( not ( = ?auto_158326 ?auto_158328 ) ) ( not ( = ?auto_158326 ?auto_158329 ) ) ( not ( = ?auto_158326 ?auto_158330 ) ) ( not ( = ?auto_158326 ?auto_158331 ) ) ( not ( = ?auto_158326 ?auto_158332 ) ) ( not ( = ?auto_158327 ?auto_158328 ) ) ( not ( = ?auto_158327 ?auto_158329 ) ) ( not ( = ?auto_158327 ?auto_158330 ) ) ( not ( = ?auto_158327 ?auto_158331 ) ) ( not ( = ?auto_158327 ?auto_158332 ) ) ( not ( = ?auto_158328 ?auto_158329 ) ) ( not ( = ?auto_158328 ?auto_158330 ) ) ( not ( = ?auto_158328 ?auto_158331 ) ) ( not ( = ?auto_158328 ?auto_158332 ) ) ( not ( = ?auto_158329 ?auto_158330 ) ) ( not ( = ?auto_158329 ?auto_158331 ) ) ( not ( = ?auto_158329 ?auto_158332 ) ) ( not ( = ?auto_158330 ?auto_158331 ) ) ( not ( = ?auto_158330 ?auto_158332 ) ) ( not ( = ?auto_158331 ?auto_158332 ) ) ( ON ?auto_158331 ?auto_158332 ) ( ON ?auto_158330 ?auto_158331 ) ( ON ?auto_158329 ?auto_158330 ) ( ON ?auto_158328 ?auto_158329 ) ( ON ?auto_158327 ?auto_158328 ) ( ON ?auto_158326 ?auto_158327 ) ( ON ?auto_158325 ?auto_158326 ) ( ON ?auto_158324 ?auto_158325 ) ( ON ?auto_158323 ?auto_158324 ) ( CLEAR ?auto_158321 ) ( ON ?auto_158322 ?auto_158323 ) ( CLEAR ?auto_158322 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_158321 ?auto_158322 )
      ( MAKE-12PILE ?auto_158321 ?auto_158322 ?auto_158323 ?auto_158324 ?auto_158325 ?auto_158326 ?auto_158327 ?auto_158328 ?auto_158329 ?auto_158330 ?auto_158331 ?auto_158332 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_158345 - BLOCK
      ?auto_158346 - BLOCK
      ?auto_158347 - BLOCK
      ?auto_158348 - BLOCK
      ?auto_158349 - BLOCK
      ?auto_158350 - BLOCK
      ?auto_158351 - BLOCK
      ?auto_158352 - BLOCK
      ?auto_158353 - BLOCK
      ?auto_158354 - BLOCK
      ?auto_158355 - BLOCK
      ?auto_158356 - BLOCK
    )
    :vars
    (
      ?auto_158357 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158356 ?auto_158357 ) ( not ( = ?auto_158345 ?auto_158346 ) ) ( not ( = ?auto_158345 ?auto_158347 ) ) ( not ( = ?auto_158345 ?auto_158348 ) ) ( not ( = ?auto_158345 ?auto_158349 ) ) ( not ( = ?auto_158345 ?auto_158350 ) ) ( not ( = ?auto_158345 ?auto_158351 ) ) ( not ( = ?auto_158345 ?auto_158352 ) ) ( not ( = ?auto_158345 ?auto_158353 ) ) ( not ( = ?auto_158345 ?auto_158354 ) ) ( not ( = ?auto_158345 ?auto_158355 ) ) ( not ( = ?auto_158345 ?auto_158356 ) ) ( not ( = ?auto_158345 ?auto_158357 ) ) ( not ( = ?auto_158346 ?auto_158347 ) ) ( not ( = ?auto_158346 ?auto_158348 ) ) ( not ( = ?auto_158346 ?auto_158349 ) ) ( not ( = ?auto_158346 ?auto_158350 ) ) ( not ( = ?auto_158346 ?auto_158351 ) ) ( not ( = ?auto_158346 ?auto_158352 ) ) ( not ( = ?auto_158346 ?auto_158353 ) ) ( not ( = ?auto_158346 ?auto_158354 ) ) ( not ( = ?auto_158346 ?auto_158355 ) ) ( not ( = ?auto_158346 ?auto_158356 ) ) ( not ( = ?auto_158346 ?auto_158357 ) ) ( not ( = ?auto_158347 ?auto_158348 ) ) ( not ( = ?auto_158347 ?auto_158349 ) ) ( not ( = ?auto_158347 ?auto_158350 ) ) ( not ( = ?auto_158347 ?auto_158351 ) ) ( not ( = ?auto_158347 ?auto_158352 ) ) ( not ( = ?auto_158347 ?auto_158353 ) ) ( not ( = ?auto_158347 ?auto_158354 ) ) ( not ( = ?auto_158347 ?auto_158355 ) ) ( not ( = ?auto_158347 ?auto_158356 ) ) ( not ( = ?auto_158347 ?auto_158357 ) ) ( not ( = ?auto_158348 ?auto_158349 ) ) ( not ( = ?auto_158348 ?auto_158350 ) ) ( not ( = ?auto_158348 ?auto_158351 ) ) ( not ( = ?auto_158348 ?auto_158352 ) ) ( not ( = ?auto_158348 ?auto_158353 ) ) ( not ( = ?auto_158348 ?auto_158354 ) ) ( not ( = ?auto_158348 ?auto_158355 ) ) ( not ( = ?auto_158348 ?auto_158356 ) ) ( not ( = ?auto_158348 ?auto_158357 ) ) ( not ( = ?auto_158349 ?auto_158350 ) ) ( not ( = ?auto_158349 ?auto_158351 ) ) ( not ( = ?auto_158349 ?auto_158352 ) ) ( not ( = ?auto_158349 ?auto_158353 ) ) ( not ( = ?auto_158349 ?auto_158354 ) ) ( not ( = ?auto_158349 ?auto_158355 ) ) ( not ( = ?auto_158349 ?auto_158356 ) ) ( not ( = ?auto_158349 ?auto_158357 ) ) ( not ( = ?auto_158350 ?auto_158351 ) ) ( not ( = ?auto_158350 ?auto_158352 ) ) ( not ( = ?auto_158350 ?auto_158353 ) ) ( not ( = ?auto_158350 ?auto_158354 ) ) ( not ( = ?auto_158350 ?auto_158355 ) ) ( not ( = ?auto_158350 ?auto_158356 ) ) ( not ( = ?auto_158350 ?auto_158357 ) ) ( not ( = ?auto_158351 ?auto_158352 ) ) ( not ( = ?auto_158351 ?auto_158353 ) ) ( not ( = ?auto_158351 ?auto_158354 ) ) ( not ( = ?auto_158351 ?auto_158355 ) ) ( not ( = ?auto_158351 ?auto_158356 ) ) ( not ( = ?auto_158351 ?auto_158357 ) ) ( not ( = ?auto_158352 ?auto_158353 ) ) ( not ( = ?auto_158352 ?auto_158354 ) ) ( not ( = ?auto_158352 ?auto_158355 ) ) ( not ( = ?auto_158352 ?auto_158356 ) ) ( not ( = ?auto_158352 ?auto_158357 ) ) ( not ( = ?auto_158353 ?auto_158354 ) ) ( not ( = ?auto_158353 ?auto_158355 ) ) ( not ( = ?auto_158353 ?auto_158356 ) ) ( not ( = ?auto_158353 ?auto_158357 ) ) ( not ( = ?auto_158354 ?auto_158355 ) ) ( not ( = ?auto_158354 ?auto_158356 ) ) ( not ( = ?auto_158354 ?auto_158357 ) ) ( not ( = ?auto_158355 ?auto_158356 ) ) ( not ( = ?auto_158355 ?auto_158357 ) ) ( not ( = ?auto_158356 ?auto_158357 ) ) ( ON ?auto_158355 ?auto_158356 ) ( ON ?auto_158354 ?auto_158355 ) ( ON ?auto_158353 ?auto_158354 ) ( ON ?auto_158352 ?auto_158353 ) ( ON ?auto_158351 ?auto_158352 ) ( ON ?auto_158350 ?auto_158351 ) ( ON ?auto_158349 ?auto_158350 ) ( ON ?auto_158348 ?auto_158349 ) ( ON ?auto_158347 ?auto_158348 ) ( ON ?auto_158346 ?auto_158347 ) ( ON ?auto_158345 ?auto_158346 ) ( CLEAR ?auto_158345 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_158345 )
      ( MAKE-12PILE ?auto_158345 ?auto_158346 ?auto_158347 ?auto_158348 ?auto_158349 ?auto_158350 ?auto_158351 ?auto_158352 ?auto_158353 ?auto_158354 ?auto_158355 ?auto_158356 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_158370 - BLOCK
      ?auto_158371 - BLOCK
      ?auto_158372 - BLOCK
      ?auto_158373 - BLOCK
      ?auto_158374 - BLOCK
      ?auto_158375 - BLOCK
      ?auto_158376 - BLOCK
      ?auto_158377 - BLOCK
      ?auto_158378 - BLOCK
      ?auto_158379 - BLOCK
      ?auto_158380 - BLOCK
      ?auto_158381 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_158381 ) ( not ( = ?auto_158370 ?auto_158371 ) ) ( not ( = ?auto_158370 ?auto_158372 ) ) ( not ( = ?auto_158370 ?auto_158373 ) ) ( not ( = ?auto_158370 ?auto_158374 ) ) ( not ( = ?auto_158370 ?auto_158375 ) ) ( not ( = ?auto_158370 ?auto_158376 ) ) ( not ( = ?auto_158370 ?auto_158377 ) ) ( not ( = ?auto_158370 ?auto_158378 ) ) ( not ( = ?auto_158370 ?auto_158379 ) ) ( not ( = ?auto_158370 ?auto_158380 ) ) ( not ( = ?auto_158370 ?auto_158381 ) ) ( not ( = ?auto_158371 ?auto_158372 ) ) ( not ( = ?auto_158371 ?auto_158373 ) ) ( not ( = ?auto_158371 ?auto_158374 ) ) ( not ( = ?auto_158371 ?auto_158375 ) ) ( not ( = ?auto_158371 ?auto_158376 ) ) ( not ( = ?auto_158371 ?auto_158377 ) ) ( not ( = ?auto_158371 ?auto_158378 ) ) ( not ( = ?auto_158371 ?auto_158379 ) ) ( not ( = ?auto_158371 ?auto_158380 ) ) ( not ( = ?auto_158371 ?auto_158381 ) ) ( not ( = ?auto_158372 ?auto_158373 ) ) ( not ( = ?auto_158372 ?auto_158374 ) ) ( not ( = ?auto_158372 ?auto_158375 ) ) ( not ( = ?auto_158372 ?auto_158376 ) ) ( not ( = ?auto_158372 ?auto_158377 ) ) ( not ( = ?auto_158372 ?auto_158378 ) ) ( not ( = ?auto_158372 ?auto_158379 ) ) ( not ( = ?auto_158372 ?auto_158380 ) ) ( not ( = ?auto_158372 ?auto_158381 ) ) ( not ( = ?auto_158373 ?auto_158374 ) ) ( not ( = ?auto_158373 ?auto_158375 ) ) ( not ( = ?auto_158373 ?auto_158376 ) ) ( not ( = ?auto_158373 ?auto_158377 ) ) ( not ( = ?auto_158373 ?auto_158378 ) ) ( not ( = ?auto_158373 ?auto_158379 ) ) ( not ( = ?auto_158373 ?auto_158380 ) ) ( not ( = ?auto_158373 ?auto_158381 ) ) ( not ( = ?auto_158374 ?auto_158375 ) ) ( not ( = ?auto_158374 ?auto_158376 ) ) ( not ( = ?auto_158374 ?auto_158377 ) ) ( not ( = ?auto_158374 ?auto_158378 ) ) ( not ( = ?auto_158374 ?auto_158379 ) ) ( not ( = ?auto_158374 ?auto_158380 ) ) ( not ( = ?auto_158374 ?auto_158381 ) ) ( not ( = ?auto_158375 ?auto_158376 ) ) ( not ( = ?auto_158375 ?auto_158377 ) ) ( not ( = ?auto_158375 ?auto_158378 ) ) ( not ( = ?auto_158375 ?auto_158379 ) ) ( not ( = ?auto_158375 ?auto_158380 ) ) ( not ( = ?auto_158375 ?auto_158381 ) ) ( not ( = ?auto_158376 ?auto_158377 ) ) ( not ( = ?auto_158376 ?auto_158378 ) ) ( not ( = ?auto_158376 ?auto_158379 ) ) ( not ( = ?auto_158376 ?auto_158380 ) ) ( not ( = ?auto_158376 ?auto_158381 ) ) ( not ( = ?auto_158377 ?auto_158378 ) ) ( not ( = ?auto_158377 ?auto_158379 ) ) ( not ( = ?auto_158377 ?auto_158380 ) ) ( not ( = ?auto_158377 ?auto_158381 ) ) ( not ( = ?auto_158378 ?auto_158379 ) ) ( not ( = ?auto_158378 ?auto_158380 ) ) ( not ( = ?auto_158378 ?auto_158381 ) ) ( not ( = ?auto_158379 ?auto_158380 ) ) ( not ( = ?auto_158379 ?auto_158381 ) ) ( not ( = ?auto_158380 ?auto_158381 ) ) ( ON ?auto_158380 ?auto_158381 ) ( ON ?auto_158379 ?auto_158380 ) ( ON ?auto_158378 ?auto_158379 ) ( ON ?auto_158377 ?auto_158378 ) ( ON ?auto_158376 ?auto_158377 ) ( ON ?auto_158375 ?auto_158376 ) ( ON ?auto_158374 ?auto_158375 ) ( ON ?auto_158373 ?auto_158374 ) ( ON ?auto_158372 ?auto_158373 ) ( ON ?auto_158371 ?auto_158372 ) ( ON ?auto_158370 ?auto_158371 ) ( CLEAR ?auto_158370 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_158370 )
      ( MAKE-12PILE ?auto_158370 ?auto_158371 ?auto_158372 ?auto_158373 ?auto_158374 ?auto_158375 ?auto_158376 ?auto_158377 ?auto_158378 ?auto_158379 ?auto_158380 ?auto_158381 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_158394 - BLOCK
      ?auto_158395 - BLOCK
      ?auto_158396 - BLOCK
      ?auto_158397 - BLOCK
      ?auto_158398 - BLOCK
      ?auto_158399 - BLOCK
      ?auto_158400 - BLOCK
      ?auto_158401 - BLOCK
      ?auto_158402 - BLOCK
      ?auto_158403 - BLOCK
      ?auto_158404 - BLOCK
      ?auto_158405 - BLOCK
    )
    :vars
    (
      ?auto_158406 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_158394 ?auto_158395 ) ) ( not ( = ?auto_158394 ?auto_158396 ) ) ( not ( = ?auto_158394 ?auto_158397 ) ) ( not ( = ?auto_158394 ?auto_158398 ) ) ( not ( = ?auto_158394 ?auto_158399 ) ) ( not ( = ?auto_158394 ?auto_158400 ) ) ( not ( = ?auto_158394 ?auto_158401 ) ) ( not ( = ?auto_158394 ?auto_158402 ) ) ( not ( = ?auto_158394 ?auto_158403 ) ) ( not ( = ?auto_158394 ?auto_158404 ) ) ( not ( = ?auto_158394 ?auto_158405 ) ) ( not ( = ?auto_158395 ?auto_158396 ) ) ( not ( = ?auto_158395 ?auto_158397 ) ) ( not ( = ?auto_158395 ?auto_158398 ) ) ( not ( = ?auto_158395 ?auto_158399 ) ) ( not ( = ?auto_158395 ?auto_158400 ) ) ( not ( = ?auto_158395 ?auto_158401 ) ) ( not ( = ?auto_158395 ?auto_158402 ) ) ( not ( = ?auto_158395 ?auto_158403 ) ) ( not ( = ?auto_158395 ?auto_158404 ) ) ( not ( = ?auto_158395 ?auto_158405 ) ) ( not ( = ?auto_158396 ?auto_158397 ) ) ( not ( = ?auto_158396 ?auto_158398 ) ) ( not ( = ?auto_158396 ?auto_158399 ) ) ( not ( = ?auto_158396 ?auto_158400 ) ) ( not ( = ?auto_158396 ?auto_158401 ) ) ( not ( = ?auto_158396 ?auto_158402 ) ) ( not ( = ?auto_158396 ?auto_158403 ) ) ( not ( = ?auto_158396 ?auto_158404 ) ) ( not ( = ?auto_158396 ?auto_158405 ) ) ( not ( = ?auto_158397 ?auto_158398 ) ) ( not ( = ?auto_158397 ?auto_158399 ) ) ( not ( = ?auto_158397 ?auto_158400 ) ) ( not ( = ?auto_158397 ?auto_158401 ) ) ( not ( = ?auto_158397 ?auto_158402 ) ) ( not ( = ?auto_158397 ?auto_158403 ) ) ( not ( = ?auto_158397 ?auto_158404 ) ) ( not ( = ?auto_158397 ?auto_158405 ) ) ( not ( = ?auto_158398 ?auto_158399 ) ) ( not ( = ?auto_158398 ?auto_158400 ) ) ( not ( = ?auto_158398 ?auto_158401 ) ) ( not ( = ?auto_158398 ?auto_158402 ) ) ( not ( = ?auto_158398 ?auto_158403 ) ) ( not ( = ?auto_158398 ?auto_158404 ) ) ( not ( = ?auto_158398 ?auto_158405 ) ) ( not ( = ?auto_158399 ?auto_158400 ) ) ( not ( = ?auto_158399 ?auto_158401 ) ) ( not ( = ?auto_158399 ?auto_158402 ) ) ( not ( = ?auto_158399 ?auto_158403 ) ) ( not ( = ?auto_158399 ?auto_158404 ) ) ( not ( = ?auto_158399 ?auto_158405 ) ) ( not ( = ?auto_158400 ?auto_158401 ) ) ( not ( = ?auto_158400 ?auto_158402 ) ) ( not ( = ?auto_158400 ?auto_158403 ) ) ( not ( = ?auto_158400 ?auto_158404 ) ) ( not ( = ?auto_158400 ?auto_158405 ) ) ( not ( = ?auto_158401 ?auto_158402 ) ) ( not ( = ?auto_158401 ?auto_158403 ) ) ( not ( = ?auto_158401 ?auto_158404 ) ) ( not ( = ?auto_158401 ?auto_158405 ) ) ( not ( = ?auto_158402 ?auto_158403 ) ) ( not ( = ?auto_158402 ?auto_158404 ) ) ( not ( = ?auto_158402 ?auto_158405 ) ) ( not ( = ?auto_158403 ?auto_158404 ) ) ( not ( = ?auto_158403 ?auto_158405 ) ) ( not ( = ?auto_158404 ?auto_158405 ) ) ( ON ?auto_158394 ?auto_158406 ) ( not ( = ?auto_158405 ?auto_158406 ) ) ( not ( = ?auto_158404 ?auto_158406 ) ) ( not ( = ?auto_158403 ?auto_158406 ) ) ( not ( = ?auto_158402 ?auto_158406 ) ) ( not ( = ?auto_158401 ?auto_158406 ) ) ( not ( = ?auto_158400 ?auto_158406 ) ) ( not ( = ?auto_158399 ?auto_158406 ) ) ( not ( = ?auto_158398 ?auto_158406 ) ) ( not ( = ?auto_158397 ?auto_158406 ) ) ( not ( = ?auto_158396 ?auto_158406 ) ) ( not ( = ?auto_158395 ?auto_158406 ) ) ( not ( = ?auto_158394 ?auto_158406 ) ) ( ON ?auto_158395 ?auto_158394 ) ( ON ?auto_158396 ?auto_158395 ) ( ON ?auto_158397 ?auto_158396 ) ( ON ?auto_158398 ?auto_158397 ) ( ON ?auto_158399 ?auto_158398 ) ( ON ?auto_158400 ?auto_158399 ) ( ON ?auto_158401 ?auto_158400 ) ( ON ?auto_158402 ?auto_158401 ) ( ON ?auto_158403 ?auto_158402 ) ( ON ?auto_158404 ?auto_158403 ) ( ON ?auto_158405 ?auto_158404 ) ( CLEAR ?auto_158405 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_158405 ?auto_158404 ?auto_158403 ?auto_158402 ?auto_158401 ?auto_158400 ?auto_158399 ?auto_158398 ?auto_158397 ?auto_158396 ?auto_158395 ?auto_158394 )
      ( MAKE-12PILE ?auto_158394 ?auto_158395 ?auto_158396 ?auto_158397 ?auto_158398 ?auto_158399 ?auto_158400 ?auto_158401 ?auto_158402 ?auto_158403 ?auto_158404 ?auto_158405 ) )
  )

)

