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
      ?auto_64841 - BLOCK
    )
    :vars
    (
      ?auto_64842 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64841 ?auto_64842 ) ( CLEAR ?auto_64841 ) ( HAND-EMPTY ) ( not ( = ?auto_64841 ?auto_64842 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_64841 ?auto_64842 )
      ( !PUTDOWN ?auto_64841 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_64844 - BLOCK
    )
    :vars
    (
      ?auto_64845 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64844 ?auto_64845 ) ( CLEAR ?auto_64844 ) ( HAND-EMPTY ) ( not ( = ?auto_64844 ?auto_64845 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_64844 ?auto_64845 )
      ( !PUTDOWN ?auto_64844 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_64848 - BLOCK
      ?auto_64849 - BLOCK
    )
    :vars
    (
      ?auto_64850 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_64848 ) ( ON ?auto_64849 ?auto_64850 ) ( CLEAR ?auto_64849 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_64848 ) ( not ( = ?auto_64848 ?auto_64849 ) ) ( not ( = ?auto_64848 ?auto_64850 ) ) ( not ( = ?auto_64849 ?auto_64850 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_64849 ?auto_64850 )
      ( !STACK ?auto_64849 ?auto_64848 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_64853 - BLOCK
      ?auto_64854 - BLOCK
    )
    :vars
    (
      ?auto_64855 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_64853 ) ( ON ?auto_64854 ?auto_64855 ) ( CLEAR ?auto_64854 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_64853 ) ( not ( = ?auto_64853 ?auto_64854 ) ) ( not ( = ?auto_64853 ?auto_64855 ) ) ( not ( = ?auto_64854 ?auto_64855 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_64854 ?auto_64855 )
      ( !STACK ?auto_64854 ?auto_64853 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_64858 - BLOCK
      ?auto_64859 - BLOCK
    )
    :vars
    (
      ?auto_64860 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64859 ?auto_64860 ) ( not ( = ?auto_64858 ?auto_64859 ) ) ( not ( = ?auto_64858 ?auto_64860 ) ) ( not ( = ?auto_64859 ?auto_64860 ) ) ( ON ?auto_64858 ?auto_64859 ) ( CLEAR ?auto_64858 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_64858 )
      ( MAKE-2PILE ?auto_64858 ?auto_64859 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_64863 - BLOCK
      ?auto_64864 - BLOCK
    )
    :vars
    (
      ?auto_64865 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64864 ?auto_64865 ) ( not ( = ?auto_64863 ?auto_64864 ) ) ( not ( = ?auto_64863 ?auto_64865 ) ) ( not ( = ?auto_64864 ?auto_64865 ) ) ( ON ?auto_64863 ?auto_64864 ) ( CLEAR ?auto_64863 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_64863 )
      ( MAKE-2PILE ?auto_64863 ?auto_64864 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_64869 - BLOCK
      ?auto_64870 - BLOCK
      ?auto_64871 - BLOCK
    )
    :vars
    (
      ?auto_64872 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_64870 ) ( ON ?auto_64871 ?auto_64872 ) ( CLEAR ?auto_64871 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_64869 ) ( ON ?auto_64870 ?auto_64869 ) ( not ( = ?auto_64869 ?auto_64870 ) ) ( not ( = ?auto_64869 ?auto_64871 ) ) ( not ( = ?auto_64869 ?auto_64872 ) ) ( not ( = ?auto_64870 ?auto_64871 ) ) ( not ( = ?auto_64870 ?auto_64872 ) ) ( not ( = ?auto_64871 ?auto_64872 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_64871 ?auto_64872 )
      ( !STACK ?auto_64871 ?auto_64870 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_64876 - BLOCK
      ?auto_64877 - BLOCK
      ?auto_64878 - BLOCK
    )
    :vars
    (
      ?auto_64879 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_64877 ) ( ON ?auto_64878 ?auto_64879 ) ( CLEAR ?auto_64878 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_64876 ) ( ON ?auto_64877 ?auto_64876 ) ( not ( = ?auto_64876 ?auto_64877 ) ) ( not ( = ?auto_64876 ?auto_64878 ) ) ( not ( = ?auto_64876 ?auto_64879 ) ) ( not ( = ?auto_64877 ?auto_64878 ) ) ( not ( = ?auto_64877 ?auto_64879 ) ) ( not ( = ?auto_64878 ?auto_64879 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_64878 ?auto_64879 )
      ( !STACK ?auto_64878 ?auto_64877 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_64883 - BLOCK
      ?auto_64884 - BLOCK
      ?auto_64885 - BLOCK
    )
    :vars
    (
      ?auto_64886 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64885 ?auto_64886 ) ( ON-TABLE ?auto_64883 ) ( not ( = ?auto_64883 ?auto_64884 ) ) ( not ( = ?auto_64883 ?auto_64885 ) ) ( not ( = ?auto_64883 ?auto_64886 ) ) ( not ( = ?auto_64884 ?auto_64885 ) ) ( not ( = ?auto_64884 ?auto_64886 ) ) ( not ( = ?auto_64885 ?auto_64886 ) ) ( CLEAR ?auto_64883 ) ( ON ?auto_64884 ?auto_64885 ) ( CLEAR ?auto_64884 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_64883 ?auto_64884 )
      ( MAKE-3PILE ?auto_64883 ?auto_64884 ?auto_64885 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_64890 - BLOCK
      ?auto_64891 - BLOCK
      ?auto_64892 - BLOCK
    )
    :vars
    (
      ?auto_64893 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64892 ?auto_64893 ) ( ON-TABLE ?auto_64890 ) ( not ( = ?auto_64890 ?auto_64891 ) ) ( not ( = ?auto_64890 ?auto_64892 ) ) ( not ( = ?auto_64890 ?auto_64893 ) ) ( not ( = ?auto_64891 ?auto_64892 ) ) ( not ( = ?auto_64891 ?auto_64893 ) ) ( not ( = ?auto_64892 ?auto_64893 ) ) ( CLEAR ?auto_64890 ) ( ON ?auto_64891 ?auto_64892 ) ( CLEAR ?auto_64891 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_64890 ?auto_64891 )
      ( MAKE-3PILE ?auto_64890 ?auto_64891 ?auto_64892 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_64897 - BLOCK
      ?auto_64898 - BLOCK
      ?auto_64899 - BLOCK
    )
    :vars
    (
      ?auto_64900 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64899 ?auto_64900 ) ( not ( = ?auto_64897 ?auto_64898 ) ) ( not ( = ?auto_64897 ?auto_64899 ) ) ( not ( = ?auto_64897 ?auto_64900 ) ) ( not ( = ?auto_64898 ?auto_64899 ) ) ( not ( = ?auto_64898 ?auto_64900 ) ) ( not ( = ?auto_64899 ?auto_64900 ) ) ( ON ?auto_64898 ?auto_64899 ) ( ON ?auto_64897 ?auto_64898 ) ( CLEAR ?auto_64897 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_64897 )
      ( MAKE-3PILE ?auto_64897 ?auto_64898 ?auto_64899 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_64904 - BLOCK
      ?auto_64905 - BLOCK
      ?auto_64906 - BLOCK
    )
    :vars
    (
      ?auto_64907 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64906 ?auto_64907 ) ( not ( = ?auto_64904 ?auto_64905 ) ) ( not ( = ?auto_64904 ?auto_64906 ) ) ( not ( = ?auto_64904 ?auto_64907 ) ) ( not ( = ?auto_64905 ?auto_64906 ) ) ( not ( = ?auto_64905 ?auto_64907 ) ) ( not ( = ?auto_64906 ?auto_64907 ) ) ( ON ?auto_64905 ?auto_64906 ) ( ON ?auto_64904 ?auto_64905 ) ( CLEAR ?auto_64904 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_64904 )
      ( MAKE-3PILE ?auto_64904 ?auto_64905 ?auto_64906 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_64912 - BLOCK
      ?auto_64913 - BLOCK
      ?auto_64914 - BLOCK
      ?auto_64915 - BLOCK
    )
    :vars
    (
      ?auto_64916 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_64914 ) ( ON ?auto_64915 ?auto_64916 ) ( CLEAR ?auto_64915 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_64912 ) ( ON ?auto_64913 ?auto_64912 ) ( ON ?auto_64914 ?auto_64913 ) ( not ( = ?auto_64912 ?auto_64913 ) ) ( not ( = ?auto_64912 ?auto_64914 ) ) ( not ( = ?auto_64912 ?auto_64915 ) ) ( not ( = ?auto_64912 ?auto_64916 ) ) ( not ( = ?auto_64913 ?auto_64914 ) ) ( not ( = ?auto_64913 ?auto_64915 ) ) ( not ( = ?auto_64913 ?auto_64916 ) ) ( not ( = ?auto_64914 ?auto_64915 ) ) ( not ( = ?auto_64914 ?auto_64916 ) ) ( not ( = ?auto_64915 ?auto_64916 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_64915 ?auto_64916 )
      ( !STACK ?auto_64915 ?auto_64914 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_64921 - BLOCK
      ?auto_64922 - BLOCK
      ?auto_64923 - BLOCK
      ?auto_64924 - BLOCK
    )
    :vars
    (
      ?auto_64925 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_64923 ) ( ON ?auto_64924 ?auto_64925 ) ( CLEAR ?auto_64924 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_64921 ) ( ON ?auto_64922 ?auto_64921 ) ( ON ?auto_64923 ?auto_64922 ) ( not ( = ?auto_64921 ?auto_64922 ) ) ( not ( = ?auto_64921 ?auto_64923 ) ) ( not ( = ?auto_64921 ?auto_64924 ) ) ( not ( = ?auto_64921 ?auto_64925 ) ) ( not ( = ?auto_64922 ?auto_64923 ) ) ( not ( = ?auto_64922 ?auto_64924 ) ) ( not ( = ?auto_64922 ?auto_64925 ) ) ( not ( = ?auto_64923 ?auto_64924 ) ) ( not ( = ?auto_64923 ?auto_64925 ) ) ( not ( = ?auto_64924 ?auto_64925 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_64924 ?auto_64925 )
      ( !STACK ?auto_64924 ?auto_64923 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_64930 - BLOCK
      ?auto_64931 - BLOCK
      ?auto_64932 - BLOCK
      ?auto_64933 - BLOCK
    )
    :vars
    (
      ?auto_64934 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64933 ?auto_64934 ) ( ON-TABLE ?auto_64930 ) ( ON ?auto_64931 ?auto_64930 ) ( not ( = ?auto_64930 ?auto_64931 ) ) ( not ( = ?auto_64930 ?auto_64932 ) ) ( not ( = ?auto_64930 ?auto_64933 ) ) ( not ( = ?auto_64930 ?auto_64934 ) ) ( not ( = ?auto_64931 ?auto_64932 ) ) ( not ( = ?auto_64931 ?auto_64933 ) ) ( not ( = ?auto_64931 ?auto_64934 ) ) ( not ( = ?auto_64932 ?auto_64933 ) ) ( not ( = ?auto_64932 ?auto_64934 ) ) ( not ( = ?auto_64933 ?auto_64934 ) ) ( CLEAR ?auto_64931 ) ( ON ?auto_64932 ?auto_64933 ) ( CLEAR ?auto_64932 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_64930 ?auto_64931 ?auto_64932 )
      ( MAKE-4PILE ?auto_64930 ?auto_64931 ?auto_64932 ?auto_64933 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_64939 - BLOCK
      ?auto_64940 - BLOCK
      ?auto_64941 - BLOCK
      ?auto_64942 - BLOCK
    )
    :vars
    (
      ?auto_64943 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64942 ?auto_64943 ) ( ON-TABLE ?auto_64939 ) ( ON ?auto_64940 ?auto_64939 ) ( not ( = ?auto_64939 ?auto_64940 ) ) ( not ( = ?auto_64939 ?auto_64941 ) ) ( not ( = ?auto_64939 ?auto_64942 ) ) ( not ( = ?auto_64939 ?auto_64943 ) ) ( not ( = ?auto_64940 ?auto_64941 ) ) ( not ( = ?auto_64940 ?auto_64942 ) ) ( not ( = ?auto_64940 ?auto_64943 ) ) ( not ( = ?auto_64941 ?auto_64942 ) ) ( not ( = ?auto_64941 ?auto_64943 ) ) ( not ( = ?auto_64942 ?auto_64943 ) ) ( CLEAR ?auto_64940 ) ( ON ?auto_64941 ?auto_64942 ) ( CLEAR ?auto_64941 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_64939 ?auto_64940 ?auto_64941 )
      ( MAKE-4PILE ?auto_64939 ?auto_64940 ?auto_64941 ?auto_64942 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_64948 - BLOCK
      ?auto_64949 - BLOCK
      ?auto_64950 - BLOCK
      ?auto_64951 - BLOCK
    )
    :vars
    (
      ?auto_64952 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64951 ?auto_64952 ) ( ON-TABLE ?auto_64948 ) ( not ( = ?auto_64948 ?auto_64949 ) ) ( not ( = ?auto_64948 ?auto_64950 ) ) ( not ( = ?auto_64948 ?auto_64951 ) ) ( not ( = ?auto_64948 ?auto_64952 ) ) ( not ( = ?auto_64949 ?auto_64950 ) ) ( not ( = ?auto_64949 ?auto_64951 ) ) ( not ( = ?auto_64949 ?auto_64952 ) ) ( not ( = ?auto_64950 ?auto_64951 ) ) ( not ( = ?auto_64950 ?auto_64952 ) ) ( not ( = ?auto_64951 ?auto_64952 ) ) ( ON ?auto_64950 ?auto_64951 ) ( CLEAR ?auto_64948 ) ( ON ?auto_64949 ?auto_64950 ) ( CLEAR ?auto_64949 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_64948 ?auto_64949 )
      ( MAKE-4PILE ?auto_64948 ?auto_64949 ?auto_64950 ?auto_64951 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_64957 - BLOCK
      ?auto_64958 - BLOCK
      ?auto_64959 - BLOCK
      ?auto_64960 - BLOCK
    )
    :vars
    (
      ?auto_64961 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64960 ?auto_64961 ) ( ON-TABLE ?auto_64957 ) ( not ( = ?auto_64957 ?auto_64958 ) ) ( not ( = ?auto_64957 ?auto_64959 ) ) ( not ( = ?auto_64957 ?auto_64960 ) ) ( not ( = ?auto_64957 ?auto_64961 ) ) ( not ( = ?auto_64958 ?auto_64959 ) ) ( not ( = ?auto_64958 ?auto_64960 ) ) ( not ( = ?auto_64958 ?auto_64961 ) ) ( not ( = ?auto_64959 ?auto_64960 ) ) ( not ( = ?auto_64959 ?auto_64961 ) ) ( not ( = ?auto_64960 ?auto_64961 ) ) ( ON ?auto_64959 ?auto_64960 ) ( CLEAR ?auto_64957 ) ( ON ?auto_64958 ?auto_64959 ) ( CLEAR ?auto_64958 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_64957 ?auto_64958 )
      ( MAKE-4PILE ?auto_64957 ?auto_64958 ?auto_64959 ?auto_64960 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_64966 - BLOCK
      ?auto_64967 - BLOCK
      ?auto_64968 - BLOCK
      ?auto_64969 - BLOCK
    )
    :vars
    (
      ?auto_64970 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64969 ?auto_64970 ) ( not ( = ?auto_64966 ?auto_64967 ) ) ( not ( = ?auto_64966 ?auto_64968 ) ) ( not ( = ?auto_64966 ?auto_64969 ) ) ( not ( = ?auto_64966 ?auto_64970 ) ) ( not ( = ?auto_64967 ?auto_64968 ) ) ( not ( = ?auto_64967 ?auto_64969 ) ) ( not ( = ?auto_64967 ?auto_64970 ) ) ( not ( = ?auto_64968 ?auto_64969 ) ) ( not ( = ?auto_64968 ?auto_64970 ) ) ( not ( = ?auto_64969 ?auto_64970 ) ) ( ON ?auto_64968 ?auto_64969 ) ( ON ?auto_64967 ?auto_64968 ) ( ON ?auto_64966 ?auto_64967 ) ( CLEAR ?auto_64966 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_64966 )
      ( MAKE-4PILE ?auto_64966 ?auto_64967 ?auto_64968 ?auto_64969 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_64975 - BLOCK
      ?auto_64976 - BLOCK
      ?auto_64977 - BLOCK
      ?auto_64978 - BLOCK
    )
    :vars
    (
      ?auto_64979 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64978 ?auto_64979 ) ( not ( = ?auto_64975 ?auto_64976 ) ) ( not ( = ?auto_64975 ?auto_64977 ) ) ( not ( = ?auto_64975 ?auto_64978 ) ) ( not ( = ?auto_64975 ?auto_64979 ) ) ( not ( = ?auto_64976 ?auto_64977 ) ) ( not ( = ?auto_64976 ?auto_64978 ) ) ( not ( = ?auto_64976 ?auto_64979 ) ) ( not ( = ?auto_64977 ?auto_64978 ) ) ( not ( = ?auto_64977 ?auto_64979 ) ) ( not ( = ?auto_64978 ?auto_64979 ) ) ( ON ?auto_64977 ?auto_64978 ) ( ON ?auto_64976 ?auto_64977 ) ( ON ?auto_64975 ?auto_64976 ) ( CLEAR ?auto_64975 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_64975 )
      ( MAKE-4PILE ?auto_64975 ?auto_64976 ?auto_64977 ?auto_64978 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_64985 - BLOCK
      ?auto_64986 - BLOCK
      ?auto_64987 - BLOCK
      ?auto_64988 - BLOCK
      ?auto_64989 - BLOCK
    )
    :vars
    (
      ?auto_64990 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_64988 ) ( ON ?auto_64989 ?auto_64990 ) ( CLEAR ?auto_64989 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_64985 ) ( ON ?auto_64986 ?auto_64985 ) ( ON ?auto_64987 ?auto_64986 ) ( ON ?auto_64988 ?auto_64987 ) ( not ( = ?auto_64985 ?auto_64986 ) ) ( not ( = ?auto_64985 ?auto_64987 ) ) ( not ( = ?auto_64985 ?auto_64988 ) ) ( not ( = ?auto_64985 ?auto_64989 ) ) ( not ( = ?auto_64985 ?auto_64990 ) ) ( not ( = ?auto_64986 ?auto_64987 ) ) ( not ( = ?auto_64986 ?auto_64988 ) ) ( not ( = ?auto_64986 ?auto_64989 ) ) ( not ( = ?auto_64986 ?auto_64990 ) ) ( not ( = ?auto_64987 ?auto_64988 ) ) ( not ( = ?auto_64987 ?auto_64989 ) ) ( not ( = ?auto_64987 ?auto_64990 ) ) ( not ( = ?auto_64988 ?auto_64989 ) ) ( not ( = ?auto_64988 ?auto_64990 ) ) ( not ( = ?auto_64989 ?auto_64990 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_64989 ?auto_64990 )
      ( !STACK ?auto_64989 ?auto_64988 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_64996 - BLOCK
      ?auto_64997 - BLOCK
      ?auto_64998 - BLOCK
      ?auto_64999 - BLOCK
      ?auto_65000 - BLOCK
    )
    :vars
    (
      ?auto_65001 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_64999 ) ( ON ?auto_65000 ?auto_65001 ) ( CLEAR ?auto_65000 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_64996 ) ( ON ?auto_64997 ?auto_64996 ) ( ON ?auto_64998 ?auto_64997 ) ( ON ?auto_64999 ?auto_64998 ) ( not ( = ?auto_64996 ?auto_64997 ) ) ( not ( = ?auto_64996 ?auto_64998 ) ) ( not ( = ?auto_64996 ?auto_64999 ) ) ( not ( = ?auto_64996 ?auto_65000 ) ) ( not ( = ?auto_64996 ?auto_65001 ) ) ( not ( = ?auto_64997 ?auto_64998 ) ) ( not ( = ?auto_64997 ?auto_64999 ) ) ( not ( = ?auto_64997 ?auto_65000 ) ) ( not ( = ?auto_64997 ?auto_65001 ) ) ( not ( = ?auto_64998 ?auto_64999 ) ) ( not ( = ?auto_64998 ?auto_65000 ) ) ( not ( = ?auto_64998 ?auto_65001 ) ) ( not ( = ?auto_64999 ?auto_65000 ) ) ( not ( = ?auto_64999 ?auto_65001 ) ) ( not ( = ?auto_65000 ?auto_65001 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_65000 ?auto_65001 )
      ( !STACK ?auto_65000 ?auto_64999 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_65007 - BLOCK
      ?auto_65008 - BLOCK
      ?auto_65009 - BLOCK
      ?auto_65010 - BLOCK
      ?auto_65011 - BLOCK
    )
    :vars
    (
      ?auto_65012 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65011 ?auto_65012 ) ( ON-TABLE ?auto_65007 ) ( ON ?auto_65008 ?auto_65007 ) ( ON ?auto_65009 ?auto_65008 ) ( not ( = ?auto_65007 ?auto_65008 ) ) ( not ( = ?auto_65007 ?auto_65009 ) ) ( not ( = ?auto_65007 ?auto_65010 ) ) ( not ( = ?auto_65007 ?auto_65011 ) ) ( not ( = ?auto_65007 ?auto_65012 ) ) ( not ( = ?auto_65008 ?auto_65009 ) ) ( not ( = ?auto_65008 ?auto_65010 ) ) ( not ( = ?auto_65008 ?auto_65011 ) ) ( not ( = ?auto_65008 ?auto_65012 ) ) ( not ( = ?auto_65009 ?auto_65010 ) ) ( not ( = ?auto_65009 ?auto_65011 ) ) ( not ( = ?auto_65009 ?auto_65012 ) ) ( not ( = ?auto_65010 ?auto_65011 ) ) ( not ( = ?auto_65010 ?auto_65012 ) ) ( not ( = ?auto_65011 ?auto_65012 ) ) ( CLEAR ?auto_65009 ) ( ON ?auto_65010 ?auto_65011 ) ( CLEAR ?auto_65010 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_65007 ?auto_65008 ?auto_65009 ?auto_65010 )
      ( MAKE-5PILE ?auto_65007 ?auto_65008 ?auto_65009 ?auto_65010 ?auto_65011 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_65018 - BLOCK
      ?auto_65019 - BLOCK
      ?auto_65020 - BLOCK
      ?auto_65021 - BLOCK
      ?auto_65022 - BLOCK
    )
    :vars
    (
      ?auto_65023 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65022 ?auto_65023 ) ( ON-TABLE ?auto_65018 ) ( ON ?auto_65019 ?auto_65018 ) ( ON ?auto_65020 ?auto_65019 ) ( not ( = ?auto_65018 ?auto_65019 ) ) ( not ( = ?auto_65018 ?auto_65020 ) ) ( not ( = ?auto_65018 ?auto_65021 ) ) ( not ( = ?auto_65018 ?auto_65022 ) ) ( not ( = ?auto_65018 ?auto_65023 ) ) ( not ( = ?auto_65019 ?auto_65020 ) ) ( not ( = ?auto_65019 ?auto_65021 ) ) ( not ( = ?auto_65019 ?auto_65022 ) ) ( not ( = ?auto_65019 ?auto_65023 ) ) ( not ( = ?auto_65020 ?auto_65021 ) ) ( not ( = ?auto_65020 ?auto_65022 ) ) ( not ( = ?auto_65020 ?auto_65023 ) ) ( not ( = ?auto_65021 ?auto_65022 ) ) ( not ( = ?auto_65021 ?auto_65023 ) ) ( not ( = ?auto_65022 ?auto_65023 ) ) ( CLEAR ?auto_65020 ) ( ON ?auto_65021 ?auto_65022 ) ( CLEAR ?auto_65021 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_65018 ?auto_65019 ?auto_65020 ?auto_65021 )
      ( MAKE-5PILE ?auto_65018 ?auto_65019 ?auto_65020 ?auto_65021 ?auto_65022 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_65029 - BLOCK
      ?auto_65030 - BLOCK
      ?auto_65031 - BLOCK
      ?auto_65032 - BLOCK
      ?auto_65033 - BLOCK
    )
    :vars
    (
      ?auto_65034 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65033 ?auto_65034 ) ( ON-TABLE ?auto_65029 ) ( ON ?auto_65030 ?auto_65029 ) ( not ( = ?auto_65029 ?auto_65030 ) ) ( not ( = ?auto_65029 ?auto_65031 ) ) ( not ( = ?auto_65029 ?auto_65032 ) ) ( not ( = ?auto_65029 ?auto_65033 ) ) ( not ( = ?auto_65029 ?auto_65034 ) ) ( not ( = ?auto_65030 ?auto_65031 ) ) ( not ( = ?auto_65030 ?auto_65032 ) ) ( not ( = ?auto_65030 ?auto_65033 ) ) ( not ( = ?auto_65030 ?auto_65034 ) ) ( not ( = ?auto_65031 ?auto_65032 ) ) ( not ( = ?auto_65031 ?auto_65033 ) ) ( not ( = ?auto_65031 ?auto_65034 ) ) ( not ( = ?auto_65032 ?auto_65033 ) ) ( not ( = ?auto_65032 ?auto_65034 ) ) ( not ( = ?auto_65033 ?auto_65034 ) ) ( ON ?auto_65032 ?auto_65033 ) ( CLEAR ?auto_65030 ) ( ON ?auto_65031 ?auto_65032 ) ( CLEAR ?auto_65031 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_65029 ?auto_65030 ?auto_65031 )
      ( MAKE-5PILE ?auto_65029 ?auto_65030 ?auto_65031 ?auto_65032 ?auto_65033 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_65040 - BLOCK
      ?auto_65041 - BLOCK
      ?auto_65042 - BLOCK
      ?auto_65043 - BLOCK
      ?auto_65044 - BLOCK
    )
    :vars
    (
      ?auto_65045 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65044 ?auto_65045 ) ( ON-TABLE ?auto_65040 ) ( ON ?auto_65041 ?auto_65040 ) ( not ( = ?auto_65040 ?auto_65041 ) ) ( not ( = ?auto_65040 ?auto_65042 ) ) ( not ( = ?auto_65040 ?auto_65043 ) ) ( not ( = ?auto_65040 ?auto_65044 ) ) ( not ( = ?auto_65040 ?auto_65045 ) ) ( not ( = ?auto_65041 ?auto_65042 ) ) ( not ( = ?auto_65041 ?auto_65043 ) ) ( not ( = ?auto_65041 ?auto_65044 ) ) ( not ( = ?auto_65041 ?auto_65045 ) ) ( not ( = ?auto_65042 ?auto_65043 ) ) ( not ( = ?auto_65042 ?auto_65044 ) ) ( not ( = ?auto_65042 ?auto_65045 ) ) ( not ( = ?auto_65043 ?auto_65044 ) ) ( not ( = ?auto_65043 ?auto_65045 ) ) ( not ( = ?auto_65044 ?auto_65045 ) ) ( ON ?auto_65043 ?auto_65044 ) ( CLEAR ?auto_65041 ) ( ON ?auto_65042 ?auto_65043 ) ( CLEAR ?auto_65042 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_65040 ?auto_65041 ?auto_65042 )
      ( MAKE-5PILE ?auto_65040 ?auto_65041 ?auto_65042 ?auto_65043 ?auto_65044 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_65051 - BLOCK
      ?auto_65052 - BLOCK
      ?auto_65053 - BLOCK
      ?auto_65054 - BLOCK
      ?auto_65055 - BLOCK
    )
    :vars
    (
      ?auto_65056 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65055 ?auto_65056 ) ( ON-TABLE ?auto_65051 ) ( not ( = ?auto_65051 ?auto_65052 ) ) ( not ( = ?auto_65051 ?auto_65053 ) ) ( not ( = ?auto_65051 ?auto_65054 ) ) ( not ( = ?auto_65051 ?auto_65055 ) ) ( not ( = ?auto_65051 ?auto_65056 ) ) ( not ( = ?auto_65052 ?auto_65053 ) ) ( not ( = ?auto_65052 ?auto_65054 ) ) ( not ( = ?auto_65052 ?auto_65055 ) ) ( not ( = ?auto_65052 ?auto_65056 ) ) ( not ( = ?auto_65053 ?auto_65054 ) ) ( not ( = ?auto_65053 ?auto_65055 ) ) ( not ( = ?auto_65053 ?auto_65056 ) ) ( not ( = ?auto_65054 ?auto_65055 ) ) ( not ( = ?auto_65054 ?auto_65056 ) ) ( not ( = ?auto_65055 ?auto_65056 ) ) ( ON ?auto_65054 ?auto_65055 ) ( ON ?auto_65053 ?auto_65054 ) ( CLEAR ?auto_65051 ) ( ON ?auto_65052 ?auto_65053 ) ( CLEAR ?auto_65052 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_65051 ?auto_65052 )
      ( MAKE-5PILE ?auto_65051 ?auto_65052 ?auto_65053 ?auto_65054 ?auto_65055 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_65062 - BLOCK
      ?auto_65063 - BLOCK
      ?auto_65064 - BLOCK
      ?auto_65065 - BLOCK
      ?auto_65066 - BLOCK
    )
    :vars
    (
      ?auto_65067 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65066 ?auto_65067 ) ( ON-TABLE ?auto_65062 ) ( not ( = ?auto_65062 ?auto_65063 ) ) ( not ( = ?auto_65062 ?auto_65064 ) ) ( not ( = ?auto_65062 ?auto_65065 ) ) ( not ( = ?auto_65062 ?auto_65066 ) ) ( not ( = ?auto_65062 ?auto_65067 ) ) ( not ( = ?auto_65063 ?auto_65064 ) ) ( not ( = ?auto_65063 ?auto_65065 ) ) ( not ( = ?auto_65063 ?auto_65066 ) ) ( not ( = ?auto_65063 ?auto_65067 ) ) ( not ( = ?auto_65064 ?auto_65065 ) ) ( not ( = ?auto_65064 ?auto_65066 ) ) ( not ( = ?auto_65064 ?auto_65067 ) ) ( not ( = ?auto_65065 ?auto_65066 ) ) ( not ( = ?auto_65065 ?auto_65067 ) ) ( not ( = ?auto_65066 ?auto_65067 ) ) ( ON ?auto_65065 ?auto_65066 ) ( ON ?auto_65064 ?auto_65065 ) ( CLEAR ?auto_65062 ) ( ON ?auto_65063 ?auto_65064 ) ( CLEAR ?auto_65063 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_65062 ?auto_65063 )
      ( MAKE-5PILE ?auto_65062 ?auto_65063 ?auto_65064 ?auto_65065 ?auto_65066 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_65073 - BLOCK
      ?auto_65074 - BLOCK
      ?auto_65075 - BLOCK
      ?auto_65076 - BLOCK
      ?auto_65077 - BLOCK
    )
    :vars
    (
      ?auto_65078 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65077 ?auto_65078 ) ( not ( = ?auto_65073 ?auto_65074 ) ) ( not ( = ?auto_65073 ?auto_65075 ) ) ( not ( = ?auto_65073 ?auto_65076 ) ) ( not ( = ?auto_65073 ?auto_65077 ) ) ( not ( = ?auto_65073 ?auto_65078 ) ) ( not ( = ?auto_65074 ?auto_65075 ) ) ( not ( = ?auto_65074 ?auto_65076 ) ) ( not ( = ?auto_65074 ?auto_65077 ) ) ( not ( = ?auto_65074 ?auto_65078 ) ) ( not ( = ?auto_65075 ?auto_65076 ) ) ( not ( = ?auto_65075 ?auto_65077 ) ) ( not ( = ?auto_65075 ?auto_65078 ) ) ( not ( = ?auto_65076 ?auto_65077 ) ) ( not ( = ?auto_65076 ?auto_65078 ) ) ( not ( = ?auto_65077 ?auto_65078 ) ) ( ON ?auto_65076 ?auto_65077 ) ( ON ?auto_65075 ?auto_65076 ) ( ON ?auto_65074 ?auto_65075 ) ( ON ?auto_65073 ?auto_65074 ) ( CLEAR ?auto_65073 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_65073 )
      ( MAKE-5PILE ?auto_65073 ?auto_65074 ?auto_65075 ?auto_65076 ?auto_65077 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_65084 - BLOCK
      ?auto_65085 - BLOCK
      ?auto_65086 - BLOCK
      ?auto_65087 - BLOCK
      ?auto_65088 - BLOCK
    )
    :vars
    (
      ?auto_65089 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65088 ?auto_65089 ) ( not ( = ?auto_65084 ?auto_65085 ) ) ( not ( = ?auto_65084 ?auto_65086 ) ) ( not ( = ?auto_65084 ?auto_65087 ) ) ( not ( = ?auto_65084 ?auto_65088 ) ) ( not ( = ?auto_65084 ?auto_65089 ) ) ( not ( = ?auto_65085 ?auto_65086 ) ) ( not ( = ?auto_65085 ?auto_65087 ) ) ( not ( = ?auto_65085 ?auto_65088 ) ) ( not ( = ?auto_65085 ?auto_65089 ) ) ( not ( = ?auto_65086 ?auto_65087 ) ) ( not ( = ?auto_65086 ?auto_65088 ) ) ( not ( = ?auto_65086 ?auto_65089 ) ) ( not ( = ?auto_65087 ?auto_65088 ) ) ( not ( = ?auto_65087 ?auto_65089 ) ) ( not ( = ?auto_65088 ?auto_65089 ) ) ( ON ?auto_65087 ?auto_65088 ) ( ON ?auto_65086 ?auto_65087 ) ( ON ?auto_65085 ?auto_65086 ) ( ON ?auto_65084 ?auto_65085 ) ( CLEAR ?auto_65084 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_65084 )
      ( MAKE-5PILE ?auto_65084 ?auto_65085 ?auto_65086 ?auto_65087 ?auto_65088 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_65096 - BLOCK
      ?auto_65097 - BLOCK
      ?auto_65098 - BLOCK
      ?auto_65099 - BLOCK
      ?auto_65100 - BLOCK
      ?auto_65101 - BLOCK
    )
    :vars
    (
      ?auto_65102 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_65100 ) ( ON ?auto_65101 ?auto_65102 ) ( CLEAR ?auto_65101 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_65096 ) ( ON ?auto_65097 ?auto_65096 ) ( ON ?auto_65098 ?auto_65097 ) ( ON ?auto_65099 ?auto_65098 ) ( ON ?auto_65100 ?auto_65099 ) ( not ( = ?auto_65096 ?auto_65097 ) ) ( not ( = ?auto_65096 ?auto_65098 ) ) ( not ( = ?auto_65096 ?auto_65099 ) ) ( not ( = ?auto_65096 ?auto_65100 ) ) ( not ( = ?auto_65096 ?auto_65101 ) ) ( not ( = ?auto_65096 ?auto_65102 ) ) ( not ( = ?auto_65097 ?auto_65098 ) ) ( not ( = ?auto_65097 ?auto_65099 ) ) ( not ( = ?auto_65097 ?auto_65100 ) ) ( not ( = ?auto_65097 ?auto_65101 ) ) ( not ( = ?auto_65097 ?auto_65102 ) ) ( not ( = ?auto_65098 ?auto_65099 ) ) ( not ( = ?auto_65098 ?auto_65100 ) ) ( not ( = ?auto_65098 ?auto_65101 ) ) ( not ( = ?auto_65098 ?auto_65102 ) ) ( not ( = ?auto_65099 ?auto_65100 ) ) ( not ( = ?auto_65099 ?auto_65101 ) ) ( not ( = ?auto_65099 ?auto_65102 ) ) ( not ( = ?auto_65100 ?auto_65101 ) ) ( not ( = ?auto_65100 ?auto_65102 ) ) ( not ( = ?auto_65101 ?auto_65102 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_65101 ?auto_65102 )
      ( !STACK ?auto_65101 ?auto_65100 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_65109 - BLOCK
      ?auto_65110 - BLOCK
      ?auto_65111 - BLOCK
      ?auto_65112 - BLOCK
      ?auto_65113 - BLOCK
      ?auto_65114 - BLOCK
    )
    :vars
    (
      ?auto_65115 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_65113 ) ( ON ?auto_65114 ?auto_65115 ) ( CLEAR ?auto_65114 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_65109 ) ( ON ?auto_65110 ?auto_65109 ) ( ON ?auto_65111 ?auto_65110 ) ( ON ?auto_65112 ?auto_65111 ) ( ON ?auto_65113 ?auto_65112 ) ( not ( = ?auto_65109 ?auto_65110 ) ) ( not ( = ?auto_65109 ?auto_65111 ) ) ( not ( = ?auto_65109 ?auto_65112 ) ) ( not ( = ?auto_65109 ?auto_65113 ) ) ( not ( = ?auto_65109 ?auto_65114 ) ) ( not ( = ?auto_65109 ?auto_65115 ) ) ( not ( = ?auto_65110 ?auto_65111 ) ) ( not ( = ?auto_65110 ?auto_65112 ) ) ( not ( = ?auto_65110 ?auto_65113 ) ) ( not ( = ?auto_65110 ?auto_65114 ) ) ( not ( = ?auto_65110 ?auto_65115 ) ) ( not ( = ?auto_65111 ?auto_65112 ) ) ( not ( = ?auto_65111 ?auto_65113 ) ) ( not ( = ?auto_65111 ?auto_65114 ) ) ( not ( = ?auto_65111 ?auto_65115 ) ) ( not ( = ?auto_65112 ?auto_65113 ) ) ( not ( = ?auto_65112 ?auto_65114 ) ) ( not ( = ?auto_65112 ?auto_65115 ) ) ( not ( = ?auto_65113 ?auto_65114 ) ) ( not ( = ?auto_65113 ?auto_65115 ) ) ( not ( = ?auto_65114 ?auto_65115 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_65114 ?auto_65115 )
      ( !STACK ?auto_65114 ?auto_65113 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_65122 - BLOCK
      ?auto_65123 - BLOCK
      ?auto_65124 - BLOCK
      ?auto_65125 - BLOCK
      ?auto_65126 - BLOCK
      ?auto_65127 - BLOCK
    )
    :vars
    (
      ?auto_65128 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65127 ?auto_65128 ) ( ON-TABLE ?auto_65122 ) ( ON ?auto_65123 ?auto_65122 ) ( ON ?auto_65124 ?auto_65123 ) ( ON ?auto_65125 ?auto_65124 ) ( not ( = ?auto_65122 ?auto_65123 ) ) ( not ( = ?auto_65122 ?auto_65124 ) ) ( not ( = ?auto_65122 ?auto_65125 ) ) ( not ( = ?auto_65122 ?auto_65126 ) ) ( not ( = ?auto_65122 ?auto_65127 ) ) ( not ( = ?auto_65122 ?auto_65128 ) ) ( not ( = ?auto_65123 ?auto_65124 ) ) ( not ( = ?auto_65123 ?auto_65125 ) ) ( not ( = ?auto_65123 ?auto_65126 ) ) ( not ( = ?auto_65123 ?auto_65127 ) ) ( not ( = ?auto_65123 ?auto_65128 ) ) ( not ( = ?auto_65124 ?auto_65125 ) ) ( not ( = ?auto_65124 ?auto_65126 ) ) ( not ( = ?auto_65124 ?auto_65127 ) ) ( not ( = ?auto_65124 ?auto_65128 ) ) ( not ( = ?auto_65125 ?auto_65126 ) ) ( not ( = ?auto_65125 ?auto_65127 ) ) ( not ( = ?auto_65125 ?auto_65128 ) ) ( not ( = ?auto_65126 ?auto_65127 ) ) ( not ( = ?auto_65126 ?auto_65128 ) ) ( not ( = ?auto_65127 ?auto_65128 ) ) ( CLEAR ?auto_65125 ) ( ON ?auto_65126 ?auto_65127 ) ( CLEAR ?auto_65126 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_65122 ?auto_65123 ?auto_65124 ?auto_65125 ?auto_65126 )
      ( MAKE-6PILE ?auto_65122 ?auto_65123 ?auto_65124 ?auto_65125 ?auto_65126 ?auto_65127 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_65135 - BLOCK
      ?auto_65136 - BLOCK
      ?auto_65137 - BLOCK
      ?auto_65138 - BLOCK
      ?auto_65139 - BLOCK
      ?auto_65140 - BLOCK
    )
    :vars
    (
      ?auto_65141 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65140 ?auto_65141 ) ( ON-TABLE ?auto_65135 ) ( ON ?auto_65136 ?auto_65135 ) ( ON ?auto_65137 ?auto_65136 ) ( ON ?auto_65138 ?auto_65137 ) ( not ( = ?auto_65135 ?auto_65136 ) ) ( not ( = ?auto_65135 ?auto_65137 ) ) ( not ( = ?auto_65135 ?auto_65138 ) ) ( not ( = ?auto_65135 ?auto_65139 ) ) ( not ( = ?auto_65135 ?auto_65140 ) ) ( not ( = ?auto_65135 ?auto_65141 ) ) ( not ( = ?auto_65136 ?auto_65137 ) ) ( not ( = ?auto_65136 ?auto_65138 ) ) ( not ( = ?auto_65136 ?auto_65139 ) ) ( not ( = ?auto_65136 ?auto_65140 ) ) ( not ( = ?auto_65136 ?auto_65141 ) ) ( not ( = ?auto_65137 ?auto_65138 ) ) ( not ( = ?auto_65137 ?auto_65139 ) ) ( not ( = ?auto_65137 ?auto_65140 ) ) ( not ( = ?auto_65137 ?auto_65141 ) ) ( not ( = ?auto_65138 ?auto_65139 ) ) ( not ( = ?auto_65138 ?auto_65140 ) ) ( not ( = ?auto_65138 ?auto_65141 ) ) ( not ( = ?auto_65139 ?auto_65140 ) ) ( not ( = ?auto_65139 ?auto_65141 ) ) ( not ( = ?auto_65140 ?auto_65141 ) ) ( CLEAR ?auto_65138 ) ( ON ?auto_65139 ?auto_65140 ) ( CLEAR ?auto_65139 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_65135 ?auto_65136 ?auto_65137 ?auto_65138 ?auto_65139 )
      ( MAKE-6PILE ?auto_65135 ?auto_65136 ?auto_65137 ?auto_65138 ?auto_65139 ?auto_65140 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_65148 - BLOCK
      ?auto_65149 - BLOCK
      ?auto_65150 - BLOCK
      ?auto_65151 - BLOCK
      ?auto_65152 - BLOCK
      ?auto_65153 - BLOCK
    )
    :vars
    (
      ?auto_65154 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65153 ?auto_65154 ) ( ON-TABLE ?auto_65148 ) ( ON ?auto_65149 ?auto_65148 ) ( ON ?auto_65150 ?auto_65149 ) ( not ( = ?auto_65148 ?auto_65149 ) ) ( not ( = ?auto_65148 ?auto_65150 ) ) ( not ( = ?auto_65148 ?auto_65151 ) ) ( not ( = ?auto_65148 ?auto_65152 ) ) ( not ( = ?auto_65148 ?auto_65153 ) ) ( not ( = ?auto_65148 ?auto_65154 ) ) ( not ( = ?auto_65149 ?auto_65150 ) ) ( not ( = ?auto_65149 ?auto_65151 ) ) ( not ( = ?auto_65149 ?auto_65152 ) ) ( not ( = ?auto_65149 ?auto_65153 ) ) ( not ( = ?auto_65149 ?auto_65154 ) ) ( not ( = ?auto_65150 ?auto_65151 ) ) ( not ( = ?auto_65150 ?auto_65152 ) ) ( not ( = ?auto_65150 ?auto_65153 ) ) ( not ( = ?auto_65150 ?auto_65154 ) ) ( not ( = ?auto_65151 ?auto_65152 ) ) ( not ( = ?auto_65151 ?auto_65153 ) ) ( not ( = ?auto_65151 ?auto_65154 ) ) ( not ( = ?auto_65152 ?auto_65153 ) ) ( not ( = ?auto_65152 ?auto_65154 ) ) ( not ( = ?auto_65153 ?auto_65154 ) ) ( ON ?auto_65152 ?auto_65153 ) ( CLEAR ?auto_65150 ) ( ON ?auto_65151 ?auto_65152 ) ( CLEAR ?auto_65151 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_65148 ?auto_65149 ?auto_65150 ?auto_65151 )
      ( MAKE-6PILE ?auto_65148 ?auto_65149 ?auto_65150 ?auto_65151 ?auto_65152 ?auto_65153 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_65161 - BLOCK
      ?auto_65162 - BLOCK
      ?auto_65163 - BLOCK
      ?auto_65164 - BLOCK
      ?auto_65165 - BLOCK
      ?auto_65166 - BLOCK
    )
    :vars
    (
      ?auto_65167 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65166 ?auto_65167 ) ( ON-TABLE ?auto_65161 ) ( ON ?auto_65162 ?auto_65161 ) ( ON ?auto_65163 ?auto_65162 ) ( not ( = ?auto_65161 ?auto_65162 ) ) ( not ( = ?auto_65161 ?auto_65163 ) ) ( not ( = ?auto_65161 ?auto_65164 ) ) ( not ( = ?auto_65161 ?auto_65165 ) ) ( not ( = ?auto_65161 ?auto_65166 ) ) ( not ( = ?auto_65161 ?auto_65167 ) ) ( not ( = ?auto_65162 ?auto_65163 ) ) ( not ( = ?auto_65162 ?auto_65164 ) ) ( not ( = ?auto_65162 ?auto_65165 ) ) ( not ( = ?auto_65162 ?auto_65166 ) ) ( not ( = ?auto_65162 ?auto_65167 ) ) ( not ( = ?auto_65163 ?auto_65164 ) ) ( not ( = ?auto_65163 ?auto_65165 ) ) ( not ( = ?auto_65163 ?auto_65166 ) ) ( not ( = ?auto_65163 ?auto_65167 ) ) ( not ( = ?auto_65164 ?auto_65165 ) ) ( not ( = ?auto_65164 ?auto_65166 ) ) ( not ( = ?auto_65164 ?auto_65167 ) ) ( not ( = ?auto_65165 ?auto_65166 ) ) ( not ( = ?auto_65165 ?auto_65167 ) ) ( not ( = ?auto_65166 ?auto_65167 ) ) ( ON ?auto_65165 ?auto_65166 ) ( CLEAR ?auto_65163 ) ( ON ?auto_65164 ?auto_65165 ) ( CLEAR ?auto_65164 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_65161 ?auto_65162 ?auto_65163 ?auto_65164 )
      ( MAKE-6PILE ?auto_65161 ?auto_65162 ?auto_65163 ?auto_65164 ?auto_65165 ?auto_65166 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_65174 - BLOCK
      ?auto_65175 - BLOCK
      ?auto_65176 - BLOCK
      ?auto_65177 - BLOCK
      ?auto_65178 - BLOCK
      ?auto_65179 - BLOCK
    )
    :vars
    (
      ?auto_65180 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65179 ?auto_65180 ) ( ON-TABLE ?auto_65174 ) ( ON ?auto_65175 ?auto_65174 ) ( not ( = ?auto_65174 ?auto_65175 ) ) ( not ( = ?auto_65174 ?auto_65176 ) ) ( not ( = ?auto_65174 ?auto_65177 ) ) ( not ( = ?auto_65174 ?auto_65178 ) ) ( not ( = ?auto_65174 ?auto_65179 ) ) ( not ( = ?auto_65174 ?auto_65180 ) ) ( not ( = ?auto_65175 ?auto_65176 ) ) ( not ( = ?auto_65175 ?auto_65177 ) ) ( not ( = ?auto_65175 ?auto_65178 ) ) ( not ( = ?auto_65175 ?auto_65179 ) ) ( not ( = ?auto_65175 ?auto_65180 ) ) ( not ( = ?auto_65176 ?auto_65177 ) ) ( not ( = ?auto_65176 ?auto_65178 ) ) ( not ( = ?auto_65176 ?auto_65179 ) ) ( not ( = ?auto_65176 ?auto_65180 ) ) ( not ( = ?auto_65177 ?auto_65178 ) ) ( not ( = ?auto_65177 ?auto_65179 ) ) ( not ( = ?auto_65177 ?auto_65180 ) ) ( not ( = ?auto_65178 ?auto_65179 ) ) ( not ( = ?auto_65178 ?auto_65180 ) ) ( not ( = ?auto_65179 ?auto_65180 ) ) ( ON ?auto_65178 ?auto_65179 ) ( ON ?auto_65177 ?auto_65178 ) ( CLEAR ?auto_65175 ) ( ON ?auto_65176 ?auto_65177 ) ( CLEAR ?auto_65176 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_65174 ?auto_65175 ?auto_65176 )
      ( MAKE-6PILE ?auto_65174 ?auto_65175 ?auto_65176 ?auto_65177 ?auto_65178 ?auto_65179 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_65187 - BLOCK
      ?auto_65188 - BLOCK
      ?auto_65189 - BLOCK
      ?auto_65190 - BLOCK
      ?auto_65191 - BLOCK
      ?auto_65192 - BLOCK
    )
    :vars
    (
      ?auto_65193 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65192 ?auto_65193 ) ( ON-TABLE ?auto_65187 ) ( ON ?auto_65188 ?auto_65187 ) ( not ( = ?auto_65187 ?auto_65188 ) ) ( not ( = ?auto_65187 ?auto_65189 ) ) ( not ( = ?auto_65187 ?auto_65190 ) ) ( not ( = ?auto_65187 ?auto_65191 ) ) ( not ( = ?auto_65187 ?auto_65192 ) ) ( not ( = ?auto_65187 ?auto_65193 ) ) ( not ( = ?auto_65188 ?auto_65189 ) ) ( not ( = ?auto_65188 ?auto_65190 ) ) ( not ( = ?auto_65188 ?auto_65191 ) ) ( not ( = ?auto_65188 ?auto_65192 ) ) ( not ( = ?auto_65188 ?auto_65193 ) ) ( not ( = ?auto_65189 ?auto_65190 ) ) ( not ( = ?auto_65189 ?auto_65191 ) ) ( not ( = ?auto_65189 ?auto_65192 ) ) ( not ( = ?auto_65189 ?auto_65193 ) ) ( not ( = ?auto_65190 ?auto_65191 ) ) ( not ( = ?auto_65190 ?auto_65192 ) ) ( not ( = ?auto_65190 ?auto_65193 ) ) ( not ( = ?auto_65191 ?auto_65192 ) ) ( not ( = ?auto_65191 ?auto_65193 ) ) ( not ( = ?auto_65192 ?auto_65193 ) ) ( ON ?auto_65191 ?auto_65192 ) ( ON ?auto_65190 ?auto_65191 ) ( CLEAR ?auto_65188 ) ( ON ?auto_65189 ?auto_65190 ) ( CLEAR ?auto_65189 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_65187 ?auto_65188 ?auto_65189 )
      ( MAKE-6PILE ?auto_65187 ?auto_65188 ?auto_65189 ?auto_65190 ?auto_65191 ?auto_65192 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_65200 - BLOCK
      ?auto_65201 - BLOCK
      ?auto_65202 - BLOCK
      ?auto_65203 - BLOCK
      ?auto_65204 - BLOCK
      ?auto_65205 - BLOCK
    )
    :vars
    (
      ?auto_65206 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65205 ?auto_65206 ) ( ON-TABLE ?auto_65200 ) ( not ( = ?auto_65200 ?auto_65201 ) ) ( not ( = ?auto_65200 ?auto_65202 ) ) ( not ( = ?auto_65200 ?auto_65203 ) ) ( not ( = ?auto_65200 ?auto_65204 ) ) ( not ( = ?auto_65200 ?auto_65205 ) ) ( not ( = ?auto_65200 ?auto_65206 ) ) ( not ( = ?auto_65201 ?auto_65202 ) ) ( not ( = ?auto_65201 ?auto_65203 ) ) ( not ( = ?auto_65201 ?auto_65204 ) ) ( not ( = ?auto_65201 ?auto_65205 ) ) ( not ( = ?auto_65201 ?auto_65206 ) ) ( not ( = ?auto_65202 ?auto_65203 ) ) ( not ( = ?auto_65202 ?auto_65204 ) ) ( not ( = ?auto_65202 ?auto_65205 ) ) ( not ( = ?auto_65202 ?auto_65206 ) ) ( not ( = ?auto_65203 ?auto_65204 ) ) ( not ( = ?auto_65203 ?auto_65205 ) ) ( not ( = ?auto_65203 ?auto_65206 ) ) ( not ( = ?auto_65204 ?auto_65205 ) ) ( not ( = ?auto_65204 ?auto_65206 ) ) ( not ( = ?auto_65205 ?auto_65206 ) ) ( ON ?auto_65204 ?auto_65205 ) ( ON ?auto_65203 ?auto_65204 ) ( ON ?auto_65202 ?auto_65203 ) ( CLEAR ?auto_65200 ) ( ON ?auto_65201 ?auto_65202 ) ( CLEAR ?auto_65201 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_65200 ?auto_65201 )
      ( MAKE-6PILE ?auto_65200 ?auto_65201 ?auto_65202 ?auto_65203 ?auto_65204 ?auto_65205 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_65213 - BLOCK
      ?auto_65214 - BLOCK
      ?auto_65215 - BLOCK
      ?auto_65216 - BLOCK
      ?auto_65217 - BLOCK
      ?auto_65218 - BLOCK
    )
    :vars
    (
      ?auto_65219 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65218 ?auto_65219 ) ( ON-TABLE ?auto_65213 ) ( not ( = ?auto_65213 ?auto_65214 ) ) ( not ( = ?auto_65213 ?auto_65215 ) ) ( not ( = ?auto_65213 ?auto_65216 ) ) ( not ( = ?auto_65213 ?auto_65217 ) ) ( not ( = ?auto_65213 ?auto_65218 ) ) ( not ( = ?auto_65213 ?auto_65219 ) ) ( not ( = ?auto_65214 ?auto_65215 ) ) ( not ( = ?auto_65214 ?auto_65216 ) ) ( not ( = ?auto_65214 ?auto_65217 ) ) ( not ( = ?auto_65214 ?auto_65218 ) ) ( not ( = ?auto_65214 ?auto_65219 ) ) ( not ( = ?auto_65215 ?auto_65216 ) ) ( not ( = ?auto_65215 ?auto_65217 ) ) ( not ( = ?auto_65215 ?auto_65218 ) ) ( not ( = ?auto_65215 ?auto_65219 ) ) ( not ( = ?auto_65216 ?auto_65217 ) ) ( not ( = ?auto_65216 ?auto_65218 ) ) ( not ( = ?auto_65216 ?auto_65219 ) ) ( not ( = ?auto_65217 ?auto_65218 ) ) ( not ( = ?auto_65217 ?auto_65219 ) ) ( not ( = ?auto_65218 ?auto_65219 ) ) ( ON ?auto_65217 ?auto_65218 ) ( ON ?auto_65216 ?auto_65217 ) ( ON ?auto_65215 ?auto_65216 ) ( CLEAR ?auto_65213 ) ( ON ?auto_65214 ?auto_65215 ) ( CLEAR ?auto_65214 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_65213 ?auto_65214 )
      ( MAKE-6PILE ?auto_65213 ?auto_65214 ?auto_65215 ?auto_65216 ?auto_65217 ?auto_65218 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_65226 - BLOCK
      ?auto_65227 - BLOCK
      ?auto_65228 - BLOCK
      ?auto_65229 - BLOCK
      ?auto_65230 - BLOCK
      ?auto_65231 - BLOCK
    )
    :vars
    (
      ?auto_65232 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65231 ?auto_65232 ) ( not ( = ?auto_65226 ?auto_65227 ) ) ( not ( = ?auto_65226 ?auto_65228 ) ) ( not ( = ?auto_65226 ?auto_65229 ) ) ( not ( = ?auto_65226 ?auto_65230 ) ) ( not ( = ?auto_65226 ?auto_65231 ) ) ( not ( = ?auto_65226 ?auto_65232 ) ) ( not ( = ?auto_65227 ?auto_65228 ) ) ( not ( = ?auto_65227 ?auto_65229 ) ) ( not ( = ?auto_65227 ?auto_65230 ) ) ( not ( = ?auto_65227 ?auto_65231 ) ) ( not ( = ?auto_65227 ?auto_65232 ) ) ( not ( = ?auto_65228 ?auto_65229 ) ) ( not ( = ?auto_65228 ?auto_65230 ) ) ( not ( = ?auto_65228 ?auto_65231 ) ) ( not ( = ?auto_65228 ?auto_65232 ) ) ( not ( = ?auto_65229 ?auto_65230 ) ) ( not ( = ?auto_65229 ?auto_65231 ) ) ( not ( = ?auto_65229 ?auto_65232 ) ) ( not ( = ?auto_65230 ?auto_65231 ) ) ( not ( = ?auto_65230 ?auto_65232 ) ) ( not ( = ?auto_65231 ?auto_65232 ) ) ( ON ?auto_65230 ?auto_65231 ) ( ON ?auto_65229 ?auto_65230 ) ( ON ?auto_65228 ?auto_65229 ) ( ON ?auto_65227 ?auto_65228 ) ( ON ?auto_65226 ?auto_65227 ) ( CLEAR ?auto_65226 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_65226 )
      ( MAKE-6PILE ?auto_65226 ?auto_65227 ?auto_65228 ?auto_65229 ?auto_65230 ?auto_65231 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_65239 - BLOCK
      ?auto_65240 - BLOCK
      ?auto_65241 - BLOCK
      ?auto_65242 - BLOCK
      ?auto_65243 - BLOCK
      ?auto_65244 - BLOCK
    )
    :vars
    (
      ?auto_65245 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65244 ?auto_65245 ) ( not ( = ?auto_65239 ?auto_65240 ) ) ( not ( = ?auto_65239 ?auto_65241 ) ) ( not ( = ?auto_65239 ?auto_65242 ) ) ( not ( = ?auto_65239 ?auto_65243 ) ) ( not ( = ?auto_65239 ?auto_65244 ) ) ( not ( = ?auto_65239 ?auto_65245 ) ) ( not ( = ?auto_65240 ?auto_65241 ) ) ( not ( = ?auto_65240 ?auto_65242 ) ) ( not ( = ?auto_65240 ?auto_65243 ) ) ( not ( = ?auto_65240 ?auto_65244 ) ) ( not ( = ?auto_65240 ?auto_65245 ) ) ( not ( = ?auto_65241 ?auto_65242 ) ) ( not ( = ?auto_65241 ?auto_65243 ) ) ( not ( = ?auto_65241 ?auto_65244 ) ) ( not ( = ?auto_65241 ?auto_65245 ) ) ( not ( = ?auto_65242 ?auto_65243 ) ) ( not ( = ?auto_65242 ?auto_65244 ) ) ( not ( = ?auto_65242 ?auto_65245 ) ) ( not ( = ?auto_65243 ?auto_65244 ) ) ( not ( = ?auto_65243 ?auto_65245 ) ) ( not ( = ?auto_65244 ?auto_65245 ) ) ( ON ?auto_65243 ?auto_65244 ) ( ON ?auto_65242 ?auto_65243 ) ( ON ?auto_65241 ?auto_65242 ) ( ON ?auto_65240 ?auto_65241 ) ( ON ?auto_65239 ?auto_65240 ) ( CLEAR ?auto_65239 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_65239 )
      ( MAKE-6PILE ?auto_65239 ?auto_65240 ?auto_65241 ?auto_65242 ?auto_65243 ?auto_65244 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_65253 - BLOCK
      ?auto_65254 - BLOCK
      ?auto_65255 - BLOCK
      ?auto_65256 - BLOCK
      ?auto_65257 - BLOCK
      ?auto_65258 - BLOCK
      ?auto_65259 - BLOCK
    )
    :vars
    (
      ?auto_65260 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_65258 ) ( ON ?auto_65259 ?auto_65260 ) ( CLEAR ?auto_65259 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_65253 ) ( ON ?auto_65254 ?auto_65253 ) ( ON ?auto_65255 ?auto_65254 ) ( ON ?auto_65256 ?auto_65255 ) ( ON ?auto_65257 ?auto_65256 ) ( ON ?auto_65258 ?auto_65257 ) ( not ( = ?auto_65253 ?auto_65254 ) ) ( not ( = ?auto_65253 ?auto_65255 ) ) ( not ( = ?auto_65253 ?auto_65256 ) ) ( not ( = ?auto_65253 ?auto_65257 ) ) ( not ( = ?auto_65253 ?auto_65258 ) ) ( not ( = ?auto_65253 ?auto_65259 ) ) ( not ( = ?auto_65253 ?auto_65260 ) ) ( not ( = ?auto_65254 ?auto_65255 ) ) ( not ( = ?auto_65254 ?auto_65256 ) ) ( not ( = ?auto_65254 ?auto_65257 ) ) ( not ( = ?auto_65254 ?auto_65258 ) ) ( not ( = ?auto_65254 ?auto_65259 ) ) ( not ( = ?auto_65254 ?auto_65260 ) ) ( not ( = ?auto_65255 ?auto_65256 ) ) ( not ( = ?auto_65255 ?auto_65257 ) ) ( not ( = ?auto_65255 ?auto_65258 ) ) ( not ( = ?auto_65255 ?auto_65259 ) ) ( not ( = ?auto_65255 ?auto_65260 ) ) ( not ( = ?auto_65256 ?auto_65257 ) ) ( not ( = ?auto_65256 ?auto_65258 ) ) ( not ( = ?auto_65256 ?auto_65259 ) ) ( not ( = ?auto_65256 ?auto_65260 ) ) ( not ( = ?auto_65257 ?auto_65258 ) ) ( not ( = ?auto_65257 ?auto_65259 ) ) ( not ( = ?auto_65257 ?auto_65260 ) ) ( not ( = ?auto_65258 ?auto_65259 ) ) ( not ( = ?auto_65258 ?auto_65260 ) ) ( not ( = ?auto_65259 ?auto_65260 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_65259 ?auto_65260 )
      ( !STACK ?auto_65259 ?auto_65258 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_65268 - BLOCK
      ?auto_65269 - BLOCK
      ?auto_65270 - BLOCK
      ?auto_65271 - BLOCK
      ?auto_65272 - BLOCK
      ?auto_65273 - BLOCK
      ?auto_65274 - BLOCK
    )
    :vars
    (
      ?auto_65275 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_65273 ) ( ON ?auto_65274 ?auto_65275 ) ( CLEAR ?auto_65274 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_65268 ) ( ON ?auto_65269 ?auto_65268 ) ( ON ?auto_65270 ?auto_65269 ) ( ON ?auto_65271 ?auto_65270 ) ( ON ?auto_65272 ?auto_65271 ) ( ON ?auto_65273 ?auto_65272 ) ( not ( = ?auto_65268 ?auto_65269 ) ) ( not ( = ?auto_65268 ?auto_65270 ) ) ( not ( = ?auto_65268 ?auto_65271 ) ) ( not ( = ?auto_65268 ?auto_65272 ) ) ( not ( = ?auto_65268 ?auto_65273 ) ) ( not ( = ?auto_65268 ?auto_65274 ) ) ( not ( = ?auto_65268 ?auto_65275 ) ) ( not ( = ?auto_65269 ?auto_65270 ) ) ( not ( = ?auto_65269 ?auto_65271 ) ) ( not ( = ?auto_65269 ?auto_65272 ) ) ( not ( = ?auto_65269 ?auto_65273 ) ) ( not ( = ?auto_65269 ?auto_65274 ) ) ( not ( = ?auto_65269 ?auto_65275 ) ) ( not ( = ?auto_65270 ?auto_65271 ) ) ( not ( = ?auto_65270 ?auto_65272 ) ) ( not ( = ?auto_65270 ?auto_65273 ) ) ( not ( = ?auto_65270 ?auto_65274 ) ) ( not ( = ?auto_65270 ?auto_65275 ) ) ( not ( = ?auto_65271 ?auto_65272 ) ) ( not ( = ?auto_65271 ?auto_65273 ) ) ( not ( = ?auto_65271 ?auto_65274 ) ) ( not ( = ?auto_65271 ?auto_65275 ) ) ( not ( = ?auto_65272 ?auto_65273 ) ) ( not ( = ?auto_65272 ?auto_65274 ) ) ( not ( = ?auto_65272 ?auto_65275 ) ) ( not ( = ?auto_65273 ?auto_65274 ) ) ( not ( = ?auto_65273 ?auto_65275 ) ) ( not ( = ?auto_65274 ?auto_65275 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_65274 ?auto_65275 )
      ( !STACK ?auto_65274 ?auto_65273 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_65283 - BLOCK
      ?auto_65284 - BLOCK
      ?auto_65285 - BLOCK
      ?auto_65286 - BLOCK
      ?auto_65287 - BLOCK
      ?auto_65288 - BLOCK
      ?auto_65289 - BLOCK
    )
    :vars
    (
      ?auto_65290 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65289 ?auto_65290 ) ( ON-TABLE ?auto_65283 ) ( ON ?auto_65284 ?auto_65283 ) ( ON ?auto_65285 ?auto_65284 ) ( ON ?auto_65286 ?auto_65285 ) ( ON ?auto_65287 ?auto_65286 ) ( not ( = ?auto_65283 ?auto_65284 ) ) ( not ( = ?auto_65283 ?auto_65285 ) ) ( not ( = ?auto_65283 ?auto_65286 ) ) ( not ( = ?auto_65283 ?auto_65287 ) ) ( not ( = ?auto_65283 ?auto_65288 ) ) ( not ( = ?auto_65283 ?auto_65289 ) ) ( not ( = ?auto_65283 ?auto_65290 ) ) ( not ( = ?auto_65284 ?auto_65285 ) ) ( not ( = ?auto_65284 ?auto_65286 ) ) ( not ( = ?auto_65284 ?auto_65287 ) ) ( not ( = ?auto_65284 ?auto_65288 ) ) ( not ( = ?auto_65284 ?auto_65289 ) ) ( not ( = ?auto_65284 ?auto_65290 ) ) ( not ( = ?auto_65285 ?auto_65286 ) ) ( not ( = ?auto_65285 ?auto_65287 ) ) ( not ( = ?auto_65285 ?auto_65288 ) ) ( not ( = ?auto_65285 ?auto_65289 ) ) ( not ( = ?auto_65285 ?auto_65290 ) ) ( not ( = ?auto_65286 ?auto_65287 ) ) ( not ( = ?auto_65286 ?auto_65288 ) ) ( not ( = ?auto_65286 ?auto_65289 ) ) ( not ( = ?auto_65286 ?auto_65290 ) ) ( not ( = ?auto_65287 ?auto_65288 ) ) ( not ( = ?auto_65287 ?auto_65289 ) ) ( not ( = ?auto_65287 ?auto_65290 ) ) ( not ( = ?auto_65288 ?auto_65289 ) ) ( not ( = ?auto_65288 ?auto_65290 ) ) ( not ( = ?auto_65289 ?auto_65290 ) ) ( CLEAR ?auto_65287 ) ( ON ?auto_65288 ?auto_65289 ) ( CLEAR ?auto_65288 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_65283 ?auto_65284 ?auto_65285 ?auto_65286 ?auto_65287 ?auto_65288 )
      ( MAKE-7PILE ?auto_65283 ?auto_65284 ?auto_65285 ?auto_65286 ?auto_65287 ?auto_65288 ?auto_65289 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_65298 - BLOCK
      ?auto_65299 - BLOCK
      ?auto_65300 - BLOCK
      ?auto_65301 - BLOCK
      ?auto_65302 - BLOCK
      ?auto_65303 - BLOCK
      ?auto_65304 - BLOCK
    )
    :vars
    (
      ?auto_65305 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65304 ?auto_65305 ) ( ON-TABLE ?auto_65298 ) ( ON ?auto_65299 ?auto_65298 ) ( ON ?auto_65300 ?auto_65299 ) ( ON ?auto_65301 ?auto_65300 ) ( ON ?auto_65302 ?auto_65301 ) ( not ( = ?auto_65298 ?auto_65299 ) ) ( not ( = ?auto_65298 ?auto_65300 ) ) ( not ( = ?auto_65298 ?auto_65301 ) ) ( not ( = ?auto_65298 ?auto_65302 ) ) ( not ( = ?auto_65298 ?auto_65303 ) ) ( not ( = ?auto_65298 ?auto_65304 ) ) ( not ( = ?auto_65298 ?auto_65305 ) ) ( not ( = ?auto_65299 ?auto_65300 ) ) ( not ( = ?auto_65299 ?auto_65301 ) ) ( not ( = ?auto_65299 ?auto_65302 ) ) ( not ( = ?auto_65299 ?auto_65303 ) ) ( not ( = ?auto_65299 ?auto_65304 ) ) ( not ( = ?auto_65299 ?auto_65305 ) ) ( not ( = ?auto_65300 ?auto_65301 ) ) ( not ( = ?auto_65300 ?auto_65302 ) ) ( not ( = ?auto_65300 ?auto_65303 ) ) ( not ( = ?auto_65300 ?auto_65304 ) ) ( not ( = ?auto_65300 ?auto_65305 ) ) ( not ( = ?auto_65301 ?auto_65302 ) ) ( not ( = ?auto_65301 ?auto_65303 ) ) ( not ( = ?auto_65301 ?auto_65304 ) ) ( not ( = ?auto_65301 ?auto_65305 ) ) ( not ( = ?auto_65302 ?auto_65303 ) ) ( not ( = ?auto_65302 ?auto_65304 ) ) ( not ( = ?auto_65302 ?auto_65305 ) ) ( not ( = ?auto_65303 ?auto_65304 ) ) ( not ( = ?auto_65303 ?auto_65305 ) ) ( not ( = ?auto_65304 ?auto_65305 ) ) ( CLEAR ?auto_65302 ) ( ON ?auto_65303 ?auto_65304 ) ( CLEAR ?auto_65303 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_65298 ?auto_65299 ?auto_65300 ?auto_65301 ?auto_65302 ?auto_65303 )
      ( MAKE-7PILE ?auto_65298 ?auto_65299 ?auto_65300 ?auto_65301 ?auto_65302 ?auto_65303 ?auto_65304 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_65313 - BLOCK
      ?auto_65314 - BLOCK
      ?auto_65315 - BLOCK
      ?auto_65316 - BLOCK
      ?auto_65317 - BLOCK
      ?auto_65318 - BLOCK
      ?auto_65319 - BLOCK
    )
    :vars
    (
      ?auto_65320 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65319 ?auto_65320 ) ( ON-TABLE ?auto_65313 ) ( ON ?auto_65314 ?auto_65313 ) ( ON ?auto_65315 ?auto_65314 ) ( ON ?auto_65316 ?auto_65315 ) ( not ( = ?auto_65313 ?auto_65314 ) ) ( not ( = ?auto_65313 ?auto_65315 ) ) ( not ( = ?auto_65313 ?auto_65316 ) ) ( not ( = ?auto_65313 ?auto_65317 ) ) ( not ( = ?auto_65313 ?auto_65318 ) ) ( not ( = ?auto_65313 ?auto_65319 ) ) ( not ( = ?auto_65313 ?auto_65320 ) ) ( not ( = ?auto_65314 ?auto_65315 ) ) ( not ( = ?auto_65314 ?auto_65316 ) ) ( not ( = ?auto_65314 ?auto_65317 ) ) ( not ( = ?auto_65314 ?auto_65318 ) ) ( not ( = ?auto_65314 ?auto_65319 ) ) ( not ( = ?auto_65314 ?auto_65320 ) ) ( not ( = ?auto_65315 ?auto_65316 ) ) ( not ( = ?auto_65315 ?auto_65317 ) ) ( not ( = ?auto_65315 ?auto_65318 ) ) ( not ( = ?auto_65315 ?auto_65319 ) ) ( not ( = ?auto_65315 ?auto_65320 ) ) ( not ( = ?auto_65316 ?auto_65317 ) ) ( not ( = ?auto_65316 ?auto_65318 ) ) ( not ( = ?auto_65316 ?auto_65319 ) ) ( not ( = ?auto_65316 ?auto_65320 ) ) ( not ( = ?auto_65317 ?auto_65318 ) ) ( not ( = ?auto_65317 ?auto_65319 ) ) ( not ( = ?auto_65317 ?auto_65320 ) ) ( not ( = ?auto_65318 ?auto_65319 ) ) ( not ( = ?auto_65318 ?auto_65320 ) ) ( not ( = ?auto_65319 ?auto_65320 ) ) ( ON ?auto_65318 ?auto_65319 ) ( CLEAR ?auto_65316 ) ( ON ?auto_65317 ?auto_65318 ) ( CLEAR ?auto_65317 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_65313 ?auto_65314 ?auto_65315 ?auto_65316 ?auto_65317 )
      ( MAKE-7PILE ?auto_65313 ?auto_65314 ?auto_65315 ?auto_65316 ?auto_65317 ?auto_65318 ?auto_65319 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_65328 - BLOCK
      ?auto_65329 - BLOCK
      ?auto_65330 - BLOCK
      ?auto_65331 - BLOCK
      ?auto_65332 - BLOCK
      ?auto_65333 - BLOCK
      ?auto_65334 - BLOCK
    )
    :vars
    (
      ?auto_65335 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65334 ?auto_65335 ) ( ON-TABLE ?auto_65328 ) ( ON ?auto_65329 ?auto_65328 ) ( ON ?auto_65330 ?auto_65329 ) ( ON ?auto_65331 ?auto_65330 ) ( not ( = ?auto_65328 ?auto_65329 ) ) ( not ( = ?auto_65328 ?auto_65330 ) ) ( not ( = ?auto_65328 ?auto_65331 ) ) ( not ( = ?auto_65328 ?auto_65332 ) ) ( not ( = ?auto_65328 ?auto_65333 ) ) ( not ( = ?auto_65328 ?auto_65334 ) ) ( not ( = ?auto_65328 ?auto_65335 ) ) ( not ( = ?auto_65329 ?auto_65330 ) ) ( not ( = ?auto_65329 ?auto_65331 ) ) ( not ( = ?auto_65329 ?auto_65332 ) ) ( not ( = ?auto_65329 ?auto_65333 ) ) ( not ( = ?auto_65329 ?auto_65334 ) ) ( not ( = ?auto_65329 ?auto_65335 ) ) ( not ( = ?auto_65330 ?auto_65331 ) ) ( not ( = ?auto_65330 ?auto_65332 ) ) ( not ( = ?auto_65330 ?auto_65333 ) ) ( not ( = ?auto_65330 ?auto_65334 ) ) ( not ( = ?auto_65330 ?auto_65335 ) ) ( not ( = ?auto_65331 ?auto_65332 ) ) ( not ( = ?auto_65331 ?auto_65333 ) ) ( not ( = ?auto_65331 ?auto_65334 ) ) ( not ( = ?auto_65331 ?auto_65335 ) ) ( not ( = ?auto_65332 ?auto_65333 ) ) ( not ( = ?auto_65332 ?auto_65334 ) ) ( not ( = ?auto_65332 ?auto_65335 ) ) ( not ( = ?auto_65333 ?auto_65334 ) ) ( not ( = ?auto_65333 ?auto_65335 ) ) ( not ( = ?auto_65334 ?auto_65335 ) ) ( ON ?auto_65333 ?auto_65334 ) ( CLEAR ?auto_65331 ) ( ON ?auto_65332 ?auto_65333 ) ( CLEAR ?auto_65332 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_65328 ?auto_65329 ?auto_65330 ?auto_65331 ?auto_65332 )
      ( MAKE-7PILE ?auto_65328 ?auto_65329 ?auto_65330 ?auto_65331 ?auto_65332 ?auto_65333 ?auto_65334 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_65343 - BLOCK
      ?auto_65344 - BLOCK
      ?auto_65345 - BLOCK
      ?auto_65346 - BLOCK
      ?auto_65347 - BLOCK
      ?auto_65348 - BLOCK
      ?auto_65349 - BLOCK
    )
    :vars
    (
      ?auto_65350 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65349 ?auto_65350 ) ( ON-TABLE ?auto_65343 ) ( ON ?auto_65344 ?auto_65343 ) ( ON ?auto_65345 ?auto_65344 ) ( not ( = ?auto_65343 ?auto_65344 ) ) ( not ( = ?auto_65343 ?auto_65345 ) ) ( not ( = ?auto_65343 ?auto_65346 ) ) ( not ( = ?auto_65343 ?auto_65347 ) ) ( not ( = ?auto_65343 ?auto_65348 ) ) ( not ( = ?auto_65343 ?auto_65349 ) ) ( not ( = ?auto_65343 ?auto_65350 ) ) ( not ( = ?auto_65344 ?auto_65345 ) ) ( not ( = ?auto_65344 ?auto_65346 ) ) ( not ( = ?auto_65344 ?auto_65347 ) ) ( not ( = ?auto_65344 ?auto_65348 ) ) ( not ( = ?auto_65344 ?auto_65349 ) ) ( not ( = ?auto_65344 ?auto_65350 ) ) ( not ( = ?auto_65345 ?auto_65346 ) ) ( not ( = ?auto_65345 ?auto_65347 ) ) ( not ( = ?auto_65345 ?auto_65348 ) ) ( not ( = ?auto_65345 ?auto_65349 ) ) ( not ( = ?auto_65345 ?auto_65350 ) ) ( not ( = ?auto_65346 ?auto_65347 ) ) ( not ( = ?auto_65346 ?auto_65348 ) ) ( not ( = ?auto_65346 ?auto_65349 ) ) ( not ( = ?auto_65346 ?auto_65350 ) ) ( not ( = ?auto_65347 ?auto_65348 ) ) ( not ( = ?auto_65347 ?auto_65349 ) ) ( not ( = ?auto_65347 ?auto_65350 ) ) ( not ( = ?auto_65348 ?auto_65349 ) ) ( not ( = ?auto_65348 ?auto_65350 ) ) ( not ( = ?auto_65349 ?auto_65350 ) ) ( ON ?auto_65348 ?auto_65349 ) ( ON ?auto_65347 ?auto_65348 ) ( CLEAR ?auto_65345 ) ( ON ?auto_65346 ?auto_65347 ) ( CLEAR ?auto_65346 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_65343 ?auto_65344 ?auto_65345 ?auto_65346 )
      ( MAKE-7PILE ?auto_65343 ?auto_65344 ?auto_65345 ?auto_65346 ?auto_65347 ?auto_65348 ?auto_65349 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_65358 - BLOCK
      ?auto_65359 - BLOCK
      ?auto_65360 - BLOCK
      ?auto_65361 - BLOCK
      ?auto_65362 - BLOCK
      ?auto_65363 - BLOCK
      ?auto_65364 - BLOCK
    )
    :vars
    (
      ?auto_65365 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65364 ?auto_65365 ) ( ON-TABLE ?auto_65358 ) ( ON ?auto_65359 ?auto_65358 ) ( ON ?auto_65360 ?auto_65359 ) ( not ( = ?auto_65358 ?auto_65359 ) ) ( not ( = ?auto_65358 ?auto_65360 ) ) ( not ( = ?auto_65358 ?auto_65361 ) ) ( not ( = ?auto_65358 ?auto_65362 ) ) ( not ( = ?auto_65358 ?auto_65363 ) ) ( not ( = ?auto_65358 ?auto_65364 ) ) ( not ( = ?auto_65358 ?auto_65365 ) ) ( not ( = ?auto_65359 ?auto_65360 ) ) ( not ( = ?auto_65359 ?auto_65361 ) ) ( not ( = ?auto_65359 ?auto_65362 ) ) ( not ( = ?auto_65359 ?auto_65363 ) ) ( not ( = ?auto_65359 ?auto_65364 ) ) ( not ( = ?auto_65359 ?auto_65365 ) ) ( not ( = ?auto_65360 ?auto_65361 ) ) ( not ( = ?auto_65360 ?auto_65362 ) ) ( not ( = ?auto_65360 ?auto_65363 ) ) ( not ( = ?auto_65360 ?auto_65364 ) ) ( not ( = ?auto_65360 ?auto_65365 ) ) ( not ( = ?auto_65361 ?auto_65362 ) ) ( not ( = ?auto_65361 ?auto_65363 ) ) ( not ( = ?auto_65361 ?auto_65364 ) ) ( not ( = ?auto_65361 ?auto_65365 ) ) ( not ( = ?auto_65362 ?auto_65363 ) ) ( not ( = ?auto_65362 ?auto_65364 ) ) ( not ( = ?auto_65362 ?auto_65365 ) ) ( not ( = ?auto_65363 ?auto_65364 ) ) ( not ( = ?auto_65363 ?auto_65365 ) ) ( not ( = ?auto_65364 ?auto_65365 ) ) ( ON ?auto_65363 ?auto_65364 ) ( ON ?auto_65362 ?auto_65363 ) ( CLEAR ?auto_65360 ) ( ON ?auto_65361 ?auto_65362 ) ( CLEAR ?auto_65361 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_65358 ?auto_65359 ?auto_65360 ?auto_65361 )
      ( MAKE-7PILE ?auto_65358 ?auto_65359 ?auto_65360 ?auto_65361 ?auto_65362 ?auto_65363 ?auto_65364 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_65373 - BLOCK
      ?auto_65374 - BLOCK
      ?auto_65375 - BLOCK
      ?auto_65376 - BLOCK
      ?auto_65377 - BLOCK
      ?auto_65378 - BLOCK
      ?auto_65379 - BLOCK
    )
    :vars
    (
      ?auto_65380 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65379 ?auto_65380 ) ( ON-TABLE ?auto_65373 ) ( ON ?auto_65374 ?auto_65373 ) ( not ( = ?auto_65373 ?auto_65374 ) ) ( not ( = ?auto_65373 ?auto_65375 ) ) ( not ( = ?auto_65373 ?auto_65376 ) ) ( not ( = ?auto_65373 ?auto_65377 ) ) ( not ( = ?auto_65373 ?auto_65378 ) ) ( not ( = ?auto_65373 ?auto_65379 ) ) ( not ( = ?auto_65373 ?auto_65380 ) ) ( not ( = ?auto_65374 ?auto_65375 ) ) ( not ( = ?auto_65374 ?auto_65376 ) ) ( not ( = ?auto_65374 ?auto_65377 ) ) ( not ( = ?auto_65374 ?auto_65378 ) ) ( not ( = ?auto_65374 ?auto_65379 ) ) ( not ( = ?auto_65374 ?auto_65380 ) ) ( not ( = ?auto_65375 ?auto_65376 ) ) ( not ( = ?auto_65375 ?auto_65377 ) ) ( not ( = ?auto_65375 ?auto_65378 ) ) ( not ( = ?auto_65375 ?auto_65379 ) ) ( not ( = ?auto_65375 ?auto_65380 ) ) ( not ( = ?auto_65376 ?auto_65377 ) ) ( not ( = ?auto_65376 ?auto_65378 ) ) ( not ( = ?auto_65376 ?auto_65379 ) ) ( not ( = ?auto_65376 ?auto_65380 ) ) ( not ( = ?auto_65377 ?auto_65378 ) ) ( not ( = ?auto_65377 ?auto_65379 ) ) ( not ( = ?auto_65377 ?auto_65380 ) ) ( not ( = ?auto_65378 ?auto_65379 ) ) ( not ( = ?auto_65378 ?auto_65380 ) ) ( not ( = ?auto_65379 ?auto_65380 ) ) ( ON ?auto_65378 ?auto_65379 ) ( ON ?auto_65377 ?auto_65378 ) ( ON ?auto_65376 ?auto_65377 ) ( CLEAR ?auto_65374 ) ( ON ?auto_65375 ?auto_65376 ) ( CLEAR ?auto_65375 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_65373 ?auto_65374 ?auto_65375 )
      ( MAKE-7PILE ?auto_65373 ?auto_65374 ?auto_65375 ?auto_65376 ?auto_65377 ?auto_65378 ?auto_65379 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_65388 - BLOCK
      ?auto_65389 - BLOCK
      ?auto_65390 - BLOCK
      ?auto_65391 - BLOCK
      ?auto_65392 - BLOCK
      ?auto_65393 - BLOCK
      ?auto_65394 - BLOCK
    )
    :vars
    (
      ?auto_65395 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65394 ?auto_65395 ) ( ON-TABLE ?auto_65388 ) ( ON ?auto_65389 ?auto_65388 ) ( not ( = ?auto_65388 ?auto_65389 ) ) ( not ( = ?auto_65388 ?auto_65390 ) ) ( not ( = ?auto_65388 ?auto_65391 ) ) ( not ( = ?auto_65388 ?auto_65392 ) ) ( not ( = ?auto_65388 ?auto_65393 ) ) ( not ( = ?auto_65388 ?auto_65394 ) ) ( not ( = ?auto_65388 ?auto_65395 ) ) ( not ( = ?auto_65389 ?auto_65390 ) ) ( not ( = ?auto_65389 ?auto_65391 ) ) ( not ( = ?auto_65389 ?auto_65392 ) ) ( not ( = ?auto_65389 ?auto_65393 ) ) ( not ( = ?auto_65389 ?auto_65394 ) ) ( not ( = ?auto_65389 ?auto_65395 ) ) ( not ( = ?auto_65390 ?auto_65391 ) ) ( not ( = ?auto_65390 ?auto_65392 ) ) ( not ( = ?auto_65390 ?auto_65393 ) ) ( not ( = ?auto_65390 ?auto_65394 ) ) ( not ( = ?auto_65390 ?auto_65395 ) ) ( not ( = ?auto_65391 ?auto_65392 ) ) ( not ( = ?auto_65391 ?auto_65393 ) ) ( not ( = ?auto_65391 ?auto_65394 ) ) ( not ( = ?auto_65391 ?auto_65395 ) ) ( not ( = ?auto_65392 ?auto_65393 ) ) ( not ( = ?auto_65392 ?auto_65394 ) ) ( not ( = ?auto_65392 ?auto_65395 ) ) ( not ( = ?auto_65393 ?auto_65394 ) ) ( not ( = ?auto_65393 ?auto_65395 ) ) ( not ( = ?auto_65394 ?auto_65395 ) ) ( ON ?auto_65393 ?auto_65394 ) ( ON ?auto_65392 ?auto_65393 ) ( ON ?auto_65391 ?auto_65392 ) ( CLEAR ?auto_65389 ) ( ON ?auto_65390 ?auto_65391 ) ( CLEAR ?auto_65390 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_65388 ?auto_65389 ?auto_65390 )
      ( MAKE-7PILE ?auto_65388 ?auto_65389 ?auto_65390 ?auto_65391 ?auto_65392 ?auto_65393 ?auto_65394 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_65403 - BLOCK
      ?auto_65404 - BLOCK
      ?auto_65405 - BLOCK
      ?auto_65406 - BLOCK
      ?auto_65407 - BLOCK
      ?auto_65408 - BLOCK
      ?auto_65409 - BLOCK
    )
    :vars
    (
      ?auto_65410 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65409 ?auto_65410 ) ( ON-TABLE ?auto_65403 ) ( not ( = ?auto_65403 ?auto_65404 ) ) ( not ( = ?auto_65403 ?auto_65405 ) ) ( not ( = ?auto_65403 ?auto_65406 ) ) ( not ( = ?auto_65403 ?auto_65407 ) ) ( not ( = ?auto_65403 ?auto_65408 ) ) ( not ( = ?auto_65403 ?auto_65409 ) ) ( not ( = ?auto_65403 ?auto_65410 ) ) ( not ( = ?auto_65404 ?auto_65405 ) ) ( not ( = ?auto_65404 ?auto_65406 ) ) ( not ( = ?auto_65404 ?auto_65407 ) ) ( not ( = ?auto_65404 ?auto_65408 ) ) ( not ( = ?auto_65404 ?auto_65409 ) ) ( not ( = ?auto_65404 ?auto_65410 ) ) ( not ( = ?auto_65405 ?auto_65406 ) ) ( not ( = ?auto_65405 ?auto_65407 ) ) ( not ( = ?auto_65405 ?auto_65408 ) ) ( not ( = ?auto_65405 ?auto_65409 ) ) ( not ( = ?auto_65405 ?auto_65410 ) ) ( not ( = ?auto_65406 ?auto_65407 ) ) ( not ( = ?auto_65406 ?auto_65408 ) ) ( not ( = ?auto_65406 ?auto_65409 ) ) ( not ( = ?auto_65406 ?auto_65410 ) ) ( not ( = ?auto_65407 ?auto_65408 ) ) ( not ( = ?auto_65407 ?auto_65409 ) ) ( not ( = ?auto_65407 ?auto_65410 ) ) ( not ( = ?auto_65408 ?auto_65409 ) ) ( not ( = ?auto_65408 ?auto_65410 ) ) ( not ( = ?auto_65409 ?auto_65410 ) ) ( ON ?auto_65408 ?auto_65409 ) ( ON ?auto_65407 ?auto_65408 ) ( ON ?auto_65406 ?auto_65407 ) ( ON ?auto_65405 ?auto_65406 ) ( CLEAR ?auto_65403 ) ( ON ?auto_65404 ?auto_65405 ) ( CLEAR ?auto_65404 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_65403 ?auto_65404 )
      ( MAKE-7PILE ?auto_65403 ?auto_65404 ?auto_65405 ?auto_65406 ?auto_65407 ?auto_65408 ?auto_65409 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_65418 - BLOCK
      ?auto_65419 - BLOCK
      ?auto_65420 - BLOCK
      ?auto_65421 - BLOCK
      ?auto_65422 - BLOCK
      ?auto_65423 - BLOCK
      ?auto_65424 - BLOCK
    )
    :vars
    (
      ?auto_65425 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65424 ?auto_65425 ) ( ON-TABLE ?auto_65418 ) ( not ( = ?auto_65418 ?auto_65419 ) ) ( not ( = ?auto_65418 ?auto_65420 ) ) ( not ( = ?auto_65418 ?auto_65421 ) ) ( not ( = ?auto_65418 ?auto_65422 ) ) ( not ( = ?auto_65418 ?auto_65423 ) ) ( not ( = ?auto_65418 ?auto_65424 ) ) ( not ( = ?auto_65418 ?auto_65425 ) ) ( not ( = ?auto_65419 ?auto_65420 ) ) ( not ( = ?auto_65419 ?auto_65421 ) ) ( not ( = ?auto_65419 ?auto_65422 ) ) ( not ( = ?auto_65419 ?auto_65423 ) ) ( not ( = ?auto_65419 ?auto_65424 ) ) ( not ( = ?auto_65419 ?auto_65425 ) ) ( not ( = ?auto_65420 ?auto_65421 ) ) ( not ( = ?auto_65420 ?auto_65422 ) ) ( not ( = ?auto_65420 ?auto_65423 ) ) ( not ( = ?auto_65420 ?auto_65424 ) ) ( not ( = ?auto_65420 ?auto_65425 ) ) ( not ( = ?auto_65421 ?auto_65422 ) ) ( not ( = ?auto_65421 ?auto_65423 ) ) ( not ( = ?auto_65421 ?auto_65424 ) ) ( not ( = ?auto_65421 ?auto_65425 ) ) ( not ( = ?auto_65422 ?auto_65423 ) ) ( not ( = ?auto_65422 ?auto_65424 ) ) ( not ( = ?auto_65422 ?auto_65425 ) ) ( not ( = ?auto_65423 ?auto_65424 ) ) ( not ( = ?auto_65423 ?auto_65425 ) ) ( not ( = ?auto_65424 ?auto_65425 ) ) ( ON ?auto_65423 ?auto_65424 ) ( ON ?auto_65422 ?auto_65423 ) ( ON ?auto_65421 ?auto_65422 ) ( ON ?auto_65420 ?auto_65421 ) ( CLEAR ?auto_65418 ) ( ON ?auto_65419 ?auto_65420 ) ( CLEAR ?auto_65419 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_65418 ?auto_65419 )
      ( MAKE-7PILE ?auto_65418 ?auto_65419 ?auto_65420 ?auto_65421 ?auto_65422 ?auto_65423 ?auto_65424 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_65433 - BLOCK
      ?auto_65434 - BLOCK
      ?auto_65435 - BLOCK
      ?auto_65436 - BLOCK
      ?auto_65437 - BLOCK
      ?auto_65438 - BLOCK
      ?auto_65439 - BLOCK
    )
    :vars
    (
      ?auto_65440 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65439 ?auto_65440 ) ( not ( = ?auto_65433 ?auto_65434 ) ) ( not ( = ?auto_65433 ?auto_65435 ) ) ( not ( = ?auto_65433 ?auto_65436 ) ) ( not ( = ?auto_65433 ?auto_65437 ) ) ( not ( = ?auto_65433 ?auto_65438 ) ) ( not ( = ?auto_65433 ?auto_65439 ) ) ( not ( = ?auto_65433 ?auto_65440 ) ) ( not ( = ?auto_65434 ?auto_65435 ) ) ( not ( = ?auto_65434 ?auto_65436 ) ) ( not ( = ?auto_65434 ?auto_65437 ) ) ( not ( = ?auto_65434 ?auto_65438 ) ) ( not ( = ?auto_65434 ?auto_65439 ) ) ( not ( = ?auto_65434 ?auto_65440 ) ) ( not ( = ?auto_65435 ?auto_65436 ) ) ( not ( = ?auto_65435 ?auto_65437 ) ) ( not ( = ?auto_65435 ?auto_65438 ) ) ( not ( = ?auto_65435 ?auto_65439 ) ) ( not ( = ?auto_65435 ?auto_65440 ) ) ( not ( = ?auto_65436 ?auto_65437 ) ) ( not ( = ?auto_65436 ?auto_65438 ) ) ( not ( = ?auto_65436 ?auto_65439 ) ) ( not ( = ?auto_65436 ?auto_65440 ) ) ( not ( = ?auto_65437 ?auto_65438 ) ) ( not ( = ?auto_65437 ?auto_65439 ) ) ( not ( = ?auto_65437 ?auto_65440 ) ) ( not ( = ?auto_65438 ?auto_65439 ) ) ( not ( = ?auto_65438 ?auto_65440 ) ) ( not ( = ?auto_65439 ?auto_65440 ) ) ( ON ?auto_65438 ?auto_65439 ) ( ON ?auto_65437 ?auto_65438 ) ( ON ?auto_65436 ?auto_65437 ) ( ON ?auto_65435 ?auto_65436 ) ( ON ?auto_65434 ?auto_65435 ) ( ON ?auto_65433 ?auto_65434 ) ( CLEAR ?auto_65433 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_65433 )
      ( MAKE-7PILE ?auto_65433 ?auto_65434 ?auto_65435 ?auto_65436 ?auto_65437 ?auto_65438 ?auto_65439 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_65448 - BLOCK
      ?auto_65449 - BLOCK
      ?auto_65450 - BLOCK
      ?auto_65451 - BLOCK
      ?auto_65452 - BLOCK
      ?auto_65453 - BLOCK
      ?auto_65454 - BLOCK
    )
    :vars
    (
      ?auto_65455 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65454 ?auto_65455 ) ( not ( = ?auto_65448 ?auto_65449 ) ) ( not ( = ?auto_65448 ?auto_65450 ) ) ( not ( = ?auto_65448 ?auto_65451 ) ) ( not ( = ?auto_65448 ?auto_65452 ) ) ( not ( = ?auto_65448 ?auto_65453 ) ) ( not ( = ?auto_65448 ?auto_65454 ) ) ( not ( = ?auto_65448 ?auto_65455 ) ) ( not ( = ?auto_65449 ?auto_65450 ) ) ( not ( = ?auto_65449 ?auto_65451 ) ) ( not ( = ?auto_65449 ?auto_65452 ) ) ( not ( = ?auto_65449 ?auto_65453 ) ) ( not ( = ?auto_65449 ?auto_65454 ) ) ( not ( = ?auto_65449 ?auto_65455 ) ) ( not ( = ?auto_65450 ?auto_65451 ) ) ( not ( = ?auto_65450 ?auto_65452 ) ) ( not ( = ?auto_65450 ?auto_65453 ) ) ( not ( = ?auto_65450 ?auto_65454 ) ) ( not ( = ?auto_65450 ?auto_65455 ) ) ( not ( = ?auto_65451 ?auto_65452 ) ) ( not ( = ?auto_65451 ?auto_65453 ) ) ( not ( = ?auto_65451 ?auto_65454 ) ) ( not ( = ?auto_65451 ?auto_65455 ) ) ( not ( = ?auto_65452 ?auto_65453 ) ) ( not ( = ?auto_65452 ?auto_65454 ) ) ( not ( = ?auto_65452 ?auto_65455 ) ) ( not ( = ?auto_65453 ?auto_65454 ) ) ( not ( = ?auto_65453 ?auto_65455 ) ) ( not ( = ?auto_65454 ?auto_65455 ) ) ( ON ?auto_65453 ?auto_65454 ) ( ON ?auto_65452 ?auto_65453 ) ( ON ?auto_65451 ?auto_65452 ) ( ON ?auto_65450 ?auto_65451 ) ( ON ?auto_65449 ?auto_65450 ) ( ON ?auto_65448 ?auto_65449 ) ( CLEAR ?auto_65448 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_65448 )
      ( MAKE-7PILE ?auto_65448 ?auto_65449 ?auto_65450 ?auto_65451 ?auto_65452 ?auto_65453 ?auto_65454 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_65464 - BLOCK
      ?auto_65465 - BLOCK
      ?auto_65466 - BLOCK
      ?auto_65467 - BLOCK
      ?auto_65468 - BLOCK
      ?auto_65469 - BLOCK
      ?auto_65470 - BLOCK
      ?auto_65471 - BLOCK
    )
    :vars
    (
      ?auto_65472 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_65470 ) ( ON ?auto_65471 ?auto_65472 ) ( CLEAR ?auto_65471 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_65464 ) ( ON ?auto_65465 ?auto_65464 ) ( ON ?auto_65466 ?auto_65465 ) ( ON ?auto_65467 ?auto_65466 ) ( ON ?auto_65468 ?auto_65467 ) ( ON ?auto_65469 ?auto_65468 ) ( ON ?auto_65470 ?auto_65469 ) ( not ( = ?auto_65464 ?auto_65465 ) ) ( not ( = ?auto_65464 ?auto_65466 ) ) ( not ( = ?auto_65464 ?auto_65467 ) ) ( not ( = ?auto_65464 ?auto_65468 ) ) ( not ( = ?auto_65464 ?auto_65469 ) ) ( not ( = ?auto_65464 ?auto_65470 ) ) ( not ( = ?auto_65464 ?auto_65471 ) ) ( not ( = ?auto_65464 ?auto_65472 ) ) ( not ( = ?auto_65465 ?auto_65466 ) ) ( not ( = ?auto_65465 ?auto_65467 ) ) ( not ( = ?auto_65465 ?auto_65468 ) ) ( not ( = ?auto_65465 ?auto_65469 ) ) ( not ( = ?auto_65465 ?auto_65470 ) ) ( not ( = ?auto_65465 ?auto_65471 ) ) ( not ( = ?auto_65465 ?auto_65472 ) ) ( not ( = ?auto_65466 ?auto_65467 ) ) ( not ( = ?auto_65466 ?auto_65468 ) ) ( not ( = ?auto_65466 ?auto_65469 ) ) ( not ( = ?auto_65466 ?auto_65470 ) ) ( not ( = ?auto_65466 ?auto_65471 ) ) ( not ( = ?auto_65466 ?auto_65472 ) ) ( not ( = ?auto_65467 ?auto_65468 ) ) ( not ( = ?auto_65467 ?auto_65469 ) ) ( not ( = ?auto_65467 ?auto_65470 ) ) ( not ( = ?auto_65467 ?auto_65471 ) ) ( not ( = ?auto_65467 ?auto_65472 ) ) ( not ( = ?auto_65468 ?auto_65469 ) ) ( not ( = ?auto_65468 ?auto_65470 ) ) ( not ( = ?auto_65468 ?auto_65471 ) ) ( not ( = ?auto_65468 ?auto_65472 ) ) ( not ( = ?auto_65469 ?auto_65470 ) ) ( not ( = ?auto_65469 ?auto_65471 ) ) ( not ( = ?auto_65469 ?auto_65472 ) ) ( not ( = ?auto_65470 ?auto_65471 ) ) ( not ( = ?auto_65470 ?auto_65472 ) ) ( not ( = ?auto_65471 ?auto_65472 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_65471 ?auto_65472 )
      ( !STACK ?auto_65471 ?auto_65470 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_65481 - BLOCK
      ?auto_65482 - BLOCK
      ?auto_65483 - BLOCK
      ?auto_65484 - BLOCK
      ?auto_65485 - BLOCK
      ?auto_65486 - BLOCK
      ?auto_65487 - BLOCK
      ?auto_65488 - BLOCK
    )
    :vars
    (
      ?auto_65489 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_65487 ) ( ON ?auto_65488 ?auto_65489 ) ( CLEAR ?auto_65488 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_65481 ) ( ON ?auto_65482 ?auto_65481 ) ( ON ?auto_65483 ?auto_65482 ) ( ON ?auto_65484 ?auto_65483 ) ( ON ?auto_65485 ?auto_65484 ) ( ON ?auto_65486 ?auto_65485 ) ( ON ?auto_65487 ?auto_65486 ) ( not ( = ?auto_65481 ?auto_65482 ) ) ( not ( = ?auto_65481 ?auto_65483 ) ) ( not ( = ?auto_65481 ?auto_65484 ) ) ( not ( = ?auto_65481 ?auto_65485 ) ) ( not ( = ?auto_65481 ?auto_65486 ) ) ( not ( = ?auto_65481 ?auto_65487 ) ) ( not ( = ?auto_65481 ?auto_65488 ) ) ( not ( = ?auto_65481 ?auto_65489 ) ) ( not ( = ?auto_65482 ?auto_65483 ) ) ( not ( = ?auto_65482 ?auto_65484 ) ) ( not ( = ?auto_65482 ?auto_65485 ) ) ( not ( = ?auto_65482 ?auto_65486 ) ) ( not ( = ?auto_65482 ?auto_65487 ) ) ( not ( = ?auto_65482 ?auto_65488 ) ) ( not ( = ?auto_65482 ?auto_65489 ) ) ( not ( = ?auto_65483 ?auto_65484 ) ) ( not ( = ?auto_65483 ?auto_65485 ) ) ( not ( = ?auto_65483 ?auto_65486 ) ) ( not ( = ?auto_65483 ?auto_65487 ) ) ( not ( = ?auto_65483 ?auto_65488 ) ) ( not ( = ?auto_65483 ?auto_65489 ) ) ( not ( = ?auto_65484 ?auto_65485 ) ) ( not ( = ?auto_65484 ?auto_65486 ) ) ( not ( = ?auto_65484 ?auto_65487 ) ) ( not ( = ?auto_65484 ?auto_65488 ) ) ( not ( = ?auto_65484 ?auto_65489 ) ) ( not ( = ?auto_65485 ?auto_65486 ) ) ( not ( = ?auto_65485 ?auto_65487 ) ) ( not ( = ?auto_65485 ?auto_65488 ) ) ( not ( = ?auto_65485 ?auto_65489 ) ) ( not ( = ?auto_65486 ?auto_65487 ) ) ( not ( = ?auto_65486 ?auto_65488 ) ) ( not ( = ?auto_65486 ?auto_65489 ) ) ( not ( = ?auto_65487 ?auto_65488 ) ) ( not ( = ?auto_65487 ?auto_65489 ) ) ( not ( = ?auto_65488 ?auto_65489 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_65488 ?auto_65489 )
      ( !STACK ?auto_65488 ?auto_65487 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_65498 - BLOCK
      ?auto_65499 - BLOCK
      ?auto_65500 - BLOCK
      ?auto_65501 - BLOCK
      ?auto_65502 - BLOCK
      ?auto_65503 - BLOCK
      ?auto_65504 - BLOCK
      ?auto_65505 - BLOCK
    )
    :vars
    (
      ?auto_65506 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65505 ?auto_65506 ) ( ON-TABLE ?auto_65498 ) ( ON ?auto_65499 ?auto_65498 ) ( ON ?auto_65500 ?auto_65499 ) ( ON ?auto_65501 ?auto_65500 ) ( ON ?auto_65502 ?auto_65501 ) ( ON ?auto_65503 ?auto_65502 ) ( not ( = ?auto_65498 ?auto_65499 ) ) ( not ( = ?auto_65498 ?auto_65500 ) ) ( not ( = ?auto_65498 ?auto_65501 ) ) ( not ( = ?auto_65498 ?auto_65502 ) ) ( not ( = ?auto_65498 ?auto_65503 ) ) ( not ( = ?auto_65498 ?auto_65504 ) ) ( not ( = ?auto_65498 ?auto_65505 ) ) ( not ( = ?auto_65498 ?auto_65506 ) ) ( not ( = ?auto_65499 ?auto_65500 ) ) ( not ( = ?auto_65499 ?auto_65501 ) ) ( not ( = ?auto_65499 ?auto_65502 ) ) ( not ( = ?auto_65499 ?auto_65503 ) ) ( not ( = ?auto_65499 ?auto_65504 ) ) ( not ( = ?auto_65499 ?auto_65505 ) ) ( not ( = ?auto_65499 ?auto_65506 ) ) ( not ( = ?auto_65500 ?auto_65501 ) ) ( not ( = ?auto_65500 ?auto_65502 ) ) ( not ( = ?auto_65500 ?auto_65503 ) ) ( not ( = ?auto_65500 ?auto_65504 ) ) ( not ( = ?auto_65500 ?auto_65505 ) ) ( not ( = ?auto_65500 ?auto_65506 ) ) ( not ( = ?auto_65501 ?auto_65502 ) ) ( not ( = ?auto_65501 ?auto_65503 ) ) ( not ( = ?auto_65501 ?auto_65504 ) ) ( not ( = ?auto_65501 ?auto_65505 ) ) ( not ( = ?auto_65501 ?auto_65506 ) ) ( not ( = ?auto_65502 ?auto_65503 ) ) ( not ( = ?auto_65502 ?auto_65504 ) ) ( not ( = ?auto_65502 ?auto_65505 ) ) ( not ( = ?auto_65502 ?auto_65506 ) ) ( not ( = ?auto_65503 ?auto_65504 ) ) ( not ( = ?auto_65503 ?auto_65505 ) ) ( not ( = ?auto_65503 ?auto_65506 ) ) ( not ( = ?auto_65504 ?auto_65505 ) ) ( not ( = ?auto_65504 ?auto_65506 ) ) ( not ( = ?auto_65505 ?auto_65506 ) ) ( CLEAR ?auto_65503 ) ( ON ?auto_65504 ?auto_65505 ) ( CLEAR ?auto_65504 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_65498 ?auto_65499 ?auto_65500 ?auto_65501 ?auto_65502 ?auto_65503 ?auto_65504 )
      ( MAKE-8PILE ?auto_65498 ?auto_65499 ?auto_65500 ?auto_65501 ?auto_65502 ?auto_65503 ?auto_65504 ?auto_65505 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_65515 - BLOCK
      ?auto_65516 - BLOCK
      ?auto_65517 - BLOCK
      ?auto_65518 - BLOCK
      ?auto_65519 - BLOCK
      ?auto_65520 - BLOCK
      ?auto_65521 - BLOCK
      ?auto_65522 - BLOCK
    )
    :vars
    (
      ?auto_65523 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65522 ?auto_65523 ) ( ON-TABLE ?auto_65515 ) ( ON ?auto_65516 ?auto_65515 ) ( ON ?auto_65517 ?auto_65516 ) ( ON ?auto_65518 ?auto_65517 ) ( ON ?auto_65519 ?auto_65518 ) ( ON ?auto_65520 ?auto_65519 ) ( not ( = ?auto_65515 ?auto_65516 ) ) ( not ( = ?auto_65515 ?auto_65517 ) ) ( not ( = ?auto_65515 ?auto_65518 ) ) ( not ( = ?auto_65515 ?auto_65519 ) ) ( not ( = ?auto_65515 ?auto_65520 ) ) ( not ( = ?auto_65515 ?auto_65521 ) ) ( not ( = ?auto_65515 ?auto_65522 ) ) ( not ( = ?auto_65515 ?auto_65523 ) ) ( not ( = ?auto_65516 ?auto_65517 ) ) ( not ( = ?auto_65516 ?auto_65518 ) ) ( not ( = ?auto_65516 ?auto_65519 ) ) ( not ( = ?auto_65516 ?auto_65520 ) ) ( not ( = ?auto_65516 ?auto_65521 ) ) ( not ( = ?auto_65516 ?auto_65522 ) ) ( not ( = ?auto_65516 ?auto_65523 ) ) ( not ( = ?auto_65517 ?auto_65518 ) ) ( not ( = ?auto_65517 ?auto_65519 ) ) ( not ( = ?auto_65517 ?auto_65520 ) ) ( not ( = ?auto_65517 ?auto_65521 ) ) ( not ( = ?auto_65517 ?auto_65522 ) ) ( not ( = ?auto_65517 ?auto_65523 ) ) ( not ( = ?auto_65518 ?auto_65519 ) ) ( not ( = ?auto_65518 ?auto_65520 ) ) ( not ( = ?auto_65518 ?auto_65521 ) ) ( not ( = ?auto_65518 ?auto_65522 ) ) ( not ( = ?auto_65518 ?auto_65523 ) ) ( not ( = ?auto_65519 ?auto_65520 ) ) ( not ( = ?auto_65519 ?auto_65521 ) ) ( not ( = ?auto_65519 ?auto_65522 ) ) ( not ( = ?auto_65519 ?auto_65523 ) ) ( not ( = ?auto_65520 ?auto_65521 ) ) ( not ( = ?auto_65520 ?auto_65522 ) ) ( not ( = ?auto_65520 ?auto_65523 ) ) ( not ( = ?auto_65521 ?auto_65522 ) ) ( not ( = ?auto_65521 ?auto_65523 ) ) ( not ( = ?auto_65522 ?auto_65523 ) ) ( CLEAR ?auto_65520 ) ( ON ?auto_65521 ?auto_65522 ) ( CLEAR ?auto_65521 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_65515 ?auto_65516 ?auto_65517 ?auto_65518 ?auto_65519 ?auto_65520 ?auto_65521 )
      ( MAKE-8PILE ?auto_65515 ?auto_65516 ?auto_65517 ?auto_65518 ?auto_65519 ?auto_65520 ?auto_65521 ?auto_65522 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_65532 - BLOCK
      ?auto_65533 - BLOCK
      ?auto_65534 - BLOCK
      ?auto_65535 - BLOCK
      ?auto_65536 - BLOCK
      ?auto_65537 - BLOCK
      ?auto_65538 - BLOCK
      ?auto_65539 - BLOCK
    )
    :vars
    (
      ?auto_65540 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65539 ?auto_65540 ) ( ON-TABLE ?auto_65532 ) ( ON ?auto_65533 ?auto_65532 ) ( ON ?auto_65534 ?auto_65533 ) ( ON ?auto_65535 ?auto_65534 ) ( ON ?auto_65536 ?auto_65535 ) ( not ( = ?auto_65532 ?auto_65533 ) ) ( not ( = ?auto_65532 ?auto_65534 ) ) ( not ( = ?auto_65532 ?auto_65535 ) ) ( not ( = ?auto_65532 ?auto_65536 ) ) ( not ( = ?auto_65532 ?auto_65537 ) ) ( not ( = ?auto_65532 ?auto_65538 ) ) ( not ( = ?auto_65532 ?auto_65539 ) ) ( not ( = ?auto_65532 ?auto_65540 ) ) ( not ( = ?auto_65533 ?auto_65534 ) ) ( not ( = ?auto_65533 ?auto_65535 ) ) ( not ( = ?auto_65533 ?auto_65536 ) ) ( not ( = ?auto_65533 ?auto_65537 ) ) ( not ( = ?auto_65533 ?auto_65538 ) ) ( not ( = ?auto_65533 ?auto_65539 ) ) ( not ( = ?auto_65533 ?auto_65540 ) ) ( not ( = ?auto_65534 ?auto_65535 ) ) ( not ( = ?auto_65534 ?auto_65536 ) ) ( not ( = ?auto_65534 ?auto_65537 ) ) ( not ( = ?auto_65534 ?auto_65538 ) ) ( not ( = ?auto_65534 ?auto_65539 ) ) ( not ( = ?auto_65534 ?auto_65540 ) ) ( not ( = ?auto_65535 ?auto_65536 ) ) ( not ( = ?auto_65535 ?auto_65537 ) ) ( not ( = ?auto_65535 ?auto_65538 ) ) ( not ( = ?auto_65535 ?auto_65539 ) ) ( not ( = ?auto_65535 ?auto_65540 ) ) ( not ( = ?auto_65536 ?auto_65537 ) ) ( not ( = ?auto_65536 ?auto_65538 ) ) ( not ( = ?auto_65536 ?auto_65539 ) ) ( not ( = ?auto_65536 ?auto_65540 ) ) ( not ( = ?auto_65537 ?auto_65538 ) ) ( not ( = ?auto_65537 ?auto_65539 ) ) ( not ( = ?auto_65537 ?auto_65540 ) ) ( not ( = ?auto_65538 ?auto_65539 ) ) ( not ( = ?auto_65538 ?auto_65540 ) ) ( not ( = ?auto_65539 ?auto_65540 ) ) ( ON ?auto_65538 ?auto_65539 ) ( CLEAR ?auto_65536 ) ( ON ?auto_65537 ?auto_65538 ) ( CLEAR ?auto_65537 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_65532 ?auto_65533 ?auto_65534 ?auto_65535 ?auto_65536 ?auto_65537 )
      ( MAKE-8PILE ?auto_65532 ?auto_65533 ?auto_65534 ?auto_65535 ?auto_65536 ?auto_65537 ?auto_65538 ?auto_65539 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_65549 - BLOCK
      ?auto_65550 - BLOCK
      ?auto_65551 - BLOCK
      ?auto_65552 - BLOCK
      ?auto_65553 - BLOCK
      ?auto_65554 - BLOCK
      ?auto_65555 - BLOCK
      ?auto_65556 - BLOCK
    )
    :vars
    (
      ?auto_65557 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65556 ?auto_65557 ) ( ON-TABLE ?auto_65549 ) ( ON ?auto_65550 ?auto_65549 ) ( ON ?auto_65551 ?auto_65550 ) ( ON ?auto_65552 ?auto_65551 ) ( ON ?auto_65553 ?auto_65552 ) ( not ( = ?auto_65549 ?auto_65550 ) ) ( not ( = ?auto_65549 ?auto_65551 ) ) ( not ( = ?auto_65549 ?auto_65552 ) ) ( not ( = ?auto_65549 ?auto_65553 ) ) ( not ( = ?auto_65549 ?auto_65554 ) ) ( not ( = ?auto_65549 ?auto_65555 ) ) ( not ( = ?auto_65549 ?auto_65556 ) ) ( not ( = ?auto_65549 ?auto_65557 ) ) ( not ( = ?auto_65550 ?auto_65551 ) ) ( not ( = ?auto_65550 ?auto_65552 ) ) ( not ( = ?auto_65550 ?auto_65553 ) ) ( not ( = ?auto_65550 ?auto_65554 ) ) ( not ( = ?auto_65550 ?auto_65555 ) ) ( not ( = ?auto_65550 ?auto_65556 ) ) ( not ( = ?auto_65550 ?auto_65557 ) ) ( not ( = ?auto_65551 ?auto_65552 ) ) ( not ( = ?auto_65551 ?auto_65553 ) ) ( not ( = ?auto_65551 ?auto_65554 ) ) ( not ( = ?auto_65551 ?auto_65555 ) ) ( not ( = ?auto_65551 ?auto_65556 ) ) ( not ( = ?auto_65551 ?auto_65557 ) ) ( not ( = ?auto_65552 ?auto_65553 ) ) ( not ( = ?auto_65552 ?auto_65554 ) ) ( not ( = ?auto_65552 ?auto_65555 ) ) ( not ( = ?auto_65552 ?auto_65556 ) ) ( not ( = ?auto_65552 ?auto_65557 ) ) ( not ( = ?auto_65553 ?auto_65554 ) ) ( not ( = ?auto_65553 ?auto_65555 ) ) ( not ( = ?auto_65553 ?auto_65556 ) ) ( not ( = ?auto_65553 ?auto_65557 ) ) ( not ( = ?auto_65554 ?auto_65555 ) ) ( not ( = ?auto_65554 ?auto_65556 ) ) ( not ( = ?auto_65554 ?auto_65557 ) ) ( not ( = ?auto_65555 ?auto_65556 ) ) ( not ( = ?auto_65555 ?auto_65557 ) ) ( not ( = ?auto_65556 ?auto_65557 ) ) ( ON ?auto_65555 ?auto_65556 ) ( CLEAR ?auto_65553 ) ( ON ?auto_65554 ?auto_65555 ) ( CLEAR ?auto_65554 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_65549 ?auto_65550 ?auto_65551 ?auto_65552 ?auto_65553 ?auto_65554 )
      ( MAKE-8PILE ?auto_65549 ?auto_65550 ?auto_65551 ?auto_65552 ?auto_65553 ?auto_65554 ?auto_65555 ?auto_65556 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_65566 - BLOCK
      ?auto_65567 - BLOCK
      ?auto_65568 - BLOCK
      ?auto_65569 - BLOCK
      ?auto_65570 - BLOCK
      ?auto_65571 - BLOCK
      ?auto_65572 - BLOCK
      ?auto_65573 - BLOCK
    )
    :vars
    (
      ?auto_65574 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65573 ?auto_65574 ) ( ON-TABLE ?auto_65566 ) ( ON ?auto_65567 ?auto_65566 ) ( ON ?auto_65568 ?auto_65567 ) ( ON ?auto_65569 ?auto_65568 ) ( not ( = ?auto_65566 ?auto_65567 ) ) ( not ( = ?auto_65566 ?auto_65568 ) ) ( not ( = ?auto_65566 ?auto_65569 ) ) ( not ( = ?auto_65566 ?auto_65570 ) ) ( not ( = ?auto_65566 ?auto_65571 ) ) ( not ( = ?auto_65566 ?auto_65572 ) ) ( not ( = ?auto_65566 ?auto_65573 ) ) ( not ( = ?auto_65566 ?auto_65574 ) ) ( not ( = ?auto_65567 ?auto_65568 ) ) ( not ( = ?auto_65567 ?auto_65569 ) ) ( not ( = ?auto_65567 ?auto_65570 ) ) ( not ( = ?auto_65567 ?auto_65571 ) ) ( not ( = ?auto_65567 ?auto_65572 ) ) ( not ( = ?auto_65567 ?auto_65573 ) ) ( not ( = ?auto_65567 ?auto_65574 ) ) ( not ( = ?auto_65568 ?auto_65569 ) ) ( not ( = ?auto_65568 ?auto_65570 ) ) ( not ( = ?auto_65568 ?auto_65571 ) ) ( not ( = ?auto_65568 ?auto_65572 ) ) ( not ( = ?auto_65568 ?auto_65573 ) ) ( not ( = ?auto_65568 ?auto_65574 ) ) ( not ( = ?auto_65569 ?auto_65570 ) ) ( not ( = ?auto_65569 ?auto_65571 ) ) ( not ( = ?auto_65569 ?auto_65572 ) ) ( not ( = ?auto_65569 ?auto_65573 ) ) ( not ( = ?auto_65569 ?auto_65574 ) ) ( not ( = ?auto_65570 ?auto_65571 ) ) ( not ( = ?auto_65570 ?auto_65572 ) ) ( not ( = ?auto_65570 ?auto_65573 ) ) ( not ( = ?auto_65570 ?auto_65574 ) ) ( not ( = ?auto_65571 ?auto_65572 ) ) ( not ( = ?auto_65571 ?auto_65573 ) ) ( not ( = ?auto_65571 ?auto_65574 ) ) ( not ( = ?auto_65572 ?auto_65573 ) ) ( not ( = ?auto_65572 ?auto_65574 ) ) ( not ( = ?auto_65573 ?auto_65574 ) ) ( ON ?auto_65572 ?auto_65573 ) ( ON ?auto_65571 ?auto_65572 ) ( CLEAR ?auto_65569 ) ( ON ?auto_65570 ?auto_65571 ) ( CLEAR ?auto_65570 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_65566 ?auto_65567 ?auto_65568 ?auto_65569 ?auto_65570 )
      ( MAKE-8PILE ?auto_65566 ?auto_65567 ?auto_65568 ?auto_65569 ?auto_65570 ?auto_65571 ?auto_65572 ?auto_65573 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_65583 - BLOCK
      ?auto_65584 - BLOCK
      ?auto_65585 - BLOCK
      ?auto_65586 - BLOCK
      ?auto_65587 - BLOCK
      ?auto_65588 - BLOCK
      ?auto_65589 - BLOCK
      ?auto_65590 - BLOCK
    )
    :vars
    (
      ?auto_65591 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65590 ?auto_65591 ) ( ON-TABLE ?auto_65583 ) ( ON ?auto_65584 ?auto_65583 ) ( ON ?auto_65585 ?auto_65584 ) ( ON ?auto_65586 ?auto_65585 ) ( not ( = ?auto_65583 ?auto_65584 ) ) ( not ( = ?auto_65583 ?auto_65585 ) ) ( not ( = ?auto_65583 ?auto_65586 ) ) ( not ( = ?auto_65583 ?auto_65587 ) ) ( not ( = ?auto_65583 ?auto_65588 ) ) ( not ( = ?auto_65583 ?auto_65589 ) ) ( not ( = ?auto_65583 ?auto_65590 ) ) ( not ( = ?auto_65583 ?auto_65591 ) ) ( not ( = ?auto_65584 ?auto_65585 ) ) ( not ( = ?auto_65584 ?auto_65586 ) ) ( not ( = ?auto_65584 ?auto_65587 ) ) ( not ( = ?auto_65584 ?auto_65588 ) ) ( not ( = ?auto_65584 ?auto_65589 ) ) ( not ( = ?auto_65584 ?auto_65590 ) ) ( not ( = ?auto_65584 ?auto_65591 ) ) ( not ( = ?auto_65585 ?auto_65586 ) ) ( not ( = ?auto_65585 ?auto_65587 ) ) ( not ( = ?auto_65585 ?auto_65588 ) ) ( not ( = ?auto_65585 ?auto_65589 ) ) ( not ( = ?auto_65585 ?auto_65590 ) ) ( not ( = ?auto_65585 ?auto_65591 ) ) ( not ( = ?auto_65586 ?auto_65587 ) ) ( not ( = ?auto_65586 ?auto_65588 ) ) ( not ( = ?auto_65586 ?auto_65589 ) ) ( not ( = ?auto_65586 ?auto_65590 ) ) ( not ( = ?auto_65586 ?auto_65591 ) ) ( not ( = ?auto_65587 ?auto_65588 ) ) ( not ( = ?auto_65587 ?auto_65589 ) ) ( not ( = ?auto_65587 ?auto_65590 ) ) ( not ( = ?auto_65587 ?auto_65591 ) ) ( not ( = ?auto_65588 ?auto_65589 ) ) ( not ( = ?auto_65588 ?auto_65590 ) ) ( not ( = ?auto_65588 ?auto_65591 ) ) ( not ( = ?auto_65589 ?auto_65590 ) ) ( not ( = ?auto_65589 ?auto_65591 ) ) ( not ( = ?auto_65590 ?auto_65591 ) ) ( ON ?auto_65589 ?auto_65590 ) ( ON ?auto_65588 ?auto_65589 ) ( CLEAR ?auto_65586 ) ( ON ?auto_65587 ?auto_65588 ) ( CLEAR ?auto_65587 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_65583 ?auto_65584 ?auto_65585 ?auto_65586 ?auto_65587 )
      ( MAKE-8PILE ?auto_65583 ?auto_65584 ?auto_65585 ?auto_65586 ?auto_65587 ?auto_65588 ?auto_65589 ?auto_65590 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_65600 - BLOCK
      ?auto_65601 - BLOCK
      ?auto_65602 - BLOCK
      ?auto_65603 - BLOCK
      ?auto_65604 - BLOCK
      ?auto_65605 - BLOCK
      ?auto_65606 - BLOCK
      ?auto_65607 - BLOCK
    )
    :vars
    (
      ?auto_65608 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65607 ?auto_65608 ) ( ON-TABLE ?auto_65600 ) ( ON ?auto_65601 ?auto_65600 ) ( ON ?auto_65602 ?auto_65601 ) ( not ( = ?auto_65600 ?auto_65601 ) ) ( not ( = ?auto_65600 ?auto_65602 ) ) ( not ( = ?auto_65600 ?auto_65603 ) ) ( not ( = ?auto_65600 ?auto_65604 ) ) ( not ( = ?auto_65600 ?auto_65605 ) ) ( not ( = ?auto_65600 ?auto_65606 ) ) ( not ( = ?auto_65600 ?auto_65607 ) ) ( not ( = ?auto_65600 ?auto_65608 ) ) ( not ( = ?auto_65601 ?auto_65602 ) ) ( not ( = ?auto_65601 ?auto_65603 ) ) ( not ( = ?auto_65601 ?auto_65604 ) ) ( not ( = ?auto_65601 ?auto_65605 ) ) ( not ( = ?auto_65601 ?auto_65606 ) ) ( not ( = ?auto_65601 ?auto_65607 ) ) ( not ( = ?auto_65601 ?auto_65608 ) ) ( not ( = ?auto_65602 ?auto_65603 ) ) ( not ( = ?auto_65602 ?auto_65604 ) ) ( not ( = ?auto_65602 ?auto_65605 ) ) ( not ( = ?auto_65602 ?auto_65606 ) ) ( not ( = ?auto_65602 ?auto_65607 ) ) ( not ( = ?auto_65602 ?auto_65608 ) ) ( not ( = ?auto_65603 ?auto_65604 ) ) ( not ( = ?auto_65603 ?auto_65605 ) ) ( not ( = ?auto_65603 ?auto_65606 ) ) ( not ( = ?auto_65603 ?auto_65607 ) ) ( not ( = ?auto_65603 ?auto_65608 ) ) ( not ( = ?auto_65604 ?auto_65605 ) ) ( not ( = ?auto_65604 ?auto_65606 ) ) ( not ( = ?auto_65604 ?auto_65607 ) ) ( not ( = ?auto_65604 ?auto_65608 ) ) ( not ( = ?auto_65605 ?auto_65606 ) ) ( not ( = ?auto_65605 ?auto_65607 ) ) ( not ( = ?auto_65605 ?auto_65608 ) ) ( not ( = ?auto_65606 ?auto_65607 ) ) ( not ( = ?auto_65606 ?auto_65608 ) ) ( not ( = ?auto_65607 ?auto_65608 ) ) ( ON ?auto_65606 ?auto_65607 ) ( ON ?auto_65605 ?auto_65606 ) ( ON ?auto_65604 ?auto_65605 ) ( CLEAR ?auto_65602 ) ( ON ?auto_65603 ?auto_65604 ) ( CLEAR ?auto_65603 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_65600 ?auto_65601 ?auto_65602 ?auto_65603 )
      ( MAKE-8PILE ?auto_65600 ?auto_65601 ?auto_65602 ?auto_65603 ?auto_65604 ?auto_65605 ?auto_65606 ?auto_65607 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_65617 - BLOCK
      ?auto_65618 - BLOCK
      ?auto_65619 - BLOCK
      ?auto_65620 - BLOCK
      ?auto_65621 - BLOCK
      ?auto_65622 - BLOCK
      ?auto_65623 - BLOCK
      ?auto_65624 - BLOCK
    )
    :vars
    (
      ?auto_65625 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65624 ?auto_65625 ) ( ON-TABLE ?auto_65617 ) ( ON ?auto_65618 ?auto_65617 ) ( ON ?auto_65619 ?auto_65618 ) ( not ( = ?auto_65617 ?auto_65618 ) ) ( not ( = ?auto_65617 ?auto_65619 ) ) ( not ( = ?auto_65617 ?auto_65620 ) ) ( not ( = ?auto_65617 ?auto_65621 ) ) ( not ( = ?auto_65617 ?auto_65622 ) ) ( not ( = ?auto_65617 ?auto_65623 ) ) ( not ( = ?auto_65617 ?auto_65624 ) ) ( not ( = ?auto_65617 ?auto_65625 ) ) ( not ( = ?auto_65618 ?auto_65619 ) ) ( not ( = ?auto_65618 ?auto_65620 ) ) ( not ( = ?auto_65618 ?auto_65621 ) ) ( not ( = ?auto_65618 ?auto_65622 ) ) ( not ( = ?auto_65618 ?auto_65623 ) ) ( not ( = ?auto_65618 ?auto_65624 ) ) ( not ( = ?auto_65618 ?auto_65625 ) ) ( not ( = ?auto_65619 ?auto_65620 ) ) ( not ( = ?auto_65619 ?auto_65621 ) ) ( not ( = ?auto_65619 ?auto_65622 ) ) ( not ( = ?auto_65619 ?auto_65623 ) ) ( not ( = ?auto_65619 ?auto_65624 ) ) ( not ( = ?auto_65619 ?auto_65625 ) ) ( not ( = ?auto_65620 ?auto_65621 ) ) ( not ( = ?auto_65620 ?auto_65622 ) ) ( not ( = ?auto_65620 ?auto_65623 ) ) ( not ( = ?auto_65620 ?auto_65624 ) ) ( not ( = ?auto_65620 ?auto_65625 ) ) ( not ( = ?auto_65621 ?auto_65622 ) ) ( not ( = ?auto_65621 ?auto_65623 ) ) ( not ( = ?auto_65621 ?auto_65624 ) ) ( not ( = ?auto_65621 ?auto_65625 ) ) ( not ( = ?auto_65622 ?auto_65623 ) ) ( not ( = ?auto_65622 ?auto_65624 ) ) ( not ( = ?auto_65622 ?auto_65625 ) ) ( not ( = ?auto_65623 ?auto_65624 ) ) ( not ( = ?auto_65623 ?auto_65625 ) ) ( not ( = ?auto_65624 ?auto_65625 ) ) ( ON ?auto_65623 ?auto_65624 ) ( ON ?auto_65622 ?auto_65623 ) ( ON ?auto_65621 ?auto_65622 ) ( CLEAR ?auto_65619 ) ( ON ?auto_65620 ?auto_65621 ) ( CLEAR ?auto_65620 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_65617 ?auto_65618 ?auto_65619 ?auto_65620 )
      ( MAKE-8PILE ?auto_65617 ?auto_65618 ?auto_65619 ?auto_65620 ?auto_65621 ?auto_65622 ?auto_65623 ?auto_65624 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_65634 - BLOCK
      ?auto_65635 - BLOCK
      ?auto_65636 - BLOCK
      ?auto_65637 - BLOCK
      ?auto_65638 - BLOCK
      ?auto_65639 - BLOCK
      ?auto_65640 - BLOCK
      ?auto_65641 - BLOCK
    )
    :vars
    (
      ?auto_65642 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65641 ?auto_65642 ) ( ON-TABLE ?auto_65634 ) ( ON ?auto_65635 ?auto_65634 ) ( not ( = ?auto_65634 ?auto_65635 ) ) ( not ( = ?auto_65634 ?auto_65636 ) ) ( not ( = ?auto_65634 ?auto_65637 ) ) ( not ( = ?auto_65634 ?auto_65638 ) ) ( not ( = ?auto_65634 ?auto_65639 ) ) ( not ( = ?auto_65634 ?auto_65640 ) ) ( not ( = ?auto_65634 ?auto_65641 ) ) ( not ( = ?auto_65634 ?auto_65642 ) ) ( not ( = ?auto_65635 ?auto_65636 ) ) ( not ( = ?auto_65635 ?auto_65637 ) ) ( not ( = ?auto_65635 ?auto_65638 ) ) ( not ( = ?auto_65635 ?auto_65639 ) ) ( not ( = ?auto_65635 ?auto_65640 ) ) ( not ( = ?auto_65635 ?auto_65641 ) ) ( not ( = ?auto_65635 ?auto_65642 ) ) ( not ( = ?auto_65636 ?auto_65637 ) ) ( not ( = ?auto_65636 ?auto_65638 ) ) ( not ( = ?auto_65636 ?auto_65639 ) ) ( not ( = ?auto_65636 ?auto_65640 ) ) ( not ( = ?auto_65636 ?auto_65641 ) ) ( not ( = ?auto_65636 ?auto_65642 ) ) ( not ( = ?auto_65637 ?auto_65638 ) ) ( not ( = ?auto_65637 ?auto_65639 ) ) ( not ( = ?auto_65637 ?auto_65640 ) ) ( not ( = ?auto_65637 ?auto_65641 ) ) ( not ( = ?auto_65637 ?auto_65642 ) ) ( not ( = ?auto_65638 ?auto_65639 ) ) ( not ( = ?auto_65638 ?auto_65640 ) ) ( not ( = ?auto_65638 ?auto_65641 ) ) ( not ( = ?auto_65638 ?auto_65642 ) ) ( not ( = ?auto_65639 ?auto_65640 ) ) ( not ( = ?auto_65639 ?auto_65641 ) ) ( not ( = ?auto_65639 ?auto_65642 ) ) ( not ( = ?auto_65640 ?auto_65641 ) ) ( not ( = ?auto_65640 ?auto_65642 ) ) ( not ( = ?auto_65641 ?auto_65642 ) ) ( ON ?auto_65640 ?auto_65641 ) ( ON ?auto_65639 ?auto_65640 ) ( ON ?auto_65638 ?auto_65639 ) ( ON ?auto_65637 ?auto_65638 ) ( CLEAR ?auto_65635 ) ( ON ?auto_65636 ?auto_65637 ) ( CLEAR ?auto_65636 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_65634 ?auto_65635 ?auto_65636 )
      ( MAKE-8PILE ?auto_65634 ?auto_65635 ?auto_65636 ?auto_65637 ?auto_65638 ?auto_65639 ?auto_65640 ?auto_65641 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_65651 - BLOCK
      ?auto_65652 - BLOCK
      ?auto_65653 - BLOCK
      ?auto_65654 - BLOCK
      ?auto_65655 - BLOCK
      ?auto_65656 - BLOCK
      ?auto_65657 - BLOCK
      ?auto_65658 - BLOCK
    )
    :vars
    (
      ?auto_65659 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65658 ?auto_65659 ) ( ON-TABLE ?auto_65651 ) ( ON ?auto_65652 ?auto_65651 ) ( not ( = ?auto_65651 ?auto_65652 ) ) ( not ( = ?auto_65651 ?auto_65653 ) ) ( not ( = ?auto_65651 ?auto_65654 ) ) ( not ( = ?auto_65651 ?auto_65655 ) ) ( not ( = ?auto_65651 ?auto_65656 ) ) ( not ( = ?auto_65651 ?auto_65657 ) ) ( not ( = ?auto_65651 ?auto_65658 ) ) ( not ( = ?auto_65651 ?auto_65659 ) ) ( not ( = ?auto_65652 ?auto_65653 ) ) ( not ( = ?auto_65652 ?auto_65654 ) ) ( not ( = ?auto_65652 ?auto_65655 ) ) ( not ( = ?auto_65652 ?auto_65656 ) ) ( not ( = ?auto_65652 ?auto_65657 ) ) ( not ( = ?auto_65652 ?auto_65658 ) ) ( not ( = ?auto_65652 ?auto_65659 ) ) ( not ( = ?auto_65653 ?auto_65654 ) ) ( not ( = ?auto_65653 ?auto_65655 ) ) ( not ( = ?auto_65653 ?auto_65656 ) ) ( not ( = ?auto_65653 ?auto_65657 ) ) ( not ( = ?auto_65653 ?auto_65658 ) ) ( not ( = ?auto_65653 ?auto_65659 ) ) ( not ( = ?auto_65654 ?auto_65655 ) ) ( not ( = ?auto_65654 ?auto_65656 ) ) ( not ( = ?auto_65654 ?auto_65657 ) ) ( not ( = ?auto_65654 ?auto_65658 ) ) ( not ( = ?auto_65654 ?auto_65659 ) ) ( not ( = ?auto_65655 ?auto_65656 ) ) ( not ( = ?auto_65655 ?auto_65657 ) ) ( not ( = ?auto_65655 ?auto_65658 ) ) ( not ( = ?auto_65655 ?auto_65659 ) ) ( not ( = ?auto_65656 ?auto_65657 ) ) ( not ( = ?auto_65656 ?auto_65658 ) ) ( not ( = ?auto_65656 ?auto_65659 ) ) ( not ( = ?auto_65657 ?auto_65658 ) ) ( not ( = ?auto_65657 ?auto_65659 ) ) ( not ( = ?auto_65658 ?auto_65659 ) ) ( ON ?auto_65657 ?auto_65658 ) ( ON ?auto_65656 ?auto_65657 ) ( ON ?auto_65655 ?auto_65656 ) ( ON ?auto_65654 ?auto_65655 ) ( CLEAR ?auto_65652 ) ( ON ?auto_65653 ?auto_65654 ) ( CLEAR ?auto_65653 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_65651 ?auto_65652 ?auto_65653 )
      ( MAKE-8PILE ?auto_65651 ?auto_65652 ?auto_65653 ?auto_65654 ?auto_65655 ?auto_65656 ?auto_65657 ?auto_65658 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_65668 - BLOCK
      ?auto_65669 - BLOCK
      ?auto_65670 - BLOCK
      ?auto_65671 - BLOCK
      ?auto_65672 - BLOCK
      ?auto_65673 - BLOCK
      ?auto_65674 - BLOCK
      ?auto_65675 - BLOCK
    )
    :vars
    (
      ?auto_65676 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65675 ?auto_65676 ) ( ON-TABLE ?auto_65668 ) ( not ( = ?auto_65668 ?auto_65669 ) ) ( not ( = ?auto_65668 ?auto_65670 ) ) ( not ( = ?auto_65668 ?auto_65671 ) ) ( not ( = ?auto_65668 ?auto_65672 ) ) ( not ( = ?auto_65668 ?auto_65673 ) ) ( not ( = ?auto_65668 ?auto_65674 ) ) ( not ( = ?auto_65668 ?auto_65675 ) ) ( not ( = ?auto_65668 ?auto_65676 ) ) ( not ( = ?auto_65669 ?auto_65670 ) ) ( not ( = ?auto_65669 ?auto_65671 ) ) ( not ( = ?auto_65669 ?auto_65672 ) ) ( not ( = ?auto_65669 ?auto_65673 ) ) ( not ( = ?auto_65669 ?auto_65674 ) ) ( not ( = ?auto_65669 ?auto_65675 ) ) ( not ( = ?auto_65669 ?auto_65676 ) ) ( not ( = ?auto_65670 ?auto_65671 ) ) ( not ( = ?auto_65670 ?auto_65672 ) ) ( not ( = ?auto_65670 ?auto_65673 ) ) ( not ( = ?auto_65670 ?auto_65674 ) ) ( not ( = ?auto_65670 ?auto_65675 ) ) ( not ( = ?auto_65670 ?auto_65676 ) ) ( not ( = ?auto_65671 ?auto_65672 ) ) ( not ( = ?auto_65671 ?auto_65673 ) ) ( not ( = ?auto_65671 ?auto_65674 ) ) ( not ( = ?auto_65671 ?auto_65675 ) ) ( not ( = ?auto_65671 ?auto_65676 ) ) ( not ( = ?auto_65672 ?auto_65673 ) ) ( not ( = ?auto_65672 ?auto_65674 ) ) ( not ( = ?auto_65672 ?auto_65675 ) ) ( not ( = ?auto_65672 ?auto_65676 ) ) ( not ( = ?auto_65673 ?auto_65674 ) ) ( not ( = ?auto_65673 ?auto_65675 ) ) ( not ( = ?auto_65673 ?auto_65676 ) ) ( not ( = ?auto_65674 ?auto_65675 ) ) ( not ( = ?auto_65674 ?auto_65676 ) ) ( not ( = ?auto_65675 ?auto_65676 ) ) ( ON ?auto_65674 ?auto_65675 ) ( ON ?auto_65673 ?auto_65674 ) ( ON ?auto_65672 ?auto_65673 ) ( ON ?auto_65671 ?auto_65672 ) ( ON ?auto_65670 ?auto_65671 ) ( CLEAR ?auto_65668 ) ( ON ?auto_65669 ?auto_65670 ) ( CLEAR ?auto_65669 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_65668 ?auto_65669 )
      ( MAKE-8PILE ?auto_65668 ?auto_65669 ?auto_65670 ?auto_65671 ?auto_65672 ?auto_65673 ?auto_65674 ?auto_65675 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_65685 - BLOCK
      ?auto_65686 - BLOCK
      ?auto_65687 - BLOCK
      ?auto_65688 - BLOCK
      ?auto_65689 - BLOCK
      ?auto_65690 - BLOCK
      ?auto_65691 - BLOCK
      ?auto_65692 - BLOCK
    )
    :vars
    (
      ?auto_65693 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65692 ?auto_65693 ) ( ON-TABLE ?auto_65685 ) ( not ( = ?auto_65685 ?auto_65686 ) ) ( not ( = ?auto_65685 ?auto_65687 ) ) ( not ( = ?auto_65685 ?auto_65688 ) ) ( not ( = ?auto_65685 ?auto_65689 ) ) ( not ( = ?auto_65685 ?auto_65690 ) ) ( not ( = ?auto_65685 ?auto_65691 ) ) ( not ( = ?auto_65685 ?auto_65692 ) ) ( not ( = ?auto_65685 ?auto_65693 ) ) ( not ( = ?auto_65686 ?auto_65687 ) ) ( not ( = ?auto_65686 ?auto_65688 ) ) ( not ( = ?auto_65686 ?auto_65689 ) ) ( not ( = ?auto_65686 ?auto_65690 ) ) ( not ( = ?auto_65686 ?auto_65691 ) ) ( not ( = ?auto_65686 ?auto_65692 ) ) ( not ( = ?auto_65686 ?auto_65693 ) ) ( not ( = ?auto_65687 ?auto_65688 ) ) ( not ( = ?auto_65687 ?auto_65689 ) ) ( not ( = ?auto_65687 ?auto_65690 ) ) ( not ( = ?auto_65687 ?auto_65691 ) ) ( not ( = ?auto_65687 ?auto_65692 ) ) ( not ( = ?auto_65687 ?auto_65693 ) ) ( not ( = ?auto_65688 ?auto_65689 ) ) ( not ( = ?auto_65688 ?auto_65690 ) ) ( not ( = ?auto_65688 ?auto_65691 ) ) ( not ( = ?auto_65688 ?auto_65692 ) ) ( not ( = ?auto_65688 ?auto_65693 ) ) ( not ( = ?auto_65689 ?auto_65690 ) ) ( not ( = ?auto_65689 ?auto_65691 ) ) ( not ( = ?auto_65689 ?auto_65692 ) ) ( not ( = ?auto_65689 ?auto_65693 ) ) ( not ( = ?auto_65690 ?auto_65691 ) ) ( not ( = ?auto_65690 ?auto_65692 ) ) ( not ( = ?auto_65690 ?auto_65693 ) ) ( not ( = ?auto_65691 ?auto_65692 ) ) ( not ( = ?auto_65691 ?auto_65693 ) ) ( not ( = ?auto_65692 ?auto_65693 ) ) ( ON ?auto_65691 ?auto_65692 ) ( ON ?auto_65690 ?auto_65691 ) ( ON ?auto_65689 ?auto_65690 ) ( ON ?auto_65688 ?auto_65689 ) ( ON ?auto_65687 ?auto_65688 ) ( CLEAR ?auto_65685 ) ( ON ?auto_65686 ?auto_65687 ) ( CLEAR ?auto_65686 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_65685 ?auto_65686 )
      ( MAKE-8PILE ?auto_65685 ?auto_65686 ?auto_65687 ?auto_65688 ?auto_65689 ?auto_65690 ?auto_65691 ?auto_65692 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_65702 - BLOCK
      ?auto_65703 - BLOCK
      ?auto_65704 - BLOCK
      ?auto_65705 - BLOCK
      ?auto_65706 - BLOCK
      ?auto_65707 - BLOCK
      ?auto_65708 - BLOCK
      ?auto_65709 - BLOCK
    )
    :vars
    (
      ?auto_65710 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65709 ?auto_65710 ) ( not ( = ?auto_65702 ?auto_65703 ) ) ( not ( = ?auto_65702 ?auto_65704 ) ) ( not ( = ?auto_65702 ?auto_65705 ) ) ( not ( = ?auto_65702 ?auto_65706 ) ) ( not ( = ?auto_65702 ?auto_65707 ) ) ( not ( = ?auto_65702 ?auto_65708 ) ) ( not ( = ?auto_65702 ?auto_65709 ) ) ( not ( = ?auto_65702 ?auto_65710 ) ) ( not ( = ?auto_65703 ?auto_65704 ) ) ( not ( = ?auto_65703 ?auto_65705 ) ) ( not ( = ?auto_65703 ?auto_65706 ) ) ( not ( = ?auto_65703 ?auto_65707 ) ) ( not ( = ?auto_65703 ?auto_65708 ) ) ( not ( = ?auto_65703 ?auto_65709 ) ) ( not ( = ?auto_65703 ?auto_65710 ) ) ( not ( = ?auto_65704 ?auto_65705 ) ) ( not ( = ?auto_65704 ?auto_65706 ) ) ( not ( = ?auto_65704 ?auto_65707 ) ) ( not ( = ?auto_65704 ?auto_65708 ) ) ( not ( = ?auto_65704 ?auto_65709 ) ) ( not ( = ?auto_65704 ?auto_65710 ) ) ( not ( = ?auto_65705 ?auto_65706 ) ) ( not ( = ?auto_65705 ?auto_65707 ) ) ( not ( = ?auto_65705 ?auto_65708 ) ) ( not ( = ?auto_65705 ?auto_65709 ) ) ( not ( = ?auto_65705 ?auto_65710 ) ) ( not ( = ?auto_65706 ?auto_65707 ) ) ( not ( = ?auto_65706 ?auto_65708 ) ) ( not ( = ?auto_65706 ?auto_65709 ) ) ( not ( = ?auto_65706 ?auto_65710 ) ) ( not ( = ?auto_65707 ?auto_65708 ) ) ( not ( = ?auto_65707 ?auto_65709 ) ) ( not ( = ?auto_65707 ?auto_65710 ) ) ( not ( = ?auto_65708 ?auto_65709 ) ) ( not ( = ?auto_65708 ?auto_65710 ) ) ( not ( = ?auto_65709 ?auto_65710 ) ) ( ON ?auto_65708 ?auto_65709 ) ( ON ?auto_65707 ?auto_65708 ) ( ON ?auto_65706 ?auto_65707 ) ( ON ?auto_65705 ?auto_65706 ) ( ON ?auto_65704 ?auto_65705 ) ( ON ?auto_65703 ?auto_65704 ) ( ON ?auto_65702 ?auto_65703 ) ( CLEAR ?auto_65702 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_65702 )
      ( MAKE-8PILE ?auto_65702 ?auto_65703 ?auto_65704 ?auto_65705 ?auto_65706 ?auto_65707 ?auto_65708 ?auto_65709 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_65719 - BLOCK
      ?auto_65720 - BLOCK
      ?auto_65721 - BLOCK
      ?auto_65722 - BLOCK
      ?auto_65723 - BLOCK
      ?auto_65724 - BLOCK
      ?auto_65725 - BLOCK
      ?auto_65726 - BLOCK
    )
    :vars
    (
      ?auto_65727 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65726 ?auto_65727 ) ( not ( = ?auto_65719 ?auto_65720 ) ) ( not ( = ?auto_65719 ?auto_65721 ) ) ( not ( = ?auto_65719 ?auto_65722 ) ) ( not ( = ?auto_65719 ?auto_65723 ) ) ( not ( = ?auto_65719 ?auto_65724 ) ) ( not ( = ?auto_65719 ?auto_65725 ) ) ( not ( = ?auto_65719 ?auto_65726 ) ) ( not ( = ?auto_65719 ?auto_65727 ) ) ( not ( = ?auto_65720 ?auto_65721 ) ) ( not ( = ?auto_65720 ?auto_65722 ) ) ( not ( = ?auto_65720 ?auto_65723 ) ) ( not ( = ?auto_65720 ?auto_65724 ) ) ( not ( = ?auto_65720 ?auto_65725 ) ) ( not ( = ?auto_65720 ?auto_65726 ) ) ( not ( = ?auto_65720 ?auto_65727 ) ) ( not ( = ?auto_65721 ?auto_65722 ) ) ( not ( = ?auto_65721 ?auto_65723 ) ) ( not ( = ?auto_65721 ?auto_65724 ) ) ( not ( = ?auto_65721 ?auto_65725 ) ) ( not ( = ?auto_65721 ?auto_65726 ) ) ( not ( = ?auto_65721 ?auto_65727 ) ) ( not ( = ?auto_65722 ?auto_65723 ) ) ( not ( = ?auto_65722 ?auto_65724 ) ) ( not ( = ?auto_65722 ?auto_65725 ) ) ( not ( = ?auto_65722 ?auto_65726 ) ) ( not ( = ?auto_65722 ?auto_65727 ) ) ( not ( = ?auto_65723 ?auto_65724 ) ) ( not ( = ?auto_65723 ?auto_65725 ) ) ( not ( = ?auto_65723 ?auto_65726 ) ) ( not ( = ?auto_65723 ?auto_65727 ) ) ( not ( = ?auto_65724 ?auto_65725 ) ) ( not ( = ?auto_65724 ?auto_65726 ) ) ( not ( = ?auto_65724 ?auto_65727 ) ) ( not ( = ?auto_65725 ?auto_65726 ) ) ( not ( = ?auto_65725 ?auto_65727 ) ) ( not ( = ?auto_65726 ?auto_65727 ) ) ( ON ?auto_65725 ?auto_65726 ) ( ON ?auto_65724 ?auto_65725 ) ( ON ?auto_65723 ?auto_65724 ) ( ON ?auto_65722 ?auto_65723 ) ( ON ?auto_65721 ?auto_65722 ) ( ON ?auto_65720 ?auto_65721 ) ( ON ?auto_65719 ?auto_65720 ) ( CLEAR ?auto_65719 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_65719 )
      ( MAKE-8PILE ?auto_65719 ?auto_65720 ?auto_65721 ?auto_65722 ?auto_65723 ?auto_65724 ?auto_65725 ?auto_65726 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_65737 - BLOCK
      ?auto_65738 - BLOCK
      ?auto_65739 - BLOCK
      ?auto_65740 - BLOCK
      ?auto_65741 - BLOCK
      ?auto_65742 - BLOCK
      ?auto_65743 - BLOCK
      ?auto_65744 - BLOCK
      ?auto_65745 - BLOCK
    )
    :vars
    (
      ?auto_65746 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_65744 ) ( ON ?auto_65745 ?auto_65746 ) ( CLEAR ?auto_65745 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_65737 ) ( ON ?auto_65738 ?auto_65737 ) ( ON ?auto_65739 ?auto_65738 ) ( ON ?auto_65740 ?auto_65739 ) ( ON ?auto_65741 ?auto_65740 ) ( ON ?auto_65742 ?auto_65741 ) ( ON ?auto_65743 ?auto_65742 ) ( ON ?auto_65744 ?auto_65743 ) ( not ( = ?auto_65737 ?auto_65738 ) ) ( not ( = ?auto_65737 ?auto_65739 ) ) ( not ( = ?auto_65737 ?auto_65740 ) ) ( not ( = ?auto_65737 ?auto_65741 ) ) ( not ( = ?auto_65737 ?auto_65742 ) ) ( not ( = ?auto_65737 ?auto_65743 ) ) ( not ( = ?auto_65737 ?auto_65744 ) ) ( not ( = ?auto_65737 ?auto_65745 ) ) ( not ( = ?auto_65737 ?auto_65746 ) ) ( not ( = ?auto_65738 ?auto_65739 ) ) ( not ( = ?auto_65738 ?auto_65740 ) ) ( not ( = ?auto_65738 ?auto_65741 ) ) ( not ( = ?auto_65738 ?auto_65742 ) ) ( not ( = ?auto_65738 ?auto_65743 ) ) ( not ( = ?auto_65738 ?auto_65744 ) ) ( not ( = ?auto_65738 ?auto_65745 ) ) ( not ( = ?auto_65738 ?auto_65746 ) ) ( not ( = ?auto_65739 ?auto_65740 ) ) ( not ( = ?auto_65739 ?auto_65741 ) ) ( not ( = ?auto_65739 ?auto_65742 ) ) ( not ( = ?auto_65739 ?auto_65743 ) ) ( not ( = ?auto_65739 ?auto_65744 ) ) ( not ( = ?auto_65739 ?auto_65745 ) ) ( not ( = ?auto_65739 ?auto_65746 ) ) ( not ( = ?auto_65740 ?auto_65741 ) ) ( not ( = ?auto_65740 ?auto_65742 ) ) ( not ( = ?auto_65740 ?auto_65743 ) ) ( not ( = ?auto_65740 ?auto_65744 ) ) ( not ( = ?auto_65740 ?auto_65745 ) ) ( not ( = ?auto_65740 ?auto_65746 ) ) ( not ( = ?auto_65741 ?auto_65742 ) ) ( not ( = ?auto_65741 ?auto_65743 ) ) ( not ( = ?auto_65741 ?auto_65744 ) ) ( not ( = ?auto_65741 ?auto_65745 ) ) ( not ( = ?auto_65741 ?auto_65746 ) ) ( not ( = ?auto_65742 ?auto_65743 ) ) ( not ( = ?auto_65742 ?auto_65744 ) ) ( not ( = ?auto_65742 ?auto_65745 ) ) ( not ( = ?auto_65742 ?auto_65746 ) ) ( not ( = ?auto_65743 ?auto_65744 ) ) ( not ( = ?auto_65743 ?auto_65745 ) ) ( not ( = ?auto_65743 ?auto_65746 ) ) ( not ( = ?auto_65744 ?auto_65745 ) ) ( not ( = ?auto_65744 ?auto_65746 ) ) ( not ( = ?auto_65745 ?auto_65746 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_65745 ?auto_65746 )
      ( !STACK ?auto_65745 ?auto_65744 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_65756 - BLOCK
      ?auto_65757 - BLOCK
      ?auto_65758 - BLOCK
      ?auto_65759 - BLOCK
      ?auto_65760 - BLOCK
      ?auto_65761 - BLOCK
      ?auto_65762 - BLOCK
      ?auto_65763 - BLOCK
      ?auto_65764 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_65763 ) ( ON-TABLE ?auto_65764 ) ( CLEAR ?auto_65764 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_65756 ) ( ON ?auto_65757 ?auto_65756 ) ( ON ?auto_65758 ?auto_65757 ) ( ON ?auto_65759 ?auto_65758 ) ( ON ?auto_65760 ?auto_65759 ) ( ON ?auto_65761 ?auto_65760 ) ( ON ?auto_65762 ?auto_65761 ) ( ON ?auto_65763 ?auto_65762 ) ( not ( = ?auto_65756 ?auto_65757 ) ) ( not ( = ?auto_65756 ?auto_65758 ) ) ( not ( = ?auto_65756 ?auto_65759 ) ) ( not ( = ?auto_65756 ?auto_65760 ) ) ( not ( = ?auto_65756 ?auto_65761 ) ) ( not ( = ?auto_65756 ?auto_65762 ) ) ( not ( = ?auto_65756 ?auto_65763 ) ) ( not ( = ?auto_65756 ?auto_65764 ) ) ( not ( = ?auto_65757 ?auto_65758 ) ) ( not ( = ?auto_65757 ?auto_65759 ) ) ( not ( = ?auto_65757 ?auto_65760 ) ) ( not ( = ?auto_65757 ?auto_65761 ) ) ( not ( = ?auto_65757 ?auto_65762 ) ) ( not ( = ?auto_65757 ?auto_65763 ) ) ( not ( = ?auto_65757 ?auto_65764 ) ) ( not ( = ?auto_65758 ?auto_65759 ) ) ( not ( = ?auto_65758 ?auto_65760 ) ) ( not ( = ?auto_65758 ?auto_65761 ) ) ( not ( = ?auto_65758 ?auto_65762 ) ) ( not ( = ?auto_65758 ?auto_65763 ) ) ( not ( = ?auto_65758 ?auto_65764 ) ) ( not ( = ?auto_65759 ?auto_65760 ) ) ( not ( = ?auto_65759 ?auto_65761 ) ) ( not ( = ?auto_65759 ?auto_65762 ) ) ( not ( = ?auto_65759 ?auto_65763 ) ) ( not ( = ?auto_65759 ?auto_65764 ) ) ( not ( = ?auto_65760 ?auto_65761 ) ) ( not ( = ?auto_65760 ?auto_65762 ) ) ( not ( = ?auto_65760 ?auto_65763 ) ) ( not ( = ?auto_65760 ?auto_65764 ) ) ( not ( = ?auto_65761 ?auto_65762 ) ) ( not ( = ?auto_65761 ?auto_65763 ) ) ( not ( = ?auto_65761 ?auto_65764 ) ) ( not ( = ?auto_65762 ?auto_65763 ) ) ( not ( = ?auto_65762 ?auto_65764 ) ) ( not ( = ?auto_65763 ?auto_65764 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_65764 )
      ( !STACK ?auto_65764 ?auto_65763 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_65774 - BLOCK
      ?auto_65775 - BLOCK
      ?auto_65776 - BLOCK
      ?auto_65777 - BLOCK
      ?auto_65778 - BLOCK
      ?auto_65779 - BLOCK
      ?auto_65780 - BLOCK
      ?auto_65781 - BLOCK
      ?auto_65782 - BLOCK
    )
    :vars
    (
      ?auto_65783 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65782 ?auto_65783 ) ( ON-TABLE ?auto_65774 ) ( ON ?auto_65775 ?auto_65774 ) ( ON ?auto_65776 ?auto_65775 ) ( ON ?auto_65777 ?auto_65776 ) ( ON ?auto_65778 ?auto_65777 ) ( ON ?auto_65779 ?auto_65778 ) ( ON ?auto_65780 ?auto_65779 ) ( not ( = ?auto_65774 ?auto_65775 ) ) ( not ( = ?auto_65774 ?auto_65776 ) ) ( not ( = ?auto_65774 ?auto_65777 ) ) ( not ( = ?auto_65774 ?auto_65778 ) ) ( not ( = ?auto_65774 ?auto_65779 ) ) ( not ( = ?auto_65774 ?auto_65780 ) ) ( not ( = ?auto_65774 ?auto_65781 ) ) ( not ( = ?auto_65774 ?auto_65782 ) ) ( not ( = ?auto_65774 ?auto_65783 ) ) ( not ( = ?auto_65775 ?auto_65776 ) ) ( not ( = ?auto_65775 ?auto_65777 ) ) ( not ( = ?auto_65775 ?auto_65778 ) ) ( not ( = ?auto_65775 ?auto_65779 ) ) ( not ( = ?auto_65775 ?auto_65780 ) ) ( not ( = ?auto_65775 ?auto_65781 ) ) ( not ( = ?auto_65775 ?auto_65782 ) ) ( not ( = ?auto_65775 ?auto_65783 ) ) ( not ( = ?auto_65776 ?auto_65777 ) ) ( not ( = ?auto_65776 ?auto_65778 ) ) ( not ( = ?auto_65776 ?auto_65779 ) ) ( not ( = ?auto_65776 ?auto_65780 ) ) ( not ( = ?auto_65776 ?auto_65781 ) ) ( not ( = ?auto_65776 ?auto_65782 ) ) ( not ( = ?auto_65776 ?auto_65783 ) ) ( not ( = ?auto_65777 ?auto_65778 ) ) ( not ( = ?auto_65777 ?auto_65779 ) ) ( not ( = ?auto_65777 ?auto_65780 ) ) ( not ( = ?auto_65777 ?auto_65781 ) ) ( not ( = ?auto_65777 ?auto_65782 ) ) ( not ( = ?auto_65777 ?auto_65783 ) ) ( not ( = ?auto_65778 ?auto_65779 ) ) ( not ( = ?auto_65778 ?auto_65780 ) ) ( not ( = ?auto_65778 ?auto_65781 ) ) ( not ( = ?auto_65778 ?auto_65782 ) ) ( not ( = ?auto_65778 ?auto_65783 ) ) ( not ( = ?auto_65779 ?auto_65780 ) ) ( not ( = ?auto_65779 ?auto_65781 ) ) ( not ( = ?auto_65779 ?auto_65782 ) ) ( not ( = ?auto_65779 ?auto_65783 ) ) ( not ( = ?auto_65780 ?auto_65781 ) ) ( not ( = ?auto_65780 ?auto_65782 ) ) ( not ( = ?auto_65780 ?auto_65783 ) ) ( not ( = ?auto_65781 ?auto_65782 ) ) ( not ( = ?auto_65781 ?auto_65783 ) ) ( not ( = ?auto_65782 ?auto_65783 ) ) ( CLEAR ?auto_65780 ) ( ON ?auto_65781 ?auto_65782 ) ( CLEAR ?auto_65781 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_65774 ?auto_65775 ?auto_65776 ?auto_65777 ?auto_65778 ?auto_65779 ?auto_65780 ?auto_65781 )
      ( MAKE-9PILE ?auto_65774 ?auto_65775 ?auto_65776 ?auto_65777 ?auto_65778 ?auto_65779 ?auto_65780 ?auto_65781 ?auto_65782 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_65793 - BLOCK
      ?auto_65794 - BLOCK
      ?auto_65795 - BLOCK
      ?auto_65796 - BLOCK
      ?auto_65797 - BLOCK
      ?auto_65798 - BLOCK
      ?auto_65799 - BLOCK
      ?auto_65800 - BLOCK
      ?auto_65801 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_65801 ) ( ON-TABLE ?auto_65793 ) ( ON ?auto_65794 ?auto_65793 ) ( ON ?auto_65795 ?auto_65794 ) ( ON ?auto_65796 ?auto_65795 ) ( ON ?auto_65797 ?auto_65796 ) ( ON ?auto_65798 ?auto_65797 ) ( ON ?auto_65799 ?auto_65798 ) ( not ( = ?auto_65793 ?auto_65794 ) ) ( not ( = ?auto_65793 ?auto_65795 ) ) ( not ( = ?auto_65793 ?auto_65796 ) ) ( not ( = ?auto_65793 ?auto_65797 ) ) ( not ( = ?auto_65793 ?auto_65798 ) ) ( not ( = ?auto_65793 ?auto_65799 ) ) ( not ( = ?auto_65793 ?auto_65800 ) ) ( not ( = ?auto_65793 ?auto_65801 ) ) ( not ( = ?auto_65794 ?auto_65795 ) ) ( not ( = ?auto_65794 ?auto_65796 ) ) ( not ( = ?auto_65794 ?auto_65797 ) ) ( not ( = ?auto_65794 ?auto_65798 ) ) ( not ( = ?auto_65794 ?auto_65799 ) ) ( not ( = ?auto_65794 ?auto_65800 ) ) ( not ( = ?auto_65794 ?auto_65801 ) ) ( not ( = ?auto_65795 ?auto_65796 ) ) ( not ( = ?auto_65795 ?auto_65797 ) ) ( not ( = ?auto_65795 ?auto_65798 ) ) ( not ( = ?auto_65795 ?auto_65799 ) ) ( not ( = ?auto_65795 ?auto_65800 ) ) ( not ( = ?auto_65795 ?auto_65801 ) ) ( not ( = ?auto_65796 ?auto_65797 ) ) ( not ( = ?auto_65796 ?auto_65798 ) ) ( not ( = ?auto_65796 ?auto_65799 ) ) ( not ( = ?auto_65796 ?auto_65800 ) ) ( not ( = ?auto_65796 ?auto_65801 ) ) ( not ( = ?auto_65797 ?auto_65798 ) ) ( not ( = ?auto_65797 ?auto_65799 ) ) ( not ( = ?auto_65797 ?auto_65800 ) ) ( not ( = ?auto_65797 ?auto_65801 ) ) ( not ( = ?auto_65798 ?auto_65799 ) ) ( not ( = ?auto_65798 ?auto_65800 ) ) ( not ( = ?auto_65798 ?auto_65801 ) ) ( not ( = ?auto_65799 ?auto_65800 ) ) ( not ( = ?auto_65799 ?auto_65801 ) ) ( not ( = ?auto_65800 ?auto_65801 ) ) ( CLEAR ?auto_65799 ) ( ON ?auto_65800 ?auto_65801 ) ( CLEAR ?auto_65800 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_65793 ?auto_65794 ?auto_65795 ?auto_65796 ?auto_65797 ?auto_65798 ?auto_65799 ?auto_65800 )
      ( MAKE-9PILE ?auto_65793 ?auto_65794 ?auto_65795 ?auto_65796 ?auto_65797 ?auto_65798 ?auto_65799 ?auto_65800 ?auto_65801 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_65811 - BLOCK
      ?auto_65812 - BLOCK
      ?auto_65813 - BLOCK
      ?auto_65814 - BLOCK
      ?auto_65815 - BLOCK
      ?auto_65816 - BLOCK
      ?auto_65817 - BLOCK
      ?auto_65818 - BLOCK
      ?auto_65819 - BLOCK
    )
    :vars
    (
      ?auto_65820 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65819 ?auto_65820 ) ( ON-TABLE ?auto_65811 ) ( ON ?auto_65812 ?auto_65811 ) ( ON ?auto_65813 ?auto_65812 ) ( ON ?auto_65814 ?auto_65813 ) ( ON ?auto_65815 ?auto_65814 ) ( ON ?auto_65816 ?auto_65815 ) ( not ( = ?auto_65811 ?auto_65812 ) ) ( not ( = ?auto_65811 ?auto_65813 ) ) ( not ( = ?auto_65811 ?auto_65814 ) ) ( not ( = ?auto_65811 ?auto_65815 ) ) ( not ( = ?auto_65811 ?auto_65816 ) ) ( not ( = ?auto_65811 ?auto_65817 ) ) ( not ( = ?auto_65811 ?auto_65818 ) ) ( not ( = ?auto_65811 ?auto_65819 ) ) ( not ( = ?auto_65811 ?auto_65820 ) ) ( not ( = ?auto_65812 ?auto_65813 ) ) ( not ( = ?auto_65812 ?auto_65814 ) ) ( not ( = ?auto_65812 ?auto_65815 ) ) ( not ( = ?auto_65812 ?auto_65816 ) ) ( not ( = ?auto_65812 ?auto_65817 ) ) ( not ( = ?auto_65812 ?auto_65818 ) ) ( not ( = ?auto_65812 ?auto_65819 ) ) ( not ( = ?auto_65812 ?auto_65820 ) ) ( not ( = ?auto_65813 ?auto_65814 ) ) ( not ( = ?auto_65813 ?auto_65815 ) ) ( not ( = ?auto_65813 ?auto_65816 ) ) ( not ( = ?auto_65813 ?auto_65817 ) ) ( not ( = ?auto_65813 ?auto_65818 ) ) ( not ( = ?auto_65813 ?auto_65819 ) ) ( not ( = ?auto_65813 ?auto_65820 ) ) ( not ( = ?auto_65814 ?auto_65815 ) ) ( not ( = ?auto_65814 ?auto_65816 ) ) ( not ( = ?auto_65814 ?auto_65817 ) ) ( not ( = ?auto_65814 ?auto_65818 ) ) ( not ( = ?auto_65814 ?auto_65819 ) ) ( not ( = ?auto_65814 ?auto_65820 ) ) ( not ( = ?auto_65815 ?auto_65816 ) ) ( not ( = ?auto_65815 ?auto_65817 ) ) ( not ( = ?auto_65815 ?auto_65818 ) ) ( not ( = ?auto_65815 ?auto_65819 ) ) ( not ( = ?auto_65815 ?auto_65820 ) ) ( not ( = ?auto_65816 ?auto_65817 ) ) ( not ( = ?auto_65816 ?auto_65818 ) ) ( not ( = ?auto_65816 ?auto_65819 ) ) ( not ( = ?auto_65816 ?auto_65820 ) ) ( not ( = ?auto_65817 ?auto_65818 ) ) ( not ( = ?auto_65817 ?auto_65819 ) ) ( not ( = ?auto_65817 ?auto_65820 ) ) ( not ( = ?auto_65818 ?auto_65819 ) ) ( not ( = ?auto_65818 ?auto_65820 ) ) ( not ( = ?auto_65819 ?auto_65820 ) ) ( ON ?auto_65818 ?auto_65819 ) ( CLEAR ?auto_65816 ) ( ON ?auto_65817 ?auto_65818 ) ( CLEAR ?auto_65817 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_65811 ?auto_65812 ?auto_65813 ?auto_65814 ?auto_65815 ?auto_65816 ?auto_65817 )
      ( MAKE-9PILE ?auto_65811 ?auto_65812 ?auto_65813 ?auto_65814 ?auto_65815 ?auto_65816 ?auto_65817 ?auto_65818 ?auto_65819 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_65830 - BLOCK
      ?auto_65831 - BLOCK
      ?auto_65832 - BLOCK
      ?auto_65833 - BLOCK
      ?auto_65834 - BLOCK
      ?auto_65835 - BLOCK
      ?auto_65836 - BLOCK
      ?auto_65837 - BLOCK
      ?auto_65838 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_65838 ) ( ON-TABLE ?auto_65830 ) ( ON ?auto_65831 ?auto_65830 ) ( ON ?auto_65832 ?auto_65831 ) ( ON ?auto_65833 ?auto_65832 ) ( ON ?auto_65834 ?auto_65833 ) ( ON ?auto_65835 ?auto_65834 ) ( not ( = ?auto_65830 ?auto_65831 ) ) ( not ( = ?auto_65830 ?auto_65832 ) ) ( not ( = ?auto_65830 ?auto_65833 ) ) ( not ( = ?auto_65830 ?auto_65834 ) ) ( not ( = ?auto_65830 ?auto_65835 ) ) ( not ( = ?auto_65830 ?auto_65836 ) ) ( not ( = ?auto_65830 ?auto_65837 ) ) ( not ( = ?auto_65830 ?auto_65838 ) ) ( not ( = ?auto_65831 ?auto_65832 ) ) ( not ( = ?auto_65831 ?auto_65833 ) ) ( not ( = ?auto_65831 ?auto_65834 ) ) ( not ( = ?auto_65831 ?auto_65835 ) ) ( not ( = ?auto_65831 ?auto_65836 ) ) ( not ( = ?auto_65831 ?auto_65837 ) ) ( not ( = ?auto_65831 ?auto_65838 ) ) ( not ( = ?auto_65832 ?auto_65833 ) ) ( not ( = ?auto_65832 ?auto_65834 ) ) ( not ( = ?auto_65832 ?auto_65835 ) ) ( not ( = ?auto_65832 ?auto_65836 ) ) ( not ( = ?auto_65832 ?auto_65837 ) ) ( not ( = ?auto_65832 ?auto_65838 ) ) ( not ( = ?auto_65833 ?auto_65834 ) ) ( not ( = ?auto_65833 ?auto_65835 ) ) ( not ( = ?auto_65833 ?auto_65836 ) ) ( not ( = ?auto_65833 ?auto_65837 ) ) ( not ( = ?auto_65833 ?auto_65838 ) ) ( not ( = ?auto_65834 ?auto_65835 ) ) ( not ( = ?auto_65834 ?auto_65836 ) ) ( not ( = ?auto_65834 ?auto_65837 ) ) ( not ( = ?auto_65834 ?auto_65838 ) ) ( not ( = ?auto_65835 ?auto_65836 ) ) ( not ( = ?auto_65835 ?auto_65837 ) ) ( not ( = ?auto_65835 ?auto_65838 ) ) ( not ( = ?auto_65836 ?auto_65837 ) ) ( not ( = ?auto_65836 ?auto_65838 ) ) ( not ( = ?auto_65837 ?auto_65838 ) ) ( ON ?auto_65837 ?auto_65838 ) ( CLEAR ?auto_65835 ) ( ON ?auto_65836 ?auto_65837 ) ( CLEAR ?auto_65836 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_65830 ?auto_65831 ?auto_65832 ?auto_65833 ?auto_65834 ?auto_65835 ?auto_65836 )
      ( MAKE-9PILE ?auto_65830 ?auto_65831 ?auto_65832 ?auto_65833 ?auto_65834 ?auto_65835 ?auto_65836 ?auto_65837 ?auto_65838 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_65848 - BLOCK
      ?auto_65849 - BLOCK
      ?auto_65850 - BLOCK
      ?auto_65851 - BLOCK
      ?auto_65852 - BLOCK
      ?auto_65853 - BLOCK
      ?auto_65854 - BLOCK
      ?auto_65855 - BLOCK
      ?auto_65856 - BLOCK
    )
    :vars
    (
      ?auto_65857 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65856 ?auto_65857 ) ( ON-TABLE ?auto_65848 ) ( ON ?auto_65849 ?auto_65848 ) ( ON ?auto_65850 ?auto_65849 ) ( ON ?auto_65851 ?auto_65850 ) ( ON ?auto_65852 ?auto_65851 ) ( not ( = ?auto_65848 ?auto_65849 ) ) ( not ( = ?auto_65848 ?auto_65850 ) ) ( not ( = ?auto_65848 ?auto_65851 ) ) ( not ( = ?auto_65848 ?auto_65852 ) ) ( not ( = ?auto_65848 ?auto_65853 ) ) ( not ( = ?auto_65848 ?auto_65854 ) ) ( not ( = ?auto_65848 ?auto_65855 ) ) ( not ( = ?auto_65848 ?auto_65856 ) ) ( not ( = ?auto_65848 ?auto_65857 ) ) ( not ( = ?auto_65849 ?auto_65850 ) ) ( not ( = ?auto_65849 ?auto_65851 ) ) ( not ( = ?auto_65849 ?auto_65852 ) ) ( not ( = ?auto_65849 ?auto_65853 ) ) ( not ( = ?auto_65849 ?auto_65854 ) ) ( not ( = ?auto_65849 ?auto_65855 ) ) ( not ( = ?auto_65849 ?auto_65856 ) ) ( not ( = ?auto_65849 ?auto_65857 ) ) ( not ( = ?auto_65850 ?auto_65851 ) ) ( not ( = ?auto_65850 ?auto_65852 ) ) ( not ( = ?auto_65850 ?auto_65853 ) ) ( not ( = ?auto_65850 ?auto_65854 ) ) ( not ( = ?auto_65850 ?auto_65855 ) ) ( not ( = ?auto_65850 ?auto_65856 ) ) ( not ( = ?auto_65850 ?auto_65857 ) ) ( not ( = ?auto_65851 ?auto_65852 ) ) ( not ( = ?auto_65851 ?auto_65853 ) ) ( not ( = ?auto_65851 ?auto_65854 ) ) ( not ( = ?auto_65851 ?auto_65855 ) ) ( not ( = ?auto_65851 ?auto_65856 ) ) ( not ( = ?auto_65851 ?auto_65857 ) ) ( not ( = ?auto_65852 ?auto_65853 ) ) ( not ( = ?auto_65852 ?auto_65854 ) ) ( not ( = ?auto_65852 ?auto_65855 ) ) ( not ( = ?auto_65852 ?auto_65856 ) ) ( not ( = ?auto_65852 ?auto_65857 ) ) ( not ( = ?auto_65853 ?auto_65854 ) ) ( not ( = ?auto_65853 ?auto_65855 ) ) ( not ( = ?auto_65853 ?auto_65856 ) ) ( not ( = ?auto_65853 ?auto_65857 ) ) ( not ( = ?auto_65854 ?auto_65855 ) ) ( not ( = ?auto_65854 ?auto_65856 ) ) ( not ( = ?auto_65854 ?auto_65857 ) ) ( not ( = ?auto_65855 ?auto_65856 ) ) ( not ( = ?auto_65855 ?auto_65857 ) ) ( not ( = ?auto_65856 ?auto_65857 ) ) ( ON ?auto_65855 ?auto_65856 ) ( ON ?auto_65854 ?auto_65855 ) ( CLEAR ?auto_65852 ) ( ON ?auto_65853 ?auto_65854 ) ( CLEAR ?auto_65853 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_65848 ?auto_65849 ?auto_65850 ?auto_65851 ?auto_65852 ?auto_65853 )
      ( MAKE-9PILE ?auto_65848 ?auto_65849 ?auto_65850 ?auto_65851 ?auto_65852 ?auto_65853 ?auto_65854 ?auto_65855 ?auto_65856 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_65867 - BLOCK
      ?auto_65868 - BLOCK
      ?auto_65869 - BLOCK
      ?auto_65870 - BLOCK
      ?auto_65871 - BLOCK
      ?auto_65872 - BLOCK
      ?auto_65873 - BLOCK
      ?auto_65874 - BLOCK
      ?auto_65875 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_65875 ) ( ON-TABLE ?auto_65867 ) ( ON ?auto_65868 ?auto_65867 ) ( ON ?auto_65869 ?auto_65868 ) ( ON ?auto_65870 ?auto_65869 ) ( ON ?auto_65871 ?auto_65870 ) ( not ( = ?auto_65867 ?auto_65868 ) ) ( not ( = ?auto_65867 ?auto_65869 ) ) ( not ( = ?auto_65867 ?auto_65870 ) ) ( not ( = ?auto_65867 ?auto_65871 ) ) ( not ( = ?auto_65867 ?auto_65872 ) ) ( not ( = ?auto_65867 ?auto_65873 ) ) ( not ( = ?auto_65867 ?auto_65874 ) ) ( not ( = ?auto_65867 ?auto_65875 ) ) ( not ( = ?auto_65868 ?auto_65869 ) ) ( not ( = ?auto_65868 ?auto_65870 ) ) ( not ( = ?auto_65868 ?auto_65871 ) ) ( not ( = ?auto_65868 ?auto_65872 ) ) ( not ( = ?auto_65868 ?auto_65873 ) ) ( not ( = ?auto_65868 ?auto_65874 ) ) ( not ( = ?auto_65868 ?auto_65875 ) ) ( not ( = ?auto_65869 ?auto_65870 ) ) ( not ( = ?auto_65869 ?auto_65871 ) ) ( not ( = ?auto_65869 ?auto_65872 ) ) ( not ( = ?auto_65869 ?auto_65873 ) ) ( not ( = ?auto_65869 ?auto_65874 ) ) ( not ( = ?auto_65869 ?auto_65875 ) ) ( not ( = ?auto_65870 ?auto_65871 ) ) ( not ( = ?auto_65870 ?auto_65872 ) ) ( not ( = ?auto_65870 ?auto_65873 ) ) ( not ( = ?auto_65870 ?auto_65874 ) ) ( not ( = ?auto_65870 ?auto_65875 ) ) ( not ( = ?auto_65871 ?auto_65872 ) ) ( not ( = ?auto_65871 ?auto_65873 ) ) ( not ( = ?auto_65871 ?auto_65874 ) ) ( not ( = ?auto_65871 ?auto_65875 ) ) ( not ( = ?auto_65872 ?auto_65873 ) ) ( not ( = ?auto_65872 ?auto_65874 ) ) ( not ( = ?auto_65872 ?auto_65875 ) ) ( not ( = ?auto_65873 ?auto_65874 ) ) ( not ( = ?auto_65873 ?auto_65875 ) ) ( not ( = ?auto_65874 ?auto_65875 ) ) ( ON ?auto_65874 ?auto_65875 ) ( ON ?auto_65873 ?auto_65874 ) ( CLEAR ?auto_65871 ) ( ON ?auto_65872 ?auto_65873 ) ( CLEAR ?auto_65872 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_65867 ?auto_65868 ?auto_65869 ?auto_65870 ?auto_65871 ?auto_65872 )
      ( MAKE-9PILE ?auto_65867 ?auto_65868 ?auto_65869 ?auto_65870 ?auto_65871 ?auto_65872 ?auto_65873 ?auto_65874 ?auto_65875 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_65885 - BLOCK
      ?auto_65886 - BLOCK
      ?auto_65887 - BLOCK
      ?auto_65888 - BLOCK
      ?auto_65889 - BLOCK
      ?auto_65890 - BLOCK
      ?auto_65891 - BLOCK
      ?auto_65892 - BLOCK
      ?auto_65893 - BLOCK
    )
    :vars
    (
      ?auto_65894 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65893 ?auto_65894 ) ( ON-TABLE ?auto_65885 ) ( ON ?auto_65886 ?auto_65885 ) ( ON ?auto_65887 ?auto_65886 ) ( ON ?auto_65888 ?auto_65887 ) ( not ( = ?auto_65885 ?auto_65886 ) ) ( not ( = ?auto_65885 ?auto_65887 ) ) ( not ( = ?auto_65885 ?auto_65888 ) ) ( not ( = ?auto_65885 ?auto_65889 ) ) ( not ( = ?auto_65885 ?auto_65890 ) ) ( not ( = ?auto_65885 ?auto_65891 ) ) ( not ( = ?auto_65885 ?auto_65892 ) ) ( not ( = ?auto_65885 ?auto_65893 ) ) ( not ( = ?auto_65885 ?auto_65894 ) ) ( not ( = ?auto_65886 ?auto_65887 ) ) ( not ( = ?auto_65886 ?auto_65888 ) ) ( not ( = ?auto_65886 ?auto_65889 ) ) ( not ( = ?auto_65886 ?auto_65890 ) ) ( not ( = ?auto_65886 ?auto_65891 ) ) ( not ( = ?auto_65886 ?auto_65892 ) ) ( not ( = ?auto_65886 ?auto_65893 ) ) ( not ( = ?auto_65886 ?auto_65894 ) ) ( not ( = ?auto_65887 ?auto_65888 ) ) ( not ( = ?auto_65887 ?auto_65889 ) ) ( not ( = ?auto_65887 ?auto_65890 ) ) ( not ( = ?auto_65887 ?auto_65891 ) ) ( not ( = ?auto_65887 ?auto_65892 ) ) ( not ( = ?auto_65887 ?auto_65893 ) ) ( not ( = ?auto_65887 ?auto_65894 ) ) ( not ( = ?auto_65888 ?auto_65889 ) ) ( not ( = ?auto_65888 ?auto_65890 ) ) ( not ( = ?auto_65888 ?auto_65891 ) ) ( not ( = ?auto_65888 ?auto_65892 ) ) ( not ( = ?auto_65888 ?auto_65893 ) ) ( not ( = ?auto_65888 ?auto_65894 ) ) ( not ( = ?auto_65889 ?auto_65890 ) ) ( not ( = ?auto_65889 ?auto_65891 ) ) ( not ( = ?auto_65889 ?auto_65892 ) ) ( not ( = ?auto_65889 ?auto_65893 ) ) ( not ( = ?auto_65889 ?auto_65894 ) ) ( not ( = ?auto_65890 ?auto_65891 ) ) ( not ( = ?auto_65890 ?auto_65892 ) ) ( not ( = ?auto_65890 ?auto_65893 ) ) ( not ( = ?auto_65890 ?auto_65894 ) ) ( not ( = ?auto_65891 ?auto_65892 ) ) ( not ( = ?auto_65891 ?auto_65893 ) ) ( not ( = ?auto_65891 ?auto_65894 ) ) ( not ( = ?auto_65892 ?auto_65893 ) ) ( not ( = ?auto_65892 ?auto_65894 ) ) ( not ( = ?auto_65893 ?auto_65894 ) ) ( ON ?auto_65892 ?auto_65893 ) ( ON ?auto_65891 ?auto_65892 ) ( ON ?auto_65890 ?auto_65891 ) ( CLEAR ?auto_65888 ) ( ON ?auto_65889 ?auto_65890 ) ( CLEAR ?auto_65889 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_65885 ?auto_65886 ?auto_65887 ?auto_65888 ?auto_65889 )
      ( MAKE-9PILE ?auto_65885 ?auto_65886 ?auto_65887 ?auto_65888 ?auto_65889 ?auto_65890 ?auto_65891 ?auto_65892 ?auto_65893 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_65904 - BLOCK
      ?auto_65905 - BLOCK
      ?auto_65906 - BLOCK
      ?auto_65907 - BLOCK
      ?auto_65908 - BLOCK
      ?auto_65909 - BLOCK
      ?auto_65910 - BLOCK
      ?auto_65911 - BLOCK
      ?auto_65912 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_65912 ) ( ON-TABLE ?auto_65904 ) ( ON ?auto_65905 ?auto_65904 ) ( ON ?auto_65906 ?auto_65905 ) ( ON ?auto_65907 ?auto_65906 ) ( not ( = ?auto_65904 ?auto_65905 ) ) ( not ( = ?auto_65904 ?auto_65906 ) ) ( not ( = ?auto_65904 ?auto_65907 ) ) ( not ( = ?auto_65904 ?auto_65908 ) ) ( not ( = ?auto_65904 ?auto_65909 ) ) ( not ( = ?auto_65904 ?auto_65910 ) ) ( not ( = ?auto_65904 ?auto_65911 ) ) ( not ( = ?auto_65904 ?auto_65912 ) ) ( not ( = ?auto_65905 ?auto_65906 ) ) ( not ( = ?auto_65905 ?auto_65907 ) ) ( not ( = ?auto_65905 ?auto_65908 ) ) ( not ( = ?auto_65905 ?auto_65909 ) ) ( not ( = ?auto_65905 ?auto_65910 ) ) ( not ( = ?auto_65905 ?auto_65911 ) ) ( not ( = ?auto_65905 ?auto_65912 ) ) ( not ( = ?auto_65906 ?auto_65907 ) ) ( not ( = ?auto_65906 ?auto_65908 ) ) ( not ( = ?auto_65906 ?auto_65909 ) ) ( not ( = ?auto_65906 ?auto_65910 ) ) ( not ( = ?auto_65906 ?auto_65911 ) ) ( not ( = ?auto_65906 ?auto_65912 ) ) ( not ( = ?auto_65907 ?auto_65908 ) ) ( not ( = ?auto_65907 ?auto_65909 ) ) ( not ( = ?auto_65907 ?auto_65910 ) ) ( not ( = ?auto_65907 ?auto_65911 ) ) ( not ( = ?auto_65907 ?auto_65912 ) ) ( not ( = ?auto_65908 ?auto_65909 ) ) ( not ( = ?auto_65908 ?auto_65910 ) ) ( not ( = ?auto_65908 ?auto_65911 ) ) ( not ( = ?auto_65908 ?auto_65912 ) ) ( not ( = ?auto_65909 ?auto_65910 ) ) ( not ( = ?auto_65909 ?auto_65911 ) ) ( not ( = ?auto_65909 ?auto_65912 ) ) ( not ( = ?auto_65910 ?auto_65911 ) ) ( not ( = ?auto_65910 ?auto_65912 ) ) ( not ( = ?auto_65911 ?auto_65912 ) ) ( ON ?auto_65911 ?auto_65912 ) ( ON ?auto_65910 ?auto_65911 ) ( ON ?auto_65909 ?auto_65910 ) ( CLEAR ?auto_65907 ) ( ON ?auto_65908 ?auto_65909 ) ( CLEAR ?auto_65908 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_65904 ?auto_65905 ?auto_65906 ?auto_65907 ?auto_65908 )
      ( MAKE-9PILE ?auto_65904 ?auto_65905 ?auto_65906 ?auto_65907 ?auto_65908 ?auto_65909 ?auto_65910 ?auto_65911 ?auto_65912 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_65922 - BLOCK
      ?auto_65923 - BLOCK
      ?auto_65924 - BLOCK
      ?auto_65925 - BLOCK
      ?auto_65926 - BLOCK
      ?auto_65927 - BLOCK
      ?auto_65928 - BLOCK
      ?auto_65929 - BLOCK
      ?auto_65930 - BLOCK
    )
    :vars
    (
      ?auto_65931 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65930 ?auto_65931 ) ( ON-TABLE ?auto_65922 ) ( ON ?auto_65923 ?auto_65922 ) ( ON ?auto_65924 ?auto_65923 ) ( not ( = ?auto_65922 ?auto_65923 ) ) ( not ( = ?auto_65922 ?auto_65924 ) ) ( not ( = ?auto_65922 ?auto_65925 ) ) ( not ( = ?auto_65922 ?auto_65926 ) ) ( not ( = ?auto_65922 ?auto_65927 ) ) ( not ( = ?auto_65922 ?auto_65928 ) ) ( not ( = ?auto_65922 ?auto_65929 ) ) ( not ( = ?auto_65922 ?auto_65930 ) ) ( not ( = ?auto_65922 ?auto_65931 ) ) ( not ( = ?auto_65923 ?auto_65924 ) ) ( not ( = ?auto_65923 ?auto_65925 ) ) ( not ( = ?auto_65923 ?auto_65926 ) ) ( not ( = ?auto_65923 ?auto_65927 ) ) ( not ( = ?auto_65923 ?auto_65928 ) ) ( not ( = ?auto_65923 ?auto_65929 ) ) ( not ( = ?auto_65923 ?auto_65930 ) ) ( not ( = ?auto_65923 ?auto_65931 ) ) ( not ( = ?auto_65924 ?auto_65925 ) ) ( not ( = ?auto_65924 ?auto_65926 ) ) ( not ( = ?auto_65924 ?auto_65927 ) ) ( not ( = ?auto_65924 ?auto_65928 ) ) ( not ( = ?auto_65924 ?auto_65929 ) ) ( not ( = ?auto_65924 ?auto_65930 ) ) ( not ( = ?auto_65924 ?auto_65931 ) ) ( not ( = ?auto_65925 ?auto_65926 ) ) ( not ( = ?auto_65925 ?auto_65927 ) ) ( not ( = ?auto_65925 ?auto_65928 ) ) ( not ( = ?auto_65925 ?auto_65929 ) ) ( not ( = ?auto_65925 ?auto_65930 ) ) ( not ( = ?auto_65925 ?auto_65931 ) ) ( not ( = ?auto_65926 ?auto_65927 ) ) ( not ( = ?auto_65926 ?auto_65928 ) ) ( not ( = ?auto_65926 ?auto_65929 ) ) ( not ( = ?auto_65926 ?auto_65930 ) ) ( not ( = ?auto_65926 ?auto_65931 ) ) ( not ( = ?auto_65927 ?auto_65928 ) ) ( not ( = ?auto_65927 ?auto_65929 ) ) ( not ( = ?auto_65927 ?auto_65930 ) ) ( not ( = ?auto_65927 ?auto_65931 ) ) ( not ( = ?auto_65928 ?auto_65929 ) ) ( not ( = ?auto_65928 ?auto_65930 ) ) ( not ( = ?auto_65928 ?auto_65931 ) ) ( not ( = ?auto_65929 ?auto_65930 ) ) ( not ( = ?auto_65929 ?auto_65931 ) ) ( not ( = ?auto_65930 ?auto_65931 ) ) ( ON ?auto_65929 ?auto_65930 ) ( ON ?auto_65928 ?auto_65929 ) ( ON ?auto_65927 ?auto_65928 ) ( ON ?auto_65926 ?auto_65927 ) ( CLEAR ?auto_65924 ) ( ON ?auto_65925 ?auto_65926 ) ( CLEAR ?auto_65925 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_65922 ?auto_65923 ?auto_65924 ?auto_65925 )
      ( MAKE-9PILE ?auto_65922 ?auto_65923 ?auto_65924 ?auto_65925 ?auto_65926 ?auto_65927 ?auto_65928 ?auto_65929 ?auto_65930 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_65941 - BLOCK
      ?auto_65942 - BLOCK
      ?auto_65943 - BLOCK
      ?auto_65944 - BLOCK
      ?auto_65945 - BLOCK
      ?auto_65946 - BLOCK
      ?auto_65947 - BLOCK
      ?auto_65948 - BLOCK
      ?auto_65949 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_65949 ) ( ON-TABLE ?auto_65941 ) ( ON ?auto_65942 ?auto_65941 ) ( ON ?auto_65943 ?auto_65942 ) ( not ( = ?auto_65941 ?auto_65942 ) ) ( not ( = ?auto_65941 ?auto_65943 ) ) ( not ( = ?auto_65941 ?auto_65944 ) ) ( not ( = ?auto_65941 ?auto_65945 ) ) ( not ( = ?auto_65941 ?auto_65946 ) ) ( not ( = ?auto_65941 ?auto_65947 ) ) ( not ( = ?auto_65941 ?auto_65948 ) ) ( not ( = ?auto_65941 ?auto_65949 ) ) ( not ( = ?auto_65942 ?auto_65943 ) ) ( not ( = ?auto_65942 ?auto_65944 ) ) ( not ( = ?auto_65942 ?auto_65945 ) ) ( not ( = ?auto_65942 ?auto_65946 ) ) ( not ( = ?auto_65942 ?auto_65947 ) ) ( not ( = ?auto_65942 ?auto_65948 ) ) ( not ( = ?auto_65942 ?auto_65949 ) ) ( not ( = ?auto_65943 ?auto_65944 ) ) ( not ( = ?auto_65943 ?auto_65945 ) ) ( not ( = ?auto_65943 ?auto_65946 ) ) ( not ( = ?auto_65943 ?auto_65947 ) ) ( not ( = ?auto_65943 ?auto_65948 ) ) ( not ( = ?auto_65943 ?auto_65949 ) ) ( not ( = ?auto_65944 ?auto_65945 ) ) ( not ( = ?auto_65944 ?auto_65946 ) ) ( not ( = ?auto_65944 ?auto_65947 ) ) ( not ( = ?auto_65944 ?auto_65948 ) ) ( not ( = ?auto_65944 ?auto_65949 ) ) ( not ( = ?auto_65945 ?auto_65946 ) ) ( not ( = ?auto_65945 ?auto_65947 ) ) ( not ( = ?auto_65945 ?auto_65948 ) ) ( not ( = ?auto_65945 ?auto_65949 ) ) ( not ( = ?auto_65946 ?auto_65947 ) ) ( not ( = ?auto_65946 ?auto_65948 ) ) ( not ( = ?auto_65946 ?auto_65949 ) ) ( not ( = ?auto_65947 ?auto_65948 ) ) ( not ( = ?auto_65947 ?auto_65949 ) ) ( not ( = ?auto_65948 ?auto_65949 ) ) ( ON ?auto_65948 ?auto_65949 ) ( ON ?auto_65947 ?auto_65948 ) ( ON ?auto_65946 ?auto_65947 ) ( ON ?auto_65945 ?auto_65946 ) ( CLEAR ?auto_65943 ) ( ON ?auto_65944 ?auto_65945 ) ( CLEAR ?auto_65944 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_65941 ?auto_65942 ?auto_65943 ?auto_65944 )
      ( MAKE-9PILE ?auto_65941 ?auto_65942 ?auto_65943 ?auto_65944 ?auto_65945 ?auto_65946 ?auto_65947 ?auto_65948 ?auto_65949 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_65959 - BLOCK
      ?auto_65960 - BLOCK
      ?auto_65961 - BLOCK
      ?auto_65962 - BLOCK
      ?auto_65963 - BLOCK
      ?auto_65964 - BLOCK
      ?auto_65965 - BLOCK
      ?auto_65966 - BLOCK
      ?auto_65967 - BLOCK
    )
    :vars
    (
      ?auto_65968 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65967 ?auto_65968 ) ( ON-TABLE ?auto_65959 ) ( ON ?auto_65960 ?auto_65959 ) ( not ( = ?auto_65959 ?auto_65960 ) ) ( not ( = ?auto_65959 ?auto_65961 ) ) ( not ( = ?auto_65959 ?auto_65962 ) ) ( not ( = ?auto_65959 ?auto_65963 ) ) ( not ( = ?auto_65959 ?auto_65964 ) ) ( not ( = ?auto_65959 ?auto_65965 ) ) ( not ( = ?auto_65959 ?auto_65966 ) ) ( not ( = ?auto_65959 ?auto_65967 ) ) ( not ( = ?auto_65959 ?auto_65968 ) ) ( not ( = ?auto_65960 ?auto_65961 ) ) ( not ( = ?auto_65960 ?auto_65962 ) ) ( not ( = ?auto_65960 ?auto_65963 ) ) ( not ( = ?auto_65960 ?auto_65964 ) ) ( not ( = ?auto_65960 ?auto_65965 ) ) ( not ( = ?auto_65960 ?auto_65966 ) ) ( not ( = ?auto_65960 ?auto_65967 ) ) ( not ( = ?auto_65960 ?auto_65968 ) ) ( not ( = ?auto_65961 ?auto_65962 ) ) ( not ( = ?auto_65961 ?auto_65963 ) ) ( not ( = ?auto_65961 ?auto_65964 ) ) ( not ( = ?auto_65961 ?auto_65965 ) ) ( not ( = ?auto_65961 ?auto_65966 ) ) ( not ( = ?auto_65961 ?auto_65967 ) ) ( not ( = ?auto_65961 ?auto_65968 ) ) ( not ( = ?auto_65962 ?auto_65963 ) ) ( not ( = ?auto_65962 ?auto_65964 ) ) ( not ( = ?auto_65962 ?auto_65965 ) ) ( not ( = ?auto_65962 ?auto_65966 ) ) ( not ( = ?auto_65962 ?auto_65967 ) ) ( not ( = ?auto_65962 ?auto_65968 ) ) ( not ( = ?auto_65963 ?auto_65964 ) ) ( not ( = ?auto_65963 ?auto_65965 ) ) ( not ( = ?auto_65963 ?auto_65966 ) ) ( not ( = ?auto_65963 ?auto_65967 ) ) ( not ( = ?auto_65963 ?auto_65968 ) ) ( not ( = ?auto_65964 ?auto_65965 ) ) ( not ( = ?auto_65964 ?auto_65966 ) ) ( not ( = ?auto_65964 ?auto_65967 ) ) ( not ( = ?auto_65964 ?auto_65968 ) ) ( not ( = ?auto_65965 ?auto_65966 ) ) ( not ( = ?auto_65965 ?auto_65967 ) ) ( not ( = ?auto_65965 ?auto_65968 ) ) ( not ( = ?auto_65966 ?auto_65967 ) ) ( not ( = ?auto_65966 ?auto_65968 ) ) ( not ( = ?auto_65967 ?auto_65968 ) ) ( ON ?auto_65966 ?auto_65967 ) ( ON ?auto_65965 ?auto_65966 ) ( ON ?auto_65964 ?auto_65965 ) ( ON ?auto_65963 ?auto_65964 ) ( ON ?auto_65962 ?auto_65963 ) ( CLEAR ?auto_65960 ) ( ON ?auto_65961 ?auto_65962 ) ( CLEAR ?auto_65961 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_65959 ?auto_65960 ?auto_65961 )
      ( MAKE-9PILE ?auto_65959 ?auto_65960 ?auto_65961 ?auto_65962 ?auto_65963 ?auto_65964 ?auto_65965 ?auto_65966 ?auto_65967 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_65978 - BLOCK
      ?auto_65979 - BLOCK
      ?auto_65980 - BLOCK
      ?auto_65981 - BLOCK
      ?auto_65982 - BLOCK
      ?auto_65983 - BLOCK
      ?auto_65984 - BLOCK
      ?auto_65985 - BLOCK
      ?auto_65986 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_65986 ) ( ON-TABLE ?auto_65978 ) ( ON ?auto_65979 ?auto_65978 ) ( not ( = ?auto_65978 ?auto_65979 ) ) ( not ( = ?auto_65978 ?auto_65980 ) ) ( not ( = ?auto_65978 ?auto_65981 ) ) ( not ( = ?auto_65978 ?auto_65982 ) ) ( not ( = ?auto_65978 ?auto_65983 ) ) ( not ( = ?auto_65978 ?auto_65984 ) ) ( not ( = ?auto_65978 ?auto_65985 ) ) ( not ( = ?auto_65978 ?auto_65986 ) ) ( not ( = ?auto_65979 ?auto_65980 ) ) ( not ( = ?auto_65979 ?auto_65981 ) ) ( not ( = ?auto_65979 ?auto_65982 ) ) ( not ( = ?auto_65979 ?auto_65983 ) ) ( not ( = ?auto_65979 ?auto_65984 ) ) ( not ( = ?auto_65979 ?auto_65985 ) ) ( not ( = ?auto_65979 ?auto_65986 ) ) ( not ( = ?auto_65980 ?auto_65981 ) ) ( not ( = ?auto_65980 ?auto_65982 ) ) ( not ( = ?auto_65980 ?auto_65983 ) ) ( not ( = ?auto_65980 ?auto_65984 ) ) ( not ( = ?auto_65980 ?auto_65985 ) ) ( not ( = ?auto_65980 ?auto_65986 ) ) ( not ( = ?auto_65981 ?auto_65982 ) ) ( not ( = ?auto_65981 ?auto_65983 ) ) ( not ( = ?auto_65981 ?auto_65984 ) ) ( not ( = ?auto_65981 ?auto_65985 ) ) ( not ( = ?auto_65981 ?auto_65986 ) ) ( not ( = ?auto_65982 ?auto_65983 ) ) ( not ( = ?auto_65982 ?auto_65984 ) ) ( not ( = ?auto_65982 ?auto_65985 ) ) ( not ( = ?auto_65982 ?auto_65986 ) ) ( not ( = ?auto_65983 ?auto_65984 ) ) ( not ( = ?auto_65983 ?auto_65985 ) ) ( not ( = ?auto_65983 ?auto_65986 ) ) ( not ( = ?auto_65984 ?auto_65985 ) ) ( not ( = ?auto_65984 ?auto_65986 ) ) ( not ( = ?auto_65985 ?auto_65986 ) ) ( ON ?auto_65985 ?auto_65986 ) ( ON ?auto_65984 ?auto_65985 ) ( ON ?auto_65983 ?auto_65984 ) ( ON ?auto_65982 ?auto_65983 ) ( ON ?auto_65981 ?auto_65982 ) ( CLEAR ?auto_65979 ) ( ON ?auto_65980 ?auto_65981 ) ( CLEAR ?auto_65980 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_65978 ?auto_65979 ?auto_65980 )
      ( MAKE-9PILE ?auto_65978 ?auto_65979 ?auto_65980 ?auto_65981 ?auto_65982 ?auto_65983 ?auto_65984 ?auto_65985 ?auto_65986 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_65996 - BLOCK
      ?auto_65997 - BLOCK
      ?auto_65998 - BLOCK
      ?auto_65999 - BLOCK
      ?auto_66000 - BLOCK
      ?auto_66001 - BLOCK
      ?auto_66002 - BLOCK
      ?auto_66003 - BLOCK
      ?auto_66004 - BLOCK
    )
    :vars
    (
      ?auto_66005 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66004 ?auto_66005 ) ( ON-TABLE ?auto_65996 ) ( not ( = ?auto_65996 ?auto_65997 ) ) ( not ( = ?auto_65996 ?auto_65998 ) ) ( not ( = ?auto_65996 ?auto_65999 ) ) ( not ( = ?auto_65996 ?auto_66000 ) ) ( not ( = ?auto_65996 ?auto_66001 ) ) ( not ( = ?auto_65996 ?auto_66002 ) ) ( not ( = ?auto_65996 ?auto_66003 ) ) ( not ( = ?auto_65996 ?auto_66004 ) ) ( not ( = ?auto_65996 ?auto_66005 ) ) ( not ( = ?auto_65997 ?auto_65998 ) ) ( not ( = ?auto_65997 ?auto_65999 ) ) ( not ( = ?auto_65997 ?auto_66000 ) ) ( not ( = ?auto_65997 ?auto_66001 ) ) ( not ( = ?auto_65997 ?auto_66002 ) ) ( not ( = ?auto_65997 ?auto_66003 ) ) ( not ( = ?auto_65997 ?auto_66004 ) ) ( not ( = ?auto_65997 ?auto_66005 ) ) ( not ( = ?auto_65998 ?auto_65999 ) ) ( not ( = ?auto_65998 ?auto_66000 ) ) ( not ( = ?auto_65998 ?auto_66001 ) ) ( not ( = ?auto_65998 ?auto_66002 ) ) ( not ( = ?auto_65998 ?auto_66003 ) ) ( not ( = ?auto_65998 ?auto_66004 ) ) ( not ( = ?auto_65998 ?auto_66005 ) ) ( not ( = ?auto_65999 ?auto_66000 ) ) ( not ( = ?auto_65999 ?auto_66001 ) ) ( not ( = ?auto_65999 ?auto_66002 ) ) ( not ( = ?auto_65999 ?auto_66003 ) ) ( not ( = ?auto_65999 ?auto_66004 ) ) ( not ( = ?auto_65999 ?auto_66005 ) ) ( not ( = ?auto_66000 ?auto_66001 ) ) ( not ( = ?auto_66000 ?auto_66002 ) ) ( not ( = ?auto_66000 ?auto_66003 ) ) ( not ( = ?auto_66000 ?auto_66004 ) ) ( not ( = ?auto_66000 ?auto_66005 ) ) ( not ( = ?auto_66001 ?auto_66002 ) ) ( not ( = ?auto_66001 ?auto_66003 ) ) ( not ( = ?auto_66001 ?auto_66004 ) ) ( not ( = ?auto_66001 ?auto_66005 ) ) ( not ( = ?auto_66002 ?auto_66003 ) ) ( not ( = ?auto_66002 ?auto_66004 ) ) ( not ( = ?auto_66002 ?auto_66005 ) ) ( not ( = ?auto_66003 ?auto_66004 ) ) ( not ( = ?auto_66003 ?auto_66005 ) ) ( not ( = ?auto_66004 ?auto_66005 ) ) ( ON ?auto_66003 ?auto_66004 ) ( ON ?auto_66002 ?auto_66003 ) ( ON ?auto_66001 ?auto_66002 ) ( ON ?auto_66000 ?auto_66001 ) ( ON ?auto_65999 ?auto_66000 ) ( ON ?auto_65998 ?auto_65999 ) ( CLEAR ?auto_65996 ) ( ON ?auto_65997 ?auto_65998 ) ( CLEAR ?auto_65997 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_65996 ?auto_65997 )
      ( MAKE-9PILE ?auto_65996 ?auto_65997 ?auto_65998 ?auto_65999 ?auto_66000 ?auto_66001 ?auto_66002 ?auto_66003 ?auto_66004 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_66015 - BLOCK
      ?auto_66016 - BLOCK
      ?auto_66017 - BLOCK
      ?auto_66018 - BLOCK
      ?auto_66019 - BLOCK
      ?auto_66020 - BLOCK
      ?auto_66021 - BLOCK
      ?auto_66022 - BLOCK
      ?auto_66023 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_66023 ) ( ON-TABLE ?auto_66015 ) ( not ( = ?auto_66015 ?auto_66016 ) ) ( not ( = ?auto_66015 ?auto_66017 ) ) ( not ( = ?auto_66015 ?auto_66018 ) ) ( not ( = ?auto_66015 ?auto_66019 ) ) ( not ( = ?auto_66015 ?auto_66020 ) ) ( not ( = ?auto_66015 ?auto_66021 ) ) ( not ( = ?auto_66015 ?auto_66022 ) ) ( not ( = ?auto_66015 ?auto_66023 ) ) ( not ( = ?auto_66016 ?auto_66017 ) ) ( not ( = ?auto_66016 ?auto_66018 ) ) ( not ( = ?auto_66016 ?auto_66019 ) ) ( not ( = ?auto_66016 ?auto_66020 ) ) ( not ( = ?auto_66016 ?auto_66021 ) ) ( not ( = ?auto_66016 ?auto_66022 ) ) ( not ( = ?auto_66016 ?auto_66023 ) ) ( not ( = ?auto_66017 ?auto_66018 ) ) ( not ( = ?auto_66017 ?auto_66019 ) ) ( not ( = ?auto_66017 ?auto_66020 ) ) ( not ( = ?auto_66017 ?auto_66021 ) ) ( not ( = ?auto_66017 ?auto_66022 ) ) ( not ( = ?auto_66017 ?auto_66023 ) ) ( not ( = ?auto_66018 ?auto_66019 ) ) ( not ( = ?auto_66018 ?auto_66020 ) ) ( not ( = ?auto_66018 ?auto_66021 ) ) ( not ( = ?auto_66018 ?auto_66022 ) ) ( not ( = ?auto_66018 ?auto_66023 ) ) ( not ( = ?auto_66019 ?auto_66020 ) ) ( not ( = ?auto_66019 ?auto_66021 ) ) ( not ( = ?auto_66019 ?auto_66022 ) ) ( not ( = ?auto_66019 ?auto_66023 ) ) ( not ( = ?auto_66020 ?auto_66021 ) ) ( not ( = ?auto_66020 ?auto_66022 ) ) ( not ( = ?auto_66020 ?auto_66023 ) ) ( not ( = ?auto_66021 ?auto_66022 ) ) ( not ( = ?auto_66021 ?auto_66023 ) ) ( not ( = ?auto_66022 ?auto_66023 ) ) ( ON ?auto_66022 ?auto_66023 ) ( ON ?auto_66021 ?auto_66022 ) ( ON ?auto_66020 ?auto_66021 ) ( ON ?auto_66019 ?auto_66020 ) ( ON ?auto_66018 ?auto_66019 ) ( ON ?auto_66017 ?auto_66018 ) ( CLEAR ?auto_66015 ) ( ON ?auto_66016 ?auto_66017 ) ( CLEAR ?auto_66016 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_66015 ?auto_66016 )
      ( MAKE-9PILE ?auto_66015 ?auto_66016 ?auto_66017 ?auto_66018 ?auto_66019 ?auto_66020 ?auto_66021 ?auto_66022 ?auto_66023 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_66033 - BLOCK
      ?auto_66034 - BLOCK
      ?auto_66035 - BLOCK
      ?auto_66036 - BLOCK
      ?auto_66037 - BLOCK
      ?auto_66038 - BLOCK
      ?auto_66039 - BLOCK
      ?auto_66040 - BLOCK
      ?auto_66041 - BLOCK
    )
    :vars
    (
      ?auto_66042 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66041 ?auto_66042 ) ( not ( = ?auto_66033 ?auto_66034 ) ) ( not ( = ?auto_66033 ?auto_66035 ) ) ( not ( = ?auto_66033 ?auto_66036 ) ) ( not ( = ?auto_66033 ?auto_66037 ) ) ( not ( = ?auto_66033 ?auto_66038 ) ) ( not ( = ?auto_66033 ?auto_66039 ) ) ( not ( = ?auto_66033 ?auto_66040 ) ) ( not ( = ?auto_66033 ?auto_66041 ) ) ( not ( = ?auto_66033 ?auto_66042 ) ) ( not ( = ?auto_66034 ?auto_66035 ) ) ( not ( = ?auto_66034 ?auto_66036 ) ) ( not ( = ?auto_66034 ?auto_66037 ) ) ( not ( = ?auto_66034 ?auto_66038 ) ) ( not ( = ?auto_66034 ?auto_66039 ) ) ( not ( = ?auto_66034 ?auto_66040 ) ) ( not ( = ?auto_66034 ?auto_66041 ) ) ( not ( = ?auto_66034 ?auto_66042 ) ) ( not ( = ?auto_66035 ?auto_66036 ) ) ( not ( = ?auto_66035 ?auto_66037 ) ) ( not ( = ?auto_66035 ?auto_66038 ) ) ( not ( = ?auto_66035 ?auto_66039 ) ) ( not ( = ?auto_66035 ?auto_66040 ) ) ( not ( = ?auto_66035 ?auto_66041 ) ) ( not ( = ?auto_66035 ?auto_66042 ) ) ( not ( = ?auto_66036 ?auto_66037 ) ) ( not ( = ?auto_66036 ?auto_66038 ) ) ( not ( = ?auto_66036 ?auto_66039 ) ) ( not ( = ?auto_66036 ?auto_66040 ) ) ( not ( = ?auto_66036 ?auto_66041 ) ) ( not ( = ?auto_66036 ?auto_66042 ) ) ( not ( = ?auto_66037 ?auto_66038 ) ) ( not ( = ?auto_66037 ?auto_66039 ) ) ( not ( = ?auto_66037 ?auto_66040 ) ) ( not ( = ?auto_66037 ?auto_66041 ) ) ( not ( = ?auto_66037 ?auto_66042 ) ) ( not ( = ?auto_66038 ?auto_66039 ) ) ( not ( = ?auto_66038 ?auto_66040 ) ) ( not ( = ?auto_66038 ?auto_66041 ) ) ( not ( = ?auto_66038 ?auto_66042 ) ) ( not ( = ?auto_66039 ?auto_66040 ) ) ( not ( = ?auto_66039 ?auto_66041 ) ) ( not ( = ?auto_66039 ?auto_66042 ) ) ( not ( = ?auto_66040 ?auto_66041 ) ) ( not ( = ?auto_66040 ?auto_66042 ) ) ( not ( = ?auto_66041 ?auto_66042 ) ) ( ON ?auto_66040 ?auto_66041 ) ( ON ?auto_66039 ?auto_66040 ) ( ON ?auto_66038 ?auto_66039 ) ( ON ?auto_66037 ?auto_66038 ) ( ON ?auto_66036 ?auto_66037 ) ( ON ?auto_66035 ?auto_66036 ) ( ON ?auto_66034 ?auto_66035 ) ( ON ?auto_66033 ?auto_66034 ) ( CLEAR ?auto_66033 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_66033 )
      ( MAKE-9PILE ?auto_66033 ?auto_66034 ?auto_66035 ?auto_66036 ?auto_66037 ?auto_66038 ?auto_66039 ?auto_66040 ?auto_66041 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_66052 - BLOCK
      ?auto_66053 - BLOCK
      ?auto_66054 - BLOCK
      ?auto_66055 - BLOCK
      ?auto_66056 - BLOCK
      ?auto_66057 - BLOCK
      ?auto_66058 - BLOCK
      ?auto_66059 - BLOCK
      ?auto_66060 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_66060 ) ( not ( = ?auto_66052 ?auto_66053 ) ) ( not ( = ?auto_66052 ?auto_66054 ) ) ( not ( = ?auto_66052 ?auto_66055 ) ) ( not ( = ?auto_66052 ?auto_66056 ) ) ( not ( = ?auto_66052 ?auto_66057 ) ) ( not ( = ?auto_66052 ?auto_66058 ) ) ( not ( = ?auto_66052 ?auto_66059 ) ) ( not ( = ?auto_66052 ?auto_66060 ) ) ( not ( = ?auto_66053 ?auto_66054 ) ) ( not ( = ?auto_66053 ?auto_66055 ) ) ( not ( = ?auto_66053 ?auto_66056 ) ) ( not ( = ?auto_66053 ?auto_66057 ) ) ( not ( = ?auto_66053 ?auto_66058 ) ) ( not ( = ?auto_66053 ?auto_66059 ) ) ( not ( = ?auto_66053 ?auto_66060 ) ) ( not ( = ?auto_66054 ?auto_66055 ) ) ( not ( = ?auto_66054 ?auto_66056 ) ) ( not ( = ?auto_66054 ?auto_66057 ) ) ( not ( = ?auto_66054 ?auto_66058 ) ) ( not ( = ?auto_66054 ?auto_66059 ) ) ( not ( = ?auto_66054 ?auto_66060 ) ) ( not ( = ?auto_66055 ?auto_66056 ) ) ( not ( = ?auto_66055 ?auto_66057 ) ) ( not ( = ?auto_66055 ?auto_66058 ) ) ( not ( = ?auto_66055 ?auto_66059 ) ) ( not ( = ?auto_66055 ?auto_66060 ) ) ( not ( = ?auto_66056 ?auto_66057 ) ) ( not ( = ?auto_66056 ?auto_66058 ) ) ( not ( = ?auto_66056 ?auto_66059 ) ) ( not ( = ?auto_66056 ?auto_66060 ) ) ( not ( = ?auto_66057 ?auto_66058 ) ) ( not ( = ?auto_66057 ?auto_66059 ) ) ( not ( = ?auto_66057 ?auto_66060 ) ) ( not ( = ?auto_66058 ?auto_66059 ) ) ( not ( = ?auto_66058 ?auto_66060 ) ) ( not ( = ?auto_66059 ?auto_66060 ) ) ( ON ?auto_66059 ?auto_66060 ) ( ON ?auto_66058 ?auto_66059 ) ( ON ?auto_66057 ?auto_66058 ) ( ON ?auto_66056 ?auto_66057 ) ( ON ?auto_66055 ?auto_66056 ) ( ON ?auto_66054 ?auto_66055 ) ( ON ?auto_66053 ?auto_66054 ) ( ON ?auto_66052 ?auto_66053 ) ( CLEAR ?auto_66052 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_66052 )
      ( MAKE-9PILE ?auto_66052 ?auto_66053 ?auto_66054 ?auto_66055 ?auto_66056 ?auto_66057 ?auto_66058 ?auto_66059 ?auto_66060 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_66070 - BLOCK
      ?auto_66071 - BLOCK
      ?auto_66072 - BLOCK
      ?auto_66073 - BLOCK
      ?auto_66074 - BLOCK
      ?auto_66075 - BLOCK
      ?auto_66076 - BLOCK
      ?auto_66077 - BLOCK
      ?auto_66078 - BLOCK
    )
    :vars
    (
      ?auto_66079 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66070 ?auto_66071 ) ) ( not ( = ?auto_66070 ?auto_66072 ) ) ( not ( = ?auto_66070 ?auto_66073 ) ) ( not ( = ?auto_66070 ?auto_66074 ) ) ( not ( = ?auto_66070 ?auto_66075 ) ) ( not ( = ?auto_66070 ?auto_66076 ) ) ( not ( = ?auto_66070 ?auto_66077 ) ) ( not ( = ?auto_66070 ?auto_66078 ) ) ( not ( = ?auto_66071 ?auto_66072 ) ) ( not ( = ?auto_66071 ?auto_66073 ) ) ( not ( = ?auto_66071 ?auto_66074 ) ) ( not ( = ?auto_66071 ?auto_66075 ) ) ( not ( = ?auto_66071 ?auto_66076 ) ) ( not ( = ?auto_66071 ?auto_66077 ) ) ( not ( = ?auto_66071 ?auto_66078 ) ) ( not ( = ?auto_66072 ?auto_66073 ) ) ( not ( = ?auto_66072 ?auto_66074 ) ) ( not ( = ?auto_66072 ?auto_66075 ) ) ( not ( = ?auto_66072 ?auto_66076 ) ) ( not ( = ?auto_66072 ?auto_66077 ) ) ( not ( = ?auto_66072 ?auto_66078 ) ) ( not ( = ?auto_66073 ?auto_66074 ) ) ( not ( = ?auto_66073 ?auto_66075 ) ) ( not ( = ?auto_66073 ?auto_66076 ) ) ( not ( = ?auto_66073 ?auto_66077 ) ) ( not ( = ?auto_66073 ?auto_66078 ) ) ( not ( = ?auto_66074 ?auto_66075 ) ) ( not ( = ?auto_66074 ?auto_66076 ) ) ( not ( = ?auto_66074 ?auto_66077 ) ) ( not ( = ?auto_66074 ?auto_66078 ) ) ( not ( = ?auto_66075 ?auto_66076 ) ) ( not ( = ?auto_66075 ?auto_66077 ) ) ( not ( = ?auto_66075 ?auto_66078 ) ) ( not ( = ?auto_66076 ?auto_66077 ) ) ( not ( = ?auto_66076 ?auto_66078 ) ) ( not ( = ?auto_66077 ?auto_66078 ) ) ( ON ?auto_66070 ?auto_66079 ) ( not ( = ?auto_66078 ?auto_66079 ) ) ( not ( = ?auto_66077 ?auto_66079 ) ) ( not ( = ?auto_66076 ?auto_66079 ) ) ( not ( = ?auto_66075 ?auto_66079 ) ) ( not ( = ?auto_66074 ?auto_66079 ) ) ( not ( = ?auto_66073 ?auto_66079 ) ) ( not ( = ?auto_66072 ?auto_66079 ) ) ( not ( = ?auto_66071 ?auto_66079 ) ) ( not ( = ?auto_66070 ?auto_66079 ) ) ( ON ?auto_66071 ?auto_66070 ) ( ON ?auto_66072 ?auto_66071 ) ( ON ?auto_66073 ?auto_66072 ) ( ON ?auto_66074 ?auto_66073 ) ( ON ?auto_66075 ?auto_66074 ) ( ON ?auto_66076 ?auto_66075 ) ( ON ?auto_66077 ?auto_66076 ) ( ON ?auto_66078 ?auto_66077 ) ( CLEAR ?auto_66078 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_66078 ?auto_66077 ?auto_66076 ?auto_66075 ?auto_66074 ?auto_66073 ?auto_66072 ?auto_66071 ?auto_66070 )
      ( MAKE-9PILE ?auto_66070 ?auto_66071 ?auto_66072 ?auto_66073 ?auto_66074 ?auto_66075 ?auto_66076 ?auto_66077 ?auto_66078 ) )
  )

)

