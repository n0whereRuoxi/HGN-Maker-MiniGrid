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
      ?auto_29820 - BLOCK
      ?auto_29821 - BLOCK
      ?auto_29822 - BLOCK
      ?auto_29823 - BLOCK
      ?auto_29824 - BLOCK
    )
    :vars
    (
      ?auto_29825 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29825 ?auto_29824 ) ( CLEAR ?auto_29825 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_29820 ) ( ON ?auto_29821 ?auto_29820 ) ( ON ?auto_29822 ?auto_29821 ) ( ON ?auto_29823 ?auto_29822 ) ( ON ?auto_29824 ?auto_29823 ) ( not ( = ?auto_29820 ?auto_29821 ) ) ( not ( = ?auto_29820 ?auto_29822 ) ) ( not ( = ?auto_29820 ?auto_29823 ) ) ( not ( = ?auto_29820 ?auto_29824 ) ) ( not ( = ?auto_29820 ?auto_29825 ) ) ( not ( = ?auto_29821 ?auto_29822 ) ) ( not ( = ?auto_29821 ?auto_29823 ) ) ( not ( = ?auto_29821 ?auto_29824 ) ) ( not ( = ?auto_29821 ?auto_29825 ) ) ( not ( = ?auto_29822 ?auto_29823 ) ) ( not ( = ?auto_29822 ?auto_29824 ) ) ( not ( = ?auto_29822 ?auto_29825 ) ) ( not ( = ?auto_29823 ?auto_29824 ) ) ( not ( = ?auto_29823 ?auto_29825 ) ) ( not ( = ?auto_29824 ?auto_29825 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_29825 ?auto_29824 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_29827 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_29827 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_29827 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_29828 - BLOCK
    )
    :vars
    (
      ?auto_29829 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29828 ?auto_29829 ) ( CLEAR ?auto_29828 ) ( HAND-EMPTY ) ( not ( = ?auto_29828 ?auto_29829 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_29828 ?auto_29829 )
      ( MAKE-1PILE ?auto_29828 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_29834 - BLOCK
      ?auto_29835 - BLOCK
      ?auto_29836 - BLOCK
      ?auto_29837 - BLOCK
    )
    :vars
    (
      ?auto_29838 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29838 ?auto_29837 ) ( CLEAR ?auto_29838 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_29834 ) ( ON ?auto_29835 ?auto_29834 ) ( ON ?auto_29836 ?auto_29835 ) ( ON ?auto_29837 ?auto_29836 ) ( not ( = ?auto_29834 ?auto_29835 ) ) ( not ( = ?auto_29834 ?auto_29836 ) ) ( not ( = ?auto_29834 ?auto_29837 ) ) ( not ( = ?auto_29834 ?auto_29838 ) ) ( not ( = ?auto_29835 ?auto_29836 ) ) ( not ( = ?auto_29835 ?auto_29837 ) ) ( not ( = ?auto_29835 ?auto_29838 ) ) ( not ( = ?auto_29836 ?auto_29837 ) ) ( not ( = ?auto_29836 ?auto_29838 ) ) ( not ( = ?auto_29837 ?auto_29838 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_29838 ?auto_29837 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_29839 - BLOCK
      ?auto_29840 - BLOCK
      ?auto_29841 - BLOCK
      ?auto_29842 - BLOCK
    )
    :vars
    (
      ?auto_29843 - BLOCK
      ?auto_29844 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29843 ?auto_29842 ) ( CLEAR ?auto_29843 ) ( ON-TABLE ?auto_29839 ) ( ON ?auto_29840 ?auto_29839 ) ( ON ?auto_29841 ?auto_29840 ) ( ON ?auto_29842 ?auto_29841 ) ( not ( = ?auto_29839 ?auto_29840 ) ) ( not ( = ?auto_29839 ?auto_29841 ) ) ( not ( = ?auto_29839 ?auto_29842 ) ) ( not ( = ?auto_29839 ?auto_29843 ) ) ( not ( = ?auto_29840 ?auto_29841 ) ) ( not ( = ?auto_29840 ?auto_29842 ) ) ( not ( = ?auto_29840 ?auto_29843 ) ) ( not ( = ?auto_29841 ?auto_29842 ) ) ( not ( = ?auto_29841 ?auto_29843 ) ) ( not ( = ?auto_29842 ?auto_29843 ) ) ( HOLDING ?auto_29844 ) ( not ( = ?auto_29839 ?auto_29844 ) ) ( not ( = ?auto_29840 ?auto_29844 ) ) ( not ( = ?auto_29841 ?auto_29844 ) ) ( not ( = ?auto_29842 ?auto_29844 ) ) ( not ( = ?auto_29843 ?auto_29844 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_29844 )
      ( MAKE-4PILE ?auto_29839 ?auto_29840 ?auto_29841 ?auto_29842 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_29845 - BLOCK
      ?auto_29846 - BLOCK
      ?auto_29847 - BLOCK
      ?auto_29848 - BLOCK
    )
    :vars
    (
      ?auto_29850 - BLOCK
      ?auto_29849 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29850 ?auto_29848 ) ( ON-TABLE ?auto_29845 ) ( ON ?auto_29846 ?auto_29845 ) ( ON ?auto_29847 ?auto_29846 ) ( ON ?auto_29848 ?auto_29847 ) ( not ( = ?auto_29845 ?auto_29846 ) ) ( not ( = ?auto_29845 ?auto_29847 ) ) ( not ( = ?auto_29845 ?auto_29848 ) ) ( not ( = ?auto_29845 ?auto_29850 ) ) ( not ( = ?auto_29846 ?auto_29847 ) ) ( not ( = ?auto_29846 ?auto_29848 ) ) ( not ( = ?auto_29846 ?auto_29850 ) ) ( not ( = ?auto_29847 ?auto_29848 ) ) ( not ( = ?auto_29847 ?auto_29850 ) ) ( not ( = ?auto_29848 ?auto_29850 ) ) ( not ( = ?auto_29845 ?auto_29849 ) ) ( not ( = ?auto_29846 ?auto_29849 ) ) ( not ( = ?auto_29847 ?auto_29849 ) ) ( not ( = ?auto_29848 ?auto_29849 ) ) ( not ( = ?auto_29850 ?auto_29849 ) ) ( ON ?auto_29849 ?auto_29850 ) ( CLEAR ?auto_29849 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_29845 ?auto_29846 ?auto_29847 ?auto_29848 ?auto_29850 )
      ( MAKE-4PILE ?auto_29845 ?auto_29846 ?auto_29847 ?auto_29848 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_29853 - BLOCK
      ?auto_29854 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_29854 ) ( CLEAR ?auto_29853 ) ( ON-TABLE ?auto_29853 ) ( not ( = ?auto_29853 ?auto_29854 ) ) )
    :subtasks
    ( ( !STACK ?auto_29854 ?auto_29853 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_29855 - BLOCK
      ?auto_29856 - BLOCK
    )
    :vars
    (
      ?auto_29857 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_29855 ) ( ON-TABLE ?auto_29855 ) ( not ( = ?auto_29855 ?auto_29856 ) ) ( ON ?auto_29856 ?auto_29857 ) ( CLEAR ?auto_29856 ) ( HAND-EMPTY ) ( not ( = ?auto_29855 ?auto_29857 ) ) ( not ( = ?auto_29856 ?auto_29857 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_29856 ?auto_29857 )
      ( MAKE-2PILE ?auto_29855 ?auto_29856 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_29858 - BLOCK
      ?auto_29859 - BLOCK
    )
    :vars
    (
      ?auto_29860 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29858 ?auto_29859 ) ) ( ON ?auto_29859 ?auto_29860 ) ( CLEAR ?auto_29859 ) ( not ( = ?auto_29858 ?auto_29860 ) ) ( not ( = ?auto_29859 ?auto_29860 ) ) ( HOLDING ?auto_29858 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_29858 )
      ( MAKE-2PILE ?auto_29858 ?auto_29859 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_29861 - BLOCK
      ?auto_29862 - BLOCK
    )
    :vars
    (
      ?auto_29863 - BLOCK
      ?auto_29864 - BLOCK
      ?auto_29865 - BLOCK
      ?auto_29866 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29861 ?auto_29862 ) ) ( ON ?auto_29862 ?auto_29863 ) ( not ( = ?auto_29861 ?auto_29863 ) ) ( not ( = ?auto_29862 ?auto_29863 ) ) ( ON ?auto_29861 ?auto_29862 ) ( CLEAR ?auto_29861 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_29864 ) ( ON ?auto_29865 ?auto_29864 ) ( ON ?auto_29866 ?auto_29865 ) ( ON ?auto_29863 ?auto_29866 ) ( not ( = ?auto_29864 ?auto_29865 ) ) ( not ( = ?auto_29864 ?auto_29866 ) ) ( not ( = ?auto_29864 ?auto_29863 ) ) ( not ( = ?auto_29864 ?auto_29862 ) ) ( not ( = ?auto_29864 ?auto_29861 ) ) ( not ( = ?auto_29865 ?auto_29866 ) ) ( not ( = ?auto_29865 ?auto_29863 ) ) ( not ( = ?auto_29865 ?auto_29862 ) ) ( not ( = ?auto_29865 ?auto_29861 ) ) ( not ( = ?auto_29866 ?auto_29863 ) ) ( not ( = ?auto_29866 ?auto_29862 ) ) ( not ( = ?auto_29866 ?auto_29861 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_29864 ?auto_29865 ?auto_29866 ?auto_29863 ?auto_29862 )
      ( MAKE-2PILE ?auto_29861 ?auto_29862 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_29870 - BLOCK
      ?auto_29871 - BLOCK
      ?auto_29872 - BLOCK
    )
    :vars
    (
      ?auto_29873 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29873 ?auto_29872 ) ( CLEAR ?auto_29873 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_29870 ) ( ON ?auto_29871 ?auto_29870 ) ( ON ?auto_29872 ?auto_29871 ) ( not ( = ?auto_29870 ?auto_29871 ) ) ( not ( = ?auto_29870 ?auto_29872 ) ) ( not ( = ?auto_29870 ?auto_29873 ) ) ( not ( = ?auto_29871 ?auto_29872 ) ) ( not ( = ?auto_29871 ?auto_29873 ) ) ( not ( = ?auto_29872 ?auto_29873 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_29873 ?auto_29872 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_29874 - BLOCK
      ?auto_29875 - BLOCK
      ?auto_29876 - BLOCK
    )
    :vars
    (
      ?auto_29877 - BLOCK
      ?auto_29878 - BLOCK
      ?auto_29879 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29877 ?auto_29876 ) ( CLEAR ?auto_29877 ) ( ON-TABLE ?auto_29874 ) ( ON ?auto_29875 ?auto_29874 ) ( ON ?auto_29876 ?auto_29875 ) ( not ( = ?auto_29874 ?auto_29875 ) ) ( not ( = ?auto_29874 ?auto_29876 ) ) ( not ( = ?auto_29874 ?auto_29877 ) ) ( not ( = ?auto_29875 ?auto_29876 ) ) ( not ( = ?auto_29875 ?auto_29877 ) ) ( not ( = ?auto_29876 ?auto_29877 ) ) ( HOLDING ?auto_29878 ) ( CLEAR ?auto_29879 ) ( not ( = ?auto_29874 ?auto_29878 ) ) ( not ( = ?auto_29874 ?auto_29879 ) ) ( not ( = ?auto_29875 ?auto_29878 ) ) ( not ( = ?auto_29875 ?auto_29879 ) ) ( not ( = ?auto_29876 ?auto_29878 ) ) ( not ( = ?auto_29876 ?auto_29879 ) ) ( not ( = ?auto_29877 ?auto_29878 ) ) ( not ( = ?auto_29877 ?auto_29879 ) ) ( not ( = ?auto_29878 ?auto_29879 ) ) )
    :subtasks
    ( ( !STACK ?auto_29878 ?auto_29879 )
      ( MAKE-3PILE ?auto_29874 ?auto_29875 ?auto_29876 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_30242 - BLOCK
      ?auto_30243 - BLOCK
      ?auto_30244 - BLOCK
    )
    :vars
    (
      ?auto_30246 - BLOCK
      ?auto_30245 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30246 ?auto_30244 ) ( ON-TABLE ?auto_30242 ) ( ON ?auto_30243 ?auto_30242 ) ( ON ?auto_30244 ?auto_30243 ) ( not ( = ?auto_30242 ?auto_30243 ) ) ( not ( = ?auto_30242 ?auto_30244 ) ) ( not ( = ?auto_30242 ?auto_30246 ) ) ( not ( = ?auto_30243 ?auto_30244 ) ) ( not ( = ?auto_30243 ?auto_30246 ) ) ( not ( = ?auto_30244 ?auto_30246 ) ) ( not ( = ?auto_30242 ?auto_30245 ) ) ( not ( = ?auto_30243 ?auto_30245 ) ) ( not ( = ?auto_30244 ?auto_30245 ) ) ( not ( = ?auto_30246 ?auto_30245 ) ) ( ON ?auto_30245 ?auto_30246 ) ( CLEAR ?auto_30245 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_30242 ?auto_30243 ?auto_30244 ?auto_30246 )
      ( MAKE-3PILE ?auto_30242 ?auto_30243 ?auto_30244 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_29886 - BLOCK
      ?auto_29887 - BLOCK
      ?auto_29888 - BLOCK
    )
    :vars
    (
      ?auto_29891 - BLOCK
      ?auto_29889 - BLOCK
      ?auto_29890 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29891 ?auto_29888 ) ( ON-TABLE ?auto_29886 ) ( ON ?auto_29887 ?auto_29886 ) ( ON ?auto_29888 ?auto_29887 ) ( not ( = ?auto_29886 ?auto_29887 ) ) ( not ( = ?auto_29886 ?auto_29888 ) ) ( not ( = ?auto_29886 ?auto_29891 ) ) ( not ( = ?auto_29887 ?auto_29888 ) ) ( not ( = ?auto_29887 ?auto_29891 ) ) ( not ( = ?auto_29888 ?auto_29891 ) ) ( not ( = ?auto_29886 ?auto_29889 ) ) ( not ( = ?auto_29886 ?auto_29890 ) ) ( not ( = ?auto_29887 ?auto_29889 ) ) ( not ( = ?auto_29887 ?auto_29890 ) ) ( not ( = ?auto_29888 ?auto_29889 ) ) ( not ( = ?auto_29888 ?auto_29890 ) ) ( not ( = ?auto_29891 ?auto_29889 ) ) ( not ( = ?auto_29891 ?auto_29890 ) ) ( not ( = ?auto_29889 ?auto_29890 ) ) ( ON ?auto_29889 ?auto_29891 ) ( CLEAR ?auto_29889 ) ( HOLDING ?auto_29890 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_29890 )
      ( MAKE-3PILE ?auto_29886 ?auto_29887 ?auto_29888 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_29892 - BLOCK
      ?auto_29893 - BLOCK
      ?auto_29894 - BLOCK
    )
    :vars
    (
      ?auto_29896 - BLOCK
      ?auto_29895 - BLOCK
      ?auto_29897 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29896 ?auto_29894 ) ( ON-TABLE ?auto_29892 ) ( ON ?auto_29893 ?auto_29892 ) ( ON ?auto_29894 ?auto_29893 ) ( not ( = ?auto_29892 ?auto_29893 ) ) ( not ( = ?auto_29892 ?auto_29894 ) ) ( not ( = ?auto_29892 ?auto_29896 ) ) ( not ( = ?auto_29893 ?auto_29894 ) ) ( not ( = ?auto_29893 ?auto_29896 ) ) ( not ( = ?auto_29894 ?auto_29896 ) ) ( not ( = ?auto_29892 ?auto_29895 ) ) ( not ( = ?auto_29892 ?auto_29897 ) ) ( not ( = ?auto_29893 ?auto_29895 ) ) ( not ( = ?auto_29893 ?auto_29897 ) ) ( not ( = ?auto_29894 ?auto_29895 ) ) ( not ( = ?auto_29894 ?auto_29897 ) ) ( not ( = ?auto_29896 ?auto_29895 ) ) ( not ( = ?auto_29896 ?auto_29897 ) ) ( not ( = ?auto_29895 ?auto_29897 ) ) ( ON ?auto_29895 ?auto_29896 ) ( ON ?auto_29897 ?auto_29895 ) ( CLEAR ?auto_29897 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_29892 ?auto_29893 ?auto_29894 ?auto_29896 ?auto_29895 )
      ( MAKE-3PILE ?auto_29892 ?auto_29893 ?auto_29894 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_29901 - BLOCK
      ?auto_29902 - BLOCK
      ?auto_29903 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_29903 ) ( CLEAR ?auto_29902 ) ( ON-TABLE ?auto_29901 ) ( ON ?auto_29902 ?auto_29901 ) ( not ( = ?auto_29901 ?auto_29902 ) ) ( not ( = ?auto_29901 ?auto_29903 ) ) ( not ( = ?auto_29902 ?auto_29903 ) ) )
    :subtasks
    ( ( !STACK ?auto_29903 ?auto_29902 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_29904 - BLOCK
      ?auto_29905 - BLOCK
      ?auto_29906 - BLOCK
    )
    :vars
    (
      ?auto_29907 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_29905 ) ( ON-TABLE ?auto_29904 ) ( ON ?auto_29905 ?auto_29904 ) ( not ( = ?auto_29904 ?auto_29905 ) ) ( not ( = ?auto_29904 ?auto_29906 ) ) ( not ( = ?auto_29905 ?auto_29906 ) ) ( ON ?auto_29906 ?auto_29907 ) ( CLEAR ?auto_29906 ) ( HAND-EMPTY ) ( not ( = ?auto_29904 ?auto_29907 ) ) ( not ( = ?auto_29905 ?auto_29907 ) ) ( not ( = ?auto_29906 ?auto_29907 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_29906 ?auto_29907 )
      ( MAKE-3PILE ?auto_29904 ?auto_29905 ?auto_29906 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_29908 - BLOCK
      ?auto_29909 - BLOCK
      ?auto_29910 - BLOCK
    )
    :vars
    (
      ?auto_29911 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_29908 ) ( not ( = ?auto_29908 ?auto_29909 ) ) ( not ( = ?auto_29908 ?auto_29910 ) ) ( not ( = ?auto_29909 ?auto_29910 ) ) ( ON ?auto_29910 ?auto_29911 ) ( CLEAR ?auto_29910 ) ( not ( = ?auto_29908 ?auto_29911 ) ) ( not ( = ?auto_29909 ?auto_29911 ) ) ( not ( = ?auto_29910 ?auto_29911 ) ) ( HOLDING ?auto_29909 ) ( CLEAR ?auto_29908 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_29908 ?auto_29909 )
      ( MAKE-3PILE ?auto_29908 ?auto_29909 ?auto_29910 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_29912 - BLOCK
      ?auto_29913 - BLOCK
      ?auto_29914 - BLOCK
    )
    :vars
    (
      ?auto_29915 - BLOCK
      ?auto_29917 - BLOCK
      ?auto_29916 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_29912 ) ( not ( = ?auto_29912 ?auto_29913 ) ) ( not ( = ?auto_29912 ?auto_29914 ) ) ( not ( = ?auto_29913 ?auto_29914 ) ) ( ON ?auto_29914 ?auto_29915 ) ( not ( = ?auto_29912 ?auto_29915 ) ) ( not ( = ?auto_29913 ?auto_29915 ) ) ( not ( = ?auto_29914 ?auto_29915 ) ) ( CLEAR ?auto_29912 ) ( ON ?auto_29913 ?auto_29914 ) ( CLEAR ?auto_29913 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_29917 ) ( ON ?auto_29916 ?auto_29917 ) ( ON ?auto_29915 ?auto_29916 ) ( not ( = ?auto_29917 ?auto_29916 ) ) ( not ( = ?auto_29917 ?auto_29915 ) ) ( not ( = ?auto_29917 ?auto_29914 ) ) ( not ( = ?auto_29917 ?auto_29913 ) ) ( not ( = ?auto_29916 ?auto_29915 ) ) ( not ( = ?auto_29916 ?auto_29914 ) ) ( not ( = ?auto_29916 ?auto_29913 ) ) ( not ( = ?auto_29912 ?auto_29917 ) ) ( not ( = ?auto_29912 ?auto_29916 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_29917 ?auto_29916 ?auto_29915 ?auto_29914 )
      ( MAKE-3PILE ?auto_29912 ?auto_29913 ?auto_29914 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_29918 - BLOCK
      ?auto_29919 - BLOCK
      ?auto_29920 - BLOCK
    )
    :vars
    (
      ?auto_29922 - BLOCK
      ?auto_29923 - BLOCK
      ?auto_29921 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29918 ?auto_29919 ) ) ( not ( = ?auto_29918 ?auto_29920 ) ) ( not ( = ?auto_29919 ?auto_29920 ) ) ( ON ?auto_29920 ?auto_29922 ) ( not ( = ?auto_29918 ?auto_29922 ) ) ( not ( = ?auto_29919 ?auto_29922 ) ) ( not ( = ?auto_29920 ?auto_29922 ) ) ( ON ?auto_29919 ?auto_29920 ) ( CLEAR ?auto_29919 ) ( ON-TABLE ?auto_29923 ) ( ON ?auto_29921 ?auto_29923 ) ( ON ?auto_29922 ?auto_29921 ) ( not ( = ?auto_29923 ?auto_29921 ) ) ( not ( = ?auto_29923 ?auto_29922 ) ) ( not ( = ?auto_29923 ?auto_29920 ) ) ( not ( = ?auto_29923 ?auto_29919 ) ) ( not ( = ?auto_29921 ?auto_29922 ) ) ( not ( = ?auto_29921 ?auto_29920 ) ) ( not ( = ?auto_29921 ?auto_29919 ) ) ( not ( = ?auto_29918 ?auto_29923 ) ) ( not ( = ?auto_29918 ?auto_29921 ) ) ( HOLDING ?auto_29918 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_29918 )
      ( MAKE-3PILE ?auto_29918 ?auto_29919 ?auto_29920 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_29924 - BLOCK
      ?auto_29925 - BLOCK
      ?auto_29926 - BLOCK
    )
    :vars
    (
      ?auto_29927 - BLOCK
      ?auto_29928 - BLOCK
      ?auto_29929 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29924 ?auto_29925 ) ) ( not ( = ?auto_29924 ?auto_29926 ) ) ( not ( = ?auto_29925 ?auto_29926 ) ) ( ON ?auto_29926 ?auto_29927 ) ( not ( = ?auto_29924 ?auto_29927 ) ) ( not ( = ?auto_29925 ?auto_29927 ) ) ( not ( = ?auto_29926 ?auto_29927 ) ) ( ON ?auto_29925 ?auto_29926 ) ( ON-TABLE ?auto_29928 ) ( ON ?auto_29929 ?auto_29928 ) ( ON ?auto_29927 ?auto_29929 ) ( not ( = ?auto_29928 ?auto_29929 ) ) ( not ( = ?auto_29928 ?auto_29927 ) ) ( not ( = ?auto_29928 ?auto_29926 ) ) ( not ( = ?auto_29928 ?auto_29925 ) ) ( not ( = ?auto_29929 ?auto_29927 ) ) ( not ( = ?auto_29929 ?auto_29926 ) ) ( not ( = ?auto_29929 ?auto_29925 ) ) ( not ( = ?auto_29924 ?auto_29928 ) ) ( not ( = ?auto_29924 ?auto_29929 ) ) ( ON ?auto_29924 ?auto_29925 ) ( CLEAR ?auto_29924 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_29928 ?auto_29929 ?auto_29927 ?auto_29926 ?auto_29925 )
      ( MAKE-3PILE ?auto_29924 ?auto_29925 ?auto_29926 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_29932 - BLOCK
      ?auto_29933 - BLOCK
    )
    :vars
    (
      ?auto_29934 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29934 ?auto_29933 ) ( CLEAR ?auto_29934 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_29932 ) ( ON ?auto_29933 ?auto_29932 ) ( not ( = ?auto_29932 ?auto_29933 ) ) ( not ( = ?auto_29932 ?auto_29934 ) ) ( not ( = ?auto_29933 ?auto_29934 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_29934 ?auto_29933 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_29935 - BLOCK
      ?auto_29936 - BLOCK
    )
    :vars
    (
      ?auto_29937 - BLOCK
      ?auto_29938 - BLOCK
      ?auto_29939 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29937 ?auto_29936 ) ( CLEAR ?auto_29937 ) ( ON-TABLE ?auto_29935 ) ( ON ?auto_29936 ?auto_29935 ) ( not ( = ?auto_29935 ?auto_29936 ) ) ( not ( = ?auto_29935 ?auto_29937 ) ) ( not ( = ?auto_29936 ?auto_29937 ) ) ( HOLDING ?auto_29938 ) ( CLEAR ?auto_29939 ) ( not ( = ?auto_29935 ?auto_29938 ) ) ( not ( = ?auto_29935 ?auto_29939 ) ) ( not ( = ?auto_29936 ?auto_29938 ) ) ( not ( = ?auto_29936 ?auto_29939 ) ) ( not ( = ?auto_29937 ?auto_29938 ) ) ( not ( = ?auto_29937 ?auto_29939 ) ) ( not ( = ?auto_29938 ?auto_29939 ) ) )
    :subtasks
    ( ( !STACK ?auto_29938 ?auto_29939 )
      ( MAKE-2PILE ?auto_29935 ?auto_29936 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_29940 - BLOCK
      ?auto_29941 - BLOCK
    )
    :vars
    (
      ?auto_29944 - BLOCK
      ?auto_29942 - BLOCK
      ?auto_29943 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29944 ?auto_29941 ) ( ON-TABLE ?auto_29940 ) ( ON ?auto_29941 ?auto_29940 ) ( not ( = ?auto_29940 ?auto_29941 ) ) ( not ( = ?auto_29940 ?auto_29944 ) ) ( not ( = ?auto_29941 ?auto_29944 ) ) ( CLEAR ?auto_29942 ) ( not ( = ?auto_29940 ?auto_29943 ) ) ( not ( = ?auto_29940 ?auto_29942 ) ) ( not ( = ?auto_29941 ?auto_29943 ) ) ( not ( = ?auto_29941 ?auto_29942 ) ) ( not ( = ?auto_29944 ?auto_29943 ) ) ( not ( = ?auto_29944 ?auto_29942 ) ) ( not ( = ?auto_29943 ?auto_29942 ) ) ( ON ?auto_29943 ?auto_29944 ) ( CLEAR ?auto_29943 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_29940 ?auto_29941 ?auto_29944 )
      ( MAKE-2PILE ?auto_29940 ?auto_29941 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_29945 - BLOCK
      ?auto_29946 - BLOCK
    )
    :vars
    (
      ?auto_29949 - BLOCK
      ?auto_29948 - BLOCK
      ?auto_29947 - BLOCK
      ?auto_29950 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29949 ?auto_29946 ) ( ON-TABLE ?auto_29945 ) ( ON ?auto_29946 ?auto_29945 ) ( not ( = ?auto_29945 ?auto_29946 ) ) ( not ( = ?auto_29945 ?auto_29949 ) ) ( not ( = ?auto_29946 ?auto_29949 ) ) ( not ( = ?auto_29945 ?auto_29948 ) ) ( not ( = ?auto_29945 ?auto_29947 ) ) ( not ( = ?auto_29946 ?auto_29948 ) ) ( not ( = ?auto_29946 ?auto_29947 ) ) ( not ( = ?auto_29949 ?auto_29948 ) ) ( not ( = ?auto_29949 ?auto_29947 ) ) ( not ( = ?auto_29948 ?auto_29947 ) ) ( ON ?auto_29948 ?auto_29949 ) ( CLEAR ?auto_29948 ) ( HOLDING ?auto_29947 ) ( CLEAR ?auto_29950 ) ( ON-TABLE ?auto_29950 ) ( not ( = ?auto_29950 ?auto_29947 ) ) ( not ( = ?auto_29945 ?auto_29950 ) ) ( not ( = ?auto_29946 ?auto_29950 ) ) ( not ( = ?auto_29949 ?auto_29950 ) ) ( not ( = ?auto_29948 ?auto_29950 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_29950 ?auto_29947 )
      ( MAKE-2PILE ?auto_29945 ?auto_29946 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_30369 - BLOCK
      ?auto_30370 - BLOCK
    )
    :vars
    (
      ?auto_30372 - BLOCK
      ?auto_30373 - BLOCK
      ?auto_30371 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30372 ?auto_30370 ) ( ON-TABLE ?auto_30369 ) ( ON ?auto_30370 ?auto_30369 ) ( not ( = ?auto_30369 ?auto_30370 ) ) ( not ( = ?auto_30369 ?auto_30372 ) ) ( not ( = ?auto_30370 ?auto_30372 ) ) ( not ( = ?auto_30369 ?auto_30373 ) ) ( not ( = ?auto_30369 ?auto_30371 ) ) ( not ( = ?auto_30370 ?auto_30373 ) ) ( not ( = ?auto_30370 ?auto_30371 ) ) ( not ( = ?auto_30372 ?auto_30373 ) ) ( not ( = ?auto_30372 ?auto_30371 ) ) ( not ( = ?auto_30373 ?auto_30371 ) ) ( ON ?auto_30373 ?auto_30372 ) ( ON ?auto_30371 ?auto_30373 ) ( CLEAR ?auto_30371 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_30369 ?auto_30370 ?auto_30372 ?auto_30373 )
      ( MAKE-2PILE ?auto_30369 ?auto_30370 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_29957 - BLOCK
      ?auto_29958 - BLOCK
    )
    :vars
    (
      ?auto_29961 - BLOCK
      ?auto_29962 - BLOCK
      ?auto_29960 - BLOCK
      ?auto_29959 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29961 ?auto_29958 ) ( ON-TABLE ?auto_29957 ) ( ON ?auto_29958 ?auto_29957 ) ( not ( = ?auto_29957 ?auto_29958 ) ) ( not ( = ?auto_29957 ?auto_29961 ) ) ( not ( = ?auto_29958 ?auto_29961 ) ) ( not ( = ?auto_29957 ?auto_29962 ) ) ( not ( = ?auto_29957 ?auto_29960 ) ) ( not ( = ?auto_29958 ?auto_29962 ) ) ( not ( = ?auto_29958 ?auto_29960 ) ) ( not ( = ?auto_29961 ?auto_29962 ) ) ( not ( = ?auto_29961 ?auto_29960 ) ) ( not ( = ?auto_29962 ?auto_29960 ) ) ( ON ?auto_29962 ?auto_29961 ) ( not ( = ?auto_29959 ?auto_29960 ) ) ( not ( = ?auto_29957 ?auto_29959 ) ) ( not ( = ?auto_29958 ?auto_29959 ) ) ( not ( = ?auto_29961 ?auto_29959 ) ) ( not ( = ?auto_29962 ?auto_29959 ) ) ( ON ?auto_29960 ?auto_29962 ) ( CLEAR ?auto_29960 ) ( HOLDING ?auto_29959 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_29959 )
      ( MAKE-2PILE ?auto_29957 ?auto_29958 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_29963 - BLOCK
      ?auto_29964 - BLOCK
    )
    :vars
    (
      ?auto_29965 - BLOCK
      ?auto_29966 - BLOCK
      ?auto_29968 - BLOCK
      ?auto_29967 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29965 ?auto_29964 ) ( ON-TABLE ?auto_29963 ) ( ON ?auto_29964 ?auto_29963 ) ( not ( = ?auto_29963 ?auto_29964 ) ) ( not ( = ?auto_29963 ?auto_29965 ) ) ( not ( = ?auto_29964 ?auto_29965 ) ) ( not ( = ?auto_29963 ?auto_29966 ) ) ( not ( = ?auto_29963 ?auto_29968 ) ) ( not ( = ?auto_29964 ?auto_29966 ) ) ( not ( = ?auto_29964 ?auto_29968 ) ) ( not ( = ?auto_29965 ?auto_29966 ) ) ( not ( = ?auto_29965 ?auto_29968 ) ) ( not ( = ?auto_29966 ?auto_29968 ) ) ( ON ?auto_29966 ?auto_29965 ) ( not ( = ?auto_29967 ?auto_29968 ) ) ( not ( = ?auto_29963 ?auto_29967 ) ) ( not ( = ?auto_29964 ?auto_29967 ) ) ( not ( = ?auto_29965 ?auto_29967 ) ) ( not ( = ?auto_29966 ?auto_29967 ) ) ( ON ?auto_29968 ?auto_29966 ) ( ON ?auto_29967 ?auto_29968 ) ( CLEAR ?auto_29967 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_29963 ?auto_29964 ?auto_29965 ?auto_29966 ?auto_29968 )
      ( MAKE-2PILE ?auto_29963 ?auto_29964 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_29973 - BLOCK
      ?auto_29974 - BLOCK
      ?auto_29975 - BLOCK
      ?auto_29976 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_29976 ) ( CLEAR ?auto_29975 ) ( ON-TABLE ?auto_29973 ) ( ON ?auto_29974 ?auto_29973 ) ( ON ?auto_29975 ?auto_29974 ) ( not ( = ?auto_29973 ?auto_29974 ) ) ( not ( = ?auto_29973 ?auto_29975 ) ) ( not ( = ?auto_29973 ?auto_29976 ) ) ( not ( = ?auto_29974 ?auto_29975 ) ) ( not ( = ?auto_29974 ?auto_29976 ) ) ( not ( = ?auto_29975 ?auto_29976 ) ) )
    :subtasks
    ( ( !STACK ?auto_29976 ?auto_29975 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_29977 - BLOCK
      ?auto_29978 - BLOCK
      ?auto_29979 - BLOCK
      ?auto_29980 - BLOCK
    )
    :vars
    (
      ?auto_29981 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_29979 ) ( ON-TABLE ?auto_29977 ) ( ON ?auto_29978 ?auto_29977 ) ( ON ?auto_29979 ?auto_29978 ) ( not ( = ?auto_29977 ?auto_29978 ) ) ( not ( = ?auto_29977 ?auto_29979 ) ) ( not ( = ?auto_29977 ?auto_29980 ) ) ( not ( = ?auto_29978 ?auto_29979 ) ) ( not ( = ?auto_29978 ?auto_29980 ) ) ( not ( = ?auto_29979 ?auto_29980 ) ) ( ON ?auto_29980 ?auto_29981 ) ( CLEAR ?auto_29980 ) ( HAND-EMPTY ) ( not ( = ?auto_29977 ?auto_29981 ) ) ( not ( = ?auto_29978 ?auto_29981 ) ) ( not ( = ?auto_29979 ?auto_29981 ) ) ( not ( = ?auto_29980 ?auto_29981 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_29980 ?auto_29981 )
      ( MAKE-4PILE ?auto_29977 ?auto_29978 ?auto_29979 ?auto_29980 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_29982 - BLOCK
      ?auto_29983 - BLOCK
      ?auto_29984 - BLOCK
      ?auto_29985 - BLOCK
    )
    :vars
    (
      ?auto_29986 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_29982 ) ( ON ?auto_29983 ?auto_29982 ) ( not ( = ?auto_29982 ?auto_29983 ) ) ( not ( = ?auto_29982 ?auto_29984 ) ) ( not ( = ?auto_29982 ?auto_29985 ) ) ( not ( = ?auto_29983 ?auto_29984 ) ) ( not ( = ?auto_29983 ?auto_29985 ) ) ( not ( = ?auto_29984 ?auto_29985 ) ) ( ON ?auto_29985 ?auto_29986 ) ( CLEAR ?auto_29985 ) ( not ( = ?auto_29982 ?auto_29986 ) ) ( not ( = ?auto_29983 ?auto_29986 ) ) ( not ( = ?auto_29984 ?auto_29986 ) ) ( not ( = ?auto_29985 ?auto_29986 ) ) ( HOLDING ?auto_29984 ) ( CLEAR ?auto_29983 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_29982 ?auto_29983 ?auto_29984 )
      ( MAKE-4PILE ?auto_29982 ?auto_29983 ?auto_29984 ?auto_29985 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_29987 - BLOCK
      ?auto_29988 - BLOCK
      ?auto_29989 - BLOCK
      ?auto_29990 - BLOCK
    )
    :vars
    (
      ?auto_29991 - BLOCK
      ?auto_29992 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_29987 ) ( ON ?auto_29988 ?auto_29987 ) ( not ( = ?auto_29987 ?auto_29988 ) ) ( not ( = ?auto_29987 ?auto_29989 ) ) ( not ( = ?auto_29987 ?auto_29990 ) ) ( not ( = ?auto_29988 ?auto_29989 ) ) ( not ( = ?auto_29988 ?auto_29990 ) ) ( not ( = ?auto_29989 ?auto_29990 ) ) ( ON ?auto_29990 ?auto_29991 ) ( not ( = ?auto_29987 ?auto_29991 ) ) ( not ( = ?auto_29988 ?auto_29991 ) ) ( not ( = ?auto_29989 ?auto_29991 ) ) ( not ( = ?auto_29990 ?auto_29991 ) ) ( CLEAR ?auto_29988 ) ( ON ?auto_29989 ?auto_29990 ) ( CLEAR ?auto_29989 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_29992 ) ( ON ?auto_29991 ?auto_29992 ) ( not ( = ?auto_29992 ?auto_29991 ) ) ( not ( = ?auto_29992 ?auto_29990 ) ) ( not ( = ?auto_29992 ?auto_29989 ) ) ( not ( = ?auto_29987 ?auto_29992 ) ) ( not ( = ?auto_29988 ?auto_29992 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_29992 ?auto_29991 ?auto_29990 )
      ( MAKE-4PILE ?auto_29987 ?auto_29988 ?auto_29989 ?auto_29990 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_29993 - BLOCK
      ?auto_29994 - BLOCK
      ?auto_29995 - BLOCK
      ?auto_29996 - BLOCK
    )
    :vars
    (
      ?auto_29997 - BLOCK
      ?auto_29998 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_29993 ) ( not ( = ?auto_29993 ?auto_29994 ) ) ( not ( = ?auto_29993 ?auto_29995 ) ) ( not ( = ?auto_29993 ?auto_29996 ) ) ( not ( = ?auto_29994 ?auto_29995 ) ) ( not ( = ?auto_29994 ?auto_29996 ) ) ( not ( = ?auto_29995 ?auto_29996 ) ) ( ON ?auto_29996 ?auto_29997 ) ( not ( = ?auto_29993 ?auto_29997 ) ) ( not ( = ?auto_29994 ?auto_29997 ) ) ( not ( = ?auto_29995 ?auto_29997 ) ) ( not ( = ?auto_29996 ?auto_29997 ) ) ( ON ?auto_29995 ?auto_29996 ) ( CLEAR ?auto_29995 ) ( ON-TABLE ?auto_29998 ) ( ON ?auto_29997 ?auto_29998 ) ( not ( = ?auto_29998 ?auto_29997 ) ) ( not ( = ?auto_29998 ?auto_29996 ) ) ( not ( = ?auto_29998 ?auto_29995 ) ) ( not ( = ?auto_29993 ?auto_29998 ) ) ( not ( = ?auto_29994 ?auto_29998 ) ) ( HOLDING ?auto_29994 ) ( CLEAR ?auto_29993 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_29993 ?auto_29994 )
      ( MAKE-4PILE ?auto_29993 ?auto_29994 ?auto_29995 ?auto_29996 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_29999 - BLOCK
      ?auto_30000 - BLOCK
      ?auto_30001 - BLOCK
      ?auto_30002 - BLOCK
    )
    :vars
    (
      ?auto_30004 - BLOCK
      ?auto_30003 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_29999 ) ( not ( = ?auto_29999 ?auto_30000 ) ) ( not ( = ?auto_29999 ?auto_30001 ) ) ( not ( = ?auto_29999 ?auto_30002 ) ) ( not ( = ?auto_30000 ?auto_30001 ) ) ( not ( = ?auto_30000 ?auto_30002 ) ) ( not ( = ?auto_30001 ?auto_30002 ) ) ( ON ?auto_30002 ?auto_30004 ) ( not ( = ?auto_29999 ?auto_30004 ) ) ( not ( = ?auto_30000 ?auto_30004 ) ) ( not ( = ?auto_30001 ?auto_30004 ) ) ( not ( = ?auto_30002 ?auto_30004 ) ) ( ON ?auto_30001 ?auto_30002 ) ( ON-TABLE ?auto_30003 ) ( ON ?auto_30004 ?auto_30003 ) ( not ( = ?auto_30003 ?auto_30004 ) ) ( not ( = ?auto_30003 ?auto_30002 ) ) ( not ( = ?auto_30003 ?auto_30001 ) ) ( not ( = ?auto_29999 ?auto_30003 ) ) ( not ( = ?auto_30000 ?auto_30003 ) ) ( CLEAR ?auto_29999 ) ( ON ?auto_30000 ?auto_30001 ) ( CLEAR ?auto_30000 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_30003 ?auto_30004 ?auto_30002 ?auto_30001 )
      ( MAKE-4PILE ?auto_29999 ?auto_30000 ?auto_30001 ?auto_30002 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_30005 - BLOCK
      ?auto_30006 - BLOCK
      ?auto_30007 - BLOCK
      ?auto_30008 - BLOCK
    )
    :vars
    (
      ?auto_30010 - BLOCK
      ?auto_30009 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30005 ?auto_30006 ) ) ( not ( = ?auto_30005 ?auto_30007 ) ) ( not ( = ?auto_30005 ?auto_30008 ) ) ( not ( = ?auto_30006 ?auto_30007 ) ) ( not ( = ?auto_30006 ?auto_30008 ) ) ( not ( = ?auto_30007 ?auto_30008 ) ) ( ON ?auto_30008 ?auto_30010 ) ( not ( = ?auto_30005 ?auto_30010 ) ) ( not ( = ?auto_30006 ?auto_30010 ) ) ( not ( = ?auto_30007 ?auto_30010 ) ) ( not ( = ?auto_30008 ?auto_30010 ) ) ( ON ?auto_30007 ?auto_30008 ) ( ON-TABLE ?auto_30009 ) ( ON ?auto_30010 ?auto_30009 ) ( not ( = ?auto_30009 ?auto_30010 ) ) ( not ( = ?auto_30009 ?auto_30008 ) ) ( not ( = ?auto_30009 ?auto_30007 ) ) ( not ( = ?auto_30005 ?auto_30009 ) ) ( not ( = ?auto_30006 ?auto_30009 ) ) ( ON ?auto_30006 ?auto_30007 ) ( CLEAR ?auto_30006 ) ( HOLDING ?auto_30005 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_30005 )
      ( MAKE-4PILE ?auto_30005 ?auto_30006 ?auto_30007 ?auto_30008 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_30011 - BLOCK
      ?auto_30012 - BLOCK
      ?auto_30013 - BLOCK
      ?auto_30014 - BLOCK
    )
    :vars
    (
      ?auto_30015 - BLOCK
      ?auto_30016 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30011 ?auto_30012 ) ) ( not ( = ?auto_30011 ?auto_30013 ) ) ( not ( = ?auto_30011 ?auto_30014 ) ) ( not ( = ?auto_30012 ?auto_30013 ) ) ( not ( = ?auto_30012 ?auto_30014 ) ) ( not ( = ?auto_30013 ?auto_30014 ) ) ( ON ?auto_30014 ?auto_30015 ) ( not ( = ?auto_30011 ?auto_30015 ) ) ( not ( = ?auto_30012 ?auto_30015 ) ) ( not ( = ?auto_30013 ?auto_30015 ) ) ( not ( = ?auto_30014 ?auto_30015 ) ) ( ON ?auto_30013 ?auto_30014 ) ( ON-TABLE ?auto_30016 ) ( ON ?auto_30015 ?auto_30016 ) ( not ( = ?auto_30016 ?auto_30015 ) ) ( not ( = ?auto_30016 ?auto_30014 ) ) ( not ( = ?auto_30016 ?auto_30013 ) ) ( not ( = ?auto_30011 ?auto_30016 ) ) ( not ( = ?auto_30012 ?auto_30016 ) ) ( ON ?auto_30012 ?auto_30013 ) ( ON ?auto_30011 ?auto_30012 ) ( CLEAR ?auto_30011 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_30016 ?auto_30015 ?auto_30014 ?auto_30013 ?auto_30012 )
      ( MAKE-4PILE ?auto_30011 ?auto_30012 ?auto_30013 ?auto_30014 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_30018 - BLOCK
    )
    :vars
    (
      ?auto_30019 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30019 ?auto_30018 ) ( CLEAR ?auto_30019 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_30018 ) ( not ( = ?auto_30018 ?auto_30019 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_30019 ?auto_30018 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_30020 - BLOCK
    )
    :vars
    (
      ?auto_30021 - BLOCK
      ?auto_30022 - BLOCK
      ?auto_30023 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30021 ?auto_30020 ) ( CLEAR ?auto_30021 ) ( ON-TABLE ?auto_30020 ) ( not ( = ?auto_30020 ?auto_30021 ) ) ( HOLDING ?auto_30022 ) ( CLEAR ?auto_30023 ) ( not ( = ?auto_30020 ?auto_30022 ) ) ( not ( = ?auto_30020 ?auto_30023 ) ) ( not ( = ?auto_30021 ?auto_30022 ) ) ( not ( = ?auto_30021 ?auto_30023 ) ) ( not ( = ?auto_30022 ?auto_30023 ) ) )
    :subtasks
    ( ( !STACK ?auto_30022 ?auto_30023 )
      ( MAKE-1PILE ?auto_30020 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_30024 - BLOCK
    )
    :vars
    (
      ?auto_30026 - BLOCK
      ?auto_30027 - BLOCK
      ?auto_30025 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30026 ?auto_30024 ) ( ON-TABLE ?auto_30024 ) ( not ( = ?auto_30024 ?auto_30026 ) ) ( CLEAR ?auto_30027 ) ( not ( = ?auto_30024 ?auto_30025 ) ) ( not ( = ?auto_30024 ?auto_30027 ) ) ( not ( = ?auto_30026 ?auto_30025 ) ) ( not ( = ?auto_30026 ?auto_30027 ) ) ( not ( = ?auto_30025 ?auto_30027 ) ) ( ON ?auto_30025 ?auto_30026 ) ( CLEAR ?auto_30025 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_30024 ?auto_30026 )
      ( MAKE-1PILE ?auto_30024 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_30028 - BLOCK
    )
    :vars
    (
      ?auto_30029 - BLOCK
      ?auto_30031 - BLOCK
      ?auto_30030 - BLOCK
      ?auto_30032 - BLOCK
      ?auto_30033 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30029 ?auto_30028 ) ( ON-TABLE ?auto_30028 ) ( not ( = ?auto_30028 ?auto_30029 ) ) ( not ( = ?auto_30028 ?auto_30031 ) ) ( not ( = ?auto_30028 ?auto_30030 ) ) ( not ( = ?auto_30029 ?auto_30031 ) ) ( not ( = ?auto_30029 ?auto_30030 ) ) ( not ( = ?auto_30031 ?auto_30030 ) ) ( ON ?auto_30031 ?auto_30029 ) ( CLEAR ?auto_30031 ) ( HOLDING ?auto_30030 ) ( CLEAR ?auto_30032 ) ( ON-TABLE ?auto_30033 ) ( ON ?auto_30032 ?auto_30033 ) ( not ( = ?auto_30033 ?auto_30032 ) ) ( not ( = ?auto_30033 ?auto_30030 ) ) ( not ( = ?auto_30032 ?auto_30030 ) ) ( not ( = ?auto_30028 ?auto_30032 ) ) ( not ( = ?auto_30028 ?auto_30033 ) ) ( not ( = ?auto_30029 ?auto_30032 ) ) ( not ( = ?auto_30029 ?auto_30033 ) ) ( not ( = ?auto_30031 ?auto_30032 ) ) ( not ( = ?auto_30031 ?auto_30033 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_30033 ?auto_30032 ?auto_30030 )
      ( MAKE-1PILE ?auto_30028 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_30034 - BLOCK
    )
    :vars
    (
      ?auto_30037 - BLOCK
      ?auto_30039 - BLOCK
      ?auto_30035 - BLOCK
      ?auto_30036 - BLOCK
      ?auto_30038 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30037 ?auto_30034 ) ( ON-TABLE ?auto_30034 ) ( not ( = ?auto_30034 ?auto_30037 ) ) ( not ( = ?auto_30034 ?auto_30039 ) ) ( not ( = ?auto_30034 ?auto_30035 ) ) ( not ( = ?auto_30037 ?auto_30039 ) ) ( not ( = ?auto_30037 ?auto_30035 ) ) ( not ( = ?auto_30039 ?auto_30035 ) ) ( ON ?auto_30039 ?auto_30037 ) ( CLEAR ?auto_30036 ) ( ON-TABLE ?auto_30038 ) ( ON ?auto_30036 ?auto_30038 ) ( not ( = ?auto_30038 ?auto_30036 ) ) ( not ( = ?auto_30038 ?auto_30035 ) ) ( not ( = ?auto_30036 ?auto_30035 ) ) ( not ( = ?auto_30034 ?auto_30036 ) ) ( not ( = ?auto_30034 ?auto_30038 ) ) ( not ( = ?auto_30037 ?auto_30036 ) ) ( not ( = ?auto_30037 ?auto_30038 ) ) ( not ( = ?auto_30039 ?auto_30036 ) ) ( not ( = ?auto_30039 ?auto_30038 ) ) ( ON ?auto_30035 ?auto_30039 ) ( CLEAR ?auto_30035 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_30034 ?auto_30037 ?auto_30039 )
      ( MAKE-1PILE ?auto_30034 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_30040 - BLOCK
    )
    :vars
    (
      ?auto_30044 - BLOCK
      ?auto_30042 - BLOCK
      ?auto_30041 - BLOCK
      ?auto_30043 - BLOCK
      ?auto_30045 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30044 ?auto_30040 ) ( ON-TABLE ?auto_30040 ) ( not ( = ?auto_30040 ?auto_30044 ) ) ( not ( = ?auto_30040 ?auto_30042 ) ) ( not ( = ?auto_30040 ?auto_30041 ) ) ( not ( = ?auto_30044 ?auto_30042 ) ) ( not ( = ?auto_30044 ?auto_30041 ) ) ( not ( = ?auto_30042 ?auto_30041 ) ) ( ON ?auto_30042 ?auto_30044 ) ( ON-TABLE ?auto_30043 ) ( not ( = ?auto_30043 ?auto_30045 ) ) ( not ( = ?auto_30043 ?auto_30041 ) ) ( not ( = ?auto_30045 ?auto_30041 ) ) ( not ( = ?auto_30040 ?auto_30045 ) ) ( not ( = ?auto_30040 ?auto_30043 ) ) ( not ( = ?auto_30044 ?auto_30045 ) ) ( not ( = ?auto_30044 ?auto_30043 ) ) ( not ( = ?auto_30042 ?auto_30045 ) ) ( not ( = ?auto_30042 ?auto_30043 ) ) ( ON ?auto_30041 ?auto_30042 ) ( CLEAR ?auto_30041 ) ( HOLDING ?auto_30045 ) ( CLEAR ?auto_30043 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_30043 ?auto_30045 )
      ( MAKE-1PILE ?auto_30040 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_30509 - BLOCK
    )
    :vars
    (
      ?auto_30511 - BLOCK
      ?auto_30513 - BLOCK
      ?auto_30510 - BLOCK
      ?auto_30512 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30511 ?auto_30509 ) ( ON-TABLE ?auto_30509 ) ( not ( = ?auto_30509 ?auto_30511 ) ) ( not ( = ?auto_30509 ?auto_30513 ) ) ( not ( = ?auto_30509 ?auto_30510 ) ) ( not ( = ?auto_30511 ?auto_30513 ) ) ( not ( = ?auto_30511 ?auto_30510 ) ) ( not ( = ?auto_30513 ?auto_30510 ) ) ( ON ?auto_30513 ?auto_30511 ) ( not ( = ?auto_30512 ?auto_30510 ) ) ( not ( = ?auto_30509 ?auto_30512 ) ) ( not ( = ?auto_30511 ?auto_30512 ) ) ( not ( = ?auto_30513 ?auto_30512 ) ) ( ON ?auto_30510 ?auto_30513 ) ( ON ?auto_30512 ?auto_30510 ) ( CLEAR ?auto_30512 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_30509 ?auto_30511 ?auto_30513 ?auto_30510 )
      ( MAKE-1PILE ?auto_30509 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_30052 - BLOCK
    )
    :vars
    (
      ?auto_30056 - BLOCK
      ?auto_30054 - BLOCK
      ?auto_30057 - BLOCK
      ?auto_30053 - BLOCK
      ?auto_30055 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30056 ?auto_30052 ) ( ON-TABLE ?auto_30052 ) ( not ( = ?auto_30052 ?auto_30056 ) ) ( not ( = ?auto_30052 ?auto_30054 ) ) ( not ( = ?auto_30052 ?auto_30057 ) ) ( not ( = ?auto_30056 ?auto_30054 ) ) ( not ( = ?auto_30056 ?auto_30057 ) ) ( not ( = ?auto_30054 ?auto_30057 ) ) ( ON ?auto_30054 ?auto_30056 ) ( not ( = ?auto_30053 ?auto_30055 ) ) ( not ( = ?auto_30053 ?auto_30057 ) ) ( not ( = ?auto_30055 ?auto_30057 ) ) ( not ( = ?auto_30052 ?auto_30055 ) ) ( not ( = ?auto_30052 ?auto_30053 ) ) ( not ( = ?auto_30056 ?auto_30055 ) ) ( not ( = ?auto_30056 ?auto_30053 ) ) ( not ( = ?auto_30054 ?auto_30055 ) ) ( not ( = ?auto_30054 ?auto_30053 ) ) ( ON ?auto_30057 ?auto_30054 ) ( ON ?auto_30055 ?auto_30057 ) ( CLEAR ?auto_30055 ) ( HOLDING ?auto_30053 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_30053 )
      ( MAKE-1PILE ?auto_30052 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_30058 - BLOCK
    )
    :vars
    (
      ?auto_30062 - BLOCK
      ?auto_30063 - BLOCK
      ?auto_30059 - BLOCK
      ?auto_30060 - BLOCK
      ?auto_30061 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30062 ?auto_30058 ) ( ON-TABLE ?auto_30058 ) ( not ( = ?auto_30058 ?auto_30062 ) ) ( not ( = ?auto_30058 ?auto_30063 ) ) ( not ( = ?auto_30058 ?auto_30059 ) ) ( not ( = ?auto_30062 ?auto_30063 ) ) ( not ( = ?auto_30062 ?auto_30059 ) ) ( not ( = ?auto_30063 ?auto_30059 ) ) ( ON ?auto_30063 ?auto_30062 ) ( not ( = ?auto_30060 ?auto_30061 ) ) ( not ( = ?auto_30060 ?auto_30059 ) ) ( not ( = ?auto_30061 ?auto_30059 ) ) ( not ( = ?auto_30058 ?auto_30061 ) ) ( not ( = ?auto_30058 ?auto_30060 ) ) ( not ( = ?auto_30062 ?auto_30061 ) ) ( not ( = ?auto_30062 ?auto_30060 ) ) ( not ( = ?auto_30063 ?auto_30061 ) ) ( not ( = ?auto_30063 ?auto_30060 ) ) ( ON ?auto_30059 ?auto_30063 ) ( ON ?auto_30061 ?auto_30059 ) ( ON ?auto_30060 ?auto_30061 ) ( CLEAR ?auto_30060 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_30058 ?auto_30062 ?auto_30063 ?auto_30059 ?auto_30061 )
      ( MAKE-1PILE ?auto_30058 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_30069 - BLOCK
      ?auto_30070 - BLOCK
      ?auto_30071 - BLOCK
      ?auto_30072 - BLOCK
      ?auto_30073 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_30073 ) ( CLEAR ?auto_30072 ) ( ON-TABLE ?auto_30069 ) ( ON ?auto_30070 ?auto_30069 ) ( ON ?auto_30071 ?auto_30070 ) ( ON ?auto_30072 ?auto_30071 ) ( not ( = ?auto_30069 ?auto_30070 ) ) ( not ( = ?auto_30069 ?auto_30071 ) ) ( not ( = ?auto_30069 ?auto_30072 ) ) ( not ( = ?auto_30069 ?auto_30073 ) ) ( not ( = ?auto_30070 ?auto_30071 ) ) ( not ( = ?auto_30070 ?auto_30072 ) ) ( not ( = ?auto_30070 ?auto_30073 ) ) ( not ( = ?auto_30071 ?auto_30072 ) ) ( not ( = ?auto_30071 ?auto_30073 ) ) ( not ( = ?auto_30072 ?auto_30073 ) ) )
    :subtasks
    ( ( !STACK ?auto_30073 ?auto_30072 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_30074 - BLOCK
      ?auto_30075 - BLOCK
      ?auto_30076 - BLOCK
      ?auto_30077 - BLOCK
      ?auto_30078 - BLOCK
    )
    :vars
    (
      ?auto_30079 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_30077 ) ( ON-TABLE ?auto_30074 ) ( ON ?auto_30075 ?auto_30074 ) ( ON ?auto_30076 ?auto_30075 ) ( ON ?auto_30077 ?auto_30076 ) ( not ( = ?auto_30074 ?auto_30075 ) ) ( not ( = ?auto_30074 ?auto_30076 ) ) ( not ( = ?auto_30074 ?auto_30077 ) ) ( not ( = ?auto_30074 ?auto_30078 ) ) ( not ( = ?auto_30075 ?auto_30076 ) ) ( not ( = ?auto_30075 ?auto_30077 ) ) ( not ( = ?auto_30075 ?auto_30078 ) ) ( not ( = ?auto_30076 ?auto_30077 ) ) ( not ( = ?auto_30076 ?auto_30078 ) ) ( not ( = ?auto_30077 ?auto_30078 ) ) ( ON ?auto_30078 ?auto_30079 ) ( CLEAR ?auto_30078 ) ( HAND-EMPTY ) ( not ( = ?auto_30074 ?auto_30079 ) ) ( not ( = ?auto_30075 ?auto_30079 ) ) ( not ( = ?auto_30076 ?auto_30079 ) ) ( not ( = ?auto_30077 ?auto_30079 ) ) ( not ( = ?auto_30078 ?auto_30079 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_30078 ?auto_30079 )
      ( MAKE-5PILE ?auto_30074 ?auto_30075 ?auto_30076 ?auto_30077 ?auto_30078 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_30080 - BLOCK
      ?auto_30081 - BLOCK
      ?auto_30082 - BLOCK
      ?auto_30083 - BLOCK
      ?auto_30084 - BLOCK
    )
    :vars
    (
      ?auto_30085 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_30080 ) ( ON ?auto_30081 ?auto_30080 ) ( ON ?auto_30082 ?auto_30081 ) ( not ( = ?auto_30080 ?auto_30081 ) ) ( not ( = ?auto_30080 ?auto_30082 ) ) ( not ( = ?auto_30080 ?auto_30083 ) ) ( not ( = ?auto_30080 ?auto_30084 ) ) ( not ( = ?auto_30081 ?auto_30082 ) ) ( not ( = ?auto_30081 ?auto_30083 ) ) ( not ( = ?auto_30081 ?auto_30084 ) ) ( not ( = ?auto_30082 ?auto_30083 ) ) ( not ( = ?auto_30082 ?auto_30084 ) ) ( not ( = ?auto_30083 ?auto_30084 ) ) ( ON ?auto_30084 ?auto_30085 ) ( CLEAR ?auto_30084 ) ( not ( = ?auto_30080 ?auto_30085 ) ) ( not ( = ?auto_30081 ?auto_30085 ) ) ( not ( = ?auto_30082 ?auto_30085 ) ) ( not ( = ?auto_30083 ?auto_30085 ) ) ( not ( = ?auto_30084 ?auto_30085 ) ) ( HOLDING ?auto_30083 ) ( CLEAR ?auto_30082 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_30080 ?auto_30081 ?auto_30082 ?auto_30083 )
      ( MAKE-5PILE ?auto_30080 ?auto_30081 ?auto_30082 ?auto_30083 ?auto_30084 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_30086 - BLOCK
      ?auto_30087 - BLOCK
      ?auto_30088 - BLOCK
      ?auto_30089 - BLOCK
      ?auto_30090 - BLOCK
    )
    :vars
    (
      ?auto_30091 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_30086 ) ( ON ?auto_30087 ?auto_30086 ) ( ON ?auto_30088 ?auto_30087 ) ( not ( = ?auto_30086 ?auto_30087 ) ) ( not ( = ?auto_30086 ?auto_30088 ) ) ( not ( = ?auto_30086 ?auto_30089 ) ) ( not ( = ?auto_30086 ?auto_30090 ) ) ( not ( = ?auto_30087 ?auto_30088 ) ) ( not ( = ?auto_30087 ?auto_30089 ) ) ( not ( = ?auto_30087 ?auto_30090 ) ) ( not ( = ?auto_30088 ?auto_30089 ) ) ( not ( = ?auto_30088 ?auto_30090 ) ) ( not ( = ?auto_30089 ?auto_30090 ) ) ( ON ?auto_30090 ?auto_30091 ) ( not ( = ?auto_30086 ?auto_30091 ) ) ( not ( = ?auto_30087 ?auto_30091 ) ) ( not ( = ?auto_30088 ?auto_30091 ) ) ( not ( = ?auto_30089 ?auto_30091 ) ) ( not ( = ?auto_30090 ?auto_30091 ) ) ( CLEAR ?auto_30088 ) ( ON ?auto_30089 ?auto_30090 ) ( CLEAR ?auto_30089 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_30091 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_30091 ?auto_30090 )
      ( MAKE-5PILE ?auto_30086 ?auto_30087 ?auto_30088 ?auto_30089 ?auto_30090 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_30092 - BLOCK
      ?auto_30093 - BLOCK
      ?auto_30094 - BLOCK
      ?auto_30095 - BLOCK
      ?auto_30096 - BLOCK
    )
    :vars
    (
      ?auto_30097 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_30092 ) ( ON ?auto_30093 ?auto_30092 ) ( not ( = ?auto_30092 ?auto_30093 ) ) ( not ( = ?auto_30092 ?auto_30094 ) ) ( not ( = ?auto_30092 ?auto_30095 ) ) ( not ( = ?auto_30092 ?auto_30096 ) ) ( not ( = ?auto_30093 ?auto_30094 ) ) ( not ( = ?auto_30093 ?auto_30095 ) ) ( not ( = ?auto_30093 ?auto_30096 ) ) ( not ( = ?auto_30094 ?auto_30095 ) ) ( not ( = ?auto_30094 ?auto_30096 ) ) ( not ( = ?auto_30095 ?auto_30096 ) ) ( ON ?auto_30096 ?auto_30097 ) ( not ( = ?auto_30092 ?auto_30097 ) ) ( not ( = ?auto_30093 ?auto_30097 ) ) ( not ( = ?auto_30094 ?auto_30097 ) ) ( not ( = ?auto_30095 ?auto_30097 ) ) ( not ( = ?auto_30096 ?auto_30097 ) ) ( ON ?auto_30095 ?auto_30096 ) ( CLEAR ?auto_30095 ) ( ON-TABLE ?auto_30097 ) ( HOLDING ?auto_30094 ) ( CLEAR ?auto_30093 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_30092 ?auto_30093 ?auto_30094 )
      ( MAKE-5PILE ?auto_30092 ?auto_30093 ?auto_30094 ?auto_30095 ?auto_30096 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_30098 - BLOCK
      ?auto_30099 - BLOCK
      ?auto_30100 - BLOCK
      ?auto_30101 - BLOCK
      ?auto_30102 - BLOCK
    )
    :vars
    (
      ?auto_30103 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_30098 ) ( ON ?auto_30099 ?auto_30098 ) ( not ( = ?auto_30098 ?auto_30099 ) ) ( not ( = ?auto_30098 ?auto_30100 ) ) ( not ( = ?auto_30098 ?auto_30101 ) ) ( not ( = ?auto_30098 ?auto_30102 ) ) ( not ( = ?auto_30099 ?auto_30100 ) ) ( not ( = ?auto_30099 ?auto_30101 ) ) ( not ( = ?auto_30099 ?auto_30102 ) ) ( not ( = ?auto_30100 ?auto_30101 ) ) ( not ( = ?auto_30100 ?auto_30102 ) ) ( not ( = ?auto_30101 ?auto_30102 ) ) ( ON ?auto_30102 ?auto_30103 ) ( not ( = ?auto_30098 ?auto_30103 ) ) ( not ( = ?auto_30099 ?auto_30103 ) ) ( not ( = ?auto_30100 ?auto_30103 ) ) ( not ( = ?auto_30101 ?auto_30103 ) ) ( not ( = ?auto_30102 ?auto_30103 ) ) ( ON ?auto_30101 ?auto_30102 ) ( ON-TABLE ?auto_30103 ) ( CLEAR ?auto_30099 ) ( ON ?auto_30100 ?auto_30101 ) ( CLEAR ?auto_30100 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_30103 ?auto_30102 ?auto_30101 )
      ( MAKE-5PILE ?auto_30098 ?auto_30099 ?auto_30100 ?auto_30101 ?auto_30102 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_30104 - BLOCK
      ?auto_30105 - BLOCK
      ?auto_30106 - BLOCK
      ?auto_30107 - BLOCK
      ?auto_30108 - BLOCK
    )
    :vars
    (
      ?auto_30109 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_30104 ) ( not ( = ?auto_30104 ?auto_30105 ) ) ( not ( = ?auto_30104 ?auto_30106 ) ) ( not ( = ?auto_30104 ?auto_30107 ) ) ( not ( = ?auto_30104 ?auto_30108 ) ) ( not ( = ?auto_30105 ?auto_30106 ) ) ( not ( = ?auto_30105 ?auto_30107 ) ) ( not ( = ?auto_30105 ?auto_30108 ) ) ( not ( = ?auto_30106 ?auto_30107 ) ) ( not ( = ?auto_30106 ?auto_30108 ) ) ( not ( = ?auto_30107 ?auto_30108 ) ) ( ON ?auto_30108 ?auto_30109 ) ( not ( = ?auto_30104 ?auto_30109 ) ) ( not ( = ?auto_30105 ?auto_30109 ) ) ( not ( = ?auto_30106 ?auto_30109 ) ) ( not ( = ?auto_30107 ?auto_30109 ) ) ( not ( = ?auto_30108 ?auto_30109 ) ) ( ON ?auto_30107 ?auto_30108 ) ( ON-TABLE ?auto_30109 ) ( ON ?auto_30106 ?auto_30107 ) ( CLEAR ?auto_30106 ) ( HOLDING ?auto_30105 ) ( CLEAR ?auto_30104 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_30104 ?auto_30105 )
      ( MAKE-5PILE ?auto_30104 ?auto_30105 ?auto_30106 ?auto_30107 ?auto_30108 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_30110 - BLOCK
      ?auto_30111 - BLOCK
      ?auto_30112 - BLOCK
      ?auto_30113 - BLOCK
      ?auto_30114 - BLOCK
    )
    :vars
    (
      ?auto_30115 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_30110 ) ( not ( = ?auto_30110 ?auto_30111 ) ) ( not ( = ?auto_30110 ?auto_30112 ) ) ( not ( = ?auto_30110 ?auto_30113 ) ) ( not ( = ?auto_30110 ?auto_30114 ) ) ( not ( = ?auto_30111 ?auto_30112 ) ) ( not ( = ?auto_30111 ?auto_30113 ) ) ( not ( = ?auto_30111 ?auto_30114 ) ) ( not ( = ?auto_30112 ?auto_30113 ) ) ( not ( = ?auto_30112 ?auto_30114 ) ) ( not ( = ?auto_30113 ?auto_30114 ) ) ( ON ?auto_30114 ?auto_30115 ) ( not ( = ?auto_30110 ?auto_30115 ) ) ( not ( = ?auto_30111 ?auto_30115 ) ) ( not ( = ?auto_30112 ?auto_30115 ) ) ( not ( = ?auto_30113 ?auto_30115 ) ) ( not ( = ?auto_30114 ?auto_30115 ) ) ( ON ?auto_30113 ?auto_30114 ) ( ON-TABLE ?auto_30115 ) ( ON ?auto_30112 ?auto_30113 ) ( CLEAR ?auto_30110 ) ( ON ?auto_30111 ?auto_30112 ) ( CLEAR ?auto_30111 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_30115 ?auto_30114 ?auto_30113 ?auto_30112 )
      ( MAKE-5PILE ?auto_30110 ?auto_30111 ?auto_30112 ?auto_30113 ?auto_30114 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_30116 - BLOCK
      ?auto_30117 - BLOCK
      ?auto_30118 - BLOCK
      ?auto_30119 - BLOCK
      ?auto_30120 - BLOCK
    )
    :vars
    (
      ?auto_30121 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30116 ?auto_30117 ) ) ( not ( = ?auto_30116 ?auto_30118 ) ) ( not ( = ?auto_30116 ?auto_30119 ) ) ( not ( = ?auto_30116 ?auto_30120 ) ) ( not ( = ?auto_30117 ?auto_30118 ) ) ( not ( = ?auto_30117 ?auto_30119 ) ) ( not ( = ?auto_30117 ?auto_30120 ) ) ( not ( = ?auto_30118 ?auto_30119 ) ) ( not ( = ?auto_30118 ?auto_30120 ) ) ( not ( = ?auto_30119 ?auto_30120 ) ) ( ON ?auto_30120 ?auto_30121 ) ( not ( = ?auto_30116 ?auto_30121 ) ) ( not ( = ?auto_30117 ?auto_30121 ) ) ( not ( = ?auto_30118 ?auto_30121 ) ) ( not ( = ?auto_30119 ?auto_30121 ) ) ( not ( = ?auto_30120 ?auto_30121 ) ) ( ON ?auto_30119 ?auto_30120 ) ( ON-TABLE ?auto_30121 ) ( ON ?auto_30118 ?auto_30119 ) ( ON ?auto_30117 ?auto_30118 ) ( CLEAR ?auto_30117 ) ( HOLDING ?auto_30116 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_30116 )
      ( MAKE-5PILE ?auto_30116 ?auto_30117 ?auto_30118 ?auto_30119 ?auto_30120 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_30122 - BLOCK
      ?auto_30123 - BLOCK
      ?auto_30124 - BLOCK
      ?auto_30125 - BLOCK
      ?auto_30126 - BLOCK
    )
    :vars
    (
      ?auto_30127 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30122 ?auto_30123 ) ) ( not ( = ?auto_30122 ?auto_30124 ) ) ( not ( = ?auto_30122 ?auto_30125 ) ) ( not ( = ?auto_30122 ?auto_30126 ) ) ( not ( = ?auto_30123 ?auto_30124 ) ) ( not ( = ?auto_30123 ?auto_30125 ) ) ( not ( = ?auto_30123 ?auto_30126 ) ) ( not ( = ?auto_30124 ?auto_30125 ) ) ( not ( = ?auto_30124 ?auto_30126 ) ) ( not ( = ?auto_30125 ?auto_30126 ) ) ( ON ?auto_30126 ?auto_30127 ) ( not ( = ?auto_30122 ?auto_30127 ) ) ( not ( = ?auto_30123 ?auto_30127 ) ) ( not ( = ?auto_30124 ?auto_30127 ) ) ( not ( = ?auto_30125 ?auto_30127 ) ) ( not ( = ?auto_30126 ?auto_30127 ) ) ( ON ?auto_30125 ?auto_30126 ) ( ON-TABLE ?auto_30127 ) ( ON ?auto_30124 ?auto_30125 ) ( ON ?auto_30123 ?auto_30124 ) ( ON ?auto_30122 ?auto_30123 ) ( CLEAR ?auto_30122 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_30127 ?auto_30126 ?auto_30125 ?auto_30124 ?auto_30123 )
      ( MAKE-5PILE ?auto_30122 ?auto_30123 ?auto_30124 ?auto_30125 ?auto_30126 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_30186 - BLOCK
    )
    :vars
    (
      ?auto_30187 - BLOCK
      ?auto_30188 - BLOCK
      ?auto_30189 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30186 ?auto_30187 ) ( CLEAR ?auto_30186 ) ( not ( = ?auto_30186 ?auto_30187 ) ) ( HOLDING ?auto_30188 ) ( CLEAR ?auto_30189 ) ( not ( = ?auto_30186 ?auto_30188 ) ) ( not ( = ?auto_30186 ?auto_30189 ) ) ( not ( = ?auto_30187 ?auto_30188 ) ) ( not ( = ?auto_30187 ?auto_30189 ) ) ( not ( = ?auto_30188 ?auto_30189 ) ) )
    :subtasks
    ( ( !STACK ?auto_30188 ?auto_30189 )
      ( MAKE-1PILE ?auto_30186 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_30190 - BLOCK
    )
    :vars
    (
      ?auto_30191 - BLOCK
      ?auto_30193 - BLOCK
      ?auto_30192 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30190 ?auto_30191 ) ( not ( = ?auto_30190 ?auto_30191 ) ) ( CLEAR ?auto_30193 ) ( not ( = ?auto_30190 ?auto_30192 ) ) ( not ( = ?auto_30190 ?auto_30193 ) ) ( not ( = ?auto_30191 ?auto_30192 ) ) ( not ( = ?auto_30191 ?auto_30193 ) ) ( not ( = ?auto_30192 ?auto_30193 ) ) ( ON ?auto_30192 ?auto_30190 ) ( CLEAR ?auto_30192 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_30191 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_30191 ?auto_30190 )
      ( MAKE-1PILE ?auto_30190 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_30194 - BLOCK
    )
    :vars
    (
      ?auto_30196 - BLOCK
      ?auto_30195 - BLOCK
      ?auto_30197 - BLOCK
      ?auto_30198 - BLOCK
      ?auto_30199 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30194 ?auto_30196 ) ( not ( = ?auto_30194 ?auto_30196 ) ) ( not ( = ?auto_30194 ?auto_30195 ) ) ( not ( = ?auto_30194 ?auto_30197 ) ) ( not ( = ?auto_30196 ?auto_30195 ) ) ( not ( = ?auto_30196 ?auto_30197 ) ) ( not ( = ?auto_30195 ?auto_30197 ) ) ( ON ?auto_30195 ?auto_30194 ) ( CLEAR ?auto_30195 ) ( ON-TABLE ?auto_30196 ) ( HOLDING ?auto_30197 ) ( CLEAR ?auto_30198 ) ( ON-TABLE ?auto_30199 ) ( ON ?auto_30198 ?auto_30199 ) ( not ( = ?auto_30199 ?auto_30198 ) ) ( not ( = ?auto_30199 ?auto_30197 ) ) ( not ( = ?auto_30198 ?auto_30197 ) ) ( not ( = ?auto_30194 ?auto_30198 ) ) ( not ( = ?auto_30194 ?auto_30199 ) ) ( not ( = ?auto_30196 ?auto_30198 ) ) ( not ( = ?auto_30196 ?auto_30199 ) ) ( not ( = ?auto_30195 ?auto_30198 ) ) ( not ( = ?auto_30195 ?auto_30199 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_30199 ?auto_30198 ?auto_30197 )
      ( MAKE-1PILE ?auto_30194 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_30200 - BLOCK
    )
    :vars
    (
      ?auto_30204 - BLOCK
      ?auto_30205 - BLOCK
      ?auto_30203 - BLOCK
      ?auto_30201 - BLOCK
      ?auto_30202 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30200 ?auto_30204 ) ( not ( = ?auto_30200 ?auto_30204 ) ) ( not ( = ?auto_30200 ?auto_30205 ) ) ( not ( = ?auto_30200 ?auto_30203 ) ) ( not ( = ?auto_30204 ?auto_30205 ) ) ( not ( = ?auto_30204 ?auto_30203 ) ) ( not ( = ?auto_30205 ?auto_30203 ) ) ( ON ?auto_30205 ?auto_30200 ) ( ON-TABLE ?auto_30204 ) ( CLEAR ?auto_30201 ) ( ON-TABLE ?auto_30202 ) ( ON ?auto_30201 ?auto_30202 ) ( not ( = ?auto_30202 ?auto_30201 ) ) ( not ( = ?auto_30202 ?auto_30203 ) ) ( not ( = ?auto_30201 ?auto_30203 ) ) ( not ( = ?auto_30200 ?auto_30201 ) ) ( not ( = ?auto_30200 ?auto_30202 ) ) ( not ( = ?auto_30204 ?auto_30201 ) ) ( not ( = ?auto_30204 ?auto_30202 ) ) ( not ( = ?auto_30205 ?auto_30201 ) ) ( not ( = ?auto_30205 ?auto_30202 ) ) ( ON ?auto_30203 ?auto_30205 ) ( CLEAR ?auto_30203 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_30204 ?auto_30200 ?auto_30205 )
      ( MAKE-1PILE ?auto_30200 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_30206 - BLOCK
    )
    :vars
    (
      ?auto_30211 - BLOCK
      ?auto_30210 - BLOCK
      ?auto_30207 - BLOCK
      ?auto_30209 - BLOCK
      ?auto_30208 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30206 ?auto_30211 ) ( not ( = ?auto_30206 ?auto_30211 ) ) ( not ( = ?auto_30206 ?auto_30210 ) ) ( not ( = ?auto_30206 ?auto_30207 ) ) ( not ( = ?auto_30211 ?auto_30210 ) ) ( not ( = ?auto_30211 ?auto_30207 ) ) ( not ( = ?auto_30210 ?auto_30207 ) ) ( ON ?auto_30210 ?auto_30206 ) ( ON-TABLE ?auto_30211 ) ( ON-TABLE ?auto_30209 ) ( not ( = ?auto_30209 ?auto_30208 ) ) ( not ( = ?auto_30209 ?auto_30207 ) ) ( not ( = ?auto_30208 ?auto_30207 ) ) ( not ( = ?auto_30206 ?auto_30208 ) ) ( not ( = ?auto_30206 ?auto_30209 ) ) ( not ( = ?auto_30211 ?auto_30208 ) ) ( not ( = ?auto_30211 ?auto_30209 ) ) ( not ( = ?auto_30210 ?auto_30208 ) ) ( not ( = ?auto_30210 ?auto_30209 ) ) ( ON ?auto_30207 ?auto_30210 ) ( CLEAR ?auto_30207 ) ( HOLDING ?auto_30208 ) ( CLEAR ?auto_30209 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_30209 ?auto_30208 )
      ( MAKE-1PILE ?auto_30206 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_30212 - BLOCK
    )
    :vars
    (
      ?auto_30216 - BLOCK
      ?auto_30217 - BLOCK
      ?auto_30214 - BLOCK
      ?auto_30213 - BLOCK
      ?auto_30215 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30212 ?auto_30216 ) ( not ( = ?auto_30212 ?auto_30216 ) ) ( not ( = ?auto_30212 ?auto_30217 ) ) ( not ( = ?auto_30212 ?auto_30214 ) ) ( not ( = ?auto_30216 ?auto_30217 ) ) ( not ( = ?auto_30216 ?auto_30214 ) ) ( not ( = ?auto_30217 ?auto_30214 ) ) ( ON ?auto_30217 ?auto_30212 ) ( ON-TABLE ?auto_30216 ) ( ON-TABLE ?auto_30213 ) ( not ( = ?auto_30213 ?auto_30215 ) ) ( not ( = ?auto_30213 ?auto_30214 ) ) ( not ( = ?auto_30215 ?auto_30214 ) ) ( not ( = ?auto_30212 ?auto_30215 ) ) ( not ( = ?auto_30212 ?auto_30213 ) ) ( not ( = ?auto_30216 ?auto_30215 ) ) ( not ( = ?auto_30216 ?auto_30213 ) ) ( not ( = ?auto_30217 ?auto_30215 ) ) ( not ( = ?auto_30217 ?auto_30213 ) ) ( ON ?auto_30214 ?auto_30217 ) ( CLEAR ?auto_30213 ) ( ON ?auto_30215 ?auto_30214 ) ( CLEAR ?auto_30215 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_30216 ?auto_30212 ?auto_30217 ?auto_30214 )
      ( MAKE-1PILE ?auto_30212 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_30218 - BLOCK
    )
    :vars
    (
      ?auto_30222 - BLOCK
      ?auto_30223 - BLOCK
      ?auto_30221 - BLOCK
      ?auto_30219 - BLOCK
      ?auto_30220 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30218 ?auto_30222 ) ( not ( = ?auto_30218 ?auto_30222 ) ) ( not ( = ?auto_30218 ?auto_30223 ) ) ( not ( = ?auto_30218 ?auto_30221 ) ) ( not ( = ?auto_30222 ?auto_30223 ) ) ( not ( = ?auto_30222 ?auto_30221 ) ) ( not ( = ?auto_30223 ?auto_30221 ) ) ( ON ?auto_30223 ?auto_30218 ) ( ON-TABLE ?auto_30222 ) ( not ( = ?auto_30219 ?auto_30220 ) ) ( not ( = ?auto_30219 ?auto_30221 ) ) ( not ( = ?auto_30220 ?auto_30221 ) ) ( not ( = ?auto_30218 ?auto_30220 ) ) ( not ( = ?auto_30218 ?auto_30219 ) ) ( not ( = ?auto_30222 ?auto_30220 ) ) ( not ( = ?auto_30222 ?auto_30219 ) ) ( not ( = ?auto_30223 ?auto_30220 ) ) ( not ( = ?auto_30223 ?auto_30219 ) ) ( ON ?auto_30221 ?auto_30223 ) ( ON ?auto_30220 ?auto_30221 ) ( CLEAR ?auto_30220 ) ( HOLDING ?auto_30219 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_30219 )
      ( MAKE-1PILE ?auto_30218 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_30224 - BLOCK
    )
    :vars
    (
      ?auto_30229 - BLOCK
      ?auto_30225 - BLOCK
      ?auto_30228 - BLOCK
      ?auto_30227 - BLOCK
      ?auto_30226 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30224 ?auto_30229 ) ( not ( = ?auto_30224 ?auto_30229 ) ) ( not ( = ?auto_30224 ?auto_30225 ) ) ( not ( = ?auto_30224 ?auto_30228 ) ) ( not ( = ?auto_30229 ?auto_30225 ) ) ( not ( = ?auto_30229 ?auto_30228 ) ) ( not ( = ?auto_30225 ?auto_30228 ) ) ( ON ?auto_30225 ?auto_30224 ) ( ON-TABLE ?auto_30229 ) ( not ( = ?auto_30227 ?auto_30226 ) ) ( not ( = ?auto_30227 ?auto_30228 ) ) ( not ( = ?auto_30226 ?auto_30228 ) ) ( not ( = ?auto_30224 ?auto_30226 ) ) ( not ( = ?auto_30224 ?auto_30227 ) ) ( not ( = ?auto_30229 ?auto_30226 ) ) ( not ( = ?auto_30229 ?auto_30227 ) ) ( not ( = ?auto_30225 ?auto_30226 ) ) ( not ( = ?auto_30225 ?auto_30227 ) ) ( ON ?auto_30228 ?auto_30225 ) ( ON ?auto_30226 ?auto_30228 ) ( ON ?auto_30227 ?auto_30226 ) ( CLEAR ?auto_30227 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_30229 ?auto_30224 ?auto_30225 ?auto_30228 ?auto_30226 )
      ( MAKE-1PILE ?auto_30224 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_30237 - BLOCK
      ?auto_30238 - BLOCK
      ?auto_30239 - BLOCK
    )
    :vars
    (
      ?auto_30240 - BLOCK
      ?auto_30241 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30240 ?auto_30239 ) ( CLEAR ?auto_30240 ) ( ON-TABLE ?auto_30237 ) ( ON ?auto_30238 ?auto_30237 ) ( ON ?auto_30239 ?auto_30238 ) ( not ( = ?auto_30237 ?auto_30238 ) ) ( not ( = ?auto_30237 ?auto_30239 ) ) ( not ( = ?auto_30237 ?auto_30240 ) ) ( not ( = ?auto_30238 ?auto_30239 ) ) ( not ( = ?auto_30238 ?auto_30240 ) ) ( not ( = ?auto_30239 ?auto_30240 ) ) ( HOLDING ?auto_30241 ) ( not ( = ?auto_30237 ?auto_30241 ) ) ( not ( = ?auto_30238 ?auto_30241 ) ) ( not ( = ?auto_30239 ?auto_30241 ) ) ( not ( = ?auto_30240 ?auto_30241 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_30241 )
      ( MAKE-3PILE ?auto_30237 ?auto_30238 ?auto_30239 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_30290 - BLOCK
      ?auto_30291 - BLOCK
    )
    :vars
    (
      ?auto_30292 - BLOCK
      ?auto_30294 - BLOCK
      ?auto_30293 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30290 ?auto_30291 ) ) ( ON ?auto_30291 ?auto_30292 ) ( not ( = ?auto_30290 ?auto_30292 ) ) ( not ( = ?auto_30291 ?auto_30292 ) ) ( ON ?auto_30290 ?auto_30291 ) ( CLEAR ?auto_30290 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_30294 ) ( ON ?auto_30293 ?auto_30294 ) ( ON ?auto_30292 ?auto_30293 ) ( not ( = ?auto_30294 ?auto_30293 ) ) ( not ( = ?auto_30294 ?auto_30292 ) ) ( not ( = ?auto_30294 ?auto_30291 ) ) ( not ( = ?auto_30294 ?auto_30290 ) ) ( not ( = ?auto_30293 ?auto_30292 ) ) ( not ( = ?auto_30293 ?auto_30291 ) ) ( not ( = ?auto_30293 ?auto_30290 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_30294 ?auto_30293 ?auto_30292 ?auto_30291 )
      ( MAKE-2PILE ?auto_30290 ?auto_30291 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_30297 - BLOCK
      ?auto_30298 - BLOCK
    )
    :vars
    (
      ?auto_30299 - BLOCK
      ?auto_30300 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30297 ?auto_30298 ) ) ( ON ?auto_30298 ?auto_30299 ) ( CLEAR ?auto_30298 ) ( not ( = ?auto_30297 ?auto_30299 ) ) ( not ( = ?auto_30298 ?auto_30299 ) ) ( ON ?auto_30297 ?auto_30300 ) ( CLEAR ?auto_30297 ) ( HAND-EMPTY ) ( not ( = ?auto_30297 ?auto_30300 ) ) ( not ( = ?auto_30298 ?auto_30300 ) ) ( not ( = ?auto_30299 ?auto_30300 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_30297 ?auto_30300 )
      ( MAKE-2PILE ?auto_30297 ?auto_30298 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_30301 - BLOCK
      ?auto_30302 - BLOCK
    )
    :vars
    (
      ?auto_30303 - BLOCK
      ?auto_30304 - BLOCK
      ?auto_30306 - BLOCK
      ?auto_30305 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30301 ?auto_30302 ) ) ( not ( = ?auto_30301 ?auto_30303 ) ) ( not ( = ?auto_30302 ?auto_30303 ) ) ( ON ?auto_30301 ?auto_30304 ) ( CLEAR ?auto_30301 ) ( not ( = ?auto_30301 ?auto_30304 ) ) ( not ( = ?auto_30302 ?auto_30304 ) ) ( not ( = ?auto_30303 ?auto_30304 ) ) ( HOLDING ?auto_30302 ) ( CLEAR ?auto_30303 ) ( ON-TABLE ?auto_30306 ) ( ON ?auto_30305 ?auto_30306 ) ( ON ?auto_30303 ?auto_30305 ) ( not ( = ?auto_30306 ?auto_30305 ) ) ( not ( = ?auto_30306 ?auto_30303 ) ) ( not ( = ?auto_30306 ?auto_30302 ) ) ( not ( = ?auto_30305 ?auto_30303 ) ) ( not ( = ?auto_30305 ?auto_30302 ) ) ( not ( = ?auto_30301 ?auto_30306 ) ) ( not ( = ?auto_30301 ?auto_30305 ) ) ( not ( = ?auto_30304 ?auto_30306 ) ) ( not ( = ?auto_30304 ?auto_30305 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_30306 ?auto_30305 ?auto_30303 ?auto_30302 )
      ( MAKE-2PILE ?auto_30301 ?auto_30302 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_30307 - BLOCK
      ?auto_30308 - BLOCK
    )
    :vars
    (
      ?auto_30312 - BLOCK
      ?auto_30310 - BLOCK
      ?auto_30311 - BLOCK
      ?auto_30309 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30307 ?auto_30308 ) ) ( not ( = ?auto_30307 ?auto_30312 ) ) ( not ( = ?auto_30308 ?auto_30312 ) ) ( ON ?auto_30307 ?auto_30310 ) ( not ( = ?auto_30307 ?auto_30310 ) ) ( not ( = ?auto_30308 ?auto_30310 ) ) ( not ( = ?auto_30312 ?auto_30310 ) ) ( CLEAR ?auto_30312 ) ( ON-TABLE ?auto_30311 ) ( ON ?auto_30309 ?auto_30311 ) ( ON ?auto_30312 ?auto_30309 ) ( not ( = ?auto_30311 ?auto_30309 ) ) ( not ( = ?auto_30311 ?auto_30312 ) ) ( not ( = ?auto_30311 ?auto_30308 ) ) ( not ( = ?auto_30309 ?auto_30312 ) ) ( not ( = ?auto_30309 ?auto_30308 ) ) ( not ( = ?auto_30307 ?auto_30311 ) ) ( not ( = ?auto_30307 ?auto_30309 ) ) ( not ( = ?auto_30310 ?auto_30311 ) ) ( not ( = ?auto_30310 ?auto_30309 ) ) ( ON ?auto_30308 ?auto_30307 ) ( CLEAR ?auto_30308 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_30310 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_30310 ?auto_30307 )
      ( MAKE-2PILE ?auto_30307 ?auto_30308 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_30313 - BLOCK
      ?auto_30314 - BLOCK
    )
    :vars
    (
      ?auto_30316 - BLOCK
      ?auto_30318 - BLOCK
      ?auto_30315 - BLOCK
      ?auto_30317 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30313 ?auto_30314 ) ) ( not ( = ?auto_30313 ?auto_30316 ) ) ( not ( = ?auto_30314 ?auto_30316 ) ) ( ON ?auto_30313 ?auto_30318 ) ( not ( = ?auto_30313 ?auto_30318 ) ) ( not ( = ?auto_30314 ?auto_30318 ) ) ( not ( = ?auto_30316 ?auto_30318 ) ) ( ON-TABLE ?auto_30315 ) ( ON ?auto_30317 ?auto_30315 ) ( not ( = ?auto_30315 ?auto_30317 ) ) ( not ( = ?auto_30315 ?auto_30316 ) ) ( not ( = ?auto_30315 ?auto_30314 ) ) ( not ( = ?auto_30317 ?auto_30316 ) ) ( not ( = ?auto_30317 ?auto_30314 ) ) ( not ( = ?auto_30313 ?auto_30315 ) ) ( not ( = ?auto_30313 ?auto_30317 ) ) ( not ( = ?auto_30318 ?auto_30315 ) ) ( not ( = ?auto_30318 ?auto_30317 ) ) ( ON ?auto_30314 ?auto_30313 ) ( CLEAR ?auto_30314 ) ( ON-TABLE ?auto_30318 ) ( HOLDING ?auto_30316 ) ( CLEAR ?auto_30317 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_30315 ?auto_30317 ?auto_30316 )
      ( MAKE-2PILE ?auto_30313 ?auto_30314 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_30319 - BLOCK
      ?auto_30320 - BLOCK
    )
    :vars
    (
      ?auto_30322 - BLOCK
      ?auto_30324 - BLOCK
      ?auto_30321 - BLOCK
      ?auto_30323 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30319 ?auto_30320 ) ) ( not ( = ?auto_30319 ?auto_30322 ) ) ( not ( = ?auto_30320 ?auto_30322 ) ) ( ON ?auto_30319 ?auto_30324 ) ( not ( = ?auto_30319 ?auto_30324 ) ) ( not ( = ?auto_30320 ?auto_30324 ) ) ( not ( = ?auto_30322 ?auto_30324 ) ) ( ON-TABLE ?auto_30321 ) ( ON ?auto_30323 ?auto_30321 ) ( not ( = ?auto_30321 ?auto_30323 ) ) ( not ( = ?auto_30321 ?auto_30322 ) ) ( not ( = ?auto_30321 ?auto_30320 ) ) ( not ( = ?auto_30323 ?auto_30322 ) ) ( not ( = ?auto_30323 ?auto_30320 ) ) ( not ( = ?auto_30319 ?auto_30321 ) ) ( not ( = ?auto_30319 ?auto_30323 ) ) ( not ( = ?auto_30324 ?auto_30321 ) ) ( not ( = ?auto_30324 ?auto_30323 ) ) ( ON ?auto_30320 ?auto_30319 ) ( ON-TABLE ?auto_30324 ) ( CLEAR ?auto_30323 ) ( ON ?auto_30322 ?auto_30320 ) ( CLEAR ?auto_30322 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_30324 ?auto_30319 ?auto_30320 )
      ( MAKE-2PILE ?auto_30319 ?auto_30320 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_30325 - BLOCK
      ?auto_30326 - BLOCK
    )
    :vars
    (
      ?auto_30329 - BLOCK
      ?auto_30330 - BLOCK
      ?auto_30327 - BLOCK
      ?auto_30328 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30325 ?auto_30326 ) ) ( not ( = ?auto_30325 ?auto_30329 ) ) ( not ( = ?auto_30326 ?auto_30329 ) ) ( ON ?auto_30325 ?auto_30330 ) ( not ( = ?auto_30325 ?auto_30330 ) ) ( not ( = ?auto_30326 ?auto_30330 ) ) ( not ( = ?auto_30329 ?auto_30330 ) ) ( ON-TABLE ?auto_30327 ) ( not ( = ?auto_30327 ?auto_30328 ) ) ( not ( = ?auto_30327 ?auto_30329 ) ) ( not ( = ?auto_30327 ?auto_30326 ) ) ( not ( = ?auto_30328 ?auto_30329 ) ) ( not ( = ?auto_30328 ?auto_30326 ) ) ( not ( = ?auto_30325 ?auto_30327 ) ) ( not ( = ?auto_30325 ?auto_30328 ) ) ( not ( = ?auto_30330 ?auto_30327 ) ) ( not ( = ?auto_30330 ?auto_30328 ) ) ( ON ?auto_30326 ?auto_30325 ) ( ON-TABLE ?auto_30330 ) ( ON ?auto_30329 ?auto_30326 ) ( CLEAR ?auto_30329 ) ( HOLDING ?auto_30328 ) ( CLEAR ?auto_30327 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_30327 ?auto_30328 )
      ( MAKE-2PILE ?auto_30325 ?auto_30326 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_30331 - BLOCK
      ?auto_30332 - BLOCK
    )
    :vars
    (
      ?auto_30333 - BLOCK
      ?auto_30335 - BLOCK
      ?auto_30336 - BLOCK
      ?auto_30334 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30331 ?auto_30332 ) ) ( not ( = ?auto_30331 ?auto_30333 ) ) ( not ( = ?auto_30332 ?auto_30333 ) ) ( ON ?auto_30331 ?auto_30335 ) ( not ( = ?auto_30331 ?auto_30335 ) ) ( not ( = ?auto_30332 ?auto_30335 ) ) ( not ( = ?auto_30333 ?auto_30335 ) ) ( ON-TABLE ?auto_30336 ) ( not ( = ?auto_30336 ?auto_30334 ) ) ( not ( = ?auto_30336 ?auto_30333 ) ) ( not ( = ?auto_30336 ?auto_30332 ) ) ( not ( = ?auto_30334 ?auto_30333 ) ) ( not ( = ?auto_30334 ?auto_30332 ) ) ( not ( = ?auto_30331 ?auto_30336 ) ) ( not ( = ?auto_30331 ?auto_30334 ) ) ( not ( = ?auto_30335 ?auto_30336 ) ) ( not ( = ?auto_30335 ?auto_30334 ) ) ( ON ?auto_30332 ?auto_30331 ) ( ON-TABLE ?auto_30335 ) ( ON ?auto_30333 ?auto_30332 ) ( CLEAR ?auto_30336 ) ( ON ?auto_30334 ?auto_30333 ) ( CLEAR ?auto_30334 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_30335 ?auto_30331 ?auto_30332 ?auto_30333 )
      ( MAKE-2PILE ?auto_30331 ?auto_30332 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_30337 - BLOCK
      ?auto_30338 - BLOCK
    )
    :vars
    (
      ?auto_30340 - BLOCK
      ?auto_30342 - BLOCK
      ?auto_30341 - BLOCK
      ?auto_30339 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30337 ?auto_30338 ) ) ( not ( = ?auto_30337 ?auto_30340 ) ) ( not ( = ?auto_30338 ?auto_30340 ) ) ( ON ?auto_30337 ?auto_30342 ) ( not ( = ?auto_30337 ?auto_30342 ) ) ( not ( = ?auto_30338 ?auto_30342 ) ) ( not ( = ?auto_30340 ?auto_30342 ) ) ( not ( = ?auto_30341 ?auto_30339 ) ) ( not ( = ?auto_30341 ?auto_30340 ) ) ( not ( = ?auto_30341 ?auto_30338 ) ) ( not ( = ?auto_30339 ?auto_30340 ) ) ( not ( = ?auto_30339 ?auto_30338 ) ) ( not ( = ?auto_30337 ?auto_30341 ) ) ( not ( = ?auto_30337 ?auto_30339 ) ) ( not ( = ?auto_30342 ?auto_30341 ) ) ( not ( = ?auto_30342 ?auto_30339 ) ) ( ON ?auto_30338 ?auto_30337 ) ( ON-TABLE ?auto_30342 ) ( ON ?auto_30340 ?auto_30338 ) ( ON ?auto_30339 ?auto_30340 ) ( CLEAR ?auto_30339 ) ( HOLDING ?auto_30341 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_30341 )
      ( MAKE-2PILE ?auto_30337 ?auto_30338 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_30343 - BLOCK
      ?auto_30344 - BLOCK
    )
    :vars
    (
      ?auto_30345 - BLOCK
      ?auto_30348 - BLOCK
      ?auto_30346 - BLOCK
      ?auto_30347 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30343 ?auto_30344 ) ) ( not ( = ?auto_30343 ?auto_30345 ) ) ( not ( = ?auto_30344 ?auto_30345 ) ) ( ON ?auto_30343 ?auto_30348 ) ( not ( = ?auto_30343 ?auto_30348 ) ) ( not ( = ?auto_30344 ?auto_30348 ) ) ( not ( = ?auto_30345 ?auto_30348 ) ) ( not ( = ?auto_30346 ?auto_30347 ) ) ( not ( = ?auto_30346 ?auto_30345 ) ) ( not ( = ?auto_30346 ?auto_30344 ) ) ( not ( = ?auto_30347 ?auto_30345 ) ) ( not ( = ?auto_30347 ?auto_30344 ) ) ( not ( = ?auto_30343 ?auto_30346 ) ) ( not ( = ?auto_30343 ?auto_30347 ) ) ( not ( = ?auto_30348 ?auto_30346 ) ) ( not ( = ?auto_30348 ?auto_30347 ) ) ( ON ?auto_30344 ?auto_30343 ) ( ON-TABLE ?auto_30348 ) ( ON ?auto_30345 ?auto_30344 ) ( ON ?auto_30347 ?auto_30345 ) ( ON ?auto_30346 ?auto_30347 ) ( CLEAR ?auto_30346 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_30348 ?auto_30343 ?auto_30344 ?auto_30345 ?auto_30347 )
      ( MAKE-2PILE ?auto_30343 ?auto_30344 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_30364 - BLOCK
      ?auto_30365 - BLOCK
    )
    :vars
    (
      ?auto_30368 - BLOCK
      ?auto_30367 - BLOCK
      ?auto_30366 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30368 ?auto_30365 ) ( ON-TABLE ?auto_30364 ) ( ON ?auto_30365 ?auto_30364 ) ( not ( = ?auto_30364 ?auto_30365 ) ) ( not ( = ?auto_30364 ?auto_30368 ) ) ( not ( = ?auto_30365 ?auto_30368 ) ) ( not ( = ?auto_30364 ?auto_30367 ) ) ( not ( = ?auto_30364 ?auto_30366 ) ) ( not ( = ?auto_30365 ?auto_30367 ) ) ( not ( = ?auto_30365 ?auto_30366 ) ) ( not ( = ?auto_30368 ?auto_30367 ) ) ( not ( = ?auto_30368 ?auto_30366 ) ) ( not ( = ?auto_30367 ?auto_30366 ) ) ( ON ?auto_30367 ?auto_30368 ) ( CLEAR ?auto_30367 ) ( HOLDING ?auto_30366 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_30366 )
      ( MAKE-2PILE ?auto_30364 ?auto_30365 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_30411 - BLOCK
      ?auto_30412 - BLOCK
      ?auto_30413 - BLOCK
    )
    :vars
    (
      ?auto_30414 - BLOCK
      ?auto_30415 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_30411 ) ( not ( = ?auto_30411 ?auto_30412 ) ) ( not ( = ?auto_30411 ?auto_30413 ) ) ( not ( = ?auto_30412 ?auto_30413 ) ) ( ON ?auto_30413 ?auto_30414 ) ( not ( = ?auto_30411 ?auto_30414 ) ) ( not ( = ?auto_30412 ?auto_30414 ) ) ( not ( = ?auto_30413 ?auto_30414 ) ) ( CLEAR ?auto_30411 ) ( ON ?auto_30412 ?auto_30413 ) ( CLEAR ?auto_30412 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_30415 ) ( ON ?auto_30414 ?auto_30415 ) ( not ( = ?auto_30415 ?auto_30414 ) ) ( not ( = ?auto_30415 ?auto_30413 ) ) ( not ( = ?auto_30415 ?auto_30412 ) ) ( not ( = ?auto_30411 ?auto_30415 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_30415 ?auto_30414 ?auto_30413 )
      ( MAKE-3PILE ?auto_30411 ?auto_30412 ?auto_30413 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_30416 - BLOCK
      ?auto_30417 - BLOCK
      ?auto_30418 - BLOCK
    )
    :vars
    (
      ?auto_30419 - BLOCK
      ?auto_30420 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30416 ?auto_30417 ) ) ( not ( = ?auto_30416 ?auto_30418 ) ) ( not ( = ?auto_30417 ?auto_30418 ) ) ( ON ?auto_30418 ?auto_30419 ) ( not ( = ?auto_30416 ?auto_30419 ) ) ( not ( = ?auto_30417 ?auto_30419 ) ) ( not ( = ?auto_30418 ?auto_30419 ) ) ( ON ?auto_30417 ?auto_30418 ) ( CLEAR ?auto_30417 ) ( ON-TABLE ?auto_30420 ) ( ON ?auto_30419 ?auto_30420 ) ( not ( = ?auto_30420 ?auto_30419 ) ) ( not ( = ?auto_30420 ?auto_30418 ) ) ( not ( = ?auto_30420 ?auto_30417 ) ) ( not ( = ?auto_30416 ?auto_30420 ) ) ( HOLDING ?auto_30416 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_30416 )
      ( MAKE-3PILE ?auto_30416 ?auto_30417 ?auto_30418 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_30421 - BLOCK
      ?auto_30422 - BLOCK
      ?auto_30423 - BLOCK
    )
    :vars
    (
      ?auto_30424 - BLOCK
      ?auto_30425 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30421 ?auto_30422 ) ) ( not ( = ?auto_30421 ?auto_30423 ) ) ( not ( = ?auto_30422 ?auto_30423 ) ) ( ON ?auto_30423 ?auto_30424 ) ( not ( = ?auto_30421 ?auto_30424 ) ) ( not ( = ?auto_30422 ?auto_30424 ) ) ( not ( = ?auto_30423 ?auto_30424 ) ) ( ON ?auto_30422 ?auto_30423 ) ( ON-TABLE ?auto_30425 ) ( ON ?auto_30424 ?auto_30425 ) ( not ( = ?auto_30425 ?auto_30424 ) ) ( not ( = ?auto_30425 ?auto_30423 ) ) ( not ( = ?auto_30425 ?auto_30422 ) ) ( not ( = ?auto_30421 ?auto_30425 ) ) ( ON ?auto_30421 ?auto_30422 ) ( CLEAR ?auto_30421 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_30425 ?auto_30424 ?auto_30423 ?auto_30422 )
      ( MAKE-3PILE ?auto_30421 ?auto_30422 ?auto_30423 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_30429 - BLOCK
      ?auto_30430 - BLOCK
      ?auto_30431 - BLOCK
    )
    :vars
    (
      ?auto_30433 - BLOCK
      ?auto_30432 - BLOCK
      ?auto_30434 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30429 ?auto_30430 ) ) ( not ( = ?auto_30429 ?auto_30431 ) ) ( not ( = ?auto_30430 ?auto_30431 ) ) ( ON ?auto_30431 ?auto_30433 ) ( not ( = ?auto_30429 ?auto_30433 ) ) ( not ( = ?auto_30430 ?auto_30433 ) ) ( not ( = ?auto_30431 ?auto_30433 ) ) ( ON ?auto_30430 ?auto_30431 ) ( CLEAR ?auto_30430 ) ( ON-TABLE ?auto_30432 ) ( ON ?auto_30433 ?auto_30432 ) ( not ( = ?auto_30432 ?auto_30433 ) ) ( not ( = ?auto_30432 ?auto_30431 ) ) ( not ( = ?auto_30432 ?auto_30430 ) ) ( not ( = ?auto_30429 ?auto_30432 ) ) ( ON ?auto_30429 ?auto_30434 ) ( CLEAR ?auto_30429 ) ( HAND-EMPTY ) ( not ( = ?auto_30429 ?auto_30434 ) ) ( not ( = ?auto_30430 ?auto_30434 ) ) ( not ( = ?auto_30431 ?auto_30434 ) ) ( not ( = ?auto_30433 ?auto_30434 ) ) ( not ( = ?auto_30432 ?auto_30434 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_30429 ?auto_30434 )
      ( MAKE-3PILE ?auto_30429 ?auto_30430 ?auto_30431 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_30435 - BLOCK
      ?auto_30436 - BLOCK
      ?auto_30437 - BLOCK
    )
    :vars
    (
      ?auto_30439 - BLOCK
      ?auto_30440 - BLOCK
      ?auto_30438 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30435 ?auto_30436 ) ) ( not ( = ?auto_30435 ?auto_30437 ) ) ( not ( = ?auto_30436 ?auto_30437 ) ) ( ON ?auto_30437 ?auto_30439 ) ( not ( = ?auto_30435 ?auto_30439 ) ) ( not ( = ?auto_30436 ?auto_30439 ) ) ( not ( = ?auto_30437 ?auto_30439 ) ) ( ON-TABLE ?auto_30440 ) ( ON ?auto_30439 ?auto_30440 ) ( not ( = ?auto_30440 ?auto_30439 ) ) ( not ( = ?auto_30440 ?auto_30437 ) ) ( not ( = ?auto_30440 ?auto_30436 ) ) ( not ( = ?auto_30435 ?auto_30440 ) ) ( ON ?auto_30435 ?auto_30438 ) ( CLEAR ?auto_30435 ) ( not ( = ?auto_30435 ?auto_30438 ) ) ( not ( = ?auto_30436 ?auto_30438 ) ) ( not ( = ?auto_30437 ?auto_30438 ) ) ( not ( = ?auto_30439 ?auto_30438 ) ) ( not ( = ?auto_30440 ?auto_30438 ) ) ( HOLDING ?auto_30436 ) ( CLEAR ?auto_30437 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_30440 ?auto_30439 ?auto_30437 ?auto_30436 )
      ( MAKE-3PILE ?auto_30435 ?auto_30436 ?auto_30437 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_30441 - BLOCK
      ?auto_30442 - BLOCK
      ?auto_30443 - BLOCK
    )
    :vars
    (
      ?auto_30446 - BLOCK
      ?auto_30445 - BLOCK
      ?auto_30444 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30441 ?auto_30442 ) ) ( not ( = ?auto_30441 ?auto_30443 ) ) ( not ( = ?auto_30442 ?auto_30443 ) ) ( ON ?auto_30443 ?auto_30446 ) ( not ( = ?auto_30441 ?auto_30446 ) ) ( not ( = ?auto_30442 ?auto_30446 ) ) ( not ( = ?auto_30443 ?auto_30446 ) ) ( ON-TABLE ?auto_30445 ) ( ON ?auto_30446 ?auto_30445 ) ( not ( = ?auto_30445 ?auto_30446 ) ) ( not ( = ?auto_30445 ?auto_30443 ) ) ( not ( = ?auto_30445 ?auto_30442 ) ) ( not ( = ?auto_30441 ?auto_30445 ) ) ( ON ?auto_30441 ?auto_30444 ) ( not ( = ?auto_30441 ?auto_30444 ) ) ( not ( = ?auto_30442 ?auto_30444 ) ) ( not ( = ?auto_30443 ?auto_30444 ) ) ( not ( = ?auto_30446 ?auto_30444 ) ) ( not ( = ?auto_30445 ?auto_30444 ) ) ( CLEAR ?auto_30443 ) ( ON ?auto_30442 ?auto_30441 ) ( CLEAR ?auto_30442 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_30444 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_30444 ?auto_30441 )
      ( MAKE-3PILE ?auto_30441 ?auto_30442 ?auto_30443 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_30447 - BLOCK
      ?auto_30448 - BLOCK
      ?auto_30449 - BLOCK
    )
    :vars
    (
      ?auto_30451 - BLOCK
      ?auto_30452 - BLOCK
      ?auto_30450 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30447 ?auto_30448 ) ) ( not ( = ?auto_30447 ?auto_30449 ) ) ( not ( = ?auto_30448 ?auto_30449 ) ) ( not ( = ?auto_30447 ?auto_30451 ) ) ( not ( = ?auto_30448 ?auto_30451 ) ) ( not ( = ?auto_30449 ?auto_30451 ) ) ( ON-TABLE ?auto_30452 ) ( ON ?auto_30451 ?auto_30452 ) ( not ( = ?auto_30452 ?auto_30451 ) ) ( not ( = ?auto_30452 ?auto_30449 ) ) ( not ( = ?auto_30452 ?auto_30448 ) ) ( not ( = ?auto_30447 ?auto_30452 ) ) ( ON ?auto_30447 ?auto_30450 ) ( not ( = ?auto_30447 ?auto_30450 ) ) ( not ( = ?auto_30448 ?auto_30450 ) ) ( not ( = ?auto_30449 ?auto_30450 ) ) ( not ( = ?auto_30451 ?auto_30450 ) ) ( not ( = ?auto_30452 ?auto_30450 ) ) ( ON ?auto_30448 ?auto_30447 ) ( CLEAR ?auto_30448 ) ( ON-TABLE ?auto_30450 ) ( HOLDING ?auto_30449 ) ( CLEAR ?auto_30451 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_30452 ?auto_30451 ?auto_30449 )
      ( MAKE-3PILE ?auto_30447 ?auto_30448 ?auto_30449 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_30453 - BLOCK
      ?auto_30454 - BLOCK
      ?auto_30455 - BLOCK
    )
    :vars
    (
      ?auto_30456 - BLOCK
      ?auto_30457 - BLOCK
      ?auto_30458 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30453 ?auto_30454 ) ) ( not ( = ?auto_30453 ?auto_30455 ) ) ( not ( = ?auto_30454 ?auto_30455 ) ) ( not ( = ?auto_30453 ?auto_30456 ) ) ( not ( = ?auto_30454 ?auto_30456 ) ) ( not ( = ?auto_30455 ?auto_30456 ) ) ( ON-TABLE ?auto_30457 ) ( ON ?auto_30456 ?auto_30457 ) ( not ( = ?auto_30457 ?auto_30456 ) ) ( not ( = ?auto_30457 ?auto_30455 ) ) ( not ( = ?auto_30457 ?auto_30454 ) ) ( not ( = ?auto_30453 ?auto_30457 ) ) ( ON ?auto_30453 ?auto_30458 ) ( not ( = ?auto_30453 ?auto_30458 ) ) ( not ( = ?auto_30454 ?auto_30458 ) ) ( not ( = ?auto_30455 ?auto_30458 ) ) ( not ( = ?auto_30456 ?auto_30458 ) ) ( not ( = ?auto_30457 ?auto_30458 ) ) ( ON ?auto_30454 ?auto_30453 ) ( ON-TABLE ?auto_30458 ) ( CLEAR ?auto_30456 ) ( ON ?auto_30455 ?auto_30454 ) ( CLEAR ?auto_30455 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_30458 ?auto_30453 ?auto_30454 )
      ( MAKE-3PILE ?auto_30453 ?auto_30454 ?auto_30455 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_30459 - BLOCK
      ?auto_30460 - BLOCK
      ?auto_30461 - BLOCK
    )
    :vars
    (
      ?auto_30463 - BLOCK
      ?auto_30464 - BLOCK
      ?auto_30462 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30459 ?auto_30460 ) ) ( not ( = ?auto_30459 ?auto_30461 ) ) ( not ( = ?auto_30460 ?auto_30461 ) ) ( not ( = ?auto_30459 ?auto_30463 ) ) ( not ( = ?auto_30460 ?auto_30463 ) ) ( not ( = ?auto_30461 ?auto_30463 ) ) ( ON-TABLE ?auto_30464 ) ( not ( = ?auto_30464 ?auto_30463 ) ) ( not ( = ?auto_30464 ?auto_30461 ) ) ( not ( = ?auto_30464 ?auto_30460 ) ) ( not ( = ?auto_30459 ?auto_30464 ) ) ( ON ?auto_30459 ?auto_30462 ) ( not ( = ?auto_30459 ?auto_30462 ) ) ( not ( = ?auto_30460 ?auto_30462 ) ) ( not ( = ?auto_30461 ?auto_30462 ) ) ( not ( = ?auto_30463 ?auto_30462 ) ) ( not ( = ?auto_30464 ?auto_30462 ) ) ( ON ?auto_30460 ?auto_30459 ) ( ON-TABLE ?auto_30462 ) ( ON ?auto_30461 ?auto_30460 ) ( CLEAR ?auto_30461 ) ( HOLDING ?auto_30463 ) ( CLEAR ?auto_30464 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_30464 ?auto_30463 )
      ( MAKE-3PILE ?auto_30459 ?auto_30460 ?auto_30461 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_30465 - BLOCK
      ?auto_30466 - BLOCK
      ?auto_30467 - BLOCK
    )
    :vars
    (
      ?auto_30469 - BLOCK
      ?auto_30468 - BLOCK
      ?auto_30470 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30465 ?auto_30466 ) ) ( not ( = ?auto_30465 ?auto_30467 ) ) ( not ( = ?auto_30466 ?auto_30467 ) ) ( not ( = ?auto_30465 ?auto_30469 ) ) ( not ( = ?auto_30466 ?auto_30469 ) ) ( not ( = ?auto_30467 ?auto_30469 ) ) ( ON-TABLE ?auto_30468 ) ( not ( = ?auto_30468 ?auto_30469 ) ) ( not ( = ?auto_30468 ?auto_30467 ) ) ( not ( = ?auto_30468 ?auto_30466 ) ) ( not ( = ?auto_30465 ?auto_30468 ) ) ( ON ?auto_30465 ?auto_30470 ) ( not ( = ?auto_30465 ?auto_30470 ) ) ( not ( = ?auto_30466 ?auto_30470 ) ) ( not ( = ?auto_30467 ?auto_30470 ) ) ( not ( = ?auto_30469 ?auto_30470 ) ) ( not ( = ?auto_30468 ?auto_30470 ) ) ( ON ?auto_30466 ?auto_30465 ) ( ON-TABLE ?auto_30470 ) ( ON ?auto_30467 ?auto_30466 ) ( CLEAR ?auto_30468 ) ( ON ?auto_30469 ?auto_30467 ) ( CLEAR ?auto_30469 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_30470 ?auto_30465 ?auto_30466 ?auto_30467 )
      ( MAKE-3PILE ?auto_30465 ?auto_30466 ?auto_30467 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_30471 - BLOCK
      ?auto_30472 - BLOCK
      ?auto_30473 - BLOCK
    )
    :vars
    (
      ?auto_30476 - BLOCK
      ?auto_30475 - BLOCK
      ?auto_30474 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30471 ?auto_30472 ) ) ( not ( = ?auto_30471 ?auto_30473 ) ) ( not ( = ?auto_30472 ?auto_30473 ) ) ( not ( = ?auto_30471 ?auto_30476 ) ) ( not ( = ?auto_30472 ?auto_30476 ) ) ( not ( = ?auto_30473 ?auto_30476 ) ) ( not ( = ?auto_30475 ?auto_30476 ) ) ( not ( = ?auto_30475 ?auto_30473 ) ) ( not ( = ?auto_30475 ?auto_30472 ) ) ( not ( = ?auto_30471 ?auto_30475 ) ) ( ON ?auto_30471 ?auto_30474 ) ( not ( = ?auto_30471 ?auto_30474 ) ) ( not ( = ?auto_30472 ?auto_30474 ) ) ( not ( = ?auto_30473 ?auto_30474 ) ) ( not ( = ?auto_30476 ?auto_30474 ) ) ( not ( = ?auto_30475 ?auto_30474 ) ) ( ON ?auto_30472 ?auto_30471 ) ( ON-TABLE ?auto_30474 ) ( ON ?auto_30473 ?auto_30472 ) ( ON ?auto_30476 ?auto_30473 ) ( CLEAR ?auto_30476 ) ( HOLDING ?auto_30475 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_30475 )
      ( MAKE-3PILE ?auto_30471 ?auto_30472 ?auto_30473 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_30477 - BLOCK
      ?auto_30478 - BLOCK
      ?auto_30479 - BLOCK
    )
    :vars
    (
      ?auto_30480 - BLOCK
      ?auto_30482 - BLOCK
      ?auto_30481 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30477 ?auto_30478 ) ) ( not ( = ?auto_30477 ?auto_30479 ) ) ( not ( = ?auto_30478 ?auto_30479 ) ) ( not ( = ?auto_30477 ?auto_30480 ) ) ( not ( = ?auto_30478 ?auto_30480 ) ) ( not ( = ?auto_30479 ?auto_30480 ) ) ( not ( = ?auto_30482 ?auto_30480 ) ) ( not ( = ?auto_30482 ?auto_30479 ) ) ( not ( = ?auto_30482 ?auto_30478 ) ) ( not ( = ?auto_30477 ?auto_30482 ) ) ( ON ?auto_30477 ?auto_30481 ) ( not ( = ?auto_30477 ?auto_30481 ) ) ( not ( = ?auto_30478 ?auto_30481 ) ) ( not ( = ?auto_30479 ?auto_30481 ) ) ( not ( = ?auto_30480 ?auto_30481 ) ) ( not ( = ?auto_30482 ?auto_30481 ) ) ( ON ?auto_30478 ?auto_30477 ) ( ON-TABLE ?auto_30481 ) ( ON ?auto_30479 ?auto_30478 ) ( ON ?auto_30480 ?auto_30479 ) ( ON ?auto_30482 ?auto_30480 ) ( CLEAR ?auto_30482 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_30481 ?auto_30477 ?auto_30478 ?auto_30479 ?auto_30480 )
      ( MAKE-3PILE ?auto_30477 ?auto_30478 ?auto_30479 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_30494 - BLOCK
    )
    :vars
    (
      ?auto_30496 - BLOCK
      ?auto_30497 - BLOCK
      ?auto_30495 - BLOCK
      ?auto_30498 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30496 ?auto_30494 ) ( ON-TABLE ?auto_30494 ) ( not ( = ?auto_30494 ?auto_30496 ) ) ( not ( = ?auto_30494 ?auto_30497 ) ) ( not ( = ?auto_30494 ?auto_30495 ) ) ( not ( = ?auto_30496 ?auto_30497 ) ) ( not ( = ?auto_30496 ?auto_30495 ) ) ( not ( = ?auto_30497 ?auto_30495 ) ) ( ON ?auto_30497 ?auto_30496 ) ( CLEAR ?auto_30497 ) ( HOLDING ?auto_30495 ) ( CLEAR ?auto_30498 ) ( ON-TABLE ?auto_30498 ) ( not ( = ?auto_30498 ?auto_30495 ) ) ( not ( = ?auto_30494 ?auto_30498 ) ) ( not ( = ?auto_30496 ?auto_30498 ) ) ( not ( = ?auto_30497 ?auto_30498 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_30498 ?auto_30495 )
      ( MAKE-1PILE ?auto_30494 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_30499 - BLOCK
    )
    :vars
    (
      ?auto_30501 - BLOCK
      ?auto_30503 - BLOCK
      ?auto_30502 - BLOCK
      ?auto_30500 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30501 ?auto_30499 ) ( ON-TABLE ?auto_30499 ) ( not ( = ?auto_30499 ?auto_30501 ) ) ( not ( = ?auto_30499 ?auto_30503 ) ) ( not ( = ?auto_30499 ?auto_30502 ) ) ( not ( = ?auto_30501 ?auto_30503 ) ) ( not ( = ?auto_30501 ?auto_30502 ) ) ( not ( = ?auto_30503 ?auto_30502 ) ) ( ON ?auto_30503 ?auto_30501 ) ( CLEAR ?auto_30500 ) ( ON-TABLE ?auto_30500 ) ( not ( = ?auto_30500 ?auto_30502 ) ) ( not ( = ?auto_30499 ?auto_30500 ) ) ( not ( = ?auto_30501 ?auto_30500 ) ) ( not ( = ?auto_30503 ?auto_30500 ) ) ( ON ?auto_30502 ?auto_30503 ) ( CLEAR ?auto_30502 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_30499 ?auto_30501 ?auto_30503 )
      ( MAKE-1PILE ?auto_30499 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_30504 - BLOCK
    )
    :vars
    (
      ?auto_30507 - BLOCK
      ?auto_30508 - BLOCK
      ?auto_30505 - BLOCK
      ?auto_30506 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30507 ?auto_30504 ) ( ON-TABLE ?auto_30504 ) ( not ( = ?auto_30504 ?auto_30507 ) ) ( not ( = ?auto_30504 ?auto_30508 ) ) ( not ( = ?auto_30504 ?auto_30505 ) ) ( not ( = ?auto_30507 ?auto_30508 ) ) ( not ( = ?auto_30507 ?auto_30505 ) ) ( not ( = ?auto_30508 ?auto_30505 ) ) ( ON ?auto_30508 ?auto_30507 ) ( not ( = ?auto_30506 ?auto_30505 ) ) ( not ( = ?auto_30504 ?auto_30506 ) ) ( not ( = ?auto_30507 ?auto_30506 ) ) ( not ( = ?auto_30508 ?auto_30506 ) ) ( ON ?auto_30505 ?auto_30508 ) ( CLEAR ?auto_30505 ) ( HOLDING ?auto_30506 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_30506 )
      ( MAKE-1PILE ?auto_30504 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_30515 - BLOCK
    )
    :vars
    (
      ?auto_30517 - BLOCK
      ?auto_30518 - BLOCK
      ?auto_30516 - BLOCK
      ?auto_30519 - BLOCK
      ?auto_30520 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30517 ?auto_30515 ) ( ON-TABLE ?auto_30515 ) ( not ( = ?auto_30515 ?auto_30517 ) ) ( not ( = ?auto_30515 ?auto_30518 ) ) ( not ( = ?auto_30515 ?auto_30516 ) ) ( not ( = ?auto_30517 ?auto_30518 ) ) ( not ( = ?auto_30517 ?auto_30516 ) ) ( not ( = ?auto_30518 ?auto_30516 ) ) ( ON ?auto_30518 ?auto_30517 ) ( not ( = ?auto_30519 ?auto_30516 ) ) ( not ( = ?auto_30515 ?auto_30519 ) ) ( not ( = ?auto_30517 ?auto_30519 ) ) ( not ( = ?auto_30518 ?auto_30519 ) ) ( ON ?auto_30516 ?auto_30518 ) ( CLEAR ?auto_30516 ) ( ON ?auto_30519 ?auto_30520 ) ( CLEAR ?auto_30519 ) ( HAND-EMPTY ) ( not ( = ?auto_30515 ?auto_30520 ) ) ( not ( = ?auto_30517 ?auto_30520 ) ) ( not ( = ?auto_30518 ?auto_30520 ) ) ( not ( = ?auto_30516 ?auto_30520 ) ) ( not ( = ?auto_30519 ?auto_30520 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_30519 ?auto_30520 )
      ( MAKE-1PILE ?auto_30515 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_30521 - BLOCK
    )
    :vars
    (
      ?auto_30524 - BLOCK
      ?auto_30525 - BLOCK
      ?auto_30522 - BLOCK
      ?auto_30523 - BLOCK
      ?auto_30526 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30524 ?auto_30521 ) ( ON-TABLE ?auto_30521 ) ( not ( = ?auto_30521 ?auto_30524 ) ) ( not ( = ?auto_30521 ?auto_30525 ) ) ( not ( = ?auto_30521 ?auto_30522 ) ) ( not ( = ?auto_30524 ?auto_30525 ) ) ( not ( = ?auto_30524 ?auto_30522 ) ) ( not ( = ?auto_30525 ?auto_30522 ) ) ( ON ?auto_30525 ?auto_30524 ) ( not ( = ?auto_30523 ?auto_30522 ) ) ( not ( = ?auto_30521 ?auto_30523 ) ) ( not ( = ?auto_30524 ?auto_30523 ) ) ( not ( = ?auto_30525 ?auto_30523 ) ) ( ON ?auto_30523 ?auto_30526 ) ( CLEAR ?auto_30523 ) ( not ( = ?auto_30521 ?auto_30526 ) ) ( not ( = ?auto_30524 ?auto_30526 ) ) ( not ( = ?auto_30525 ?auto_30526 ) ) ( not ( = ?auto_30522 ?auto_30526 ) ) ( not ( = ?auto_30523 ?auto_30526 ) ) ( HOLDING ?auto_30522 ) ( CLEAR ?auto_30525 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_30521 ?auto_30524 ?auto_30525 ?auto_30522 )
      ( MAKE-1PILE ?auto_30521 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_30555 - BLOCK
      ?auto_30556 - BLOCK
      ?auto_30557 - BLOCK
      ?auto_30558 - BLOCK
    )
    :vars
    (
      ?auto_30559 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_30555 ) ( ON ?auto_30556 ?auto_30555 ) ( not ( = ?auto_30555 ?auto_30556 ) ) ( not ( = ?auto_30555 ?auto_30557 ) ) ( not ( = ?auto_30555 ?auto_30558 ) ) ( not ( = ?auto_30556 ?auto_30557 ) ) ( not ( = ?auto_30556 ?auto_30558 ) ) ( not ( = ?auto_30557 ?auto_30558 ) ) ( ON ?auto_30558 ?auto_30559 ) ( not ( = ?auto_30555 ?auto_30559 ) ) ( not ( = ?auto_30556 ?auto_30559 ) ) ( not ( = ?auto_30557 ?auto_30559 ) ) ( not ( = ?auto_30558 ?auto_30559 ) ) ( CLEAR ?auto_30556 ) ( ON ?auto_30557 ?auto_30558 ) ( CLEAR ?auto_30557 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_30559 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_30559 ?auto_30558 )
      ( MAKE-4PILE ?auto_30555 ?auto_30556 ?auto_30557 ?auto_30558 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_30560 - BLOCK
      ?auto_30561 - BLOCK
      ?auto_30562 - BLOCK
      ?auto_30563 - BLOCK
    )
    :vars
    (
      ?auto_30564 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_30560 ) ( not ( = ?auto_30560 ?auto_30561 ) ) ( not ( = ?auto_30560 ?auto_30562 ) ) ( not ( = ?auto_30560 ?auto_30563 ) ) ( not ( = ?auto_30561 ?auto_30562 ) ) ( not ( = ?auto_30561 ?auto_30563 ) ) ( not ( = ?auto_30562 ?auto_30563 ) ) ( ON ?auto_30563 ?auto_30564 ) ( not ( = ?auto_30560 ?auto_30564 ) ) ( not ( = ?auto_30561 ?auto_30564 ) ) ( not ( = ?auto_30562 ?auto_30564 ) ) ( not ( = ?auto_30563 ?auto_30564 ) ) ( ON ?auto_30562 ?auto_30563 ) ( CLEAR ?auto_30562 ) ( ON-TABLE ?auto_30564 ) ( HOLDING ?auto_30561 ) ( CLEAR ?auto_30560 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_30560 ?auto_30561 )
      ( MAKE-4PILE ?auto_30560 ?auto_30561 ?auto_30562 ?auto_30563 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_30565 - BLOCK
      ?auto_30566 - BLOCK
      ?auto_30567 - BLOCK
      ?auto_30568 - BLOCK
    )
    :vars
    (
      ?auto_30569 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_30565 ) ( not ( = ?auto_30565 ?auto_30566 ) ) ( not ( = ?auto_30565 ?auto_30567 ) ) ( not ( = ?auto_30565 ?auto_30568 ) ) ( not ( = ?auto_30566 ?auto_30567 ) ) ( not ( = ?auto_30566 ?auto_30568 ) ) ( not ( = ?auto_30567 ?auto_30568 ) ) ( ON ?auto_30568 ?auto_30569 ) ( not ( = ?auto_30565 ?auto_30569 ) ) ( not ( = ?auto_30566 ?auto_30569 ) ) ( not ( = ?auto_30567 ?auto_30569 ) ) ( not ( = ?auto_30568 ?auto_30569 ) ) ( ON ?auto_30567 ?auto_30568 ) ( ON-TABLE ?auto_30569 ) ( CLEAR ?auto_30565 ) ( ON ?auto_30566 ?auto_30567 ) ( CLEAR ?auto_30566 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_30569 ?auto_30568 ?auto_30567 )
      ( MAKE-4PILE ?auto_30565 ?auto_30566 ?auto_30567 ?auto_30568 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_30570 - BLOCK
      ?auto_30571 - BLOCK
      ?auto_30572 - BLOCK
      ?auto_30573 - BLOCK
    )
    :vars
    (
      ?auto_30574 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30570 ?auto_30571 ) ) ( not ( = ?auto_30570 ?auto_30572 ) ) ( not ( = ?auto_30570 ?auto_30573 ) ) ( not ( = ?auto_30571 ?auto_30572 ) ) ( not ( = ?auto_30571 ?auto_30573 ) ) ( not ( = ?auto_30572 ?auto_30573 ) ) ( ON ?auto_30573 ?auto_30574 ) ( not ( = ?auto_30570 ?auto_30574 ) ) ( not ( = ?auto_30571 ?auto_30574 ) ) ( not ( = ?auto_30572 ?auto_30574 ) ) ( not ( = ?auto_30573 ?auto_30574 ) ) ( ON ?auto_30572 ?auto_30573 ) ( ON-TABLE ?auto_30574 ) ( ON ?auto_30571 ?auto_30572 ) ( CLEAR ?auto_30571 ) ( HOLDING ?auto_30570 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_30570 )
      ( MAKE-4PILE ?auto_30570 ?auto_30571 ?auto_30572 ?auto_30573 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_30575 - BLOCK
      ?auto_30576 - BLOCK
      ?auto_30577 - BLOCK
      ?auto_30578 - BLOCK
    )
    :vars
    (
      ?auto_30579 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30575 ?auto_30576 ) ) ( not ( = ?auto_30575 ?auto_30577 ) ) ( not ( = ?auto_30575 ?auto_30578 ) ) ( not ( = ?auto_30576 ?auto_30577 ) ) ( not ( = ?auto_30576 ?auto_30578 ) ) ( not ( = ?auto_30577 ?auto_30578 ) ) ( ON ?auto_30578 ?auto_30579 ) ( not ( = ?auto_30575 ?auto_30579 ) ) ( not ( = ?auto_30576 ?auto_30579 ) ) ( not ( = ?auto_30577 ?auto_30579 ) ) ( not ( = ?auto_30578 ?auto_30579 ) ) ( ON ?auto_30577 ?auto_30578 ) ( ON-TABLE ?auto_30579 ) ( ON ?auto_30576 ?auto_30577 ) ( ON ?auto_30575 ?auto_30576 ) ( CLEAR ?auto_30575 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_30579 ?auto_30578 ?auto_30577 ?auto_30576 )
      ( MAKE-4PILE ?auto_30575 ?auto_30576 ?auto_30577 ?auto_30578 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_30584 - BLOCK
      ?auto_30585 - BLOCK
      ?auto_30586 - BLOCK
      ?auto_30587 - BLOCK
    )
    :vars
    (
      ?auto_30588 - BLOCK
      ?auto_30589 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30584 ?auto_30585 ) ) ( not ( = ?auto_30584 ?auto_30586 ) ) ( not ( = ?auto_30584 ?auto_30587 ) ) ( not ( = ?auto_30585 ?auto_30586 ) ) ( not ( = ?auto_30585 ?auto_30587 ) ) ( not ( = ?auto_30586 ?auto_30587 ) ) ( ON ?auto_30587 ?auto_30588 ) ( not ( = ?auto_30584 ?auto_30588 ) ) ( not ( = ?auto_30585 ?auto_30588 ) ) ( not ( = ?auto_30586 ?auto_30588 ) ) ( not ( = ?auto_30587 ?auto_30588 ) ) ( ON ?auto_30586 ?auto_30587 ) ( ON-TABLE ?auto_30588 ) ( ON ?auto_30585 ?auto_30586 ) ( CLEAR ?auto_30585 ) ( ON ?auto_30584 ?auto_30589 ) ( CLEAR ?auto_30584 ) ( HAND-EMPTY ) ( not ( = ?auto_30584 ?auto_30589 ) ) ( not ( = ?auto_30585 ?auto_30589 ) ) ( not ( = ?auto_30586 ?auto_30589 ) ) ( not ( = ?auto_30587 ?auto_30589 ) ) ( not ( = ?auto_30588 ?auto_30589 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_30584 ?auto_30589 )
      ( MAKE-4PILE ?auto_30584 ?auto_30585 ?auto_30586 ?auto_30587 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_30590 - BLOCK
      ?auto_30591 - BLOCK
      ?auto_30592 - BLOCK
      ?auto_30593 - BLOCK
    )
    :vars
    (
      ?auto_30594 - BLOCK
      ?auto_30595 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30590 ?auto_30591 ) ) ( not ( = ?auto_30590 ?auto_30592 ) ) ( not ( = ?auto_30590 ?auto_30593 ) ) ( not ( = ?auto_30591 ?auto_30592 ) ) ( not ( = ?auto_30591 ?auto_30593 ) ) ( not ( = ?auto_30592 ?auto_30593 ) ) ( ON ?auto_30593 ?auto_30594 ) ( not ( = ?auto_30590 ?auto_30594 ) ) ( not ( = ?auto_30591 ?auto_30594 ) ) ( not ( = ?auto_30592 ?auto_30594 ) ) ( not ( = ?auto_30593 ?auto_30594 ) ) ( ON ?auto_30592 ?auto_30593 ) ( ON-TABLE ?auto_30594 ) ( ON ?auto_30590 ?auto_30595 ) ( CLEAR ?auto_30590 ) ( not ( = ?auto_30590 ?auto_30595 ) ) ( not ( = ?auto_30591 ?auto_30595 ) ) ( not ( = ?auto_30592 ?auto_30595 ) ) ( not ( = ?auto_30593 ?auto_30595 ) ) ( not ( = ?auto_30594 ?auto_30595 ) ) ( HOLDING ?auto_30591 ) ( CLEAR ?auto_30592 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_30594 ?auto_30593 ?auto_30592 ?auto_30591 )
      ( MAKE-4PILE ?auto_30590 ?auto_30591 ?auto_30592 ?auto_30593 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_30596 - BLOCK
      ?auto_30597 - BLOCK
      ?auto_30598 - BLOCK
      ?auto_30599 - BLOCK
    )
    :vars
    (
      ?auto_30601 - BLOCK
      ?auto_30600 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30596 ?auto_30597 ) ) ( not ( = ?auto_30596 ?auto_30598 ) ) ( not ( = ?auto_30596 ?auto_30599 ) ) ( not ( = ?auto_30597 ?auto_30598 ) ) ( not ( = ?auto_30597 ?auto_30599 ) ) ( not ( = ?auto_30598 ?auto_30599 ) ) ( ON ?auto_30599 ?auto_30601 ) ( not ( = ?auto_30596 ?auto_30601 ) ) ( not ( = ?auto_30597 ?auto_30601 ) ) ( not ( = ?auto_30598 ?auto_30601 ) ) ( not ( = ?auto_30599 ?auto_30601 ) ) ( ON ?auto_30598 ?auto_30599 ) ( ON-TABLE ?auto_30601 ) ( ON ?auto_30596 ?auto_30600 ) ( not ( = ?auto_30596 ?auto_30600 ) ) ( not ( = ?auto_30597 ?auto_30600 ) ) ( not ( = ?auto_30598 ?auto_30600 ) ) ( not ( = ?auto_30599 ?auto_30600 ) ) ( not ( = ?auto_30601 ?auto_30600 ) ) ( CLEAR ?auto_30598 ) ( ON ?auto_30597 ?auto_30596 ) ( CLEAR ?auto_30597 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_30600 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_30600 ?auto_30596 )
      ( MAKE-4PILE ?auto_30596 ?auto_30597 ?auto_30598 ?auto_30599 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_30602 - BLOCK
      ?auto_30603 - BLOCK
      ?auto_30604 - BLOCK
      ?auto_30605 - BLOCK
    )
    :vars
    (
      ?auto_30607 - BLOCK
      ?auto_30606 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30602 ?auto_30603 ) ) ( not ( = ?auto_30602 ?auto_30604 ) ) ( not ( = ?auto_30602 ?auto_30605 ) ) ( not ( = ?auto_30603 ?auto_30604 ) ) ( not ( = ?auto_30603 ?auto_30605 ) ) ( not ( = ?auto_30604 ?auto_30605 ) ) ( ON ?auto_30605 ?auto_30607 ) ( not ( = ?auto_30602 ?auto_30607 ) ) ( not ( = ?auto_30603 ?auto_30607 ) ) ( not ( = ?auto_30604 ?auto_30607 ) ) ( not ( = ?auto_30605 ?auto_30607 ) ) ( ON-TABLE ?auto_30607 ) ( ON ?auto_30602 ?auto_30606 ) ( not ( = ?auto_30602 ?auto_30606 ) ) ( not ( = ?auto_30603 ?auto_30606 ) ) ( not ( = ?auto_30604 ?auto_30606 ) ) ( not ( = ?auto_30605 ?auto_30606 ) ) ( not ( = ?auto_30607 ?auto_30606 ) ) ( ON ?auto_30603 ?auto_30602 ) ( CLEAR ?auto_30603 ) ( ON-TABLE ?auto_30606 ) ( HOLDING ?auto_30604 ) ( CLEAR ?auto_30605 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_30607 ?auto_30605 ?auto_30604 )
      ( MAKE-4PILE ?auto_30602 ?auto_30603 ?auto_30604 ?auto_30605 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_30608 - BLOCK
      ?auto_30609 - BLOCK
      ?auto_30610 - BLOCK
      ?auto_30611 - BLOCK
    )
    :vars
    (
      ?auto_30612 - BLOCK
      ?auto_30613 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30608 ?auto_30609 ) ) ( not ( = ?auto_30608 ?auto_30610 ) ) ( not ( = ?auto_30608 ?auto_30611 ) ) ( not ( = ?auto_30609 ?auto_30610 ) ) ( not ( = ?auto_30609 ?auto_30611 ) ) ( not ( = ?auto_30610 ?auto_30611 ) ) ( ON ?auto_30611 ?auto_30612 ) ( not ( = ?auto_30608 ?auto_30612 ) ) ( not ( = ?auto_30609 ?auto_30612 ) ) ( not ( = ?auto_30610 ?auto_30612 ) ) ( not ( = ?auto_30611 ?auto_30612 ) ) ( ON-TABLE ?auto_30612 ) ( ON ?auto_30608 ?auto_30613 ) ( not ( = ?auto_30608 ?auto_30613 ) ) ( not ( = ?auto_30609 ?auto_30613 ) ) ( not ( = ?auto_30610 ?auto_30613 ) ) ( not ( = ?auto_30611 ?auto_30613 ) ) ( not ( = ?auto_30612 ?auto_30613 ) ) ( ON ?auto_30609 ?auto_30608 ) ( ON-TABLE ?auto_30613 ) ( CLEAR ?auto_30611 ) ( ON ?auto_30610 ?auto_30609 ) ( CLEAR ?auto_30610 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_30613 ?auto_30608 ?auto_30609 )
      ( MAKE-4PILE ?auto_30608 ?auto_30609 ?auto_30610 ?auto_30611 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_30614 - BLOCK
      ?auto_30615 - BLOCK
      ?auto_30616 - BLOCK
      ?auto_30617 - BLOCK
    )
    :vars
    (
      ?auto_30618 - BLOCK
      ?auto_30619 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30614 ?auto_30615 ) ) ( not ( = ?auto_30614 ?auto_30616 ) ) ( not ( = ?auto_30614 ?auto_30617 ) ) ( not ( = ?auto_30615 ?auto_30616 ) ) ( not ( = ?auto_30615 ?auto_30617 ) ) ( not ( = ?auto_30616 ?auto_30617 ) ) ( not ( = ?auto_30614 ?auto_30618 ) ) ( not ( = ?auto_30615 ?auto_30618 ) ) ( not ( = ?auto_30616 ?auto_30618 ) ) ( not ( = ?auto_30617 ?auto_30618 ) ) ( ON-TABLE ?auto_30618 ) ( ON ?auto_30614 ?auto_30619 ) ( not ( = ?auto_30614 ?auto_30619 ) ) ( not ( = ?auto_30615 ?auto_30619 ) ) ( not ( = ?auto_30616 ?auto_30619 ) ) ( not ( = ?auto_30617 ?auto_30619 ) ) ( not ( = ?auto_30618 ?auto_30619 ) ) ( ON ?auto_30615 ?auto_30614 ) ( ON-TABLE ?auto_30619 ) ( ON ?auto_30616 ?auto_30615 ) ( CLEAR ?auto_30616 ) ( HOLDING ?auto_30617 ) ( CLEAR ?auto_30618 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_30618 ?auto_30617 )
      ( MAKE-4PILE ?auto_30614 ?auto_30615 ?auto_30616 ?auto_30617 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_30620 - BLOCK
      ?auto_30621 - BLOCK
      ?auto_30622 - BLOCK
      ?auto_30623 - BLOCK
    )
    :vars
    (
      ?auto_30624 - BLOCK
      ?auto_30625 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30620 ?auto_30621 ) ) ( not ( = ?auto_30620 ?auto_30622 ) ) ( not ( = ?auto_30620 ?auto_30623 ) ) ( not ( = ?auto_30621 ?auto_30622 ) ) ( not ( = ?auto_30621 ?auto_30623 ) ) ( not ( = ?auto_30622 ?auto_30623 ) ) ( not ( = ?auto_30620 ?auto_30624 ) ) ( not ( = ?auto_30621 ?auto_30624 ) ) ( not ( = ?auto_30622 ?auto_30624 ) ) ( not ( = ?auto_30623 ?auto_30624 ) ) ( ON-TABLE ?auto_30624 ) ( ON ?auto_30620 ?auto_30625 ) ( not ( = ?auto_30620 ?auto_30625 ) ) ( not ( = ?auto_30621 ?auto_30625 ) ) ( not ( = ?auto_30622 ?auto_30625 ) ) ( not ( = ?auto_30623 ?auto_30625 ) ) ( not ( = ?auto_30624 ?auto_30625 ) ) ( ON ?auto_30621 ?auto_30620 ) ( ON-TABLE ?auto_30625 ) ( ON ?auto_30622 ?auto_30621 ) ( CLEAR ?auto_30624 ) ( ON ?auto_30623 ?auto_30622 ) ( CLEAR ?auto_30623 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_30625 ?auto_30620 ?auto_30621 ?auto_30622 )
      ( MAKE-4PILE ?auto_30620 ?auto_30621 ?auto_30622 ?auto_30623 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_30626 - BLOCK
      ?auto_30627 - BLOCK
      ?auto_30628 - BLOCK
      ?auto_30629 - BLOCK
    )
    :vars
    (
      ?auto_30630 - BLOCK
      ?auto_30631 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30626 ?auto_30627 ) ) ( not ( = ?auto_30626 ?auto_30628 ) ) ( not ( = ?auto_30626 ?auto_30629 ) ) ( not ( = ?auto_30627 ?auto_30628 ) ) ( not ( = ?auto_30627 ?auto_30629 ) ) ( not ( = ?auto_30628 ?auto_30629 ) ) ( not ( = ?auto_30626 ?auto_30630 ) ) ( not ( = ?auto_30627 ?auto_30630 ) ) ( not ( = ?auto_30628 ?auto_30630 ) ) ( not ( = ?auto_30629 ?auto_30630 ) ) ( ON ?auto_30626 ?auto_30631 ) ( not ( = ?auto_30626 ?auto_30631 ) ) ( not ( = ?auto_30627 ?auto_30631 ) ) ( not ( = ?auto_30628 ?auto_30631 ) ) ( not ( = ?auto_30629 ?auto_30631 ) ) ( not ( = ?auto_30630 ?auto_30631 ) ) ( ON ?auto_30627 ?auto_30626 ) ( ON-TABLE ?auto_30631 ) ( ON ?auto_30628 ?auto_30627 ) ( ON ?auto_30629 ?auto_30628 ) ( CLEAR ?auto_30629 ) ( HOLDING ?auto_30630 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_30630 )
      ( MAKE-4PILE ?auto_30626 ?auto_30627 ?auto_30628 ?auto_30629 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_30632 - BLOCK
      ?auto_30633 - BLOCK
      ?auto_30634 - BLOCK
      ?auto_30635 - BLOCK
    )
    :vars
    (
      ?auto_30636 - BLOCK
      ?auto_30637 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30632 ?auto_30633 ) ) ( not ( = ?auto_30632 ?auto_30634 ) ) ( not ( = ?auto_30632 ?auto_30635 ) ) ( not ( = ?auto_30633 ?auto_30634 ) ) ( not ( = ?auto_30633 ?auto_30635 ) ) ( not ( = ?auto_30634 ?auto_30635 ) ) ( not ( = ?auto_30632 ?auto_30636 ) ) ( not ( = ?auto_30633 ?auto_30636 ) ) ( not ( = ?auto_30634 ?auto_30636 ) ) ( not ( = ?auto_30635 ?auto_30636 ) ) ( ON ?auto_30632 ?auto_30637 ) ( not ( = ?auto_30632 ?auto_30637 ) ) ( not ( = ?auto_30633 ?auto_30637 ) ) ( not ( = ?auto_30634 ?auto_30637 ) ) ( not ( = ?auto_30635 ?auto_30637 ) ) ( not ( = ?auto_30636 ?auto_30637 ) ) ( ON ?auto_30633 ?auto_30632 ) ( ON-TABLE ?auto_30637 ) ( ON ?auto_30634 ?auto_30633 ) ( ON ?auto_30635 ?auto_30634 ) ( ON ?auto_30636 ?auto_30635 ) ( CLEAR ?auto_30636 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_30637 ?auto_30632 ?auto_30633 ?auto_30634 ?auto_30635 )
      ( MAKE-4PILE ?auto_30632 ?auto_30633 ?auto_30634 ?auto_30635 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_30648 - BLOCK
      ?auto_30649 - BLOCK
      ?auto_30650 - BLOCK
      ?auto_30651 - BLOCK
      ?auto_30652 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_30651 ) ( ON-TABLE ?auto_30648 ) ( ON ?auto_30649 ?auto_30648 ) ( ON ?auto_30650 ?auto_30649 ) ( ON ?auto_30651 ?auto_30650 ) ( not ( = ?auto_30648 ?auto_30649 ) ) ( not ( = ?auto_30648 ?auto_30650 ) ) ( not ( = ?auto_30648 ?auto_30651 ) ) ( not ( = ?auto_30648 ?auto_30652 ) ) ( not ( = ?auto_30649 ?auto_30650 ) ) ( not ( = ?auto_30649 ?auto_30651 ) ) ( not ( = ?auto_30649 ?auto_30652 ) ) ( not ( = ?auto_30650 ?auto_30651 ) ) ( not ( = ?auto_30650 ?auto_30652 ) ) ( not ( = ?auto_30651 ?auto_30652 ) ) ( ON-TABLE ?auto_30652 ) ( CLEAR ?auto_30652 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_30652 )
      ( MAKE-5PILE ?auto_30648 ?auto_30649 ?auto_30650 ?auto_30651 ?auto_30652 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_30653 - BLOCK
      ?auto_30654 - BLOCK
      ?auto_30655 - BLOCK
      ?auto_30656 - BLOCK
      ?auto_30657 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_30653 ) ( ON ?auto_30654 ?auto_30653 ) ( ON ?auto_30655 ?auto_30654 ) ( not ( = ?auto_30653 ?auto_30654 ) ) ( not ( = ?auto_30653 ?auto_30655 ) ) ( not ( = ?auto_30653 ?auto_30656 ) ) ( not ( = ?auto_30653 ?auto_30657 ) ) ( not ( = ?auto_30654 ?auto_30655 ) ) ( not ( = ?auto_30654 ?auto_30656 ) ) ( not ( = ?auto_30654 ?auto_30657 ) ) ( not ( = ?auto_30655 ?auto_30656 ) ) ( not ( = ?auto_30655 ?auto_30657 ) ) ( not ( = ?auto_30656 ?auto_30657 ) ) ( ON-TABLE ?auto_30657 ) ( CLEAR ?auto_30657 ) ( HOLDING ?auto_30656 ) ( CLEAR ?auto_30655 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_30653 ?auto_30654 ?auto_30655 ?auto_30656 )
      ( MAKE-5PILE ?auto_30653 ?auto_30654 ?auto_30655 ?auto_30656 ?auto_30657 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_30658 - BLOCK
      ?auto_30659 - BLOCK
      ?auto_30660 - BLOCK
      ?auto_30661 - BLOCK
      ?auto_30662 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_30658 ) ( ON ?auto_30659 ?auto_30658 ) ( ON ?auto_30660 ?auto_30659 ) ( not ( = ?auto_30658 ?auto_30659 ) ) ( not ( = ?auto_30658 ?auto_30660 ) ) ( not ( = ?auto_30658 ?auto_30661 ) ) ( not ( = ?auto_30658 ?auto_30662 ) ) ( not ( = ?auto_30659 ?auto_30660 ) ) ( not ( = ?auto_30659 ?auto_30661 ) ) ( not ( = ?auto_30659 ?auto_30662 ) ) ( not ( = ?auto_30660 ?auto_30661 ) ) ( not ( = ?auto_30660 ?auto_30662 ) ) ( not ( = ?auto_30661 ?auto_30662 ) ) ( ON-TABLE ?auto_30662 ) ( CLEAR ?auto_30660 ) ( ON ?auto_30661 ?auto_30662 ) ( CLEAR ?auto_30661 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_30662 )
      ( MAKE-5PILE ?auto_30658 ?auto_30659 ?auto_30660 ?auto_30661 ?auto_30662 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_30663 - BLOCK
      ?auto_30664 - BLOCK
      ?auto_30665 - BLOCK
      ?auto_30666 - BLOCK
      ?auto_30667 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_30663 ) ( ON ?auto_30664 ?auto_30663 ) ( not ( = ?auto_30663 ?auto_30664 ) ) ( not ( = ?auto_30663 ?auto_30665 ) ) ( not ( = ?auto_30663 ?auto_30666 ) ) ( not ( = ?auto_30663 ?auto_30667 ) ) ( not ( = ?auto_30664 ?auto_30665 ) ) ( not ( = ?auto_30664 ?auto_30666 ) ) ( not ( = ?auto_30664 ?auto_30667 ) ) ( not ( = ?auto_30665 ?auto_30666 ) ) ( not ( = ?auto_30665 ?auto_30667 ) ) ( not ( = ?auto_30666 ?auto_30667 ) ) ( ON-TABLE ?auto_30667 ) ( ON ?auto_30666 ?auto_30667 ) ( CLEAR ?auto_30666 ) ( HOLDING ?auto_30665 ) ( CLEAR ?auto_30664 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_30663 ?auto_30664 ?auto_30665 )
      ( MAKE-5PILE ?auto_30663 ?auto_30664 ?auto_30665 ?auto_30666 ?auto_30667 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_30668 - BLOCK
      ?auto_30669 - BLOCK
      ?auto_30670 - BLOCK
      ?auto_30671 - BLOCK
      ?auto_30672 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_30668 ) ( ON ?auto_30669 ?auto_30668 ) ( not ( = ?auto_30668 ?auto_30669 ) ) ( not ( = ?auto_30668 ?auto_30670 ) ) ( not ( = ?auto_30668 ?auto_30671 ) ) ( not ( = ?auto_30668 ?auto_30672 ) ) ( not ( = ?auto_30669 ?auto_30670 ) ) ( not ( = ?auto_30669 ?auto_30671 ) ) ( not ( = ?auto_30669 ?auto_30672 ) ) ( not ( = ?auto_30670 ?auto_30671 ) ) ( not ( = ?auto_30670 ?auto_30672 ) ) ( not ( = ?auto_30671 ?auto_30672 ) ) ( ON-TABLE ?auto_30672 ) ( ON ?auto_30671 ?auto_30672 ) ( CLEAR ?auto_30669 ) ( ON ?auto_30670 ?auto_30671 ) ( CLEAR ?auto_30670 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_30672 ?auto_30671 )
      ( MAKE-5PILE ?auto_30668 ?auto_30669 ?auto_30670 ?auto_30671 ?auto_30672 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_30673 - BLOCK
      ?auto_30674 - BLOCK
      ?auto_30675 - BLOCK
      ?auto_30676 - BLOCK
      ?auto_30677 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_30673 ) ( not ( = ?auto_30673 ?auto_30674 ) ) ( not ( = ?auto_30673 ?auto_30675 ) ) ( not ( = ?auto_30673 ?auto_30676 ) ) ( not ( = ?auto_30673 ?auto_30677 ) ) ( not ( = ?auto_30674 ?auto_30675 ) ) ( not ( = ?auto_30674 ?auto_30676 ) ) ( not ( = ?auto_30674 ?auto_30677 ) ) ( not ( = ?auto_30675 ?auto_30676 ) ) ( not ( = ?auto_30675 ?auto_30677 ) ) ( not ( = ?auto_30676 ?auto_30677 ) ) ( ON-TABLE ?auto_30677 ) ( ON ?auto_30676 ?auto_30677 ) ( ON ?auto_30675 ?auto_30676 ) ( CLEAR ?auto_30675 ) ( HOLDING ?auto_30674 ) ( CLEAR ?auto_30673 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_30673 ?auto_30674 )
      ( MAKE-5PILE ?auto_30673 ?auto_30674 ?auto_30675 ?auto_30676 ?auto_30677 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_30678 - BLOCK
      ?auto_30679 - BLOCK
      ?auto_30680 - BLOCK
      ?auto_30681 - BLOCK
      ?auto_30682 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_30678 ) ( not ( = ?auto_30678 ?auto_30679 ) ) ( not ( = ?auto_30678 ?auto_30680 ) ) ( not ( = ?auto_30678 ?auto_30681 ) ) ( not ( = ?auto_30678 ?auto_30682 ) ) ( not ( = ?auto_30679 ?auto_30680 ) ) ( not ( = ?auto_30679 ?auto_30681 ) ) ( not ( = ?auto_30679 ?auto_30682 ) ) ( not ( = ?auto_30680 ?auto_30681 ) ) ( not ( = ?auto_30680 ?auto_30682 ) ) ( not ( = ?auto_30681 ?auto_30682 ) ) ( ON-TABLE ?auto_30682 ) ( ON ?auto_30681 ?auto_30682 ) ( ON ?auto_30680 ?auto_30681 ) ( CLEAR ?auto_30678 ) ( ON ?auto_30679 ?auto_30680 ) ( CLEAR ?auto_30679 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_30682 ?auto_30681 ?auto_30680 )
      ( MAKE-5PILE ?auto_30678 ?auto_30679 ?auto_30680 ?auto_30681 ?auto_30682 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_30683 - BLOCK
      ?auto_30684 - BLOCK
      ?auto_30685 - BLOCK
      ?auto_30686 - BLOCK
      ?auto_30687 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30683 ?auto_30684 ) ) ( not ( = ?auto_30683 ?auto_30685 ) ) ( not ( = ?auto_30683 ?auto_30686 ) ) ( not ( = ?auto_30683 ?auto_30687 ) ) ( not ( = ?auto_30684 ?auto_30685 ) ) ( not ( = ?auto_30684 ?auto_30686 ) ) ( not ( = ?auto_30684 ?auto_30687 ) ) ( not ( = ?auto_30685 ?auto_30686 ) ) ( not ( = ?auto_30685 ?auto_30687 ) ) ( not ( = ?auto_30686 ?auto_30687 ) ) ( ON-TABLE ?auto_30687 ) ( ON ?auto_30686 ?auto_30687 ) ( ON ?auto_30685 ?auto_30686 ) ( ON ?auto_30684 ?auto_30685 ) ( CLEAR ?auto_30684 ) ( HOLDING ?auto_30683 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_30683 )
      ( MAKE-5PILE ?auto_30683 ?auto_30684 ?auto_30685 ?auto_30686 ?auto_30687 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_30688 - BLOCK
      ?auto_30689 - BLOCK
      ?auto_30690 - BLOCK
      ?auto_30691 - BLOCK
      ?auto_30692 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30688 ?auto_30689 ) ) ( not ( = ?auto_30688 ?auto_30690 ) ) ( not ( = ?auto_30688 ?auto_30691 ) ) ( not ( = ?auto_30688 ?auto_30692 ) ) ( not ( = ?auto_30689 ?auto_30690 ) ) ( not ( = ?auto_30689 ?auto_30691 ) ) ( not ( = ?auto_30689 ?auto_30692 ) ) ( not ( = ?auto_30690 ?auto_30691 ) ) ( not ( = ?auto_30690 ?auto_30692 ) ) ( not ( = ?auto_30691 ?auto_30692 ) ) ( ON-TABLE ?auto_30692 ) ( ON ?auto_30691 ?auto_30692 ) ( ON ?auto_30690 ?auto_30691 ) ( ON ?auto_30689 ?auto_30690 ) ( ON ?auto_30688 ?auto_30689 ) ( CLEAR ?auto_30688 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_30692 ?auto_30691 ?auto_30690 ?auto_30689 )
      ( MAKE-5PILE ?auto_30688 ?auto_30689 ?auto_30690 ?auto_30691 ?auto_30692 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_30698 - BLOCK
      ?auto_30699 - BLOCK
      ?auto_30700 - BLOCK
      ?auto_30701 - BLOCK
      ?auto_30702 - BLOCK
    )
    :vars
    (
      ?auto_30703 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30698 ?auto_30699 ) ) ( not ( = ?auto_30698 ?auto_30700 ) ) ( not ( = ?auto_30698 ?auto_30701 ) ) ( not ( = ?auto_30698 ?auto_30702 ) ) ( not ( = ?auto_30699 ?auto_30700 ) ) ( not ( = ?auto_30699 ?auto_30701 ) ) ( not ( = ?auto_30699 ?auto_30702 ) ) ( not ( = ?auto_30700 ?auto_30701 ) ) ( not ( = ?auto_30700 ?auto_30702 ) ) ( not ( = ?auto_30701 ?auto_30702 ) ) ( ON-TABLE ?auto_30702 ) ( ON ?auto_30701 ?auto_30702 ) ( ON ?auto_30700 ?auto_30701 ) ( ON ?auto_30699 ?auto_30700 ) ( CLEAR ?auto_30699 ) ( ON ?auto_30698 ?auto_30703 ) ( CLEAR ?auto_30698 ) ( HAND-EMPTY ) ( not ( = ?auto_30698 ?auto_30703 ) ) ( not ( = ?auto_30699 ?auto_30703 ) ) ( not ( = ?auto_30700 ?auto_30703 ) ) ( not ( = ?auto_30701 ?auto_30703 ) ) ( not ( = ?auto_30702 ?auto_30703 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_30698 ?auto_30703 )
      ( MAKE-5PILE ?auto_30698 ?auto_30699 ?auto_30700 ?auto_30701 ?auto_30702 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_30704 - BLOCK
      ?auto_30705 - BLOCK
      ?auto_30706 - BLOCK
      ?auto_30707 - BLOCK
      ?auto_30708 - BLOCK
    )
    :vars
    (
      ?auto_30709 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30704 ?auto_30705 ) ) ( not ( = ?auto_30704 ?auto_30706 ) ) ( not ( = ?auto_30704 ?auto_30707 ) ) ( not ( = ?auto_30704 ?auto_30708 ) ) ( not ( = ?auto_30705 ?auto_30706 ) ) ( not ( = ?auto_30705 ?auto_30707 ) ) ( not ( = ?auto_30705 ?auto_30708 ) ) ( not ( = ?auto_30706 ?auto_30707 ) ) ( not ( = ?auto_30706 ?auto_30708 ) ) ( not ( = ?auto_30707 ?auto_30708 ) ) ( ON-TABLE ?auto_30708 ) ( ON ?auto_30707 ?auto_30708 ) ( ON ?auto_30706 ?auto_30707 ) ( ON ?auto_30704 ?auto_30709 ) ( CLEAR ?auto_30704 ) ( not ( = ?auto_30704 ?auto_30709 ) ) ( not ( = ?auto_30705 ?auto_30709 ) ) ( not ( = ?auto_30706 ?auto_30709 ) ) ( not ( = ?auto_30707 ?auto_30709 ) ) ( not ( = ?auto_30708 ?auto_30709 ) ) ( HOLDING ?auto_30705 ) ( CLEAR ?auto_30706 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_30708 ?auto_30707 ?auto_30706 ?auto_30705 )
      ( MAKE-5PILE ?auto_30704 ?auto_30705 ?auto_30706 ?auto_30707 ?auto_30708 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_30710 - BLOCK
      ?auto_30711 - BLOCK
      ?auto_30712 - BLOCK
      ?auto_30713 - BLOCK
      ?auto_30714 - BLOCK
    )
    :vars
    (
      ?auto_30715 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30710 ?auto_30711 ) ) ( not ( = ?auto_30710 ?auto_30712 ) ) ( not ( = ?auto_30710 ?auto_30713 ) ) ( not ( = ?auto_30710 ?auto_30714 ) ) ( not ( = ?auto_30711 ?auto_30712 ) ) ( not ( = ?auto_30711 ?auto_30713 ) ) ( not ( = ?auto_30711 ?auto_30714 ) ) ( not ( = ?auto_30712 ?auto_30713 ) ) ( not ( = ?auto_30712 ?auto_30714 ) ) ( not ( = ?auto_30713 ?auto_30714 ) ) ( ON-TABLE ?auto_30714 ) ( ON ?auto_30713 ?auto_30714 ) ( ON ?auto_30712 ?auto_30713 ) ( ON ?auto_30710 ?auto_30715 ) ( not ( = ?auto_30710 ?auto_30715 ) ) ( not ( = ?auto_30711 ?auto_30715 ) ) ( not ( = ?auto_30712 ?auto_30715 ) ) ( not ( = ?auto_30713 ?auto_30715 ) ) ( not ( = ?auto_30714 ?auto_30715 ) ) ( CLEAR ?auto_30712 ) ( ON ?auto_30711 ?auto_30710 ) ( CLEAR ?auto_30711 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_30715 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_30715 ?auto_30710 )
      ( MAKE-5PILE ?auto_30710 ?auto_30711 ?auto_30712 ?auto_30713 ?auto_30714 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_30716 - BLOCK
      ?auto_30717 - BLOCK
      ?auto_30718 - BLOCK
      ?auto_30719 - BLOCK
      ?auto_30720 - BLOCK
    )
    :vars
    (
      ?auto_30721 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30716 ?auto_30717 ) ) ( not ( = ?auto_30716 ?auto_30718 ) ) ( not ( = ?auto_30716 ?auto_30719 ) ) ( not ( = ?auto_30716 ?auto_30720 ) ) ( not ( = ?auto_30717 ?auto_30718 ) ) ( not ( = ?auto_30717 ?auto_30719 ) ) ( not ( = ?auto_30717 ?auto_30720 ) ) ( not ( = ?auto_30718 ?auto_30719 ) ) ( not ( = ?auto_30718 ?auto_30720 ) ) ( not ( = ?auto_30719 ?auto_30720 ) ) ( ON-TABLE ?auto_30720 ) ( ON ?auto_30719 ?auto_30720 ) ( ON ?auto_30716 ?auto_30721 ) ( not ( = ?auto_30716 ?auto_30721 ) ) ( not ( = ?auto_30717 ?auto_30721 ) ) ( not ( = ?auto_30718 ?auto_30721 ) ) ( not ( = ?auto_30719 ?auto_30721 ) ) ( not ( = ?auto_30720 ?auto_30721 ) ) ( ON ?auto_30717 ?auto_30716 ) ( CLEAR ?auto_30717 ) ( ON-TABLE ?auto_30721 ) ( HOLDING ?auto_30718 ) ( CLEAR ?auto_30719 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_30720 ?auto_30719 ?auto_30718 )
      ( MAKE-5PILE ?auto_30716 ?auto_30717 ?auto_30718 ?auto_30719 ?auto_30720 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_30722 - BLOCK
      ?auto_30723 - BLOCK
      ?auto_30724 - BLOCK
      ?auto_30725 - BLOCK
      ?auto_30726 - BLOCK
    )
    :vars
    (
      ?auto_30727 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30722 ?auto_30723 ) ) ( not ( = ?auto_30722 ?auto_30724 ) ) ( not ( = ?auto_30722 ?auto_30725 ) ) ( not ( = ?auto_30722 ?auto_30726 ) ) ( not ( = ?auto_30723 ?auto_30724 ) ) ( not ( = ?auto_30723 ?auto_30725 ) ) ( not ( = ?auto_30723 ?auto_30726 ) ) ( not ( = ?auto_30724 ?auto_30725 ) ) ( not ( = ?auto_30724 ?auto_30726 ) ) ( not ( = ?auto_30725 ?auto_30726 ) ) ( ON-TABLE ?auto_30726 ) ( ON ?auto_30725 ?auto_30726 ) ( ON ?auto_30722 ?auto_30727 ) ( not ( = ?auto_30722 ?auto_30727 ) ) ( not ( = ?auto_30723 ?auto_30727 ) ) ( not ( = ?auto_30724 ?auto_30727 ) ) ( not ( = ?auto_30725 ?auto_30727 ) ) ( not ( = ?auto_30726 ?auto_30727 ) ) ( ON ?auto_30723 ?auto_30722 ) ( ON-TABLE ?auto_30727 ) ( CLEAR ?auto_30725 ) ( ON ?auto_30724 ?auto_30723 ) ( CLEAR ?auto_30724 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_30727 ?auto_30722 ?auto_30723 )
      ( MAKE-5PILE ?auto_30722 ?auto_30723 ?auto_30724 ?auto_30725 ?auto_30726 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_30728 - BLOCK
      ?auto_30729 - BLOCK
      ?auto_30730 - BLOCK
      ?auto_30731 - BLOCK
      ?auto_30732 - BLOCK
    )
    :vars
    (
      ?auto_30733 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30728 ?auto_30729 ) ) ( not ( = ?auto_30728 ?auto_30730 ) ) ( not ( = ?auto_30728 ?auto_30731 ) ) ( not ( = ?auto_30728 ?auto_30732 ) ) ( not ( = ?auto_30729 ?auto_30730 ) ) ( not ( = ?auto_30729 ?auto_30731 ) ) ( not ( = ?auto_30729 ?auto_30732 ) ) ( not ( = ?auto_30730 ?auto_30731 ) ) ( not ( = ?auto_30730 ?auto_30732 ) ) ( not ( = ?auto_30731 ?auto_30732 ) ) ( ON-TABLE ?auto_30732 ) ( ON ?auto_30728 ?auto_30733 ) ( not ( = ?auto_30728 ?auto_30733 ) ) ( not ( = ?auto_30729 ?auto_30733 ) ) ( not ( = ?auto_30730 ?auto_30733 ) ) ( not ( = ?auto_30731 ?auto_30733 ) ) ( not ( = ?auto_30732 ?auto_30733 ) ) ( ON ?auto_30729 ?auto_30728 ) ( ON-TABLE ?auto_30733 ) ( ON ?auto_30730 ?auto_30729 ) ( CLEAR ?auto_30730 ) ( HOLDING ?auto_30731 ) ( CLEAR ?auto_30732 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_30732 ?auto_30731 )
      ( MAKE-5PILE ?auto_30728 ?auto_30729 ?auto_30730 ?auto_30731 ?auto_30732 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_30734 - BLOCK
      ?auto_30735 - BLOCK
      ?auto_30736 - BLOCK
      ?auto_30737 - BLOCK
      ?auto_30738 - BLOCK
    )
    :vars
    (
      ?auto_30739 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30734 ?auto_30735 ) ) ( not ( = ?auto_30734 ?auto_30736 ) ) ( not ( = ?auto_30734 ?auto_30737 ) ) ( not ( = ?auto_30734 ?auto_30738 ) ) ( not ( = ?auto_30735 ?auto_30736 ) ) ( not ( = ?auto_30735 ?auto_30737 ) ) ( not ( = ?auto_30735 ?auto_30738 ) ) ( not ( = ?auto_30736 ?auto_30737 ) ) ( not ( = ?auto_30736 ?auto_30738 ) ) ( not ( = ?auto_30737 ?auto_30738 ) ) ( ON-TABLE ?auto_30738 ) ( ON ?auto_30734 ?auto_30739 ) ( not ( = ?auto_30734 ?auto_30739 ) ) ( not ( = ?auto_30735 ?auto_30739 ) ) ( not ( = ?auto_30736 ?auto_30739 ) ) ( not ( = ?auto_30737 ?auto_30739 ) ) ( not ( = ?auto_30738 ?auto_30739 ) ) ( ON ?auto_30735 ?auto_30734 ) ( ON-TABLE ?auto_30739 ) ( ON ?auto_30736 ?auto_30735 ) ( CLEAR ?auto_30738 ) ( ON ?auto_30737 ?auto_30736 ) ( CLEAR ?auto_30737 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_30739 ?auto_30734 ?auto_30735 ?auto_30736 )
      ( MAKE-5PILE ?auto_30734 ?auto_30735 ?auto_30736 ?auto_30737 ?auto_30738 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_30740 - BLOCK
      ?auto_30741 - BLOCK
      ?auto_30742 - BLOCK
      ?auto_30743 - BLOCK
      ?auto_30744 - BLOCK
    )
    :vars
    (
      ?auto_30745 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30740 ?auto_30741 ) ) ( not ( = ?auto_30740 ?auto_30742 ) ) ( not ( = ?auto_30740 ?auto_30743 ) ) ( not ( = ?auto_30740 ?auto_30744 ) ) ( not ( = ?auto_30741 ?auto_30742 ) ) ( not ( = ?auto_30741 ?auto_30743 ) ) ( not ( = ?auto_30741 ?auto_30744 ) ) ( not ( = ?auto_30742 ?auto_30743 ) ) ( not ( = ?auto_30742 ?auto_30744 ) ) ( not ( = ?auto_30743 ?auto_30744 ) ) ( ON ?auto_30740 ?auto_30745 ) ( not ( = ?auto_30740 ?auto_30745 ) ) ( not ( = ?auto_30741 ?auto_30745 ) ) ( not ( = ?auto_30742 ?auto_30745 ) ) ( not ( = ?auto_30743 ?auto_30745 ) ) ( not ( = ?auto_30744 ?auto_30745 ) ) ( ON ?auto_30741 ?auto_30740 ) ( ON-TABLE ?auto_30745 ) ( ON ?auto_30742 ?auto_30741 ) ( ON ?auto_30743 ?auto_30742 ) ( CLEAR ?auto_30743 ) ( HOLDING ?auto_30744 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_30744 )
      ( MAKE-5PILE ?auto_30740 ?auto_30741 ?auto_30742 ?auto_30743 ?auto_30744 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_30746 - BLOCK
      ?auto_30747 - BLOCK
      ?auto_30748 - BLOCK
      ?auto_30749 - BLOCK
      ?auto_30750 - BLOCK
    )
    :vars
    (
      ?auto_30751 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30746 ?auto_30747 ) ) ( not ( = ?auto_30746 ?auto_30748 ) ) ( not ( = ?auto_30746 ?auto_30749 ) ) ( not ( = ?auto_30746 ?auto_30750 ) ) ( not ( = ?auto_30747 ?auto_30748 ) ) ( not ( = ?auto_30747 ?auto_30749 ) ) ( not ( = ?auto_30747 ?auto_30750 ) ) ( not ( = ?auto_30748 ?auto_30749 ) ) ( not ( = ?auto_30748 ?auto_30750 ) ) ( not ( = ?auto_30749 ?auto_30750 ) ) ( ON ?auto_30746 ?auto_30751 ) ( not ( = ?auto_30746 ?auto_30751 ) ) ( not ( = ?auto_30747 ?auto_30751 ) ) ( not ( = ?auto_30748 ?auto_30751 ) ) ( not ( = ?auto_30749 ?auto_30751 ) ) ( not ( = ?auto_30750 ?auto_30751 ) ) ( ON ?auto_30747 ?auto_30746 ) ( ON-TABLE ?auto_30751 ) ( ON ?auto_30748 ?auto_30747 ) ( ON ?auto_30749 ?auto_30748 ) ( ON ?auto_30750 ?auto_30749 ) ( CLEAR ?auto_30750 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_30751 ?auto_30746 ?auto_30747 ?auto_30748 ?auto_30749 )
      ( MAKE-5PILE ?auto_30746 ?auto_30747 ?auto_30748 ?auto_30749 ?auto_30750 ) )
  )

)

