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
      ?auto_812 - BLOCK
      ?auto_813 - BLOCK
    )
    :vars
    (
      ?auto_814 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_814 ?auto_813 ) ( CLEAR ?auto_814 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_812 ) ( ON ?auto_813 ?auto_812 ) ( not ( = ?auto_812 ?auto_813 ) ) ( not ( = ?auto_812 ?auto_814 ) ) ( not ( = ?auto_813 ?auto_814 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_814 ?auto_813 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_816 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_816 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_816 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_817 - BLOCK
    )
    :vars
    (
      ?auto_818 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_817 ?auto_818 ) ( CLEAR ?auto_817 ) ( HAND-EMPTY ) ( not ( = ?auto_817 ?auto_818 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_817 ?auto_818 )
      ( MAKE-1PILE ?auto_817 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_820 - BLOCK
    )
    :vars
    (
      ?auto_821 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_821 ?auto_820 ) ( CLEAR ?auto_821 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_820 ) ( not ( = ?auto_820 ?auto_821 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_821 ?auto_820 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_822 - BLOCK
    )
    :vars
    (
      ?auto_823 - BLOCK
      ?auto_824 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_823 ?auto_822 ) ( CLEAR ?auto_823 ) ( ON-TABLE ?auto_822 ) ( not ( = ?auto_822 ?auto_823 ) ) ( HOLDING ?auto_824 ) ( not ( = ?auto_822 ?auto_824 ) ) ( not ( = ?auto_823 ?auto_824 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_824 )
      ( MAKE-1PILE ?auto_822 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_825 - BLOCK
    )
    :vars
    (
      ?auto_826 - BLOCK
      ?auto_827 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_826 ?auto_825 ) ( ON-TABLE ?auto_825 ) ( not ( = ?auto_825 ?auto_826 ) ) ( not ( = ?auto_825 ?auto_827 ) ) ( not ( = ?auto_826 ?auto_827 ) ) ( ON ?auto_827 ?auto_826 ) ( CLEAR ?auto_827 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_825 ?auto_826 )
      ( MAKE-1PILE ?auto_825 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_830 - BLOCK
      ?auto_831 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_831 ) ( CLEAR ?auto_830 ) ( ON-TABLE ?auto_830 ) ( not ( = ?auto_830 ?auto_831 ) ) )
    :subtasks
    ( ( !STACK ?auto_831 ?auto_830 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_832 - BLOCK
      ?auto_833 - BLOCK
    )
    :vars
    (
      ?auto_834 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_832 ) ( ON-TABLE ?auto_832 ) ( not ( = ?auto_832 ?auto_833 ) ) ( ON ?auto_833 ?auto_834 ) ( CLEAR ?auto_833 ) ( HAND-EMPTY ) ( not ( = ?auto_832 ?auto_834 ) ) ( not ( = ?auto_833 ?auto_834 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_833 ?auto_834 )
      ( MAKE-2PILE ?auto_832 ?auto_833 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_835 - BLOCK
      ?auto_836 - BLOCK
    )
    :vars
    (
      ?auto_837 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_835 ?auto_836 ) ) ( ON ?auto_836 ?auto_837 ) ( CLEAR ?auto_836 ) ( not ( = ?auto_835 ?auto_837 ) ) ( not ( = ?auto_836 ?auto_837 ) ) ( HOLDING ?auto_835 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_835 )
      ( MAKE-2PILE ?auto_835 ?auto_836 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_838 - BLOCK
      ?auto_839 - BLOCK
    )
    :vars
    (
      ?auto_840 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_838 ?auto_839 ) ) ( ON ?auto_839 ?auto_840 ) ( not ( = ?auto_838 ?auto_840 ) ) ( not ( = ?auto_839 ?auto_840 ) ) ( ON ?auto_838 ?auto_839 ) ( CLEAR ?auto_838 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_840 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_840 ?auto_839 )
      ( MAKE-2PILE ?auto_838 ?auto_839 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_842 - BLOCK
    )
    :vars
    (
      ?auto_843 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_843 ?auto_842 ) ( CLEAR ?auto_843 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_842 ) ( not ( = ?auto_842 ?auto_843 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_843 ?auto_842 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_849 - BLOCK
    )
    :vars
    (
      ?auto_850 - BLOCK
      ?auto_851 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_849 ?auto_850 ) ) ( ON ?auto_850 ?auto_851 ) ( CLEAR ?auto_850 ) ( not ( = ?auto_849 ?auto_851 ) ) ( not ( = ?auto_850 ?auto_851 ) ) ( HOLDING ?auto_849 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_849 ?auto_850 )
      ( MAKE-1PILE ?auto_849 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_852 - BLOCK
    )
    :vars
    (
      ?auto_853 - BLOCK
      ?auto_854 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_852 ?auto_853 ) ) ( ON ?auto_853 ?auto_854 ) ( not ( = ?auto_852 ?auto_854 ) ) ( not ( = ?auto_853 ?auto_854 ) ) ( ON ?auto_852 ?auto_853 ) ( CLEAR ?auto_852 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_854 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_854 ?auto_853 )
      ( MAKE-1PILE ?auto_852 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_856 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_856 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_856 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_857 - BLOCK
    )
    :vars
    (
      ?auto_858 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_857 ?auto_858 ) ( CLEAR ?auto_857 ) ( HAND-EMPTY ) ( not ( = ?auto_857 ?auto_858 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_857 ?auto_858 )
      ( MAKE-1PILE ?auto_857 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_859 - BLOCK
    )
    :vars
    (
      ?auto_860 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_859 ?auto_860 ) ) ( HOLDING ?auto_859 ) ( CLEAR ?auto_860 ) ( ON-TABLE ?auto_860 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_860 ?auto_859 )
      ( MAKE-1PILE ?auto_859 ) )
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
    ( and ( not ( = ?auto_861 ?auto_862 ) ) ( CLEAR ?auto_862 ) ( ON-TABLE ?auto_862 ) ( ON ?auto_861 ?auto_863 ) ( CLEAR ?auto_861 ) ( HAND-EMPTY ) ( not ( = ?auto_861 ?auto_863 ) ) ( not ( = ?auto_862 ?auto_863 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_861 ?auto_863 )
      ( MAKE-1PILE ?auto_861 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_864 - BLOCK
    )
    :vars
    (
      ?auto_866 - BLOCK
      ?auto_865 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_864 ?auto_866 ) ) ( ON ?auto_864 ?auto_865 ) ( CLEAR ?auto_864 ) ( not ( = ?auto_864 ?auto_865 ) ) ( not ( = ?auto_866 ?auto_865 ) ) ( HOLDING ?auto_866 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_866 )
      ( MAKE-1PILE ?auto_864 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_867 - BLOCK
    )
    :vars
    (
      ?auto_869 - BLOCK
      ?auto_868 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_867 ?auto_869 ) ) ( ON ?auto_867 ?auto_868 ) ( not ( = ?auto_867 ?auto_868 ) ) ( not ( = ?auto_869 ?auto_868 ) ) ( ON ?auto_869 ?auto_867 ) ( CLEAR ?auto_869 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_868 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_868 ?auto_867 )
      ( MAKE-1PILE ?auto_867 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_872 - BLOCK
      ?auto_873 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_873 ) ( CLEAR ?auto_872 ) ( ON-TABLE ?auto_872 ) ( not ( = ?auto_872 ?auto_873 ) ) )
    :subtasks
    ( ( !STACK ?auto_873 ?auto_872 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_874 - BLOCK
      ?auto_875 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_874 ) ( ON-TABLE ?auto_874 ) ( not ( = ?auto_874 ?auto_875 ) ) ( ON-TABLE ?auto_875 ) ( CLEAR ?auto_875 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_875 )
      ( MAKE-2PILE ?auto_874 ?auto_875 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_876 - BLOCK
      ?auto_877 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_876 ?auto_877 ) ) ( ON-TABLE ?auto_877 ) ( CLEAR ?auto_877 ) ( HOLDING ?auto_876 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_876 )
      ( MAKE-2PILE ?auto_876 ?auto_877 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_878 - BLOCK
      ?auto_879 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_878 ?auto_879 ) ) ( ON-TABLE ?auto_879 ) ( ON ?auto_878 ?auto_879 ) ( CLEAR ?auto_878 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_879 )
      ( MAKE-2PILE ?auto_878 ?auto_879 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_880 - BLOCK
      ?auto_881 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_880 ?auto_881 ) ) ( ON-TABLE ?auto_881 ) ( HOLDING ?auto_880 ) ( CLEAR ?auto_881 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_881 ?auto_880 )
      ( MAKE-2PILE ?auto_880 ?auto_881 ) )
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
    ( and ( not ( = ?auto_882 ?auto_883 ) ) ( ON-TABLE ?auto_883 ) ( CLEAR ?auto_883 ) ( ON ?auto_882 ?auto_884 ) ( CLEAR ?auto_882 ) ( HAND-EMPTY ) ( not ( = ?auto_882 ?auto_884 ) ) ( not ( = ?auto_883 ?auto_884 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_882 ?auto_884 )
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
    ( and ( not ( = ?auto_885 ?auto_886 ) ) ( ON ?auto_885 ?auto_887 ) ( CLEAR ?auto_885 ) ( not ( = ?auto_885 ?auto_887 ) ) ( not ( = ?auto_886 ?auto_887 ) ) ( HOLDING ?auto_886 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_886 )
      ( MAKE-2PILE ?auto_885 ?auto_886 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_888 - BLOCK
      ?auto_889 - BLOCK
    )
    :vars
    (
      ?auto_890 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_888 ?auto_889 ) ) ( ON ?auto_888 ?auto_890 ) ( not ( = ?auto_888 ?auto_890 ) ) ( not ( = ?auto_889 ?auto_890 ) ) ( ON ?auto_889 ?auto_888 ) ( CLEAR ?auto_889 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_890 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_890 ?auto_888 )
      ( MAKE-2PILE ?auto_888 ?auto_889 ) )
  )

)

