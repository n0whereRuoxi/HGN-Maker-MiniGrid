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
      ?auto_20797 - BLOCK
    )
    :vars
    (
      ?auto_20798 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20797 ?auto_20798 ) ( CLEAR ?auto_20797 ) ( HAND-EMPTY ) ( not ( = ?auto_20797 ?auto_20798 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_20797 ?auto_20798 )
      ( !PUTDOWN ?auto_20797 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_20800 - BLOCK
    )
    :vars
    (
      ?auto_20801 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20800 ?auto_20801 ) ( CLEAR ?auto_20800 ) ( HAND-EMPTY ) ( not ( = ?auto_20800 ?auto_20801 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_20800 ?auto_20801 )
      ( !PUTDOWN ?auto_20800 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_20804 - BLOCK
      ?auto_20805 - BLOCK
    )
    :vars
    (
      ?auto_20806 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_20804 ) ( ON ?auto_20805 ?auto_20806 ) ( CLEAR ?auto_20805 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_20804 ) ( not ( = ?auto_20804 ?auto_20805 ) ) ( not ( = ?auto_20804 ?auto_20806 ) ) ( not ( = ?auto_20805 ?auto_20806 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_20805 ?auto_20806 )
      ( !STACK ?auto_20805 ?auto_20804 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_20809 - BLOCK
      ?auto_20810 - BLOCK
    )
    :vars
    (
      ?auto_20811 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_20809 ) ( ON ?auto_20810 ?auto_20811 ) ( CLEAR ?auto_20810 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_20809 ) ( not ( = ?auto_20809 ?auto_20810 ) ) ( not ( = ?auto_20809 ?auto_20811 ) ) ( not ( = ?auto_20810 ?auto_20811 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_20810 ?auto_20811 )
      ( !STACK ?auto_20810 ?auto_20809 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_20814 - BLOCK
      ?auto_20815 - BLOCK
    )
    :vars
    (
      ?auto_20816 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20815 ?auto_20816 ) ( not ( = ?auto_20814 ?auto_20815 ) ) ( not ( = ?auto_20814 ?auto_20816 ) ) ( not ( = ?auto_20815 ?auto_20816 ) ) ( ON ?auto_20814 ?auto_20815 ) ( CLEAR ?auto_20814 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_20814 )
      ( MAKE-2PILE ?auto_20814 ?auto_20815 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_20819 - BLOCK
      ?auto_20820 - BLOCK
    )
    :vars
    (
      ?auto_20821 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20820 ?auto_20821 ) ( not ( = ?auto_20819 ?auto_20820 ) ) ( not ( = ?auto_20819 ?auto_20821 ) ) ( not ( = ?auto_20820 ?auto_20821 ) ) ( ON ?auto_20819 ?auto_20820 ) ( CLEAR ?auto_20819 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_20819 )
      ( MAKE-2PILE ?auto_20819 ?auto_20820 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_20825 - BLOCK
      ?auto_20826 - BLOCK
      ?auto_20827 - BLOCK
    )
    :vars
    (
      ?auto_20828 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_20826 ) ( ON ?auto_20827 ?auto_20828 ) ( CLEAR ?auto_20827 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_20825 ) ( ON ?auto_20826 ?auto_20825 ) ( not ( = ?auto_20825 ?auto_20826 ) ) ( not ( = ?auto_20825 ?auto_20827 ) ) ( not ( = ?auto_20825 ?auto_20828 ) ) ( not ( = ?auto_20826 ?auto_20827 ) ) ( not ( = ?auto_20826 ?auto_20828 ) ) ( not ( = ?auto_20827 ?auto_20828 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_20827 ?auto_20828 )
      ( !STACK ?auto_20827 ?auto_20826 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_20832 - BLOCK
      ?auto_20833 - BLOCK
      ?auto_20834 - BLOCK
    )
    :vars
    (
      ?auto_20835 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_20833 ) ( ON ?auto_20834 ?auto_20835 ) ( CLEAR ?auto_20834 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_20832 ) ( ON ?auto_20833 ?auto_20832 ) ( not ( = ?auto_20832 ?auto_20833 ) ) ( not ( = ?auto_20832 ?auto_20834 ) ) ( not ( = ?auto_20832 ?auto_20835 ) ) ( not ( = ?auto_20833 ?auto_20834 ) ) ( not ( = ?auto_20833 ?auto_20835 ) ) ( not ( = ?auto_20834 ?auto_20835 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_20834 ?auto_20835 )
      ( !STACK ?auto_20834 ?auto_20833 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_20839 - BLOCK
      ?auto_20840 - BLOCK
      ?auto_20841 - BLOCK
    )
    :vars
    (
      ?auto_20842 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20841 ?auto_20842 ) ( ON-TABLE ?auto_20839 ) ( not ( = ?auto_20839 ?auto_20840 ) ) ( not ( = ?auto_20839 ?auto_20841 ) ) ( not ( = ?auto_20839 ?auto_20842 ) ) ( not ( = ?auto_20840 ?auto_20841 ) ) ( not ( = ?auto_20840 ?auto_20842 ) ) ( not ( = ?auto_20841 ?auto_20842 ) ) ( CLEAR ?auto_20839 ) ( ON ?auto_20840 ?auto_20841 ) ( CLEAR ?auto_20840 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_20839 ?auto_20840 )
      ( MAKE-3PILE ?auto_20839 ?auto_20840 ?auto_20841 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_20846 - BLOCK
      ?auto_20847 - BLOCK
      ?auto_20848 - BLOCK
    )
    :vars
    (
      ?auto_20849 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20848 ?auto_20849 ) ( ON-TABLE ?auto_20846 ) ( not ( = ?auto_20846 ?auto_20847 ) ) ( not ( = ?auto_20846 ?auto_20848 ) ) ( not ( = ?auto_20846 ?auto_20849 ) ) ( not ( = ?auto_20847 ?auto_20848 ) ) ( not ( = ?auto_20847 ?auto_20849 ) ) ( not ( = ?auto_20848 ?auto_20849 ) ) ( CLEAR ?auto_20846 ) ( ON ?auto_20847 ?auto_20848 ) ( CLEAR ?auto_20847 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_20846 ?auto_20847 )
      ( MAKE-3PILE ?auto_20846 ?auto_20847 ?auto_20848 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_20853 - BLOCK
      ?auto_20854 - BLOCK
      ?auto_20855 - BLOCK
    )
    :vars
    (
      ?auto_20856 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20855 ?auto_20856 ) ( not ( = ?auto_20853 ?auto_20854 ) ) ( not ( = ?auto_20853 ?auto_20855 ) ) ( not ( = ?auto_20853 ?auto_20856 ) ) ( not ( = ?auto_20854 ?auto_20855 ) ) ( not ( = ?auto_20854 ?auto_20856 ) ) ( not ( = ?auto_20855 ?auto_20856 ) ) ( ON ?auto_20854 ?auto_20855 ) ( ON ?auto_20853 ?auto_20854 ) ( CLEAR ?auto_20853 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_20853 )
      ( MAKE-3PILE ?auto_20853 ?auto_20854 ?auto_20855 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_20860 - BLOCK
      ?auto_20861 - BLOCK
      ?auto_20862 - BLOCK
    )
    :vars
    (
      ?auto_20863 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20862 ?auto_20863 ) ( not ( = ?auto_20860 ?auto_20861 ) ) ( not ( = ?auto_20860 ?auto_20862 ) ) ( not ( = ?auto_20860 ?auto_20863 ) ) ( not ( = ?auto_20861 ?auto_20862 ) ) ( not ( = ?auto_20861 ?auto_20863 ) ) ( not ( = ?auto_20862 ?auto_20863 ) ) ( ON ?auto_20861 ?auto_20862 ) ( ON ?auto_20860 ?auto_20861 ) ( CLEAR ?auto_20860 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_20860 )
      ( MAKE-3PILE ?auto_20860 ?auto_20861 ?auto_20862 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_20868 - BLOCK
      ?auto_20869 - BLOCK
      ?auto_20870 - BLOCK
      ?auto_20871 - BLOCK
    )
    :vars
    (
      ?auto_20872 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_20870 ) ( ON ?auto_20871 ?auto_20872 ) ( CLEAR ?auto_20871 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_20868 ) ( ON ?auto_20869 ?auto_20868 ) ( ON ?auto_20870 ?auto_20869 ) ( not ( = ?auto_20868 ?auto_20869 ) ) ( not ( = ?auto_20868 ?auto_20870 ) ) ( not ( = ?auto_20868 ?auto_20871 ) ) ( not ( = ?auto_20868 ?auto_20872 ) ) ( not ( = ?auto_20869 ?auto_20870 ) ) ( not ( = ?auto_20869 ?auto_20871 ) ) ( not ( = ?auto_20869 ?auto_20872 ) ) ( not ( = ?auto_20870 ?auto_20871 ) ) ( not ( = ?auto_20870 ?auto_20872 ) ) ( not ( = ?auto_20871 ?auto_20872 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_20871 ?auto_20872 )
      ( !STACK ?auto_20871 ?auto_20870 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_20877 - BLOCK
      ?auto_20878 - BLOCK
      ?auto_20879 - BLOCK
      ?auto_20880 - BLOCK
    )
    :vars
    (
      ?auto_20881 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_20879 ) ( ON ?auto_20880 ?auto_20881 ) ( CLEAR ?auto_20880 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_20877 ) ( ON ?auto_20878 ?auto_20877 ) ( ON ?auto_20879 ?auto_20878 ) ( not ( = ?auto_20877 ?auto_20878 ) ) ( not ( = ?auto_20877 ?auto_20879 ) ) ( not ( = ?auto_20877 ?auto_20880 ) ) ( not ( = ?auto_20877 ?auto_20881 ) ) ( not ( = ?auto_20878 ?auto_20879 ) ) ( not ( = ?auto_20878 ?auto_20880 ) ) ( not ( = ?auto_20878 ?auto_20881 ) ) ( not ( = ?auto_20879 ?auto_20880 ) ) ( not ( = ?auto_20879 ?auto_20881 ) ) ( not ( = ?auto_20880 ?auto_20881 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_20880 ?auto_20881 )
      ( !STACK ?auto_20880 ?auto_20879 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_20886 - BLOCK
      ?auto_20887 - BLOCK
      ?auto_20888 - BLOCK
      ?auto_20889 - BLOCK
    )
    :vars
    (
      ?auto_20890 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20889 ?auto_20890 ) ( ON-TABLE ?auto_20886 ) ( ON ?auto_20887 ?auto_20886 ) ( not ( = ?auto_20886 ?auto_20887 ) ) ( not ( = ?auto_20886 ?auto_20888 ) ) ( not ( = ?auto_20886 ?auto_20889 ) ) ( not ( = ?auto_20886 ?auto_20890 ) ) ( not ( = ?auto_20887 ?auto_20888 ) ) ( not ( = ?auto_20887 ?auto_20889 ) ) ( not ( = ?auto_20887 ?auto_20890 ) ) ( not ( = ?auto_20888 ?auto_20889 ) ) ( not ( = ?auto_20888 ?auto_20890 ) ) ( not ( = ?auto_20889 ?auto_20890 ) ) ( CLEAR ?auto_20887 ) ( ON ?auto_20888 ?auto_20889 ) ( CLEAR ?auto_20888 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_20886 ?auto_20887 ?auto_20888 )
      ( MAKE-4PILE ?auto_20886 ?auto_20887 ?auto_20888 ?auto_20889 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_20895 - BLOCK
      ?auto_20896 - BLOCK
      ?auto_20897 - BLOCK
      ?auto_20898 - BLOCK
    )
    :vars
    (
      ?auto_20899 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20898 ?auto_20899 ) ( ON-TABLE ?auto_20895 ) ( ON ?auto_20896 ?auto_20895 ) ( not ( = ?auto_20895 ?auto_20896 ) ) ( not ( = ?auto_20895 ?auto_20897 ) ) ( not ( = ?auto_20895 ?auto_20898 ) ) ( not ( = ?auto_20895 ?auto_20899 ) ) ( not ( = ?auto_20896 ?auto_20897 ) ) ( not ( = ?auto_20896 ?auto_20898 ) ) ( not ( = ?auto_20896 ?auto_20899 ) ) ( not ( = ?auto_20897 ?auto_20898 ) ) ( not ( = ?auto_20897 ?auto_20899 ) ) ( not ( = ?auto_20898 ?auto_20899 ) ) ( CLEAR ?auto_20896 ) ( ON ?auto_20897 ?auto_20898 ) ( CLEAR ?auto_20897 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_20895 ?auto_20896 ?auto_20897 )
      ( MAKE-4PILE ?auto_20895 ?auto_20896 ?auto_20897 ?auto_20898 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_20904 - BLOCK
      ?auto_20905 - BLOCK
      ?auto_20906 - BLOCK
      ?auto_20907 - BLOCK
    )
    :vars
    (
      ?auto_20908 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20907 ?auto_20908 ) ( ON-TABLE ?auto_20904 ) ( not ( = ?auto_20904 ?auto_20905 ) ) ( not ( = ?auto_20904 ?auto_20906 ) ) ( not ( = ?auto_20904 ?auto_20907 ) ) ( not ( = ?auto_20904 ?auto_20908 ) ) ( not ( = ?auto_20905 ?auto_20906 ) ) ( not ( = ?auto_20905 ?auto_20907 ) ) ( not ( = ?auto_20905 ?auto_20908 ) ) ( not ( = ?auto_20906 ?auto_20907 ) ) ( not ( = ?auto_20906 ?auto_20908 ) ) ( not ( = ?auto_20907 ?auto_20908 ) ) ( ON ?auto_20906 ?auto_20907 ) ( CLEAR ?auto_20904 ) ( ON ?auto_20905 ?auto_20906 ) ( CLEAR ?auto_20905 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_20904 ?auto_20905 )
      ( MAKE-4PILE ?auto_20904 ?auto_20905 ?auto_20906 ?auto_20907 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_20913 - BLOCK
      ?auto_20914 - BLOCK
      ?auto_20915 - BLOCK
      ?auto_20916 - BLOCK
    )
    :vars
    (
      ?auto_20917 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20916 ?auto_20917 ) ( ON-TABLE ?auto_20913 ) ( not ( = ?auto_20913 ?auto_20914 ) ) ( not ( = ?auto_20913 ?auto_20915 ) ) ( not ( = ?auto_20913 ?auto_20916 ) ) ( not ( = ?auto_20913 ?auto_20917 ) ) ( not ( = ?auto_20914 ?auto_20915 ) ) ( not ( = ?auto_20914 ?auto_20916 ) ) ( not ( = ?auto_20914 ?auto_20917 ) ) ( not ( = ?auto_20915 ?auto_20916 ) ) ( not ( = ?auto_20915 ?auto_20917 ) ) ( not ( = ?auto_20916 ?auto_20917 ) ) ( ON ?auto_20915 ?auto_20916 ) ( CLEAR ?auto_20913 ) ( ON ?auto_20914 ?auto_20915 ) ( CLEAR ?auto_20914 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_20913 ?auto_20914 )
      ( MAKE-4PILE ?auto_20913 ?auto_20914 ?auto_20915 ?auto_20916 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_20922 - BLOCK
      ?auto_20923 - BLOCK
      ?auto_20924 - BLOCK
      ?auto_20925 - BLOCK
    )
    :vars
    (
      ?auto_20926 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20925 ?auto_20926 ) ( not ( = ?auto_20922 ?auto_20923 ) ) ( not ( = ?auto_20922 ?auto_20924 ) ) ( not ( = ?auto_20922 ?auto_20925 ) ) ( not ( = ?auto_20922 ?auto_20926 ) ) ( not ( = ?auto_20923 ?auto_20924 ) ) ( not ( = ?auto_20923 ?auto_20925 ) ) ( not ( = ?auto_20923 ?auto_20926 ) ) ( not ( = ?auto_20924 ?auto_20925 ) ) ( not ( = ?auto_20924 ?auto_20926 ) ) ( not ( = ?auto_20925 ?auto_20926 ) ) ( ON ?auto_20924 ?auto_20925 ) ( ON ?auto_20923 ?auto_20924 ) ( ON ?auto_20922 ?auto_20923 ) ( CLEAR ?auto_20922 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_20922 )
      ( MAKE-4PILE ?auto_20922 ?auto_20923 ?auto_20924 ?auto_20925 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_20931 - BLOCK
      ?auto_20932 - BLOCK
      ?auto_20933 - BLOCK
      ?auto_20934 - BLOCK
    )
    :vars
    (
      ?auto_20935 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20934 ?auto_20935 ) ( not ( = ?auto_20931 ?auto_20932 ) ) ( not ( = ?auto_20931 ?auto_20933 ) ) ( not ( = ?auto_20931 ?auto_20934 ) ) ( not ( = ?auto_20931 ?auto_20935 ) ) ( not ( = ?auto_20932 ?auto_20933 ) ) ( not ( = ?auto_20932 ?auto_20934 ) ) ( not ( = ?auto_20932 ?auto_20935 ) ) ( not ( = ?auto_20933 ?auto_20934 ) ) ( not ( = ?auto_20933 ?auto_20935 ) ) ( not ( = ?auto_20934 ?auto_20935 ) ) ( ON ?auto_20933 ?auto_20934 ) ( ON ?auto_20932 ?auto_20933 ) ( ON ?auto_20931 ?auto_20932 ) ( CLEAR ?auto_20931 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_20931 )
      ( MAKE-4PILE ?auto_20931 ?auto_20932 ?auto_20933 ?auto_20934 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_20941 - BLOCK
      ?auto_20942 - BLOCK
      ?auto_20943 - BLOCK
      ?auto_20944 - BLOCK
      ?auto_20945 - BLOCK
    )
    :vars
    (
      ?auto_20946 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_20944 ) ( ON ?auto_20945 ?auto_20946 ) ( CLEAR ?auto_20945 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_20941 ) ( ON ?auto_20942 ?auto_20941 ) ( ON ?auto_20943 ?auto_20942 ) ( ON ?auto_20944 ?auto_20943 ) ( not ( = ?auto_20941 ?auto_20942 ) ) ( not ( = ?auto_20941 ?auto_20943 ) ) ( not ( = ?auto_20941 ?auto_20944 ) ) ( not ( = ?auto_20941 ?auto_20945 ) ) ( not ( = ?auto_20941 ?auto_20946 ) ) ( not ( = ?auto_20942 ?auto_20943 ) ) ( not ( = ?auto_20942 ?auto_20944 ) ) ( not ( = ?auto_20942 ?auto_20945 ) ) ( not ( = ?auto_20942 ?auto_20946 ) ) ( not ( = ?auto_20943 ?auto_20944 ) ) ( not ( = ?auto_20943 ?auto_20945 ) ) ( not ( = ?auto_20943 ?auto_20946 ) ) ( not ( = ?auto_20944 ?auto_20945 ) ) ( not ( = ?auto_20944 ?auto_20946 ) ) ( not ( = ?auto_20945 ?auto_20946 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_20945 ?auto_20946 )
      ( !STACK ?auto_20945 ?auto_20944 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_20952 - BLOCK
      ?auto_20953 - BLOCK
      ?auto_20954 - BLOCK
      ?auto_20955 - BLOCK
      ?auto_20956 - BLOCK
    )
    :vars
    (
      ?auto_20957 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_20955 ) ( ON ?auto_20956 ?auto_20957 ) ( CLEAR ?auto_20956 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_20952 ) ( ON ?auto_20953 ?auto_20952 ) ( ON ?auto_20954 ?auto_20953 ) ( ON ?auto_20955 ?auto_20954 ) ( not ( = ?auto_20952 ?auto_20953 ) ) ( not ( = ?auto_20952 ?auto_20954 ) ) ( not ( = ?auto_20952 ?auto_20955 ) ) ( not ( = ?auto_20952 ?auto_20956 ) ) ( not ( = ?auto_20952 ?auto_20957 ) ) ( not ( = ?auto_20953 ?auto_20954 ) ) ( not ( = ?auto_20953 ?auto_20955 ) ) ( not ( = ?auto_20953 ?auto_20956 ) ) ( not ( = ?auto_20953 ?auto_20957 ) ) ( not ( = ?auto_20954 ?auto_20955 ) ) ( not ( = ?auto_20954 ?auto_20956 ) ) ( not ( = ?auto_20954 ?auto_20957 ) ) ( not ( = ?auto_20955 ?auto_20956 ) ) ( not ( = ?auto_20955 ?auto_20957 ) ) ( not ( = ?auto_20956 ?auto_20957 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_20956 ?auto_20957 )
      ( !STACK ?auto_20956 ?auto_20955 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_20963 - BLOCK
      ?auto_20964 - BLOCK
      ?auto_20965 - BLOCK
      ?auto_20966 - BLOCK
      ?auto_20967 - BLOCK
    )
    :vars
    (
      ?auto_20968 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20967 ?auto_20968 ) ( ON-TABLE ?auto_20963 ) ( ON ?auto_20964 ?auto_20963 ) ( ON ?auto_20965 ?auto_20964 ) ( not ( = ?auto_20963 ?auto_20964 ) ) ( not ( = ?auto_20963 ?auto_20965 ) ) ( not ( = ?auto_20963 ?auto_20966 ) ) ( not ( = ?auto_20963 ?auto_20967 ) ) ( not ( = ?auto_20963 ?auto_20968 ) ) ( not ( = ?auto_20964 ?auto_20965 ) ) ( not ( = ?auto_20964 ?auto_20966 ) ) ( not ( = ?auto_20964 ?auto_20967 ) ) ( not ( = ?auto_20964 ?auto_20968 ) ) ( not ( = ?auto_20965 ?auto_20966 ) ) ( not ( = ?auto_20965 ?auto_20967 ) ) ( not ( = ?auto_20965 ?auto_20968 ) ) ( not ( = ?auto_20966 ?auto_20967 ) ) ( not ( = ?auto_20966 ?auto_20968 ) ) ( not ( = ?auto_20967 ?auto_20968 ) ) ( CLEAR ?auto_20965 ) ( ON ?auto_20966 ?auto_20967 ) ( CLEAR ?auto_20966 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_20963 ?auto_20964 ?auto_20965 ?auto_20966 )
      ( MAKE-5PILE ?auto_20963 ?auto_20964 ?auto_20965 ?auto_20966 ?auto_20967 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_20974 - BLOCK
      ?auto_20975 - BLOCK
      ?auto_20976 - BLOCK
      ?auto_20977 - BLOCK
      ?auto_20978 - BLOCK
    )
    :vars
    (
      ?auto_20979 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20978 ?auto_20979 ) ( ON-TABLE ?auto_20974 ) ( ON ?auto_20975 ?auto_20974 ) ( ON ?auto_20976 ?auto_20975 ) ( not ( = ?auto_20974 ?auto_20975 ) ) ( not ( = ?auto_20974 ?auto_20976 ) ) ( not ( = ?auto_20974 ?auto_20977 ) ) ( not ( = ?auto_20974 ?auto_20978 ) ) ( not ( = ?auto_20974 ?auto_20979 ) ) ( not ( = ?auto_20975 ?auto_20976 ) ) ( not ( = ?auto_20975 ?auto_20977 ) ) ( not ( = ?auto_20975 ?auto_20978 ) ) ( not ( = ?auto_20975 ?auto_20979 ) ) ( not ( = ?auto_20976 ?auto_20977 ) ) ( not ( = ?auto_20976 ?auto_20978 ) ) ( not ( = ?auto_20976 ?auto_20979 ) ) ( not ( = ?auto_20977 ?auto_20978 ) ) ( not ( = ?auto_20977 ?auto_20979 ) ) ( not ( = ?auto_20978 ?auto_20979 ) ) ( CLEAR ?auto_20976 ) ( ON ?auto_20977 ?auto_20978 ) ( CLEAR ?auto_20977 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_20974 ?auto_20975 ?auto_20976 ?auto_20977 )
      ( MAKE-5PILE ?auto_20974 ?auto_20975 ?auto_20976 ?auto_20977 ?auto_20978 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_20985 - BLOCK
      ?auto_20986 - BLOCK
      ?auto_20987 - BLOCK
      ?auto_20988 - BLOCK
      ?auto_20989 - BLOCK
    )
    :vars
    (
      ?auto_20990 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20989 ?auto_20990 ) ( ON-TABLE ?auto_20985 ) ( ON ?auto_20986 ?auto_20985 ) ( not ( = ?auto_20985 ?auto_20986 ) ) ( not ( = ?auto_20985 ?auto_20987 ) ) ( not ( = ?auto_20985 ?auto_20988 ) ) ( not ( = ?auto_20985 ?auto_20989 ) ) ( not ( = ?auto_20985 ?auto_20990 ) ) ( not ( = ?auto_20986 ?auto_20987 ) ) ( not ( = ?auto_20986 ?auto_20988 ) ) ( not ( = ?auto_20986 ?auto_20989 ) ) ( not ( = ?auto_20986 ?auto_20990 ) ) ( not ( = ?auto_20987 ?auto_20988 ) ) ( not ( = ?auto_20987 ?auto_20989 ) ) ( not ( = ?auto_20987 ?auto_20990 ) ) ( not ( = ?auto_20988 ?auto_20989 ) ) ( not ( = ?auto_20988 ?auto_20990 ) ) ( not ( = ?auto_20989 ?auto_20990 ) ) ( ON ?auto_20988 ?auto_20989 ) ( CLEAR ?auto_20986 ) ( ON ?auto_20987 ?auto_20988 ) ( CLEAR ?auto_20987 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_20985 ?auto_20986 ?auto_20987 )
      ( MAKE-5PILE ?auto_20985 ?auto_20986 ?auto_20987 ?auto_20988 ?auto_20989 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_20996 - BLOCK
      ?auto_20997 - BLOCK
      ?auto_20998 - BLOCK
      ?auto_20999 - BLOCK
      ?auto_21000 - BLOCK
    )
    :vars
    (
      ?auto_21001 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21000 ?auto_21001 ) ( ON-TABLE ?auto_20996 ) ( ON ?auto_20997 ?auto_20996 ) ( not ( = ?auto_20996 ?auto_20997 ) ) ( not ( = ?auto_20996 ?auto_20998 ) ) ( not ( = ?auto_20996 ?auto_20999 ) ) ( not ( = ?auto_20996 ?auto_21000 ) ) ( not ( = ?auto_20996 ?auto_21001 ) ) ( not ( = ?auto_20997 ?auto_20998 ) ) ( not ( = ?auto_20997 ?auto_20999 ) ) ( not ( = ?auto_20997 ?auto_21000 ) ) ( not ( = ?auto_20997 ?auto_21001 ) ) ( not ( = ?auto_20998 ?auto_20999 ) ) ( not ( = ?auto_20998 ?auto_21000 ) ) ( not ( = ?auto_20998 ?auto_21001 ) ) ( not ( = ?auto_20999 ?auto_21000 ) ) ( not ( = ?auto_20999 ?auto_21001 ) ) ( not ( = ?auto_21000 ?auto_21001 ) ) ( ON ?auto_20999 ?auto_21000 ) ( CLEAR ?auto_20997 ) ( ON ?auto_20998 ?auto_20999 ) ( CLEAR ?auto_20998 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_20996 ?auto_20997 ?auto_20998 )
      ( MAKE-5PILE ?auto_20996 ?auto_20997 ?auto_20998 ?auto_20999 ?auto_21000 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_21007 - BLOCK
      ?auto_21008 - BLOCK
      ?auto_21009 - BLOCK
      ?auto_21010 - BLOCK
      ?auto_21011 - BLOCK
    )
    :vars
    (
      ?auto_21012 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21011 ?auto_21012 ) ( ON-TABLE ?auto_21007 ) ( not ( = ?auto_21007 ?auto_21008 ) ) ( not ( = ?auto_21007 ?auto_21009 ) ) ( not ( = ?auto_21007 ?auto_21010 ) ) ( not ( = ?auto_21007 ?auto_21011 ) ) ( not ( = ?auto_21007 ?auto_21012 ) ) ( not ( = ?auto_21008 ?auto_21009 ) ) ( not ( = ?auto_21008 ?auto_21010 ) ) ( not ( = ?auto_21008 ?auto_21011 ) ) ( not ( = ?auto_21008 ?auto_21012 ) ) ( not ( = ?auto_21009 ?auto_21010 ) ) ( not ( = ?auto_21009 ?auto_21011 ) ) ( not ( = ?auto_21009 ?auto_21012 ) ) ( not ( = ?auto_21010 ?auto_21011 ) ) ( not ( = ?auto_21010 ?auto_21012 ) ) ( not ( = ?auto_21011 ?auto_21012 ) ) ( ON ?auto_21010 ?auto_21011 ) ( ON ?auto_21009 ?auto_21010 ) ( CLEAR ?auto_21007 ) ( ON ?auto_21008 ?auto_21009 ) ( CLEAR ?auto_21008 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_21007 ?auto_21008 )
      ( MAKE-5PILE ?auto_21007 ?auto_21008 ?auto_21009 ?auto_21010 ?auto_21011 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_21018 - BLOCK
      ?auto_21019 - BLOCK
      ?auto_21020 - BLOCK
      ?auto_21021 - BLOCK
      ?auto_21022 - BLOCK
    )
    :vars
    (
      ?auto_21023 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21022 ?auto_21023 ) ( ON-TABLE ?auto_21018 ) ( not ( = ?auto_21018 ?auto_21019 ) ) ( not ( = ?auto_21018 ?auto_21020 ) ) ( not ( = ?auto_21018 ?auto_21021 ) ) ( not ( = ?auto_21018 ?auto_21022 ) ) ( not ( = ?auto_21018 ?auto_21023 ) ) ( not ( = ?auto_21019 ?auto_21020 ) ) ( not ( = ?auto_21019 ?auto_21021 ) ) ( not ( = ?auto_21019 ?auto_21022 ) ) ( not ( = ?auto_21019 ?auto_21023 ) ) ( not ( = ?auto_21020 ?auto_21021 ) ) ( not ( = ?auto_21020 ?auto_21022 ) ) ( not ( = ?auto_21020 ?auto_21023 ) ) ( not ( = ?auto_21021 ?auto_21022 ) ) ( not ( = ?auto_21021 ?auto_21023 ) ) ( not ( = ?auto_21022 ?auto_21023 ) ) ( ON ?auto_21021 ?auto_21022 ) ( ON ?auto_21020 ?auto_21021 ) ( CLEAR ?auto_21018 ) ( ON ?auto_21019 ?auto_21020 ) ( CLEAR ?auto_21019 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_21018 ?auto_21019 )
      ( MAKE-5PILE ?auto_21018 ?auto_21019 ?auto_21020 ?auto_21021 ?auto_21022 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_21029 - BLOCK
      ?auto_21030 - BLOCK
      ?auto_21031 - BLOCK
      ?auto_21032 - BLOCK
      ?auto_21033 - BLOCK
    )
    :vars
    (
      ?auto_21034 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21033 ?auto_21034 ) ( not ( = ?auto_21029 ?auto_21030 ) ) ( not ( = ?auto_21029 ?auto_21031 ) ) ( not ( = ?auto_21029 ?auto_21032 ) ) ( not ( = ?auto_21029 ?auto_21033 ) ) ( not ( = ?auto_21029 ?auto_21034 ) ) ( not ( = ?auto_21030 ?auto_21031 ) ) ( not ( = ?auto_21030 ?auto_21032 ) ) ( not ( = ?auto_21030 ?auto_21033 ) ) ( not ( = ?auto_21030 ?auto_21034 ) ) ( not ( = ?auto_21031 ?auto_21032 ) ) ( not ( = ?auto_21031 ?auto_21033 ) ) ( not ( = ?auto_21031 ?auto_21034 ) ) ( not ( = ?auto_21032 ?auto_21033 ) ) ( not ( = ?auto_21032 ?auto_21034 ) ) ( not ( = ?auto_21033 ?auto_21034 ) ) ( ON ?auto_21032 ?auto_21033 ) ( ON ?auto_21031 ?auto_21032 ) ( ON ?auto_21030 ?auto_21031 ) ( ON ?auto_21029 ?auto_21030 ) ( CLEAR ?auto_21029 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_21029 )
      ( MAKE-5PILE ?auto_21029 ?auto_21030 ?auto_21031 ?auto_21032 ?auto_21033 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_21040 - BLOCK
      ?auto_21041 - BLOCK
      ?auto_21042 - BLOCK
      ?auto_21043 - BLOCK
      ?auto_21044 - BLOCK
    )
    :vars
    (
      ?auto_21045 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21044 ?auto_21045 ) ( not ( = ?auto_21040 ?auto_21041 ) ) ( not ( = ?auto_21040 ?auto_21042 ) ) ( not ( = ?auto_21040 ?auto_21043 ) ) ( not ( = ?auto_21040 ?auto_21044 ) ) ( not ( = ?auto_21040 ?auto_21045 ) ) ( not ( = ?auto_21041 ?auto_21042 ) ) ( not ( = ?auto_21041 ?auto_21043 ) ) ( not ( = ?auto_21041 ?auto_21044 ) ) ( not ( = ?auto_21041 ?auto_21045 ) ) ( not ( = ?auto_21042 ?auto_21043 ) ) ( not ( = ?auto_21042 ?auto_21044 ) ) ( not ( = ?auto_21042 ?auto_21045 ) ) ( not ( = ?auto_21043 ?auto_21044 ) ) ( not ( = ?auto_21043 ?auto_21045 ) ) ( not ( = ?auto_21044 ?auto_21045 ) ) ( ON ?auto_21043 ?auto_21044 ) ( ON ?auto_21042 ?auto_21043 ) ( ON ?auto_21041 ?auto_21042 ) ( ON ?auto_21040 ?auto_21041 ) ( CLEAR ?auto_21040 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_21040 )
      ( MAKE-5PILE ?auto_21040 ?auto_21041 ?auto_21042 ?auto_21043 ?auto_21044 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_21052 - BLOCK
      ?auto_21053 - BLOCK
      ?auto_21054 - BLOCK
      ?auto_21055 - BLOCK
      ?auto_21056 - BLOCK
      ?auto_21057 - BLOCK
    )
    :vars
    (
      ?auto_21058 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_21056 ) ( ON ?auto_21057 ?auto_21058 ) ( CLEAR ?auto_21057 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_21052 ) ( ON ?auto_21053 ?auto_21052 ) ( ON ?auto_21054 ?auto_21053 ) ( ON ?auto_21055 ?auto_21054 ) ( ON ?auto_21056 ?auto_21055 ) ( not ( = ?auto_21052 ?auto_21053 ) ) ( not ( = ?auto_21052 ?auto_21054 ) ) ( not ( = ?auto_21052 ?auto_21055 ) ) ( not ( = ?auto_21052 ?auto_21056 ) ) ( not ( = ?auto_21052 ?auto_21057 ) ) ( not ( = ?auto_21052 ?auto_21058 ) ) ( not ( = ?auto_21053 ?auto_21054 ) ) ( not ( = ?auto_21053 ?auto_21055 ) ) ( not ( = ?auto_21053 ?auto_21056 ) ) ( not ( = ?auto_21053 ?auto_21057 ) ) ( not ( = ?auto_21053 ?auto_21058 ) ) ( not ( = ?auto_21054 ?auto_21055 ) ) ( not ( = ?auto_21054 ?auto_21056 ) ) ( not ( = ?auto_21054 ?auto_21057 ) ) ( not ( = ?auto_21054 ?auto_21058 ) ) ( not ( = ?auto_21055 ?auto_21056 ) ) ( not ( = ?auto_21055 ?auto_21057 ) ) ( not ( = ?auto_21055 ?auto_21058 ) ) ( not ( = ?auto_21056 ?auto_21057 ) ) ( not ( = ?auto_21056 ?auto_21058 ) ) ( not ( = ?auto_21057 ?auto_21058 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_21057 ?auto_21058 )
      ( !STACK ?auto_21057 ?auto_21056 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_21065 - BLOCK
      ?auto_21066 - BLOCK
      ?auto_21067 - BLOCK
      ?auto_21068 - BLOCK
      ?auto_21069 - BLOCK
      ?auto_21070 - BLOCK
    )
    :vars
    (
      ?auto_21071 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_21069 ) ( ON ?auto_21070 ?auto_21071 ) ( CLEAR ?auto_21070 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_21065 ) ( ON ?auto_21066 ?auto_21065 ) ( ON ?auto_21067 ?auto_21066 ) ( ON ?auto_21068 ?auto_21067 ) ( ON ?auto_21069 ?auto_21068 ) ( not ( = ?auto_21065 ?auto_21066 ) ) ( not ( = ?auto_21065 ?auto_21067 ) ) ( not ( = ?auto_21065 ?auto_21068 ) ) ( not ( = ?auto_21065 ?auto_21069 ) ) ( not ( = ?auto_21065 ?auto_21070 ) ) ( not ( = ?auto_21065 ?auto_21071 ) ) ( not ( = ?auto_21066 ?auto_21067 ) ) ( not ( = ?auto_21066 ?auto_21068 ) ) ( not ( = ?auto_21066 ?auto_21069 ) ) ( not ( = ?auto_21066 ?auto_21070 ) ) ( not ( = ?auto_21066 ?auto_21071 ) ) ( not ( = ?auto_21067 ?auto_21068 ) ) ( not ( = ?auto_21067 ?auto_21069 ) ) ( not ( = ?auto_21067 ?auto_21070 ) ) ( not ( = ?auto_21067 ?auto_21071 ) ) ( not ( = ?auto_21068 ?auto_21069 ) ) ( not ( = ?auto_21068 ?auto_21070 ) ) ( not ( = ?auto_21068 ?auto_21071 ) ) ( not ( = ?auto_21069 ?auto_21070 ) ) ( not ( = ?auto_21069 ?auto_21071 ) ) ( not ( = ?auto_21070 ?auto_21071 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_21070 ?auto_21071 )
      ( !STACK ?auto_21070 ?auto_21069 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_21078 - BLOCK
      ?auto_21079 - BLOCK
      ?auto_21080 - BLOCK
      ?auto_21081 - BLOCK
      ?auto_21082 - BLOCK
      ?auto_21083 - BLOCK
    )
    :vars
    (
      ?auto_21084 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21083 ?auto_21084 ) ( ON-TABLE ?auto_21078 ) ( ON ?auto_21079 ?auto_21078 ) ( ON ?auto_21080 ?auto_21079 ) ( ON ?auto_21081 ?auto_21080 ) ( not ( = ?auto_21078 ?auto_21079 ) ) ( not ( = ?auto_21078 ?auto_21080 ) ) ( not ( = ?auto_21078 ?auto_21081 ) ) ( not ( = ?auto_21078 ?auto_21082 ) ) ( not ( = ?auto_21078 ?auto_21083 ) ) ( not ( = ?auto_21078 ?auto_21084 ) ) ( not ( = ?auto_21079 ?auto_21080 ) ) ( not ( = ?auto_21079 ?auto_21081 ) ) ( not ( = ?auto_21079 ?auto_21082 ) ) ( not ( = ?auto_21079 ?auto_21083 ) ) ( not ( = ?auto_21079 ?auto_21084 ) ) ( not ( = ?auto_21080 ?auto_21081 ) ) ( not ( = ?auto_21080 ?auto_21082 ) ) ( not ( = ?auto_21080 ?auto_21083 ) ) ( not ( = ?auto_21080 ?auto_21084 ) ) ( not ( = ?auto_21081 ?auto_21082 ) ) ( not ( = ?auto_21081 ?auto_21083 ) ) ( not ( = ?auto_21081 ?auto_21084 ) ) ( not ( = ?auto_21082 ?auto_21083 ) ) ( not ( = ?auto_21082 ?auto_21084 ) ) ( not ( = ?auto_21083 ?auto_21084 ) ) ( CLEAR ?auto_21081 ) ( ON ?auto_21082 ?auto_21083 ) ( CLEAR ?auto_21082 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_21078 ?auto_21079 ?auto_21080 ?auto_21081 ?auto_21082 )
      ( MAKE-6PILE ?auto_21078 ?auto_21079 ?auto_21080 ?auto_21081 ?auto_21082 ?auto_21083 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_21091 - BLOCK
      ?auto_21092 - BLOCK
      ?auto_21093 - BLOCK
      ?auto_21094 - BLOCK
      ?auto_21095 - BLOCK
      ?auto_21096 - BLOCK
    )
    :vars
    (
      ?auto_21097 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21096 ?auto_21097 ) ( ON-TABLE ?auto_21091 ) ( ON ?auto_21092 ?auto_21091 ) ( ON ?auto_21093 ?auto_21092 ) ( ON ?auto_21094 ?auto_21093 ) ( not ( = ?auto_21091 ?auto_21092 ) ) ( not ( = ?auto_21091 ?auto_21093 ) ) ( not ( = ?auto_21091 ?auto_21094 ) ) ( not ( = ?auto_21091 ?auto_21095 ) ) ( not ( = ?auto_21091 ?auto_21096 ) ) ( not ( = ?auto_21091 ?auto_21097 ) ) ( not ( = ?auto_21092 ?auto_21093 ) ) ( not ( = ?auto_21092 ?auto_21094 ) ) ( not ( = ?auto_21092 ?auto_21095 ) ) ( not ( = ?auto_21092 ?auto_21096 ) ) ( not ( = ?auto_21092 ?auto_21097 ) ) ( not ( = ?auto_21093 ?auto_21094 ) ) ( not ( = ?auto_21093 ?auto_21095 ) ) ( not ( = ?auto_21093 ?auto_21096 ) ) ( not ( = ?auto_21093 ?auto_21097 ) ) ( not ( = ?auto_21094 ?auto_21095 ) ) ( not ( = ?auto_21094 ?auto_21096 ) ) ( not ( = ?auto_21094 ?auto_21097 ) ) ( not ( = ?auto_21095 ?auto_21096 ) ) ( not ( = ?auto_21095 ?auto_21097 ) ) ( not ( = ?auto_21096 ?auto_21097 ) ) ( CLEAR ?auto_21094 ) ( ON ?auto_21095 ?auto_21096 ) ( CLEAR ?auto_21095 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_21091 ?auto_21092 ?auto_21093 ?auto_21094 ?auto_21095 )
      ( MAKE-6PILE ?auto_21091 ?auto_21092 ?auto_21093 ?auto_21094 ?auto_21095 ?auto_21096 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_21104 - BLOCK
      ?auto_21105 - BLOCK
      ?auto_21106 - BLOCK
      ?auto_21107 - BLOCK
      ?auto_21108 - BLOCK
      ?auto_21109 - BLOCK
    )
    :vars
    (
      ?auto_21110 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21109 ?auto_21110 ) ( ON-TABLE ?auto_21104 ) ( ON ?auto_21105 ?auto_21104 ) ( ON ?auto_21106 ?auto_21105 ) ( not ( = ?auto_21104 ?auto_21105 ) ) ( not ( = ?auto_21104 ?auto_21106 ) ) ( not ( = ?auto_21104 ?auto_21107 ) ) ( not ( = ?auto_21104 ?auto_21108 ) ) ( not ( = ?auto_21104 ?auto_21109 ) ) ( not ( = ?auto_21104 ?auto_21110 ) ) ( not ( = ?auto_21105 ?auto_21106 ) ) ( not ( = ?auto_21105 ?auto_21107 ) ) ( not ( = ?auto_21105 ?auto_21108 ) ) ( not ( = ?auto_21105 ?auto_21109 ) ) ( not ( = ?auto_21105 ?auto_21110 ) ) ( not ( = ?auto_21106 ?auto_21107 ) ) ( not ( = ?auto_21106 ?auto_21108 ) ) ( not ( = ?auto_21106 ?auto_21109 ) ) ( not ( = ?auto_21106 ?auto_21110 ) ) ( not ( = ?auto_21107 ?auto_21108 ) ) ( not ( = ?auto_21107 ?auto_21109 ) ) ( not ( = ?auto_21107 ?auto_21110 ) ) ( not ( = ?auto_21108 ?auto_21109 ) ) ( not ( = ?auto_21108 ?auto_21110 ) ) ( not ( = ?auto_21109 ?auto_21110 ) ) ( ON ?auto_21108 ?auto_21109 ) ( CLEAR ?auto_21106 ) ( ON ?auto_21107 ?auto_21108 ) ( CLEAR ?auto_21107 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_21104 ?auto_21105 ?auto_21106 ?auto_21107 )
      ( MAKE-6PILE ?auto_21104 ?auto_21105 ?auto_21106 ?auto_21107 ?auto_21108 ?auto_21109 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_21117 - BLOCK
      ?auto_21118 - BLOCK
      ?auto_21119 - BLOCK
      ?auto_21120 - BLOCK
      ?auto_21121 - BLOCK
      ?auto_21122 - BLOCK
    )
    :vars
    (
      ?auto_21123 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21122 ?auto_21123 ) ( ON-TABLE ?auto_21117 ) ( ON ?auto_21118 ?auto_21117 ) ( ON ?auto_21119 ?auto_21118 ) ( not ( = ?auto_21117 ?auto_21118 ) ) ( not ( = ?auto_21117 ?auto_21119 ) ) ( not ( = ?auto_21117 ?auto_21120 ) ) ( not ( = ?auto_21117 ?auto_21121 ) ) ( not ( = ?auto_21117 ?auto_21122 ) ) ( not ( = ?auto_21117 ?auto_21123 ) ) ( not ( = ?auto_21118 ?auto_21119 ) ) ( not ( = ?auto_21118 ?auto_21120 ) ) ( not ( = ?auto_21118 ?auto_21121 ) ) ( not ( = ?auto_21118 ?auto_21122 ) ) ( not ( = ?auto_21118 ?auto_21123 ) ) ( not ( = ?auto_21119 ?auto_21120 ) ) ( not ( = ?auto_21119 ?auto_21121 ) ) ( not ( = ?auto_21119 ?auto_21122 ) ) ( not ( = ?auto_21119 ?auto_21123 ) ) ( not ( = ?auto_21120 ?auto_21121 ) ) ( not ( = ?auto_21120 ?auto_21122 ) ) ( not ( = ?auto_21120 ?auto_21123 ) ) ( not ( = ?auto_21121 ?auto_21122 ) ) ( not ( = ?auto_21121 ?auto_21123 ) ) ( not ( = ?auto_21122 ?auto_21123 ) ) ( ON ?auto_21121 ?auto_21122 ) ( CLEAR ?auto_21119 ) ( ON ?auto_21120 ?auto_21121 ) ( CLEAR ?auto_21120 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_21117 ?auto_21118 ?auto_21119 ?auto_21120 )
      ( MAKE-6PILE ?auto_21117 ?auto_21118 ?auto_21119 ?auto_21120 ?auto_21121 ?auto_21122 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_21130 - BLOCK
      ?auto_21131 - BLOCK
      ?auto_21132 - BLOCK
      ?auto_21133 - BLOCK
      ?auto_21134 - BLOCK
      ?auto_21135 - BLOCK
    )
    :vars
    (
      ?auto_21136 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21135 ?auto_21136 ) ( ON-TABLE ?auto_21130 ) ( ON ?auto_21131 ?auto_21130 ) ( not ( = ?auto_21130 ?auto_21131 ) ) ( not ( = ?auto_21130 ?auto_21132 ) ) ( not ( = ?auto_21130 ?auto_21133 ) ) ( not ( = ?auto_21130 ?auto_21134 ) ) ( not ( = ?auto_21130 ?auto_21135 ) ) ( not ( = ?auto_21130 ?auto_21136 ) ) ( not ( = ?auto_21131 ?auto_21132 ) ) ( not ( = ?auto_21131 ?auto_21133 ) ) ( not ( = ?auto_21131 ?auto_21134 ) ) ( not ( = ?auto_21131 ?auto_21135 ) ) ( not ( = ?auto_21131 ?auto_21136 ) ) ( not ( = ?auto_21132 ?auto_21133 ) ) ( not ( = ?auto_21132 ?auto_21134 ) ) ( not ( = ?auto_21132 ?auto_21135 ) ) ( not ( = ?auto_21132 ?auto_21136 ) ) ( not ( = ?auto_21133 ?auto_21134 ) ) ( not ( = ?auto_21133 ?auto_21135 ) ) ( not ( = ?auto_21133 ?auto_21136 ) ) ( not ( = ?auto_21134 ?auto_21135 ) ) ( not ( = ?auto_21134 ?auto_21136 ) ) ( not ( = ?auto_21135 ?auto_21136 ) ) ( ON ?auto_21134 ?auto_21135 ) ( ON ?auto_21133 ?auto_21134 ) ( CLEAR ?auto_21131 ) ( ON ?auto_21132 ?auto_21133 ) ( CLEAR ?auto_21132 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_21130 ?auto_21131 ?auto_21132 )
      ( MAKE-6PILE ?auto_21130 ?auto_21131 ?auto_21132 ?auto_21133 ?auto_21134 ?auto_21135 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_21143 - BLOCK
      ?auto_21144 - BLOCK
      ?auto_21145 - BLOCK
      ?auto_21146 - BLOCK
      ?auto_21147 - BLOCK
      ?auto_21148 - BLOCK
    )
    :vars
    (
      ?auto_21149 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21148 ?auto_21149 ) ( ON-TABLE ?auto_21143 ) ( ON ?auto_21144 ?auto_21143 ) ( not ( = ?auto_21143 ?auto_21144 ) ) ( not ( = ?auto_21143 ?auto_21145 ) ) ( not ( = ?auto_21143 ?auto_21146 ) ) ( not ( = ?auto_21143 ?auto_21147 ) ) ( not ( = ?auto_21143 ?auto_21148 ) ) ( not ( = ?auto_21143 ?auto_21149 ) ) ( not ( = ?auto_21144 ?auto_21145 ) ) ( not ( = ?auto_21144 ?auto_21146 ) ) ( not ( = ?auto_21144 ?auto_21147 ) ) ( not ( = ?auto_21144 ?auto_21148 ) ) ( not ( = ?auto_21144 ?auto_21149 ) ) ( not ( = ?auto_21145 ?auto_21146 ) ) ( not ( = ?auto_21145 ?auto_21147 ) ) ( not ( = ?auto_21145 ?auto_21148 ) ) ( not ( = ?auto_21145 ?auto_21149 ) ) ( not ( = ?auto_21146 ?auto_21147 ) ) ( not ( = ?auto_21146 ?auto_21148 ) ) ( not ( = ?auto_21146 ?auto_21149 ) ) ( not ( = ?auto_21147 ?auto_21148 ) ) ( not ( = ?auto_21147 ?auto_21149 ) ) ( not ( = ?auto_21148 ?auto_21149 ) ) ( ON ?auto_21147 ?auto_21148 ) ( ON ?auto_21146 ?auto_21147 ) ( CLEAR ?auto_21144 ) ( ON ?auto_21145 ?auto_21146 ) ( CLEAR ?auto_21145 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_21143 ?auto_21144 ?auto_21145 )
      ( MAKE-6PILE ?auto_21143 ?auto_21144 ?auto_21145 ?auto_21146 ?auto_21147 ?auto_21148 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_21156 - BLOCK
      ?auto_21157 - BLOCK
      ?auto_21158 - BLOCK
      ?auto_21159 - BLOCK
      ?auto_21160 - BLOCK
      ?auto_21161 - BLOCK
    )
    :vars
    (
      ?auto_21162 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21161 ?auto_21162 ) ( ON-TABLE ?auto_21156 ) ( not ( = ?auto_21156 ?auto_21157 ) ) ( not ( = ?auto_21156 ?auto_21158 ) ) ( not ( = ?auto_21156 ?auto_21159 ) ) ( not ( = ?auto_21156 ?auto_21160 ) ) ( not ( = ?auto_21156 ?auto_21161 ) ) ( not ( = ?auto_21156 ?auto_21162 ) ) ( not ( = ?auto_21157 ?auto_21158 ) ) ( not ( = ?auto_21157 ?auto_21159 ) ) ( not ( = ?auto_21157 ?auto_21160 ) ) ( not ( = ?auto_21157 ?auto_21161 ) ) ( not ( = ?auto_21157 ?auto_21162 ) ) ( not ( = ?auto_21158 ?auto_21159 ) ) ( not ( = ?auto_21158 ?auto_21160 ) ) ( not ( = ?auto_21158 ?auto_21161 ) ) ( not ( = ?auto_21158 ?auto_21162 ) ) ( not ( = ?auto_21159 ?auto_21160 ) ) ( not ( = ?auto_21159 ?auto_21161 ) ) ( not ( = ?auto_21159 ?auto_21162 ) ) ( not ( = ?auto_21160 ?auto_21161 ) ) ( not ( = ?auto_21160 ?auto_21162 ) ) ( not ( = ?auto_21161 ?auto_21162 ) ) ( ON ?auto_21160 ?auto_21161 ) ( ON ?auto_21159 ?auto_21160 ) ( ON ?auto_21158 ?auto_21159 ) ( CLEAR ?auto_21156 ) ( ON ?auto_21157 ?auto_21158 ) ( CLEAR ?auto_21157 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_21156 ?auto_21157 )
      ( MAKE-6PILE ?auto_21156 ?auto_21157 ?auto_21158 ?auto_21159 ?auto_21160 ?auto_21161 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_21169 - BLOCK
      ?auto_21170 - BLOCK
      ?auto_21171 - BLOCK
      ?auto_21172 - BLOCK
      ?auto_21173 - BLOCK
      ?auto_21174 - BLOCK
    )
    :vars
    (
      ?auto_21175 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21174 ?auto_21175 ) ( ON-TABLE ?auto_21169 ) ( not ( = ?auto_21169 ?auto_21170 ) ) ( not ( = ?auto_21169 ?auto_21171 ) ) ( not ( = ?auto_21169 ?auto_21172 ) ) ( not ( = ?auto_21169 ?auto_21173 ) ) ( not ( = ?auto_21169 ?auto_21174 ) ) ( not ( = ?auto_21169 ?auto_21175 ) ) ( not ( = ?auto_21170 ?auto_21171 ) ) ( not ( = ?auto_21170 ?auto_21172 ) ) ( not ( = ?auto_21170 ?auto_21173 ) ) ( not ( = ?auto_21170 ?auto_21174 ) ) ( not ( = ?auto_21170 ?auto_21175 ) ) ( not ( = ?auto_21171 ?auto_21172 ) ) ( not ( = ?auto_21171 ?auto_21173 ) ) ( not ( = ?auto_21171 ?auto_21174 ) ) ( not ( = ?auto_21171 ?auto_21175 ) ) ( not ( = ?auto_21172 ?auto_21173 ) ) ( not ( = ?auto_21172 ?auto_21174 ) ) ( not ( = ?auto_21172 ?auto_21175 ) ) ( not ( = ?auto_21173 ?auto_21174 ) ) ( not ( = ?auto_21173 ?auto_21175 ) ) ( not ( = ?auto_21174 ?auto_21175 ) ) ( ON ?auto_21173 ?auto_21174 ) ( ON ?auto_21172 ?auto_21173 ) ( ON ?auto_21171 ?auto_21172 ) ( CLEAR ?auto_21169 ) ( ON ?auto_21170 ?auto_21171 ) ( CLEAR ?auto_21170 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_21169 ?auto_21170 )
      ( MAKE-6PILE ?auto_21169 ?auto_21170 ?auto_21171 ?auto_21172 ?auto_21173 ?auto_21174 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_21182 - BLOCK
      ?auto_21183 - BLOCK
      ?auto_21184 - BLOCK
      ?auto_21185 - BLOCK
      ?auto_21186 - BLOCK
      ?auto_21187 - BLOCK
    )
    :vars
    (
      ?auto_21188 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21187 ?auto_21188 ) ( not ( = ?auto_21182 ?auto_21183 ) ) ( not ( = ?auto_21182 ?auto_21184 ) ) ( not ( = ?auto_21182 ?auto_21185 ) ) ( not ( = ?auto_21182 ?auto_21186 ) ) ( not ( = ?auto_21182 ?auto_21187 ) ) ( not ( = ?auto_21182 ?auto_21188 ) ) ( not ( = ?auto_21183 ?auto_21184 ) ) ( not ( = ?auto_21183 ?auto_21185 ) ) ( not ( = ?auto_21183 ?auto_21186 ) ) ( not ( = ?auto_21183 ?auto_21187 ) ) ( not ( = ?auto_21183 ?auto_21188 ) ) ( not ( = ?auto_21184 ?auto_21185 ) ) ( not ( = ?auto_21184 ?auto_21186 ) ) ( not ( = ?auto_21184 ?auto_21187 ) ) ( not ( = ?auto_21184 ?auto_21188 ) ) ( not ( = ?auto_21185 ?auto_21186 ) ) ( not ( = ?auto_21185 ?auto_21187 ) ) ( not ( = ?auto_21185 ?auto_21188 ) ) ( not ( = ?auto_21186 ?auto_21187 ) ) ( not ( = ?auto_21186 ?auto_21188 ) ) ( not ( = ?auto_21187 ?auto_21188 ) ) ( ON ?auto_21186 ?auto_21187 ) ( ON ?auto_21185 ?auto_21186 ) ( ON ?auto_21184 ?auto_21185 ) ( ON ?auto_21183 ?auto_21184 ) ( ON ?auto_21182 ?auto_21183 ) ( CLEAR ?auto_21182 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_21182 )
      ( MAKE-6PILE ?auto_21182 ?auto_21183 ?auto_21184 ?auto_21185 ?auto_21186 ?auto_21187 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_21195 - BLOCK
      ?auto_21196 - BLOCK
      ?auto_21197 - BLOCK
      ?auto_21198 - BLOCK
      ?auto_21199 - BLOCK
      ?auto_21200 - BLOCK
    )
    :vars
    (
      ?auto_21201 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21200 ?auto_21201 ) ( not ( = ?auto_21195 ?auto_21196 ) ) ( not ( = ?auto_21195 ?auto_21197 ) ) ( not ( = ?auto_21195 ?auto_21198 ) ) ( not ( = ?auto_21195 ?auto_21199 ) ) ( not ( = ?auto_21195 ?auto_21200 ) ) ( not ( = ?auto_21195 ?auto_21201 ) ) ( not ( = ?auto_21196 ?auto_21197 ) ) ( not ( = ?auto_21196 ?auto_21198 ) ) ( not ( = ?auto_21196 ?auto_21199 ) ) ( not ( = ?auto_21196 ?auto_21200 ) ) ( not ( = ?auto_21196 ?auto_21201 ) ) ( not ( = ?auto_21197 ?auto_21198 ) ) ( not ( = ?auto_21197 ?auto_21199 ) ) ( not ( = ?auto_21197 ?auto_21200 ) ) ( not ( = ?auto_21197 ?auto_21201 ) ) ( not ( = ?auto_21198 ?auto_21199 ) ) ( not ( = ?auto_21198 ?auto_21200 ) ) ( not ( = ?auto_21198 ?auto_21201 ) ) ( not ( = ?auto_21199 ?auto_21200 ) ) ( not ( = ?auto_21199 ?auto_21201 ) ) ( not ( = ?auto_21200 ?auto_21201 ) ) ( ON ?auto_21199 ?auto_21200 ) ( ON ?auto_21198 ?auto_21199 ) ( ON ?auto_21197 ?auto_21198 ) ( ON ?auto_21196 ?auto_21197 ) ( ON ?auto_21195 ?auto_21196 ) ( CLEAR ?auto_21195 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_21195 )
      ( MAKE-6PILE ?auto_21195 ?auto_21196 ?auto_21197 ?auto_21198 ?auto_21199 ?auto_21200 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_21209 - BLOCK
      ?auto_21210 - BLOCK
      ?auto_21211 - BLOCK
      ?auto_21212 - BLOCK
      ?auto_21213 - BLOCK
      ?auto_21214 - BLOCK
      ?auto_21215 - BLOCK
    )
    :vars
    (
      ?auto_21216 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_21214 ) ( ON ?auto_21215 ?auto_21216 ) ( CLEAR ?auto_21215 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_21209 ) ( ON ?auto_21210 ?auto_21209 ) ( ON ?auto_21211 ?auto_21210 ) ( ON ?auto_21212 ?auto_21211 ) ( ON ?auto_21213 ?auto_21212 ) ( ON ?auto_21214 ?auto_21213 ) ( not ( = ?auto_21209 ?auto_21210 ) ) ( not ( = ?auto_21209 ?auto_21211 ) ) ( not ( = ?auto_21209 ?auto_21212 ) ) ( not ( = ?auto_21209 ?auto_21213 ) ) ( not ( = ?auto_21209 ?auto_21214 ) ) ( not ( = ?auto_21209 ?auto_21215 ) ) ( not ( = ?auto_21209 ?auto_21216 ) ) ( not ( = ?auto_21210 ?auto_21211 ) ) ( not ( = ?auto_21210 ?auto_21212 ) ) ( not ( = ?auto_21210 ?auto_21213 ) ) ( not ( = ?auto_21210 ?auto_21214 ) ) ( not ( = ?auto_21210 ?auto_21215 ) ) ( not ( = ?auto_21210 ?auto_21216 ) ) ( not ( = ?auto_21211 ?auto_21212 ) ) ( not ( = ?auto_21211 ?auto_21213 ) ) ( not ( = ?auto_21211 ?auto_21214 ) ) ( not ( = ?auto_21211 ?auto_21215 ) ) ( not ( = ?auto_21211 ?auto_21216 ) ) ( not ( = ?auto_21212 ?auto_21213 ) ) ( not ( = ?auto_21212 ?auto_21214 ) ) ( not ( = ?auto_21212 ?auto_21215 ) ) ( not ( = ?auto_21212 ?auto_21216 ) ) ( not ( = ?auto_21213 ?auto_21214 ) ) ( not ( = ?auto_21213 ?auto_21215 ) ) ( not ( = ?auto_21213 ?auto_21216 ) ) ( not ( = ?auto_21214 ?auto_21215 ) ) ( not ( = ?auto_21214 ?auto_21216 ) ) ( not ( = ?auto_21215 ?auto_21216 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_21215 ?auto_21216 )
      ( !STACK ?auto_21215 ?auto_21214 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_21224 - BLOCK
      ?auto_21225 - BLOCK
      ?auto_21226 - BLOCK
      ?auto_21227 - BLOCK
      ?auto_21228 - BLOCK
      ?auto_21229 - BLOCK
      ?auto_21230 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_21229 ) ( ON-TABLE ?auto_21230 ) ( CLEAR ?auto_21230 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_21224 ) ( ON ?auto_21225 ?auto_21224 ) ( ON ?auto_21226 ?auto_21225 ) ( ON ?auto_21227 ?auto_21226 ) ( ON ?auto_21228 ?auto_21227 ) ( ON ?auto_21229 ?auto_21228 ) ( not ( = ?auto_21224 ?auto_21225 ) ) ( not ( = ?auto_21224 ?auto_21226 ) ) ( not ( = ?auto_21224 ?auto_21227 ) ) ( not ( = ?auto_21224 ?auto_21228 ) ) ( not ( = ?auto_21224 ?auto_21229 ) ) ( not ( = ?auto_21224 ?auto_21230 ) ) ( not ( = ?auto_21225 ?auto_21226 ) ) ( not ( = ?auto_21225 ?auto_21227 ) ) ( not ( = ?auto_21225 ?auto_21228 ) ) ( not ( = ?auto_21225 ?auto_21229 ) ) ( not ( = ?auto_21225 ?auto_21230 ) ) ( not ( = ?auto_21226 ?auto_21227 ) ) ( not ( = ?auto_21226 ?auto_21228 ) ) ( not ( = ?auto_21226 ?auto_21229 ) ) ( not ( = ?auto_21226 ?auto_21230 ) ) ( not ( = ?auto_21227 ?auto_21228 ) ) ( not ( = ?auto_21227 ?auto_21229 ) ) ( not ( = ?auto_21227 ?auto_21230 ) ) ( not ( = ?auto_21228 ?auto_21229 ) ) ( not ( = ?auto_21228 ?auto_21230 ) ) ( not ( = ?auto_21229 ?auto_21230 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_21230 )
      ( !STACK ?auto_21230 ?auto_21229 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_21238 - BLOCK
      ?auto_21239 - BLOCK
      ?auto_21240 - BLOCK
      ?auto_21241 - BLOCK
      ?auto_21242 - BLOCK
      ?auto_21243 - BLOCK
      ?auto_21244 - BLOCK
    )
    :vars
    (
      ?auto_21245 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21244 ?auto_21245 ) ( ON-TABLE ?auto_21238 ) ( ON ?auto_21239 ?auto_21238 ) ( ON ?auto_21240 ?auto_21239 ) ( ON ?auto_21241 ?auto_21240 ) ( ON ?auto_21242 ?auto_21241 ) ( not ( = ?auto_21238 ?auto_21239 ) ) ( not ( = ?auto_21238 ?auto_21240 ) ) ( not ( = ?auto_21238 ?auto_21241 ) ) ( not ( = ?auto_21238 ?auto_21242 ) ) ( not ( = ?auto_21238 ?auto_21243 ) ) ( not ( = ?auto_21238 ?auto_21244 ) ) ( not ( = ?auto_21238 ?auto_21245 ) ) ( not ( = ?auto_21239 ?auto_21240 ) ) ( not ( = ?auto_21239 ?auto_21241 ) ) ( not ( = ?auto_21239 ?auto_21242 ) ) ( not ( = ?auto_21239 ?auto_21243 ) ) ( not ( = ?auto_21239 ?auto_21244 ) ) ( not ( = ?auto_21239 ?auto_21245 ) ) ( not ( = ?auto_21240 ?auto_21241 ) ) ( not ( = ?auto_21240 ?auto_21242 ) ) ( not ( = ?auto_21240 ?auto_21243 ) ) ( not ( = ?auto_21240 ?auto_21244 ) ) ( not ( = ?auto_21240 ?auto_21245 ) ) ( not ( = ?auto_21241 ?auto_21242 ) ) ( not ( = ?auto_21241 ?auto_21243 ) ) ( not ( = ?auto_21241 ?auto_21244 ) ) ( not ( = ?auto_21241 ?auto_21245 ) ) ( not ( = ?auto_21242 ?auto_21243 ) ) ( not ( = ?auto_21242 ?auto_21244 ) ) ( not ( = ?auto_21242 ?auto_21245 ) ) ( not ( = ?auto_21243 ?auto_21244 ) ) ( not ( = ?auto_21243 ?auto_21245 ) ) ( not ( = ?auto_21244 ?auto_21245 ) ) ( CLEAR ?auto_21242 ) ( ON ?auto_21243 ?auto_21244 ) ( CLEAR ?auto_21243 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_21238 ?auto_21239 ?auto_21240 ?auto_21241 ?auto_21242 ?auto_21243 )
      ( MAKE-7PILE ?auto_21238 ?auto_21239 ?auto_21240 ?auto_21241 ?auto_21242 ?auto_21243 ?auto_21244 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_21253 - BLOCK
      ?auto_21254 - BLOCK
      ?auto_21255 - BLOCK
      ?auto_21256 - BLOCK
      ?auto_21257 - BLOCK
      ?auto_21258 - BLOCK
      ?auto_21259 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_21259 ) ( ON-TABLE ?auto_21253 ) ( ON ?auto_21254 ?auto_21253 ) ( ON ?auto_21255 ?auto_21254 ) ( ON ?auto_21256 ?auto_21255 ) ( ON ?auto_21257 ?auto_21256 ) ( not ( = ?auto_21253 ?auto_21254 ) ) ( not ( = ?auto_21253 ?auto_21255 ) ) ( not ( = ?auto_21253 ?auto_21256 ) ) ( not ( = ?auto_21253 ?auto_21257 ) ) ( not ( = ?auto_21253 ?auto_21258 ) ) ( not ( = ?auto_21253 ?auto_21259 ) ) ( not ( = ?auto_21254 ?auto_21255 ) ) ( not ( = ?auto_21254 ?auto_21256 ) ) ( not ( = ?auto_21254 ?auto_21257 ) ) ( not ( = ?auto_21254 ?auto_21258 ) ) ( not ( = ?auto_21254 ?auto_21259 ) ) ( not ( = ?auto_21255 ?auto_21256 ) ) ( not ( = ?auto_21255 ?auto_21257 ) ) ( not ( = ?auto_21255 ?auto_21258 ) ) ( not ( = ?auto_21255 ?auto_21259 ) ) ( not ( = ?auto_21256 ?auto_21257 ) ) ( not ( = ?auto_21256 ?auto_21258 ) ) ( not ( = ?auto_21256 ?auto_21259 ) ) ( not ( = ?auto_21257 ?auto_21258 ) ) ( not ( = ?auto_21257 ?auto_21259 ) ) ( not ( = ?auto_21258 ?auto_21259 ) ) ( CLEAR ?auto_21257 ) ( ON ?auto_21258 ?auto_21259 ) ( CLEAR ?auto_21258 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_21253 ?auto_21254 ?auto_21255 ?auto_21256 ?auto_21257 ?auto_21258 )
      ( MAKE-7PILE ?auto_21253 ?auto_21254 ?auto_21255 ?auto_21256 ?auto_21257 ?auto_21258 ?auto_21259 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_21267 - BLOCK
      ?auto_21268 - BLOCK
      ?auto_21269 - BLOCK
      ?auto_21270 - BLOCK
      ?auto_21271 - BLOCK
      ?auto_21272 - BLOCK
      ?auto_21273 - BLOCK
    )
    :vars
    (
      ?auto_21274 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21273 ?auto_21274 ) ( ON-TABLE ?auto_21267 ) ( ON ?auto_21268 ?auto_21267 ) ( ON ?auto_21269 ?auto_21268 ) ( ON ?auto_21270 ?auto_21269 ) ( not ( = ?auto_21267 ?auto_21268 ) ) ( not ( = ?auto_21267 ?auto_21269 ) ) ( not ( = ?auto_21267 ?auto_21270 ) ) ( not ( = ?auto_21267 ?auto_21271 ) ) ( not ( = ?auto_21267 ?auto_21272 ) ) ( not ( = ?auto_21267 ?auto_21273 ) ) ( not ( = ?auto_21267 ?auto_21274 ) ) ( not ( = ?auto_21268 ?auto_21269 ) ) ( not ( = ?auto_21268 ?auto_21270 ) ) ( not ( = ?auto_21268 ?auto_21271 ) ) ( not ( = ?auto_21268 ?auto_21272 ) ) ( not ( = ?auto_21268 ?auto_21273 ) ) ( not ( = ?auto_21268 ?auto_21274 ) ) ( not ( = ?auto_21269 ?auto_21270 ) ) ( not ( = ?auto_21269 ?auto_21271 ) ) ( not ( = ?auto_21269 ?auto_21272 ) ) ( not ( = ?auto_21269 ?auto_21273 ) ) ( not ( = ?auto_21269 ?auto_21274 ) ) ( not ( = ?auto_21270 ?auto_21271 ) ) ( not ( = ?auto_21270 ?auto_21272 ) ) ( not ( = ?auto_21270 ?auto_21273 ) ) ( not ( = ?auto_21270 ?auto_21274 ) ) ( not ( = ?auto_21271 ?auto_21272 ) ) ( not ( = ?auto_21271 ?auto_21273 ) ) ( not ( = ?auto_21271 ?auto_21274 ) ) ( not ( = ?auto_21272 ?auto_21273 ) ) ( not ( = ?auto_21272 ?auto_21274 ) ) ( not ( = ?auto_21273 ?auto_21274 ) ) ( ON ?auto_21272 ?auto_21273 ) ( CLEAR ?auto_21270 ) ( ON ?auto_21271 ?auto_21272 ) ( CLEAR ?auto_21271 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_21267 ?auto_21268 ?auto_21269 ?auto_21270 ?auto_21271 )
      ( MAKE-7PILE ?auto_21267 ?auto_21268 ?auto_21269 ?auto_21270 ?auto_21271 ?auto_21272 ?auto_21273 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_21282 - BLOCK
      ?auto_21283 - BLOCK
      ?auto_21284 - BLOCK
      ?auto_21285 - BLOCK
      ?auto_21286 - BLOCK
      ?auto_21287 - BLOCK
      ?auto_21288 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_21288 ) ( ON-TABLE ?auto_21282 ) ( ON ?auto_21283 ?auto_21282 ) ( ON ?auto_21284 ?auto_21283 ) ( ON ?auto_21285 ?auto_21284 ) ( not ( = ?auto_21282 ?auto_21283 ) ) ( not ( = ?auto_21282 ?auto_21284 ) ) ( not ( = ?auto_21282 ?auto_21285 ) ) ( not ( = ?auto_21282 ?auto_21286 ) ) ( not ( = ?auto_21282 ?auto_21287 ) ) ( not ( = ?auto_21282 ?auto_21288 ) ) ( not ( = ?auto_21283 ?auto_21284 ) ) ( not ( = ?auto_21283 ?auto_21285 ) ) ( not ( = ?auto_21283 ?auto_21286 ) ) ( not ( = ?auto_21283 ?auto_21287 ) ) ( not ( = ?auto_21283 ?auto_21288 ) ) ( not ( = ?auto_21284 ?auto_21285 ) ) ( not ( = ?auto_21284 ?auto_21286 ) ) ( not ( = ?auto_21284 ?auto_21287 ) ) ( not ( = ?auto_21284 ?auto_21288 ) ) ( not ( = ?auto_21285 ?auto_21286 ) ) ( not ( = ?auto_21285 ?auto_21287 ) ) ( not ( = ?auto_21285 ?auto_21288 ) ) ( not ( = ?auto_21286 ?auto_21287 ) ) ( not ( = ?auto_21286 ?auto_21288 ) ) ( not ( = ?auto_21287 ?auto_21288 ) ) ( ON ?auto_21287 ?auto_21288 ) ( CLEAR ?auto_21285 ) ( ON ?auto_21286 ?auto_21287 ) ( CLEAR ?auto_21286 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_21282 ?auto_21283 ?auto_21284 ?auto_21285 ?auto_21286 )
      ( MAKE-7PILE ?auto_21282 ?auto_21283 ?auto_21284 ?auto_21285 ?auto_21286 ?auto_21287 ?auto_21288 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_21296 - BLOCK
      ?auto_21297 - BLOCK
      ?auto_21298 - BLOCK
      ?auto_21299 - BLOCK
      ?auto_21300 - BLOCK
      ?auto_21301 - BLOCK
      ?auto_21302 - BLOCK
    )
    :vars
    (
      ?auto_21303 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21302 ?auto_21303 ) ( ON-TABLE ?auto_21296 ) ( ON ?auto_21297 ?auto_21296 ) ( ON ?auto_21298 ?auto_21297 ) ( not ( = ?auto_21296 ?auto_21297 ) ) ( not ( = ?auto_21296 ?auto_21298 ) ) ( not ( = ?auto_21296 ?auto_21299 ) ) ( not ( = ?auto_21296 ?auto_21300 ) ) ( not ( = ?auto_21296 ?auto_21301 ) ) ( not ( = ?auto_21296 ?auto_21302 ) ) ( not ( = ?auto_21296 ?auto_21303 ) ) ( not ( = ?auto_21297 ?auto_21298 ) ) ( not ( = ?auto_21297 ?auto_21299 ) ) ( not ( = ?auto_21297 ?auto_21300 ) ) ( not ( = ?auto_21297 ?auto_21301 ) ) ( not ( = ?auto_21297 ?auto_21302 ) ) ( not ( = ?auto_21297 ?auto_21303 ) ) ( not ( = ?auto_21298 ?auto_21299 ) ) ( not ( = ?auto_21298 ?auto_21300 ) ) ( not ( = ?auto_21298 ?auto_21301 ) ) ( not ( = ?auto_21298 ?auto_21302 ) ) ( not ( = ?auto_21298 ?auto_21303 ) ) ( not ( = ?auto_21299 ?auto_21300 ) ) ( not ( = ?auto_21299 ?auto_21301 ) ) ( not ( = ?auto_21299 ?auto_21302 ) ) ( not ( = ?auto_21299 ?auto_21303 ) ) ( not ( = ?auto_21300 ?auto_21301 ) ) ( not ( = ?auto_21300 ?auto_21302 ) ) ( not ( = ?auto_21300 ?auto_21303 ) ) ( not ( = ?auto_21301 ?auto_21302 ) ) ( not ( = ?auto_21301 ?auto_21303 ) ) ( not ( = ?auto_21302 ?auto_21303 ) ) ( ON ?auto_21301 ?auto_21302 ) ( ON ?auto_21300 ?auto_21301 ) ( CLEAR ?auto_21298 ) ( ON ?auto_21299 ?auto_21300 ) ( CLEAR ?auto_21299 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_21296 ?auto_21297 ?auto_21298 ?auto_21299 )
      ( MAKE-7PILE ?auto_21296 ?auto_21297 ?auto_21298 ?auto_21299 ?auto_21300 ?auto_21301 ?auto_21302 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_21311 - BLOCK
      ?auto_21312 - BLOCK
      ?auto_21313 - BLOCK
      ?auto_21314 - BLOCK
      ?auto_21315 - BLOCK
      ?auto_21316 - BLOCK
      ?auto_21317 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_21317 ) ( ON-TABLE ?auto_21311 ) ( ON ?auto_21312 ?auto_21311 ) ( ON ?auto_21313 ?auto_21312 ) ( not ( = ?auto_21311 ?auto_21312 ) ) ( not ( = ?auto_21311 ?auto_21313 ) ) ( not ( = ?auto_21311 ?auto_21314 ) ) ( not ( = ?auto_21311 ?auto_21315 ) ) ( not ( = ?auto_21311 ?auto_21316 ) ) ( not ( = ?auto_21311 ?auto_21317 ) ) ( not ( = ?auto_21312 ?auto_21313 ) ) ( not ( = ?auto_21312 ?auto_21314 ) ) ( not ( = ?auto_21312 ?auto_21315 ) ) ( not ( = ?auto_21312 ?auto_21316 ) ) ( not ( = ?auto_21312 ?auto_21317 ) ) ( not ( = ?auto_21313 ?auto_21314 ) ) ( not ( = ?auto_21313 ?auto_21315 ) ) ( not ( = ?auto_21313 ?auto_21316 ) ) ( not ( = ?auto_21313 ?auto_21317 ) ) ( not ( = ?auto_21314 ?auto_21315 ) ) ( not ( = ?auto_21314 ?auto_21316 ) ) ( not ( = ?auto_21314 ?auto_21317 ) ) ( not ( = ?auto_21315 ?auto_21316 ) ) ( not ( = ?auto_21315 ?auto_21317 ) ) ( not ( = ?auto_21316 ?auto_21317 ) ) ( ON ?auto_21316 ?auto_21317 ) ( ON ?auto_21315 ?auto_21316 ) ( CLEAR ?auto_21313 ) ( ON ?auto_21314 ?auto_21315 ) ( CLEAR ?auto_21314 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_21311 ?auto_21312 ?auto_21313 ?auto_21314 )
      ( MAKE-7PILE ?auto_21311 ?auto_21312 ?auto_21313 ?auto_21314 ?auto_21315 ?auto_21316 ?auto_21317 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_21325 - BLOCK
      ?auto_21326 - BLOCK
      ?auto_21327 - BLOCK
      ?auto_21328 - BLOCK
      ?auto_21329 - BLOCK
      ?auto_21330 - BLOCK
      ?auto_21331 - BLOCK
    )
    :vars
    (
      ?auto_21332 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21331 ?auto_21332 ) ( ON-TABLE ?auto_21325 ) ( ON ?auto_21326 ?auto_21325 ) ( not ( = ?auto_21325 ?auto_21326 ) ) ( not ( = ?auto_21325 ?auto_21327 ) ) ( not ( = ?auto_21325 ?auto_21328 ) ) ( not ( = ?auto_21325 ?auto_21329 ) ) ( not ( = ?auto_21325 ?auto_21330 ) ) ( not ( = ?auto_21325 ?auto_21331 ) ) ( not ( = ?auto_21325 ?auto_21332 ) ) ( not ( = ?auto_21326 ?auto_21327 ) ) ( not ( = ?auto_21326 ?auto_21328 ) ) ( not ( = ?auto_21326 ?auto_21329 ) ) ( not ( = ?auto_21326 ?auto_21330 ) ) ( not ( = ?auto_21326 ?auto_21331 ) ) ( not ( = ?auto_21326 ?auto_21332 ) ) ( not ( = ?auto_21327 ?auto_21328 ) ) ( not ( = ?auto_21327 ?auto_21329 ) ) ( not ( = ?auto_21327 ?auto_21330 ) ) ( not ( = ?auto_21327 ?auto_21331 ) ) ( not ( = ?auto_21327 ?auto_21332 ) ) ( not ( = ?auto_21328 ?auto_21329 ) ) ( not ( = ?auto_21328 ?auto_21330 ) ) ( not ( = ?auto_21328 ?auto_21331 ) ) ( not ( = ?auto_21328 ?auto_21332 ) ) ( not ( = ?auto_21329 ?auto_21330 ) ) ( not ( = ?auto_21329 ?auto_21331 ) ) ( not ( = ?auto_21329 ?auto_21332 ) ) ( not ( = ?auto_21330 ?auto_21331 ) ) ( not ( = ?auto_21330 ?auto_21332 ) ) ( not ( = ?auto_21331 ?auto_21332 ) ) ( ON ?auto_21330 ?auto_21331 ) ( ON ?auto_21329 ?auto_21330 ) ( ON ?auto_21328 ?auto_21329 ) ( CLEAR ?auto_21326 ) ( ON ?auto_21327 ?auto_21328 ) ( CLEAR ?auto_21327 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_21325 ?auto_21326 ?auto_21327 )
      ( MAKE-7PILE ?auto_21325 ?auto_21326 ?auto_21327 ?auto_21328 ?auto_21329 ?auto_21330 ?auto_21331 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_21340 - BLOCK
      ?auto_21341 - BLOCK
      ?auto_21342 - BLOCK
      ?auto_21343 - BLOCK
      ?auto_21344 - BLOCK
      ?auto_21345 - BLOCK
      ?auto_21346 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_21346 ) ( ON-TABLE ?auto_21340 ) ( ON ?auto_21341 ?auto_21340 ) ( not ( = ?auto_21340 ?auto_21341 ) ) ( not ( = ?auto_21340 ?auto_21342 ) ) ( not ( = ?auto_21340 ?auto_21343 ) ) ( not ( = ?auto_21340 ?auto_21344 ) ) ( not ( = ?auto_21340 ?auto_21345 ) ) ( not ( = ?auto_21340 ?auto_21346 ) ) ( not ( = ?auto_21341 ?auto_21342 ) ) ( not ( = ?auto_21341 ?auto_21343 ) ) ( not ( = ?auto_21341 ?auto_21344 ) ) ( not ( = ?auto_21341 ?auto_21345 ) ) ( not ( = ?auto_21341 ?auto_21346 ) ) ( not ( = ?auto_21342 ?auto_21343 ) ) ( not ( = ?auto_21342 ?auto_21344 ) ) ( not ( = ?auto_21342 ?auto_21345 ) ) ( not ( = ?auto_21342 ?auto_21346 ) ) ( not ( = ?auto_21343 ?auto_21344 ) ) ( not ( = ?auto_21343 ?auto_21345 ) ) ( not ( = ?auto_21343 ?auto_21346 ) ) ( not ( = ?auto_21344 ?auto_21345 ) ) ( not ( = ?auto_21344 ?auto_21346 ) ) ( not ( = ?auto_21345 ?auto_21346 ) ) ( ON ?auto_21345 ?auto_21346 ) ( ON ?auto_21344 ?auto_21345 ) ( ON ?auto_21343 ?auto_21344 ) ( CLEAR ?auto_21341 ) ( ON ?auto_21342 ?auto_21343 ) ( CLEAR ?auto_21342 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_21340 ?auto_21341 ?auto_21342 )
      ( MAKE-7PILE ?auto_21340 ?auto_21341 ?auto_21342 ?auto_21343 ?auto_21344 ?auto_21345 ?auto_21346 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_21354 - BLOCK
      ?auto_21355 - BLOCK
      ?auto_21356 - BLOCK
      ?auto_21357 - BLOCK
      ?auto_21358 - BLOCK
      ?auto_21359 - BLOCK
      ?auto_21360 - BLOCK
    )
    :vars
    (
      ?auto_21361 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21360 ?auto_21361 ) ( ON-TABLE ?auto_21354 ) ( not ( = ?auto_21354 ?auto_21355 ) ) ( not ( = ?auto_21354 ?auto_21356 ) ) ( not ( = ?auto_21354 ?auto_21357 ) ) ( not ( = ?auto_21354 ?auto_21358 ) ) ( not ( = ?auto_21354 ?auto_21359 ) ) ( not ( = ?auto_21354 ?auto_21360 ) ) ( not ( = ?auto_21354 ?auto_21361 ) ) ( not ( = ?auto_21355 ?auto_21356 ) ) ( not ( = ?auto_21355 ?auto_21357 ) ) ( not ( = ?auto_21355 ?auto_21358 ) ) ( not ( = ?auto_21355 ?auto_21359 ) ) ( not ( = ?auto_21355 ?auto_21360 ) ) ( not ( = ?auto_21355 ?auto_21361 ) ) ( not ( = ?auto_21356 ?auto_21357 ) ) ( not ( = ?auto_21356 ?auto_21358 ) ) ( not ( = ?auto_21356 ?auto_21359 ) ) ( not ( = ?auto_21356 ?auto_21360 ) ) ( not ( = ?auto_21356 ?auto_21361 ) ) ( not ( = ?auto_21357 ?auto_21358 ) ) ( not ( = ?auto_21357 ?auto_21359 ) ) ( not ( = ?auto_21357 ?auto_21360 ) ) ( not ( = ?auto_21357 ?auto_21361 ) ) ( not ( = ?auto_21358 ?auto_21359 ) ) ( not ( = ?auto_21358 ?auto_21360 ) ) ( not ( = ?auto_21358 ?auto_21361 ) ) ( not ( = ?auto_21359 ?auto_21360 ) ) ( not ( = ?auto_21359 ?auto_21361 ) ) ( not ( = ?auto_21360 ?auto_21361 ) ) ( ON ?auto_21359 ?auto_21360 ) ( ON ?auto_21358 ?auto_21359 ) ( ON ?auto_21357 ?auto_21358 ) ( ON ?auto_21356 ?auto_21357 ) ( CLEAR ?auto_21354 ) ( ON ?auto_21355 ?auto_21356 ) ( CLEAR ?auto_21355 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_21354 ?auto_21355 )
      ( MAKE-7PILE ?auto_21354 ?auto_21355 ?auto_21356 ?auto_21357 ?auto_21358 ?auto_21359 ?auto_21360 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_21369 - BLOCK
      ?auto_21370 - BLOCK
      ?auto_21371 - BLOCK
      ?auto_21372 - BLOCK
      ?auto_21373 - BLOCK
      ?auto_21374 - BLOCK
      ?auto_21375 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_21375 ) ( ON-TABLE ?auto_21369 ) ( not ( = ?auto_21369 ?auto_21370 ) ) ( not ( = ?auto_21369 ?auto_21371 ) ) ( not ( = ?auto_21369 ?auto_21372 ) ) ( not ( = ?auto_21369 ?auto_21373 ) ) ( not ( = ?auto_21369 ?auto_21374 ) ) ( not ( = ?auto_21369 ?auto_21375 ) ) ( not ( = ?auto_21370 ?auto_21371 ) ) ( not ( = ?auto_21370 ?auto_21372 ) ) ( not ( = ?auto_21370 ?auto_21373 ) ) ( not ( = ?auto_21370 ?auto_21374 ) ) ( not ( = ?auto_21370 ?auto_21375 ) ) ( not ( = ?auto_21371 ?auto_21372 ) ) ( not ( = ?auto_21371 ?auto_21373 ) ) ( not ( = ?auto_21371 ?auto_21374 ) ) ( not ( = ?auto_21371 ?auto_21375 ) ) ( not ( = ?auto_21372 ?auto_21373 ) ) ( not ( = ?auto_21372 ?auto_21374 ) ) ( not ( = ?auto_21372 ?auto_21375 ) ) ( not ( = ?auto_21373 ?auto_21374 ) ) ( not ( = ?auto_21373 ?auto_21375 ) ) ( not ( = ?auto_21374 ?auto_21375 ) ) ( ON ?auto_21374 ?auto_21375 ) ( ON ?auto_21373 ?auto_21374 ) ( ON ?auto_21372 ?auto_21373 ) ( ON ?auto_21371 ?auto_21372 ) ( CLEAR ?auto_21369 ) ( ON ?auto_21370 ?auto_21371 ) ( CLEAR ?auto_21370 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_21369 ?auto_21370 )
      ( MAKE-7PILE ?auto_21369 ?auto_21370 ?auto_21371 ?auto_21372 ?auto_21373 ?auto_21374 ?auto_21375 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_21383 - BLOCK
      ?auto_21384 - BLOCK
      ?auto_21385 - BLOCK
      ?auto_21386 - BLOCK
      ?auto_21387 - BLOCK
      ?auto_21388 - BLOCK
      ?auto_21389 - BLOCK
    )
    :vars
    (
      ?auto_21390 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21389 ?auto_21390 ) ( not ( = ?auto_21383 ?auto_21384 ) ) ( not ( = ?auto_21383 ?auto_21385 ) ) ( not ( = ?auto_21383 ?auto_21386 ) ) ( not ( = ?auto_21383 ?auto_21387 ) ) ( not ( = ?auto_21383 ?auto_21388 ) ) ( not ( = ?auto_21383 ?auto_21389 ) ) ( not ( = ?auto_21383 ?auto_21390 ) ) ( not ( = ?auto_21384 ?auto_21385 ) ) ( not ( = ?auto_21384 ?auto_21386 ) ) ( not ( = ?auto_21384 ?auto_21387 ) ) ( not ( = ?auto_21384 ?auto_21388 ) ) ( not ( = ?auto_21384 ?auto_21389 ) ) ( not ( = ?auto_21384 ?auto_21390 ) ) ( not ( = ?auto_21385 ?auto_21386 ) ) ( not ( = ?auto_21385 ?auto_21387 ) ) ( not ( = ?auto_21385 ?auto_21388 ) ) ( not ( = ?auto_21385 ?auto_21389 ) ) ( not ( = ?auto_21385 ?auto_21390 ) ) ( not ( = ?auto_21386 ?auto_21387 ) ) ( not ( = ?auto_21386 ?auto_21388 ) ) ( not ( = ?auto_21386 ?auto_21389 ) ) ( not ( = ?auto_21386 ?auto_21390 ) ) ( not ( = ?auto_21387 ?auto_21388 ) ) ( not ( = ?auto_21387 ?auto_21389 ) ) ( not ( = ?auto_21387 ?auto_21390 ) ) ( not ( = ?auto_21388 ?auto_21389 ) ) ( not ( = ?auto_21388 ?auto_21390 ) ) ( not ( = ?auto_21389 ?auto_21390 ) ) ( ON ?auto_21388 ?auto_21389 ) ( ON ?auto_21387 ?auto_21388 ) ( ON ?auto_21386 ?auto_21387 ) ( ON ?auto_21385 ?auto_21386 ) ( ON ?auto_21384 ?auto_21385 ) ( ON ?auto_21383 ?auto_21384 ) ( CLEAR ?auto_21383 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_21383 )
      ( MAKE-7PILE ?auto_21383 ?auto_21384 ?auto_21385 ?auto_21386 ?auto_21387 ?auto_21388 ?auto_21389 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_21398 - BLOCK
      ?auto_21399 - BLOCK
      ?auto_21400 - BLOCK
      ?auto_21401 - BLOCK
      ?auto_21402 - BLOCK
      ?auto_21403 - BLOCK
      ?auto_21404 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_21404 ) ( not ( = ?auto_21398 ?auto_21399 ) ) ( not ( = ?auto_21398 ?auto_21400 ) ) ( not ( = ?auto_21398 ?auto_21401 ) ) ( not ( = ?auto_21398 ?auto_21402 ) ) ( not ( = ?auto_21398 ?auto_21403 ) ) ( not ( = ?auto_21398 ?auto_21404 ) ) ( not ( = ?auto_21399 ?auto_21400 ) ) ( not ( = ?auto_21399 ?auto_21401 ) ) ( not ( = ?auto_21399 ?auto_21402 ) ) ( not ( = ?auto_21399 ?auto_21403 ) ) ( not ( = ?auto_21399 ?auto_21404 ) ) ( not ( = ?auto_21400 ?auto_21401 ) ) ( not ( = ?auto_21400 ?auto_21402 ) ) ( not ( = ?auto_21400 ?auto_21403 ) ) ( not ( = ?auto_21400 ?auto_21404 ) ) ( not ( = ?auto_21401 ?auto_21402 ) ) ( not ( = ?auto_21401 ?auto_21403 ) ) ( not ( = ?auto_21401 ?auto_21404 ) ) ( not ( = ?auto_21402 ?auto_21403 ) ) ( not ( = ?auto_21402 ?auto_21404 ) ) ( not ( = ?auto_21403 ?auto_21404 ) ) ( ON ?auto_21403 ?auto_21404 ) ( ON ?auto_21402 ?auto_21403 ) ( ON ?auto_21401 ?auto_21402 ) ( ON ?auto_21400 ?auto_21401 ) ( ON ?auto_21399 ?auto_21400 ) ( ON ?auto_21398 ?auto_21399 ) ( CLEAR ?auto_21398 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_21398 )
      ( MAKE-7PILE ?auto_21398 ?auto_21399 ?auto_21400 ?auto_21401 ?auto_21402 ?auto_21403 ?auto_21404 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_21412 - BLOCK
      ?auto_21413 - BLOCK
      ?auto_21414 - BLOCK
      ?auto_21415 - BLOCK
      ?auto_21416 - BLOCK
      ?auto_21417 - BLOCK
      ?auto_21418 - BLOCK
    )
    :vars
    (
      ?auto_21419 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21412 ?auto_21413 ) ) ( not ( = ?auto_21412 ?auto_21414 ) ) ( not ( = ?auto_21412 ?auto_21415 ) ) ( not ( = ?auto_21412 ?auto_21416 ) ) ( not ( = ?auto_21412 ?auto_21417 ) ) ( not ( = ?auto_21412 ?auto_21418 ) ) ( not ( = ?auto_21413 ?auto_21414 ) ) ( not ( = ?auto_21413 ?auto_21415 ) ) ( not ( = ?auto_21413 ?auto_21416 ) ) ( not ( = ?auto_21413 ?auto_21417 ) ) ( not ( = ?auto_21413 ?auto_21418 ) ) ( not ( = ?auto_21414 ?auto_21415 ) ) ( not ( = ?auto_21414 ?auto_21416 ) ) ( not ( = ?auto_21414 ?auto_21417 ) ) ( not ( = ?auto_21414 ?auto_21418 ) ) ( not ( = ?auto_21415 ?auto_21416 ) ) ( not ( = ?auto_21415 ?auto_21417 ) ) ( not ( = ?auto_21415 ?auto_21418 ) ) ( not ( = ?auto_21416 ?auto_21417 ) ) ( not ( = ?auto_21416 ?auto_21418 ) ) ( not ( = ?auto_21417 ?auto_21418 ) ) ( ON ?auto_21412 ?auto_21419 ) ( not ( = ?auto_21418 ?auto_21419 ) ) ( not ( = ?auto_21417 ?auto_21419 ) ) ( not ( = ?auto_21416 ?auto_21419 ) ) ( not ( = ?auto_21415 ?auto_21419 ) ) ( not ( = ?auto_21414 ?auto_21419 ) ) ( not ( = ?auto_21413 ?auto_21419 ) ) ( not ( = ?auto_21412 ?auto_21419 ) ) ( ON ?auto_21413 ?auto_21412 ) ( ON ?auto_21414 ?auto_21413 ) ( ON ?auto_21415 ?auto_21414 ) ( ON ?auto_21416 ?auto_21415 ) ( ON ?auto_21417 ?auto_21416 ) ( ON ?auto_21418 ?auto_21417 ) ( CLEAR ?auto_21418 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_21418 ?auto_21417 ?auto_21416 ?auto_21415 ?auto_21414 ?auto_21413 ?auto_21412 )
      ( MAKE-7PILE ?auto_21412 ?auto_21413 ?auto_21414 ?auto_21415 ?auto_21416 ?auto_21417 ?auto_21418 ) )
  )

)

