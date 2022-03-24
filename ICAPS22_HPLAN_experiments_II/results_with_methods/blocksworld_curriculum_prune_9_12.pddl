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
      ?auto_63601 - BLOCK
    )
    :vars
    (
      ?auto_63602 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63601 ?auto_63602 ) ( CLEAR ?auto_63601 ) ( HAND-EMPTY ) ( not ( = ?auto_63601 ?auto_63602 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_63601 ?auto_63602 )
      ( !PUTDOWN ?auto_63601 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_63608 - BLOCK
      ?auto_63609 - BLOCK
    )
    :vars
    (
      ?auto_63610 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_63608 ) ( ON ?auto_63609 ?auto_63610 ) ( CLEAR ?auto_63609 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_63608 ) ( not ( = ?auto_63608 ?auto_63609 ) ) ( not ( = ?auto_63608 ?auto_63610 ) ) ( not ( = ?auto_63609 ?auto_63610 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_63609 ?auto_63610 )
      ( !STACK ?auto_63609 ?auto_63608 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_63618 - BLOCK
      ?auto_63619 - BLOCK
    )
    :vars
    (
      ?auto_63620 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63619 ?auto_63620 ) ( not ( = ?auto_63618 ?auto_63619 ) ) ( not ( = ?auto_63618 ?auto_63620 ) ) ( not ( = ?auto_63619 ?auto_63620 ) ) ( ON ?auto_63618 ?auto_63619 ) ( CLEAR ?auto_63618 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_63618 )
      ( MAKE-2PILE ?auto_63618 ?auto_63619 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_63629 - BLOCK
      ?auto_63630 - BLOCK
      ?auto_63631 - BLOCK
    )
    :vars
    (
      ?auto_63632 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_63630 ) ( ON ?auto_63631 ?auto_63632 ) ( CLEAR ?auto_63631 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_63629 ) ( ON ?auto_63630 ?auto_63629 ) ( not ( = ?auto_63629 ?auto_63630 ) ) ( not ( = ?auto_63629 ?auto_63631 ) ) ( not ( = ?auto_63629 ?auto_63632 ) ) ( not ( = ?auto_63630 ?auto_63631 ) ) ( not ( = ?auto_63630 ?auto_63632 ) ) ( not ( = ?auto_63631 ?auto_63632 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_63631 ?auto_63632 )
      ( !STACK ?auto_63631 ?auto_63630 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_63643 - BLOCK
      ?auto_63644 - BLOCK
      ?auto_63645 - BLOCK
    )
    :vars
    (
      ?auto_63646 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63645 ?auto_63646 ) ( ON-TABLE ?auto_63643 ) ( not ( = ?auto_63643 ?auto_63644 ) ) ( not ( = ?auto_63643 ?auto_63645 ) ) ( not ( = ?auto_63643 ?auto_63646 ) ) ( not ( = ?auto_63644 ?auto_63645 ) ) ( not ( = ?auto_63644 ?auto_63646 ) ) ( not ( = ?auto_63645 ?auto_63646 ) ) ( CLEAR ?auto_63643 ) ( ON ?auto_63644 ?auto_63645 ) ( CLEAR ?auto_63644 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_63643 ?auto_63644 )
      ( MAKE-3PILE ?auto_63643 ?auto_63644 ?auto_63645 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_63657 - BLOCK
      ?auto_63658 - BLOCK
      ?auto_63659 - BLOCK
    )
    :vars
    (
      ?auto_63660 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63659 ?auto_63660 ) ( not ( = ?auto_63657 ?auto_63658 ) ) ( not ( = ?auto_63657 ?auto_63659 ) ) ( not ( = ?auto_63657 ?auto_63660 ) ) ( not ( = ?auto_63658 ?auto_63659 ) ) ( not ( = ?auto_63658 ?auto_63660 ) ) ( not ( = ?auto_63659 ?auto_63660 ) ) ( ON ?auto_63658 ?auto_63659 ) ( ON ?auto_63657 ?auto_63658 ) ( CLEAR ?auto_63657 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_63657 )
      ( MAKE-3PILE ?auto_63657 ?auto_63658 ?auto_63659 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_63672 - BLOCK
      ?auto_63673 - BLOCK
      ?auto_63674 - BLOCK
      ?auto_63675 - BLOCK
    )
    :vars
    (
      ?auto_63676 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_63674 ) ( ON ?auto_63675 ?auto_63676 ) ( CLEAR ?auto_63675 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_63672 ) ( ON ?auto_63673 ?auto_63672 ) ( ON ?auto_63674 ?auto_63673 ) ( not ( = ?auto_63672 ?auto_63673 ) ) ( not ( = ?auto_63672 ?auto_63674 ) ) ( not ( = ?auto_63672 ?auto_63675 ) ) ( not ( = ?auto_63672 ?auto_63676 ) ) ( not ( = ?auto_63673 ?auto_63674 ) ) ( not ( = ?auto_63673 ?auto_63675 ) ) ( not ( = ?auto_63673 ?auto_63676 ) ) ( not ( = ?auto_63674 ?auto_63675 ) ) ( not ( = ?auto_63674 ?auto_63676 ) ) ( not ( = ?auto_63675 ?auto_63676 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_63675 ?auto_63676 )
      ( !STACK ?auto_63675 ?auto_63674 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_63690 - BLOCK
      ?auto_63691 - BLOCK
      ?auto_63692 - BLOCK
      ?auto_63693 - BLOCK
    )
    :vars
    (
      ?auto_63694 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63693 ?auto_63694 ) ( ON-TABLE ?auto_63690 ) ( ON ?auto_63691 ?auto_63690 ) ( not ( = ?auto_63690 ?auto_63691 ) ) ( not ( = ?auto_63690 ?auto_63692 ) ) ( not ( = ?auto_63690 ?auto_63693 ) ) ( not ( = ?auto_63690 ?auto_63694 ) ) ( not ( = ?auto_63691 ?auto_63692 ) ) ( not ( = ?auto_63691 ?auto_63693 ) ) ( not ( = ?auto_63691 ?auto_63694 ) ) ( not ( = ?auto_63692 ?auto_63693 ) ) ( not ( = ?auto_63692 ?auto_63694 ) ) ( not ( = ?auto_63693 ?auto_63694 ) ) ( CLEAR ?auto_63691 ) ( ON ?auto_63692 ?auto_63693 ) ( CLEAR ?auto_63692 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_63690 ?auto_63691 ?auto_63692 )
      ( MAKE-4PILE ?auto_63690 ?auto_63691 ?auto_63692 ?auto_63693 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_63708 - BLOCK
      ?auto_63709 - BLOCK
      ?auto_63710 - BLOCK
      ?auto_63711 - BLOCK
    )
    :vars
    (
      ?auto_63712 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63711 ?auto_63712 ) ( ON-TABLE ?auto_63708 ) ( not ( = ?auto_63708 ?auto_63709 ) ) ( not ( = ?auto_63708 ?auto_63710 ) ) ( not ( = ?auto_63708 ?auto_63711 ) ) ( not ( = ?auto_63708 ?auto_63712 ) ) ( not ( = ?auto_63709 ?auto_63710 ) ) ( not ( = ?auto_63709 ?auto_63711 ) ) ( not ( = ?auto_63709 ?auto_63712 ) ) ( not ( = ?auto_63710 ?auto_63711 ) ) ( not ( = ?auto_63710 ?auto_63712 ) ) ( not ( = ?auto_63711 ?auto_63712 ) ) ( ON ?auto_63710 ?auto_63711 ) ( CLEAR ?auto_63708 ) ( ON ?auto_63709 ?auto_63710 ) ( CLEAR ?auto_63709 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_63708 ?auto_63709 )
      ( MAKE-4PILE ?auto_63708 ?auto_63709 ?auto_63710 ?auto_63711 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_63726 - BLOCK
      ?auto_63727 - BLOCK
      ?auto_63728 - BLOCK
      ?auto_63729 - BLOCK
    )
    :vars
    (
      ?auto_63730 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63729 ?auto_63730 ) ( not ( = ?auto_63726 ?auto_63727 ) ) ( not ( = ?auto_63726 ?auto_63728 ) ) ( not ( = ?auto_63726 ?auto_63729 ) ) ( not ( = ?auto_63726 ?auto_63730 ) ) ( not ( = ?auto_63727 ?auto_63728 ) ) ( not ( = ?auto_63727 ?auto_63729 ) ) ( not ( = ?auto_63727 ?auto_63730 ) ) ( not ( = ?auto_63728 ?auto_63729 ) ) ( not ( = ?auto_63728 ?auto_63730 ) ) ( not ( = ?auto_63729 ?auto_63730 ) ) ( ON ?auto_63728 ?auto_63729 ) ( ON ?auto_63727 ?auto_63728 ) ( ON ?auto_63726 ?auto_63727 ) ( CLEAR ?auto_63726 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_63726 )
      ( MAKE-4PILE ?auto_63726 ?auto_63727 ?auto_63728 ?auto_63729 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_63745 - BLOCK
      ?auto_63746 - BLOCK
      ?auto_63747 - BLOCK
      ?auto_63748 - BLOCK
      ?auto_63749 - BLOCK
    )
    :vars
    (
      ?auto_63750 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_63748 ) ( ON ?auto_63749 ?auto_63750 ) ( CLEAR ?auto_63749 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_63745 ) ( ON ?auto_63746 ?auto_63745 ) ( ON ?auto_63747 ?auto_63746 ) ( ON ?auto_63748 ?auto_63747 ) ( not ( = ?auto_63745 ?auto_63746 ) ) ( not ( = ?auto_63745 ?auto_63747 ) ) ( not ( = ?auto_63745 ?auto_63748 ) ) ( not ( = ?auto_63745 ?auto_63749 ) ) ( not ( = ?auto_63745 ?auto_63750 ) ) ( not ( = ?auto_63746 ?auto_63747 ) ) ( not ( = ?auto_63746 ?auto_63748 ) ) ( not ( = ?auto_63746 ?auto_63749 ) ) ( not ( = ?auto_63746 ?auto_63750 ) ) ( not ( = ?auto_63747 ?auto_63748 ) ) ( not ( = ?auto_63747 ?auto_63749 ) ) ( not ( = ?auto_63747 ?auto_63750 ) ) ( not ( = ?auto_63748 ?auto_63749 ) ) ( not ( = ?auto_63748 ?auto_63750 ) ) ( not ( = ?auto_63749 ?auto_63750 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_63749 ?auto_63750 )
      ( !STACK ?auto_63749 ?auto_63748 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_63767 - BLOCK
      ?auto_63768 - BLOCK
      ?auto_63769 - BLOCK
      ?auto_63770 - BLOCK
      ?auto_63771 - BLOCK
    )
    :vars
    (
      ?auto_63772 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63771 ?auto_63772 ) ( ON-TABLE ?auto_63767 ) ( ON ?auto_63768 ?auto_63767 ) ( ON ?auto_63769 ?auto_63768 ) ( not ( = ?auto_63767 ?auto_63768 ) ) ( not ( = ?auto_63767 ?auto_63769 ) ) ( not ( = ?auto_63767 ?auto_63770 ) ) ( not ( = ?auto_63767 ?auto_63771 ) ) ( not ( = ?auto_63767 ?auto_63772 ) ) ( not ( = ?auto_63768 ?auto_63769 ) ) ( not ( = ?auto_63768 ?auto_63770 ) ) ( not ( = ?auto_63768 ?auto_63771 ) ) ( not ( = ?auto_63768 ?auto_63772 ) ) ( not ( = ?auto_63769 ?auto_63770 ) ) ( not ( = ?auto_63769 ?auto_63771 ) ) ( not ( = ?auto_63769 ?auto_63772 ) ) ( not ( = ?auto_63770 ?auto_63771 ) ) ( not ( = ?auto_63770 ?auto_63772 ) ) ( not ( = ?auto_63771 ?auto_63772 ) ) ( CLEAR ?auto_63769 ) ( ON ?auto_63770 ?auto_63771 ) ( CLEAR ?auto_63770 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_63767 ?auto_63768 ?auto_63769 ?auto_63770 )
      ( MAKE-5PILE ?auto_63767 ?auto_63768 ?auto_63769 ?auto_63770 ?auto_63771 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_63789 - BLOCK
      ?auto_63790 - BLOCK
      ?auto_63791 - BLOCK
      ?auto_63792 - BLOCK
      ?auto_63793 - BLOCK
    )
    :vars
    (
      ?auto_63794 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63793 ?auto_63794 ) ( ON-TABLE ?auto_63789 ) ( ON ?auto_63790 ?auto_63789 ) ( not ( = ?auto_63789 ?auto_63790 ) ) ( not ( = ?auto_63789 ?auto_63791 ) ) ( not ( = ?auto_63789 ?auto_63792 ) ) ( not ( = ?auto_63789 ?auto_63793 ) ) ( not ( = ?auto_63789 ?auto_63794 ) ) ( not ( = ?auto_63790 ?auto_63791 ) ) ( not ( = ?auto_63790 ?auto_63792 ) ) ( not ( = ?auto_63790 ?auto_63793 ) ) ( not ( = ?auto_63790 ?auto_63794 ) ) ( not ( = ?auto_63791 ?auto_63792 ) ) ( not ( = ?auto_63791 ?auto_63793 ) ) ( not ( = ?auto_63791 ?auto_63794 ) ) ( not ( = ?auto_63792 ?auto_63793 ) ) ( not ( = ?auto_63792 ?auto_63794 ) ) ( not ( = ?auto_63793 ?auto_63794 ) ) ( ON ?auto_63792 ?auto_63793 ) ( CLEAR ?auto_63790 ) ( ON ?auto_63791 ?auto_63792 ) ( CLEAR ?auto_63791 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_63789 ?auto_63790 ?auto_63791 )
      ( MAKE-5PILE ?auto_63789 ?auto_63790 ?auto_63791 ?auto_63792 ?auto_63793 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_63811 - BLOCK
      ?auto_63812 - BLOCK
      ?auto_63813 - BLOCK
      ?auto_63814 - BLOCK
      ?auto_63815 - BLOCK
    )
    :vars
    (
      ?auto_63816 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63815 ?auto_63816 ) ( ON-TABLE ?auto_63811 ) ( not ( = ?auto_63811 ?auto_63812 ) ) ( not ( = ?auto_63811 ?auto_63813 ) ) ( not ( = ?auto_63811 ?auto_63814 ) ) ( not ( = ?auto_63811 ?auto_63815 ) ) ( not ( = ?auto_63811 ?auto_63816 ) ) ( not ( = ?auto_63812 ?auto_63813 ) ) ( not ( = ?auto_63812 ?auto_63814 ) ) ( not ( = ?auto_63812 ?auto_63815 ) ) ( not ( = ?auto_63812 ?auto_63816 ) ) ( not ( = ?auto_63813 ?auto_63814 ) ) ( not ( = ?auto_63813 ?auto_63815 ) ) ( not ( = ?auto_63813 ?auto_63816 ) ) ( not ( = ?auto_63814 ?auto_63815 ) ) ( not ( = ?auto_63814 ?auto_63816 ) ) ( not ( = ?auto_63815 ?auto_63816 ) ) ( ON ?auto_63814 ?auto_63815 ) ( ON ?auto_63813 ?auto_63814 ) ( CLEAR ?auto_63811 ) ( ON ?auto_63812 ?auto_63813 ) ( CLEAR ?auto_63812 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_63811 ?auto_63812 )
      ( MAKE-5PILE ?auto_63811 ?auto_63812 ?auto_63813 ?auto_63814 ?auto_63815 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_63833 - BLOCK
      ?auto_63834 - BLOCK
      ?auto_63835 - BLOCK
      ?auto_63836 - BLOCK
      ?auto_63837 - BLOCK
    )
    :vars
    (
      ?auto_63838 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63837 ?auto_63838 ) ( not ( = ?auto_63833 ?auto_63834 ) ) ( not ( = ?auto_63833 ?auto_63835 ) ) ( not ( = ?auto_63833 ?auto_63836 ) ) ( not ( = ?auto_63833 ?auto_63837 ) ) ( not ( = ?auto_63833 ?auto_63838 ) ) ( not ( = ?auto_63834 ?auto_63835 ) ) ( not ( = ?auto_63834 ?auto_63836 ) ) ( not ( = ?auto_63834 ?auto_63837 ) ) ( not ( = ?auto_63834 ?auto_63838 ) ) ( not ( = ?auto_63835 ?auto_63836 ) ) ( not ( = ?auto_63835 ?auto_63837 ) ) ( not ( = ?auto_63835 ?auto_63838 ) ) ( not ( = ?auto_63836 ?auto_63837 ) ) ( not ( = ?auto_63836 ?auto_63838 ) ) ( not ( = ?auto_63837 ?auto_63838 ) ) ( ON ?auto_63836 ?auto_63837 ) ( ON ?auto_63835 ?auto_63836 ) ( ON ?auto_63834 ?auto_63835 ) ( ON ?auto_63833 ?auto_63834 ) ( CLEAR ?auto_63833 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_63833 )
      ( MAKE-5PILE ?auto_63833 ?auto_63834 ?auto_63835 ?auto_63836 ?auto_63837 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_63856 - BLOCK
      ?auto_63857 - BLOCK
      ?auto_63858 - BLOCK
      ?auto_63859 - BLOCK
      ?auto_63860 - BLOCK
      ?auto_63861 - BLOCK
    )
    :vars
    (
      ?auto_63862 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_63860 ) ( ON ?auto_63861 ?auto_63862 ) ( CLEAR ?auto_63861 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_63856 ) ( ON ?auto_63857 ?auto_63856 ) ( ON ?auto_63858 ?auto_63857 ) ( ON ?auto_63859 ?auto_63858 ) ( ON ?auto_63860 ?auto_63859 ) ( not ( = ?auto_63856 ?auto_63857 ) ) ( not ( = ?auto_63856 ?auto_63858 ) ) ( not ( = ?auto_63856 ?auto_63859 ) ) ( not ( = ?auto_63856 ?auto_63860 ) ) ( not ( = ?auto_63856 ?auto_63861 ) ) ( not ( = ?auto_63856 ?auto_63862 ) ) ( not ( = ?auto_63857 ?auto_63858 ) ) ( not ( = ?auto_63857 ?auto_63859 ) ) ( not ( = ?auto_63857 ?auto_63860 ) ) ( not ( = ?auto_63857 ?auto_63861 ) ) ( not ( = ?auto_63857 ?auto_63862 ) ) ( not ( = ?auto_63858 ?auto_63859 ) ) ( not ( = ?auto_63858 ?auto_63860 ) ) ( not ( = ?auto_63858 ?auto_63861 ) ) ( not ( = ?auto_63858 ?auto_63862 ) ) ( not ( = ?auto_63859 ?auto_63860 ) ) ( not ( = ?auto_63859 ?auto_63861 ) ) ( not ( = ?auto_63859 ?auto_63862 ) ) ( not ( = ?auto_63860 ?auto_63861 ) ) ( not ( = ?auto_63860 ?auto_63862 ) ) ( not ( = ?auto_63861 ?auto_63862 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_63861 ?auto_63862 )
      ( !STACK ?auto_63861 ?auto_63860 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_63882 - BLOCK
      ?auto_63883 - BLOCK
      ?auto_63884 - BLOCK
      ?auto_63885 - BLOCK
      ?auto_63886 - BLOCK
      ?auto_63887 - BLOCK
    )
    :vars
    (
      ?auto_63888 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63887 ?auto_63888 ) ( ON-TABLE ?auto_63882 ) ( ON ?auto_63883 ?auto_63882 ) ( ON ?auto_63884 ?auto_63883 ) ( ON ?auto_63885 ?auto_63884 ) ( not ( = ?auto_63882 ?auto_63883 ) ) ( not ( = ?auto_63882 ?auto_63884 ) ) ( not ( = ?auto_63882 ?auto_63885 ) ) ( not ( = ?auto_63882 ?auto_63886 ) ) ( not ( = ?auto_63882 ?auto_63887 ) ) ( not ( = ?auto_63882 ?auto_63888 ) ) ( not ( = ?auto_63883 ?auto_63884 ) ) ( not ( = ?auto_63883 ?auto_63885 ) ) ( not ( = ?auto_63883 ?auto_63886 ) ) ( not ( = ?auto_63883 ?auto_63887 ) ) ( not ( = ?auto_63883 ?auto_63888 ) ) ( not ( = ?auto_63884 ?auto_63885 ) ) ( not ( = ?auto_63884 ?auto_63886 ) ) ( not ( = ?auto_63884 ?auto_63887 ) ) ( not ( = ?auto_63884 ?auto_63888 ) ) ( not ( = ?auto_63885 ?auto_63886 ) ) ( not ( = ?auto_63885 ?auto_63887 ) ) ( not ( = ?auto_63885 ?auto_63888 ) ) ( not ( = ?auto_63886 ?auto_63887 ) ) ( not ( = ?auto_63886 ?auto_63888 ) ) ( not ( = ?auto_63887 ?auto_63888 ) ) ( CLEAR ?auto_63885 ) ( ON ?auto_63886 ?auto_63887 ) ( CLEAR ?auto_63886 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_63882 ?auto_63883 ?auto_63884 ?auto_63885 ?auto_63886 )
      ( MAKE-6PILE ?auto_63882 ?auto_63883 ?auto_63884 ?auto_63885 ?auto_63886 ?auto_63887 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_63908 - BLOCK
      ?auto_63909 - BLOCK
      ?auto_63910 - BLOCK
      ?auto_63911 - BLOCK
      ?auto_63912 - BLOCK
      ?auto_63913 - BLOCK
    )
    :vars
    (
      ?auto_63914 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63913 ?auto_63914 ) ( ON-TABLE ?auto_63908 ) ( ON ?auto_63909 ?auto_63908 ) ( ON ?auto_63910 ?auto_63909 ) ( not ( = ?auto_63908 ?auto_63909 ) ) ( not ( = ?auto_63908 ?auto_63910 ) ) ( not ( = ?auto_63908 ?auto_63911 ) ) ( not ( = ?auto_63908 ?auto_63912 ) ) ( not ( = ?auto_63908 ?auto_63913 ) ) ( not ( = ?auto_63908 ?auto_63914 ) ) ( not ( = ?auto_63909 ?auto_63910 ) ) ( not ( = ?auto_63909 ?auto_63911 ) ) ( not ( = ?auto_63909 ?auto_63912 ) ) ( not ( = ?auto_63909 ?auto_63913 ) ) ( not ( = ?auto_63909 ?auto_63914 ) ) ( not ( = ?auto_63910 ?auto_63911 ) ) ( not ( = ?auto_63910 ?auto_63912 ) ) ( not ( = ?auto_63910 ?auto_63913 ) ) ( not ( = ?auto_63910 ?auto_63914 ) ) ( not ( = ?auto_63911 ?auto_63912 ) ) ( not ( = ?auto_63911 ?auto_63913 ) ) ( not ( = ?auto_63911 ?auto_63914 ) ) ( not ( = ?auto_63912 ?auto_63913 ) ) ( not ( = ?auto_63912 ?auto_63914 ) ) ( not ( = ?auto_63913 ?auto_63914 ) ) ( ON ?auto_63912 ?auto_63913 ) ( CLEAR ?auto_63910 ) ( ON ?auto_63911 ?auto_63912 ) ( CLEAR ?auto_63911 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_63908 ?auto_63909 ?auto_63910 ?auto_63911 )
      ( MAKE-6PILE ?auto_63908 ?auto_63909 ?auto_63910 ?auto_63911 ?auto_63912 ?auto_63913 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_63934 - BLOCK
      ?auto_63935 - BLOCK
      ?auto_63936 - BLOCK
      ?auto_63937 - BLOCK
      ?auto_63938 - BLOCK
      ?auto_63939 - BLOCK
    )
    :vars
    (
      ?auto_63940 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63939 ?auto_63940 ) ( ON-TABLE ?auto_63934 ) ( ON ?auto_63935 ?auto_63934 ) ( not ( = ?auto_63934 ?auto_63935 ) ) ( not ( = ?auto_63934 ?auto_63936 ) ) ( not ( = ?auto_63934 ?auto_63937 ) ) ( not ( = ?auto_63934 ?auto_63938 ) ) ( not ( = ?auto_63934 ?auto_63939 ) ) ( not ( = ?auto_63934 ?auto_63940 ) ) ( not ( = ?auto_63935 ?auto_63936 ) ) ( not ( = ?auto_63935 ?auto_63937 ) ) ( not ( = ?auto_63935 ?auto_63938 ) ) ( not ( = ?auto_63935 ?auto_63939 ) ) ( not ( = ?auto_63935 ?auto_63940 ) ) ( not ( = ?auto_63936 ?auto_63937 ) ) ( not ( = ?auto_63936 ?auto_63938 ) ) ( not ( = ?auto_63936 ?auto_63939 ) ) ( not ( = ?auto_63936 ?auto_63940 ) ) ( not ( = ?auto_63937 ?auto_63938 ) ) ( not ( = ?auto_63937 ?auto_63939 ) ) ( not ( = ?auto_63937 ?auto_63940 ) ) ( not ( = ?auto_63938 ?auto_63939 ) ) ( not ( = ?auto_63938 ?auto_63940 ) ) ( not ( = ?auto_63939 ?auto_63940 ) ) ( ON ?auto_63938 ?auto_63939 ) ( ON ?auto_63937 ?auto_63938 ) ( CLEAR ?auto_63935 ) ( ON ?auto_63936 ?auto_63937 ) ( CLEAR ?auto_63936 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_63934 ?auto_63935 ?auto_63936 )
      ( MAKE-6PILE ?auto_63934 ?auto_63935 ?auto_63936 ?auto_63937 ?auto_63938 ?auto_63939 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_63960 - BLOCK
      ?auto_63961 - BLOCK
      ?auto_63962 - BLOCK
      ?auto_63963 - BLOCK
      ?auto_63964 - BLOCK
      ?auto_63965 - BLOCK
    )
    :vars
    (
      ?auto_63966 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63965 ?auto_63966 ) ( ON-TABLE ?auto_63960 ) ( not ( = ?auto_63960 ?auto_63961 ) ) ( not ( = ?auto_63960 ?auto_63962 ) ) ( not ( = ?auto_63960 ?auto_63963 ) ) ( not ( = ?auto_63960 ?auto_63964 ) ) ( not ( = ?auto_63960 ?auto_63965 ) ) ( not ( = ?auto_63960 ?auto_63966 ) ) ( not ( = ?auto_63961 ?auto_63962 ) ) ( not ( = ?auto_63961 ?auto_63963 ) ) ( not ( = ?auto_63961 ?auto_63964 ) ) ( not ( = ?auto_63961 ?auto_63965 ) ) ( not ( = ?auto_63961 ?auto_63966 ) ) ( not ( = ?auto_63962 ?auto_63963 ) ) ( not ( = ?auto_63962 ?auto_63964 ) ) ( not ( = ?auto_63962 ?auto_63965 ) ) ( not ( = ?auto_63962 ?auto_63966 ) ) ( not ( = ?auto_63963 ?auto_63964 ) ) ( not ( = ?auto_63963 ?auto_63965 ) ) ( not ( = ?auto_63963 ?auto_63966 ) ) ( not ( = ?auto_63964 ?auto_63965 ) ) ( not ( = ?auto_63964 ?auto_63966 ) ) ( not ( = ?auto_63965 ?auto_63966 ) ) ( ON ?auto_63964 ?auto_63965 ) ( ON ?auto_63963 ?auto_63964 ) ( ON ?auto_63962 ?auto_63963 ) ( CLEAR ?auto_63960 ) ( ON ?auto_63961 ?auto_63962 ) ( CLEAR ?auto_63961 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_63960 ?auto_63961 )
      ( MAKE-6PILE ?auto_63960 ?auto_63961 ?auto_63962 ?auto_63963 ?auto_63964 ?auto_63965 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_63986 - BLOCK
      ?auto_63987 - BLOCK
      ?auto_63988 - BLOCK
      ?auto_63989 - BLOCK
      ?auto_63990 - BLOCK
      ?auto_63991 - BLOCK
    )
    :vars
    (
      ?auto_63992 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63991 ?auto_63992 ) ( not ( = ?auto_63986 ?auto_63987 ) ) ( not ( = ?auto_63986 ?auto_63988 ) ) ( not ( = ?auto_63986 ?auto_63989 ) ) ( not ( = ?auto_63986 ?auto_63990 ) ) ( not ( = ?auto_63986 ?auto_63991 ) ) ( not ( = ?auto_63986 ?auto_63992 ) ) ( not ( = ?auto_63987 ?auto_63988 ) ) ( not ( = ?auto_63987 ?auto_63989 ) ) ( not ( = ?auto_63987 ?auto_63990 ) ) ( not ( = ?auto_63987 ?auto_63991 ) ) ( not ( = ?auto_63987 ?auto_63992 ) ) ( not ( = ?auto_63988 ?auto_63989 ) ) ( not ( = ?auto_63988 ?auto_63990 ) ) ( not ( = ?auto_63988 ?auto_63991 ) ) ( not ( = ?auto_63988 ?auto_63992 ) ) ( not ( = ?auto_63989 ?auto_63990 ) ) ( not ( = ?auto_63989 ?auto_63991 ) ) ( not ( = ?auto_63989 ?auto_63992 ) ) ( not ( = ?auto_63990 ?auto_63991 ) ) ( not ( = ?auto_63990 ?auto_63992 ) ) ( not ( = ?auto_63991 ?auto_63992 ) ) ( ON ?auto_63990 ?auto_63991 ) ( ON ?auto_63989 ?auto_63990 ) ( ON ?auto_63988 ?auto_63989 ) ( ON ?auto_63987 ?auto_63988 ) ( ON ?auto_63986 ?auto_63987 ) ( CLEAR ?auto_63986 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_63986 )
      ( MAKE-6PILE ?auto_63986 ?auto_63987 ?auto_63988 ?auto_63989 ?auto_63990 ?auto_63991 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_64013 - BLOCK
      ?auto_64014 - BLOCK
      ?auto_64015 - BLOCK
      ?auto_64016 - BLOCK
      ?auto_64017 - BLOCK
      ?auto_64018 - BLOCK
      ?auto_64019 - BLOCK
    )
    :vars
    (
      ?auto_64020 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_64018 ) ( ON ?auto_64019 ?auto_64020 ) ( CLEAR ?auto_64019 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_64013 ) ( ON ?auto_64014 ?auto_64013 ) ( ON ?auto_64015 ?auto_64014 ) ( ON ?auto_64016 ?auto_64015 ) ( ON ?auto_64017 ?auto_64016 ) ( ON ?auto_64018 ?auto_64017 ) ( not ( = ?auto_64013 ?auto_64014 ) ) ( not ( = ?auto_64013 ?auto_64015 ) ) ( not ( = ?auto_64013 ?auto_64016 ) ) ( not ( = ?auto_64013 ?auto_64017 ) ) ( not ( = ?auto_64013 ?auto_64018 ) ) ( not ( = ?auto_64013 ?auto_64019 ) ) ( not ( = ?auto_64013 ?auto_64020 ) ) ( not ( = ?auto_64014 ?auto_64015 ) ) ( not ( = ?auto_64014 ?auto_64016 ) ) ( not ( = ?auto_64014 ?auto_64017 ) ) ( not ( = ?auto_64014 ?auto_64018 ) ) ( not ( = ?auto_64014 ?auto_64019 ) ) ( not ( = ?auto_64014 ?auto_64020 ) ) ( not ( = ?auto_64015 ?auto_64016 ) ) ( not ( = ?auto_64015 ?auto_64017 ) ) ( not ( = ?auto_64015 ?auto_64018 ) ) ( not ( = ?auto_64015 ?auto_64019 ) ) ( not ( = ?auto_64015 ?auto_64020 ) ) ( not ( = ?auto_64016 ?auto_64017 ) ) ( not ( = ?auto_64016 ?auto_64018 ) ) ( not ( = ?auto_64016 ?auto_64019 ) ) ( not ( = ?auto_64016 ?auto_64020 ) ) ( not ( = ?auto_64017 ?auto_64018 ) ) ( not ( = ?auto_64017 ?auto_64019 ) ) ( not ( = ?auto_64017 ?auto_64020 ) ) ( not ( = ?auto_64018 ?auto_64019 ) ) ( not ( = ?auto_64018 ?auto_64020 ) ) ( not ( = ?auto_64019 ?auto_64020 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_64019 ?auto_64020 )
      ( !STACK ?auto_64019 ?auto_64018 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_64043 - BLOCK
      ?auto_64044 - BLOCK
      ?auto_64045 - BLOCK
      ?auto_64046 - BLOCK
      ?auto_64047 - BLOCK
      ?auto_64048 - BLOCK
      ?auto_64049 - BLOCK
    )
    :vars
    (
      ?auto_64050 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64049 ?auto_64050 ) ( ON-TABLE ?auto_64043 ) ( ON ?auto_64044 ?auto_64043 ) ( ON ?auto_64045 ?auto_64044 ) ( ON ?auto_64046 ?auto_64045 ) ( ON ?auto_64047 ?auto_64046 ) ( not ( = ?auto_64043 ?auto_64044 ) ) ( not ( = ?auto_64043 ?auto_64045 ) ) ( not ( = ?auto_64043 ?auto_64046 ) ) ( not ( = ?auto_64043 ?auto_64047 ) ) ( not ( = ?auto_64043 ?auto_64048 ) ) ( not ( = ?auto_64043 ?auto_64049 ) ) ( not ( = ?auto_64043 ?auto_64050 ) ) ( not ( = ?auto_64044 ?auto_64045 ) ) ( not ( = ?auto_64044 ?auto_64046 ) ) ( not ( = ?auto_64044 ?auto_64047 ) ) ( not ( = ?auto_64044 ?auto_64048 ) ) ( not ( = ?auto_64044 ?auto_64049 ) ) ( not ( = ?auto_64044 ?auto_64050 ) ) ( not ( = ?auto_64045 ?auto_64046 ) ) ( not ( = ?auto_64045 ?auto_64047 ) ) ( not ( = ?auto_64045 ?auto_64048 ) ) ( not ( = ?auto_64045 ?auto_64049 ) ) ( not ( = ?auto_64045 ?auto_64050 ) ) ( not ( = ?auto_64046 ?auto_64047 ) ) ( not ( = ?auto_64046 ?auto_64048 ) ) ( not ( = ?auto_64046 ?auto_64049 ) ) ( not ( = ?auto_64046 ?auto_64050 ) ) ( not ( = ?auto_64047 ?auto_64048 ) ) ( not ( = ?auto_64047 ?auto_64049 ) ) ( not ( = ?auto_64047 ?auto_64050 ) ) ( not ( = ?auto_64048 ?auto_64049 ) ) ( not ( = ?auto_64048 ?auto_64050 ) ) ( not ( = ?auto_64049 ?auto_64050 ) ) ( CLEAR ?auto_64047 ) ( ON ?auto_64048 ?auto_64049 ) ( CLEAR ?auto_64048 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_64043 ?auto_64044 ?auto_64045 ?auto_64046 ?auto_64047 ?auto_64048 )
      ( MAKE-7PILE ?auto_64043 ?auto_64044 ?auto_64045 ?auto_64046 ?auto_64047 ?auto_64048 ?auto_64049 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_64073 - BLOCK
      ?auto_64074 - BLOCK
      ?auto_64075 - BLOCK
      ?auto_64076 - BLOCK
      ?auto_64077 - BLOCK
      ?auto_64078 - BLOCK
      ?auto_64079 - BLOCK
    )
    :vars
    (
      ?auto_64080 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64079 ?auto_64080 ) ( ON-TABLE ?auto_64073 ) ( ON ?auto_64074 ?auto_64073 ) ( ON ?auto_64075 ?auto_64074 ) ( ON ?auto_64076 ?auto_64075 ) ( not ( = ?auto_64073 ?auto_64074 ) ) ( not ( = ?auto_64073 ?auto_64075 ) ) ( not ( = ?auto_64073 ?auto_64076 ) ) ( not ( = ?auto_64073 ?auto_64077 ) ) ( not ( = ?auto_64073 ?auto_64078 ) ) ( not ( = ?auto_64073 ?auto_64079 ) ) ( not ( = ?auto_64073 ?auto_64080 ) ) ( not ( = ?auto_64074 ?auto_64075 ) ) ( not ( = ?auto_64074 ?auto_64076 ) ) ( not ( = ?auto_64074 ?auto_64077 ) ) ( not ( = ?auto_64074 ?auto_64078 ) ) ( not ( = ?auto_64074 ?auto_64079 ) ) ( not ( = ?auto_64074 ?auto_64080 ) ) ( not ( = ?auto_64075 ?auto_64076 ) ) ( not ( = ?auto_64075 ?auto_64077 ) ) ( not ( = ?auto_64075 ?auto_64078 ) ) ( not ( = ?auto_64075 ?auto_64079 ) ) ( not ( = ?auto_64075 ?auto_64080 ) ) ( not ( = ?auto_64076 ?auto_64077 ) ) ( not ( = ?auto_64076 ?auto_64078 ) ) ( not ( = ?auto_64076 ?auto_64079 ) ) ( not ( = ?auto_64076 ?auto_64080 ) ) ( not ( = ?auto_64077 ?auto_64078 ) ) ( not ( = ?auto_64077 ?auto_64079 ) ) ( not ( = ?auto_64077 ?auto_64080 ) ) ( not ( = ?auto_64078 ?auto_64079 ) ) ( not ( = ?auto_64078 ?auto_64080 ) ) ( not ( = ?auto_64079 ?auto_64080 ) ) ( ON ?auto_64078 ?auto_64079 ) ( CLEAR ?auto_64076 ) ( ON ?auto_64077 ?auto_64078 ) ( CLEAR ?auto_64077 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_64073 ?auto_64074 ?auto_64075 ?auto_64076 ?auto_64077 )
      ( MAKE-7PILE ?auto_64073 ?auto_64074 ?auto_64075 ?auto_64076 ?auto_64077 ?auto_64078 ?auto_64079 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_64103 - BLOCK
      ?auto_64104 - BLOCK
      ?auto_64105 - BLOCK
      ?auto_64106 - BLOCK
      ?auto_64107 - BLOCK
      ?auto_64108 - BLOCK
      ?auto_64109 - BLOCK
    )
    :vars
    (
      ?auto_64110 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64109 ?auto_64110 ) ( ON-TABLE ?auto_64103 ) ( ON ?auto_64104 ?auto_64103 ) ( ON ?auto_64105 ?auto_64104 ) ( not ( = ?auto_64103 ?auto_64104 ) ) ( not ( = ?auto_64103 ?auto_64105 ) ) ( not ( = ?auto_64103 ?auto_64106 ) ) ( not ( = ?auto_64103 ?auto_64107 ) ) ( not ( = ?auto_64103 ?auto_64108 ) ) ( not ( = ?auto_64103 ?auto_64109 ) ) ( not ( = ?auto_64103 ?auto_64110 ) ) ( not ( = ?auto_64104 ?auto_64105 ) ) ( not ( = ?auto_64104 ?auto_64106 ) ) ( not ( = ?auto_64104 ?auto_64107 ) ) ( not ( = ?auto_64104 ?auto_64108 ) ) ( not ( = ?auto_64104 ?auto_64109 ) ) ( not ( = ?auto_64104 ?auto_64110 ) ) ( not ( = ?auto_64105 ?auto_64106 ) ) ( not ( = ?auto_64105 ?auto_64107 ) ) ( not ( = ?auto_64105 ?auto_64108 ) ) ( not ( = ?auto_64105 ?auto_64109 ) ) ( not ( = ?auto_64105 ?auto_64110 ) ) ( not ( = ?auto_64106 ?auto_64107 ) ) ( not ( = ?auto_64106 ?auto_64108 ) ) ( not ( = ?auto_64106 ?auto_64109 ) ) ( not ( = ?auto_64106 ?auto_64110 ) ) ( not ( = ?auto_64107 ?auto_64108 ) ) ( not ( = ?auto_64107 ?auto_64109 ) ) ( not ( = ?auto_64107 ?auto_64110 ) ) ( not ( = ?auto_64108 ?auto_64109 ) ) ( not ( = ?auto_64108 ?auto_64110 ) ) ( not ( = ?auto_64109 ?auto_64110 ) ) ( ON ?auto_64108 ?auto_64109 ) ( ON ?auto_64107 ?auto_64108 ) ( CLEAR ?auto_64105 ) ( ON ?auto_64106 ?auto_64107 ) ( CLEAR ?auto_64106 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_64103 ?auto_64104 ?auto_64105 ?auto_64106 )
      ( MAKE-7PILE ?auto_64103 ?auto_64104 ?auto_64105 ?auto_64106 ?auto_64107 ?auto_64108 ?auto_64109 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_64133 - BLOCK
      ?auto_64134 - BLOCK
      ?auto_64135 - BLOCK
      ?auto_64136 - BLOCK
      ?auto_64137 - BLOCK
      ?auto_64138 - BLOCK
      ?auto_64139 - BLOCK
    )
    :vars
    (
      ?auto_64140 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64139 ?auto_64140 ) ( ON-TABLE ?auto_64133 ) ( ON ?auto_64134 ?auto_64133 ) ( not ( = ?auto_64133 ?auto_64134 ) ) ( not ( = ?auto_64133 ?auto_64135 ) ) ( not ( = ?auto_64133 ?auto_64136 ) ) ( not ( = ?auto_64133 ?auto_64137 ) ) ( not ( = ?auto_64133 ?auto_64138 ) ) ( not ( = ?auto_64133 ?auto_64139 ) ) ( not ( = ?auto_64133 ?auto_64140 ) ) ( not ( = ?auto_64134 ?auto_64135 ) ) ( not ( = ?auto_64134 ?auto_64136 ) ) ( not ( = ?auto_64134 ?auto_64137 ) ) ( not ( = ?auto_64134 ?auto_64138 ) ) ( not ( = ?auto_64134 ?auto_64139 ) ) ( not ( = ?auto_64134 ?auto_64140 ) ) ( not ( = ?auto_64135 ?auto_64136 ) ) ( not ( = ?auto_64135 ?auto_64137 ) ) ( not ( = ?auto_64135 ?auto_64138 ) ) ( not ( = ?auto_64135 ?auto_64139 ) ) ( not ( = ?auto_64135 ?auto_64140 ) ) ( not ( = ?auto_64136 ?auto_64137 ) ) ( not ( = ?auto_64136 ?auto_64138 ) ) ( not ( = ?auto_64136 ?auto_64139 ) ) ( not ( = ?auto_64136 ?auto_64140 ) ) ( not ( = ?auto_64137 ?auto_64138 ) ) ( not ( = ?auto_64137 ?auto_64139 ) ) ( not ( = ?auto_64137 ?auto_64140 ) ) ( not ( = ?auto_64138 ?auto_64139 ) ) ( not ( = ?auto_64138 ?auto_64140 ) ) ( not ( = ?auto_64139 ?auto_64140 ) ) ( ON ?auto_64138 ?auto_64139 ) ( ON ?auto_64137 ?auto_64138 ) ( ON ?auto_64136 ?auto_64137 ) ( CLEAR ?auto_64134 ) ( ON ?auto_64135 ?auto_64136 ) ( CLEAR ?auto_64135 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_64133 ?auto_64134 ?auto_64135 )
      ( MAKE-7PILE ?auto_64133 ?auto_64134 ?auto_64135 ?auto_64136 ?auto_64137 ?auto_64138 ?auto_64139 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_64163 - BLOCK
      ?auto_64164 - BLOCK
      ?auto_64165 - BLOCK
      ?auto_64166 - BLOCK
      ?auto_64167 - BLOCK
      ?auto_64168 - BLOCK
      ?auto_64169 - BLOCK
    )
    :vars
    (
      ?auto_64170 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64169 ?auto_64170 ) ( ON-TABLE ?auto_64163 ) ( not ( = ?auto_64163 ?auto_64164 ) ) ( not ( = ?auto_64163 ?auto_64165 ) ) ( not ( = ?auto_64163 ?auto_64166 ) ) ( not ( = ?auto_64163 ?auto_64167 ) ) ( not ( = ?auto_64163 ?auto_64168 ) ) ( not ( = ?auto_64163 ?auto_64169 ) ) ( not ( = ?auto_64163 ?auto_64170 ) ) ( not ( = ?auto_64164 ?auto_64165 ) ) ( not ( = ?auto_64164 ?auto_64166 ) ) ( not ( = ?auto_64164 ?auto_64167 ) ) ( not ( = ?auto_64164 ?auto_64168 ) ) ( not ( = ?auto_64164 ?auto_64169 ) ) ( not ( = ?auto_64164 ?auto_64170 ) ) ( not ( = ?auto_64165 ?auto_64166 ) ) ( not ( = ?auto_64165 ?auto_64167 ) ) ( not ( = ?auto_64165 ?auto_64168 ) ) ( not ( = ?auto_64165 ?auto_64169 ) ) ( not ( = ?auto_64165 ?auto_64170 ) ) ( not ( = ?auto_64166 ?auto_64167 ) ) ( not ( = ?auto_64166 ?auto_64168 ) ) ( not ( = ?auto_64166 ?auto_64169 ) ) ( not ( = ?auto_64166 ?auto_64170 ) ) ( not ( = ?auto_64167 ?auto_64168 ) ) ( not ( = ?auto_64167 ?auto_64169 ) ) ( not ( = ?auto_64167 ?auto_64170 ) ) ( not ( = ?auto_64168 ?auto_64169 ) ) ( not ( = ?auto_64168 ?auto_64170 ) ) ( not ( = ?auto_64169 ?auto_64170 ) ) ( ON ?auto_64168 ?auto_64169 ) ( ON ?auto_64167 ?auto_64168 ) ( ON ?auto_64166 ?auto_64167 ) ( ON ?auto_64165 ?auto_64166 ) ( CLEAR ?auto_64163 ) ( ON ?auto_64164 ?auto_64165 ) ( CLEAR ?auto_64164 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_64163 ?auto_64164 )
      ( MAKE-7PILE ?auto_64163 ?auto_64164 ?auto_64165 ?auto_64166 ?auto_64167 ?auto_64168 ?auto_64169 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_64193 - BLOCK
      ?auto_64194 - BLOCK
      ?auto_64195 - BLOCK
      ?auto_64196 - BLOCK
      ?auto_64197 - BLOCK
      ?auto_64198 - BLOCK
      ?auto_64199 - BLOCK
    )
    :vars
    (
      ?auto_64200 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64199 ?auto_64200 ) ( not ( = ?auto_64193 ?auto_64194 ) ) ( not ( = ?auto_64193 ?auto_64195 ) ) ( not ( = ?auto_64193 ?auto_64196 ) ) ( not ( = ?auto_64193 ?auto_64197 ) ) ( not ( = ?auto_64193 ?auto_64198 ) ) ( not ( = ?auto_64193 ?auto_64199 ) ) ( not ( = ?auto_64193 ?auto_64200 ) ) ( not ( = ?auto_64194 ?auto_64195 ) ) ( not ( = ?auto_64194 ?auto_64196 ) ) ( not ( = ?auto_64194 ?auto_64197 ) ) ( not ( = ?auto_64194 ?auto_64198 ) ) ( not ( = ?auto_64194 ?auto_64199 ) ) ( not ( = ?auto_64194 ?auto_64200 ) ) ( not ( = ?auto_64195 ?auto_64196 ) ) ( not ( = ?auto_64195 ?auto_64197 ) ) ( not ( = ?auto_64195 ?auto_64198 ) ) ( not ( = ?auto_64195 ?auto_64199 ) ) ( not ( = ?auto_64195 ?auto_64200 ) ) ( not ( = ?auto_64196 ?auto_64197 ) ) ( not ( = ?auto_64196 ?auto_64198 ) ) ( not ( = ?auto_64196 ?auto_64199 ) ) ( not ( = ?auto_64196 ?auto_64200 ) ) ( not ( = ?auto_64197 ?auto_64198 ) ) ( not ( = ?auto_64197 ?auto_64199 ) ) ( not ( = ?auto_64197 ?auto_64200 ) ) ( not ( = ?auto_64198 ?auto_64199 ) ) ( not ( = ?auto_64198 ?auto_64200 ) ) ( not ( = ?auto_64199 ?auto_64200 ) ) ( ON ?auto_64198 ?auto_64199 ) ( ON ?auto_64197 ?auto_64198 ) ( ON ?auto_64196 ?auto_64197 ) ( ON ?auto_64195 ?auto_64196 ) ( ON ?auto_64194 ?auto_64195 ) ( ON ?auto_64193 ?auto_64194 ) ( CLEAR ?auto_64193 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_64193 )
      ( MAKE-7PILE ?auto_64193 ?auto_64194 ?auto_64195 ?auto_64196 ?auto_64197 ?auto_64198 ?auto_64199 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_64224 - BLOCK
      ?auto_64225 - BLOCK
      ?auto_64226 - BLOCK
      ?auto_64227 - BLOCK
      ?auto_64228 - BLOCK
      ?auto_64229 - BLOCK
      ?auto_64230 - BLOCK
      ?auto_64231 - BLOCK
    )
    :vars
    (
      ?auto_64232 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_64230 ) ( ON ?auto_64231 ?auto_64232 ) ( CLEAR ?auto_64231 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_64224 ) ( ON ?auto_64225 ?auto_64224 ) ( ON ?auto_64226 ?auto_64225 ) ( ON ?auto_64227 ?auto_64226 ) ( ON ?auto_64228 ?auto_64227 ) ( ON ?auto_64229 ?auto_64228 ) ( ON ?auto_64230 ?auto_64229 ) ( not ( = ?auto_64224 ?auto_64225 ) ) ( not ( = ?auto_64224 ?auto_64226 ) ) ( not ( = ?auto_64224 ?auto_64227 ) ) ( not ( = ?auto_64224 ?auto_64228 ) ) ( not ( = ?auto_64224 ?auto_64229 ) ) ( not ( = ?auto_64224 ?auto_64230 ) ) ( not ( = ?auto_64224 ?auto_64231 ) ) ( not ( = ?auto_64224 ?auto_64232 ) ) ( not ( = ?auto_64225 ?auto_64226 ) ) ( not ( = ?auto_64225 ?auto_64227 ) ) ( not ( = ?auto_64225 ?auto_64228 ) ) ( not ( = ?auto_64225 ?auto_64229 ) ) ( not ( = ?auto_64225 ?auto_64230 ) ) ( not ( = ?auto_64225 ?auto_64231 ) ) ( not ( = ?auto_64225 ?auto_64232 ) ) ( not ( = ?auto_64226 ?auto_64227 ) ) ( not ( = ?auto_64226 ?auto_64228 ) ) ( not ( = ?auto_64226 ?auto_64229 ) ) ( not ( = ?auto_64226 ?auto_64230 ) ) ( not ( = ?auto_64226 ?auto_64231 ) ) ( not ( = ?auto_64226 ?auto_64232 ) ) ( not ( = ?auto_64227 ?auto_64228 ) ) ( not ( = ?auto_64227 ?auto_64229 ) ) ( not ( = ?auto_64227 ?auto_64230 ) ) ( not ( = ?auto_64227 ?auto_64231 ) ) ( not ( = ?auto_64227 ?auto_64232 ) ) ( not ( = ?auto_64228 ?auto_64229 ) ) ( not ( = ?auto_64228 ?auto_64230 ) ) ( not ( = ?auto_64228 ?auto_64231 ) ) ( not ( = ?auto_64228 ?auto_64232 ) ) ( not ( = ?auto_64229 ?auto_64230 ) ) ( not ( = ?auto_64229 ?auto_64231 ) ) ( not ( = ?auto_64229 ?auto_64232 ) ) ( not ( = ?auto_64230 ?auto_64231 ) ) ( not ( = ?auto_64230 ?auto_64232 ) ) ( not ( = ?auto_64231 ?auto_64232 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_64231 ?auto_64232 )
      ( !STACK ?auto_64231 ?auto_64230 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_64258 - BLOCK
      ?auto_64259 - BLOCK
      ?auto_64260 - BLOCK
      ?auto_64261 - BLOCK
      ?auto_64262 - BLOCK
      ?auto_64263 - BLOCK
      ?auto_64264 - BLOCK
      ?auto_64265 - BLOCK
    )
    :vars
    (
      ?auto_64266 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64265 ?auto_64266 ) ( ON-TABLE ?auto_64258 ) ( ON ?auto_64259 ?auto_64258 ) ( ON ?auto_64260 ?auto_64259 ) ( ON ?auto_64261 ?auto_64260 ) ( ON ?auto_64262 ?auto_64261 ) ( ON ?auto_64263 ?auto_64262 ) ( not ( = ?auto_64258 ?auto_64259 ) ) ( not ( = ?auto_64258 ?auto_64260 ) ) ( not ( = ?auto_64258 ?auto_64261 ) ) ( not ( = ?auto_64258 ?auto_64262 ) ) ( not ( = ?auto_64258 ?auto_64263 ) ) ( not ( = ?auto_64258 ?auto_64264 ) ) ( not ( = ?auto_64258 ?auto_64265 ) ) ( not ( = ?auto_64258 ?auto_64266 ) ) ( not ( = ?auto_64259 ?auto_64260 ) ) ( not ( = ?auto_64259 ?auto_64261 ) ) ( not ( = ?auto_64259 ?auto_64262 ) ) ( not ( = ?auto_64259 ?auto_64263 ) ) ( not ( = ?auto_64259 ?auto_64264 ) ) ( not ( = ?auto_64259 ?auto_64265 ) ) ( not ( = ?auto_64259 ?auto_64266 ) ) ( not ( = ?auto_64260 ?auto_64261 ) ) ( not ( = ?auto_64260 ?auto_64262 ) ) ( not ( = ?auto_64260 ?auto_64263 ) ) ( not ( = ?auto_64260 ?auto_64264 ) ) ( not ( = ?auto_64260 ?auto_64265 ) ) ( not ( = ?auto_64260 ?auto_64266 ) ) ( not ( = ?auto_64261 ?auto_64262 ) ) ( not ( = ?auto_64261 ?auto_64263 ) ) ( not ( = ?auto_64261 ?auto_64264 ) ) ( not ( = ?auto_64261 ?auto_64265 ) ) ( not ( = ?auto_64261 ?auto_64266 ) ) ( not ( = ?auto_64262 ?auto_64263 ) ) ( not ( = ?auto_64262 ?auto_64264 ) ) ( not ( = ?auto_64262 ?auto_64265 ) ) ( not ( = ?auto_64262 ?auto_64266 ) ) ( not ( = ?auto_64263 ?auto_64264 ) ) ( not ( = ?auto_64263 ?auto_64265 ) ) ( not ( = ?auto_64263 ?auto_64266 ) ) ( not ( = ?auto_64264 ?auto_64265 ) ) ( not ( = ?auto_64264 ?auto_64266 ) ) ( not ( = ?auto_64265 ?auto_64266 ) ) ( CLEAR ?auto_64263 ) ( ON ?auto_64264 ?auto_64265 ) ( CLEAR ?auto_64264 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_64258 ?auto_64259 ?auto_64260 ?auto_64261 ?auto_64262 ?auto_64263 ?auto_64264 )
      ( MAKE-8PILE ?auto_64258 ?auto_64259 ?auto_64260 ?auto_64261 ?auto_64262 ?auto_64263 ?auto_64264 ?auto_64265 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_64292 - BLOCK
      ?auto_64293 - BLOCK
      ?auto_64294 - BLOCK
      ?auto_64295 - BLOCK
      ?auto_64296 - BLOCK
      ?auto_64297 - BLOCK
      ?auto_64298 - BLOCK
      ?auto_64299 - BLOCK
    )
    :vars
    (
      ?auto_64300 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64299 ?auto_64300 ) ( ON-TABLE ?auto_64292 ) ( ON ?auto_64293 ?auto_64292 ) ( ON ?auto_64294 ?auto_64293 ) ( ON ?auto_64295 ?auto_64294 ) ( ON ?auto_64296 ?auto_64295 ) ( not ( = ?auto_64292 ?auto_64293 ) ) ( not ( = ?auto_64292 ?auto_64294 ) ) ( not ( = ?auto_64292 ?auto_64295 ) ) ( not ( = ?auto_64292 ?auto_64296 ) ) ( not ( = ?auto_64292 ?auto_64297 ) ) ( not ( = ?auto_64292 ?auto_64298 ) ) ( not ( = ?auto_64292 ?auto_64299 ) ) ( not ( = ?auto_64292 ?auto_64300 ) ) ( not ( = ?auto_64293 ?auto_64294 ) ) ( not ( = ?auto_64293 ?auto_64295 ) ) ( not ( = ?auto_64293 ?auto_64296 ) ) ( not ( = ?auto_64293 ?auto_64297 ) ) ( not ( = ?auto_64293 ?auto_64298 ) ) ( not ( = ?auto_64293 ?auto_64299 ) ) ( not ( = ?auto_64293 ?auto_64300 ) ) ( not ( = ?auto_64294 ?auto_64295 ) ) ( not ( = ?auto_64294 ?auto_64296 ) ) ( not ( = ?auto_64294 ?auto_64297 ) ) ( not ( = ?auto_64294 ?auto_64298 ) ) ( not ( = ?auto_64294 ?auto_64299 ) ) ( not ( = ?auto_64294 ?auto_64300 ) ) ( not ( = ?auto_64295 ?auto_64296 ) ) ( not ( = ?auto_64295 ?auto_64297 ) ) ( not ( = ?auto_64295 ?auto_64298 ) ) ( not ( = ?auto_64295 ?auto_64299 ) ) ( not ( = ?auto_64295 ?auto_64300 ) ) ( not ( = ?auto_64296 ?auto_64297 ) ) ( not ( = ?auto_64296 ?auto_64298 ) ) ( not ( = ?auto_64296 ?auto_64299 ) ) ( not ( = ?auto_64296 ?auto_64300 ) ) ( not ( = ?auto_64297 ?auto_64298 ) ) ( not ( = ?auto_64297 ?auto_64299 ) ) ( not ( = ?auto_64297 ?auto_64300 ) ) ( not ( = ?auto_64298 ?auto_64299 ) ) ( not ( = ?auto_64298 ?auto_64300 ) ) ( not ( = ?auto_64299 ?auto_64300 ) ) ( ON ?auto_64298 ?auto_64299 ) ( CLEAR ?auto_64296 ) ( ON ?auto_64297 ?auto_64298 ) ( CLEAR ?auto_64297 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_64292 ?auto_64293 ?auto_64294 ?auto_64295 ?auto_64296 ?auto_64297 )
      ( MAKE-8PILE ?auto_64292 ?auto_64293 ?auto_64294 ?auto_64295 ?auto_64296 ?auto_64297 ?auto_64298 ?auto_64299 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_64326 - BLOCK
      ?auto_64327 - BLOCK
      ?auto_64328 - BLOCK
      ?auto_64329 - BLOCK
      ?auto_64330 - BLOCK
      ?auto_64331 - BLOCK
      ?auto_64332 - BLOCK
      ?auto_64333 - BLOCK
    )
    :vars
    (
      ?auto_64334 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64333 ?auto_64334 ) ( ON-TABLE ?auto_64326 ) ( ON ?auto_64327 ?auto_64326 ) ( ON ?auto_64328 ?auto_64327 ) ( ON ?auto_64329 ?auto_64328 ) ( not ( = ?auto_64326 ?auto_64327 ) ) ( not ( = ?auto_64326 ?auto_64328 ) ) ( not ( = ?auto_64326 ?auto_64329 ) ) ( not ( = ?auto_64326 ?auto_64330 ) ) ( not ( = ?auto_64326 ?auto_64331 ) ) ( not ( = ?auto_64326 ?auto_64332 ) ) ( not ( = ?auto_64326 ?auto_64333 ) ) ( not ( = ?auto_64326 ?auto_64334 ) ) ( not ( = ?auto_64327 ?auto_64328 ) ) ( not ( = ?auto_64327 ?auto_64329 ) ) ( not ( = ?auto_64327 ?auto_64330 ) ) ( not ( = ?auto_64327 ?auto_64331 ) ) ( not ( = ?auto_64327 ?auto_64332 ) ) ( not ( = ?auto_64327 ?auto_64333 ) ) ( not ( = ?auto_64327 ?auto_64334 ) ) ( not ( = ?auto_64328 ?auto_64329 ) ) ( not ( = ?auto_64328 ?auto_64330 ) ) ( not ( = ?auto_64328 ?auto_64331 ) ) ( not ( = ?auto_64328 ?auto_64332 ) ) ( not ( = ?auto_64328 ?auto_64333 ) ) ( not ( = ?auto_64328 ?auto_64334 ) ) ( not ( = ?auto_64329 ?auto_64330 ) ) ( not ( = ?auto_64329 ?auto_64331 ) ) ( not ( = ?auto_64329 ?auto_64332 ) ) ( not ( = ?auto_64329 ?auto_64333 ) ) ( not ( = ?auto_64329 ?auto_64334 ) ) ( not ( = ?auto_64330 ?auto_64331 ) ) ( not ( = ?auto_64330 ?auto_64332 ) ) ( not ( = ?auto_64330 ?auto_64333 ) ) ( not ( = ?auto_64330 ?auto_64334 ) ) ( not ( = ?auto_64331 ?auto_64332 ) ) ( not ( = ?auto_64331 ?auto_64333 ) ) ( not ( = ?auto_64331 ?auto_64334 ) ) ( not ( = ?auto_64332 ?auto_64333 ) ) ( not ( = ?auto_64332 ?auto_64334 ) ) ( not ( = ?auto_64333 ?auto_64334 ) ) ( ON ?auto_64332 ?auto_64333 ) ( ON ?auto_64331 ?auto_64332 ) ( CLEAR ?auto_64329 ) ( ON ?auto_64330 ?auto_64331 ) ( CLEAR ?auto_64330 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_64326 ?auto_64327 ?auto_64328 ?auto_64329 ?auto_64330 )
      ( MAKE-8PILE ?auto_64326 ?auto_64327 ?auto_64328 ?auto_64329 ?auto_64330 ?auto_64331 ?auto_64332 ?auto_64333 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_64360 - BLOCK
      ?auto_64361 - BLOCK
      ?auto_64362 - BLOCK
      ?auto_64363 - BLOCK
      ?auto_64364 - BLOCK
      ?auto_64365 - BLOCK
      ?auto_64366 - BLOCK
      ?auto_64367 - BLOCK
    )
    :vars
    (
      ?auto_64368 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64367 ?auto_64368 ) ( ON-TABLE ?auto_64360 ) ( ON ?auto_64361 ?auto_64360 ) ( ON ?auto_64362 ?auto_64361 ) ( not ( = ?auto_64360 ?auto_64361 ) ) ( not ( = ?auto_64360 ?auto_64362 ) ) ( not ( = ?auto_64360 ?auto_64363 ) ) ( not ( = ?auto_64360 ?auto_64364 ) ) ( not ( = ?auto_64360 ?auto_64365 ) ) ( not ( = ?auto_64360 ?auto_64366 ) ) ( not ( = ?auto_64360 ?auto_64367 ) ) ( not ( = ?auto_64360 ?auto_64368 ) ) ( not ( = ?auto_64361 ?auto_64362 ) ) ( not ( = ?auto_64361 ?auto_64363 ) ) ( not ( = ?auto_64361 ?auto_64364 ) ) ( not ( = ?auto_64361 ?auto_64365 ) ) ( not ( = ?auto_64361 ?auto_64366 ) ) ( not ( = ?auto_64361 ?auto_64367 ) ) ( not ( = ?auto_64361 ?auto_64368 ) ) ( not ( = ?auto_64362 ?auto_64363 ) ) ( not ( = ?auto_64362 ?auto_64364 ) ) ( not ( = ?auto_64362 ?auto_64365 ) ) ( not ( = ?auto_64362 ?auto_64366 ) ) ( not ( = ?auto_64362 ?auto_64367 ) ) ( not ( = ?auto_64362 ?auto_64368 ) ) ( not ( = ?auto_64363 ?auto_64364 ) ) ( not ( = ?auto_64363 ?auto_64365 ) ) ( not ( = ?auto_64363 ?auto_64366 ) ) ( not ( = ?auto_64363 ?auto_64367 ) ) ( not ( = ?auto_64363 ?auto_64368 ) ) ( not ( = ?auto_64364 ?auto_64365 ) ) ( not ( = ?auto_64364 ?auto_64366 ) ) ( not ( = ?auto_64364 ?auto_64367 ) ) ( not ( = ?auto_64364 ?auto_64368 ) ) ( not ( = ?auto_64365 ?auto_64366 ) ) ( not ( = ?auto_64365 ?auto_64367 ) ) ( not ( = ?auto_64365 ?auto_64368 ) ) ( not ( = ?auto_64366 ?auto_64367 ) ) ( not ( = ?auto_64366 ?auto_64368 ) ) ( not ( = ?auto_64367 ?auto_64368 ) ) ( ON ?auto_64366 ?auto_64367 ) ( ON ?auto_64365 ?auto_64366 ) ( ON ?auto_64364 ?auto_64365 ) ( CLEAR ?auto_64362 ) ( ON ?auto_64363 ?auto_64364 ) ( CLEAR ?auto_64363 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_64360 ?auto_64361 ?auto_64362 ?auto_64363 )
      ( MAKE-8PILE ?auto_64360 ?auto_64361 ?auto_64362 ?auto_64363 ?auto_64364 ?auto_64365 ?auto_64366 ?auto_64367 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_64394 - BLOCK
      ?auto_64395 - BLOCK
      ?auto_64396 - BLOCK
      ?auto_64397 - BLOCK
      ?auto_64398 - BLOCK
      ?auto_64399 - BLOCK
      ?auto_64400 - BLOCK
      ?auto_64401 - BLOCK
    )
    :vars
    (
      ?auto_64402 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64401 ?auto_64402 ) ( ON-TABLE ?auto_64394 ) ( ON ?auto_64395 ?auto_64394 ) ( not ( = ?auto_64394 ?auto_64395 ) ) ( not ( = ?auto_64394 ?auto_64396 ) ) ( not ( = ?auto_64394 ?auto_64397 ) ) ( not ( = ?auto_64394 ?auto_64398 ) ) ( not ( = ?auto_64394 ?auto_64399 ) ) ( not ( = ?auto_64394 ?auto_64400 ) ) ( not ( = ?auto_64394 ?auto_64401 ) ) ( not ( = ?auto_64394 ?auto_64402 ) ) ( not ( = ?auto_64395 ?auto_64396 ) ) ( not ( = ?auto_64395 ?auto_64397 ) ) ( not ( = ?auto_64395 ?auto_64398 ) ) ( not ( = ?auto_64395 ?auto_64399 ) ) ( not ( = ?auto_64395 ?auto_64400 ) ) ( not ( = ?auto_64395 ?auto_64401 ) ) ( not ( = ?auto_64395 ?auto_64402 ) ) ( not ( = ?auto_64396 ?auto_64397 ) ) ( not ( = ?auto_64396 ?auto_64398 ) ) ( not ( = ?auto_64396 ?auto_64399 ) ) ( not ( = ?auto_64396 ?auto_64400 ) ) ( not ( = ?auto_64396 ?auto_64401 ) ) ( not ( = ?auto_64396 ?auto_64402 ) ) ( not ( = ?auto_64397 ?auto_64398 ) ) ( not ( = ?auto_64397 ?auto_64399 ) ) ( not ( = ?auto_64397 ?auto_64400 ) ) ( not ( = ?auto_64397 ?auto_64401 ) ) ( not ( = ?auto_64397 ?auto_64402 ) ) ( not ( = ?auto_64398 ?auto_64399 ) ) ( not ( = ?auto_64398 ?auto_64400 ) ) ( not ( = ?auto_64398 ?auto_64401 ) ) ( not ( = ?auto_64398 ?auto_64402 ) ) ( not ( = ?auto_64399 ?auto_64400 ) ) ( not ( = ?auto_64399 ?auto_64401 ) ) ( not ( = ?auto_64399 ?auto_64402 ) ) ( not ( = ?auto_64400 ?auto_64401 ) ) ( not ( = ?auto_64400 ?auto_64402 ) ) ( not ( = ?auto_64401 ?auto_64402 ) ) ( ON ?auto_64400 ?auto_64401 ) ( ON ?auto_64399 ?auto_64400 ) ( ON ?auto_64398 ?auto_64399 ) ( ON ?auto_64397 ?auto_64398 ) ( CLEAR ?auto_64395 ) ( ON ?auto_64396 ?auto_64397 ) ( CLEAR ?auto_64396 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_64394 ?auto_64395 ?auto_64396 )
      ( MAKE-8PILE ?auto_64394 ?auto_64395 ?auto_64396 ?auto_64397 ?auto_64398 ?auto_64399 ?auto_64400 ?auto_64401 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_64428 - BLOCK
      ?auto_64429 - BLOCK
      ?auto_64430 - BLOCK
      ?auto_64431 - BLOCK
      ?auto_64432 - BLOCK
      ?auto_64433 - BLOCK
      ?auto_64434 - BLOCK
      ?auto_64435 - BLOCK
    )
    :vars
    (
      ?auto_64436 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64435 ?auto_64436 ) ( ON-TABLE ?auto_64428 ) ( not ( = ?auto_64428 ?auto_64429 ) ) ( not ( = ?auto_64428 ?auto_64430 ) ) ( not ( = ?auto_64428 ?auto_64431 ) ) ( not ( = ?auto_64428 ?auto_64432 ) ) ( not ( = ?auto_64428 ?auto_64433 ) ) ( not ( = ?auto_64428 ?auto_64434 ) ) ( not ( = ?auto_64428 ?auto_64435 ) ) ( not ( = ?auto_64428 ?auto_64436 ) ) ( not ( = ?auto_64429 ?auto_64430 ) ) ( not ( = ?auto_64429 ?auto_64431 ) ) ( not ( = ?auto_64429 ?auto_64432 ) ) ( not ( = ?auto_64429 ?auto_64433 ) ) ( not ( = ?auto_64429 ?auto_64434 ) ) ( not ( = ?auto_64429 ?auto_64435 ) ) ( not ( = ?auto_64429 ?auto_64436 ) ) ( not ( = ?auto_64430 ?auto_64431 ) ) ( not ( = ?auto_64430 ?auto_64432 ) ) ( not ( = ?auto_64430 ?auto_64433 ) ) ( not ( = ?auto_64430 ?auto_64434 ) ) ( not ( = ?auto_64430 ?auto_64435 ) ) ( not ( = ?auto_64430 ?auto_64436 ) ) ( not ( = ?auto_64431 ?auto_64432 ) ) ( not ( = ?auto_64431 ?auto_64433 ) ) ( not ( = ?auto_64431 ?auto_64434 ) ) ( not ( = ?auto_64431 ?auto_64435 ) ) ( not ( = ?auto_64431 ?auto_64436 ) ) ( not ( = ?auto_64432 ?auto_64433 ) ) ( not ( = ?auto_64432 ?auto_64434 ) ) ( not ( = ?auto_64432 ?auto_64435 ) ) ( not ( = ?auto_64432 ?auto_64436 ) ) ( not ( = ?auto_64433 ?auto_64434 ) ) ( not ( = ?auto_64433 ?auto_64435 ) ) ( not ( = ?auto_64433 ?auto_64436 ) ) ( not ( = ?auto_64434 ?auto_64435 ) ) ( not ( = ?auto_64434 ?auto_64436 ) ) ( not ( = ?auto_64435 ?auto_64436 ) ) ( ON ?auto_64434 ?auto_64435 ) ( ON ?auto_64433 ?auto_64434 ) ( ON ?auto_64432 ?auto_64433 ) ( ON ?auto_64431 ?auto_64432 ) ( ON ?auto_64430 ?auto_64431 ) ( CLEAR ?auto_64428 ) ( ON ?auto_64429 ?auto_64430 ) ( CLEAR ?auto_64429 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_64428 ?auto_64429 )
      ( MAKE-8PILE ?auto_64428 ?auto_64429 ?auto_64430 ?auto_64431 ?auto_64432 ?auto_64433 ?auto_64434 ?auto_64435 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_64462 - BLOCK
      ?auto_64463 - BLOCK
      ?auto_64464 - BLOCK
      ?auto_64465 - BLOCK
      ?auto_64466 - BLOCK
      ?auto_64467 - BLOCK
      ?auto_64468 - BLOCK
      ?auto_64469 - BLOCK
    )
    :vars
    (
      ?auto_64470 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64469 ?auto_64470 ) ( not ( = ?auto_64462 ?auto_64463 ) ) ( not ( = ?auto_64462 ?auto_64464 ) ) ( not ( = ?auto_64462 ?auto_64465 ) ) ( not ( = ?auto_64462 ?auto_64466 ) ) ( not ( = ?auto_64462 ?auto_64467 ) ) ( not ( = ?auto_64462 ?auto_64468 ) ) ( not ( = ?auto_64462 ?auto_64469 ) ) ( not ( = ?auto_64462 ?auto_64470 ) ) ( not ( = ?auto_64463 ?auto_64464 ) ) ( not ( = ?auto_64463 ?auto_64465 ) ) ( not ( = ?auto_64463 ?auto_64466 ) ) ( not ( = ?auto_64463 ?auto_64467 ) ) ( not ( = ?auto_64463 ?auto_64468 ) ) ( not ( = ?auto_64463 ?auto_64469 ) ) ( not ( = ?auto_64463 ?auto_64470 ) ) ( not ( = ?auto_64464 ?auto_64465 ) ) ( not ( = ?auto_64464 ?auto_64466 ) ) ( not ( = ?auto_64464 ?auto_64467 ) ) ( not ( = ?auto_64464 ?auto_64468 ) ) ( not ( = ?auto_64464 ?auto_64469 ) ) ( not ( = ?auto_64464 ?auto_64470 ) ) ( not ( = ?auto_64465 ?auto_64466 ) ) ( not ( = ?auto_64465 ?auto_64467 ) ) ( not ( = ?auto_64465 ?auto_64468 ) ) ( not ( = ?auto_64465 ?auto_64469 ) ) ( not ( = ?auto_64465 ?auto_64470 ) ) ( not ( = ?auto_64466 ?auto_64467 ) ) ( not ( = ?auto_64466 ?auto_64468 ) ) ( not ( = ?auto_64466 ?auto_64469 ) ) ( not ( = ?auto_64466 ?auto_64470 ) ) ( not ( = ?auto_64467 ?auto_64468 ) ) ( not ( = ?auto_64467 ?auto_64469 ) ) ( not ( = ?auto_64467 ?auto_64470 ) ) ( not ( = ?auto_64468 ?auto_64469 ) ) ( not ( = ?auto_64468 ?auto_64470 ) ) ( not ( = ?auto_64469 ?auto_64470 ) ) ( ON ?auto_64468 ?auto_64469 ) ( ON ?auto_64467 ?auto_64468 ) ( ON ?auto_64466 ?auto_64467 ) ( ON ?auto_64465 ?auto_64466 ) ( ON ?auto_64464 ?auto_64465 ) ( ON ?auto_64463 ?auto_64464 ) ( ON ?auto_64462 ?auto_64463 ) ( CLEAR ?auto_64462 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_64462 )
      ( MAKE-8PILE ?auto_64462 ?auto_64463 ?auto_64464 ?auto_64465 ?auto_64466 ?auto_64467 ?auto_64468 ?auto_64469 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_64497 - BLOCK
      ?auto_64498 - BLOCK
      ?auto_64499 - BLOCK
      ?auto_64500 - BLOCK
      ?auto_64501 - BLOCK
      ?auto_64502 - BLOCK
      ?auto_64503 - BLOCK
      ?auto_64504 - BLOCK
      ?auto_64505 - BLOCK
    )
    :vars
    (
      ?auto_64506 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_64504 ) ( ON ?auto_64505 ?auto_64506 ) ( CLEAR ?auto_64505 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_64497 ) ( ON ?auto_64498 ?auto_64497 ) ( ON ?auto_64499 ?auto_64498 ) ( ON ?auto_64500 ?auto_64499 ) ( ON ?auto_64501 ?auto_64500 ) ( ON ?auto_64502 ?auto_64501 ) ( ON ?auto_64503 ?auto_64502 ) ( ON ?auto_64504 ?auto_64503 ) ( not ( = ?auto_64497 ?auto_64498 ) ) ( not ( = ?auto_64497 ?auto_64499 ) ) ( not ( = ?auto_64497 ?auto_64500 ) ) ( not ( = ?auto_64497 ?auto_64501 ) ) ( not ( = ?auto_64497 ?auto_64502 ) ) ( not ( = ?auto_64497 ?auto_64503 ) ) ( not ( = ?auto_64497 ?auto_64504 ) ) ( not ( = ?auto_64497 ?auto_64505 ) ) ( not ( = ?auto_64497 ?auto_64506 ) ) ( not ( = ?auto_64498 ?auto_64499 ) ) ( not ( = ?auto_64498 ?auto_64500 ) ) ( not ( = ?auto_64498 ?auto_64501 ) ) ( not ( = ?auto_64498 ?auto_64502 ) ) ( not ( = ?auto_64498 ?auto_64503 ) ) ( not ( = ?auto_64498 ?auto_64504 ) ) ( not ( = ?auto_64498 ?auto_64505 ) ) ( not ( = ?auto_64498 ?auto_64506 ) ) ( not ( = ?auto_64499 ?auto_64500 ) ) ( not ( = ?auto_64499 ?auto_64501 ) ) ( not ( = ?auto_64499 ?auto_64502 ) ) ( not ( = ?auto_64499 ?auto_64503 ) ) ( not ( = ?auto_64499 ?auto_64504 ) ) ( not ( = ?auto_64499 ?auto_64505 ) ) ( not ( = ?auto_64499 ?auto_64506 ) ) ( not ( = ?auto_64500 ?auto_64501 ) ) ( not ( = ?auto_64500 ?auto_64502 ) ) ( not ( = ?auto_64500 ?auto_64503 ) ) ( not ( = ?auto_64500 ?auto_64504 ) ) ( not ( = ?auto_64500 ?auto_64505 ) ) ( not ( = ?auto_64500 ?auto_64506 ) ) ( not ( = ?auto_64501 ?auto_64502 ) ) ( not ( = ?auto_64501 ?auto_64503 ) ) ( not ( = ?auto_64501 ?auto_64504 ) ) ( not ( = ?auto_64501 ?auto_64505 ) ) ( not ( = ?auto_64501 ?auto_64506 ) ) ( not ( = ?auto_64502 ?auto_64503 ) ) ( not ( = ?auto_64502 ?auto_64504 ) ) ( not ( = ?auto_64502 ?auto_64505 ) ) ( not ( = ?auto_64502 ?auto_64506 ) ) ( not ( = ?auto_64503 ?auto_64504 ) ) ( not ( = ?auto_64503 ?auto_64505 ) ) ( not ( = ?auto_64503 ?auto_64506 ) ) ( not ( = ?auto_64504 ?auto_64505 ) ) ( not ( = ?auto_64504 ?auto_64506 ) ) ( not ( = ?auto_64505 ?auto_64506 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_64505 ?auto_64506 )
      ( !STACK ?auto_64505 ?auto_64504 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_64516 - BLOCK
      ?auto_64517 - BLOCK
      ?auto_64518 - BLOCK
      ?auto_64519 - BLOCK
      ?auto_64520 - BLOCK
      ?auto_64521 - BLOCK
      ?auto_64522 - BLOCK
      ?auto_64523 - BLOCK
      ?auto_64524 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_64523 ) ( ON-TABLE ?auto_64524 ) ( CLEAR ?auto_64524 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_64516 ) ( ON ?auto_64517 ?auto_64516 ) ( ON ?auto_64518 ?auto_64517 ) ( ON ?auto_64519 ?auto_64518 ) ( ON ?auto_64520 ?auto_64519 ) ( ON ?auto_64521 ?auto_64520 ) ( ON ?auto_64522 ?auto_64521 ) ( ON ?auto_64523 ?auto_64522 ) ( not ( = ?auto_64516 ?auto_64517 ) ) ( not ( = ?auto_64516 ?auto_64518 ) ) ( not ( = ?auto_64516 ?auto_64519 ) ) ( not ( = ?auto_64516 ?auto_64520 ) ) ( not ( = ?auto_64516 ?auto_64521 ) ) ( not ( = ?auto_64516 ?auto_64522 ) ) ( not ( = ?auto_64516 ?auto_64523 ) ) ( not ( = ?auto_64516 ?auto_64524 ) ) ( not ( = ?auto_64517 ?auto_64518 ) ) ( not ( = ?auto_64517 ?auto_64519 ) ) ( not ( = ?auto_64517 ?auto_64520 ) ) ( not ( = ?auto_64517 ?auto_64521 ) ) ( not ( = ?auto_64517 ?auto_64522 ) ) ( not ( = ?auto_64517 ?auto_64523 ) ) ( not ( = ?auto_64517 ?auto_64524 ) ) ( not ( = ?auto_64518 ?auto_64519 ) ) ( not ( = ?auto_64518 ?auto_64520 ) ) ( not ( = ?auto_64518 ?auto_64521 ) ) ( not ( = ?auto_64518 ?auto_64522 ) ) ( not ( = ?auto_64518 ?auto_64523 ) ) ( not ( = ?auto_64518 ?auto_64524 ) ) ( not ( = ?auto_64519 ?auto_64520 ) ) ( not ( = ?auto_64519 ?auto_64521 ) ) ( not ( = ?auto_64519 ?auto_64522 ) ) ( not ( = ?auto_64519 ?auto_64523 ) ) ( not ( = ?auto_64519 ?auto_64524 ) ) ( not ( = ?auto_64520 ?auto_64521 ) ) ( not ( = ?auto_64520 ?auto_64522 ) ) ( not ( = ?auto_64520 ?auto_64523 ) ) ( not ( = ?auto_64520 ?auto_64524 ) ) ( not ( = ?auto_64521 ?auto_64522 ) ) ( not ( = ?auto_64521 ?auto_64523 ) ) ( not ( = ?auto_64521 ?auto_64524 ) ) ( not ( = ?auto_64522 ?auto_64523 ) ) ( not ( = ?auto_64522 ?auto_64524 ) ) ( not ( = ?auto_64523 ?auto_64524 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_64524 )
      ( !STACK ?auto_64524 ?auto_64523 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_64534 - BLOCK
      ?auto_64535 - BLOCK
      ?auto_64536 - BLOCK
      ?auto_64537 - BLOCK
      ?auto_64538 - BLOCK
      ?auto_64539 - BLOCK
      ?auto_64540 - BLOCK
      ?auto_64541 - BLOCK
      ?auto_64542 - BLOCK
    )
    :vars
    (
      ?auto_64543 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64542 ?auto_64543 ) ( ON-TABLE ?auto_64534 ) ( ON ?auto_64535 ?auto_64534 ) ( ON ?auto_64536 ?auto_64535 ) ( ON ?auto_64537 ?auto_64536 ) ( ON ?auto_64538 ?auto_64537 ) ( ON ?auto_64539 ?auto_64538 ) ( ON ?auto_64540 ?auto_64539 ) ( not ( = ?auto_64534 ?auto_64535 ) ) ( not ( = ?auto_64534 ?auto_64536 ) ) ( not ( = ?auto_64534 ?auto_64537 ) ) ( not ( = ?auto_64534 ?auto_64538 ) ) ( not ( = ?auto_64534 ?auto_64539 ) ) ( not ( = ?auto_64534 ?auto_64540 ) ) ( not ( = ?auto_64534 ?auto_64541 ) ) ( not ( = ?auto_64534 ?auto_64542 ) ) ( not ( = ?auto_64534 ?auto_64543 ) ) ( not ( = ?auto_64535 ?auto_64536 ) ) ( not ( = ?auto_64535 ?auto_64537 ) ) ( not ( = ?auto_64535 ?auto_64538 ) ) ( not ( = ?auto_64535 ?auto_64539 ) ) ( not ( = ?auto_64535 ?auto_64540 ) ) ( not ( = ?auto_64535 ?auto_64541 ) ) ( not ( = ?auto_64535 ?auto_64542 ) ) ( not ( = ?auto_64535 ?auto_64543 ) ) ( not ( = ?auto_64536 ?auto_64537 ) ) ( not ( = ?auto_64536 ?auto_64538 ) ) ( not ( = ?auto_64536 ?auto_64539 ) ) ( not ( = ?auto_64536 ?auto_64540 ) ) ( not ( = ?auto_64536 ?auto_64541 ) ) ( not ( = ?auto_64536 ?auto_64542 ) ) ( not ( = ?auto_64536 ?auto_64543 ) ) ( not ( = ?auto_64537 ?auto_64538 ) ) ( not ( = ?auto_64537 ?auto_64539 ) ) ( not ( = ?auto_64537 ?auto_64540 ) ) ( not ( = ?auto_64537 ?auto_64541 ) ) ( not ( = ?auto_64537 ?auto_64542 ) ) ( not ( = ?auto_64537 ?auto_64543 ) ) ( not ( = ?auto_64538 ?auto_64539 ) ) ( not ( = ?auto_64538 ?auto_64540 ) ) ( not ( = ?auto_64538 ?auto_64541 ) ) ( not ( = ?auto_64538 ?auto_64542 ) ) ( not ( = ?auto_64538 ?auto_64543 ) ) ( not ( = ?auto_64539 ?auto_64540 ) ) ( not ( = ?auto_64539 ?auto_64541 ) ) ( not ( = ?auto_64539 ?auto_64542 ) ) ( not ( = ?auto_64539 ?auto_64543 ) ) ( not ( = ?auto_64540 ?auto_64541 ) ) ( not ( = ?auto_64540 ?auto_64542 ) ) ( not ( = ?auto_64540 ?auto_64543 ) ) ( not ( = ?auto_64541 ?auto_64542 ) ) ( not ( = ?auto_64541 ?auto_64543 ) ) ( not ( = ?auto_64542 ?auto_64543 ) ) ( CLEAR ?auto_64540 ) ( ON ?auto_64541 ?auto_64542 ) ( CLEAR ?auto_64541 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_64534 ?auto_64535 ?auto_64536 ?auto_64537 ?auto_64538 ?auto_64539 ?auto_64540 ?auto_64541 )
      ( MAKE-9PILE ?auto_64534 ?auto_64535 ?auto_64536 ?auto_64537 ?auto_64538 ?auto_64539 ?auto_64540 ?auto_64541 ?auto_64542 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_64553 - BLOCK
      ?auto_64554 - BLOCK
      ?auto_64555 - BLOCK
      ?auto_64556 - BLOCK
      ?auto_64557 - BLOCK
      ?auto_64558 - BLOCK
      ?auto_64559 - BLOCK
      ?auto_64560 - BLOCK
      ?auto_64561 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_64561 ) ( ON-TABLE ?auto_64553 ) ( ON ?auto_64554 ?auto_64553 ) ( ON ?auto_64555 ?auto_64554 ) ( ON ?auto_64556 ?auto_64555 ) ( ON ?auto_64557 ?auto_64556 ) ( ON ?auto_64558 ?auto_64557 ) ( ON ?auto_64559 ?auto_64558 ) ( not ( = ?auto_64553 ?auto_64554 ) ) ( not ( = ?auto_64553 ?auto_64555 ) ) ( not ( = ?auto_64553 ?auto_64556 ) ) ( not ( = ?auto_64553 ?auto_64557 ) ) ( not ( = ?auto_64553 ?auto_64558 ) ) ( not ( = ?auto_64553 ?auto_64559 ) ) ( not ( = ?auto_64553 ?auto_64560 ) ) ( not ( = ?auto_64553 ?auto_64561 ) ) ( not ( = ?auto_64554 ?auto_64555 ) ) ( not ( = ?auto_64554 ?auto_64556 ) ) ( not ( = ?auto_64554 ?auto_64557 ) ) ( not ( = ?auto_64554 ?auto_64558 ) ) ( not ( = ?auto_64554 ?auto_64559 ) ) ( not ( = ?auto_64554 ?auto_64560 ) ) ( not ( = ?auto_64554 ?auto_64561 ) ) ( not ( = ?auto_64555 ?auto_64556 ) ) ( not ( = ?auto_64555 ?auto_64557 ) ) ( not ( = ?auto_64555 ?auto_64558 ) ) ( not ( = ?auto_64555 ?auto_64559 ) ) ( not ( = ?auto_64555 ?auto_64560 ) ) ( not ( = ?auto_64555 ?auto_64561 ) ) ( not ( = ?auto_64556 ?auto_64557 ) ) ( not ( = ?auto_64556 ?auto_64558 ) ) ( not ( = ?auto_64556 ?auto_64559 ) ) ( not ( = ?auto_64556 ?auto_64560 ) ) ( not ( = ?auto_64556 ?auto_64561 ) ) ( not ( = ?auto_64557 ?auto_64558 ) ) ( not ( = ?auto_64557 ?auto_64559 ) ) ( not ( = ?auto_64557 ?auto_64560 ) ) ( not ( = ?auto_64557 ?auto_64561 ) ) ( not ( = ?auto_64558 ?auto_64559 ) ) ( not ( = ?auto_64558 ?auto_64560 ) ) ( not ( = ?auto_64558 ?auto_64561 ) ) ( not ( = ?auto_64559 ?auto_64560 ) ) ( not ( = ?auto_64559 ?auto_64561 ) ) ( not ( = ?auto_64560 ?auto_64561 ) ) ( CLEAR ?auto_64559 ) ( ON ?auto_64560 ?auto_64561 ) ( CLEAR ?auto_64560 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_64553 ?auto_64554 ?auto_64555 ?auto_64556 ?auto_64557 ?auto_64558 ?auto_64559 ?auto_64560 )
      ( MAKE-9PILE ?auto_64553 ?auto_64554 ?auto_64555 ?auto_64556 ?auto_64557 ?auto_64558 ?auto_64559 ?auto_64560 ?auto_64561 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_64571 - BLOCK
      ?auto_64572 - BLOCK
      ?auto_64573 - BLOCK
      ?auto_64574 - BLOCK
      ?auto_64575 - BLOCK
      ?auto_64576 - BLOCK
      ?auto_64577 - BLOCK
      ?auto_64578 - BLOCK
      ?auto_64579 - BLOCK
    )
    :vars
    (
      ?auto_64580 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64579 ?auto_64580 ) ( ON-TABLE ?auto_64571 ) ( ON ?auto_64572 ?auto_64571 ) ( ON ?auto_64573 ?auto_64572 ) ( ON ?auto_64574 ?auto_64573 ) ( ON ?auto_64575 ?auto_64574 ) ( ON ?auto_64576 ?auto_64575 ) ( not ( = ?auto_64571 ?auto_64572 ) ) ( not ( = ?auto_64571 ?auto_64573 ) ) ( not ( = ?auto_64571 ?auto_64574 ) ) ( not ( = ?auto_64571 ?auto_64575 ) ) ( not ( = ?auto_64571 ?auto_64576 ) ) ( not ( = ?auto_64571 ?auto_64577 ) ) ( not ( = ?auto_64571 ?auto_64578 ) ) ( not ( = ?auto_64571 ?auto_64579 ) ) ( not ( = ?auto_64571 ?auto_64580 ) ) ( not ( = ?auto_64572 ?auto_64573 ) ) ( not ( = ?auto_64572 ?auto_64574 ) ) ( not ( = ?auto_64572 ?auto_64575 ) ) ( not ( = ?auto_64572 ?auto_64576 ) ) ( not ( = ?auto_64572 ?auto_64577 ) ) ( not ( = ?auto_64572 ?auto_64578 ) ) ( not ( = ?auto_64572 ?auto_64579 ) ) ( not ( = ?auto_64572 ?auto_64580 ) ) ( not ( = ?auto_64573 ?auto_64574 ) ) ( not ( = ?auto_64573 ?auto_64575 ) ) ( not ( = ?auto_64573 ?auto_64576 ) ) ( not ( = ?auto_64573 ?auto_64577 ) ) ( not ( = ?auto_64573 ?auto_64578 ) ) ( not ( = ?auto_64573 ?auto_64579 ) ) ( not ( = ?auto_64573 ?auto_64580 ) ) ( not ( = ?auto_64574 ?auto_64575 ) ) ( not ( = ?auto_64574 ?auto_64576 ) ) ( not ( = ?auto_64574 ?auto_64577 ) ) ( not ( = ?auto_64574 ?auto_64578 ) ) ( not ( = ?auto_64574 ?auto_64579 ) ) ( not ( = ?auto_64574 ?auto_64580 ) ) ( not ( = ?auto_64575 ?auto_64576 ) ) ( not ( = ?auto_64575 ?auto_64577 ) ) ( not ( = ?auto_64575 ?auto_64578 ) ) ( not ( = ?auto_64575 ?auto_64579 ) ) ( not ( = ?auto_64575 ?auto_64580 ) ) ( not ( = ?auto_64576 ?auto_64577 ) ) ( not ( = ?auto_64576 ?auto_64578 ) ) ( not ( = ?auto_64576 ?auto_64579 ) ) ( not ( = ?auto_64576 ?auto_64580 ) ) ( not ( = ?auto_64577 ?auto_64578 ) ) ( not ( = ?auto_64577 ?auto_64579 ) ) ( not ( = ?auto_64577 ?auto_64580 ) ) ( not ( = ?auto_64578 ?auto_64579 ) ) ( not ( = ?auto_64578 ?auto_64580 ) ) ( not ( = ?auto_64579 ?auto_64580 ) ) ( ON ?auto_64578 ?auto_64579 ) ( CLEAR ?auto_64576 ) ( ON ?auto_64577 ?auto_64578 ) ( CLEAR ?auto_64577 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_64571 ?auto_64572 ?auto_64573 ?auto_64574 ?auto_64575 ?auto_64576 ?auto_64577 )
      ( MAKE-9PILE ?auto_64571 ?auto_64572 ?auto_64573 ?auto_64574 ?auto_64575 ?auto_64576 ?auto_64577 ?auto_64578 ?auto_64579 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_64590 - BLOCK
      ?auto_64591 - BLOCK
      ?auto_64592 - BLOCK
      ?auto_64593 - BLOCK
      ?auto_64594 - BLOCK
      ?auto_64595 - BLOCK
      ?auto_64596 - BLOCK
      ?auto_64597 - BLOCK
      ?auto_64598 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_64598 ) ( ON-TABLE ?auto_64590 ) ( ON ?auto_64591 ?auto_64590 ) ( ON ?auto_64592 ?auto_64591 ) ( ON ?auto_64593 ?auto_64592 ) ( ON ?auto_64594 ?auto_64593 ) ( ON ?auto_64595 ?auto_64594 ) ( not ( = ?auto_64590 ?auto_64591 ) ) ( not ( = ?auto_64590 ?auto_64592 ) ) ( not ( = ?auto_64590 ?auto_64593 ) ) ( not ( = ?auto_64590 ?auto_64594 ) ) ( not ( = ?auto_64590 ?auto_64595 ) ) ( not ( = ?auto_64590 ?auto_64596 ) ) ( not ( = ?auto_64590 ?auto_64597 ) ) ( not ( = ?auto_64590 ?auto_64598 ) ) ( not ( = ?auto_64591 ?auto_64592 ) ) ( not ( = ?auto_64591 ?auto_64593 ) ) ( not ( = ?auto_64591 ?auto_64594 ) ) ( not ( = ?auto_64591 ?auto_64595 ) ) ( not ( = ?auto_64591 ?auto_64596 ) ) ( not ( = ?auto_64591 ?auto_64597 ) ) ( not ( = ?auto_64591 ?auto_64598 ) ) ( not ( = ?auto_64592 ?auto_64593 ) ) ( not ( = ?auto_64592 ?auto_64594 ) ) ( not ( = ?auto_64592 ?auto_64595 ) ) ( not ( = ?auto_64592 ?auto_64596 ) ) ( not ( = ?auto_64592 ?auto_64597 ) ) ( not ( = ?auto_64592 ?auto_64598 ) ) ( not ( = ?auto_64593 ?auto_64594 ) ) ( not ( = ?auto_64593 ?auto_64595 ) ) ( not ( = ?auto_64593 ?auto_64596 ) ) ( not ( = ?auto_64593 ?auto_64597 ) ) ( not ( = ?auto_64593 ?auto_64598 ) ) ( not ( = ?auto_64594 ?auto_64595 ) ) ( not ( = ?auto_64594 ?auto_64596 ) ) ( not ( = ?auto_64594 ?auto_64597 ) ) ( not ( = ?auto_64594 ?auto_64598 ) ) ( not ( = ?auto_64595 ?auto_64596 ) ) ( not ( = ?auto_64595 ?auto_64597 ) ) ( not ( = ?auto_64595 ?auto_64598 ) ) ( not ( = ?auto_64596 ?auto_64597 ) ) ( not ( = ?auto_64596 ?auto_64598 ) ) ( not ( = ?auto_64597 ?auto_64598 ) ) ( ON ?auto_64597 ?auto_64598 ) ( CLEAR ?auto_64595 ) ( ON ?auto_64596 ?auto_64597 ) ( CLEAR ?auto_64596 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_64590 ?auto_64591 ?auto_64592 ?auto_64593 ?auto_64594 ?auto_64595 ?auto_64596 )
      ( MAKE-9PILE ?auto_64590 ?auto_64591 ?auto_64592 ?auto_64593 ?auto_64594 ?auto_64595 ?auto_64596 ?auto_64597 ?auto_64598 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_64608 - BLOCK
      ?auto_64609 - BLOCK
      ?auto_64610 - BLOCK
      ?auto_64611 - BLOCK
      ?auto_64612 - BLOCK
      ?auto_64613 - BLOCK
      ?auto_64614 - BLOCK
      ?auto_64615 - BLOCK
      ?auto_64616 - BLOCK
    )
    :vars
    (
      ?auto_64617 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64616 ?auto_64617 ) ( ON-TABLE ?auto_64608 ) ( ON ?auto_64609 ?auto_64608 ) ( ON ?auto_64610 ?auto_64609 ) ( ON ?auto_64611 ?auto_64610 ) ( ON ?auto_64612 ?auto_64611 ) ( not ( = ?auto_64608 ?auto_64609 ) ) ( not ( = ?auto_64608 ?auto_64610 ) ) ( not ( = ?auto_64608 ?auto_64611 ) ) ( not ( = ?auto_64608 ?auto_64612 ) ) ( not ( = ?auto_64608 ?auto_64613 ) ) ( not ( = ?auto_64608 ?auto_64614 ) ) ( not ( = ?auto_64608 ?auto_64615 ) ) ( not ( = ?auto_64608 ?auto_64616 ) ) ( not ( = ?auto_64608 ?auto_64617 ) ) ( not ( = ?auto_64609 ?auto_64610 ) ) ( not ( = ?auto_64609 ?auto_64611 ) ) ( not ( = ?auto_64609 ?auto_64612 ) ) ( not ( = ?auto_64609 ?auto_64613 ) ) ( not ( = ?auto_64609 ?auto_64614 ) ) ( not ( = ?auto_64609 ?auto_64615 ) ) ( not ( = ?auto_64609 ?auto_64616 ) ) ( not ( = ?auto_64609 ?auto_64617 ) ) ( not ( = ?auto_64610 ?auto_64611 ) ) ( not ( = ?auto_64610 ?auto_64612 ) ) ( not ( = ?auto_64610 ?auto_64613 ) ) ( not ( = ?auto_64610 ?auto_64614 ) ) ( not ( = ?auto_64610 ?auto_64615 ) ) ( not ( = ?auto_64610 ?auto_64616 ) ) ( not ( = ?auto_64610 ?auto_64617 ) ) ( not ( = ?auto_64611 ?auto_64612 ) ) ( not ( = ?auto_64611 ?auto_64613 ) ) ( not ( = ?auto_64611 ?auto_64614 ) ) ( not ( = ?auto_64611 ?auto_64615 ) ) ( not ( = ?auto_64611 ?auto_64616 ) ) ( not ( = ?auto_64611 ?auto_64617 ) ) ( not ( = ?auto_64612 ?auto_64613 ) ) ( not ( = ?auto_64612 ?auto_64614 ) ) ( not ( = ?auto_64612 ?auto_64615 ) ) ( not ( = ?auto_64612 ?auto_64616 ) ) ( not ( = ?auto_64612 ?auto_64617 ) ) ( not ( = ?auto_64613 ?auto_64614 ) ) ( not ( = ?auto_64613 ?auto_64615 ) ) ( not ( = ?auto_64613 ?auto_64616 ) ) ( not ( = ?auto_64613 ?auto_64617 ) ) ( not ( = ?auto_64614 ?auto_64615 ) ) ( not ( = ?auto_64614 ?auto_64616 ) ) ( not ( = ?auto_64614 ?auto_64617 ) ) ( not ( = ?auto_64615 ?auto_64616 ) ) ( not ( = ?auto_64615 ?auto_64617 ) ) ( not ( = ?auto_64616 ?auto_64617 ) ) ( ON ?auto_64615 ?auto_64616 ) ( ON ?auto_64614 ?auto_64615 ) ( CLEAR ?auto_64612 ) ( ON ?auto_64613 ?auto_64614 ) ( CLEAR ?auto_64613 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_64608 ?auto_64609 ?auto_64610 ?auto_64611 ?auto_64612 ?auto_64613 )
      ( MAKE-9PILE ?auto_64608 ?auto_64609 ?auto_64610 ?auto_64611 ?auto_64612 ?auto_64613 ?auto_64614 ?auto_64615 ?auto_64616 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_64627 - BLOCK
      ?auto_64628 - BLOCK
      ?auto_64629 - BLOCK
      ?auto_64630 - BLOCK
      ?auto_64631 - BLOCK
      ?auto_64632 - BLOCK
      ?auto_64633 - BLOCK
      ?auto_64634 - BLOCK
      ?auto_64635 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_64635 ) ( ON-TABLE ?auto_64627 ) ( ON ?auto_64628 ?auto_64627 ) ( ON ?auto_64629 ?auto_64628 ) ( ON ?auto_64630 ?auto_64629 ) ( ON ?auto_64631 ?auto_64630 ) ( not ( = ?auto_64627 ?auto_64628 ) ) ( not ( = ?auto_64627 ?auto_64629 ) ) ( not ( = ?auto_64627 ?auto_64630 ) ) ( not ( = ?auto_64627 ?auto_64631 ) ) ( not ( = ?auto_64627 ?auto_64632 ) ) ( not ( = ?auto_64627 ?auto_64633 ) ) ( not ( = ?auto_64627 ?auto_64634 ) ) ( not ( = ?auto_64627 ?auto_64635 ) ) ( not ( = ?auto_64628 ?auto_64629 ) ) ( not ( = ?auto_64628 ?auto_64630 ) ) ( not ( = ?auto_64628 ?auto_64631 ) ) ( not ( = ?auto_64628 ?auto_64632 ) ) ( not ( = ?auto_64628 ?auto_64633 ) ) ( not ( = ?auto_64628 ?auto_64634 ) ) ( not ( = ?auto_64628 ?auto_64635 ) ) ( not ( = ?auto_64629 ?auto_64630 ) ) ( not ( = ?auto_64629 ?auto_64631 ) ) ( not ( = ?auto_64629 ?auto_64632 ) ) ( not ( = ?auto_64629 ?auto_64633 ) ) ( not ( = ?auto_64629 ?auto_64634 ) ) ( not ( = ?auto_64629 ?auto_64635 ) ) ( not ( = ?auto_64630 ?auto_64631 ) ) ( not ( = ?auto_64630 ?auto_64632 ) ) ( not ( = ?auto_64630 ?auto_64633 ) ) ( not ( = ?auto_64630 ?auto_64634 ) ) ( not ( = ?auto_64630 ?auto_64635 ) ) ( not ( = ?auto_64631 ?auto_64632 ) ) ( not ( = ?auto_64631 ?auto_64633 ) ) ( not ( = ?auto_64631 ?auto_64634 ) ) ( not ( = ?auto_64631 ?auto_64635 ) ) ( not ( = ?auto_64632 ?auto_64633 ) ) ( not ( = ?auto_64632 ?auto_64634 ) ) ( not ( = ?auto_64632 ?auto_64635 ) ) ( not ( = ?auto_64633 ?auto_64634 ) ) ( not ( = ?auto_64633 ?auto_64635 ) ) ( not ( = ?auto_64634 ?auto_64635 ) ) ( ON ?auto_64634 ?auto_64635 ) ( ON ?auto_64633 ?auto_64634 ) ( CLEAR ?auto_64631 ) ( ON ?auto_64632 ?auto_64633 ) ( CLEAR ?auto_64632 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_64627 ?auto_64628 ?auto_64629 ?auto_64630 ?auto_64631 ?auto_64632 )
      ( MAKE-9PILE ?auto_64627 ?auto_64628 ?auto_64629 ?auto_64630 ?auto_64631 ?auto_64632 ?auto_64633 ?auto_64634 ?auto_64635 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_64645 - BLOCK
      ?auto_64646 - BLOCK
      ?auto_64647 - BLOCK
      ?auto_64648 - BLOCK
      ?auto_64649 - BLOCK
      ?auto_64650 - BLOCK
      ?auto_64651 - BLOCK
      ?auto_64652 - BLOCK
      ?auto_64653 - BLOCK
    )
    :vars
    (
      ?auto_64654 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64653 ?auto_64654 ) ( ON-TABLE ?auto_64645 ) ( ON ?auto_64646 ?auto_64645 ) ( ON ?auto_64647 ?auto_64646 ) ( ON ?auto_64648 ?auto_64647 ) ( not ( = ?auto_64645 ?auto_64646 ) ) ( not ( = ?auto_64645 ?auto_64647 ) ) ( not ( = ?auto_64645 ?auto_64648 ) ) ( not ( = ?auto_64645 ?auto_64649 ) ) ( not ( = ?auto_64645 ?auto_64650 ) ) ( not ( = ?auto_64645 ?auto_64651 ) ) ( not ( = ?auto_64645 ?auto_64652 ) ) ( not ( = ?auto_64645 ?auto_64653 ) ) ( not ( = ?auto_64645 ?auto_64654 ) ) ( not ( = ?auto_64646 ?auto_64647 ) ) ( not ( = ?auto_64646 ?auto_64648 ) ) ( not ( = ?auto_64646 ?auto_64649 ) ) ( not ( = ?auto_64646 ?auto_64650 ) ) ( not ( = ?auto_64646 ?auto_64651 ) ) ( not ( = ?auto_64646 ?auto_64652 ) ) ( not ( = ?auto_64646 ?auto_64653 ) ) ( not ( = ?auto_64646 ?auto_64654 ) ) ( not ( = ?auto_64647 ?auto_64648 ) ) ( not ( = ?auto_64647 ?auto_64649 ) ) ( not ( = ?auto_64647 ?auto_64650 ) ) ( not ( = ?auto_64647 ?auto_64651 ) ) ( not ( = ?auto_64647 ?auto_64652 ) ) ( not ( = ?auto_64647 ?auto_64653 ) ) ( not ( = ?auto_64647 ?auto_64654 ) ) ( not ( = ?auto_64648 ?auto_64649 ) ) ( not ( = ?auto_64648 ?auto_64650 ) ) ( not ( = ?auto_64648 ?auto_64651 ) ) ( not ( = ?auto_64648 ?auto_64652 ) ) ( not ( = ?auto_64648 ?auto_64653 ) ) ( not ( = ?auto_64648 ?auto_64654 ) ) ( not ( = ?auto_64649 ?auto_64650 ) ) ( not ( = ?auto_64649 ?auto_64651 ) ) ( not ( = ?auto_64649 ?auto_64652 ) ) ( not ( = ?auto_64649 ?auto_64653 ) ) ( not ( = ?auto_64649 ?auto_64654 ) ) ( not ( = ?auto_64650 ?auto_64651 ) ) ( not ( = ?auto_64650 ?auto_64652 ) ) ( not ( = ?auto_64650 ?auto_64653 ) ) ( not ( = ?auto_64650 ?auto_64654 ) ) ( not ( = ?auto_64651 ?auto_64652 ) ) ( not ( = ?auto_64651 ?auto_64653 ) ) ( not ( = ?auto_64651 ?auto_64654 ) ) ( not ( = ?auto_64652 ?auto_64653 ) ) ( not ( = ?auto_64652 ?auto_64654 ) ) ( not ( = ?auto_64653 ?auto_64654 ) ) ( ON ?auto_64652 ?auto_64653 ) ( ON ?auto_64651 ?auto_64652 ) ( ON ?auto_64650 ?auto_64651 ) ( CLEAR ?auto_64648 ) ( ON ?auto_64649 ?auto_64650 ) ( CLEAR ?auto_64649 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_64645 ?auto_64646 ?auto_64647 ?auto_64648 ?auto_64649 )
      ( MAKE-9PILE ?auto_64645 ?auto_64646 ?auto_64647 ?auto_64648 ?auto_64649 ?auto_64650 ?auto_64651 ?auto_64652 ?auto_64653 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_64664 - BLOCK
      ?auto_64665 - BLOCK
      ?auto_64666 - BLOCK
      ?auto_64667 - BLOCK
      ?auto_64668 - BLOCK
      ?auto_64669 - BLOCK
      ?auto_64670 - BLOCK
      ?auto_64671 - BLOCK
      ?auto_64672 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_64672 ) ( ON-TABLE ?auto_64664 ) ( ON ?auto_64665 ?auto_64664 ) ( ON ?auto_64666 ?auto_64665 ) ( ON ?auto_64667 ?auto_64666 ) ( not ( = ?auto_64664 ?auto_64665 ) ) ( not ( = ?auto_64664 ?auto_64666 ) ) ( not ( = ?auto_64664 ?auto_64667 ) ) ( not ( = ?auto_64664 ?auto_64668 ) ) ( not ( = ?auto_64664 ?auto_64669 ) ) ( not ( = ?auto_64664 ?auto_64670 ) ) ( not ( = ?auto_64664 ?auto_64671 ) ) ( not ( = ?auto_64664 ?auto_64672 ) ) ( not ( = ?auto_64665 ?auto_64666 ) ) ( not ( = ?auto_64665 ?auto_64667 ) ) ( not ( = ?auto_64665 ?auto_64668 ) ) ( not ( = ?auto_64665 ?auto_64669 ) ) ( not ( = ?auto_64665 ?auto_64670 ) ) ( not ( = ?auto_64665 ?auto_64671 ) ) ( not ( = ?auto_64665 ?auto_64672 ) ) ( not ( = ?auto_64666 ?auto_64667 ) ) ( not ( = ?auto_64666 ?auto_64668 ) ) ( not ( = ?auto_64666 ?auto_64669 ) ) ( not ( = ?auto_64666 ?auto_64670 ) ) ( not ( = ?auto_64666 ?auto_64671 ) ) ( not ( = ?auto_64666 ?auto_64672 ) ) ( not ( = ?auto_64667 ?auto_64668 ) ) ( not ( = ?auto_64667 ?auto_64669 ) ) ( not ( = ?auto_64667 ?auto_64670 ) ) ( not ( = ?auto_64667 ?auto_64671 ) ) ( not ( = ?auto_64667 ?auto_64672 ) ) ( not ( = ?auto_64668 ?auto_64669 ) ) ( not ( = ?auto_64668 ?auto_64670 ) ) ( not ( = ?auto_64668 ?auto_64671 ) ) ( not ( = ?auto_64668 ?auto_64672 ) ) ( not ( = ?auto_64669 ?auto_64670 ) ) ( not ( = ?auto_64669 ?auto_64671 ) ) ( not ( = ?auto_64669 ?auto_64672 ) ) ( not ( = ?auto_64670 ?auto_64671 ) ) ( not ( = ?auto_64670 ?auto_64672 ) ) ( not ( = ?auto_64671 ?auto_64672 ) ) ( ON ?auto_64671 ?auto_64672 ) ( ON ?auto_64670 ?auto_64671 ) ( ON ?auto_64669 ?auto_64670 ) ( CLEAR ?auto_64667 ) ( ON ?auto_64668 ?auto_64669 ) ( CLEAR ?auto_64668 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_64664 ?auto_64665 ?auto_64666 ?auto_64667 ?auto_64668 )
      ( MAKE-9PILE ?auto_64664 ?auto_64665 ?auto_64666 ?auto_64667 ?auto_64668 ?auto_64669 ?auto_64670 ?auto_64671 ?auto_64672 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_64682 - BLOCK
      ?auto_64683 - BLOCK
      ?auto_64684 - BLOCK
      ?auto_64685 - BLOCK
      ?auto_64686 - BLOCK
      ?auto_64687 - BLOCK
      ?auto_64688 - BLOCK
      ?auto_64689 - BLOCK
      ?auto_64690 - BLOCK
    )
    :vars
    (
      ?auto_64691 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64690 ?auto_64691 ) ( ON-TABLE ?auto_64682 ) ( ON ?auto_64683 ?auto_64682 ) ( ON ?auto_64684 ?auto_64683 ) ( not ( = ?auto_64682 ?auto_64683 ) ) ( not ( = ?auto_64682 ?auto_64684 ) ) ( not ( = ?auto_64682 ?auto_64685 ) ) ( not ( = ?auto_64682 ?auto_64686 ) ) ( not ( = ?auto_64682 ?auto_64687 ) ) ( not ( = ?auto_64682 ?auto_64688 ) ) ( not ( = ?auto_64682 ?auto_64689 ) ) ( not ( = ?auto_64682 ?auto_64690 ) ) ( not ( = ?auto_64682 ?auto_64691 ) ) ( not ( = ?auto_64683 ?auto_64684 ) ) ( not ( = ?auto_64683 ?auto_64685 ) ) ( not ( = ?auto_64683 ?auto_64686 ) ) ( not ( = ?auto_64683 ?auto_64687 ) ) ( not ( = ?auto_64683 ?auto_64688 ) ) ( not ( = ?auto_64683 ?auto_64689 ) ) ( not ( = ?auto_64683 ?auto_64690 ) ) ( not ( = ?auto_64683 ?auto_64691 ) ) ( not ( = ?auto_64684 ?auto_64685 ) ) ( not ( = ?auto_64684 ?auto_64686 ) ) ( not ( = ?auto_64684 ?auto_64687 ) ) ( not ( = ?auto_64684 ?auto_64688 ) ) ( not ( = ?auto_64684 ?auto_64689 ) ) ( not ( = ?auto_64684 ?auto_64690 ) ) ( not ( = ?auto_64684 ?auto_64691 ) ) ( not ( = ?auto_64685 ?auto_64686 ) ) ( not ( = ?auto_64685 ?auto_64687 ) ) ( not ( = ?auto_64685 ?auto_64688 ) ) ( not ( = ?auto_64685 ?auto_64689 ) ) ( not ( = ?auto_64685 ?auto_64690 ) ) ( not ( = ?auto_64685 ?auto_64691 ) ) ( not ( = ?auto_64686 ?auto_64687 ) ) ( not ( = ?auto_64686 ?auto_64688 ) ) ( not ( = ?auto_64686 ?auto_64689 ) ) ( not ( = ?auto_64686 ?auto_64690 ) ) ( not ( = ?auto_64686 ?auto_64691 ) ) ( not ( = ?auto_64687 ?auto_64688 ) ) ( not ( = ?auto_64687 ?auto_64689 ) ) ( not ( = ?auto_64687 ?auto_64690 ) ) ( not ( = ?auto_64687 ?auto_64691 ) ) ( not ( = ?auto_64688 ?auto_64689 ) ) ( not ( = ?auto_64688 ?auto_64690 ) ) ( not ( = ?auto_64688 ?auto_64691 ) ) ( not ( = ?auto_64689 ?auto_64690 ) ) ( not ( = ?auto_64689 ?auto_64691 ) ) ( not ( = ?auto_64690 ?auto_64691 ) ) ( ON ?auto_64689 ?auto_64690 ) ( ON ?auto_64688 ?auto_64689 ) ( ON ?auto_64687 ?auto_64688 ) ( ON ?auto_64686 ?auto_64687 ) ( CLEAR ?auto_64684 ) ( ON ?auto_64685 ?auto_64686 ) ( CLEAR ?auto_64685 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_64682 ?auto_64683 ?auto_64684 ?auto_64685 )
      ( MAKE-9PILE ?auto_64682 ?auto_64683 ?auto_64684 ?auto_64685 ?auto_64686 ?auto_64687 ?auto_64688 ?auto_64689 ?auto_64690 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_64701 - BLOCK
      ?auto_64702 - BLOCK
      ?auto_64703 - BLOCK
      ?auto_64704 - BLOCK
      ?auto_64705 - BLOCK
      ?auto_64706 - BLOCK
      ?auto_64707 - BLOCK
      ?auto_64708 - BLOCK
      ?auto_64709 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_64709 ) ( ON-TABLE ?auto_64701 ) ( ON ?auto_64702 ?auto_64701 ) ( ON ?auto_64703 ?auto_64702 ) ( not ( = ?auto_64701 ?auto_64702 ) ) ( not ( = ?auto_64701 ?auto_64703 ) ) ( not ( = ?auto_64701 ?auto_64704 ) ) ( not ( = ?auto_64701 ?auto_64705 ) ) ( not ( = ?auto_64701 ?auto_64706 ) ) ( not ( = ?auto_64701 ?auto_64707 ) ) ( not ( = ?auto_64701 ?auto_64708 ) ) ( not ( = ?auto_64701 ?auto_64709 ) ) ( not ( = ?auto_64702 ?auto_64703 ) ) ( not ( = ?auto_64702 ?auto_64704 ) ) ( not ( = ?auto_64702 ?auto_64705 ) ) ( not ( = ?auto_64702 ?auto_64706 ) ) ( not ( = ?auto_64702 ?auto_64707 ) ) ( not ( = ?auto_64702 ?auto_64708 ) ) ( not ( = ?auto_64702 ?auto_64709 ) ) ( not ( = ?auto_64703 ?auto_64704 ) ) ( not ( = ?auto_64703 ?auto_64705 ) ) ( not ( = ?auto_64703 ?auto_64706 ) ) ( not ( = ?auto_64703 ?auto_64707 ) ) ( not ( = ?auto_64703 ?auto_64708 ) ) ( not ( = ?auto_64703 ?auto_64709 ) ) ( not ( = ?auto_64704 ?auto_64705 ) ) ( not ( = ?auto_64704 ?auto_64706 ) ) ( not ( = ?auto_64704 ?auto_64707 ) ) ( not ( = ?auto_64704 ?auto_64708 ) ) ( not ( = ?auto_64704 ?auto_64709 ) ) ( not ( = ?auto_64705 ?auto_64706 ) ) ( not ( = ?auto_64705 ?auto_64707 ) ) ( not ( = ?auto_64705 ?auto_64708 ) ) ( not ( = ?auto_64705 ?auto_64709 ) ) ( not ( = ?auto_64706 ?auto_64707 ) ) ( not ( = ?auto_64706 ?auto_64708 ) ) ( not ( = ?auto_64706 ?auto_64709 ) ) ( not ( = ?auto_64707 ?auto_64708 ) ) ( not ( = ?auto_64707 ?auto_64709 ) ) ( not ( = ?auto_64708 ?auto_64709 ) ) ( ON ?auto_64708 ?auto_64709 ) ( ON ?auto_64707 ?auto_64708 ) ( ON ?auto_64706 ?auto_64707 ) ( ON ?auto_64705 ?auto_64706 ) ( CLEAR ?auto_64703 ) ( ON ?auto_64704 ?auto_64705 ) ( CLEAR ?auto_64704 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_64701 ?auto_64702 ?auto_64703 ?auto_64704 )
      ( MAKE-9PILE ?auto_64701 ?auto_64702 ?auto_64703 ?auto_64704 ?auto_64705 ?auto_64706 ?auto_64707 ?auto_64708 ?auto_64709 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_64719 - BLOCK
      ?auto_64720 - BLOCK
      ?auto_64721 - BLOCK
      ?auto_64722 - BLOCK
      ?auto_64723 - BLOCK
      ?auto_64724 - BLOCK
      ?auto_64725 - BLOCK
      ?auto_64726 - BLOCK
      ?auto_64727 - BLOCK
    )
    :vars
    (
      ?auto_64728 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64727 ?auto_64728 ) ( ON-TABLE ?auto_64719 ) ( ON ?auto_64720 ?auto_64719 ) ( not ( = ?auto_64719 ?auto_64720 ) ) ( not ( = ?auto_64719 ?auto_64721 ) ) ( not ( = ?auto_64719 ?auto_64722 ) ) ( not ( = ?auto_64719 ?auto_64723 ) ) ( not ( = ?auto_64719 ?auto_64724 ) ) ( not ( = ?auto_64719 ?auto_64725 ) ) ( not ( = ?auto_64719 ?auto_64726 ) ) ( not ( = ?auto_64719 ?auto_64727 ) ) ( not ( = ?auto_64719 ?auto_64728 ) ) ( not ( = ?auto_64720 ?auto_64721 ) ) ( not ( = ?auto_64720 ?auto_64722 ) ) ( not ( = ?auto_64720 ?auto_64723 ) ) ( not ( = ?auto_64720 ?auto_64724 ) ) ( not ( = ?auto_64720 ?auto_64725 ) ) ( not ( = ?auto_64720 ?auto_64726 ) ) ( not ( = ?auto_64720 ?auto_64727 ) ) ( not ( = ?auto_64720 ?auto_64728 ) ) ( not ( = ?auto_64721 ?auto_64722 ) ) ( not ( = ?auto_64721 ?auto_64723 ) ) ( not ( = ?auto_64721 ?auto_64724 ) ) ( not ( = ?auto_64721 ?auto_64725 ) ) ( not ( = ?auto_64721 ?auto_64726 ) ) ( not ( = ?auto_64721 ?auto_64727 ) ) ( not ( = ?auto_64721 ?auto_64728 ) ) ( not ( = ?auto_64722 ?auto_64723 ) ) ( not ( = ?auto_64722 ?auto_64724 ) ) ( not ( = ?auto_64722 ?auto_64725 ) ) ( not ( = ?auto_64722 ?auto_64726 ) ) ( not ( = ?auto_64722 ?auto_64727 ) ) ( not ( = ?auto_64722 ?auto_64728 ) ) ( not ( = ?auto_64723 ?auto_64724 ) ) ( not ( = ?auto_64723 ?auto_64725 ) ) ( not ( = ?auto_64723 ?auto_64726 ) ) ( not ( = ?auto_64723 ?auto_64727 ) ) ( not ( = ?auto_64723 ?auto_64728 ) ) ( not ( = ?auto_64724 ?auto_64725 ) ) ( not ( = ?auto_64724 ?auto_64726 ) ) ( not ( = ?auto_64724 ?auto_64727 ) ) ( not ( = ?auto_64724 ?auto_64728 ) ) ( not ( = ?auto_64725 ?auto_64726 ) ) ( not ( = ?auto_64725 ?auto_64727 ) ) ( not ( = ?auto_64725 ?auto_64728 ) ) ( not ( = ?auto_64726 ?auto_64727 ) ) ( not ( = ?auto_64726 ?auto_64728 ) ) ( not ( = ?auto_64727 ?auto_64728 ) ) ( ON ?auto_64726 ?auto_64727 ) ( ON ?auto_64725 ?auto_64726 ) ( ON ?auto_64724 ?auto_64725 ) ( ON ?auto_64723 ?auto_64724 ) ( ON ?auto_64722 ?auto_64723 ) ( CLEAR ?auto_64720 ) ( ON ?auto_64721 ?auto_64722 ) ( CLEAR ?auto_64721 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_64719 ?auto_64720 ?auto_64721 )
      ( MAKE-9PILE ?auto_64719 ?auto_64720 ?auto_64721 ?auto_64722 ?auto_64723 ?auto_64724 ?auto_64725 ?auto_64726 ?auto_64727 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_64738 - BLOCK
      ?auto_64739 - BLOCK
      ?auto_64740 - BLOCK
      ?auto_64741 - BLOCK
      ?auto_64742 - BLOCK
      ?auto_64743 - BLOCK
      ?auto_64744 - BLOCK
      ?auto_64745 - BLOCK
      ?auto_64746 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_64746 ) ( ON-TABLE ?auto_64738 ) ( ON ?auto_64739 ?auto_64738 ) ( not ( = ?auto_64738 ?auto_64739 ) ) ( not ( = ?auto_64738 ?auto_64740 ) ) ( not ( = ?auto_64738 ?auto_64741 ) ) ( not ( = ?auto_64738 ?auto_64742 ) ) ( not ( = ?auto_64738 ?auto_64743 ) ) ( not ( = ?auto_64738 ?auto_64744 ) ) ( not ( = ?auto_64738 ?auto_64745 ) ) ( not ( = ?auto_64738 ?auto_64746 ) ) ( not ( = ?auto_64739 ?auto_64740 ) ) ( not ( = ?auto_64739 ?auto_64741 ) ) ( not ( = ?auto_64739 ?auto_64742 ) ) ( not ( = ?auto_64739 ?auto_64743 ) ) ( not ( = ?auto_64739 ?auto_64744 ) ) ( not ( = ?auto_64739 ?auto_64745 ) ) ( not ( = ?auto_64739 ?auto_64746 ) ) ( not ( = ?auto_64740 ?auto_64741 ) ) ( not ( = ?auto_64740 ?auto_64742 ) ) ( not ( = ?auto_64740 ?auto_64743 ) ) ( not ( = ?auto_64740 ?auto_64744 ) ) ( not ( = ?auto_64740 ?auto_64745 ) ) ( not ( = ?auto_64740 ?auto_64746 ) ) ( not ( = ?auto_64741 ?auto_64742 ) ) ( not ( = ?auto_64741 ?auto_64743 ) ) ( not ( = ?auto_64741 ?auto_64744 ) ) ( not ( = ?auto_64741 ?auto_64745 ) ) ( not ( = ?auto_64741 ?auto_64746 ) ) ( not ( = ?auto_64742 ?auto_64743 ) ) ( not ( = ?auto_64742 ?auto_64744 ) ) ( not ( = ?auto_64742 ?auto_64745 ) ) ( not ( = ?auto_64742 ?auto_64746 ) ) ( not ( = ?auto_64743 ?auto_64744 ) ) ( not ( = ?auto_64743 ?auto_64745 ) ) ( not ( = ?auto_64743 ?auto_64746 ) ) ( not ( = ?auto_64744 ?auto_64745 ) ) ( not ( = ?auto_64744 ?auto_64746 ) ) ( not ( = ?auto_64745 ?auto_64746 ) ) ( ON ?auto_64745 ?auto_64746 ) ( ON ?auto_64744 ?auto_64745 ) ( ON ?auto_64743 ?auto_64744 ) ( ON ?auto_64742 ?auto_64743 ) ( ON ?auto_64741 ?auto_64742 ) ( CLEAR ?auto_64739 ) ( ON ?auto_64740 ?auto_64741 ) ( CLEAR ?auto_64740 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_64738 ?auto_64739 ?auto_64740 )
      ( MAKE-9PILE ?auto_64738 ?auto_64739 ?auto_64740 ?auto_64741 ?auto_64742 ?auto_64743 ?auto_64744 ?auto_64745 ?auto_64746 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_64756 - BLOCK
      ?auto_64757 - BLOCK
      ?auto_64758 - BLOCK
      ?auto_64759 - BLOCK
      ?auto_64760 - BLOCK
      ?auto_64761 - BLOCK
      ?auto_64762 - BLOCK
      ?auto_64763 - BLOCK
      ?auto_64764 - BLOCK
    )
    :vars
    (
      ?auto_64765 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64764 ?auto_64765 ) ( ON-TABLE ?auto_64756 ) ( not ( = ?auto_64756 ?auto_64757 ) ) ( not ( = ?auto_64756 ?auto_64758 ) ) ( not ( = ?auto_64756 ?auto_64759 ) ) ( not ( = ?auto_64756 ?auto_64760 ) ) ( not ( = ?auto_64756 ?auto_64761 ) ) ( not ( = ?auto_64756 ?auto_64762 ) ) ( not ( = ?auto_64756 ?auto_64763 ) ) ( not ( = ?auto_64756 ?auto_64764 ) ) ( not ( = ?auto_64756 ?auto_64765 ) ) ( not ( = ?auto_64757 ?auto_64758 ) ) ( not ( = ?auto_64757 ?auto_64759 ) ) ( not ( = ?auto_64757 ?auto_64760 ) ) ( not ( = ?auto_64757 ?auto_64761 ) ) ( not ( = ?auto_64757 ?auto_64762 ) ) ( not ( = ?auto_64757 ?auto_64763 ) ) ( not ( = ?auto_64757 ?auto_64764 ) ) ( not ( = ?auto_64757 ?auto_64765 ) ) ( not ( = ?auto_64758 ?auto_64759 ) ) ( not ( = ?auto_64758 ?auto_64760 ) ) ( not ( = ?auto_64758 ?auto_64761 ) ) ( not ( = ?auto_64758 ?auto_64762 ) ) ( not ( = ?auto_64758 ?auto_64763 ) ) ( not ( = ?auto_64758 ?auto_64764 ) ) ( not ( = ?auto_64758 ?auto_64765 ) ) ( not ( = ?auto_64759 ?auto_64760 ) ) ( not ( = ?auto_64759 ?auto_64761 ) ) ( not ( = ?auto_64759 ?auto_64762 ) ) ( not ( = ?auto_64759 ?auto_64763 ) ) ( not ( = ?auto_64759 ?auto_64764 ) ) ( not ( = ?auto_64759 ?auto_64765 ) ) ( not ( = ?auto_64760 ?auto_64761 ) ) ( not ( = ?auto_64760 ?auto_64762 ) ) ( not ( = ?auto_64760 ?auto_64763 ) ) ( not ( = ?auto_64760 ?auto_64764 ) ) ( not ( = ?auto_64760 ?auto_64765 ) ) ( not ( = ?auto_64761 ?auto_64762 ) ) ( not ( = ?auto_64761 ?auto_64763 ) ) ( not ( = ?auto_64761 ?auto_64764 ) ) ( not ( = ?auto_64761 ?auto_64765 ) ) ( not ( = ?auto_64762 ?auto_64763 ) ) ( not ( = ?auto_64762 ?auto_64764 ) ) ( not ( = ?auto_64762 ?auto_64765 ) ) ( not ( = ?auto_64763 ?auto_64764 ) ) ( not ( = ?auto_64763 ?auto_64765 ) ) ( not ( = ?auto_64764 ?auto_64765 ) ) ( ON ?auto_64763 ?auto_64764 ) ( ON ?auto_64762 ?auto_64763 ) ( ON ?auto_64761 ?auto_64762 ) ( ON ?auto_64760 ?auto_64761 ) ( ON ?auto_64759 ?auto_64760 ) ( ON ?auto_64758 ?auto_64759 ) ( CLEAR ?auto_64756 ) ( ON ?auto_64757 ?auto_64758 ) ( CLEAR ?auto_64757 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_64756 ?auto_64757 )
      ( MAKE-9PILE ?auto_64756 ?auto_64757 ?auto_64758 ?auto_64759 ?auto_64760 ?auto_64761 ?auto_64762 ?auto_64763 ?auto_64764 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_64775 - BLOCK
      ?auto_64776 - BLOCK
      ?auto_64777 - BLOCK
      ?auto_64778 - BLOCK
      ?auto_64779 - BLOCK
      ?auto_64780 - BLOCK
      ?auto_64781 - BLOCK
      ?auto_64782 - BLOCK
      ?auto_64783 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_64783 ) ( ON-TABLE ?auto_64775 ) ( not ( = ?auto_64775 ?auto_64776 ) ) ( not ( = ?auto_64775 ?auto_64777 ) ) ( not ( = ?auto_64775 ?auto_64778 ) ) ( not ( = ?auto_64775 ?auto_64779 ) ) ( not ( = ?auto_64775 ?auto_64780 ) ) ( not ( = ?auto_64775 ?auto_64781 ) ) ( not ( = ?auto_64775 ?auto_64782 ) ) ( not ( = ?auto_64775 ?auto_64783 ) ) ( not ( = ?auto_64776 ?auto_64777 ) ) ( not ( = ?auto_64776 ?auto_64778 ) ) ( not ( = ?auto_64776 ?auto_64779 ) ) ( not ( = ?auto_64776 ?auto_64780 ) ) ( not ( = ?auto_64776 ?auto_64781 ) ) ( not ( = ?auto_64776 ?auto_64782 ) ) ( not ( = ?auto_64776 ?auto_64783 ) ) ( not ( = ?auto_64777 ?auto_64778 ) ) ( not ( = ?auto_64777 ?auto_64779 ) ) ( not ( = ?auto_64777 ?auto_64780 ) ) ( not ( = ?auto_64777 ?auto_64781 ) ) ( not ( = ?auto_64777 ?auto_64782 ) ) ( not ( = ?auto_64777 ?auto_64783 ) ) ( not ( = ?auto_64778 ?auto_64779 ) ) ( not ( = ?auto_64778 ?auto_64780 ) ) ( not ( = ?auto_64778 ?auto_64781 ) ) ( not ( = ?auto_64778 ?auto_64782 ) ) ( not ( = ?auto_64778 ?auto_64783 ) ) ( not ( = ?auto_64779 ?auto_64780 ) ) ( not ( = ?auto_64779 ?auto_64781 ) ) ( not ( = ?auto_64779 ?auto_64782 ) ) ( not ( = ?auto_64779 ?auto_64783 ) ) ( not ( = ?auto_64780 ?auto_64781 ) ) ( not ( = ?auto_64780 ?auto_64782 ) ) ( not ( = ?auto_64780 ?auto_64783 ) ) ( not ( = ?auto_64781 ?auto_64782 ) ) ( not ( = ?auto_64781 ?auto_64783 ) ) ( not ( = ?auto_64782 ?auto_64783 ) ) ( ON ?auto_64782 ?auto_64783 ) ( ON ?auto_64781 ?auto_64782 ) ( ON ?auto_64780 ?auto_64781 ) ( ON ?auto_64779 ?auto_64780 ) ( ON ?auto_64778 ?auto_64779 ) ( ON ?auto_64777 ?auto_64778 ) ( CLEAR ?auto_64775 ) ( ON ?auto_64776 ?auto_64777 ) ( CLEAR ?auto_64776 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_64775 ?auto_64776 )
      ( MAKE-9PILE ?auto_64775 ?auto_64776 ?auto_64777 ?auto_64778 ?auto_64779 ?auto_64780 ?auto_64781 ?auto_64782 ?auto_64783 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_64793 - BLOCK
      ?auto_64794 - BLOCK
      ?auto_64795 - BLOCK
      ?auto_64796 - BLOCK
      ?auto_64797 - BLOCK
      ?auto_64798 - BLOCK
      ?auto_64799 - BLOCK
      ?auto_64800 - BLOCK
      ?auto_64801 - BLOCK
    )
    :vars
    (
      ?auto_64802 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64801 ?auto_64802 ) ( not ( = ?auto_64793 ?auto_64794 ) ) ( not ( = ?auto_64793 ?auto_64795 ) ) ( not ( = ?auto_64793 ?auto_64796 ) ) ( not ( = ?auto_64793 ?auto_64797 ) ) ( not ( = ?auto_64793 ?auto_64798 ) ) ( not ( = ?auto_64793 ?auto_64799 ) ) ( not ( = ?auto_64793 ?auto_64800 ) ) ( not ( = ?auto_64793 ?auto_64801 ) ) ( not ( = ?auto_64793 ?auto_64802 ) ) ( not ( = ?auto_64794 ?auto_64795 ) ) ( not ( = ?auto_64794 ?auto_64796 ) ) ( not ( = ?auto_64794 ?auto_64797 ) ) ( not ( = ?auto_64794 ?auto_64798 ) ) ( not ( = ?auto_64794 ?auto_64799 ) ) ( not ( = ?auto_64794 ?auto_64800 ) ) ( not ( = ?auto_64794 ?auto_64801 ) ) ( not ( = ?auto_64794 ?auto_64802 ) ) ( not ( = ?auto_64795 ?auto_64796 ) ) ( not ( = ?auto_64795 ?auto_64797 ) ) ( not ( = ?auto_64795 ?auto_64798 ) ) ( not ( = ?auto_64795 ?auto_64799 ) ) ( not ( = ?auto_64795 ?auto_64800 ) ) ( not ( = ?auto_64795 ?auto_64801 ) ) ( not ( = ?auto_64795 ?auto_64802 ) ) ( not ( = ?auto_64796 ?auto_64797 ) ) ( not ( = ?auto_64796 ?auto_64798 ) ) ( not ( = ?auto_64796 ?auto_64799 ) ) ( not ( = ?auto_64796 ?auto_64800 ) ) ( not ( = ?auto_64796 ?auto_64801 ) ) ( not ( = ?auto_64796 ?auto_64802 ) ) ( not ( = ?auto_64797 ?auto_64798 ) ) ( not ( = ?auto_64797 ?auto_64799 ) ) ( not ( = ?auto_64797 ?auto_64800 ) ) ( not ( = ?auto_64797 ?auto_64801 ) ) ( not ( = ?auto_64797 ?auto_64802 ) ) ( not ( = ?auto_64798 ?auto_64799 ) ) ( not ( = ?auto_64798 ?auto_64800 ) ) ( not ( = ?auto_64798 ?auto_64801 ) ) ( not ( = ?auto_64798 ?auto_64802 ) ) ( not ( = ?auto_64799 ?auto_64800 ) ) ( not ( = ?auto_64799 ?auto_64801 ) ) ( not ( = ?auto_64799 ?auto_64802 ) ) ( not ( = ?auto_64800 ?auto_64801 ) ) ( not ( = ?auto_64800 ?auto_64802 ) ) ( not ( = ?auto_64801 ?auto_64802 ) ) ( ON ?auto_64800 ?auto_64801 ) ( ON ?auto_64799 ?auto_64800 ) ( ON ?auto_64798 ?auto_64799 ) ( ON ?auto_64797 ?auto_64798 ) ( ON ?auto_64796 ?auto_64797 ) ( ON ?auto_64795 ?auto_64796 ) ( ON ?auto_64794 ?auto_64795 ) ( ON ?auto_64793 ?auto_64794 ) ( CLEAR ?auto_64793 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_64793 )
      ( MAKE-9PILE ?auto_64793 ?auto_64794 ?auto_64795 ?auto_64796 ?auto_64797 ?auto_64798 ?auto_64799 ?auto_64800 ?auto_64801 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_64812 - BLOCK
      ?auto_64813 - BLOCK
      ?auto_64814 - BLOCK
      ?auto_64815 - BLOCK
      ?auto_64816 - BLOCK
      ?auto_64817 - BLOCK
      ?auto_64818 - BLOCK
      ?auto_64819 - BLOCK
      ?auto_64820 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_64820 ) ( not ( = ?auto_64812 ?auto_64813 ) ) ( not ( = ?auto_64812 ?auto_64814 ) ) ( not ( = ?auto_64812 ?auto_64815 ) ) ( not ( = ?auto_64812 ?auto_64816 ) ) ( not ( = ?auto_64812 ?auto_64817 ) ) ( not ( = ?auto_64812 ?auto_64818 ) ) ( not ( = ?auto_64812 ?auto_64819 ) ) ( not ( = ?auto_64812 ?auto_64820 ) ) ( not ( = ?auto_64813 ?auto_64814 ) ) ( not ( = ?auto_64813 ?auto_64815 ) ) ( not ( = ?auto_64813 ?auto_64816 ) ) ( not ( = ?auto_64813 ?auto_64817 ) ) ( not ( = ?auto_64813 ?auto_64818 ) ) ( not ( = ?auto_64813 ?auto_64819 ) ) ( not ( = ?auto_64813 ?auto_64820 ) ) ( not ( = ?auto_64814 ?auto_64815 ) ) ( not ( = ?auto_64814 ?auto_64816 ) ) ( not ( = ?auto_64814 ?auto_64817 ) ) ( not ( = ?auto_64814 ?auto_64818 ) ) ( not ( = ?auto_64814 ?auto_64819 ) ) ( not ( = ?auto_64814 ?auto_64820 ) ) ( not ( = ?auto_64815 ?auto_64816 ) ) ( not ( = ?auto_64815 ?auto_64817 ) ) ( not ( = ?auto_64815 ?auto_64818 ) ) ( not ( = ?auto_64815 ?auto_64819 ) ) ( not ( = ?auto_64815 ?auto_64820 ) ) ( not ( = ?auto_64816 ?auto_64817 ) ) ( not ( = ?auto_64816 ?auto_64818 ) ) ( not ( = ?auto_64816 ?auto_64819 ) ) ( not ( = ?auto_64816 ?auto_64820 ) ) ( not ( = ?auto_64817 ?auto_64818 ) ) ( not ( = ?auto_64817 ?auto_64819 ) ) ( not ( = ?auto_64817 ?auto_64820 ) ) ( not ( = ?auto_64818 ?auto_64819 ) ) ( not ( = ?auto_64818 ?auto_64820 ) ) ( not ( = ?auto_64819 ?auto_64820 ) ) ( ON ?auto_64819 ?auto_64820 ) ( ON ?auto_64818 ?auto_64819 ) ( ON ?auto_64817 ?auto_64818 ) ( ON ?auto_64816 ?auto_64817 ) ( ON ?auto_64815 ?auto_64816 ) ( ON ?auto_64814 ?auto_64815 ) ( ON ?auto_64813 ?auto_64814 ) ( ON ?auto_64812 ?auto_64813 ) ( CLEAR ?auto_64812 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_64812 )
      ( MAKE-9PILE ?auto_64812 ?auto_64813 ?auto_64814 ?auto_64815 ?auto_64816 ?auto_64817 ?auto_64818 ?auto_64819 ?auto_64820 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_64830 - BLOCK
      ?auto_64831 - BLOCK
      ?auto_64832 - BLOCK
      ?auto_64833 - BLOCK
      ?auto_64834 - BLOCK
      ?auto_64835 - BLOCK
      ?auto_64836 - BLOCK
      ?auto_64837 - BLOCK
      ?auto_64838 - BLOCK
    )
    :vars
    (
      ?auto_64839 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64830 ?auto_64831 ) ) ( not ( = ?auto_64830 ?auto_64832 ) ) ( not ( = ?auto_64830 ?auto_64833 ) ) ( not ( = ?auto_64830 ?auto_64834 ) ) ( not ( = ?auto_64830 ?auto_64835 ) ) ( not ( = ?auto_64830 ?auto_64836 ) ) ( not ( = ?auto_64830 ?auto_64837 ) ) ( not ( = ?auto_64830 ?auto_64838 ) ) ( not ( = ?auto_64831 ?auto_64832 ) ) ( not ( = ?auto_64831 ?auto_64833 ) ) ( not ( = ?auto_64831 ?auto_64834 ) ) ( not ( = ?auto_64831 ?auto_64835 ) ) ( not ( = ?auto_64831 ?auto_64836 ) ) ( not ( = ?auto_64831 ?auto_64837 ) ) ( not ( = ?auto_64831 ?auto_64838 ) ) ( not ( = ?auto_64832 ?auto_64833 ) ) ( not ( = ?auto_64832 ?auto_64834 ) ) ( not ( = ?auto_64832 ?auto_64835 ) ) ( not ( = ?auto_64832 ?auto_64836 ) ) ( not ( = ?auto_64832 ?auto_64837 ) ) ( not ( = ?auto_64832 ?auto_64838 ) ) ( not ( = ?auto_64833 ?auto_64834 ) ) ( not ( = ?auto_64833 ?auto_64835 ) ) ( not ( = ?auto_64833 ?auto_64836 ) ) ( not ( = ?auto_64833 ?auto_64837 ) ) ( not ( = ?auto_64833 ?auto_64838 ) ) ( not ( = ?auto_64834 ?auto_64835 ) ) ( not ( = ?auto_64834 ?auto_64836 ) ) ( not ( = ?auto_64834 ?auto_64837 ) ) ( not ( = ?auto_64834 ?auto_64838 ) ) ( not ( = ?auto_64835 ?auto_64836 ) ) ( not ( = ?auto_64835 ?auto_64837 ) ) ( not ( = ?auto_64835 ?auto_64838 ) ) ( not ( = ?auto_64836 ?auto_64837 ) ) ( not ( = ?auto_64836 ?auto_64838 ) ) ( not ( = ?auto_64837 ?auto_64838 ) ) ( ON ?auto_64830 ?auto_64839 ) ( not ( = ?auto_64838 ?auto_64839 ) ) ( not ( = ?auto_64837 ?auto_64839 ) ) ( not ( = ?auto_64836 ?auto_64839 ) ) ( not ( = ?auto_64835 ?auto_64839 ) ) ( not ( = ?auto_64834 ?auto_64839 ) ) ( not ( = ?auto_64833 ?auto_64839 ) ) ( not ( = ?auto_64832 ?auto_64839 ) ) ( not ( = ?auto_64831 ?auto_64839 ) ) ( not ( = ?auto_64830 ?auto_64839 ) ) ( ON ?auto_64831 ?auto_64830 ) ( ON ?auto_64832 ?auto_64831 ) ( ON ?auto_64833 ?auto_64832 ) ( ON ?auto_64834 ?auto_64833 ) ( ON ?auto_64835 ?auto_64834 ) ( ON ?auto_64836 ?auto_64835 ) ( ON ?auto_64837 ?auto_64836 ) ( ON ?auto_64838 ?auto_64837 ) ( CLEAR ?auto_64838 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_64838 ?auto_64837 ?auto_64836 ?auto_64835 ?auto_64834 ?auto_64833 ?auto_64832 ?auto_64831 ?auto_64830 )
      ( MAKE-9PILE ?auto_64830 ?auto_64831 ?auto_64832 ?auto_64833 ?auto_64834 ?auto_64835 ?auto_64836 ?auto_64837 ?auto_64838 ) )
  )

)

