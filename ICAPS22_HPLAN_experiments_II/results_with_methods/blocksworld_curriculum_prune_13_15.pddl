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
      ?auto_257561 - BLOCK
    )
    :vars
    (
      ?auto_257562 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_257561 ?auto_257562 ) ( CLEAR ?auto_257561 ) ( HAND-EMPTY ) ( not ( = ?auto_257561 ?auto_257562 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_257561 ?auto_257562 )
      ( !PUTDOWN ?auto_257561 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_257568 - BLOCK
      ?auto_257569 - BLOCK
    )
    :vars
    (
      ?auto_257570 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_257568 ) ( ON ?auto_257569 ?auto_257570 ) ( CLEAR ?auto_257569 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_257568 ) ( not ( = ?auto_257568 ?auto_257569 ) ) ( not ( = ?auto_257568 ?auto_257570 ) ) ( not ( = ?auto_257569 ?auto_257570 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_257569 ?auto_257570 )
      ( !STACK ?auto_257569 ?auto_257568 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_257578 - BLOCK
      ?auto_257579 - BLOCK
    )
    :vars
    (
      ?auto_257580 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_257579 ?auto_257580 ) ( not ( = ?auto_257578 ?auto_257579 ) ) ( not ( = ?auto_257578 ?auto_257580 ) ) ( not ( = ?auto_257579 ?auto_257580 ) ) ( ON ?auto_257578 ?auto_257579 ) ( CLEAR ?auto_257578 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_257578 )
      ( MAKE-2PILE ?auto_257578 ?auto_257579 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_257589 - BLOCK
      ?auto_257590 - BLOCK
      ?auto_257591 - BLOCK
    )
    :vars
    (
      ?auto_257592 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_257590 ) ( ON ?auto_257591 ?auto_257592 ) ( CLEAR ?auto_257591 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_257589 ) ( ON ?auto_257590 ?auto_257589 ) ( not ( = ?auto_257589 ?auto_257590 ) ) ( not ( = ?auto_257589 ?auto_257591 ) ) ( not ( = ?auto_257589 ?auto_257592 ) ) ( not ( = ?auto_257590 ?auto_257591 ) ) ( not ( = ?auto_257590 ?auto_257592 ) ) ( not ( = ?auto_257591 ?auto_257592 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_257591 ?auto_257592 )
      ( !STACK ?auto_257591 ?auto_257590 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_257603 - BLOCK
      ?auto_257604 - BLOCK
      ?auto_257605 - BLOCK
    )
    :vars
    (
      ?auto_257606 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_257605 ?auto_257606 ) ( ON-TABLE ?auto_257603 ) ( not ( = ?auto_257603 ?auto_257604 ) ) ( not ( = ?auto_257603 ?auto_257605 ) ) ( not ( = ?auto_257603 ?auto_257606 ) ) ( not ( = ?auto_257604 ?auto_257605 ) ) ( not ( = ?auto_257604 ?auto_257606 ) ) ( not ( = ?auto_257605 ?auto_257606 ) ) ( CLEAR ?auto_257603 ) ( ON ?auto_257604 ?auto_257605 ) ( CLEAR ?auto_257604 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_257603 ?auto_257604 )
      ( MAKE-3PILE ?auto_257603 ?auto_257604 ?auto_257605 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_257617 - BLOCK
      ?auto_257618 - BLOCK
      ?auto_257619 - BLOCK
    )
    :vars
    (
      ?auto_257620 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_257619 ?auto_257620 ) ( not ( = ?auto_257617 ?auto_257618 ) ) ( not ( = ?auto_257617 ?auto_257619 ) ) ( not ( = ?auto_257617 ?auto_257620 ) ) ( not ( = ?auto_257618 ?auto_257619 ) ) ( not ( = ?auto_257618 ?auto_257620 ) ) ( not ( = ?auto_257619 ?auto_257620 ) ) ( ON ?auto_257618 ?auto_257619 ) ( ON ?auto_257617 ?auto_257618 ) ( CLEAR ?auto_257617 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_257617 )
      ( MAKE-3PILE ?auto_257617 ?auto_257618 ?auto_257619 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_257632 - BLOCK
      ?auto_257633 - BLOCK
      ?auto_257634 - BLOCK
      ?auto_257635 - BLOCK
    )
    :vars
    (
      ?auto_257636 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_257634 ) ( ON ?auto_257635 ?auto_257636 ) ( CLEAR ?auto_257635 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_257632 ) ( ON ?auto_257633 ?auto_257632 ) ( ON ?auto_257634 ?auto_257633 ) ( not ( = ?auto_257632 ?auto_257633 ) ) ( not ( = ?auto_257632 ?auto_257634 ) ) ( not ( = ?auto_257632 ?auto_257635 ) ) ( not ( = ?auto_257632 ?auto_257636 ) ) ( not ( = ?auto_257633 ?auto_257634 ) ) ( not ( = ?auto_257633 ?auto_257635 ) ) ( not ( = ?auto_257633 ?auto_257636 ) ) ( not ( = ?auto_257634 ?auto_257635 ) ) ( not ( = ?auto_257634 ?auto_257636 ) ) ( not ( = ?auto_257635 ?auto_257636 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_257635 ?auto_257636 )
      ( !STACK ?auto_257635 ?auto_257634 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_257650 - BLOCK
      ?auto_257651 - BLOCK
      ?auto_257652 - BLOCK
      ?auto_257653 - BLOCK
    )
    :vars
    (
      ?auto_257654 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_257653 ?auto_257654 ) ( ON-TABLE ?auto_257650 ) ( ON ?auto_257651 ?auto_257650 ) ( not ( = ?auto_257650 ?auto_257651 ) ) ( not ( = ?auto_257650 ?auto_257652 ) ) ( not ( = ?auto_257650 ?auto_257653 ) ) ( not ( = ?auto_257650 ?auto_257654 ) ) ( not ( = ?auto_257651 ?auto_257652 ) ) ( not ( = ?auto_257651 ?auto_257653 ) ) ( not ( = ?auto_257651 ?auto_257654 ) ) ( not ( = ?auto_257652 ?auto_257653 ) ) ( not ( = ?auto_257652 ?auto_257654 ) ) ( not ( = ?auto_257653 ?auto_257654 ) ) ( CLEAR ?auto_257651 ) ( ON ?auto_257652 ?auto_257653 ) ( CLEAR ?auto_257652 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_257650 ?auto_257651 ?auto_257652 )
      ( MAKE-4PILE ?auto_257650 ?auto_257651 ?auto_257652 ?auto_257653 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_257668 - BLOCK
      ?auto_257669 - BLOCK
      ?auto_257670 - BLOCK
      ?auto_257671 - BLOCK
    )
    :vars
    (
      ?auto_257672 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_257671 ?auto_257672 ) ( ON-TABLE ?auto_257668 ) ( not ( = ?auto_257668 ?auto_257669 ) ) ( not ( = ?auto_257668 ?auto_257670 ) ) ( not ( = ?auto_257668 ?auto_257671 ) ) ( not ( = ?auto_257668 ?auto_257672 ) ) ( not ( = ?auto_257669 ?auto_257670 ) ) ( not ( = ?auto_257669 ?auto_257671 ) ) ( not ( = ?auto_257669 ?auto_257672 ) ) ( not ( = ?auto_257670 ?auto_257671 ) ) ( not ( = ?auto_257670 ?auto_257672 ) ) ( not ( = ?auto_257671 ?auto_257672 ) ) ( ON ?auto_257670 ?auto_257671 ) ( CLEAR ?auto_257668 ) ( ON ?auto_257669 ?auto_257670 ) ( CLEAR ?auto_257669 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_257668 ?auto_257669 )
      ( MAKE-4PILE ?auto_257668 ?auto_257669 ?auto_257670 ?auto_257671 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_257686 - BLOCK
      ?auto_257687 - BLOCK
      ?auto_257688 - BLOCK
      ?auto_257689 - BLOCK
    )
    :vars
    (
      ?auto_257690 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_257689 ?auto_257690 ) ( not ( = ?auto_257686 ?auto_257687 ) ) ( not ( = ?auto_257686 ?auto_257688 ) ) ( not ( = ?auto_257686 ?auto_257689 ) ) ( not ( = ?auto_257686 ?auto_257690 ) ) ( not ( = ?auto_257687 ?auto_257688 ) ) ( not ( = ?auto_257687 ?auto_257689 ) ) ( not ( = ?auto_257687 ?auto_257690 ) ) ( not ( = ?auto_257688 ?auto_257689 ) ) ( not ( = ?auto_257688 ?auto_257690 ) ) ( not ( = ?auto_257689 ?auto_257690 ) ) ( ON ?auto_257688 ?auto_257689 ) ( ON ?auto_257687 ?auto_257688 ) ( ON ?auto_257686 ?auto_257687 ) ( CLEAR ?auto_257686 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_257686 )
      ( MAKE-4PILE ?auto_257686 ?auto_257687 ?auto_257688 ?auto_257689 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_257705 - BLOCK
      ?auto_257706 - BLOCK
      ?auto_257707 - BLOCK
      ?auto_257708 - BLOCK
      ?auto_257709 - BLOCK
    )
    :vars
    (
      ?auto_257710 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_257708 ) ( ON ?auto_257709 ?auto_257710 ) ( CLEAR ?auto_257709 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_257705 ) ( ON ?auto_257706 ?auto_257705 ) ( ON ?auto_257707 ?auto_257706 ) ( ON ?auto_257708 ?auto_257707 ) ( not ( = ?auto_257705 ?auto_257706 ) ) ( not ( = ?auto_257705 ?auto_257707 ) ) ( not ( = ?auto_257705 ?auto_257708 ) ) ( not ( = ?auto_257705 ?auto_257709 ) ) ( not ( = ?auto_257705 ?auto_257710 ) ) ( not ( = ?auto_257706 ?auto_257707 ) ) ( not ( = ?auto_257706 ?auto_257708 ) ) ( not ( = ?auto_257706 ?auto_257709 ) ) ( not ( = ?auto_257706 ?auto_257710 ) ) ( not ( = ?auto_257707 ?auto_257708 ) ) ( not ( = ?auto_257707 ?auto_257709 ) ) ( not ( = ?auto_257707 ?auto_257710 ) ) ( not ( = ?auto_257708 ?auto_257709 ) ) ( not ( = ?auto_257708 ?auto_257710 ) ) ( not ( = ?auto_257709 ?auto_257710 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_257709 ?auto_257710 )
      ( !STACK ?auto_257709 ?auto_257708 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_257727 - BLOCK
      ?auto_257728 - BLOCK
      ?auto_257729 - BLOCK
      ?auto_257730 - BLOCK
      ?auto_257731 - BLOCK
    )
    :vars
    (
      ?auto_257732 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_257731 ?auto_257732 ) ( ON-TABLE ?auto_257727 ) ( ON ?auto_257728 ?auto_257727 ) ( ON ?auto_257729 ?auto_257728 ) ( not ( = ?auto_257727 ?auto_257728 ) ) ( not ( = ?auto_257727 ?auto_257729 ) ) ( not ( = ?auto_257727 ?auto_257730 ) ) ( not ( = ?auto_257727 ?auto_257731 ) ) ( not ( = ?auto_257727 ?auto_257732 ) ) ( not ( = ?auto_257728 ?auto_257729 ) ) ( not ( = ?auto_257728 ?auto_257730 ) ) ( not ( = ?auto_257728 ?auto_257731 ) ) ( not ( = ?auto_257728 ?auto_257732 ) ) ( not ( = ?auto_257729 ?auto_257730 ) ) ( not ( = ?auto_257729 ?auto_257731 ) ) ( not ( = ?auto_257729 ?auto_257732 ) ) ( not ( = ?auto_257730 ?auto_257731 ) ) ( not ( = ?auto_257730 ?auto_257732 ) ) ( not ( = ?auto_257731 ?auto_257732 ) ) ( CLEAR ?auto_257729 ) ( ON ?auto_257730 ?auto_257731 ) ( CLEAR ?auto_257730 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_257727 ?auto_257728 ?auto_257729 ?auto_257730 )
      ( MAKE-5PILE ?auto_257727 ?auto_257728 ?auto_257729 ?auto_257730 ?auto_257731 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_257749 - BLOCK
      ?auto_257750 - BLOCK
      ?auto_257751 - BLOCK
      ?auto_257752 - BLOCK
      ?auto_257753 - BLOCK
    )
    :vars
    (
      ?auto_257754 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_257753 ?auto_257754 ) ( ON-TABLE ?auto_257749 ) ( ON ?auto_257750 ?auto_257749 ) ( not ( = ?auto_257749 ?auto_257750 ) ) ( not ( = ?auto_257749 ?auto_257751 ) ) ( not ( = ?auto_257749 ?auto_257752 ) ) ( not ( = ?auto_257749 ?auto_257753 ) ) ( not ( = ?auto_257749 ?auto_257754 ) ) ( not ( = ?auto_257750 ?auto_257751 ) ) ( not ( = ?auto_257750 ?auto_257752 ) ) ( not ( = ?auto_257750 ?auto_257753 ) ) ( not ( = ?auto_257750 ?auto_257754 ) ) ( not ( = ?auto_257751 ?auto_257752 ) ) ( not ( = ?auto_257751 ?auto_257753 ) ) ( not ( = ?auto_257751 ?auto_257754 ) ) ( not ( = ?auto_257752 ?auto_257753 ) ) ( not ( = ?auto_257752 ?auto_257754 ) ) ( not ( = ?auto_257753 ?auto_257754 ) ) ( ON ?auto_257752 ?auto_257753 ) ( CLEAR ?auto_257750 ) ( ON ?auto_257751 ?auto_257752 ) ( CLEAR ?auto_257751 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_257749 ?auto_257750 ?auto_257751 )
      ( MAKE-5PILE ?auto_257749 ?auto_257750 ?auto_257751 ?auto_257752 ?auto_257753 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_257771 - BLOCK
      ?auto_257772 - BLOCK
      ?auto_257773 - BLOCK
      ?auto_257774 - BLOCK
      ?auto_257775 - BLOCK
    )
    :vars
    (
      ?auto_257776 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_257775 ?auto_257776 ) ( ON-TABLE ?auto_257771 ) ( not ( = ?auto_257771 ?auto_257772 ) ) ( not ( = ?auto_257771 ?auto_257773 ) ) ( not ( = ?auto_257771 ?auto_257774 ) ) ( not ( = ?auto_257771 ?auto_257775 ) ) ( not ( = ?auto_257771 ?auto_257776 ) ) ( not ( = ?auto_257772 ?auto_257773 ) ) ( not ( = ?auto_257772 ?auto_257774 ) ) ( not ( = ?auto_257772 ?auto_257775 ) ) ( not ( = ?auto_257772 ?auto_257776 ) ) ( not ( = ?auto_257773 ?auto_257774 ) ) ( not ( = ?auto_257773 ?auto_257775 ) ) ( not ( = ?auto_257773 ?auto_257776 ) ) ( not ( = ?auto_257774 ?auto_257775 ) ) ( not ( = ?auto_257774 ?auto_257776 ) ) ( not ( = ?auto_257775 ?auto_257776 ) ) ( ON ?auto_257774 ?auto_257775 ) ( ON ?auto_257773 ?auto_257774 ) ( CLEAR ?auto_257771 ) ( ON ?auto_257772 ?auto_257773 ) ( CLEAR ?auto_257772 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_257771 ?auto_257772 )
      ( MAKE-5PILE ?auto_257771 ?auto_257772 ?auto_257773 ?auto_257774 ?auto_257775 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_257793 - BLOCK
      ?auto_257794 - BLOCK
      ?auto_257795 - BLOCK
      ?auto_257796 - BLOCK
      ?auto_257797 - BLOCK
    )
    :vars
    (
      ?auto_257798 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_257797 ?auto_257798 ) ( not ( = ?auto_257793 ?auto_257794 ) ) ( not ( = ?auto_257793 ?auto_257795 ) ) ( not ( = ?auto_257793 ?auto_257796 ) ) ( not ( = ?auto_257793 ?auto_257797 ) ) ( not ( = ?auto_257793 ?auto_257798 ) ) ( not ( = ?auto_257794 ?auto_257795 ) ) ( not ( = ?auto_257794 ?auto_257796 ) ) ( not ( = ?auto_257794 ?auto_257797 ) ) ( not ( = ?auto_257794 ?auto_257798 ) ) ( not ( = ?auto_257795 ?auto_257796 ) ) ( not ( = ?auto_257795 ?auto_257797 ) ) ( not ( = ?auto_257795 ?auto_257798 ) ) ( not ( = ?auto_257796 ?auto_257797 ) ) ( not ( = ?auto_257796 ?auto_257798 ) ) ( not ( = ?auto_257797 ?auto_257798 ) ) ( ON ?auto_257796 ?auto_257797 ) ( ON ?auto_257795 ?auto_257796 ) ( ON ?auto_257794 ?auto_257795 ) ( ON ?auto_257793 ?auto_257794 ) ( CLEAR ?auto_257793 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_257793 )
      ( MAKE-5PILE ?auto_257793 ?auto_257794 ?auto_257795 ?auto_257796 ?auto_257797 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_257816 - BLOCK
      ?auto_257817 - BLOCK
      ?auto_257818 - BLOCK
      ?auto_257819 - BLOCK
      ?auto_257820 - BLOCK
      ?auto_257821 - BLOCK
    )
    :vars
    (
      ?auto_257822 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_257820 ) ( ON ?auto_257821 ?auto_257822 ) ( CLEAR ?auto_257821 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_257816 ) ( ON ?auto_257817 ?auto_257816 ) ( ON ?auto_257818 ?auto_257817 ) ( ON ?auto_257819 ?auto_257818 ) ( ON ?auto_257820 ?auto_257819 ) ( not ( = ?auto_257816 ?auto_257817 ) ) ( not ( = ?auto_257816 ?auto_257818 ) ) ( not ( = ?auto_257816 ?auto_257819 ) ) ( not ( = ?auto_257816 ?auto_257820 ) ) ( not ( = ?auto_257816 ?auto_257821 ) ) ( not ( = ?auto_257816 ?auto_257822 ) ) ( not ( = ?auto_257817 ?auto_257818 ) ) ( not ( = ?auto_257817 ?auto_257819 ) ) ( not ( = ?auto_257817 ?auto_257820 ) ) ( not ( = ?auto_257817 ?auto_257821 ) ) ( not ( = ?auto_257817 ?auto_257822 ) ) ( not ( = ?auto_257818 ?auto_257819 ) ) ( not ( = ?auto_257818 ?auto_257820 ) ) ( not ( = ?auto_257818 ?auto_257821 ) ) ( not ( = ?auto_257818 ?auto_257822 ) ) ( not ( = ?auto_257819 ?auto_257820 ) ) ( not ( = ?auto_257819 ?auto_257821 ) ) ( not ( = ?auto_257819 ?auto_257822 ) ) ( not ( = ?auto_257820 ?auto_257821 ) ) ( not ( = ?auto_257820 ?auto_257822 ) ) ( not ( = ?auto_257821 ?auto_257822 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_257821 ?auto_257822 )
      ( !STACK ?auto_257821 ?auto_257820 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_257842 - BLOCK
      ?auto_257843 - BLOCK
      ?auto_257844 - BLOCK
      ?auto_257845 - BLOCK
      ?auto_257846 - BLOCK
      ?auto_257847 - BLOCK
    )
    :vars
    (
      ?auto_257848 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_257847 ?auto_257848 ) ( ON-TABLE ?auto_257842 ) ( ON ?auto_257843 ?auto_257842 ) ( ON ?auto_257844 ?auto_257843 ) ( ON ?auto_257845 ?auto_257844 ) ( not ( = ?auto_257842 ?auto_257843 ) ) ( not ( = ?auto_257842 ?auto_257844 ) ) ( not ( = ?auto_257842 ?auto_257845 ) ) ( not ( = ?auto_257842 ?auto_257846 ) ) ( not ( = ?auto_257842 ?auto_257847 ) ) ( not ( = ?auto_257842 ?auto_257848 ) ) ( not ( = ?auto_257843 ?auto_257844 ) ) ( not ( = ?auto_257843 ?auto_257845 ) ) ( not ( = ?auto_257843 ?auto_257846 ) ) ( not ( = ?auto_257843 ?auto_257847 ) ) ( not ( = ?auto_257843 ?auto_257848 ) ) ( not ( = ?auto_257844 ?auto_257845 ) ) ( not ( = ?auto_257844 ?auto_257846 ) ) ( not ( = ?auto_257844 ?auto_257847 ) ) ( not ( = ?auto_257844 ?auto_257848 ) ) ( not ( = ?auto_257845 ?auto_257846 ) ) ( not ( = ?auto_257845 ?auto_257847 ) ) ( not ( = ?auto_257845 ?auto_257848 ) ) ( not ( = ?auto_257846 ?auto_257847 ) ) ( not ( = ?auto_257846 ?auto_257848 ) ) ( not ( = ?auto_257847 ?auto_257848 ) ) ( CLEAR ?auto_257845 ) ( ON ?auto_257846 ?auto_257847 ) ( CLEAR ?auto_257846 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_257842 ?auto_257843 ?auto_257844 ?auto_257845 ?auto_257846 )
      ( MAKE-6PILE ?auto_257842 ?auto_257843 ?auto_257844 ?auto_257845 ?auto_257846 ?auto_257847 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_257868 - BLOCK
      ?auto_257869 - BLOCK
      ?auto_257870 - BLOCK
      ?auto_257871 - BLOCK
      ?auto_257872 - BLOCK
      ?auto_257873 - BLOCK
    )
    :vars
    (
      ?auto_257874 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_257873 ?auto_257874 ) ( ON-TABLE ?auto_257868 ) ( ON ?auto_257869 ?auto_257868 ) ( ON ?auto_257870 ?auto_257869 ) ( not ( = ?auto_257868 ?auto_257869 ) ) ( not ( = ?auto_257868 ?auto_257870 ) ) ( not ( = ?auto_257868 ?auto_257871 ) ) ( not ( = ?auto_257868 ?auto_257872 ) ) ( not ( = ?auto_257868 ?auto_257873 ) ) ( not ( = ?auto_257868 ?auto_257874 ) ) ( not ( = ?auto_257869 ?auto_257870 ) ) ( not ( = ?auto_257869 ?auto_257871 ) ) ( not ( = ?auto_257869 ?auto_257872 ) ) ( not ( = ?auto_257869 ?auto_257873 ) ) ( not ( = ?auto_257869 ?auto_257874 ) ) ( not ( = ?auto_257870 ?auto_257871 ) ) ( not ( = ?auto_257870 ?auto_257872 ) ) ( not ( = ?auto_257870 ?auto_257873 ) ) ( not ( = ?auto_257870 ?auto_257874 ) ) ( not ( = ?auto_257871 ?auto_257872 ) ) ( not ( = ?auto_257871 ?auto_257873 ) ) ( not ( = ?auto_257871 ?auto_257874 ) ) ( not ( = ?auto_257872 ?auto_257873 ) ) ( not ( = ?auto_257872 ?auto_257874 ) ) ( not ( = ?auto_257873 ?auto_257874 ) ) ( ON ?auto_257872 ?auto_257873 ) ( CLEAR ?auto_257870 ) ( ON ?auto_257871 ?auto_257872 ) ( CLEAR ?auto_257871 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_257868 ?auto_257869 ?auto_257870 ?auto_257871 )
      ( MAKE-6PILE ?auto_257868 ?auto_257869 ?auto_257870 ?auto_257871 ?auto_257872 ?auto_257873 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_257894 - BLOCK
      ?auto_257895 - BLOCK
      ?auto_257896 - BLOCK
      ?auto_257897 - BLOCK
      ?auto_257898 - BLOCK
      ?auto_257899 - BLOCK
    )
    :vars
    (
      ?auto_257900 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_257899 ?auto_257900 ) ( ON-TABLE ?auto_257894 ) ( ON ?auto_257895 ?auto_257894 ) ( not ( = ?auto_257894 ?auto_257895 ) ) ( not ( = ?auto_257894 ?auto_257896 ) ) ( not ( = ?auto_257894 ?auto_257897 ) ) ( not ( = ?auto_257894 ?auto_257898 ) ) ( not ( = ?auto_257894 ?auto_257899 ) ) ( not ( = ?auto_257894 ?auto_257900 ) ) ( not ( = ?auto_257895 ?auto_257896 ) ) ( not ( = ?auto_257895 ?auto_257897 ) ) ( not ( = ?auto_257895 ?auto_257898 ) ) ( not ( = ?auto_257895 ?auto_257899 ) ) ( not ( = ?auto_257895 ?auto_257900 ) ) ( not ( = ?auto_257896 ?auto_257897 ) ) ( not ( = ?auto_257896 ?auto_257898 ) ) ( not ( = ?auto_257896 ?auto_257899 ) ) ( not ( = ?auto_257896 ?auto_257900 ) ) ( not ( = ?auto_257897 ?auto_257898 ) ) ( not ( = ?auto_257897 ?auto_257899 ) ) ( not ( = ?auto_257897 ?auto_257900 ) ) ( not ( = ?auto_257898 ?auto_257899 ) ) ( not ( = ?auto_257898 ?auto_257900 ) ) ( not ( = ?auto_257899 ?auto_257900 ) ) ( ON ?auto_257898 ?auto_257899 ) ( ON ?auto_257897 ?auto_257898 ) ( CLEAR ?auto_257895 ) ( ON ?auto_257896 ?auto_257897 ) ( CLEAR ?auto_257896 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_257894 ?auto_257895 ?auto_257896 )
      ( MAKE-6PILE ?auto_257894 ?auto_257895 ?auto_257896 ?auto_257897 ?auto_257898 ?auto_257899 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_257920 - BLOCK
      ?auto_257921 - BLOCK
      ?auto_257922 - BLOCK
      ?auto_257923 - BLOCK
      ?auto_257924 - BLOCK
      ?auto_257925 - BLOCK
    )
    :vars
    (
      ?auto_257926 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_257925 ?auto_257926 ) ( ON-TABLE ?auto_257920 ) ( not ( = ?auto_257920 ?auto_257921 ) ) ( not ( = ?auto_257920 ?auto_257922 ) ) ( not ( = ?auto_257920 ?auto_257923 ) ) ( not ( = ?auto_257920 ?auto_257924 ) ) ( not ( = ?auto_257920 ?auto_257925 ) ) ( not ( = ?auto_257920 ?auto_257926 ) ) ( not ( = ?auto_257921 ?auto_257922 ) ) ( not ( = ?auto_257921 ?auto_257923 ) ) ( not ( = ?auto_257921 ?auto_257924 ) ) ( not ( = ?auto_257921 ?auto_257925 ) ) ( not ( = ?auto_257921 ?auto_257926 ) ) ( not ( = ?auto_257922 ?auto_257923 ) ) ( not ( = ?auto_257922 ?auto_257924 ) ) ( not ( = ?auto_257922 ?auto_257925 ) ) ( not ( = ?auto_257922 ?auto_257926 ) ) ( not ( = ?auto_257923 ?auto_257924 ) ) ( not ( = ?auto_257923 ?auto_257925 ) ) ( not ( = ?auto_257923 ?auto_257926 ) ) ( not ( = ?auto_257924 ?auto_257925 ) ) ( not ( = ?auto_257924 ?auto_257926 ) ) ( not ( = ?auto_257925 ?auto_257926 ) ) ( ON ?auto_257924 ?auto_257925 ) ( ON ?auto_257923 ?auto_257924 ) ( ON ?auto_257922 ?auto_257923 ) ( CLEAR ?auto_257920 ) ( ON ?auto_257921 ?auto_257922 ) ( CLEAR ?auto_257921 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_257920 ?auto_257921 )
      ( MAKE-6PILE ?auto_257920 ?auto_257921 ?auto_257922 ?auto_257923 ?auto_257924 ?auto_257925 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_257946 - BLOCK
      ?auto_257947 - BLOCK
      ?auto_257948 - BLOCK
      ?auto_257949 - BLOCK
      ?auto_257950 - BLOCK
      ?auto_257951 - BLOCK
    )
    :vars
    (
      ?auto_257952 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_257951 ?auto_257952 ) ( not ( = ?auto_257946 ?auto_257947 ) ) ( not ( = ?auto_257946 ?auto_257948 ) ) ( not ( = ?auto_257946 ?auto_257949 ) ) ( not ( = ?auto_257946 ?auto_257950 ) ) ( not ( = ?auto_257946 ?auto_257951 ) ) ( not ( = ?auto_257946 ?auto_257952 ) ) ( not ( = ?auto_257947 ?auto_257948 ) ) ( not ( = ?auto_257947 ?auto_257949 ) ) ( not ( = ?auto_257947 ?auto_257950 ) ) ( not ( = ?auto_257947 ?auto_257951 ) ) ( not ( = ?auto_257947 ?auto_257952 ) ) ( not ( = ?auto_257948 ?auto_257949 ) ) ( not ( = ?auto_257948 ?auto_257950 ) ) ( not ( = ?auto_257948 ?auto_257951 ) ) ( not ( = ?auto_257948 ?auto_257952 ) ) ( not ( = ?auto_257949 ?auto_257950 ) ) ( not ( = ?auto_257949 ?auto_257951 ) ) ( not ( = ?auto_257949 ?auto_257952 ) ) ( not ( = ?auto_257950 ?auto_257951 ) ) ( not ( = ?auto_257950 ?auto_257952 ) ) ( not ( = ?auto_257951 ?auto_257952 ) ) ( ON ?auto_257950 ?auto_257951 ) ( ON ?auto_257949 ?auto_257950 ) ( ON ?auto_257948 ?auto_257949 ) ( ON ?auto_257947 ?auto_257948 ) ( ON ?auto_257946 ?auto_257947 ) ( CLEAR ?auto_257946 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_257946 )
      ( MAKE-6PILE ?auto_257946 ?auto_257947 ?auto_257948 ?auto_257949 ?auto_257950 ?auto_257951 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_257973 - BLOCK
      ?auto_257974 - BLOCK
      ?auto_257975 - BLOCK
      ?auto_257976 - BLOCK
      ?auto_257977 - BLOCK
      ?auto_257978 - BLOCK
      ?auto_257979 - BLOCK
    )
    :vars
    (
      ?auto_257980 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_257978 ) ( ON ?auto_257979 ?auto_257980 ) ( CLEAR ?auto_257979 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_257973 ) ( ON ?auto_257974 ?auto_257973 ) ( ON ?auto_257975 ?auto_257974 ) ( ON ?auto_257976 ?auto_257975 ) ( ON ?auto_257977 ?auto_257976 ) ( ON ?auto_257978 ?auto_257977 ) ( not ( = ?auto_257973 ?auto_257974 ) ) ( not ( = ?auto_257973 ?auto_257975 ) ) ( not ( = ?auto_257973 ?auto_257976 ) ) ( not ( = ?auto_257973 ?auto_257977 ) ) ( not ( = ?auto_257973 ?auto_257978 ) ) ( not ( = ?auto_257973 ?auto_257979 ) ) ( not ( = ?auto_257973 ?auto_257980 ) ) ( not ( = ?auto_257974 ?auto_257975 ) ) ( not ( = ?auto_257974 ?auto_257976 ) ) ( not ( = ?auto_257974 ?auto_257977 ) ) ( not ( = ?auto_257974 ?auto_257978 ) ) ( not ( = ?auto_257974 ?auto_257979 ) ) ( not ( = ?auto_257974 ?auto_257980 ) ) ( not ( = ?auto_257975 ?auto_257976 ) ) ( not ( = ?auto_257975 ?auto_257977 ) ) ( not ( = ?auto_257975 ?auto_257978 ) ) ( not ( = ?auto_257975 ?auto_257979 ) ) ( not ( = ?auto_257975 ?auto_257980 ) ) ( not ( = ?auto_257976 ?auto_257977 ) ) ( not ( = ?auto_257976 ?auto_257978 ) ) ( not ( = ?auto_257976 ?auto_257979 ) ) ( not ( = ?auto_257976 ?auto_257980 ) ) ( not ( = ?auto_257977 ?auto_257978 ) ) ( not ( = ?auto_257977 ?auto_257979 ) ) ( not ( = ?auto_257977 ?auto_257980 ) ) ( not ( = ?auto_257978 ?auto_257979 ) ) ( not ( = ?auto_257978 ?auto_257980 ) ) ( not ( = ?auto_257979 ?auto_257980 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_257979 ?auto_257980 )
      ( !STACK ?auto_257979 ?auto_257978 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_258003 - BLOCK
      ?auto_258004 - BLOCK
      ?auto_258005 - BLOCK
      ?auto_258006 - BLOCK
      ?auto_258007 - BLOCK
      ?auto_258008 - BLOCK
      ?auto_258009 - BLOCK
    )
    :vars
    (
      ?auto_258010 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_258009 ?auto_258010 ) ( ON-TABLE ?auto_258003 ) ( ON ?auto_258004 ?auto_258003 ) ( ON ?auto_258005 ?auto_258004 ) ( ON ?auto_258006 ?auto_258005 ) ( ON ?auto_258007 ?auto_258006 ) ( not ( = ?auto_258003 ?auto_258004 ) ) ( not ( = ?auto_258003 ?auto_258005 ) ) ( not ( = ?auto_258003 ?auto_258006 ) ) ( not ( = ?auto_258003 ?auto_258007 ) ) ( not ( = ?auto_258003 ?auto_258008 ) ) ( not ( = ?auto_258003 ?auto_258009 ) ) ( not ( = ?auto_258003 ?auto_258010 ) ) ( not ( = ?auto_258004 ?auto_258005 ) ) ( not ( = ?auto_258004 ?auto_258006 ) ) ( not ( = ?auto_258004 ?auto_258007 ) ) ( not ( = ?auto_258004 ?auto_258008 ) ) ( not ( = ?auto_258004 ?auto_258009 ) ) ( not ( = ?auto_258004 ?auto_258010 ) ) ( not ( = ?auto_258005 ?auto_258006 ) ) ( not ( = ?auto_258005 ?auto_258007 ) ) ( not ( = ?auto_258005 ?auto_258008 ) ) ( not ( = ?auto_258005 ?auto_258009 ) ) ( not ( = ?auto_258005 ?auto_258010 ) ) ( not ( = ?auto_258006 ?auto_258007 ) ) ( not ( = ?auto_258006 ?auto_258008 ) ) ( not ( = ?auto_258006 ?auto_258009 ) ) ( not ( = ?auto_258006 ?auto_258010 ) ) ( not ( = ?auto_258007 ?auto_258008 ) ) ( not ( = ?auto_258007 ?auto_258009 ) ) ( not ( = ?auto_258007 ?auto_258010 ) ) ( not ( = ?auto_258008 ?auto_258009 ) ) ( not ( = ?auto_258008 ?auto_258010 ) ) ( not ( = ?auto_258009 ?auto_258010 ) ) ( CLEAR ?auto_258007 ) ( ON ?auto_258008 ?auto_258009 ) ( CLEAR ?auto_258008 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_258003 ?auto_258004 ?auto_258005 ?auto_258006 ?auto_258007 ?auto_258008 )
      ( MAKE-7PILE ?auto_258003 ?auto_258004 ?auto_258005 ?auto_258006 ?auto_258007 ?auto_258008 ?auto_258009 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_258033 - BLOCK
      ?auto_258034 - BLOCK
      ?auto_258035 - BLOCK
      ?auto_258036 - BLOCK
      ?auto_258037 - BLOCK
      ?auto_258038 - BLOCK
      ?auto_258039 - BLOCK
    )
    :vars
    (
      ?auto_258040 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_258039 ?auto_258040 ) ( ON-TABLE ?auto_258033 ) ( ON ?auto_258034 ?auto_258033 ) ( ON ?auto_258035 ?auto_258034 ) ( ON ?auto_258036 ?auto_258035 ) ( not ( = ?auto_258033 ?auto_258034 ) ) ( not ( = ?auto_258033 ?auto_258035 ) ) ( not ( = ?auto_258033 ?auto_258036 ) ) ( not ( = ?auto_258033 ?auto_258037 ) ) ( not ( = ?auto_258033 ?auto_258038 ) ) ( not ( = ?auto_258033 ?auto_258039 ) ) ( not ( = ?auto_258033 ?auto_258040 ) ) ( not ( = ?auto_258034 ?auto_258035 ) ) ( not ( = ?auto_258034 ?auto_258036 ) ) ( not ( = ?auto_258034 ?auto_258037 ) ) ( not ( = ?auto_258034 ?auto_258038 ) ) ( not ( = ?auto_258034 ?auto_258039 ) ) ( not ( = ?auto_258034 ?auto_258040 ) ) ( not ( = ?auto_258035 ?auto_258036 ) ) ( not ( = ?auto_258035 ?auto_258037 ) ) ( not ( = ?auto_258035 ?auto_258038 ) ) ( not ( = ?auto_258035 ?auto_258039 ) ) ( not ( = ?auto_258035 ?auto_258040 ) ) ( not ( = ?auto_258036 ?auto_258037 ) ) ( not ( = ?auto_258036 ?auto_258038 ) ) ( not ( = ?auto_258036 ?auto_258039 ) ) ( not ( = ?auto_258036 ?auto_258040 ) ) ( not ( = ?auto_258037 ?auto_258038 ) ) ( not ( = ?auto_258037 ?auto_258039 ) ) ( not ( = ?auto_258037 ?auto_258040 ) ) ( not ( = ?auto_258038 ?auto_258039 ) ) ( not ( = ?auto_258038 ?auto_258040 ) ) ( not ( = ?auto_258039 ?auto_258040 ) ) ( ON ?auto_258038 ?auto_258039 ) ( CLEAR ?auto_258036 ) ( ON ?auto_258037 ?auto_258038 ) ( CLEAR ?auto_258037 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_258033 ?auto_258034 ?auto_258035 ?auto_258036 ?auto_258037 )
      ( MAKE-7PILE ?auto_258033 ?auto_258034 ?auto_258035 ?auto_258036 ?auto_258037 ?auto_258038 ?auto_258039 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_258063 - BLOCK
      ?auto_258064 - BLOCK
      ?auto_258065 - BLOCK
      ?auto_258066 - BLOCK
      ?auto_258067 - BLOCK
      ?auto_258068 - BLOCK
      ?auto_258069 - BLOCK
    )
    :vars
    (
      ?auto_258070 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_258069 ?auto_258070 ) ( ON-TABLE ?auto_258063 ) ( ON ?auto_258064 ?auto_258063 ) ( ON ?auto_258065 ?auto_258064 ) ( not ( = ?auto_258063 ?auto_258064 ) ) ( not ( = ?auto_258063 ?auto_258065 ) ) ( not ( = ?auto_258063 ?auto_258066 ) ) ( not ( = ?auto_258063 ?auto_258067 ) ) ( not ( = ?auto_258063 ?auto_258068 ) ) ( not ( = ?auto_258063 ?auto_258069 ) ) ( not ( = ?auto_258063 ?auto_258070 ) ) ( not ( = ?auto_258064 ?auto_258065 ) ) ( not ( = ?auto_258064 ?auto_258066 ) ) ( not ( = ?auto_258064 ?auto_258067 ) ) ( not ( = ?auto_258064 ?auto_258068 ) ) ( not ( = ?auto_258064 ?auto_258069 ) ) ( not ( = ?auto_258064 ?auto_258070 ) ) ( not ( = ?auto_258065 ?auto_258066 ) ) ( not ( = ?auto_258065 ?auto_258067 ) ) ( not ( = ?auto_258065 ?auto_258068 ) ) ( not ( = ?auto_258065 ?auto_258069 ) ) ( not ( = ?auto_258065 ?auto_258070 ) ) ( not ( = ?auto_258066 ?auto_258067 ) ) ( not ( = ?auto_258066 ?auto_258068 ) ) ( not ( = ?auto_258066 ?auto_258069 ) ) ( not ( = ?auto_258066 ?auto_258070 ) ) ( not ( = ?auto_258067 ?auto_258068 ) ) ( not ( = ?auto_258067 ?auto_258069 ) ) ( not ( = ?auto_258067 ?auto_258070 ) ) ( not ( = ?auto_258068 ?auto_258069 ) ) ( not ( = ?auto_258068 ?auto_258070 ) ) ( not ( = ?auto_258069 ?auto_258070 ) ) ( ON ?auto_258068 ?auto_258069 ) ( ON ?auto_258067 ?auto_258068 ) ( CLEAR ?auto_258065 ) ( ON ?auto_258066 ?auto_258067 ) ( CLEAR ?auto_258066 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_258063 ?auto_258064 ?auto_258065 ?auto_258066 )
      ( MAKE-7PILE ?auto_258063 ?auto_258064 ?auto_258065 ?auto_258066 ?auto_258067 ?auto_258068 ?auto_258069 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_258093 - BLOCK
      ?auto_258094 - BLOCK
      ?auto_258095 - BLOCK
      ?auto_258096 - BLOCK
      ?auto_258097 - BLOCK
      ?auto_258098 - BLOCK
      ?auto_258099 - BLOCK
    )
    :vars
    (
      ?auto_258100 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_258099 ?auto_258100 ) ( ON-TABLE ?auto_258093 ) ( ON ?auto_258094 ?auto_258093 ) ( not ( = ?auto_258093 ?auto_258094 ) ) ( not ( = ?auto_258093 ?auto_258095 ) ) ( not ( = ?auto_258093 ?auto_258096 ) ) ( not ( = ?auto_258093 ?auto_258097 ) ) ( not ( = ?auto_258093 ?auto_258098 ) ) ( not ( = ?auto_258093 ?auto_258099 ) ) ( not ( = ?auto_258093 ?auto_258100 ) ) ( not ( = ?auto_258094 ?auto_258095 ) ) ( not ( = ?auto_258094 ?auto_258096 ) ) ( not ( = ?auto_258094 ?auto_258097 ) ) ( not ( = ?auto_258094 ?auto_258098 ) ) ( not ( = ?auto_258094 ?auto_258099 ) ) ( not ( = ?auto_258094 ?auto_258100 ) ) ( not ( = ?auto_258095 ?auto_258096 ) ) ( not ( = ?auto_258095 ?auto_258097 ) ) ( not ( = ?auto_258095 ?auto_258098 ) ) ( not ( = ?auto_258095 ?auto_258099 ) ) ( not ( = ?auto_258095 ?auto_258100 ) ) ( not ( = ?auto_258096 ?auto_258097 ) ) ( not ( = ?auto_258096 ?auto_258098 ) ) ( not ( = ?auto_258096 ?auto_258099 ) ) ( not ( = ?auto_258096 ?auto_258100 ) ) ( not ( = ?auto_258097 ?auto_258098 ) ) ( not ( = ?auto_258097 ?auto_258099 ) ) ( not ( = ?auto_258097 ?auto_258100 ) ) ( not ( = ?auto_258098 ?auto_258099 ) ) ( not ( = ?auto_258098 ?auto_258100 ) ) ( not ( = ?auto_258099 ?auto_258100 ) ) ( ON ?auto_258098 ?auto_258099 ) ( ON ?auto_258097 ?auto_258098 ) ( ON ?auto_258096 ?auto_258097 ) ( CLEAR ?auto_258094 ) ( ON ?auto_258095 ?auto_258096 ) ( CLEAR ?auto_258095 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_258093 ?auto_258094 ?auto_258095 )
      ( MAKE-7PILE ?auto_258093 ?auto_258094 ?auto_258095 ?auto_258096 ?auto_258097 ?auto_258098 ?auto_258099 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_258123 - BLOCK
      ?auto_258124 - BLOCK
      ?auto_258125 - BLOCK
      ?auto_258126 - BLOCK
      ?auto_258127 - BLOCK
      ?auto_258128 - BLOCK
      ?auto_258129 - BLOCK
    )
    :vars
    (
      ?auto_258130 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_258129 ?auto_258130 ) ( ON-TABLE ?auto_258123 ) ( not ( = ?auto_258123 ?auto_258124 ) ) ( not ( = ?auto_258123 ?auto_258125 ) ) ( not ( = ?auto_258123 ?auto_258126 ) ) ( not ( = ?auto_258123 ?auto_258127 ) ) ( not ( = ?auto_258123 ?auto_258128 ) ) ( not ( = ?auto_258123 ?auto_258129 ) ) ( not ( = ?auto_258123 ?auto_258130 ) ) ( not ( = ?auto_258124 ?auto_258125 ) ) ( not ( = ?auto_258124 ?auto_258126 ) ) ( not ( = ?auto_258124 ?auto_258127 ) ) ( not ( = ?auto_258124 ?auto_258128 ) ) ( not ( = ?auto_258124 ?auto_258129 ) ) ( not ( = ?auto_258124 ?auto_258130 ) ) ( not ( = ?auto_258125 ?auto_258126 ) ) ( not ( = ?auto_258125 ?auto_258127 ) ) ( not ( = ?auto_258125 ?auto_258128 ) ) ( not ( = ?auto_258125 ?auto_258129 ) ) ( not ( = ?auto_258125 ?auto_258130 ) ) ( not ( = ?auto_258126 ?auto_258127 ) ) ( not ( = ?auto_258126 ?auto_258128 ) ) ( not ( = ?auto_258126 ?auto_258129 ) ) ( not ( = ?auto_258126 ?auto_258130 ) ) ( not ( = ?auto_258127 ?auto_258128 ) ) ( not ( = ?auto_258127 ?auto_258129 ) ) ( not ( = ?auto_258127 ?auto_258130 ) ) ( not ( = ?auto_258128 ?auto_258129 ) ) ( not ( = ?auto_258128 ?auto_258130 ) ) ( not ( = ?auto_258129 ?auto_258130 ) ) ( ON ?auto_258128 ?auto_258129 ) ( ON ?auto_258127 ?auto_258128 ) ( ON ?auto_258126 ?auto_258127 ) ( ON ?auto_258125 ?auto_258126 ) ( CLEAR ?auto_258123 ) ( ON ?auto_258124 ?auto_258125 ) ( CLEAR ?auto_258124 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_258123 ?auto_258124 )
      ( MAKE-7PILE ?auto_258123 ?auto_258124 ?auto_258125 ?auto_258126 ?auto_258127 ?auto_258128 ?auto_258129 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_258153 - BLOCK
      ?auto_258154 - BLOCK
      ?auto_258155 - BLOCK
      ?auto_258156 - BLOCK
      ?auto_258157 - BLOCK
      ?auto_258158 - BLOCK
      ?auto_258159 - BLOCK
    )
    :vars
    (
      ?auto_258160 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_258159 ?auto_258160 ) ( not ( = ?auto_258153 ?auto_258154 ) ) ( not ( = ?auto_258153 ?auto_258155 ) ) ( not ( = ?auto_258153 ?auto_258156 ) ) ( not ( = ?auto_258153 ?auto_258157 ) ) ( not ( = ?auto_258153 ?auto_258158 ) ) ( not ( = ?auto_258153 ?auto_258159 ) ) ( not ( = ?auto_258153 ?auto_258160 ) ) ( not ( = ?auto_258154 ?auto_258155 ) ) ( not ( = ?auto_258154 ?auto_258156 ) ) ( not ( = ?auto_258154 ?auto_258157 ) ) ( not ( = ?auto_258154 ?auto_258158 ) ) ( not ( = ?auto_258154 ?auto_258159 ) ) ( not ( = ?auto_258154 ?auto_258160 ) ) ( not ( = ?auto_258155 ?auto_258156 ) ) ( not ( = ?auto_258155 ?auto_258157 ) ) ( not ( = ?auto_258155 ?auto_258158 ) ) ( not ( = ?auto_258155 ?auto_258159 ) ) ( not ( = ?auto_258155 ?auto_258160 ) ) ( not ( = ?auto_258156 ?auto_258157 ) ) ( not ( = ?auto_258156 ?auto_258158 ) ) ( not ( = ?auto_258156 ?auto_258159 ) ) ( not ( = ?auto_258156 ?auto_258160 ) ) ( not ( = ?auto_258157 ?auto_258158 ) ) ( not ( = ?auto_258157 ?auto_258159 ) ) ( not ( = ?auto_258157 ?auto_258160 ) ) ( not ( = ?auto_258158 ?auto_258159 ) ) ( not ( = ?auto_258158 ?auto_258160 ) ) ( not ( = ?auto_258159 ?auto_258160 ) ) ( ON ?auto_258158 ?auto_258159 ) ( ON ?auto_258157 ?auto_258158 ) ( ON ?auto_258156 ?auto_258157 ) ( ON ?auto_258155 ?auto_258156 ) ( ON ?auto_258154 ?auto_258155 ) ( ON ?auto_258153 ?auto_258154 ) ( CLEAR ?auto_258153 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_258153 )
      ( MAKE-7PILE ?auto_258153 ?auto_258154 ?auto_258155 ?auto_258156 ?auto_258157 ?auto_258158 ?auto_258159 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_258184 - BLOCK
      ?auto_258185 - BLOCK
      ?auto_258186 - BLOCK
      ?auto_258187 - BLOCK
      ?auto_258188 - BLOCK
      ?auto_258189 - BLOCK
      ?auto_258190 - BLOCK
      ?auto_258191 - BLOCK
    )
    :vars
    (
      ?auto_258192 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_258190 ) ( ON ?auto_258191 ?auto_258192 ) ( CLEAR ?auto_258191 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_258184 ) ( ON ?auto_258185 ?auto_258184 ) ( ON ?auto_258186 ?auto_258185 ) ( ON ?auto_258187 ?auto_258186 ) ( ON ?auto_258188 ?auto_258187 ) ( ON ?auto_258189 ?auto_258188 ) ( ON ?auto_258190 ?auto_258189 ) ( not ( = ?auto_258184 ?auto_258185 ) ) ( not ( = ?auto_258184 ?auto_258186 ) ) ( not ( = ?auto_258184 ?auto_258187 ) ) ( not ( = ?auto_258184 ?auto_258188 ) ) ( not ( = ?auto_258184 ?auto_258189 ) ) ( not ( = ?auto_258184 ?auto_258190 ) ) ( not ( = ?auto_258184 ?auto_258191 ) ) ( not ( = ?auto_258184 ?auto_258192 ) ) ( not ( = ?auto_258185 ?auto_258186 ) ) ( not ( = ?auto_258185 ?auto_258187 ) ) ( not ( = ?auto_258185 ?auto_258188 ) ) ( not ( = ?auto_258185 ?auto_258189 ) ) ( not ( = ?auto_258185 ?auto_258190 ) ) ( not ( = ?auto_258185 ?auto_258191 ) ) ( not ( = ?auto_258185 ?auto_258192 ) ) ( not ( = ?auto_258186 ?auto_258187 ) ) ( not ( = ?auto_258186 ?auto_258188 ) ) ( not ( = ?auto_258186 ?auto_258189 ) ) ( not ( = ?auto_258186 ?auto_258190 ) ) ( not ( = ?auto_258186 ?auto_258191 ) ) ( not ( = ?auto_258186 ?auto_258192 ) ) ( not ( = ?auto_258187 ?auto_258188 ) ) ( not ( = ?auto_258187 ?auto_258189 ) ) ( not ( = ?auto_258187 ?auto_258190 ) ) ( not ( = ?auto_258187 ?auto_258191 ) ) ( not ( = ?auto_258187 ?auto_258192 ) ) ( not ( = ?auto_258188 ?auto_258189 ) ) ( not ( = ?auto_258188 ?auto_258190 ) ) ( not ( = ?auto_258188 ?auto_258191 ) ) ( not ( = ?auto_258188 ?auto_258192 ) ) ( not ( = ?auto_258189 ?auto_258190 ) ) ( not ( = ?auto_258189 ?auto_258191 ) ) ( not ( = ?auto_258189 ?auto_258192 ) ) ( not ( = ?auto_258190 ?auto_258191 ) ) ( not ( = ?auto_258190 ?auto_258192 ) ) ( not ( = ?auto_258191 ?auto_258192 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_258191 ?auto_258192 )
      ( !STACK ?auto_258191 ?auto_258190 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_258218 - BLOCK
      ?auto_258219 - BLOCK
      ?auto_258220 - BLOCK
      ?auto_258221 - BLOCK
      ?auto_258222 - BLOCK
      ?auto_258223 - BLOCK
      ?auto_258224 - BLOCK
      ?auto_258225 - BLOCK
    )
    :vars
    (
      ?auto_258226 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_258225 ?auto_258226 ) ( ON-TABLE ?auto_258218 ) ( ON ?auto_258219 ?auto_258218 ) ( ON ?auto_258220 ?auto_258219 ) ( ON ?auto_258221 ?auto_258220 ) ( ON ?auto_258222 ?auto_258221 ) ( ON ?auto_258223 ?auto_258222 ) ( not ( = ?auto_258218 ?auto_258219 ) ) ( not ( = ?auto_258218 ?auto_258220 ) ) ( not ( = ?auto_258218 ?auto_258221 ) ) ( not ( = ?auto_258218 ?auto_258222 ) ) ( not ( = ?auto_258218 ?auto_258223 ) ) ( not ( = ?auto_258218 ?auto_258224 ) ) ( not ( = ?auto_258218 ?auto_258225 ) ) ( not ( = ?auto_258218 ?auto_258226 ) ) ( not ( = ?auto_258219 ?auto_258220 ) ) ( not ( = ?auto_258219 ?auto_258221 ) ) ( not ( = ?auto_258219 ?auto_258222 ) ) ( not ( = ?auto_258219 ?auto_258223 ) ) ( not ( = ?auto_258219 ?auto_258224 ) ) ( not ( = ?auto_258219 ?auto_258225 ) ) ( not ( = ?auto_258219 ?auto_258226 ) ) ( not ( = ?auto_258220 ?auto_258221 ) ) ( not ( = ?auto_258220 ?auto_258222 ) ) ( not ( = ?auto_258220 ?auto_258223 ) ) ( not ( = ?auto_258220 ?auto_258224 ) ) ( not ( = ?auto_258220 ?auto_258225 ) ) ( not ( = ?auto_258220 ?auto_258226 ) ) ( not ( = ?auto_258221 ?auto_258222 ) ) ( not ( = ?auto_258221 ?auto_258223 ) ) ( not ( = ?auto_258221 ?auto_258224 ) ) ( not ( = ?auto_258221 ?auto_258225 ) ) ( not ( = ?auto_258221 ?auto_258226 ) ) ( not ( = ?auto_258222 ?auto_258223 ) ) ( not ( = ?auto_258222 ?auto_258224 ) ) ( not ( = ?auto_258222 ?auto_258225 ) ) ( not ( = ?auto_258222 ?auto_258226 ) ) ( not ( = ?auto_258223 ?auto_258224 ) ) ( not ( = ?auto_258223 ?auto_258225 ) ) ( not ( = ?auto_258223 ?auto_258226 ) ) ( not ( = ?auto_258224 ?auto_258225 ) ) ( not ( = ?auto_258224 ?auto_258226 ) ) ( not ( = ?auto_258225 ?auto_258226 ) ) ( CLEAR ?auto_258223 ) ( ON ?auto_258224 ?auto_258225 ) ( CLEAR ?auto_258224 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_258218 ?auto_258219 ?auto_258220 ?auto_258221 ?auto_258222 ?auto_258223 ?auto_258224 )
      ( MAKE-8PILE ?auto_258218 ?auto_258219 ?auto_258220 ?auto_258221 ?auto_258222 ?auto_258223 ?auto_258224 ?auto_258225 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_258252 - BLOCK
      ?auto_258253 - BLOCK
      ?auto_258254 - BLOCK
      ?auto_258255 - BLOCK
      ?auto_258256 - BLOCK
      ?auto_258257 - BLOCK
      ?auto_258258 - BLOCK
      ?auto_258259 - BLOCK
    )
    :vars
    (
      ?auto_258260 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_258259 ?auto_258260 ) ( ON-TABLE ?auto_258252 ) ( ON ?auto_258253 ?auto_258252 ) ( ON ?auto_258254 ?auto_258253 ) ( ON ?auto_258255 ?auto_258254 ) ( ON ?auto_258256 ?auto_258255 ) ( not ( = ?auto_258252 ?auto_258253 ) ) ( not ( = ?auto_258252 ?auto_258254 ) ) ( not ( = ?auto_258252 ?auto_258255 ) ) ( not ( = ?auto_258252 ?auto_258256 ) ) ( not ( = ?auto_258252 ?auto_258257 ) ) ( not ( = ?auto_258252 ?auto_258258 ) ) ( not ( = ?auto_258252 ?auto_258259 ) ) ( not ( = ?auto_258252 ?auto_258260 ) ) ( not ( = ?auto_258253 ?auto_258254 ) ) ( not ( = ?auto_258253 ?auto_258255 ) ) ( not ( = ?auto_258253 ?auto_258256 ) ) ( not ( = ?auto_258253 ?auto_258257 ) ) ( not ( = ?auto_258253 ?auto_258258 ) ) ( not ( = ?auto_258253 ?auto_258259 ) ) ( not ( = ?auto_258253 ?auto_258260 ) ) ( not ( = ?auto_258254 ?auto_258255 ) ) ( not ( = ?auto_258254 ?auto_258256 ) ) ( not ( = ?auto_258254 ?auto_258257 ) ) ( not ( = ?auto_258254 ?auto_258258 ) ) ( not ( = ?auto_258254 ?auto_258259 ) ) ( not ( = ?auto_258254 ?auto_258260 ) ) ( not ( = ?auto_258255 ?auto_258256 ) ) ( not ( = ?auto_258255 ?auto_258257 ) ) ( not ( = ?auto_258255 ?auto_258258 ) ) ( not ( = ?auto_258255 ?auto_258259 ) ) ( not ( = ?auto_258255 ?auto_258260 ) ) ( not ( = ?auto_258256 ?auto_258257 ) ) ( not ( = ?auto_258256 ?auto_258258 ) ) ( not ( = ?auto_258256 ?auto_258259 ) ) ( not ( = ?auto_258256 ?auto_258260 ) ) ( not ( = ?auto_258257 ?auto_258258 ) ) ( not ( = ?auto_258257 ?auto_258259 ) ) ( not ( = ?auto_258257 ?auto_258260 ) ) ( not ( = ?auto_258258 ?auto_258259 ) ) ( not ( = ?auto_258258 ?auto_258260 ) ) ( not ( = ?auto_258259 ?auto_258260 ) ) ( ON ?auto_258258 ?auto_258259 ) ( CLEAR ?auto_258256 ) ( ON ?auto_258257 ?auto_258258 ) ( CLEAR ?auto_258257 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_258252 ?auto_258253 ?auto_258254 ?auto_258255 ?auto_258256 ?auto_258257 )
      ( MAKE-8PILE ?auto_258252 ?auto_258253 ?auto_258254 ?auto_258255 ?auto_258256 ?auto_258257 ?auto_258258 ?auto_258259 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_258286 - BLOCK
      ?auto_258287 - BLOCK
      ?auto_258288 - BLOCK
      ?auto_258289 - BLOCK
      ?auto_258290 - BLOCK
      ?auto_258291 - BLOCK
      ?auto_258292 - BLOCK
      ?auto_258293 - BLOCK
    )
    :vars
    (
      ?auto_258294 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_258293 ?auto_258294 ) ( ON-TABLE ?auto_258286 ) ( ON ?auto_258287 ?auto_258286 ) ( ON ?auto_258288 ?auto_258287 ) ( ON ?auto_258289 ?auto_258288 ) ( not ( = ?auto_258286 ?auto_258287 ) ) ( not ( = ?auto_258286 ?auto_258288 ) ) ( not ( = ?auto_258286 ?auto_258289 ) ) ( not ( = ?auto_258286 ?auto_258290 ) ) ( not ( = ?auto_258286 ?auto_258291 ) ) ( not ( = ?auto_258286 ?auto_258292 ) ) ( not ( = ?auto_258286 ?auto_258293 ) ) ( not ( = ?auto_258286 ?auto_258294 ) ) ( not ( = ?auto_258287 ?auto_258288 ) ) ( not ( = ?auto_258287 ?auto_258289 ) ) ( not ( = ?auto_258287 ?auto_258290 ) ) ( not ( = ?auto_258287 ?auto_258291 ) ) ( not ( = ?auto_258287 ?auto_258292 ) ) ( not ( = ?auto_258287 ?auto_258293 ) ) ( not ( = ?auto_258287 ?auto_258294 ) ) ( not ( = ?auto_258288 ?auto_258289 ) ) ( not ( = ?auto_258288 ?auto_258290 ) ) ( not ( = ?auto_258288 ?auto_258291 ) ) ( not ( = ?auto_258288 ?auto_258292 ) ) ( not ( = ?auto_258288 ?auto_258293 ) ) ( not ( = ?auto_258288 ?auto_258294 ) ) ( not ( = ?auto_258289 ?auto_258290 ) ) ( not ( = ?auto_258289 ?auto_258291 ) ) ( not ( = ?auto_258289 ?auto_258292 ) ) ( not ( = ?auto_258289 ?auto_258293 ) ) ( not ( = ?auto_258289 ?auto_258294 ) ) ( not ( = ?auto_258290 ?auto_258291 ) ) ( not ( = ?auto_258290 ?auto_258292 ) ) ( not ( = ?auto_258290 ?auto_258293 ) ) ( not ( = ?auto_258290 ?auto_258294 ) ) ( not ( = ?auto_258291 ?auto_258292 ) ) ( not ( = ?auto_258291 ?auto_258293 ) ) ( not ( = ?auto_258291 ?auto_258294 ) ) ( not ( = ?auto_258292 ?auto_258293 ) ) ( not ( = ?auto_258292 ?auto_258294 ) ) ( not ( = ?auto_258293 ?auto_258294 ) ) ( ON ?auto_258292 ?auto_258293 ) ( ON ?auto_258291 ?auto_258292 ) ( CLEAR ?auto_258289 ) ( ON ?auto_258290 ?auto_258291 ) ( CLEAR ?auto_258290 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_258286 ?auto_258287 ?auto_258288 ?auto_258289 ?auto_258290 )
      ( MAKE-8PILE ?auto_258286 ?auto_258287 ?auto_258288 ?auto_258289 ?auto_258290 ?auto_258291 ?auto_258292 ?auto_258293 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_258320 - BLOCK
      ?auto_258321 - BLOCK
      ?auto_258322 - BLOCK
      ?auto_258323 - BLOCK
      ?auto_258324 - BLOCK
      ?auto_258325 - BLOCK
      ?auto_258326 - BLOCK
      ?auto_258327 - BLOCK
    )
    :vars
    (
      ?auto_258328 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_258327 ?auto_258328 ) ( ON-TABLE ?auto_258320 ) ( ON ?auto_258321 ?auto_258320 ) ( ON ?auto_258322 ?auto_258321 ) ( not ( = ?auto_258320 ?auto_258321 ) ) ( not ( = ?auto_258320 ?auto_258322 ) ) ( not ( = ?auto_258320 ?auto_258323 ) ) ( not ( = ?auto_258320 ?auto_258324 ) ) ( not ( = ?auto_258320 ?auto_258325 ) ) ( not ( = ?auto_258320 ?auto_258326 ) ) ( not ( = ?auto_258320 ?auto_258327 ) ) ( not ( = ?auto_258320 ?auto_258328 ) ) ( not ( = ?auto_258321 ?auto_258322 ) ) ( not ( = ?auto_258321 ?auto_258323 ) ) ( not ( = ?auto_258321 ?auto_258324 ) ) ( not ( = ?auto_258321 ?auto_258325 ) ) ( not ( = ?auto_258321 ?auto_258326 ) ) ( not ( = ?auto_258321 ?auto_258327 ) ) ( not ( = ?auto_258321 ?auto_258328 ) ) ( not ( = ?auto_258322 ?auto_258323 ) ) ( not ( = ?auto_258322 ?auto_258324 ) ) ( not ( = ?auto_258322 ?auto_258325 ) ) ( not ( = ?auto_258322 ?auto_258326 ) ) ( not ( = ?auto_258322 ?auto_258327 ) ) ( not ( = ?auto_258322 ?auto_258328 ) ) ( not ( = ?auto_258323 ?auto_258324 ) ) ( not ( = ?auto_258323 ?auto_258325 ) ) ( not ( = ?auto_258323 ?auto_258326 ) ) ( not ( = ?auto_258323 ?auto_258327 ) ) ( not ( = ?auto_258323 ?auto_258328 ) ) ( not ( = ?auto_258324 ?auto_258325 ) ) ( not ( = ?auto_258324 ?auto_258326 ) ) ( not ( = ?auto_258324 ?auto_258327 ) ) ( not ( = ?auto_258324 ?auto_258328 ) ) ( not ( = ?auto_258325 ?auto_258326 ) ) ( not ( = ?auto_258325 ?auto_258327 ) ) ( not ( = ?auto_258325 ?auto_258328 ) ) ( not ( = ?auto_258326 ?auto_258327 ) ) ( not ( = ?auto_258326 ?auto_258328 ) ) ( not ( = ?auto_258327 ?auto_258328 ) ) ( ON ?auto_258326 ?auto_258327 ) ( ON ?auto_258325 ?auto_258326 ) ( ON ?auto_258324 ?auto_258325 ) ( CLEAR ?auto_258322 ) ( ON ?auto_258323 ?auto_258324 ) ( CLEAR ?auto_258323 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_258320 ?auto_258321 ?auto_258322 ?auto_258323 )
      ( MAKE-8PILE ?auto_258320 ?auto_258321 ?auto_258322 ?auto_258323 ?auto_258324 ?auto_258325 ?auto_258326 ?auto_258327 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_258354 - BLOCK
      ?auto_258355 - BLOCK
      ?auto_258356 - BLOCK
      ?auto_258357 - BLOCK
      ?auto_258358 - BLOCK
      ?auto_258359 - BLOCK
      ?auto_258360 - BLOCK
      ?auto_258361 - BLOCK
    )
    :vars
    (
      ?auto_258362 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_258361 ?auto_258362 ) ( ON-TABLE ?auto_258354 ) ( ON ?auto_258355 ?auto_258354 ) ( not ( = ?auto_258354 ?auto_258355 ) ) ( not ( = ?auto_258354 ?auto_258356 ) ) ( not ( = ?auto_258354 ?auto_258357 ) ) ( not ( = ?auto_258354 ?auto_258358 ) ) ( not ( = ?auto_258354 ?auto_258359 ) ) ( not ( = ?auto_258354 ?auto_258360 ) ) ( not ( = ?auto_258354 ?auto_258361 ) ) ( not ( = ?auto_258354 ?auto_258362 ) ) ( not ( = ?auto_258355 ?auto_258356 ) ) ( not ( = ?auto_258355 ?auto_258357 ) ) ( not ( = ?auto_258355 ?auto_258358 ) ) ( not ( = ?auto_258355 ?auto_258359 ) ) ( not ( = ?auto_258355 ?auto_258360 ) ) ( not ( = ?auto_258355 ?auto_258361 ) ) ( not ( = ?auto_258355 ?auto_258362 ) ) ( not ( = ?auto_258356 ?auto_258357 ) ) ( not ( = ?auto_258356 ?auto_258358 ) ) ( not ( = ?auto_258356 ?auto_258359 ) ) ( not ( = ?auto_258356 ?auto_258360 ) ) ( not ( = ?auto_258356 ?auto_258361 ) ) ( not ( = ?auto_258356 ?auto_258362 ) ) ( not ( = ?auto_258357 ?auto_258358 ) ) ( not ( = ?auto_258357 ?auto_258359 ) ) ( not ( = ?auto_258357 ?auto_258360 ) ) ( not ( = ?auto_258357 ?auto_258361 ) ) ( not ( = ?auto_258357 ?auto_258362 ) ) ( not ( = ?auto_258358 ?auto_258359 ) ) ( not ( = ?auto_258358 ?auto_258360 ) ) ( not ( = ?auto_258358 ?auto_258361 ) ) ( not ( = ?auto_258358 ?auto_258362 ) ) ( not ( = ?auto_258359 ?auto_258360 ) ) ( not ( = ?auto_258359 ?auto_258361 ) ) ( not ( = ?auto_258359 ?auto_258362 ) ) ( not ( = ?auto_258360 ?auto_258361 ) ) ( not ( = ?auto_258360 ?auto_258362 ) ) ( not ( = ?auto_258361 ?auto_258362 ) ) ( ON ?auto_258360 ?auto_258361 ) ( ON ?auto_258359 ?auto_258360 ) ( ON ?auto_258358 ?auto_258359 ) ( ON ?auto_258357 ?auto_258358 ) ( CLEAR ?auto_258355 ) ( ON ?auto_258356 ?auto_258357 ) ( CLEAR ?auto_258356 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_258354 ?auto_258355 ?auto_258356 )
      ( MAKE-8PILE ?auto_258354 ?auto_258355 ?auto_258356 ?auto_258357 ?auto_258358 ?auto_258359 ?auto_258360 ?auto_258361 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_258388 - BLOCK
      ?auto_258389 - BLOCK
      ?auto_258390 - BLOCK
      ?auto_258391 - BLOCK
      ?auto_258392 - BLOCK
      ?auto_258393 - BLOCK
      ?auto_258394 - BLOCK
      ?auto_258395 - BLOCK
    )
    :vars
    (
      ?auto_258396 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_258395 ?auto_258396 ) ( ON-TABLE ?auto_258388 ) ( not ( = ?auto_258388 ?auto_258389 ) ) ( not ( = ?auto_258388 ?auto_258390 ) ) ( not ( = ?auto_258388 ?auto_258391 ) ) ( not ( = ?auto_258388 ?auto_258392 ) ) ( not ( = ?auto_258388 ?auto_258393 ) ) ( not ( = ?auto_258388 ?auto_258394 ) ) ( not ( = ?auto_258388 ?auto_258395 ) ) ( not ( = ?auto_258388 ?auto_258396 ) ) ( not ( = ?auto_258389 ?auto_258390 ) ) ( not ( = ?auto_258389 ?auto_258391 ) ) ( not ( = ?auto_258389 ?auto_258392 ) ) ( not ( = ?auto_258389 ?auto_258393 ) ) ( not ( = ?auto_258389 ?auto_258394 ) ) ( not ( = ?auto_258389 ?auto_258395 ) ) ( not ( = ?auto_258389 ?auto_258396 ) ) ( not ( = ?auto_258390 ?auto_258391 ) ) ( not ( = ?auto_258390 ?auto_258392 ) ) ( not ( = ?auto_258390 ?auto_258393 ) ) ( not ( = ?auto_258390 ?auto_258394 ) ) ( not ( = ?auto_258390 ?auto_258395 ) ) ( not ( = ?auto_258390 ?auto_258396 ) ) ( not ( = ?auto_258391 ?auto_258392 ) ) ( not ( = ?auto_258391 ?auto_258393 ) ) ( not ( = ?auto_258391 ?auto_258394 ) ) ( not ( = ?auto_258391 ?auto_258395 ) ) ( not ( = ?auto_258391 ?auto_258396 ) ) ( not ( = ?auto_258392 ?auto_258393 ) ) ( not ( = ?auto_258392 ?auto_258394 ) ) ( not ( = ?auto_258392 ?auto_258395 ) ) ( not ( = ?auto_258392 ?auto_258396 ) ) ( not ( = ?auto_258393 ?auto_258394 ) ) ( not ( = ?auto_258393 ?auto_258395 ) ) ( not ( = ?auto_258393 ?auto_258396 ) ) ( not ( = ?auto_258394 ?auto_258395 ) ) ( not ( = ?auto_258394 ?auto_258396 ) ) ( not ( = ?auto_258395 ?auto_258396 ) ) ( ON ?auto_258394 ?auto_258395 ) ( ON ?auto_258393 ?auto_258394 ) ( ON ?auto_258392 ?auto_258393 ) ( ON ?auto_258391 ?auto_258392 ) ( ON ?auto_258390 ?auto_258391 ) ( CLEAR ?auto_258388 ) ( ON ?auto_258389 ?auto_258390 ) ( CLEAR ?auto_258389 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_258388 ?auto_258389 )
      ( MAKE-8PILE ?auto_258388 ?auto_258389 ?auto_258390 ?auto_258391 ?auto_258392 ?auto_258393 ?auto_258394 ?auto_258395 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_258422 - BLOCK
      ?auto_258423 - BLOCK
      ?auto_258424 - BLOCK
      ?auto_258425 - BLOCK
      ?auto_258426 - BLOCK
      ?auto_258427 - BLOCK
      ?auto_258428 - BLOCK
      ?auto_258429 - BLOCK
    )
    :vars
    (
      ?auto_258430 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_258429 ?auto_258430 ) ( not ( = ?auto_258422 ?auto_258423 ) ) ( not ( = ?auto_258422 ?auto_258424 ) ) ( not ( = ?auto_258422 ?auto_258425 ) ) ( not ( = ?auto_258422 ?auto_258426 ) ) ( not ( = ?auto_258422 ?auto_258427 ) ) ( not ( = ?auto_258422 ?auto_258428 ) ) ( not ( = ?auto_258422 ?auto_258429 ) ) ( not ( = ?auto_258422 ?auto_258430 ) ) ( not ( = ?auto_258423 ?auto_258424 ) ) ( not ( = ?auto_258423 ?auto_258425 ) ) ( not ( = ?auto_258423 ?auto_258426 ) ) ( not ( = ?auto_258423 ?auto_258427 ) ) ( not ( = ?auto_258423 ?auto_258428 ) ) ( not ( = ?auto_258423 ?auto_258429 ) ) ( not ( = ?auto_258423 ?auto_258430 ) ) ( not ( = ?auto_258424 ?auto_258425 ) ) ( not ( = ?auto_258424 ?auto_258426 ) ) ( not ( = ?auto_258424 ?auto_258427 ) ) ( not ( = ?auto_258424 ?auto_258428 ) ) ( not ( = ?auto_258424 ?auto_258429 ) ) ( not ( = ?auto_258424 ?auto_258430 ) ) ( not ( = ?auto_258425 ?auto_258426 ) ) ( not ( = ?auto_258425 ?auto_258427 ) ) ( not ( = ?auto_258425 ?auto_258428 ) ) ( not ( = ?auto_258425 ?auto_258429 ) ) ( not ( = ?auto_258425 ?auto_258430 ) ) ( not ( = ?auto_258426 ?auto_258427 ) ) ( not ( = ?auto_258426 ?auto_258428 ) ) ( not ( = ?auto_258426 ?auto_258429 ) ) ( not ( = ?auto_258426 ?auto_258430 ) ) ( not ( = ?auto_258427 ?auto_258428 ) ) ( not ( = ?auto_258427 ?auto_258429 ) ) ( not ( = ?auto_258427 ?auto_258430 ) ) ( not ( = ?auto_258428 ?auto_258429 ) ) ( not ( = ?auto_258428 ?auto_258430 ) ) ( not ( = ?auto_258429 ?auto_258430 ) ) ( ON ?auto_258428 ?auto_258429 ) ( ON ?auto_258427 ?auto_258428 ) ( ON ?auto_258426 ?auto_258427 ) ( ON ?auto_258425 ?auto_258426 ) ( ON ?auto_258424 ?auto_258425 ) ( ON ?auto_258423 ?auto_258424 ) ( ON ?auto_258422 ?auto_258423 ) ( CLEAR ?auto_258422 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_258422 )
      ( MAKE-8PILE ?auto_258422 ?auto_258423 ?auto_258424 ?auto_258425 ?auto_258426 ?auto_258427 ?auto_258428 ?auto_258429 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_258457 - BLOCK
      ?auto_258458 - BLOCK
      ?auto_258459 - BLOCK
      ?auto_258460 - BLOCK
      ?auto_258461 - BLOCK
      ?auto_258462 - BLOCK
      ?auto_258463 - BLOCK
      ?auto_258464 - BLOCK
      ?auto_258465 - BLOCK
    )
    :vars
    (
      ?auto_258466 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_258464 ) ( ON ?auto_258465 ?auto_258466 ) ( CLEAR ?auto_258465 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_258457 ) ( ON ?auto_258458 ?auto_258457 ) ( ON ?auto_258459 ?auto_258458 ) ( ON ?auto_258460 ?auto_258459 ) ( ON ?auto_258461 ?auto_258460 ) ( ON ?auto_258462 ?auto_258461 ) ( ON ?auto_258463 ?auto_258462 ) ( ON ?auto_258464 ?auto_258463 ) ( not ( = ?auto_258457 ?auto_258458 ) ) ( not ( = ?auto_258457 ?auto_258459 ) ) ( not ( = ?auto_258457 ?auto_258460 ) ) ( not ( = ?auto_258457 ?auto_258461 ) ) ( not ( = ?auto_258457 ?auto_258462 ) ) ( not ( = ?auto_258457 ?auto_258463 ) ) ( not ( = ?auto_258457 ?auto_258464 ) ) ( not ( = ?auto_258457 ?auto_258465 ) ) ( not ( = ?auto_258457 ?auto_258466 ) ) ( not ( = ?auto_258458 ?auto_258459 ) ) ( not ( = ?auto_258458 ?auto_258460 ) ) ( not ( = ?auto_258458 ?auto_258461 ) ) ( not ( = ?auto_258458 ?auto_258462 ) ) ( not ( = ?auto_258458 ?auto_258463 ) ) ( not ( = ?auto_258458 ?auto_258464 ) ) ( not ( = ?auto_258458 ?auto_258465 ) ) ( not ( = ?auto_258458 ?auto_258466 ) ) ( not ( = ?auto_258459 ?auto_258460 ) ) ( not ( = ?auto_258459 ?auto_258461 ) ) ( not ( = ?auto_258459 ?auto_258462 ) ) ( not ( = ?auto_258459 ?auto_258463 ) ) ( not ( = ?auto_258459 ?auto_258464 ) ) ( not ( = ?auto_258459 ?auto_258465 ) ) ( not ( = ?auto_258459 ?auto_258466 ) ) ( not ( = ?auto_258460 ?auto_258461 ) ) ( not ( = ?auto_258460 ?auto_258462 ) ) ( not ( = ?auto_258460 ?auto_258463 ) ) ( not ( = ?auto_258460 ?auto_258464 ) ) ( not ( = ?auto_258460 ?auto_258465 ) ) ( not ( = ?auto_258460 ?auto_258466 ) ) ( not ( = ?auto_258461 ?auto_258462 ) ) ( not ( = ?auto_258461 ?auto_258463 ) ) ( not ( = ?auto_258461 ?auto_258464 ) ) ( not ( = ?auto_258461 ?auto_258465 ) ) ( not ( = ?auto_258461 ?auto_258466 ) ) ( not ( = ?auto_258462 ?auto_258463 ) ) ( not ( = ?auto_258462 ?auto_258464 ) ) ( not ( = ?auto_258462 ?auto_258465 ) ) ( not ( = ?auto_258462 ?auto_258466 ) ) ( not ( = ?auto_258463 ?auto_258464 ) ) ( not ( = ?auto_258463 ?auto_258465 ) ) ( not ( = ?auto_258463 ?auto_258466 ) ) ( not ( = ?auto_258464 ?auto_258465 ) ) ( not ( = ?auto_258464 ?auto_258466 ) ) ( not ( = ?auto_258465 ?auto_258466 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_258465 ?auto_258466 )
      ( !STACK ?auto_258465 ?auto_258464 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_258495 - BLOCK
      ?auto_258496 - BLOCK
      ?auto_258497 - BLOCK
      ?auto_258498 - BLOCK
      ?auto_258499 - BLOCK
      ?auto_258500 - BLOCK
      ?auto_258501 - BLOCK
      ?auto_258502 - BLOCK
      ?auto_258503 - BLOCK
    )
    :vars
    (
      ?auto_258504 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_258503 ?auto_258504 ) ( ON-TABLE ?auto_258495 ) ( ON ?auto_258496 ?auto_258495 ) ( ON ?auto_258497 ?auto_258496 ) ( ON ?auto_258498 ?auto_258497 ) ( ON ?auto_258499 ?auto_258498 ) ( ON ?auto_258500 ?auto_258499 ) ( ON ?auto_258501 ?auto_258500 ) ( not ( = ?auto_258495 ?auto_258496 ) ) ( not ( = ?auto_258495 ?auto_258497 ) ) ( not ( = ?auto_258495 ?auto_258498 ) ) ( not ( = ?auto_258495 ?auto_258499 ) ) ( not ( = ?auto_258495 ?auto_258500 ) ) ( not ( = ?auto_258495 ?auto_258501 ) ) ( not ( = ?auto_258495 ?auto_258502 ) ) ( not ( = ?auto_258495 ?auto_258503 ) ) ( not ( = ?auto_258495 ?auto_258504 ) ) ( not ( = ?auto_258496 ?auto_258497 ) ) ( not ( = ?auto_258496 ?auto_258498 ) ) ( not ( = ?auto_258496 ?auto_258499 ) ) ( not ( = ?auto_258496 ?auto_258500 ) ) ( not ( = ?auto_258496 ?auto_258501 ) ) ( not ( = ?auto_258496 ?auto_258502 ) ) ( not ( = ?auto_258496 ?auto_258503 ) ) ( not ( = ?auto_258496 ?auto_258504 ) ) ( not ( = ?auto_258497 ?auto_258498 ) ) ( not ( = ?auto_258497 ?auto_258499 ) ) ( not ( = ?auto_258497 ?auto_258500 ) ) ( not ( = ?auto_258497 ?auto_258501 ) ) ( not ( = ?auto_258497 ?auto_258502 ) ) ( not ( = ?auto_258497 ?auto_258503 ) ) ( not ( = ?auto_258497 ?auto_258504 ) ) ( not ( = ?auto_258498 ?auto_258499 ) ) ( not ( = ?auto_258498 ?auto_258500 ) ) ( not ( = ?auto_258498 ?auto_258501 ) ) ( not ( = ?auto_258498 ?auto_258502 ) ) ( not ( = ?auto_258498 ?auto_258503 ) ) ( not ( = ?auto_258498 ?auto_258504 ) ) ( not ( = ?auto_258499 ?auto_258500 ) ) ( not ( = ?auto_258499 ?auto_258501 ) ) ( not ( = ?auto_258499 ?auto_258502 ) ) ( not ( = ?auto_258499 ?auto_258503 ) ) ( not ( = ?auto_258499 ?auto_258504 ) ) ( not ( = ?auto_258500 ?auto_258501 ) ) ( not ( = ?auto_258500 ?auto_258502 ) ) ( not ( = ?auto_258500 ?auto_258503 ) ) ( not ( = ?auto_258500 ?auto_258504 ) ) ( not ( = ?auto_258501 ?auto_258502 ) ) ( not ( = ?auto_258501 ?auto_258503 ) ) ( not ( = ?auto_258501 ?auto_258504 ) ) ( not ( = ?auto_258502 ?auto_258503 ) ) ( not ( = ?auto_258502 ?auto_258504 ) ) ( not ( = ?auto_258503 ?auto_258504 ) ) ( CLEAR ?auto_258501 ) ( ON ?auto_258502 ?auto_258503 ) ( CLEAR ?auto_258502 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_258495 ?auto_258496 ?auto_258497 ?auto_258498 ?auto_258499 ?auto_258500 ?auto_258501 ?auto_258502 )
      ( MAKE-9PILE ?auto_258495 ?auto_258496 ?auto_258497 ?auto_258498 ?auto_258499 ?auto_258500 ?auto_258501 ?auto_258502 ?auto_258503 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_258533 - BLOCK
      ?auto_258534 - BLOCK
      ?auto_258535 - BLOCK
      ?auto_258536 - BLOCK
      ?auto_258537 - BLOCK
      ?auto_258538 - BLOCK
      ?auto_258539 - BLOCK
      ?auto_258540 - BLOCK
      ?auto_258541 - BLOCK
    )
    :vars
    (
      ?auto_258542 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_258541 ?auto_258542 ) ( ON-TABLE ?auto_258533 ) ( ON ?auto_258534 ?auto_258533 ) ( ON ?auto_258535 ?auto_258534 ) ( ON ?auto_258536 ?auto_258535 ) ( ON ?auto_258537 ?auto_258536 ) ( ON ?auto_258538 ?auto_258537 ) ( not ( = ?auto_258533 ?auto_258534 ) ) ( not ( = ?auto_258533 ?auto_258535 ) ) ( not ( = ?auto_258533 ?auto_258536 ) ) ( not ( = ?auto_258533 ?auto_258537 ) ) ( not ( = ?auto_258533 ?auto_258538 ) ) ( not ( = ?auto_258533 ?auto_258539 ) ) ( not ( = ?auto_258533 ?auto_258540 ) ) ( not ( = ?auto_258533 ?auto_258541 ) ) ( not ( = ?auto_258533 ?auto_258542 ) ) ( not ( = ?auto_258534 ?auto_258535 ) ) ( not ( = ?auto_258534 ?auto_258536 ) ) ( not ( = ?auto_258534 ?auto_258537 ) ) ( not ( = ?auto_258534 ?auto_258538 ) ) ( not ( = ?auto_258534 ?auto_258539 ) ) ( not ( = ?auto_258534 ?auto_258540 ) ) ( not ( = ?auto_258534 ?auto_258541 ) ) ( not ( = ?auto_258534 ?auto_258542 ) ) ( not ( = ?auto_258535 ?auto_258536 ) ) ( not ( = ?auto_258535 ?auto_258537 ) ) ( not ( = ?auto_258535 ?auto_258538 ) ) ( not ( = ?auto_258535 ?auto_258539 ) ) ( not ( = ?auto_258535 ?auto_258540 ) ) ( not ( = ?auto_258535 ?auto_258541 ) ) ( not ( = ?auto_258535 ?auto_258542 ) ) ( not ( = ?auto_258536 ?auto_258537 ) ) ( not ( = ?auto_258536 ?auto_258538 ) ) ( not ( = ?auto_258536 ?auto_258539 ) ) ( not ( = ?auto_258536 ?auto_258540 ) ) ( not ( = ?auto_258536 ?auto_258541 ) ) ( not ( = ?auto_258536 ?auto_258542 ) ) ( not ( = ?auto_258537 ?auto_258538 ) ) ( not ( = ?auto_258537 ?auto_258539 ) ) ( not ( = ?auto_258537 ?auto_258540 ) ) ( not ( = ?auto_258537 ?auto_258541 ) ) ( not ( = ?auto_258537 ?auto_258542 ) ) ( not ( = ?auto_258538 ?auto_258539 ) ) ( not ( = ?auto_258538 ?auto_258540 ) ) ( not ( = ?auto_258538 ?auto_258541 ) ) ( not ( = ?auto_258538 ?auto_258542 ) ) ( not ( = ?auto_258539 ?auto_258540 ) ) ( not ( = ?auto_258539 ?auto_258541 ) ) ( not ( = ?auto_258539 ?auto_258542 ) ) ( not ( = ?auto_258540 ?auto_258541 ) ) ( not ( = ?auto_258540 ?auto_258542 ) ) ( not ( = ?auto_258541 ?auto_258542 ) ) ( ON ?auto_258540 ?auto_258541 ) ( CLEAR ?auto_258538 ) ( ON ?auto_258539 ?auto_258540 ) ( CLEAR ?auto_258539 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_258533 ?auto_258534 ?auto_258535 ?auto_258536 ?auto_258537 ?auto_258538 ?auto_258539 )
      ( MAKE-9PILE ?auto_258533 ?auto_258534 ?auto_258535 ?auto_258536 ?auto_258537 ?auto_258538 ?auto_258539 ?auto_258540 ?auto_258541 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_258571 - BLOCK
      ?auto_258572 - BLOCK
      ?auto_258573 - BLOCK
      ?auto_258574 - BLOCK
      ?auto_258575 - BLOCK
      ?auto_258576 - BLOCK
      ?auto_258577 - BLOCK
      ?auto_258578 - BLOCK
      ?auto_258579 - BLOCK
    )
    :vars
    (
      ?auto_258580 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_258579 ?auto_258580 ) ( ON-TABLE ?auto_258571 ) ( ON ?auto_258572 ?auto_258571 ) ( ON ?auto_258573 ?auto_258572 ) ( ON ?auto_258574 ?auto_258573 ) ( ON ?auto_258575 ?auto_258574 ) ( not ( = ?auto_258571 ?auto_258572 ) ) ( not ( = ?auto_258571 ?auto_258573 ) ) ( not ( = ?auto_258571 ?auto_258574 ) ) ( not ( = ?auto_258571 ?auto_258575 ) ) ( not ( = ?auto_258571 ?auto_258576 ) ) ( not ( = ?auto_258571 ?auto_258577 ) ) ( not ( = ?auto_258571 ?auto_258578 ) ) ( not ( = ?auto_258571 ?auto_258579 ) ) ( not ( = ?auto_258571 ?auto_258580 ) ) ( not ( = ?auto_258572 ?auto_258573 ) ) ( not ( = ?auto_258572 ?auto_258574 ) ) ( not ( = ?auto_258572 ?auto_258575 ) ) ( not ( = ?auto_258572 ?auto_258576 ) ) ( not ( = ?auto_258572 ?auto_258577 ) ) ( not ( = ?auto_258572 ?auto_258578 ) ) ( not ( = ?auto_258572 ?auto_258579 ) ) ( not ( = ?auto_258572 ?auto_258580 ) ) ( not ( = ?auto_258573 ?auto_258574 ) ) ( not ( = ?auto_258573 ?auto_258575 ) ) ( not ( = ?auto_258573 ?auto_258576 ) ) ( not ( = ?auto_258573 ?auto_258577 ) ) ( not ( = ?auto_258573 ?auto_258578 ) ) ( not ( = ?auto_258573 ?auto_258579 ) ) ( not ( = ?auto_258573 ?auto_258580 ) ) ( not ( = ?auto_258574 ?auto_258575 ) ) ( not ( = ?auto_258574 ?auto_258576 ) ) ( not ( = ?auto_258574 ?auto_258577 ) ) ( not ( = ?auto_258574 ?auto_258578 ) ) ( not ( = ?auto_258574 ?auto_258579 ) ) ( not ( = ?auto_258574 ?auto_258580 ) ) ( not ( = ?auto_258575 ?auto_258576 ) ) ( not ( = ?auto_258575 ?auto_258577 ) ) ( not ( = ?auto_258575 ?auto_258578 ) ) ( not ( = ?auto_258575 ?auto_258579 ) ) ( not ( = ?auto_258575 ?auto_258580 ) ) ( not ( = ?auto_258576 ?auto_258577 ) ) ( not ( = ?auto_258576 ?auto_258578 ) ) ( not ( = ?auto_258576 ?auto_258579 ) ) ( not ( = ?auto_258576 ?auto_258580 ) ) ( not ( = ?auto_258577 ?auto_258578 ) ) ( not ( = ?auto_258577 ?auto_258579 ) ) ( not ( = ?auto_258577 ?auto_258580 ) ) ( not ( = ?auto_258578 ?auto_258579 ) ) ( not ( = ?auto_258578 ?auto_258580 ) ) ( not ( = ?auto_258579 ?auto_258580 ) ) ( ON ?auto_258578 ?auto_258579 ) ( ON ?auto_258577 ?auto_258578 ) ( CLEAR ?auto_258575 ) ( ON ?auto_258576 ?auto_258577 ) ( CLEAR ?auto_258576 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_258571 ?auto_258572 ?auto_258573 ?auto_258574 ?auto_258575 ?auto_258576 )
      ( MAKE-9PILE ?auto_258571 ?auto_258572 ?auto_258573 ?auto_258574 ?auto_258575 ?auto_258576 ?auto_258577 ?auto_258578 ?auto_258579 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_258609 - BLOCK
      ?auto_258610 - BLOCK
      ?auto_258611 - BLOCK
      ?auto_258612 - BLOCK
      ?auto_258613 - BLOCK
      ?auto_258614 - BLOCK
      ?auto_258615 - BLOCK
      ?auto_258616 - BLOCK
      ?auto_258617 - BLOCK
    )
    :vars
    (
      ?auto_258618 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_258617 ?auto_258618 ) ( ON-TABLE ?auto_258609 ) ( ON ?auto_258610 ?auto_258609 ) ( ON ?auto_258611 ?auto_258610 ) ( ON ?auto_258612 ?auto_258611 ) ( not ( = ?auto_258609 ?auto_258610 ) ) ( not ( = ?auto_258609 ?auto_258611 ) ) ( not ( = ?auto_258609 ?auto_258612 ) ) ( not ( = ?auto_258609 ?auto_258613 ) ) ( not ( = ?auto_258609 ?auto_258614 ) ) ( not ( = ?auto_258609 ?auto_258615 ) ) ( not ( = ?auto_258609 ?auto_258616 ) ) ( not ( = ?auto_258609 ?auto_258617 ) ) ( not ( = ?auto_258609 ?auto_258618 ) ) ( not ( = ?auto_258610 ?auto_258611 ) ) ( not ( = ?auto_258610 ?auto_258612 ) ) ( not ( = ?auto_258610 ?auto_258613 ) ) ( not ( = ?auto_258610 ?auto_258614 ) ) ( not ( = ?auto_258610 ?auto_258615 ) ) ( not ( = ?auto_258610 ?auto_258616 ) ) ( not ( = ?auto_258610 ?auto_258617 ) ) ( not ( = ?auto_258610 ?auto_258618 ) ) ( not ( = ?auto_258611 ?auto_258612 ) ) ( not ( = ?auto_258611 ?auto_258613 ) ) ( not ( = ?auto_258611 ?auto_258614 ) ) ( not ( = ?auto_258611 ?auto_258615 ) ) ( not ( = ?auto_258611 ?auto_258616 ) ) ( not ( = ?auto_258611 ?auto_258617 ) ) ( not ( = ?auto_258611 ?auto_258618 ) ) ( not ( = ?auto_258612 ?auto_258613 ) ) ( not ( = ?auto_258612 ?auto_258614 ) ) ( not ( = ?auto_258612 ?auto_258615 ) ) ( not ( = ?auto_258612 ?auto_258616 ) ) ( not ( = ?auto_258612 ?auto_258617 ) ) ( not ( = ?auto_258612 ?auto_258618 ) ) ( not ( = ?auto_258613 ?auto_258614 ) ) ( not ( = ?auto_258613 ?auto_258615 ) ) ( not ( = ?auto_258613 ?auto_258616 ) ) ( not ( = ?auto_258613 ?auto_258617 ) ) ( not ( = ?auto_258613 ?auto_258618 ) ) ( not ( = ?auto_258614 ?auto_258615 ) ) ( not ( = ?auto_258614 ?auto_258616 ) ) ( not ( = ?auto_258614 ?auto_258617 ) ) ( not ( = ?auto_258614 ?auto_258618 ) ) ( not ( = ?auto_258615 ?auto_258616 ) ) ( not ( = ?auto_258615 ?auto_258617 ) ) ( not ( = ?auto_258615 ?auto_258618 ) ) ( not ( = ?auto_258616 ?auto_258617 ) ) ( not ( = ?auto_258616 ?auto_258618 ) ) ( not ( = ?auto_258617 ?auto_258618 ) ) ( ON ?auto_258616 ?auto_258617 ) ( ON ?auto_258615 ?auto_258616 ) ( ON ?auto_258614 ?auto_258615 ) ( CLEAR ?auto_258612 ) ( ON ?auto_258613 ?auto_258614 ) ( CLEAR ?auto_258613 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_258609 ?auto_258610 ?auto_258611 ?auto_258612 ?auto_258613 )
      ( MAKE-9PILE ?auto_258609 ?auto_258610 ?auto_258611 ?auto_258612 ?auto_258613 ?auto_258614 ?auto_258615 ?auto_258616 ?auto_258617 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_258647 - BLOCK
      ?auto_258648 - BLOCK
      ?auto_258649 - BLOCK
      ?auto_258650 - BLOCK
      ?auto_258651 - BLOCK
      ?auto_258652 - BLOCK
      ?auto_258653 - BLOCK
      ?auto_258654 - BLOCK
      ?auto_258655 - BLOCK
    )
    :vars
    (
      ?auto_258656 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_258655 ?auto_258656 ) ( ON-TABLE ?auto_258647 ) ( ON ?auto_258648 ?auto_258647 ) ( ON ?auto_258649 ?auto_258648 ) ( not ( = ?auto_258647 ?auto_258648 ) ) ( not ( = ?auto_258647 ?auto_258649 ) ) ( not ( = ?auto_258647 ?auto_258650 ) ) ( not ( = ?auto_258647 ?auto_258651 ) ) ( not ( = ?auto_258647 ?auto_258652 ) ) ( not ( = ?auto_258647 ?auto_258653 ) ) ( not ( = ?auto_258647 ?auto_258654 ) ) ( not ( = ?auto_258647 ?auto_258655 ) ) ( not ( = ?auto_258647 ?auto_258656 ) ) ( not ( = ?auto_258648 ?auto_258649 ) ) ( not ( = ?auto_258648 ?auto_258650 ) ) ( not ( = ?auto_258648 ?auto_258651 ) ) ( not ( = ?auto_258648 ?auto_258652 ) ) ( not ( = ?auto_258648 ?auto_258653 ) ) ( not ( = ?auto_258648 ?auto_258654 ) ) ( not ( = ?auto_258648 ?auto_258655 ) ) ( not ( = ?auto_258648 ?auto_258656 ) ) ( not ( = ?auto_258649 ?auto_258650 ) ) ( not ( = ?auto_258649 ?auto_258651 ) ) ( not ( = ?auto_258649 ?auto_258652 ) ) ( not ( = ?auto_258649 ?auto_258653 ) ) ( not ( = ?auto_258649 ?auto_258654 ) ) ( not ( = ?auto_258649 ?auto_258655 ) ) ( not ( = ?auto_258649 ?auto_258656 ) ) ( not ( = ?auto_258650 ?auto_258651 ) ) ( not ( = ?auto_258650 ?auto_258652 ) ) ( not ( = ?auto_258650 ?auto_258653 ) ) ( not ( = ?auto_258650 ?auto_258654 ) ) ( not ( = ?auto_258650 ?auto_258655 ) ) ( not ( = ?auto_258650 ?auto_258656 ) ) ( not ( = ?auto_258651 ?auto_258652 ) ) ( not ( = ?auto_258651 ?auto_258653 ) ) ( not ( = ?auto_258651 ?auto_258654 ) ) ( not ( = ?auto_258651 ?auto_258655 ) ) ( not ( = ?auto_258651 ?auto_258656 ) ) ( not ( = ?auto_258652 ?auto_258653 ) ) ( not ( = ?auto_258652 ?auto_258654 ) ) ( not ( = ?auto_258652 ?auto_258655 ) ) ( not ( = ?auto_258652 ?auto_258656 ) ) ( not ( = ?auto_258653 ?auto_258654 ) ) ( not ( = ?auto_258653 ?auto_258655 ) ) ( not ( = ?auto_258653 ?auto_258656 ) ) ( not ( = ?auto_258654 ?auto_258655 ) ) ( not ( = ?auto_258654 ?auto_258656 ) ) ( not ( = ?auto_258655 ?auto_258656 ) ) ( ON ?auto_258654 ?auto_258655 ) ( ON ?auto_258653 ?auto_258654 ) ( ON ?auto_258652 ?auto_258653 ) ( ON ?auto_258651 ?auto_258652 ) ( CLEAR ?auto_258649 ) ( ON ?auto_258650 ?auto_258651 ) ( CLEAR ?auto_258650 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_258647 ?auto_258648 ?auto_258649 ?auto_258650 )
      ( MAKE-9PILE ?auto_258647 ?auto_258648 ?auto_258649 ?auto_258650 ?auto_258651 ?auto_258652 ?auto_258653 ?auto_258654 ?auto_258655 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_258685 - BLOCK
      ?auto_258686 - BLOCK
      ?auto_258687 - BLOCK
      ?auto_258688 - BLOCK
      ?auto_258689 - BLOCK
      ?auto_258690 - BLOCK
      ?auto_258691 - BLOCK
      ?auto_258692 - BLOCK
      ?auto_258693 - BLOCK
    )
    :vars
    (
      ?auto_258694 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_258693 ?auto_258694 ) ( ON-TABLE ?auto_258685 ) ( ON ?auto_258686 ?auto_258685 ) ( not ( = ?auto_258685 ?auto_258686 ) ) ( not ( = ?auto_258685 ?auto_258687 ) ) ( not ( = ?auto_258685 ?auto_258688 ) ) ( not ( = ?auto_258685 ?auto_258689 ) ) ( not ( = ?auto_258685 ?auto_258690 ) ) ( not ( = ?auto_258685 ?auto_258691 ) ) ( not ( = ?auto_258685 ?auto_258692 ) ) ( not ( = ?auto_258685 ?auto_258693 ) ) ( not ( = ?auto_258685 ?auto_258694 ) ) ( not ( = ?auto_258686 ?auto_258687 ) ) ( not ( = ?auto_258686 ?auto_258688 ) ) ( not ( = ?auto_258686 ?auto_258689 ) ) ( not ( = ?auto_258686 ?auto_258690 ) ) ( not ( = ?auto_258686 ?auto_258691 ) ) ( not ( = ?auto_258686 ?auto_258692 ) ) ( not ( = ?auto_258686 ?auto_258693 ) ) ( not ( = ?auto_258686 ?auto_258694 ) ) ( not ( = ?auto_258687 ?auto_258688 ) ) ( not ( = ?auto_258687 ?auto_258689 ) ) ( not ( = ?auto_258687 ?auto_258690 ) ) ( not ( = ?auto_258687 ?auto_258691 ) ) ( not ( = ?auto_258687 ?auto_258692 ) ) ( not ( = ?auto_258687 ?auto_258693 ) ) ( not ( = ?auto_258687 ?auto_258694 ) ) ( not ( = ?auto_258688 ?auto_258689 ) ) ( not ( = ?auto_258688 ?auto_258690 ) ) ( not ( = ?auto_258688 ?auto_258691 ) ) ( not ( = ?auto_258688 ?auto_258692 ) ) ( not ( = ?auto_258688 ?auto_258693 ) ) ( not ( = ?auto_258688 ?auto_258694 ) ) ( not ( = ?auto_258689 ?auto_258690 ) ) ( not ( = ?auto_258689 ?auto_258691 ) ) ( not ( = ?auto_258689 ?auto_258692 ) ) ( not ( = ?auto_258689 ?auto_258693 ) ) ( not ( = ?auto_258689 ?auto_258694 ) ) ( not ( = ?auto_258690 ?auto_258691 ) ) ( not ( = ?auto_258690 ?auto_258692 ) ) ( not ( = ?auto_258690 ?auto_258693 ) ) ( not ( = ?auto_258690 ?auto_258694 ) ) ( not ( = ?auto_258691 ?auto_258692 ) ) ( not ( = ?auto_258691 ?auto_258693 ) ) ( not ( = ?auto_258691 ?auto_258694 ) ) ( not ( = ?auto_258692 ?auto_258693 ) ) ( not ( = ?auto_258692 ?auto_258694 ) ) ( not ( = ?auto_258693 ?auto_258694 ) ) ( ON ?auto_258692 ?auto_258693 ) ( ON ?auto_258691 ?auto_258692 ) ( ON ?auto_258690 ?auto_258691 ) ( ON ?auto_258689 ?auto_258690 ) ( ON ?auto_258688 ?auto_258689 ) ( CLEAR ?auto_258686 ) ( ON ?auto_258687 ?auto_258688 ) ( CLEAR ?auto_258687 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_258685 ?auto_258686 ?auto_258687 )
      ( MAKE-9PILE ?auto_258685 ?auto_258686 ?auto_258687 ?auto_258688 ?auto_258689 ?auto_258690 ?auto_258691 ?auto_258692 ?auto_258693 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_258723 - BLOCK
      ?auto_258724 - BLOCK
      ?auto_258725 - BLOCK
      ?auto_258726 - BLOCK
      ?auto_258727 - BLOCK
      ?auto_258728 - BLOCK
      ?auto_258729 - BLOCK
      ?auto_258730 - BLOCK
      ?auto_258731 - BLOCK
    )
    :vars
    (
      ?auto_258732 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_258731 ?auto_258732 ) ( ON-TABLE ?auto_258723 ) ( not ( = ?auto_258723 ?auto_258724 ) ) ( not ( = ?auto_258723 ?auto_258725 ) ) ( not ( = ?auto_258723 ?auto_258726 ) ) ( not ( = ?auto_258723 ?auto_258727 ) ) ( not ( = ?auto_258723 ?auto_258728 ) ) ( not ( = ?auto_258723 ?auto_258729 ) ) ( not ( = ?auto_258723 ?auto_258730 ) ) ( not ( = ?auto_258723 ?auto_258731 ) ) ( not ( = ?auto_258723 ?auto_258732 ) ) ( not ( = ?auto_258724 ?auto_258725 ) ) ( not ( = ?auto_258724 ?auto_258726 ) ) ( not ( = ?auto_258724 ?auto_258727 ) ) ( not ( = ?auto_258724 ?auto_258728 ) ) ( not ( = ?auto_258724 ?auto_258729 ) ) ( not ( = ?auto_258724 ?auto_258730 ) ) ( not ( = ?auto_258724 ?auto_258731 ) ) ( not ( = ?auto_258724 ?auto_258732 ) ) ( not ( = ?auto_258725 ?auto_258726 ) ) ( not ( = ?auto_258725 ?auto_258727 ) ) ( not ( = ?auto_258725 ?auto_258728 ) ) ( not ( = ?auto_258725 ?auto_258729 ) ) ( not ( = ?auto_258725 ?auto_258730 ) ) ( not ( = ?auto_258725 ?auto_258731 ) ) ( not ( = ?auto_258725 ?auto_258732 ) ) ( not ( = ?auto_258726 ?auto_258727 ) ) ( not ( = ?auto_258726 ?auto_258728 ) ) ( not ( = ?auto_258726 ?auto_258729 ) ) ( not ( = ?auto_258726 ?auto_258730 ) ) ( not ( = ?auto_258726 ?auto_258731 ) ) ( not ( = ?auto_258726 ?auto_258732 ) ) ( not ( = ?auto_258727 ?auto_258728 ) ) ( not ( = ?auto_258727 ?auto_258729 ) ) ( not ( = ?auto_258727 ?auto_258730 ) ) ( not ( = ?auto_258727 ?auto_258731 ) ) ( not ( = ?auto_258727 ?auto_258732 ) ) ( not ( = ?auto_258728 ?auto_258729 ) ) ( not ( = ?auto_258728 ?auto_258730 ) ) ( not ( = ?auto_258728 ?auto_258731 ) ) ( not ( = ?auto_258728 ?auto_258732 ) ) ( not ( = ?auto_258729 ?auto_258730 ) ) ( not ( = ?auto_258729 ?auto_258731 ) ) ( not ( = ?auto_258729 ?auto_258732 ) ) ( not ( = ?auto_258730 ?auto_258731 ) ) ( not ( = ?auto_258730 ?auto_258732 ) ) ( not ( = ?auto_258731 ?auto_258732 ) ) ( ON ?auto_258730 ?auto_258731 ) ( ON ?auto_258729 ?auto_258730 ) ( ON ?auto_258728 ?auto_258729 ) ( ON ?auto_258727 ?auto_258728 ) ( ON ?auto_258726 ?auto_258727 ) ( ON ?auto_258725 ?auto_258726 ) ( CLEAR ?auto_258723 ) ( ON ?auto_258724 ?auto_258725 ) ( CLEAR ?auto_258724 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_258723 ?auto_258724 )
      ( MAKE-9PILE ?auto_258723 ?auto_258724 ?auto_258725 ?auto_258726 ?auto_258727 ?auto_258728 ?auto_258729 ?auto_258730 ?auto_258731 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_258761 - BLOCK
      ?auto_258762 - BLOCK
      ?auto_258763 - BLOCK
      ?auto_258764 - BLOCK
      ?auto_258765 - BLOCK
      ?auto_258766 - BLOCK
      ?auto_258767 - BLOCK
      ?auto_258768 - BLOCK
      ?auto_258769 - BLOCK
    )
    :vars
    (
      ?auto_258770 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_258769 ?auto_258770 ) ( not ( = ?auto_258761 ?auto_258762 ) ) ( not ( = ?auto_258761 ?auto_258763 ) ) ( not ( = ?auto_258761 ?auto_258764 ) ) ( not ( = ?auto_258761 ?auto_258765 ) ) ( not ( = ?auto_258761 ?auto_258766 ) ) ( not ( = ?auto_258761 ?auto_258767 ) ) ( not ( = ?auto_258761 ?auto_258768 ) ) ( not ( = ?auto_258761 ?auto_258769 ) ) ( not ( = ?auto_258761 ?auto_258770 ) ) ( not ( = ?auto_258762 ?auto_258763 ) ) ( not ( = ?auto_258762 ?auto_258764 ) ) ( not ( = ?auto_258762 ?auto_258765 ) ) ( not ( = ?auto_258762 ?auto_258766 ) ) ( not ( = ?auto_258762 ?auto_258767 ) ) ( not ( = ?auto_258762 ?auto_258768 ) ) ( not ( = ?auto_258762 ?auto_258769 ) ) ( not ( = ?auto_258762 ?auto_258770 ) ) ( not ( = ?auto_258763 ?auto_258764 ) ) ( not ( = ?auto_258763 ?auto_258765 ) ) ( not ( = ?auto_258763 ?auto_258766 ) ) ( not ( = ?auto_258763 ?auto_258767 ) ) ( not ( = ?auto_258763 ?auto_258768 ) ) ( not ( = ?auto_258763 ?auto_258769 ) ) ( not ( = ?auto_258763 ?auto_258770 ) ) ( not ( = ?auto_258764 ?auto_258765 ) ) ( not ( = ?auto_258764 ?auto_258766 ) ) ( not ( = ?auto_258764 ?auto_258767 ) ) ( not ( = ?auto_258764 ?auto_258768 ) ) ( not ( = ?auto_258764 ?auto_258769 ) ) ( not ( = ?auto_258764 ?auto_258770 ) ) ( not ( = ?auto_258765 ?auto_258766 ) ) ( not ( = ?auto_258765 ?auto_258767 ) ) ( not ( = ?auto_258765 ?auto_258768 ) ) ( not ( = ?auto_258765 ?auto_258769 ) ) ( not ( = ?auto_258765 ?auto_258770 ) ) ( not ( = ?auto_258766 ?auto_258767 ) ) ( not ( = ?auto_258766 ?auto_258768 ) ) ( not ( = ?auto_258766 ?auto_258769 ) ) ( not ( = ?auto_258766 ?auto_258770 ) ) ( not ( = ?auto_258767 ?auto_258768 ) ) ( not ( = ?auto_258767 ?auto_258769 ) ) ( not ( = ?auto_258767 ?auto_258770 ) ) ( not ( = ?auto_258768 ?auto_258769 ) ) ( not ( = ?auto_258768 ?auto_258770 ) ) ( not ( = ?auto_258769 ?auto_258770 ) ) ( ON ?auto_258768 ?auto_258769 ) ( ON ?auto_258767 ?auto_258768 ) ( ON ?auto_258766 ?auto_258767 ) ( ON ?auto_258765 ?auto_258766 ) ( ON ?auto_258764 ?auto_258765 ) ( ON ?auto_258763 ?auto_258764 ) ( ON ?auto_258762 ?auto_258763 ) ( ON ?auto_258761 ?auto_258762 ) ( CLEAR ?auto_258761 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_258761 )
      ( MAKE-9PILE ?auto_258761 ?auto_258762 ?auto_258763 ?auto_258764 ?auto_258765 ?auto_258766 ?auto_258767 ?auto_258768 ?auto_258769 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_258800 - BLOCK
      ?auto_258801 - BLOCK
      ?auto_258802 - BLOCK
      ?auto_258803 - BLOCK
      ?auto_258804 - BLOCK
      ?auto_258805 - BLOCK
      ?auto_258806 - BLOCK
      ?auto_258807 - BLOCK
      ?auto_258808 - BLOCK
      ?auto_258809 - BLOCK
    )
    :vars
    (
      ?auto_258810 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_258808 ) ( ON ?auto_258809 ?auto_258810 ) ( CLEAR ?auto_258809 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_258800 ) ( ON ?auto_258801 ?auto_258800 ) ( ON ?auto_258802 ?auto_258801 ) ( ON ?auto_258803 ?auto_258802 ) ( ON ?auto_258804 ?auto_258803 ) ( ON ?auto_258805 ?auto_258804 ) ( ON ?auto_258806 ?auto_258805 ) ( ON ?auto_258807 ?auto_258806 ) ( ON ?auto_258808 ?auto_258807 ) ( not ( = ?auto_258800 ?auto_258801 ) ) ( not ( = ?auto_258800 ?auto_258802 ) ) ( not ( = ?auto_258800 ?auto_258803 ) ) ( not ( = ?auto_258800 ?auto_258804 ) ) ( not ( = ?auto_258800 ?auto_258805 ) ) ( not ( = ?auto_258800 ?auto_258806 ) ) ( not ( = ?auto_258800 ?auto_258807 ) ) ( not ( = ?auto_258800 ?auto_258808 ) ) ( not ( = ?auto_258800 ?auto_258809 ) ) ( not ( = ?auto_258800 ?auto_258810 ) ) ( not ( = ?auto_258801 ?auto_258802 ) ) ( not ( = ?auto_258801 ?auto_258803 ) ) ( not ( = ?auto_258801 ?auto_258804 ) ) ( not ( = ?auto_258801 ?auto_258805 ) ) ( not ( = ?auto_258801 ?auto_258806 ) ) ( not ( = ?auto_258801 ?auto_258807 ) ) ( not ( = ?auto_258801 ?auto_258808 ) ) ( not ( = ?auto_258801 ?auto_258809 ) ) ( not ( = ?auto_258801 ?auto_258810 ) ) ( not ( = ?auto_258802 ?auto_258803 ) ) ( not ( = ?auto_258802 ?auto_258804 ) ) ( not ( = ?auto_258802 ?auto_258805 ) ) ( not ( = ?auto_258802 ?auto_258806 ) ) ( not ( = ?auto_258802 ?auto_258807 ) ) ( not ( = ?auto_258802 ?auto_258808 ) ) ( not ( = ?auto_258802 ?auto_258809 ) ) ( not ( = ?auto_258802 ?auto_258810 ) ) ( not ( = ?auto_258803 ?auto_258804 ) ) ( not ( = ?auto_258803 ?auto_258805 ) ) ( not ( = ?auto_258803 ?auto_258806 ) ) ( not ( = ?auto_258803 ?auto_258807 ) ) ( not ( = ?auto_258803 ?auto_258808 ) ) ( not ( = ?auto_258803 ?auto_258809 ) ) ( not ( = ?auto_258803 ?auto_258810 ) ) ( not ( = ?auto_258804 ?auto_258805 ) ) ( not ( = ?auto_258804 ?auto_258806 ) ) ( not ( = ?auto_258804 ?auto_258807 ) ) ( not ( = ?auto_258804 ?auto_258808 ) ) ( not ( = ?auto_258804 ?auto_258809 ) ) ( not ( = ?auto_258804 ?auto_258810 ) ) ( not ( = ?auto_258805 ?auto_258806 ) ) ( not ( = ?auto_258805 ?auto_258807 ) ) ( not ( = ?auto_258805 ?auto_258808 ) ) ( not ( = ?auto_258805 ?auto_258809 ) ) ( not ( = ?auto_258805 ?auto_258810 ) ) ( not ( = ?auto_258806 ?auto_258807 ) ) ( not ( = ?auto_258806 ?auto_258808 ) ) ( not ( = ?auto_258806 ?auto_258809 ) ) ( not ( = ?auto_258806 ?auto_258810 ) ) ( not ( = ?auto_258807 ?auto_258808 ) ) ( not ( = ?auto_258807 ?auto_258809 ) ) ( not ( = ?auto_258807 ?auto_258810 ) ) ( not ( = ?auto_258808 ?auto_258809 ) ) ( not ( = ?auto_258808 ?auto_258810 ) ) ( not ( = ?auto_258809 ?auto_258810 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_258809 ?auto_258810 )
      ( !STACK ?auto_258809 ?auto_258808 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_258842 - BLOCK
      ?auto_258843 - BLOCK
      ?auto_258844 - BLOCK
      ?auto_258845 - BLOCK
      ?auto_258846 - BLOCK
      ?auto_258847 - BLOCK
      ?auto_258848 - BLOCK
      ?auto_258849 - BLOCK
      ?auto_258850 - BLOCK
      ?auto_258851 - BLOCK
    )
    :vars
    (
      ?auto_258852 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_258851 ?auto_258852 ) ( ON-TABLE ?auto_258842 ) ( ON ?auto_258843 ?auto_258842 ) ( ON ?auto_258844 ?auto_258843 ) ( ON ?auto_258845 ?auto_258844 ) ( ON ?auto_258846 ?auto_258845 ) ( ON ?auto_258847 ?auto_258846 ) ( ON ?auto_258848 ?auto_258847 ) ( ON ?auto_258849 ?auto_258848 ) ( not ( = ?auto_258842 ?auto_258843 ) ) ( not ( = ?auto_258842 ?auto_258844 ) ) ( not ( = ?auto_258842 ?auto_258845 ) ) ( not ( = ?auto_258842 ?auto_258846 ) ) ( not ( = ?auto_258842 ?auto_258847 ) ) ( not ( = ?auto_258842 ?auto_258848 ) ) ( not ( = ?auto_258842 ?auto_258849 ) ) ( not ( = ?auto_258842 ?auto_258850 ) ) ( not ( = ?auto_258842 ?auto_258851 ) ) ( not ( = ?auto_258842 ?auto_258852 ) ) ( not ( = ?auto_258843 ?auto_258844 ) ) ( not ( = ?auto_258843 ?auto_258845 ) ) ( not ( = ?auto_258843 ?auto_258846 ) ) ( not ( = ?auto_258843 ?auto_258847 ) ) ( not ( = ?auto_258843 ?auto_258848 ) ) ( not ( = ?auto_258843 ?auto_258849 ) ) ( not ( = ?auto_258843 ?auto_258850 ) ) ( not ( = ?auto_258843 ?auto_258851 ) ) ( not ( = ?auto_258843 ?auto_258852 ) ) ( not ( = ?auto_258844 ?auto_258845 ) ) ( not ( = ?auto_258844 ?auto_258846 ) ) ( not ( = ?auto_258844 ?auto_258847 ) ) ( not ( = ?auto_258844 ?auto_258848 ) ) ( not ( = ?auto_258844 ?auto_258849 ) ) ( not ( = ?auto_258844 ?auto_258850 ) ) ( not ( = ?auto_258844 ?auto_258851 ) ) ( not ( = ?auto_258844 ?auto_258852 ) ) ( not ( = ?auto_258845 ?auto_258846 ) ) ( not ( = ?auto_258845 ?auto_258847 ) ) ( not ( = ?auto_258845 ?auto_258848 ) ) ( not ( = ?auto_258845 ?auto_258849 ) ) ( not ( = ?auto_258845 ?auto_258850 ) ) ( not ( = ?auto_258845 ?auto_258851 ) ) ( not ( = ?auto_258845 ?auto_258852 ) ) ( not ( = ?auto_258846 ?auto_258847 ) ) ( not ( = ?auto_258846 ?auto_258848 ) ) ( not ( = ?auto_258846 ?auto_258849 ) ) ( not ( = ?auto_258846 ?auto_258850 ) ) ( not ( = ?auto_258846 ?auto_258851 ) ) ( not ( = ?auto_258846 ?auto_258852 ) ) ( not ( = ?auto_258847 ?auto_258848 ) ) ( not ( = ?auto_258847 ?auto_258849 ) ) ( not ( = ?auto_258847 ?auto_258850 ) ) ( not ( = ?auto_258847 ?auto_258851 ) ) ( not ( = ?auto_258847 ?auto_258852 ) ) ( not ( = ?auto_258848 ?auto_258849 ) ) ( not ( = ?auto_258848 ?auto_258850 ) ) ( not ( = ?auto_258848 ?auto_258851 ) ) ( not ( = ?auto_258848 ?auto_258852 ) ) ( not ( = ?auto_258849 ?auto_258850 ) ) ( not ( = ?auto_258849 ?auto_258851 ) ) ( not ( = ?auto_258849 ?auto_258852 ) ) ( not ( = ?auto_258850 ?auto_258851 ) ) ( not ( = ?auto_258850 ?auto_258852 ) ) ( not ( = ?auto_258851 ?auto_258852 ) ) ( CLEAR ?auto_258849 ) ( ON ?auto_258850 ?auto_258851 ) ( CLEAR ?auto_258850 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_258842 ?auto_258843 ?auto_258844 ?auto_258845 ?auto_258846 ?auto_258847 ?auto_258848 ?auto_258849 ?auto_258850 )
      ( MAKE-10PILE ?auto_258842 ?auto_258843 ?auto_258844 ?auto_258845 ?auto_258846 ?auto_258847 ?auto_258848 ?auto_258849 ?auto_258850 ?auto_258851 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_258884 - BLOCK
      ?auto_258885 - BLOCK
      ?auto_258886 - BLOCK
      ?auto_258887 - BLOCK
      ?auto_258888 - BLOCK
      ?auto_258889 - BLOCK
      ?auto_258890 - BLOCK
      ?auto_258891 - BLOCK
      ?auto_258892 - BLOCK
      ?auto_258893 - BLOCK
    )
    :vars
    (
      ?auto_258894 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_258893 ?auto_258894 ) ( ON-TABLE ?auto_258884 ) ( ON ?auto_258885 ?auto_258884 ) ( ON ?auto_258886 ?auto_258885 ) ( ON ?auto_258887 ?auto_258886 ) ( ON ?auto_258888 ?auto_258887 ) ( ON ?auto_258889 ?auto_258888 ) ( ON ?auto_258890 ?auto_258889 ) ( not ( = ?auto_258884 ?auto_258885 ) ) ( not ( = ?auto_258884 ?auto_258886 ) ) ( not ( = ?auto_258884 ?auto_258887 ) ) ( not ( = ?auto_258884 ?auto_258888 ) ) ( not ( = ?auto_258884 ?auto_258889 ) ) ( not ( = ?auto_258884 ?auto_258890 ) ) ( not ( = ?auto_258884 ?auto_258891 ) ) ( not ( = ?auto_258884 ?auto_258892 ) ) ( not ( = ?auto_258884 ?auto_258893 ) ) ( not ( = ?auto_258884 ?auto_258894 ) ) ( not ( = ?auto_258885 ?auto_258886 ) ) ( not ( = ?auto_258885 ?auto_258887 ) ) ( not ( = ?auto_258885 ?auto_258888 ) ) ( not ( = ?auto_258885 ?auto_258889 ) ) ( not ( = ?auto_258885 ?auto_258890 ) ) ( not ( = ?auto_258885 ?auto_258891 ) ) ( not ( = ?auto_258885 ?auto_258892 ) ) ( not ( = ?auto_258885 ?auto_258893 ) ) ( not ( = ?auto_258885 ?auto_258894 ) ) ( not ( = ?auto_258886 ?auto_258887 ) ) ( not ( = ?auto_258886 ?auto_258888 ) ) ( not ( = ?auto_258886 ?auto_258889 ) ) ( not ( = ?auto_258886 ?auto_258890 ) ) ( not ( = ?auto_258886 ?auto_258891 ) ) ( not ( = ?auto_258886 ?auto_258892 ) ) ( not ( = ?auto_258886 ?auto_258893 ) ) ( not ( = ?auto_258886 ?auto_258894 ) ) ( not ( = ?auto_258887 ?auto_258888 ) ) ( not ( = ?auto_258887 ?auto_258889 ) ) ( not ( = ?auto_258887 ?auto_258890 ) ) ( not ( = ?auto_258887 ?auto_258891 ) ) ( not ( = ?auto_258887 ?auto_258892 ) ) ( not ( = ?auto_258887 ?auto_258893 ) ) ( not ( = ?auto_258887 ?auto_258894 ) ) ( not ( = ?auto_258888 ?auto_258889 ) ) ( not ( = ?auto_258888 ?auto_258890 ) ) ( not ( = ?auto_258888 ?auto_258891 ) ) ( not ( = ?auto_258888 ?auto_258892 ) ) ( not ( = ?auto_258888 ?auto_258893 ) ) ( not ( = ?auto_258888 ?auto_258894 ) ) ( not ( = ?auto_258889 ?auto_258890 ) ) ( not ( = ?auto_258889 ?auto_258891 ) ) ( not ( = ?auto_258889 ?auto_258892 ) ) ( not ( = ?auto_258889 ?auto_258893 ) ) ( not ( = ?auto_258889 ?auto_258894 ) ) ( not ( = ?auto_258890 ?auto_258891 ) ) ( not ( = ?auto_258890 ?auto_258892 ) ) ( not ( = ?auto_258890 ?auto_258893 ) ) ( not ( = ?auto_258890 ?auto_258894 ) ) ( not ( = ?auto_258891 ?auto_258892 ) ) ( not ( = ?auto_258891 ?auto_258893 ) ) ( not ( = ?auto_258891 ?auto_258894 ) ) ( not ( = ?auto_258892 ?auto_258893 ) ) ( not ( = ?auto_258892 ?auto_258894 ) ) ( not ( = ?auto_258893 ?auto_258894 ) ) ( ON ?auto_258892 ?auto_258893 ) ( CLEAR ?auto_258890 ) ( ON ?auto_258891 ?auto_258892 ) ( CLEAR ?auto_258891 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_258884 ?auto_258885 ?auto_258886 ?auto_258887 ?auto_258888 ?auto_258889 ?auto_258890 ?auto_258891 )
      ( MAKE-10PILE ?auto_258884 ?auto_258885 ?auto_258886 ?auto_258887 ?auto_258888 ?auto_258889 ?auto_258890 ?auto_258891 ?auto_258892 ?auto_258893 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_258926 - BLOCK
      ?auto_258927 - BLOCK
      ?auto_258928 - BLOCK
      ?auto_258929 - BLOCK
      ?auto_258930 - BLOCK
      ?auto_258931 - BLOCK
      ?auto_258932 - BLOCK
      ?auto_258933 - BLOCK
      ?auto_258934 - BLOCK
      ?auto_258935 - BLOCK
    )
    :vars
    (
      ?auto_258936 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_258935 ?auto_258936 ) ( ON-TABLE ?auto_258926 ) ( ON ?auto_258927 ?auto_258926 ) ( ON ?auto_258928 ?auto_258927 ) ( ON ?auto_258929 ?auto_258928 ) ( ON ?auto_258930 ?auto_258929 ) ( ON ?auto_258931 ?auto_258930 ) ( not ( = ?auto_258926 ?auto_258927 ) ) ( not ( = ?auto_258926 ?auto_258928 ) ) ( not ( = ?auto_258926 ?auto_258929 ) ) ( not ( = ?auto_258926 ?auto_258930 ) ) ( not ( = ?auto_258926 ?auto_258931 ) ) ( not ( = ?auto_258926 ?auto_258932 ) ) ( not ( = ?auto_258926 ?auto_258933 ) ) ( not ( = ?auto_258926 ?auto_258934 ) ) ( not ( = ?auto_258926 ?auto_258935 ) ) ( not ( = ?auto_258926 ?auto_258936 ) ) ( not ( = ?auto_258927 ?auto_258928 ) ) ( not ( = ?auto_258927 ?auto_258929 ) ) ( not ( = ?auto_258927 ?auto_258930 ) ) ( not ( = ?auto_258927 ?auto_258931 ) ) ( not ( = ?auto_258927 ?auto_258932 ) ) ( not ( = ?auto_258927 ?auto_258933 ) ) ( not ( = ?auto_258927 ?auto_258934 ) ) ( not ( = ?auto_258927 ?auto_258935 ) ) ( not ( = ?auto_258927 ?auto_258936 ) ) ( not ( = ?auto_258928 ?auto_258929 ) ) ( not ( = ?auto_258928 ?auto_258930 ) ) ( not ( = ?auto_258928 ?auto_258931 ) ) ( not ( = ?auto_258928 ?auto_258932 ) ) ( not ( = ?auto_258928 ?auto_258933 ) ) ( not ( = ?auto_258928 ?auto_258934 ) ) ( not ( = ?auto_258928 ?auto_258935 ) ) ( not ( = ?auto_258928 ?auto_258936 ) ) ( not ( = ?auto_258929 ?auto_258930 ) ) ( not ( = ?auto_258929 ?auto_258931 ) ) ( not ( = ?auto_258929 ?auto_258932 ) ) ( not ( = ?auto_258929 ?auto_258933 ) ) ( not ( = ?auto_258929 ?auto_258934 ) ) ( not ( = ?auto_258929 ?auto_258935 ) ) ( not ( = ?auto_258929 ?auto_258936 ) ) ( not ( = ?auto_258930 ?auto_258931 ) ) ( not ( = ?auto_258930 ?auto_258932 ) ) ( not ( = ?auto_258930 ?auto_258933 ) ) ( not ( = ?auto_258930 ?auto_258934 ) ) ( not ( = ?auto_258930 ?auto_258935 ) ) ( not ( = ?auto_258930 ?auto_258936 ) ) ( not ( = ?auto_258931 ?auto_258932 ) ) ( not ( = ?auto_258931 ?auto_258933 ) ) ( not ( = ?auto_258931 ?auto_258934 ) ) ( not ( = ?auto_258931 ?auto_258935 ) ) ( not ( = ?auto_258931 ?auto_258936 ) ) ( not ( = ?auto_258932 ?auto_258933 ) ) ( not ( = ?auto_258932 ?auto_258934 ) ) ( not ( = ?auto_258932 ?auto_258935 ) ) ( not ( = ?auto_258932 ?auto_258936 ) ) ( not ( = ?auto_258933 ?auto_258934 ) ) ( not ( = ?auto_258933 ?auto_258935 ) ) ( not ( = ?auto_258933 ?auto_258936 ) ) ( not ( = ?auto_258934 ?auto_258935 ) ) ( not ( = ?auto_258934 ?auto_258936 ) ) ( not ( = ?auto_258935 ?auto_258936 ) ) ( ON ?auto_258934 ?auto_258935 ) ( ON ?auto_258933 ?auto_258934 ) ( CLEAR ?auto_258931 ) ( ON ?auto_258932 ?auto_258933 ) ( CLEAR ?auto_258932 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_258926 ?auto_258927 ?auto_258928 ?auto_258929 ?auto_258930 ?auto_258931 ?auto_258932 )
      ( MAKE-10PILE ?auto_258926 ?auto_258927 ?auto_258928 ?auto_258929 ?auto_258930 ?auto_258931 ?auto_258932 ?auto_258933 ?auto_258934 ?auto_258935 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_258968 - BLOCK
      ?auto_258969 - BLOCK
      ?auto_258970 - BLOCK
      ?auto_258971 - BLOCK
      ?auto_258972 - BLOCK
      ?auto_258973 - BLOCK
      ?auto_258974 - BLOCK
      ?auto_258975 - BLOCK
      ?auto_258976 - BLOCK
      ?auto_258977 - BLOCK
    )
    :vars
    (
      ?auto_258978 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_258977 ?auto_258978 ) ( ON-TABLE ?auto_258968 ) ( ON ?auto_258969 ?auto_258968 ) ( ON ?auto_258970 ?auto_258969 ) ( ON ?auto_258971 ?auto_258970 ) ( ON ?auto_258972 ?auto_258971 ) ( not ( = ?auto_258968 ?auto_258969 ) ) ( not ( = ?auto_258968 ?auto_258970 ) ) ( not ( = ?auto_258968 ?auto_258971 ) ) ( not ( = ?auto_258968 ?auto_258972 ) ) ( not ( = ?auto_258968 ?auto_258973 ) ) ( not ( = ?auto_258968 ?auto_258974 ) ) ( not ( = ?auto_258968 ?auto_258975 ) ) ( not ( = ?auto_258968 ?auto_258976 ) ) ( not ( = ?auto_258968 ?auto_258977 ) ) ( not ( = ?auto_258968 ?auto_258978 ) ) ( not ( = ?auto_258969 ?auto_258970 ) ) ( not ( = ?auto_258969 ?auto_258971 ) ) ( not ( = ?auto_258969 ?auto_258972 ) ) ( not ( = ?auto_258969 ?auto_258973 ) ) ( not ( = ?auto_258969 ?auto_258974 ) ) ( not ( = ?auto_258969 ?auto_258975 ) ) ( not ( = ?auto_258969 ?auto_258976 ) ) ( not ( = ?auto_258969 ?auto_258977 ) ) ( not ( = ?auto_258969 ?auto_258978 ) ) ( not ( = ?auto_258970 ?auto_258971 ) ) ( not ( = ?auto_258970 ?auto_258972 ) ) ( not ( = ?auto_258970 ?auto_258973 ) ) ( not ( = ?auto_258970 ?auto_258974 ) ) ( not ( = ?auto_258970 ?auto_258975 ) ) ( not ( = ?auto_258970 ?auto_258976 ) ) ( not ( = ?auto_258970 ?auto_258977 ) ) ( not ( = ?auto_258970 ?auto_258978 ) ) ( not ( = ?auto_258971 ?auto_258972 ) ) ( not ( = ?auto_258971 ?auto_258973 ) ) ( not ( = ?auto_258971 ?auto_258974 ) ) ( not ( = ?auto_258971 ?auto_258975 ) ) ( not ( = ?auto_258971 ?auto_258976 ) ) ( not ( = ?auto_258971 ?auto_258977 ) ) ( not ( = ?auto_258971 ?auto_258978 ) ) ( not ( = ?auto_258972 ?auto_258973 ) ) ( not ( = ?auto_258972 ?auto_258974 ) ) ( not ( = ?auto_258972 ?auto_258975 ) ) ( not ( = ?auto_258972 ?auto_258976 ) ) ( not ( = ?auto_258972 ?auto_258977 ) ) ( not ( = ?auto_258972 ?auto_258978 ) ) ( not ( = ?auto_258973 ?auto_258974 ) ) ( not ( = ?auto_258973 ?auto_258975 ) ) ( not ( = ?auto_258973 ?auto_258976 ) ) ( not ( = ?auto_258973 ?auto_258977 ) ) ( not ( = ?auto_258973 ?auto_258978 ) ) ( not ( = ?auto_258974 ?auto_258975 ) ) ( not ( = ?auto_258974 ?auto_258976 ) ) ( not ( = ?auto_258974 ?auto_258977 ) ) ( not ( = ?auto_258974 ?auto_258978 ) ) ( not ( = ?auto_258975 ?auto_258976 ) ) ( not ( = ?auto_258975 ?auto_258977 ) ) ( not ( = ?auto_258975 ?auto_258978 ) ) ( not ( = ?auto_258976 ?auto_258977 ) ) ( not ( = ?auto_258976 ?auto_258978 ) ) ( not ( = ?auto_258977 ?auto_258978 ) ) ( ON ?auto_258976 ?auto_258977 ) ( ON ?auto_258975 ?auto_258976 ) ( ON ?auto_258974 ?auto_258975 ) ( CLEAR ?auto_258972 ) ( ON ?auto_258973 ?auto_258974 ) ( CLEAR ?auto_258973 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_258968 ?auto_258969 ?auto_258970 ?auto_258971 ?auto_258972 ?auto_258973 )
      ( MAKE-10PILE ?auto_258968 ?auto_258969 ?auto_258970 ?auto_258971 ?auto_258972 ?auto_258973 ?auto_258974 ?auto_258975 ?auto_258976 ?auto_258977 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_259010 - BLOCK
      ?auto_259011 - BLOCK
      ?auto_259012 - BLOCK
      ?auto_259013 - BLOCK
      ?auto_259014 - BLOCK
      ?auto_259015 - BLOCK
      ?auto_259016 - BLOCK
      ?auto_259017 - BLOCK
      ?auto_259018 - BLOCK
      ?auto_259019 - BLOCK
    )
    :vars
    (
      ?auto_259020 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_259019 ?auto_259020 ) ( ON-TABLE ?auto_259010 ) ( ON ?auto_259011 ?auto_259010 ) ( ON ?auto_259012 ?auto_259011 ) ( ON ?auto_259013 ?auto_259012 ) ( not ( = ?auto_259010 ?auto_259011 ) ) ( not ( = ?auto_259010 ?auto_259012 ) ) ( not ( = ?auto_259010 ?auto_259013 ) ) ( not ( = ?auto_259010 ?auto_259014 ) ) ( not ( = ?auto_259010 ?auto_259015 ) ) ( not ( = ?auto_259010 ?auto_259016 ) ) ( not ( = ?auto_259010 ?auto_259017 ) ) ( not ( = ?auto_259010 ?auto_259018 ) ) ( not ( = ?auto_259010 ?auto_259019 ) ) ( not ( = ?auto_259010 ?auto_259020 ) ) ( not ( = ?auto_259011 ?auto_259012 ) ) ( not ( = ?auto_259011 ?auto_259013 ) ) ( not ( = ?auto_259011 ?auto_259014 ) ) ( not ( = ?auto_259011 ?auto_259015 ) ) ( not ( = ?auto_259011 ?auto_259016 ) ) ( not ( = ?auto_259011 ?auto_259017 ) ) ( not ( = ?auto_259011 ?auto_259018 ) ) ( not ( = ?auto_259011 ?auto_259019 ) ) ( not ( = ?auto_259011 ?auto_259020 ) ) ( not ( = ?auto_259012 ?auto_259013 ) ) ( not ( = ?auto_259012 ?auto_259014 ) ) ( not ( = ?auto_259012 ?auto_259015 ) ) ( not ( = ?auto_259012 ?auto_259016 ) ) ( not ( = ?auto_259012 ?auto_259017 ) ) ( not ( = ?auto_259012 ?auto_259018 ) ) ( not ( = ?auto_259012 ?auto_259019 ) ) ( not ( = ?auto_259012 ?auto_259020 ) ) ( not ( = ?auto_259013 ?auto_259014 ) ) ( not ( = ?auto_259013 ?auto_259015 ) ) ( not ( = ?auto_259013 ?auto_259016 ) ) ( not ( = ?auto_259013 ?auto_259017 ) ) ( not ( = ?auto_259013 ?auto_259018 ) ) ( not ( = ?auto_259013 ?auto_259019 ) ) ( not ( = ?auto_259013 ?auto_259020 ) ) ( not ( = ?auto_259014 ?auto_259015 ) ) ( not ( = ?auto_259014 ?auto_259016 ) ) ( not ( = ?auto_259014 ?auto_259017 ) ) ( not ( = ?auto_259014 ?auto_259018 ) ) ( not ( = ?auto_259014 ?auto_259019 ) ) ( not ( = ?auto_259014 ?auto_259020 ) ) ( not ( = ?auto_259015 ?auto_259016 ) ) ( not ( = ?auto_259015 ?auto_259017 ) ) ( not ( = ?auto_259015 ?auto_259018 ) ) ( not ( = ?auto_259015 ?auto_259019 ) ) ( not ( = ?auto_259015 ?auto_259020 ) ) ( not ( = ?auto_259016 ?auto_259017 ) ) ( not ( = ?auto_259016 ?auto_259018 ) ) ( not ( = ?auto_259016 ?auto_259019 ) ) ( not ( = ?auto_259016 ?auto_259020 ) ) ( not ( = ?auto_259017 ?auto_259018 ) ) ( not ( = ?auto_259017 ?auto_259019 ) ) ( not ( = ?auto_259017 ?auto_259020 ) ) ( not ( = ?auto_259018 ?auto_259019 ) ) ( not ( = ?auto_259018 ?auto_259020 ) ) ( not ( = ?auto_259019 ?auto_259020 ) ) ( ON ?auto_259018 ?auto_259019 ) ( ON ?auto_259017 ?auto_259018 ) ( ON ?auto_259016 ?auto_259017 ) ( ON ?auto_259015 ?auto_259016 ) ( CLEAR ?auto_259013 ) ( ON ?auto_259014 ?auto_259015 ) ( CLEAR ?auto_259014 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_259010 ?auto_259011 ?auto_259012 ?auto_259013 ?auto_259014 )
      ( MAKE-10PILE ?auto_259010 ?auto_259011 ?auto_259012 ?auto_259013 ?auto_259014 ?auto_259015 ?auto_259016 ?auto_259017 ?auto_259018 ?auto_259019 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_259052 - BLOCK
      ?auto_259053 - BLOCK
      ?auto_259054 - BLOCK
      ?auto_259055 - BLOCK
      ?auto_259056 - BLOCK
      ?auto_259057 - BLOCK
      ?auto_259058 - BLOCK
      ?auto_259059 - BLOCK
      ?auto_259060 - BLOCK
      ?auto_259061 - BLOCK
    )
    :vars
    (
      ?auto_259062 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_259061 ?auto_259062 ) ( ON-TABLE ?auto_259052 ) ( ON ?auto_259053 ?auto_259052 ) ( ON ?auto_259054 ?auto_259053 ) ( not ( = ?auto_259052 ?auto_259053 ) ) ( not ( = ?auto_259052 ?auto_259054 ) ) ( not ( = ?auto_259052 ?auto_259055 ) ) ( not ( = ?auto_259052 ?auto_259056 ) ) ( not ( = ?auto_259052 ?auto_259057 ) ) ( not ( = ?auto_259052 ?auto_259058 ) ) ( not ( = ?auto_259052 ?auto_259059 ) ) ( not ( = ?auto_259052 ?auto_259060 ) ) ( not ( = ?auto_259052 ?auto_259061 ) ) ( not ( = ?auto_259052 ?auto_259062 ) ) ( not ( = ?auto_259053 ?auto_259054 ) ) ( not ( = ?auto_259053 ?auto_259055 ) ) ( not ( = ?auto_259053 ?auto_259056 ) ) ( not ( = ?auto_259053 ?auto_259057 ) ) ( not ( = ?auto_259053 ?auto_259058 ) ) ( not ( = ?auto_259053 ?auto_259059 ) ) ( not ( = ?auto_259053 ?auto_259060 ) ) ( not ( = ?auto_259053 ?auto_259061 ) ) ( not ( = ?auto_259053 ?auto_259062 ) ) ( not ( = ?auto_259054 ?auto_259055 ) ) ( not ( = ?auto_259054 ?auto_259056 ) ) ( not ( = ?auto_259054 ?auto_259057 ) ) ( not ( = ?auto_259054 ?auto_259058 ) ) ( not ( = ?auto_259054 ?auto_259059 ) ) ( not ( = ?auto_259054 ?auto_259060 ) ) ( not ( = ?auto_259054 ?auto_259061 ) ) ( not ( = ?auto_259054 ?auto_259062 ) ) ( not ( = ?auto_259055 ?auto_259056 ) ) ( not ( = ?auto_259055 ?auto_259057 ) ) ( not ( = ?auto_259055 ?auto_259058 ) ) ( not ( = ?auto_259055 ?auto_259059 ) ) ( not ( = ?auto_259055 ?auto_259060 ) ) ( not ( = ?auto_259055 ?auto_259061 ) ) ( not ( = ?auto_259055 ?auto_259062 ) ) ( not ( = ?auto_259056 ?auto_259057 ) ) ( not ( = ?auto_259056 ?auto_259058 ) ) ( not ( = ?auto_259056 ?auto_259059 ) ) ( not ( = ?auto_259056 ?auto_259060 ) ) ( not ( = ?auto_259056 ?auto_259061 ) ) ( not ( = ?auto_259056 ?auto_259062 ) ) ( not ( = ?auto_259057 ?auto_259058 ) ) ( not ( = ?auto_259057 ?auto_259059 ) ) ( not ( = ?auto_259057 ?auto_259060 ) ) ( not ( = ?auto_259057 ?auto_259061 ) ) ( not ( = ?auto_259057 ?auto_259062 ) ) ( not ( = ?auto_259058 ?auto_259059 ) ) ( not ( = ?auto_259058 ?auto_259060 ) ) ( not ( = ?auto_259058 ?auto_259061 ) ) ( not ( = ?auto_259058 ?auto_259062 ) ) ( not ( = ?auto_259059 ?auto_259060 ) ) ( not ( = ?auto_259059 ?auto_259061 ) ) ( not ( = ?auto_259059 ?auto_259062 ) ) ( not ( = ?auto_259060 ?auto_259061 ) ) ( not ( = ?auto_259060 ?auto_259062 ) ) ( not ( = ?auto_259061 ?auto_259062 ) ) ( ON ?auto_259060 ?auto_259061 ) ( ON ?auto_259059 ?auto_259060 ) ( ON ?auto_259058 ?auto_259059 ) ( ON ?auto_259057 ?auto_259058 ) ( ON ?auto_259056 ?auto_259057 ) ( CLEAR ?auto_259054 ) ( ON ?auto_259055 ?auto_259056 ) ( CLEAR ?auto_259055 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_259052 ?auto_259053 ?auto_259054 ?auto_259055 )
      ( MAKE-10PILE ?auto_259052 ?auto_259053 ?auto_259054 ?auto_259055 ?auto_259056 ?auto_259057 ?auto_259058 ?auto_259059 ?auto_259060 ?auto_259061 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_259094 - BLOCK
      ?auto_259095 - BLOCK
      ?auto_259096 - BLOCK
      ?auto_259097 - BLOCK
      ?auto_259098 - BLOCK
      ?auto_259099 - BLOCK
      ?auto_259100 - BLOCK
      ?auto_259101 - BLOCK
      ?auto_259102 - BLOCK
      ?auto_259103 - BLOCK
    )
    :vars
    (
      ?auto_259104 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_259103 ?auto_259104 ) ( ON-TABLE ?auto_259094 ) ( ON ?auto_259095 ?auto_259094 ) ( not ( = ?auto_259094 ?auto_259095 ) ) ( not ( = ?auto_259094 ?auto_259096 ) ) ( not ( = ?auto_259094 ?auto_259097 ) ) ( not ( = ?auto_259094 ?auto_259098 ) ) ( not ( = ?auto_259094 ?auto_259099 ) ) ( not ( = ?auto_259094 ?auto_259100 ) ) ( not ( = ?auto_259094 ?auto_259101 ) ) ( not ( = ?auto_259094 ?auto_259102 ) ) ( not ( = ?auto_259094 ?auto_259103 ) ) ( not ( = ?auto_259094 ?auto_259104 ) ) ( not ( = ?auto_259095 ?auto_259096 ) ) ( not ( = ?auto_259095 ?auto_259097 ) ) ( not ( = ?auto_259095 ?auto_259098 ) ) ( not ( = ?auto_259095 ?auto_259099 ) ) ( not ( = ?auto_259095 ?auto_259100 ) ) ( not ( = ?auto_259095 ?auto_259101 ) ) ( not ( = ?auto_259095 ?auto_259102 ) ) ( not ( = ?auto_259095 ?auto_259103 ) ) ( not ( = ?auto_259095 ?auto_259104 ) ) ( not ( = ?auto_259096 ?auto_259097 ) ) ( not ( = ?auto_259096 ?auto_259098 ) ) ( not ( = ?auto_259096 ?auto_259099 ) ) ( not ( = ?auto_259096 ?auto_259100 ) ) ( not ( = ?auto_259096 ?auto_259101 ) ) ( not ( = ?auto_259096 ?auto_259102 ) ) ( not ( = ?auto_259096 ?auto_259103 ) ) ( not ( = ?auto_259096 ?auto_259104 ) ) ( not ( = ?auto_259097 ?auto_259098 ) ) ( not ( = ?auto_259097 ?auto_259099 ) ) ( not ( = ?auto_259097 ?auto_259100 ) ) ( not ( = ?auto_259097 ?auto_259101 ) ) ( not ( = ?auto_259097 ?auto_259102 ) ) ( not ( = ?auto_259097 ?auto_259103 ) ) ( not ( = ?auto_259097 ?auto_259104 ) ) ( not ( = ?auto_259098 ?auto_259099 ) ) ( not ( = ?auto_259098 ?auto_259100 ) ) ( not ( = ?auto_259098 ?auto_259101 ) ) ( not ( = ?auto_259098 ?auto_259102 ) ) ( not ( = ?auto_259098 ?auto_259103 ) ) ( not ( = ?auto_259098 ?auto_259104 ) ) ( not ( = ?auto_259099 ?auto_259100 ) ) ( not ( = ?auto_259099 ?auto_259101 ) ) ( not ( = ?auto_259099 ?auto_259102 ) ) ( not ( = ?auto_259099 ?auto_259103 ) ) ( not ( = ?auto_259099 ?auto_259104 ) ) ( not ( = ?auto_259100 ?auto_259101 ) ) ( not ( = ?auto_259100 ?auto_259102 ) ) ( not ( = ?auto_259100 ?auto_259103 ) ) ( not ( = ?auto_259100 ?auto_259104 ) ) ( not ( = ?auto_259101 ?auto_259102 ) ) ( not ( = ?auto_259101 ?auto_259103 ) ) ( not ( = ?auto_259101 ?auto_259104 ) ) ( not ( = ?auto_259102 ?auto_259103 ) ) ( not ( = ?auto_259102 ?auto_259104 ) ) ( not ( = ?auto_259103 ?auto_259104 ) ) ( ON ?auto_259102 ?auto_259103 ) ( ON ?auto_259101 ?auto_259102 ) ( ON ?auto_259100 ?auto_259101 ) ( ON ?auto_259099 ?auto_259100 ) ( ON ?auto_259098 ?auto_259099 ) ( ON ?auto_259097 ?auto_259098 ) ( CLEAR ?auto_259095 ) ( ON ?auto_259096 ?auto_259097 ) ( CLEAR ?auto_259096 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_259094 ?auto_259095 ?auto_259096 )
      ( MAKE-10PILE ?auto_259094 ?auto_259095 ?auto_259096 ?auto_259097 ?auto_259098 ?auto_259099 ?auto_259100 ?auto_259101 ?auto_259102 ?auto_259103 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_259136 - BLOCK
      ?auto_259137 - BLOCK
      ?auto_259138 - BLOCK
      ?auto_259139 - BLOCK
      ?auto_259140 - BLOCK
      ?auto_259141 - BLOCK
      ?auto_259142 - BLOCK
      ?auto_259143 - BLOCK
      ?auto_259144 - BLOCK
      ?auto_259145 - BLOCK
    )
    :vars
    (
      ?auto_259146 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_259145 ?auto_259146 ) ( ON-TABLE ?auto_259136 ) ( not ( = ?auto_259136 ?auto_259137 ) ) ( not ( = ?auto_259136 ?auto_259138 ) ) ( not ( = ?auto_259136 ?auto_259139 ) ) ( not ( = ?auto_259136 ?auto_259140 ) ) ( not ( = ?auto_259136 ?auto_259141 ) ) ( not ( = ?auto_259136 ?auto_259142 ) ) ( not ( = ?auto_259136 ?auto_259143 ) ) ( not ( = ?auto_259136 ?auto_259144 ) ) ( not ( = ?auto_259136 ?auto_259145 ) ) ( not ( = ?auto_259136 ?auto_259146 ) ) ( not ( = ?auto_259137 ?auto_259138 ) ) ( not ( = ?auto_259137 ?auto_259139 ) ) ( not ( = ?auto_259137 ?auto_259140 ) ) ( not ( = ?auto_259137 ?auto_259141 ) ) ( not ( = ?auto_259137 ?auto_259142 ) ) ( not ( = ?auto_259137 ?auto_259143 ) ) ( not ( = ?auto_259137 ?auto_259144 ) ) ( not ( = ?auto_259137 ?auto_259145 ) ) ( not ( = ?auto_259137 ?auto_259146 ) ) ( not ( = ?auto_259138 ?auto_259139 ) ) ( not ( = ?auto_259138 ?auto_259140 ) ) ( not ( = ?auto_259138 ?auto_259141 ) ) ( not ( = ?auto_259138 ?auto_259142 ) ) ( not ( = ?auto_259138 ?auto_259143 ) ) ( not ( = ?auto_259138 ?auto_259144 ) ) ( not ( = ?auto_259138 ?auto_259145 ) ) ( not ( = ?auto_259138 ?auto_259146 ) ) ( not ( = ?auto_259139 ?auto_259140 ) ) ( not ( = ?auto_259139 ?auto_259141 ) ) ( not ( = ?auto_259139 ?auto_259142 ) ) ( not ( = ?auto_259139 ?auto_259143 ) ) ( not ( = ?auto_259139 ?auto_259144 ) ) ( not ( = ?auto_259139 ?auto_259145 ) ) ( not ( = ?auto_259139 ?auto_259146 ) ) ( not ( = ?auto_259140 ?auto_259141 ) ) ( not ( = ?auto_259140 ?auto_259142 ) ) ( not ( = ?auto_259140 ?auto_259143 ) ) ( not ( = ?auto_259140 ?auto_259144 ) ) ( not ( = ?auto_259140 ?auto_259145 ) ) ( not ( = ?auto_259140 ?auto_259146 ) ) ( not ( = ?auto_259141 ?auto_259142 ) ) ( not ( = ?auto_259141 ?auto_259143 ) ) ( not ( = ?auto_259141 ?auto_259144 ) ) ( not ( = ?auto_259141 ?auto_259145 ) ) ( not ( = ?auto_259141 ?auto_259146 ) ) ( not ( = ?auto_259142 ?auto_259143 ) ) ( not ( = ?auto_259142 ?auto_259144 ) ) ( not ( = ?auto_259142 ?auto_259145 ) ) ( not ( = ?auto_259142 ?auto_259146 ) ) ( not ( = ?auto_259143 ?auto_259144 ) ) ( not ( = ?auto_259143 ?auto_259145 ) ) ( not ( = ?auto_259143 ?auto_259146 ) ) ( not ( = ?auto_259144 ?auto_259145 ) ) ( not ( = ?auto_259144 ?auto_259146 ) ) ( not ( = ?auto_259145 ?auto_259146 ) ) ( ON ?auto_259144 ?auto_259145 ) ( ON ?auto_259143 ?auto_259144 ) ( ON ?auto_259142 ?auto_259143 ) ( ON ?auto_259141 ?auto_259142 ) ( ON ?auto_259140 ?auto_259141 ) ( ON ?auto_259139 ?auto_259140 ) ( ON ?auto_259138 ?auto_259139 ) ( CLEAR ?auto_259136 ) ( ON ?auto_259137 ?auto_259138 ) ( CLEAR ?auto_259137 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_259136 ?auto_259137 )
      ( MAKE-10PILE ?auto_259136 ?auto_259137 ?auto_259138 ?auto_259139 ?auto_259140 ?auto_259141 ?auto_259142 ?auto_259143 ?auto_259144 ?auto_259145 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_259178 - BLOCK
      ?auto_259179 - BLOCK
      ?auto_259180 - BLOCK
      ?auto_259181 - BLOCK
      ?auto_259182 - BLOCK
      ?auto_259183 - BLOCK
      ?auto_259184 - BLOCK
      ?auto_259185 - BLOCK
      ?auto_259186 - BLOCK
      ?auto_259187 - BLOCK
    )
    :vars
    (
      ?auto_259188 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_259187 ?auto_259188 ) ( not ( = ?auto_259178 ?auto_259179 ) ) ( not ( = ?auto_259178 ?auto_259180 ) ) ( not ( = ?auto_259178 ?auto_259181 ) ) ( not ( = ?auto_259178 ?auto_259182 ) ) ( not ( = ?auto_259178 ?auto_259183 ) ) ( not ( = ?auto_259178 ?auto_259184 ) ) ( not ( = ?auto_259178 ?auto_259185 ) ) ( not ( = ?auto_259178 ?auto_259186 ) ) ( not ( = ?auto_259178 ?auto_259187 ) ) ( not ( = ?auto_259178 ?auto_259188 ) ) ( not ( = ?auto_259179 ?auto_259180 ) ) ( not ( = ?auto_259179 ?auto_259181 ) ) ( not ( = ?auto_259179 ?auto_259182 ) ) ( not ( = ?auto_259179 ?auto_259183 ) ) ( not ( = ?auto_259179 ?auto_259184 ) ) ( not ( = ?auto_259179 ?auto_259185 ) ) ( not ( = ?auto_259179 ?auto_259186 ) ) ( not ( = ?auto_259179 ?auto_259187 ) ) ( not ( = ?auto_259179 ?auto_259188 ) ) ( not ( = ?auto_259180 ?auto_259181 ) ) ( not ( = ?auto_259180 ?auto_259182 ) ) ( not ( = ?auto_259180 ?auto_259183 ) ) ( not ( = ?auto_259180 ?auto_259184 ) ) ( not ( = ?auto_259180 ?auto_259185 ) ) ( not ( = ?auto_259180 ?auto_259186 ) ) ( not ( = ?auto_259180 ?auto_259187 ) ) ( not ( = ?auto_259180 ?auto_259188 ) ) ( not ( = ?auto_259181 ?auto_259182 ) ) ( not ( = ?auto_259181 ?auto_259183 ) ) ( not ( = ?auto_259181 ?auto_259184 ) ) ( not ( = ?auto_259181 ?auto_259185 ) ) ( not ( = ?auto_259181 ?auto_259186 ) ) ( not ( = ?auto_259181 ?auto_259187 ) ) ( not ( = ?auto_259181 ?auto_259188 ) ) ( not ( = ?auto_259182 ?auto_259183 ) ) ( not ( = ?auto_259182 ?auto_259184 ) ) ( not ( = ?auto_259182 ?auto_259185 ) ) ( not ( = ?auto_259182 ?auto_259186 ) ) ( not ( = ?auto_259182 ?auto_259187 ) ) ( not ( = ?auto_259182 ?auto_259188 ) ) ( not ( = ?auto_259183 ?auto_259184 ) ) ( not ( = ?auto_259183 ?auto_259185 ) ) ( not ( = ?auto_259183 ?auto_259186 ) ) ( not ( = ?auto_259183 ?auto_259187 ) ) ( not ( = ?auto_259183 ?auto_259188 ) ) ( not ( = ?auto_259184 ?auto_259185 ) ) ( not ( = ?auto_259184 ?auto_259186 ) ) ( not ( = ?auto_259184 ?auto_259187 ) ) ( not ( = ?auto_259184 ?auto_259188 ) ) ( not ( = ?auto_259185 ?auto_259186 ) ) ( not ( = ?auto_259185 ?auto_259187 ) ) ( not ( = ?auto_259185 ?auto_259188 ) ) ( not ( = ?auto_259186 ?auto_259187 ) ) ( not ( = ?auto_259186 ?auto_259188 ) ) ( not ( = ?auto_259187 ?auto_259188 ) ) ( ON ?auto_259186 ?auto_259187 ) ( ON ?auto_259185 ?auto_259186 ) ( ON ?auto_259184 ?auto_259185 ) ( ON ?auto_259183 ?auto_259184 ) ( ON ?auto_259182 ?auto_259183 ) ( ON ?auto_259181 ?auto_259182 ) ( ON ?auto_259180 ?auto_259181 ) ( ON ?auto_259179 ?auto_259180 ) ( ON ?auto_259178 ?auto_259179 ) ( CLEAR ?auto_259178 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_259178 )
      ( MAKE-10PILE ?auto_259178 ?auto_259179 ?auto_259180 ?auto_259181 ?auto_259182 ?auto_259183 ?auto_259184 ?auto_259185 ?auto_259186 ?auto_259187 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_259221 - BLOCK
      ?auto_259222 - BLOCK
      ?auto_259223 - BLOCK
      ?auto_259224 - BLOCK
      ?auto_259225 - BLOCK
      ?auto_259226 - BLOCK
      ?auto_259227 - BLOCK
      ?auto_259228 - BLOCK
      ?auto_259229 - BLOCK
      ?auto_259230 - BLOCK
      ?auto_259231 - BLOCK
    )
    :vars
    (
      ?auto_259232 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_259230 ) ( ON ?auto_259231 ?auto_259232 ) ( CLEAR ?auto_259231 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_259221 ) ( ON ?auto_259222 ?auto_259221 ) ( ON ?auto_259223 ?auto_259222 ) ( ON ?auto_259224 ?auto_259223 ) ( ON ?auto_259225 ?auto_259224 ) ( ON ?auto_259226 ?auto_259225 ) ( ON ?auto_259227 ?auto_259226 ) ( ON ?auto_259228 ?auto_259227 ) ( ON ?auto_259229 ?auto_259228 ) ( ON ?auto_259230 ?auto_259229 ) ( not ( = ?auto_259221 ?auto_259222 ) ) ( not ( = ?auto_259221 ?auto_259223 ) ) ( not ( = ?auto_259221 ?auto_259224 ) ) ( not ( = ?auto_259221 ?auto_259225 ) ) ( not ( = ?auto_259221 ?auto_259226 ) ) ( not ( = ?auto_259221 ?auto_259227 ) ) ( not ( = ?auto_259221 ?auto_259228 ) ) ( not ( = ?auto_259221 ?auto_259229 ) ) ( not ( = ?auto_259221 ?auto_259230 ) ) ( not ( = ?auto_259221 ?auto_259231 ) ) ( not ( = ?auto_259221 ?auto_259232 ) ) ( not ( = ?auto_259222 ?auto_259223 ) ) ( not ( = ?auto_259222 ?auto_259224 ) ) ( not ( = ?auto_259222 ?auto_259225 ) ) ( not ( = ?auto_259222 ?auto_259226 ) ) ( not ( = ?auto_259222 ?auto_259227 ) ) ( not ( = ?auto_259222 ?auto_259228 ) ) ( not ( = ?auto_259222 ?auto_259229 ) ) ( not ( = ?auto_259222 ?auto_259230 ) ) ( not ( = ?auto_259222 ?auto_259231 ) ) ( not ( = ?auto_259222 ?auto_259232 ) ) ( not ( = ?auto_259223 ?auto_259224 ) ) ( not ( = ?auto_259223 ?auto_259225 ) ) ( not ( = ?auto_259223 ?auto_259226 ) ) ( not ( = ?auto_259223 ?auto_259227 ) ) ( not ( = ?auto_259223 ?auto_259228 ) ) ( not ( = ?auto_259223 ?auto_259229 ) ) ( not ( = ?auto_259223 ?auto_259230 ) ) ( not ( = ?auto_259223 ?auto_259231 ) ) ( not ( = ?auto_259223 ?auto_259232 ) ) ( not ( = ?auto_259224 ?auto_259225 ) ) ( not ( = ?auto_259224 ?auto_259226 ) ) ( not ( = ?auto_259224 ?auto_259227 ) ) ( not ( = ?auto_259224 ?auto_259228 ) ) ( not ( = ?auto_259224 ?auto_259229 ) ) ( not ( = ?auto_259224 ?auto_259230 ) ) ( not ( = ?auto_259224 ?auto_259231 ) ) ( not ( = ?auto_259224 ?auto_259232 ) ) ( not ( = ?auto_259225 ?auto_259226 ) ) ( not ( = ?auto_259225 ?auto_259227 ) ) ( not ( = ?auto_259225 ?auto_259228 ) ) ( not ( = ?auto_259225 ?auto_259229 ) ) ( not ( = ?auto_259225 ?auto_259230 ) ) ( not ( = ?auto_259225 ?auto_259231 ) ) ( not ( = ?auto_259225 ?auto_259232 ) ) ( not ( = ?auto_259226 ?auto_259227 ) ) ( not ( = ?auto_259226 ?auto_259228 ) ) ( not ( = ?auto_259226 ?auto_259229 ) ) ( not ( = ?auto_259226 ?auto_259230 ) ) ( not ( = ?auto_259226 ?auto_259231 ) ) ( not ( = ?auto_259226 ?auto_259232 ) ) ( not ( = ?auto_259227 ?auto_259228 ) ) ( not ( = ?auto_259227 ?auto_259229 ) ) ( not ( = ?auto_259227 ?auto_259230 ) ) ( not ( = ?auto_259227 ?auto_259231 ) ) ( not ( = ?auto_259227 ?auto_259232 ) ) ( not ( = ?auto_259228 ?auto_259229 ) ) ( not ( = ?auto_259228 ?auto_259230 ) ) ( not ( = ?auto_259228 ?auto_259231 ) ) ( not ( = ?auto_259228 ?auto_259232 ) ) ( not ( = ?auto_259229 ?auto_259230 ) ) ( not ( = ?auto_259229 ?auto_259231 ) ) ( not ( = ?auto_259229 ?auto_259232 ) ) ( not ( = ?auto_259230 ?auto_259231 ) ) ( not ( = ?auto_259230 ?auto_259232 ) ) ( not ( = ?auto_259231 ?auto_259232 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_259231 ?auto_259232 )
      ( !STACK ?auto_259231 ?auto_259230 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_259267 - BLOCK
      ?auto_259268 - BLOCK
      ?auto_259269 - BLOCK
      ?auto_259270 - BLOCK
      ?auto_259271 - BLOCK
      ?auto_259272 - BLOCK
      ?auto_259273 - BLOCK
      ?auto_259274 - BLOCK
      ?auto_259275 - BLOCK
      ?auto_259276 - BLOCK
      ?auto_259277 - BLOCK
    )
    :vars
    (
      ?auto_259278 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_259277 ?auto_259278 ) ( ON-TABLE ?auto_259267 ) ( ON ?auto_259268 ?auto_259267 ) ( ON ?auto_259269 ?auto_259268 ) ( ON ?auto_259270 ?auto_259269 ) ( ON ?auto_259271 ?auto_259270 ) ( ON ?auto_259272 ?auto_259271 ) ( ON ?auto_259273 ?auto_259272 ) ( ON ?auto_259274 ?auto_259273 ) ( ON ?auto_259275 ?auto_259274 ) ( not ( = ?auto_259267 ?auto_259268 ) ) ( not ( = ?auto_259267 ?auto_259269 ) ) ( not ( = ?auto_259267 ?auto_259270 ) ) ( not ( = ?auto_259267 ?auto_259271 ) ) ( not ( = ?auto_259267 ?auto_259272 ) ) ( not ( = ?auto_259267 ?auto_259273 ) ) ( not ( = ?auto_259267 ?auto_259274 ) ) ( not ( = ?auto_259267 ?auto_259275 ) ) ( not ( = ?auto_259267 ?auto_259276 ) ) ( not ( = ?auto_259267 ?auto_259277 ) ) ( not ( = ?auto_259267 ?auto_259278 ) ) ( not ( = ?auto_259268 ?auto_259269 ) ) ( not ( = ?auto_259268 ?auto_259270 ) ) ( not ( = ?auto_259268 ?auto_259271 ) ) ( not ( = ?auto_259268 ?auto_259272 ) ) ( not ( = ?auto_259268 ?auto_259273 ) ) ( not ( = ?auto_259268 ?auto_259274 ) ) ( not ( = ?auto_259268 ?auto_259275 ) ) ( not ( = ?auto_259268 ?auto_259276 ) ) ( not ( = ?auto_259268 ?auto_259277 ) ) ( not ( = ?auto_259268 ?auto_259278 ) ) ( not ( = ?auto_259269 ?auto_259270 ) ) ( not ( = ?auto_259269 ?auto_259271 ) ) ( not ( = ?auto_259269 ?auto_259272 ) ) ( not ( = ?auto_259269 ?auto_259273 ) ) ( not ( = ?auto_259269 ?auto_259274 ) ) ( not ( = ?auto_259269 ?auto_259275 ) ) ( not ( = ?auto_259269 ?auto_259276 ) ) ( not ( = ?auto_259269 ?auto_259277 ) ) ( not ( = ?auto_259269 ?auto_259278 ) ) ( not ( = ?auto_259270 ?auto_259271 ) ) ( not ( = ?auto_259270 ?auto_259272 ) ) ( not ( = ?auto_259270 ?auto_259273 ) ) ( not ( = ?auto_259270 ?auto_259274 ) ) ( not ( = ?auto_259270 ?auto_259275 ) ) ( not ( = ?auto_259270 ?auto_259276 ) ) ( not ( = ?auto_259270 ?auto_259277 ) ) ( not ( = ?auto_259270 ?auto_259278 ) ) ( not ( = ?auto_259271 ?auto_259272 ) ) ( not ( = ?auto_259271 ?auto_259273 ) ) ( not ( = ?auto_259271 ?auto_259274 ) ) ( not ( = ?auto_259271 ?auto_259275 ) ) ( not ( = ?auto_259271 ?auto_259276 ) ) ( not ( = ?auto_259271 ?auto_259277 ) ) ( not ( = ?auto_259271 ?auto_259278 ) ) ( not ( = ?auto_259272 ?auto_259273 ) ) ( not ( = ?auto_259272 ?auto_259274 ) ) ( not ( = ?auto_259272 ?auto_259275 ) ) ( not ( = ?auto_259272 ?auto_259276 ) ) ( not ( = ?auto_259272 ?auto_259277 ) ) ( not ( = ?auto_259272 ?auto_259278 ) ) ( not ( = ?auto_259273 ?auto_259274 ) ) ( not ( = ?auto_259273 ?auto_259275 ) ) ( not ( = ?auto_259273 ?auto_259276 ) ) ( not ( = ?auto_259273 ?auto_259277 ) ) ( not ( = ?auto_259273 ?auto_259278 ) ) ( not ( = ?auto_259274 ?auto_259275 ) ) ( not ( = ?auto_259274 ?auto_259276 ) ) ( not ( = ?auto_259274 ?auto_259277 ) ) ( not ( = ?auto_259274 ?auto_259278 ) ) ( not ( = ?auto_259275 ?auto_259276 ) ) ( not ( = ?auto_259275 ?auto_259277 ) ) ( not ( = ?auto_259275 ?auto_259278 ) ) ( not ( = ?auto_259276 ?auto_259277 ) ) ( not ( = ?auto_259276 ?auto_259278 ) ) ( not ( = ?auto_259277 ?auto_259278 ) ) ( CLEAR ?auto_259275 ) ( ON ?auto_259276 ?auto_259277 ) ( CLEAR ?auto_259276 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_259267 ?auto_259268 ?auto_259269 ?auto_259270 ?auto_259271 ?auto_259272 ?auto_259273 ?auto_259274 ?auto_259275 ?auto_259276 )
      ( MAKE-11PILE ?auto_259267 ?auto_259268 ?auto_259269 ?auto_259270 ?auto_259271 ?auto_259272 ?auto_259273 ?auto_259274 ?auto_259275 ?auto_259276 ?auto_259277 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_259313 - BLOCK
      ?auto_259314 - BLOCK
      ?auto_259315 - BLOCK
      ?auto_259316 - BLOCK
      ?auto_259317 - BLOCK
      ?auto_259318 - BLOCK
      ?auto_259319 - BLOCK
      ?auto_259320 - BLOCK
      ?auto_259321 - BLOCK
      ?auto_259322 - BLOCK
      ?auto_259323 - BLOCK
    )
    :vars
    (
      ?auto_259324 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_259323 ?auto_259324 ) ( ON-TABLE ?auto_259313 ) ( ON ?auto_259314 ?auto_259313 ) ( ON ?auto_259315 ?auto_259314 ) ( ON ?auto_259316 ?auto_259315 ) ( ON ?auto_259317 ?auto_259316 ) ( ON ?auto_259318 ?auto_259317 ) ( ON ?auto_259319 ?auto_259318 ) ( ON ?auto_259320 ?auto_259319 ) ( not ( = ?auto_259313 ?auto_259314 ) ) ( not ( = ?auto_259313 ?auto_259315 ) ) ( not ( = ?auto_259313 ?auto_259316 ) ) ( not ( = ?auto_259313 ?auto_259317 ) ) ( not ( = ?auto_259313 ?auto_259318 ) ) ( not ( = ?auto_259313 ?auto_259319 ) ) ( not ( = ?auto_259313 ?auto_259320 ) ) ( not ( = ?auto_259313 ?auto_259321 ) ) ( not ( = ?auto_259313 ?auto_259322 ) ) ( not ( = ?auto_259313 ?auto_259323 ) ) ( not ( = ?auto_259313 ?auto_259324 ) ) ( not ( = ?auto_259314 ?auto_259315 ) ) ( not ( = ?auto_259314 ?auto_259316 ) ) ( not ( = ?auto_259314 ?auto_259317 ) ) ( not ( = ?auto_259314 ?auto_259318 ) ) ( not ( = ?auto_259314 ?auto_259319 ) ) ( not ( = ?auto_259314 ?auto_259320 ) ) ( not ( = ?auto_259314 ?auto_259321 ) ) ( not ( = ?auto_259314 ?auto_259322 ) ) ( not ( = ?auto_259314 ?auto_259323 ) ) ( not ( = ?auto_259314 ?auto_259324 ) ) ( not ( = ?auto_259315 ?auto_259316 ) ) ( not ( = ?auto_259315 ?auto_259317 ) ) ( not ( = ?auto_259315 ?auto_259318 ) ) ( not ( = ?auto_259315 ?auto_259319 ) ) ( not ( = ?auto_259315 ?auto_259320 ) ) ( not ( = ?auto_259315 ?auto_259321 ) ) ( not ( = ?auto_259315 ?auto_259322 ) ) ( not ( = ?auto_259315 ?auto_259323 ) ) ( not ( = ?auto_259315 ?auto_259324 ) ) ( not ( = ?auto_259316 ?auto_259317 ) ) ( not ( = ?auto_259316 ?auto_259318 ) ) ( not ( = ?auto_259316 ?auto_259319 ) ) ( not ( = ?auto_259316 ?auto_259320 ) ) ( not ( = ?auto_259316 ?auto_259321 ) ) ( not ( = ?auto_259316 ?auto_259322 ) ) ( not ( = ?auto_259316 ?auto_259323 ) ) ( not ( = ?auto_259316 ?auto_259324 ) ) ( not ( = ?auto_259317 ?auto_259318 ) ) ( not ( = ?auto_259317 ?auto_259319 ) ) ( not ( = ?auto_259317 ?auto_259320 ) ) ( not ( = ?auto_259317 ?auto_259321 ) ) ( not ( = ?auto_259317 ?auto_259322 ) ) ( not ( = ?auto_259317 ?auto_259323 ) ) ( not ( = ?auto_259317 ?auto_259324 ) ) ( not ( = ?auto_259318 ?auto_259319 ) ) ( not ( = ?auto_259318 ?auto_259320 ) ) ( not ( = ?auto_259318 ?auto_259321 ) ) ( not ( = ?auto_259318 ?auto_259322 ) ) ( not ( = ?auto_259318 ?auto_259323 ) ) ( not ( = ?auto_259318 ?auto_259324 ) ) ( not ( = ?auto_259319 ?auto_259320 ) ) ( not ( = ?auto_259319 ?auto_259321 ) ) ( not ( = ?auto_259319 ?auto_259322 ) ) ( not ( = ?auto_259319 ?auto_259323 ) ) ( not ( = ?auto_259319 ?auto_259324 ) ) ( not ( = ?auto_259320 ?auto_259321 ) ) ( not ( = ?auto_259320 ?auto_259322 ) ) ( not ( = ?auto_259320 ?auto_259323 ) ) ( not ( = ?auto_259320 ?auto_259324 ) ) ( not ( = ?auto_259321 ?auto_259322 ) ) ( not ( = ?auto_259321 ?auto_259323 ) ) ( not ( = ?auto_259321 ?auto_259324 ) ) ( not ( = ?auto_259322 ?auto_259323 ) ) ( not ( = ?auto_259322 ?auto_259324 ) ) ( not ( = ?auto_259323 ?auto_259324 ) ) ( ON ?auto_259322 ?auto_259323 ) ( CLEAR ?auto_259320 ) ( ON ?auto_259321 ?auto_259322 ) ( CLEAR ?auto_259321 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_259313 ?auto_259314 ?auto_259315 ?auto_259316 ?auto_259317 ?auto_259318 ?auto_259319 ?auto_259320 ?auto_259321 )
      ( MAKE-11PILE ?auto_259313 ?auto_259314 ?auto_259315 ?auto_259316 ?auto_259317 ?auto_259318 ?auto_259319 ?auto_259320 ?auto_259321 ?auto_259322 ?auto_259323 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_259359 - BLOCK
      ?auto_259360 - BLOCK
      ?auto_259361 - BLOCK
      ?auto_259362 - BLOCK
      ?auto_259363 - BLOCK
      ?auto_259364 - BLOCK
      ?auto_259365 - BLOCK
      ?auto_259366 - BLOCK
      ?auto_259367 - BLOCK
      ?auto_259368 - BLOCK
      ?auto_259369 - BLOCK
    )
    :vars
    (
      ?auto_259370 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_259369 ?auto_259370 ) ( ON-TABLE ?auto_259359 ) ( ON ?auto_259360 ?auto_259359 ) ( ON ?auto_259361 ?auto_259360 ) ( ON ?auto_259362 ?auto_259361 ) ( ON ?auto_259363 ?auto_259362 ) ( ON ?auto_259364 ?auto_259363 ) ( ON ?auto_259365 ?auto_259364 ) ( not ( = ?auto_259359 ?auto_259360 ) ) ( not ( = ?auto_259359 ?auto_259361 ) ) ( not ( = ?auto_259359 ?auto_259362 ) ) ( not ( = ?auto_259359 ?auto_259363 ) ) ( not ( = ?auto_259359 ?auto_259364 ) ) ( not ( = ?auto_259359 ?auto_259365 ) ) ( not ( = ?auto_259359 ?auto_259366 ) ) ( not ( = ?auto_259359 ?auto_259367 ) ) ( not ( = ?auto_259359 ?auto_259368 ) ) ( not ( = ?auto_259359 ?auto_259369 ) ) ( not ( = ?auto_259359 ?auto_259370 ) ) ( not ( = ?auto_259360 ?auto_259361 ) ) ( not ( = ?auto_259360 ?auto_259362 ) ) ( not ( = ?auto_259360 ?auto_259363 ) ) ( not ( = ?auto_259360 ?auto_259364 ) ) ( not ( = ?auto_259360 ?auto_259365 ) ) ( not ( = ?auto_259360 ?auto_259366 ) ) ( not ( = ?auto_259360 ?auto_259367 ) ) ( not ( = ?auto_259360 ?auto_259368 ) ) ( not ( = ?auto_259360 ?auto_259369 ) ) ( not ( = ?auto_259360 ?auto_259370 ) ) ( not ( = ?auto_259361 ?auto_259362 ) ) ( not ( = ?auto_259361 ?auto_259363 ) ) ( not ( = ?auto_259361 ?auto_259364 ) ) ( not ( = ?auto_259361 ?auto_259365 ) ) ( not ( = ?auto_259361 ?auto_259366 ) ) ( not ( = ?auto_259361 ?auto_259367 ) ) ( not ( = ?auto_259361 ?auto_259368 ) ) ( not ( = ?auto_259361 ?auto_259369 ) ) ( not ( = ?auto_259361 ?auto_259370 ) ) ( not ( = ?auto_259362 ?auto_259363 ) ) ( not ( = ?auto_259362 ?auto_259364 ) ) ( not ( = ?auto_259362 ?auto_259365 ) ) ( not ( = ?auto_259362 ?auto_259366 ) ) ( not ( = ?auto_259362 ?auto_259367 ) ) ( not ( = ?auto_259362 ?auto_259368 ) ) ( not ( = ?auto_259362 ?auto_259369 ) ) ( not ( = ?auto_259362 ?auto_259370 ) ) ( not ( = ?auto_259363 ?auto_259364 ) ) ( not ( = ?auto_259363 ?auto_259365 ) ) ( not ( = ?auto_259363 ?auto_259366 ) ) ( not ( = ?auto_259363 ?auto_259367 ) ) ( not ( = ?auto_259363 ?auto_259368 ) ) ( not ( = ?auto_259363 ?auto_259369 ) ) ( not ( = ?auto_259363 ?auto_259370 ) ) ( not ( = ?auto_259364 ?auto_259365 ) ) ( not ( = ?auto_259364 ?auto_259366 ) ) ( not ( = ?auto_259364 ?auto_259367 ) ) ( not ( = ?auto_259364 ?auto_259368 ) ) ( not ( = ?auto_259364 ?auto_259369 ) ) ( not ( = ?auto_259364 ?auto_259370 ) ) ( not ( = ?auto_259365 ?auto_259366 ) ) ( not ( = ?auto_259365 ?auto_259367 ) ) ( not ( = ?auto_259365 ?auto_259368 ) ) ( not ( = ?auto_259365 ?auto_259369 ) ) ( not ( = ?auto_259365 ?auto_259370 ) ) ( not ( = ?auto_259366 ?auto_259367 ) ) ( not ( = ?auto_259366 ?auto_259368 ) ) ( not ( = ?auto_259366 ?auto_259369 ) ) ( not ( = ?auto_259366 ?auto_259370 ) ) ( not ( = ?auto_259367 ?auto_259368 ) ) ( not ( = ?auto_259367 ?auto_259369 ) ) ( not ( = ?auto_259367 ?auto_259370 ) ) ( not ( = ?auto_259368 ?auto_259369 ) ) ( not ( = ?auto_259368 ?auto_259370 ) ) ( not ( = ?auto_259369 ?auto_259370 ) ) ( ON ?auto_259368 ?auto_259369 ) ( ON ?auto_259367 ?auto_259368 ) ( CLEAR ?auto_259365 ) ( ON ?auto_259366 ?auto_259367 ) ( CLEAR ?auto_259366 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_259359 ?auto_259360 ?auto_259361 ?auto_259362 ?auto_259363 ?auto_259364 ?auto_259365 ?auto_259366 )
      ( MAKE-11PILE ?auto_259359 ?auto_259360 ?auto_259361 ?auto_259362 ?auto_259363 ?auto_259364 ?auto_259365 ?auto_259366 ?auto_259367 ?auto_259368 ?auto_259369 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_259405 - BLOCK
      ?auto_259406 - BLOCK
      ?auto_259407 - BLOCK
      ?auto_259408 - BLOCK
      ?auto_259409 - BLOCK
      ?auto_259410 - BLOCK
      ?auto_259411 - BLOCK
      ?auto_259412 - BLOCK
      ?auto_259413 - BLOCK
      ?auto_259414 - BLOCK
      ?auto_259415 - BLOCK
    )
    :vars
    (
      ?auto_259416 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_259415 ?auto_259416 ) ( ON-TABLE ?auto_259405 ) ( ON ?auto_259406 ?auto_259405 ) ( ON ?auto_259407 ?auto_259406 ) ( ON ?auto_259408 ?auto_259407 ) ( ON ?auto_259409 ?auto_259408 ) ( ON ?auto_259410 ?auto_259409 ) ( not ( = ?auto_259405 ?auto_259406 ) ) ( not ( = ?auto_259405 ?auto_259407 ) ) ( not ( = ?auto_259405 ?auto_259408 ) ) ( not ( = ?auto_259405 ?auto_259409 ) ) ( not ( = ?auto_259405 ?auto_259410 ) ) ( not ( = ?auto_259405 ?auto_259411 ) ) ( not ( = ?auto_259405 ?auto_259412 ) ) ( not ( = ?auto_259405 ?auto_259413 ) ) ( not ( = ?auto_259405 ?auto_259414 ) ) ( not ( = ?auto_259405 ?auto_259415 ) ) ( not ( = ?auto_259405 ?auto_259416 ) ) ( not ( = ?auto_259406 ?auto_259407 ) ) ( not ( = ?auto_259406 ?auto_259408 ) ) ( not ( = ?auto_259406 ?auto_259409 ) ) ( not ( = ?auto_259406 ?auto_259410 ) ) ( not ( = ?auto_259406 ?auto_259411 ) ) ( not ( = ?auto_259406 ?auto_259412 ) ) ( not ( = ?auto_259406 ?auto_259413 ) ) ( not ( = ?auto_259406 ?auto_259414 ) ) ( not ( = ?auto_259406 ?auto_259415 ) ) ( not ( = ?auto_259406 ?auto_259416 ) ) ( not ( = ?auto_259407 ?auto_259408 ) ) ( not ( = ?auto_259407 ?auto_259409 ) ) ( not ( = ?auto_259407 ?auto_259410 ) ) ( not ( = ?auto_259407 ?auto_259411 ) ) ( not ( = ?auto_259407 ?auto_259412 ) ) ( not ( = ?auto_259407 ?auto_259413 ) ) ( not ( = ?auto_259407 ?auto_259414 ) ) ( not ( = ?auto_259407 ?auto_259415 ) ) ( not ( = ?auto_259407 ?auto_259416 ) ) ( not ( = ?auto_259408 ?auto_259409 ) ) ( not ( = ?auto_259408 ?auto_259410 ) ) ( not ( = ?auto_259408 ?auto_259411 ) ) ( not ( = ?auto_259408 ?auto_259412 ) ) ( not ( = ?auto_259408 ?auto_259413 ) ) ( not ( = ?auto_259408 ?auto_259414 ) ) ( not ( = ?auto_259408 ?auto_259415 ) ) ( not ( = ?auto_259408 ?auto_259416 ) ) ( not ( = ?auto_259409 ?auto_259410 ) ) ( not ( = ?auto_259409 ?auto_259411 ) ) ( not ( = ?auto_259409 ?auto_259412 ) ) ( not ( = ?auto_259409 ?auto_259413 ) ) ( not ( = ?auto_259409 ?auto_259414 ) ) ( not ( = ?auto_259409 ?auto_259415 ) ) ( not ( = ?auto_259409 ?auto_259416 ) ) ( not ( = ?auto_259410 ?auto_259411 ) ) ( not ( = ?auto_259410 ?auto_259412 ) ) ( not ( = ?auto_259410 ?auto_259413 ) ) ( not ( = ?auto_259410 ?auto_259414 ) ) ( not ( = ?auto_259410 ?auto_259415 ) ) ( not ( = ?auto_259410 ?auto_259416 ) ) ( not ( = ?auto_259411 ?auto_259412 ) ) ( not ( = ?auto_259411 ?auto_259413 ) ) ( not ( = ?auto_259411 ?auto_259414 ) ) ( not ( = ?auto_259411 ?auto_259415 ) ) ( not ( = ?auto_259411 ?auto_259416 ) ) ( not ( = ?auto_259412 ?auto_259413 ) ) ( not ( = ?auto_259412 ?auto_259414 ) ) ( not ( = ?auto_259412 ?auto_259415 ) ) ( not ( = ?auto_259412 ?auto_259416 ) ) ( not ( = ?auto_259413 ?auto_259414 ) ) ( not ( = ?auto_259413 ?auto_259415 ) ) ( not ( = ?auto_259413 ?auto_259416 ) ) ( not ( = ?auto_259414 ?auto_259415 ) ) ( not ( = ?auto_259414 ?auto_259416 ) ) ( not ( = ?auto_259415 ?auto_259416 ) ) ( ON ?auto_259414 ?auto_259415 ) ( ON ?auto_259413 ?auto_259414 ) ( ON ?auto_259412 ?auto_259413 ) ( CLEAR ?auto_259410 ) ( ON ?auto_259411 ?auto_259412 ) ( CLEAR ?auto_259411 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_259405 ?auto_259406 ?auto_259407 ?auto_259408 ?auto_259409 ?auto_259410 ?auto_259411 )
      ( MAKE-11PILE ?auto_259405 ?auto_259406 ?auto_259407 ?auto_259408 ?auto_259409 ?auto_259410 ?auto_259411 ?auto_259412 ?auto_259413 ?auto_259414 ?auto_259415 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_259451 - BLOCK
      ?auto_259452 - BLOCK
      ?auto_259453 - BLOCK
      ?auto_259454 - BLOCK
      ?auto_259455 - BLOCK
      ?auto_259456 - BLOCK
      ?auto_259457 - BLOCK
      ?auto_259458 - BLOCK
      ?auto_259459 - BLOCK
      ?auto_259460 - BLOCK
      ?auto_259461 - BLOCK
    )
    :vars
    (
      ?auto_259462 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_259461 ?auto_259462 ) ( ON-TABLE ?auto_259451 ) ( ON ?auto_259452 ?auto_259451 ) ( ON ?auto_259453 ?auto_259452 ) ( ON ?auto_259454 ?auto_259453 ) ( ON ?auto_259455 ?auto_259454 ) ( not ( = ?auto_259451 ?auto_259452 ) ) ( not ( = ?auto_259451 ?auto_259453 ) ) ( not ( = ?auto_259451 ?auto_259454 ) ) ( not ( = ?auto_259451 ?auto_259455 ) ) ( not ( = ?auto_259451 ?auto_259456 ) ) ( not ( = ?auto_259451 ?auto_259457 ) ) ( not ( = ?auto_259451 ?auto_259458 ) ) ( not ( = ?auto_259451 ?auto_259459 ) ) ( not ( = ?auto_259451 ?auto_259460 ) ) ( not ( = ?auto_259451 ?auto_259461 ) ) ( not ( = ?auto_259451 ?auto_259462 ) ) ( not ( = ?auto_259452 ?auto_259453 ) ) ( not ( = ?auto_259452 ?auto_259454 ) ) ( not ( = ?auto_259452 ?auto_259455 ) ) ( not ( = ?auto_259452 ?auto_259456 ) ) ( not ( = ?auto_259452 ?auto_259457 ) ) ( not ( = ?auto_259452 ?auto_259458 ) ) ( not ( = ?auto_259452 ?auto_259459 ) ) ( not ( = ?auto_259452 ?auto_259460 ) ) ( not ( = ?auto_259452 ?auto_259461 ) ) ( not ( = ?auto_259452 ?auto_259462 ) ) ( not ( = ?auto_259453 ?auto_259454 ) ) ( not ( = ?auto_259453 ?auto_259455 ) ) ( not ( = ?auto_259453 ?auto_259456 ) ) ( not ( = ?auto_259453 ?auto_259457 ) ) ( not ( = ?auto_259453 ?auto_259458 ) ) ( not ( = ?auto_259453 ?auto_259459 ) ) ( not ( = ?auto_259453 ?auto_259460 ) ) ( not ( = ?auto_259453 ?auto_259461 ) ) ( not ( = ?auto_259453 ?auto_259462 ) ) ( not ( = ?auto_259454 ?auto_259455 ) ) ( not ( = ?auto_259454 ?auto_259456 ) ) ( not ( = ?auto_259454 ?auto_259457 ) ) ( not ( = ?auto_259454 ?auto_259458 ) ) ( not ( = ?auto_259454 ?auto_259459 ) ) ( not ( = ?auto_259454 ?auto_259460 ) ) ( not ( = ?auto_259454 ?auto_259461 ) ) ( not ( = ?auto_259454 ?auto_259462 ) ) ( not ( = ?auto_259455 ?auto_259456 ) ) ( not ( = ?auto_259455 ?auto_259457 ) ) ( not ( = ?auto_259455 ?auto_259458 ) ) ( not ( = ?auto_259455 ?auto_259459 ) ) ( not ( = ?auto_259455 ?auto_259460 ) ) ( not ( = ?auto_259455 ?auto_259461 ) ) ( not ( = ?auto_259455 ?auto_259462 ) ) ( not ( = ?auto_259456 ?auto_259457 ) ) ( not ( = ?auto_259456 ?auto_259458 ) ) ( not ( = ?auto_259456 ?auto_259459 ) ) ( not ( = ?auto_259456 ?auto_259460 ) ) ( not ( = ?auto_259456 ?auto_259461 ) ) ( not ( = ?auto_259456 ?auto_259462 ) ) ( not ( = ?auto_259457 ?auto_259458 ) ) ( not ( = ?auto_259457 ?auto_259459 ) ) ( not ( = ?auto_259457 ?auto_259460 ) ) ( not ( = ?auto_259457 ?auto_259461 ) ) ( not ( = ?auto_259457 ?auto_259462 ) ) ( not ( = ?auto_259458 ?auto_259459 ) ) ( not ( = ?auto_259458 ?auto_259460 ) ) ( not ( = ?auto_259458 ?auto_259461 ) ) ( not ( = ?auto_259458 ?auto_259462 ) ) ( not ( = ?auto_259459 ?auto_259460 ) ) ( not ( = ?auto_259459 ?auto_259461 ) ) ( not ( = ?auto_259459 ?auto_259462 ) ) ( not ( = ?auto_259460 ?auto_259461 ) ) ( not ( = ?auto_259460 ?auto_259462 ) ) ( not ( = ?auto_259461 ?auto_259462 ) ) ( ON ?auto_259460 ?auto_259461 ) ( ON ?auto_259459 ?auto_259460 ) ( ON ?auto_259458 ?auto_259459 ) ( ON ?auto_259457 ?auto_259458 ) ( CLEAR ?auto_259455 ) ( ON ?auto_259456 ?auto_259457 ) ( CLEAR ?auto_259456 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_259451 ?auto_259452 ?auto_259453 ?auto_259454 ?auto_259455 ?auto_259456 )
      ( MAKE-11PILE ?auto_259451 ?auto_259452 ?auto_259453 ?auto_259454 ?auto_259455 ?auto_259456 ?auto_259457 ?auto_259458 ?auto_259459 ?auto_259460 ?auto_259461 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_259497 - BLOCK
      ?auto_259498 - BLOCK
      ?auto_259499 - BLOCK
      ?auto_259500 - BLOCK
      ?auto_259501 - BLOCK
      ?auto_259502 - BLOCK
      ?auto_259503 - BLOCK
      ?auto_259504 - BLOCK
      ?auto_259505 - BLOCK
      ?auto_259506 - BLOCK
      ?auto_259507 - BLOCK
    )
    :vars
    (
      ?auto_259508 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_259507 ?auto_259508 ) ( ON-TABLE ?auto_259497 ) ( ON ?auto_259498 ?auto_259497 ) ( ON ?auto_259499 ?auto_259498 ) ( ON ?auto_259500 ?auto_259499 ) ( not ( = ?auto_259497 ?auto_259498 ) ) ( not ( = ?auto_259497 ?auto_259499 ) ) ( not ( = ?auto_259497 ?auto_259500 ) ) ( not ( = ?auto_259497 ?auto_259501 ) ) ( not ( = ?auto_259497 ?auto_259502 ) ) ( not ( = ?auto_259497 ?auto_259503 ) ) ( not ( = ?auto_259497 ?auto_259504 ) ) ( not ( = ?auto_259497 ?auto_259505 ) ) ( not ( = ?auto_259497 ?auto_259506 ) ) ( not ( = ?auto_259497 ?auto_259507 ) ) ( not ( = ?auto_259497 ?auto_259508 ) ) ( not ( = ?auto_259498 ?auto_259499 ) ) ( not ( = ?auto_259498 ?auto_259500 ) ) ( not ( = ?auto_259498 ?auto_259501 ) ) ( not ( = ?auto_259498 ?auto_259502 ) ) ( not ( = ?auto_259498 ?auto_259503 ) ) ( not ( = ?auto_259498 ?auto_259504 ) ) ( not ( = ?auto_259498 ?auto_259505 ) ) ( not ( = ?auto_259498 ?auto_259506 ) ) ( not ( = ?auto_259498 ?auto_259507 ) ) ( not ( = ?auto_259498 ?auto_259508 ) ) ( not ( = ?auto_259499 ?auto_259500 ) ) ( not ( = ?auto_259499 ?auto_259501 ) ) ( not ( = ?auto_259499 ?auto_259502 ) ) ( not ( = ?auto_259499 ?auto_259503 ) ) ( not ( = ?auto_259499 ?auto_259504 ) ) ( not ( = ?auto_259499 ?auto_259505 ) ) ( not ( = ?auto_259499 ?auto_259506 ) ) ( not ( = ?auto_259499 ?auto_259507 ) ) ( not ( = ?auto_259499 ?auto_259508 ) ) ( not ( = ?auto_259500 ?auto_259501 ) ) ( not ( = ?auto_259500 ?auto_259502 ) ) ( not ( = ?auto_259500 ?auto_259503 ) ) ( not ( = ?auto_259500 ?auto_259504 ) ) ( not ( = ?auto_259500 ?auto_259505 ) ) ( not ( = ?auto_259500 ?auto_259506 ) ) ( not ( = ?auto_259500 ?auto_259507 ) ) ( not ( = ?auto_259500 ?auto_259508 ) ) ( not ( = ?auto_259501 ?auto_259502 ) ) ( not ( = ?auto_259501 ?auto_259503 ) ) ( not ( = ?auto_259501 ?auto_259504 ) ) ( not ( = ?auto_259501 ?auto_259505 ) ) ( not ( = ?auto_259501 ?auto_259506 ) ) ( not ( = ?auto_259501 ?auto_259507 ) ) ( not ( = ?auto_259501 ?auto_259508 ) ) ( not ( = ?auto_259502 ?auto_259503 ) ) ( not ( = ?auto_259502 ?auto_259504 ) ) ( not ( = ?auto_259502 ?auto_259505 ) ) ( not ( = ?auto_259502 ?auto_259506 ) ) ( not ( = ?auto_259502 ?auto_259507 ) ) ( not ( = ?auto_259502 ?auto_259508 ) ) ( not ( = ?auto_259503 ?auto_259504 ) ) ( not ( = ?auto_259503 ?auto_259505 ) ) ( not ( = ?auto_259503 ?auto_259506 ) ) ( not ( = ?auto_259503 ?auto_259507 ) ) ( not ( = ?auto_259503 ?auto_259508 ) ) ( not ( = ?auto_259504 ?auto_259505 ) ) ( not ( = ?auto_259504 ?auto_259506 ) ) ( not ( = ?auto_259504 ?auto_259507 ) ) ( not ( = ?auto_259504 ?auto_259508 ) ) ( not ( = ?auto_259505 ?auto_259506 ) ) ( not ( = ?auto_259505 ?auto_259507 ) ) ( not ( = ?auto_259505 ?auto_259508 ) ) ( not ( = ?auto_259506 ?auto_259507 ) ) ( not ( = ?auto_259506 ?auto_259508 ) ) ( not ( = ?auto_259507 ?auto_259508 ) ) ( ON ?auto_259506 ?auto_259507 ) ( ON ?auto_259505 ?auto_259506 ) ( ON ?auto_259504 ?auto_259505 ) ( ON ?auto_259503 ?auto_259504 ) ( ON ?auto_259502 ?auto_259503 ) ( CLEAR ?auto_259500 ) ( ON ?auto_259501 ?auto_259502 ) ( CLEAR ?auto_259501 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_259497 ?auto_259498 ?auto_259499 ?auto_259500 ?auto_259501 )
      ( MAKE-11PILE ?auto_259497 ?auto_259498 ?auto_259499 ?auto_259500 ?auto_259501 ?auto_259502 ?auto_259503 ?auto_259504 ?auto_259505 ?auto_259506 ?auto_259507 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_259543 - BLOCK
      ?auto_259544 - BLOCK
      ?auto_259545 - BLOCK
      ?auto_259546 - BLOCK
      ?auto_259547 - BLOCK
      ?auto_259548 - BLOCK
      ?auto_259549 - BLOCK
      ?auto_259550 - BLOCK
      ?auto_259551 - BLOCK
      ?auto_259552 - BLOCK
      ?auto_259553 - BLOCK
    )
    :vars
    (
      ?auto_259554 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_259553 ?auto_259554 ) ( ON-TABLE ?auto_259543 ) ( ON ?auto_259544 ?auto_259543 ) ( ON ?auto_259545 ?auto_259544 ) ( not ( = ?auto_259543 ?auto_259544 ) ) ( not ( = ?auto_259543 ?auto_259545 ) ) ( not ( = ?auto_259543 ?auto_259546 ) ) ( not ( = ?auto_259543 ?auto_259547 ) ) ( not ( = ?auto_259543 ?auto_259548 ) ) ( not ( = ?auto_259543 ?auto_259549 ) ) ( not ( = ?auto_259543 ?auto_259550 ) ) ( not ( = ?auto_259543 ?auto_259551 ) ) ( not ( = ?auto_259543 ?auto_259552 ) ) ( not ( = ?auto_259543 ?auto_259553 ) ) ( not ( = ?auto_259543 ?auto_259554 ) ) ( not ( = ?auto_259544 ?auto_259545 ) ) ( not ( = ?auto_259544 ?auto_259546 ) ) ( not ( = ?auto_259544 ?auto_259547 ) ) ( not ( = ?auto_259544 ?auto_259548 ) ) ( not ( = ?auto_259544 ?auto_259549 ) ) ( not ( = ?auto_259544 ?auto_259550 ) ) ( not ( = ?auto_259544 ?auto_259551 ) ) ( not ( = ?auto_259544 ?auto_259552 ) ) ( not ( = ?auto_259544 ?auto_259553 ) ) ( not ( = ?auto_259544 ?auto_259554 ) ) ( not ( = ?auto_259545 ?auto_259546 ) ) ( not ( = ?auto_259545 ?auto_259547 ) ) ( not ( = ?auto_259545 ?auto_259548 ) ) ( not ( = ?auto_259545 ?auto_259549 ) ) ( not ( = ?auto_259545 ?auto_259550 ) ) ( not ( = ?auto_259545 ?auto_259551 ) ) ( not ( = ?auto_259545 ?auto_259552 ) ) ( not ( = ?auto_259545 ?auto_259553 ) ) ( not ( = ?auto_259545 ?auto_259554 ) ) ( not ( = ?auto_259546 ?auto_259547 ) ) ( not ( = ?auto_259546 ?auto_259548 ) ) ( not ( = ?auto_259546 ?auto_259549 ) ) ( not ( = ?auto_259546 ?auto_259550 ) ) ( not ( = ?auto_259546 ?auto_259551 ) ) ( not ( = ?auto_259546 ?auto_259552 ) ) ( not ( = ?auto_259546 ?auto_259553 ) ) ( not ( = ?auto_259546 ?auto_259554 ) ) ( not ( = ?auto_259547 ?auto_259548 ) ) ( not ( = ?auto_259547 ?auto_259549 ) ) ( not ( = ?auto_259547 ?auto_259550 ) ) ( not ( = ?auto_259547 ?auto_259551 ) ) ( not ( = ?auto_259547 ?auto_259552 ) ) ( not ( = ?auto_259547 ?auto_259553 ) ) ( not ( = ?auto_259547 ?auto_259554 ) ) ( not ( = ?auto_259548 ?auto_259549 ) ) ( not ( = ?auto_259548 ?auto_259550 ) ) ( not ( = ?auto_259548 ?auto_259551 ) ) ( not ( = ?auto_259548 ?auto_259552 ) ) ( not ( = ?auto_259548 ?auto_259553 ) ) ( not ( = ?auto_259548 ?auto_259554 ) ) ( not ( = ?auto_259549 ?auto_259550 ) ) ( not ( = ?auto_259549 ?auto_259551 ) ) ( not ( = ?auto_259549 ?auto_259552 ) ) ( not ( = ?auto_259549 ?auto_259553 ) ) ( not ( = ?auto_259549 ?auto_259554 ) ) ( not ( = ?auto_259550 ?auto_259551 ) ) ( not ( = ?auto_259550 ?auto_259552 ) ) ( not ( = ?auto_259550 ?auto_259553 ) ) ( not ( = ?auto_259550 ?auto_259554 ) ) ( not ( = ?auto_259551 ?auto_259552 ) ) ( not ( = ?auto_259551 ?auto_259553 ) ) ( not ( = ?auto_259551 ?auto_259554 ) ) ( not ( = ?auto_259552 ?auto_259553 ) ) ( not ( = ?auto_259552 ?auto_259554 ) ) ( not ( = ?auto_259553 ?auto_259554 ) ) ( ON ?auto_259552 ?auto_259553 ) ( ON ?auto_259551 ?auto_259552 ) ( ON ?auto_259550 ?auto_259551 ) ( ON ?auto_259549 ?auto_259550 ) ( ON ?auto_259548 ?auto_259549 ) ( ON ?auto_259547 ?auto_259548 ) ( CLEAR ?auto_259545 ) ( ON ?auto_259546 ?auto_259547 ) ( CLEAR ?auto_259546 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_259543 ?auto_259544 ?auto_259545 ?auto_259546 )
      ( MAKE-11PILE ?auto_259543 ?auto_259544 ?auto_259545 ?auto_259546 ?auto_259547 ?auto_259548 ?auto_259549 ?auto_259550 ?auto_259551 ?auto_259552 ?auto_259553 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_259589 - BLOCK
      ?auto_259590 - BLOCK
      ?auto_259591 - BLOCK
      ?auto_259592 - BLOCK
      ?auto_259593 - BLOCK
      ?auto_259594 - BLOCK
      ?auto_259595 - BLOCK
      ?auto_259596 - BLOCK
      ?auto_259597 - BLOCK
      ?auto_259598 - BLOCK
      ?auto_259599 - BLOCK
    )
    :vars
    (
      ?auto_259600 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_259599 ?auto_259600 ) ( ON-TABLE ?auto_259589 ) ( ON ?auto_259590 ?auto_259589 ) ( not ( = ?auto_259589 ?auto_259590 ) ) ( not ( = ?auto_259589 ?auto_259591 ) ) ( not ( = ?auto_259589 ?auto_259592 ) ) ( not ( = ?auto_259589 ?auto_259593 ) ) ( not ( = ?auto_259589 ?auto_259594 ) ) ( not ( = ?auto_259589 ?auto_259595 ) ) ( not ( = ?auto_259589 ?auto_259596 ) ) ( not ( = ?auto_259589 ?auto_259597 ) ) ( not ( = ?auto_259589 ?auto_259598 ) ) ( not ( = ?auto_259589 ?auto_259599 ) ) ( not ( = ?auto_259589 ?auto_259600 ) ) ( not ( = ?auto_259590 ?auto_259591 ) ) ( not ( = ?auto_259590 ?auto_259592 ) ) ( not ( = ?auto_259590 ?auto_259593 ) ) ( not ( = ?auto_259590 ?auto_259594 ) ) ( not ( = ?auto_259590 ?auto_259595 ) ) ( not ( = ?auto_259590 ?auto_259596 ) ) ( not ( = ?auto_259590 ?auto_259597 ) ) ( not ( = ?auto_259590 ?auto_259598 ) ) ( not ( = ?auto_259590 ?auto_259599 ) ) ( not ( = ?auto_259590 ?auto_259600 ) ) ( not ( = ?auto_259591 ?auto_259592 ) ) ( not ( = ?auto_259591 ?auto_259593 ) ) ( not ( = ?auto_259591 ?auto_259594 ) ) ( not ( = ?auto_259591 ?auto_259595 ) ) ( not ( = ?auto_259591 ?auto_259596 ) ) ( not ( = ?auto_259591 ?auto_259597 ) ) ( not ( = ?auto_259591 ?auto_259598 ) ) ( not ( = ?auto_259591 ?auto_259599 ) ) ( not ( = ?auto_259591 ?auto_259600 ) ) ( not ( = ?auto_259592 ?auto_259593 ) ) ( not ( = ?auto_259592 ?auto_259594 ) ) ( not ( = ?auto_259592 ?auto_259595 ) ) ( not ( = ?auto_259592 ?auto_259596 ) ) ( not ( = ?auto_259592 ?auto_259597 ) ) ( not ( = ?auto_259592 ?auto_259598 ) ) ( not ( = ?auto_259592 ?auto_259599 ) ) ( not ( = ?auto_259592 ?auto_259600 ) ) ( not ( = ?auto_259593 ?auto_259594 ) ) ( not ( = ?auto_259593 ?auto_259595 ) ) ( not ( = ?auto_259593 ?auto_259596 ) ) ( not ( = ?auto_259593 ?auto_259597 ) ) ( not ( = ?auto_259593 ?auto_259598 ) ) ( not ( = ?auto_259593 ?auto_259599 ) ) ( not ( = ?auto_259593 ?auto_259600 ) ) ( not ( = ?auto_259594 ?auto_259595 ) ) ( not ( = ?auto_259594 ?auto_259596 ) ) ( not ( = ?auto_259594 ?auto_259597 ) ) ( not ( = ?auto_259594 ?auto_259598 ) ) ( not ( = ?auto_259594 ?auto_259599 ) ) ( not ( = ?auto_259594 ?auto_259600 ) ) ( not ( = ?auto_259595 ?auto_259596 ) ) ( not ( = ?auto_259595 ?auto_259597 ) ) ( not ( = ?auto_259595 ?auto_259598 ) ) ( not ( = ?auto_259595 ?auto_259599 ) ) ( not ( = ?auto_259595 ?auto_259600 ) ) ( not ( = ?auto_259596 ?auto_259597 ) ) ( not ( = ?auto_259596 ?auto_259598 ) ) ( not ( = ?auto_259596 ?auto_259599 ) ) ( not ( = ?auto_259596 ?auto_259600 ) ) ( not ( = ?auto_259597 ?auto_259598 ) ) ( not ( = ?auto_259597 ?auto_259599 ) ) ( not ( = ?auto_259597 ?auto_259600 ) ) ( not ( = ?auto_259598 ?auto_259599 ) ) ( not ( = ?auto_259598 ?auto_259600 ) ) ( not ( = ?auto_259599 ?auto_259600 ) ) ( ON ?auto_259598 ?auto_259599 ) ( ON ?auto_259597 ?auto_259598 ) ( ON ?auto_259596 ?auto_259597 ) ( ON ?auto_259595 ?auto_259596 ) ( ON ?auto_259594 ?auto_259595 ) ( ON ?auto_259593 ?auto_259594 ) ( ON ?auto_259592 ?auto_259593 ) ( CLEAR ?auto_259590 ) ( ON ?auto_259591 ?auto_259592 ) ( CLEAR ?auto_259591 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_259589 ?auto_259590 ?auto_259591 )
      ( MAKE-11PILE ?auto_259589 ?auto_259590 ?auto_259591 ?auto_259592 ?auto_259593 ?auto_259594 ?auto_259595 ?auto_259596 ?auto_259597 ?auto_259598 ?auto_259599 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_259635 - BLOCK
      ?auto_259636 - BLOCK
      ?auto_259637 - BLOCK
      ?auto_259638 - BLOCK
      ?auto_259639 - BLOCK
      ?auto_259640 - BLOCK
      ?auto_259641 - BLOCK
      ?auto_259642 - BLOCK
      ?auto_259643 - BLOCK
      ?auto_259644 - BLOCK
      ?auto_259645 - BLOCK
    )
    :vars
    (
      ?auto_259646 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_259645 ?auto_259646 ) ( ON-TABLE ?auto_259635 ) ( not ( = ?auto_259635 ?auto_259636 ) ) ( not ( = ?auto_259635 ?auto_259637 ) ) ( not ( = ?auto_259635 ?auto_259638 ) ) ( not ( = ?auto_259635 ?auto_259639 ) ) ( not ( = ?auto_259635 ?auto_259640 ) ) ( not ( = ?auto_259635 ?auto_259641 ) ) ( not ( = ?auto_259635 ?auto_259642 ) ) ( not ( = ?auto_259635 ?auto_259643 ) ) ( not ( = ?auto_259635 ?auto_259644 ) ) ( not ( = ?auto_259635 ?auto_259645 ) ) ( not ( = ?auto_259635 ?auto_259646 ) ) ( not ( = ?auto_259636 ?auto_259637 ) ) ( not ( = ?auto_259636 ?auto_259638 ) ) ( not ( = ?auto_259636 ?auto_259639 ) ) ( not ( = ?auto_259636 ?auto_259640 ) ) ( not ( = ?auto_259636 ?auto_259641 ) ) ( not ( = ?auto_259636 ?auto_259642 ) ) ( not ( = ?auto_259636 ?auto_259643 ) ) ( not ( = ?auto_259636 ?auto_259644 ) ) ( not ( = ?auto_259636 ?auto_259645 ) ) ( not ( = ?auto_259636 ?auto_259646 ) ) ( not ( = ?auto_259637 ?auto_259638 ) ) ( not ( = ?auto_259637 ?auto_259639 ) ) ( not ( = ?auto_259637 ?auto_259640 ) ) ( not ( = ?auto_259637 ?auto_259641 ) ) ( not ( = ?auto_259637 ?auto_259642 ) ) ( not ( = ?auto_259637 ?auto_259643 ) ) ( not ( = ?auto_259637 ?auto_259644 ) ) ( not ( = ?auto_259637 ?auto_259645 ) ) ( not ( = ?auto_259637 ?auto_259646 ) ) ( not ( = ?auto_259638 ?auto_259639 ) ) ( not ( = ?auto_259638 ?auto_259640 ) ) ( not ( = ?auto_259638 ?auto_259641 ) ) ( not ( = ?auto_259638 ?auto_259642 ) ) ( not ( = ?auto_259638 ?auto_259643 ) ) ( not ( = ?auto_259638 ?auto_259644 ) ) ( not ( = ?auto_259638 ?auto_259645 ) ) ( not ( = ?auto_259638 ?auto_259646 ) ) ( not ( = ?auto_259639 ?auto_259640 ) ) ( not ( = ?auto_259639 ?auto_259641 ) ) ( not ( = ?auto_259639 ?auto_259642 ) ) ( not ( = ?auto_259639 ?auto_259643 ) ) ( not ( = ?auto_259639 ?auto_259644 ) ) ( not ( = ?auto_259639 ?auto_259645 ) ) ( not ( = ?auto_259639 ?auto_259646 ) ) ( not ( = ?auto_259640 ?auto_259641 ) ) ( not ( = ?auto_259640 ?auto_259642 ) ) ( not ( = ?auto_259640 ?auto_259643 ) ) ( not ( = ?auto_259640 ?auto_259644 ) ) ( not ( = ?auto_259640 ?auto_259645 ) ) ( not ( = ?auto_259640 ?auto_259646 ) ) ( not ( = ?auto_259641 ?auto_259642 ) ) ( not ( = ?auto_259641 ?auto_259643 ) ) ( not ( = ?auto_259641 ?auto_259644 ) ) ( not ( = ?auto_259641 ?auto_259645 ) ) ( not ( = ?auto_259641 ?auto_259646 ) ) ( not ( = ?auto_259642 ?auto_259643 ) ) ( not ( = ?auto_259642 ?auto_259644 ) ) ( not ( = ?auto_259642 ?auto_259645 ) ) ( not ( = ?auto_259642 ?auto_259646 ) ) ( not ( = ?auto_259643 ?auto_259644 ) ) ( not ( = ?auto_259643 ?auto_259645 ) ) ( not ( = ?auto_259643 ?auto_259646 ) ) ( not ( = ?auto_259644 ?auto_259645 ) ) ( not ( = ?auto_259644 ?auto_259646 ) ) ( not ( = ?auto_259645 ?auto_259646 ) ) ( ON ?auto_259644 ?auto_259645 ) ( ON ?auto_259643 ?auto_259644 ) ( ON ?auto_259642 ?auto_259643 ) ( ON ?auto_259641 ?auto_259642 ) ( ON ?auto_259640 ?auto_259641 ) ( ON ?auto_259639 ?auto_259640 ) ( ON ?auto_259638 ?auto_259639 ) ( ON ?auto_259637 ?auto_259638 ) ( CLEAR ?auto_259635 ) ( ON ?auto_259636 ?auto_259637 ) ( CLEAR ?auto_259636 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_259635 ?auto_259636 )
      ( MAKE-11PILE ?auto_259635 ?auto_259636 ?auto_259637 ?auto_259638 ?auto_259639 ?auto_259640 ?auto_259641 ?auto_259642 ?auto_259643 ?auto_259644 ?auto_259645 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_259681 - BLOCK
      ?auto_259682 - BLOCK
      ?auto_259683 - BLOCK
      ?auto_259684 - BLOCK
      ?auto_259685 - BLOCK
      ?auto_259686 - BLOCK
      ?auto_259687 - BLOCK
      ?auto_259688 - BLOCK
      ?auto_259689 - BLOCK
      ?auto_259690 - BLOCK
      ?auto_259691 - BLOCK
    )
    :vars
    (
      ?auto_259692 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_259691 ?auto_259692 ) ( not ( = ?auto_259681 ?auto_259682 ) ) ( not ( = ?auto_259681 ?auto_259683 ) ) ( not ( = ?auto_259681 ?auto_259684 ) ) ( not ( = ?auto_259681 ?auto_259685 ) ) ( not ( = ?auto_259681 ?auto_259686 ) ) ( not ( = ?auto_259681 ?auto_259687 ) ) ( not ( = ?auto_259681 ?auto_259688 ) ) ( not ( = ?auto_259681 ?auto_259689 ) ) ( not ( = ?auto_259681 ?auto_259690 ) ) ( not ( = ?auto_259681 ?auto_259691 ) ) ( not ( = ?auto_259681 ?auto_259692 ) ) ( not ( = ?auto_259682 ?auto_259683 ) ) ( not ( = ?auto_259682 ?auto_259684 ) ) ( not ( = ?auto_259682 ?auto_259685 ) ) ( not ( = ?auto_259682 ?auto_259686 ) ) ( not ( = ?auto_259682 ?auto_259687 ) ) ( not ( = ?auto_259682 ?auto_259688 ) ) ( not ( = ?auto_259682 ?auto_259689 ) ) ( not ( = ?auto_259682 ?auto_259690 ) ) ( not ( = ?auto_259682 ?auto_259691 ) ) ( not ( = ?auto_259682 ?auto_259692 ) ) ( not ( = ?auto_259683 ?auto_259684 ) ) ( not ( = ?auto_259683 ?auto_259685 ) ) ( not ( = ?auto_259683 ?auto_259686 ) ) ( not ( = ?auto_259683 ?auto_259687 ) ) ( not ( = ?auto_259683 ?auto_259688 ) ) ( not ( = ?auto_259683 ?auto_259689 ) ) ( not ( = ?auto_259683 ?auto_259690 ) ) ( not ( = ?auto_259683 ?auto_259691 ) ) ( not ( = ?auto_259683 ?auto_259692 ) ) ( not ( = ?auto_259684 ?auto_259685 ) ) ( not ( = ?auto_259684 ?auto_259686 ) ) ( not ( = ?auto_259684 ?auto_259687 ) ) ( not ( = ?auto_259684 ?auto_259688 ) ) ( not ( = ?auto_259684 ?auto_259689 ) ) ( not ( = ?auto_259684 ?auto_259690 ) ) ( not ( = ?auto_259684 ?auto_259691 ) ) ( not ( = ?auto_259684 ?auto_259692 ) ) ( not ( = ?auto_259685 ?auto_259686 ) ) ( not ( = ?auto_259685 ?auto_259687 ) ) ( not ( = ?auto_259685 ?auto_259688 ) ) ( not ( = ?auto_259685 ?auto_259689 ) ) ( not ( = ?auto_259685 ?auto_259690 ) ) ( not ( = ?auto_259685 ?auto_259691 ) ) ( not ( = ?auto_259685 ?auto_259692 ) ) ( not ( = ?auto_259686 ?auto_259687 ) ) ( not ( = ?auto_259686 ?auto_259688 ) ) ( not ( = ?auto_259686 ?auto_259689 ) ) ( not ( = ?auto_259686 ?auto_259690 ) ) ( not ( = ?auto_259686 ?auto_259691 ) ) ( not ( = ?auto_259686 ?auto_259692 ) ) ( not ( = ?auto_259687 ?auto_259688 ) ) ( not ( = ?auto_259687 ?auto_259689 ) ) ( not ( = ?auto_259687 ?auto_259690 ) ) ( not ( = ?auto_259687 ?auto_259691 ) ) ( not ( = ?auto_259687 ?auto_259692 ) ) ( not ( = ?auto_259688 ?auto_259689 ) ) ( not ( = ?auto_259688 ?auto_259690 ) ) ( not ( = ?auto_259688 ?auto_259691 ) ) ( not ( = ?auto_259688 ?auto_259692 ) ) ( not ( = ?auto_259689 ?auto_259690 ) ) ( not ( = ?auto_259689 ?auto_259691 ) ) ( not ( = ?auto_259689 ?auto_259692 ) ) ( not ( = ?auto_259690 ?auto_259691 ) ) ( not ( = ?auto_259690 ?auto_259692 ) ) ( not ( = ?auto_259691 ?auto_259692 ) ) ( ON ?auto_259690 ?auto_259691 ) ( ON ?auto_259689 ?auto_259690 ) ( ON ?auto_259688 ?auto_259689 ) ( ON ?auto_259687 ?auto_259688 ) ( ON ?auto_259686 ?auto_259687 ) ( ON ?auto_259685 ?auto_259686 ) ( ON ?auto_259684 ?auto_259685 ) ( ON ?auto_259683 ?auto_259684 ) ( ON ?auto_259682 ?auto_259683 ) ( ON ?auto_259681 ?auto_259682 ) ( CLEAR ?auto_259681 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_259681 )
      ( MAKE-11PILE ?auto_259681 ?auto_259682 ?auto_259683 ?auto_259684 ?auto_259685 ?auto_259686 ?auto_259687 ?auto_259688 ?auto_259689 ?auto_259690 ?auto_259691 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_259728 - BLOCK
      ?auto_259729 - BLOCK
      ?auto_259730 - BLOCK
      ?auto_259731 - BLOCK
      ?auto_259732 - BLOCK
      ?auto_259733 - BLOCK
      ?auto_259734 - BLOCK
      ?auto_259735 - BLOCK
      ?auto_259736 - BLOCK
      ?auto_259737 - BLOCK
      ?auto_259738 - BLOCK
      ?auto_259739 - BLOCK
    )
    :vars
    (
      ?auto_259740 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_259738 ) ( ON ?auto_259739 ?auto_259740 ) ( CLEAR ?auto_259739 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_259728 ) ( ON ?auto_259729 ?auto_259728 ) ( ON ?auto_259730 ?auto_259729 ) ( ON ?auto_259731 ?auto_259730 ) ( ON ?auto_259732 ?auto_259731 ) ( ON ?auto_259733 ?auto_259732 ) ( ON ?auto_259734 ?auto_259733 ) ( ON ?auto_259735 ?auto_259734 ) ( ON ?auto_259736 ?auto_259735 ) ( ON ?auto_259737 ?auto_259736 ) ( ON ?auto_259738 ?auto_259737 ) ( not ( = ?auto_259728 ?auto_259729 ) ) ( not ( = ?auto_259728 ?auto_259730 ) ) ( not ( = ?auto_259728 ?auto_259731 ) ) ( not ( = ?auto_259728 ?auto_259732 ) ) ( not ( = ?auto_259728 ?auto_259733 ) ) ( not ( = ?auto_259728 ?auto_259734 ) ) ( not ( = ?auto_259728 ?auto_259735 ) ) ( not ( = ?auto_259728 ?auto_259736 ) ) ( not ( = ?auto_259728 ?auto_259737 ) ) ( not ( = ?auto_259728 ?auto_259738 ) ) ( not ( = ?auto_259728 ?auto_259739 ) ) ( not ( = ?auto_259728 ?auto_259740 ) ) ( not ( = ?auto_259729 ?auto_259730 ) ) ( not ( = ?auto_259729 ?auto_259731 ) ) ( not ( = ?auto_259729 ?auto_259732 ) ) ( not ( = ?auto_259729 ?auto_259733 ) ) ( not ( = ?auto_259729 ?auto_259734 ) ) ( not ( = ?auto_259729 ?auto_259735 ) ) ( not ( = ?auto_259729 ?auto_259736 ) ) ( not ( = ?auto_259729 ?auto_259737 ) ) ( not ( = ?auto_259729 ?auto_259738 ) ) ( not ( = ?auto_259729 ?auto_259739 ) ) ( not ( = ?auto_259729 ?auto_259740 ) ) ( not ( = ?auto_259730 ?auto_259731 ) ) ( not ( = ?auto_259730 ?auto_259732 ) ) ( not ( = ?auto_259730 ?auto_259733 ) ) ( not ( = ?auto_259730 ?auto_259734 ) ) ( not ( = ?auto_259730 ?auto_259735 ) ) ( not ( = ?auto_259730 ?auto_259736 ) ) ( not ( = ?auto_259730 ?auto_259737 ) ) ( not ( = ?auto_259730 ?auto_259738 ) ) ( not ( = ?auto_259730 ?auto_259739 ) ) ( not ( = ?auto_259730 ?auto_259740 ) ) ( not ( = ?auto_259731 ?auto_259732 ) ) ( not ( = ?auto_259731 ?auto_259733 ) ) ( not ( = ?auto_259731 ?auto_259734 ) ) ( not ( = ?auto_259731 ?auto_259735 ) ) ( not ( = ?auto_259731 ?auto_259736 ) ) ( not ( = ?auto_259731 ?auto_259737 ) ) ( not ( = ?auto_259731 ?auto_259738 ) ) ( not ( = ?auto_259731 ?auto_259739 ) ) ( not ( = ?auto_259731 ?auto_259740 ) ) ( not ( = ?auto_259732 ?auto_259733 ) ) ( not ( = ?auto_259732 ?auto_259734 ) ) ( not ( = ?auto_259732 ?auto_259735 ) ) ( not ( = ?auto_259732 ?auto_259736 ) ) ( not ( = ?auto_259732 ?auto_259737 ) ) ( not ( = ?auto_259732 ?auto_259738 ) ) ( not ( = ?auto_259732 ?auto_259739 ) ) ( not ( = ?auto_259732 ?auto_259740 ) ) ( not ( = ?auto_259733 ?auto_259734 ) ) ( not ( = ?auto_259733 ?auto_259735 ) ) ( not ( = ?auto_259733 ?auto_259736 ) ) ( not ( = ?auto_259733 ?auto_259737 ) ) ( not ( = ?auto_259733 ?auto_259738 ) ) ( not ( = ?auto_259733 ?auto_259739 ) ) ( not ( = ?auto_259733 ?auto_259740 ) ) ( not ( = ?auto_259734 ?auto_259735 ) ) ( not ( = ?auto_259734 ?auto_259736 ) ) ( not ( = ?auto_259734 ?auto_259737 ) ) ( not ( = ?auto_259734 ?auto_259738 ) ) ( not ( = ?auto_259734 ?auto_259739 ) ) ( not ( = ?auto_259734 ?auto_259740 ) ) ( not ( = ?auto_259735 ?auto_259736 ) ) ( not ( = ?auto_259735 ?auto_259737 ) ) ( not ( = ?auto_259735 ?auto_259738 ) ) ( not ( = ?auto_259735 ?auto_259739 ) ) ( not ( = ?auto_259735 ?auto_259740 ) ) ( not ( = ?auto_259736 ?auto_259737 ) ) ( not ( = ?auto_259736 ?auto_259738 ) ) ( not ( = ?auto_259736 ?auto_259739 ) ) ( not ( = ?auto_259736 ?auto_259740 ) ) ( not ( = ?auto_259737 ?auto_259738 ) ) ( not ( = ?auto_259737 ?auto_259739 ) ) ( not ( = ?auto_259737 ?auto_259740 ) ) ( not ( = ?auto_259738 ?auto_259739 ) ) ( not ( = ?auto_259738 ?auto_259740 ) ) ( not ( = ?auto_259739 ?auto_259740 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_259739 ?auto_259740 )
      ( !STACK ?auto_259739 ?auto_259738 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_259778 - BLOCK
      ?auto_259779 - BLOCK
      ?auto_259780 - BLOCK
      ?auto_259781 - BLOCK
      ?auto_259782 - BLOCK
      ?auto_259783 - BLOCK
      ?auto_259784 - BLOCK
      ?auto_259785 - BLOCK
      ?auto_259786 - BLOCK
      ?auto_259787 - BLOCK
      ?auto_259788 - BLOCK
      ?auto_259789 - BLOCK
    )
    :vars
    (
      ?auto_259790 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_259789 ?auto_259790 ) ( ON-TABLE ?auto_259778 ) ( ON ?auto_259779 ?auto_259778 ) ( ON ?auto_259780 ?auto_259779 ) ( ON ?auto_259781 ?auto_259780 ) ( ON ?auto_259782 ?auto_259781 ) ( ON ?auto_259783 ?auto_259782 ) ( ON ?auto_259784 ?auto_259783 ) ( ON ?auto_259785 ?auto_259784 ) ( ON ?auto_259786 ?auto_259785 ) ( ON ?auto_259787 ?auto_259786 ) ( not ( = ?auto_259778 ?auto_259779 ) ) ( not ( = ?auto_259778 ?auto_259780 ) ) ( not ( = ?auto_259778 ?auto_259781 ) ) ( not ( = ?auto_259778 ?auto_259782 ) ) ( not ( = ?auto_259778 ?auto_259783 ) ) ( not ( = ?auto_259778 ?auto_259784 ) ) ( not ( = ?auto_259778 ?auto_259785 ) ) ( not ( = ?auto_259778 ?auto_259786 ) ) ( not ( = ?auto_259778 ?auto_259787 ) ) ( not ( = ?auto_259778 ?auto_259788 ) ) ( not ( = ?auto_259778 ?auto_259789 ) ) ( not ( = ?auto_259778 ?auto_259790 ) ) ( not ( = ?auto_259779 ?auto_259780 ) ) ( not ( = ?auto_259779 ?auto_259781 ) ) ( not ( = ?auto_259779 ?auto_259782 ) ) ( not ( = ?auto_259779 ?auto_259783 ) ) ( not ( = ?auto_259779 ?auto_259784 ) ) ( not ( = ?auto_259779 ?auto_259785 ) ) ( not ( = ?auto_259779 ?auto_259786 ) ) ( not ( = ?auto_259779 ?auto_259787 ) ) ( not ( = ?auto_259779 ?auto_259788 ) ) ( not ( = ?auto_259779 ?auto_259789 ) ) ( not ( = ?auto_259779 ?auto_259790 ) ) ( not ( = ?auto_259780 ?auto_259781 ) ) ( not ( = ?auto_259780 ?auto_259782 ) ) ( not ( = ?auto_259780 ?auto_259783 ) ) ( not ( = ?auto_259780 ?auto_259784 ) ) ( not ( = ?auto_259780 ?auto_259785 ) ) ( not ( = ?auto_259780 ?auto_259786 ) ) ( not ( = ?auto_259780 ?auto_259787 ) ) ( not ( = ?auto_259780 ?auto_259788 ) ) ( not ( = ?auto_259780 ?auto_259789 ) ) ( not ( = ?auto_259780 ?auto_259790 ) ) ( not ( = ?auto_259781 ?auto_259782 ) ) ( not ( = ?auto_259781 ?auto_259783 ) ) ( not ( = ?auto_259781 ?auto_259784 ) ) ( not ( = ?auto_259781 ?auto_259785 ) ) ( not ( = ?auto_259781 ?auto_259786 ) ) ( not ( = ?auto_259781 ?auto_259787 ) ) ( not ( = ?auto_259781 ?auto_259788 ) ) ( not ( = ?auto_259781 ?auto_259789 ) ) ( not ( = ?auto_259781 ?auto_259790 ) ) ( not ( = ?auto_259782 ?auto_259783 ) ) ( not ( = ?auto_259782 ?auto_259784 ) ) ( not ( = ?auto_259782 ?auto_259785 ) ) ( not ( = ?auto_259782 ?auto_259786 ) ) ( not ( = ?auto_259782 ?auto_259787 ) ) ( not ( = ?auto_259782 ?auto_259788 ) ) ( not ( = ?auto_259782 ?auto_259789 ) ) ( not ( = ?auto_259782 ?auto_259790 ) ) ( not ( = ?auto_259783 ?auto_259784 ) ) ( not ( = ?auto_259783 ?auto_259785 ) ) ( not ( = ?auto_259783 ?auto_259786 ) ) ( not ( = ?auto_259783 ?auto_259787 ) ) ( not ( = ?auto_259783 ?auto_259788 ) ) ( not ( = ?auto_259783 ?auto_259789 ) ) ( not ( = ?auto_259783 ?auto_259790 ) ) ( not ( = ?auto_259784 ?auto_259785 ) ) ( not ( = ?auto_259784 ?auto_259786 ) ) ( not ( = ?auto_259784 ?auto_259787 ) ) ( not ( = ?auto_259784 ?auto_259788 ) ) ( not ( = ?auto_259784 ?auto_259789 ) ) ( not ( = ?auto_259784 ?auto_259790 ) ) ( not ( = ?auto_259785 ?auto_259786 ) ) ( not ( = ?auto_259785 ?auto_259787 ) ) ( not ( = ?auto_259785 ?auto_259788 ) ) ( not ( = ?auto_259785 ?auto_259789 ) ) ( not ( = ?auto_259785 ?auto_259790 ) ) ( not ( = ?auto_259786 ?auto_259787 ) ) ( not ( = ?auto_259786 ?auto_259788 ) ) ( not ( = ?auto_259786 ?auto_259789 ) ) ( not ( = ?auto_259786 ?auto_259790 ) ) ( not ( = ?auto_259787 ?auto_259788 ) ) ( not ( = ?auto_259787 ?auto_259789 ) ) ( not ( = ?auto_259787 ?auto_259790 ) ) ( not ( = ?auto_259788 ?auto_259789 ) ) ( not ( = ?auto_259788 ?auto_259790 ) ) ( not ( = ?auto_259789 ?auto_259790 ) ) ( CLEAR ?auto_259787 ) ( ON ?auto_259788 ?auto_259789 ) ( CLEAR ?auto_259788 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_259778 ?auto_259779 ?auto_259780 ?auto_259781 ?auto_259782 ?auto_259783 ?auto_259784 ?auto_259785 ?auto_259786 ?auto_259787 ?auto_259788 )
      ( MAKE-12PILE ?auto_259778 ?auto_259779 ?auto_259780 ?auto_259781 ?auto_259782 ?auto_259783 ?auto_259784 ?auto_259785 ?auto_259786 ?auto_259787 ?auto_259788 ?auto_259789 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_259828 - BLOCK
      ?auto_259829 - BLOCK
      ?auto_259830 - BLOCK
      ?auto_259831 - BLOCK
      ?auto_259832 - BLOCK
      ?auto_259833 - BLOCK
      ?auto_259834 - BLOCK
      ?auto_259835 - BLOCK
      ?auto_259836 - BLOCK
      ?auto_259837 - BLOCK
      ?auto_259838 - BLOCK
      ?auto_259839 - BLOCK
    )
    :vars
    (
      ?auto_259840 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_259839 ?auto_259840 ) ( ON-TABLE ?auto_259828 ) ( ON ?auto_259829 ?auto_259828 ) ( ON ?auto_259830 ?auto_259829 ) ( ON ?auto_259831 ?auto_259830 ) ( ON ?auto_259832 ?auto_259831 ) ( ON ?auto_259833 ?auto_259832 ) ( ON ?auto_259834 ?auto_259833 ) ( ON ?auto_259835 ?auto_259834 ) ( ON ?auto_259836 ?auto_259835 ) ( not ( = ?auto_259828 ?auto_259829 ) ) ( not ( = ?auto_259828 ?auto_259830 ) ) ( not ( = ?auto_259828 ?auto_259831 ) ) ( not ( = ?auto_259828 ?auto_259832 ) ) ( not ( = ?auto_259828 ?auto_259833 ) ) ( not ( = ?auto_259828 ?auto_259834 ) ) ( not ( = ?auto_259828 ?auto_259835 ) ) ( not ( = ?auto_259828 ?auto_259836 ) ) ( not ( = ?auto_259828 ?auto_259837 ) ) ( not ( = ?auto_259828 ?auto_259838 ) ) ( not ( = ?auto_259828 ?auto_259839 ) ) ( not ( = ?auto_259828 ?auto_259840 ) ) ( not ( = ?auto_259829 ?auto_259830 ) ) ( not ( = ?auto_259829 ?auto_259831 ) ) ( not ( = ?auto_259829 ?auto_259832 ) ) ( not ( = ?auto_259829 ?auto_259833 ) ) ( not ( = ?auto_259829 ?auto_259834 ) ) ( not ( = ?auto_259829 ?auto_259835 ) ) ( not ( = ?auto_259829 ?auto_259836 ) ) ( not ( = ?auto_259829 ?auto_259837 ) ) ( not ( = ?auto_259829 ?auto_259838 ) ) ( not ( = ?auto_259829 ?auto_259839 ) ) ( not ( = ?auto_259829 ?auto_259840 ) ) ( not ( = ?auto_259830 ?auto_259831 ) ) ( not ( = ?auto_259830 ?auto_259832 ) ) ( not ( = ?auto_259830 ?auto_259833 ) ) ( not ( = ?auto_259830 ?auto_259834 ) ) ( not ( = ?auto_259830 ?auto_259835 ) ) ( not ( = ?auto_259830 ?auto_259836 ) ) ( not ( = ?auto_259830 ?auto_259837 ) ) ( not ( = ?auto_259830 ?auto_259838 ) ) ( not ( = ?auto_259830 ?auto_259839 ) ) ( not ( = ?auto_259830 ?auto_259840 ) ) ( not ( = ?auto_259831 ?auto_259832 ) ) ( not ( = ?auto_259831 ?auto_259833 ) ) ( not ( = ?auto_259831 ?auto_259834 ) ) ( not ( = ?auto_259831 ?auto_259835 ) ) ( not ( = ?auto_259831 ?auto_259836 ) ) ( not ( = ?auto_259831 ?auto_259837 ) ) ( not ( = ?auto_259831 ?auto_259838 ) ) ( not ( = ?auto_259831 ?auto_259839 ) ) ( not ( = ?auto_259831 ?auto_259840 ) ) ( not ( = ?auto_259832 ?auto_259833 ) ) ( not ( = ?auto_259832 ?auto_259834 ) ) ( not ( = ?auto_259832 ?auto_259835 ) ) ( not ( = ?auto_259832 ?auto_259836 ) ) ( not ( = ?auto_259832 ?auto_259837 ) ) ( not ( = ?auto_259832 ?auto_259838 ) ) ( not ( = ?auto_259832 ?auto_259839 ) ) ( not ( = ?auto_259832 ?auto_259840 ) ) ( not ( = ?auto_259833 ?auto_259834 ) ) ( not ( = ?auto_259833 ?auto_259835 ) ) ( not ( = ?auto_259833 ?auto_259836 ) ) ( not ( = ?auto_259833 ?auto_259837 ) ) ( not ( = ?auto_259833 ?auto_259838 ) ) ( not ( = ?auto_259833 ?auto_259839 ) ) ( not ( = ?auto_259833 ?auto_259840 ) ) ( not ( = ?auto_259834 ?auto_259835 ) ) ( not ( = ?auto_259834 ?auto_259836 ) ) ( not ( = ?auto_259834 ?auto_259837 ) ) ( not ( = ?auto_259834 ?auto_259838 ) ) ( not ( = ?auto_259834 ?auto_259839 ) ) ( not ( = ?auto_259834 ?auto_259840 ) ) ( not ( = ?auto_259835 ?auto_259836 ) ) ( not ( = ?auto_259835 ?auto_259837 ) ) ( not ( = ?auto_259835 ?auto_259838 ) ) ( not ( = ?auto_259835 ?auto_259839 ) ) ( not ( = ?auto_259835 ?auto_259840 ) ) ( not ( = ?auto_259836 ?auto_259837 ) ) ( not ( = ?auto_259836 ?auto_259838 ) ) ( not ( = ?auto_259836 ?auto_259839 ) ) ( not ( = ?auto_259836 ?auto_259840 ) ) ( not ( = ?auto_259837 ?auto_259838 ) ) ( not ( = ?auto_259837 ?auto_259839 ) ) ( not ( = ?auto_259837 ?auto_259840 ) ) ( not ( = ?auto_259838 ?auto_259839 ) ) ( not ( = ?auto_259838 ?auto_259840 ) ) ( not ( = ?auto_259839 ?auto_259840 ) ) ( ON ?auto_259838 ?auto_259839 ) ( CLEAR ?auto_259836 ) ( ON ?auto_259837 ?auto_259838 ) ( CLEAR ?auto_259837 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_259828 ?auto_259829 ?auto_259830 ?auto_259831 ?auto_259832 ?auto_259833 ?auto_259834 ?auto_259835 ?auto_259836 ?auto_259837 )
      ( MAKE-12PILE ?auto_259828 ?auto_259829 ?auto_259830 ?auto_259831 ?auto_259832 ?auto_259833 ?auto_259834 ?auto_259835 ?auto_259836 ?auto_259837 ?auto_259838 ?auto_259839 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_259878 - BLOCK
      ?auto_259879 - BLOCK
      ?auto_259880 - BLOCK
      ?auto_259881 - BLOCK
      ?auto_259882 - BLOCK
      ?auto_259883 - BLOCK
      ?auto_259884 - BLOCK
      ?auto_259885 - BLOCK
      ?auto_259886 - BLOCK
      ?auto_259887 - BLOCK
      ?auto_259888 - BLOCK
      ?auto_259889 - BLOCK
    )
    :vars
    (
      ?auto_259890 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_259889 ?auto_259890 ) ( ON-TABLE ?auto_259878 ) ( ON ?auto_259879 ?auto_259878 ) ( ON ?auto_259880 ?auto_259879 ) ( ON ?auto_259881 ?auto_259880 ) ( ON ?auto_259882 ?auto_259881 ) ( ON ?auto_259883 ?auto_259882 ) ( ON ?auto_259884 ?auto_259883 ) ( ON ?auto_259885 ?auto_259884 ) ( not ( = ?auto_259878 ?auto_259879 ) ) ( not ( = ?auto_259878 ?auto_259880 ) ) ( not ( = ?auto_259878 ?auto_259881 ) ) ( not ( = ?auto_259878 ?auto_259882 ) ) ( not ( = ?auto_259878 ?auto_259883 ) ) ( not ( = ?auto_259878 ?auto_259884 ) ) ( not ( = ?auto_259878 ?auto_259885 ) ) ( not ( = ?auto_259878 ?auto_259886 ) ) ( not ( = ?auto_259878 ?auto_259887 ) ) ( not ( = ?auto_259878 ?auto_259888 ) ) ( not ( = ?auto_259878 ?auto_259889 ) ) ( not ( = ?auto_259878 ?auto_259890 ) ) ( not ( = ?auto_259879 ?auto_259880 ) ) ( not ( = ?auto_259879 ?auto_259881 ) ) ( not ( = ?auto_259879 ?auto_259882 ) ) ( not ( = ?auto_259879 ?auto_259883 ) ) ( not ( = ?auto_259879 ?auto_259884 ) ) ( not ( = ?auto_259879 ?auto_259885 ) ) ( not ( = ?auto_259879 ?auto_259886 ) ) ( not ( = ?auto_259879 ?auto_259887 ) ) ( not ( = ?auto_259879 ?auto_259888 ) ) ( not ( = ?auto_259879 ?auto_259889 ) ) ( not ( = ?auto_259879 ?auto_259890 ) ) ( not ( = ?auto_259880 ?auto_259881 ) ) ( not ( = ?auto_259880 ?auto_259882 ) ) ( not ( = ?auto_259880 ?auto_259883 ) ) ( not ( = ?auto_259880 ?auto_259884 ) ) ( not ( = ?auto_259880 ?auto_259885 ) ) ( not ( = ?auto_259880 ?auto_259886 ) ) ( not ( = ?auto_259880 ?auto_259887 ) ) ( not ( = ?auto_259880 ?auto_259888 ) ) ( not ( = ?auto_259880 ?auto_259889 ) ) ( not ( = ?auto_259880 ?auto_259890 ) ) ( not ( = ?auto_259881 ?auto_259882 ) ) ( not ( = ?auto_259881 ?auto_259883 ) ) ( not ( = ?auto_259881 ?auto_259884 ) ) ( not ( = ?auto_259881 ?auto_259885 ) ) ( not ( = ?auto_259881 ?auto_259886 ) ) ( not ( = ?auto_259881 ?auto_259887 ) ) ( not ( = ?auto_259881 ?auto_259888 ) ) ( not ( = ?auto_259881 ?auto_259889 ) ) ( not ( = ?auto_259881 ?auto_259890 ) ) ( not ( = ?auto_259882 ?auto_259883 ) ) ( not ( = ?auto_259882 ?auto_259884 ) ) ( not ( = ?auto_259882 ?auto_259885 ) ) ( not ( = ?auto_259882 ?auto_259886 ) ) ( not ( = ?auto_259882 ?auto_259887 ) ) ( not ( = ?auto_259882 ?auto_259888 ) ) ( not ( = ?auto_259882 ?auto_259889 ) ) ( not ( = ?auto_259882 ?auto_259890 ) ) ( not ( = ?auto_259883 ?auto_259884 ) ) ( not ( = ?auto_259883 ?auto_259885 ) ) ( not ( = ?auto_259883 ?auto_259886 ) ) ( not ( = ?auto_259883 ?auto_259887 ) ) ( not ( = ?auto_259883 ?auto_259888 ) ) ( not ( = ?auto_259883 ?auto_259889 ) ) ( not ( = ?auto_259883 ?auto_259890 ) ) ( not ( = ?auto_259884 ?auto_259885 ) ) ( not ( = ?auto_259884 ?auto_259886 ) ) ( not ( = ?auto_259884 ?auto_259887 ) ) ( not ( = ?auto_259884 ?auto_259888 ) ) ( not ( = ?auto_259884 ?auto_259889 ) ) ( not ( = ?auto_259884 ?auto_259890 ) ) ( not ( = ?auto_259885 ?auto_259886 ) ) ( not ( = ?auto_259885 ?auto_259887 ) ) ( not ( = ?auto_259885 ?auto_259888 ) ) ( not ( = ?auto_259885 ?auto_259889 ) ) ( not ( = ?auto_259885 ?auto_259890 ) ) ( not ( = ?auto_259886 ?auto_259887 ) ) ( not ( = ?auto_259886 ?auto_259888 ) ) ( not ( = ?auto_259886 ?auto_259889 ) ) ( not ( = ?auto_259886 ?auto_259890 ) ) ( not ( = ?auto_259887 ?auto_259888 ) ) ( not ( = ?auto_259887 ?auto_259889 ) ) ( not ( = ?auto_259887 ?auto_259890 ) ) ( not ( = ?auto_259888 ?auto_259889 ) ) ( not ( = ?auto_259888 ?auto_259890 ) ) ( not ( = ?auto_259889 ?auto_259890 ) ) ( ON ?auto_259888 ?auto_259889 ) ( ON ?auto_259887 ?auto_259888 ) ( CLEAR ?auto_259885 ) ( ON ?auto_259886 ?auto_259887 ) ( CLEAR ?auto_259886 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_259878 ?auto_259879 ?auto_259880 ?auto_259881 ?auto_259882 ?auto_259883 ?auto_259884 ?auto_259885 ?auto_259886 )
      ( MAKE-12PILE ?auto_259878 ?auto_259879 ?auto_259880 ?auto_259881 ?auto_259882 ?auto_259883 ?auto_259884 ?auto_259885 ?auto_259886 ?auto_259887 ?auto_259888 ?auto_259889 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_259928 - BLOCK
      ?auto_259929 - BLOCK
      ?auto_259930 - BLOCK
      ?auto_259931 - BLOCK
      ?auto_259932 - BLOCK
      ?auto_259933 - BLOCK
      ?auto_259934 - BLOCK
      ?auto_259935 - BLOCK
      ?auto_259936 - BLOCK
      ?auto_259937 - BLOCK
      ?auto_259938 - BLOCK
      ?auto_259939 - BLOCK
    )
    :vars
    (
      ?auto_259940 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_259939 ?auto_259940 ) ( ON-TABLE ?auto_259928 ) ( ON ?auto_259929 ?auto_259928 ) ( ON ?auto_259930 ?auto_259929 ) ( ON ?auto_259931 ?auto_259930 ) ( ON ?auto_259932 ?auto_259931 ) ( ON ?auto_259933 ?auto_259932 ) ( ON ?auto_259934 ?auto_259933 ) ( not ( = ?auto_259928 ?auto_259929 ) ) ( not ( = ?auto_259928 ?auto_259930 ) ) ( not ( = ?auto_259928 ?auto_259931 ) ) ( not ( = ?auto_259928 ?auto_259932 ) ) ( not ( = ?auto_259928 ?auto_259933 ) ) ( not ( = ?auto_259928 ?auto_259934 ) ) ( not ( = ?auto_259928 ?auto_259935 ) ) ( not ( = ?auto_259928 ?auto_259936 ) ) ( not ( = ?auto_259928 ?auto_259937 ) ) ( not ( = ?auto_259928 ?auto_259938 ) ) ( not ( = ?auto_259928 ?auto_259939 ) ) ( not ( = ?auto_259928 ?auto_259940 ) ) ( not ( = ?auto_259929 ?auto_259930 ) ) ( not ( = ?auto_259929 ?auto_259931 ) ) ( not ( = ?auto_259929 ?auto_259932 ) ) ( not ( = ?auto_259929 ?auto_259933 ) ) ( not ( = ?auto_259929 ?auto_259934 ) ) ( not ( = ?auto_259929 ?auto_259935 ) ) ( not ( = ?auto_259929 ?auto_259936 ) ) ( not ( = ?auto_259929 ?auto_259937 ) ) ( not ( = ?auto_259929 ?auto_259938 ) ) ( not ( = ?auto_259929 ?auto_259939 ) ) ( not ( = ?auto_259929 ?auto_259940 ) ) ( not ( = ?auto_259930 ?auto_259931 ) ) ( not ( = ?auto_259930 ?auto_259932 ) ) ( not ( = ?auto_259930 ?auto_259933 ) ) ( not ( = ?auto_259930 ?auto_259934 ) ) ( not ( = ?auto_259930 ?auto_259935 ) ) ( not ( = ?auto_259930 ?auto_259936 ) ) ( not ( = ?auto_259930 ?auto_259937 ) ) ( not ( = ?auto_259930 ?auto_259938 ) ) ( not ( = ?auto_259930 ?auto_259939 ) ) ( not ( = ?auto_259930 ?auto_259940 ) ) ( not ( = ?auto_259931 ?auto_259932 ) ) ( not ( = ?auto_259931 ?auto_259933 ) ) ( not ( = ?auto_259931 ?auto_259934 ) ) ( not ( = ?auto_259931 ?auto_259935 ) ) ( not ( = ?auto_259931 ?auto_259936 ) ) ( not ( = ?auto_259931 ?auto_259937 ) ) ( not ( = ?auto_259931 ?auto_259938 ) ) ( not ( = ?auto_259931 ?auto_259939 ) ) ( not ( = ?auto_259931 ?auto_259940 ) ) ( not ( = ?auto_259932 ?auto_259933 ) ) ( not ( = ?auto_259932 ?auto_259934 ) ) ( not ( = ?auto_259932 ?auto_259935 ) ) ( not ( = ?auto_259932 ?auto_259936 ) ) ( not ( = ?auto_259932 ?auto_259937 ) ) ( not ( = ?auto_259932 ?auto_259938 ) ) ( not ( = ?auto_259932 ?auto_259939 ) ) ( not ( = ?auto_259932 ?auto_259940 ) ) ( not ( = ?auto_259933 ?auto_259934 ) ) ( not ( = ?auto_259933 ?auto_259935 ) ) ( not ( = ?auto_259933 ?auto_259936 ) ) ( not ( = ?auto_259933 ?auto_259937 ) ) ( not ( = ?auto_259933 ?auto_259938 ) ) ( not ( = ?auto_259933 ?auto_259939 ) ) ( not ( = ?auto_259933 ?auto_259940 ) ) ( not ( = ?auto_259934 ?auto_259935 ) ) ( not ( = ?auto_259934 ?auto_259936 ) ) ( not ( = ?auto_259934 ?auto_259937 ) ) ( not ( = ?auto_259934 ?auto_259938 ) ) ( not ( = ?auto_259934 ?auto_259939 ) ) ( not ( = ?auto_259934 ?auto_259940 ) ) ( not ( = ?auto_259935 ?auto_259936 ) ) ( not ( = ?auto_259935 ?auto_259937 ) ) ( not ( = ?auto_259935 ?auto_259938 ) ) ( not ( = ?auto_259935 ?auto_259939 ) ) ( not ( = ?auto_259935 ?auto_259940 ) ) ( not ( = ?auto_259936 ?auto_259937 ) ) ( not ( = ?auto_259936 ?auto_259938 ) ) ( not ( = ?auto_259936 ?auto_259939 ) ) ( not ( = ?auto_259936 ?auto_259940 ) ) ( not ( = ?auto_259937 ?auto_259938 ) ) ( not ( = ?auto_259937 ?auto_259939 ) ) ( not ( = ?auto_259937 ?auto_259940 ) ) ( not ( = ?auto_259938 ?auto_259939 ) ) ( not ( = ?auto_259938 ?auto_259940 ) ) ( not ( = ?auto_259939 ?auto_259940 ) ) ( ON ?auto_259938 ?auto_259939 ) ( ON ?auto_259937 ?auto_259938 ) ( ON ?auto_259936 ?auto_259937 ) ( CLEAR ?auto_259934 ) ( ON ?auto_259935 ?auto_259936 ) ( CLEAR ?auto_259935 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_259928 ?auto_259929 ?auto_259930 ?auto_259931 ?auto_259932 ?auto_259933 ?auto_259934 ?auto_259935 )
      ( MAKE-12PILE ?auto_259928 ?auto_259929 ?auto_259930 ?auto_259931 ?auto_259932 ?auto_259933 ?auto_259934 ?auto_259935 ?auto_259936 ?auto_259937 ?auto_259938 ?auto_259939 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_259978 - BLOCK
      ?auto_259979 - BLOCK
      ?auto_259980 - BLOCK
      ?auto_259981 - BLOCK
      ?auto_259982 - BLOCK
      ?auto_259983 - BLOCK
      ?auto_259984 - BLOCK
      ?auto_259985 - BLOCK
      ?auto_259986 - BLOCK
      ?auto_259987 - BLOCK
      ?auto_259988 - BLOCK
      ?auto_259989 - BLOCK
    )
    :vars
    (
      ?auto_259990 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_259989 ?auto_259990 ) ( ON-TABLE ?auto_259978 ) ( ON ?auto_259979 ?auto_259978 ) ( ON ?auto_259980 ?auto_259979 ) ( ON ?auto_259981 ?auto_259980 ) ( ON ?auto_259982 ?auto_259981 ) ( ON ?auto_259983 ?auto_259982 ) ( not ( = ?auto_259978 ?auto_259979 ) ) ( not ( = ?auto_259978 ?auto_259980 ) ) ( not ( = ?auto_259978 ?auto_259981 ) ) ( not ( = ?auto_259978 ?auto_259982 ) ) ( not ( = ?auto_259978 ?auto_259983 ) ) ( not ( = ?auto_259978 ?auto_259984 ) ) ( not ( = ?auto_259978 ?auto_259985 ) ) ( not ( = ?auto_259978 ?auto_259986 ) ) ( not ( = ?auto_259978 ?auto_259987 ) ) ( not ( = ?auto_259978 ?auto_259988 ) ) ( not ( = ?auto_259978 ?auto_259989 ) ) ( not ( = ?auto_259978 ?auto_259990 ) ) ( not ( = ?auto_259979 ?auto_259980 ) ) ( not ( = ?auto_259979 ?auto_259981 ) ) ( not ( = ?auto_259979 ?auto_259982 ) ) ( not ( = ?auto_259979 ?auto_259983 ) ) ( not ( = ?auto_259979 ?auto_259984 ) ) ( not ( = ?auto_259979 ?auto_259985 ) ) ( not ( = ?auto_259979 ?auto_259986 ) ) ( not ( = ?auto_259979 ?auto_259987 ) ) ( not ( = ?auto_259979 ?auto_259988 ) ) ( not ( = ?auto_259979 ?auto_259989 ) ) ( not ( = ?auto_259979 ?auto_259990 ) ) ( not ( = ?auto_259980 ?auto_259981 ) ) ( not ( = ?auto_259980 ?auto_259982 ) ) ( not ( = ?auto_259980 ?auto_259983 ) ) ( not ( = ?auto_259980 ?auto_259984 ) ) ( not ( = ?auto_259980 ?auto_259985 ) ) ( not ( = ?auto_259980 ?auto_259986 ) ) ( not ( = ?auto_259980 ?auto_259987 ) ) ( not ( = ?auto_259980 ?auto_259988 ) ) ( not ( = ?auto_259980 ?auto_259989 ) ) ( not ( = ?auto_259980 ?auto_259990 ) ) ( not ( = ?auto_259981 ?auto_259982 ) ) ( not ( = ?auto_259981 ?auto_259983 ) ) ( not ( = ?auto_259981 ?auto_259984 ) ) ( not ( = ?auto_259981 ?auto_259985 ) ) ( not ( = ?auto_259981 ?auto_259986 ) ) ( not ( = ?auto_259981 ?auto_259987 ) ) ( not ( = ?auto_259981 ?auto_259988 ) ) ( not ( = ?auto_259981 ?auto_259989 ) ) ( not ( = ?auto_259981 ?auto_259990 ) ) ( not ( = ?auto_259982 ?auto_259983 ) ) ( not ( = ?auto_259982 ?auto_259984 ) ) ( not ( = ?auto_259982 ?auto_259985 ) ) ( not ( = ?auto_259982 ?auto_259986 ) ) ( not ( = ?auto_259982 ?auto_259987 ) ) ( not ( = ?auto_259982 ?auto_259988 ) ) ( not ( = ?auto_259982 ?auto_259989 ) ) ( not ( = ?auto_259982 ?auto_259990 ) ) ( not ( = ?auto_259983 ?auto_259984 ) ) ( not ( = ?auto_259983 ?auto_259985 ) ) ( not ( = ?auto_259983 ?auto_259986 ) ) ( not ( = ?auto_259983 ?auto_259987 ) ) ( not ( = ?auto_259983 ?auto_259988 ) ) ( not ( = ?auto_259983 ?auto_259989 ) ) ( not ( = ?auto_259983 ?auto_259990 ) ) ( not ( = ?auto_259984 ?auto_259985 ) ) ( not ( = ?auto_259984 ?auto_259986 ) ) ( not ( = ?auto_259984 ?auto_259987 ) ) ( not ( = ?auto_259984 ?auto_259988 ) ) ( not ( = ?auto_259984 ?auto_259989 ) ) ( not ( = ?auto_259984 ?auto_259990 ) ) ( not ( = ?auto_259985 ?auto_259986 ) ) ( not ( = ?auto_259985 ?auto_259987 ) ) ( not ( = ?auto_259985 ?auto_259988 ) ) ( not ( = ?auto_259985 ?auto_259989 ) ) ( not ( = ?auto_259985 ?auto_259990 ) ) ( not ( = ?auto_259986 ?auto_259987 ) ) ( not ( = ?auto_259986 ?auto_259988 ) ) ( not ( = ?auto_259986 ?auto_259989 ) ) ( not ( = ?auto_259986 ?auto_259990 ) ) ( not ( = ?auto_259987 ?auto_259988 ) ) ( not ( = ?auto_259987 ?auto_259989 ) ) ( not ( = ?auto_259987 ?auto_259990 ) ) ( not ( = ?auto_259988 ?auto_259989 ) ) ( not ( = ?auto_259988 ?auto_259990 ) ) ( not ( = ?auto_259989 ?auto_259990 ) ) ( ON ?auto_259988 ?auto_259989 ) ( ON ?auto_259987 ?auto_259988 ) ( ON ?auto_259986 ?auto_259987 ) ( ON ?auto_259985 ?auto_259986 ) ( CLEAR ?auto_259983 ) ( ON ?auto_259984 ?auto_259985 ) ( CLEAR ?auto_259984 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_259978 ?auto_259979 ?auto_259980 ?auto_259981 ?auto_259982 ?auto_259983 ?auto_259984 )
      ( MAKE-12PILE ?auto_259978 ?auto_259979 ?auto_259980 ?auto_259981 ?auto_259982 ?auto_259983 ?auto_259984 ?auto_259985 ?auto_259986 ?auto_259987 ?auto_259988 ?auto_259989 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_260028 - BLOCK
      ?auto_260029 - BLOCK
      ?auto_260030 - BLOCK
      ?auto_260031 - BLOCK
      ?auto_260032 - BLOCK
      ?auto_260033 - BLOCK
      ?auto_260034 - BLOCK
      ?auto_260035 - BLOCK
      ?auto_260036 - BLOCK
      ?auto_260037 - BLOCK
      ?auto_260038 - BLOCK
      ?auto_260039 - BLOCK
    )
    :vars
    (
      ?auto_260040 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_260039 ?auto_260040 ) ( ON-TABLE ?auto_260028 ) ( ON ?auto_260029 ?auto_260028 ) ( ON ?auto_260030 ?auto_260029 ) ( ON ?auto_260031 ?auto_260030 ) ( ON ?auto_260032 ?auto_260031 ) ( not ( = ?auto_260028 ?auto_260029 ) ) ( not ( = ?auto_260028 ?auto_260030 ) ) ( not ( = ?auto_260028 ?auto_260031 ) ) ( not ( = ?auto_260028 ?auto_260032 ) ) ( not ( = ?auto_260028 ?auto_260033 ) ) ( not ( = ?auto_260028 ?auto_260034 ) ) ( not ( = ?auto_260028 ?auto_260035 ) ) ( not ( = ?auto_260028 ?auto_260036 ) ) ( not ( = ?auto_260028 ?auto_260037 ) ) ( not ( = ?auto_260028 ?auto_260038 ) ) ( not ( = ?auto_260028 ?auto_260039 ) ) ( not ( = ?auto_260028 ?auto_260040 ) ) ( not ( = ?auto_260029 ?auto_260030 ) ) ( not ( = ?auto_260029 ?auto_260031 ) ) ( not ( = ?auto_260029 ?auto_260032 ) ) ( not ( = ?auto_260029 ?auto_260033 ) ) ( not ( = ?auto_260029 ?auto_260034 ) ) ( not ( = ?auto_260029 ?auto_260035 ) ) ( not ( = ?auto_260029 ?auto_260036 ) ) ( not ( = ?auto_260029 ?auto_260037 ) ) ( not ( = ?auto_260029 ?auto_260038 ) ) ( not ( = ?auto_260029 ?auto_260039 ) ) ( not ( = ?auto_260029 ?auto_260040 ) ) ( not ( = ?auto_260030 ?auto_260031 ) ) ( not ( = ?auto_260030 ?auto_260032 ) ) ( not ( = ?auto_260030 ?auto_260033 ) ) ( not ( = ?auto_260030 ?auto_260034 ) ) ( not ( = ?auto_260030 ?auto_260035 ) ) ( not ( = ?auto_260030 ?auto_260036 ) ) ( not ( = ?auto_260030 ?auto_260037 ) ) ( not ( = ?auto_260030 ?auto_260038 ) ) ( not ( = ?auto_260030 ?auto_260039 ) ) ( not ( = ?auto_260030 ?auto_260040 ) ) ( not ( = ?auto_260031 ?auto_260032 ) ) ( not ( = ?auto_260031 ?auto_260033 ) ) ( not ( = ?auto_260031 ?auto_260034 ) ) ( not ( = ?auto_260031 ?auto_260035 ) ) ( not ( = ?auto_260031 ?auto_260036 ) ) ( not ( = ?auto_260031 ?auto_260037 ) ) ( not ( = ?auto_260031 ?auto_260038 ) ) ( not ( = ?auto_260031 ?auto_260039 ) ) ( not ( = ?auto_260031 ?auto_260040 ) ) ( not ( = ?auto_260032 ?auto_260033 ) ) ( not ( = ?auto_260032 ?auto_260034 ) ) ( not ( = ?auto_260032 ?auto_260035 ) ) ( not ( = ?auto_260032 ?auto_260036 ) ) ( not ( = ?auto_260032 ?auto_260037 ) ) ( not ( = ?auto_260032 ?auto_260038 ) ) ( not ( = ?auto_260032 ?auto_260039 ) ) ( not ( = ?auto_260032 ?auto_260040 ) ) ( not ( = ?auto_260033 ?auto_260034 ) ) ( not ( = ?auto_260033 ?auto_260035 ) ) ( not ( = ?auto_260033 ?auto_260036 ) ) ( not ( = ?auto_260033 ?auto_260037 ) ) ( not ( = ?auto_260033 ?auto_260038 ) ) ( not ( = ?auto_260033 ?auto_260039 ) ) ( not ( = ?auto_260033 ?auto_260040 ) ) ( not ( = ?auto_260034 ?auto_260035 ) ) ( not ( = ?auto_260034 ?auto_260036 ) ) ( not ( = ?auto_260034 ?auto_260037 ) ) ( not ( = ?auto_260034 ?auto_260038 ) ) ( not ( = ?auto_260034 ?auto_260039 ) ) ( not ( = ?auto_260034 ?auto_260040 ) ) ( not ( = ?auto_260035 ?auto_260036 ) ) ( not ( = ?auto_260035 ?auto_260037 ) ) ( not ( = ?auto_260035 ?auto_260038 ) ) ( not ( = ?auto_260035 ?auto_260039 ) ) ( not ( = ?auto_260035 ?auto_260040 ) ) ( not ( = ?auto_260036 ?auto_260037 ) ) ( not ( = ?auto_260036 ?auto_260038 ) ) ( not ( = ?auto_260036 ?auto_260039 ) ) ( not ( = ?auto_260036 ?auto_260040 ) ) ( not ( = ?auto_260037 ?auto_260038 ) ) ( not ( = ?auto_260037 ?auto_260039 ) ) ( not ( = ?auto_260037 ?auto_260040 ) ) ( not ( = ?auto_260038 ?auto_260039 ) ) ( not ( = ?auto_260038 ?auto_260040 ) ) ( not ( = ?auto_260039 ?auto_260040 ) ) ( ON ?auto_260038 ?auto_260039 ) ( ON ?auto_260037 ?auto_260038 ) ( ON ?auto_260036 ?auto_260037 ) ( ON ?auto_260035 ?auto_260036 ) ( ON ?auto_260034 ?auto_260035 ) ( CLEAR ?auto_260032 ) ( ON ?auto_260033 ?auto_260034 ) ( CLEAR ?auto_260033 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_260028 ?auto_260029 ?auto_260030 ?auto_260031 ?auto_260032 ?auto_260033 )
      ( MAKE-12PILE ?auto_260028 ?auto_260029 ?auto_260030 ?auto_260031 ?auto_260032 ?auto_260033 ?auto_260034 ?auto_260035 ?auto_260036 ?auto_260037 ?auto_260038 ?auto_260039 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_260078 - BLOCK
      ?auto_260079 - BLOCK
      ?auto_260080 - BLOCK
      ?auto_260081 - BLOCK
      ?auto_260082 - BLOCK
      ?auto_260083 - BLOCK
      ?auto_260084 - BLOCK
      ?auto_260085 - BLOCK
      ?auto_260086 - BLOCK
      ?auto_260087 - BLOCK
      ?auto_260088 - BLOCK
      ?auto_260089 - BLOCK
    )
    :vars
    (
      ?auto_260090 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_260089 ?auto_260090 ) ( ON-TABLE ?auto_260078 ) ( ON ?auto_260079 ?auto_260078 ) ( ON ?auto_260080 ?auto_260079 ) ( ON ?auto_260081 ?auto_260080 ) ( not ( = ?auto_260078 ?auto_260079 ) ) ( not ( = ?auto_260078 ?auto_260080 ) ) ( not ( = ?auto_260078 ?auto_260081 ) ) ( not ( = ?auto_260078 ?auto_260082 ) ) ( not ( = ?auto_260078 ?auto_260083 ) ) ( not ( = ?auto_260078 ?auto_260084 ) ) ( not ( = ?auto_260078 ?auto_260085 ) ) ( not ( = ?auto_260078 ?auto_260086 ) ) ( not ( = ?auto_260078 ?auto_260087 ) ) ( not ( = ?auto_260078 ?auto_260088 ) ) ( not ( = ?auto_260078 ?auto_260089 ) ) ( not ( = ?auto_260078 ?auto_260090 ) ) ( not ( = ?auto_260079 ?auto_260080 ) ) ( not ( = ?auto_260079 ?auto_260081 ) ) ( not ( = ?auto_260079 ?auto_260082 ) ) ( not ( = ?auto_260079 ?auto_260083 ) ) ( not ( = ?auto_260079 ?auto_260084 ) ) ( not ( = ?auto_260079 ?auto_260085 ) ) ( not ( = ?auto_260079 ?auto_260086 ) ) ( not ( = ?auto_260079 ?auto_260087 ) ) ( not ( = ?auto_260079 ?auto_260088 ) ) ( not ( = ?auto_260079 ?auto_260089 ) ) ( not ( = ?auto_260079 ?auto_260090 ) ) ( not ( = ?auto_260080 ?auto_260081 ) ) ( not ( = ?auto_260080 ?auto_260082 ) ) ( not ( = ?auto_260080 ?auto_260083 ) ) ( not ( = ?auto_260080 ?auto_260084 ) ) ( not ( = ?auto_260080 ?auto_260085 ) ) ( not ( = ?auto_260080 ?auto_260086 ) ) ( not ( = ?auto_260080 ?auto_260087 ) ) ( not ( = ?auto_260080 ?auto_260088 ) ) ( not ( = ?auto_260080 ?auto_260089 ) ) ( not ( = ?auto_260080 ?auto_260090 ) ) ( not ( = ?auto_260081 ?auto_260082 ) ) ( not ( = ?auto_260081 ?auto_260083 ) ) ( not ( = ?auto_260081 ?auto_260084 ) ) ( not ( = ?auto_260081 ?auto_260085 ) ) ( not ( = ?auto_260081 ?auto_260086 ) ) ( not ( = ?auto_260081 ?auto_260087 ) ) ( not ( = ?auto_260081 ?auto_260088 ) ) ( not ( = ?auto_260081 ?auto_260089 ) ) ( not ( = ?auto_260081 ?auto_260090 ) ) ( not ( = ?auto_260082 ?auto_260083 ) ) ( not ( = ?auto_260082 ?auto_260084 ) ) ( not ( = ?auto_260082 ?auto_260085 ) ) ( not ( = ?auto_260082 ?auto_260086 ) ) ( not ( = ?auto_260082 ?auto_260087 ) ) ( not ( = ?auto_260082 ?auto_260088 ) ) ( not ( = ?auto_260082 ?auto_260089 ) ) ( not ( = ?auto_260082 ?auto_260090 ) ) ( not ( = ?auto_260083 ?auto_260084 ) ) ( not ( = ?auto_260083 ?auto_260085 ) ) ( not ( = ?auto_260083 ?auto_260086 ) ) ( not ( = ?auto_260083 ?auto_260087 ) ) ( not ( = ?auto_260083 ?auto_260088 ) ) ( not ( = ?auto_260083 ?auto_260089 ) ) ( not ( = ?auto_260083 ?auto_260090 ) ) ( not ( = ?auto_260084 ?auto_260085 ) ) ( not ( = ?auto_260084 ?auto_260086 ) ) ( not ( = ?auto_260084 ?auto_260087 ) ) ( not ( = ?auto_260084 ?auto_260088 ) ) ( not ( = ?auto_260084 ?auto_260089 ) ) ( not ( = ?auto_260084 ?auto_260090 ) ) ( not ( = ?auto_260085 ?auto_260086 ) ) ( not ( = ?auto_260085 ?auto_260087 ) ) ( not ( = ?auto_260085 ?auto_260088 ) ) ( not ( = ?auto_260085 ?auto_260089 ) ) ( not ( = ?auto_260085 ?auto_260090 ) ) ( not ( = ?auto_260086 ?auto_260087 ) ) ( not ( = ?auto_260086 ?auto_260088 ) ) ( not ( = ?auto_260086 ?auto_260089 ) ) ( not ( = ?auto_260086 ?auto_260090 ) ) ( not ( = ?auto_260087 ?auto_260088 ) ) ( not ( = ?auto_260087 ?auto_260089 ) ) ( not ( = ?auto_260087 ?auto_260090 ) ) ( not ( = ?auto_260088 ?auto_260089 ) ) ( not ( = ?auto_260088 ?auto_260090 ) ) ( not ( = ?auto_260089 ?auto_260090 ) ) ( ON ?auto_260088 ?auto_260089 ) ( ON ?auto_260087 ?auto_260088 ) ( ON ?auto_260086 ?auto_260087 ) ( ON ?auto_260085 ?auto_260086 ) ( ON ?auto_260084 ?auto_260085 ) ( ON ?auto_260083 ?auto_260084 ) ( CLEAR ?auto_260081 ) ( ON ?auto_260082 ?auto_260083 ) ( CLEAR ?auto_260082 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_260078 ?auto_260079 ?auto_260080 ?auto_260081 ?auto_260082 )
      ( MAKE-12PILE ?auto_260078 ?auto_260079 ?auto_260080 ?auto_260081 ?auto_260082 ?auto_260083 ?auto_260084 ?auto_260085 ?auto_260086 ?auto_260087 ?auto_260088 ?auto_260089 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_260128 - BLOCK
      ?auto_260129 - BLOCK
      ?auto_260130 - BLOCK
      ?auto_260131 - BLOCK
      ?auto_260132 - BLOCK
      ?auto_260133 - BLOCK
      ?auto_260134 - BLOCK
      ?auto_260135 - BLOCK
      ?auto_260136 - BLOCK
      ?auto_260137 - BLOCK
      ?auto_260138 - BLOCK
      ?auto_260139 - BLOCK
    )
    :vars
    (
      ?auto_260140 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_260139 ?auto_260140 ) ( ON-TABLE ?auto_260128 ) ( ON ?auto_260129 ?auto_260128 ) ( ON ?auto_260130 ?auto_260129 ) ( not ( = ?auto_260128 ?auto_260129 ) ) ( not ( = ?auto_260128 ?auto_260130 ) ) ( not ( = ?auto_260128 ?auto_260131 ) ) ( not ( = ?auto_260128 ?auto_260132 ) ) ( not ( = ?auto_260128 ?auto_260133 ) ) ( not ( = ?auto_260128 ?auto_260134 ) ) ( not ( = ?auto_260128 ?auto_260135 ) ) ( not ( = ?auto_260128 ?auto_260136 ) ) ( not ( = ?auto_260128 ?auto_260137 ) ) ( not ( = ?auto_260128 ?auto_260138 ) ) ( not ( = ?auto_260128 ?auto_260139 ) ) ( not ( = ?auto_260128 ?auto_260140 ) ) ( not ( = ?auto_260129 ?auto_260130 ) ) ( not ( = ?auto_260129 ?auto_260131 ) ) ( not ( = ?auto_260129 ?auto_260132 ) ) ( not ( = ?auto_260129 ?auto_260133 ) ) ( not ( = ?auto_260129 ?auto_260134 ) ) ( not ( = ?auto_260129 ?auto_260135 ) ) ( not ( = ?auto_260129 ?auto_260136 ) ) ( not ( = ?auto_260129 ?auto_260137 ) ) ( not ( = ?auto_260129 ?auto_260138 ) ) ( not ( = ?auto_260129 ?auto_260139 ) ) ( not ( = ?auto_260129 ?auto_260140 ) ) ( not ( = ?auto_260130 ?auto_260131 ) ) ( not ( = ?auto_260130 ?auto_260132 ) ) ( not ( = ?auto_260130 ?auto_260133 ) ) ( not ( = ?auto_260130 ?auto_260134 ) ) ( not ( = ?auto_260130 ?auto_260135 ) ) ( not ( = ?auto_260130 ?auto_260136 ) ) ( not ( = ?auto_260130 ?auto_260137 ) ) ( not ( = ?auto_260130 ?auto_260138 ) ) ( not ( = ?auto_260130 ?auto_260139 ) ) ( not ( = ?auto_260130 ?auto_260140 ) ) ( not ( = ?auto_260131 ?auto_260132 ) ) ( not ( = ?auto_260131 ?auto_260133 ) ) ( not ( = ?auto_260131 ?auto_260134 ) ) ( not ( = ?auto_260131 ?auto_260135 ) ) ( not ( = ?auto_260131 ?auto_260136 ) ) ( not ( = ?auto_260131 ?auto_260137 ) ) ( not ( = ?auto_260131 ?auto_260138 ) ) ( not ( = ?auto_260131 ?auto_260139 ) ) ( not ( = ?auto_260131 ?auto_260140 ) ) ( not ( = ?auto_260132 ?auto_260133 ) ) ( not ( = ?auto_260132 ?auto_260134 ) ) ( not ( = ?auto_260132 ?auto_260135 ) ) ( not ( = ?auto_260132 ?auto_260136 ) ) ( not ( = ?auto_260132 ?auto_260137 ) ) ( not ( = ?auto_260132 ?auto_260138 ) ) ( not ( = ?auto_260132 ?auto_260139 ) ) ( not ( = ?auto_260132 ?auto_260140 ) ) ( not ( = ?auto_260133 ?auto_260134 ) ) ( not ( = ?auto_260133 ?auto_260135 ) ) ( not ( = ?auto_260133 ?auto_260136 ) ) ( not ( = ?auto_260133 ?auto_260137 ) ) ( not ( = ?auto_260133 ?auto_260138 ) ) ( not ( = ?auto_260133 ?auto_260139 ) ) ( not ( = ?auto_260133 ?auto_260140 ) ) ( not ( = ?auto_260134 ?auto_260135 ) ) ( not ( = ?auto_260134 ?auto_260136 ) ) ( not ( = ?auto_260134 ?auto_260137 ) ) ( not ( = ?auto_260134 ?auto_260138 ) ) ( not ( = ?auto_260134 ?auto_260139 ) ) ( not ( = ?auto_260134 ?auto_260140 ) ) ( not ( = ?auto_260135 ?auto_260136 ) ) ( not ( = ?auto_260135 ?auto_260137 ) ) ( not ( = ?auto_260135 ?auto_260138 ) ) ( not ( = ?auto_260135 ?auto_260139 ) ) ( not ( = ?auto_260135 ?auto_260140 ) ) ( not ( = ?auto_260136 ?auto_260137 ) ) ( not ( = ?auto_260136 ?auto_260138 ) ) ( not ( = ?auto_260136 ?auto_260139 ) ) ( not ( = ?auto_260136 ?auto_260140 ) ) ( not ( = ?auto_260137 ?auto_260138 ) ) ( not ( = ?auto_260137 ?auto_260139 ) ) ( not ( = ?auto_260137 ?auto_260140 ) ) ( not ( = ?auto_260138 ?auto_260139 ) ) ( not ( = ?auto_260138 ?auto_260140 ) ) ( not ( = ?auto_260139 ?auto_260140 ) ) ( ON ?auto_260138 ?auto_260139 ) ( ON ?auto_260137 ?auto_260138 ) ( ON ?auto_260136 ?auto_260137 ) ( ON ?auto_260135 ?auto_260136 ) ( ON ?auto_260134 ?auto_260135 ) ( ON ?auto_260133 ?auto_260134 ) ( ON ?auto_260132 ?auto_260133 ) ( CLEAR ?auto_260130 ) ( ON ?auto_260131 ?auto_260132 ) ( CLEAR ?auto_260131 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_260128 ?auto_260129 ?auto_260130 ?auto_260131 )
      ( MAKE-12PILE ?auto_260128 ?auto_260129 ?auto_260130 ?auto_260131 ?auto_260132 ?auto_260133 ?auto_260134 ?auto_260135 ?auto_260136 ?auto_260137 ?auto_260138 ?auto_260139 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_260178 - BLOCK
      ?auto_260179 - BLOCK
      ?auto_260180 - BLOCK
      ?auto_260181 - BLOCK
      ?auto_260182 - BLOCK
      ?auto_260183 - BLOCK
      ?auto_260184 - BLOCK
      ?auto_260185 - BLOCK
      ?auto_260186 - BLOCK
      ?auto_260187 - BLOCK
      ?auto_260188 - BLOCK
      ?auto_260189 - BLOCK
    )
    :vars
    (
      ?auto_260190 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_260189 ?auto_260190 ) ( ON-TABLE ?auto_260178 ) ( ON ?auto_260179 ?auto_260178 ) ( not ( = ?auto_260178 ?auto_260179 ) ) ( not ( = ?auto_260178 ?auto_260180 ) ) ( not ( = ?auto_260178 ?auto_260181 ) ) ( not ( = ?auto_260178 ?auto_260182 ) ) ( not ( = ?auto_260178 ?auto_260183 ) ) ( not ( = ?auto_260178 ?auto_260184 ) ) ( not ( = ?auto_260178 ?auto_260185 ) ) ( not ( = ?auto_260178 ?auto_260186 ) ) ( not ( = ?auto_260178 ?auto_260187 ) ) ( not ( = ?auto_260178 ?auto_260188 ) ) ( not ( = ?auto_260178 ?auto_260189 ) ) ( not ( = ?auto_260178 ?auto_260190 ) ) ( not ( = ?auto_260179 ?auto_260180 ) ) ( not ( = ?auto_260179 ?auto_260181 ) ) ( not ( = ?auto_260179 ?auto_260182 ) ) ( not ( = ?auto_260179 ?auto_260183 ) ) ( not ( = ?auto_260179 ?auto_260184 ) ) ( not ( = ?auto_260179 ?auto_260185 ) ) ( not ( = ?auto_260179 ?auto_260186 ) ) ( not ( = ?auto_260179 ?auto_260187 ) ) ( not ( = ?auto_260179 ?auto_260188 ) ) ( not ( = ?auto_260179 ?auto_260189 ) ) ( not ( = ?auto_260179 ?auto_260190 ) ) ( not ( = ?auto_260180 ?auto_260181 ) ) ( not ( = ?auto_260180 ?auto_260182 ) ) ( not ( = ?auto_260180 ?auto_260183 ) ) ( not ( = ?auto_260180 ?auto_260184 ) ) ( not ( = ?auto_260180 ?auto_260185 ) ) ( not ( = ?auto_260180 ?auto_260186 ) ) ( not ( = ?auto_260180 ?auto_260187 ) ) ( not ( = ?auto_260180 ?auto_260188 ) ) ( not ( = ?auto_260180 ?auto_260189 ) ) ( not ( = ?auto_260180 ?auto_260190 ) ) ( not ( = ?auto_260181 ?auto_260182 ) ) ( not ( = ?auto_260181 ?auto_260183 ) ) ( not ( = ?auto_260181 ?auto_260184 ) ) ( not ( = ?auto_260181 ?auto_260185 ) ) ( not ( = ?auto_260181 ?auto_260186 ) ) ( not ( = ?auto_260181 ?auto_260187 ) ) ( not ( = ?auto_260181 ?auto_260188 ) ) ( not ( = ?auto_260181 ?auto_260189 ) ) ( not ( = ?auto_260181 ?auto_260190 ) ) ( not ( = ?auto_260182 ?auto_260183 ) ) ( not ( = ?auto_260182 ?auto_260184 ) ) ( not ( = ?auto_260182 ?auto_260185 ) ) ( not ( = ?auto_260182 ?auto_260186 ) ) ( not ( = ?auto_260182 ?auto_260187 ) ) ( not ( = ?auto_260182 ?auto_260188 ) ) ( not ( = ?auto_260182 ?auto_260189 ) ) ( not ( = ?auto_260182 ?auto_260190 ) ) ( not ( = ?auto_260183 ?auto_260184 ) ) ( not ( = ?auto_260183 ?auto_260185 ) ) ( not ( = ?auto_260183 ?auto_260186 ) ) ( not ( = ?auto_260183 ?auto_260187 ) ) ( not ( = ?auto_260183 ?auto_260188 ) ) ( not ( = ?auto_260183 ?auto_260189 ) ) ( not ( = ?auto_260183 ?auto_260190 ) ) ( not ( = ?auto_260184 ?auto_260185 ) ) ( not ( = ?auto_260184 ?auto_260186 ) ) ( not ( = ?auto_260184 ?auto_260187 ) ) ( not ( = ?auto_260184 ?auto_260188 ) ) ( not ( = ?auto_260184 ?auto_260189 ) ) ( not ( = ?auto_260184 ?auto_260190 ) ) ( not ( = ?auto_260185 ?auto_260186 ) ) ( not ( = ?auto_260185 ?auto_260187 ) ) ( not ( = ?auto_260185 ?auto_260188 ) ) ( not ( = ?auto_260185 ?auto_260189 ) ) ( not ( = ?auto_260185 ?auto_260190 ) ) ( not ( = ?auto_260186 ?auto_260187 ) ) ( not ( = ?auto_260186 ?auto_260188 ) ) ( not ( = ?auto_260186 ?auto_260189 ) ) ( not ( = ?auto_260186 ?auto_260190 ) ) ( not ( = ?auto_260187 ?auto_260188 ) ) ( not ( = ?auto_260187 ?auto_260189 ) ) ( not ( = ?auto_260187 ?auto_260190 ) ) ( not ( = ?auto_260188 ?auto_260189 ) ) ( not ( = ?auto_260188 ?auto_260190 ) ) ( not ( = ?auto_260189 ?auto_260190 ) ) ( ON ?auto_260188 ?auto_260189 ) ( ON ?auto_260187 ?auto_260188 ) ( ON ?auto_260186 ?auto_260187 ) ( ON ?auto_260185 ?auto_260186 ) ( ON ?auto_260184 ?auto_260185 ) ( ON ?auto_260183 ?auto_260184 ) ( ON ?auto_260182 ?auto_260183 ) ( ON ?auto_260181 ?auto_260182 ) ( CLEAR ?auto_260179 ) ( ON ?auto_260180 ?auto_260181 ) ( CLEAR ?auto_260180 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_260178 ?auto_260179 ?auto_260180 )
      ( MAKE-12PILE ?auto_260178 ?auto_260179 ?auto_260180 ?auto_260181 ?auto_260182 ?auto_260183 ?auto_260184 ?auto_260185 ?auto_260186 ?auto_260187 ?auto_260188 ?auto_260189 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_260228 - BLOCK
      ?auto_260229 - BLOCK
      ?auto_260230 - BLOCK
      ?auto_260231 - BLOCK
      ?auto_260232 - BLOCK
      ?auto_260233 - BLOCK
      ?auto_260234 - BLOCK
      ?auto_260235 - BLOCK
      ?auto_260236 - BLOCK
      ?auto_260237 - BLOCK
      ?auto_260238 - BLOCK
      ?auto_260239 - BLOCK
    )
    :vars
    (
      ?auto_260240 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_260239 ?auto_260240 ) ( ON-TABLE ?auto_260228 ) ( not ( = ?auto_260228 ?auto_260229 ) ) ( not ( = ?auto_260228 ?auto_260230 ) ) ( not ( = ?auto_260228 ?auto_260231 ) ) ( not ( = ?auto_260228 ?auto_260232 ) ) ( not ( = ?auto_260228 ?auto_260233 ) ) ( not ( = ?auto_260228 ?auto_260234 ) ) ( not ( = ?auto_260228 ?auto_260235 ) ) ( not ( = ?auto_260228 ?auto_260236 ) ) ( not ( = ?auto_260228 ?auto_260237 ) ) ( not ( = ?auto_260228 ?auto_260238 ) ) ( not ( = ?auto_260228 ?auto_260239 ) ) ( not ( = ?auto_260228 ?auto_260240 ) ) ( not ( = ?auto_260229 ?auto_260230 ) ) ( not ( = ?auto_260229 ?auto_260231 ) ) ( not ( = ?auto_260229 ?auto_260232 ) ) ( not ( = ?auto_260229 ?auto_260233 ) ) ( not ( = ?auto_260229 ?auto_260234 ) ) ( not ( = ?auto_260229 ?auto_260235 ) ) ( not ( = ?auto_260229 ?auto_260236 ) ) ( not ( = ?auto_260229 ?auto_260237 ) ) ( not ( = ?auto_260229 ?auto_260238 ) ) ( not ( = ?auto_260229 ?auto_260239 ) ) ( not ( = ?auto_260229 ?auto_260240 ) ) ( not ( = ?auto_260230 ?auto_260231 ) ) ( not ( = ?auto_260230 ?auto_260232 ) ) ( not ( = ?auto_260230 ?auto_260233 ) ) ( not ( = ?auto_260230 ?auto_260234 ) ) ( not ( = ?auto_260230 ?auto_260235 ) ) ( not ( = ?auto_260230 ?auto_260236 ) ) ( not ( = ?auto_260230 ?auto_260237 ) ) ( not ( = ?auto_260230 ?auto_260238 ) ) ( not ( = ?auto_260230 ?auto_260239 ) ) ( not ( = ?auto_260230 ?auto_260240 ) ) ( not ( = ?auto_260231 ?auto_260232 ) ) ( not ( = ?auto_260231 ?auto_260233 ) ) ( not ( = ?auto_260231 ?auto_260234 ) ) ( not ( = ?auto_260231 ?auto_260235 ) ) ( not ( = ?auto_260231 ?auto_260236 ) ) ( not ( = ?auto_260231 ?auto_260237 ) ) ( not ( = ?auto_260231 ?auto_260238 ) ) ( not ( = ?auto_260231 ?auto_260239 ) ) ( not ( = ?auto_260231 ?auto_260240 ) ) ( not ( = ?auto_260232 ?auto_260233 ) ) ( not ( = ?auto_260232 ?auto_260234 ) ) ( not ( = ?auto_260232 ?auto_260235 ) ) ( not ( = ?auto_260232 ?auto_260236 ) ) ( not ( = ?auto_260232 ?auto_260237 ) ) ( not ( = ?auto_260232 ?auto_260238 ) ) ( not ( = ?auto_260232 ?auto_260239 ) ) ( not ( = ?auto_260232 ?auto_260240 ) ) ( not ( = ?auto_260233 ?auto_260234 ) ) ( not ( = ?auto_260233 ?auto_260235 ) ) ( not ( = ?auto_260233 ?auto_260236 ) ) ( not ( = ?auto_260233 ?auto_260237 ) ) ( not ( = ?auto_260233 ?auto_260238 ) ) ( not ( = ?auto_260233 ?auto_260239 ) ) ( not ( = ?auto_260233 ?auto_260240 ) ) ( not ( = ?auto_260234 ?auto_260235 ) ) ( not ( = ?auto_260234 ?auto_260236 ) ) ( not ( = ?auto_260234 ?auto_260237 ) ) ( not ( = ?auto_260234 ?auto_260238 ) ) ( not ( = ?auto_260234 ?auto_260239 ) ) ( not ( = ?auto_260234 ?auto_260240 ) ) ( not ( = ?auto_260235 ?auto_260236 ) ) ( not ( = ?auto_260235 ?auto_260237 ) ) ( not ( = ?auto_260235 ?auto_260238 ) ) ( not ( = ?auto_260235 ?auto_260239 ) ) ( not ( = ?auto_260235 ?auto_260240 ) ) ( not ( = ?auto_260236 ?auto_260237 ) ) ( not ( = ?auto_260236 ?auto_260238 ) ) ( not ( = ?auto_260236 ?auto_260239 ) ) ( not ( = ?auto_260236 ?auto_260240 ) ) ( not ( = ?auto_260237 ?auto_260238 ) ) ( not ( = ?auto_260237 ?auto_260239 ) ) ( not ( = ?auto_260237 ?auto_260240 ) ) ( not ( = ?auto_260238 ?auto_260239 ) ) ( not ( = ?auto_260238 ?auto_260240 ) ) ( not ( = ?auto_260239 ?auto_260240 ) ) ( ON ?auto_260238 ?auto_260239 ) ( ON ?auto_260237 ?auto_260238 ) ( ON ?auto_260236 ?auto_260237 ) ( ON ?auto_260235 ?auto_260236 ) ( ON ?auto_260234 ?auto_260235 ) ( ON ?auto_260233 ?auto_260234 ) ( ON ?auto_260232 ?auto_260233 ) ( ON ?auto_260231 ?auto_260232 ) ( ON ?auto_260230 ?auto_260231 ) ( CLEAR ?auto_260228 ) ( ON ?auto_260229 ?auto_260230 ) ( CLEAR ?auto_260229 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_260228 ?auto_260229 )
      ( MAKE-12PILE ?auto_260228 ?auto_260229 ?auto_260230 ?auto_260231 ?auto_260232 ?auto_260233 ?auto_260234 ?auto_260235 ?auto_260236 ?auto_260237 ?auto_260238 ?auto_260239 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_260278 - BLOCK
      ?auto_260279 - BLOCK
      ?auto_260280 - BLOCK
      ?auto_260281 - BLOCK
      ?auto_260282 - BLOCK
      ?auto_260283 - BLOCK
      ?auto_260284 - BLOCK
      ?auto_260285 - BLOCK
      ?auto_260286 - BLOCK
      ?auto_260287 - BLOCK
      ?auto_260288 - BLOCK
      ?auto_260289 - BLOCK
    )
    :vars
    (
      ?auto_260290 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_260289 ?auto_260290 ) ( not ( = ?auto_260278 ?auto_260279 ) ) ( not ( = ?auto_260278 ?auto_260280 ) ) ( not ( = ?auto_260278 ?auto_260281 ) ) ( not ( = ?auto_260278 ?auto_260282 ) ) ( not ( = ?auto_260278 ?auto_260283 ) ) ( not ( = ?auto_260278 ?auto_260284 ) ) ( not ( = ?auto_260278 ?auto_260285 ) ) ( not ( = ?auto_260278 ?auto_260286 ) ) ( not ( = ?auto_260278 ?auto_260287 ) ) ( not ( = ?auto_260278 ?auto_260288 ) ) ( not ( = ?auto_260278 ?auto_260289 ) ) ( not ( = ?auto_260278 ?auto_260290 ) ) ( not ( = ?auto_260279 ?auto_260280 ) ) ( not ( = ?auto_260279 ?auto_260281 ) ) ( not ( = ?auto_260279 ?auto_260282 ) ) ( not ( = ?auto_260279 ?auto_260283 ) ) ( not ( = ?auto_260279 ?auto_260284 ) ) ( not ( = ?auto_260279 ?auto_260285 ) ) ( not ( = ?auto_260279 ?auto_260286 ) ) ( not ( = ?auto_260279 ?auto_260287 ) ) ( not ( = ?auto_260279 ?auto_260288 ) ) ( not ( = ?auto_260279 ?auto_260289 ) ) ( not ( = ?auto_260279 ?auto_260290 ) ) ( not ( = ?auto_260280 ?auto_260281 ) ) ( not ( = ?auto_260280 ?auto_260282 ) ) ( not ( = ?auto_260280 ?auto_260283 ) ) ( not ( = ?auto_260280 ?auto_260284 ) ) ( not ( = ?auto_260280 ?auto_260285 ) ) ( not ( = ?auto_260280 ?auto_260286 ) ) ( not ( = ?auto_260280 ?auto_260287 ) ) ( not ( = ?auto_260280 ?auto_260288 ) ) ( not ( = ?auto_260280 ?auto_260289 ) ) ( not ( = ?auto_260280 ?auto_260290 ) ) ( not ( = ?auto_260281 ?auto_260282 ) ) ( not ( = ?auto_260281 ?auto_260283 ) ) ( not ( = ?auto_260281 ?auto_260284 ) ) ( not ( = ?auto_260281 ?auto_260285 ) ) ( not ( = ?auto_260281 ?auto_260286 ) ) ( not ( = ?auto_260281 ?auto_260287 ) ) ( not ( = ?auto_260281 ?auto_260288 ) ) ( not ( = ?auto_260281 ?auto_260289 ) ) ( not ( = ?auto_260281 ?auto_260290 ) ) ( not ( = ?auto_260282 ?auto_260283 ) ) ( not ( = ?auto_260282 ?auto_260284 ) ) ( not ( = ?auto_260282 ?auto_260285 ) ) ( not ( = ?auto_260282 ?auto_260286 ) ) ( not ( = ?auto_260282 ?auto_260287 ) ) ( not ( = ?auto_260282 ?auto_260288 ) ) ( not ( = ?auto_260282 ?auto_260289 ) ) ( not ( = ?auto_260282 ?auto_260290 ) ) ( not ( = ?auto_260283 ?auto_260284 ) ) ( not ( = ?auto_260283 ?auto_260285 ) ) ( not ( = ?auto_260283 ?auto_260286 ) ) ( not ( = ?auto_260283 ?auto_260287 ) ) ( not ( = ?auto_260283 ?auto_260288 ) ) ( not ( = ?auto_260283 ?auto_260289 ) ) ( not ( = ?auto_260283 ?auto_260290 ) ) ( not ( = ?auto_260284 ?auto_260285 ) ) ( not ( = ?auto_260284 ?auto_260286 ) ) ( not ( = ?auto_260284 ?auto_260287 ) ) ( not ( = ?auto_260284 ?auto_260288 ) ) ( not ( = ?auto_260284 ?auto_260289 ) ) ( not ( = ?auto_260284 ?auto_260290 ) ) ( not ( = ?auto_260285 ?auto_260286 ) ) ( not ( = ?auto_260285 ?auto_260287 ) ) ( not ( = ?auto_260285 ?auto_260288 ) ) ( not ( = ?auto_260285 ?auto_260289 ) ) ( not ( = ?auto_260285 ?auto_260290 ) ) ( not ( = ?auto_260286 ?auto_260287 ) ) ( not ( = ?auto_260286 ?auto_260288 ) ) ( not ( = ?auto_260286 ?auto_260289 ) ) ( not ( = ?auto_260286 ?auto_260290 ) ) ( not ( = ?auto_260287 ?auto_260288 ) ) ( not ( = ?auto_260287 ?auto_260289 ) ) ( not ( = ?auto_260287 ?auto_260290 ) ) ( not ( = ?auto_260288 ?auto_260289 ) ) ( not ( = ?auto_260288 ?auto_260290 ) ) ( not ( = ?auto_260289 ?auto_260290 ) ) ( ON ?auto_260288 ?auto_260289 ) ( ON ?auto_260287 ?auto_260288 ) ( ON ?auto_260286 ?auto_260287 ) ( ON ?auto_260285 ?auto_260286 ) ( ON ?auto_260284 ?auto_260285 ) ( ON ?auto_260283 ?auto_260284 ) ( ON ?auto_260282 ?auto_260283 ) ( ON ?auto_260281 ?auto_260282 ) ( ON ?auto_260280 ?auto_260281 ) ( ON ?auto_260279 ?auto_260280 ) ( ON ?auto_260278 ?auto_260279 ) ( CLEAR ?auto_260278 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_260278 )
      ( MAKE-12PILE ?auto_260278 ?auto_260279 ?auto_260280 ?auto_260281 ?auto_260282 ?auto_260283 ?auto_260284 ?auto_260285 ?auto_260286 ?auto_260287 ?auto_260288 ?auto_260289 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_260329 - BLOCK
      ?auto_260330 - BLOCK
      ?auto_260331 - BLOCK
      ?auto_260332 - BLOCK
      ?auto_260333 - BLOCK
      ?auto_260334 - BLOCK
      ?auto_260335 - BLOCK
      ?auto_260336 - BLOCK
      ?auto_260337 - BLOCK
      ?auto_260338 - BLOCK
      ?auto_260339 - BLOCK
      ?auto_260340 - BLOCK
      ?auto_260341 - BLOCK
    )
    :vars
    (
      ?auto_260342 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_260340 ) ( ON ?auto_260341 ?auto_260342 ) ( CLEAR ?auto_260341 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_260329 ) ( ON ?auto_260330 ?auto_260329 ) ( ON ?auto_260331 ?auto_260330 ) ( ON ?auto_260332 ?auto_260331 ) ( ON ?auto_260333 ?auto_260332 ) ( ON ?auto_260334 ?auto_260333 ) ( ON ?auto_260335 ?auto_260334 ) ( ON ?auto_260336 ?auto_260335 ) ( ON ?auto_260337 ?auto_260336 ) ( ON ?auto_260338 ?auto_260337 ) ( ON ?auto_260339 ?auto_260338 ) ( ON ?auto_260340 ?auto_260339 ) ( not ( = ?auto_260329 ?auto_260330 ) ) ( not ( = ?auto_260329 ?auto_260331 ) ) ( not ( = ?auto_260329 ?auto_260332 ) ) ( not ( = ?auto_260329 ?auto_260333 ) ) ( not ( = ?auto_260329 ?auto_260334 ) ) ( not ( = ?auto_260329 ?auto_260335 ) ) ( not ( = ?auto_260329 ?auto_260336 ) ) ( not ( = ?auto_260329 ?auto_260337 ) ) ( not ( = ?auto_260329 ?auto_260338 ) ) ( not ( = ?auto_260329 ?auto_260339 ) ) ( not ( = ?auto_260329 ?auto_260340 ) ) ( not ( = ?auto_260329 ?auto_260341 ) ) ( not ( = ?auto_260329 ?auto_260342 ) ) ( not ( = ?auto_260330 ?auto_260331 ) ) ( not ( = ?auto_260330 ?auto_260332 ) ) ( not ( = ?auto_260330 ?auto_260333 ) ) ( not ( = ?auto_260330 ?auto_260334 ) ) ( not ( = ?auto_260330 ?auto_260335 ) ) ( not ( = ?auto_260330 ?auto_260336 ) ) ( not ( = ?auto_260330 ?auto_260337 ) ) ( not ( = ?auto_260330 ?auto_260338 ) ) ( not ( = ?auto_260330 ?auto_260339 ) ) ( not ( = ?auto_260330 ?auto_260340 ) ) ( not ( = ?auto_260330 ?auto_260341 ) ) ( not ( = ?auto_260330 ?auto_260342 ) ) ( not ( = ?auto_260331 ?auto_260332 ) ) ( not ( = ?auto_260331 ?auto_260333 ) ) ( not ( = ?auto_260331 ?auto_260334 ) ) ( not ( = ?auto_260331 ?auto_260335 ) ) ( not ( = ?auto_260331 ?auto_260336 ) ) ( not ( = ?auto_260331 ?auto_260337 ) ) ( not ( = ?auto_260331 ?auto_260338 ) ) ( not ( = ?auto_260331 ?auto_260339 ) ) ( not ( = ?auto_260331 ?auto_260340 ) ) ( not ( = ?auto_260331 ?auto_260341 ) ) ( not ( = ?auto_260331 ?auto_260342 ) ) ( not ( = ?auto_260332 ?auto_260333 ) ) ( not ( = ?auto_260332 ?auto_260334 ) ) ( not ( = ?auto_260332 ?auto_260335 ) ) ( not ( = ?auto_260332 ?auto_260336 ) ) ( not ( = ?auto_260332 ?auto_260337 ) ) ( not ( = ?auto_260332 ?auto_260338 ) ) ( not ( = ?auto_260332 ?auto_260339 ) ) ( not ( = ?auto_260332 ?auto_260340 ) ) ( not ( = ?auto_260332 ?auto_260341 ) ) ( not ( = ?auto_260332 ?auto_260342 ) ) ( not ( = ?auto_260333 ?auto_260334 ) ) ( not ( = ?auto_260333 ?auto_260335 ) ) ( not ( = ?auto_260333 ?auto_260336 ) ) ( not ( = ?auto_260333 ?auto_260337 ) ) ( not ( = ?auto_260333 ?auto_260338 ) ) ( not ( = ?auto_260333 ?auto_260339 ) ) ( not ( = ?auto_260333 ?auto_260340 ) ) ( not ( = ?auto_260333 ?auto_260341 ) ) ( not ( = ?auto_260333 ?auto_260342 ) ) ( not ( = ?auto_260334 ?auto_260335 ) ) ( not ( = ?auto_260334 ?auto_260336 ) ) ( not ( = ?auto_260334 ?auto_260337 ) ) ( not ( = ?auto_260334 ?auto_260338 ) ) ( not ( = ?auto_260334 ?auto_260339 ) ) ( not ( = ?auto_260334 ?auto_260340 ) ) ( not ( = ?auto_260334 ?auto_260341 ) ) ( not ( = ?auto_260334 ?auto_260342 ) ) ( not ( = ?auto_260335 ?auto_260336 ) ) ( not ( = ?auto_260335 ?auto_260337 ) ) ( not ( = ?auto_260335 ?auto_260338 ) ) ( not ( = ?auto_260335 ?auto_260339 ) ) ( not ( = ?auto_260335 ?auto_260340 ) ) ( not ( = ?auto_260335 ?auto_260341 ) ) ( not ( = ?auto_260335 ?auto_260342 ) ) ( not ( = ?auto_260336 ?auto_260337 ) ) ( not ( = ?auto_260336 ?auto_260338 ) ) ( not ( = ?auto_260336 ?auto_260339 ) ) ( not ( = ?auto_260336 ?auto_260340 ) ) ( not ( = ?auto_260336 ?auto_260341 ) ) ( not ( = ?auto_260336 ?auto_260342 ) ) ( not ( = ?auto_260337 ?auto_260338 ) ) ( not ( = ?auto_260337 ?auto_260339 ) ) ( not ( = ?auto_260337 ?auto_260340 ) ) ( not ( = ?auto_260337 ?auto_260341 ) ) ( not ( = ?auto_260337 ?auto_260342 ) ) ( not ( = ?auto_260338 ?auto_260339 ) ) ( not ( = ?auto_260338 ?auto_260340 ) ) ( not ( = ?auto_260338 ?auto_260341 ) ) ( not ( = ?auto_260338 ?auto_260342 ) ) ( not ( = ?auto_260339 ?auto_260340 ) ) ( not ( = ?auto_260339 ?auto_260341 ) ) ( not ( = ?auto_260339 ?auto_260342 ) ) ( not ( = ?auto_260340 ?auto_260341 ) ) ( not ( = ?auto_260340 ?auto_260342 ) ) ( not ( = ?auto_260341 ?auto_260342 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_260341 ?auto_260342 )
      ( !STACK ?auto_260341 ?auto_260340 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_260356 - BLOCK
      ?auto_260357 - BLOCK
      ?auto_260358 - BLOCK
      ?auto_260359 - BLOCK
      ?auto_260360 - BLOCK
      ?auto_260361 - BLOCK
      ?auto_260362 - BLOCK
      ?auto_260363 - BLOCK
      ?auto_260364 - BLOCK
      ?auto_260365 - BLOCK
      ?auto_260366 - BLOCK
      ?auto_260367 - BLOCK
      ?auto_260368 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_260367 ) ( ON-TABLE ?auto_260368 ) ( CLEAR ?auto_260368 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_260356 ) ( ON ?auto_260357 ?auto_260356 ) ( ON ?auto_260358 ?auto_260357 ) ( ON ?auto_260359 ?auto_260358 ) ( ON ?auto_260360 ?auto_260359 ) ( ON ?auto_260361 ?auto_260360 ) ( ON ?auto_260362 ?auto_260361 ) ( ON ?auto_260363 ?auto_260362 ) ( ON ?auto_260364 ?auto_260363 ) ( ON ?auto_260365 ?auto_260364 ) ( ON ?auto_260366 ?auto_260365 ) ( ON ?auto_260367 ?auto_260366 ) ( not ( = ?auto_260356 ?auto_260357 ) ) ( not ( = ?auto_260356 ?auto_260358 ) ) ( not ( = ?auto_260356 ?auto_260359 ) ) ( not ( = ?auto_260356 ?auto_260360 ) ) ( not ( = ?auto_260356 ?auto_260361 ) ) ( not ( = ?auto_260356 ?auto_260362 ) ) ( not ( = ?auto_260356 ?auto_260363 ) ) ( not ( = ?auto_260356 ?auto_260364 ) ) ( not ( = ?auto_260356 ?auto_260365 ) ) ( not ( = ?auto_260356 ?auto_260366 ) ) ( not ( = ?auto_260356 ?auto_260367 ) ) ( not ( = ?auto_260356 ?auto_260368 ) ) ( not ( = ?auto_260357 ?auto_260358 ) ) ( not ( = ?auto_260357 ?auto_260359 ) ) ( not ( = ?auto_260357 ?auto_260360 ) ) ( not ( = ?auto_260357 ?auto_260361 ) ) ( not ( = ?auto_260357 ?auto_260362 ) ) ( not ( = ?auto_260357 ?auto_260363 ) ) ( not ( = ?auto_260357 ?auto_260364 ) ) ( not ( = ?auto_260357 ?auto_260365 ) ) ( not ( = ?auto_260357 ?auto_260366 ) ) ( not ( = ?auto_260357 ?auto_260367 ) ) ( not ( = ?auto_260357 ?auto_260368 ) ) ( not ( = ?auto_260358 ?auto_260359 ) ) ( not ( = ?auto_260358 ?auto_260360 ) ) ( not ( = ?auto_260358 ?auto_260361 ) ) ( not ( = ?auto_260358 ?auto_260362 ) ) ( not ( = ?auto_260358 ?auto_260363 ) ) ( not ( = ?auto_260358 ?auto_260364 ) ) ( not ( = ?auto_260358 ?auto_260365 ) ) ( not ( = ?auto_260358 ?auto_260366 ) ) ( not ( = ?auto_260358 ?auto_260367 ) ) ( not ( = ?auto_260358 ?auto_260368 ) ) ( not ( = ?auto_260359 ?auto_260360 ) ) ( not ( = ?auto_260359 ?auto_260361 ) ) ( not ( = ?auto_260359 ?auto_260362 ) ) ( not ( = ?auto_260359 ?auto_260363 ) ) ( not ( = ?auto_260359 ?auto_260364 ) ) ( not ( = ?auto_260359 ?auto_260365 ) ) ( not ( = ?auto_260359 ?auto_260366 ) ) ( not ( = ?auto_260359 ?auto_260367 ) ) ( not ( = ?auto_260359 ?auto_260368 ) ) ( not ( = ?auto_260360 ?auto_260361 ) ) ( not ( = ?auto_260360 ?auto_260362 ) ) ( not ( = ?auto_260360 ?auto_260363 ) ) ( not ( = ?auto_260360 ?auto_260364 ) ) ( not ( = ?auto_260360 ?auto_260365 ) ) ( not ( = ?auto_260360 ?auto_260366 ) ) ( not ( = ?auto_260360 ?auto_260367 ) ) ( not ( = ?auto_260360 ?auto_260368 ) ) ( not ( = ?auto_260361 ?auto_260362 ) ) ( not ( = ?auto_260361 ?auto_260363 ) ) ( not ( = ?auto_260361 ?auto_260364 ) ) ( not ( = ?auto_260361 ?auto_260365 ) ) ( not ( = ?auto_260361 ?auto_260366 ) ) ( not ( = ?auto_260361 ?auto_260367 ) ) ( not ( = ?auto_260361 ?auto_260368 ) ) ( not ( = ?auto_260362 ?auto_260363 ) ) ( not ( = ?auto_260362 ?auto_260364 ) ) ( not ( = ?auto_260362 ?auto_260365 ) ) ( not ( = ?auto_260362 ?auto_260366 ) ) ( not ( = ?auto_260362 ?auto_260367 ) ) ( not ( = ?auto_260362 ?auto_260368 ) ) ( not ( = ?auto_260363 ?auto_260364 ) ) ( not ( = ?auto_260363 ?auto_260365 ) ) ( not ( = ?auto_260363 ?auto_260366 ) ) ( not ( = ?auto_260363 ?auto_260367 ) ) ( not ( = ?auto_260363 ?auto_260368 ) ) ( not ( = ?auto_260364 ?auto_260365 ) ) ( not ( = ?auto_260364 ?auto_260366 ) ) ( not ( = ?auto_260364 ?auto_260367 ) ) ( not ( = ?auto_260364 ?auto_260368 ) ) ( not ( = ?auto_260365 ?auto_260366 ) ) ( not ( = ?auto_260365 ?auto_260367 ) ) ( not ( = ?auto_260365 ?auto_260368 ) ) ( not ( = ?auto_260366 ?auto_260367 ) ) ( not ( = ?auto_260366 ?auto_260368 ) ) ( not ( = ?auto_260367 ?auto_260368 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_260368 )
      ( !STACK ?auto_260368 ?auto_260367 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_260382 - BLOCK
      ?auto_260383 - BLOCK
      ?auto_260384 - BLOCK
      ?auto_260385 - BLOCK
      ?auto_260386 - BLOCK
      ?auto_260387 - BLOCK
      ?auto_260388 - BLOCK
      ?auto_260389 - BLOCK
      ?auto_260390 - BLOCK
      ?auto_260391 - BLOCK
      ?auto_260392 - BLOCK
      ?auto_260393 - BLOCK
      ?auto_260394 - BLOCK
    )
    :vars
    (
      ?auto_260395 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_260394 ?auto_260395 ) ( ON-TABLE ?auto_260382 ) ( ON ?auto_260383 ?auto_260382 ) ( ON ?auto_260384 ?auto_260383 ) ( ON ?auto_260385 ?auto_260384 ) ( ON ?auto_260386 ?auto_260385 ) ( ON ?auto_260387 ?auto_260386 ) ( ON ?auto_260388 ?auto_260387 ) ( ON ?auto_260389 ?auto_260388 ) ( ON ?auto_260390 ?auto_260389 ) ( ON ?auto_260391 ?auto_260390 ) ( ON ?auto_260392 ?auto_260391 ) ( not ( = ?auto_260382 ?auto_260383 ) ) ( not ( = ?auto_260382 ?auto_260384 ) ) ( not ( = ?auto_260382 ?auto_260385 ) ) ( not ( = ?auto_260382 ?auto_260386 ) ) ( not ( = ?auto_260382 ?auto_260387 ) ) ( not ( = ?auto_260382 ?auto_260388 ) ) ( not ( = ?auto_260382 ?auto_260389 ) ) ( not ( = ?auto_260382 ?auto_260390 ) ) ( not ( = ?auto_260382 ?auto_260391 ) ) ( not ( = ?auto_260382 ?auto_260392 ) ) ( not ( = ?auto_260382 ?auto_260393 ) ) ( not ( = ?auto_260382 ?auto_260394 ) ) ( not ( = ?auto_260382 ?auto_260395 ) ) ( not ( = ?auto_260383 ?auto_260384 ) ) ( not ( = ?auto_260383 ?auto_260385 ) ) ( not ( = ?auto_260383 ?auto_260386 ) ) ( not ( = ?auto_260383 ?auto_260387 ) ) ( not ( = ?auto_260383 ?auto_260388 ) ) ( not ( = ?auto_260383 ?auto_260389 ) ) ( not ( = ?auto_260383 ?auto_260390 ) ) ( not ( = ?auto_260383 ?auto_260391 ) ) ( not ( = ?auto_260383 ?auto_260392 ) ) ( not ( = ?auto_260383 ?auto_260393 ) ) ( not ( = ?auto_260383 ?auto_260394 ) ) ( not ( = ?auto_260383 ?auto_260395 ) ) ( not ( = ?auto_260384 ?auto_260385 ) ) ( not ( = ?auto_260384 ?auto_260386 ) ) ( not ( = ?auto_260384 ?auto_260387 ) ) ( not ( = ?auto_260384 ?auto_260388 ) ) ( not ( = ?auto_260384 ?auto_260389 ) ) ( not ( = ?auto_260384 ?auto_260390 ) ) ( not ( = ?auto_260384 ?auto_260391 ) ) ( not ( = ?auto_260384 ?auto_260392 ) ) ( not ( = ?auto_260384 ?auto_260393 ) ) ( not ( = ?auto_260384 ?auto_260394 ) ) ( not ( = ?auto_260384 ?auto_260395 ) ) ( not ( = ?auto_260385 ?auto_260386 ) ) ( not ( = ?auto_260385 ?auto_260387 ) ) ( not ( = ?auto_260385 ?auto_260388 ) ) ( not ( = ?auto_260385 ?auto_260389 ) ) ( not ( = ?auto_260385 ?auto_260390 ) ) ( not ( = ?auto_260385 ?auto_260391 ) ) ( not ( = ?auto_260385 ?auto_260392 ) ) ( not ( = ?auto_260385 ?auto_260393 ) ) ( not ( = ?auto_260385 ?auto_260394 ) ) ( not ( = ?auto_260385 ?auto_260395 ) ) ( not ( = ?auto_260386 ?auto_260387 ) ) ( not ( = ?auto_260386 ?auto_260388 ) ) ( not ( = ?auto_260386 ?auto_260389 ) ) ( not ( = ?auto_260386 ?auto_260390 ) ) ( not ( = ?auto_260386 ?auto_260391 ) ) ( not ( = ?auto_260386 ?auto_260392 ) ) ( not ( = ?auto_260386 ?auto_260393 ) ) ( not ( = ?auto_260386 ?auto_260394 ) ) ( not ( = ?auto_260386 ?auto_260395 ) ) ( not ( = ?auto_260387 ?auto_260388 ) ) ( not ( = ?auto_260387 ?auto_260389 ) ) ( not ( = ?auto_260387 ?auto_260390 ) ) ( not ( = ?auto_260387 ?auto_260391 ) ) ( not ( = ?auto_260387 ?auto_260392 ) ) ( not ( = ?auto_260387 ?auto_260393 ) ) ( not ( = ?auto_260387 ?auto_260394 ) ) ( not ( = ?auto_260387 ?auto_260395 ) ) ( not ( = ?auto_260388 ?auto_260389 ) ) ( not ( = ?auto_260388 ?auto_260390 ) ) ( not ( = ?auto_260388 ?auto_260391 ) ) ( not ( = ?auto_260388 ?auto_260392 ) ) ( not ( = ?auto_260388 ?auto_260393 ) ) ( not ( = ?auto_260388 ?auto_260394 ) ) ( not ( = ?auto_260388 ?auto_260395 ) ) ( not ( = ?auto_260389 ?auto_260390 ) ) ( not ( = ?auto_260389 ?auto_260391 ) ) ( not ( = ?auto_260389 ?auto_260392 ) ) ( not ( = ?auto_260389 ?auto_260393 ) ) ( not ( = ?auto_260389 ?auto_260394 ) ) ( not ( = ?auto_260389 ?auto_260395 ) ) ( not ( = ?auto_260390 ?auto_260391 ) ) ( not ( = ?auto_260390 ?auto_260392 ) ) ( not ( = ?auto_260390 ?auto_260393 ) ) ( not ( = ?auto_260390 ?auto_260394 ) ) ( not ( = ?auto_260390 ?auto_260395 ) ) ( not ( = ?auto_260391 ?auto_260392 ) ) ( not ( = ?auto_260391 ?auto_260393 ) ) ( not ( = ?auto_260391 ?auto_260394 ) ) ( not ( = ?auto_260391 ?auto_260395 ) ) ( not ( = ?auto_260392 ?auto_260393 ) ) ( not ( = ?auto_260392 ?auto_260394 ) ) ( not ( = ?auto_260392 ?auto_260395 ) ) ( not ( = ?auto_260393 ?auto_260394 ) ) ( not ( = ?auto_260393 ?auto_260395 ) ) ( not ( = ?auto_260394 ?auto_260395 ) ) ( CLEAR ?auto_260392 ) ( ON ?auto_260393 ?auto_260394 ) ( CLEAR ?auto_260393 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_260382 ?auto_260383 ?auto_260384 ?auto_260385 ?auto_260386 ?auto_260387 ?auto_260388 ?auto_260389 ?auto_260390 ?auto_260391 ?auto_260392 ?auto_260393 )
      ( MAKE-13PILE ?auto_260382 ?auto_260383 ?auto_260384 ?auto_260385 ?auto_260386 ?auto_260387 ?auto_260388 ?auto_260389 ?auto_260390 ?auto_260391 ?auto_260392 ?auto_260393 ?auto_260394 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_260409 - BLOCK
      ?auto_260410 - BLOCK
      ?auto_260411 - BLOCK
      ?auto_260412 - BLOCK
      ?auto_260413 - BLOCK
      ?auto_260414 - BLOCK
      ?auto_260415 - BLOCK
      ?auto_260416 - BLOCK
      ?auto_260417 - BLOCK
      ?auto_260418 - BLOCK
      ?auto_260419 - BLOCK
      ?auto_260420 - BLOCK
      ?auto_260421 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_260421 ) ( ON-TABLE ?auto_260409 ) ( ON ?auto_260410 ?auto_260409 ) ( ON ?auto_260411 ?auto_260410 ) ( ON ?auto_260412 ?auto_260411 ) ( ON ?auto_260413 ?auto_260412 ) ( ON ?auto_260414 ?auto_260413 ) ( ON ?auto_260415 ?auto_260414 ) ( ON ?auto_260416 ?auto_260415 ) ( ON ?auto_260417 ?auto_260416 ) ( ON ?auto_260418 ?auto_260417 ) ( ON ?auto_260419 ?auto_260418 ) ( not ( = ?auto_260409 ?auto_260410 ) ) ( not ( = ?auto_260409 ?auto_260411 ) ) ( not ( = ?auto_260409 ?auto_260412 ) ) ( not ( = ?auto_260409 ?auto_260413 ) ) ( not ( = ?auto_260409 ?auto_260414 ) ) ( not ( = ?auto_260409 ?auto_260415 ) ) ( not ( = ?auto_260409 ?auto_260416 ) ) ( not ( = ?auto_260409 ?auto_260417 ) ) ( not ( = ?auto_260409 ?auto_260418 ) ) ( not ( = ?auto_260409 ?auto_260419 ) ) ( not ( = ?auto_260409 ?auto_260420 ) ) ( not ( = ?auto_260409 ?auto_260421 ) ) ( not ( = ?auto_260410 ?auto_260411 ) ) ( not ( = ?auto_260410 ?auto_260412 ) ) ( not ( = ?auto_260410 ?auto_260413 ) ) ( not ( = ?auto_260410 ?auto_260414 ) ) ( not ( = ?auto_260410 ?auto_260415 ) ) ( not ( = ?auto_260410 ?auto_260416 ) ) ( not ( = ?auto_260410 ?auto_260417 ) ) ( not ( = ?auto_260410 ?auto_260418 ) ) ( not ( = ?auto_260410 ?auto_260419 ) ) ( not ( = ?auto_260410 ?auto_260420 ) ) ( not ( = ?auto_260410 ?auto_260421 ) ) ( not ( = ?auto_260411 ?auto_260412 ) ) ( not ( = ?auto_260411 ?auto_260413 ) ) ( not ( = ?auto_260411 ?auto_260414 ) ) ( not ( = ?auto_260411 ?auto_260415 ) ) ( not ( = ?auto_260411 ?auto_260416 ) ) ( not ( = ?auto_260411 ?auto_260417 ) ) ( not ( = ?auto_260411 ?auto_260418 ) ) ( not ( = ?auto_260411 ?auto_260419 ) ) ( not ( = ?auto_260411 ?auto_260420 ) ) ( not ( = ?auto_260411 ?auto_260421 ) ) ( not ( = ?auto_260412 ?auto_260413 ) ) ( not ( = ?auto_260412 ?auto_260414 ) ) ( not ( = ?auto_260412 ?auto_260415 ) ) ( not ( = ?auto_260412 ?auto_260416 ) ) ( not ( = ?auto_260412 ?auto_260417 ) ) ( not ( = ?auto_260412 ?auto_260418 ) ) ( not ( = ?auto_260412 ?auto_260419 ) ) ( not ( = ?auto_260412 ?auto_260420 ) ) ( not ( = ?auto_260412 ?auto_260421 ) ) ( not ( = ?auto_260413 ?auto_260414 ) ) ( not ( = ?auto_260413 ?auto_260415 ) ) ( not ( = ?auto_260413 ?auto_260416 ) ) ( not ( = ?auto_260413 ?auto_260417 ) ) ( not ( = ?auto_260413 ?auto_260418 ) ) ( not ( = ?auto_260413 ?auto_260419 ) ) ( not ( = ?auto_260413 ?auto_260420 ) ) ( not ( = ?auto_260413 ?auto_260421 ) ) ( not ( = ?auto_260414 ?auto_260415 ) ) ( not ( = ?auto_260414 ?auto_260416 ) ) ( not ( = ?auto_260414 ?auto_260417 ) ) ( not ( = ?auto_260414 ?auto_260418 ) ) ( not ( = ?auto_260414 ?auto_260419 ) ) ( not ( = ?auto_260414 ?auto_260420 ) ) ( not ( = ?auto_260414 ?auto_260421 ) ) ( not ( = ?auto_260415 ?auto_260416 ) ) ( not ( = ?auto_260415 ?auto_260417 ) ) ( not ( = ?auto_260415 ?auto_260418 ) ) ( not ( = ?auto_260415 ?auto_260419 ) ) ( not ( = ?auto_260415 ?auto_260420 ) ) ( not ( = ?auto_260415 ?auto_260421 ) ) ( not ( = ?auto_260416 ?auto_260417 ) ) ( not ( = ?auto_260416 ?auto_260418 ) ) ( not ( = ?auto_260416 ?auto_260419 ) ) ( not ( = ?auto_260416 ?auto_260420 ) ) ( not ( = ?auto_260416 ?auto_260421 ) ) ( not ( = ?auto_260417 ?auto_260418 ) ) ( not ( = ?auto_260417 ?auto_260419 ) ) ( not ( = ?auto_260417 ?auto_260420 ) ) ( not ( = ?auto_260417 ?auto_260421 ) ) ( not ( = ?auto_260418 ?auto_260419 ) ) ( not ( = ?auto_260418 ?auto_260420 ) ) ( not ( = ?auto_260418 ?auto_260421 ) ) ( not ( = ?auto_260419 ?auto_260420 ) ) ( not ( = ?auto_260419 ?auto_260421 ) ) ( not ( = ?auto_260420 ?auto_260421 ) ) ( CLEAR ?auto_260419 ) ( ON ?auto_260420 ?auto_260421 ) ( CLEAR ?auto_260420 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_260409 ?auto_260410 ?auto_260411 ?auto_260412 ?auto_260413 ?auto_260414 ?auto_260415 ?auto_260416 ?auto_260417 ?auto_260418 ?auto_260419 ?auto_260420 )
      ( MAKE-13PILE ?auto_260409 ?auto_260410 ?auto_260411 ?auto_260412 ?auto_260413 ?auto_260414 ?auto_260415 ?auto_260416 ?auto_260417 ?auto_260418 ?auto_260419 ?auto_260420 ?auto_260421 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_260435 - BLOCK
      ?auto_260436 - BLOCK
      ?auto_260437 - BLOCK
      ?auto_260438 - BLOCK
      ?auto_260439 - BLOCK
      ?auto_260440 - BLOCK
      ?auto_260441 - BLOCK
      ?auto_260442 - BLOCK
      ?auto_260443 - BLOCK
      ?auto_260444 - BLOCK
      ?auto_260445 - BLOCK
      ?auto_260446 - BLOCK
      ?auto_260447 - BLOCK
    )
    :vars
    (
      ?auto_260448 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_260447 ?auto_260448 ) ( ON-TABLE ?auto_260435 ) ( ON ?auto_260436 ?auto_260435 ) ( ON ?auto_260437 ?auto_260436 ) ( ON ?auto_260438 ?auto_260437 ) ( ON ?auto_260439 ?auto_260438 ) ( ON ?auto_260440 ?auto_260439 ) ( ON ?auto_260441 ?auto_260440 ) ( ON ?auto_260442 ?auto_260441 ) ( ON ?auto_260443 ?auto_260442 ) ( ON ?auto_260444 ?auto_260443 ) ( not ( = ?auto_260435 ?auto_260436 ) ) ( not ( = ?auto_260435 ?auto_260437 ) ) ( not ( = ?auto_260435 ?auto_260438 ) ) ( not ( = ?auto_260435 ?auto_260439 ) ) ( not ( = ?auto_260435 ?auto_260440 ) ) ( not ( = ?auto_260435 ?auto_260441 ) ) ( not ( = ?auto_260435 ?auto_260442 ) ) ( not ( = ?auto_260435 ?auto_260443 ) ) ( not ( = ?auto_260435 ?auto_260444 ) ) ( not ( = ?auto_260435 ?auto_260445 ) ) ( not ( = ?auto_260435 ?auto_260446 ) ) ( not ( = ?auto_260435 ?auto_260447 ) ) ( not ( = ?auto_260435 ?auto_260448 ) ) ( not ( = ?auto_260436 ?auto_260437 ) ) ( not ( = ?auto_260436 ?auto_260438 ) ) ( not ( = ?auto_260436 ?auto_260439 ) ) ( not ( = ?auto_260436 ?auto_260440 ) ) ( not ( = ?auto_260436 ?auto_260441 ) ) ( not ( = ?auto_260436 ?auto_260442 ) ) ( not ( = ?auto_260436 ?auto_260443 ) ) ( not ( = ?auto_260436 ?auto_260444 ) ) ( not ( = ?auto_260436 ?auto_260445 ) ) ( not ( = ?auto_260436 ?auto_260446 ) ) ( not ( = ?auto_260436 ?auto_260447 ) ) ( not ( = ?auto_260436 ?auto_260448 ) ) ( not ( = ?auto_260437 ?auto_260438 ) ) ( not ( = ?auto_260437 ?auto_260439 ) ) ( not ( = ?auto_260437 ?auto_260440 ) ) ( not ( = ?auto_260437 ?auto_260441 ) ) ( not ( = ?auto_260437 ?auto_260442 ) ) ( not ( = ?auto_260437 ?auto_260443 ) ) ( not ( = ?auto_260437 ?auto_260444 ) ) ( not ( = ?auto_260437 ?auto_260445 ) ) ( not ( = ?auto_260437 ?auto_260446 ) ) ( not ( = ?auto_260437 ?auto_260447 ) ) ( not ( = ?auto_260437 ?auto_260448 ) ) ( not ( = ?auto_260438 ?auto_260439 ) ) ( not ( = ?auto_260438 ?auto_260440 ) ) ( not ( = ?auto_260438 ?auto_260441 ) ) ( not ( = ?auto_260438 ?auto_260442 ) ) ( not ( = ?auto_260438 ?auto_260443 ) ) ( not ( = ?auto_260438 ?auto_260444 ) ) ( not ( = ?auto_260438 ?auto_260445 ) ) ( not ( = ?auto_260438 ?auto_260446 ) ) ( not ( = ?auto_260438 ?auto_260447 ) ) ( not ( = ?auto_260438 ?auto_260448 ) ) ( not ( = ?auto_260439 ?auto_260440 ) ) ( not ( = ?auto_260439 ?auto_260441 ) ) ( not ( = ?auto_260439 ?auto_260442 ) ) ( not ( = ?auto_260439 ?auto_260443 ) ) ( not ( = ?auto_260439 ?auto_260444 ) ) ( not ( = ?auto_260439 ?auto_260445 ) ) ( not ( = ?auto_260439 ?auto_260446 ) ) ( not ( = ?auto_260439 ?auto_260447 ) ) ( not ( = ?auto_260439 ?auto_260448 ) ) ( not ( = ?auto_260440 ?auto_260441 ) ) ( not ( = ?auto_260440 ?auto_260442 ) ) ( not ( = ?auto_260440 ?auto_260443 ) ) ( not ( = ?auto_260440 ?auto_260444 ) ) ( not ( = ?auto_260440 ?auto_260445 ) ) ( not ( = ?auto_260440 ?auto_260446 ) ) ( not ( = ?auto_260440 ?auto_260447 ) ) ( not ( = ?auto_260440 ?auto_260448 ) ) ( not ( = ?auto_260441 ?auto_260442 ) ) ( not ( = ?auto_260441 ?auto_260443 ) ) ( not ( = ?auto_260441 ?auto_260444 ) ) ( not ( = ?auto_260441 ?auto_260445 ) ) ( not ( = ?auto_260441 ?auto_260446 ) ) ( not ( = ?auto_260441 ?auto_260447 ) ) ( not ( = ?auto_260441 ?auto_260448 ) ) ( not ( = ?auto_260442 ?auto_260443 ) ) ( not ( = ?auto_260442 ?auto_260444 ) ) ( not ( = ?auto_260442 ?auto_260445 ) ) ( not ( = ?auto_260442 ?auto_260446 ) ) ( not ( = ?auto_260442 ?auto_260447 ) ) ( not ( = ?auto_260442 ?auto_260448 ) ) ( not ( = ?auto_260443 ?auto_260444 ) ) ( not ( = ?auto_260443 ?auto_260445 ) ) ( not ( = ?auto_260443 ?auto_260446 ) ) ( not ( = ?auto_260443 ?auto_260447 ) ) ( not ( = ?auto_260443 ?auto_260448 ) ) ( not ( = ?auto_260444 ?auto_260445 ) ) ( not ( = ?auto_260444 ?auto_260446 ) ) ( not ( = ?auto_260444 ?auto_260447 ) ) ( not ( = ?auto_260444 ?auto_260448 ) ) ( not ( = ?auto_260445 ?auto_260446 ) ) ( not ( = ?auto_260445 ?auto_260447 ) ) ( not ( = ?auto_260445 ?auto_260448 ) ) ( not ( = ?auto_260446 ?auto_260447 ) ) ( not ( = ?auto_260446 ?auto_260448 ) ) ( not ( = ?auto_260447 ?auto_260448 ) ) ( ON ?auto_260446 ?auto_260447 ) ( CLEAR ?auto_260444 ) ( ON ?auto_260445 ?auto_260446 ) ( CLEAR ?auto_260445 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_260435 ?auto_260436 ?auto_260437 ?auto_260438 ?auto_260439 ?auto_260440 ?auto_260441 ?auto_260442 ?auto_260443 ?auto_260444 ?auto_260445 )
      ( MAKE-13PILE ?auto_260435 ?auto_260436 ?auto_260437 ?auto_260438 ?auto_260439 ?auto_260440 ?auto_260441 ?auto_260442 ?auto_260443 ?auto_260444 ?auto_260445 ?auto_260446 ?auto_260447 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_260462 - BLOCK
      ?auto_260463 - BLOCK
      ?auto_260464 - BLOCK
      ?auto_260465 - BLOCK
      ?auto_260466 - BLOCK
      ?auto_260467 - BLOCK
      ?auto_260468 - BLOCK
      ?auto_260469 - BLOCK
      ?auto_260470 - BLOCK
      ?auto_260471 - BLOCK
      ?auto_260472 - BLOCK
      ?auto_260473 - BLOCK
      ?auto_260474 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_260474 ) ( ON-TABLE ?auto_260462 ) ( ON ?auto_260463 ?auto_260462 ) ( ON ?auto_260464 ?auto_260463 ) ( ON ?auto_260465 ?auto_260464 ) ( ON ?auto_260466 ?auto_260465 ) ( ON ?auto_260467 ?auto_260466 ) ( ON ?auto_260468 ?auto_260467 ) ( ON ?auto_260469 ?auto_260468 ) ( ON ?auto_260470 ?auto_260469 ) ( ON ?auto_260471 ?auto_260470 ) ( not ( = ?auto_260462 ?auto_260463 ) ) ( not ( = ?auto_260462 ?auto_260464 ) ) ( not ( = ?auto_260462 ?auto_260465 ) ) ( not ( = ?auto_260462 ?auto_260466 ) ) ( not ( = ?auto_260462 ?auto_260467 ) ) ( not ( = ?auto_260462 ?auto_260468 ) ) ( not ( = ?auto_260462 ?auto_260469 ) ) ( not ( = ?auto_260462 ?auto_260470 ) ) ( not ( = ?auto_260462 ?auto_260471 ) ) ( not ( = ?auto_260462 ?auto_260472 ) ) ( not ( = ?auto_260462 ?auto_260473 ) ) ( not ( = ?auto_260462 ?auto_260474 ) ) ( not ( = ?auto_260463 ?auto_260464 ) ) ( not ( = ?auto_260463 ?auto_260465 ) ) ( not ( = ?auto_260463 ?auto_260466 ) ) ( not ( = ?auto_260463 ?auto_260467 ) ) ( not ( = ?auto_260463 ?auto_260468 ) ) ( not ( = ?auto_260463 ?auto_260469 ) ) ( not ( = ?auto_260463 ?auto_260470 ) ) ( not ( = ?auto_260463 ?auto_260471 ) ) ( not ( = ?auto_260463 ?auto_260472 ) ) ( not ( = ?auto_260463 ?auto_260473 ) ) ( not ( = ?auto_260463 ?auto_260474 ) ) ( not ( = ?auto_260464 ?auto_260465 ) ) ( not ( = ?auto_260464 ?auto_260466 ) ) ( not ( = ?auto_260464 ?auto_260467 ) ) ( not ( = ?auto_260464 ?auto_260468 ) ) ( not ( = ?auto_260464 ?auto_260469 ) ) ( not ( = ?auto_260464 ?auto_260470 ) ) ( not ( = ?auto_260464 ?auto_260471 ) ) ( not ( = ?auto_260464 ?auto_260472 ) ) ( not ( = ?auto_260464 ?auto_260473 ) ) ( not ( = ?auto_260464 ?auto_260474 ) ) ( not ( = ?auto_260465 ?auto_260466 ) ) ( not ( = ?auto_260465 ?auto_260467 ) ) ( not ( = ?auto_260465 ?auto_260468 ) ) ( not ( = ?auto_260465 ?auto_260469 ) ) ( not ( = ?auto_260465 ?auto_260470 ) ) ( not ( = ?auto_260465 ?auto_260471 ) ) ( not ( = ?auto_260465 ?auto_260472 ) ) ( not ( = ?auto_260465 ?auto_260473 ) ) ( not ( = ?auto_260465 ?auto_260474 ) ) ( not ( = ?auto_260466 ?auto_260467 ) ) ( not ( = ?auto_260466 ?auto_260468 ) ) ( not ( = ?auto_260466 ?auto_260469 ) ) ( not ( = ?auto_260466 ?auto_260470 ) ) ( not ( = ?auto_260466 ?auto_260471 ) ) ( not ( = ?auto_260466 ?auto_260472 ) ) ( not ( = ?auto_260466 ?auto_260473 ) ) ( not ( = ?auto_260466 ?auto_260474 ) ) ( not ( = ?auto_260467 ?auto_260468 ) ) ( not ( = ?auto_260467 ?auto_260469 ) ) ( not ( = ?auto_260467 ?auto_260470 ) ) ( not ( = ?auto_260467 ?auto_260471 ) ) ( not ( = ?auto_260467 ?auto_260472 ) ) ( not ( = ?auto_260467 ?auto_260473 ) ) ( not ( = ?auto_260467 ?auto_260474 ) ) ( not ( = ?auto_260468 ?auto_260469 ) ) ( not ( = ?auto_260468 ?auto_260470 ) ) ( not ( = ?auto_260468 ?auto_260471 ) ) ( not ( = ?auto_260468 ?auto_260472 ) ) ( not ( = ?auto_260468 ?auto_260473 ) ) ( not ( = ?auto_260468 ?auto_260474 ) ) ( not ( = ?auto_260469 ?auto_260470 ) ) ( not ( = ?auto_260469 ?auto_260471 ) ) ( not ( = ?auto_260469 ?auto_260472 ) ) ( not ( = ?auto_260469 ?auto_260473 ) ) ( not ( = ?auto_260469 ?auto_260474 ) ) ( not ( = ?auto_260470 ?auto_260471 ) ) ( not ( = ?auto_260470 ?auto_260472 ) ) ( not ( = ?auto_260470 ?auto_260473 ) ) ( not ( = ?auto_260470 ?auto_260474 ) ) ( not ( = ?auto_260471 ?auto_260472 ) ) ( not ( = ?auto_260471 ?auto_260473 ) ) ( not ( = ?auto_260471 ?auto_260474 ) ) ( not ( = ?auto_260472 ?auto_260473 ) ) ( not ( = ?auto_260472 ?auto_260474 ) ) ( not ( = ?auto_260473 ?auto_260474 ) ) ( ON ?auto_260473 ?auto_260474 ) ( CLEAR ?auto_260471 ) ( ON ?auto_260472 ?auto_260473 ) ( CLEAR ?auto_260472 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_260462 ?auto_260463 ?auto_260464 ?auto_260465 ?auto_260466 ?auto_260467 ?auto_260468 ?auto_260469 ?auto_260470 ?auto_260471 ?auto_260472 )
      ( MAKE-13PILE ?auto_260462 ?auto_260463 ?auto_260464 ?auto_260465 ?auto_260466 ?auto_260467 ?auto_260468 ?auto_260469 ?auto_260470 ?auto_260471 ?auto_260472 ?auto_260473 ?auto_260474 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_260488 - BLOCK
      ?auto_260489 - BLOCK
      ?auto_260490 - BLOCK
      ?auto_260491 - BLOCK
      ?auto_260492 - BLOCK
      ?auto_260493 - BLOCK
      ?auto_260494 - BLOCK
      ?auto_260495 - BLOCK
      ?auto_260496 - BLOCK
      ?auto_260497 - BLOCK
      ?auto_260498 - BLOCK
      ?auto_260499 - BLOCK
      ?auto_260500 - BLOCK
    )
    :vars
    (
      ?auto_260501 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_260500 ?auto_260501 ) ( ON-TABLE ?auto_260488 ) ( ON ?auto_260489 ?auto_260488 ) ( ON ?auto_260490 ?auto_260489 ) ( ON ?auto_260491 ?auto_260490 ) ( ON ?auto_260492 ?auto_260491 ) ( ON ?auto_260493 ?auto_260492 ) ( ON ?auto_260494 ?auto_260493 ) ( ON ?auto_260495 ?auto_260494 ) ( ON ?auto_260496 ?auto_260495 ) ( not ( = ?auto_260488 ?auto_260489 ) ) ( not ( = ?auto_260488 ?auto_260490 ) ) ( not ( = ?auto_260488 ?auto_260491 ) ) ( not ( = ?auto_260488 ?auto_260492 ) ) ( not ( = ?auto_260488 ?auto_260493 ) ) ( not ( = ?auto_260488 ?auto_260494 ) ) ( not ( = ?auto_260488 ?auto_260495 ) ) ( not ( = ?auto_260488 ?auto_260496 ) ) ( not ( = ?auto_260488 ?auto_260497 ) ) ( not ( = ?auto_260488 ?auto_260498 ) ) ( not ( = ?auto_260488 ?auto_260499 ) ) ( not ( = ?auto_260488 ?auto_260500 ) ) ( not ( = ?auto_260488 ?auto_260501 ) ) ( not ( = ?auto_260489 ?auto_260490 ) ) ( not ( = ?auto_260489 ?auto_260491 ) ) ( not ( = ?auto_260489 ?auto_260492 ) ) ( not ( = ?auto_260489 ?auto_260493 ) ) ( not ( = ?auto_260489 ?auto_260494 ) ) ( not ( = ?auto_260489 ?auto_260495 ) ) ( not ( = ?auto_260489 ?auto_260496 ) ) ( not ( = ?auto_260489 ?auto_260497 ) ) ( not ( = ?auto_260489 ?auto_260498 ) ) ( not ( = ?auto_260489 ?auto_260499 ) ) ( not ( = ?auto_260489 ?auto_260500 ) ) ( not ( = ?auto_260489 ?auto_260501 ) ) ( not ( = ?auto_260490 ?auto_260491 ) ) ( not ( = ?auto_260490 ?auto_260492 ) ) ( not ( = ?auto_260490 ?auto_260493 ) ) ( not ( = ?auto_260490 ?auto_260494 ) ) ( not ( = ?auto_260490 ?auto_260495 ) ) ( not ( = ?auto_260490 ?auto_260496 ) ) ( not ( = ?auto_260490 ?auto_260497 ) ) ( not ( = ?auto_260490 ?auto_260498 ) ) ( not ( = ?auto_260490 ?auto_260499 ) ) ( not ( = ?auto_260490 ?auto_260500 ) ) ( not ( = ?auto_260490 ?auto_260501 ) ) ( not ( = ?auto_260491 ?auto_260492 ) ) ( not ( = ?auto_260491 ?auto_260493 ) ) ( not ( = ?auto_260491 ?auto_260494 ) ) ( not ( = ?auto_260491 ?auto_260495 ) ) ( not ( = ?auto_260491 ?auto_260496 ) ) ( not ( = ?auto_260491 ?auto_260497 ) ) ( not ( = ?auto_260491 ?auto_260498 ) ) ( not ( = ?auto_260491 ?auto_260499 ) ) ( not ( = ?auto_260491 ?auto_260500 ) ) ( not ( = ?auto_260491 ?auto_260501 ) ) ( not ( = ?auto_260492 ?auto_260493 ) ) ( not ( = ?auto_260492 ?auto_260494 ) ) ( not ( = ?auto_260492 ?auto_260495 ) ) ( not ( = ?auto_260492 ?auto_260496 ) ) ( not ( = ?auto_260492 ?auto_260497 ) ) ( not ( = ?auto_260492 ?auto_260498 ) ) ( not ( = ?auto_260492 ?auto_260499 ) ) ( not ( = ?auto_260492 ?auto_260500 ) ) ( not ( = ?auto_260492 ?auto_260501 ) ) ( not ( = ?auto_260493 ?auto_260494 ) ) ( not ( = ?auto_260493 ?auto_260495 ) ) ( not ( = ?auto_260493 ?auto_260496 ) ) ( not ( = ?auto_260493 ?auto_260497 ) ) ( not ( = ?auto_260493 ?auto_260498 ) ) ( not ( = ?auto_260493 ?auto_260499 ) ) ( not ( = ?auto_260493 ?auto_260500 ) ) ( not ( = ?auto_260493 ?auto_260501 ) ) ( not ( = ?auto_260494 ?auto_260495 ) ) ( not ( = ?auto_260494 ?auto_260496 ) ) ( not ( = ?auto_260494 ?auto_260497 ) ) ( not ( = ?auto_260494 ?auto_260498 ) ) ( not ( = ?auto_260494 ?auto_260499 ) ) ( not ( = ?auto_260494 ?auto_260500 ) ) ( not ( = ?auto_260494 ?auto_260501 ) ) ( not ( = ?auto_260495 ?auto_260496 ) ) ( not ( = ?auto_260495 ?auto_260497 ) ) ( not ( = ?auto_260495 ?auto_260498 ) ) ( not ( = ?auto_260495 ?auto_260499 ) ) ( not ( = ?auto_260495 ?auto_260500 ) ) ( not ( = ?auto_260495 ?auto_260501 ) ) ( not ( = ?auto_260496 ?auto_260497 ) ) ( not ( = ?auto_260496 ?auto_260498 ) ) ( not ( = ?auto_260496 ?auto_260499 ) ) ( not ( = ?auto_260496 ?auto_260500 ) ) ( not ( = ?auto_260496 ?auto_260501 ) ) ( not ( = ?auto_260497 ?auto_260498 ) ) ( not ( = ?auto_260497 ?auto_260499 ) ) ( not ( = ?auto_260497 ?auto_260500 ) ) ( not ( = ?auto_260497 ?auto_260501 ) ) ( not ( = ?auto_260498 ?auto_260499 ) ) ( not ( = ?auto_260498 ?auto_260500 ) ) ( not ( = ?auto_260498 ?auto_260501 ) ) ( not ( = ?auto_260499 ?auto_260500 ) ) ( not ( = ?auto_260499 ?auto_260501 ) ) ( not ( = ?auto_260500 ?auto_260501 ) ) ( ON ?auto_260499 ?auto_260500 ) ( ON ?auto_260498 ?auto_260499 ) ( CLEAR ?auto_260496 ) ( ON ?auto_260497 ?auto_260498 ) ( CLEAR ?auto_260497 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_260488 ?auto_260489 ?auto_260490 ?auto_260491 ?auto_260492 ?auto_260493 ?auto_260494 ?auto_260495 ?auto_260496 ?auto_260497 )
      ( MAKE-13PILE ?auto_260488 ?auto_260489 ?auto_260490 ?auto_260491 ?auto_260492 ?auto_260493 ?auto_260494 ?auto_260495 ?auto_260496 ?auto_260497 ?auto_260498 ?auto_260499 ?auto_260500 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_260515 - BLOCK
      ?auto_260516 - BLOCK
      ?auto_260517 - BLOCK
      ?auto_260518 - BLOCK
      ?auto_260519 - BLOCK
      ?auto_260520 - BLOCK
      ?auto_260521 - BLOCK
      ?auto_260522 - BLOCK
      ?auto_260523 - BLOCK
      ?auto_260524 - BLOCK
      ?auto_260525 - BLOCK
      ?auto_260526 - BLOCK
      ?auto_260527 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_260527 ) ( ON-TABLE ?auto_260515 ) ( ON ?auto_260516 ?auto_260515 ) ( ON ?auto_260517 ?auto_260516 ) ( ON ?auto_260518 ?auto_260517 ) ( ON ?auto_260519 ?auto_260518 ) ( ON ?auto_260520 ?auto_260519 ) ( ON ?auto_260521 ?auto_260520 ) ( ON ?auto_260522 ?auto_260521 ) ( ON ?auto_260523 ?auto_260522 ) ( not ( = ?auto_260515 ?auto_260516 ) ) ( not ( = ?auto_260515 ?auto_260517 ) ) ( not ( = ?auto_260515 ?auto_260518 ) ) ( not ( = ?auto_260515 ?auto_260519 ) ) ( not ( = ?auto_260515 ?auto_260520 ) ) ( not ( = ?auto_260515 ?auto_260521 ) ) ( not ( = ?auto_260515 ?auto_260522 ) ) ( not ( = ?auto_260515 ?auto_260523 ) ) ( not ( = ?auto_260515 ?auto_260524 ) ) ( not ( = ?auto_260515 ?auto_260525 ) ) ( not ( = ?auto_260515 ?auto_260526 ) ) ( not ( = ?auto_260515 ?auto_260527 ) ) ( not ( = ?auto_260516 ?auto_260517 ) ) ( not ( = ?auto_260516 ?auto_260518 ) ) ( not ( = ?auto_260516 ?auto_260519 ) ) ( not ( = ?auto_260516 ?auto_260520 ) ) ( not ( = ?auto_260516 ?auto_260521 ) ) ( not ( = ?auto_260516 ?auto_260522 ) ) ( not ( = ?auto_260516 ?auto_260523 ) ) ( not ( = ?auto_260516 ?auto_260524 ) ) ( not ( = ?auto_260516 ?auto_260525 ) ) ( not ( = ?auto_260516 ?auto_260526 ) ) ( not ( = ?auto_260516 ?auto_260527 ) ) ( not ( = ?auto_260517 ?auto_260518 ) ) ( not ( = ?auto_260517 ?auto_260519 ) ) ( not ( = ?auto_260517 ?auto_260520 ) ) ( not ( = ?auto_260517 ?auto_260521 ) ) ( not ( = ?auto_260517 ?auto_260522 ) ) ( not ( = ?auto_260517 ?auto_260523 ) ) ( not ( = ?auto_260517 ?auto_260524 ) ) ( not ( = ?auto_260517 ?auto_260525 ) ) ( not ( = ?auto_260517 ?auto_260526 ) ) ( not ( = ?auto_260517 ?auto_260527 ) ) ( not ( = ?auto_260518 ?auto_260519 ) ) ( not ( = ?auto_260518 ?auto_260520 ) ) ( not ( = ?auto_260518 ?auto_260521 ) ) ( not ( = ?auto_260518 ?auto_260522 ) ) ( not ( = ?auto_260518 ?auto_260523 ) ) ( not ( = ?auto_260518 ?auto_260524 ) ) ( not ( = ?auto_260518 ?auto_260525 ) ) ( not ( = ?auto_260518 ?auto_260526 ) ) ( not ( = ?auto_260518 ?auto_260527 ) ) ( not ( = ?auto_260519 ?auto_260520 ) ) ( not ( = ?auto_260519 ?auto_260521 ) ) ( not ( = ?auto_260519 ?auto_260522 ) ) ( not ( = ?auto_260519 ?auto_260523 ) ) ( not ( = ?auto_260519 ?auto_260524 ) ) ( not ( = ?auto_260519 ?auto_260525 ) ) ( not ( = ?auto_260519 ?auto_260526 ) ) ( not ( = ?auto_260519 ?auto_260527 ) ) ( not ( = ?auto_260520 ?auto_260521 ) ) ( not ( = ?auto_260520 ?auto_260522 ) ) ( not ( = ?auto_260520 ?auto_260523 ) ) ( not ( = ?auto_260520 ?auto_260524 ) ) ( not ( = ?auto_260520 ?auto_260525 ) ) ( not ( = ?auto_260520 ?auto_260526 ) ) ( not ( = ?auto_260520 ?auto_260527 ) ) ( not ( = ?auto_260521 ?auto_260522 ) ) ( not ( = ?auto_260521 ?auto_260523 ) ) ( not ( = ?auto_260521 ?auto_260524 ) ) ( not ( = ?auto_260521 ?auto_260525 ) ) ( not ( = ?auto_260521 ?auto_260526 ) ) ( not ( = ?auto_260521 ?auto_260527 ) ) ( not ( = ?auto_260522 ?auto_260523 ) ) ( not ( = ?auto_260522 ?auto_260524 ) ) ( not ( = ?auto_260522 ?auto_260525 ) ) ( not ( = ?auto_260522 ?auto_260526 ) ) ( not ( = ?auto_260522 ?auto_260527 ) ) ( not ( = ?auto_260523 ?auto_260524 ) ) ( not ( = ?auto_260523 ?auto_260525 ) ) ( not ( = ?auto_260523 ?auto_260526 ) ) ( not ( = ?auto_260523 ?auto_260527 ) ) ( not ( = ?auto_260524 ?auto_260525 ) ) ( not ( = ?auto_260524 ?auto_260526 ) ) ( not ( = ?auto_260524 ?auto_260527 ) ) ( not ( = ?auto_260525 ?auto_260526 ) ) ( not ( = ?auto_260525 ?auto_260527 ) ) ( not ( = ?auto_260526 ?auto_260527 ) ) ( ON ?auto_260526 ?auto_260527 ) ( ON ?auto_260525 ?auto_260526 ) ( CLEAR ?auto_260523 ) ( ON ?auto_260524 ?auto_260525 ) ( CLEAR ?auto_260524 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_260515 ?auto_260516 ?auto_260517 ?auto_260518 ?auto_260519 ?auto_260520 ?auto_260521 ?auto_260522 ?auto_260523 ?auto_260524 )
      ( MAKE-13PILE ?auto_260515 ?auto_260516 ?auto_260517 ?auto_260518 ?auto_260519 ?auto_260520 ?auto_260521 ?auto_260522 ?auto_260523 ?auto_260524 ?auto_260525 ?auto_260526 ?auto_260527 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_260541 - BLOCK
      ?auto_260542 - BLOCK
      ?auto_260543 - BLOCK
      ?auto_260544 - BLOCK
      ?auto_260545 - BLOCK
      ?auto_260546 - BLOCK
      ?auto_260547 - BLOCK
      ?auto_260548 - BLOCK
      ?auto_260549 - BLOCK
      ?auto_260550 - BLOCK
      ?auto_260551 - BLOCK
      ?auto_260552 - BLOCK
      ?auto_260553 - BLOCK
    )
    :vars
    (
      ?auto_260554 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_260553 ?auto_260554 ) ( ON-TABLE ?auto_260541 ) ( ON ?auto_260542 ?auto_260541 ) ( ON ?auto_260543 ?auto_260542 ) ( ON ?auto_260544 ?auto_260543 ) ( ON ?auto_260545 ?auto_260544 ) ( ON ?auto_260546 ?auto_260545 ) ( ON ?auto_260547 ?auto_260546 ) ( ON ?auto_260548 ?auto_260547 ) ( not ( = ?auto_260541 ?auto_260542 ) ) ( not ( = ?auto_260541 ?auto_260543 ) ) ( not ( = ?auto_260541 ?auto_260544 ) ) ( not ( = ?auto_260541 ?auto_260545 ) ) ( not ( = ?auto_260541 ?auto_260546 ) ) ( not ( = ?auto_260541 ?auto_260547 ) ) ( not ( = ?auto_260541 ?auto_260548 ) ) ( not ( = ?auto_260541 ?auto_260549 ) ) ( not ( = ?auto_260541 ?auto_260550 ) ) ( not ( = ?auto_260541 ?auto_260551 ) ) ( not ( = ?auto_260541 ?auto_260552 ) ) ( not ( = ?auto_260541 ?auto_260553 ) ) ( not ( = ?auto_260541 ?auto_260554 ) ) ( not ( = ?auto_260542 ?auto_260543 ) ) ( not ( = ?auto_260542 ?auto_260544 ) ) ( not ( = ?auto_260542 ?auto_260545 ) ) ( not ( = ?auto_260542 ?auto_260546 ) ) ( not ( = ?auto_260542 ?auto_260547 ) ) ( not ( = ?auto_260542 ?auto_260548 ) ) ( not ( = ?auto_260542 ?auto_260549 ) ) ( not ( = ?auto_260542 ?auto_260550 ) ) ( not ( = ?auto_260542 ?auto_260551 ) ) ( not ( = ?auto_260542 ?auto_260552 ) ) ( not ( = ?auto_260542 ?auto_260553 ) ) ( not ( = ?auto_260542 ?auto_260554 ) ) ( not ( = ?auto_260543 ?auto_260544 ) ) ( not ( = ?auto_260543 ?auto_260545 ) ) ( not ( = ?auto_260543 ?auto_260546 ) ) ( not ( = ?auto_260543 ?auto_260547 ) ) ( not ( = ?auto_260543 ?auto_260548 ) ) ( not ( = ?auto_260543 ?auto_260549 ) ) ( not ( = ?auto_260543 ?auto_260550 ) ) ( not ( = ?auto_260543 ?auto_260551 ) ) ( not ( = ?auto_260543 ?auto_260552 ) ) ( not ( = ?auto_260543 ?auto_260553 ) ) ( not ( = ?auto_260543 ?auto_260554 ) ) ( not ( = ?auto_260544 ?auto_260545 ) ) ( not ( = ?auto_260544 ?auto_260546 ) ) ( not ( = ?auto_260544 ?auto_260547 ) ) ( not ( = ?auto_260544 ?auto_260548 ) ) ( not ( = ?auto_260544 ?auto_260549 ) ) ( not ( = ?auto_260544 ?auto_260550 ) ) ( not ( = ?auto_260544 ?auto_260551 ) ) ( not ( = ?auto_260544 ?auto_260552 ) ) ( not ( = ?auto_260544 ?auto_260553 ) ) ( not ( = ?auto_260544 ?auto_260554 ) ) ( not ( = ?auto_260545 ?auto_260546 ) ) ( not ( = ?auto_260545 ?auto_260547 ) ) ( not ( = ?auto_260545 ?auto_260548 ) ) ( not ( = ?auto_260545 ?auto_260549 ) ) ( not ( = ?auto_260545 ?auto_260550 ) ) ( not ( = ?auto_260545 ?auto_260551 ) ) ( not ( = ?auto_260545 ?auto_260552 ) ) ( not ( = ?auto_260545 ?auto_260553 ) ) ( not ( = ?auto_260545 ?auto_260554 ) ) ( not ( = ?auto_260546 ?auto_260547 ) ) ( not ( = ?auto_260546 ?auto_260548 ) ) ( not ( = ?auto_260546 ?auto_260549 ) ) ( not ( = ?auto_260546 ?auto_260550 ) ) ( not ( = ?auto_260546 ?auto_260551 ) ) ( not ( = ?auto_260546 ?auto_260552 ) ) ( not ( = ?auto_260546 ?auto_260553 ) ) ( not ( = ?auto_260546 ?auto_260554 ) ) ( not ( = ?auto_260547 ?auto_260548 ) ) ( not ( = ?auto_260547 ?auto_260549 ) ) ( not ( = ?auto_260547 ?auto_260550 ) ) ( not ( = ?auto_260547 ?auto_260551 ) ) ( not ( = ?auto_260547 ?auto_260552 ) ) ( not ( = ?auto_260547 ?auto_260553 ) ) ( not ( = ?auto_260547 ?auto_260554 ) ) ( not ( = ?auto_260548 ?auto_260549 ) ) ( not ( = ?auto_260548 ?auto_260550 ) ) ( not ( = ?auto_260548 ?auto_260551 ) ) ( not ( = ?auto_260548 ?auto_260552 ) ) ( not ( = ?auto_260548 ?auto_260553 ) ) ( not ( = ?auto_260548 ?auto_260554 ) ) ( not ( = ?auto_260549 ?auto_260550 ) ) ( not ( = ?auto_260549 ?auto_260551 ) ) ( not ( = ?auto_260549 ?auto_260552 ) ) ( not ( = ?auto_260549 ?auto_260553 ) ) ( not ( = ?auto_260549 ?auto_260554 ) ) ( not ( = ?auto_260550 ?auto_260551 ) ) ( not ( = ?auto_260550 ?auto_260552 ) ) ( not ( = ?auto_260550 ?auto_260553 ) ) ( not ( = ?auto_260550 ?auto_260554 ) ) ( not ( = ?auto_260551 ?auto_260552 ) ) ( not ( = ?auto_260551 ?auto_260553 ) ) ( not ( = ?auto_260551 ?auto_260554 ) ) ( not ( = ?auto_260552 ?auto_260553 ) ) ( not ( = ?auto_260552 ?auto_260554 ) ) ( not ( = ?auto_260553 ?auto_260554 ) ) ( ON ?auto_260552 ?auto_260553 ) ( ON ?auto_260551 ?auto_260552 ) ( ON ?auto_260550 ?auto_260551 ) ( CLEAR ?auto_260548 ) ( ON ?auto_260549 ?auto_260550 ) ( CLEAR ?auto_260549 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_260541 ?auto_260542 ?auto_260543 ?auto_260544 ?auto_260545 ?auto_260546 ?auto_260547 ?auto_260548 ?auto_260549 )
      ( MAKE-13PILE ?auto_260541 ?auto_260542 ?auto_260543 ?auto_260544 ?auto_260545 ?auto_260546 ?auto_260547 ?auto_260548 ?auto_260549 ?auto_260550 ?auto_260551 ?auto_260552 ?auto_260553 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_260568 - BLOCK
      ?auto_260569 - BLOCK
      ?auto_260570 - BLOCK
      ?auto_260571 - BLOCK
      ?auto_260572 - BLOCK
      ?auto_260573 - BLOCK
      ?auto_260574 - BLOCK
      ?auto_260575 - BLOCK
      ?auto_260576 - BLOCK
      ?auto_260577 - BLOCK
      ?auto_260578 - BLOCK
      ?auto_260579 - BLOCK
      ?auto_260580 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_260580 ) ( ON-TABLE ?auto_260568 ) ( ON ?auto_260569 ?auto_260568 ) ( ON ?auto_260570 ?auto_260569 ) ( ON ?auto_260571 ?auto_260570 ) ( ON ?auto_260572 ?auto_260571 ) ( ON ?auto_260573 ?auto_260572 ) ( ON ?auto_260574 ?auto_260573 ) ( ON ?auto_260575 ?auto_260574 ) ( not ( = ?auto_260568 ?auto_260569 ) ) ( not ( = ?auto_260568 ?auto_260570 ) ) ( not ( = ?auto_260568 ?auto_260571 ) ) ( not ( = ?auto_260568 ?auto_260572 ) ) ( not ( = ?auto_260568 ?auto_260573 ) ) ( not ( = ?auto_260568 ?auto_260574 ) ) ( not ( = ?auto_260568 ?auto_260575 ) ) ( not ( = ?auto_260568 ?auto_260576 ) ) ( not ( = ?auto_260568 ?auto_260577 ) ) ( not ( = ?auto_260568 ?auto_260578 ) ) ( not ( = ?auto_260568 ?auto_260579 ) ) ( not ( = ?auto_260568 ?auto_260580 ) ) ( not ( = ?auto_260569 ?auto_260570 ) ) ( not ( = ?auto_260569 ?auto_260571 ) ) ( not ( = ?auto_260569 ?auto_260572 ) ) ( not ( = ?auto_260569 ?auto_260573 ) ) ( not ( = ?auto_260569 ?auto_260574 ) ) ( not ( = ?auto_260569 ?auto_260575 ) ) ( not ( = ?auto_260569 ?auto_260576 ) ) ( not ( = ?auto_260569 ?auto_260577 ) ) ( not ( = ?auto_260569 ?auto_260578 ) ) ( not ( = ?auto_260569 ?auto_260579 ) ) ( not ( = ?auto_260569 ?auto_260580 ) ) ( not ( = ?auto_260570 ?auto_260571 ) ) ( not ( = ?auto_260570 ?auto_260572 ) ) ( not ( = ?auto_260570 ?auto_260573 ) ) ( not ( = ?auto_260570 ?auto_260574 ) ) ( not ( = ?auto_260570 ?auto_260575 ) ) ( not ( = ?auto_260570 ?auto_260576 ) ) ( not ( = ?auto_260570 ?auto_260577 ) ) ( not ( = ?auto_260570 ?auto_260578 ) ) ( not ( = ?auto_260570 ?auto_260579 ) ) ( not ( = ?auto_260570 ?auto_260580 ) ) ( not ( = ?auto_260571 ?auto_260572 ) ) ( not ( = ?auto_260571 ?auto_260573 ) ) ( not ( = ?auto_260571 ?auto_260574 ) ) ( not ( = ?auto_260571 ?auto_260575 ) ) ( not ( = ?auto_260571 ?auto_260576 ) ) ( not ( = ?auto_260571 ?auto_260577 ) ) ( not ( = ?auto_260571 ?auto_260578 ) ) ( not ( = ?auto_260571 ?auto_260579 ) ) ( not ( = ?auto_260571 ?auto_260580 ) ) ( not ( = ?auto_260572 ?auto_260573 ) ) ( not ( = ?auto_260572 ?auto_260574 ) ) ( not ( = ?auto_260572 ?auto_260575 ) ) ( not ( = ?auto_260572 ?auto_260576 ) ) ( not ( = ?auto_260572 ?auto_260577 ) ) ( not ( = ?auto_260572 ?auto_260578 ) ) ( not ( = ?auto_260572 ?auto_260579 ) ) ( not ( = ?auto_260572 ?auto_260580 ) ) ( not ( = ?auto_260573 ?auto_260574 ) ) ( not ( = ?auto_260573 ?auto_260575 ) ) ( not ( = ?auto_260573 ?auto_260576 ) ) ( not ( = ?auto_260573 ?auto_260577 ) ) ( not ( = ?auto_260573 ?auto_260578 ) ) ( not ( = ?auto_260573 ?auto_260579 ) ) ( not ( = ?auto_260573 ?auto_260580 ) ) ( not ( = ?auto_260574 ?auto_260575 ) ) ( not ( = ?auto_260574 ?auto_260576 ) ) ( not ( = ?auto_260574 ?auto_260577 ) ) ( not ( = ?auto_260574 ?auto_260578 ) ) ( not ( = ?auto_260574 ?auto_260579 ) ) ( not ( = ?auto_260574 ?auto_260580 ) ) ( not ( = ?auto_260575 ?auto_260576 ) ) ( not ( = ?auto_260575 ?auto_260577 ) ) ( not ( = ?auto_260575 ?auto_260578 ) ) ( not ( = ?auto_260575 ?auto_260579 ) ) ( not ( = ?auto_260575 ?auto_260580 ) ) ( not ( = ?auto_260576 ?auto_260577 ) ) ( not ( = ?auto_260576 ?auto_260578 ) ) ( not ( = ?auto_260576 ?auto_260579 ) ) ( not ( = ?auto_260576 ?auto_260580 ) ) ( not ( = ?auto_260577 ?auto_260578 ) ) ( not ( = ?auto_260577 ?auto_260579 ) ) ( not ( = ?auto_260577 ?auto_260580 ) ) ( not ( = ?auto_260578 ?auto_260579 ) ) ( not ( = ?auto_260578 ?auto_260580 ) ) ( not ( = ?auto_260579 ?auto_260580 ) ) ( ON ?auto_260579 ?auto_260580 ) ( ON ?auto_260578 ?auto_260579 ) ( ON ?auto_260577 ?auto_260578 ) ( CLEAR ?auto_260575 ) ( ON ?auto_260576 ?auto_260577 ) ( CLEAR ?auto_260576 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_260568 ?auto_260569 ?auto_260570 ?auto_260571 ?auto_260572 ?auto_260573 ?auto_260574 ?auto_260575 ?auto_260576 )
      ( MAKE-13PILE ?auto_260568 ?auto_260569 ?auto_260570 ?auto_260571 ?auto_260572 ?auto_260573 ?auto_260574 ?auto_260575 ?auto_260576 ?auto_260577 ?auto_260578 ?auto_260579 ?auto_260580 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_260594 - BLOCK
      ?auto_260595 - BLOCK
      ?auto_260596 - BLOCK
      ?auto_260597 - BLOCK
      ?auto_260598 - BLOCK
      ?auto_260599 - BLOCK
      ?auto_260600 - BLOCK
      ?auto_260601 - BLOCK
      ?auto_260602 - BLOCK
      ?auto_260603 - BLOCK
      ?auto_260604 - BLOCK
      ?auto_260605 - BLOCK
      ?auto_260606 - BLOCK
    )
    :vars
    (
      ?auto_260607 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_260606 ?auto_260607 ) ( ON-TABLE ?auto_260594 ) ( ON ?auto_260595 ?auto_260594 ) ( ON ?auto_260596 ?auto_260595 ) ( ON ?auto_260597 ?auto_260596 ) ( ON ?auto_260598 ?auto_260597 ) ( ON ?auto_260599 ?auto_260598 ) ( ON ?auto_260600 ?auto_260599 ) ( not ( = ?auto_260594 ?auto_260595 ) ) ( not ( = ?auto_260594 ?auto_260596 ) ) ( not ( = ?auto_260594 ?auto_260597 ) ) ( not ( = ?auto_260594 ?auto_260598 ) ) ( not ( = ?auto_260594 ?auto_260599 ) ) ( not ( = ?auto_260594 ?auto_260600 ) ) ( not ( = ?auto_260594 ?auto_260601 ) ) ( not ( = ?auto_260594 ?auto_260602 ) ) ( not ( = ?auto_260594 ?auto_260603 ) ) ( not ( = ?auto_260594 ?auto_260604 ) ) ( not ( = ?auto_260594 ?auto_260605 ) ) ( not ( = ?auto_260594 ?auto_260606 ) ) ( not ( = ?auto_260594 ?auto_260607 ) ) ( not ( = ?auto_260595 ?auto_260596 ) ) ( not ( = ?auto_260595 ?auto_260597 ) ) ( not ( = ?auto_260595 ?auto_260598 ) ) ( not ( = ?auto_260595 ?auto_260599 ) ) ( not ( = ?auto_260595 ?auto_260600 ) ) ( not ( = ?auto_260595 ?auto_260601 ) ) ( not ( = ?auto_260595 ?auto_260602 ) ) ( not ( = ?auto_260595 ?auto_260603 ) ) ( not ( = ?auto_260595 ?auto_260604 ) ) ( not ( = ?auto_260595 ?auto_260605 ) ) ( not ( = ?auto_260595 ?auto_260606 ) ) ( not ( = ?auto_260595 ?auto_260607 ) ) ( not ( = ?auto_260596 ?auto_260597 ) ) ( not ( = ?auto_260596 ?auto_260598 ) ) ( not ( = ?auto_260596 ?auto_260599 ) ) ( not ( = ?auto_260596 ?auto_260600 ) ) ( not ( = ?auto_260596 ?auto_260601 ) ) ( not ( = ?auto_260596 ?auto_260602 ) ) ( not ( = ?auto_260596 ?auto_260603 ) ) ( not ( = ?auto_260596 ?auto_260604 ) ) ( not ( = ?auto_260596 ?auto_260605 ) ) ( not ( = ?auto_260596 ?auto_260606 ) ) ( not ( = ?auto_260596 ?auto_260607 ) ) ( not ( = ?auto_260597 ?auto_260598 ) ) ( not ( = ?auto_260597 ?auto_260599 ) ) ( not ( = ?auto_260597 ?auto_260600 ) ) ( not ( = ?auto_260597 ?auto_260601 ) ) ( not ( = ?auto_260597 ?auto_260602 ) ) ( not ( = ?auto_260597 ?auto_260603 ) ) ( not ( = ?auto_260597 ?auto_260604 ) ) ( not ( = ?auto_260597 ?auto_260605 ) ) ( not ( = ?auto_260597 ?auto_260606 ) ) ( not ( = ?auto_260597 ?auto_260607 ) ) ( not ( = ?auto_260598 ?auto_260599 ) ) ( not ( = ?auto_260598 ?auto_260600 ) ) ( not ( = ?auto_260598 ?auto_260601 ) ) ( not ( = ?auto_260598 ?auto_260602 ) ) ( not ( = ?auto_260598 ?auto_260603 ) ) ( not ( = ?auto_260598 ?auto_260604 ) ) ( not ( = ?auto_260598 ?auto_260605 ) ) ( not ( = ?auto_260598 ?auto_260606 ) ) ( not ( = ?auto_260598 ?auto_260607 ) ) ( not ( = ?auto_260599 ?auto_260600 ) ) ( not ( = ?auto_260599 ?auto_260601 ) ) ( not ( = ?auto_260599 ?auto_260602 ) ) ( not ( = ?auto_260599 ?auto_260603 ) ) ( not ( = ?auto_260599 ?auto_260604 ) ) ( not ( = ?auto_260599 ?auto_260605 ) ) ( not ( = ?auto_260599 ?auto_260606 ) ) ( not ( = ?auto_260599 ?auto_260607 ) ) ( not ( = ?auto_260600 ?auto_260601 ) ) ( not ( = ?auto_260600 ?auto_260602 ) ) ( not ( = ?auto_260600 ?auto_260603 ) ) ( not ( = ?auto_260600 ?auto_260604 ) ) ( not ( = ?auto_260600 ?auto_260605 ) ) ( not ( = ?auto_260600 ?auto_260606 ) ) ( not ( = ?auto_260600 ?auto_260607 ) ) ( not ( = ?auto_260601 ?auto_260602 ) ) ( not ( = ?auto_260601 ?auto_260603 ) ) ( not ( = ?auto_260601 ?auto_260604 ) ) ( not ( = ?auto_260601 ?auto_260605 ) ) ( not ( = ?auto_260601 ?auto_260606 ) ) ( not ( = ?auto_260601 ?auto_260607 ) ) ( not ( = ?auto_260602 ?auto_260603 ) ) ( not ( = ?auto_260602 ?auto_260604 ) ) ( not ( = ?auto_260602 ?auto_260605 ) ) ( not ( = ?auto_260602 ?auto_260606 ) ) ( not ( = ?auto_260602 ?auto_260607 ) ) ( not ( = ?auto_260603 ?auto_260604 ) ) ( not ( = ?auto_260603 ?auto_260605 ) ) ( not ( = ?auto_260603 ?auto_260606 ) ) ( not ( = ?auto_260603 ?auto_260607 ) ) ( not ( = ?auto_260604 ?auto_260605 ) ) ( not ( = ?auto_260604 ?auto_260606 ) ) ( not ( = ?auto_260604 ?auto_260607 ) ) ( not ( = ?auto_260605 ?auto_260606 ) ) ( not ( = ?auto_260605 ?auto_260607 ) ) ( not ( = ?auto_260606 ?auto_260607 ) ) ( ON ?auto_260605 ?auto_260606 ) ( ON ?auto_260604 ?auto_260605 ) ( ON ?auto_260603 ?auto_260604 ) ( ON ?auto_260602 ?auto_260603 ) ( CLEAR ?auto_260600 ) ( ON ?auto_260601 ?auto_260602 ) ( CLEAR ?auto_260601 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_260594 ?auto_260595 ?auto_260596 ?auto_260597 ?auto_260598 ?auto_260599 ?auto_260600 ?auto_260601 )
      ( MAKE-13PILE ?auto_260594 ?auto_260595 ?auto_260596 ?auto_260597 ?auto_260598 ?auto_260599 ?auto_260600 ?auto_260601 ?auto_260602 ?auto_260603 ?auto_260604 ?auto_260605 ?auto_260606 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_260621 - BLOCK
      ?auto_260622 - BLOCK
      ?auto_260623 - BLOCK
      ?auto_260624 - BLOCK
      ?auto_260625 - BLOCK
      ?auto_260626 - BLOCK
      ?auto_260627 - BLOCK
      ?auto_260628 - BLOCK
      ?auto_260629 - BLOCK
      ?auto_260630 - BLOCK
      ?auto_260631 - BLOCK
      ?auto_260632 - BLOCK
      ?auto_260633 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_260633 ) ( ON-TABLE ?auto_260621 ) ( ON ?auto_260622 ?auto_260621 ) ( ON ?auto_260623 ?auto_260622 ) ( ON ?auto_260624 ?auto_260623 ) ( ON ?auto_260625 ?auto_260624 ) ( ON ?auto_260626 ?auto_260625 ) ( ON ?auto_260627 ?auto_260626 ) ( not ( = ?auto_260621 ?auto_260622 ) ) ( not ( = ?auto_260621 ?auto_260623 ) ) ( not ( = ?auto_260621 ?auto_260624 ) ) ( not ( = ?auto_260621 ?auto_260625 ) ) ( not ( = ?auto_260621 ?auto_260626 ) ) ( not ( = ?auto_260621 ?auto_260627 ) ) ( not ( = ?auto_260621 ?auto_260628 ) ) ( not ( = ?auto_260621 ?auto_260629 ) ) ( not ( = ?auto_260621 ?auto_260630 ) ) ( not ( = ?auto_260621 ?auto_260631 ) ) ( not ( = ?auto_260621 ?auto_260632 ) ) ( not ( = ?auto_260621 ?auto_260633 ) ) ( not ( = ?auto_260622 ?auto_260623 ) ) ( not ( = ?auto_260622 ?auto_260624 ) ) ( not ( = ?auto_260622 ?auto_260625 ) ) ( not ( = ?auto_260622 ?auto_260626 ) ) ( not ( = ?auto_260622 ?auto_260627 ) ) ( not ( = ?auto_260622 ?auto_260628 ) ) ( not ( = ?auto_260622 ?auto_260629 ) ) ( not ( = ?auto_260622 ?auto_260630 ) ) ( not ( = ?auto_260622 ?auto_260631 ) ) ( not ( = ?auto_260622 ?auto_260632 ) ) ( not ( = ?auto_260622 ?auto_260633 ) ) ( not ( = ?auto_260623 ?auto_260624 ) ) ( not ( = ?auto_260623 ?auto_260625 ) ) ( not ( = ?auto_260623 ?auto_260626 ) ) ( not ( = ?auto_260623 ?auto_260627 ) ) ( not ( = ?auto_260623 ?auto_260628 ) ) ( not ( = ?auto_260623 ?auto_260629 ) ) ( not ( = ?auto_260623 ?auto_260630 ) ) ( not ( = ?auto_260623 ?auto_260631 ) ) ( not ( = ?auto_260623 ?auto_260632 ) ) ( not ( = ?auto_260623 ?auto_260633 ) ) ( not ( = ?auto_260624 ?auto_260625 ) ) ( not ( = ?auto_260624 ?auto_260626 ) ) ( not ( = ?auto_260624 ?auto_260627 ) ) ( not ( = ?auto_260624 ?auto_260628 ) ) ( not ( = ?auto_260624 ?auto_260629 ) ) ( not ( = ?auto_260624 ?auto_260630 ) ) ( not ( = ?auto_260624 ?auto_260631 ) ) ( not ( = ?auto_260624 ?auto_260632 ) ) ( not ( = ?auto_260624 ?auto_260633 ) ) ( not ( = ?auto_260625 ?auto_260626 ) ) ( not ( = ?auto_260625 ?auto_260627 ) ) ( not ( = ?auto_260625 ?auto_260628 ) ) ( not ( = ?auto_260625 ?auto_260629 ) ) ( not ( = ?auto_260625 ?auto_260630 ) ) ( not ( = ?auto_260625 ?auto_260631 ) ) ( not ( = ?auto_260625 ?auto_260632 ) ) ( not ( = ?auto_260625 ?auto_260633 ) ) ( not ( = ?auto_260626 ?auto_260627 ) ) ( not ( = ?auto_260626 ?auto_260628 ) ) ( not ( = ?auto_260626 ?auto_260629 ) ) ( not ( = ?auto_260626 ?auto_260630 ) ) ( not ( = ?auto_260626 ?auto_260631 ) ) ( not ( = ?auto_260626 ?auto_260632 ) ) ( not ( = ?auto_260626 ?auto_260633 ) ) ( not ( = ?auto_260627 ?auto_260628 ) ) ( not ( = ?auto_260627 ?auto_260629 ) ) ( not ( = ?auto_260627 ?auto_260630 ) ) ( not ( = ?auto_260627 ?auto_260631 ) ) ( not ( = ?auto_260627 ?auto_260632 ) ) ( not ( = ?auto_260627 ?auto_260633 ) ) ( not ( = ?auto_260628 ?auto_260629 ) ) ( not ( = ?auto_260628 ?auto_260630 ) ) ( not ( = ?auto_260628 ?auto_260631 ) ) ( not ( = ?auto_260628 ?auto_260632 ) ) ( not ( = ?auto_260628 ?auto_260633 ) ) ( not ( = ?auto_260629 ?auto_260630 ) ) ( not ( = ?auto_260629 ?auto_260631 ) ) ( not ( = ?auto_260629 ?auto_260632 ) ) ( not ( = ?auto_260629 ?auto_260633 ) ) ( not ( = ?auto_260630 ?auto_260631 ) ) ( not ( = ?auto_260630 ?auto_260632 ) ) ( not ( = ?auto_260630 ?auto_260633 ) ) ( not ( = ?auto_260631 ?auto_260632 ) ) ( not ( = ?auto_260631 ?auto_260633 ) ) ( not ( = ?auto_260632 ?auto_260633 ) ) ( ON ?auto_260632 ?auto_260633 ) ( ON ?auto_260631 ?auto_260632 ) ( ON ?auto_260630 ?auto_260631 ) ( ON ?auto_260629 ?auto_260630 ) ( CLEAR ?auto_260627 ) ( ON ?auto_260628 ?auto_260629 ) ( CLEAR ?auto_260628 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_260621 ?auto_260622 ?auto_260623 ?auto_260624 ?auto_260625 ?auto_260626 ?auto_260627 ?auto_260628 )
      ( MAKE-13PILE ?auto_260621 ?auto_260622 ?auto_260623 ?auto_260624 ?auto_260625 ?auto_260626 ?auto_260627 ?auto_260628 ?auto_260629 ?auto_260630 ?auto_260631 ?auto_260632 ?auto_260633 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_260647 - BLOCK
      ?auto_260648 - BLOCK
      ?auto_260649 - BLOCK
      ?auto_260650 - BLOCK
      ?auto_260651 - BLOCK
      ?auto_260652 - BLOCK
      ?auto_260653 - BLOCK
      ?auto_260654 - BLOCK
      ?auto_260655 - BLOCK
      ?auto_260656 - BLOCK
      ?auto_260657 - BLOCK
      ?auto_260658 - BLOCK
      ?auto_260659 - BLOCK
    )
    :vars
    (
      ?auto_260660 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_260659 ?auto_260660 ) ( ON-TABLE ?auto_260647 ) ( ON ?auto_260648 ?auto_260647 ) ( ON ?auto_260649 ?auto_260648 ) ( ON ?auto_260650 ?auto_260649 ) ( ON ?auto_260651 ?auto_260650 ) ( ON ?auto_260652 ?auto_260651 ) ( not ( = ?auto_260647 ?auto_260648 ) ) ( not ( = ?auto_260647 ?auto_260649 ) ) ( not ( = ?auto_260647 ?auto_260650 ) ) ( not ( = ?auto_260647 ?auto_260651 ) ) ( not ( = ?auto_260647 ?auto_260652 ) ) ( not ( = ?auto_260647 ?auto_260653 ) ) ( not ( = ?auto_260647 ?auto_260654 ) ) ( not ( = ?auto_260647 ?auto_260655 ) ) ( not ( = ?auto_260647 ?auto_260656 ) ) ( not ( = ?auto_260647 ?auto_260657 ) ) ( not ( = ?auto_260647 ?auto_260658 ) ) ( not ( = ?auto_260647 ?auto_260659 ) ) ( not ( = ?auto_260647 ?auto_260660 ) ) ( not ( = ?auto_260648 ?auto_260649 ) ) ( not ( = ?auto_260648 ?auto_260650 ) ) ( not ( = ?auto_260648 ?auto_260651 ) ) ( not ( = ?auto_260648 ?auto_260652 ) ) ( not ( = ?auto_260648 ?auto_260653 ) ) ( not ( = ?auto_260648 ?auto_260654 ) ) ( not ( = ?auto_260648 ?auto_260655 ) ) ( not ( = ?auto_260648 ?auto_260656 ) ) ( not ( = ?auto_260648 ?auto_260657 ) ) ( not ( = ?auto_260648 ?auto_260658 ) ) ( not ( = ?auto_260648 ?auto_260659 ) ) ( not ( = ?auto_260648 ?auto_260660 ) ) ( not ( = ?auto_260649 ?auto_260650 ) ) ( not ( = ?auto_260649 ?auto_260651 ) ) ( not ( = ?auto_260649 ?auto_260652 ) ) ( not ( = ?auto_260649 ?auto_260653 ) ) ( not ( = ?auto_260649 ?auto_260654 ) ) ( not ( = ?auto_260649 ?auto_260655 ) ) ( not ( = ?auto_260649 ?auto_260656 ) ) ( not ( = ?auto_260649 ?auto_260657 ) ) ( not ( = ?auto_260649 ?auto_260658 ) ) ( not ( = ?auto_260649 ?auto_260659 ) ) ( not ( = ?auto_260649 ?auto_260660 ) ) ( not ( = ?auto_260650 ?auto_260651 ) ) ( not ( = ?auto_260650 ?auto_260652 ) ) ( not ( = ?auto_260650 ?auto_260653 ) ) ( not ( = ?auto_260650 ?auto_260654 ) ) ( not ( = ?auto_260650 ?auto_260655 ) ) ( not ( = ?auto_260650 ?auto_260656 ) ) ( not ( = ?auto_260650 ?auto_260657 ) ) ( not ( = ?auto_260650 ?auto_260658 ) ) ( not ( = ?auto_260650 ?auto_260659 ) ) ( not ( = ?auto_260650 ?auto_260660 ) ) ( not ( = ?auto_260651 ?auto_260652 ) ) ( not ( = ?auto_260651 ?auto_260653 ) ) ( not ( = ?auto_260651 ?auto_260654 ) ) ( not ( = ?auto_260651 ?auto_260655 ) ) ( not ( = ?auto_260651 ?auto_260656 ) ) ( not ( = ?auto_260651 ?auto_260657 ) ) ( not ( = ?auto_260651 ?auto_260658 ) ) ( not ( = ?auto_260651 ?auto_260659 ) ) ( not ( = ?auto_260651 ?auto_260660 ) ) ( not ( = ?auto_260652 ?auto_260653 ) ) ( not ( = ?auto_260652 ?auto_260654 ) ) ( not ( = ?auto_260652 ?auto_260655 ) ) ( not ( = ?auto_260652 ?auto_260656 ) ) ( not ( = ?auto_260652 ?auto_260657 ) ) ( not ( = ?auto_260652 ?auto_260658 ) ) ( not ( = ?auto_260652 ?auto_260659 ) ) ( not ( = ?auto_260652 ?auto_260660 ) ) ( not ( = ?auto_260653 ?auto_260654 ) ) ( not ( = ?auto_260653 ?auto_260655 ) ) ( not ( = ?auto_260653 ?auto_260656 ) ) ( not ( = ?auto_260653 ?auto_260657 ) ) ( not ( = ?auto_260653 ?auto_260658 ) ) ( not ( = ?auto_260653 ?auto_260659 ) ) ( not ( = ?auto_260653 ?auto_260660 ) ) ( not ( = ?auto_260654 ?auto_260655 ) ) ( not ( = ?auto_260654 ?auto_260656 ) ) ( not ( = ?auto_260654 ?auto_260657 ) ) ( not ( = ?auto_260654 ?auto_260658 ) ) ( not ( = ?auto_260654 ?auto_260659 ) ) ( not ( = ?auto_260654 ?auto_260660 ) ) ( not ( = ?auto_260655 ?auto_260656 ) ) ( not ( = ?auto_260655 ?auto_260657 ) ) ( not ( = ?auto_260655 ?auto_260658 ) ) ( not ( = ?auto_260655 ?auto_260659 ) ) ( not ( = ?auto_260655 ?auto_260660 ) ) ( not ( = ?auto_260656 ?auto_260657 ) ) ( not ( = ?auto_260656 ?auto_260658 ) ) ( not ( = ?auto_260656 ?auto_260659 ) ) ( not ( = ?auto_260656 ?auto_260660 ) ) ( not ( = ?auto_260657 ?auto_260658 ) ) ( not ( = ?auto_260657 ?auto_260659 ) ) ( not ( = ?auto_260657 ?auto_260660 ) ) ( not ( = ?auto_260658 ?auto_260659 ) ) ( not ( = ?auto_260658 ?auto_260660 ) ) ( not ( = ?auto_260659 ?auto_260660 ) ) ( ON ?auto_260658 ?auto_260659 ) ( ON ?auto_260657 ?auto_260658 ) ( ON ?auto_260656 ?auto_260657 ) ( ON ?auto_260655 ?auto_260656 ) ( ON ?auto_260654 ?auto_260655 ) ( CLEAR ?auto_260652 ) ( ON ?auto_260653 ?auto_260654 ) ( CLEAR ?auto_260653 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_260647 ?auto_260648 ?auto_260649 ?auto_260650 ?auto_260651 ?auto_260652 ?auto_260653 )
      ( MAKE-13PILE ?auto_260647 ?auto_260648 ?auto_260649 ?auto_260650 ?auto_260651 ?auto_260652 ?auto_260653 ?auto_260654 ?auto_260655 ?auto_260656 ?auto_260657 ?auto_260658 ?auto_260659 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_260674 - BLOCK
      ?auto_260675 - BLOCK
      ?auto_260676 - BLOCK
      ?auto_260677 - BLOCK
      ?auto_260678 - BLOCK
      ?auto_260679 - BLOCK
      ?auto_260680 - BLOCK
      ?auto_260681 - BLOCK
      ?auto_260682 - BLOCK
      ?auto_260683 - BLOCK
      ?auto_260684 - BLOCK
      ?auto_260685 - BLOCK
      ?auto_260686 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_260686 ) ( ON-TABLE ?auto_260674 ) ( ON ?auto_260675 ?auto_260674 ) ( ON ?auto_260676 ?auto_260675 ) ( ON ?auto_260677 ?auto_260676 ) ( ON ?auto_260678 ?auto_260677 ) ( ON ?auto_260679 ?auto_260678 ) ( not ( = ?auto_260674 ?auto_260675 ) ) ( not ( = ?auto_260674 ?auto_260676 ) ) ( not ( = ?auto_260674 ?auto_260677 ) ) ( not ( = ?auto_260674 ?auto_260678 ) ) ( not ( = ?auto_260674 ?auto_260679 ) ) ( not ( = ?auto_260674 ?auto_260680 ) ) ( not ( = ?auto_260674 ?auto_260681 ) ) ( not ( = ?auto_260674 ?auto_260682 ) ) ( not ( = ?auto_260674 ?auto_260683 ) ) ( not ( = ?auto_260674 ?auto_260684 ) ) ( not ( = ?auto_260674 ?auto_260685 ) ) ( not ( = ?auto_260674 ?auto_260686 ) ) ( not ( = ?auto_260675 ?auto_260676 ) ) ( not ( = ?auto_260675 ?auto_260677 ) ) ( not ( = ?auto_260675 ?auto_260678 ) ) ( not ( = ?auto_260675 ?auto_260679 ) ) ( not ( = ?auto_260675 ?auto_260680 ) ) ( not ( = ?auto_260675 ?auto_260681 ) ) ( not ( = ?auto_260675 ?auto_260682 ) ) ( not ( = ?auto_260675 ?auto_260683 ) ) ( not ( = ?auto_260675 ?auto_260684 ) ) ( not ( = ?auto_260675 ?auto_260685 ) ) ( not ( = ?auto_260675 ?auto_260686 ) ) ( not ( = ?auto_260676 ?auto_260677 ) ) ( not ( = ?auto_260676 ?auto_260678 ) ) ( not ( = ?auto_260676 ?auto_260679 ) ) ( not ( = ?auto_260676 ?auto_260680 ) ) ( not ( = ?auto_260676 ?auto_260681 ) ) ( not ( = ?auto_260676 ?auto_260682 ) ) ( not ( = ?auto_260676 ?auto_260683 ) ) ( not ( = ?auto_260676 ?auto_260684 ) ) ( not ( = ?auto_260676 ?auto_260685 ) ) ( not ( = ?auto_260676 ?auto_260686 ) ) ( not ( = ?auto_260677 ?auto_260678 ) ) ( not ( = ?auto_260677 ?auto_260679 ) ) ( not ( = ?auto_260677 ?auto_260680 ) ) ( not ( = ?auto_260677 ?auto_260681 ) ) ( not ( = ?auto_260677 ?auto_260682 ) ) ( not ( = ?auto_260677 ?auto_260683 ) ) ( not ( = ?auto_260677 ?auto_260684 ) ) ( not ( = ?auto_260677 ?auto_260685 ) ) ( not ( = ?auto_260677 ?auto_260686 ) ) ( not ( = ?auto_260678 ?auto_260679 ) ) ( not ( = ?auto_260678 ?auto_260680 ) ) ( not ( = ?auto_260678 ?auto_260681 ) ) ( not ( = ?auto_260678 ?auto_260682 ) ) ( not ( = ?auto_260678 ?auto_260683 ) ) ( not ( = ?auto_260678 ?auto_260684 ) ) ( not ( = ?auto_260678 ?auto_260685 ) ) ( not ( = ?auto_260678 ?auto_260686 ) ) ( not ( = ?auto_260679 ?auto_260680 ) ) ( not ( = ?auto_260679 ?auto_260681 ) ) ( not ( = ?auto_260679 ?auto_260682 ) ) ( not ( = ?auto_260679 ?auto_260683 ) ) ( not ( = ?auto_260679 ?auto_260684 ) ) ( not ( = ?auto_260679 ?auto_260685 ) ) ( not ( = ?auto_260679 ?auto_260686 ) ) ( not ( = ?auto_260680 ?auto_260681 ) ) ( not ( = ?auto_260680 ?auto_260682 ) ) ( not ( = ?auto_260680 ?auto_260683 ) ) ( not ( = ?auto_260680 ?auto_260684 ) ) ( not ( = ?auto_260680 ?auto_260685 ) ) ( not ( = ?auto_260680 ?auto_260686 ) ) ( not ( = ?auto_260681 ?auto_260682 ) ) ( not ( = ?auto_260681 ?auto_260683 ) ) ( not ( = ?auto_260681 ?auto_260684 ) ) ( not ( = ?auto_260681 ?auto_260685 ) ) ( not ( = ?auto_260681 ?auto_260686 ) ) ( not ( = ?auto_260682 ?auto_260683 ) ) ( not ( = ?auto_260682 ?auto_260684 ) ) ( not ( = ?auto_260682 ?auto_260685 ) ) ( not ( = ?auto_260682 ?auto_260686 ) ) ( not ( = ?auto_260683 ?auto_260684 ) ) ( not ( = ?auto_260683 ?auto_260685 ) ) ( not ( = ?auto_260683 ?auto_260686 ) ) ( not ( = ?auto_260684 ?auto_260685 ) ) ( not ( = ?auto_260684 ?auto_260686 ) ) ( not ( = ?auto_260685 ?auto_260686 ) ) ( ON ?auto_260685 ?auto_260686 ) ( ON ?auto_260684 ?auto_260685 ) ( ON ?auto_260683 ?auto_260684 ) ( ON ?auto_260682 ?auto_260683 ) ( ON ?auto_260681 ?auto_260682 ) ( CLEAR ?auto_260679 ) ( ON ?auto_260680 ?auto_260681 ) ( CLEAR ?auto_260680 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_260674 ?auto_260675 ?auto_260676 ?auto_260677 ?auto_260678 ?auto_260679 ?auto_260680 )
      ( MAKE-13PILE ?auto_260674 ?auto_260675 ?auto_260676 ?auto_260677 ?auto_260678 ?auto_260679 ?auto_260680 ?auto_260681 ?auto_260682 ?auto_260683 ?auto_260684 ?auto_260685 ?auto_260686 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_260700 - BLOCK
      ?auto_260701 - BLOCK
      ?auto_260702 - BLOCK
      ?auto_260703 - BLOCK
      ?auto_260704 - BLOCK
      ?auto_260705 - BLOCK
      ?auto_260706 - BLOCK
      ?auto_260707 - BLOCK
      ?auto_260708 - BLOCK
      ?auto_260709 - BLOCK
      ?auto_260710 - BLOCK
      ?auto_260711 - BLOCK
      ?auto_260712 - BLOCK
    )
    :vars
    (
      ?auto_260713 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_260712 ?auto_260713 ) ( ON-TABLE ?auto_260700 ) ( ON ?auto_260701 ?auto_260700 ) ( ON ?auto_260702 ?auto_260701 ) ( ON ?auto_260703 ?auto_260702 ) ( ON ?auto_260704 ?auto_260703 ) ( not ( = ?auto_260700 ?auto_260701 ) ) ( not ( = ?auto_260700 ?auto_260702 ) ) ( not ( = ?auto_260700 ?auto_260703 ) ) ( not ( = ?auto_260700 ?auto_260704 ) ) ( not ( = ?auto_260700 ?auto_260705 ) ) ( not ( = ?auto_260700 ?auto_260706 ) ) ( not ( = ?auto_260700 ?auto_260707 ) ) ( not ( = ?auto_260700 ?auto_260708 ) ) ( not ( = ?auto_260700 ?auto_260709 ) ) ( not ( = ?auto_260700 ?auto_260710 ) ) ( not ( = ?auto_260700 ?auto_260711 ) ) ( not ( = ?auto_260700 ?auto_260712 ) ) ( not ( = ?auto_260700 ?auto_260713 ) ) ( not ( = ?auto_260701 ?auto_260702 ) ) ( not ( = ?auto_260701 ?auto_260703 ) ) ( not ( = ?auto_260701 ?auto_260704 ) ) ( not ( = ?auto_260701 ?auto_260705 ) ) ( not ( = ?auto_260701 ?auto_260706 ) ) ( not ( = ?auto_260701 ?auto_260707 ) ) ( not ( = ?auto_260701 ?auto_260708 ) ) ( not ( = ?auto_260701 ?auto_260709 ) ) ( not ( = ?auto_260701 ?auto_260710 ) ) ( not ( = ?auto_260701 ?auto_260711 ) ) ( not ( = ?auto_260701 ?auto_260712 ) ) ( not ( = ?auto_260701 ?auto_260713 ) ) ( not ( = ?auto_260702 ?auto_260703 ) ) ( not ( = ?auto_260702 ?auto_260704 ) ) ( not ( = ?auto_260702 ?auto_260705 ) ) ( not ( = ?auto_260702 ?auto_260706 ) ) ( not ( = ?auto_260702 ?auto_260707 ) ) ( not ( = ?auto_260702 ?auto_260708 ) ) ( not ( = ?auto_260702 ?auto_260709 ) ) ( not ( = ?auto_260702 ?auto_260710 ) ) ( not ( = ?auto_260702 ?auto_260711 ) ) ( not ( = ?auto_260702 ?auto_260712 ) ) ( not ( = ?auto_260702 ?auto_260713 ) ) ( not ( = ?auto_260703 ?auto_260704 ) ) ( not ( = ?auto_260703 ?auto_260705 ) ) ( not ( = ?auto_260703 ?auto_260706 ) ) ( not ( = ?auto_260703 ?auto_260707 ) ) ( not ( = ?auto_260703 ?auto_260708 ) ) ( not ( = ?auto_260703 ?auto_260709 ) ) ( not ( = ?auto_260703 ?auto_260710 ) ) ( not ( = ?auto_260703 ?auto_260711 ) ) ( not ( = ?auto_260703 ?auto_260712 ) ) ( not ( = ?auto_260703 ?auto_260713 ) ) ( not ( = ?auto_260704 ?auto_260705 ) ) ( not ( = ?auto_260704 ?auto_260706 ) ) ( not ( = ?auto_260704 ?auto_260707 ) ) ( not ( = ?auto_260704 ?auto_260708 ) ) ( not ( = ?auto_260704 ?auto_260709 ) ) ( not ( = ?auto_260704 ?auto_260710 ) ) ( not ( = ?auto_260704 ?auto_260711 ) ) ( not ( = ?auto_260704 ?auto_260712 ) ) ( not ( = ?auto_260704 ?auto_260713 ) ) ( not ( = ?auto_260705 ?auto_260706 ) ) ( not ( = ?auto_260705 ?auto_260707 ) ) ( not ( = ?auto_260705 ?auto_260708 ) ) ( not ( = ?auto_260705 ?auto_260709 ) ) ( not ( = ?auto_260705 ?auto_260710 ) ) ( not ( = ?auto_260705 ?auto_260711 ) ) ( not ( = ?auto_260705 ?auto_260712 ) ) ( not ( = ?auto_260705 ?auto_260713 ) ) ( not ( = ?auto_260706 ?auto_260707 ) ) ( not ( = ?auto_260706 ?auto_260708 ) ) ( not ( = ?auto_260706 ?auto_260709 ) ) ( not ( = ?auto_260706 ?auto_260710 ) ) ( not ( = ?auto_260706 ?auto_260711 ) ) ( not ( = ?auto_260706 ?auto_260712 ) ) ( not ( = ?auto_260706 ?auto_260713 ) ) ( not ( = ?auto_260707 ?auto_260708 ) ) ( not ( = ?auto_260707 ?auto_260709 ) ) ( not ( = ?auto_260707 ?auto_260710 ) ) ( not ( = ?auto_260707 ?auto_260711 ) ) ( not ( = ?auto_260707 ?auto_260712 ) ) ( not ( = ?auto_260707 ?auto_260713 ) ) ( not ( = ?auto_260708 ?auto_260709 ) ) ( not ( = ?auto_260708 ?auto_260710 ) ) ( not ( = ?auto_260708 ?auto_260711 ) ) ( not ( = ?auto_260708 ?auto_260712 ) ) ( not ( = ?auto_260708 ?auto_260713 ) ) ( not ( = ?auto_260709 ?auto_260710 ) ) ( not ( = ?auto_260709 ?auto_260711 ) ) ( not ( = ?auto_260709 ?auto_260712 ) ) ( not ( = ?auto_260709 ?auto_260713 ) ) ( not ( = ?auto_260710 ?auto_260711 ) ) ( not ( = ?auto_260710 ?auto_260712 ) ) ( not ( = ?auto_260710 ?auto_260713 ) ) ( not ( = ?auto_260711 ?auto_260712 ) ) ( not ( = ?auto_260711 ?auto_260713 ) ) ( not ( = ?auto_260712 ?auto_260713 ) ) ( ON ?auto_260711 ?auto_260712 ) ( ON ?auto_260710 ?auto_260711 ) ( ON ?auto_260709 ?auto_260710 ) ( ON ?auto_260708 ?auto_260709 ) ( ON ?auto_260707 ?auto_260708 ) ( ON ?auto_260706 ?auto_260707 ) ( CLEAR ?auto_260704 ) ( ON ?auto_260705 ?auto_260706 ) ( CLEAR ?auto_260705 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_260700 ?auto_260701 ?auto_260702 ?auto_260703 ?auto_260704 ?auto_260705 )
      ( MAKE-13PILE ?auto_260700 ?auto_260701 ?auto_260702 ?auto_260703 ?auto_260704 ?auto_260705 ?auto_260706 ?auto_260707 ?auto_260708 ?auto_260709 ?auto_260710 ?auto_260711 ?auto_260712 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_260727 - BLOCK
      ?auto_260728 - BLOCK
      ?auto_260729 - BLOCK
      ?auto_260730 - BLOCK
      ?auto_260731 - BLOCK
      ?auto_260732 - BLOCK
      ?auto_260733 - BLOCK
      ?auto_260734 - BLOCK
      ?auto_260735 - BLOCK
      ?auto_260736 - BLOCK
      ?auto_260737 - BLOCK
      ?auto_260738 - BLOCK
      ?auto_260739 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_260739 ) ( ON-TABLE ?auto_260727 ) ( ON ?auto_260728 ?auto_260727 ) ( ON ?auto_260729 ?auto_260728 ) ( ON ?auto_260730 ?auto_260729 ) ( ON ?auto_260731 ?auto_260730 ) ( not ( = ?auto_260727 ?auto_260728 ) ) ( not ( = ?auto_260727 ?auto_260729 ) ) ( not ( = ?auto_260727 ?auto_260730 ) ) ( not ( = ?auto_260727 ?auto_260731 ) ) ( not ( = ?auto_260727 ?auto_260732 ) ) ( not ( = ?auto_260727 ?auto_260733 ) ) ( not ( = ?auto_260727 ?auto_260734 ) ) ( not ( = ?auto_260727 ?auto_260735 ) ) ( not ( = ?auto_260727 ?auto_260736 ) ) ( not ( = ?auto_260727 ?auto_260737 ) ) ( not ( = ?auto_260727 ?auto_260738 ) ) ( not ( = ?auto_260727 ?auto_260739 ) ) ( not ( = ?auto_260728 ?auto_260729 ) ) ( not ( = ?auto_260728 ?auto_260730 ) ) ( not ( = ?auto_260728 ?auto_260731 ) ) ( not ( = ?auto_260728 ?auto_260732 ) ) ( not ( = ?auto_260728 ?auto_260733 ) ) ( not ( = ?auto_260728 ?auto_260734 ) ) ( not ( = ?auto_260728 ?auto_260735 ) ) ( not ( = ?auto_260728 ?auto_260736 ) ) ( not ( = ?auto_260728 ?auto_260737 ) ) ( not ( = ?auto_260728 ?auto_260738 ) ) ( not ( = ?auto_260728 ?auto_260739 ) ) ( not ( = ?auto_260729 ?auto_260730 ) ) ( not ( = ?auto_260729 ?auto_260731 ) ) ( not ( = ?auto_260729 ?auto_260732 ) ) ( not ( = ?auto_260729 ?auto_260733 ) ) ( not ( = ?auto_260729 ?auto_260734 ) ) ( not ( = ?auto_260729 ?auto_260735 ) ) ( not ( = ?auto_260729 ?auto_260736 ) ) ( not ( = ?auto_260729 ?auto_260737 ) ) ( not ( = ?auto_260729 ?auto_260738 ) ) ( not ( = ?auto_260729 ?auto_260739 ) ) ( not ( = ?auto_260730 ?auto_260731 ) ) ( not ( = ?auto_260730 ?auto_260732 ) ) ( not ( = ?auto_260730 ?auto_260733 ) ) ( not ( = ?auto_260730 ?auto_260734 ) ) ( not ( = ?auto_260730 ?auto_260735 ) ) ( not ( = ?auto_260730 ?auto_260736 ) ) ( not ( = ?auto_260730 ?auto_260737 ) ) ( not ( = ?auto_260730 ?auto_260738 ) ) ( not ( = ?auto_260730 ?auto_260739 ) ) ( not ( = ?auto_260731 ?auto_260732 ) ) ( not ( = ?auto_260731 ?auto_260733 ) ) ( not ( = ?auto_260731 ?auto_260734 ) ) ( not ( = ?auto_260731 ?auto_260735 ) ) ( not ( = ?auto_260731 ?auto_260736 ) ) ( not ( = ?auto_260731 ?auto_260737 ) ) ( not ( = ?auto_260731 ?auto_260738 ) ) ( not ( = ?auto_260731 ?auto_260739 ) ) ( not ( = ?auto_260732 ?auto_260733 ) ) ( not ( = ?auto_260732 ?auto_260734 ) ) ( not ( = ?auto_260732 ?auto_260735 ) ) ( not ( = ?auto_260732 ?auto_260736 ) ) ( not ( = ?auto_260732 ?auto_260737 ) ) ( not ( = ?auto_260732 ?auto_260738 ) ) ( not ( = ?auto_260732 ?auto_260739 ) ) ( not ( = ?auto_260733 ?auto_260734 ) ) ( not ( = ?auto_260733 ?auto_260735 ) ) ( not ( = ?auto_260733 ?auto_260736 ) ) ( not ( = ?auto_260733 ?auto_260737 ) ) ( not ( = ?auto_260733 ?auto_260738 ) ) ( not ( = ?auto_260733 ?auto_260739 ) ) ( not ( = ?auto_260734 ?auto_260735 ) ) ( not ( = ?auto_260734 ?auto_260736 ) ) ( not ( = ?auto_260734 ?auto_260737 ) ) ( not ( = ?auto_260734 ?auto_260738 ) ) ( not ( = ?auto_260734 ?auto_260739 ) ) ( not ( = ?auto_260735 ?auto_260736 ) ) ( not ( = ?auto_260735 ?auto_260737 ) ) ( not ( = ?auto_260735 ?auto_260738 ) ) ( not ( = ?auto_260735 ?auto_260739 ) ) ( not ( = ?auto_260736 ?auto_260737 ) ) ( not ( = ?auto_260736 ?auto_260738 ) ) ( not ( = ?auto_260736 ?auto_260739 ) ) ( not ( = ?auto_260737 ?auto_260738 ) ) ( not ( = ?auto_260737 ?auto_260739 ) ) ( not ( = ?auto_260738 ?auto_260739 ) ) ( ON ?auto_260738 ?auto_260739 ) ( ON ?auto_260737 ?auto_260738 ) ( ON ?auto_260736 ?auto_260737 ) ( ON ?auto_260735 ?auto_260736 ) ( ON ?auto_260734 ?auto_260735 ) ( ON ?auto_260733 ?auto_260734 ) ( CLEAR ?auto_260731 ) ( ON ?auto_260732 ?auto_260733 ) ( CLEAR ?auto_260732 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_260727 ?auto_260728 ?auto_260729 ?auto_260730 ?auto_260731 ?auto_260732 )
      ( MAKE-13PILE ?auto_260727 ?auto_260728 ?auto_260729 ?auto_260730 ?auto_260731 ?auto_260732 ?auto_260733 ?auto_260734 ?auto_260735 ?auto_260736 ?auto_260737 ?auto_260738 ?auto_260739 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_260753 - BLOCK
      ?auto_260754 - BLOCK
      ?auto_260755 - BLOCK
      ?auto_260756 - BLOCK
      ?auto_260757 - BLOCK
      ?auto_260758 - BLOCK
      ?auto_260759 - BLOCK
      ?auto_260760 - BLOCK
      ?auto_260761 - BLOCK
      ?auto_260762 - BLOCK
      ?auto_260763 - BLOCK
      ?auto_260764 - BLOCK
      ?auto_260765 - BLOCK
    )
    :vars
    (
      ?auto_260766 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_260765 ?auto_260766 ) ( ON-TABLE ?auto_260753 ) ( ON ?auto_260754 ?auto_260753 ) ( ON ?auto_260755 ?auto_260754 ) ( ON ?auto_260756 ?auto_260755 ) ( not ( = ?auto_260753 ?auto_260754 ) ) ( not ( = ?auto_260753 ?auto_260755 ) ) ( not ( = ?auto_260753 ?auto_260756 ) ) ( not ( = ?auto_260753 ?auto_260757 ) ) ( not ( = ?auto_260753 ?auto_260758 ) ) ( not ( = ?auto_260753 ?auto_260759 ) ) ( not ( = ?auto_260753 ?auto_260760 ) ) ( not ( = ?auto_260753 ?auto_260761 ) ) ( not ( = ?auto_260753 ?auto_260762 ) ) ( not ( = ?auto_260753 ?auto_260763 ) ) ( not ( = ?auto_260753 ?auto_260764 ) ) ( not ( = ?auto_260753 ?auto_260765 ) ) ( not ( = ?auto_260753 ?auto_260766 ) ) ( not ( = ?auto_260754 ?auto_260755 ) ) ( not ( = ?auto_260754 ?auto_260756 ) ) ( not ( = ?auto_260754 ?auto_260757 ) ) ( not ( = ?auto_260754 ?auto_260758 ) ) ( not ( = ?auto_260754 ?auto_260759 ) ) ( not ( = ?auto_260754 ?auto_260760 ) ) ( not ( = ?auto_260754 ?auto_260761 ) ) ( not ( = ?auto_260754 ?auto_260762 ) ) ( not ( = ?auto_260754 ?auto_260763 ) ) ( not ( = ?auto_260754 ?auto_260764 ) ) ( not ( = ?auto_260754 ?auto_260765 ) ) ( not ( = ?auto_260754 ?auto_260766 ) ) ( not ( = ?auto_260755 ?auto_260756 ) ) ( not ( = ?auto_260755 ?auto_260757 ) ) ( not ( = ?auto_260755 ?auto_260758 ) ) ( not ( = ?auto_260755 ?auto_260759 ) ) ( not ( = ?auto_260755 ?auto_260760 ) ) ( not ( = ?auto_260755 ?auto_260761 ) ) ( not ( = ?auto_260755 ?auto_260762 ) ) ( not ( = ?auto_260755 ?auto_260763 ) ) ( not ( = ?auto_260755 ?auto_260764 ) ) ( not ( = ?auto_260755 ?auto_260765 ) ) ( not ( = ?auto_260755 ?auto_260766 ) ) ( not ( = ?auto_260756 ?auto_260757 ) ) ( not ( = ?auto_260756 ?auto_260758 ) ) ( not ( = ?auto_260756 ?auto_260759 ) ) ( not ( = ?auto_260756 ?auto_260760 ) ) ( not ( = ?auto_260756 ?auto_260761 ) ) ( not ( = ?auto_260756 ?auto_260762 ) ) ( not ( = ?auto_260756 ?auto_260763 ) ) ( not ( = ?auto_260756 ?auto_260764 ) ) ( not ( = ?auto_260756 ?auto_260765 ) ) ( not ( = ?auto_260756 ?auto_260766 ) ) ( not ( = ?auto_260757 ?auto_260758 ) ) ( not ( = ?auto_260757 ?auto_260759 ) ) ( not ( = ?auto_260757 ?auto_260760 ) ) ( not ( = ?auto_260757 ?auto_260761 ) ) ( not ( = ?auto_260757 ?auto_260762 ) ) ( not ( = ?auto_260757 ?auto_260763 ) ) ( not ( = ?auto_260757 ?auto_260764 ) ) ( not ( = ?auto_260757 ?auto_260765 ) ) ( not ( = ?auto_260757 ?auto_260766 ) ) ( not ( = ?auto_260758 ?auto_260759 ) ) ( not ( = ?auto_260758 ?auto_260760 ) ) ( not ( = ?auto_260758 ?auto_260761 ) ) ( not ( = ?auto_260758 ?auto_260762 ) ) ( not ( = ?auto_260758 ?auto_260763 ) ) ( not ( = ?auto_260758 ?auto_260764 ) ) ( not ( = ?auto_260758 ?auto_260765 ) ) ( not ( = ?auto_260758 ?auto_260766 ) ) ( not ( = ?auto_260759 ?auto_260760 ) ) ( not ( = ?auto_260759 ?auto_260761 ) ) ( not ( = ?auto_260759 ?auto_260762 ) ) ( not ( = ?auto_260759 ?auto_260763 ) ) ( not ( = ?auto_260759 ?auto_260764 ) ) ( not ( = ?auto_260759 ?auto_260765 ) ) ( not ( = ?auto_260759 ?auto_260766 ) ) ( not ( = ?auto_260760 ?auto_260761 ) ) ( not ( = ?auto_260760 ?auto_260762 ) ) ( not ( = ?auto_260760 ?auto_260763 ) ) ( not ( = ?auto_260760 ?auto_260764 ) ) ( not ( = ?auto_260760 ?auto_260765 ) ) ( not ( = ?auto_260760 ?auto_260766 ) ) ( not ( = ?auto_260761 ?auto_260762 ) ) ( not ( = ?auto_260761 ?auto_260763 ) ) ( not ( = ?auto_260761 ?auto_260764 ) ) ( not ( = ?auto_260761 ?auto_260765 ) ) ( not ( = ?auto_260761 ?auto_260766 ) ) ( not ( = ?auto_260762 ?auto_260763 ) ) ( not ( = ?auto_260762 ?auto_260764 ) ) ( not ( = ?auto_260762 ?auto_260765 ) ) ( not ( = ?auto_260762 ?auto_260766 ) ) ( not ( = ?auto_260763 ?auto_260764 ) ) ( not ( = ?auto_260763 ?auto_260765 ) ) ( not ( = ?auto_260763 ?auto_260766 ) ) ( not ( = ?auto_260764 ?auto_260765 ) ) ( not ( = ?auto_260764 ?auto_260766 ) ) ( not ( = ?auto_260765 ?auto_260766 ) ) ( ON ?auto_260764 ?auto_260765 ) ( ON ?auto_260763 ?auto_260764 ) ( ON ?auto_260762 ?auto_260763 ) ( ON ?auto_260761 ?auto_260762 ) ( ON ?auto_260760 ?auto_260761 ) ( ON ?auto_260759 ?auto_260760 ) ( ON ?auto_260758 ?auto_260759 ) ( CLEAR ?auto_260756 ) ( ON ?auto_260757 ?auto_260758 ) ( CLEAR ?auto_260757 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_260753 ?auto_260754 ?auto_260755 ?auto_260756 ?auto_260757 )
      ( MAKE-13PILE ?auto_260753 ?auto_260754 ?auto_260755 ?auto_260756 ?auto_260757 ?auto_260758 ?auto_260759 ?auto_260760 ?auto_260761 ?auto_260762 ?auto_260763 ?auto_260764 ?auto_260765 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_260780 - BLOCK
      ?auto_260781 - BLOCK
      ?auto_260782 - BLOCK
      ?auto_260783 - BLOCK
      ?auto_260784 - BLOCK
      ?auto_260785 - BLOCK
      ?auto_260786 - BLOCK
      ?auto_260787 - BLOCK
      ?auto_260788 - BLOCK
      ?auto_260789 - BLOCK
      ?auto_260790 - BLOCK
      ?auto_260791 - BLOCK
      ?auto_260792 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_260792 ) ( ON-TABLE ?auto_260780 ) ( ON ?auto_260781 ?auto_260780 ) ( ON ?auto_260782 ?auto_260781 ) ( ON ?auto_260783 ?auto_260782 ) ( not ( = ?auto_260780 ?auto_260781 ) ) ( not ( = ?auto_260780 ?auto_260782 ) ) ( not ( = ?auto_260780 ?auto_260783 ) ) ( not ( = ?auto_260780 ?auto_260784 ) ) ( not ( = ?auto_260780 ?auto_260785 ) ) ( not ( = ?auto_260780 ?auto_260786 ) ) ( not ( = ?auto_260780 ?auto_260787 ) ) ( not ( = ?auto_260780 ?auto_260788 ) ) ( not ( = ?auto_260780 ?auto_260789 ) ) ( not ( = ?auto_260780 ?auto_260790 ) ) ( not ( = ?auto_260780 ?auto_260791 ) ) ( not ( = ?auto_260780 ?auto_260792 ) ) ( not ( = ?auto_260781 ?auto_260782 ) ) ( not ( = ?auto_260781 ?auto_260783 ) ) ( not ( = ?auto_260781 ?auto_260784 ) ) ( not ( = ?auto_260781 ?auto_260785 ) ) ( not ( = ?auto_260781 ?auto_260786 ) ) ( not ( = ?auto_260781 ?auto_260787 ) ) ( not ( = ?auto_260781 ?auto_260788 ) ) ( not ( = ?auto_260781 ?auto_260789 ) ) ( not ( = ?auto_260781 ?auto_260790 ) ) ( not ( = ?auto_260781 ?auto_260791 ) ) ( not ( = ?auto_260781 ?auto_260792 ) ) ( not ( = ?auto_260782 ?auto_260783 ) ) ( not ( = ?auto_260782 ?auto_260784 ) ) ( not ( = ?auto_260782 ?auto_260785 ) ) ( not ( = ?auto_260782 ?auto_260786 ) ) ( not ( = ?auto_260782 ?auto_260787 ) ) ( not ( = ?auto_260782 ?auto_260788 ) ) ( not ( = ?auto_260782 ?auto_260789 ) ) ( not ( = ?auto_260782 ?auto_260790 ) ) ( not ( = ?auto_260782 ?auto_260791 ) ) ( not ( = ?auto_260782 ?auto_260792 ) ) ( not ( = ?auto_260783 ?auto_260784 ) ) ( not ( = ?auto_260783 ?auto_260785 ) ) ( not ( = ?auto_260783 ?auto_260786 ) ) ( not ( = ?auto_260783 ?auto_260787 ) ) ( not ( = ?auto_260783 ?auto_260788 ) ) ( not ( = ?auto_260783 ?auto_260789 ) ) ( not ( = ?auto_260783 ?auto_260790 ) ) ( not ( = ?auto_260783 ?auto_260791 ) ) ( not ( = ?auto_260783 ?auto_260792 ) ) ( not ( = ?auto_260784 ?auto_260785 ) ) ( not ( = ?auto_260784 ?auto_260786 ) ) ( not ( = ?auto_260784 ?auto_260787 ) ) ( not ( = ?auto_260784 ?auto_260788 ) ) ( not ( = ?auto_260784 ?auto_260789 ) ) ( not ( = ?auto_260784 ?auto_260790 ) ) ( not ( = ?auto_260784 ?auto_260791 ) ) ( not ( = ?auto_260784 ?auto_260792 ) ) ( not ( = ?auto_260785 ?auto_260786 ) ) ( not ( = ?auto_260785 ?auto_260787 ) ) ( not ( = ?auto_260785 ?auto_260788 ) ) ( not ( = ?auto_260785 ?auto_260789 ) ) ( not ( = ?auto_260785 ?auto_260790 ) ) ( not ( = ?auto_260785 ?auto_260791 ) ) ( not ( = ?auto_260785 ?auto_260792 ) ) ( not ( = ?auto_260786 ?auto_260787 ) ) ( not ( = ?auto_260786 ?auto_260788 ) ) ( not ( = ?auto_260786 ?auto_260789 ) ) ( not ( = ?auto_260786 ?auto_260790 ) ) ( not ( = ?auto_260786 ?auto_260791 ) ) ( not ( = ?auto_260786 ?auto_260792 ) ) ( not ( = ?auto_260787 ?auto_260788 ) ) ( not ( = ?auto_260787 ?auto_260789 ) ) ( not ( = ?auto_260787 ?auto_260790 ) ) ( not ( = ?auto_260787 ?auto_260791 ) ) ( not ( = ?auto_260787 ?auto_260792 ) ) ( not ( = ?auto_260788 ?auto_260789 ) ) ( not ( = ?auto_260788 ?auto_260790 ) ) ( not ( = ?auto_260788 ?auto_260791 ) ) ( not ( = ?auto_260788 ?auto_260792 ) ) ( not ( = ?auto_260789 ?auto_260790 ) ) ( not ( = ?auto_260789 ?auto_260791 ) ) ( not ( = ?auto_260789 ?auto_260792 ) ) ( not ( = ?auto_260790 ?auto_260791 ) ) ( not ( = ?auto_260790 ?auto_260792 ) ) ( not ( = ?auto_260791 ?auto_260792 ) ) ( ON ?auto_260791 ?auto_260792 ) ( ON ?auto_260790 ?auto_260791 ) ( ON ?auto_260789 ?auto_260790 ) ( ON ?auto_260788 ?auto_260789 ) ( ON ?auto_260787 ?auto_260788 ) ( ON ?auto_260786 ?auto_260787 ) ( ON ?auto_260785 ?auto_260786 ) ( CLEAR ?auto_260783 ) ( ON ?auto_260784 ?auto_260785 ) ( CLEAR ?auto_260784 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_260780 ?auto_260781 ?auto_260782 ?auto_260783 ?auto_260784 )
      ( MAKE-13PILE ?auto_260780 ?auto_260781 ?auto_260782 ?auto_260783 ?auto_260784 ?auto_260785 ?auto_260786 ?auto_260787 ?auto_260788 ?auto_260789 ?auto_260790 ?auto_260791 ?auto_260792 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_260806 - BLOCK
      ?auto_260807 - BLOCK
      ?auto_260808 - BLOCK
      ?auto_260809 - BLOCK
      ?auto_260810 - BLOCK
      ?auto_260811 - BLOCK
      ?auto_260812 - BLOCK
      ?auto_260813 - BLOCK
      ?auto_260814 - BLOCK
      ?auto_260815 - BLOCK
      ?auto_260816 - BLOCK
      ?auto_260817 - BLOCK
      ?auto_260818 - BLOCK
    )
    :vars
    (
      ?auto_260819 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_260818 ?auto_260819 ) ( ON-TABLE ?auto_260806 ) ( ON ?auto_260807 ?auto_260806 ) ( ON ?auto_260808 ?auto_260807 ) ( not ( = ?auto_260806 ?auto_260807 ) ) ( not ( = ?auto_260806 ?auto_260808 ) ) ( not ( = ?auto_260806 ?auto_260809 ) ) ( not ( = ?auto_260806 ?auto_260810 ) ) ( not ( = ?auto_260806 ?auto_260811 ) ) ( not ( = ?auto_260806 ?auto_260812 ) ) ( not ( = ?auto_260806 ?auto_260813 ) ) ( not ( = ?auto_260806 ?auto_260814 ) ) ( not ( = ?auto_260806 ?auto_260815 ) ) ( not ( = ?auto_260806 ?auto_260816 ) ) ( not ( = ?auto_260806 ?auto_260817 ) ) ( not ( = ?auto_260806 ?auto_260818 ) ) ( not ( = ?auto_260806 ?auto_260819 ) ) ( not ( = ?auto_260807 ?auto_260808 ) ) ( not ( = ?auto_260807 ?auto_260809 ) ) ( not ( = ?auto_260807 ?auto_260810 ) ) ( not ( = ?auto_260807 ?auto_260811 ) ) ( not ( = ?auto_260807 ?auto_260812 ) ) ( not ( = ?auto_260807 ?auto_260813 ) ) ( not ( = ?auto_260807 ?auto_260814 ) ) ( not ( = ?auto_260807 ?auto_260815 ) ) ( not ( = ?auto_260807 ?auto_260816 ) ) ( not ( = ?auto_260807 ?auto_260817 ) ) ( not ( = ?auto_260807 ?auto_260818 ) ) ( not ( = ?auto_260807 ?auto_260819 ) ) ( not ( = ?auto_260808 ?auto_260809 ) ) ( not ( = ?auto_260808 ?auto_260810 ) ) ( not ( = ?auto_260808 ?auto_260811 ) ) ( not ( = ?auto_260808 ?auto_260812 ) ) ( not ( = ?auto_260808 ?auto_260813 ) ) ( not ( = ?auto_260808 ?auto_260814 ) ) ( not ( = ?auto_260808 ?auto_260815 ) ) ( not ( = ?auto_260808 ?auto_260816 ) ) ( not ( = ?auto_260808 ?auto_260817 ) ) ( not ( = ?auto_260808 ?auto_260818 ) ) ( not ( = ?auto_260808 ?auto_260819 ) ) ( not ( = ?auto_260809 ?auto_260810 ) ) ( not ( = ?auto_260809 ?auto_260811 ) ) ( not ( = ?auto_260809 ?auto_260812 ) ) ( not ( = ?auto_260809 ?auto_260813 ) ) ( not ( = ?auto_260809 ?auto_260814 ) ) ( not ( = ?auto_260809 ?auto_260815 ) ) ( not ( = ?auto_260809 ?auto_260816 ) ) ( not ( = ?auto_260809 ?auto_260817 ) ) ( not ( = ?auto_260809 ?auto_260818 ) ) ( not ( = ?auto_260809 ?auto_260819 ) ) ( not ( = ?auto_260810 ?auto_260811 ) ) ( not ( = ?auto_260810 ?auto_260812 ) ) ( not ( = ?auto_260810 ?auto_260813 ) ) ( not ( = ?auto_260810 ?auto_260814 ) ) ( not ( = ?auto_260810 ?auto_260815 ) ) ( not ( = ?auto_260810 ?auto_260816 ) ) ( not ( = ?auto_260810 ?auto_260817 ) ) ( not ( = ?auto_260810 ?auto_260818 ) ) ( not ( = ?auto_260810 ?auto_260819 ) ) ( not ( = ?auto_260811 ?auto_260812 ) ) ( not ( = ?auto_260811 ?auto_260813 ) ) ( not ( = ?auto_260811 ?auto_260814 ) ) ( not ( = ?auto_260811 ?auto_260815 ) ) ( not ( = ?auto_260811 ?auto_260816 ) ) ( not ( = ?auto_260811 ?auto_260817 ) ) ( not ( = ?auto_260811 ?auto_260818 ) ) ( not ( = ?auto_260811 ?auto_260819 ) ) ( not ( = ?auto_260812 ?auto_260813 ) ) ( not ( = ?auto_260812 ?auto_260814 ) ) ( not ( = ?auto_260812 ?auto_260815 ) ) ( not ( = ?auto_260812 ?auto_260816 ) ) ( not ( = ?auto_260812 ?auto_260817 ) ) ( not ( = ?auto_260812 ?auto_260818 ) ) ( not ( = ?auto_260812 ?auto_260819 ) ) ( not ( = ?auto_260813 ?auto_260814 ) ) ( not ( = ?auto_260813 ?auto_260815 ) ) ( not ( = ?auto_260813 ?auto_260816 ) ) ( not ( = ?auto_260813 ?auto_260817 ) ) ( not ( = ?auto_260813 ?auto_260818 ) ) ( not ( = ?auto_260813 ?auto_260819 ) ) ( not ( = ?auto_260814 ?auto_260815 ) ) ( not ( = ?auto_260814 ?auto_260816 ) ) ( not ( = ?auto_260814 ?auto_260817 ) ) ( not ( = ?auto_260814 ?auto_260818 ) ) ( not ( = ?auto_260814 ?auto_260819 ) ) ( not ( = ?auto_260815 ?auto_260816 ) ) ( not ( = ?auto_260815 ?auto_260817 ) ) ( not ( = ?auto_260815 ?auto_260818 ) ) ( not ( = ?auto_260815 ?auto_260819 ) ) ( not ( = ?auto_260816 ?auto_260817 ) ) ( not ( = ?auto_260816 ?auto_260818 ) ) ( not ( = ?auto_260816 ?auto_260819 ) ) ( not ( = ?auto_260817 ?auto_260818 ) ) ( not ( = ?auto_260817 ?auto_260819 ) ) ( not ( = ?auto_260818 ?auto_260819 ) ) ( ON ?auto_260817 ?auto_260818 ) ( ON ?auto_260816 ?auto_260817 ) ( ON ?auto_260815 ?auto_260816 ) ( ON ?auto_260814 ?auto_260815 ) ( ON ?auto_260813 ?auto_260814 ) ( ON ?auto_260812 ?auto_260813 ) ( ON ?auto_260811 ?auto_260812 ) ( ON ?auto_260810 ?auto_260811 ) ( CLEAR ?auto_260808 ) ( ON ?auto_260809 ?auto_260810 ) ( CLEAR ?auto_260809 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_260806 ?auto_260807 ?auto_260808 ?auto_260809 )
      ( MAKE-13PILE ?auto_260806 ?auto_260807 ?auto_260808 ?auto_260809 ?auto_260810 ?auto_260811 ?auto_260812 ?auto_260813 ?auto_260814 ?auto_260815 ?auto_260816 ?auto_260817 ?auto_260818 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_260833 - BLOCK
      ?auto_260834 - BLOCK
      ?auto_260835 - BLOCK
      ?auto_260836 - BLOCK
      ?auto_260837 - BLOCK
      ?auto_260838 - BLOCK
      ?auto_260839 - BLOCK
      ?auto_260840 - BLOCK
      ?auto_260841 - BLOCK
      ?auto_260842 - BLOCK
      ?auto_260843 - BLOCK
      ?auto_260844 - BLOCK
      ?auto_260845 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_260845 ) ( ON-TABLE ?auto_260833 ) ( ON ?auto_260834 ?auto_260833 ) ( ON ?auto_260835 ?auto_260834 ) ( not ( = ?auto_260833 ?auto_260834 ) ) ( not ( = ?auto_260833 ?auto_260835 ) ) ( not ( = ?auto_260833 ?auto_260836 ) ) ( not ( = ?auto_260833 ?auto_260837 ) ) ( not ( = ?auto_260833 ?auto_260838 ) ) ( not ( = ?auto_260833 ?auto_260839 ) ) ( not ( = ?auto_260833 ?auto_260840 ) ) ( not ( = ?auto_260833 ?auto_260841 ) ) ( not ( = ?auto_260833 ?auto_260842 ) ) ( not ( = ?auto_260833 ?auto_260843 ) ) ( not ( = ?auto_260833 ?auto_260844 ) ) ( not ( = ?auto_260833 ?auto_260845 ) ) ( not ( = ?auto_260834 ?auto_260835 ) ) ( not ( = ?auto_260834 ?auto_260836 ) ) ( not ( = ?auto_260834 ?auto_260837 ) ) ( not ( = ?auto_260834 ?auto_260838 ) ) ( not ( = ?auto_260834 ?auto_260839 ) ) ( not ( = ?auto_260834 ?auto_260840 ) ) ( not ( = ?auto_260834 ?auto_260841 ) ) ( not ( = ?auto_260834 ?auto_260842 ) ) ( not ( = ?auto_260834 ?auto_260843 ) ) ( not ( = ?auto_260834 ?auto_260844 ) ) ( not ( = ?auto_260834 ?auto_260845 ) ) ( not ( = ?auto_260835 ?auto_260836 ) ) ( not ( = ?auto_260835 ?auto_260837 ) ) ( not ( = ?auto_260835 ?auto_260838 ) ) ( not ( = ?auto_260835 ?auto_260839 ) ) ( not ( = ?auto_260835 ?auto_260840 ) ) ( not ( = ?auto_260835 ?auto_260841 ) ) ( not ( = ?auto_260835 ?auto_260842 ) ) ( not ( = ?auto_260835 ?auto_260843 ) ) ( not ( = ?auto_260835 ?auto_260844 ) ) ( not ( = ?auto_260835 ?auto_260845 ) ) ( not ( = ?auto_260836 ?auto_260837 ) ) ( not ( = ?auto_260836 ?auto_260838 ) ) ( not ( = ?auto_260836 ?auto_260839 ) ) ( not ( = ?auto_260836 ?auto_260840 ) ) ( not ( = ?auto_260836 ?auto_260841 ) ) ( not ( = ?auto_260836 ?auto_260842 ) ) ( not ( = ?auto_260836 ?auto_260843 ) ) ( not ( = ?auto_260836 ?auto_260844 ) ) ( not ( = ?auto_260836 ?auto_260845 ) ) ( not ( = ?auto_260837 ?auto_260838 ) ) ( not ( = ?auto_260837 ?auto_260839 ) ) ( not ( = ?auto_260837 ?auto_260840 ) ) ( not ( = ?auto_260837 ?auto_260841 ) ) ( not ( = ?auto_260837 ?auto_260842 ) ) ( not ( = ?auto_260837 ?auto_260843 ) ) ( not ( = ?auto_260837 ?auto_260844 ) ) ( not ( = ?auto_260837 ?auto_260845 ) ) ( not ( = ?auto_260838 ?auto_260839 ) ) ( not ( = ?auto_260838 ?auto_260840 ) ) ( not ( = ?auto_260838 ?auto_260841 ) ) ( not ( = ?auto_260838 ?auto_260842 ) ) ( not ( = ?auto_260838 ?auto_260843 ) ) ( not ( = ?auto_260838 ?auto_260844 ) ) ( not ( = ?auto_260838 ?auto_260845 ) ) ( not ( = ?auto_260839 ?auto_260840 ) ) ( not ( = ?auto_260839 ?auto_260841 ) ) ( not ( = ?auto_260839 ?auto_260842 ) ) ( not ( = ?auto_260839 ?auto_260843 ) ) ( not ( = ?auto_260839 ?auto_260844 ) ) ( not ( = ?auto_260839 ?auto_260845 ) ) ( not ( = ?auto_260840 ?auto_260841 ) ) ( not ( = ?auto_260840 ?auto_260842 ) ) ( not ( = ?auto_260840 ?auto_260843 ) ) ( not ( = ?auto_260840 ?auto_260844 ) ) ( not ( = ?auto_260840 ?auto_260845 ) ) ( not ( = ?auto_260841 ?auto_260842 ) ) ( not ( = ?auto_260841 ?auto_260843 ) ) ( not ( = ?auto_260841 ?auto_260844 ) ) ( not ( = ?auto_260841 ?auto_260845 ) ) ( not ( = ?auto_260842 ?auto_260843 ) ) ( not ( = ?auto_260842 ?auto_260844 ) ) ( not ( = ?auto_260842 ?auto_260845 ) ) ( not ( = ?auto_260843 ?auto_260844 ) ) ( not ( = ?auto_260843 ?auto_260845 ) ) ( not ( = ?auto_260844 ?auto_260845 ) ) ( ON ?auto_260844 ?auto_260845 ) ( ON ?auto_260843 ?auto_260844 ) ( ON ?auto_260842 ?auto_260843 ) ( ON ?auto_260841 ?auto_260842 ) ( ON ?auto_260840 ?auto_260841 ) ( ON ?auto_260839 ?auto_260840 ) ( ON ?auto_260838 ?auto_260839 ) ( ON ?auto_260837 ?auto_260838 ) ( CLEAR ?auto_260835 ) ( ON ?auto_260836 ?auto_260837 ) ( CLEAR ?auto_260836 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_260833 ?auto_260834 ?auto_260835 ?auto_260836 )
      ( MAKE-13PILE ?auto_260833 ?auto_260834 ?auto_260835 ?auto_260836 ?auto_260837 ?auto_260838 ?auto_260839 ?auto_260840 ?auto_260841 ?auto_260842 ?auto_260843 ?auto_260844 ?auto_260845 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_260859 - BLOCK
      ?auto_260860 - BLOCK
      ?auto_260861 - BLOCK
      ?auto_260862 - BLOCK
      ?auto_260863 - BLOCK
      ?auto_260864 - BLOCK
      ?auto_260865 - BLOCK
      ?auto_260866 - BLOCK
      ?auto_260867 - BLOCK
      ?auto_260868 - BLOCK
      ?auto_260869 - BLOCK
      ?auto_260870 - BLOCK
      ?auto_260871 - BLOCK
    )
    :vars
    (
      ?auto_260872 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_260871 ?auto_260872 ) ( ON-TABLE ?auto_260859 ) ( ON ?auto_260860 ?auto_260859 ) ( not ( = ?auto_260859 ?auto_260860 ) ) ( not ( = ?auto_260859 ?auto_260861 ) ) ( not ( = ?auto_260859 ?auto_260862 ) ) ( not ( = ?auto_260859 ?auto_260863 ) ) ( not ( = ?auto_260859 ?auto_260864 ) ) ( not ( = ?auto_260859 ?auto_260865 ) ) ( not ( = ?auto_260859 ?auto_260866 ) ) ( not ( = ?auto_260859 ?auto_260867 ) ) ( not ( = ?auto_260859 ?auto_260868 ) ) ( not ( = ?auto_260859 ?auto_260869 ) ) ( not ( = ?auto_260859 ?auto_260870 ) ) ( not ( = ?auto_260859 ?auto_260871 ) ) ( not ( = ?auto_260859 ?auto_260872 ) ) ( not ( = ?auto_260860 ?auto_260861 ) ) ( not ( = ?auto_260860 ?auto_260862 ) ) ( not ( = ?auto_260860 ?auto_260863 ) ) ( not ( = ?auto_260860 ?auto_260864 ) ) ( not ( = ?auto_260860 ?auto_260865 ) ) ( not ( = ?auto_260860 ?auto_260866 ) ) ( not ( = ?auto_260860 ?auto_260867 ) ) ( not ( = ?auto_260860 ?auto_260868 ) ) ( not ( = ?auto_260860 ?auto_260869 ) ) ( not ( = ?auto_260860 ?auto_260870 ) ) ( not ( = ?auto_260860 ?auto_260871 ) ) ( not ( = ?auto_260860 ?auto_260872 ) ) ( not ( = ?auto_260861 ?auto_260862 ) ) ( not ( = ?auto_260861 ?auto_260863 ) ) ( not ( = ?auto_260861 ?auto_260864 ) ) ( not ( = ?auto_260861 ?auto_260865 ) ) ( not ( = ?auto_260861 ?auto_260866 ) ) ( not ( = ?auto_260861 ?auto_260867 ) ) ( not ( = ?auto_260861 ?auto_260868 ) ) ( not ( = ?auto_260861 ?auto_260869 ) ) ( not ( = ?auto_260861 ?auto_260870 ) ) ( not ( = ?auto_260861 ?auto_260871 ) ) ( not ( = ?auto_260861 ?auto_260872 ) ) ( not ( = ?auto_260862 ?auto_260863 ) ) ( not ( = ?auto_260862 ?auto_260864 ) ) ( not ( = ?auto_260862 ?auto_260865 ) ) ( not ( = ?auto_260862 ?auto_260866 ) ) ( not ( = ?auto_260862 ?auto_260867 ) ) ( not ( = ?auto_260862 ?auto_260868 ) ) ( not ( = ?auto_260862 ?auto_260869 ) ) ( not ( = ?auto_260862 ?auto_260870 ) ) ( not ( = ?auto_260862 ?auto_260871 ) ) ( not ( = ?auto_260862 ?auto_260872 ) ) ( not ( = ?auto_260863 ?auto_260864 ) ) ( not ( = ?auto_260863 ?auto_260865 ) ) ( not ( = ?auto_260863 ?auto_260866 ) ) ( not ( = ?auto_260863 ?auto_260867 ) ) ( not ( = ?auto_260863 ?auto_260868 ) ) ( not ( = ?auto_260863 ?auto_260869 ) ) ( not ( = ?auto_260863 ?auto_260870 ) ) ( not ( = ?auto_260863 ?auto_260871 ) ) ( not ( = ?auto_260863 ?auto_260872 ) ) ( not ( = ?auto_260864 ?auto_260865 ) ) ( not ( = ?auto_260864 ?auto_260866 ) ) ( not ( = ?auto_260864 ?auto_260867 ) ) ( not ( = ?auto_260864 ?auto_260868 ) ) ( not ( = ?auto_260864 ?auto_260869 ) ) ( not ( = ?auto_260864 ?auto_260870 ) ) ( not ( = ?auto_260864 ?auto_260871 ) ) ( not ( = ?auto_260864 ?auto_260872 ) ) ( not ( = ?auto_260865 ?auto_260866 ) ) ( not ( = ?auto_260865 ?auto_260867 ) ) ( not ( = ?auto_260865 ?auto_260868 ) ) ( not ( = ?auto_260865 ?auto_260869 ) ) ( not ( = ?auto_260865 ?auto_260870 ) ) ( not ( = ?auto_260865 ?auto_260871 ) ) ( not ( = ?auto_260865 ?auto_260872 ) ) ( not ( = ?auto_260866 ?auto_260867 ) ) ( not ( = ?auto_260866 ?auto_260868 ) ) ( not ( = ?auto_260866 ?auto_260869 ) ) ( not ( = ?auto_260866 ?auto_260870 ) ) ( not ( = ?auto_260866 ?auto_260871 ) ) ( not ( = ?auto_260866 ?auto_260872 ) ) ( not ( = ?auto_260867 ?auto_260868 ) ) ( not ( = ?auto_260867 ?auto_260869 ) ) ( not ( = ?auto_260867 ?auto_260870 ) ) ( not ( = ?auto_260867 ?auto_260871 ) ) ( not ( = ?auto_260867 ?auto_260872 ) ) ( not ( = ?auto_260868 ?auto_260869 ) ) ( not ( = ?auto_260868 ?auto_260870 ) ) ( not ( = ?auto_260868 ?auto_260871 ) ) ( not ( = ?auto_260868 ?auto_260872 ) ) ( not ( = ?auto_260869 ?auto_260870 ) ) ( not ( = ?auto_260869 ?auto_260871 ) ) ( not ( = ?auto_260869 ?auto_260872 ) ) ( not ( = ?auto_260870 ?auto_260871 ) ) ( not ( = ?auto_260870 ?auto_260872 ) ) ( not ( = ?auto_260871 ?auto_260872 ) ) ( ON ?auto_260870 ?auto_260871 ) ( ON ?auto_260869 ?auto_260870 ) ( ON ?auto_260868 ?auto_260869 ) ( ON ?auto_260867 ?auto_260868 ) ( ON ?auto_260866 ?auto_260867 ) ( ON ?auto_260865 ?auto_260866 ) ( ON ?auto_260864 ?auto_260865 ) ( ON ?auto_260863 ?auto_260864 ) ( ON ?auto_260862 ?auto_260863 ) ( CLEAR ?auto_260860 ) ( ON ?auto_260861 ?auto_260862 ) ( CLEAR ?auto_260861 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_260859 ?auto_260860 ?auto_260861 )
      ( MAKE-13PILE ?auto_260859 ?auto_260860 ?auto_260861 ?auto_260862 ?auto_260863 ?auto_260864 ?auto_260865 ?auto_260866 ?auto_260867 ?auto_260868 ?auto_260869 ?auto_260870 ?auto_260871 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_260886 - BLOCK
      ?auto_260887 - BLOCK
      ?auto_260888 - BLOCK
      ?auto_260889 - BLOCK
      ?auto_260890 - BLOCK
      ?auto_260891 - BLOCK
      ?auto_260892 - BLOCK
      ?auto_260893 - BLOCK
      ?auto_260894 - BLOCK
      ?auto_260895 - BLOCK
      ?auto_260896 - BLOCK
      ?auto_260897 - BLOCK
      ?auto_260898 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_260898 ) ( ON-TABLE ?auto_260886 ) ( ON ?auto_260887 ?auto_260886 ) ( not ( = ?auto_260886 ?auto_260887 ) ) ( not ( = ?auto_260886 ?auto_260888 ) ) ( not ( = ?auto_260886 ?auto_260889 ) ) ( not ( = ?auto_260886 ?auto_260890 ) ) ( not ( = ?auto_260886 ?auto_260891 ) ) ( not ( = ?auto_260886 ?auto_260892 ) ) ( not ( = ?auto_260886 ?auto_260893 ) ) ( not ( = ?auto_260886 ?auto_260894 ) ) ( not ( = ?auto_260886 ?auto_260895 ) ) ( not ( = ?auto_260886 ?auto_260896 ) ) ( not ( = ?auto_260886 ?auto_260897 ) ) ( not ( = ?auto_260886 ?auto_260898 ) ) ( not ( = ?auto_260887 ?auto_260888 ) ) ( not ( = ?auto_260887 ?auto_260889 ) ) ( not ( = ?auto_260887 ?auto_260890 ) ) ( not ( = ?auto_260887 ?auto_260891 ) ) ( not ( = ?auto_260887 ?auto_260892 ) ) ( not ( = ?auto_260887 ?auto_260893 ) ) ( not ( = ?auto_260887 ?auto_260894 ) ) ( not ( = ?auto_260887 ?auto_260895 ) ) ( not ( = ?auto_260887 ?auto_260896 ) ) ( not ( = ?auto_260887 ?auto_260897 ) ) ( not ( = ?auto_260887 ?auto_260898 ) ) ( not ( = ?auto_260888 ?auto_260889 ) ) ( not ( = ?auto_260888 ?auto_260890 ) ) ( not ( = ?auto_260888 ?auto_260891 ) ) ( not ( = ?auto_260888 ?auto_260892 ) ) ( not ( = ?auto_260888 ?auto_260893 ) ) ( not ( = ?auto_260888 ?auto_260894 ) ) ( not ( = ?auto_260888 ?auto_260895 ) ) ( not ( = ?auto_260888 ?auto_260896 ) ) ( not ( = ?auto_260888 ?auto_260897 ) ) ( not ( = ?auto_260888 ?auto_260898 ) ) ( not ( = ?auto_260889 ?auto_260890 ) ) ( not ( = ?auto_260889 ?auto_260891 ) ) ( not ( = ?auto_260889 ?auto_260892 ) ) ( not ( = ?auto_260889 ?auto_260893 ) ) ( not ( = ?auto_260889 ?auto_260894 ) ) ( not ( = ?auto_260889 ?auto_260895 ) ) ( not ( = ?auto_260889 ?auto_260896 ) ) ( not ( = ?auto_260889 ?auto_260897 ) ) ( not ( = ?auto_260889 ?auto_260898 ) ) ( not ( = ?auto_260890 ?auto_260891 ) ) ( not ( = ?auto_260890 ?auto_260892 ) ) ( not ( = ?auto_260890 ?auto_260893 ) ) ( not ( = ?auto_260890 ?auto_260894 ) ) ( not ( = ?auto_260890 ?auto_260895 ) ) ( not ( = ?auto_260890 ?auto_260896 ) ) ( not ( = ?auto_260890 ?auto_260897 ) ) ( not ( = ?auto_260890 ?auto_260898 ) ) ( not ( = ?auto_260891 ?auto_260892 ) ) ( not ( = ?auto_260891 ?auto_260893 ) ) ( not ( = ?auto_260891 ?auto_260894 ) ) ( not ( = ?auto_260891 ?auto_260895 ) ) ( not ( = ?auto_260891 ?auto_260896 ) ) ( not ( = ?auto_260891 ?auto_260897 ) ) ( not ( = ?auto_260891 ?auto_260898 ) ) ( not ( = ?auto_260892 ?auto_260893 ) ) ( not ( = ?auto_260892 ?auto_260894 ) ) ( not ( = ?auto_260892 ?auto_260895 ) ) ( not ( = ?auto_260892 ?auto_260896 ) ) ( not ( = ?auto_260892 ?auto_260897 ) ) ( not ( = ?auto_260892 ?auto_260898 ) ) ( not ( = ?auto_260893 ?auto_260894 ) ) ( not ( = ?auto_260893 ?auto_260895 ) ) ( not ( = ?auto_260893 ?auto_260896 ) ) ( not ( = ?auto_260893 ?auto_260897 ) ) ( not ( = ?auto_260893 ?auto_260898 ) ) ( not ( = ?auto_260894 ?auto_260895 ) ) ( not ( = ?auto_260894 ?auto_260896 ) ) ( not ( = ?auto_260894 ?auto_260897 ) ) ( not ( = ?auto_260894 ?auto_260898 ) ) ( not ( = ?auto_260895 ?auto_260896 ) ) ( not ( = ?auto_260895 ?auto_260897 ) ) ( not ( = ?auto_260895 ?auto_260898 ) ) ( not ( = ?auto_260896 ?auto_260897 ) ) ( not ( = ?auto_260896 ?auto_260898 ) ) ( not ( = ?auto_260897 ?auto_260898 ) ) ( ON ?auto_260897 ?auto_260898 ) ( ON ?auto_260896 ?auto_260897 ) ( ON ?auto_260895 ?auto_260896 ) ( ON ?auto_260894 ?auto_260895 ) ( ON ?auto_260893 ?auto_260894 ) ( ON ?auto_260892 ?auto_260893 ) ( ON ?auto_260891 ?auto_260892 ) ( ON ?auto_260890 ?auto_260891 ) ( ON ?auto_260889 ?auto_260890 ) ( CLEAR ?auto_260887 ) ( ON ?auto_260888 ?auto_260889 ) ( CLEAR ?auto_260888 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_260886 ?auto_260887 ?auto_260888 )
      ( MAKE-13PILE ?auto_260886 ?auto_260887 ?auto_260888 ?auto_260889 ?auto_260890 ?auto_260891 ?auto_260892 ?auto_260893 ?auto_260894 ?auto_260895 ?auto_260896 ?auto_260897 ?auto_260898 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_260912 - BLOCK
      ?auto_260913 - BLOCK
      ?auto_260914 - BLOCK
      ?auto_260915 - BLOCK
      ?auto_260916 - BLOCK
      ?auto_260917 - BLOCK
      ?auto_260918 - BLOCK
      ?auto_260919 - BLOCK
      ?auto_260920 - BLOCK
      ?auto_260921 - BLOCK
      ?auto_260922 - BLOCK
      ?auto_260923 - BLOCK
      ?auto_260924 - BLOCK
    )
    :vars
    (
      ?auto_260925 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_260924 ?auto_260925 ) ( ON-TABLE ?auto_260912 ) ( not ( = ?auto_260912 ?auto_260913 ) ) ( not ( = ?auto_260912 ?auto_260914 ) ) ( not ( = ?auto_260912 ?auto_260915 ) ) ( not ( = ?auto_260912 ?auto_260916 ) ) ( not ( = ?auto_260912 ?auto_260917 ) ) ( not ( = ?auto_260912 ?auto_260918 ) ) ( not ( = ?auto_260912 ?auto_260919 ) ) ( not ( = ?auto_260912 ?auto_260920 ) ) ( not ( = ?auto_260912 ?auto_260921 ) ) ( not ( = ?auto_260912 ?auto_260922 ) ) ( not ( = ?auto_260912 ?auto_260923 ) ) ( not ( = ?auto_260912 ?auto_260924 ) ) ( not ( = ?auto_260912 ?auto_260925 ) ) ( not ( = ?auto_260913 ?auto_260914 ) ) ( not ( = ?auto_260913 ?auto_260915 ) ) ( not ( = ?auto_260913 ?auto_260916 ) ) ( not ( = ?auto_260913 ?auto_260917 ) ) ( not ( = ?auto_260913 ?auto_260918 ) ) ( not ( = ?auto_260913 ?auto_260919 ) ) ( not ( = ?auto_260913 ?auto_260920 ) ) ( not ( = ?auto_260913 ?auto_260921 ) ) ( not ( = ?auto_260913 ?auto_260922 ) ) ( not ( = ?auto_260913 ?auto_260923 ) ) ( not ( = ?auto_260913 ?auto_260924 ) ) ( not ( = ?auto_260913 ?auto_260925 ) ) ( not ( = ?auto_260914 ?auto_260915 ) ) ( not ( = ?auto_260914 ?auto_260916 ) ) ( not ( = ?auto_260914 ?auto_260917 ) ) ( not ( = ?auto_260914 ?auto_260918 ) ) ( not ( = ?auto_260914 ?auto_260919 ) ) ( not ( = ?auto_260914 ?auto_260920 ) ) ( not ( = ?auto_260914 ?auto_260921 ) ) ( not ( = ?auto_260914 ?auto_260922 ) ) ( not ( = ?auto_260914 ?auto_260923 ) ) ( not ( = ?auto_260914 ?auto_260924 ) ) ( not ( = ?auto_260914 ?auto_260925 ) ) ( not ( = ?auto_260915 ?auto_260916 ) ) ( not ( = ?auto_260915 ?auto_260917 ) ) ( not ( = ?auto_260915 ?auto_260918 ) ) ( not ( = ?auto_260915 ?auto_260919 ) ) ( not ( = ?auto_260915 ?auto_260920 ) ) ( not ( = ?auto_260915 ?auto_260921 ) ) ( not ( = ?auto_260915 ?auto_260922 ) ) ( not ( = ?auto_260915 ?auto_260923 ) ) ( not ( = ?auto_260915 ?auto_260924 ) ) ( not ( = ?auto_260915 ?auto_260925 ) ) ( not ( = ?auto_260916 ?auto_260917 ) ) ( not ( = ?auto_260916 ?auto_260918 ) ) ( not ( = ?auto_260916 ?auto_260919 ) ) ( not ( = ?auto_260916 ?auto_260920 ) ) ( not ( = ?auto_260916 ?auto_260921 ) ) ( not ( = ?auto_260916 ?auto_260922 ) ) ( not ( = ?auto_260916 ?auto_260923 ) ) ( not ( = ?auto_260916 ?auto_260924 ) ) ( not ( = ?auto_260916 ?auto_260925 ) ) ( not ( = ?auto_260917 ?auto_260918 ) ) ( not ( = ?auto_260917 ?auto_260919 ) ) ( not ( = ?auto_260917 ?auto_260920 ) ) ( not ( = ?auto_260917 ?auto_260921 ) ) ( not ( = ?auto_260917 ?auto_260922 ) ) ( not ( = ?auto_260917 ?auto_260923 ) ) ( not ( = ?auto_260917 ?auto_260924 ) ) ( not ( = ?auto_260917 ?auto_260925 ) ) ( not ( = ?auto_260918 ?auto_260919 ) ) ( not ( = ?auto_260918 ?auto_260920 ) ) ( not ( = ?auto_260918 ?auto_260921 ) ) ( not ( = ?auto_260918 ?auto_260922 ) ) ( not ( = ?auto_260918 ?auto_260923 ) ) ( not ( = ?auto_260918 ?auto_260924 ) ) ( not ( = ?auto_260918 ?auto_260925 ) ) ( not ( = ?auto_260919 ?auto_260920 ) ) ( not ( = ?auto_260919 ?auto_260921 ) ) ( not ( = ?auto_260919 ?auto_260922 ) ) ( not ( = ?auto_260919 ?auto_260923 ) ) ( not ( = ?auto_260919 ?auto_260924 ) ) ( not ( = ?auto_260919 ?auto_260925 ) ) ( not ( = ?auto_260920 ?auto_260921 ) ) ( not ( = ?auto_260920 ?auto_260922 ) ) ( not ( = ?auto_260920 ?auto_260923 ) ) ( not ( = ?auto_260920 ?auto_260924 ) ) ( not ( = ?auto_260920 ?auto_260925 ) ) ( not ( = ?auto_260921 ?auto_260922 ) ) ( not ( = ?auto_260921 ?auto_260923 ) ) ( not ( = ?auto_260921 ?auto_260924 ) ) ( not ( = ?auto_260921 ?auto_260925 ) ) ( not ( = ?auto_260922 ?auto_260923 ) ) ( not ( = ?auto_260922 ?auto_260924 ) ) ( not ( = ?auto_260922 ?auto_260925 ) ) ( not ( = ?auto_260923 ?auto_260924 ) ) ( not ( = ?auto_260923 ?auto_260925 ) ) ( not ( = ?auto_260924 ?auto_260925 ) ) ( ON ?auto_260923 ?auto_260924 ) ( ON ?auto_260922 ?auto_260923 ) ( ON ?auto_260921 ?auto_260922 ) ( ON ?auto_260920 ?auto_260921 ) ( ON ?auto_260919 ?auto_260920 ) ( ON ?auto_260918 ?auto_260919 ) ( ON ?auto_260917 ?auto_260918 ) ( ON ?auto_260916 ?auto_260917 ) ( ON ?auto_260915 ?auto_260916 ) ( ON ?auto_260914 ?auto_260915 ) ( CLEAR ?auto_260912 ) ( ON ?auto_260913 ?auto_260914 ) ( CLEAR ?auto_260913 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_260912 ?auto_260913 )
      ( MAKE-13PILE ?auto_260912 ?auto_260913 ?auto_260914 ?auto_260915 ?auto_260916 ?auto_260917 ?auto_260918 ?auto_260919 ?auto_260920 ?auto_260921 ?auto_260922 ?auto_260923 ?auto_260924 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_260939 - BLOCK
      ?auto_260940 - BLOCK
      ?auto_260941 - BLOCK
      ?auto_260942 - BLOCK
      ?auto_260943 - BLOCK
      ?auto_260944 - BLOCK
      ?auto_260945 - BLOCK
      ?auto_260946 - BLOCK
      ?auto_260947 - BLOCK
      ?auto_260948 - BLOCK
      ?auto_260949 - BLOCK
      ?auto_260950 - BLOCK
      ?auto_260951 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_260951 ) ( ON-TABLE ?auto_260939 ) ( not ( = ?auto_260939 ?auto_260940 ) ) ( not ( = ?auto_260939 ?auto_260941 ) ) ( not ( = ?auto_260939 ?auto_260942 ) ) ( not ( = ?auto_260939 ?auto_260943 ) ) ( not ( = ?auto_260939 ?auto_260944 ) ) ( not ( = ?auto_260939 ?auto_260945 ) ) ( not ( = ?auto_260939 ?auto_260946 ) ) ( not ( = ?auto_260939 ?auto_260947 ) ) ( not ( = ?auto_260939 ?auto_260948 ) ) ( not ( = ?auto_260939 ?auto_260949 ) ) ( not ( = ?auto_260939 ?auto_260950 ) ) ( not ( = ?auto_260939 ?auto_260951 ) ) ( not ( = ?auto_260940 ?auto_260941 ) ) ( not ( = ?auto_260940 ?auto_260942 ) ) ( not ( = ?auto_260940 ?auto_260943 ) ) ( not ( = ?auto_260940 ?auto_260944 ) ) ( not ( = ?auto_260940 ?auto_260945 ) ) ( not ( = ?auto_260940 ?auto_260946 ) ) ( not ( = ?auto_260940 ?auto_260947 ) ) ( not ( = ?auto_260940 ?auto_260948 ) ) ( not ( = ?auto_260940 ?auto_260949 ) ) ( not ( = ?auto_260940 ?auto_260950 ) ) ( not ( = ?auto_260940 ?auto_260951 ) ) ( not ( = ?auto_260941 ?auto_260942 ) ) ( not ( = ?auto_260941 ?auto_260943 ) ) ( not ( = ?auto_260941 ?auto_260944 ) ) ( not ( = ?auto_260941 ?auto_260945 ) ) ( not ( = ?auto_260941 ?auto_260946 ) ) ( not ( = ?auto_260941 ?auto_260947 ) ) ( not ( = ?auto_260941 ?auto_260948 ) ) ( not ( = ?auto_260941 ?auto_260949 ) ) ( not ( = ?auto_260941 ?auto_260950 ) ) ( not ( = ?auto_260941 ?auto_260951 ) ) ( not ( = ?auto_260942 ?auto_260943 ) ) ( not ( = ?auto_260942 ?auto_260944 ) ) ( not ( = ?auto_260942 ?auto_260945 ) ) ( not ( = ?auto_260942 ?auto_260946 ) ) ( not ( = ?auto_260942 ?auto_260947 ) ) ( not ( = ?auto_260942 ?auto_260948 ) ) ( not ( = ?auto_260942 ?auto_260949 ) ) ( not ( = ?auto_260942 ?auto_260950 ) ) ( not ( = ?auto_260942 ?auto_260951 ) ) ( not ( = ?auto_260943 ?auto_260944 ) ) ( not ( = ?auto_260943 ?auto_260945 ) ) ( not ( = ?auto_260943 ?auto_260946 ) ) ( not ( = ?auto_260943 ?auto_260947 ) ) ( not ( = ?auto_260943 ?auto_260948 ) ) ( not ( = ?auto_260943 ?auto_260949 ) ) ( not ( = ?auto_260943 ?auto_260950 ) ) ( not ( = ?auto_260943 ?auto_260951 ) ) ( not ( = ?auto_260944 ?auto_260945 ) ) ( not ( = ?auto_260944 ?auto_260946 ) ) ( not ( = ?auto_260944 ?auto_260947 ) ) ( not ( = ?auto_260944 ?auto_260948 ) ) ( not ( = ?auto_260944 ?auto_260949 ) ) ( not ( = ?auto_260944 ?auto_260950 ) ) ( not ( = ?auto_260944 ?auto_260951 ) ) ( not ( = ?auto_260945 ?auto_260946 ) ) ( not ( = ?auto_260945 ?auto_260947 ) ) ( not ( = ?auto_260945 ?auto_260948 ) ) ( not ( = ?auto_260945 ?auto_260949 ) ) ( not ( = ?auto_260945 ?auto_260950 ) ) ( not ( = ?auto_260945 ?auto_260951 ) ) ( not ( = ?auto_260946 ?auto_260947 ) ) ( not ( = ?auto_260946 ?auto_260948 ) ) ( not ( = ?auto_260946 ?auto_260949 ) ) ( not ( = ?auto_260946 ?auto_260950 ) ) ( not ( = ?auto_260946 ?auto_260951 ) ) ( not ( = ?auto_260947 ?auto_260948 ) ) ( not ( = ?auto_260947 ?auto_260949 ) ) ( not ( = ?auto_260947 ?auto_260950 ) ) ( not ( = ?auto_260947 ?auto_260951 ) ) ( not ( = ?auto_260948 ?auto_260949 ) ) ( not ( = ?auto_260948 ?auto_260950 ) ) ( not ( = ?auto_260948 ?auto_260951 ) ) ( not ( = ?auto_260949 ?auto_260950 ) ) ( not ( = ?auto_260949 ?auto_260951 ) ) ( not ( = ?auto_260950 ?auto_260951 ) ) ( ON ?auto_260950 ?auto_260951 ) ( ON ?auto_260949 ?auto_260950 ) ( ON ?auto_260948 ?auto_260949 ) ( ON ?auto_260947 ?auto_260948 ) ( ON ?auto_260946 ?auto_260947 ) ( ON ?auto_260945 ?auto_260946 ) ( ON ?auto_260944 ?auto_260945 ) ( ON ?auto_260943 ?auto_260944 ) ( ON ?auto_260942 ?auto_260943 ) ( ON ?auto_260941 ?auto_260942 ) ( CLEAR ?auto_260939 ) ( ON ?auto_260940 ?auto_260941 ) ( CLEAR ?auto_260940 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_260939 ?auto_260940 )
      ( MAKE-13PILE ?auto_260939 ?auto_260940 ?auto_260941 ?auto_260942 ?auto_260943 ?auto_260944 ?auto_260945 ?auto_260946 ?auto_260947 ?auto_260948 ?auto_260949 ?auto_260950 ?auto_260951 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_260965 - BLOCK
      ?auto_260966 - BLOCK
      ?auto_260967 - BLOCK
      ?auto_260968 - BLOCK
      ?auto_260969 - BLOCK
      ?auto_260970 - BLOCK
      ?auto_260971 - BLOCK
      ?auto_260972 - BLOCK
      ?auto_260973 - BLOCK
      ?auto_260974 - BLOCK
      ?auto_260975 - BLOCK
      ?auto_260976 - BLOCK
      ?auto_260977 - BLOCK
    )
    :vars
    (
      ?auto_260978 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_260977 ?auto_260978 ) ( not ( = ?auto_260965 ?auto_260966 ) ) ( not ( = ?auto_260965 ?auto_260967 ) ) ( not ( = ?auto_260965 ?auto_260968 ) ) ( not ( = ?auto_260965 ?auto_260969 ) ) ( not ( = ?auto_260965 ?auto_260970 ) ) ( not ( = ?auto_260965 ?auto_260971 ) ) ( not ( = ?auto_260965 ?auto_260972 ) ) ( not ( = ?auto_260965 ?auto_260973 ) ) ( not ( = ?auto_260965 ?auto_260974 ) ) ( not ( = ?auto_260965 ?auto_260975 ) ) ( not ( = ?auto_260965 ?auto_260976 ) ) ( not ( = ?auto_260965 ?auto_260977 ) ) ( not ( = ?auto_260965 ?auto_260978 ) ) ( not ( = ?auto_260966 ?auto_260967 ) ) ( not ( = ?auto_260966 ?auto_260968 ) ) ( not ( = ?auto_260966 ?auto_260969 ) ) ( not ( = ?auto_260966 ?auto_260970 ) ) ( not ( = ?auto_260966 ?auto_260971 ) ) ( not ( = ?auto_260966 ?auto_260972 ) ) ( not ( = ?auto_260966 ?auto_260973 ) ) ( not ( = ?auto_260966 ?auto_260974 ) ) ( not ( = ?auto_260966 ?auto_260975 ) ) ( not ( = ?auto_260966 ?auto_260976 ) ) ( not ( = ?auto_260966 ?auto_260977 ) ) ( not ( = ?auto_260966 ?auto_260978 ) ) ( not ( = ?auto_260967 ?auto_260968 ) ) ( not ( = ?auto_260967 ?auto_260969 ) ) ( not ( = ?auto_260967 ?auto_260970 ) ) ( not ( = ?auto_260967 ?auto_260971 ) ) ( not ( = ?auto_260967 ?auto_260972 ) ) ( not ( = ?auto_260967 ?auto_260973 ) ) ( not ( = ?auto_260967 ?auto_260974 ) ) ( not ( = ?auto_260967 ?auto_260975 ) ) ( not ( = ?auto_260967 ?auto_260976 ) ) ( not ( = ?auto_260967 ?auto_260977 ) ) ( not ( = ?auto_260967 ?auto_260978 ) ) ( not ( = ?auto_260968 ?auto_260969 ) ) ( not ( = ?auto_260968 ?auto_260970 ) ) ( not ( = ?auto_260968 ?auto_260971 ) ) ( not ( = ?auto_260968 ?auto_260972 ) ) ( not ( = ?auto_260968 ?auto_260973 ) ) ( not ( = ?auto_260968 ?auto_260974 ) ) ( not ( = ?auto_260968 ?auto_260975 ) ) ( not ( = ?auto_260968 ?auto_260976 ) ) ( not ( = ?auto_260968 ?auto_260977 ) ) ( not ( = ?auto_260968 ?auto_260978 ) ) ( not ( = ?auto_260969 ?auto_260970 ) ) ( not ( = ?auto_260969 ?auto_260971 ) ) ( not ( = ?auto_260969 ?auto_260972 ) ) ( not ( = ?auto_260969 ?auto_260973 ) ) ( not ( = ?auto_260969 ?auto_260974 ) ) ( not ( = ?auto_260969 ?auto_260975 ) ) ( not ( = ?auto_260969 ?auto_260976 ) ) ( not ( = ?auto_260969 ?auto_260977 ) ) ( not ( = ?auto_260969 ?auto_260978 ) ) ( not ( = ?auto_260970 ?auto_260971 ) ) ( not ( = ?auto_260970 ?auto_260972 ) ) ( not ( = ?auto_260970 ?auto_260973 ) ) ( not ( = ?auto_260970 ?auto_260974 ) ) ( not ( = ?auto_260970 ?auto_260975 ) ) ( not ( = ?auto_260970 ?auto_260976 ) ) ( not ( = ?auto_260970 ?auto_260977 ) ) ( not ( = ?auto_260970 ?auto_260978 ) ) ( not ( = ?auto_260971 ?auto_260972 ) ) ( not ( = ?auto_260971 ?auto_260973 ) ) ( not ( = ?auto_260971 ?auto_260974 ) ) ( not ( = ?auto_260971 ?auto_260975 ) ) ( not ( = ?auto_260971 ?auto_260976 ) ) ( not ( = ?auto_260971 ?auto_260977 ) ) ( not ( = ?auto_260971 ?auto_260978 ) ) ( not ( = ?auto_260972 ?auto_260973 ) ) ( not ( = ?auto_260972 ?auto_260974 ) ) ( not ( = ?auto_260972 ?auto_260975 ) ) ( not ( = ?auto_260972 ?auto_260976 ) ) ( not ( = ?auto_260972 ?auto_260977 ) ) ( not ( = ?auto_260972 ?auto_260978 ) ) ( not ( = ?auto_260973 ?auto_260974 ) ) ( not ( = ?auto_260973 ?auto_260975 ) ) ( not ( = ?auto_260973 ?auto_260976 ) ) ( not ( = ?auto_260973 ?auto_260977 ) ) ( not ( = ?auto_260973 ?auto_260978 ) ) ( not ( = ?auto_260974 ?auto_260975 ) ) ( not ( = ?auto_260974 ?auto_260976 ) ) ( not ( = ?auto_260974 ?auto_260977 ) ) ( not ( = ?auto_260974 ?auto_260978 ) ) ( not ( = ?auto_260975 ?auto_260976 ) ) ( not ( = ?auto_260975 ?auto_260977 ) ) ( not ( = ?auto_260975 ?auto_260978 ) ) ( not ( = ?auto_260976 ?auto_260977 ) ) ( not ( = ?auto_260976 ?auto_260978 ) ) ( not ( = ?auto_260977 ?auto_260978 ) ) ( ON ?auto_260976 ?auto_260977 ) ( ON ?auto_260975 ?auto_260976 ) ( ON ?auto_260974 ?auto_260975 ) ( ON ?auto_260973 ?auto_260974 ) ( ON ?auto_260972 ?auto_260973 ) ( ON ?auto_260971 ?auto_260972 ) ( ON ?auto_260970 ?auto_260971 ) ( ON ?auto_260969 ?auto_260970 ) ( ON ?auto_260968 ?auto_260969 ) ( ON ?auto_260967 ?auto_260968 ) ( ON ?auto_260966 ?auto_260967 ) ( ON ?auto_260965 ?auto_260966 ) ( CLEAR ?auto_260965 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_260965 )
      ( MAKE-13PILE ?auto_260965 ?auto_260966 ?auto_260967 ?auto_260968 ?auto_260969 ?auto_260970 ?auto_260971 ?auto_260972 ?auto_260973 ?auto_260974 ?auto_260975 ?auto_260976 ?auto_260977 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_260992 - BLOCK
      ?auto_260993 - BLOCK
      ?auto_260994 - BLOCK
      ?auto_260995 - BLOCK
      ?auto_260996 - BLOCK
      ?auto_260997 - BLOCK
      ?auto_260998 - BLOCK
      ?auto_260999 - BLOCK
      ?auto_261000 - BLOCK
      ?auto_261001 - BLOCK
      ?auto_261002 - BLOCK
      ?auto_261003 - BLOCK
      ?auto_261004 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_261004 ) ( not ( = ?auto_260992 ?auto_260993 ) ) ( not ( = ?auto_260992 ?auto_260994 ) ) ( not ( = ?auto_260992 ?auto_260995 ) ) ( not ( = ?auto_260992 ?auto_260996 ) ) ( not ( = ?auto_260992 ?auto_260997 ) ) ( not ( = ?auto_260992 ?auto_260998 ) ) ( not ( = ?auto_260992 ?auto_260999 ) ) ( not ( = ?auto_260992 ?auto_261000 ) ) ( not ( = ?auto_260992 ?auto_261001 ) ) ( not ( = ?auto_260992 ?auto_261002 ) ) ( not ( = ?auto_260992 ?auto_261003 ) ) ( not ( = ?auto_260992 ?auto_261004 ) ) ( not ( = ?auto_260993 ?auto_260994 ) ) ( not ( = ?auto_260993 ?auto_260995 ) ) ( not ( = ?auto_260993 ?auto_260996 ) ) ( not ( = ?auto_260993 ?auto_260997 ) ) ( not ( = ?auto_260993 ?auto_260998 ) ) ( not ( = ?auto_260993 ?auto_260999 ) ) ( not ( = ?auto_260993 ?auto_261000 ) ) ( not ( = ?auto_260993 ?auto_261001 ) ) ( not ( = ?auto_260993 ?auto_261002 ) ) ( not ( = ?auto_260993 ?auto_261003 ) ) ( not ( = ?auto_260993 ?auto_261004 ) ) ( not ( = ?auto_260994 ?auto_260995 ) ) ( not ( = ?auto_260994 ?auto_260996 ) ) ( not ( = ?auto_260994 ?auto_260997 ) ) ( not ( = ?auto_260994 ?auto_260998 ) ) ( not ( = ?auto_260994 ?auto_260999 ) ) ( not ( = ?auto_260994 ?auto_261000 ) ) ( not ( = ?auto_260994 ?auto_261001 ) ) ( not ( = ?auto_260994 ?auto_261002 ) ) ( not ( = ?auto_260994 ?auto_261003 ) ) ( not ( = ?auto_260994 ?auto_261004 ) ) ( not ( = ?auto_260995 ?auto_260996 ) ) ( not ( = ?auto_260995 ?auto_260997 ) ) ( not ( = ?auto_260995 ?auto_260998 ) ) ( not ( = ?auto_260995 ?auto_260999 ) ) ( not ( = ?auto_260995 ?auto_261000 ) ) ( not ( = ?auto_260995 ?auto_261001 ) ) ( not ( = ?auto_260995 ?auto_261002 ) ) ( not ( = ?auto_260995 ?auto_261003 ) ) ( not ( = ?auto_260995 ?auto_261004 ) ) ( not ( = ?auto_260996 ?auto_260997 ) ) ( not ( = ?auto_260996 ?auto_260998 ) ) ( not ( = ?auto_260996 ?auto_260999 ) ) ( not ( = ?auto_260996 ?auto_261000 ) ) ( not ( = ?auto_260996 ?auto_261001 ) ) ( not ( = ?auto_260996 ?auto_261002 ) ) ( not ( = ?auto_260996 ?auto_261003 ) ) ( not ( = ?auto_260996 ?auto_261004 ) ) ( not ( = ?auto_260997 ?auto_260998 ) ) ( not ( = ?auto_260997 ?auto_260999 ) ) ( not ( = ?auto_260997 ?auto_261000 ) ) ( not ( = ?auto_260997 ?auto_261001 ) ) ( not ( = ?auto_260997 ?auto_261002 ) ) ( not ( = ?auto_260997 ?auto_261003 ) ) ( not ( = ?auto_260997 ?auto_261004 ) ) ( not ( = ?auto_260998 ?auto_260999 ) ) ( not ( = ?auto_260998 ?auto_261000 ) ) ( not ( = ?auto_260998 ?auto_261001 ) ) ( not ( = ?auto_260998 ?auto_261002 ) ) ( not ( = ?auto_260998 ?auto_261003 ) ) ( not ( = ?auto_260998 ?auto_261004 ) ) ( not ( = ?auto_260999 ?auto_261000 ) ) ( not ( = ?auto_260999 ?auto_261001 ) ) ( not ( = ?auto_260999 ?auto_261002 ) ) ( not ( = ?auto_260999 ?auto_261003 ) ) ( not ( = ?auto_260999 ?auto_261004 ) ) ( not ( = ?auto_261000 ?auto_261001 ) ) ( not ( = ?auto_261000 ?auto_261002 ) ) ( not ( = ?auto_261000 ?auto_261003 ) ) ( not ( = ?auto_261000 ?auto_261004 ) ) ( not ( = ?auto_261001 ?auto_261002 ) ) ( not ( = ?auto_261001 ?auto_261003 ) ) ( not ( = ?auto_261001 ?auto_261004 ) ) ( not ( = ?auto_261002 ?auto_261003 ) ) ( not ( = ?auto_261002 ?auto_261004 ) ) ( not ( = ?auto_261003 ?auto_261004 ) ) ( ON ?auto_261003 ?auto_261004 ) ( ON ?auto_261002 ?auto_261003 ) ( ON ?auto_261001 ?auto_261002 ) ( ON ?auto_261000 ?auto_261001 ) ( ON ?auto_260999 ?auto_261000 ) ( ON ?auto_260998 ?auto_260999 ) ( ON ?auto_260997 ?auto_260998 ) ( ON ?auto_260996 ?auto_260997 ) ( ON ?auto_260995 ?auto_260996 ) ( ON ?auto_260994 ?auto_260995 ) ( ON ?auto_260993 ?auto_260994 ) ( ON ?auto_260992 ?auto_260993 ) ( CLEAR ?auto_260992 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_260992 )
      ( MAKE-13PILE ?auto_260992 ?auto_260993 ?auto_260994 ?auto_260995 ?auto_260996 ?auto_260997 ?auto_260998 ?auto_260999 ?auto_261000 ?auto_261001 ?auto_261002 ?auto_261003 ?auto_261004 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_261018 - BLOCK
      ?auto_261019 - BLOCK
      ?auto_261020 - BLOCK
      ?auto_261021 - BLOCK
      ?auto_261022 - BLOCK
      ?auto_261023 - BLOCK
      ?auto_261024 - BLOCK
      ?auto_261025 - BLOCK
      ?auto_261026 - BLOCK
      ?auto_261027 - BLOCK
      ?auto_261028 - BLOCK
      ?auto_261029 - BLOCK
      ?auto_261030 - BLOCK
    )
    :vars
    (
      ?auto_261031 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_261018 ?auto_261019 ) ) ( not ( = ?auto_261018 ?auto_261020 ) ) ( not ( = ?auto_261018 ?auto_261021 ) ) ( not ( = ?auto_261018 ?auto_261022 ) ) ( not ( = ?auto_261018 ?auto_261023 ) ) ( not ( = ?auto_261018 ?auto_261024 ) ) ( not ( = ?auto_261018 ?auto_261025 ) ) ( not ( = ?auto_261018 ?auto_261026 ) ) ( not ( = ?auto_261018 ?auto_261027 ) ) ( not ( = ?auto_261018 ?auto_261028 ) ) ( not ( = ?auto_261018 ?auto_261029 ) ) ( not ( = ?auto_261018 ?auto_261030 ) ) ( not ( = ?auto_261019 ?auto_261020 ) ) ( not ( = ?auto_261019 ?auto_261021 ) ) ( not ( = ?auto_261019 ?auto_261022 ) ) ( not ( = ?auto_261019 ?auto_261023 ) ) ( not ( = ?auto_261019 ?auto_261024 ) ) ( not ( = ?auto_261019 ?auto_261025 ) ) ( not ( = ?auto_261019 ?auto_261026 ) ) ( not ( = ?auto_261019 ?auto_261027 ) ) ( not ( = ?auto_261019 ?auto_261028 ) ) ( not ( = ?auto_261019 ?auto_261029 ) ) ( not ( = ?auto_261019 ?auto_261030 ) ) ( not ( = ?auto_261020 ?auto_261021 ) ) ( not ( = ?auto_261020 ?auto_261022 ) ) ( not ( = ?auto_261020 ?auto_261023 ) ) ( not ( = ?auto_261020 ?auto_261024 ) ) ( not ( = ?auto_261020 ?auto_261025 ) ) ( not ( = ?auto_261020 ?auto_261026 ) ) ( not ( = ?auto_261020 ?auto_261027 ) ) ( not ( = ?auto_261020 ?auto_261028 ) ) ( not ( = ?auto_261020 ?auto_261029 ) ) ( not ( = ?auto_261020 ?auto_261030 ) ) ( not ( = ?auto_261021 ?auto_261022 ) ) ( not ( = ?auto_261021 ?auto_261023 ) ) ( not ( = ?auto_261021 ?auto_261024 ) ) ( not ( = ?auto_261021 ?auto_261025 ) ) ( not ( = ?auto_261021 ?auto_261026 ) ) ( not ( = ?auto_261021 ?auto_261027 ) ) ( not ( = ?auto_261021 ?auto_261028 ) ) ( not ( = ?auto_261021 ?auto_261029 ) ) ( not ( = ?auto_261021 ?auto_261030 ) ) ( not ( = ?auto_261022 ?auto_261023 ) ) ( not ( = ?auto_261022 ?auto_261024 ) ) ( not ( = ?auto_261022 ?auto_261025 ) ) ( not ( = ?auto_261022 ?auto_261026 ) ) ( not ( = ?auto_261022 ?auto_261027 ) ) ( not ( = ?auto_261022 ?auto_261028 ) ) ( not ( = ?auto_261022 ?auto_261029 ) ) ( not ( = ?auto_261022 ?auto_261030 ) ) ( not ( = ?auto_261023 ?auto_261024 ) ) ( not ( = ?auto_261023 ?auto_261025 ) ) ( not ( = ?auto_261023 ?auto_261026 ) ) ( not ( = ?auto_261023 ?auto_261027 ) ) ( not ( = ?auto_261023 ?auto_261028 ) ) ( not ( = ?auto_261023 ?auto_261029 ) ) ( not ( = ?auto_261023 ?auto_261030 ) ) ( not ( = ?auto_261024 ?auto_261025 ) ) ( not ( = ?auto_261024 ?auto_261026 ) ) ( not ( = ?auto_261024 ?auto_261027 ) ) ( not ( = ?auto_261024 ?auto_261028 ) ) ( not ( = ?auto_261024 ?auto_261029 ) ) ( not ( = ?auto_261024 ?auto_261030 ) ) ( not ( = ?auto_261025 ?auto_261026 ) ) ( not ( = ?auto_261025 ?auto_261027 ) ) ( not ( = ?auto_261025 ?auto_261028 ) ) ( not ( = ?auto_261025 ?auto_261029 ) ) ( not ( = ?auto_261025 ?auto_261030 ) ) ( not ( = ?auto_261026 ?auto_261027 ) ) ( not ( = ?auto_261026 ?auto_261028 ) ) ( not ( = ?auto_261026 ?auto_261029 ) ) ( not ( = ?auto_261026 ?auto_261030 ) ) ( not ( = ?auto_261027 ?auto_261028 ) ) ( not ( = ?auto_261027 ?auto_261029 ) ) ( not ( = ?auto_261027 ?auto_261030 ) ) ( not ( = ?auto_261028 ?auto_261029 ) ) ( not ( = ?auto_261028 ?auto_261030 ) ) ( not ( = ?auto_261029 ?auto_261030 ) ) ( ON ?auto_261018 ?auto_261031 ) ( not ( = ?auto_261030 ?auto_261031 ) ) ( not ( = ?auto_261029 ?auto_261031 ) ) ( not ( = ?auto_261028 ?auto_261031 ) ) ( not ( = ?auto_261027 ?auto_261031 ) ) ( not ( = ?auto_261026 ?auto_261031 ) ) ( not ( = ?auto_261025 ?auto_261031 ) ) ( not ( = ?auto_261024 ?auto_261031 ) ) ( not ( = ?auto_261023 ?auto_261031 ) ) ( not ( = ?auto_261022 ?auto_261031 ) ) ( not ( = ?auto_261021 ?auto_261031 ) ) ( not ( = ?auto_261020 ?auto_261031 ) ) ( not ( = ?auto_261019 ?auto_261031 ) ) ( not ( = ?auto_261018 ?auto_261031 ) ) ( ON ?auto_261019 ?auto_261018 ) ( ON ?auto_261020 ?auto_261019 ) ( ON ?auto_261021 ?auto_261020 ) ( ON ?auto_261022 ?auto_261021 ) ( ON ?auto_261023 ?auto_261022 ) ( ON ?auto_261024 ?auto_261023 ) ( ON ?auto_261025 ?auto_261024 ) ( ON ?auto_261026 ?auto_261025 ) ( ON ?auto_261027 ?auto_261026 ) ( ON ?auto_261028 ?auto_261027 ) ( ON ?auto_261029 ?auto_261028 ) ( ON ?auto_261030 ?auto_261029 ) ( CLEAR ?auto_261030 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_261030 ?auto_261029 ?auto_261028 ?auto_261027 ?auto_261026 ?auto_261025 ?auto_261024 ?auto_261023 ?auto_261022 ?auto_261021 ?auto_261020 ?auto_261019 ?auto_261018 )
      ( MAKE-13PILE ?auto_261018 ?auto_261019 ?auto_261020 ?auto_261021 ?auto_261022 ?auto_261023 ?auto_261024 ?auto_261025 ?auto_261026 ?auto_261027 ?auto_261028 ?auto_261029 ?auto_261030 ) )
  )

)

