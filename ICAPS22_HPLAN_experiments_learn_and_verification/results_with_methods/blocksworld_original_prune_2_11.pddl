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

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_816 - BLOCK
      ?auto_817 - BLOCK
    )
    :vars
    (
      ?auto_818 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_818 ?auto_817 ) ( CLEAR ?auto_818 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_816 ) ( ON ?auto_817 ?auto_816 ) ( not ( = ?auto_816 ?auto_817 ) ) ( not ( = ?auto_816 ?auto_818 ) ) ( not ( = ?auto_817 ?auto_818 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_818 ?auto_817 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_820 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_820 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_820 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_821 - BLOCK
    )
    :vars
    (
      ?auto_822 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_821 ?auto_822 ) ( CLEAR ?auto_821 ) ( HAND-EMPTY ) ( not ( = ?auto_821 ?auto_822 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_821 ?auto_822 )
      ( MAKE-1PILE ?auto_821 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_824 - BLOCK
    )
    :vars
    (
      ?auto_825 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_825 ?auto_824 ) ( CLEAR ?auto_825 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_824 ) ( not ( = ?auto_824 ?auto_825 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_825 ?auto_824 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_826 - BLOCK
    )
    :vars
    (
      ?auto_827 - BLOCK
      ?auto_828 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_827 ?auto_826 ) ( CLEAR ?auto_827 ) ( ON-TABLE ?auto_826 ) ( not ( = ?auto_826 ?auto_827 ) ) ( HOLDING ?auto_828 ) ( not ( = ?auto_826 ?auto_828 ) ) ( not ( = ?auto_827 ?auto_828 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_828 )
      ( MAKE-1PILE ?auto_826 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_829 - BLOCK
    )
    :vars
    (
      ?auto_831 - BLOCK
      ?auto_830 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_831 ?auto_829 ) ( ON-TABLE ?auto_829 ) ( not ( = ?auto_829 ?auto_831 ) ) ( not ( = ?auto_829 ?auto_830 ) ) ( not ( = ?auto_831 ?auto_830 ) ) ( ON ?auto_830 ?auto_831 ) ( CLEAR ?auto_830 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_829 ?auto_831 )
      ( MAKE-1PILE ?auto_829 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_834 - BLOCK
      ?auto_835 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_835 ) ( CLEAR ?auto_834 ) ( ON-TABLE ?auto_834 ) ( not ( = ?auto_834 ?auto_835 ) ) )
    :subtasks
    ( ( !STACK ?auto_835 ?auto_834 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_836 - BLOCK
      ?auto_837 - BLOCK
    )
    :vars
    (
      ?auto_838 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_836 ) ( ON-TABLE ?auto_836 ) ( not ( = ?auto_836 ?auto_837 ) ) ( ON ?auto_837 ?auto_838 ) ( CLEAR ?auto_837 ) ( HAND-EMPTY ) ( not ( = ?auto_836 ?auto_838 ) ) ( not ( = ?auto_837 ?auto_838 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_837 ?auto_838 )
      ( MAKE-2PILE ?auto_836 ?auto_837 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_839 - BLOCK
      ?auto_840 - BLOCK
    )
    :vars
    (
      ?auto_841 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_839 ?auto_840 ) ) ( ON ?auto_840 ?auto_841 ) ( CLEAR ?auto_840 ) ( not ( = ?auto_839 ?auto_841 ) ) ( not ( = ?auto_840 ?auto_841 ) ) ( HOLDING ?auto_839 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_839 )
      ( MAKE-2PILE ?auto_839 ?auto_840 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_842 - BLOCK
      ?auto_843 - BLOCK
    )
    :vars
    (
      ?auto_844 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_842 ?auto_843 ) ) ( ON ?auto_843 ?auto_844 ) ( not ( = ?auto_842 ?auto_844 ) ) ( not ( = ?auto_843 ?auto_844 ) ) ( ON ?auto_842 ?auto_843 ) ( CLEAR ?auto_842 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_844 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_844 ?auto_843 )
      ( MAKE-2PILE ?auto_842 ?auto_843 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_861 - BLOCK
    )
    :vars
    (
      ?auto_862 - BLOCK
      ?auto_863 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_861 ?auto_862 ) ( CLEAR ?auto_861 ) ( not ( = ?auto_861 ?auto_862 ) ) ( HOLDING ?auto_863 ) ( not ( = ?auto_861 ?auto_863 ) ) ( not ( = ?auto_862 ?auto_863 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_863 )
      ( MAKE-1PILE ?auto_861 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_864 - BLOCK
    )
    :vars
    (
      ?auto_865 - BLOCK
      ?auto_866 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_864 ?auto_865 ) ( not ( = ?auto_864 ?auto_865 ) ) ( not ( = ?auto_864 ?auto_866 ) ) ( not ( = ?auto_865 ?auto_866 ) ) ( ON ?auto_866 ?auto_864 ) ( CLEAR ?auto_866 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_865 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_865 ?auto_864 )
      ( MAKE-1PILE ?auto_864 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_871 - BLOCK
      ?auto_872 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_871 ) ( ON-TABLE ?auto_871 ) ( not ( = ?auto_871 ?auto_872 ) ) ( ON-TABLE ?auto_872 ) ( CLEAR ?auto_872 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_872 )
      ( MAKE-2PILE ?auto_871 ?auto_872 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_873 - BLOCK
      ?auto_874 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_873 ?auto_874 ) ) ( ON-TABLE ?auto_874 ) ( CLEAR ?auto_874 ) ( HOLDING ?auto_873 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_873 )
      ( MAKE-2PILE ?auto_873 ?auto_874 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_875 - BLOCK
      ?auto_876 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_875 ?auto_876 ) ) ( ON-TABLE ?auto_876 ) ( ON ?auto_875 ?auto_876 ) ( CLEAR ?auto_875 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_876 )
      ( MAKE-2PILE ?auto_875 ?auto_876 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_879 - BLOCK
      ?auto_880 - BLOCK
    )
    :vars
    (
      ?auto_881 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_879 ?auto_880 ) ) ( ON-TABLE ?auto_880 ) ( CLEAR ?auto_880 ) ( ON ?auto_879 ?auto_881 ) ( CLEAR ?auto_879 ) ( HAND-EMPTY ) ( not ( = ?auto_879 ?auto_881 ) ) ( not ( = ?auto_880 ?auto_881 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_879 ?auto_881 )
      ( MAKE-2PILE ?auto_879 ?auto_880 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_882 - BLOCK
      ?auto_883 - BLOCK
    )
    :vars
    (
      ?auto_884 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_882 ?auto_883 ) ) ( ON ?auto_882 ?auto_884 ) ( CLEAR ?auto_882 ) ( not ( = ?auto_882 ?auto_884 ) ) ( not ( = ?auto_883 ?auto_884 ) ) ( HOLDING ?auto_883 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_883 )
      ( MAKE-2PILE ?auto_882 ?auto_883 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_885 - BLOCK
      ?auto_886 - BLOCK
    )
    :vars
    (
      ?auto_887 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_885 ?auto_886 ) ) ( ON ?auto_885 ?auto_887 ) ( not ( = ?auto_885 ?auto_887 ) ) ( not ( = ?auto_886 ?auto_887 ) ) ( ON ?auto_886 ?auto_885 ) ( CLEAR ?auto_886 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_887 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_887 ?auto_885 )
      ( MAKE-2PILE ?auto_885 ?auto_886 ) )
  )

)

