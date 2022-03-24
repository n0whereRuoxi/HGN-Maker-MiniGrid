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
      ?auto_243673 - BLOCK
    )
    :vars
    (
      ?auto_243674 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_243673 ?auto_243674 ) ( CLEAR ?auto_243673 ) ( HAND-EMPTY ) ( not ( = ?auto_243673 ?auto_243674 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_243673 ?auto_243674 )
      ( !PUTDOWN ?auto_243673 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_243676 - BLOCK
    )
    :vars
    (
      ?auto_243677 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_243676 ?auto_243677 ) ( CLEAR ?auto_243676 ) ( HAND-EMPTY ) ( not ( = ?auto_243676 ?auto_243677 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_243676 ?auto_243677 )
      ( !PUTDOWN ?auto_243676 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_243680 - BLOCK
      ?auto_243681 - BLOCK
    )
    :vars
    (
      ?auto_243682 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_243680 ) ( ON ?auto_243681 ?auto_243682 ) ( CLEAR ?auto_243681 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_243680 ) ( not ( = ?auto_243680 ?auto_243681 ) ) ( not ( = ?auto_243680 ?auto_243682 ) ) ( not ( = ?auto_243681 ?auto_243682 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_243681 ?auto_243682 )
      ( !STACK ?auto_243681 ?auto_243680 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_243685 - BLOCK
      ?auto_243686 - BLOCK
    )
    :vars
    (
      ?auto_243687 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_243685 ) ( ON ?auto_243686 ?auto_243687 ) ( CLEAR ?auto_243686 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_243685 ) ( not ( = ?auto_243685 ?auto_243686 ) ) ( not ( = ?auto_243685 ?auto_243687 ) ) ( not ( = ?auto_243686 ?auto_243687 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_243686 ?auto_243687 )
      ( !STACK ?auto_243686 ?auto_243685 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_243690 - BLOCK
      ?auto_243691 - BLOCK
    )
    :vars
    (
      ?auto_243692 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_243691 ?auto_243692 ) ( not ( = ?auto_243690 ?auto_243691 ) ) ( not ( = ?auto_243690 ?auto_243692 ) ) ( not ( = ?auto_243691 ?auto_243692 ) ) ( ON ?auto_243690 ?auto_243691 ) ( CLEAR ?auto_243690 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_243690 )
      ( MAKE-2PILE ?auto_243690 ?auto_243691 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_243695 - BLOCK
      ?auto_243696 - BLOCK
    )
    :vars
    (
      ?auto_243697 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_243696 ?auto_243697 ) ( not ( = ?auto_243695 ?auto_243696 ) ) ( not ( = ?auto_243695 ?auto_243697 ) ) ( not ( = ?auto_243696 ?auto_243697 ) ) ( ON ?auto_243695 ?auto_243696 ) ( CLEAR ?auto_243695 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_243695 )
      ( MAKE-2PILE ?auto_243695 ?auto_243696 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_243701 - BLOCK
      ?auto_243702 - BLOCK
      ?auto_243703 - BLOCK
    )
    :vars
    (
      ?auto_243704 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_243702 ) ( ON ?auto_243703 ?auto_243704 ) ( CLEAR ?auto_243703 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_243701 ) ( ON ?auto_243702 ?auto_243701 ) ( not ( = ?auto_243701 ?auto_243702 ) ) ( not ( = ?auto_243701 ?auto_243703 ) ) ( not ( = ?auto_243701 ?auto_243704 ) ) ( not ( = ?auto_243702 ?auto_243703 ) ) ( not ( = ?auto_243702 ?auto_243704 ) ) ( not ( = ?auto_243703 ?auto_243704 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_243703 ?auto_243704 )
      ( !STACK ?auto_243703 ?auto_243702 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_243708 - BLOCK
      ?auto_243709 - BLOCK
      ?auto_243710 - BLOCK
    )
    :vars
    (
      ?auto_243711 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_243709 ) ( ON ?auto_243710 ?auto_243711 ) ( CLEAR ?auto_243710 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_243708 ) ( ON ?auto_243709 ?auto_243708 ) ( not ( = ?auto_243708 ?auto_243709 ) ) ( not ( = ?auto_243708 ?auto_243710 ) ) ( not ( = ?auto_243708 ?auto_243711 ) ) ( not ( = ?auto_243709 ?auto_243710 ) ) ( not ( = ?auto_243709 ?auto_243711 ) ) ( not ( = ?auto_243710 ?auto_243711 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_243710 ?auto_243711 )
      ( !STACK ?auto_243710 ?auto_243709 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_243715 - BLOCK
      ?auto_243716 - BLOCK
      ?auto_243717 - BLOCK
    )
    :vars
    (
      ?auto_243718 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_243717 ?auto_243718 ) ( ON-TABLE ?auto_243715 ) ( not ( = ?auto_243715 ?auto_243716 ) ) ( not ( = ?auto_243715 ?auto_243717 ) ) ( not ( = ?auto_243715 ?auto_243718 ) ) ( not ( = ?auto_243716 ?auto_243717 ) ) ( not ( = ?auto_243716 ?auto_243718 ) ) ( not ( = ?auto_243717 ?auto_243718 ) ) ( CLEAR ?auto_243715 ) ( ON ?auto_243716 ?auto_243717 ) ( CLEAR ?auto_243716 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_243715 ?auto_243716 )
      ( MAKE-3PILE ?auto_243715 ?auto_243716 ?auto_243717 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_243722 - BLOCK
      ?auto_243723 - BLOCK
      ?auto_243724 - BLOCK
    )
    :vars
    (
      ?auto_243725 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_243724 ?auto_243725 ) ( ON-TABLE ?auto_243722 ) ( not ( = ?auto_243722 ?auto_243723 ) ) ( not ( = ?auto_243722 ?auto_243724 ) ) ( not ( = ?auto_243722 ?auto_243725 ) ) ( not ( = ?auto_243723 ?auto_243724 ) ) ( not ( = ?auto_243723 ?auto_243725 ) ) ( not ( = ?auto_243724 ?auto_243725 ) ) ( CLEAR ?auto_243722 ) ( ON ?auto_243723 ?auto_243724 ) ( CLEAR ?auto_243723 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_243722 ?auto_243723 )
      ( MAKE-3PILE ?auto_243722 ?auto_243723 ?auto_243724 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_243729 - BLOCK
      ?auto_243730 - BLOCK
      ?auto_243731 - BLOCK
    )
    :vars
    (
      ?auto_243732 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_243731 ?auto_243732 ) ( not ( = ?auto_243729 ?auto_243730 ) ) ( not ( = ?auto_243729 ?auto_243731 ) ) ( not ( = ?auto_243729 ?auto_243732 ) ) ( not ( = ?auto_243730 ?auto_243731 ) ) ( not ( = ?auto_243730 ?auto_243732 ) ) ( not ( = ?auto_243731 ?auto_243732 ) ) ( ON ?auto_243730 ?auto_243731 ) ( ON ?auto_243729 ?auto_243730 ) ( CLEAR ?auto_243729 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_243729 )
      ( MAKE-3PILE ?auto_243729 ?auto_243730 ?auto_243731 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_243736 - BLOCK
      ?auto_243737 - BLOCK
      ?auto_243738 - BLOCK
    )
    :vars
    (
      ?auto_243739 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_243738 ?auto_243739 ) ( not ( = ?auto_243736 ?auto_243737 ) ) ( not ( = ?auto_243736 ?auto_243738 ) ) ( not ( = ?auto_243736 ?auto_243739 ) ) ( not ( = ?auto_243737 ?auto_243738 ) ) ( not ( = ?auto_243737 ?auto_243739 ) ) ( not ( = ?auto_243738 ?auto_243739 ) ) ( ON ?auto_243737 ?auto_243738 ) ( ON ?auto_243736 ?auto_243737 ) ( CLEAR ?auto_243736 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_243736 )
      ( MAKE-3PILE ?auto_243736 ?auto_243737 ?auto_243738 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_243744 - BLOCK
      ?auto_243745 - BLOCK
      ?auto_243746 - BLOCK
      ?auto_243747 - BLOCK
    )
    :vars
    (
      ?auto_243748 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_243746 ) ( ON ?auto_243747 ?auto_243748 ) ( CLEAR ?auto_243747 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_243744 ) ( ON ?auto_243745 ?auto_243744 ) ( ON ?auto_243746 ?auto_243745 ) ( not ( = ?auto_243744 ?auto_243745 ) ) ( not ( = ?auto_243744 ?auto_243746 ) ) ( not ( = ?auto_243744 ?auto_243747 ) ) ( not ( = ?auto_243744 ?auto_243748 ) ) ( not ( = ?auto_243745 ?auto_243746 ) ) ( not ( = ?auto_243745 ?auto_243747 ) ) ( not ( = ?auto_243745 ?auto_243748 ) ) ( not ( = ?auto_243746 ?auto_243747 ) ) ( not ( = ?auto_243746 ?auto_243748 ) ) ( not ( = ?auto_243747 ?auto_243748 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_243747 ?auto_243748 )
      ( !STACK ?auto_243747 ?auto_243746 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_243753 - BLOCK
      ?auto_243754 - BLOCK
      ?auto_243755 - BLOCK
      ?auto_243756 - BLOCK
    )
    :vars
    (
      ?auto_243757 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_243755 ) ( ON ?auto_243756 ?auto_243757 ) ( CLEAR ?auto_243756 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_243753 ) ( ON ?auto_243754 ?auto_243753 ) ( ON ?auto_243755 ?auto_243754 ) ( not ( = ?auto_243753 ?auto_243754 ) ) ( not ( = ?auto_243753 ?auto_243755 ) ) ( not ( = ?auto_243753 ?auto_243756 ) ) ( not ( = ?auto_243753 ?auto_243757 ) ) ( not ( = ?auto_243754 ?auto_243755 ) ) ( not ( = ?auto_243754 ?auto_243756 ) ) ( not ( = ?auto_243754 ?auto_243757 ) ) ( not ( = ?auto_243755 ?auto_243756 ) ) ( not ( = ?auto_243755 ?auto_243757 ) ) ( not ( = ?auto_243756 ?auto_243757 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_243756 ?auto_243757 )
      ( !STACK ?auto_243756 ?auto_243755 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_243762 - BLOCK
      ?auto_243763 - BLOCK
      ?auto_243764 - BLOCK
      ?auto_243765 - BLOCK
    )
    :vars
    (
      ?auto_243766 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_243765 ?auto_243766 ) ( ON-TABLE ?auto_243762 ) ( ON ?auto_243763 ?auto_243762 ) ( not ( = ?auto_243762 ?auto_243763 ) ) ( not ( = ?auto_243762 ?auto_243764 ) ) ( not ( = ?auto_243762 ?auto_243765 ) ) ( not ( = ?auto_243762 ?auto_243766 ) ) ( not ( = ?auto_243763 ?auto_243764 ) ) ( not ( = ?auto_243763 ?auto_243765 ) ) ( not ( = ?auto_243763 ?auto_243766 ) ) ( not ( = ?auto_243764 ?auto_243765 ) ) ( not ( = ?auto_243764 ?auto_243766 ) ) ( not ( = ?auto_243765 ?auto_243766 ) ) ( CLEAR ?auto_243763 ) ( ON ?auto_243764 ?auto_243765 ) ( CLEAR ?auto_243764 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_243762 ?auto_243763 ?auto_243764 )
      ( MAKE-4PILE ?auto_243762 ?auto_243763 ?auto_243764 ?auto_243765 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_243771 - BLOCK
      ?auto_243772 - BLOCK
      ?auto_243773 - BLOCK
      ?auto_243774 - BLOCK
    )
    :vars
    (
      ?auto_243775 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_243774 ?auto_243775 ) ( ON-TABLE ?auto_243771 ) ( ON ?auto_243772 ?auto_243771 ) ( not ( = ?auto_243771 ?auto_243772 ) ) ( not ( = ?auto_243771 ?auto_243773 ) ) ( not ( = ?auto_243771 ?auto_243774 ) ) ( not ( = ?auto_243771 ?auto_243775 ) ) ( not ( = ?auto_243772 ?auto_243773 ) ) ( not ( = ?auto_243772 ?auto_243774 ) ) ( not ( = ?auto_243772 ?auto_243775 ) ) ( not ( = ?auto_243773 ?auto_243774 ) ) ( not ( = ?auto_243773 ?auto_243775 ) ) ( not ( = ?auto_243774 ?auto_243775 ) ) ( CLEAR ?auto_243772 ) ( ON ?auto_243773 ?auto_243774 ) ( CLEAR ?auto_243773 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_243771 ?auto_243772 ?auto_243773 )
      ( MAKE-4PILE ?auto_243771 ?auto_243772 ?auto_243773 ?auto_243774 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_243780 - BLOCK
      ?auto_243781 - BLOCK
      ?auto_243782 - BLOCK
      ?auto_243783 - BLOCK
    )
    :vars
    (
      ?auto_243784 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_243783 ?auto_243784 ) ( ON-TABLE ?auto_243780 ) ( not ( = ?auto_243780 ?auto_243781 ) ) ( not ( = ?auto_243780 ?auto_243782 ) ) ( not ( = ?auto_243780 ?auto_243783 ) ) ( not ( = ?auto_243780 ?auto_243784 ) ) ( not ( = ?auto_243781 ?auto_243782 ) ) ( not ( = ?auto_243781 ?auto_243783 ) ) ( not ( = ?auto_243781 ?auto_243784 ) ) ( not ( = ?auto_243782 ?auto_243783 ) ) ( not ( = ?auto_243782 ?auto_243784 ) ) ( not ( = ?auto_243783 ?auto_243784 ) ) ( ON ?auto_243782 ?auto_243783 ) ( CLEAR ?auto_243780 ) ( ON ?auto_243781 ?auto_243782 ) ( CLEAR ?auto_243781 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_243780 ?auto_243781 )
      ( MAKE-4PILE ?auto_243780 ?auto_243781 ?auto_243782 ?auto_243783 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_243789 - BLOCK
      ?auto_243790 - BLOCK
      ?auto_243791 - BLOCK
      ?auto_243792 - BLOCK
    )
    :vars
    (
      ?auto_243793 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_243792 ?auto_243793 ) ( ON-TABLE ?auto_243789 ) ( not ( = ?auto_243789 ?auto_243790 ) ) ( not ( = ?auto_243789 ?auto_243791 ) ) ( not ( = ?auto_243789 ?auto_243792 ) ) ( not ( = ?auto_243789 ?auto_243793 ) ) ( not ( = ?auto_243790 ?auto_243791 ) ) ( not ( = ?auto_243790 ?auto_243792 ) ) ( not ( = ?auto_243790 ?auto_243793 ) ) ( not ( = ?auto_243791 ?auto_243792 ) ) ( not ( = ?auto_243791 ?auto_243793 ) ) ( not ( = ?auto_243792 ?auto_243793 ) ) ( ON ?auto_243791 ?auto_243792 ) ( CLEAR ?auto_243789 ) ( ON ?auto_243790 ?auto_243791 ) ( CLEAR ?auto_243790 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_243789 ?auto_243790 )
      ( MAKE-4PILE ?auto_243789 ?auto_243790 ?auto_243791 ?auto_243792 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_243798 - BLOCK
      ?auto_243799 - BLOCK
      ?auto_243800 - BLOCK
      ?auto_243801 - BLOCK
    )
    :vars
    (
      ?auto_243802 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_243801 ?auto_243802 ) ( not ( = ?auto_243798 ?auto_243799 ) ) ( not ( = ?auto_243798 ?auto_243800 ) ) ( not ( = ?auto_243798 ?auto_243801 ) ) ( not ( = ?auto_243798 ?auto_243802 ) ) ( not ( = ?auto_243799 ?auto_243800 ) ) ( not ( = ?auto_243799 ?auto_243801 ) ) ( not ( = ?auto_243799 ?auto_243802 ) ) ( not ( = ?auto_243800 ?auto_243801 ) ) ( not ( = ?auto_243800 ?auto_243802 ) ) ( not ( = ?auto_243801 ?auto_243802 ) ) ( ON ?auto_243800 ?auto_243801 ) ( ON ?auto_243799 ?auto_243800 ) ( ON ?auto_243798 ?auto_243799 ) ( CLEAR ?auto_243798 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_243798 )
      ( MAKE-4PILE ?auto_243798 ?auto_243799 ?auto_243800 ?auto_243801 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_243807 - BLOCK
      ?auto_243808 - BLOCK
      ?auto_243809 - BLOCK
      ?auto_243810 - BLOCK
    )
    :vars
    (
      ?auto_243811 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_243810 ?auto_243811 ) ( not ( = ?auto_243807 ?auto_243808 ) ) ( not ( = ?auto_243807 ?auto_243809 ) ) ( not ( = ?auto_243807 ?auto_243810 ) ) ( not ( = ?auto_243807 ?auto_243811 ) ) ( not ( = ?auto_243808 ?auto_243809 ) ) ( not ( = ?auto_243808 ?auto_243810 ) ) ( not ( = ?auto_243808 ?auto_243811 ) ) ( not ( = ?auto_243809 ?auto_243810 ) ) ( not ( = ?auto_243809 ?auto_243811 ) ) ( not ( = ?auto_243810 ?auto_243811 ) ) ( ON ?auto_243809 ?auto_243810 ) ( ON ?auto_243808 ?auto_243809 ) ( ON ?auto_243807 ?auto_243808 ) ( CLEAR ?auto_243807 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_243807 )
      ( MAKE-4PILE ?auto_243807 ?auto_243808 ?auto_243809 ?auto_243810 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_243817 - BLOCK
      ?auto_243818 - BLOCK
      ?auto_243819 - BLOCK
      ?auto_243820 - BLOCK
      ?auto_243821 - BLOCK
    )
    :vars
    (
      ?auto_243822 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_243820 ) ( ON ?auto_243821 ?auto_243822 ) ( CLEAR ?auto_243821 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_243817 ) ( ON ?auto_243818 ?auto_243817 ) ( ON ?auto_243819 ?auto_243818 ) ( ON ?auto_243820 ?auto_243819 ) ( not ( = ?auto_243817 ?auto_243818 ) ) ( not ( = ?auto_243817 ?auto_243819 ) ) ( not ( = ?auto_243817 ?auto_243820 ) ) ( not ( = ?auto_243817 ?auto_243821 ) ) ( not ( = ?auto_243817 ?auto_243822 ) ) ( not ( = ?auto_243818 ?auto_243819 ) ) ( not ( = ?auto_243818 ?auto_243820 ) ) ( not ( = ?auto_243818 ?auto_243821 ) ) ( not ( = ?auto_243818 ?auto_243822 ) ) ( not ( = ?auto_243819 ?auto_243820 ) ) ( not ( = ?auto_243819 ?auto_243821 ) ) ( not ( = ?auto_243819 ?auto_243822 ) ) ( not ( = ?auto_243820 ?auto_243821 ) ) ( not ( = ?auto_243820 ?auto_243822 ) ) ( not ( = ?auto_243821 ?auto_243822 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_243821 ?auto_243822 )
      ( !STACK ?auto_243821 ?auto_243820 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_243828 - BLOCK
      ?auto_243829 - BLOCK
      ?auto_243830 - BLOCK
      ?auto_243831 - BLOCK
      ?auto_243832 - BLOCK
    )
    :vars
    (
      ?auto_243833 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_243831 ) ( ON ?auto_243832 ?auto_243833 ) ( CLEAR ?auto_243832 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_243828 ) ( ON ?auto_243829 ?auto_243828 ) ( ON ?auto_243830 ?auto_243829 ) ( ON ?auto_243831 ?auto_243830 ) ( not ( = ?auto_243828 ?auto_243829 ) ) ( not ( = ?auto_243828 ?auto_243830 ) ) ( not ( = ?auto_243828 ?auto_243831 ) ) ( not ( = ?auto_243828 ?auto_243832 ) ) ( not ( = ?auto_243828 ?auto_243833 ) ) ( not ( = ?auto_243829 ?auto_243830 ) ) ( not ( = ?auto_243829 ?auto_243831 ) ) ( not ( = ?auto_243829 ?auto_243832 ) ) ( not ( = ?auto_243829 ?auto_243833 ) ) ( not ( = ?auto_243830 ?auto_243831 ) ) ( not ( = ?auto_243830 ?auto_243832 ) ) ( not ( = ?auto_243830 ?auto_243833 ) ) ( not ( = ?auto_243831 ?auto_243832 ) ) ( not ( = ?auto_243831 ?auto_243833 ) ) ( not ( = ?auto_243832 ?auto_243833 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_243832 ?auto_243833 )
      ( !STACK ?auto_243832 ?auto_243831 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_243839 - BLOCK
      ?auto_243840 - BLOCK
      ?auto_243841 - BLOCK
      ?auto_243842 - BLOCK
      ?auto_243843 - BLOCK
    )
    :vars
    (
      ?auto_243844 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_243843 ?auto_243844 ) ( ON-TABLE ?auto_243839 ) ( ON ?auto_243840 ?auto_243839 ) ( ON ?auto_243841 ?auto_243840 ) ( not ( = ?auto_243839 ?auto_243840 ) ) ( not ( = ?auto_243839 ?auto_243841 ) ) ( not ( = ?auto_243839 ?auto_243842 ) ) ( not ( = ?auto_243839 ?auto_243843 ) ) ( not ( = ?auto_243839 ?auto_243844 ) ) ( not ( = ?auto_243840 ?auto_243841 ) ) ( not ( = ?auto_243840 ?auto_243842 ) ) ( not ( = ?auto_243840 ?auto_243843 ) ) ( not ( = ?auto_243840 ?auto_243844 ) ) ( not ( = ?auto_243841 ?auto_243842 ) ) ( not ( = ?auto_243841 ?auto_243843 ) ) ( not ( = ?auto_243841 ?auto_243844 ) ) ( not ( = ?auto_243842 ?auto_243843 ) ) ( not ( = ?auto_243842 ?auto_243844 ) ) ( not ( = ?auto_243843 ?auto_243844 ) ) ( CLEAR ?auto_243841 ) ( ON ?auto_243842 ?auto_243843 ) ( CLEAR ?auto_243842 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_243839 ?auto_243840 ?auto_243841 ?auto_243842 )
      ( MAKE-5PILE ?auto_243839 ?auto_243840 ?auto_243841 ?auto_243842 ?auto_243843 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_243850 - BLOCK
      ?auto_243851 - BLOCK
      ?auto_243852 - BLOCK
      ?auto_243853 - BLOCK
      ?auto_243854 - BLOCK
    )
    :vars
    (
      ?auto_243855 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_243854 ?auto_243855 ) ( ON-TABLE ?auto_243850 ) ( ON ?auto_243851 ?auto_243850 ) ( ON ?auto_243852 ?auto_243851 ) ( not ( = ?auto_243850 ?auto_243851 ) ) ( not ( = ?auto_243850 ?auto_243852 ) ) ( not ( = ?auto_243850 ?auto_243853 ) ) ( not ( = ?auto_243850 ?auto_243854 ) ) ( not ( = ?auto_243850 ?auto_243855 ) ) ( not ( = ?auto_243851 ?auto_243852 ) ) ( not ( = ?auto_243851 ?auto_243853 ) ) ( not ( = ?auto_243851 ?auto_243854 ) ) ( not ( = ?auto_243851 ?auto_243855 ) ) ( not ( = ?auto_243852 ?auto_243853 ) ) ( not ( = ?auto_243852 ?auto_243854 ) ) ( not ( = ?auto_243852 ?auto_243855 ) ) ( not ( = ?auto_243853 ?auto_243854 ) ) ( not ( = ?auto_243853 ?auto_243855 ) ) ( not ( = ?auto_243854 ?auto_243855 ) ) ( CLEAR ?auto_243852 ) ( ON ?auto_243853 ?auto_243854 ) ( CLEAR ?auto_243853 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_243850 ?auto_243851 ?auto_243852 ?auto_243853 )
      ( MAKE-5PILE ?auto_243850 ?auto_243851 ?auto_243852 ?auto_243853 ?auto_243854 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_243861 - BLOCK
      ?auto_243862 - BLOCK
      ?auto_243863 - BLOCK
      ?auto_243864 - BLOCK
      ?auto_243865 - BLOCK
    )
    :vars
    (
      ?auto_243866 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_243865 ?auto_243866 ) ( ON-TABLE ?auto_243861 ) ( ON ?auto_243862 ?auto_243861 ) ( not ( = ?auto_243861 ?auto_243862 ) ) ( not ( = ?auto_243861 ?auto_243863 ) ) ( not ( = ?auto_243861 ?auto_243864 ) ) ( not ( = ?auto_243861 ?auto_243865 ) ) ( not ( = ?auto_243861 ?auto_243866 ) ) ( not ( = ?auto_243862 ?auto_243863 ) ) ( not ( = ?auto_243862 ?auto_243864 ) ) ( not ( = ?auto_243862 ?auto_243865 ) ) ( not ( = ?auto_243862 ?auto_243866 ) ) ( not ( = ?auto_243863 ?auto_243864 ) ) ( not ( = ?auto_243863 ?auto_243865 ) ) ( not ( = ?auto_243863 ?auto_243866 ) ) ( not ( = ?auto_243864 ?auto_243865 ) ) ( not ( = ?auto_243864 ?auto_243866 ) ) ( not ( = ?auto_243865 ?auto_243866 ) ) ( ON ?auto_243864 ?auto_243865 ) ( CLEAR ?auto_243862 ) ( ON ?auto_243863 ?auto_243864 ) ( CLEAR ?auto_243863 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_243861 ?auto_243862 ?auto_243863 )
      ( MAKE-5PILE ?auto_243861 ?auto_243862 ?auto_243863 ?auto_243864 ?auto_243865 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_243872 - BLOCK
      ?auto_243873 - BLOCK
      ?auto_243874 - BLOCK
      ?auto_243875 - BLOCK
      ?auto_243876 - BLOCK
    )
    :vars
    (
      ?auto_243877 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_243876 ?auto_243877 ) ( ON-TABLE ?auto_243872 ) ( ON ?auto_243873 ?auto_243872 ) ( not ( = ?auto_243872 ?auto_243873 ) ) ( not ( = ?auto_243872 ?auto_243874 ) ) ( not ( = ?auto_243872 ?auto_243875 ) ) ( not ( = ?auto_243872 ?auto_243876 ) ) ( not ( = ?auto_243872 ?auto_243877 ) ) ( not ( = ?auto_243873 ?auto_243874 ) ) ( not ( = ?auto_243873 ?auto_243875 ) ) ( not ( = ?auto_243873 ?auto_243876 ) ) ( not ( = ?auto_243873 ?auto_243877 ) ) ( not ( = ?auto_243874 ?auto_243875 ) ) ( not ( = ?auto_243874 ?auto_243876 ) ) ( not ( = ?auto_243874 ?auto_243877 ) ) ( not ( = ?auto_243875 ?auto_243876 ) ) ( not ( = ?auto_243875 ?auto_243877 ) ) ( not ( = ?auto_243876 ?auto_243877 ) ) ( ON ?auto_243875 ?auto_243876 ) ( CLEAR ?auto_243873 ) ( ON ?auto_243874 ?auto_243875 ) ( CLEAR ?auto_243874 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_243872 ?auto_243873 ?auto_243874 )
      ( MAKE-5PILE ?auto_243872 ?auto_243873 ?auto_243874 ?auto_243875 ?auto_243876 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_243883 - BLOCK
      ?auto_243884 - BLOCK
      ?auto_243885 - BLOCK
      ?auto_243886 - BLOCK
      ?auto_243887 - BLOCK
    )
    :vars
    (
      ?auto_243888 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_243887 ?auto_243888 ) ( ON-TABLE ?auto_243883 ) ( not ( = ?auto_243883 ?auto_243884 ) ) ( not ( = ?auto_243883 ?auto_243885 ) ) ( not ( = ?auto_243883 ?auto_243886 ) ) ( not ( = ?auto_243883 ?auto_243887 ) ) ( not ( = ?auto_243883 ?auto_243888 ) ) ( not ( = ?auto_243884 ?auto_243885 ) ) ( not ( = ?auto_243884 ?auto_243886 ) ) ( not ( = ?auto_243884 ?auto_243887 ) ) ( not ( = ?auto_243884 ?auto_243888 ) ) ( not ( = ?auto_243885 ?auto_243886 ) ) ( not ( = ?auto_243885 ?auto_243887 ) ) ( not ( = ?auto_243885 ?auto_243888 ) ) ( not ( = ?auto_243886 ?auto_243887 ) ) ( not ( = ?auto_243886 ?auto_243888 ) ) ( not ( = ?auto_243887 ?auto_243888 ) ) ( ON ?auto_243886 ?auto_243887 ) ( ON ?auto_243885 ?auto_243886 ) ( CLEAR ?auto_243883 ) ( ON ?auto_243884 ?auto_243885 ) ( CLEAR ?auto_243884 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_243883 ?auto_243884 )
      ( MAKE-5PILE ?auto_243883 ?auto_243884 ?auto_243885 ?auto_243886 ?auto_243887 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_243894 - BLOCK
      ?auto_243895 - BLOCK
      ?auto_243896 - BLOCK
      ?auto_243897 - BLOCK
      ?auto_243898 - BLOCK
    )
    :vars
    (
      ?auto_243899 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_243898 ?auto_243899 ) ( ON-TABLE ?auto_243894 ) ( not ( = ?auto_243894 ?auto_243895 ) ) ( not ( = ?auto_243894 ?auto_243896 ) ) ( not ( = ?auto_243894 ?auto_243897 ) ) ( not ( = ?auto_243894 ?auto_243898 ) ) ( not ( = ?auto_243894 ?auto_243899 ) ) ( not ( = ?auto_243895 ?auto_243896 ) ) ( not ( = ?auto_243895 ?auto_243897 ) ) ( not ( = ?auto_243895 ?auto_243898 ) ) ( not ( = ?auto_243895 ?auto_243899 ) ) ( not ( = ?auto_243896 ?auto_243897 ) ) ( not ( = ?auto_243896 ?auto_243898 ) ) ( not ( = ?auto_243896 ?auto_243899 ) ) ( not ( = ?auto_243897 ?auto_243898 ) ) ( not ( = ?auto_243897 ?auto_243899 ) ) ( not ( = ?auto_243898 ?auto_243899 ) ) ( ON ?auto_243897 ?auto_243898 ) ( ON ?auto_243896 ?auto_243897 ) ( CLEAR ?auto_243894 ) ( ON ?auto_243895 ?auto_243896 ) ( CLEAR ?auto_243895 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_243894 ?auto_243895 )
      ( MAKE-5PILE ?auto_243894 ?auto_243895 ?auto_243896 ?auto_243897 ?auto_243898 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_243905 - BLOCK
      ?auto_243906 - BLOCK
      ?auto_243907 - BLOCK
      ?auto_243908 - BLOCK
      ?auto_243909 - BLOCK
    )
    :vars
    (
      ?auto_243910 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_243909 ?auto_243910 ) ( not ( = ?auto_243905 ?auto_243906 ) ) ( not ( = ?auto_243905 ?auto_243907 ) ) ( not ( = ?auto_243905 ?auto_243908 ) ) ( not ( = ?auto_243905 ?auto_243909 ) ) ( not ( = ?auto_243905 ?auto_243910 ) ) ( not ( = ?auto_243906 ?auto_243907 ) ) ( not ( = ?auto_243906 ?auto_243908 ) ) ( not ( = ?auto_243906 ?auto_243909 ) ) ( not ( = ?auto_243906 ?auto_243910 ) ) ( not ( = ?auto_243907 ?auto_243908 ) ) ( not ( = ?auto_243907 ?auto_243909 ) ) ( not ( = ?auto_243907 ?auto_243910 ) ) ( not ( = ?auto_243908 ?auto_243909 ) ) ( not ( = ?auto_243908 ?auto_243910 ) ) ( not ( = ?auto_243909 ?auto_243910 ) ) ( ON ?auto_243908 ?auto_243909 ) ( ON ?auto_243907 ?auto_243908 ) ( ON ?auto_243906 ?auto_243907 ) ( ON ?auto_243905 ?auto_243906 ) ( CLEAR ?auto_243905 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_243905 )
      ( MAKE-5PILE ?auto_243905 ?auto_243906 ?auto_243907 ?auto_243908 ?auto_243909 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_243916 - BLOCK
      ?auto_243917 - BLOCK
      ?auto_243918 - BLOCK
      ?auto_243919 - BLOCK
      ?auto_243920 - BLOCK
    )
    :vars
    (
      ?auto_243921 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_243920 ?auto_243921 ) ( not ( = ?auto_243916 ?auto_243917 ) ) ( not ( = ?auto_243916 ?auto_243918 ) ) ( not ( = ?auto_243916 ?auto_243919 ) ) ( not ( = ?auto_243916 ?auto_243920 ) ) ( not ( = ?auto_243916 ?auto_243921 ) ) ( not ( = ?auto_243917 ?auto_243918 ) ) ( not ( = ?auto_243917 ?auto_243919 ) ) ( not ( = ?auto_243917 ?auto_243920 ) ) ( not ( = ?auto_243917 ?auto_243921 ) ) ( not ( = ?auto_243918 ?auto_243919 ) ) ( not ( = ?auto_243918 ?auto_243920 ) ) ( not ( = ?auto_243918 ?auto_243921 ) ) ( not ( = ?auto_243919 ?auto_243920 ) ) ( not ( = ?auto_243919 ?auto_243921 ) ) ( not ( = ?auto_243920 ?auto_243921 ) ) ( ON ?auto_243919 ?auto_243920 ) ( ON ?auto_243918 ?auto_243919 ) ( ON ?auto_243917 ?auto_243918 ) ( ON ?auto_243916 ?auto_243917 ) ( CLEAR ?auto_243916 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_243916 )
      ( MAKE-5PILE ?auto_243916 ?auto_243917 ?auto_243918 ?auto_243919 ?auto_243920 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_243928 - BLOCK
      ?auto_243929 - BLOCK
      ?auto_243930 - BLOCK
      ?auto_243931 - BLOCK
      ?auto_243932 - BLOCK
      ?auto_243933 - BLOCK
    )
    :vars
    (
      ?auto_243934 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_243932 ) ( ON ?auto_243933 ?auto_243934 ) ( CLEAR ?auto_243933 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_243928 ) ( ON ?auto_243929 ?auto_243928 ) ( ON ?auto_243930 ?auto_243929 ) ( ON ?auto_243931 ?auto_243930 ) ( ON ?auto_243932 ?auto_243931 ) ( not ( = ?auto_243928 ?auto_243929 ) ) ( not ( = ?auto_243928 ?auto_243930 ) ) ( not ( = ?auto_243928 ?auto_243931 ) ) ( not ( = ?auto_243928 ?auto_243932 ) ) ( not ( = ?auto_243928 ?auto_243933 ) ) ( not ( = ?auto_243928 ?auto_243934 ) ) ( not ( = ?auto_243929 ?auto_243930 ) ) ( not ( = ?auto_243929 ?auto_243931 ) ) ( not ( = ?auto_243929 ?auto_243932 ) ) ( not ( = ?auto_243929 ?auto_243933 ) ) ( not ( = ?auto_243929 ?auto_243934 ) ) ( not ( = ?auto_243930 ?auto_243931 ) ) ( not ( = ?auto_243930 ?auto_243932 ) ) ( not ( = ?auto_243930 ?auto_243933 ) ) ( not ( = ?auto_243930 ?auto_243934 ) ) ( not ( = ?auto_243931 ?auto_243932 ) ) ( not ( = ?auto_243931 ?auto_243933 ) ) ( not ( = ?auto_243931 ?auto_243934 ) ) ( not ( = ?auto_243932 ?auto_243933 ) ) ( not ( = ?auto_243932 ?auto_243934 ) ) ( not ( = ?auto_243933 ?auto_243934 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_243933 ?auto_243934 )
      ( !STACK ?auto_243933 ?auto_243932 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_243941 - BLOCK
      ?auto_243942 - BLOCK
      ?auto_243943 - BLOCK
      ?auto_243944 - BLOCK
      ?auto_243945 - BLOCK
      ?auto_243946 - BLOCK
    )
    :vars
    (
      ?auto_243947 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_243945 ) ( ON ?auto_243946 ?auto_243947 ) ( CLEAR ?auto_243946 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_243941 ) ( ON ?auto_243942 ?auto_243941 ) ( ON ?auto_243943 ?auto_243942 ) ( ON ?auto_243944 ?auto_243943 ) ( ON ?auto_243945 ?auto_243944 ) ( not ( = ?auto_243941 ?auto_243942 ) ) ( not ( = ?auto_243941 ?auto_243943 ) ) ( not ( = ?auto_243941 ?auto_243944 ) ) ( not ( = ?auto_243941 ?auto_243945 ) ) ( not ( = ?auto_243941 ?auto_243946 ) ) ( not ( = ?auto_243941 ?auto_243947 ) ) ( not ( = ?auto_243942 ?auto_243943 ) ) ( not ( = ?auto_243942 ?auto_243944 ) ) ( not ( = ?auto_243942 ?auto_243945 ) ) ( not ( = ?auto_243942 ?auto_243946 ) ) ( not ( = ?auto_243942 ?auto_243947 ) ) ( not ( = ?auto_243943 ?auto_243944 ) ) ( not ( = ?auto_243943 ?auto_243945 ) ) ( not ( = ?auto_243943 ?auto_243946 ) ) ( not ( = ?auto_243943 ?auto_243947 ) ) ( not ( = ?auto_243944 ?auto_243945 ) ) ( not ( = ?auto_243944 ?auto_243946 ) ) ( not ( = ?auto_243944 ?auto_243947 ) ) ( not ( = ?auto_243945 ?auto_243946 ) ) ( not ( = ?auto_243945 ?auto_243947 ) ) ( not ( = ?auto_243946 ?auto_243947 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_243946 ?auto_243947 )
      ( !STACK ?auto_243946 ?auto_243945 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_243954 - BLOCK
      ?auto_243955 - BLOCK
      ?auto_243956 - BLOCK
      ?auto_243957 - BLOCK
      ?auto_243958 - BLOCK
      ?auto_243959 - BLOCK
    )
    :vars
    (
      ?auto_243960 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_243959 ?auto_243960 ) ( ON-TABLE ?auto_243954 ) ( ON ?auto_243955 ?auto_243954 ) ( ON ?auto_243956 ?auto_243955 ) ( ON ?auto_243957 ?auto_243956 ) ( not ( = ?auto_243954 ?auto_243955 ) ) ( not ( = ?auto_243954 ?auto_243956 ) ) ( not ( = ?auto_243954 ?auto_243957 ) ) ( not ( = ?auto_243954 ?auto_243958 ) ) ( not ( = ?auto_243954 ?auto_243959 ) ) ( not ( = ?auto_243954 ?auto_243960 ) ) ( not ( = ?auto_243955 ?auto_243956 ) ) ( not ( = ?auto_243955 ?auto_243957 ) ) ( not ( = ?auto_243955 ?auto_243958 ) ) ( not ( = ?auto_243955 ?auto_243959 ) ) ( not ( = ?auto_243955 ?auto_243960 ) ) ( not ( = ?auto_243956 ?auto_243957 ) ) ( not ( = ?auto_243956 ?auto_243958 ) ) ( not ( = ?auto_243956 ?auto_243959 ) ) ( not ( = ?auto_243956 ?auto_243960 ) ) ( not ( = ?auto_243957 ?auto_243958 ) ) ( not ( = ?auto_243957 ?auto_243959 ) ) ( not ( = ?auto_243957 ?auto_243960 ) ) ( not ( = ?auto_243958 ?auto_243959 ) ) ( not ( = ?auto_243958 ?auto_243960 ) ) ( not ( = ?auto_243959 ?auto_243960 ) ) ( CLEAR ?auto_243957 ) ( ON ?auto_243958 ?auto_243959 ) ( CLEAR ?auto_243958 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_243954 ?auto_243955 ?auto_243956 ?auto_243957 ?auto_243958 )
      ( MAKE-6PILE ?auto_243954 ?auto_243955 ?auto_243956 ?auto_243957 ?auto_243958 ?auto_243959 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_243967 - BLOCK
      ?auto_243968 - BLOCK
      ?auto_243969 - BLOCK
      ?auto_243970 - BLOCK
      ?auto_243971 - BLOCK
      ?auto_243972 - BLOCK
    )
    :vars
    (
      ?auto_243973 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_243972 ?auto_243973 ) ( ON-TABLE ?auto_243967 ) ( ON ?auto_243968 ?auto_243967 ) ( ON ?auto_243969 ?auto_243968 ) ( ON ?auto_243970 ?auto_243969 ) ( not ( = ?auto_243967 ?auto_243968 ) ) ( not ( = ?auto_243967 ?auto_243969 ) ) ( not ( = ?auto_243967 ?auto_243970 ) ) ( not ( = ?auto_243967 ?auto_243971 ) ) ( not ( = ?auto_243967 ?auto_243972 ) ) ( not ( = ?auto_243967 ?auto_243973 ) ) ( not ( = ?auto_243968 ?auto_243969 ) ) ( not ( = ?auto_243968 ?auto_243970 ) ) ( not ( = ?auto_243968 ?auto_243971 ) ) ( not ( = ?auto_243968 ?auto_243972 ) ) ( not ( = ?auto_243968 ?auto_243973 ) ) ( not ( = ?auto_243969 ?auto_243970 ) ) ( not ( = ?auto_243969 ?auto_243971 ) ) ( not ( = ?auto_243969 ?auto_243972 ) ) ( not ( = ?auto_243969 ?auto_243973 ) ) ( not ( = ?auto_243970 ?auto_243971 ) ) ( not ( = ?auto_243970 ?auto_243972 ) ) ( not ( = ?auto_243970 ?auto_243973 ) ) ( not ( = ?auto_243971 ?auto_243972 ) ) ( not ( = ?auto_243971 ?auto_243973 ) ) ( not ( = ?auto_243972 ?auto_243973 ) ) ( CLEAR ?auto_243970 ) ( ON ?auto_243971 ?auto_243972 ) ( CLEAR ?auto_243971 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_243967 ?auto_243968 ?auto_243969 ?auto_243970 ?auto_243971 )
      ( MAKE-6PILE ?auto_243967 ?auto_243968 ?auto_243969 ?auto_243970 ?auto_243971 ?auto_243972 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_243980 - BLOCK
      ?auto_243981 - BLOCK
      ?auto_243982 - BLOCK
      ?auto_243983 - BLOCK
      ?auto_243984 - BLOCK
      ?auto_243985 - BLOCK
    )
    :vars
    (
      ?auto_243986 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_243985 ?auto_243986 ) ( ON-TABLE ?auto_243980 ) ( ON ?auto_243981 ?auto_243980 ) ( ON ?auto_243982 ?auto_243981 ) ( not ( = ?auto_243980 ?auto_243981 ) ) ( not ( = ?auto_243980 ?auto_243982 ) ) ( not ( = ?auto_243980 ?auto_243983 ) ) ( not ( = ?auto_243980 ?auto_243984 ) ) ( not ( = ?auto_243980 ?auto_243985 ) ) ( not ( = ?auto_243980 ?auto_243986 ) ) ( not ( = ?auto_243981 ?auto_243982 ) ) ( not ( = ?auto_243981 ?auto_243983 ) ) ( not ( = ?auto_243981 ?auto_243984 ) ) ( not ( = ?auto_243981 ?auto_243985 ) ) ( not ( = ?auto_243981 ?auto_243986 ) ) ( not ( = ?auto_243982 ?auto_243983 ) ) ( not ( = ?auto_243982 ?auto_243984 ) ) ( not ( = ?auto_243982 ?auto_243985 ) ) ( not ( = ?auto_243982 ?auto_243986 ) ) ( not ( = ?auto_243983 ?auto_243984 ) ) ( not ( = ?auto_243983 ?auto_243985 ) ) ( not ( = ?auto_243983 ?auto_243986 ) ) ( not ( = ?auto_243984 ?auto_243985 ) ) ( not ( = ?auto_243984 ?auto_243986 ) ) ( not ( = ?auto_243985 ?auto_243986 ) ) ( ON ?auto_243984 ?auto_243985 ) ( CLEAR ?auto_243982 ) ( ON ?auto_243983 ?auto_243984 ) ( CLEAR ?auto_243983 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_243980 ?auto_243981 ?auto_243982 ?auto_243983 )
      ( MAKE-6PILE ?auto_243980 ?auto_243981 ?auto_243982 ?auto_243983 ?auto_243984 ?auto_243985 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_243993 - BLOCK
      ?auto_243994 - BLOCK
      ?auto_243995 - BLOCK
      ?auto_243996 - BLOCK
      ?auto_243997 - BLOCK
      ?auto_243998 - BLOCK
    )
    :vars
    (
      ?auto_243999 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_243998 ?auto_243999 ) ( ON-TABLE ?auto_243993 ) ( ON ?auto_243994 ?auto_243993 ) ( ON ?auto_243995 ?auto_243994 ) ( not ( = ?auto_243993 ?auto_243994 ) ) ( not ( = ?auto_243993 ?auto_243995 ) ) ( not ( = ?auto_243993 ?auto_243996 ) ) ( not ( = ?auto_243993 ?auto_243997 ) ) ( not ( = ?auto_243993 ?auto_243998 ) ) ( not ( = ?auto_243993 ?auto_243999 ) ) ( not ( = ?auto_243994 ?auto_243995 ) ) ( not ( = ?auto_243994 ?auto_243996 ) ) ( not ( = ?auto_243994 ?auto_243997 ) ) ( not ( = ?auto_243994 ?auto_243998 ) ) ( not ( = ?auto_243994 ?auto_243999 ) ) ( not ( = ?auto_243995 ?auto_243996 ) ) ( not ( = ?auto_243995 ?auto_243997 ) ) ( not ( = ?auto_243995 ?auto_243998 ) ) ( not ( = ?auto_243995 ?auto_243999 ) ) ( not ( = ?auto_243996 ?auto_243997 ) ) ( not ( = ?auto_243996 ?auto_243998 ) ) ( not ( = ?auto_243996 ?auto_243999 ) ) ( not ( = ?auto_243997 ?auto_243998 ) ) ( not ( = ?auto_243997 ?auto_243999 ) ) ( not ( = ?auto_243998 ?auto_243999 ) ) ( ON ?auto_243997 ?auto_243998 ) ( CLEAR ?auto_243995 ) ( ON ?auto_243996 ?auto_243997 ) ( CLEAR ?auto_243996 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_243993 ?auto_243994 ?auto_243995 ?auto_243996 )
      ( MAKE-6PILE ?auto_243993 ?auto_243994 ?auto_243995 ?auto_243996 ?auto_243997 ?auto_243998 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_244006 - BLOCK
      ?auto_244007 - BLOCK
      ?auto_244008 - BLOCK
      ?auto_244009 - BLOCK
      ?auto_244010 - BLOCK
      ?auto_244011 - BLOCK
    )
    :vars
    (
      ?auto_244012 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_244011 ?auto_244012 ) ( ON-TABLE ?auto_244006 ) ( ON ?auto_244007 ?auto_244006 ) ( not ( = ?auto_244006 ?auto_244007 ) ) ( not ( = ?auto_244006 ?auto_244008 ) ) ( not ( = ?auto_244006 ?auto_244009 ) ) ( not ( = ?auto_244006 ?auto_244010 ) ) ( not ( = ?auto_244006 ?auto_244011 ) ) ( not ( = ?auto_244006 ?auto_244012 ) ) ( not ( = ?auto_244007 ?auto_244008 ) ) ( not ( = ?auto_244007 ?auto_244009 ) ) ( not ( = ?auto_244007 ?auto_244010 ) ) ( not ( = ?auto_244007 ?auto_244011 ) ) ( not ( = ?auto_244007 ?auto_244012 ) ) ( not ( = ?auto_244008 ?auto_244009 ) ) ( not ( = ?auto_244008 ?auto_244010 ) ) ( not ( = ?auto_244008 ?auto_244011 ) ) ( not ( = ?auto_244008 ?auto_244012 ) ) ( not ( = ?auto_244009 ?auto_244010 ) ) ( not ( = ?auto_244009 ?auto_244011 ) ) ( not ( = ?auto_244009 ?auto_244012 ) ) ( not ( = ?auto_244010 ?auto_244011 ) ) ( not ( = ?auto_244010 ?auto_244012 ) ) ( not ( = ?auto_244011 ?auto_244012 ) ) ( ON ?auto_244010 ?auto_244011 ) ( ON ?auto_244009 ?auto_244010 ) ( CLEAR ?auto_244007 ) ( ON ?auto_244008 ?auto_244009 ) ( CLEAR ?auto_244008 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_244006 ?auto_244007 ?auto_244008 )
      ( MAKE-6PILE ?auto_244006 ?auto_244007 ?auto_244008 ?auto_244009 ?auto_244010 ?auto_244011 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_244019 - BLOCK
      ?auto_244020 - BLOCK
      ?auto_244021 - BLOCK
      ?auto_244022 - BLOCK
      ?auto_244023 - BLOCK
      ?auto_244024 - BLOCK
    )
    :vars
    (
      ?auto_244025 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_244024 ?auto_244025 ) ( ON-TABLE ?auto_244019 ) ( ON ?auto_244020 ?auto_244019 ) ( not ( = ?auto_244019 ?auto_244020 ) ) ( not ( = ?auto_244019 ?auto_244021 ) ) ( not ( = ?auto_244019 ?auto_244022 ) ) ( not ( = ?auto_244019 ?auto_244023 ) ) ( not ( = ?auto_244019 ?auto_244024 ) ) ( not ( = ?auto_244019 ?auto_244025 ) ) ( not ( = ?auto_244020 ?auto_244021 ) ) ( not ( = ?auto_244020 ?auto_244022 ) ) ( not ( = ?auto_244020 ?auto_244023 ) ) ( not ( = ?auto_244020 ?auto_244024 ) ) ( not ( = ?auto_244020 ?auto_244025 ) ) ( not ( = ?auto_244021 ?auto_244022 ) ) ( not ( = ?auto_244021 ?auto_244023 ) ) ( not ( = ?auto_244021 ?auto_244024 ) ) ( not ( = ?auto_244021 ?auto_244025 ) ) ( not ( = ?auto_244022 ?auto_244023 ) ) ( not ( = ?auto_244022 ?auto_244024 ) ) ( not ( = ?auto_244022 ?auto_244025 ) ) ( not ( = ?auto_244023 ?auto_244024 ) ) ( not ( = ?auto_244023 ?auto_244025 ) ) ( not ( = ?auto_244024 ?auto_244025 ) ) ( ON ?auto_244023 ?auto_244024 ) ( ON ?auto_244022 ?auto_244023 ) ( CLEAR ?auto_244020 ) ( ON ?auto_244021 ?auto_244022 ) ( CLEAR ?auto_244021 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_244019 ?auto_244020 ?auto_244021 )
      ( MAKE-6PILE ?auto_244019 ?auto_244020 ?auto_244021 ?auto_244022 ?auto_244023 ?auto_244024 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_244032 - BLOCK
      ?auto_244033 - BLOCK
      ?auto_244034 - BLOCK
      ?auto_244035 - BLOCK
      ?auto_244036 - BLOCK
      ?auto_244037 - BLOCK
    )
    :vars
    (
      ?auto_244038 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_244037 ?auto_244038 ) ( ON-TABLE ?auto_244032 ) ( not ( = ?auto_244032 ?auto_244033 ) ) ( not ( = ?auto_244032 ?auto_244034 ) ) ( not ( = ?auto_244032 ?auto_244035 ) ) ( not ( = ?auto_244032 ?auto_244036 ) ) ( not ( = ?auto_244032 ?auto_244037 ) ) ( not ( = ?auto_244032 ?auto_244038 ) ) ( not ( = ?auto_244033 ?auto_244034 ) ) ( not ( = ?auto_244033 ?auto_244035 ) ) ( not ( = ?auto_244033 ?auto_244036 ) ) ( not ( = ?auto_244033 ?auto_244037 ) ) ( not ( = ?auto_244033 ?auto_244038 ) ) ( not ( = ?auto_244034 ?auto_244035 ) ) ( not ( = ?auto_244034 ?auto_244036 ) ) ( not ( = ?auto_244034 ?auto_244037 ) ) ( not ( = ?auto_244034 ?auto_244038 ) ) ( not ( = ?auto_244035 ?auto_244036 ) ) ( not ( = ?auto_244035 ?auto_244037 ) ) ( not ( = ?auto_244035 ?auto_244038 ) ) ( not ( = ?auto_244036 ?auto_244037 ) ) ( not ( = ?auto_244036 ?auto_244038 ) ) ( not ( = ?auto_244037 ?auto_244038 ) ) ( ON ?auto_244036 ?auto_244037 ) ( ON ?auto_244035 ?auto_244036 ) ( ON ?auto_244034 ?auto_244035 ) ( CLEAR ?auto_244032 ) ( ON ?auto_244033 ?auto_244034 ) ( CLEAR ?auto_244033 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_244032 ?auto_244033 )
      ( MAKE-6PILE ?auto_244032 ?auto_244033 ?auto_244034 ?auto_244035 ?auto_244036 ?auto_244037 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_244045 - BLOCK
      ?auto_244046 - BLOCK
      ?auto_244047 - BLOCK
      ?auto_244048 - BLOCK
      ?auto_244049 - BLOCK
      ?auto_244050 - BLOCK
    )
    :vars
    (
      ?auto_244051 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_244050 ?auto_244051 ) ( ON-TABLE ?auto_244045 ) ( not ( = ?auto_244045 ?auto_244046 ) ) ( not ( = ?auto_244045 ?auto_244047 ) ) ( not ( = ?auto_244045 ?auto_244048 ) ) ( not ( = ?auto_244045 ?auto_244049 ) ) ( not ( = ?auto_244045 ?auto_244050 ) ) ( not ( = ?auto_244045 ?auto_244051 ) ) ( not ( = ?auto_244046 ?auto_244047 ) ) ( not ( = ?auto_244046 ?auto_244048 ) ) ( not ( = ?auto_244046 ?auto_244049 ) ) ( not ( = ?auto_244046 ?auto_244050 ) ) ( not ( = ?auto_244046 ?auto_244051 ) ) ( not ( = ?auto_244047 ?auto_244048 ) ) ( not ( = ?auto_244047 ?auto_244049 ) ) ( not ( = ?auto_244047 ?auto_244050 ) ) ( not ( = ?auto_244047 ?auto_244051 ) ) ( not ( = ?auto_244048 ?auto_244049 ) ) ( not ( = ?auto_244048 ?auto_244050 ) ) ( not ( = ?auto_244048 ?auto_244051 ) ) ( not ( = ?auto_244049 ?auto_244050 ) ) ( not ( = ?auto_244049 ?auto_244051 ) ) ( not ( = ?auto_244050 ?auto_244051 ) ) ( ON ?auto_244049 ?auto_244050 ) ( ON ?auto_244048 ?auto_244049 ) ( ON ?auto_244047 ?auto_244048 ) ( CLEAR ?auto_244045 ) ( ON ?auto_244046 ?auto_244047 ) ( CLEAR ?auto_244046 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_244045 ?auto_244046 )
      ( MAKE-6PILE ?auto_244045 ?auto_244046 ?auto_244047 ?auto_244048 ?auto_244049 ?auto_244050 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_244058 - BLOCK
      ?auto_244059 - BLOCK
      ?auto_244060 - BLOCK
      ?auto_244061 - BLOCK
      ?auto_244062 - BLOCK
      ?auto_244063 - BLOCK
    )
    :vars
    (
      ?auto_244064 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_244063 ?auto_244064 ) ( not ( = ?auto_244058 ?auto_244059 ) ) ( not ( = ?auto_244058 ?auto_244060 ) ) ( not ( = ?auto_244058 ?auto_244061 ) ) ( not ( = ?auto_244058 ?auto_244062 ) ) ( not ( = ?auto_244058 ?auto_244063 ) ) ( not ( = ?auto_244058 ?auto_244064 ) ) ( not ( = ?auto_244059 ?auto_244060 ) ) ( not ( = ?auto_244059 ?auto_244061 ) ) ( not ( = ?auto_244059 ?auto_244062 ) ) ( not ( = ?auto_244059 ?auto_244063 ) ) ( not ( = ?auto_244059 ?auto_244064 ) ) ( not ( = ?auto_244060 ?auto_244061 ) ) ( not ( = ?auto_244060 ?auto_244062 ) ) ( not ( = ?auto_244060 ?auto_244063 ) ) ( not ( = ?auto_244060 ?auto_244064 ) ) ( not ( = ?auto_244061 ?auto_244062 ) ) ( not ( = ?auto_244061 ?auto_244063 ) ) ( not ( = ?auto_244061 ?auto_244064 ) ) ( not ( = ?auto_244062 ?auto_244063 ) ) ( not ( = ?auto_244062 ?auto_244064 ) ) ( not ( = ?auto_244063 ?auto_244064 ) ) ( ON ?auto_244062 ?auto_244063 ) ( ON ?auto_244061 ?auto_244062 ) ( ON ?auto_244060 ?auto_244061 ) ( ON ?auto_244059 ?auto_244060 ) ( ON ?auto_244058 ?auto_244059 ) ( CLEAR ?auto_244058 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_244058 )
      ( MAKE-6PILE ?auto_244058 ?auto_244059 ?auto_244060 ?auto_244061 ?auto_244062 ?auto_244063 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_244071 - BLOCK
      ?auto_244072 - BLOCK
      ?auto_244073 - BLOCK
      ?auto_244074 - BLOCK
      ?auto_244075 - BLOCK
      ?auto_244076 - BLOCK
    )
    :vars
    (
      ?auto_244077 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_244076 ?auto_244077 ) ( not ( = ?auto_244071 ?auto_244072 ) ) ( not ( = ?auto_244071 ?auto_244073 ) ) ( not ( = ?auto_244071 ?auto_244074 ) ) ( not ( = ?auto_244071 ?auto_244075 ) ) ( not ( = ?auto_244071 ?auto_244076 ) ) ( not ( = ?auto_244071 ?auto_244077 ) ) ( not ( = ?auto_244072 ?auto_244073 ) ) ( not ( = ?auto_244072 ?auto_244074 ) ) ( not ( = ?auto_244072 ?auto_244075 ) ) ( not ( = ?auto_244072 ?auto_244076 ) ) ( not ( = ?auto_244072 ?auto_244077 ) ) ( not ( = ?auto_244073 ?auto_244074 ) ) ( not ( = ?auto_244073 ?auto_244075 ) ) ( not ( = ?auto_244073 ?auto_244076 ) ) ( not ( = ?auto_244073 ?auto_244077 ) ) ( not ( = ?auto_244074 ?auto_244075 ) ) ( not ( = ?auto_244074 ?auto_244076 ) ) ( not ( = ?auto_244074 ?auto_244077 ) ) ( not ( = ?auto_244075 ?auto_244076 ) ) ( not ( = ?auto_244075 ?auto_244077 ) ) ( not ( = ?auto_244076 ?auto_244077 ) ) ( ON ?auto_244075 ?auto_244076 ) ( ON ?auto_244074 ?auto_244075 ) ( ON ?auto_244073 ?auto_244074 ) ( ON ?auto_244072 ?auto_244073 ) ( ON ?auto_244071 ?auto_244072 ) ( CLEAR ?auto_244071 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_244071 )
      ( MAKE-6PILE ?auto_244071 ?auto_244072 ?auto_244073 ?auto_244074 ?auto_244075 ?auto_244076 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_244085 - BLOCK
      ?auto_244086 - BLOCK
      ?auto_244087 - BLOCK
      ?auto_244088 - BLOCK
      ?auto_244089 - BLOCK
      ?auto_244090 - BLOCK
      ?auto_244091 - BLOCK
    )
    :vars
    (
      ?auto_244092 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_244090 ) ( ON ?auto_244091 ?auto_244092 ) ( CLEAR ?auto_244091 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_244085 ) ( ON ?auto_244086 ?auto_244085 ) ( ON ?auto_244087 ?auto_244086 ) ( ON ?auto_244088 ?auto_244087 ) ( ON ?auto_244089 ?auto_244088 ) ( ON ?auto_244090 ?auto_244089 ) ( not ( = ?auto_244085 ?auto_244086 ) ) ( not ( = ?auto_244085 ?auto_244087 ) ) ( not ( = ?auto_244085 ?auto_244088 ) ) ( not ( = ?auto_244085 ?auto_244089 ) ) ( not ( = ?auto_244085 ?auto_244090 ) ) ( not ( = ?auto_244085 ?auto_244091 ) ) ( not ( = ?auto_244085 ?auto_244092 ) ) ( not ( = ?auto_244086 ?auto_244087 ) ) ( not ( = ?auto_244086 ?auto_244088 ) ) ( not ( = ?auto_244086 ?auto_244089 ) ) ( not ( = ?auto_244086 ?auto_244090 ) ) ( not ( = ?auto_244086 ?auto_244091 ) ) ( not ( = ?auto_244086 ?auto_244092 ) ) ( not ( = ?auto_244087 ?auto_244088 ) ) ( not ( = ?auto_244087 ?auto_244089 ) ) ( not ( = ?auto_244087 ?auto_244090 ) ) ( not ( = ?auto_244087 ?auto_244091 ) ) ( not ( = ?auto_244087 ?auto_244092 ) ) ( not ( = ?auto_244088 ?auto_244089 ) ) ( not ( = ?auto_244088 ?auto_244090 ) ) ( not ( = ?auto_244088 ?auto_244091 ) ) ( not ( = ?auto_244088 ?auto_244092 ) ) ( not ( = ?auto_244089 ?auto_244090 ) ) ( not ( = ?auto_244089 ?auto_244091 ) ) ( not ( = ?auto_244089 ?auto_244092 ) ) ( not ( = ?auto_244090 ?auto_244091 ) ) ( not ( = ?auto_244090 ?auto_244092 ) ) ( not ( = ?auto_244091 ?auto_244092 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_244091 ?auto_244092 )
      ( !STACK ?auto_244091 ?auto_244090 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_244100 - BLOCK
      ?auto_244101 - BLOCK
      ?auto_244102 - BLOCK
      ?auto_244103 - BLOCK
      ?auto_244104 - BLOCK
      ?auto_244105 - BLOCK
      ?auto_244106 - BLOCK
    )
    :vars
    (
      ?auto_244107 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_244105 ) ( ON ?auto_244106 ?auto_244107 ) ( CLEAR ?auto_244106 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_244100 ) ( ON ?auto_244101 ?auto_244100 ) ( ON ?auto_244102 ?auto_244101 ) ( ON ?auto_244103 ?auto_244102 ) ( ON ?auto_244104 ?auto_244103 ) ( ON ?auto_244105 ?auto_244104 ) ( not ( = ?auto_244100 ?auto_244101 ) ) ( not ( = ?auto_244100 ?auto_244102 ) ) ( not ( = ?auto_244100 ?auto_244103 ) ) ( not ( = ?auto_244100 ?auto_244104 ) ) ( not ( = ?auto_244100 ?auto_244105 ) ) ( not ( = ?auto_244100 ?auto_244106 ) ) ( not ( = ?auto_244100 ?auto_244107 ) ) ( not ( = ?auto_244101 ?auto_244102 ) ) ( not ( = ?auto_244101 ?auto_244103 ) ) ( not ( = ?auto_244101 ?auto_244104 ) ) ( not ( = ?auto_244101 ?auto_244105 ) ) ( not ( = ?auto_244101 ?auto_244106 ) ) ( not ( = ?auto_244101 ?auto_244107 ) ) ( not ( = ?auto_244102 ?auto_244103 ) ) ( not ( = ?auto_244102 ?auto_244104 ) ) ( not ( = ?auto_244102 ?auto_244105 ) ) ( not ( = ?auto_244102 ?auto_244106 ) ) ( not ( = ?auto_244102 ?auto_244107 ) ) ( not ( = ?auto_244103 ?auto_244104 ) ) ( not ( = ?auto_244103 ?auto_244105 ) ) ( not ( = ?auto_244103 ?auto_244106 ) ) ( not ( = ?auto_244103 ?auto_244107 ) ) ( not ( = ?auto_244104 ?auto_244105 ) ) ( not ( = ?auto_244104 ?auto_244106 ) ) ( not ( = ?auto_244104 ?auto_244107 ) ) ( not ( = ?auto_244105 ?auto_244106 ) ) ( not ( = ?auto_244105 ?auto_244107 ) ) ( not ( = ?auto_244106 ?auto_244107 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_244106 ?auto_244107 )
      ( !STACK ?auto_244106 ?auto_244105 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_244115 - BLOCK
      ?auto_244116 - BLOCK
      ?auto_244117 - BLOCK
      ?auto_244118 - BLOCK
      ?auto_244119 - BLOCK
      ?auto_244120 - BLOCK
      ?auto_244121 - BLOCK
    )
    :vars
    (
      ?auto_244122 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_244121 ?auto_244122 ) ( ON-TABLE ?auto_244115 ) ( ON ?auto_244116 ?auto_244115 ) ( ON ?auto_244117 ?auto_244116 ) ( ON ?auto_244118 ?auto_244117 ) ( ON ?auto_244119 ?auto_244118 ) ( not ( = ?auto_244115 ?auto_244116 ) ) ( not ( = ?auto_244115 ?auto_244117 ) ) ( not ( = ?auto_244115 ?auto_244118 ) ) ( not ( = ?auto_244115 ?auto_244119 ) ) ( not ( = ?auto_244115 ?auto_244120 ) ) ( not ( = ?auto_244115 ?auto_244121 ) ) ( not ( = ?auto_244115 ?auto_244122 ) ) ( not ( = ?auto_244116 ?auto_244117 ) ) ( not ( = ?auto_244116 ?auto_244118 ) ) ( not ( = ?auto_244116 ?auto_244119 ) ) ( not ( = ?auto_244116 ?auto_244120 ) ) ( not ( = ?auto_244116 ?auto_244121 ) ) ( not ( = ?auto_244116 ?auto_244122 ) ) ( not ( = ?auto_244117 ?auto_244118 ) ) ( not ( = ?auto_244117 ?auto_244119 ) ) ( not ( = ?auto_244117 ?auto_244120 ) ) ( not ( = ?auto_244117 ?auto_244121 ) ) ( not ( = ?auto_244117 ?auto_244122 ) ) ( not ( = ?auto_244118 ?auto_244119 ) ) ( not ( = ?auto_244118 ?auto_244120 ) ) ( not ( = ?auto_244118 ?auto_244121 ) ) ( not ( = ?auto_244118 ?auto_244122 ) ) ( not ( = ?auto_244119 ?auto_244120 ) ) ( not ( = ?auto_244119 ?auto_244121 ) ) ( not ( = ?auto_244119 ?auto_244122 ) ) ( not ( = ?auto_244120 ?auto_244121 ) ) ( not ( = ?auto_244120 ?auto_244122 ) ) ( not ( = ?auto_244121 ?auto_244122 ) ) ( CLEAR ?auto_244119 ) ( ON ?auto_244120 ?auto_244121 ) ( CLEAR ?auto_244120 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_244115 ?auto_244116 ?auto_244117 ?auto_244118 ?auto_244119 ?auto_244120 )
      ( MAKE-7PILE ?auto_244115 ?auto_244116 ?auto_244117 ?auto_244118 ?auto_244119 ?auto_244120 ?auto_244121 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_244130 - BLOCK
      ?auto_244131 - BLOCK
      ?auto_244132 - BLOCK
      ?auto_244133 - BLOCK
      ?auto_244134 - BLOCK
      ?auto_244135 - BLOCK
      ?auto_244136 - BLOCK
    )
    :vars
    (
      ?auto_244137 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_244136 ?auto_244137 ) ( ON-TABLE ?auto_244130 ) ( ON ?auto_244131 ?auto_244130 ) ( ON ?auto_244132 ?auto_244131 ) ( ON ?auto_244133 ?auto_244132 ) ( ON ?auto_244134 ?auto_244133 ) ( not ( = ?auto_244130 ?auto_244131 ) ) ( not ( = ?auto_244130 ?auto_244132 ) ) ( not ( = ?auto_244130 ?auto_244133 ) ) ( not ( = ?auto_244130 ?auto_244134 ) ) ( not ( = ?auto_244130 ?auto_244135 ) ) ( not ( = ?auto_244130 ?auto_244136 ) ) ( not ( = ?auto_244130 ?auto_244137 ) ) ( not ( = ?auto_244131 ?auto_244132 ) ) ( not ( = ?auto_244131 ?auto_244133 ) ) ( not ( = ?auto_244131 ?auto_244134 ) ) ( not ( = ?auto_244131 ?auto_244135 ) ) ( not ( = ?auto_244131 ?auto_244136 ) ) ( not ( = ?auto_244131 ?auto_244137 ) ) ( not ( = ?auto_244132 ?auto_244133 ) ) ( not ( = ?auto_244132 ?auto_244134 ) ) ( not ( = ?auto_244132 ?auto_244135 ) ) ( not ( = ?auto_244132 ?auto_244136 ) ) ( not ( = ?auto_244132 ?auto_244137 ) ) ( not ( = ?auto_244133 ?auto_244134 ) ) ( not ( = ?auto_244133 ?auto_244135 ) ) ( not ( = ?auto_244133 ?auto_244136 ) ) ( not ( = ?auto_244133 ?auto_244137 ) ) ( not ( = ?auto_244134 ?auto_244135 ) ) ( not ( = ?auto_244134 ?auto_244136 ) ) ( not ( = ?auto_244134 ?auto_244137 ) ) ( not ( = ?auto_244135 ?auto_244136 ) ) ( not ( = ?auto_244135 ?auto_244137 ) ) ( not ( = ?auto_244136 ?auto_244137 ) ) ( CLEAR ?auto_244134 ) ( ON ?auto_244135 ?auto_244136 ) ( CLEAR ?auto_244135 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_244130 ?auto_244131 ?auto_244132 ?auto_244133 ?auto_244134 ?auto_244135 )
      ( MAKE-7PILE ?auto_244130 ?auto_244131 ?auto_244132 ?auto_244133 ?auto_244134 ?auto_244135 ?auto_244136 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_244145 - BLOCK
      ?auto_244146 - BLOCK
      ?auto_244147 - BLOCK
      ?auto_244148 - BLOCK
      ?auto_244149 - BLOCK
      ?auto_244150 - BLOCK
      ?auto_244151 - BLOCK
    )
    :vars
    (
      ?auto_244152 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_244151 ?auto_244152 ) ( ON-TABLE ?auto_244145 ) ( ON ?auto_244146 ?auto_244145 ) ( ON ?auto_244147 ?auto_244146 ) ( ON ?auto_244148 ?auto_244147 ) ( not ( = ?auto_244145 ?auto_244146 ) ) ( not ( = ?auto_244145 ?auto_244147 ) ) ( not ( = ?auto_244145 ?auto_244148 ) ) ( not ( = ?auto_244145 ?auto_244149 ) ) ( not ( = ?auto_244145 ?auto_244150 ) ) ( not ( = ?auto_244145 ?auto_244151 ) ) ( not ( = ?auto_244145 ?auto_244152 ) ) ( not ( = ?auto_244146 ?auto_244147 ) ) ( not ( = ?auto_244146 ?auto_244148 ) ) ( not ( = ?auto_244146 ?auto_244149 ) ) ( not ( = ?auto_244146 ?auto_244150 ) ) ( not ( = ?auto_244146 ?auto_244151 ) ) ( not ( = ?auto_244146 ?auto_244152 ) ) ( not ( = ?auto_244147 ?auto_244148 ) ) ( not ( = ?auto_244147 ?auto_244149 ) ) ( not ( = ?auto_244147 ?auto_244150 ) ) ( not ( = ?auto_244147 ?auto_244151 ) ) ( not ( = ?auto_244147 ?auto_244152 ) ) ( not ( = ?auto_244148 ?auto_244149 ) ) ( not ( = ?auto_244148 ?auto_244150 ) ) ( not ( = ?auto_244148 ?auto_244151 ) ) ( not ( = ?auto_244148 ?auto_244152 ) ) ( not ( = ?auto_244149 ?auto_244150 ) ) ( not ( = ?auto_244149 ?auto_244151 ) ) ( not ( = ?auto_244149 ?auto_244152 ) ) ( not ( = ?auto_244150 ?auto_244151 ) ) ( not ( = ?auto_244150 ?auto_244152 ) ) ( not ( = ?auto_244151 ?auto_244152 ) ) ( ON ?auto_244150 ?auto_244151 ) ( CLEAR ?auto_244148 ) ( ON ?auto_244149 ?auto_244150 ) ( CLEAR ?auto_244149 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_244145 ?auto_244146 ?auto_244147 ?auto_244148 ?auto_244149 )
      ( MAKE-7PILE ?auto_244145 ?auto_244146 ?auto_244147 ?auto_244148 ?auto_244149 ?auto_244150 ?auto_244151 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_244160 - BLOCK
      ?auto_244161 - BLOCK
      ?auto_244162 - BLOCK
      ?auto_244163 - BLOCK
      ?auto_244164 - BLOCK
      ?auto_244165 - BLOCK
      ?auto_244166 - BLOCK
    )
    :vars
    (
      ?auto_244167 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_244166 ?auto_244167 ) ( ON-TABLE ?auto_244160 ) ( ON ?auto_244161 ?auto_244160 ) ( ON ?auto_244162 ?auto_244161 ) ( ON ?auto_244163 ?auto_244162 ) ( not ( = ?auto_244160 ?auto_244161 ) ) ( not ( = ?auto_244160 ?auto_244162 ) ) ( not ( = ?auto_244160 ?auto_244163 ) ) ( not ( = ?auto_244160 ?auto_244164 ) ) ( not ( = ?auto_244160 ?auto_244165 ) ) ( not ( = ?auto_244160 ?auto_244166 ) ) ( not ( = ?auto_244160 ?auto_244167 ) ) ( not ( = ?auto_244161 ?auto_244162 ) ) ( not ( = ?auto_244161 ?auto_244163 ) ) ( not ( = ?auto_244161 ?auto_244164 ) ) ( not ( = ?auto_244161 ?auto_244165 ) ) ( not ( = ?auto_244161 ?auto_244166 ) ) ( not ( = ?auto_244161 ?auto_244167 ) ) ( not ( = ?auto_244162 ?auto_244163 ) ) ( not ( = ?auto_244162 ?auto_244164 ) ) ( not ( = ?auto_244162 ?auto_244165 ) ) ( not ( = ?auto_244162 ?auto_244166 ) ) ( not ( = ?auto_244162 ?auto_244167 ) ) ( not ( = ?auto_244163 ?auto_244164 ) ) ( not ( = ?auto_244163 ?auto_244165 ) ) ( not ( = ?auto_244163 ?auto_244166 ) ) ( not ( = ?auto_244163 ?auto_244167 ) ) ( not ( = ?auto_244164 ?auto_244165 ) ) ( not ( = ?auto_244164 ?auto_244166 ) ) ( not ( = ?auto_244164 ?auto_244167 ) ) ( not ( = ?auto_244165 ?auto_244166 ) ) ( not ( = ?auto_244165 ?auto_244167 ) ) ( not ( = ?auto_244166 ?auto_244167 ) ) ( ON ?auto_244165 ?auto_244166 ) ( CLEAR ?auto_244163 ) ( ON ?auto_244164 ?auto_244165 ) ( CLEAR ?auto_244164 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_244160 ?auto_244161 ?auto_244162 ?auto_244163 ?auto_244164 )
      ( MAKE-7PILE ?auto_244160 ?auto_244161 ?auto_244162 ?auto_244163 ?auto_244164 ?auto_244165 ?auto_244166 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_244175 - BLOCK
      ?auto_244176 - BLOCK
      ?auto_244177 - BLOCK
      ?auto_244178 - BLOCK
      ?auto_244179 - BLOCK
      ?auto_244180 - BLOCK
      ?auto_244181 - BLOCK
    )
    :vars
    (
      ?auto_244182 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_244181 ?auto_244182 ) ( ON-TABLE ?auto_244175 ) ( ON ?auto_244176 ?auto_244175 ) ( ON ?auto_244177 ?auto_244176 ) ( not ( = ?auto_244175 ?auto_244176 ) ) ( not ( = ?auto_244175 ?auto_244177 ) ) ( not ( = ?auto_244175 ?auto_244178 ) ) ( not ( = ?auto_244175 ?auto_244179 ) ) ( not ( = ?auto_244175 ?auto_244180 ) ) ( not ( = ?auto_244175 ?auto_244181 ) ) ( not ( = ?auto_244175 ?auto_244182 ) ) ( not ( = ?auto_244176 ?auto_244177 ) ) ( not ( = ?auto_244176 ?auto_244178 ) ) ( not ( = ?auto_244176 ?auto_244179 ) ) ( not ( = ?auto_244176 ?auto_244180 ) ) ( not ( = ?auto_244176 ?auto_244181 ) ) ( not ( = ?auto_244176 ?auto_244182 ) ) ( not ( = ?auto_244177 ?auto_244178 ) ) ( not ( = ?auto_244177 ?auto_244179 ) ) ( not ( = ?auto_244177 ?auto_244180 ) ) ( not ( = ?auto_244177 ?auto_244181 ) ) ( not ( = ?auto_244177 ?auto_244182 ) ) ( not ( = ?auto_244178 ?auto_244179 ) ) ( not ( = ?auto_244178 ?auto_244180 ) ) ( not ( = ?auto_244178 ?auto_244181 ) ) ( not ( = ?auto_244178 ?auto_244182 ) ) ( not ( = ?auto_244179 ?auto_244180 ) ) ( not ( = ?auto_244179 ?auto_244181 ) ) ( not ( = ?auto_244179 ?auto_244182 ) ) ( not ( = ?auto_244180 ?auto_244181 ) ) ( not ( = ?auto_244180 ?auto_244182 ) ) ( not ( = ?auto_244181 ?auto_244182 ) ) ( ON ?auto_244180 ?auto_244181 ) ( ON ?auto_244179 ?auto_244180 ) ( CLEAR ?auto_244177 ) ( ON ?auto_244178 ?auto_244179 ) ( CLEAR ?auto_244178 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_244175 ?auto_244176 ?auto_244177 ?auto_244178 )
      ( MAKE-7PILE ?auto_244175 ?auto_244176 ?auto_244177 ?auto_244178 ?auto_244179 ?auto_244180 ?auto_244181 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_244190 - BLOCK
      ?auto_244191 - BLOCK
      ?auto_244192 - BLOCK
      ?auto_244193 - BLOCK
      ?auto_244194 - BLOCK
      ?auto_244195 - BLOCK
      ?auto_244196 - BLOCK
    )
    :vars
    (
      ?auto_244197 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_244196 ?auto_244197 ) ( ON-TABLE ?auto_244190 ) ( ON ?auto_244191 ?auto_244190 ) ( ON ?auto_244192 ?auto_244191 ) ( not ( = ?auto_244190 ?auto_244191 ) ) ( not ( = ?auto_244190 ?auto_244192 ) ) ( not ( = ?auto_244190 ?auto_244193 ) ) ( not ( = ?auto_244190 ?auto_244194 ) ) ( not ( = ?auto_244190 ?auto_244195 ) ) ( not ( = ?auto_244190 ?auto_244196 ) ) ( not ( = ?auto_244190 ?auto_244197 ) ) ( not ( = ?auto_244191 ?auto_244192 ) ) ( not ( = ?auto_244191 ?auto_244193 ) ) ( not ( = ?auto_244191 ?auto_244194 ) ) ( not ( = ?auto_244191 ?auto_244195 ) ) ( not ( = ?auto_244191 ?auto_244196 ) ) ( not ( = ?auto_244191 ?auto_244197 ) ) ( not ( = ?auto_244192 ?auto_244193 ) ) ( not ( = ?auto_244192 ?auto_244194 ) ) ( not ( = ?auto_244192 ?auto_244195 ) ) ( not ( = ?auto_244192 ?auto_244196 ) ) ( not ( = ?auto_244192 ?auto_244197 ) ) ( not ( = ?auto_244193 ?auto_244194 ) ) ( not ( = ?auto_244193 ?auto_244195 ) ) ( not ( = ?auto_244193 ?auto_244196 ) ) ( not ( = ?auto_244193 ?auto_244197 ) ) ( not ( = ?auto_244194 ?auto_244195 ) ) ( not ( = ?auto_244194 ?auto_244196 ) ) ( not ( = ?auto_244194 ?auto_244197 ) ) ( not ( = ?auto_244195 ?auto_244196 ) ) ( not ( = ?auto_244195 ?auto_244197 ) ) ( not ( = ?auto_244196 ?auto_244197 ) ) ( ON ?auto_244195 ?auto_244196 ) ( ON ?auto_244194 ?auto_244195 ) ( CLEAR ?auto_244192 ) ( ON ?auto_244193 ?auto_244194 ) ( CLEAR ?auto_244193 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_244190 ?auto_244191 ?auto_244192 ?auto_244193 )
      ( MAKE-7PILE ?auto_244190 ?auto_244191 ?auto_244192 ?auto_244193 ?auto_244194 ?auto_244195 ?auto_244196 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_244205 - BLOCK
      ?auto_244206 - BLOCK
      ?auto_244207 - BLOCK
      ?auto_244208 - BLOCK
      ?auto_244209 - BLOCK
      ?auto_244210 - BLOCK
      ?auto_244211 - BLOCK
    )
    :vars
    (
      ?auto_244212 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_244211 ?auto_244212 ) ( ON-TABLE ?auto_244205 ) ( ON ?auto_244206 ?auto_244205 ) ( not ( = ?auto_244205 ?auto_244206 ) ) ( not ( = ?auto_244205 ?auto_244207 ) ) ( not ( = ?auto_244205 ?auto_244208 ) ) ( not ( = ?auto_244205 ?auto_244209 ) ) ( not ( = ?auto_244205 ?auto_244210 ) ) ( not ( = ?auto_244205 ?auto_244211 ) ) ( not ( = ?auto_244205 ?auto_244212 ) ) ( not ( = ?auto_244206 ?auto_244207 ) ) ( not ( = ?auto_244206 ?auto_244208 ) ) ( not ( = ?auto_244206 ?auto_244209 ) ) ( not ( = ?auto_244206 ?auto_244210 ) ) ( not ( = ?auto_244206 ?auto_244211 ) ) ( not ( = ?auto_244206 ?auto_244212 ) ) ( not ( = ?auto_244207 ?auto_244208 ) ) ( not ( = ?auto_244207 ?auto_244209 ) ) ( not ( = ?auto_244207 ?auto_244210 ) ) ( not ( = ?auto_244207 ?auto_244211 ) ) ( not ( = ?auto_244207 ?auto_244212 ) ) ( not ( = ?auto_244208 ?auto_244209 ) ) ( not ( = ?auto_244208 ?auto_244210 ) ) ( not ( = ?auto_244208 ?auto_244211 ) ) ( not ( = ?auto_244208 ?auto_244212 ) ) ( not ( = ?auto_244209 ?auto_244210 ) ) ( not ( = ?auto_244209 ?auto_244211 ) ) ( not ( = ?auto_244209 ?auto_244212 ) ) ( not ( = ?auto_244210 ?auto_244211 ) ) ( not ( = ?auto_244210 ?auto_244212 ) ) ( not ( = ?auto_244211 ?auto_244212 ) ) ( ON ?auto_244210 ?auto_244211 ) ( ON ?auto_244209 ?auto_244210 ) ( ON ?auto_244208 ?auto_244209 ) ( CLEAR ?auto_244206 ) ( ON ?auto_244207 ?auto_244208 ) ( CLEAR ?auto_244207 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_244205 ?auto_244206 ?auto_244207 )
      ( MAKE-7PILE ?auto_244205 ?auto_244206 ?auto_244207 ?auto_244208 ?auto_244209 ?auto_244210 ?auto_244211 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_244220 - BLOCK
      ?auto_244221 - BLOCK
      ?auto_244222 - BLOCK
      ?auto_244223 - BLOCK
      ?auto_244224 - BLOCK
      ?auto_244225 - BLOCK
      ?auto_244226 - BLOCK
    )
    :vars
    (
      ?auto_244227 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_244226 ?auto_244227 ) ( ON-TABLE ?auto_244220 ) ( ON ?auto_244221 ?auto_244220 ) ( not ( = ?auto_244220 ?auto_244221 ) ) ( not ( = ?auto_244220 ?auto_244222 ) ) ( not ( = ?auto_244220 ?auto_244223 ) ) ( not ( = ?auto_244220 ?auto_244224 ) ) ( not ( = ?auto_244220 ?auto_244225 ) ) ( not ( = ?auto_244220 ?auto_244226 ) ) ( not ( = ?auto_244220 ?auto_244227 ) ) ( not ( = ?auto_244221 ?auto_244222 ) ) ( not ( = ?auto_244221 ?auto_244223 ) ) ( not ( = ?auto_244221 ?auto_244224 ) ) ( not ( = ?auto_244221 ?auto_244225 ) ) ( not ( = ?auto_244221 ?auto_244226 ) ) ( not ( = ?auto_244221 ?auto_244227 ) ) ( not ( = ?auto_244222 ?auto_244223 ) ) ( not ( = ?auto_244222 ?auto_244224 ) ) ( not ( = ?auto_244222 ?auto_244225 ) ) ( not ( = ?auto_244222 ?auto_244226 ) ) ( not ( = ?auto_244222 ?auto_244227 ) ) ( not ( = ?auto_244223 ?auto_244224 ) ) ( not ( = ?auto_244223 ?auto_244225 ) ) ( not ( = ?auto_244223 ?auto_244226 ) ) ( not ( = ?auto_244223 ?auto_244227 ) ) ( not ( = ?auto_244224 ?auto_244225 ) ) ( not ( = ?auto_244224 ?auto_244226 ) ) ( not ( = ?auto_244224 ?auto_244227 ) ) ( not ( = ?auto_244225 ?auto_244226 ) ) ( not ( = ?auto_244225 ?auto_244227 ) ) ( not ( = ?auto_244226 ?auto_244227 ) ) ( ON ?auto_244225 ?auto_244226 ) ( ON ?auto_244224 ?auto_244225 ) ( ON ?auto_244223 ?auto_244224 ) ( CLEAR ?auto_244221 ) ( ON ?auto_244222 ?auto_244223 ) ( CLEAR ?auto_244222 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_244220 ?auto_244221 ?auto_244222 )
      ( MAKE-7PILE ?auto_244220 ?auto_244221 ?auto_244222 ?auto_244223 ?auto_244224 ?auto_244225 ?auto_244226 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_244235 - BLOCK
      ?auto_244236 - BLOCK
      ?auto_244237 - BLOCK
      ?auto_244238 - BLOCK
      ?auto_244239 - BLOCK
      ?auto_244240 - BLOCK
      ?auto_244241 - BLOCK
    )
    :vars
    (
      ?auto_244242 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_244241 ?auto_244242 ) ( ON-TABLE ?auto_244235 ) ( not ( = ?auto_244235 ?auto_244236 ) ) ( not ( = ?auto_244235 ?auto_244237 ) ) ( not ( = ?auto_244235 ?auto_244238 ) ) ( not ( = ?auto_244235 ?auto_244239 ) ) ( not ( = ?auto_244235 ?auto_244240 ) ) ( not ( = ?auto_244235 ?auto_244241 ) ) ( not ( = ?auto_244235 ?auto_244242 ) ) ( not ( = ?auto_244236 ?auto_244237 ) ) ( not ( = ?auto_244236 ?auto_244238 ) ) ( not ( = ?auto_244236 ?auto_244239 ) ) ( not ( = ?auto_244236 ?auto_244240 ) ) ( not ( = ?auto_244236 ?auto_244241 ) ) ( not ( = ?auto_244236 ?auto_244242 ) ) ( not ( = ?auto_244237 ?auto_244238 ) ) ( not ( = ?auto_244237 ?auto_244239 ) ) ( not ( = ?auto_244237 ?auto_244240 ) ) ( not ( = ?auto_244237 ?auto_244241 ) ) ( not ( = ?auto_244237 ?auto_244242 ) ) ( not ( = ?auto_244238 ?auto_244239 ) ) ( not ( = ?auto_244238 ?auto_244240 ) ) ( not ( = ?auto_244238 ?auto_244241 ) ) ( not ( = ?auto_244238 ?auto_244242 ) ) ( not ( = ?auto_244239 ?auto_244240 ) ) ( not ( = ?auto_244239 ?auto_244241 ) ) ( not ( = ?auto_244239 ?auto_244242 ) ) ( not ( = ?auto_244240 ?auto_244241 ) ) ( not ( = ?auto_244240 ?auto_244242 ) ) ( not ( = ?auto_244241 ?auto_244242 ) ) ( ON ?auto_244240 ?auto_244241 ) ( ON ?auto_244239 ?auto_244240 ) ( ON ?auto_244238 ?auto_244239 ) ( ON ?auto_244237 ?auto_244238 ) ( CLEAR ?auto_244235 ) ( ON ?auto_244236 ?auto_244237 ) ( CLEAR ?auto_244236 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_244235 ?auto_244236 )
      ( MAKE-7PILE ?auto_244235 ?auto_244236 ?auto_244237 ?auto_244238 ?auto_244239 ?auto_244240 ?auto_244241 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_244250 - BLOCK
      ?auto_244251 - BLOCK
      ?auto_244252 - BLOCK
      ?auto_244253 - BLOCK
      ?auto_244254 - BLOCK
      ?auto_244255 - BLOCK
      ?auto_244256 - BLOCK
    )
    :vars
    (
      ?auto_244257 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_244256 ?auto_244257 ) ( ON-TABLE ?auto_244250 ) ( not ( = ?auto_244250 ?auto_244251 ) ) ( not ( = ?auto_244250 ?auto_244252 ) ) ( not ( = ?auto_244250 ?auto_244253 ) ) ( not ( = ?auto_244250 ?auto_244254 ) ) ( not ( = ?auto_244250 ?auto_244255 ) ) ( not ( = ?auto_244250 ?auto_244256 ) ) ( not ( = ?auto_244250 ?auto_244257 ) ) ( not ( = ?auto_244251 ?auto_244252 ) ) ( not ( = ?auto_244251 ?auto_244253 ) ) ( not ( = ?auto_244251 ?auto_244254 ) ) ( not ( = ?auto_244251 ?auto_244255 ) ) ( not ( = ?auto_244251 ?auto_244256 ) ) ( not ( = ?auto_244251 ?auto_244257 ) ) ( not ( = ?auto_244252 ?auto_244253 ) ) ( not ( = ?auto_244252 ?auto_244254 ) ) ( not ( = ?auto_244252 ?auto_244255 ) ) ( not ( = ?auto_244252 ?auto_244256 ) ) ( not ( = ?auto_244252 ?auto_244257 ) ) ( not ( = ?auto_244253 ?auto_244254 ) ) ( not ( = ?auto_244253 ?auto_244255 ) ) ( not ( = ?auto_244253 ?auto_244256 ) ) ( not ( = ?auto_244253 ?auto_244257 ) ) ( not ( = ?auto_244254 ?auto_244255 ) ) ( not ( = ?auto_244254 ?auto_244256 ) ) ( not ( = ?auto_244254 ?auto_244257 ) ) ( not ( = ?auto_244255 ?auto_244256 ) ) ( not ( = ?auto_244255 ?auto_244257 ) ) ( not ( = ?auto_244256 ?auto_244257 ) ) ( ON ?auto_244255 ?auto_244256 ) ( ON ?auto_244254 ?auto_244255 ) ( ON ?auto_244253 ?auto_244254 ) ( ON ?auto_244252 ?auto_244253 ) ( CLEAR ?auto_244250 ) ( ON ?auto_244251 ?auto_244252 ) ( CLEAR ?auto_244251 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_244250 ?auto_244251 )
      ( MAKE-7PILE ?auto_244250 ?auto_244251 ?auto_244252 ?auto_244253 ?auto_244254 ?auto_244255 ?auto_244256 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_244265 - BLOCK
      ?auto_244266 - BLOCK
      ?auto_244267 - BLOCK
      ?auto_244268 - BLOCK
      ?auto_244269 - BLOCK
      ?auto_244270 - BLOCK
      ?auto_244271 - BLOCK
    )
    :vars
    (
      ?auto_244272 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_244271 ?auto_244272 ) ( not ( = ?auto_244265 ?auto_244266 ) ) ( not ( = ?auto_244265 ?auto_244267 ) ) ( not ( = ?auto_244265 ?auto_244268 ) ) ( not ( = ?auto_244265 ?auto_244269 ) ) ( not ( = ?auto_244265 ?auto_244270 ) ) ( not ( = ?auto_244265 ?auto_244271 ) ) ( not ( = ?auto_244265 ?auto_244272 ) ) ( not ( = ?auto_244266 ?auto_244267 ) ) ( not ( = ?auto_244266 ?auto_244268 ) ) ( not ( = ?auto_244266 ?auto_244269 ) ) ( not ( = ?auto_244266 ?auto_244270 ) ) ( not ( = ?auto_244266 ?auto_244271 ) ) ( not ( = ?auto_244266 ?auto_244272 ) ) ( not ( = ?auto_244267 ?auto_244268 ) ) ( not ( = ?auto_244267 ?auto_244269 ) ) ( not ( = ?auto_244267 ?auto_244270 ) ) ( not ( = ?auto_244267 ?auto_244271 ) ) ( not ( = ?auto_244267 ?auto_244272 ) ) ( not ( = ?auto_244268 ?auto_244269 ) ) ( not ( = ?auto_244268 ?auto_244270 ) ) ( not ( = ?auto_244268 ?auto_244271 ) ) ( not ( = ?auto_244268 ?auto_244272 ) ) ( not ( = ?auto_244269 ?auto_244270 ) ) ( not ( = ?auto_244269 ?auto_244271 ) ) ( not ( = ?auto_244269 ?auto_244272 ) ) ( not ( = ?auto_244270 ?auto_244271 ) ) ( not ( = ?auto_244270 ?auto_244272 ) ) ( not ( = ?auto_244271 ?auto_244272 ) ) ( ON ?auto_244270 ?auto_244271 ) ( ON ?auto_244269 ?auto_244270 ) ( ON ?auto_244268 ?auto_244269 ) ( ON ?auto_244267 ?auto_244268 ) ( ON ?auto_244266 ?auto_244267 ) ( ON ?auto_244265 ?auto_244266 ) ( CLEAR ?auto_244265 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_244265 )
      ( MAKE-7PILE ?auto_244265 ?auto_244266 ?auto_244267 ?auto_244268 ?auto_244269 ?auto_244270 ?auto_244271 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_244280 - BLOCK
      ?auto_244281 - BLOCK
      ?auto_244282 - BLOCK
      ?auto_244283 - BLOCK
      ?auto_244284 - BLOCK
      ?auto_244285 - BLOCK
      ?auto_244286 - BLOCK
    )
    :vars
    (
      ?auto_244287 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_244286 ?auto_244287 ) ( not ( = ?auto_244280 ?auto_244281 ) ) ( not ( = ?auto_244280 ?auto_244282 ) ) ( not ( = ?auto_244280 ?auto_244283 ) ) ( not ( = ?auto_244280 ?auto_244284 ) ) ( not ( = ?auto_244280 ?auto_244285 ) ) ( not ( = ?auto_244280 ?auto_244286 ) ) ( not ( = ?auto_244280 ?auto_244287 ) ) ( not ( = ?auto_244281 ?auto_244282 ) ) ( not ( = ?auto_244281 ?auto_244283 ) ) ( not ( = ?auto_244281 ?auto_244284 ) ) ( not ( = ?auto_244281 ?auto_244285 ) ) ( not ( = ?auto_244281 ?auto_244286 ) ) ( not ( = ?auto_244281 ?auto_244287 ) ) ( not ( = ?auto_244282 ?auto_244283 ) ) ( not ( = ?auto_244282 ?auto_244284 ) ) ( not ( = ?auto_244282 ?auto_244285 ) ) ( not ( = ?auto_244282 ?auto_244286 ) ) ( not ( = ?auto_244282 ?auto_244287 ) ) ( not ( = ?auto_244283 ?auto_244284 ) ) ( not ( = ?auto_244283 ?auto_244285 ) ) ( not ( = ?auto_244283 ?auto_244286 ) ) ( not ( = ?auto_244283 ?auto_244287 ) ) ( not ( = ?auto_244284 ?auto_244285 ) ) ( not ( = ?auto_244284 ?auto_244286 ) ) ( not ( = ?auto_244284 ?auto_244287 ) ) ( not ( = ?auto_244285 ?auto_244286 ) ) ( not ( = ?auto_244285 ?auto_244287 ) ) ( not ( = ?auto_244286 ?auto_244287 ) ) ( ON ?auto_244285 ?auto_244286 ) ( ON ?auto_244284 ?auto_244285 ) ( ON ?auto_244283 ?auto_244284 ) ( ON ?auto_244282 ?auto_244283 ) ( ON ?auto_244281 ?auto_244282 ) ( ON ?auto_244280 ?auto_244281 ) ( CLEAR ?auto_244280 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_244280 )
      ( MAKE-7PILE ?auto_244280 ?auto_244281 ?auto_244282 ?auto_244283 ?auto_244284 ?auto_244285 ?auto_244286 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_244296 - BLOCK
      ?auto_244297 - BLOCK
      ?auto_244298 - BLOCK
      ?auto_244299 - BLOCK
      ?auto_244300 - BLOCK
      ?auto_244301 - BLOCK
      ?auto_244302 - BLOCK
      ?auto_244303 - BLOCK
    )
    :vars
    (
      ?auto_244304 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_244302 ) ( ON ?auto_244303 ?auto_244304 ) ( CLEAR ?auto_244303 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_244296 ) ( ON ?auto_244297 ?auto_244296 ) ( ON ?auto_244298 ?auto_244297 ) ( ON ?auto_244299 ?auto_244298 ) ( ON ?auto_244300 ?auto_244299 ) ( ON ?auto_244301 ?auto_244300 ) ( ON ?auto_244302 ?auto_244301 ) ( not ( = ?auto_244296 ?auto_244297 ) ) ( not ( = ?auto_244296 ?auto_244298 ) ) ( not ( = ?auto_244296 ?auto_244299 ) ) ( not ( = ?auto_244296 ?auto_244300 ) ) ( not ( = ?auto_244296 ?auto_244301 ) ) ( not ( = ?auto_244296 ?auto_244302 ) ) ( not ( = ?auto_244296 ?auto_244303 ) ) ( not ( = ?auto_244296 ?auto_244304 ) ) ( not ( = ?auto_244297 ?auto_244298 ) ) ( not ( = ?auto_244297 ?auto_244299 ) ) ( not ( = ?auto_244297 ?auto_244300 ) ) ( not ( = ?auto_244297 ?auto_244301 ) ) ( not ( = ?auto_244297 ?auto_244302 ) ) ( not ( = ?auto_244297 ?auto_244303 ) ) ( not ( = ?auto_244297 ?auto_244304 ) ) ( not ( = ?auto_244298 ?auto_244299 ) ) ( not ( = ?auto_244298 ?auto_244300 ) ) ( not ( = ?auto_244298 ?auto_244301 ) ) ( not ( = ?auto_244298 ?auto_244302 ) ) ( not ( = ?auto_244298 ?auto_244303 ) ) ( not ( = ?auto_244298 ?auto_244304 ) ) ( not ( = ?auto_244299 ?auto_244300 ) ) ( not ( = ?auto_244299 ?auto_244301 ) ) ( not ( = ?auto_244299 ?auto_244302 ) ) ( not ( = ?auto_244299 ?auto_244303 ) ) ( not ( = ?auto_244299 ?auto_244304 ) ) ( not ( = ?auto_244300 ?auto_244301 ) ) ( not ( = ?auto_244300 ?auto_244302 ) ) ( not ( = ?auto_244300 ?auto_244303 ) ) ( not ( = ?auto_244300 ?auto_244304 ) ) ( not ( = ?auto_244301 ?auto_244302 ) ) ( not ( = ?auto_244301 ?auto_244303 ) ) ( not ( = ?auto_244301 ?auto_244304 ) ) ( not ( = ?auto_244302 ?auto_244303 ) ) ( not ( = ?auto_244302 ?auto_244304 ) ) ( not ( = ?auto_244303 ?auto_244304 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_244303 ?auto_244304 )
      ( !STACK ?auto_244303 ?auto_244302 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_244313 - BLOCK
      ?auto_244314 - BLOCK
      ?auto_244315 - BLOCK
      ?auto_244316 - BLOCK
      ?auto_244317 - BLOCK
      ?auto_244318 - BLOCK
      ?auto_244319 - BLOCK
      ?auto_244320 - BLOCK
    )
    :vars
    (
      ?auto_244321 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_244319 ) ( ON ?auto_244320 ?auto_244321 ) ( CLEAR ?auto_244320 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_244313 ) ( ON ?auto_244314 ?auto_244313 ) ( ON ?auto_244315 ?auto_244314 ) ( ON ?auto_244316 ?auto_244315 ) ( ON ?auto_244317 ?auto_244316 ) ( ON ?auto_244318 ?auto_244317 ) ( ON ?auto_244319 ?auto_244318 ) ( not ( = ?auto_244313 ?auto_244314 ) ) ( not ( = ?auto_244313 ?auto_244315 ) ) ( not ( = ?auto_244313 ?auto_244316 ) ) ( not ( = ?auto_244313 ?auto_244317 ) ) ( not ( = ?auto_244313 ?auto_244318 ) ) ( not ( = ?auto_244313 ?auto_244319 ) ) ( not ( = ?auto_244313 ?auto_244320 ) ) ( not ( = ?auto_244313 ?auto_244321 ) ) ( not ( = ?auto_244314 ?auto_244315 ) ) ( not ( = ?auto_244314 ?auto_244316 ) ) ( not ( = ?auto_244314 ?auto_244317 ) ) ( not ( = ?auto_244314 ?auto_244318 ) ) ( not ( = ?auto_244314 ?auto_244319 ) ) ( not ( = ?auto_244314 ?auto_244320 ) ) ( not ( = ?auto_244314 ?auto_244321 ) ) ( not ( = ?auto_244315 ?auto_244316 ) ) ( not ( = ?auto_244315 ?auto_244317 ) ) ( not ( = ?auto_244315 ?auto_244318 ) ) ( not ( = ?auto_244315 ?auto_244319 ) ) ( not ( = ?auto_244315 ?auto_244320 ) ) ( not ( = ?auto_244315 ?auto_244321 ) ) ( not ( = ?auto_244316 ?auto_244317 ) ) ( not ( = ?auto_244316 ?auto_244318 ) ) ( not ( = ?auto_244316 ?auto_244319 ) ) ( not ( = ?auto_244316 ?auto_244320 ) ) ( not ( = ?auto_244316 ?auto_244321 ) ) ( not ( = ?auto_244317 ?auto_244318 ) ) ( not ( = ?auto_244317 ?auto_244319 ) ) ( not ( = ?auto_244317 ?auto_244320 ) ) ( not ( = ?auto_244317 ?auto_244321 ) ) ( not ( = ?auto_244318 ?auto_244319 ) ) ( not ( = ?auto_244318 ?auto_244320 ) ) ( not ( = ?auto_244318 ?auto_244321 ) ) ( not ( = ?auto_244319 ?auto_244320 ) ) ( not ( = ?auto_244319 ?auto_244321 ) ) ( not ( = ?auto_244320 ?auto_244321 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_244320 ?auto_244321 )
      ( !STACK ?auto_244320 ?auto_244319 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_244330 - BLOCK
      ?auto_244331 - BLOCK
      ?auto_244332 - BLOCK
      ?auto_244333 - BLOCK
      ?auto_244334 - BLOCK
      ?auto_244335 - BLOCK
      ?auto_244336 - BLOCK
      ?auto_244337 - BLOCK
    )
    :vars
    (
      ?auto_244338 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_244337 ?auto_244338 ) ( ON-TABLE ?auto_244330 ) ( ON ?auto_244331 ?auto_244330 ) ( ON ?auto_244332 ?auto_244331 ) ( ON ?auto_244333 ?auto_244332 ) ( ON ?auto_244334 ?auto_244333 ) ( ON ?auto_244335 ?auto_244334 ) ( not ( = ?auto_244330 ?auto_244331 ) ) ( not ( = ?auto_244330 ?auto_244332 ) ) ( not ( = ?auto_244330 ?auto_244333 ) ) ( not ( = ?auto_244330 ?auto_244334 ) ) ( not ( = ?auto_244330 ?auto_244335 ) ) ( not ( = ?auto_244330 ?auto_244336 ) ) ( not ( = ?auto_244330 ?auto_244337 ) ) ( not ( = ?auto_244330 ?auto_244338 ) ) ( not ( = ?auto_244331 ?auto_244332 ) ) ( not ( = ?auto_244331 ?auto_244333 ) ) ( not ( = ?auto_244331 ?auto_244334 ) ) ( not ( = ?auto_244331 ?auto_244335 ) ) ( not ( = ?auto_244331 ?auto_244336 ) ) ( not ( = ?auto_244331 ?auto_244337 ) ) ( not ( = ?auto_244331 ?auto_244338 ) ) ( not ( = ?auto_244332 ?auto_244333 ) ) ( not ( = ?auto_244332 ?auto_244334 ) ) ( not ( = ?auto_244332 ?auto_244335 ) ) ( not ( = ?auto_244332 ?auto_244336 ) ) ( not ( = ?auto_244332 ?auto_244337 ) ) ( not ( = ?auto_244332 ?auto_244338 ) ) ( not ( = ?auto_244333 ?auto_244334 ) ) ( not ( = ?auto_244333 ?auto_244335 ) ) ( not ( = ?auto_244333 ?auto_244336 ) ) ( not ( = ?auto_244333 ?auto_244337 ) ) ( not ( = ?auto_244333 ?auto_244338 ) ) ( not ( = ?auto_244334 ?auto_244335 ) ) ( not ( = ?auto_244334 ?auto_244336 ) ) ( not ( = ?auto_244334 ?auto_244337 ) ) ( not ( = ?auto_244334 ?auto_244338 ) ) ( not ( = ?auto_244335 ?auto_244336 ) ) ( not ( = ?auto_244335 ?auto_244337 ) ) ( not ( = ?auto_244335 ?auto_244338 ) ) ( not ( = ?auto_244336 ?auto_244337 ) ) ( not ( = ?auto_244336 ?auto_244338 ) ) ( not ( = ?auto_244337 ?auto_244338 ) ) ( CLEAR ?auto_244335 ) ( ON ?auto_244336 ?auto_244337 ) ( CLEAR ?auto_244336 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_244330 ?auto_244331 ?auto_244332 ?auto_244333 ?auto_244334 ?auto_244335 ?auto_244336 )
      ( MAKE-8PILE ?auto_244330 ?auto_244331 ?auto_244332 ?auto_244333 ?auto_244334 ?auto_244335 ?auto_244336 ?auto_244337 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_244347 - BLOCK
      ?auto_244348 - BLOCK
      ?auto_244349 - BLOCK
      ?auto_244350 - BLOCK
      ?auto_244351 - BLOCK
      ?auto_244352 - BLOCK
      ?auto_244353 - BLOCK
      ?auto_244354 - BLOCK
    )
    :vars
    (
      ?auto_244355 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_244354 ?auto_244355 ) ( ON-TABLE ?auto_244347 ) ( ON ?auto_244348 ?auto_244347 ) ( ON ?auto_244349 ?auto_244348 ) ( ON ?auto_244350 ?auto_244349 ) ( ON ?auto_244351 ?auto_244350 ) ( ON ?auto_244352 ?auto_244351 ) ( not ( = ?auto_244347 ?auto_244348 ) ) ( not ( = ?auto_244347 ?auto_244349 ) ) ( not ( = ?auto_244347 ?auto_244350 ) ) ( not ( = ?auto_244347 ?auto_244351 ) ) ( not ( = ?auto_244347 ?auto_244352 ) ) ( not ( = ?auto_244347 ?auto_244353 ) ) ( not ( = ?auto_244347 ?auto_244354 ) ) ( not ( = ?auto_244347 ?auto_244355 ) ) ( not ( = ?auto_244348 ?auto_244349 ) ) ( not ( = ?auto_244348 ?auto_244350 ) ) ( not ( = ?auto_244348 ?auto_244351 ) ) ( not ( = ?auto_244348 ?auto_244352 ) ) ( not ( = ?auto_244348 ?auto_244353 ) ) ( not ( = ?auto_244348 ?auto_244354 ) ) ( not ( = ?auto_244348 ?auto_244355 ) ) ( not ( = ?auto_244349 ?auto_244350 ) ) ( not ( = ?auto_244349 ?auto_244351 ) ) ( not ( = ?auto_244349 ?auto_244352 ) ) ( not ( = ?auto_244349 ?auto_244353 ) ) ( not ( = ?auto_244349 ?auto_244354 ) ) ( not ( = ?auto_244349 ?auto_244355 ) ) ( not ( = ?auto_244350 ?auto_244351 ) ) ( not ( = ?auto_244350 ?auto_244352 ) ) ( not ( = ?auto_244350 ?auto_244353 ) ) ( not ( = ?auto_244350 ?auto_244354 ) ) ( not ( = ?auto_244350 ?auto_244355 ) ) ( not ( = ?auto_244351 ?auto_244352 ) ) ( not ( = ?auto_244351 ?auto_244353 ) ) ( not ( = ?auto_244351 ?auto_244354 ) ) ( not ( = ?auto_244351 ?auto_244355 ) ) ( not ( = ?auto_244352 ?auto_244353 ) ) ( not ( = ?auto_244352 ?auto_244354 ) ) ( not ( = ?auto_244352 ?auto_244355 ) ) ( not ( = ?auto_244353 ?auto_244354 ) ) ( not ( = ?auto_244353 ?auto_244355 ) ) ( not ( = ?auto_244354 ?auto_244355 ) ) ( CLEAR ?auto_244352 ) ( ON ?auto_244353 ?auto_244354 ) ( CLEAR ?auto_244353 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_244347 ?auto_244348 ?auto_244349 ?auto_244350 ?auto_244351 ?auto_244352 ?auto_244353 )
      ( MAKE-8PILE ?auto_244347 ?auto_244348 ?auto_244349 ?auto_244350 ?auto_244351 ?auto_244352 ?auto_244353 ?auto_244354 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_244364 - BLOCK
      ?auto_244365 - BLOCK
      ?auto_244366 - BLOCK
      ?auto_244367 - BLOCK
      ?auto_244368 - BLOCK
      ?auto_244369 - BLOCK
      ?auto_244370 - BLOCK
      ?auto_244371 - BLOCK
    )
    :vars
    (
      ?auto_244372 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_244371 ?auto_244372 ) ( ON-TABLE ?auto_244364 ) ( ON ?auto_244365 ?auto_244364 ) ( ON ?auto_244366 ?auto_244365 ) ( ON ?auto_244367 ?auto_244366 ) ( ON ?auto_244368 ?auto_244367 ) ( not ( = ?auto_244364 ?auto_244365 ) ) ( not ( = ?auto_244364 ?auto_244366 ) ) ( not ( = ?auto_244364 ?auto_244367 ) ) ( not ( = ?auto_244364 ?auto_244368 ) ) ( not ( = ?auto_244364 ?auto_244369 ) ) ( not ( = ?auto_244364 ?auto_244370 ) ) ( not ( = ?auto_244364 ?auto_244371 ) ) ( not ( = ?auto_244364 ?auto_244372 ) ) ( not ( = ?auto_244365 ?auto_244366 ) ) ( not ( = ?auto_244365 ?auto_244367 ) ) ( not ( = ?auto_244365 ?auto_244368 ) ) ( not ( = ?auto_244365 ?auto_244369 ) ) ( not ( = ?auto_244365 ?auto_244370 ) ) ( not ( = ?auto_244365 ?auto_244371 ) ) ( not ( = ?auto_244365 ?auto_244372 ) ) ( not ( = ?auto_244366 ?auto_244367 ) ) ( not ( = ?auto_244366 ?auto_244368 ) ) ( not ( = ?auto_244366 ?auto_244369 ) ) ( not ( = ?auto_244366 ?auto_244370 ) ) ( not ( = ?auto_244366 ?auto_244371 ) ) ( not ( = ?auto_244366 ?auto_244372 ) ) ( not ( = ?auto_244367 ?auto_244368 ) ) ( not ( = ?auto_244367 ?auto_244369 ) ) ( not ( = ?auto_244367 ?auto_244370 ) ) ( not ( = ?auto_244367 ?auto_244371 ) ) ( not ( = ?auto_244367 ?auto_244372 ) ) ( not ( = ?auto_244368 ?auto_244369 ) ) ( not ( = ?auto_244368 ?auto_244370 ) ) ( not ( = ?auto_244368 ?auto_244371 ) ) ( not ( = ?auto_244368 ?auto_244372 ) ) ( not ( = ?auto_244369 ?auto_244370 ) ) ( not ( = ?auto_244369 ?auto_244371 ) ) ( not ( = ?auto_244369 ?auto_244372 ) ) ( not ( = ?auto_244370 ?auto_244371 ) ) ( not ( = ?auto_244370 ?auto_244372 ) ) ( not ( = ?auto_244371 ?auto_244372 ) ) ( ON ?auto_244370 ?auto_244371 ) ( CLEAR ?auto_244368 ) ( ON ?auto_244369 ?auto_244370 ) ( CLEAR ?auto_244369 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_244364 ?auto_244365 ?auto_244366 ?auto_244367 ?auto_244368 ?auto_244369 )
      ( MAKE-8PILE ?auto_244364 ?auto_244365 ?auto_244366 ?auto_244367 ?auto_244368 ?auto_244369 ?auto_244370 ?auto_244371 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_244381 - BLOCK
      ?auto_244382 - BLOCK
      ?auto_244383 - BLOCK
      ?auto_244384 - BLOCK
      ?auto_244385 - BLOCK
      ?auto_244386 - BLOCK
      ?auto_244387 - BLOCK
      ?auto_244388 - BLOCK
    )
    :vars
    (
      ?auto_244389 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_244388 ?auto_244389 ) ( ON-TABLE ?auto_244381 ) ( ON ?auto_244382 ?auto_244381 ) ( ON ?auto_244383 ?auto_244382 ) ( ON ?auto_244384 ?auto_244383 ) ( ON ?auto_244385 ?auto_244384 ) ( not ( = ?auto_244381 ?auto_244382 ) ) ( not ( = ?auto_244381 ?auto_244383 ) ) ( not ( = ?auto_244381 ?auto_244384 ) ) ( not ( = ?auto_244381 ?auto_244385 ) ) ( not ( = ?auto_244381 ?auto_244386 ) ) ( not ( = ?auto_244381 ?auto_244387 ) ) ( not ( = ?auto_244381 ?auto_244388 ) ) ( not ( = ?auto_244381 ?auto_244389 ) ) ( not ( = ?auto_244382 ?auto_244383 ) ) ( not ( = ?auto_244382 ?auto_244384 ) ) ( not ( = ?auto_244382 ?auto_244385 ) ) ( not ( = ?auto_244382 ?auto_244386 ) ) ( not ( = ?auto_244382 ?auto_244387 ) ) ( not ( = ?auto_244382 ?auto_244388 ) ) ( not ( = ?auto_244382 ?auto_244389 ) ) ( not ( = ?auto_244383 ?auto_244384 ) ) ( not ( = ?auto_244383 ?auto_244385 ) ) ( not ( = ?auto_244383 ?auto_244386 ) ) ( not ( = ?auto_244383 ?auto_244387 ) ) ( not ( = ?auto_244383 ?auto_244388 ) ) ( not ( = ?auto_244383 ?auto_244389 ) ) ( not ( = ?auto_244384 ?auto_244385 ) ) ( not ( = ?auto_244384 ?auto_244386 ) ) ( not ( = ?auto_244384 ?auto_244387 ) ) ( not ( = ?auto_244384 ?auto_244388 ) ) ( not ( = ?auto_244384 ?auto_244389 ) ) ( not ( = ?auto_244385 ?auto_244386 ) ) ( not ( = ?auto_244385 ?auto_244387 ) ) ( not ( = ?auto_244385 ?auto_244388 ) ) ( not ( = ?auto_244385 ?auto_244389 ) ) ( not ( = ?auto_244386 ?auto_244387 ) ) ( not ( = ?auto_244386 ?auto_244388 ) ) ( not ( = ?auto_244386 ?auto_244389 ) ) ( not ( = ?auto_244387 ?auto_244388 ) ) ( not ( = ?auto_244387 ?auto_244389 ) ) ( not ( = ?auto_244388 ?auto_244389 ) ) ( ON ?auto_244387 ?auto_244388 ) ( CLEAR ?auto_244385 ) ( ON ?auto_244386 ?auto_244387 ) ( CLEAR ?auto_244386 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_244381 ?auto_244382 ?auto_244383 ?auto_244384 ?auto_244385 ?auto_244386 )
      ( MAKE-8PILE ?auto_244381 ?auto_244382 ?auto_244383 ?auto_244384 ?auto_244385 ?auto_244386 ?auto_244387 ?auto_244388 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_244398 - BLOCK
      ?auto_244399 - BLOCK
      ?auto_244400 - BLOCK
      ?auto_244401 - BLOCK
      ?auto_244402 - BLOCK
      ?auto_244403 - BLOCK
      ?auto_244404 - BLOCK
      ?auto_244405 - BLOCK
    )
    :vars
    (
      ?auto_244406 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_244405 ?auto_244406 ) ( ON-TABLE ?auto_244398 ) ( ON ?auto_244399 ?auto_244398 ) ( ON ?auto_244400 ?auto_244399 ) ( ON ?auto_244401 ?auto_244400 ) ( not ( = ?auto_244398 ?auto_244399 ) ) ( not ( = ?auto_244398 ?auto_244400 ) ) ( not ( = ?auto_244398 ?auto_244401 ) ) ( not ( = ?auto_244398 ?auto_244402 ) ) ( not ( = ?auto_244398 ?auto_244403 ) ) ( not ( = ?auto_244398 ?auto_244404 ) ) ( not ( = ?auto_244398 ?auto_244405 ) ) ( not ( = ?auto_244398 ?auto_244406 ) ) ( not ( = ?auto_244399 ?auto_244400 ) ) ( not ( = ?auto_244399 ?auto_244401 ) ) ( not ( = ?auto_244399 ?auto_244402 ) ) ( not ( = ?auto_244399 ?auto_244403 ) ) ( not ( = ?auto_244399 ?auto_244404 ) ) ( not ( = ?auto_244399 ?auto_244405 ) ) ( not ( = ?auto_244399 ?auto_244406 ) ) ( not ( = ?auto_244400 ?auto_244401 ) ) ( not ( = ?auto_244400 ?auto_244402 ) ) ( not ( = ?auto_244400 ?auto_244403 ) ) ( not ( = ?auto_244400 ?auto_244404 ) ) ( not ( = ?auto_244400 ?auto_244405 ) ) ( not ( = ?auto_244400 ?auto_244406 ) ) ( not ( = ?auto_244401 ?auto_244402 ) ) ( not ( = ?auto_244401 ?auto_244403 ) ) ( not ( = ?auto_244401 ?auto_244404 ) ) ( not ( = ?auto_244401 ?auto_244405 ) ) ( not ( = ?auto_244401 ?auto_244406 ) ) ( not ( = ?auto_244402 ?auto_244403 ) ) ( not ( = ?auto_244402 ?auto_244404 ) ) ( not ( = ?auto_244402 ?auto_244405 ) ) ( not ( = ?auto_244402 ?auto_244406 ) ) ( not ( = ?auto_244403 ?auto_244404 ) ) ( not ( = ?auto_244403 ?auto_244405 ) ) ( not ( = ?auto_244403 ?auto_244406 ) ) ( not ( = ?auto_244404 ?auto_244405 ) ) ( not ( = ?auto_244404 ?auto_244406 ) ) ( not ( = ?auto_244405 ?auto_244406 ) ) ( ON ?auto_244404 ?auto_244405 ) ( ON ?auto_244403 ?auto_244404 ) ( CLEAR ?auto_244401 ) ( ON ?auto_244402 ?auto_244403 ) ( CLEAR ?auto_244402 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_244398 ?auto_244399 ?auto_244400 ?auto_244401 ?auto_244402 )
      ( MAKE-8PILE ?auto_244398 ?auto_244399 ?auto_244400 ?auto_244401 ?auto_244402 ?auto_244403 ?auto_244404 ?auto_244405 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_244415 - BLOCK
      ?auto_244416 - BLOCK
      ?auto_244417 - BLOCK
      ?auto_244418 - BLOCK
      ?auto_244419 - BLOCK
      ?auto_244420 - BLOCK
      ?auto_244421 - BLOCK
      ?auto_244422 - BLOCK
    )
    :vars
    (
      ?auto_244423 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_244422 ?auto_244423 ) ( ON-TABLE ?auto_244415 ) ( ON ?auto_244416 ?auto_244415 ) ( ON ?auto_244417 ?auto_244416 ) ( ON ?auto_244418 ?auto_244417 ) ( not ( = ?auto_244415 ?auto_244416 ) ) ( not ( = ?auto_244415 ?auto_244417 ) ) ( not ( = ?auto_244415 ?auto_244418 ) ) ( not ( = ?auto_244415 ?auto_244419 ) ) ( not ( = ?auto_244415 ?auto_244420 ) ) ( not ( = ?auto_244415 ?auto_244421 ) ) ( not ( = ?auto_244415 ?auto_244422 ) ) ( not ( = ?auto_244415 ?auto_244423 ) ) ( not ( = ?auto_244416 ?auto_244417 ) ) ( not ( = ?auto_244416 ?auto_244418 ) ) ( not ( = ?auto_244416 ?auto_244419 ) ) ( not ( = ?auto_244416 ?auto_244420 ) ) ( not ( = ?auto_244416 ?auto_244421 ) ) ( not ( = ?auto_244416 ?auto_244422 ) ) ( not ( = ?auto_244416 ?auto_244423 ) ) ( not ( = ?auto_244417 ?auto_244418 ) ) ( not ( = ?auto_244417 ?auto_244419 ) ) ( not ( = ?auto_244417 ?auto_244420 ) ) ( not ( = ?auto_244417 ?auto_244421 ) ) ( not ( = ?auto_244417 ?auto_244422 ) ) ( not ( = ?auto_244417 ?auto_244423 ) ) ( not ( = ?auto_244418 ?auto_244419 ) ) ( not ( = ?auto_244418 ?auto_244420 ) ) ( not ( = ?auto_244418 ?auto_244421 ) ) ( not ( = ?auto_244418 ?auto_244422 ) ) ( not ( = ?auto_244418 ?auto_244423 ) ) ( not ( = ?auto_244419 ?auto_244420 ) ) ( not ( = ?auto_244419 ?auto_244421 ) ) ( not ( = ?auto_244419 ?auto_244422 ) ) ( not ( = ?auto_244419 ?auto_244423 ) ) ( not ( = ?auto_244420 ?auto_244421 ) ) ( not ( = ?auto_244420 ?auto_244422 ) ) ( not ( = ?auto_244420 ?auto_244423 ) ) ( not ( = ?auto_244421 ?auto_244422 ) ) ( not ( = ?auto_244421 ?auto_244423 ) ) ( not ( = ?auto_244422 ?auto_244423 ) ) ( ON ?auto_244421 ?auto_244422 ) ( ON ?auto_244420 ?auto_244421 ) ( CLEAR ?auto_244418 ) ( ON ?auto_244419 ?auto_244420 ) ( CLEAR ?auto_244419 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_244415 ?auto_244416 ?auto_244417 ?auto_244418 ?auto_244419 )
      ( MAKE-8PILE ?auto_244415 ?auto_244416 ?auto_244417 ?auto_244418 ?auto_244419 ?auto_244420 ?auto_244421 ?auto_244422 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_244432 - BLOCK
      ?auto_244433 - BLOCK
      ?auto_244434 - BLOCK
      ?auto_244435 - BLOCK
      ?auto_244436 - BLOCK
      ?auto_244437 - BLOCK
      ?auto_244438 - BLOCK
      ?auto_244439 - BLOCK
    )
    :vars
    (
      ?auto_244440 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_244439 ?auto_244440 ) ( ON-TABLE ?auto_244432 ) ( ON ?auto_244433 ?auto_244432 ) ( ON ?auto_244434 ?auto_244433 ) ( not ( = ?auto_244432 ?auto_244433 ) ) ( not ( = ?auto_244432 ?auto_244434 ) ) ( not ( = ?auto_244432 ?auto_244435 ) ) ( not ( = ?auto_244432 ?auto_244436 ) ) ( not ( = ?auto_244432 ?auto_244437 ) ) ( not ( = ?auto_244432 ?auto_244438 ) ) ( not ( = ?auto_244432 ?auto_244439 ) ) ( not ( = ?auto_244432 ?auto_244440 ) ) ( not ( = ?auto_244433 ?auto_244434 ) ) ( not ( = ?auto_244433 ?auto_244435 ) ) ( not ( = ?auto_244433 ?auto_244436 ) ) ( not ( = ?auto_244433 ?auto_244437 ) ) ( not ( = ?auto_244433 ?auto_244438 ) ) ( not ( = ?auto_244433 ?auto_244439 ) ) ( not ( = ?auto_244433 ?auto_244440 ) ) ( not ( = ?auto_244434 ?auto_244435 ) ) ( not ( = ?auto_244434 ?auto_244436 ) ) ( not ( = ?auto_244434 ?auto_244437 ) ) ( not ( = ?auto_244434 ?auto_244438 ) ) ( not ( = ?auto_244434 ?auto_244439 ) ) ( not ( = ?auto_244434 ?auto_244440 ) ) ( not ( = ?auto_244435 ?auto_244436 ) ) ( not ( = ?auto_244435 ?auto_244437 ) ) ( not ( = ?auto_244435 ?auto_244438 ) ) ( not ( = ?auto_244435 ?auto_244439 ) ) ( not ( = ?auto_244435 ?auto_244440 ) ) ( not ( = ?auto_244436 ?auto_244437 ) ) ( not ( = ?auto_244436 ?auto_244438 ) ) ( not ( = ?auto_244436 ?auto_244439 ) ) ( not ( = ?auto_244436 ?auto_244440 ) ) ( not ( = ?auto_244437 ?auto_244438 ) ) ( not ( = ?auto_244437 ?auto_244439 ) ) ( not ( = ?auto_244437 ?auto_244440 ) ) ( not ( = ?auto_244438 ?auto_244439 ) ) ( not ( = ?auto_244438 ?auto_244440 ) ) ( not ( = ?auto_244439 ?auto_244440 ) ) ( ON ?auto_244438 ?auto_244439 ) ( ON ?auto_244437 ?auto_244438 ) ( ON ?auto_244436 ?auto_244437 ) ( CLEAR ?auto_244434 ) ( ON ?auto_244435 ?auto_244436 ) ( CLEAR ?auto_244435 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_244432 ?auto_244433 ?auto_244434 ?auto_244435 )
      ( MAKE-8PILE ?auto_244432 ?auto_244433 ?auto_244434 ?auto_244435 ?auto_244436 ?auto_244437 ?auto_244438 ?auto_244439 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_244449 - BLOCK
      ?auto_244450 - BLOCK
      ?auto_244451 - BLOCK
      ?auto_244452 - BLOCK
      ?auto_244453 - BLOCK
      ?auto_244454 - BLOCK
      ?auto_244455 - BLOCK
      ?auto_244456 - BLOCK
    )
    :vars
    (
      ?auto_244457 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_244456 ?auto_244457 ) ( ON-TABLE ?auto_244449 ) ( ON ?auto_244450 ?auto_244449 ) ( ON ?auto_244451 ?auto_244450 ) ( not ( = ?auto_244449 ?auto_244450 ) ) ( not ( = ?auto_244449 ?auto_244451 ) ) ( not ( = ?auto_244449 ?auto_244452 ) ) ( not ( = ?auto_244449 ?auto_244453 ) ) ( not ( = ?auto_244449 ?auto_244454 ) ) ( not ( = ?auto_244449 ?auto_244455 ) ) ( not ( = ?auto_244449 ?auto_244456 ) ) ( not ( = ?auto_244449 ?auto_244457 ) ) ( not ( = ?auto_244450 ?auto_244451 ) ) ( not ( = ?auto_244450 ?auto_244452 ) ) ( not ( = ?auto_244450 ?auto_244453 ) ) ( not ( = ?auto_244450 ?auto_244454 ) ) ( not ( = ?auto_244450 ?auto_244455 ) ) ( not ( = ?auto_244450 ?auto_244456 ) ) ( not ( = ?auto_244450 ?auto_244457 ) ) ( not ( = ?auto_244451 ?auto_244452 ) ) ( not ( = ?auto_244451 ?auto_244453 ) ) ( not ( = ?auto_244451 ?auto_244454 ) ) ( not ( = ?auto_244451 ?auto_244455 ) ) ( not ( = ?auto_244451 ?auto_244456 ) ) ( not ( = ?auto_244451 ?auto_244457 ) ) ( not ( = ?auto_244452 ?auto_244453 ) ) ( not ( = ?auto_244452 ?auto_244454 ) ) ( not ( = ?auto_244452 ?auto_244455 ) ) ( not ( = ?auto_244452 ?auto_244456 ) ) ( not ( = ?auto_244452 ?auto_244457 ) ) ( not ( = ?auto_244453 ?auto_244454 ) ) ( not ( = ?auto_244453 ?auto_244455 ) ) ( not ( = ?auto_244453 ?auto_244456 ) ) ( not ( = ?auto_244453 ?auto_244457 ) ) ( not ( = ?auto_244454 ?auto_244455 ) ) ( not ( = ?auto_244454 ?auto_244456 ) ) ( not ( = ?auto_244454 ?auto_244457 ) ) ( not ( = ?auto_244455 ?auto_244456 ) ) ( not ( = ?auto_244455 ?auto_244457 ) ) ( not ( = ?auto_244456 ?auto_244457 ) ) ( ON ?auto_244455 ?auto_244456 ) ( ON ?auto_244454 ?auto_244455 ) ( ON ?auto_244453 ?auto_244454 ) ( CLEAR ?auto_244451 ) ( ON ?auto_244452 ?auto_244453 ) ( CLEAR ?auto_244452 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_244449 ?auto_244450 ?auto_244451 ?auto_244452 )
      ( MAKE-8PILE ?auto_244449 ?auto_244450 ?auto_244451 ?auto_244452 ?auto_244453 ?auto_244454 ?auto_244455 ?auto_244456 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_244466 - BLOCK
      ?auto_244467 - BLOCK
      ?auto_244468 - BLOCK
      ?auto_244469 - BLOCK
      ?auto_244470 - BLOCK
      ?auto_244471 - BLOCK
      ?auto_244472 - BLOCK
      ?auto_244473 - BLOCK
    )
    :vars
    (
      ?auto_244474 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_244473 ?auto_244474 ) ( ON-TABLE ?auto_244466 ) ( ON ?auto_244467 ?auto_244466 ) ( not ( = ?auto_244466 ?auto_244467 ) ) ( not ( = ?auto_244466 ?auto_244468 ) ) ( not ( = ?auto_244466 ?auto_244469 ) ) ( not ( = ?auto_244466 ?auto_244470 ) ) ( not ( = ?auto_244466 ?auto_244471 ) ) ( not ( = ?auto_244466 ?auto_244472 ) ) ( not ( = ?auto_244466 ?auto_244473 ) ) ( not ( = ?auto_244466 ?auto_244474 ) ) ( not ( = ?auto_244467 ?auto_244468 ) ) ( not ( = ?auto_244467 ?auto_244469 ) ) ( not ( = ?auto_244467 ?auto_244470 ) ) ( not ( = ?auto_244467 ?auto_244471 ) ) ( not ( = ?auto_244467 ?auto_244472 ) ) ( not ( = ?auto_244467 ?auto_244473 ) ) ( not ( = ?auto_244467 ?auto_244474 ) ) ( not ( = ?auto_244468 ?auto_244469 ) ) ( not ( = ?auto_244468 ?auto_244470 ) ) ( not ( = ?auto_244468 ?auto_244471 ) ) ( not ( = ?auto_244468 ?auto_244472 ) ) ( not ( = ?auto_244468 ?auto_244473 ) ) ( not ( = ?auto_244468 ?auto_244474 ) ) ( not ( = ?auto_244469 ?auto_244470 ) ) ( not ( = ?auto_244469 ?auto_244471 ) ) ( not ( = ?auto_244469 ?auto_244472 ) ) ( not ( = ?auto_244469 ?auto_244473 ) ) ( not ( = ?auto_244469 ?auto_244474 ) ) ( not ( = ?auto_244470 ?auto_244471 ) ) ( not ( = ?auto_244470 ?auto_244472 ) ) ( not ( = ?auto_244470 ?auto_244473 ) ) ( not ( = ?auto_244470 ?auto_244474 ) ) ( not ( = ?auto_244471 ?auto_244472 ) ) ( not ( = ?auto_244471 ?auto_244473 ) ) ( not ( = ?auto_244471 ?auto_244474 ) ) ( not ( = ?auto_244472 ?auto_244473 ) ) ( not ( = ?auto_244472 ?auto_244474 ) ) ( not ( = ?auto_244473 ?auto_244474 ) ) ( ON ?auto_244472 ?auto_244473 ) ( ON ?auto_244471 ?auto_244472 ) ( ON ?auto_244470 ?auto_244471 ) ( ON ?auto_244469 ?auto_244470 ) ( CLEAR ?auto_244467 ) ( ON ?auto_244468 ?auto_244469 ) ( CLEAR ?auto_244468 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_244466 ?auto_244467 ?auto_244468 )
      ( MAKE-8PILE ?auto_244466 ?auto_244467 ?auto_244468 ?auto_244469 ?auto_244470 ?auto_244471 ?auto_244472 ?auto_244473 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_244483 - BLOCK
      ?auto_244484 - BLOCK
      ?auto_244485 - BLOCK
      ?auto_244486 - BLOCK
      ?auto_244487 - BLOCK
      ?auto_244488 - BLOCK
      ?auto_244489 - BLOCK
      ?auto_244490 - BLOCK
    )
    :vars
    (
      ?auto_244491 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_244490 ?auto_244491 ) ( ON-TABLE ?auto_244483 ) ( ON ?auto_244484 ?auto_244483 ) ( not ( = ?auto_244483 ?auto_244484 ) ) ( not ( = ?auto_244483 ?auto_244485 ) ) ( not ( = ?auto_244483 ?auto_244486 ) ) ( not ( = ?auto_244483 ?auto_244487 ) ) ( not ( = ?auto_244483 ?auto_244488 ) ) ( not ( = ?auto_244483 ?auto_244489 ) ) ( not ( = ?auto_244483 ?auto_244490 ) ) ( not ( = ?auto_244483 ?auto_244491 ) ) ( not ( = ?auto_244484 ?auto_244485 ) ) ( not ( = ?auto_244484 ?auto_244486 ) ) ( not ( = ?auto_244484 ?auto_244487 ) ) ( not ( = ?auto_244484 ?auto_244488 ) ) ( not ( = ?auto_244484 ?auto_244489 ) ) ( not ( = ?auto_244484 ?auto_244490 ) ) ( not ( = ?auto_244484 ?auto_244491 ) ) ( not ( = ?auto_244485 ?auto_244486 ) ) ( not ( = ?auto_244485 ?auto_244487 ) ) ( not ( = ?auto_244485 ?auto_244488 ) ) ( not ( = ?auto_244485 ?auto_244489 ) ) ( not ( = ?auto_244485 ?auto_244490 ) ) ( not ( = ?auto_244485 ?auto_244491 ) ) ( not ( = ?auto_244486 ?auto_244487 ) ) ( not ( = ?auto_244486 ?auto_244488 ) ) ( not ( = ?auto_244486 ?auto_244489 ) ) ( not ( = ?auto_244486 ?auto_244490 ) ) ( not ( = ?auto_244486 ?auto_244491 ) ) ( not ( = ?auto_244487 ?auto_244488 ) ) ( not ( = ?auto_244487 ?auto_244489 ) ) ( not ( = ?auto_244487 ?auto_244490 ) ) ( not ( = ?auto_244487 ?auto_244491 ) ) ( not ( = ?auto_244488 ?auto_244489 ) ) ( not ( = ?auto_244488 ?auto_244490 ) ) ( not ( = ?auto_244488 ?auto_244491 ) ) ( not ( = ?auto_244489 ?auto_244490 ) ) ( not ( = ?auto_244489 ?auto_244491 ) ) ( not ( = ?auto_244490 ?auto_244491 ) ) ( ON ?auto_244489 ?auto_244490 ) ( ON ?auto_244488 ?auto_244489 ) ( ON ?auto_244487 ?auto_244488 ) ( ON ?auto_244486 ?auto_244487 ) ( CLEAR ?auto_244484 ) ( ON ?auto_244485 ?auto_244486 ) ( CLEAR ?auto_244485 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_244483 ?auto_244484 ?auto_244485 )
      ( MAKE-8PILE ?auto_244483 ?auto_244484 ?auto_244485 ?auto_244486 ?auto_244487 ?auto_244488 ?auto_244489 ?auto_244490 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_244500 - BLOCK
      ?auto_244501 - BLOCK
      ?auto_244502 - BLOCK
      ?auto_244503 - BLOCK
      ?auto_244504 - BLOCK
      ?auto_244505 - BLOCK
      ?auto_244506 - BLOCK
      ?auto_244507 - BLOCK
    )
    :vars
    (
      ?auto_244508 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_244507 ?auto_244508 ) ( ON-TABLE ?auto_244500 ) ( not ( = ?auto_244500 ?auto_244501 ) ) ( not ( = ?auto_244500 ?auto_244502 ) ) ( not ( = ?auto_244500 ?auto_244503 ) ) ( not ( = ?auto_244500 ?auto_244504 ) ) ( not ( = ?auto_244500 ?auto_244505 ) ) ( not ( = ?auto_244500 ?auto_244506 ) ) ( not ( = ?auto_244500 ?auto_244507 ) ) ( not ( = ?auto_244500 ?auto_244508 ) ) ( not ( = ?auto_244501 ?auto_244502 ) ) ( not ( = ?auto_244501 ?auto_244503 ) ) ( not ( = ?auto_244501 ?auto_244504 ) ) ( not ( = ?auto_244501 ?auto_244505 ) ) ( not ( = ?auto_244501 ?auto_244506 ) ) ( not ( = ?auto_244501 ?auto_244507 ) ) ( not ( = ?auto_244501 ?auto_244508 ) ) ( not ( = ?auto_244502 ?auto_244503 ) ) ( not ( = ?auto_244502 ?auto_244504 ) ) ( not ( = ?auto_244502 ?auto_244505 ) ) ( not ( = ?auto_244502 ?auto_244506 ) ) ( not ( = ?auto_244502 ?auto_244507 ) ) ( not ( = ?auto_244502 ?auto_244508 ) ) ( not ( = ?auto_244503 ?auto_244504 ) ) ( not ( = ?auto_244503 ?auto_244505 ) ) ( not ( = ?auto_244503 ?auto_244506 ) ) ( not ( = ?auto_244503 ?auto_244507 ) ) ( not ( = ?auto_244503 ?auto_244508 ) ) ( not ( = ?auto_244504 ?auto_244505 ) ) ( not ( = ?auto_244504 ?auto_244506 ) ) ( not ( = ?auto_244504 ?auto_244507 ) ) ( not ( = ?auto_244504 ?auto_244508 ) ) ( not ( = ?auto_244505 ?auto_244506 ) ) ( not ( = ?auto_244505 ?auto_244507 ) ) ( not ( = ?auto_244505 ?auto_244508 ) ) ( not ( = ?auto_244506 ?auto_244507 ) ) ( not ( = ?auto_244506 ?auto_244508 ) ) ( not ( = ?auto_244507 ?auto_244508 ) ) ( ON ?auto_244506 ?auto_244507 ) ( ON ?auto_244505 ?auto_244506 ) ( ON ?auto_244504 ?auto_244505 ) ( ON ?auto_244503 ?auto_244504 ) ( ON ?auto_244502 ?auto_244503 ) ( CLEAR ?auto_244500 ) ( ON ?auto_244501 ?auto_244502 ) ( CLEAR ?auto_244501 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_244500 ?auto_244501 )
      ( MAKE-8PILE ?auto_244500 ?auto_244501 ?auto_244502 ?auto_244503 ?auto_244504 ?auto_244505 ?auto_244506 ?auto_244507 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_244517 - BLOCK
      ?auto_244518 - BLOCK
      ?auto_244519 - BLOCK
      ?auto_244520 - BLOCK
      ?auto_244521 - BLOCK
      ?auto_244522 - BLOCK
      ?auto_244523 - BLOCK
      ?auto_244524 - BLOCK
    )
    :vars
    (
      ?auto_244525 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_244524 ?auto_244525 ) ( ON-TABLE ?auto_244517 ) ( not ( = ?auto_244517 ?auto_244518 ) ) ( not ( = ?auto_244517 ?auto_244519 ) ) ( not ( = ?auto_244517 ?auto_244520 ) ) ( not ( = ?auto_244517 ?auto_244521 ) ) ( not ( = ?auto_244517 ?auto_244522 ) ) ( not ( = ?auto_244517 ?auto_244523 ) ) ( not ( = ?auto_244517 ?auto_244524 ) ) ( not ( = ?auto_244517 ?auto_244525 ) ) ( not ( = ?auto_244518 ?auto_244519 ) ) ( not ( = ?auto_244518 ?auto_244520 ) ) ( not ( = ?auto_244518 ?auto_244521 ) ) ( not ( = ?auto_244518 ?auto_244522 ) ) ( not ( = ?auto_244518 ?auto_244523 ) ) ( not ( = ?auto_244518 ?auto_244524 ) ) ( not ( = ?auto_244518 ?auto_244525 ) ) ( not ( = ?auto_244519 ?auto_244520 ) ) ( not ( = ?auto_244519 ?auto_244521 ) ) ( not ( = ?auto_244519 ?auto_244522 ) ) ( not ( = ?auto_244519 ?auto_244523 ) ) ( not ( = ?auto_244519 ?auto_244524 ) ) ( not ( = ?auto_244519 ?auto_244525 ) ) ( not ( = ?auto_244520 ?auto_244521 ) ) ( not ( = ?auto_244520 ?auto_244522 ) ) ( not ( = ?auto_244520 ?auto_244523 ) ) ( not ( = ?auto_244520 ?auto_244524 ) ) ( not ( = ?auto_244520 ?auto_244525 ) ) ( not ( = ?auto_244521 ?auto_244522 ) ) ( not ( = ?auto_244521 ?auto_244523 ) ) ( not ( = ?auto_244521 ?auto_244524 ) ) ( not ( = ?auto_244521 ?auto_244525 ) ) ( not ( = ?auto_244522 ?auto_244523 ) ) ( not ( = ?auto_244522 ?auto_244524 ) ) ( not ( = ?auto_244522 ?auto_244525 ) ) ( not ( = ?auto_244523 ?auto_244524 ) ) ( not ( = ?auto_244523 ?auto_244525 ) ) ( not ( = ?auto_244524 ?auto_244525 ) ) ( ON ?auto_244523 ?auto_244524 ) ( ON ?auto_244522 ?auto_244523 ) ( ON ?auto_244521 ?auto_244522 ) ( ON ?auto_244520 ?auto_244521 ) ( ON ?auto_244519 ?auto_244520 ) ( CLEAR ?auto_244517 ) ( ON ?auto_244518 ?auto_244519 ) ( CLEAR ?auto_244518 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_244517 ?auto_244518 )
      ( MAKE-8PILE ?auto_244517 ?auto_244518 ?auto_244519 ?auto_244520 ?auto_244521 ?auto_244522 ?auto_244523 ?auto_244524 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_244534 - BLOCK
      ?auto_244535 - BLOCK
      ?auto_244536 - BLOCK
      ?auto_244537 - BLOCK
      ?auto_244538 - BLOCK
      ?auto_244539 - BLOCK
      ?auto_244540 - BLOCK
      ?auto_244541 - BLOCK
    )
    :vars
    (
      ?auto_244542 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_244541 ?auto_244542 ) ( not ( = ?auto_244534 ?auto_244535 ) ) ( not ( = ?auto_244534 ?auto_244536 ) ) ( not ( = ?auto_244534 ?auto_244537 ) ) ( not ( = ?auto_244534 ?auto_244538 ) ) ( not ( = ?auto_244534 ?auto_244539 ) ) ( not ( = ?auto_244534 ?auto_244540 ) ) ( not ( = ?auto_244534 ?auto_244541 ) ) ( not ( = ?auto_244534 ?auto_244542 ) ) ( not ( = ?auto_244535 ?auto_244536 ) ) ( not ( = ?auto_244535 ?auto_244537 ) ) ( not ( = ?auto_244535 ?auto_244538 ) ) ( not ( = ?auto_244535 ?auto_244539 ) ) ( not ( = ?auto_244535 ?auto_244540 ) ) ( not ( = ?auto_244535 ?auto_244541 ) ) ( not ( = ?auto_244535 ?auto_244542 ) ) ( not ( = ?auto_244536 ?auto_244537 ) ) ( not ( = ?auto_244536 ?auto_244538 ) ) ( not ( = ?auto_244536 ?auto_244539 ) ) ( not ( = ?auto_244536 ?auto_244540 ) ) ( not ( = ?auto_244536 ?auto_244541 ) ) ( not ( = ?auto_244536 ?auto_244542 ) ) ( not ( = ?auto_244537 ?auto_244538 ) ) ( not ( = ?auto_244537 ?auto_244539 ) ) ( not ( = ?auto_244537 ?auto_244540 ) ) ( not ( = ?auto_244537 ?auto_244541 ) ) ( not ( = ?auto_244537 ?auto_244542 ) ) ( not ( = ?auto_244538 ?auto_244539 ) ) ( not ( = ?auto_244538 ?auto_244540 ) ) ( not ( = ?auto_244538 ?auto_244541 ) ) ( not ( = ?auto_244538 ?auto_244542 ) ) ( not ( = ?auto_244539 ?auto_244540 ) ) ( not ( = ?auto_244539 ?auto_244541 ) ) ( not ( = ?auto_244539 ?auto_244542 ) ) ( not ( = ?auto_244540 ?auto_244541 ) ) ( not ( = ?auto_244540 ?auto_244542 ) ) ( not ( = ?auto_244541 ?auto_244542 ) ) ( ON ?auto_244540 ?auto_244541 ) ( ON ?auto_244539 ?auto_244540 ) ( ON ?auto_244538 ?auto_244539 ) ( ON ?auto_244537 ?auto_244538 ) ( ON ?auto_244536 ?auto_244537 ) ( ON ?auto_244535 ?auto_244536 ) ( ON ?auto_244534 ?auto_244535 ) ( CLEAR ?auto_244534 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_244534 )
      ( MAKE-8PILE ?auto_244534 ?auto_244535 ?auto_244536 ?auto_244537 ?auto_244538 ?auto_244539 ?auto_244540 ?auto_244541 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_244551 - BLOCK
      ?auto_244552 - BLOCK
      ?auto_244553 - BLOCK
      ?auto_244554 - BLOCK
      ?auto_244555 - BLOCK
      ?auto_244556 - BLOCK
      ?auto_244557 - BLOCK
      ?auto_244558 - BLOCK
    )
    :vars
    (
      ?auto_244559 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_244558 ?auto_244559 ) ( not ( = ?auto_244551 ?auto_244552 ) ) ( not ( = ?auto_244551 ?auto_244553 ) ) ( not ( = ?auto_244551 ?auto_244554 ) ) ( not ( = ?auto_244551 ?auto_244555 ) ) ( not ( = ?auto_244551 ?auto_244556 ) ) ( not ( = ?auto_244551 ?auto_244557 ) ) ( not ( = ?auto_244551 ?auto_244558 ) ) ( not ( = ?auto_244551 ?auto_244559 ) ) ( not ( = ?auto_244552 ?auto_244553 ) ) ( not ( = ?auto_244552 ?auto_244554 ) ) ( not ( = ?auto_244552 ?auto_244555 ) ) ( not ( = ?auto_244552 ?auto_244556 ) ) ( not ( = ?auto_244552 ?auto_244557 ) ) ( not ( = ?auto_244552 ?auto_244558 ) ) ( not ( = ?auto_244552 ?auto_244559 ) ) ( not ( = ?auto_244553 ?auto_244554 ) ) ( not ( = ?auto_244553 ?auto_244555 ) ) ( not ( = ?auto_244553 ?auto_244556 ) ) ( not ( = ?auto_244553 ?auto_244557 ) ) ( not ( = ?auto_244553 ?auto_244558 ) ) ( not ( = ?auto_244553 ?auto_244559 ) ) ( not ( = ?auto_244554 ?auto_244555 ) ) ( not ( = ?auto_244554 ?auto_244556 ) ) ( not ( = ?auto_244554 ?auto_244557 ) ) ( not ( = ?auto_244554 ?auto_244558 ) ) ( not ( = ?auto_244554 ?auto_244559 ) ) ( not ( = ?auto_244555 ?auto_244556 ) ) ( not ( = ?auto_244555 ?auto_244557 ) ) ( not ( = ?auto_244555 ?auto_244558 ) ) ( not ( = ?auto_244555 ?auto_244559 ) ) ( not ( = ?auto_244556 ?auto_244557 ) ) ( not ( = ?auto_244556 ?auto_244558 ) ) ( not ( = ?auto_244556 ?auto_244559 ) ) ( not ( = ?auto_244557 ?auto_244558 ) ) ( not ( = ?auto_244557 ?auto_244559 ) ) ( not ( = ?auto_244558 ?auto_244559 ) ) ( ON ?auto_244557 ?auto_244558 ) ( ON ?auto_244556 ?auto_244557 ) ( ON ?auto_244555 ?auto_244556 ) ( ON ?auto_244554 ?auto_244555 ) ( ON ?auto_244553 ?auto_244554 ) ( ON ?auto_244552 ?auto_244553 ) ( ON ?auto_244551 ?auto_244552 ) ( CLEAR ?auto_244551 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_244551 )
      ( MAKE-8PILE ?auto_244551 ?auto_244552 ?auto_244553 ?auto_244554 ?auto_244555 ?auto_244556 ?auto_244557 ?auto_244558 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_244569 - BLOCK
      ?auto_244570 - BLOCK
      ?auto_244571 - BLOCK
      ?auto_244572 - BLOCK
      ?auto_244573 - BLOCK
      ?auto_244574 - BLOCK
      ?auto_244575 - BLOCK
      ?auto_244576 - BLOCK
      ?auto_244577 - BLOCK
    )
    :vars
    (
      ?auto_244578 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_244576 ) ( ON ?auto_244577 ?auto_244578 ) ( CLEAR ?auto_244577 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_244569 ) ( ON ?auto_244570 ?auto_244569 ) ( ON ?auto_244571 ?auto_244570 ) ( ON ?auto_244572 ?auto_244571 ) ( ON ?auto_244573 ?auto_244572 ) ( ON ?auto_244574 ?auto_244573 ) ( ON ?auto_244575 ?auto_244574 ) ( ON ?auto_244576 ?auto_244575 ) ( not ( = ?auto_244569 ?auto_244570 ) ) ( not ( = ?auto_244569 ?auto_244571 ) ) ( not ( = ?auto_244569 ?auto_244572 ) ) ( not ( = ?auto_244569 ?auto_244573 ) ) ( not ( = ?auto_244569 ?auto_244574 ) ) ( not ( = ?auto_244569 ?auto_244575 ) ) ( not ( = ?auto_244569 ?auto_244576 ) ) ( not ( = ?auto_244569 ?auto_244577 ) ) ( not ( = ?auto_244569 ?auto_244578 ) ) ( not ( = ?auto_244570 ?auto_244571 ) ) ( not ( = ?auto_244570 ?auto_244572 ) ) ( not ( = ?auto_244570 ?auto_244573 ) ) ( not ( = ?auto_244570 ?auto_244574 ) ) ( not ( = ?auto_244570 ?auto_244575 ) ) ( not ( = ?auto_244570 ?auto_244576 ) ) ( not ( = ?auto_244570 ?auto_244577 ) ) ( not ( = ?auto_244570 ?auto_244578 ) ) ( not ( = ?auto_244571 ?auto_244572 ) ) ( not ( = ?auto_244571 ?auto_244573 ) ) ( not ( = ?auto_244571 ?auto_244574 ) ) ( not ( = ?auto_244571 ?auto_244575 ) ) ( not ( = ?auto_244571 ?auto_244576 ) ) ( not ( = ?auto_244571 ?auto_244577 ) ) ( not ( = ?auto_244571 ?auto_244578 ) ) ( not ( = ?auto_244572 ?auto_244573 ) ) ( not ( = ?auto_244572 ?auto_244574 ) ) ( not ( = ?auto_244572 ?auto_244575 ) ) ( not ( = ?auto_244572 ?auto_244576 ) ) ( not ( = ?auto_244572 ?auto_244577 ) ) ( not ( = ?auto_244572 ?auto_244578 ) ) ( not ( = ?auto_244573 ?auto_244574 ) ) ( not ( = ?auto_244573 ?auto_244575 ) ) ( not ( = ?auto_244573 ?auto_244576 ) ) ( not ( = ?auto_244573 ?auto_244577 ) ) ( not ( = ?auto_244573 ?auto_244578 ) ) ( not ( = ?auto_244574 ?auto_244575 ) ) ( not ( = ?auto_244574 ?auto_244576 ) ) ( not ( = ?auto_244574 ?auto_244577 ) ) ( not ( = ?auto_244574 ?auto_244578 ) ) ( not ( = ?auto_244575 ?auto_244576 ) ) ( not ( = ?auto_244575 ?auto_244577 ) ) ( not ( = ?auto_244575 ?auto_244578 ) ) ( not ( = ?auto_244576 ?auto_244577 ) ) ( not ( = ?auto_244576 ?auto_244578 ) ) ( not ( = ?auto_244577 ?auto_244578 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_244577 ?auto_244578 )
      ( !STACK ?auto_244577 ?auto_244576 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_244588 - BLOCK
      ?auto_244589 - BLOCK
      ?auto_244590 - BLOCK
      ?auto_244591 - BLOCK
      ?auto_244592 - BLOCK
      ?auto_244593 - BLOCK
      ?auto_244594 - BLOCK
      ?auto_244595 - BLOCK
      ?auto_244596 - BLOCK
    )
    :vars
    (
      ?auto_244597 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_244595 ) ( ON ?auto_244596 ?auto_244597 ) ( CLEAR ?auto_244596 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_244588 ) ( ON ?auto_244589 ?auto_244588 ) ( ON ?auto_244590 ?auto_244589 ) ( ON ?auto_244591 ?auto_244590 ) ( ON ?auto_244592 ?auto_244591 ) ( ON ?auto_244593 ?auto_244592 ) ( ON ?auto_244594 ?auto_244593 ) ( ON ?auto_244595 ?auto_244594 ) ( not ( = ?auto_244588 ?auto_244589 ) ) ( not ( = ?auto_244588 ?auto_244590 ) ) ( not ( = ?auto_244588 ?auto_244591 ) ) ( not ( = ?auto_244588 ?auto_244592 ) ) ( not ( = ?auto_244588 ?auto_244593 ) ) ( not ( = ?auto_244588 ?auto_244594 ) ) ( not ( = ?auto_244588 ?auto_244595 ) ) ( not ( = ?auto_244588 ?auto_244596 ) ) ( not ( = ?auto_244588 ?auto_244597 ) ) ( not ( = ?auto_244589 ?auto_244590 ) ) ( not ( = ?auto_244589 ?auto_244591 ) ) ( not ( = ?auto_244589 ?auto_244592 ) ) ( not ( = ?auto_244589 ?auto_244593 ) ) ( not ( = ?auto_244589 ?auto_244594 ) ) ( not ( = ?auto_244589 ?auto_244595 ) ) ( not ( = ?auto_244589 ?auto_244596 ) ) ( not ( = ?auto_244589 ?auto_244597 ) ) ( not ( = ?auto_244590 ?auto_244591 ) ) ( not ( = ?auto_244590 ?auto_244592 ) ) ( not ( = ?auto_244590 ?auto_244593 ) ) ( not ( = ?auto_244590 ?auto_244594 ) ) ( not ( = ?auto_244590 ?auto_244595 ) ) ( not ( = ?auto_244590 ?auto_244596 ) ) ( not ( = ?auto_244590 ?auto_244597 ) ) ( not ( = ?auto_244591 ?auto_244592 ) ) ( not ( = ?auto_244591 ?auto_244593 ) ) ( not ( = ?auto_244591 ?auto_244594 ) ) ( not ( = ?auto_244591 ?auto_244595 ) ) ( not ( = ?auto_244591 ?auto_244596 ) ) ( not ( = ?auto_244591 ?auto_244597 ) ) ( not ( = ?auto_244592 ?auto_244593 ) ) ( not ( = ?auto_244592 ?auto_244594 ) ) ( not ( = ?auto_244592 ?auto_244595 ) ) ( not ( = ?auto_244592 ?auto_244596 ) ) ( not ( = ?auto_244592 ?auto_244597 ) ) ( not ( = ?auto_244593 ?auto_244594 ) ) ( not ( = ?auto_244593 ?auto_244595 ) ) ( not ( = ?auto_244593 ?auto_244596 ) ) ( not ( = ?auto_244593 ?auto_244597 ) ) ( not ( = ?auto_244594 ?auto_244595 ) ) ( not ( = ?auto_244594 ?auto_244596 ) ) ( not ( = ?auto_244594 ?auto_244597 ) ) ( not ( = ?auto_244595 ?auto_244596 ) ) ( not ( = ?auto_244595 ?auto_244597 ) ) ( not ( = ?auto_244596 ?auto_244597 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_244596 ?auto_244597 )
      ( !STACK ?auto_244596 ?auto_244595 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_244607 - BLOCK
      ?auto_244608 - BLOCK
      ?auto_244609 - BLOCK
      ?auto_244610 - BLOCK
      ?auto_244611 - BLOCK
      ?auto_244612 - BLOCK
      ?auto_244613 - BLOCK
      ?auto_244614 - BLOCK
      ?auto_244615 - BLOCK
    )
    :vars
    (
      ?auto_244616 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_244615 ?auto_244616 ) ( ON-TABLE ?auto_244607 ) ( ON ?auto_244608 ?auto_244607 ) ( ON ?auto_244609 ?auto_244608 ) ( ON ?auto_244610 ?auto_244609 ) ( ON ?auto_244611 ?auto_244610 ) ( ON ?auto_244612 ?auto_244611 ) ( ON ?auto_244613 ?auto_244612 ) ( not ( = ?auto_244607 ?auto_244608 ) ) ( not ( = ?auto_244607 ?auto_244609 ) ) ( not ( = ?auto_244607 ?auto_244610 ) ) ( not ( = ?auto_244607 ?auto_244611 ) ) ( not ( = ?auto_244607 ?auto_244612 ) ) ( not ( = ?auto_244607 ?auto_244613 ) ) ( not ( = ?auto_244607 ?auto_244614 ) ) ( not ( = ?auto_244607 ?auto_244615 ) ) ( not ( = ?auto_244607 ?auto_244616 ) ) ( not ( = ?auto_244608 ?auto_244609 ) ) ( not ( = ?auto_244608 ?auto_244610 ) ) ( not ( = ?auto_244608 ?auto_244611 ) ) ( not ( = ?auto_244608 ?auto_244612 ) ) ( not ( = ?auto_244608 ?auto_244613 ) ) ( not ( = ?auto_244608 ?auto_244614 ) ) ( not ( = ?auto_244608 ?auto_244615 ) ) ( not ( = ?auto_244608 ?auto_244616 ) ) ( not ( = ?auto_244609 ?auto_244610 ) ) ( not ( = ?auto_244609 ?auto_244611 ) ) ( not ( = ?auto_244609 ?auto_244612 ) ) ( not ( = ?auto_244609 ?auto_244613 ) ) ( not ( = ?auto_244609 ?auto_244614 ) ) ( not ( = ?auto_244609 ?auto_244615 ) ) ( not ( = ?auto_244609 ?auto_244616 ) ) ( not ( = ?auto_244610 ?auto_244611 ) ) ( not ( = ?auto_244610 ?auto_244612 ) ) ( not ( = ?auto_244610 ?auto_244613 ) ) ( not ( = ?auto_244610 ?auto_244614 ) ) ( not ( = ?auto_244610 ?auto_244615 ) ) ( not ( = ?auto_244610 ?auto_244616 ) ) ( not ( = ?auto_244611 ?auto_244612 ) ) ( not ( = ?auto_244611 ?auto_244613 ) ) ( not ( = ?auto_244611 ?auto_244614 ) ) ( not ( = ?auto_244611 ?auto_244615 ) ) ( not ( = ?auto_244611 ?auto_244616 ) ) ( not ( = ?auto_244612 ?auto_244613 ) ) ( not ( = ?auto_244612 ?auto_244614 ) ) ( not ( = ?auto_244612 ?auto_244615 ) ) ( not ( = ?auto_244612 ?auto_244616 ) ) ( not ( = ?auto_244613 ?auto_244614 ) ) ( not ( = ?auto_244613 ?auto_244615 ) ) ( not ( = ?auto_244613 ?auto_244616 ) ) ( not ( = ?auto_244614 ?auto_244615 ) ) ( not ( = ?auto_244614 ?auto_244616 ) ) ( not ( = ?auto_244615 ?auto_244616 ) ) ( CLEAR ?auto_244613 ) ( ON ?auto_244614 ?auto_244615 ) ( CLEAR ?auto_244614 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_244607 ?auto_244608 ?auto_244609 ?auto_244610 ?auto_244611 ?auto_244612 ?auto_244613 ?auto_244614 )
      ( MAKE-9PILE ?auto_244607 ?auto_244608 ?auto_244609 ?auto_244610 ?auto_244611 ?auto_244612 ?auto_244613 ?auto_244614 ?auto_244615 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_244626 - BLOCK
      ?auto_244627 - BLOCK
      ?auto_244628 - BLOCK
      ?auto_244629 - BLOCK
      ?auto_244630 - BLOCK
      ?auto_244631 - BLOCK
      ?auto_244632 - BLOCK
      ?auto_244633 - BLOCK
      ?auto_244634 - BLOCK
    )
    :vars
    (
      ?auto_244635 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_244634 ?auto_244635 ) ( ON-TABLE ?auto_244626 ) ( ON ?auto_244627 ?auto_244626 ) ( ON ?auto_244628 ?auto_244627 ) ( ON ?auto_244629 ?auto_244628 ) ( ON ?auto_244630 ?auto_244629 ) ( ON ?auto_244631 ?auto_244630 ) ( ON ?auto_244632 ?auto_244631 ) ( not ( = ?auto_244626 ?auto_244627 ) ) ( not ( = ?auto_244626 ?auto_244628 ) ) ( not ( = ?auto_244626 ?auto_244629 ) ) ( not ( = ?auto_244626 ?auto_244630 ) ) ( not ( = ?auto_244626 ?auto_244631 ) ) ( not ( = ?auto_244626 ?auto_244632 ) ) ( not ( = ?auto_244626 ?auto_244633 ) ) ( not ( = ?auto_244626 ?auto_244634 ) ) ( not ( = ?auto_244626 ?auto_244635 ) ) ( not ( = ?auto_244627 ?auto_244628 ) ) ( not ( = ?auto_244627 ?auto_244629 ) ) ( not ( = ?auto_244627 ?auto_244630 ) ) ( not ( = ?auto_244627 ?auto_244631 ) ) ( not ( = ?auto_244627 ?auto_244632 ) ) ( not ( = ?auto_244627 ?auto_244633 ) ) ( not ( = ?auto_244627 ?auto_244634 ) ) ( not ( = ?auto_244627 ?auto_244635 ) ) ( not ( = ?auto_244628 ?auto_244629 ) ) ( not ( = ?auto_244628 ?auto_244630 ) ) ( not ( = ?auto_244628 ?auto_244631 ) ) ( not ( = ?auto_244628 ?auto_244632 ) ) ( not ( = ?auto_244628 ?auto_244633 ) ) ( not ( = ?auto_244628 ?auto_244634 ) ) ( not ( = ?auto_244628 ?auto_244635 ) ) ( not ( = ?auto_244629 ?auto_244630 ) ) ( not ( = ?auto_244629 ?auto_244631 ) ) ( not ( = ?auto_244629 ?auto_244632 ) ) ( not ( = ?auto_244629 ?auto_244633 ) ) ( not ( = ?auto_244629 ?auto_244634 ) ) ( not ( = ?auto_244629 ?auto_244635 ) ) ( not ( = ?auto_244630 ?auto_244631 ) ) ( not ( = ?auto_244630 ?auto_244632 ) ) ( not ( = ?auto_244630 ?auto_244633 ) ) ( not ( = ?auto_244630 ?auto_244634 ) ) ( not ( = ?auto_244630 ?auto_244635 ) ) ( not ( = ?auto_244631 ?auto_244632 ) ) ( not ( = ?auto_244631 ?auto_244633 ) ) ( not ( = ?auto_244631 ?auto_244634 ) ) ( not ( = ?auto_244631 ?auto_244635 ) ) ( not ( = ?auto_244632 ?auto_244633 ) ) ( not ( = ?auto_244632 ?auto_244634 ) ) ( not ( = ?auto_244632 ?auto_244635 ) ) ( not ( = ?auto_244633 ?auto_244634 ) ) ( not ( = ?auto_244633 ?auto_244635 ) ) ( not ( = ?auto_244634 ?auto_244635 ) ) ( CLEAR ?auto_244632 ) ( ON ?auto_244633 ?auto_244634 ) ( CLEAR ?auto_244633 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_244626 ?auto_244627 ?auto_244628 ?auto_244629 ?auto_244630 ?auto_244631 ?auto_244632 ?auto_244633 )
      ( MAKE-9PILE ?auto_244626 ?auto_244627 ?auto_244628 ?auto_244629 ?auto_244630 ?auto_244631 ?auto_244632 ?auto_244633 ?auto_244634 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_244645 - BLOCK
      ?auto_244646 - BLOCK
      ?auto_244647 - BLOCK
      ?auto_244648 - BLOCK
      ?auto_244649 - BLOCK
      ?auto_244650 - BLOCK
      ?auto_244651 - BLOCK
      ?auto_244652 - BLOCK
      ?auto_244653 - BLOCK
    )
    :vars
    (
      ?auto_244654 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_244653 ?auto_244654 ) ( ON-TABLE ?auto_244645 ) ( ON ?auto_244646 ?auto_244645 ) ( ON ?auto_244647 ?auto_244646 ) ( ON ?auto_244648 ?auto_244647 ) ( ON ?auto_244649 ?auto_244648 ) ( ON ?auto_244650 ?auto_244649 ) ( not ( = ?auto_244645 ?auto_244646 ) ) ( not ( = ?auto_244645 ?auto_244647 ) ) ( not ( = ?auto_244645 ?auto_244648 ) ) ( not ( = ?auto_244645 ?auto_244649 ) ) ( not ( = ?auto_244645 ?auto_244650 ) ) ( not ( = ?auto_244645 ?auto_244651 ) ) ( not ( = ?auto_244645 ?auto_244652 ) ) ( not ( = ?auto_244645 ?auto_244653 ) ) ( not ( = ?auto_244645 ?auto_244654 ) ) ( not ( = ?auto_244646 ?auto_244647 ) ) ( not ( = ?auto_244646 ?auto_244648 ) ) ( not ( = ?auto_244646 ?auto_244649 ) ) ( not ( = ?auto_244646 ?auto_244650 ) ) ( not ( = ?auto_244646 ?auto_244651 ) ) ( not ( = ?auto_244646 ?auto_244652 ) ) ( not ( = ?auto_244646 ?auto_244653 ) ) ( not ( = ?auto_244646 ?auto_244654 ) ) ( not ( = ?auto_244647 ?auto_244648 ) ) ( not ( = ?auto_244647 ?auto_244649 ) ) ( not ( = ?auto_244647 ?auto_244650 ) ) ( not ( = ?auto_244647 ?auto_244651 ) ) ( not ( = ?auto_244647 ?auto_244652 ) ) ( not ( = ?auto_244647 ?auto_244653 ) ) ( not ( = ?auto_244647 ?auto_244654 ) ) ( not ( = ?auto_244648 ?auto_244649 ) ) ( not ( = ?auto_244648 ?auto_244650 ) ) ( not ( = ?auto_244648 ?auto_244651 ) ) ( not ( = ?auto_244648 ?auto_244652 ) ) ( not ( = ?auto_244648 ?auto_244653 ) ) ( not ( = ?auto_244648 ?auto_244654 ) ) ( not ( = ?auto_244649 ?auto_244650 ) ) ( not ( = ?auto_244649 ?auto_244651 ) ) ( not ( = ?auto_244649 ?auto_244652 ) ) ( not ( = ?auto_244649 ?auto_244653 ) ) ( not ( = ?auto_244649 ?auto_244654 ) ) ( not ( = ?auto_244650 ?auto_244651 ) ) ( not ( = ?auto_244650 ?auto_244652 ) ) ( not ( = ?auto_244650 ?auto_244653 ) ) ( not ( = ?auto_244650 ?auto_244654 ) ) ( not ( = ?auto_244651 ?auto_244652 ) ) ( not ( = ?auto_244651 ?auto_244653 ) ) ( not ( = ?auto_244651 ?auto_244654 ) ) ( not ( = ?auto_244652 ?auto_244653 ) ) ( not ( = ?auto_244652 ?auto_244654 ) ) ( not ( = ?auto_244653 ?auto_244654 ) ) ( ON ?auto_244652 ?auto_244653 ) ( CLEAR ?auto_244650 ) ( ON ?auto_244651 ?auto_244652 ) ( CLEAR ?auto_244651 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_244645 ?auto_244646 ?auto_244647 ?auto_244648 ?auto_244649 ?auto_244650 ?auto_244651 )
      ( MAKE-9PILE ?auto_244645 ?auto_244646 ?auto_244647 ?auto_244648 ?auto_244649 ?auto_244650 ?auto_244651 ?auto_244652 ?auto_244653 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_244664 - BLOCK
      ?auto_244665 - BLOCK
      ?auto_244666 - BLOCK
      ?auto_244667 - BLOCK
      ?auto_244668 - BLOCK
      ?auto_244669 - BLOCK
      ?auto_244670 - BLOCK
      ?auto_244671 - BLOCK
      ?auto_244672 - BLOCK
    )
    :vars
    (
      ?auto_244673 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_244672 ?auto_244673 ) ( ON-TABLE ?auto_244664 ) ( ON ?auto_244665 ?auto_244664 ) ( ON ?auto_244666 ?auto_244665 ) ( ON ?auto_244667 ?auto_244666 ) ( ON ?auto_244668 ?auto_244667 ) ( ON ?auto_244669 ?auto_244668 ) ( not ( = ?auto_244664 ?auto_244665 ) ) ( not ( = ?auto_244664 ?auto_244666 ) ) ( not ( = ?auto_244664 ?auto_244667 ) ) ( not ( = ?auto_244664 ?auto_244668 ) ) ( not ( = ?auto_244664 ?auto_244669 ) ) ( not ( = ?auto_244664 ?auto_244670 ) ) ( not ( = ?auto_244664 ?auto_244671 ) ) ( not ( = ?auto_244664 ?auto_244672 ) ) ( not ( = ?auto_244664 ?auto_244673 ) ) ( not ( = ?auto_244665 ?auto_244666 ) ) ( not ( = ?auto_244665 ?auto_244667 ) ) ( not ( = ?auto_244665 ?auto_244668 ) ) ( not ( = ?auto_244665 ?auto_244669 ) ) ( not ( = ?auto_244665 ?auto_244670 ) ) ( not ( = ?auto_244665 ?auto_244671 ) ) ( not ( = ?auto_244665 ?auto_244672 ) ) ( not ( = ?auto_244665 ?auto_244673 ) ) ( not ( = ?auto_244666 ?auto_244667 ) ) ( not ( = ?auto_244666 ?auto_244668 ) ) ( not ( = ?auto_244666 ?auto_244669 ) ) ( not ( = ?auto_244666 ?auto_244670 ) ) ( not ( = ?auto_244666 ?auto_244671 ) ) ( not ( = ?auto_244666 ?auto_244672 ) ) ( not ( = ?auto_244666 ?auto_244673 ) ) ( not ( = ?auto_244667 ?auto_244668 ) ) ( not ( = ?auto_244667 ?auto_244669 ) ) ( not ( = ?auto_244667 ?auto_244670 ) ) ( not ( = ?auto_244667 ?auto_244671 ) ) ( not ( = ?auto_244667 ?auto_244672 ) ) ( not ( = ?auto_244667 ?auto_244673 ) ) ( not ( = ?auto_244668 ?auto_244669 ) ) ( not ( = ?auto_244668 ?auto_244670 ) ) ( not ( = ?auto_244668 ?auto_244671 ) ) ( not ( = ?auto_244668 ?auto_244672 ) ) ( not ( = ?auto_244668 ?auto_244673 ) ) ( not ( = ?auto_244669 ?auto_244670 ) ) ( not ( = ?auto_244669 ?auto_244671 ) ) ( not ( = ?auto_244669 ?auto_244672 ) ) ( not ( = ?auto_244669 ?auto_244673 ) ) ( not ( = ?auto_244670 ?auto_244671 ) ) ( not ( = ?auto_244670 ?auto_244672 ) ) ( not ( = ?auto_244670 ?auto_244673 ) ) ( not ( = ?auto_244671 ?auto_244672 ) ) ( not ( = ?auto_244671 ?auto_244673 ) ) ( not ( = ?auto_244672 ?auto_244673 ) ) ( ON ?auto_244671 ?auto_244672 ) ( CLEAR ?auto_244669 ) ( ON ?auto_244670 ?auto_244671 ) ( CLEAR ?auto_244670 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_244664 ?auto_244665 ?auto_244666 ?auto_244667 ?auto_244668 ?auto_244669 ?auto_244670 )
      ( MAKE-9PILE ?auto_244664 ?auto_244665 ?auto_244666 ?auto_244667 ?auto_244668 ?auto_244669 ?auto_244670 ?auto_244671 ?auto_244672 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_244683 - BLOCK
      ?auto_244684 - BLOCK
      ?auto_244685 - BLOCK
      ?auto_244686 - BLOCK
      ?auto_244687 - BLOCK
      ?auto_244688 - BLOCK
      ?auto_244689 - BLOCK
      ?auto_244690 - BLOCK
      ?auto_244691 - BLOCK
    )
    :vars
    (
      ?auto_244692 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_244691 ?auto_244692 ) ( ON-TABLE ?auto_244683 ) ( ON ?auto_244684 ?auto_244683 ) ( ON ?auto_244685 ?auto_244684 ) ( ON ?auto_244686 ?auto_244685 ) ( ON ?auto_244687 ?auto_244686 ) ( not ( = ?auto_244683 ?auto_244684 ) ) ( not ( = ?auto_244683 ?auto_244685 ) ) ( not ( = ?auto_244683 ?auto_244686 ) ) ( not ( = ?auto_244683 ?auto_244687 ) ) ( not ( = ?auto_244683 ?auto_244688 ) ) ( not ( = ?auto_244683 ?auto_244689 ) ) ( not ( = ?auto_244683 ?auto_244690 ) ) ( not ( = ?auto_244683 ?auto_244691 ) ) ( not ( = ?auto_244683 ?auto_244692 ) ) ( not ( = ?auto_244684 ?auto_244685 ) ) ( not ( = ?auto_244684 ?auto_244686 ) ) ( not ( = ?auto_244684 ?auto_244687 ) ) ( not ( = ?auto_244684 ?auto_244688 ) ) ( not ( = ?auto_244684 ?auto_244689 ) ) ( not ( = ?auto_244684 ?auto_244690 ) ) ( not ( = ?auto_244684 ?auto_244691 ) ) ( not ( = ?auto_244684 ?auto_244692 ) ) ( not ( = ?auto_244685 ?auto_244686 ) ) ( not ( = ?auto_244685 ?auto_244687 ) ) ( not ( = ?auto_244685 ?auto_244688 ) ) ( not ( = ?auto_244685 ?auto_244689 ) ) ( not ( = ?auto_244685 ?auto_244690 ) ) ( not ( = ?auto_244685 ?auto_244691 ) ) ( not ( = ?auto_244685 ?auto_244692 ) ) ( not ( = ?auto_244686 ?auto_244687 ) ) ( not ( = ?auto_244686 ?auto_244688 ) ) ( not ( = ?auto_244686 ?auto_244689 ) ) ( not ( = ?auto_244686 ?auto_244690 ) ) ( not ( = ?auto_244686 ?auto_244691 ) ) ( not ( = ?auto_244686 ?auto_244692 ) ) ( not ( = ?auto_244687 ?auto_244688 ) ) ( not ( = ?auto_244687 ?auto_244689 ) ) ( not ( = ?auto_244687 ?auto_244690 ) ) ( not ( = ?auto_244687 ?auto_244691 ) ) ( not ( = ?auto_244687 ?auto_244692 ) ) ( not ( = ?auto_244688 ?auto_244689 ) ) ( not ( = ?auto_244688 ?auto_244690 ) ) ( not ( = ?auto_244688 ?auto_244691 ) ) ( not ( = ?auto_244688 ?auto_244692 ) ) ( not ( = ?auto_244689 ?auto_244690 ) ) ( not ( = ?auto_244689 ?auto_244691 ) ) ( not ( = ?auto_244689 ?auto_244692 ) ) ( not ( = ?auto_244690 ?auto_244691 ) ) ( not ( = ?auto_244690 ?auto_244692 ) ) ( not ( = ?auto_244691 ?auto_244692 ) ) ( ON ?auto_244690 ?auto_244691 ) ( ON ?auto_244689 ?auto_244690 ) ( CLEAR ?auto_244687 ) ( ON ?auto_244688 ?auto_244689 ) ( CLEAR ?auto_244688 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_244683 ?auto_244684 ?auto_244685 ?auto_244686 ?auto_244687 ?auto_244688 )
      ( MAKE-9PILE ?auto_244683 ?auto_244684 ?auto_244685 ?auto_244686 ?auto_244687 ?auto_244688 ?auto_244689 ?auto_244690 ?auto_244691 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_244702 - BLOCK
      ?auto_244703 - BLOCK
      ?auto_244704 - BLOCK
      ?auto_244705 - BLOCK
      ?auto_244706 - BLOCK
      ?auto_244707 - BLOCK
      ?auto_244708 - BLOCK
      ?auto_244709 - BLOCK
      ?auto_244710 - BLOCK
    )
    :vars
    (
      ?auto_244711 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_244710 ?auto_244711 ) ( ON-TABLE ?auto_244702 ) ( ON ?auto_244703 ?auto_244702 ) ( ON ?auto_244704 ?auto_244703 ) ( ON ?auto_244705 ?auto_244704 ) ( ON ?auto_244706 ?auto_244705 ) ( not ( = ?auto_244702 ?auto_244703 ) ) ( not ( = ?auto_244702 ?auto_244704 ) ) ( not ( = ?auto_244702 ?auto_244705 ) ) ( not ( = ?auto_244702 ?auto_244706 ) ) ( not ( = ?auto_244702 ?auto_244707 ) ) ( not ( = ?auto_244702 ?auto_244708 ) ) ( not ( = ?auto_244702 ?auto_244709 ) ) ( not ( = ?auto_244702 ?auto_244710 ) ) ( not ( = ?auto_244702 ?auto_244711 ) ) ( not ( = ?auto_244703 ?auto_244704 ) ) ( not ( = ?auto_244703 ?auto_244705 ) ) ( not ( = ?auto_244703 ?auto_244706 ) ) ( not ( = ?auto_244703 ?auto_244707 ) ) ( not ( = ?auto_244703 ?auto_244708 ) ) ( not ( = ?auto_244703 ?auto_244709 ) ) ( not ( = ?auto_244703 ?auto_244710 ) ) ( not ( = ?auto_244703 ?auto_244711 ) ) ( not ( = ?auto_244704 ?auto_244705 ) ) ( not ( = ?auto_244704 ?auto_244706 ) ) ( not ( = ?auto_244704 ?auto_244707 ) ) ( not ( = ?auto_244704 ?auto_244708 ) ) ( not ( = ?auto_244704 ?auto_244709 ) ) ( not ( = ?auto_244704 ?auto_244710 ) ) ( not ( = ?auto_244704 ?auto_244711 ) ) ( not ( = ?auto_244705 ?auto_244706 ) ) ( not ( = ?auto_244705 ?auto_244707 ) ) ( not ( = ?auto_244705 ?auto_244708 ) ) ( not ( = ?auto_244705 ?auto_244709 ) ) ( not ( = ?auto_244705 ?auto_244710 ) ) ( not ( = ?auto_244705 ?auto_244711 ) ) ( not ( = ?auto_244706 ?auto_244707 ) ) ( not ( = ?auto_244706 ?auto_244708 ) ) ( not ( = ?auto_244706 ?auto_244709 ) ) ( not ( = ?auto_244706 ?auto_244710 ) ) ( not ( = ?auto_244706 ?auto_244711 ) ) ( not ( = ?auto_244707 ?auto_244708 ) ) ( not ( = ?auto_244707 ?auto_244709 ) ) ( not ( = ?auto_244707 ?auto_244710 ) ) ( not ( = ?auto_244707 ?auto_244711 ) ) ( not ( = ?auto_244708 ?auto_244709 ) ) ( not ( = ?auto_244708 ?auto_244710 ) ) ( not ( = ?auto_244708 ?auto_244711 ) ) ( not ( = ?auto_244709 ?auto_244710 ) ) ( not ( = ?auto_244709 ?auto_244711 ) ) ( not ( = ?auto_244710 ?auto_244711 ) ) ( ON ?auto_244709 ?auto_244710 ) ( ON ?auto_244708 ?auto_244709 ) ( CLEAR ?auto_244706 ) ( ON ?auto_244707 ?auto_244708 ) ( CLEAR ?auto_244707 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_244702 ?auto_244703 ?auto_244704 ?auto_244705 ?auto_244706 ?auto_244707 )
      ( MAKE-9PILE ?auto_244702 ?auto_244703 ?auto_244704 ?auto_244705 ?auto_244706 ?auto_244707 ?auto_244708 ?auto_244709 ?auto_244710 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_244721 - BLOCK
      ?auto_244722 - BLOCK
      ?auto_244723 - BLOCK
      ?auto_244724 - BLOCK
      ?auto_244725 - BLOCK
      ?auto_244726 - BLOCK
      ?auto_244727 - BLOCK
      ?auto_244728 - BLOCK
      ?auto_244729 - BLOCK
    )
    :vars
    (
      ?auto_244730 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_244729 ?auto_244730 ) ( ON-TABLE ?auto_244721 ) ( ON ?auto_244722 ?auto_244721 ) ( ON ?auto_244723 ?auto_244722 ) ( ON ?auto_244724 ?auto_244723 ) ( not ( = ?auto_244721 ?auto_244722 ) ) ( not ( = ?auto_244721 ?auto_244723 ) ) ( not ( = ?auto_244721 ?auto_244724 ) ) ( not ( = ?auto_244721 ?auto_244725 ) ) ( not ( = ?auto_244721 ?auto_244726 ) ) ( not ( = ?auto_244721 ?auto_244727 ) ) ( not ( = ?auto_244721 ?auto_244728 ) ) ( not ( = ?auto_244721 ?auto_244729 ) ) ( not ( = ?auto_244721 ?auto_244730 ) ) ( not ( = ?auto_244722 ?auto_244723 ) ) ( not ( = ?auto_244722 ?auto_244724 ) ) ( not ( = ?auto_244722 ?auto_244725 ) ) ( not ( = ?auto_244722 ?auto_244726 ) ) ( not ( = ?auto_244722 ?auto_244727 ) ) ( not ( = ?auto_244722 ?auto_244728 ) ) ( not ( = ?auto_244722 ?auto_244729 ) ) ( not ( = ?auto_244722 ?auto_244730 ) ) ( not ( = ?auto_244723 ?auto_244724 ) ) ( not ( = ?auto_244723 ?auto_244725 ) ) ( not ( = ?auto_244723 ?auto_244726 ) ) ( not ( = ?auto_244723 ?auto_244727 ) ) ( not ( = ?auto_244723 ?auto_244728 ) ) ( not ( = ?auto_244723 ?auto_244729 ) ) ( not ( = ?auto_244723 ?auto_244730 ) ) ( not ( = ?auto_244724 ?auto_244725 ) ) ( not ( = ?auto_244724 ?auto_244726 ) ) ( not ( = ?auto_244724 ?auto_244727 ) ) ( not ( = ?auto_244724 ?auto_244728 ) ) ( not ( = ?auto_244724 ?auto_244729 ) ) ( not ( = ?auto_244724 ?auto_244730 ) ) ( not ( = ?auto_244725 ?auto_244726 ) ) ( not ( = ?auto_244725 ?auto_244727 ) ) ( not ( = ?auto_244725 ?auto_244728 ) ) ( not ( = ?auto_244725 ?auto_244729 ) ) ( not ( = ?auto_244725 ?auto_244730 ) ) ( not ( = ?auto_244726 ?auto_244727 ) ) ( not ( = ?auto_244726 ?auto_244728 ) ) ( not ( = ?auto_244726 ?auto_244729 ) ) ( not ( = ?auto_244726 ?auto_244730 ) ) ( not ( = ?auto_244727 ?auto_244728 ) ) ( not ( = ?auto_244727 ?auto_244729 ) ) ( not ( = ?auto_244727 ?auto_244730 ) ) ( not ( = ?auto_244728 ?auto_244729 ) ) ( not ( = ?auto_244728 ?auto_244730 ) ) ( not ( = ?auto_244729 ?auto_244730 ) ) ( ON ?auto_244728 ?auto_244729 ) ( ON ?auto_244727 ?auto_244728 ) ( ON ?auto_244726 ?auto_244727 ) ( CLEAR ?auto_244724 ) ( ON ?auto_244725 ?auto_244726 ) ( CLEAR ?auto_244725 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_244721 ?auto_244722 ?auto_244723 ?auto_244724 ?auto_244725 )
      ( MAKE-9PILE ?auto_244721 ?auto_244722 ?auto_244723 ?auto_244724 ?auto_244725 ?auto_244726 ?auto_244727 ?auto_244728 ?auto_244729 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_244740 - BLOCK
      ?auto_244741 - BLOCK
      ?auto_244742 - BLOCK
      ?auto_244743 - BLOCK
      ?auto_244744 - BLOCK
      ?auto_244745 - BLOCK
      ?auto_244746 - BLOCK
      ?auto_244747 - BLOCK
      ?auto_244748 - BLOCK
    )
    :vars
    (
      ?auto_244749 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_244748 ?auto_244749 ) ( ON-TABLE ?auto_244740 ) ( ON ?auto_244741 ?auto_244740 ) ( ON ?auto_244742 ?auto_244741 ) ( ON ?auto_244743 ?auto_244742 ) ( not ( = ?auto_244740 ?auto_244741 ) ) ( not ( = ?auto_244740 ?auto_244742 ) ) ( not ( = ?auto_244740 ?auto_244743 ) ) ( not ( = ?auto_244740 ?auto_244744 ) ) ( not ( = ?auto_244740 ?auto_244745 ) ) ( not ( = ?auto_244740 ?auto_244746 ) ) ( not ( = ?auto_244740 ?auto_244747 ) ) ( not ( = ?auto_244740 ?auto_244748 ) ) ( not ( = ?auto_244740 ?auto_244749 ) ) ( not ( = ?auto_244741 ?auto_244742 ) ) ( not ( = ?auto_244741 ?auto_244743 ) ) ( not ( = ?auto_244741 ?auto_244744 ) ) ( not ( = ?auto_244741 ?auto_244745 ) ) ( not ( = ?auto_244741 ?auto_244746 ) ) ( not ( = ?auto_244741 ?auto_244747 ) ) ( not ( = ?auto_244741 ?auto_244748 ) ) ( not ( = ?auto_244741 ?auto_244749 ) ) ( not ( = ?auto_244742 ?auto_244743 ) ) ( not ( = ?auto_244742 ?auto_244744 ) ) ( not ( = ?auto_244742 ?auto_244745 ) ) ( not ( = ?auto_244742 ?auto_244746 ) ) ( not ( = ?auto_244742 ?auto_244747 ) ) ( not ( = ?auto_244742 ?auto_244748 ) ) ( not ( = ?auto_244742 ?auto_244749 ) ) ( not ( = ?auto_244743 ?auto_244744 ) ) ( not ( = ?auto_244743 ?auto_244745 ) ) ( not ( = ?auto_244743 ?auto_244746 ) ) ( not ( = ?auto_244743 ?auto_244747 ) ) ( not ( = ?auto_244743 ?auto_244748 ) ) ( not ( = ?auto_244743 ?auto_244749 ) ) ( not ( = ?auto_244744 ?auto_244745 ) ) ( not ( = ?auto_244744 ?auto_244746 ) ) ( not ( = ?auto_244744 ?auto_244747 ) ) ( not ( = ?auto_244744 ?auto_244748 ) ) ( not ( = ?auto_244744 ?auto_244749 ) ) ( not ( = ?auto_244745 ?auto_244746 ) ) ( not ( = ?auto_244745 ?auto_244747 ) ) ( not ( = ?auto_244745 ?auto_244748 ) ) ( not ( = ?auto_244745 ?auto_244749 ) ) ( not ( = ?auto_244746 ?auto_244747 ) ) ( not ( = ?auto_244746 ?auto_244748 ) ) ( not ( = ?auto_244746 ?auto_244749 ) ) ( not ( = ?auto_244747 ?auto_244748 ) ) ( not ( = ?auto_244747 ?auto_244749 ) ) ( not ( = ?auto_244748 ?auto_244749 ) ) ( ON ?auto_244747 ?auto_244748 ) ( ON ?auto_244746 ?auto_244747 ) ( ON ?auto_244745 ?auto_244746 ) ( CLEAR ?auto_244743 ) ( ON ?auto_244744 ?auto_244745 ) ( CLEAR ?auto_244744 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_244740 ?auto_244741 ?auto_244742 ?auto_244743 ?auto_244744 )
      ( MAKE-9PILE ?auto_244740 ?auto_244741 ?auto_244742 ?auto_244743 ?auto_244744 ?auto_244745 ?auto_244746 ?auto_244747 ?auto_244748 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_244759 - BLOCK
      ?auto_244760 - BLOCK
      ?auto_244761 - BLOCK
      ?auto_244762 - BLOCK
      ?auto_244763 - BLOCK
      ?auto_244764 - BLOCK
      ?auto_244765 - BLOCK
      ?auto_244766 - BLOCK
      ?auto_244767 - BLOCK
    )
    :vars
    (
      ?auto_244768 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_244767 ?auto_244768 ) ( ON-TABLE ?auto_244759 ) ( ON ?auto_244760 ?auto_244759 ) ( ON ?auto_244761 ?auto_244760 ) ( not ( = ?auto_244759 ?auto_244760 ) ) ( not ( = ?auto_244759 ?auto_244761 ) ) ( not ( = ?auto_244759 ?auto_244762 ) ) ( not ( = ?auto_244759 ?auto_244763 ) ) ( not ( = ?auto_244759 ?auto_244764 ) ) ( not ( = ?auto_244759 ?auto_244765 ) ) ( not ( = ?auto_244759 ?auto_244766 ) ) ( not ( = ?auto_244759 ?auto_244767 ) ) ( not ( = ?auto_244759 ?auto_244768 ) ) ( not ( = ?auto_244760 ?auto_244761 ) ) ( not ( = ?auto_244760 ?auto_244762 ) ) ( not ( = ?auto_244760 ?auto_244763 ) ) ( not ( = ?auto_244760 ?auto_244764 ) ) ( not ( = ?auto_244760 ?auto_244765 ) ) ( not ( = ?auto_244760 ?auto_244766 ) ) ( not ( = ?auto_244760 ?auto_244767 ) ) ( not ( = ?auto_244760 ?auto_244768 ) ) ( not ( = ?auto_244761 ?auto_244762 ) ) ( not ( = ?auto_244761 ?auto_244763 ) ) ( not ( = ?auto_244761 ?auto_244764 ) ) ( not ( = ?auto_244761 ?auto_244765 ) ) ( not ( = ?auto_244761 ?auto_244766 ) ) ( not ( = ?auto_244761 ?auto_244767 ) ) ( not ( = ?auto_244761 ?auto_244768 ) ) ( not ( = ?auto_244762 ?auto_244763 ) ) ( not ( = ?auto_244762 ?auto_244764 ) ) ( not ( = ?auto_244762 ?auto_244765 ) ) ( not ( = ?auto_244762 ?auto_244766 ) ) ( not ( = ?auto_244762 ?auto_244767 ) ) ( not ( = ?auto_244762 ?auto_244768 ) ) ( not ( = ?auto_244763 ?auto_244764 ) ) ( not ( = ?auto_244763 ?auto_244765 ) ) ( not ( = ?auto_244763 ?auto_244766 ) ) ( not ( = ?auto_244763 ?auto_244767 ) ) ( not ( = ?auto_244763 ?auto_244768 ) ) ( not ( = ?auto_244764 ?auto_244765 ) ) ( not ( = ?auto_244764 ?auto_244766 ) ) ( not ( = ?auto_244764 ?auto_244767 ) ) ( not ( = ?auto_244764 ?auto_244768 ) ) ( not ( = ?auto_244765 ?auto_244766 ) ) ( not ( = ?auto_244765 ?auto_244767 ) ) ( not ( = ?auto_244765 ?auto_244768 ) ) ( not ( = ?auto_244766 ?auto_244767 ) ) ( not ( = ?auto_244766 ?auto_244768 ) ) ( not ( = ?auto_244767 ?auto_244768 ) ) ( ON ?auto_244766 ?auto_244767 ) ( ON ?auto_244765 ?auto_244766 ) ( ON ?auto_244764 ?auto_244765 ) ( ON ?auto_244763 ?auto_244764 ) ( CLEAR ?auto_244761 ) ( ON ?auto_244762 ?auto_244763 ) ( CLEAR ?auto_244762 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_244759 ?auto_244760 ?auto_244761 ?auto_244762 )
      ( MAKE-9PILE ?auto_244759 ?auto_244760 ?auto_244761 ?auto_244762 ?auto_244763 ?auto_244764 ?auto_244765 ?auto_244766 ?auto_244767 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_244778 - BLOCK
      ?auto_244779 - BLOCK
      ?auto_244780 - BLOCK
      ?auto_244781 - BLOCK
      ?auto_244782 - BLOCK
      ?auto_244783 - BLOCK
      ?auto_244784 - BLOCK
      ?auto_244785 - BLOCK
      ?auto_244786 - BLOCK
    )
    :vars
    (
      ?auto_244787 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_244786 ?auto_244787 ) ( ON-TABLE ?auto_244778 ) ( ON ?auto_244779 ?auto_244778 ) ( ON ?auto_244780 ?auto_244779 ) ( not ( = ?auto_244778 ?auto_244779 ) ) ( not ( = ?auto_244778 ?auto_244780 ) ) ( not ( = ?auto_244778 ?auto_244781 ) ) ( not ( = ?auto_244778 ?auto_244782 ) ) ( not ( = ?auto_244778 ?auto_244783 ) ) ( not ( = ?auto_244778 ?auto_244784 ) ) ( not ( = ?auto_244778 ?auto_244785 ) ) ( not ( = ?auto_244778 ?auto_244786 ) ) ( not ( = ?auto_244778 ?auto_244787 ) ) ( not ( = ?auto_244779 ?auto_244780 ) ) ( not ( = ?auto_244779 ?auto_244781 ) ) ( not ( = ?auto_244779 ?auto_244782 ) ) ( not ( = ?auto_244779 ?auto_244783 ) ) ( not ( = ?auto_244779 ?auto_244784 ) ) ( not ( = ?auto_244779 ?auto_244785 ) ) ( not ( = ?auto_244779 ?auto_244786 ) ) ( not ( = ?auto_244779 ?auto_244787 ) ) ( not ( = ?auto_244780 ?auto_244781 ) ) ( not ( = ?auto_244780 ?auto_244782 ) ) ( not ( = ?auto_244780 ?auto_244783 ) ) ( not ( = ?auto_244780 ?auto_244784 ) ) ( not ( = ?auto_244780 ?auto_244785 ) ) ( not ( = ?auto_244780 ?auto_244786 ) ) ( not ( = ?auto_244780 ?auto_244787 ) ) ( not ( = ?auto_244781 ?auto_244782 ) ) ( not ( = ?auto_244781 ?auto_244783 ) ) ( not ( = ?auto_244781 ?auto_244784 ) ) ( not ( = ?auto_244781 ?auto_244785 ) ) ( not ( = ?auto_244781 ?auto_244786 ) ) ( not ( = ?auto_244781 ?auto_244787 ) ) ( not ( = ?auto_244782 ?auto_244783 ) ) ( not ( = ?auto_244782 ?auto_244784 ) ) ( not ( = ?auto_244782 ?auto_244785 ) ) ( not ( = ?auto_244782 ?auto_244786 ) ) ( not ( = ?auto_244782 ?auto_244787 ) ) ( not ( = ?auto_244783 ?auto_244784 ) ) ( not ( = ?auto_244783 ?auto_244785 ) ) ( not ( = ?auto_244783 ?auto_244786 ) ) ( not ( = ?auto_244783 ?auto_244787 ) ) ( not ( = ?auto_244784 ?auto_244785 ) ) ( not ( = ?auto_244784 ?auto_244786 ) ) ( not ( = ?auto_244784 ?auto_244787 ) ) ( not ( = ?auto_244785 ?auto_244786 ) ) ( not ( = ?auto_244785 ?auto_244787 ) ) ( not ( = ?auto_244786 ?auto_244787 ) ) ( ON ?auto_244785 ?auto_244786 ) ( ON ?auto_244784 ?auto_244785 ) ( ON ?auto_244783 ?auto_244784 ) ( ON ?auto_244782 ?auto_244783 ) ( CLEAR ?auto_244780 ) ( ON ?auto_244781 ?auto_244782 ) ( CLEAR ?auto_244781 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_244778 ?auto_244779 ?auto_244780 ?auto_244781 )
      ( MAKE-9PILE ?auto_244778 ?auto_244779 ?auto_244780 ?auto_244781 ?auto_244782 ?auto_244783 ?auto_244784 ?auto_244785 ?auto_244786 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_244797 - BLOCK
      ?auto_244798 - BLOCK
      ?auto_244799 - BLOCK
      ?auto_244800 - BLOCK
      ?auto_244801 - BLOCK
      ?auto_244802 - BLOCK
      ?auto_244803 - BLOCK
      ?auto_244804 - BLOCK
      ?auto_244805 - BLOCK
    )
    :vars
    (
      ?auto_244806 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_244805 ?auto_244806 ) ( ON-TABLE ?auto_244797 ) ( ON ?auto_244798 ?auto_244797 ) ( not ( = ?auto_244797 ?auto_244798 ) ) ( not ( = ?auto_244797 ?auto_244799 ) ) ( not ( = ?auto_244797 ?auto_244800 ) ) ( not ( = ?auto_244797 ?auto_244801 ) ) ( not ( = ?auto_244797 ?auto_244802 ) ) ( not ( = ?auto_244797 ?auto_244803 ) ) ( not ( = ?auto_244797 ?auto_244804 ) ) ( not ( = ?auto_244797 ?auto_244805 ) ) ( not ( = ?auto_244797 ?auto_244806 ) ) ( not ( = ?auto_244798 ?auto_244799 ) ) ( not ( = ?auto_244798 ?auto_244800 ) ) ( not ( = ?auto_244798 ?auto_244801 ) ) ( not ( = ?auto_244798 ?auto_244802 ) ) ( not ( = ?auto_244798 ?auto_244803 ) ) ( not ( = ?auto_244798 ?auto_244804 ) ) ( not ( = ?auto_244798 ?auto_244805 ) ) ( not ( = ?auto_244798 ?auto_244806 ) ) ( not ( = ?auto_244799 ?auto_244800 ) ) ( not ( = ?auto_244799 ?auto_244801 ) ) ( not ( = ?auto_244799 ?auto_244802 ) ) ( not ( = ?auto_244799 ?auto_244803 ) ) ( not ( = ?auto_244799 ?auto_244804 ) ) ( not ( = ?auto_244799 ?auto_244805 ) ) ( not ( = ?auto_244799 ?auto_244806 ) ) ( not ( = ?auto_244800 ?auto_244801 ) ) ( not ( = ?auto_244800 ?auto_244802 ) ) ( not ( = ?auto_244800 ?auto_244803 ) ) ( not ( = ?auto_244800 ?auto_244804 ) ) ( not ( = ?auto_244800 ?auto_244805 ) ) ( not ( = ?auto_244800 ?auto_244806 ) ) ( not ( = ?auto_244801 ?auto_244802 ) ) ( not ( = ?auto_244801 ?auto_244803 ) ) ( not ( = ?auto_244801 ?auto_244804 ) ) ( not ( = ?auto_244801 ?auto_244805 ) ) ( not ( = ?auto_244801 ?auto_244806 ) ) ( not ( = ?auto_244802 ?auto_244803 ) ) ( not ( = ?auto_244802 ?auto_244804 ) ) ( not ( = ?auto_244802 ?auto_244805 ) ) ( not ( = ?auto_244802 ?auto_244806 ) ) ( not ( = ?auto_244803 ?auto_244804 ) ) ( not ( = ?auto_244803 ?auto_244805 ) ) ( not ( = ?auto_244803 ?auto_244806 ) ) ( not ( = ?auto_244804 ?auto_244805 ) ) ( not ( = ?auto_244804 ?auto_244806 ) ) ( not ( = ?auto_244805 ?auto_244806 ) ) ( ON ?auto_244804 ?auto_244805 ) ( ON ?auto_244803 ?auto_244804 ) ( ON ?auto_244802 ?auto_244803 ) ( ON ?auto_244801 ?auto_244802 ) ( ON ?auto_244800 ?auto_244801 ) ( CLEAR ?auto_244798 ) ( ON ?auto_244799 ?auto_244800 ) ( CLEAR ?auto_244799 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_244797 ?auto_244798 ?auto_244799 )
      ( MAKE-9PILE ?auto_244797 ?auto_244798 ?auto_244799 ?auto_244800 ?auto_244801 ?auto_244802 ?auto_244803 ?auto_244804 ?auto_244805 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_244816 - BLOCK
      ?auto_244817 - BLOCK
      ?auto_244818 - BLOCK
      ?auto_244819 - BLOCK
      ?auto_244820 - BLOCK
      ?auto_244821 - BLOCK
      ?auto_244822 - BLOCK
      ?auto_244823 - BLOCK
      ?auto_244824 - BLOCK
    )
    :vars
    (
      ?auto_244825 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_244824 ?auto_244825 ) ( ON-TABLE ?auto_244816 ) ( ON ?auto_244817 ?auto_244816 ) ( not ( = ?auto_244816 ?auto_244817 ) ) ( not ( = ?auto_244816 ?auto_244818 ) ) ( not ( = ?auto_244816 ?auto_244819 ) ) ( not ( = ?auto_244816 ?auto_244820 ) ) ( not ( = ?auto_244816 ?auto_244821 ) ) ( not ( = ?auto_244816 ?auto_244822 ) ) ( not ( = ?auto_244816 ?auto_244823 ) ) ( not ( = ?auto_244816 ?auto_244824 ) ) ( not ( = ?auto_244816 ?auto_244825 ) ) ( not ( = ?auto_244817 ?auto_244818 ) ) ( not ( = ?auto_244817 ?auto_244819 ) ) ( not ( = ?auto_244817 ?auto_244820 ) ) ( not ( = ?auto_244817 ?auto_244821 ) ) ( not ( = ?auto_244817 ?auto_244822 ) ) ( not ( = ?auto_244817 ?auto_244823 ) ) ( not ( = ?auto_244817 ?auto_244824 ) ) ( not ( = ?auto_244817 ?auto_244825 ) ) ( not ( = ?auto_244818 ?auto_244819 ) ) ( not ( = ?auto_244818 ?auto_244820 ) ) ( not ( = ?auto_244818 ?auto_244821 ) ) ( not ( = ?auto_244818 ?auto_244822 ) ) ( not ( = ?auto_244818 ?auto_244823 ) ) ( not ( = ?auto_244818 ?auto_244824 ) ) ( not ( = ?auto_244818 ?auto_244825 ) ) ( not ( = ?auto_244819 ?auto_244820 ) ) ( not ( = ?auto_244819 ?auto_244821 ) ) ( not ( = ?auto_244819 ?auto_244822 ) ) ( not ( = ?auto_244819 ?auto_244823 ) ) ( not ( = ?auto_244819 ?auto_244824 ) ) ( not ( = ?auto_244819 ?auto_244825 ) ) ( not ( = ?auto_244820 ?auto_244821 ) ) ( not ( = ?auto_244820 ?auto_244822 ) ) ( not ( = ?auto_244820 ?auto_244823 ) ) ( not ( = ?auto_244820 ?auto_244824 ) ) ( not ( = ?auto_244820 ?auto_244825 ) ) ( not ( = ?auto_244821 ?auto_244822 ) ) ( not ( = ?auto_244821 ?auto_244823 ) ) ( not ( = ?auto_244821 ?auto_244824 ) ) ( not ( = ?auto_244821 ?auto_244825 ) ) ( not ( = ?auto_244822 ?auto_244823 ) ) ( not ( = ?auto_244822 ?auto_244824 ) ) ( not ( = ?auto_244822 ?auto_244825 ) ) ( not ( = ?auto_244823 ?auto_244824 ) ) ( not ( = ?auto_244823 ?auto_244825 ) ) ( not ( = ?auto_244824 ?auto_244825 ) ) ( ON ?auto_244823 ?auto_244824 ) ( ON ?auto_244822 ?auto_244823 ) ( ON ?auto_244821 ?auto_244822 ) ( ON ?auto_244820 ?auto_244821 ) ( ON ?auto_244819 ?auto_244820 ) ( CLEAR ?auto_244817 ) ( ON ?auto_244818 ?auto_244819 ) ( CLEAR ?auto_244818 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_244816 ?auto_244817 ?auto_244818 )
      ( MAKE-9PILE ?auto_244816 ?auto_244817 ?auto_244818 ?auto_244819 ?auto_244820 ?auto_244821 ?auto_244822 ?auto_244823 ?auto_244824 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_244835 - BLOCK
      ?auto_244836 - BLOCK
      ?auto_244837 - BLOCK
      ?auto_244838 - BLOCK
      ?auto_244839 - BLOCK
      ?auto_244840 - BLOCK
      ?auto_244841 - BLOCK
      ?auto_244842 - BLOCK
      ?auto_244843 - BLOCK
    )
    :vars
    (
      ?auto_244844 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_244843 ?auto_244844 ) ( ON-TABLE ?auto_244835 ) ( not ( = ?auto_244835 ?auto_244836 ) ) ( not ( = ?auto_244835 ?auto_244837 ) ) ( not ( = ?auto_244835 ?auto_244838 ) ) ( not ( = ?auto_244835 ?auto_244839 ) ) ( not ( = ?auto_244835 ?auto_244840 ) ) ( not ( = ?auto_244835 ?auto_244841 ) ) ( not ( = ?auto_244835 ?auto_244842 ) ) ( not ( = ?auto_244835 ?auto_244843 ) ) ( not ( = ?auto_244835 ?auto_244844 ) ) ( not ( = ?auto_244836 ?auto_244837 ) ) ( not ( = ?auto_244836 ?auto_244838 ) ) ( not ( = ?auto_244836 ?auto_244839 ) ) ( not ( = ?auto_244836 ?auto_244840 ) ) ( not ( = ?auto_244836 ?auto_244841 ) ) ( not ( = ?auto_244836 ?auto_244842 ) ) ( not ( = ?auto_244836 ?auto_244843 ) ) ( not ( = ?auto_244836 ?auto_244844 ) ) ( not ( = ?auto_244837 ?auto_244838 ) ) ( not ( = ?auto_244837 ?auto_244839 ) ) ( not ( = ?auto_244837 ?auto_244840 ) ) ( not ( = ?auto_244837 ?auto_244841 ) ) ( not ( = ?auto_244837 ?auto_244842 ) ) ( not ( = ?auto_244837 ?auto_244843 ) ) ( not ( = ?auto_244837 ?auto_244844 ) ) ( not ( = ?auto_244838 ?auto_244839 ) ) ( not ( = ?auto_244838 ?auto_244840 ) ) ( not ( = ?auto_244838 ?auto_244841 ) ) ( not ( = ?auto_244838 ?auto_244842 ) ) ( not ( = ?auto_244838 ?auto_244843 ) ) ( not ( = ?auto_244838 ?auto_244844 ) ) ( not ( = ?auto_244839 ?auto_244840 ) ) ( not ( = ?auto_244839 ?auto_244841 ) ) ( not ( = ?auto_244839 ?auto_244842 ) ) ( not ( = ?auto_244839 ?auto_244843 ) ) ( not ( = ?auto_244839 ?auto_244844 ) ) ( not ( = ?auto_244840 ?auto_244841 ) ) ( not ( = ?auto_244840 ?auto_244842 ) ) ( not ( = ?auto_244840 ?auto_244843 ) ) ( not ( = ?auto_244840 ?auto_244844 ) ) ( not ( = ?auto_244841 ?auto_244842 ) ) ( not ( = ?auto_244841 ?auto_244843 ) ) ( not ( = ?auto_244841 ?auto_244844 ) ) ( not ( = ?auto_244842 ?auto_244843 ) ) ( not ( = ?auto_244842 ?auto_244844 ) ) ( not ( = ?auto_244843 ?auto_244844 ) ) ( ON ?auto_244842 ?auto_244843 ) ( ON ?auto_244841 ?auto_244842 ) ( ON ?auto_244840 ?auto_244841 ) ( ON ?auto_244839 ?auto_244840 ) ( ON ?auto_244838 ?auto_244839 ) ( ON ?auto_244837 ?auto_244838 ) ( CLEAR ?auto_244835 ) ( ON ?auto_244836 ?auto_244837 ) ( CLEAR ?auto_244836 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_244835 ?auto_244836 )
      ( MAKE-9PILE ?auto_244835 ?auto_244836 ?auto_244837 ?auto_244838 ?auto_244839 ?auto_244840 ?auto_244841 ?auto_244842 ?auto_244843 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_244854 - BLOCK
      ?auto_244855 - BLOCK
      ?auto_244856 - BLOCK
      ?auto_244857 - BLOCK
      ?auto_244858 - BLOCK
      ?auto_244859 - BLOCK
      ?auto_244860 - BLOCK
      ?auto_244861 - BLOCK
      ?auto_244862 - BLOCK
    )
    :vars
    (
      ?auto_244863 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_244862 ?auto_244863 ) ( ON-TABLE ?auto_244854 ) ( not ( = ?auto_244854 ?auto_244855 ) ) ( not ( = ?auto_244854 ?auto_244856 ) ) ( not ( = ?auto_244854 ?auto_244857 ) ) ( not ( = ?auto_244854 ?auto_244858 ) ) ( not ( = ?auto_244854 ?auto_244859 ) ) ( not ( = ?auto_244854 ?auto_244860 ) ) ( not ( = ?auto_244854 ?auto_244861 ) ) ( not ( = ?auto_244854 ?auto_244862 ) ) ( not ( = ?auto_244854 ?auto_244863 ) ) ( not ( = ?auto_244855 ?auto_244856 ) ) ( not ( = ?auto_244855 ?auto_244857 ) ) ( not ( = ?auto_244855 ?auto_244858 ) ) ( not ( = ?auto_244855 ?auto_244859 ) ) ( not ( = ?auto_244855 ?auto_244860 ) ) ( not ( = ?auto_244855 ?auto_244861 ) ) ( not ( = ?auto_244855 ?auto_244862 ) ) ( not ( = ?auto_244855 ?auto_244863 ) ) ( not ( = ?auto_244856 ?auto_244857 ) ) ( not ( = ?auto_244856 ?auto_244858 ) ) ( not ( = ?auto_244856 ?auto_244859 ) ) ( not ( = ?auto_244856 ?auto_244860 ) ) ( not ( = ?auto_244856 ?auto_244861 ) ) ( not ( = ?auto_244856 ?auto_244862 ) ) ( not ( = ?auto_244856 ?auto_244863 ) ) ( not ( = ?auto_244857 ?auto_244858 ) ) ( not ( = ?auto_244857 ?auto_244859 ) ) ( not ( = ?auto_244857 ?auto_244860 ) ) ( not ( = ?auto_244857 ?auto_244861 ) ) ( not ( = ?auto_244857 ?auto_244862 ) ) ( not ( = ?auto_244857 ?auto_244863 ) ) ( not ( = ?auto_244858 ?auto_244859 ) ) ( not ( = ?auto_244858 ?auto_244860 ) ) ( not ( = ?auto_244858 ?auto_244861 ) ) ( not ( = ?auto_244858 ?auto_244862 ) ) ( not ( = ?auto_244858 ?auto_244863 ) ) ( not ( = ?auto_244859 ?auto_244860 ) ) ( not ( = ?auto_244859 ?auto_244861 ) ) ( not ( = ?auto_244859 ?auto_244862 ) ) ( not ( = ?auto_244859 ?auto_244863 ) ) ( not ( = ?auto_244860 ?auto_244861 ) ) ( not ( = ?auto_244860 ?auto_244862 ) ) ( not ( = ?auto_244860 ?auto_244863 ) ) ( not ( = ?auto_244861 ?auto_244862 ) ) ( not ( = ?auto_244861 ?auto_244863 ) ) ( not ( = ?auto_244862 ?auto_244863 ) ) ( ON ?auto_244861 ?auto_244862 ) ( ON ?auto_244860 ?auto_244861 ) ( ON ?auto_244859 ?auto_244860 ) ( ON ?auto_244858 ?auto_244859 ) ( ON ?auto_244857 ?auto_244858 ) ( ON ?auto_244856 ?auto_244857 ) ( CLEAR ?auto_244854 ) ( ON ?auto_244855 ?auto_244856 ) ( CLEAR ?auto_244855 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_244854 ?auto_244855 )
      ( MAKE-9PILE ?auto_244854 ?auto_244855 ?auto_244856 ?auto_244857 ?auto_244858 ?auto_244859 ?auto_244860 ?auto_244861 ?auto_244862 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_244873 - BLOCK
      ?auto_244874 - BLOCK
      ?auto_244875 - BLOCK
      ?auto_244876 - BLOCK
      ?auto_244877 - BLOCK
      ?auto_244878 - BLOCK
      ?auto_244879 - BLOCK
      ?auto_244880 - BLOCK
      ?auto_244881 - BLOCK
    )
    :vars
    (
      ?auto_244882 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_244881 ?auto_244882 ) ( not ( = ?auto_244873 ?auto_244874 ) ) ( not ( = ?auto_244873 ?auto_244875 ) ) ( not ( = ?auto_244873 ?auto_244876 ) ) ( not ( = ?auto_244873 ?auto_244877 ) ) ( not ( = ?auto_244873 ?auto_244878 ) ) ( not ( = ?auto_244873 ?auto_244879 ) ) ( not ( = ?auto_244873 ?auto_244880 ) ) ( not ( = ?auto_244873 ?auto_244881 ) ) ( not ( = ?auto_244873 ?auto_244882 ) ) ( not ( = ?auto_244874 ?auto_244875 ) ) ( not ( = ?auto_244874 ?auto_244876 ) ) ( not ( = ?auto_244874 ?auto_244877 ) ) ( not ( = ?auto_244874 ?auto_244878 ) ) ( not ( = ?auto_244874 ?auto_244879 ) ) ( not ( = ?auto_244874 ?auto_244880 ) ) ( not ( = ?auto_244874 ?auto_244881 ) ) ( not ( = ?auto_244874 ?auto_244882 ) ) ( not ( = ?auto_244875 ?auto_244876 ) ) ( not ( = ?auto_244875 ?auto_244877 ) ) ( not ( = ?auto_244875 ?auto_244878 ) ) ( not ( = ?auto_244875 ?auto_244879 ) ) ( not ( = ?auto_244875 ?auto_244880 ) ) ( not ( = ?auto_244875 ?auto_244881 ) ) ( not ( = ?auto_244875 ?auto_244882 ) ) ( not ( = ?auto_244876 ?auto_244877 ) ) ( not ( = ?auto_244876 ?auto_244878 ) ) ( not ( = ?auto_244876 ?auto_244879 ) ) ( not ( = ?auto_244876 ?auto_244880 ) ) ( not ( = ?auto_244876 ?auto_244881 ) ) ( not ( = ?auto_244876 ?auto_244882 ) ) ( not ( = ?auto_244877 ?auto_244878 ) ) ( not ( = ?auto_244877 ?auto_244879 ) ) ( not ( = ?auto_244877 ?auto_244880 ) ) ( not ( = ?auto_244877 ?auto_244881 ) ) ( not ( = ?auto_244877 ?auto_244882 ) ) ( not ( = ?auto_244878 ?auto_244879 ) ) ( not ( = ?auto_244878 ?auto_244880 ) ) ( not ( = ?auto_244878 ?auto_244881 ) ) ( not ( = ?auto_244878 ?auto_244882 ) ) ( not ( = ?auto_244879 ?auto_244880 ) ) ( not ( = ?auto_244879 ?auto_244881 ) ) ( not ( = ?auto_244879 ?auto_244882 ) ) ( not ( = ?auto_244880 ?auto_244881 ) ) ( not ( = ?auto_244880 ?auto_244882 ) ) ( not ( = ?auto_244881 ?auto_244882 ) ) ( ON ?auto_244880 ?auto_244881 ) ( ON ?auto_244879 ?auto_244880 ) ( ON ?auto_244878 ?auto_244879 ) ( ON ?auto_244877 ?auto_244878 ) ( ON ?auto_244876 ?auto_244877 ) ( ON ?auto_244875 ?auto_244876 ) ( ON ?auto_244874 ?auto_244875 ) ( ON ?auto_244873 ?auto_244874 ) ( CLEAR ?auto_244873 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_244873 )
      ( MAKE-9PILE ?auto_244873 ?auto_244874 ?auto_244875 ?auto_244876 ?auto_244877 ?auto_244878 ?auto_244879 ?auto_244880 ?auto_244881 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_244892 - BLOCK
      ?auto_244893 - BLOCK
      ?auto_244894 - BLOCK
      ?auto_244895 - BLOCK
      ?auto_244896 - BLOCK
      ?auto_244897 - BLOCK
      ?auto_244898 - BLOCK
      ?auto_244899 - BLOCK
      ?auto_244900 - BLOCK
    )
    :vars
    (
      ?auto_244901 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_244900 ?auto_244901 ) ( not ( = ?auto_244892 ?auto_244893 ) ) ( not ( = ?auto_244892 ?auto_244894 ) ) ( not ( = ?auto_244892 ?auto_244895 ) ) ( not ( = ?auto_244892 ?auto_244896 ) ) ( not ( = ?auto_244892 ?auto_244897 ) ) ( not ( = ?auto_244892 ?auto_244898 ) ) ( not ( = ?auto_244892 ?auto_244899 ) ) ( not ( = ?auto_244892 ?auto_244900 ) ) ( not ( = ?auto_244892 ?auto_244901 ) ) ( not ( = ?auto_244893 ?auto_244894 ) ) ( not ( = ?auto_244893 ?auto_244895 ) ) ( not ( = ?auto_244893 ?auto_244896 ) ) ( not ( = ?auto_244893 ?auto_244897 ) ) ( not ( = ?auto_244893 ?auto_244898 ) ) ( not ( = ?auto_244893 ?auto_244899 ) ) ( not ( = ?auto_244893 ?auto_244900 ) ) ( not ( = ?auto_244893 ?auto_244901 ) ) ( not ( = ?auto_244894 ?auto_244895 ) ) ( not ( = ?auto_244894 ?auto_244896 ) ) ( not ( = ?auto_244894 ?auto_244897 ) ) ( not ( = ?auto_244894 ?auto_244898 ) ) ( not ( = ?auto_244894 ?auto_244899 ) ) ( not ( = ?auto_244894 ?auto_244900 ) ) ( not ( = ?auto_244894 ?auto_244901 ) ) ( not ( = ?auto_244895 ?auto_244896 ) ) ( not ( = ?auto_244895 ?auto_244897 ) ) ( not ( = ?auto_244895 ?auto_244898 ) ) ( not ( = ?auto_244895 ?auto_244899 ) ) ( not ( = ?auto_244895 ?auto_244900 ) ) ( not ( = ?auto_244895 ?auto_244901 ) ) ( not ( = ?auto_244896 ?auto_244897 ) ) ( not ( = ?auto_244896 ?auto_244898 ) ) ( not ( = ?auto_244896 ?auto_244899 ) ) ( not ( = ?auto_244896 ?auto_244900 ) ) ( not ( = ?auto_244896 ?auto_244901 ) ) ( not ( = ?auto_244897 ?auto_244898 ) ) ( not ( = ?auto_244897 ?auto_244899 ) ) ( not ( = ?auto_244897 ?auto_244900 ) ) ( not ( = ?auto_244897 ?auto_244901 ) ) ( not ( = ?auto_244898 ?auto_244899 ) ) ( not ( = ?auto_244898 ?auto_244900 ) ) ( not ( = ?auto_244898 ?auto_244901 ) ) ( not ( = ?auto_244899 ?auto_244900 ) ) ( not ( = ?auto_244899 ?auto_244901 ) ) ( not ( = ?auto_244900 ?auto_244901 ) ) ( ON ?auto_244899 ?auto_244900 ) ( ON ?auto_244898 ?auto_244899 ) ( ON ?auto_244897 ?auto_244898 ) ( ON ?auto_244896 ?auto_244897 ) ( ON ?auto_244895 ?auto_244896 ) ( ON ?auto_244894 ?auto_244895 ) ( ON ?auto_244893 ?auto_244894 ) ( ON ?auto_244892 ?auto_244893 ) ( CLEAR ?auto_244892 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_244892 )
      ( MAKE-9PILE ?auto_244892 ?auto_244893 ?auto_244894 ?auto_244895 ?auto_244896 ?auto_244897 ?auto_244898 ?auto_244899 ?auto_244900 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_244912 - BLOCK
      ?auto_244913 - BLOCK
      ?auto_244914 - BLOCK
      ?auto_244915 - BLOCK
      ?auto_244916 - BLOCK
      ?auto_244917 - BLOCK
      ?auto_244918 - BLOCK
      ?auto_244919 - BLOCK
      ?auto_244920 - BLOCK
      ?auto_244921 - BLOCK
    )
    :vars
    (
      ?auto_244922 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_244920 ) ( ON ?auto_244921 ?auto_244922 ) ( CLEAR ?auto_244921 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_244912 ) ( ON ?auto_244913 ?auto_244912 ) ( ON ?auto_244914 ?auto_244913 ) ( ON ?auto_244915 ?auto_244914 ) ( ON ?auto_244916 ?auto_244915 ) ( ON ?auto_244917 ?auto_244916 ) ( ON ?auto_244918 ?auto_244917 ) ( ON ?auto_244919 ?auto_244918 ) ( ON ?auto_244920 ?auto_244919 ) ( not ( = ?auto_244912 ?auto_244913 ) ) ( not ( = ?auto_244912 ?auto_244914 ) ) ( not ( = ?auto_244912 ?auto_244915 ) ) ( not ( = ?auto_244912 ?auto_244916 ) ) ( not ( = ?auto_244912 ?auto_244917 ) ) ( not ( = ?auto_244912 ?auto_244918 ) ) ( not ( = ?auto_244912 ?auto_244919 ) ) ( not ( = ?auto_244912 ?auto_244920 ) ) ( not ( = ?auto_244912 ?auto_244921 ) ) ( not ( = ?auto_244912 ?auto_244922 ) ) ( not ( = ?auto_244913 ?auto_244914 ) ) ( not ( = ?auto_244913 ?auto_244915 ) ) ( not ( = ?auto_244913 ?auto_244916 ) ) ( not ( = ?auto_244913 ?auto_244917 ) ) ( not ( = ?auto_244913 ?auto_244918 ) ) ( not ( = ?auto_244913 ?auto_244919 ) ) ( not ( = ?auto_244913 ?auto_244920 ) ) ( not ( = ?auto_244913 ?auto_244921 ) ) ( not ( = ?auto_244913 ?auto_244922 ) ) ( not ( = ?auto_244914 ?auto_244915 ) ) ( not ( = ?auto_244914 ?auto_244916 ) ) ( not ( = ?auto_244914 ?auto_244917 ) ) ( not ( = ?auto_244914 ?auto_244918 ) ) ( not ( = ?auto_244914 ?auto_244919 ) ) ( not ( = ?auto_244914 ?auto_244920 ) ) ( not ( = ?auto_244914 ?auto_244921 ) ) ( not ( = ?auto_244914 ?auto_244922 ) ) ( not ( = ?auto_244915 ?auto_244916 ) ) ( not ( = ?auto_244915 ?auto_244917 ) ) ( not ( = ?auto_244915 ?auto_244918 ) ) ( not ( = ?auto_244915 ?auto_244919 ) ) ( not ( = ?auto_244915 ?auto_244920 ) ) ( not ( = ?auto_244915 ?auto_244921 ) ) ( not ( = ?auto_244915 ?auto_244922 ) ) ( not ( = ?auto_244916 ?auto_244917 ) ) ( not ( = ?auto_244916 ?auto_244918 ) ) ( not ( = ?auto_244916 ?auto_244919 ) ) ( not ( = ?auto_244916 ?auto_244920 ) ) ( not ( = ?auto_244916 ?auto_244921 ) ) ( not ( = ?auto_244916 ?auto_244922 ) ) ( not ( = ?auto_244917 ?auto_244918 ) ) ( not ( = ?auto_244917 ?auto_244919 ) ) ( not ( = ?auto_244917 ?auto_244920 ) ) ( not ( = ?auto_244917 ?auto_244921 ) ) ( not ( = ?auto_244917 ?auto_244922 ) ) ( not ( = ?auto_244918 ?auto_244919 ) ) ( not ( = ?auto_244918 ?auto_244920 ) ) ( not ( = ?auto_244918 ?auto_244921 ) ) ( not ( = ?auto_244918 ?auto_244922 ) ) ( not ( = ?auto_244919 ?auto_244920 ) ) ( not ( = ?auto_244919 ?auto_244921 ) ) ( not ( = ?auto_244919 ?auto_244922 ) ) ( not ( = ?auto_244920 ?auto_244921 ) ) ( not ( = ?auto_244920 ?auto_244922 ) ) ( not ( = ?auto_244921 ?auto_244922 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_244921 ?auto_244922 )
      ( !STACK ?auto_244921 ?auto_244920 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_244933 - BLOCK
      ?auto_244934 - BLOCK
      ?auto_244935 - BLOCK
      ?auto_244936 - BLOCK
      ?auto_244937 - BLOCK
      ?auto_244938 - BLOCK
      ?auto_244939 - BLOCK
      ?auto_244940 - BLOCK
      ?auto_244941 - BLOCK
      ?auto_244942 - BLOCK
    )
    :vars
    (
      ?auto_244943 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_244941 ) ( ON ?auto_244942 ?auto_244943 ) ( CLEAR ?auto_244942 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_244933 ) ( ON ?auto_244934 ?auto_244933 ) ( ON ?auto_244935 ?auto_244934 ) ( ON ?auto_244936 ?auto_244935 ) ( ON ?auto_244937 ?auto_244936 ) ( ON ?auto_244938 ?auto_244937 ) ( ON ?auto_244939 ?auto_244938 ) ( ON ?auto_244940 ?auto_244939 ) ( ON ?auto_244941 ?auto_244940 ) ( not ( = ?auto_244933 ?auto_244934 ) ) ( not ( = ?auto_244933 ?auto_244935 ) ) ( not ( = ?auto_244933 ?auto_244936 ) ) ( not ( = ?auto_244933 ?auto_244937 ) ) ( not ( = ?auto_244933 ?auto_244938 ) ) ( not ( = ?auto_244933 ?auto_244939 ) ) ( not ( = ?auto_244933 ?auto_244940 ) ) ( not ( = ?auto_244933 ?auto_244941 ) ) ( not ( = ?auto_244933 ?auto_244942 ) ) ( not ( = ?auto_244933 ?auto_244943 ) ) ( not ( = ?auto_244934 ?auto_244935 ) ) ( not ( = ?auto_244934 ?auto_244936 ) ) ( not ( = ?auto_244934 ?auto_244937 ) ) ( not ( = ?auto_244934 ?auto_244938 ) ) ( not ( = ?auto_244934 ?auto_244939 ) ) ( not ( = ?auto_244934 ?auto_244940 ) ) ( not ( = ?auto_244934 ?auto_244941 ) ) ( not ( = ?auto_244934 ?auto_244942 ) ) ( not ( = ?auto_244934 ?auto_244943 ) ) ( not ( = ?auto_244935 ?auto_244936 ) ) ( not ( = ?auto_244935 ?auto_244937 ) ) ( not ( = ?auto_244935 ?auto_244938 ) ) ( not ( = ?auto_244935 ?auto_244939 ) ) ( not ( = ?auto_244935 ?auto_244940 ) ) ( not ( = ?auto_244935 ?auto_244941 ) ) ( not ( = ?auto_244935 ?auto_244942 ) ) ( not ( = ?auto_244935 ?auto_244943 ) ) ( not ( = ?auto_244936 ?auto_244937 ) ) ( not ( = ?auto_244936 ?auto_244938 ) ) ( not ( = ?auto_244936 ?auto_244939 ) ) ( not ( = ?auto_244936 ?auto_244940 ) ) ( not ( = ?auto_244936 ?auto_244941 ) ) ( not ( = ?auto_244936 ?auto_244942 ) ) ( not ( = ?auto_244936 ?auto_244943 ) ) ( not ( = ?auto_244937 ?auto_244938 ) ) ( not ( = ?auto_244937 ?auto_244939 ) ) ( not ( = ?auto_244937 ?auto_244940 ) ) ( not ( = ?auto_244937 ?auto_244941 ) ) ( not ( = ?auto_244937 ?auto_244942 ) ) ( not ( = ?auto_244937 ?auto_244943 ) ) ( not ( = ?auto_244938 ?auto_244939 ) ) ( not ( = ?auto_244938 ?auto_244940 ) ) ( not ( = ?auto_244938 ?auto_244941 ) ) ( not ( = ?auto_244938 ?auto_244942 ) ) ( not ( = ?auto_244938 ?auto_244943 ) ) ( not ( = ?auto_244939 ?auto_244940 ) ) ( not ( = ?auto_244939 ?auto_244941 ) ) ( not ( = ?auto_244939 ?auto_244942 ) ) ( not ( = ?auto_244939 ?auto_244943 ) ) ( not ( = ?auto_244940 ?auto_244941 ) ) ( not ( = ?auto_244940 ?auto_244942 ) ) ( not ( = ?auto_244940 ?auto_244943 ) ) ( not ( = ?auto_244941 ?auto_244942 ) ) ( not ( = ?auto_244941 ?auto_244943 ) ) ( not ( = ?auto_244942 ?auto_244943 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_244942 ?auto_244943 )
      ( !STACK ?auto_244942 ?auto_244941 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_244954 - BLOCK
      ?auto_244955 - BLOCK
      ?auto_244956 - BLOCK
      ?auto_244957 - BLOCK
      ?auto_244958 - BLOCK
      ?auto_244959 - BLOCK
      ?auto_244960 - BLOCK
      ?auto_244961 - BLOCK
      ?auto_244962 - BLOCK
      ?auto_244963 - BLOCK
    )
    :vars
    (
      ?auto_244964 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_244963 ?auto_244964 ) ( ON-TABLE ?auto_244954 ) ( ON ?auto_244955 ?auto_244954 ) ( ON ?auto_244956 ?auto_244955 ) ( ON ?auto_244957 ?auto_244956 ) ( ON ?auto_244958 ?auto_244957 ) ( ON ?auto_244959 ?auto_244958 ) ( ON ?auto_244960 ?auto_244959 ) ( ON ?auto_244961 ?auto_244960 ) ( not ( = ?auto_244954 ?auto_244955 ) ) ( not ( = ?auto_244954 ?auto_244956 ) ) ( not ( = ?auto_244954 ?auto_244957 ) ) ( not ( = ?auto_244954 ?auto_244958 ) ) ( not ( = ?auto_244954 ?auto_244959 ) ) ( not ( = ?auto_244954 ?auto_244960 ) ) ( not ( = ?auto_244954 ?auto_244961 ) ) ( not ( = ?auto_244954 ?auto_244962 ) ) ( not ( = ?auto_244954 ?auto_244963 ) ) ( not ( = ?auto_244954 ?auto_244964 ) ) ( not ( = ?auto_244955 ?auto_244956 ) ) ( not ( = ?auto_244955 ?auto_244957 ) ) ( not ( = ?auto_244955 ?auto_244958 ) ) ( not ( = ?auto_244955 ?auto_244959 ) ) ( not ( = ?auto_244955 ?auto_244960 ) ) ( not ( = ?auto_244955 ?auto_244961 ) ) ( not ( = ?auto_244955 ?auto_244962 ) ) ( not ( = ?auto_244955 ?auto_244963 ) ) ( not ( = ?auto_244955 ?auto_244964 ) ) ( not ( = ?auto_244956 ?auto_244957 ) ) ( not ( = ?auto_244956 ?auto_244958 ) ) ( not ( = ?auto_244956 ?auto_244959 ) ) ( not ( = ?auto_244956 ?auto_244960 ) ) ( not ( = ?auto_244956 ?auto_244961 ) ) ( not ( = ?auto_244956 ?auto_244962 ) ) ( not ( = ?auto_244956 ?auto_244963 ) ) ( not ( = ?auto_244956 ?auto_244964 ) ) ( not ( = ?auto_244957 ?auto_244958 ) ) ( not ( = ?auto_244957 ?auto_244959 ) ) ( not ( = ?auto_244957 ?auto_244960 ) ) ( not ( = ?auto_244957 ?auto_244961 ) ) ( not ( = ?auto_244957 ?auto_244962 ) ) ( not ( = ?auto_244957 ?auto_244963 ) ) ( not ( = ?auto_244957 ?auto_244964 ) ) ( not ( = ?auto_244958 ?auto_244959 ) ) ( not ( = ?auto_244958 ?auto_244960 ) ) ( not ( = ?auto_244958 ?auto_244961 ) ) ( not ( = ?auto_244958 ?auto_244962 ) ) ( not ( = ?auto_244958 ?auto_244963 ) ) ( not ( = ?auto_244958 ?auto_244964 ) ) ( not ( = ?auto_244959 ?auto_244960 ) ) ( not ( = ?auto_244959 ?auto_244961 ) ) ( not ( = ?auto_244959 ?auto_244962 ) ) ( not ( = ?auto_244959 ?auto_244963 ) ) ( not ( = ?auto_244959 ?auto_244964 ) ) ( not ( = ?auto_244960 ?auto_244961 ) ) ( not ( = ?auto_244960 ?auto_244962 ) ) ( not ( = ?auto_244960 ?auto_244963 ) ) ( not ( = ?auto_244960 ?auto_244964 ) ) ( not ( = ?auto_244961 ?auto_244962 ) ) ( not ( = ?auto_244961 ?auto_244963 ) ) ( not ( = ?auto_244961 ?auto_244964 ) ) ( not ( = ?auto_244962 ?auto_244963 ) ) ( not ( = ?auto_244962 ?auto_244964 ) ) ( not ( = ?auto_244963 ?auto_244964 ) ) ( CLEAR ?auto_244961 ) ( ON ?auto_244962 ?auto_244963 ) ( CLEAR ?auto_244962 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_244954 ?auto_244955 ?auto_244956 ?auto_244957 ?auto_244958 ?auto_244959 ?auto_244960 ?auto_244961 ?auto_244962 )
      ( MAKE-10PILE ?auto_244954 ?auto_244955 ?auto_244956 ?auto_244957 ?auto_244958 ?auto_244959 ?auto_244960 ?auto_244961 ?auto_244962 ?auto_244963 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_244975 - BLOCK
      ?auto_244976 - BLOCK
      ?auto_244977 - BLOCK
      ?auto_244978 - BLOCK
      ?auto_244979 - BLOCK
      ?auto_244980 - BLOCK
      ?auto_244981 - BLOCK
      ?auto_244982 - BLOCK
      ?auto_244983 - BLOCK
      ?auto_244984 - BLOCK
    )
    :vars
    (
      ?auto_244985 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_244984 ?auto_244985 ) ( ON-TABLE ?auto_244975 ) ( ON ?auto_244976 ?auto_244975 ) ( ON ?auto_244977 ?auto_244976 ) ( ON ?auto_244978 ?auto_244977 ) ( ON ?auto_244979 ?auto_244978 ) ( ON ?auto_244980 ?auto_244979 ) ( ON ?auto_244981 ?auto_244980 ) ( ON ?auto_244982 ?auto_244981 ) ( not ( = ?auto_244975 ?auto_244976 ) ) ( not ( = ?auto_244975 ?auto_244977 ) ) ( not ( = ?auto_244975 ?auto_244978 ) ) ( not ( = ?auto_244975 ?auto_244979 ) ) ( not ( = ?auto_244975 ?auto_244980 ) ) ( not ( = ?auto_244975 ?auto_244981 ) ) ( not ( = ?auto_244975 ?auto_244982 ) ) ( not ( = ?auto_244975 ?auto_244983 ) ) ( not ( = ?auto_244975 ?auto_244984 ) ) ( not ( = ?auto_244975 ?auto_244985 ) ) ( not ( = ?auto_244976 ?auto_244977 ) ) ( not ( = ?auto_244976 ?auto_244978 ) ) ( not ( = ?auto_244976 ?auto_244979 ) ) ( not ( = ?auto_244976 ?auto_244980 ) ) ( not ( = ?auto_244976 ?auto_244981 ) ) ( not ( = ?auto_244976 ?auto_244982 ) ) ( not ( = ?auto_244976 ?auto_244983 ) ) ( not ( = ?auto_244976 ?auto_244984 ) ) ( not ( = ?auto_244976 ?auto_244985 ) ) ( not ( = ?auto_244977 ?auto_244978 ) ) ( not ( = ?auto_244977 ?auto_244979 ) ) ( not ( = ?auto_244977 ?auto_244980 ) ) ( not ( = ?auto_244977 ?auto_244981 ) ) ( not ( = ?auto_244977 ?auto_244982 ) ) ( not ( = ?auto_244977 ?auto_244983 ) ) ( not ( = ?auto_244977 ?auto_244984 ) ) ( not ( = ?auto_244977 ?auto_244985 ) ) ( not ( = ?auto_244978 ?auto_244979 ) ) ( not ( = ?auto_244978 ?auto_244980 ) ) ( not ( = ?auto_244978 ?auto_244981 ) ) ( not ( = ?auto_244978 ?auto_244982 ) ) ( not ( = ?auto_244978 ?auto_244983 ) ) ( not ( = ?auto_244978 ?auto_244984 ) ) ( not ( = ?auto_244978 ?auto_244985 ) ) ( not ( = ?auto_244979 ?auto_244980 ) ) ( not ( = ?auto_244979 ?auto_244981 ) ) ( not ( = ?auto_244979 ?auto_244982 ) ) ( not ( = ?auto_244979 ?auto_244983 ) ) ( not ( = ?auto_244979 ?auto_244984 ) ) ( not ( = ?auto_244979 ?auto_244985 ) ) ( not ( = ?auto_244980 ?auto_244981 ) ) ( not ( = ?auto_244980 ?auto_244982 ) ) ( not ( = ?auto_244980 ?auto_244983 ) ) ( not ( = ?auto_244980 ?auto_244984 ) ) ( not ( = ?auto_244980 ?auto_244985 ) ) ( not ( = ?auto_244981 ?auto_244982 ) ) ( not ( = ?auto_244981 ?auto_244983 ) ) ( not ( = ?auto_244981 ?auto_244984 ) ) ( not ( = ?auto_244981 ?auto_244985 ) ) ( not ( = ?auto_244982 ?auto_244983 ) ) ( not ( = ?auto_244982 ?auto_244984 ) ) ( not ( = ?auto_244982 ?auto_244985 ) ) ( not ( = ?auto_244983 ?auto_244984 ) ) ( not ( = ?auto_244983 ?auto_244985 ) ) ( not ( = ?auto_244984 ?auto_244985 ) ) ( CLEAR ?auto_244982 ) ( ON ?auto_244983 ?auto_244984 ) ( CLEAR ?auto_244983 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_244975 ?auto_244976 ?auto_244977 ?auto_244978 ?auto_244979 ?auto_244980 ?auto_244981 ?auto_244982 ?auto_244983 )
      ( MAKE-10PILE ?auto_244975 ?auto_244976 ?auto_244977 ?auto_244978 ?auto_244979 ?auto_244980 ?auto_244981 ?auto_244982 ?auto_244983 ?auto_244984 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_244996 - BLOCK
      ?auto_244997 - BLOCK
      ?auto_244998 - BLOCK
      ?auto_244999 - BLOCK
      ?auto_245000 - BLOCK
      ?auto_245001 - BLOCK
      ?auto_245002 - BLOCK
      ?auto_245003 - BLOCK
      ?auto_245004 - BLOCK
      ?auto_245005 - BLOCK
    )
    :vars
    (
      ?auto_245006 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_245005 ?auto_245006 ) ( ON-TABLE ?auto_244996 ) ( ON ?auto_244997 ?auto_244996 ) ( ON ?auto_244998 ?auto_244997 ) ( ON ?auto_244999 ?auto_244998 ) ( ON ?auto_245000 ?auto_244999 ) ( ON ?auto_245001 ?auto_245000 ) ( ON ?auto_245002 ?auto_245001 ) ( not ( = ?auto_244996 ?auto_244997 ) ) ( not ( = ?auto_244996 ?auto_244998 ) ) ( not ( = ?auto_244996 ?auto_244999 ) ) ( not ( = ?auto_244996 ?auto_245000 ) ) ( not ( = ?auto_244996 ?auto_245001 ) ) ( not ( = ?auto_244996 ?auto_245002 ) ) ( not ( = ?auto_244996 ?auto_245003 ) ) ( not ( = ?auto_244996 ?auto_245004 ) ) ( not ( = ?auto_244996 ?auto_245005 ) ) ( not ( = ?auto_244996 ?auto_245006 ) ) ( not ( = ?auto_244997 ?auto_244998 ) ) ( not ( = ?auto_244997 ?auto_244999 ) ) ( not ( = ?auto_244997 ?auto_245000 ) ) ( not ( = ?auto_244997 ?auto_245001 ) ) ( not ( = ?auto_244997 ?auto_245002 ) ) ( not ( = ?auto_244997 ?auto_245003 ) ) ( not ( = ?auto_244997 ?auto_245004 ) ) ( not ( = ?auto_244997 ?auto_245005 ) ) ( not ( = ?auto_244997 ?auto_245006 ) ) ( not ( = ?auto_244998 ?auto_244999 ) ) ( not ( = ?auto_244998 ?auto_245000 ) ) ( not ( = ?auto_244998 ?auto_245001 ) ) ( not ( = ?auto_244998 ?auto_245002 ) ) ( not ( = ?auto_244998 ?auto_245003 ) ) ( not ( = ?auto_244998 ?auto_245004 ) ) ( not ( = ?auto_244998 ?auto_245005 ) ) ( not ( = ?auto_244998 ?auto_245006 ) ) ( not ( = ?auto_244999 ?auto_245000 ) ) ( not ( = ?auto_244999 ?auto_245001 ) ) ( not ( = ?auto_244999 ?auto_245002 ) ) ( not ( = ?auto_244999 ?auto_245003 ) ) ( not ( = ?auto_244999 ?auto_245004 ) ) ( not ( = ?auto_244999 ?auto_245005 ) ) ( not ( = ?auto_244999 ?auto_245006 ) ) ( not ( = ?auto_245000 ?auto_245001 ) ) ( not ( = ?auto_245000 ?auto_245002 ) ) ( not ( = ?auto_245000 ?auto_245003 ) ) ( not ( = ?auto_245000 ?auto_245004 ) ) ( not ( = ?auto_245000 ?auto_245005 ) ) ( not ( = ?auto_245000 ?auto_245006 ) ) ( not ( = ?auto_245001 ?auto_245002 ) ) ( not ( = ?auto_245001 ?auto_245003 ) ) ( not ( = ?auto_245001 ?auto_245004 ) ) ( not ( = ?auto_245001 ?auto_245005 ) ) ( not ( = ?auto_245001 ?auto_245006 ) ) ( not ( = ?auto_245002 ?auto_245003 ) ) ( not ( = ?auto_245002 ?auto_245004 ) ) ( not ( = ?auto_245002 ?auto_245005 ) ) ( not ( = ?auto_245002 ?auto_245006 ) ) ( not ( = ?auto_245003 ?auto_245004 ) ) ( not ( = ?auto_245003 ?auto_245005 ) ) ( not ( = ?auto_245003 ?auto_245006 ) ) ( not ( = ?auto_245004 ?auto_245005 ) ) ( not ( = ?auto_245004 ?auto_245006 ) ) ( not ( = ?auto_245005 ?auto_245006 ) ) ( ON ?auto_245004 ?auto_245005 ) ( CLEAR ?auto_245002 ) ( ON ?auto_245003 ?auto_245004 ) ( CLEAR ?auto_245003 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_244996 ?auto_244997 ?auto_244998 ?auto_244999 ?auto_245000 ?auto_245001 ?auto_245002 ?auto_245003 )
      ( MAKE-10PILE ?auto_244996 ?auto_244997 ?auto_244998 ?auto_244999 ?auto_245000 ?auto_245001 ?auto_245002 ?auto_245003 ?auto_245004 ?auto_245005 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_245017 - BLOCK
      ?auto_245018 - BLOCK
      ?auto_245019 - BLOCK
      ?auto_245020 - BLOCK
      ?auto_245021 - BLOCK
      ?auto_245022 - BLOCK
      ?auto_245023 - BLOCK
      ?auto_245024 - BLOCK
      ?auto_245025 - BLOCK
      ?auto_245026 - BLOCK
    )
    :vars
    (
      ?auto_245027 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_245026 ?auto_245027 ) ( ON-TABLE ?auto_245017 ) ( ON ?auto_245018 ?auto_245017 ) ( ON ?auto_245019 ?auto_245018 ) ( ON ?auto_245020 ?auto_245019 ) ( ON ?auto_245021 ?auto_245020 ) ( ON ?auto_245022 ?auto_245021 ) ( ON ?auto_245023 ?auto_245022 ) ( not ( = ?auto_245017 ?auto_245018 ) ) ( not ( = ?auto_245017 ?auto_245019 ) ) ( not ( = ?auto_245017 ?auto_245020 ) ) ( not ( = ?auto_245017 ?auto_245021 ) ) ( not ( = ?auto_245017 ?auto_245022 ) ) ( not ( = ?auto_245017 ?auto_245023 ) ) ( not ( = ?auto_245017 ?auto_245024 ) ) ( not ( = ?auto_245017 ?auto_245025 ) ) ( not ( = ?auto_245017 ?auto_245026 ) ) ( not ( = ?auto_245017 ?auto_245027 ) ) ( not ( = ?auto_245018 ?auto_245019 ) ) ( not ( = ?auto_245018 ?auto_245020 ) ) ( not ( = ?auto_245018 ?auto_245021 ) ) ( not ( = ?auto_245018 ?auto_245022 ) ) ( not ( = ?auto_245018 ?auto_245023 ) ) ( not ( = ?auto_245018 ?auto_245024 ) ) ( not ( = ?auto_245018 ?auto_245025 ) ) ( not ( = ?auto_245018 ?auto_245026 ) ) ( not ( = ?auto_245018 ?auto_245027 ) ) ( not ( = ?auto_245019 ?auto_245020 ) ) ( not ( = ?auto_245019 ?auto_245021 ) ) ( not ( = ?auto_245019 ?auto_245022 ) ) ( not ( = ?auto_245019 ?auto_245023 ) ) ( not ( = ?auto_245019 ?auto_245024 ) ) ( not ( = ?auto_245019 ?auto_245025 ) ) ( not ( = ?auto_245019 ?auto_245026 ) ) ( not ( = ?auto_245019 ?auto_245027 ) ) ( not ( = ?auto_245020 ?auto_245021 ) ) ( not ( = ?auto_245020 ?auto_245022 ) ) ( not ( = ?auto_245020 ?auto_245023 ) ) ( not ( = ?auto_245020 ?auto_245024 ) ) ( not ( = ?auto_245020 ?auto_245025 ) ) ( not ( = ?auto_245020 ?auto_245026 ) ) ( not ( = ?auto_245020 ?auto_245027 ) ) ( not ( = ?auto_245021 ?auto_245022 ) ) ( not ( = ?auto_245021 ?auto_245023 ) ) ( not ( = ?auto_245021 ?auto_245024 ) ) ( not ( = ?auto_245021 ?auto_245025 ) ) ( not ( = ?auto_245021 ?auto_245026 ) ) ( not ( = ?auto_245021 ?auto_245027 ) ) ( not ( = ?auto_245022 ?auto_245023 ) ) ( not ( = ?auto_245022 ?auto_245024 ) ) ( not ( = ?auto_245022 ?auto_245025 ) ) ( not ( = ?auto_245022 ?auto_245026 ) ) ( not ( = ?auto_245022 ?auto_245027 ) ) ( not ( = ?auto_245023 ?auto_245024 ) ) ( not ( = ?auto_245023 ?auto_245025 ) ) ( not ( = ?auto_245023 ?auto_245026 ) ) ( not ( = ?auto_245023 ?auto_245027 ) ) ( not ( = ?auto_245024 ?auto_245025 ) ) ( not ( = ?auto_245024 ?auto_245026 ) ) ( not ( = ?auto_245024 ?auto_245027 ) ) ( not ( = ?auto_245025 ?auto_245026 ) ) ( not ( = ?auto_245025 ?auto_245027 ) ) ( not ( = ?auto_245026 ?auto_245027 ) ) ( ON ?auto_245025 ?auto_245026 ) ( CLEAR ?auto_245023 ) ( ON ?auto_245024 ?auto_245025 ) ( CLEAR ?auto_245024 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_245017 ?auto_245018 ?auto_245019 ?auto_245020 ?auto_245021 ?auto_245022 ?auto_245023 ?auto_245024 )
      ( MAKE-10PILE ?auto_245017 ?auto_245018 ?auto_245019 ?auto_245020 ?auto_245021 ?auto_245022 ?auto_245023 ?auto_245024 ?auto_245025 ?auto_245026 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_245038 - BLOCK
      ?auto_245039 - BLOCK
      ?auto_245040 - BLOCK
      ?auto_245041 - BLOCK
      ?auto_245042 - BLOCK
      ?auto_245043 - BLOCK
      ?auto_245044 - BLOCK
      ?auto_245045 - BLOCK
      ?auto_245046 - BLOCK
      ?auto_245047 - BLOCK
    )
    :vars
    (
      ?auto_245048 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_245047 ?auto_245048 ) ( ON-TABLE ?auto_245038 ) ( ON ?auto_245039 ?auto_245038 ) ( ON ?auto_245040 ?auto_245039 ) ( ON ?auto_245041 ?auto_245040 ) ( ON ?auto_245042 ?auto_245041 ) ( ON ?auto_245043 ?auto_245042 ) ( not ( = ?auto_245038 ?auto_245039 ) ) ( not ( = ?auto_245038 ?auto_245040 ) ) ( not ( = ?auto_245038 ?auto_245041 ) ) ( not ( = ?auto_245038 ?auto_245042 ) ) ( not ( = ?auto_245038 ?auto_245043 ) ) ( not ( = ?auto_245038 ?auto_245044 ) ) ( not ( = ?auto_245038 ?auto_245045 ) ) ( not ( = ?auto_245038 ?auto_245046 ) ) ( not ( = ?auto_245038 ?auto_245047 ) ) ( not ( = ?auto_245038 ?auto_245048 ) ) ( not ( = ?auto_245039 ?auto_245040 ) ) ( not ( = ?auto_245039 ?auto_245041 ) ) ( not ( = ?auto_245039 ?auto_245042 ) ) ( not ( = ?auto_245039 ?auto_245043 ) ) ( not ( = ?auto_245039 ?auto_245044 ) ) ( not ( = ?auto_245039 ?auto_245045 ) ) ( not ( = ?auto_245039 ?auto_245046 ) ) ( not ( = ?auto_245039 ?auto_245047 ) ) ( not ( = ?auto_245039 ?auto_245048 ) ) ( not ( = ?auto_245040 ?auto_245041 ) ) ( not ( = ?auto_245040 ?auto_245042 ) ) ( not ( = ?auto_245040 ?auto_245043 ) ) ( not ( = ?auto_245040 ?auto_245044 ) ) ( not ( = ?auto_245040 ?auto_245045 ) ) ( not ( = ?auto_245040 ?auto_245046 ) ) ( not ( = ?auto_245040 ?auto_245047 ) ) ( not ( = ?auto_245040 ?auto_245048 ) ) ( not ( = ?auto_245041 ?auto_245042 ) ) ( not ( = ?auto_245041 ?auto_245043 ) ) ( not ( = ?auto_245041 ?auto_245044 ) ) ( not ( = ?auto_245041 ?auto_245045 ) ) ( not ( = ?auto_245041 ?auto_245046 ) ) ( not ( = ?auto_245041 ?auto_245047 ) ) ( not ( = ?auto_245041 ?auto_245048 ) ) ( not ( = ?auto_245042 ?auto_245043 ) ) ( not ( = ?auto_245042 ?auto_245044 ) ) ( not ( = ?auto_245042 ?auto_245045 ) ) ( not ( = ?auto_245042 ?auto_245046 ) ) ( not ( = ?auto_245042 ?auto_245047 ) ) ( not ( = ?auto_245042 ?auto_245048 ) ) ( not ( = ?auto_245043 ?auto_245044 ) ) ( not ( = ?auto_245043 ?auto_245045 ) ) ( not ( = ?auto_245043 ?auto_245046 ) ) ( not ( = ?auto_245043 ?auto_245047 ) ) ( not ( = ?auto_245043 ?auto_245048 ) ) ( not ( = ?auto_245044 ?auto_245045 ) ) ( not ( = ?auto_245044 ?auto_245046 ) ) ( not ( = ?auto_245044 ?auto_245047 ) ) ( not ( = ?auto_245044 ?auto_245048 ) ) ( not ( = ?auto_245045 ?auto_245046 ) ) ( not ( = ?auto_245045 ?auto_245047 ) ) ( not ( = ?auto_245045 ?auto_245048 ) ) ( not ( = ?auto_245046 ?auto_245047 ) ) ( not ( = ?auto_245046 ?auto_245048 ) ) ( not ( = ?auto_245047 ?auto_245048 ) ) ( ON ?auto_245046 ?auto_245047 ) ( ON ?auto_245045 ?auto_245046 ) ( CLEAR ?auto_245043 ) ( ON ?auto_245044 ?auto_245045 ) ( CLEAR ?auto_245044 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_245038 ?auto_245039 ?auto_245040 ?auto_245041 ?auto_245042 ?auto_245043 ?auto_245044 )
      ( MAKE-10PILE ?auto_245038 ?auto_245039 ?auto_245040 ?auto_245041 ?auto_245042 ?auto_245043 ?auto_245044 ?auto_245045 ?auto_245046 ?auto_245047 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_245059 - BLOCK
      ?auto_245060 - BLOCK
      ?auto_245061 - BLOCK
      ?auto_245062 - BLOCK
      ?auto_245063 - BLOCK
      ?auto_245064 - BLOCK
      ?auto_245065 - BLOCK
      ?auto_245066 - BLOCK
      ?auto_245067 - BLOCK
      ?auto_245068 - BLOCK
    )
    :vars
    (
      ?auto_245069 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_245068 ?auto_245069 ) ( ON-TABLE ?auto_245059 ) ( ON ?auto_245060 ?auto_245059 ) ( ON ?auto_245061 ?auto_245060 ) ( ON ?auto_245062 ?auto_245061 ) ( ON ?auto_245063 ?auto_245062 ) ( ON ?auto_245064 ?auto_245063 ) ( not ( = ?auto_245059 ?auto_245060 ) ) ( not ( = ?auto_245059 ?auto_245061 ) ) ( not ( = ?auto_245059 ?auto_245062 ) ) ( not ( = ?auto_245059 ?auto_245063 ) ) ( not ( = ?auto_245059 ?auto_245064 ) ) ( not ( = ?auto_245059 ?auto_245065 ) ) ( not ( = ?auto_245059 ?auto_245066 ) ) ( not ( = ?auto_245059 ?auto_245067 ) ) ( not ( = ?auto_245059 ?auto_245068 ) ) ( not ( = ?auto_245059 ?auto_245069 ) ) ( not ( = ?auto_245060 ?auto_245061 ) ) ( not ( = ?auto_245060 ?auto_245062 ) ) ( not ( = ?auto_245060 ?auto_245063 ) ) ( not ( = ?auto_245060 ?auto_245064 ) ) ( not ( = ?auto_245060 ?auto_245065 ) ) ( not ( = ?auto_245060 ?auto_245066 ) ) ( not ( = ?auto_245060 ?auto_245067 ) ) ( not ( = ?auto_245060 ?auto_245068 ) ) ( not ( = ?auto_245060 ?auto_245069 ) ) ( not ( = ?auto_245061 ?auto_245062 ) ) ( not ( = ?auto_245061 ?auto_245063 ) ) ( not ( = ?auto_245061 ?auto_245064 ) ) ( not ( = ?auto_245061 ?auto_245065 ) ) ( not ( = ?auto_245061 ?auto_245066 ) ) ( not ( = ?auto_245061 ?auto_245067 ) ) ( not ( = ?auto_245061 ?auto_245068 ) ) ( not ( = ?auto_245061 ?auto_245069 ) ) ( not ( = ?auto_245062 ?auto_245063 ) ) ( not ( = ?auto_245062 ?auto_245064 ) ) ( not ( = ?auto_245062 ?auto_245065 ) ) ( not ( = ?auto_245062 ?auto_245066 ) ) ( not ( = ?auto_245062 ?auto_245067 ) ) ( not ( = ?auto_245062 ?auto_245068 ) ) ( not ( = ?auto_245062 ?auto_245069 ) ) ( not ( = ?auto_245063 ?auto_245064 ) ) ( not ( = ?auto_245063 ?auto_245065 ) ) ( not ( = ?auto_245063 ?auto_245066 ) ) ( not ( = ?auto_245063 ?auto_245067 ) ) ( not ( = ?auto_245063 ?auto_245068 ) ) ( not ( = ?auto_245063 ?auto_245069 ) ) ( not ( = ?auto_245064 ?auto_245065 ) ) ( not ( = ?auto_245064 ?auto_245066 ) ) ( not ( = ?auto_245064 ?auto_245067 ) ) ( not ( = ?auto_245064 ?auto_245068 ) ) ( not ( = ?auto_245064 ?auto_245069 ) ) ( not ( = ?auto_245065 ?auto_245066 ) ) ( not ( = ?auto_245065 ?auto_245067 ) ) ( not ( = ?auto_245065 ?auto_245068 ) ) ( not ( = ?auto_245065 ?auto_245069 ) ) ( not ( = ?auto_245066 ?auto_245067 ) ) ( not ( = ?auto_245066 ?auto_245068 ) ) ( not ( = ?auto_245066 ?auto_245069 ) ) ( not ( = ?auto_245067 ?auto_245068 ) ) ( not ( = ?auto_245067 ?auto_245069 ) ) ( not ( = ?auto_245068 ?auto_245069 ) ) ( ON ?auto_245067 ?auto_245068 ) ( ON ?auto_245066 ?auto_245067 ) ( CLEAR ?auto_245064 ) ( ON ?auto_245065 ?auto_245066 ) ( CLEAR ?auto_245065 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_245059 ?auto_245060 ?auto_245061 ?auto_245062 ?auto_245063 ?auto_245064 ?auto_245065 )
      ( MAKE-10PILE ?auto_245059 ?auto_245060 ?auto_245061 ?auto_245062 ?auto_245063 ?auto_245064 ?auto_245065 ?auto_245066 ?auto_245067 ?auto_245068 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_245080 - BLOCK
      ?auto_245081 - BLOCK
      ?auto_245082 - BLOCK
      ?auto_245083 - BLOCK
      ?auto_245084 - BLOCK
      ?auto_245085 - BLOCK
      ?auto_245086 - BLOCK
      ?auto_245087 - BLOCK
      ?auto_245088 - BLOCK
      ?auto_245089 - BLOCK
    )
    :vars
    (
      ?auto_245090 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_245089 ?auto_245090 ) ( ON-TABLE ?auto_245080 ) ( ON ?auto_245081 ?auto_245080 ) ( ON ?auto_245082 ?auto_245081 ) ( ON ?auto_245083 ?auto_245082 ) ( ON ?auto_245084 ?auto_245083 ) ( not ( = ?auto_245080 ?auto_245081 ) ) ( not ( = ?auto_245080 ?auto_245082 ) ) ( not ( = ?auto_245080 ?auto_245083 ) ) ( not ( = ?auto_245080 ?auto_245084 ) ) ( not ( = ?auto_245080 ?auto_245085 ) ) ( not ( = ?auto_245080 ?auto_245086 ) ) ( not ( = ?auto_245080 ?auto_245087 ) ) ( not ( = ?auto_245080 ?auto_245088 ) ) ( not ( = ?auto_245080 ?auto_245089 ) ) ( not ( = ?auto_245080 ?auto_245090 ) ) ( not ( = ?auto_245081 ?auto_245082 ) ) ( not ( = ?auto_245081 ?auto_245083 ) ) ( not ( = ?auto_245081 ?auto_245084 ) ) ( not ( = ?auto_245081 ?auto_245085 ) ) ( not ( = ?auto_245081 ?auto_245086 ) ) ( not ( = ?auto_245081 ?auto_245087 ) ) ( not ( = ?auto_245081 ?auto_245088 ) ) ( not ( = ?auto_245081 ?auto_245089 ) ) ( not ( = ?auto_245081 ?auto_245090 ) ) ( not ( = ?auto_245082 ?auto_245083 ) ) ( not ( = ?auto_245082 ?auto_245084 ) ) ( not ( = ?auto_245082 ?auto_245085 ) ) ( not ( = ?auto_245082 ?auto_245086 ) ) ( not ( = ?auto_245082 ?auto_245087 ) ) ( not ( = ?auto_245082 ?auto_245088 ) ) ( not ( = ?auto_245082 ?auto_245089 ) ) ( not ( = ?auto_245082 ?auto_245090 ) ) ( not ( = ?auto_245083 ?auto_245084 ) ) ( not ( = ?auto_245083 ?auto_245085 ) ) ( not ( = ?auto_245083 ?auto_245086 ) ) ( not ( = ?auto_245083 ?auto_245087 ) ) ( not ( = ?auto_245083 ?auto_245088 ) ) ( not ( = ?auto_245083 ?auto_245089 ) ) ( not ( = ?auto_245083 ?auto_245090 ) ) ( not ( = ?auto_245084 ?auto_245085 ) ) ( not ( = ?auto_245084 ?auto_245086 ) ) ( not ( = ?auto_245084 ?auto_245087 ) ) ( not ( = ?auto_245084 ?auto_245088 ) ) ( not ( = ?auto_245084 ?auto_245089 ) ) ( not ( = ?auto_245084 ?auto_245090 ) ) ( not ( = ?auto_245085 ?auto_245086 ) ) ( not ( = ?auto_245085 ?auto_245087 ) ) ( not ( = ?auto_245085 ?auto_245088 ) ) ( not ( = ?auto_245085 ?auto_245089 ) ) ( not ( = ?auto_245085 ?auto_245090 ) ) ( not ( = ?auto_245086 ?auto_245087 ) ) ( not ( = ?auto_245086 ?auto_245088 ) ) ( not ( = ?auto_245086 ?auto_245089 ) ) ( not ( = ?auto_245086 ?auto_245090 ) ) ( not ( = ?auto_245087 ?auto_245088 ) ) ( not ( = ?auto_245087 ?auto_245089 ) ) ( not ( = ?auto_245087 ?auto_245090 ) ) ( not ( = ?auto_245088 ?auto_245089 ) ) ( not ( = ?auto_245088 ?auto_245090 ) ) ( not ( = ?auto_245089 ?auto_245090 ) ) ( ON ?auto_245088 ?auto_245089 ) ( ON ?auto_245087 ?auto_245088 ) ( ON ?auto_245086 ?auto_245087 ) ( CLEAR ?auto_245084 ) ( ON ?auto_245085 ?auto_245086 ) ( CLEAR ?auto_245085 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_245080 ?auto_245081 ?auto_245082 ?auto_245083 ?auto_245084 ?auto_245085 )
      ( MAKE-10PILE ?auto_245080 ?auto_245081 ?auto_245082 ?auto_245083 ?auto_245084 ?auto_245085 ?auto_245086 ?auto_245087 ?auto_245088 ?auto_245089 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_245101 - BLOCK
      ?auto_245102 - BLOCK
      ?auto_245103 - BLOCK
      ?auto_245104 - BLOCK
      ?auto_245105 - BLOCK
      ?auto_245106 - BLOCK
      ?auto_245107 - BLOCK
      ?auto_245108 - BLOCK
      ?auto_245109 - BLOCK
      ?auto_245110 - BLOCK
    )
    :vars
    (
      ?auto_245111 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_245110 ?auto_245111 ) ( ON-TABLE ?auto_245101 ) ( ON ?auto_245102 ?auto_245101 ) ( ON ?auto_245103 ?auto_245102 ) ( ON ?auto_245104 ?auto_245103 ) ( ON ?auto_245105 ?auto_245104 ) ( not ( = ?auto_245101 ?auto_245102 ) ) ( not ( = ?auto_245101 ?auto_245103 ) ) ( not ( = ?auto_245101 ?auto_245104 ) ) ( not ( = ?auto_245101 ?auto_245105 ) ) ( not ( = ?auto_245101 ?auto_245106 ) ) ( not ( = ?auto_245101 ?auto_245107 ) ) ( not ( = ?auto_245101 ?auto_245108 ) ) ( not ( = ?auto_245101 ?auto_245109 ) ) ( not ( = ?auto_245101 ?auto_245110 ) ) ( not ( = ?auto_245101 ?auto_245111 ) ) ( not ( = ?auto_245102 ?auto_245103 ) ) ( not ( = ?auto_245102 ?auto_245104 ) ) ( not ( = ?auto_245102 ?auto_245105 ) ) ( not ( = ?auto_245102 ?auto_245106 ) ) ( not ( = ?auto_245102 ?auto_245107 ) ) ( not ( = ?auto_245102 ?auto_245108 ) ) ( not ( = ?auto_245102 ?auto_245109 ) ) ( not ( = ?auto_245102 ?auto_245110 ) ) ( not ( = ?auto_245102 ?auto_245111 ) ) ( not ( = ?auto_245103 ?auto_245104 ) ) ( not ( = ?auto_245103 ?auto_245105 ) ) ( not ( = ?auto_245103 ?auto_245106 ) ) ( not ( = ?auto_245103 ?auto_245107 ) ) ( not ( = ?auto_245103 ?auto_245108 ) ) ( not ( = ?auto_245103 ?auto_245109 ) ) ( not ( = ?auto_245103 ?auto_245110 ) ) ( not ( = ?auto_245103 ?auto_245111 ) ) ( not ( = ?auto_245104 ?auto_245105 ) ) ( not ( = ?auto_245104 ?auto_245106 ) ) ( not ( = ?auto_245104 ?auto_245107 ) ) ( not ( = ?auto_245104 ?auto_245108 ) ) ( not ( = ?auto_245104 ?auto_245109 ) ) ( not ( = ?auto_245104 ?auto_245110 ) ) ( not ( = ?auto_245104 ?auto_245111 ) ) ( not ( = ?auto_245105 ?auto_245106 ) ) ( not ( = ?auto_245105 ?auto_245107 ) ) ( not ( = ?auto_245105 ?auto_245108 ) ) ( not ( = ?auto_245105 ?auto_245109 ) ) ( not ( = ?auto_245105 ?auto_245110 ) ) ( not ( = ?auto_245105 ?auto_245111 ) ) ( not ( = ?auto_245106 ?auto_245107 ) ) ( not ( = ?auto_245106 ?auto_245108 ) ) ( not ( = ?auto_245106 ?auto_245109 ) ) ( not ( = ?auto_245106 ?auto_245110 ) ) ( not ( = ?auto_245106 ?auto_245111 ) ) ( not ( = ?auto_245107 ?auto_245108 ) ) ( not ( = ?auto_245107 ?auto_245109 ) ) ( not ( = ?auto_245107 ?auto_245110 ) ) ( not ( = ?auto_245107 ?auto_245111 ) ) ( not ( = ?auto_245108 ?auto_245109 ) ) ( not ( = ?auto_245108 ?auto_245110 ) ) ( not ( = ?auto_245108 ?auto_245111 ) ) ( not ( = ?auto_245109 ?auto_245110 ) ) ( not ( = ?auto_245109 ?auto_245111 ) ) ( not ( = ?auto_245110 ?auto_245111 ) ) ( ON ?auto_245109 ?auto_245110 ) ( ON ?auto_245108 ?auto_245109 ) ( ON ?auto_245107 ?auto_245108 ) ( CLEAR ?auto_245105 ) ( ON ?auto_245106 ?auto_245107 ) ( CLEAR ?auto_245106 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_245101 ?auto_245102 ?auto_245103 ?auto_245104 ?auto_245105 ?auto_245106 )
      ( MAKE-10PILE ?auto_245101 ?auto_245102 ?auto_245103 ?auto_245104 ?auto_245105 ?auto_245106 ?auto_245107 ?auto_245108 ?auto_245109 ?auto_245110 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_245122 - BLOCK
      ?auto_245123 - BLOCK
      ?auto_245124 - BLOCK
      ?auto_245125 - BLOCK
      ?auto_245126 - BLOCK
      ?auto_245127 - BLOCK
      ?auto_245128 - BLOCK
      ?auto_245129 - BLOCK
      ?auto_245130 - BLOCK
      ?auto_245131 - BLOCK
    )
    :vars
    (
      ?auto_245132 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_245131 ?auto_245132 ) ( ON-TABLE ?auto_245122 ) ( ON ?auto_245123 ?auto_245122 ) ( ON ?auto_245124 ?auto_245123 ) ( ON ?auto_245125 ?auto_245124 ) ( not ( = ?auto_245122 ?auto_245123 ) ) ( not ( = ?auto_245122 ?auto_245124 ) ) ( not ( = ?auto_245122 ?auto_245125 ) ) ( not ( = ?auto_245122 ?auto_245126 ) ) ( not ( = ?auto_245122 ?auto_245127 ) ) ( not ( = ?auto_245122 ?auto_245128 ) ) ( not ( = ?auto_245122 ?auto_245129 ) ) ( not ( = ?auto_245122 ?auto_245130 ) ) ( not ( = ?auto_245122 ?auto_245131 ) ) ( not ( = ?auto_245122 ?auto_245132 ) ) ( not ( = ?auto_245123 ?auto_245124 ) ) ( not ( = ?auto_245123 ?auto_245125 ) ) ( not ( = ?auto_245123 ?auto_245126 ) ) ( not ( = ?auto_245123 ?auto_245127 ) ) ( not ( = ?auto_245123 ?auto_245128 ) ) ( not ( = ?auto_245123 ?auto_245129 ) ) ( not ( = ?auto_245123 ?auto_245130 ) ) ( not ( = ?auto_245123 ?auto_245131 ) ) ( not ( = ?auto_245123 ?auto_245132 ) ) ( not ( = ?auto_245124 ?auto_245125 ) ) ( not ( = ?auto_245124 ?auto_245126 ) ) ( not ( = ?auto_245124 ?auto_245127 ) ) ( not ( = ?auto_245124 ?auto_245128 ) ) ( not ( = ?auto_245124 ?auto_245129 ) ) ( not ( = ?auto_245124 ?auto_245130 ) ) ( not ( = ?auto_245124 ?auto_245131 ) ) ( not ( = ?auto_245124 ?auto_245132 ) ) ( not ( = ?auto_245125 ?auto_245126 ) ) ( not ( = ?auto_245125 ?auto_245127 ) ) ( not ( = ?auto_245125 ?auto_245128 ) ) ( not ( = ?auto_245125 ?auto_245129 ) ) ( not ( = ?auto_245125 ?auto_245130 ) ) ( not ( = ?auto_245125 ?auto_245131 ) ) ( not ( = ?auto_245125 ?auto_245132 ) ) ( not ( = ?auto_245126 ?auto_245127 ) ) ( not ( = ?auto_245126 ?auto_245128 ) ) ( not ( = ?auto_245126 ?auto_245129 ) ) ( not ( = ?auto_245126 ?auto_245130 ) ) ( not ( = ?auto_245126 ?auto_245131 ) ) ( not ( = ?auto_245126 ?auto_245132 ) ) ( not ( = ?auto_245127 ?auto_245128 ) ) ( not ( = ?auto_245127 ?auto_245129 ) ) ( not ( = ?auto_245127 ?auto_245130 ) ) ( not ( = ?auto_245127 ?auto_245131 ) ) ( not ( = ?auto_245127 ?auto_245132 ) ) ( not ( = ?auto_245128 ?auto_245129 ) ) ( not ( = ?auto_245128 ?auto_245130 ) ) ( not ( = ?auto_245128 ?auto_245131 ) ) ( not ( = ?auto_245128 ?auto_245132 ) ) ( not ( = ?auto_245129 ?auto_245130 ) ) ( not ( = ?auto_245129 ?auto_245131 ) ) ( not ( = ?auto_245129 ?auto_245132 ) ) ( not ( = ?auto_245130 ?auto_245131 ) ) ( not ( = ?auto_245130 ?auto_245132 ) ) ( not ( = ?auto_245131 ?auto_245132 ) ) ( ON ?auto_245130 ?auto_245131 ) ( ON ?auto_245129 ?auto_245130 ) ( ON ?auto_245128 ?auto_245129 ) ( ON ?auto_245127 ?auto_245128 ) ( CLEAR ?auto_245125 ) ( ON ?auto_245126 ?auto_245127 ) ( CLEAR ?auto_245126 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_245122 ?auto_245123 ?auto_245124 ?auto_245125 ?auto_245126 )
      ( MAKE-10PILE ?auto_245122 ?auto_245123 ?auto_245124 ?auto_245125 ?auto_245126 ?auto_245127 ?auto_245128 ?auto_245129 ?auto_245130 ?auto_245131 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_245143 - BLOCK
      ?auto_245144 - BLOCK
      ?auto_245145 - BLOCK
      ?auto_245146 - BLOCK
      ?auto_245147 - BLOCK
      ?auto_245148 - BLOCK
      ?auto_245149 - BLOCK
      ?auto_245150 - BLOCK
      ?auto_245151 - BLOCK
      ?auto_245152 - BLOCK
    )
    :vars
    (
      ?auto_245153 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_245152 ?auto_245153 ) ( ON-TABLE ?auto_245143 ) ( ON ?auto_245144 ?auto_245143 ) ( ON ?auto_245145 ?auto_245144 ) ( ON ?auto_245146 ?auto_245145 ) ( not ( = ?auto_245143 ?auto_245144 ) ) ( not ( = ?auto_245143 ?auto_245145 ) ) ( not ( = ?auto_245143 ?auto_245146 ) ) ( not ( = ?auto_245143 ?auto_245147 ) ) ( not ( = ?auto_245143 ?auto_245148 ) ) ( not ( = ?auto_245143 ?auto_245149 ) ) ( not ( = ?auto_245143 ?auto_245150 ) ) ( not ( = ?auto_245143 ?auto_245151 ) ) ( not ( = ?auto_245143 ?auto_245152 ) ) ( not ( = ?auto_245143 ?auto_245153 ) ) ( not ( = ?auto_245144 ?auto_245145 ) ) ( not ( = ?auto_245144 ?auto_245146 ) ) ( not ( = ?auto_245144 ?auto_245147 ) ) ( not ( = ?auto_245144 ?auto_245148 ) ) ( not ( = ?auto_245144 ?auto_245149 ) ) ( not ( = ?auto_245144 ?auto_245150 ) ) ( not ( = ?auto_245144 ?auto_245151 ) ) ( not ( = ?auto_245144 ?auto_245152 ) ) ( not ( = ?auto_245144 ?auto_245153 ) ) ( not ( = ?auto_245145 ?auto_245146 ) ) ( not ( = ?auto_245145 ?auto_245147 ) ) ( not ( = ?auto_245145 ?auto_245148 ) ) ( not ( = ?auto_245145 ?auto_245149 ) ) ( not ( = ?auto_245145 ?auto_245150 ) ) ( not ( = ?auto_245145 ?auto_245151 ) ) ( not ( = ?auto_245145 ?auto_245152 ) ) ( not ( = ?auto_245145 ?auto_245153 ) ) ( not ( = ?auto_245146 ?auto_245147 ) ) ( not ( = ?auto_245146 ?auto_245148 ) ) ( not ( = ?auto_245146 ?auto_245149 ) ) ( not ( = ?auto_245146 ?auto_245150 ) ) ( not ( = ?auto_245146 ?auto_245151 ) ) ( not ( = ?auto_245146 ?auto_245152 ) ) ( not ( = ?auto_245146 ?auto_245153 ) ) ( not ( = ?auto_245147 ?auto_245148 ) ) ( not ( = ?auto_245147 ?auto_245149 ) ) ( not ( = ?auto_245147 ?auto_245150 ) ) ( not ( = ?auto_245147 ?auto_245151 ) ) ( not ( = ?auto_245147 ?auto_245152 ) ) ( not ( = ?auto_245147 ?auto_245153 ) ) ( not ( = ?auto_245148 ?auto_245149 ) ) ( not ( = ?auto_245148 ?auto_245150 ) ) ( not ( = ?auto_245148 ?auto_245151 ) ) ( not ( = ?auto_245148 ?auto_245152 ) ) ( not ( = ?auto_245148 ?auto_245153 ) ) ( not ( = ?auto_245149 ?auto_245150 ) ) ( not ( = ?auto_245149 ?auto_245151 ) ) ( not ( = ?auto_245149 ?auto_245152 ) ) ( not ( = ?auto_245149 ?auto_245153 ) ) ( not ( = ?auto_245150 ?auto_245151 ) ) ( not ( = ?auto_245150 ?auto_245152 ) ) ( not ( = ?auto_245150 ?auto_245153 ) ) ( not ( = ?auto_245151 ?auto_245152 ) ) ( not ( = ?auto_245151 ?auto_245153 ) ) ( not ( = ?auto_245152 ?auto_245153 ) ) ( ON ?auto_245151 ?auto_245152 ) ( ON ?auto_245150 ?auto_245151 ) ( ON ?auto_245149 ?auto_245150 ) ( ON ?auto_245148 ?auto_245149 ) ( CLEAR ?auto_245146 ) ( ON ?auto_245147 ?auto_245148 ) ( CLEAR ?auto_245147 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_245143 ?auto_245144 ?auto_245145 ?auto_245146 ?auto_245147 )
      ( MAKE-10PILE ?auto_245143 ?auto_245144 ?auto_245145 ?auto_245146 ?auto_245147 ?auto_245148 ?auto_245149 ?auto_245150 ?auto_245151 ?auto_245152 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_245164 - BLOCK
      ?auto_245165 - BLOCK
      ?auto_245166 - BLOCK
      ?auto_245167 - BLOCK
      ?auto_245168 - BLOCK
      ?auto_245169 - BLOCK
      ?auto_245170 - BLOCK
      ?auto_245171 - BLOCK
      ?auto_245172 - BLOCK
      ?auto_245173 - BLOCK
    )
    :vars
    (
      ?auto_245174 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_245173 ?auto_245174 ) ( ON-TABLE ?auto_245164 ) ( ON ?auto_245165 ?auto_245164 ) ( ON ?auto_245166 ?auto_245165 ) ( not ( = ?auto_245164 ?auto_245165 ) ) ( not ( = ?auto_245164 ?auto_245166 ) ) ( not ( = ?auto_245164 ?auto_245167 ) ) ( not ( = ?auto_245164 ?auto_245168 ) ) ( not ( = ?auto_245164 ?auto_245169 ) ) ( not ( = ?auto_245164 ?auto_245170 ) ) ( not ( = ?auto_245164 ?auto_245171 ) ) ( not ( = ?auto_245164 ?auto_245172 ) ) ( not ( = ?auto_245164 ?auto_245173 ) ) ( not ( = ?auto_245164 ?auto_245174 ) ) ( not ( = ?auto_245165 ?auto_245166 ) ) ( not ( = ?auto_245165 ?auto_245167 ) ) ( not ( = ?auto_245165 ?auto_245168 ) ) ( not ( = ?auto_245165 ?auto_245169 ) ) ( not ( = ?auto_245165 ?auto_245170 ) ) ( not ( = ?auto_245165 ?auto_245171 ) ) ( not ( = ?auto_245165 ?auto_245172 ) ) ( not ( = ?auto_245165 ?auto_245173 ) ) ( not ( = ?auto_245165 ?auto_245174 ) ) ( not ( = ?auto_245166 ?auto_245167 ) ) ( not ( = ?auto_245166 ?auto_245168 ) ) ( not ( = ?auto_245166 ?auto_245169 ) ) ( not ( = ?auto_245166 ?auto_245170 ) ) ( not ( = ?auto_245166 ?auto_245171 ) ) ( not ( = ?auto_245166 ?auto_245172 ) ) ( not ( = ?auto_245166 ?auto_245173 ) ) ( not ( = ?auto_245166 ?auto_245174 ) ) ( not ( = ?auto_245167 ?auto_245168 ) ) ( not ( = ?auto_245167 ?auto_245169 ) ) ( not ( = ?auto_245167 ?auto_245170 ) ) ( not ( = ?auto_245167 ?auto_245171 ) ) ( not ( = ?auto_245167 ?auto_245172 ) ) ( not ( = ?auto_245167 ?auto_245173 ) ) ( not ( = ?auto_245167 ?auto_245174 ) ) ( not ( = ?auto_245168 ?auto_245169 ) ) ( not ( = ?auto_245168 ?auto_245170 ) ) ( not ( = ?auto_245168 ?auto_245171 ) ) ( not ( = ?auto_245168 ?auto_245172 ) ) ( not ( = ?auto_245168 ?auto_245173 ) ) ( not ( = ?auto_245168 ?auto_245174 ) ) ( not ( = ?auto_245169 ?auto_245170 ) ) ( not ( = ?auto_245169 ?auto_245171 ) ) ( not ( = ?auto_245169 ?auto_245172 ) ) ( not ( = ?auto_245169 ?auto_245173 ) ) ( not ( = ?auto_245169 ?auto_245174 ) ) ( not ( = ?auto_245170 ?auto_245171 ) ) ( not ( = ?auto_245170 ?auto_245172 ) ) ( not ( = ?auto_245170 ?auto_245173 ) ) ( not ( = ?auto_245170 ?auto_245174 ) ) ( not ( = ?auto_245171 ?auto_245172 ) ) ( not ( = ?auto_245171 ?auto_245173 ) ) ( not ( = ?auto_245171 ?auto_245174 ) ) ( not ( = ?auto_245172 ?auto_245173 ) ) ( not ( = ?auto_245172 ?auto_245174 ) ) ( not ( = ?auto_245173 ?auto_245174 ) ) ( ON ?auto_245172 ?auto_245173 ) ( ON ?auto_245171 ?auto_245172 ) ( ON ?auto_245170 ?auto_245171 ) ( ON ?auto_245169 ?auto_245170 ) ( ON ?auto_245168 ?auto_245169 ) ( CLEAR ?auto_245166 ) ( ON ?auto_245167 ?auto_245168 ) ( CLEAR ?auto_245167 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_245164 ?auto_245165 ?auto_245166 ?auto_245167 )
      ( MAKE-10PILE ?auto_245164 ?auto_245165 ?auto_245166 ?auto_245167 ?auto_245168 ?auto_245169 ?auto_245170 ?auto_245171 ?auto_245172 ?auto_245173 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_245185 - BLOCK
      ?auto_245186 - BLOCK
      ?auto_245187 - BLOCK
      ?auto_245188 - BLOCK
      ?auto_245189 - BLOCK
      ?auto_245190 - BLOCK
      ?auto_245191 - BLOCK
      ?auto_245192 - BLOCK
      ?auto_245193 - BLOCK
      ?auto_245194 - BLOCK
    )
    :vars
    (
      ?auto_245195 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_245194 ?auto_245195 ) ( ON-TABLE ?auto_245185 ) ( ON ?auto_245186 ?auto_245185 ) ( ON ?auto_245187 ?auto_245186 ) ( not ( = ?auto_245185 ?auto_245186 ) ) ( not ( = ?auto_245185 ?auto_245187 ) ) ( not ( = ?auto_245185 ?auto_245188 ) ) ( not ( = ?auto_245185 ?auto_245189 ) ) ( not ( = ?auto_245185 ?auto_245190 ) ) ( not ( = ?auto_245185 ?auto_245191 ) ) ( not ( = ?auto_245185 ?auto_245192 ) ) ( not ( = ?auto_245185 ?auto_245193 ) ) ( not ( = ?auto_245185 ?auto_245194 ) ) ( not ( = ?auto_245185 ?auto_245195 ) ) ( not ( = ?auto_245186 ?auto_245187 ) ) ( not ( = ?auto_245186 ?auto_245188 ) ) ( not ( = ?auto_245186 ?auto_245189 ) ) ( not ( = ?auto_245186 ?auto_245190 ) ) ( not ( = ?auto_245186 ?auto_245191 ) ) ( not ( = ?auto_245186 ?auto_245192 ) ) ( not ( = ?auto_245186 ?auto_245193 ) ) ( not ( = ?auto_245186 ?auto_245194 ) ) ( not ( = ?auto_245186 ?auto_245195 ) ) ( not ( = ?auto_245187 ?auto_245188 ) ) ( not ( = ?auto_245187 ?auto_245189 ) ) ( not ( = ?auto_245187 ?auto_245190 ) ) ( not ( = ?auto_245187 ?auto_245191 ) ) ( not ( = ?auto_245187 ?auto_245192 ) ) ( not ( = ?auto_245187 ?auto_245193 ) ) ( not ( = ?auto_245187 ?auto_245194 ) ) ( not ( = ?auto_245187 ?auto_245195 ) ) ( not ( = ?auto_245188 ?auto_245189 ) ) ( not ( = ?auto_245188 ?auto_245190 ) ) ( not ( = ?auto_245188 ?auto_245191 ) ) ( not ( = ?auto_245188 ?auto_245192 ) ) ( not ( = ?auto_245188 ?auto_245193 ) ) ( not ( = ?auto_245188 ?auto_245194 ) ) ( not ( = ?auto_245188 ?auto_245195 ) ) ( not ( = ?auto_245189 ?auto_245190 ) ) ( not ( = ?auto_245189 ?auto_245191 ) ) ( not ( = ?auto_245189 ?auto_245192 ) ) ( not ( = ?auto_245189 ?auto_245193 ) ) ( not ( = ?auto_245189 ?auto_245194 ) ) ( not ( = ?auto_245189 ?auto_245195 ) ) ( not ( = ?auto_245190 ?auto_245191 ) ) ( not ( = ?auto_245190 ?auto_245192 ) ) ( not ( = ?auto_245190 ?auto_245193 ) ) ( not ( = ?auto_245190 ?auto_245194 ) ) ( not ( = ?auto_245190 ?auto_245195 ) ) ( not ( = ?auto_245191 ?auto_245192 ) ) ( not ( = ?auto_245191 ?auto_245193 ) ) ( not ( = ?auto_245191 ?auto_245194 ) ) ( not ( = ?auto_245191 ?auto_245195 ) ) ( not ( = ?auto_245192 ?auto_245193 ) ) ( not ( = ?auto_245192 ?auto_245194 ) ) ( not ( = ?auto_245192 ?auto_245195 ) ) ( not ( = ?auto_245193 ?auto_245194 ) ) ( not ( = ?auto_245193 ?auto_245195 ) ) ( not ( = ?auto_245194 ?auto_245195 ) ) ( ON ?auto_245193 ?auto_245194 ) ( ON ?auto_245192 ?auto_245193 ) ( ON ?auto_245191 ?auto_245192 ) ( ON ?auto_245190 ?auto_245191 ) ( ON ?auto_245189 ?auto_245190 ) ( CLEAR ?auto_245187 ) ( ON ?auto_245188 ?auto_245189 ) ( CLEAR ?auto_245188 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_245185 ?auto_245186 ?auto_245187 ?auto_245188 )
      ( MAKE-10PILE ?auto_245185 ?auto_245186 ?auto_245187 ?auto_245188 ?auto_245189 ?auto_245190 ?auto_245191 ?auto_245192 ?auto_245193 ?auto_245194 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_245206 - BLOCK
      ?auto_245207 - BLOCK
      ?auto_245208 - BLOCK
      ?auto_245209 - BLOCK
      ?auto_245210 - BLOCK
      ?auto_245211 - BLOCK
      ?auto_245212 - BLOCK
      ?auto_245213 - BLOCK
      ?auto_245214 - BLOCK
      ?auto_245215 - BLOCK
    )
    :vars
    (
      ?auto_245216 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_245215 ?auto_245216 ) ( ON-TABLE ?auto_245206 ) ( ON ?auto_245207 ?auto_245206 ) ( not ( = ?auto_245206 ?auto_245207 ) ) ( not ( = ?auto_245206 ?auto_245208 ) ) ( not ( = ?auto_245206 ?auto_245209 ) ) ( not ( = ?auto_245206 ?auto_245210 ) ) ( not ( = ?auto_245206 ?auto_245211 ) ) ( not ( = ?auto_245206 ?auto_245212 ) ) ( not ( = ?auto_245206 ?auto_245213 ) ) ( not ( = ?auto_245206 ?auto_245214 ) ) ( not ( = ?auto_245206 ?auto_245215 ) ) ( not ( = ?auto_245206 ?auto_245216 ) ) ( not ( = ?auto_245207 ?auto_245208 ) ) ( not ( = ?auto_245207 ?auto_245209 ) ) ( not ( = ?auto_245207 ?auto_245210 ) ) ( not ( = ?auto_245207 ?auto_245211 ) ) ( not ( = ?auto_245207 ?auto_245212 ) ) ( not ( = ?auto_245207 ?auto_245213 ) ) ( not ( = ?auto_245207 ?auto_245214 ) ) ( not ( = ?auto_245207 ?auto_245215 ) ) ( not ( = ?auto_245207 ?auto_245216 ) ) ( not ( = ?auto_245208 ?auto_245209 ) ) ( not ( = ?auto_245208 ?auto_245210 ) ) ( not ( = ?auto_245208 ?auto_245211 ) ) ( not ( = ?auto_245208 ?auto_245212 ) ) ( not ( = ?auto_245208 ?auto_245213 ) ) ( not ( = ?auto_245208 ?auto_245214 ) ) ( not ( = ?auto_245208 ?auto_245215 ) ) ( not ( = ?auto_245208 ?auto_245216 ) ) ( not ( = ?auto_245209 ?auto_245210 ) ) ( not ( = ?auto_245209 ?auto_245211 ) ) ( not ( = ?auto_245209 ?auto_245212 ) ) ( not ( = ?auto_245209 ?auto_245213 ) ) ( not ( = ?auto_245209 ?auto_245214 ) ) ( not ( = ?auto_245209 ?auto_245215 ) ) ( not ( = ?auto_245209 ?auto_245216 ) ) ( not ( = ?auto_245210 ?auto_245211 ) ) ( not ( = ?auto_245210 ?auto_245212 ) ) ( not ( = ?auto_245210 ?auto_245213 ) ) ( not ( = ?auto_245210 ?auto_245214 ) ) ( not ( = ?auto_245210 ?auto_245215 ) ) ( not ( = ?auto_245210 ?auto_245216 ) ) ( not ( = ?auto_245211 ?auto_245212 ) ) ( not ( = ?auto_245211 ?auto_245213 ) ) ( not ( = ?auto_245211 ?auto_245214 ) ) ( not ( = ?auto_245211 ?auto_245215 ) ) ( not ( = ?auto_245211 ?auto_245216 ) ) ( not ( = ?auto_245212 ?auto_245213 ) ) ( not ( = ?auto_245212 ?auto_245214 ) ) ( not ( = ?auto_245212 ?auto_245215 ) ) ( not ( = ?auto_245212 ?auto_245216 ) ) ( not ( = ?auto_245213 ?auto_245214 ) ) ( not ( = ?auto_245213 ?auto_245215 ) ) ( not ( = ?auto_245213 ?auto_245216 ) ) ( not ( = ?auto_245214 ?auto_245215 ) ) ( not ( = ?auto_245214 ?auto_245216 ) ) ( not ( = ?auto_245215 ?auto_245216 ) ) ( ON ?auto_245214 ?auto_245215 ) ( ON ?auto_245213 ?auto_245214 ) ( ON ?auto_245212 ?auto_245213 ) ( ON ?auto_245211 ?auto_245212 ) ( ON ?auto_245210 ?auto_245211 ) ( ON ?auto_245209 ?auto_245210 ) ( CLEAR ?auto_245207 ) ( ON ?auto_245208 ?auto_245209 ) ( CLEAR ?auto_245208 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_245206 ?auto_245207 ?auto_245208 )
      ( MAKE-10PILE ?auto_245206 ?auto_245207 ?auto_245208 ?auto_245209 ?auto_245210 ?auto_245211 ?auto_245212 ?auto_245213 ?auto_245214 ?auto_245215 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_245227 - BLOCK
      ?auto_245228 - BLOCK
      ?auto_245229 - BLOCK
      ?auto_245230 - BLOCK
      ?auto_245231 - BLOCK
      ?auto_245232 - BLOCK
      ?auto_245233 - BLOCK
      ?auto_245234 - BLOCK
      ?auto_245235 - BLOCK
      ?auto_245236 - BLOCK
    )
    :vars
    (
      ?auto_245237 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_245236 ?auto_245237 ) ( ON-TABLE ?auto_245227 ) ( ON ?auto_245228 ?auto_245227 ) ( not ( = ?auto_245227 ?auto_245228 ) ) ( not ( = ?auto_245227 ?auto_245229 ) ) ( not ( = ?auto_245227 ?auto_245230 ) ) ( not ( = ?auto_245227 ?auto_245231 ) ) ( not ( = ?auto_245227 ?auto_245232 ) ) ( not ( = ?auto_245227 ?auto_245233 ) ) ( not ( = ?auto_245227 ?auto_245234 ) ) ( not ( = ?auto_245227 ?auto_245235 ) ) ( not ( = ?auto_245227 ?auto_245236 ) ) ( not ( = ?auto_245227 ?auto_245237 ) ) ( not ( = ?auto_245228 ?auto_245229 ) ) ( not ( = ?auto_245228 ?auto_245230 ) ) ( not ( = ?auto_245228 ?auto_245231 ) ) ( not ( = ?auto_245228 ?auto_245232 ) ) ( not ( = ?auto_245228 ?auto_245233 ) ) ( not ( = ?auto_245228 ?auto_245234 ) ) ( not ( = ?auto_245228 ?auto_245235 ) ) ( not ( = ?auto_245228 ?auto_245236 ) ) ( not ( = ?auto_245228 ?auto_245237 ) ) ( not ( = ?auto_245229 ?auto_245230 ) ) ( not ( = ?auto_245229 ?auto_245231 ) ) ( not ( = ?auto_245229 ?auto_245232 ) ) ( not ( = ?auto_245229 ?auto_245233 ) ) ( not ( = ?auto_245229 ?auto_245234 ) ) ( not ( = ?auto_245229 ?auto_245235 ) ) ( not ( = ?auto_245229 ?auto_245236 ) ) ( not ( = ?auto_245229 ?auto_245237 ) ) ( not ( = ?auto_245230 ?auto_245231 ) ) ( not ( = ?auto_245230 ?auto_245232 ) ) ( not ( = ?auto_245230 ?auto_245233 ) ) ( not ( = ?auto_245230 ?auto_245234 ) ) ( not ( = ?auto_245230 ?auto_245235 ) ) ( not ( = ?auto_245230 ?auto_245236 ) ) ( not ( = ?auto_245230 ?auto_245237 ) ) ( not ( = ?auto_245231 ?auto_245232 ) ) ( not ( = ?auto_245231 ?auto_245233 ) ) ( not ( = ?auto_245231 ?auto_245234 ) ) ( not ( = ?auto_245231 ?auto_245235 ) ) ( not ( = ?auto_245231 ?auto_245236 ) ) ( not ( = ?auto_245231 ?auto_245237 ) ) ( not ( = ?auto_245232 ?auto_245233 ) ) ( not ( = ?auto_245232 ?auto_245234 ) ) ( not ( = ?auto_245232 ?auto_245235 ) ) ( not ( = ?auto_245232 ?auto_245236 ) ) ( not ( = ?auto_245232 ?auto_245237 ) ) ( not ( = ?auto_245233 ?auto_245234 ) ) ( not ( = ?auto_245233 ?auto_245235 ) ) ( not ( = ?auto_245233 ?auto_245236 ) ) ( not ( = ?auto_245233 ?auto_245237 ) ) ( not ( = ?auto_245234 ?auto_245235 ) ) ( not ( = ?auto_245234 ?auto_245236 ) ) ( not ( = ?auto_245234 ?auto_245237 ) ) ( not ( = ?auto_245235 ?auto_245236 ) ) ( not ( = ?auto_245235 ?auto_245237 ) ) ( not ( = ?auto_245236 ?auto_245237 ) ) ( ON ?auto_245235 ?auto_245236 ) ( ON ?auto_245234 ?auto_245235 ) ( ON ?auto_245233 ?auto_245234 ) ( ON ?auto_245232 ?auto_245233 ) ( ON ?auto_245231 ?auto_245232 ) ( ON ?auto_245230 ?auto_245231 ) ( CLEAR ?auto_245228 ) ( ON ?auto_245229 ?auto_245230 ) ( CLEAR ?auto_245229 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_245227 ?auto_245228 ?auto_245229 )
      ( MAKE-10PILE ?auto_245227 ?auto_245228 ?auto_245229 ?auto_245230 ?auto_245231 ?auto_245232 ?auto_245233 ?auto_245234 ?auto_245235 ?auto_245236 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_245248 - BLOCK
      ?auto_245249 - BLOCK
      ?auto_245250 - BLOCK
      ?auto_245251 - BLOCK
      ?auto_245252 - BLOCK
      ?auto_245253 - BLOCK
      ?auto_245254 - BLOCK
      ?auto_245255 - BLOCK
      ?auto_245256 - BLOCK
      ?auto_245257 - BLOCK
    )
    :vars
    (
      ?auto_245258 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_245257 ?auto_245258 ) ( ON-TABLE ?auto_245248 ) ( not ( = ?auto_245248 ?auto_245249 ) ) ( not ( = ?auto_245248 ?auto_245250 ) ) ( not ( = ?auto_245248 ?auto_245251 ) ) ( not ( = ?auto_245248 ?auto_245252 ) ) ( not ( = ?auto_245248 ?auto_245253 ) ) ( not ( = ?auto_245248 ?auto_245254 ) ) ( not ( = ?auto_245248 ?auto_245255 ) ) ( not ( = ?auto_245248 ?auto_245256 ) ) ( not ( = ?auto_245248 ?auto_245257 ) ) ( not ( = ?auto_245248 ?auto_245258 ) ) ( not ( = ?auto_245249 ?auto_245250 ) ) ( not ( = ?auto_245249 ?auto_245251 ) ) ( not ( = ?auto_245249 ?auto_245252 ) ) ( not ( = ?auto_245249 ?auto_245253 ) ) ( not ( = ?auto_245249 ?auto_245254 ) ) ( not ( = ?auto_245249 ?auto_245255 ) ) ( not ( = ?auto_245249 ?auto_245256 ) ) ( not ( = ?auto_245249 ?auto_245257 ) ) ( not ( = ?auto_245249 ?auto_245258 ) ) ( not ( = ?auto_245250 ?auto_245251 ) ) ( not ( = ?auto_245250 ?auto_245252 ) ) ( not ( = ?auto_245250 ?auto_245253 ) ) ( not ( = ?auto_245250 ?auto_245254 ) ) ( not ( = ?auto_245250 ?auto_245255 ) ) ( not ( = ?auto_245250 ?auto_245256 ) ) ( not ( = ?auto_245250 ?auto_245257 ) ) ( not ( = ?auto_245250 ?auto_245258 ) ) ( not ( = ?auto_245251 ?auto_245252 ) ) ( not ( = ?auto_245251 ?auto_245253 ) ) ( not ( = ?auto_245251 ?auto_245254 ) ) ( not ( = ?auto_245251 ?auto_245255 ) ) ( not ( = ?auto_245251 ?auto_245256 ) ) ( not ( = ?auto_245251 ?auto_245257 ) ) ( not ( = ?auto_245251 ?auto_245258 ) ) ( not ( = ?auto_245252 ?auto_245253 ) ) ( not ( = ?auto_245252 ?auto_245254 ) ) ( not ( = ?auto_245252 ?auto_245255 ) ) ( not ( = ?auto_245252 ?auto_245256 ) ) ( not ( = ?auto_245252 ?auto_245257 ) ) ( not ( = ?auto_245252 ?auto_245258 ) ) ( not ( = ?auto_245253 ?auto_245254 ) ) ( not ( = ?auto_245253 ?auto_245255 ) ) ( not ( = ?auto_245253 ?auto_245256 ) ) ( not ( = ?auto_245253 ?auto_245257 ) ) ( not ( = ?auto_245253 ?auto_245258 ) ) ( not ( = ?auto_245254 ?auto_245255 ) ) ( not ( = ?auto_245254 ?auto_245256 ) ) ( not ( = ?auto_245254 ?auto_245257 ) ) ( not ( = ?auto_245254 ?auto_245258 ) ) ( not ( = ?auto_245255 ?auto_245256 ) ) ( not ( = ?auto_245255 ?auto_245257 ) ) ( not ( = ?auto_245255 ?auto_245258 ) ) ( not ( = ?auto_245256 ?auto_245257 ) ) ( not ( = ?auto_245256 ?auto_245258 ) ) ( not ( = ?auto_245257 ?auto_245258 ) ) ( ON ?auto_245256 ?auto_245257 ) ( ON ?auto_245255 ?auto_245256 ) ( ON ?auto_245254 ?auto_245255 ) ( ON ?auto_245253 ?auto_245254 ) ( ON ?auto_245252 ?auto_245253 ) ( ON ?auto_245251 ?auto_245252 ) ( ON ?auto_245250 ?auto_245251 ) ( CLEAR ?auto_245248 ) ( ON ?auto_245249 ?auto_245250 ) ( CLEAR ?auto_245249 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_245248 ?auto_245249 )
      ( MAKE-10PILE ?auto_245248 ?auto_245249 ?auto_245250 ?auto_245251 ?auto_245252 ?auto_245253 ?auto_245254 ?auto_245255 ?auto_245256 ?auto_245257 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_245269 - BLOCK
      ?auto_245270 - BLOCK
      ?auto_245271 - BLOCK
      ?auto_245272 - BLOCK
      ?auto_245273 - BLOCK
      ?auto_245274 - BLOCK
      ?auto_245275 - BLOCK
      ?auto_245276 - BLOCK
      ?auto_245277 - BLOCK
      ?auto_245278 - BLOCK
    )
    :vars
    (
      ?auto_245279 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_245278 ?auto_245279 ) ( ON-TABLE ?auto_245269 ) ( not ( = ?auto_245269 ?auto_245270 ) ) ( not ( = ?auto_245269 ?auto_245271 ) ) ( not ( = ?auto_245269 ?auto_245272 ) ) ( not ( = ?auto_245269 ?auto_245273 ) ) ( not ( = ?auto_245269 ?auto_245274 ) ) ( not ( = ?auto_245269 ?auto_245275 ) ) ( not ( = ?auto_245269 ?auto_245276 ) ) ( not ( = ?auto_245269 ?auto_245277 ) ) ( not ( = ?auto_245269 ?auto_245278 ) ) ( not ( = ?auto_245269 ?auto_245279 ) ) ( not ( = ?auto_245270 ?auto_245271 ) ) ( not ( = ?auto_245270 ?auto_245272 ) ) ( not ( = ?auto_245270 ?auto_245273 ) ) ( not ( = ?auto_245270 ?auto_245274 ) ) ( not ( = ?auto_245270 ?auto_245275 ) ) ( not ( = ?auto_245270 ?auto_245276 ) ) ( not ( = ?auto_245270 ?auto_245277 ) ) ( not ( = ?auto_245270 ?auto_245278 ) ) ( not ( = ?auto_245270 ?auto_245279 ) ) ( not ( = ?auto_245271 ?auto_245272 ) ) ( not ( = ?auto_245271 ?auto_245273 ) ) ( not ( = ?auto_245271 ?auto_245274 ) ) ( not ( = ?auto_245271 ?auto_245275 ) ) ( not ( = ?auto_245271 ?auto_245276 ) ) ( not ( = ?auto_245271 ?auto_245277 ) ) ( not ( = ?auto_245271 ?auto_245278 ) ) ( not ( = ?auto_245271 ?auto_245279 ) ) ( not ( = ?auto_245272 ?auto_245273 ) ) ( not ( = ?auto_245272 ?auto_245274 ) ) ( not ( = ?auto_245272 ?auto_245275 ) ) ( not ( = ?auto_245272 ?auto_245276 ) ) ( not ( = ?auto_245272 ?auto_245277 ) ) ( not ( = ?auto_245272 ?auto_245278 ) ) ( not ( = ?auto_245272 ?auto_245279 ) ) ( not ( = ?auto_245273 ?auto_245274 ) ) ( not ( = ?auto_245273 ?auto_245275 ) ) ( not ( = ?auto_245273 ?auto_245276 ) ) ( not ( = ?auto_245273 ?auto_245277 ) ) ( not ( = ?auto_245273 ?auto_245278 ) ) ( not ( = ?auto_245273 ?auto_245279 ) ) ( not ( = ?auto_245274 ?auto_245275 ) ) ( not ( = ?auto_245274 ?auto_245276 ) ) ( not ( = ?auto_245274 ?auto_245277 ) ) ( not ( = ?auto_245274 ?auto_245278 ) ) ( not ( = ?auto_245274 ?auto_245279 ) ) ( not ( = ?auto_245275 ?auto_245276 ) ) ( not ( = ?auto_245275 ?auto_245277 ) ) ( not ( = ?auto_245275 ?auto_245278 ) ) ( not ( = ?auto_245275 ?auto_245279 ) ) ( not ( = ?auto_245276 ?auto_245277 ) ) ( not ( = ?auto_245276 ?auto_245278 ) ) ( not ( = ?auto_245276 ?auto_245279 ) ) ( not ( = ?auto_245277 ?auto_245278 ) ) ( not ( = ?auto_245277 ?auto_245279 ) ) ( not ( = ?auto_245278 ?auto_245279 ) ) ( ON ?auto_245277 ?auto_245278 ) ( ON ?auto_245276 ?auto_245277 ) ( ON ?auto_245275 ?auto_245276 ) ( ON ?auto_245274 ?auto_245275 ) ( ON ?auto_245273 ?auto_245274 ) ( ON ?auto_245272 ?auto_245273 ) ( ON ?auto_245271 ?auto_245272 ) ( CLEAR ?auto_245269 ) ( ON ?auto_245270 ?auto_245271 ) ( CLEAR ?auto_245270 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_245269 ?auto_245270 )
      ( MAKE-10PILE ?auto_245269 ?auto_245270 ?auto_245271 ?auto_245272 ?auto_245273 ?auto_245274 ?auto_245275 ?auto_245276 ?auto_245277 ?auto_245278 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_245290 - BLOCK
      ?auto_245291 - BLOCK
      ?auto_245292 - BLOCK
      ?auto_245293 - BLOCK
      ?auto_245294 - BLOCK
      ?auto_245295 - BLOCK
      ?auto_245296 - BLOCK
      ?auto_245297 - BLOCK
      ?auto_245298 - BLOCK
      ?auto_245299 - BLOCK
    )
    :vars
    (
      ?auto_245300 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_245299 ?auto_245300 ) ( not ( = ?auto_245290 ?auto_245291 ) ) ( not ( = ?auto_245290 ?auto_245292 ) ) ( not ( = ?auto_245290 ?auto_245293 ) ) ( not ( = ?auto_245290 ?auto_245294 ) ) ( not ( = ?auto_245290 ?auto_245295 ) ) ( not ( = ?auto_245290 ?auto_245296 ) ) ( not ( = ?auto_245290 ?auto_245297 ) ) ( not ( = ?auto_245290 ?auto_245298 ) ) ( not ( = ?auto_245290 ?auto_245299 ) ) ( not ( = ?auto_245290 ?auto_245300 ) ) ( not ( = ?auto_245291 ?auto_245292 ) ) ( not ( = ?auto_245291 ?auto_245293 ) ) ( not ( = ?auto_245291 ?auto_245294 ) ) ( not ( = ?auto_245291 ?auto_245295 ) ) ( not ( = ?auto_245291 ?auto_245296 ) ) ( not ( = ?auto_245291 ?auto_245297 ) ) ( not ( = ?auto_245291 ?auto_245298 ) ) ( not ( = ?auto_245291 ?auto_245299 ) ) ( not ( = ?auto_245291 ?auto_245300 ) ) ( not ( = ?auto_245292 ?auto_245293 ) ) ( not ( = ?auto_245292 ?auto_245294 ) ) ( not ( = ?auto_245292 ?auto_245295 ) ) ( not ( = ?auto_245292 ?auto_245296 ) ) ( not ( = ?auto_245292 ?auto_245297 ) ) ( not ( = ?auto_245292 ?auto_245298 ) ) ( not ( = ?auto_245292 ?auto_245299 ) ) ( not ( = ?auto_245292 ?auto_245300 ) ) ( not ( = ?auto_245293 ?auto_245294 ) ) ( not ( = ?auto_245293 ?auto_245295 ) ) ( not ( = ?auto_245293 ?auto_245296 ) ) ( not ( = ?auto_245293 ?auto_245297 ) ) ( not ( = ?auto_245293 ?auto_245298 ) ) ( not ( = ?auto_245293 ?auto_245299 ) ) ( not ( = ?auto_245293 ?auto_245300 ) ) ( not ( = ?auto_245294 ?auto_245295 ) ) ( not ( = ?auto_245294 ?auto_245296 ) ) ( not ( = ?auto_245294 ?auto_245297 ) ) ( not ( = ?auto_245294 ?auto_245298 ) ) ( not ( = ?auto_245294 ?auto_245299 ) ) ( not ( = ?auto_245294 ?auto_245300 ) ) ( not ( = ?auto_245295 ?auto_245296 ) ) ( not ( = ?auto_245295 ?auto_245297 ) ) ( not ( = ?auto_245295 ?auto_245298 ) ) ( not ( = ?auto_245295 ?auto_245299 ) ) ( not ( = ?auto_245295 ?auto_245300 ) ) ( not ( = ?auto_245296 ?auto_245297 ) ) ( not ( = ?auto_245296 ?auto_245298 ) ) ( not ( = ?auto_245296 ?auto_245299 ) ) ( not ( = ?auto_245296 ?auto_245300 ) ) ( not ( = ?auto_245297 ?auto_245298 ) ) ( not ( = ?auto_245297 ?auto_245299 ) ) ( not ( = ?auto_245297 ?auto_245300 ) ) ( not ( = ?auto_245298 ?auto_245299 ) ) ( not ( = ?auto_245298 ?auto_245300 ) ) ( not ( = ?auto_245299 ?auto_245300 ) ) ( ON ?auto_245298 ?auto_245299 ) ( ON ?auto_245297 ?auto_245298 ) ( ON ?auto_245296 ?auto_245297 ) ( ON ?auto_245295 ?auto_245296 ) ( ON ?auto_245294 ?auto_245295 ) ( ON ?auto_245293 ?auto_245294 ) ( ON ?auto_245292 ?auto_245293 ) ( ON ?auto_245291 ?auto_245292 ) ( ON ?auto_245290 ?auto_245291 ) ( CLEAR ?auto_245290 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_245290 )
      ( MAKE-10PILE ?auto_245290 ?auto_245291 ?auto_245292 ?auto_245293 ?auto_245294 ?auto_245295 ?auto_245296 ?auto_245297 ?auto_245298 ?auto_245299 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_245311 - BLOCK
      ?auto_245312 - BLOCK
      ?auto_245313 - BLOCK
      ?auto_245314 - BLOCK
      ?auto_245315 - BLOCK
      ?auto_245316 - BLOCK
      ?auto_245317 - BLOCK
      ?auto_245318 - BLOCK
      ?auto_245319 - BLOCK
      ?auto_245320 - BLOCK
    )
    :vars
    (
      ?auto_245321 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_245320 ?auto_245321 ) ( not ( = ?auto_245311 ?auto_245312 ) ) ( not ( = ?auto_245311 ?auto_245313 ) ) ( not ( = ?auto_245311 ?auto_245314 ) ) ( not ( = ?auto_245311 ?auto_245315 ) ) ( not ( = ?auto_245311 ?auto_245316 ) ) ( not ( = ?auto_245311 ?auto_245317 ) ) ( not ( = ?auto_245311 ?auto_245318 ) ) ( not ( = ?auto_245311 ?auto_245319 ) ) ( not ( = ?auto_245311 ?auto_245320 ) ) ( not ( = ?auto_245311 ?auto_245321 ) ) ( not ( = ?auto_245312 ?auto_245313 ) ) ( not ( = ?auto_245312 ?auto_245314 ) ) ( not ( = ?auto_245312 ?auto_245315 ) ) ( not ( = ?auto_245312 ?auto_245316 ) ) ( not ( = ?auto_245312 ?auto_245317 ) ) ( not ( = ?auto_245312 ?auto_245318 ) ) ( not ( = ?auto_245312 ?auto_245319 ) ) ( not ( = ?auto_245312 ?auto_245320 ) ) ( not ( = ?auto_245312 ?auto_245321 ) ) ( not ( = ?auto_245313 ?auto_245314 ) ) ( not ( = ?auto_245313 ?auto_245315 ) ) ( not ( = ?auto_245313 ?auto_245316 ) ) ( not ( = ?auto_245313 ?auto_245317 ) ) ( not ( = ?auto_245313 ?auto_245318 ) ) ( not ( = ?auto_245313 ?auto_245319 ) ) ( not ( = ?auto_245313 ?auto_245320 ) ) ( not ( = ?auto_245313 ?auto_245321 ) ) ( not ( = ?auto_245314 ?auto_245315 ) ) ( not ( = ?auto_245314 ?auto_245316 ) ) ( not ( = ?auto_245314 ?auto_245317 ) ) ( not ( = ?auto_245314 ?auto_245318 ) ) ( not ( = ?auto_245314 ?auto_245319 ) ) ( not ( = ?auto_245314 ?auto_245320 ) ) ( not ( = ?auto_245314 ?auto_245321 ) ) ( not ( = ?auto_245315 ?auto_245316 ) ) ( not ( = ?auto_245315 ?auto_245317 ) ) ( not ( = ?auto_245315 ?auto_245318 ) ) ( not ( = ?auto_245315 ?auto_245319 ) ) ( not ( = ?auto_245315 ?auto_245320 ) ) ( not ( = ?auto_245315 ?auto_245321 ) ) ( not ( = ?auto_245316 ?auto_245317 ) ) ( not ( = ?auto_245316 ?auto_245318 ) ) ( not ( = ?auto_245316 ?auto_245319 ) ) ( not ( = ?auto_245316 ?auto_245320 ) ) ( not ( = ?auto_245316 ?auto_245321 ) ) ( not ( = ?auto_245317 ?auto_245318 ) ) ( not ( = ?auto_245317 ?auto_245319 ) ) ( not ( = ?auto_245317 ?auto_245320 ) ) ( not ( = ?auto_245317 ?auto_245321 ) ) ( not ( = ?auto_245318 ?auto_245319 ) ) ( not ( = ?auto_245318 ?auto_245320 ) ) ( not ( = ?auto_245318 ?auto_245321 ) ) ( not ( = ?auto_245319 ?auto_245320 ) ) ( not ( = ?auto_245319 ?auto_245321 ) ) ( not ( = ?auto_245320 ?auto_245321 ) ) ( ON ?auto_245319 ?auto_245320 ) ( ON ?auto_245318 ?auto_245319 ) ( ON ?auto_245317 ?auto_245318 ) ( ON ?auto_245316 ?auto_245317 ) ( ON ?auto_245315 ?auto_245316 ) ( ON ?auto_245314 ?auto_245315 ) ( ON ?auto_245313 ?auto_245314 ) ( ON ?auto_245312 ?auto_245313 ) ( ON ?auto_245311 ?auto_245312 ) ( CLEAR ?auto_245311 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_245311 )
      ( MAKE-10PILE ?auto_245311 ?auto_245312 ?auto_245313 ?auto_245314 ?auto_245315 ?auto_245316 ?auto_245317 ?auto_245318 ?auto_245319 ?auto_245320 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_245333 - BLOCK
      ?auto_245334 - BLOCK
      ?auto_245335 - BLOCK
      ?auto_245336 - BLOCK
      ?auto_245337 - BLOCK
      ?auto_245338 - BLOCK
      ?auto_245339 - BLOCK
      ?auto_245340 - BLOCK
      ?auto_245341 - BLOCK
      ?auto_245342 - BLOCK
      ?auto_245343 - BLOCK
    )
    :vars
    (
      ?auto_245344 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_245342 ) ( ON ?auto_245343 ?auto_245344 ) ( CLEAR ?auto_245343 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_245333 ) ( ON ?auto_245334 ?auto_245333 ) ( ON ?auto_245335 ?auto_245334 ) ( ON ?auto_245336 ?auto_245335 ) ( ON ?auto_245337 ?auto_245336 ) ( ON ?auto_245338 ?auto_245337 ) ( ON ?auto_245339 ?auto_245338 ) ( ON ?auto_245340 ?auto_245339 ) ( ON ?auto_245341 ?auto_245340 ) ( ON ?auto_245342 ?auto_245341 ) ( not ( = ?auto_245333 ?auto_245334 ) ) ( not ( = ?auto_245333 ?auto_245335 ) ) ( not ( = ?auto_245333 ?auto_245336 ) ) ( not ( = ?auto_245333 ?auto_245337 ) ) ( not ( = ?auto_245333 ?auto_245338 ) ) ( not ( = ?auto_245333 ?auto_245339 ) ) ( not ( = ?auto_245333 ?auto_245340 ) ) ( not ( = ?auto_245333 ?auto_245341 ) ) ( not ( = ?auto_245333 ?auto_245342 ) ) ( not ( = ?auto_245333 ?auto_245343 ) ) ( not ( = ?auto_245333 ?auto_245344 ) ) ( not ( = ?auto_245334 ?auto_245335 ) ) ( not ( = ?auto_245334 ?auto_245336 ) ) ( not ( = ?auto_245334 ?auto_245337 ) ) ( not ( = ?auto_245334 ?auto_245338 ) ) ( not ( = ?auto_245334 ?auto_245339 ) ) ( not ( = ?auto_245334 ?auto_245340 ) ) ( not ( = ?auto_245334 ?auto_245341 ) ) ( not ( = ?auto_245334 ?auto_245342 ) ) ( not ( = ?auto_245334 ?auto_245343 ) ) ( not ( = ?auto_245334 ?auto_245344 ) ) ( not ( = ?auto_245335 ?auto_245336 ) ) ( not ( = ?auto_245335 ?auto_245337 ) ) ( not ( = ?auto_245335 ?auto_245338 ) ) ( not ( = ?auto_245335 ?auto_245339 ) ) ( not ( = ?auto_245335 ?auto_245340 ) ) ( not ( = ?auto_245335 ?auto_245341 ) ) ( not ( = ?auto_245335 ?auto_245342 ) ) ( not ( = ?auto_245335 ?auto_245343 ) ) ( not ( = ?auto_245335 ?auto_245344 ) ) ( not ( = ?auto_245336 ?auto_245337 ) ) ( not ( = ?auto_245336 ?auto_245338 ) ) ( not ( = ?auto_245336 ?auto_245339 ) ) ( not ( = ?auto_245336 ?auto_245340 ) ) ( not ( = ?auto_245336 ?auto_245341 ) ) ( not ( = ?auto_245336 ?auto_245342 ) ) ( not ( = ?auto_245336 ?auto_245343 ) ) ( not ( = ?auto_245336 ?auto_245344 ) ) ( not ( = ?auto_245337 ?auto_245338 ) ) ( not ( = ?auto_245337 ?auto_245339 ) ) ( not ( = ?auto_245337 ?auto_245340 ) ) ( not ( = ?auto_245337 ?auto_245341 ) ) ( not ( = ?auto_245337 ?auto_245342 ) ) ( not ( = ?auto_245337 ?auto_245343 ) ) ( not ( = ?auto_245337 ?auto_245344 ) ) ( not ( = ?auto_245338 ?auto_245339 ) ) ( not ( = ?auto_245338 ?auto_245340 ) ) ( not ( = ?auto_245338 ?auto_245341 ) ) ( not ( = ?auto_245338 ?auto_245342 ) ) ( not ( = ?auto_245338 ?auto_245343 ) ) ( not ( = ?auto_245338 ?auto_245344 ) ) ( not ( = ?auto_245339 ?auto_245340 ) ) ( not ( = ?auto_245339 ?auto_245341 ) ) ( not ( = ?auto_245339 ?auto_245342 ) ) ( not ( = ?auto_245339 ?auto_245343 ) ) ( not ( = ?auto_245339 ?auto_245344 ) ) ( not ( = ?auto_245340 ?auto_245341 ) ) ( not ( = ?auto_245340 ?auto_245342 ) ) ( not ( = ?auto_245340 ?auto_245343 ) ) ( not ( = ?auto_245340 ?auto_245344 ) ) ( not ( = ?auto_245341 ?auto_245342 ) ) ( not ( = ?auto_245341 ?auto_245343 ) ) ( not ( = ?auto_245341 ?auto_245344 ) ) ( not ( = ?auto_245342 ?auto_245343 ) ) ( not ( = ?auto_245342 ?auto_245344 ) ) ( not ( = ?auto_245343 ?auto_245344 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_245343 ?auto_245344 )
      ( !STACK ?auto_245343 ?auto_245342 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_245356 - BLOCK
      ?auto_245357 - BLOCK
      ?auto_245358 - BLOCK
      ?auto_245359 - BLOCK
      ?auto_245360 - BLOCK
      ?auto_245361 - BLOCK
      ?auto_245362 - BLOCK
      ?auto_245363 - BLOCK
      ?auto_245364 - BLOCK
      ?auto_245365 - BLOCK
      ?auto_245366 - BLOCK
    )
    :vars
    (
      ?auto_245367 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_245365 ) ( ON ?auto_245366 ?auto_245367 ) ( CLEAR ?auto_245366 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_245356 ) ( ON ?auto_245357 ?auto_245356 ) ( ON ?auto_245358 ?auto_245357 ) ( ON ?auto_245359 ?auto_245358 ) ( ON ?auto_245360 ?auto_245359 ) ( ON ?auto_245361 ?auto_245360 ) ( ON ?auto_245362 ?auto_245361 ) ( ON ?auto_245363 ?auto_245362 ) ( ON ?auto_245364 ?auto_245363 ) ( ON ?auto_245365 ?auto_245364 ) ( not ( = ?auto_245356 ?auto_245357 ) ) ( not ( = ?auto_245356 ?auto_245358 ) ) ( not ( = ?auto_245356 ?auto_245359 ) ) ( not ( = ?auto_245356 ?auto_245360 ) ) ( not ( = ?auto_245356 ?auto_245361 ) ) ( not ( = ?auto_245356 ?auto_245362 ) ) ( not ( = ?auto_245356 ?auto_245363 ) ) ( not ( = ?auto_245356 ?auto_245364 ) ) ( not ( = ?auto_245356 ?auto_245365 ) ) ( not ( = ?auto_245356 ?auto_245366 ) ) ( not ( = ?auto_245356 ?auto_245367 ) ) ( not ( = ?auto_245357 ?auto_245358 ) ) ( not ( = ?auto_245357 ?auto_245359 ) ) ( not ( = ?auto_245357 ?auto_245360 ) ) ( not ( = ?auto_245357 ?auto_245361 ) ) ( not ( = ?auto_245357 ?auto_245362 ) ) ( not ( = ?auto_245357 ?auto_245363 ) ) ( not ( = ?auto_245357 ?auto_245364 ) ) ( not ( = ?auto_245357 ?auto_245365 ) ) ( not ( = ?auto_245357 ?auto_245366 ) ) ( not ( = ?auto_245357 ?auto_245367 ) ) ( not ( = ?auto_245358 ?auto_245359 ) ) ( not ( = ?auto_245358 ?auto_245360 ) ) ( not ( = ?auto_245358 ?auto_245361 ) ) ( not ( = ?auto_245358 ?auto_245362 ) ) ( not ( = ?auto_245358 ?auto_245363 ) ) ( not ( = ?auto_245358 ?auto_245364 ) ) ( not ( = ?auto_245358 ?auto_245365 ) ) ( not ( = ?auto_245358 ?auto_245366 ) ) ( not ( = ?auto_245358 ?auto_245367 ) ) ( not ( = ?auto_245359 ?auto_245360 ) ) ( not ( = ?auto_245359 ?auto_245361 ) ) ( not ( = ?auto_245359 ?auto_245362 ) ) ( not ( = ?auto_245359 ?auto_245363 ) ) ( not ( = ?auto_245359 ?auto_245364 ) ) ( not ( = ?auto_245359 ?auto_245365 ) ) ( not ( = ?auto_245359 ?auto_245366 ) ) ( not ( = ?auto_245359 ?auto_245367 ) ) ( not ( = ?auto_245360 ?auto_245361 ) ) ( not ( = ?auto_245360 ?auto_245362 ) ) ( not ( = ?auto_245360 ?auto_245363 ) ) ( not ( = ?auto_245360 ?auto_245364 ) ) ( not ( = ?auto_245360 ?auto_245365 ) ) ( not ( = ?auto_245360 ?auto_245366 ) ) ( not ( = ?auto_245360 ?auto_245367 ) ) ( not ( = ?auto_245361 ?auto_245362 ) ) ( not ( = ?auto_245361 ?auto_245363 ) ) ( not ( = ?auto_245361 ?auto_245364 ) ) ( not ( = ?auto_245361 ?auto_245365 ) ) ( not ( = ?auto_245361 ?auto_245366 ) ) ( not ( = ?auto_245361 ?auto_245367 ) ) ( not ( = ?auto_245362 ?auto_245363 ) ) ( not ( = ?auto_245362 ?auto_245364 ) ) ( not ( = ?auto_245362 ?auto_245365 ) ) ( not ( = ?auto_245362 ?auto_245366 ) ) ( not ( = ?auto_245362 ?auto_245367 ) ) ( not ( = ?auto_245363 ?auto_245364 ) ) ( not ( = ?auto_245363 ?auto_245365 ) ) ( not ( = ?auto_245363 ?auto_245366 ) ) ( not ( = ?auto_245363 ?auto_245367 ) ) ( not ( = ?auto_245364 ?auto_245365 ) ) ( not ( = ?auto_245364 ?auto_245366 ) ) ( not ( = ?auto_245364 ?auto_245367 ) ) ( not ( = ?auto_245365 ?auto_245366 ) ) ( not ( = ?auto_245365 ?auto_245367 ) ) ( not ( = ?auto_245366 ?auto_245367 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_245366 ?auto_245367 )
      ( !STACK ?auto_245366 ?auto_245365 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_245379 - BLOCK
      ?auto_245380 - BLOCK
      ?auto_245381 - BLOCK
      ?auto_245382 - BLOCK
      ?auto_245383 - BLOCK
      ?auto_245384 - BLOCK
      ?auto_245385 - BLOCK
      ?auto_245386 - BLOCK
      ?auto_245387 - BLOCK
      ?auto_245388 - BLOCK
      ?auto_245389 - BLOCK
    )
    :vars
    (
      ?auto_245390 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_245389 ?auto_245390 ) ( ON-TABLE ?auto_245379 ) ( ON ?auto_245380 ?auto_245379 ) ( ON ?auto_245381 ?auto_245380 ) ( ON ?auto_245382 ?auto_245381 ) ( ON ?auto_245383 ?auto_245382 ) ( ON ?auto_245384 ?auto_245383 ) ( ON ?auto_245385 ?auto_245384 ) ( ON ?auto_245386 ?auto_245385 ) ( ON ?auto_245387 ?auto_245386 ) ( not ( = ?auto_245379 ?auto_245380 ) ) ( not ( = ?auto_245379 ?auto_245381 ) ) ( not ( = ?auto_245379 ?auto_245382 ) ) ( not ( = ?auto_245379 ?auto_245383 ) ) ( not ( = ?auto_245379 ?auto_245384 ) ) ( not ( = ?auto_245379 ?auto_245385 ) ) ( not ( = ?auto_245379 ?auto_245386 ) ) ( not ( = ?auto_245379 ?auto_245387 ) ) ( not ( = ?auto_245379 ?auto_245388 ) ) ( not ( = ?auto_245379 ?auto_245389 ) ) ( not ( = ?auto_245379 ?auto_245390 ) ) ( not ( = ?auto_245380 ?auto_245381 ) ) ( not ( = ?auto_245380 ?auto_245382 ) ) ( not ( = ?auto_245380 ?auto_245383 ) ) ( not ( = ?auto_245380 ?auto_245384 ) ) ( not ( = ?auto_245380 ?auto_245385 ) ) ( not ( = ?auto_245380 ?auto_245386 ) ) ( not ( = ?auto_245380 ?auto_245387 ) ) ( not ( = ?auto_245380 ?auto_245388 ) ) ( not ( = ?auto_245380 ?auto_245389 ) ) ( not ( = ?auto_245380 ?auto_245390 ) ) ( not ( = ?auto_245381 ?auto_245382 ) ) ( not ( = ?auto_245381 ?auto_245383 ) ) ( not ( = ?auto_245381 ?auto_245384 ) ) ( not ( = ?auto_245381 ?auto_245385 ) ) ( not ( = ?auto_245381 ?auto_245386 ) ) ( not ( = ?auto_245381 ?auto_245387 ) ) ( not ( = ?auto_245381 ?auto_245388 ) ) ( not ( = ?auto_245381 ?auto_245389 ) ) ( not ( = ?auto_245381 ?auto_245390 ) ) ( not ( = ?auto_245382 ?auto_245383 ) ) ( not ( = ?auto_245382 ?auto_245384 ) ) ( not ( = ?auto_245382 ?auto_245385 ) ) ( not ( = ?auto_245382 ?auto_245386 ) ) ( not ( = ?auto_245382 ?auto_245387 ) ) ( not ( = ?auto_245382 ?auto_245388 ) ) ( not ( = ?auto_245382 ?auto_245389 ) ) ( not ( = ?auto_245382 ?auto_245390 ) ) ( not ( = ?auto_245383 ?auto_245384 ) ) ( not ( = ?auto_245383 ?auto_245385 ) ) ( not ( = ?auto_245383 ?auto_245386 ) ) ( not ( = ?auto_245383 ?auto_245387 ) ) ( not ( = ?auto_245383 ?auto_245388 ) ) ( not ( = ?auto_245383 ?auto_245389 ) ) ( not ( = ?auto_245383 ?auto_245390 ) ) ( not ( = ?auto_245384 ?auto_245385 ) ) ( not ( = ?auto_245384 ?auto_245386 ) ) ( not ( = ?auto_245384 ?auto_245387 ) ) ( not ( = ?auto_245384 ?auto_245388 ) ) ( not ( = ?auto_245384 ?auto_245389 ) ) ( not ( = ?auto_245384 ?auto_245390 ) ) ( not ( = ?auto_245385 ?auto_245386 ) ) ( not ( = ?auto_245385 ?auto_245387 ) ) ( not ( = ?auto_245385 ?auto_245388 ) ) ( not ( = ?auto_245385 ?auto_245389 ) ) ( not ( = ?auto_245385 ?auto_245390 ) ) ( not ( = ?auto_245386 ?auto_245387 ) ) ( not ( = ?auto_245386 ?auto_245388 ) ) ( not ( = ?auto_245386 ?auto_245389 ) ) ( not ( = ?auto_245386 ?auto_245390 ) ) ( not ( = ?auto_245387 ?auto_245388 ) ) ( not ( = ?auto_245387 ?auto_245389 ) ) ( not ( = ?auto_245387 ?auto_245390 ) ) ( not ( = ?auto_245388 ?auto_245389 ) ) ( not ( = ?auto_245388 ?auto_245390 ) ) ( not ( = ?auto_245389 ?auto_245390 ) ) ( CLEAR ?auto_245387 ) ( ON ?auto_245388 ?auto_245389 ) ( CLEAR ?auto_245388 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_245379 ?auto_245380 ?auto_245381 ?auto_245382 ?auto_245383 ?auto_245384 ?auto_245385 ?auto_245386 ?auto_245387 ?auto_245388 )
      ( MAKE-11PILE ?auto_245379 ?auto_245380 ?auto_245381 ?auto_245382 ?auto_245383 ?auto_245384 ?auto_245385 ?auto_245386 ?auto_245387 ?auto_245388 ?auto_245389 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_245402 - BLOCK
      ?auto_245403 - BLOCK
      ?auto_245404 - BLOCK
      ?auto_245405 - BLOCK
      ?auto_245406 - BLOCK
      ?auto_245407 - BLOCK
      ?auto_245408 - BLOCK
      ?auto_245409 - BLOCK
      ?auto_245410 - BLOCK
      ?auto_245411 - BLOCK
      ?auto_245412 - BLOCK
    )
    :vars
    (
      ?auto_245413 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_245412 ?auto_245413 ) ( ON-TABLE ?auto_245402 ) ( ON ?auto_245403 ?auto_245402 ) ( ON ?auto_245404 ?auto_245403 ) ( ON ?auto_245405 ?auto_245404 ) ( ON ?auto_245406 ?auto_245405 ) ( ON ?auto_245407 ?auto_245406 ) ( ON ?auto_245408 ?auto_245407 ) ( ON ?auto_245409 ?auto_245408 ) ( ON ?auto_245410 ?auto_245409 ) ( not ( = ?auto_245402 ?auto_245403 ) ) ( not ( = ?auto_245402 ?auto_245404 ) ) ( not ( = ?auto_245402 ?auto_245405 ) ) ( not ( = ?auto_245402 ?auto_245406 ) ) ( not ( = ?auto_245402 ?auto_245407 ) ) ( not ( = ?auto_245402 ?auto_245408 ) ) ( not ( = ?auto_245402 ?auto_245409 ) ) ( not ( = ?auto_245402 ?auto_245410 ) ) ( not ( = ?auto_245402 ?auto_245411 ) ) ( not ( = ?auto_245402 ?auto_245412 ) ) ( not ( = ?auto_245402 ?auto_245413 ) ) ( not ( = ?auto_245403 ?auto_245404 ) ) ( not ( = ?auto_245403 ?auto_245405 ) ) ( not ( = ?auto_245403 ?auto_245406 ) ) ( not ( = ?auto_245403 ?auto_245407 ) ) ( not ( = ?auto_245403 ?auto_245408 ) ) ( not ( = ?auto_245403 ?auto_245409 ) ) ( not ( = ?auto_245403 ?auto_245410 ) ) ( not ( = ?auto_245403 ?auto_245411 ) ) ( not ( = ?auto_245403 ?auto_245412 ) ) ( not ( = ?auto_245403 ?auto_245413 ) ) ( not ( = ?auto_245404 ?auto_245405 ) ) ( not ( = ?auto_245404 ?auto_245406 ) ) ( not ( = ?auto_245404 ?auto_245407 ) ) ( not ( = ?auto_245404 ?auto_245408 ) ) ( not ( = ?auto_245404 ?auto_245409 ) ) ( not ( = ?auto_245404 ?auto_245410 ) ) ( not ( = ?auto_245404 ?auto_245411 ) ) ( not ( = ?auto_245404 ?auto_245412 ) ) ( not ( = ?auto_245404 ?auto_245413 ) ) ( not ( = ?auto_245405 ?auto_245406 ) ) ( not ( = ?auto_245405 ?auto_245407 ) ) ( not ( = ?auto_245405 ?auto_245408 ) ) ( not ( = ?auto_245405 ?auto_245409 ) ) ( not ( = ?auto_245405 ?auto_245410 ) ) ( not ( = ?auto_245405 ?auto_245411 ) ) ( not ( = ?auto_245405 ?auto_245412 ) ) ( not ( = ?auto_245405 ?auto_245413 ) ) ( not ( = ?auto_245406 ?auto_245407 ) ) ( not ( = ?auto_245406 ?auto_245408 ) ) ( not ( = ?auto_245406 ?auto_245409 ) ) ( not ( = ?auto_245406 ?auto_245410 ) ) ( not ( = ?auto_245406 ?auto_245411 ) ) ( not ( = ?auto_245406 ?auto_245412 ) ) ( not ( = ?auto_245406 ?auto_245413 ) ) ( not ( = ?auto_245407 ?auto_245408 ) ) ( not ( = ?auto_245407 ?auto_245409 ) ) ( not ( = ?auto_245407 ?auto_245410 ) ) ( not ( = ?auto_245407 ?auto_245411 ) ) ( not ( = ?auto_245407 ?auto_245412 ) ) ( not ( = ?auto_245407 ?auto_245413 ) ) ( not ( = ?auto_245408 ?auto_245409 ) ) ( not ( = ?auto_245408 ?auto_245410 ) ) ( not ( = ?auto_245408 ?auto_245411 ) ) ( not ( = ?auto_245408 ?auto_245412 ) ) ( not ( = ?auto_245408 ?auto_245413 ) ) ( not ( = ?auto_245409 ?auto_245410 ) ) ( not ( = ?auto_245409 ?auto_245411 ) ) ( not ( = ?auto_245409 ?auto_245412 ) ) ( not ( = ?auto_245409 ?auto_245413 ) ) ( not ( = ?auto_245410 ?auto_245411 ) ) ( not ( = ?auto_245410 ?auto_245412 ) ) ( not ( = ?auto_245410 ?auto_245413 ) ) ( not ( = ?auto_245411 ?auto_245412 ) ) ( not ( = ?auto_245411 ?auto_245413 ) ) ( not ( = ?auto_245412 ?auto_245413 ) ) ( CLEAR ?auto_245410 ) ( ON ?auto_245411 ?auto_245412 ) ( CLEAR ?auto_245411 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_245402 ?auto_245403 ?auto_245404 ?auto_245405 ?auto_245406 ?auto_245407 ?auto_245408 ?auto_245409 ?auto_245410 ?auto_245411 )
      ( MAKE-11PILE ?auto_245402 ?auto_245403 ?auto_245404 ?auto_245405 ?auto_245406 ?auto_245407 ?auto_245408 ?auto_245409 ?auto_245410 ?auto_245411 ?auto_245412 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_245425 - BLOCK
      ?auto_245426 - BLOCK
      ?auto_245427 - BLOCK
      ?auto_245428 - BLOCK
      ?auto_245429 - BLOCK
      ?auto_245430 - BLOCK
      ?auto_245431 - BLOCK
      ?auto_245432 - BLOCK
      ?auto_245433 - BLOCK
      ?auto_245434 - BLOCK
      ?auto_245435 - BLOCK
    )
    :vars
    (
      ?auto_245436 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_245435 ?auto_245436 ) ( ON-TABLE ?auto_245425 ) ( ON ?auto_245426 ?auto_245425 ) ( ON ?auto_245427 ?auto_245426 ) ( ON ?auto_245428 ?auto_245427 ) ( ON ?auto_245429 ?auto_245428 ) ( ON ?auto_245430 ?auto_245429 ) ( ON ?auto_245431 ?auto_245430 ) ( ON ?auto_245432 ?auto_245431 ) ( not ( = ?auto_245425 ?auto_245426 ) ) ( not ( = ?auto_245425 ?auto_245427 ) ) ( not ( = ?auto_245425 ?auto_245428 ) ) ( not ( = ?auto_245425 ?auto_245429 ) ) ( not ( = ?auto_245425 ?auto_245430 ) ) ( not ( = ?auto_245425 ?auto_245431 ) ) ( not ( = ?auto_245425 ?auto_245432 ) ) ( not ( = ?auto_245425 ?auto_245433 ) ) ( not ( = ?auto_245425 ?auto_245434 ) ) ( not ( = ?auto_245425 ?auto_245435 ) ) ( not ( = ?auto_245425 ?auto_245436 ) ) ( not ( = ?auto_245426 ?auto_245427 ) ) ( not ( = ?auto_245426 ?auto_245428 ) ) ( not ( = ?auto_245426 ?auto_245429 ) ) ( not ( = ?auto_245426 ?auto_245430 ) ) ( not ( = ?auto_245426 ?auto_245431 ) ) ( not ( = ?auto_245426 ?auto_245432 ) ) ( not ( = ?auto_245426 ?auto_245433 ) ) ( not ( = ?auto_245426 ?auto_245434 ) ) ( not ( = ?auto_245426 ?auto_245435 ) ) ( not ( = ?auto_245426 ?auto_245436 ) ) ( not ( = ?auto_245427 ?auto_245428 ) ) ( not ( = ?auto_245427 ?auto_245429 ) ) ( not ( = ?auto_245427 ?auto_245430 ) ) ( not ( = ?auto_245427 ?auto_245431 ) ) ( not ( = ?auto_245427 ?auto_245432 ) ) ( not ( = ?auto_245427 ?auto_245433 ) ) ( not ( = ?auto_245427 ?auto_245434 ) ) ( not ( = ?auto_245427 ?auto_245435 ) ) ( not ( = ?auto_245427 ?auto_245436 ) ) ( not ( = ?auto_245428 ?auto_245429 ) ) ( not ( = ?auto_245428 ?auto_245430 ) ) ( not ( = ?auto_245428 ?auto_245431 ) ) ( not ( = ?auto_245428 ?auto_245432 ) ) ( not ( = ?auto_245428 ?auto_245433 ) ) ( not ( = ?auto_245428 ?auto_245434 ) ) ( not ( = ?auto_245428 ?auto_245435 ) ) ( not ( = ?auto_245428 ?auto_245436 ) ) ( not ( = ?auto_245429 ?auto_245430 ) ) ( not ( = ?auto_245429 ?auto_245431 ) ) ( not ( = ?auto_245429 ?auto_245432 ) ) ( not ( = ?auto_245429 ?auto_245433 ) ) ( not ( = ?auto_245429 ?auto_245434 ) ) ( not ( = ?auto_245429 ?auto_245435 ) ) ( not ( = ?auto_245429 ?auto_245436 ) ) ( not ( = ?auto_245430 ?auto_245431 ) ) ( not ( = ?auto_245430 ?auto_245432 ) ) ( not ( = ?auto_245430 ?auto_245433 ) ) ( not ( = ?auto_245430 ?auto_245434 ) ) ( not ( = ?auto_245430 ?auto_245435 ) ) ( not ( = ?auto_245430 ?auto_245436 ) ) ( not ( = ?auto_245431 ?auto_245432 ) ) ( not ( = ?auto_245431 ?auto_245433 ) ) ( not ( = ?auto_245431 ?auto_245434 ) ) ( not ( = ?auto_245431 ?auto_245435 ) ) ( not ( = ?auto_245431 ?auto_245436 ) ) ( not ( = ?auto_245432 ?auto_245433 ) ) ( not ( = ?auto_245432 ?auto_245434 ) ) ( not ( = ?auto_245432 ?auto_245435 ) ) ( not ( = ?auto_245432 ?auto_245436 ) ) ( not ( = ?auto_245433 ?auto_245434 ) ) ( not ( = ?auto_245433 ?auto_245435 ) ) ( not ( = ?auto_245433 ?auto_245436 ) ) ( not ( = ?auto_245434 ?auto_245435 ) ) ( not ( = ?auto_245434 ?auto_245436 ) ) ( not ( = ?auto_245435 ?auto_245436 ) ) ( ON ?auto_245434 ?auto_245435 ) ( CLEAR ?auto_245432 ) ( ON ?auto_245433 ?auto_245434 ) ( CLEAR ?auto_245433 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_245425 ?auto_245426 ?auto_245427 ?auto_245428 ?auto_245429 ?auto_245430 ?auto_245431 ?auto_245432 ?auto_245433 )
      ( MAKE-11PILE ?auto_245425 ?auto_245426 ?auto_245427 ?auto_245428 ?auto_245429 ?auto_245430 ?auto_245431 ?auto_245432 ?auto_245433 ?auto_245434 ?auto_245435 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_245448 - BLOCK
      ?auto_245449 - BLOCK
      ?auto_245450 - BLOCK
      ?auto_245451 - BLOCK
      ?auto_245452 - BLOCK
      ?auto_245453 - BLOCK
      ?auto_245454 - BLOCK
      ?auto_245455 - BLOCK
      ?auto_245456 - BLOCK
      ?auto_245457 - BLOCK
      ?auto_245458 - BLOCK
    )
    :vars
    (
      ?auto_245459 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_245458 ?auto_245459 ) ( ON-TABLE ?auto_245448 ) ( ON ?auto_245449 ?auto_245448 ) ( ON ?auto_245450 ?auto_245449 ) ( ON ?auto_245451 ?auto_245450 ) ( ON ?auto_245452 ?auto_245451 ) ( ON ?auto_245453 ?auto_245452 ) ( ON ?auto_245454 ?auto_245453 ) ( ON ?auto_245455 ?auto_245454 ) ( not ( = ?auto_245448 ?auto_245449 ) ) ( not ( = ?auto_245448 ?auto_245450 ) ) ( not ( = ?auto_245448 ?auto_245451 ) ) ( not ( = ?auto_245448 ?auto_245452 ) ) ( not ( = ?auto_245448 ?auto_245453 ) ) ( not ( = ?auto_245448 ?auto_245454 ) ) ( not ( = ?auto_245448 ?auto_245455 ) ) ( not ( = ?auto_245448 ?auto_245456 ) ) ( not ( = ?auto_245448 ?auto_245457 ) ) ( not ( = ?auto_245448 ?auto_245458 ) ) ( not ( = ?auto_245448 ?auto_245459 ) ) ( not ( = ?auto_245449 ?auto_245450 ) ) ( not ( = ?auto_245449 ?auto_245451 ) ) ( not ( = ?auto_245449 ?auto_245452 ) ) ( not ( = ?auto_245449 ?auto_245453 ) ) ( not ( = ?auto_245449 ?auto_245454 ) ) ( not ( = ?auto_245449 ?auto_245455 ) ) ( not ( = ?auto_245449 ?auto_245456 ) ) ( not ( = ?auto_245449 ?auto_245457 ) ) ( not ( = ?auto_245449 ?auto_245458 ) ) ( not ( = ?auto_245449 ?auto_245459 ) ) ( not ( = ?auto_245450 ?auto_245451 ) ) ( not ( = ?auto_245450 ?auto_245452 ) ) ( not ( = ?auto_245450 ?auto_245453 ) ) ( not ( = ?auto_245450 ?auto_245454 ) ) ( not ( = ?auto_245450 ?auto_245455 ) ) ( not ( = ?auto_245450 ?auto_245456 ) ) ( not ( = ?auto_245450 ?auto_245457 ) ) ( not ( = ?auto_245450 ?auto_245458 ) ) ( not ( = ?auto_245450 ?auto_245459 ) ) ( not ( = ?auto_245451 ?auto_245452 ) ) ( not ( = ?auto_245451 ?auto_245453 ) ) ( not ( = ?auto_245451 ?auto_245454 ) ) ( not ( = ?auto_245451 ?auto_245455 ) ) ( not ( = ?auto_245451 ?auto_245456 ) ) ( not ( = ?auto_245451 ?auto_245457 ) ) ( not ( = ?auto_245451 ?auto_245458 ) ) ( not ( = ?auto_245451 ?auto_245459 ) ) ( not ( = ?auto_245452 ?auto_245453 ) ) ( not ( = ?auto_245452 ?auto_245454 ) ) ( not ( = ?auto_245452 ?auto_245455 ) ) ( not ( = ?auto_245452 ?auto_245456 ) ) ( not ( = ?auto_245452 ?auto_245457 ) ) ( not ( = ?auto_245452 ?auto_245458 ) ) ( not ( = ?auto_245452 ?auto_245459 ) ) ( not ( = ?auto_245453 ?auto_245454 ) ) ( not ( = ?auto_245453 ?auto_245455 ) ) ( not ( = ?auto_245453 ?auto_245456 ) ) ( not ( = ?auto_245453 ?auto_245457 ) ) ( not ( = ?auto_245453 ?auto_245458 ) ) ( not ( = ?auto_245453 ?auto_245459 ) ) ( not ( = ?auto_245454 ?auto_245455 ) ) ( not ( = ?auto_245454 ?auto_245456 ) ) ( not ( = ?auto_245454 ?auto_245457 ) ) ( not ( = ?auto_245454 ?auto_245458 ) ) ( not ( = ?auto_245454 ?auto_245459 ) ) ( not ( = ?auto_245455 ?auto_245456 ) ) ( not ( = ?auto_245455 ?auto_245457 ) ) ( not ( = ?auto_245455 ?auto_245458 ) ) ( not ( = ?auto_245455 ?auto_245459 ) ) ( not ( = ?auto_245456 ?auto_245457 ) ) ( not ( = ?auto_245456 ?auto_245458 ) ) ( not ( = ?auto_245456 ?auto_245459 ) ) ( not ( = ?auto_245457 ?auto_245458 ) ) ( not ( = ?auto_245457 ?auto_245459 ) ) ( not ( = ?auto_245458 ?auto_245459 ) ) ( ON ?auto_245457 ?auto_245458 ) ( CLEAR ?auto_245455 ) ( ON ?auto_245456 ?auto_245457 ) ( CLEAR ?auto_245456 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_245448 ?auto_245449 ?auto_245450 ?auto_245451 ?auto_245452 ?auto_245453 ?auto_245454 ?auto_245455 ?auto_245456 )
      ( MAKE-11PILE ?auto_245448 ?auto_245449 ?auto_245450 ?auto_245451 ?auto_245452 ?auto_245453 ?auto_245454 ?auto_245455 ?auto_245456 ?auto_245457 ?auto_245458 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_245471 - BLOCK
      ?auto_245472 - BLOCK
      ?auto_245473 - BLOCK
      ?auto_245474 - BLOCK
      ?auto_245475 - BLOCK
      ?auto_245476 - BLOCK
      ?auto_245477 - BLOCK
      ?auto_245478 - BLOCK
      ?auto_245479 - BLOCK
      ?auto_245480 - BLOCK
      ?auto_245481 - BLOCK
    )
    :vars
    (
      ?auto_245482 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_245481 ?auto_245482 ) ( ON-TABLE ?auto_245471 ) ( ON ?auto_245472 ?auto_245471 ) ( ON ?auto_245473 ?auto_245472 ) ( ON ?auto_245474 ?auto_245473 ) ( ON ?auto_245475 ?auto_245474 ) ( ON ?auto_245476 ?auto_245475 ) ( ON ?auto_245477 ?auto_245476 ) ( not ( = ?auto_245471 ?auto_245472 ) ) ( not ( = ?auto_245471 ?auto_245473 ) ) ( not ( = ?auto_245471 ?auto_245474 ) ) ( not ( = ?auto_245471 ?auto_245475 ) ) ( not ( = ?auto_245471 ?auto_245476 ) ) ( not ( = ?auto_245471 ?auto_245477 ) ) ( not ( = ?auto_245471 ?auto_245478 ) ) ( not ( = ?auto_245471 ?auto_245479 ) ) ( not ( = ?auto_245471 ?auto_245480 ) ) ( not ( = ?auto_245471 ?auto_245481 ) ) ( not ( = ?auto_245471 ?auto_245482 ) ) ( not ( = ?auto_245472 ?auto_245473 ) ) ( not ( = ?auto_245472 ?auto_245474 ) ) ( not ( = ?auto_245472 ?auto_245475 ) ) ( not ( = ?auto_245472 ?auto_245476 ) ) ( not ( = ?auto_245472 ?auto_245477 ) ) ( not ( = ?auto_245472 ?auto_245478 ) ) ( not ( = ?auto_245472 ?auto_245479 ) ) ( not ( = ?auto_245472 ?auto_245480 ) ) ( not ( = ?auto_245472 ?auto_245481 ) ) ( not ( = ?auto_245472 ?auto_245482 ) ) ( not ( = ?auto_245473 ?auto_245474 ) ) ( not ( = ?auto_245473 ?auto_245475 ) ) ( not ( = ?auto_245473 ?auto_245476 ) ) ( not ( = ?auto_245473 ?auto_245477 ) ) ( not ( = ?auto_245473 ?auto_245478 ) ) ( not ( = ?auto_245473 ?auto_245479 ) ) ( not ( = ?auto_245473 ?auto_245480 ) ) ( not ( = ?auto_245473 ?auto_245481 ) ) ( not ( = ?auto_245473 ?auto_245482 ) ) ( not ( = ?auto_245474 ?auto_245475 ) ) ( not ( = ?auto_245474 ?auto_245476 ) ) ( not ( = ?auto_245474 ?auto_245477 ) ) ( not ( = ?auto_245474 ?auto_245478 ) ) ( not ( = ?auto_245474 ?auto_245479 ) ) ( not ( = ?auto_245474 ?auto_245480 ) ) ( not ( = ?auto_245474 ?auto_245481 ) ) ( not ( = ?auto_245474 ?auto_245482 ) ) ( not ( = ?auto_245475 ?auto_245476 ) ) ( not ( = ?auto_245475 ?auto_245477 ) ) ( not ( = ?auto_245475 ?auto_245478 ) ) ( not ( = ?auto_245475 ?auto_245479 ) ) ( not ( = ?auto_245475 ?auto_245480 ) ) ( not ( = ?auto_245475 ?auto_245481 ) ) ( not ( = ?auto_245475 ?auto_245482 ) ) ( not ( = ?auto_245476 ?auto_245477 ) ) ( not ( = ?auto_245476 ?auto_245478 ) ) ( not ( = ?auto_245476 ?auto_245479 ) ) ( not ( = ?auto_245476 ?auto_245480 ) ) ( not ( = ?auto_245476 ?auto_245481 ) ) ( not ( = ?auto_245476 ?auto_245482 ) ) ( not ( = ?auto_245477 ?auto_245478 ) ) ( not ( = ?auto_245477 ?auto_245479 ) ) ( not ( = ?auto_245477 ?auto_245480 ) ) ( not ( = ?auto_245477 ?auto_245481 ) ) ( not ( = ?auto_245477 ?auto_245482 ) ) ( not ( = ?auto_245478 ?auto_245479 ) ) ( not ( = ?auto_245478 ?auto_245480 ) ) ( not ( = ?auto_245478 ?auto_245481 ) ) ( not ( = ?auto_245478 ?auto_245482 ) ) ( not ( = ?auto_245479 ?auto_245480 ) ) ( not ( = ?auto_245479 ?auto_245481 ) ) ( not ( = ?auto_245479 ?auto_245482 ) ) ( not ( = ?auto_245480 ?auto_245481 ) ) ( not ( = ?auto_245480 ?auto_245482 ) ) ( not ( = ?auto_245481 ?auto_245482 ) ) ( ON ?auto_245480 ?auto_245481 ) ( ON ?auto_245479 ?auto_245480 ) ( CLEAR ?auto_245477 ) ( ON ?auto_245478 ?auto_245479 ) ( CLEAR ?auto_245478 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_245471 ?auto_245472 ?auto_245473 ?auto_245474 ?auto_245475 ?auto_245476 ?auto_245477 ?auto_245478 )
      ( MAKE-11PILE ?auto_245471 ?auto_245472 ?auto_245473 ?auto_245474 ?auto_245475 ?auto_245476 ?auto_245477 ?auto_245478 ?auto_245479 ?auto_245480 ?auto_245481 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_245494 - BLOCK
      ?auto_245495 - BLOCK
      ?auto_245496 - BLOCK
      ?auto_245497 - BLOCK
      ?auto_245498 - BLOCK
      ?auto_245499 - BLOCK
      ?auto_245500 - BLOCK
      ?auto_245501 - BLOCK
      ?auto_245502 - BLOCK
      ?auto_245503 - BLOCK
      ?auto_245504 - BLOCK
    )
    :vars
    (
      ?auto_245505 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_245504 ?auto_245505 ) ( ON-TABLE ?auto_245494 ) ( ON ?auto_245495 ?auto_245494 ) ( ON ?auto_245496 ?auto_245495 ) ( ON ?auto_245497 ?auto_245496 ) ( ON ?auto_245498 ?auto_245497 ) ( ON ?auto_245499 ?auto_245498 ) ( ON ?auto_245500 ?auto_245499 ) ( not ( = ?auto_245494 ?auto_245495 ) ) ( not ( = ?auto_245494 ?auto_245496 ) ) ( not ( = ?auto_245494 ?auto_245497 ) ) ( not ( = ?auto_245494 ?auto_245498 ) ) ( not ( = ?auto_245494 ?auto_245499 ) ) ( not ( = ?auto_245494 ?auto_245500 ) ) ( not ( = ?auto_245494 ?auto_245501 ) ) ( not ( = ?auto_245494 ?auto_245502 ) ) ( not ( = ?auto_245494 ?auto_245503 ) ) ( not ( = ?auto_245494 ?auto_245504 ) ) ( not ( = ?auto_245494 ?auto_245505 ) ) ( not ( = ?auto_245495 ?auto_245496 ) ) ( not ( = ?auto_245495 ?auto_245497 ) ) ( not ( = ?auto_245495 ?auto_245498 ) ) ( not ( = ?auto_245495 ?auto_245499 ) ) ( not ( = ?auto_245495 ?auto_245500 ) ) ( not ( = ?auto_245495 ?auto_245501 ) ) ( not ( = ?auto_245495 ?auto_245502 ) ) ( not ( = ?auto_245495 ?auto_245503 ) ) ( not ( = ?auto_245495 ?auto_245504 ) ) ( not ( = ?auto_245495 ?auto_245505 ) ) ( not ( = ?auto_245496 ?auto_245497 ) ) ( not ( = ?auto_245496 ?auto_245498 ) ) ( not ( = ?auto_245496 ?auto_245499 ) ) ( not ( = ?auto_245496 ?auto_245500 ) ) ( not ( = ?auto_245496 ?auto_245501 ) ) ( not ( = ?auto_245496 ?auto_245502 ) ) ( not ( = ?auto_245496 ?auto_245503 ) ) ( not ( = ?auto_245496 ?auto_245504 ) ) ( not ( = ?auto_245496 ?auto_245505 ) ) ( not ( = ?auto_245497 ?auto_245498 ) ) ( not ( = ?auto_245497 ?auto_245499 ) ) ( not ( = ?auto_245497 ?auto_245500 ) ) ( not ( = ?auto_245497 ?auto_245501 ) ) ( not ( = ?auto_245497 ?auto_245502 ) ) ( not ( = ?auto_245497 ?auto_245503 ) ) ( not ( = ?auto_245497 ?auto_245504 ) ) ( not ( = ?auto_245497 ?auto_245505 ) ) ( not ( = ?auto_245498 ?auto_245499 ) ) ( not ( = ?auto_245498 ?auto_245500 ) ) ( not ( = ?auto_245498 ?auto_245501 ) ) ( not ( = ?auto_245498 ?auto_245502 ) ) ( not ( = ?auto_245498 ?auto_245503 ) ) ( not ( = ?auto_245498 ?auto_245504 ) ) ( not ( = ?auto_245498 ?auto_245505 ) ) ( not ( = ?auto_245499 ?auto_245500 ) ) ( not ( = ?auto_245499 ?auto_245501 ) ) ( not ( = ?auto_245499 ?auto_245502 ) ) ( not ( = ?auto_245499 ?auto_245503 ) ) ( not ( = ?auto_245499 ?auto_245504 ) ) ( not ( = ?auto_245499 ?auto_245505 ) ) ( not ( = ?auto_245500 ?auto_245501 ) ) ( not ( = ?auto_245500 ?auto_245502 ) ) ( not ( = ?auto_245500 ?auto_245503 ) ) ( not ( = ?auto_245500 ?auto_245504 ) ) ( not ( = ?auto_245500 ?auto_245505 ) ) ( not ( = ?auto_245501 ?auto_245502 ) ) ( not ( = ?auto_245501 ?auto_245503 ) ) ( not ( = ?auto_245501 ?auto_245504 ) ) ( not ( = ?auto_245501 ?auto_245505 ) ) ( not ( = ?auto_245502 ?auto_245503 ) ) ( not ( = ?auto_245502 ?auto_245504 ) ) ( not ( = ?auto_245502 ?auto_245505 ) ) ( not ( = ?auto_245503 ?auto_245504 ) ) ( not ( = ?auto_245503 ?auto_245505 ) ) ( not ( = ?auto_245504 ?auto_245505 ) ) ( ON ?auto_245503 ?auto_245504 ) ( ON ?auto_245502 ?auto_245503 ) ( CLEAR ?auto_245500 ) ( ON ?auto_245501 ?auto_245502 ) ( CLEAR ?auto_245501 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_245494 ?auto_245495 ?auto_245496 ?auto_245497 ?auto_245498 ?auto_245499 ?auto_245500 ?auto_245501 )
      ( MAKE-11PILE ?auto_245494 ?auto_245495 ?auto_245496 ?auto_245497 ?auto_245498 ?auto_245499 ?auto_245500 ?auto_245501 ?auto_245502 ?auto_245503 ?auto_245504 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_245517 - BLOCK
      ?auto_245518 - BLOCK
      ?auto_245519 - BLOCK
      ?auto_245520 - BLOCK
      ?auto_245521 - BLOCK
      ?auto_245522 - BLOCK
      ?auto_245523 - BLOCK
      ?auto_245524 - BLOCK
      ?auto_245525 - BLOCK
      ?auto_245526 - BLOCK
      ?auto_245527 - BLOCK
    )
    :vars
    (
      ?auto_245528 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_245527 ?auto_245528 ) ( ON-TABLE ?auto_245517 ) ( ON ?auto_245518 ?auto_245517 ) ( ON ?auto_245519 ?auto_245518 ) ( ON ?auto_245520 ?auto_245519 ) ( ON ?auto_245521 ?auto_245520 ) ( ON ?auto_245522 ?auto_245521 ) ( not ( = ?auto_245517 ?auto_245518 ) ) ( not ( = ?auto_245517 ?auto_245519 ) ) ( not ( = ?auto_245517 ?auto_245520 ) ) ( not ( = ?auto_245517 ?auto_245521 ) ) ( not ( = ?auto_245517 ?auto_245522 ) ) ( not ( = ?auto_245517 ?auto_245523 ) ) ( not ( = ?auto_245517 ?auto_245524 ) ) ( not ( = ?auto_245517 ?auto_245525 ) ) ( not ( = ?auto_245517 ?auto_245526 ) ) ( not ( = ?auto_245517 ?auto_245527 ) ) ( not ( = ?auto_245517 ?auto_245528 ) ) ( not ( = ?auto_245518 ?auto_245519 ) ) ( not ( = ?auto_245518 ?auto_245520 ) ) ( not ( = ?auto_245518 ?auto_245521 ) ) ( not ( = ?auto_245518 ?auto_245522 ) ) ( not ( = ?auto_245518 ?auto_245523 ) ) ( not ( = ?auto_245518 ?auto_245524 ) ) ( not ( = ?auto_245518 ?auto_245525 ) ) ( not ( = ?auto_245518 ?auto_245526 ) ) ( not ( = ?auto_245518 ?auto_245527 ) ) ( not ( = ?auto_245518 ?auto_245528 ) ) ( not ( = ?auto_245519 ?auto_245520 ) ) ( not ( = ?auto_245519 ?auto_245521 ) ) ( not ( = ?auto_245519 ?auto_245522 ) ) ( not ( = ?auto_245519 ?auto_245523 ) ) ( not ( = ?auto_245519 ?auto_245524 ) ) ( not ( = ?auto_245519 ?auto_245525 ) ) ( not ( = ?auto_245519 ?auto_245526 ) ) ( not ( = ?auto_245519 ?auto_245527 ) ) ( not ( = ?auto_245519 ?auto_245528 ) ) ( not ( = ?auto_245520 ?auto_245521 ) ) ( not ( = ?auto_245520 ?auto_245522 ) ) ( not ( = ?auto_245520 ?auto_245523 ) ) ( not ( = ?auto_245520 ?auto_245524 ) ) ( not ( = ?auto_245520 ?auto_245525 ) ) ( not ( = ?auto_245520 ?auto_245526 ) ) ( not ( = ?auto_245520 ?auto_245527 ) ) ( not ( = ?auto_245520 ?auto_245528 ) ) ( not ( = ?auto_245521 ?auto_245522 ) ) ( not ( = ?auto_245521 ?auto_245523 ) ) ( not ( = ?auto_245521 ?auto_245524 ) ) ( not ( = ?auto_245521 ?auto_245525 ) ) ( not ( = ?auto_245521 ?auto_245526 ) ) ( not ( = ?auto_245521 ?auto_245527 ) ) ( not ( = ?auto_245521 ?auto_245528 ) ) ( not ( = ?auto_245522 ?auto_245523 ) ) ( not ( = ?auto_245522 ?auto_245524 ) ) ( not ( = ?auto_245522 ?auto_245525 ) ) ( not ( = ?auto_245522 ?auto_245526 ) ) ( not ( = ?auto_245522 ?auto_245527 ) ) ( not ( = ?auto_245522 ?auto_245528 ) ) ( not ( = ?auto_245523 ?auto_245524 ) ) ( not ( = ?auto_245523 ?auto_245525 ) ) ( not ( = ?auto_245523 ?auto_245526 ) ) ( not ( = ?auto_245523 ?auto_245527 ) ) ( not ( = ?auto_245523 ?auto_245528 ) ) ( not ( = ?auto_245524 ?auto_245525 ) ) ( not ( = ?auto_245524 ?auto_245526 ) ) ( not ( = ?auto_245524 ?auto_245527 ) ) ( not ( = ?auto_245524 ?auto_245528 ) ) ( not ( = ?auto_245525 ?auto_245526 ) ) ( not ( = ?auto_245525 ?auto_245527 ) ) ( not ( = ?auto_245525 ?auto_245528 ) ) ( not ( = ?auto_245526 ?auto_245527 ) ) ( not ( = ?auto_245526 ?auto_245528 ) ) ( not ( = ?auto_245527 ?auto_245528 ) ) ( ON ?auto_245526 ?auto_245527 ) ( ON ?auto_245525 ?auto_245526 ) ( ON ?auto_245524 ?auto_245525 ) ( CLEAR ?auto_245522 ) ( ON ?auto_245523 ?auto_245524 ) ( CLEAR ?auto_245523 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_245517 ?auto_245518 ?auto_245519 ?auto_245520 ?auto_245521 ?auto_245522 ?auto_245523 )
      ( MAKE-11PILE ?auto_245517 ?auto_245518 ?auto_245519 ?auto_245520 ?auto_245521 ?auto_245522 ?auto_245523 ?auto_245524 ?auto_245525 ?auto_245526 ?auto_245527 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_245540 - BLOCK
      ?auto_245541 - BLOCK
      ?auto_245542 - BLOCK
      ?auto_245543 - BLOCK
      ?auto_245544 - BLOCK
      ?auto_245545 - BLOCK
      ?auto_245546 - BLOCK
      ?auto_245547 - BLOCK
      ?auto_245548 - BLOCK
      ?auto_245549 - BLOCK
      ?auto_245550 - BLOCK
    )
    :vars
    (
      ?auto_245551 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_245550 ?auto_245551 ) ( ON-TABLE ?auto_245540 ) ( ON ?auto_245541 ?auto_245540 ) ( ON ?auto_245542 ?auto_245541 ) ( ON ?auto_245543 ?auto_245542 ) ( ON ?auto_245544 ?auto_245543 ) ( ON ?auto_245545 ?auto_245544 ) ( not ( = ?auto_245540 ?auto_245541 ) ) ( not ( = ?auto_245540 ?auto_245542 ) ) ( not ( = ?auto_245540 ?auto_245543 ) ) ( not ( = ?auto_245540 ?auto_245544 ) ) ( not ( = ?auto_245540 ?auto_245545 ) ) ( not ( = ?auto_245540 ?auto_245546 ) ) ( not ( = ?auto_245540 ?auto_245547 ) ) ( not ( = ?auto_245540 ?auto_245548 ) ) ( not ( = ?auto_245540 ?auto_245549 ) ) ( not ( = ?auto_245540 ?auto_245550 ) ) ( not ( = ?auto_245540 ?auto_245551 ) ) ( not ( = ?auto_245541 ?auto_245542 ) ) ( not ( = ?auto_245541 ?auto_245543 ) ) ( not ( = ?auto_245541 ?auto_245544 ) ) ( not ( = ?auto_245541 ?auto_245545 ) ) ( not ( = ?auto_245541 ?auto_245546 ) ) ( not ( = ?auto_245541 ?auto_245547 ) ) ( not ( = ?auto_245541 ?auto_245548 ) ) ( not ( = ?auto_245541 ?auto_245549 ) ) ( not ( = ?auto_245541 ?auto_245550 ) ) ( not ( = ?auto_245541 ?auto_245551 ) ) ( not ( = ?auto_245542 ?auto_245543 ) ) ( not ( = ?auto_245542 ?auto_245544 ) ) ( not ( = ?auto_245542 ?auto_245545 ) ) ( not ( = ?auto_245542 ?auto_245546 ) ) ( not ( = ?auto_245542 ?auto_245547 ) ) ( not ( = ?auto_245542 ?auto_245548 ) ) ( not ( = ?auto_245542 ?auto_245549 ) ) ( not ( = ?auto_245542 ?auto_245550 ) ) ( not ( = ?auto_245542 ?auto_245551 ) ) ( not ( = ?auto_245543 ?auto_245544 ) ) ( not ( = ?auto_245543 ?auto_245545 ) ) ( not ( = ?auto_245543 ?auto_245546 ) ) ( not ( = ?auto_245543 ?auto_245547 ) ) ( not ( = ?auto_245543 ?auto_245548 ) ) ( not ( = ?auto_245543 ?auto_245549 ) ) ( not ( = ?auto_245543 ?auto_245550 ) ) ( not ( = ?auto_245543 ?auto_245551 ) ) ( not ( = ?auto_245544 ?auto_245545 ) ) ( not ( = ?auto_245544 ?auto_245546 ) ) ( not ( = ?auto_245544 ?auto_245547 ) ) ( not ( = ?auto_245544 ?auto_245548 ) ) ( not ( = ?auto_245544 ?auto_245549 ) ) ( not ( = ?auto_245544 ?auto_245550 ) ) ( not ( = ?auto_245544 ?auto_245551 ) ) ( not ( = ?auto_245545 ?auto_245546 ) ) ( not ( = ?auto_245545 ?auto_245547 ) ) ( not ( = ?auto_245545 ?auto_245548 ) ) ( not ( = ?auto_245545 ?auto_245549 ) ) ( not ( = ?auto_245545 ?auto_245550 ) ) ( not ( = ?auto_245545 ?auto_245551 ) ) ( not ( = ?auto_245546 ?auto_245547 ) ) ( not ( = ?auto_245546 ?auto_245548 ) ) ( not ( = ?auto_245546 ?auto_245549 ) ) ( not ( = ?auto_245546 ?auto_245550 ) ) ( not ( = ?auto_245546 ?auto_245551 ) ) ( not ( = ?auto_245547 ?auto_245548 ) ) ( not ( = ?auto_245547 ?auto_245549 ) ) ( not ( = ?auto_245547 ?auto_245550 ) ) ( not ( = ?auto_245547 ?auto_245551 ) ) ( not ( = ?auto_245548 ?auto_245549 ) ) ( not ( = ?auto_245548 ?auto_245550 ) ) ( not ( = ?auto_245548 ?auto_245551 ) ) ( not ( = ?auto_245549 ?auto_245550 ) ) ( not ( = ?auto_245549 ?auto_245551 ) ) ( not ( = ?auto_245550 ?auto_245551 ) ) ( ON ?auto_245549 ?auto_245550 ) ( ON ?auto_245548 ?auto_245549 ) ( ON ?auto_245547 ?auto_245548 ) ( CLEAR ?auto_245545 ) ( ON ?auto_245546 ?auto_245547 ) ( CLEAR ?auto_245546 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_245540 ?auto_245541 ?auto_245542 ?auto_245543 ?auto_245544 ?auto_245545 ?auto_245546 )
      ( MAKE-11PILE ?auto_245540 ?auto_245541 ?auto_245542 ?auto_245543 ?auto_245544 ?auto_245545 ?auto_245546 ?auto_245547 ?auto_245548 ?auto_245549 ?auto_245550 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_245563 - BLOCK
      ?auto_245564 - BLOCK
      ?auto_245565 - BLOCK
      ?auto_245566 - BLOCK
      ?auto_245567 - BLOCK
      ?auto_245568 - BLOCK
      ?auto_245569 - BLOCK
      ?auto_245570 - BLOCK
      ?auto_245571 - BLOCK
      ?auto_245572 - BLOCK
      ?auto_245573 - BLOCK
    )
    :vars
    (
      ?auto_245574 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_245573 ?auto_245574 ) ( ON-TABLE ?auto_245563 ) ( ON ?auto_245564 ?auto_245563 ) ( ON ?auto_245565 ?auto_245564 ) ( ON ?auto_245566 ?auto_245565 ) ( ON ?auto_245567 ?auto_245566 ) ( not ( = ?auto_245563 ?auto_245564 ) ) ( not ( = ?auto_245563 ?auto_245565 ) ) ( not ( = ?auto_245563 ?auto_245566 ) ) ( not ( = ?auto_245563 ?auto_245567 ) ) ( not ( = ?auto_245563 ?auto_245568 ) ) ( not ( = ?auto_245563 ?auto_245569 ) ) ( not ( = ?auto_245563 ?auto_245570 ) ) ( not ( = ?auto_245563 ?auto_245571 ) ) ( not ( = ?auto_245563 ?auto_245572 ) ) ( not ( = ?auto_245563 ?auto_245573 ) ) ( not ( = ?auto_245563 ?auto_245574 ) ) ( not ( = ?auto_245564 ?auto_245565 ) ) ( not ( = ?auto_245564 ?auto_245566 ) ) ( not ( = ?auto_245564 ?auto_245567 ) ) ( not ( = ?auto_245564 ?auto_245568 ) ) ( not ( = ?auto_245564 ?auto_245569 ) ) ( not ( = ?auto_245564 ?auto_245570 ) ) ( not ( = ?auto_245564 ?auto_245571 ) ) ( not ( = ?auto_245564 ?auto_245572 ) ) ( not ( = ?auto_245564 ?auto_245573 ) ) ( not ( = ?auto_245564 ?auto_245574 ) ) ( not ( = ?auto_245565 ?auto_245566 ) ) ( not ( = ?auto_245565 ?auto_245567 ) ) ( not ( = ?auto_245565 ?auto_245568 ) ) ( not ( = ?auto_245565 ?auto_245569 ) ) ( not ( = ?auto_245565 ?auto_245570 ) ) ( not ( = ?auto_245565 ?auto_245571 ) ) ( not ( = ?auto_245565 ?auto_245572 ) ) ( not ( = ?auto_245565 ?auto_245573 ) ) ( not ( = ?auto_245565 ?auto_245574 ) ) ( not ( = ?auto_245566 ?auto_245567 ) ) ( not ( = ?auto_245566 ?auto_245568 ) ) ( not ( = ?auto_245566 ?auto_245569 ) ) ( not ( = ?auto_245566 ?auto_245570 ) ) ( not ( = ?auto_245566 ?auto_245571 ) ) ( not ( = ?auto_245566 ?auto_245572 ) ) ( not ( = ?auto_245566 ?auto_245573 ) ) ( not ( = ?auto_245566 ?auto_245574 ) ) ( not ( = ?auto_245567 ?auto_245568 ) ) ( not ( = ?auto_245567 ?auto_245569 ) ) ( not ( = ?auto_245567 ?auto_245570 ) ) ( not ( = ?auto_245567 ?auto_245571 ) ) ( not ( = ?auto_245567 ?auto_245572 ) ) ( not ( = ?auto_245567 ?auto_245573 ) ) ( not ( = ?auto_245567 ?auto_245574 ) ) ( not ( = ?auto_245568 ?auto_245569 ) ) ( not ( = ?auto_245568 ?auto_245570 ) ) ( not ( = ?auto_245568 ?auto_245571 ) ) ( not ( = ?auto_245568 ?auto_245572 ) ) ( not ( = ?auto_245568 ?auto_245573 ) ) ( not ( = ?auto_245568 ?auto_245574 ) ) ( not ( = ?auto_245569 ?auto_245570 ) ) ( not ( = ?auto_245569 ?auto_245571 ) ) ( not ( = ?auto_245569 ?auto_245572 ) ) ( not ( = ?auto_245569 ?auto_245573 ) ) ( not ( = ?auto_245569 ?auto_245574 ) ) ( not ( = ?auto_245570 ?auto_245571 ) ) ( not ( = ?auto_245570 ?auto_245572 ) ) ( not ( = ?auto_245570 ?auto_245573 ) ) ( not ( = ?auto_245570 ?auto_245574 ) ) ( not ( = ?auto_245571 ?auto_245572 ) ) ( not ( = ?auto_245571 ?auto_245573 ) ) ( not ( = ?auto_245571 ?auto_245574 ) ) ( not ( = ?auto_245572 ?auto_245573 ) ) ( not ( = ?auto_245572 ?auto_245574 ) ) ( not ( = ?auto_245573 ?auto_245574 ) ) ( ON ?auto_245572 ?auto_245573 ) ( ON ?auto_245571 ?auto_245572 ) ( ON ?auto_245570 ?auto_245571 ) ( ON ?auto_245569 ?auto_245570 ) ( CLEAR ?auto_245567 ) ( ON ?auto_245568 ?auto_245569 ) ( CLEAR ?auto_245568 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_245563 ?auto_245564 ?auto_245565 ?auto_245566 ?auto_245567 ?auto_245568 )
      ( MAKE-11PILE ?auto_245563 ?auto_245564 ?auto_245565 ?auto_245566 ?auto_245567 ?auto_245568 ?auto_245569 ?auto_245570 ?auto_245571 ?auto_245572 ?auto_245573 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_245586 - BLOCK
      ?auto_245587 - BLOCK
      ?auto_245588 - BLOCK
      ?auto_245589 - BLOCK
      ?auto_245590 - BLOCK
      ?auto_245591 - BLOCK
      ?auto_245592 - BLOCK
      ?auto_245593 - BLOCK
      ?auto_245594 - BLOCK
      ?auto_245595 - BLOCK
      ?auto_245596 - BLOCK
    )
    :vars
    (
      ?auto_245597 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_245596 ?auto_245597 ) ( ON-TABLE ?auto_245586 ) ( ON ?auto_245587 ?auto_245586 ) ( ON ?auto_245588 ?auto_245587 ) ( ON ?auto_245589 ?auto_245588 ) ( ON ?auto_245590 ?auto_245589 ) ( not ( = ?auto_245586 ?auto_245587 ) ) ( not ( = ?auto_245586 ?auto_245588 ) ) ( not ( = ?auto_245586 ?auto_245589 ) ) ( not ( = ?auto_245586 ?auto_245590 ) ) ( not ( = ?auto_245586 ?auto_245591 ) ) ( not ( = ?auto_245586 ?auto_245592 ) ) ( not ( = ?auto_245586 ?auto_245593 ) ) ( not ( = ?auto_245586 ?auto_245594 ) ) ( not ( = ?auto_245586 ?auto_245595 ) ) ( not ( = ?auto_245586 ?auto_245596 ) ) ( not ( = ?auto_245586 ?auto_245597 ) ) ( not ( = ?auto_245587 ?auto_245588 ) ) ( not ( = ?auto_245587 ?auto_245589 ) ) ( not ( = ?auto_245587 ?auto_245590 ) ) ( not ( = ?auto_245587 ?auto_245591 ) ) ( not ( = ?auto_245587 ?auto_245592 ) ) ( not ( = ?auto_245587 ?auto_245593 ) ) ( not ( = ?auto_245587 ?auto_245594 ) ) ( not ( = ?auto_245587 ?auto_245595 ) ) ( not ( = ?auto_245587 ?auto_245596 ) ) ( not ( = ?auto_245587 ?auto_245597 ) ) ( not ( = ?auto_245588 ?auto_245589 ) ) ( not ( = ?auto_245588 ?auto_245590 ) ) ( not ( = ?auto_245588 ?auto_245591 ) ) ( not ( = ?auto_245588 ?auto_245592 ) ) ( not ( = ?auto_245588 ?auto_245593 ) ) ( not ( = ?auto_245588 ?auto_245594 ) ) ( not ( = ?auto_245588 ?auto_245595 ) ) ( not ( = ?auto_245588 ?auto_245596 ) ) ( not ( = ?auto_245588 ?auto_245597 ) ) ( not ( = ?auto_245589 ?auto_245590 ) ) ( not ( = ?auto_245589 ?auto_245591 ) ) ( not ( = ?auto_245589 ?auto_245592 ) ) ( not ( = ?auto_245589 ?auto_245593 ) ) ( not ( = ?auto_245589 ?auto_245594 ) ) ( not ( = ?auto_245589 ?auto_245595 ) ) ( not ( = ?auto_245589 ?auto_245596 ) ) ( not ( = ?auto_245589 ?auto_245597 ) ) ( not ( = ?auto_245590 ?auto_245591 ) ) ( not ( = ?auto_245590 ?auto_245592 ) ) ( not ( = ?auto_245590 ?auto_245593 ) ) ( not ( = ?auto_245590 ?auto_245594 ) ) ( not ( = ?auto_245590 ?auto_245595 ) ) ( not ( = ?auto_245590 ?auto_245596 ) ) ( not ( = ?auto_245590 ?auto_245597 ) ) ( not ( = ?auto_245591 ?auto_245592 ) ) ( not ( = ?auto_245591 ?auto_245593 ) ) ( not ( = ?auto_245591 ?auto_245594 ) ) ( not ( = ?auto_245591 ?auto_245595 ) ) ( not ( = ?auto_245591 ?auto_245596 ) ) ( not ( = ?auto_245591 ?auto_245597 ) ) ( not ( = ?auto_245592 ?auto_245593 ) ) ( not ( = ?auto_245592 ?auto_245594 ) ) ( not ( = ?auto_245592 ?auto_245595 ) ) ( not ( = ?auto_245592 ?auto_245596 ) ) ( not ( = ?auto_245592 ?auto_245597 ) ) ( not ( = ?auto_245593 ?auto_245594 ) ) ( not ( = ?auto_245593 ?auto_245595 ) ) ( not ( = ?auto_245593 ?auto_245596 ) ) ( not ( = ?auto_245593 ?auto_245597 ) ) ( not ( = ?auto_245594 ?auto_245595 ) ) ( not ( = ?auto_245594 ?auto_245596 ) ) ( not ( = ?auto_245594 ?auto_245597 ) ) ( not ( = ?auto_245595 ?auto_245596 ) ) ( not ( = ?auto_245595 ?auto_245597 ) ) ( not ( = ?auto_245596 ?auto_245597 ) ) ( ON ?auto_245595 ?auto_245596 ) ( ON ?auto_245594 ?auto_245595 ) ( ON ?auto_245593 ?auto_245594 ) ( ON ?auto_245592 ?auto_245593 ) ( CLEAR ?auto_245590 ) ( ON ?auto_245591 ?auto_245592 ) ( CLEAR ?auto_245591 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_245586 ?auto_245587 ?auto_245588 ?auto_245589 ?auto_245590 ?auto_245591 )
      ( MAKE-11PILE ?auto_245586 ?auto_245587 ?auto_245588 ?auto_245589 ?auto_245590 ?auto_245591 ?auto_245592 ?auto_245593 ?auto_245594 ?auto_245595 ?auto_245596 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_245609 - BLOCK
      ?auto_245610 - BLOCK
      ?auto_245611 - BLOCK
      ?auto_245612 - BLOCK
      ?auto_245613 - BLOCK
      ?auto_245614 - BLOCK
      ?auto_245615 - BLOCK
      ?auto_245616 - BLOCK
      ?auto_245617 - BLOCK
      ?auto_245618 - BLOCK
      ?auto_245619 - BLOCK
    )
    :vars
    (
      ?auto_245620 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_245619 ?auto_245620 ) ( ON-TABLE ?auto_245609 ) ( ON ?auto_245610 ?auto_245609 ) ( ON ?auto_245611 ?auto_245610 ) ( ON ?auto_245612 ?auto_245611 ) ( not ( = ?auto_245609 ?auto_245610 ) ) ( not ( = ?auto_245609 ?auto_245611 ) ) ( not ( = ?auto_245609 ?auto_245612 ) ) ( not ( = ?auto_245609 ?auto_245613 ) ) ( not ( = ?auto_245609 ?auto_245614 ) ) ( not ( = ?auto_245609 ?auto_245615 ) ) ( not ( = ?auto_245609 ?auto_245616 ) ) ( not ( = ?auto_245609 ?auto_245617 ) ) ( not ( = ?auto_245609 ?auto_245618 ) ) ( not ( = ?auto_245609 ?auto_245619 ) ) ( not ( = ?auto_245609 ?auto_245620 ) ) ( not ( = ?auto_245610 ?auto_245611 ) ) ( not ( = ?auto_245610 ?auto_245612 ) ) ( not ( = ?auto_245610 ?auto_245613 ) ) ( not ( = ?auto_245610 ?auto_245614 ) ) ( not ( = ?auto_245610 ?auto_245615 ) ) ( not ( = ?auto_245610 ?auto_245616 ) ) ( not ( = ?auto_245610 ?auto_245617 ) ) ( not ( = ?auto_245610 ?auto_245618 ) ) ( not ( = ?auto_245610 ?auto_245619 ) ) ( not ( = ?auto_245610 ?auto_245620 ) ) ( not ( = ?auto_245611 ?auto_245612 ) ) ( not ( = ?auto_245611 ?auto_245613 ) ) ( not ( = ?auto_245611 ?auto_245614 ) ) ( not ( = ?auto_245611 ?auto_245615 ) ) ( not ( = ?auto_245611 ?auto_245616 ) ) ( not ( = ?auto_245611 ?auto_245617 ) ) ( not ( = ?auto_245611 ?auto_245618 ) ) ( not ( = ?auto_245611 ?auto_245619 ) ) ( not ( = ?auto_245611 ?auto_245620 ) ) ( not ( = ?auto_245612 ?auto_245613 ) ) ( not ( = ?auto_245612 ?auto_245614 ) ) ( not ( = ?auto_245612 ?auto_245615 ) ) ( not ( = ?auto_245612 ?auto_245616 ) ) ( not ( = ?auto_245612 ?auto_245617 ) ) ( not ( = ?auto_245612 ?auto_245618 ) ) ( not ( = ?auto_245612 ?auto_245619 ) ) ( not ( = ?auto_245612 ?auto_245620 ) ) ( not ( = ?auto_245613 ?auto_245614 ) ) ( not ( = ?auto_245613 ?auto_245615 ) ) ( not ( = ?auto_245613 ?auto_245616 ) ) ( not ( = ?auto_245613 ?auto_245617 ) ) ( not ( = ?auto_245613 ?auto_245618 ) ) ( not ( = ?auto_245613 ?auto_245619 ) ) ( not ( = ?auto_245613 ?auto_245620 ) ) ( not ( = ?auto_245614 ?auto_245615 ) ) ( not ( = ?auto_245614 ?auto_245616 ) ) ( not ( = ?auto_245614 ?auto_245617 ) ) ( not ( = ?auto_245614 ?auto_245618 ) ) ( not ( = ?auto_245614 ?auto_245619 ) ) ( not ( = ?auto_245614 ?auto_245620 ) ) ( not ( = ?auto_245615 ?auto_245616 ) ) ( not ( = ?auto_245615 ?auto_245617 ) ) ( not ( = ?auto_245615 ?auto_245618 ) ) ( not ( = ?auto_245615 ?auto_245619 ) ) ( not ( = ?auto_245615 ?auto_245620 ) ) ( not ( = ?auto_245616 ?auto_245617 ) ) ( not ( = ?auto_245616 ?auto_245618 ) ) ( not ( = ?auto_245616 ?auto_245619 ) ) ( not ( = ?auto_245616 ?auto_245620 ) ) ( not ( = ?auto_245617 ?auto_245618 ) ) ( not ( = ?auto_245617 ?auto_245619 ) ) ( not ( = ?auto_245617 ?auto_245620 ) ) ( not ( = ?auto_245618 ?auto_245619 ) ) ( not ( = ?auto_245618 ?auto_245620 ) ) ( not ( = ?auto_245619 ?auto_245620 ) ) ( ON ?auto_245618 ?auto_245619 ) ( ON ?auto_245617 ?auto_245618 ) ( ON ?auto_245616 ?auto_245617 ) ( ON ?auto_245615 ?auto_245616 ) ( ON ?auto_245614 ?auto_245615 ) ( CLEAR ?auto_245612 ) ( ON ?auto_245613 ?auto_245614 ) ( CLEAR ?auto_245613 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_245609 ?auto_245610 ?auto_245611 ?auto_245612 ?auto_245613 )
      ( MAKE-11PILE ?auto_245609 ?auto_245610 ?auto_245611 ?auto_245612 ?auto_245613 ?auto_245614 ?auto_245615 ?auto_245616 ?auto_245617 ?auto_245618 ?auto_245619 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_245632 - BLOCK
      ?auto_245633 - BLOCK
      ?auto_245634 - BLOCK
      ?auto_245635 - BLOCK
      ?auto_245636 - BLOCK
      ?auto_245637 - BLOCK
      ?auto_245638 - BLOCK
      ?auto_245639 - BLOCK
      ?auto_245640 - BLOCK
      ?auto_245641 - BLOCK
      ?auto_245642 - BLOCK
    )
    :vars
    (
      ?auto_245643 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_245642 ?auto_245643 ) ( ON-TABLE ?auto_245632 ) ( ON ?auto_245633 ?auto_245632 ) ( ON ?auto_245634 ?auto_245633 ) ( ON ?auto_245635 ?auto_245634 ) ( not ( = ?auto_245632 ?auto_245633 ) ) ( not ( = ?auto_245632 ?auto_245634 ) ) ( not ( = ?auto_245632 ?auto_245635 ) ) ( not ( = ?auto_245632 ?auto_245636 ) ) ( not ( = ?auto_245632 ?auto_245637 ) ) ( not ( = ?auto_245632 ?auto_245638 ) ) ( not ( = ?auto_245632 ?auto_245639 ) ) ( not ( = ?auto_245632 ?auto_245640 ) ) ( not ( = ?auto_245632 ?auto_245641 ) ) ( not ( = ?auto_245632 ?auto_245642 ) ) ( not ( = ?auto_245632 ?auto_245643 ) ) ( not ( = ?auto_245633 ?auto_245634 ) ) ( not ( = ?auto_245633 ?auto_245635 ) ) ( not ( = ?auto_245633 ?auto_245636 ) ) ( not ( = ?auto_245633 ?auto_245637 ) ) ( not ( = ?auto_245633 ?auto_245638 ) ) ( not ( = ?auto_245633 ?auto_245639 ) ) ( not ( = ?auto_245633 ?auto_245640 ) ) ( not ( = ?auto_245633 ?auto_245641 ) ) ( not ( = ?auto_245633 ?auto_245642 ) ) ( not ( = ?auto_245633 ?auto_245643 ) ) ( not ( = ?auto_245634 ?auto_245635 ) ) ( not ( = ?auto_245634 ?auto_245636 ) ) ( not ( = ?auto_245634 ?auto_245637 ) ) ( not ( = ?auto_245634 ?auto_245638 ) ) ( not ( = ?auto_245634 ?auto_245639 ) ) ( not ( = ?auto_245634 ?auto_245640 ) ) ( not ( = ?auto_245634 ?auto_245641 ) ) ( not ( = ?auto_245634 ?auto_245642 ) ) ( not ( = ?auto_245634 ?auto_245643 ) ) ( not ( = ?auto_245635 ?auto_245636 ) ) ( not ( = ?auto_245635 ?auto_245637 ) ) ( not ( = ?auto_245635 ?auto_245638 ) ) ( not ( = ?auto_245635 ?auto_245639 ) ) ( not ( = ?auto_245635 ?auto_245640 ) ) ( not ( = ?auto_245635 ?auto_245641 ) ) ( not ( = ?auto_245635 ?auto_245642 ) ) ( not ( = ?auto_245635 ?auto_245643 ) ) ( not ( = ?auto_245636 ?auto_245637 ) ) ( not ( = ?auto_245636 ?auto_245638 ) ) ( not ( = ?auto_245636 ?auto_245639 ) ) ( not ( = ?auto_245636 ?auto_245640 ) ) ( not ( = ?auto_245636 ?auto_245641 ) ) ( not ( = ?auto_245636 ?auto_245642 ) ) ( not ( = ?auto_245636 ?auto_245643 ) ) ( not ( = ?auto_245637 ?auto_245638 ) ) ( not ( = ?auto_245637 ?auto_245639 ) ) ( not ( = ?auto_245637 ?auto_245640 ) ) ( not ( = ?auto_245637 ?auto_245641 ) ) ( not ( = ?auto_245637 ?auto_245642 ) ) ( not ( = ?auto_245637 ?auto_245643 ) ) ( not ( = ?auto_245638 ?auto_245639 ) ) ( not ( = ?auto_245638 ?auto_245640 ) ) ( not ( = ?auto_245638 ?auto_245641 ) ) ( not ( = ?auto_245638 ?auto_245642 ) ) ( not ( = ?auto_245638 ?auto_245643 ) ) ( not ( = ?auto_245639 ?auto_245640 ) ) ( not ( = ?auto_245639 ?auto_245641 ) ) ( not ( = ?auto_245639 ?auto_245642 ) ) ( not ( = ?auto_245639 ?auto_245643 ) ) ( not ( = ?auto_245640 ?auto_245641 ) ) ( not ( = ?auto_245640 ?auto_245642 ) ) ( not ( = ?auto_245640 ?auto_245643 ) ) ( not ( = ?auto_245641 ?auto_245642 ) ) ( not ( = ?auto_245641 ?auto_245643 ) ) ( not ( = ?auto_245642 ?auto_245643 ) ) ( ON ?auto_245641 ?auto_245642 ) ( ON ?auto_245640 ?auto_245641 ) ( ON ?auto_245639 ?auto_245640 ) ( ON ?auto_245638 ?auto_245639 ) ( ON ?auto_245637 ?auto_245638 ) ( CLEAR ?auto_245635 ) ( ON ?auto_245636 ?auto_245637 ) ( CLEAR ?auto_245636 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_245632 ?auto_245633 ?auto_245634 ?auto_245635 ?auto_245636 )
      ( MAKE-11PILE ?auto_245632 ?auto_245633 ?auto_245634 ?auto_245635 ?auto_245636 ?auto_245637 ?auto_245638 ?auto_245639 ?auto_245640 ?auto_245641 ?auto_245642 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_245655 - BLOCK
      ?auto_245656 - BLOCK
      ?auto_245657 - BLOCK
      ?auto_245658 - BLOCK
      ?auto_245659 - BLOCK
      ?auto_245660 - BLOCK
      ?auto_245661 - BLOCK
      ?auto_245662 - BLOCK
      ?auto_245663 - BLOCK
      ?auto_245664 - BLOCK
      ?auto_245665 - BLOCK
    )
    :vars
    (
      ?auto_245666 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_245665 ?auto_245666 ) ( ON-TABLE ?auto_245655 ) ( ON ?auto_245656 ?auto_245655 ) ( ON ?auto_245657 ?auto_245656 ) ( not ( = ?auto_245655 ?auto_245656 ) ) ( not ( = ?auto_245655 ?auto_245657 ) ) ( not ( = ?auto_245655 ?auto_245658 ) ) ( not ( = ?auto_245655 ?auto_245659 ) ) ( not ( = ?auto_245655 ?auto_245660 ) ) ( not ( = ?auto_245655 ?auto_245661 ) ) ( not ( = ?auto_245655 ?auto_245662 ) ) ( not ( = ?auto_245655 ?auto_245663 ) ) ( not ( = ?auto_245655 ?auto_245664 ) ) ( not ( = ?auto_245655 ?auto_245665 ) ) ( not ( = ?auto_245655 ?auto_245666 ) ) ( not ( = ?auto_245656 ?auto_245657 ) ) ( not ( = ?auto_245656 ?auto_245658 ) ) ( not ( = ?auto_245656 ?auto_245659 ) ) ( not ( = ?auto_245656 ?auto_245660 ) ) ( not ( = ?auto_245656 ?auto_245661 ) ) ( not ( = ?auto_245656 ?auto_245662 ) ) ( not ( = ?auto_245656 ?auto_245663 ) ) ( not ( = ?auto_245656 ?auto_245664 ) ) ( not ( = ?auto_245656 ?auto_245665 ) ) ( not ( = ?auto_245656 ?auto_245666 ) ) ( not ( = ?auto_245657 ?auto_245658 ) ) ( not ( = ?auto_245657 ?auto_245659 ) ) ( not ( = ?auto_245657 ?auto_245660 ) ) ( not ( = ?auto_245657 ?auto_245661 ) ) ( not ( = ?auto_245657 ?auto_245662 ) ) ( not ( = ?auto_245657 ?auto_245663 ) ) ( not ( = ?auto_245657 ?auto_245664 ) ) ( not ( = ?auto_245657 ?auto_245665 ) ) ( not ( = ?auto_245657 ?auto_245666 ) ) ( not ( = ?auto_245658 ?auto_245659 ) ) ( not ( = ?auto_245658 ?auto_245660 ) ) ( not ( = ?auto_245658 ?auto_245661 ) ) ( not ( = ?auto_245658 ?auto_245662 ) ) ( not ( = ?auto_245658 ?auto_245663 ) ) ( not ( = ?auto_245658 ?auto_245664 ) ) ( not ( = ?auto_245658 ?auto_245665 ) ) ( not ( = ?auto_245658 ?auto_245666 ) ) ( not ( = ?auto_245659 ?auto_245660 ) ) ( not ( = ?auto_245659 ?auto_245661 ) ) ( not ( = ?auto_245659 ?auto_245662 ) ) ( not ( = ?auto_245659 ?auto_245663 ) ) ( not ( = ?auto_245659 ?auto_245664 ) ) ( not ( = ?auto_245659 ?auto_245665 ) ) ( not ( = ?auto_245659 ?auto_245666 ) ) ( not ( = ?auto_245660 ?auto_245661 ) ) ( not ( = ?auto_245660 ?auto_245662 ) ) ( not ( = ?auto_245660 ?auto_245663 ) ) ( not ( = ?auto_245660 ?auto_245664 ) ) ( not ( = ?auto_245660 ?auto_245665 ) ) ( not ( = ?auto_245660 ?auto_245666 ) ) ( not ( = ?auto_245661 ?auto_245662 ) ) ( not ( = ?auto_245661 ?auto_245663 ) ) ( not ( = ?auto_245661 ?auto_245664 ) ) ( not ( = ?auto_245661 ?auto_245665 ) ) ( not ( = ?auto_245661 ?auto_245666 ) ) ( not ( = ?auto_245662 ?auto_245663 ) ) ( not ( = ?auto_245662 ?auto_245664 ) ) ( not ( = ?auto_245662 ?auto_245665 ) ) ( not ( = ?auto_245662 ?auto_245666 ) ) ( not ( = ?auto_245663 ?auto_245664 ) ) ( not ( = ?auto_245663 ?auto_245665 ) ) ( not ( = ?auto_245663 ?auto_245666 ) ) ( not ( = ?auto_245664 ?auto_245665 ) ) ( not ( = ?auto_245664 ?auto_245666 ) ) ( not ( = ?auto_245665 ?auto_245666 ) ) ( ON ?auto_245664 ?auto_245665 ) ( ON ?auto_245663 ?auto_245664 ) ( ON ?auto_245662 ?auto_245663 ) ( ON ?auto_245661 ?auto_245662 ) ( ON ?auto_245660 ?auto_245661 ) ( ON ?auto_245659 ?auto_245660 ) ( CLEAR ?auto_245657 ) ( ON ?auto_245658 ?auto_245659 ) ( CLEAR ?auto_245658 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_245655 ?auto_245656 ?auto_245657 ?auto_245658 )
      ( MAKE-11PILE ?auto_245655 ?auto_245656 ?auto_245657 ?auto_245658 ?auto_245659 ?auto_245660 ?auto_245661 ?auto_245662 ?auto_245663 ?auto_245664 ?auto_245665 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_245678 - BLOCK
      ?auto_245679 - BLOCK
      ?auto_245680 - BLOCK
      ?auto_245681 - BLOCK
      ?auto_245682 - BLOCK
      ?auto_245683 - BLOCK
      ?auto_245684 - BLOCK
      ?auto_245685 - BLOCK
      ?auto_245686 - BLOCK
      ?auto_245687 - BLOCK
      ?auto_245688 - BLOCK
    )
    :vars
    (
      ?auto_245689 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_245688 ?auto_245689 ) ( ON-TABLE ?auto_245678 ) ( ON ?auto_245679 ?auto_245678 ) ( ON ?auto_245680 ?auto_245679 ) ( not ( = ?auto_245678 ?auto_245679 ) ) ( not ( = ?auto_245678 ?auto_245680 ) ) ( not ( = ?auto_245678 ?auto_245681 ) ) ( not ( = ?auto_245678 ?auto_245682 ) ) ( not ( = ?auto_245678 ?auto_245683 ) ) ( not ( = ?auto_245678 ?auto_245684 ) ) ( not ( = ?auto_245678 ?auto_245685 ) ) ( not ( = ?auto_245678 ?auto_245686 ) ) ( not ( = ?auto_245678 ?auto_245687 ) ) ( not ( = ?auto_245678 ?auto_245688 ) ) ( not ( = ?auto_245678 ?auto_245689 ) ) ( not ( = ?auto_245679 ?auto_245680 ) ) ( not ( = ?auto_245679 ?auto_245681 ) ) ( not ( = ?auto_245679 ?auto_245682 ) ) ( not ( = ?auto_245679 ?auto_245683 ) ) ( not ( = ?auto_245679 ?auto_245684 ) ) ( not ( = ?auto_245679 ?auto_245685 ) ) ( not ( = ?auto_245679 ?auto_245686 ) ) ( not ( = ?auto_245679 ?auto_245687 ) ) ( not ( = ?auto_245679 ?auto_245688 ) ) ( not ( = ?auto_245679 ?auto_245689 ) ) ( not ( = ?auto_245680 ?auto_245681 ) ) ( not ( = ?auto_245680 ?auto_245682 ) ) ( not ( = ?auto_245680 ?auto_245683 ) ) ( not ( = ?auto_245680 ?auto_245684 ) ) ( not ( = ?auto_245680 ?auto_245685 ) ) ( not ( = ?auto_245680 ?auto_245686 ) ) ( not ( = ?auto_245680 ?auto_245687 ) ) ( not ( = ?auto_245680 ?auto_245688 ) ) ( not ( = ?auto_245680 ?auto_245689 ) ) ( not ( = ?auto_245681 ?auto_245682 ) ) ( not ( = ?auto_245681 ?auto_245683 ) ) ( not ( = ?auto_245681 ?auto_245684 ) ) ( not ( = ?auto_245681 ?auto_245685 ) ) ( not ( = ?auto_245681 ?auto_245686 ) ) ( not ( = ?auto_245681 ?auto_245687 ) ) ( not ( = ?auto_245681 ?auto_245688 ) ) ( not ( = ?auto_245681 ?auto_245689 ) ) ( not ( = ?auto_245682 ?auto_245683 ) ) ( not ( = ?auto_245682 ?auto_245684 ) ) ( not ( = ?auto_245682 ?auto_245685 ) ) ( not ( = ?auto_245682 ?auto_245686 ) ) ( not ( = ?auto_245682 ?auto_245687 ) ) ( not ( = ?auto_245682 ?auto_245688 ) ) ( not ( = ?auto_245682 ?auto_245689 ) ) ( not ( = ?auto_245683 ?auto_245684 ) ) ( not ( = ?auto_245683 ?auto_245685 ) ) ( not ( = ?auto_245683 ?auto_245686 ) ) ( not ( = ?auto_245683 ?auto_245687 ) ) ( not ( = ?auto_245683 ?auto_245688 ) ) ( not ( = ?auto_245683 ?auto_245689 ) ) ( not ( = ?auto_245684 ?auto_245685 ) ) ( not ( = ?auto_245684 ?auto_245686 ) ) ( not ( = ?auto_245684 ?auto_245687 ) ) ( not ( = ?auto_245684 ?auto_245688 ) ) ( not ( = ?auto_245684 ?auto_245689 ) ) ( not ( = ?auto_245685 ?auto_245686 ) ) ( not ( = ?auto_245685 ?auto_245687 ) ) ( not ( = ?auto_245685 ?auto_245688 ) ) ( not ( = ?auto_245685 ?auto_245689 ) ) ( not ( = ?auto_245686 ?auto_245687 ) ) ( not ( = ?auto_245686 ?auto_245688 ) ) ( not ( = ?auto_245686 ?auto_245689 ) ) ( not ( = ?auto_245687 ?auto_245688 ) ) ( not ( = ?auto_245687 ?auto_245689 ) ) ( not ( = ?auto_245688 ?auto_245689 ) ) ( ON ?auto_245687 ?auto_245688 ) ( ON ?auto_245686 ?auto_245687 ) ( ON ?auto_245685 ?auto_245686 ) ( ON ?auto_245684 ?auto_245685 ) ( ON ?auto_245683 ?auto_245684 ) ( ON ?auto_245682 ?auto_245683 ) ( CLEAR ?auto_245680 ) ( ON ?auto_245681 ?auto_245682 ) ( CLEAR ?auto_245681 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_245678 ?auto_245679 ?auto_245680 ?auto_245681 )
      ( MAKE-11PILE ?auto_245678 ?auto_245679 ?auto_245680 ?auto_245681 ?auto_245682 ?auto_245683 ?auto_245684 ?auto_245685 ?auto_245686 ?auto_245687 ?auto_245688 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_245701 - BLOCK
      ?auto_245702 - BLOCK
      ?auto_245703 - BLOCK
      ?auto_245704 - BLOCK
      ?auto_245705 - BLOCK
      ?auto_245706 - BLOCK
      ?auto_245707 - BLOCK
      ?auto_245708 - BLOCK
      ?auto_245709 - BLOCK
      ?auto_245710 - BLOCK
      ?auto_245711 - BLOCK
    )
    :vars
    (
      ?auto_245712 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_245711 ?auto_245712 ) ( ON-TABLE ?auto_245701 ) ( ON ?auto_245702 ?auto_245701 ) ( not ( = ?auto_245701 ?auto_245702 ) ) ( not ( = ?auto_245701 ?auto_245703 ) ) ( not ( = ?auto_245701 ?auto_245704 ) ) ( not ( = ?auto_245701 ?auto_245705 ) ) ( not ( = ?auto_245701 ?auto_245706 ) ) ( not ( = ?auto_245701 ?auto_245707 ) ) ( not ( = ?auto_245701 ?auto_245708 ) ) ( not ( = ?auto_245701 ?auto_245709 ) ) ( not ( = ?auto_245701 ?auto_245710 ) ) ( not ( = ?auto_245701 ?auto_245711 ) ) ( not ( = ?auto_245701 ?auto_245712 ) ) ( not ( = ?auto_245702 ?auto_245703 ) ) ( not ( = ?auto_245702 ?auto_245704 ) ) ( not ( = ?auto_245702 ?auto_245705 ) ) ( not ( = ?auto_245702 ?auto_245706 ) ) ( not ( = ?auto_245702 ?auto_245707 ) ) ( not ( = ?auto_245702 ?auto_245708 ) ) ( not ( = ?auto_245702 ?auto_245709 ) ) ( not ( = ?auto_245702 ?auto_245710 ) ) ( not ( = ?auto_245702 ?auto_245711 ) ) ( not ( = ?auto_245702 ?auto_245712 ) ) ( not ( = ?auto_245703 ?auto_245704 ) ) ( not ( = ?auto_245703 ?auto_245705 ) ) ( not ( = ?auto_245703 ?auto_245706 ) ) ( not ( = ?auto_245703 ?auto_245707 ) ) ( not ( = ?auto_245703 ?auto_245708 ) ) ( not ( = ?auto_245703 ?auto_245709 ) ) ( not ( = ?auto_245703 ?auto_245710 ) ) ( not ( = ?auto_245703 ?auto_245711 ) ) ( not ( = ?auto_245703 ?auto_245712 ) ) ( not ( = ?auto_245704 ?auto_245705 ) ) ( not ( = ?auto_245704 ?auto_245706 ) ) ( not ( = ?auto_245704 ?auto_245707 ) ) ( not ( = ?auto_245704 ?auto_245708 ) ) ( not ( = ?auto_245704 ?auto_245709 ) ) ( not ( = ?auto_245704 ?auto_245710 ) ) ( not ( = ?auto_245704 ?auto_245711 ) ) ( not ( = ?auto_245704 ?auto_245712 ) ) ( not ( = ?auto_245705 ?auto_245706 ) ) ( not ( = ?auto_245705 ?auto_245707 ) ) ( not ( = ?auto_245705 ?auto_245708 ) ) ( not ( = ?auto_245705 ?auto_245709 ) ) ( not ( = ?auto_245705 ?auto_245710 ) ) ( not ( = ?auto_245705 ?auto_245711 ) ) ( not ( = ?auto_245705 ?auto_245712 ) ) ( not ( = ?auto_245706 ?auto_245707 ) ) ( not ( = ?auto_245706 ?auto_245708 ) ) ( not ( = ?auto_245706 ?auto_245709 ) ) ( not ( = ?auto_245706 ?auto_245710 ) ) ( not ( = ?auto_245706 ?auto_245711 ) ) ( not ( = ?auto_245706 ?auto_245712 ) ) ( not ( = ?auto_245707 ?auto_245708 ) ) ( not ( = ?auto_245707 ?auto_245709 ) ) ( not ( = ?auto_245707 ?auto_245710 ) ) ( not ( = ?auto_245707 ?auto_245711 ) ) ( not ( = ?auto_245707 ?auto_245712 ) ) ( not ( = ?auto_245708 ?auto_245709 ) ) ( not ( = ?auto_245708 ?auto_245710 ) ) ( not ( = ?auto_245708 ?auto_245711 ) ) ( not ( = ?auto_245708 ?auto_245712 ) ) ( not ( = ?auto_245709 ?auto_245710 ) ) ( not ( = ?auto_245709 ?auto_245711 ) ) ( not ( = ?auto_245709 ?auto_245712 ) ) ( not ( = ?auto_245710 ?auto_245711 ) ) ( not ( = ?auto_245710 ?auto_245712 ) ) ( not ( = ?auto_245711 ?auto_245712 ) ) ( ON ?auto_245710 ?auto_245711 ) ( ON ?auto_245709 ?auto_245710 ) ( ON ?auto_245708 ?auto_245709 ) ( ON ?auto_245707 ?auto_245708 ) ( ON ?auto_245706 ?auto_245707 ) ( ON ?auto_245705 ?auto_245706 ) ( ON ?auto_245704 ?auto_245705 ) ( CLEAR ?auto_245702 ) ( ON ?auto_245703 ?auto_245704 ) ( CLEAR ?auto_245703 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_245701 ?auto_245702 ?auto_245703 )
      ( MAKE-11PILE ?auto_245701 ?auto_245702 ?auto_245703 ?auto_245704 ?auto_245705 ?auto_245706 ?auto_245707 ?auto_245708 ?auto_245709 ?auto_245710 ?auto_245711 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_245724 - BLOCK
      ?auto_245725 - BLOCK
      ?auto_245726 - BLOCK
      ?auto_245727 - BLOCK
      ?auto_245728 - BLOCK
      ?auto_245729 - BLOCK
      ?auto_245730 - BLOCK
      ?auto_245731 - BLOCK
      ?auto_245732 - BLOCK
      ?auto_245733 - BLOCK
      ?auto_245734 - BLOCK
    )
    :vars
    (
      ?auto_245735 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_245734 ?auto_245735 ) ( ON-TABLE ?auto_245724 ) ( ON ?auto_245725 ?auto_245724 ) ( not ( = ?auto_245724 ?auto_245725 ) ) ( not ( = ?auto_245724 ?auto_245726 ) ) ( not ( = ?auto_245724 ?auto_245727 ) ) ( not ( = ?auto_245724 ?auto_245728 ) ) ( not ( = ?auto_245724 ?auto_245729 ) ) ( not ( = ?auto_245724 ?auto_245730 ) ) ( not ( = ?auto_245724 ?auto_245731 ) ) ( not ( = ?auto_245724 ?auto_245732 ) ) ( not ( = ?auto_245724 ?auto_245733 ) ) ( not ( = ?auto_245724 ?auto_245734 ) ) ( not ( = ?auto_245724 ?auto_245735 ) ) ( not ( = ?auto_245725 ?auto_245726 ) ) ( not ( = ?auto_245725 ?auto_245727 ) ) ( not ( = ?auto_245725 ?auto_245728 ) ) ( not ( = ?auto_245725 ?auto_245729 ) ) ( not ( = ?auto_245725 ?auto_245730 ) ) ( not ( = ?auto_245725 ?auto_245731 ) ) ( not ( = ?auto_245725 ?auto_245732 ) ) ( not ( = ?auto_245725 ?auto_245733 ) ) ( not ( = ?auto_245725 ?auto_245734 ) ) ( not ( = ?auto_245725 ?auto_245735 ) ) ( not ( = ?auto_245726 ?auto_245727 ) ) ( not ( = ?auto_245726 ?auto_245728 ) ) ( not ( = ?auto_245726 ?auto_245729 ) ) ( not ( = ?auto_245726 ?auto_245730 ) ) ( not ( = ?auto_245726 ?auto_245731 ) ) ( not ( = ?auto_245726 ?auto_245732 ) ) ( not ( = ?auto_245726 ?auto_245733 ) ) ( not ( = ?auto_245726 ?auto_245734 ) ) ( not ( = ?auto_245726 ?auto_245735 ) ) ( not ( = ?auto_245727 ?auto_245728 ) ) ( not ( = ?auto_245727 ?auto_245729 ) ) ( not ( = ?auto_245727 ?auto_245730 ) ) ( not ( = ?auto_245727 ?auto_245731 ) ) ( not ( = ?auto_245727 ?auto_245732 ) ) ( not ( = ?auto_245727 ?auto_245733 ) ) ( not ( = ?auto_245727 ?auto_245734 ) ) ( not ( = ?auto_245727 ?auto_245735 ) ) ( not ( = ?auto_245728 ?auto_245729 ) ) ( not ( = ?auto_245728 ?auto_245730 ) ) ( not ( = ?auto_245728 ?auto_245731 ) ) ( not ( = ?auto_245728 ?auto_245732 ) ) ( not ( = ?auto_245728 ?auto_245733 ) ) ( not ( = ?auto_245728 ?auto_245734 ) ) ( not ( = ?auto_245728 ?auto_245735 ) ) ( not ( = ?auto_245729 ?auto_245730 ) ) ( not ( = ?auto_245729 ?auto_245731 ) ) ( not ( = ?auto_245729 ?auto_245732 ) ) ( not ( = ?auto_245729 ?auto_245733 ) ) ( not ( = ?auto_245729 ?auto_245734 ) ) ( not ( = ?auto_245729 ?auto_245735 ) ) ( not ( = ?auto_245730 ?auto_245731 ) ) ( not ( = ?auto_245730 ?auto_245732 ) ) ( not ( = ?auto_245730 ?auto_245733 ) ) ( not ( = ?auto_245730 ?auto_245734 ) ) ( not ( = ?auto_245730 ?auto_245735 ) ) ( not ( = ?auto_245731 ?auto_245732 ) ) ( not ( = ?auto_245731 ?auto_245733 ) ) ( not ( = ?auto_245731 ?auto_245734 ) ) ( not ( = ?auto_245731 ?auto_245735 ) ) ( not ( = ?auto_245732 ?auto_245733 ) ) ( not ( = ?auto_245732 ?auto_245734 ) ) ( not ( = ?auto_245732 ?auto_245735 ) ) ( not ( = ?auto_245733 ?auto_245734 ) ) ( not ( = ?auto_245733 ?auto_245735 ) ) ( not ( = ?auto_245734 ?auto_245735 ) ) ( ON ?auto_245733 ?auto_245734 ) ( ON ?auto_245732 ?auto_245733 ) ( ON ?auto_245731 ?auto_245732 ) ( ON ?auto_245730 ?auto_245731 ) ( ON ?auto_245729 ?auto_245730 ) ( ON ?auto_245728 ?auto_245729 ) ( ON ?auto_245727 ?auto_245728 ) ( CLEAR ?auto_245725 ) ( ON ?auto_245726 ?auto_245727 ) ( CLEAR ?auto_245726 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_245724 ?auto_245725 ?auto_245726 )
      ( MAKE-11PILE ?auto_245724 ?auto_245725 ?auto_245726 ?auto_245727 ?auto_245728 ?auto_245729 ?auto_245730 ?auto_245731 ?auto_245732 ?auto_245733 ?auto_245734 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_245747 - BLOCK
      ?auto_245748 - BLOCK
      ?auto_245749 - BLOCK
      ?auto_245750 - BLOCK
      ?auto_245751 - BLOCK
      ?auto_245752 - BLOCK
      ?auto_245753 - BLOCK
      ?auto_245754 - BLOCK
      ?auto_245755 - BLOCK
      ?auto_245756 - BLOCK
      ?auto_245757 - BLOCK
    )
    :vars
    (
      ?auto_245758 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_245757 ?auto_245758 ) ( ON-TABLE ?auto_245747 ) ( not ( = ?auto_245747 ?auto_245748 ) ) ( not ( = ?auto_245747 ?auto_245749 ) ) ( not ( = ?auto_245747 ?auto_245750 ) ) ( not ( = ?auto_245747 ?auto_245751 ) ) ( not ( = ?auto_245747 ?auto_245752 ) ) ( not ( = ?auto_245747 ?auto_245753 ) ) ( not ( = ?auto_245747 ?auto_245754 ) ) ( not ( = ?auto_245747 ?auto_245755 ) ) ( not ( = ?auto_245747 ?auto_245756 ) ) ( not ( = ?auto_245747 ?auto_245757 ) ) ( not ( = ?auto_245747 ?auto_245758 ) ) ( not ( = ?auto_245748 ?auto_245749 ) ) ( not ( = ?auto_245748 ?auto_245750 ) ) ( not ( = ?auto_245748 ?auto_245751 ) ) ( not ( = ?auto_245748 ?auto_245752 ) ) ( not ( = ?auto_245748 ?auto_245753 ) ) ( not ( = ?auto_245748 ?auto_245754 ) ) ( not ( = ?auto_245748 ?auto_245755 ) ) ( not ( = ?auto_245748 ?auto_245756 ) ) ( not ( = ?auto_245748 ?auto_245757 ) ) ( not ( = ?auto_245748 ?auto_245758 ) ) ( not ( = ?auto_245749 ?auto_245750 ) ) ( not ( = ?auto_245749 ?auto_245751 ) ) ( not ( = ?auto_245749 ?auto_245752 ) ) ( not ( = ?auto_245749 ?auto_245753 ) ) ( not ( = ?auto_245749 ?auto_245754 ) ) ( not ( = ?auto_245749 ?auto_245755 ) ) ( not ( = ?auto_245749 ?auto_245756 ) ) ( not ( = ?auto_245749 ?auto_245757 ) ) ( not ( = ?auto_245749 ?auto_245758 ) ) ( not ( = ?auto_245750 ?auto_245751 ) ) ( not ( = ?auto_245750 ?auto_245752 ) ) ( not ( = ?auto_245750 ?auto_245753 ) ) ( not ( = ?auto_245750 ?auto_245754 ) ) ( not ( = ?auto_245750 ?auto_245755 ) ) ( not ( = ?auto_245750 ?auto_245756 ) ) ( not ( = ?auto_245750 ?auto_245757 ) ) ( not ( = ?auto_245750 ?auto_245758 ) ) ( not ( = ?auto_245751 ?auto_245752 ) ) ( not ( = ?auto_245751 ?auto_245753 ) ) ( not ( = ?auto_245751 ?auto_245754 ) ) ( not ( = ?auto_245751 ?auto_245755 ) ) ( not ( = ?auto_245751 ?auto_245756 ) ) ( not ( = ?auto_245751 ?auto_245757 ) ) ( not ( = ?auto_245751 ?auto_245758 ) ) ( not ( = ?auto_245752 ?auto_245753 ) ) ( not ( = ?auto_245752 ?auto_245754 ) ) ( not ( = ?auto_245752 ?auto_245755 ) ) ( not ( = ?auto_245752 ?auto_245756 ) ) ( not ( = ?auto_245752 ?auto_245757 ) ) ( not ( = ?auto_245752 ?auto_245758 ) ) ( not ( = ?auto_245753 ?auto_245754 ) ) ( not ( = ?auto_245753 ?auto_245755 ) ) ( not ( = ?auto_245753 ?auto_245756 ) ) ( not ( = ?auto_245753 ?auto_245757 ) ) ( not ( = ?auto_245753 ?auto_245758 ) ) ( not ( = ?auto_245754 ?auto_245755 ) ) ( not ( = ?auto_245754 ?auto_245756 ) ) ( not ( = ?auto_245754 ?auto_245757 ) ) ( not ( = ?auto_245754 ?auto_245758 ) ) ( not ( = ?auto_245755 ?auto_245756 ) ) ( not ( = ?auto_245755 ?auto_245757 ) ) ( not ( = ?auto_245755 ?auto_245758 ) ) ( not ( = ?auto_245756 ?auto_245757 ) ) ( not ( = ?auto_245756 ?auto_245758 ) ) ( not ( = ?auto_245757 ?auto_245758 ) ) ( ON ?auto_245756 ?auto_245757 ) ( ON ?auto_245755 ?auto_245756 ) ( ON ?auto_245754 ?auto_245755 ) ( ON ?auto_245753 ?auto_245754 ) ( ON ?auto_245752 ?auto_245753 ) ( ON ?auto_245751 ?auto_245752 ) ( ON ?auto_245750 ?auto_245751 ) ( ON ?auto_245749 ?auto_245750 ) ( CLEAR ?auto_245747 ) ( ON ?auto_245748 ?auto_245749 ) ( CLEAR ?auto_245748 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_245747 ?auto_245748 )
      ( MAKE-11PILE ?auto_245747 ?auto_245748 ?auto_245749 ?auto_245750 ?auto_245751 ?auto_245752 ?auto_245753 ?auto_245754 ?auto_245755 ?auto_245756 ?auto_245757 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_245770 - BLOCK
      ?auto_245771 - BLOCK
      ?auto_245772 - BLOCK
      ?auto_245773 - BLOCK
      ?auto_245774 - BLOCK
      ?auto_245775 - BLOCK
      ?auto_245776 - BLOCK
      ?auto_245777 - BLOCK
      ?auto_245778 - BLOCK
      ?auto_245779 - BLOCK
      ?auto_245780 - BLOCK
    )
    :vars
    (
      ?auto_245781 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_245780 ?auto_245781 ) ( ON-TABLE ?auto_245770 ) ( not ( = ?auto_245770 ?auto_245771 ) ) ( not ( = ?auto_245770 ?auto_245772 ) ) ( not ( = ?auto_245770 ?auto_245773 ) ) ( not ( = ?auto_245770 ?auto_245774 ) ) ( not ( = ?auto_245770 ?auto_245775 ) ) ( not ( = ?auto_245770 ?auto_245776 ) ) ( not ( = ?auto_245770 ?auto_245777 ) ) ( not ( = ?auto_245770 ?auto_245778 ) ) ( not ( = ?auto_245770 ?auto_245779 ) ) ( not ( = ?auto_245770 ?auto_245780 ) ) ( not ( = ?auto_245770 ?auto_245781 ) ) ( not ( = ?auto_245771 ?auto_245772 ) ) ( not ( = ?auto_245771 ?auto_245773 ) ) ( not ( = ?auto_245771 ?auto_245774 ) ) ( not ( = ?auto_245771 ?auto_245775 ) ) ( not ( = ?auto_245771 ?auto_245776 ) ) ( not ( = ?auto_245771 ?auto_245777 ) ) ( not ( = ?auto_245771 ?auto_245778 ) ) ( not ( = ?auto_245771 ?auto_245779 ) ) ( not ( = ?auto_245771 ?auto_245780 ) ) ( not ( = ?auto_245771 ?auto_245781 ) ) ( not ( = ?auto_245772 ?auto_245773 ) ) ( not ( = ?auto_245772 ?auto_245774 ) ) ( not ( = ?auto_245772 ?auto_245775 ) ) ( not ( = ?auto_245772 ?auto_245776 ) ) ( not ( = ?auto_245772 ?auto_245777 ) ) ( not ( = ?auto_245772 ?auto_245778 ) ) ( not ( = ?auto_245772 ?auto_245779 ) ) ( not ( = ?auto_245772 ?auto_245780 ) ) ( not ( = ?auto_245772 ?auto_245781 ) ) ( not ( = ?auto_245773 ?auto_245774 ) ) ( not ( = ?auto_245773 ?auto_245775 ) ) ( not ( = ?auto_245773 ?auto_245776 ) ) ( not ( = ?auto_245773 ?auto_245777 ) ) ( not ( = ?auto_245773 ?auto_245778 ) ) ( not ( = ?auto_245773 ?auto_245779 ) ) ( not ( = ?auto_245773 ?auto_245780 ) ) ( not ( = ?auto_245773 ?auto_245781 ) ) ( not ( = ?auto_245774 ?auto_245775 ) ) ( not ( = ?auto_245774 ?auto_245776 ) ) ( not ( = ?auto_245774 ?auto_245777 ) ) ( not ( = ?auto_245774 ?auto_245778 ) ) ( not ( = ?auto_245774 ?auto_245779 ) ) ( not ( = ?auto_245774 ?auto_245780 ) ) ( not ( = ?auto_245774 ?auto_245781 ) ) ( not ( = ?auto_245775 ?auto_245776 ) ) ( not ( = ?auto_245775 ?auto_245777 ) ) ( not ( = ?auto_245775 ?auto_245778 ) ) ( not ( = ?auto_245775 ?auto_245779 ) ) ( not ( = ?auto_245775 ?auto_245780 ) ) ( not ( = ?auto_245775 ?auto_245781 ) ) ( not ( = ?auto_245776 ?auto_245777 ) ) ( not ( = ?auto_245776 ?auto_245778 ) ) ( not ( = ?auto_245776 ?auto_245779 ) ) ( not ( = ?auto_245776 ?auto_245780 ) ) ( not ( = ?auto_245776 ?auto_245781 ) ) ( not ( = ?auto_245777 ?auto_245778 ) ) ( not ( = ?auto_245777 ?auto_245779 ) ) ( not ( = ?auto_245777 ?auto_245780 ) ) ( not ( = ?auto_245777 ?auto_245781 ) ) ( not ( = ?auto_245778 ?auto_245779 ) ) ( not ( = ?auto_245778 ?auto_245780 ) ) ( not ( = ?auto_245778 ?auto_245781 ) ) ( not ( = ?auto_245779 ?auto_245780 ) ) ( not ( = ?auto_245779 ?auto_245781 ) ) ( not ( = ?auto_245780 ?auto_245781 ) ) ( ON ?auto_245779 ?auto_245780 ) ( ON ?auto_245778 ?auto_245779 ) ( ON ?auto_245777 ?auto_245778 ) ( ON ?auto_245776 ?auto_245777 ) ( ON ?auto_245775 ?auto_245776 ) ( ON ?auto_245774 ?auto_245775 ) ( ON ?auto_245773 ?auto_245774 ) ( ON ?auto_245772 ?auto_245773 ) ( CLEAR ?auto_245770 ) ( ON ?auto_245771 ?auto_245772 ) ( CLEAR ?auto_245771 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_245770 ?auto_245771 )
      ( MAKE-11PILE ?auto_245770 ?auto_245771 ?auto_245772 ?auto_245773 ?auto_245774 ?auto_245775 ?auto_245776 ?auto_245777 ?auto_245778 ?auto_245779 ?auto_245780 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_245793 - BLOCK
      ?auto_245794 - BLOCK
      ?auto_245795 - BLOCK
      ?auto_245796 - BLOCK
      ?auto_245797 - BLOCK
      ?auto_245798 - BLOCK
      ?auto_245799 - BLOCK
      ?auto_245800 - BLOCK
      ?auto_245801 - BLOCK
      ?auto_245802 - BLOCK
      ?auto_245803 - BLOCK
    )
    :vars
    (
      ?auto_245804 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_245803 ?auto_245804 ) ( not ( = ?auto_245793 ?auto_245794 ) ) ( not ( = ?auto_245793 ?auto_245795 ) ) ( not ( = ?auto_245793 ?auto_245796 ) ) ( not ( = ?auto_245793 ?auto_245797 ) ) ( not ( = ?auto_245793 ?auto_245798 ) ) ( not ( = ?auto_245793 ?auto_245799 ) ) ( not ( = ?auto_245793 ?auto_245800 ) ) ( not ( = ?auto_245793 ?auto_245801 ) ) ( not ( = ?auto_245793 ?auto_245802 ) ) ( not ( = ?auto_245793 ?auto_245803 ) ) ( not ( = ?auto_245793 ?auto_245804 ) ) ( not ( = ?auto_245794 ?auto_245795 ) ) ( not ( = ?auto_245794 ?auto_245796 ) ) ( not ( = ?auto_245794 ?auto_245797 ) ) ( not ( = ?auto_245794 ?auto_245798 ) ) ( not ( = ?auto_245794 ?auto_245799 ) ) ( not ( = ?auto_245794 ?auto_245800 ) ) ( not ( = ?auto_245794 ?auto_245801 ) ) ( not ( = ?auto_245794 ?auto_245802 ) ) ( not ( = ?auto_245794 ?auto_245803 ) ) ( not ( = ?auto_245794 ?auto_245804 ) ) ( not ( = ?auto_245795 ?auto_245796 ) ) ( not ( = ?auto_245795 ?auto_245797 ) ) ( not ( = ?auto_245795 ?auto_245798 ) ) ( not ( = ?auto_245795 ?auto_245799 ) ) ( not ( = ?auto_245795 ?auto_245800 ) ) ( not ( = ?auto_245795 ?auto_245801 ) ) ( not ( = ?auto_245795 ?auto_245802 ) ) ( not ( = ?auto_245795 ?auto_245803 ) ) ( not ( = ?auto_245795 ?auto_245804 ) ) ( not ( = ?auto_245796 ?auto_245797 ) ) ( not ( = ?auto_245796 ?auto_245798 ) ) ( not ( = ?auto_245796 ?auto_245799 ) ) ( not ( = ?auto_245796 ?auto_245800 ) ) ( not ( = ?auto_245796 ?auto_245801 ) ) ( not ( = ?auto_245796 ?auto_245802 ) ) ( not ( = ?auto_245796 ?auto_245803 ) ) ( not ( = ?auto_245796 ?auto_245804 ) ) ( not ( = ?auto_245797 ?auto_245798 ) ) ( not ( = ?auto_245797 ?auto_245799 ) ) ( not ( = ?auto_245797 ?auto_245800 ) ) ( not ( = ?auto_245797 ?auto_245801 ) ) ( not ( = ?auto_245797 ?auto_245802 ) ) ( not ( = ?auto_245797 ?auto_245803 ) ) ( not ( = ?auto_245797 ?auto_245804 ) ) ( not ( = ?auto_245798 ?auto_245799 ) ) ( not ( = ?auto_245798 ?auto_245800 ) ) ( not ( = ?auto_245798 ?auto_245801 ) ) ( not ( = ?auto_245798 ?auto_245802 ) ) ( not ( = ?auto_245798 ?auto_245803 ) ) ( not ( = ?auto_245798 ?auto_245804 ) ) ( not ( = ?auto_245799 ?auto_245800 ) ) ( not ( = ?auto_245799 ?auto_245801 ) ) ( not ( = ?auto_245799 ?auto_245802 ) ) ( not ( = ?auto_245799 ?auto_245803 ) ) ( not ( = ?auto_245799 ?auto_245804 ) ) ( not ( = ?auto_245800 ?auto_245801 ) ) ( not ( = ?auto_245800 ?auto_245802 ) ) ( not ( = ?auto_245800 ?auto_245803 ) ) ( not ( = ?auto_245800 ?auto_245804 ) ) ( not ( = ?auto_245801 ?auto_245802 ) ) ( not ( = ?auto_245801 ?auto_245803 ) ) ( not ( = ?auto_245801 ?auto_245804 ) ) ( not ( = ?auto_245802 ?auto_245803 ) ) ( not ( = ?auto_245802 ?auto_245804 ) ) ( not ( = ?auto_245803 ?auto_245804 ) ) ( ON ?auto_245802 ?auto_245803 ) ( ON ?auto_245801 ?auto_245802 ) ( ON ?auto_245800 ?auto_245801 ) ( ON ?auto_245799 ?auto_245800 ) ( ON ?auto_245798 ?auto_245799 ) ( ON ?auto_245797 ?auto_245798 ) ( ON ?auto_245796 ?auto_245797 ) ( ON ?auto_245795 ?auto_245796 ) ( ON ?auto_245794 ?auto_245795 ) ( ON ?auto_245793 ?auto_245794 ) ( CLEAR ?auto_245793 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_245793 )
      ( MAKE-11PILE ?auto_245793 ?auto_245794 ?auto_245795 ?auto_245796 ?auto_245797 ?auto_245798 ?auto_245799 ?auto_245800 ?auto_245801 ?auto_245802 ?auto_245803 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_245816 - BLOCK
      ?auto_245817 - BLOCK
      ?auto_245818 - BLOCK
      ?auto_245819 - BLOCK
      ?auto_245820 - BLOCK
      ?auto_245821 - BLOCK
      ?auto_245822 - BLOCK
      ?auto_245823 - BLOCK
      ?auto_245824 - BLOCK
      ?auto_245825 - BLOCK
      ?auto_245826 - BLOCK
    )
    :vars
    (
      ?auto_245827 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_245826 ?auto_245827 ) ( not ( = ?auto_245816 ?auto_245817 ) ) ( not ( = ?auto_245816 ?auto_245818 ) ) ( not ( = ?auto_245816 ?auto_245819 ) ) ( not ( = ?auto_245816 ?auto_245820 ) ) ( not ( = ?auto_245816 ?auto_245821 ) ) ( not ( = ?auto_245816 ?auto_245822 ) ) ( not ( = ?auto_245816 ?auto_245823 ) ) ( not ( = ?auto_245816 ?auto_245824 ) ) ( not ( = ?auto_245816 ?auto_245825 ) ) ( not ( = ?auto_245816 ?auto_245826 ) ) ( not ( = ?auto_245816 ?auto_245827 ) ) ( not ( = ?auto_245817 ?auto_245818 ) ) ( not ( = ?auto_245817 ?auto_245819 ) ) ( not ( = ?auto_245817 ?auto_245820 ) ) ( not ( = ?auto_245817 ?auto_245821 ) ) ( not ( = ?auto_245817 ?auto_245822 ) ) ( not ( = ?auto_245817 ?auto_245823 ) ) ( not ( = ?auto_245817 ?auto_245824 ) ) ( not ( = ?auto_245817 ?auto_245825 ) ) ( not ( = ?auto_245817 ?auto_245826 ) ) ( not ( = ?auto_245817 ?auto_245827 ) ) ( not ( = ?auto_245818 ?auto_245819 ) ) ( not ( = ?auto_245818 ?auto_245820 ) ) ( not ( = ?auto_245818 ?auto_245821 ) ) ( not ( = ?auto_245818 ?auto_245822 ) ) ( not ( = ?auto_245818 ?auto_245823 ) ) ( not ( = ?auto_245818 ?auto_245824 ) ) ( not ( = ?auto_245818 ?auto_245825 ) ) ( not ( = ?auto_245818 ?auto_245826 ) ) ( not ( = ?auto_245818 ?auto_245827 ) ) ( not ( = ?auto_245819 ?auto_245820 ) ) ( not ( = ?auto_245819 ?auto_245821 ) ) ( not ( = ?auto_245819 ?auto_245822 ) ) ( not ( = ?auto_245819 ?auto_245823 ) ) ( not ( = ?auto_245819 ?auto_245824 ) ) ( not ( = ?auto_245819 ?auto_245825 ) ) ( not ( = ?auto_245819 ?auto_245826 ) ) ( not ( = ?auto_245819 ?auto_245827 ) ) ( not ( = ?auto_245820 ?auto_245821 ) ) ( not ( = ?auto_245820 ?auto_245822 ) ) ( not ( = ?auto_245820 ?auto_245823 ) ) ( not ( = ?auto_245820 ?auto_245824 ) ) ( not ( = ?auto_245820 ?auto_245825 ) ) ( not ( = ?auto_245820 ?auto_245826 ) ) ( not ( = ?auto_245820 ?auto_245827 ) ) ( not ( = ?auto_245821 ?auto_245822 ) ) ( not ( = ?auto_245821 ?auto_245823 ) ) ( not ( = ?auto_245821 ?auto_245824 ) ) ( not ( = ?auto_245821 ?auto_245825 ) ) ( not ( = ?auto_245821 ?auto_245826 ) ) ( not ( = ?auto_245821 ?auto_245827 ) ) ( not ( = ?auto_245822 ?auto_245823 ) ) ( not ( = ?auto_245822 ?auto_245824 ) ) ( not ( = ?auto_245822 ?auto_245825 ) ) ( not ( = ?auto_245822 ?auto_245826 ) ) ( not ( = ?auto_245822 ?auto_245827 ) ) ( not ( = ?auto_245823 ?auto_245824 ) ) ( not ( = ?auto_245823 ?auto_245825 ) ) ( not ( = ?auto_245823 ?auto_245826 ) ) ( not ( = ?auto_245823 ?auto_245827 ) ) ( not ( = ?auto_245824 ?auto_245825 ) ) ( not ( = ?auto_245824 ?auto_245826 ) ) ( not ( = ?auto_245824 ?auto_245827 ) ) ( not ( = ?auto_245825 ?auto_245826 ) ) ( not ( = ?auto_245825 ?auto_245827 ) ) ( not ( = ?auto_245826 ?auto_245827 ) ) ( ON ?auto_245825 ?auto_245826 ) ( ON ?auto_245824 ?auto_245825 ) ( ON ?auto_245823 ?auto_245824 ) ( ON ?auto_245822 ?auto_245823 ) ( ON ?auto_245821 ?auto_245822 ) ( ON ?auto_245820 ?auto_245821 ) ( ON ?auto_245819 ?auto_245820 ) ( ON ?auto_245818 ?auto_245819 ) ( ON ?auto_245817 ?auto_245818 ) ( ON ?auto_245816 ?auto_245817 ) ( CLEAR ?auto_245816 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_245816 )
      ( MAKE-11PILE ?auto_245816 ?auto_245817 ?auto_245818 ?auto_245819 ?auto_245820 ?auto_245821 ?auto_245822 ?auto_245823 ?auto_245824 ?auto_245825 ?auto_245826 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_245840 - BLOCK
      ?auto_245841 - BLOCK
      ?auto_245842 - BLOCK
      ?auto_245843 - BLOCK
      ?auto_245844 - BLOCK
      ?auto_245845 - BLOCK
      ?auto_245846 - BLOCK
      ?auto_245847 - BLOCK
      ?auto_245848 - BLOCK
      ?auto_245849 - BLOCK
      ?auto_245850 - BLOCK
      ?auto_245851 - BLOCK
    )
    :vars
    (
      ?auto_245852 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_245850 ) ( ON ?auto_245851 ?auto_245852 ) ( CLEAR ?auto_245851 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_245840 ) ( ON ?auto_245841 ?auto_245840 ) ( ON ?auto_245842 ?auto_245841 ) ( ON ?auto_245843 ?auto_245842 ) ( ON ?auto_245844 ?auto_245843 ) ( ON ?auto_245845 ?auto_245844 ) ( ON ?auto_245846 ?auto_245845 ) ( ON ?auto_245847 ?auto_245846 ) ( ON ?auto_245848 ?auto_245847 ) ( ON ?auto_245849 ?auto_245848 ) ( ON ?auto_245850 ?auto_245849 ) ( not ( = ?auto_245840 ?auto_245841 ) ) ( not ( = ?auto_245840 ?auto_245842 ) ) ( not ( = ?auto_245840 ?auto_245843 ) ) ( not ( = ?auto_245840 ?auto_245844 ) ) ( not ( = ?auto_245840 ?auto_245845 ) ) ( not ( = ?auto_245840 ?auto_245846 ) ) ( not ( = ?auto_245840 ?auto_245847 ) ) ( not ( = ?auto_245840 ?auto_245848 ) ) ( not ( = ?auto_245840 ?auto_245849 ) ) ( not ( = ?auto_245840 ?auto_245850 ) ) ( not ( = ?auto_245840 ?auto_245851 ) ) ( not ( = ?auto_245840 ?auto_245852 ) ) ( not ( = ?auto_245841 ?auto_245842 ) ) ( not ( = ?auto_245841 ?auto_245843 ) ) ( not ( = ?auto_245841 ?auto_245844 ) ) ( not ( = ?auto_245841 ?auto_245845 ) ) ( not ( = ?auto_245841 ?auto_245846 ) ) ( not ( = ?auto_245841 ?auto_245847 ) ) ( not ( = ?auto_245841 ?auto_245848 ) ) ( not ( = ?auto_245841 ?auto_245849 ) ) ( not ( = ?auto_245841 ?auto_245850 ) ) ( not ( = ?auto_245841 ?auto_245851 ) ) ( not ( = ?auto_245841 ?auto_245852 ) ) ( not ( = ?auto_245842 ?auto_245843 ) ) ( not ( = ?auto_245842 ?auto_245844 ) ) ( not ( = ?auto_245842 ?auto_245845 ) ) ( not ( = ?auto_245842 ?auto_245846 ) ) ( not ( = ?auto_245842 ?auto_245847 ) ) ( not ( = ?auto_245842 ?auto_245848 ) ) ( not ( = ?auto_245842 ?auto_245849 ) ) ( not ( = ?auto_245842 ?auto_245850 ) ) ( not ( = ?auto_245842 ?auto_245851 ) ) ( not ( = ?auto_245842 ?auto_245852 ) ) ( not ( = ?auto_245843 ?auto_245844 ) ) ( not ( = ?auto_245843 ?auto_245845 ) ) ( not ( = ?auto_245843 ?auto_245846 ) ) ( not ( = ?auto_245843 ?auto_245847 ) ) ( not ( = ?auto_245843 ?auto_245848 ) ) ( not ( = ?auto_245843 ?auto_245849 ) ) ( not ( = ?auto_245843 ?auto_245850 ) ) ( not ( = ?auto_245843 ?auto_245851 ) ) ( not ( = ?auto_245843 ?auto_245852 ) ) ( not ( = ?auto_245844 ?auto_245845 ) ) ( not ( = ?auto_245844 ?auto_245846 ) ) ( not ( = ?auto_245844 ?auto_245847 ) ) ( not ( = ?auto_245844 ?auto_245848 ) ) ( not ( = ?auto_245844 ?auto_245849 ) ) ( not ( = ?auto_245844 ?auto_245850 ) ) ( not ( = ?auto_245844 ?auto_245851 ) ) ( not ( = ?auto_245844 ?auto_245852 ) ) ( not ( = ?auto_245845 ?auto_245846 ) ) ( not ( = ?auto_245845 ?auto_245847 ) ) ( not ( = ?auto_245845 ?auto_245848 ) ) ( not ( = ?auto_245845 ?auto_245849 ) ) ( not ( = ?auto_245845 ?auto_245850 ) ) ( not ( = ?auto_245845 ?auto_245851 ) ) ( not ( = ?auto_245845 ?auto_245852 ) ) ( not ( = ?auto_245846 ?auto_245847 ) ) ( not ( = ?auto_245846 ?auto_245848 ) ) ( not ( = ?auto_245846 ?auto_245849 ) ) ( not ( = ?auto_245846 ?auto_245850 ) ) ( not ( = ?auto_245846 ?auto_245851 ) ) ( not ( = ?auto_245846 ?auto_245852 ) ) ( not ( = ?auto_245847 ?auto_245848 ) ) ( not ( = ?auto_245847 ?auto_245849 ) ) ( not ( = ?auto_245847 ?auto_245850 ) ) ( not ( = ?auto_245847 ?auto_245851 ) ) ( not ( = ?auto_245847 ?auto_245852 ) ) ( not ( = ?auto_245848 ?auto_245849 ) ) ( not ( = ?auto_245848 ?auto_245850 ) ) ( not ( = ?auto_245848 ?auto_245851 ) ) ( not ( = ?auto_245848 ?auto_245852 ) ) ( not ( = ?auto_245849 ?auto_245850 ) ) ( not ( = ?auto_245849 ?auto_245851 ) ) ( not ( = ?auto_245849 ?auto_245852 ) ) ( not ( = ?auto_245850 ?auto_245851 ) ) ( not ( = ?auto_245850 ?auto_245852 ) ) ( not ( = ?auto_245851 ?auto_245852 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_245851 ?auto_245852 )
      ( !STACK ?auto_245851 ?auto_245850 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_245865 - BLOCK
      ?auto_245866 - BLOCK
      ?auto_245867 - BLOCK
      ?auto_245868 - BLOCK
      ?auto_245869 - BLOCK
      ?auto_245870 - BLOCK
      ?auto_245871 - BLOCK
      ?auto_245872 - BLOCK
      ?auto_245873 - BLOCK
      ?auto_245874 - BLOCK
      ?auto_245875 - BLOCK
      ?auto_245876 - BLOCK
    )
    :vars
    (
      ?auto_245877 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_245875 ) ( ON ?auto_245876 ?auto_245877 ) ( CLEAR ?auto_245876 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_245865 ) ( ON ?auto_245866 ?auto_245865 ) ( ON ?auto_245867 ?auto_245866 ) ( ON ?auto_245868 ?auto_245867 ) ( ON ?auto_245869 ?auto_245868 ) ( ON ?auto_245870 ?auto_245869 ) ( ON ?auto_245871 ?auto_245870 ) ( ON ?auto_245872 ?auto_245871 ) ( ON ?auto_245873 ?auto_245872 ) ( ON ?auto_245874 ?auto_245873 ) ( ON ?auto_245875 ?auto_245874 ) ( not ( = ?auto_245865 ?auto_245866 ) ) ( not ( = ?auto_245865 ?auto_245867 ) ) ( not ( = ?auto_245865 ?auto_245868 ) ) ( not ( = ?auto_245865 ?auto_245869 ) ) ( not ( = ?auto_245865 ?auto_245870 ) ) ( not ( = ?auto_245865 ?auto_245871 ) ) ( not ( = ?auto_245865 ?auto_245872 ) ) ( not ( = ?auto_245865 ?auto_245873 ) ) ( not ( = ?auto_245865 ?auto_245874 ) ) ( not ( = ?auto_245865 ?auto_245875 ) ) ( not ( = ?auto_245865 ?auto_245876 ) ) ( not ( = ?auto_245865 ?auto_245877 ) ) ( not ( = ?auto_245866 ?auto_245867 ) ) ( not ( = ?auto_245866 ?auto_245868 ) ) ( not ( = ?auto_245866 ?auto_245869 ) ) ( not ( = ?auto_245866 ?auto_245870 ) ) ( not ( = ?auto_245866 ?auto_245871 ) ) ( not ( = ?auto_245866 ?auto_245872 ) ) ( not ( = ?auto_245866 ?auto_245873 ) ) ( not ( = ?auto_245866 ?auto_245874 ) ) ( not ( = ?auto_245866 ?auto_245875 ) ) ( not ( = ?auto_245866 ?auto_245876 ) ) ( not ( = ?auto_245866 ?auto_245877 ) ) ( not ( = ?auto_245867 ?auto_245868 ) ) ( not ( = ?auto_245867 ?auto_245869 ) ) ( not ( = ?auto_245867 ?auto_245870 ) ) ( not ( = ?auto_245867 ?auto_245871 ) ) ( not ( = ?auto_245867 ?auto_245872 ) ) ( not ( = ?auto_245867 ?auto_245873 ) ) ( not ( = ?auto_245867 ?auto_245874 ) ) ( not ( = ?auto_245867 ?auto_245875 ) ) ( not ( = ?auto_245867 ?auto_245876 ) ) ( not ( = ?auto_245867 ?auto_245877 ) ) ( not ( = ?auto_245868 ?auto_245869 ) ) ( not ( = ?auto_245868 ?auto_245870 ) ) ( not ( = ?auto_245868 ?auto_245871 ) ) ( not ( = ?auto_245868 ?auto_245872 ) ) ( not ( = ?auto_245868 ?auto_245873 ) ) ( not ( = ?auto_245868 ?auto_245874 ) ) ( not ( = ?auto_245868 ?auto_245875 ) ) ( not ( = ?auto_245868 ?auto_245876 ) ) ( not ( = ?auto_245868 ?auto_245877 ) ) ( not ( = ?auto_245869 ?auto_245870 ) ) ( not ( = ?auto_245869 ?auto_245871 ) ) ( not ( = ?auto_245869 ?auto_245872 ) ) ( not ( = ?auto_245869 ?auto_245873 ) ) ( not ( = ?auto_245869 ?auto_245874 ) ) ( not ( = ?auto_245869 ?auto_245875 ) ) ( not ( = ?auto_245869 ?auto_245876 ) ) ( not ( = ?auto_245869 ?auto_245877 ) ) ( not ( = ?auto_245870 ?auto_245871 ) ) ( not ( = ?auto_245870 ?auto_245872 ) ) ( not ( = ?auto_245870 ?auto_245873 ) ) ( not ( = ?auto_245870 ?auto_245874 ) ) ( not ( = ?auto_245870 ?auto_245875 ) ) ( not ( = ?auto_245870 ?auto_245876 ) ) ( not ( = ?auto_245870 ?auto_245877 ) ) ( not ( = ?auto_245871 ?auto_245872 ) ) ( not ( = ?auto_245871 ?auto_245873 ) ) ( not ( = ?auto_245871 ?auto_245874 ) ) ( not ( = ?auto_245871 ?auto_245875 ) ) ( not ( = ?auto_245871 ?auto_245876 ) ) ( not ( = ?auto_245871 ?auto_245877 ) ) ( not ( = ?auto_245872 ?auto_245873 ) ) ( not ( = ?auto_245872 ?auto_245874 ) ) ( not ( = ?auto_245872 ?auto_245875 ) ) ( not ( = ?auto_245872 ?auto_245876 ) ) ( not ( = ?auto_245872 ?auto_245877 ) ) ( not ( = ?auto_245873 ?auto_245874 ) ) ( not ( = ?auto_245873 ?auto_245875 ) ) ( not ( = ?auto_245873 ?auto_245876 ) ) ( not ( = ?auto_245873 ?auto_245877 ) ) ( not ( = ?auto_245874 ?auto_245875 ) ) ( not ( = ?auto_245874 ?auto_245876 ) ) ( not ( = ?auto_245874 ?auto_245877 ) ) ( not ( = ?auto_245875 ?auto_245876 ) ) ( not ( = ?auto_245875 ?auto_245877 ) ) ( not ( = ?auto_245876 ?auto_245877 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_245876 ?auto_245877 )
      ( !STACK ?auto_245876 ?auto_245875 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_245890 - BLOCK
      ?auto_245891 - BLOCK
      ?auto_245892 - BLOCK
      ?auto_245893 - BLOCK
      ?auto_245894 - BLOCK
      ?auto_245895 - BLOCK
      ?auto_245896 - BLOCK
      ?auto_245897 - BLOCK
      ?auto_245898 - BLOCK
      ?auto_245899 - BLOCK
      ?auto_245900 - BLOCK
      ?auto_245901 - BLOCK
    )
    :vars
    (
      ?auto_245902 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_245901 ?auto_245902 ) ( ON-TABLE ?auto_245890 ) ( ON ?auto_245891 ?auto_245890 ) ( ON ?auto_245892 ?auto_245891 ) ( ON ?auto_245893 ?auto_245892 ) ( ON ?auto_245894 ?auto_245893 ) ( ON ?auto_245895 ?auto_245894 ) ( ON ?auto_245896 ?auto_245895 ) ( ON ?auto_245897 ?auto_245896 ) ( ON ?auto_245898 ?auto_245897 ) ( ON ?auto_245899 ?auto_245898 ) ( not ( = ?auto_245890 ?auto_245891 ) ) ( not ( = ?auto_245890 ?auto_245892 ) ) ( not ( = ?auto_245890 ?auto_245893 ) ) ( not ( = ?auto_245890 ?auto_245894 ) ) ( not ( = ?auto_245890 ?auto_245895 ) ) ( not ( = ?auto_245890 ?auto_245896 ) ) ( not ( = ?auto_245890 ?auto_245897 ) ) ( not ( = ?auto_245890 ?auto_245898 ) ) ( not ( = ?auto_245890 ?auto_245899 ) ) ( not ( = ?auto_245890 ?auto_245900 ) ) ( not ( = ?auto_245890 ?auto_245901 ) ) ( not ( = ?auto_245890 ?auto_245902 ) ) ( not ( = ?auto_245891 ?auto_245892 ) ) ( not ( = ?auto_245891 ?auto_245893 ) ) ( not ( = ?auto_245891 ?auto_245894 ) ) ( not ( = ?auto_245891 ?auto_245895 ) ) ( not ( = ?auto_245891 ?auto_245896 ) ) ( not ( = ?auto_245891 ?auto_245897 ) ) ( not ( = ?auto_245891 ?auto_245898 ) ) ( not ( = ?auto_245891 ?auto_245899 ) ) ( not ( = ?auto_245891 ?auto_245900 ) ) ( not ( = ?auto_245891 ?auto_245901 ) ) ( not ( = ?auto_245891 ?auto_245902 ) ) ( not ( = ?auto_245892 ?auto_245893 ) ) ( not ( = ?auto_245892 ?auto_245894 ) ) ( not ( = ?auto_245892 ?auto_245895 ) ) ( not ( = ?auto_245892 ?auto_245896 ) ) ( not ( = ?auto_245892 ?auto_245897 ) ) ( not ( = ?auto_245892 ?auto_245898 ) ) ( not ( = ?auto_245892 ?auto_245899 ) ) ( not ( = ?auto_245892 ?auto_245900 ) ) ( not ( = ?auto_245892 ?auto_245901 ) ) ( not ( = ?auto_245892 ?auto_245902 ) ) ( not ( = ?auto_245893 ?auto_245894 ) ) ( not ( = ?auto_245893 ?auto_245895 ) ) ( not ( = ?auto_245893 ?auto_245896 ) ) ( not ( = ?auto_245893 ?auto_245897 ) ) ( not ( = ?auto_245893 ?auto_245898 ) ) ( not ( = ?auto_245893 ?auto_245899 ) ) ( not ( = ?auto_245893 ?auto_245900 ) ) ( not ( = ?auto_245893 ?auto_245901 ) ) ( not ( = ?auto_245893 ?auto_245902 ) ) ( not ( = ?auto_245894 ?auto_245895 ) ) ( not ( = ?auto_245894 ?auto_245896 ) ) ( not ( = ?auto_245894 ?auto_245897 ) ) ( not ( = ?auto_245894 ?auto_245898 ) ) ( not ( = ?auto_245894 ?auto_245899 ) ) ( not ( = ?auto_245894 ?auto_245900 ) ) ( not ( = ?auto_245894 ?auto_245901 ) ) ( not ( = ?auto_245894 ?auto_245902 ) ) ( not ( = ?auto_245895 ?auto_245896 ) ) ( not ( = ?auto_245895 ?auto_245897 ) ) ( not ( = ?auto_245895 ?auto_245898 ) ) ( not ( = ?auto_245895 ?auto_245899 ) ) ( not ( = ?auto_245895 ?auto_245900 ) ) ( not ( = ?auto_245895 ?auto_245901 ) ) ( not ( = ?auto_245895 ?auto_245902 ) ) ( not ( = ?auto_245896 ?auto_245897 ) ) ( not ( = ?auto_245896 ?auto_245898 ) ) ( not ( = ?auto_245896 ?auto_245899 ) ) ( not ( = ?auto_245896 ?auto_245900 ) ) ( not ( = ?auto_245896 ?auto_245901 ) ) ( not ( = ?auto_245896 ?auto_245902 ) ) ( not ( = ?auto_245897 ?auto_245898 ) ) ( not ( = ?auto_245897 ?auto_245899 ) ) ( not ( = ?auto_245897 ?auto_245900 ) ) ( not ( = ?auto_245897 ?auto_245901 ) ) ( not ( = ?auto_245897 ?auto_245902 ) ) ( not ( = ?auto_245898 ?auto_245899 ) ) ( not ( = ?auto_245898 ?auto_245900 ) ) ( not ( = ?auto_245898 ?auto_245901 ) ) ( not ( = ?auto_245898 ?auto_245902 ) ) ( not ( = ?auto_245899 ?auto_245900 ) ) ( not ( = ?auto_245899 ?auto_245901 ) ) ( not ( = ?auto_245899 ?auto_245902 ) ) ( not ( = ?auto_245900 ?auto_245901 ) ) ( not ( = ?auto_245900 ?auto_245902 ) ) ( not ( = ?auto_245901 ?auto_245902 ) ) ( CLEAR ?auto_245899 ) ( ON ?auto_245900 ?auto_245901 ) ( CLEAR ?auto_245900 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_245890 ?auto_245891 ?auto_245892 ?auto_245893 ?auto_245894 ?auto_245895 ?auto_245896 ?auto_245897 ?auto_245898 ?auto_245899 ?auto_245900 )
      ( MAKE-12PILE ?auto_245890 ?auto_245891 ?auto_245892 ?auto_245893 ?auto_245894 ?auto_245895 ?auto_245896 ?auto_245897 ?auto_245898 ?auto_245899 ?auto_245900 ?auto_245901 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_245915 - BLOCK
      ?auto_245916 - BLOCK
      ?auto_245917 - BLOCK
      ?auto_245918 - BLOCK
      ?auto_245919 - BLOCK
      ?auto_245920 - BLOCK
      ?auto_245921 - BLOCK
      ?auto_245922 - BLOCK
      ?auto_245923 - BLOCK
      ?auto_245924 - BLOCK
      ?auto_245925 - BLOCK
      ?auto_245926 - BLOCK
    )
    :vars
    (
      ?auto_245927 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_245926 ?auto_245927 ) ( ON-TABLE ?auto_245915 ) ( ON ?auto_245916 ?auto_245915 ) ( ON ?auto_245917 ?auto_245916 ) ( ON ?auto_245918 ?auto_245917 ) ( ON ?auto_245919 ?auto_245918 ) ( ON ?auto_245920 ?auto_245919 ) ( ON ?auto_245921 ?auto_245920 ) ( ON ?auto_245922 ?auto_245921 ) ( ON ?auto_245923 ?auto_245922 ) ( ON ?auto_245924 ?auto_245923 ) ( not ( = ?auto_245915 ?auto_245916 ) ) ( not ( = ?auto_245915 ?auto_245917 ) ) ( not ( = ?auto_245915 ?auto_245918 ) ) ( not ( = ?auto_245915 ?auto_245919 ) ) ( not ( = ?auto_245915 ?auto_245920 ) ) ( not ( = ?auto_245915 ?auto_245921 ) ) ( not ( = ?auto_245915 ?auto_245922 ) ) ( not ( = ?auto_245915 ?auto_245923 ) ) ( not ( = ?auto_245915 ?auto_245924 ) ) ( not ( = ?auto_245915 ?auto_245925 ) ) ( not ( = ?auto_245915 ?auto_245926 ) ) ( not ( = ?auto_245915 ?auto_245927 ) ) ( not ( = ?auto_245916 ?auto_245917 ) ) ( not ( = ?auto_245916 ?auto_245918 ) ) ( not ( = ?auto_245916 ?auto_245919 ) ) ( not ( = ?auto_245916 ?auto_245920 ) ) ( not ( = ?auto_245916 ?auto_245921 ) ) ( not ( = ?auto_245916 ?auto_245922 ) ) ( not ( = ?auto_245916 ?auto_245923 ) ) ( not ( = ?auto_245916 ?auto_245924 ) ) ( not ( = ?auto_245916 ?auto_245925 ) ) ( not ( = ?auto_245916 ?auto_245926 ) ) ( not ( = ?auto_245916 ?auto_245927 ) ) ( not ( = ?auto_245917 ?auto_245918 ) ) ( not ( = ?auto_245917 ?auto_245919 ) ) ( not ( = ?auto_245917 ?auto_245920 ) ) ( not ( = ?auto_245917 ?auto_245921 ) ) ( not ( = ?auto_245917 ?auto_245922 ) ) ( not ( = ?auto_245917 ?auto_245923 ) ) ( not ( = ?auto_245917 ?auto_245924 ) ) ( not ( = ?auto_245917 ?auto_245925 ) ) ( not ( = ?auto_245917 ?auto_245926 ) ) ( not ( = ?auto_245917 ?auto_245927 ) ) ( not ( = ?auto_245918 ?auto_245919 ) ) ( not ( = ?auto_245918 ?auto_245920 ) ) ( not ( = ?auto_245918 ?auto_245921 ) ) ( not ( = ?auto_245918 ?auto_245922 ) ) ( not ( = ?auto_245918 ?auto_245923 ) ) ( not ( = ?auto_245918 ?auto_245924 ) ) ( not ( = ?auto_245918 ?auto_245925 ) ) ( not ( = ?auto_245918 ?auto_245926 ) ) ( not ( = ?auto_245918 ?auto_245927 ) ) ( not ( = ?auto_245919 ?auto_245920 ) ) ( not ( = ?auto_245919 ?auto_245921 ) ) ( not ( = ?auto_245919 ?auto_245922 ) ) ( not ( = ?auto_245919 ?auto_245923 ) ) ( not ( = ?auto_245919 ?auto_245924 ) ) ( not ( = ?auto_245919 ?auto_245925 ) ) ( not ( = ?auto_245919 ?auto_245926 ) ) ( not ( = ?auto_245919 ?auto_245927 ) ) ( not ( = ?auto_245920 ?auto_245921 ) ) ( not ( = ?auto_245920 ?auto_245922 ) ) ( not ( = ?auto_245920 ?auto_245923 ) ) ( not ( = ?auto_245920 ?auto_245924 ) ) ( not ( = ?auto_245920 ?auto_245925 ) ) ( not ( = ?auto_245920 ?auto_245926 ) ) ( not ( = ?auto_245920 ?auto_245927 ) ) ( not ( = ?auto_245921 ?auto_245922 ) ) ( not ( = ?auto_245921 ?auto_245923 ) ) ( not ( = ?auto_245921 ?auto_245924 ) ) ( not ( = ?auto_245921 ?auto_245925 ) ) ( not ( = ?auto_245921 ?auto_245926 ) ) ( not ( = ?auto_245921 ?auto_245927 ) ) ( not ( = ?auto_245922 ?auto_245923 ) ) ( not ( = ?auto_245922 ?auto_245924 ) ) ( not ( = ?auto_245922 ?auto_245925 ) ) ( not ( = ?auto_245922 ?auto_245926 ) ) ( not ( = ?auto_245922 ?auto_245927 ) ) ( not ( = ?auto_245923 ?auto_245924 ) ) ( not ( = ?auto_245923 ?auto_245925 ) ) ( not ( = ?auto_245923 ?auto_245926 ) ) ( not ( = ?auto_245923 ?auto_245927 ) ) ( not ( = ?auto_245924 ?auto_245925 ) ) ( not ( = ?auto_245924 ?auto_245926 ) ) ( not ( = ?auto_245924 ?auto_245927 ) ) ( not ( = ?auto_245925 ?auto_245926 ) ) ( not ( = ?auto_245925 ?auto_245927 ) ) ( not ( = ?auto_245926 ?auto_245927 ) ) ( CLEAR ?auto_245924 ) ( ON ?auto_245925 ?auto_245926 ) ( CLEAR ?auto_245925 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_245915 ?auto_245916 ?auto_245917 ?auto_245918 ?auto_245919 ?auto_245920 ?auto_245921 ?auto_245922 ?auto_245923 ?auto_245924 ?auto_245925 )
      ( MAKE-12PILE ?auto_245915 ?auto_245916 ?auto_245917 ?auto_245918 ?auto_245919 ?auto_245920 ?auto_245921 ?auto_245922 ?auto_245923 ?auto_245924 ?auto_245925 ?auto_245926 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_245940 - BLOCK
      ?auto_245941 - BLOCK
      ?auto_245942 - BLOCK
      ?auto_245943 - BLOCK
      ?auto_245944 - BLOCK
      ?auto_245945 - BLOCK
      ?auto_245946 - BLOCK
      ?auto_245947 - BLOCK
      ?auto_245948 - BLOCK
      ?auto_245949 - BLOCK
      ?auto_245950 - BLOCK
      ?auto_245951 - BLOCK
    )
    :vars
    (
      ?auto_245952 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_245951 ?auto_245952 ) ( ON-TABLE ?auto_245940 ) ( ON ?auto_245941 ?auto_245940 ) ( ON ?auto_245942 ?auto_245941 ) ( ON ?auto_245943 ?auto_245942 ) ( ON ?auto_245944 ?auto_245943 ) ( ON ?auto_245945 ?auto_245944 ) ( ON ?auto_245946 ?auto_245945 ) ( ON ?auto_245947 ?auto_245946 ) ( ON ?auto_245948 ?auto_245947 ) ( not ( = ?auto_245940 ?auto_245941 ) ) ( not ( = ?auto_245940 ?auto_245942 ) ) ( not ( = ?auto_245940 ?auto_245943 ) ) ( not ( = ?auto_245940 ?auto_245944 ) ) ( not ( = ?auto_245940 ?auto_245945 ) ) ( not ( = ?auto_245940 ?auto_245946 ) ) ( not ( = ?auto_245940 ?auto_245947 ) ) ( not ( = ?auto_245940 ?auto_245948 ) ) ( not ( = ?auto_245940 ?auto_245949 ) ) ( not ( = ?auto_245940 ?auto_245950 ) ) ( not ( = ?auto_245940 ?auto_245951 ) ) ( not ( = ?auto_245940 ?auto_245952 ) ) ( not ( = ?auto_245941 ?auto_245942 ) ) ( not ( = ?auto_245941 ?auto_245943 ) ) ( not ( = ?auto_245941 ?auto_245944 ) ) ( not ( = ?auto_245941 ?auto_245945 ) ) ( not ( = ?auto_245941 ?auto_245946 ) ) ( not ( = ?auto_245941 ?auto_245947 ) ) ( not ( = ?auto_245941 ?auto_245948 ) ) ( not ( = ?auto_245941 ?auto_245949 ) ) ( not ( = ?auto_245941 ?auto_245950 ) ) ( not ( = ?auto_245941 ?auto_245951 ) ) ( not ( = ?auto_245941 ?auto_245952 ) ) ( not ( = ?auto_245942 ?auto_245943 ) ) ( not ( = ?auto_245942 ?auto_245944 ) ) ( not ( = ?auto_245942 ?auto_245945 ) ) ( not ( = ?auto_245942 ?auto_245946 ) ) ( not ( = ?auto_245942 ?auto_245947 ) ) ( not ( = ?auto_245942 ?auto_245948 ) ) ( not ( = ?auto_245942 ?auto_245949 ) ) ( not ( = ?auto_245942 ?auto_245950 ) ) ( not ( = ?auto_245942 ?auto_245951 ) ) ( not ( = ?auto_245942 ?auto_245952 ) ) ( not ( = ?auto_245943 ?auto_245944 ) ) ( not ( = ?auto_245943 ?auto_245945 ) ) ( not ( = ?auto_245943 ?auto_245946 ) ) ( not ( = ?auto_245943 ?auto_245947 ) ) ( not ( = ?auto_245943 ?auto_245948 ) ) ( not ( = ?auto_245943 ?auto_245949 ) ) ( not ( = ?auto_245943 ?auto_245950 ) ) ( not ( = ?auto_245943 ?auto_245951 ) ) ( not ( = ?auto_245943 ?auto_245952 ) ) ( not ( = ?auto_245944 ?auto_245945 ) ) ( not ( = ?auto_245944 ?auto_245946 ) ) ( not ( = ?auto_245944 ?auto_245947 ) ) ( not ( = ?auto_245944 ?auto_245948 ) ) ( not ( = ?auto_245944 ?auto_245949 ) ) ( not ( = ?auto_245944 ?auto_245950 ) ) ( not ( = ?auto_245944 ?auto_245951 ) ) ( not ( = ?auto_245944 ?auto_245952 ) ) ( not ( = ?auto_245945 ?auto_245946 ) ) ( not ( = ?auto_245945 ?auto_245947 ) ) ( not ( = ?auto_245945 ?auto_245948 ) ) ( not ( = ?auto_245945 ?auto_245949 ) ) ( not ( = ?auto_245945 ?auto_245950 ) ) ( not ( = ?auto_245945 ?auto_245951 ) ) ( not ( = ?auto_245945 ?auto_245952 ) ) ( not ( = ?auto_245946 ?auto_245947 ) ) ( not ( = ?auto_245946 ?auto_245948 ) ) ( not ( = ?auto_245946 ?auto_245949 ) ) ( not ( = ?auto_245946 ?auto_245950 ) ) ( not ( = ?auto_245946 ?auto_245951 ) ) ( not ( = ?auto_245946 ?auto_245952 ) ) ( not ( = ?auto_245947 ?auto_245948 ) ) ( not ( = ?auto_245947 ?auto_245949 ) ) ( not ( = ?auto_245947 ?auto_245950 ) ) ( not ( = ?auto_245947 ?auto_245951 ) ) ( not ( = ?auto_245947 ?auto_245952 ) ) ( not ( = ?auto_245948 ?auto_245949 ) ) ( not ( = ?auto_245948 ?auto_245950 ) ) ( not ( = ?auto_245948 ?auto_245951 ) ) ( not ( = ?auto_245948 ?auto_245952 ) ) ( not ( = ?auto_245949 ?auto_245950 ) ) ( not ( = ?auto_245949 ?auto_245951 ) ) ( not ( = ?auto_245949 ?auto_245952 ) ) ( not ( = ?auto_245950 ?auto_245951 ) ) ( not ( = ?auto_245950 ?auto_245952 ) ) ( not ( = ?auto_245951 ?auto_245952 ) ) ( ON ?auto_245950 ?auto_245951 ) ( CLEAR ?auto_245948 ) ( ON ?auto_245949 ?auto_245950 ) ( CLEAR ?auto_245949 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_245940 ?auto_245941 ?auto_245942 ?auto_245943 ?auto_245944 ?auto_245945 ?auto_245946 ?auto_245947 ?auto_245948 ?auto_245949 )
      ( MAKE-12PILE ?auto_245940 ?auto_245941 ?auto_245942 ?auto_245943 ?auto_245944 ?auto_245945 ?auto_245946 ?auto_245947 ?auto_245948 ?auto_245949 ?auto_245950 ?auto_245951 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_245965 - BLOCK
      ?auto_245966 - BLOCK
      ?auto_245967 - BLOCK
      ?auto_245968 - BLOCK
      ?auto_245969 - BLOCK
      ?auto_245970 - BLOCK
      ?auto_245971 - BLOCK
      ?auto_245972 - BLOCK
      ?auto_245973 - BLOCK
      ?auto_245974 - BLOCK
      ?auto_245975 - BLOCK
      ?auto_245976 - BLOCK
    )
    :vars
    (
      ?auto_245977 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_245976 ?auto_245977 ) ( ON-TABLE ?auto_245965 ) ( ON ?auto_245966 ?auto_245965 ) ( ON ?auto_245967 ?auto_245966 ) ( ON ?auto_245968 ?auto_245967 ) ( ON ?auto_245969 ?auto_245968 ) ( ON ?auto_245970 ?auto_245969 ) ( ON ?auto_245971 ?auto_245970 ) ( ON ?auto_245972 ?auto_245971 ) ( ON ?auto_245973 ?auto_245972 ) ( not ( = ?auto_245965 ?auto_245966 ) ) ( not ( = ?auto_245965 ?auto_245967 ) ) ( not ( = ?auto_245965 ?auto_245968 ) ) ( not ( = ?auto_245965 ?auto_245969 ) ) ( not ( = ?auto_245965 ?auto_245970 ) ) ( not ( = ?auto_245965 ?auto_245971 ) ) ( not ( = ?auto_245965 ?auto_245972 ) ) ( not ( = ?auto_245965 ?auto_245973 ) ) ( not ( = ?auto_245965 ?auto_245974 ) ) ( not ( = ?auto_245965 ?auto_245975 ) ) ( not ( = ?auto_245965 ?auto_245976 ) ) ( not ( = ?auto_245965 ?auto_245977 ) ) ( not ( = ?auto_245966 ?auto_245967 ) ) ( not ( = ?auto_245966 ?auto_245968 ) ) ( not ( = ?auto_245966 ?auto_245969 ) ) ( not ( = ?auto_245966 ?auto_245970 ) ) ( not ( = ?auto_245966 ?auto_245971 ) ) ( not ( = ?auto_245966 ?auto_245972 ) ) ( not ( = ?auto_245966 ?auto_245973 ) ) ( not ( = ?auto_245966 ?auto_245974 ) ) ( not ( = ?auto_245966 ?auto_245975 ) ) ( not ( = ?auto_245966 ?auto_245976 ) ) ( not ( = ?auto_245966 ?auto_245977 ) ) ( not ( = ?auto_245967 ?auto_245968 ) ) ( not ( = ?auto_245967 ?auto_245969 ) ) ( not ( = ?auto_245967 ?auto_245970 ) ) ( not ( = ?auto_245967 ?auto_245971 ) ) ( not ( = ?auto_245967 ?auto_245972 ) ) ( not ( = ?auto_245967 ?auto_245973 ) ) ( not ( = ?auto_245967 ?auto_245974 ) ) ( not ( = ?auto_245967 ?auto_245975 ) ) ( not ( = ?auto_245967 ?auto_245976 ) ) ( not ( = ?auto_245967 ?auto_245977 ) ) ( not ( = ?auto_245968 ?auto_245969 ) ) ( not ( = ?auto_245968 ?auto_245970 ) ) ( not ( = ?auto_245968 ?auto_245971 ) ) ( not ( = ?auto_245968 ?auto_245972 ) ) ( not ( = ?auto_245968 ?auto_245973 ) ) ( not ( = ?auto_245968 ?auto_245974 ) ) ( not ( = ?auto_245968 ?auto_245975 ) ) ( not ( = ?auto_245968 ?auto_245976 ) ) ( not ( = ?auto_245968 ?auto_245977 ) ) ( not ( = ?auto_245969 ?auto_245970 ) ) ( not ( = ?auto_245969 ?auto_245971 ) ) ( not ( = ?auto_245969 ?auto_245972 ) ) ( not ( = ?auto_245969 ?auto_245973 ) ) ( not ( = ?auto_245969 ?auto_245974 ) ) ( not ( = ?auto_245969 ?auto_245975 ) ) ( not ( = ?auto_245969 ?auto_245976 ) ) ( not ( = ?auto_245969 ?auto_245977 ) ) ( not ( = ?auto_245970 ?auto_245971 ) ) ( not ( = ?auto_245970 ?auto_245972 ) ) ( not ( = ?auto_245970 ?auto_245973 ) ) ( not ( = ?auto_245970 ?auto_245974 ) ) ( not ( = ?auto_245970 ?auto_245975 ) ) ( not ( = ?auto_245970 ?auto_245976 ) ) ( not ( = ?auto_245970 ?auto_245977 ) ) ( not ( = ?auto_245971 ?auto_245972 ) ) ( not ( = ?auto_245971 ?auto_245973 ) ) ( not ( = ?auto_245971 ?auto_245974 ) ) ( not ( = ?auto_245971 ?auto_245975 ) ) ( not ( = ?auto_245971 ?auto_245976 ) ) ( not ( = ?auto_245971 ?auto_245977 ) ) ( not ( = ?auto_245972 ?auto_245973 ) ) ( not ( = ?auto_245972 ?auto_245974 ) ) ( not ( = ?auto_245972 ?auto_245975 ) ) ( not ( = ?auto_245972 ?auto_245976 ) ) ( not ( = ?auto_245972 ?auto_245977 ) ) ( not ( = ?auto_245973 ?auto_245974 ) ) ( not ( = ?auto_245973 ?auto_245975 ) ) ( not ( = ?auto_245973 ?auto_245976 ) ) ( not ( = ?auto_245973 ?auto_245977 ) ) ( not ( = ?auto_245974 ?auto_245975 ) ) ( not ( = ?auto_245974 ?auto_245976 ) ) ( not ( = ?auto_245974 ?auto_245977 ) ) ( not ( = ?auto_245975 ?auto_245976 ) ) ( not ( = ?auto_245975 ?auto_245977 ) ) ( not ( = ?auto_245976 ?auto_245977 ) ) ( ON ?auto_245975 ?auto_245976 ) ( CLEAR ?auto_245973 ) ( ON ?auto_245974 ?auto_245975 ) ( CLEAR ?auto_245974 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_245965 ?auto_245966 ?auto_245967 ?auto_245968 ?auto_245969 ?auto_245970 ?auto_245971 ?auto_245972 ?auto_245973 ?auto_245974 )
      ( MAKE-12PILE ?auto_245965 ?auto_245966 ?auto_245967 ?auto_245968 ?auto_245969 ?auto_245970 ?auto_245971 ?auto_245972 ?auto_245973 ?auto_245974 ?auto_245975 ?auto_245976 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_245990 - BLOCK
      ?auto_245991 - BLOCK
      ?auto_245992 - BLOCK
      ?auto_245993 - BLOCK
      ?auto_245994 - BLOCK
      ?auto_245995 - BLOCK
      ?auto_245996 - BLOCK
      ?auto_245997 - BLOCK
      ?auto_245998 - BLOCK
      ?auto_245999 - BLOCK
      ?auto_246000 - BLOCK
      ?auto_246001 - BLOCK
    )
    :vars
    (
      ?auto_246002 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_246001 ?auto_246002 ) ( ON-TABLE ?auto_245990 ) ( ON ?auto_245991 ?auto_245990 ) ( ON ?auto_245992 ?auto_245991 ) ( ON ?auto_245993 ?auto_245992 ) ( ON ?auto_245994 ?auto_245993 ) ( ON ?auto_245995 ?auto_245994 ) ( ON ?auto_245996 ?auto_245995 ) ( ON ?auto_245997 ?auto_245996 ) ( not ( = ?auto_245990 ?auto_245991 ) ) ( not ( = ?auto_245990 ?auto_245992 ) ) ( not ( = ?auto_245990 ?auto_245993 ) ) ( not ( = ?auto_245990 ?auto_245994 ) ) ( not ( = ?auto_245990 ?auto_245995 ) ) ( not ( = ?auto_245990 ?auto_245996 ) ) ( not ( = ?auto_245990 ?auto_245997 ) ) ( not ( = ?auto_245990 ?auto_245998 ) ) ( not ( = ?auto_245990 ?auto_245999 ) ) ( not ( = ?auto_245990 ?auto_246000 ) ) ( not ( = ?auto_245990 ?auto_246001 ) ) ( not ( = ?auto_245990 ?auto_246002 ) ) ( not ( = ?auto_245991 ?auto_245992 ) ) ( not ( = ?auto_245991 ?auto_245993 ) ) ( not ( = ?auto_245991 ?auto_245994 ) ) ( not ( = ?auto_245991 ?auto_245995 ) ) ( not ( = ?auto_245991 ?auto_245996 ) ) ( not ( = ?auto_245991 ?auto_245997 ) ) ( not ( = ?auto_245991 ?auto_245998 ) ) ( not ( = ?auto_245991 ?auto_245999 ) ) ( not ( = ?auto_245991 ?auto_246000 ) ) ( not ( = ?auto_245991 ?auto_246001 ) ) ( not ( = ?auto_245991 ?auto_246002 ) ) ( not ( = ?auto_245992 ?auto_245993 ) ) ( not ( = ?auto_245992 ?auto_245994 ) ) ( not ( = ?auto_245992 ?auto_245995 ) ) ( not ( = ?auto_245992 ?auto_245996 ) ) ( not ( = ?auto_245992 ?auto_245997 ) ) ( not ( = ?auto_245992 ?auto_245998 ) ) ( not ( = ?auto_245992 ?auto_245999 ) ) ( not ( = ?auto_245992 ?auto_246000 ) ) ( not ( = ?auto_245992 ?auto_246001 ) ) ( not ( = ?auto_245992 ?auto_246002 ) ) ( not ( = ?auto_245993 ?auto_245994 ) ) ( not ( = ?auto_245993 ?auto_245995 ) ) ( not ( = ?auto_245993 ?auto_245996 ) ) ( not ( = ?auto_245993 ?auto_245997 ) ) ( not ( = ?auto_245993 ?auto_245998 ) ) ( not ( = ?auto_245993 ?auto_245999 ) ) ( not ( = ?auto_245993 ?auto_246000 ) ) ( not ( = ?auto_245993 ?auto_246001 ) ) ( not ( = ?auto_245993 ?auto_246002 ) ) ( not ( = ?auto_245994 ?auto_245995 ) ) ( not ( = ?auto_245994 ?auto_245996 ) ) ( not ( = ?auto_245994 ?auto_245997 ) ) ( not ( = ?auto_245994 ?auto_245998 ) ) ( not ( = ?auto_245994 ?auto_245999 ) ) ( not ( = ?auto_245994 ?auto_246000 ) ) ( not ( = ?auto_245994 ?auto_246001 ) ) ( not ( = ?auto_245994 ?auto_246002 ) ) ( not ( = ?auto_245995 ?auto_245996 ) ) ( not ( = ?auto_245995 ?auto_245997 ) ) ( not ( = ?auto_245995 ?auto_245998 ) ) ( not ( = ?auto_245995 ?auto_245999 ) ) ( not ( = ?auto_245995 ?auto_246000 ) ) ( not ( = ?auto_245995 ?auto_246001 ) ) ( not ( = ?auto_245995 ?auto_246002 ) ) ( not ( = ?auto_245996 ?auto_245997 ) ) ( not ( = ?auto_245996 ?auto_245998 ) ) ( not ( = ?auto_245996 ?auto_245999 ) ) ( not ( = ?auto_245996 ?auto_246000 ) ) ( not ( = ?auto_245996 ?auto_246001 ) ) ( not ( = ?auto_245996 ?auto_246002 ) ) ( not ( = ?auto_245997 ?auto_245998 ) ) ( not ( = ?auto_245997 ?auto_245999 ) ) ( not ( = ?auto_245997 ?auto_246000 ) ) ( not ( = ?auto_245997 ?auto_246001 ) ) ( not ( = ?auto_245997 ?auto_246002 ) ) ( not ( = ?auto_245998 ?auto_245999 ) ) ( not ( = ?auto_245998 ?auto_246000 ) ) ( not ( = ?auto_245998 ?auto_246001 ) ) ( not ( = ?auto_245998 ?auto_246002 ) ) ( not ( = ?auto_245999 ?auto_246000 ) ) ( not ( = ?auto_245999 ?auto_246001 ) ) ( not ( = ?auto_245999 ?auto_246002 ) ) ( not ( = ?auto_246000 ?auto_246001 ) ) ( not ( = ?auto_246000 ?auto_246002 ) ) ( not ( = ?auto_246001 ?auto_246002 ) ) ( ON ?auto_246000 ?auto_246001 ) ( ON ?auto_245999 ?auto_246000 ) ( CLEAR ?auto_245997 ) ( ON ?auto_245998 ?auto_245999 ) ( CLEAR ?auto_245998 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_245990 ?auto_245991 ?auto_245992 ?auto_245993 ?auto_245994 ?auto_245995 ?auto_245996 ?auto_245997 ?auto_245998 )
      ( MAKE-12PILE ?auto_245990 ?auto_245991 ?auto_245992 ?auto_245993 ?auto_245994 ?auto_245995 ?auto_245996 ?auto_245997 ?auto_245998 ?auto_245999 ?auto_246000 ?auto_246001 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_246015 - BLOCK
      ?auto_246016 - BLOCK
      ?auto_246017 - BLOCK
      ?auto_246018 - BLOCK
      ?auto_246019 - BLOCK
      ?auto_246020 - BLOCK
      ?auto_246021 - BLOCK
      ?auto_246022 - BLOCK
      ?auto_246023 - BLOCK
      ?auto_246024 - BLOCK
      ?auto_246025 - BLOCK
      ?auto_246026 - BLOCK
    )
    :vars
    (
      ?auto_246027 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_246026 ?auto_246027 ) ( ON-TABLE ?auto_246015 ) ( ON ?auto_246016 ?auto_246015 ) ( ON ?auto_246017 ?auto_246016 ) ( ON ?auto_246018 ?auto_246017 ) ( ON ?auto_246019 ?auto_246018 ) ( ON ?auto_246020 ?auto_246019 ) ( ON ?auto_246021 ?auto_246020 ) ( ON ?auto_246022 ?auto_246021 ) ( not ( = ?auto_246015 ?auto_246016 ) ) ( not ( = ?auto_246015 ?auto_246017 ) ) ( not ( = ?auto_246015 ?auto_246018 ) ) ( not ( = ?auto_246015 ?auto_246019 ) ) ( not ( = ?auto_246015 ?auto_246020 ) ) ( not ( = ?auto_246015 ?auto_246021 ) ) ( not ( = ?auto_246015 ?auto_246022 ) ) ( not ( = ?auto_246015 ?auto_246023 ) ) ( not ( = ?auto_246015 ?auto_246024 ) ) ( not ( = ?auto_246015 ?auto_246025 ) ) ( not ( = ?auto_246015 ?auto_246026 ) ) ( not ( = ?auto_246015 ?auto_246027 ) ) ( not ( = ?auto_246016 ?auto_246017 ) ) ( not ( = ?auto_246016 ?auto_246018 ) ) ( not ( = ?auto_246016 ?auto_246019 ) ) ( not ( = ?auto_246016 ?auto_246020 ) ) ( not ( = ?auto_246016 ?auto_246021 ) ) ( not ( = ?auto_246016 ?auto_246022 ) ) ( not ( = ?auto_246016 ?auto_246023 ) ) ( not ( = ?auto_246016 ?auto_246024 ) ) ( not ( = ?auto_246016 ?auto_246025 ) ) ( not ( = ?auto_246016 ?auto_246026 ) ) ( not ( = ?auto_246016 ?auto_246027 ) ) ( not ( = ?auto_246017 ?auto_246018 ) ) ( not ( = ?auto_246017 ?auto_246019 ) ) ( not ( = ?auto_246017 ?auto_246020 ) ) ( not ( = ?auto_246017 ?auto_246021 ) ) ( not ( = ?auto_246017 ?auto_246022 ) ) ( not ( = ?auto_246017 ?auto_246023 ) ) ( not ( = ?auto_246017 ?auto_246024 ) ) ( not ( = ?auto_246017 ?auto_246025 ) ) ( not ( = ?auto_246017 ?auto_246026 ) ) ( not ( = ?auto_246017 ?auto_246027 ) ) ( not ( = ?auto_246018 ?auto_246019 ) ) ( not ( = ?auto_246018 ?auto_246020 ) ) ( not ( = ?auto_246018 ?auto_246021 ) ) ( not ( = ?auto_246018 ?auto_246022 ) ) ( not ( = ?auto_246018 ?auto_246023 ) ) ( not ( = ?auto_246018 ?auto_246024 ) ) ( not ( = ?auto_246018 ?auto_246025 ) ) ( not ( = ?auto_246018 ?auto_246026 ) ) ( not ( = ?auto_246018 ?auto_246027 ) ) ( not ( = ?auto_246019 ?auto_246020 ) ) ( not ( = ?auto_246019 ?auto_246021 ) ) ( not ( = ?auto_246019 ?auto_246022 ) ) ( not ( = ?auto_246019 ?auto_246023 ) ) ( not ( = ?auto_246019 ?auto_246024 ) ) ( not ( = ?auto_246019 ?auto_246025 ) ) ( not ( = ?auto_246019 ?auto_246026 ) ) ( not ( = ?auto_246019 ?auto_246027 ) ) ( not ( = ?auto_246020 ?auto_246021 ) ) ( not ( = ?auto_246020 ?auto_246022 ) ) ( not ( = ?auto_246020 ?auto_246023 ) ) ( not ( = ?auto_246020 ?auto_246024 ) ) ( not ( = ?auto_246020 ?auto_246025 ) ) ( not ( = ?auto_246020 ?auto_246026 ) ) ( not ( = ?auto_246020 ?auto_246027 ) ) ( not ( = ?auto_246021 ?auto_246022 ) ) ( not ( = ?auto_246021 ?auto_246023 ) ) ( not ( = ?auto_246021 ?auto_246024 ) ) ( not ( = ?auto_246021 ?auto_246025 ) ) ( not ( = ?auto_246021 ?auto_246026 ) ) ( not ( = ?auto_246021 ?auto_246027 ) ) ( not ( = ?auto_246022 ?auto_246023 ) ) ( not ( = ?auto_246022 ?auto_246024 ) ) ( not ( = ?auto_246022 ?auto_246025 ) ) ( not ( = ?auto_246022 ?auto_246026 ) ) ( not ( = ?auto_246022 ?auto_246027 ) ) ( not ( = ?auto_246023 ?auto_246024 ) ) ( not ( = ?auto_246023 ?auto_246025 ) ) ( not ( = ?auto_246023 ?auto_246026 ) ) ( not ( = ?auto_246023 ?auto_246027 ) ) ( not ( = ?auto_246024 ?auto_246025 ) ) ( not ( = ?auto_246024 ?auto_246026 ) ) ( not ( = ?auto_246024 ?auto_246027 ) ) ( not ( = ?auto_246025 ?auto_246026 ) ) ( not ( = ?auto_246025 ?auto_246027 ) ) ( not ( = ?auto_246026 ?auto_246027 ) ) ( ON ?auto_246025 ?auto_246026 ) ( ON ?auto_246024 ?auto_246025 ) ( CLEAR ?auto_246022 ) ( ON ?auto_246023 ?auto_246024 ) ( CLEAR ?auto_246023 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_246015 ?auto_246016 ?auto_246017 ?auto_246018 ?auto_246019 ?auto_246020 ?auto_246021 ?auto_246022 ?auto_246023 )
      ( MAKE-12PILE ?auto_246015 ?auto_246016 ?auto_246017 ?auto_246018 ?auto_246019 ?auto_246020 ?auto_246021 ?auto_246022 ?auto_246023 ?auto_246024 ?auto_246025 ?auto_246026 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_246040 - BLOCK
      ?auto_246041 - BLOCK
      ?auto_246042 - BLOCK
      ?auto_246043 - BLOCK
      ?auto_246044 - BLOCK
      ?auto_246045 - BLOCK
      ?auto_246046 - BLOCK
      ?auto_246047 - BLOCK
      ?auto_246048 - BLOCK
      ?auto_246049 - BLOCK
      ?auto_246050 - BLOCK
      ?auto_246051 - BLOCK
    )
    :vars
    (
      ?auto_246052 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_246051 ?auto_246052 ) ( ON-TABLE ?auto_246040 ) ( ON ?auto_246041 ?auto_246040 ) ( ON ?auto_246042 ?auto_246041 ) ( ON ?auto_246043 ?auto_246042 ) ( ON ?auto_246044 ?auto_246043 ) ( ON ?auto_246045 ?auto_246044 ) ( ON ?auto_246046 ?auto_246045 ) ( not ( = ?auto_246040 ?auto_246041 ) ) ( not ( = ?auto_246040 ?auto_246042 ) ) ( not ( = ?auto_246040 ?auto_246043 ) ) ( not ( = ?auto_246040 ?auto_246044 ) ) ( not ( = ?auto_246040 ?auto_246045 ) ) ( not ( = ?auto_246040 ?auto_246046 ) ) ( not ( = ?auto_246040 ?auto_246047 ) ) ( not ( = ?auto_246040 ?auto_246048 ) ) ( not ( = ?auto_246040 ?auto_246049 ) ) ( not ( = ?auto_246040 ?auto_246050 ) ) ( not ( = ?auto_246040 ?auto_246051 ) ) ( not ( = ?auto_246040 ?auto_246052 ) ) ( not ( = ?auto_246041 ?auto_246042 ) ) ( not ( = ?auto_246041 ?auto_246043 ) ) ( not ( = ?auto_246041 ?auto_246044 ) ) ( not ( = ?auto_246041 ?auto_246045 ) ) ( not ( = ?auto_246041 ?auto_246046 ) ) ( not ( = ?auto_246041 ?auto_246047 ) ) ( not ( = ?auto_246041 ?auto_246048 ) ) ( not ( = ?auto_246041 ?auto_246049 ) ) ( not ( = ?auto_246041 ?auto_246050 ) ) ( not ( = ?auto_246041 ?auto_246051 ) ) ( not ( = ?auto_246041 ?auto_246052 ) ) ( not ( = ?auto_246042 ?auto_246043 ) ) ( not ( = ?auto_246042 ?auto_246044 ) ) ( not ( = ?auto_246042 ?auto_246045 ) ) ( not ( = ?auto_246042 ?auto_246046 ) ) ( not ( = ?auto_246042 ?auto_246047 ) ) ( not ( = ?auto_246042 ?auto_246048 ) ) ( not ( = ?auto_246042 ?auto_246049 ) ) ( not ( = ?auto_246042 ?auto_246050 ) ) ( not ( = ?auto_246042 ?auto_246051 ) ) ( not ( = ?auto_246042 ?auto_246052 ) ) ( not ( = ?auto_246043 ?auto_246044 ) ) ( not ( = ?auto_246043 ?auto_246045 ) ) ( not ( = ?auto_246043 ?auto_246046 ) ) ( not ( = ?auto_246043 ?auto_246047 ) ) ( not ( = ?auto_246043 ?auto_246048 ) ) ( not ( = ?auto_246043 ?auto_246049 ) ) ( not ( = ?auto_246043 ?auto_246050 ) ) ( not ( = ?auto_246043 ?auto_246051 ) ) ( not ( = ?auto_246043 ?auto_246052 ) ) ( not ( = ?auto_246044 ?auto_246045 ) ) ( not ( = ?auto_246044 ?auto_246046 ) ) ( not ( = ?auto_246044 ?auto_246047 ) ) ( not ( = ?auto_246044 ?auto_246048 ) ) ( not ( = ?auto_246044 ?auto_246049 ) ) ( not ( = ?auto_246044 ?auto_246050 ) ) ( not ( = ?auto_246044 ?auto_246051 ) ) ( not ( = ?auto_246044 ?auto_246052 ) ) ( not ( = ?auto_246045 ?auto_246046 ) ) ( not ( = ?auto_246045 ?auto_246047 ) ) ( not ( = ?auto_246045 ?auto_246048 ) ) ( not ( = ?auto_246045 ?auto_246049 ) ) ( not ( = ?auto_246045 ?auto_246050 ) ) ( not ( = ?auto_246045 ?auto_246051 ) ) ( not ( = ?auto_246045 ?auto_246052 ) ) ( not ( = ?auto_246046 ?auto_246047 ) ) ( not ( = ?auto_246046 ?auto_246048 ) ) ( not ( = ?auto_246046 ?auto_246049 ) ) ( not ( = ?auto_246046 ?auto_246050 ) ) ( not ( = ?auto_246046 ?auto_246051 ) ) ( not ( = ?auto_246046 ?auto_246052 ) ) ( not ( = ?auto_246047 ?auto_246048 ) ) ( not ( = ?auto_246047 ?auto_246049 ) ) ( not ( = ?auto_246047 ?auto_246050 ) ) ( not ( = ?auto_246047 ?auto_246051 ) ) ( not ( = ?auto_246047 ?auto_246052 ) ) ( not ( = ?auto_246048 ?auto_246049 ) ) ( not ( = ?auto_246048 ?auto_246050 ) ) ( not ( = ?auto_246048 ?auto_246051 ) ) ( not ( = ?auto_246048 ?auto_246052 ) ) ( not ( = ?auto_246049 ?auto_246050 ) ) ( not ( = ?auto_246049 ?auto_246051 ) ) ( not ( = ?auto_246049 ?auto_246052 ) ) ( not ( = ?auto_246050 ?auto_246051 ) ) ( not ( = ?auto_246050 ?auto_246052 ) ) ( not ( = ?auto_246051 ?auto_246052 ) ) ( ON ?auto_246050 ?auto_246051 ) ( ON ?auto_246049 ?auto_246050 ) ( ON ?auto_246048 ?auto_246049 ) ( CLEAR ?auto_246046 ) ( ON ?auto_246047 ?auto_246048 ) ( CLEAR ?auto_246047 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_246040 ?auto_246041 ?auto_246042 ?auto_246043 ?auto_246044 ?auto_246045 ?auto_246046 ?auto_246047 )
      ( MAKE-12PILE ?auto_246040 ?auto_246041 ?auto_246042 ?auto_246043 ?auto_246044 ?auto_246045 ?auto_246046 ?auto_246047 ?auto_246048 ?auto_246049 ?auto_246050 ?auto_246051 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_246065 - BLOCK
      ?auto_246066 - BLOCK
      ?auto_246067 - BLOCK
      ?auto_246068 - BLOCK
      ?auto_246069 - BLOCK
      ?auto_246070 - BLOCK
      ?auto_246071 - BLOCK
      ?auto_246072 - BLOCK
      ?auto_246073 - BLOCK
      ?auto_246074 - BLOCK
      ?auto_246075 - BLOCK
      ?auto_246076 - BLOCK
    )
    :vars
    (
      ?auto_246077 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_246076 ?auto_246077 ) ( ON-TABLE ?auto_246065 ) ( ON ?auto_246066 ?auto_246065 ) ( ON ?auto_246067 ?auto_246066 ) ( ON ?auto_246068 ?auto_246067 ) ( ON ?auto_246069 ?auto_246068 ) ( ON ?auto_246070 ?auto_246069 ) ( ON ?auto_246071 ?auto_246070 ) ( not ( = ?auto_246065 ?auto_246066 ) ) ( not ( = ?auto_246065 ?auto_246067 ) ) ( not ( = ?auto_246065 ?auto_246068 ) ) ( not ( = ?auto_246065 ?auto_246069 ) ) ( not ( = ?auto_246065 ?auto_246070 ) ) ( not ( = ?auto_246065 ?auto_246071 ) ) ( not ( = ?auto_246065 ?auto_246072 ) ) ( not ( = ?auto_246065 ?auto_246073 ) ) ( not ( = ?auto_246065 ?auto_246074 ) ) ( not ( = ?auto_246065 ?auto_246075 ) ) ( not ( = ?auto_246065 ?auto_246076 ) ) ( not ( = ?auto_246065 ?auto_246077 ) ) ( not ( = ?auto_246066 ?auto_246067 ) ) ( not ( = ?auto_246066 ?auto_246068 ) ) ( not ( = ?auto_246066 ?auto_246069 ) ) ( not ( = ?auto_246066 ?auto_246070 ) ) ( not ( = ?auto_246066 ?auto_246071 ) ) ( not ( = ?auto_246066 ?auto_246072 ) ) ( not ( = ?auto_246066 ?auto_246073 ) ) ( not ( = ?auto_246066 ?auto_246074 ) ) ( not ( = ?auto_246066 ?auto_246075 ) ) ( not ( = ?auto_246066 ?auto_246076 ) ) ( not ( = ?auto_246066 ?auto_246077 ) ) ( not ( = ?auto_246067 ?auto_246068 ) ) ( not ( = ?auto_246067 ?auto_246069 ) ) ( not ( = ?auto_246067 ?auto_246070 ) ) ( not ( = ?auto_246067 ?auto_246071 ) ) ( not ( = ?auto_246067 ?auto_246072 ) ) ( not ( = ?auto_246067 ?auto_246073 ) ) ( not ( = ?auto_246067 ?auto_246074 ) ) ( not ( = ?auto_246067 ?auto_246075 ) ) ( not ( = ?auto_246067 ?auto_246076 ) ) ( not ( = ?auto_246067 ?auto_246077 ) ) ( not ( = ?auto_246068 ?auto_246069 ) ) ( not ( = ?auto_246068 ?auto_246070 ) ) ( not ( = ?auto_246068 ?auto_246071 ) ) ( not ( = ?auto_246068 ?auto_246072 ) ) ( not ( = ?auto_246068 ?auto_246073 ) ) ( not ( = ?auto_246068 ?auto_246074 ) ) ( not ( = ?auto_246068 ?auto_246075 ) ) ( not ( = ?auto_246068 ?auto_246076 ) ) ( not ( = ?auto_246068 ?auto_246077 ) ) ( not ( = ?auto_246069 ?auto_246070 ) ) ( not ( = ?auto_246069 ?auto_246071 ) ) ( not ( = ?auto_246069 ?auto_246072 ) ) ( not ( = ?auto_246069 ?auto_246073 ) ) ( not ( = ?auto_246069 ?auto_246074 ) ) ( not ( = ?auto_246069 ?auto_246075 ) ) ( not ( = ?auto_246069 ?auto_246076 ) ) ( not ( = ?auto_246069 ?auto_246077 ) ) ( not ( = ?auto_246070 ?auto_246071 ) ) ( not ( = ?auto_246070 ?auto_246072 ) ) ( not ( = ?auto_246070 ?auto_246073 ) ) ( not ( = ?auto_246070 ?auto_246074 ) ) ( not ( = ?auto_246070 ?auto_246075 ) ) ( not ( = ?auto_246070 ?auto_246076 ) ) ( not ( = ?auto_246070 ?auto_246077 ) ) ( not ( = ?auto_246071 ?auto_246072 ) ) ( not ( = ?auto_246071 ?auto_246073 ) ) ( not ( = ?auto_246071 ?auto_246074 ) ) ( not ( = ?auto_246071 ?auto_246075 ) ) ( not ( = ?auto_246071 ?auto_246076 ) ) ( not ( = ?auto_246071 ?auto_246077 ) ) ( not ( = ?auto_246072 ?auto_246073 ) ) ( not ( = ?auto_246072 ?auto_246074 ) ) ( not ( = ?auto_246072 ?auto_246075 ) ) ( not ( = ?auto_246072 ?auto_246076 ) ) ( not ( = ?auto_246072 ?auto_246077 ) ) ( not ( = ?auto_246073 ?auto_246074 ) ) ( not ( = ?auto_246073 ?auto_246075 ) ) ( not ( = ?auto_246073 ?auto_246076 ) ) ( not ( = ?auto_246073 ?auto_246077 ) ) ( not ( = ?auto_246074 ?auto_246075 ) ) ( not ( = ?auto_246074 ?auto_246076 ) ) ( not ( = ?auto_246074 ?auto_246077 ) ) ( not ( = ?auto_246075 ?auto_246076 ) ) ( not ( = ?auto_246075 ?auto_246077 ) ) ( not ( = ?auto_246076 ?auto_246077 ) ) ( ON ?auto_246075 ?auto_246076 ) ( ON ?auto_246074 ?auto_246075 ) ( ON ?auto_246073 ?auto_246074 ) ( CLEAR ?auto_246071 ) ( ON ?auto_246072 ?auto_246073 ) ( CLEAR ?auto_246072 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_246065 ?auto_246066 ?auto_246067 ?auto_246068 ?auto_246069 ?auto_246070 ?auto_246071 ?auto_246072 )
      ( MAKE-12PILE ?auto_246065 ?auto_246066 ?auto_246067 ?auto_246068 ?auto_246069 ?auto_246070 ?auto_246071 ?auto_246072 ?auto_246073 ?auto_246074 ?auto_246075 ?auto_246076 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_246090 - BLOCK
      ?auto_246091 - BLOCK
      ?auto_246092 - BLOCK
      ?auto_246093 - BLOCK
      ?auto_246094 - BLOCK
      ?auto_246095 - BLOCK
      ?auto_246096 - BLOCK
      ?auto_246097 - BLOCK
      ?auto_246098 - BLOCK
      ?auto_246099 - BLOCK
      ?auto_246100 - BLOCK
      ?auto_246101 - BLOCK
    )
    :vars
    (
      ?auto_246102 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_246101 ?auto_246102 ) ( ON-TABLE ?auto_246090 ) ( ON ?auto_246091 ?auto_246090 ) ( ON ?auto_246092 ?auto_246091 ) ( ON ?auto_246093 ?auto_246092 ) ( ON ?auto_246094 ?auto_246093 ) ( ON ?auto_246095 ?auto_246094 ) ( not ( = ?auto_246090 ?auto_246091 ) ) ( not ( = ?auto_246090 ?auto_246092 ) ) ( not ( = ?auto_246090 ?auto_246093 ) ) ( not ( = ?auto_246090 ?auto_246094 ) ) ( not ( = ?auto_246090 ?auto_246095 ) ) ( not ( = ?auto_246090 ?auto_246096 ) ) ( not ( = ?auto_246090 ?auto_246097 ) ) ( not ( = ?auto_246090 ?auto_246098 ) ) ( not ( = ?auto_246090 ?auto_246099 ) ) ( not ( = ?auto_246090 ?auto_246100 ) ) ( not ( = ?auto_246090 ?auto_246101 ) ) ( not ( = ?auto_246090 ?auto_246102 ) ) ( not ( = ?auto_246091 ?auto_246092 ) ) ( not ( = ?auto_246091 ?auto_246093 ) ) ( not ( = ?auto_246091 ?auto_246094 ) ) ( not ( = ?auto_246091 ?auto_246095 ) ) ( not ( = ?auto_246091 ?auto_246096 ) ) ( not ( = ?auto_246091 ?auto_246097 ) ) ( not ( = ?auto_246091 ?auto_246098 ) ) ( not ( = ?auto_246091 ?auto_246099 ) ) ( not ( = ?auto_246091 ?auto_246100 ) ) ( not ( = ?auto_246091 ?auto_246101 ) ) ( not ( = ?auto_246091 ?auto_246102 ) ) ( not ( = ?auto_246092 ?auto_246093 ) ) ( not ( = ?auto_246092 ?auto_246094 ) ) ( not ( = ?auto_246092 ?auto_246095 ) ) ( not ( = ?auto_246092 ?auto_246096 ) ) ( not ( = ?auto_246092 ?auto_246097 ) ) ( not ( = ?auto_246092 ?auto_246098 ) ) ( not ( = ?auto_246092 ?auto_246099 ) ) ( not ( = ?auto_246092 ?auto_246100 ) ) ( not ( = ?auto_246092 ?auto_246101 ) ) ( not ( = ?auto_246092 ?auto_246102 ) ) ( not ( = ?auto_246093 ?auto_246094 ) ) ( not ( = ?auto_246093 ?auto_246095 ) ) ( not ( = ?auto_246093 ?auto_246096 ) ) ( not ( = ?auto_246093 ?auto_246097 ) ) ( not ( = ?auto_246093 ?auto_246098 ) ) ( not ( = ?auto_246093 ?auto_246099 ) ) ( not ( = ?auto_246093 ?auto_246100 ) ) ( not ( = ?auto_246093 ?auto_246101 ) ) ( not ( = ?auto_246093 ?auto_246102 ) ) ( not ( = ?auto_246094 ?auto_246095 ) ) ( not ( = ?auto_246094 ?auto_246096 ) ) ( not ( = ?auto_246094 ?auto_246097 ) ) ( not ( = ?auto_246094 ?auto_246098 ) ) ( not ( = ?auto_246094 ?auto_246099 ) ) ( not ( = ?auto_246094 ?auto_246100 ) ) ( not ( = ?auto_246094 ?auto_246101 ) ) ( not ( = ?auto_246094 ?auto_246102 ) ) ( not ( = ?auto_246095 ?auto_246096 ) ) ( not ( = ?auto_246095 ?auto_246097 ) ) ( not ( = ?auto_246095 ?auto_246098 ) ) ( not ( = ?auto_246095 ?auto_246099 ) ) ( not ( = ?auto_246095 ?auto_246100 ) ) ( not ( = ?auto_246095 ?auto_246101 ) ) ( not ( = ?auto_246095 ?auto_246102 ) ) ( not ( = ?auto_246096 ?auto_246097 ) ) ( not ( = ?auto_246096 ?auto_246098 ) ) ( not ( = ?auto_246096 ?auto_246099 ) ) ( not ( = ?auto_246096 ?auto_246100 ) ) ( not ( = ?auto_246096 ?auto_246101 ) ) ( not ( = ?auto_246096 ?auto_246102 ) ) ( not ( = ?auto_246097 ?auto_246098 ) ) ( not ( = ?auto_246097 ?auto_246099 ) ) ( not ( = ?auto_246097 ?auto_246100 ) ) ( not ( = ?auto_246097 ?auto_246101 ) ) ( not ( = ?auto_246097 ?auto_246102 ) ) ( not ( = ?auto_246098 ?auto_246099 ) ) ( not ( = ?auto_246098 ?auto_246100 ) ) ( not ( = ?auto_246098 ?auto_246101 ) ) ( not ( = ?auto_246098 ?auto_246102 ) ) ( not ( = ?auto_246099 ?auto_246100 ) ) ( not ( = ?auto_246099 ?auto_246101 ) ) ( not ( = ?auto_246099 ?auto_246102 ) ) ( not ( = ?auto_246100 ?auto_246101 ) ) ( not ( = ?auto_246100 ?auto_246102 ) ) ( not ( = ?auto_246101 ?auto_246102 ) ) ( ON ?auto_246100 ?auto_246101 ) ( ON ?auto_246099 ?auto_246100 ) ( ON ?auto_246098 ?auto_246099 ) ( ON ?auto_246097 ?auto_246098 ) ( CLEAR ?auto_246095 ) ( ON ?auto_246096 ?auto_246097 ) ( CLEAR ?auto_246096 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_246090 ?auto_246091 ?auto_246092 ?auto_246093 ?auto_246094 ?auto_246095 ?auto_246096 )
      ( MAKE-12PILE ?auto_246090 ?auto_246091 ?auto_246092 ?auto_246093 ?auto_246094 ?auto_246095 ?auto_246096 ?auto_246097 ?auto_246098 ?auto_246099 ?auto_246100 ?auto_246101 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_246115 - BLOCK
      ?auto_246116 - BLOCK
      ?auto_246117 - BLOCK
      ?auto_246118 - BLOCK
      ?auto_246119 - BLOCK
      ?auto_246120 - BLOCK
      ?auto_246121 - BLOCK
      ?auto_246122 - BLOCK
      ?auto_246123 - BLOCK
      ?auto_246124 - BLOCK
      ?auto_246125 - BLOCK
      ?auto_246126 - BLOCK
    )
    :vars
    (
      ?auto_246127 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_246126 ?auto_246127 ) ( ON-TABLE ?auto_246115 ) ( ON ?auto_246116 ?auto_246115 ) ( ON ?auto_246117 ?auto_246116 ) ( ON ?auto_246118 ?auto_246117 ) ( ON ?auto_246119 ?auto_246118 ) ( ON ?auto_246120 ?auto_246119 ) ( not ( = ?auto_246115 ?auto_246116 ) ) ( not ( = ?auto_246115 ?auto_246117 ) ) ( not ( = ?auto_246115 ?auto_246118 ) ) ( not ( = ?auto_246115 ?auto_246119 ) ) ( not ( = ?auto_246115 ?auto_246120 ) ) ( not ( = ?auto_246115 ?auto_246121 ) ) ( not ( = ?auto_246115 ?auto_246122 ) ) ( not ( = ?auto_246115 ?auto_246123 ) ) ( not ( = ?auto_246115 ?auto_246124 ) ) ( not ( = ?auto_246115 ?auto_246125 ) ) ( not ( = ?auto_246115 ?auto_246126 ) ) ( not ( = ?auto_246115 ?auto_246127 ) ) ( not ( = ?auto_246116 ?auto_246117 ) ) ( not ( = ?auto_246116 ?auto_246118 ) ) ( not ( = ?auto_246116 ?auto_246119 ) ) ( not ( = ?auto_246116 ?auto_246120 ) ) ( not ( = ?auto_246116 ?auto_246121 ) ) ( not ( = ?auto_246116 ?auto_246122 ) ) ( not ( = ?auto_246116 ?auto_246123 ) ) ( not ( = ?auto_246116 ?auto_246124 ) ) ( not ( = ?auto_246116 ?auto_246125 ) ) ( not ( = ?auto_246116 ?auto_246126 ) ) ( not ( = ?auto_246116 ?auto_246127 ) ) ( not ( = ?auto_246117 ?auto_246118 ) ) ( not ( = ?auto_246117 ?auto_246119 ) ) ( not ( = ?auto_246117 ?auto_246120 ) ) ( not ( = ?auto_246117 ?auto_246121 ) ) ( not ( = ?auto_246117 ?auto_246122 ) ) ( not ( = ?auto_246117 ?auto_246123 ) ) ( not ( = ?auto_246117 ?auto_246124 ) ) ( not ( = ?auto_246117 ?auto_246125 ) ) ( not ( = ?auto_246117 ?auto_246126 ) ) ( not ( = ?auto_246117 ?auto_246127 ) ) ( not ( = ?auto_246118 ?auto_246119 ) ) ( not ( = ?auto_246118 ?auto_246120 ) ) ( not ( = ?auto_246118 ?auto_246121 ) ) ( not ( = ?auto_246118 ?auto_246122 ) ) ( not ( = ?auto_246118 ?auto_246123 ) ) ( not ( = ?auto_246118 ?auto_246124 ) ) ( not ( = ?auto_246118 ?auto_246125 ) ) ( not ( = ?auto_246118 ?auto_246126 ) ) ( not ( = ?auto_246118 ?auto_246127 ) ) ( not ( = ?auto_246119 ?auto_246120 ) ) ( not ( = ?auto_246119 ?auto_246121 ) ) ( not ( = ?auto_246119 ?auto_246122 ) ) ( not ( = ?auto_246119 ?auto_246123 ) ) ( not ( = ?auto_246119 ?auto_246124 ) ) ( not ( = ?auto_246119 ?auto_246125 ) ) ( not ( = ?auto_246119 ?auto_246126 ) ) ( not ( = ?auto_246119 ?auto_246127 ) ) ( not ( = ?auto_246120 ?auto_246121 ) ) ( not ( = ?auto_246120 ?auto_246122 ) ) ( not ( = ?auto_246120 ?auto_246123 ) ) ( not ( = ?auto_246120 ?auto_246124 ) ) ( not ( = ?auto_246120 ?auto_246125 ) ) ( not ( = ?auto_246120 ?auto_246126 ) ) ( not ( = ?auto_246120 ?auto_246127 ) ) ( not ( = ?auto_246121 ?auto_246122 ) ) ( not ( = ?auto_246121 ?auto_246123 ) ) ( not ( = ?auto_246121 ?auto_246124 ) ) ( not ( = ?auto_246121 ?auto_246125 ) ) ( not ( = ?auto_246121 ?auto_246126 ) ) ( not ( = ?auto_246121 ?auto_246127 ) ) ( not ( = ?auto_246122 ?auto_246123 ) ) ( not ( = ?auto_246122 ?auto_246124 ) ) ( not ( = ?auto_246122 ?auto_246125 ) ) ( not ( = ?auto_246122 ?auto_246126 ) ) ( not ( = ?auto_246122 ?auto_246127 ) ) ( not ( = ?auto_246123 ?auto_246124 ) ) ( not ( = ?auto_246123 ?auto_246125 ) ) ( not ( = ?auto_246123 ?auto_246126 ) ) ( not ( = ?auto_246123 ?auto_246127 ) ) ( not ( = ?auto_246124 ?auto_246125 ) ) ( not ( = ?auto_246124 ?auto_246126 ) ) ( not ( = ?auto_246124 ?auto_246127 ) ) ( not ( = ?auto_246125 ?auto_246126 ) ) ( not ( = ?auto_246125 ?auto_246127 ) ) ( not ( = ?auto_246126 ?auto_246127 ) ) ( ON ?auto_246125 ?auto_246126 ) ( ON ?auto_246124 ?auto_246125 ) ( ON ?auto_246123 ?auto_246124 ) ( ON ?auto_246122 ?auto_246123 ) ( CLEAR ?auto_246120 ) ( ON ?auto_246121 ?auto_246122 ) ( CLEAR ?auto_246121 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_246115 ?auto_246116 ?auto_246117 ?auto_246118 ?auto_246119 ?auto_246120 ?auto_246121 )
      ( MAKE-12PILE ?auto_246115 ?auto_246116 ?auto_246117 ?auto_246118 ?auto_246119 ?auto_246120 ?auto_246121 ?auto_246122 ?auto_246123 ?auto_246124 ?auto_246125 ?auto_246126 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_246140 - BLOCK
      ?auto_246141 - BLOCK
      ?auto_246142 - BLOCK
      ?auto_246143 - BLOCK
      ?auto_246144 - BLOCK
      ?auto_246145 - BLOCK
      ?auto_246146 - BLOCK
      ?auto_246147 - BLOCK
      ?auto_246148 - BLOCK
      ?auto_246149 - BLOCK
      ?auto_246150 - BLOCK
      ?auto_246151 - BLOCK
    )
    :vars
    (
      ?auto_246152 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_246151 ?auto_246152 ) ( ON-TABLE ?auto_246140 ) ( ON ?auto_246141 ?auto_246140 ) ( ON ?auto_246142 ?auto_246141 ) ( ON ?auto_246143 ?auto_246142 ) ( ON ?auto_246144 ?auto_246143 ) ( not ( = ?auto_246140 ?auto_246141 ) ) ( not ( = ?auto_246140 ?auto_246142 ) ) ( not ( = ?auto_246140 ?auto_246143 ) ) ( not ( = ?auto_246140 ?auto_246144 ) ) ( not ( = ?auto_246140 ?auto_246145 ) ) ( not ( = ?auto_246140 ?auto_246146 ) ) ( not ( = ?auto_246140 ?auto_246147 ) ) ( not ( = ?auto_246140 ?auto_246148 ) ) ( not ( = ?auto_246140 ?auto_246149 ) ) ( not ( = ?auto_246140 ?auto_246150 ) ) ( not ( = ?auto_246140 ?auto_246151 ) ) ( not ( = ?auto_246140 ?auto_246152 ) ) ( not ( = ?auto_246141 ?auto_246142 ) ) ( not ( = ?auto_246141 ?auto_246143 ) ) ( not ( = ?auto_246141 ?auto_246144 ) ) ( not ( = ?auto_246141 ?auto_246145 ) ) ( not ( = ?auto_246141 ?auto_246146 ) ) ( not ( = ?auto_246141 ?auto_246147 ) ) ( not ( = ?auto_246141 ?auto_246148 ) ) ( not ( = ?auto_246141 ?auto_246149 ) ) ( not ( = ?auto_246141 ?auto_246150 ) ) ( not ( = ?auto_246141 ?auto_246151 ) ) ( not ( = ?auto_246141 ?auto_246152 ) ) ( not ( = ?auto_246142 ?auto_246143 ) ) ( not ( = ?auto_246142 ?auto_246144 ) ) ( not ( = ?auto_246142 ?auto_246145 ) ) ( not ( = ?auto_246142 ?auto_246146 ) ) ( not ( = ?auto_246142 ?auto_246147 ) ) ( not ( = ?auto_246142 ?auto_246148 ) ) ( not ( = ?auto_246142 ?auto_246149 ) ) ( not ( = ?auto_246142 ?auto_246150 ) ) ( not ( = ?auto_246142 ?auto_246151 ) ) ( not ( = ?auto_246142 ?auto_246152 ) ) ( not ( = ?auto_246143 ?auto_246144 ) ) ( not ( = ?auto_246143 ?auto_246145 ) ) ( not ( = ?auto_246143 ?auto_246146 ) ) ( not ( = ?auto_246143 ?auto_246147 ) ) ( not ( = ?auto_246143 ?auto_246148 ) ) ( not ( = ?auto_246143 ?auto_246149 ) ) ( not ( = ?auto_246143 ?auto_246150 ) ) ( not ( = ?auto_246143 ?auto_246151 ) ) ( not ( = ?auto_246143 ?auto_246152 ) ) ( not ( = ?auto_246144 ?auto_246145 ) ) ( not ( = ?auto_246144 ?auto_246146 ) ) ( not ( = ?auto_246144 ?auto_246147 ) ) ( not ( = ?auto_246144 ?auto_246148 ) ) ( not ( = ?auto_246144 ?auto_246149 ) ) ( not ( = ?auto_246144 ?auto_246150 ) ) ( not ( = ?auto_246144 ?auto_246151 ) ) ( not ( = ?auto_246144 ?auto_246152 ) ) ( not ( = ?auto_246145 ?auto_246146 ) ) ( not ( = ?auto_246145 ?auto_246147 ) ) ( not ( = ?auto_246145 ?auto_246148 ) ) ( not ( = ?auto_246145 ?auto_246149 ) ) ( not ( = ?auto_246145 ?auto_246150 ) ) ( not ( = ?auto_246145 ?auto_246151 ) ) ( not ( = ?auto_246145 ?auto_246152 ) ) ( not ( = ?auto_246146 ?auto_246147 ) ) ( not ( = ?auto_246146 ?auto_246148 ) ) ( not ( = ?auto_246146 ?auto_246149 ) ) ( not ( = ?auto_246146 ?auto_246150 ) ) ( not ( = ?auto_246146 ?auto_246151 ) ) ( not ( = ?auto_246146 ?auto_246152 ) ) ( not ( = ?auto_246147 ?auto_246148 ) ) ( not ( = ?auto_246147 ?auto_246149 ) ) ( not ( = ?auto_246147 ?auto_246150 ) ) ( not ( = ?auto_246147 ?auto_246151 ) ) ( not ( = ?auto_246147 ?auto_246152 ) ) ( not ( = ?auto_246148 ?auto_246149 ) ) ( not ( = ?auto_246148 ?auto_246150 ) ) ( not ( = ?auto_246148 ?auto_246151 ) ) ( not ( = ?auto_246148 ?auto_246152 ) ) ( not ( = ?auto_246149 ?auto_246150 ) ) ( not ( = ?auto_246149 ?auto_246151 ) ) ( not ( = ?auto_246149 ?auto_246152 ) ) ( not ( = ?auto_246150 ?auto_246151 ) ) ( not ( = ?auto_246150 ?auto_246152 ) ) ( not ( = ?auto_246151 ?auto_246152 ) ) ( ON ?auto_246150 ?auto_246151 ) ( ON ?auto_246149 ?auto_246150 ) ( ON ?auto_246148 ?auto_246149 ) ( ON ?auto_246147 ?auto_246148 ) ( ON ?auto_246146 ?auto_246147 ) ( CLEAR ?auto_246144 ) ( ON ?auto_246145 ?auto_246146 ) ( CLEAR ?auto_246145 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_246140 ?auto_246141 ?auto_246142 ?auto_246143 ?auto_246144 ?auto_246145 )
      ( MAKE-12PILE ?auto_246140 ?auto_246141 ?auto_246142 ?auto_246143 ?auto_246144 ?auto_246145 ?auto_246146 ?auto_246147 ?auto_246148 ?auto_246149 ?auto_246150 ?auto_246151 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_246165 - BLOCK
      ?auto_246166 - BLOCK
      ?auto_246167 - BLOCK
      ?auto_246168 - BLOCK
      ?auto_246169 - BLOCK
      ?auto_246170 - BLOCK
      ?auto_246171 - BLOCK
      ?auto_246172 - BLOCK
      ?auto_246173 - BLOCK
      ?auto_246174 - BLOCK
      ?auto_246175 - BLOCK
      ?auto_246176 - BLOCK
    )
    :vars
    (
      ?auto_246177 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_246176 ?auto_246177 ) ( ON-TABLE ?auto_246165 ) ( ON ?auto_246166 ?auto_246165 ) ( ON ?auto_246167 ?auto_246166 ) ( ON ?auto_246168 ?auto_246167 ) ( ON ?auto_246169 ?auto_246168 ) ( not ( = ?auto_246165 ?auto_246166 ) ) ( not ( = ?auto_246165 ?auto_246167 ) ) ( not ( = ?auto_246165 ?auto_246168 ) ) ( not ( = ?auto_246165 ?auto_246169 ) ) ( not ( = ?auto_246165 ?auto_246170 ) ) ( not ( = ?auto_246165 ?auto_246171 ) ) ( not ( = ?auto_246165 ?auto_246172 ) ) ( not ( = ?auto_246165 ?auto_246173 ) ) ( not ( = ?auto_246165 ?auto_246174 ) ) ( not ( = ?auto_246165 ?auto_246175 ) ) ( not ( = ?auto_246165 ?auto_246176 ) ) ( not ( = ?auto_246165 ?auto_246177 ) ) ( not ( = ?auto_246166 ?auto_246167 ) ) ( not ( = ?auto_246166 ?auto_246168 ) ) ( not ( = ?auto_246166 ?auto_246169 ) ) ( not ( = ?auto_246166 ?auto_246170 ) ) ( not ( = ?auto_246166 ?auto_246171 ) ) ( not ( = ?auto_246166 ?auto_246172 ) ) ( not ( = ?auto_246166 ?auto_246173 ) ) ( not ( = ?auto_246166 ?auto_246174 ) ) ( not ( = ?auto_246166 ?auto_246175 ) ) ( not ( = ?auto_246166 ?auto_246176 ) ) ( not ( = ?auto_246166 ?auto_246177 ) ) ( not ( = ?auto_246167 ?auto_246168 ) ) ( not ( = ?auto_246167 ?auto_246169 ) ) ( not ( = ?auto_246167 ?auto_246170 ) ) ( not ( = ?auto_246167 ?auto_246171 ) ) ( not ( = ?auto_246167 ?auto_246172 ) ) ( not ( = ?auto_246167 ?auto_246173 ) ) ( not ( = ?auto_246167 ?auto_246174 ) ) ( not ( = ?auto_246167 ?auto_246175 ) ) ( not ( = ?auto_246167 ?auto_246176 ) ) ( not ( = ?auto_246167 ?auto_246177 ) ) ( not ( = ?auto_246168 ?auto_246169 ) ) ( not ( = ?auto_246168 ?auto_246170 ) ) ( not ( = ?auto_246168 ?auto_246171 ) ) ( not ( = ?auto_246168 ?auto_246172 ) ) ( not ( = ?auto_246168 ?auto_246173 ) ) ( not ( = ?auto_246168 ?auto_246174 ) ) ( not ( = ?auto_246168 ?auto_246175 ) ) ( not ( = ?auto_246168 ?auto_246176 ) ) ( not ( = ?auto_246168 ?auto_246177 ) ) ( not ( = ?auto_246169 ?auto_246170 ) ) ( not ( = ?auto_246169 ?auto_246171 ) ) ( not ( = ?auto_246169 ?auto_246172 ) ) ( not ( = ?auto_246169 ?auto_246173 ) ) ( not ( = ?auto_246169 ?auto_246174 ) ) ( not ( = ?auto_246169 ?auto_246175 ) ) ( not ( = ?auto_246169 ?auto_246176 ) ) ( not ( = ?auto_246169 ?auto_246177 ) ) ( not ( = ?auto_246170 ?auto_246171 ) ) ( not ( = ?auto_246170 ?auto_246172 ) ) ( not ( = ?auto_246170 ?auto_246173 ) ) ( not ( = ?auto_246170 ?auto_246174 ) ) ( not ( = ?auto_246170 ?auto_246175 ) ) ( not ( = ?auto_246170 ?auto_246176 ) ) ( not ( = ?auto_246170 ?auto_246177 ) ) ( not ( = ?auto_246171 ?auto_246172 ) ) ( not ( = ?auto_246171 ?auto_246173 ) ) ( not ( = ?auto_246171 ?auto_246174 ) ) ( not ( = ?auto_246171 ?auto_246175 ) ) ( not ( = ?auto_246171 ?auto_246176 ) ) ( not ( = ?auto_246171 ?auto_246177 ) ) ( not ( = ?auto_246172 ?auto_246173 ) ) ( not ( = ?auto_246172 ?auto_246174 ) ) ( not ( = ?auto_246172 ?auto_246175 ) ) ( not ( = ?auto_246172 ?auto_246176 ) ) ( not ( = ?auto_246172 ?auto_246177 ) ) ( not ( = ?auto_246173 ?auto_246174 ) ) ( not ( = ?auto_246173 ?auto_246175 ) ) ( not ( = ?auto_246173 ?auto_246176 ) ) ( not ( = ?auto_246173 ?auto_246177 ) ) ( not ( = ?auto_246174 ?auto_246175 ) ) ( not ( = ?auto_246174 ?auto_246176 ) ) ( not ( = ?auto_246174 ?auto_246177 ) ) ( not ( = ?auto_246175 ?auto_246176 ) ) ( not ( = ?auto_246175 ?auto_246177 ) ) ( not ( = ?auto_246176 ?auto_246177 ) ) ( ON ?auto_246175 ?auto_246176 ) ( ON ?auto_246174 ?auto_246175 ) ( ON ?auto_246173 ?auto_246174 ) ( ON ?auto_246172 ?auto_246173 ) ( ON ?auto_246171 ?auto_246172 ) ( CLEAR ?auto_246169 ) ( ON ?auto_246170 ?auto_246171 ) ( CLEAR ?auto_246170 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_246165 ?auto_246166 ?auto_246167 ?auto_246168 ?auto_246169 ?auto_246170 )
      ( MAKE-12PILE ?auto_246165 ?auto_246166 ?auto_246167 ?auto_246168 ?auto_246169 ?auto_246170 ?auto_246171 ?auto_246172 ?auto_246173 ?auto_246174 ?auto_246175 ?auto_246176 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_246190 - BLOCK
      ?auto_246191 - BLOCK
      ?auto_246192 - BLOCK
      ?auto_246193 - BLOCK
      ?auto_246194 - BLOCK
      ?auto_246195 - BLOCK
      ?auto_246196 - BLOCK
      ?auto_246197 - BLOCK
      ?auto_246198 - BLOCK
      ?auto_246199 - BLOCK
      ?auto_246200 - BLOCK
      ?auto_246201 - BLOCK
    )
    :vars
    (
      ?auto_246202 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_246201 ?auto_246202 ) ( ON-TABLE ?auto_246190 ) ( ON ?auto_246191 ?auto_246190 ) ( ON ?auto_246192 ?auto_246191 ) ( ON ?auto_246193 ?auto_246192 ) ( not ( = ?auto_246190 ?auto_246191 ) ) ( not ( = ?auto_246190 ?auto_246192 ) ) ( not ( = ?auto_246190 ?auto_246193 ) ) ( not ( = ?auto_246190 ?auto_246194 ) ) ( not ( = ?auto_246190 ?auto_246195 ) ) ( not ( = ?auto_246190 ?auto_246196 ) ) ( not ( = ?auto_246190 ?auto_246197 ) ) ( not ( = ?auto_246190 ?auto_246198 ) ) ( not ( = ?auto_246190 ?auto_246199 ) ) ( not ( = ?auto_246190 ?auto_246200 ) ) ( not ( = ?auto_246190 ?auto_246201 ) ) ( not ( = ?auto_246190 ?auto_246202 ) ) ( not ( = ?auto_246191 ?auto_246192 ) ) ( not ( = ?auto_246191 ?auto_246193 ) ) ( not ( = ?auto_246191 ?auto_246194 ) ) ( not ( = ?auto_246191 ?auto_246195 ) ) ( not ( = ?auto_246191 ?auto_246196 ) ) ( not ( = ?auto_246191 ?auto_246197 ) ) ( not ( = ?auto_246191 ?auto_246198 ) ) ( not ( = ?auto_246191 ?auto_246199 ) ) ( not ( = ?auto_246191 ?auto_246200 ) ) ( not ( = ?auto_246191 ?auto_246201 ) ) ( not ( = ?auto_246191 ?auto_246202 ) ) ( not ( = ?auto_246192 ?auto_246193 ) ) ( not ( = ?auto_246192 ?auto_246194 ) ) ( not ( = ?auto_246192 ?auto_246195 ) ) ( not ( = ?auto_246192 ?auto_246196 ) ) ( not ( = ?auto_246192 ?auto_246197 ) ) ( not ( = ?auto_246192 ?auto_246198 ) ) ( not ( = ?auto_246192 ?auto_246199 ) ) ( not ( = ?auto_246192 ?auto_246200 ) ) ( not ( = ?auto_246192 ?auto_246201 ) ) ( not ( = ?auto_246192 ?auto_246202 ) ) ( not ( = ?auto_246193 ?auto_246194 ) ) ( not ( = ?auto_246193 ?auto_246195 ) ) ( not ( = ?auto_246193 ?auto_246196 ) ) ( not ( = ?auto_246193 ?auto_246197 ) ) ( not ( = ?auto_246193 ?auto_246198 ) ) ( not ( = ?auto_246193 ?auto_246199 ) ) ( not ( = ?auto_246193 ?auto_246200 ) ) ( not ( = ?auto_246193 ?auto_246201 ) ) ( not ( = ?auto_246193 ?auto_246202 ) ) ( not ( = ?auto_246194 ?auto_246195 ) ) ( not ( = ?auto_246194 ?auto_246196 ) ) ( not ( = ?auto_246194 ?auto_246197 ) ) ( not ( = ?auto_246194 ?auto_246198 ) ) ( not ( = ?auto_246194 ?auto_246199 ) ) ( not ( = ?auto_246194 ?auto_246200 ) ) ( not ( = ?auto_246194 ?auto_246201 ) ) ( not ( = ?auto_246194 ?auto_246202 ) ) ( not ( = ?auto_246195 ?auto_246196 ) ) ( not ( = ?auto_246195 ?auto_246197 ) ) ( not ( = ?auto_246195 ?auto_246198 ) ) ( not ( = ?auto_246195 ?auto_246199 ) ) ( not ( = ?auto_246195 ?auto_246200 ) ) ( not ( = ?auto_246195 ?auto_246201 ) ) ( not ( = ?auto_246195 ?auto_246202 ) ) ( not ( = ?auto_246196 ?auto_246197 ) ) ( not ( = ?auto_246196 ?auto_246198 ) ) ( not ( = ?auto_246196 ?auto_246199 ) ) ( not ( = ?auto_246196 ?auto_246200 ) ) ( not ( = ?auto_246196 ?auto_246201 ) ) ( not ( = ?auto_246196 ?auto_246202 ) ) ( not ( = ?auto_246197 ?auto_246198 ) ) ( not ( = ?auto_246197 ?auto_246199 ) ) ( not ( = ?auto_246197 ?auto_246200 ) ) ( not ( = ?auto_246197 ?auto_246201 ) ) ( not ( = ?auto_246197 ?auto_246202 ) ) ( not ( = ?auto_246198 ?auto_246199 ) ) ( not ( = ?auto_246198 ?auto_246200 ) ) ( not ( = ?auto_246198 ?auto_246201 ) ) ( not ( = ?auto_246198 ?auto_246202 ) ) ( not ( = ?auto_246199 ?auto_246200 ) ) ( not ( = ?auto_246199 ?auto_246201 ) ) ( not ( = ?auto_246199 ?auto_246202 ) ) ( not ( = ?auto_246200 ?auto_246201 ) ) ( not ( = ?auto_246200 ?auto_246202 ) ) ( not ( = ?auto_246201 ?auto_246202 ) ) ( ON ?auto_246200 ?auto_246201 ) ( ON ?auto_246199 ?auto_246200 ) ( ON ?auto_246198 ?auto_246199 ) ( ON ?auto_246197 ?auto_246198 ) ( ON ?auto_246196 ?auto_246197 ) ( ON ?auto_246195 ?auto_246196 ) ( CLEAR ?auto_246193 ) ( ON ?auto_246194 ?auto_246195 ) ( CLEAR ?auto_246194 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_246190 ?auto_246191 ?auto_246192 ?auto_246193 ?auto_246194 )
      ( MAKE-12PILE ?auto_246190 ?auto_246191 ?auto_246192 ?auto_246193 ?auto_246194 ?auto_246195 ?auto_246196 ?auto_246197 ?auto_246198 ?auto_246199 ?auto_246200 ?auto_246201 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_246215 - BLOCK
      ?auto_246216 - BLOCK
      ?auto_246217 - BLOCK
      ?auto_246218 - BLOCK
      ?auto_246219 - BLOCK
      ?auto_246220 - BLOCK
      ?auto_246221 - BLOCK
      ?auto_246222 - BLOCK
      ?auto_246223 - BLOCK
      ?auto_246224 - BLOCK
      ?auto_246225 - BLOCK
      ?auto_246226 - BLOCK
    )
    :vars
    (
      ?auto_246227 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_246226 ?auto_246227 ) ( ON-TABLE ?auto_246215 ) ( ON ?auto_246216 ?auto_246215 ) ( ON ?auto_246217 ?auto_246216 ) ( ON ?auto_246218 ?auto_246217 ) ( not ( = ?auto_246215 ?auto_246216 ) ) ( not ( = ?auto_246215 ?auto_246217 ) ) ( not ( = ?auto_246215 ?auto_246218 ) ) ( not ( = ?auto_246215 ?auto_246219 ) ) ( not ( = ?auto_246215 ?auto_246220 ) ) ( not ( = ?auto_246215 ?auto_246221 ) ) ( not ( = ?auto_246215 ?auto_246222 ) ) ( not ( = ?auto_246215 ?auto_246223 ) ) ( not ( = ?auto_246215 ?auto_246224 ) ) ( not ( = ?auto_246215 ?auto_246225 ) ) ( not ( = ?auto_246215 ?auto_246226 ) ) ( not ( = ?auto_246215 ?auto_246227 ) ) ( not ( = ?auto_246216 ?auto_246217 ) ) ( not ( = ?auto_246216 ?auto_246218 ) ) ( not ( = ?auto_246216 ?auto_246219 ) ) ( not ( = ?auto_246216 ?auto_246220 ) ) ( not ( = ?auto_246216 ?auto_246221 ) ) ( not ( = ?auto_246216 ?auto_246222 ) ) ( not ( = ?auto_246216 ?auto_246223 ) ) ( not ( = ?auto_246216 ?auto_246224 ) ) ( not ( = ?auto_246216 ?auto_246225 ) ) ( not ( = ?auto_246216 ?auto_246226 ) ) ( not ( = ?auto_246216 ?auto_246227 ) ) ( not ( = ?auto_246217 ?auto_246218 ) ) ( not ( = ?auto_246217 ?auto_246219 ) ) ( not ( = ?auto_246217 ?auto_246220 ) ) ( not ( = ?auto_246217 ?auto_246221 ) ) ( not ( = ?auto_246217 ?auto_246222 ) ) ( not ( = ?auto_246217 ?auto_246223 ) ) ( not ( = ?auto_246217 ?auto_246224 ) ) ( not ( = ?auto_246217 ?auto_246225 ) ) ( not ( = ?auto_246217 ?auto_246226 ) ) ( not ( = ?auto_246217 ?auto_246227 ) ) ( not ( = ?auto_246218 ?auto_246219 ) ) ( not ( = ?auto_246218 ?auto_246220 ) ) ( not ( = ?auto_246218 ?auto_246221 ) ) ( not ( = ?auto_246218 ?auto_246222 ) ) ( not ( = ?auto_246218 ?auto_246223 ) ) ( not ( = ?auto_246218 ?auto_246224 ) ) ( not ( = ?auto_246218 ?auto_246225 ) ) ( not ( = ?auto_246218 ?auto_246226 ) ) ( not ( = ?auto_246218 ?auto_246227 ) ) ( not ( = ?auto_246219 ?auto_246220 ) ) ( not ( = ?auto_246219 ?auto_246221 ) ) ( not ( = ?auto_246219 ?auto_246222 ) ) ( not ( = ?auto_246219 ?auto_246223 ) ) ( not ( = ?auto_246219 ?auto_246224 ) ) ( not ( = ?auto_246219 ?auto_246225 ) ) ( not ( = ?auto_246219 ?auto_246226 ) ) ( not ( = ?auto_246219 ?auto_246227 ) ) ( not ( = ?auto_246220 ?auto_246221 ) ) ( not ( = ?auto_246220 ?auto_246222 ) ) ( not ( = ?auto_246220 ?auto_246223 ) ) ( not ( = ?auto_246220 ?auto_246224 ) ) ( not ( = ?auto_246220 ?auto_246225 ) ) ( not ( = ?auto_246220 ?auto_246226 ) ) ( not ( = ?auto_246220 ?auto_246227 ) ) ( not ( = ?auto_246221 ?auto_246222 ) ) ( not ( = ?auto_246221 ?auto_246223 ) ) ( not ( = ?auto_246221 ?auto_246224 ) ) ( not ( = ?auto_246221 ?auto_246225 ) ) ( not ( = ?auto_246221 ?auto_246226 ) ) ( not ( = ?auto_246221 ?auto_246227 ) ) ( not ( = ?auto_246222 ?auto_246223 ) ) ( not ( = ?auto_246222 ?auto_246224 ) ) ( not ( = ?auto_246222 ?auto_246225 ) ) ( not ( = ?auto_246222 ?auto_246226 ) ) ( not ( = ?auto_246222 ?auto_246227 ) ) ( not ( = ?auto_246223 ?auto_246224 ) ) ( not ( = ?auto_246223 ?auto_246225 ) ) ( not ( = ?auto_246223 ?auto_246226 ) ) ( not ( = ?auto_246223 ?auto_246227 ) ) ( not ( = ?auto_246224 ?auto_246225 ) ) ( not ( = ?auto_246224 ?auto_246226 ) ) ( not ( = ?auto_246224 ?auto_246227 ) ) ( not ( = ?auto_246225 ?auto_246226 ) ) ( not ( = ?auto_246225 ?auto_246227 ) ) ( not ( = ?auto_246226 ?auto_246227 ) ) ( ON ?auto_246225 ?auto_246226 ) ( ON ?auto_246224 ?auto_246225 ) ( ON ?auto_246223 ?auto_246224 ) ( ON ?auto_246222 ?auto_246223 ) ( ON ?auto_246221 ?auto_246222 ) ( ON ?auto_246220 ?auto_246221 ) ( CLEAR ?auto_246218 ) ( ON ?auto_246219 ?auto_246220 ) ( CLEAR ?auto_246219 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_246215 ?auto_246216 ?auto_246217 ?auto_246218 ?auto_246219 )
      ( MAKE-12PILE ?auto_246215 ?auto_246216 ?auto_246217 ?auto_246218 ?auto_246219 ?auto_246220 ?auto_246221 ?auto_246222 ?auto_246223 ?auto_246224 ?auto_246225 ?auto_246226 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_246240 - BLOCK
      ?auto_246241 - BLOCK
      ?auto_246242 - BLOCK
      ?auto_246243 - BLOCK
      ?auto_246244 - BLOCK
      ?auto_246245 - BLOCK
      ?auto_246246 - BLOCK
      ?auto_246247 - BLOCK
      ?auto_246248 - BLOCK
      ?auto_246249 - BLOCK
      ?auto_246250 - BLOCK
      ?auto_246251 - BLOCK
    )
    :vars
    (
      ?auto_246252 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_246251 ?auto_246252 ) ( ON-TABLE ?auto_246240 ) ( ON ?auto_246241 ?auto_246240 ) ( ON ?auto_246242 ?auto_246241 ) ( not ( = ?auto_246240 ?auto_246241 ) ) ( not ( = ?auto_246240 ?auto_246242 ) ) ( not ( = ?auto_246240 ?auto_246243 ) ) ( not ( = ?auto_246240 ?auto_246244 ) ) ( not ( = ?auto_246240 ?auto_246245 ) ) ( not ( = ?auto_246240 ?auto_246246 ) ) ( not ( = ?auto_246240 ?auto_246247 ) ) ( not ( = ?auto_246240 ?auto_246248 ) ) ( not ( = ?auto_246240 ?auto_246249 ) ) ( not ( = ?auto_246240 ?auto_246250 ) ) ( not ( = ?auto_246240 ?auto_246251 ) ) ( not ( = ?auto_246240 ?auto_246252 ) ) ( not ( = ?auto_246241 ?auto_246242 ) ) ( not ( = ?auto_246241 ?auto_246243 ) ) ( not ( = ?auto_246241 ?auto_246244 ) ) ( not ( = ?auto_246241 ?auto_246245 ) ) ( not ( = ?auto_246241 ?auto_246246 ) ) ( not ( = ?auto_246241 ?auto_246247 ) ) ( not ( = ?auto_246241 ?auto_246248 ) ) ( not ( = ?auto_246241 ?auto_246249 ) ) ( not ( = ?auto_246241 ?auto_246250 ) ) ( not ( = ?auto_246241 ?auto_246251 ) ) ( not ( = ?auto_246241 ?auto_246252 ) ) ( not ( = ?auto_246242 ?auto_246243 ) ) ( not ( = ?auto_246242 ?auto_246244 ) ) ( not ( = ?auto_246242 ?auto_246245 ) ) ( not ( = ?auto_246242 ?auto_246246 ) ) ( not ( = ?auto_246242 ?auto_246247 ) ) ( not ( = ?auto_246242 ?auto_246248 ) ) ( not ( = ?auto_246242 ?auto_246249 ) ) ( not ( = ?auto_246242 ?auto_246250 ) ) ( not ( = ?auto_246242 ?auto_246251 ) ) ( not ( = ?auto_246242 ?auto_246252 ) ) ( not ( = ?auto_246243 ?auto_246244 ) ) ( not ( = ?auto_246243 ?auto_246245 ) ) ( not ( = ?auto_246243 ?auto_246246 ) ) ( not ( = ?auto_246243 ?auto_246247 ) ) ( not ( = ?auto_246243 ?auto_246248 ) ) ( not ( = ?auto_246243 ?auto_246249 ) ) ( not ( = ?auto_246243 ?auto_246250 ) ) ( not ( = ?auto_246243 ?auto_246251 ) ) ( not ( = ?auto_246243 ?auto_246252 ) ) ( not ( = ?auto_246244 ?auto_246245 ) ) ( not ( = ?auto_246244 ?auto_246246 ) ) ( not ( = ?auto_246244 ?auto_246247 ) ) ( not ( = ?auto_246244 ?auto_246248 ) ) ( not ( = ?auto_246244 ?auto_246249 ) ) ( not ( = ?auto_246244 ?auto_246250 ) ) ( not ( = ?auto_246244 ?auto_246251 ) ) ( not ( = ?auto_246244 ?auto_246252 ) ) ( not ( = ?auto_246245 ?auto_246246 ) ) ( not ( = ?auto_246245 ?auto_246247 ) ) ( not ( = ?auto_246245 ?auto_246248 ) ) ( not ( = ?auto_246245 ?auto_246249 ) ) ( not ( = ?auto_246245 ?auto_246250 ) ) ( not ( = ?auto_246245 ?auto_246251 ) ) ( not ( = ?auto_246245 ?auto_246252 ) ) ( not ( = ?auto_246246 ?auto_246247 ) ) ( not ( = ?auto_246246 ?auto_246248 ) ) ( not ( = ?auto_246246 ?auto_246249 ) ) ( not ( = ?auto_246246 ?auto_246250 ) ) ( not ( = ?auto_246246 ?auto_246251 ) ) ( not ( = ?auto_246246 ?auto_246252 ) ) ( not ( = ?auto_246247 ?auto_246248 ) ) ( not ( = ?auto_246247 ?auto_246249 ) ) ( not ( = ?auto_246247 ?auto_246250 ) ) ( not ( = ?auto_246247 ?auto_246251 ) ) ( not ( = ?auto_246247 ?auto_246252 ) ) ( not ( = ?auto_246248 ?auto_246249 ) ) ( not ( = ?auto_246248 ?auto_246250 ) ) ( not ( = ?auto_246248 ?auto_246251 ) ) ( not ( = ?auto_246248 ?auto_246252 ) ) ( not ( = ?auto_246249 ?auto_246250 ) ) ( not ( = ?auto_246249 ?auto_246251 ) ) ( not ( = ?auto_246249 ?auto_246252 ) ) ( not ( = ?auto_246250 ?auto_246251 ) ) ( not ( = ?auto_246250 ?auto_246252 ) ) ( not ( = ?auto_246251 ?auto_246252 ) ) ( ON ?auto_246250 ?auto_246251 ) ( ON ?auto_246249 ?auto_246250 ) ( ON ?auto_246248 ?auto_246249 ) ( ON ?auto_246247 ?auto_246248 ) ( ON ?auto_246246 ?auto_246247 ) ( ON ?auto_246245 ?auto_246246 ) ( ON ?auto_246244 ?auto_246245 ) ( CLEAR ?auto_246242 ) ( ON ?auto_246243 ?auto_246244 ) ( CLEAR ?auto_246243 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_246240 ?auto_246241 ?auto_246242 ?auto_246243 )
      ( MAKE-12PILE ?auto_246240 ?auto_246241 ?auto_246242 ?auto_246243 ?auto_246244 ?auto_246245 ?auto_246246 ?auto_246247 ?auto_246248 ?auto_246249 ?auto_246250 ?auto_246251 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_246265 - BLOCK
      ?auto_246266 - BLOCK
      ?auto_246267 - BLOCK
      ?auto_246268 - BLOCK
      ?auto_246269 - BLOCK
      ?auto_246270 - BLOCK
      ?auto_246271 - BLOCK
      ?auto_246272 - BLOCK
      ?auto_246273 - BLOCK
      ?auto_246274 - BLOCK
      ?auto_246275 - BLOCK
      ?auto_246276 - BLOCK
    )
    :vars
    (
      ?auto_246277 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_246276 ?auto_246277 ) ( ON-TABLE ?auto_246265 ) ( ON ?auto_246266 ?auto_246265 ) ( ON ?auto_246267 ?auto_246266 ) ( not ( = ?auto_246265 ?auto_246266 ) ) ( not ( = ?auto_246265 ?auto_246267 ) ) ( not ( = ?auto_246265 ?auto_246268 ) ) ( not ( = ?auto_246265 ?auto_246269 ) ) ( not ( = ?auto_246265 ?auto_246270 ) ) ( not ( = ?auto_246265 ?auto_246271 ) ) ( not ( = ?auto_246265 ?auto_246272 ) ) ( not ( = ?auto_246265 ?auto_246273 ) ) ( not ( = ?auto_246265 ?auto_246274 ) ) ( not ( = ?auto_246265 ?auto_246275 ) ) ( not ( = ?auto_246265 ?auto_246276 ) ) ( not ( = ?auto_246265 ?auto_246277 ) ) ( not ( = ?auto_246266 ?auto_246267 ) ) ( not ( = ?auto_246266 ?auto_246268 ) ) ( not ( = ?auto_246266 ?auto_246269 ) ) ( not ( = ?auto_246266 ?auto_246270 ) ) ( not ( = ?auto_246266 ?auto_246271 ) ) ( not ( = ?auto_246266 ?auto_246272 ) ) ( not ( = ?auto_246266 ?auto_246273 ) ) ( not ( = ?auto_246266 ?auto_246274 ) ) ( not ( = ?auto_246266 ?auto_246275 ) ) ( not ( = ?auto_246266 ?auto_246276 ) ) ( not ( = ?auto_246266 ?auto_246277 ) ) ( not ( = ?auto_246267 ?auto_246268 ) ) ( not ( = ?auto_246267 ?auto_246269 ) ) ( not ( = ?auto_246267 ?auto_246270 ) ) ( not ( = ?auto_246267 ?auto_246271 ) ) ( not ( = ?auto_246267 ?auto_246272 ) ) ( not ( = ?auto_246267 ?auto_246273 ) ) ( not ( = ?auto_246267 ?auto_246274 ) ) ( not ( = ?auto_246267 ?auto_246275 ) ) ( not ( = ?auto_246267 ?auto_246276 ) ) ( not ( = ?auto_246267 ?auto_246277 ) ) ( not ( = ?auto_246268 ?auto_246269 ) ) ( not ( = ?auto_246268 ?auto_246270 ) ) ( not ( = ?auto_246268 ?auto_246271 ) ) ( not ( = ?auto_246268 ?auto_246272 ) ) ( not ( = ?auto_246268 ?auto_246273 ) ) ( not ( = ?auto_246268 ?auto_246274 ) ) ( not ( = ?auto_246268 ?auto_246275 ) ) ( not ( = ?auto_246268 ?auto_246276 ) ) ( not ( = ?auto_246268 ?auto_246277 ) ) ( not ( = ?auto_246269 ?auto_246270 ) ) ( not ( = ?auto_246269 ?auto_246271 ) ) ( not ( = ?auto_246269 ?auto_246272 ) ) ( not ( = ?auto_246269 ?auto_246273 ) ) ( not ( = ?auto_246269 ?auto_246274 ) ) ( not ( = ?auto_246269 ?auto_246275 ) ) ( not ( = ?auto_246269 ?auto_246276 ) ) ( not ( = ?auto_246269 ?auto_246277 ) ) ( not ( = ?auto_246270 ?auto_246271 ) ) ( not ( = ?auto_246270 ?auto_246272 ) ) ( not ( = ?auto_246270 ?auto_246273 ) ) ( not ( = ?auto_246270 ?auto_246274 ) ) ( not ( = ?auto_246270 ?auto_246275 ) ) ( not ( = ?auto_246270 ?auto_246276 ) ) ( not ( = ?auto_246270 ?auto_246277 ) ) ( not ( = ?auto_246271 ?auto_246272 ) ) ( not ( = ?auto_246271 ?auto_246273 ) ) ( not ( = ?auto_246271 ?auto_246274 ) ) ( not ( = ?auto_246271 ?auto_246275 ) ) ( not ( = ?auto_246271 ?auto_246276 ) ) ( not ( = ?auto_246271 ?auto_246277 ) ) ( not ( = ?auto_246272 ?auto_246273 ) ) ( not ( = ?auto_246272 ?auto_246274 ) ) ( not ( = ?auto_246272 ?auto_246275 ) ) ( not ( = ?auto_246272 ?auto_246276 ) ) ( not ( = ?auto_246272 ?auto_246277 ) ) ( not ( = ?auto_246273 ?auto_246274 ) ) ( not ( = ?auto_246273 ?auto_246275 ) ) ( not ( = ?auto_246273 ?auto_246276 ) ) ( not ( = ?auto_246273 ?auto_246277 ) ) ( not ( = ?auto_246274 ?auto_246275 ) ) ( not ( = ?auto_246274 ?auto_246276 ) ) ( not ( = ?auto_246274 ?auto_246277 ) ) ( not ( = ?auto_246275 ?auto_246276 ) ) ( not ( = ?auto_246275 ?auto_246277 ) ) ( not ( = ?auto_246276 ?auto_246277 ) ) ( ON ?auto_246275 ?auto_246276 ) ( ON ?auto_246274 ?auto_246275 ) ( ON ?auto_246273 ?auto_246274 ) ( ON ?auto_246272 ?auto_246273 ) ( ON ?auto_246271 ?auto_246272 ) ( ON ?auto_246270 ?auto_246271 ) ( ON ?auto_246269 ?auto_246270 ) ( CLEAR ?auto_246267 ) ( ON ?auto_246268 ?auto_246269 ) ( CLEAR ?auto_246268 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_246265 ?auto_246266 ?auto_246267 ?auto_246268 )
      ( MAKE-12PILE ?auto_246265 ?auto_246266 ?auto_246267 ?auto_246268 ?auto_246269 ?auto_246270 ?auto_246271 ?auto_246272 ?auto_246273 ?auto_246274 ?auto_246275 ?auto_246276 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_246290 - BLOCK
      ?auto_246291 - BLOCK
      ?auto_246292 - BLOCK
      ?auto_246293 - BLOCK
      ?auto_246294 - BLOCK
      ?auto_246295 - BLOCK
      ?auto_246296 - BLOCK
      ?auto_246297 - BLOCK
      ?auto_246298 - BLOCK
      ?auto_246299 - BLOCK
      ?auto_246300 - BLOCK
      ?auto_246301 - BLOCK
    )
    :vars
    (
      ?auto_246302 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_246301 ?auto_246302 ) ( ON-TABLE ?auto_246290 ) ( ON ?auto_246291 ?auto_246290 ) ( not ( = ?auto_246290 ?auto_246291 ) ) ( not ( = ?auto_246290 ?auto_246292 ) ) ( not ( = ?auto_246290 ?auto_246293 ) ) ( not ( = ?auto_246290 ?auto_246294 ) ) ( not ( = ?auto_246290 ?auto_246295 ) ) ( not ( = ?auto_246290 ?auto_246296 ) ) ( not ( = ?auto_246290 ?auto_246297 ) ) ( not ( = ?auto_246290 ?auto_246298 ) ) ( not ( = ?auto_246290 ?auto_246299 ) ) ( not ( = ?auto_246290 ?auto_246300 ) ) ( not ( = ?auto_246290 ?auto_246301 ) ) ( not ( = ?auto_246290 ?auto_246302 ) ) ( not ( = ?auto_246291 ?auto_246292 ) ) ( not ( = ?auto_246291 ?auto_246293 ) ) ( not ( = ?auto_246291 ?auto_246294 ) ) ( not ( = ?auto_246291 ?auto_246295 ) ) ( not ( = ?auto_246291 ?auto_246296 ) ) ( not ( = ?auto_246291 ?auto_246297 ) ) ( not ( = ?auto_246291 ?auto_246298 ) ) ( not ( = ?auto_246291 ?auto_246299 ) ) ( not ( = ?auto_246291 ?auto_246300 ) ) ( not ( = ?auto_246291 ?auto_246301 ) ) ( not ( = ?auto_246291 ?auto_246302 ) ) ( not ( = ?auto_246292 ?auto_246293 ) ) ( not ( = ?auto_246292 ?auto_246294 ) ) ( not ( = ?auto_246292 ?auto_246295 ) ) ( not ( = ?auto_246292 ?auto_246296 ) ) ( not ( = ?auto_246292 ?auto_246297 ) ) ( not ( = ?auto_246292 ?auto_246298 ) ) ( not ( = ?auto_246292 ?auto_246299 ) ) ( not ( = ?auto_246292 ?auto_246300 ) ) ( not ( = ?auto_246292 ?auto_246301 ) ) ( not ( = ?auto_246292 ?auto_246302 ) ) ( not ( = ?auto_246293 ?auto_246294 ) ) ( not ( = ?auto_246293 ?auto_246295 ) ) ( not ( = ?auto_246293 ?auto_246296 ) ) ( not ( = ?auto_246293 ?auto_246297 ) ) ( not ( = ?auto_246293 ?auto_246298 ) ) ( not ( = ?auto_246293 ?auto_246299 ) ) ( not ( = ?auto_246293 ?auto_246300 ) ) ( not ( = ?auto_246293 ?auto_246301 ) ) ( not ( = ?auto_246293 ?auto_246302 ) ) ( not ( = ?auto_246294 ?auto_246295 ) ) ( not ( = ?auto_246294 ?auto_246296 ) ) ( not ( = ?auto_246294 ?auto_246297 ) ) ( not ( = ?auto_246294 ?auto_246298 ) ) ( not ( = ?auto_246294 ?auto_246299 ) ) ( not ( = ?auto_246294 ?auto_246300 ) ) ( not ( = ?auto_246294 ?auto_246301 ) ) ( not ( = ?auto_246294 ?auto_246302 ) ) ( not ( = ?auto_246295 ?auto_246296 ) ) ( not ( = ?auto_246295 ?auto_246297 ) ) ( not ( = ?auto_246295 ?auto_246298 ) ) ( not ( = ?auto_246295 ?auto_246299 ) ) ( not ( = ?auto_246295 ?auto_246300 ) ) ( not ( = ?auto_246295 ?auto_246301 ) ) ( not ( = ?auto_246295 ?auto_246302 ) ) ( not ( = ?auto_246296 ?auto_246297 ) ) ( not ( = ?auto_246296 ?auto_246298 ) ) ( not ( = ?auto_246296 ?auto_246299 ) ) ( not ( = ?auto_246296 ?auto_246300 ) ) ( not ( = ?auto_246296 ?auto_246301 ) ) ( not ( = ?auto_246296 ?auto_246302 ) ) ( not ( = ?auto_246297 ?auto_246298 ) ) ( not ( = ?auto_246297 ?auto_246299 ) ) ( not ( = ?auto_246297 ?auto_246300 ) ) ( not ( = ?auto_246297 ?auto_246301 ) ) ( not ( = ?auto_246297 ?auto_246302 ) ) ( not ( = ?auto_246298 ?auto_246299 ) ) ( not ( = ?auto_246298 ?auto_246300 ) ) ( not ( = ?auto_246298 ?auto_246301 ) ) ( not ( = ?auto_246298 ?auto_246302 ) ) ( not ( = ?auto_246299 ?auto_246300 ) ) ( not ( = ?auto_246299 ?auto_246301 ) ) ( not ( = ?auto_246299 ?auto_246302 ) ) ( not ( = ?auto_246300 ?auto_246301 ) ) ( not ( = ?auto_246300 ?auto_246302 ) ) ( not ( = ?auto_246301 ?auto_246302 ) ) ( ON ?auto_246300 ?auto_246301 ) ( ON ?auto_246299 ?auto_246300 ) ( ON ?auto_246298 ?auto_246299 ) ( ON ?auto_246297 ?auto_246298 ) ( ON ?auto_246296 ?auto_246297 ) ( ON ?auto_246295 ?auto_246296 ) ( ON ?auto_246294 ?auto_246295 ) ( ON ?auto_246293 ?auto_246294 ) ( CLEAR ?auto_246291 ) ( ON ?auto_246292 ?auto_246293 ) ( CLEAR ?auto_246292 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_246290 ?auto_246291 ?auto_246292 )
      ( MAKE-12PILE ?auto_246290 ?auto_246291 ?auto_246292 ?auto_246293 ?auto_246294 ?auto_246295 ?auto_246296 ?auto_246297 ?auto_246298 ?auto_246299 ?auto_246300 ?auto_246301 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_246315 - BLOCK
      ?auto_246316 - BLOCK
      ?auto_246317 - BLOCK
      ?auto_246318 - BLOCK
      ?auto_246319 - BLOCK
      ?auto_246320 - BLOCK
      ?auto_246321 - BLOCK
      ?auto_246322 - BLOCK
      ?auto_246323 - BLOCK
      ?auto_246324 - BLOCK
      ?auto_246325 - BLOCK
      ?auto_246326 - BLOCK
    )
    :vars
    (
      ?auto_246327 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_246326 ?auto_246327 ) ( ON-TABLE ?auto_246315 ) ( ON ?auto_246316 ?auto_246315 ) ( not ( = ?auto_246315 ?auto_246316 ) ) ( not ( = ?auto_246315 ?auto_246317 ) ) ( not ( = ?auto_246315 ?auto_246318 ) ) ( not ( = ?auto_246315 ?auto_246319 ) ) ( not ( = ?auto_246315 ?auto_246320 ) ) ( not ( = ?auto_246315 ?auto_246321 ) ) ( not ( = ?auto_246315 ?auto_246322 ) ) ( not ( = ?auto_246315 ?auto_246323 ) ) ( not ( = ?auto_246315 ?auto_246324 ) ) ( not ( = ?auto_246315 ?auto_246325 ) ) ( not ( = ?auto_246315 ?auto_246326 ) ) ( not ( = ?auto_246315 ?auto_246327 ) ) ( not ( = ?auto_246316 ?auto_246317 ) ) ( not ( = ?auto_246316 ?auto_246318 ) ) ( not ( = ?auto_246316 ?auto_246319 ) ) ( not ( = ?auto_246316 ?auto_246320 ) ) ( not ( = ?auto_246316 ?auto_246321 ) ) ( not ( = ?auto_246316 ?auto_246322 ) ) ( not ( = ?auto_246316 ?auto_246323 ) ) ( not ( = ?auto_246316 ?auto_246324 ) ) ( not ( = ?auto_246316 ?auto_246325 ) ) ( not ( = ?auto_246316 ?auto_246326 ) ) ( not ( = ?auto_246316 ?auto_246327 ) ) ( not ( = ?auto_246317 ?auto_246318 ) ) ( not ( = ?auto_246317 ?auto_246319 ) ) ( not ( = ?auto_246317 ?auto_246320 ) ) ( not ( = ?auto_246317 ?auto_246321 ) ) ( not ( = ?auto_246317 ?auto_246322 ) ) ( not ( = ?auto_246317 ?auto_246323 ) ) ( not ( = ?auto_246317 ?auto_246324 ) ) ( not ( = ?auto_246317 ?auto_246325 ) ) ( not ( = ?auto_246317 ?auto_246326 ) ) ( not ( = ?auto_246317 ?auto_246327 ) ) ( not ( = ?auto_246318 ?auto_246319 ) ) ( not ( = ?auto_246318 ?auto_246320 ) ) ( not ( = ?auto_246318 ?auto_246321 ) ) ( not ( = ?auto_246318 ?auto_246322 ) ) ( not ( = ?auto_246318 ?auto_246323 ) ) ( not ( = ?auto_246318 ?auto_246324 ) ) ( not ( = ?auto_246318 ?auto_246325 ) ) ( not ( = ?auto_246318 ?auto_246326 ) ) ( not ( = ?auto_246318 ?auto_246327 ) ) ( not ( = ?auto_246319 ?auto_246320 ) ) ( not ( = ?auto_246319 ?auto_246321 ) ) ( not ( = ?auto_246319 ?auto_246322 ) ) ( not ( = ?auto_246319 ?auto_246323 ) ) ( not ( = ?auto_246319 ?auto_246324 ) ) ( not ( = ?auto_246319 ?auto_246325 ) ) ( not ( = ?auto_246319 ?auto_246326 ) ) ( not ( = ?auto_246319 ?auto_246327 ) ) ( not ( = ?auto_246320 ?auto_246321 ) ) ( not ( = ?auto_246320 ?auto_246322 ) ) ( not ( = ?auto_246320 ?auto_246323 ) ) ( not ( = ?auto_246320 ?auto_246324 ) ) ( not ( = ?auto_246320 ?auto_246325 ) ) ( not ( = ?auto_246320 ?auto_246326 ) ) ( not ( = ?auto_246320 ?auto_246327 ) ) ( not ( = ?auto_246321 ?auto_246322 ) ) ( not ( = ?auto_246321 ?auto_246323 ) ) ( not ( = ?auto_246321 ?auto_246324 ) ) ( not ( = ?auto_246321 ?auto_246325 ) ) ( not ( = ?auto_246321 ?auto_246326 ) ) ( not ( = ?auto_246321 ?auto_246327 ) ) ( not ( = ?auto_246322 ?auto_246323 ) ) ( not ( = ?auto_246322 ?auto_246324 ) ) ( not ( = ?auto_246322 ?auto_246325 ) ) ( not ( = ?auto_246322 ?auto_246326 ) ) ( not ( = ?auto_246322 ?auto_246327 ) ) ( not ( = ?auto_246323 ?auto_246324 ) ) ( not ( = ?auto_246323 ?auto_246325 ) ) ( not ( = ?auto_246323 ?auto_246326 ) ) ( not ( = ?auto_246323 ?auto_246327 ) ) ( not ( = ?auto_246324 ?auto_246325 ) ) ( not ( = ?auto_246324 ?auto_246326 ) ) ( not ( = ?auto_246324 ?auto_246327 ) ) ( not ( = ?auto_246325 ?auto_246326 ) ) ( not ( = ?auto_246325 ?auto_246327 ) ) ( not ( = ?auto_246326 ?auto_246327 ) ) ( ON ?auto_246325 ?auto_246326 ) ( ON ?auto_246324 ?auto_246325 ) ( ON ?auto_246323 ?auto_246324 ) ( ON ?auto_246322 ?auto_246323 ) ( ON ?auto_246321 ?auto_246322 ) ( ON ?auto_246320 ?auto_246321 ) ( ON ?auto_246319 ?auto_246320 ) ( ON ?auto_246318 ?auto_246319 ) ( CLEAR ?auto_246316 ) ( ON ?auto_246317 ?auto_246318 ) ( CLEAR ?auto_246317 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_246315 ?auto_246316 ?auto_246317 )
      ( MAKE-12PILE ?auto_246315 ?auto_246316 ?auto_246317 ?auto_246318 ?auto_246319 ?auto_246320 ?auto_246321 ?auto_246322 ?auto_246323 ?auto_246324 ?auto_246325 ?auto_246326 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_246340 - BLOCK
      ?auto_246341 - BLOCK
      ?auto_246342 - BLOCK
      ?auto_246343 - BLOCK
      ?auto_246344 - BLOCK
      ?auto_246345 - BLOCK
      ?auto_246346 - BLOCK
      ?auto_246347 - BLOCK
      ?auto_246348 - BLOCK
      ?auto_246349 - BLOCK
      ?auto_246350 - BLOCK
      ?auto_246351 - BLOCK
    )
    :vars
    (
      ?auto_246352 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_246351 ?auto_246352 ) ( ON-TABLE ?auto_246340 ) ( not ( = ?auto_246340 ?auto_246341 ) ) ( not ( = ?auto_246340 ?auto_246342 ) ) ( not ( = ?auto_246340 ?auto_246343 ) ) ( not ( = ?auto_246340 ?auto_246344 ) ) ( not ( = ?auto_246340 ?auto_246345 ) ) ( not ( = ?auto_246340 ?auto_246346 ) ) ( not ( = ?auto_246340 ?auto_246347 ) ) ( not ( = ?auto_246340 ?auto_246348 ) ) ( not ( = ?auto_246340 ?auto_246349 ) ) ( not ( = ?auto_246340 ?auto_246350 ) ) ( not ( = ?auto_246340 ?auto_246351 ) ) ( not ( = ?auto_246340 ?auto_246352 ) ) ( not ( = ?auto_246341 ?auto_246342 ) ) ( not ( = ?auto_246341 ?auto_246343 ) ) ( not ( = ?auto_246341 ?auto_246344 ) ) ( not ( = ?auto_246341 ?auto_246345 ) ) ( not ( = ?auto_246341 ?auto_246346 ) ) ( not ( = ?auto_246341 ?auto_246347 ) ) ( not ( = ?auto_246341 ?auto_246348 ) ) ( not ( = ?auto_246341 ?auto_246349 ) ) ( not ( = ?auto_246341 ?auto_246350 ) ) ( not ( = ?auto_246341 ?auto_246351 ) ) ( not ( = ?auto_246341 ?auto_246352 ) ) ( not ( = ?auto_246342 ?auto_246343 ) ) ( not ( = ?auto_246342 ?auto_246344 ) ) ( not ( = ?auto_246342 ?auto_246345 ) ) ( not ( = ?auto_246342 ?auto_246346 ) ) ( not ( = ?auto_246342 ?auto_246347 ) ) ( not ( = ?auto_246342 ?auto_246348 ) ) ( not ( = ?auto_246342 ?auto_246349 ) ) ( not ( = ?auto_246342 ?auto_246350 ) ) ( not ( = ?auto_246342 ?auto_246351 ) ) ( not ( = ?auto_246342 ?auto_246352 ) ) ( not ( = ?auto_246343 ?auto_246344 ) ) ( not ( = ?auto_246343 ?auto_246345 ) ) ( not ( = ?auto_246343 ?auto_246346 ) ) ( not ( = ?auto_246343 ?auto_246347 ) ) ( not ( = ?auto_246343 ?auto_246348 ) ) ( not ( = ?auto_246343 ?auto_246349 ) ) ( not ( = ?auto_246343 ?auto_246350 ) ) ( not ( = ?auto_246343 ?auto_246351 ) ) ( not ( = ?auto_246343 ?auto_246352 ) ) ( not ( = ?auto_246344 ?auto_246345 ) ) ( not ( = ?auto_246344 ?auto_246346 ) ) ( not ( = ?auto_246344 ?auto_246347 ) ) ( not ( = ?auto_246344 ?auto_246348 ) ) ( not ( = ?auto_246344 ?auto_246349 ) ) ( not ( = ?auto_246344 ?auto_246350 ) ) ( not ( = ?auto_246344 ?auto_246351 ) ) ( not ( = ?auto_246344 ?auto_246352 ) ) ( not ( = ?auto_246345 ?auto_246346 ) ) ( not ( = ?auto_246345 ?auto_246347 ) ) ( not ( = ?auto_246345 ?auto_246348 ) ) ( not ( = ?auto_246345 ?auto_246349 ) ) ( not ( = ?auto_246345 ?auto_246350 ) ) ( not ( = ?auto_246345 ?auto_246351 ) ) ( not ( = ?auto_246345 ?auto_246352 ) ) ( not ( = ?auto_246346 ?auto_246347 ) ) ( not ( = ?auto_246346 ?auto_246348 ) ) ( not ( = ?auto_246346 ?auto_246349 ) ) ( not ( = ?auto_246346 ?auto_246350 ) ) ( not ( = ?auto_246346 ?auto_246351 ) ) ( not ( = ?auto_246346 ?auto_246352 ) ) ( not ( = ?auto_246347 ?auto_246348 ) ) ( not ( = ?auto_246347 ?auto_246349 ) ) ( not ( = ?auto_246347 ?auto_246350 ) ) ( not ( = ?auto_246347 ?auto_246351 ) ) ( not ( = ?auto_246347 ?auto_246352 ) ) ( not ( = ?auto_246348 ?auto_246349 ) ) ( not ( = ?auto_246348 ?auto_246350 ) ) ( not ( = ?auto_246348 ?auto_246351 ) ) ( not ( = ?auto_246348 ?auto_246352 ) ) ( not ( = ?auto_246349 ?auto_246350 ) ) ( not ( = ?auto_246349 ?auto_246351 ) ) ( not ( = ?auto_246349 ?auto_246352 ) ) ( not ( = ?auto_246350 ?auto_246351 ) ) ( not ( = ?auto_246350 ?auto_246352 ) ) ( not ( = ?auto_246351 ?auto_246352 ) ) ( ON ?auto_246350 ?auto_246351 ) ( ON ?auto_246349 ?auto_246350 ) ( ON ?auto_246348 ?auto_246349 ) ( ON ?auto_246347 ?auto_246348 ) ( ON ?auto_246346 ?auto_246347 ) ( ON ?auto_246345 ?auto_246346 ) ( ON ?auto_246344 ?auto_246345 ) ( ON ?auto_246343 ?auto_246344 ) ( ON ?auto_246342 ?auto_246343 ) ( CLEAR ?auto_246340 ) ( ON ?auto_246341 ?auto_246342 ) ( CLEAR ?auto_246341 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_246340 ?auto_246341 )
      ( MAKE-12PILE ?auto_246340 ?auto_246341 ?auto_246342 ?auto_246343 ?auto_246344 ?auto_246345 ?auto_246346 ?auto_246347 ?auto_246348 ?auto_246349 ?auto_246350 ?auto_246351 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_246365 - BLOCK
      ?auto_246366 - BLOCK
      ?auto_246367 - BLOCK
      ?auto_246368 - BLOCK
      ?auto_246369 - BLOCK
      ?auto_246370 - BLOCK
      ?auto_246371 - BLOCK
      ?auto_246372 - BLOCK
      ?auto_246373 - BLOCK
      ?auto_246374 - BLOCK
      ?auto_246375 - BLOCK
      ?auto_246376 - BLOCK
    )
    :vars
    (
      ?auto_246377 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_246376 ?auto_246377 ) ( ON-TABLE ?auto_246365 ) ( not ( = ?auto_246365 ?auto_246366 ) ) ( not ( = ?auto_246365 ?auto_246367 ) ) ( not ( = ?auto_246365 ?auto_246368 ) ) ( not ( = ?auto_246365 ?auto_246369 ) ) ( not ( = ?auto_246365 ?auto_246370 ) ) ( not ( = ?auto_246365 ?auto_246371 ) ) ( not ( = ?auto_246365 ?auto_246372 ) ) ( not ( = ?auto_246365 ?auto_246373 ) ) ( not ( = ?auto_246365 ?auto_246374 ) ) ( not ( = ?auto_246365 ?auto_246375 ) ) ( not ( = ?auto_246365 ?auto_246376 ) ) ( not ( = ?auto_246365 ?auto_246377 ) ) ( not ( = ?auto_246366 ?auto_246367 ) ) ( not ( = ?auto_246366 ?auto_246368 ) ) ( not ( = ?auto_246366 ?auto_246369 ) ) ( not ( = ?auto_246366 ?auto_246370 ) ) ( not ( = ?auto_246366 ?auto_246371 ) ) ( not ( = ?auto_246366 ?auto_246372 ) ) ( not ( = ?auto_246366 ?auto_246373 ) ) ( not ( = ?auto_246366 ?auto_246374 ) ) ( not ( = ?auto_246366 ?auto_246375 ) ) ( not ( = ?auto_246366 ?auto_246376 ) ) ( not ( = ?auto_246366 ?auto_246377 ) ) ( not ( = ?auto_246367 ?auto_246368 ) ) ( not ( = ?auto_246367 ?auto_246369 ) ) ( not ( = ?auto_246367 ?auto_246370 ) ) ( not ( = ?auto_246367 ?auto_246371 ) ) ( not ( = ?auto_246367 ?auto_246372 ) ) ( not ( = ?auto_246367 ?auto_246373 ) ) ( not ( = ?auto_246367 ?auto_246374 ) ) ( not ( = ?auto_246367 ?auto_246375 ) ) ( not ( = ?auto_246367 ?auto_246376 ) ) ( not ( = ?auto_246367 ?auto_246377 ) ) ( not ( = ?auto_246368 ?auto_246369 ) ) ( not ( = ?auto_246368 ?auto_246370 ) ) ( not ( = ?auto_246368 ?auto_246371 ) ) ( not ( = ?auto_246368 ?auto_246372 ) ) ( not ( = ?auto_246368 ?auto_246373 ) ) ( not ( = ?auto_246368 ?auto_246374 ) ) ( not ( = ?auto_246368 ?auto_246375 ) ) ( not ( = ?auto_246368 ?auto_246376 ) ) ( not ( = ?auto_246368 ?auto_246377 ) ) ( not ( = ?auto_246369 ?auto_246370 ) ) ( not ( = ?auto_246369 ?auto_246371 ) ) ( not ( = ?auto_246369 ?auto_246372 ) ) ( not ( = ?auto_246369 ?auto_246373 ) ) ( not ( = ?auto_246369 ?auto_246374 ) ) ( not ( = ?auto_246369 ?auto_246375 ) ) ( not ( = ?auto_246369 ?auto_246376 ) ) ( not ( = ?auto_246369 ?auto_246377 ) ) ( not ( = ?auto_246370 ?auto_246371 ) ) ( not ( = ?auto_246370 ?auto_246372 ) ) ( not ( = ?auto_246370 ?auto_246373 ) ) ( not ( = ?auto_246370 ?auto_246374 ) ) ( not ( = ?auto_246370 ?auto_246375 ) ) ( not ( = ?auto_246370 ?auto_246376 ) ) ( not ( = ?auto_246370 ?auto_246377 ) ) ( not ( = ?auto_246371 ?auto_246372 ) ) ( not ( = ?auto_246371 ?auto_246373 ) ) ( not ( = ?auto_246371 ?auto_246374 ) ) ( not ( = ?auto_246371 ?auto_246375 ) ) ( not ( = ?auto_246371 ?auto_246376 ) ) ( not ( = ?auto_246371 ?auto_246377 ) ) ( not ( = ?auto_246372 ?auto_246373 ) ) ( not ( = ?auto_246372 ?auto_246374 ) ) ( not ( = ?auto_246372 ?auto_246375 ) ) ( not ( = ?auto_246372 ?auto_246376 ) ) ( not ( = ?auto_246372 ?auto_246377 ) ) ( not ( = ?auto_246373 ?auto_246374 ) ) ( not ( = ?auto_246373 ?auto_246375 ) ) ( not ( = ?auto_246373 ?auto_246376 ) ) ( not ( = ?auto_246373 ?auto_246377 ) ) ( not ( = ?auto_246374 ?auto_246375 ) ) ( not ( = ?auto_246374 ?auto_246376 ) ) ( not ( = ?auto_246374 ?auto_246377 ) ) ( not ( = ?auto_246375 ?auto_246376 ) ) ( not ( = ?auto_246375 ?auto_246377 ) ) ( not ( = ?auto_246376 ?auto_246377 ) ) ( ON ?auto_246375 ?auto_246376 ) ( ON ?auto_246374 ?auto_246375 ) ( ON ?auto_246373 ?auto_246374 ) ( ON ?auto_246372 ?auto_246373 ) ( ON ?auto_246371 ?auto_246372 ) ( ON ?auto_246370 ?auto_246371 ) ( ON ?auto_246369 ?auto_246370 ) ( ON ?auto_246368 ?auto_246369 ) ( ON ?auto_246367 ?auto_246368 ) ( CLEAR ?auto_246365 ) ( ON ?auto_246366 ?auto_246367 ) ( CLEAR ?auto_246366 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_246365 ?auto_246366 )
      ( MAKE-12PILE ?auto_246365 ?auto_246366 ?auto_246367 ?auto_246368 ?auto_246369 ?auto_246370 ?auto_246371 ?auto_246372 ?auto_246373 ?auto_246374 ?auto_246375 ?auto_246376 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_246390 - BLOCK
      ?auto_246391 - BLOCK
      ?auto_246392 - BLOCK
      ?auto_246393 - BLOCK
      ?auto_246394 - BLOCK
      ?auto_246395 - BLOCK
      ?auto_246396 - BLOCK
      ?auto_246397 - BLOCK
      ?auto_246398 - BLOCK
      ?auto_246399 - BLOCK
      ?auto_246400 - BLOCK
      ?auto_246401 - BLOCK
    )
    :vars
    (
      ?auto_246402 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_246401 ?auto_246402 ) ( not ( = ?auto_246390 ?auto_246391 ) ) ( not ( = ?auto_246390 ?auto_246392 ) ) ( not ( = ?auto_246390 ?auto_246393 ) ) ( not ( = ?auto_246390 ?auto_246394 ) ) ( not ( = ?auto_246390 ?auto_246395 ) ) ( not ( = ?auto_246390 ?auto_246396 ) ) ( not ( = ?auto_246390 ?auto_246397 ) ) ( not ( = ?auto_246390 ?auto_246398 ) ) ( not ( = ?auto_246390 ?auto_246399 ) ) ( not ( = ?auto_246390 ?auto_246400 ) ) ( not ( = ?auto_246390 ?auto_246401 ) ) ( not ( = ?auto_246390 ?auto_246402 ) ) ( not ( = ?auto_246391 ?auto_246392 ) ) ( not ( = ?auto_246391 ?auto_246393 ) ) ( not ( = ?auto_246391 ?auto_246394 ) ) ( not ( = ?auto_246391 ?auto_246395 ) ) ( not ( = ?auto_246391 ?auto_246396 ) ) ( not ( = ?auto_246391 ?auto_246397 ) ) ( not ( = ?auto_246391 ?auto_246398 ) ) ( not ( = ?auto_246391 ?auto_246399 ) ) ( not ( = ?auto_246391 ?auto_246400 ) ) ( not ( = ?auto_246391 ?auto_246401 ) ) ( not ( = ?auto_246391 ?auto_246402 ) ) ( not ( = ?auto_246392 ?auto_246393 ) ) ( not ( = ?auto_246392 ?auto_246394 ) ) ( not ( = ?auto_246392 ?auto_246395 ) ) ( not ( = ?auto_246392 ?auto_246396 ) ) ( not ( = ?auto_246392 ?auto_246397 ) ) ( not ( = ?auto_246392 ?auto_246398 ) ) ( not ( = ?auto_246392 ?auto_246399 ) ) ( not ( = ?auto_246392 ?auto_246400 ) ) ( not ( = ?auto_246392 ?auto_246401 ) ) ( not ( = ?auto_246392 ?auto_246402 ) ) ( not ( = ?auto_246393 ?auto_246394 ) ) ( not ( = ?auto_246393 ?auto_246395 ) ) ( not ( = ?auto_246393 ?auto_246396 ) ) ( not ( = ?auto_246393 ?auto_246397 ) ) ( not ( = ?auto_246393 ?auto_246398 ) ) ( not ( = ?auto_246393 ?auto_246399 ) ) ( not ( = ?auto_246393 ?auto_246400 ) ) ( not ( = ?auto_246393 ?auto_246401 ) ) ( not ( = ?auto_246393 ?auto_246402 ) ) ( not ( = ?auto_246394 ?auto_246395 ) ) ( not ( = ?auto_246394 ?auto_246396 ) ) ( not ( = ?auto_246394 ?auto_246397 ) ) ( not ( = ?auto_246394 ?auto_246398 ) ) ( not ( = ?auto_246394 ?auto_246399 ) ) ( not ( = ?auto_246394 ?auto_246400 ) ) ( not ( = ?auto_246394 ?auto_246401 ) ) ( not ( = ?auto_246394 ?auto_246402 ) ) ( not ( = ?auto_246395 ?auto_246396 ) ) ( not ( = ?auto_246395 ?auto_246397 ) ) ( not ( = ?auto_246395 ?auto_246398 ) ) ( not ( = ?auto_246395 ?auto_246399 ) ) ( not ( = ?auto_246395 ?auto_246400 ) ) ( not ( = ?auto_246395 ?auto_246401 ) ) ( not ( = ?auto_246395 ?auto_246402 ) ) ( not ( = ?auto_246396 ?auto_246397 ) ) ( not ( = ?auto_246396 ?auto_246398 ) ) ( not ( = ?auto_246396 ?auto_246399 ) ) ( not ( = ?auto_246396 ?auto_246400 ) ) ( not ( = ?auto_246396 ?auto_246401 ) ) ( not ( = ?auto_246396 ?auto_246402 ) ) ( not ( = ?auto_246397 ?auto_246398 ) ) ( not ( = ?auto_246397 ?auto_246399 ) ) ( not ( = ?auto_246397 ?auto_246400 ) ) ( not ( = ?auto_246397 ?auto_246401 ) ) ( not ( = ?auto_246397 ?auto_246402 ) ) ( not ( = ?auto_246398 ?auto_246399 ) ) ( not ( = ?auto_246398 ?auto_246400 ) ) ( not ( = ?auto_246398 ?auto_246401 ) ) ( not ( = ?auto_246398 ?auto_246402 ) ) ( not ( = ?auto_246399 ?auto_246400 ) ) ( not ( = ?auto_246399 ?auto_246401 ) ) ( not ( = ?auto_246399 ?auto_246402 ) ) ( not ( = ?auto_246400 ?auto_246401 ) ) ( not ( = ?auto_246400 ?auto_246402 ) ) ( not ( = ?auto_246401 ?auto_246402 ) ) ( ON ?auto_246400 ?auto_246401 ) ( ON ?auto_246399 ?auto_246400 ) ( ON ?auto_246398 ?auto_246399 ) ( ON ?auto_246397 ?auto_246398 ) ( ON ?auto_246396 ?auto_246397 ) ( ON ?auto_246395 ?auto_246396 ) ( ON ?auto_246394 ?auto_246395 ) ( ON ?auto_246393 ?auto_246394 ) ( ON ?auto_246392 ?auto_246393 ) ( ON ?auto_246391 ?auto_246392 ) ( ON ?auto_246390 ?auto_246391 ) ( CLEAR ?auto_246390 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_246390 )
      ( MAKE-12PILE ?auto_246390 ?auto_246391 ?auto_246392 ?auto_246393 ?auto_246394 ?auto_246395 ?auto_246396 ?auto_246397 ?auto_246398 ?auto_246399 ?auto_246400 ?auto_246401 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_246415 - BLOCK
      ?auto_246416 - BLOCK
      ?auto_246417 - BLOCK
      ?auto_246418 - BLOCK
      ?auto_246419 - BLOCK
      ?auto_246420 - BLOCK
      ?auto_246421 - BLOCK
      ?auto_246422 - BLOCK
      ?auto_246423 - BLOCK
      ?auto_246424 - BLOCK
      ?auto_246425 - BLOCK
      ?auto_246426 - BLOCK
    )
    :vars
    (
      ?auto_246427 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_246426 ?auto_246427 ) ( not ( = ?auto_246415 ?auto_246416 ) ) ( not ( = ?auto_246415 ?auto_246417 ) ) ( not ( = ?auto_246415 ?auto_246418 ) ) ( not ( = ?auto_246415 ?auto_246419 ) ) ( not ( = ?auto_246415 ?auto_246420 ) ) ( not ( = ?auto_246415 ?auto_246421 ) ) ( not ( = ?auto_246415 ?auto_246422 ) ) ( not ( = ?auto_246415 ?auto_246423 ) ) ( not ( = ?auto_246415 ?auto_246424 ) ) ( not ( = ?auto_246415 ?auto_246425 ) ) ( not ( = ?auto_246415 ?auto_246426 ) ) ( not ( = ?auto_246415 ?auto_246427 ) ) ( not ( = ?auto_246416 ?auto_246417 ) ) ( not ( = ?auto_246416 ?auto_246418 ) ) ( not ( = ?auto_246416 ?auto_246419 ) ) ( not ( = ?auto_246416 ?auto_246420 ) ) ( not ( = ?auto_246416 ?auto_246421 ) ) ( not ( = ?auto_246416 ?auto_246422 ) ) ( not ( = ?auto_246416 ?auto_246423 ) ) ( not ( = ?auto_246416 ?auto_246424 ) ) ( not ( = ?auto_246416 ?auto_246425 ) ) ( not ( = ?auto_246416 ?auto_246426 ) ) ( not ( = ?auto_246416 ?auto_246427 ) ) ( not ( = ?auto_246417 ?auto_246418 ) ) ( not ( = ?auto_246417 ?auto_246419 ) ) ( not ( = ?auto_246417 ?auto_246420 ) ) ( not ( = ?auto_246417 ?auto_246421 ) ) ( not ( = ?auto_246417 ?auto_246422 ) ) ( not ( = ?auto_246417 ?auto_246423 ) ) ( not ( = ?auto_246417 ?auto_246424 ) ) ( not ( = ?auto_246417 ?auto_246425 ) ) ( not ( = ?auto_246417 ?auto_246426 ) ) ( not ( = ?auto_246417 ?auto_246427 ) ) ( not ( = ?auto_246418 ?auto_246419 ) ) ( not ( = ?auto_246418 ?auto_246420 ) ) ( not ( = ?auto_246418 ?auto_246421 ) ) ( not ( = ?auto_246418 ?auto_246422 ) ) ( not ( = ?auto_246418 ?auto_246423 ) ) ( not ( = ?auto_246418 ?auto_246424 ) ) ( not ( = ?auto_246418 ?auto_246425 ) ) ( not ( = ?auto_246418 ?auto_246426 ) ) ( not ( = ?auto_246418 ?auto_246427 ) ) ( not ( = ?auto_246419 ?auto_246420 ) ) ( not ( = ?auto_246419 ?auto_246421 ) ) ( not ( = ?auto_246419 ?auto_246422 ) ) ( not ( = ?auto_246419 ?auto_246423 ) ) ( not ( = ?auto_246419 ?auto_246424 ) ) ( not ( = ?auto_246419 ?auto_246425 ) ) ( not ( = ?auto_246419 ?auto_246426 ) ) ( not ( = ?auto_246419 ?auto_246427 ) ) ( not ( = ?auto_246420 ?auto_246421 ) ) ( not ( = ?auto_246420 ?auto_246422 ) ) ( not ( = ?auto_246420 ?auto_246423 ) ) ( not ( = ?auto_246420 ?auto_246424 ) ) ( not ( = ?auto_246420 ?auto_246425 ) ) ( not ( = ?auto_246420 ?auto_246426 ) ) ( not ( = ?auto_246420 ?auto_246427 ) ) ( not ( = ?auto_246421 ?auto_246422 ) ) ( not ( = ?auto_246421 ?auto_246423 ) ) ( not ( = ?auto_246421 ?auto_246424 ) ) ( not ( = ?auto_246421 ?auto_246425 ) ) ( not ( = ?auto_246421 ?auto_246426 ) ) ( not ( = ?auto_246421 ?auto_246427 ) ) ( not ( = ?auto_246422 ?auto_246423 ) ) ( not ( = ?auto_246422 ?auto_246424 ) ) ( not ( = ?auto_246422 ?auto_246425 ) ) ( not ( = ?auto_246422 ?auto_246426 ) ) ( not ( = ?auto_246422 ?auto_246427 ) ) ( not ( = ?auto_246423 ?auto_246424 ) ) ( not ( = ?auto_246423 ?auto_246425 ) ) ( not ( = ?auto_246423 ?auto_246426 ) ) ( not ( = ?auto_246423 ?auto_246427 ) ) ( not ( = ?auto_246424 ?auto_246425 ) ) ( not ( = ?auto_246424 ?auto_246426 ) ) ( not ( = ?auto_246424 ?auto_246427 ) ) ( not ( = ?auto_246425 ?auto_246426 ) ) ( not ( = ?auto_246425 ?auto_246427 ) ) ( not ( = ?auto_246426 ?auto_246427 ) ) ( ON ?auto_246425 ?auto_246426 ) ( ON ?auto_246424 ?auto_246425 ) ( ON ?auto_246423 ?auto_246424 ) ( ON ?auto_246422 ?auto_246423 ) ( ON ?auto_246421 ?auto_246422 ) ( ON ?auto_246420 ?auto_246421 ) ( ON ?auto_246419 ?auto_246420 ) ( ON ?auto_246418 ?auto_246419 ) ( ON ?auto_246417 ?auto_246418 ) ( ON ?auto_246416 ?auto_246417 ) ( ON ?auto_246415 ?auto_246416 ) ( CLEAR ?auto_246415 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_246415 )
      ( MAKE-12PILE ?auto_246415 ?auto_246416 ?auto_246417 ?auto_246418 ?auto_246419 ?auto_246420 ?auto_246421 ?auto_246422 ?auto_246423 ?auto_246424 ?auto_246425 ?auto_246426 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_246441 - BLOCK
      ?auto_246442 - BLOCK
      ?auto_246443 - BLOCK
      ?auto_246444 - BLOCK
      ?auto_246445 - BLOCK
      ?auto_246446 - BLOCK
      ?auto_246447 - BLOCK
      ?auto_246448 - BLOCK
      ?auto_246449 - BLOCK
      ?auto_246450 - BLOCK
      ?auto_246451 - BLOCK
      ?auto_246452 - BLOCK
      ?auto_246453 - BLOCK
    )
    :vars
    (
      ?auto_246454 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_246452 ) ( ON ?auto_246453 ?auto_246454 ) ( CLEAR ?auto_246453 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_246441 ) ( ON ?auto_246442 ?auto_246441 ) ( ON ?auto_246443 ?auto_246442 ) ( ON ?auto_246444 ?auto_246443 ) ( ON ?auto_246445 ?auto_246444 ) ( ON ?auto_246446 ?auto_246445 ) ( ON ?auto_246447 ?auto_246446 ) ( ON ?auto_246448 ?auto_246447 ) ( ON ?auto_246449 ?auto_246448 ) ( ON ?auto_246450 ?auto_246449 ) ( ON ?auto_246451 ?auto_246450 ) ( ON ?auto_246452 ?auto_246451 ) ( not ( = ?auto_246441 ?auto_246442 ) ) ( not ( = ?auto_246441 ?auto_246443 ) ) ( not ( = ?auto_246441 ?auto_246444 ) ) ( not ( = ?auto_246441 ?auto_246445 ) ) ( not ( = ?auto_246441 ?auto_246446 ) ) ( not ( = ?auto_246441 ?auto_246447 ) ) ( not ( = ?auto_246441 ?auto_246448 ) ) ( not ( = ?auto_246441 ?auto_246449 ) ) ( not ( = ?auto_246441 ?auto_246450 ) ) ( not ( = ?auto_246441 ?auto_246451 ) ) ( not ( = ?auto_246441 ?auto_246452 ) ) ( not ( = ?auto_246441 ?auto_246453 ) ) ( not ( = ?auto_246441 ?auto_246454 ) ) ( not ( = ?auto_246442 ?auto_246443 ) ) ( not ( = ?auto_246442 ?auto_246444 ) ) ( not ( = ?auto_246442 ?auto_246445 ) ) ( not ( = ?auto_246442 ?auto_246446 ) ) ( not ( = ?auto_246442 ?auto_246447 ) ) ( not ( = ?auto_246442 ?auto_246448 ) ) ( not ( = ?auto_246442 ?auto_246449 ) ) ( not ( = ?auto_246442 ?auto_246450 ) ) ( not ( = ?auto_246442 ?auto_246451 ) ) ( not ( = ?auto_246442 ?auto_246452 ) ) ( not ( = ?auto_246442 ?auto_246453 ) ) ( not ( = ?auto_246442 ?auto_246454 ) ) ( not ( = ?auto_246443 ?auto_246444 ) ) ( not ( = ?auto_246443 ?auto_246445 ) ) ( not ( = ?auto_246443 ?auto_246446 ) ) ( not ( = ?auto_246443 ?auto_246447 ) ) ( not ( = ?auto_246443 ?auto_246448 ) ) ( not ( = ?auto_246443 ?auto_246449 ) ) ( not ( = ?auto_246443 ?auto_246450 ) ) ( not ( = ?auto_246443 ?auto_246451 ) ) ( not ( = ?auto_246443 ?auto_246452 ) ) ( not ( = ?auto_246443 ?auto_246453 ) ) ( not ( = ?auto_246443 ?auto_246454 ) ) ( not ( = ?auto_246444 ?auto_246445 ) ) ( not ( = ?auto_246444 ?auto_246446 ) ) ( not ( = ?auto_246444 ?auto_246447 ) ) ( not ( = ?auto_246444 ?auto_246448 ) ) ( not ( = ?auto_246444 ?auto_246449 ) ) ( not ( = ?auto_246444 ?auto_246450 ) ) ( not ( = ?auto_246444 ?auto_246451 ) ) ( not ( = ?auto_246444 ?auto_246452 ) ) ( not ( = ?auto_246444 ?auto_246453 ) ) ( not ( = ?auto_246444 ?auto_246454 ) ) ( not ( = ?auto_246445 ?auto_246446 ) ) ( not ( = ?auto_246445 ?auto_246447 ) ) ( not ( = ?auto_246445 ?auto_246448 ) ) ( not ( = ?auto_246445 ?auto_246449 ) ) ( not ( = ?auto_246445 ?auto_246450 ) ) ( not ( = ?auto_246445 ?auto_246451 ) ) ( not ( = ?auto_246445 ?auto_246452 ) ) ( not ( = ?auto_246445 ?auto_246453 ) ) ( not ( = ?auto_246445 ?auto_246454 ) ) ( not ( = ?auto_246446 ?auto_246447 ) ) ( not ( = ?auto_246446 ?auto_246448 ) ) ( not ( = ?auto_246446 ?auto_246449 ) ) ( not ( = ?auto_246446 ?auto_246450 ) ) ( not ( = ?auto_246446 ?auto_246451 ) ) ( not ( = ?auto_246446 ?auto_246452 ) ) ( not ( = ?auto_246446 ?auto_246453 ) ) ( not ( = ?auto_246446 ?auto_246454 ) ) ( not ( = ?auto_246447 ?auto_246448 ) ) ( not ( = ?auto_246447 ?auto_246449 ) ) ( not ( = ?auto_246447 ?auto_246450 ) ) ( not ( = ?auto_246447 ?auto_246451 ) ) ( not ( = ?auto_246447 ?auto_246452 ) ) ( not ( = ?auto_246447 ?auto_246453 ) ) ( not ( = ?auto_246447 ?auto_246454 ) ) ( not ( = ?auto_246448 ?auto_246449 ) ) ( not ( = ?auto_246448 ?auto_246450 ) ) ( not ( = ?auto_246448 ?auto_246451 ) ) ( not ( = ?auto_246448 ?auto_246452 ) ) ( not ( = ?auto_246448 ?auto_246453 ) ) ( not ( = ?auto_246448 ?auto_246454 ) ) ( not ( = ?auto_246449 ?auto_246450 ) ) ( not ( = ?auto_246449 ?auto_246451 ) ) ( not ( = ?auto_246449 ?auto_246452 ) ) ( not ( = ?auto_246449 ?auto_246453 ) ) ( not ( = ?auto_246449 ?auto_246454 ) ) ( not ( = ?auto_246450 ?auto_246451 ) ) ( not ( = ?auto_246450 ?auto_246452 ) ) ( not ( = ?auto_246450 ?auto_246453 ) ) ( not ( = ?auto_246450 ?auto_246454 ) ) ( not ( = ?auto_246451 ?auto_246452 ) ) ( not ( = ?auto_246451 ?auto_246453 ) ) ( not ( = ?auto_246451 ?auto_246454 ) ) ( not ( = ?auto_246452 ?auto_246453 ) ) ( not ( = ?auto_246452 ?auto_246454 ) ) ( not ( = ?auto_246453 ?auto_246454 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_246453 ?auto_246454 )
      ( !STACK ?auto_246453 ?auto_246452 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_246468 - BLOCK
      ?auto_246469 - BLOCK
      ?auto_246470 - BLOCK
      ?auto_246471 - BLOCK
      ?auto_246472 - BLOCK
      ?auto_246473 - BLOCK
      ?auto_246474 - BLOCK
      ?auto_246475 - BLOCK
      ?auto_246476 - BLOCK
      ?auto_246477 - BLOCK
      ?auto_246478 - BLOCK
      ?auto_246479 - BLOCK
      ?auto_246480 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_246479 ) ( ON-TABLE ?auto_246480 ) ( CLEAR ?auto_246480 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_246468 ) ( ON ?auto_246469 ?auto_246468 ) ( ON ?auto_246470 ?auto_246469 ) ( ON ?auto_246471 ?auto_246470 ) ( ON ?auto_246472 ?auto_246471 ) ( ON ?auto_246473 ?auto_246472 ) ( ON ?auto_246474 ?auto_246473 ) ( ON ?auto_246475 ?auto_246474 ) ( ON ?auto_246476 ?auto_246475 ) ( ON ?auto_246477 ?auto_246476 ) ( ON ?auto_246478 ?auto_246477 ) ( ON ?auto_246479 ?auto_246478 ) ( not ( = ?auto_246468 ?auto_246469 ) ) ( not ( = ?auto_246468 ?auto_246470 ) ) ( not ( = ?auto_246468 ?auto_246471 ) ) ( not ( = ?auto_246468 ?auto_246472 ) ) ( not ( = ?auto_246468 ?auto_246473 ) ) ( not ( = ?auto_246468 ?auto_246474 ) ) ( not ( = ?auto_246468 ?auto_246475 ) ) ( not ( = ?auto_246468 ?auto_246476 ) ) ( not ( = ?auto_246468 ?auto_246477 ) ) ( not ( = ?auto_246468 ?auto_246478 ) ) ( not ( = ?auto_246468 ?auto_246479 ) ) ( not ( = ?auto_246468 ?auto_246480 ) ) ( not ( = ?auto_246469 ?auto_246470 ) ) ( not ( = ?auto_246469 ?auto_246471 ) ) ( not ( = ?auto_246469 ?auto_246472 ) ) ( not ( = ?auto_246469 ?auto_246473 ) ) ( not ( = ?auto_246469 ?auto_246474 ) ) ( not ( = ?auto_246469 ?auto_246475 ) ) ( not ( = ?auto_246469 ?auto_246476 ) ) ( not ( = ?auto_246469 ?auto_246477 ) ) ( not ( = ?auto_246469 ?auto_246478 ) ) ( not ( = ?auto_246469 ?auto_246479 ) ) ( not ( = ?auto_246469 ?auto_246480 ) ) ( not ( = ?auto_246470 ?auto_246471 ) ) ( not ( = ?auto_246470 ?auto_246472 ) ) ( not ( = ?auto_246470 ?auto_246473 ) ) ( not ( = ?auto_246470 ?auto_246474 ) ) ( not ( = ?auto_246470 ?auto_246475 ) ) ( not ( = ?auto_246470 ?auto_246476 ) ) ( not ( = ?auto_246470 ?auto_246477 ) ) ( not ( = ?auto_246470 ?auto_246478 ) ) ( not ( = ?auto_246470 ?auto_246479 ) ) ( not ( = ?auto_246470 ?auto_246480 ) ) ( not ( = ?auto_246471 ?auto_246472 ) ) ( not ( = ?auto_246471 ?auto_246473 ) ) ( not ( = ?auto_246471 ?auto_246474 ) ) ( not ( = ?auto_246471 ?auto_246475 ) ) ( not ( = ?auto_246471 ?auto_246476 ) ) ( not ( = ?auto_246471 ?auto_246477 ) ) ( not ( = ?auto_246471 ?auto_246478 ) ) ( not ( = ?auto_246471 ?auto_246479 ) ) ( not ( = ?auto_246471 ?auto_246480 ) ) ( not ( = ?auto_246472 ?auto_246473 ) ) ( not ( = ?auto_246472 ?auto_246474 ) ) ( not ( = ?auto_246472 ?auto_246475 ) ) ( not ( = ?auto_246472 ?auto_246476 ) ) ( not ( = ?auto_246472 ?auto_246477 ) ) ( not ( = ?auto_246472 ?auto_246478 ) ) ( not ( = ?auto_246472 ?auto_246479 ) ) ( not ( = ?auto_246472 ?auto_246480 ) ) ( not ( = ?auto_246473 ?auto_246474 ) ) ( not ( = ?auto_246473 ?auto_246475 ) ) ( not ( = ?auto_246473 ?auto_246476 ) ) ( not ( = ?auto_246473 ?auto_246477 ) ) ( not ( = ?auto_246473 ?auto_246478 ) ) ( not ( = ?auto_246473 ?auto_246479 ) ) ( not ( = ?auto_246473 ?auto_246480 ) ) ( not ( = ?auto_246474 ?auto_246475 ) ) ( not ( = ?auto_246474 ?auto_246476 ) ) ( not ( = ?auto_246474 ?auto_246477 ) ) ( not ( = ?auto_246474 ?auto_246478 ) ) ( not ( = ?auto_246474 ?auto_246479 ) ) ( not ( = ?auto_246474 ?auto_246480 ) ) ( not ( = ?auto_246475 ?auto_246476 ) ) ( not ( = ?auto_246475 ?auto_246477 ) ) ( not ( = ?auto_246475 ?auto_246478 ) ) ( not ( = ?auto_246475 ?auto_246479 ) ) ( not ( = ?auto_246475 ?auto_246480 ) ) ( not ( = ?auto_246476 ?auto_246477 ) ) ( not ( = ?auto_246476 ?auto_246478 ) ) ( not ( = ?auto_246476 ?auto_246479 ) ) ( not ( = ?auto_246476 ?auto_246480 ) ) ( not ( = ?auto_246477 ?auto_246478 ) ) ( not ( = ?auto_246477 ?auto_246479 ) ) ( not ( = ?auto_246477 ?auto_246480 ) ) ( not ( = ?auto_246478 ?auto_246479 ) ) ( not ( = ?auto_246478 ?auto_246480 ) ) ( not ( = ?auto_246479 ?auto_246480 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_246480 )
      ( !STACK ?auto_246480 ?auto_246479 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_246494 - BLOCK
      ?auto_246495 - BLOCK
      ?auto_246496 - BLOCK
      ?auto_246497 - BLOCK
      ?auto_246498 - BLOCK
      ?auto_246499 - BLOCK
      ?auto_246500 - BLOCK
      ?auto_246501 - BLOCK
      ?auto_246502 - BLOCK
      ?auto_246503 - BLOCK
      ?auto_246504 - BLOCK
      ?auto_246505 - BLOCK
      ?auto_246506 - BLOCK
    )
    :vars
    (
      ?auto_246507 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_246506 ?auto_246507 ) ( ON-TABLE ?auto_246494 ) ( ON ?auto_246495 ?auto_246494 ) ( ON ?auto_246496 ?auto_246495 ) ( ON ?auto_246497 ?auto_246496 ) ( ON ?auto_246498 ?auto_246497 ) ( ON ?auto_246499 ?auto_246498 ) ( ON ?auto_246500 ?auto_246499 ) ( ON ?auto_246501 ?auto_246500 ) ( ON ?auto_246502 ?auto_246501 ) ( ON ?auto_246503 ?auto_246502 ) ( ON ?auto_246504 ?auto_246503 ) ( not ( = ?auto_246494 ?auto_246495 ) ) ( not ( = ?auto_246494 ?auto_246496 ) ) ( not ( = ?auto_246494 ?auto_246497 ) ) ( not ( = ?auto_246494 ?auto_246498 ) ) ( not ( = ?auto_246494 ?auto_246499 ) ) ( not ( = ?auto_246494 ?auto_246500 ) ) ( not ( = ?auto_246494 ?auto_246501 ) ) ( not ( = ?auto_246494 ?auto_246502 ) ) ( not ( = ?auto_246494 ?auto_246503 ) ) ( not ( = ?auto_246494 ?auto_246504 ) ) ( not ( = ?auto_246494 ?auto_246505 ) ) ( not ( = ?auto_246494 ?auto_246506 ) ) ( not ( = ?auto_246494 ?auto_246507 ) ) ( not ( = ?auto_246495 ?auto_246496 ) ) ( not ( = ?auto_246495 ?auto_246497 ) ) ( not ( = ?auto_246495 ?auto_246498 ) ) ( not ( = ?auto_246495 ?auto_246499 ) ) ( not ( = ?auto_246495 ?auto_246500 ) ) ( not ( = ?auto_246495 ?auto_246501 ) ) ( not ( = ?auto_246495 ?auto_246502 ) ) ( not ( = ?auto_246495 ?auto_246503 ) ) ( not ( = ?auto_246495 ?auto_246504 ) ) ( not ( = ?auto_246495 ?auto_246505 ) ) ( not ( = ?auto_246495 ?auto_246506 ) ) ( not ( = ?auto_246495 ?auto_246507 ) ) ( not ( = ?auto_246496 ?auto_246497 ) ) ( not ( = ?auto_246496 ?auto_246498 ) ) ( not ( = ?auto_246496 ?auto_246499 ) ) ( not ( = ?auto_246496 ?auto_246500 ) ) ( not ( = ?auto_246496 ?auto_246501 ) ) ( not ( = ?auto_246496 ?auto_246502 ) ) ( not ( = ?auto_246496 ?auto_246503 ) ) ( not ( = ?auto_246496 ?auto_246504 ) ) ( not ( = ?auto_246496 ?auto_246505 ) ) ( not ( = ?auto_246496 ?auto_246506 ) ) ( not ( = ?auto_246496 ?auto_246507 ) ) ( not ( = ?auto_246497 ?auto_246498 ) ) ( not ( = ?auto_246497 ?auto_246499 ) ) ( not ( = ?auto_246497 ?auto_246500 ) ) ( not ( = ?auto_246497 ?auto_246501 ) ) ( not ( = ?auto_246497 ?auto_246502 ) ) ( not ( = ?auto_246497 ?auto_246503 ) ) ( not ( = ?auto_246497 ?auto_246504 ) ) ( not ( = ?auto_246497 ?auto_246505 ) ) ( not ( = ?auto_246497 ?auto_246506 ) ) ( not ( = ?auto_246497 ?auto_246507 ) ) ( not ( = ?auto_246498 ?auto_246499 ) ) ( not ( = ?auto_246498 ?auto_246500 ) ) ( not ( = ?auto_246498 ?auto_246501 ) ) ( not ( = ?auto_246498 ?auto_246502 ) ) ( not ( = ?auto_246498 ?auto_246503 ) ) ( not ( = ?auto_246498 ?auto_246504 ) ) ( not ( = ?auto_246498 ?auto_246505 ) ) ( not ( = ?auto_246498 ?auto_246506 ) ) ( not ( = ?auto_246498 ?auto_246507 ) ) ( not ( = ?auto_246499 ?auto_246500 ) ) ( not ( = ?auto_246499 ?auto_246501 ) ) ( not ( = ?auto_246499 ?auto_246502 ) ) ( not ( = ?auto_246499 ?auto_246503 ) ) ( not ( = ?auto_246499 ?auto_246504 ) ) ( not ( = ?auto_246499 ?auto_246505 ) ) ( not ( = ?auto_246499 ?auto_246506 ) ) ( not ( = ?auto_246499 ?auto_246507 ) ) ( not ( = ?auto_246500 ?auto_246501 ) ) ( not ( = ?auto_246500 ?auto_246502 ) ) ( not ( = ?auto_246500 ?auto_246503 ) ) ( not ( = ?auto_246500 ?auto_246504 ) ) ( not ( = ?auto_246500 ?auto_246505 ) ) ( not ( = ?auto_246500 ?auto_246506 ) ) ( not ( = ?auto_246500 ?auto_246507 ) ) ( not ( = ?auto_246501 ?auto_246502 ) ) ( not ( = ?auto_246501 ?auto_246503 ) ) ( not ( = ?auto_246501 ?auto_246504 ) ) ( not ( = ?auto_246501 ?auto_246505 ) ) ( not ( = ?auto_246501 ?auto_246506 ) ) ( not ( = ?auto_246501 ?auto_246507 ) ) ( not ( = ?auto_246502 ?auto_246503 ) ) ( not ( = ?auto_246502 ?auto_246504 ) ) ( not ( = ?auto_246502 ?auto_246505 ) ) ( not ( = ?auto_246502 ?auto_246506 ) ) ( not ( = ?auto_246502 ?auto_246507 ) ) ( not ( = ?auto_246503 ?auto_246504 ) ) ( not ( = ?auto_246503 ?auto_246505 ) ) ( not ( = ?auto_246503 ?auto_246506 ) ) ( not ( = ?auto_246503 ?auto_246507 ) ) ( not ( = ?auto_246504 ?auto_246505 ) ) ( not ( = ?auto_246504 ?auto_246506 ) ) ( not ( = ?auto_246504 ?auto_246507 ) ) ( not ( = ?auto_246505 ?auto_246506 ) ) ( not ( = ?auto_246505 ?auto_246507 ) ) ( not ( = ?auto_246506 ?auto_246507 ) ) ( CLEAR ?auto_246504 ) ( ON ?auto_246505 ?auto_246506 ) ( CLEAR ?auto_246505 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_246494 ?auto_246495 ?auto_246496 ?auto_246497 ?auto_246498 ?auto_246499 ?auto_246500 ?auto_246501 ?auto_246502 ?auto_246503 ?auto_246504 ?auto_246505 )
      ( MAKE-13PILE ?auto_246494 ?auto_246495 ?auto_246496 ?auto_246497 ?auto_246498 ?auto_246499 ?auto_246500 ?auto_246501 ?auto_246502 ?auto_246503 ?auto_246504 ?auto_246505 ?auto_246506 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_246521 - BLOCK
      ?auto_246522 - BLOCK
      ?auto_246523 - BLOCK
      ?auto_246524 - BLOCK
      ?auto_246525 - BLOCK
      ?auto_246526 - BLOCK
      ?auto_246527 - BLOCK
      ?auto_246528 - BLOCK
      ?auto_246529 - BLOCK
      ?auto_246530 - BLOCK
      ?auto_246531 - BLOCK
      ?auto_246532 - BLOCK
      ?auto_246533 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_246533 ) ( ON-TABLE ?auto_246521 ) ( ON ?auto_246522 ?auto_246521 ) ( ON ?auto_246523 ?auto_246522 ) ( ON ?auto_246524 ?auto_246523 ) ( ON ?auto_246525 ?auto_246524 ) ( ON ?auto_246526 ?auto_246525 ) ( ON ?auto_246527 ?auto_246526 ) ( ON ?auto_246528 ?auto_246527 ) ( ON ?auto_246529 ?auto_246528 ) ( ON ?auto_246530 ?auto_246529 ) ( ON ?auto_246531 ?auto_246530 ) ( not ( = ?auto_246521 ?auto_246522 ) ) ( not ( = ?auto_246521 ?auto_246523 ) ) ( not ( = ?auto_246521 ?auto_246524 ) ) ( not ( = ?auto_246521 ?auto_246525 ) ) ( not ( = ?auto_246521 ?auto_246526 ) ) ( not ( = ?auto_246521 ?auto_246527 ) ) ( not ( = ?auto_246521 ?auto_246528 ) ) ( not ( = ?auto_246521 ?auto_246529 ) ) ( not ( = ?auto_246521 ?auto_246530 ) ) ( not ( = ?auto_246521 ?auto_246531 ) ) ( not ( = ?auto_246521 ?auto_246532 ) ) ( not ( = ?auto_246521 ?auto_246533 ) ) ( not ( = ?auto_246522 ?auto_246523 ) ) ( not ( = ?auto_246522 ?auto_246524 ) ) ( not ( = ?auto_246522 ?auto_246525 ) ) ( not ( = ?auto_246522 ?auto_246526 ) ) ( not ( = ?auto_246522 ?auto_246527 ) ) ( not ( = ?auto_246522 ?auto_246528 ) ) ( not ( = ?auto_246522 ?auto_246529 ) ) ( not ( = ?auto_246522 ?auto_246530 ) ) ( not ( = ?auto_246522 ?auto_246531 ) ) ( not ( = ?auto_246522 ?auto_246532 ) ) ( not ( = ?auto_246522 ?auto_246533 ) ) ( not ( = ?auto_246523 ?auto_246524 ) ) ( not ( = ?auto_246523 ?auto_246525 ) ) ( not ( = ?auto_246523 ?auto_246526 ) ) ( not ( = ?auto_246523 ?auto_246527 ) ) ( not ( = ?auto_246523 ?auto_246528 ) ) ( not ( = ?auto_246523 ?auto_246529 ) ) ( not ( = ?auto_246523 ?auto_246530 ) ) ( not ( = ?auto_246523 ?auto_246531 ) ) ( not ( = ?auto_246523 ?auto_246532 ) ) ( not ( = ?auto_246523 ?auto_246533 ) ) ( not ( = ?auto_246524 ?auto_246525 ) ) ( not ( = ?auto_246524 ?auto_246526 ) ) ( not ( = ?auto_246524 ?auto_246527 ) ) ( not ( = ?auto_246524 ?auto_246528 ) ) ( not ( = ?auto_246524 ?auto_246529 ) ) ( not ( = ?auto_246524 ?auto_246530 ) ) ( not ( = ?auto_246524 ?auto_246531 ) ) ( not ( = ?auto_246524 ?auto_246532 ) ) ( not ( = ?auto_246524 ?auto_246533 ) ) ( not ( = ?auto_246525 ?auto_246526 ) ) ( not ( = ?auto_246525 ?auto_246527 ) ) ( not ( = ?auto_246525 ?auto_246528 ) ) ( not ( = ?auto_246525 ?auto_246529 ) ) ( not ( = ?auto_246525 ?auto_246530 ) ) ( not ( = ?auto_246525 ?auto_246531 ) ) ( not ( = ?auto_246525 ?auto_246532 ) ) ( not ( = ?auto_246525 ?auto_246533 ) ) ( not ( = ?auto_246526 ?auto_246527 ) ) ( not ( = ?auto_246526 ?auto_246528 ) ) ( not ( = ?auto_246526 ?auto_246529 ) ) ( not ( = ?auto_246526 ?auto_246530 ) ) ( not ( = ?auto_246526 ?auto_246531 ) ) ( not ( = ?auto_246526 ?auto_246532 ) ) ( not ( = ?auto_246526 ?auto_246533 ) ) ( not ( = ?auto_246527 ?auto_246528 ) ) ( not ( = ?auto_246527 ?auto_246529 ) ) ( not ( = ?auto_246527 ?auto_246530 ) ) ( not ( = ?auto_246527 ?auto_246531 ) ) ( not ( = ?auto_246527 ?auto_246532 ) ) ( not ( = ?auto_246527 ?auto_246533 ) ) ( not ( = ?auto_246528 ?auto_246529 ) ) ( not ( = ?auto_246528 ?auto_246530 ) ) ( not ( = ?auto_246528 ?auto_246531 ) ) ( not ( = ?auto_246528 ?auto_246532 ) ) ( not ( = ?auto_246528 ?auto_246533 ) ) ( not ( = ?auto_246529 ?auto_246530 ) ) ( not ( = ?auto_246529 ?auto_246531 ) ) ( not ( = ?auto_246529 ?auto_246532 ) ) ( not ( = ?auto_246529 ?auto_246533 ) ) ( not ( = ?auto_246530 ?auto_246531 ) ) ( not ( = ?auto_246530 ?auto_246532 ) ) ( not ( = ?auto_246530 ?auto_246533 ) ) ( not ( = ?auto_246531 ?auto_246532 ) ) ( not ( = ?auto_246531 ?auto_246533 ) ) ( not ( = ?auto_246532 ?auto_246533 ) ) ( CLEAR ?auto_246531 ) ( ON ?auto_246532 ?auto_246533 ) ( CLEAR ?auto_246532 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_246521 ?auto_246522 ?auto_246523 ?auto_246524 ?auto_246525 ?auto_246526 ?auto_246527 ?auto_246528 ?auto_246529 ?auto_246530 ?auto_246531 ?auto_246532 )
      ( MAKE-13PILE ?auto_246521 ?auto_246522 ?auto_246523 ?auto_246524 ?auto_246525 ?auto_246526 ?auto_246527 ?auto_246528 ?auto_246529 ?auto_246530 ?auto_246531 ?auto_246532 ?auto_246533 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_246547 - BLOCK
      ?auto_246548 - BLOCK
      ?auto_246549 - BLOCK
      ?auto_246550 - BLOCK
      ?auto_246551 - BLOCK
      ?auto_246552 - BLOCK
      ?auto_246553 - BLOCK
      ?auto_246554 - BLOCK
      ?auto_246555 - BLOCK
      ?auto_246556 - BLOCK
      ?auto_246557 - BLOCK
      ?auto_246558 - BLOCK
      ?auto_246559 - BLOCK
    )
    :vars
    (
      ?auto_246560 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_246559 ?auto_246560 ) ( ON-TABLE ?auto_246547 ) ( ON ?auto_246548 ?auto_246547 ) ( ON ?auto_246549 ?auto_246548 ) ( ON ?auto_246550 ?auto_246549 ) ( ON ?auto_246551 ?auto_246550 ) ( ON ?auto_246552 ?auto_246551 ) ( ON ?auto_246553 ?auto_246552 ) ( ON ?auto_246554 ?auto_246553 ) ( ON ?auto_246555 ?auto_246554 ) ( ON ?auto_246556 ?auto_246555 ) ( not ( = ?auto_246547 ?auto_246548 ) ) ( not ( = ?auto_246547 ?auto_246549 ) ) ( not ( = ?auto_246547 ?auto_246550 ) ) ( not ( = ?auto_246547 ?auto_246551 ) ) ( not ( = ?auto_246547 ?auto_246552 ) ) ( not ( = ?auto_246547 ?auto_246553 ) ) ( not ( = ?auto_246547 ?auto_246554 ) ) ( not ( = ?auto_246547 ?auto_246555 ) ) ( not ( = ?auto_246547 ?auto_246556 ) ) ( not ( = ?auto_246547 ?auto_246557 ) ) ( not ( = ?auto_246547 ?auto_246558 ) ) ( not ( = ?auto_246547 ?auto_246559 ) ) ( not ( = ?auto_246547 ?auto_246560 ) ) ( not ( = ?auto_246548 ?auto_246549 ) ) ( not ( = ?auto_246548 ?auto_246550 ) ) ( not ( = ?auto_246548 ?auto_246551 ) ) ( not ( = ?auto_246548 ?auto_246552 ) ) ( not ( = ?auto_246548 ?auto_246553 ) ) ( not ( = ?auto_246548 ?auto_246554 ) ) ( not ( = ?auto_246548 ?auto_246555 ) ) ( not ( = ?auto_246548 ?auto_246556 ) ) ( not ( = ?auto_246548 ?auto_246557 ) ) ( not ( = ?auto_246548 ?auto_246558 ) ) ( not ( = ?auto_246548 ?auto_246559 ) ) ( not ( = ?auto_246548 ?auto_246560 ) ) ( not ( = ?auto_246549 ?auto_246550 ) ) ( not ( = ?auto_246549 ?auto_246551 ) ) ( not ( = ?auto_246549 ?auto_246552 ) ) ( not ( = ?auto_246549 ?auto_246553 ) ) ( not ( = ?auto_246549 ?auto_246554 ) ) ( not ( = ?auto_246549 ?auto_246555 ) ) ( not ( = ?auto_246549 ?auto_246556 ) ) ( not ( = ?auto_246549 ?auto_246557 ) ) ( not ( = ?auto_246549 ?auto_246558 ) ) ( not ( = ?auto_246549 ?auto_246559 ) ) ( not ( = ?auto_246549 ?auto_246560 ) ) ( not ( = ?auto_246550 ?auto_246551 ) ) ( not ( = ?auto_246550 ?auto_246552 ) ) ( not ( = ?auto_246550 ?auto_246553 ) ) ( not ( = ?auto_246550 ?auto_246554 ) ) ( not ( = ?auto_246550 ?auto_246555 ) ) ( not ( = ?auto_246550 ?auto_246556 ) ) ( not ( = ?auto_246550 ?auto_246557 ) ) ( not ( = ?auto_246550 ?auto_246558 ) ) ( not ( = ?auto_246550 ?auto_246559 ) ) ( not ( = ?auto_246550 ?auto_246560 ) ) ( not ( = ?auto_246551 ?auto_246552 ) ) ( not ( = ?auto_246551 ?auto_246553 ) ) ( not ( = ?auto_246551 ?auto_246554 ) ) ( not ( = ?auto_246551 ?auto_246555 ) ) ( not ( = ?auto_246551 ?auto_246556 ) ) ( not ( = ?auto_246551 ?auto_246557 ) ) ( not ( = ?auto_246551 ?auto_246558 ) ) ( not ( = ?auto_246551 ?auto_246559 ) ) ( not ( = ?auto_246551 ?auto_246560 ) ) ( not ( = ?auto_246552 ?auto_246553 ) ) ( not ( = ?auto_246552 ?auto_246554 ) ) ( not ( = ?auto_246552 ?auto_246555 ) ) ( not ( = ?auto_246552 ?auto_246556 ) ) ( not ( = ?auto_246552 ?auto_246557 ) ) ( not ( = ?auto_246552 ?auto_246558 ) ) ( not ( = ?auto_246552 ?auto_246559 ) ) ( not ( = ?auto_246552 ?auto_246560 ) ) ( not ( = ?auto_246553 ?auto_246554 ) ) ( not ( = ?auto_246553 ?auto_246555 ) ) ( not ( = ?auto_246553 ?auto_246556 ) ) ( not ( = ?auto_246553 ?auto_246557 ) ) ( not ( = ?auto_246553 ?auto_246558 ) ) ( not ( = ?auto_246553 ?auto_246559 ) ) ( not ( = ?auto_246553 ?auto_246560 ) ) ( not ( = ?auto_246554 ?auto_246555 ) ) ( not ( = ?auto_246554 ?auto_246556 ) ) ( not ( = ?auto_246554 ?auto_246557 ) ) ( not ( = ?auto_246554 ?auto_246558 ) ) ( not ( = ?auto_246554 ?auto_246559 ) ) ( not ( = ?auto_246554 ?auto_246560 ) ) ( not ( = ?auto_246555 ?auto_246556 ) ) ( not ( = ?auto_246555 ?auto_246557 ) ) ( not ( = ?auto_246555 ?auto_246558 ) ) ( not ( = ?auto_246555 ?auto_246559 ) ) ( not ( = ?auto_246555 ?auto_246560 ) ) ( not ( = ?auto_246556 ?auto_246557 ) ) ( not ( = ?auto_246556 ?auto_246558 ) ) ( not ( = ?auto_246556 ?auto_246559 ) ) ( not ( = ?auto_246556 ?auto_246560 ) ) ( not ( = ?auto_246557 ?auto_246558 ) ) ( not ( = ?auto_246557 ?auto_246559 ) ) ( not ( = ?auto_246557 ?auto_246560 ) ) ( not ( = ?auto_246558 ?auto_246559 ) ) ( not ( = ?auto_246558 ?auto_246560 ) ) ( not ( = ?auto_246559 ?auto_246560 ) ) ( ON ?auto_246558 ?auto_246559 ) ( CLEAR ?auto_246556 ) ( ON ?auto_246557 ?auto_246558 ) ( CLEAR ?auto_246557 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_246547 ?auto_246548 ?auto_246549 ?auto_246550 ?auto_246551 ?auto_246552 ?auto_246553 ?auto_246554 ?auto_246555 ?auto_246556 ?auto_246557 )
      ( MAKE-13PILE ?auto_246547 ?auto_246548 ?auto_246549 ?auto_246550 ?auto_246551 ?auto_246552 ?auto_246553 ?auto_246554 ?auto_246555 ?auto_246556 ?auto_246557 ?auto_246558 ?auto_246559 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_246574 - BLOCK
      ?auto_246575 - BLOCK
      ?auto_246576 - BLOCK
      ?auto_246577 - BLOCK
      ?auto_246578 - BLOCK
      ?auto_246579 - BLOCK
      ?auto_246580 - BLOCK
      ?auto_246581 - BLOCK
      ?auto_246582 - BLOCK
      ?auto_246583 - BLOCK
      ?auto_246584 - BLOCK
      ?auto_246585 - BLOCK
      ?auto_246586 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_246586 ) ( ON-TABLE ?auto_246574 ) ( ON ?auto_246575 ?auto_246574 ) ( ON ?auto_246576 ?auto_246575 ) ( ON ?auto_246577 ?auto_246576 ) ( ON ?auto_246578 ?auto_246577 ) ( ON ?auto_246579 ?auto_246578 ) ( ON ?auto_246580 ?auto_246579 ) ( ON ?auto_246581 ?auto_246580 ) ( ON ?auto_246582 ?auto_246581 ) ( ON ?auto_246583 ?auto_246582 ) ( not ( = ?auto_246574 ?auto_246575 ) ) ( not ( = ?auto_246574 ?auto_246576 ) ) ( not ( = ?auto_246574 ?auto_246577 ) ) ( not ( = ?auto_246574 ?auto_246578 ) ) ( not ( = ?auto_246574 ?auto_246579 ) ) ( not ( = ?auto_246574 ?auto_246580 ) ) ( not ( = ?auto_246574 ?auto_246581 ) ) ( not ( = ?auto_246574 ?auto_246582 ) ) ( not ( = ?auto_246574 ?auto_246583 ) ) ( not ( = ?auto_246574 ?auto_246584 ) ) ( not ( = ?auto_246574 ?auto_246585 ) ) ( not ( = ?auto_246574 ?auto_246586 ) ) ( not ( = ?auto_246575 ?auto_246576 ) ) ( not ( = ?auto_246575 ?auto_246577 ) ) ( not ( = ?auto_246575 ?auto_246578 ) ) ( not ( = ?auto_246575 ?auto_246579 ) ) ( not ( = ?auto_246575 ?auto_246580 ) ) ( not ( = ?auto_246575 ?auto_246581 ) ) ( not ( = ?auto_246575 ?auto_246582 ) ) ( not ( = ?auto_246575 ?auto_246583 ) ) ( not ( = ?auto_246575 ?auto_246584 ) ) ( not ( = ?auto_246575 ?auto_246585 ) ) ( not ( = ?auto_246575 ?auto_246586 ) ) ( not ( = ?auto_246576 ?auto_246577 ) ) ( not ( = ?auto_246576 ?auto_246578 ) ) ( not ( = ?auto_246576 ?auto_246579 ) ) ( not ( = ?auto_246576 ?auto_246580 ) ) ( not ( = ?auto_246576 ?auto_246581 ) ) ( not ( = ?auto_246576 ?auto_246582 ) ) ( not ( = ?auto_246576 ?auto_246583 ) ) ( not ( = ?auto_246576 ?auto_246584 ) ) ( not ( = ?auto_246576 ?auto_246585 ) ) ( not ( = ?auto_246576 ?auto_246586 ) ) ( not ( = ?auto_246577 ?auto_246578 ) ) ( not ( = ?auto_246577 ?auto_246579 ) ) ( not ( = ?auto_246577 ?auto_246580 ) ) ( not ( = ?auto_246577 ?auto_246581 ) ) ( not ( = ?auto_246577 ?auto_246582 ) ) ( not ( = ?auto_246577 ?auto_246583 ) ) ( not ( = ?auto_246577 ?auto_246584 ) ) ( not ( = ?auto_246577 ?auto_246585 ) ) ( not ( = ?auto_246577 ?auto_246586 ) ) ( not ( = ?auto_246578 ?auto_246579 ) ) ( not ( = ?auto_246578 ?auto_246580 ) ) ( not ( = ?auto_246578 ?auto_246581 ) ) ( not ( = ?auto_246578 ?auto_246582 ) ) ( not ( = ?auto_246578 ?auto_246583 ) ) ( not ( = ?auto_246578 ?auto_246584 ) ) ( not ( = ?auto_246578 ?auto_246585 ) ) ( not ( = ?auto_246578 ?auto_246586 ) ) ( not ( = ?auto_246579 ?auto_246580 ) ) ( not ( = ?auto_246579 ?auto_246581 ) ) ( not ( = ?auto_246579 ?auto_246582 ) ) ( not ( = ?auto_246579 ?auto_246583 ) ) ( not ( = ?auto_246579 ?auto_246584 ) ) ( not ( = ?auto_246579 ?auto_246585 ) ) ( not ( = ?auto_246579 ?auto_246586 ) ) ( not ( = ?auto_246580 ?auto_246581 ) ) ( not ( = ?auto_246580 ?auto_246582 ) ) ( not ( = ?auto_246580 ?auto_246583 ) ) ( not ( = ?auto_246580 ?auto_246584 ) ) ( not ( = ?auto_246580 ?auto_246585 ) ) ( not ( = ?auto_246580 ?auto_246586 ) ) ( not ( = ?auto_246581 ?auto_246582 ) ) ( not ( = ?auto_246581 ?auto_246583 ) ) ( not ( = ?auto_246581 ?auto_246584 ) ) ( not ( = ?auto_246581 ?auto_246585 ) ) ( not ( = ?auto_246581 ?auto_246586 ) ) ( not ( = ?auto_246582 ?auto_246583 ) ) ( not ( = ?auto_246582 ?auto_246584 ) ) ( not ( = ?auto_246582 ?auto_246585 ) ) ( not ( = ?auto_246582 ?auto_246586 ) ) ( not ( = ?auto_246583 ?auto_246584 ) ) ( not ( = ?auto_246583 ?auto_246585 ) ) ( not ( = ?auto_246583 ?auto_246586 ) ) ( not ( = ?auto_246584 ?auto_246585 ) ) ( not ( = ?auto_246584 ?auto_246586 ) ) ( not ( = ?auto_246585 ?auto_246586 ) ) ( ON ?auto_246585 ?auto_246586 ) ( CLEAR ?auto_246583 ) ( ON ?auto_246584 ?auto_246585 ) ( CLEAR ?auto_246584 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_246574 ?auto_246575 ?auto_246576 ?auto_246577 ?auto_246578 ?auto_246579 ?auto_246580 ?auto_246581 ?auto_246582 ?auto_246583 ?auto_246584 )
      ( MAKE-13PILE ?auto_246574 ?auto_246575 ?auto_246576 ?auto_246577 ?auto_246578 ?auto_246579 ?auto_246580 ?auto_246581 ?auto_246582 ?auto_246583 ?auto_246584 ?auto_246585 ?auto_246586 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_246600 - BLOCK
      ?auto_246601 - BLOCK
      ?auto_246602 - BLOCK
      ?auto_246603 - BLOCK
      ?auto_246604 - BLOCK
      ?auto_246605 - BLOCK
      ?auto_246606 - BLOCK
      ?auto_246607 - BLOCK
      ?auto_246608 - BLOCK
      ?auto_246609 - BLOCK
      ?auto_246610 - BLOCK
      ?auto_246611 - BLOCK
      ?auto_246612 - BLOCK
    )
    :vars
    (
      ?auto_246613 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_246612 ?auto_246613 ) ( ON-TABLE ?auto_246600 ) ( ON ?auto_246601 ?auto_246600 ) ( ON ?auto_246602 ?auto_246601 ) ( ON ?auto_246603 ?auto_246602 ) ( ON ?auto_246604 ?auto_246603 ) ( ON ?auto_246605 ?auto_246604 ) ( ON ?auto_246606 ?auto_246605 ) ( ON ?auto_246607 ?auto_246606 ) ( ON ?auto_246608 ?auto_246607 ) ( not ( = ?auto_246600 ?auto_246601 ) ) ( not ( = ?auto_246600 ?auto_246602 ) ) ( not ( = ?auto_246600 ?auto_246603 ) ) ( not ( = ?auto_246600 ?auto_246604 ) ) ( not ( = ?auto_246600 ?auto_246605 ) ) ( not ( = ?auto_246600 ?auto_246606 ) ) ( not ( = ?auto_246600 ?auto_246607 ) ) ( not ( = ?auto_246600 ?auto_246608 ) ) ( not ( = ?auto_246600 ?auto_246609 ) ) ( not ( = ?auto_246600 ?auto_246610 ) ) ( not ( = ?auto_246600 ?auto_246611 ) ) ( not ( = ?auto_246600 ?auto_246612 ) ) ( not ( = ?auto_246600 ?auto_246613 ) ) ( not ( = ?auto_246601 ?auto_246602 ) ) ( not ( = ?auto_246601 ?auto_246603 ) ) ( not ( = ?auto_246601 ?auto_246604 ) ) ( not ( = ?auto_246601 ?auto_246605 ) ) ( not ( = ?auto_246601 ?auto_246606 ) ) ( not ( = ?auto_246601 ?auto_246607 ) ) ( not ( = ?auto_246601 ?auto_246608 ) ) ( not ( = ?auto_246601 ?auto_246609 ) ) ( not ( = ?auto_246601 ?auto_246610 ) ) ( not ( = ?auto_246601 ?auto_246611 ) ) ( not ( = ?auto_246601 ?auto_246612 ) ) ( not ( = ?auto_246601 ?auto_246613 ) ) ( not ( = ?auto_246602 ?auto_246603 ) ) ( not ( = ?auto_246602 ?auto_246604 ) ) ( not ( = ?auto_246602 ?auto_246605 ) ) ( not ( = ?auto_246602 ?auto_246606 ) ) ( not ( = ?auto_246602 ?auto_246607 ) ) ( not ( = ?auto_246602 ?auto_246608 ) ) ( not ( = ?auto_246602 ?auto_246609 ) ) ( not ( = ?auto_246602 ?auto_246610 ) ) ( not ( = ?auto_246602 ?auto_246611 ) ) ( not ( = ?auto_246602 ?auto_246612 ) ) ( not ( = ?auto_246602 ?auto_246613 ) ) ( not ( = ?auto_246603 ?auto_246604 ) ) ( not ( = ?auto_246603 ?auto_246605 ) ) ( not ( = ?auto_246603 ?auto_246606 ) ) ( not ( = ?auto_246603 ?auto_246607 ) ) ( not ( = ?auto_246603 ?auto_246608 ) ) ( not ( = ?auto_246603 ?auto_246609 ) ) ( not ( = ?auto_246603 ?auto_246610 ) ) ( not ( = ?auto_246603 ?auto_246611 ) ) ( not ( = ?auto_246603 ?auto_246612 ) ) ( not ( = ?auto_246603 ?auto_246613 ) ) ( not ( = ?auto_246604 ?auto_246605 ) ) ( not ( = ?auto_246604 ?auto_246606 ) ) ( not ( = ?auto_246604 ?auto_246607 ) ) ( not ( = ?auto_246604 ?auto_246608 ) ) ( not ( = ?auto_246604 ?auto_246609 ) ) ( not ( = ?auto_246604 ?auto_246610 ) ) ( not ( = ?auto_246604 ?auto_246611 ) ) ( not ( = ?auto_246604 ?auto_246612 ) ) ( not ( = ?auto_246604 ?auto_246613 ) ) ( not ( = ?auto_246605 ?auto_246606 ) ) ( not ( = ?auto_246605 ?auto_246607 ) ) ( not ( = ?auto_246605 ?auto_246608 ) ) ( not ( = ?auto_246605 ?auto_246609 ) ) ( not ( = ?auto_246605 ?auto_246610 ) ) ( not ( = ?auto_246605 ?auto_246611 ) ) ( not ( = ?auto_246605 ?auto_246612 ) ) ( not ( = ?auto_246605 ?auto_246613 ) ) ( not ( = ?auto_246606 ?auto_246607 ) ) ( not ( = ?auto_246606 ?auto_246608 ) ) ( not ( = ?auto_246606 ?auto_246609 ) ) ( not ( = ?auto_246606 ?auto_246610 ) ) ( not ( = ?auto_246606 ?auto_246611 ) ) ( not ( = ?auto_246606 ?auto_246612 ) ) ( not ( = ?auto_246606 ?auto_246613 ) ) ( not ( = ?auto_246607 ?auto_246608 ) ) ( not ( = ?auto_246607 ?auto_246609 ) ) ( not ( = ?auto_246607 ?auto_246610 ) ) ( not ( = ?auto_246607 ?auto_246611 ) ) ( not ( = ?auto_246607 ?auto_246612 ) ) ( not ( = ?auto_246607 ?auto_246613 ) ) ( not ( = ?auto_246608 ?auto_246609 ) ) ( not ( = ?auto_246608 ?auto_246610 ) ) ( not ( = ?auto_246608 ?auto_246611 ) ) ( not ( = ?auto_246608 ?auto_246612 ) ) ( not ( = ?auto_246608 ?auto_246613 ) ) ( not ( = ?auto_246609 ?auto_246610 ) ) ( not ( = ?auto_246609 ?auto_246611 ) ) ( not ( = ?auto_246609 ?auto_246612 ) ) ( not ( = ?auto_246609 ?auto_246613 ) ) ( not ( = ?auto_246610 ?auto_246611 ) ) ( not ( = ?auto_246610 ?auto_246612 ) ) ( not ( = ?auto_246610 ?auto_246613 ) ) ( not ( = ?auto_246611 ?auto_246612 ) ) ( not ( = ?auto_246611 ?auto_246613 ) ) ( not ( = ?auto_246612 ?auto_246613 ) ) ( ON ?auto_246611 ?auto_246612 ) ( ON ?auto_246610 ?auto_246611 ) ( CLEAR ?auto_246608 ) ( ON ?auto_246609 ?auto_246610 ) ( CLEAR ?auto_246609 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_246600 ?auto_246601 ?auto_246602 ?auto_246603 ?auto_246604 ?auto_246605 ?auto_246606 ?auto_246607 ?auto_246608 ?auto_246609 )
      ( MAKE-13PILE ?auto_246600 ?auto_246601 ?auto_246602 ?auto_246603 ?auto_246604 ?auto_246605 ?auto_246606 ?auto_246607 ?auto_246608 ?auto_246609 ?auto_246610 ?auto_246611 ?auto_246612 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_246627 - BLOCK
      ?auto_246628 - BLOCK
      ?auto_246629 - BLOCK
      ?auto_246630 - BLOCK
      ?auto_246631 - BLOCK
      ?auto_246632 - BLOCK
      ?auto_246633 - BLOCK
      ?auto_246634 - BLOCK
      ?auto_246635 - BLOCK
      ?auto_246636 - BLOCK
      ?auto_246637 - BLOCK
      ?auto_246638 - BLOCK
      ?auto_246639 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_246639 ) ( ON-TABLE ?auto_246627 ) ( ON ?auto_246628 ?auto_246627 ) ( ON ?auto_246629 ?auto_246628 ) ( ON ?auto_246630 ?auto_246629 ) ( ON ?auto_246631 ?auto_246630 ) ( ON ?auto_246632 ?auto_246631 ) ( ON ?auto_246633 ?auto_246632 ) ( ON ?auto_246634 ?auto_246633 ) ( ON ?auto_246635 ?auto_246634 ) ( not ( = ?auto_246627 ?auto_246628 ) ) ( not ( = ?auto_246627 ?auto_246629 ) ) ( not ( = ?auto_246627 ?auto_246630 ) ) ( not ( = ?auto_246627 ?auto_246631 ) ) ( not ( = ?auto_246627 ?auto_246632 ) ) ( not ( = ?auto_246627 ?auto_246633 ) ) ( not ( = ?auto_246627 ?auto_246634 ) ) ( not ( = ?auto_246627 ?auto_246635 ) ) ( not ( = ?auto_246627 ?auto_246636 ) ) ( not ( = ?auto_246627 ?auto_246637 ) ) ( not ( = ?auto_246627 ?auto_246638 ) ) ( not ( = ?auto_246627 ?auto_246639 ) ) ( not ( = ?auto_246628 ?auto_246629 ) ) ( not ( = ?auto_246628 ?auto_246630 ) ) ( not ( = ?auto_246628 ?auto_246631 ) ) ( not ( = ?auto_246628 ?auto_246632 ) ) ( not ( = ?auto_246628 ?auto_246633 ) ) ( not ( = ?auto_246628 ?auto_246634 ) ) ( not ( = ?auto_246628 ?auto_246635 ) ) ( not ( = ?auto_246628 ?auto_246636 ) ) ( not ( = ?auto_246628 ?auto_246637 ) ) ( not ( = ?auto_246628 ?auto_246638 ) ) ( not ( = ?auto_246628 ?auto_246639 ) ) ( not ( = ?auto_246629 ?auto_246630 ) ) ( not ( = ?auto_246629 ?auto_246631 ) ) ( not ( = ?auto_246629 ?auto_246632 ) ) ( not ( = ?auto_246629 ?auto_246633 ) ) ( not ( = ?auto_246629 ?auto_246634 ) ) ( not ( = ?auto_246629 ?auto_246635 ) ) ( not ( = ?auto_246629 ?auto_246636 ) ) ( not ( = ?auto_246629 ?auto_246637 ) ) ( not ( = ?auto_246629 ?auto_246638 ) ) ( not ( = ?auto_246629 ?auto_246639 ) ) ( not ( = ?auto_246630 ?auto_246631 ) ) ( not ( = ?auto_246630 ?auto_246632 ) ) ( not ( = ?auto_246630 ?auto_246633 ) ) ( not ( = ?auto_246630 ?auto_246634 ) ) ( not ( = ?auto_246630 ?auto_246635 ) ) ( not ( = ?auto_246630 ?auto_246636 ) ) ( not ( = ?auto_246630 ?auto_246637 ) ) ( not ( = ?auto_246630 ?auto_246638 ) ) ( not ( = ?auto_246630 ?auto_246639 ) ) ( not ( = ?auto_246631 ?auto_246632 ) ) ( not ( = ?auto_246631 ?auto_246633 ) ) ( not ( = ?auto_246631 ?auto_246634 ) ) ( not ( = ?auto_246631 ?auto_246635 ) ) ( not ( = ?auto_246631 ?auto_246636 ) ) ( not ( = ?auto_246631 ?auto_246637 ) ) ( not ( = ?auto_246631 ?auto_246638 ) ) ( not ( = ?auto_246631 ?auto_246639 ) ) ( not ( = ?auto_246632 ?auto_246633 ) ) ( not ( = ?auto_246632 ?auto_246634 ) ) ( not ( = ?auto_246632 ?auto_246635 ) ) ( not ( = ?auto_246632 ?auto_246636 ) ) ( not ( = ?auto_246632 ?auto_246637 ) ) ( not ( = ?auto_246632 ?auto_246638 ) ) ( not ( = ?auto_246632 ?auto_246639 ) ) ( not ( = ?auto_246633 ?auto_246634 ) ) ( not ( = ?auto_246633 ?auto_246635 ) ) ( not ( = ?auto_246633 ?auto_246636 ) ) ( not ( = ?auto_246633 ?auto_246637 ) ) ( not ( = ?auto_246633 ?auto_246638 ) ) ( not ( = ?auto_246633 ?auto_246639 ) ) ( not ( = ?auto_246634 ?auto_246635 ) ) ( not ( = ?auto_246634 ?auto_246636 ) ) ( not ( = ?auto_246634 ?auto_246637 ) ) ( not ( = ?auto_246634 ?auto_246638 ) ) ( not ( = ?auto_246634 ?auto_246639 ) ) ( not ( = ?auto_246635 ?auto_246636 ) ) ( not ( = ?auto_246635 ?auto_246637 ) ) ( not ( = ?auto_246635 ?auto_246638 ) ) ( not ( = ?auto_246635 ?auto_246639 ) ) ( not ( = ?auto_246636 ?auto_246637 ) ) ( not ( = ?auto_246636 ?auto_246638 ) ) ( not ( = ?auto_246636 ?auto_246639 ) ) ( not ( = ?auto_246637 ?auto_246638 ) ) ( not ( = ?auto_246637 ?auto_246639 ) ) ( not ( = ?auto_246638 ?auto_246639 ) ) ( ON ?auto_246638 ?auto_246639 ) ( ON ?auto_246637 ?auto_246638 ) ( CLEAR ?auto_246635 ) ( ON ?auto_246636 ?auto_246637 ) ( CLEAR ?auto_246636 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_246627 ?auto_246628 ?auto_246629 ?auto_246630 ?auto_246631 ?auto_246632 ?auto_246633 ?auto_246634 ?auto_246635 ?auto_246636 )
      ( MAKE-13PILE ?auto_246627 ?auto_246628 ?auto_246629 ?auto_246630 ?auto_246631 ?auto_246632 ?auto_246633 ?auto_246634 ?auto_246635 ?auto_246636 ?auto_246637 ?auto_246638 ?auto_246639 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_246653 - BLOCK
      ?auto_246654 - BLOCK
      ?auto_246655 - BLOCK
      ?auto_246656 - BLOCK
      ?auto_246657 - BLOCK
      ?auto_246658 - BLOCK
      ?auto_246659 - BLOCK
      ?auto_246660 - BLOCK
      ?auto_246661 - BLOCK
      ?auto_246662 - BLOCK
      ?auto_246663 - BLOCK
      ?auto_246664 - BLOCK
      ?auto_246665 - BLOCK
    )
    :vars
    (
      ?auto_246666 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_246665 ?auto_246666 ) ( ON-TABLE ?auto_246653 ) ( ON ?auto_246654 ?auto_246653 ) ( ON ?auto_246655 ?auto_246654 ) ( ON ?auto_246656 ?auto_246655 ) ( ON ?auto_246657 ?auto_246656 ) ( ON ?auto_246658 ?auto_246657 ) ( ON ?auto_246659 ?auto_246658 ) ( ON ?auto_246660 ?auto_246659 ) ( not ( = ?auto_246653 ?auto_246654 ) ) ( not ( = ?auto_246653 ?auto_246655 ) ) ( not ( = ?auto_246653 ?auto_246656 ) ) ( not ( = ?auto_246653 ?auto_246657 ) ) ( not ( = ?auto_246653 ?auto_246658 ) ) ( not ( = ?auto_246653 ?auto_246659 ) ) ( not ( = ?auto_246653 ?auto_246660 ) ) ( not ( = ?auto_246653 ?auto_246661 ) ) ( not ( = ?auto_246653 ?auto_246662 ) ) ( not ( = ?auto_246653 ?auto_246663 ) ) ( not ( = ?auto_246653 ?auto_246664 ) ) ( not ( = ?auto_246653 ?auto_246665 ) ) ( not ( = ?auto_246653 ?auto_246666 ) ) ( not ( = ?auto_246654 ?auto_246655 ) ) ( not ( = ?auto_246654 ?auto_246656 ) ) ( not ( = ?auto_246654 ?auto_246657 ) ) ( not ( = ?auto_246654 ?auto_246658 ) ) ( not ( = ?auto_246654 ?auto_246659 ) ) ( not ( = ?auto_246654 ?auto_246660 ) ) ( not ( = ?auto_246654 ?auto_246661 ) ) ( not ( = ?auto_246654 ?auto_246662 ) ) ( not ( = ?auto_246654 ?auto_246663 ) ) ( not ( = ?auto_246654 ?auto_246664 ) ) ( not ( = ?auto_246654 ?auto_246665 ) ) ( not ( = ?auto_246654 ?auto_246666 ) ) ( not ( = ?auto_246655 ?auto_246656 ) ) ( not ( = ?auto_246655 ?auto_246657 ) ) ( not ( = ?auto_246655 ?auto_246658 ) ) ( not ( = ?auto_246655 ?auto_246659 ) ) ( not ( = ?auto_246655 ?auto_246660 ) ) ( not ( = ?auto_246655 ?auto_246661 ) ) ( not ( = ?auto_246655 ?auto_246662 ) ) ( not ( = ?auto_246655 ?auto_246663 ) ) ( not ( = ?auto_246655 ?auto_246664 ) ) ( not ( = ?auto_246655 ?auto_246665 ) ) ( not ( = ?auto_246655 ?auto_246666 ) ) ( not ( = ?auto_246656 ?auto_246657 ) ) ( not ( = ?auto_246656 ?auto_246658 ) ) ( not ( = ?auto_246656 ?auto_246659 ) ) ( not ( = ?auto_246656 ?auto_246660 ) ) ( not ( = ?auto_246656 ?auto_246661 ) ) ( not ( = ?auto_246656 ?auto_246662 ) ) ( not ( = ?auto_246656 ?auto_246663 ) ) ( not ( = ?auto_246656 ?auto_246664 ) ) ( not ( = ?auto_246656 ?auto_246665 ) ) ( not ( = ?auto_246656 ?auto_246666 ) ) ( not ( = ?auto_246657 ?auto_246658 ) ) ( not ( = ?auto_246657 ?auto_246659 ) ) ( not ( = ?auto_246657 ?auto_246660 ) ) ( not ( = ?auto_246657 ?auto_246661 ) ) ( not ( = ?auto_246657 ?auto_246662 ) ) ( not ( = ?auto_246657 ?auto_246663 ) ) ( not ( = ?auto_246657 ?auto_246664 ) ) ( not ( = ?auto_246657 ?auto_246665 ) ) ( not ( = ?auto_246657 ?auto_246666 ) ) ( not ( = ?auto_246658 ?auto_246659 ) ) ( not ( = ?auto_246658 ?auto_246660 ) ) ( not ( = ?auto_246658 ?auto_246661 ) ) ( not ( = ?auto_246658 ?auto_246662 ) ) ( not ( = ?auto_246658 ?auto_246663 ) ) ( not ( = ?auto_246658 ?auto_246664 ) ) ( not ( = ?auto_246658 ?auto_246665 ) ) ( not ( = ?auto_246658 ?auto_246666 ) ) ( not ( = ?auto_246659 ?auto_246660 ) ) ( not ( = ?auto_246659 ?auto_246661 ) ) ( not ( = ?auto_246659 ?auto_246662 ) ) ( not ( = ?auto_246659 ?auto_246663 ) ) ( not ( = ?auto_246659 ?auto_246664 ) ) ( not ( = ?auto_246659 ?auto_246665 ) ) ( not ( = ?auto_246659 ?auto_246666 ) ) ( not ( = ?auto_246660 ?auto_246661 ) ) ( not ( = ?auto_246660 ?auto_246662 ) ) ( not ( = ?auto_246660 ?auto_246663 ) ) ( not ( = ?auto_246660 ?auto_246664 ) ) ( not ( = ?auto_246660 ?auto_246665 ) ) ( not ( = ?auto_246660 ?auto_246666 ) ) ( not ( = ?auto_246661 ?auto_246662 ) ) ( not ( = ?auto_246661 ?auto_246663 ) ) ( not ( = ?auto_246661 ?auto_246664 ) ) ( not ( = ?auto_246661 ?auto_246665 ) ) ( not ( = ?auto_246661 ?auto_246666 ) ) ( not ( = ?auto_246662 ?auto_246663 ) ) ( not ( = ?auto_246662 ?auto_246664 ) ) ( not ( = ?auto_246662 ?auto_246665 ) ) ( not ( = ?auto_246662 ?auto_246666 ) ) ( not ( = ?auto_246663 ?auto_246664 ) ) ( not ( = ?auto_246663 ?auto_246665 ) ) ( not ( = ?auto_246663 ?auto_246666 ) ) ( not ( = ?auto_246664 ?auto_246665 ) ) ( not ( = ?auto_246664 ?auto_246666 ) ) ( not ( = ?auto_246665 ?auto_246666 ) ) ( ON ?auto_246664 ?auto_246665 ) ( ON ?auto_246663 ?auto_246664 ) ( ON ?auto_246662 ?auto_246663 ) ( CLEAR ?auto_246660 ) ( ON ?auto_246661 ?auto_246662 ) ( CLEAR ?auto_246661 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_246653 ?auto_246654 ?auto_246655 ?auto_246656 ?auto_246657 ?auto_246658 ?auto_246659 ?auto_246660 ?auto_246661 )
      ( MAKE-13PILE ?auto_246653 ?auto_246654 ?auto_246655 ?auto_246656 ?auto_246657 ?auto_246658 ?auto_246659 ?auto_246660 ?auto_246661 ?auto_246662 ?auto_246663 ?auto_246664 ?auto_246665 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_246680 - BLOCK
      ?auto_246681 - BLOCK
      ?auto_246682 - BLOCK
      ?auto_246683 - BLOCK
      ?auto_246684 - BLOCK
      ?auto_246685 - BLOCK
      ?auto_246686 - BLOCK
      ?auto_246687 - BLOCK
      ?auto_246688 - BLOCK
      ?auto_246689 - BLOCK
      ?auto_246690 - BLOCK
      ?auto_246691 - BLOCK
      ?auto_246692 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_246692 ) ( ON-TABLE ?auto_246680 ) ( ON ?auto_246681 ?auto_246680 ) ( ON ?auto_246682 ?auto_246681 ) ( ON ?auto_246683 ?auto_246682 ) ( ON ?auto_246684 ?auto_246683 ) ( ON ?auto_246685 ?auto_246684 ) ( ON ?auto_246686 ?auto_246685 ) ( ON ?auto_246687 ?auto_246686 ) ( not ( = ?auto_246680 ?auto_246681 ) ) ( not ( = ?auto_246680 ?auto_246682 ) ) ( not ( = ?auto_246680 ?auto_246683 ) ) ( not ( = ?auto_246680 ?auto_246684 ) ) ( not ( = ?auto_246680 ?auto_246685 ) ) ( not ( = ?auto_246680 ?auto_246686 ) ) ( not ( = ?auto_246680 ?auto_246687 ) ) ( not ( = ?auto_246680 ?auto_246688 ) ) ( not ( = ?auto_246680 ?auto_246689 ) ) ( not ( = ?auto_246680 ?auto_246690 ) ) ( not ( = ?auto_246680 ?auto_246691 ) ) ( not ( = ?auto_246680 ?auto_246692 ) ) ( not ( = ?auto_246681 ?auto_246682 ) ) ( not ( = ?auto_246681 ?auto_246683 ) ) ( not ( = ?auto_246681 ?auto_246684 ) ) ( not ( = ?auto_246681 ?auto_246685 ) ) ( not ( = ?auto_246681 ?auto_246686 ) ) ( not ( = ?auto_246681 ?auto_246687 ) ) ( not ( = ?auto_246681 ?auto_246688 ) ) ( not ( = ?auto_246681 ?auto_246689 ) ) ( not ( = ?auto_246681 ?auto_246690 ) ) ( not ( = ?auto_246681 ?auto_246691 ) ) ( not ( = ?auto_246681 ?auto_246692 ) ) ( not ( = ?auto_246682 ?auto_246683 ) ) ( not ( = ?auto_246682 ?auto_246684 ) ) ( not ( = ?auto_246682 ?auto_246685 ) ) ( not ( = ?auto_246682 ?auto_246686 ) ) ( not ( = ?auto_246682 ?auto_246687 ) ) ( not ( = ?auto_246682 ?auto_246688 ) ) ( not ( = ?auto_246682 ?auto_246689 ) ) ( not ( = ?auto_246682 ?auto_246690 ) ) ( not ( = ?auto_246682 ?auto_246691 ) ) ( not ( = ?auto_246682 ?auto_246692 ) ) ( not ( = ?auto_246683 ?auto_246684 ) ) ( not ( = ?auto_246683 ?auto_246685 ) ) ( not ( = ?auto_246683 ?auto_246686 ) ) ( not ( = ?auto_246683 ?auto_246687 ) ) ( not ( = ?auto_246683 ?auto_246688 ) ) ( not ( = ?auto_246683 ?auto_246689 ) ) ( not ( = ?auto_246683 ?auto_246690 ) ) ( not ( = ?auto_246683 ?auto_246691 ) ) ( not ( = ?auto_246683 ?auto_246692 ) ) ( not ( = ?auto_246684 ?auto_246685 ) ) ( not ( = ?auto_246684 ?auto_246686 ) ) ( not ( = ?auto_246684 ?auto_246687 ) ) ( not ( = ?auto_246684 ?auto_246688 ) ) ( not ( = ?auto_246684 ?auto_246689 ) ) ( not ( = ?auto_246684 ?auto_246690 ) ) ( not ( = ?auto_246684 ?auto_246691 ) ) ( not ( = ?auto_246684 ?auto_246692 ) ) ( not ( = ?auto_246685 ?auto_246686 ) ) ( not ( = ?auto_246685 ?auto_246687 ) ) ( not ( = ?auto_246685 ?auto_246688 ) ) ( not ( = ?auto_246685 ?auto_246689 ) ) ( not ( = ?auto_246685 ?auto_246690 ) ) ( not ( = ?auto_246685 ?auto_246691 ) ) ( not ( = ?auto_246685 ?auto_246692 ) ) ( not ( = ?auto_246686 ?auto_246687 ) ) ( not ( = ?auto_246686 ?auto_246688 ) ) ( not ( = ?auto_246686 ?auto_246689 ) ) ( not ( = ?auto_246686 ?auto_246690 ) ) ( not ( = ?auto_246686 ?auto_246691 ) ) ( not ( = ?auto_246686 ?auto_246692 ) ) ( not ( = ?auto_246687 ?auto_246688 ) ) ( not ( = ?auto_246687 ?auto_246689 ) ) ( not ( = ?auto_246687 ?auto_246690 ) ) ( not ( = ?auto_246687 ?auto_246691 ) ) ( not ( = ?auto_246687 ?auto_246692 ) ) ( not ( = ?auto_246688 ?auto_246689 ) ) ( not ( = ?auto_246688 ?auto_246690 ) ) ( not ( = ?auto_246688 ?auto_246691 ) ) ( not ( = ?auto_246688 ?auto_246692 ) ) ( not ( = ?auto_246689 ?auto_246690 ) ) ( not ( = ?auto_246689 ?auto_246691 ) ) ( not ( = ?auto_246689 ?auto_246692 ) ) ( not ( = ?auto_246690 ?auto_246691 ) ) ( not ( = ?auto_246690 ?auto_246692 ) ) ( not ( = ?auto_246691 ?auto_246692 ) ) ( ON ?auto_246691 ?auto_246692 ) ( ON ?auto_246690 ?auto_246691 ) ( ON ?auto_246689 ?auto_246690 ) ( CLEAR ?auto_246687 ) ( ON ?auto_246688 ?auto_246689 ) ( CLEAR ?auto_246688 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_246680 ?auto_246681 ?auto_246682 ?auto_246683 ?auto_246684 ?auto_246685 ?auto_246686 ?auto_246687 ?auto_246688 )
      ( MAKE-13PILE ?auto_246680 ?auto_246681 ?auto_246682 ?auto_246683 ?auto_246684 ?auto_246685 ?auto_246686 ?auto_246687 ?auto_246688 ?auto_246689 ?auto_246690 ?auto_246691 ?auto_246692 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_246706 - BLOCK
      ?auto_246707 - BLOCK
      ?auto_246708 - BLOCK
      ?auto_246709 - BLOCK
      ?auto_246710 - BLOCK
      ?auto_246711 - BLOCK
      ?auto_246712 - BLOCK
      ?auto_246713 - BLOCK
      ?auto_246714 - BLOCK
      ?auto_246715 - BLOCK
      ?auto_246716 - BLOCK
      ?auto_246717 - BLOCK
      ?auto_246718 - BLOCK
    )
    :vars
    (
      ?auto_246719 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_246718 ?auto_246719 ) ( ON-TABLE ?auto_246706 ) ( ON ?auto_246707 ?auto_246706 ) ( ON ?auto_246708 ?auto_246707 ) ( ON ?auto_246709 ?auto_246708 ) ( ON ?auto_246710 ?auto_246709 ) ( ON ?auto_246711 ?auto_246710 ) ( ON ?auto_246712 ?auto_246711 ) ( not ( = ?auto_246706 ?auto_246707 ) ) ( not ( = ?auto_246706 ?auto_246708 ) ) ( not ( = ?auto_246706 ?auto_246709 ) ) ( not ( = ?auto_246706 ?auto_246710 ) ) ( not ( = ?auto_246706 ?auto_246711 ) ) ( not ( = ?auto_246706 ?auto_246712 ) ) ( not ( = ?auto_246706 ?auto_246713 ) ) ( not ( = ?auto_246706 ?auto_246714 ) ) ( not ( = ?auto_246706 ?auto_246715 ) ) ( not ( = ?auto_246706 ?auto_246716 ) ) ( not ( = ?auto_246706 ?auto_246717 ) ) ( not ( = ?auto_246706 ?auto_246718 ) ) ( not ( = ?auto_246706 ?auto_246719 ) ) ( not ( = ?auto_246707 ?auto_246708 ) ) ( not ( = ?auto_246707 ?auto_246709 ) ) ( not ( = ?auto_246707 ?auto_246710 ) ) ( not ( = ?auto_246707 ?auto_246711 ) ) ( not ( = ?auto_246707 ?auto_246712 ) ) ( not ( = ?auto_246707 ?auto_246713 ) ) ( not ( = ?auto_246707 ?auto_246714 ) ) ( not ( = ?auto_246707 ?auto_246715 ) ) ( not ( = ?auto_246707 ?auto_246716 ) ) ( not ( = ?auto_246707 ?auto_246717 ) ) ( not ( = ?auto_246707 ?auto_246718 ) ) ( not ( = ?auto_246707 ?auto_246719 ) ) ( not ( = ?auto_246708 ?auto_246709 ) ) ( not ( = ?auto_246708 ?auto_246710 ) ) ( not ( = ?auto_246708 ?auto_246711 ) ) ( not ( = ?auto_246708 ?auto_246712 ) ) ( not ( = ?auto_246708 ?auto_246713 ) ) ( not ( = ?auto_246708 ?auto_246714 ) ) ( not ( = ?auto_246708 ?auto_246715 ) ) ( not ( = ?auto_246708 ?auto_246716 ) ) ( not ( = ?auto_246708 ?auto_246717 ) ) ( not ( = ?auto_246708 ?auto_246718 ) ) ( not ( = ?auto_246708 ?auto_246719 ) ) ( not ( = ?auto_246709 ?auto_246710 ) ) ( not ( = ?auto_246709 ?auto_246711 ) ) ( not ( = ?auto_246709 ?auto_246712 ) ) ( not ( = ?auto_246709 ?auto_246713 ) ) ( not ( = ?auto_246709 ?auto_246714 ) ) ( not ( = ?auto_246709 ?auto_246715 ) ) ( not ( = ?auto_246709 ?auto_246716 ) ) ( not ( = ?auto_246709 ?auto_246717 ) ) ( not ( = ?auto_246709 ?auto_246718 ) ) ( not ( = ?auto_246709 ?auto_246719 ) ) ( not ( = ?auto_246710 ?auto_246711 ) ) ( not ( = ?auto_246710 ?auto_246712 ) ) ( not ( = ?auto_246710 ?auto_246713 ) ) ( not ( = ?auto_246710 ?auto_246714 ) ) ( not ( = ?auto_246710 ?auto_246715 ) ) ( not ( = ?auto_246710 ?auto_246716 ) ) ( not ( = ?auto_246710 ?auto_246717 ) ) ( not ( = ?auto_246710 ?auto_246718 ) ) ( not ( = ?auto_246710 ?auto_246719 ) ) ( not ( = ?auto_246711 ?auto_246712 ) ) ( not ( = ?auto_246711 ?auto_246713 ) ) ( not ( = ?auto_246711 ?auto_246714 ) ) ( not ( = ?auto_246711 ?auto_246715 ) ) ( not ( = ?auto_246711 ?auto_246716 ) ) ( not ( = ?auto_246711 ?auto_246717 ) ) ( not ( = ?auto_246711 ?auto_246718 ) ) ( not ( = ?auto_246711 ?auto_246719 ) ) ( not ( = ?auto_246712 ?auto_246713 ) ) ( not ( = ?auto_246712 ?auto_246714 ) ) ( not ( = ?auto_246712 ?auto_246715 ) ) ( not ( = ?auto_246712 ?auto_246716 ) ) ( not ( = ?auto_246712 ?auto_246717 ) ) ( not ( = ?auto_246712 ?auto_246718 ) ) ( not ( = ?auto_246712 ?auto_246719 ) ) ( not ( = ?auto_246713 ?auto_246714 ) ) ( not ( = ?auto_246713 ?auto_246715 ) ) ( not ( = ?auto_246713 ?auto_246716 ) ) ( not ( = ?auto_246713 ?auto_246717 ) ) ( not ( = ?auto_246713 ?auto_246718 ) ) ( not ( = ?auto_246713 ?auto_246719 ) ) ( not ( = ?auto_246714 ?auto_246715 ) ) ( not ( = ?auto_246714 ?auto_246716 ) ) ( not ( = ?auto_246714 ?auto_246717 ) ) ( not ( = ?auto_246714 ?auto_246718 ) ) ( not ( = ?auto_246714 ?auto_246719 ) ) ( not ( = ?auto_246715 ?auto_246716 ) ) ( not ( = ?auto_246715 ?auto_246717 ) ) ( not ( = ?auto_246715 ?auto_246718 ) ) ( not ( = ?auto_246715 ?auto_246719 ) ) ( not ( = ?auto_246716 ?auto_246717 ) ) ( not ( = ?auto_246716 ?auto_246718 ) ) ( not ( = ?auto_246716 ?auto_246719 ) ) ( not ( = ?auto_246717 ?auto_246718 ) ) ( not ( = ?auto_246717 ?auto_246719 ) ) ( not ( = ?auto_246718 ?auto_246719 ) ) ( ON ?auto_246717 ?auto_246718 ) ( ON ?auto_246716 ?auto_246717 ) ( ON ?auto_246715 ?auto_246716 ) ( ON ?auto_246714 ?auto_246715 ) ( CLEAR ?auto_246712 ) ( ON ?auto_246713 ?auto_246714 ) ( CLEAR ?auto_246713 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_246706 ?auto_246707 ?auto_246708 ?auto_246709 ?auto_246710 ?auto_246711 ?auto_246712 ?auto_246713 )
      ( MAKE-13PILE ?auto_246706 ?auto_246707 ?auto_246708 ?auto_246709 ?auto_246710 ?auto_246711 ?auto_246712 ?auto_246713 ?auto_246714 ?auto_246715 ?auto_246716 ?auto_246717 ?auto_246718 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_246733 - BLOCK
      ?auto_246734 - BLOCK
      ?auto_246735 - BLOCK
      ?auto_246736 - BLOCK
      ?auto_246737 - BLOCK
      ?auto_246738 - BLOCK
      ?auto_246739 - BLOCK
      ?auto_246740 - BLOCK
      ?auto_246741 - BLOCK
      ?auto_246742 - BLOCK
      ?auto_246743 - BLOCK
      ?auto_246744 - BLOCK
      ?auto_246745 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_246745 ) ( ON-TABLE ?auto_246733 ) ( ON ?auto_246734 ?auto_246733 ) ( ON ?auto_246735 ?auto_246734 ) ( ON ?auto_246736 ?auto_246735 ) ( ON ?auto_246737 ?auto_246736 ) ( ON ?auto_246738 ?auto_246737 ) ( ON ?auto_246739 ?auto_246738 ) ( not ( = ?auto_246733 ?auto_246734 ) ) ( not ( = ?auto_246733 ?auto_246735 ) ) ( not ( = ?auto_246733 ?auto_246736 ) ) ( not ( = ?auto_246733 ?auto_246737 ) ) ( not ( = ?auto_246733 ?auto_246738 ) ) ( not ( = ?auto_246733 ?auto_246739 ) ) ( not ( = ?auto_246733 ?auto_246740 ) ) ( not ( = ?auto_246733 ?auto_246741 ) ) ( not ( = ?auto_246733 ?auto_246742 ) ) ( not ( = ?auto_246733 ?auto_246743 ) ) ( not ( = ?auto_246733 ?auto_246744 ) ) ( not ( = ?auto_246733 ?auto_246745 ) ) ( not ( = ?auto_246734 ?auto_246735 ) ) ( not ( = ?auto_246734 ?auto_246736 ) ) ( not ( = ?auto_246734 ?auto_246737 ) ) ( not ( = ?auto_246734 ?auto_246738 ) ) ( not ( = ?auto_246734 ?auto_246739 ) ) ( not ( = ?auto_246734 ?auto_246740 ) ) ( not ( = ?auto_246734 ?auto_246741 ) ) ( not ( = ?auto_246734 ?auto_246742 ) ) ( not ( = ?auto_246734 ?auto_246743 ) ) ( not ( = ?auto_246734 ?auto_246744 ) ) ( not ( = ?auto_246734 ?auto_246745 ) ) ( not ( = ?auto_246735 ?auto_246736 ) ) ( not ( = ?auto_246735 ?auto_246737 ) ) ( not ( = ?auto_246735 ?auto_246738 ) ) ( not ( = ?auto_246735 ?auto_246739 ) ) ( not ( = ?auto_246735 ?auto_246740 ) ) ( not ( = ?auto_246735 ?auto_246741 ) ) ( not ( = ?auto_246735 ?auto_246742 ) ) ( not ( = ?auto_246735 ?auto_246743 ) ) ( not ( = ?auto_246735 ?auto_246744 ) ) ( not ( = ?auto_246735 ?auto_246745 ) ) ( not ( = ?auto_246736 ?auto_246737 ) ) ( not ( = ?auto_246736 ?auto_246738 ) ) ( not ( = ?auto_246736 ?auto_246739 ) ) ( not ( = ?auto_246736 ?auto_246740 ) ) ( not ( = ?auto_246736 ?auto_246741 ) ) ( not ( = ?auto_246736 ?auto_246742 ) ) ( not ( = ?auto_246736 ?auto_246743 ) ) ( not ( = ?auto_246736 ?auto_246744 ) ) ( not ( = ?auto_246736 ?auto_246745 ) ) ( not ( = ?auto_246737 ?auto_246738 ) ) ( not ( = ?auto_246737 ?auto_246739 ) ) ( not ( = ?auto_246737 ?auto_246740 ) ) ( not ( = ?auto_246737 ?auto_246741 ) ) ( not ( = ?auto_246737 ?auto_246742 ) ) ( not ( = ?auto_246737 ?auto_246743 ) ) ( not ( = ?auto_246737 ?auto_246744 ) ) ( not ( = ?auto_246737 ?auto_246745 ) ) ( not ( = ?auto_246738 ?auto_246739 ) ) ( not ( = ?auto_246738 ?auto_246740 ) ) ( not ( = ?auto_246738 ?auto_246741 ) ) ( not ( = ?auto_246738 ?auto_246742 ) ) ( not ( = ?auto_246738 ?auto_246743 ) ) ( not ( = ?auto_246738 ?auto_246744 ) ) ( not ( = ?auto_246738 ?auto_246745 ) ) ( not ( = ?auto_246739 ?auto_246740 ) ) ( not ( = ?auto_246739 ?auto_246741 ) ) ( not ( = ?auto_246739 ?auto_246742 ) ) ( not ( = ?auto_246739 ?auto_246743 ) ) ( not ( = ?auto_246739 ?auto_246744 ) ) ( not ( = ?auto_246739 ?auto_246745 ) ) ( not ( = ?auto_246740 ?auto_246741 ) ) ( not ( = ?auto_246740 ?auto_246742 ) ) ( not ( = ?auto_246740 ?auto_246743 ) ) ( not ( = ?auto_246740 ?auto_246744 ) ) ( not ( = ?auto_246740 ?auto_246745 ) ) ( not ( = ?auto_246741 ?auto_246742 ) ) ( not ( = ?auto_246741 ?auto_246743 ) ) ( not ( = ?auto_246741 ?auto_246744 ) ) ( not ( = ?auto_246741 ?auto_246745 ) ) ( not ( = ?auto_246742 ?auto_246743 ) ) ( not ( = ?auto_246742 ?auto_246744 ) ) ( not ( = ?auto_246742 ?auto_246745 ) ) ( not ( = ?auto_246743 ?auto_246744 ) ) ( not ( = ?auto_246743 ?auto_246745 ) ) ( not ( = ?auto_246744 ?auto_246745 ) ) ( ON ?auto_246744 ?auto_246745 ) ( ON ?auto_246743 ?auto_246744 ) ( ON ?auto_246742 ?auto_246743 ) ( ON ?auto_246741 ?auto_246742 ) ( CLEAR ?auto_246739 ) ( ON ?auto_246740 ?auto_246741 ) ( CLEAR ?auto_246740 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_246733 ?auto_246734 ?auto_246735 ?auto_246736 ?auto_246737 ?auto_246738 ?auto_246739 ?auto_246740 )
      ( MAKE-13PILE ?auto_246733 ?auto_246734 ?auto_246735 ?auto_246736 ?auto_246737 ?auto_246738 ?auto_246739 ?auto_246740 ?auto_246741 ?auto_246742 ?auto_246743 ?auto_246744 ?auto_246745 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_246759 - BLOCK
      ?auto_246760 - BLOCK
      ?auto_246761 - BLOCK
      ?auto_246762 - BLOCK
      ?auto_246763 - BLOCK
      ?auto_246764 - BLOCK
      ?auto_246765 - BLOCK
      ?auto_246766 - BLOCK
      ?auto_246767 - BLOCK
      ?auto_246768 - BLOCK
      ?auto_246769 - BLOCK
      ?auto_246770 - BLOCK
      ?auto_246771 - BLOCK
    )
    :vars
    (
      ?auto_246772 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_246771 ?auto_246772 ) ( ON-TABLE ?auto_246759 ) ( ON ?auto_246760 ?auto_246759 ) ( ON ?auto_246761 ?auto_246760 ) ( ON ?auto_246762 ?auto_246761 ) ( ON ?auto_246763 ?auto_246762 ) ( ON ?auto_246764 ?auto_246763 ) ( not ( = ?auto_246759 ?auto_246760 ) ) ( not ( = ?auto_246759 ?auto_246761 ) ) ( not ( = ?auto_246759 ?auto_246762 ) ) ( not ( = ?auto_246759 ?auto_246763 ) ) ( not ( = ?auto_246759 ?auto_246764 ) ) ( not ( = ?auto_246759 ?auto_246765 ) ) ( not ( = ?auto_246759 ?auto_246766 ) ) ( not ( = ?auto_246759 ?auto_246767 ) ) ( not ( = ?auto_246759 ?auto_246768 ) ) ( not ( = ?auto_246759 ?auto_246769 ) ) ( not ( = ?auto_246759 ?auto_246770 ) ) ( not ( = ?auto_246759 ?auto_246771 ) ) ( not ( = ?auto_246759 ?auto_246772 ) ) ( not ( = ?auto_246760 ?auto_246761 ) ) ( not ( = ?auto_246760 ?auto_246762 ) ) ( not ( = ?auto_246760 ?auto_246763 ) ) ( not ( = ?auto_246760 ?auto_246764 ) ) ( not ( = ?auto_246760 ?auto_246765 ) ) ( not ( = ?auto_246760 ?auto_246766 ) ) ( not ( = ?auto_246760 ?auto_246767 ) ) ( not ( = ?auto_246760 ?auto_246768 ) ) ( not ( = ?auto_246760 ?auto_246769 ) ) ( not ( = ?auto_246760 ?auto_246770 ) ) ( not ( = ?auto_246760 ?auto_246771 ) ) ( not ( = ?auto_246760 ?auto_246772 ) ) ( not ( = ?auto_246761 ?auto_246762 ) ) ( not ( = ?auto_246761 ?auto_246763 ) ) ( not ( = ?auto_246761 ?auto_246764 ) ) ( not ( = ?auto_246761 ?auto_246765 ) ) ( not ( = ?auto_246761 ?auto_246766 ) ) ( not ( = ?auto_246761 ?auto_246767 ) ) ( not ( = ?auto_246761 ?auto_246768 ) ) ( not ( = ?auto_246761 ?auto_246769 ) ) ( not ( = ?auto_246761 ?auto_246770 ) ) ( not ( = ?auto_246761 ?auto_246771 ) ) ( not ( = ?auto_246761 ?auto_246772 ) ) ( not ( = ?auto_246762 ?auto_246763 ) ) ( not ( = ?auto_246762 ?auto_246764 ) ) ( not ( = ?auto_246762 ?auto_246765 ) ) ( not ( = ?auto_246762 ?auto_246766 ) ) ( not ( = ?auto_246762 ?auto_246767 ) ) ( not ( = ?auto_246762 ?auto_246768 ) ) ( not ( = ?auto_246762 ?auto_246769 ) ) ( not ( = ?auto_246762 ?auto_246770 ) ) ( not ( = ?auto_246762 ?auto_246771 ) ) ( not ( = ?auto_246762 ?auto_246772 ) ) ( not ( = ?auto_246763 ?auto_246764 ) ) ( not ( = ?auto_246763 ?auto_246765 ) ) ( not ( = ?auto_246763 ?auto_246766 ) ) ( not ( = ?auto_246763 ?auto_246767 ) ) ( not ( = ?auto_246763 ?auto_246768 ) ) ( not ( = ?auto_246763 ?auto_246769 ) ) ( not ( = ?auto_246763 ?auto_246770 ) ) ( not ( = ?auto_246763 ?auto_246771 ) ) ( not ( = ?auto_246763 ?auto_246772 ) ) ( not ( = ?auto_246764 ?auto_246765 ) ) ( not ( = ?auto_246764 ?auto_246766 ) ) ( not ( = ?auto_246764 ?auto_246767 ) ) ( not ( = ?auto_246764 ?auto_246768 ) ) ( not ( = ?auto_246764 ?auto_246769 ) ) ( not ( = ?auto_246764 ?auto_246770 ) ) ( not ( = ?auto_246764 ?auto_246771 ) ) ( not ( = ?auto_246764 ?auto_246772 ) ) ( not ( = ?auto_246765 ?auto_246766 ) ) ( not ( = ?auto_246765 ?auto_246767 ) ) ( not ( = ?auto_246765 ?auto_246768 ) ) ( not ( = ?auto_246765 ?auto_246769 ) ) ( not ( = ?auto_246765 ?auto_246770 ) ) ( not ( = ?auto_246765 ?auto_246771 ) ) ( not ( = ?auto_246765 ?auto_246772 ) ) ( not ( = ?auto_246766 ?auto_246767 ) ) ( not ( = ?auto_246766 ?auto_246768 ) ) ( not ( = ?auto_246766 ?auto_246769 ) ) ( not ( = ?auto_246766 ?auto_246770 ) ) ( not ( = ?auto_246766 ?auto_246771 ) ) ( not ( = ?auto_246766 ?auto_246772 ) ) ( not ( = ?auto_246767 ?auto_246768 ) ) ( not ( = ?auto_246767 ?auto_246769 ) ) ( not ( = ?auto_246767 ?auto_246770 ) ) ( not ( = ?auto_246767 ?auto_246771 ) ) ( not ( = ?auto_246767 ?auto_246772 ) ) ( not ( = ?auto_246768 ?auto_246769 ) ) ( not ( = ?auto_246768 ?auto_246770 ) ) ( not ( = ?auto_246768 ?auto_246771 ) ) ( not ( = ?auto_246768 ?auto_246772 ) ) ( not ( = ?auto_246769 ?auto_246770 ) ) ( not ( = ?auto_246769 ?auto_246771 ) ) ( not ( = ?auto_246769 ?auto_246772 ) ) ( not ( = ?auto_246770 ?auto_246771 ) ) ( not ( = ?auto_246770 ?auto_246772 ) ) ( not ( = ?auto_246771 ?auto_246772 ) ) ( ON ?auto_246770 ?auto_246771 ) ( ON ?auto_246769 ?auto_246770 ) ( ON ?auto_246768 ?auto_246769 ) ( ON ?auto_246767 ?auto_246768 ) ( ON ?auto_246766 ?auto_246767 ) ( CLEAR ?auto_246764 ) ( ON ?auto_246765 ?auto_246766 ) ( CLEAR ?auto_246765 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_246759 ?auto_246760 ?auto_246761 ?auto_246762 ?auto_246763 ?auto_246764 ?auto_246765 )
      ( MAKE-13PILE ?auto_246759 ?auto_246760 ?auto_246761 ?auto_246762 ?auto_246763 ?auto_246764 ?auto_246765 ?auto_246766 ?auto_246767 ?auto_246768 ?auto_246769 ?auto_246770 ?auto_246771 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_246786 - BLOCK
      ?auto_246787 - BLOCK
      ?auto_246788 - BLOCK
      ?auto_246789 - BLOCK
      ?auto_246790 - BLOCK
      ?auto_246791 - BLOCK
      ?auto_246792 - BLOCK
      ?auto_246793 - BLOCK
      ?auto_246794 - BLOCK
      ?auto_246795 - BLOCK
      ?auto_246796 - BLOCK
      ?auto_246797 - BLOCK
      ?auto_246798 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_246798 ) ( ON-TABLE ?auto_246786 ) ( ON ?auto_246787 ?auto_246786 ) ( ON ?auto_246788 ?auto_246787 ) ( ON ?auto_246789 ?auto_246788 ) ( ON ?auto_246790 ?auto_246789 ) ( ON ?auto_246791 ?auto_246790 ) ( not ( = ?auto_246786 ?auto_246787 ) ) ( not ( = ?auto_246786 ?auto_246788 ) ) ( not ( = ?auto_246786 ?auto_246789 ) ) ( not ( = ?auto_246786 ?auto_246790 ) ) ( not ( = ?auto_246786 ?auto_246791 ) ) ( not ( = ?auto_246786 ?auto_246792 ) ) ( not ( = ?auto_246786 ?auto_246793 ) ) ( not ( = ?auto_246786 ?auto_246794 ) ) ( not ( = ?auto_246786 ?auto_246795 ) ) ( not ( = ?auto_246786 ?auto_246796 ) ) ( not ( = ?auto_246786 ?auto_246797 ) ) ( not ( = ?auto_246786 ?auto_246798 ) ) ( not ( = ?auto_246787 ?auto_246788 ) ) ( not ( = ?auto_246787 ?auto_246789 ) ) ( not ( = ?auto_246787 ?auto_246790 ) ) ( not ( = ?auto_246787 ?auto_246791 ) ) ( not ( = ?auto_246787 ?auto_246792 ) ) ( not ( = ?auto_246787 ?auto_246793 ) ) ( not ( = ?auto_246787 ?auto_246794 ) ) ( not ( = ?auto_246787 ?auto_246795 ) ) ( not ( = ?auto_246787 ?auto_246796 ) ) ( not ( = ?auto_246787 ?auto_246797 ) ) ( not ( = ?auto_246787 ?auto_246798 ) ) ( not ( = ?auto_246788 ?auto_246789 ) ) ( not ( = ?auto_246788 ?auto_246790 ) ) ( not ( = ?auto_246788 ?auto_246791 ) ) ( not ( = ?auto_246788 ?auto_246792 ) ) ( not ( = ?auto_246788 ?auto_246793 ) ) ( not ( = ?auto_246788 ?auto_246794 ) ) ( not ( = ?auto_246788 ?auto_246795 ) ) ( not ( = ?auto_246788 ?auto_246796 ) ) ( not ( = ?auto_246788 ?auto_246797 ) ) ( not ( = ?auto_246788 ?auto_246798 ) ) ( not ( = ?auto_246789 ?auto_246790 ) ) ( not ( = ?auto_246789 ?auto_246791 ) ) ( not ( = ?auto_246789 ?auto_246792 ) ) ( not ( = ?auto_246789 ?auto_246793 ) ) ( not ( = ?auto_246789 ?auto_246794 ) ) ( not ( = ?auto_246789 ?auto_246795 ) ) ( not ( = ?auto_246789 ?auto_246796 ) ) ( not ( = ?auto_246789 ?auto_246797 ) ) ( not ( = ?auto_246789 ?auto_246798 ) ) ( not ( = ?auto_246790 ?auto_246791 ) ) ( not ( = ?auto_246790 ?auto_246792 ) ) ( not ( = ?auto_246790 ?auto_246793 ) ) ( not ( = ?auto_246790 ?auto_246794 ) ) ( not ( = ?auto_246790 ?auto_246795 ) ) ( not ( = ?auto_246790 ?auto_246796 ) ) ( not ( = ?auto_246790 ?auto_246797 ) ) ( not ( = ?auto_246790 ?auto_246798 ) ) ( not ( = ?auto_246791 ?auto_246792 ) ) ( not ( = ?auto_246791 ?auto_246793 ) ) ( not ( = ?auto_246791 ?auto_246794 ) ) ( not ( = ?auto_246791 ?auto_246795 ) ) ( not ( = ?auto_246791 ?auto_246796 ) ) ( not ( = ?auto_246791 ?auto_246797 ) ) ( not ( = ?auto_246791 ?auto_246798 ) ) ( not ( = ?auto_246792 ?auto_246793 ) ) ( not ( = ?auto_246792 ?auto_246794 ) ) ( not ( = ?auto_246792 ?auto_246795 ) ) ( not ( = ?auto_246792 ?auto_246796 ) ) ( not ( = ?auto_246792 ?auto_246797 ) ) ( not ( = ?auto_246792 ?auto_246798 ) ) ( not ( = ?auto_246793 ?auto_246794 ) ) ( not ( = ?auto_246793 ?auto_246795 ) ) ( not ( = ?auto_246793 ?auto_246796 ) ) ( not ( = ?auto_246793 ?auto_246797 ) ) ( not ( = ?auto_246793 ?auto_246798 ) ) ( not ( = ?auto_246794 ?auto_246795 ) ) ( not ( = ?auto_246794 ?auto_246796 ) ) ( not ( = ?auto_246794 ?auto_246797 ) ) ( not ( = ?auto_246794 ?auto_246798 ) ) ( not ( = ?auto_246795 ?auto_246796 ) ) ( not ( = ?auto_246795 ?auto_246797 ) ) ( not ( = ?auto_246795 ?auto_246798 ) ) ( not ( = ?auto_246796 ?auto_246797 ) ) ( not ( = ?auto_246796 ?auto_246798 ) ) ( not ( = ?auto_246797 ?auto_246798 ) ) ( ON ?auto_246797 ?auto_246798 ) ( ON ?auto_246796 ?auto_246797 ) ( ON ?auto_246795 ?auto_246796 ) ( ON ?auto_246794 ?auto_246795 ) ( ON ?auto_246793 ?auto_246794 ) ( CLEAR ?auto_246791 ) ( ON ?auto_246792 ?auto_246793 ) ( CLEAR ?auto_246792 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_246786 ?auto_246787 ?auto_246788 ?auto_246789 ?auto_246790 ?auto_246791 ?auto_246792 )
      ( MAKE-13PILE ?auto_246786 ?auto_246787 ?auto_246788 ?auto_246789 ?auto_246790 ?auto_246791 ?auto_246792 ?auto_246793 ?auto_246794 ?auto_246795 ?auto_246796 ?auto_246797 ?auto_246798 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_246812 - BLOCK
      ?auto_246813 - BLOCK
      ?auto_246814 - BLOCK
      ?auto_246815 - BLOCK
      ?auto_246816 - BLOCK
      ?auto_246817 - BLOCK
      ?auto_246818 - BLOCK
      ?auto_246819 - BLOCK
      ?auto_246820 - BLOCK
      ?auto_246821 - BLOCK
      ?auto_246822 - BLOCK
      ?auto_246823 - BLOCK
      ?auto_246824 - BLOCK
    )
    :vars
    (
      ?auto_246825 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_246824 ?auto_246825 ) ( ON-TABLE ?auto_246812 ) ( ON ?auto_246813 ?auto_246812 ) ( ON ?auto_246814 ?auto_246813 ) ( ON ?auto_246815 ?auto_246814 ) ( ON ?auto_246816 ?auto_246815 ) ( not ( = ?auto_246812 ?auto_246813 ) ) ( not ( = ?auto_246812 ?auto_246814 ) ) ( not ( = ?auto_246812 ?auto_246815 ) ) ( not ( = ?auto_246812 ?auto_246816 ) ) ( not ( = ?auto_246812 ?auto_246817 ) ) ( not ( = ?auto_246812 ?auto_246818 ) ) ( not ( = ?auto_246812 ?auto_246819 ) ) ( not ( = ?auto_246812 ?auto_246820 ) ) ( not ( = ?auto_246812 ?auto_246821 ) ) ( not ( = ?auto_246812 ?auto_246822 ) ) ( not ( = ?auto_246812 ?auto_246823 ) ) ( not ( = ?auto_246812 ?auto_246824 ) ) ( not ( = ?auto_246812 ?auto_246825 ) ) ( not ( = ?auto_246813 ?auto_246814 ) ) ( not ( = ?auto_246813 ?auto_246815 ) ) ( not ( = ?auto_246813 ?auto_246816 ) ) ( not ( = ?auto_246813 ?auto_246817 ) ) ( not ( = ?auto_246813 ?auto_246818 ) ) ( not ( = ?auto_246813 ?auto_246819 ) ) ( not ( = ?auto_246813 ?auto_246820 ) ) ( not ( = ?auto_246813 ?auto_246821 ) ) ( not ( = ?auto_246813 ?auto_246822 ) ) ( not ( = ?auto_246813 ?auto_246823 ) ) ( not ( = ?auto_246813 ?auto_246824 ) ) ( not ( = ?auto_246813 ?auto_246825 ) ) ( not ( = ?auto_246814 ?auto_246815 ) ) ( not ( = ?auto_246814 ?auto_246816 ) ) ( not ( = ?auto_246814 ?auto_246817 ) ) ( not ( = ?auto_246814 ?auto_246818 ) ) ( not ( = ?auto_246814 ?auto_246819 ) ) ( not ( = ?auto_246814 ?auto_246820 ) ) ( not ( = ?auto_246814 ?auto_246821 ) ) ( not ( = ?auto_246814 ?auto_246822 ) ) ( not ( = ?auto_246814 ?auto_246823 ) ) ( not ( = ?auto_246814 ?auto_246824 ) ) ( not ( = ?auto_246814 ?auto_246825 ) ) ( not ( = ?auto_246815 ?auto_246816 ) ) ( not ( = ?auto_246815 ?auto_246817 ) ) ( not ( = ?auto_246815 ?auto_246818 ) ) ( not ( = ?auto_246815 ?auto_246819 ) ) ( not ( = ?auto_246815 ?auto_246820 ) ) ( not ( = ?auto_246815 ?auto_246821 ) ) ( not ( = ?auto_246815 ?auto_246822 ) ) ( not ( = ?auto_246815 ?auto_246823 ) ) ( not ( = ?auto_246815 ?auto_246824 ) ) ( not ( = ?auto_246815 ?auto_246825 ) ) ( not ( = ?auto_246816 ?auto_246817 ) ) ( not ( = ?auto_246816 ?auto_246818 ) ) ( not ( = ?auto_246816 ?auto_246819 ) ) ( not ( = ?auto_246816 ?auto_246820 ) ) ( not ( = ?auto_246816 ?auto_246821 ) ) ( not ( = ?auto_246816 ?auto_246822 ) ) ( not ( = ?auto_246816 ?auto_246823 ) ) ( not ( = ?auto_246816 ?auto_246824 ) ) ( not ( = ?auto_246816 ?auto_246825 ) ) ( not ( = ?auto_246817 ?auto_246818 ) ) ( not ( = ?auto_246817 ?auto_246819 ) ) ( not ( = ?auto_246817 ?auto_246820 ) ) ( not ( = ?auto_246817 ?auto_246821 ) ) ( not ( = ?auto_246817 ?auto_246822 ) ) ( not ( = ?auto_246817 ?auto_246823 ) ) ( not ( = ?auto_246817 ?auto_246824 ) ) ( not ( = ?auto_246817 ?auto_246825 ) ) ( not ( = ?auto_246818 ?auto_246819 ) ) ( not ( = ?auto_246818 ?auto_246820 ) ) ( not ( = ?auto_246818 ?auto_246821 ) ) ( not ( = ?auto_246818 ?auto_246822 ) ) ( not ( = ?auto_246818 ?auto_246823 ) ) ( not ( = ?auto_246818 ?auto_246824 ) ) ( not ( = ?auto_246818 ?auto_246825 ) ) ( not ( = ?auto_246819 ?auto_246820 ) ) ( not ( = ?auto_246819 ?auto_246821 ) ) ( not ( = ?auto_246819 ?auto_246822 ) ) ( not ( = ?auto_246819 ?auto_246823 ) ) ( not ( = ?auto_246819 ?auto_246824 ) ) ( not ( = ?auto_246819 ?auto_246825 ) ) ( not ( = ?auto_246820 ?auto_246821 ) ) ( not ( = ?auto_246820 ?auto_246822 ) ) ( not ( = ?auto_246820 ?auto_246823 ) ) ( not ( = ?auto_246820 ?auto_246824 ) ) ( not ( = ?auto_246820 ?auto_246825 ) ) ( not ( = ?auto_246821 ?auto_246822 ) ) ( not ( = ?auto_246821 ?auto_246823 ) ) ( not ( = ?auto_246821 ?auto_246824 ) ) ( not ( = ?auto_246821 ?auto_246825 ) ) ( not ( = ?auto_246822 ?auto_246823 ) ) ( not ( = ?auto_246822 ?auto_246824 ) ) ( not ( = ?auto_246822 ?auto_246825 ) ) ( not ( = ?auto_246823 ?auto_246824 ) ) ( not ( = ?auto_246823 ?auto_246825 ) ) ( not ( = ?auto_246824 ?auto_246825 ) ) ( ON ?auto_246823 ?auto_246824 ) ( ON ?auto_246822 ?auto_246823 ) ( ON ?auto_246821 ?auto_246822 ) ( ON ?auto_246820 ?auto_246821 ) ( ON ?auto_246819 ?auto_246820 ) ( ON ?auto_246818 ?auto_246819 ) ( CLEAR ?auto_246816 ) ( ON ?auto_246817 ?auto_246818 ) ( CLEAR ?auto_246817 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_246812 ?auto_246813 ?auto_246814 ?auto_246815 ?auto_246816 ?auto_246817 )
      ( MAKE-13PILE ?auto_246812 ?auto_246813 ?auto_246814 ?auto_246815 ?auto_246816 ?auto_246817 ?auto_246818 ?auto_246819 ?auto_246820 ?auto_246821 ?auto_246822 ?auto_246823 ?auto_246824 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_246839 - BLOCK
      ?auto_246840 - BLOCK
      ?auto_246841 - BLOCK
      ?auto_246842 - BLOCK
      ?auto_246843 - BLOCK
      ?auto_246844 - BLOCK
      ?auto_246845 - BLOCK
      ?auto_246846 - BLOCK
      ?auto_246847 - BLOCK
      ?auto_246848 - BLOCK
      ?auto_246849 - BLOCK
      ?auto_246850 - BLOCK
      ?auto_246851 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_246851 ) ( ON-TABLE ?auto_246839 ) ( ON ?auto_246840 ?auto_246839 ) ( ON ?auto_246841 ?auto_246840 ) ( ON ?auto_246842 ?auto_246841 ) ( ON ?auto_246843 ?auto_246842 ) ( not ( = ?auto_246839 ?auto_246840 ) ) ( not ( = ?auto_246839 ?auto_246841 ) ) ( not ( = ?auto_246839 ?auto_246842 ) ) ( not ( = ?auto_246839 ?auto_246843 ) ) ( not ( = ?auto_246839 ?auto_246844 ) ) ( not ( = ?auto_246839 ?auto_246845 ) ) ( not ( = ?auto_246839 ?auto_246846 ) ) ( not ( = ?auto_246839 ?auto_246847 ) ) ( not ( = ?auto_246839 ?auto_246848 ) ) ( not ( = ?auto_246839 ?auto_246849 ) ) ( not ( = ?auto_246839 ?auto_246850 ) ) ( not ( = ?auto_246839 ?auto_246851 ) ) ( not ( = ?auto_246840 ?auto_246841 ) ) ( not ( = ?auto_246840 ?auto_246842 ) ) ( not ( = ?auto_246840 ?auto_246843 ) ) ( not ( = ?auto_246840 ?auto_246844 ) ) ( not ( = ?auto_246840 ?auto_246845 ) ) ( not ( = ?auto_246840 ?auto_246846 ) ) ( not ( = ?auto_246840 ?auto_246847 ) ) ( not ( = ?auto_246840 ?auto_246848 ) ) ( not ( = ?auto_246840 ?auto_246849 ) ) ( not ( = ?auto_246840 ?auto_246850 ) ) ( not ( = ?auto_246840 ?auto_246851 ) ) ( not ( = ?auto_246841 ?auto_246842 ) ) ( not ( = ?auto_246841 ?auto_246843 ) ) ( not ( = ?auto_246841 ?auto_246844 ) ) ( not ( = ?auto_246841 ?auto_246845 ) ) ( not ( = ?auto_246841 ?auto_246846 ) ) ( not ( = ?auto_246841 ?auto_246847 ) ) ( not ( = ?auto_246841 ?auto_246848 ) ) ( not ( = ?auto_246841 ?auto_246849 ) ) ( not ( = ?auto_246841 ?auto_246850 ) ) ( not ( = ?auto_246841 ?auto_246851 ) ) ( not ( = ?auto_246842 ?auto_246843 ) ) ( not ( = ?auto_246842 ?auto_246844 ) ) ( not ( = ?auto_246842 ?auto_246845 ) ) ( not ( = ?auto_246842 ?auto_246846 ) ) ( not ( = ?auto_246842 ?auto_246847 ) ) ( not ( = ?auto_246842 ?auto_246848 ) ) ( not ( = ?auto_246842 ?auto_246849 ) ) ( not ( = ?auto_246842 ?auto_246850 ) ) ( not ( = ?auto_246842 ?auto_246851 ) ) ( not ( = ?auto_246843 ?auto_246844 ) ) ( not ( = ?auto_246843 ?auto_246845 ) ) ( not ( = ?auto_246843 ?auto_246846 ) ) ( not ( = ?auto_246843 ?auto_246847 ) ) ( not ( = ?auto_246843 ?auto_246848 ) ) ( not ( = ?auto_246843 ?auto_246849 ) ) ( not ( = ?auto_246843 ?auto_246850 ) ) ( not ( = ?auto_246843 ?auto_246851 ) ) ( not ( = ?auto_246844 ?auto_246845 ) ) ( not ( = ?auto_246844 ?auto_246846 ) ) ( not ( = ?auto_246844 ?auto_246847 ) ) ( not ( = ?auto_246844 ?auto_246848 ) ) ( not ( = ?auto_246844 ?auto_246849 ) ) ( not ( = ?auto_246844 ?auto_246850 ) ) ( not ( = ?auto_246844 ?auto_246851 ) ) ( not ( = ?auto_246845 ?auto_246846 ) ) ( not ( = ?auto_246845 ?auto_246847 ) ) ( not ( = ?auto_246845 ?auto_246848 ) ) ( not ( = ?auto_246845 ?auto_246849 ) ) ( not ( = ?auto_246845 ?auto_246850 ) ) ( not ( = ?auto_246845 ?auto_246851 ) ) ( not ( = ?auto_246846 ?auto_246847 ) ) ( not ( = ?auto_246846 ?auto_246848 ) ) ( not ( = ?auto_246846 ?auto_246849 ) ) ( not ( = ?auto_246846 ?auto_246850 ) ) ( not ( = ?auto_246846 ?auto_246851 ) ) ( not ( = ?auto_246847 ?auto_246848 ) ) ( not ( = ?auto_246847 ?auto_246849 ) ) ( not ( = ?auto_246847 ?auto_246850 ) ) ( not ( = ?auto_246847 ?auto_246851 ) ) ( not ( = ?auto_246848 ?auto_246849 ) ) ( not ( = ?auto_246848 ?auto_246850 ) ) ( not ( = ?auto_246848 ?auto_246851 ) ) ( not ( = ?auto_246849 ?auto_246850 ) ) ( not ( = ?auto_246849 ?auto_246851 ) ) ( not ( = ?auto_246850 ?auto_246851 ) ) ( ON ?auto_246850 ?auto_246851 ) ( ON ?auto_246849 ?auto_246850 ) ( ON ?auto_246848 ?auto_246849 ) ( ON ?auto_246847 ?auto_246848 ) ( ON ?auto_246846 ?auto_246847 ) ( ON ?auto_246845 ?auto_246846 ) ( CLEAR ?auto_246843 ) ( ON ?auto_246844 ?auto_246845 ) ( CLEAR ?auto_246844 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_246839 ?auto_246840 ?auto_246841 ?auto_246842 ?auto_246843 ?auto_246844 )
      ( MAKE-13PILE ?auto_246839 ?auto_246840 ?auto_246841 ?auto_246842 ?auto_246843 ?auto_246844 ?auto_246845 ?auto_246846 ?auto_246847 ?auto_246848 ?auto_246849 ?auto_246850 ?auto_246851 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_246865 - BLOCK
      ?auto_246866 - BLOCK
      ?auto_246867 - BLOCK
      ?auto_246868 - BLOCK
      ?auto_246869 - BLOCK
      ?auto_246870 - BLOCK
      ?auto_246871 - BLOCK
      ?auto_246872 - BLOCK
      ?auto_246873 - BLOCK
      ?auto_246874 - BLOCK
      ?auto_246875 - BLOCK
      ?auto_246876 - BLOCK
      ?auto_246877 - BLOCK
    )
    :vars
    (
      ?auto_246878 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_246877 ?auto_246878 ) ( ON-TABLE ?auto_246865 ) ( ON ?auto_246866 ?auto_246865 ) ( ON ?auto_246867 ?auto_246866 ) ( ON ?auto_246868 ?auto_246867 ) ( not ( = ?auto_246865 ?auto_246866 ) ) ( not ( = ?auto_246865 ?auto_246867 ) ) ( not ( = ?auto_246865 ?auto_246868 ) ) ( not ( = ?auto_246865 ?auto_246869 ) ) ( not ( = ?auto_246865 ?auto_246870 ) ) ( not ( = ?auto_246865 ?auto_246871 ) ) ( not ( = ?auto_246865 ?auto_246872 ) ) ( not ( = ?auto_246865 ?auto_246873 ) ) ( not ( = ?auto_246865 ?auto_246874 ) ) ( not ( = ?auto_246865 ?auto_246875 ) ) ( not ( = ?auto_246865 ?auto_246876 ) ) ( not ( = ?auto_246865 ?auto_246877 ) ) ( not ( = ?auto_246865 ?auto_246878 ) ) ( not ( = ?auto_246866 ?auto_246867 ) ) ( not ( = ?auto_246866 ?auto_246868 ) ) ( not ( = ?auto_246866 ?auto_246869 ) ) ( not ( = ?auto_246866 ?auto_246870 ) ) ( not ( = ?auto_246866 ?auto_246871 ) ) ( not ( = ?auto_246866 ?auto_246872 ) ) ( not ( = ?auto_246866 ?auto_246873 ) ) ( not ( = ?auto_246866 ?auto_246874 ) ) ( not ( = ?auto_246866 ?auto_246875 ) ) ( not ( = ?auto_246866 ?auto_246876 ) ) ( not ( = ?auto_246866 ?auto_246877 ) ) ( not ( = ?auto_246866 ?auto_246878 ) ) ( not ( = ?auto_246867 ?auto_246868 ) ) ( not ( = ?auto_246867 ?auto_246869 ) ) ( not ( = ?auto_246867 ?auto_246870 ) ) ( not ( = ?auto_246867 ?auto_246871 ) ) ( not ( = ?auto_246867 ?auto_246872 ) ) ( not ( = ?auto_246867 ?auto_246873 ) ) ( not ( = ?auto_246867 ?auto_246874 ) ) ( not ( = ?auto_246867 ?auto_246875 ) ) ( not ( = ?auto_246867 ?auto_246876 ) ) ( not ( = ?auto_246867 ?auto_246877 ) ) ( not ( = ?auto_246867 ?auto_246878 ) ) ( not ( = ?auto_246868 ?auto_246869 ) ) ( not ( = ?auto_246868 ?auto_246870 ) ) ( not ( = ?auto_246868 ?auto_246871 ) ) ( not ( = ?auto_246868 ?auto_246872 ) ) ( not ( = ?auto_246868 ?auto_246873 ) ) ( not ( = ?auto_246868 ?auto_246874 ) ) ( not ( = ?auto_246868 ?auto_246875 ) ) ( not ( = ?auto_246868 ?auto_246876 ) ) ( not ( = ?auto_246868 ?auto_246877 ) ) ( not ( = ?auto_246868 ?auto_246878 ) ) ( not ( = ?auto_246869 ?auto_246870 ) ) ( not ( = ?auto_246869 ?auto_246871 ) ) ( not ( = ?auto_246869 ?auto_246872 ) ) ( not ( = ?auto_246869 ?auto_246873 ) ) ( not ( = ?auto_246869 ?auto_246874 ) ) ( not ( = ?auto_246869 ?auto_246875 ) ) ( not ( = ?auto_246869 ?auto_246876 ) ) ( not ( = ?auto_246869 ?auto_246877 ) ) ( not ( = ?auto_246869 ?auto_246878 ) ) ( not ( = ?auto_246870 ?auto_246871 ) ) ( not ( = ?auto_246870 ?auto_246872 ) ) ( not ( = ?auto_246870 ?auto_246873 ) ) ( not ( = ?auto_246870 ?auto_246874 ) ) ( not ( = ?auto_246870 ?auto_246875 ) ) ( not ( = ?auto_246870 ?auto_246876 ) ) ( not ( = ?auto_246870 ?auto_246877 ) ) ( not ( = ?auto_246870 ?auto_246878 ) ) ( not ( = ?auto_246871 ?auto_246872 ) ) ( not ( = ?auto_246871 ?auto_246873 ) ) ( not ( = ?auto_246871 ?auto_246874 ) ) ( not ( = ?auto_246871 ?auto_246875 ) ) ( not ( = ?auto_246871 ?auto_246876 ) ) ( not ( = ?auto_246871 ?auto_246877 ) ) ( not ( = ?auto_246871 ?auto_246878 ) ) ( not ( = ?auto_246872 ?auto_246873 ) ) ( not ( = ?auto_246872 ?auto_246874 ) ) ( not ( = ?auto_246872 ?auto_246875 ) ) ( not ( = ?auto_246872 ?auto_246876 ) ) ( not ( = ?auto_246872 ?auto_246877 ) ) ( not ( = ?auto_246872 ?auto_246878 ) ) ( not ( = ?auto_246873 ?auto_246874 ) ) ( not ( = ?auto_246873 ?auto_246875 ) ) ( not ( = ?auto_246873 ?auto_246876 ) ) ( not ( = ?auto_246873 ?auto_246877 ) ) ( not ( = ?auto_246873 ?auto_246878 ) ) ( not ( = ?auto_246874 ?auto_246875 ) ) ( not ( = ?auto_246874 ?auto_246876 ) ) ( not ( = ?auto_246874 ?auto_246877 ) ) ( not ( = ?auto_246874 ?auto_246878 ) ) ( not ( = ?auto_246875 ?auto_246876 ) ) ( not ( = ?auto_246875 ?auto_246877 ) ) ( not ( = ?auto_246875 ?auto_246878 ) ) ( not ( = ?auto_246876 ?auto_246877 ) ) ( not ( = ?auto_246876 ?auto_246878 ) ) ( not ( = ?auto_246877 ?auto_246878 ) ) ( ON ?auto_246876 ?auto_246877 ) ( ON ?auto_246875 ?auto_246876 ) ( ON ?auto_246874 ?auto_246875 ) ( ON ?auto_246873 ?auto_246874 ) ( ON ?auto_246872 ?auto_246873 ) ( ON ?auto_246871 ?auto_246872 ) ( ON ?auto_246870 ?auto_246871 ) ( CLEAR ?auto_246868 ) ( ON ?auto_246869 ?auto_246870 ) ( CLEAR ?auto_246869 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_246865 ?auto_246866 ?auto_246867 ?auto_246868 ?auto_246869 )
      ( MAKE-13PILE ?auto_246865 ?auto_246866 ?auto_246867 ?auto_246868 ?auto_246869 ?auto_246870 ?auto_246871 ?auto_246872 ?auto_246873 ?auto_246874 ?auto_246875 ?auto_246876 ?auto_246877 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_246892 - BLOCK
      ?auto_246893 - BLOCK
      ?auto_246894 - BLOCK
      ?auto_246895 - BLOCK
      ?auto_246896 - BLOCK
      ?auto_246897 - BLOCK
      ?auto_246898 - BLOCK
      ?auto_246899 - BLOCK
      ?auto_246900 - BLOCK
      ?auto_246901 - BLOCK
      ?auto_246902 - BLOCK
      ?auto_246903 - BLOCK
      ?auto_246904 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_246904 ) ( ON-TABLE ?auto_246892 ) ( ON ?auto_246893 ?auto_246892 ) ( ON ?auto_246894 ?auto_246893 ) ( ON ?auto_246895 ?auto_246894 ) ( not ( = ?auto_246892 ?auto_246893 ) ) ( not ( = ?auto_246892 ?auto_246894 ) ) ( not ( = ?auto_246892 ?auto_246895 ) ) ( not ( = ?auto_246892 ?auto_246896 ) ) ( not ( = ?auto_246892 ?auto_246897 ) ) ( not ( = ?auto_246892 ?auto_246898 ) ) ( not ( = ?auto_246892 ?auto_246899 ) ) ( not ( = ?auto_246892 ?auto_246900 ) ) ( not ( = ?auto_246892 ?auto_246901 ) ) ( not ( = ?auto_246892 ?auto_246902 ) ) ( not ( = ?auto_246892 ?auto_246903 ) ) ( not ( = ?auto_246892 ?auto_246904 ) ) ( not ( = ?auto_246893 ?auto_246894 ) ) ( not ( = ?auto_246893 ?auto_246895 ) ) ( not ( = ?auto_246893 ?auto_246896 ) ) ( not ( = ?auto_246893 ?auto_246897 ) ) ( not ( = ?auto_246893 ?auto_246898 ) ) ( not ( = ?auto_246893 ?auto_246899 ) ) ( not ( = ?auto_246893 ?auto_246900 ) ) ( not ( = ?auto_246893 ?auto_246901 ) ) ( not ( = ?auto_246893 ?auto_246902 ) ) ( not ( = ?auto_246893 ?auto_246903 ) ) ( not ( = ?auto_246893 ?auto_246904 ) ) ( not ( = ?auto_246894 ?auto_246895 ) ) ( not ( = ?auto_246894 ?auto_246896 ) ) ( not ( = ?auto_246894 ?auto_246897 ) ) ( not ( = ?auto_246894 ?auto_246898 ) ) ( not ( = ?auto_246894 ?auto_246899 ) ) ( not ( = ?auto_246894 ?auto_246900 ) ) ( not ( = ?auto_246894 ?auto_246901 ) ) ( not ( = ?auto_246894 ?auto_246902 ) ) ( not ( = ?auto_246894 ?auto_246903 ) ) ( not ( = ?auto_246894 ?auto_246904 ) ) ( not ( = ?auto_246895 ?auto_246896 ) ) ( not ( = ?auto_246895 ?auto_246897 ) ) ( not ( = ?auto_246895 ?auto_246898 ) ) ( not ( = ?auto_246895 ?auto_246899 ) ) ( not ( = ?auto_246895 ?auto_246900 ) ) ( not ( = ?auto_246895 ?auto_246901 ) ) ( not ( = ?auto_246895 ?auto_246902 ) ) ( not ( = ?auto_246895 ?auto_246903 ) ) ( not ( = ?auto_246895 ?auto_246904 ) ) ( not ( = ?auto_246896 ?auto_246897 ) ) ( not ( = ?auto_246896 ?auto_246898 ) ) ( not ( = ?auto_246896 ?auto_246899 ) ) ( not ( = ?auto_246896 ?auto_246900 ) ) ( not ( = ?auto_246896 ?auto_246901 ) ) ( not ( = ?auto_246896 ?auto_246902 ) ) ( not ( = ?auto_246896 ?auto_246903 ) ) ( not ( = ?auto_246896 ?auto_246904 ) ) ( not ( = ?auto_246897 ?auto_246898 ) ) ( not ( = ?auto_246897 ?auto_246899 ) ) ( not ( = ?auto_246897 ?auto_246900 ) ) ( not ( = ?auto_246897 ?auto_246901 ) ) ( not ( = ?auto_246897 ?auto_246902 ) ) ( not ( = ?auto_246897 ?auto_246903 ) ) ( not ( = ?auto_246897 ?auto_246904 ) ) ( not ( = ?auto_246898 ?auto_246899 ) ) ( not ( = ?auto_246898 ?auto_246900 ) ) ( not ( = ?auto_246898 ?auto_246901 ) ) ( not ( = ?auto_246898 ?auto_246902 ) ) ( not ( = ?auto_246898 ?auto_246903 ) ) ( not ( = ?auto_246898 ?auto_246904 ) ) ( not ( = ?auto_246899 ?auto_246900 ) ) ( not ( = ?auto_246899 ?auto_246901 ) ) ( not ( = ?auto_246899 ?auto_246902 ) ) ( not ( = ?auto_246899 ?auto_246903 ) ) ( not ( = ?auto_246899 ?auto_246904 ) ) ( not ( = ?auto_246900 ?auto_246901 ) ) ( not ( = ?auto_246900 ?auto_246902 ) ) ( not ( = ?auto_246900 ?auto_246903 ) ) ( not ( = ?auto_246900 ?auto_246904 ) ) ( not ( = ?auto_246901 ?auto_246902 ) ) ( not ( = ?auto_246901 ?auto_246903 ) ) ( not ( = ?auto_246901 ?auto_246904 ) ) ( not ( = ?auto_246902 ?auto_246903 ) ) ( not ( = ?auto_246902 ?auto_246904 ) ) ( not ( = ?auto_246903 ?auto_246904 ) ) ( ON ?auto_246903 ?auto_246904 ) ( ON ?auto_246902 ?auto_246903 ) ( ON ?auto_246901 ?auto_246902 ) ( ON ?auto_246900 ?auto_246901 ) ( ON ?auto_246899 ?auto_246900 ) ( ON ?auto_246898 ?auto_246899 ) ( ON ?auto_246897 ?auto_246898 ) ( CLEAR ?auto_246895 ) ( ON ?auto_246896 ?auto_246897 ) ( CLEAR ?auto_246896 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_246892 ?auto_246893 ?auto_246894 ?auto_246895 ?auto_246896 )
      ( MAKE-13PILE ?auto_246892 ?auto_246893 ?auto_246894 ?auto_246895 ?auto_246896 ?auto_246897 ?auto_246898 ?auto_246899 ?auto_246900 ?auto_246901 ?auto_246902 ?auto_246903 ?auto_246904 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_246918 - BLOCK
      ?auto_246919 - BLOCK
      ?auto_246920 - BLOCK
      ?auto_246921 - BLOCK
      ?auto_246922 - BLOCK
      ?auto_246923 - BLOCK
      ?auto_246924 - BLOCK
      ?auto_246925 - BLOCK
      ?auto_246926 - BLOCK
      ?auto_246927 - BLOCK
      ?auto_246928 - BLOCK
      ?auto_246929 - BLOCK
      ?auto_246930 - BLOCK
    )
    :vars
    (
      ?auto_246931 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_246930 ?auto_246931 ) ( ON-TABLE ?auto_246918 ) ( ON ?auto_246919 ?auto_246918 ) ( ON ?auto_246920 ?auto_246919 ) ( not ( = ?auto_246918 ?auto_246919 ) ) ( not ( = ?auto_246918 ?auto_246920 ) ) ( not ( = ?auto_246918 ?auto_246921 ) ) ( not ( = ?auto_246918 ?auto_246922 ) ) ( not ( = ?auto_246918 ?auto_246923 ) ) ( not ( = ?auto_246918 ?auto_246924 ) ) ( not ( = ?auto_246918 ?auto_246925 ) ) ( not ( = ?auto_246918 ?auto_246926 ) ) ( not ( = ?auto_246918 ?auto_246927 ) ) ( not ( = ?auto_246918 ?auto_246928 ) ) ( not ( = ?auto_246918 ?auto_246929 ) ) ( not ( = ?auto_246918 ?auto_246930 ) ) ( not ( = ?auto_246918 ?auto_246931 ) ) ( not ( = ?auto_246919 ?auto_246920 ) ) ( not ( = ?auto_246919 ?auto_246921 ) ) ( not ( = ?auto_246919 ?auto_246922 ) ) ( not ( = ?auto_246919 ?auto_246923 ) ) ( not ( = ?auto_246919 ?auto_246924 ) ) ( not ( = ?auto_246919 ?auto_246925 ) ) ( not ( = ?auto_246919 ?auto_246926 ) ) ( not ( = ?auto_246919 ?auto_246927 ) ) ( not ( = ?auto_246919 ?auto_246928 ) ) ( not ( = ?auto_246919 ?auto_246929 ) ) ( not ( = ?auto_246919 ?auto_246930 ) ) ( not ( = ?auto_246919 ?auto_246931 ) ) ( not ( = ?auto_246920 ?auto_246921 ) ) ( not ( = ?auto_246920 ?auto_246922 ) ) ( not ( = ?auto_246920 ?auto_246923 ) ) ( not ( = ?auto_246920 ?auto_246924 ) ) ( not ( = ?auto_246920 ?auto_246925 ) ) ( not ( = ?auto_246920 ?auto_246926 ) ) ( not ( = ?auto_246920 ?auto_246927 ) ) ( not ( = ?auto_246920 ?auto_246928 ) ) ( not ( = ?auto_246920 ?auto_246929 ) ) ( not ( = ?auto_246920 ?auto_246930 ) ) ( not ( = ?auto_246920 ?auto_246931 ) ) ( not ( = ?auto_246921 ?auto_246922 ) ) ( not ( = ?auto_246921 ?auto_246923 ) ) ( not ( = ?auto_246921 ?auto_246924 ) ) ( not ( = ?auto_246921 ?auto_246925 ) ) ( not ( = ?auto_246921 ?auto_246926 ) ) ( not ( = ?auto_246921 ?auto_246927 ) ) ( not ( = ?auto_246921 ?auto_246928 ) ) ( not ( = ?auto_246921 ?auto_246929 ) ) ( not ( = ?auto_246921 ?auto_246930 ) ) ( not ( = ?auto_246921 ?auto_246931 ) ) ( not ( = ?auto_246922 ?auto_246923 ) ) ( not ( = ?auto_246922 ?auto_246924 ) ) ( not ( = ?auto_246922 ?auto_246925 ) ) ( not ( = ?auto_246922 ?auto_246926 ) ) ( not ( = ?auto_246922 ?auto_246927 ) ) ( not ( = ?auto_246922 ?auto_246928 ) ) ( not ( = ?auto_246922 ?auto_246929 ) ) ( not ( = ?auto_246922 ?auto_246930 ) ) ( not ( = ?auto_246922 ?auto_246931 ) ) ( not ( = ?auto_246923 ?auto_246924 ) ) ( not ( = ?auto_246923 ?auto_246925 ) ) ( not ( = ?auto_246923 ?auto_246926 ) ) ( not ( = ?auto_246923 ?auto_246927 ) ) ( not ( = ?auto_246923 ?auto_246928 ) ) ( not ( = ?auto_246923 ?auto_246929 ) ) ( not ( = ?auto_246923 ?auto_246930 ) ) ( not ( = ?auto_246923 ?auto_246931 ) ) ( not ( = ?auto_246924 ?auto_246925 ) ) ( not ( = ?auto_246924 ?auto_246926 ) ) ( not ( = ?auto_246924 ?auto_246927 ) ) ( not ( = ?auto_246924 ?auto_246928 ) ) ( not ( = ?auto_246924 ?auto_246929 ) ) ( not ( = ?auto_246924 ?auto_246930 ) ) ( not ( = ?auto_246924 ?auto_246931 ) ) ( not ( = ?auto_246925 ?auto_246926 ) ) ( not ( = ?auto_246925 ?auto_246927 ) ) ( not ( = ?auto_246925 ?auto_246928 ) ) ( not ( = ?auto_246925 ?auto_246929 ) ) ( not ( = ?auto_246925 ?auto_246930 ) ) ( not ( = ?auto_246925 ?auto_246931 ) ) ( not ( = ?auto_246926 ?auto_246927 ) ) ( not ( = ?auto_246926 ?auto_246928 ) ) ( not ( = ?auto_246926 ?auto_246929 ) ) ( not ( = ?auto_246926 ?auto_246930 ) ) ( not ( = ?auto_246926 ?auto_246931 ) ) ( not ( = ?auto_246927 ?auto_246928 ) ) ( not ( = ?auto_246927 ?auto_246929 ) ) ( not ( = ?auto_246927 ?auto_246930 ) ) ( not ( = ?auto_246927 ?auto_246931 ) ) ( not ( = ?auto_246928 ?auto_246929 ) ) ( not ( = ?auto_246928 ?auto_246930 ) ) ( not ( = ?auto_246928 ?auto_246931 ) ) ( not ( = ?auto_246929 ?auto_246930 ) ) ( not ( = ?auto_246929 ?auto_246931 ) ) ( not ( = ?auto_246930 ?auto_246931 ) ) ( ON ?auto_246929 ?auto_246930 ) ( ON ?auto_246928 ?auto_246929 ) ( ON ?auto_246927 ?auto_246928 ) ( ON ?auto_246926 ?auto_246927 ) ( ON ?auto_246925 ?auto_246926 ) ( ON ?auto_246924 ?auto_246925 ) ( ON ?auto_246923 ?auto_246924 ) ( ON ?auto_246922 ?auto_246923 ) ( CLEAR ?auto_246920 ) ( ON ?auto_246921 ?auto_246922 ) ( CLEAR ?auto_246921 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_246918 ?auto_246919 ?auto_246920 ?auto_246921 )
      ( MAKE-13PILE ?auto_246918 ?auto_246919 ?auto_246920 ?auto_246921 ?auto_246922 ?auto_246923 ?auto_246924 ?auto_246925 ?auto_246926 ?auto_246927 ?auto_246928 ?auto_246929 ?auto_246930 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_246945 - BLOCK
      ?auto_246946 - BLOCK
      ?auto_246947 - BLOCK
      ?auto_246948 - BLOCK
      ?auto_246949 - BLOCK
      ?auto_246950 - BLOCK
      ?auto_246951 - BLOCK
      ?auto_246952 - BLOCK
      ?auto_246953 - BLOCK
      ?auto_246954 - BLOCK
      ?auto_246955 - BLOCK
      ?auto_246956 - BLOCK
      ?auto_246957 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_246957 ) ( ON-TABLE ?auto_246945 ) ( ON ?auto_246946 ?auto_246945 ) ( ON ?auto_246947 ?auto_246946 ) ( not ( = ?auto_246945 ?auto_246946 ) ) ( not ( = ?auto_246945 ?auto_246947 ) ) ( not ( = ?auto_246945 ?auto_246948 ) ) ( not ( = ?auto_246945 ?auto_246949 ) ) ( not ( = ?auto_246945 ?auto_246950 ) ) ( not ( = ?auto_246945 ?auto_246951 ) ) ( not ( = ?auto_246945 ?auto_246952 ) ) ( not ( = ?auto_246945 ?auto_246953 ) ) ( not ( = ?auto_246945 ?auto_246954 ) ) ( not ( = ?auto_246945 ?auto_246955 ) ) ( not ( = ?auto_246945 ?auto_246956 ) ) ( not ( = ?auto_246945 ?auto_246957 ) ) ( not ( = ?auto_246946 ?auto_246947 ) ) ( not ( = ?auto_246946 ?auto_246948 ) ) ( not ( = ?auto_246946 ?auto_246949 ) ) ( not ( = ?auto_246946 ?auto_246950 ) ) ( not ( = ?auto_246946 ?auto_246951 ) ) ( not ( = ?auto_246946 ?auto_246952 ) ) ( not ( = ?auto_246946 ?auto_246953 ) ) ( not ( = ?auto_246946 ?auto_246954 ) ) ( not ( = ?auto_246946 ?auto_246955 ) ) ( not ( = ?auto_246946 ?auto_246956 ) ) ( not ( = ?auto_246946 ?auto_246957 ) ) ( not ( = ?auto_246947 ?auto_246948 ) ) ( not ( = ?auto_246947 ?auto_246949 ) ) ( not ( = ?auto_246947 ?auto_246950 ) ) ( not ( = ?auto_246947 ?auto_246951 ) ) ( not ( = ?auto_246947 ?auto_246952 ) ) ( not ( = ?auto_246947 ?auto_246953 ) ) ( not ( = ?auto_246947 ?auto_246954 ) ) ( not ( = ?auto_246947 ?auto_246955 ) ) ( not ( = ?auto_246947 ?auto_246956 ) ) ( not ( = ?auto_246947 ?auto_246957 ) ) ( not ( = ?auto_246948 ?auto_246949 ) ) ( not ( = ?auto_246948 ?auto_246950 ) ) ( not ( = ?auto_246948 ?auto_246951 ) ) ( not ( = ?auto_246948 ?auto_246952 ) ) ( not ( = ?auto_246948 ?auto_246953 ) ) ( not ( = ?auto_246948 ?auto_246954 ) ) ( not ( = ?auto_246948 ?auto_246955 ) ) ( not ( = ?auto_246948 ?auto_246956 ) ) ( not ( = ?auto_246948 ?auto_246957 ) ) ( not ( = ?auto_246949 ?auto_246950 ) ) ( not ( = ?auto_246949 ?auto_246951 ) ) ( not ( = ?auto_246949 ?auto_246952 ) ) ( not ( = ?auto_246949 ?auto_246953 ) ) ( not ( = ?auto_246949 ?auto_246954 ) ) ( not ( = ?auto_246949 ?auto_246955 ) ) ( not ( = ?auto_246949 ?auto_246956 ) ) ( not ( = ?auto_246949 ?auto_246957 ) ) ( not ( = ?auto_246950 ?auto_246951 ) ) ( not ( = ?auto_246950 ?auto_246952 ) ) ( not ( = ?auto_246950 ?auto_246953 ) ) ( not ( = ?auto_246950 ?auto_246954 ) ) ( not ( = ?auto_246950 ?auto_246955 ) ) ( not ( = ?auto_246950 ?auto_246956 ) ) ( not ( = ?auto_246950 ?auto_246957 ) ) ( not ( = ?auto_246951 ?auto_246952 ) ) ( not ( = ?auto_246951 ?auto_246953 ) ) ( not ( = ?auto_246951 ?auto_246954 ) ) ( not ( = ?auto_246951 ?auto_246955 ) ) ( not ( = ?auto_246951 ?auto_246956 ) ) ( not ( = ?auto_246951 ?auto_246957 ) ) ( not ( = ?auto_246952 ?auto_246953 ) ) ( not ( = ?auto_246952 ?auto_246954 ) ) ( not ( = ?auto_246952 ?auto_246955 ) ) ( not ( = ?auto_246952 ?auto_246956 ) ) ( not ( = ?auto_246952 ?auto_246957 ) ) ( not ( = ?auto_246953 ?auto_246954 ) ) ( not ( = ?auto_246953 ?auto_246955 ) ) ( not ( = ?auto_246953 ?auto_246956 ) ) ( not ( = ?auto_246953 ?auto_246957 ) ) ( not ( = ?auto_246954 ?auto_246955 ) ) ( not ( = ?auto_246954 ?auto_246956 ) ) ( not ( = ?auto_246954 ?auto_246957 ) ) ( not ( = ?auto_246955 ?auto_246956 ) ) ( not ( = ?auto_246955 ?auto_246957 ) ) ( not ( = ?auto_246956 ?auto_246957 ) ) ( ON ?auto_246956 ?auto_246957 ) ( ON ?auto_246955 ?auto_246956 ) ( ON ?auto_246954 ?auto_246955 ) ( ON ?auto_246953 ?auto_246954 ) ( ON ?auto_246952 ?auto_246953 ) ( ON ?auto_246951 ?auto_246952 ) ( ON ?auto_246950 ?auto_246951 ) ( ON ?auto_246949 ?auto_246950 ) ( CLEAR ?auto_246947 ) ( ON ?auto_246948 ?auto_246949 ) ( CLEAR ?auto_246948 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_246945 ?auto_246946 ?auto_246947 ?auto_246948 )
      ( MAKE-13PILE ?auto_246945 ?auto_246946 ?auto_246947 ?auto_246948 ?auto_246949 ?auto_246950 ?auto_246951 ?auto_246952 ?auto_246953 ?auto_246954 ?auto_246955 ?auto_246956 ?auto_246957 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_246971 - BLOCK
      ?auto_246972 - BLOCK
      ?auto_246973 - BLOCK
      ?auto_246974 - BLOCK
      ?auto_246975 - BLOCK
      ?auto_246976 - BLOCK
      ?auto_246977 - BLOCK
      ?auto_246978 - BLOCK
      ?auto_246979 - BLOCK
      ?auto_246980 - BLOCK
      ?auto_246981 - BLOCK
      ?auto_246982 - BLOCK
      ?auto_246983 - BLOCK
    )
    :vars
    (
      ?auto_246984 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_246983 ?auto_246984 ) ( ON-TABLE ?auto_246971 ) ( ON ?auto_246972 ?auto_246971 ) ( not ( = ?auto_246971 ?auto_246972 ) ) ( not ( = ?auto_246971 ?auto_246973 ) ) ( not ( = ?auto_246971 ?auto_246974 ) ) ( not ( = ?auto_246971 ?auto_246975 ) ) ( not ( = ?auto_246971 ?auto_246976 ) ) ( not ( = ?auto_246971 ?auto_246977 ) ) ( not ( = ?auto_246971 ?auto_246978 ) ) ( not ( = ?auto_246971 ?auto_246979 ) ) ( not ( = ?auto_246971 ?auto_246980 ) ) ( not ( = ?auto_246971 ?auto_246981 ) ) ( not ( = ?auto_246971 ?auto_246982 ) ) ( not ( = ?auto_246971 ?auto_246983 ) ) ( not ( = ?auto_246971 ?auto_246984 ) ) ( not ( = ?auto_246972 ?auto_246973 ) ) ( not ( = ?auto_246972 ?auto_246974 ) ) ( not ( = ?auto_246972 ?auto_246975 ) ) ( not ( = ?auto_246972 ?auto_246976 ) ) ( not ( = ?auto_246972 ?auto_246977 ) ) ( not ( = ?auto_246972 ?auto_246978 ) ) ( not ( = ?auto_246972 ?auto_246979 ) ) ( not ( = ?auto_246972 ?auto_246980 ) ) ( not ( = ?auto_246972 ?auto_246981 ) ) ( not ( = ?auto_246972 ?auto_246982 ) ) ( not ( = ?auto_246972 ?auto_246983 ) ) ( not ( = ?auto_246972 ?auto_246984 ) ) ( not ( = ?auto_246973 ?auto_246974 ) ) ( not ( = ?auto_246973 ?auto_246975 ) ) ( not ( = ?auto_246973 ?auto_246976 ) ) ( not ( = ?auto_246973 ?auto_246977 ) ) ( not ( = ?auto_246973 ?auto_246978 ) ) ( not ( = ?auto_246973 ?auto_246979 ) ) ( not ( = ?auto_246973 ?auto_246980 ) ) ( not ( = ?auto_246973 ?auto_246981 ) ) ( not ( = ?auto_246973 ?auto_246982 ) ) ( not ( = ?auto_246973 ?auto_246983 ) ) ( not ( = ?auto_246973 ?auto_246984 ) ) ( not ( = ?auto_246974 ?auto_246975 ) ) ( not ( = ?auto_246974 ?auto_246976 ) ) ( not ( = ?auto_246974 ?auto_246977 ) ) ( not ( = ?auto_246974 ?auto_246978 ) ) ( not ( = ?auto_246974 ?auto_246979 ) ) ( not ( = ?auto_246974 ?auto_246980 ) ) ( not ( = ?auto_246974 ?auto_246981 ) ) ( not ( = ?auto_246974 ?auto_246982 ) ) ( not ( = ?auto_246974 ?auto_246983 ) ) ( not ( = ?auto_246974 ?auto_246984 ) ) ( not ( = ?auto_246975 ?auto_246976 ) ) ( not ( = ?auto_246975 ?auto_246977 ) ) ( not ( = ?auto_246975 ?auto_246978 ) ) ( not ( = ?auto_246975 ?auto_246979 ) ) ( not ( = ?auto_246975 ?auto_246980 ) ) ( not ( = ?auto_246975 ?auto_246981 ) ) ( not ( = ?auto_246975 ?auto_246982 ) ) ( not ( = ?auto_246975 ?auto_246983 ) ) ( not ( = ?auto_246975 ?auto_246984 ) ) ( not ( = ?auto_246976 ?auto_246977 ) ) ( not ( = ?auto_246976 ?auto_246978 ) ) ( not ( = ?auto_246976 ?auto_246979 ) ) ( not ( = ?auto_246976 ?auto_246980 ) ) ( not ( = ?auto_246976 ?auto_246981 ) ) ( not ( = ?auto_246976 ?auto_246982 ) ) ( not ( = ?auto_246976 ?auto_246983 ) ) ( not ( = ?auto_246976 ?auto_246984 ) ) ( not ( = ?auto_246977 ?auto_246978 ) ) ( not ( = ?auto_246977 ?auto_246979 ) ) ( not ( = ?auto_246977 ?auto_246980 ) ) ( not ( = ?auto_246977 ?auto_246981 ) ) ( not ( = ?auto_246977 ?auto_246982 ) ) ( not ( = ?auto_246977 ?auto_246983 ) ) ( not ( = ?auto_246977 ?auto_246984 ) ) ( not ( = ?auto_246978 ?auto_246979 ) ) ( not ( = ?auto_246978 ?auto_246980 ) ) ( not ( = ?auto_246978 ?auto_246981 ) ) ( not ( = ?auto_246978 ?auto_246982 ) ) ( not ( = ?auto_246978 ?auto_246983 ) ) ( not ( = ?auto_246978 ?auto_246984 ) ) ( not ( = ?auto_246979 ?auto_246980 ) ) ( not ( = ?auto_246979 ?auto_246981 ) ) ( not ( = ?auto_246979 ?auto_246982 ) ) ( not ( = ?auto_246979 ?auto_246983 ) ) ( not ( = ?auto_246979 ?auto_246984 ) ) ( not ( = ?auto_246980 ?auto_246981 ) ) ( not ( = ?auto_246980 ?auto_246982 ) ) ( not ( = ?auto_246980 ?auto_246983 ) ) ( not ( = ?auto_246980 ?auto_246984 ) ) ( not ( = ?auto_246981 ?auto_246982 ) ) ( not ( = ?auto_246981 ?auto_246983 ) ) ( not ( = ?auto_246981 ?auto_246984 ) ) ( not ( = ?auto_246982 ?auto_246983 ) ) ( not ( = ?auto_246982 ?auto_246984 ) ) ( not ( = ?auto_246983 ?auto_246984 ) ) ( ON ?auto_246982 ?auto_246983 ) ( ON ?auto_246981 ?auto_246982 ) ( ON ?auto_246980 ?auto_246981 ) ( ON ?auto_246979 ?auto_246980 ) ( ON ?auto_246978 ?auto_246979 ) ( ON ?auto_246977 ?auto_246978 ) ( ON ?auto_246976 ?auto_246977 ) ( ON ?auto_246975 ?auto_246976 ) ( ON ?auto_246974 ?auto_246975 ) ( CLEAR ?auto_246972 ) ( ON ?auto_246973 ?auto_246974 ) ( CLEAR ?auto_246973 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_246971 ?auto_246972 ?auto_246973 )
      ( MAKE-13PILE ?auto_246971 ?auto_246972 ?auto_246973 ?auto_246974 ?auto_246975 ?auto_246976 ?auto_246977 ?auto_246978 ?auto_246979 ?auto_246980 ?auto_246981 ?auto_246982 ?auto_246983 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_246998 - BLOCK
      ?auto_246999 - BLOCK
      ?auto_247000 - BLOCK
      ?auto_247001 - BLOCK
      ?auto_247002 - BLOCK
      ?auto_247003 - BLOCK
      ?auto_247004 - BLOCK
      ?auto_247005 - BLOCK
      ?auto_247006 - BLOCK
      ?auto_247007 - BLOCK
      ?auto_247008 - BLOCK
      ?auto_247009 - BLOCK
      ?auto_247010 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_247010 ) ( ON-TABLE ?auto_246998 ) ( ON ?auto_246999 ?auto_246998 ) ( not ( = ?auto_246998 ?auto_246999 ) ) ( not ( = ?auto_246998 ?auto_247000 ) ) ( not ( = ?auto_246998 ?auto_247001 ) ) ( not ( = ?auto_246998 ?auto_247002 ) ) ( not ( = ?auto_246998 ?auto_247003 ) ) ( not ( = ?auto_246998 ?auto_247004 ) ) ( not ( = ?auto_246998 ?auto_247005 ) ) ( not ( = ?auto_246998 ?auto_247006 ) ) ( not ( = ?auto_246998 ?auto_247007 ) ) ( not ( = ?auto_246998 ?auto_247008 ) ) ( not ( = ?auto_246998 ?auto_247009 ) ) ( not ( = ?auto_246998 ?auto_247010 ) ) ( not ( = ?auto_246999 ?auto_247000 ) ) ( not ( = ?auto_246999 ?auto_247001 ) ) ( not ( = ?auto_246999 ?auto_247002 ) ) ( not ( = ?auto_246999 ?auto_247003 ) ) ( not ( = ?auto_246999 ?auto_247004 ) ) ( not ( = ?auto_246999 ?auto_247005 ) ) ( not ( = ?auto_246999 ?auto_247006 ) ) ( not ( = ?auto_246999 ?auto_247007 ) ) ( not ( = ?auto_246999 ?auto_247008 ) ) ( not ( = ?auto_246999 ?auto_247009 ) ) ( not ( = ?auto_246999 ?auto_247010 ) ) ( not ( = ?auto_247000 ?auto_247001 ) ) ( not ( = ?auto_247000 ?auto_247002 ) ) ( not ( = ?auto_247000 ?auto_247003 ) ) ( not ( = ?auto_247000 ?auto_247004 ) ) ( not ( = ?auto_247000 ?auto_247005 ) ) ( not ( = ?auto_247000 ?auto_247006 ) ) ( not ( = ?auto_247000 ?auto_247007 ) ) ( not ( = ?auto_247000 ?auto_247008 ) ) ( not ( = ?auto_247000 ?auto_247009 ) ) ( not ( = ?auto_247000 ?auto_247010 ) ) ( not ( = ?auto_247001 ?auto_247002 ) ) ( not ( = ?auto_247001 ?auto_247003 ) ) ( not ( = ?auto_247001 ?auto_247004 ) ) ( not ( = ?auto_247001 ?auto_247005 ) ) ( not ( = ?auto_247001 ?auto_247006 ) ) ( not ( = ?auto_247001 ?auto_247007 ) ) ( not ( = ?auto_247001 ?auto_247008 ) ) ( not ( = ?auto_247001 ?auto_247009 ) ) ( not ( = ?auto_247001 ?auto_247010 ) ) ( not ( = ?auto_247002 ?auto_247003 ) ) ( not ( = ?auto_247002 ?auto_247004 ) ) ( not ( = ?auto_247002 ?auto_247005 ) ) ( not ( = ?auto_247002 ?auto_247006 ) ) ( not ( = ?auto_247002 ?auto_247007 ) ) ( not ( = ?auto_247002 ?auto_247008 ) ) ( not ( = ?auto_247002 ?auto_247009 ) ) ( not ( = ?auto_247002 ?auto_247010 ) ) ( not ( = ?auto_247003 ?auto_247004 ) ) ( not ( = ?auto_247003 ?auto_247005 ) ) ( not ( = ?auto_247003 ?auto_247006 ) ) ( not ( = ?auto_247003 ?auto_247007 ) ) ( not ( = ?auto_247003 ?auto_247008 ) ) ( not ( = ?auto_247003 ?auto_247009 ) ) ( not ( = ?auto_247003 ?auto_247010 ) ) ( not ( = ?auto_247004 ?auto_247005 ) ) ( not ( = ?auto_247004 ?auto_247006 ) ) ( not ( = ?auto_247004 ?auto_247007 ) ) ( not ( = ?auto_247004 ?auto_247008 ) ) ( not ( = ?auto_247004 ?auto_247009 ) ) ( not ( = ?auto_247004 ?auto_247010 ) ) ( not ( = ?auto_247005 ?auto_247006 ) ) ( not ( = ?auto_247005 ?auto_247007 ) ) ( not ( = ?auto_247005 ?auto_247008 ) ) ( not ( = ?auto_247005 ?auto_247009 ) ) ( not ( = ?auto_247005 ?auto_247010 ) ) ( not ( = ?auto_247006 ?auto_247007 ) ) ( not ( = ?auto_247006 ?auto_247008 ) ) ( not ( = ?auto_247006 ?auto_247009 ) ) ( not ( = ?auto_247006 ?auto_247010 ) ) ( not ( = ?auto_247007 ?auto_247008 ) ) ( not ( = ?auto_247007 ?auto_247009 ) ) ( not ( = ?auto_247007 ?auto_247010 ) ) ( not ( = ?auto_247008 ?auto_247009 ) ) ( not ( = ?auto_247008 ?auto_247010 ) ) ( not ( = ?auto_247009 ?auto_247010 ) ) ( ON ?auto_247009 ?auto_247010 ) ( ON ?auto_247008 ?auto_247009 ) ( ON ?auto_247007 ?auto_247008 ) ( ON ?auto_247006 ?auto_247007 ) ( ON ?auto_247005 ?auto_247006 ) ( ON ?auto_247004 ?auto_247005 ) ( ON ?auto_247003 ?auto_247004 ) ( ON ?auto_247002 ?auto_247003 ) ( ON ?auto_247001 ?auto_247002 ) ( CLEAR ?auto_246999 ) ( ON ?auto_247000 ?auto_247001 ) ( CLEAR ?auto_247000 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_246998 ?auto_246999 ?auto_247000 )
      ( MAKE-13PILE ?auto_246998 ?auto_246999 ?auto_247000 ?auto_247001 ?auto_247002 ?auto_247003 ?auto_247004 ?auto_247005 ?auto_247006 ?auto_247007 ?auto_247008 ?auto_247009 ?auto_247010 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_247024 - BLOCK
      ?auto_247025 - BLOCK
      ?auto_247026 - BLOCK
      ?auto_247027 - BLOCK
      ?auto_247028 - BLOCK
      ?auto_247029 - BLOCK
      ?auto_247030 - BLOCK
      ?auto_247031 - BLOCK
      ?auto_247032 - BLOCK
      ?auto_247033 - BLOCK
      ?auto_247034 - BLOCK
      ?auto_247035 - BLOCK
      ?auto_247036 - BLOCK
    )
    :vars
    (
      ?auto_247037 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247036 ?auto_247037 ) ( ON-TABLE ?auto_247024 ) ( not ( = ?auto_247024 ?auto_247025 ) ) ( not ( = ?auto_247024 ?auto_247026 ) ) ( not ( = ?auto_247024 ?auto_247027 ) ) ( not ( = ?auto_247024 ?auto_247028 ) ) ( not ( = ?auto_247024 ?auto_247029 ) ) ( not ( = ?auto_247024 ?auto_247030 ) ) ( not ( = ?auto_247024 ?auto_247031 ) ) ( not ( = ?auto_247024 ?auto_247032 ) ) ( not ( = ?auto_247024 ?auto_247033 ) ) ( not ( = ?auto_247024 ?auto_247034 ) ) ( not ( = ?auto_247024 ?auto_247035 ) ) ( not ( = ?auto_247024 ?auto_247036 ) ) ( not ( = ?auto_247024 ?auto_247037 ) ) ( not ( = ?auto_247025 ?auto_247026 ) ) ( not ( = ?auto_247025 ?auto_247027 ) ) ( not ( = ?auto_247025 ?auto_247028 ) ) ( not ( = ?auto_247025 ?auto_247029 ) ) ( not ( = ?auto_247025 ?auto_247030 ) ) ( not ( = ?auto_247025 ?auto_247031 ) ) ( not ( = ?auto_247025 ?auto_247032 ) ) ( not ( = ?auto_247025 ?auto_247033 ) ) ( not ( = ?auto_247025 ?auto_247034 ) ) ( not ( = ?auto_247025 ?auto_247035 ) ) ( not ( = ?auto_247025 ?auto_247036 ) ) ( not ( = ?auto_247025 ?auto_247037 ) ) ( not ( = ?auto_247026 ?auto_247027 ) ) ( not ( = ?auto_247026 ?auto_247028 ) ) ( not ( = ?auto_247026 ?auto_247029 ) ) ( not ( = ?auto_247026 ?auto_247030 ) ) ( not ( = ?auto_247026 ?auto_247031 ) ) ( not ( = ?auto_247026 ?auto_247032 ) ) ( not ( = ?auto_247026 ?auto_247033 ) ) ( not ( = ?auto_247026 ?auto_247034 ) ) ( not ( = ?auto_247026 ?auto_247035 ) ) ( not ( = ?auto_247026 ?auto_247036 ) ) ( not ( = ?auto_247026 ?auto_247037 ) ) ( not ( = ?auto_247027 ?auto_247028 ) ) ( not ( = ?auto_247027 ?auto_247029 ) ) ( not ( = ?auto_247027 ?auto_247030 ) ) ( not ( = ?auto_247027 ?auto_247031 ) ) ( not ( = ?auto_247027 ?auto_247032 ) ) ( not ( = ?auto_247027 ?auto_247033 ) ) ( not ( = ?auto_247027 ?auto_247034 ) ) ( not ( = ?auto_247027 ?auto_247035 ) ) ( not ( = ?auto_247027 ?auto_247036 ) ) ( not ( = ?auto_247027 ?auto_247037 ) ) ( not ( = ?auto_247028 ?auto_247029 ) ) ( not ( = ?auto_247028 ?auto_247030 ) ) ( not ( = ?auto_247028 ?auto_247031 ) ) ( not ( = ?auto_247028 ?auto_247032 ) ) ( not ( = ?auto_247028 ?auto_247033 ) ) ( not ( = ?auto_247028 ?auto_247034 ) ) ( not ( = ?auto_247028 ?auto_247035 ) ) ( not ( = ?auto_247028 ?auto_247036 ) ) ( not ( = ?auto_247028 ?auto_247037 ) ) ( not ( = ?auto_247029 ?auto_247030 ) ) ( not ( = ?auto_247029 ?auto_247031 ) ) ( not ( = ?auto_247029 ?auto_247032 ) ) ( not ( = ?auto_247029 ?auto_247033 ) ) ( not ( = ?auto_247029 ?auto_247034 ) ) ( not ( = ?auto_247029 ?auto_247035 ) ) ( not ( = ?auto_247029 ?auto_247036 ) ) ( not ( = ?auto_247029 ?auto_247037 ) ) ( not ( = ?auto_247030 ?auto_247031 ) ) ( not ( = ?auto_247030 ?auto_247032 ) ) ( not ( = ?auto_247030 ?auto_247033 ) ) ( not ( = ?auto_247030 ?auto_247034 ) ) ( not ( = ?auto_247030 ?auto_247035 ) ) ( not ( = ?auto_247030 ?auto_247036 ) ) ( not ( = ?auto_247030 ?auto_247037 ) ) ( not ( = ?auto_247031 ?auto_247032 ) ) ( not ( = ?auto_247031 ?auto_247033 ) ) ( not ( = ?auto_247031 ?auto_247034 ) ) ( not ( = ?auto_247031 ?auto_247035 ) ) ( not ( = ?auto_247031 ?auto_247036 ) ) ( not ( = ?auto_247031 ?auto_247037 ) ) ( not ( = ?auto_247032 ?auto_247033 ) ) ( not ( = ?auto_247032 ?auto_247034 ) ) ( not ( = ?auto_247032 ?auto_247035 ) ) ( not ( = ?auto_247032 ?auto_247036 ) ) ( not ( = ?auto_247032 ?auto_247037 ) ) ( not ( = ?auto_247033 ?auto_247034 ) ) ( not ( = ?auto_247033 ?auto_247035 ) ) ( not ( = ?auto_247033 ?auto_247036 ) ) ( not ( = ?auto_247033 ?auto_247037 ) ) ( not ( = ?auto_247034 ?auto_247035 ) ) ( not ( = ?auto_247034 ?auto_247036 ) ) ( not ( = ?auto_247034 ?auto_247037 ) ) ( not ( = ?auto_247035 ?auto_247036 ) ) ( not ( = ?auto_247035 ?auto_247037 ) ) ( not ( = ?auto_247036 ?auto_247037 ) ) ( ON ?auto_247035 ?auto_247036 ) ( ON ?auto_247034 ?auto_247035 ) ( ON ?auto_247033 ?auto_247034 ) ( ON ?auto_247032 ?auto_247033 ) ( ON ?auto_247031 ?auto_247032 ) ( ON ?auto_247030 ?auto_247031 ) ( ON ?auto_247029 ?auto_247030 ) ( ON ?auto_247028 ?auto_247029 ) ( ON ?auto_247027 ?auto_247028 ) ( ON ?auto_247026 ?auto_247027 ) ( CLEAR ?auto_247024 ) ( ON ?auto_247025 ?auto_247026 ) ( CLEAR ?auto_247025 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_247024 ?auto_247025 )
      ( MAKE-13PILE ?auto_247024 ?auto_247025 ?auto_247026 ?auto_247027 ?auto_247028 ?auto_247029 ?auto_247030 ?auto_247031 ?auto_247032 ?auto_247033 ?auto_247034 ?auto_247035 ?auto_247036 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_247051 - BLOCK
      ?auto_247052 - BLOCK
      ?auto_247053 - BLOCK
      ?auto_247054 - BLOCK
      ?auto_247055 - BLOCK
      ?auto_247056 - BLOCK
      ?auto_247057 - BLOCK
      ?auto_247058 - BLOCK
      ?auto_247059 - BLOCK
      ?auto_247060 - BLOCK
      ?auto_247061 - BLOCK
      ?auto_247062 - BLOCK
      ?auto_247063 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_247063 ) ( ON-TABLE ?auto_247051 ) ( not ( = ?auto_247051 ?auto_247052 ) ) ( not ( = ?auto_247051 ?auto_247053 ) ) ( not ( = ?auto_247051 ?auto_247054 ) ) ( not ( = ?auto_247051 ?auto_247055 ) ) ( not ( = ?auto_247051 ?auto_247056 ) ) ( not ( = ?auto_247051 ?auto_247057 ) ) ( not ( = ?auto_247051 ?auto_247058 ) ) ( not ( = ?auto_247051 ?auto_247059 ) ) ( not ( = ?auto_247051 ?auto_247060 ) ) ( not ( = ?auto_247051 ?auto_247061 ) ) ( not ( = ?auto_247051 ?auto_247062 ) ) ( not ( = ?auto_247051 ?auto_247063 ) ) ( not ( = ?auto_247052 ?auto_247053 ) ) ( not ( = ?auto_247052 ?auto_247054 ) ) ( not ( = ?auto_247052 ?auto_247055 ) ) ( not ( = ?auto_247052 ?auto_247056 ) ) ( not ( = ?auto_247052 ?auto_247057 ) ) ( not ( = ?auto_247052 ?auto_247058 ) ) ( not ( = ?auto_247052 ?auto_247059 ) ) ( not ( = ?auto_247052 ?auto_247060 ) ) ( not ( = ?auto_247052 ?auto_247061 ) ) ( not ( = ?auto_247052 ?auto_247062 ) ) ( not ( = ?auto_247052 ?auto_247063 ) ) ( not ( = ?auto_247053 ?auto_247054 ) ) ( not ( = ?auto_247053 ?auto_247055 ) ) ( not ( = ?auto_247053 ?auto_247056 ) ) ( not ( = ?auto_247053 ?auto_247057 ) ) ( not ( = ?auto_247053 ?auto_247058 ) ) ( not ( = ?auto_247053 ?auto_247059 ) ) ( not ( = ?auto_247053 ?auto_247060 ) ) ( not ( = ?auto_247053 ?auto_247061 ) ) ( not ( = ?auto_247053 ?auto_247062 ) ) ( not ( = ?auto_247053 ?auto_247063 ) ) ( not ( = ?auto_247054 ?auto_247055 ) ) ( not ( = ?auto_247054 ?auto_247056 ) ) ( not ( = ?auto_247054 ?auto_247057 ) ) ( not ( = ?auto_247054 ?auto_247058 ) ) ( not ( = ?auto_247054 ?auto_247059 ) ) ( not ( = ?auto_247054 ?auto_247060 ) ) ( not ( = ?auto_247054 ?auto_247061 ) ) ( not ( = ?auto_247054 ?auto_247062 ) ) ( not ( = ?auto_247054 ?auto_247063 ) ) ( not ( = ?auto_247055 ?auto_247056 ) ) ( not ( = ?auto_247055 ?auto_247057 ) ) ( not ( = ?auto_247055 ?auto_247058 ) ) ( not ( = ?auto_247055 ?auto_247059 ) ) ( not ( = ?auto_247055 ?auto_247060 ) ) ( not ( = ?auto_247055 ?auto_247061 ) ) ( not ( = ?auto_247055 ?auto_247062 ) ) ( not ( = ?auto_247055 ?auto_247063 ) ) ( not ( = ?auto_247056 ?auto_247057 ) ) ( not ( = ?auto_247056 ?auto_247058 ) ) ( not ( = ?auto_247056 ?auto_247059 ) ) ( not ( = ?auto_247056 ?auto_247060 ) ) ( not ( = ?auto_247056 ?auto_247061 ) ) ( not ( = ?auto_247056 ?auto_247062 ) ) ( not ( = ?auto_247056 ?auto_247063 ) ) ( not ( = ?auto_247057 ?auto_247058 ) ) ( not ( = ?auto_247057 ?auto_247059 ) ) ( not ( = ?auto_247057 ?auto_247060 ) ) ( not ( = ?auto_247057 ?auto_247061 ) ) ( not ( = ?auto_247057 ?auto_247062 ) ) ( not ( = ?auto_247057 ?auto_247063 ) ) ( not ( = ?auto_247058 ?auto_247059 ) ) ( not ( = ?auto_247058 ?auto_247060 ) ) ( not ( = ?auto_247058 ?auto_247061 ) ) ( not ( = ?auto_247058 ?auto_247062 ) ) ( not ( = ?auto_247058 ?auto_247063 ) ) ( not ( = ?auto_247059 ?auto_247060 ) ) ( not ( = ?auto_247059 ?auto_247061 ) ) ( not ( = ?auto_247059 ?auto_247062 ) ) ( not ( = ?auto_247059 ?auto_247063 ) ) ( not ( = ?auto_247060 ?auto_247061 ) ) ( not ( = ?auto_247060 ?auto_247062 ) ) ( not ( = ?auto_247060 ?auto_247063 ) ) ( not ( = ?auto_247061 ?auto_247062 ) ) ( not ( = ?auto_247061 ?auto_247063 ) ) ( not ( = ?auto_247062 ?auto_247063 ) ) ( ON ?auto_247062 ?auto_247063 ) ( ON ?auto_247061 ?auto_247062 ) ( ON ?auto_247060 ?auto_247061 ) ( ON ?auto_247059 ?auto_247060 ) ( ON ?auto_247058 ?auto_247059 ) ( ON ?auto_247057 ?auto_247058 ) ( ON ?auto_247056 ?auto_247057 ) ( ON ?auto_247055 ?auto_247056 ) ( ON ?auto_247054 ?auto_247055 ) ( ON ?auto_247053 ?auto_247054 ) ( CLEAR ?auto_247051 ) ( ON ?auto_247052 ?auto_247053 ) ( CLEAR ?auto_247052 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_247051 ?auto_247052 )
      ( MAKE-13PILE ?auto_247051 ?auto_247052 ?auto_247053 ?auto_247054 ?auto_247055 ?auto_247056 ?auto_247057 ?auto_247058 ?auto_247059 ?auto_247060 ?auto_247061 ?auto_247062 ?auto_247063 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_247077 - BLOCK
      ?auto_247078 - BLOCK
      ?auto_247079 - BLOCK
      ?auto_247080 - BLOCK
      ?auto_247081 - BLOCK
      ?auto_247082 - BLOCK
      ?auto_247083 - BLOCK
      ?auto_247084 - BLOCK
      ?auto_247085 - BLOCK
      ?auto_247086 - BLOCK
      ?auto_247087 - BLOCK
      ?auto_247088 - BLOCK
      ?auto_247089 - BLOCK
    )
    :vars
    (
      ?auto_247090 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247089 ?auto_247090 ) ( not ( = ?auto_247077 ?auto_247078 ) ) ( not ( = ?auto_247077 ?auto_247079 ) ) ( not ( = ?auto_247077 ?auto_247080 ) ) ( not ( = ?auto_247077 ?auto_247081 ) ) ( not ( = ?auto_247077 ?auto_247082 ) ) ( not ( = ?auto_247077 ?auto_247083 ) ) ( not ( = ?auto_247077 ?auto_247084 ) ) ( not ( = ?auto_247077 ?auto_247085 ) ) ( not ( = ?auto_247077 ?auto_247086 ) ) ( not ( = ?auto_247077 ?auto_247087 ) ) ( not ( = ?auto_247077 ?auto_247088 ) ) ( not ( = ?auto_247077 ?auto_247089 ) ) ( not ( = ?auto_247077 ?auto_247090 ) ) ( not ( = ?auto_247078 ?auto_247079 ) ) ( not ( = ?auto_247078 ?auto_247080 ) ) ( not ( = ?auto_247078 ?auto_247081 ) ) ( not ( = ?auto_247078 ?auto_247082 ) ) ( not ( = ?auto_247078 ?auto_247083 ) ) ( not ( = ?auto_247078 ?auto_247084 ) ) ( not ( = ?auto_247078 ?auto_247085 ) ) ( not ( = ?auto_247078 ?auto_247086 ) ) ( not ( = ?auto_247078 ?auto_247087 ) ) ( not ( = ?auto_247078 ?auto_247088 ) ) ( not ( = ?auto_247078 ?auto_247089 ) ) ( not ( = ?auto_247078 ?auto_247090 ) ) ( not ( = ?auto_247079 ?auto_247080 ) ) ( not ( = ?auto_247079 ?auto_247081 ) ) ( not ( = ?auto_247079 ?auto_247082 ) ) ( not ( = ?auto_247079 ?auto_247083 ) ) ( not ( = ?auto_247079 ?auto_247084 ) ) ( not ( = ?auto_247079 ?auto_247085 ) ) ( not ( = ?auto_247079 ?auto_247086 ) ) ( not ( = ?auto_247079 ?auto_247087 ) ) ( not ( = ?auto_247079 ?auto_247088 ) ) ( not ( = ?auto_247079 ?auto_247089 ) ) ( not ( = ?auto_247079 ?auto_247090 ) ) ( not ( = ?auto_247080 ?auto_247081 ) ) ( not ( = ?auto_247080 ?auto_247082 ) ) ( not ( = ?auto_247080 ?auto_247083 ) ) ( not ( = ?auto_247080 ?auto_247084 ) ) ( not ( = ?auto_247080 ?auto_247085 ) ) ( not ( = ?auto_247080 ?auto_247086 ) ) ( not ( = ?auto_247080 ?auto_247087 ) ) ( not ( = ?auto_247080 ?auto_247088 ) ) ( not ( = ?auto_247080 ?auto_247089 ) ) ( not ( = ?auto_247080 ?auto_247090 ) ) ( not ( = ?auto_247081 ?auto_247082 ) ) ( not ( = ?auto_247081 ?auto_247083 ) ) ( not ( = ?auto_247081 ?auto_247084 ) ) ( not ( = ?auto_247081 ?auto_247085 ) ) ( not ( = ?auto_247081 ?auto_247086 ) ) ( not ( = ?auto_247081 ?auto_247087 ) ) ( not ( = ?auto_247081 ?auto_247088 ) ) ( not ( = ?auto_247081 ?auto_247089 ) ) ( not ( = ?auto_247081 ?auto_247090 ) ) ( not ( = ?auto_247082 ?auto_247083 ) ) ( not ( = ?auto_247082 ?auto_247084 ) ) ( not ( = ?auto_247082 ?auto_247085 ) ) ( not ( = ?auto_247082 ?auto_247086 ) ) ( not ( = ?auto_247082 ?auto_247087 ) ) ( not ( = ?auto_247082 ?auto_247088 ) ) ( not ( = ?auto_247082 ?auto_247089 ) ) ( not ( = ?auto_247082 ?auto_247090 ) ) ( not ( = ?auto_247083 ?auto_247084 ) ) ( not ( = ?auto_247083 ?auto_247085 ) ) ( not ( = ?auto_247083 ?auto_247086 ) ) ( not ( = ?auto_247083 ?auto_247087 ) ) ( not ( = ?auto_247083 ?auto_247088 ) ) ( not ( = ?auto_247083 ?auto_247089 ) ) ( not ( = ?auto_247083 ?auto_247090 ) ) ( not ( = ?auto_247084 ?auto_247085 ) ) ( not ( = ?auto_247084 ?auto_247086 ) ) ( not ( = ?auto_247084 ?auto_247087 ) ) ( not ( = ?auto_247084 ?auto_247088 ) ) ( not ( = ?auto_247084 ?auto_247089 ) ) ( not ( = ?auto_247084 ?auto_247090 ) ) ( not ( = ?auto_247085 ?auto_247086 ) ) ( not ( = ?auto_247085 ?auto_247087 ) ) ( not ( = ?auto_247085 ?auto_247088 ) ) ( not ( = ?auto_247085 ?auto_247089 ) ) ( not ( = ?auto_247085 ?auto_247090 ) ) ( not ( = ?auto_247086 ?auto_247087 ) ) ( not ( = ?auto_247086 ?auto_247088 ) ) ( not ( = ?auto_247086 ?auto_247089 ) ) ( not ( = ?auto_247086 ?auto_247090 ) ) ( not ( = ?auto_247087 ?auto_247088 ) ) ( not ( = ?auto_247087 ?auto_247089 ) ) ( not ( = ?auto_247087 ?auto_247090 ) ) ( not ( = ?auto_247088 ?auto_247089 ) ) ( not ( = ?auto_247088 ?auto_247090 ) ) ( not ( = ?auto_247089 ?auto_247090 ) ) ( ON ?auto_247088 ?auto_247089 ) ( ON ?auto_247087 ?auto_247088 ) ( ON ?auto_247086 ?auto_247087 ) ( ON ?auto_247085 ?auto_247086 ) ( ON ?auto_247084 ?auto_247085 ) ( ON ?auto_247083 ?auto_247084 ) ( ON ?auto_247082 ?auto_247083 ) ( ON ?auto_247081 ?auto_247082 ) ( ON ?auto_247080 ?auto_247081 ) ( ON ?auto_247079 ?auto_247080 ) ( ON ?auto_247078 ?auto_247079 ) ( ON ?auto_247077 ?auto_247078 ) ( CLEAR ?auto_247077 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_247077 )
      ( MAKE-13PILE ?auto_247077 ?auto_247078 ?auto_247079 ?auto_247080 ?auto_247081 ?auto_247082 ?auto_247083 ?auto_247084 ?auto_247085 ?auto_247086 ?auto_247087 ?auto_247088 ?auto_247089 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_247104 - BLOCK
      ?auto_247105 - BLOCK
      ?auto_247106 - BLOCK
      ?auto_247107 - BLOCK
      ?auto_247108 - BLOCK
      ?auto_247109 - BLOCK
      ?auto_247110 - BLOCK
      ?auto_247111 - BLOCK
      ?auto_247112 - BLOCK
      ?auto_247113 - BLOCK
      ?auto_247114 - BLOCK
      ?auto_247115 - BLOCK
      ?auto_247116 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_247116 ) ( not ( = ?auto_247104 ?auto_247105 ) ) ( not ( = ?auto_247104 ?auto_247106 ) ) ( not ( = ?auto_247104 ?auto_247107 ) ) ( not ( = ?auto_247104 ?auto_247108 ) ) ( not ( = ?auto_247104 ?auto_247109 ) ) ( not ( = ?auto_247104 ?auto_247110 ) ) ( not ( = ?auto_247104 ?auto_247111 ) ) ( not ( = ?auto_247104 ?auto_247112 ) ) ( not ( = ?auto_247104 ?auto_247113 ) ) ( not ( = ?auto_247104 ?auto_247114 ) ) ( not ( = ?auto_247104 ?auto_247115 ) ) ( not ( = ?auto_247104 ?auto_247116 ) ) ( not ( = ?auto_247105 ?auto_247106 ) ) ( not ( = ?auto_247105 ?auto_247107 ) ) ( not ( = ?auto_247105 ?auto_247108 ) ) ( not ( = ?auto_247105 ?auto_247109 ) ) ( not ( = ?auto_247105 ?auto_247110 ) ) ( not ( = ?auto_247105 ?auto_247111 ) ) ( not ( = ?auto_247105 ?auto_247112 ) ) ( not ( = ?auto_247105 ?auto_247113 ) ) ( not ( = ?auto_247105 ?auto_247114 ) ) ( not ( = ?auto_247105 ?auto_247115 ) ) ( not ( = ?auto_247105 ?auto_247116 ) ) ( not ( = ?auto_247106 ?auto_247107 ) ) ( not ( = ?auto_247106 ?auto_247108 ) ) ( not ( = ?auto_247106 ?auto_247109 ) ) ( not ( = ?auto_247106 ?auto_247110 ) ) ( not ( = ?auto_247106 ?auto_247111 ) ) ( not ( = ?auto_247106 ?auto_247112 ) ) ( not ( = ?auto_247106 ?auto_247113 ) ) ( not ( = ?auto_247106 ?auto_247114 ) ) ( not ( = ?auto_247106 ?auto_247115 ) ) ( not ( = ?auto_247106 ?auto_247116 ) ) ( not ( = ?auto_247107 ?auto_247108 ) ) ( not ( = ?auto_247107 ?auto_247109 ) ) ( not ( = ?auto_247107 ?auto_247110 ) ) ( not ( = ?auto_247107 ?auto_247111 ) ) ( not ( = ?auto_247107 ?auto_247112 ) ) ( not ( = ?auto_247107 ?auto_247113 ) ) ( not ( = ?auto_247107 ?auto_247114 ) ) ( not ( = ?auto_247107 ?auto_247115 ) ) ( not ( = ?auto_247107 ?auto_247116 ) ) ( not ( = ?auto_247108 ?auto_247109 ) ) ( not ( = ?auto_247108 ?auto_247110 ) ) ( not ( = ?auto_247108 ?auto_247111 ) ) ( not ( = ?auto_247108 ?auto_247112 ) ) ( not ( = ?auto_247108 ?auto_247113 ) ) ( not ( = ?auto_247108 ?auto_247114 ) ) ( not ( = ?auto_247108 ?auto_247115 ) ) ( not ( = ?auto_247108 ?auto_247116 ) ) ( not ( = ?auto_247109 ?auto_247110 ) ) ( not ( = ?auto_247109 ?auto_247111 ) ) ( not ( = ?auto_247109 ?auto_247112 ) ) ( not ( = ?auto_247109 ?auto_247113 ) ) ( not ( = ?auto_247109 ?auto_247114 ) ) ( not ( = ?auto_247109 ?auto_247115 ) ) ( not ( = ?auto_247109 ?auto_247116 ) ) ( not ( = ?auto_247110 ?auto_247111 ) ) ( not ( = ?auto_247110 ?auto_247112 ) ) ( not ( = ?auto_247110 ?auto_247113 ) ) ( not ( = ?auto_247110 ?auto_247114 ) ) ( not ( = ?auto_247110 ?auto_247115 ) ) ( not ( = ?auto_247110 ?auto_247116 ) ) ( not ( = ?auto_247111 ?auto_247112 ) ) ( not ( = ?auto_247111 ?auto_247113 ) ) ( not ( = ?auto_247111 ?auto_247114 ) ) ( not ( = ?auto_247111 ?auto_247115 ) ) ( not ( = ?auto_247111 ?auto_247116 ) ) ( not ( = ?auto_247112 ?auto_247113 ) ) ( not ( = ?auto_247112 ?auto_247114 ) ) ( not ( = ?auto_247112 ?auto_247115 ) ) ( not ( = ?auto_247112 ?auto_247116 ) ) ( not ( = ?auto_247113 ?auto_247114 ) ) ( not ( = ?auto_247113 ?auto_247115 ) ) ( not ( = ?auto_247113 ?auto_247116 ) ) ( not ( = ?auto_247114 ?auto_247115 ) ) ( not ( = ?auto_247114 ?auto_247116 ) ) ( not ( = ?auto_247115 ?auto_247116 ) ) ( ON ?auto_247115 ?auto_247116 ) ( ON ?auto_247114 ?auto_247115 ) ( ON ?auto_247113 ?auto_247114 ) ( ON ?auto_247112 ?auto_247113 ) ( ON ?auto_247111 ?auto_247112 ) ( ON ?auto_247110 ?auto_247111 ) ( ON ?auto_247109 ?auto_247110 ) ( ON ?auto_247108 ?auto_247109 ) ( ON ?auto_247107 ?auto_247108 ) ( ON ?auto_247106 ?auto_247107 ) ( ON ?auto_247105 ?auto_247106 ) ( ON ?auto_247104 ?auto_247105 ) ( CLEAR ?auto_247104 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_247104 )
      ( MAKE-13PILE ?auto_247104 ?auto_247105 ?auto_247106 ?auto_247107 ?auto_247108 ?auto_247109 ?auto_247110 ?auto_247111 ?auto_247112 ?auto_247113 ?auto_247114 ?auto_247115 ?auto_247116 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_247130 - BLOCK
      ?auto_247131 - BLOCK
      ?auto_247132 - BLOCK
      ?auto_247133 - BLOCK
      ?auto_247134 - BLOCK
      ?auto_247135 - BLOCK
      ?auto_247136 - BLOCK
      ?auto_247137 - BLOCK
      ?auto_247138 - BLOCK
      ?auto_247139 - BLOCK
      ?auto_247140 - BLOCK
      ?auto_247141 - BLOCK
      ?auto_247142 - BLOCK
    )
    :vars
    (
      ?auto_247143 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_247130 ?auto_247131 ) ) ( not ( = ?auto_247130 ?auto_247132 ) ) ( not ( = ?auto_247130 ?auto_247133 ) ) ( not ( = ?auto_247130 ?auto_247134 ) ) ( not ( = ?auto_247130 ?auto_247135 ) ) ( not ( = ?auto_247130 ?auto_247136 ) ) ( not ( = ?auto_247130 ?auto_247137 ) ) ( not ( = ?auto_247130 ?auto_247138 ) ) ( not ( = ?auto_247130 ?auto_247139 ) ) ( not ( = ?auto_247130 ?auto_247140 ) ) ( not ( = ?auto_247130 ?auto_247141 ) ) ( not ( = ?auto_247130 ?auto_247142 ) ) ( not ( = ?auto_247131 ?auto_247132 ) ) ( not ( = ?auto_247131 ?auto_247133 ) ) ( not ( = ?auto_247131 ?auto_247134 ) ) ( not ( = ?auto_247131 ?auto_247135 ) ) ( not ( = ?auto_247131 ?auto_247136 ) ) ( not ( = ?auto_247131 ?auto_247137 ) ) ( not ( = ?auto_247131 ?auto_247138 ) ) ( not ( = ?auto_247131 ?auto_247139 ) ) ( not ( = ?auto_247131 ?auto_247140 ) ) ( not ( = ?auto_247131 ?auto_247141 ) ) ( not ( = ?auto_247131 ?auto_247142 ) ) ( not ( = ?auto_247132 ?auto_247133 ) ) ( not ( = ?auto_247132 ?auto_247134 ) ) ( not ( = ?auto_247132 ?auto_247135 ) ) ( not ( = ?auto_247132 ?auto_247136 ) ) ( not ( = ?auto_247132 ?auto_247137 ) ) ( not ( = ?auto_247132 ?auto_247138 ) ) ( not ( = ?auto_247132 ?auto_247139 ) ) ( not ( = ?auto_247132 ?auto_247140 ) ) ( not ( = ?auto_247132 ?auto_247141 ) ) ( not ( = ?auto_247132 ?auto_247142 ) ) ( not ( = ?auto_247133 ?auto_247134 ) ) ( not ( = ?auto_247133 ?auto_247135 ) ) ( not ( = ?auto_247133 ?auto_247136 ) ) ( not ( = ?auto_247133 ?auto_247137 ) ) ( not ( = ?auto_247133 ?auto_247138 ) ) ( not ( = ?auto_247133 ?auto_247139 ) ) ( not ( = ?auto_247133 ?auto_247140 ) ) ( not ( = ?auto_247133 ?auto_247141 ) ) ( not ( = ?auto_247133 ?auto_247142 ) ) ( not ( = ?auto_247134 ?auto_247135 ) ) ( not ( = ?auto_247134 ?auto_247136 ) ) ( not ( = ?auto_247134 ?auto_247137 ) ) ( not ( = ?auto_247134 ?auto_247138 ) ) ( not ( = ?auto_247134 ?auto_247139 ) ) ( not ( = ?auto_247134 ?auto_247140 ) ) ( not ( = ?auto_247134 ?auto_247141 ) ) ( not ( = ?auto_247134 ?auto_247142 ) ) ( not ( = ?auto_247135 ?auto_247136 ) ) ( not ( = ?auto_247135 ?auto_247137 ) ) ( not ( = ?auto_247135 ?auto_247138 ) ) ( not ( = ?auto_247135 ?auto_247139 ) ) ( not ( = ?auto_247135 ?auto_247140 ) ) ( not ( = ?auto_247135 ?auto_247141 ) ) ( not ( = ?auto_247135 ?auto_247142 ) ) ( not ( = ?auto_247136 ?auto_247137 ) ) ( not ( = ?auto_247136 ?auto_247138 ) ) ( not ( = ?auto_247136 ?auto_247139 ) ) ( not ( = ?auto_247136 ?auto_247140 ) ) ( not ( = ?auto_247136 ?auto_247141 ) ) ( not ( = ?auto_247136 ?auto_247142 ) ) ( not ( = ?auto_247137 ?auto_247138 ) ) ( not ( = ?auto_247137 ?auto_247139 ) ) ( not ( = ?auto_247137 ?auto_247140 ) ) ( not ( = ?auto_247137 ?auto_247141 ) ) ( not ( = ?auto_247137 ?auto_247142 ) ) ( not ( = ?auto_247138 ?auto_247139 ) ) ( not ( = ?auto_247138 ?auto_247140 ) ) ( not ( = ?auto_247138 ?auto_247141 ) ) ( not ( = ?auto_247138 ?auto_247142 ) ) ( not ( = ?auto_247139 ?auto_247140 ) ) ( not ( = ?auto_247139 ?auto_247141 ) ) ( not ( = ?auto_247139 ?auto_247142 ) ) ( not ( = ?auto_247140 ?auto_247141 ) ) ( not ( = ?auto_247140 ?auto_247142 ) ) ( not ( = ?auto_247141 ?auto_247142 ) ) ( ON ?auto_247130 ?auto_247143 ) ( not ( = ?auto_247142 ?auto_247143 ) ) ( not ( = ?auto_247141 ?auto_247143 ) ) ( not ( = ?auto_247140 ?auto_247143 ) ) ( not ( = ?auto_247139 ?auto_247143 ) ) ( not ( = ?auto_247138 ?auto_247143 ) ) ( not ( = ?auto_247137 ?auto_247143 ) ) ( not ( = ?auto_247136 ?auto_247143 ) ) ( not ( = ?auto_247135 ?auto_247143 ) ) ( not ( = ?auto_247134 ?auto_247143 ) ) ( not ( = ?auto_247133 ?auto_247143 ) ) ( not ( = ?auto_247132 ?auto_247143 ) ) ( not ( = ?auto_247131 ?auto_247143 ) ) ( not ( = ?auto_247130 ?auto_247143 ) ) ( ON ?auto_247131 ?auto_247130 ) ( ON ?auto_247132 ?auto_247131 ) ( ON ?auto_247133 ?auto_247132 ) ( ON ?auto_247134 ?auto_247133 ) ( ON ?auto_247135 ?auto_247134 ) ( ON ?auto_247136 ?auto_247135 ) ( ON ?auto_247137 ?auto_247136 ) ( ON ?auto_247138 ?auto_247137 ) ( ON ?auto_247139 ?auto_247138 ) ( ON ?auto_247140 ?auto_247139 ) ( ON ?auto_247141 ?auto_247140 ) ( ON ?auto_247142 ?auto_247141 ) ( CLEAR ?auto_247142 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_247142 ?auto_247141 ?auto_247140 ?auto_247139 ?auto_247138 ?auto_247137 ?auto_247136 ?auto_247135 ?auto_247134 ?auto_247133 ?auto_247132 ?auto_247131 ?auto_247130 )
      ( MAKE-13PILE ?auto_247130 ?auto_247131 ?auto_247132 ?auto_247133 ?auto_247134 ?auto_247135 ?auto_247136 ?auto_247137 ?auto_247138 ?auto_247139 ?auto_247140 ?auto_247141 ?auto_247142 ) )
  )

)

