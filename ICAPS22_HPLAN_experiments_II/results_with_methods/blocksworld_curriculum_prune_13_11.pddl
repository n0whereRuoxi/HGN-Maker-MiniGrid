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

