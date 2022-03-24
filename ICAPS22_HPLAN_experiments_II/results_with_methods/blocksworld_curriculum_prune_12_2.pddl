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

