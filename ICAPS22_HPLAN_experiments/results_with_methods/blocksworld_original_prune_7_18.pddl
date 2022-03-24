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

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_111843 - BLOCK
      ?auto_111844 - BLOCK
      ?auto_111845 - BLOCK
      ?auto_111846 - BLOCK
      ?auto_111847 - BLOCK
      ?auto_111848 - BLOCK
      ?auto_111849 - BLOCK
    )
    :vars
    (
      ?auto_111850 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111850 ?auto_111849 ) ( CLEAR ?auto_111850 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_111843 ) ( ON ?auto_111844 ?auto_111843 ) ( ON ?auto_111845 ?auto_111844 ) ( ON ?auto_111846 ?auto_111845 ) ( ON ?auto_111847 ?auto_111846 ) ( ON ?auto_111848 ?auto_111847 ) ( ON ?auto_111849 ?auto_111848 ) ( not ( = ?auto_111843 ?auto_111844 ) ) ( not ( = ?auto_111843 ?auto_111845 ) ) ( not ( = ?auto_111843 ?auto_111846 ) ) ( not ( = ?auto_111843 ?auto_111847 ) ) ( not ( = ?auto_111843 ?auto_111848 ) ) ( not ( = ?auto_111843 ?auto_111849 ) ) ( not ( = ?auto_111843 ?auto_111850 ) ) ( not ( = ?auto_111844 ?auto_111845 ) ) ( not ( = ?auto_111844 ?auto_111846 ) ) ( not ( = ?auto_111844 ?auto_111847 ) ) ( not ( = ?auto_111844 ?auto_111848 ) ) ( not ( = ?auto_111844 ?auto_111849 ) ) ( not ( = ?auto_111844 ?auto_111850 ) ) ( not ( = ?auto_111845 ?auto_111846 ) ) ( not ( = ?auto_111845 ?auto_111847 ) ) ( not ( = ?auto_111845 ?auto_111848 ) ) ( not ( = ?auto_111845 ?auto_111849 ) ) ( not ( = ?auto_111845 ?auto_111850 ) ) ( not ( = ?auto_111846 ?auto_111847 ) ) ( not ( = ?auto_111846 ?auto_111848 ) ) ( not ( = ?auto_111846 ?auto_111849 ) ) ( not ( = ?auto_111846 ?auto_111850 ) ) ( not ( = ?auto_111847 ?auto_111848 ) ) ( not ( = ?auto_111847 ?auto_111849 ) ) ( not ( = ?auto_111847 ?auto_111850 ) ) ( not ( = ?auto_111848 ?auto_111849 ) ) ( not ( = ?auto_111848 ?auto_111850 ) ) ( not ( = ?auto_111849 ?auto_111850 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_111850 ?auto_111849 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_111852 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_111852 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_111852 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_111853 - BLOCK
    )
    :vars
    (
      ?auto_111854 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111853 ?auto_111854 ) ( CLEAR ?auto_111853 ) ( HAND-EMPTY ) ( not ( = ?auto_111853 ?auto_111854 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_111853 ?auto_111854 )
      ( MAKE-1PILE ?auto_111853 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_111861 - BLOCK
      ?auto_111862 - BLOCK
      ?auto_111863 - BLOCK
      ?auto_111864 - BLOCK
      ?auto_111865 - BLOCK
      ?auto_111866 - BLOCK
    )
    :vars
    (
      ?auto_111867 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111867 ?auto_111866 ) ( CLEAR ?auto_111867 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_111861 ) ( ON ?auto_111862 ?auto_111861 ) ( ON ?auto_111863 ?auto_111862 ) ( ON ?auto_111864 ?auto_111863 ) ( ON ?auto_111865 ?auto_111864 ) ( ON ?auto_111866 ?auto_111865 ) ( not ( = ?auto_111861 ?auto_111862 ) ) ( not ( = ?auto_111861 ?auto_111863 ) ) ( not ( = ?auto_111861 ?auto_111864 ) ) ( not ( = ?auto_111861 ?auto_111865 ) ) ( not ( = ?auto_111861 ?auto_111866 ) ) ( not ( = ?auto_111861 ?auto_111867 ) ) ( not ( = ?auto_111862 ?auto_111863 ) ) ( not ( = ?auto_111862 ?auto_111864 ) ) ( not ( = ?auto_111862 ?auto_111865 ) ) ( not ( = ?auto_111862 ?auto_111866 ) ) ( not ( = ?auto_111862 ?auto_111867 ) ) ( not ( = ?auto_111863 ?auto_111864 ) ) ( not ( = ?auto_111863 ?auto_111865 ) ) ( not ( = ?auto_111863 ?auto_111866 ) ) ( not ( = ?auto_111863 ?auto_111867 ) ) ( not ( = ?auto_111864 ?auto_111865 ) ) ( not ( = ?auto_111864 ?auto_111866 ) ) ( not ( = ?auto_111864 ?auto_111867 ) ) ( not ( = ?auto_111865 ?auto_111866 ) ) ( not ( = ?auto_111865 ?auto_111867 ) ) ( not ( = ?auto_111866 ?auto_111867 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_111867 ?auto_111866 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_111868 - BLOCK
      ?auto_111869 - BLOCK
      ?auto_111870 - BLOCK
      ?auto_111871 - BLOCK
      ?auto_111872 - BLOCK
      ?auto_111873 - BLOCK
    )
    :vars
    (
      ?auto_111874 - BLOCK
      ?auto_111875 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111874 ?auto_111873 ) ( CLEAR ?auto_111874 ) ( ON-TABLE ?auto_111868 ) ( ON ?auto_111869 ?auto_111868 ) ( ON ?auto_111870 ?auto_111869 ) ( ON ?auto_111871 ?auto_111870 ) ( ON ?auto_111872 ?auto_111871 ) ( ON ?auto_111873 ?auto_111872 ) ( not ( = ?auto_111868 ?auto_111869 ) ) ( not ( = ?auto_111868 ?auto_111870 ) ) ( not ( = ?auto_111868 ?auto_111871 ) ) ( not ( = ?auto_111868 ?auto_111872 ) ) ( not ( = ?auto_111868 ?auto_111873 ) ) ( not ( = ?auto_111868 ?auto_111874 ) ) ( not ( = ?auto_111869 ?auto_111870 ) ) ( not ( = ?auto_111869 ?auto_111871 ) ) ( not ( = ?auto_111869 ?auto_111872 ) ) ( not ( = ?auto_111869 ?auto_111873 ) ) ( not ( = ?auto_111869 ?auto_111874 ) ) ( not ( = ?auto_111870 ?auto_111871 ) ) ( not ( = ?auto_111870 ?auto_111872 ) ) ( not ( = ?auto_111870 ?auto_111873 ) ) ( not ( = ?auto_111870 ?auto_111874 ) ) ( not ( = ?auto_111871 ?auto_111872 ) ) ( not ( = ?auto_111871 ?auto_111873 ) ) ( not ( = ?auto_111871 ?auto_111874 ) ) ( not ( = ?auto_111872 ?auto_111873 ) ) ( not ( = ?auto_111872 ?auto_111874 ) ) ( not ( = ?auto_111873 ?auto_111874 ) ) ( HOLDING ?auto_111875 ) ( not ( = ?auto_111868 ?auto_111875 ) ) ( not ( = ?auto_111869 ?auto_111875 ) ) ( not ( = ?auto_111870 ?auto_111875 ) ) ( not ( = ?auto_111871 ?auto_111875 ) ) ( not ( = ?auto_111872 ?auto_111875 ) ) ( not ( = ?auto_111873 ?auto_111875 ) ) ( not ( = ?auto_111874 ?auto_111875 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_111875 )
      ( MAKE-6PILE ?auto_111868 ?auto_111869 ?auto_111870 ?auto_111871 ?auto_111872 ?auto_111873 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_111876 - BLOCK
      ?auto_111877 - BLOCK
      ?auto_111878 - BLOCK
      ?auto_111879 - BLOCK
      ?auto_111880 - BLOCK
      ?auto_111881 - BLOCK
    )
    :vars
    (
      ?auto_111882 - BLOCK
      ?auto_111883 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111882 ?auto_111881 ) ( ON-TABLE ?auto_111876 ) ( ON ?auto_111877 ?auto_111876 ) ( ON ?auto_111878 ?auto_111877 ) ( ON ?auto_111879 ?auto_111878 ) ( ON ?auto_111880 ?auto_111879 ) ( ON ?auto_111881 ?auto_111880 ) ( not ( = ?auto_111876 ?auto_111877 ) ) ( not ( = ?auto_111876 ?auto_111878 ) ) ( not ( = ?auto_111876 ?auto_111879 ) ) ( not ( = ?auto_111876 ?auto_111880 ) ) ( not ( = ?auto_111876 ?auto_111881 ) ) ( not ( = ?auto_111876 ?auto_111882 ) ) ( not ( = ?auto_111877 ?auto_111878 ) ) ( not ( = ?auto_111877 ?auto_111879 ) ) ( not ( = ?auto_111877 ?auto_111880 ) ) ( not ( = ?auto_111877 ?auto_111881 ) ) ( not ( = ?auto_111877 ?auto_111882 ) ) ( not ( = ?auto_111878 ?auto_111879 ) ) ( not ( = ?auto_111878 ?auto_111880 ) ) ( not ( = ?auto_111878 ?auto_111881 ) ) ( not ( = ?auto_111878 ?auto_111882 ) ) ( not ( = ?auto_111879 ?auto_111880 ) ) ( not ( = ?auto_111879 ?auto_111881 ) ) ( not ( = ?auto_111879 ?auto_111882 ) ) ( not ( = ?auto_111880 ?auto_111881 ) ) ( not ( = ?auto_111880 ?auto_111882 ) ) ( not ( = ?auto_111881 ?auto_111882 ) ) ( not ( = ?auto_111876 ?auto_111883 ) ) ( not ( = ?auto_111877 ?auto_111883 ) ) ( not ( = ?auto_111878 ?auto_111883 ) ) ( not ( = ?auto_111879 ?auto_111883 ) ) ( not ( = ?auto_111880 ?auto_111883 ) ) ( not ( = ?auto_111881 ?auto_111883 ) ) ( not ( = ?auto_111882 ?auto_111883 ) ) ( ON ?auto_111883 ?auto_111882 ) ( CLEAR ?auto_111883 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_111876 ?auto_111877 ?auto_111878 ?auto_111879 ?auto_111880 ?auto_111881 ?auto_111882 )
      ( MAKE-6PILE ?auto_111876 ?auto_111877 ?auto_111878 ?auto_111879 ?auto_111880 ?auto_111881 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_111886 - BLOCK
      ?auto_111887 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_111887 ) ( CLEAR ?auto_111886 ) ( ON-TABLE ?auto_111886 ) ( not ( = ?auto_111886 ?auto_111887 ) ) )
    :subtasks
    ( ( !STACK ?auto_111887 ?auto_111886 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_111888 - BLOCK
      ?auto_111889 - BLOCK
    )
    :vars
    (
      ?auto_111890 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_111888 ) ( ON-TABLE ?auto_111888 ) ( not ( = ?auto_111888 ?auto_111889 ) ) ( ON ?auto_111889 ?auto_111890 ) ( CLEAR ?auto_111889 ) ( HAND-EMPTY ) ( not ( = ?auto_111888 ?auto_111890 ) ) ( not ( = ?auto_111889 ?auto_111890 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_111889 ?auto_111890 )
      ( MAKE-2PILE ?auto_111888 ?auto_111889 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_111891 - BLOCK
      ?auto_111892 - BLOCK
    )
    :vars
    (
      ?auto_111893 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111891 ?auto_111892 ) ) ( ON ?auto_111892 ?auto_111893 ) ( CLEAR ?auto_111892 ) ( not ( = ?auto_111891 ?auto_111893 ) ) ( not ( = ?auto_111892 ?auto_111893 ) ) ( HOLDING ?auto_111891 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_111891 )
      ( MAKE-2PILE ?auto_111891 ?auto_111892 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_111894 - BLOCK
      ?auto_111895 - BLOCK
    )
    :vars
    (
      ?auto_111896 - BLOCK
      ?auto_111900 - BLOCK
      ?auto_111901 - BLOCK
      ?auto_111898 - BLOCK
      ?auto_111897 - BLOCK
      ?auto_111899 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111894 ?auto_111895 ) ) ( ON ?auto_111895 ?auto_111896 ) ( not ( = ?auto_111894 ?auto_111896 ) ) ( not ( = ?auto_111895 ?auto_111896 ) ) ( ON ?auto_111894 ?auto_111895 ) ( CLEAR ?auto_111894 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_111900 ) ( ON ?auto_111901 ?auto_111900 ) ( ON ?auto_111898 ?auto_111901 ) ( ON ?auto_111897 ?auto_111898 ) ( ON ?auto_111899 ?auto_111897 ) ( ON ?auto_111896 ?auto_111899 ) ( not ( = ?auto_111900 ?auto_111901 ) ) ( not ( = ?auto_111900 ?auto_111898 ) ) ( not ( = ?auto_111900 ?auto_111897 ) ) ( not ( = ?auto_111900 ?auto_111899 ) ) ( not ( = ?auto_111900 ?auto_111896 ) ) ( not ( = ?auto_111900 ?auto_111895 ) ) ( not ( = ?auto_111900 ?auto_111894 ) ) ( not ( = ?auto_111901 ?auto_111898 ) ) ( not ( = ?auto_111901 ?auto_111897 ) ) ( not ( = ?auto_111901 ?auto_111899 ) ) ( not ( = ?auto_111901 ?auto_111896 ) ) ( not ( = ?auto_111901 ?auto_111895 ) ) ( not ( = ?auto_111901 ?auto_111894 ) ) ( not ( = ?auto_111898 ?auto_111897 ) ) ( not ( = ?auto_111898 ?auto_111899 ) ) ( not ( = ?auto_111898 ?auto_111896 ) ) ( not ( = ?auto_111898 ?auto_111895 ) ) ( not ( = ?auto_111898 ?auto_111894 ) ) ( not ( = ?auto_111897 ?auto_111899 ) ) ( not ( = ?auto_111897 ?auto_111896 ) ) ( not ( = ?auto_111897 ?auto_111895 ) ) ( not ( = ?auto_111897 ?auto_111894 ) ) ( not ( = ?auto_111899 ?auto_111896 ) ) ( not ( = ?auto_111899 ?auto_111895 ) ) ( not ( = ?auto_111899 ?auto_111894 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_111900 ?auto_111901 ?auto_111898 ?auto_111897 ?auto_111899 ?auto_111896 ?auto_111895 )
      ( MAKE-2PILE ?auto_111894 ?auto_111895 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_111907 - BLOCK
      ?auto_111908 - BLOCK
      ?auto_111909 - BLOCK
      ?auto_111910 - BLOCK
      ?auto_111911 - BLOCK
    )
    :vars
    (
      ?auto_111912 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111912 ?auto_111911 ) ( CLEAR ?auto_111912 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_111907 ) ( ON ?auto_111908 ?auto_111907 ) ( ON ?auto_111909 ?auto_111908 ) ( ON ?auto_111910 ?auto_111909 ) ( ON ?auto_111911 ?auto_111910 ) ( not ( = ?auto_111907 ?auto_111908 ) ) ( not ( = ?auto_111907 ?auto_111909 ) ) ( not ( = ?auto_111907 ?auto_111910 ) ) ( not ( = ?auto_111907 ?auto_111911 ) ) ( not ( = ?auto_111907 ?auto_111912 ) ) ( not ( = ?auto_111908 ?auto_111909 ) ) ( not ( = ?auto_111908 ?auto_111910 ) ) ( not ( = ?auto_111908 ?auto_111911 ) ) ( not ( = ?auto_111908 ?auto_111912 ) ) ( not ( = ?auto_111909 ?auto_111910 ) ) ( not ( = ?auto_111909 ?auto_111911 ) ) ( not ( = ?auto_111909 ?auto_111912 ) ) ( not ( = ?auto_111910 ?auto_111911 ) ) ( not ( = ?auto_111910 ?auto_111912 ) ) ( not ( = ?auto_111911 ?auto_111912 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_111912 ?auto_111911 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_111913 - BLOCK
      ?auto_111914 - BLOCK
      ?auto_111915 - BLOCK
      ?auto_111916 - BLOCK
      ?auto_111917 - BLOCK
    )
    :vars
    (
      ?auto_111918 - BLOCK
      ?auto_111919 - BLOCK
      ?auto_111920 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111918 ?auto_111917 ) ( CLEAR ?auto_111918 ) ( ON-TABLE ?auto_111913 ) ( ON ?auto_111914 ?auto_111913 ) ( ON ?auto_111915 ?auto_111914 ) ( ON ?auto_111916 ?auto_111915 ) ( ON ?auto_111917 ?auto_111916 ) ( not ( = ?auto_111913 ?auto_111914 ) ) ( not ( = ?auto_111913 ?auto_111915 ) ) ( not ( = ?auto_111913 ?auto_111916 ) ) ( not ( = ?auto_111913 ?auto_111917 ) ) ( not ( = ?auto_111913 ?auto_111918 ) ) ( not ( = ?auto_111914 ?auto_111915 ) ) ( not ( = ?auto_111914 ?auto_111916 ) ) ( not ( = ?auto_111914 ?auto_111917 ) ) ( not ( = ?auto_111914 ?auto_111918 ) ) ( not ( = ?auto_111915 ?auto_111916 ) ) ( not ( = ?auto_111915 ?auto_111917 ) ) ( not ( = ?auto_111915 ?auto_111918 ) ) ( not ( = ?auto_111916 ?auto_111917 ) ) ( not ( = ?auto_111916 ?auto_111918 ) ) ( not ( = ?auto_111917 ?auto_111918 ) ) ( HOLDING ?auto_111919 ) ( CLEAR ?auto_111920 ) ( not ( = ?auto_111913 ?auto_111919 ) ) ( not ( = ?auto_111913 ?auto_111920 ) ) ( not ( = ?auto_111914 ?auto_111919 ) ) ( not ( = ?auto_111914 ?auto_111920 ) ) ( not ( = ?auto_111915 ?auto_111919 ) ) ( not ( = ?auto_111915 ?auto_111920 ) ) ( not ( = ?auto_111916 ?auto_111919 ) ) ( not ( = ?auto_111916 ?auto_111920 ) ) ( not ( = ?auto_111917 ?auto_111919 ) ) ( not ( = ?auto_111917 ?auto_111920 ) ) ( not ( = ?auto_111918 ?auto_111919 ) ) ( not ( = ?auto_111918 ?auto_111920 ) ) ( not ( = ?auto_111919 ?auto_111920 ) ) )
    :subtasks
    ( ( !STACK ?auto_111919 ?auto_111920 )
      ( MAKE-5PILE ?auto_111913 ?auto_111914 ?auto_111915 ?auto_111916 ?auto_111917 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_112839 - BLOCK
      ?auto_112840 - BLOCK
      ?auto_112841 - BLOCK
      ?auto_112842 - BLOCK
      ?auto_112843 - BLOCK
    )
    :vars
    (
      ?auto_112844 - BLOCK
      ?auto_112845 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112844 ?auto_112843 ) ( ON-TABLE ?auto_112839 ) ( ON ?auto_112840 ?auto_112839 ) ( ON ?auto_112841 ?auto_112840 ) ( ON ?auto_112842 ?auto_112841 ) ( ON ?auto_112843 ?auto_112842 ) ( not ( = ?auto_112839 ?auto_112840 ) ) ( not ( = ?auto_112839 ?auto_112841 ) ) ( not ( = ?auto_112839 ?auto_112842 ) ) ( not ( = ?auto_112839 ?auto_112843 ) ) ( not ( = ?auto_112839 ?auto_112844 ) ) ( not ( = ?auto_112840 ?auto_112841 ) ) ( not ( = ?auto_112840 ?auto_112842 ) ) ( not ( = ?auto_112840 ?auto_112843 ) ) ( not ( = ?auto_112840 ?auto_112844 ) ) ( not ( = ?auto_112841 ?auto_112842 ) ) ( not ( = ?auto_112841 ?auto_112843 ) ) ( not ( = ?auto_112841 ?auto_112844 ) ) ( not ( = ?auto_112842 ?auto_112843 ) ) ( not ( = ?auto_112842 ?auto_112844 ) ) ( not ( = ?auto_112843 ?auto_112844 ) ) ( not ( = ?auto_112839 ?auto_112845 ) ) ( not ( = ?auto_112840 ?auto_112845 ) ) ( not ( = ?auto_112841 ?auto_112845 ) ) ( not ( = ?auto_112842 ?auto_112845 ) ) ( not ( = ?auto_112843 ?auto_112845 ) ) ( not ( = ?auto_112844 ?auto_112845 ) ) ( ON ?auto_112845 ?auto_112844 ) ( CLEAR ?auto_112845 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_112839 ?auto_112840 ?auto_112841 ?auto_112842 ?auto_112843 ?auto_112844 )
      ( MAKE-5PILE ?auto_112839 ?auto_112840 ?auto_112841 ?auto_112842 ?auto_112843 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_111929 - BLOCK
      ?auto_111930 - BLOCK
      ?auto_111931 - BLOCK
      ?auto_111932 - BLOCK
      ?auto_111933 - BLOCK
    )
    :vars
    (
      ?auto_111935 - BLOCK
      ?auto_111934 - BLOCK
      ?auto_111936 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111935 ?auto_111933 ) ( ON-TABLE ?auto_111929 ) ( ON ?auto_111930 ?auto_111929 ) ( ON ?auto_111931 ?auto_111930 ) ( ON ?auto_111932 ?auto_111931 ) ( ON ?auto_111933 ?auto_111932 ) ( not ( = ?auto_111929 ?auto_111930 ) ) ( not ( = ?auto_111929 ?auto_111931 ) ) ( not ( = ?auto_111929 ?auto_111932 ) ) ( not ( = ?auto_111929 ?auto_111933 ) ) ( not ( = ?auto_111929 ?auto_111935 ) ) ( not ( = ?auto_111930 ?auto_111931 ) ) ( not ( = ?auto_111930 ?auto_111932 ) ) ( not ( = ?auto_111930 ?auto_111933 ) ) ( not ( = ?auto_111930 ?auto_111935 ) ) ( not ( = ?auto_111931 ?auto_111932 ) ) ( not ( = ?auto_111931 ?auto_111933 ) ) ( not ( = ?auto_111931 ?auto_111935 ) ) ( not ( = ?auto_111932 ?auto_111933 ) ) ( not ( = ?auto_111932 ?auto_111935 ) ) ( not ( = ?auto_111933 ?auto_111935 ) ) ( not ( = ?auto_111929 ?auto_111934 ) ) ( not ( = ?auto_111929 ?auto_111936 ) ) ( not ( = ?auto_111930 ?auto_111934 ) ) ( not ( = ?auto_111930 ?auto_111936 ) ) ( not ( = ?auto_111931 ?auto_111934 ) ) ( not ( = ?auto_111931 ?auto_111936 ) ) ( not ( = ?auto_111932 ?auto_111934 ) ) ( not ( = ?auto_111932 ?auto_111936 ) ) ( not ( = ?auto_111933 ?auto_111934 ) ) ( not ( = ?auto_111933 ?auto_111936 ) ) ( not ( = ?auto_111935 ?auto_111934 ) ) ( not ( = ?auto_111935 ?auto_111936 ) ) ( not ( = ?auto_111934 ?auto_111936 ) ) ( ON ?auto_111934 ?auto_111935 ) ( CLEAR ?auto_111934 ) ( HOLDING ?auto_111936 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_111936 )
      ( MAKE-5PILE ?auto_111929 ?auto_111930 ?auto_111931 ?auto_111932 ?auto_111933 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_111937 - BLOCK
      ?auto_111938 - BLOCK
      ?auto_111939 - BLOCK
      ?auto_111940 - BLOCK
      ?auto_111941 - BLOCK
    )
    :vars
    (
      ?auto_111943 - BLOCK
      ?auto_111944 - BLOCK
      ?auto_111942 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111943 ?auto_111941 ) ( ON-TABLE ?auto_111937 ) ( ON ?auto_111938 ?auto_111937 ) ( ON ?auto_111939 ?auto_111938 ) ( ON ?auto_111940 ?auto_111939 ) ( ON ?auto_111941 ?auto_111940 ) ( not ( = ?auto_111937 ?auto_111938 ) ) ( not ( = ?auto_111937 ?auto_111939 ) ) ( not ( = ?auto_111937 ?auto_111940 ) ) ( not ( = ?auto_111937 ?auto_111941 ) ) ( not ( = ?auto_111937 ?auto_111943 ) ) ( not ( = ?auto_111938 ?auto_111939 ) ) ( not ( = ?auto_111938 ?auto_111940 ) ) ( not ( = ?auto_111938 ?auto_111941 ) ) ( not ( = ?auto_111938 ?auto_111943 ) ) ( not ( = ?auto_111939 ?auto_111940 ) ) ( not ( = ?auto_111939 ?auto_111941 ) ) ( not ( = ?auto_111939 ?auto_111943 ) ) ( not ( = ?auto_111940 ?auto_111941 ) ) ( not ( = ?auto_111940 ?auto_111943 ) ) ( not ( = ?auto_111941 ?auto_111943 ) ) ( not ( = ?auto_111937 ?auto_111944 ) ) ( not ( = ?auto_111937 ?auto_111942 ) ) ( not ( = ?auto_111938 ?auto_111944 ) ) ( not ( = ?auto_111938 ?auto_111942 ) ) ( not ( = ?auto_111939 ?auto_111944 ) ) ( not ( = ?auto_111939 ?auto_111942 ) ) ( not ( = ?auto_111940 ?auto_111944 ) ) ( not ( = ?auto_111940 ?auto_111942 ) ) ( not ( = ?auto_111941 ?auto_111944 ) ) ( not ( = ?auto_111941 ?auto_111942 ) ) ( not ( = ?auto_111943 ?auto_111944 ) ) ( not ( = ?auto_111943 ?auto_111942 ) ) ( not ( = ?auto_111944 ?auto_111942 ) ) ( ON ?auto_111944 ?auto_111943 ) ( ON ?auto_111942 ?auto_111944 ) ( CLEAR ?auto_111942 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_111937 ?auto_111938 ?auto_111939 ?auto_111940 ?auto_111941 ?auto_111943 ?auto_111944 )
      ( MAKE-5PILE ?auto_111937 ?auto_111938 ?auto_111939 ?auto_111940 ?auto_111941 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_111948 - BLOCK
      ?auto_111949 - BLOCK
      ?auto_111950 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_111950 ) ( CLEAR ?auto_111949 ) ( ON-TABLE ?auto_111948 ) ( ON ?auto_111949 ?auto_111948 ) ( not ( = ?auto_111948 ?auto_111949 ) ) ( not ( = ?auto_111948 ?auto_111950 ) ) ( not ( = ?auto_111949 ?auto_111950 ) ) )
    :subtasks
    ( ( !STACK ?auto_111950 ?auto_111949 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_111951 - BLOCK
      ?auto_111952 - BLOCK
      ?auto_111953 - BLOCK
    )
    :vars
    (
      ?auto_111954 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_111952 ) ( ON-TABLE ?auto_111951 ) ( ON ?auto_111952 ?auto_111951 ) ( not ( = ?auto_111951 ?auto_111952 ) ) ( not ( = ?auto_111951 ?auto_111953 ) ) ( not ( = ?auto_111952 ?auto_111953 ) ) ( ON ?auto_111953 ?auto_111954 ) ( CLEAR ?auto_111953 ) ( HAND-EMPTY ) ( not ( = ?auto_111951 ?auto_111954 ) ) ( not ( = ?auto_111952 ?auto_111954 ) ) ( not ( = ?auto_111953 ?auto_111954 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_111953 ?auto_111954 )
      ( MAKE-3PILE ?auto_111951 ?auto_111952 ?auto_111953 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_111955 - BLOCK
      ?auto_111956 - BLOCK
      ?auto_111957 - BLOCK
    )
    :vars
    (
      ?auto_111958 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_111955 ) ( not ( = ?auto_111955 ?auto_111956 ) ) ( not ( = ?auto_111955 ?auto_111957 ) ) ( not ( = ?auto_111956 ?auto_111957 ) ) ( ON ?auto_111957 ?auto_111958 ) ( CLEAR ?auto_111957 ) ( not ( = ?auto_111955 ?auto_111958 ) ) ( not ( = ?auto_111956 ?auto_111958 ) ) ( not ( = ?auto_111957 ?auto_111958 ) ) ( HOLDING ?auto_111956 ) ( CLEAR ?auto_111955 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_111955 ?auto_111956 )
      ( MAKE-3PILE ?auto_111955 ?auto_111956 ?auto_111957 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_111959 - BLOCK
      ?auto_111960 - BLOCK
      ?auto_111961 - BLOCK
    )
    :vars
    (
      ?auto_111962 - BLOCK
      ?auto_111965 - BLOCK
      ?auto_111966 - BLOCK
      ?auto_111964 - BLOCK
      ?auto_111963 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_111959 ) ( not ( = ?auto_111959 ?auto_111960 ) ) ( not ( = ?auto_111959 ?auto_111961 ) ) ( not ( = ?auto_111960 ?auto_111961 ) ) ( ON ?auto_111961 ?auto_111962 ) ( not ( = ?auto_111959 ?auto_111962 ) ) ( not ( = ?auto_111960 ?auto_111962 ) ) ( not ( = ?auto_111961 ?auto_111962 ) ) ( CLEAR ?auto_111959 ) ( ON ?auto_111960 ?auto_111961 ) ( CLEAR ?auto_111960 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_111965 ) ( ON ?auto_111966 ?auto_111965 ) ( ON ?auto_111964 ?auto_111966 ) ( ON ?auto_111963 ?auto_111964 ) ( ON ?auto_111962 ?auto_111963 ) ( not ( = ?auto_111965 ?auto_111966 ) ) ( not ( = ?auto_111965 ?auto_111964 ) ) ( not ( = ?auto_111965 ?auto_111963 ) ) ( not ( = ?auto_111965 ?auto_111962 ) ) ( not ( = ?auto_111965 ?auto_111961 ) ) ( not ( = ?auto_111965 ?auto_111960 ) ) ( not ( = ?auto_111966 ?auto_111964 ) ) ( not ( = ?auto_111966 ?auto_111963 ) ) ( not ( = ?auto_111966 ?auto_111962 ) ) ( not ( = ?auto_111966 ?auto_111961 ) ) ( not ( = ?auto_111966 ?auto_111960 ) ) ( not ( = ?auto_111964 ?auto_111963 ) ) ( not ( = ?auto_111964 ?auto_111962 ) ) ( not ( = ?auto_111964 ?auto_111961 ) ) ( not ( = ?auto_111964 ?auto_111960 ) ) ( not ( = ?auto_111963 ?auto_111962 ) ) ( not ( = ?auto_111963 ?auto_111961 ) ) ( not ( = ?auto_111963 ?auto_111960 ) ) ( not ( = ?auto_111959 ?auto_111965 ) ) ( not ( = ?auto_111959 ?auto_111966 ) ) ( not ( = ?auto_111959 ?auto_111964 ) ) ( not ( = ?auto_111959 ?auto_111963 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_111965 ?auto_111966 ?auto_111964 ?auto_111963 ?auto_111962 ?auto_111961 )
      ( MAKE-3PILE ?auto_111959 ?auto_111960 ?auto_111961 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_111967 - BLOCK
      ?auto_111968 - BLOCK
      ?auto_111969 - BLOCK
    )
    :vars
    (
      ?auto_111970 - BLOCK
      ?auto_111971 - BLOCK
      ?auto_111973 - BLOCK
      ?auto_111972 - BLOCK
      ?auto_111974 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111967 ?auto_111968 ) ) ( not ( = ?auto_111967 ?auto_111969 ) ) ( not ( = ?auto_111968 ?auto_111969 ) ) ( ON ?auto_111969 ?auto_111970 ) ( not ( = ?auto_111967 ?auto_111970 ) ) ( not ( = ?auto_111968 ?auto_111970 ) ) ( not ( = ?auto_111969 ?auto_111970 ) ) ( ON ?auto_111968 ?auto_111969 ) ( CLEAR ?auto_111968 ) ( ON-TABLE ?auto_111971 ) ( ON ?auto_111973 ?auto_111971 ) ( ON ?auto_111972 ?auto_111973 ) ( ON ?auto_111974 ?auto_111972 ) ( ON ?auto_111970 ?auto_111974 ) ( not ( = ?auto_111971 ?auto_111973 ) ) ( not ( = ?auto_111971 ?auto_111972 ) ) ( not ( = ?auto_111971 ?auto_111974 ) ) ( not ( = ?auto_111971 ?auto_111970 ) ) ( not ( = ?auto_111971 ?auto_111969 ) ) ( not ( = ?auto_111971 ?auto_111968 ) ) ( not ( = ?auto_111973 ?auto_111972 ) ) ( not ( = ?auto_111973 ?auto_111974 ) ) ( not ( = ?auto_111973 ?auto_111970 ) ) ( not ( = ?auto_111973 ?auto_111969 ) ) ( not ( = ?auto_111973 ?auto_111968 ) ) ( not ( = ?auto_111972 ?auto_111974 ) ) ( not ( = ?auto_111972 ?auto_111970 ) ) ( not ( = ?auto_111972 ?auto_111969 ) ) ( not ( = ?auto_111972 ?auto_111968 ) ) ( not ( = ?auto_111974 ?auto_111970 ) ) ( not ( = ?auto_111974 ?auto_111969 ) ) ( not ( = ?auto_111974 ?auto_111968 ) ) ( not ( = ?auto_111967 ?auto_111971 ) ) ( not ( = ?auto_111967 ?auto_111973 ) ) ( not ( = ?auto_111967 ?auto_111972 ) ) ( not ( = ?auto_111967 ?auto_111974 ) ) ( HOLDING ?auto_111967 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_111967 )
      ( MAKE-3PILE ?auto_111967 ?auto_111968 ?auto_111969 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_111975 - BLOCK
      ?auto_111976 - BLOCK
      ?auto_111977 - BLOCK
    )
    :vars
    (
      ?auto_111978 - BLOCK
      ?auto_111979 - BLOCK
      ?auto_111982 - BLOCK
      ?auto_111980 - BLOCK
      ?auto_111981 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_111975 ?auto_111976 ) ) ( not ( = ?auto_111975 ?auto_111977 ) ) ( not ( = ?auto_111976 ?auto_111977 ) ) ( ON ?auto_111977 ?auto_111978 ) ( not ( = ?auto_111975 ?auto_111978 ) ) ( not ( = ?auto_111976 ?auto_111978 ) ) ( not ( = ?auto_111977 ?auto_111978 ) ) ( ON ?auto_111976 ?auto_111977 ) ( ON-TABLE ?auto_111979 ) ( ON ?auto_111982 ?auto_111979 ) ( ON ?auto_111980 ?auto_111982 ) ( ON ?auto_111981 ?auto_111980 ) ( ON ?auto_111978 ?auto_111981 ) ( not ( = ?auto_111979 ?auto_111982 ) ) ( not ( = ?auto_111979 ?auto_111980 ) ) ( not ( = ?auto_111979 ?auto_111981 ) ) ( not ( = ?auto_111979 ?auto_111978 ) ) ( not ( = ?auto_111979 ?auto_111977 ) ) ( not ( = ?auto_111979 ?auto_111976 ) ) ( not ( = ?auto_111982 ?auto_111980 ) ) ( not ( = ?auto_111982 ?auto_111981 ) ) ( not ( = ?auto_111982 ?auto_111978 ) ) ( not ( = ?auto_111982 ?auto_111977 ) ) ( not ( = ?auto_111982 ?auto_111976 ) ) ( not ( = ?auto_111980 ?auto_111981 ) ) ( not ( = ?auto_111980 ?auto_111978 ) ) ( not ( = ?auto_111980 ?auto_111977 ) ) ( not ( = ?auto_111980 ?auto_111976 ) ) ( not ( = ?auto_111981 ?auto_111978 ) ) ( not ( = ?auto_111981 ?auto_111977 ) ) ( not ( = ?auto_111981 ?auto_111976 ) ) ( not ( = ?auto_111975 ?auto_111979 ) ) ( not ( = ?auto_111975 ?auto_111982 ) ) ( not ( = ?auto_111975 ?auto_111980 ) ) ( not ( = ?auto_111975 ?auto_111981 ) ) ( ON ?auto_111975 ?auto_111976 ) ( CLEAR ?auto_111975 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_111979 ?auto_111982 ?auto_111980 ?auto_111981 ?auto_111978 ?auto_111977 ?auto_111976 )
      ( MAKE-3PILE ?auto_111975 ?auto_111976 ?auto_111977 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_111987 - BLOCK
      ?auto_111988 - BLOCK
      ?auto_111989 - BLOCK
      ?auto_111990 - BLOCK
    )
    :vars
    (
      ?auto_111991 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111991 ?auto_111990 ) ( CLEAR ?auto_111991 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_111987 ) ( ON ?auto_111988 ?auto_111987 ) ( ON ?auto_111989 ?auto_111988 ) ( ON ?auto_111990 ?auto_111989 ) ( not ( = ?auto_111987 ?auto_111988 ) ) ( not ( = ?auto_111987 ?auto_111989 ) ) ( not ( = ?auto_111987 ?auto_111990 ) ) ( not ( = ?auto_111987 ?auto_111991 ) ) ( not ( = ?auto_111988 ?auto_111989 ) ) ( not ( = ?auto_111988 ?auto_111990 ) ) ( not ( = ?auto_111988 ?auto_111991 ) ) ( not ( = ?auto_111989 ?auto_111990 ) ) ( not ( = ?auto_111989 ?auto_111991 ) ) ( not ( = ?auto_111990 ?auto_111991 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_111991 ?auto_111990 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_111992 - BLOCK
      ?auto_111993 - BLOCK
      ?auto_111994 - BLOCK
      ?auto_111995 - BLOCK
    )
    :vars
    (
      ?auto_111996 - BLOCK
      ?auto_111997 - BLOCK
      ?auto_111998 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111996 ?auto_111995 ) ( CLEAR ?auto_111996 ) ( ON-TABLE ?auto_111992 ) ( ON ?auto_111993 ?auto_111992 ) ( ON ?auto_111994 ?auto_111993 ) ( ON ?auto_111995 ?auto_111994 ) ( not ( = ?auto_111992 ?auto_111993 ) ) ( not ( = ?auto_111992 ?auto_111994 ) ) ( not ( = ?auto_111992 ?auto_111995 ) ) ( not ( = ?auto_111992 ?auto_111996 ) ) ( not ( = ?auto_111993 ?auto_111994 ) ) ( not ( = ?auto_111993 ?auto_111995 ) ) ( not ( = ?auto_111993 ?auto_111996 ) ) ( not ( = ?auto_111994 ?auto_111995 ) ) ( not ( = ?auto_111994 ?auto_111996 ) ) ( not ( = ?auto_111995 ?auto_111996 ) ) ( HOLDING ?auto_111997 ) ( CLEAR ?auto_111998 ) ( not ( = ?auto_111992 ?auto_111997 ) ) ( not ( = ?auto_111992 ?auto_111998 ) ) ( not ( = ?auto_111993 ?auto_111997 ) ) ( not ( = ?auto_111993 ?auto_111998 ) ) ( not ( = ?auto_111994 ?auto_111997 ) ) ( not ( = ?auto_111994 ?auto_111998 ) ) ( not ( = ?auto_111995 ?auto_111997 ) ) ( not ( = ?auto_111995 ?auto_111998 ) ) ( not ( = ?auto_111996 ?auto_111997 ) ) ( not ( = ?auto_111996 ?auto_111998 ) ) ( not ( = ?auto_111997 ?auto_111998 ) ) )
    :subtasks
    ( ( !STACK ?auto_111997 ?auto_111998 )
      ( MAKE-4PILE ?auto_111992 ?auto_111993 ?auto_111994 ?auto_111995 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_111999 - BLOCK
      ?auto_112000 - BLOCK
      ?auto_112001 - BLOCK
      ?auto_112002 - BLOCK
    )
    :vars
    (
      ?auto_112004 - BLOCK
      ?auto_112005 - BLOCK
      ?auto_112003 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112004 ?auto_112002 ) ( ON-TABLE ?auto_111999 ) ( ON ?auto_112000 ?auto_111999 ) ( ON ?auto_112001 ?auto_112000 ) ( ON ?auto_112002 ?auto_112001 ) ( not ( = ?auto_111999 ?auto_112000 ) ) ( not ( = ?auto_111999 ?auto_112001 ) ) ( not ( = ?auto_111999 ?auto_112002 ) ) ( not ( = ?auto_111999 ?auto_112004 ) ) ( not ( = ?auto_112000 ?auto_112001 ) ) ( not ( = ?auto_112000 ?auto_112002 ) ) ( not ( = ?auto_112000 ?auto_112004 ) ) ( not ( = ?auto_112001 ?auto_112002 ) ) ( not ( = ?auto_112001 ?auto_112004 ) ) ( not ( = ?auto_112002 ?auto_112004 ) ) ( CLEAR ?auto_112005 ) ( not ( = ?auto_111999 ?auto_112003 ) ) ( not ( = ?auto_111999 ?auto_112005 ) ) ( not ( = ?auto_112000 ?auto_112003 ) ) ( not ( = ?auto_112000 ?auto_112005 ) ) ( not ( = ?auto_112001 ?auto_112003 ) ) ( not ( = ?auto_112001 ?auto_112005 ) ) ( not ( = ?auto_112002 ?auto_112003 ) ) ( not ( = ?auto_112002 ?auto_112005 ) ) ( not ( = ?auto_112004 ?auto_112003 ) ) ( not ( = ?auto_112004 ?auto_112005 ) ) ( not ( = ?auto_112003 ?auto_112005 ) ) ( ON ?auto_112003 ?auto_112004 ) ( CLEAR ?auto_112003 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_111999 ?auto_112000 ?auto_112001 ?auto_112002 ?auto_112004 )
      ( MAKE-4PILE ?auto_111999 ?auto_112000 ?auto_112001 ?auto_112002 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_112006 - BLOCK
      ?auto_112007 - BLOCK
      ?auto_112008 - BLOCK
      ?auto_112009 - BLOCK
    )
    :vars
    (
      ?auto_112012 - BLOCK
      ?auto_112010 - BLOCK
      ?auto_112011 - BLOCK
      ?auto_112013 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112012 ?auto_112009 ) ( ON-TABLE ?auto_112006 ) ( ON ?auto_112007 ?auto_112006 ) ( ON ?auto_112008 ?auto_112007 ) ( ON ?auto_112009 ?auto_112008 ) ( not ( = ?auto_112006 ?auto_112007 ) ) ( not ( = ?auto_112006 ?auto_112008 ) ) ( not ( = ?auto_112006 ?auto_112009 ) ) ( not ( = ?auto_112006 ?auto_112012 ) ) ( not ( = ?auto_112007 ?auto_112008 ) ) ( not ( = ?auto_112007 ?auto_112009 ) ) ( not ( = ?auto_112007 ?auto_112012 ) ) ( not ( = ?auto_112008 ?auto_112009 ) ) ( not ( = ?auto_112008 ?auto_112012 ) ) ( not ( = ?auto_112009 ?auto_112012 ) ) ( not ( = ?auto_112006 ?auto_112010 ) ) ( not ( = ?auto_112006 ?auto_112011 ) ) ( not ( = ?auto_112007 ?auto_112010 ) ) ( not ( = ?auto_112007 ?auto_112011 ) ) ( not ( = ?auto_112008 ?auto_112010 ) ) ( not ( = ?auto_112008 ?auto_112011 ) ) ( not ( = ?auto_112009 ?auto_112010 ) ) ( not ( = ?auto_112009 ?auto_112011 ) ) ( not ( = ?auto_112012 ?auto_112010 ) ) ( not ( = ?auto_112012 ?auto_112011 ) ) ( not ( = ?auto_112010 ?auto_112011 ) ) ( ON ?auto_112010 ?auto_112012 ) ( CLEAR ?auto_112010 ) ( HOLDING ?auto_112011 ) ( CLEAR ?auto_112013 ) ( ON-TABLE ?auto_112013 ) ( not ( = ?auto_112013 ?auto_112011 ) ) ( not ( = ?auto_112006 ?auto_112013 ) ) ( not ( = ?auto_112007 ?auto_112013 ) ) ( not ( = ?auto_112008 ?auto_112013 ) ) ( not ( = ?auto_112009 ?auto_112013 ) ) ( not ( = ?auto_112012 ?auto_112013 ) ) ( not ( = ?auto_112010 ?auto_112013 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_112013 ?auto_112011 )
      ( MAKE-4PILE ?auto_112006 ?auto_112007 ?auto_112008 ?auto_112009 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_113068 - BLOCK
      ?auto_113069 - BLOCK
      ?auto_113070 - BLOCK
      ?auto_113071 - BLOCK
    )
    :vars
    (
      ?auto_113072 - BLOCK
      ?auto_113074 - BLOCK
      ?auto_113073 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113072 ?auto_113071 ) ( ON-TABLE ?auto_113068 ) ( ON ?auto_113069 ?auto_113068 ) ( ON ?auto_113070 ?auto_113069 ) ( ON ?auto_113071 ?auto_113070 ) ( not ( = ?auto_113068 ?auto_113069 ) ) ( not ( = ?auto_113068 ?auto_113070 ) ) ( not ( = ?auto_113068 ?auto_113071 ) ) ( not ( = ?auto_113068 ?auto_113072 ) ) ( not ( = ?auto_113069 ?auto_113070 ) ) ( not ( = ?auto_113069 ?auto_113071 ) ) ( not ( = ?auto_113069 ?auto_113072 ) ) ( not ( = ?auto_113070 ?auto_113071 ) ) ( not ( = ?auto_113070 ?auto_113072 ) ) ( not ( = ?auto_113071 ?auto_113072 ) ) ( not ( = ?auto_113068 ?auto_113074 ) ) ( not ( = ?auto_113068 ?auto_113073 ) ) ( not ( = ?auto_113069 ?auto_113074 ) ) ( not ( = ?auto_113069 ?auto_113073 ) ) ( not ( = ?auto_113070 ?auto_113074 ) ) ( not ( = ?auto_113070 ?auto_113073 ) ) ( not ( = ?auto_113071 ?auto_113074 ) ) ( not ( = ?auto_113071 ?auto_113073 ) ) ( not ( = ?auto_113072 ?auto_113074 ) ) ( not ( = ?auto_113072 ?auto_113073 ) ) ( not ( = ?auto_113074 ?auto_113073 ) ) ( ON ?auto_113074 ?auto_113072 ) ( ON ?auto_113073 ?auto_113074 ) ( CLEAR ?auto_113073 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_113068 ?auto_113069 ?auto_113070 ?auto_113071 ?auto_113072 ?auto_113074 )
      ( MAKE-4PILE ?auto_113068 ?auto_113069 ?auto_113070 ?auto_113071 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_112022 - BLOCK
      ?auto_112023 - BLOCK
      ?auto_112024 - BLOCK
      ?auto_112025 - BLOCK
    )
    :vars
    (
      ?auto_112027 - BLOCK
      ?auto_112028 - BLOCK
      ?auto_112026 - BLOCK
      ?auto_112029 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112027 ?auto_112025 ) ( ON-TABLE ?auto_112022 ) ( ON ?auto_112023 ?auto_112022 ) ( ON ?auto_112024 ?auto_112023 ) ( ON ?auto_112025 ?auto_112024 ) ( not ( = ?auto_112022 ?auto_112023 ) ) ( not ( = ?auto_112022 ?auto_112024 ) ) ( not ( = ?auto_112022 ?auto_112025 ) ) ( not ( = ?auto_112022 ?auto_112027 ) ) ( not ( = ?auto_112023 ?auto_112024 ) ) ( not ( = ?auto_112023 ?auto_112025 ) ) ( not ( = ?auto_112023 ?auto_112027 ) ) ( not ( = ?auto_112024 ?auto_112025 ) ) ( not ( = ?auto_112024 ?auto_112027 ) ) ( not ( = ?auto_112025 ?auto_112027 ) ) ( not ( = ?auto_112022 ?auto_112028 ) ) ( not ( = ?auto_112022 ?auto_112026 ) ) ( not ( = ?auto_112023 ?auto_112028 ) ) ( not ( = ?auto_112023 ?auto_112026 ) ) ( not ( = ?auto_112024 ?auto_112028 ) ) ( not ( = ?auto_112024 ?auto_112026 ) ) ( not ( = ?auto_112025 ?auto_112028 ) ) ( not ( = ?auto_112025 ?auto_112026 ) ) ( not ( = ?auto_112027 ?auto_112028 ) ) ( not ( = ?auto_112027 ?auto_112026 ) ) ( not ( = ?auto_112028 ?auto_112026 ) ) ( ON ?auto_112028 ?auto_112027 ) ( not ( = ?auto_112029 ?auto_112026 ) ) ( not ( = ?auto_112022 ?auto_112029 ) ) ( not ( = ?auto_112023 ?auto_112029 ) ) ( not ( = ?auto_112024 ?auto_112029 ) ) ( not ( = ?auto_112025 ?auto_112029 ) ) ( not ( = ?auto_112027 ?auto_112029 ) ) ( not ( = ?auto_112028 ?auto_112029 ) ) ( ON ?auto_112026 ?auto_112028 ) ( CLEAR ?auto_112026 ) ( HOLDING ?auto_112029 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_112029 )
      ( MAKE-4PILE ?auto_112022 ?auto_112023 ?auto_112024 ?auto_112025 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_112030 - BLOCK
      ?auto_112031 - BLOCK
      ?auto_112032 - BLOCK
      ?auto_112033 - BLOCK
    )
    :vars
    (
      ?auto_112034 - BLOCK
      ?auto_112035 - BLOCK
      ?auto_112037 - BLOCK
      ?auto_112036 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112034 ?auto_112033 ) ( ON-TABLE ?auto_112030 ) ( ON ?auto_112031 ?auto_112030 ) ( ON ?auto_112032 ?auto_112031 ) ( ON ?auto_112033 ?auto_112032 ) ( not ( = ?auto_112030 ?auto_112031 ) ) ( not ( = ?auto_112030 ?auto_112032 ) ) ( not ( = ?auto_112030 ?auto_112033 ) ) ( not ( = ?auto_112030 ?auto_112034 ) ) ( not ( = ?auto_112031 ?auto_112032 ) ) ( not ( = ?auto_112031 ?auto_112033 ) ) ( not ( = ?auto_112031 ?auto_112034 ) ) ( not ( = ?auto_112032 ?auto_112033 ) ) ( not ( = ?auto_112032 ?auto_112034 ) ) ( not ( = ?auto_112033 ?auto_112034 ) ) ( not ( = ?auto_112030 ?auto_112035 ) ) ( not ( = ?auto_112030 ?auto_112037 ) ) ( not ( = ?auto_112031 ?auto_112035 ) ) ( not ( = ?auto_112031 ?auto_112037 ) ) ( not ( = ?auto_112032 ?auto_112035 ) ) ( not ( = ?auto_112032 ?auto_112037 ) ) ( not ( = ?auto_112033 ?auto_112035 ) ) ( not ( = ?auto_112033 ?auto_112037 ) ) ( not ( = ?auto_112034 ?auto_112035 ) ) ( not ( = ?auto_112034 ?auto_112037 ) ) ( not ( = ?auto_112035 ?auto_112037 ) ) ( ON ?auto_112035 ?auto_112034 ) ( not ( = ?auto_112036 ?auto_112037 ) ) ( not ( = ?auto_112030 ?auto_112036 ) ) ( not ( = ?auto_112031 ?auto_112036 ) ) ( not ( = ?auto_112032 ?auto_112036 ) ) ( not ( = ?auto_112033 ?auto_112036 ) ) ( not ( = ?auto_112034 ?auto_112036 ) ) ( not ( = ?auto_112035 ?auto_112036 ) ) ( ON ?auto_112037 ?auto_112035 ) ( ON ?auto_112036 ?auto_112037 ) ( CLEAR ?auto_112036 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_112030 ?auto_112031 ?auto_112032 ?auto_112033 ?auto_112034 ?auto_112035 ?auto_112037 )
      ( MAKE-4PILE ?auto_112030 ?auto_112031 ?auto_112032 ?auto_112033 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_112042 - BLOCK
      ?auto_112043 - BLOCK
      ?auto_112044 - BLOCK
      ?auto_112045 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_112045 ) ( CLEAR ?auto_112044 ) ( ON-TABLE ?auto_112042 ) ( ON ?auto_112043 ?auto_112042 ) ( ON ?auto_112044 ?auto_112043 ) ( not ( = ?auto_112042 ?auto_112043 ) ) ( not ( = ?auto_112042 ?auto_112044 ) ) ( not ( = ?auto_112042 ?auto_112045 ) ) ( not ( = ?auto_112043 ?auto_112044 ) ) ( not ( = ?auto_112043 ?auto_112045 ) ) ( not ( = ?auto_112044 ?auto_112045 ) ) )
    :subtasks
    ( ( !STACK ?auto_112045 ?auto_112044 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_112046 - BLOCK
      ?auto_112047 - BLOCK
      ?auto_112048 - BLOCK
      ?auto_112049 - BLOCK
    )
    :vars
    (
      ?auto_112050 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_112048 ) ( ON-TABLE ?auto_112046 ) ( ON ?auto_112047 ?auto_112046 ) ( ON ?auto_112048 ?auto_112047 ) ( not ( = ?auto_112046 ?auto_112047 ) ) ( not ( = ?auto_112046 ?auto_112048 ) ) ( not ( = ?auto_112046 ?auto_112049 ) ) ( not ( = ?auto_112047 ?auto_112048 ) ) ( not ( = ?auto_112047 ?auto_112049 ) ) ( not ( = ?auto_112048 ?auto_112049 ) ) ( ON ?auto_112049 ?auto_112050 ) ( CLEAR ?auto_112049 ) ( HAND-EMPTY ) ( not ( = ?auto_112046 ?auto_112050 ) ) ( not ( = ?auto_112047 ?auto_112050 ) ) ( not ( = ?auto_112048 ?auto_112050 ) ) ( not ( = ?auto_112049 ?auto_112050 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_112049 ?auto_112050 )
      ( MAKE-4PILE ?auto_112046 ?auto_112047 ?auto_112048 ?auto_112049 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_112051 - BLOCK
      ?auto_112052 - BLOCK
      ?auto_112053 - BLOCK
      ?auto_112054 - BLOCK
    )
    :vars
    (
      ?auto_112055 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_112051 ) ( ON ?auto_112052 ?auto_112051 ) ( not ( = ?auto_112051 ?auto_112052 ) ) ( not ( = ?auto_112051 ?auto_112053 ) ) ( not ( = ?auto_112051 ?auto_112054 ) ) ( not ( = ?auto_112052 ?auto_112053 ) ) ( not ( = ?auto_112052 ?auto_112054 ) ) ( not ( = ?auto_112053 ?auto_112054 ) ) ( ON ?auto_112054 ?auto_112055 ) ( CLEAR ?auto_112054 ) ( not ( = ?auto_112051 ?auto_112055 ) ) ( not ( = ?auto_112052 ?auto_112055 ) ) ( not ( = ?auto_112053 ?auto_112055 ) ) ( not ( = ?auto_112054 ?auto_112055 ) ) ( HOLDING ?auto_112053 ) ( CLEAR ?auto_112052 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_112051 ?auto_112052 ?auto_112053 )
      ( MAKE-4PILE ?auto_112051 ?auto_112052 ?auto_112053 ?auto_112054 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_112056 - BLOCK
      ?auto_112057 - BLOCK
      ?auto_112058 - BLOCK
      ?auto_112059 - BLOCK
    )
    :vars
    (
      ?auto_112060 - BLOCK
      ?auto_112061 - BLOCK
      ?auto_112063 - BLOCK
      ?auto_112062 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_112056 ) ( ON ?auto_112057 ?auto_112056 ) ( not ( = ?auto_112056 ?auto_112057 ) ) ( not ( = ?auto_112056 ?auto_112058 ) ) ( not ( = ?auto_112056 ?auto_112059 ) ) ( not ( = ?auto_112057 ?auto_112058 ) ) ( not ( = ?auto_112057 ?auto_112059 ) ) ( not ( = ?auto_112058 ?auto_112059 ) ) ( ON ?auto_112059 ?auto_112060 ) ( not ( = ?auto_112056 ?auto_112060 ) ) ( not ( = ?auto_112057 ?auto_112060 ) ) ( not ( = ?auto_112058 ?auto_112060 ) ) ( not ( = ?auto_112059 ?auto_112060 ) ) ( CLEAR ?auto_112057 ) ( ON ?auto_112058 ?auto_112059 ) ( CLEAR ?auto_112058 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_112061 ) ( ON ?auto_112063 ?auto_112061 ) ( ON ?auto_112062 ?auto_112063 ) ( ON ?auto_112060 ?auto_112062 ) ( not ( = ?auto_112061 ?auto_112063 ) ) ( not ( = ?auto_112061 ?auto_112062 ) ) ( not ( = ?auto_112061 ?auto_112060 ) ) ( not ( = ?auto_112061 ?auto_112059 ) ) ( not ( = ?auto_112061 ?auto_112058 ) ) ( not ( = ?auto_112063 ?auto_112062 ) ) ( not ( = ?auto_112063 ?auto_112060 ) ) ( not ( = ?auto_112063 ?auto_112059 ) ) ( not ( = ?auto_112063 ?auto_112058 ) ) ( not ( = ?auto_112062 ?auto_112060 ) ) ( not ( = ?auto_112062 ?auto_112059 ) ) ( not ( = ?auto_112062 ?auto_112058 ) ) ( not ( = ?auto_112056 ?auto_112061 ) ) ( not ( = ?auto_112056 ?auto_112063 ) ) ( not ( = ?auto_112056 ?auto_112062 ) ) ( not ( = ?auto_112057 ?auto_112061 ) ) ( not ( = ?auto_112057 ?auto_112063 ) ) ( not ( = ?auto_112057 ?auto_112062 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_112061 ?auto_112063 ?auto_112062 ?auto_112060 ?auto_112059 )
      ( MAKE-4PILE ?auto_112056 ?auto_112057 ?auto_112058 ?auto_112059 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_112064 - BLOCK
      ?auto_112065 - BLOCK
      ?auto_112066 - BLOCK
      ?auto_112067 - BLOCK
    )
    :vars
    (
      ?auto_112069 - BLOCK
      ?auto_112070 - BLOCK
      ?auto_112071 - BLOCK
      ?auto_112068 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_112064 ) ( not ( = ?auto_112064 ?auto_112065 ) ) ( not ( = ?auto_112064 ?auto_112066 ) ) ( not ( = ?auto_112064 ?auto_112067 ) ) ( not ( = ?auto_112065 ?auto_112066 ) ) ( not ( = ?auto_112065 ?auto_112067 ) ) ( not ( = ?auto_112066 ?auto_112067 ) ) ( ON ?auto_112067 ?auto_112069 ) ( not ( = ?auto_112064 ?auto_112069 ) ) ( not ( = ?auto_112065 ?auto_112069 ) ) ( not ( = ?auto_112066 ?auto_112069 ) ) ( not ( = ?auto_112067 ?auto_112069 ) ) ( ON ?auto_112066 ?auto_112067 ) ( CLEAR ?auto_112066 ) ( ON-TABLE ?auto_112070 ) ( ON ?auto_112071 ?auto_112070 ) ( ON ?auto_112068 ?auto_112071 ) ( ON ?auto_112069 ?auto_112068 ) ( not ( = ?auto_112070 ?auto_112071 ) ) ( not ( = ?auto_112070 ?auto_112068 ) ) ( not ( = ?auto_112070 ?auto_112069 ) ) ( not ( = ?auto_112070 ?auto_112067 ) ) ( not ( = ?auto_112070 ?auto_112066 ) ) ( not ( = ?auto_112071 ?auto_112068 ) ) ( not ( = ?auto_112071 ?auto_112069 ) ) ( not ( = ?auto_112071 ?auto_112067 ) ) ( not ( = ?auto_112071 ?auto_112066 ) ) ( not ( = ?auto_112068 ?auto_112069 ) ) ( not ( = ?auto_112068 ?auto_112067 ) ) ( not ( = ?auto_112068 ?auto_112066 ) ) ( not ( = ?auto_112064 ?auto_112070 ) ) ( not ( = ?auto_112064 ?auto_112071 ) ) ( not ( = ?auto_112064 ?auto_112068 ) ) ( not ( = ?auto_112065 ?auto_112070 ) ) ( not ( = ?auto_112065 ?auto_112071 ) ) ( not ( = ?auto_112065 ?auto_112068 ) ) ( HOLDING ?auto_112065 ) ( CLEAR ?auto_112064 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_112064 ?auto_112065 )
      ( MAKE-4PILE ?auto_112064 ?auto_112065 ?auto_112066 ?auto_112067 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_112072 - BLOCK
      ?auto_112073 - BLOCK
      ?auto_112074 - BLOCK
      ?auto_112075 - BLOCK
    )
    :vars
    (
      ?auto_112077 - BLOCK
      ?auto_112079 - BLOCK
      ?auto_112076 - BLOCK
      ?auto_112078 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_112072 ) ( not ( = ?auto_112072 ?auto_112073 ) ) ( not ( = ?auto_112072 ?auto_112074 ) ) ( not ( = ?auto_112072 ?auto_112075 ) ) ( not ( = ?auto_112073 ?auto_112074 ) ) ( not ( = ?auto_112073 ?auto_112075 ) ) ( not ( = ?auto_112074 ?auto_112075 ) ) ( ON ?auto_112075 ?auto_112077 ) ( not ( = ?auto_112072 ?auto_112077 ) ) ( not ( = ?auto_112073 ?auto_112077 ) ) ( not ( = ?auto_112074 ?auto_112077 ) ) ( not ( = ?auto_112075 ?auto_112077 ) ) ( ON ?auto_112074 ?auto_112075 ) ( ON-TABLE ?auto_112079 ) ( ON ?auto_112076 ?auto_112079 ) ( ON ?auto_112078 ?auto_112076 ) ( ON ?auto_112077 ?auto_112078 ) ( not ( = ?auto_112079 ?auto_112076 ) ) ( not ( = ?auto_112079 ?auto_112078 ) ) ( not ( = ?auto_112079 ?auto_112077 ) ) ( not ( = ?auto_112079 ?auto_112075 ) ) ( not ( = ?auto_112079 ?auto_112074 ) ) ( not ( = ?auto_112076 ?auto_112078 ) ) ( not ( = ?auto_112076 ?auto_112077 ) ) ( not ( = ?auto_112076 ?auto_112075 ) ) ( not ( = ?auto_112076 ?auto_112074 ) ) ( not ( = ?auto_112078 ?auto_112077 ) ) ( not ( = ?auto_112078 ?auto_112075 ) ) ( not ( = ?auto_112078 ?auto_112074 ) ) ( not ( = ?auto_112072 ?auto_112079 ) ) ( not ( = ?auto_112072 ?auto_112076 ) ) ( not ( = ?auto_112072 ?auto_112078 ) ) ( not ( = ?auto_112073 ?auto_112079 ) ) ( not ( = ?auto_112073 ?auto_112076 ) ) ( not ( = ?auto_112073 ?auto_112078 ) ) ( CLEAR ?auto_112072 ) ( ON ?auto_112073 ?auto_112074 ) ( CLEAR ?auto_112073 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_112079 ?auto_112076 ?auto_112078 ?auto_112077 ?auto_112075 ?auto_112074 )
      ( MAKE-4PILE ?auto_112072 ?auto_112073 ?auto_112074 ?auto_112075 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_112080 - BLOCK
      ?auto_112081 - BLOCK
      ?auto_112082 - BLOCK
      ?auto_112083 - BLOCK
    )
    :vars
    (
      ?auto_112085 - BLOCK
      ?auto_112086 - BLOCK
      ?auto_112084 - BLOCK
      ?auto_112087 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_112080 ?auto_112081 ) ) ( not ( = ?auto_112080 ?auto_112082 ) ) ( not ( = ?auto_112080 ?auto_112083 ) ) ( not ( = ?auto_112081 ?auto_112082 ) ) ( not ( = ?auto_112081 ?auto_112083 ) ) ( not ( = ?auto_112082 ?auto_112083 ) ) ( ON ?auto_112083 ?auto_112085 ) ( not ( = ?auto_112080 ?auto_112085 ) ) ( not ( = ?auto_112081 ?auto_112085 ) ) ( not ( = ?auto_112082 ?auto_112085 ) ) ( not ( = ?auto_112083 ?auto_112085 ) ) ( ON ?auto_112082 ?auto_112083 ) ( ON-TABLE ?auto_112086 ) ( ON ?auto_112084 ?auto_112086 ) ( ON ?auto_112087 ?auto_112084 ) ( ON ?auto_112085 ?auto_112087 ) ( not ( = ?auto_112086 ?auto_112084 ) ) ( not ( = ?auto_112086 ?auto_112087 ) ) ( not ( = ?auto_112086 ?auto_112085 ) ) ( not ( = ?auto_112086 ?auto_112083 ) ) ( not ( = ?auto_112086 ?auto_112082 ) ) ( not ( = ?auto_112084 ?auto_112087 ) ) ( not ( = ?auto_112084 ?auto_112085 ) ) ( not ( = ?auto_112084 ?auto_112083 ) ) ( not ( = ?auto_112084 ?auto_112082 ) ) ( not ( = ?auto_112087 ?auto_112085 ) ) ( not ( = ?auto_112087 ?auto_112083 ) ) ( not ( = ?auto_112087 ?auto_112082 ) ) ( not ( = ?auto_112080 ?auto_112086 ) ) ( not ( = ?auto_112080 ?auto_112084 ) ) ( not ( = ?auto_112080 ?auto_112087 ) ) ( not ( = ?auto_112081 ?auto_112086 ) ) ( not ( = ?auto_112081 ?auto_112084 ) ) ( not ( = ?auto_112081 ?auto_112087 ) ) ( ON ?auto_112081 ?auto_112082 ) ( CLEAR ?auto_112081 ) ( HOLDING ?auto_112080 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_112080 )
      ( MAKE-4PILE ?auto_112080 ?auto_112081 ?auto_112082 ?auto_112083 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_112088 - BLOCK
      ?auto_112089 - BLOCK
      ?auto_112090 - BLOCK
      ?auto_112091 - BLOCK
    )
    :vars
    (
      ?auto_112095 - BLOCK
      ?auto_112093 - BLOCK
      ?auto_112092 - BLOCK
      ?auto_112094 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_112088 ?auto_112089 ) ) ( not ( = ?auto_112088 ?auto_112090 ) ) ( not ( = ?auto_112088 ?auto_112091 ) ) ( not ( = ?auto_112089 ?auto_112090 ) ) ( not ( = ?auto_112089 ?auto_112091 ) ) ( not ( = ?auto_112090 ?auto_112091 ) ) ( ON ?auto_112091 ?auto_112095 ) ( not ( = ?auto_112088 ?auto_112095 ) ) ( not ( = ?auto_112089 ?auto_112095 ) ) ( not ( = ?auto_112090 ?auto_112095 ) ) ( not ( = ?auto_112091 ?auto_112095 ) ) ( ON ?auto_112090 ?auto_112091 ) ( ON-TABLE ?auto_112093 ) ( ON ?auto_112092 ?auto_112093 ) ( ON ?auto_112094 ?auto_112092 ) ( ON ?auto_112095 ?auto_112094 ) ( not ( = ?auto_112093 ?auto_112092 ) ) ( not ( = ?auto_112093 ?auto_112094 ) ) ( not ( = ?auto_112093 ?auto_112095 ) ) ( not ( = ?auto_112093 ?auto_112091 ) ) ( not ( = ?auto_112093 ?auto_112090 ) ) ( not ( = ?auto_112092 ?auto_112094 ) ) ( not ( = ?auto_112092 ?auto_112095 ) ) ( not ( = ?auto_112092 ?auto_112091 ) ) ( not ( = ?auto_112092 ?auto_112090 ) ) ( not ( = ?auto_112094 ?auto_112095 ) ) ( not ( = ?auto_112094 ?auto_112091 ) ) ( not ( = ?auto_112094 ?auto_112090 ) ) ( not ( = ?auto_112088 ?auto_112093 ) ) ( not ( = ?auto_112088 ?auto_112092 ) ) ( not ( = ?auto_112088 ?auto_112094 ) ) ( not ( = ?auto_112089 ?auto_112093 ) ) ( not ( = ?auto_112089 ?auto_112092 ) ) ( not ( = ?auto_112089 ?auto_112094 ) ) ( ON ?auto_112089 ?auto_112090 ) ( ON ?auto_112088 ?auto_112089 ) ( CLEAR ?auto_112088 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_112093 ?auto_112092 ?auto_112094 ?auto_112095 ?auto_112091 ?auto_112090 ?auto_112089 )
      ( MAKE-4PILE ?auto_112088 ?auto_112089 ?auto_112090 ?auto_112091 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_112099 - BLOCK
      ?auto_112100 - BLOCK
      ?auto_112101 - BLOCK
    )
    :vars
    (
      ?auto_112102 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112102 ?auto_112101 ) ( CLEAR ?auto_112102 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_112099 ) ( ON ?auto_112100 ?auto_112099 ) ( ON ?auto_112101 ?auto_112100 ) ( not ( = ?auto_112099 ?auto_112100 ) ) ( not ( = ?auto_112099 ?auto_112101 ) ) ( not ( = ?auto_112099 ?auto_112102 ) ) ( not ( = ?auto_112100 ?auto_112101 ) ) ( not ( = ?auto_112100 ?auto_112102 ) ) ( not ( = ?auto_112101 ?auto_112102 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_112102 ?auto_112101 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_112103 - BLOCK
      ?auto_112104 - BLOCK
      ?auto_112105 - BLOCK
    )
    :vars
    (
      ?auto_112106 - BLOCK
      ?auto_112107 - BLOCK
      ?auto_112108 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112106 ?auto_112105 ) ( CLEAR ?auto_112106 ) ( ON-TABLE ?auto_112103 ) ( ON ?auto_112104 ?auto_112103 ) ( ON ?auto_112105 ?auto_112104 ) ( not ( = ?auto_112103 ?auto_112104 ) ) ( not ( = ?auto_112103 ?auto_112105 ) ) ( not ( = ?auto_112103 ?auto_112106 ) ) ( not ( = ?auto_112104 ?auto_112105 ) ) ( not ( = ?auto_112104 ?auto_112106 ) ) ( not ( = ?auto_112105 ?auto_112106 ) ) ( HOLDING ?auto_112107 ) ( CLEAR ?auto_112108 ) ( not ( = ?auto_112103 ?auto_112107 ) ) ( not ( = ?auto_112103 ?auto_112108 ) ) ( not ( = ?auto_112104 ?auto_112107 ) ) ( not ( = ?auto_112104 ?auto_112108 ) ) ( not ( = ?auto_112105 ?auto_112107 ) ) ( not ( = ?auto_112105 ?auto_112108 ) ) ( not ( = ?auto_112106 ?auto_112107 ) ) ( not ( = ?auto_112106 ?auto_112108 ) ) ( not ( = ?auto_112107 ?auto_112108 ) ) )
    :subtasks
    ( ( !STACK ?auto_112107 ?auto_112108 )
      ( MAKE-3PILE ?auto_112103 ?auto_112104 ?auto_112105 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_112109 - BLOCK
      ?auto_112110 - BLOCK
      ?auto_112111 - BLOCK
    )
    :vars
    (
      ?auto_112112 - BLOCK
      ?auto_112114 - BLOCK
      ?auto_112113 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112112 ?auto_112111 ) ( ON-TABLE ?auto_112109 ) ( ON ?auto_112110 ?auto_112109 ) ( ON ?auto_112111 ?auto_112110 ) ( not ( = ?auto_112109 ?auto_112110 ) ) ( not ( = ?auto_112109 ?auto_112111 ) ) ( not ( = ?auto_112109 ?auto_112112 ) ) ( not ( = ?auto_112110 ?auto_112111 ) ) ( not ( = ?auto_112110 ?auto_112112 ) ) ( not ( = ?auto_112111 ?auto_112112 ) ) ( CLEAR ?auto_112114 ) ( not ( = ?auto_112109 ?auto_112113 ) ) ( not ( = ?auto_112109 ?auto_112114 ) ) ( not ( = ?auto_112110 ?auto_112113 ) ) ( not ( = ?auto_112110 ?auto_112114 ) ) ( not ( = ?auto_112111 ?auto_112113 ) ) ( not ( = ?auto_112111 ?auto_112114 ) ) ( not ( = ?auto_112112 ?auto_112113 ) ) ( not ( = ?auto_112112 ?auto_112114 ) ) ( not ( = ?auto_112113 ?auto_112114 ) ) ( ON ?auto_112113 ?auto_112112 ) ( CLEAR ?auto_112113 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_112109 ?auto_112110 ?auto_112111 ?auto_112112 )
      ( MAKE-3PILE ?auto_112109 ?auto_112110 ?auto_112111 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_112115 - BLOCK
      ?auto_112116 - BLOCK
      ?auto_112117 - BLOCK
    )
    :vars
    (
      ?auto_112119 - BLOCK
      ?auto_112120 - BLOCK
      ?auto_112118 - BLOCK
      ?auto_112121 - BLOCK
      ?auto_112122 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112119 ?auto_112117 ) ( ON-TABLE ?auto_112115 ) ( ON ?auto_112116 ?auto_112115 ) ( ON ?auto_112117 ?auto_112116 ) ( not ( = ?auto_112115 ?auto_112116 ) ) ( not ( = ?auto_112115 ?auto_112117 ) ) ( not ( = ?auto_112115 ?auto_112119 ) ) ( not ( = ?auto_112116 ?auto_112117 ) ) ( not ( = ?auto_112116 ?auto_112119 ) ) ( not ( = ?auto_112117 ?auto_112119 ) ) ( not ( = ?auto_112115 ?auto_112120 ) ) ( not ( = ?auto_112115 ?auto_112118 ) ) ( not ( = ?auto_112116 ?auto_112120 ) ) ( not ( = ?auto_112116 ?auto_112118 ) ) ( not ( = ?auto_112117 ?auto_112120 ) ) ( not ( = ?auto_112117 ?auto_112118 ) ) ( not ( = ?auto_112119 ?auto_112120 ) ) ( not ( = ?auto_112119 ?auto_112118 ) ) ( not ( = ?auto_112120 ?auto_112118 ) ) ( ON ?auto_112120 ?auto_112119 ) ( CLEAR ?auto_112120 ) ( HOLDING ?auto_112118 ) ( CLEAR ?auto_112121 ) ( ON-TABLE ?auto_112122 ) ( ON ?auto_112121 ?auto_112122 ) ( not ( = ?auto_112122 ?auto_112121 ) ) ( not ( = ?auto_112122 ?auto_112118 ) ) ( not ( = ?auto_112121 ?auto_112118 ) ) ( not ( = ?auto_112115 ?auto_112121 ) ) ( not ( = ?auto_112115 ?auto_112122 ) ) ( not ( = ?auto_112116 ?auto_112121 ) ) ( not ( = ?auto_112116 ?auto_112122 ) ) ( not ( = ?auto_112117 ?auto_112121 ) ) ( not ( = ?auto_112117 ?auto_112122 ) ) ( not ( = ?auto_112119 ?auto_112121 ) ) ( not ( = ?auto_112119 ?auto_112122 ) ) ( not ( = ?auto_112120 ?auto_112121 ) ) ( not ( = ?auto_112120 ?auto_112122 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_112122 ?auto_112121 ?auto_112118 )
      ( MAKE-3PILE ?auto_112115 ?auto_112116 ?auto_112117 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_112123 - BLOCK
      ?auto_112124 - BLOCK
      ?auto_112125 - BLOCK
    )
    :vars
    (
      ?auto_112126 - BLOCK
      ?auto_112129 - BLOCK
      ?auto_112128 - BLOCK
      ?auto_112127 - BLOCK
      ?auto_112130 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112126 ?auto_112125 ) ( ON-TABLE ?auto_112123 ) ( ON ?auto_112124 ?auto_112123 ) ( ON ?auto_112125 ?auto_112124 ) ( not ( = ?auto_112123 ?auto_112124 ) ) ( not ( = ?auto_112123 ?auto_112125 ) ) ( not ( = ?auto_112123 ?auto_112126 ) ) ( not ( = ?auto_112124 ?auto_112125 ) ) ( not ( = ?auto_112124 ?auto_112126 ) ) ( not ( = ?auto_112125 ?auto_112126 ) ) ( not ( = ?auto_112123 ?auto_112129 ) ) ( not ( = ?auto_112123 ?auto_112128 ) ) ( not ( = ?auto_112124 ?auto_112129 ) ) ( not ( = ?auto_112124 ?auto_112128 ) ) ( not ( = ?auto_112125 ?auto_112129 ) ) ( not ( = ?auto_112125 ?auto_112128 ) ) ( not ( = ?auto_112126 ?auto_112129 ) ) ( not ( = ?auto_112126 ?auto_112128 ) ) ( not ( = ?auto_112129 ?auto_112128 ) ) ( ON ?auto_112129 ?auto_112126 ) ( CLEAR ?auto_112127 ) ( ON-TABLE ?auto_112130 ) ( ON ?auto_112127 ?auto_112130 ) ( not ( = ?auto_112130 ?auto_112127 ) ) ( not ( = ?auto_112130 ?auto_112128 ) ) ( not ( = ?auto_112127 ?auto_112128 ) ) ( not ( = ?auto_112123 ?auto_112127 ) ) ( not ( = ?auto_112123 ?auto_112130 ) ) ( not ( = ?auto_112124 ?auto_112127 ) ) ( not ( = ?auto_112124 ?auto_112130 ) ) ( not ( = ?auto_112125 ?auto_112127 ) ) ( not ( = ?auto_112125 ?auto_112130 ) ) ( not ( = ?auto_112126 ?auto_112127 ) ) ( not ( = ?auto_112126 ?auto_112130 ) ) ( not ( = ?auto_112129 ?auto_112127 ) ) ( not ( = ?auto_112129 ?auto_112130 ) ) ( ON ?auto_112128 ?auto_112129 ) ( CLEAR ?auto_112128 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_112123 ?auto_112124 ?auto_112125 ?auto_112126 ?auto_112129 )
      ( MAKE-3PILE ?auto_112123 ?auto_112124 ?auto_112125 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_112131 - BLOCK
      ?auto_112132 - BLOCK
      ?auto_112133 - BLOCK
    )
    :vars
    (
      ?auto_112138 - BLOCK
      ?auto_112137 - BLOCK
      ?auto_112135 - BLOCK
      ?auto_112134 - BLOCK
      ?auto_112136 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112138 ?auto_112133 ) ( ON-TABLE ?auto_112131 ) ( ON ?auto_112132 ?auto_112131 ) ( ON ?auto_112133 ?auto_112132 ) ( not ( = ?auto_112131 ?auto_112132 ) ) ( not ( = ?auto_112131 ?auto_112133 ) ) ( not ( = ?auto_112131 ?auto_112138 ) ) ( not ( = ?auto_112132 ?auto_112133 ) ) ( not ( = ?auto_112132 ?auto_112138 ) ) ( not ( = ?auto_112133 ?auto_112138 ) ) ( not ( = ?auto_112131 ?auto_112137 ) ) ( not ( = ?auto_112131 ?auto_112135 ) ) ( not ( = ?auto_112132 ?auto_112137 ) ) ( not ( = ?auto_112132 ?auto_112135 ) ) ( not ( = ?auto_112133 ?auto_112137 ) ) ( not ( = ?auto_112133 ?auto_112135 ) ) ( not ( = ?auto_112138 ?auto_112137 ) ) ( not ( = ?auto_112138 ?auto_112135 ) ) ( not ( = ?auto_112137 ?auto_112135 ) ) ( ON ?auto_112137 ?auto_112138 ) ( ON-TABLE ?auto_112134 ) ( not ( = ?auto_112134 ?auto_112136 ) ) ( not ( = ?auto_112134 ?auto_112135 ) ) ( not ( = ?auto_112136 ?auto_112135 ) ) ( not ( = ?auto_112131 ?auto_112136 ) ) ( not ( = ?auto_112131 ?auto_112134 ) ) ( not ( = ?auto_112132 ?auto_112136 ) ) ( not ( = ?auto_112132 ?auto_112134 ) ) ( not ( = ?auto_112133 ?auto_112136 ) ) ( not ( = ?auto_112133 ?auto_112134 ) ) ( not ( = ?auto_112138 ?auto_112136 ) ) ( not ( = ?auto_112138 ?auto_112134 ) ) ( not ( = ?auto_112137 ?auto_112136 ) ) ( not ( = ?auto_112137 ?auto_112134 ) ) ( ON ?auto_112135 ?auto_112137 ) ( CLEAR ?auto_112135 ) ( HOLDING ?auto_112136 ) ( CLEAR ?auto_112134 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_112134 ?auto_112136 )
      ( MAKE-3PILE ?auto_112131 ?auto_112132 ?auto_112133 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_113316 - BLOCK
      ?auto_113317 - BLOCK
      ?auto_113318 - BLOCK
    )
    :vars
    (
      ?auto_113322 - BLOCK
      ?auto_113320 - BLOCK
      ?auto_113321 - BLOCK
      ?auto_113319 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113322 ?auto_113318 ) ( ON-TABLE ?auto_113316 ) ( ON ?auto_113317 ?auto_113316 ) ( ON ?auto_113318 ?auto_113317 ) ( not ( = ?auto_113316 ?auto_113317 ) ) ( not ( = ?auto_113316 ?auto_113318 ) ) ( not ( = ?auto_113316 ?auto_113322 ) ) ( not ( = ?auto_113317 ?auto_113318 ) ) ( not ( = ?auto_113317 ?auto_113322 ) ) ( not ( = ?auto_113318 ?auto_113322 ) ) ( not ( = ?auto_113316 ?auto_113320 ) ) ( not ( = ?auto_113316 ?auto_113321 ) ) ( not ( = ?auto_113317 ?auto_113320 ) ) ( not ( = ?auto_113317 ?auto_113321 ) ) ( not ( = ?auto_113318 ?auto_113320 ) ) ( not ( = ?auto_113318 ?auto_113321 ) ) ( not ( = ?auto_113322 ?auto_113320 ) ) ( not ( = ?auto_113322 ?auto_113321 ) ) ( not ( = ?auto_113320 ?auto_113321 ) ) ( ON ?auto_113320 ?auto_113322 ) ( not ( = ?auto_113319 ?auto_113321 ) ) ( not ( = ?auto_113316 ?auto_113319 ) ) ( not ( = ?auto_113317 ?auto_113319 ) ) ( not ( = ?auto_113318 ?auto_113319 ) ) ( not ( = ?auto_113322 ?auto_113319 ) ) ( not ( = ?auto_113320 ?auto_113319 ) ) ( ON ?auto_113321 ?auto_113320 ) ( ON ?auto_113319 ?auto_113321 ) ( CLEAR ?auto_113319 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_113316 ?auto_113317 ?auto_113318 ?auto_113322 ?auto_113320 ?auto_113321 )
      ( MAKE-3PILE ?auto_113316 ?auto_113317 ?auto_113318 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_112147 - BLOCK
      ?auto_112148 - BLOCK
      ?auto_112149 - BLOCK
    )
    :vars
    (
      ?auto_112150 - BLOCK
      ?auto_112152 - BLOCK
      ?auto_112153 - BLOCK
      ?auto_112151 - BLOCK
      ?auto_112154 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112150 ?auto_112149 ) ( ON-TABLE ?auto_112147 ) ( ON ?auto_112148 ?auto_112147 ) ( ON ?auto_112149 ?auto_112148 ) ( not ( = ?auto_112147 ?auto_112148 ) ) ( not ( = ?auto_112147 ?auto_112149 ) ) ( not ( = ?auto_112147 ?auto_112150 ) ) ( not ( = ?auto_112148 ?auto_112149 ) ) ( not ( = ?auto_112148 ?auto_112150 ) ) ( not ( = ?auto_112149 ?auto_112150 ) ) ( not ( = ?auto_112147 ?auto_112152 ) ) ( not ( = ?auto_112147 ?auto_112153 ) ) ( not ( = ?auto_112148 ?auto_112152 ) ) ( not ( = ?auto_112148 ?auto_112153 ) ) ( not ( = ?auto_112149 ?auto_112152 ) ) ( not ( = ?auto_112149 ?auto_112153 ) ) ( not ( = ?auto_112150 ?auto_112152 ) ) ( not ( = ?auto_112150 ?auto_112153 ) ) ( not ( = ?auto_112152 ?auto_112153 ) ) ( ON ?auto_112152 ?auto_112150 ) ( not ( = ?auto_112151 ?auto_112154 ) ) ( not ( = ?auto_112151 ?auto_112153 ) ) ( not ( = ?auto_112154 ?auto_112153 ) ) ( not ( = ?auto_112147 ?auto_112154 ) ) ( not ( = ?auto_112147 ?auto_112151 ) ) ( not ( = ?auto_112148 ?auto_112154 ) ) ( not ( = ?auto_112148 ?auto_112151 ) ) ( not ( = ?auto_112149 ?auto_112154 ) ) ( not ( = ?auto_112149 ?auto_112151 ) ) ( not ( = ?auto_112150 ?auto_112154 ) ) ( not ( = ?auto_112150 ?auto_112151 ) ) ( not ( = ?auto_112152 ?auto_112154 ) ) ( not ( = ?auto_112152 ?auto_112151 ) ) ( ON ?auto_112153 ?auto_112152 ) ( ON ?auto_112154 ?auto_112153 ) ( CLEAR ?auto_112154 ) ( HOLDING ?auto_112151 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_112151 )
      ( MAKE-3PILE ?auto_112147 ?auto_112148 ?auto_112149 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_112155 - BLOCK
      ?auto_112156 - BLOCK
      ?auto_112157 - BLOCK
    )
    :vars
    (
      ?auto_112161 - BLOCK
      ?auto_112162 - BLOCK
      ?auto_112160 - BLOCK
      ?auto_112159 - BLOCK
      ?auto_112158 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112161 ?auto_112157 ) ( ON-TABLE ?auto_112155 ) ( ON ?auto_112156 ?auto_112155 ) ( ON ?auto_112157 ?auto_112156 ) ( not ( = ?auto_112155 ?auto_112156 ) ) ( not ( = ?auto_112155 ?auto_112157 ) ) ( not ( = ?auto_112155 ?auto_112161 ) ) ( not ( = ?auto_112156 ?auto_112157 ) ) ( not ( = ?auto_112156 ?auto_112161 ) ) ( not ( = ?auto_112157 ?auto_112161 ) ) ( not ( = ?auto_112155 ?auto_112162 ) ) ( not ( = ?auto_112155 ?auto_112160 ) ) ( not ( = ?auto_112156 ?auto_112162 ) ) ( not ( = ?auto_112156 ?auto_112160 ) ) ( not ( = ?auto_112157 ?auto_112162 ) ) ( not ( = ?auto_112157 ?auto_112160 ) ) ( not ( = ?auto_112161 ?auto_112162 ) ) ( not ( = ?auto_112161 ?auto_112160 ) ) ( not ( = ?auto_112162 ?auto_112160 ) ) ( ON ?auto_112162 ?auto_112161 ) ( not ( = ?auto_112159 ?auto_112158 ) ) ( not ( = ?auto_112159 ?auto_112160 ) ) ( not ( = ?auto_112158 ?auto_112160 ) ) ( not ( = ?auto_112155 ?auto_112158 ) ) ( not ( = ?auto_112155 ?auto_112159 ) ) ( not ( = ?auto_112156 ?auto_112158 ) ) ( not ( = ?auto_112156 ?auto_112159 ) ) ( not ( = ?auto_112157 ?auto_112158 ) ) ( not ( = ?auto_112157 ?auto_112159 ) ) ( not ( = ?auto_112161 ?auto_112158 ) ) ( not ( = ?auto_112161 ?auto_112159 ) ) ( not ( = ?auto_112162 ?auto_112158 ) ) ( not ( = ?auto_112162 ?auto_112159 ) ) ( ON ?auto_112160 ?auto_112162 ) ( ON ?auto_112158 ?auto_112160 ) ( ON ?auto_112159 ?auto_112158 ) ( CLEAR ?auto_112159 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_112155 ?auto_112156 ?auto_112157 ?auto_112161 ?auto_112162 ?auto_112160 ?auto_112158 )
      ( MAKE-3PILE ?auto_112155 ?auto_112156 ?auto_112157 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_112168 - BLOCK
      ?auto_112169 - BLOCK
      ?auto_112170 - BLOCK
      ?auto_112171 - BLOCK
      ?auto_112172 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_112172 ) ( CLEAR ?auto_112171 ) ( ON-TABLE ?auto_112168 ) ( ON ?auto_112169 ?auto_112168 ) ( ON ?auto_112170 ?auto_112169 ) ( ON ?auto_112171 ?auto_112170 ) ( not ( = ?auto_112168 ?auto_112169 ) ) ( not ( = ?auto_112168 ?auto_112170 ) ) ( not ( = ?auto_112168 ?auto_112171 ) ) ( not ( = ?auto_112168 ?auto_112172 ) ) ( not ( = ?auto_112169 ?auto_112170 ) ) ( not ( = ?auto_112169 ?auto_112171 ) ) ( not ( = ?auto_112169 ?auto_112172 ) ) ( not ( = ?auto_112170 ?auto_112171 ) ) ( not ( = ?auto_112170 ?auto_112172 ) ) ( not ( = ?auto_112171 ?auto_112172 ) ) )
    :subtasks
    ( ( !STACK ?auto_112172 ?auto_112171 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_112173 - BLOCK
      ?auto_112174 - BLOCK
      ?auto_112175 - BLOCK
      ?auto_112176 - BLOCK
      ?auto_112177 - BLOCK
    )
    :vars
    (
      ?auto_112178 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_112176 ) ( ON-TABLE ?auto_112173 ) ( ON ?auto_112174 ?auto_112173 ) ( ON ?auto_112175 ?auto_112174 ) ( ON ?auto_112176 ?auto_112175 ) ( not ( = ?auto_112173 ?auto_112174 ) ) ( not ( = ?auto_112173 ?auto_112175 ) ) ( not ( = ?auto_112173 ?auto_112176 ) ) ( not ( = ?auto_112173 ?auto_112177 ) ) ( not ( = ?auto_112174 ?auto_112175 ) ) ( not ( = ?auto_112174 ?auto_112176 ) ) ( not ( = ?auto_112174 ?auto_112177 ) ) ( not ( = ?auto_112175 ?auto_112176 ) ) ( not ( = ?auto_112175 ?auto_112177 ) ) ( not ( = ?auto_112176 ?auto_112177 ) ) ( ON ?auto_112177 ?auto_112178 ) ( CLEAR ?auto_112177 ) ( HAND-EMPTY ) ( not ( = ?auto_112173 ?auto_112178 ) ) ( not ( = ?auto_112174 ?auto_112178 ) ) ( not ( = ?auto_112175 ?auto_112178 ) ) ( not ( = ?auto_112176 ?auto_112178 ) ) ( not ( = ?auto_112177 ?auto_112178 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_112177 ?auto_112178 )
      ( MAKE-5PILE ?auto_112173 ?auto_112174 ?auto_112175 ?auto_112176 ?auto_112177 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_112179 - BLOCK
      ?auto_112180 - BLOCK
      ?auto_112181 - BLOCK
      ?auto_112182 - BLOCK
      ?auto_112183 - BLOCK
    )
    :vars
    (
      ?auto_112184 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_112179 ) ( ON ?auto_112180 ?auto_112179 ) ( ON ?auto_112181 ?auto_112180 ) ( not ( = ?auto_112179 ?auto_112180 ) ) ( not ( = ?auto_112179 ?auto_112181 ) ) ( not ( = ?auto_112179 ?auto_112182 ) ) ( not ( = ?auto_112179 ?auto_112183 ) ) ( not ( = ?auto_112180 ?auto_112181 ) ) ( not ( = ?auto_112180 ?auto_112182 ) ) ( not ( = ?auto_112180 ?auto_112183 ) ) ( not ( = ?auto_112181 ?auto_112182 ) ) ( not ( = ?auto_112181 ?auto_112183 ) ) ( not ( = ?auto_112182 ?auto_112183 ) ) ( ON ?auto_112183 ?auto_112184 ) ( CLEAR ?auto_112183 ) ( not ( = ?auto_112179 ?auto_112184 ) ) ( not ( = ?auto_112180 ?auto_112184 ) ) ( not ( = ?auto_112181 ?auto_112184 ) ) ( not ( = ?auto_112182 ?auto_112184 ) ) ( not ( = ?auto_112183 ?auto_112184 ) ) ( HOLDING ?auto_112182 ) ( CLEAR ?auto_112181 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_112179 ?auto_112180 ?auto_112181 ?auto_112182 )
      ( MAKE-5PILE ?auto_112179 ?auto_112180 ?auto_112181 ?auto_112182 ?auto_112183 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_112185 - BLOCK
      ?auto_112186 - BLOCK
      ?auto_112187 - BLOCK
      ?auto_112188 - BLOCK
      ?auto_112189 - BLOCK
    )
    :vars
    (
      ?auto_112190 - BLOCK
      ?auto_112192 - BLOCK
      ?auto_112191 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_112185 ) ( ON ?auto_112186 ?auto_112185 ) ( ON ?auto_112187 ?auto_112186 ) ( not ( = ?auto_112185 ?auto_112186 ) ) ( not ( = ?auto_112185 ?auto_112187 ) ) ( not ( = ?auto_112185 ?auto_112188 ) ) ( not ( = ?auto_112185 ?auto_112189 ) ) ( not ( = ?auto_112186 ?auto_112187 ) ) ( not ( = ?auto_112186 ?auto_112188 ) ) ( not ( = ?auto_112186 ?auto_112189 ) ) ( not ( = ?auto_112187 ?auto_112188 ) ) ( not ( = ?auto_112187 ?auto_112189 ) ) ( not ( = ?auto_112188 ?auto_112189 ) ) ( ON ?auto_112189 ?auto_112190 ) ( not ( = ?auto_112185 ?auto_112190 ) ) ( not ( = ?auto_112186 ?auto_112190 ) ) ( not ( = ?auto_112187 ?auto_112190 ) ) ( not ( = ?auto_112188 ?auto_112190 ) ) ( not ( = ?auto_112189 ?auto_112190 ) ) ( CLEAR ?auto_112187 ) ( ON ?auto_112188 ?auto_112189 ) ( CLEAR ?auto_112188 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_112192 ) ( ON ?auto_112191 ?auto_112192 ) ( ON ?auto_112190 ?auto_112191 ) ( not ( = ?auto_112192 ?auto_112191 ) ) ( not ( = ?auto_112192 ?auto_112190 ) ) ( not ( = ?auto_112192 ?auto_112189 ) ) ( not ( = ?auto_112192 ?auto_112188 ) ) ( not ( = ?auto_112191 ?auto_112190 ) ) ( not ( = ?auto_112191 ?auto_112189 ) ) ( not ( = ?auto_112191 ?auto_112188 ) ) ( not ( = ?auto_112185 ?auto_112192 ) ) ( not ( = ?auto_112185 ?auto_112191 ) ) ( not ( = ?auto_112186 ?auto_112192 ) ) ( not ( = ?auto_112186 ?auto_112191 ) ) ( not ( = ?auto_112187 ?auto_112192 ) ) ( not ( = ?auto_112187 ?auto_112191 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_112192 ?auto_112191 ?auto_112190 ?auto_112189 )
      ( MAKE-5PILE ?auto_112185 ?auto_112186 ?auto_112187 ?auto_112188 ?auto_112189 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_112193 - BLOCK
      ?auto_112194 - BLOCK
      ?auto_112195 - BLOCK
      ?auto_112196 - BLOCK
      ?auto_112197 - BLOCK
    )
    :vars
    (
      ?auto_112198 - BLOCK
      ?auto_112200 - BLOCK
      ?auto_112199 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_112193 ) ( ON ?auto_112194 ?auto_112193 ) ( not ( = ?auto_112193 ?auto_112194 ) ) ( not ( = ?auto_112193 ?auto_112195 ) ) ( not ( = ?auto_112193 ?auto_112196 ) ) ( not ( = ?auto_112193 ?auto_112197 ) ) ( not ( = ?auto_112194 ?auto_112195 ) ) ( not ( = ?auto_112194 ?auto_112196 ) ) ( not ( = ?auto_112194 ?auto_112197 ) ) ( not ( = ?auto_112195 ?auto_112196 ) ) ( not ( = ?auto_112195 ?auto_112197 ) ) ( not ( = ?auto_112196 ?auto_112197 ) ) ( ON ?auto_112197 ?auto_112198 ) ( not ( = ?auto_112193 ?auto_112198 ) ) ( not ( = ?auto_112194 ?auto_112198 ) ) ( not ( = ?auto_112195 ?auto_112198 ) ) ( not ( = ?auto_112196 ?auto_112198 ) ) ( not ( = ?auto_112197 ?auto_112198 ) ) ( ON ?auto_112196 ?auto_112197 ) ( CLEAR ?auto_112196 ) ( ON-TABLE ?auto_112200 ) ( ON ?auto_112199 ?auto_112200 ) ( ON ?auto_112198 ?auto_112199 ) ( not ( = ?auto_112200 ?auto_112199 ) ) ( not ( = ?auto_112200 ?auto_112198 ) ) ( not ( = ?auto_112200 ?auto_112197 ) ) ( not ( = ?auto_112200 ?auto_112196 ) ) ( not ( = ?auto_112199 ?auto_112198 ) ) ( not ( = ?auto_112199 ?auto_112197 ) ) ( not ( = ?auto_112199 ?auto_112196 ) ) ( not ( = ?auto_112193 ?auto_112200 ) ) ( not ( = ?auto_112193 ?auto_112199 ) ) ( not ( = ?auto_112194 ?auto_112200 ) ) ( not ( = ?auto_112194 ?auto_112199 ) ) ( not ( = ?auto_112195 ?auto_112200 ) ) ( not ( = ?auto_112195 ?auto_112199 ) ) ( HOLDING ?auto_112195 ) ( CLEAR ?auto_112194 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_112193 ?auto_112194 ?auto_112195 )
      ( MAKE-5PILE ?auto_112193 ?auto_112194 ?auto_112195 ?auto_112196 ?auto_112197 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_112201 - BLOCK
      ?auto_112202 - BLOCK
      ?auto_112203 - BLOCK
      ?auto_112204 - BLOCK
      ?auto_112205 - BLOCK
    )
    :vars
    (
      ?auto_112206 - BLOCK
      ?auto_112207 - BLOCK
      ?auto_112208 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_112201 ) ( ON ?auto_112202 ?auto_112201 ) ( not ( = ?auto_112201 ?auto_112202 ) ) ( not ( = ?auto_112201 ?auto_112203 ) ) ( not ( = ?auto_112201 ?auto_112204 ) ) ( not ( = ?auto_112201 ?auto_112205 ) ) ( not ( = ?auto_112202 ?auto_112203 ) ) ( not ( = ?auto_112202 ?auto_112204 ) ) ( not ( = ?auto_112202 ?auto_112205 ) ) ( not ( = ?auto_112203 ?auto_112204 ) ) ( not ( = ?auto_112203 ?auto_112205 ) ) ( not ( = ?auto_112204 ?auto_112205 ) ) ( ON ?auto_112205 ?auto_112206 ) ( not ( = ?auto_112201 ?auto_112206 ) ) ( not ( = ?auto_112202 ?auto_112206 ) ) ( not ( = ?auto_112203 ?auto_112206 ) ) ( not ( = ?auto_112204 ?auto_112206 ) ) ( not ( = ?auto_112205 ?auto_112206 ) ) ( ON ?auto_112204 ?auto_112205 ) ( ON-TABLE ?auto_112207 ) ( ON ?auto_112208 ?auto_112207 ) ( ON ?auto_112206 ?auto_112208 ) ( not ( = ?auto_112207 ?auto_112208 ) ) ( not ( = ?auto_112207 ?auto_112206 ) ) ( not ( = ?auto_112207 ?auto_112205 ) ) ( not ( = ?auto_112207 ?auto_112204 ) ) ( not ( = ?auto_112208 ?auto_112206 ) ) ( not ( = ?auto_112208 ?auto_112205 ) ) ( not ( = ?auto_112208 ?auto_112204 ) ) ( not ( = ?auto_112201 ?auto_112207 ) ) ( not ( = ?auto_112201 ?auto_112208 ) ) ( not ( = ?auto_112202 ?auto_112207 ) ) ( not ( = ?auto_112202 ?auto_112208 ) ) ( not ( = ?auto_112203 ?auto_112207 ) ) ( not ( = ?auto_112203 ?auto_112208 ) ) ( CLEAR ?auto_112202 ) ( ON ?auto_112203 ?auto_112204 ) ( CLEAR ?auto_112203 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_112207 ?auto_112208 ?auto_112206 ?auto_112205 ?auto_112204 )
      ( MAKE-5PILE ?auto_112201 ?auto_112202 ?auto_112203 ?auto_112204 ?auto_112205 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_112209 - BLOCK
      ?auto_112210 - BLOCK
      ?auto_112211 - BLOCK
      ?auto_112212 - BLOCK
      ?auto_112213 - BLOCK
    )
    :vars
    (
      ?auto_112216 - BLOCK
      ?auto_112215 - BLOCK
      ?auto_112214 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_112209 ) ( not ( = ?auto_112209 ?auto_112210 ) ) ( not ( = ?auto_112209 ?auto_112211 ) ) ( not ( = ?auto_112209 ?auto_112212 ) ) ( not ( = ?auto_112209 ?auto_112213 ) ) ( not ( = ?auto_112210 ?auto_112211 ) ) ( not ( = ?auto_112210 ?auto_112212 ) ) ( not ( = ?auto_112210 ?auto_112213 ) ) ( not ( = ?auto_112211 ?auto_112212 ) ) ( not ( = ?auto_112211 ?auto_112213 ) ) ( not ( = ?auto_112212 ?auto_112213 ) ) ( ON ?auto_112213 ?auto_112216 ) ( not ( = ?auto_112209 ?auto_112216 ) ) ( not ( = ?auto_112210 ?auto_112216 ) ) ( not ( = ?auto_112211 ?auto_112216 ) ) ( not ( = ?auto_112212 ?auto_112216 ) ) ( not ( = ?auto_112213 ?auto_112216 ) ) ( ON ?auto_112212 ?auto_112213 ) ( ON-TABLE ?auto_112215 ) ( ON ?auto_112214 ?auto_112215 ) ( ON ?auto_112216 ?auto_112214 ) ( not ( = ?auto_112215 ?auto_112214 ) ) ( not ( = ?auto_112215 ?auto_112216 ) ) ( not ( = ?auto_112215 ?auto_112213 ) ) ( not ( = ?auto_112215 ?auto_112212 ) ) ( not ( = ?auto_112214 ?auto_112216 ) ) ( not ( = ?auto_112214 ?auto_112213 ) ) ( not ( = ?auto_112214 ?auto_112212 ) ) ( not ( = ?auto_112209 ?auto_112215 ) ) ( not ( = ?auto_112209 ?auto_112214 ) ) ( not ( = ?auto_112210 ?auto_112215 ) ) ( not ( = ?auto_112210 ?auto_112214 ) ) ( not ( = ?auto_112211 ?auto_112215 ) ) ( not ( = ?auto_112211 ?auto_112214 ) ) ( ON ?auto_112211 ?auto_112212 ) ( CLEAR ?auto_112211 ) ( HOLDING ?auto_112210 ) ( CLEAR ?auto_112209 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_112209 ?auto_112210 )
      ( MAKE-5PILE ?auto_112209 ?auto_112210 ?auto_112211 ?auto_112212 ?auto_112213 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_112217 - BLOCK
      ?auto_112218 - BLOCK
      ?auto_112219 - BLOCK
      ?auto_112220 - BLOCK
      ?auto_112221 - BLOCK
    )
    :vars
    (
      ?auto_112224 - BLOCK
      ?auto_112223 - BLOCK
      ?auto_112222 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_112217 ) ( not ( = ?auto_112217 ?auto_112218 ) ) ( not ( = ?auto_112217 ?auto_112219 ) ) ( not ( = ?auto_112217 ?auto_112220 ) ) ( not ( = ?auto_112217 ?auto_112221 ) ) ( not ( = ?auto_112218 ?auto_112219 ) ) ( not ( = ?auto_112218 ?auto_112220 ) ) ( not ( = ?auto_112218 ?auto_112221 ) ) ( not ( = ?auto_112219 ?auto_112220 ) ) ( not ( = ?auto_112219 ?auto_112221 ) ) ( not ( = ?auto_112220 ?auto_112221 ) ) ( ON ?auto_112221 ?auto_112224 ) ( not ( = ?auto_112217 ?auto_112224 ) ) ( not ( = ?auto_112218 ?auto_112224 ) ) ( not ( = ?auto_112219 ?auto_112224 ) ) ( not ( = ?auto_112220 ?auto_112224 ) ) ( not ( = ?auto_112221 ?auto_112224 ) ) ( ON ?auto_112220 ?auto_112221 ) ( ON-TABLE ?auto_112223 ) ( ON ?auto_112222 ?auto_112223 ) ( ON ?auto_112224 ?auto_112222 ) ( not ( = ?auto_112223 ?auto_112222 ) ) ( not ( = ?auto_112223 ?auto_112224 ) ) ( not ( = ?auto_112223 ?auto_112221 ) ) ( not ( = ?auto_112223 ?auto_112220 ) ) ( not ( = ?auto_112222 ?auto_112224 ) ) ( not ( = ?auto_112222 ?auto_112221 ) ) ( not ( = ?auto_112222 ?auto_112220 ) ) ( not ( = ?auto_112217 ?auto_112223 ) ) ( not ( = ?auto_112217 ?auto_112222 ) ) ( not ( = ?auto_112218 ?auto_112223 ) ) ( not ( = ?auto_112218 ?auto_112222 ) ) ( not ( = ?auto_112219 ?auto_112223 ) ) ( not ( = ?auto_112219 ?auto_112222 ) ) ( ON ?auto_112219 ?auto_112220 ) ( CLEAR ?auto_112217 ) ( ON ?auto_112218 ?auto_112219 ) ( CLEAR ?auto_112218 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_112223 ?auto_112222 ?auto_112224 ?auto_112221 ?auto_112220 ?auto_112219 )
      ( MAKE-5PILE ?auto_112217 ?auto_112218 ?auto_112219 ?auto_112220 ?auto_112221 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_112225 - BLOCK
      ?auto_112226 - BLOCK
      ?auto_112227 - BLOCK
      ?auto_112228 - BLOCK
      ?auto_112229 - BLOCK
    )
    :vars
    (
      ?auto_112230 - BLOCK
      ?auto_112232 - BLOCK
      ?auto_112231 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_112225 ?auto_112226 ) ) ( not ( = ?auto_112225 ?auto_112227 ) ) ( not ( = ?auto_112225 ?auto_112228 ) ) ( not ( = ?auto_112225 ?auto_112229 ) ) ( not ( = ?auto_112226 ?auto_112227 ) ) ( not ( = ?auto_112226 ?auto_112228 ) ) ( not ( = ?auto_112226 ?auto_112229 ) ) ( not ( = ?auto_112227 ?auto_112228 ) ) ( not ( = ?auto_112227 ?auto_112229 ) ) ( not ( = ?auto_112228 ?auto_112229 ) ) ( ON ?auto_112229 ?auto_112230 ) ( not ( = ?auto_112225 ?auto_112230 ) ) ( not ( = ?auto_112226 ?auto_112230 ) ) ( not ( = ?auto_112227 ?auto_112230 ) ) ( not ( = ?auto_112228 ?auto_112230 ) ) ( not ( = ?auto_112229 ?auto_112230 ) ) ( ON ?auto_112228 ?auto_112229 ) ( ON-TABLE ?auto_112232 ) ( ON ?auto_112231 ?auto_112232 ) ( ON ?auto_112230 ?auto_112231 ) ( not ( = ?auto_112232 ?auto_112231 ) ) ( not ( = ?auto_112232 ?auto_112230 ) ) ( not ( = ?auto_112232 ?auto_112229 ) ) ( not ( = ?auto_112232 ?auto_112228 ) ) ( not ( = ?auto_112231 ?auto_112230 ) ) ( not ( = ?auto_112231 ?auto_112229 ) ) ( not ( = ?auto_112231 ?auto_112228 ) ) ( not ( = ?auto_112225 ?auto_112232 ) ) ( not ( = ?auto_112225 ?auto_112231 ) ) ( not ( = ?auto_112226 ?auto_112232 ) ) ( not ( = ?auto_112226 ?auto_112231 ) ) ( not ( = ?auto_112227 ?auto_112232 ) ) ( not ( = ?auto_112227 ?auto_112231 ) ) ( ON ?auto_112227 ?auto_112228 ) ( ON ?auto_112226 ?auto_112227 ) ( CLEAR ?auto_112226 ) ( HOLDING ?auto_112225 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_112225 )
      ( MAKE-5PILE ?auto_112225 ?auto_112226 ?auto_112227 ?auto_112228 ?auto_112229 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_112233 - BLOCK
      ?auto_112234 - BLOCK
      ?auto_112235 - BLOCK
      ?auto_112236 - BLOCK
      ?auto_112237 - BLOCK
    )
    :vars
    (
      ?auto_112239 - BLOCK
      ?auto_112240 - BLOCK
      ?auto_112238 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_112233 ?auto_112234 ) ) ( not ( = ?auto_112233 ?auto_112235 ) ) ( not ( = ?auto_112233 ?auto_112236 ) ) ( not ( = ?auto_112233 ?auto_112237 ) ) ( not ( = ?auto_112234 ?auto_112235 ) ) ( not ( = ?auto_112234 ?auto_112236 ) ) ( not ( = ?auto_112234 ?auto_112237 ) ) ( not ( = ?auto_112235 ?auto_112236 ) ) ( not ( = ?auto_112235 ?auto_112237 ) ) ( not ( = ?auto_112236 ?auto_112237 ) ) ( ON ?auto_112237 ?auto_112239 ) ( not ( = ?auto_112233 ?auto_112239 ) ) ( not ( = ?auto_112234 ?auto_112239 ) ) ( not ( = ?auto_112235 ?auto_112239 ) ) ( not ( = ?auto_112236 ?auto_112239 ) ) ( not ( = ?auto_112237 ?auto_112239 ) ) ( ON ?auto_112236 ?auto_112237 ) ( ON-TABLE ?auto_112240 ) ( ON ?auto_112238 ?auto_112240 ) ( ON ?auto_112239 ?auto_112238 ) ( not ( = ?auto_112240 ?auto_112238 ) ) ( not ( = ?auto_112240 ?auto_112239 ) ) ( not ( = ?auto_112240 ?auto_112237 ) ) ( not ( = ?auto_112240 ?auto_112236 ) ) ( not ( = ?auto_112238 ?auto_112239 ) ) ( not ( = ?auto_112238 ?auto_112237 ) ) ( not ( = ?auto_112238 ?auto_112236 ) ) ( not ( = ?auto_112233 ?auto_112240 ) ) ( not ( = ?auto_112233 ?auto_112238 ) ) ( not ( = ?auto_112234 ?auto_112240 ) ) ( not ( = ?auto_112234 ?auto_112238 ) ) ( not ( = ?auto_112235 ?auto_112240 ) ) ( not ( = ?auto_112235 ?auto_112238 ) ) ( ON ?auto_112235 ?auto_112236 ) ( ON ?auto_112234 ?auto_112235 ) ( ON ?auto_112233 ?auto_112234 ) ( CLEAR ?auto_112233 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_112240 ?auto_112238 ?auto_112239 ?auto_112237 ?auto_112236 ?auto_112235 ?auto_112234 )
      ( MAKE-5PILE ?auto_112233 ?auto_112234 ?auto_112235 ?auto_112236 ?auto_112237 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_112243 - BLOCK
      ?auto_112244 - BLOCK
    )
    :vars
    (
      ?auto_112245 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112245 ?auto_112244 ) ( CLEAR ?auto_112245 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_112243 ) ( ON ?auto_112244 ?auto_112243 ) ( not ( = ?auto_112243 ?auto_112244 ) ) ( not ( = ?auto_112243 ?auto_112245 ) ) ( not ( = ?auto_112244 ?auto_112245 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_112245 ?auto_112244 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_112246 - BLOCK
      ?auto_112247 - BLOCK
    )
    :vars
    (
      ?auto_112248 - BLOCK
      ?auto_112249 - BLOCK
      ?auto_112250 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112248 ?auto_112247 ) ( CLEAR ?auto_112248 ) ( ON-TABLE ?auto_112246 ) ( ON ?auto_112247 ?auto_112246 ) ( not ( = ?auto_112246 ?auto_112247 ) ) ( not ( = ?auto_112246 ?auto_112248 ) ) ( not ( = ?auto_112247 ?auto_112248 ) ) ( HOLDING ?auto_112249 ) ( CLEAR ?auto_112250 ) ( not ( = ?auto_112246 ?auto_112249 ) ) ( not ( = ?auto_112246 ?auto_112250 ) ) ( not ( = ?auto_112247 ?auto_112249 ) ) ( not ( = ?auto_112247 ?auto_112250 ) ) ( not ( = ?auto_112248 ?auto_112249 ) ) ( not ( = ?auto_112248 ?auto_112250 ) ) ( not ( = ?auto_112249 ?auto_112250 ) ) )
    :subtasks
    ( ( !STACK ?auto_112249 ?auto_112250 )
      ( MAKE-2PILE ?auto_112246 ?auto_112247 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_112251 - BLOCK
      ?auto_112252 - BLOCK
    )
    :vars
    (
      ?auto_112255 - BLOCK
      ?auto_112254 - BLOCK
      ?auto_112253 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112255 ?auto_112252 ) ( ON-TABLE ?auto_112251 ) ( ON ?auto_112252 ?auto_112251 ) ( not ( = ?auto_112251 ?auto_112252 ) ) ( not ( = ?auto_112251 ?auto_112255 ) ) ( not ( = ?auto_112252 ?auto_112255 ) ) ( CLEAR ?auto_112254 ) ( not ( = ?auto_112251 ?auto_112253 ) ) ( not ( = ?auto_112251 ?auto_112254 ) ) ( not ( = ?auto_112252 ?auto_112253 ) ) ( not ( = ?auto_112252 ?auto_112254 ) ) ( not ( = ?auto_112255 ?auto_112253 ) ) ( not ( = ?auto_112255 ?auto_112254 ) ) ( not ( = ?auto_112253 ?auto_112254 ) ) ( ON ?auto_112253 ?auto_112255 ) ( CLEAR ?auto_112253 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_112251 ?auto_112252 ?auto_112255 )
      ( MAKE-2PILE ?auto_112251 ?auto_112252 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_112256 - BLOCK
      ?auto_112257 - BLOCK
    )
    :vars
    (
      ?auto_112260 - BLOCK
      ?auto_112259 - BLOCK
      ?auto_112258 - BLOCK
      ?auto_112262 - BLOCK
      ?auto_112263 - BLOCK
      ?auto_112261 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112260 ?auto_112257 ) ( ON-TABLE ?auto_112256 ) ( ON ?auto_112257 ?auto_112256 ) ( not ( = ?auto_112256 ?auto_112257 ) ) ( not ( = ?auto_112256 ?auto_112260 ) ) ( not ( = ?auto_112257 ?auto_112260 ) ) ( not ( = ?auto_112256 ?auto_112259 ) ) ( not ( = ?auto_112256 ?auto_112258 ) ) ( not ( = ?auto_112257 ?auto_112259 ) ) ( not ( = ?auto_112257 ?auto_112258 ) ) ( not ( = ?auto_112260 ?auto_112259 ) ) ( not ( = ?auto_112260 ?auto_112258 ) ) ( not ( = ?auto_112259 ?auto_112258 ) ) ( ON ?auto_112259 ?auto_112260 ) ( CLEAR ?auto_112259 ) ( HOLDING ?auto_112258 ) ( CLEAR ?auto_112262 ) ( ON-TABLE ?auto_112263 ) ( ON ?auto_112261 ?auto_112263 ) ( ON ?auto_112262 ?auto_112261 ) ( not ( = ?auto_112263 ?auto_112261 ) ) ( not ( = ?auto_112263 ?auto_112262 ) ) ( not ( = ?auto_112263 ?auto_112258 ) ) ( not ( = ?auto_112261 ?auto_112262 ) ) ( not ( = ?auto_112261 ?auto_112258 ) ) ( not ( = ?auto_112262 ?auto_112258 ) ) ( not ( = ?auto_112256 ?auto_112262 ) ) ( not ( = ?auto_112256 ?auto_112263 ) ) ( not ( = ?auto_112256 ?auto_112261 ) ) ( not ( = ?auto_112257 ?auto_112262 ) ) ( not ( = ?auto_112257 ?auto_112263 ) ) ( not ( = ?auto_112257 ?auto_112261 ) ) ( not ( = ?auto_112260 ?auto_112262 ) ) ( not ( = ?auto_112260 ?auto_112263 ) ) ( not ( = ?auto_112260 ?auto_112261 ) ) ( not ( = ?auto_112259 ?auto_112262 ) ) ( not ( = ?auto_112259 ?auto_112263 ) ) ( not ( = ?auto_112259 ?auto_112261 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_112263 ?auto_112261 ?auto_112262 ?auto_112258 )
      ( MAKE-2PILE ?auto_112256 ?auto_112257 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_112264 - BLOCK
      ?auto_112265 - BLOCK
    )
    :vars
    (
      ?auto_112266 - BLOCK
      ?auto_112267 - BLOCK
      ?auto_112269 - BLOCK
      ?auto_112271 - BLOCK
      ?auto_112270 - BLOCK
      ?auto_112268 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112266 ?auto_112265 ) ( ON-TABLE ?auto_112264 ) ( ON ?auto_112265 ?auto_112264 ) ( not ( = ?auto_112264 ?auto_112265 ) ) ( not ( = ?auto_112264 ?auto_112266 ) ) ( not ( = ?auto_112265 ?auto_112266 ) ) ( not ( = ?auto_112264 ?auto_112267 ) ) ( not ( = ?auto_112264 ?auto_112269 ) ) ( not ( = ?auto_112265 ?auto_112267 ) ) ( not ( = ?auto_112265 ?auto_112269 ) ) ( not ( = ?auto_112266 ?auto_112267 ) ) ( not ( = ?auto_112266 ?auto_112269 ) ) ( not ( = ?auto_112267 ?auto_112269 ) ) ( ON ?auto_112267 ?auto_112266 ) ( CLEAR ?auto_112271 ) ( ON-TABLE ?auto_112270 ) ( ON ?auto_112268 ?auto_112270 ) ( ON ?auto_112271 ?auto_112268 ) ( not ( = ?auto_112270 ?auto_112268 ) ) ( not ( = ?auto_112270 ?auto_112271 ) ) ( not ( = ?auto_112270 ?auto_112269 ) ) ( not ( = ?auto_112268 ?auto_112271 ) ) ( not ( = ?auto_112268 ?auto_112269 ) ) ( not ( = ?auto_112271 ?auto_112269 ) ) ( not ( = ?auto_112264 ?auto_112271 ) ) ( not ( = ?auto_112264 ?auto_112270 ) ) ( not ( = ?auto_112264 ?auto_112268 ) ) ( not ( = ?auto_112265 ?auto_112271 ) ) ( not ( = ?auto_112265 ?auto_112270 ) ) ( not ( = ?auto_112265 ?auto_112268 ) ) ( not ( = ?auto_112266 ?auto_112271 ) ) ( not ( = ?auto_112266 ?auto_112270 ) ) ( not ( = ?auto_112266 ?auto_112268 ) ) ( not ( = ?auto_112267 ?auto_112271 ) ) ( not ( = ?auto_112267 ?auto_112270 ) ) ( not ( = ?auto_112267 ?auto_112268 ) ) ( ON ?auto_112269 ?auto_112267 ) ( CLEAR ?auto_112269 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_112264 ?auto_112265 ?auto_112266 ?auto_112267 )
      ( MAKE-2PILE ?auto_112264 ?auto_112265 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_112272 - BLOCK
      ?auto_112273 - BLOCK
    )
    :vars
    (
      ?auto_112274 - BLOCK
      ?auto_112278 - BLOCK
      ?auto_112279 - BLOCK
      ?auto_112275 - BLOCK
      ?auto_112276 - BLOCK
      ?auto_112277 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112274 ?auto_112273 ) ( ON-TABLE ?auto_112272 ) ( ON ?auto_112273 ?auto_112272 ) ( not ( = ?auto_112272 ?auto_112273 ) ) ( not ( = ?auto_112272 ?auto_112274 ) ) ( not ( = ?auto_112273 ?auto_112274 ) ) ( not ( = ?auto_112272 ?auto_112278 ) ) ( not ( = ?auto_112272 ?auto_112279 ) ) ( not ( = ?auto_112273 ?auto_112278 ) ) ( not ( = ?auto_112273 ?auto_112279 ) ) ( not ( = ?auto_112274 ?auto_112278 ) ) ( not ( = ?auto_112274 ?auto_112279 ) ) ( not ( = ?auto_112278 ?auto_112279 ) ) ( ON ?auto_112278 ?auto_112274 ) ( ON-TABLE ?auto_112275 ) ( ON ?auto_112276 ?auto_112275 ) ( not ( = ?auto_112275 ?auto_112276 ) ) ( not ( = ?auto_112275 ?auto_112277 ) ) ( not ( = ?auto_112275 ?auto_112279 ) ) ( not ( = ?auto_112276 ?auto_112277 ) ) ( not ( = ?auto_112276 ?auto_112279 ) ) ( not ( = ?auto_112277 ?auto_112279 ) ) ( not ( = ?auto_112272 ?auto_112277 ) ) ( not ( = ?auto_112272 ?auto_112275 ) ) ( not ( = ?auto_112272 ?auto_112276 ) ) ( not ( = ?auto_112273 ?auto_112277 ) ) ( not ( = ?auto_112273 ?auto_112275 ) ) ( not ( = ?auto_112273 ?auto_112276 ) ) ( not ( = ?auto_112274 ?auto_112277 ) ) ( not ( = ?auto_112274 ?auto_112275 ) ) ( not ( = ?auto_112274 ?auto_112276 ) ) ( not ( = ?auto_112278 ?auto_112277 ) ) ( not ( = ?auto_112278 ?auto_112275 ) ) ( not ( = ?auto_112278 ?auto_112276 ) ) ( ON ?auto_112279 ?auto_112278 ) ( CLEAR ?auto_112279 ) ( HOLDING ?auto_112277 ) ( CLEAR ?auto_112276 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_112275 ?auto_112276 ?auto_112277 )
      ( MAKE-2PILE ?auto_112272 ?auto_112273 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_112280 - BLOCK
      ?auto_112281 - BLOCK
    )
    :vars
    (
      ?auto_112283 - BLOCK
      ?auto_112286 - BLOCK
      ?auto_112287 - BLOCK
      ?auto_112282 - BLOCK
      ?auto_112284 - BLOCK
      ?auto_112285 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112283 ?auto_112281 ) ( ON-TABLE ?auto_112280 ) ( ON ?auto_112281 ?auto_112280 ) ( not ( = ?auto_112280 ?auto_112281 ) ) ( not ( = ?auto_112280 ?auto_112283 ) ) ( not ( = ?auto_112281 ?auto_112283 ) ) ( not ( = ?auto_112280 ?auto_112286 ) ) ( not ( = ?auto_112280 ?auto_112287 ) ) ( not ( = ?auto_112281 ?auto_112286 ) ) ( not ( = ?auto_112281 ?auto_112287 ) ) ( not ( = ?auto_112283 ?auto_112286 ) ) ( not ( = ?auto_112283 ?auto_112287 ) ) ( not ( = ?auto_112286 ?auto_112287 ) ) ( ON ?auto_112286 ?auto_112283 ) ( ON-TABLE ?auto_112282 ) ( ON ?auto_112284 ?auto_112282 ) ( not ( = ?auto_112282 ?auto_112284 ) ) ( not ( = ?auto_112282 ?auto_112285 ) ) ( not ( = ?auto_112282 ?auto_112287 ) ) ( not ( = ?auto_112284 ?auto_112285 ) ) ( not ( = ?auto_112284 ?auto_112287 ) ) ( not ( = ?auto_112285 ?auto_112287 ) ) ( not ( = ?auto_112280 ?auto_112285 ) ) ( not ( = ?auto_112280 ?auto_112282 ) ) ( not ( = ?auto_112280 ?auto_112284 ) ) ( not ( = ?auto_112281 ?auto_112285 ) ) ( not ( = ?auto_112281 ?auto_112282 ) ) ( not ( = ?auto_112281 ?auto_112284 ) ) ( not ( = ?auto_112283 ?auto_112285 ) ) ( not ( = ?auto_112283 ?auto_112282 ) ) ( not ( = ?auto_112283 ?auto_112284 ) ) ( not ( = ?auto_112286 ?auto_112285 ) ) ( not ( = ?auto_112286 ?auto_112282 ) ) ( not ( = ?auto_112286 ?auto_112284 ) ) ( ON ?auto_112287 ?auto_112286 ) ( CLEAR ?auto_112284 ) ( ON ?auto_112285 ?auto_112287 ) ( CLEAR ?auto_112285 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_112280 ?auto_112281 ?auto_112283 ?auto_112286 ?auto_112287 )
      ( MAKE-2PILE ?auto_112280 ?auto_112281 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_112288 - BLOCK
      ?auto_112289 - BLOCK
    )
    :vars
    (
      ?auto_112291 - BLOCK
      ?auto_112292 - BLOCK
      ?auto_112293 - BLOCK
      ?auto_112294 - BLOCK
      ?auto_112295 - BLOCK
      ?auto_112290 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112291 ?auto_112289 ) ( ON-TABLE ?auto_112288 ) ( ON ?auto_112289 ?auto_112288 ) ( not ( = ?auto_112288 ?auto_112289 ) ) ( not ( = ?auto_112288 ?auto_112291 ) ) ( not ( = ?auto_112289 ?auto_112291 ) ) ( not ( = ?auto_112288 ?auto_112292 ) ) ( not ( = ?auto_112288 ?auto_112293 ) ) ( not ( = ?auto_112289 ?auto_112292 ) ) ( not ( = ?auto_112289 ?auto_112293 ) ) ( not ( = ?auto_112291 ?auto_112292 ) ) ( not ( = ?auto_112291 ?auto_112293 ) ) ( not ( = ?auto_112292 ?auto_112293 ) ) ( ON ?auto_112292 ?auto_112291 ) ( ON-TABLE ?auto_112294 ) ( not ( = ?auto_112294 ?auto_112295 ) ) ( not ( = ?auto_112294 ?auto_112290 ) ) ( not ( = ?auto_112294 ?auto_112293 ) ) ( not ( = ?auto_112295 ?auto_112290 ) ) ( not ( = ?auto_112295 ?auto_112293 ) ) ( not ( = ?auto_112290 ?auto_112293 ) ) ( not ( = ?auto_112288 ?auto_112290 ) ) ( not ( = ?auto_112288 ?auto_112294 ) ) ( not ( = ?auto_112288 ?auto_112295 ) ) ( not ( = ?auto_112289 ?auto_112290 ) ) ( not ( = ?auto_112289 ?auto_112294 ) ) ( not ( = ?auto_112289 ?auto_112295 ) ) ( not ( = ?auto_112291 ?auto_112290 ) ) ( not ( = ?auto_112291 ?auto_112294 ) ) ( not ( = ?auto_112291 ?auto_112295 ) ) ( not ( = ?auto_112292 ?auto_112290 ) ) ( not ( = ?auto_112292 ?auto_112294 ) ) ( not ( = ?auto_112292 ?auto_112295 ) ) ( ON ?auto_112293 ?auto_112292 ) ( ON ?auto_112290 ?auto_112293 ) ( CLEAR ?auto_112290 ) ( HOLDING ?auto_112295 ) ( CLEAR ?auto_112294 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_112294 ?auto_112295 )
      ( MAKE-2PILE ?auto_112288 ?auto_112289 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_113589 - BLOCK
      ?auto_113590 - BLOCK
    )
    :vars
    (
      ?auto_113594 - BLOCK
      ?auto_113595 - BLOCK
      ?auto_113591 - BLOCK
      ?auto_113593 - BLOCK
      ?auto_113592 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113594 ?auto_113590 ) ( ON-TABLE ?auto_113589 ) ( ON ?auto_113590 ?auto_113589 ) ( not ( = ?auto_113589 ?auto_113590 ) ) ( not ( = ?auto_113589 ?auto_113594 ) ) ( not ( = ?auto_113590 ?auto_113594 ) ) ( not ( = ?auto_113589 ?auto_113595 ) ) ( not ( = ?auto_113589 ?auto_113591 ) ) ( not ( = ?auto_113590 ?auto_113595 ) ) ( not ( = ?auto_113590 ?auto_113591 ) ) ( not ( = ?auto_113594 ?auto_113595 ) ) ( not ( = ?auto_113594 ?auto_113591 ) ) ( not ( = ?auto_113595 ?auto_113591 ) ) ( ON ?auto_113595 ?auto_113594 ) ( not ( = ?auto_113593 ?auto_113592 ) ) ( not ( = ?auto_113593 ?auto_113591 ) ) ( not ( = ?auto_113592 ?auto_113591 ) ) ( not ( = ?auto_113589 ?auto_113592 ) ) ( not ( = ?auto_113589 ?auto_113593 ) ) ( not ( = ?auto_113590 ?auto_113592 ) ) ( not ( = ?auto_113590 ?auto_113593 ) ) ( not ( = ?auto_113594 ?auto_113592 ) ) ( not ( = ?auto_113594 ?auto_113593 ) ) ( not ( = ?auto_113595 ?auto_113592 ) ) ( not ( = ?auto_113595 ?auto_113593 ) ) ( ON ?auto_113591 ?auto_113595 ) ( ON ?auto_113592 ?auto_113591 ) ( ON ?auto_113593 ?auto_113592 ) ( CLEAR ?auto_113593 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_113589 ?auto_113590 ?auto_113594 ?auto_113595 ?auto_113591 ?auto_113592 )
      ( MAKE-2PILE ?auto_113589 ?auto_113590 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_112304 - BLOCK
      ?auto_112305 - BLOCK
    )
    :vars
    (
      ?auto_112306 - BLOCK
      ?auto_112310 - BLOCK
      ?auto_112311 - BLOCK
      ?auto_112307 - BLOCK
      ?auto_112308 - BLOCK
      ?auto_112309 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112306 ?auto_112305 ) ( ON-TABLE ?auto_112304 ) ( ON ?auto_112305 ?auto_112304 ) ( not ( = ?auto_112304 ?auto_112305 ) ) ( not ( = ?auto_112304 ?auto_112306 ) ) ( not ( = ?auto_112305 ?auto_112306 ) ) ( not ( = ?auto_112304 ?auto_112310 ) ) ( not ( = ?auto_112304 ?auto_112311 ) ) ( not ( = ?auto_112305 ?auto_112310 ) ) ( not ( = ?auto_112305 ?auto_112311 ) ) ( not ( = ?auto_112306 ?auto_112310 ) ) ( not ( = ?auto_112306 ?auto_112311 ) ) ( not ( = ?auto_112310 ?auto_112311 ) ) ( ON ?auto_112310 ?auto_112306 ) ( not ( = ?auto_112307 ?auto_112308 ) ) ( not ( = ?auto_112307 ?auto_112309 ) ) ( not ( = ?auto_112307 ?auto_112311 ) ) ( not ( = ?auto_112308 ?auto_112309 ) ) ( not ( = ?auto_112308 ?auto_112311 ) ) ( not ( = ?auto_112309 ?auto_112311 ) ) ( not ( = ?auto_112304 ?auto_112309 ) ) ( not ( = ?auto_112304 ?auto_112307 ) ) ( not ( = ?auto_112304 ?auto_112308 ) ) ( not ( = ?auto_112305 ?auto_112309 ) ) ( not ( = ?auto_112305 ?auto_112307 ) ) ( not ( = ?auto_112305 ?auto_112308 ) ) ( not ( = ?auto_112306 ?auto_112309 ) ) ( not ( = ?auto_112306 ?auto_112307 ) ) ( not ( = ?auto_112306 ?auto_112308 ) ) ( not ( = ?auto_112310 ?auto_112309 ) ) ( not ( = ?auto_112310 ?auto_112307 ) ) ( not ( = ?auto_112310 ?auto_112308 ) ) ( ON ?auto_112311 ?auto_112310 ) ( ON ?auto_112309 ?auto_112311 ) ( ON ?auto_112308 ?auto_112309 ) ( CLEAR ?auto_112308 ) ( HOLDING ?auto_112307 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_112307 )
      ( MAKE-2PILE ?auto_112304 ?auto_112305 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_112312 - BLOCK
      ?auto_112313 - BLOCK
    )
    :vars
    (
      ?auto_112319 - BLOCK
      ?auto_112316 - BLOCK
      ?auto_112317 - BLOCK
      ?auto_112314 - BLOCK
      ?auto_112318 - BLOCK
      ?auto_112315 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112319 ?auto_112313 ) ( ON-TABLE ?auto_112312 ) ( ON ?auto_112313 ?auto_112312 ) ( not ( = ?auto_112312 ?auto_112313 ) ) ( not ( = ?auto_112312 ?auto_112319 ) ) ( not ( = ?auto_112313 ?auto_112319 ) ) ( not ( = ?auto_112312 ?auto_112316 ) ) ( not ( = ?auto_112312 ?auto_112317 ) ) ( not ( = ?auto_112313 ?auto_112316 ) ) ( not ( = ?auto_112313 ?auto_112317 ) ) ( not ( = ?auto_112319 ?auto_112316 ) ) ( not ( = ?auto_112319 ?auto_112317 ) ) ( not ( = ?auto_112316 ?auto_112317 ) ) ( ON ?auto_112316 ?auto_112319 ) ( not ( = ?auto_112314 ?auto_112318 ) ) ( not ( = ?auto_112314 ?auto_112315 ) ) ( not ( = ?auto_112314 ?auto_112317 ) ) ( not ( = ?auto_112318 ?auto_112315 ) ) ( not ( = ?auto_112318 ?auto_112317 ) ) ( not ( = ?auto_112315 ?auto_112317 ) ) ( not ( = ?auto_112312 ?auto_112315 ) ) ( not ( = ?auto_112312 ?auto_112314 ) ) ( not ( = ?auto_112312 ?auto_112318 ) ) ( not ( = ?auto_112313 ?auto_112315 ) ) ( not ( = ?auto_112313 ?auto_112314 ) ) ( not ( = ?auto_112313 ?auto_112318 ) ) ( not ( = ?auto_112319 ?auto_112315 ) ) ( not ( = ?auto_112319 ?auto_112314 ) ) ( not ( = ?auto_112319 ?auto_112318 ) ) ( not ( = ?auto_112316 ?auto_112315 ) ) ( not ( = ?auto_112316 ?auto_112314 ) ) ( not ( = ?auto_112316 ?auto_112318 ) ) ( ON ?auto_112317 ?auto_112316 ) ( ON ?auto_112315 ?auto_112317 ) ( ON ?auto_112318 ?auto_112315 ) ( ON ?auto_112314 ?auto_112318 ) ( CLEAR ?auto_112314 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_112312 ?auto_112313 ?auto_112319 ?auto_112316 ?auto_112317 ?auto_112315 ?auto_112318 )
      ( MAKE-2PILE ?auto_112312 ?auto_112313 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_112326 - BLOCK
      ?auto_112327 - BLOCK
      ?auto_112328 - BLOCK
      ?auto_112329 - BLOCK
      ?auto_112330 - BLOCK
      ?auto_112331 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_112331 ) ( CLEAR ?auto_112330 ) ( ON-TABLE ?auto_112326 ) ( ON ?auto_112327 ?auto_112326 ) ( ON ?auto_112328 ?auto_112327 ) ( ON ?auto_112329 ?auto_112328 ) ( ON ?auto_112330 ?auto_112329 ) ( not ( = ?auto_112326 ?auto_112327 ) ) ( not ( = ?auto_112326 ?auto_112328 ) ) ( not ( = ?auto_112326 ?auto_112329 ) ) ( not ( = ?auto_112326 ?auto_112330 ) ) ( not ( = ?auto_112326 ?auto_112331 ) ) ( not ( = ?auto_112327 ?auto_112328 ) ) ( not ( = ?auto_112327 ?auto_112329 ) ) ( not ( = ?auto_112327 ?auto_112330 ) ) ( not ( = ?auto_112327 ?auto_112331 ) ) ( not ( = ?auto_112328 ?auto_112329 ) ) ( not ( = ?auto_112328 ?auto_112330 ) ) ( not ( = ?auto_112328 ?auto_112331 ) ) ( not ( = ?auto_112329 ?auto_112330 ) ) ( not ( = ?auto_112329 ?auto_112331 ) ) ( not ( = ?auto_112330 ?auto_112331 ) ) )
    :subtasks
    ( ( !STACK ?auto_112331 ?auto_112330 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_112332 - BLOCK
      ?auto_112333 - BLOCK
      ?auto_112334 - BLOCK
      ?auto_112335 - BLOCK
      ?auto_112336 - BLOCK
      ?auto_112337 - BLOCK
    )
    :vars
    (
      ?auto_112338 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_112336 ) ( ON-TABLE ?auto_112332 ) ( ON ?auto_112333 ?auto_112332 ) ( ON ?auto_112334 ?auto_112333 ) ( ON ?auto_112335 ?auto_112334 ) ( ON ?auto_112336 ?auto_112335 ) ( not ( = ?auto_112332 ?auto_112333 ) ) ( not ( = ?auto_112332 ?auto_112334 ) ) ( not ( = ?auto_112332 ?auto_112335 ) ) ( not ( = ?auto_112332 ?auto_112336 ) ) ( not ( = ?auto_112332 ?auto_112337 ) ) ( not ( = ?auto_112333 ?auto_112334 ) ) ( not ( = ?auto_112333 ?auto_112335 ) ) ( not ( = ?auto_112333 ?auto_112336 ) ) ( not ( = ?auto_112333 ?auto_112337 ) ) ( not ( = ?auto_112334 ?auto_112335 ) ) ( not ( = ?auto_112334 ?auto_112336 ) ) ( not ( = ?auto_112334 ?auto_112337 ) ) ( not ( = ?auto_112335 ?auto_112336 ) ) ( not ( = ?auto_112335 ?auto_112337 ) ) ( not ( = ?auto_112336 ?auto_112337 ) ) ( ON ?auto_112337 ?auto_112338 ) ( CLEAR ?auto_112337 ) ( HAND-EMPTY ) ( not ( = ?auto_112332 ?auto_112338 ) ) ( not ( = ?auto_112333 ?auto_112338 ) ) ( not ( = ?auto_112334 ?auto_112338 ) ) ( not ( = ?auto_112335 ?auto_112338 ) ) ( not ( = ?auto_112336 ?auto_112338 ) ) ( not ( = ?auto_112337 ?auto_112338 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_112337 ?auto_112338 )
      ( MAKE-6PILE ?auto_112332 ?auto_112333 ?auto_112334 ?auto_112335 ?auto_112336 ?auto_112337 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_112339 - BLOCK
      ?auto_112340 - BLOCK
      ?auto_112341 - BLOCK
      ?auto_112342 - BLOCK
      ?auto_112343 - BLOCK
      ?auto_112344 - BLOCK
    )
    :vars
    (
      ?auto_112345 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_112339 ) ( ON ?auto_112340 ?auto_112339 ) ( ON ?auto_112341 ?auto_112340 ) ( ON ?auto_112342 ?auto_112341 ) ( not ( = ?auto_112339 ?auto_112340 ) ) ( not ( = ?auto_112339 ?auto_112341 ) ) ( not ( = ?auto_112339 ?auto_112342 ) ) ( not ( = ?auto_112339 ?auto_112343 ) ) ( not ( = ?auto_112339 ?auto_112344 ) ) ( not ( = ?auto_112340 ?auto_112341 ) ) ( not ( = ?auto_112340 ?auto_112342 ) ) ( not ( = ?auto_112340 ?auto_112343 ) ) ( not ( = ?auto_112340 ?auto_112344 ) ) ( not ( = ?auto_112341 ?auto_112342 ) ) ( not ( = ?auto_112341 ?auto_112343 ) ) ( not ( = ?auto_112341 ?auto_112344 ) ) ( not ( = ?auto_112342 ?auto_112343 ) ) ( not ( = ?auto_112342 ?auto_112344 ) ) ( not ( = ?auto_112343 ?auto_112344 ) ) ( ON ?auto_112344 ?auto_112345 ) ( CLEAR ?auto_112344 ) ( not ( = ?auto_112339 ?auto_112345 ) ) ( not ( = ?auto_112340 ?auto_112345 ) ) ( not ( = ?auto_112341 ?auto_112345 ) ) ( not ( = ?auto_112342 ?auto_112345 ) ) ( not ( = ?auto_112343 ?auto_112345 ) ) ( not ( = ?auto_112344 ?auto_112345 ) ) ( HOLDING ?auto_112343 ) ( CLEAR ?auto_112342 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_112339 ?auto_112340 ?auto_112341 ?auto_112342 ?auto_112343 )
      ( MAKE-6PILE ?auto_112339 ?auto_112340 ?auto_112341 ?auto_112342 ?auto_112343 ?auto_112344 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_112346 - BLOCK
      ?auto_112347 - BLOCK
      ?auto_112348 - BLOCK
      ?auto_112349 - BLOCK
      ?auto_112350 - BLOCK
      ?auto_112351 - BLOCK
    )
    :vars
    (
      ?auto_112352 - BLOCK
      ?auto_112353 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_112346 ) ( ON ?auto_112347 ?auto_112346 ) ( ON ?auto_112348 ?auto_112347 ) ( ON ?auto_112349 ?auto_112348 ) ( not ( = ?auto_112346 ?auto_112347 ) ) ( not ( = ?auto_112346 ?auto_112348 ) ) ( not ( = ?auto_112346 ?auto_112349 ) ) ( not ( = ?auto_112346 ?auto_112350 ) ) ( not ( = ?auto_112346 ?auto_112351 ) ) ( not ( = ?auto_112347 ?auto_112348 ) ) ( not ( = ?auto_112347 ?auto_112349 ) ) ( not ( = ?auto_112347 ?auto_112350 ) ) ( not ( = ?auto_112347 ?auto_112351 ) ) ( not ( = ?auto_112348 ?auto_112349 ) ) ( not ( = ?auto_112348 ?auto_112350 ) ) ( not ( = ?auto_112348 ?auto_112351 ) ) ( not ( = ?auto_112349 ?auto_112350 ) ) ( not ( = ?auto_112349 ?auto_112351 ) ) ( not ( = ?auto_112350 ?auto_112351 ) ) ( ON ?auto_112351 ?auto_112352 ) ( not ( = ?auto_112346 ?auto_112352 ) ) ( not ( = ?auto_112347 ?auto_112352 ) ) ( not ( = ?auto_112348 ?auto_112352 ) ) ( not ( = ?auto_112349 ?auto_112352 ) ) ( not ( = ?auto_112350 ?auto_112352 ) ) ( not ( = ?auto_112351 ?auto_112352 ) ) ( CLEAR ?auto_112349 ) ( ON ?auto_112350 ?auto_112351 ) ( CLEAR ?auto_112350 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_112353 ) ( ON ?auto_112352 ?auto_112353 ) ( not ( = ?auto_112353 ?auto_112352 ) ) ( not ( = ?auto_112353 ?auto_112351 ) ) ( not ( = ?auto_112353 ?auto_112350 ) ) ( not ( = ?auto_112346 ?auto_112353 ) ) ( not ( = ?auto_112347 ?auto_112353 ) ) ( not ( = ?auto_112348 ?auto_112353 ) ) ( not ( = ?auto_112349 ?auto_112353 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_112353 ?auto_112352 ?auto_112351 )
      ( MAKE-6PILE ?auto_112346 ?auto_112347 ?auto_112348 ?auto_112349 ?auto_112350 ?auto_112351 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_112354 - BLOCK
      ?auto_112355 - BLOCK
      ?auto_112356 - BLOCK
      ?auto_112357 - BLOCK
      ?auto_112358 - BLOCK
      ?auto_112359 - BLOCK
    )
    :vars
    (
      ?auto_112360 - BLOCK
      ?auto_112361 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_112354 ) ( ON ?auto_112355 ?auto_112354 ) ( ON ?auto_112356 ?auto_112355 ) ( not ( = ?auto_112354 ?auto_112355 ) ) ( not ( = ?auto_112354 ?auto_112356 ) ) ( not ( = ?auto_112354 ?auto_112357 ) ) ( not ( = ?auto_112354 ?auto_112358 ) ) ( not ( = ?auto_112354 ?auto_112359 ) ) ( not ( = ?auto_112355 ?auto_112356 ) ) ( not ( = ?auto_112355 ?auto_112357 ) ) ( not ( = ?auto_112355 ?auto_112358 ) ) ( not ( = ?auto_112355 ?auto_112359 ) ) ( not ( = ?auto_112356 ?auto_112357 ) ) ( not ( = ?auto_112356 ?auto_112358 ) ) ( not ( = ?auto_112356 ?auto_112359 ) ) ( not ( = ?auto_112357 ?auto_112358 ) ) ( not ( = ?auto_112357 ?auto_112359 ) ) ( not ( = ?auto_112358 ?auto_112359 ) ) ( ON ?auto_112359 ?auto_112360 ) ( not ( = ?auto_112354 ?auto_112360 ) ) ( not ( = ?auto_112355 ?auto_112360 ) ) ( not ( = ?auto_112356 ?auto_112360 ) ) ( not ( = ?auto_112357 ?auto_112360 ) ) ( not ( = ?auto_112358 ?auto_112360 ) ) ( not ( = ?auto_112359 ?auto_112360 ) ) ( ON ?auto_112358 ?auto_112359 ) ( CLEAR ?auto_112358 ) ( ON-TABLE ?auto_112361 ) ( ON ?auto_112360 ?auto_112361 ) ( not ( = ?auto_112361 ?auto_112360 ) ) ( not ( = ?auto_112361 ?auto_112359 ) ) ( not ( = ?auto_112361 ?auto_112358 ) ) ( not ( = ?auto_112354 ?auto_112361 ) ) ( not ( = ?auto_112355 ?auto_112361 ) ) ( not ( = ?auto_112356 ?auto_112361 ) ) ( not ( = ?auto_112357 ?auto_112361 ) ) ( HOLDING ?auto_112357 ) ( CLEAR ?auto_112356 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_112354 ?auto_112355 ?auto_112356 ?auto_112357 )
      ( MAKE-6PILE ?auto_112354 ?auto_112355 ?auto_112356 ?auto_112357 ?auto_112358 ?auto_112359 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_112362 - BLOCK
      ?auto_112363 - BLOCK
      ?auto_112364 - BLOCK
      ?auto_112365 - BLOCK
      ?auto_112366 - BLOCK
      ?auto_112367 - BLOCK
    )
    :vars
    (
      ?auto_112369 - BLOCK
      ?auto_112368 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_112362 ) ( ON ?auto_112363 ?auto_112362 ) ( ON ?auto_112364 ?auto_112363 ) ( not ( = ?auto_112362 ?auto_112363 ) ) ( not ( = ?auto_112362 ?auto_112364 ) ) ( not ( = ?auto_112362 ?auto_112365 ) ) ( not ( = ?auto_112362 ?auto_112366 ) ) ( not ( = ?auto_112362 ?auto_112367 ) ) ( not ( = ?auto_112363 ?auto_112364 ) ) ( not ( = ?auto_112363 ?auto_112365 ) ) ( not ( = ?auto_112363 ?auto_112366 ) ) ( not ( = ?auto_112363 ?auto_112367 ) ) ( not ( = ?auto_112364 ?auto_112365 ) ) ( not ( = ?auto_112364 ?auto_112366 ) ) ( not ( = ?auto_112364 ?auto_112367 ) ) ( not ( = ?auto_112365 ?auto_112366 ) ) ( not ( = ?auto_112365 ?auto_112367 ) ) ( not ( = ?auto_112366 ?auto_112367 ) ) ( ON ?auto_112367 ?auto_112369 ) ( not ( = ?auto_112362 ?auto_112369 ) ) ( not ( = ?auto_112363 ?auto_112369 ) ) ( not ( = ?auto_112364 ?auto_112369 ) ) ( not ( = ?auto_112365 ?auto_112369 ) ) ( not ( = ?auto_112366 ?auto_112369 ) ) ( not ( = ?auto_112367 ?auto_112369 ) ) ( ON ?auto_112366 ?auto_112367 ) ( ON-TABLE ?auto_112368 ) ( ON ?auto_112369 ?auto_112368 ) ( not ( = ?auto_112368 ?auto_112369 ) ) ( not ( = ?auto_112368 ?auto_112367 ) ) ( not ( = ?auto_112368 ?auto_112366 ) ) ( not ( = ?auto_112362 ?auto_112368 ) ) ( not ( = ?auto_112363 ?auto_112368 ) ) ( not ( = ?auto_112364 ?auto_112368 ) ) ( not ( = ?auto_112365 ?auto_112368 ) ) ( CLEAR ?auto_112364 ) ( ON ?auto_112365 ?auto_112366 ) ( CLEAR ?auto_112365 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_112368 ?auto_112369 ?auto_112367 ?auto_112366 )
      ( MAKE-6PILE ?auto_112362 ?auto_112363 ?auto_112364 ?auto_112365 ?auto_112366 ?auto_112367 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_112370 - BLOCK
      ?auto_112371 - BLOCK
      ?auto_112372 - BLOCK
      ?auto_112373 - BLOCK
      ?auto_112374 - BLOCK
      ?auto_112375 - BLOCK
    )
    :vars
    (
      ?auto_112377 - BLOCK
      ?auto_112376 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_112370 ) ( ON ?auto_112371 ?auto_112370 ) ( not ( = ?auto_112370 ?auto_112371 ) ) ( not ( = ?auto_112370 ?auto_112372 ) ) ( not ( = ?auto_112370 ?auto_112373 ) ) ( not ( = ?auto_112370 ?auto_112374 ) ) ( not ( = ?auto_112370 ?auto_112375 ) ) ( not ( = ?auto_112371 ?auto_112372 ) ) ( not ( = ?auto_112371 ?auto_112373 ) ) ( not ( = ?auto_112371 ?auto_112374 ) ) ( not ( = ?auto_112371 ?auto_112375 ) ) ( not ( = ?auto_112372 ?auto_112373 ) ) ( not ( = ?auto_112372 ?auto_112374 ) ) ( not ( = ?auto_112372 ?auto_112375 ) ) ( not ( = ?auto_112373 ?auto_112374 ) ) ( not ( = ?auto_112373 ?auto_112375 ) ) ( not ( = ?auto_112374 ?auto_112375 ) ) ( ON ?auto_112375 ?auto_112377 ) ( not ( = ?auto_112370 ?auto_112377 ) ) ( not ( = ?auto_112371 ?auto_112377 ) ) ( not ( = ?auto_112372 ?auto_112377 ) ) ( not ( = ?auto_112373 ?auto_112377 ) ) ( not ( = ?auto_112374 ?auto_112377 ) ) ( not ( = ?auto_112375 ?auto_112377 ) ) ( ON ?auto_112374 ?auto_112375 ) ( ON-TABLE ?auto_112376 ) ( ON ?auto_112377 ?auto_112376 ) ( not ( = ?auto_112376 ?auto_112377 ) ) ( not ( = ?auto_112376 ?auto_112375 ) ) ( not ( = ?auto_112376 ?auto_112374 ) ) ( not ( = ?auto_112370 ?auto_112376 ) ) ( not ( = ?auto_112371 ?auto_112376 ) ) ( not ( = ?auto_112372 ?auto_112376 ) ) ( not ( = ?auto_112373 ?auto_112376 ) ) ( ON ?auto_112373 ?auto_112374 ) ( CLEAR ?auto_112373 ) ( HOLDING ?auto_112372 ) ( CLEAR ?auto_112371 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_112370 ?auto_112371 ?auto_112372 )
      ( MAKE-6PILE ?auto_112370 ?auto_112371 ?auto_112372 ?auto_112373 ?auto_112374 ?auto_112375 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_112378 - BLOCK
      ?auto_112379 - BLOCK
      ?auto_112380 - BLOCK
      ?auto_112381 - BLOCK
      ?auto_112382 - BLOCK
      ?auto_112383 - BLOCK
    )
    :vars
    (
      ?auto_112384 - BLOCK
      ?auto_112385 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_112378 ) ( ON ?auto_112379 ?auto_112378 ) ( not ( = ?auto_112378 ?auto_112379 ) ) ( not ( = ?auto_112378 ?auto_112380 ) ) ( not ( = ?auto_112378 ?auto_112381 ) ) ( not ( = ?auto_112378 ?auto_112382 ) ) ( not ( = ?auto_112378 ?auto_112383 ) ) ( not ( = ?auto_112379 ?auto_112380 ) ) ( not ( = ?auto_112379 ?auto_112381 ) ) ( not ( = ?auto_112379 ?auto_112382 ) ) ( not ( = ?auto_112379 ?auto_112383 ) ) ( not ( = ?auto_112380 ?auto_112381 ) ) ( not ( = ?auto_112380 ?auto_112382 ) ) ( not ( = ?auto_112380 ?auto_112383 ) ) ( not ( = ?auto_112381 ?auto_112382 ) ) ( not ( = ?auto_112381 ?auto_112383 ) ) ( not ( = ?auto_112382 ?auto_112383 ) ) ( ON ?auto_112383 ?auto_112384 ) ( not ( = ?auto_112378 ?auto_112384 ) ) ( not ( = ?auto_112379 ?auto_112384 ) ) ( not ( = ?auto_112380 ?auto_112384 ) ) ( not ( = ?auto_112381 ?auto_112384 ) ) ( not ( = ?auto_112382 ?auto_112384 ) ) ( not ( = ?auto_112383 ?auto_112384 ) ) ( ON ?auto_112382 ?auto_112383 ) ( ON-TABLE ?auto_112385 ) ( ON ?auto_112384 ?auto_112385 ) ( not ( = ?auto_112385 ?auto_112384 ) ) ( not ( = ?auto_112385 ?auto_112383 ) ) ( not ( = ?auto_112385 ?auto_112382 ) ) ( not ( = ?auto_112378 ?auto_112385 ) ) ( not ( = ?auto_112379 ?auto_112385 ) ) ( not ( = ?auto_112380 ?auto_112385 ) ) ( not ( = ?auto_112381 ?auto_112385 ) ) ( ON ?auto_112381 ?auto_112382 ) ( CLEAR ?auto_112379 ) ( ON ?auto_112380 ?auto_112381 ) ( CLEAR ?auto_112380 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_112385 ?auto_112384 ?auto_112383 ?auto_112382 ?auto_112381 )
      ( MAKE-6PILE ?auto_112378 ?auto_112379 ?auto_112380 ?auto_112381 ?auto_112382 ?auto_112383 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_112386 - BLOCK
      ?auto_112387 - BLOCK
      ?auto_112388 - BLOCK
      ?auto_112389 - BLOCK
      ?auto_112390 - BLOCK
      ?auto_112391 - BLOCK
    )
    :vars
    (
      ?auto_112393 - BLOCK
      ?auto_112392 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_112386 ) ( not ( = ?auto_112386 ?auto_112387 ) ) ( not ( = ?auto_112386 ?auto_112388 ) ) ( not ( = ?auto_112386 ?auto_112389 ) ) ( not ( = ?auto_112386 ?auto_112390 ) ) ( not ( = ?auto_112386 ?auto_112391 ) ) ( not ( = ?auto_112387 ?auto_112388 ) ) ( not ( = ?auto_112387 ?auto_112389 ) ) ( not ( = ?auto_112387 ?auto_112390 ) ) ( not ( = ?auto_112387 ?auto_112391 ) ) ( not ( = ?auto_112388 ?auto_112389 ) ) ( not ( = ?auto_112388 ?auto_112390 ) ) ( not ( = ?auto_112388 ?auto_112391 ) ) ( not ( = ?auto_112389 ?auto_112390 ) ) ( not ( = ?auto_112389 ?auto_112391 ) ) ( not ( = ?auto_112390 ?auto_112391 ) ) ( ON ?auto_112391 ?auto_112393 ) ( not ( = ?auto_112386 ?auto_112393 ) ) ( not ( = ?auto_112387 ?auto_112393 ) ) ( not ( = ?auto_112388 ?auto_112393 ) ) ( not ( = ?auto_112389 ?auto_112393 ) ) ( not ( = ?auto_112390 ?auto_112393 ) ) ( not ( = ?auto_112391 ?auto_112393 ) ) ( ON ?auto_112390 ?auto_112391 ) ( ON-TABLE ?auto_112392 ) ( ON ?auto_112393 ?auto_112392 ) ( not ( = ?auto_112392 ?auto_112393 ) ) ( not ( = ?auto_112392 ?auto_112391 ) ) ( not ( = ?auto_112392 ?auto_112390 ) ) ( not ( = ?auto_112386 ?auto_112392 ) ) ( not ( = ?auto_112387 ?auto_112392 ) ) ( not ( = ?auto_112388 ?auto_112392 ) ) ( not ( = ?auto_112389 ?auto_112392 ) ) ( ON ?auto_112389 ?auto_112390 ) ( ON ?auto_112388 ?auto_112389 ) ( CLEAR ?auto_112388 ) ( HOLDING ?auto_112387 ) ( CLEAR ?auto_112386 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_112386 ?auto_112387 )
      ( MAKE-6PILE ?auto_112386 ?auto_112387 ?auto_112388 ?auto_112389 ?auto_112390 ?auto_112391 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_112394 - BLOCK
      ?auto_112395 - BLOCK
      ?auto_112396 - BLOCK
      ?auto_112397 - BLOCK
      ?auto_112398 - BLOCK
      ?auto_112399 - BLOCK
    )
    :vars
    (
      ?auto_112401 - BLOCK
      ?auto_112400 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_112394 ) ( not ( = ?auto_112394 ?auto_112395 ) ) ( not ( = ?auto_112394 ?auto_112396 ) ) ( not ( = ?auto_112394 ?auto_112397 ) ) ( not ( = ?auto_112394 ?auto_112398 ) ) ( not ( = ?auto_112394 ?auto_112399 ) ) ( not ( = ?auto_112395 ?auto_112396 ) ) ( not ( = ?auto_112395 ?auto_112397 ) ) ( not ( = ?auto_112395 ?auto_112398 ) ) ( not ( = ?auto_112395 ?auto_112399 ) ) ( not ( = ?auto_112396 ?auto_112397 ) ) ( not ( = ?auto_112396 ?auto_112398 ) ) ( not ( = ?auto_112396 ?auto_112399 ) ) ( not ( = ?auto_112397 ?auto_112398 ) ) ( not ( = ?auto_112397 ?auto_112399 ) ) ( not ( = ?auto_112398 ?auto_112399 ) ) ( ON ?auto_112399 ?auto_112401 ) ( not ( = ?auto_112394 ?auto_112401 ) ) ( not ( = ?auto_112395 ?auto_112401 ) ) ( not ( = ?auto_112396 ?auto_112401 ) ) ( not ( = ?auto_112397 ?auto_112401 ) ) ( not ( = ?auto_112398 ?auto_112401 ) ) ( not ( = ?auto_112399 ?auto_112401 ) ) ( ON ?auto_112398 ?auto_112399 ) ( ON-TABLE ?auto_112400 ) ( ON ?auto_112401 ?auto_112400 ) ( not ( = ?auto_112400 ?auto_112401 ) ) ( not ( = ?auto_112400 ?auto_112399 ) ) ( not ( = ?auto_112400 ?auto_112398 ) ) ( not ( = ?auto_112394 ?auto_112400 ) ) ( not ( = ?auto_112395 ?auto_112400 ) ) ( not ( = ?auto_112396 ?auto_112400 ) ) ( not ( = ?auto_112397 ?auto_112400 ) ) ( ON ?auto_112397 ?auto_112398 ) ( ON ?auto_112396 ?auto_112397 ) ( CLEAR ?auto_112394 ) ( ON ?auto_112395 ?auto_112396 ) ( CLEAR ?auto_112395 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_112400 ?auto_112401 ?auto_112399 ?auto_112398 ?auto_112397 ?auto_112396 )
      ( MAKE-6PILE ?auto_112394 ?auto_112395 ?auto_112396 ?auto_112397 ?auto_112398 ?auto_112399 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_112402 - BLOCK
      ?auto_112403 - BLOCK
      ?auto_112404 - BLOCK
      ?auto_112405 - BLOCK
      ?auto_112406 - BLOCK
      ?auto_112407 - BLOCK
    )
    :vars
    (
      ?auto_112409 - BLOCK
      ?auto_112408 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_112402 ?auto_112403 ) ) ( not ( = ?auto_112402 ?auto_112404 ) ) ( not ( = ?auto_112402 ?auto_112405 ) ) ( not ( = ?auto_112402 ?auto_112406 ) ) ( not ( = ?auto_112402 ?auto_112407 ) ) ( not ( = ?auto_112403 ?auto_112404 ) ) ( not ( = ?auto_112403 ?auto_112405 ) ) ( not ( = ?auto_112403 ?auto_112406 ) ) ( not ( = ?auto_112403 ?auto_112407 ) ) ( not ( = ?auto_112404 ?auto_112405 ) ) ( not ( = ?auto_112404 ?auto_112406 ) ) ( not ( = ?auto_112404 ?auto_112407 ) ) ( not ( = ?auto_112405 ?auto_112406 ) ) ( not ( = ?auto_112405 ?auto_112407 ) ) ( not ( = ?auto_112406 ?auto_112407 ) ) ( ON ?auto_112407 ?auto_112409 ) ( not ( = ?auto_112402 ?auto_112409 ) ) ( not ( = ?auto_112403 ?auto_112409 ) ) ( not ( = ?auto_112404 ?auto_112409 ) ) ( not ( = ?auto_112405 ?auto_112409 ) ) ( not ( = ?auto_112406 ?auto_112409 ) ) ( not ( = ?auto_112407 ?auto_112409 ) ) ( ON ?auto_112406 ?auto_112407 ) ( ON-TABLE ?auto_112408 ) ( ON ?auto_112409 ?auto_112408 ) ( not ( = ?auto_112408 ?auto_112409 ) ) ( not ( = ?auto_112408 ?auto_112407 ) ) ( not ( = ?auto_112408 ?auto_112406 ) ) ( not ( = ?auto_112402 ?auto_112408 ) ) ( not ( = ?auto_112403 ?auto_112408 ) ) ( not ( = ?auto_112404 ?auto_112408 ) ) ( not ( = ?auto_112405 ?auto_112408 ) ) ( ON ?auto_112405 ?auto_112406 ) ( ON ?auto_112404 ?auto_112405 ) ( ON ?auto_112403 ?auto_112404 ) ( CLEAR ?auto_112403 ) ( HOLDING ?auto_112402 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_112402 )
      ( MAKE-6PILE ?auto_112402 ?auto_112403 ?auto_112404 ?auto_112405 ?auto_112406 ?auto_112407 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_112410 - BLOCK
      ?auto_112411 - BLOCK
      ?auto_112412 - BLOCK
      ?auto_112413 - BLOCK
      ?auto_112414 - BLOCK
      ?auto_112415 - BLOCK
    )
    :vars
    (
      ?auto_112417 - BLOCK
      ?auto_112416 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_112410 ?auto_112411 ) ) ( not ( = ?auto_112410 ?auto_112412 ) ) ( not ( = ?auto_112410 ?auto_112413 ) ) ( not ( = ?auto_112410 ?auto_112414 ) ) ( not ( = ?auto_112410 ?auto_112415 ) ) ( not ( = ?auto_112411 ?auto_112412 ) ) ( not ( = ?auto_112411 ?auto_112413 ) ) ( not ( = ?auto_112411 ?auto_112414 ) ) ( not ( = ?auto_112411 ?auto_112415 ) ) ( not ( = ?auto_112412 ?auto_112413 ) ) ( not ( = ?auto_112412 ?auto_112414 ) ) ( not ( = ?auto_112412 ?auto_112415 ) ) ( not ( = ?auto_112413 ?auto_112414 ) ) ( not ( = ?auto_112413 ?auto_112415 ) ) ( not ( = ?auto_112414 ?auto_112415 ) ) ( ON ?auto_112415 ?auto_112417 ) ( not ( = ?auto_112410 ?auto_112417 ) ) ( not ( = ?auto_112411 ?auto_112417 ) ) ( not ( = ?auto_112412 ?auto_112417 ) ) ( not ( = ?auto_112413 ?auto_112417 ) ) ( not ( = ?auto_112414 ?auto_112417 ) ) ( not ( = ?auto_112415 ?auto_112417 ) ) ( ON ?auto_112414 ?auto_112415 ) ( ON-TABLE ?auto_112416 ) ( ON ?auto_112417 ?auto_112416 ) ( not ( = ?auto_112416 ?auto_112417 ) ) ( not ( = ?auto_112416 ?auto_112415 ) ) ( not ( = ?auto_112416 ?auto_112414 ) ) ( not ( = ?auto_112410 ?auto_112416 ) ) ( not ( = ?auto_112411 ?auto_112416 ) ) ( not ( = ?auto_112412 ?auto_112416 ) ) ( not ( = ?auto_112413 ?auto_112416 ) ) ( ON ?auto_112413 ?auto_112414 ) ( ON ?auto_112412 ?auto_112413 ) ( ON ?auto_112411 ?auto_112412 ) ( ON ?auto_112410 ?auto_112411 ) ( CLEAR ?auto_112410 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_112416 ?auto_112417 ?auto_112415 ?auto_112414 ?auto_112413 ?auto_112412 ?auto_112411 )
      ( MAKE-6PILE ?auto_112410 ?auto_112411 ?auto_112412 ?auto_112413 ?auto_112414 ?auto_112415 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_112419 - BLOCK
    )
    :vars
    (
      ?auto_112420 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112420 ?auto_112419 ) ( CLEAR ?auto_112420 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_112419 ) ( not ( = ?auto_112419 ?auto_112420 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_112420 ?auto_112419 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_112421 - BLOCK
    )
    :vars
    (
      ?auto_112422 - BLOCK
      ?auto_112423 - BLOCK
      ?auto_112424 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112422 ?auto_112421 ) ( CLEAR ?auto_112422 ) ( ON-TABLE ?auto_112421 ) ( not ( = ?auto_112421 ?auto_112422 ) ) ( HOLDING ?auto_112423 ) ( CLEAR ?auto_112424 ) ( not ( = ?auto_112421 ?auto_112423 ) ) ( not ( = ?auto_112421 ?auto_112424 ) ) ( not ( = ?auto_112422 ?auto_112423 ) ) ( not ( = ?auto_112422 ?auto_112424 ) ) ( not ( = ?auto_112423 ?auto_112424 ) ) )
    :subtasks
    ( ( !STACK ?auto_112423 ?auto_112424 )
      ( MAKE-1PILE ?auto_112421 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_112425 - BLOCK
    )
    :vars
    (
      ?auto_112428 - BLOCK
      ?auto_112426 - BLOCK
      ?auto_112427 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112428 ?auto_112425 ) ( ON-TABLE ?auto_112425 ) ( not ( = ?auto_112425 ?auto_112428 ) ) ( CLEAR ?auto_112426 ) ( not ( = ?auto_112425 ?auto_112427 ) ) ( not ( = ?auto_112425 ?auto_112426 ) ) ( not ( = ?auto_112428 ?auto_112427 ) ) ( not ( = ?auto_112428 ?auto_112426 ) ) ( not ( = ?auto_112427 ?auto_112426 ) ) ( ON ?auto_112427 ?auto_112428 ) ( CLEAR ?auto_112427 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_112425 ?auto_112428 )
      ( MAKE-1PILE ?auto_112425 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_112429 - BLOCK
    )
    :vars
    (
      ?auto_112432 - BLOCK
      ?auto_112431 - BLOCK
      ?auto_112430 - BLOCK
      ?auto_112435 - BLOCK
      ?auto_112436 - BLOCK
      ?auto_112434 - BLOCK
      ?auto_112433 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112432 ?auto_112429 ) ( ON-TABLE ?auto_112429 ) ( not ( = ?auto_112429 ?auto_112432 ) ) ( not ( = ?auto_112429 ?auto_112431 ) ) ( not ( = ?auto_112429 ?auto_112430 ) ) ( not ( = ?auto_112432 ?auto_112431 ) ) ( not ( = ?auto_112432 ?auto_112430 ) ) ( not ( = ?auto_112431 ?auto_112430 ) ) ( ON ?auto_112431 ?auto_112432 ) ( CLEAR ?auto_112431 ) ( HOLDING ?auto_112430 ) ( CLEAR ?auto_112435 ) ( ON-TABLE ?auto_112436 ) ( ON ?auto_112434 ?auto_112436 ) ( ON ?auto_112433 ?auto_112434 ) ( ON ?auto_112435 ?auto_112433 ) ( not ( = ?auto_112436 ?auto_112434 ) ) ( not ( = ?auto_112436 ?auto_112433 ) ) ( not ( = ?auto_112436 ?auto_112435 ) ) ( not ( = ?auto_112436 ?auto_112430 ) ) ( not ( = ?auto_112434 ?auto_112433 ) ) ( not ( = ?auto_112434 ?auto_112435 ) ) ( not ( = ?auto_112434 ?auto_112430 ) ) ( not ( = ?auto_112433 ?auto_112435 ) ) ( not ( = ?auto_112433 ?auto_112430 ) ) ( not ( = ?auto_112435 ?auto_112430 ) ) ( not ( = ?auto_112429 ?auto_112435 ) ) ( not ( = ?auto_112429 ?auto_112436 ) ) ( not ( = ?auto_112429 ?auto_112434 ) ) ( not ( = ?auto_112429 ?auto_112433 ) ) ( not ( = ?auto_112432 ?auto_112435 ) ) ( not ( = ?auto_112432 ?auto_112436 ) ) ( not ( = ?auto_112432 ?auto_112434 ) ) ( not ( = ?auto_112432 ?auto_112433 ) ) ( not ( = ?auto_112431 ?auto_112435 ) ) ( not ( = ?auto_112431 ?auto_112436 ) ) ( not ( = ?auto_112431 ?auto_112434 ) ) ( not ( = ?auto_112431 ?auto_112433 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_112436 ?auto_112434 ?auto_112433 ?auto_112435 ?auto_112430 )
      ( MAKE-1PILE ?auto_112429 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_112437 - BLOCK
    )
    :vars
    (
      ?auto_112443 - BLOCK
      ?auto_112441 - BLOCK
      ?auto_112444 - BLOCK
      ?auto_112439 - BLOCK
      ?auto_112440 - BLOCK
      ?auto_112438 - BLOCK
      ?auto_112442 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112443 ?auto_112437 ) ( ON-TABLE ?auto_112437 ) ( not ( = ?auto_112437 ?auto_112443 ) ) ( not ( = ?auto_112437 ?auto_112441 ) ) ( not ( = ?auto_112437 ?auto_112444 ) ) ( not ( = ?auto_112443 ?auto_112441 ) ) ( not ( = ?auto_112443 ?auto_112444 ) ) ( not ( = ?auto_112441 ?auto_112444 ) ) ( ON ?auto_112441 ?auto_112443 ) ( CLEAR ?auto_112439 ) ( ON-TABLE ?auto_112440 ) ( ON ?auto_112438 ?auto_112440 ) ( ON ?auto_112442 ?auto_112438 ) ( ON ?auto_112439 ?auto_112442 ) ( not ( = ?auto_112440 ?auto_112438 ) ) ( not ( = ?auto_112440 ?auto_112442 ) ) ( not ( = ?auto_112440 ?auto_112439 ) ) ( not ( = ?auto_112440 ?auto_112444 ) ) ( not ( = ?auto_112438 ?auto_112442 ) ) ( not ( = ?auto_112438 ?auto_112439 ) ) ( not ( = ?auto_112438 ?auto_112444 ) ) ( not ( = ?auto_112442 ?auto_112439 ) ) ( not ( = ?auto_112442 ?auto_112444 ) ) ( not ( = ?auto_112439 ?auto_112444 ) ) ( not ( = ?auto_112437 ?auto_112439 ) ) ( not ( = ?auto_112437 ?auto_112440 ) ) ( not ( = ?auto_112437 ?auto_112438 ) ) ( not ( = ?auto_112437 ?auto_112442 ) ) ( not ( = ?auto_112443 ?auto_112439 ) ) ( not ( = ?auto_112443 ?auto_112440 ) ) ( not ( = ?auto_112443 ?auto_112438 ) ) ( not ( = ?auto_112443 ?auto_112442 ) ) ( not ( = ?auto_112441 ?auto_112439 ) ) ( not ( = ?auto_112441 ?auto_112440 ) ) ( not ( = ?auto_112441 ?auto_112438 ) ) ( not ( = ?auto_112441 ?auto_112442 ) ) ( ON ?auto_112444 ?auto_112441 ) ( CLEAR ?auto_112444 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_112437 ?auto_112443 ?auto_112441 )
      ( MAKE-1PILE ?auto_112437 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_112445 - BLOCK
    )
    :vars
    (
      ?auto_112448 - BLOCK
      ?auto_112450 - BLOCK
      ?auto_112451 - BLOCK
      ?auto_112449 - BLOCK
      ?auto_112446 - BLOCK
      ?auto_112452 - BLOCK
      ?auto_112447 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112448 ?auto_112445 ) ( ON-TABLE ?auto_112445 ) ( not ( = ?auto_112445 ?auto_112448 ) ) ( not ( = ?auto_112445 ?auto_112450 ) ) ( not ( = ?auto_112445 ?auto_112451 ) ) ( not ( = ?auto_112448 ?auto_112450 ) ) ( not ( = ?auto_112448 ?auto_112451 ) ) ( not ( = ?auto_112450 ?auto_112451 ) ) ( ON ?auto_112450 ?auto_112448 ) ( ON-TABLE ?auto_112449 ) ( ON ?auto_112446 ?auto_112449 ) ( ON ?auto_112452 ?auto_112446 ) ( not ( = ?auto_112449 ?auto_112446 ) ) ( not ( = ?auto_112449 ?auto_112452 ) ) ( not ( = ?auto_112449 ?auto_112447 ) ) ( not ( = ?auto_112449 ?auto_112451 ) ) ( not ( = ?auto_112446 ?auto_112452 ) ) ( not ( = ?auto_112446 ?auto_112447 ) ) ( not ( = ?auto_112446 ?auto_112451 ) ) ( not ( = ?auto_112452 ?auto_112447 ) ) ( not ( = ?auto_112452 ?auto_112451 ) ) ( not ( = ?auto_112447 ?auto_112451 ) ) ( not ( = ?auto_112445 ?auto_112447 ) ) ( not ( = ?auto_112445 ?auto_112449 ) ) ( not ( = ?auto_112445 ?auto_112446 ) ) ( not ( = ?auto_112445 ?auto_112452 ) ) ( not ( = ?auto_112448 ?auto_112447 ) ) ( not ( = ?auto_112448 ?auto_112449 ) ) ( not ( = ?auto_112448 ?auto_112446 ) ) ( not ( = ?auto_112448 ?auto_112452 ) ) ( not ( = ?auto_112450 ?auto_112447 ) ) ( not ( = ?auto_112450 ?auto_112449 ) ) ( not ( = ?auto_112450 ?auto_112446 ) ) ( not ( = ?auto_112450 ?auto_112452 ) ) ( ON ?auto_112451 ?auto_112450 ) ( CLEAR ?auto_112451 ) ( HOLDING ?auto_112447 ) ( CLEAR ?auto_112452 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_112449 ?auto_112446 ?auto_112452 ?auto_112447 )
      ( MAKE-1PILE ?auto_112445 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_112453 - BLOCK
    )
    :vars
    (
      ?auto_112458 - BLOCK
      ?auto_112456 - BLOCK
      ?auto_112460 - BLOCK
      ?auto_112455 - BLOCK
      ?auto_112457 - BLOCK
      ?auto_112454 - BLOCK
      ?auto_112459 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112458 ?auto_112453 ) ( ON-TABLE ?auto_112453 ) ( not ( = ?auto_112453 ?auto_112458 ) ) ( not ( = ?auto_112453 ?auto_112456 ) ) ( not ( = ?auto_112453 ?auto_112460 ) ) ( not ( = ?auto_112458 ?auto_112456 ) ) ( not ( = ?auto_112458 ?auto_112460 ) ) ( not ( = ?auto_112456 ?auto_112460 ) ) ( ON ?auto_112456 ?auto_112458 ) ( ON-TABLE ?auto_112455 ) ( ON ?auto_112457 ?auto_112455 ) ( ON ?auto_112454 ?auto_112457 ) ( not ( = ?auto_112455 ?auto_112457 ) ) ( not ( = ?auto_112455 ?auto_112454 ) ) ( not ( = ?auto_112455 ?auto_112459 ) ) ( not ( = ?auto_112455 ?auto_112460 ) ) ( not ( = ?auto_112457 ?auto_112454 ) ) ( not ( = ?auto_112457 ?auto_112459 ) ) ( not ( = ?auto_112457 ?auto_112460 ) ) ( not ( = ?auto_112454 ?auto_112459 ) ) ( not ( = ?auto_112454 ?auto_112460 ) ) ( not ( = ?auto_112459 ?auto_112460 ) ) ( not ( = ?auto_112453 ?auto_112459 ) ) ( not ( = ?auto_112453 ?auto_112455 ) ) ( not ( = ?auto_112453 ?auto_112457 ) ) ( not ( = ?auto_112453 ?auto_112454 ) ) ( not ( = ?auto_112458 ?auto_112459 ) ) ( not ( = ?auto_112458 ?auto_112455 ) ) ( not ( = ?auto_112458 ?auto_112457 ) ) ( not ( = ?auto_112458 ?auto_112454 ) ) ( not ( = ?auto_112456 ?auto_112459 ) ) ( not ( = ?auto_112456 ?auto_112455 ) ) ( not ( = ?auto_112456 ?auto_112457 ) ) ( not ( = ?auto_112456 ?auto_112454 ) ) ( ON ?auto_112460 ?auto_112456 ) ( CLEAR ?auto_112454 ) ( ON ?auto_112459 ?auto_112460 ) ( CLEAR ?auto_112459 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_112453 ?auto_112458 ?auto_112456 ?auto_112460 )
      ( MAKE-1PILE ?auto_112453 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_112461 - BLOCK
    )
    :vars
    (
      ?auto_112465 - BLOCK
      ?auto_112468 - BLOCK
      ?auto_112462 - BLOCK
      ?auto_112464 - BLOCK
      ?auto_112467 - BLOCK
      ?auto_112463 - BLOCK
      ?auto_112466 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112465 ?auto_112461 ) ( ON-TABLE ?auto_112461 ) ( not ( = ?auto_112461 ?auto_112465 ) ) ( not ( = ?auto_112461 ?auto_112468 ) ) ( not ( = ?auto_112461 ?auto_112462 ) ) ( not ( = ?auto_112465 ?auto_112468 ) ) ( not ( = ?auto_112465 ?auto_112462 ) ) ( not ( = ?auto_112468 ?auto_112462 ) ) ( ON ?auto_112468 ?auto_112465 ) ( ON-TABLE ?auto_112464 ) ( ON ?auto_112467 ?auto_112464 ) ( not ( = ?auto_112464 ?auto_112467 ) ) ( not ( = ?auto_112464 ?auto_112463 ) ) ( not ( = ?auto_112464 ?auto_112466 ) ) ( not ( = ?auto_112464 ?auto_112462 ) ) ( not ( = ?auto_112467 ?auto_112463 ) ) ( not ( = ?auto_112467 ?auto_112466 ) ) ( not ( = ?auto_112467 ?auto_112462 ) ) ( not ( = ?auto_112463 ?auto_112466 ) ) ( not ( = ?auto_112463 ?auto_112462 ) ) ( not ( = ?auto_112466 ?auto_112462 ) ) ( not ( = ?auto_112461 ?auto_112466 ) ) ( not ( = ?auto_112461 ?auto_112464 ) ) ( not ( = ?auto_112461 ?auto_112467 ) ) ( not ( = ?auto_112461 ?auto_112463 ) ) ( not ( = ?auto_112465 ?auto_112466 ) ) ( not ( = ?auto_112465 ?auto_112464 ) ) ( not ( = ?auto_112465 ?auto_112467 ) ) ( not ( = ?auto_112465 ?auto_112463 ) ) ( not ( = ?auto_112468 ?auto_112466 ) ) ( not ( = ?auto_112468 ?auto_112464 ) ) ( not ( = ?auto_112468 ?auto_112467 ) ) ( not ( = ?auto_112468 ?auto_112463 ) ) ( ON ?auto_112462 ?auto_112468 ) ( ON ?auto_112466 ?auto_112462 ) ( CLEAR ?auto_112466 ) ( HOLDING ?auto_112463 ) ( CLEAR ?auto_112467 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_112464 ?auto_112467 ?auto_112463 )
      ( MAKE-1PILE ?auto_112461 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_112469 - BLOCK
    )
    :vars
    (
      ?auto_112471 - BLOCK
      ?auto_112470 - BLOCK
      ?auto_112473 - BLOCK
      ?auto_112475 - BLOCK
      ?auto_112472 - BLOCK
      ?auto_112476 - BLOCK
      ?auto_112474 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112471 ?auto_112469 ) ( ON-TABLE ?auto_112469 ) ( not ( = ?auto_112469 ?auto_112471 ) ) ( not ( = ?auto_112469 ?auto_112470 ) ) ( not ( = ?auto_112469 ?auto_112473 ) ) ( not ( = ?auto_112471 ?auto_112470 ) ) ( not ( = ?auto_112471 ?auto_112473 ) ) ( not ( = ?auto_112470 ?auto_112473 ) ) ( ON ?auto_112470 ?auto_112471 ) ( ON-TABLE ?auto_112475 ) ( ON ?auto_112472 ?auto_112475 ) ( not ( = ?auto_112475 ?auto_112472 ) ) ( not ( = ?auto_112475 ?auto_112476 ) ) ( not ( = ?auto_112475 ?auto_112474 ) ) ( not ( = ?auto_112475 ?auto_112473 ) ) ( not ( = ?auto_112472 ?auto_112476 ) ) ( not ( = ?auto_112472 ?auto_112474 ) ) ( not ( = ?auto_112472 ?auto_112473 ) ) ( not ( = ?auto_112476 ?auto_112474 ) ) ( not ( = ?auto_112476 ?auto_112473 ) ) ( not ( = ?auto_112474 ?auto_112473 ) ) ( not ( = ?auto_112469 ?auto_112474 ) ) ( not ( = ?auto_112469 ?auto_112475 ) ) ( not ( = ?auto_112469 ?auto_112472 ) ) ( not ( = ?auto_112469 ?auto_112476 ) ) ( not ( = ?auto_112471 ?auto_112474 ) ) ( not ( = ?auto_112471 ?auto_112475 ) ) ( not ( = ?auto_112471 ?auto_112472 ) ) ( not ( = ?auto_112471 ?auto_112476 ) ) ( not ( = ?auto_112470 ?auto_112474 ) ) ( not ( = ?auto_112470 ?auto_112475 ) ) ( not ( = ?auto_112470 ?auto_112472 ) ) ( not ( = ?auto_112470 ?auto_112476 ) ) ( ON ?auto_112473 ?auto_112470 ) ( ON ?auto_112474 ?auto_112473 ) ( CLEAR ?auto_112472 ) ( ON ?auto_112476 ?auto_112474 ) ( CLEAR ?auto_112476 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_112469 ?auto_112471 ?auto_112470 ?auto_112473 ?auto_112474 )
      ( MAKE-1PILE ?auto_112469 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_112477 - BLOCK
    )
    :vars
    (
      ?auto_112483 - BLOCK
      ?auto_112484 - BLOCK
      ?auto_112479 - BLOCK
      ?auto_112478 - BLOCK
      ?auto_112480 - BLOCK
      ?auto_112482 - BLOCK
      ?auto_112481 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112483 ?auto_112477 ) ( ON-TABLE ?auto_112477 ) ( not ( = ?auto_112477 ?auto_112483 ) ) ( not ( = ?auto_112477 ?auto_112484 ) ) ( not ( = ?auto_112477 ?auto_112479 ) ) ( not ( = ?auto_112483 ?auto_112484 ) ) ( not ( = ?auto_112483 ?auto_112479 ) ) ( not ( = ?auto_112484 ?auto_112479 ) ) ( ON ?auto_112484 ?auto_112483 ) ( ON-TABLE ?auto_112478 ) ( not ( = ?auto_112478 ?auto_112480 ) ) ( not ( = ?auto_112478 ?auto_112482 ) ) ( not ( = ?auto_112478 ?auto_112481 ) ) ( not ( = ?auto_112478 ?auto_112479 ) ) ( not ( = ?auto_112480 ?auto_112482 ) ) ( not ( = ?auto_112480 ?auto_112481 ) ) ( not ( = ?auto_112480 ?auto_112479 ) ) ( not ( = ?auto_112482 ?auto_112481 ) ) ( not ( = ?auto_112482 ?auto_112479 ) ) ( not ( = ?auto_112481 ?auto_112479 ) ) ( not ( = ?auto_112477 ?auto_112481 ) ) ( not ( = ?auto_112477 ?auto_112478 ) ) ( not ( = ?auto_112477 ?auto_112480 ) ) ( not ( = ?auto_112477 ?auto_112482 ) ) ( not ( = ?auto_112483 ?auto_112481 ) ) ( not ( = ?auto_112483 ?auto_112478 ) ) ( not ( = ?auto_112483 ?auto_112480 ) ) ( not ( = ?auto_112483 ?auto_112482 ) ) ( not ( = ?auto_112484 ?auto_112481 ) ) ( not ( = ?auto_112484 ?auto_112478 ) ) ( not ( = ?auto_112484 ?auto_112480 ) ) ( not ( = ?auto_112484 ?auto_112482 ) ) ( ON ?auto_112479 ?auto_112484 ) ( ON ?auto_112481 ?auto_112479 ) ( ON ?auto_112482 ?auto_112481 ) ( CLEAR ?auto_112482 ) ( HOLDING ?auto_112480 ) ( CLEAR ?auto_112478 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_112478 ?auto_112480 )
      ( MAKE-1PILE ?auto_112477 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_113891 - BLOCK
    )
    :vars
    (
      ?auto_113893 - BLOCK
      ?auto_113892 - BLOCK
      ?auto_113896 - BLOCK
      ?auto_113897 - BLOCK
      ?auto_113895 - BLOCK
      ?auto_113894 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113893 ?auto_113891 ) ( ON-TABLE ?auto_113891 ) ( not ( = ?auto_113891 ?auto_113893 ) ) ( not ( = ?auto_113891 ?auto_113892 ) ) ( not ( = ?auto_113891 ?auto_113896 ) ) ( not ( = ?auto_113893 ?auto_113892 ) ) ( not ( = ?auto_113893 ?auto_113896 ) ) ( not ( = ?auto_113892 ?auto_113896 ) ) ( ON ?auto_113892 ?auto_113893 ) ( not ( = ?auto_113897 ?auto_113895 ) ) ( not ( = ?auto_113897 ?auto_113894 ) ) ( not ( = ?auto_113897 ?auto_113896 ) ) ( not ( = ?auto_113895 ?auto_113894 ) ) ( not ( = ?auto_113895 ?auto_113896 ) ) ( not ( = ?auto_113894 ?auto_113896 ) ) ( not ( = ?auto_113891 ?auto_113894 ) ) ( not ( = ?auto_113891 ?auto_113897 ) ) ( not ( = ?auto_113891 ?auto_113895 ) ) ( not ( = ?auto_113893 ?auto_113894 ) ) ( not ( = ?auto_113893 ?auto_113897 ) ) ( not ( = ?auto_113893 ?auto_113895 ) ) ( not ( = ?auto_113892 ?auto_113894 ) ) ( not ( = ?auto_113892 ?auto_113897 ) ) ( not ( = ?auto_113892 ?auto_113895 ) ) ( ON ?auto_113896 ?auto_113892 ) ( ON ?auto_113894 ?auto_113896 ) ( ON ?auto_113895 ?auto_113894 ) ( ON ?auto_113897 ?auto_113895 ) ( CLEAR ?auto_113897 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_113891 ?auto_113893 ?auto_113892 ?auto_113896 ?auto_113894 ?auto_113895 )
      ( MAKE-1PILE ?auto_113891 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_112493 - BLOCK
    )
    :vars
    (
      ?auto_112499 - BLOCK
      ?auto_112494 - BLOCK
      ?auto_112497 - BLOCK
      ?auto_112495 - BLOCK
      ?auto_112496 - BLOCK
      ?auto_112498 - BLOCK
      ?auto_112500 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112499 ?auto_112493 ) ( ON-TABLE ?auto_112493 ) ( not ( = ?auto_112493 ?auto_112499 ) ) ( not ( = ?auto_112493 ?auto_112494 ) ) ( not ( = ?auto_112493 ?auto_112497 ) ) ( not ( = ?auto_112499 ?auto_112494 ) ) ( not ( = ?auto_112499 ?auto_112497 ) ) ( not ( = ?auto_112494 ?auto_112497 ) ) ( ON ?auto_112494 ?auto_112499 ) ( not ( = ?auto_112495 ?auto_112496 ) ) ( not ( = ?auto_112495 ?auto_112498 ) ) ( not ( = ?auto_112495 ?auto_112500 ) ) ( not ( = ?auto_112495 ?auto_112497 ) ) ( not ( = ?auto_112496 ?auto_112498 ) ) ( not ( = ?auto_112496 ?auto_112500 ) ) ( not ( = ?auto_112496 ?auto_112497 ) ) ( not ( = ?auto_112498 ?auto_112500 ) ) ( not ( = ?auto_112498 ?auto_112497 ) ) ( not ( = ?auto_112500 ?auto_112497 ) ) ( not ( = ?auto_112493 ?auto_112500 ) ) ( not ( = ?auto_112493 ?auto_112495 ) ) ( not ( = ?auto_112493 ?auto_112496 ) ) ( not ( = ?auto_112493 ?auto_112498 ) ) ( not ( = ?auto_112499 ?auto_112500 ) ) ( not ( = ?auto_112499 ?auto_112495 ) ) ( not ( = ?auto_112499 ?auto_112496 ) ) ( not ( = ?auto_112499 ?auto_112498 ) ) ( not ( = ?auto_112494 ?auto_112500 ) ) ( not ( = ?auto_112494 ?auto_112495 ) ) ( not ( = ?auto_112494 ?auto_112496 ) ) ( not ( = ?auto_112494 ?auto_112498 ) ) ( ON ?auto_112497 ?auto_112494 ) ( ON ?auto_112500 ?auto_112497 ) ( ON ?auto_112498 ?auto_112500 ) ( ON ?auto_112496 ?auto_112498 ) ( CLEAR ?auto_112496 ) ( HOLDING ?auto_112495 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_112495 )
      ( MAKE-1PILE ?auto_112493 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_112501 - BLOCK
    )
    :vars
    (
      ?auto_112507 - BLOCK
      ?auto_112508 - BLOCK
      ?auto_112505 - BLOCK
      ?auto_112502 - BLOCK
      ?auto_112506 - BLOCK
      ?auto_112503 - BLOCK
      ?auto_112504 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112507 ?auto_112501 ) ( ON-TABLE ?auto_112501 ) ( not ( = ?auto_112501 ?auto_112507 ) ) ( not ( = ?auto_112501 ?auto_112508 ) ) ( not ( = ?auto_112501 ?auto_112505 ) ) ( not ( = ?auto_112507 ?auto_112508 ) ) ( not ( = ?auto_112507 ?auto_112505 ) ) ( not ( = ?auto_112508 ?auto_112505 ) ) ( ON ?auto_112508 ?auto_112507 ) ( not ( = ?auto_112502 ?auto_112506 ) ) ( not ( = ?auto_112502 ?auto_112503 ) ) ( not ( = ?auto_112502 ?auto_112504 ) ) ( not ( = ?auto_112502 ?auto_112505 ) ) ( not ( = ?auto_112506 ?auto_112503 ) ) ( not ( = ?auto_112506 ?auto_112504 ) ) ( not ( = ?auto_112506 ?auto_112505 ) ) ( not ( = ?auto_112503 ?auto_112504 ) ) ( not ( = ?auto_112503 ?auto_112505 ) ) ( not ( = ?auto_112504 ?auto_112505 ) ) ( not ( = ?auto_112501 ?auto_112504 ) ) ( not ( = ?auto_112501 ?auto_112502 ) ) ( not ( = ?auto_112501 ?auto_112506 ) ) ( not ( = ?auto_112501 ?auto_112503 ) ) ( not ( = ?auto_112507 ?auto_112504 ) ) ( not ( = ?auto_112507 ?auto_112502 ) ) ( not ( = ?auto_112507 ?auto_112506 ) ) ( not ( = ?auto_112507 ?auto_112503 ) ) ( not ( = ?auto_112508 ?auto_112504 ) ) ( not ( = ?auto_112508 ?auto_112502 ) ) ( not ( = ?auto_112508 ?auto_112506 ) ) ( not ( = ?auto_112508 ?auto_112503 ) ) ( ON ?auto_112505 ?auto_112508 ) ( ON ?auto_112504 ?auto_112505 ) ( ON ?auto_112503 ?auto_112504 ) ( ON ?auto_112506 ?auto_112503 ) ( ON ?auto_112502 ?auto_112506 ) ( CLEAR ?auto_112502 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_112501 ?auto_112507 ?auto_112508 ?auto_112505 ?auto_112504 ?auto_112503 ?auto_112506 )
      ( MAKE-1PILE ?auto_112501 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_112516 - BLOCK
      ?auto_112517 - BLOCK
      ?auto_112518 - BLOCK
      ?auto_112519 - BLOCK
      ?auto_112520 - BLOCK
      ?auto_112521 - BLOCK
      ?auto_112522 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_112522 ) ( CLEAR ?auto_112521 ) ( ON-TABLE ?auto_112516 ) ( ON ?auto_112517 ?auto_112516 ) ( ON ?auto_112518 ?auto_112517 ) ( ON ?auto_112519 ?auto_112518 ) ( ON ?auto_112520 ?auto_112519 ) ( ON ?auto_112521 ?auto_112520 ) ( not ( = ?auto_112516 ?auto_112517 ) ) ( not ( = ?auto_112516 ?auto_112518 ) ) ( not ( = ?auto_112516 ?auto_112519 ) ) ( not ( = ?auto_112516 ?auto_112520 ) ) ( not ( = ?auto_112516 ?auto_112521 ) ) ( not ( = ?auto_112516 ?auto_112522 ) ) ( not ( = ?auto_112517 ?auto_112518 ) ) ( not ( = ?auto_112517 ?auto_112519 ) ) ( not ( = ?auto_112517 ?auto_112520 ) ) ( not ( = ?auto_112517 ?auto_112521 ) ) ( not ( = ?auto_112517 ?auto_112522 ) ) ( not ( = ?auto_112518 ?auto_112519 ) ) ( not ( = ?auto_112518 ?auto_112520 ) ) ( not ( = ?auto_112518 ?auto_112521 ) ) ( not ( = ?auto_112518 ?auto_112522 ) ) ( not ( = ?auto_112519 ?auto_112520 ) ) ( not ( = ?auto_112519 ?auto_112521 ) ) ( not ( = ?auto_112519 ?auto_112522 ) ) ( not ( = ?auto_112520 ?auto_112521 ) ) ( not ( = ?auto_112520 ?auto_112522 ) ) ( not ( = ?auto_112521 ?auto_112522 ) ) )
    :subtasks
    ( ( !STACK ?auto_112522 ?auto_112521 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_112523 - BLOCK
      ?auto_112524 - BLOCK
      ?auto_112525 - BLOCK
      ?auto_112526 - BLOCK
      ?auto_112527 - BLOCK
      ?auto_112528 - BLOCK
      ?auto_112529 - BLOCK
    )
    :vars
    (
      ?auto_112530 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_112528 ) ( ON-TABLE ?auto_112523 ) ( ON ?auto_112524 ?auto_112523 ) ( ON ?auto_112525 ?auto_112524 ) ( ON ?auto_112526 ?auto_112525 ) ( ON ?auto_112527 ?auto_112526 ) ( ON ?auto_112528 ?auto_112527 ) ( not ( = ?auto_112523 ?auto_112524 ) ) ( not ( = ?auto_112523 ?auto_112525 ) ) ( not ( = ?auto_112523 ?auto_112526 ) ) ( not ( = ?auto_112523 ?auto_112527 ) ) ( not ( = ?auto_112523 ?auto_112528 ) ) ( not ( = ?auto_112523 ?auto_112529 ) ) ( not ( = ?auto_112524 ?auto_112525 ) ) ( not ( = ?auto_112524 ?auto_112526 ) ) ( not ( = ?auto_112524 ?auto_112527 ) ) ( not ( = ?auto_112524 ?auto_112528 ) ) ( not ( = ?auto_112524 ?auto_112529 ) ) ( not ( = ?auto_112525 ?auto_112526 ) ) ( not ( = ?auto_112525 ?auto_112527 ) ) ( not ( = ?auto_112525 ?auto_112528 ) ) ( not ( = ?auto_112525 ?auto_112529 ) ) ( not ( = ?auto_112526 ?auto_112527 ) ) ( not ( = ?auto_112526 ?auto_112528 ) ) ( not ( = ?auto_112526 ?auto_112529 ) ) ( not ( = ?auto_112527 ?auto_112528 ) ) ( not ( = ?auto_112527 ?auto_112529 ) ) ( not ( = ?auto_112528 ?auto_112529 ) ) ( ON ?auto_112529 ?auto_112530 ) ( CLEAR ?auto_112529 ) ( HAND-EMPTY ) ( not ( = ?auto_112523 ?auto_112530 ) ) ( not ( = ?auto_112524 ?auto_112530 ) ) ( not ( = ?auto_112525 ?auto_112530 ) ) ( not ( = ?auto_112526 ?auto_112530 ) ) ( not ( = ?auto_112527 ?auto_112530 ) ) ( not ( = ?auto_112528 ?auto_112530 ) ) ( not ( = ?auto_112529 ?auto_112530 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_112529 ?auto_112530 )
      ( MAKE-7PILE ?auto_112523 ?auto_112524 ?auto_112525 ?auto_112526 ?auto_112527 ?auto_112528 ?auto_112529 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_112531 - BLOCK
      ?auto_112532 - BLOCK
      ?auto_112533 - BLOCK
      ?auto_112534 - BLOCK
      ?auto_112535 - BLOCK
      ?auto_112536 - BLOCK
      ?auto_112537 - BLOCK
    )
    :vars
    (
      ?auto_112538 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_112531 ) ( ON ?auto_112532 ?auto_112531 ) ( ON ?auto_112533 ?auto_112532 ) ( ON ?auto_112534 ?auto_112533 ) ( ON ?auto_112535 ?auto_112534 ) ( not ( = ?auto_112531 ?auto_112532 ) ) ( not ( = ?auto_112531 ?auto_112533 ) ) ( not ( = ?auto_112531 ?auto_112534 ) ) ( not ( = ?auto_112531 ?auto_112535 ) ) ( not ( = ?auto_112531 ?auto_112536 ) ) ( not ( = ?auto_112531 ?auto_112537 ) ) ( not ( = ?auto_112532 ?auto_112533 ) ) ( not ( = ?auto_112532 ?auto_112534 ) ) ( not ( = ?auto_112532 ?auto_112535 ) ) ( not ( = ?auto_112532 ?auto_112536 ) ) ( not ( = ?auto_112532 ?auto_112537 ) ) ( not ( = ?auto_112533 ?auto_112534 ) ) ( not ( = ?auto_112533 ?auto_112535 ) ) ( not ( = ?auto_112533 ?auto_112536 ) ) ( not ( = ?auto_112533 ?auto_112537 ) ) ( not ( = ?auto_112534 ?auto_112535 ) ) ( not ( = ?auto_112534 ?auto_112536 ) ) ( not ( = ?auto_112534 ?auto_112537 ) ) ( not ( = ?auto_112535 ?auto_112536 ) ) ( not ( = ?auto_112535 ?auto_112537 ) ) ( not ( = ?auto_112536 ?auto_112537 ) ) ( ON ?auto_112537 ?auto_112538 ) ( CLEAR ?auto_112537 ) ( not ( = ?auto_112531 ?auto_112538 ) ) ( not ( = ?auto_112532 ?auto_112538 ) ) ( not ( = ?auto_112533 ?auto_112538 ) ) ( not ( = ?auto_112534 ?auto_112538 ) ) ( not ( = ?auto_112535 ?auto_112538 ) ) ( not ( = ?auto_112536 ?auto_112538 ) ) ( not ( = ?auto_112537 ?auto_112538 ) ) ( HOLDING ?auto_112536 ) ( CLEAR ?auto_112535 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_112531 ?auto_112532 ?auto_112533 ?auto_112534 ?auto_112535 ?auto_112536 )
      ( MAKE-7PILE ?auto_112531 ?auto_112532 ?auto_112533 ?auto_112534 ?auto_112535 ?auto_112536 ?auto_112537 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_112539 - BLOCK
      ?auto_112540 - BLOCK
      ?auto_112541 - BLOCK
      ?auto_112542 - BLOCK
      ?auto_112543 - BLOCK
      ?auto_112544 - BLOCK
      ?auto_112545 - BLOCK
    )
    :vars
    (
      ?auto_112546 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_112539 ) ( ON ?auto_112540 ?auto_112539 ) ( ON ?auto_112541 ?auto_112540 ) ( ON ?auto_112542 ?auto_112541 ) ( ON ?auto_112543 ?auto_112542 ) ( not ( = ?auto_112539 ?auto_112540 ) ) ( not ( = ?auto_112539 ?auto_112541 ) ) ( not ( = ?auto_112539 ?auto_112542 ) ) ( not ( = ?auto_112539 ?auto_112543 ) ) ( not ( = ?auto_112539 ?auto_112544 ) ) ( not ( = ?auto_112539 ?auto_112545 ) ) ( not ( = ?auto_112540 ?auto_112541 ) ) ( not ( = ?auto_112540 ?auto_112542 ) ) ( not ( = ?auto_112540 ?auto_112543 ) ) ( not ( = ?auto_112540 ?auto_112544 ) ) ( not ( = ?auto_112540 ?auto_112545 ) ) ( not ( = ?auto_112541 ?auto_112542 ) ) ( not ( = ?auto_112541 ?auto_112543 ) ) ( not ( = ?auto_112541 ?auto_112544 ) ) ( not ( = ?auto_112541 ?auto_112545 ) ) ( not ( = ?auto_112542 ?auto_112543 ) ) ( not ( = ?auto_112542 ?auto_112544 ) ) ( not ( = ?auto_112542 ?auto_112545 ) ) ( not ( = ?auto_112543 ?auto_112544 ) ) ( not ( = ?auto_112543 ?auto_112545 ) ) ( not ( = ?auto_112544 ?auto_112545 ) ) ( ON ?auto_112545 ?auto_112546 ) ( not ( = ?auto_112539 ?auto_112546 ) ) ( not ( = ?auto_112540 ?auto_112546 ) ) ( not ( = ?auto_112541 ?auto_112546 ) ) ( not ( = ?auto_112542 ?auto_112546 ) ) ( not ( = ?auto_112543 ?auto_112546 ) ) ( not ( = ?auto_112544 ?auto_112546 ) ) ( not ( = ?auto_112545 ?auto_112546 ) ) ( CLEAR ?auto_112543 ) ( ON ?auto_112544 ?auto_112545 ) ( CLEAR ?auto_112544 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_112546 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_112546 ?auto_112545 )
      ( MAKE-7PILE ?auto_112539 ?auto_112540 ?auto_112541 ?auto_112542 ?auto_112543 ?auto_112544 ?auto_112545 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_112547 - BLOCK
      ?auto_112548 - BLOCK
      ?auto_112549 - BLOCK
      ?auto_112550 - BLOCK
      ?auto_112551 - BLOCK
      ?auto_112552 - BLOCK
      ?auto_112553 - BLOCK
    )
    :vars
    (
      ?auto_112554 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_112547 ) ( ON ?auto_112548 ?auto_112547 ) ( ON ?auto_112549 ?auto_112548 ) ( ON ?auto_112550 ?auto_112549 ) ( not ( = ?auto_112547 ?auto_112548 ) ) ( not ( = ?auto_112547 ?auto_112549 ) ) ( not ( = ?auto_112547 ?auto_112550 ) ) ( not ( = ?auto_112547 ?auto_112551 ) ) ( not ( = ?auto_112547 ?auto_112552 ) ) ( not ( = ?auto_112547 ?auto_112553 ) ) ( not ( = ?auto_112548 ?auto_112549 ) ) ( not ( = ?auto_112548 ?auto_112550 ) ) ( not ( = ?auto_112548 ?auto_112551 ) ) ( not ( = ?auto_112548 ?auto_112552 ) ) ( not ( = ?auto_112548 ?auto_112553 ) ) ( not ( = ?auto_112549 ?auto_112550 ) ) ( not ( = ?auto_112549 ?auto_112551 ) ) ( not ( = ?auto_112549 ?auto_112552 ) ) ( not ( = ?auto_112549 ?auto_112553 ) ) ( not ( = ?auto_112550 ?auto_112551 ) ) ( not ( = ?auto_112550 ?auto_112552 ) ) ( not ( = ?auto_112550 ?auto_112553 ) ) ( not ( = ?auto_112551 ?auto_112552 ) ) ( not ( = ?auto_112551 ?auto_112553 ) ) ( not ( = ?auto_112552 ?auto_112553 ) ) ( ON ?auto_112553 ?auto_112554 ) ( not ( = ?auto_112547 ?auto_112554 ) ) ( not ( = ?auto_112548 ?auto_112554 ) ) ( not ( = ?auto_112549 ?auto_112554 ) ) ( not ( = ?auto_112550 ?auto_112554 ) ) ( not ( = ?auto_112551 ?auto_112554 ) ) ( not ( = ?auto_112552 ?auto_112554 ) ) ( not ( = ?auto_112553 ?auto_112554 ) ) ( ON ?auto_112552 ?auto_112553 ) ( CLEAR ?auto_112552 ) ( ON-TABLE ?auto_112554 ) ( HOLDING ?auto_112551 ) ( CLEAR ?auto_112550 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_112547 ?auto_112548 ?auto_112549 ?auto_112550 ?auto_112551 )
      ( MAKE-7PILE ?auto_112547 ?auto_112548 ?auto_112549 ?auto_112550 ?auto_112551 ?auto_112552 ?auto_112553 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_112555 - BLOCK
      ?auto_112556 - BLOCK
      ?auto_112557 - BLOCK
      ?auto_112558 - BLOCK
      ?auto_112559 - BLOCK
      ?auto_112560 - BLOCK
      ?auto_112561 - BLOCK
    )
    :vars
    (
      ?auto_112562 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_112555 ) ( ON ?auto_112556 ?auto_112555 ) ( ON ?auto_112557 ?auto_112556 ) ( ON ?auto_112558 ?auto_112557 ) ( not ( = ?auto_112555 ?auto_112556 ) ) ( not ( = ?auto_112555 ?auto_112557 ) ) ( not ( = ?auto_112555 ?auto_112558 ) ) ( not ( = ?auto_112555 ?auto_112559 ) ) ( not ( = ?auto_112555 ?auto_112560 ) ) ( not ( = ?auto_112555 ?auto_112561 ) ) ( not ( = ?auto_112556 ?auto_112557 ) ) ( not ( = ?auto_112556 ?auto_112558 ) ) ( not ( = ?auto_112556 ?auto_112559 ) ) ( not ( = ?auto_112556 ?auto_112560 ) ) ( not ( = ?auto_112556 ?auto_112561 ) ) ( not ( = ?auto_112557 ?auto_112558 ) ) ( not ( = ?auto_112557 ?auto_112559 ) ) ( not ( = ?auto_112557 ?auto_112560 ) ) ( not ( = ?auto_112557 ?auto_112561 ) ) ( not ( = ?auto_112558 ?auto_112559 ) ) ( not ( = ?auto_112558 ?auto_112560 ) ) ( not ( = ?auto_112558 ?auto_112561 ) ) ( not ( = ?auto_112559 ?auto_112560 ) ) ( not ( = ?auto_112559 ?auto_112561 ) ) ( not ( = ?auto_112560 ?auto_112561 ) ) ( ON ?auto_112561 ?auto_112562 ) ( not ( = ?auto_112555 ?auto_112562 ) ) ( not ( = ?auto_112556 ?auto_112562 ) ) ( not ( = ?auto_112557 ?auto_112562 ) ) ( not ( = ?auto_112558 ?auto_112562 ) ) ( not ( = ?auto_112559 ?auto_112562 ) ) ( not ( = ?auto_112560 ?auto_112562 ) ) ( not ( = ?auto_112561 ?auto_112562 ) ) ( ON ?auto_112560 ?auto_112561 ) ( ON-TABLE ?auto_112562 ) ( CLEAR ?auto_112558 ) ( ON ?auto_112559 ?auto_112560 ) ( CLEAR ?auto_112559 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_112562 ?auto_112561 ?auto_112560 )
      ( MAKE-7PILE ?auto_112555 ?auto_112556 ?auto_112557 ?auto_112558 ?auto_112559 ?auto_112560 ?auto_112561 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_112563 - BLOCK
      ?auto_112564 - BLOCK
      ?auto_112565 - BLOCK
      ?auto_112566 - BLOCK
      ?auto_112567 - BLOCK
      ?auto_112568 - BLOCK
      ?auto_112569 - BLOCK
    )
    :vars
    (
      ?auto_112570 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_112563 ) ( ON ?auto_112564 ?auto_112563 ) ( ON ?auto_112565 ?auto_112564 ) ( not ( = ?auto_112563 ?auto_112564 ) ) ( not ( = ?auto_112563 ?auto_112565 ) ) ( not ( = ?auto_112563 ?auto_112566 ) ) ( not ( = ?auto_112563 ?auto_112567 ) ) ( not ( = ?auto_112563 ?auto_112568 ) ) ( not ( = ?auto_112563 ?auto_112569 ) ) ( not ( = ?auto_112564 ?auto_112565 ) ) ( not ( = ?auto_112564 ?auto_112566 ) ) ( not ( = ?auto_112564 ?auto_112567 ) ) ( not ( = ?auto_112564 ?auto_112568 ) ) ( not ( = ?auto_112564 ?auto_112569 ) ) ( not ( = ?auto_112565 ?auto_112566 ) ) ( not ( = ?auto_112565 ?auto_112567 ) ) ( not ( = ?auto_112565 ?auto_112568 ) ) ( not ( = ?auto_112565 ?auto_112569 ) ) ( not ( = ?auto_112566 ?auto_112567 ) ) ( not ( = ?auto_112566 ?auto_112568 ) ) ( not ( = ?auto_112566 ?auto_112569 ) ) ( not ( = ?auto_112567 ?auto_112568 ) ) ( not ( = ?auto_112567 ?auto_112569 ) ) ( not ( = ?auto_112568 ?auto_112569 ) ) ( ON ?auto_112569 ?auto_112570 ) ( not ( = ?auto_112563 ?auto_112570 ) ) ( not ( = ?auto_112564 ?auto_112570 ) ) ( not ( = ?auto_112565 ?auto_112570 ) ) ( not ( = ?auto_112566 ?auto_112570 ) ) ( not ( = ?auto_112567 ?auto_112570 ) ) ( not ( = ?auto_112568 ?auto_112570 ) ) ( not ( = ?auto_112569 ?auto_112570 ) ) ( ON ?auto_112568 ?auto_112569 ) ( ON-TABLE ?auto_112570 ) ( ON ?auto_112567 ?auto_112568 ) ( CLEAR ?auto_112567 ) ( HOLDING ?auto_112566 ) ( CLEAR ?auto_112565 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_112563 ?auto_112564 ?auto_112565 ?auto_112566 )
      ( MAKE-7PILE ?auto_112563 ?auto_112564 ?auto_112565 ?auto_112566 ?auto_112567 ?auto_112568 ?auto_112569 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_112571 - BLOCK
      ?auto_112572 - BLOCK
      ?auto_112573 - BLOCK
      ?auto_112574 - BLOCK
      ?auto_112575 - BLOCK
      ?auto_112576 - BLOCK
      ?auto_112577 - BLOCK
    )
    :vars
    (
      ?auto_112578 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_112571 ) ( ON ?auto_112572 ?auto_112571 ) ( ON ?auto_112573 ?auto_112572 ) ( not ( = ?auto_112571 ?auto_112572 ) ) ( not ( = ?auto_112571 ?auto_112573 ) ) ( not ( = ?auto_112571 ?auto_112574 ) ) ( not ( = ?auto_112571 ?auto_112575 ) ) ( not ( = ?auto_112571 ?auto_112576 ) ) ( not ( = ?auto_112571 ?auto_112577 ) ) ( not ( = ?auto_112572 ?auto_112573 ) ) ( not ( = ?auto_112572 ?auto_112574 ) ) ( not ( = ?auto_112572 ?auto_112575 ) ) ( not ( = ?auto_112572 ?auto_112576 ) ) ( not ( = ?auto_112572 ?auto_112577 ) ) ( not ( = ?auto_112573 ?auto_112574 ) ) ( not ( = ?auto_112573 ?auto_112575 ) ) ( not ( = ?auto_112573 ?auto_112576 ) ) ( not ( = ?auto_112573 ?auto_112577 ) ) ( not ( = ?auto_112574 ?auto_112575 ) ) ( not ( = ?auto_112574 ?auto_112576 ) ) ( not ( = ?auto_112574 ?auto_112577 ) ) ( not ( = ?auto_112575 ?auto_112576 ) ) ( not ( = ?auto_112575 ?auto_112577 ) ) ( not ( = ?auto_112576 ?auto_112577 ) ) ( ON ?auto_112577 ?auto_112578 ) ( not ( = ?auto_112571 ?auto_112578 ) ) ( not ( = ?auto_112572 ?auto_112578 ) ) ( not ( = ?auto_112573 ?auto_112578 ) ) ( not ( = ?auto_112574 ?auto_112578 ) ) ( not ( = ?auto_112575 ?auto_112578 ) ) ( not ( = ?auto_112576 ?auto_112578 ) ) ( not ( = ?auto_112577 ?auto_112578 ) ) ( ON ?auto_112576 ?auto_112577 ) ( ON-TABLE ?auto_112578 ) ( ON ?auto_112575 ?auto_112576 ) ( CLEAR ?auto_112573 ) ( ON ?auto_112574 ?auto_112575 ) ( CLEAR ?auto_112574 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_112578 ?auto_112577 ?auto_112576 ?auto_112575 )
      ( MAKE-7PILE ?auto_112571 ?auto_112572 ?auto_112573 ?auto_112574 ?auto_112575 ?auto_112576 ?auto_112577 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_112579 - BLOCK
      ?auto_112580 - BLOCK
      ?auto_112581 - BLOCK
      ?auto_112582 - BLOCK
      ?auto_112583 - BLOCK
      ?auto_112584 - BLOCK
      ?auto_112585 - BLOCK
    )
    :vars
    (
      ?auto_112586 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_112579 ) ( ON ?auto_112580 ?auto_112579 ) ( not ( = ?auto_112579 ?auto_112580 ) ) ( not ( = ?auto_112579 ?auto_112581 ) ) ( not ( = ?auto_112579 ?auto_112582 ) ) ( not ( = ?auto_112579 ?auto_112583 ) ) ( not ( = ?auto_112579 ?auto_112584 ) ) ( not ( = ?auto_112579 ?auto_112585 ) ) ( not ( = ?auto_112580 ?auto_112581 ) ) ( not ( = ?auto_112580 ?auto_112582 ) ) ( not ( = ?auto_112580 ?auto_112583 ) ) ( not ( = ?auto_112580 ?auto_112584 ) ) ( not ( = ?auto_112580 ?auto_112585 ) ) ( not ( = ?auto_112581 ?auto_112582 ) ) ( not ( = ?auto_112581 ?auto_112583 ) ) ( not ( = ?auto_112581 ?auto_112584 ) ) ( not ( = ?auto_112581 ?auto_112585 ) ) ( not ( = ?auto_112582 ?auto_112583 ) ) ( not ( = ?auto_112582 ?auto_112584 ) ) ( not ( = ?auto_112582 ?auto_112585 ) ) ( not ( = ?auto_112583 ?auto_112584 ) ) ( not ( = ?auto_112583 ?auto_112585 ) ) ( not ( = ?auto_112584 ?auto_112585 ) ) ( ON ?auto_112585 ?auto_112586 ) ( not ( = ?auto_112579 ?auto_112586 ) ) ( not ( = ?auto_112580 ?auto_112586 ) ) ( not ( = ?auto_112581 ?auto_112586 ) ) ( not ( = ?auto_112582 ?auto_112586 ) ) ( not ( = ?auto_112583 ?auto_112586 ) ) ( not ( = ?auto_112584 ?auto_112586 ) ) ( not ( = ?auto_112585 ?auto_112586 ) ) ( ON ?auto_112584 ?auto_112585 ) ( ON-TABLE ?auto_112586 ) ( ON ?auto_112583 ?auto_112584 ) ( ON ?auto_112582 ?auto_112583 ) ( CLEAR ?auto_112582 ) ( HOLDING ?auto_112581 ) ( CLEAR ?auto_112580 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_112579 ?auto_112580 ?auto_112581 )
      ( MAKE-7PILE ?auto_112579 ?auto_112580 ?auto_112581 ?auto_112582 ?auto_112583 ?auto_112584 ?auto_112585 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_112587 - BLOCK
      ?auto_112588 - BLOCK
      ?auto_112589 - BLOCK
      ?auto_112590 - BLOCK
      ?auto_112591 - BLOCK
      ?auto_112592 - BLOCK
      ?auto_112593 - BLOCK
    )
    :vars
    (
      ?auto_112594 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_112587 ) ( ON ?auto_112588 ?auto_112587 ) ( not ( = ?auto_112587 ?auto_112588 ) ) ( not ( = ?auto_112587 ?auto_112589 ) ) ( not ( = ?auto_112587 ?auto_112590 ) ) ( not ( = ?auto_112587 ?auto_112591 ) ) ( not ( = ?auto_112587 ?auto_112592 ) ) ( not ( = ?auto_112587 ?auto_112593 ) ) ( not ( = ?auto_112588 ?auto_112589 ) ) ( not ( = ?auto_112588 ?auto_112590 ) ) ( not ( = ?auto_112588 ?auto_112591 ) ) ( not ( = ?auto_112588 ?auto_112592 ) ) ( not ( = ?auto_112588 ?auto_112593 ) ) ( not ( = ?auto_112589 ?auto_112590 ) ) ( not ( = ?auto_112589 ?auto_112591 ) ) ( not ( = ?auto_112589 ?auto_112592 ) ) ( not ( = ?auto_112589 ?auto_112593 ) ) ( not ( = ?auto_112590 ?auto_112591 ) ) ( not ( = ?auto_112590 ?auto_112592 ) ) ( not ( = ?auto_112590 ?auto_112593 ) ) ( not ( = ?auto_112591 ?auto_112592 ) ) ( not ( = ?auto_112591 ?auto_112593 ) ) ( not ( = ?auto_112592 ?auto_112593 ) ) ( ON ?auto_112593 ?auto_112594 ) ( not ( = ?auto_112587 ?auto_112594 ) ) ( not ( = ?auto_112588 ?auto_112594 ) ) ( not ( = ?auto_112589 ?auto_112594 ) ) ( not ( = ?auto_112590 ?auto_112594 ) ) ( not ( = ?auto_112591 ?auto_112594 ) ) ( not ( = ?auto_112592 ?auto_112594 ) ) ( not ( = ?auto_112593 ?auto_112594 ) ) ( ON ?auto_112592 ?auto_112593 ) ( ON-TABLE ?auto_112594 ) ( ON ?auto_112591 ?auto_112592 ) ( ON ?auto_112590 ?auto_112591 ) ( CLEAR ?auto_112588 ) ( ON ?auto_112589 ?auto_112590 ) ( CLEAR ?auto_112589 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_112594 ?auto_112593 ?auto_112592 ?auto_112591 ?auto_112590 )
      ( MAKE-7PILE ?auto_112587 ?auto_112588 ?auto_112589 ?auto_112590 ?auto_112591 ?auto_112592 ?auto_112593 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_112595 - BLOCK
      ?auto_112596 - BLOCK
      ?auto_112597 - BLOCK
      ?auto_112598 - BLOCK
      ?auto_112599 - BLOCK
      ?auto_112600 - BLOCK
      ?auto_112601 - BLOCK
    )
    :vars
    (
      ?auto_112602 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_112595 ) ( not ( = ?auto_112595 ?auto_112596 ) ) ( not ( = ?auto_112595 ?auto_112597 ) ) ( not ( = ?auto_112595 ?auto_112598 ) ) ( not ( = ?auto_112595 ?auto_112599 ) ) ( not ( = ?auto_112595 ?auto_112600 ) ) ( not ( = ?auto_112595 ?auto_112601 ) ) ( not ( = ?auto_112596 ?auto_112597 ) ) ( not ( = ?auto_112596 ?auto_112598 ) ) ( not ( = ?auto_112596 ?auto_112599 ) ) ( not ( = ?auto_112596 ?auto_112600 ) ) ( not ( = ?auto_112596 ?auto_112601 ) ) ( not ( = ?auto_112597 ?auto_112598 ) ) ( not ( = ?auto_112597 ?auto_112599 ) ) ( not ( = ?auto_112597 ?auto_112600 ) ) ( not ( = ?auto_112597 ?auto_112601 ) ) ( not ( = ?auto_112598 ?auto_112599 ) ) ( not ( = ?auto_112598 ?auto_112600 ) ) ( not ( = ?auto_112598 ?auto_112601 ) ) ( not ( = ?auto_112599 ?auto_112600 ) ) ( not ( = ?auto_112599 ?auto_112601 ) ) ( not ( = ?auto_112600 ?auto_112601 ) ) ( ON ?auto_112601 ?auto_112602 ) ( not ( = ?auto_112595 ?auto_112602 ) ) ( not ( = ?auto_112596 ?auto_112602 ) ) ( not ( = ?auto_112597 ?auto_112602 ) ) ( not ( = ?auto_112598 ?auto_112602 ) ) ( not ( = ?auto_112599 ?auto_112602 ) ) ( not ( = ?auto_112600 ?auto_112602 ) ) ( not ( = ?auto_112601 ?auto_112602 ) ) ( ON ?auto_112600 ?auto_112601 ) ( ON-TABLE ?auto_112602 ) ( ON ?auto_112599 ?auto_112600 ) ( ON ?auto_112598 ?auto_112599 ) ( ON ?auto_112597 ?auto_112598 ) ( CLEAR ?auto_112597 ) ( HOLDING ?auto_112596 ) ( CLEAR ?auto_112595 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_112595 ?auto_112596 )
      ( MAKE-7PILE ?auto_112595 ?auto_112596 ?auto_112597 ?auto_112598 ?auto_112599 ?auto_112600 ?auto_112601 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_112603 - BLOCK
      ?auto_112604 - BLOCK
      ?auto_112605 - BLOCK
      ?auto_112606 - BLOCK
      ?auto_112607 - BLOCK
      ?auto_112608 - BLOCK
      ?auto_112609 - BLOCK
    )
    :vars
    (
      ?auto_112610 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_112603 ) ( not ( = ?auto_112603 ?auto_112604 ) ) ( not ( = ?auto_112603 ?auto_112605 ) ) ( not ( = ?auto_112603 ?auto_112606 ) ) ( not ( = ?auto_112603 ?auto_112607 ) ) ( not ( = ?auto_112603 ?auto_112608 ) ) ( not ( = ?auto_112603 ?auto_112609 ) ) ( not ( = ?auto_112604 ?auto_112605 ) ) ( not ( = ?auto_112604 ?auto_112606 ) ) ( not ( = ?auto_112604 ?auto_112607 ) ) ( not ( = ?auto_112604 ?auto_112608 ) ) ( not ( = ?auto_112604 ?auto_112609 ) ) ( not ( = ?auto_112605 ?auto_112606 ) ) ( not ( = ?auto_112605 ?auto_112607 ) ) ( not ( = ?auto_112605 ?auto_112608 ) ) ( not ( = ?auto_112605 ?auto_112609 ) ) ( not ( = ?auto_112606 ?auto_112607 ) ) ( not ( = ?auto_112606 ?auto_112608 ) ) ( not ( = ?auto_112606 ?auto_112609 ) ) ( not ( = ?auto_112607 ?auto_112608 ) ) ( not ( = ?auto_112607 ?auto_112609 ) ) ( not ( = ?auto_112608 ?auto_112609 ) ) ( ON ?auto_112609 ?auto_112610 ) ( not ( = ?auto_112603 ?auto_112610 ) ) ( not ( = ?auto_112604 ?auto_112610 ) ) ( not ( = ?auto_112605 ?auto_112610 ) ) ( not ( = ?auto_112606 ?auto_112610 ) ) ( not ( = ?auto_112607 ?auto_112610 ) ) ( not ( = ?auto_112608 ?auto_112610 ) ) ( not ( = ?auto_112609 ?auto_112610 ) ) ( ON ?auto_112608 ?auto_112609 ) ( ON-TABLE ?auto_112610 ) ( ON ?auto_112607 ?auto_112608 ) ( ON ?auto_112606 ?auto_112607 ) ( ON ?auto_112605 ?auto_112606 ) ( CLEAR ?auto_112603 ) ( ON ?auto_112604 ?auto_112605 ) ( CLEAR ?auto_112604 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_112610 ?auto_112609 ?auto_112608 ?auto_112607 ?auto_112606 ?auto_112605 )
      ( MAKE-7PILE ?auto_112603 ?auto_112604 ?auto_112605 ?auto_112606 ?auto_112607 ?auto_112608 ?auto_112609 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_112611 - BLOCK
      ?auto_112612 - BLOCK
      ?auto_112613 - BLOCK
      ?auto_112614 - BLOCK
      ?auto_112615 - BLOCK
      ?auto_112616 - BLOCK
      ?auto_112617 - BLOCK
    )
    :vars
    (
      ?auto_112618 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_112611 ?auto_112612 ) ) ( not ( = ?auto_112611 ?auto_112613 ) ) ( not ( = ?auto_112611 ?auto_112614 ) ) ( not ( = ?auto_112611 ?auto_112615 ) ) ( not ( = ?auto_112611 ?auto_112616 ) ) ( not ( = ?auto_112611 ?auto_112617 ) ) ( not ( = ?auto_112612 ?auto_112613 ) ) ( not ( = ?auto_112612 ?auto_112614 ) ) ( not ( = ?auto_112612 ?auto_112615 ) ) ( not ( = ?auto_112612 ?auto_112616 ) ) ( not ( = ?auto_112612 ?auto_112617 ) ) ( not ( = ?auto_112613 ?auto_112614 ) ) ( not ( = ?auto_112613 ?auto_112615 ) ) ( not ( = ?auto_112613 ?auto_112616 ) ) ( not ( = ?auto_112613 ?auto_112617 ) ) ( not ( = ?auto_112614 ?auto_112615 ) ) ( not ( = ?auto_112614 ?auto_112616 ) ) ( not ( = ?auto_112614 ?auto_112617 ) ) ( not ( = ?auto_112615 ?auto_112616 ) ) ( not ( = ?auto_112615 ?auto_112617 ) ) ( not ( = ?auto_112616 ?auto_112617 ) ) ( ON ?auto_112617 ?auto_112618 ) ( not ( = ?auto_112611 ?auto_112618 ) ) ( not ( = ?auto_112612 ?auto_112618 ) ) ( not ( = ?auto_112613 ?auto_112618 ) ) ( not ( = ?auto_112614 ?auto_112618 ) ) ( not ( = ?auto_112615 ?auto_112618 ) ) ( not ( = ?auto_112616 ?auto_112618 ) ) ( not ( = ?auto_112617 ?auto_112618 ) ) ( ON ?auto_112616 ?auto_112617 ) ( ON-TABLE ?auto_112618 ) ( ON ?auto_112615 ?auto_112616 ) ( ON ?auto_112614 ?auto_112615 ) ( ON ?auto_112613 ?auto_112614 ) ( ON ?auto_112612 ?auto_112613 ) ( CLEAR ?auto_112612 ) ( HOLDING ?auto_112611 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_112611 )
      ( MAKE-7PILE ?auto_112611 ?auto_112612 ?auto_112613 ?auto_112614 ?auto_112615 ?auto_112616 ?auto_112617 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_112619 - BLOCK
      ?auto_112620 - BLOCK
      ?auto_112621 - BLOCK
      ?auto_112622 - BLOCK
      ?auto_112623 - BLOCK
      ?auto_112624 - BLOCK
      ?auto_112625 - BLOCK
    )
    :vars
    (
      ?auto_112626 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_112619 ?auto_112620 ) ) ( not ( = ?auto_112619 ?auto_112621 ) ) ( not ( = ?auto_112619 ?auto_112622 ) ) ( not ( = ?auto_112619 ?auto_112623 ) ) ( not ( = ?auto_112619 ?auto_112624 ) ) ( not ( = ?auto_112619 ?auto_112625 ) ) ( not ( = ?auto_112620 ?auto_112621 ) ) ( not ( = ?auto_112620 ?auto_112622 ) ) ( not ( = ?auto_112620 ?auto_112623 ) ) ( not ( = ?auto_112620 ?auto_112624 ) ) ( not ( = ?auto_112620 ?auto_112625 ) ) ( not ( = ?auto_112621 ?auto_112622 ) ) ( not ( = ?auto_112621 ?auto_112623 ) ) ( not ( = ?auto_112621 ?auto_112624 ) ) ( not ( = ?auto_112621 ?auto_112625 ) ) ( not ( = ?auto_112622 ?auto_112623 ) ) ( not ( = ?auto_112622 ?auto_112624 ) ) ( not ( = ?auto_112622 ?auto_112625 ) ) ( not ( = ?auto_112623 ?auto_112624 ) ) ( not ( = ?auto_112623 ?auto_112625 ) ) ( not ( = ?auto_112624 ?auto_112625 ) ) ( ON ?auto_112625 ?auto_112626 ) ( not ( = ?auto_112619 ?auto_112626 ) ) ( not ( = ?auto_112620 ?auto_112626 ) ) ( not ( = ?auto_112621 ?auto_112626 ) ) ( not ( = ?auto_112622 ?auto_112626 ) ) ( not ( = ?auto_112623 ?auto_112626 ) ) ( not ( = ?auto_112624 ?auto_112626 ) ) ( not ( = ?auto_112625 ?auto_112626 ) ) ( ON ?auto_112624 ?auto_112625 ) ( ON-TABLE ?auto_112626 ) ( ON ?auto_112623 ?auto_112624 ) ( ON ?auto_112622 ?auto_112623 ) ( ON ?auto_112621 ?auto_112622 ) ( ON ?auto_112620 ?auto_112621 ) ( ON ?auto_112619 ?auto_112620 ) ( CLEAR ?auto_112619 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_112626 ?auto_112625 ?auto_112624 ?auto_112623 ?auto_112622 ?auto_112621 ?auto_112620 )
      ( MAKE-7PILE ?auto_112619 ?auto_112620 ?auto_112621 ?auto_112622 ?auto_112623 ?auto_112624 ?auto_112625 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_112733 - BLOCK
    )
    :vars
    (
      ?auto_112734 - BLOCK
      ?auto_112735 - BLOCK
      ?auto_112736 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112733 ?auto_112734 ) ( CLEAR ?auto_112733 ) ( not ( = ?auto_112733 ?auto_112734 ) ) ( HOLDING ?auto_112735 ) ( CLEAR ?auto_112736 ) ( not ( = ?auto_112733 ?auto_112735 ) ) ( not ( = ?auto_112733 ?auto_112736 ) ) ( not ( = ?auto_112734 ?auto_112735 ) ) ( not ( = ?auto_112734 ?auto_112736 ) ) ( not ( = ?auto_112735 ?auto_112736 ) ) )
    :subtasks
    ( ( !STACK ?auto_112735 ?auto_112736 )
      ( MAKE-1PILE ?auto_112733 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_112737 - BLOCK
    )
    :vars
    (
      ?auto_112739 - BLOCK
      ?auto_112740 - BLOCK
      ?auto_112738 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112737 ?auto_112739 ) ( not ( = ?auto_112737 ?auto_112739 ) ) ( CLEAR ?auto_112740 ) ( not ( = ?auto_112737 ?auto_112738 ) ) ( not ( = ?auto_112737 ?auto_112740 ) ) ( not ( = ?auto_112739 ?auto_112738 ) ) ( not ( = ?auto_112739 ?auto_112740 ) ) ( not ( = ?auto_112738 ?auto_112740 ) ) ( ON ?auto_112738 ?auto_112737 ) ( CLEAR ?auto_112738 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_112739 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_112739 ?auto_112737 )
      ( MAKE-1PILE ?auto_112737 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_112741 - BLOCK
    )
    :vars
    (
      ?auto_112743 - BLOCK
      ?auto_112742 - BLOCK
      ?auto_112744 - BLOCK
      ?auto_112747 - BLOCK
      ?auto_112748 - BLOCK
      ?auto_112746 - BLOCK
      ?auto_112745 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112741 ?auto_112743 ) ( not ( = ?auto_112741 ?auto_112743 ) ) ( not ( = ?auto_112741 ?auto_112742 ) ) ( not ( = ?auto_112741 ?auto_112744 ) ) ( not ( = ?auto_112743 ?auto_112742 ) ) ( not ( = ?auto_112743 ?auto_112744 ) ) ( not ( = ?auto_112742 ?auto_112744 ) ) ( ON ?auto_112742 ?auto_112741 ) ( CLEAR ?auto_112742 ) ( ON-TABLE ?auto_112743 ) ( HOLDING ?auto_112744 ) ( CLEAR ?auto_112747 ) ( ON-TABLE ?auto_112748 ) ( ON ?auto_112746 ?auto_112748 ) ( ON ?auto_112745 ?auto_112746 ) ( ON ?auto_112747 ?auto_112745 ) ( not ( = ?auto_112748 ?auto_112746 ) ) ( not ( = ?auto_112748 ?auto_112745 ) ) ( not ( = ?auto_112748 ?auto_112747 ) ) ( not ( = ?auto_112748 ?auto_112744 ) ) ( not ( = ?auto_112746 ?auto_112745 ) ) ( not ( = ?auto_112746 ?auto_112747 ) ) ( not ( = ?auto_112746 ?auto_112744 ) ) ( not ( = ?auto_112745 ?auto_112747 ) ) ( not ( = ?auto_112745 ?auto_112744 ) ) ( not ( = ?auto_112747 ?auto_112744 ) ) ( not ( = ?auto_112741 ?auto_112747 ) ) ( not ( = ?auto_112741 ?auto_112748 ) ) ( not ( = ?auto_112741 ?auto_112746 ) ) ( not ( = ?auto_112741 ?auto_112745 ) ) ( not ( = ?auto_112743 ?auto_112747 ) ) ( not ( = ?auto_112743 ?auto_112748 ) ) ( not ( = ?auto_112743 ?auto_112746 ) ) ( not ( = ?auto_112743 ?auto_112745 ) ) ( not ( = ?auto_112742 ?auto_112747 ) ) ( not ( = ?auto_112742 ?auto_112748 ) ) ( not ( = ?auto_112742 ?auto_112746 ) ) ( not ( = ?auto_112742 ?auto_112745 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_112748 ?auto_112746 ?auto_112745 ?auto_112747 ?auto_112744 )
      ( MAKE-1PILE ?auto_112741 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_112749 - BLOCK
    )
    :vars
    (
      ?auto_112756 - BLOCK
      ?auto_112753 - BLOCK
      ?auto_112754 - BLOCK
      ?auto_112751 - BLOCK
      ?auto_112752 - BLOCK
      ?auto_112755 - BLOCK
      ?auto_112750 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112749 ?auto_112756 ) ( not ( = ?auto_112749 ?auto_112756 ) ) ( not ( = ?auto_112749 ?auto_112753 ) ) ( not ( = ?auto_112749 ?auto_112754 ) ) ( not ( = ?auto_112756 ?auto_112753 ) ) ( not ( = ?auto_112756 ?auto_112754 ) ) ( not ( = ?auto_112753 ?auto_112754 ) ) ( ON ?auto_112753 ?auto_112749 ) ( ON-TABLE ?auto_112756 ) ( CLEAR ?auto_112751 ) ( ON-TABLE ?auto_112752 ) ( ON ?auto_112755 ?auto_112752 ) ( ON ?auto_112750 ?auto_112755 ) ( ON ?auto_112751 ?auto_112750 ) ( not ( = ?auto_112752 ?auto_112755 ) ) ( not ( = ?auto_112752 ?auto_112750 ) ) ( not ( = ?auto_112752 ?auto_112751 ) ) ( not ( = ?auto_112752 ?auto_112754 ) ) ( not ( = ?auto_112755 ?auto_112750 ) ) ( not ( = ?auto_112755 ?auto_112751 ) ) ( not ( = ?auto_112755 ?auto_112754 ) ) ( not ( = ?auto_112750 ?auto_112751 ) ) ( not ( = ?auto_112750 ?auto_112754 ) ) ( not ( = ?auto_112751 ?auto_112754 ) ) ( not ( = ?auto_112749 ?auto_112751 ) ) ( not ( = ?auto_112749 ?auto_112752 ) ) ( not ( = ?auto_112749 ?auto_112755 ) ) ( not ( = ?auto_112749 ?auto_112750 ) ) ( not ( = ?auto_112756 ?auto_112751 ) ) ( not ( = ?auto_112756 ?auto_112752 ) ) ( not ( = ?auto_112756 ?auto_112755 ) ) ( not ( = ?auto_112756 ?auto_112750 ) ) ( not ( = ?auto_112753 ?auto_112751 ) ) ( not ( = ?auto_112753 ?auto_112752 ) ) ( not ( = ?auto_112753 ?auto_112755 ) ) ( not ( = ?auto_112753 ?auto_112750 ) ) ( ON ?auto_112754 ?auto_112753 ) ( CLEAR ?auto_112754 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_112756 ?auto_112749 ?auto_112753 )
      ( MAKE-1PILE ?auto_112749 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_112757 - BLOCK
    )
    :vars
    (
      ?auto_112760 - BLOCK
      ?auto_112764 - BLOCK
      ?auto_112762 - BLOCK
      ?auto_112759 - BLOCK
      ?auto_112761 - BLOCK
      ?auto_112758 - BLOCK
      ?auto_112763 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112757 ?auto_112760 ) ( not ( = ?auto_112757 ?auto_112760 ) ) ( not ( = ?auto_112757 ?auto_112764 ) ) ( not ( = ?auto_112757 ?auto_112762 ) ) ( not ( = ?auto_112760 ?auto_112764 ) ) ( not ( = ?auto_112760 ?auto_112762 ) ) ( not ( = ?auto_112764 ?auto_112762 ) ) ( ON ?auto_112764 ?auto_112757 ) ( ON-TABLE ?auto_112760 ) ( ON-TABLE ?auto_112759 ) ( ON ?auto_112761 ?auto_112759 ) ( ON ?auto_112758 ?auto_112761 ) ( not ( = ?auto_112759 ?auto_112761 ) ) ( not ( = ?auto_112759 ?auto_112758 ) ) ( not ( = ?auto_112759 ?auto_112763 ) ) ( not ( = ?auto_112759 ?auto_112762 ) ) ( not ( = ?auto_112761 ?auto_112758 ) ) ( not ( = ?auto_112761 ?auto_112763 ) ) ( not ( = ?auto_112761 ?auto_112762 ) ) ( not ( = ?auto_112758 ?auto_112763 ) ) ( not ( = ?auto_112758 ?auto_112762 ) ) ( not ( = ?auto_112763 ?auto_112762 ) ) ( not ( = ?auto_112757 ?auto_112763 ) ) ( not ( = ?auto_112757 ?auto_112759 ) ) ( not ( = ?auto_112757 ?auto_112761 ) ) ( not ( = ?auto_112757 ?auto_112758 ) ) ( not ( = ?auto_112760 ?auto_112763 ) ) ( not ( = ?auto_112760 ?auto_112759 ) ) ( not ( = ?auto_112760 ?auto_112761 ) ) ( not ( = ?auto_112760 ?auto_112758 ) ) ( not ( = ?auto_112764 ?auto_112763 ) ) ( not ( = ?auto_112764 ?auto_112759 ) ) ( not ( = ?auto_112764 ?auto_112761 ) ) ( not ( = ?auto_112764 ?auto_112758 ) ) ( ON ?auto_112762 ?auto_112764 ) ( CLEAR ?auto_112762 ) ( HOLDING ?auto_112763 ) ( CLEAR ?auto_112758 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_112759 ?auto_112761 ?auto_112758 ?auto_112763 )
      ( MAKE-1PILE ?auto_112757 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_112765 - BLOCK
    )
    :vars
    (
      ?auto_112766 - BLOCK
      ?auto_112767 - BLOCK
      ?auto_112772 - BLOCK
      ?auto_112771 - BLOCK
      ?auto_112769 - BLOCK
      ?auto_112770 - BLOCK
      ?auto_112768 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112765 ?auto_112766 ) ( not ( = ?auto_112765 ?auto_112766 ) ) ( not ( = ?auto_112765 ?auto_112767 ) ) ( not ( = ?auto_112765 ?auto_112772 ) ) ( not ( = ?auto_112766 ?auto_112767 ) ) ( not ( = ?auto_112766 ?auto_112772 ) ) ( not ( = ?auto_112767 ?auto_112772 ) ) ( ON ?auto_112767 ?auto_112765 ) ( ON-TABLE ?auto_112766 ) ( ON-TABLE ?auto_112771 ) ( ON ?auto_112769 ?auto_112771 ) ( ON ?auto_112770 ?auto_112769 ) ( not ( = ?auto_112771 ?auto_112769 ) ) ( not ( = ?auto_112771 ?auto_112770 ) ) ( not ( = ?auto_112771 ?auto_112768 ) ) ( not ( = ?auto_112771 ?auto_112772 ) ) ( not ( = ?auto_112769 ?auto_112770 ) ) ( not ( = ?auto_112769 ?auto_112768 ) ) ( not ( = ?auto_112769 ?auto_112772 ) ) ( not ( = ?auto_112770 ?auto_112768 ) ) ( not ( = ?auto_112770 ?auto_112772 ) ) ( not ( = ?auto_112768 ?auto_112772 ) ) ( not ( = ?auto_112765 ?auto_112768 ) ) ( not ( = ?auto_112765 ?auto_112771 ) ) ( not ( = ?auto_112765 ?auto_112769 ) ) ( not ( = ?auto_112765 ?auto_112770 ) ) ( not ( = ?auto_112766 ?auto_112768 ) ) ( not ( = ?auto_112766 ?auto_112771 ) ) ( not ( = ?auto_112766 ?auto_112769 ) ) ( not ( = ?auto_112766 ?auto_112770 ) ) ( not ( = ?auto_112767 ?auto_112768 ) ) ( not ( = ?auto_112767 ?auto_112771 ) ) ( not ( = ?auto_112767 ?auto_112769 ) ) ( not ( = ?auto_112767 ?auto_112770 ) ) ( ON ?auto_112772 ?auto_112767 ) ( CLEAR ?auto_112770 ) ( ON ?auto_112768 ?auto_112772 ) ( CLEAR ?auto_112768 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_112766 ?auto_112765 ?auto_112767 ?auto_112772 )
      ( MAKE-1PILE ?auto_112765 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_112773 - BLOCK
    )
    :vars
    (
      ?auto_112775 - BLOCK
      ?auto_112774 - BLOCK
      ?auto_112776 - BLOCK
      ?auto_112779 - BLOCK
      ?auto_112778 - BLOCK
      ?auto_112780 - BLOCK
      ?auto_112777 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112773 ?auto_112775 ) ( not ( = ?auto_112773 ?auto_112775 ) ) ( not ( = ?auto_112773 ?auto_112774 ) ) ( not ( = ?auto_112773 ?auto_112776 ) ) ( not ( = ?auto_112775 ?auto_112774 ) ) ( not ( = ?auto_112775 ?auto_112776 ) ) ( not ( = ?auto_112774 ?auto_112776 ) ) ( ON ?auto_112774 ?auto_112773 ) ( ON-TABLE ?auto_112775 ) ( ON-TABLE ?auto_112779 ) ( ON ?auto_112778 ?auto_112779 ) ( not ( = ?auto_112779 ?auto_112778 ) ) ( not ( = ?auto_112779 ?auto_112780 ) ) ( not ( = ?auto_112779 ?auto_112777 ) ) ( not ( = ?auto_112779 ?auto_112776 ) ) ( not ( = ?auto_112778 ?auto_112780 ) ) ( not ( = ?auto_112778 ?auto_112777 ) ) ( not ( = ?auto_112778 ?auto_112776 ) ) ( not ( = ?auto_112780 ?auto_112777 ) ) ( not ( = ?auto_112780 ?auto_112776 ) ) ( not ( = ?auto_112777 ?auto_112776 ) ) ( not ( = ?auto_112773 ?auto_112777 ) ) ( not ( = ?auto_112773 ?auto_112779 ) ) ( not ( = ?auto_112773 ?auto_112778 ) ) ( not ( = ?auto_112773 ?auto_112780 ) ) ( not ( = ?auto_112775 ?auto_112777 ) ) ( not ( = ?auto_112775 ?auto_112779 ) ) ( not ( = ?auto_112775 ?auto_112778 ) ) ( not ( = ?auto_112775 ?auto_112780 ) ) ( not ( = ?auto_112774 ?auto_112777 ) ) ( not ( = ?auto_112774 ?auto_112779 ) ) ( not ( = ?auto_112774 ?auto_112778 ) ) ( not ( = ?auto_112774 ?auto_112780 ) ) ( ON ?auto_112776 ?auto_112774 ) ( ON ?auto_112777 ?auto_112776 ) ( CLEAR ?auto_112777 ) ( HOLDING ?auto_112780 ) ( CLEAR ?auto_112778 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_112779 ?auto_112778 ?auto_112780 )
      ( MAKE-1PILE ?auto_112773 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_112781 - BLOCK
    )
    :vars
    (
      ?auto_112786 - BLOCK
      ?auto_112788 - BLOCK
      ?auto_112782 - BLOCK
      ?auto_112785 - BLOCK
      ?auto_112784 - BLOCK
      ?auto_112787 - BLOCK
      ?auto_112783 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112781 ?auto_112786 ) ( not ( = ?auto_112781 ?auto_112786 ) ) ( not ( = ?auto_112781 ?auto_112788 ) ) ( not ( = ?auto_112781 ?auto_112782 ) ) ( not ( = ?auto_112786 ?auto_112788 ) ) ( not ( = ?auto_112786 ?auto_112782 ) ) ( not ( = ?auto_112788 ?auto_112782 ) ) ( ON ?auto_112788 ?auto_112781 ) ( ON-TABLE ?auto_112786 ) ( ON-TABLE ?auto_112785 ) ( ON ?auto_112784 ?auto_112785 ) ( not ( = ?auto_112785 ?auto_112784 ) ) ( not ( = ?auto_112785 ?auto_112787 ) ) ( not ( = ?auto_112785 ?auto_112783 ) ) ( not ( = ?auto_112785 ?auto_112782 ) ) ( not ( = ?auto_112784 ?auto_112787 ) ) ( not ( = ?auto_112784 ?auto_112783 ) ) ( not ( = ?auto_112784 ?auto_112782 ) ) ( not ( = ?auto_112787 ?auto_112783 ) ) ( not ( = ?auto_112787 ?auto_112782 ) ) ( not ( = ?auto_112783 ?auto_112782 ) ) ( not ( = ?auto_112781 ?auto_112783 ) ) ( not ( = ?auto_112781 ?auto_112785 ) ) ( not ( = ?auto_112781 ?auto_112784 ) ) ( not ( = ?auto_112781 ?auto_112787 ) ) ( not ( = ?auto_112786 ?auto_112783 ) ) ( not ( = ?auto_112786 ?auto_112785 ) ) ( not ( = ?auto_112786 ?auto_112784 ) ) ( not ( = ?auto_112786 ?auto_112787 ) ) ( not ( = ?auto_112788 ?auto_112783 ) ) ( not ( = ?auto_112788 ?auto_112785 ) ) ( not ( = ?auto_112788 ?auto_112784 ) ) ( not ( = ?auto_112788 ?auto_112787 ) ) ( ON ?auto_112782 ?auto_112788 ) ( ON ?auto_112783 ?auto_112782 ) ( CLEAR ?auto_112784 ) ( ON ?auto_112787 ?auto_112783 ) ( CLEAR ?auto_112787 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_112786 ?auto_112781 ?auto_112788 ?auto_112782 ?auto_112783 )
      ( MAKE-1PILE ?auto_112781 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_112789 - BLOCK
    )
    :vars
    (
      ?auto_112791 - BLOCK
      ?auto_112793 - BLOCK
      ?auto_112792 - BLOCK
      ?auto_112794 - BLOCK
      ?auto_112795 - BLOCK
      ?auto_112790 - BLOCK
      ?auto_112796 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112789 ?auto_112791 ) ( not ( = ?auto_112789 ?auto_112791 ) ) ( not ( = ?auto_112789 ?auto_112793 ) ) ( not ( = ?auto_112789 ?auto_112792 ) ) ( not ( = ?auto_112791 ?auto_112793 ) ) ( not ( = ?auto_112791 ?auto_112792 ) ) ( not ( = ?auto_112793 ?auto_112792 ) ) ( ON ?auto_112793 ?auto_112789 ) ( ON-TABLE ?auto_112791 ) ( ON-TABLE ?auto_112794 ) ( not ( = ?auto_112794 ?auto_112795 ) ) ( not ( = ?auto_112794 ?auto_112790 ) ) ( not ( = ?auto_112794 ?auto_112796 ) ) ( not ( = ?auto_112794 ?auto_112792 ) ) ( not ( = ?auto_112795 ?auto_112790 ) ) ( not ( = ?auto_112795 ?auto_112796 ) ) ( not ( = ?auto_112795 ?auto_112792 ) ) ( not ( = ?auto_112790 ?auto_112796 ) ) ( not ( = ?auto_112790 ?auto_112792 ) ) ( not ( = ?auto_112796 ?auto_112792 ) ) ( not ( = ?auto_112789 ?auto_112796 ) ) ( not ( = ?auto_112789 ?auto_112794 ) ) ( not ( = ?auto_112789 ?auto_112795 ) ) ( not ( = ?auto_112789 ?auto_112790 ) ) ( not ( = ?auto_112791 ?auto_112796 ) ) ( not ( = ?auto_112791 ?auto_112794 ) ) ( not ( = ?auto_112791 ?auto_112795 ) ) ( not ( = ?auto_112791 ?auto_112790 ) ) ( not ( = ?auto_112793 ?auto_112796 ) ) ( not ( = ?auto_112793 ?auto_112794 ) ) ( not ( = ?auto_112793 ?auto_112795 ) ) ( not ( = ?auto_112793 ?auto_112790 ) ) ( ON ?auto_112792 ?auto_112793 ) ( ON ?auto_112796 ?auto_112792 ) ( ON ?auto_112790 ?auto_112796 ) ( CLEAR ?auto_112790 ) ( HOLDING ?auto_112795 ) ( CLEAR ?auto_112794 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_112794 ?auto_112795 )
      ( MAKE-1PILE ?auto_112789 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_112797 - BLOCK
    )
    :vars
    (
      ?auto_112802 - BLOCK
      ?auto_112800 - BLOCK
      ?auto_112804 - BLOCK
      ?auto_112799 - BLOCK
      ?auto_112801 - BLOCK
      ?auto_112798 - BLOCK
      ?auto_112803 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112797 ?auto_112802 ) ( not ( = ?auto_112797 ?auto_112802 ) ) ( not ( = ?auto_112797 ?auto_112800 ) ) ( not ( = ?auto_112797 ?auto_112804 ) ) ( not ( = ?auto_112802 ?auto_112800 ) ) ( not ( = ?auto_112802 ?auto_112804 ) ) ( not ( = ?auto_112800 ?auto_112804 ) ) ( ON ?auto_112800 ?auto_112797 ) ( ON-TABLE ?auto_112802 ) ( ON-TABLE ?auto_112799 ) ( not ( = ?auto_112799 ?auto_112801 ) ) ( not ( = ?auto_112799 ?auto_112798 ) ) ( not ( = ?auto_112799 ?auto_112803 ) ) ( not ( = ?auto_112799 ?auto_112804 ) ) ( not ( = ?auto_112801 ?auto_112798 ) ) ( not ( = ?auto_112801 ?auto_112803 ) ) ( not ( = ?auto_112801 ?auto_112804 ) ) ( not ( = ?auto_112798 ?auto_112803 ) ) ( not ( = ?auto_112798 ?auto_112804 ) ) ( not ( = ?auto_112803 ?auto_112804 ) ) ( not ( = ?auto_112797 ?auto_112803 ) ) ( not ( = ?auto_112797 ?auto_112799 ) ) ( not ( = ?auto_112797 ?auto_112801 ) ) ( not ( = ?auto_112797 ?auto_112798 ) ) ( not ( = ?auto_112802 ?auto_112803 ) ) ( not ( = ?auto_112802 ?auto_112799 ) ) ( not ( = ?auto_112802 ?auto_112801 ) ) ( not ( = ?auto_112802 ?auto_112798 ) ) ( not ( = ?auto_112800 ?auto_112803 ) ) ( not ( = ?auto_112800 ?auto_112799 ) ) ( not ( = ?auto_112800 ?auto_112801 ) ) ( not ( = ?auto_112800 ?auto_112798 ) ) ( ON ?auto_112804 ?auto_112800 ) ( ON ?auto_112803 ?auto_112804 ) ( ON ?auto_112798 ?auto_112803 ) ( CLEAR ?auto_112799 ) ( ON ?auto_112801 ?auto_112798 ) ( CLEAR ?auto_112801 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_112802 ?auto_112797 ?auto_112800 ?auto_112804 ?auto_112803 ?auto_112798 )
      ( MAKE-1PILE ?auto_112797 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_112805 - BLOCK
    )
    :vars
    (
      ?auto_112808 - BLOCK
      ?auto_112811 - BLOCK
      ?auto_112806 - BLOCK
      ?auto_112812 - BLOCK
      ?auto_112807 - BLOCK
      ?auto_112810 - BLOCK
      ?auto_112809 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112805 ?auto_112808 ) ( not ( = ?auto_112805 ?auto_112808 ) ) ( not ( = ?auto_112805 ?auto_112811 ) ) ( not ( = ?auto_112805 ?auto_112806 ) ) ( not ( = ?auto_112808 ?auto_112811 ) ) ( not ( = ?auto_112808 ?auto_112806 ) ) ( not ( = ?auto_112811 ?auto_112806 ) ) ( ON ?auto_112811 ?auto_112805 ) ( ON-TABLE ?auto_112808 ) ( not ( = ?auto_112812 ?auto_112807 ) ) ( not ( = ?auto_112812 ?auto_112810 ) ) ( not ( = ?auto_112812 ?auto_112809 ) ) ( not ( = ?auto_112812 ?auto_112806 ) ) ( not ( = ?auto_112807 ?auto_112810 ) ) ( not ( = ?auto_112807 ?auto_112809 ) ) ( not ( = ?auto_112807 ?auto_112806 ) ) ( not ( = ?auto_112810 ?auto_112809 ) ) ( not ( = ?auto_112810 ?auto_112806 ) ) ( not ( = ?auto_112809 ?auto_112806 ) ) ( not ( = ?auto_112805 ?auto_112809 ) ) ( not ( = ?auto_112805 ?auto_112812 ) ) ( not ( = ?auto_112805 ?auto_112807 ) ) ( not ( = ?auto_112805 ?auto_112810 ) ) ( not ( = ?auto_112808 ?auto_112809 ) ) ( not ( = ?auto_112808 ?auto_112812 ) ) ( not ( = ?auto_112808 ?auto_112807 ) ) ( not ( = ?auto_112808 ?auto_112810 ) ) ( not ( = ?auto_112811 ?auto_112809 ) ) ( not ( = ?auto_112811 ?auto_112812 ) ) ( not ( = ?auto_112811 ?auto_112807 ) ) ( not ( = ?auto_112811 ?auto_112810 ) ) ( ON ?auto_112806 ?auto_112811 ) ( ON ?auto_112809 ?auto_112806 ) ( ON ?auto_112810 ?auto_112809 ) ( ON ?auto_112807 ?auto_112810 ) ( CLEAR ?auto_112807 ) ( HOLDING ?auto_112812 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_112812 )
      ( MAKE-1PILE ?auto_112805 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_112813 - BLOCK
    )
    :vars
    (
      ?auto_112818 - BLOCK
      ?auto_112817 - BLOCK
      ?auto_112815 - BLOCK
      ?auto_112820 - BLOCK
      ?auto_112819 - BLOCK
      ?auto_112816 - BLOCK
      ?auto_112814 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112813 ?auto_112818 ) ( not ( = ?auto_112813 ?auto_112818 ) ) ( not ( = ?auto_112813 ?auto_112817 ) ) ( not ( = ?auto_112813 ?auto_112815 ) ) ( not ( = ?auto_112818 ?auto_112817 ) ) ( not ( = ?auto_112818 ?auto_112815 ) ) ( not ( = ?auto_112817 ?auto_112815 ) ) ( ON ?auto_112817 ?auto_112813 ) ( ON-TABLE ?auto_112818 ) ( not ( = ?auto_112820 ?auto_112819 ) ) ( not ( = ?auto_112820 ?auto_112816 ) ) ( not ( = ?auto_112820 ?auto_112814 ) ) ( not ( = ?auto_112820 ?auto_112815 ) ) ( not ( = ?auto_112819 ?auto_112816 ) ) ( not ( = ?auto_112819 ?auto_112814 ) ) ( not ( = ?auto_112819 ?auto_112815 ) ) ( not ( = ?auto_112816 ?auto_112814 ) ) ( not ( = ?auto_112816 ?auto_112815 ) ) ( not ( = ?auto_112814 ?auto_112815 ) ) ( not ( = ?auto_112813 ?auto_112814 ) ) ( not ( = ?auto_112813 ?auto_112820 ) ) ( not ( = ?auto_112813 ?auto_112819 ) ) ( not ( = ?auto_112813 ?auto_112816 ) ) ( not ( = ?auto_112818 ?auto_112814 ) ) ( not ( = ?auto_112818 ?auto_112820 ) ) ( not ( = ?auto_112818 ?auto_112819 ) ) ( not ( = ?auto_112818 ?auto_112816 ) ) ( not ( = ?auto_112817 ?auto_112814 ) ) ( not ( = ?auto_112817 ?auto_112820 ) ) ( not ( = ?auto_112817 ?auto_112819 ) ) ( not ( = ?auto_112817 ?auto_112816 ) ) ( ON ?auto_112815 ?auto_112817 ) ( ON ?auto_112814 ?auto_112815 ) ( ON ?auto_112816 ?auto_112814 ) ( ON ?auto_112819 ?auto_112816 ) ( ON ?auto_112820 ?auto_112819 ) ( CLEAR ?auto_112820 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_112818 ?auto_112813 ?auto_112817 ?auto_112815 ?auto_112814 ?auto_112816 ?auto_112819 )
      ( MAKE-1PILE ?auto_112813 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_112832 - BLOCK
      ?auto_112833 - BLOCK
      ?auto_112834 - BLOCK
      ?auto_112835 - BLOCK
      ?auto_112836 - BLOCK
    )
    :vars
    (
      ?auto_112837 - BLOCK
      ?auto_112838 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112837 ?auto_112836 ) ( CLEAR ?auto_112837 ) ( ON-TABLE ?auto_112832 ) ( ON ?auto_112833 ?auto_112832 ) ( ON ?auto_112834 ?auto_112833 ) ( ON ?auto_112835 ?auto_112834 ) ( ON ?auto_112836 ?auto_112835 ) ( not ( = ?auto_112832 ?auto_112833 ) ) ( not ( = ?auto_112832 ?auto_112834 ) ) ( not ( = ?auto_112832 ?auto_112835 ) ) ( not ( = ?auto_112832 ?auto_112836 ) ) ( not ( = ?auto_112832 ?auto_112837 ) ) ( not ( = ?auto_112833 ?auto_112834 ) ) ( not ( = ?auto_112833 ?auto_112835 ) ) ( not ( = ?auto_112833 ?auto_112836 ) ) ( not ( = ?auto_112833 ?auto_112837 ) ) ( not ( = ?auto_112834 ?auto_112835 ) ) ( not ( = ?auto_112834 ?auto_112836 ) ) ( not ( = ?auto_112834 ?auto_112837 ) ) ( not ( = ?auto_112835 ?auto_112836 ) ) ( not ( = ?auto_112835 ?auto_112837 ) ) ( not ( = ?auto_112836 ?auto_112837 ) ) ( HOLDING ?auto_112838 ) ( not ( = ?auto_112832 ?auto_112838 ) ) ( not ( = ?auto_112833 ?auto_112838 ) ) ( not ( = ?auto_112834 ?auto_112838 ) ) ( not ( = ?auto_112835 ?auto_112838 ) ) ( not ( = ?auto_112836 ?auto_112838 ) ) ( not ( = ?auto_112837 ?auto_112838 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_112838 )
      ( MAKE-5PILE ?auto_112832 ?auto_112833 ?auto_112834 ?auto_112835 ?auto_112836 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_112929 - BLOCK
      ?auto_112930 - BLOCK
    )
    :vars
    (
      ?auto_112931 - BLOCK
      ?auto_112935 - BLOCK
      ?auto_112934 - BLOCK
      ?auto_112932 - BLOCK
      ?auto_112933 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_112929 ?auto_112930 ) ) ( ON ?auto_112930 ?auto_112931 ) ( not ( = ?auto_112929 ?auto_112931 ) ) ( not ( = ?auto_112930 ?auto_112931 ) ) ( ON ?auto_112929 ?auto_112930 ) ( CLEAR ?auto_112929 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_112935 ) ( ON ?auto_112934 ?auto_112935 ) ( ON ?auto_112932 ?auto_112934 ) ( ON ?auto_112933 ?auto_112932 ) ( ON ?auto_112931 ?auto_112933 ) ( not ( = ?auto_112935 ?auto_112934 ) ) ( not ( = ?auto_112935 ?auto_112932 ) ) ( not ( = ?auto_112935 ?auto_112933 ) ) ( not ( = ?auto_112935 ?auto_112931 ) ) ( not ( = ?auto_112935 ?auto_112930 ) ) ( not ( = ?auto_112935 ?auto_112929 ) ) ( not ( = ?auto_112934 ?auto_112932 ) ) ( not ( = ?auto_112934 ?auto_112933 ) ) ( not ( = ?auto_112934 ?auto_112931 ) ) ( not ( = ?auto_112934 ?auto_112930 ) ) ( not ( = ?auto_112934 ?auto_112929 ) ) ( not ( = ?auto_112932 ?auto_112933 ) ) ( not ( = ?auto_112932 ?auto_112931 ) ) ( not ( = ?auto_112932 ?auto_112930 ) ) ( not ( = ?auto_112932 ?auto_112929 ) ) ( not ( = ?auto_112933 ?auto_112931 ) ) ( not ( = ?auto_112933 ?auto_112930 ) ) ( not ( = ?auto_112933 ?auto_112929 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_112935 ?auto_112934 ?auto_112932 ?auto_112933 ?auto_112931 ?auto_112930 )
      ( MAKE-2PILE ?auto_112929 ?auto_112930 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_112938 - BLOCK
      ?auto_112939 - BLOCK
    )
    :vars
    (
      ?auto_112940 - BLOCK
      ?auto_112941 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_112938 ?auto_112939 ) ) ( ON ?auto_112939 ?auto_112940 ) ( CLEAR ?auto_112939 ) ( not ( = ?auto_112938 ?auto_112940 ) ) ( not ( = ?auto_112939 ?auto_112940 ) ) ( ON ?auto_112938 ?auto_112941 ) ( CLEAR ?auto_112938 ) ( HAND-EMPTY ) ( not ( = ?auto_112938 ?auto_112941 ) ) ( not ( = ?auto_112939 ?auto_112941 ) ) ( not ( = ?auto_112940 ?auto_112941 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_112938 ?auto_112941 )
      ( MAKE-2PILE ?auto_112938 ?auto_112939 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_112942 - BLOCK
      ?auto_112943 - BLOCK
    )
    :vars
    (
      ?auto_112945 - BLOCK
      ?auto_112944 - BLOCK
      ?auto_112949 - BLOCK
      ?auto_112947 - BLOCK
      ?auto_112948 - BLOCK
      ?auto_112946 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_112942 ?auto_112943 ) ) ( not ( = ?auto_112942 ?auto_112945 ) ) ( not ( = ?auto_112943 ?auto_112945 ) ) ( ON ?auto_112942 ?auto_112944 ) ( CLEAR ?auto_112942 ) ( not ( = ?auto_112942 ?auto_112944 ) ) ( not ( = ?auto_112943 ?auto_112944 ) ) ( not ( = ?auto_112945 ?auto_112944 ) ) ( HOLDING ?auto_112943 ) ( CLEAR ?auto_112945 ) ( ON-TABLE ?auto_112949 ) ( ON ?auto_112947 ?auto_112949 ) ( ON ?auto_112948 ?auto_112947 ) ( ON ?auto_112946 ?auto_112948 ) ( ON ?auto_112945 ?auto_112946 ) ( not ( = ?auto_112949 ?auto_112947 ) ) ( not ( = ?auto_112949 ?auto_112948 ) ) ( not ( = ?auto_112949 ?auto_112946 ) ) ( not ( = ?auto_112949 ?auto_112945 ) ) ( not ( = ?auto_112949 ?auto_112943 ) ) ( not ( = ?auto_112947 ?auto_112948 ) ) ( not ( = ?auto_112947 ?auto_112946 ) ) ( not ( = ?auto_112947 ?auto_112945 ) ) ( not ( = ?auto_112947 ?auto_112943 ) ) ( not ( = ?auto_112948 ?auto_112946 ) ) ( not ( = ?auto_112948 ?auto_112945 ) ) ( not ( = ?auto_112948 ?auto_112943 ) ) ( not ( = ?auto_112946 ?auto_112945 ) ) ( not ( = ?auto_112946 ?auto_112943 ) ) ( not ( = ?auto_112942 ?auto_112949 ) ) ( not ( = ?auto_112942 ?auto_112947 ) ) ( not ( = ?auto_112942 ?auto_112948 ) ) ( not ( = ?auto_112942 ?auto_112946 ) ) ( not ( = ?auto_112944 ?auto_112949 ) ) ( not ( = ?auto_112944 ?auto_112947 ) ) ( not ( = ?auto_112944 ?auto_112948 ) ) ( not ( = ?auto_112944 ?auto_112946 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_112949 ?auto_112947 ?auto_112948 ?auto_112946 ?auto_112945 ?auto_112943 )
      ( MAKE-2PILE ?auto_112942 ?auto_112943 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_112950 - BLOCK
      ?auto_112951 - BLOCK
    )
    :vars
    (
      ?auto_112954 - BLOCK
      ?auto_112953 - BLOCK
      ?auto_112952 - BLOCK
      ?auto_112957 - BLOCK
      ?auto_112955 - BLOCK
      ?auto_112956 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_112950 ?auto_112951 ) ) ( not ( = ?auto_112950 ?auto_112954 ) ) ( not ( = ?auto_112951 ?auto_112954 ) ) ( ON ?auto_112950 ?auto_112953 ) ( not ( = ?auto_112950 ?auto_112953 ) ) ( not ( = ?auto_112951 ?auto_112953 ) ) ( not ( = ?auto_112954 ?auto_112953 ) ) ( CLEAR ?auto_112954 ) ( ON-TABLE ?auto_112952 ) ( ON ?auto_112957 ?auto_112952 ) ( ON ?auto_112955 ?auto_112957 ) ( ON ?auto_112956 ?auto_112955 ) ( ON ?auto_112954 ?auto_112956 ) ( not ( = ?auto_112952 ?auto_112957 ) ) ( not ( = ?auto_112952 ?auto_112955 ) ) ( not ( = ?auto_112952 ?auto_112956 ) ) ( not ( = ?auto_112952 ?auto_112954 ) ) ( not ( = ?auto_112952 ?auto_112951 ) ) ( not ( = ?auto_112957 ?auto_112955 ) ) ( not ( = ?auto_112957 ?auto_112956 ) ) ( not ( = ?auto_112957 ?auto_112954 ) ) ( not ( = ?auto_112957 ?auto_112951 ) ) ( not ( = ?auto_112955 ?auto_112956 ) ) ( not ( = ?auto_112955 ?auto_112954 ) ) ( not ( = ?auto_112955 ?auto_112951 ) ) ( not ( = ?auto_112956 ?auto_112954 ) ) ( not ( = ?auto_112956 ?auto_112951 ) ) ( not ( = ?auto_112950 ?auto_112952 ) ) ( not ( = ?auto_112950 ?auto_112957 ) ) ( not ( = ?auto_112950 ?auto_112955 ) ) ( not ( = ?auto_112950 ?auto_112956 ) ) ( not ( = ?auto_112953 ?auto_112952 ) ) ( not ( = ?auto_112953 ?auto_112957 ) ) ( not ( = ?auto_112953 ?auto_112955 ) ) ( not ( = ?auto_112953 ?auto_112956 ) ) ( ON ?auto_112951 ?auto_112950 ) ( CLEAR ?auto_112951 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_112953 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_112953 ?auto_112950 )
      ( MAKE-2PILE ?auto_112950 ?auto_112951 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_112958 - BLOCK
      ?auto_112959 - BLOCK
    )
    :vars
    (
      ?auto_112961 - BLOCK
      ?auto_112962 - BLOCK
      ?auto_112960 - BLOCK
      ?auto_112964 - BLOCK
      ?auto_112965 - BLOCK
      ?auto_112963 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_112958 ?auto_112959 ) ) ( not ( = ?auto_112958 ?auto_112961 ) ) ( not ( = ?auto_112959 ?auto_112961 ) ) ( ON ?auto_112958 ?auto_112962 ) ( not ( = ?auto_112958 ?auto_112962 ) ) ( not ( = ?auto_112959 ?auto_112962 ) ) ( not ( = ?auto_112961 ?auto_112962 ) ) ( ON-TABLE ?auto_112960 ) ( ON ?auto_112964 ?auto_112960 ) ( ON ?auto_112965 ?auto_112964 ) ( ON ?auto_112963 ?auto_112965 ) ( not ( = ?auto_112960 ?auto_112964 ) ) ( not ( = ?auto_112960 ?auto_112965 ) ) ( not ( = ?auto_112960 ?auto_112963 ) ) ( not ( = ?auto_112960 ?auto_112961 ) ) ( not ( = ?auto_112960 ?auto_112959 ) ) ( not ( = ?auto_112964 ?auto_112965 ) ) ( not ( = ?auto_112964 ?auto_112963 ) ) ( not ( = ?auto_112964 ?auto_112961 ) ) ( not ( = ?auto_112964 ?auto_112959 ) ) ( not ( = ?auto_112965 ?auto_112963 ) ) ( not ( = ?auto_112965 ?auto_112961 ) ) ( not ( = ?auto_112965 ?auto_112959 ) ) ( not ( = ?auto_112963 ?auto_112961 ) ) ( not ( = ?auto_112963 ?auto_112959 ) ) ( not ( = ?auto_112958 ?auto_112960 ) ) ( not ( = ?auto_112958 ?auto_112964 ) ) ( not ( = ?auto_112958 ?auto_112965 ) ) ( not ( = ?auto_112958 ?auto_112963 ) ) ( not ( = ?auto_112962 ?auto_112960 ) ) ( not ( = ?auto_112962 ?auto_112964 ) ) ( not ( = ?auto_112962 ?auto_112965 ) ) ( not ( = ?auto_112962 ?auto_112963 ) ) ( ON ?auto_112959 ?auto_112958 ) ( CLEAR ?auto_112959 ) ( ON-TABLE ?auto_112962 ) ( HOLDING ?auto_112961 ) ( CLEAR ?auto_112963 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_112960 ?auto_112964 ?auto_112965 ?auto_112963 ?auto_112961 )
      ( MAKE-2PILE ?auto_112958 ?auto_112959 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_112966 - BLOCK
      ?auto_112967 - BLOCK
    )
    :vars
    (
      ?auto_112973 - BLOCK
      ?auto_112971 - BLOCK
      ?auto_112972 - BLOCK
      ?auto_112968 - BLOCK
      ?auto_112969 - BLOCK
      ?auto_112970 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_112966 ?auto_112967 ) ) ( not ( = ?auto_112966 ?auto_112973 ) ) ( not ( = ?auto_112967 ?auto_112973 ) ) ( ON ?auto_112966 ?auto_112971 ) ( not ( = ?auto_112966 ?auto_112971 ) ) ( not ( = ?auto_112967 ?auto_112971 ) ) ( not ( = ?auto_112973 ?auto_112971 ) ) ( ON-TABLE ?auto_112972 ) ( ON ?auto_112968 ?auto_112972 ) ( ON ?auto_112969 ?auto_112968 ) ( ON ?auto_112970 ?auto_112969 ) ( not ( = ?auto_112972 ?auto_112968 ) ) ( not ( = ?auto_112972 ?auto_112969 ) ) ( not ( = ?auto_112972 ?auto_112970 ) ) ( not ( = ?auto_112972 ?auto_112973 ) ) ( not ( = ?auto_112972 ?auto_112967 ) ) ( not ( = ?auto_112968 ?auto_112969 ) ) ( not ( = ?auto_112968 ?auto_112970 ) ) ( not ( = ?auto_112968 ?auto_112973 ) ) ( not ( = ?auto_112968 ?auto_112967 ) ) ( not ( = ?auto_112969 ?auto_112970 ) ) ( not ( = ?auto_112969 ?auto_112973 ) ) ( not ( = ?auto_112969 ?auto_112967 ) ) ( not ( = ?auto_112970 ?auto_112973 ) ) ( not ( = ?auto_112970 ?auto_112967 ) ) ( not ( = ?auto_112966 ?auto_112972 ) ) ( not ( = ?auto_112966 ?auto_112968 ) ) ( not ( = ?auto_112966 ?auto_112969 ) ) ( not ( = ?auto_112966 ?auto_112970 ) ) ( not ( = ?auto_112971 ?auto_112972 ) ) ( not ( = ?auto_112971 ?auto_112968 ) ) ( not ( = ?auto_112971 ?auto_112969 ) ) ( not ( = ?auto_112971 ?auto_112970 ) ) ( ON ?auto_112967 ?auto_112966 ) ( ON-TABLE ?auto_112971 ) ( CLEAR ?auto_112970 ) ( ON ?auto_112973 ?auto_112967 ) ( CLEAR ?auto_112973 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_112971 ?auto_112966 ?auto_112967 )
      ( MAKE-2PILE ?auto_112966 ?auto_112967 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_112974 - BLOCK
      ?auto_112975 - BLOCK
    )
    :vars
    (
      ?auto_112981 - BLOCK
      ?auto_112977 - BLOCK
      ?auto_112976 - BLOCK
      ?auto_112979 - BLOCK
      ?auto_112980 - BLOCK
      ?auto_112978 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_112974 ?auto_112975 ) ) ( not ( = ?auto_112974 ?auto_112981 ) ) ( not ( = ?auto_112975 ?auto_112981 ) ) ( ON ?auto_112974 ?auto_112977 ) ( not ( = ?auto_112974 ?auto_112977 ) ) ( not ( = ?auto_112975 ?auto_112977 ) ) ( not ( = ?auto_112981 ?auto_112977 ) ) ( ON-TABLE ?auto_112976 ) ( ON ?auto_112979 ?auto_112976 ) ( ON ?auto_112980 ?auto_112979 ) ( not ( = ?auto_112976 ?auto_112979 ) ) ( not ( = ?auto_112976 ?auto_112980 ) ) ( not ( = ?auto_112976 ?auto_112978 ) ) ( not ( = ?auto_112976 ?auto_112981 ) ) ( not ( = ?auto_112976 ?auto_112975 ) ) ( not ( = ?auto_112979 ?auto_112980 ) ) ( not ( = ?auto_112979 ?auto_112978 ) ) ( not ( = ?auto_112979 ?auto_112981 ) ) ( not ( = ?auto_112979 ?auto_112975 ) ) ( not ( = ?auto_112980 ?auto_112978 ) ) ( not ( = ?auto_112980 ?auto_112981 ) ) ( not ( = ?auto_112980 ?auto_112975 ) ) ( not ( = ?auto_112978 ?auto_112981 ) ) ( not ( = ?auto_112978 ?auto_112975 ) ) ( not ( = ?auto_112974 ?auto_112976 ) ) ( not ( = ?auto_112974 ?auto_112979 ) ) ( not ( = ?auto_112974 ?auto_112980 ) ) ( not ( = ?auto_112974 ?auto_112978 ) ) ( not ( = ?auto_112977 ?auto_112976 ) ) ( not ( = ?auto_112977 ?auto_112979 ) ) ( not ( = ?auto_112977 ?auto_112980 ) ) ( not ( = ?auto_112977 ?auto_112978 ) ) ( ON ?auto_112975 ?auto_112974 ) ( ON-TABLE ?auto_112977 ) ( ON ?auto_112981 ?auto_112975 ) ( CLEAR ?auto_112981 ) ( HOLDING ?auto_112978 ) ( CLEAR ?auto_112980 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_112976 ?auto_112979 ?auto_112980 ?auto_112978 )
      ( MAKE-2PILE ?auto_112974 ?auto_112975 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_112982 - BLOCK
      ?auto_112983 - BLOCK
    )
    :vars
    (
      ?auto_112989 - BLOCK
      ?auto_112987 - BLOCK
      ?auto_112988 - BLOCK
      ?auto_112984 - BLOCK
      ?auto_112986 - BLOCK
      ?auto_112985 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_112982 ?auto_112983 ) ) ( not ( = ?auto_112982 ?auto_112989 ) ) ( not ( = ?auto_112983 ?auto_112989 ) ) ( ON ?auto_112982 ?auto_112987 ) ( not ( = ?auto_112982 ?auto_112987 ) ) ( not ( = ?auto_112983 ?auto_112987 ) ) ( not ( = ?auto_112989 ?auto_112987 ) ) ( ON-TABLE ?auto_112988 ) ( ON ?auto_112984 ?auto_112988 ) ( ON ?auto_112986 ?auto_112984 ) ( not ( = ?auto_112988 ?auto_112984 ) ) ( not ( = ?auto_112988 ?auto_112986 ) ) ( not ( = ?auto_112988 ?auto_112985 ) ) ( not ( = ?auto_112988 ?auto_112989 ) ) ( not ( = ?auto_112988 ?auto_112983 ) ) ( not ( = ?auto_112984 ?auto_112986 ) ) ( not ( = ?auto_112984 ?auto_112985 ) ) ( not ( = ?auto_112984 ?auto_112989 ) ) ( not ( = ?auto_112984 ?auto_112983 ) ) ( not ( = ?auto_112986 ?auto_112985 ) ) ( not ( = ?auto_112986 ?auto_112989 ) ) ( not ( = ?auto_112986 ?auto_112983 ) ) ( not ( = ?auto_112985 ?auto_112989 ) ) ( not ( = ?auto_112985 ?auto_112983 ) ) ( not ( = ?auto_112982 ?auto_112988 ) ) ( not ( = ?auto_112982 ?auto_112984 ) ) ( not ( = ?auto_112982 ?auto_112986 ) ) ( not ( = ?auto_112982 ?auto_112985 ) ) ( not ( = ?auto_112987 ?auto_112988 ) ) ( not ( = ?auto_112987 ?auto_112984 ) ) ( not ( = ?auto_112987 ?auto_112986 ) ) ( not ( = ?auto_112987 ?auto_112985 ) ) ( ON ?auto_112983 ?auto_112982 ) ( ON-TABLE ?auto_112987 ) ( ON ?auto_112989 ?auto_112983 ) ( CLEAR ?auto_112986 ) ( ON ?auto_112985 ?auto_112989 ) ( CLEAR ?auto_112985 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_112987 ?auto_112982 ?auto_112983 ?auto_112989 )
      ( MAKE-2PILE ?auto_112982 ?auto_112983 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_112990 - BLOCK
      ?auto_112991 - BLOCK
    )
    :vars
    (
      ?auto_112997 - BLOCK
      ?auto_112992 - BLOCK
      ?auto_112995 - BLOCK
      ?auto_112996 - BLOCK
      ?auto_112993 - BLOCK
      ?auto_112994 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_112990 ?auto_112991 ) ) ( not ( = ?auto_112990 ?auto_112997 ) ) ( not ( = ?auto_112991 ?auto_112997 ) ) ( ON ?auto_112990 ?auto_112992 ) ( not ( = ?auto_112990 ?auto_112992 ) ) ( not ( = ?auto_112991 ?auto_112992 ) ) ( not ( = ?auto_112997 ?auto_112992 ) ) ( ON-TABLE ?auto_112995 ) ( ON ?auto_112996 ?auto_112995 ) ( not ( = ?auto_112995 ?auto_112996 ) ) ( not ( = ?auto_112995 ?auto_112993 ) ) ( not ( = ?auto_112995 ?auto_112994 ) ) ( not ( = ?auto_112995 ?auto_112997 ) ) ( not ( = ?auto_112995 ?auto_112991 ) ) ( not ( = ?auto_112996 ?auto_112993 ) ) ( not ( = ?auto_112996 ?auto_112994 ) ) ( not ( = ?auto_112996 ?auto_112997 ) ) ( not ( = ?auto_112996 ?auto_112991 ) ) ( not ( = ?auto_112993 ?auto_112994 ) ) ( not ( = ?auto_112993 ?auto_112997 ) ) ( not ( = ?auto_112993 ?auto_112991 ) ) ( not ( = ?auto_112994 ?auto_112997 ) ) ( not ( = ?auto_112994 ?auto_112991 ) ) ( not ( = ?auto_112990 ?auto_112995 ) ) ( not ( = ?auto_112990 ?auto_112996 ) ) ( not ( = ?auto_112990 ?auto_112993 ) ) ( not ( = ?auto_112990 ?auto_112994 ) ) ( not ( = ?auto_112992 ?auto_112995 ) ) ( not ( = ?auto_112992 ?auto_112996 ) ) ( not ( = ?auto_112992 ?auto_112993 ) ) ( not ( = ?auto_112992 ?auto_112994 ) ) ( ON ?auto_112991 ?auto_112990 ) ( ON-TABLE ?auto_112992 ) ( ON ?auto_112997 ?auto_112991 ) ( ON ?auto_112994 ?auto_112997 ) ( CLEAR ?auto_112994 ) ( HOLDING ?auto_112993 ) ( CLEAR ?auto_112996 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_112995 ?auto_112996 ?auto_112993 )
      ( MAKE-2PILE ?auto_112990 ?auto_112991 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_112998 - BLOCK
      ?auto_112999 - BLOCK
    )
    :vars
    (
      ?auto_113003 - BLOCK
      ?auto_113002 - BLOCK
      ?auto_113005 - BLOCK
      ?auto_113000 - BLOCK
      ?auto_113001 - BLOCK
      ?auto_113004 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_112998 ?auto_112999 ) ) ( not ( = ?auto_112998 ?auto_113003 ) ) ( not ( = ?auto_112999 ?auto_113003 ) ) ( ON ?auto_112998 ?auto_113002 ) ( not ( = ?auto_112998 ?auto_113002 ) ) ( not ( = ?auto_112999 ?auto_113002 ) ) ( not ( = ?auto_113003 ?auto_113002 ) ) ( ON-TABLE ?auto_113005 ) ( ON ?auto_113000 ?auto_113005 ) ( not ( = ?auto_113005 ?auto_113000 ) ) ( not ( = ?auto_113005 ?auto_113001 ) ) ( not ( = ?auto_113005 ?auto_113004 ) ) ( not ( = ?auto_113005 ?auto_113003 ) ) ( not ( = ?auto_113005 ?auto_112999 ) ) ( not ( = ?auto_113000 ?auto_113001 ) ) ( not ( = ?auto_113000 ?auto_113004 ) ) ( not ( = ?auto_113000 ?auto_113003 ) ) ( not ( = ?auto_113000 ?auto_112999 ) ) ( not ( = ?auto_113001 ?auto_113004 ) ) ( not ( = ?auto_113001 ?auto_113003 ) ) ( not ( = ?auto_113001 ?auto_112999 ) ) ( not ( = ?auto_113004 ?auto_113003 ) ) ( not ( = ?auto_113004 ?auto_112999 ) ) ( not ( = ?auto_112998 ?auto_113005 ) ) ( not ( = ?auto_112998 ?auto_113000 ) ) ( not ( = ?auto_112998 ?auto_113001 ) ) ( not ( = ?auto_112998 ?auto_113004 ) ) ( not ( = ?auto_113002 ?auto_113005 ) ) ( not ( = ?auto_113002 ?auto_113000 ) ) ( not ( = ?auto_113002 ?auto_113001 ) ) ( not ( = ?auto_113002 ?auto_113004 ) ) ( ON ?auto_112999 ?auto_112998 ) ( ON-TABLE ?auto_113002 ) ( ON ?auto_113003 ?auto_112999 ) ( ON ?auto_113004 ?auto_113003 ) ( CLEAR ?auto_113000 ) ( ON ?auto_113001 ?auto_113004 ) ( CLEAR ?auto_113001 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_113002 ?auto_112998 ?auto_112999 ?auto_113003 ?auto_113004 )
      ( MAKE-2PILE ?auto_112998 ?auto_112999 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_113006 - BLOCK
      ?auto_113007 - BLOCK
    )
    :vars
    (
      ?auto_113009 - BLOCK
      ?auto_113013 - BLOCK
      ?auto_113008 - BLOCK
      ?auto_113010 - BLOCK
      ?auto_113011 - BLOCK
      ?auto_113012 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_113006 ?auto_113007 ) ) ( not ( = ?auto_113006 ?auto_113009 ) ) ( not ( = ?auto_113007 ?auto_113009 ) ) ( ON ?auto_113006 ?auto_113013 ) ( not ( = ?auto_113006 ?auto_113013 ) ) ( not ( = ?auto_113007 ?auto_113013 ) ) ( not ( = ?auto_113009 ?auto_113013 ) ) ( ON-TABLE ?auto_113008 ) ( not ( = ?auto_113008 ?auto_113010 ) ) ( not ( = ?auto_113008 ?auto_113011 ) ) ( not ( = ?auto_113008 ?auto_113012 ) ) ( not ( = ?auto_113008 ?auto_113009 ) ) ( not ( = ?auto_113008 ?auto_113007 ) ) ( not ( = ?auto_113010 ?auto_113011 ) ) ( not ( = ?auto_113010 ?auto_113012 ) ) ( not ( = ?auto_113010 ?auto_113009 ) ) ( not ( = ?auto_113010 ?auto_113007 ) ) ( not ( = ?auto_113011 ?auto_113012 ) ) ( not ( = ?auto_113011 ?auto_113009 ) ) ( not ( = ?auto_113011 ?auto_113007 ) ) ( not ( = ?auto_113012 ?auto_113009 ) ) ( not ( = ?auto_113012 ?auto_113007 ) ) ( not ( = ?auto_113006 ?auto_113008 ) ) ( not ( = ?auto_113006 ?auto_113010 ) ) ( not ( = ?auto_113006 ?auto_113011 ) ) ( not ( = ?auto_113006 ?auto_113012 ) ) ( not ( = ?auto_113013 ?auto_113008 ) ) ( not ( = ?auto_113013 ?auto_113010 ) ) ( not ( = ?auto_113013 ?auto_113011 ) ) ( not ( = ?auto_113013 ?auto_113012 ) ) ( ON ?auto_113007 ?auto_113006 ) ( ON-TABLE ?auto_113013 ) ( ON ?auto_113009 ?auto_113007 ) ( ON ?auto_113012 ?auto_113009 ) ( ON ?auto_113011 ?auto_113012 ) ( CLEAR ?auto_113011 ) ( HOLDING ?auto_113010 ) ( CLEAR ?auto_113008 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_113008 ?auto_113010 )
      ( MAKE-2PILE ?auto_113006 ?auto_113007 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_113014 - BLOCK
      ?auto_113015 - BLOCK
    )
    :vars
    (
      ?auto_113019 - BLOCK
      ?auto_113020 - BLOCK
      ?auto_113018 - BLOCK
      ?auto_113016 - BLOCK
      ?auto_113017 - BLOCK
      ?auto_113021 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_113014 ?auto_113015 ) ) ( not ( = ?auto_113014 ?auto_113019 ) ) ( not ( = ?auto_113015 ?auto_113019 ) ) ( ON ?auto_113014 ?auto_113020 ) ( not ( = ?auto_113014 ?auto_113020 ) ) ( not ( = ?auto_113015 ?auto_113020 ) ) ( not ( = ?auto_113019 ?auto_113020 ) ) ( ON-TABLE ?auto_113018 ) ( not ( = ?auto_113018 ?auto_113016 ) ) ( not ( = ?auto_113018 ?auto_113017 ) ) ( not ( = ?auto_113018 ?auto_113021 ) ) ( not ( = ?auto_113018 ?auto_113019 ) ) ( not ( = ?auto_113018 ?auto_113015 ) ) ( not ( = ?auto_113016 ?auto_113017 ) ) ( not ( = ?auto_113016 ?auto_113021 ) ) ( not ( = ?auto_113016 ?auto_113019 ) ) ( not ( = ?auto_113016 ?auto_113015 ) ) ( not ( = ?auto_113017 ?auto_113021 ) ) ( not ( = ?auto_113017 ?auto_113019 ) ) ( not ( = ?auto_113017 ?auto_113015 ) ) ( not ( = ?auto_113021 ?auto_113019 ) ) ( not ( = ?auto_113021 ?auto_113015 ) ) ( not ( = ?auto_113014 ?auto_113018 ) ) ( not ( = ?auto_113014 ?auto_113016 ) ) ( not ( = ?auto_113014 ?auto_113017 ) ) ( not ( = ?auto_113014 ?auto_113021 ) ) ( not ( = ?auto_113020 ?auto_113018 ) ) ( not ( = ?auto_113020 ?auto_113016 ) ) ( not ( = ?auto_113020 ?auto_113017 ) ) ( not ( = ?auto_113020 ?auto_113021 ) ) ( ON ?auto_113015 ?auto_113014 ) ( ON-TABLE ?auto_113020 ) ( ON ?auto_113019 ?auto_113015 ) ( ON ?auto_113021 ?auto_113019 ) ( ON ?auto_113017 ?auto_113021 ) ( CLEAR ?auto_113018 ) ( ON ?auto_113016 ?auto_113017 ) ( CLEAR ?auto_113016 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_113020 ?auto_113014 ?auto_113015 ?auto_113019 ?auto_113021 ?auto_113017 )
      ( MAKE-2PILE ?auto_113014 ?auto_113015 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_113022 - BLOCK
      ?auto_113023 - BLOCK
    )
    :vars
    (
      ?auto_113027 - BLOCK
      ?auto_113024 - BLOCK
      ?auto_113026 - BLOCK
      ?auto_113028 - BLOCK
      ?auto_113029 - BLOCK
      ?auto_113025 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_113022 ?auto_113023 ) ) ( not ( = ?auto_113022 ?auto_113027 ) ) ( not ( = ?auto_113023 ?auto_113027 ) ) ( ON ?auto_113022 ?auto_113024 ) ( not ( = ?auto_113022 ?auto_113024 ) ) ( not ( = ?auto_113023 ?auto_113024 ) ) ( not ( = ?auto_113027 ?auto_113024 ) ) ( not ( = ?auto_113026 ?auto_113028 ) ) ( not ( = ?auto_113026 ?auto_113029 ) ) ( not ( = ?auto_113026 ?auto_113025 ) ) ( not ( = ?auto_113026 ?auto_113027 ) ) ( not ( = ?auto_113026 ?auto_113023 ) ) ( not ( = ?auto_113028 ?auto_113029 ) ) ( not ( = ?auto_113028 ?auto_113025 ) ) ( not ( = ?auto_113028 ?auto_113027 ) ) ( not ( = ?auto_113028 ?auto_113023 ) ) ( not ( = ?auto_113029 ?auto_113025 ) ) ( not ( = ?auto_113029 ?auto_113027 ) ) ( not ( = ?auto_113029 ?auto_113023 ) ) ( not ( = ?auto_113025 ?auto_113027 ) ) ( not ( = ?auto_113025 ?auto_113023 ) ) ( not ( = ?auto_113022 ?auto_113026 ) ) ( not ( = ?auto_113022 ?auto_113028 ) ) ( not ( = ?auto_113022 ?auto_113029 ) ) ( not ( = ?auto_113022 ?auto_113025 ) ) ( not ( = ?auto_113024 ?auto_113026 ) ) ( not ( = ?auto_113024 ?auto_113028 ) ) ( not ( = ?auto_113024 ?auto_113029 ) ) ( not ( = ?auto_113024 ?auto_113025 ) ) ( ON ?auto_113023 ?auto_113022 ) ( ON-TABLE ?auto_113024 ) ( ON ?auto_113027 ?auto_113023 ) ( ON ?auto_113025 ?auto_113027 ) ( ON ?auto_113029 ?auto_113025 ) ( ON ?auto_113028 ?auto_113029 ) ( CLEAR ?auto_113028 ) ( HOLDING ?auto_113026 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_113026 )
      ( MAKE-2PILE ?auto_113022 ?auto_113023 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_113030 - BLOCK
      ?auto_113031 - BLOCK
    )
    :vars
    (
      ?auto_113032 - BLOCK
      ?auto_113036 - BLOCK
      ?auto_113034 - BLOCK
      ?auto_113033 - BLOCK
      ?auto_113035 - BLOCK
      ?auto_113037 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_113030 ?auto_113031 ) ) ( not ( = ?auto_113030 ?auto_113032 ) ) ( not ( = ?auto_113031 ?auto_113032 ) ) ( ON ?auto_113030 ?auto_113036 ) ( not ( = ?auto_113030 ?auto_113036 ) ) ( not ( = ?auto_113031 ?auto_113036 ) ) ( not ( = ?auto_113032 ?auto_113036 ) ) ( not ( = ?auto_113034 ?auto_113033 ) ) ( not ( = ?auto_113034 ?auto_113035 ) ) ( not ( = ?auto_113034 ?auto_113037 ) ) ( not ( = ?auto_113034 ?auto_113032 ) ) ( not ( = ?auto_113034 ?auto_113031 ) ) ( not ( = ?auto_113033 ?auto_113035 ) ) ( not ( = ?auto_113033 ?auto_113037 ) ) ( not ( = ?auto_113033 ?auto_113032 ) ) ( not ( = ?auto_113033 ?auto_113031 ) ) ( not ( = ?auto_113035 ?auto_113037 ) ) ( not ( = ?auto_113035 ?auto_113032 ) ) ( not ( = ?auto_113035 ?auto_113031 ) ) ( not ( = ?auto_113037 ?auto_113032 ) ) ( not ( = ?auto_113037 ?auto_113031 ) ) ( not ( = ?auto_113030 ?auto_113034 ) ) ( not ( = ?auto_113030 ?auto_113033 ) ) ( not ( = ?auto_113030 ?auto_113035 ) ) ( not ( = ?auto_113030 ?auto_113037 ) ) ( not ( = ?auto_113036 ?auto_113034 ) ) ( not ( = ?auto_113036 ?auto_113033 ) ) ( not ( = ?auto_113036 ?auto_113035 ) ) ( not ( = ?auto_113036 ?auto_113037 ) ) ( ON ?auto_113031 ?auto_113030 ) ( ON-TABLE ?auto_113036 ) ( ON ?auto_113032 ?auto_113031 ) ( ON ?auto_113037 ?auto_113032 ) ( ON ?auto_113035 ?auto_113037 ) ( ON ?auto_113033 ?auto_113035 ) ( ON ?auto_113034 ?auto_113033 ) ( CLEAR ?auto_113034 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_113036 ?auto_113030 ?auto_113031 ?auto_113032 ?auto_113037 ?auto_113035 ?auto_113033 )
      ( MAKE-2PILE ?auto_113030 ?auto_113031 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_113061 - BLOCK
      ?auto_113062 - BLOCK
      ?auto_113063 - BLOCK
      ?auto_113064 - BLOCK
    )
    :vars
    (
      ?auto_113066 - BLOCK
      ?auto_113065 - BLOCK
      ?auto_113067 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113066 ?auto_113064 ) ( ON-TABLE ?auto_113061 ) ( ON ?auto_113062 ?auto_113061 ) ( ON ?auto_113063 ?auto_113062 ) ( ON ?auto_113064 ?auto_113063 ) ( not ( = ?auto_113061 ?auto_113062 ) ) ( not ( = ?auto_113061 ?auto_113063 ) ) ( not ( = ?auto_113061 ?auto_113064 ) ) ( not ( = ?auto_113061 ?auto_113066 ) ) ( not ( = ?auto_113062 ?auto_113063 ) ) ( not ( = ?auto_113062 ?auto_113064 ) ) ( not ( = ?auto_113062 ?auto_113066 ) ) ( not ( = ?auto_113063 ?auto_113064 ) ) ( not ( = ?auto_113063 ?auto_113066 ) ) ( not ( = ?auto_113064 ?auto_113066 ) ) ( not ( = ?auto_113061 ?auto_113065 ) ) ( not ( = ?auto_113061 ?auto_113067 ) ) ( not ( = ?auto_113062 ?auto_113065 ) ) ( not ( = ?auto_113062 ?auto_113067 ) ) ( not ( = ?auto_113063 ?auto_113065 ) ) ( not ( = ?auto_113063 ?auto_113067 ) ) ( not ( = ?auto_113064 ?auto_113065 ) ) ( not ( = ?auto_113064 ?auto_113067 ) ) ( not ( = ?auto_113066 ?auto_113065 ) ) ( not ( = ?auto_113066 ?auto_113067 ) ) ( not ( = ?auto_113065 ?auto_113067 ) ) ( ON ?auto_113065 ?auto_113066 ) ( CLEAR ?auto_113065 ) ( HOLDING ?auto_113067 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_113067 )
      ( MAKE-4PILE ?auto_113061 ?auto_113062 ?auto_113063 ?auto_113064 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_113148 - BLOCK
      ?auto_113149 - BLOCK
      ?auto_113150 - BLOCK
    )
    :vars
    (
      ?auto_113151 - BLOCK
      ?auto_113154 - BLOCK
      ?auto_113153 - BLOCK
      ?auto_113152 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_113148 ) ( not ( = ?auto_113148 ?auto_113149 ) ) ( not ( = ?auto_113148 ?auto_113150 ) ) ( not ( = ?auto_113149 ?auto_113150 ) ) ( ON ?auto_113150 ?auto_113151 ) ( not ( = ?auto_113148 ?auto_113151 ) ) ( not ( = ?auto_113149 ?auto_113151 ) ) ( not ( = ?auto_113150 ?auto_113151 ) ) ( CLEAR ?auto_113148 ) ( ON ?auto_113149 ?auto_113150 ) ( CLEAR ?auto_113149 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_113154 ) ( ON ?auto_113153 ?auto_113154 ) ( ON ?auto_113152 ?auto_113153 ) ( ON ?auto_113151 ?auto_113152 ) ( not ( = ?auto_113154 ?auto_113153 ) ) ( not ( = ?auto_113154 ?auto_113152 ) ) ( not ( = ?auto_113154 ?auto_113151 ) ) ( not ( = ?auto_113154 ?auto_113150 ) ) ( not ( = ?auto_113154 ?auto_113149 ) ) ( not ( = ?auto_113153 ?auto_113152 ) ) ( not ( = ?auto_113153 ?auto_113151 ) ) ( not ( = ?auto_113153 ?auto_113150 ) ) ( not ( = ?auto_113153 ?auto_113149 ) ) ( not ( = ?auto_113152 ?auto_113151 ) ) ( not ( = ?auto_113152 ?auto_113150 ) ) ( not ( = ?auto_113152 ?auto_113149 ) ) ( not ( = ?auto_113148 ?auto_113154 ) ) ( not ( = ?auto_113148 ?auto_113153 ) ) ( not ( = ?auto_113148 ?auto_113152 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_113154 ?auto_113153 ?auto_113152 ?auto_113151 ?auto_113150 )
      ( MAKE-3PILE ?auto_113148 ?auto_113149 ?auto_113150 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_113155 - BLOCK
      ?auto_113156 - BLOCK
      ?auto_113157 - BLOCK
    )
    :vars
    (
      ?auto_113161 - BLOCK
      ?auto_113158 - BLOCK
      ?auto_113159 - BLOCK
      ?auto_113160 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_113155 ?auto_113156 ) ) ( not ( = ?auto_113155 ?auto_113157 ) ) ( not ( = ?auto_113156 ?auto_113157 ) ) ( ON ?auto_113157 ?auto_113161 ) ( not ( = ?auto_113155 ?auto_113161 ) ) ( not ( = ?auto_113156 ?auto_113161 ) ) ( not ( = ?auto_113157 ?auto_113161 ) ) ( ON ?auto_113156 ?auto_113157 ) ( CLEAR ?auto_113156 ) ( ON-TABLE ?auto_113158 ) ( ON ?auto_113159 ?auto_113158 ) ( ON ?auto_113160 ?auto_113159 ) ( ON ?auto_113161 ?auto_113160 ) ( not ( = ?auto_113158 ?auto_113159 ) ) ( not ( = ?auto_113158 ?auto_113160 ) ) ( not ( = ?auto_113158 ?auto_113161 ) ) ( not ( = ?auto_113158 ?auto_113157 ) ) ( not ( = ?auto_113158 ?auto_113156 ) ) ( not ( = ?auto_113159 ?auto_113160 ) ) ( not ( = ?auto_113159 ?auto_113161 ) ) ( not ( = ?auto_113159 ?auto_113157 ) ) ( not ( = ?auto_113159 ?auto_113156 ) ) ( not ( = ?auto_113160 ?auto_113161 ) ) ( not ( = ?auto_113160 ?auto_113157 ) ) ( not ( = ?auto_113160 ?auto_113156 ) ) ( not ( = ?auto_113155 ?auto_113158 ) ) ( not ( = ?auto_113155 ?auto_113159 ) ) ( not ( = ?auto_113155 ?auto_113160 ) ) ( HOLDING ?auto_113155 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_113155 )
      ( MAKE-3PILE ?auto_113155 ?auto_113156 ?auto_113157 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_113162 - BLOCK
      ?auto_113163 - BLOCK
      ?auto_113164 - BLOCK
    )
    :vars
    (
      ?auto_113165 - BLOCK
      ?auto_113168 - BLOCK
      ?auto_113166 - BLOCK
      ?auto_113167 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_113162 ?auto_113163 ) ) ( not ( = ?auto_113162 ?auto_113164 ) ) ( not ( = ?auto_113163 ?auto_113164 ) ) ( ON ?auto_113164 ?auto_113165 ) ( not ( = ?auto_113162 ?auto_113165 ) ) ( not ( = ?auto_113163 ?auto_113165 ) ) ( not ( = ?auto_113164 ?auto_113165 ) ) ( ON ?auto_113163 ?auto_113164 ) ( ON-TABLE ?auto_113168 ) ( ON ?auto_113166 ?auto_113168 ) ( ON ?auto_113167 ?auto_113166 ) ( ON ?auto_113165 ?auto_113167 ) ( not ( = ?auto_113168 ?auto_113166 ) ) ( not ( = ?auto_113168 ?auto_113167 ) ) ( not ( = ?auto_113168 ?auto_113165 ) ) ( not ( = ?auto_113168 ?auto_113164 ) ) ( not ( = ?auto_113168 ?auto_113163 ) ) ( not ( = ?auto_113166 ?auto_113167 ) ) ( not ( = ?auto_113166 ?auto_113165 ) ) ( not ( = ?auto_113166 ?auto_113164 ) ) ( not ( = ?auto_113166 ?auto_113163 ) ) ( not ( = ?auto_113167 ?auto_113165 ) ) ( not ( = ?auto_113167 ?auto_113164 ) ) ( not ( = ?auto_113167 ?auto_113163 ) ) ( not ( = ?auto_113162 ?auto_113168 ) ) ( not ( = ?auto_113162 ?auto_113166 ) ) ( not ( = ?auto_113162 ?auto_113167 ) ) ( ON ?auto_113162 ?auto_113163 ) ( CLEAR ?auto_113162 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_113168 ?auto_113166 ?auto_113167 ?auto_113165 ?auto_113164 ?auto_113163 )
      ( MAKE-3PILE ?auto_113162 ?auto_113163 ?auto_113164 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_113172 - BLOCK
      ?auto_113173 - BLOCK
      ?auto_113174 - BLOCK
    )
    :vars
    (
      ?auto_113178 - BLOCK
      ?auto_113175 - BLOCK
      ?auto_113177 - BLOCK
      ?auto_113176 - BLOCK
      ?auto_113179 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_113172 ?auto_113173 ) ) ( not ( = ?auto_113172 ?auto_113174 ) ) ( not ( = ?auto_113173 ?auto_113174 ) ) ( ON ?auto_113174 ?auto_113178 ) ( not ( = ?auto_113172 ?auto_113178 ) ) ( not ( = ?auto_113173 ?auto_113178 ) ) ( not ( = ?auto_113174 ?auto_113178 ) ) ( ON ?auto_113173 ?auto_113174 ) ( CLEAR ?auto_113173 ) ( ON-TABLE ?auto_113175 ) ( ON ?auto_113177 ?auto_113175 ) ( ON ?auto_113176 ?auto_113177 ) ( ON ?auto_113178 ?auto_113176 ) ( not ( = ?auto_113175 ?auto_113177 ) ) ( not ( = ?auto_113175 ?auto_113176 ) ) ( not ( = ?auto_113175 ?auto_113178 ) ) ( not ( = ?auto_113175 ?auto_113174 ) ) ( not ( = ?auto_113175 ?auto_113173 ) ) ( not ( = ?auto_113177 ?auto_113176 ) ) ( not ( = ?auto_113177 ?auto_113178 ) ) ( not ( = ?auto_113177 ?auto_113174 ) ) ( not ( = ?auto_113177 ?auto_113173 ) ) ( not ( = ?auto_113176 ?auto_113178 ) ) ( not ( = ?auto_113176 ?auto_113174 ) ) ( not ( = ?auto_113176 ?auto_113173 ) ) ( not ( = ?auto_113172 ?auto_113175 ) ) ( not ( = ?auto_113172 ?auto_113177 ) ) ( not ( = ?auto_113172 ?auto_113176 ) ) ( ON ?auto_113172 ?auto_113179 ) ( CLEAR ?auto_113172 ) ( HAND-EMPTY ) ( not ( = ?auto_113172 ?auto_113179 ) ) ( not ( = ?auto_113173 ?auto_113179 ) ) ( not ( = ?auto_113174 ?auto_113179 ) ) ( not ( = ?auto_113178 ?auto_113179 ) ) ( not ( = ?auto_113175 ?auto_113179 ) ) ( not ( = ?auto_113177 ?auto_113179 ) ) ( not ( = ?auto_113176 ?auto_113179 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_113172 ?auto_113179 )
      ( MAKE-3PILE ?auto_113172 ?auto_113173 ?auto_113174 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_113180 - BLOCK
      ?auto_113181 - BLOCK
      ?auto_113182 - BLOCK
    )
    :vars
    (
      ?auto_113185 - BLOCK
      ?auto_113184 - BLOCK
      ?auto_113183 - BLOCK
      ?auto_113186 - BLOCK
      ?auto_113187 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_113180 ?auto_113181 ) ) ( not ( = ?auto_113180 ?auto_113182 ) ) ( not ( = ?auto_113181 ?auto_113182 ) ) ( ON ?auto_113182 ?auto_113185 ) ( not ( = ?auto_113180 ?auto_113185 ) ) ( not ( = ?auto_113181 ?auto_113185 ) ) ( not ( = ?auto_113182 ?auto_113185 ) ) ( ON-TABLE ?auto_113184 ) ( ON ?auto_113183 ?auto_113184 ) ( ON ?auto_113186 ?auto_113183 ) ( ON ?auto_113185 ?auto_113186 ) ( not ( = ?auto_113184 ?auto_113183 ) ) ( not ( = ?auto_113184 ?auto_113186 ) ) ( not ( = ?auto_113184 ?auto_113185 ) ) ( not ( = ?auto_113184 ?auto_113182 ) ) ( not ( = ?auto_113184 ?auto_113181 ) ) ( not ( = ?auto_113183 ?auto_113186 ) ) ( not ( = ?auto_113183 ?auto_113185 ) ) ( not ( = ?auto_113183 ?auto_113182 ) ) ( not ( = ?auto_113183 ?auto_113181 ) ) ( not ( = ?auto_113186 ?auto_113185 ) ) ( not ( = ?auto_113186 ?auto_113182 ) ) ( not ( = ?auto_113186 ?auto_113181 ) ) ( not ( = ?auto_113180 ?auto_113184 ) ) ( not ( = ?auto_113180 ?auto_113183 ) ) ( not ( = ?auto_113180 ?auto_113186 ) ) ( ON ?auto_113180 ?auto_113187 ) ( CLEAR ?auto_113180 ) ( not ( = ?auto_113180 ?auto_113187 ) ) ( not ( = ?auto_113181 ?auto_113187 ) ) ( not ( = ?auto_113182 ?auto_113187 ) ) ( not ( = ?auto_113185 ?auto_113187 ) ) ( not ( = ?auto_113184 ?auto_113187 ) ) ( not ( = ?auto_113183 ?auto_113187 ) ) ( not ( = ?auto_113186 ?auto_113187 ) ) ( HOLDING ?auto_113181 ) ( CLEAR ?auto_113182 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_113184 ?auto_113183 ?auto_113186 ?auto_113185 ?auto_113182 ?auto_113181 )
      ( MAKE-3PILE ?auto_113180 ?auto_113181 ?auto_113182 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_113188 - BLOCK
      ?auto_113189 - BLOCK
      ?auto_113190 - BLOCK
    )
    :vars
    (
      ?auto_113191 - BLOCK
      ?auto_113192 - BLOCK
      ?auto_113194 - BLOCK
      ?auto_113195 - BLOCK
      ?auto_113193 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_113188 ?auto_113189 ) ) ( not ( = ?auto_113188 ?auto_113190 ) ) ( not ( = ?auto_113189 ?auto_113190 ) ) ( ON ?auto_113190 ?auto_113191 ) ( not ( = ?auto_113188 ?auto_113191 ) ) ( not ( = ?auto_113189 ?auto_113191 ) ) ( not ( = ?auto_113190 ?auto_113191 ) ) ( ON-TABLE ?auto_113192 ) ( ON ?auto_113194 ?auto_113192 ) ( ON ?auto_113195 ?auto_113194 ) ( ON ?auto_113191 ?auto_113195 ) ( not ( = ?auto_113192 ?auto_113194 ) ) ( not ( = ?auto_113192 ?auto_113195 ) ) ( not ( = ?auto_113192 ?auto_113191 ) ) ( not ( = ?auto_113192 ?auto_113190 ) ) ( not ( = ?auto_113192 ?auto_113189 ) ) ( not ( = ?auto_113194 ?auto_113195 ) ) ( not ( = ?auto_113194 ?auto_113191 ) ) ( not ( = ?auto_113194 ?auto_113190 ) ) ( not ( = ?auto_113194 ?auto_113189 ) ) ( not ( = ?auto_113195 ?auto_113191 ) ) ( not ( = ?auto_113195 ?auto_113190 ) ) ( not ( = ?auto_113195 ?auto_113189 ) ) ( not ( = ?auto_113188 ?auto_113192 ) ) ( not ( = ?auto_113188 ?auto_113194 ) ) ( not ( = ?auto_113188 ?auto_113195 ) ) ( ON ?auto_113188 ?auto_113193 ) ( not ( = ?auto_113188 ?auto_113193 ) ) ( not ( = ?auto_113189 ?auto_113193 ) ) ( not ( = ?auto_113190 ?auto_113193 ) ) ( not ( = ?auto_113191 ?auto_113193 ) ) ( not ( = ?auto_113192 ?auto_113193 ) ) ( not ( = ?auto_113194 ?auto_113193 ) ) ( not ( = ?auto_113195 ?auto_113193 ) ) ( CLEAR ?auto_113190 ) ( ON ?auto_113189 ?auto_113188 ) ( CLEAR ?auto_113189 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_113193 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_113193 ?auto_113188 )
      ( MAKE-3PILE ?auto_113188 ?auto_113189 ?auto_113190 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_113196 - BLOCK
      ?auto_113197 - BLOCK
      ?auto_113198 - BLOCK
    )
    :vars
    (
      ?auto_113201 - BLOCK
      ?auto_113199 - BLOCK
      ?auto_113203 - BLOCK
      ?auto_113202 - BLOCK
      ?auto_113200 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_113196 ?auto_113197 ) ) ( not ( = ?auto_113196 ?auto_113198 ) ) ( not ( = ?auto_113197 ?auto_113198 ) ) ( not ( = ?auto_113196 ?auto_113201 ) ) ( not ( = ?auto_113197 ?auto_113201 ) ) ( not ( = ?auto_113198 ?auto_113201 ) ) ( ON-TABLE ?auto_113199 ) ( ON ?auto_113203 ?auto_113199 ) ( ON ?auto_113202 ?auto_113203 ) ( ON ?auto_113201 ?auto_113202 ) ( not ( = ?auto_113199 ?auto_113203 ) ) ( not ( = ?auto_113199 ?auto_113202 ) ) ( not ( = ?auto_113199 ?auto_113201 ) ) ( not ( = ?auto_113199 ?auto_113198 ) ) ( not ( = ?auto_113199 ?auto_113197 ) ) ( not ( = ?auto_113203 ?auto_113202 ) ) ( not ( = ?auto_113203 ?auto_113201 ) ) ( not ( = ?auto_113203 ?auto_113198 ) ) ( not ( = ?auto_113203 ?auto_113197 ) ) ( not ( = ?auto_113202 ?auto_113201 ) ) ( not ( = ?auto_113202 ?auto_113198 ) ) ( not ( = ?auto_113202 ?auto_113197 ) ) ( not ( = ?auto_113196 ?auto_113199 ) ) ( not ( = ?auto_113196 ?auto_113203 ) ) ( not ( = ?auto_113196 ?auto_113202 ) ) ( ON ?auto_113196 ?auto_113200 ) ( not ( = ?auto_113196 ?auto_113200 ) ) ( not ( = ?auto_113197 ?auto_113200 ) ) ( not ( = ?auto_113198 ?auto_113200 ) ) ( not ( = ?auto_113201 ?auto_113200 ) ) ( not ( = ?auto_113199 ?auto_113200 ) ) ( not ( = ?auto_113203 ?auto_113200 ) ) ( not ( = ?auto_113202 ?auto_113200 ) ) ( ON ?auto_113197 ?auto_113196 ) ( CLEAR ?auto_113197 ) ( ON-TABLE ?auto_113200 ) ( HOLDING ?auto_113198 ) ( CLEAR ?auto_113201 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_113199 ?auto_113203 ?auto_113202 ?auto_113201 ?auto_113198 )
      ( MAKE-3PILE ?auto_113196 ?auto_113197 ?auto_113198 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_113204 - BLOCK
      ?auto_113205 - BLOCK
      ?auto_113206 - BLOCK
    )
    :vars
    (
      ?auto_113211 - BLOCK
      ?auto_113208 - BLOCK
      ?auto_113210 - BLOCK
      ?auto_113209 - BLOCK
      ?auto_113207 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_113204 ?auto_113205 ) ) ( not ( = ?auto_113204 ?auto_113206 ) ) ( not ( = ?auto_113205 ?auto_113206 ) ) ( not ( = ?auto_113204 ?auto_113211 ) ) ( not ( = ?auto_113205 ?auto_113211 ) ) ( not ( = ?auto_113206 ?auto_113211 ) ) ( ON-TABLE ?auto_113208 ) ( ON ?auto_113210 ?auto_113208 ) ( ON ?auto_113209 ?auto_113210 ) ( ON ?auto_113211 ?auto_113209 ) ( not ( = ?auto_113208 ?auto_113210 ) ) ( not ( = ?auto_113208 ?auto_113209 ) ) ( not ( = ?auto_113208 ?auto_113211 ) ) ( not ( = ?auto_113208 ?auto_113206 ) ) ( not ( = ?auto_113208 ?auto_113205 ) ) ( not ( = ?auto_113210 ?auto_113209 ) ) ( not ( = ?auto_113210 ?auto_113211 ) ) ( not ( = ?auto_113210 ?auto_113206 ) ) ( not ( = ?auto_113210 ?auto_113205 ) ) ( not ( = ?auto_113209 ?auto_113211 ) ) ( not ( = ?auto_113209 ?auto_113206 ) ) ( not ( = ?auto_113209 ?auto_113205 ) ) ( not ( = ?auto_113204 ?auto_113208 ) ) ( not ( = ?auto_113204 ?auto_113210 ) ) ( not ( = ?auto_113204 ?auto_113209 ) ) ( ON ?auto_113204 ?auto_113207 ) ( not ( = ?auto_113204 ?auto_113207 ) ) ( not ( = ?auto_113205 ?auto_113207 ) ) ( not ( = ?auto_113206 ?auto_113207 ) ) ( not ( = ?auto_113211 ?auto_113207 ) ) ( not ( = ?auto_113208 ?auto_113207 ) ) ( not ( = ?auto_113210 ?auto_113207 ) ) ( not ( = ?auto_113209 ?auto_113207 ) ) ( ON ?auto_113205 ?auto_113204 ) ( ON-TABLE ?auto_113207 ) ( CLEAR ?auto_113211 ) ( ON ?auto_113206 ?auto_113205 ) ( CLEAR ?auto_113206 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_113207 ?auto_113204 ?auto_113205 )
      ( MAKE-3PILE ?auto_113204 ?auto_113205 ?auto_113206 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_113212 - BLOCK
      ?auto_113213 - BLOCK
      ?auto_113214 - BLOCK
    )
    :vars
    (
      ?auto_113218 - BLOCK
      ?auto_113219 - BLOCK
      ?auto_113216 - BLOCK
      ?auto_113217 - BLOCK
      ?auto_113215 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_113212 ?auto_113213 ) ) ( not ( = ?auto_113212 ?auto_113214 ) ) ( not ( = ?auto_113213 ?auto_113214 ) ) ( not ( = ?auto_113212 ?auto_113218 ) ) ( not ( = ?auto_113213 ?auto_113218 ) ) ( not ( = ?auto_113214 ?auto_113218 ) ) ( ON-TABLE ?auto_113219 ) ( ON ?auto_113216 ?auto_113219 ) ( ON ?auto_113217 ?auto_113216 ) ( not ( = ?auto_113219 ?auto_113216 ) ) ( not ( = ?auto_113219 ?auto_113217 ) ) ( not ( = ?auto_113219 ?auto_113218 ) ) ( not ( = ?auto_113219 ?auto_113214 ) ) ( not ( = ?auto_113219 ?auto_113213 ) ) ( not ( = ?auto_113216 ?auto_113217 ) ) ( not ( = ?auto_113216 ?auto_113218 ) ) ( not ( = ?auto_113216 ?auto_113214 ) ) ( not ( = ?auto_113216 ?auto_113213 ) ) ( not ( = ?auto_113217 ?auto_113218 ) ) ( not ( = ?auto_113217 ?auto_113214 ) ) ( not ( = ?auto_113217 ?auto_113213 ) ) ( not ( = ?auto_113212 ?auto_113219 ) ) ( not ( = ?auto_113212 ?auto_113216 ) ) ( not ( = ?auto_113212 ?auto_113217 ) ) ( ON ?auto_113212 ?auto_113215 ) ( not ( = ?auto_113212 ?auto_113215 ) ) ( not ( = ?auto_113213 ?auto_113215 ) ) ( not ( = ?auto_113214 ?auto_113215 ) ) ( not ( = ?auto_113218 ?auto_113215 ) ) ( not ( = ?auto_113219 ?auto_113215 ) ) ( not ( = ?auto_113216 ?auto_113215 ) ) ( not ( = ?auto_113217 ?auto_113215 ) ) ( ON ?auto_113213 ?auto_113212 ) ( ON-TABLE ?auto_113215 ) ( ON ?auto_113214 ?auto_113213 ) ( CLEAR ?auto_113214 ) ( HOLDING ?auto_113218 ) ( CLEAR ?auto_113217 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_113219 ?auto_113216 ?auto_113217 ?auto_113218 )
      ( MAKE-3PILE ?auto_113212 ?auto_113213 ?auto_113214 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_113220 - BLOCK
      ?auto_113221 - BLOCK
      ?auto_113222 - BLOCK
    )
    :vars
    (
      ?auto_113227 - BLOCK
      ?auto_113224 - BLOCK
      ?auto_113225 - BLOCK
      ?auto_113226 - BLOCK
      ?auto_113223 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_113220 ?auto_113221 ) ) ( not ( = ?auto_113220 ?auto_113222 ) ) ( not ( = ?auto_113221 ?auto_113222 ) ) ( not ( = ?auto_113220 ?auto_113227 ) ) ( not ( = ?auto_113221 ?auto_113227 ) ) ( not ( = ?auto_113222 ?auto_113227 ) ) ( ON-TABLE ?auto_113224 ) ( ON ?auto_113225 ?auto_113224 ) ( ON ?auto_113226 ?auto_113225 ) ( not ( = ?auto_113224 ?auto_113225 ) ) ( not ( = ?auto_113224 ?auto_113226 ) ) ( not ( = ?auto_113224 ?auto_113227 ) ) ( not ( = ?auto_113224 ?auto_113222 ) ) ( not ( = ?auto_113224 ?auto_113221 ) ) ( not ( = ?auto_113225 ?auto_113226 ) ) ( not ( = ?auto_113225 ?auto_113227 ) ) ( not ( = ?auto_113225 ?auto_113222 ) ) ( not ( = ?auto_113225 ?auto_113221 ) ) ( not ( = ?auto_113226 ?auto_113227 ) ) ( not ( = ?auto_113226 ?auto_113222 ) ) ( not ( = ?auto_113226 ?auto_113221 ) ) ( not ( = ?auto_113220 ?auto_113224 ) ) ( not ( = ?auto_113220 ?auto_113225 ) ) ( not ( = ?auto_113220 ?auto_113226 ) ) ( ON ?auto_113220 ?auto_113223 ) ( not ( = ?auto_113220 ?auto_113223 ) ) ( not ( = ?auto_113221 ?auto_113223 ) ) ( not ( = ?auto_113222 ?auto_113223 ) ) ( not ( = ?auto_113227 ?auto_113223 ) ) ( not ( = ?auto_113224 ?auto_113223 ) ) ( not ( = ?auto_113225 ?auto_113223 ) ) ( not ( = ?auto_113226 ?auto_113223 ) ) ( ON ?auto_113221 ?auto_113220 ) ( ON-TABLE ?auto_113223 ) ( ON ?auto_113222 ?auto_113221 ) ( CLEAR ?auto_113226 ) ( ON ?auto_113227 ?auto_113222 ) ( CLEAR ?auto_113227 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_113223 ?auto_113220 ?auto_113221 ?auto_113222 )
      ( MAKE-3PILE ?auto_113220 ?auto_113221 ?auto_113222 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_113228 - BLOCK
      ?auto_113229 - BLOCK
      ?auto_113230 - BLOCK
    )
    :vars
    (
      ?auto_113233 - BLOCK
      ?auto_113232 - BLOCK
      ?auto_113231 - BLOCK
      ?auto_113235 - BLOCK
      ?auto_113234 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_113228 ?auto_113229 ) ) ( not ( = ?auto_113228 ?auto_113230 ) ) ( not ( = ?auto_113229 ?auto_113230 ) ) ( not ( = ?auto_113228 ?auto_113233 ) ) ( not ( = ?auto_113229 ?auto_113233 ) ) ( not ( = ?auto_113230 ?auto_113233 ) ) ( ON-TABLE ?auto_113232 ) ( ON ?auto_113231 ?auto_113232 ) ( not ( = ?auto_113232 ?auto_113231 ) ) ( not ( = ?auto_113232 ?auto_113235 ) ) ( not ( = ?auto_113232 ?auto_113233 ) ) ( not ( = ?auto_113232 ?auto_113230 ) ) ( not ( = ?auto_113232 ?auto_113229 ) ) ( not ( = ?auto_113231 ?auto_113235 ) ) ( not ( = ?auto_113231 ?auto_113233 ) ) ( not ( = ?auto_113231 ?auto_113230 ) ) ( not ( = ?auto_113231 ?auto_113229 ) ) ( not ( = ?auto_113235 ?auto_113233 ) ) ( not ( = ?auto_113235 ?auto_113230 ) ) ( not ( = ?auto_113235 ?auto_113229 ) ) ( not ( = ?auto_113228 ?auto_113232 ) ) ( not ( = ?auto_113228 ?auto_113231 ) ) ( not ( = ?auto_113228 ?auto_113235 ) ) ( ON ?auto_113228 ?auto_113234 ) ( not ( = ?auto_113228 ?auto_113234 ) ) ( not ( = ?auto_113229 ?auto_113234 ) ) ( not ( = ?auto_113230 ?auto_113234 ) ) ( not ( = ?auto_113233 ?auto_113234 ) ) ( not ( = ?auto_113232 ?auto_113234 ) ) ( not ( = ?auto_113231 ?auto_113234 ) ) ( not ( = ?auto_113235 ?auto_113234 ) ) ( ON ?auto_113229 ?auto_113228 ) ( ON-TABLE ?auto_113234 ) ( ON ?auto_113230 ?auto_113229 ) ( ON ?auto_113233 ?auto_113230 ) ( CLEAR ?auto_113233 ) ( HOLDING ?auto_113235 ) ( CLEAR ?auto_113231 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_113232 ?auto_113231 ?auto_113235 )
      ( MAKE-3PILE ?auto_113228 ?auto_113229 ?auto_113230 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_113236 - BLOCK
      ?auto_113237 - BLOCK
      ?auto_113238 - BLOCK
    )
    :vars
    (
      ?auto_113240 - BLOCK
      ?auto_113239 - BLOCK
      ?auto_113241 - BLOCK
      ?auto_113242 - BLOCK
      ?auto_113243 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_113236 ?auto_113237 ) ) ( not ( = ?auto_113236 ?auto_113238 ) ) ( not ( = ?auto_113237 ?auto_113238 ) ) ( not ( = ?auto_113236 ?auto_113240 ) ) ( not ( = ?auto_113237 ?auto_113240 ) ) ( not ( = ?auto_113238 ?auto_113240 ) ) ( ON-TABLE ?auto_113239 ) ( ON ?auto_113241 ?auto_113239 ) ( not ( = ?auto_113239 ?auto_113241 ) ) ( not ( = ?auto_113239 ?auto_113242 ) ) ( not ( = ?auto_113239 ?auto_113240 ) ) ( not ( = ?auto_113239 ?auto_113238 ) ) ( not ( = ?auto_113239 ?auto_113237 ) ) ( not ( = ?auto_113241 ?auto_113242 ) ) ( not ( = ?auto_113241 ?auto_113240 ) ) ( not ( = ?auto_113241 ?auto_113238 ) ) ( not ( = ?auto_113241 ?auto_113237 ) ) ( not ( = ?auto_113242 ?auto_113240 ) ) ( not ( = ?auto_113242 ?auto_113238 ) ) ( not ( = ?auto_113242 ?auto_113237 ) ) ( not ( = ?auto_113236 ?auto_113239 ) ) ( not ( = ?auto_113236 ?auto_113241 ) ) ( not ( = ?auto_113236 ?auto_113242 ) ) ( ON ?auto_113236 ?auto_113243 ) ( not ( = ?auto_113236 ?auto_113243 ) ) ( not ( = ?auto_113237 ?auto_113243 ) ) ( not ( = ?auto_113238 ?auto_113243 ) ) ( not ( = ?auto_113240 ?auto_113243 ) ) ( not ( = ?auto_113239 ?auto_113243 ) ) ( not ( = ?auto_113241 ?auto_113243 ) ) ( not ( = ?auto_113242 ?auto_113243 ) ) ( ON ?auto_113237 ?auto_113236 ) ( ON-TABLE ?auto_113243 ) ( ON ?auto_113238 ?auto_113237 ) ( ON ?auto_113240 ?auto_113238 ) ( CLEAR ?auto_113241 ) ( ON ?auto_113242 ?auto_113240 ) ( CLEAR ?auto_113242 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_113243 ?auto_113236 ?auto_113237 ?auto_113238 ?auto_113240 )
      ( MAKE-3PILE ?auto_113236 ?auto_113237 ?auto_113238 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_113244 - BLOCK
      ?auto_113245 - BLOCK
      ?auto_113246 - BLOCK
    )
    :vars
    (
      ?auto_113249 - BLOCK
      ?auto_113250 - BLOCK
      ?auto_113248 - BLOCK
      ?auto_113247 - BLOCK
      ?auto_113251 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_113244 ?auto_113245 ) ) ( not ( = ?auto_113244 ?auto_113246 ) ) ( not ( = ?auto_113245 ?auto_113246 ) ) ( not ( = ?auto_113244 ?auto_113249 ) ) ( not ( = ?auto_113245 ?auto_113249 ) ) ( not ( = ?auto_113246 ?auto_113249 ) ) ( ON-TABLE ?auto_113250 ) ( not ( = ?auto_113250 ?auto_113248 ) ) ( not ( = ?auto_113250 ?auto_113247 ) ) ( not ( = ?auto_113250 ?auto_113249 ) ) ( not ( = ?auto_113250 ?auto_113246 ) ) ( not ( = ?auto_113250 ?auto_113245 ) ) ( not ( = ?auto_113248 ?auto_113247 ) ) ( not ( = ?auto_113248 ?auto_113249 ) ) ( not ( = ?auto_113248 ?auto_113246 ) ) ( not ( = ?auto_113248 ?auto_113245 ) ) ( not ( = ?auto_113247 ?auto_113249 ) ) ( not ( = ?auto_113247 ?auto_113246 ) ) ( not ( = ?auto_113247 ?auto_113245 ) ) ( not ( = ?auto_113244 ?auto_113250 ) ) ( not ( = ?auto_113244 ?auto_113248 ) ) ( not ( = ?auto_113244 ?auto_113247 ) ) ( ON ?auto_113244 ?auto_113251 ) ( not ( = ?auto_113244 ?auto_113251 ) ) ( not ( = ?auto_113245 ?auto_113251 ) ) ( not ( = ?auto_113246 ?auto_113251 ) ) ( not ( = ?auto_113249 ?auto_113251 ) ) ( not ( = ?auto_113250 ?auto_113251 ) ) ( not ( = ?auto_113248 ?auto_113251 ) ) ( not ( = ?auto_113247 ?auto_113251 ) ) ( ON ?auto_113245 ?auto_113244 ) ( ON-TABLE ?auto_113251 ) ( ON ?auto_113246 ?auto_113245 ) ( ON ?auto_113249 ?auto_113246 ) ( ON ?auto_113247 ?auto_113249 ) ( CLEAR ?auto_113247 ) ( HOLDING ?auto_113248 ) ( CLEAR ?auto_113250 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_113250 ?auto_113248 )
      ( MAKE-3PILE ?auto_113244 ?auto_113245 ?auto_113246 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_113252 - BLOCK
      ?auto_113253 - BLOCK
      ?auto_113254 - BLOCK
    )
    :vars
    (
      ?auto_113259 - BLOCK
      ?auto_113255 - BLOCK
      ?auto_113256 - BLOCK
      ?auto_113258 - BLOCK
      ?auto_113257 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_113252 ?auto_113253 ) ) ( not ( = ?auto_113252 ?auto_113254 ) ) ( not ( = ?auto_113253 ?auto_113254 ) ) ( not ( = ?auto_113252 ?auto_113259 ) ) ( not ( = ?auto_113253 ?auto_113259 ) ) ( not ( = ?auto_113254 ?auto_113259 ) ) ( ON-TABLE ?auto_113255 ) ( not ( = ?auto_113255 ?auto_113256 ) ) ( not ( = ?auto_113255 ?auto_113258 ) ) ( not ( = ?auto_113255 ?auto_113259 ) ) ( not ( = ?auto_113255 ?auto_113254 ) ) ( not ( = ?auto_113255 ?auto_113253 ) ) ( not ( = ?auto_113256 ?auto_113258 ) ) ( not ( = ?auto_113256 ?auto_113259 ) ) ( not ( = ?auto_113256 ?auto_113254 ) ) ( not ( = ?auto_113256 ?auto_113253 ) ) ( not ( = ?auto_113258 ?auto_113259 ) ) ( not ( = ?auto_113258 ?auto_113254 ) ) ( not ( = ?auto_113258 ?auto_113253 ) ) ( not ( = ?auto_113252 ?auto_113255 ) ) ( not ( = ?auto_113252 ?auto_113256 ) ) ( not ( = ?auto_113252 ?auto_113258 ) ) ( ON ?auto_113252 ?auto_113257 ) ( not ( = ?auto_113252 ?auto_113257 ) ) ( not ( = ?auto_113253 ?auto_113257 ) ) ( not ( = ?auto_113254 ?auto_113257 ) ) ( not ( = ?auto_113259 ?auto_113257 ) ) ( not ( = ?auto_113255 ?auto_113257 ) ) ( not ( = ?auto_113256 ?auto_113257 ) ) ( not ( = ?auto_113258 ?auto_113257 ) ) ( ON ?auto_113253 ?auto_113252 ) ( ON-TABLE ?auto_113257 ) ( ON ?auto_113254 ?auto_113253 ) ( ON ?auto_113259 ?auto_113254 ) ( ON ?auto_113258 ?auto_113259 ) ( CLEAR ?auto_113255 ) ( ON ?auto_113256 ?auto_113258 ) ( CLEAR ?auto_113256 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_113257 ?auto_113252 ?auto_113253 ?auto_113254 ?auto_113259 ?auto_113258 )
      ( MAKE-3PILE ?auto_113252 ?auto_113253 ?auto_113254 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_113260 - BLOCK
      ?auto_113261 - BLOCK
      ?auto_113262 - BLOCK
    )
    :vars
    (
      ?auto_113267 - BLOCK
      ?auto_113265 - BLOCK
      ?auto_113264 - BLOCK
      ?auto_113266 - BLOCK
      ?auto_113263 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_113260 ?auto_113261 ) ) ( not ( = ?auto_113260 ?auto_113262 ) ) ( not ( = ?auto_113261 ?auto_113262 ) ) ( not ( = ?auto_113260 ?auto_113267 ) ) ( not ( = ?auto_113261 ?auto_113267 ) ) ( not ( = ?auto_113262 ?auto_113267 ) ) ( not ( = ?auto_113265 ?auto_113264 ) ) ( not ( = ?auto_113265 ?auto_113266 ) ) ( not ( = ?auto_113265 ?auto_113267 ) ) ( not ( = ?auto_113265 ?auto_113262 ) ) ( not ( = ?auto_113265 ?auto_113261 ) ) ( not ( = ?auto_113264 ?auto_113266 ) ) ( not ( = ?auto_113264 ?auto_113267 ) ) ( not ( = ?auto_113264 ?auto_113262 ) ) ( not ( = ?auto_113264 ?auto_113261 ) ) ( not ( = ?auto_113266 ?auto_113267 ) ) ( not ( = ?auto_113266 ?auto_113262 ) ) ( not ( = ?auto_113266 ?auto_113261 ) ) ( not ( = ?auto_113260 ?auto_113265 ) ) ( not ( = ?auto_113260 ?auto_113264 ) ) ( not ( = ?auto_113260 ?auto_113266 ) ) ( ON ?auto_113260 ?auto_113263 ) ( not ( = ?auto_113260 ?auto_113263 ) ) ( not ( = ?auto_113261 ?auto_113263 ) ) ( not ( = ?auto_113262 ?auto_113263 ) ) ( not ( = ?auto_113267 ?auto_113263 ) ) ( not ( = ?auto_113265 ?auto_113263 ) ) ( not ( = ?auto_113264 ?auto_113263 ) ) ( not ( = ?auto_113266 ?auto_113263 ) ) ( ON ?auto_113261 ?auto_113260 ) ( ON-TABLE ?auto_113263 ) ( ON ?auto_113262 ?auto_113261 ) ( ON ?auto_113267 ?auto_113262 ) ( ON ?auto_113266 ?auto_113267 ) ( ON ?auto_113264 ?auto_113266 ) ( CLEAR ?auto_113264 ) ( HOLDING ?auto_113265 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_113265 )
      ( MAKE-3PILE ?auto_113260 ?auto_113261 ?auto_113262 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_113268 - BLOCK
      ?auto_113269 - BLOCK
      ?auto_113270 - BLOCK
    )
    :vars
    (
      ?auto_113272 - BLOCK
      ?auto_113273 - BLOCK
      ?auto_113274 - BLOCK
      ?auto_113275 - BLOCK
      ?auto_113271 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_113268 ?auto_113269 ) ) ( not ( = ?auto_113268 ?auto_113270 ) ) ( not ( = ?auto_113269 ?auto_113270 ) ) ( not ( = ?auto_113268 ?auto_113272 ) ) ( not ( = ?auto_113269 ?auto_113272 ) ) ( not ( = ?auto_113270 ?auto_113272 ) ) ( not ( = ?auto_113273 ?auto_113274 ) ) ( not ( = ?auto_113273 ?auto_113275 ) ) ( not ( = ?auto_113273 ?auto_113272 ) ) ( not ( = ?auto_113273 ?auto_113270 ) ) ( not ( = ?auto_113273 ?auto_113269 ) ) ( not ( = ?auto_113274 ?auto_113275 ) ) ( not ( = ?auto_113274 ?auto_113272 ) ) ( not ( = ?auto_113274 ?auto_113270 ) ) ( not ( = ?auto_113274 ?auto_113269 ) ) ( not ( = ?auto_113275 ?auto_113272 ) ) ( not ( = ?auto_113275 ?auto_113270 ) ) ( not ( = ?auto_113275 ?auto_113269 ) ) ( not ( = ?auto_113268 ?auto_113273 ) ) ( not ( = ?auto_113268 ?auto_113274 ) ) ( not ( = ?auto_113268 ?auto_113275 ) ) ( ON ?auto_113268 ?auto_113271 ) ( not ( = ?auto_113268 ?auto_113271 ) ) ( not ( = ?auto_113269 ?auto_113271 ) ) ( not ( = ?auto_113270 ?auto_113271 ) ) ( not ( = ?auto_113272 ?auto_113271 ) ) ( not ( = ?auto_113273 ?auto_113271 ) ) ( not ( = ?auto_113274 ?auto_113271 ) ) ( not ( = ?auto_113275 ?auto_113271 ) ) ( ON ?auto_113269 ?auto_113268 ) ( ON-TABLE ?auto_113271 ) ( ON ?auto_113270 ?auto_113269 ) ( ON ?auto_113272 ?auto_113270 ) ( ON ?auto_113275 ?auto_113272 ) ( ON ?auto_113274 ?auto_113275 ) ( ON ?auto_113273 ?auto_113274 ) ( CLEAR ?auto_113273 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_113271 ?auto_113268 ?auto_113269 ?auto_113270 ?auto_113272 ?auto_113275 ?auto_113274 )
      ( MAKE-3PILE ?auto_113268 ?auto_113269 ?auto_113270 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_113295 - BLOCK
      ?auto_113296 - BLOCK
      ?auto_113297 - BLOCK
    )
    :vars
    (
      ?auto_113299 - BLOCK
      ?auto_113300 - BLOCK
      ?auto_113298 - BLOCK
      ?auto_113301 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113299 ?auto_113297 ) ( ON-TABLE ?auto_113295 ) ( ON ?auto_113296 ?auto_113295 ) ( ON ?auto_113297 ?auto_113296 ) ( not ( = ?auto_113295 ?auto_113296 ) ) ( not ( = ?auto_113295 ?auto_113297 ) ) ( not ( = ?auto_113295 ?auto_113299 ) ) ( not ( = ?auto_113296 ?auto_113297 ) ) ( not ( = ?auto_113296 ?auto_113299 ) ) ( not ( = ?auto_113297 ?auto_113299 ) ) ( not ( = ?auto_113295 ?auto_113300 ) ) ( not ( = ?auto_113295 ?auto_113298 ) ) ( not ( = ?auto_113296 ?auto_113300 ) ) ( not ( = ?auto_113296 ?auto_113298 ) ) ( not ( = ?auto_113297 ?auto_113300 ) ) ( not ( = ?auto_113297 ?auto_113298 ) ) ( not ( = ?auto_113299 ?auto_113300 ) ) ( not ( = ?auto_113299 ?auto_113298 ) ) ( not ( = ?auto_113300 ?auto_113298 ) ) ( ON ?auto_113300 ?auto_113299 ) ( CLEAR ?auto_113300 ) ( HOLDING ?auto_113298 ) ( CLEAR ?auto_113301 ) ( ON-TABLE ?auto_113301 ) ( not ( = ?auto_113301 ?auto_113298 ) ) ( not ( = ?auto_113295 ?auto_113301 ) ) ( not ( = ?auto_113296 ?auto_113301 ) ) ( not ( = ?auto_113297 ?auto_113301 ) ) ( not ( = ?auto_113299 ?auto_113301 ) ) ( not ( = ?auto_113300 ?auto_113301 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_113301 ?auto_113298 )
      ( MAKE-3PILE ?auto_113295 ?auto_113296 ?auto_113297 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_113302 - BLOCK
      ?auto_113303 - BLOCK
      ?auto_113304 - BLOCK
    )
    :vars
    (
      ?auto_113305 - BLOCK
      ?auto_113308 - BLOCK
      ?auto_113307 - BLOCK
      ?auto_113306 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113305 ?auto_113304 ) ( ON-TABLE ?auto_113302 ) ( ON ?auto_113303 ?auto_113302 ) ( ON ?auto_113304 ?auto_113303 ) ( not ( = ?auto_113302 ?auto_113303 ) ) ( not ( = ?auto_113302 ?auto_113304 ) ) ( not ( = ?auto_113302 ?auto_113305 ) ) ( not ( = ?auto_113303 ?auto_113304 ) ) ( not ( = ?auto_113303 ?auto_113305 ) ) ( not ( = ?auto_113304 ?auto_113305 ) ) ( not ( = ?auto_113302 ?auto_113308 ) ) ( not ( = ?auto_113302 ?auto_113307 ) ) ( not ( = ?auto_113303 ?auto_113308 ) ) ( not ( = ?auto_113303 ?auto_113307 ) ) ( not ( = ?auto_113304 ?auto_113308 ) ) ( not ( = ?auto_113304 ?auto_113307 ) ) ( not ( = ?auto_113305 ?auto_113308 ) ) ( not ( = ?auto_113305 ?auto_113307 ) ) ( not ( = ?auto_113308 ?auto_113307 ) ) ( ON ?auto_113308 ?auto_113305 ) ( CLEAR ?auto_113306 ) ( ON-TABLE ?auto_113306 ) ( not ( = ?auto_113306 ?auto_113307 ) ) ( not ( = ?auto_113302 ?auto_113306 ) ) ( not ( = ?auto_113303 ?auto_113306 ) ) ( not ( = ?auto_113304 ?auto_113306 ) ) ( not ( = ?auto_113305 ?auto_113306 ) ) ( not ( = ?auto_113308 ?auto_113306 ) ) ( ON ?auto_113307 ?auto_113308 ) ( CLEAR ?auto_113307 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_113302 ?auto_113303 ?auto_113304 ?auto_113305 ?auto_113308 )
      ( MAKE-3PILE ?auto_113302 ?auto_113303 ?auto_113304 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_113309 - BLOCK
      ?auto_113310 - BLOCK
      ?auto_113311 - BLOCK
    )
    :vars
    (
      ?auto_113314 - BLOCK
      ?auto_113312 - BLOCK
      ?auto_113315 - BLOCK
      ?auto_113313 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113314 ?auto_113311 ) ( ON-TABLE ?auto_113309 ) ( ON ?auto_113310 ?auto_113309 ) ( ON ?auto_113311 ?auto_113310 ) ( not ( = ?auto_113309 ?auto_113310 ) ) ( not ( = ?auto_113309 ?auto_113311 ) ) ( not ( = ?auto_113309 ?auto_113314 ) ) ( not ( = ?auto_113310 ?auto_113311 ) ) ( not ( = ?auto_113310 ?auto_113314 ) ) ( not ( = ?auto_113311 ?auto_113314 ) ) ( not ( = ?auto_113309 ?auto_113312 ) ) ( not ( = ?auto_113309 ?auto_113315 ) ) ( not ( = ?auto_113310 ?auto_113312 ) ) ( not ( = ?auto_113310 ?auto_113315 ) ) ( not ( = ?auto_113311 ?auto_113312 ) ) ( not ( = ?auto_113311 ?auto_113315 ) ) ( not ( = ?auto_113314 ?auto_113312 ) ) ( not ( = ?auto_113314 ?auto_113315 ) ) ( not ( = ?auto_113312 ?auto_113315 ) ) ( ON ?auto_113312 ?auto_113314 ) ( not ( = ?auto_113313 ?auto_113315 ) ) ( not ( = ?auto_113309 ?auto_113313 ) ) ( not ( = ?auto_113310 ?auto_113313 ) ) ( not ( = ?auto_113311 ?auto_113313 ) ) ( not ( = ?auto_113314 ?auto_113313 ) ) ( not ( = ?auto_113312 ?auto_113313 ) ) ( ON ?auto_113315 ?auto_113312 ) ( CLEAR ?auto_113315 ) ( HOLDING ?auto_113313 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_113313 )
      ( MAKE-3PILE ?auto_113309 ?auto_113310 ?auto_113311 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_113326 - BLOCK
      ?auto_113327 - BLOCK
      ?auto_113328 - BLOCK
    )
    :vars
    (
      ?auto_113331 - BLOCK
      ?auto_113330 - BLOCK
      ?auto_113332 - BLOCK
      ?auto_113329 - BLOCK
      ?auto_113333 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113331 ?auto_113328 ) ( ON-TABLE ?auto_113326 ) ( ON ?auto_113327 ?auto_113326 ) ( ON ?auto_113328 ?auto_113327 ) ( not ( = ?auto_113326 ?auto_113327 ) ) ( not ( = ?auto_113326 ?auto_113328 ) ) ( not ( = ?auto_113326 ?auto_113331 ) ) ( not ( = ?auto_113327 ?auto_113328 ) ) ( not ( = ?auto_113327 ?auto_113331 ) ) ( not ( = ?auto_113328 ?auto_113331 ) ) ( not ( = ?auto_113326 ?auto_113330 ) ) ( not ( = ?auto_113326 ?auto_113332 ) ) ( not ( = ?auto_113327 ?auto_113330 ) ) ( not ( = ?auto_113327 ?auto_113332 ) ) ( not ( = ?auto_113328 ?auto_113330 ) ) ( not ( = ?auto_113328 ?auto_113332 ) ) ( not ( = ?auto_113331 ?auto_113330 ) ) ( not ( = ?auto_113331 ?auto_113332 ) ) ( not ( = ?auto_113330 ?auto_113332 ) ) ( ON ?auto_113330 ?auto_113331 ) ( not ( = ?auto_113329 ?auto_113332 ) ) ( not ( = ?auto_113326 ?auto_113329 ) ) ( not ( = ?auto_113327 ?auto_113329 ) ) ( not ( = ?auto_113328 ?auto_113329 ) ) ( not ( = ?auto_113331 ?auto_113329 ) ) ( not ( = ?auto_113330 ?auto_113329 ) ) ( ON ?auto_113332 ?auto_113330 ) ( CLEAR ?auto_113332 ) ( ON ?auto_113329 ?auto_113333 ) ( CLEAR ?auto_113329 ) ( HAND-EMPTY ) ( not ( = ?auto_113326 ?auto_113333 ) ) ( not ( = ?auto_113327 ?auto_113333 ) ) ( not ( = ?auto_113328 ?auto_113333 ) ) ( not ( = ?auto_113331 ?auto_113333 ) ) ( not ( = ?auto_113330 ?auto_113333 ) ) ( not ( = ?auto_113332 ?auto_113333 ) ) ( not ( = ?auto_113329 ?auto_113333 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_113329 ?auto_113333 )
      ( MAKE-3PILE ?auto_113326 ?auto_113327 ?auto_113328 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_113334 - BLOCK
      ?auto_113335 - BLOCK
      ?auto_113336 - BLOCK
    )
    :vars
    (
      ?auto_113341 - BLOCK
      ?auto_113338 - BLOCK
      ?auto_113337 - BLOCK
      ?auto_113340 - BLOCK
      ?auto_113339 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113341 ?auto_113336 ) ( ON-TABLE ?auto_113334 ) ( ON ?auto_113335 ?auto_113334 ) ( ON ?auto_113336 ?auto_113335 ) ( not ( = ?auto_113334 ?auto_113335 ) ) ( not ( = ?auto_113334 ?auto_113336 ) ) ( not ( = ?auto_113334 ?auto_113341 ) ) ( not ( = ?auto_113335 ?auto_113336 ) ) ( not ( = ?auto_113335 ?auto_113341 ) ) ( not ( = ?auto_113336 ?auto_113341 ) ) ( not ( = ?auto_113334 ?auto_113338 ) ) ( not ( = ?auto_113334 ?auto_113337 ) ) ( not ( = ?auto_113335 ?auto_113338 ) ) ( not ( = ?auto_113335 ?auto_113337 ) ) ( not ( = ?auto_113336 ?auto_113338 ) ) ( not ( = ?auto_113336 ?auto_113337 ) ) ( not ( = ?auto_113341 ?auto_113338 ) ) ( not ( = ?auto_113341 ?auto_113337 ) ) ( not ( = ?auto_113338 ?auto_113337 ) ) ( ON ?auto_113338 ?auto_113341 ) ( not ( = ?auto_113340 ?auto_113337 ) ) ( not ( = ?auto_113334 ?auto_113340 ) ) ( not ( = ?auto_113335 ?auto_113340 ) ) ( not ( = ?auto_113336 ?auto_113340 ) ) ( not ( = ?auto_113341 ?auto_113340 ) ) ( not ( = ?auto_113338 ?auto_113340 ) ) ( ON ?auto_113340 ?auto_113339 ) ( CLEAR ?auto_113340 ) ( not ( = ?auto_113334 ?auto_113339 ) ) ( not ( = ?auto_113335 ?auto_113339 ) ) ( not ( = ?auto_113336 ?auto_113339 ) ) ( not ( = ?auto_113341 ?auto_113339 ) ) ( not ( = ?auto_113338 ?auto_113339 ) ) ( not ( = ?auto_113337 ?auto_113339 ) ) ( not ( = ?auto_113340 ?auto_113339 ) ) ( HOLDING ?auto_113337 ) ( CLEAR ?auto_113338 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_113334 ?auto_113335 ?auto_113336 ?auto_113341 ?auto_113338 ?auto_113337 )
      ( MAKE-3PILE ?auto_113334 ?auto_113335 ?auto_113336 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_113396 - BLOCK
      ?auto_113397 - BLOCK
      ?auto_113398 - BLOCK
      ?auto_113399 - BLOCK
    )
    :vars
    (
      ?auto_113400 - BLOCK
      ?auto_113402 - BLOCK
      ?auto_113401 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_113396 ) ( ON ?auto_113397 ?auto_113396 ) ( not ( = ?auto_113396 ?auto_113397 ) ) ( not ( = ?auto_113396 ?auto_113398 ) ) ( not ( = ?auto_113396 ?auto_113399 ) ) ( not ( = ?auto_113397 ?auto_113398 ) ) ( not ( = ?auto_113397 ?auto_113399 ) ) ( not ( = ?auto_113398 ?auto_113399 ) ) ( ON ?auto_113399 ?auto_113400 ) ( not ( = ?auto_113396 ?auto_113400 ) ) ( not ( = ?auto_113397 ?auto_113400 ) ) ( not ( = ?auto_113398 ?auto_113400 ) ) ( not ( = ?auto_113399 ?auto_113400 ) ) ( CLEAR ?auto_113397 ) ( ON ?auto_113398 ?auto_113399 ) ( CLEAR ?auto_113398 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_113402 ) ( ON ?auto_113401 ?auto_113402 ) ( ON ?auto_113400 ?auto_113401 ) ( not ( = ?auto_113402 ?auto_113401 ) ) ( not ( = ?auto_113402 ?auto_113400 ) ) ( not ( = ?auto_113402 ?auto_113399 ) ) ( not ( = ?auto_113402 ?auto_113398 ) ) ( not ( = ?auto_113401 ?auto_113400 ) ) ( not ( = ?auto_113401 ?auto_113399 ) ) ( not ( = ?auto_113401 ?auto_113398 ) ) ( not ( = ?auto_113396 ?auto_113402 ) ) ( not ( = ?auto_113396 ?auto_113401 ) ) ( not ( = ?auto_113397 ?auto_113402 ) ) ( not ( = ?auto_113397 ?auto_113401 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_113402 ?auto_113401 ?auto_113400 ?auto_113399 )
      ( MAKE-4PILE ?auto_113396 ?auto_113397 ?auto_113398 ?auto_113399 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_113403 - BLOCK
      ?auto_113404 - BLOCK
      ?auto_113405 - BLOCK
      ?auto_113406 - BLOCK
    )
    :vars
    (
      ?auto_113407 - BLOCK
      ?auto_113409 - BLOCK
      ?auto_113408 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_113403 ) ( not ( = ?auto_113403 ?auto_113404 ) ) ( not ( = ?auto_113403 ?auto_113405 ) ) ( not ( = ?auto_113403 ?auto_113406 ) ) ( not ( = ?auto_113404 ?auto_113405 ) ) ( not ( = ?auto_113404 ?auto_113406 ) ) ( not ( = ?auto_113405 ?auto_113406 ) ) ( ON ?auto_113406 ?auto_113407 ) ( not ( = ?auto_113403 ?auto_113407 ) ) ( not ( = ?auto_113404 ?auto_113407 ) ) ( not ( = ?auto_113405 ?auto_113407 ) ) ( not ( = ?auto_113406 ?auto_113407 ) ) ( ON ?auto_113405 ?auto_113406 ) ( CLEAR ?auto_113405 ) ( ON-TABLE ?auto_113409 ) ( ON ?auto_113408 ?auto_113409 ) ( ON ?auto_113407 ?auto_113408 ) ( not ( = ?auto_113409 ?auto_113408 ) ) ( not ( = ?auto_113409 ?auto_113407 ) ) ( not ( = ?auto_113409 ?auto_113406 ) ) ( not ( = ?auto_113409 ?auto_113405 ) ) ( not ( = ?auto_113408 ?auto_113407 ) ) ( not ( = ?auto_113408 ?auto_113406 ) ) ( not ( = ?auto_113408 ?auto_113405 ) ) ( not ( = ?auto_113403 ?auto_113409 ) ) ( not ( = ?auto_113403 ?auto_113408 ) ) ( not ( = ?auto_113404 ?auto_113409 ) ) ( not ( = ?auto_113404 ?auto_113408 ) ) ( HOLDING ?auto_113404 ) ( CLEAR ?auto_113403 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_113403 ?auto_113404 )
      ( MAKE-4PILE ?auto_113403 ?auto_113404 ?auto_113405 ?auto_113406 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_113410 - BLOCK
      ?auto_113411 - BLOCK
      ?auto_113412 - BLOCK
      ?auto_113413 - BLOCK
    )
    :vars
    (
      ?auto_113414 - BLOCK
      ?auto_113416 - BLOCK
      ?auto_113415 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_113410 ) ( not ( = ?auto_113410 ?auto_113411 ) ) ( not ( = ?auto_113410 ?auto_113412 ) ) ( not ( = ?auto_113410 ?auto_113413 ) ) ( not ( = ?auto_113411 ?auto_113412 ) ) ( not ( = ?auto_113411 ?auto_113413 ) ) ( not ( = ?auto_113412 ?auto_113413 ) ) ( ON ?auto_113413 ?auto_113414 ) ( not ( = ?auto_113410 ?auto_113414 ) ) ( not ( = ?auto_113411 ?auto_113414 ) ) ( not ( = ?auto_113412 ?auto_113414 ) ) ( not ( = ?auto_113413 ?auto_113414 ) ) ( ON ?auto_113412 ?auto_113413 ) ( ON-TABLE ?auto_113416 ) ( ON ?auto_113415 ?auto_113416 ) ( ON ?auto_113414 ?auto_113415 ) ( not ( = ?auto_113416 ?auto_113415 ) ) ( not ( = ?auto_113416 ?auto_113414 ) ) ( not ( = ?auto_113416 ?auto_113413 ) ) ( not ( = ?auto_113416 ?auto_113412 ) ) ( not ( = ?auto_113415 ?auto_113414 ) ) ( not ( = ?auto_113415 ?auto_113413 ) ) ( not ( = ?auto_113415 ?auto_113412 ) ) ( not ( = ?auto_113410 ?auto_113416 ) ) ( not ( = ?auto_113410 ?auto_113415 ) ) ( not ( = ?auto_113411 ?auto_113416 ) ) ( not ( = ?auto_113411 ?auto_113415 ) ) ( CLEAR ?auto_113410 ) ( ON ?auto_113411 ?auto_113412 ) ( CLEAR ?auto_113411 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_113416 ?auto_113415 ?auto_113414 ?auto_113413 ?auto_113412 )
      ( MAKE-4PILE ?auto_113410 ?auto_113411 ?auto_113412 ?auto_113413 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_113417 - BLOCK
      ?auto_113418 - BLOCK
      ?auto_113419 - BLOCK
      ?auto_113420 - BLOCK
    )
    :vars
    (
      ?auto_113423 - BLOCK
      ?auto_113421 - BLOCK
      ?auto_113422 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_113417 ?auto_113418 ) ) ( not ( = ?auto_113417 ?auto_113419 ) ) ( not ( = ?auto_113417 ?auto_113420 ) ) ( not ( = ?auto_113418 ?auto_113419 ) ) ( not ( = ?auto_113418 ?auto_113420 ) ) ( not ( = ?auto_113419 ?auto_113420 ) ) ( ON ?auto_113420 ?auto_113423 ) ( not ( = ?auto_113417 ?auto_113423 ) ) ( not ( = ?auto_113418 ?auto_113423 ) ) ( not ( = ?auto_113419 ?auto_113423 ) ) ( not ( = ?auto_113420 ?auto_113423 ) ) ( ON ?auto_113419 ?auto_113420 ) ( ON-TABLE ?auto_113421 ) ( ON ?auto_113422 ?auto_113421 ) ( ON ?auto_113423 ?auto_113422 ) ( not ( = ?auto_113421 ?auto_113422 ) ) ( not ( = ?auto_113421 ?auto_113423 ) ) ( not ( = ?auto_113421 ?auto_113420 ) ) ( not ( = ?auto_113421 ?auto_113419 ) ) ( not ( = ?auto_113422 ?auto_113423 ) ) ( not ( = ?auto_113422 ?auto_113420 ) ) ( not ( = ?auto_113422 ?auto_113419 ) ) ( not ( = ?auto_113417 ?auto_113421 ) ) ( not ( = ?auto_113417 ?auto_113422 ) ) ( not ( = ?auto_113418 ?auto_113421 ) ) ( not ( = ?auto_113418 ?auto_113422 ) ) ( ON ?auto_113418 ?auto_113419 ) ( CLEAR ?auto_113418 ) ( HOLDING ?auto_113417 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_113417 )
      ( MAKE-4PILE ?auto_113417 ?auto_113418 ?auto_113419 ?auto_113420 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_113424 - BLOCK
      ?auto_113425 - BLOCK
      ?auto_113426 - BLOCK
      ?auto_113427 - BLOCK
    )
    :vars
    (
      ?auto_113430 - BLOCK
      ?auto_113428 - BLOCK
      ?auto_113429 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_113424 ?auto_113425 ) ) ( not ( = ?auto_113424 ?auto_113426 ) ) ( not ( = ?auto_113424 ?auto_113427 ) ) ( not ( = ?auto_113425 ?auto_113426 ) ) ( not ( = ?auto_113425 ?auto_113427 ) ) ( not ( = ?auto_113426 ?auto_113427 ) ) ( ON ?auto_113427 ?auto_113430 ) ( not ( = ?auto_113424 ?auto_113430 ) ) ( not ( = ?auto_113425 ?auto_113430 ) ) ( not ( = ?auto_113426 ?auto_113430 ) ) ( not ( = ?auto_113427 ?auto_113430 ) ) ( ON ?auto_113426 ?auto_113427 ) ( ON-TABLE ?auto_113428 ) ( ON ?auto_113429 ?auto_113428 ) ( ON ?auto_113430 ?auto_113429 ) ( not ( = ?auto_113428 ?auto_113429 ) ) ( not ( = ?auto_113428 ?auto_113430 ) ) ( not ( = ?auto_113428 ?auto_113427 ) ) ( not ( = ?auto_113428 ?auto_113426 ) ) ( not ( = ?auto_113429 ?auto_113430 ) ) ( not ( = ?auto_113429 ?auto_113427 ) ) ( not ( = ?auto_113429 ?auto_113426 ) ) ( not ( = ?auto_113424 ?auto_113428 ) ) ( not ( = ?auto_113424 ?auto_113429 ) ) ( not ( = ?auto_113425 ?auto_113428 ) ) ( not ( = ?auto_113425 ?auto_113429 ) ) ( ON ?auto_113425 ?auto_113426 ) ( ON ?auto_113424 ?auto_113425 ) ( CLEAR ?auto_113424 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_113428 ?auto_113429 ?auto_113430 ?auto_113427 ?auto_113426 ?auto_113425 )
      ( MAKE-4PILE ?auto_113424 ?auto_113425 ?auto_113426 ?auto_113427 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_113435 - BLOCK
      ?auto_113436 - BLOCK
      ?auto_113437 - BLOCK
      ?auto_113438 - BLOCK
    )
    :vars
    (
      ?auto_113440 - BLOCK
      ?auto_113441 - BLOCK
      ?auto_113439 - BLOCK
      ?auto_113442 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_113435 ?auto_113436 ) ) ( not ( = ?auto_113435 ?auto_113437 ) ) ( not ( = ?auto_113435 ?auto_113438 ) ) ( not ( = ?auto_113436 ?auto_113437 ) ) ( not ( = ?auto_113436 ?auto_113438 ) ) ( not ( = ?auto_113437 ?auto_113438 ) ) ( ON ?auto_113438 ?auto_113440 ) ( not ( = ?auto_113435 ?auto_113440 ) ) ( not ( = ?auto_113436 ?auto_113440 ) ) ( not ( = ?auto_113437 ?auto_113440 ) ) ( not ( = ?auto_113438 ?auto_113440 ) ) ( ON ?auto_113437 ?auto_113438 ) ( ON-TABLE ?auto_113441 ) ( ON ?auto_113439 ?auto_113441 ) ( ON ?auto_113440 ?auto_113439 ) ( not ( = ?auto_113441 ?auto_113439 ) ) ( not ( = ?auto_113441 ?auto_113440 ) ) ( not ( = ?auto_113441 ?auto_113438 ) ) ( not ( = ?auto_113441 ?auto_113437 ) ) ( not ( = ?auto_113439 ?auto_113440 ) ) ( not ( = ?auto_113439 ?auto_113438 ) ) ( not ( = ?auto_113439 ?auto_113437 ) ) ( not ( = ?auto_113435 ?auto_113441 ) ) ( not ( = ?auto_113435 ?auto_113439 ) ) ( not ( = ?auto_113436 ?auto_113441 ) ) ( not ( = ?auto_113436 ?auto_113439 ) ) ( ON ?auto_113436 ?auto_113437 ) ( CLEAR ?auto_113436 ) ( ON ?auto_113435 ?auto_113442 ) ( CLEAR ?auto_113435 ) ( HAND-EMPTY ) ( not ( = ?auto_113435 ?auto_113442 ) ) ( not ( = ?auto_113436 ?auto_113442 ) ) ( not ( = ?auto_113437 ?auto_113442 ) ) ( not ( = ?auto_113438 ?auto_113442 ) ) ( not ( = ?auto_113440 ?auto_113442 ) ) ( not ( = ?auto_113441 ?auto_113442 ) ) ( not ( = ?auto_113439 ?auto_113442 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_113435 ?auto_113442 )
      ( MAKE-4PILE ?auto_113435 ?auto_113436 ?auto_113437 ?auto_113438 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_113443 - BLOCK
      ?auto_113444 - BLOCK
      ?auto_113445 - BLOCK
      ?auto_113446 - BLOCK
    )
    :vars
    (
      ?auto_113448 - BLOCK
      ?auto_113450 - BLOCK
      ?auto_113449 - BLOCK
      ?auto_113447 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_113443 ?auto_113444 ) ) ( not ( = ?auto_113443 ?auto_113445 ) ) ( not ( = ?auto_113443 ?auto_113446 ) ) ( not ( = ?auto_113444 ?auto_113445 ) ) ( not ( = ?auto_113444 ?auto_113446 ) ) ( not ( = ?auto_113445 ?auto_113446 ) ) ( ON ?auto_113446 ?auto_113448 ) ( not ( = ?auto_113443 ?auto_113448 ) ) ( not ( = ?auto_113444 ?auto_113448 ) ) ( not ( = ?auto_113445 ?auto_113448 ) ) ( not ( = ?auto_113446 ?auto_113448 ) ) ( ON ?auto_113445 ?auto_113446 ) ( ON-TABLE ?auto_113450 ) ( ON ?auto_113449 ?auto_113450 ) ( ON ?auto_113448 ?auto_113449 ) ( not ( = ?auto_113450 ?auto_113449 ) ) ( not ( = ?auto_113450 ?auto_113448 ) ) ( not ( = ?auto_113450 ?auto_113446 ) ) ( not ( = ?auto_113450 ?auto_113445 ) ) ( not ( = ?auto_113449 ?auto_113448 ) ) ( not ( = ?auto_113449 ?auto_113446 ) ) ( not ( = ?auto_113449 ?auto_113445 ) ) ( not ( = ?auto_113443 ?auto_113450 ) ) ( not ( = ?auto_113443 ?auto_113449 ) ) ( not ( = ?auto_113444 ?auto_113450 ) ) ( not ( = ?auto_113444 ?auto_113449 ) ) ( ON ?auto_113443 ?auto_113447 ) ( CLEAR ?auto_113443 ) ( not ( = ?auto_113443 ?auto_113447 ) ) ( not ( = ?auto_113444 ?auto_113447 ) ) ( not ( = ?auto_113445 ?auto_113447 ) ) ( not ( = ?auto_113446 ?auto_113447 ) ) ( not ( = ?auto_113448 ?auto_113447 ) ) ( not ( = ?auto_113450 ?auto_113447 ) ) ( not ( = ?auto_113449 ?auto_113447 ) ) ( HOLDING ?auto_113444 ) ( CLEAR ?auto_113445 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_113450 ?auto_113449 ?auto_113448 ?auto_113446 ?auto_113445 ?auto_113444 )
      ( MAKE-4PILE ?auto_113443 ?auto_113444 ?auto_113445 ?auto_113446 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_113451 - BLOCK
      ?auto_113452 - BLOCK
      ?auto_113453 - BLOCK
      ?auto_113454 - BLOCK
    )
    :vars
    (
      ?auto_113457 - BLOCK
      ?auto_113455 - BLOCK
      ?auto_113456 - BLOCK
      ?auto_113458 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_113451 ?auto_113452 ) ) ( not ( = ?auto_113451 ?auto_113453 ) ) ( not ( = ?auto_113451 ?auto_113454 ) ) ( not ( = ?auto_113452 ?auto_113453 ) ) ( not ( = ?auto_113452 ?auto_113454 ) ) ( not ( = ?auto_113453 ?auto_113454 ) ) ( ON ?auto_113454 ?auto_113457 ) ( not ( = ?auto_113451 ?auto_113457 ) ) ( not ( = ?auto_113452 ?auto_113457 ) ) ( not ( = ?auto_113453 ?auto_113457 ) ) ( not ( = ?auto_113454 ?auto_113457 ) ) ( ON ?auto_113453 ?auto_113454 ) ( ON-TABLE ?auto_113455 ) ( ON ?auto_113456 ?auto_113455 ) ( ON ?auto_113457 ?auto_113456 ) ( not ( = ?auto_113455 ?auto_113456 ) ) ( not ( = ?auto_113455 ?auto_113457 ) ) ( not ( = ?auto_113455 ?auto_113454 ) ) ( not ( = ?auto_113455 ?auto_113453 ) ) ( not ( = ?auto_113456 ?auto_113457 ) ) ( not ( = ?auto_113456 ?auto_113454 ) ) ( not ( = ?auto_113456 ?auto_113453 ) ) ( not ( = ?auto_113451 ?auto_113455 ) ) ( not ( = ?auto_113451 ?auto_113456 ) ) ( not ( = ?auto_113452 ?auto_113455 ) ) ( not ( = ?auto_113452 ?auto_113456 ) ) ( ON ?auto_113451 ?auto_113458 ) ( not ( = ?auto_113451 ?auto_113458 ) ) ( not ( = ?auto_113452 ?auto_113458 ) ) ( not ( = ?auto_113453 ?auto_113458 ) ) ( not ( = ?auto_113454 ?auto_113458 ) ) ( not ( = ?auto_113457 ?auto_113458 ) ) ( not ( = ?auto_113455 ?auto_113458 ) ) ( not ( = ?auto_113456 ?auto_113458 ) ) ( CLEAR ?auto_113453 ) ( ON ?auto_113452 ?auto_113451 ) ( CLEAR ?auto_113452 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_113458 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_113458 ?auto_113451 )
      ( MAKE-4PILE ?auto_113451 ?auto_113452 ?auto_113453 ?auto_113454 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_113459 - BLOCK
      ?auto_113460 - BLOCK
      ?auto_113461 - BLOCK
      ?auto_113462 - BLOCK
    )
    :vars
    (
      ?auto_113466 - BLOCK
      ?auto_113464 - BLOCK
      ?auto_113463 - BLOCK
      ?auto_113465 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_113459 ?auto_113460 ) ) ( not ( = ?auto_113459 ?auto_113461 ) ) ( not ( = ?auto_113459 ?auto_113462 ) ) ( not ( = ?auto_113460 ?auto_113461 ) ) ( not ( = ?auto_113460 ?auto_113462 ) ) ( not ( = ?auto_113461 ?auto_113462 ) ) ( ON ?auto_113462 ?auto_113466 ) ( not ( = ?auto_113459 ?auto_113466 ) ) ( not ( = ?auto_113460 ?auto_113466 ) ) ( not ( = ?auto_113461 ?auto_113466 ) ) ( not ( = ?auto_113462 ?auto_113466 ) ) ( ON-TABLE ?auto_113464 ) ( ON ?auto_113463 ?auto_113464 ) ( ON ?auto_113466 ?auto_113463 ) ( not ( = ?auto_113464 ?auto_113463 ) ) ( not ( = ?auto_113464 ?auto_113466 ) ) ( not ( = ?auto_113464 ?auto_113462 ) ) ( not ( = ?auto_113464 ?auto_113461 ) ) ( not ( = ?auto_113463 ?auto_113466 ) ) ( not ( = ?auto_113463 ?auto_113462 ) ) ( not ( = ?auto_113463 ?auto_113461 ) ) ( not ( = ?auto_113459 ?auto_113464 ) ) ( not ( = ?auto_113459 ?auto_113463 ) ) ( not ( = ?auto_113460 ?auto_113464 ) ) ( not ( = ?auto_113460 ?auto_113463 ) ) ( ON ?auto_113459 ?auto_113465 ) ( not ( = ?auto_113459 ?auto_113465 ) ) ( not ( = ?auto_113460 ?auto_113465 ) ) ( not ( = ?auto_113461 ?auto_113465 ) ) ( not ( = ?auto_113462 ?auto_113465 ) ) ( not ( = ?auto_113466 ?auto_113465 ) ) ( not ( = ?auto_113464 ?auto_113465 ) ) ( not ( = ?auto_113463 ?auto_113465 ) ) ( ON ?auto_113460 ?auto_113459 ) ( CLEAR ?auto_113460 ) ( ON-TABLE ?auto_113465 ) ( HOLDING ?auto_113461 ) ( CLEAR ?auto_113462 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_113464 ?auto_113463 ?auto_113466 ?auto_113462 ?auto_113461 )
      ( MAKE-4PILE ?auto_113459 ?auto_113460 ?auto_113461 ?auto_113462 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_113467 - BLOCK
      ?auto_113468 - BLOCK
      ?auto_113469 - BLOCK
      ?auto_113470 - BLOCK
    )
    :vars
    (
      ?auto_113472 - BLOCK
      ?auto_113471 - BLOCK
      ?auto_113473 - BLOCK
      ?auto_113474 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_113467 ?auto_113468 ) ) ( not ( = ?auto_113467 ?auto_113469 ) ) ( not ( = ?auto_113467 ?auto_113470 ) ) ( not ( = ?auto_113468 ?auto_113469 ) ) ( not ( = ?auto_113468 ?auto_113470 ) ) ( not ( = ?auto_113469 ?auto_113470 ) ) ( ON ?auto_113470 ?auto_113472 ) ( not ( = ?auto_113467 ?auto_113472 ) ) ( not ( = ?auto_113468 ?auto_113472 ) ) ( not ( = ?auto_113469 ?auto_113472 ) ) ( not ( = ?auto_113470 ?auto_113472 ) ) ( ON-TABLE ?auto_113471 ) ( ON ?auto_113473 ?auto_113471 ) ( ON ?auto_113472 ?auto_113473 ) ( not ( = ?auto_113471 ?auto_113473 ) ) ( not ( = ?auto_113471 ?auto_113472 ) ) ( not ( = ?auto_113471 ?auto_113470 ) ) ( not ( = ?auto_113471 ?auto_113469 ) ) ( not ( = ?auto_113473 ?auto_113472 ) ) ( not ( = ?auto_113473 ?auto_113470 ) ) ( not ( = ?auto_113473 ?auto_113469 ) ) ( not ( = ?auto_113467 ?auto_113471 ) ) ( not ( = ?auto_113467 ?auto_113473 ) ) ( not ( = ?auto_113468 ?auto_113471 ) ) ( not ( = ?auto_113468 ?auto_113473 ) ) ( ON ?auto_113467 ?auto_113474 ) ( not ( = ?auto_113467 ?auto_113474 ) ) ( not ( = ?auto_113468 ?auto_113474 ) ) ( not ( = ?auto_113469 ?auto_113474 ) ) ( not ( = ?auto_113470 ?auto_113474 ) ) ( not ( = ?auto_113472 ?auto_113474 ) ) ( not ( = ?auto_113471 ?auto_113474 ) ) ( not ( = ?auto_113473 ?auto_113474 ) ) ( ON ?auto_113468 ?auto_113467 ) ( ON-TABLE ?auto_113474 ) ( CLEAR ?auto_113470 ) ( ON ?auto_113469 ?auto_113468 ) ( CLEAR ?auto_113469 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_113474 ?auto_113467 ?auto_113468 )
      ( MAKE-4PILE ?auto_113467 ?auto_113468 ?auto_113469 ?auto_113470 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_113475 - BLOCK
      ?auto_113476 - BLOCK
      ?auto_113477 - BLOCK
      ?auto_113478 - BLOCK
    )
    :vars
    (
      ?auto_113482 - BLOCK
      ?auto_113479 - BLOCK
      ?auto_113480 - BLOCK
      ?auto_113481 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_113475 ?auto_113476 ) ) ( not ( = ?auto_113475 ?auto_113477 ) ) ( not ( = ?auto_113475 ?auto_113478 ) ) ( not ( = ?auto_113476 ?auto_113477 ) ) ( not ( = ?auto_113476 ?auto_113478 ) ) ( not ( = ?auto_113477 ?auto_113478 ) ) ( not ( = ?auto_113475 ?auto_113482 ) ) ( not ( = ?auto_113476 ?auto_113482 ) ) ( not ( = ?auto_113477 ?auto_113482 ) ) ( not ( = ?auto_113478 ?auto_113482 ) ) ( ON-TABLE ?auto_113479 ) ( ON ?auto_113480 ?auto_113479 ) ( ON ?auto_113482 ?auto_113480 ) ( not ( = ?auto_113479 ?auto_113480 ) ) ( not ( = ?auto_113479 ?auto_113482 ) ) ( not ( = ?auto_113479 ?auto_113478 ) ) ( not ( = ?auto_113479 ?auto_113477 ) ) ( not ( = ?auto_113480 ?auto_113482 ) ) ( not ( = ?auto_113480 ?auto_113478 ) ) ( not ( = ?auto_113480 ?auto_113477 ) ) ( not ( = ?auto_113475 ?auto_113479 ) ) ( not ( = ?auto_113475 ?auto_113480 ) ) ( not ( = ?auto_113476 ?auto_113479 ) ) ( not ( = ?auto_113476 ?auto_113480 ) ) ( ON ?auto_113475 ?auto_113481 ) ( not ( = ?auto_113475 ?auto_113481 ) ) ( not ( = ?auto_113476 ?auto_113481 ) ) ( not ( = ?auto_113477 ?auto_113481 ) ) ( not ( = ?auto_113478 ?auto_113481 ) ) ( not ( = ?auto_113482 ?auto_113481 ) ) ( not ( = ?auto_113479 ?auto_113481 ) ) ( not ( = ?auto_113480 ?auto_113481 ) ) ( ON ?auto_113476 ?auto_113475 ) ( ON-TABLE ?auto_113481 ) ( ON ?auto_113477 ?auto_113476 ) ( CLEAR ?auto_113477 ) ( HOLDING ?auto_113478 ) ( CLEAR ?auto_113482 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_113479 ?auto_113480 ?auto_113482 ?auto_113478 )
      ( MAKE-4PILE ?auto_113475 ?auto_113476 ?auto_113477 ?auto_113478 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_113483 - BLOCK
      ?auto_113484 - BLOCK
      ?auto_113485 - BLOCK
      ?auto_113486 - BLOCK
    )
    :vars
    (
      ?auto_113490 - BLOCK
      ?auto_113487 - BLOCK
      ?auto_113489 - BLOCK
      ?auto_113488 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_113483 ?auto_113484 ) ) ( not ( = ?auto_113483 ?auto_113485 ) ) ( not ( = ?auto_113483 ?auto_113486 ) ) ( not ( = ?auto_113484 ?auto_113485 ) ) ( not ( = ?auto_113484 ?auto_113486 ) ) ( not ( = ?auto_113485 ?auto_113486 ) ) ( not ( = ?auto_113483 ?auto_113490 ) ) ( not ( = ?auto_113484 ?auto_113490 ) ) ( not ( = ?auto_113485 ?auto_113490 ) ) ( not ( = ?auto_113486 ?auto_113490 ) ) ( ON-TABLE ?auto_113487 ) ( ON ?auto_113489 ?auto_113487 ) ( ON ?auto_113490 ?auto_113489 ) ( not ( = ?auto_113487 ?auto_113489 ) ) ( not ( = ?auto_113487 ?auto_113490 ) ) ( not ( = ?auto_113487 ?auto_113486 ) ) ( not ( = ?auto_113487 ?auto_113485 ) ) ( not ( = ?auto_113489 ?auto_113490 ) ) ( not ( = ?auto_113489 ?auto_113486 ) ) ( not ( = ?auto_113489 ?auto_113485 ) ) ( not ( = ?auto_113483 ?auto_113487 ) ) ( not ( = ?auto_113483 ?auto_113489 ) ) ( not ( = ?auto_113484 ?auto_113487 ) ) ( not ( = ?auto_113484 ?auto_113489 ) ) ( ON ?auto_113483 ?auto_113488 ) ( not ( = ?auto_113483 ?auto_113488 ) ) ( not ( = ?auto_113484 ?auto_113488 ) ) ( not ( = ?auto_113485 ?auto_113488 ) ) ( not ( = ?auto_113486 ?auto_113488 ) ) ( not ( = ?auto_113490 ?auto_113488 ) ) ( not ( = ?auto_113487 ?auto_113488 ) ) ( not ( = ?auto_113489 ?auto_113488 ) ) ( ON ?auto_113484 ?auto_113483 ) ( ON-TABLE ?auto_113488 ) ( ON ?auto_113485 ?auto_113484 ) ( CLEAR ?auto_113490 ) ( ON ?auto_113486 ?auto_113485 ) ( CLEAR ?auto_113486 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_113488 ?auto_113483 ?auto_113484 ?auto_113485 )
      ( MAKE-4PILE ?auto_113483 ?auto_113484 ?auto_113485 ?auto_113486 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_113491 - BLOCK
      ?auto_113492 - BLOCK
      ?auto_113493 - BLOCK
      ?auto_113494 - BLOCK
    )
    :vars
    (
      ?auto_113498 - BLOCK
      ?auto_113497 - BLOCK
      ?auto_113496 - BLOCK
      ?auto_113495 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_113491 ?auto_113492 ) ) ( not ( = ?auto_113491 ?auto_113493 ) ) ( not ( = ?auto_113491 ?auto_113494 ) ) ( not ( = ?auto_113492 ?auto_113493 ) ) ( not ( = ?auto_113492 ?auto_113494 ) ) ( not ( = ?auto_113493 ?auto_113494 ) ) ( not ( = ?auto_113491 ?auto_113498 ) ) ( not ( = ?auto_113492 ?auto_113498 ) ) ( not ( = ?auto_113493 ?auto_113498 ) ) ( not ( = ?auto_113494 ?auto_113498 ) ) ( ON-TABLE ?auto_113497 ) ( ON ?auto_113496 ?auto_113497 ) ( not ( = ?auto_113497 ?auto_113496 ) ) ( not ( = ?auto_113497 ?auto_113498 ) ) ( not ( = ?auto_113497 ?auto_113494 ) ) ( not ( = ?auto_113497 ?auto_113493 ) ) ( not ( = ?auto_113496 ?auto_113498 ) ) ( not ( = ?auto_113496 ?auto_113494 ) ) ( not ( = ?auto_113496 ?auto_113493 ) ) ( not ( = ?auto_113491 ?auto_113497 ) ) ( not ( = ?auto_113491 ?auto_113496 ) ) ( not ( = ?auto_113492 ?auto_113497 ) ) ( not ( = ?auto_113492 ?auto_113496 ) ) ( ON ?auto_113491 ?auto_113495 ) ( not ( = ?auto_113491 ?auto_113495 ) ) ( not ( = ?auto_113492 ?auto_113495 ) ) ( not ( = ?auto_113493 ?auto_113495 ) ) ( not ( = ?auto_113494 ?auto_113495 ) ) ( not ( = ?auto_113498 ?auto_113495 ) ) ( not ( = ?auto_113497 ?auto_113495 ) ) ( not ( = ?auto_113496 ?auto_113495 ) ) ( ON ?auto_113492 ?auto_113491 ) ( ON-TABLE ?auto_113495 ) ( ON ?auto_113493 ?auto_113492 ) ( ON ?auto_113494 ?auto_113493 ) ( CLEAR ?auto_113494 ) ( HOLDING ?auto_113498 ) ( CLEAR ?auto_113496 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_113497 ?auto_113496 ?auto_113498 )
      ( MAKE-4PILE ?auto_113491 ?auto_113492 ?auto_113493 ?auto_113494 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_113499 - BLOCK
      ?auto_113500 - BLOCK
      ?auto_113501 - BLOCK
      ?auto_113502 - BLOCK
    )
    :vars
    (
      ?auto_113506 - BLOCK
      ?auto_113504 - BLOCK
      ?auto_113503 - BLOCK
      ?auto_113505 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_113499 ?auto_113500 ) ) ( not ( = ?auto_113499 ?auto_113501 ) ) ( not ( = ?auto_113499 ?auto_113502 ) ) ( not ( = ?auto_113500 ?auto_113501 ) ) ( not ( = ?auto_113500 ?auto_113502 ) ) ( not ( = ?auto_113501 ?auto_113502 ) ) ( not ( = ?auto_113499 ?auto_113506 ) ) ( not ( = ?auto_113500 ?auto_113506 ) ) ( not ( = ?auto_113501 ?auto_113506 ) ) ( not ( = ?auto_113502 ?auto_113506 ) ) ( ON-TABLE ?auto_113504 ) ( ON ?auto_113503 ?auto_113504 ) ( not ( = ?auto_113504 ?auto_113503 ) ) ( not ( = ?auto_113504 ?auto_113506 ) ) ( not ( = ?auto_113504 ?auto_113502 ) ) ( not ( = ?auto_113504 ?auto_113501 ) ) ( not ( = ?auto_113503 ?auto_113506 ) ) ( not ( = ?auto_113503 ?auto_113502 ) ) ( not ( = ?auto_113503 ?auto_113501 ) ) ( not ( = ?auto_113499 ?auto_113504 ) ) ( not ( = ?auto_113499 ?auto_113503 ) ) ( not ( = ?auto_113500 ?auto_113504 ) ) ( not ( = ?auto_113500 ?auto_113503 ) ) ( ON ?auto_113499 ?auto_113505 ) ( not ( = ?auto_113499 ?auto_113505 ) ) ( not ( = ?auto_113500 ?auto_113505 ) ) ( not ( = ?auto_113501 ?auto_113505 ) ) ( not ( = ?auto_113502 ?auto_113505 ) ) ( not ( = ?auto_113506 ?auto_113505 ) ) ( not ( = ?auto_113504 ?auto_113505 ) ) ( not ( = ?auto_113503 ?auto_113505 ) ) ( ON ?auto_113500 ?auto_113499 ) ( ON-TABLE ?auto_113505 ) ( ON ?auto_113501 ?auto_113500 ) ( ON ?auto_113502 ?auto_113501 ) ( CLEAR ?auto_113503 ) ( ON ?auto_113506 ?auto_113502 ) ( CLEAR ?auto_113506 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_113505 ?auto_113499 ?auto_113500 ?auto_113501 ?auto_113502 )
      ( MAKE-4PILE ?auto_113499 ?auto_113500 ?auto_113501 ?auto_113502 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_113507 - BLOCK
      ?auto_113508 - BLOCK
      ?auto_113509 - BLOCK
      ?auto_113510 - BLOCK
    )
    :vars
    (
      ?auto_113511 - BLOCK
      ?auto_113514 - BLOCK
      ?auto_113513 - BLOCK
      ?auto_113512 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_113507 ?auto_113508 ) ) ( not ( = ?auto_113507 ?auto_113509 ) ) ( not ( = ?auto_113507 ?auto_113510 ) ) ( not ( = ?auto_113508 ?auto_113509 ) ) ( not ( = ?auto_113508 ?auto_113510 ) ) ( not ( = ?auto_113509 ?auto_113510 ) ) ( not ( = ?auto_113507 ?auto_113511 ) ) ( not ( = ?auto_113508 ?auto_113511 ) ) ( not ( = ?auto_113509 ?auto_113511 ) ) ( not ( = ?auto_113510 ?auto_113511 ) ) ( ON-TABLE ?auto_113514 ) ( not ( = ?auto_113514 ?auto_113513 ) ) ( not ( = ?auto_113514 ?auto_113511 ) ) ( not ( = ?auto_113514 ?auto_113510 ) ) ( not ( = ?auto_113514 ?auto_113509 ) ) ( not ( = ?auto_113513 ?auto_113511 ) ) ( not ( = ?auto_113513 ?auto_113510 ) ) ( not ( = ?auto_113513 ?auto_113509 ) ) ( not ( = ?auto_113507 ?auto_113514 ) ) ( not ( = ?auto_113507 ?auto_113513 ) ) ( not ( = ?auto_113508 ?auto_113514 ) ) ( not ( = ?auto_113508 ?auto_113513 ) ) ( ON ?auto_113507 ?auto_113512 ) ( not ( = ?auto_113507 ?auto_113512 ) ) ( not ( = ?auto_113508 ?auto_113512 ) ) ( not ( = ?auto_113509 ?auto_113512 ) ) ( not ( = ?auto_113510 ?auto_113512 ) ) ( not ( = ?auto_113511 ?auto_113512 ) ) ( not ( = ?auto_113514 ?auto_113512 ) ) ( not ( = ?auto_113513 ?auto_113512 ) ) ( ON ?auto_113508 ?auto_113507 ) ( ON-TABLE ?auto_113512 ) ( ON ?auto_113509 ?auto_113508 ) ( ON ?auto_113510 ?auto_113509 ) ( ON ?auto_113511 ?auto_113510 ) ( CLEAR ?auto_113511 ) ( HOLDING ?auto_113513 ) ( CLEAR ?auto_113514 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_113514 ?auto_113513 )
      ( MAKE-4PILE ?auto_113507 ?auto_113508 ?auto_113509 ?auto_113510 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_113515 - BLOCK
      ?auto_113516 - BLOCK
      ?auto_113517 - BLOCK
      ?auto_113518 - BLOCK
    )
    :vars
    (
      ?auto_113521 - BLOCK
      ?auto_113520 - BLOCK
      ?auto_113522 - BLOCK
      ?auto_113519 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_113515 ?auto_113516 ) ) ( not ( = ?auto_113515 ?auto_113517 ) ) ( not ( = ?auto_113515 ?auto_113518 ) ) ( not ( = ?auto_113516 ?auto_113517 ) ) ( not ( = ?auto_113516 ?auto_113518 ) ) ( not ( = ?auto_113517 ?auto_113518 ) ) ( not ( = ?auto_113515 ?auto_113521 ) ) ( not ( = ?auto_113516 ?auto_113521 ) ) ( not ( = ?auto_113517 ?auto_113521 ) ) ( not ( = ?auto_113518 ?auto_113521 ) ) ( ON-TABLE ?auto_113520 ) ( not ( = ?auto_113520 ?auto_113522 ) ) ( not ( = ?auto_113520 ?auto_113521 ) ) ( not ( = ?auto_113520 ?auto_113518 ) ) ( not ( = ?auto_113520 ?auto_113517 ) ) ( not ( = ?auto_113522 ?auto_113521 ) ) ( not ( = ?auto_113522 ?auto_113518 ) ) ( not ( = ?auto_113522 ?auto_113517 ) ) ( not ( = ?auto_113515 ?auto_113520 ) ) ( not ( = ?auto_113515 ?auto_113522 ) ) ( not ( = ?auto_113516 ?auto_113520 ) ) ( not ( = ?auto_113516 ?auto_113522 ) ) ( ON ?auto_113515 ?auto_113519 ) ( not ( = ?auto_113515 ?auto_113519 ) ) ( not ( = ?auto_113516 ?auto_113519 ) ) ( not ( = ?auto_113517 ?auto_113519 ) ) ( not ( = ?auto_113518 ?auto_113519 ) ) ( not ( = ?auto_113521 ?auto_113519 ) ) ( not ( = ?auto_113520 ?auto_113519 ) ) ( not ( = ?auto_113522 ?auto_113519 ) ) ( ON ?auto_113516 ?auto_113515 ) ( ON-TABLE ?auto_113519 ) ( ON ?auto_113517 ?auto_113516 ) ( ON ?auto_113518 ?auto_113517 ) ( ON ?auto_113521 ?auto_113518 ) ( CLEAR ?auto_113520 ) ( ON ?auto_113522 ?auto_113521 ) ( CLEAR ?auto_113522 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_113519 ?auto_113515 ?auto_113516 ?auto_113517 ?auto_113518 ?auto_113521 )
      ( MAKE-4PILE ?auto_113515 ?auto_113516 ?auto_113517 ?auto_113518 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_113523 - BLOCK
      ?auto_113524 - BLOCK
      ?auto_113525 - BLOCK
      ?auto_113526 - BLOCK
    )
    :vars
    (
      ?auto_113529 - BLOCK
      ?auto_113527 - BLOCK
      ?auto_113530 - BLOCK
      ?auto_113528 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_113523 ?auto_113524 ) ) ( not ( = ?auto_113523 ?auto_113525 ) ) ( not ( = ?auto_113523 ?auto_113526 ) ) ( not ( = ?auto_113524 ?auto_113525 ) ) ( not ( = ?auto_113524 ?auto_113526 ) ) ( not ( = ?auto_113525 ?auto_113526 ) ) ( not ( = ?auto_113523 ?auto_113529 ) ) ( not ( = ?auto_113524 ?auto_113529 ) ) ( not ( = ?auto_113525 ?auto_113529 ) ) ( not ( = ?auto_113526 ?auto_113529 ) ) ( not ( = ?auto_113527 ?auto_113530 ) ) ( not ( = ?auto_113527 ?auto_113529 ) ) ( not ( = ?auto_113527 ?auto_113526 ) ) ( not ( = ?auto_113527 ?auto_113525 ) ) ( not ( = ?auto_113530 ?auto_113529 ) ) ( not ( = ?auto_113530 ?auto_113526 ) ) ( not ( = ?auto_113530 ?auto_113525 ) ) ( not ( = ?auto_113523 ?auto_113527 ) ) ( not ( = ?auto_113523 ?auto_113530 ) ) ( not ( = ?auto_113524 ?auto_113527 ) ) ( not ( = ?auto_113524 ?auto_113530 ) ) ( ON ?auto_113523 ?auto_113528 ) ( not ( = ?auto_113523 ?auto_113528 ) ) ( not ( = ?auto_113524 ?auto_113528 ) ) ( not ( = ?auto_113525 ?auto_113528 ) ) ( not ( = ?auto_113526 ?auto_113528 ) ) ( not ( = ?auto_113529 ?auto_113528 ) ) ( not ( = ?auto_113527 ?auto_113528 ) ) ( not ( = ?auto_113530 ?auto_113528 ) ) ( ON ?auto_113524 ?auto_113523 ) ( ON-TABLE ?auto_113528 ) ( ON ?auto_113525 ?auto_113524 ) ( ON ?auto_113526 ?auto_113525 ) ( ON ?auto_113529 ?auto_113526 ) ( ON ?auto_113530 ?auto_113529 ) ( CLEAR ?auto_113530 ) ( HOLDING ?auto_113527 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_113527 )
      ( MAKE-4PILE ?auto_113523 ?auto_113524 ?auto_113525 ?auto_113526 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_113531 - BLOCK
      ?auto_113532 - BLOCK
      ?auto_113533 - BLOCK
      ?auto_113534 - BLOCK
    )
    :vars
    (
      ?auto_113536 - BLOCK
      ?auto_113535 - BLOCK
      ?auto_113538 - BLOCK
      ?auto_113537 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_113531 ?auto_113532 ) ) ( not ( = ?auto_113531 ?auto_113533 ) ) ( not ( = ?auto_113531 ?auto_113534 ) ) ( not ( = ?auto_113532 ?auto_113533 ) ) ( not ( = ?auto_113532 ?auto_113534 ) ) ( not ( = ?auto_113533 ?auto_113534 ) ) ( not ( = ?auto_113531 ?auto_113536 ) ) ( not ( = ?auto_113532 ?auto_113536 ) ) ( not ( = ?auto_113533 ?auto_113536 ) ) ( not ( = ?auto_113534 ?auto_113536 ) ) ( not ( = ?auto_113535 ?auto_113538 ) ) ( not ( = ?auto_113535 ?auto_113536 ) ) ( not ( = ?auto_113535 ?auto_113534 ) ) ( not ( = ?auto_113535 ?auto_113533 ) ) ( not ( = ?auto_113538 ?auto_113536 ) ) ( not ( = ?auto_113538 ?auto_113534 ) ) ( not ( = ?auto_113538 ?auto_113533 ) ) ( not ( = ?auto_113531 ?auto_113535 ) ) ( not ( = ?auto_113531 ?auto_113538 ) ) ( not ( = ?auto_113532 ?auto_113535 ) ) ( not ( = ?auto_113532 ?auto_113538 ) ) ( ON ?auto_113531 ?auto_113537 ) ( not ( = ?auto_113531 ?auto_113537 ) ) ( not ( = ?auto_113532 ?auto_113537 ) ) ( not ( = ?auto_113533 ?auto_113537 ) ) ( not ( = ?auto_113534 ?auto_113537 ) ) ( not ( = ?auto_113536 ?auto_113537 ) ) ( not ( = ?auto_113535 ?auto_113537 ) ) ( not ( = ?auto_113538 ?auto_113537 ) ) ( ON ?auto_113532 ?auto_113531 ) ( ON-TABLE ?auto_113537 ) ( ON ?auto_113533 ?auto_113532 ) ( ON ?auto_113534 ?auto_113533 ) ( ON ?auto_113536 ?auto_113534 ) ( ON ?auto_113538 ?auto_113536 ) ( ON ?auto_113535 ?auto_113538 ) ( CLEAR ?auto_113535 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_113537 ?auto_113531 ?auto_113532 ?auto_113533 ?auto_113534 ?auto_113536 ?auto_113538 )
      ( MAKE-4PILE ?auto_113531 ?auto_113532 ?auto_113533 ?auto_113534 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_113554 - BLOCK
      ?auto_113555 - BLOCK
    )
    :vars
    (
      ?auto_113556 - BLOCK
      ?auto_113557 - BLOCK
      ?auto_113558 - BLOCK
      ?auto_113560 - BLOCK
      ?auto_113559 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113556 ?auto_113555 ) ( ON-TABLE ?auto_113554 ) ( ON ?auto_113555 ?auto_113554 ) ( not ( = ?auto_113554 ?auto_113555 ) ) ( not ( = ?auto_113554 ?auto_113556 ) ) ( not ( = ?auto_113555 ?auto_113556 ) ) ( not ( = ?auto_113554 ?auto_113557 ) ) ( not ( = ?auto_113554 ?auto_113558 ) ) ( not ( = ?auto_113555 ?auto_113557 ) ) ( not ( = ?auto_113555 ?auto_113558 ) ) ( not ( = ?auto_113556 ?auto_113557 ) ) ( not ( = ?auto_113556 ?auto_113558 ) ) ( not ( = ?auto_113557 ?auto_113558 ) ) ( ON ?auto_113557 ?auto_113556 ) ( CLEAR ?auto_113557 ) ( HOLDING ?auto_113558 ) ( CLEAR ?auto_113560 ) ( ON-TABLE ?auto_113559 ) ( ON ?auto_113560 ?auto_113559 ) ( not ( = ?auto_113559 ?auto_113560 ) ) ( not ( = ?auto_113559 ?auto_113558 ) ) ( not ( = ?auto_113560 ?auto_113558 ) ) ( not ( = ?auto_113554 ?auto_113560 ) ) ( not ( = ?auto_113554 ?auto_113559 ) ) ( not ( = ?auto_113555 ?auto_113560 ) ) ( not ( = ?auto_113555 ?auto_113559 ) ) ( not ( = ?auto_113556 ?auto_113560 ) ) ( not ( = ?auto_113556 ?auto_113559 ) ) ( not ( = ?auto_113557 ?auto_113560 ) ) ( not ( = ?auto_113557 ?auto_113559 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_113559 ?auto_113560 ?auto_113558 )
      ( MAKE-2PILE ?auto_113554 ?auto_113555 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_113561 - BLOCK
      ?auto_113562 - BLOCK
    )
    :vars
    (
      ?auto_113566 - BLOCK
      ?auto_113564 - BLOCK
      ?auto_113567 - BLOCK
      ?auto_113563 - BLOCK
      ?auto_113565 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113566 ?auto_113562 ) ( ON-TABLE ?auto_113561 ) ( ON ?auto_113562 ?auto_113561 ) ( not ( = ?auto_113561 ?auto_113562 ) ) ( not ( = ?auto_113561 ?auto_113566 ) ) ( not ( = ?auto_113562 ?auto_113566 ) ) ( not ( = ?auto_113561 ?auto_113564 ) ) ( not ( = ?auto_113561 ?auto_113567 ) ) ( not ( = ?auto_113562 ?auto_113564 ) ) ( not ( = ?auto_113562 ?auto_113567 ) ) ( not ( = ?auto_113566 ?auto_113564 ) ) ( not ( = ?auto_113566 ?auto_113567 ) ) ( not ( = ?auto_113564 ?auto_113567 ) ) ( ON ?auto_113564 ?auto_113566 ) ( CLEAR ?auto_113563 ) ( ON-TABLE ?auto_113565 ) ( ON ?auto_113563 ?auto_113565 ) ( not ( = ?auto_113565 ?auto_113563 ) ) ( not ( = ?auto_113565 ?auto_113567 ) ) ( not ( = ?auto_113563 ?auto_113567 ) ) ( not ( = ?auto_113561 ?auto_113563 ) ) ( not ( = ?auto_113561 ?auto_113565 ) ) ( not ( = ?auto_113562 ?auto_113563 ) ) ( not ( = ?auto_113562 ?auto_113565 ) ) ( not ( = ?auto_113566 ?auto_113563 ) ) ( not ( = ?auto_113566 ?auto_113565 ) ) ( not ( = ?auto_113564 ?auto_113563 ) ) ( not ( = ?auto_113564 ?auto_113565 ) ) ( ON ?auto_113567 ?auto_113564 ) ( CLEAR ?auto_113567 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_113561 ?auto_113562 ?auto_113566 ?auto_113564 )
      ( MAKE-2PILE ?auto_113561 ?auto_113562 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_113568 - BLOCK
      ?auto_113569 - BLOCK
    )
    :vars
    (
      ?auto_113572 - BLOCK
      ?auto_113573 - BLOCK
      ?auto_113574 - BLOCK
      ?auto_113570 - BLOCK
      ?auto_113571 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113572 ?auto_113569 ) ( ON-TABLE ?auto_113568 ) ( ON ?auto_113569 ?auto_113568 ) ( not ( = ?auto_113568 ?auto_113569 ) ) ( not ( = ?auto_113568 ?auto_113572 ) ) ( not ( = ?auto_113569 ?auto_113572 ) ) ( not ( = ?auto_113568 ?auto_113573 ) ) ( not ( = ?auto_113568 ?auto_113574 ) ) ( not ( = ?auto_113569 ?auto_113573 ) ) ( not ( = ?auto_113569 ?auto_113574 ) ) ( not ( = ?auto_113572 ?auto_113573 ) ) ( not ( = ?auto_113572 ?auto_113574 ) ) ( not ( = ?auto_113573 ?auto_113574 ) ) ( ON ?auto_113573 ?auto_113572 ) ( ON-TABLE ?auto_113570 ) ( not ( = ?auto_113570 ?auto_113571 ) ) ( not ( = ?auto_113570 ?auto_113574 ) ) ( not ( = ?auto_113571 ?auto_113574 ) ) ( not ( = ?auto_113568 ?auto_113571 ) ) ( not ( = ?auto_113568 ?auto_113570 ) ) ( not ( = ?auto_113569 ?auto_113571 ) ) ( not ( = ?auto_113569 ?auto_113570 ) ) ( not ( = ?auto_113572 ?auto_113571 ) ) ( not ( = ?auto_113572 ?auto_113570 ) ) ( not ( = ?auto_113573 ?auto_113571 ) ) ( not ( = ?auto_113573 ?auto_113570 ) ) ( ON ?auto_113574 ?auto_113573 ) ( CLEAR ?auto_113574 ) ( HOLDING ?auto_113571 ) ( CLEAR ?auto_113570 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_113570 ?auto_113571 )
      ( MAKE-2PILE ?auto_113568 ?auto_113569 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_113575 - BLOCK
      ?auto_113576 - BLOCK
    )
    :vars
    (
      ?auto_113578 - BLOCK
      ?auto_113577 - BLOCK
      ?auto_113579 - BLOCK
      ?auto_113581 - BLOCK
      ?auto_113580 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113578 ?auto_113576 ) ( ON-TABLE ?auto_113575 ) ( ON ?auto_113576 ?auto_113575 ) ( not ( = ?auto_113575 ?auto_113576 ) ) ( not ( = ?auto_113575 ?auto_113578 ) ) ( not ( = ?auto_113576 ?auto_113578 ) ) ( not ( = ?auto_113575 ?auto_113577 ) ) ( not ( = ?auto_113575 ?auto_113579 ) ) ( not ( = ?auto_113576 ?auto_113577 ) ) ( not ( = ?auto_113576 ?auto_113579 ) ) ( not ( = ?auto_113578 ?auto_113577 ) ) ( not ( = ?auto_113578 ?auto_113579 ) ) ( not ( = ?auto_113577 ?auto_113579 ) ) ( ON ?auto_113577 ?auto_113578 ) ( ON-TABLE ?auto_113581 ) ( not ( = ?auto_113581 ?auto_113580 ) ) ( not ( = ?auto_113581 ?auto_113579 ) ) ( not ( = ?auto_113580 ?auto_113579 ) ) ( not ( = ?auto_113575 ?auto_113580 ) ) ( not ( = ?auto_113575 ?auto_113581 ) ) ( not ( = ?auto_113576 ?auto_113580 ) ) ( not ( = ?auto_113576 ?auto_113581 ) ) ( not ( = ?auto_113578 ?auto_113580 ) ) ( not ( = ?auto_113578 ?auto_113581 ) ) ( not ( = ?auto_113577 ?auto_113580 ) ) ( not ( = ?auto_113577 ?auto_113581 ) ) ( ON ?auto_113579 ?auto_113577 ) ( CLEAR ?auto_113581 ) ( ON ?auto_113580 ?auto_113579 ) ( CLEAR ?auto_113580 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_113575 ?auto_113576 ?auto_113578 ?auto_113577 ?auto_113579 )
      ( MAKE-2PILE ?auto_113575 ?auto_113576 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_113582 - BLOCK
      ?auto_113583 - BLOCK
    )
    :vars
    (
      ?auto_113587 - BLOCK
      ?auto_113585 - BLOCK
      ?auto_113584 - BLOCK
      ?auto_113586 - BLOCK
      ?auto_113588 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113587 ?auto_113583 ) ( ON-TABLE ?auto_113582 ) ( ON ?auto_113583 ?auto_113582 ) ( not ( = ?auto_113582 ?auto_113583 ) ) ( not ( = ?auto_113582 ?auto_113587 ) ) ( not ( = ?auto_113583 ?auto_113587 ) ) ( not ( = ?auto_113582 ?auto_113585 ) ) ( not ( = ?auto_113582 ?auto_113584 ) ) ( not ( = ?auto_113583 ?auto_113585 ) ) ( not ( = ?auto_113583 ?auto_113584 ) ) ( not ( = ?auto_113587 ?auto_113585 ) ) ( not ( = ?auto_113587 ?auto_113584 ) ) ( not ( = ?auto_113585 ?auto_113584 ) ) ( ON ?auto_113585 ?auto_113587 ) ( not ( = ?auto_113586 ?auto_113588 ) ) ( not ( = ?auto_113586 ?auto_113584 ) ) ( not ( = ?auto_113588 ?auto_113584 ) ) ( not ( = ?auto_113582 ?auto_113588 ) ) ( not ( = ?auto_113582 ?auto_113586 ) ) ( not ( = ?auto_113583 ?auto_113588 ) ) ( not ( = ?auto_113583 ?auto_113586 ) ) ( not ( = ?auto_113587 ?auto_113588 ) ) ( not ( = ?auto_113587 ?auto_113586 ) ) ( not ( = ?auto_113585 ?auto_113588 ) ) ( not ( = ?auto_113585 ?auto_113586 ) ) ( ON ?auto_113584 ?auto_113585 ) ( ON ?auto_113588 ?auto_113584 ) ( CLEAR ?auto_113588 ) ( HOLDING ?auto_113586 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_113586 )
      ( MAKE-2PILE ?auto_113582 ?auto_113583 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_113598 - BLOCK
      ?auto_113599 - BLOCK
    )
    :vars
    (
      ?auto_113602 - BLOCK
      ?auto_113600 - BLOCK
      ?auto_113604 - BLOCK
      ?auto_113601 - BLOCK
      ?auto_113603 - BLOCK
      ?auto_113605 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113602 ?auto_113599 ) ( ON-TABLE ?auto_113598 ) ( ON ?auto_113599 ?auto_113598 ) ( not ( = ?auto_113598 ?auto_113599 ) ) ( not ( = ?auto_113598 ?auto_113602 ) ) ( not ( = ?auto_113599 ?auto_113602 ) ) ( not ( = ?auto_113598 ?auto_113600 ) ) ( not ( = ?auto_113598 ?auto_113604 ) ) ( not ( = ?auto_113599 ?auto_113600 ) ) ( not ( = ?auto_113599 ?auto_113604 ) ) ( not ( = ?auto_113602 ?auto_113600 ) ) ( not ( = ?auto_113602 ?auto_113604 ) ) ( not ( = ?auto_113600 ?auto_113604 ) ) ( ON ?auto_113600 ?auto_113602 ) ( not ( = ?auto_113601 ?auto_113603 ) ) ( not ( = ?auto_113601 ?auto_113604 ) ) ( not ( = ?auto_113603 ?auto_113604 ) ) ( not ( = ?auto_113598 ?auto_113603 ) ) ( not ( = ?auto_113598 ?auto_113601 ) ) ( not ( = ?auto_113599 ?auto_113603 ) ) ( not ( = ?auto_113599 ?auto_113601 ) ) ( not ( = ?auto_113602 ?auto_113603 ) ) ( not ( = ?auto_113602 ?auto_113601 ) ) ( not ( = ?auto_113600 ?auto_113603 ) ) ( not ( = ?auto_113600 ?auto_113601 ) ) ( ON ?auto_113604 ?auto_113600 ) ( ON ?auto_113603 ?auto_113604 ) ( CLEAR ?auto_113603 ) ( ON ?auto_113601 ?auto_113605 ) ( CLEAR ?auto_113601 ) ( HAND-EMPTY ) ( not ( = ?auto_113598 ?auto_113605 ) ) ( not ( = ?auto_113599 ?auto_113605 ) ) ( not ( = ?auto_113602 ?auto_113605 ) ) ( not ( = ?auto_113600 ?auto_113605 ) ) ( not ( = ?auto_113604 ?auto_113605 ) ) ( not ( = ?auto_113601 ?auto_113605 ) ) ( not ( = ?auto_113603 ?auto_113605 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_113601 ?auto_113605 )
      ( MAKE-2PILE ?auto_113598 ?auto_113599 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_113606 - BLOCK
      ?auto_113607 - BLOCK
    )
    :vars
    (
      ?auto_113613 - BLOCK
      ?auto_113611 - BLOCK
      ?auto_113608 - BLOCK
      ?auto_113610 - BLOCK
      ?auto_113609 - BLOCK
      ?auto_113612 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113613 ?auto_113607 ) ( ON-TABLE ?auto_113606 ) ( ON ?auto_113607 ?auto_113606 ) ( not ( = ?auto_113606 ?auto_113607 ) ) ( not ( = ?auto_113606 ?auto_113613 ) ) ( not ( = ?auto_113607 ?auto_113613 ) ) ( not ( = ?auto_113606 ?auto_113611 ) ) ( not ( = ?auto_113606 ?auto_113608 ) ) ( not ( = ?auto_113607 ?auto_113611 ) ) ( not ( = ?auto_113607 ?auto_113608 ) ) ( not ( = ?auto_113613 ?auto_113611 ) ) ( not ( = ?auto_113613 ?auto_113608 ) ) ( not ( = ?auto_113611 ?auto_113608 ) ) ( ON ?auto_113611 ?auto_113613 ) ( not ( = ?auto_113610 ?auto_113609 ) ) ( not ( = ?auto_113610 ?auto_113608 ) ) ( not ( = ?auto_113609 ?auto_113608 ) ) ( not ( = ?auto_113606 ?auto_113609 ) ) ( not ( = ?auto_113606 ?auto_113610 ) ) ( not ( = ?auto_113607 ?auto_113609 ) ) ( not ( = ?auto_113607 ?auto_113610 ) ) ( not ( = ?auto_113613 ?auto_113609 ) ) ( not ( = ?auto_113613 ?auto_113610 ) ) ( not ( = ?auto_113611 ?auto_113609 ) ) ( not ( = ?auto_113611 ?auto_113610 ) ) ( ON ?auto_113608 ?auto_113611 ) ( ON ?auto_113610 ?auto_113612 ) ( CLEAR ?auto_113610 ) ( not ( = ?auto_113606 ?auto_113612 ) ) ( not ( = ?auto_113607 ?auto_113612 ) ) ( not ( = ?auto_113613 ?auto_113612 ) ) ( not ( = ?auto_113611 ?auto_113612 ) ) ( not ( = ?auto_113608 ?auto_113612 ) ) ( not ( = ?auto_113610 ?auto_113612 ) ) ( not ( = ?auto_113609 ?auto_113612 ) ) ( HOLDING ?auto_113609 ) ( CLEAR ?auto_113608 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_113606 ?auto_113607 ?auto_113613 ?auto_113611 ?auto_113608 ?auto_113609 )
      ( MAKE-2PILE ?auto_113606 ?auto_113607 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_113614 - BLOCK
      ?auto_113615 - BLOCK
    )
    :vars
    (
      ?auto_113619 - BLOCK
      ?auto_113621 - BLOCK
      ?auto_113618 - BLOCK
      ?auto_113620 - BLOCK
      ?auto_113617 - BLOCK
      ?auto_113616 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113619 ?auto_113615 ) ( ON-TABLE ?auto_113614 ) ( ON ?auto_113615 ?auto_113614 ) ( not ( = ?auto_113614 ?auto_113615 ) ) ( not ( = ?auto_113614 ?auto_113619 ) ) ( not ( = ?auto_113615 ?auto_113619 ) ) ( not ( = ?auto_113614 ?auto_113621 ) ) ( not ( = ?auto_113614 ?auto_113618 ) ) ( not ( = ?auto_113615 ?auto_113621 ) ) ( not ( = ?auto_113615 ?auto_113618 ) ) ( not ( = ?auto_113619 ?auto_113621 ) ) ( not ( = ?auto_113619 ?auto_113618 ) ) ( not ( = ?auto_113621 ?auto_113618 ) ) ( ON ?auto_113621 ?auto_113619 ) ( not ( = ?auto_113620 ?auto_113617 ) ) ( not ( = ?auto_113620 ?auto_113618 ) ) ( not ( = ?auto_113617 ?auto_113618 ) ) ( not ( = ?auto_113614 ?auto_113617 ) ) ( not ( = ?auto_113614 ?auto_113620 ) ) ( not ( = ?auto_113615 ?auto_113617 ) ) ( not ( = ?auto_113615 ?auto_113620 ) ) ( not ( = ?auto_113619 ?auto_113617 ) ) ( not ( = ?auto_113619 ?auto_113620 ) ) ( not ( = ?auto_113621 ?auto_113617 ) ) ( not ( = ?auto_113621 ?auto_113620 ) ) ( ON ?auto_113618 ?auto_113621 ) ( ON ?auto_113620 ?auto_113616 ) ( not ( = ?auto_113614 ?auto_113616 ) ) ( not ( = ?auto_113615 ?auto_113616 ) ) ( not ( = ?auto_113619 ?auto_113616 ) ) ( not ( = ?auto_113621 ?auto_113616 ) ) ( not ( = ?auto_113618 ?auto_113616 ) ) ( not ( = ?auto_113620 ?auto_113616 ) ) ( not ( = ?auto_113617 ?auto_113616 ) ) ( CLEAR ?auto_113618 ) ( ON ?auto_113617 ?auto_113620 ) ( CLEAR ?auto_113617 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_113616 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_113616 ?auto_113620 )
      ( MAKE-2PILE ?auto_113614 ?auto_113615 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_113622 - BLOCK
      ?auto_113623 - BLOCK
    )
    :vars
    (
      ?auto_113628 - BLOCK
      ?auto_113624 - BLOCK
      ?auto_113627 - BLOCK
      ?auto_113629 - BLOCK
      ?auto_113626 - BLOCK
      ?auto_113625 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113628 ?auto_113623 ) ( ON-TABLE ?auto_113622 ) ( ON ?auto_113623 ?auto_113622 ) ( not ( = ?auto_113622 ?auto_113623 ) ) ( not ( = ?auto_113622 ?auto_113628 ) ) ( not ( = ?auto_113623 ?auto_113628 ) ) ( not ( = ?auto_113622 ?auto_113624 ) ) ( not ( = ?auto_113622 ?auto_113627 ) ) ( not ( = ?auto_113623 ?auto_113624 ) ) ( not ( = ?auto_113623 ?auto_113627 ) ) ( not ( = ?auto_113628 ?auto_113624 ) ) ( not ( = ?auto_113628 ?auto_113627 ) ) ( not ( = ?auto_113624 ?auto_113627 ) ) ( ON ?auto_113624 ?auto_113628 ) ( not ( = ?auto_113629 ?auto_113626 ) ) ( not ( = ?auto_113629 ?auto_113627 ) ) ( not ( = ?auto_113626 ?auto_113627 ) ) ( not ( = ?auto_113622 ?auto_113626 ) ) ( not ( = ?auto_113622 ?auto_113629 ) ) ( not ( = ?auto_113623 ?auto_113626 ) ) ( not ( = ?auto_113623 ?auto_113629 ) ) ( not ( = ?auto_113628 ?auto_113626 ) ) ( not ( = ?auto_113628 ?auto_113629 ) ) ( not ( = ?auto_113624 ?auto_113626 ) ) ( not ( = ?auto_113624 ?auto_113629 ) ) ( ON ?auto_113629 ?auto_113625 ) ( not ( = ?auto_113622 ?auto_113625 ) ) ( not ( = ?auto_113623 ?auto_113625 ) ) ( not ( = ?auto_113628 ?auto_113625 ) ) ( not ( = ?auto_113624 ?auto_113625 ) ) ( not ( = ?auto_113627 ?auto_113625 ) ) ( not ( = ?auto_113629 ?auto_113625 ) ) ( not ( = ?auto_113626 ?auto_113625 ) ) ( ON ?auto_113626 ?auto_113629 ) ( CLEAR ?auto_113626 ) ( ON-TABLE ?auto_113625 ) ( HOLDING ?auto_113627 ) ( CLEAR ?auto_113624 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_113622 ?auto_113623 ?auto_113628 ?auto_113624 ?auto_113627 )
      ( MAKE-2PILE ?auto_113622 ?auto_113623 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_113673 - BLOCK
      ?auto_113674 - BLOCK
      ?auto_113675 - BLOCK
      ?auto_113676 - BLOCK
      ?auto_113677 - BLOCK
    )
    :vars
    (
      ?auto_113678 - BLOCK
      ?auto_113679 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_113673 ) ( ON ?auto_113674 ?auto_113673 ) ( ON ?auto_113675 ?auto_113674 ) ( not ( = ?auto_113673 ?auto_113674 ) ) ( not ( = ?auto_113673 ?auto_113675 ) ) ( not ( = ?auto_113673 ?auto_113676 ) ) ( not ( = ?auto_113673 ?auto_113677 ) ) ( not ( = ?auto_113674 ?auto_113675 ) ) ( not ( = ?auto_113674 ?auto_113676 ) ) ( not ( = ?auto_113674 ?auto_113677 ) ) ( not ( = ?auto_113675 ?auto_113676 ) ) ( not ( = ?auto_113675 ?auto_113677 ) ) ( not ( = ?auto_113676 ?auto_113677 ) ) ( ON ?auto_113677 ?auto_113678 ) ( not ( = ?auto_113673 ?auto_113678 ) ) ( not ( = ?auto_113674 ?auto_113678 ) ) ( not ( = ?auto_113675 ?auto_113678 ) ) ( not ( = ?auto_113676 ?auto_113678 ) ) ( not ( = ?auto_113677 ?auto_113678 ) ) ( CLEAR ?auto_113675 ) ( ON ?auto_113676 ?auto_113677 ) ( CLEAR ?auto_113676 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_113679 ) ( ON ?auto_113678 ?auto_113679 ) ( not ( = ?auto_113679 ?auto_113678 ) ) ( not ( = ?auto_113679 ?auto_113677 ) ) ( not ( = ?auto_113679 ?auto_113676 ) ) ( not ( = ?auto_113673 ?auto_113679 ) ) ( not ( = ?auto_113674 ?auto_113679 ) ) ( not ( = ?auto_113675 ?auto_113679 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_113679 ?auto_113678 ?auto_113677 )
      ( MAKE-5PILE ?auto_113673 ?auto_113674 ?auto_113675 ?auto_113676 ?auto_113677 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_113680 - BLOCK
      ?auto_113681 - BLOCK
      ?auto_113682 - BLOCK
      ?auto_113683 - BLOCK
      ?auto_113684 - BLOCK
    )
    :vars
    (
      ?auto_113686 - BLOCK
      ?auto_113685 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_113680 ) ( ON ?auto_113681 ?auto_113680 ) ( not ( = ?auto_113680 ?auto_113681 ) ) ( not ( = ?auto_113680 ?auto_113682 ) ) ( not ( = ?auto_113680 ?auto_113683 ) ) ( not ( = ?auto_113680 ?auto_113684 ) ) ( not ( = ?auto_113681 ?auto_113682 ) ) ( not ( = ?auto_113681 ?auto_113683 ) ) ( not ( = ?auto_113681 ?auto_113684 ) ) ( not ( = ?auto_113682 ?auto_113683 ) ) ( not ( = ?auto_113682 ?auto_113684 ) ) ( not ( = ?auto_113683 ?auto_113684 ) ) ( ON ?auto_113684 ?auto_113686 ) ( not ( = ?auto_113680 ?auto_113686 ) ) ( not ( = ?auto_113681 ?auto_113686 ) ) ( not ( = ?auto_113682 ?auto_113686 ) ) ( not ( = ?auto_113683 ?auto_113686 ) ) ( not ( = ?auto_113684 ?auto_113686 ) ) ( ON ?auto_113683 ?auto_113684 ) ( CLEAR ?auto_113683 ) ( ON-TABLE ?auto_113685 ) ( ON ?auto_113686 ?auto_113685 ) ( not ( = ?auto_113685 ?auto_113686 ) ) ( not ( = ?auto_113685 ?auto_113684 ) ) ( not ( = ?auto_113685 ?auto_113683 ) ) ( not ( = ?auto_113680 ?auto_113685 ) ) ( not ( = ?auto_113681 ?auto_113685 ) ) ( not ( = ?auto_113682 ?auto_113685 ) ) ( HOLDING ?auto_113682 ) ( CLEAR ?auto_113681 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_113680 ?auto_113681 ?auto_113682 )
      ( MAKE-5PILE ?auto_113680 ?auto_113681 ?auto_113682 ?auto_113683 ?auto_113684 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_113687 - BLOCK
      ?auto_113688 - BLOCK
      ?auto_113689 - BLOCK
      ?auto_113690 - BLOCK
      ?auto_113691 - BLOCK
    )
    :vars
    (
      ?auto_113692 - BLOCK
      ?auto_113693 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_113687 ) ( ON ?auto_113688 ?auto_113687 ) ( not ( = ?auto_113687 ?auto_113688 ) ) ( not ( = ?auto_113687 ?auto_113689 ) ) ( not ( = ?auto_113687 ?auto_113690 ) ) ( not ( = ?auto_113687 ?auto_113691 ) ) ( not ( = ?auto_113688 ?auto_113689 ) ) ( not ( = ?auto_113688 ?auto_113690 ) ) ( not ( = ?auto_113688 ?auto_113691 ) ) ( not ( = ?auto_113689 ?auto_113690 ) ) ( not ( = ?auto_113689 ?auto_113691 ) ) ( not ( = ?auto_113690 ?auto_113691 ) ) ( ON ?auto_113691 ?auto_113692 ) ( not ( = ?auto_113687 ?auto_113692 ) ) ( not ( = ?auto_113688 ?auto_113692 ) ) ( not ( = ?auto_113689 ?auto_113692 ) ) ( not ( = ?auto_113690 ?auto_113692 ) ) ( not ( = ?auto_113691 ?auto_113692 ) ) ( ON ?auto_113690 ?auto_113691 ) ( ON-TABLE ?auto_113693 ) ( ON ?auto_113692 ?auto_113693 ) ( not ( = ?auto_113693 ?auto_113692 ) ) ( not ( = ?auto_113693 ?auto_113691 ) ) ( not ( = ?auto_113693 ?auto_113690 ) ) ( not ( = ?auto_113687 ?auto_113693 ) ) ( not ( = ?auto_113688 ?auto_113693 ) ) ( not ( = ?auto_113689 ?auto_113693 ) ) ( CLEAR ?auto_113688 ) ( ON ?auto_113689 ?auto_113690 ) ( CLEAR ?auto_113689 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_113693 ?auto_113692 ?auto_113691 ?auto_113690 )
      ( MAKE-5PILE ?auto_113687 ?auto_113688 ?auto_113689 ?auto_113690 ?auto_113691 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_113694 - BLOCK
      ?auto_113695 - BLOCK
      ?auto_113696 - BLOCK
      ?auto_113697 - BLOCK
      ?auto_113698 - BLOCK
    )
    :vars
    (
      ?auto_113699 - BLOCK
      ?auto_113700 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_113694 ) ( not ( = ?auto_113694 ?auto_113695 ) ) ( not ( = ?auto_113694 ?auto_113696 ) ) ( not ( = ?auto_113694 ?auto_113697 ) ) ( not ( = ?auto_113694 ?auto_113698 ) ) ( not ( = ?auto_113695 ?auto_113696 ) ) ( not ( = ?auto_113695 ?auto_113697 ) ) ( not ( = ?auto_113695 ?auto_113698 ) ) ( not ( = ?auto_113696 ?auto_113697 ) ) ( not ( = ?auto_113696 ?auto_113698 ) ) ( not ( = ?auto_113697 ?auto_113698 ) ) ( ON ?auto_113698 ?auto_113699 ) ( not ( = ?auto_113694 ?auto_113699 ) ) ( not ( = ?auto_113695 ?auto_113699 ) ) ( not ( = ?auto_113696 ?auto_113699 ) ) ( not ( = ?auto_113697 ?auto_113699 ) ) ( not ( = ?auto_113698 ?auto_113699 ) ) ( ON ?auto_113697 ?auto_113698 ) ( ON-TABLE ?auto_113700 ) ( ON ?auto_113699 ?auto_113700 ) ( not ( = ?auto_113700 ?auto_113699 ) ) ( not ( = ?auto_113700 ?auto_113698 ) ) ( not ( = ?auto_113700 ?auto_113697 ) ) ( not ( = ?auto_113694 ?auto_113700 ) ) ( not ( = ?auto_113695 ?auto_113700 ) ) ( not ( = ?auto_113696 ?auto_113700 ) ) ( ON ?auto_113696 ?auto_113697 ) ( CLEAR ?auto_113696 ) ( HOLDING ?auto_113695 ) ( CLEAR ?auto_113694 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_113694 ?auto_113695 )
      ( MAKE-5PILE ?auto_113694 ?auto_113695 ?auto_113696 ?auto_113697 ?auto_113698 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_113701 - BLOCK
      ?auto_113702 - BLOCK
      ?auto_113703 - BLOCK
      ?auto_113704 - BLOCK
      ?auto_113705 - BLOCK
    )
    :vars
    (
      ?auto_113706 - BLOCK
      ?auto_113707 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_113701 ) ( not ( = ?auto_113701 ?auto_113702 ) ) ( not ( = ?auto_113701 ?auto_113703 ) ) ( not ( = ?auto_113701 ?auto_113704 ) ) ( not ( = ?auto_113701 ?auto_113705 ) ) ( not ( = ?auto_113702 ?auto_113703 ) ) ( not ( = ?auto_113702 ?auto_113704 ) ) ( not ( = ?auto_113702 ?auto_113705 ) ) ( not ( = ?auto_113703 ?auto_113704 ) ) ( not ( = ?auto_113703 ?auto_113705 ) ) ( not ( = ?auto_113704 ?auto_113705 ) ) ( ON ?auto_113705 ?auto_113706 ) ( not ( = ?auto_113701 ?auto_113706 ) ) ( not ( = ?auto_113702 ?auto_113706 ) ) ( not ( = ?auto_113703 ?auto_113706 ) ) ( not ( = ?auto_113704 ?auto_113706 ) ) ( not ( = ?auto_113705 ?auto_113706 ) ) ( ON ?auto_113704 ?auto_113705 ) ( ON-TABLE ?auto_113707 ) ( ON ?auto_113706 ?auto_113707 ) ( not ( = ?auto_113707 ?auto_113706 ) ) ( not ( = ?auto_113707 ?auto_113705 ) ) ( not ( = ?auto_113707 ?auto_113704 ) ) ( not ( = ?auto_113701 ?auto_113707 ) ) ( not ( = ?auto_113702 ?auto_113707 ) ) ( not ( = ?auto_113703 ?auto_113707 ) ) ( ON ?auto_113703 ?auto_113704 ) ( CLEAR ?auto_113701 ) ( ON ?auto_113702 ?auto_113703 ) ( CLEAR ?auto_113702 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_113707 ?auto_113706 ?auto_113705 ?auto_113704 ?auto_113703 )
      ( MAKE-5PILE ?auto_113701 ?auto_113702 ?auto_113703 ?auto_113704 ?auto_113705 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_113708 - BLOCK
      ?auto_113709 - BLOCK
      ?auto_113710 - BLOCK
      ?auto_113711 - BLOCK
      ?auto_113712 - BLOCK
    )
    :vars
    (
      ?auto_113714 - BLOCK
      ?auto_113713 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_113708 ?auto_113709 ) ) ( not ( = ?auto_113708 ?auto_113710 ) ) ( not ( = ?auto_113708 ?auto_113711 ) ) ( not ( = ?auto_113708 ?auto_113712 ) ) ( not ( = ?auto_113709 ?auto_113710 ) ) ( not ( = ?auto_113709 ?auto_113711 ) ) ( not ( = ?auto_113709 ?auto_113712 ) ) ( not ( = ?auto_113710 ?auto_113711 ) ) ( not ( = ?auto_113710 ?auto_113712 ) ) ( not ( = ?auto_113711 ?auto_113712 ) ) ( ON ?auto_113712 ?auto_113714 ) ( not ( = ?auto_113708 ?auto_113714 ) ) ( not ( = ?auto_113709 ?auto_113714 ) ) ( not ( = ?auto_113710 ?auto_113714 ) ) ( not ( = ?auto_113711 ?auto_113714 ) ) ( not ( = ?auto_113712 ?auto_113714 ) ) ( ON ?auto_113711 ?auto_113712 ) ( ON-TABLE ?auto_113713 ) ( ON ?auto_113714 ?auto_113713 ) ( not ( = ?auto_113713 ?auto_113714 ) ) ( not ( = ?auto_113713 ?auto_113712 ) ) ( not ( = ?auto_113713 ?auto_113711 ) ) ( not ( = ?auto_113708 ?auto_113713 ) ) ( not ( = ?auto_113709 ?auto_113713 ) ) ( not ( = ?auto_113710 ?auto_113713 ) ) ( ON ?auto_113710 ?auto_113711 ) ( ON ?auto_113709 ?auto_113710 ) ( CLEAR ?auto_113709 ) ( HOLDING ?auto_113708 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_113708 )
      ( MAKE-5PILE ?auto_113708 ?auto_113709 ?auto_113710 ?auto_113711 ?auto_113712 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_113715 - BLOCK
      ?auto_113716 - BLOCK
      ?auto_113717 - BLOCK
      ?auto_113718 - BLOCK
      ?auto_113719 - BLOCK
    )
    :vars
    (
      ?auto_113720 - BLOCK
      ?auto_113721 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_113715 ?auto_113716 ) ) ( not ( = ?auto_113715 ?auto_113717 ) ) ( not ( = ?auto_113715 ?auto_113718 ) ) ( not ( = ?auto_113715 ?auto_113719 ) ) ( not ( = ?auto_113716 ?auto_113717 ) ) ( not ( = ?auto_113716 ?auto_113718 ) ) ( not ( = ?auto_113716 ?auto_113719 ) ) ( not ( = ?auto_113717 ?auto_113718 ) ) ( not ( = ?auto_113717 ?auto_113719 ) ) ( not ( = ?auto_113718 ?auto_113719 ) ) ( ON ?auto_113719 ?auto_113720 ) ( not ( = ?auto_113715 ?auto_113720 ) ) ( not ( = ?auto_113716 ?auto_113720 ) ) ( not ( = ?auto_113717 ?auto_113720 ) ) ( not ( = ?auto_113718 ?auto_113720 ) ) ( not ( = ?auto_113719 ?auto_113720 ) ) ( ON ?auto_113718 ?auto_113719 ) ( ON-TABLE ?auto_113721 ) ( ON ?auto_113720 ?auto_113721 ) ( not ( = ?auto_113721 ?auto_113720 ) ) ( not ( = ?auto_113721 ?auto_113719 ) ) ( not ( = ?auto_113721 ?auto_113718 ) ) ( not ( = ?auto_113715 ?auto_113721 ) ) ( not ( = ?auto_113716 ?auto_113721 ) ) ( not ( = ?auto_113717 ?auto_113721 ) ) ( ON ?auto_113717 ?auto_113718 ) ( ON ?auto_113716 ?auto_113717 ) ( ON ?auto_113715 ?auto_113716 ) ( CLEAR ?auto_113715 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_113721 ?auto_113720 ?auto_113719 ?auto_113718 ?auto_113717 ?auto_113716 )
      ( MAKE-5PILE ?auto_113715 ?auto_113716 ?auto_113717 ?auto_113718 ?auto_113719 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_113727 - BLOCK
      ?auto_113728 - BLOCK
      ?auto_113729 - BLOCK
      ?auto_113730 - BLOCK
      ?auto_113731 - BLOCK
    )
    :vars
    (
      ?auto_113732 - BLOCK
      ?auto_113733 - BLOCK
      ?auto_113734 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_113727 ?auto_113728 ) ) ( not ( = ?auto_113727 ?auto_113729 ) ) ( not ( = ?auto_113727 ?auto_113730 ) ) ( not ( = ?auto_113727 ?auto_113731 ) ) ( not ( = ?auto_113728 ?auto_113729 ) ) ( not ( = ?auto_113728 ?auto_113730 ) ) ( not ( = ?auto_113728 ?auto_113731 ) ) ( not ( = ?auto_113729 ?auto_113730 ) ) ( not ( = ?auto_113729 ?auto_113731 ) ) ( not ( = ?auto_113730 ?auto_113731 ) ) ( ON ?auto_113731 ?auto_113732 ) ( not ( = ?auto_113727 ?auto_113732 ) ) ( not ( = ?auto_113728 ?auto_113732 ) ) ( not ( = ?auto_113729 ?auto_113732 ) ) ( not ( = ?auto_113730 ?auto_113732 ) ) ( not ( = ?auto_113731 ?auto_113732 ) ) ( ON ?auto_113730 ?auto_113731 ) ( ON-TABLE ?auto_113733 ) ( ON ?auto_113732 ?auto_113733 ) ( not ( = ?auto_113733 ?auto_113732 ) ) ( not ( = ?auto_113733 ?auto_113731 ) ) ( not ( = ?auto_113733 ?auto_113730 ) ) ( not ( = ?auto_113727 ?auto_113733 ) ) ( not ( = ?auto_113728 ?auto_113733 ) ) ( not ( = ?auto_113729 ?auto_113733 ) ) ( ON ?auto_113729 ?auto_113730 ) ( ON ?auto_113728 ?auto_113729 ) ( CLEAR ?auto_113728 ) ( ON ?auto_113727 ?auto_113734 ) ( CLEAR ?auto_113727 ) ( HAND-EMPTY ) ( not ( = ?auto_113727 ?auto_113734 ) ) ( not ( = ?auto_113728 ?auto_113734 ) ) ( not ( = ?auto_113729 ?auto_113734 ) ) ( not ( = ?auto_113730 ?auto_113734 ) ) ( not ( = ?auto_113731 ?auto_113734 ) ) ( not ( = ?auto_113732 ?auto_113734 ) ) ( not ( = ?auto_113733 ?auto_113734 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_113727 ?auto_113734 )
      ( MAKE-5PILE ?auto_113727 ?auto_113728 ?auto_113729 ?auto_113730 ?auto_113731 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_113735 - BLOCK
      ?auto_113736 - BLOCK
      ?auto_113737 - BLOCK
      ?auto_113738 - BLOCK
      ?auto_113739 - BLOCK
    )
    :vars
    (
      ?auto_113742 - BLOCK
      ?auto_113741 - BLOCK
      ?auto_113740 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_113735 ?auto_113736 ) ) ( not ( = ?auto_113735 ?auto_113737 ) ) ( not ( = ?auto_113735 ?auto_113738 ) ) ( not ( = ?auto_113735 ?auto_113739 ) ) ( not ( = ?auto_113736 ?auto_113737 ) ) ( not ( = ?auto_113736 ?auto_113738 ) ) ( not ( = ?auto_113736 ?auto_113739 ) ) ( not ( = ?auto_113737 ?auto_113738 ) ) ( not ( = ?auto_113737 ?auto_113739 ) ) ( not ( = ?auto_113738 ?auto_113739 ) ) ( ON ?auto_113739 ?auto_113742 ) ( not ( = ?auto_113735 ?auto_113742 ) ) ( not ( = ?auto_113736 ?auto_113742 ) ) ( not ( = ?auto_113737 ?auto_113742 ) ) ( not ( = ?auto_113738 ?auto_113742 ) ) ( not ( = ?auto_113739 ?auto_113742 ) ) ( ON ?auto_113738 ?auto_113739 ) ( ON-TABLE ?auto_113741 ) ( ON ?auto_113742 ?auto_113741 ) ( not ( = ?auto_113741 ?auto_113742 ) ) ( not ( = ?auto_113741 ?auto_113739 ) ) ( not ( = ?auto_113741 ?auto_113738 ) ) ( not ( = ?auto_113735 ?auto_113741 ) ) ( not ( = ?auto_113736 ?auto_113741 ) ) ( not ( = ?auto_113737 ?auto_113741 ) ) ( ON ?auto_113737 ?auto_113738 ) ( ON ?auto_113735 ?auto_113740 ) ( CLEAR ?auto_113735 ) ( not ( = ?auto_113735 ?auto_113740 ) ) ( not ( = ?auto_113736 ?auto_113740 ) ) ( not ( = ?auto_113737 ?auto_113740 ) ) ( not ( = ?auto_113738 ?auto_113740 ) ) ( not ( = ?auto_113739 ?auto_113740 ) ) ( not ( = ?auto_113742 ?auto_113740 ) ) ( not ( = ?auto_113741 ?auto_113740 ) ) ( HOLDING ?auto_113736 ) ( CLEAR ?auto_113737 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_113741 ?auto_113742 ?auto_113739 ?auto_113738 ?auto_113737 ?auto_113736 )
      ( MAKE-5PILE ?auto_113735 ?auto_113736 ?auto_113737 ?auto_113738 ?auto_113739 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_113743 - BLOCK
      ?auto_113744 - BLOCK
      ?auto_113745 - BLOCK
      ?auto_113746 - BLOCK
      ?auto_113747 - BLOCK
    )
    :vars
    (
      ?auto_113750 - BLOCK
      ?auto_113748 - BLOCK
      ?auto_113749 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_113743 ?auto_113744 ) ) ( not ( = ?auto_113743 ?auto_113745 ) ) ( not ( = ?auto_113743 ?auto_113746 ) ) ( not ( = ?auto_113743 ?auto_113747 ) ) ( not ( = ?auto_113744 ?auto_113745 ) ) ( not ( = ?auto_113744 ?auto_113746 ) ) ( not ( = ?auto_113744 ?auto_113747 ) ) ( not ( = ?auto_113745 ?auto_113746 ) ) ( not ( = ?auto_113745 ?auto_113747 ) ) ( not ( = ?auto_113746 ?auto_113747 ) ) ( ON ?auto_113747 ?auto_113750 ) ( not ( = ?auto_113743 ?auto_113750 ) ) ( not ( = ?auto_113744 ?auto_113750 ) ) ( not ( = ?auto_113745 ?auto_113750 ) ) ( not ( = ?auto_113746 ?auto_113750 ) ) ( not ( = ?auto_113747 ?auto_113750 ) ) ( ON ?auto_113746 ?auto_113747 ) ( ON-TABLE ?auto_113748 ) ( ON ?auto_113750 ?auto_113748 ) ( not ( = ?auto_113748 ?auto_113750 ) ) ( not ( = ?auto_113748 ?auto_113747 ) ) ( not ( = ?auto_113748 ?auto_113746 ) ) ( not ( = ?auto_113743 ?auto_113748 ) ) ( not ( = ?auto_113744 ?auto_113748 ) ) ( not ( = ?auto_113745 ?auto_113748 ) ) ( ON ?auto_113745 ?auto_113746 ) ( ON ?auto_113743 ?auto_113749 ) ( not ( = ?auto_113743 ?auto_113749 ) ) ( not ( = ?auto_113744 ?auto_113749 ) ) ( not ( = ?auto_113745 ?auto_113749 ) ) ( not ( = ?auto_113746 ?auto_113749 ) ) ( not ( = ?auto_113747 ?auto_113749 ) ) ( not ( = ?auto_113750 ?auto_113749 ) ) ( not ( = ?auto_113748 ?auto_113749 ) ) ( CLEAR ?auto_113745 ) ( ON ?auto_113744 ?auto_113743 ) ( CLEAR ?auto_113744 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_113749 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_113749 ?auto_113743 )
      ( MAKE-5PILE ?auto_113743 ?auto_113744 ?auto_113745 ?auto_113746 ?auto_113747 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_113751 - BLOCK
      ?auto_113752 - BLOCK
      ?auto_113753 - BLOCK
      ?auto_113754 - BLOCK
      ?auto_113755 - BLOCK
    )
    :vars
    (
      ?auto_113756 - BLOCK
      ?auto_113757 - BLOCK
      ?auto_113758 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_113751 ?auto_113752 ) ) ( not ( = ?auto_113751 ?auto_113753 ) ) ( not ( = ?auto_113751 ?auto_113754 ) ) ( not ( = ?auto_113751 ?auto_113755 ) ) ( not ( = ?auto_113752 ?auto_113753 ) ) ( not ( = ?auto_113752 ?auto_113754 ) ) ( not ( = ?auto_113752 ?auto_113755 ) ) ( not ( = ?auto_113753 ?auto_113754 ) ) ( not ( = ?auto_113753 ?auto_113755 ) ) ( not ( = ?auto_113754 ?auto_113755 ) ) ( ON ?auto_113755 ?auto_113756 ) ( not ( = ?auto_113751 ?auto_113756 ) ) ( not ( = ?auto_113752 ?auto_113756 ) ) ( not ( = ?auto_113753 ?auto_113756 ) ) ( not ( = ?auto_113754 ?auto_113756 ) ) ( not ( = ?auto_113755 ?auto_113756 ) ) ( ON ?auto_113754 ?auto_113755 ) ( ON-TABLE ?auto_113757 ) ( ON ?auto_113756 ?auto_113757 ) ( not ( = ?auto_113757 ?auto_113756 ) ) ( not ( = ?auto_113757 ?auto_113755 ) ) ( not ( = ?auto_113757 ?auto_113754 ) ) ( not ( = ?auto_113751 ?auto_113757 ) ) ( not ( = ?auto_113752 ?auto_113757 ) ) ( not ( = ?auto_113753 ?auto_113757 ) ) ( ON ?auto_113751 ?auto_113758 ) ( not ( = ?auto_113751 ?auto_113758 ) ) ( not ( = ?auto_113752 ?auto_113758 ) ) ( not ( = ?auto_113753 ?auto_113758 ) ) ( not ( = ?auto_113754 ?auto_113758 ) ) ( not ( = ?auto_113755 ?auto_113758 ) ) ( not ( = ?auto_113756 ?auto_113758 ) ) ( not ( = ?auto_113757 ?auto_113758 ) ) ( ON ?auto_113752 ?auto_113751 ) ( CLEAR ?auto_113752 ) ( ON-TABLE ?auto_113758 ) ( HOLDING ?auto_113753 ) ( CLEAR ?auto_113754 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_113757 ?auto_113756 ?auto_113755 ?auto_113754 ?auto_113753 )
      ( MAKE-5PILE ?auto_113751 ?auto_113752 ?auto_113753 ?auto_113754 ?auto_113755 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_113759 - BLOCK
      ?auto_113760 - BLOCK
      ?auto_113761 - BLOCK
      ?auto_113762 - BLOCK
      ?auto_113763 - BLOCK
    )
    :vars
    (
      ?auto_113764 - BLOCK
      ?auto_113766 - BLOCK
      ?auto_113765 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_113759 ?auto_113760 ) ) ( not ( = ?auto_113759 ?auto_113761 ) ) ( not ( = ?auto_113759 ?auto_113762 ) ) ( not ( = ?auto_113759 ?auto_113763 ) ) ( not ( = ?auto_113760 ?auto_113761 ) ) ( not ( = ?auto_113760 ?auto_113762 ) ) ( not ( = ?auto_113760 ?auto_113763 ) ) ( not ( = ?auto_113761 ?auto_113762 ) ) ( not ( = ?auto_113761 ?auto_113763 ) ) ( not ( = ?auto_113762 ?auto_113763 ) ) ( ON ?auto_113763 ?auto_113764 ) ( not ( = ?auto_113759 ?auto_113764 ) ) ( not ( = ?auto_113760 ?auto_113764 ) ) ( not ( = ?auto_113761 ?auto_113764 ) ) ( not ( = ?auto_113762 ?auto_113764 ) ) ( not ( = ?auto_113763 ?auto_113764 ) ) ( ON ?auto_113762 ?auto_113763 ) ( ON-TABLE ?auto_113766 ) ( ON ?auto_113764 ?auto_113766 ) ( not ( = ?auto_113766 ?auto_113764 ) ) ( not ( = ?auto_113766 ?auto_113763 ) ) ( not ( = ?auto_113766 ?auto_113762 ) ) ( not ( = ?auto_113759 ?auto_113766 ) ) ( not ( = ?auto_113760 ?auto_113766 ) ) ( not ( = ?auto_113761 ?auto_113766 ) ) ( ON ?auto_113759 ?auto_113765 ) ( not ( = ?auto_113759 ?auto_113765 ) ) ( not ( = ?auto_113760 ?auto_113765 ) ) ( not ( = ?auto_113761 ?auto_113765 ) ) ( not ( = ?auto_113762 ?auto_113765 ) ) ( not ( = ?auto_113763 ?auto_113765 ) ) ( not ( = ?auto_113764 ?auto_113765 ) ) ( not ( = ?auto_113766 ?auto_113765 ) ) ( ON ?auto_113760 ?auto_113759 ) ( ON-TABLE ?auto_113765 ) ( CLEAR ?auto_113762 ) ( ON ?auto_113761 ?auto_113760 ) ( CLEAR ?auto_113761 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_113765 ?auto_113759 ?auto_113760 )
      ( MAKE-5PILE ?auto_113759 ?auto_113760 ?auto_113761 ?auto_113762 ?auto_113763 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_113767 - BLOCK
      ?auto_113768 - BLOCK
      ?auto_113769 - BLOCK
      ?auto_113770 - BLOCK
      ?auto_113771 - BLOCK
    )
    :vars
    (
      ?auto_113773 - BLOCK
      ?auto_113772 - BLOCK
      ?auto_113774 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_113767 ?auto_113768 ) ) ( not ( = ?auto_113767 ?auto_113769 ) ) ( not ( = ?auto_113767 ?auto_113770 ) ) ( not ( = ?auto_113767 ?auto_113771 ) ) ( not ( = ?auto_113768 ?auto_113769 ) ) ( not ( = ?auto_113768 ?auto_113770 ) ) ( not ( = ?auto_113768 ?auto_113771 ) ) ( not ( = ?auto_113769 ?auto_113770 ) ) ( not ( = ?auto_113769 ?auto_113771 ) ) ( not ( = ?auto_113770 ?auto_113771 ) ) ( ON ?auto_113771 ?auto_113773 ) ( not ( = ?auto_113767 ?auto_113773 ) ) ( not ( = ?auto_113768 ?auto_113773 ) ) ( not ( = ?auto_113769 ?auto_113773 ) ) ( not ( = ?auto_113770 ?auto_113773 ) ) ( not ( = ?auto_113771 ?auto_113773 ) ) ( ON-TABLE ?auto_113772 ) ( ON ?auto_113773 ?auto_113772 ) ( not ( = ?auto_113772 ?auto_113773 ) ) ( not ( = ?auto_113772 ?auto_113771 ) ) ( not ( = ?auto_113772 ?auto_113770 ) ) ( not ( = ?auto_113767 ?auto_113772 ) ) ( not ( = ?auto_113768 ?auto_113772 ) ) ( not ( = ?auto_113769 ?auto_113772 ) ) ( ON ?auto_113767 ?auto_113774 ) ( not ( = ?auto_113767 ?auto_113774 ) ) ( not ( = ?auto_113768 ?auto_113774 ) ) ( not ( = ?auto_113769 ?auto_113774 ) ) ( not ( = ?auto_113770 ?auto_113774 ) ) ( not ( = ?auto_113771 ?auto_113774 ) ) ( not ( = ?auto_113773 ?auto_113774 ) ) ( not ( = ?auto_113772 ?auto_113774 ) ) ( ON ?auto_113768 ?auto_113767 ) ( ON-TABLE ?auto_113774 ) ( ON ?auto_113769 ?auto_113768 ) ( CLEAR ?auto_113769 ) ( HOLDING ?auto_113770 ) ( CLEAR ?auto_113771 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_113772 ?auto_113773 ?auto_113771 ?auto_113770 )
      ( MAKE-5PILE ?auto_113767 ?auto_113768 ?auto_113769 ?auto_113770 ?auto_113771 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_113775 - BLOCK
      ?auto_113776 - BLOCK
      ?auto_113777 - BLOCK
      ?auto_113778 - BLOCK
      ?auto_113779 - BLOCK
    )
    :vars
    (
      ?auto_113782 - BLOCK
      ?auto_113781 - BLOCK
      ?auto_113780 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_113775 ?auto_113776 ) ) ( not ( = ?auto_113775 ?auto_113777 ) ) ( not ( = ?auto_113775 ?auto_113778 ) ) ( not ( = ?auto_113775 ?auto_113779 ) ) ( not ( = ?auto_113776 ?auto_113777 ) ) ( not ( = ?auto_113776 ?auto_113778 ) ) ( not ( = ?auto_113776 ?auto_113779 ) ) ( not ( = ?auto_113777 ?auto_113778 ) ) ( not ( = ?auto_113777 ?auto_113779 ) ) ( not ( = ?auto_113778 ?auto_113779 ) ) ( ON ?auto_113779 ?auto_113782 ) ( not ( = ?auto_113775 ?auto_113782 ) ) ( not ( = ?auto_113776 ?auto_113782 ) ) ( not ( = ?auto_113777 ?auto_113782 ) ) ( not ( = ?auto_113778 ?auto_113782 ) ) ( not ( = ?auto_113779 ?auto_113782 ) ) ( ON-TABLE ?auto_113781 ) ( ON ?auto_113782 ?auto_113781 ) ( not ( = ?auto_113781 ?auto_113782 ) ) ( not ( = ?auto_113781 ?auto_113779 ) ) ( not ( = ?auto_113781 ?auto_113778 ) ) ( not ( = ?auto_113775 ?auto_113781 ) ) ( not ( = ?auto_113776 ?auto_113781 ) ) ( not ( = ?auto_113777 ?auto_113781 ) ) ( ON ?auto_113775 ?auto_113780 ) ( not ( = ?auto_113775 ?auto_113780 ) ) ( not ( = ?auto_113776 ?auto_113780 ) ) ( not ( = ?auto_113777 ?auto_113780 ) ) ( not ( = ?auto_113778 ?auto_113780 ) ) ( not ( = ?auto_113779 ?auto_113780 ) ) ( not ( = ?auto_113782 ?auto_113780 ) ) ( not ( = ?auto_113781 ?auto_113780 ) ) ( ON ?auto_113776 ?auto_113775 ) ( ON-TABLE ?auto_113780 ) ( ON ?auto_113777 ?auto_113776 ) ( CLEAR ?auto_113779 ) ( ON ?auto_113778 ?auto_113777 ) ( CLEAR ?auto_113778 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_113780 ?auto_113775 ?auto_113776 ?auto_113777 )
      ( MAKE-5PILE ?auto_113775 ?auto_113776 ?auto_113777 ?auto_113778 ?auto_113779 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_113783 - BLOCK
      ?auto_113784 - BLOCK
      ?auto_113785 - BLOCK
      ?auto_113786 - BLOCK
      ?auto_113787 - BLOCK
    )
    :vars
    (
      ?auto_113790 - BLOCK
      ?auto_113789 - BLOCK
      ?auto_113788 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_113783 ?auto_113784 ) ) ( not ( = ?auto_113783 ?auto_113785 ) ) ( not ( = ?auto_113783 ?auto_113786 ) ) ( not ( = ?auto_113783 ?auto_113787 ) ) ( not ( = ?auto_113784 ?auto_113785 ) ) ( not ( = ?auto_113784 ?auto_113786 ) ) ( not ( = ?auto_113784 ?auto_113787 ) ) ( not ( = ?auto_113785 ?auto_113786 ) ) ( not ( = ?auto_113785 ?auto_113787 ) ) ( not ( = ?auto_113786 ?auto_113787 ) ) ( not ( = ?auto_113783 ?auto_113790 ) ) ( not ( = ?auto_113784 ?auto_113790 ) ) ( not ( = ?auto_113785 ?auto_113790 ) ) ( not ( = ?auto_113786 ?auto_113790 ) ) ( not ( = ?auto_113787 ?auto_113790 ) ) ( ON-TABLE ?auto_113789 ) ( ON ?auto_113790 ?auto_113789 ) ( not ( = ?auto_113789 ?auto_113790 ) ) ( not ( = ?auto_113789 ?auto_113787 ) ) ( not ( = ?auto_113789 ?auto_113786 ) ) ( not ( = ?auto_113783 ?auto_113789 ) ) ( not ( = ?auto_113784 ?auto_113789 ) ) ( not ( = ?auto_113785 ?auto_113789 ) ) ( ON ?auto_113783 ?auto_113788 ) ( not ( = ?auto_113783 ?auto_113788 ) ) ( not ( = ?auto_113784 ?auto_113788 ) ) ( not ( = ?auto_113785 ?auto_113788 ) ) ( not ( = ?auto_113786 ?auto_113788 ) ) ( not ( = ?auto_113787 ?auto_113788 ) ) ( not ( = ?auto_113790 ?auto_113788 ) ) ( not ( = ?auto_113789 ?auto_113788 ) ) ( ON ?auto_113784 ?auto_113783 ) ( ON-TABLE ?auto_113788 ) ( ON ?auto_113785 ?auto_113784 ) ( ON ?auto_113786 ?auto_113785 ) ( CLEAR ?auto_113786 ) ( HOLDING ?auto_113787 ) ( CLEAR ?auto_113790 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_113789 ?auto_113790 ?auto_113787 )
      ( MAKE-5PILE ?auto_113783 ?auto_113784 ?auto_113785 ?auto_113786 ?auto_113787 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_113791 - BLOCK
      ?auto_113792 - BLOCK
      ?auto_113793 - BLOCK
      ?auto_113794 - BLOCK
      ?auto_113795 - BLOCK
    )
    :vars
    (
      ?auto_113798 - BLOCK
      ?auto_113796 - BLOCK
      ?auto_113797 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_113791 ?auto_113792 ) ) ( not ( = ?auto_113791 ?auto_113793 ) ) ( not ( = ?auto_113791 ?auto_113794 ) ) ( not ( = ?auto_113791 ?auto_113795 ) ) ( not ( = ?auto_113792 ?auto_113793 ) ) ( not ( = ?auto_113792 ?auto_113794 ) ) ( not ( = ?auto_113792 ?auto_113795 ) ) ( not ( = ?auto_113793 ?auto_113794 ) ) ( not ( = ?auto_113793 ?auto_113795 ) ) ( not ( = ?auto_113794 ?auto_113795 ) ) ( not ( = ?auto_113791 ?auto_113798 ) ) ( not ( = ?auto_113792 ?auto_113798 ) ) ( not ( = ?auto_113793 ?auto_113798 ) ) ( not ( = ?auto_113794 ?auto_113798 ) ) ( not ( = ?auto_113795 ?auto_113798 ) ) ( ON-TABLE ?auto_113796 ) ( ON ?auto_113798 ?auto_113796 ) ( not ( = ?auto_113796 ?auto_113798 ) ) ( not ( = ?auto_113796 ?auto_113795 ) ) ( not ( = ?auto_113796 ?auto_113794 ) ) ( not ( = ?auto_113791 ?auto_113796 ) ) ( not ( = ?auto_113792 ?auto_113796 ) ) ( not ( = ?auto_113793 ?auto_113796 ) ) ( ON ?auto_113791 ?auto_113797 ) ( not ( = ?auto_113791 ?auto_113797 ) ) ( not ( = ?auto_113792 ?auto_113797 ) ) ( not ( = ?auto_113793 ?auto_113797 ) ) ( not ( = ?auto_113794 ?auto_113797 ) ) ( not ( = ?auto_113795 ?auto_113797 ) ) ( not ( = ?auto_113798 ?auto_113797 ) ) ( not ( = ?auto_113796 ?auto_113797 ) ) ( ON ?auto_113792 ?auto_113791 ) ( ON-TABLE ?auto_113797 ) ( ON ?auto_113793 ?auto_113792 ) ( ON ?auto_113794 ?auto_113793 ) ( CLEAR ?auto_113798 ) ( ON ?auto_113795 ?auto_113794 ) ( CLEAR ?auto_113795 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_113797 ?auto_113791 ?auto_113792 ?auto_113793 ?auto_113794 )
      ( MAKE-5PILE ?auto_113791 ?auto_113792 ?auto_113793 ?auto_113794 ?auto_113795 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_113799 - BLOCK
      ?auto_113800 - BLOCK
      ?auto_113801 - BLOCK
      ?auto_113802 - BLOCK
      ?auto_113803 - BLOCK
    )
    :vars
    (
      ?auto_113805 - BLOCK
      ?auto_113804 - BLOCK
      ?auto_113806 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_113799 ?auto_113800 ) ) ( not ( = ?auto_113799 ?auto_113801 ) ) ( not ( = ?auto_113799 ?auto_113802 ) ) ( not ( = ?auto_113799 ?auto_113803 ) ) ( not ( = ?auto_113800 ?auto_113801 ) ) ( not ( = ?auto_113800 ?auto_113802 ) ) ( not ( = ?auto_113800 ?auto_113803 ) ) ( not ( = ?auto_113801 ?auto_113802 ) ) ( not ( = ?auto_113801 ?auto_113803 ) ) ( not ( = ?auto_113802 ?auto_113803 ) ) ( not ( = ?auto_113799 ?auto_113805 ) ) ( not ( = ?auto_113800 ?auto_113805 ) ) ( not ( = ?auto_113801 ?auto_113805 ) ) ( not ( = ?auto_113802 ?auto_113805 ) ) ( not ( = ?auto_113803 ?auto_113805 ) ) ( ON-TABLE ?auto_113804 ) ( not ( = ?auto_113804 ?auto_113805 ) ) ( not ( = ?auto_113804 ?auto_113803 ) ) ( not ( = ?auto_113804 ?auto_113802 ) ) ( not ( = ?auto_113799 ?auto_113804 ) ) ( not ( = ?auto_113800 ?auto_113804 ) ) ( not ( = ?auto_113801 ?auto_113804 ) ) ( ON ?auto_113799 ?auto_113806 ) ( not ( = ?auto_113799 ?auto_113806 ) ) ( not ( = ?auto_113800 ?auto_113806 ) ) ( not ( = ?auto_113801 ?auto_113806 ) ) ( not ( = ?auto_113802 ?auto_113806 ) ) ( not ( = ?auto_113803 ?auto_113806 ) ) ( not ( = ?auto_113805 ?auto_113806 ) ) ( not ( = ?auto_113804 ?auto_113806 ) ) ( ON ?auto_113800 ?auto_113799 ) ( ON-TABLE ?auto_113806 ) ( ON ?auto_113801 ?auto_113800 ) ( ON ?auto_113802 ?auto_113801 ) ( ON ?auto_113803 ?auto_113802 ) ( CLEAR ?auto_113803 ) ( HOLDING ?auto_113805 ) ( CLEAR ?auto_113804 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_113804 ?auto_113805 )
      ( MAKE-5PILE ?auto_113799 ?auto_113800 ?auto_113801 ?auto_113802 ?auto_113803 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_113807 - BLOCK
      ?auto_113808 - BLOCK
      ?auto_113809 - BLOCK
      ?auto_113810 - BLOCK
      ?auto_113811 - BLOCK
    )
    :vars
    (
      ?auto_113814 - BLOCK
      ?auto_113812 - BLOCK
      ?auto_113813 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_113807 ?auto_113808 ) ) ( not ( = ?auto_113807 ?auto_113809 ) ) ( not ( = ?auto_113807 ?auto_113810 ) ) ( not ( = ?auto_113807 ?auto_113811 ) ) ( not ( = ?auto_113808 ?auto_113809 ) ) ( not ( = ?auto_113808 ?auto_113810 ) ) ( not ( = ?auto_113808 ?auto_113811 ) ) ( not ( = ?auto_113809 ?auto_113810 ) ) ( not ( = ?auto_113809 ?auto_113811 ) ) ( not ( = ?auto_113810 ?auto_113811 ) ) ( not ( = ?auto_113807 ?auto_113814 ) ) ( not ( = ?auto_113808 ?auto_113814 ) ) ( not ( = ?auto_113809 ?auto_113814 ) ) ( not ( = ?auto_113810 ?auto_113814 ) ) ( not ( = ?auto_113811 ?auto_113814 ) ) ( ON-TABLE ?auto_113812 ) ( not ( = ?auto_113812 ?auto_113814 ) ) ( not ( = ?auto_113812 ?auto_113811 ) ) ( not ( = ?auto_113812 ?auto_113810 ) ) ( not ( = ?auto_113807 ?auto_113812 ) ) ( not ( = ?auto_113808 ?auto_113812 ) ) ( not ( = ?auto_113809 ?auto_113812 ) ) ( ON ?auto_113807 ?auto_113813 ) ( not ( = ?auto_113807 ?auto_113813 ) ) ( not ( = ?auto_113808 ?auto_113813 ) ) ( not ( = ?auto_113809 ?auto_113813 ) ) ( not ( = ?auto_113810 ?auto_113813 ) ) ( not ( = ?auto_113811 ?auto_113813 ) ) ( not ( = ?auto_113814 ?auto_113813 ) ) ( not ( = ?auto_113812 ?auto_113813 ) ) ( ON ?auto_113808 ?auto_113807 ) ( ON-TABLE ?auto_113813 ) ( ON ?auto_113809 ?auto_113808 ) ( ON ?auto_113810 ?auto_113809 ) ( ON ?auto_113811 ?auto_113810 ) ( CLEAR ?auto_113812 ) ( ON ?auto_113814 ?auto_113811 ) ( CLEAR ?auto_113814 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_113813 ?auto_113807 ?auto_113808 ?auto_113809 ?auto_113810 ?auto_113811 )
      ( MAKE-5PILE ?auto_113807 ?auto_113808 ?auto_113809 ?auto_113810 ?auto_113811 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_113815 - BLOCK
      ?auto_113816 - BLOCK
      ?auto_113817 - BLOCK
      ?auto_113818 - BLOCK
      ?auto_113819 - BLOCK
    )
    :vars
    (
      ?auto_113821 - BLOCK
      ?auto_113822 - BLOCK
      ?auto_113820 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_113815 ?auto_113816 ) ) ( not ( = ?auto_113815 ?auto_113817 ) ) ( not ( = ?auto_113815 ?auto_113818 ) ) ( not ( = ?auto_113815 ?auto_113819 ) ) ( not ( = ?auto_113816 ?auto_113817 ) ) ( not ( = ?auto_113816 ?auto_113818 ) ) ( not ( = ?auto_113816 ?auto_113819 ) ) ( not ( = ?auto_113817 ?auto_113818 ) ) ( not ( = ?auto_113817 ?auto_113819 ) ) ( not ( = ?auto_113818 ?auto_113819 ) ) ( not ( = ?auto_113815 ?auto_113821 ) ) ( not ( = ?auto_113816 ?auto_113821 ) ) ( not ( = ?auto_113817 ?auto_113821 ) ) ( not ( = ?auto_113818 ?auto_113821 ) ) ( not ( = ?auto_113819 ?auto_113821 ) ) ( not ( = ?auto_113822 ?auto_113821 ) ) ( not ( = ?auto_113822 ?auto_113819 ) ) ( not ( = ?auto_113822 ?auto_113818 ) ) ( not ( = ?auto_113815 ?auto_113822 ) ) ( not ( = ?auto_113816 ?auto_113822 ) ) ( not ( = ?auto_113817 ?auto_113822 ) ) ( ON ?auto_113815 ?auto_113820 ) ( not ( = ?auto_113815 ?auto_113820 ) ) ( not ( = ?auto_113816 ?auto_113820 ) ) ( not ( = ?auto_113817 ?auto_113820 ) ) ( not ( = ?auto_113818 ?auto_113820 ) ) ( not ( = ?auto_113819 ?auto_113820 ) ) ( not ( = ?auto_113821 ?auto_113820 ) ) ( not ( = ?auto_113822 ?auto_113820 ) ) ( ON ?auto_113816 ?auto_113815 ) ( ON-TABLE ?auto_113820 ) ( ON ?auto_113817 ?auto_113816 ) ( ON ?auto_113818 ?auto_113817 ) ( ON ?auto_113819 ?auto_113818 ) ( ON ?auto_113821 ?auto_113819 ) ( CLEAR ?auto_113821 ) ( HOLDING ?auto_113822 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_113822 )
      ( MAKE-5PILE ?auto_113815 ?auto_113816 ?auto_113817 ?auto_113818 ?auto_113819 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_113823 - BLOCK
      ?auto_113824 - BLOCK
      ?auto_113825 - BLOCK
      ?auto_113826 - BLOCK
      ?auto_113827 - BLOCK
    )
    :vars
    (
      ?auto_113829 - BLOCK
      ?auto_113830 - BLOCK
      ?auto_113828 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_113823 ?auto_113824 ) ) ( not ( = ?auto_113823 ?auto_113825 ) ) ( not ( = ?auto_113823 ?auto_113826 ) ) ( not ( = ?auto_113823 ?auto_113827 ) ) ( not ( = ?auto_113824 ?auto_113825 ) ) ( not ( = ?auto_113824 ?auto_113826 ) ) ( not ( = ?auto_113824 ?auto_113827 ) ) ( not ( = ?auto_113825 ?auto_113826 ) ) ( not ( = ?auto_113825 ?auto_113827 ) ) ( not ( = ?auto_113826 ?auto_113827 ) ) ( not ( = ?auto_113823 ?auto_113829 ) ) ( not ( = ?auto_113824 ?auto_113829 ) ) ( not ( = ?auto_113825 ?auto_113829 ) ) ( not ( = ?auto_113826 ?auto_113829 ) ) ( not ( = ?auto_113827 ?auto_113829 ) ) ( not ( = ?auto_113830 ?auto_113829 ) ) ( not ( = ?auto_113830 ?auto_113827 ) ) ( not ( = ?auto_113830 ?auto_113826 ) ) ( not ( = ?auto_113823 ?auto_113830 ) ) ( not ( = ?auto_113824 ?auto_113830 ) ) ( not ( = ?auto_113825 ?auto_113830 ) ) ( ON ?auto_113823 ?auto_113828 ) ( not ( = ?auto_113823 ?auto_113828 ) ) ( not ( = ?auto_113824 ?auto_113828 ) ) ( not ( = ?auto_113825 ?auto_113828 ) ) ( not ( = ?auto_113826 ?auto_113828 ) ) ( not ( = ?auto_113827 ?auto_113828 ) ) ( not ( = ?auto_113829 ?auto_113828 ) ) ( not ( = ?auto_113830 ?auto_113828 ) ) ( ON ?auto_113824 ?auto_113823 ) ( ON-TABLE ?auto_113828 ) ( ON ?auto_113825 ?auto_113824 ) ( ON ?auto_113826 ?auto_113825 ) ( ON ?auto_113827 ?auto_113826 ) ( ON ?auto_113829 ?auto_113827 ) ( ON ?auto_113830 ?auto_113829 ) ( CLEAR ?auto_113830 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_113828 ?auto_113823 ?auto_113824 ?auto_113825 ?auto_113826 ?auto_113827 ?auto_113829 )
      ( MAKE-5PILE ?auto_113823 ?auto_113824 ?auto_113825 ?auto_113826 ?auto_113827 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_113842 - BLOCK
    )
    :vars
    (
      ?auto_113844 - BLOCK
      ?auto_113843 - BLOCK
      ?auto_113845 - BLOCK
      ?auto_113848 - BLOCK
      ?auto_113847 - BLOCK
      ?auto_113846 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113844 ?auto_113842 ) ( ON-TABLE ?auto_113842 ) ( not ( = ?auto_113842 ?auto_113844 ) ) ( not ( = ?auto_113842 ?auto_113843 ) ) ( not ( = ?auto_113842 ?auto_113845 ) ) ( not ( = ?auto_113844 ?auto_113843 ) ) ( not ( = ?auto_113844 ?auto_113845 ) ) ( not ( = ?auto_113843 ?auto_113845 ) ) ( ON ?auto_113843 ?auto_113844 ) ( CLEAR ?auto_113843 ) ( HOLDING ?auto_113845 ) ( CLEAR ?auto_113848 ) ( ON-TABLE ?auto_113847 ) ( ON ?auto_113846 ?auto_113847 ) ( ON ?auto_113848 ?auto_113846 ) ( not ( = ?auto_113847 ?auto_113846 ) ) ( not ( = ?auto_113847 ?auto_113848 ) ) ( not ( = ?auto_113847 ?auto_113845 ) ) ( not ( = ?auto_113846 ?auto_113848 ) ) ( not ( = ?auto_113846 ?auto_113845 ) ) ( not ( = ?auto_113848 ?auto_113845 ) ) ( not ( = ?auto_113842 ?auto_113848 ) ) ( not ( = ?auto_113842 ?auto_113847 ) ) ( not ( = ?auto_113842 ?auto_113846 ) ) ( not ( = ?auto_113844 ?auto_113848 ) ) ( not ( = ?auto_113844 ?auto_113847 ) ) ( not ( = ?auto_113844 ?auto_113846 ) ) ( not ( = ?auto_113843 ?auto_113848 ) ) ( not ( = ?auto_113843 ?auto_113847 ) ) ( not ( = ?auto_113843 ?auto_113846 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_113847 ?auto_113846 ?auto_113848 ?auto_113845 )
      ( MAKE-1PILE ?auto_113842 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_113849 - BLOCK
    )
    :vars
    (
      ?auto_113854 - BLOCK
      ?auto_113853 - BLOCK
      ?auto_113855 - BLOCK
      ?auto_113852 - BLOCK
      ?auto_113851 - BLOCK
      ?auto_113850 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113854 ?auto_113849 ) ( ON-TABLE ?auto_113849 ) ( not ( = ?auto_113849 ?auto_113854 ) ) ( not ( = ?auto_113849 ?auto_113853 ) ) ( not ( = ?auto_113849 ?auto_113855 ) ) ( not ( = ?auto_113854 ?auto_113853 ) ) ( not ( = ?auto_113854 ?auto_113855 ) ) ( not ( = ?auto_113853 ?auto_113855 ) ) ( ON ?auto_113853 ?auto_113854 ) ( CLEAR ?auto_113852 ) ( ON-TABLE ?auto_113851 ) ( ON ?auto_113850 ?auto_113851 ) ( ON ?auto_113852 ?auto_113850 ) ( not ( = ?auto_113851 ?auto_113850 ) ) ( not ( = ?auto_113851 ?auto_113852 ) ) ( not ( = ?auto_113851 ?auto_113855 ) ) ( not ( = ?auto_113850 ?auto_113852 ) ) ( not ( = ?auto_113850 ?auto_113855 ) ) ( not ( = ?auto_113852 ?auto_113855 ) ) ( not ( = ?auto_113849 ?auto_113852 ) ) ( not ( = ?auto_113849 ?auto_113851 ) ) ( not ( = ?auto_113849 ?auto_113850 ) ) ( not ( = ?auto_113854 ?auto_113852 ) ) ( not ( = ?auto_113854 ?auto_113851 ) ) ( not ( = ?auto_113854 ?auto_113850 ) ) ( not ( = ?auto_113853 ?auto_113852 ) ) ( not ( = ?auto_113853 ?auto_113851 ) ) ( not ( = ?auto_113853 ?auto_113850 ) ) ( ON ?auto_113855 ?auto_113853 ) ( CLEAR ?auto_113855 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_113849 ?auto_113854 ?auto_113853 )
      ( MAKE-1PILE ?auto_113849 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_113856 - BLOCK
    )
    :vars
    (
      ?auto_113860 - BLOCK
      ?auto_113859 - BLOCK
      ?auto_113862 - BLOCK
      ?auto_113858 - BLOCK
      ?auto_113861 - BLOCK
      ?auto_113857 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113860 ?auto_113856 ) ( ON-TABLE ?auto_113856 ) ( not ( = ?auto_113856 ?auto_113860 ) ) ( not ( = ?auto_113856 ?auto_113859 ) ) ( not ( = ?auto_113856 ?auto_113862 ) ) ( not ( = ?auto_113860 ?auto_113859 ) ) ( not ( = ?auto_113860 ?auto_113862 ) ) ( not ( = ?auto_113859 ?auto_113862 ) ) ( ON ?auto_113859 ?auto_113860 ) ( ON-TABLE ?auto_113858 ) ( ON ?auto_113861 ?auto_113858 ) ( not ( = ?auto_113858 ?auto_113861 ) ) ( not ( = ?auto_113858 ?auto_113857 ) ) ( not ( = ?auto_113858 ?auto_113862 ) ) ( not ( = ?auto_113861 ?auto_113857 ) ) ( not ( = ?auto_113861 ?auto_113862 ) ) ( not ( = ?auto_113857 ?auto_113862 ) ) ( not ( = ?auto_113856 ?auto_113857 ) ) ( not ( = ?auto_113856 ?auto_113858 ) ) ( not ( = ?auto_113856 ?auto_113861 ) ) ( not ( = ?auto_113860 ?auto_113857 ) ) ( not ( = ?auto_113860 ?auto_113858 ) ) ( not ( = ?auto_113860 ?auto_113861 ) ) ( not ( = ?auto_113859 ?auto_113857 ) ) ( not ( = ?auto_113859 ?auto_113858 ) ) ( not ( = ?auto_113859 ?auto_113861 ) ) ( ON ?auto_113862 ?auto_113859 ) ( CLEAR ?auto_113862 ) ( HOLDING ?auto_113857 ) ( CLEAR ?auto_113861 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_113858 ?auto_113861 ?auto_113857 )
      ( MAKE-1PILE ?auto_113856 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_113863 - BLOCK
    )
    :vars
    (
      ?auto_113868 - BLOCK
      ?auto_113864 - BLOCK
      ?auto_113867 - BLOCK
      ?auto_113869 - BLOCK
      ?auto_113866 - BLOCK
      ?auto_113865 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113868 ?auto_113863 ) ( ON-TABLE ?auto_113863 ) ( not ( = ?auto_113863 ?auto_113868 ) ) ( not ( = ?auto_113863 ?auto_113864 ) ) ( not ( = ?auto_113863 ?auto_113867 ) ) ( not ( = ?auto_113868 ?auto_113864 ) ) ( not ( = ?auto_113868 ?auto_113867 ) ) ( not ( = ?auto_113864 ?auto_113867 ) ) ( ON ?auto_113864 ?auto_113868 ) ( ON-TABLE ?auto_113869 ) ( ON ?auto_113866 ?auto_113869 ) ( not ( = ?auto_113869 ?auto_113866 ) ) ( not ( = ?auto_113869 ?auto_113865 ) ) ( not ( = ?auto_113869 ?auto_113867 ) ) ( not ( = ?auto_113866 ?auto_113865 ) ) ( not ( = ?auto_113866 ?auto_113867 ) ) ( not ( = ?auto_113865 ?auto_113867 ) ) ( not ( = ?auto_113863 ?auto_113865 ) ) ( not ( = ?auto_113863 ?auto_113869 ) ) ( not ( = ?auto_113863 ?auto_113866 ) ) ( not ( = ?auto_113868 ?auto_113865 ) ) ( not ( = ?auto_113868 ?auto_113869 ) ) ( not ( = ?auto_113868 ?auto_113866 ) ) ( not ( = ?auto_113864 ?auto_113865 ) ) ( not ( = ?auto_113864 ?auto_113869 ) ) ( not ( = ?auto_113864 ?auto_113866 ) ) ( ON ?auto_113867 ?auto_113864 ) ( CLEAR ?auto_113866 ) ( ON ?auto_113865 ?auto_113867 ) ( CLEAR ?auto_113865 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_113863 ?auto_113868 ?auto_113864 ?auto_113867 )
      ( MAKE-1PILE ?auto_113863 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_113870 - BLOCK
    )
    :vars
    (
      ?auto_113873 - BLOCK
      ?auto_113874 - BLOCK
      ?auto_113872 - BLOCK
      ?auto_113876 - BLOCK
      ?auto_113871 - BLOCK
      ?auto_113875 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113873 ?auto_113870 ) ( ON-TABLE ?auto_113870 ) ( not ( = ?auto_113870 ?auto_113873 ) ) ( not ( = ?auto_113870 ?auto_113874 ) ) ( not ( = ?auto_113870 ?auto_113872 ) ) ( not ( = ?auto_113873 ?auto_113874 ) ) ( not ( = ?auto_113873 ?auto_113872 ) ) ( not ( = ?auto_113874 ?auto_113872 ) ) ( ON ?auto_113874 ?auto_113873 ) ( ON-TABLE ?auto_113876 ) ( not ( = ?auto_113876 ?auto_113871 ) ) ( not ( = ?auto_113876 ?auto_113875 ) ) ( not ( = ?auto_113876 ?auto_113872 ) ) ( not ( = ?auto_113871 ?auto_113875 ) ) ( not ( = ?auto_113871 ?auto_113872 ) ) ( not ( = ?auto_113875 ?auto_113872 ) ) ( not ( = ?auto_113870 ?auto_113875 ) ) ( not ( = ?auto_113870 ?auto_113876 ) ) ( not ( = ?auto_113870 ?auto_113871 ) ) ( not ( = ?auto_113873 ?auto_113875 ) ) ( not ( = ?auto_113873 ?auto_113876 ) ) ( not ( = ?auto_113873 ?auto_113871 ) ) ( not ( = ?auto_113874 ?auto_113875 ) ) ( not ( = ?auto_113874 ?auto_113876 ) ) ( not ( = ?auto_113874 ?auto_113871 ) ) ( ON ?auto_113872 ?auto_113874 ) ( ON ?auto_113875 ?auto_113872 ) ( CLEAR ?auto_113875 ) ( HOLDING ?auto_113871 ) ( CLEAR ?auto_113876 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_113876 ?auto_113871 )
      ( MAKE-1PILE ?auto_113870 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_113877 - BLOCK
    )
    :vars
    (
      ?auto_113879 - BLOCK
      ?auto_113878 - BLOCK
      ?auto_113883 - BLOCK
      ?auto_113882 - BLOCK
      ?auto_113881 - BLOCK
      ?auto_113880 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113879 ?auto_113877 ) ( ON-TABLE ?auto_113877 ) ( not ( = ?auto_113877 ?auto_113879 ) ) ( not ( = ?auto_113877 ?auto_113878 ) ) ( not ( = ?auto_113877 ?auto_113883 ) ) ( not ( = ?auto_113879 ?auto_113878 ) ) ( not ( = ?auto_113879 ?auto_113883 ) ) ( not ( = ?auto_113878 ?auto_113883 ) ) ( ON ?auto_113878 ?auto_113879 ) ( ON-TABLE ?auto_113882 ) ( not ( = ?auto_113882 ?auto_113881 ) ) ( not ( = ?auto_113882 ?auto_113880 ) ) ( not ( = ?auto_113882 ?auto_113883 ) ) ( not ( = ?auto_113881 ?auto_113880 ) ) ( not ( = ?auto_113881 ?auto_113883 ) ) ( not ( = ?auto_113880 ?auto_113883 ) ) ( not ( = ?auto_113877 ?auto_113880 ) ) ( not ( = ?auto_113877 ?auto_113882 ) ) ( not ( = ?auto_113877 ?auto_113881 ) ) ( not ( = ?auto_113879 ?auto_113880 ) ) ( not ( = ?auto_113879 ?auto_113882 ) ) ( not ( = ?auto_113879 ?auto_113881 ) ) ( not ( = ?auto_113878 ?auto_113880 ) ) ( not ( = ?auto_113878 ?auto_113882 ) ) ( not ( = ?auto_113878 ?auto_113881 ) ) ( ON ?auto_113883 ?auto_113878 ) ( ON ?auto_113880 ?auto_113883 ) ( CLEAR ?auto_113882 ) ( ON ?auto_113881 ?auto_113880 ) ( CLEAR ?auto_113881 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_113877 ?auto_113879 ?auto_113878 ?auto_113883 ?auto_113880 )
      ( MAKE-1PILE ?auto_113877 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_113884 - BLOCK
    )
    :vars
    (
      ?auto_113890 - BLOCK
      ?auto_113889 - BLOCK
      ?auto_113887 - BLOCK
      ?auto_113885 - BLOCK
      ?auto_113886 - BLOCK
      ?auto_113888 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113890 ?auto_113884 ) ( ON-TABLE ?auto_113884 ) ( not ( = ?auto_113884 ?auto_113890 ) ) ( not ( = ?auto_113884 ?auto_113889 ) ) ( not ( = ?auto_113884 ?auto_113887 ) ) ( not ( = ?auto_113890 ?auto_113889 ) ) ( not ( = ?auto_113890 ?auto_113887 ) ) ( not ( = ?auto_113889 ?auto_113887 ) ) ( ON ?auto_113889 ?auto_113890 ) ( not ( = ?auto_113885 ?auto_113886 ) ) ( not ( = ?auto_113885 ?auto_113888 ) ) ( not ( = ?auto_113885 ?auto_113887 ) ) ( not ( = ?auto_113886 ?auto_113888 ) ) ( not ( = ?auto_113886 ?auto_113887 ) ) ( not ( = ?auto_113888 ?auto_113887 ) ) ( not ( = ?auto_113884 ?auto_113888 ) ) ( not ( = ?auto_113884 ?auto_113885 ) ) ( not ( = ?auto_113884 ?auto_113886 ) ) ( not ( = ?auto_113890 ?auto_113888 ) ) ( not ( = ?auto_113890 ?auto_113885 ) ) ( not ( = ?auto_113890 ?auto_113886 ) ) ( not ( = ?auto_113889 ?auto_113888 ) ) ( not ( = ?auto_113889 ?auto_113885 ) ) ( not ( = ?auto_113889 ?auto_113886 ) ) ( ON ?auto_113887 ?auto_113889 ) ( ON ?auto_113888 ?auto_113887 ) ( ON ?auto_113886 ?auto_113888 ) ( CLEAR ?auto_113886 ) ( HOLDING ?auto_113885 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_113885 )
      ( MAKE-1PILE ?auto_113884 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_113899 - BLOCK
    )
    :vars
    (
      ?auto_113903 - BLOCK
      ?auto_113901 - BLOCK
      ?auto_113905 - BLOCK
      ?auto_113904 - BLOCK
      ?auto_113902 - BLOCK
      ?auto_113900 - BLOCK
      ?auto_113906 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113903 ?auto_113899 ) ( ON-TABLE ?auto_113899 ) ( not ( = ?auto_113899 ?auto_113903 ) ) ( not ( = ?auto_113899 ?auto_113901 ) ) ( not ( = ?auto_113899 ?auto_113905 ) ) ( not ( = ?auto_113903 ?auto_113901 ) ) ( not ( = ?auto_113903 ?auto_113905 ) ) ( not ( = ?auto_113901 ?auto_113905 ) ) ( ON ?auto_113901 ?auto_113903 ) ( not ( = ?auto_113904 ?auto_113902 ) ) ( not ( = ?auto_113904 ?auto_113900 ) ) ( not ( = ?auto_113904 ?auto_113905 ) ) ( not ( = ?auto_113902 ?auto_113900 ) ) ( not ( = ?auto_113902 ?auto_113905 ) ) ( not ( = ?auto_113900 ?auto_113905 ) ) ( not ( = ?auto_113899 ?auto_113900 ) ) ( not ( = ?auto_113899 ?auto_113904 ) ) ( not ( = ?auto_113899 ?auto_113902 ) ) ( not ( = ?auto_113903 ?auto_113900 ) ) ( not ( = ?auto_113903 ?auto_113904 ) ) ( not ( = ?auto_113903 ?auto_113902 ) ) ( not ( = ?auto_113901 ?auto_113900 ) ) ( not ( = ?auto_113901 ?auto_113904 ) ) ( not ( = ?auto_113901 ?auto_113902 ) ) ( ON ?auto_113905 ?auto_113901 ) ( ON ?auto_113900 ?auto_113905 ) ( ON ?auto_113902 ?auto_113900 ) ( CLEAR ?auto_113902 ) ( ON ?auto_113904 ?auto_113906 ) ( CLEAR ?auto_113904 ) ( HAND-EMPTY ) ( not ( = ?auto_113899 ?auto_113906 ) ) ( not ( = ?auto_113903 ?auto_113906 ) ) ( not ( = ?auto_113901 ?auto_113906 ) ) ( not ( = ?auto_113905 ?auto_113906 ) ) ( not ( = ?auto_113904 ?auto_113906 ) ) ( not ( = ?auto_113902 ?auto_113906 ) ) ( not ( = ?auto_113900 ?auto_113906 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_113904 ?auto_113906 )
      ( MAKE-1PILE ?auto_113899 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_113907 - BLOCK
    )
    :vars
    (
      ?auto_113912 - BLOCK
      ?auto_113908 - BLOCK
      ?auto_113909 - BLOCK
      ?auto_113910 - BLOCK
      ?auto_113914 - BLOCK
      ?auto_113911 - BLOCK
      ?auto_113913 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113912 ?auto_113907 ) ( ON-TABLE ?auto_113907 ) ( not ( = ?auto_113907 ?auto_113912 ) ) ( not ( = ?auto_113907 ?auto_113908 ) ) ( not ( = ?auto_113907 ?auto_113909 ) ) ( not ( = ?auto_113912 ?auto_113908 ) ) ( not ( = ?auto_113912 ?auto_113909 ) ) ( not ( = ?auto_113908 ?auto_113909 ) ) ( ON ?auto_113908 ?auto_113912 ) ( not ( = ?auto_113910 ?auto_113914 ) ) ( not ( = ?auto_113910 ?auto_113911 ) ) ( not ( = ?auto_113910 ?auto_113909 ) ) ( not ( = ?auto_113914 ?auto_113911 ) ) ( not ( = ?auto_113914 ?auto_113909 ) ) ( not ( = ?auto_113911 ?auto_113909 ) ) ( not ( = ?auto_113907 ?auto_113911 ) ) ( not ( = ?auto_113907 ?auto_113910 ) ) ( not ( = ?auto_113907 ?auto_113914 ) ) ( not ( = ?auto_113912 ?auto_113911 ) ) ( not ( = ?auto_113912 ?auto_113910 ) ) ( not ( = ?auto_113912 ?auto_113914 ) ) ( not ( = ?auto_113908 ?auto_113911 ) ) ( not ( = ?auto_113908 ?auto_113910 ) ) ( not ( = ?auto_113908 ?auto_113914 ) ) ( ON ?auto_113909 ?auto_113908 ) ( ON ?auto_113911 ?auto_113909 ) ( ON ?auto_113910 ?auto_113913 ) ( CLEAR ?auto_113910 ) ( not ( = ?auto_113907 ?auto_113913 ) ) ( not ( = ?auto_113912 ?auto_113913 ) ) ( not ( = ?auto_113908 ?auto_113913 ) ) ( not ( = ?auto_113909 ?auto_113913 ) ) ( not ( = ?auto_113910 ?auto_113913 ) ) ( not ( = ?auto_113914 ?auto_113913 ) ) ( not ( = ?auto_113911 ?auto_113913 ) ) ( HOLDING ?auto_113914 ) ( CLEAR ?auto_113911 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_113907 ?auto_113912 ?auto_113908 ?auto_113909 ?auto_113911 ?auto_113914 )
      ( MAKE-1PILE ?auto_113907 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_113915 - BLOCK
    )
    :vars
    (
      ?auto_113920 - BLOCK
      ?auto_113918 - BLOCK
      ?auto_113917 - BLOCK
      ?auto_113919 - BLOCK
      ?auto_113922 - BLOCK
      ?auto_113921 - BLOCK
      ?auto_113916 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113920 ?auto_113915 ) ( ON-TABLE ?auto_113915 ) ( not ( = ?auto_113915 ?auto_113920 ) ) ( not ( = ?auto_113915 ?auto_113918 ) ) ( not ( = ?auto_113915 ?auto_113917 ) ) ( not ( = ?auto_113920 ?auto_113918 ) ) ( not ( = ?auto_113920 ?auto_113917 ) ) ( not ( = ?auto_113918 ?auto_113917 ) ) ( ON ?auto_113918 ?auto_113920 ) ( not ( = ?auto_113919 ?auto_113922 ) ) ( not ( = ?auto_113919 ?auto_113921 ) ) ( not ( = ?auto_113919 ?auto_113917 ) ) ( not ( = ?auto_113922 ?auto_113921 ) ) ( not ( = ?auto_113922 ?auto_113917 ) ) ( not ( = ?auto_113921 ?auto_113917 ) ) ( not ( = ?auto_113915 ?auto_113921 ) ) ( not ( = ?auto_113915 ?auto_113919 ) ) ( not ( = ?auto_113915 ?auto_113922 ) ) ( not ( = ?auto_113920 ?auto_113921 ) ) ( not ( = ?auto_113920 ?auto_113919 ) ) ( not ( = ?auto_113920 ?auto_113922 ) ) ( not ( = ?auto_113918 ?auto_113921 ) ) ( not ( = ?auto_113918 ?auto_113919 ) ) ( not ( = ?auto_113918 ?auto_113922 ) ) ( ON ?auto_113917 ?auto_113918 ) ( ON ?auto_113921 ?auto_113917 ) ( ON ?auto_113919 ?auto_113916 ) ( not ( = ?auto_113915 ?auto_113916 ) ) ( not ( = ?auto_113920 ?auto_113916 ) ) ( not ( = ?auto_113918 ?auto_113916 ) ) ( not ( = ?auto_113917 ?auto_113916 ) ) ( not ( = ?auto_113919 ?auto_113916 ) ) ( not ( = ?auto_113922 ?auto_113916 ) ) ( not ( = ?auto_113921 ?auto_113916 ) ) ( CLEAR ?auto_113921 ) ( ON ?auto_113922 ?auto_113919 ) ( CLEAR ?auto_113922 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_113916 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_113916 ?auto_113919 )
      ( MAKE-1PILE ?auto_113915 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_113923 - BLOCK
    )
    :vars
    (
      ?auto_113924 - BLOCK
      ?auto_113928 - BLOCK
      ?auto_113925 - BLOCK
      ?auto_113927 - BLOCK
      ?auto_113926 - BLOCK
      ?auto_113930 - BLOCK
      ?auto_113929 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113924 ?auto_113923 ) ( ON-TABLE ?auto_113923 ) ( not ( = ?auto_113923 ?auto_113924 ) ) ( not ( = ?auto_113923 ?auto_113928 ) ) ( not ( = ?auto_113923 ?auto_113925 ) ) ( not ( = ?auto_113924 ?auto_113928 ) ) ( not ( = ?auto_113924 ?auto_113925 ) ) ( not ( = ?auto_113928 ?auto_113925 ) ) ( ON ?auto_113928 ?auto_113924 ) ( not ( = ?auto_113927 ?auto_113926 ) ) ( not ( = ?auto_113927 ?auto_113930 ) ) ( not ( = ?auto_113927 ?auto_113925 ) ) ( not ( = ?auto_113926 ?auto_113930 ) ) ( not ( = ?auto_113926 ?auto_113925 ) ) ( not ( = ?auto_113930 ?auto_113925 ) ) ( not ( = ?auto_113923 ?auto_113930 ) ) ( not ( = ?auto_113923 ?auto_113927 ) ) ( not ( = ?auto_113923 ?auto_113926 ) ) ( not ( = ?auto_113924 ?auto_113930 ) ) ( not ( = ?auto_113924 ?auto_113927 ) ) ( not ( = ?auto_113924 ?auto_113926 ) ) ( not ( = ?auto_113928 ?auto_113930 ) ) ( not ( = ?auto_113928 ?auto_113927 ) ) ( not ( = ?auto_113928 ?auto_113926 ) ) ( ON ?auto_113925 ?auto_113928 ) ( ON ?auto_113927 ?auto_113929 ) ( not ( = ?auto_113923 ?auto_113929 ) ) ( not ( = ?auto_113924 ?auto_113929 ) ) ( not ( = ?auto_113928 ?auto_113929 ) ) ( not ( = ?auto_113925 ?auto_113929 ) ) ( not ( = ?auto_113927 ?auto_113929 ) ) ( not ( = ?auto_113926 ?auto_113929 ) ) ( not ( = ?auto_113930 ?auto_113929 ) ) ( ON ?auto_113926 ?auto_113927 ) ( CLEAR ?auto_113926 ) ( ON-TABLE ?auto_113929 ) ( HOLDING ?auto_113930 ) ( CLEAR ?auto_113925 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_113923 ?auto_113924 ?auto_113928 ?auto_113925 ?auto_113930 )
      ( MAKE-1PILE ?auto_113923 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_113969 - BLOCK
      ?auto_113970 - BLOCK
      ?auto_113971 - BLOCK
      ?auto_113972 - BLOCK
      ?auto_113973 - BLOCK
      ?auto_113974 - BLOCK
    )
    :vars
    (
      ?auto_113975 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_113969 ) ( ON ?auto_113970 ?auto_113969 ) ( ON ?auto_113971 ?auto_113970 ) ( ON ?auto_113972 ?auto_113971 ) ( not ( = ?auto_113969 ?auto_113970 ) ) ( not ( = ?auto_113969 ?auto_113971 ) ) ( not ( = ?auto_113969 ?auto_113972 ) ) ( not ( = ?auto_113969 ?auto_113973 ) ) ( not ( = ?auto_113969 ?auto_113974 ) ) ( not ( = ?auto_113970 ?auto_113971 ) ) ( not ( = ?auto_113970 ?auto_113972 ) ) ( not ( = ?auto_113970 ?auto_113973 ) ) ( not ( = ?auto_113970 ?auto_113974 ) ) ( not ( = ?auto_113971 ?auto_113972 ) ) ( not ( = ?auto_113971 ?auto_113973 ) ) ( not ( = ?auto_113971 ?auto_113974 ) ) ( not ( = ?auto_113972 ?auto_113973 ) ) ( not ( = ?auto_113972 ?auto_113974 ) ) ( not ( = ?auto_113973 ?auto_113974 ) ) ( ON ?auto_113974 ?auto_113975 ) ( not ( = ?auto_113969 ?auto_113975 ) ) ( not ( = ?auto_113970 ?auto_113975 ) ) ( not ( = ?auto_113971 ?auto_113975 ) ) ( not ( = ?auto_113972 ?auto_113975 ) ) ( not ( = ?auto_113973 ?auto_113975 ) ) ( not ( = ?auto_113974 ?auto_113975 ) ) ( CLEAR ?auto_113972 ) ( ON ?auto_113973 ?auto_113974 ) ( CLEAR ?auto_113973 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_113975 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_113975 ?auto_113974 )
      ( MAKE-6PILE ?auto_113969 ?auto_113970 ?auto_113971 ?auto_113972 ?auto_113973 ?auto_113974 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_113976 - BLOCK
      ?auto_113977 - BLOCK
      ?auto_113978 - BLOCK
      ?auto_113979 - BLOCK
      ?auto_113980 - BLOCK
      ?auto_113981 - BLOCK
    )
    :vars
    (
      ?auto_113982 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_113976 ) ( ON ?auto_113977 ?auto_113976 ) ( ON ?auto_113978 ?auto_113977 ) ( not ( = ?auto_113976 ?auto_113977 ) ) ( not ( = ?auto_113976 ?auto_113978 ) ) ( not ( = ?auto_113976 ?auto_113979 ) ) ( not ( = ?auto_113976 ?auto_113980 ) ) ( not ( = ?auto_113976 ?auto_113981 ) ) ( not ( = ?auto_113977 ?auto_113978 ) ) ( not ( = ?auto_113977 ?auto_113979 ) ) ( not ( = ?auto_113977 ?auto_113980 ) ) ( not ( = ?auto_113977 ?auto_113981 ) ) ( not ( = ?auto_113978 ?auto_113979 ) ) ( not ( = ?auto_113978 ?auto_113980 ) ) ( not ( = ?auto_113978 ?auto_113981 ) ) ( not ( = ?auto_113979 ?auto_113980 ) ) ( not ( = ?auto_113979 ?auto_113981 ) ) ( not ( = ?auto_113980 ?auto_113981 ) ) ( ON ?auto_113981 ?auto_113982 ) ( not ( = ?auto_113976 ?auto_113982 ) ) ( not ( = ?auto_113977 ?auto_113982 ) ) ( not ( = ?auto_113978 ?auto_113982 ) ) ( not ( = ?auto_113979 ?auto_113982 ) ) ( not ( = ?auto_113980 ?auto_113982 ) ) ( not ( = ?auto_113981 ?auto_113982 ) ) ( ON ?auto_113980 ?auto_113981 ) ( CLEAR ?auto_113980 ) ( ON-TABLE ?auto_113982 ) ( HOLDING ?auto_113979 ) ( CLEAR ?auto_113978 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_113976 ?auto_113977 ?auto_113978 ?auto_113979 )
      ( MAKE-6PILE ?auto_113976 ?auto_113977 ?auto_113978 ?auto_113979 ?auto_113980 ?auto_113981 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_113983 - BLOCK
      ?auto_113984 - BLOCK
      ?auto_113985 - BLOCK
      ?auto_113986 - BLOCK
      ?auto_113987 - BLOCK
      ?auto_113988 - BLOCK
    )
    :vars
    (
      ?auto_113989 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_113983 ) ( ON ?auto_113984 ?auto_113983 ) ( ON ?auto_113985 ?auto_113984 ) ( not ( = ?auto_113983 ?auto_113984 ) ) ( not ( = ?auto_113983 ?auto_113985 ) ) ( not ( = ?auto_113983 ?auto_113986 ) ) ( not ( = ?auto_113983 ?auto_113987 ) ) ( not ( = ?auto_113983 ?auto_113988 ) ) ( not ( = ?auto_113984 ?auto_113985 ) ) ( not ( = ?auto_113984 ?auto_113986 ) ) ( not ( = ?auto_113984 ?auto_113987 ) ) ( not ( = ?auto_113984 ?auto_113988 ) ) ( not ( = ?auto_113985 ?auto_113986 ) ) ( not ( = ?auto_113985 ?auto_113987 ) ) ( not ( = ?auto_113985 ?auto_113988 ) ) ( not ( = ?auto_113986 ?auto_113987 ) ) ( not ( = ?auto_113986 ?auto_113988 ) ) ( not ( = ?auto_113987 ?auto_113988 ) ) ( ON ?auto_113988 ?auto_113989 ) ( not ( = ?auto_113983 ?auto_113989 ) ) ( not ( = ?auto_113984 ?auto_113989 ) ) ( not ( = ?auto_113985 ?auto_113989 ) ) ( not ( = ?auto_113986 ?auto_113989 ) ) ( not ( = ?auto_113987 ?auto_113989 ) ) ( not ( = ?auto_113988 ?auto_113989 ) ) ( ON ?auto_113987 ?auto_113988 ) ( ON-TABLE ?auto_113989 ) ( CLEAR ?auto_113985 ) ( ON ?auto_113986 ?auto_113987 ) ( CLEAR ?auto_113986 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_113989 ?auto_113988 ?auto_113987 )
      ( MAKE-6PILE ?auto_113983 ?auto_113984 ?auto_113985 ?auto_113986 ?auto_113987 ?auto_113988 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_113990 - BLOCK
      ?auto_113991 - BLOCK
      ?auto_113992 - BLOCK
      ?auto_113993 - BLOCK
      ?auto_113994 - BLOCK
      ?auto_113995 - BLOCK
    )
    :vars
    (
      ?auto_113996 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_113990 ) ( ON ?auto_113991 ?auto_113990 ) ( not ( = ?auto_113990 ?auto_113991 ) ) ( not ( = ?auto_113990 ?auto_113992 ) ) ( not ( = ?auto_113990 ?auto_113993 ) ) ( not ( = ?auto_113990 ?auto_113994 ) ) ( not ( = ?auto_113990 ?auto_113995 ) ) ( not ( = ?auto_113991 ?auto_113992 ) ) ( not ( = ?auto_113991 ?auto_113993 ) ) ( not ( = ?auto_113991 ?auto_113994 ) ) ( not ( = ?auto_113991 ?auto_113995 ) ) ( not ( = ?auto_113992 ?auto_113993 ) ) ( not ( = ?auto_113992 ?auto_113994 ) ) ( not ( = ?auto_113992 ?auto_113995 ) ) ( not ( = ?auto_113993 ?auto_113994 ) ) ( not ( = ?auto_113993 ?auto_113995 ) ) ( not ( = ?auto_113994 ?auto_113995 ) ) ( ON ?auto_113995 ?auto_113996 ) ( not ( = ?auto_113990 ?auto_113996 ) ) ( not ( = ?auto_113991 ?auto_113996 ) ) ( not ( = ?auto_113992 ?auto_113996 ) ) ( not ( = ?auto_113993 ?auto_113996 ) ) ( not ( = ?auto_113994 ?auto_113996 ) ) ( not ( = ?auto_113995 ?auto_113996 ) ) ( ON ?auto_113994 ?auto_113995 ) ( ON-TABLE ?auto_113996 ) ( ON ?auto_113993 ?auto_113994 ) ( CLEAR ?auto_113993 ) ( HOLDING ?auto_113992 ) ( CLEAR ?auto_113991 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_113990 ?auto_113991 ?auto_113992 )
      ( MAKE-6PILE ?auto_113990 ?auto_113991 ?auto_113992 ?auto_113993 ?auto_113994 ?auto_113995 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_113997 - BLOCK
      ?auto_113998 - BLOCK
      ?auto_113999 - BLOCK
      ?auto_114000 - BLOCK
      ?auto_114001 - BLOCK
      ?auto_114002 - BLOCK
    )
    :vars
    (
      ?auto_114003 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_113997 ) ( ON ?auto_113998 ?auto_113997 ) ( not ( = ?auto_113997 ?auto_113998 ) ) ( not ( = ?auto_113997 ?auto_113999 ) ) ( not ( = ?auto_113997 ?auto_114000 ) ) ( not ( = ?auto_113997 ?auto_114001 ) ) ( not ( = ?auto_113997 ?auto_114002 ) ) ( not ( = ?auto_113998 ?auto_113999 ) ) ( not ( = ?auto_113998 ?auto_114000 ) ) ( not ( = ?auto_113998 ?auto_114001 ) ) ( not ( = ?auto_113998 ?auto_114002 ) ) ( not ( = ?auto_113999 ?auto_114000 ) ) ( not ( = ?auto_113999 ?auto_114001 ) ) ( not ( = ?auto_113999 ?auto_114002 ) ) ( not ( = ?auto_114000 ?auto_114001 ) ) ( not ( = ?auto_114000 ?auto_114002 ) ) ( not ( = ?auto_114001 ?auto_114002 ) ) ( ON ?auto_114002 ?auto_114003 ) ( not ( = ?auto_113997 ?auto_114003 ) ) ( not ( = ?auto_113998 ?auto_114003 ) ) ( not ( = ?auto_113999 ?auto_114003 ) ) ( not ( = ?auto_114000 ?auto_114003 ) ) ( not ( = ?auto_114001 ?auto_114003 ) ) ( not ( = ?auto_114002 ?auto_114003 ) ) ( ON ?auto_114001 ?auto_114002 ) ( ON-TABLE ?auto_114003 ) ( ON ?auto_114000 ?auto_114001 ) ( CLEAR ?auto_113998 ) ( ON ?auto_113999 ?auto_114000 ) ( CLEAR ?auto_113999 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_114003 ?auto_114002 ?auto_114001 ?auto_114000 )
      ( MAKE-6PILE ?auto_113997 ?auto_113998 ?auto_113999 ?auto_114000 ?auto_114001 ?auto_114002 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_114004 - BLOCK
      ?auto_114005 - BLOCK
      ?auto_114006 - BLOCK
      ?auto_114007 - BLOCK
      ?auto_114008 - BLOCK
      ?auto_114009 - BLOCK
    )
    :vars
    (
      ?auto_114010 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_114004 ) ( not ( = ?auto_114004 ?auto_114005 ) ) ( not ( = ?auto_114004 ?auto_114006 ) ) ( not ( = ?auto_114004 ?auto_114007 ) ) ( not ( = ?auto_114004 ?auto_114008 ) ) ( not ( = ?auto_114004 ?auto_114009 ) ) ( not ( = ?auto_114005 ?auto_114006 ) ) ( not ( = ?auto_114005 ?auto_114007 ) ) ( not ( = ?auto_114005 ?auto_114008 ) ) ( not ( = ?auto_114005 ?auto_114009 ) ) ( not ( = ?auto_114006 ?auto_114007 ) ) ( not ( = ?auto_114006 ?auto_114008 ) ) ( not ( = ?auto_114006 ?auto_114009 ) ) ( not ( = ?auto_114007 ?auto_114008 ) ) ( not ( = ?auto_114007 ?auto_114009 ) ) ( not ( = ?auto_114008 ?auto_114009 ) ) ( ON ?auto_114009 ?auto_114010 ) ( not ( = ?auto_114004 ?auto_114010 ) ) ( not ( = ?auto_114005 ?auto_114010 ) ) ( not ( = ?auto_114006 ?auto_114010 ) ) ( not ( = ?auto_114007 ?auto_114010 ) ) ( not ( = ?auto_114008 ?auto_114010 ) ) ( not ( = ?auto_114009 ?auto_114010 ) ) ( ON ?auto_114008 ?auto_114009 ) ( ON-TABLE ?auto_114010 ) ( ON ?auto_114007 ?auto_114008 ) ( ON ?auto_114006 ?auto_114007 ) ( CLEAR ?auto_114006 ) ( HOLDING ?auto_114005 ) ( CLEAR ?auto_114004 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_114004 ?auto_114005 )
      ( MAKE-6PILE ?auto_114004 ?auto_114005 ?auto_114006 ?auto_114007 ?auto_114008 ?auto_114009 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_114011 - BLOCK
      ?auto_114012 - BLOCK
      ?auto_114013 - BLOCK
      ?auto_114014 - BLOCK
      ?auto_114015 - BLOCK
      ?auto_114016 - BLOCK
    )
    :vars
    (
      ?auto_114017 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_114011 ) ( not ( = ?auto_114011 ?auto_114012 ) ) ( not ( = ?auto_114011 ?auto_114013 ) ) ( not ( = ?auto_114011 ?auto_114014 ) ) ( not ( = ?auto_114011 ?auto_114015 ) ) ( not ( = ?auto_114011 ?auto_114016 ) ) ( not ( = ?auto_114012 ?auto_114013 ) ) ( not ( = ?auto_114012 ?auto_114014 ) ) ( not ( = ?auto_114012 ?auto_114015 ) ) ( not ( = ?auto_114012 ?auto_114016 ) ) ( not ( = ?auto_114013 ?auto_114014 ) ) ( not ( = ?auto_114013 ?auto_114015 ) ) ( not ( = ?auto_114013 ?auto_114016 ) ) ( not ( = ?auto_114014 ?auto_114015 ) ) ( not ( = ?auto_114014 ?auto_114016 ) ) ( not ( = ?auto_114015 ?auto_114016 ) ) ( ON ?auto_114016 ?auto_114017 ) ( not ( = ?auto_114011 ?auto_114017 ) ) ( not ( = ?auto_114012 ?auto_114017 ) ) ( not ( = ?auto_114013 ?auto_114017 ) ) ( not ( = ?auto_114014 ?auto_114017 ) ) ( not ( = ?auto_114015 ?auto_114017 ) ) ( not ( = ?auto_114016 ?auto_114017 ) ) ( ON ?auto_114015 ?auto_114016 ) ( ON-TABLE ?auto_114017 ) ( ON ?auto_114014 ?auto_114015 ) ( ON ?auto_114013 ?auto_114014 ) ( CLEAR ?auto_114011 ) ( ON ?auto_114012 ?auto_114013 ) ( CLEAR ?auto_114012 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_114017 ?auto_114016 ?auto_114015 ?auto_114014 ?auto_114013 )
      ( MAKE-6PILE ?auto_114011 ?auto_114012 ?auto_114013 ?auto_114014 ?auto_114015 ?auto_114016 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_114018 - BLOCK
      ?auto_114019 - BLOCK
      ?auto_114020 - BLOCK
      ?auto_114021 - BLOCK
      ?auto_114022 - BLOCK
      ?auto_114023 - BLOCK
    )
    :vars
    (
      ?auto_114024 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114018 ?auto_114019 ) ) ( not ( = ?auto_114018 ?auto_114020 ) ) ( not ( = ?auto_114018 ?auto_114021 ) ) ( not ( = ?auto_114018 ?auto_114022 ) ) ( not ( = ?auto_114018 ?auto_114023 ) ) ( not ( = ?auto_114019 ?auto_114020 ) ) ( not ( = ?auto_114019 ?auto_114021 ) ) ( not ( = ?auto_114019 ?auto_114022 ) ) ( not ( = ?auto_114019 ?auto_114023 ) ) ( not ( = ?auto_114020 ?auto_114021 ) ) ( not ( = ?auto_114020 ?auto_114022 ) ) ( not ( = ?auto_114020 ?auto_114023 ) ) ( not ( = ?auto_114021 ?auto_114022 ) ) ( not ( = ?auto_114021 ?auto_114023 ) ) ( not ( = ?auto_114022 ?auto_114023 ) ) ( ON ?auto_114023 ?auto_114024 ) ( not ( = ?auto_114018 ?auto_114024 ) ) ( not ( = ?auto_114019 ?auto_114024 ) ) ( not ( = ?auto_114020 ?auto_114024 ) ) ( not ( = ?auto_114021 ?auto_114024 ) ) ( not ( = ?auto_114022 ?auto_114024 ) ) ( not ( = ?auto_114023 ?auto_114024 ) ) ( ON ?auto_114022 ?auto_114023 ) ( ON-TABLE ?auto_114024 ) ( ON ?auto_114021 ?auto_114022 ) ( ON ?auto_114020 ?auto_114021 ) ( ON ?auto_114019 ?auto_114020 ) ( CLEAR ?auto_114019 ) ( HOLDING ?auto_114018 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_114018 )
      ( MAKE-6PILE ?auto_114018 ?auto_114019 ?auto_114020 ?auto_114021 ?auto_114022 ?auto_114023 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_114025 - BLOCK
      ?auto_114026 - BLOCK
      ?auto_114027 - BLOCK
      ?auto_114028 - BLOCK
      ?auto_114029 - BLOCK
      ?auto_114030 - BLOCK
    )
    :vars
    (
      ?auto_114031 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114025 ?auto_114026 ) ) ( not ( = ?auto_114025 ?auto_114027 ) ) ( not ( = ?auto_114025 ?auto_114028 ) ) ( not ( = ?auto_114025 ?auto_114029 ) ) ( not ( = ?auto_114025 ?auto_114030 ) ) ( not ( = ?auto_114026 ?auto_114027 ) ) ( not ( = ?auto_114026 ?auto_114028 ) ) ( not ( = ?auto_114026 ?auto_114029 ) ) ( not ( = ?auto_114026 ?auto_114030 ) ) ( not ( = ?auto_114027 ?auto_114028 ) ) ( not ( = ?auto_114027 ?auto_114029 ) ) ( not ( = ?auto_114027 ?auto_114030 ) ) ( not ( = ?auto_114028 ?auto_114029 ) ) ( not ( = ?auto_114028 ?auto_114030 ) ) ( not ( = ?auto_114029 ?auto_114030 ) ) ( ON ?auto_114030 ?auto_114031 ) ( not ( = ?auto_114025 ?auto_114031 ) ) ( not ( = ?auto_114026 ?auto_114031 ) ) ( not ( = ?auto_114027 ?auto_114031 ) ) ( not ( = ?auto_114028 ?auto_114031 ) ) ( not ( = ?auto_114029 ?auto_114031 ) ) ( not ( = ?auto_114030 ?auto_114031 ) ) ( ON ?auto_114029 ?auto_114030 ) ( ON-TABLE ?auto_114031 ) ( ON ?auto_114028 ?auto_114029 ) ( ON ?auto_114027 ?auto_114028 ) ( ON ?auto_114026 ?auto_114027 ) ( ON ?auto_114025 ?auto_114026 ) ( CLEAR ?auto_114025 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_114031 ?auto_114030 ?auto_114029 ?auto_114028 ?auto_114027 ?auto_114026 )
      ( MAKE-6PILE ?auto_114025 ?auto_114026 ?auto_114027 ?auto_114028 ?auto_114029 ?auto_114030 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_114038 - BLOCK
      ?auto_114039 - BLOCK
      ?auto_114040 - BLOCK
      ?auto_114041 - BLOCK
      ?auto_114042 - BLOCK
      ?auto_114043 - BLOCK
    )
    :vars
    (
      ?auto_114044 - BLOCK
      ?auto_114045 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114038 ?auto_114039 ) ) ( not ( = ?auto_114038 ?auto_114040 ) ) ( not ( = ?auto_114038 ?auto_114041 ) ) ( not ( = ?auto_114038 ?auto_114042 ) ) ( not ( = ?auto_114038 ?auto_114043 ) ) ( not ( = ?auto_114039 ?auto_114040 ) ) ( not ( = ?auto_114039 ?auto_114041 ) ) ( not ( = ?auto_114039 ?auto_114042 ) ) ( not ( = ?auto_114039 ?auto_114043 ) ) ( not ( = ?auto_114040 ?auto_114041 ) ) ( not ( = ?auto_114040 ?auto_114042 ) ) ( not ( = ?auto_114040 ?auto_114043 ) ) ( not ( = ?auto_114041 ?auto_114042 ) ) ( not ( = ?auto_114041 ?auto_114043 ) ) ( not ( = ?auto_114042 ?auto_114043 ) ) ( ON ?auto_114043 ?auto_114044 ) ( not ( = ?auto_114038 ?auto_114044 ) ) ( not ( = ?auto_114039 ?auto_114044 ) ) ( not ( = ?auto_114040 ?auto_114044 ) ) ( not ( = ?auto_114041 ?auto_114044 ) ) ( not ( = ?auto_114042 ?auto_114044 ) ) ( not ( = ?auto_114043 ?auto_114044 ) ) ( ON ?auto_114042 ?auto_114043 ) ( ON-TABLE ?auto_114044 ) ( ON ?auto_114041 ?auto_114042 ) ( ON ?auto_114040 ?auto_114041 ) ( ON ?auto_114039 ?auto_114040 ) ( CLEAR ?auto_114039 ) ( ON ?auto_114038 ?auto_114045 ) ( CLEAR ?auto_114038 ) ( HAND-EMPTY ) ( not ( = ?auto_114038 ?auto_114045 ) ) ( not ( = ?auto_114039 ?auto_114045 ) ) ( not ( = ?auto_114040 ?auto_114045 ) ) ( not ( = ?auto_114041 ?auto_114045 ) ) ( not ( = ?auto_114042 ?auto_114045 ) ) ( not ( = ?auto_114043 ?auto_114045 ) ) ( not ( = ?auto_114044 ?auto_114045 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_114038 ?auto_114045 )
      ( MAKE-6PILE ?auto_114038 ?auto_114039 ?auto_114040 ?auto_114041 ?auto_114042 ?auto_114043 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_114046 - BLOCK
      ?auto_114047 - BLOCK
      ?auto_114048 - BLOCK
      ?auto_114049 - BLOCK
      ?auto_114050 - BLOCK
      ?auto_114051 - BLOCK
    )
    :vars
    (
      ?auto_114053 - BLOCK
      ?auto_114052 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114046 ?auto_114047 ) ) ( not ( = ?auto_114046 ?auto_114048 ) ) ( not ( = ?auto_114046 ?auto_114049 ) ) ( not ( = ?auto_114046 ?auto_114050 ) ) ( not ( = ?auto_114046 ?auto_114051 ) ) ( not ( = ?auto_114047 ?auto_114048 ) ) ( not ( = ?auto_114047 ?auto_114049 ) ) ( not ( = ?auto_114047 ?auto_114050 ) ) ( not ( = ?auto_114047 ?auto_114051 ) ) ( not ( = ?auto_114048 ?auto_114049 ) ) ( not ( = ?auto_114048 ?auto_114050 ) ) ( not ( = ?auto_114048 ?auto_114051 ) ) ( not ( = ?auto_114049 ?auto_114050 ) ) ( not ( = ?auto_114049 ?auto_114051 ) ) ( not ( = ?auto_114050 ?auto_114051 ) ) ( ON ?auto_114051 ?auto_114053 ) ( not ( = ?auto_114046 ?auto_114053 ) ) ( not ( = ?auto_114047 ?auto_114053 ) ) ( not ( = ?auto_114048 ?auto_114053 ) ) ( not ( = ?auto_114049 ?auto_114053 ) ) ( not ( = ?auto_114050 ?auto_114053 ) ) ( not ( = ?auto_114051 ?auto_114053 ) ) ( ON ?auto_114050 ?auto_114051 ) ( ON-TABLE ?auto_114053 ) ( ON ?auto_114049 ?auto_114050 ) ( ON ?auto_114048 ?auto_114049 ) ( ON ?auto_114046 ?auto_114052 ) ( CLEAR ?auto_114046 ) ( not ( = ?auto_114046 ?auto_114052 ) ) ( not ( = ?auto_114047 ?auto_114052 ) ) ( not ( = ?auto_114048 ?auto_114052 ) ) ( not ( = ?auto_114049 ?auto_114052 ) ) ( not ( = ?auto_114050 ?auto_114052 ) ) ( not ( = ?auto_114051 ?auto_114052 ) ) ( not ( = ?auto_114053 ?auto_114052 ) ) ( HOLDING ?auto_114047 ) ( CLEAR ?auto_114048 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_114053 ?auto_114051 ?auto_114050 ?auto_114049 ?auto_114048 ?auto_114047 )
      ( MAKE-6PILE ?auto_114046 ?auto_114047 ?auto_114048 ?auto_114049 ?auto_114050 ?auto_114051 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_114054 - BLOCK
      ?auto_114055 - BLOCK
      ?auto_114056 - BLOCK
      ?auto_114057 - BLOCK
      ?auto_114058 - BLOCK
      ?auto_114059 - BLOCK
    )
    :vars
    (
      ?auto_114061 - BLOCK
      ?auto_114060 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114054 ?auto_114055 ) ) ( not ( = ?auto_114054 ?auto_114056 ) ) ( not ( = ?auto_114054 ?auto_114057 ) ) ( not ( = ?auto_114054 ?auto_114058 ) ) ( not ( = ?auto_114054 ?auto_114059 ) ) ( not ( = ?auto_114055 ?auto_114056 ) ) ( not ( = ?auto_114055 ?auto_114057 ) ) ( not ( = ?auto_114055 ?auto_114058 ) ) ( not ( = ?auto_114055 ?auto_114059 ) ) ( not ( = ?auto_114056 ?auto_114057 ) ) ( not ( = ?auto_114056 ?auto_114058 ) ) ( not ( = ?auto_114056 ?auto_114059 ) ) ( not ( = ?auto_114057 ?auto_114058 ) ) ( not ( = ?auto_114057 ?auto_114059 ) ) ( not ( = ?auto_114058 ?auto_114059 ) ) ( ON ?auto_114059 ?auto_114061 ) ( not ( = ?auto_114054 ?auto_114061 ) ) ( not ( = ?auto_114055 ?auto_114061 ) ) ( not ( = ?auto_114056 ?auto_114061 ) ) ( not ( = ?auto_114057 ?auto_114061 ) ) ( not ( = ?auto_114058 ?auto_114061 ) ) ( not ( = ?auto_114059 ?auto_114061 ) ) ( ON ?auto_114058 ?auto_114059 ) ( ON-TABLE ?auto_114061 ) ( ON ?auto_114057 ?auto_114058 ) ( ON ?auto_114056 ?auto_114057 ) ( ON ?auto_114054 ?auto_114060 ) ( not ( = ?auto_114054 ?auto_114060 ) ) ( not ( = ?auto_114055 ?auto_114060 ) ) ( not ( = ?auto_114056 ?auto_114060 ) ) ( not ( = ?auto_114057 ?auto_114060 ) ) ( not ( = ?auto_114058 ?auto_114060 ) ) ( not ( = ?auto_114059 ?auto_114060 ) ) ( not ( = ?auto_114061 ?auto_114060 ) ) ( CLEAR ?auto_114056 ) ( ON ?auto_114055 ?auto_114054 ) ( CLEAR ?auto_114055 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_114060 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_114060 ?auto_114054 )
      ( MAKE-6PILE ?auto_114054 ?auto_114055 ?auto_114056 ?auto_114057 ?auto_114058 ?auto_114059 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_114062 - BLOCK
      ?auto_114063 - BLOCK
      ?auto_114064 - BLOCK
      ?auto_114065 - BLOCK
      ?auto_114066 - BLOCK
      ?auto_114067 - BLOCK
    )
    :vars
    (
      ?auto_114068 - BLOCK
      ?auto_114069 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114062 ?auto_114063 ) ) ( not ( = ?auto_114062 ?auto_114064 ) ) ( not ( = ?auto_114062 ?auto_114065 ) ) ( not ( = ?auto_114062 ?auto_114066 ) ) ( not ( = ?auto_114062 ?auto_114067 ) ) ( not ( = ?auto_114063 ?auto_114064 ) ) ( not ( = ?auto_114063 ?auto_114065 ) ) ( not ( = ?auto_114063 ?auto_114066 ) ) ( not ( = ?auto_114063 ?auto_114067 ) ) ( not ( = ?auto_114064 ?auto_114065 ) ) ( not ( = ?auto_114064 ?auto_114066 ) ) ( not ( = ?auto_114064 ?auto_114067 ) ) ( not ( = ?auto_114065 ?auto_114066 ) ) ( not ( = ?auto_114065 ?auto_114067 ) ) ( not ( = ?auto_114066 ?auto_114067 ) ) ( ON ?auto_114067 ?auto_114068 ) ( not ( = ?auto_114062 ?auto_114068 ) ) ( not ( = ?auto_114063 ?auto_114068 ) ) ( not ( = ?auto_114064 ?auto_114068 ) ) ( not ( = ?auto_114065 ?auto_114068 ) ) ( not ( = ?auto_114066 ?auto_114068 ) ) ( not ( = ?auto_114067 ?auto_114068 ) ) ( ON ?auto_114066 ?auto_114067 ) ( ON-TABLE ?auto_114068 ) ( ON ?auto_114065 ?auto_114066 ) ( ON ?auto_114062 ?auto_114069 ) ( not ( = ?auto_114062 ?auto_114069 ) ) ( not ( = ?auto_114063 ?auto_114069 ) ) ( not ( = ?auto_114064 ?auto_114069 ) ) ( not ( = ?auto_114065 ?auto_114069 ) ) ( not ( = ?auto_114066 ?auto_114069 ) ) ( not ( = ?auto_114067 ?auto_114069 ) ) ( not ( = ?auto_114068 ?auto_114069 ) ) ( ON ?auto_114063 ?auto_114062 ) ( CLEAR ?auto_114063 ) ( ON-TABLE ?auto_114069 ) ( HOLDING ?auto_114064 ) ( CLEAR ?auto_114065 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_114068 ?auto_114067 ?auto_114066 ?auto_114065 ?auto_114064 )
      ( MAKE-6PILE ?auto_114062 ?auto_114063 ?auto_114064 ?auto_114065 ?auto_114066 ?auto_114067 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_114070 - BLOCK
      ?auto_114071 - BLOCK
      ?auto_114072 - BLOCK
      ?auto_114073 - BLOCK
      ?auto_114074 - BLOCK
      ?auto_114075 - BLOCK
    )
    :vars
    (
      ?auto_114077 - BLOCK
      ?auto_114076 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114070 ?auto_114071 ) ) ( not ( = ?auto_114070 ?auto_114072 ) ) ( not ( = ?auto_114070 ?auto_114073 ) ) ( not ( = ?auto_114070 ?auto_114074 ) ) ( not ( = ?auto_114070 ?auto_114075 ) ) ( not ( = ?auto_114071 ?auto_114072 ) ) ( not ( = ?auto_114071 ?auto_114073 ) ) ( not ( = ?auto_114071 ?auto_114074 ) ) ( not ( = ?auto_114071 ?auto_114075 ) ) ( not ( = ?auto_114072 ?auto_114073 ) ) ( not ( = ?auto_114072 ?auto_114074 ) ) ( not ( = ?auto_114072 ?auto_114075 ) ) ( not ( = ?auto_114073 ?auto_114074 ) ) ( not ( = ?auto_114073 ?auto_114075 ) ) ( not ( = ?auto_114074 ?auto_114075 ) ) ( ON ?auto_114075 ?auto_114077 ) ( not ( = ?auto_114070 ?auto_114077 ) ) ( not ( = ?auto_114071 ?auto_114077 ) ) ( not ( = ?auto_114072 ?auto_114077 ) ) ( not ( = ?auto_114073 ?auto_114077 ) ) ( not ( = ?auto_114074 ?auto_114077 ) ) ( not ( = ?auto_114075 ?auto_114077 ) ) ( ON ?auto_114074 ?auto_114075 ) ( ON-TABLE ?auto_114077 ) ( ON ?auto_114073 ?auto_114074 ) ( ON ?auto_114070 ?auto_114076 ) ( not ( = ?auto_114070 ?auto_114076 ) ) ( not ( = ?auto_114071 ?auto_114076 ) ) ( not ( = ?auto_114072 ?auto_114076 ) ) ( not ( = ?auto_114073 ?auto_114076 ) ) ( not ( = ?auto_114074 ?auto_114076 ) ) ( not ( = ?auto_114075 ?auto_114076 ) ) ( not ( = ?auto_114077 ?auto_114076 ) ) ( ON ?auto_114071 ?auto_114070 ) ( ON-TABLE ?auto_114076 ) ( CLEAR ?auto_114073 ) ( ON ?auto_114072 ?auto_114071 ) ( CLEAR ?auto_114072 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_114076 ?auto_114070 ?auto_114071 )
      ( MAKE-6PILE ?auto_114070 ?auto_114071 ?auto_114072 ?auto_114073 ?auto_114074 ?auto_114075 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_114078 - BLOCK
      ?auto_114079 - BLOCK
      ?auto_114080 - BLOCK
      ?auto_114081 - BLOCK
      ?auto_114082 - BLOCK
      ?auto_114083 - BLOCK
    )
    :vars
    (
      ?auto_114085 - BLOCK
      ?auto_114084 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114078 ?auto_114079 ) ) ( not ( = ?auto_114078 ?auto_114080 ) ) ( not ( = ?auto_114078 ?auto_114081 ) ) ( not ( = ?auto_114078 ?auto_114082 ) ) ( not ( = ?auto_114078 ?auto_114083 ) ) ( not ( = ?auto_114079 ?auto_114080 ) ) ( not ( = ?auto_114079 ?auto_114081 ) ) ( not ( = ?auto_114079 ?auto_114082 ) ) ( not ( = ?auto_114079 ?auto_114083 ) ) ( not ( = ?auto_114080 ?auto_114081 ) ) ( not ( = ?auto_114080 ?auto_114082 ) ) ( not ( = ?auto_114080 ?auto_114083 ) ) ( not ( = ?auto_114081 ?auto_114082 ) ) ( not ( = ?auto_114081 ?auto_114083 ) ) ( not ( = ?auto_114082 ?auto_114083 ) ) ( ON ?auto_114083 ?auto_114085 ) ( not ( = ?auto_114078 ?auto_114085 ) ) ( not ( = ?auto_114079 ?auto_114085 ) ) ( not ( = ?auto_114080 ?auto_114085 ) ) ( not ( = ?auto_114081 ?auto_114085 ) ) ( not ( = ?auto_114082 ?auto_114085 ) ) ( not ( = ?auto_114083 ?auto_114085 ) ) ( ON ?auto_114082 ?auto_114083 ) ( ON-TABLE ?auto_114085 ) ( ON ?auto_114078 ?auto_114084 ) ( not ( = ?auto_114078 ?auto_114084 ) ) ( not ( = ?auto_114079 ?auto_114084 ) ) ( not ( = ?auto_114080 ?auto_114084 ) ) ( not ( = ?auto_114081 ?auto_114084 ) ) ( not ( = ?auto_114082 ?auto_114084 ) ) ( not ( = ?auto_114083 ?auto_114084 ) ) ( not ( = ?auto_114085 ?auto_114084 ) ) ( ON ?auto_114079 ?auto_114078 ) ( ON-TABLE ?auto_114084 ) ( ON ?auto_114080 ?auto_114079 ) ( CLEAR ?auto_114080 ) ( HOLDING ?auto_114081 ) ( CLEAR ?auto_114082 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_114085 ?auto_114083 ?auto_114082 ?auto_114081 )
      ( MAKE-6PILE ?auto_114078 ?auto_114079 ?auto_114080 ?auto_114081 ?auto_114082 ?auto_114083 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_114086 - BLOCK
      ?auto_114087 - BLOCK
      ?auto_114088 - BLOCK
      ?auto_114089 - BLOCK
      ?auto_114090 - BLOCK
      ?auto_114091 - BLOCK
    )
    :vars
    (
      ?auto_114093 - BLOCK
      ?auto_114092 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114086 ?auto_114087 ) ) ( not ( = ?auto_114086 ?auto_114088 ) ) ( not ( = ?auto_114086 ?auto_114089 ) ) ( not ( = ?auto_114086 ?auto_114090 ) ) ( not ( = ?auto_114086 ?auto_114091 ) ) ( not ( = ?auto_114087 ?auto_114088 ) ) ( not ( = ?auto_114087 ?auto_114089 ) ) ( not ( = ?auto_114087 ?auto_114090 ) ) ( not ( = ?auto_114087 ?auto_114091 ) ) ( not ( = ?auto_114088 ?auto_114089 ) ) ( not ( = ?auto_114088 ?auto_114090 ) ) ( not ( = ?auto_114088 ?auto_114091 ) ) ( not ( = ?auto_114089 ?auto_114090 ) ) ( not ( = ?auto_114089 ?auto_114091 ) ) ( not ( = ?auto_114090 ?auto_114091 ) ) ( ON ?auto_114091 ?auto_114093 ) ( not ( = ?auto_114086 ?auto_114093 ) ) ( not ( = ?auto_114087 ?auto_114093 ) ) ( not ( = ?auto_114088 ?auto_114093 ) ) ( not ( = ?auto_114089 ?auto_114093 ) ) ( not ( = ?auto_114090 ?auto_114093 ) ) ( not ( = ?auto_114091 ?auto_114093 ) ) ( ON ?auto_114090 ?auto_114091 ) ( ON-TABLE ?auto_114093 ) ( ON ?auto_114086 ?auto_114092 ) ( not ( = ?auto_114086 ?auto_114092 ) ) ( not ( = ?auto_114087 ?auto_114092 ) ) ( not ( = ?auto_114088 ?auto_114092 ) ) ( not ( = ?auto_114089 ?auto_114092 ) ) ( not ( = ?auto_114090 ?auto_114092 ) ) ( not ( = ?auto_114091 ?auto_114092 ) ) ( not ( = ?auto_114093 ?auto_114092 ) ) ( ON ?auto_114087 ?auto_114086 ) ( ON-TABLE ?auto_114092 ) ( ON ?auto_114088 ?auto_114087 ) ( CLEAR ?auto_114090 ) ( ON ?auto_114089 ?auto_114088 ) ( CLEAR ?auto_114089 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_114092 ?auto_114086 ?auto_114087 ?auto_114088 )
      ( MAKE-6PILE ?auto_114086 ?auto_114087 ?auto_114088 ?auto_114089 ?auto_114090 ?auto_114091 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_114094 - BLOCK
      ?auto_114095 - BLOCK
      ?auto_114096 - BLOCK
      ?auto_114097 - BLOCK
      ?auto_114098 - BLOCK
      ?auto_114099 - BLOCK
    )
    :vars
    (
      ?auto_114101 - BLOCK
      ?auto_114100 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114094 ?auto_114095 ) ) ( not ( = ?auto_114094 ?auto_114096 ) ) ( not ( = ?auto_114094 ?auto_114097 ) ) ( not ( = ?auto_114094 ?auto_114098 ) ) ( not ( = ?auto_114094 ?auto_114099 ) ) ( not ( = ?auto_114095 ?auto_114096 ) ) ( not ( = ?auto_114095 ?auto_114097 ) ) ( not ( = ?auto_114095 ?auto_114098 ) ) ( not ( = ?auto_114095 ?auto_114099 ) ) ( not ( = ?auto_114096 ?auto_114097 ) ) ( not ( = ?auto_114096 ?auto_114098 ) ) ( not ( = ?auto_114096 ?auto_114099 ) ) ( not ( = ?auto_114097 ?auto_114098 ) ) ( not ( = ?auto_114097 ?auto_114099 ) ) ( not ( = ?auto_114098 ?auto_114099 ) ) ( ON ?auto_114099 ?auto_114101 ) ( not ( = ?auto_114094 ?auto_114101 ) ) ( not ( = ?auto_114095 ?auto_114101 ) ) ( not ( = ?auto_114096 ?auto_114101 ) ) ( not ( = ?auto_114097 ?auto_114101 ) ) ( not ( = ?auto_114098 ?auto_114101 ) ) ( not ( = ?auto_114099 ?auto_114101 ) ) ( ON-TABLE ?auto_114101 ) ( ON ?auto_114094 ?auto_114100 ) ( not ( = ?auto_114094 ?auto_114100 ) ) ( not ( = ?auto_114095 ?auto_114100 ) ) ( not ( = ?auto_114096 ?auto_114100 ) ) ( not ( = ?auto_114097 ?auto_114100 ) ) ( not ( = ?auto_114098 ?auto_114100 ) ) ( not ( = ?auto_114099 ?auto_114100 ) ) ( not ( = ?auto_114101 ?auto_114100 ) ) ( ON ?auto_114095 ?auto_114094 ) ( ON-TABLE ?auto_114100 ) ( ON ?auto_114096 ?auto_114095 ) ( ON ?auto_114097 ?auto_114096 ) ( CLEAR ?auto_114097 ) ( HOLDING ?auto_114098 ) ( CLEAR ?auto_114099 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_114101 ?auto_114099 ?auto_114098 )
      ( MAKE-6PILE ?auto_114094 ?auto_114095 ?auto_114096 ?auto_114097 ?auto_114098 ?auto_114099 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_114102 - BLOCK
      ?auto_114103 - BLOCK
      ?auto_114104 - BLOCK
      ?auto_114105 - BLOCK
      ?auto_114106 - BLOCK
      ?auto_114107 - BLOCK
    )
    :vars
    (
      ?auto_114108 - BLOCK
      ?auto_114109 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114102 ?auto_114103 ) ) ( not ( = ?auto_114102 ?auto_114104 ) ) ( not ( = ?auto_114102 ?auto_114105 ) ) ( not ( = ?auto_114102 ?auto_114106 ) ) ( not ( = ?auto_114102 ?auto_114107 ) ) ( not ( = ?auto_114103 ?auto_114104 ) ) ( not ( = ?auto_114103 ?auto_114105 ) ) ( not ( = ?auto_114103 ?auto_114106 ) ) ( not ( = ?auto_114103 ?auto_114107 ) ) ( not ( = ?auto_114104 ?auto_114105 ) ) ( not ( = ?auto_114104 ?auto_114106 ) ) ( not ( = ?auto_114104 ?auto_114107 ) ) ( not ( = ?auto_114105 ?auto_114106 ) ) ( not ( = ?auto_114105 ?auto_114107 ) ) ( not ( = ?auto_114106 ?auto_114107 ) ) ( ON ?auto_114107 ?auto_114108 ) ( not ( = ?auto_114102 ?auto_114108 ) ) ( not ( = ?auto_114103 ?auto_114108 ) ) ( not ( = ?auto_114104 ?auto_114108 ) ) ( not ( = ?auto_114105 ?auto_114108 ) ) ( not ( = ?auto_114106 ?auto_114108 ) ) ( not ( = ?auto_114107 ?auto_114108 ) ) ( ON-TABLE ?auto_114108 ) ( ON ?auto_114102 ?auto_114109 ) ( not ( = ?auto_114102 ?auto_114109 ) ) ( not ( = ?auto_114103 ?auto_114109 ) ) ( not ( = ?auto_114104 ?auto_114109 ) ) ( not ( = ?auto_114105 ?auto_114109 ) ) ( not ( = ?auto_114106 ?auto_114109 ) ) ( not ( = ?auto_114107 ?auto_114109 ) ) ( not ( = ?auto_114108 ?auto_114109 ) ) ( ON ?auto_114103 ?auto_114102 ) ( ON-TABLE ?auto_114109 ) ( ON ?auto_114104 ?auto_114103 ) ( ON ?auto_114105 ?auto_114104 ) ( CLEAR ?auto_114107 ) ( ON ?auto_114106 ?auto_114105 ) ( CLEAR ?auto_114106 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_114109 ?auto_114102 ?auto_114103 ?auto_114104 ?auto_114105 )
      ( MAKE-6PILE ?auto_114102 ?auto_114103 ?auto_114104 ?auto_114105 ?auto_114106 ?auto_114107 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_114110 - BLOCK
      ?auto_114111 - BLOCK
      ?auto_114112 - BLOCK
      ?auto_114113 - BLOCK
      ?auto_114114 - BLOCK
      ?auto_114115 - BLOCK
    )
    :vars
    (
      ?auto_114116 - BLOCK
      ?auto_114117 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114110 ?auto_114111 ) ) ( not ( = ?auto_114110 ?auto_114112 ) ) ( not ( = ?auto_114110 ?auto_114113 ) ) ( not ( = ?auto_114110 ?auto_114114 ) ) ( not ( = ?auto_114110 ?auto_114115 ) ) ( not ( = ?auto_114111 ?auto_114112 ) ) ( not ( = ?auto_114111 ?auto_114113 ) ) ( not ( = ?auto_114111 ?auto_114114 ) ) ( not ( = ?auto_114111 ?auto_114115 ) ) ( not ( = ?auto_114112 ?auto_114113 ) ) ( not ( = ?auto_114112 ?auto_114114 ) ) ( not ( = ?auto_114112 ?auto_114115 ) ) ( not ( = ?auto_114113 ?auto_114114 ) ) ( not ( = ?auto_114113 ?auto_114115 ) ) ( not ( = ?auto_114114 ?auto_114115 ) ) ( not ( = ?auto_114110 ?auto_114116 ) ) ( not ( = ?auto_114111 ?auto_114116 ) ) ( not ( = ?auto_114112 ?auto_114116 ) ) ( not ( = ?auto_114113 ?auto_114116 ) ) ( not ( = ?auto_114114 ?auto_114116 ) ) ( not ( = ?auto_114115 ?auto_114116 ) ) ( ON-TABLE ?auto_114116 ) ( ON ?auto_114110 ?auto_114117 ) ( not ( = ?auto_114110 ?auto_114117 ) ) ( not ( = ?auto_114111 ?auto_114117 ) ) ( not ( = ?auto_114112 ?auto_114117 ) ) ( not ( = ?auto_114113 ?auto_114117 ) ) ( not ( = ?auto_114114 ?auto_114117 ) ) ( not ( = ?auto_114115 ?auto_114117 ) ) ( not ( = ?auto_114116 ?auto_114117 ) ) ( ON ?auto_114111 ?auto_114110 ) ( ON-TABLE ?auto_114117 ) ( ON ?auto_114112 ?auto_114111 ) ( ON ?auto_114113 ?auto_114112 ) ( ON ?auto_114114 ?auto_114113 ) ( CLEAR ?auto_114114 ) ( HOLDING ?auto_114115 ) ( CLEAR ?auto_114116 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_114116 ?auto_114115 )
      ( MAKE-6PILE ?auto_114110 ?auto_114111 ?auto_114112 ?auto_114113 ?auto_114114 ?auto_114115 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_114118 - BLOCK
      ?auto_114119 - BLOCK
      ?auto_114120 - BLOCK
      ?auto_114121 - BLOCK
      ?auto_114122 - BLOCK
      ?auto_114123 - BLOCK
    )
    :vars
    (
      ?auto_114125 - BLOCK
      ?auto_114124 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114118 ?auto_114119 ) ) ( not ( = ?auto_114118 ?auto_114120 ) ) ( not ( = ?auto_114118 ?auto_114121 ) ) ( not ( = ?auto_114118 ?auto_114122 ) ) ( not ( = ?auto_114118 ?auto_114123 ) ) ( not ( = ?auto_114119 ?auto_114120 ) ) ( not ( = ?auto_114119 ?auto_114121 ) ) ( not ( = ?auto_114119 ?auto_114122 ) ) ( not ( = ?auto_114119 ?auto_114123 ) ) ( not ( = ?auto_114120 ?auto_114121 ) ) ( not ( = ?auto_114120 ?auto_114122 ) ) ( not ( = ?auto_114120 ?auto_114123 ) ) ( not ( = ?auto_114121 ?auto_114122 ) ) ( not ( = ?auto_114121 ?auto_114123 ) ) ( not ( = ?auto_114122 ?auto_114123 ) ) ( not ( = ?auto_114118 ?auto_114125 ) ) ( not ( = ?auto_114119 ?auto_114125 ) ) ( not ( = ?auto_114120 ?auto_114125 ) ) ( not ( = ?auto_114121 ?auto_114125 ) ) ( not ( = ?auto_114122 ?auto_114125 ) ) ( not ( = ?auto_114123 ?auto_114125 ) ) ( ON-TABLE ?auto_114125 ) ( ON ?auto_114118 ?auto_114124 ) ( not ( = ?auto_114118 ?auto_114124 ) ) ( not ( = ?auto_114119 ?auto_114124 ) ) ( not ( = ?auto_114120 ?auto_114124 ) ) ( not ( = ?auto_114121 ?auto_114124 ) ) ( not ( = ?auto_114122 ?auto_114124 ) ) ( not ( = ?auto_114123 ?auto_114124 ) ) ( not ( = ?auto_114125 ?auto_114124 ) ) ( ON ?auto_114119 ?auto_114118 ) ( ON-TABLE ?auto_114124 ) ( ON ?auto_114120 ?auto_114119 ) ( ON ?auto_114121 ?auto_114120 ) ( ON ?auto_114122 ?auto_114121 ) ( CLEAR ?auto_114125 ) ( ON ?auto_114123 ?auto_114122 ) ( CLEAR ?auto_114123 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_114124 ?auto_114118 ?auto_114119 ?auto_114120 ?auto_114121 ?auto_114122 )
      ( MAKE-6PILE ?auto_114118 ?auto_114119 ?auto_114120 ?auto_114121 ?auto_114122 ?auto_114123 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_114126 - BLOCK
      ?auto_114127 - BLOCK
      ?auto_114128 - BLOCK
      ?auto_114129 - BLOCK
      ?auto_114130 - BLOCK
      ?auto_114131 - BLOCK
    )
    :vars
    (
      ?auto_114132 - BLOCK
      ?auto_114133 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114126 ?auto_114127 ) ) ( not ( = ?auto_114126 ?auto_114128 ) ) ( not ( = ?auto_114126 ?auto_114129 ) ) ( not ( = ?auto_114126 ?auto_114130 ) ) ( not ( = ?auto_114126 ?auto_114131 ) ) ( not ( = ?auto_114127 ?auto_114128 ) ) ( not ( = ?auto_114127 ?auto_114129 ) ) ( not ( = ?auto_114127 ?auto_114130 ) ) ( not ( = ?auto_114127 ?auto_114131 ) ) ( not ( = ?auto_114128 ?auto_114129 ) ) ( not ( = ?auto_114128 ?auto_114130 ) ) ( not ( = ?auto_114128 ?auto_114131 ) ) ( not ( = ?auto_114129 ?auto_114130 ) ) ( not ( = ?auto_114129 ?auto_114131 ) ) ( not ( = ?auto_114130 ?auto_114131 ) ) ( not ( = ?auto_114126 ?auto_114132 ) ) ( not ( = ?auto_114127 ?auto_114132 ) ) ( not ( = ?auto_114128 ?auto_114132 ) ) ( not ( = ?auto_114129 ?auto_114132 ) ) ( not ( = ?auto_114130 ?auto_114132 ) ) ( not ( = ?auto_114131 ?auto_114132 ) ) ( ON ?auto_114126 ?auto_114133 ) ( not ( = ?auto_114126 ?auto_114133 ) ) ( not ( = ?auto_114127 ?auto_114133 ) ) ( not ( = ?auto_114128 ?auto_114133 ) ) ( not ( = ?auto_114129 ?auto_114133 ) ) ( not ( = ?auto_114130 ?auto_114133 ) ) ( not ( = ?auto_114131 ?auto_114133 ) ) ( not ( = ?auto_114132 ?auto_114133 ) ) ( ON ?auto_114127 ?auto_114126 ) ( ON-TABLE ?auto_114133 ) ( ON ?auto_114128 ?auto_114127 ) ( ON ?auto_114129 ?auto_114128 ) ( ON ?auto_114130 ?auto_114129 ) ( ON ?auto_114131 ?auto_114130 ) ( CLEAR ?auto_114131 ) ( HOLDING ?auto_114132 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_114132 )
      ( MAKE-6PILE ?auto_114126 ?auto_114127 ?auto_114128 ?auto_114129 ?auto_114130 ?auto_114131 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_114134 - BLOCK
      ?auto_114135 - BLOCK
      ?auto_114136 - BLOCK
      ?auto_114137 - BLOCK
      ?auto_114138 - BLOCK
      ?auto_114139 - BLOCK
    )
    :vars
    (
      ?auto_114141 - BLOCK
      ?auto_114140 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114134 ?auto_114135 ) ) ( not ( = ?auto_114134 ?auto_114136 ) ) ( not ( = ?auto_114134 ?auto_114137 ) ) ( not ( = ?auto_114134 ?auto_114138 ) ) ( not ( = ?auto_114134 ?auto_114139 ) ) ( not ( = ?auto_114135 ?auto_114136 ) ) ( not ( = ?auto_114135 ?auto_114137 ) ) ( not ( = ?auto_114135 ?auto_114138 ) ) ( not ( = ?auto_114135 ?auto_114139 ) ) ( not ( = ?auto_114136 ?auto_114137 ) ) ( not ( = ?auto_114136 ?auto_114138 ) ) ( not ( = ?auto_114136 ?auto_114139 ) ) ( not ( = ?auto_114137 ?auto_114138 ) ) ( not ( = ?auto_114137 ?auto_114139 ) ) ( not ( = ?auto_114138 ?auto_114139 ) ) ( not ( = ?auto_114134 ?auto_114141 ) ) ( not ( = ?auto_114135 ?auto_114141 ) ) ( not ( = ?auto_114136 ?auto_114141 ) ) ( not ( = ?auto_114137 ?auto_114141 ) ) ( not ( = ?auto_114138 ?auto_114141 ) ) ( not ( = ?auto_114139 ?auto_114141 ) ) ( ON ?auto_114134 ?auto_114140 ) ( not ( = ?auto_114134 ?auto_114140 ) ) ( not ( = ?auto_114135 ?auto_114140 ) ) ( not ( = ?auto_114136 ?auto_114140 ) ) ( not ( = ?auto_114137 ?auto_114140 ) ) ( not ( = ?auto_114138 ?auto_114140 ) ) ( not ( = ?auto_114139 ?auto_114140 ) ) ( not ( = ?auto_114141 ?auto_114140 ) ) ( ON ?auto_114135 ?auto_114134 ) ( ON-TABLE ?auto_114140 ) ( ON ?auto_114136 ?auto_114135 ) ( ON ?auto_114137 ?auto_114136 ) ( ON ?auto_114138 ?auto_114137 ) ( ON ?auto_114139 ?auto_114138 ) ( ON ?auto_114141 ?auto_114139 ) ( CLEAR ?auto_114141 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_114140 ?auto_114134 ?auto_114135 ?auto_114136 ?auto_114137 ?auto_114138 ?auto_114139 )
      ( MAKE-6PILE ?auto_114134 ?auto_114135 ?auto_114136 ?auto_114137 ?auto_114138 ?auto_114139 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_114156 - BLOCK
      ?auto_114157 - BLOCK
      ?auto_114158 - BLOCK
      ?auto_114159 - BLOCK
      ?auto_114160 - BLOCK
      ?auto_114161 - BLOCK
      ?auto_114162 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_114161 ) ( ON-TABLE ?auto_114156 ) ( ON ?auto_114157 ?auto_114156 ) ( ON ?auto_114158 ?auto_114157 ) ( ON ?auto_114159 ?auto_114158 ) ( ON ?auto_114160 ?auto_114159 ) ( ON ?auto_114161 ?auto_114160 ) ( not ( = ?auto_114156 ?auto_114157 ) ) ( not ( = ?auto_114156 ?auto_114158 ) ) ( not ( = ?auto_114156 ?auto_114159 ) ) ( not ( = ?auto_114156 ?auto_114160 ) ) ( not ( = ?auto_114156 ?auto_114161 ) ) ( not ( = ?auto_114156 ?auto_114162 ) ) ( not ( = ?auto_114157 ?auto_114158 ) ) ( not ( = ?auto_114157 ?auto_114159 ) ) ( not ( = ?auto_114157 ?auto_114160 ) ) ( not ( = ?auto_114157 ?auto_114161 ) ) ( not ( = ?auto_114157 ?auto_114162 ) ) ( not ( = ?auto_114158 ?auto_114159 ) ) ( not ( = ?auto_114158 ?auto_114160 ) ) ( not ( = ?auto_114158 ?auto_114161 ) ) ( not ( = ?auto_114158 ?auto_114162 ) ) ( not ( = ?auto_114159 ?auto_114160 ) ) ( not ( = ?auto_114159 ?auto_114161 ) ) ( not ( = ?auto_114159 ?auto_114162 ) ) ( not ( = ?auto_114160 ?auto_114161 ) ) ( not ( = ?auto_114160 ?auto_114162 ) ) ( not ( = ?auto_114161 ?auto_114162 ) ) ( ON-TABLE ?auto_114162 ) ( CLEAR ?auto_114162 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_114162 )
      ( MAKE-7PILE ?auto_114156 ?auto_114157 ?auto_114158 ?auto_114159 ?auto_114160 ?auto_114161 ?auto_114162 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_114163 - BLOCK
      ?auto_114164 - BLOCK
      ?auto_114165 - BLOCK
      ?auto_114166 - BLOCK
      ?auto_114167 - BLOCK
      ?auto_114168 - BLOCK
      ?auto_114169 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_114163 ) ( ON ?auto_114164 ?auto_114163 ) ( ON ?auto_114165 ?auto_114164 ) ( ON ?auto_114166 ?auto_114165 ) ( ON ?auto_114167 ?auto_114166 ) ( not ( = ?auto_114163 ?auto_114164 ) ) ( not ( = ?auto_114163 ?auto_114165 ) ) ( not ( = ?auto_114163 ?auto_114166 ) ) ( not ( = ?auto_114163 ?auto_114167 ) ) ( not ( = ?auto_114163 ?auto_114168 ) ) ( not ( = ?auto_114163 ?auto_114169 ) ) ( not ( = ?auto_114164 ?auto_114165 ) ) ( not ( = ?auto_114164 ?auto_114166 ) ) ( not ( = ?auto_114164 ?auto_114167 ) ) ( not ( = ?auto_114164 ?auto_114168 ) ) ( not ( = ?auto_114164 ?auto_114169 ) ) ( not ( = ?auto_114165 ?auto_114166 ) ) ( not ( = ?auto_114165 ?auto_114167 ) ) ( not ( = ?auto_114165 ?auto_114168 ) ) ( not ( = ?auto_114165 ?auto_114169 ) ) ( not ( = ?auto_114166 ?auto_114167 ) ) ( not ( = ?auto_114166 ?auto_114168 ) ) ( not ( = ?auto_114166 ?auto_114169 ) ) ( not ( = ?auto_114167 ?auto_114168 ) ) ( not ( = ?auto_114167 ?auto_114169 ) ) ( not ( = ?auto_114168 ?auto_114169 ) ) ( ON-TABLE ?auto_114169 ) ( CLEAR ?auto_114169 ) ( HOLDING ?auto_114168 ) ( CLEAR ?auto_114167 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_114163 ?auto_114164 ?auto_114165 ?auto_114166 ?auto_114167 ?auto_114168 )
      ( MAKE-7PILE ?auto_114163 ?auto_114164 ?auto_114165 ?auto_114166 ?auto_114167 ?auto_114168 ?auto_114169 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_114170 - BLOCK
      ?auto_114171 - BLOCK
      ?auto_114172 - BLOCK
      ?auto_114173 - BLOCK
      ?auto_114174 - BLOCK
      ?auto_114175 - BLOCK
      ?auto_114176 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_114170 ) ( ON ?auto_114171 ?auto_114170 ) ( ON ?auto_114172 ?auto_114171 ) ( ON ?auto_114173 ?auto_114172 ) ( ON ?auto_114174 ?auto_114173 ) ( not ( = ?auto_114170 ?auto_114171 ) ) ( not ( = ?auto_114170 ?auto_114172 ) ) ( not ( = ?auto_114170 ?auto_114173 ) ) ( not ( = ?auto_114170 ?auto_114174 ) ) ( not ( = ?auto_114170 ?auto_114175 ) ) ( not ( = ?auto_114170 ?auto_114176 ) ) ( not ( = ?auto_114171 ?auto_114172 ) ) ( not ( = ?auto_114171 ?auto_114173 ) ) ( not ( = ?auto_114171 ?auto_114174 ) ) ( not ( = ?auto_114171 ?auto_114175 ) ) ( not ( = ?auto_114171 ?auto_114176 ) ) ( not ( = ?auto_114172 ?auto_114173 ) ) ( not ( = ?auto_114172 ?auto_114174 ) ) ( not ( = ?auto_114172 ?auto_114175 ) ) ( not ( = ?auto_114172 ?auto_114176 ) ) ( not ( = ?auto_114173 ?auto_114174 ) ) ( not ( = ?auto_114173 ?auto_114175 ) ) ( not ( = ?auto_114173 ?auto_114176 ) ) ( not ( = ?auto_114174 ?auto_114175 ) ) ( not ( = ?auto_114174 ?auto_114176 ) ) ( not ( = ?auto_114175 ?auto_114176 ) ) ( ON-TABLE ?auto_114176 ) ( CLEAR ?auto_114174 ) ( ON ?auto_114175 ?auto_114176 ) ( CLEAR ?auto_114175 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_114176 )
      ( MAKE-7PILE ?auto_114170 ?auto_114171 ?auto_114172 ?auto_114173 ?auto_114174 ?auto_114175 ?auto_114176 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_114177 - BLOCK
      ?auto_114178 - BLOCK
      ?auto_114179 - BLOCK
      ?auto_114180 - BLOCK
      ?auto_114181 - BLOCK
      ?auto_114182 - BLOCK
      ?auto_114183 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_114177 ) ( ON ?auto_114178 ?auto_114177 ) ( ON ?auto_114179 ?auto_114178 ) ( ON ?auto_114180 ?auto_114179 ) ( not ( = ?auto_114177 ?auto_114178 ) ) ( not ( = ?auto_114177 ?auto_114179 ) ) ( not ( = ?auto_114177 ?auto_114180 ) ) ( not ( = ?auto_114177 ?auto_114181 ) ) ( not ( = ?auto_114177 ?auto_114182 ) ) ( not ( = ?auto_114177 ?auto_114183 ) ) ( not ( = ?auto_114178 ?auto_114179 ) ) ( not ( = ?auto_114178 ?auto_114180 ) ) ( not ( = ?auto_114178 ?auto_114181 ) ) ( not ( = ?auto_114178 ?auto_114182 ) ) ( not ( = ?auto_114178 ?auto_114183 ) ) ( not ( = ?auto_114179 ?auto_114180 ) ) ( not ( = ?auto_114179 ?auto_114181 ) ) ( not ( = ?auto_114179 ?auto_114182 ) ) ( not ( = ?auto_114179 ?auto_114183 ) ) ( not ( = ?auto_114180 ?auto_114181 ) ) ( not ( = ?auto_114180 ?auto_114182 ) ) ( not ( = ?auto_114180 ?auto_114183 ) ) ( not ( = ?auto_114181 ?auto_114182 ) ) ( not ( = ?auto_114181 ?auto_114183 ) ) ( not ( = ?auto_114182 ?auto_114183 ) ) ( ON-TABLE ?auto_114183 ) ( ON ?auto_114182 ?auto_114183 ) ( CLEAR ?auto_114182 ) ( HOLDING ?auto_114181 ) ( CLEAR ?auto_114180 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_114177 ?auto_114178 ?auto_114179 ?auto_114180 ?auto_114181 )
      ( MAKE-7PILE ?auto_114177 ?auto_114178 ?auto_114179 ?auto_114180 ?auto_114181 ?auto_114182 ?auto_114183 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_114184 - BLOCK
      ?auto_114185 - BLOCK
      ?auto_114186 - BLOCK
      ?auto_114187 - BLOCK
      ?auto_114188 - BLOCK
      ?auto_114189 - BLOCK
      ?auto_114190 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_114184 ) ( ON ?auto_114185 ?auto_114184 ) ( ON ?auto_114186 ?auto_114185 ) ( ON ?auto_114187 ?auto_114186 ) ( not ( = ?auto_114184 ?auto_114185 ) ) ( not ( = ?auto_114184 ?auto_114186 ) ) ( not ( = ?auto_114184 ?auto_114187 ) ) ( not ( = ?auto_114184 ?auto_114188 ) ) ( not ( = ?auto_114184 ?auto_114189 ) ) ( not ( = ?auto_114184 ?auto_114190 ) ) ( not ( = ?auto_114185 ?auto_114186 ) ) ( not ( = ?auto_114185 ?auto_114187 ) ) ( not ( = ?auto_114185 ?auto_114188 ) ) ( not ( = ?auto_114185 ?auto_114189 ) ) ( not ( = ?auto_114185 ?auto_114190 ) ) ( not ( = ?auto_114186 ?auto_114187 ) ) ( not ( = ?auto_114186 ?auto_114188 ) ) ( not ( = ?auto_114186 ?auto_114189 ) ) ( not ( = ?auto_114186 ?auto_114190 ) ) ( not ( = ?auto_114187 ?auto_114188 ) ) ( not ( = ?auto_114187 ?auto_114189 ) ) ( not ( = ?auto_114187 ?auto_114190 ) ) ( not ( = ?auto_114188 ?auto_114189 ) ) ( not ( = ?auto_114188 ?auto_114190 ) ) ( not ( = ?auto_114189 ?auto_114190 ) ) ( ON-TABLE ?auto_114190 ) ( ON ?auto_114189 ?auto_114190 ) ( CLEAR ?auto_114187 ) ( ON ?auto_114188 ?auto_114189 ) ( CLEAR ?auto_114188 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_114190 ?auto_114189 )
      ( MAKE-7PILE ?auto_114184 ?auto_114185 ?auto_114186 ?auto_114187 ?auto_114188 ?auto_114189 ?auto_114190 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_114191 - BLOCK
      ?auto_114192 - BLOCK
      ?auto_114193 - BLOCK
      ?auto_114194 - BLOCK
      ?auto_114195 - BLOCK
      ?auto_114196 - BLOCK
      ?auto_114197 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_114191 ) ( ON ?auto_114192 ?auto_114191 ) ( ON ?auto_114193 ?auto_114192 ) ( not ( = ?auto_114191 ?auto_114192 ) ) ( not ( = ?auto_114191 ?auto_114193 ) ) ( not ( = ?auto_114191 ?auto_114194 ) ) ( not ( = ?auto_114191 ?auto_114195 ) ) ( not ( = ?auto_114191 ?auto_114196 ) ) ( not ( = ?auto_114191 ?auto_114197 ) ) ( not ( = ?auto_114192 ?auto_114193 ) ) ( not ( = ?auto_114192 ?auto_114194 ) ) ( not ( = ?auto_114192 ?auto_114195 ) ) ( not ( = ?auto_114192 ?auto_114196 ) ) ( not ( = ?auto_114192 ?auto_114197 ) ) ( not ( = ?auto_114193 ?auto_114194 ) ) ( not ( = ?auto_114193 ?auto_114195 ) ) ( not ( = ?auto_114193 ?auto_114196 ) ) ( not ( = ?auto_114193 ?auto_114197 ) ) ( not ( = ?auto_114194 ?auto_114195 ) ) ( not ( = ?auto_114194 ?auto_114196 ) ) ( not ( = ?auto_114194 ?auto_114197 ) ) ( not ( = ?auto_114195 ?auto_114196 ) ) ( not ( = ?auto_114195 ?auto_114197 ) ) ( not ( = ?auto_114196 ?auto_114197 ) ) ( ON-TABLE ?auto_114197 ) ( ON ?auto_114196 ?auto_114197 ) ( ON ?auto_114195 ?auto_114196 ) ( CLEAR ?auto_114195 ) ( HOLDING ?auto_114194 ) ( CLEAR ?auto_114193 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_114191 ?auto_114192 ?auto_114193 ?auto_114194 )
      ( MAKE-7PILE ?auto_114191 ?auto_114192 ?auto_114193 ?auto_114194 ?auto_114195 ?auto_114196 ?auto_114197 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_114198 - BLOCK
      ?auto_114199 - BLOCK
      ?auto_114200 - BLOCK
      ?auto_114201 - BLOCK
      ?auto_114202 - BLOCK
      ?auto_114203 - BLOCK
      ?auto_114204 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_114198 ) ( ON ?auto_114199 ?auto_114198 ) ( ON ?auto_114200 ?auto_114199 ) ( not ( = ?auto_114198 ?auto_114199 ) ) ( not ( = ?auto_114198 ?auto_114200 ) ) ( not ( = ?auto_114198 ?auto_114201 ) ) ( not ( = ?auto_114198 ?auto_114202 ) ) ( not ( = ?auto_114198 ?auto_114203 ) ) ( not ( = ?auto_114198 ?auto_114204 ) ) ( not ( = ?auto_114199 ?auto_114200 ) ) ( not ( = ?auto_114199 ?auto_114201 ) ) ( not ( = ?auto_114199 ?auto_114202 ) ) ( not ( = ?auto_114199 ?auto_114203 ) ) ( not ( = ?auto_114199 ?auto_114204 ) ) ( not ( = ?auto_114200 ?auto_114201 ) ) ( not ( = ?auto_114200 ?auto_114202 ) ) ( not ( = ?auto_114200 ?auto_114203 ) ) ( not ( = ?auto_114200 ?auto_114204 ) ) ( not ( = ?auto_114201 ?auto_114202 ) ) ( not ( = ?auto_114201 ?auto_114203 ) ) ( not ( = ?auto_114201 ?auto_114204 ) ) ( not ( = ?auto_114202 ?auto_114203 ) ) ( not ( = ?auto_114202 ?auto_114204 ) ) ( not ( = ?auto_114203 ?auto_114204 ) ) ( ON-TABLE ?auto_114204 ) ( ON ?auto_114203 ?auto_114204 ) ( ON ?auto_114202 ?auto_114203 ) ( CLEAR ?auto_114200 ) ( ON ?auto_114201 ?auto_114202 ) ( CLEAR ?auto_114201 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_114204 ?auto_114203 ?auto_114202 )
      ( MAKE-7PILE ?auto_114198 ?auto_114199 ?auto_114200 ?auto_114201 ?auto_114202 ?auto_114203 ?auto_114204 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_114205 - BLOCK
      ?auto_114206 - BLOCK
      ?auto_114207 - BLOCK
      ?auto_114208 - BLOCK
      ?auto_114209 - BLOCK
      ?auto_114210 - BLOCK
      ?auto_114211 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_114205 ) ( ON ?auto_114206 ?auto_114205 ) ( not ( = ?auto_114205 ?auto_114206 ) ) ( not ( = ?auto_114205 ?auto_114207 ) ) ( not ( = ?auto_114205 ?auto_114208 ) ) ( not ( = ?auto_114205 ?auto_114209 ) ) ( not ( = ?auto_114205 ?auto_114210 ) ) ( not ( = ?auto_114205 ?auto_114211 ) ) ( not ( = ?auto_114206 ?auto_114207 ) ) ( not ( = ?auto_114206 ?auto_114208 ) ) ( not ( = ?auto_114206 ?auto_114209 ) ) ( not ( = ?auto_114206 ?auto_114210 ) ) ( not ( = ?auto_114206 ?auto_114211 ) ) ( not ( = ?auto_114207 ?auto_114208 ) ) ( not ( = ?auto_114207 ?auto_114209 ) ) ( not ( = ?auto_114207 ?auto_114210 ) ) ( not ( = ?auto_114207 ?auto_114211 ) ) ( not ( = ?auto_114208 ?auto_114209 ) ) ( not ( = ?auto_114208 ?auto_114210 ) ) ( not ( = ?auto_114208 ?auto_114211 ) ) ( not ( = ?auto_114209 ?auto_114210 ) ) ( not ( = ?auto_114209 ?auto_114211 ) ) ( not ( = ?auto_114210 ?auto_114211 ) ) ( ON-TABLE ?auto_114211 ) ( ON ?auto_114210 ?auto_114211 ) ( ON ?auto_114209 ?auto_114210 ) ( ON ?auto_114208 ?auto_114209 ) ( CLEAR ?auto_114208 ) ( HOLDING ?auto_114207 ) ( CLEAR ?auto_114206 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_114205 ?auto_114206 ?auto_114207 )
      ( MAKE-7PILE ?auto_114205 ?auto_114206 ?auto_114207 ?auto_114208 ?auto_114209 ?auto_114210 ?auto_114211 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_114212 - BLOCK
      ?auto_114213 - BLOCK
      ?auto_114214 - BLOCK
      ?auto_114215 - BLOCK
      ?auto_114216 - BLOCK
      ?auto_114217 - BLOCK
      ?auto_114218 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_114212 ) ( ON ?auto_114213 ?auto_114212 ) ( not ( = ?auto_114212 ?auto_114213 ) ) ( not ( = ?auto_114212 ?auto_114214 ) ) ( not ( = ?auto_114212 ?auto_114215 ) ) ( not ( = ?auto_114212 ?auto_114216 ) ) ( not ( = ?auto_114212 ?auto_114217 ) ) ( not ( = ?auto_114212 ?auto_114218 ) ) ( not ( = ?auto_114213 ?auto_114214 ) ) ( not ( = ?auto_114213 ?auto_114215 ) ) ( not ( = ?auto_114213 ?auto_114216 ) ) ( not ( = ?auto_114213 ?auto_114217 ) ) ( not ( = ?auto_114213 ?auto_114218 ) ) ( not ( = ?auto_114214 ?auto_114215 ) ) ( not ( = ?auto_114214 ?auto_114216 ) ) ( not ( = ?auto_114214 ?auto_114217 ) ) ( not ( = ?auto_114214 ?auto_114218 ) ) ( not ( = ?auto_114215 ?auto_114216 ) ) ( not ( = ?auto_114215 ?auto_114217 ) ) ( not ( = ?auto_114215 ?auto_114218 ) ) ( not ( = ?auto_114216 ?auto_114217 ) ) ( not ( = ?auto_114216 ?auto_114218 ) ) ( not ( = ?auto_114217 ?auto_114218 ) ) ( ON-TABLE ?auto_114218 ) ( ON ?auto_114217 ?auto_114218 ) ( ON ?auto_114216 ?auto_114217 ) ( ON ?auto_114215 ?auto_114216 ) ( CLEAR ?auto_114213 ) ( ON ?auto_114214 ?auto_114215 ) ( CLEAR ?auto_114214 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_114218 ?auto_114217 ?auto_114216 ?auto_114215 )
      ( MAKE-7PILE ?auto_114212 ?auto_114213 ?auto_114214 ?auto_114215 ?auto_114216 ?auto_114217 ?auto_114218 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_114219 - BLOCK
      ?auto_114220 - BLOCK
      ?auto_114221 - BLOCK
      ?auto_114222 - BLOCK
      ?auto_114223 - BLOCK
      ?auto_114224 - BLOCK
      ?auto_114225 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_114219 ) ( not ( = ?auto_114219 ?auto_114220 ) ) ( not ( = ?auto_114219 ?auto_114221 ) ) ( not ( = ?auto_114219 ?auto_114222 ) ) ( not ( = ?auto_114219 ?auto_114223 ) ) ( not ( = ?auto_114219 ?auto_114224 ) ) ( not ( = ?auto_114219 ?auto_114225 ) ) ( not ( = ?auto_114220 ?auto_114221 ) ) ( not ( = ?auto_114220 ?auto_114222 ) ) ( not ( = ?auto_114220 ?auto_114223 ) ) ( not ( = ?auto_114220 ?auto_114224 ) ) ( not ( = ?auto_114220 ?auto_114225 ) ) ( not ( = ?auto_114221 ?auto_114222 ) ) ( not ( = ?auto_114221 ?auto_114223 ) ) ( not ( = ?auto_114221 ?auto_114224 ) ) ( not ( = ?auto_114221 ?auto_114225 ) ) ( not ( = ?auto_114222 ?auto_114223 ) ) ( not ( = ?auto_114222 ?auto_114224 ) ) ( not ( = ?auto_114222 ?auto_114225 ) ) ( not ( = ?auto_114223 ?auto_114224 ) ) ( not ( = ?auto_114223 ?auto_114225 ) ) ( not ( = ?auto_114224 ?auto_114225 ) ) ( ON-TABLE ?auto_114225 ) ( ON ?auto_114224 ?auto_114225 ) ( ON ?auto_114223 ?auto_114224 ) ( ON ?auto_114222 ?auto_114223 ) ( ON ?auto_114221 ?auto_114222 ) ( CLEAR ?auto_114221 ) ( HOLDING ?auto_114220 ) ( CLEAR ?auto_114219 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_114219 ?auto_114220 )
      ( MAKE-7PILE ?auto_114219 ?auto_114220 ?auto_114221 ?auto_114222 ?auto_114223 ?auto_114224 ?auto_114225 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_114226 - BLOCK
      ?auto_114227 - BLOCK
      ?auto_114228 - BLOCK
      ?auto_114229 - BLOCK
      ?auto_114230 - BLOCK
      ?auto_114231 - BLOCK
      ?auto_114232 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_114226 ) ( not ( = ?auto_114226 ?auto_114227 ) ) ( not ( = ?auto_114226 ?auto_114228 ) ) ( not ( = ?auto_114226 ?auto_114229 ) ) ( not ( = ?auto_114226 ?auto_114230 ) ) ( not ( = ?auto_114226 ?auto_114231 ) ) ( not ( = ?auto_114226 ?auto_114232 ) ) ( not ( = ?auto_114227 ?auto_114228 ) ) ( not ( = ?auto_114227 ?auto_114229 ) ) ( not ( = ?auto_114227 ?auto_114230 ) ) ( not ( = ?auto_114227 ?auto_114231 ) ) ( not ( = ?auto_114227 ?auto_114232 ) ) ( not ( = ?auto_114228 ?auto_114229 ) ) ( not ( = ?auto_114228 ?auto_114230 ) ) ( not ( = ?auto_114228 ?auto_114231 ) ) ( not ( = ?auto_114228 ?auto_114232 ) ) ( not ( = ?auto_114229 ?auto_114230 ) ) ( not ( = ?auto_114229 ?auto_114231 ) ) ( not ( = ?auto_114229 ?auto_114232 ) ) ( not ( = ?auto_114230 ?auto_114231 ) ) ( not ( = ?auto_114230 ?auto_114232 ) ) ( not ( = ?auto_114231 ?auto_114232 ) ) ( ON-TABLE ?auto_114232 ) ( ON ?auto_114231 ?auto_114232 ) ( ON ?auto_114230 ?auto_114231 ) ( ON ?auto_114229 ?auto_114230 ) ( ON ?auto_114228 ?auto_114229 ) ( CLEAR ?auto_114226 ) ( ON ?auto_114227 ?auto_114228 ) ( CLEAR ?auto_114227 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_114232 ?auto_114231 ?auto_114230 ?auto_114229 ?auto_114228 )
      ( MAKE-7PILE ?auto_114226 ?auto_114227 ?auto_114228 ?auto_114229 ?auto_114230 ?auto_114231 ?auto_114232 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_114233 - BLOCK
      ?auto_114234 - BLOCK
      ?auto_114235 - BLOCK
      ?auto_114236 - BLOCK
      ?auto_114237 - BLOCK
      ?auto_114238 - BLOCK
      ?auto_114239 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114233 ?auto_114234 ) ) ( not ( = ?auto_114233 ?auto_114235 ) ) ( not ( = ?auto_114233 ?auto_114236 ) ) ( not ( = ?auto_114233 ?auto_114237 ) ) ( not ( = ?auto_114233 ?auto_114238 ) ) ( not ( = ?auto_114233 ?auto_114239 ) ) ( not ( = ?auto_114234 ?auto_114235 ) ) ( not ( = ?auto_114234 ?auto_114236 ) ) ( not ( = ?auto_114234 ?auto_114237 ) ) ( not ( = ?auto_114234 ?auto_114238 ) ) ( not ( = ?auto_114234 ?auto_114239 ) ) ( not ( = ?auto_114235 ?auto_114236 ) ) ( not ( = ?auto_114235 ?auto_114237 ) ) ( not ( = ?auto_114235 ?auto_114238 ) ) ( not ( = ?auto_114235 ?auto_114239 ) ) ( not ( = ?auto_114236 ?auto_114237 ) ) ( not ( = ?auto_114236 ?auto_114238 ) ) ( not ( = ?auto_114236 ?auto_114239 ) ) ( not ( = ?auto_114237 ?auto_114238 ) ) ( not ( = ?auto_114237 ?auto_114239 ) ) ( not ( = ?auto_114238 ?auto_114239 ) ) ( ON-TABLE ?auto_114239 ) ( ON ?auto_114238 ?auto_114239 ) ( ON ?auto_114237 ?auto_114238 ) ( ON ?auto_114236 ?auto_114237 ) ( ON ?auto_114235 ?auto_114236 ) ( ON ?auto_114234 ?auto_114235 ) ( CLEAR ?auto_114234 ) ( HOLDING ?auto_114233 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_114233 )
      ( MAKE-7PILE ?auto_114233 ?auto_114234 ?auto_114235 ?auto_114236 ?auto_114237 ?auto_114238 ?auto_114239 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_114240 - BLOCK
      ?auto_114241 - BLOCK
      ?auto_114242 - BLOCK
      ?auto_114243 - BLOCK
      ?auto_114244 - BLOCK
      ?auto_114245 - BLOCK
      ?auto_114246 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114240 ?auto_114241 ) ) ( not ( = ?auto_114240 ?auto_114242 ) ) ( not ( = ?auto_114240 ?auto_114243 ) ) ( not ( = ?auto_114240 ?auto_114244 ) ) ( not ( = ?auto_114240 ?auto_114245 ) ) ( not ( = ?auto_114240 ?auto_114246 ) ) ( not ( = ?auto_114241 ?auto_114242 ) ) ( not ( = ?auto_114241 ?auto_114243 ) ) ( not ( = ?auto_114241 ?auto_114244 ) ) ( not ( = ?auto_114241 ?auto_114245 ) ) ( not ( = ?auto_114241 ?auto_114246 ) ) ( not ( = ?auto_114242 ?auto_114243 ) ) ( not ( = ?auto_114242 ?auto_114244 ) ) ( not ( = ?auto_114242 ?auto_114245 ) ) ( not ( = ?auto_114242 ?auto_114246 ) ) ( not ( = ?auto_114243 ?auto_114244 ) ) ( not ( = ?auto_114243 ?auto_114245 ) ) ( not ( = ?auto_114243 ?auto_114246 ) ) ( not ( = ?auto_114244 ?auto_114245 ) ) ( not ( = ?auto_114244 ?auto_114246 ) ) ( not ( = ?auto_114245 ?auto_114246 ) ) ( ON-TABLE ?auto_114246 ) ( ON ?auto_114245 ?auto_114246 ) ( ON ?auto_114244 ?auto_114245 ) ( ON ?auto_114243 ?auto_114244 ) ( ON ?auto_114242 ?auto_114243 ) ( ON ?auto_114241 ?auto_114242 ) ( ON ?auto_114240 ?auto_114241 ) ( CLEAR ?auto_114240 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_114246 ?auto_114245 ?auto_114244 ?auto_114243 ?auto_114242 ?auto_114241 )
      ( MAKE-7PILE ?auto_114240 ?auto_114241 ?auto_114242 ?auto_114243 ?auto_114244 ?auto_114245 ?auto_114246 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_114254 - BLOCK
      ?auto_114255 - BLOCK
      ?auto_114256 - BLOCK
      ?auto_114257 - BLOCK
      ?auto_114258 - BLOCK
      ?auto_114259 - BLOCK
      ?auto_114260 - BLOCK
    )
    :vars
    (
      ?auto_114261 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114254 ?auto_114255 ) ) ( not ( = ?auto_114254 ?auto_114256 ) ) ( not ( = ?auto_114254 ?auto_114257 ) ) ( not ( = ?auto_114254 ?auto_114258 ) ) ( not ( = ?auto_114254 ?auto_114259 ) ) ( not ( = ?auto_114254 ?auto_114260 ) ) ( not ( = ?auto_114255 ?auto_114256 ) ) ( not ( = ?auto_114255 ?auto_114257 ) ) ( not ( = ?auto_114255 ?auto_114258 ) ) ( not ( = ?auto_114255 ?auto_114259 ) ) ( not ( = ?auto_114255 ?auto_114260 ) ) ( not ( = ?auto_114256 ?auto_114257 ) ) ( not ( = ?auto_114256 ?auto_114258 ) ) ( not ( = ?auto_114256 ?auto_114259 ) ) ( not ( = ?auto_114256 ?auto_114260 ) ) ( not ( = ?auto_114257 ?auto_114258 ) ) ( not ( = ?auto_114257 ?auto_114259 ) ) ( not ( = ?auto_114257 ?auto_114260 ) ) ( not ( = ?auto_114258 ?auto_114259 ) ) ( not ( = ?auto_114258 ?auto_114260 ) ) ( not ( = ?auto_114259 ?auto_114260 ) ) ( ON-TABLE ?auto_114260 ) ( ON ?auto_114259 ?auto_114260 ) ( ON ?auto_114258 ?auto_114259 ) ( ON ?auto_114257 ?auto_114258 ) ( ON ?auto_114256 ?auto_114257 ) ( ON ?auto_114255 ?auto_114256 ) ( CLEAR ?auto_114255 ) ( ON ?auto_114254 ?auto_114261 ) ( CLEAR ?auto_114254 ) ( HAND-EMPTY ) ( not ( = ?auto_114254 ?auto_114261 ) ) ( not ( = ?auto_114255 ?auto_114261 ) ) ( not ( = ?auto_114256 ?auto_114261 ) ) ( not ( = ?auto_114257 ?auto_114261 ) ) ( not ( = ?auto_114258 ?auto_114261 ) ) ( not ( = ?auto_114259 ?auto_114261 ) ) ( not ( = ?auto_114260 ?auto_114261 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_114254 ?auto_114261 )
      ( MAKE-7PILE ?auto_114254 ?auto_114255 ?auto_114256 ?auto_114257 ?auto_114258 ?auto_114259 ?auto_114260 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_114262 - BLOCK
      ?auto_114263 - BLOCK
      ?auto_114264 - BLOCK
      ?auto_114265 - BLOCK
      ?auto_114266 - BLOCK
      ?auto_114267 - BLOCK
      ?auto_114268 - BLOCK
    )
    :vars
    (
      ?auto_114269 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114262 ?auto_114263 ) ) ( not ( = ?auto_114262 ?auto_114264 ) ) ( not ( = ?auto_114262 ?auto_114265 ) ) ( not ( = ?auto_114262 ?auto_114266 ) ) ( not ( = ?auto_114262 ?auto_114267 ) ) ( not ( = ?auto_114262 ?auto_114268 ) ) ( not ( = ?auto_114263 ?auto_114264 ) ) ( not ( = ?auto_114263 ?auto_114265 ) ) ( not ( = ?auto_114263 ?auto_114266 ) ) ( not ( = ?auto_114263 ?auto_114267 ) ) ( not ( = ?auto_114263 ?auto_114268 ) ) ( not ( = ?auto_114264 ?auto_114265 ) ) ( not ( = ?auto_114264 ?auto_114266 ) ) ( not ( = ?auto_114264 ?auto_114267 ) ) ( not ( = ?auto_114264 ?auto_114268 ) ) ( not ( = ?auto_114265 ?auto_114266 ) ) ( not ( = ?auto_114265 ?auto_114267 ) ) ( not ( = ?auto_114265 ?auto_114268 ) ) ( not ( = ?auto_114266 ?auto_114267 ) ) ( not ( = ?auto_114266 ?auto_114268 ) ) ( not ( = ?auto_114267 ?auto_114268 ) ) ( ON-TABLE ?auto_114268 ) ( ON ?auto_114267 ?auto_114268 ) ( ON ?auto_114266 ?auto_114267 ) ( ON ?auto_114265 ?auto_114266 ) ( ON ?auto_114264 ?auto_114265 ) ( ON ?auto_114262 ?auto_114269 ) ( CLEAR ?auto_114262 ) ( not ( = ?auto_114262 ?auto_114269 ) ) ( not ( = ?auto_114263 ?auto_114269 ) ) ( not ( = ?auto_114264 ?auto_114269 ) ) ( not ( = ?auto_114265 ?auto_114269 ) ) ( not ( = ?auto_114266 ?auto_114269 ) ) ( not ( = ?auto_114267 ?auto_114269 ) ) ( not ( = ?auto_114268 ?auto_114269 ) ) ( HOLDING ?auto_114263 ) ( CLEAR ?auto_114264 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_114268 ?auto_114267 ?auto_114266 ?auto_114265 ?auto_114264 ?auto_114263 )
      ( MAKE-7PILE ?auto_114262 ?auto_114263 ?auto_114264 ?auto_114265 ?auto_114266 ?auto_114267 ?auto_114268 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_114270 - BLOCK
      ?auto_114271 - BLOCK
      ?auto_114272 - BLOCK
      ?auto_114273 - BLOCK
      ?auto_114274 - BLOCK
      ?auto_114275 - BLOCK
      ?auto_114276 - BLOCK
    )
    :vars
    (
      ?auto_114277 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114270 ?auto_114271 ) ) ( not ( = ?auto_114270 ?auto_114272 ) ) ( not ( = ?auto_114270 ?auto_114273 ) ) ( not ( = ?auto_114270 ?auto_114274 ) ) ( not ( = ?auto_114270 ?auto_114275 ) ) ( not ( = ?auto_114270 ?auto_114276 ) ) ( not ( = ?auto_114271 ?auto_114272 ) ) ( not ( = ?auto_114271 ?auto_114273 ) ) ( not ( = ?auto_114271 ?auto_114274 ) ) ( not ( = ?auto_114271 ?auto_114275 ) ) ( not ( = ?auto_114271 ?auto_114276 ) ) ( not ( = ?auto_114272 ?auto_114273 ) ) ( not ( = ?auto_114272 ?auto_114274 ) ) ( not ( = ?auto_114272 ?auto_114275 ) ) ( not ( = ?auto_114272 ?auto_114276 ) ) ( not ( = ?auto_114273 ?auto_114274 ) ) ( not ( = ?auto_114273 ?auto_114275 ) ) ( not ( = ?auto_114273 ?auto_114276 ) ) ( not ( = ?auto_114274 ?auto_114275 ) ) ( not ( = ?auto_114274 ?auto_114276 ) ) ( not ( = ?auto_114275 ?auto_114276 ) ) ( ON-TABLE ?auto_114276 ) ( ON ?auto_114275 ?auto_114276 ) ( ON ?auto_114274 ?auto_114275 ) ( ON ?auto_114273 ?auto_114274 ) ( ON ?auto_114272 ?auto_114273 ) ( ON ?auto_114270 ?auto_114277 ) ( not ( = ?auto_114270 ?auto_114277 ) ) ( not ( = ?auto_114271 ?auto_114277 ) ) ( not ( = ?auto_114272 ?auto_114277 ) ) ( not ( = ?auto_114273 ?auto_114277 ) ) ( not ( = ?auto_114274 ?auto_114277 ) ) ( not ( = ?auto_114275 ?auto_114277 ) ) ( not ( = ?auto_114276 ?auto_114277 ) ) ( CLEAR ?auto_114272 ) ( ON ?auto_114271 ?auto_114270 ) ( CLEAR ?auto_114271 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_114277 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_114277 ?auto_114270 )
      ( MAKE-7PILE ?auto_114270 ?auto_114271 ?auto_114272 ?auto_114273 ?auto_114274 ?auto_114275 ?auto_114276 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_114278 - BLOCK
      ?auto_114279 - BLOCK
      ?auto_114280 - BLOCK
      ?auto_114281 - BLOCK
      ?auto_114282 - BLOCK
      ?auto_114283 - BLOCK
      ?auto_114284 - BLOCK
    )
    :vars
    (
      ?auto_114285 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114278 ?auto_114279 ) ) ( not ( = ?auto_114278 ?auto_114280 ) ) ( not ( = ?auto_114278 ?auto_114281 ) ) ( not ( = ?auto_114278 ?auto_114282 ) ) ( not ( = ?auto_114278 ?auto_114283 ) ) ( not ( = ?auto_114278 ?auto_114284 ) ) ( not ( = ?auto_114279 ?auto_114280 ) ) ( not ( = ?auto_114279 ?auto_114281 ) ) ( not ( = ?auto_114279 ?auto_114282 ) ) ( not ( = ?auto_114279 ?auto_114283 ) ) ( not ( = ?auto_114279 ?auto_114284 ) ) ( not ( = ?auto_114280 ?auto_114281 ) ) ( not ( = ?auto_114280 ?auto_114282 ) ) ( not ( = ?auto_114280 ?auto_114283 ) ) ( not ( = ?auto_114280 ?auto_114284 ) ) ( not ( = ?auto_114281 ?auto_114282 ) ) ( not ( = ?auto_114281 ?auto_114283 ) ) ( not ( = ?auto_114281 ?auto_114284 ) ) ( not ( = ?auto_114282 ?auto_114283 ) ) ( not ( = ?auto_114282 ?auto_114284 ) ) ( not ( = ?auto_114283 ?auto_114284 ) ) ( ON-TABLE ?auto_114284 ) ( ON ?auto_114283 ?auto_114284 ) ( ON ?auto_114282 ?auto_114283 ) ( ON ?auto_114281 ?auto_114282 ) ( ON ?auto_114278 ?auto_114285 ) ( not ( = ?auto_114278 ?auto_114285 ) ) ( not ( = ?auto_114279 ?auto_114285 ) ) ( not ( = ?auto_114280 ?auto_114285 ) ) ( not ( = ?auto_114281 ?auto_114285 ) ) ( not ( = ?auto_114282 ?auto_114285 ) ) ( not ( = ?auto_114283 ?auto_114285 ) ) ( not ( = ?auto_114284 ?auto_114285 ) ) ( ON ?auto_114279 ?auto_114278 ) ( CLEAR ?auto_114279 ) ( ON-TABLE ?auto_114285 ) ( HOLDING ?auto_114280 ) ( CLEAR ?auto_114281 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_114284 ?auto_114283 ?auto_114282 ?auto_114281 ?auto_114280 )
      ( MAKE-7PILE ?auto_114278 ?auto_114279 ?auto_114280 ?auto_114281 ?auto_114282 ?auto_114283 ?auto_114284 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_114286 - BLOCK
      ?auto_114287 - BLOCK
      ?auto_114288 - BLOCK
      ?auto_114289 - BLOCK
      ?auto_114290 - BLOCK
      ?auto_114291 - BLOCK
      ?auto_114292 - BLOCK
    )
    :vars
    (
      ?auto_114293 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114286 ?auto_114287 ) ) ( not ( = ?auto_114286 ?auto_114288 ) ) ( not ( = ?auto_114286 ?auto_114289 ) ) ( not ( = ?auto_114286 ?auto_114290 ) ) ( not ( = ?auto_114286 ?auto_114291 ) ) ( not ( = ?auto_114286 ?auto_114292 ) ) ( not ( = ?auto_114287 ?auto_114288 ) ) ( not ( = ?auto_114287 ?auto_114289 ) ) ( not ( = ?auto_114287 ?auto_114290 ) ) ( not ( = ?auto_114287 ?auto_114291 ) ) ( not ( = ?auto_114287 ?auto_114292 ) ) ( not ( = ?auto_114288 ?auto_114289 ) ) ( not ( = ?auto_114288 ?auto_114290 ) ) ( not ( = ?auto_114288 ?auto_114291 ) ) ( not ( = ?auto_114288 ?auto_114292 ) ) ( not ( = ?auto_114289 ?auto_114290 ) ) ( not ( = ?auto_114289 ?auto_114291 ) ) ( not ( = ?auto_114289 ?auto_114292 ) ) ( not ( = ?auto_114290 ?auto_114291 ) ) ( not ( = ?auto_114290 ?auto_114292 ) ) ( not ( = ?auto_114291 ?auto_114292 ) ) ( ON-TABLE ?auto_114292 ) ( ON ?auto_114291 ?auto_114292 ) ( ON ?auto_114290 ?auto_114291 ) ( ON ?auto_114289 ?auto_114290 ) ( ON ?auto_114286 ?auto_114293 ) ( not ( = ?auto_114286 ?auto_114293 ) ) ( not ( = ?auto_114287 ?auto_114293 ) ) ( not ( = ?auto_114288 ?auto_114293 ) ) ( not ( = ?auto_114289 ?auto_114293 ) ) ( not ( = ?auto_114290 ?auto_114293 ) ) ( not ( = ?auto_114291 ?auto_114293 ) ) ( not ( = ?auto_114292 ?auto_114293 ) ) ( ON ?auto_114287 ?auto_114286 ) ( ON-TABLE ?auto_114293 ) ( CLEAR ?auto_114289 ) ( ON ?auto_114288 ?auto_114287 ) ( CLEAR ?auto_114288 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_114293 ?auto_114286 ?auto_114287 )
      ( MAKE-7PILE ?auto_114286 ?auto_114287 ?auto_114288 ?auto_114289 ?auto_114290 ?auto_114291 ?auto_114292 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_114294 - BLOCK
      ?auto_114295 - BLOCK
      ?auto_114296 - BLOCK
      ?auto_114297 - BLOCK
      ?auto_114298 - BLOCK
      ?auto_114299 - BLOCK
      ?auto_114300 - BLOCK
    )
    :vars
    (
      ?auto_114301 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114294 ?auto_114295 ) ) ( not ( = ?auto_114294 ?auto_114296 ) ) ( not ( = ?auto_114294 ?auto_114297 ) ) ( not ( = ?auto_114294 ?auto_114298 ) ) ( not ( = ?auto_114294 ?auto_114299 ) ) ( not ( = ?auto_114294 ?auto_114300 ) ) ( not ( = ?auto_114295 ?auto_114296 ) ) ( not ( = ?auto_114295 ?auto_114297 ) ) ( not ( = ?auto_114295 ?auto_114298 ) ) ( not ( = ?auto_114295 ?auto_114299 ) ) ( not ( = ?auto_114295 ?auto_114300 ) ) ( not ( = ?auto_114296 ?auto_114297 ) ) ( not ( = ?auto_114296 ?auto_114298 ) ) ( not ( = ?auto_114296 ?auto_114299 ) ) ( not ( = ?auto_114296 ?auto_114300 ) ) ( not ( = ?auto_114297 ?auto_114298 ) ) ( not ( = ?auto_114297 ?auto_114299 ) ) ( not ( = ?auto_114297 ?auto_114300 ) ) ( not ( = ?auto_114298 ?auto_114299 ) ) ( not ( = ?auto_114298 ?auto_114300 ) ) ( not ( = ?auto_114299 ?auto_114300 ) ) ( ON-TABLE ?auto_114300 ) ( ON ?auto_114299 ?auto_114300 ) ( ON ?auto_114298 ?auto_114299 ) ( ON ?auto_114294 ?auto_114301 ) ( not ( = ?auto_114294 ?auto_114301 ) ) ( not ( = ?auto_114295 ?auto_114301 ) ) ( not ( = ?auto_114296 ?auto_114301 ) ) ( not ( = ?auto_114297 ?auto_114301 ) ) ( not ( = ?auto_114298 ?auto_114301 ) ) ( not ( = ?auto_114299 ?auto_114301 ) ) ( not ( = ?auto_114300 ?auto_114301 ) ) ( ON ?auto_114295 ?auto_114294 ) ( ON-TABLE ?auto_114301 ) ( ON ?auto_114296 ?auto_114295 ) ( CLEAR ?auto_114296 ) ( HOLDING ?auto_114297 ) ( CLEAR ?auto_114298 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_114300 ?auto_114299 ?auto_114298 ?auto_114297 )
      ( MAKE-7PILE ?auto_114294 ?auto_114295 ?auto_114296 ?auto_114297 ?auto_114298 ?auto_114299 ?auto_114300 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_114302 - BLOCK
      ?auto_114303 - BLOCK
      ?auto_114304 - BLOCK
      ?auto_114305 - BLOCK
      ?auto_114306 - BLOCK
      ?auto_114307 - BLOCK
      ?auto_114308 - BLOCK
    )
    :vars
    (
      ?auto_114309 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114302 ?auto_114303 ) ) ( not ( = ?auto_114302 ?auto_114304 ) ) ( not ( = ?auto_114302 ?auto_114305 ) ) ( not ( = ?auto_114302 ?auto_114306 ) ) ( not ( = ?auto_114302 ?auto_114307 ) ) ( not ( = ?auto_114302 ?auto_114308 ) ) ( not ( = ?auto_114303 ?auto_114304 ) ) ( not ( = ?auto_114303 ?auto_114305 ) ) ( not ( = ?auto_114303 ?auto_114306 ) ) ( not ( = ?auto_114303 ?auto_114307 ) ) ( not ( = ?auto_114303 ?auto_114308 ) ) ( not ( = ?auto_114304 ?auto_114305 ) ) ( not ( = ?auto_114304 ?auto_114306 ) ) ( not ( = ?auto_114304 ?auto_114307 ) ) ( not ( = ?auto_114304 ?auto_114308 ) ) ( not ( = ?auto_114305 ?auto_114306 ) ) ( not ( = ?auto_114305 ?auto_114307 ) ) ( not ( = ?auto_114305 ?auto_114308 ) ) ( not ( = ?auto_114306 ?auto_114307 ) ) ( not ( = ?auto_114306 ?auto_114308 ) ) ( not ( = ?auto_114307 ?auto_114308 ) ) ( ON-TABLE ?auto_114308 ) ( ON ?auto_114307 ?auto_114308 ) ( ON ?auto_114306 ?auto_114307 ) ( ON ?auto_114302 ?auto_114309 ) ( not ( = ?auto_114302 ?auto_114309 ) ) ( not ( = ?auto_114303 ?auto_114309 ) ) ( not ( = ?auto_114304 ?auto_114309 ) ) ( not ( = ?auto_114305 ?auto_114309 ) ) ( not ( = ?auto_114306 ?auto_114309 ) ) ( not ( = ?auto_114307 ?auto_114309 ) ) ( not ( = ?auto_114308 ?auto_114309 ) ) ( ON ?auto_114303 ?auto_114302 ) ( ON-TABLE ?auto_114309 ) ( ON ?auto_114304 ?auto_114303 ) ( CLEAR ?auto_114306 ) ( ON ?auto_114305 ?auto_114304 ) ( CLEAR ?auto_114305 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_114309 ?auto_114302 ?auto_114303 ?auto_114304 )
      ( MAKE-7PILE ?auto_114302 ?auto_114303 ?auto_114304 ?auto_114305 ?auto_114306 ?auto_114307 ?auto_114308 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_114310 - BLOCK
      ?auto_114311 - BLOCK
      ?auto_114312 - BLOCK
      ?auto_114313 - BLOCK
      ?auto_114314 - BLOCK
      ?auto_114315 - BLOCK
      ?auto_114316 - BLOCK
    )
    :vars
    (
      ?auto_114317 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114310 ?auto_114311 ) ) ( not ( = ?auto_114310 ?auto_114312 ) ) ( not ( = ?auto_114310 ?auto_114313 ) ) ( not ( = ?auto_114310 ?auto_114314 ) ) ( not ( = ?auto_114310 ?auto_114315 ) ) ( not ( = ?auto_114310 ?auto_114316 ) ) ( not ( = ?auto_114311 ?auto_114312 ) ) ( not ( = ?auto_114311 ?auto_114313 ) ) ( not ( = ?auto_114311 ?auto_114314 ) ) ( not ( = ?auto_114311 ?auto_114315 ) ) ( not ( = ?auto_114311 ?auto_114316 ) ) ( not ( = ?auto_114312 ?auto_114313 ) ) ( not ( = ?auto_114312 ?auto_114314 ) ) ( not ( = ?auto_114312 ?auto_114315 ) ) ( not ( = ?auto_114312 ?auto_114316 ) ) ( not ( = ?auto_114313 ?auto_114314 ) ) ( not ( = ?auto_114313 ?auto_114315 ) ) ( not ( = ?auto_114313 ?auto_114316 ) ) ( not ( = ?auto_114314 ?auto_114315 ) ) ( not ( = ?auto_114314 ?auto_114316 ) ) ( not ( = ?auto_114315 ?auto_114316 ) ) ( ON-TABLE ?auto_114316 ) ( ON ?auto_114315 ?auto_114316 ) ( ON ?auto_114310 ?auto_114317 ) ( not ( = ?auto_114310 ?auto_114317 ) ) ( not ( = ?auto_114311 ?auto_114317 ) ) ( not ( = ?auto_114312 ?auto_114317 ) ) ( not ( = ?auto_114313 ?auto_114317 ) ) ( not ( = ?auto_114314 ?auto_114317 ) ) ( not ( = ?auto_114315 ?auto_114317 ) ) ( not ( = ?auto_114316 ?auto_114317 ) ) ( ON ?auto_114311 ?auto_114310 ) ( ON-TABLE ?auto_114317 ) ( ON ?auto_114312 ?auto_114311 ) ( ON ?auto_114313 ?auto_114312 ) ( CLEAR ?auto_114313 ) ( HOLDING ?auto_114314 ) ( CLEAR ?auto_114315 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_114316 ?auto_114315 ?auto_114314 )
      ( MAKE-7PILE ?auto_114310 ?auto_114311 ?auto_114312 ?auto_114313 ?auto_114314 ?auto_114315 ?auto_114316 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_114318 - BLOCK
      ?auto_114319 - BLOCK
      ?auto_114320 - BLOCK
      ?auto_114321 - BLOCK
      ?auto_114322 - BLOCK
      ?auto_114323 - BLOCK
      ?auto_114324 - BLOCK
    )
    :vars
    (
      ?auto_114325 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114318 ?auto_114319 ) ) ( not ( = ?auto_114318 ?auto_114320 ) ) ( not ( = ?auto_114318 ?auto_114321 ) ) ( not ( = ?auto_114318 ?auto_114322 ) ) ( not ( = ?auto_114318 ?auto_114323 ) ) ( not ( = ?auto_114318 ?auto_114324 ) ) ( not ( = ?auto_114319 ?auto_114320 ) ) ( not ( = ?auto_114319 ?auto_114321 ) ) ( not ( = ?auto_114319 ?auto_114322 ) ) ( not ( = ?auto_114319 ?auto_114323 ) ) ( not ( = ?auto_114319 ?auto_114324 ) ) ( not ( = ?auto_114320 ?auto_114321 ) ) ( not ( = ?auto_114320 ?auto_114322 ) ) ( not ( = ?auto_114320 ?auto_114323 ) ) ( not ( = ?auto_114320 ?auto_114324 ) ) ( not ( = ?auto_114321 ?auto_114322 ) ) ( not ( = ?auto_114321 ?auto_114323 ) ) ( not ( = ?auto_114321 ?auto_114324 ) ) ( not ( = ?auto_114322 ?auto_114323 ) ) ( not ( = ?auto_114322 ?auto_114324 ) ) ( not ( = ?auto_114323 ?auto_114324 ) ) ( ON-TABLE ?auto_114324 ) ( ON ?auto_114323 ?auto_114324 ) ( ON ?auto_114318 ?auto_114325 ) ( not ( = ?auto_114318 ?auto_114325 ) ) ( not ( = ?auto_114319 ?auto_114325 ) ) ( not ( = ?auto_114320 ?auto_114325 ) ) ( not ( = ?auto_114321 ?auto_114325 ) ) ( not ( = ?auto_114322 ?auto_114325 ) ) ( not ( = ?auto_114323 ?auto_114325 ) ) ( not ( = ?auto_114324 ?auto_114325 ) ) ( ON ?auto_114319 ?auto_114318 ) ( ON-TABLE ?auto_114325 ) ( ON ?auto_114320 ?auto_114319 ) ( ON ?auto_114321 ?auto_114320 ) ( CLEAR ?auto_114323 ) ( ON ?auto_114322 ?auto_114321 ) ( CLEAR ?auto_114322 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_114325 ?auto_114318 ?auto_114319 ?auto_114320 ?auto_114321 )
      ( MAKE-7PILE ?auto_114318 ?auto_114319 ?auto_114320 ?auto_114321 ?auto_114322 ?auto_114323 ?auto_114324 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_114326 - BLOCK
      ?auto_114327 - BLOCK
      ?auto_114328 - BLOCK
      ?auto_114329 - BLOCK
      ?auto_114330 - BLOCK
      ?auto_114331 - BLOCK
      ?auto_114332 - BLOCK
    )
    :vars
    (
      ?auto_114333 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114326 ?auto_114327 ) ) ( not ( = ?auto_114326 ?auto_114328 ) ) ( not ( = ?auto_114326 ?auto_114329 ) ) ( not ( = ?auto_114326 ?auto_114330 ) ) ( not ( = ?auto_114326 ?auto_114331 ) ) ( not ( = ?auto_114326 ?auto_114332 ) ) ( not ( = ?auto_114327 ?auto_114328 ) ) ( not ( = ?auto_114327 ?auto_114329 ) ) ( not ( = ?auto_114327 ?auto_114330 ) ) ( not ( = ?auto_114327 ?auto_114331 ) ) ( not ( = ?auto_114327 ?auto_114332 ) ) ( not ( = ?auto_114328 ?auto_114329 ) ) ( not ( = ?auto_114328 ?auto_114330 ) ) ( not ( = ?auto_114328 ?auto_114331 ) ) ( not ( = ?auto_114328 ?auto_114332 ) ) ( not ( = ?auto_114329 ?auto_114330 ) ) ( not ( = ?auto_114329 ?auto_114331 ) ) ( not ( = ?auto_114329 ?auto_114332 ) ) ( not ( = ?auto_114330 ?auto_114331 ) ) ( not ( = ?auto_114330 ?auto_114332 ) ) ( not ( = ?auto_114331 ?auto_114332 ) ) ( ON-TABLE ?auto_114332 ) ( ON ?auto_114326 ?auto_114333 ) ( not ( = ?auto_114326 ?auto_114333 ) ) ( not ( = ?auto_114327 ?auto_114333 ) ) ( not ( = ?auto_114328 ?auto_114333 ) ) ( not ( = ?auto_114329 ?auto_114333 ) ) ( not ( = ?auto_114330 ?auto_114333 ) ) ( not ( = ?auto_114331 ?auto_114333 ) ) ( not ( = ?auto_114332 ?auto_114333 ) ) ( ON ?auto_114327 ?auto_114326 ) ( ON-TABLE ?auto_114333 ) ( ON ?auto_114328 ?auto_114327 ) ( ON ?auto_114329 ?auto_114328 ) ( ON ?auto_114330 ?auto_114329 ) ( CLEAR ?auto_114330 ) ( HOLDING ?auto_114331 ) ( CLEAR ?auto_114332 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_114332 ?auto_114331 )
      ( MAKE-7PILE ?auto_114326 ?auto_114327 ?auto_114328 ?auto_114329 ?auto_114330 ?auto_114331 ?auto_114332 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_114334 - BLOCK
      ?auto_114335 - BLOCK
      ?auto_114336 - BLOCK
      ?auto_114337 - BLOCK
      ?auto_114338 - BLOCK
      ?auto_114339 - BLOCK
      ?auto_114340 - BLOCK
    )
    :vars
    (
      ?auto_114341 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114334 ?auto_114335 ) ) ( not ( = ?auto_114334 ?auto_114336 ) ) ( not ( = ?auto_114334 ?auto_114337 ) ) ( not ( = ?auto_114334 ?auto_114338 ) ) ( not ( = ?auto_114334 ?auto_114339 ) ) ( not ( = ?auto_114334 ?auto_114340 ) ) ( not ( = ?auto_114335 ?auto_114336 ) ) ( not ( = ?auto_114335 ?auto_114337 ) ) ( not ( = ?auto_114335 ?auto_114338 ) ) ( not ( = ?auto_114335 ?auto_114339 ) ) ( not ( = ?auto_114335 ?auto_114340 ) ) ( not ( = ?auto_114336 ?auto_114337 ) ) ( not ( = ?auto_114336 ?auto_114338 ) ) ( not ( = ?auto_114336 ?auto_114339 ) ) ( not ( = ?auto_114336 ?auto_114340 ) ) ( not ( = ?auto_114337 ?auto_114338 ) ) ( not ( = ?auto_114337 ?auto_114339 ) ) ( not ( = ?auto_114337 ?auto_114340 ) ) ( not ( = ?auto_114338 ?auto_114339 ) ) ( not ( = ?auto_114338 ?auto_114340 ) ) ( not ( = ?auto_114339 ?auto_114340 ) ) ( ON-TABLE ?auto_114340 ) ( ON ?auto_114334 ?auto_114341 ) ( not ( = ?auto_114334 ?auto_114341 ) ) ( not ( = ?auto_114335 ?auto_114341 ) ) ( not ( = ?auto_114336 ?auto_114341 ) ) ( not ( = ?auto_114337 ?auto_114341 ) ) ( not ( = ?auto_114338 ?auto_114341 ) ) ( not ( = ?auto_114339 ?auto_114341 ) ) ( not ( = ?auto_114340 ?auto_114341 ) ) ( ON ?auto_114335 ?auto_114334 ) ( ON-TABLE ?auto_114341 ) ( ON ?auto_114336 ?auto_114335 ) ( ON ?auto_114337 ?auto_114336 ) ( ON ?auto_114338 ?auto_114337 ) ( CLEAR ?auto_114340 ) ( ON ?auto_114339 ?auto_114338 ) ( CLEAR ?auto_114339 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_114341 ?auto_114334 ?auto_114335 ?auto_114336 ?auto_114337 ?auto_114338 )
      ( MAKE-7PILE ?auto_114334 ?auto_114335 ?auto_114336 ?auto_114337 ?auto_114338 ?auto_114339 ?auto_114340 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_114342 - BLOCK
      ?auto_114343 - BLOCK
      ?auto_114344 - BLOCK
      ?auto_114345 - BLOCK
      ?auto_114346 - BLOCK
      ?auto_114347 - BLOCK
      ?auto_114348 - BLOCK
    )
    :vars
    (
      ?auto_114349 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114342 ?auto_114343 ) ) ( not ( = ?auto_114342 ?auto_114344 ) ) ( not ( = ?auto_114342 ?auto_114345 ) ) ( not ( = ?auto_114342 ?auto_114346 ) ) ( not ( = ?auto_114342 ?auto_114347 ) ) ( not ( = ?auto_114342 ?auto_114348 ) ) ( not ( = ?auto_114343 ?auto_114344 ) ) ( not ( = ?auto_114343 ?auto_114345 ) ) ( not ( = ?auto_114343 ?auto_114346 ) ) ( not ( = ?auto_114343 ?auto_114347 ) ) ( not ( = ?auto_114343 ?auto_114348 ) ) ( not ( = ?auto_114344 ?auto_114345 ) ) ( not ( = ?auto_114344 ?auto_114346 ) ) ( not ( = ?auto_114344 ?auto_114347 ) ) ( not ( = ?auto_114344 ?auto_114348 ) ) ( not ( = ?auto_114345 ?auto_114346 ) ) ( not ( = ?auto_114345 ?auto_114347 ) ) ( not ( = ?auto_114345 ?auto_114348 ) ) ( not ( = ?auto_114346 ?auto_114347 ) ) ( not ( = ?auto_114346 ?auto_114348 ) ) ( not ( = ?auto_114347 ?auto_114348 ) ) ( ON ?auto_114342 ?auto_114349 ) ( not ( = ?auto_114342 ?auto_114349 ) ) ( not ( = ?auto_114343 ?auto_114349 ) ) ( not ( = ?auto_114344 ?auto_114349 ) ) ( not ( = ?auto_114345 ?auto_114349 ) ) ( not ( = ?auto_114346 ?auto_114349 ) ) ( not ( = ?auto_114347 ?auto_114349 ) ) ( not ( = ?auto_114348 ?auto_114349 ) ) ( ON ?auto_114343 ?auto_114342 ) ( ON-TABLE ?auto_114349 ) ( ON ?auto_114344 ?auto_114343 ) ( ON ?auto_114345 ?auto_114344 ) ( ON ?auto_114346 ?auto_114345 ) ( ON ?auto_114347 ?auto_114346 ) ( CLEAR ?auto_114347 ) ( HOLDING ?auto_114348 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_114348 )
      ( MAKE-7PILE ?auto_114342 ?auto_114343 ?auto_114344 ?auto_114345 ?auto_114346 ?auto_114347 ?auto_114348 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_114350 - BLOCK
      ?auto_114351 - BLOCK
      ?auto_114352 - BLOCK
      ?auto_114353 - BLOCK
      ?auto_114354 - BLOCK
      ?auto_114355 - BLOCK
      ?auto_114356 - BLOCK
    )
    :vars
    (
      ?auto_114357 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114350 ?auto_114351 ) ) ( not ( = ?auto_114350 ?auto_114352 ) ) ( not ( = ?auto_114350 ?auto_114353 ) ) ( not ( = ?auto_114350 ?auto_114354 ) ) ( not ( = ?auto_114350 ?auto_114355 ) ) ( not ( = ?auto_114350 ?auto_114356 ) ) ( not ( = ?auto_114351 ?auto_114352 ) ) ( not ( = ?auto_114351 ?auto_114353 ) ) ( not ( = ?auto_114351 ?auto_114354 ) ) ( not ( = ?auto_114351 ?auto_114355 ) ) ( not ( = ?auto_114351 ?auto_114356 ) ) ( not ( = ?auto_114352 ?auto_114353 ) ) ( not ( = ?auto_114352 ?auto_114354 ) ) ( not ( = ?auto_114352 ?auto_114355 ) ) ( not ( = ?auto_114352 ?auto_114356 ) ) ( not ( = ?auto_114353 ?auto_114354 ) ) ( not ( = ?auto_114353 ?auto_114355 ) ) ( not ( = ?auto_114353 ?auto_114356 ) ) ( not ( = ?auto_114354 ?auto_114355 ) ) ( not ( = ?auto_114354 ?auto_114356 ) ) ( not ( = ?auto_114355 ?auto_114356 ) ) ( ON ?auto_114350 ?auto_114357 ) ( not ( = ?auto_114350 ?auto_114357 ) ) ( not ( = ?auto_114351 ?auto_114357 ) ) ( not ( = ?auto_114352 ?auto_114357 ) ) ( not ( = ?auto_114353 ?auto_114357 ) ) ( not ( = ?auto_114354 ?auto_114357 ) ) ( not ( = ?auto_114355 ?auto_114357 ) ) ( not ( = ?auto_114356 ?auto_114357 ) ) ( ON ?auto_114351 ?auto_114350 ) ( ON-TABLE ?auto_114357 ) ( ON ?auto_114352 ?auto_114351 ) ( ON ?auto_114353 ?auto_114352 ) ( ON ?auto_114354 ?auto_114353 ) ( ON ?auto_114355 ?auto_114354 ) ( ON ?auto_114356 ?auto_114355 ) ( CLEAR ?auto_114356 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_114357 ?auto_114350 ?auto_114351 ?auto_114352 ?auto_114353 ?auto_114354 ?auto_114355 )
      ( MAKE-7PILE ?auto_114350 ?auto_114351 ?auto_114352 ?auto_114353 ?auto_114354 ?auto_114355 ?auto_114356 ) )
  )

)

