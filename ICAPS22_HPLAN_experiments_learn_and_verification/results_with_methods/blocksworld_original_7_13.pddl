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
      ?auto_112849 - BLOCK
      ?auto_112850 - BLOCK
      ?auto_112851 - BLOCK
      ?auto_112852 - BLOCK
      ?auto_112853 - BLOCK
      ?auto_112854 - BLOCK
      ?auto_112855 - BLOCK
    )
    :vars
    (
      ?auto_112856 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112856 ?auto_112855 ) ( CLEAR ?auto_112856 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_112849 ) ( ON ?auto_112850 ?auto_112849 ) ( ON ?auto_112851 ?auto_112850 ) ( ON ?auto_112852 ?auto_112851 ) ( ON ?auto_112853 ?auto_112852 ) ( ON ?auto_112854 ?auto_112853 ) ( ON ?auto_112855 ?auto_112854 ) ( not ( = ?auto_112849 ?auto_112850 ) ) ( not ( = ?auto_112849 ?auto_112851 ) ) ( not ( = ?auto_112849 ?auto_112852 ) ) ( not ( = ?auto_112849 ?auto_112853 ) ) ( not ( = ?auto_112849 ?auto_112854 ) ) ( not ( = ?auto_112849 ?auto_112855 ) ) ( not ( = ?auto_112849 ?auto_112856 ) ) ( not ( = ?auto_112850 ?auto_112851 ) ) ( not ( = ?auto_112850 ?auto_112852 ) ) ( not ( = ?auto_112850 ?auto_112853 ) ) ( not ( = ?auto_112850 ?auto_112854 ) ) ( not ( = ?auto_112850 ?auto_112855 ) ) ( not ( = ?auto_112850 ?auto_112856 ) ) ( not ( = ?auto_112851 ?auto_112852 ) ) ( not ( = ?auto_112851 ?auto_112853 ) ) ( not ( = ?auto_112851 ?auto_112854 ) ) ( not ( = ?auto_112851 ?auto_112855 ) ) ( not ( = ?auto_112851 ?auto_112856 ) ) ( not ( = ?auto_112852 ?auto_112853 ) ) ( not ( = ?auto_112852 ?auto_112854 ) ) ( not ( = ?auto_112852 ?auto_112855 ) ) ( not ( = ?auto_112852 ?auto_112856 ) ) ( not ( = ?auto_112853 ?auto_112854 ) ) ( not ( = ?auto_112853 ?auto_112855 ) ) ( not ( = ?auto_112853 ?auto_112856 ) ) ( not ( = ?auto_112854 ?auto_112855 ) ) ( not ( = ?auto_112854 ?auto_112856 ) ) ( not ( = ?auto_112855 ?auto_112856 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_112856 ?auto_112855 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_112858 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_112858 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_112858 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_112859 - BLOCK
    )
    :vars
    (
      ?auto_112860 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112859 ?auto_112860 ) ( CLEAR ?auto_112859 ) ( HAND-EMPTY ) ( not ( = ?auto_112859 ?auto_112860 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_112859 ?auto_112860 )
      ( MAKE-1PILE ?auto_112859 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_112867 - BLOCK
      ?auto_112868 - BLOCK
      ?auto_112869 - BLOCK
      ?auto_112870 - BLOCK
      ?auto_112871 - BLOCK
      ?auto_112872 - BLOCK
    )
    :vars
    (
      ?auto_112873 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112873 ?auto_112872 ) ( CLEAR ?auto_112873 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_112867 ) ( ON ?auto_112868 ?auto_112867 ) ( ON ?auto_112869 ?auto_112868 ) ( ON ?auto_112870 ?auto_112869 ) ( ON ?auto_112871 ?auto_112870 ) ( ON ?auto_112872 ?auto_112871 ) ( not ( = ?auto_112867 ?auto_112868 ) ) ( not ( = ?auto_112867 ?auto_112869 ) ) ( not ( = ?auto_112867 ?auto_112870 ) ) ( not ( = ?auto_112867 ?auto_112871 ) ) ( not ( = ?auto_112867 ?auto_112872 ) ) ( not ( = ?auto_112867 ?auto_112873 ) ) ( not ( = ?auto_112868 ?auto_112869 ) ) ( not ( = ?auto_112868 ?auto_112870 ) ) ( not ( = ?auto_112868 ?auto_112871 ) ) ( not ( = ?auto_112868 ?auto_112872 ) ) ( not ( = ?auto_112868 ?auto_112873 ) ) ( not ( = ?auto_112869 ?auto_112870 ) ) ( not ( = ?auto_112869 ?auto_112871 ) ) ( not ( = ?auto_112869 ?auto_112872 ) ) ( not ( = ?auto_112869 ?auto_112873 ) ) ( not ( = ?auto_112870 ?auto_112871 ) ) ( not ( = ?auto_112870 ?auto_112872 ) ) ( not ( = ?auto_112870 ?auto_112873 ) ) ( not ( = ?auto_112871 ?auto_112872 ) ) ( not ( = ?auto_112871 ?auto_112873 ) ) ( not ( = ?auto_112872 ?auto_112873 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_112873 ?auto_112872 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_112874 - BLOCK
      ?auto_112875 - BLOCK
      ?auto_112876 - BLOCK
      ?auto_112877 - BLOCK
      ?auto_112878 - BLOCK
      ?auto_112879 - BLOCK
    )
    :vars
    (
      ?auto_112880 - BLOCK
      ?auto_112881 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112880 ?auto_112879 ) ( CLEAR ?auto_112880 ) ( ON-TABLE ?auto_112874 ) ( ON ?auto_112875 ?auto_112874 ) ( ON ?auto_112876 ?auto_112875 ) ( ON ?auto_112877 ?auto_112876 ) ( ON ?auto_112878 ?auto_112877 ) ( ON ?auto_112879 ?auto_112878 ) ( not ( = ?auto_112874 ?auto_112875 ) ) ( not ( = ?auto_112874 ?auto_112876 ) ) ( not ( = ?auto_112874 ?auto_112877 ) ) ( not ( = ?auto_112874 ?auto_112878 ) ) ( not ( = ?auto_112874 ?auto_112879 ) ) ( not ( = ?auto_112874 ?auto_112880 ) ) ( not ( = ?auto_112875 ?auto_112876 ) ) ( not ( = ?auto_112875 ?auto_112877 ) ) ( not ( = ?auto_112875 ?auto_112878 ) ) ( not ( = ?auto_112875 ?auto_112879 ) ) ( not ( = ?auto_112875 ?auto_112880 ) ) ( not ( = ?auto_112876 ?auto_112877 ) ) ( not ( = ?auto_112876 ?auto_112878 ) ) ( not ( = ?auto_112876 ?auto_112879 ) ) ( not ( = ?auto_112876 ?auto_112880 ) ) ( not ( = ?auto_112877 ?auto_112878 ) ) ( not ( = ?auto_112877 ?auto_112879 ) ) ( not ( = ?auto_112877 ?auto_112880 ) ) ( not ( = ?auto_112878 ?auto_112879 ) ) ( not ( = ?auto_112878 ?auto_112880 ) ) ( not ( = ?auto_112879 ?auto_112880 ) ) ( HOLDING ?auto_112881 ) ( not ( = ?auto_112874 ?auto_112881 ) ) ( not ( = ?auto_112875 ?auto_112881 ) ) ( not ( = ?auto_112876 ?auto_112881 ) ) ( not ( = ?auto_112877 ?auto_112881 ) ) ( not ( = ?auto_112878 ?auto_112881 ) ) ( not ( = ?auto_112879 ?auto_112881 ) ) ( not ( = ?auto_112880 ?auto_112881 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_112881 )
      ( MAKE-6PILE ?auto_112874 ?auto_112875 ?auto_112876 ?auto_112877 ?auto_112878 ?auto_112879 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_112882 - BLOCK
      ?auto_112883 - BLOCK
      ?auto_112884 - BLOCK
      ?auto_112885 - BLOCK
      ?auto_112886 - BLOCK
      ?auto_112887 - BLOCK
    )
    :vars
    (
      ?auto_112889 - BLOCK
      ?auto_112888 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112889 ?auto_112887 ) ( ON-TABLE ?auto_112882 ) ( ON ?auto_112883 ?auto_112882 ) ( ON ?auto_112884 ?auto_112883 ) ( ON ?auto_112885 ?auto_112884 ) ( ON ?auto_112886 ?auto_112885 ) ( ON ?auto_112887 ?auto_112886 ) ( not ( = ?auto_112882 ?auto_112883 ) ) ( not ( = ?auto_112882 ?auto_112884 ) ) ( not ( = ?auto_112882 ?auto_112885 ) ) ( not ( = ?auto_112882 ?auto_112886 ) ) ( not ( = ?auto_112882 ?auto_112887 ) ) ( not ( = ?auto_112882 ?auto_112889 ) ) ( not ( = ?auto_112883 ?auto_112884 ) ) ( not ( = ?auto_112883 ?auto_112885 ) ) ( not ( = ?auto_112883 ?auto_112886 ) ) ( not ( = ?auto_112883 ?auto_112887 ) ) ( not ( = ?auto_112883 ?auto_112889 ) ) ( not ( = ?auto_112884 ?auto_112885 ) ) ( not ( = ?auto_112884 ?auto_112886 ) ) ( not ( = ?auto_112884 ?auto_112887 ) ) ( not ( = ?auto_112884 ?auto_112889 ) ) ( not ( = ?auto_112885 ?auto_112886 ) ) ( not ( = ?auto_112885 ?auto_112887 ) ) ( not ( = ?auto_112885 ?auto_112889 ) ) ( not ( = ?auto_112886 ?auto_112887 ) ) ( not ( = ?auto_112886 ?auto_112889 ) ) ( not ( = ?auto_112887 ?auto_112889 ) ) ( not ( = ?auto_112882 ?auto_112888 ) ) ( not ( = ?auto_112883 ?auto_112888 ) ) ( not ( = ?auto_112884 ?auto_112888 ) ) ( not ( = ?auto_112885 ?auto_112888 ) ) ( not ( = ?auto_112886 ?auto_112888 ) ) ( not ( = ?auto_112887 ?auto_112888 ) ) ( not ( = ?auto_112889 ?auto_112888 ) ) ( ON ?auto_112888 ?auto_112889 ) ( CLEAR ?auto_112888 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_112882 ?auto_112883 ?auto_112884 ?auto_112885 ?auto_112886 ?auto_112887 ?auto_112889 )
      ( MAKE-6PILE ?auto_112882 ?auto_112883 ?auto_112884 ?auto_112885 ?auto_112886 ?auto_112887 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_112892 - BLOCK
      ?auto_112893 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_112893 ) ( CLEAR ?auto_112892 ) ( ON-TABLE ?auto_112892 ) ( not ( = ?auto_112892 ?auto_112893 ) ) )
    :subtasks
    ( ( !STACK ?auto_112893 ?auto_112892 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_112894 - BLOCK
      ?auto_112895 - BLOCK
    )
    :vars
    (
      ?auto_112896 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_112894 ) ( ON-TABLE ?auto_112894 ) ( not ( = ?auto_112894 ?auto_112895 ) ) ( ON ?auto_112895 ?auto_112896 ) ( CLEAR ?auto_112895 ) ( HAND-EMPTY ) ( not ( = ?auto_112894 ?auto_112896 ) ) ( not ( = ?auto_112895 ?auto_112896 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_112895 ?auto_112896 )
      ( MAKE-2PILE ?auto_112894 ?auto_112895 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_112897 - BLOCK
      ?auto_112898 - BLOCK
    )
    :vars
    (
      ?auto_112899 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_112897 ?auto_112898 ) ) ( ON ?auto_112898 ?auto_112899 ) ( CLEAR ?auto_112898 ) ( not ( = ?auto_112897 ?auto_112899 ) ) ( not ( = ?auto_112898 ?auto_112899 ) ) ( HOLDING ?auto_112897 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_112897 )
      ( MAKE-2PILE ?auto_112897 ?auto_112898 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_112900 - BLOCK
      ?auto_112901 - BLOCK
    )
    :vars
    (
      ?auto_112902 - BLOCK
      ?auto_112905 - BLOCK
      ?auto_112903 - BLOCK
      ?auto_112907 - BLOCK
      ?auto_112904 - BLOCK
      ?auto_112906 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_112900 ?auto_112901 ) ) ( ON ?auto_112901 ?auto_112902 ) ( not ( = ?auto_112900 ?auto_112902 ) ) ( not ( = ?auto_112901 ?auto_112902 ) ) ( ON ?auto_112900 ?auto_112901 ) ( CLEAR ?auto_112900 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_112905 ) ( ON ?auto_112903 ?auto_112905 ) ( ON ?auto_112907 ?auto_112903 ) ( ON ?auto_112904 ?auto_112907 ) ( ON ?auto_112906 ?auto_112904 ) ( ON ?auto_112902 ?auto_112906 ) ( not ( = ?auto_112905 ?auto_112903 ) ) ( not ( = ?auto_112905 ?auto_112907 ) ) ( not ( = ?auto_112905 ?auto_112904 ) ) ( not ( = ?auto_112905 ?auto_112906 ) ) ( not ( = ?auto_112905 ?auto_112902 ) ) ( not ( = ?auto_112905 ?auto_112901 ) ) ( not ( = ?auto_112905 ?auto_112900 ) ) ( not ( = ?auto_112903 ?auto_112907 ) ) ( not ( = ?auto_112903 ?auto_112904 ) ) ( not ( = ?auto_112903 ?auto_112906 ) ) ( not ( = ?auto_112903 ?auto_112902 ) ) ( not ( = ?auto_112903 ?auto_112901 ) ) ( not ( = ?auto_112903 ?auto_112900 ) ) ( not ( = ?auto_112907 ?auto_112904 ) ) ( not ( = ?auto_112907 ?auto_112906 ) ) ( not ( = ?auto_112907 ?auto_112902 ) ) ( not ( = ?auto_112907 ?auto_112901 ) ) ( not ( = ?auto_112907 ?auto_112900 ) ) ( not ( = ?auto_112904 ?auto_112906 ) ) ( not ( = ?auto_112904 ?auto_112902 ) ) ( not ( = ?auto_112904 ?auto_112901 ) ) ( not ( = ?auto_112904 ?auto_112900 ) ) ( not ( = ?auto_112906 ?auto_112902 ) ) ( not ( = ?auto_112906 ?auto_112901 ) ) ( not ( = ?auto_112906 ?auto_112900 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_112905 ?auto_112903 ?auto_112907 ?auto_112904 ?auto_112906 ?auto_112902 ?auto_112901 )
      ( MAKE-2PILE ?auto_112900 ?auto_112901 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_112913 - BLOCK
      ?auto_112914 - BLOCK
      ?auto_112915 - BLOCK
      ?auto_112916 - BLOCK
      ?auto_112917 - BLOCK
    )
    :vars
    (
      ?auto_112918 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112918 ?auto_112917 ) ( CLEAR ?auto_112918 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_112913 ) ( ON ?auto_112914 ?auto_112913 ) ( ON ?auto_112915 ?auto_112914 ) ( ON ?auto_112916 ?auto_112915 ) ( ON ?auto_112917 ?auto_112916 ) ( not ( = ?auto_112913 ?auto_112914 ) ) ( not ( = ?auto_112913 ?auto_112915 ) ) ( not ( = ?auto_112913 ?auto_112916 ) ) ( not ( = ?auto_112913 ?auto_112917 ) ) ( not ( = ?auto_112913 ?auto_112918 ) ) ( not ( = ?auto_112914 ?auto_112915 ) ) ( not ( = ?auto_112914 ?auto_112916 ) ) ( not ( = ?auto_112914 ?auto_112917 ) ) ( not ( = ?auto_112914 ?auto_112918 ) ) ( not ( = ?auto_112915 ?auto_112916 ) ) ( not ( = ?auto_112915 ?auto_112917 ) ) ( not ( = ?auto_112915 ?auto_112918 ) ) ( not ( = ?auto_112916 ?auto_112917 ) ) ( not ( = ?auto_112916 ?auto_112918 ) ) ( not ( = ?auto_112917 ?auto_112918 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_112918 ?auto_112917 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_112919 - BLOCK
      ?auto_112920 - BLOCK
      ?auto_112921 - BLOCK
      ?auto_112922 - BLOCK
      ?auto_112923 - BLOCK
    )
    :vars
    (
      ?auto_112924 - BLOCK
      ?auto_112925 - BLOCK
      ?auto_112926 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112924 ?auto_112923 ) ( CLEAR ?auto_112924 ) ( ON-TABLE ?auto_112919 ) ( ON ?auto_112920 ?auto_112919 ) ( ON ?auto_112921 ?auto_112920 ) ( ON ?auto_112922 ?auto_112921 ) ( ON ?auto_112923 ?auto_112922 ) ( not ( = ?auto_112919 ?auto_112920 ) ) ( not ( = ?auto_112919 ?auto_112921 ) ) ( not ( = ?auto_112919 ?auto_112922 ) ) ( not ( = ?auto_112919 ?auto_112923 ) ) ( not ( = ?auto_112919 ?auto_112924 ) ) ( not ( = ?auto_112920 ?auto_112921 ) ) ( not ( = ?auto_112920 ?auto_112922 ) ) ( not ( = ?auto_112920 ?auto_112923 ) ) ( not ( = ?auto_112920 ?auto_112924 ) ) ( not ( = ?auto_112921 ?auto_112922 ) ) ( not ( = ?auto_112921 ?auto_112923 ) ) ( not ( = ?auto_112921 ?auto_112924 ) ) ( not ( = ?auto_112922 ?auto_112923 ) ) ( not ( = ?auto_112922 ?auto_112924 ) ) ( not ( = ?auto_112923 ?auto_112924 ) ) ( HOLDING ?auto_112925 ) ( CLEAR ?auto_112926 ) ( not ( = ?auto_112919 ?auto_112925 ) ) ( not ( = ?auto_112919 ?auto_112926 ) ) ( not ( = ?auto_112920 ?auto_112925 ) ) ( not ( = ?auto_112920 ?auto_112926 ) ) ( not ( = ?auto_112921 ?auto_112925 ) ) ( not ( = ?auto_112921 ?auto_112926 ) ) ( not ( = ?auto_112922 ?auto_112925 ) ) ( not ( = ?auto_112922 ?auto_112926 ) ) ( not ( = ?auto_112923 ?auto_112925 ) ) ( not ( = ?auto_112923 ?auto_112926 ) ) ( not ( = ?auto_112924 ?auto_112925 ) ) ( not ( = ?auto_112924 ?auto_112926 ) ) ( not ( = ?auto_112925 ?auto_112926 ) ) )
    :subtasks
    ( ( !STACK ?auto_112925 ?auto_112926 )
      ( MAKE-5PILE ?auto_112919 ?auto_112920 ?auto_112921 ?auto_112922 ?auto_112923 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_112927 - BLOCK
      ?auto_112928 - BLOCK
      ?auto_112929 - BLOCK
      ?auto_112930 - BLOCK
      ?auto_112931 - BLOCK
    )
    :vars
    (
      ?auto_112932 - BLOCK
      ?auto_112933 - BLOCK
      ?auto_112934 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112932 ?auto_112931 ) ( ON-TABLE ?auto_112927 ) ( ON ?auto_112928 ?auto_112927 ) ( ON ?auto_112929 ?auto_112928 ) ( ON ?auto_112930 ?auto_112929 ) ( ON ?auto_112931 ?auto_112930 ) ( not ( = ?auto_112927 ?auto_112928 ) ) ( not ( = ?auto_112927 ?auto_112929 ) ) ( not ( = ?auto_112927 ?auto_112930 ) ) ( not ( = ?auto_112927 ?auto_112931 ) ) ( not ( = ?auto_112927 ?auto_112932 ) ) ( not ( = ?auto_112928 ?auto_112929 ) ) ( not ( = ?auto_112928 ?auto_112930 ) ) ( not ( = ?auto_112928 ?auto_112931 ) ) ( not ( = ?auto_112928 ?auto_112932 ) ) ( not ( = ?auto_112929 ?auto_112930 ) ) ( not ( = ?auto_112929 ?auto_112931 ) ) ( not ( = ?auto_112929 ?auto_112932 ) ) ( not ( = ?auto_112930 ?auto_112931 ) ) ( not ( = ?auto_112930 ?auto_112932 ) ) ( not ( = ?auto_112931 ?auto_112932 ) ) ( CLEAR ?auto_112933 ) ( not ( = ?auto_112927 ?auto_112934 ) ) ( not ( = ?auto_112927 ?auto_112933 ) ) ( not ( = ?auto_112928 ?auto_112934 ) ) ( not ( = ?auto_112928 ?auto_112933 ) ) ( not ( = ?auto_112929 ?auto_112934 ) ) ( not ( = ?auto_112929 ?auto_112933 ) ) ( not ( = ?auto_112930 ?auto_112934 ) ) ( not ( = ?auto_112930 ?auto_112933 ) ) ( not ( = ?auto_112931 ?auto_112934 ) ) ( not ( = ?auto_112931 ?auto_112933 ) ) ( not ( = ?auto_112932 ?auto_112934 ) ) ( not ( = ?auto_112932 ?auto_112933 ) ) ( not ( = ?auto_112934 ?auto_112933 ) ) ( ON ?auto_112934 ?auto_112932 ) ( CLEAR ?auto_112934 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_112927 ?auto_112928 ?auto_112929 ?auto_112930 ?auto_112931 ?auto_112932 )
      ( MAKE-5PILE ?auto_112927 ?auto_112928 ?auto_112929 ?auto_112930 ?auto_112931 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_112935 - BLOCK
      ?auto_112936 - BLOCK
      ?auto_112937 - BLOCK
      ?auto_112938 - BLOCK
      ?auto_112939 - BLOCK
    )
    :vars
    (
      ?auto_112942 - BLOCK
      ?auto_112940 - BLOCK
      ?auto_112941 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112942 ?auto_112939 ) ( ON-TABLE ?auto_112935 ) ( ON ?auto_112936 ?auto_112935 ) ( ON ?auto_112937 ?auto_112936 ) ( ON ?auto_112938 ?auto_112937 ) ( ON ?auto_112939 ?auto_112938 ) ( not ( = ?auto_112935 ?auto_112936 ) ) ( not ( = ?auto_112935 ?auto_112937 ) ) ( not ( = ?auto_112935 ?auto_112938 ) ) ( not ( = ?auto_112935 ?auto_112939 ) ) ( not ( = ?auto_112935 ?auto_112942 ) ) ( not ( = ?auto_112936 ?auto_112937 ) ) ( not ( = ?auto_112936 ?auto_112938 ) ) ( not ( = ?auto_112936 ?auto_112939 ) ) ( not ( = ?auto_112936 ?auto_112942 ) ) ( not ( = ?auto_112937 ?auto_112938 ) ) ( not ( = ?auto_112937 ?auto_112939 ) ) ( not ( = ?auto_112937 ?auto_112942 ) ) ( not ( = ?auto_112938 ?auto_112939 ) ) ( not ( = ?auto_112938 ?auto_112942 ) ) ( not ( = ?auto_112939 ?auto_112942 ) ) ( not ( = ?auto_112935 ?auto_112940 ) ) ( not ( = ?auto_112935 ?auto_112941 ) ) ( not ( = ?auto_112936 ?auto_112940 ) ) ( not ( = ?auto_112936 ?auto_112941 ) ) ( not ( = ?auto_112937 ?auto_112940 ) ) ( not ( = ?auto_112937 ?auto_112941 ) ) ( not ( = ?auto_112938 ?auto_112940 ) ) ( not ( = ?auto_112938 ?auto_112941 ) ) ( not ( = ?auto_112939 ?auto_112940 ) ) ( not ( = ?auto_112939 ?auto_112941 ) ) ( not ( = ?auto_112942 ?auto_112940 ) ) ( not ( = ?auto_112942 ?auto_112941 ) ) ( not ( = ?auto_112940 ?auto_112941 ) ) ( ON ?auto_112940 ?auto_112942 ) ( CLEAR ?auto_112940 ) ( HOLDING ?auto_112941 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_112941 )
      ( MAKE-5PILE ?auto_112935 ?auto_112936 ?auto_112937 ?auto_112938 ?auto_112939 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_112943 - BLOCK
      ?auto_112944 - BLOCK
      ?auto_112945 - BLOCK
      ?auto_112946 - BLOCK
      ?auto_112947 - BLOCK
    )
    :vars
    (
      ?auto_112949 - BLOCK
      ?auto_112948 - BLOCK
      ?auto_112950 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112949 ?auto_112947 ) ( ON-TABLE ?auto_112943 ) ( ON ?auto_112944 ?auto_112943 ) ( ON ?auto_112945 ?auto_112944 ) ( ON ?auto_112946 ?auto_112945 ) ( ON ?auto_112947 ?auto_112946 ) ( not ( = ?auto_112943 ?auto_112944 ) ) ( not ( = ?auto_112943 ?auto_112945 ) ) ( not ( = ?auto_112943 ?auto_112946 ) ) ( not ( = ?auto_112943 ?auto_112947 ) ) ( not ( = ?auto_112943 ?auto_112949 ) ) ( not ( = ?auto_112944 ?auto_112945 ) ) ( not ( = ?auto_112944 ?auto_112946 ) ) ( not ( = ?auto_112944 ?auto_112947 ) ) ( not ( = ?auto_112944 ?auto_112949 ) ) ( not ( = ?auto_112945 ?auto_112946 ) ) ( not ( = ?auto_112945 ?auto_112947 ) ) ( not ( = ?auto_112945 ?auto_112949 ) ) ( not ( = ?auto_112946 ?auto_112947 ) ) ( not ( = ?auto_112946 ?auto_112949 ) ) ( not ( = ?auto_112947 ?auto_112949 ) ) ( not ( = ?auto_112943 ?auto_112948 ) ) ( not ( = ?auto_112943 ?auto_112950 ) ) ( not ( = ?auto_112944 ?auto_112948 ) ) ( not ( = ?auto_112944 ?auto_112950 ) ) ( not ( = ?auto_112945 ?auto_112948 ) ) ( not ( = ?auto_112945 ?auto_112950 ) ) ( not ( = ?auto_112946 ?auto_112948 ) ) ( not ( = ?auto_112946 ?auto_112950 ) ) ( not ( = ?auto_112947 ?auto_112948 ) ) ( not ( = ?auto_112947 ?auto_112950 ) ) ( not ( = ?auto_112949 ?auto_112948 ) ) ( not ( = ?auto_112949 ?auto_112950 ) ) ( not ( = ?auto_112948 ?auto_112950 ) ) ( ON ?auto_112948 ?auto_112949 ) ( ON ?auto_112950 ?auto_112948 ) ( CLEAR ?auto_112950 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_112943 ?auto_112944 ?auto_112945 ?auto_112946 ?auto_112947 ?auto_112949 ?auto_112948 )
      ( MAKE-5PILE ?auto_112943 ?auto_112944 ?auto_112945 ?auto_112946 ?auto_112947 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_112954 - BLOCK
      ?auto_112955 - BLOCK
      ?auto_112956 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_112956 ) ( CLEAR ?auto_112955 ) ( ON-TABLE ?auto_112954 ) ( ON ?auto_112955 ?auto_112954 ) ( not ( = ?auto_112954 ?auto_112955 ) ) ( not ( = ?auto_112954 ?auto_112956 ) ) ( not ( = ?auto_112955 ?auto_112956 ) ) )
    :subtasks
    ( ( !STACK ?auto_112956 ?auto_112955 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_112957 - BLOCK
      ?auto_112958 - BLOCK
      ?auto_112959 - BLOCK
    )
    :vars
    (
      ?auto_112960 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_112958 ) ( ON-TABLE ?auto_112957 ) ( ON ?auto_112958 ?auto_112957 ) ( not ( = ?auto_112957 ?auto_112958 ) ) ( not ( = ?auto_112957 ?auto_112959 ) ) ( not ( = ?auto_112958 ?auto_112959 ) ) ( ON ?auto_112959 ?auto_112960 ) ( CLEAR ?auto_112959 ) ( HAND-EMPTY ) ( not ( = ?auto_112957 ?auto_112960 ) ) ( not ( = ?auto_112958 ?auto_112960 ) ) ( not ( = ?auto_112959 ?auto_112960 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_112959 ?auto_112960 )
      ( MAKE-3PILE ?auto_112957 ?auto_112958 ?auto_112959 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_112961 - BLOCK
      ?auto_112962 - BLOCK
      ?auto_112963 - BLOCK
    )
    :vars
    (
      ?auto_112964 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_112961 ) ( not ( = ?auto_112961 ?auto_112962 ) ) ( not ( = ?auto_112961 ?auto_112963 ) ) ( not ( = ?auto_112962 ?auto_112963 ) ) ( ON ?auto_112963 ?auto_112964 ) ( CLEAR ?auto_112963 ) ( not ( = ?auto_112961 ?auto_112964 ) ) ( not ( = ?auto_112962 ?auto_112964 ) ) ( not ( = ?auto_112963 ?auto_112964 ) ) ( HOLDING ?auto_112962 ) ( CLEAR ?auto_112961 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_112961 ?auto_112962 )
      ( MAKE-3PILE ?auto_112961 ?auto_112962 ?auto_112963 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_112965 - BLOCK
      ?auto_112966 - BLOCK
      ?auto_112967 - BLOCK
    )
    :vars
    (
      ?auto_112968 - BLOCK
      ?auto_112972 - BLOCK
      ?auto_112970 - BLOCK
      ?auto_112969 - BLOCK
      ?auto_112971 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_112965 ) ( not ( = ?auto_112965 ?auto_112966 ) ) ( not ( = ?auto_112965 ?auto_112967 ) ) ( not ( = ?auto_112966 ?auto_112967 ) ) ( ON ?auto_112967 ?auto_112968 ) ( not ( = ?auto_112965 ?auto_112968 ) ) ( not ( = ?auto_112966 ?auto_112968 ) ) ( not ( = ?auto_112967 ?auto_112968 ) ) ( CLEAR ?auto_112965 ) ( ON ?auto_112966 ?auto_112967 ) ( CLEAR ?auto_112966 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_112972 ) ( ON ?auto_112970 ?auto_112972 ) ( ON ?auto_112969 ?auto_112970 ) ( ON ?auto_112971 ?auto_112969 ) ( ON ?auto_112968 ?auto_112971 ) ( not ( = ?auto_112972 ?auto_112970 ) ) ( not ( = ?auto_112972 ?auto_112969 ) ) ( not ( = ?auto_112972 ?auto_112971 ) ) ( not ( = ?auto_112972 ?auto_112968 ) ) ( not ( = ?auto_112972 ?auto_112967 ) ) ( not ( = ?auto_112972 ?auto_112966 ) ) ( not ( = ?auto_112970 ?auto_112969 ) ) ( not ( = ?auto_112970 ?auto_112971 ) ) ( not ( = ?auto_112970 ?auto_112968 ) ) ( not ( = ?auto_112970 ?auto_112967 ) ) ( not ( = ?auto_112970 ?auto_112966 ) ) ( not ( = ?auto_112969 ?auto_112971 ) ) ( not ( = ?auto_112969 ?auto_112968 ) ) ( not ( = ?auto_112969 ?auto_112967 ) ) ( not ( = ?auto_112969 ?auto_112966 ) ) ( not ( = ?auto_112971 ?auto_112968 ) ) ( not ( = ?auto_112971 ?auto_112967 ) ) ( not ( = ?auto_112971 ?auto_112966 ) ) ( not ( = ?auto_112965 ?auto_112972 ) ) ( not ( = ?auto_112965 ?auto_112970 ) ) ( not ( = ?auto_112965 ?auto_112969 ) ) ( not ( = ?auto_112965 ?auto_112971 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_112972 ?auto_112970 ?auto_112969 ?auto_112971 ?auto_112968 ?auto_112967 )
      ( MAKE-3PILE ?auto_112965 ?auto_112966 ?auto_112967 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_112973 - BLOCK
      ?auto_112974 - BLOCK
      ?auto_112975 - BLOCK
    )
    :vars
    (
      ?auto_112976 - BLOCK
      ?auto_112980 - BLOCK
      ?auto_112979 - BLOCK
      ?auto_112977 - BLOCK
      ?auto_112978 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_112973 ?auto_112974 ) ) ( not ( = ?auto_112973 ?auto_112975 ) ) ( not ( = ?auto_112974 ?auto_112975 ) ) ( ON ?auto_112975 ?auto_112976 ) ( not ( = ?auto_112973 ?auto_112976 ) ) ( not ( = ?auto_112974 ?auto_112976 ) ) ( not ( = ?auto_112975 ?auto_112976 ) ) ( ON ?auto_112974 ?auto_112975 ) ( CLEAR ?auto_112974 ) ( ON-TABLE ?auto_112980 ) ( ON ?auto_112979 ?auto_112980 ) ( ON ?auto_112977 ?auto_112979 ) ( ON ?auto_112978 ?auto_112977 ) ( ON ?auto_112976 ?auto_112978 ) ( not ( = ?auto_112980 ?auto_112979 ) ) ( not ( = ?auto_112980 ?auto_112977 ) ) ( not ( = ?auto_112980 ?auto_112978 ) ) ( not ( = ?auto_112980 ?auto_112976 ) ) ( not ( = ?auto_112980 ?auto_112975 ) ) ( not ( = ?auto_112980 ?auto_112974 ) ) ( not ( = ?auto_112979 ?auto_112977 ) ) ( not ( = ?auto_112979 ?auto_112978 ) ) ( not ( = ?auto_112979 ?auto_112976 ) ) ( not ( = ?auto_112979 ?auto_112975 ) ) ( not ( = ?auto_112979 ?auto_112974 ) ) ( not ( = ?auto_112977 ?auto_112978 ) ) ( not ( = ?auto_112977 ?auto_112976 ) ) ( not ( = ?auto_112977 ?auto_112975 ) ) ( not ( = ?auto_112977 ?auto_112974 ) ) ( not ( = ?auto_112978 ?auto_112976 ) ) ( not ( = ?auto_112978 ?auto_112975 ) ) ( not ( = ?auto_112978 ?auto_112974 ) ) ( not ( = ?auto_112973 ?auto_112980 ) ) ( not ( = ?auto_112973 ?auto_112979 ) ) ( not ( = ?auto_112973 ?auto_112977 ) ) ( not ( = ?auto_112973 ?auto_112978 ) ) ( HOLDING ?auto_112973 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_112973 )
      ( MAKE-3PILE ?auto_112973 ?auto_112974 ?auto_112975 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_112981 - BLOCK
      ?auto_112982 - BLOCK
      ?auto_112983 - BLOCK
    )
    :vars
    (
      ?auto_112988 - BLOCK
      ?auto_112984 - BLOCK
      ?auto_112985 - BLOCK
      ?auto_112987 - BLOCK
      ?auto_112986 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_112981 ?auto_112982 ) ) ( not ( = ?auto_112981 ?auto_112983 ) ) ( not ( = ?auto_112982 ?auto_112983 ) ) ( ON ?auto_112983 ?auto_112988 ) ( not ( = ?auto_112981 ?auto_112988 ) ) ( not ( = ?auto_112982 ?auto_112988 ) ) ( not ( = ?auto_112983 ?auto_112988 ) ) ( ON ?auto_112982 ?auto_112983 ) ( ON-TABLE ?auto_112984 ) ( ON ?auto_112985 ?auto_112984 ) ( ON ?auto_112987 ?auto_112985 ) ( ON ?auto_112986 ?auto_112987 ) ( ON ?auto_112988 ?auto_112986 ) ( not ( = ?auto_112984 ?auto_112985 ) ) ( not ( = ?auto_112984 ?auto_112987 ) ) ( not ( = ?auto_112984 ?auto_112986 ) ) ( not ( = ?auto_112984 ?auto_112988 ) ) ( not ( = ?auto_112984 ?auto_112983 ) ) ( not ( = ?auto_112984 ?auto_112982 ) ) ( not ( = ?auto_112985 ?auto_112987 ) ) ( not ( = ?auto_112985 ?auto_112986 ) ) ( not ( = ?auto_112985 ?auto_112988 ) ) ( not ( = ?auto_112985 ?auto_112983 ) ) ( not ( = ?auto_112985 ?auto_112982 ) ) ( not ( = ?auto_112987 ?auto_112986 ) ) ( not ( = ?auto_112987 ?auto_112988 ) ) ( not ( = ?auto_112987 ?auto_112983 ) ) ( not ( = ?auto_112987 ?auto_112982 ) ) ( not ( = ?auto_112986 ?auto_112988 ) ) ( not ( = ?auto_112986 ?auto_112983 ) ) ( not ( = ?auto_112986 ?auto_112982 ) ) ( not ( = ?auto_112981 ?auto_112984 ) ) ( not ( = ?auto_112981 ?auto_112985 ) ) ( not ( = ?auto_112981 ?auto_112987 ) ) ( not ( = ?auto_112981 ?auto_112986 ) ) ( ON ?auto_112981 ?auto_112982 ) ( CLEAR ?auto_112981 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_112984 ?auto_112985 ?auto_112987 ?auto_112986 ?auto_112988 ?auto_112983 ?auto_112982 )
      ( MAKE-3PILE ?auto_112981 ?auto_112982 ?auto_112983 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_112993 - BLOCK
      ?auto_112994 - BLOCK
      ?auto_112995 - BLOCK
      ?auto_112996 - BLOCK
    )
    :vars
    (
      ?auto_112997 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_112997 ?auto_112996 ) ( CLEAR ?auto_112997 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_112993 ) ( ON ?auto_112994 ?auto_112993 ) ( ON ?auto_112995 ?auto_112994 ) ( ON ?auto_112996 ?auto_112995 ) ( not ( = ?auto_112993 ?auto_112994 ) ) ( not ( = ?auto_112993 ?auto_112995 ) ) ( not ( = ?auto_112993 ?auto_112996 ) ) ( not ( = ?auto_112993 ?auto_112997 ) ) ( not ( = ?auto_112994 ?auto_112995 ) ) ( not ( = ?auto_112994 ?auto_112996 ) ) ( not ( = ?auto_112994 ?auto_112997 ) ) ( not ( = ?auto_112995 ?auto_112996 ) ) ( not ( = ?auto_112995 ?auto_112997 ) ) ( not ( = ?auto_112996 ?auto_112997 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_112997 ?auto_112996 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_112998 - BLOCK
      ?auto_112999 - BLOCK
      ?auto_113000 - BLOCK
      ?auto_113001 - BLOCK
    )
    :vars
    (
      ?auto_113002 - BLOCK
      ?auto_113003 - BLOCK
      ?auto_113004 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113002 ?auto_113001 ) ( CLEAR ?auto_113002 ) ( ON-TABLE ?auto_112998 ) ( ON ?auto_112999 ?auto_112998 ) ( ON ?auto_113000 ?auto_112999 ) ( ON ?auto_113001 ?auto_113000 ) ( not ( = ?auto_112998 ?auto_112999 ) ) ( not ( = ?auto_112998 ?auto_113000 ) ) ( not ( = ?auto_112998 ?auto_113001 ) ) ( not ( = ?auto_112998 ?auto_113002 ) ) ( not ( = ?auto_112999 ?auto_113000 ) ) ( not ( = ?auto_112999 ?auto_113001 ) ) ( not ( = ?auto_112999 ?auto_113002 ) ) ( not ( = ?auto_113000 ?auto_113001 ) ) ( not ( = ?auto_113000 ?auto_113002 ) ) ( not ( = ?auto_113001 ?auto_113002 ) ) ( HOLDING ?auto_113003 ) ( CLEAR ?auto_113004 ) ( not ( = ?auto_112998 ?auto_113003 ) ) ( not ( = ?auto_112998 ?auto_113004 ) ) ( not ( = ?auto_112999 ?auto_113003 ) ) ( not ( = ?auto_112999 ?auto_113004 ) ) ( not ( = ?auto_113000 ?auto_113003 ) ) ( not ( = ?auto_113000 ?auto_113004 ) ) ( not ( = ?auto_113001 ?auto_113003 ) ) ( not ( = ?auto_113001 ?auto_113004 ) ) ( not ( = ?auto_113002 ?auto_113003 ) ) ( not ( = ?auto_113002 ?auto_113004 ) ) ( not ( = ?auto_113003 ?auto_113004 ) ) )
    :subtasks
    ( ( !STACK ?auto_113003 ?auto_113004 )
      ( MAKE-4PILE ?auto_112998 ?auto_112999 ?auto_113000 ?auto_113001 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_113005 - BLOCK
      ?auto_113006 - BLOCK
      ?auto_113007 - BLOCK
      ?auto_113008 - BLOCK
    )
    :vars
    (
      ?auto_113010 - BLOCK
      ?auto_113011 - BLOCK
      ?auto_113009 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113010 ?auto_113008 ) ( ON-TABLE ?auto_113005 ) ( ON ?auto_113006 ?auto_113005 ) ( ON ?auto_113007 ?auto_113006 ) ( ON ?auto_113008 ?auto_113007 ) ( not ( = ?auto_113005 ?auto_113006 ) ) ( not ( = ?auto_113005 ?auto_113007 ) ) ( not ( = ?auto_113005 ?auto_113008 ) ) ( not ( = ?auto_113005 ?auto_113010 ) ) ( not ( = ?auto_113006 ?auto_113007 ) ) ( not ( = ?auto_113006 ?auto_113008 ) ) ( not ( = ?auto_113006 ?auto_113010 ) ) ( not ( = ?auto_113007 ?auto_113008 ) ) ( not ( = ?auto_113007 ?auto_113010 ) ) ( not ( = ?auto_113008 ?auto_113010 ) ) ( CLEAR ?auto_113011 ) ( not ( = ?auto_113005 ?auto_113009 ) ) ( not ( = ?auto_113005 ?auto_113011 ) ) ( not ( = ?auto_113006 ?auto_113009 ) ) ( not ( = ?auto_113006 ?auto_113011 ) ) ( not ( = ?auto_113007 ?auto_113009 ) ) ( not ( = ?auto_113007 ?auto_113011 ) ) ( not ( = ?auto_113008 ?auto_113009 ) ) ( not ( = ?auto_113008 ?auto_113011 ) ) ( not ( = ?auto_113010 ?auto_113009 ) ) ( not ( = ?auto_113010 ?auto_113011 ) ) ( not ( = ?auto_113009 ?auto_113011 ) ) ( ON ?auto_113009 ?auto_113010 ) ( CLEAR ?auto_113009 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_113005 ?auto_113006 ?auto_113007 ?auto_113008 ?auto_113010 )
      ( MAKE-4PILE ?auto_113005 ?auto_113006 ?auto_113007 ?auto_113008 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_113012 - BLOCK
      ?auto_113013 - BLOCK
      ?auto_113014 - BLOCK
      ?auto_113015 - BLOCK
    )
    :vars
    (
      ?auto_113016 - BLOCK
      ?auto_113017 - BLOCK
      ?auto_113018 - BLOCK
      ?auto_113019 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113016 ?auto_113015 ) ( ON-TABLE ?auto_113012 ) ( ON ?auto_113013 ?auto_113012 ) ( ON ?auto_113014 ?auto_113013 ) ( ON ?auto_113015 ?auto_113014 ) ( not ( = ?auto_113012 ?auto_113013 ) ) ( not ( = ?auto_113012 ?auto_113014 ) ) ( not ( = ?auto_113012 ?auto_113015 ) ) ( not ( = ?auto_113012 ?auto_113016 ) ) ( not ( = ?auto_113013 ?auto_113014 ) ) ( not ( = ?auto_113013 ?auto_113015 ) ) ( not ( = ?auto_113013 ?auto_113016 ) ) ( not ( = ?auto_113014 ?auto_113015 ) ) ( not ( = ?auto_113014 ?auto_113016 ) ) ( not ( = ?auto_113015 ?auto_113016 ) ) ( not ( = ?auto_113012 ?auto_113017 ) ) ( not ( = ?auto_113012 ?auto_113018 ) ) ( not ( = ?auto_113013 ?auto_113017 ) ) ( not ( = ?auto_113013 ?auto_113018 ) ) ( not ( = ?auto_113014 ?auto_113017 ) ) ( not ( = ?auto_113014 ?auto_113018 ) ) ( not ( = ?auto_113015 ?auto_113017 ) ) ( not ( = ?auto_113015 ?auto_113018 ) ) ( not ( = ?auto_113016 ?auto_113017 ) ) ( not ( = ?auto_113016 ?auto_113018 ) ) ( not ( = ?auto_113017 ?auto_113018 ) ) ( ON ?auto_113017 ?auto_113016 ) ( CLEAR ?auto_113017 ) ( HOLDING ?auto_113018 ) ( CLEAR ?auto_113019 ) ( ON-TABLE ?auto_113019 ) ( not ( = ?auto_113019 ?auto_113018 ) ) ( not ( = ?auto_113012 ?auto_113019 ) ) ( not ( = ?auto_113013 ?auto_113019 ) ) ( not ( = ?auto_113014 ?auto_113019 ) ) ( not ( = ?auto_113015 ?auto_113019 ) ) ( not ( = ?auto_113016 ?auto_113019 ) ) ( not ( = ?auto_113017 ?auto_113019 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_113019 ?auto_113018 )
      ( MAKE-4PILE ?auto_113012 ?auto_113013 ?auto_113014 ?auto_113015 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_113020 - BLOCK
      ?auto_113021 - BLOCK
      ?auto_113022 - BLOCK
      ?auto_113023 - BLOCK
    )
    :vars
    (
      ?auto_113026 - BLOCK
      ?auto_113027 - BLOCK
      ?auto_113025 - BLOCK
      ?auto_113024 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113026 ?auto_113023 ) ( ON-TABLE ?auto_113020 ) ( ON ?auto_113021 ?auto_113020 ) ( ON ?auto_113022 ?auto_113021 ) ( ON ?auto_113023 ?auto_113022 ) ( not ( = ?auto_113020 ?auto_113021 ) ) ( not ( = ?auto_113020 ?auto_113022 ) ) ( not ( = ?auto_113020 ?auto_113023 ) ) ( not ( = ?auto_113020 ?auto_113026 ) ) ( not ( = ?auto_113021 ?auto_113022 ) ) ( not ( = ?auto_113021 ?auto_113023 ) ) ( not ( = ?auto_113021 ?auto_113026 ) ) ( not ( = ?auto_113022 ?auto_113023 ) ) ( not ( = ?auto_113022 ?auto_113026 ) ) ( not ( = ?auto_113023 ?auto_113026 ) ) ( not ( = ?auto_113020 ?auto_113027 ) ) ( not ( = ?auto_113020 ?auto_113025 ) ) ( not ( = ?auto_113021 ?auto_113027 ) ) ( not ( = ?auto_113021 ?auto_113025 ) ) ( not ( = ?auto_113022 ?auto_113027 ) ) ( not ( = ?auto_113022 ?auto_113025 ) ) ( not ( = ?auto_113023 ?auto_113027 ) ) ( not ( = ?auto_113023 ?auto_113025 ) ) ( not ( = ?auto_113026 ?auto_113027 ) ) ( not ( = ?auto_113026 ?auto_113025 ) ) ( not ( = ?auto_113027 ?auto_113025 ) ) ( ON ?auto_113027 ?auto_113026 ) ( CLEAR ?auto_113024 ) ( ON-TABLE ?auto_113024 ) ( not ( = ?auto_113024 ?auto_113025 ) ) ( not ( = ?auto_113020 ?auto_113024 ) ) ( not ( = ?auto_113021 ?auto_113024 ) ) ( not ( = ?auto_113022 ?auto_113024 ) ) ( not ( = ?auto_113023 ?auto_113024 ) ) ( not ( = ?auto_113026 ?auto_113024 ) ) ( not ( = ?auto_113027 ?auto_113024 ) ) ( ON ?auto_113025 ?auto_113027 ) ( CLEAR ?auto_113025 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_113020 ?auto_113021 ?auto_113022 ?auto_113023 ?auto_113026 ?auto_113027 )
      ( MAKE-4PILE ?auto_113020 ?auto_113021 ?auto_113022 ?auto_113023 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_113028 - BLOCK
      ?auto_113029 - BLOCK
      ?auto_113030 - BLOCK
      ?auto_113031 - BLOCK
    )
    :vars
    (
      ?auto_113032 - BLOCK
      ?auto_113033 - BLOCK
      ?auto_113035 - BLOCK
      ?auto_113034 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113032 ?auto_113031 ) ( ON-TABLE ?auto_113028 ) ( ON ?auto_113029 ?auto_113028 ) ( ON ?auto_113030 ?auto_113029 ) ( ON ?auto_113031 ?auto_113030 ) ( not ( = ?auto_113028 ?auto_113029 ) ) ( not ( = ?auto_113028 ?auto_113030 ) ) ( not ( = ?auto_113028 ?auto_113031 ) ) ( not ( = ?auto_113028 ?auto_113032 ) ) ( not ( = ?auto_113029 ?auto_113030 ) ) ( not ( = ?auto_113029 ?auto_113031 ) ) ( not ( = ?auto_113029 ?auto_113032 ) ) ( not ( = ?auto_113030 ?auto_113031 ) ) ( not ( = ?auto_113030 ?auto_113032 ) ) ( not ( = ?auto_113031 ?auto_113032 ) ) ( not ( = ?auto_113028 ?auto_113033 ) ) ( not ( = ?auto_113028 ?auto_113035 ) ) ( not ( = ?auto_113029 ?auto_113033 ) ) ( not ( = ?auto_113029 ?auto_113035 ) ) ( not ( = ?auto_113030 ?auto_113033 ) ) ( not ( = ?auto_113030 ?auto_113035 ) ) ( not ( = ?auto_113031 ?auto_113033 ) ) ( not ( = ?auto_113031 ?auto_113035 ) ) ( not ( = ?auto_113032 ?auto_113033 ) ) ( not ( = ?auto_113032 ?auto_113035 ) ) ( not ( = ?auto_113033 ?auto_113035 ) ) ( ON ?auto_113033 ?auto_113032 ) ( not ( = ?auto_113034 ?auto_113035 ) ) ( not ( = ?auto_113028 ?auto_113034 ) ) ( not ( = ?auto_113029 ?auto_113034 ) ) ( not ( = ?auto_113030 ?auto_113034 ) ) ( not ( = ?auto_113031 ?auto_113034 ) ) ( not ( = ?auto_113032 ?auto_113034 ) ) ( not ( = ?auto_113033 ?auto_113034 ) ) ( ON ?auto_113035 ?auto_113033 ) ( CLEAR ?auto_113035 ) ( HOLDING ?auto_113034 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_113034 )
      ( MAKE-4PILE ?auto_113028 ?auto_113029 ?auto_113030 ?auto_113031 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_113036 - BLOCK
      ?auto_113037 - BLOCK
      ?auto_113038 - BLOCK
      ?auto_113039 - BLOCK
    )
    :vars
    (
      ?auto_113040 - BLOCK
      ?auto_113043 - BLOCK
      ?auto_113042 - BLOCK
      ?auto_113041 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113040 ?auto_113039 ) ( ON-TABLE ?auto_113036 ) ( ON ?auto_113037 ?auto_113036 ) ( ON ?auto_113038 ?auto_113037 ) ( ON ?auto_113039 ?auto_113038 ) ( not ( = ?auto_113036 ?auto_113037 ) ) ( not ( = ?auto_113036 ?auto_113038 ) ) ( not ( = ?auto_113036 ?auto_113039 ) ) ( not ( = ?auto_113036 ?auto_113040 ) ) ( not ( = ?auto_113037 ?auto_113038 ) ) ( not ( = ?auto_113037 ?auto_113039 ) ) ( not ( = ?auto_113037 ?auto_113040 ) ) ( not ( = ?auto_113038 ?auto_113039 ) ) ( not ( = ?auto_113038 ?auto_113040 ) ) ( not ( = ?auto_113039 ?auto_113040 ) ) ( not ( = ?auto_113036 ?auto_113043 ) ) ( not ( = ?auto_113036 ?auto_113042 ) ) ( not ( = ?auto_113037 ?auto_113043 ) ) ( not ( = ?auto_113037 ?auto_113042 ) ) ( not ( = ?auto_113038 ?auto_113043 ) ) ( not ( = ?auto_113038 ?auto_113042 ) ) ( not ( = ?auto_113039 ?auto_113043 ) ) ( not ( = ?auto_113039 ?auto_113042 ) ) ( not ( = ?auto_113040 ?auto_113043 ) ) ( not ( = ?auto_113040 ?auto_113042 ) ) ( not ( = ?auto_113043 ?auto_113042 ) ) ( ON ?auto_113043 ?auto_113040 ) ( not ( = ?auto_113041 ?auto_113042 ) ) ( not ( = ?auto_113036 ?auto_113041 ) ) ( not ( = ?auto_113037 ?auto_113041 ) ) ( not ( = ?auto_113038 ?auto_113041 ) ) ( not ( = ?auto_113039 ?auto_113041 ) ) ( not ( = ?auto_113040 ?auto_113041 ) ) ( not ( = ?auto_113043 ?auto_113041 ) ) ( ON ?auto_113042 ?auto_113043 ) ( ON ?auto_113041 ?auto_113042 ) ( CLEAR ?auto_113041 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_113036 ?auto_113037 ?auto_113038 ?auto_113039 ?auto_113040 ?auto_113043 ?auto_113042 )
      ( MAKE-4PILE ?auto_113036 ?auto_113037 ?auto_113038 ?auto_113039 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_113048 - BLOCK
      ?auto_113049 - BLOCK
      ?auto_113050 - BLOCK
      ?auto_113051 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_113051 ) ( CLEAR ?auto_113050 ) ( ON-TABLE ?auto_113048 ) ( ON ?auto_113049 ?auto_113048 ) ( ON ?auto_113050 ?auto_113049 ) ( not ( = ?auto_113048 ?auto_113049 ) ) ( not ( = ?auto_113048 ?auto_113050 ) ) ( not ( = ?auto_113048 ?auto_113051 ) ) ( not ( = ?auto_113049 ?auto_113050 ) ) ( not ( = ?auto_113049 ?auto_113051 ) ) ( not ( = ?auto_113050 ?auto_113051 ) ) )
    :subtasks
    ( ( !STACK ?auto_113051 ?auto_113050 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_113052 - BLOCK
      ?auto_113053 - BLOCK
      ?auto_113054 - BLOCK
      ?auto_113055 - BLOCK
    )
    :vars
    (
      ?auto_113056 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_113054 ) ( ON-TABLE ?auto_113052 ) ( ON ?auto_113053 ?auto_113052 ) ( ON ?auto_113054 ?auto_113053 ) ( not ( = ?auto_113052 ?auto_113053 ) ) ( not ( = ?auto_113052 ?auto_113054 ) ) ( not ( = ?auto_113052 ?auto_113055 ) ) ( not ( = ?auto_113053 ?auto_113054 ) ) ( not ( = ?auto_113053 ?auto_113055 ) ) ( not ( = ?auto_113054 ?auto_113055 ) ) ( ON ?auto_113055 ?auto_113056 ) ( CLEAR ?auto_113055 ) ( HAND-EMPTY ) ( not ( = ?auto_113052 ?auto_113056 ) ) ( not ( = ?auto_113053 ?auto_113056 ) ) ( not ( = ?auto_113054 ?auto_113056 ) ) ( not ( = ?auto_113055 ?auto_113056 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_113055 ?auto_113056 )
      ( MAKE-4PILE ?auto_113052 ?auto_113053 ?auto_113054 ?auto_113055 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_113057 - BLOCK
      ?auto_113058 - BLOCK
      ?auto_113059 - BLOCK
      ?auto_113060 - BLOCK
    )
    :vars
    (
      ?auto_113061 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_113057 ) ( ON ?auto_113058 ?auto_113057 ) ( not ( = ?auto_113057 ?auto_113058 ) ) ( not ( = ?auto_113057 ?auto_113059 ) ) ( not ( = ?auto_113057 ?auto_113060 ) ) ( not ( = ?auto_113058 ?auto_113059 ) ) ( not ( = ?auto_113058 ?auto_113060 ) ) ( not ( = ?auto_113059 ?auto_113060 ) ) ( ON ?auto_113060 ?auto_113061 ) ( CLEAR ?auto_113060 ) ( not ( = ?auto_113057 ?auto_113061 ) ) ( not ( = ?auto_113058 ?auto_113061 ) ) ( not ( = ?auto_113059 ?auto_113061 ) ) ( not ( = ?auto_113060 ?auto_113061 ) ) ( HOLDING ?auto_113059 ) ( CLEAR ?auto_113058 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_113057 ?auto_113058 ?auto_113059 )
      ( MAKE-4PILE ?auto_113057 ?auto_113058 ?auto_113059 ?auto_113060 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_113062 - BLOCK
      ?auto_113063 - BLOCK
      ?auto_113064 - BLOCK
      ?auto_113065 - BLOCK
    )
    :vars
    (
      ?auto_113066 - BLOCK
      ?auto_113069 - BLOCK
      ?auto_113067 - BLOCK
      ?auto_113068 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_113062 ) ( ON ?auto_113063 ?auto_113062 ) ( not ( = ?auto_113062 ?auto_113063 ) ) ( not ( = ?auto_113062 ?auto_113064 ) ) ( not ( = ?auto_113062 ?auto_113065 ) ) ( not ( = ?auto_113063 ?auto_113064 ) ) ( not ( = ?auto_113063 ?auto_113065 ) ) ( not ( = ?auto_113064 ?auto_113065 ) ) ( ON ?auto_113065 ?auto_113066 ) ( not ( = ?auto_113062 ?auto_113066 ) ) ( not ( = ?auto_113063 ?auto_113066 ) ) ( not ( = ?auto_113064 ?auto_113066 ) ) ( not ( = ?auto_113065 ?auto_113066 ) ) ( CLEAR ?auto_113063 ) ( ON ?auto_113064 ?auto_113065 ) ( CLEAR ?auto_113064 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_113069 ) ( ON ?auto_113067 ?auto_113069 ) ( ON ?auto_113068 ?auto_113067 ) ( ON ?auto_113066 ?auto_113068 ) ( not ( = ?auto_113069 ?auto_113067 ) ) ( not ( = ?auto_113069 ?auto_113068 ) ) ( not ( = ?auto_113069 ?auto_113066 ) ) ( not ( = ?auto_113069 ?auto_113065 ) ) ( not ( = ?auto_113069 ?auto_113064 ) ) ( not ( = ?auto_113067 ?auto_113068 ) ) ( not ( = ?auto_113067 ?auto_113066 ) ) ( not ( = ?auto_113067 ?auto_113065 ) ) ( not ( = ?auto_113067 ?auto_113064 ) ) ( not ( = ?auto_113068 ?auto_113066 ) ) ( not ( = ?auto_113068 ?auto_113065 ) ) ( not ( = ?auto_113068 ?auto_113064 ) ) ( not ( = ?auto_113062 ?auto_113069 ) ) ( not ( = ?auto_113062 ?auto_113067 ) ) ( not ( = ?auto_113062 ?auto_113068 ) ) ( not ( = ?auto_113063 ?auto_113069 ) ) ( not ( = ?auto_113063 ?auto_113067 ) ) ( not ( = ?auto_113063 ?auto_113068 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_113069 ?auto_113067 ?auto_113068 ?auto_113066 ?auto_113065 )
      ( MAKE-4PILE ?auto_113062 ?auto_113063 ?auto_113064 ?auto_113065 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_113070 - BLOCK
      ?auto_113071 - BLOCK
      ?auto_113072 - BLOCK
      ?auto_113073 - BLOCK
    )
    :vars
    (
      ?auto_113074 - BLOCK
      ?auto_113077 - BLOCK
      ?auto_113076 - BLOCK
      ?auto_113075 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_113070 ) ( not ( = ?auto_113070 ?auto_113071 ) ) ( not ( = ?auto_113070 ?auto_113072 ) ) ( not ( = ?auto_113070 ?auto_113073 ) ) ( not ( = ?auto_113071 ?auto_113072 ) ) ( not ( = ?auto_113071 ?auto_113073 ) ) ( not ( = ?auto_113072 ?auto_113073 ) ) ( ON ?auto_113073 ?auto_113074 ) ( not ( = ?auto_113070 ?auto_113074 ) ) ( not ( = ?auto_113071 ?auto_113074 ) ) ( not ( = ?auto_113072 ?auto_113074 ) ) ( not ( = ?auto_113073 ?auto_113074 ) ) ( ON ?auto_113072 ?auto_113073 ) ( CLEAR ?auto_113072 ) ( ON-TABLE ?auto_113077 ) ( ON ?auto_113076 ?auto_113077 ) ( ON ?auto_113075 ?auto_113076 ) ( ON ?auto_113074 ?auto_113075 ) ( not ( = ?auto_113077 ?auto_113076 ) ) ( not ( = ?auto_113077 ?auto_113075 ) ) ( not ( = ?auto_113077 ?auto_113074 ) ) ( not ( = ?auto_113077 ?auto_113073 ) ) ( not ( = ?auto_113077 ?auto_113072 ) ) ( not ( = ?auto_113076 ?auto_113075 ) ) ( not ( = ?auto_113076 ?auto_113074 ) ) ( not ( = ?auto_113076 ?auto_113073 ) ) ( not ( = ?auto_113076 ?auto_113072 ) ) ( not ( = ?auto_113075 ?auto_113074 ) ) ( not ( = ?auto_113075 ?auto_113073 ) ) ( not ( = ?auto_113075 ?auto_113072 ) ) ( not ( = ?auto_113070 ?auto_113077 ) ) ( not ( = ?auto_113070 ?auto_113076 ) ) ( not ( = ?auto_113070 ?auto_113075 ) ) ( not ( = ?auto_113071 ?auto_113077 ) ) ( not ( = ?auto_113071 ?auto_113076 ) ) ( not ( = ?auto_113071 ?auto_113075 ) ) ( HOLDING ?auto_113071 ) ( CLEAR ?auto_113070 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_113070 ?auto_113071 )
      ( MAKE-4PILE ?auto_113070 ?auto_113071 ?auto_113072 ?auto_113073 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_113078 - BLOCK
      ?auto_113079 - BLOCK
      ?auto_113080 - BLOCK
      ?auto_113081 - BLOCK
    )
    :vars
    (
      ?auto_113083 - BLOCK
      ?auto_113085 - BLOCK
      ?auto_113082 - BLOCK
      ?auto_113084 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_113078 ) ( not ( = ?auto_113078 ?auto_113079 ) ) ( not ( = ?auto_113078 ?auto_113080 ) ) ( not ( = ?auto_113078 ?auto_113081 ) ) ( not ( = ?auto_113079 ?auto_113080 ) ) ( not ( = ?auto_113079 ?auto_113081 ) ) ( not ( = ?auto_113080 ?auto_113081 ) ) ( ON ?auto_113081 ?auto_113083 ) ( not ( = ?auto_113078 ?auto_113083 ) ) ( not ( = ?auto_113079 ?auto_113083 ) ) ( not ( = ?auto_113080 ?auto_113083 ) ) ( not ( = ?auto_113081 ?auto_113083 ) ) ( ON ?auto_113080 ?auto_113081 ) ( ON-TABLE ?auto_113085 ) ( ON ?auto_113082 ?auto_113085 ) ( ON ?auto_113084 ?auto_113082 ) ( ON ?auto_113083 ?auto_113084 ) ( not ( = ?auto_113085 ?auto_113082 ) ) ( not ( = ?auto_113085 ?auto_113084 ) ) ( not ( = ?auto_113085 ?auto_113083 ) ) ( not ( = ?auto_113085 ?auto_113081 ) ) ( not ( = ?auto_113085 ?auto_113080 ) ) ( not ( = ?auto_113082 ?auto_113084 ) ) ( not ( = ?auto_113082 ?auto_113083 ) ) ( not ( = ?auto_113082 ?auto_113081 ) ) ( not ( = ?auto_113082 ?auto_113080 ) ) ( not ( = ?auto_113084 ?auto_113083 ) ) ( not ( = ?auto_113084 ?auto_113081 ) ) ( not ( = ?auto_113084 ?auto_113080 ) ) ( not ( = ?auto_113078 ?auto_113085 ) ) ( not ( = ?auto_113078 ?auto_113082 ) ) ( not ( = ?auto_113078 ?auto_113084 ) ) ( not ( = ?auto_113079 ?auto_113085 ) ) ( not ( = ?auto_113079 ?auto_113082 ) ) ( not ( = ?auto_113079 ?auto_113084 ) ) ( CLEAR ?auto_113078 ) ( ON ?auto_113079 ?auto_113080 ) ( CLEAR ?auto_113079 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_113085 ?auto_113082 ?auto_113084 ?auto_113083 ?auto_113081 ?auto_113080 )
      ( MAKE-4PILE ?auto_113078 ?auto_113079 ?auto_113080 ?auto_113081 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_113086 - BLOCK
      ?auto_113087 - BLOCK
      ?auto_113088 - BLOCK
      ?auto_113089 - BLOCK
    )
    :vars
    (
      ?auto_113091 - BLOCK
      ?auto_113093 - BLOCK
      ?auto_113090 - BLOCK
      ?auto_113092 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_113086 ?auto_113087 ) ) ( not ( = ?auto_113086 ?auto_113088 ) ) ( not ( = ?auto_113086 ?auto_113089 ) ) ( not ( = ?auto_113087 ?auto_113088 ) ) ( not ( = ?auto_113087 ?auto_113089 ) ) ( not ( = ?auto_113088 ?auto_113089 ) ) ( ON ?auto_113089 ?auto_113091 ) ( not ( = ?auto_113086 ?auto_113091 ) ) ( not ( = ?auto_113087 ?auto_113091 ) ) ( not ( = ?auto_113088 ?auto_113091 ) ) ( not ( = ?auto_113089 ?auto_113091 ) ) ( ON ?auto_113088 ?auto_113089 ) ( ON-TABLE ?auto_113093 ) ( ON ?auto_113090 ?auto_113093 ) ( ON ?auto_113092 ?auto_113090 ) ( ON ?auto_113091 ?auto_113092 ) ( not ( = ?auto_113093 ?auto_113090 ) ) ( not ( = ?auto_113093 ?auto_113092 ) ) ( not ( = ?auto_113093 ?auto_113091 ) ) ( not ( = ?auto_113093 ?auto_113089 ) ) ( not ( = ?auto_113093 ?auto_113088 ) ) ( not ( = ?auto_113090 ?auto_113092 ) ) ( not ( = ?auto_113090 ?auto_113091 ) ) ( not ( = ?auto_113090 ?auto_113089 ) ) ( not ( = ?auto_113090 ?auto_113088 ) ) ( not ( = ?auto_113092 ?auto_113091 ) ) ( not ( = ?auto_113092 ?auto_113089 ) ) ( not ( = ?auto_113092 ?auto_113088 ) ) ( not ( = ?auto_113086 ?auto_113093 ) ) ( not ( = ?auto_113086 ?auto_113090 ) ) ( not ( = ?auto_113086 ?auto_113092 ) ) ( not ( = ?auto_113087 ?auto_113093 ) ) ( not ( = ?auto_113087 ?auto_113090 ) ) ( not ( = ?auto_113087 ?auto_113092 ) ) ( ON ?auto_113087 ?auto_113088 ) ( CLEAR ?auto_113087 ) ( HOLDING ?auto_113086 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_113086 )
      ( MAKE-4PILE ?auto_113086 ?auto_113087 ?auto_113088 ?auto_113089 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_113094 - BLOCK
      ?auto_113095 - BLOCK
      ?auto_113096 - BLOCK
      ?auto_113097 - BLOCK
    )
    :vars
    (
      ?auto_113099 - BLOCK
      ?auto_113100 - BLOCK
      ?auto_113098 - BLOCK
      ?auto_113101 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_113094 ?auto_113095 ) ) ( not ( = ?auto_113094 ?auto_113096 ) ) ( not ( = ?auto_113094 ?auto_113097 ) ) ( not ( = ?auto_113095 ?auto_113096 ) ) ( not ( = ?auto_113095 ?auto_113097 ) ) ( not ( = ?auto_113096 ?auto_113097 ) ) ( ON ?auto_113097 ?auto_113099 ) ( not ( = ?auto_113094 ?auto_113099 ) ) ( not ( = ?auto_113095 ?auto_113099 ) ) ( not ( = ?auto_113096 ?auto_113099 ) ) ( not ( = ?auto_113097 ?auto_113099 ) ) ( ON ?auto_113096 ?auto_113097 ) ( ON-TABLE ?auto_113100 ) ( ON ?auto_113098 ?auto_113100 ) ( ON ?auto_113101 ?auto_113098 ) ( ON ?auto_113099 ?auto_113101 ) ( not ( = ?auto_113100 ?auto_113098 ) ) ( not ( = ?auto_113100 ?auto_113101 ) ) ( not ( = ?auto_113100 ?auto_113099 ) ) ( not ( = ?auto_113100 ?auto_113097 ) ) ( not ( = ?auto_113100 ?auto_113096 ) ) ( not ( = ?auto_113098 ?auto_113101 ) ) ( not ( = ?auto_113098 ?auto_113099 ) ) ( not ( = ?auto_113098 ?auto_113097 ) ) ( not ( = ?auto_113098 ?auto_113096 ) ) ( not ( = ?auto_113101 ?auto_113099 ) ) ( not ( = ?auto_113101 ?auto_113097 ) ) ( not ( = ?auto_113101 ?auto_113096 ) ) ( not ( = ?auto_113094 ?auto_113100 ) ) ( not ( = ?auto_113094 ?auto_113098 ) ) ( not ( = ?auto_113094 ?auto_113101 ) ) ( not ( = ?auto_113095 ?auto_113100 ) ) ( not ( = ?auto_113095 ?auto_113098 ) ) ( not ( = ?auto_113095 ?auto_113101 ) ) ( ON ?auto_113095 ?auto_113096 ) ( ON ?auto_113094 ?auto_113095 ) ( CLEAR ?auto_113094 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_113100 ?auto_113098 ?auto_113101 ?auto_113099 ?auto_113097 ?auto_113096 ?auto_113095 )
      ( MAKE-4PILE ?auto_113094 ?auto_113095 ?auto_113096 ?auto_113097 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_113105 - BLOCK
      ?auto_113106 - BLOCK
      ?auto_113107 - BLOCK
    )
    :vars
    (
      ?auto_113108 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113108 ?auto_113107 ) ( CLEAR ?auto_113108 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_113105 ) ( ON ?auto_113106 ?auto_113105 ) ( ON ?auto_113107 ?auto_113106 ) ( not ( = ?auto_113105 ?auto_113106 ) ) ( not ( = ?auto_113105 ?auto_113107 ) ) ( not ( = ?auto_113105 ?auto_113108 ) ) ( not ( = ?auto_113106 ?auto_113107 ) ) ( not ( = ?auto_113106 ?auto_113108 ) ) ( not ( = ?auto_113107 ?auto_113108 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_113108 ?auto_113107 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_113109 - BLOCK
      ?auto_113110 - BLOCK
      ?auto_113111 - BLOCK
    )
    :vars
    (
      ?auto_113112 - BLOCK
      ?auto_113113 - BLOCK
      ?auto_113114 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113112 ?auto_113111 ) ( CLEAR ?auto_113112 ) ( ON-TABLE ?auto_113109 ) ( ON ?auto_113110 ?auto_113109 ) ( ON ?auto_113111 ?auto_113110 ) ( not ( = ?auto_113109 ?auto_113110 ) ) ( not ( = ?auto_113109 ?auto_113111 ) ) ( not ( = ?auto_113109 ?auto_113112 ) ) ( not ( = ?auto_113110 ?auto_113111 ) ) ( not ( = ?auto_113110 ?auto_113112 ) ) ( not ( = ?auto_113111 ?auto_113112 ) ) ( HOLDING ?auto_113113 ) ( CLEAR ?auto_113114 ) ( not ( = ?auto_113109 ?auto_113113 ) ) ( not ( = ?auto_113109 ?auto_113114 ) ) ( not ( = ?auto_113110 ?auto_113113 ) ) ( not ( = ?auto_113110 ?auto_113114 ) ) ( not ( = ?auto_113111 ?auto_113113 ) ) ( not ( = ?auto_113111 ?auto_113114 ) ) ( not ( = ?auto_113112 ?auto_113113 ) ) ( not ( = ?auto_113112 ?auto_113114 ) ) ( not ( = ?auto_113113 ?auto_113114 ) ) )
    :subtasks
    ( ( !STACK ?auto_113113 ?auto_113114 )
      ( MAKE-3PILE ?auto_113109 ?auto_113110 ?auto_113111 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_113115 - BLOCK
      ?auto_113116 - BLOCK
      ?auto_113117 - BLOCK
    )
    :vars
    (
      ?auto_113118 - BLOCK
      ?auto_113120 - BLOCK
      ?auto_113119 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113118 ?auto_113117 ) ( ON-TABLE ?auto_113115 ) ( ON ?auto_113116 ?auto_113115 ) ( ON ?auto_113117 ?auto_113116 ) ( not ( = ?auto_113115 ?auto_113116 ) ) ( not ( = ?auto_113115 ?auto_113117 ) ) ( not ( = ?auto_113115 ?auto_113118 ) ) ( not ( = ?auto_113116 ?auto_113117 ) ) ( not ( = ?auto_113116 ?auto_113118 ) ) ( not ( = ?auto_113117 ?auto_113118 ) ) ( CLEAR ?auto_113120 ) ( not ( = ?auto_113115 ?auto_113119 ) ) ( not ( = ?auto_113115 ?auto_113120 ) ) ( not ( = ?auto_113116 ?auto_113119 ) ) ( not ( = ?auto_113116 ?auto_113120 ) ) ( not ( = ?auto_113117 ?auto_113119 ) ) ( not ( = ?auto_113117 ?auto_113120 ) ) ( not ( = ?auto_113118 ?auto_113119 ) ) ( not ( = ?auto_113118 ?auto_113120 ) ) ( not ( = ?auto_113119 ?auto_113120 ) ) ( ON ?auto_113119 ?auto_113118 ) ( CLEAR ?auto_113119 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_113115 ?auto_113116 ?auto_113117 ?auto_113118 )
      ( MAKE-3PILE ?auto_113115 ?auto_113116 ?auto_113117 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_113121 - BLOCK
      ?auto_113122 - BLOCK
      ?auto_113123 - BLOCK
    )
    :vars
    (
      ?auto_113126 - BLOCK
      ?auto_113124 - BLOCK
      ?auto_113125 - BLOCK
      ?auto_113127 - BLOCK
      ?auto_113128 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113126 ?auto_113123 ) ( ON-TABLE ?auto_113121 ) ( ON ?auto_113122 ?auto_113121 ) ( ON ?auto_113123 ?auto_113122 ) ( not ( = ?auto_113121 ?auto_113122 ) ) ( not ( = ?auto_113121 ?auto_113123 ) ) ( not ( = ?auto_113121 ?auto_113126 ) ) ( not ( = ?auto_113122 ?auto_113123 ) ) ( not ( = ?auto_113122 ?auto_113126 ) ) ( not ( = ?auto_113123 ?auto_113126 ) ) ( not ( = ?auto_113121 ?auto_113124 ) ) ( not ( = ?auto_113121 ?auto_113125 ) ) ( not ( = ?auto_113122 ?auto_113124 ) ) ( not ( = ?auto_113122 ?auto_113125 ) ) ( not ( = ?auto_113123 ?auto_113124 ) ) ( not ( = ?auto_113123 ?auto_113125 ) ) ( not ( = ?auto_113126 ?auto_113124 ) ) ( not ( = ?auto_113126 ?auto_113125 ) ) ( not ( = ?auto_113124 ?auto_113125 ) ) ( ON ?auto_113124 ?auto_113126 ) ( CLEAR ?auto_113124 ) ( HOLDING ?auto_113125 ) ( CLEAR ?auto_113127 ) ( ON-TABLE ?auto_113128 ) ( ON ?auto_113127 ?auto_113128 ) ( not ( = ?auto_113128 ?auto_113127 ) ) ( not ( = ?auto_113128 ?auto_113125 ) ) ( not ( = ?auto_113127 ?auto_113125 ) ) ( not ( = ?auto_113121 ?auto_113127 ) ) ( not ( = ?auto_113121 ?auto_113128 ) ) ( not ( = ?auto_113122 ?auto_113127 ) ) ( not ( = ?auto_113122 ?auto_113128 ) ) ( not ( = ?auto_113123 ?auto_113127 ) ) ( not ( = ?auto_113123 ?auto_113128 ) ) ( not ( = ?auto_113126 ?auto_113127 ) ) ( not ( = ?auto_113126 ?auto_113128 ) ) ( not ( = ?auto_113124 ?auto_113127 ) ) ( not ( = ?auto_113124 ?auto_113128 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_113128 ?auto_113127 ?auto_113125 )
      ( MAKE-3PILE ?auto_113121 ?auto_113122 ?auto_113123 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_113129 - BLOCK
      ?auto_113130 - BLOCK
      ?auto_113131 - BLOCK
    )
    :vars
    (
      ?auto_113133 - BLOCK
      ?auto_113136 - BLOCK
      ?auto_113132 - BLOCK
      ?auto_113135 - BLOCK
      ?auto_113134 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113133 ?auto_113131 ) ( ON-TABLE ?auto_113129 ) ( ON ?auto_113130 ?auto_113129 ) ( ON ?auto_113131 ?auto_113130 ) ( not ( = ?auto_113129 ?auto_113130 ) ) ( not ( = ?auto_113129 ?auto_113131 ) ) ( not ( = ?auto_113129 ?auto_113133 ) ) ( not ( = ?auto_113130 ?auto_113131 ) ) ( not ( = ?auto_113130 ?auto_113133 ) ) ( not ( = ?auto_113131 ?auto_113133 ) ) ( not ( = ?auto_113129 ?auto_113136 ) ) ( not ( = ?auto_113129 ?auto_113132 ) ) ( not ( = ?auto_113130 ?auto_113136 ) ) ( not ( = ?auto_113130 ?auto_113132 ) ) ( not ( = ?auto_113131 ?auto_113136 ) ) ( not ( = ?auto_113131 ?auto_113132 ) ) ( not ( = ?auto_113133 ?auto_113136 ) ) ( not ( = ?auto_113133 ?auto_113132 ) ) ( not ( = ?auto_113136 ?auto_113132 ) ) ( ON ?auto_113136 ?auto_113133 ) ( CLEAR ?auto_113135 ) ( ON-TABLE ?auto_113134 ) ( ON ?auto_113135 ?auto_113134 ) ( not ( = ?auto_113134 ?auto_113135 ) ) ( not ( = ?auto_113134 ?auto_113132 ) ) ( not ( = ?auto_113135 ?auto_113132 ) ) ( not ( = ?auto_113129 ?auto_113135 ) ) ( not ( = ?auto_113129 ?auto_113134 ) ) ( not ( = ?auto_113130 ?auto_113135 ) ) ( not ( = ?auto_113130 ?auto_113134 ) ) ( not ( = ?auto_113131 ?auto_113135 ) ) ( not ( = ?auto_113131 ?auto_113134 ) ) ( not ( = ?auto_113133 ?auto_113135 ) ) ( not ( = ?auto_113133 ?auto_113134 ) ) ( not ( = ?auto_113136 ?auto_113135 ) ) ( not ( = ?auto_113136 ?auto_113134 ) ) ( ON ?auto_113132 ?auto_113136 ) ( CLEAR ?auto_113132 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_113129 ?auto_113130 ?auto_113131 ?auto_113133 ?auto_113136 )
      ( MAKE-3PILE ?auto_113129 ?auto_113130 ?auto_113131 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_113137 - BLOCK
      ?auto_113138 - BLOCK
      ?auto_113139 - BLOCK
    )
    :vars
    (
      ?auto_113141 - BLOCK
      ?auto_113142 - BLOCK
      ?auto_113144 - BLOCK
      ?auto_113140 - BLOCK
      ?auto_113143 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113141 ?auto_113139 ) ( ON-TABLE ?auto_113137 ) ( ON ?auto_113138 ?auto_113137 ) ( ON ?auto_113139 ?auto_113138 ) ( not ( = ?auto_113137 ?auto_113138 ) ) ( not ( = ?auto_113137 ?auto_113139 ) ) ( not ( = ?auto_113137 ?auto_113141 ) ) ( not ( = ?auto_113138 ?auto_113139 ) ) ( not ( = ?auto_113138 ?auto_113141 ) ) ( not ( = ?auto_113139 ?auto_113141 ) ) ( not ( = ?auto_113137 ?auto_113142 ) ) ( not ( = ?auto_113137 ?auto_113144 ) ) ( not ( = ?auto_113138 ?auto_113142 ) ) ( not ( = ?auto_113138 ?auto_113144 ) ) ( not ( = ?auto_113139 ?auto_113142 ) ) ( not ( = ?auto_113139 ?auto_113144 ) ) ( not ( = ?auto_113141 ?auto_113142 ) ) ( not ( = ?auto_113141 ?auto_113144 ) ) ( not ( = ?auto_113142 ?auto_113144 ) ) ( ON ?auto_113142 ?auto_113141 ) ( ON-TABLE ?auto_113140 ) ( not ( = ?auto_113140 ?auto_113143 ) ) ( not ( = ?auto_113140 ?auto_113144 ) ) ( not ( = ?auto_113143 ?auto_113144 ) ) ( not ( = ?auto_113137 ?auto_113143 ) ) ( not ( = ?auto_113137 ?auto_113140 ) ) ( not ( = ?auto_113138 ?auto_113143 ) ) ( not ( = ?auto_113138 ?auto_113140 ) ) ( not ( = ?auto_113139 ?auto_113143 ) ) ( not ( = ?auto_113139 ?auto_113140 ) ) ( not ( = ?auto_113141 ?auto_113143 ) ) ( not ( = ?auto_113141 ?auto_113140 ) ) ( not ( = ?auto_113142 ?auto_113143 ) ) ( not ( = ?auto_113142 ?auto_113140 ) ) ( ON ?auto_113144 ?auto_113142 ) ( CLEAR ?auto_113144 ) ( HOLDING ?auto_113143 ) ( CLEAR ?auto_113140 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_113140 ?auto_113143 )
      ( MAKE-3PILE ?auto_113137 ?auto_113138 ?auto_113139 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_113145 - BLOCK
      ?auto_113146 - BLOCK
      ?auto_113147 - BLOCK
    )
    :vars
    (
      ?auto_113149 - BLOCK
      ?auto_113150 - BLOCK
      ?auto_113151 - BLOCK
      ?auto_113148 - BLOCK
      ?auto_113152 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113149 ?auto_113147 ) ( ON-TABLE ?auto_113145 ) ( ON ?auto_113146 ?auto_113145 ) ( ON ?auto_113147 ?auto_113146 ) ( not ( = ?auto_113145 ?auto_113146 ) ) ( not ( = ?auto_113145 ?auto_113147 ) ) ( not ( = ?auto_113145 ?auto_113149 ) ) ( not ( = ?auto_113146 ?auto_113147 ) ) ( not ( = ?auto_113146 ?auto_113149 ) ) ( not ( = ?auto_113147 ?auto_113149 ) ) ( not ( = ?auto_113145 ?auto_113150 ) ) ( not ( = ?auto_113145 ?auto_113151 ) ) ( not ( = ?auto_113146 ?auto_113150 ) ) ( not ( = ?auto_113146 ?auto_113151 ) ) ( not ( = ?auto_113147 ?auto_113150 ) ) ( not ( = ?auto_113147 ?auto_113151 ) ) ( not ( = ?auto_113149 ?auto_113150 ) ) ( not ( = ?auto_113149 ?auto_113151 ) ) ( not ( = ?auto_113150 ?auto_113151 ) ) ( ON ?auto_113150 ?auto_113149 ) ( ON-TABLE ?auto_113148 ) ( not ( = ?auto_113148 ?auto_113152 ) ) ( not ( = ?auto_113148 ?auto_113151 ) ) ( not ( = ?auto_113152 ?auto_113151 ) ) ( not ( = ?auto_113145 ?auto_113152 ) ) ( not ( = ?auto_113145 ?auto_113148 ) ) ( not ( = ?auto_113146 ?auto_113152 ) ) ( not ( = ?auto_113146 ?auto_113148 ) ) ( not ( = ?auto_113147 ?auto_113152 ) ) ( not ( = ?auto_113147 ?auto_113148 ) ) ( not ( = ?auto_113149 ?auto_113152 ) ) ( not ( = ?auto_113149 ?auto_113148 ) ) ( not ( = ?auto_113150 ?auto_113152 ) ) ( not ( = ?auto_113150 ?auto_113148 ) ) ( ON ?auto_113151 ?auto_113150 ) ( CLEAR ?auto_113148 ) ( ON ?auto_113152 ?auto_113151 ) ( CLEAR ?auto_113152 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_113145 ?auto_113146 ?auto_113147 ?auto_113149 ?auto_113150 ?auto_113151 )
      ( MAKE-3PILE ?auto_113145 ?auto_113146 ?auto_113147 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_113153 - BLOCK
      ?auto_113154 - BLOCK
      ?auto_113155 - BLOCK
    )
    :vars
    (
      ?auto_113159 - BLOCK
      ?auto_113158 - BLOCK
      ?auto_113156 - BLOCK
      ?auto_113160 - BLOCK
      ?auto_113157 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113159 ?auto_113155 ) ( ON-TABLE ?auto_113153 ) ( ON ?auto_113154 ?auto_113153 ) ( ON ?auto_113155 ?auto_113154 ) ( not ( = ?auto_113153 ?auto_113154 ) ) ( not ( = ?auto_113153 ?auto_113155 ) ) ( not ( = ?auto_113153 ?auto_113159 ) ) ( not ( = ?auto_113154 ?auto_113155 ) ) ( not ( = ?auto_113154 ?auto_113159 ) ) ( not ( = ?auto_113155 ?auto_113159 ) ) ( not ( = ?auto_113153 ?auto_113158 ) ) ( not ( = ?auto_113153 ?auto_113156 ) ) ( not ( = ?auto_113154 ?auto_113158 ) ) ( not ( = ?auto_113154 ?auto_113156 ) ) ( not ( = ?auto_113155 ?auto_113158 ) ) ( not ( = ?auto_113155 ?auto_113156 ) ) ( not ( = ?auto_113159 ?auto_113158 ) ) ( not ( = ?auto_113159 ?auto_113156 ) ) ( not ( = ?auto_113158 ?auto_113156 ) ) ( ON ?auto_113158 ?auto_113159 ) ( not ( = ?auto_113160 ?auto_113157 ) ) ( not ( = ?auto_113160 ?auto_113156 ) ) ( not ( = ?auto_113157 ?auto_113156 ) ) ( not ( = ?auto_113153 ?auto_113157 ) ) ( not ( = ?auto_113153 ?auto_113160 ) ) ( not ( = ?auto_113154 ?auto_113157 ) ) ( not ( = ?auto_113154 ?auto_113160 ) ) ( not ( = ?auto_113155 ?auto_113157 ) ) ( not ( = ?auto_113155 ?auto_113160 ) ) ( not ( = ?auto_113159 ?auto_113157 ) ) ( not ( = ?auto_113159 ?auto_113160 ) ) ( not ( = ?auto_113158 ?auto_113157 ) ) ( not ( = ?auto_113158 ?auto_113160 ) ) ( ON ?auto_113156 ?auto_113158 ) ( ON ?auto_113157 ?auto_113156 ) ( CLEAR ?auto_113157 ) ( HOLDING ?auto_113160 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_113160 )
      ( MAKE-3PILE ?auto_113153 ?auto_113154 ?auto_113155 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_113161 - BLOCK
      ?auto_113162 - BLOCK
      ?auto_113163 - BLOCK
    )
    :vars
    (
      ?auto_113165 - BLOCK
      ?auto_113168 - BLOCK
      ?auto_113164 - BLOCK
      ?auto_113167 - BLOCK
      ?auto_113166 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113165 ?auto_113163 ) ( ON-TABLE ?auto_113161 ) ( ON ?auto_113162 ?auto_113161 ) ( ON ?auto_113163 ?auto_113162 ) ( not ( = ?auto_113161 ?auto_113162 ) ) ( not ( = ?auto_113161 ?auto_113163 ) ) ( not ( = ?auto_113161 ?auto_113165 ) ) ( not ( = ?auto_113162 ?auto_113163 ) ) ( not ( = ?auto_113162 ?auto_113165 ) ) ( not ( = ?auto_113163 ?auto_113165 ) ) ( not ( = ?auto_113161 ?auto_113168 ) ) ( not ( = ?auto_113161 ?auto_113164 ) ) ( not ( = ?auto_113162 ?auto_113168 ) ) ( not ( = ?auto_113162 ?auto_113164 ) ) ( not ( = ?auto_113163 ?auto_113168 ) ) ( not ( = ?auto_113163 ?auto_113164 ) ) ( not ( = ?auto_113165 ?auto_113168 ) ) ( not ( = ?auto_113165 ?auto_113164 ) ) ( not ( = ?auto_113168 ?auto_113164 ) ) ( ON ?auto_113168 ?auto_113165 ) ( not ( = ?auto_113167 ?auto_113166 ) ) ( not ( = ?auto_113167 ?auto_113164 ) ) ( not ( = ?auto_113166 ?auto_113164 ) ) ( not ( = ?auto_113161 ?auto_113166 ) ) ( not ( = ?auto_113161 ?auto_113167 ) ) ( not ( = ?auto_113162 ?auto_113166 ) ) ( not ( = ?auto_113162 ?auto_113167 ) ) ( not ( = ?auto_113163 ?auto_113166 ) ) ( not ( = ?auto_113163 ?auto_113167 ) ) ( not ( = ?auto_113165 ?auto_113166 ) ) ( not ( = ?auto_113165 ?auto_113167 ) ) ( not ( = ?auto_113168 ?auto_113166 ) ) ( not ( = ?auto_113168 ?auto_113167 ) ) ( ON ?auto_113164 ?auto_113168 ) ( ON ?auto_113166 ?auto_113164 ) ( ON ?auto_113167 ?auto_113166 ) ( CLEAR ?auto_113167 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_113161 ?auto_113162 ?auto_113163 ?auto_113165 ?auto_113168 ?auto_113164 ?auto_113166 )
      ( MAKE-3PILE ?auto_113161 ?auto_113162 ?auto_113163 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_113174 - BLOCK
      ?auto_113175 - BLOCK
      ?auto_113176 - BLOCK
      ?auto_113177 - BLOCK
      ?auto_113178 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_113178 ) ( CLEAR ?auto_113177 ) ( ON-TABLE ?auto_113174 ) ( ON ?auto_113175 ?auto_113174 ) ( ON ?auto_113176 ?auto_113175 ) ( ON ?auto_113177 ?auto_113176 ) ( not ( = ?auto_113174 ?auto_113175 ) ) ( not ( = ?auto_113174 ?auto_113176 ) ) ( not ( = ?auto_113174 ?auto_113177 ) ) ( not ( = ?auto_113174 ?auto_113178 ) ) ( not ( = ?auto_113175 ?auto_113176 ) ) ( not ( = ?auto_113175 ?auto_113177 ) ) ( not ( = ?auto_113175 ?auto_113178 ) ) ( not ( = ?auto_113176 ?auto_113177 ) ) ( not ( = ?auto_113176 ?auto_113178 ) ) ( not ( = ?auto_113177 ?auto_113178 ) ) )
    :subtasks
    ( ( !STACK ?auto_113178 ?auto_113177 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_113179 - BLOCK
      ?auto_113180 - BLOCK
      ?auto_113181 - BLOCK
      ?auto_113182 - BLOCK
      ?auto_113183 - BLOCK
    )
    :vars
    (
      ?auto_113184 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_113182 ) ( ON-TABLE ?auto_113179 ) ( ON ?auto_113180 ?auto_113179 ) ( ON ?auto_113181 ?auto_113180 ) ( ON ?auto_113182 ?auto_113181 ) ( not ( = ?auto_113179 ?auto_113180 ) ) ( not ( = ?auto_113179 ?auto_113181 ) ) ( not ( = ?auto_113179 ?auto_113182 ) ) ( not ( = ?auto_113179 ?auto_113183 ) ) ( not ( = ?auto_113180 ?auto_113181 ) ) ( not ( = ?auto_113180 ?auto_113182 ) ) ( not ( = ?auto_113180 ?auto_113183 ) ) ( not ( = ?auto_113181 ?auto_113182 ) ) ( not ( = ?auto_113181 ?auto_113183 ) ) ( not ( = ?auto_113182 ?auto_113183 ) ) ( ON ?auto_113183 ?auto_113184 ) ( CLEAR ?auto_113183 ) ( HAND-EMPTY ) ( not ( = ?auto_113179 ?auto_113184 ) ) ( not ( = ?auto_113180 ?auto_113184 ) ) ( not ( = ?auto_113181 ?auto_113184 ) ) ( not ( = ?auto_113182 ?auto_113184 ) ) ( not ( = ?auto_113183 ?auto_113184 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_113183 ?auto_113184 )
      ( MAKE-5PILE ?auto_113179 ?auto_113180 ?auto_113181 ?auto_113182 ?auto_113183 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_113185 - BLOCK
      ?auto_113186 - BLOCK
      ?auto_113187 - BLOCK
      ?auto_113188 - BLOCK
      ?auto_113189 - BLOCK
    )
    :vars
    (
      ?auto_113190 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_113185 ) ( ON ?auto_113186 ?auto_113185 ) ( ON ?auto_113187 ?auto_113186 ) ( not ( = ?auto_113185 ?auto_113186 ) ) ( not ( = ?auto_113185 ?auto_113187 ) ) ( not ( = ?auto_113185 ?auto_113188 ) ) ( not ( = ?auto_113185 ?auto_113189 ) ) ( not ( = ?auto_113186 ?auto_113187 ) ) ( not ( = ?auto_113186 ?auto_113188 ) ) ( not ( = ?auto_113186 ?auto_113189 ) ) ( not ( = ?auto_113187 ?auto_113188 ) ) ( not ( = ?auto_113187 ?auto_113189 ) ) ( not ( = ?auto_113188 ?auto_113189 ) ) ( ON ?auto_113189 ?auto_113190 ) ( CLEAR ?auto_113189 ) ( not ( = ?auto_113185 ?auto_113190 ) ) ( not ( = ?auto_113186 ?auto_113190 ) ) ( not ( = ?auto_113187 ?auto_113190 ) ) ( not ( = ?auto_113188 ?auto_113190 ) ) ( not ( = ?auto_113189 ?auto_113190 ) ) ( HOLDING ?auto_113188 ) ( CLEAR ?auto_113187 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_113185 ?auto_113186 ?auto_113187 ?auto_113188 )
      ( MAKE-5PILE ?auto_113185 ?auto_113186 ?auto_113187 ?auto_113188 ?auto_113189 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_113191 - BLOCK
      ?auto_113192 - BLOCK
      ?auto_113193 - BLOCK
      ?auto_113194 - BLOCK
      ?auto_113195 - BLOCK
    )
    :vars
    (
      ?auto_113196 - BLOCK
      ?auto_113197 - BLOCK
      ?auto_113198 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_113191 ) ( ON ?auto_113192 ?auto_113191 ) ( ON ?auto_113193 ?auto_113192 ) ( not ( = ?auto_113191 ?auto_113192 ) ) ( not ( = ?auto_113191 ?auto_113193 ) ) ( not ( = ?auto_113191 ?auto_113194 ) ) ( not ( = ?auto_113191 ?auto_113195 ) ) ( not ( = ?auto_113192 ?auto_113193 ) ) ( not ( = ?auto_113192 ?auto_113194 ) ) ( not ( = ?auto_113192 ?auto_113195 ) ) ( not ( = ?auto_113193 ?auto_113194 ) ) ( not ( = ?auto_113193 ?auto_113195 ) ) ( not ( = ?auto_113194 ?auto_113195 ) ) ( ON ?auto_113195 ?auto_113196 ) ( not ( = ?auto_113191 ?auto_113196 ) ) ( not ( = ?auto_113192 ?auto_113196 ) ) ( not ( = ?auto_113193 ?auto_113196 ) ) ( not ( = ?auto_113194 ?auto_113196 ) ) ( not ( = ?auto_113195 ?auto_113196 ) ) ( CLEAR ?auto_113193 ) ( ON ?auto_113194 ?auto_113195 ) ( CLEAR ?auto_113194 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_113197 ) ( ON ?auto_113198 ?auto_113197 ) ( ON ?auto_113196 ?auto_113198 ) ( not ( = ?auto_113197 ?auto_113198 ) ) ( not ( = ?auto_113197 ?auto_113196 ) ) ( not ( = ?auto_113197 ?auto_113195 ) ) ( not ( = ?auto_113197 ?auto_113194 ) ) ( not ( = ?auto_113198 ?auto_113196 ) ) ( not ( = ?auto_113198 ?auto_113195 ) ) ( not ( = ?auto_113198 ?auto_113194 ) ) ( not ( = ?auto_113191 ?auto_113197 ) ) ( not ( = ?auto_113191 ?auto_113198 ) ) ( not ( = ?auto_113192 ?auto_113197 ) ) ( not ( = ?auto_113192 ?auto_113198 ) ) ( not ( = ?auto_113193 ?auto_113197 ) ) ( not ( = ?auto_113193 ?auto_113198 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_113197 ?auto_113198 ?auto_113196 ?auto_113195 )
      ( MAKE-5PILE ?auto_113191 ?auto_113192 ?auto_113193 ?auto_113194 ?auto_113195 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_113199 - BLOCK
      ?auto_113200 - BLOCK
      ?auto_113201 - BLOCK
      ?auto_113202 - BLOCK
      ?auto_113203 - BLOCK
    )
    :vars
    (
      ?auto_113204 - BLOCK
      ?auto_113206 - BLOCK
      ?auto_113205 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_113199 ) ( ON ?auto_113200 ?auto_113199 ) ( not ( = ?auto_113199 ?auto_113200 ) ) ( not ( = ?auto_113199 ?auto_113201 ) ) ( not ( = ?auto_113199 ?auto_113202 ) ) ( not ( = ?auto_113199 ?auto_113203 ) ) ( not ( = ?auto_113200 ?auto_113201 ) ) ( not ( = ?auto_113200 ?auto_113202 ) ) ( not ( = ?auto_113200 ?auto_113203 ) ) ( not ( = ?auto_113201 ?auto_113202 ) ) ( not ( = ?auto_113201 ?auto_113203 ) ) ( not ( = ?auto_113202 ?auto_113203 ) ) ( ON ?auto_113203 ?auto_113204 ) ( not ( = ?auto_113199 ?auto_113204 ) ) ( not ( = ?auto_113200 ?auto_113204 ) ) ( not ( = ?auto_113201 ?auto_113204 ) ) ( not ( = ?auto_113202 ?auto_113204 ) ) ( not ( = ?auto_113203 ?auto_113204 ) ) ( ON ?auto_113202 ?auto_113203 ) ( CLEAR ?auto_113202 ) ( ON-TABLE ?auto_113206 ) ( ON ?auto_113205 ?auto_113206 ) ( ON ?auto_113204 ?auto_113205 ) ( not ( = ?auto_113206 ?auto_113205 ) ) ( not ( = ?auto_113206 ?auto_113204 ) ) ( not ( = ?auto_113206 ?auto_113203 ) ) ( not ( = ?auto_113206 ?auto_113202 ) ) ( not ( = ?auto_113205 ?auto_113204 ) ) ( not ( = ?auto_113205 ?auto_113203 ) ) ( not ( = ?auto_113205 ?auto_113202 ) ) ( not ( = ?auto_113199 ?auto_113206 ) ) ( not ( = ?auto_113199 ?auto_113205 ) ) ( not ( = ?auto_113200 ?auto_113206 ) ) ( not ( = ?auto_113200 ?auto_113205 ) ) ( not ( = ?auto_113201 ?auto_113206 ) ) ( not ( = ?auto_113201 ?auto_113205 ) ) ( HOLDING ?auto_113201 ) ( CLEAR ?auto_113200 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_113199 ?auto_113200 ?auto_113201 )
      ( MAKE-5PILE ?auto_113199 ?auto_113200 ?auto_113201 ?auto_113202 ?auto_113203 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_113207 - BLOCK
      ?auto_113208 - BLOCK
      ?auto_113209 - BLOCK
      ?auto_113210 - BLOCK
      ?auto_113211 - BLOCK
    )
    :vars
    (
      ?auto_113213 - BLOCK
      ?auto_113214 - BLOCK
      ?auto_113212 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_113207 ) ( ON ?auto_113208 ?auto_113207 ) ( not ( = ?auto_113207 ?auto_113208 ) ) ( not ( = ?auto_113207 ?auto_113209 ) ) ( not ( = ?auto_113207 ?auto_113210 ) ) ( not ( = ?auto_113207 ?auto_113211 ) ) ( not ( = ?auto_113208 ?auto_113209 ) ) ( not ( = ?auto_113208 ?auto_113210 ) ) ( not ( = ?auto_113208 ?auto_113211 ) ) ( not ( = ?auto_113209 ?auto_113210 ) ) ( not ( = ?auto_113209 ?auto_113211 ) ) ( not ( = ?auto_113210 ?auto_113211 ) ) ( ON ?auto_113211 ?auto_113213 ) ( not ( = ?auto_113207 ?auto_113213 ) ) ( not ( = ?auto_113208 ?auto_113213 ) ) ( not ( = ?auto_113209 ?auto_113213 ) ) ( not ( = ?auto_113210 ?auto_113213 ) ) ( not ( = ?auto_113211 ?auto_113213 ) ) ( ON ?auto_113210 ?auto_113211 ) ( ON-TABLE ?auto_113214 ) ( ON ?auto_113212 ?auto_113214 ) ( ON ?auto_113213 ?auto_113212 ) ( not ( = ?auto_113214 ?auto_113212 ) ) ( not ( = ?auto_113214 ?auto_113213 ) ) ( not ( = ?auto_113214 ?auto_113211 ) ) ( not ( = ?auto_113214 ?auto_113210 ) ) ( not ( = ?auto_113212 ?auto_113213 ) ) ( not ( = ?auto_113212 ?auto_113211 ) ) ( not ( = ?auto_113212 ?auto_113210 ) ) ( not ( = ?auto_113207 ?auto_113214 ) ) ( not ( = ?auto_113207 ?auto_113212 ) ) ( not ( = ?auto_113208 ?auto_113214 ) ) ( not ( = ?auto_113208 ?auto_113212 ) ) ( not ( = ?auto_113209 ?auto_113214 ) ) ( not ( = ?auto_113209 ?auto_113212 ) ) ( CLEAR ?auto_113208 ) ( ON ?auto_113209 ?auto_113210 ) ( CLEAR ?auto_113209 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_113214 ?auto_113212 ?auto_113213 ?auto_113211 ?auto_113210 )
      ( MAKE-5PILE ?auto_113207 ?auto_113208 ?auto_113209 ?auto_113210 ?auto_113211 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_113215 - BLOCK
      ?auto_113216 - BLOCK
      ?auto_113217 - BLOCK
      ?auto_113218 - BLOCK
      ?auto_113219 - BLOCK
    )
    :vars
    (
      ?auto_113222 - BLOCK
      ?auto_113220 - BLOCK
      ?auto_113221 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_113215 ) ( not ( = ?auto_113215 ?auto_113216 ) ) ( not ( = ?auto_113215 ?auto_113217 ) ) ( not ( = ?auto_113215 ?auto_113218 ) ) ( not ( = ?auto_113215 ?auto_113219 ) ) ( not ( = ?auto_113216 ?auto_113217 ) ) ( not ( = ?auto_113216 ?auto_113218 ) ) ( not ( = ?auto_113216 ?auto_113219 ) ) ( not ( = ?auto_113217 ?auto_113218 ) ) ( not ( = ?auto_113217 ?auto_113219 ) ) ( not ( = ?auto_113218 ?auto_113219 ) ) ( ON ?auto_113219 ?auto_113222 ) ( not ( = ?auto_113215 ?auto_113222 ) ) ( not ( = ?auto_113216 ?auto_113222 ) ) ( not ( = ?auto_113217 ?auto_113222 ) ) ( not ( = ?auto_113218 ?auto_113222 ) ) ( not ( = ?auto_113219 ?auto_113222 ) ) ( ON ?auto_113218 ?auto_113219 ) ( ON-TABLE ?auto_113220 ) ( ON ?auto_113221 ?auto_113220 ) ( ON ?auto_113222 ?auto_113221 ) ( not ( = ?auto_113220 ?auto_113221 ) ) ( not ( = ?auto_113220 ?auto_113222 ) ) ( not ( = ?auto_113220 ?auto_113219 ) ) ( not ( = ?auto_113220 ?auto_113218 ) ) ( not ( = ?auto_113221 ?auto_113222 ) ) ( not ( = ?auto_113221 ?auto_113219 ) ) ( not ( = ?auto_113221 ?auto_113218 ) ) ( not ( = ?auto_113215 ?auto_113220 ) ) ( not ( = ?auto_113215 ?auto_113221 ) ) ( not ( = ?auto_113216 ?auto_113220 ) ) ( not ( = ?auto_113216 ?auto_113221 ) ) ( not ( = ?auto_113217 ?auto_113220 ) ) ( not ( = ?auto_113217 ?auto_113221 ) ) ( ON ?auto_113217 ?auto_113218 ) ( CLEAR ?auto_113217 ) ( HOLDING ?auto_113216 ) ( CLEAR ?auto_113215 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_113215 ?auto_113216 )
      ( MAKE-5PILE ?auto_113215 ?auto_113216 ?auto_113217 ?auto_113218 ?auto_113219 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_113223 - BLOCK
      ?auto_113224 - BLOCK
      ?auto_113225 - BLOCK
      ?auto_113226 - BLOCK
      ?auto_113227 - BLOCK
    )
    :vars
    (
      ?auto_113230 - BLOCK
      ?auto_113229 - BLOCK
      ?auto_113228 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_113223 ) ( not ( = ?auto_113223 ?auto_113224 ) ) ( not ( = ?auto_113223 ?auto_113225 ) ) ( not ( = ?auto_113223 ?auto_113226 ) ) ( not ( = ?auto_113223 ?auto_113227 ) ) ( not ( = ?auto_113224 ?auto_113225 ) ) ( not ( = ?auto_113224 ?auto_113226 ) ) ( not ( = ?auto_113224 ?auto_113227 ) ) ( not ( = ?auto_113225 ?auto_113226 ) ) ( not ( = ?auto_113225 ?auto_113227 ) ) ( not ( = ?auto_113226 ?auto_113227 ) ) ( ON ?auto_113227 ?auto_113230 ) ( not ( = ?auto_113223 ?auto_113230 ) ) ( not ( = ?auto_113224 ?auto_113230 ) ) ( not ( = ?auto_113225 ?auto_113230 ) ) ( not ( = ?auto_113226 ?auto_113230 ) ) ( not ( = ?auto_113227 ?auto_113230 ) ) ( ON ?auto_113226 ?auto_113227 ) ( ON-TABLE ?auto_113229 ) ( ON ?auto_113228 ?auto_113229 ) ( ON ?auto_113230 ?auto_113228 ) ( not ( = ?auto_113229 ?auto_113228 ) ) ( not ( = ?auto_113229 ?auto_113230 ) ) ( not ( = ?auto_113229 ?auto_113227 ) ) ( not ( = ?auto_113229 ?auto_113226 ) ) ( not ( = ?auto_113228 ?auto_113230 ) ) ( not ( = ?auto_113228 ?auto_113227 ) ) ( not ( = ?auto_113228 ?auto_113226 ) ) ( not ( = ?auto_113223 ?auto_113229 ) ) ( not ( = ?auto_113223 ?auto_113228 ) ) ( not ( = ?auto_113224 ?auto_113229 ) ) ( not ( = ?auto_113224 ?auto_113228 ) ) ( not ( = ?auto_113225 ?auto_113229 ) ) ( not ( = ?auto_113225 ?auto_113228 ) ) ( ON ?auto_113225 ?auto_113226 ) ( CLEAR ?auto_113223 ) ( ON ?auto_113224 ?auto_113225 ) ( CLEAR ?auto_113224 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_113229 ?auto_113228 ?auto_113230 ?auto_113227 ?auto_113226 ?auto_113225 )
      ( MAKE-5PILE ?auto_113223 ?auto_113224 ?auto_113225 ?auto_113226 ?auto_113227 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_113231 - BLOCK
      ?auto_113232 - BLOCK
      ?auto_113233 - BLOCK
      ?auto_113234 - BLOCK
      ?auto_113235 - BLOCK
    )
    :vars
    (
      ?auto_113238 - BLOCK
      ?auto_113236 - BLOCK
      ?auto_113237 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_113231 ?auto_113232 ) ) ( not ( = ?auto_113231 ?auto_113233 ) ) ( not ( = ?auto_113231 ?auto_113234 ) ) ( not ( = ?auto_113231 ?auto_113235 ) ) ( not ( = ?auto_113232 ?auto_113233 ) ) ( not ( = ?auto_113232 ?auto_113234 ) ) ( not ( = ?auto_113232 ?auto_113235 ) ) ( not ( = ?auto_113233 ?auto_113234 ) ) ( not ( = ?auto_113233 ?auto_113235 ) ) ( not ( = ?auto_113234 ?auto_113235 ) ) ( ON ?auto_113235 ?auto_113238 ) ( not ( = ?auto_113231 ?auto_113238 ) ) ( not ( = ?auto_113232 ?auto_113238 ) ) ( not ( = ?auto_113233 ?auto_113238 ) ) ( not ( = ?auto_113234 ?auto_113238 ) ) ( not ( = ?auto_113235 ?auto_113238 ) ) ( ON ?auto_113234 ?auto_113235 ) ( ON-TABLE ?auto_113236 ) ( ON ?auto_113237 ?auto_113236 ) ( ON ?auto_113238 ?auto_113237 ) ( not ( = ?auto_113236 ?auto_113237 ) ) ( not ( = ?auto_113236 ?auto_113238 ) ) ( not ( = ?auto_113236 ?auto_113235 ) ) ( not ( = ?auto_113236 ?auto_113234 ) ) ( not ( = ?auto_113237 ?auto_113238 ) ) ( not ( = ?auto_113237 ?auto_113235 ) ) ( not ( = ?auto_113237 ?auto_113234 ) ) ( not ( = ?auto_113231 ?auto_113236 ) ) ( not ( = ?auto_113231 ?auto_113237 ) ) ( not ( = ?auto_113232 ?auto_113236 ) ) ( not ( = ?auto_113232 ?auto_113237 ) ) ( not ( = ?auto_113233 ?auto_113236 ) ) ( not ( = ?auto_113233 ?auto_113237 ) ) ( ON ?auto_113233 ?auto_113234 ) ( ON ?auto_113232 ?auto_113233 ) ( CLEAR ?auto_113232 ) ( HOLDING ?auto_113231 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_113231 )
      ( MAKE-5PILE ?auto_113231 ?auto_113232 ?auto_113233 ?auto_113234 ?auto_113235 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_113239 - BLOCK
      ?auto_113240 - BLOCK
      ?auto_113241 - BLOCK
      ?auto_113242 - BLOCK
      ?auto_113243 - BLOCK
    )
    :vars
    (
      ?auto_113245 - BLOCK
      ?auto_113244 - BLOCK
      ?auto_113246 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_113239 ?auto_113240 ) ) ( not ( = ?auto_113239 ?auto_113241 ) ) ( not ( = ?auto_113239 ?auto_113242 ) ) ( not ( = ?auto_113239 ?auto_113243 ) ) ( not ( = ?auto_113240 ?auto_113241 ) ) ( not ( = ?auto_113240 ?auto_113242 ) ) ( not ( = ?auto_113240 ?auto_113243 ) ) ( not ( = ?auto_113241 ?auto_113242 ) ) ( not ( = ?auto_113241 ?auto_113243 ) ) ( not ( = ?auto_113242 ?auto_113243 ) ) ( ON ?auto_113243 ?auto_113245 ) ( not ( = ?auto_113239 ?auto_113245 ) ) ( not ( = ?auto_113240 ?auto_113245 ) ) ( not ( = ?auto_113241 ?auto_113245 ) ) ( not ( = ?auto_113242 ?auto_113245 ) ) ( not ( = ?auto_113243 ?auto_113245 ) ) ( ON ?auto_113242 ?auto_113243 ) ( ON-TABLE ?auto_113244 ) ( ON ?auto_113246 ?auto_113244 ) ( ON ?auto_113245 ?auto_113246 ) ( not ( = ?auto_113244 ?auto_113246 ) ) ( not ( = ?auto_113244 ?auto_113245 ) ) ( not ( = ?auto_113244 ?auto_113243 ) ) ( not ( = ?auto_113244 ?auto_113242 ) ) ( not ( = ?auto_113246 ?auto_113245 ) ) ( not ( = ?auto_113246 ?auto_113243 ) ) ( not ( = ?auto_113246 ?auto_113242 ) ) ( not ( = ?auto_113239 ?auto_113244 ) ) ( not ( = ?auto_113239 ?auto_113246 ) ) ( not ( = ?auto_113240 ?auto_113244 ) ) ( not ( = ?auto_113240 ?auto_113246 ) ) ( not ( = ?auto_113241 ?auto_113244 ) ) ( not ( = ?auto_113241 ?auto_113246 ) ) ( ON ?auto_113241 ?auto_113242 ) ( ON ?auto_113240 ?auto_113241 ) ( ON ?auto_113239 ?auto_113240 ) ( CLEAR ?auto_113239 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_113244 ?auto_113246 ?auto_113245 ?auto_113243 ?auto_113242 ?auto_113241 ?auto_113240 )
      ( MAKE-5PILE ?auto_113239 ?auto_113240 ?auto_113241 ?auto_113242 ?auto_113243 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_113249 - BLOCK
      ?auto_113250 - BLOCK
    )
    :vars
    (
      ?auto_113251 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113251 ?auto_113250 ) ( CLEAR ?auto_113251 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_113249 ) ( ON ?auto_113250 ?auto_113249 ) ( not ( = ?auto_113249 ?auto_113250 ) ) ( not ( = ?auto_113249 ?auto_113251 ) ) ( not ( = ?auto_113250 ?auto_113251 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_113251 ?auto_113250 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_113252 - BLOCK
      ?auto_113253 - BLOCK
    )
    :vars
    (
      ?auto_113254 - BLOCK
      ?auto_113255 - BLOCK
      ?auto_113256 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113254 ?auto_113253 ) ( CLEAR ?auto_113254 ) ( ON-TABLE ?auto_113252 ) ( ON ?auto_113253 ?auto_113252 ) ( not ( = ?auto_113252 ?auto_113253 ) ) ( not ( = ?auto_113252 ?auto_113254 ) ) ( not ( = ?auto_113253 ?auto_113254 ) ) ( HOLDING ?auto_113255 ) ( CLEAR ?auto_113256 ) ( not ( = ?auto_113252 ?auto_113255 ) ) ( not ( = ?auto_113252 ?auto_113256 ) ) ( not ( = ?auto_113253 ?auto_113255 ) ) ( not ( = ?auto_113253 ?auto_113256 ) ) ( not ( = ?auto_113254 ?auto_113255 ) ) ( not ( = ?auto_113254 ?auto_113256 ) ) ( not ( = ?auto_113255 ?auto_113256 ) ) )
    :subtasks
    ( ( !STACK ?auto_113255 ?auto_113256 )
      ( MAKE-2PILE ?auto_113252 ?auto_113253 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_113257 - BLOCK
      ?auto_113258 - BLOCK
    )
    :vars
    (
      ?auto_113259 - BLOCK
      ?auto_113261 - BLOCK
      ?auto_113260 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113259 ?auto_113258 ) ( ON-TABLE ?auto_113257 ) ( ON ?auto_113258 ?auto_113257 ) ( not ( = ?auto_113257 ?auto_113258 ) ) ( not ( = ?auto_113257 ?auto_113259 ) ) ( not ( = ?auto_113258 ?auto_113259 ) ) ( CLEAR ?auto_113261 ) ( not ( = ?auto_113257 ?auto_113260 ) ) ( not ( = ?auto_113257 ?auto_113261 ) ) ( not ( = ?auto_113258 ?auto_113260 ) ) ( not ( = ?auto_113258 ?auto_113261 ) ) ( not ( = ?auto_113259 ?auto_113260 ) ) ( not ( = ?auto_113259 ?auto_113261 ) ) ( not ( = ?auto_113260 ?auto_113261 ) ) ( ON ?auto_113260 ?auto_113259 ) ( CLEAR ?auto_113260 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_113257 ?auto_113258 ?auto_113259 )
      ( MAKE-2PILE ?auto_113257 ?auto_113258 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_113262 - BLOCK
      ?auto_113263 - BLOCK
    )
    :vars
    (
      ?auto_113265 - BLOCK
      ?auto_113266 - BLOCK
      ?auto_113264 - BLOCK
      ?auto_113267 - BLOCK
      ?auto_113269 - BLOCK
      ?auto_113268 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113265 ?auto_113263 ) ( ON-TABLE ?auto_113262 ) ( ON ?auto_113263 ?auto_113262 ) ( not ( = ?auto_113262 ?auto_113263 ) ) ( not ( = ?auto_113262 ?auto_113265 ) ) ( not ( = ?auto_113263 ?auto_113265 ) ) ( not ( = ?auto_113262 ?auto_113266 ) ) ( not ( = ?auto_113262 ?auto_113264 ) ) ( not ( = ?auto_113263 ?auto_113266 ) ) ( not ( = ?auto_113263 ?auto_113264 ) ) ( not ( = ?auto_113265 ?auto_113266 ) ) ( not ( = ?auto_113265 ?auto_113264 ) ) ( not ( = ?auto_113266 ?auto_113264 ) ) ( ON ?auto_113266 ?auto_113265 ) ( CLEAR ?auto_113266 ) ( HOLDING ?auto_113264 ) ( CLEAR ?auto_113267 ) ( ON-TABLE ?auto_113269 ) ( ON ?auto_113268 ?auto_113269 ) ( ON ?auto_113267 ?auto_113268 ) ( not ( = ?auto_113269 ?auto_113268 ) ) ( not ( = ?auto_113269 ?auto_113267 ) ) ( not ( = ?auto_113269 ?auto_113264 ) ) ( not ( = ?auto_113268 ?auto_113267 ) ) ( not ( = ?auto_113268 ?auto_113264 ) ) ( not ( = ?auto_113267 ?auto_113264 ) ) ( not ( = ?auto_113262 ?auto_113267 ) ) ( not ( = ?auto_113262 ?auto_113269 ) ) ( not ( = ?auto_113262 ?auto_113268 ) ) ( not ( = ?auto_113263 ?auto_113267 ) ) ( not ( = ?auto_113263 ?auto_113269 ) ) ( not ( = ?auto_113263 ?auto_113268 ) ) ( not ( = ?auto_113265 ?auto_113267 ) ) ( not ( = ?auto_113265 ?auto_113269 ) ) ( not ( = ?auto_113265 ?auto_113268 ) ) ( not ( = ?auto_113266 ?auto_113267 ) ) ( not ( = ?auto_113266 ?auto_113269 ) ) ( not ( = ?auto_113266 ?auto_113268 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_113269 ?auto_113268 ?auto_113267 ?auto_113264 )
      ( MAKE-2PILE ?auto_113262 ?auto_113263 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_113270 - BLOCK
      ?auto_113271 - BLOCK
    )
    :vars
    (
      ?auto_113273 - BLOCK
      ?auto_113277 - BLOCK
      ?auto_113274 - BLOCK
      ?auto_113272 - BLOCK
      ?auto_113275 - BLOCK
      ?auto_113276 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113273 ?auto_113271 ) ( ON-TABLE ?auto_113270 ) ( ON ?auto_113271 ?auto_113270 ) ( not ( = ?auto_113270 ?auto_113271 ) ) ( not ( = ?auto_113270 ?auto_113273 ) ) ( not ( = ?auto_113271 ?auto_113273 ) ) ( not ( = ?auto_113270 ?auto_113277 ) ) ( not ( = ?auto_113270 ?auto_113274 ) ) ( not ( = ?auto_113271 ?auto_113277 ) ) ( not ( = ?auto_113271 ?auto_113274 ) ) ( not ( = ?auto_113273 ?auto_113277 ) ) ( not ( = ?auto_113273 ?auto_113274 ) ) ( not ( = ?auto_113277 ?auto_113274 ) ) ( ON ?auto_113277 ?auto_113273 ) ( CLEAR ?auto_113272 ) ( ON-TABLE ?auto_113275 ) ( ON ?auto_113276 ?auto_113275 ) ( ON ?auto_113272 ?auto_113276 ) ( not ( = ?auto_113275 ?auto_113276 ) ) ( not ( = ?auto_113275 ?auto_113272 ) ) ( not ( = ?auto_113275 ?auto_113274 ) ) ( not ( = ?auto_113276 ?auto_113272 ) ) ( not ( = ?auto_113276 ?auto_113274 ) ) ( not ( = ?auto_113272 ?auto_113274 ) ) ( not ( = ?auto_113270 ?auto_113272 ) ) ( not ( = ?auto_113270 ?auto_113275 ) ) ( not ( = ?auto_113270 ?auto_113276 ) ) ( not ( = ?auto_113271 ?auto_113272 ) ) ( not ( = ?auto_113271 ?auto_113275 ) ) ( not ( = ?auto_113271 ?auto_113276 ) ) ( not ( = ?auto_113273 ?auto_113272 ) ) ( not ( = ?auto_113273 ?auto_113275 ) ) ( not ( = ?auto_113273 ?auto_113276 ) ) ( not ( = ?auto_113277 ?auto_113272 ) ) ( not ( = ?auto_113277 ?auto_113275 ) ) ( not ( = ?auto_113277 ?auto_113276 ) ) ( ON ?auto_113274 ?auto_113277 ) ( CLEAR ?auto_113274 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_113270 ?auto_113271 ?auto_113273 ?auto_113277 )
      ( MAKE-2PILE ?auto_113270 ?auto_113271 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_113278 - BLOCK
      ?auto_113279 - BLOCK
    )
    :vars
    (
      ?auto_113283 - BLOCK
      ?auto_113280 - BLOCK
      ?auto_113281 - BLOCK
      ?auto_113284 - BLOCK
      ?auto_113285 - BLOCK
      ?auto_113282 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113283 ?auto_113279 ) ( ON-TABLE ?auto_113278 ) ( ON ?auto_113279 ?auto_113278 ) ( not ( = ?auto_113278 ?auto_113279 ) ) ( not ( = ?auto_113278 ?auto_113283 ) ) ( not ( = ?auto_113279 ?auto_113283 ) ) ( not ( = ?auto_113278 ?auto_113280 ) ) ( not ( = ?auto_113278 ?auto_113281 ) ) ( not ( = ?auto_113279 ?auto_113280 ) ) ( not ( = ?auto_113279 ?auto_113281 ) ) ( not ( = ?auto_113283 ?auto_113280 ) ) ( not ( = ?auto_113283 ?auto_113281 ) ) ( not ( = ?auto_113280 ?auto_113281 ) ) ( ON ?auto_113280 ?auto_113283 ) ( ON-TABLE ?auto_113284 ) ( ON ?auto_113285 ?auto_113284 ) ( not ( = ?auto_113284 ?auto_113285 ) ) ( not ( = ?auto_113284 ?auto_113282 ) ) ( not ( = ?auto_113284 ?auto_113281 ) ) ( not ( = ?auto_113285 ?auto_113282 ) ) ( not ( = ?auto_113285 ?auto_113281 ) ) ( not ( = ?auto_113282 ?auto_113281 ) ) ( not ( = ?auto_113278 ?auto_113282 ) ) ( not ( = ?auto_113278 ?auto_113284 ) ) ( not ( = ?auto_113278 ?auto_113285 ) ) ( not ( = ?auto_113279 ?auto_113282 ) ) ( not ( = ?auto_113279 ?auto_113284 ) ) ( not ( = ?auto_113279 ?auto_113285 ) ) ( not ( = ?auto_113283 ?auto_113282 ) ) ( not ( = ?auto_113283 ?auto_113284 ) ) ( not ( = ?auto_113283 ?auto_113285 ) ) ( not ( = ?auto_113280 ?auto_113282 ) ) ( not ( = ?auto_113280 ?auto_113284 ) ) ( not ( = ?auto_113280 ?auto_113285 ) ) ( ON ?auto_113281 ?auto_113280 ) ( CLEAR ?auto_113281 ) ( HOLDING ?auto_113282 ) ( CLEAR ?auto_113285 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_113284 ?auto_113285 ?auto_113282 )
      ( MAKE-2PILE ?auto_113278 ?auto_113279 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_113286 - BLOCK
      ?auto_113287 - BLOCK
    )
    :vars
    (
      ?auto_113288 - BLOCK
      ?auto_113291 - BLOCK
      ?auto_113293 - BLOCK
      ?auto_113292 - BLOCK
      ?auto_113289 - BLOCK
      ?auto_113290 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113288 ?auto_113287 ) ( ON-TABLE ?auto_113286 ) ( ON ?auto_113287 ?auto_113286 ) ( not ( = ?auto_113286 ?auto_113287 ) ) ( not ( = ?auto_113286 ?auto_113288 ) ) ( not ( = ?auto_113287 ?auto_113288 ) ) ( not ( = ?auto_113286 ?auto_113291 ) ) ( not ( = ?auto_113286 ?auto_113293 ) ) ( not ( = ?auto_113287 ?auto_113291 ) ) ( not ( = ?auto_113287 ?auto_113293 ) ) ( not ( = ?auto_113288 ?auto_113291 ) ) ( not ( = ?auto_113288 ?auto_113293 ) ) ( not ( = ?auto_113291 ?auto_113293 ) ) ( ON ?auto_113291 ?auto_113288 ) ( ON-TABLE ?auto_113292 ) ( ON ?auto_113289 ?auto_113292 ) ( not ( = ?auto_113292 ?auto_113289 ) ) ( not ( = ?auto_113292 ?auto_113290 ) ) ( not ( = ?auto_113292 ?auto_113293 ) ) ( not ( = ?auto_113289 ?auto_113290 ) ) ( not ( = ?auto_113289 ?auto_113293 ) ) ( not ( = ?auto_113290 ?auto_113293 ) ) ( not ( = ?auto_113286 ?auto_113290 ) ) ( not ( = ?auto_113286 ?auto_113292 ) ) ( not ( = ?auto_113286 ?auto_113289 ) ) ( not ( = ?auto_113287 ?auto_113290 ) ) ( not ( = ?auto_113287 ?auto_113292 ) ) ( not ( = ?auto_113287 ?auto_113289 ) ) ( not ( = ?auto_113288 ?auto_113290 ) ) ( not ( = ?auto_113288 ?auto_113292 ) ) ( not ( = ?auto_113288 ?auto_113289 ) ) ( not ( = ?auto_113291 ?auto_113290 ) ) ( not ( = ?auto_113291 ?auto_113292 ) ) ( not ( = ?auto_113291 ?auto_113289 ) ) ( ON ?auto_113293 ?auto_113291 ) ( CLEAR ?auto_113289 ) ( ON ?auto_113290 ?auto_113293 ) ( CLEAR ?auto_113290 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_113286 ?auto_113287 ?auto_113288 ?auto_113291 ?auto_113293 )
      ( MAKE-2PILE ?auto_113286 ?auto_113287 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_113294 - BLOCK
      ?auto_113295 - BLOCK
    )
    :vars
    (
      ?auto_113296 - BLOCK
      ?auto_113301 - BLOCK
      ?auto_113300 - BLOCK
      ?auto_113297 - BLOCK
      ?auto_113299 - BLOCK
      ?auto_113298 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113296 ?auto_113295 ) ( ON-TABLE ?auto_113294 ) ( ON ?auto_113295 ?auto_113294 ) ( not ( = ?auto_113294 ?auto_113295 ) ) ( not ( = ?auto_113294 ?auto_113296 ) ) ( not ( = ?auto_113295 ?auto_113296 ) ) ( not ( = ?auto_113294 ?auto_113301 ) ) ( not ( = ?auto_113294 ?auto_113300 ) ) ( not ( = ?auto_113295 ?auto_113301 ) ) ( not ( = ?auto_113295 ?auto_113300 ) ) ( not ( = ?auto_113296 ?auto_113301 ) ) ( not ( = ?auto_113296 ?auto_113300 ) ) ( not ( = ?auto_113301 ?auto_113300 ) ) ( ON ?auto_113301 ?auto_113296 ) ( ON-TABLE ?auto_113297 ) ( not ( = ?auto_113297 ?auto_113299 ) ) ( not ( = ?auto_113297 ?auto_113298 ) ) ( not ( = ?auto_113297 ?auto_113300 ) ) ( not ( = ?auto_113299 ?auto_113298 ) ) ( not ( = ?auto_113299 ?auto_113300 ) ) ( not ( = ?auto_113298 ?auto_113300 ) ) ( not ( = ?auto_113294 ?auto_113298 ) ) ( not ( = ?auto_113294 ?auto_113297 ) ) ( not ( = ?auto_113294 ?auto_113299 ) ) ( not ( = ?auto_113295 ?auto_113298 ) ) ( not ( = ?auto_113295 ?auto_113297 ) ) ( not ( = ?auto_113295 ?auto_113299 ) ) ( not ( = ?auto_113296 ?auto_113298 ) ) ( not ( = ?auto_113296 ?auto_113297 ) ) ( not ( = ?auto_113296 ?auto_113299 ) ) ( not ( = ?auto_113301 ?auto_113298 ) ) ( not ( = ?auto_113301 ?auto_113297 ) ) ( not ( = ?auto_113301 ?auto_113299 ) ) ( ON ?auto_113300 ?auto_113301 ) ( ON ?auto_113298 ?auto_113300 ) ( CLEAR ?auto_113298 ) ( HOLDING ?auto_113299 ) ( CLEAR ?auto_113297 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_113297 ?auto_113299 )
      ( MAKE-2PILE ?auto_113294 ?auto_113295 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_113302 - BLOCK
      ?auto_113303 - BLOCK
    )
    :vars
    (
      ?auto_113309 - BLOCK
      ?auto_113306 - BLOCK
      ?auto_113305 - BLOCK
      ?auto_113307 - BLOCK
      ?auto_113308 - BLOCK
      ?auto_113304 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113309 ?auto_113303 ) ( ON-TABLE ?auto_113302 ) ( ON ?auto_113303 ?auto_113302 ) ( not ( = ?auto_113302 ?auto_113303 ) ) ( not ( = ?auto_113302 ?auto_113309 ) ) ( not ( = ?auto_113303 ?auto_113309 ) ) ( not ( = ?auto_113302 ?auto_113306 ) ) ( not ( = ?auto_113302 ?auto_113305 ) ) ( not ( = ?auto_113303 ?auto_113306 ) ) ( not ( = ?auto_113303 ?auto_113305 ) ) ( not ( = ?auto_113309 ?auto_113306 ) ) ( not ( = ?auto_113309 ?auto_113305 ) ) ( not ( = ?auto_113306 ?auto_113305 ) ) ( ON ?auto_113306 ?auto_113309 ) ( ON-TABLE ?auto_113307 ) ( not ( = ?auto_113307 ?auto_113308 ) ) ( not ( = ?auto_113307 ?auto_113304 ) ) ( not ( = ?auto_113307 ?auto_113305 ) ) ( not ( = ?auto_113308 ?auto_113304 ) ) ( not ( = ?auto_113308 ?auto_113305 ) ) ( not ( = ?auto_113304 ?auto_113305 ) ) ( not ( = ?auto_113302 ?auto_113304 ) ) ( not ( = ?auto_113302 ?auto_113307 ) ) ( not ( = ?auto_113302 ?auto_113308 ) ) ( not ( = ?auto_113303 ?auto_113304 ) ) ( not ( = ?auto_113303 ?auto_113307 ) ) ( not ( = ?auto_113303 ?auto_113308 ) ) ( not ( = ?auto_113309 ?auto_113304 ) ) ( not ( = ?auto_113309 ?auto_113307 ) ) ( not ( = ?auto_113309 ?auto_113308 ) ) ( not ( = ?auto_113306 ?auto_113304 ) ) ( not ( = ?auto_113306 ?auto_113307 ) ) ( not ( = ?auto_113306 ?auto_113308 ) ) ( ON ?auto_113305 ?auto_113306 ) ( ON ?auto_113304 ?auto_113305 ) ( CLEAR ?auto_113307 ) ( ON ?auto_113308 ?auto_113304 ) ( CLEAR ?auto_113308 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_113302 ?auto_113303 ?auto_113309 ?auto_113306 ?auto_113305 ?auto_113304 )
      ( MAKE-2PILE ?auto_113302 ?auto_113303 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_113310 - BLOCK
      ?auto_113311 - BLOCK
    )
    :vars
    (
      ?auto_113314 - BLOCK
      ?auto_113317 - BLOCK
      ?auto_113313 - BLOCK
      ?auto_113316 - BLOCK
      ?auto_113315 - BLOCK
      ?auto_113312 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113314 ?auto_113311 ) ( ON-TABLE ?auto_113310 ) ( ON ?auto_113311 ?auto_113310 ) ( not ( = ?auto_113310 ?auto_113311 ) ) ( not ( = ?auto_113310 ?auto_113314 ) ) ( not ( = ?auto_113311 ?auto_113314 ) ) ( not ( = ?auto_113310 ?auto_113317 ) ) ( not ( = ?auto_113310 ?auto_113313 ) ) ( not ( = ?auto_113311 ?auto_113317 ) ) ( not ( = ?auto_113311 ?auto_113313 ) ) ( not ( = ?auto_113314 ?auto_113317 ) ) ( not ( = ?auto_113314 ?auto_113313 ) ) ( not ( = ?auto_113317 ?auto_113313 ) ) ( ON ?auto_113317 ?auto_113314 ) ( not ( = ?auto_113316 ?auto_113315 ) ) ( not ( = ?auto_113316 ?auto_113312 ) ) ( not ( = ?auto_113316 ?auto_113313 ) ) ( not ( = ?auto_113315 ?auto_113312 ) ) ( not ( = ?auto_113315 ?auto_113313 ) ) ( not ( = ?auto_113312 ?auto_113313 ) ) ( not ( = ?auto_113310 ?auto_113312 ) ) ( not ( = ?auto_113310 ?auto_113316 ) ) ( not ( = ?auto_113310 ?auto_113315 ) ) ( not ( = ?auto_113311 ?auto_113312 ) ) ( not ( = ?auto_113311 ?auto_113316 ) ) ( not ( = ?auto_113311 ?auto_113315 ) ) ( not ( = ?auto_113314 ?auto_113312 ) ) ( not ( = ?auto_113314 ?auto_113316 ) ) ( not ( = ?auto_113314 ?auto_113315 ) ) ( not ( = ?auto_113317 ?auto_113312 ) ) ( not ( = ?auto_113317 ?auto_113316 ) ) ( not ( = ?auto_113317 ?auto_113315 ) ) ( ON ?auto_113313 ?auto_113317 ) ( ON ?auto_113312 ?auto_113313 ) ( ON ?auto_113315 ?auto_113312 ) ( CLEAR ?auto_113315 ) ( HOLDING ?auto_113316 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_113316 )
      ( MAKE-2PILE ?auto_113310 ?auto_113311 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_113318 - BLOCK
      ?auto_113319 - BLOCK
    )
    :vars
    (
      ?auto_113320 - BLOCK
      ?auto_113321 - BLOCK
      ?auto_113322 - BLOCK
      ?auto_113325 - BLOCK
      ?auto_113323 - BLOCK
      ?auto_113324 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113320 ?auto_113319 ) ( ON-TABLE ?auto_113318 ) ( ON ?auto_113319 ?auto_113318 ) ( not ( = ?auto_113318 ?auto_113319 ) ) ( not ( = ?auto_113318 ?auto_113320 ) ) ( not ( = ?auto_113319 ?auto_113320 ) ) ( not ( = ?auto_113318 ?auto_113321 ) ) ( not ( = ?auto_113318 ?auto_113322 ) ) ( not ( = ?auto_113319 ?auto_113321 ) ) ( not ( = ?auto_113319 ?auto_113322 ) ) ( not ( = ?auto_113320 ?auto_113321 ) ) ( not ( = ?auto_113320 ?auto_113322 ) ) ( not ( = ?auto_113321 ?auto_113322 ) ) ( ON ?auto_113321 ?auto_113320 ) ( not ( = ?auto_113325 ?auto_113323 ) ) ( not ( = ?auto_113325 ?auto_113324 ) ) ( not ( = ?auto_113325 ?auto_113322 ) ) ( not ( = ?auto_113323 ?auto_113324 ) ) ( not ( = ?auto_113323 ?auto_113322 ) ) ( not ( = ?auto_113324 ?auto_113322 ) ) ( not ( = ?auto_113318 ?auto_113324 ) ) ( not ( = ?auto_113318 ?auto_113325 ) ) ( not ( = ?auto_113318 ?auto_113323 ) ) ( not ( = ?auto_113319 ?auto_113324 ) ) ( not ( = ?auto_113319 ?auto_113325 ) ) ( not ( = ?auto_113319 ?auto_113323 ) ) ( not ( = ?auto_113320 ?auto_113324 ) ) ( not ( = ?auto_113320 ?auto_113325 ) ) ( not ( = ?auto_113320 ?auto_113323 ) ) ( not ( = ?auto_113321 ?auto_113324 ) ) ( not ( = ?auto_113321 ?auto_113325 ) ) ( not ( = ?auto_113321 ?auto_113323 ) ) ( ON ?auto_113322 ?auto_113321 ) ( ON ?auto_113324 ?auto_113322 ) ( ON ?auto_113323 ?auto_113324 ) ( ON ?auto_113325 ?auto_113323 ) ( CLEAR ?auto_113325 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_113318 ?auto_113319 ?auto_113320 ?auto_113321 ?auto_113322 ?auto_113324 ?auto_113323 )
      ( MAKE-2PILE ?auto_113318 ?auto_113319 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_113332 - BLOCK
      ?auto_113333 - BLOCK
      ?auto_113334 - BLOCK
      ?auto_113335 - BLOCK
      ?auto_113336 - BLOCK
      ?auto_113337 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_113337 ) ( CLEAR ?auto_113336 ) ( ON-TABLE ?auto_113332 ) ( ON ?auto_113333 ?auto_113332 ) ( ON ?auto_113334 ?auto_113333 ) ( ON ?auto_113335 ?auto_113334 ) ( ON ?auto_113336 ?auto_113335 ) ( not ( = ?auto_113332 ?auto_113333 ) ) ( not ( = ?auto_113332 ?auto_113334 ) ) ( not ( = ?auto_113332 ?auto_113335 ) ) ( not ( = ?auto_113332 ?auto_113336 ) ) ( not ( = ?auto_113332 ?auto_113337 ) ) ( not ( = ?auto_113333 ?auto_113334 ) ) ( not ( = ?auto_113333 ?auto_113335 ) ) ( not ( = ?auto_113333 ?auto_113336 ) ) ( not ( = ?auto_113333 ?auto_113337 ) ) ( not ( = ?auto_113334 ?auto_113335 ) ) ( not ( = ?auto_113334 ?auto_113336 ) ) ( not ( = ?auto_113334 ?auto_113337 ) ) ( not ( = ?auto_113335 ?auto_113336 ) ) ( not ( = ?auto_113335 ?auto_113337 ) ) ( not ( = ?auto_113336 ?auto_113337 ) ) )
    :subtasks
    ( ( !STACK ?auto_113337 ?auto_113336 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_113338 - BLOCK
      ?auto_113339 - BLOCK
      ?auto_113340 - BLOCK
      ?auto_113341 - BLOCK
      ?auto_113342 - BLOCK
      ?auto_113343 - BLOCK
    )
    :vars
    (
      ?auto_113344 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_113342 ) ( ON-TABLE ?auto_113338 ) ( ON ?auto_113339 ?auto_113338 ) ( ON ?auto_113340 ?auto_113339 ) ( ON ?auto_113341 ?auto_113340 ) ( ON ?auto_113342 ?auto_113341 ) ( not ( = ?auto_113338 ?auto_113339 ) ) ( not ( = ?auto_113338 ?auto_113340 ) ) ( not ( = ?auto_113338 ?auto_113341 ) ) ( not ( = ?auto_113338 ?auto_113342 ) ) ( not ( = ?auto_113338 ?auto_113343 ) ) ( not ( = ?auto_113339 ?auto_113340 ) ) ( not ( = ?auto_113339 ?auto_113341 ) ) ( not ( = ?auto_113339 ?auto_113342 ) ) ( not ( = ?auto_113339 ?auto_113343 ) ) ( not ( = ?auto_113340 ?auto_113341 ) ) ( not ( = ?auto_113340 ?auto_113342 ) ) ( not ( = ?auto_113340 ?auto_113343 ) ) ( not ( = ?auto_113341 ?auto_113342 ) ) ( not ( = ?auto_113341 ?auto_113343 ) ) ( not ( = ?auto_113342 ?auto_113343 ) ) ( ON ?auto_113343 ?auto_113344 ) ( CLEAR ?auto_113343 ) ( HAND-EMPTY ) ( not ( = ?auto_113338 ?auto_113344 ) ) ( not ( = ?auto_113339 ?auto_113344 ) ) ( not ( = ?auto_113340 ?auto_113344 ) ) ( not ( = ?auto_113341 ?auto_113344 ) ) ( not ( = ?auto_113342 ?auto_113344 ) ) ( not ( = ?auto_113343 ?auto_113344 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_113343 ?auto_113344 )
      ( MAKE-6PILE ?auto_113338 ?auto_113339 ?auto_113340 ?auto_113341 ?auto_113342 ?auto_113343 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_113345 - BLOCK
      ?auto_113346 - BLOCK
      ?auto_113347 - BLOCK
      ?auto_113348 - BLOCK
      ?auto_113349 - BLOCK
      ?auto_113350 - BLOCK
    )
    :vars
    (
      ?auto_113351 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_113345 ) ( ON ?auto_113346 ?auto_113345 ) ( ON ?auto_113347 ?auto_113346 ) ( ON ?auto_113348 ?auto_113347 ) ( not ( = ?auto_113345 ?auto_113346 ) ) ( not ( = ?auto_113345 ?auto_113347 ) ) ( not ( = ?auto_113345 ?auto_113348 ) ) ( not ( = ?auto_113345 ?auto_113349 ) ) ( not ( = ?auto_113345 ?auto_113350 ) ) ( not ( = ?auto_113346 ?auto_113347 ) ) ( not ( = ?auto_113346 ?auto_113348 ) ) ( not ( = ?auto_113346 ?auto_113349 ) ) ( not ( = ?auto_113346 ?auto_113350 ) ) ( not ( = ?auto_113347 ?auto_113348 ) ) ( not ( = ?auto_113347 ?auto_113349 ) ) ( not ( = ?auto_113347 ?auto_113350 ) ) ( not ( = ?auto_113348 ?auto_113349 ) ) ( not ( = ?auto_113348 ?auto_113350 ) ) ( not ( = ?auto_113349 ?auto_113350 ) ) ( ON ?auto_113350 ?auto_113351 ) ( CLEAR ?auto_113350 ) ( not ( = ?auto_113345 ?auto_113351 ) ) ( not ( = ?auto_113346 ?auto_113351 ) ) ( not ( = ?auto_113347 ?auto_113351 ) ) ( not ( = ?auto_113348 ?auto_113351 ) ) ( not ( = ?auto_113349 ?auto_113351 ) ) ( not ( = ?auto_113350 ?auto_113351 ) ) ( HOLDING ?auto_113349 ) ( CLEAR ?auto_113348 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_113345 ?auto_113346 ?auto_113347 ?auto_113348 ?auto_113349 )
      ( MAKE-6PILE ?auto_113345 ?auto_113346 ?auto_113347 ?auto_113348 ?auto_113349 ?auto_113350 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_113352 - BLOCK
      ?auto_113353 - BLOCK
      ?auto_113354 - BLOCK
      ?auto_113355 - BLOCK
      ?auto_113356 - BLOCK
      ?auto_113357 - BLOCK
    )
    :vars
    (
      ?auto_113358 - BLOCK
      ?auto_113359 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_113352 ) ( ON ?auto_113353 ?auto_113352 ) ( ON ?auto_113354 ?auto_113353 ) ( ON ?auto_113355 ?auto_113354 ) ( not ( = ?auto_113352 ?auto_113353 ) ) ( not ( = ?auto_113352 ?auto_113354 ) ) ( not ( = ?auto_113352 ?auto_113355 ) ) ( not ( = ?auto_113352 ?auto_113356 ) ) ( not ( = ?auto_113352 ?auto_113357 ) ) ( not ( = ?auto_113353 ?auto_113354 ) ) ( not ( = ?auto_113353 ?auto_113355 ) ) ( not ( = ?auto_113353 ?auto_113356 ) ) ( not ( = ?auto_113353 ?auto_113357 ) ) ( not ( = ?auto_113354 ?auto_113355 ) ) ( not ( = ?auto_113354 ?auto_113356 ) ) ( not ( = ?auto_113354 ?auto_113357 ) ) ( not ( = ?auto_113355 ?auto_113356 ) ) ( not ( = ?auto_113355 ?auto_113357 ) ) ( not ( = ?auto_113356 ?auto_113357 ) ) ( ON ?auto_113357 ?auto_113358 ) ( not ( = ?auto_113352 ?auto_113358 ) ) ( not ( = ?auto_113353 ?auto_113358 ) ) ( not ( = ?auto_113354 ?auto_113358 ) ) ( not ( = ?auto_113355 ?auto_113358 ) ) ( not ( = ?auto_113356 ?auto_113358 ) ) ( not ( = ?auto_113357 ?auto_113358 ) ) ( CLEAR ?auto_113355 ) ( ON ?auto_113356 ?auto_113357 ) ( CLEAR ?auto_113356 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_113359 ) ( ON ?auto_113358 ?auto_113359 ) ( not ( = ?auto_113359 ?auto_113358 ) ) ( not ( = ?auto_113359 ?auto_113357 ) ) ( not ( = ?auto_113359 ?auto_113356 ) ) ( not ( = ?auto_113352 ?auto_113359 ) ) ( not ( = ?auto_113353 ?auto_113359 ) ) ( not ( = ?auto_113354 ?auto_113359 ) ) ( not ( = ?auto_113355 ?auto_113359 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_113359 ?auto_113358 ?auto_113357 )
      ( MAKE-6PILE ?auto_113352 ?auto_113353 ?auto_113354 ?auto_113355 ?auto_113356 ?auto_113357 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_113360 - BLOCK
      ?auto_113361 - BLOCK
      ?auto_113362 - BLOCK
      ?auto_113363 - BLOCK
      ?auto_113364 - BLOCK
      ?auto_113365 - BLOCK
    )
    :vars
    (
      ?auto_113366 - BLOCK
      ?auto_113367 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_113360 ) ( ON ?auto_113361 ?auto_113360 ) ( ON ?auto_113362 ?auto_113361 ) ( not ( = ?auto_113360 ?auto_113361 ) ) ( not ( = ?auto_113360 ?auto_113362 ) ) ( not ( = ?auto_113360 ?auto_113363 ) ) ( not ( = ?auto_113360 ?auto_113364 ) ) ( not ( = ?auto_113360 ?auto_113365 ) ) ( not ( = ?auto_113361 ?auto_113362 ) ) ( not ( = ?auto_113361 ?auto_113363 ) ) ( not ( = ?auto_113361 ?auto_113364 ) ) ( not ( = ?auto_113361 ?auto_113365 ) ) ( not ( = ?auto_113362 ?auto_113363 ) ) ( not ( = ?auto_113362 ?auto_113364 ) ) ( not ( = ?auto_113362 ?auto_113365 ) ) ( not ( = ?auto_113363 ?auto_113364 ) ) ( not ( = ?auto_113363 ?auto_113365 ) ) ( not ( = ?auto_113364 ?auto_113365 ) ) ( ON ?auto_113365 ?auto_113366 ) ( not ( = ?auto_113360 ?auto_113366 ) ) ( not ( = ?auto_113361 ?auto_113366 ) ) ( not ( = ?auto_113362 ?auto_113366 ) ) ( not ( = ?auto_113363 ?auto_113366 ) ) ( not ( = ?auto_113364 ?auto_113366 ) ) ( not ( = ?auto_113365 ?auto_113366 ) ) ( ON ?auto_113364 ?auto_113365 ) ( CLEAR ?auto_113364 ) ( ON-TABLE ?auto_113367 ) ( ON ?auto_113366 ?auto_113367 ) ( not ( = ?auto_113367 ?auto_113366 ) ) ( not ( = ?auto_113367 ?auto_113365 ) ) ( not ( = ?auto_113367 ?auto_113364 ) ) ( not ( = ?auto_113360 ?auto_113367 ) ) ( not ( = ?auto_113361 ?auto_113367 ) ) ( not ( = ?auto_113362 ?auto_113367 ) ) ( not ( = ?auto_113363 ?auto_113367 ) ) ( HOLDING ?auto_113363 ) ( CLEAR ?auto_113362 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_113360 ?auto_113361 ?auto_113362 ?auto_113363 )
      ( MAKE-6PILE ?auto_113360 ?auto_113361 ?auto_113362 ?auto_113363 ?auto_113364 ?auto_113365 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_113368 - BLOCK
      ?auto_113369 - BLOCK
      ?auto_113370 - BLOCK
      ?auto_113371 - BLOCK
      ?auto_113372 - BLOCK
      ?auto_113373 - BLOCK
    )
    :vars
    (
      ?auto_113375 - BLOCK
      ?auto_113374 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_113368 ) ( ON ?auto_113369 ?auto_113368 ) ( ON ?auto_113370 ?auto_113369 ) ( not ( = ?auto_113368 ?auto_113369 ) ) ( not ( = ?auto_113368 ?auto_113370 ) ) ( not ( = ?auto_113368 ?auto_113371 ) ) ( not ( = ?auto_113368 ?auto_113372 ) ) ( not ( = ?auto_113368 ?auto_113373 ) ) ( not ( = ?auto_113369 ?auto_113370 ) ) ( not ( = ?auto_113369 ?auto_113371 ) ) ( not ( = ?auto_113369 ?auto_113372 ) ) ( not ( = ?auto_113369 ?auto_113373 ) ) ( not ( = ?auto_113370 ?auto_113371 ) ) ( not ( = ?auto_113370 ?auto_113372 ) ) ( not ( = ?auto_113370 ?auto_113373 ) ) ( not ( = ?auto_113371 ?auto_113372 ) ) ( not ( = ?auto_113371 ?auto_113373 ) ) ( not ( = ?auto_113372 ?auto_113373 ) ) ( ON ?auto_113373 ?auto_113375 ) ( not ( = ?auto_113368 ?auto_113375 ) ) ( not ( = ?auto_113369 ?auto_113375 ) ) ( not ( = ?auto_113370 ?auto_113375 ) ) ( not ( = ?auto_113371 ?auto_113375 ) ) ( not ( = ?auto_113372 ?auto_113375 ) ) ( not ( = ?auto_113373 ?auto_113375 ) ) ( ON ?auto_113372 ?auto_113373 ) ( ON-TABLE ?auto_113374 ) ( ON ?auto_113375 ?auto_113374 ) ( not ( = ?auto_113374 ?auto_113375 ) ) ( not ( = ?auto_113374 ?auto_113373 ) ) ( not ( = ?auto_113374 ?auto_113372 ) ) ( not ( = ?auto_113368 ?auto_113374 ) ) ( not ( = ?auto_113369 ?auto_113374 ) ) ( not ( = ?auto_113370 ?auto_113374 ) ) ( not ( = ?auto_113371 ?auto_113374 ) ) ( CLEAR ?auto_113370 ) ( ON ?auto_113371 ?auto_113372 ) ( CLEAR ?auto_113371 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_113374 ?auto_113375 ?auto_113373 ?auto_113372 )
      ( MAKE-6PILE ?auto_113368 ?auto_113369 ?auto_113370 ?auto_113371 ?auto_113372 ?auto_113373 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_113376 - BLOCK
      ?auto_113377 - BLOCK
      ?auto_113378 - BLOCK
      ?auto_113379 - BLOCK
      ?auto_113380 - BLOCK
      ?auto_113381 - BLOCK
    )
    :vars
    (
      ?auto_113382 - BLOCK
      ?auto_113383 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_113376 ) ( ON ?auto_113377 ?auto_113376 ) ( not ( = ?auto_113376 ?auto_113377 ) ) ( not ( = ?auto_113376 ?auto_113378 ) ) ( not ( = ?auto_113376 ?auto_113379 ) ) ( not ( = ?auto_113376 ?auto_113380 ) ) ( not ( = ?auto_113376 ?auto_113381 ) ) ( not ( = ?auto_113377 ?auto_113378 ) ) ( not ( = ?auto_113377 ?auto_113379 ) ) ( not ( = ?auto_113377 ?auto_113380 ) ) ( not ( = ?auto_113377 ?auto_113381 ) ) ( not ( = ?auto_113378 ?auto_113379 ) ) ( not ( = ?auto_113378 ?auto_113380 ) ) ( not ( = ?auto_113378 ?auto_113381 ) ) ( not ( = ?auto_113379 ?auto_113380 ) ) ( not ( = ?auto_113379 ?auto_113381 ) ) ( not ( = ?auto_113380 ?auto_113381 ) ) ( ON ?auto_113381 ?auto_113382 ) ( not ( = ?auto_113376 ?auto_113382 ) ) ( not ( = ?auto_113377 ?auto_113382 ) ) ( not ( = ?auto_113378 ?auto_113382 ) ) ( not ( = ?auto_113379 ?auto_113382 ) ) ( not ( = ?auto_113380 ?auto_113382 ) ) ( not ( = ?auto_113381 ?auto_113382 ) ) ( ON ?auto_113380 ?auto_113381 ) ( ON-TABLE ?auto_113383 ) ( ON ?auto_113382 ?auto_113383 ) ( not ( = ?auto_113383 ?auto_113382 ) ) ( not ( = ?auto_113383 ?auto_113381 ) ) ( not ( = ?auto_113383 ?auto_113380 ) ) ( not ( = ?auto_113376 ?auto_113383 ) ) ( not ( = ?auto_113377 ?auto_113383 ) ) ( not ( = ?auto_113378 ?auto_113383 ) ) ( not ( = ?auto_113379 ?auto_113383 ) ) ( ON ?auto_113379 ?auto_113380 ) ( CLEAR ?auto_113379 ) ( HOLDING ?auto_113378 ) ( CLEAR ?auto_113377 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_113376 ?auto_113377 ?auto_113378 )
      ( MAKE-6PILE ?auto_113376 ?auto_113377 ?auto_113378 ?auto_113379 ?auto_113380 ?auto_113381 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_113384 - BLOCK
      ?auto_113385 - BLOCK
      ?auto_113386 - BLOCK
      ?auto_113387 - BLOCK
      ?auto_113388 - BLOCK
      ?auto_113389 - BLOCK
    )
    :vars
    (
      ?auto_113391 - BLOCK
      ?auto_113390 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_113384 ) ( ON ?auto_113385 ?auto_113384 ) ( not ( = ?auto_113384 ?auto_113385 ) ) ( not ( = ?auto_113384 ?auto_113386 ) ) ( not ( = ?auto_113384 ?auto_113387 ) ) ( not ( = ?auto_113384 ?auto_113388 ) ) ( not ( = ?auto_113384 ?auto_113389 ) ) ( not ( = ?auto_113385 ?auto_113386 ) ) ( not ( = ?auto_113385 ?auto_113387 ) ) ( not ( = ?auto_113385 ?auto_113388 ) ) ( not ( = ?auto_113385 ?auto_113389 ) ) ( not ( = ?auto_113386 ?auto_113387 ) ) ( not ( = ?auto_113386 ?auto_113388 ) ) ( not ( = ?auto_113386 ?auto_113389 ) ) ( not ( = ?auto_113387 ?auto_113388 ) ) ( not ( = ?auto_113387 ?auto_113389 ) ) ( not ( = ?auto_113388 ?auto_113389 ) ) ( ON ?auto_113389 ?auto_113391 ) ( not ( = ?auto_113384 ?auto_113391 ) ) ( not ( = ?auto_113385 ?auto_113391 ) ) ( not ( = ?auto_113386 ?auto_113391 ) ) ( not ( = ?auto_113387 ?auto_113391 ) ) ( not ( = ?auto_113388 ?auto_113391 ) ) ( not ( = ?auto_113389 ?auto_113391 ) ) ( ON ?auto_113388 ?auto_113389 ) ( ON-TABLE ?auto_113390 ) ( ON ?auto_113391 ?auto_113390 ) ( not ( = ?auto_113390 ?auto_113391 ) ) ( not ( = ?auto_113390 ?auto_113389 ) ) ( not ( = ?auto_113390 ?auto_113388 ) ) ( not ( = ?auto_113384 ?auto_113390 ) ) ( not ( = ?auto_113385 ?auto_113390 ) ) ( not ( = ?auto_113386 ?auto_113390 ) ) ( not ( = ?auto_113387 ?auto_113390 ) ) ( ON ?auto_113387 ?auto_113388 ) ( CLEAR ?auto_113385 ) ( ON ?auto_113386 ?auto_113387 ) ( CLEAR ?auto_113386 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_113390 ?auto_113391 ?auto_113389 ?auto_113388 ?auto_113387 )
      ( MAKE-6PILE ?auto_113384 ?auto_113385 ?auto_113386 ?auto_113387 ?auto_113388 ?auto_113389 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_113392 - BLOCK
      ?auto_113393 - BLOCK
      ?auto_113394 - BLOCK
      ?auto_113395 - BLOCK
      ?auto_113396 - BLOCK
      ?auto_113397 - BLOCK
    )
    :vars
    (
      ?auto_113399 - BLOCK
      ?auto_113398 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_113392 ) ( not ( = ?auto_113392 ?auto_113393 ) ) ( not ( = ?auto_113392 ?auto_113394 ) ) ( not ( = ?auto_113392 ?auto_113395 ) ) ( not ( = ?auto_113392 ?auto_113396 ) ) ( not ( = ?auto_113392 ?auto_113397 ) ) ( not ( = ?auto_113393 ?auto_113394 ) ) ( not ( = ?auto_113393 ?auto_113395 ) ) ( not ( = ?auto_113393 ?auto_113396 ) ) ( not ( = ?auto_113393 ?auto_113397 ) ) ( not ( = ?auto_113394 ?auto_113395 ) ) ( not ( = ?auto_113394 ?auto_113396 ) ) ( not ( = ?auto_113394 ?auto_113397 ) ) ( not ( = ?auto_113395 ?auto_113396 ) ) ( not ( = ?auto_113395 ?auto_113397 ) ) ( not ( = ?auto_113396 ?auto_113397 ) ) ( ON ?auto_113397 ?auto_113399 ) ( not ( = ?auto_113392 ?auto_113399 ) ) ( not ( = ?auto_113393 ?auto_113399 ) ) ( not ( = ?auto_113394 ?auto_113399 ) ) ( not ( = ?auto_113395 ?auto_113399 ) ) ( not ( = ?auto_113396 ?auto_113399 ) ) ( not ( = ?auto_113397 ?auto_113399 ) ) ( ON ?auto_113396 ?auto_113397 ) ( ON-TABLE ?auto_113398 ) ( ON ?auto_113399 ?auto_113398 ) ( not ( = ?auto_113398 ?auto_113399 ) ) ( not ( = ?auto_113398 ?auto_113397 ) ) ( not ( = ?auto_113398 ?auto_113396 ) ) ( not ( = ?auto_113392 ?auto_113398 ) ) ( not ( = ?auto_113393 ?auto_113398 ) ) ( not ( = ?auto_113394 ?auto_113398 ) ) ( not ( = ?auto_113395 ?auto_113398 ) ) ( ON ?auto_113395 ?auto_113396 ) ( ON ?auto_113394 ?auto_113395 ) ( CLEAR ?auto_113394 ) ( HOLDING ?auto_113393 ) ( CLEAR ?auto_113392 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_113392 ?auto_113393 )
      ( MAKE-6PILE ?auto_113392 ?auto_113393 ?auto_113394 ?auto_113395 ?auto_113396 ?auto_113397 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_113400 - BLOCK
      ?auto_113401 - BLOCK
      ?auto_113402 - BLOCK
      ?auto_113403 - BLOCK
      ?auto_113404 - BLOCK
      ?auto_113405 - BLOCK
    )
    :vars
    (
      ?auto_113407 - BLOCK
      ?auto_113406 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_113400 ) ( not ( = ?auto_113400 ?auto_113401 ) ) ( not ( = ?auto_113400 ?auto_113402 ) ) ( not ( = ?auto_113400 ?auto_113403 ) ) ( not ( = ?auto_113400 ?auto_113404 ) ) ( not ( = ?auto_113400 ?auto_113405 ) ) ( not ( = ?auto_113401 ?auto_113402 ) ) ( not ( = ?auto_113401 ?auto_113403 ) ) ( not ( = ?auto_113401 ?auto_113404 ) ) ( not ( = ?auto_113401 ?auto_113405 ) ) ( not ( = ?auto_113402 ?auto_113403 ) ) ( not ( = ?auto_113402 ?auto_113404 ) ) ( not ( = ?auto_113402 ?auto_113405 ) ) ( not ( = ?auto_113403 ?auto_113404 ) ) ( not ( = ?auto_113403 ?auto_113405 ) ) ( not ( = ?auto_113404 ?auto_113405 ) ) ( ON ?auto_113405 ?auto_113407 ) ( not ( = ?auto_113400 ?auto_113407 ) ) ( not ( = ?auto_113401 ?auto_113407 ) ) ( not ( = ?auto_113402 ?auto_113407 ) ) ( not ( = ?auto_113403 ?auto_113407 ) ) ( not ( = ?auto_113404 ?auto_113407 ) ) ( not ( = ?auto_113405 ?auto_113407 ) ) ( ON ?auto_113404 ?auto_113405 ) ( ON-TABLE ?auto_113406 ) ( ON ?auto_113407 ?auto_113406 ) ( not ( = ?auto_113406 ?auto_113407 ) ) ( not ( = ?auto_113406 ?auto_113405 ) ) ( not ( = ?auto_113406 ?auto_113404 ) ) ( not ( = ?auto_113400 ?auto_113406 ) ) ( not ( = ?auto_113401 ?auto_113406 ) ) ( not ( = ?auto_113402 ?auto_113406 ) ) ( not ( = ?auto_113403 ?auto_113406 ) ) ( ON ?auto_113403 ?auto_113404 ) ( ON ?auto_113402 ?auto_113403 ) ( CLEAR ?auto_113400 ) ( ON ?auto_113401 ?auto_113402 ) ( CLEAR ?auto_113401 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_113406 ?auto_113407 ?auto_113405 ?auto_113404 ?auto_113403 ?auto_113402 )
      ( MAKE-6PILE ?auto_113400 ?auto_113401 ?auto_113402 ?auto_113403 ?auto_113404 ?auto_113405 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_113408 - BLOCK
      ?auto_113409 - BLOCK
      ?auto_113410 - BLOCK
      ?auto_113411 - BLOCK
      ?auto_113412 - BLOCK
      ?auto_113413 - BLOCK
    )
    :vars
    (
      ?auto_113414 - BLOCK
      ?auto_113415 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_113408 ?auto_113409 ) ) ( not ( = ?auto_113408 ?auto_113410 ) ) ( not ( = ?auto_113408 ?auto_113411 ) ) ( not ( = ?auto_113408 ?auto_113412 ) ) ( not ( = ?auto_113408 ?auto_113413 ) ) ( not ( = ?auto_113409 ?auto_113410 ) ) ( not ( = ?auto_113409 ?auto_113411 ) ) ( not ( = ?auto_113409 ?auto_113412 ) ) ( not ( = ?auto_113409 ?auto_113413 ) ) ( not ( = ?auto_113410 ?auto_113411 ) ) ( not ( = ?auto_113410 ?auto_113412 ) ) ( not ( = ?auto_113410 ?auto_113413 ) ) ( not ( = ?auto_113411 ?auto_113412 ) ) ( not ( = ?auto_113411 ?auto_113413 ) ) ( not ( = ?auto_113412 ?auto_113413 ) ) ( ON ?auto_113413 ?auto_113414 ) ( not ( = ?auto_113408 ?auto_113414 ) ) ( not ( = ?auto_113409 ?auto_113414 ) ) ( not ( = ?auto_113410 ?auto_113414 ) ) ( not ( = ?auto_113411 ?auto_113414 ) ) ( not ( = ?auto_113412 ?auto_113414 ) ) ( not ( = ?auto_113413 ?auto_113414 ) ) ( ON ?auto_113412 ?auto_113413 ) ( ON-TABLE ?auto_113415 ) ( ON ?auto_113414 ?auto_113415 ) ( not ( = ?auto_113415 ?auto_113414 ) ) ( not ( = ?auto_113415 ?auto_113413 ) ) ( not ( = ?auto_113415 ?auto_113412 ) ) ( not ( = ?auto_113408 ?auto_113415 ) ) ( not ( = ?auto_113409 ?auto_113415 ) ) ( not ( = ?auto_113410 ?auto_113415 ) ) ( not ( = ?auto_113411 ?auto_113415 ) ) ( ON ?auto_113411 ?auto_113412 ) ( ON ?auto_113410 ?auto_113411 ) ( ON ?auto_113409 ?auto_113410 ) ( CLEAR ?auto_113409 ) ( HOLDING ?auto_113408 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_113408 )
      ( MAKE-6PILE ?auto_113408 ?auto_113409 ?auto_113410 ?auto_113411 ?auto_113412 ?auto_113413 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_113416 - BLOCK
      ?auto_113417 - BLOCK
      ?auto_113418 - BLOCK
      ?auto_113419 - BLOCK
      ?auto_113420 - BLOCK
      ?auto_113421 - BLOCK
    )
    :vars
    (
      ?auto_113422 - BLOCK
      ?auto_113423 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_113416 ?auto_113417 ) ) ( not ( = ?auto_113416 ?auto_113418 ) ) ( not ( = ?auto_113416 ?auto_113419 ) ) ( not ( = ?auto_113416 ?auto_113420 ) ) ( not ( = ?auto_113416 ?auto_113421 ) ) ( not ( = ?auto_113417 ?auto_113418 ) ) ( not ( = ?auto_113417 ?auto_113419 ) ) ( not ( = ?auto_113417 ?auto_113420 ) ) ( not ( = ?auto_113417 ?auto_113421 ) ) ( not ( = ?auto_113418 ?auto_113419 ) ) ( not ( = ?auto_113418 ?auto_113420 ) ) ( not ( = ?auto_113418 ?auto_113421 ) ) ( not ( = ?auto_113419 ?auto_113420 ) ) ( not ( = ?auto_113419 ?auto_113421 ) ) ( not ( = ?auto_113420 ?auto_113421 ) ) ( ON ?auto_113421 ?auto_113422 ) ( not ( = ?auto_113416 ?auto_113422 ) ) ( not ( = ?auto_113417 ?auto_113422 ) ) ( not ( = ?auto_113418 ?auto_113422 ) ) ( not ( = ?auto_113419 ?auto_113422 ) ) ( not ( = ?auto_113420 ?auto_113422 ) ) ( not ( = ?auto_113421 ?auto_113422 ) ) ( ON ?auto_113420 ?auto_113421 ) ( ON-TABLE ?auto_113423 ) ( ON ?auto_113422 ?auto_113423 ) ( not ( = ?auto_113423 ?auto_113422 ) ) ( not ( = ?auto_113423 ?auto_113421 ) ) ( not ( = ?auto_113423 ?auto_113420 ) ) ( not ( = ?auto_113416 ?auto_113423 ) ) ( not ( = ?auto_113417 ?auto_113423 ) ) ( not ( = ?auto_113418 ?auto_113423 ) ) ( not ( = ?auto_113419 ?auto_113423 ) ) ( ON ?auto_113419 ?auto_113420 ) ( ON ?auto_113418 ?auto_113419 ) ( ON ?auto_113417 ?auto_113418 ) ( ON ?auto_113416 ?auto_113417 ) ( CLEAR ?auto_113416 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_113423 ?auto_113422 ?auto_113421 ?auto_113420 ?auto_113419 ?auto_113418 ?auto_113417 )
      ( MAKE-6PILE ?auto_113416 ?auto_113417 ?auto_113418 ?auto_113419 ?auto_113420 ?auto_113421 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_113425 - BLOCK
    )
    :vars
    (
      ?auto_113426 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113426 ?auto_113425 ) ( CLEAR ?auto_113426 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_113425 ) ( not ( = ?auto_113425 ?auto_113426 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_113426 ?auto_113425 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_113427 - BLOCK
    )
    :vars
    (
      ?auto_113428 - BLOCK
      ?auto_113429 - BLOCK
      ?auto_113430 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113428 ?auto_113427 ) ( CLEAR ?auto_113428 ) ( ON-TABLE ?auto_113427 ) ( not ( = ?auto_113427 ?auto_113428 ) ) ( HOLDING ?auto_113429 ) ( CLEAR ?auto_113430 ) ( not ( = ?auto_113427 ?auto_113429 ) ) ( not ( = ?auto_113427 ?auto_113430 ) ) ( not ( = ?auto_113428 ?auto_113429 ) ) ( not ( = ?auto_113428 ?auto_113430 ) ) ( not ( = ?auto_113429 ?auto_113430 ) ) )
    :subtasks
    ( ( !STACK ?auto_113429 ?auto_113430 )
      ( MAKE-1PILE ?auto_113427 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_113431 - BLOCK
    )
    :vars
    (
      ?auto_113432 - BLOCK
      ?auto_113434 - BLOCK
      ?auto_113433 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113432 ?auto_113431 ) ( ON-TABLE ?auto_113431 ) ( not ( = ?auto_113431 ?auto_113432 ) ) ( CLEAR ?auto_113434 ) ( not ( = ?auto_113431 ?auto_113433 ) ) ( not ( = ?auto_113431 ?auto_113434 ) ) ( not ( = ?auto_113432 ?auto_113433 ) ) ( not ( = ?auto_113432 ?auto_113434 ) ) ( not ( = ?auto_113433 ?auto_113434 ) ) ( ON ?auto_113433 ?auto_113432 ) ( CLEAR ?auto_113433 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_113431 ?auto_113432 )
      ( MAKE-1PILE ?auto_113431 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_113435 - BLOCK
    )
    :vars
    (
      ?auto_113436 - BLOCK
      ?auto_113437 - BLOCK
      ?auto_113438 - BLOCK
      ?auto_113441 - BLOCK
      ?auto_113442 - BLOCK
      ?auto_113440 - BLOCK
      ?auto_113439 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113436 ?auto_113435 ) ( ON-TABLE ?auto_113435 ) ( not ( = ?auto_113435 ?auto_113436 ) ) ( not ( = ?auto_113435 ?auto_113437 ) ) ( not ( = ?auto_113435 ?auto_113438 ) ) ( not ( = ?auto_113436 ?auto_113437 ) ) ( not ( = ?auto_113436 ?auto_113438 ) ) ( not ( = ?auto_113437 ?auto_113438 ) ) ( ON ?auto_113437 ?auto_113436 ) ( CLEAR ?auto_113437 ) ( HOLDING ?auto_113438 ) ( CLEAR ?auto_113441 ) ( ON-TABLE ?auto_113442 ) ( ON ?auto_113440 ?auto_113442 ) ( ON ?auto_113439 ?auto_113440 ) ( ON ?auto_113441 ?auto_113439 ) ( not ( = ?auto_113442 ?auto_113440 ) ) ( not ( = ?auto_113442 ?auto_113439 ) ) ( not ( = ?auto_113442 ?auto_113441 ) ) ( not ( = ?auto_113442 ?auto_113438 ) ) ( not ( = ?auto_113440 ?auto_113439 ) ) ( not ( = ?auto_113440 ?auto_113441 ) ) ( not ( = ?auto_113440 ?auto_113438 ) ) ( not ( = ?auto_113439 ?auto_113441 ) ) ( not ( = ?auto_113439 ?auto_113438 ) ) ( not ( = ?auto_113441 ?auto_113438 ) ) ( not ( = ?auto_113435 ?auto_113441 ) ) ( not ( = ?auto_113435 ?auto_113442 ) ) ( not ( = ?auto_113435 ?auto_113440 ) ) ( not ( = ?auto_113435 ?auto_113439 ) ) ( not ( = ?auto_113436 ?auto_113441 ) ) ( not ( = ?auto_113436 ?auto_113442 ) ) ( not ( = ?auto_113436 ?auto_113440 ) ) ( not ( = ?auto_113436 ?auto_113439 ) ) ( not ( = ?auto_113437 ?auto_113441 ) ) ( not ( = ?auto_113437 ?auto_113442 ) ) ( not ( = ?auto_113437 ?auto_113440 ) ) ( not ( = ?auto_113437 ?auto_113439 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_113442 ?auto_113440 ?auto_113439 ?auto_113441 ?auto_113438 )
      ( MAKE-1PILE ?auto_113435 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_113443 - BLOCK
    )
    :vars
    (
      ?auto_113447 - BLOCK
      ?auto_113450 - BLOCK
      ?auto_113449 - BLOCK
      ?auto_113446 - BLOCK
      ?auto_113448 - BLOCK
      ?auto_113445 - BLOCK
      ?auto_113444 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113447 ?auto_113443 ) ( ON-TABLE ?auto_113443 ) ( not ( = ?auto_113443 ?auto_113447 ) ) ( not ( = ?auto_113443 ?auto_113450 ) ) ( not ( = ?auto_113443 ?auto_113449 ) ) ( not ( = ?auto_113447 ?auto_113450 ) ) ( not ( = ?auto_113447 ?auto_113449 ) ) ( not ( = ?auto_113450 ?auto_113449 ) ) ( ON ?auto_113450 ?auto_113447 ) ( CLEAR ?auto_113446 ) ( ON-TABLE ?auto_113448 ) ( ON ?auto_113445 ?auto_113448 ) ( ON ?auto_113444 ?auto_113445 ) ( ON ?auto_113446 ?auto_113444 ) ( not ( = ?auto_113448 ?auto_113445 ) ) ( not ( = ?auto_113448 ?auto_113444 ) ) ( not ( = ?auto_113448 ?auto_113446 ) ) ( not ( = ?auto_113448 ?auto_113449 ) ) ( not ( = ?auto_113445 ?auto_113444 ) ) ( not ( = ?auto_113445 ?auto_113446 ) ) ( not ( = ?auto_113445 ?auto_113449 ) ) ( not ( = ?auto_113444 ?auto_113446 ) ) ( not ( = ?auto_113444 ?auto_113449 ) ) ( not ( = ?auto_113446 ?auto_113449 ) ) ( not ( = ?auto_113443 ?auto_113446 ) ) ( not ( = ?auto_113443 ?auto_113448 ) ) ( not ( = ?auto_113443 ?auto_113445 ) ) ( not ( = ?auto_113443 ?auto_113444 ) ) ( not ( = ?auto_113447 ?auto_113446 ) ) ( not ( = ?auto_113447 ?auto_113448 ) ) ( not ( = ?auto_113447 ?auto_113445 ) ) ( not ( = ?auto_113447 ?auto_113444 ) ) ( not ( = ?auto_113450 ?auto_113446 ) ) ( not ( = ?auto_113450 ?auto_113448 ) ) ( not ( = ?auto_113450 ?auto_113445 ) ) ( not ( = ?auto_113450 ?auto_113444 ) ) ( ON ?auto_113449 ?auto_113450 ) ( CLEAR ?auto_113449 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_113443 ?auto_113447 ?auto_113450 )
      ( MAKE-1PILE ?auto_113443 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_113451 - BLOCK
    )
    :vars
    (
      ?auto_113452 - BLOCK
      ?auto_113458 - BLOCK
      ?auto_113454 - BLOCK
      ?auto_113456 - BLOCK
      ?auto_113457 - BLOCK
      ?auto_113453 - BLOCK
      ?auto_113455 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113452 ?auto_113451 ) ( ON-TABLE ?auto_113451 ) ( not ( = ?auto_113451 ?auto_113452 ) ) ( not ( = ?auto_113451 ?auto_113458 ) ) ( not ( = ?auto_113451 ?auto_113454 ) ) ( not ( = ?auto_113452 ?auto_113458 ) ) ( not ( = ?auto_113452 ?auto_113454 ) ) ( not ( = ?auto_113458 ?auto_113454 ) ) ( ON ?auto_113458 ?auto_113452 ) ( ON-TABLE ?auto_113456 ) ( ON ?auto_113457 ?auto_113456 ) ( ON ?auto_113453 ?auto_113457 ) ( not ( = ?auto_113456 ?auto_113457 ) ) ( not ( = ?auto_113456 ?auto_113453 ) ) ( not ( = ?auto_113456 ?auto_113455 ) ) ( not ( = ?auto_113456 ?auto_113454 ) ) ( not ( = ?auto_113457 ?auto_113453 ) ) ( not ( = ?auto_113457 ?auto_113455 ) ) ( not ( = ?auto_113457 ?auto_113454 ) ) ( not ( = ?auto_113453 ?auto_113455 ) ) ( not ( = ?auto_113453 ?auto_113454 ) ) ( not ( = ?auto_113455 ?auto_113454 ) ) ( not ( = ?auto_113451 ?auto_113455 ) ) ( not ( = ?auto_113451 ?auto_113456 ) ) ( not ( = ?auto_113451 ?auto_113457 ) ) ( not ( = ?auto_113451 ?auto_113453 ) ) ( not ( = ?auto_113452 ?auto_113455 ) ) ( not ( = ?auto_113452 ?auto_113456 ) ) ( not ( = ?auto_113452 ?auto_113457 ) ) ( not ( = ?auto_113452 ?auto_113453 ) ) ( not ( = ?auto_113458 ?auto_113455 ) ) ( not ( = ?auto_113458 ?auto_113456 ) ) ( not ( = ?auto_113458 ?auto_113457 ) ) ( not ( = ?auto_113458 ?auto_113453 ) ) ( ON ?auto_113454 ?auto_113458 ) ( CLEAR ?auto_113454 ) ( HOLDING ?auto_113455 ) ( CLEAR ?auto_113453 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_113456 ?auto_113457 ?auto_113453 ?auto_113455 )
      ( MAKE-1PILE ?auto_113451 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_113459 - BLOCK
    )
    :vars
    (
      ?auto_113462 - BLOCK
      ?auto_113466 - BLOCK
      ?auto_113464 - BLOCK
      ?auto_113461 - BLOCK
      ?auto_113465 - BLOCK
      ?auto_113460 - BLOCK
      ?auto_113463 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113462 ?auto_113459 ) ( ON-TABLE ?auto_113459 ) ( not ( = ?auto_113459 ?auto_113462 ) ) ( not ( = ?auto_113459 ?auto_113466 ) ) ( not ( = ?auto_113459 ?auto_113464 ) ) ( not ( = ?auto_113462 ?auto_113466 ) ) ( not ( = ?auto_113462 ?auto_113464 ) ) ( not ( = ?auto_113466 ?auto_113464 ) ) ( ON ?auto_113466 ?auto_113462 ) ( ON-TABLE ?auto_113461 ) ( ON ?auto_113465 ?auto_113461 ) ( ON ?auto_113460 ?auto_113465 ) ( not ( = ?auto_113461 ?auto_113465 ) ) ( not ( = ?auto_113461 ?auto_113460 ) ) ( not ( = ?auto_113461 ?auto_113463 ) ) ( not ( = ?auto_113461 ?auto_113464 ) ) ( not ( = ?auto_113465 ?auto_113460 ) ) ( not ( = ?auto_113465 ?auto_113463 ) ) ( not ( = ?auto_113465 ?auto_113464 ) ) ( not ( = ?auto_113460 ?auto_113463 ) ) ( not ( = ?auto_113460 ?auto_113464 ) ) ( not ( = ?auto_113463 ?auto_113464 ) ) ( not ( = ?auto_113459 ?auto_113463 ) ) ( not ( = ?auto_113459 ?auto_113461 ) ) ( not ( = ?auto_113459 ?auto_113465 ) ) ( not ( = ?auto_113459 ?auto_113460 ) ) ( not ( = ?auto_113462 ?auto_113463 ) ) ( not ( = ?auto_113462 ?auto_113461 ) ) ( not ( = ?auto_113462 ?auto_113465 ) ) ( not ( = ?auto_113462 ?auto_113460 ) ) ( not ( = ?auto_113466 ?auto_113463 ) ) ( not ( = ?auto_113466 ?auto_113461 ) ) ( not ( = ?auto_113466 ?auto_113465 ) ) ( not ( = ?auto_113466 ?auto_113460 ) ) ( ON ?auto_113464 ?auto_113466 ) ( CLEAR ?auto_113460 ) ( ON ?auto_113463 ?auto_113464 ) ( CLEAR ?auto_113463 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_113459 ?auto_113462 ?auto_113466 ?auto_113464 )
      ( MAKE-1PILE ?auto_113459 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_113467 - BLOCK
    )
    :vars
    (
      ?auto_113473 - BLOCK
      ?auto_113471 - BLOCK
      ?auto_113472 - BLOCK
      ?auto_113474 - BLOCK
      ?auto_113470 - BLOCK
      ?auto_113468 - BLOCK
      ?auto_113469 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113473 ?auto_113467 ) ( ON-TABLE ?auto_113467 ) ( not ( = ?auto_113467 ?auto_113473 ) ) ( not ( = ?auto_113467 ?auto_113471 ) ) ( not ( = ?auto_113467 ?auto_113472 ) ) ( not ( = ?auto_113473 ?auto_113471 ) ) ( not ( = ?auto_113473 ?auto_113472 ) ) ( not ( = ?auto_113471 ?auto_113472 ) ) ( ON ?auto_113471 ?auto_113473 ) ( ON-TABLE ?auto_113474 ) ( ON ?auto_113470 ?auto_113474 ) ( not ( = ?auto_113474 ?auto_113470 ) ) ( not ( = ?auto_113474 ?auto_113468 ) ) ( not ( = ?auto_113474 ?auto_113469 ) ) ( not ( = ?auto_113474 ?auto_113472 ) ) ( not ( = ?auto_113470 ?auto_113468 ) ) ( not ( = ?auto_113470 ?auto_113469 ) ) ( not ( = ?auto_113470 ?auto_113472 ) ) ( not ( = ?auto_113468 ?auto_113469 ) ) ( not ( = ?auto_113468 ?auto_113472 ) ) ( not ( = ?auto_113469 ?auto_113472 ) ) ( not ( = ?auto_113467 ?auto_113469 ) ) ( not ( = ?auto_113467 ?auto_113474 ) ) ( not ( = ?auto_113467 ?auto_113470 ) ) ( not ( = ?auto_113467 ?auto_113468 ) ) ( not ( = ?auto_113473 ?auto_113469 ) ) ( not ( = ?auto_113473 ?auto_113474 ) ) ( not ( = ?auto_113473 ?auto_113470 ) ) ( not ( = ?auto_113473 ?auto_113468 ) ) ( not ( = ?auto_113471 ?auto_113469 ) ) ( not ( = ?auto_113471 ?auto_113474 ) ) ( not ( = ?auto_113471 ?auto_113470 ) ) ( not ( = ?auto_113471 ?auto_113468 ) ) ( ON ?auto_113472 ?auto_113471 ) ( ON ?auto_113469 ?auto_113472 ) ( CLEAR ?auto_113469 ) ( HOLDING ?auto_113468 ) ( CLEAR ?auto_113470 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_113474 ?auto_113470 ?auto_113468 )
      ( MAKE-1PILE ?auto_113467 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_113475 - BLOCK
    )
    :vars
    (
      ?auto_113482 - BLOCK
      ?auto_113479 - BLOCK
      ?auto_113480 - BLOCK
      ?auto_113476 - BLOCK
      ?auto_113478 - BLOCK
      ?auto_113481 - BLOCK
      ?auto_113477 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113482 ?auto_113475 ) ( ON-TABLE ?auto_113475 ) ( not ( = ?auto_113475 ?auto_113482 ) ) ( not ( = ?auto_113475 ?auto_113479 ) ) ( not ( = ?auto_113475 ?auto_113480 ) ) ( not ( = ?auto_113482 ?auto_113479 ) ) ( not ( = ?auto_113482 ?auto_113480 ) ) ( not ( = ?auto_113479 ?auto_113480 ) ) ( ON ?auto_113479 ?auto_113482 ) ( ON-TABLE ?auto_113476 ) ( ON ?auto_113478 ?auto_113476 ) ( not ( = ?auto_113476 ?auto_113478 ) ) ( not ( = ?auto_113476 ?auto_113481 ) ) ( not ( = ?auto_113476 ?auto_113477 ) ) ( not ( = ?auto_113476 ?auto_113480 ) ) ( not ( = ?auto_113478 ?auto_113481 ) ) ( not ( = ?auto_113478 ?auto_113477 ) ) ( not ( = ?auto_113478 ?auto_113480 ) ) ( not ( = ?auto_113481 ?auto_113477 ) ) ( not ( = ?auto_113481 ?auto_113480 ) ) ( not ( = ?auto_113477 ?auto_113480 ) ) ( not ( = ?auto_113475 ?auto_113477 ) ) ( not ( = ?auto_113475 ?auto_113476 ) ) ( not ( = ?auto_113475 ?auto_113478 ) ) ( not ( = ?auto_113475 ?auto_113481 ) ) ( not ( = ?auto_113482 ?auto_113477 ) ) ( not ( = ?auto_113482 ?auto_113476 ) ) ( not ( = ?auto_113482 ?auto_113478 ) ) ( not ( = ?auto_113482 ?auto_113481 ) ) ( not ( = ?auto_113479 ?auto_113477 ) ) ( not ( = ?auto_113479 ?auto_113476 ) ) ( not ( = ?auto_113479 ?auto_113478 ) ) ( not ( = ?auto_113479 ?auto_113481 ) ) ( ON ?auto_113480 ?auto_113479 ) ( ON ?auto_113477 ?auto_113480 ) ( CLEAR ?auto_113478 ) ( ON ?auto_113481 ?auto_113477 ) ( CLEAR ?auto_113481 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_113475 ?auto_113482 ?auto_113479 ?auto_113480 ?auto_113477 )
      ( MAKE-1PILE ?auto_113475 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_113483 - BLOCK
    )
    :vars
    (
      ?auto_113487 - BLOCK
      ?auto_113486 - BLOCK
      ?auto_113488 - BLOCK
      ?auto_113484 - BLOCK
      ?auto_113489 - BLOCK
      ?auto_113490 - BLOCK
      ?auto_113485 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113487 ?auto_113483 ) ( ON-TABLE ?auto_113483 ) ( not ( = ?auto_113483 ?auto_113487 ) ) ( not ( = ?auto_113483 ?auto_113486 ) ) ( not ( = ?auto_113483 ?auto_113488 ) ) ( not ( = ?auto_113487 ?auto_113486 ) ) ( not ( = ?auto_113487 ?auto_113488 ) ) ( not ( = ?auto_113486 ?auto_113488 ) ) ( ON ?auto_113486 ?auto_113487 ) ( ON-TABLE ?auto_113484 ) ( not ( = ?auto_113484 ?auto_113489 ) ) ( not ( = ?auto_113484 ?auto_113490 ) ) ( not ( = ?auto_113484 ?auto_113485 ) ) ( not ( = ?auto_113484 ?auto_113488 ) ) ( not ( = ?auto_113489 ?auto_113490 ) ) ( not ( = ?auto_113489 ?auto_113485 ) ) ( not ( = ?auto_113489 ?auto_113488 ) ) ( not ( = ?auto_113490 ?auto_113485 ) ) ( not ( = ?auto_113490 ?auto_113488 ) ) ( not ( = ?auto_113485 ?auto_113488 ) ) ( not ( = ?auto_113483 ?auto_113485 ) ) ( not ( = ?auto_113483 ?auto_113484 ) ) ( not ( = ?auto_113483 ?auto_113489 ) ) ( not ( = ?auto_113483 ?auto_113490 ) ) ( not ( = ?auto_113487 ?auto_113485 ) ) ( not ( = ?auto_113487 ?auto_113484 ) ) ( not ( = ?auto_113487 ?auto_113489 ) ) ( not ( = ?auto_113487 ?auto_113490 ) ) ( not ( = ?auto_113486 ?auto_113485 ) ) ( not ( = ?auto_113486 ?auto_113484 ) ) ( not ( = ?auto_113486 ?auto_113489 ) ) ( not ( = ?auto_113486 ?auto_113490 ) ) ( ON ?auto_113488 ?auto_113486 ) ( ON ?auto_113485 ?auto_113488 ) ( ON ?auto_113490 ?auto_113485 ) ( CLEAR ?auto_113490 ) ( HOLDING ?auto_113489 ) ( CLEAR ?auto_113484 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_113484 ?auto_113489 )
      ( MAKE-1PILE ?auto_113483 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_113491 - BLOCK
    )
    :vars
    (
      ?auto_113498 - BLOCK
      ?auto_113492 - BLOCK
      ?auto_113494 - BLOCK
      ?auto_113497 - BLOCK
      ?auto_113493 - BLOCK
      ?auto_113495 - BLOCK
      ?auto_113496 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113498 ?auto_113491 ) ( ON-TABLE ?auto_113491 ) ( not ( = ?auto_113491 ?auto_113498 ) ) ( not ( = ?auto_113491 ?auto_113492 ) ) ( not ( = ?auto_113491 ?auto_113494 ) ) ( not ( = ?auto_113498 ?auto_113492 ) ) ( not ( = ?auto_113498 ?auto_113494 ) ) ( not ( = ?auto_113492 ?auto_113494 ) ) ( ON ?auto_113492 ?auto_113498 ) ( ON-TABLE ?auto_113497 ) ( not ( = ?auto_113497 ?auto_113493 ) ) ( not ( = ?auto_113497 ?auto_113495 ) ) ( not ( = ?auto_113497 ?auto_113496 ) ) ( not ( = ?auto_113497 ?auto_113494 ) ) ( not ( = ?auto_113493 ?auto_113495 ) ) ( not ( = ?auto_113493 ?auto_113496 ) ) ( not ( = ?auto_113493 ?auto_113494 ) ) ( not ( = ?auto_113495 ?auto_113496 ) ) ( not ( = ?auto_113495 ?auto_113494 ) ) ( not ( = ?auto_113496 ?auto_113494 ) ) ( not ( = ?auto_113491 ?auto_113496 ) ) ( not ( = ?auto_113491 ?auto_113497 ) ) ( not ( = ?auto_113491 ?auto_113493 ) ) ( not ( = ?auto_113491 ?auto_113495 ) ) ( not ( = ?auto_113498 ?auto_113496 ) ) ( not ( = ?auto_113498 ?auto_113497 ) ) ( not ( = ?auto_113498 ?auto_113493 ) ) ( not ( = ?auto_113498 ?auto_113495 ) ) ( not ( = ?auto_113492 ?auto_113496 ) ) ( not ( = ?auto_113492 ?auto_113497 ) ) ( not ( = ?auto_113492 ?auto_113493 ) ) ( not ( = ?auto_113492 ?auto_113495 ) ) ( ON ?auto_113494 ?auto_113492 ) ( ON ?auto_113496 ?auto_113494 ) ( ON ?auto_113495 ?auto_113496 ) ( CLEAR ?auto_113497 ) ( ON ?auto_113493 ?auto_113495 ) ( CLEAR ?auto_113493 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_113491 ?auto_113498 ?auto_113492 ?auto_113494 ?auto_113496 ?auto_113495 )
      ( MAKE-1PILE ?auto_113491 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_113499 - BLOCK
    )
    :vars
    (
      ?auto_113502 - BLOCK
      ?auto_113500 - BLOCK
      ?auto_113501 - BLOCK
      ?auto_113506 - BLOCK
      ?auto_113503 - BLOCK
      ?auto_113504 - BLOCK
      ?auto_113505 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113502 ?auto_113499 ) ( ON-TABLE ?auto_113499 ) ( not ( = ?auto_113499 ?auto_113502 ) ) ( not ( = ?auto_113499 ?auto_113500 ) ) ( not ( = ?auto_113499 ?auto_113501 ) ) ( not ( = ?auto_113502 ?auto_113500 ) ) ( not ( = ?auto_113502 ?auto_113501 ) ) ( not ( = ?auto_113500 ?auto_113501 ) ) ( ON ?auto_113500 ?auto_113502 ) ( not ( = ?auto_113506 ?auto_113503 ) ) ( not ( = ?auto_113506 ?auto_113504 ) ) ( not ( = ?auto_113506 ?auto_113505 ) ) ( not ( = ?auto_113506 ?auto_113501 ) ) ( not ( = ?auto_113503 ?auto_113504 ) ) ( not ( = ?auto_113503 ?auto_113505 ) ) ( not ( = ?auto_113503 ?auto_113501 ) ) ( not ( = ?auto_113504 ?auto_113505 ) ) ( not ( = ?auto_113504 ?auto_113501 ) ) ( not ( = ?auto_113505 ?auto_113501 ) ) ( not ( = ?auto_113499 ?auto_113505 ) ) ( not ( = ?auto_113499 ?auto_113506 ) ) ( not ( = ?auto_113499 ?auto_113503 ) ) ( not ( = ?auto_113499 ?auto_113504 ) ) ( not ( = ?auto_113502 ?auto_113505 ) ) ( not ( = ?auto_113502 ?auto_113506 ) ) ( not ( = ?auto_113502 ?auto_113503 ) ) ( not ( = ?auto_113502 ?auto_113504 ) ) ( not ( = ?auto_113500 ?auto_113505 ) ) ( not ( = ?auto_113500 ?auto_113506 ) ) ( not ( = ?auto_113500 ?auto_113503 ) ) ( not ( = ?auto_113500 ?auto_113504 ) ) ( ON ?auto_113501 ?auto_113500 ) ( ON ?auto_113505 ?auto_113501 ) ( ON ?auto_113504 ?auto_113505 ) ( ON ?auto_113503 ?auto_113504 ) ( CLEAR ?auto_113503 ) ( HOLDING ?auto_113506 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_113506 )
      ( MAKE-1PILE ?auto_113499 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_113507 - BLOCK
    )
    :vars
    (
      ?auto_113512 - BLOCK
      ?auto_113509 - BLOCK
      ?auto_113510 - BLOCK
      ?auto_113508 - BLOCK
      ?auto_113514 - BLOCK
      ?auto_113513 - BLOCK
      ?auto_113511 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113512 ?auto_113507 ) ( ON-TABLE ?auto_113507 ) ( not ( = ?auto_113507 ?auto_113512 ) ) ( not ( = ?auto_113507 ?auto_113509 ) ) ( not ( = ?auto_113507 ?auto_113510 ) ) ( not ( = ?auto_113512 ?auto_113509 ) ) ( not ( = ?auto_113512 ?auto_113510 ) ) ( not ( = ?auto_113509 ?auto_113510 ) ) ( ON ?auto_113509 ?auto_113512 ) ( not ( = ?auto_113508 ?auto_113514 ) ) ( not ( = ?auto_113508 ?auto_113513 ) ) ( not ( = ?auto_113508 ?auto_113511 ) ) ( not ( = ?auto_113508 ?auto_113510 ) ) ( not ( = ?auto_113514 ?auto_113513 ) ) ( not ( = ?auto_113514 ?auto_113511 ) ) ( not ( = ?auto_113514 ?auto_113510 ) ) ( not ( = ?auto_113513 ?auto_113511 ) ) ( not ( = ?auto_113513 ?auto_113510 ) ) ( not ( = ?auto_113511 ?auto_113510 ) ) ( not ( = ?auto_113507 ?auto_113511 ) ) ( not ( = ?auto_113507 ?auto_113508 ) ) ( not ( = ?auto_113507 ?auto_113514 ) ) ( not ( = ?auto_113507 ?auto_113513 ) ) ( not ( = ?auto_113512 ?auto_113511 ) ) ( not ( = ?auto_113512 ?auto_113508 ) ) ( not ( = ?auto_113512 ?auto_113514 ) ) ( not ( = ?auto_113512 ?auto_113513 ) ) ( not ( = ?auto_113509 ?auto_113511 ) ) ( not ( = ?auto_113509 ?auto_113508 ) ) ( not ( = ?auto_113509 ?auto_113514 ) ) ( not ( = ?auto_113509 ?auto_113513 ) ) ( ON ?auto_113510 ?auto_113509 ) ( ON ?auto_113511 ?auto_113510 ) ( ON ?auto_113513 ?auto_113511 ) ( ON ?auto_113514 ?auto_113513 ) ( ON ?auto_113508 ?auto_113514 ) ( CLEAR ?auto_113508 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_113507 ?auto_113512 ?auto_113509 ?auto_113510 ?auto_113511 ?auto_113513 ?auto_113514 )
      ( MAKE-1PILE ?auto_113507 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_113522 - BLOCK
      ?auto_113523 - BLOCK
      ?auto_113524 - BLOCK
      ?auto_113525 - BLOCK
      ?auto_113526 - BLOCK
      ?auto_113527 - BLOCK
      ?auto_113528 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_113528 ) ( CLEAR ?auto_113527 ) ( ON-TABLE ?auto_113522 ) ( ON ?auto_113523 ?auto_113522 ) ( ON ?auto_113524 ?auto_113523 ) ( ON ?auto_113525 ?auto_113524 ) ( ON ?auto_113526 ?auto_113525 ) ( ON ?auto_113527 ?auto_113526 ) ( not ( = ?auto_113522 ?auto_113523 ) ) ( not ( = ?auto_113522 ?auto_113524 ) ) ( not ( = ?auto_113522 ?auto_113525 ) ) ( not ( = ?auto_113522 ?auto_113526 ) ) ( not ( = ?auto_113522 ?auto_113527 ) ) ( not ( = ?auto_113522 ?auto_113528 ) ) ( not ( = ?auto_113523 ?auto_113524 ) ) ( not ( = ?auto_113523 ?auto_113525 ) ) ( not ( = ?auto_113523 ?auto_113526 ) ) ( not ( = ?auto_113523 ?auto_113527 ) ) ( not ( = ?auto_113523 ?auto_113528 ) ) ( not ( = ?auto_113524 ?auto_113525 ) ) ( not ( = ?auto_113524 ?auto_113526 ) ) ( not ( = ?auto_113524 ?auto_113527 ) ) ( not ( = ?auto_113524 ?auto_113528 ) ) ( not ( = ?auto_113525 ?auto_113526 ) ) ( not ( = ?auto_113525 ?auto_113527 ) ) ( not ( = ?auto_113525 ?auto_113528 ) ) ( not ( = ?auto_113526 ?auto_113527 ) ) ( not ( = ?auto_113526 ?auto_113528 ) ) ( not ( = ?auto_113527 ?auto_113528 ) ) )
    :subtasks
    ( ( !STACK ?auto_113528 ?auto_113527 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_113529 - BLOCK
      ?auto_113530 - BLOCK
      ?auto_113531 - BLOCK
      ?auto_113532 - BLOCK
      ?auto_113533 - BLOCK
      ?auto_113534 - BLOCK
      ?auto_113535 - BLOCK
    )
    :vars
    (
      ?auto_113536 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_113534 ) ( ON-TABLE ?auto_113529 ) ( ON ?auto_113530 ?auto_113529 ) ( ON ?auto_113531 ?auto_113530 ) ( ON ?auto_113532 ?auto_113531 ) ( ON ?auto_113533 ?auto_113532 ) ( ON ?auto_113534 ?auto_113533 ) ( not ( = ?auto_113529 ?auto_113530 ) ) ( not ( = ?auto_113529 ?auto_113531 ) ) ( not ( = ?auto_113529 ?auto_113532 ) ) ( not ( = ?auto_113529 ?auto_113533 ) ) ( not ( = ?auto_113529 ?auto_113534 ) ) ( not ( = ?auto_113529 ?auto_113535 ) ) ( not ( = ?auto_113530 ?auto_113531 ) ) ( not ( = ?auto_113530 ?auto_113532 ) ) ( not ( = ?auto_113530 ?auto_113533 ) ) ( not ( = ?auto_113530 ?auto_113534 ) ) ( not ( = ?auto_113530 ?auto_113535 ) ) ( not ( = ?auto_113531 ?auto_113532 ) ) ( not ( = ?auto_113531 ?auto_113533 ) ) ( not ( = ?auto_113531 ?auto_113534 ) ) ( not ( = ?auto_113531 ?auto_113535 ) ) ( not ( = ?auto_113532 ?auto_113533 ) ) ( not ( = ?auto_113532 ?auto_113534 ) ) ( not ( = ?auto_113532 ?auto_113535 ) ) ( not ( = ?auto_113533 ?auto_113534 ) ) ( not ( = ?auto_113533 ?auto_113535 ) ) ( not ( = ?auto_113534 ?auto_113535 ) ) ( ON ?auto_113535 ?auto_113536 ) ( CLEAR ?auto_113535 ) ( HAND-EMPTY ) ( not ( = ?auto_113529 ?auto_113536 ) ) ( not ( = ?auto_113530 ?auto_113536 ) ) ( not ( = ?auto_113531 ?auto_113536 ) ) ( not ( = ?auto_113532 ?auto_113536 ) ) ( not ( = ?auto_113533 ?auto_113536 ) ) ( not ( = ?auto_113534 ?auto_113536 ) ) ( not ( = ?auto_113535 ?auto_113536 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_113535 ?auto_113536 )
      ( MAKE-7PILE ?auto_113529 ?auto_113530 ?auto_113531 ?auto_113532 ?auto_113533 ?auto_113534 ?auto_113535 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_113537 - BLOCK
      ?auto_113538 - BLOCK
      ?auto_113539 - BLOCK
      ?auto_113540 - BLOCK
      ?auto_113541 - BLOCK
      ?auto_113542 - BLOCK
      ?auto_113543 - BLOCK
    )
    :vars
    (
      ?auto_113544 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_113537 ) ( ON ?auto_113538 ?auto_113537 ) ( ON ?auto_113539 ?auto_113538 ) ( ON ?auto_113540 ?auto_113539 ) ( ON ?auto_113541 ?auto_113540 ) ( not ( = ?auto_113537 ?auto_113538 ) ) ( not ( = ?auto_113537 ?auto_113539 ) ) ( not ( = ?auto_113537 ?auto_113540 ) ) ( not ( = ?auto_113537 ?auto_113541 ) ) ( not ( = ?auto_113537 ?auto_113542 ) ) ( not ( = ?auto_113537 ?auto_113543 ) ) ( not ( = ?auto_113538 ?auto_113539 ) ) ( not ( = ?auto_113538 ?auto_113540 ) ) ( not ( = ?auto_113538 ?auto_113541 ) ) ( not ( = ?auto_113538 ?auto_113542 ) ) ( not ( = ?auto_113538 ?auto_113543 ) ) ( not ( = ?auto_113539 ?auto_113540 ) ) ( not ( = ?auto_113539 ?auto_113541 ) ) ( not ( = ?auto_113539 ?auto_113542 ) ) ( not ( = ?auto_113539 ?auto_113543 ) ) ( not ( = ?auto_113540 ?auto_113541 ) ) ( not ( = ?auto_113540 ?auto_113542 ) ) ( not ( = ?auto_113540 ?auto_113543 ) ) ( not ( = ?auto_113541 ?auto_113542 ) ) ( not ( = ?auto_113541 ?auto_113543 ) ) ( not ( = ?auto_113542 ?auto_113543 ) ) ( ON ?auto_113543 ?auto_113544 ) ( CLEAR ?auto_113543 ) ( not ( = ?auto_113537 ?auto_113544 ) ) ( not ( = ?auto_113538 ?auto_113544 ) ) ( not ( = ?auto_113539 ?auto_113544 ) ) ( not ( = ?auto_113540 ?auto_113544 ) ) ( not ( = ?auto_113541 ?auto_113544 ) ) ( not ( = ?auto_113542 ?auto_113544 ) ) ( not ( = ?auto_113543 ?auto_113544 ) ) ( HOLDING ?auto_113542 ) ( CLEAR ?auto_113541 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_113537 ?auto_113538 ?auto_113539 ?auto_113540 ?auto_113541 ?auto_113542 )
      ( MAKE-7PILE ?auto_113537 ?auto_113538 ?auto_113539 ?auto_113540 ?auto_113541 ?auto_113542 ?auto_113543 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_113545 - BLOCK
      ?auto_113546 - BLOCK
      ?auto_113547 - BLOCK
      ?auto_113548 - BLOCK
      ?auto_113549 - BLOCK
      ?auto_113550 - BLOCK
      ?auto_113551 - BLOCK
    )
    :vars
    (
      ?auto_113552 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_113545 ) ( ON ?auto_113546 ?auto_113545 ) ( ON ?auto_113547 ?auto_113546 ) ( ON ?auto_113548 ?auto_113547 ) ( ON ?auto_113549 ?auto_113548 ) ( not ( = ?auto_113545 ?auto_113546 ) ) ( not ( = ?auto_113545 ?auto_113547 ) ) ( not ( = ?auto_113545 ?auto_113548 ) ) ( not ( = ?auto_113545 ?auto_113549 ) ) ( not ( = ?auto_113545 ?auto_113550 ) ) ( not ( = ?auto_113545 ?auto_113551 ) ) ( not ( = ?auto_113546 ?auto_113547 ) ) ( not ( = ?auto_113546 ?auto_113548 ) ) ( not ( = ?auto_113546 ?auto_113549 ) ) ( not ( = ?auto_113546 ?auto_113550 ) ) ( not ( = ?auto_113546 ?auto_113551 ) ) ( not ( = ?auto_113547 ?auto_113548 ) ) ( not ( = ?auto_113547 ?auto_113549 ) ) ( not ( = ?auto_113547 ?auto_113550 ) ) ( not ( = ?auto_113547 ?auto_113551 ) ) ( not ( = ?auto_113548 ?auto_113549 ) ) ( not ( = ?auto_113548 ?auto_113550 ) ) ( not ( = ?auto_113548 ?auto_113551 ) ) ( not ( = ?auto_113549 ?auto_113550 ) ) ( not ( = ?auto_113549 ?auto_113551 ) ) ( not ( = ?auto_113550 ?auto_113551 ) ) ( ON ?auto_113551 ?auto_113552 ) ( not ( = ?auto_113545 ?auto_113552 ) ) ( not ( = ?auto_113546 ?auto_113552 ) ) ( not ( = ?auto_113547 ?auto_113552 ) ) ( not ( = ?auto_113548 ?auto_113552 ) ) ( not ( = ?auto_113549 ?auto_113552 ) ) ( not ( = ?auto_113550 ?auto_113552 ) ) ( not ( = ?auto_113551 ?auto_113552 ) ) ( CLEAR ?auto_113549 ) ( ON ?auto_113550 ?auto_113551 ) ( CLEAR ?auto_113550 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_113552 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_113552 ?auto_113551 )
      ( MAKE-7PILE ?auto_113545 ?auto_113546 ?auto_113547 ?auto_113548 ?auto_113549 ?auto_113550 ?auto_113551 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_113553 - BLOCK
      ?auto_113554 - BLOCK
      ?auto_113555 - BLOCK
      ?auto_113556 - BLOCK
      ?auto_113557 - BLOCK
      ?auto_113558 - BLOCK
      ?auto_113559 - BLOCK
    )
    :vars
    (
      ?auto_113560 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_113553 ) ( ON ?auto_113554 ?auto_113553 ) ( ON ?auto_113555 ?auto_113554 ) ( ON ?auto_113556 ?auto_113555 ) ( not ( = ?auto_113553 ?auto_113554 ) ) ( not ( = ?auto_113553 ?auto_113555 ) ) ( not ( = ?auto_113553 ?auto_113556 ) ) ( not ( = ?auto_113553 ?auto_113557 ) ) ( not ( = ?auto_113553 ?auto_113558 ) ) ( not ( = ?auto_113553 ?auto_113559 ) ) ( not ( = ?auto_113554 ?auto_113555 ) ) ( not ( = ?auto_113554 ?auto_113556 ) ) ( not ( = ?auto_113554 ?auto_113557 ) ) ( not ( = ?auto_113554 ?auto_113558 ) ) ( not ( = ?auto_113554 ?auto_113559 ) ) ( not ( = ?auto_113555 ?auto_113556 ) ) ( not ( = ?auto_113555 ?auto_113557 ) ) ( not ( = ?auto_113555 ?auto_113558 ) ) ( not ( = ?auto_113555 ?auto_113559 ) ) ( not ( = ?auto_113556 ?auto_113557 ) ) ( not ( = ?auto_113556 ?auto_113558 ) ) ( not ( = ?auto_113556 ?auto_113559 ) ) ( not ( = ?auto_113557 ?auto_113558 ) ) ( not ( = ?auto_113557 ?auto_113559 ) ) ( not ( = ?auto_113558 ?auto_113559 ) ) ( ON ?auto_113559 ?auto_113560 ) ( not ( = ?auto_113553 ?auto_113560 ) ) ( not ( = ?auto_113554 ?auto_113560 ) ) ( not ( = ?auto_113555 ?auto_113560 ) ) ( not ( = ?auto_113556 ?auto_113560 ) ) ( not ( = ?auto_113557 ?auto_113560 ) ) ( not ( = ?auto_113558 ?auto_113560 ) ) ( not ( = ?auto_113559 ?auto_113560 ) ) ( ON ?auto_113558 ?auto_113559 ) ( CLEAR ?auto_113558 ) ( ON-TABLE ?auto_113560 ) ( HOLDING ?auto_113557 ) ( CLEAR ?auto_113556 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_113553 ?auto_113554 ?auto_113555 ?auto_113556 ?auto_113557 )
      ( MAKE-7PILE ?auto_113553 ?auto_113554 ?auto_113555 ?auto_113556 ?auto_113557 ?auto_113558 ?auto_113559 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_113561 - BLOCK
      ?auto_113562 - BLOCK
      ?auto_113563 - BLOCK
      ?auto_113564 - BLOCK
      ?auto_113565 - BLOCK
      ?auto_113566 - BLOCK
      ?auto_113567 - BLOCK
    )
    :vars
    (
      ?auto_113568 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_113561 ) ( ON ?auto_113562 ?auto_113561 ) ( ON ?auto_113563 ?auto_113562 ) ( ON ?auto_113564 ?auto_113563 ) ( not ( = ?auto_113561 ?auto_113562 ) ) ( not ( = ?auto_113561 ?auto_113563 ) ) ( not ( = ?auto_113561 ?auto_113564 ) ) ( not ( = ?auto_113561 ?auto_113565 ) ) ( not ( = ?auto_113561 ?auto_113566 ) ) ( not ( = ?auto_113561 ?auto_113567 ) ) ( not ( = ?auto_113562 ?auto_113563 ) ) ( not ( = ?auto_113562 ?auto_113564 ) ) ( not ( = ?auto_113562 ?auto_113565 ) ) ( not ( = ?auto_113562 ?auto_113566 ) ) ( not ( = ?auto_113562 ?auto_113567 ) ) ( not ( = ?auto_113563 ?auto_113564 ) ) ( not ( = ?auto_113563 ?auto_113565 ) ) ( not ( = ?auto_113563 ?auto_113566 ) ) ( not ( = ?auto_113563 ?auto_113567 ) ) ( not ( = ?auto_113564 ?auto_113565 ) ) ( not ( = ?auto_113564 ?auto_113566 ) ) ( not ( = ?auto_113564 ?auto_113567 ) ) ( not ( = ?auto_113565 ?auto_113566 ) ) ( not ( = ?auto_113565 ?auto_113567 ) ) ( not ( = ?auto_113566 ?auto_113567 ) ) ( ON ?auto_113567 ?auto_113568 ) ( not ( = ?auto_113561 ?auto_113568 ) ) ( not ( = ?auto_113562 ?auto_113568 ) ) ( not ( = ?auto_113563 ?auto_113568 ) ) ( not ( = ?auto_113564 ?auto_113568 ) ) ( not ( = ?auto_113565 ?auto_113568 ) ) ( not ( = ?auto_113566 ?auto_113568 ) ) ( not ( = ?auto_113567 ?auto_113568 ) ) ( ON ?auto_113566 ?auto_113567 ) ( ON-TABLE ?auto_113568 ) ( CLEAR ?auto_113564 ) ( ON ?auto_113565 ?auto_113566 ) ( CLEAR ?auto_113565 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_113568 ?auto_113567 ?auto_113566 )
      ( MAKE-7PILE ?auto_113561 ?auto_113562 ?auto_113563 ?auto_113564 ?auto_113565 ?auto_113566 ?auto_113567 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_113569 - BLOCK
      ?auto_113570 - BLOCK
      ?auto_113571 - BLOCK
      ?auto_113572 - BLOCK
      ?auto_113573 - BLOCK
      ?auto_113574 - BLOCK
      ?auto_113575 - BLOCK
    )
    :vars
    (
      ?auto_113576 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_113569 ) ( ON ?auto_113570 ?auto_113569 ) ( ON ?auto_113571 ?auto_113570 ) ( not ( = ?auto_113569 ?auto_113570 ) ) ( not ( = ?auto_113569 ?auto_113571 ) ) ( not ( = ?auto_113569 ?auto_113572 ) ) ( not ( = ?auto_113569 ?auto_113573 ) ) ( not ( = ?auto_113569 ?auto_113574 ) ) ( not ( = ?auto_113569 ?auto_113575 ) ) ( not ( = ?auto_113570 ?auto_113571 ) ) ( not ( = ?auto_113570 ?auto_113572 ) ) ( not ( = ?auto_113570 ?auto_113573 ) ) ( not ( = ?auto_113570 ?auto_113574 ) ) ( not ( = ?auto_113570 ?auto_113575 ) ) ( not ( = ?auto_113571 ?auto_113572 ) ) ( not ( = ?auto_113571 ?auto_113573 ) ) ( not ( = ?auto_113571 ?auto_113574 ) ) ( not ( = ?auto_113571 ?auto_113575 ) ) ( not ( = ?auto_113572 ?auto_113573 ) ) ( not ( = ?auto_113572 ?auto_113574 ) ) ( not ( = ?auto_113572 ?auto_113575 ) ) ( not ( = ?auto_113573 ?auto_113574 ) ) ( not ( = ?auto_113573 ?auto_113575 ) ) ( not ( = ?auto_113574 ?auto_113575 ) ) ( ON ?auto_113575 ?auto_113576 ) ( not ( = ?auto_113569 ?auto_113576 ) ) ( not ( = ?auto_113570 ?auto_113576 ) ) ( not ( = ?auto_113571 ?auto_113576 ) ) ( not ( = ?auto_113572 ?auto_113576 ) ) ( not ( = ?auto_113573 ?auto_113576 ) ) ( not ( = ?auto_113574 ?auto_113576 ) ) ( not ( = ?auto_113575 ?auto_113576 ) ) ( ON ?auto_113574 ?auto_113575 ) ( ON-TABLE ?auto_113576 ) ( ON ?auto_113573 ?auto_113574 ) ( CLEAR ?auto_113573 ) ( HOLDING ?auto_113572 ) ( CLEAR ?auto_113571 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_113569 ?auto_113570 ?auto_113571 ?auto_113572 )
      ( MAKE-7PILE ?auto_113569 ?auto_113570 ?auto_113571 ?auto_113572 ?auto_113573 ?auto_113574 ?auto_113575 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_113577 - BLOCK
      ?auto_113578 - BLOCK
      ?auto_113579 - BLOCK
      ?auto_113580 - BLOCK
      ?auto_113581 - BLOCK
      ?auto_113582 - BLOCK
      ?auto_113583 - BLOCK
    )
    :vars
    (
      ?auto_113584 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_113577 ) ( ON ?auto_113578 ?auto_113577 ) ( ON ?auto_113579 ?auto_113578 ) ( not ( = ?auto_113577 ?auto_113578 ) ) ( not ( = ?auto_113577 ?auto_113579 ) ) ( not ( = ?auto_113577 ?auto_113580 ) ) ( not ( = ?auto_113577 ?auto_113581 ) ) ( not ( = ?auto_113577 ?auto_113582 ) ) ( not ( = ?auto_113577 ?auto_113583 ) ) ( not ( = ?auto_113578 ?auto_113579 ) ) ( not ( = ?auto_113578 ?auto_113580 ) ) ( not ( = ?auto_113578 ?auto_113581 ) ) ( not ( = ?auto_113578 ?auto_113582 ) ) ( not ( = ?auto_113578 ?auto_113583 ) ) ( not ( = ?auto_113579 ?auto_113580 ) ) ( not ( = ?auto_113579 ?auto_113581 ) ) ( not ( = ?auto_113579 ?auto_113582 ) ) ( not ( = ?auto_113579 ?auto_113583 ) ) ( not ( = ?auto_113580 ?auto_113581 ) ) ( not ( = ?auto_113580 ?auto_113582 ) ) ( not ( = ?auto_113580 ?auto_113583 ) ) ( not ( = ?auto_113581 ?auto_113582 ) ) ( not ( = ?auto_113581 ?auto_113583 ) ) ( not ( = ?auto_113582 ?auto_113583 ) ) ( ON ?auto_113583 ?auto_113584 ) ( not ( = ?auto_113577 ?auto_113584 ) ) ( not ( = ?auto_113578 ?auto_113584 ) ) ( not ( = ?auto_113579 ?auto_113584 ) ) ( not ( = ?auto_113580 ?auto_113584 ) ) ( not ( = ?auto_113581 ?auto_113584 ) ) ( not ( = ?auto_113582 ?auto_113584 ) ) ( not ( = ?auto_113583 ?auto_113584 ) ) ( ON ?auto_113582 ?auto_113583 ) ( ON-TABLE ?auto_113584 ) ( ON ?auto_113581 ?auto_113582 ) ( CLEAR ?auto_113579 ) ( ON ?auto_113580 ?auto_113581 ) ( CLEAR ?auto_113580 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_113584 ?auto_113583 ?auto_113582 ?auto_113581 )
      ( MAKE-7PILE ?auto_113577 ?auto_113578 ?auto_113579 ?auto_113580 ?auto_113581 ?auto_113582 ?auto_113583 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_113585 - BLOCK
      ?auto_113586 - BLOCK
      ?auto_113587 - BLOCK
      ?auto_113588 - BLOCK
      ?auto_113589 - BLOCK
      ?auto_113590 - BLOCK
      ?auto_113591 - BLOCK
    )
    :vars
    (
      ?auto_113592 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_113585 ) ( ON ?auto_113586 ?auto_113585 ) ( not ( = ?auto_113585 ?auto_113586 ) ) ( not ( = ?auto_113585 ?auto_113587 ) ) ( not ( = ?auto_113585 ?auto_113588 ) ) ( not ( = ?auto_113585 ?auto_113589 ) ) ( not ( = ?auto_113585 ?auto_113590 ) ) ( not ( = ?auto_113585 ?auto_113591 ) ) ( not ( = ?auto_113586 ?auto_113587 ) ) ( not ( = ?auto_113586 ?auto_113588 ) ) ( not ( = ?auto_113586 ?auto_113589 ) ) ( not ( = ?auto_113586 ?auto_113590 ) ) ( not ( = ?auto_113586 ?auto_113591 ) ) ( not ( = ?auto_113587 ?auto_113588 ) ) ( not ( = ?auto_113587 ?auto_113589 ) ) ( not ( = ?auto_113587 ?auto_113590 ) ) ( not ( = ?auto_113587 ?auto_113591 ) ) ( not ( = ?auto_113588 ?auto_113589 ) ) ( not ( = ?auto_113588 ?auto_113590 ) ) ( not ( = ?auto_113588 ?auto_113591 ) ) ( not ( = ?auto_113589 ?auto_113590 ) ) ( not ( = ?auto_113589 ?auto_113591 ) ) ( not ( = ?auto_113590 ?auto_113591 ) ) ( ON ?auto_113591 ?auto_113592 ) ( not ( = ?auto_113585 ?auto_113592 ) ) ( not ( = ?auto_113586 ?auto_113592 ) ) ( not ( = ?auto_113587 ?auto_113592 ) ) ( not ( = ?auto_113588 ?auto_113592 ) ) ( not ( = ?auto_113589 ?auto_113592 ) ) ( not ( = ?auto_113590 ?auto_113592 ) ) ( not ( = ?auto_113591 ?auto_113592 ) ) ( ON ?auto_113590 ?auto_113591 ) ( ON-TABLE ?auto_113592 ) ( ON ?auto_113589 ?auto_113590 ) ( ON ?auto_113588 ?auto_113589 ) ( CLEAR ?auto_113588 ) ( HOLDING ?auto_113587 ) ( CLEAR ?auto_113586 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_113585 ?auto_113586 ?auto_113587 )
      ( MAKE-7PILE ?auto_113585 ?auto_113586 ?auto_113587 ?auto_113588 ?auto_113589 ?auto_113590 ?auto_113591 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_113593 - BLOCK
      ?auto_113594 - BLOCK
      ?auto_113595 - BLOCK
      ?auto_113596 - BLOCK
      ?auto_113597 - BLOCK
      ?auto_113598 - BLOCK
      ?auto_113599 - BLOCK
    )
    :vars
    (
      ?auto_113600 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_113593 ) ( ON ?auto_113594 ?auto_113593 ) ( not ( = ?auto_113593 ?auto_113594 ) ) ( not ( = ?auto_113593 ?auto_113595 ) ) ( not ( = ?auto_113593 ?auto_113596 ) ) ( not ( = ?auto_113593 ?auto_113597 ) ) ( not ( = ?auto_113593 ?auto_113598 ) ) ( not ( = ?auto_113593 ?auto_113599 ) ) ( not ( = ?auto_113594 ?auto_113595 ) ) ( not ( = ?auto_113594 ?auto_113596 ) ) ( not ( = ?auto_113594 ?auto_113597 ) ) ( not ( = ?auto_113594 ?auto_113598 ) ) ( not ( = ?auto_113594 ?auto_113599 ) ) ( not ( = ?auto_113595 ?auto_113596 ) ) ( not ( = ?auto_113595 ?auto_113597 ) ) ( not ( = ?auto_113595 ?auto_113598 ) ) ( not ( = ?auto_113595 ?auto_113599 ) ) ( not ( = ?auto_113596 ?auto_113597 ) ) ( not ( = ?auto_113596 ?auto_113598 ) ) ( not ( = ?auto_113596 ?auto_113599 ) ) ( not ( = ?auto_113597 ?auto_113598 ) ) ( not ( = ?auto_113597 ?auto_113599 ) ) ( not ( = ?auto_113598 ?auto_113599 ) ) ( ON ?auto_113599 ?auto_113600 ) ( not ( = ?auto_113593 ?auto_113600 ) ) ( not ( = ?auto_113594 ?auto_113600 ) ) ( not ( = ?auto_113595 ?auto_113600 ) ) ( not ( = ?auto_113596 ?auto_113600 ) ) ( not ( = ?auto_113597 ?auto_113600 ) ) ( not ( = ?auto_113598 ?auto_113600 ) ) ( not ( = ?auto_113599 ?auto_113600 ) ) ( ON ?auto_113598 ?auto_113599 ) ( ON-TABLE ?auto_113600 ) ( ON ?auto_113597 ?auto_113598 ) ( ON ?auto_113596 ?auto_113597 ) ( CLEAR ?auto_113594 ) ( ON ?auto_113595 ?auto_113596 ) ( CLEAR ?auto_113595 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_113600 ?auto_113599 ?auto_113598 ?auto_113597 ?auto_113596 )
      ( MAKE-7PILE ?auto_113593 ?auto_113594 ?auto_113595 ?auto_113596 ?auto_113597 ?auto_113598 ?auto_113599 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_113601 - BLOCK
      ?auto_113602 - BLOCK
      ?auto_113603 - BLOCK
      ?auto_113604 - BLOCK
      ?auto_113605 - BLOCK
      ?auto_113606 - BLOCK
      ?auto_113607 - BLOCK
    )
    :vars
    (
      ?auto_113608 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_113601 ) ( not ( = ?auto_113601 ?auto_113602 ) ) ( not ( = ?auto_113601 ?auto_113603 ) ) ( not ( = ?auto_113601 ?auto_113604 ) ) ( not ( = ?auto_113601 ?auto_113605 ) ) ( not ( = ?auto_113601 ?auto_113606 ) ) ( not ( = ?auto_113601 ?auto_113607 ) ) ( not ( = ?auto_113602 ?auto_113603 ) ) ( not ( = ?auto_113602 ?auto_113604 ) ) ( not ( = ?auto_113602 ?auto_113605 ) ) ( not ( = ?auto_113602 ?auto_113606 ) ) ( not ( = ?auto_113602 ?auto_113607 ) ) ( not ( = ?auto_113603 ?auto_113604 ) ) ( not ( = ?auto_113603 ?auto_113605 ) ) ( not ( = ?auto_113603 ?auto_113606 ) ) ( not ( = ?auto_113603 ?auto_113607 ) ) ( not ( = ?auto_113604 ?auto_113605 ) ) ( not ( = ?auto_113604 ?auto_113606 ) ) ( not ( = ?auto_113604 ?auto_113607 ) ) ( not ( = ?auto_113605 ?auto_113606 ) ) ( not ( = ?auto_113605 ?auto_113607 ) ) ( not ( = ?auto_113606 ?auto_113607 ) ) ( ON ?auto_113607 ?auto_113608 ) ( not ( = ?auto_113601 ?auto_113608 ) ) ( not ( = ?auto_113602 ?auto_113608 ) ) ( not ( = ?auto_113603 ?auto_113608 ) ) ( not ( = ?auto_113604 ?auto_113608 ) ) ( not ( = ?auto_113605 ?auto_113608 ) ) ( not ( = ?auto_113606 ?auto_113608 ) ) ( not ( = ?auto_113607 ?auto_113608 ) ) ( ON ?auto_113606 ?auto_113607 ) ( ON-TABLE ?auto_113608 ) ( ON ?auto_113605 ?auto_113606 ) ( ON ?auto_113604 ?auto_113605 ) ( ON ?auto_113603 ?auto_113604 ) ( CLEAR ?auto_113603 ) ( HOLDING ?auto_113602 ) ( CLEAR ?auto_113601 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_113601 ?auto_113602 )
      ( MAKE-7PILE ?auto_113601 ?auto_113602 ?auto_113603 ?auto_113604 ?auto_113605 ?auto_113606 ?auto_113607 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_113609 - BLOCK
      ?auto_113610 - BLOCK
      ?auto_113611 - BLOCK
      ?auto_113612 - BLOCK
      ?auto_113613 - BLOCK
      ?auto_113614 - BLOCK
      ?auto_113615 - BLOCK
    )
    :vars
    (
      ?auto_113616 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_113609 ) ( not ( = ?auto_113609 ?auto_113610 ) ) ( not ( = ?auto_113609 ?auto_113611 ) ) ( not ( = ?auto_113609 ?auto_113612 ) ) ( not ( = ?auto_113609 ?auto_113613 ) ) ( not ( = ?auto_113609 ?auto_113614 ) ) ( not ( = ?auto_113609 ?auto_113615 ) ) ( not ( = ?auto_113610 ?auto_113611 ) ) ( not ( = ?auto_113610 ?auto_113612 ) ) ( not ( = ?auto_113610 ?auto_113613 ) ) ( not ( = ?auto_113610 ?auto_113614 ) ) ( not ( = ?auto_113610 ?auto_113615 ) ) ( not ( = ?auto_113611 ?auto_113612 ) ) ( not ( = ?auto_113611 ?auto_113613 ) ) ( not ( = ?auto_113611 ?auto_113614 ) ) ( not ( = ?auto_113611 ?auto_113615 ) ) ( not ( = ?auto_113612 ?auto_113613 ) ) ( not ( = ?auto_113612 ?auto_113614 ) ) ( not ( = ?auto_113612 ?auto_113615 ) ) ( not ( = ?auto_113613 ?auto_113614 ) ) ( not ( = ?auto_113613 ?auto_113615 ) ) ( not ( = ?auto_113614 ?auto_113615 ) ) ( ON ?auto_113615 ?auto_113616 ) ( not ( = ?auto_113609 ?auto_113616 ) ) ( not ( = ?auto_113610 ?auto_113616 ) ) ( not ( = ?auto_113611 ?auto_113616 ) ) ( not ( = ?auto_113612 ?auto_113616 ) ) ( not ( = ?auto_113613 ?auto_113616 ) ) ( not ( = ?auto_113614 ?auto_113616 ) ) ( not ( = ?auto_113615 ?auto_113616 ) ) ( ON ?auto_113614 ?auto_113615 ) ( ON-TABLE ?auto_113616 ) ( ON ?auto_113613 ?auto_113614 ) ( ON ?auto_113612 ?auto_113613 ) ( ON ?auto_113611 ?auto_113612 ) ( CLEAR ?auto_113609 ) ( ON ?auto_113610 ?auto_113611 ) ( CLEAR ?auto_113610 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_113616 ?auto_113615 ?auto_113614 ?auto_113613 ?auto_113612 ?auto_113611 )
      ( MAKE-7PILE ?auto_113609 ?auto_113610 ?auto_113611 ?auto_113612 ?auto_113613 ?auto_113614 ?auto_113615 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_113617 - BLOCK
      ?auto_113618 - BLOCK
      ?auto_113619 - BLOCK
      ?auto_113620 - BLOCK
      ?auto_113621 - BLOCK
      ?auto_113622 - BLOCK
      ?auto_113623 - BLOCK
    )
    :vars
    (
      ?auto_113624 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_113617 ?auto_113618 ) ) ( not ( = ?auto_113617 ?auto_113619 ) ) ( not ( = ?auto_113617 ?auto_113620 ) ) ( not ( = ?auto_113617 ?auto_113621 ) ) ( not ( = ?auto_113617 ?auto_113622 ) ) ( not ( = ?auto_113617 ?auto_113623 ) ) ( not ( = ?auto_113618 ?auto_113619 ) ) ( not ( = ?auto_113618 ?auto_113620 ) ) ( not ( = ?auto_113618 ?auto_113621 ) ) ( not ( = ?auto_113618 ?auto_113622 ) ) ( not ( = ?auto_113618 ?auto_113623 ) ) ( not ( = ?auto_113619 ?auto_113620 ) ) ( not ( = ?auto_113619 ?auto_113621 ) ) ( not ( = ?auto_113619 ?auto_113622 ) ) ( not ( = ?auto_113619 ?auto_113623 ) ) ( not ( = ?auto_113620 ?auto_113621 ) ) ( not ( = ?auto_113620 ?auto_113622 ) ) ( not ( = ?auto_113620 ?auto_113623 ) ) ( not ( = ?auto_113621 ?auto_113622 ) ) ( not ( = ?auto_113621 ?auto_113623 ) ) ( not ( = ?auto_113622 ?auto_113623 ) ) ( ON ?auto_113623 ?auto_113624 ) ( not ( = ?auto_113617 ?auto_113624 ) ) ( not ( = ?auto_113618 ?auto_113624 ) ) ( not ( = ?auto_113619 ?auto_113624 ) ) ( not ( = ?auto_113620 ?auto_113624 ) ) ( not ( = ?auto_113621 ?auto_113624 ) ) ( not ( = ?auto_113622 ?auto_113624 ) ) ( not ( = ?auto_113623 ?auto_113624 ) ) ( ON ?auto_113622 ?auto_113623 ) ( ON-TABLE ?auto_113624 ) ( ON ?auto_113621 ?auto_113622 ) ( ON ?auto_113620 ?auto_113621 ) ( ON ?auto_113619 ?auto_113620 ) ( ON ?auto_113618 ?auto_113619 ) ( CLEAR ?auto_113618 ) ( HOLDING ?auto_113617 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_113617 )
      ( MAKE-7PILE ?auto_113617 ?auto_113618 ?auto_113619 ?auto_113620 ?auto_113621 ?auto_113622 ?auto_113623 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_113625 - BLOCK
      ?auto_113626 - BLOCK
      ?auto_113627 - BLOCK
      ?auto_113628 - BLOCK
      ?auto_113629 - BLOCK
      ?auto_113630 - BLOCK
      ?auto_113631 - BLOCK
    )
    :vars
    (
      ?auto_113632 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_113625 ?auto_113626 ) ) ( not ( = ?auto_113625 ?auto_113627 ) ) ( not ( = ?auto_113625 ?auto_113628 ) ) ( not ( = ?auto_113625 ?auto_113629 ) ) ( not ( = ?auto_113625 ?auto_113630 ) ) ( not ( = ?auto_113625 ?auto_113631 ) ) ( not ( = ?auto_113626 ?auto_113627 ) ) ( not ( = ?auto_113626 ?auto_113628 ) ) ( not ( = ?auto_113626 ?auto_113629 ) ) ( not ( = ?auto_113626 ?auto_113630 ) ) ( not ( = ?auto_113626 ?auto_113631 ) ) ( not ( = ?auto_113627 ?auto_113628 ) ) ( not ( = ?auto_113627 ?auto_113629 ) ) ( not ( = ?auto_113627 ?auto_113630 ) ) ( not ( = ?auto_113627 ?auto_113631 ) ) ( not ( = ?auto_113628 ?auto_113629 ) ) ( not ( = ?auto_113628 ?auto_113630 ) ) ( not ( = ?auto_113628 ?auto_113631 ) ) ( not ( = ?auto_113629 ?auto_113630 ) ) ( not ( = ?auto_113629 ?auto_113631 ) ) ( not ( = ?auto_113630 ?auto_113631 ) ) ( ON ?auto_113631 ?auto_113632 ) ( not ( = ?auto_113625 ?auto_113632 ) ) ( not ( = ?auto_113626 ?auto_113632 ) ) ( not ( = ?auto_113627 ?auto_113632 ) ) ( not ( = ?auto_113628 ?auto_113632 ) ) ( not ( = ?auto_113629 ?auto_113632 ) ) ( not ( = ?auto_113630 ?auto_113632 ) ) ( not ( = ?auto_113631 ?auto_113632 ) ) ( ON ?auto_113630 ?auto_113631 ) ( ON-TABLE ?auto_113632 ) ( ON ?auto_113629 ?auto_113630 ) ( ON ?auto_113628 ?auto_113629 ) ( ON ?auto_113627 ?auto_113628 ) ( ON ?auto_113626 ?auto_113627 ) ( ON ?auto_113625 ?auto_113626 ) ( CLEAR ?auto_113625 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_113632 ?auto_113631 ?auto_113630 ?auto_113629 ?auto_113628 ?auto_113627 ?auto_113626 )
      ( MAKE-7PILE ?auto_113625 ?auto_113626 ?auto_113627 ?auto_113628 ?auto_113629 ?auto_113630 ?auto_113631 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_113639 - BLOCK
      ?auto_113640 - BLOCK
      ?auto_113641 - BLOCK
      ?auto_113642 - BLOCK
      ?auto_113643 - BLOCK
      ?auto_113644 - BLOCK
    )
    :vars
    (
      ?auto_113645 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113645 ?auto_113644 ) ( CLEAR ?auto_113645 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_113639 ) ( ON ?auto_113640 ?auto_113639 ) ( ON ?auto_113641 ?auto_113640 ) ( ON ?auto_113642 ?auto_113641 ) ( ON ?auto_113643 ?auto_113642 ) ( ON ?auto_113644 ?auto_113643 ) ( not ( = ?auto_113639 ?auto_113640 ) ) ( not ( = ?auto_113639 ?auto_113641 ) ) ( not ( = ?auto_113639 ?auto_113642 ) ) ( not ( = ?auto_113639 ?auto_113643 ) ) ( not ( = ?auto_113639 ?auto_113644 ) ) ( not ( = ?auto_113639 ?auto_113645 ) ) ( not ( = ?auto_113640 ?auto_113641 ) ) ( not ( = ?auto_113640 ?auto_113642 ) ) ( not ( = ?auto_113640 ?auto_113643 ) ) ( not ( = ?auto_113640 ?auto_113644 ) ) ( not ( = ?auto_113640 ?auto_113645 ) ) ( not ( = ?auto_113641 ?auto_113642 ) ) ( not ( = ?auto_113641 ?auto_113643 ) ) ( not ( = ?auto_113641 ?auto_113644 ) ) ( not ( = ?auto_113641 ?auto_113645 ) ) ( not ( = ?auto_113642 ?auto_113643 ) ) ( not ( = ?auto_113642 ?auto_113644 ) ) ( not ( = ?auto_113642 ?auto_113645 ) ) ( not ( = ?auto_113643 ?auto_113644 ) ) ( not ( = ?auto_113643 ?auto_113645 ) ) ( not ( = ?auto_113644 ?auto_113645 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_113645 ?auto_113644 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_113661 - BLOCK
      ?auto_113662 - BLOCK
      ?auto_113663 - BLOCK
      ?auto_113664 - BLOCK
      ?auto_113665 - BLOCK
      ?auto_113666 - BLOCK
    )
    :vars
    (
      ?auto_113667 - BLOCK
      ?auto_113668 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_113661 ) ( ON ?auto_113662 ?auto_113661 ) ( ON ?auto_113663 ?auto_113662 ) ( ON ?auto_113664 ?auto_113663 ) ( ON ?auto_113665 ?auto_113664 ) ( not ( = ?auto_113661 ?auto_113662 ) ) ( not ( = ?auto_113661 ?auto_113663 ) ) ( not ( = ?auto_113661 ?auto_113664 ) ) ( not ( = ?auto_113661 ?auto_113665 ) ) ( not ( = ?auto_113661 ?auto_113666 ) ) ( not ( = ?auto_113661 ?auto_113667 ) ) ( not ( = ?auto_113662 ?auto_113663 ) ) ( not ( = ?auto_113662 ?auto_113664 ) ) ( not ( = ?auto_113662 ?auto_113665 ) ) ( not ( = ?auto_113662 ?auto_113666 ) ) ( not ( = ?auto_113662 ?auto_113667 ) ) ( not ( = ?auto_113663 ?auto_113664 ) ) ( not ( = ?auto_113663 ?auto_113665 ) ) ( not ( = ?auto_113663 ?auto_113666 ) ) ( not ( = ?auto_113663 ?auto_113667 ) ) ( not ( = ?auto_113664 ?auto_113665 ) ) ( not ( = ?auto_113664 ?auto_113666 ) ) ( not ( = ?auto_113664 ?auto_113667 ) ) ( not ( = ?auto_113665 ?auto_113666 ) ) ( not ( = ?auto_113665 ?auto_113667 ) ) ( not ( = ?auto_113666 ?auto_113667 ) ) ( ON ?auto_113667 ?auto_113668 ) ( CLEAR ?auto_113667 ) ( not ( = ?auto_113661 ?auto_113668 ) ) ( not ( = ?auto_113662 ?auto_113668 ) ) ( not ( = ?auto_113663 ?auto_113668 ) ) ( not ( = ?auto_113664 ?auto_113668 ) ) ( not ( = ?auto_113665 ?auto_113668 ) ) ( not ( = ?auto_113666 ?auto_113668 ) ) ( not ( = ?auto_113667 ?auto_113668 ) ) ( HOLDING ?auto_113666 ) ( CLEAR ?auto_113665 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_113661 ?auto_113662 ?auto_113663 ?auto_113664 ?auto_113665 ?auto_113666 ?auto_113667 )
      ( MAKE-6PILE ?auto_113661 ?auto_113662 ?auto_113663 ?auto_113664 ?auto_113665 ?auto_113666 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_113669 - BLOCK
      ?auto_113670 - BLOCK
      ?auto_113671 - BLOCK
      ?auto_113672 - BLOCK
      ?auto_113673 - BLOCK
      ?auto_113674 - BLOCK
    )
    :vars
    (
      ?auto_113676 - BLOCK
      ?auto_113675 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_113669 ) ( ON ?auto_113670 ?auto_113669 ) ( ON ?auto_113671 ?auto_113670 ) ( ON ?auto_113672 ?auto_113671 ) ( ON ?auto_113673 ?auto_113672 ) ( not ( = ?auto_113669 ?auto_113670 ) ) ( not ( = ?auto_113669 ?auto_113671 ) ) ( not ( = ?auto_113669 ?auto_113672 ) ) ( not ( = ?auto_113669 ?auto_113673 ) ) ( not ( = ?auto_113669 ?auto_113674 ) ) ( not ( = ?auto_113669 ?auto_113676 ) ) ( not ( = ?auto_113670 ?auto_113671 ) ) ( not ( = ?auto_113670 ?auto_113672 ) ) ( not ( = ?auto_113670 ?auto_113673 ) ) ( not ( = ?auto_113670 ?auto_113674 ) ) ( not ( = ?auto_113670 ?auto_113676 ) ) ( not ( = ?auto_113671 ?auto_113672 ) ) ( not ( = ?auto_113671 ?auto_113673 ) ) ( not ( = ?auto_113671 ?auto_113674 ) ) ( not ( = ?auto_113671 ?auto_113676 ) ) ( not ( = ?auto_113672 ?auto_113673 ) ) ( not ( = ?auto_113672 ?auto_113674 ) ) ( not ( = ?auto_113672 ?auto_113676 ) ) ( not ( = ?auto_113673 ?auto_113674 ) ) ( not ( = ?auto_113673 ?auto_113676 ) ) ( not ( = ?auto_113674 ?auto_113676 ) ) ( ON ?auto_113676 ?auto_113675 ) ( not ( = ?auto_113669 ?auto_113675 ) ) ( not ( = ?auto_113670 ?auto_113675 ) ) ( not ( = ?auto_113671 ?auto_113675 ) ) ( not ( = ?auto_113672 ?auto_113675 ) ) ( not ( = ?auto_113673 ?auto_113675 ) ) ( not ( = ?auto_113674 ?auto_113675 ) ) ( not ( = ?auto_113676 ?auto_113675 ) ) ( CLEAR ?auto_113673 ) ( ON ?auto_113674 ?auto_113676 ) ( CLEAR ?auto_113674 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_113675 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_113675 ?auto_113676 )
      ( MAKE-6PILE ?auto_113669 ?auto_113670 ?auto_113671 ?auto_113672 ?auto_113673 ?auto_113674 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_113677 - BLOCK
      ?auto_113678 - BLOCK
      ?auto_113679 - BLOCK
      ?auto_113680 - BLOCK
      ?auto_113681 - BLOCK
      ?auto_113682 - BLOCK
    )
    :vars
    (
      ?auto_113683 - BLOCK
      ?auto_113684 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_113677 ) ( ON ?auto_113678 ?auto_113677 ) ( ON ?auto_113679 ?auto_113678 ) ( ON ?auto_113680 ?auto_113679 ) ( not ( = ?auto_113677 ?auto_113678 ) ) ( not ( = ?auto_113677 ?auto_113679 ) ) ( not ( = ?auto_113677 ?auto_113680 ) ) ( not ( = ?auto_113677 ?auto_113681 ) ) ( not ( = ?auto_113677 ?auto_113682 ) ) ( not ( = ?auto_113677 ?auto_113683 ) ) ( not ( = ?auto_113678 ?auto_113679 ) ) ( not ( = ?auto_113678 ?auto_113680 ) ) ( not ( = ?auto_113678 ?auto_113681 ) ) ( not ( = ?auto_113678 ?auto_113682 ) ) ( not ( = ?auto_113678 ?auto_113683 ) ) ( not ( = ?auto_113679 ?auto_113680 ) ) ( not ( = ?auto_113679 ?auto_113681 ) ) ( not ( = ?auto_113679 ?auto_113682 ) ) ( not ( = ?auto_113679 ?auto_113683 ) ) ( not ( = ?auto_113680 ?auto_113681 ) ) ( not ( = ?auto_113680 ?auto_113682 ) ) ( not ( = ?auto_113680 ?auto_113683 ) ) ( not ( = ?auto_113681 ?auto_113682 ) ) ( not ( = ?auto_113681 ?auto_113683 ) ) ( not ( = ?auto_113682 ?auto_113683 ) ) ( ON ?auto_113683 ?auto_113684 ) ( not ( = ?auto_113677 ?auto_113684 ) ) ( not ( = ?auto_113678 ?auto_113684 ) ) ( not ( = ?auto_113679 ?auto_113684 ) ) ( not ( = ?auto_113680 ?auto_113684 ) ) ( not ( = ?auto_113681 ?auto_113684 ) ) ( not ( = ?auto_113682 ?auto_113684 ) ) ( not ( = ?auto_113683 ?auto_113684 ) ) ( ON ?auto_113682 ?auto_113683 ) ( CLEAR ?auto_113682 ) ( ON-TABLE ?auto_113684 ) ( HOLDING ?auto_113681 ) ( CLEAR ?auto_113680 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_113677 ?auto_113678 ?auto_113679 ?auto_113680 ?auto_113681 )
      ( MAKE-6PILE ?auto_113677 ?auto_113678 ?auto_113679 ?auto_113680 ?auto_113681 ?auto_113682 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_113685 - BLOCK
      ?auto_113686 - BLOCK
      ?auto_113687 - BLOCK
      ?auto_113688 - BLOCK
      ?auto_113689 - BLOCK
      ?auto_113690 - BLOCK
    )
    :vars
    (
      ?auto_113692 - BLOCK
      ?auto_113691 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_113685 ) ( ON ?auto_113686 ?auto_113685 ) ( ON ?auto_113687 ?auto_113686 ) ( ON ?auto_113688 ?auto_113687 ) ( not ( = ?auto_113685 ?auto_113686 ) ) ( not ( = ?auto_113685 ?auto_113687 ) ) ( not ( = ?auto_113685 ?auto_113688 ) ) ( not ( = ?auto_113685 ?auto_113689 ) ) ( not ( = ?auto_113685 ?auto_113690 ) ) ( not ( = ?auto_113685 ?auto_113692 ) ) ( not ( = ?auto_113686 ?auto_113687 ) ) ( not ( = ?auto_113686 ?auto_113688 ) ) ( not ( = ?auto_113686 ?auto_113689 ) ) ( not ( = ?auto_113686 ?auto_113690 ) ) ( not ( = ?auto_113686 ?auto_113692 ) ) ( not ( = ?auto_113687 ?auto_113688 ) ) ( not ( = ?auto_113687 ?auto_113689 ) ) ( not ( = ?auto_113687 ?auto_113690 ) ) ( not ( = ?auto_113687 ?auto_113692 ) ) ( not ( = ?auto_113688 ?auto_113689 ) ) ( not ( = ?auto_113688 ?auto_113690 ) ) ( not ( = ?auto_113688 ?auto_113692 ) ) ( not ( = ?auto_113689 ?auto_113690 ) ) ( not ( = ?auto_113689 ?auto_113692 ) ) ( not ( = ?auto_113690 ?auto_113692 ) ) ( ON ?auto_113692 ?auto_113691 ) ( not ( = ?auto_113685 ?auto_113691 ) ) ( not ( = ?auto_113686 ?auto_113691 ) ) ( not ( = ?auto_113687 ?auto_113691 ) ) ( not ( = ?auto_113688 ?auto_113691 ) ) ( not ( = ?auto_113689 ?auto_113691 ) ) ( not ( = ?auto_113690 ?auto_113691 ) ) ( not ( = ?auto_113692 ?auto_113691 ) ) ( ON ?auto_113690 ?auto_113692 ) ( ON-TABLE ?auto_113691 ) ( CLEAR ?auto_113688 ) ( ON ?auto_113689 ?auto_113690 ) ( CLEAR ?auto_113689 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_113691 ?auto_113692 ?auto_113690 )
      ( MAKE-6PILE ?auto_113685 ?auto_113686 ?auto_113687 ?auto_113688 ?auto_113689 ?auto_113690 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_113693 - BLOCK
      ?auto_113694 - BLOCK
      ?auto_113695 - BLOCK
      ?auto_113696 - BLOCK
      ?auto_113697 - BLOCK
      ?auto_113698 - BLOCK
    )
    :vars
    (
      ?auto_113700 - BLOCK
      ?auto_113699 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_113693 ) ( ON ?auto_113694 ?auto_113693 ) ( ON ?auto_113695 ?auto_113694 ) ( not ( = ?auto_113693 ?auto_113694 ) ) ( not ( = ?auto_113693 ?auto_113695 ) ) ( not ( = ?auto_113693 ?auto_113696 ) ) ( not ( = ?auto_113693 ?auto_113697 ) ) ( not ( = ?auto_113693 ?auto_113698 ) ) ( not ( = ?auto_113693 ?auto_113700 ) ) ( not ( = ?auto_113694 ?auto_113695 ) ) ( not ( = ?auto_113694 ?auto_113696 ) ) ( not ( = ?auto_113694 ?auto_113697 ) ) ( not ( = ?auto_113694 ?auto_113698 ) ) ( not ( = ?auto_113694 ?auto_113700 ) ) ( not ( = ?auto_113695 ?auto_113696 ) ) ( not ( = ?auto_113695 ?auto_113697 ) ) ( not ( = ?auto_113695 ?auto_113698 ) ) ( not ( = ?auto_113695 ?auto_113700 ) ) ( not ( = ?auto_113696 ?auto_113697 ) ) ( not ( = ?auto_113696 ?auto_113698 ) ) ( not ( = ?auto_113696 ?auto_113700 ) ) ( not ( = ?auto_113697 ?auto_113698 ) ) ( not ( = ?auto_113697 ?auto_113700 ) ) ( not ( = ?auto_113698 ?auto_113700 ) ) ( ON ?auto_113700 ?auto_113699 ) ( not ( = ?auto_113693 ?auto_113699 ) ) ( not ( = ?auto_113694 ?auto_113699 ) ) ( not ( = ?auto_113695 ?auto_113699 ) ) ( not ( = ?auto_113696 ?auto_113699 ) ) ( not ( = ?auto_113697 ?auto_113699 ) ) ( not ( = ?auto_113698 ?auto_113699 ) ) ( not ( = ?auto_113700 ?auto_113699 ) ) ( ON ?auto_113698 ?auto_113700 ) ( ON-TABLE ?auto_113699 ) ( ON ?auto_113697 ?auto_113698 ) ( CLEAR ?auto_113697 ) ( HOLDING ?auto_113696 ) ( CLEAR ?auto_113695 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_113693 ?auto_113694 ?auto_113695 ?auto_113696 )
      ( MAKE-6PILE ?auto_113693 ?auto_113694 ?auto_113695 ?auto_113696 ?auto_113697 ?auto_113698 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_113701 - BLOCK
      ?auto_113702 - BLOCK
      ?auto_113703 - BLOCK
      ?auto_113704 - BLOCK
      ?auto_113705 - BLOCK
      ?auto_113706 - BLOCK
    )
    :vars
    (
      ?auto_113708 - BLOCK
      ?auto_113707 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_113701 ) ( ON ?auto_113702 ?auto_113701 ) ( ON ?auto_113703 ?auto_113702 ) ( not ( = ?auto_113701 ?auto_113702 ) ) ( not ( = ?auto_113701 ?auto_113703 ) ) ( not ( = ?auto_113701 ?auto_113704 ) ) ( not ( = ?auto_113701 ?auto_113705 ) ) ( not ( = ?auto_113701 ?auto_113706 ) ) ( not ( = ?auto_113701 ?auto_113708 ) ) ( not ( = ?auto_113702 ?auto_113703 ) ) ( not ( = ?auto_113702 ?auto_113704 ) ) ( not ( = ?auto_113702 ?auto_113705 ) ) ( not ( = ?auto_113702 ?auto_113706 ) ) ( not ( = ?auto_113702 ?auto_113708 ) ) ( not ( = ?auto_113703 ?auto_113704 ) ) ( not ( = ?auto_113703 ?auto_113705 ) ) ( not ( = ?auto_113703 ?auto_113706 ) ) ( not ( = ?auto_113703 ?auto_113708 ) ) ( not ( = ?auto_113704 ?auto_113705 ) ) ( not ( = ?auto_113704 ?auto_113706 ) ) ( not ( = ?auto_113704 ?auto_113708 ) ) ( not ( = ?auto_113705 ?auto_113706 ) ) ( not ( = ?auto_113705 ?auto_113708 ) ) ( not ( = ?auto_113706 ?auto_113708 ) ) ( ON ?auto_113708 ?auto_113707 ) ( not ( = ?auto_113701 ?auto_113707 ) ) ( not ( = ?auto_113702 ?auto_113707 ) ) ( not ( = ?auto_113703 ?auto_113707 ) ) ( not ( = ?auto_113704 ?auto_113707 ) ) ( not ( = ?auto_113705 ?auto_113707 ) ) ( not ( = ?auto_113706 ?auto_113707 ) ) ( not ( = ?auto_113708 ?auto_113707 ) ) ( ON ?auto_113706 ?auto_113708 ) ( ON-TABLE ?auto_113707 ) ( ON ?auto_113705 ?auto_113706 ) ( CLEAR ?auto_113703 ) ( ON ?auto_113704 ?auto_113705 ) ( CLEAR ?auto_113704 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_113707 ?auto_113708 ?auto_113706 ?auto_113705 )
      ( MAKE-6PILE ?auto_113701 ?auto_113702 ?auto_113703 ?auto_113704 ?auto_113705 ?auto_113706 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_113709 - BLOCK
      ?auto_113710 - BLOCK
      ?auto_113711 - BLOCK
      ?auto_113712 - BLOCK
      ?auto_113713 - BLOCK
      ?auto_113714 - BLOCK
    )
    :vars
    (
      ?auto_113715 - BLOCK
      ?auto_113716 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_113709 ) ( ON ?auto_113710 ?auto_113709 ) ( not ( = ?auto_113709 ?auto_113710 ) ) ( not ( = ?auto_113709 ?auto_113711 ) ) ( not ( = ?auto_113709 ?auto_113712 ) ) ( not ( = ?auto_113709 ?auto_113713 ) ) ( not ( = ?auto_113709 ?auto_113714 ) ) ( not ( = ?auto_113709 ?auto_113715 ) ) ( not ( = ?auto_113710 ?auto_113711 ) ) ( not ( = ?auto_113710 ?auto_113712 ) ) ( not ( = ?auto_113710 ?auto_113713 ) ) ( not ( = ?auto_113710 ?auto_113714 ) ) ( not ( = ?auto_113710 ?auto_113715 ) ) ( not ( = ?auto_113711 ?auto_113712 ) ) ( not ( = ?auto_113711 ?auto_113713 ) ) ( not ( = ?auto_113711 ?auto_113714 ) ) ( not ( = ?auto_113711 ?auto_113715 ) ) ( not ( = ?auto_113712 ?auto_113713 ) ) ( not ( = ?auto_113712 ?auto_113714 ) ) ( not ( = ?auto_113712 ?auto_113715 ) ) ( not ( = ?auto_113713 ?auto_113714 ) ) ( not ( = ?auto_113713 ?auto_113715 ) ) ( not ( = ?auto_113714 ?auto_113715 ) ) ( ON ?auto_113715 ?auto_113716 ) ( not ( = ?auto_113709 ?auto_113716 ) ) ( not ( = ?auto_113710 ?auto_113716 ) ) ( not ( = ?auto_113711 ?auto_113716 ) ) ( not ( = ?auto_113712 ?auto_113716 ) ) ( not ( = ?auto_113713 ?auto_113716 ) ) ( not ( = ?auto_113714 ?auto_113716 ) ) ( not ( = ?auto_113715 ?auto_113716 ) ) ( ON ?auto_113714 ?auto_113715 ) ( ON-TABLE ?auto_113716 ) ( ON ?auto_113713 ?auto_113714 ) ( ON ?auto_113712 ?auto_113713 ) ( CLEAR ?auto_113712 ) ( HOLDING ?auto_113711 ) ( CLEAR ?auto_113710 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_113709 ?auto_113710 ?auto_113711 )
      ( MAKE-6PILE ?auto_113709 ?auto_113710 ?auto_113711 ?auto_113712 ?auto_113713 ?auto_113714 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_113717 - BLOCK
      ?auto_113718 - BLOCK
      ?auto_113719 - BLOCK
      ?auto_113720 - BLOCK
      ?auto_113721 - BLOCK
      ?auto_113722 - BLOCK
    )
    :vars
    (
      ?auto_113724 - BLOCK
      ?auto_113723 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_113717 ) ( ON ?auto_113718 ?auto_113717 ) ( not ( = ?auto_113717 ?auto_113718 ) ) ( not ( = ?auto_113717 ?auto_113719 ) ) ( not ( = ?auto_113717 ?auto_113720 ) ) ( not ( = ?auto_113717 ?auto_113721 ) ) ( not ( = ?auto_113717 ?auto_113722 ) ) ( not ( = ?auto_113717 ?auto_113724 ) ) ( not ( = ?auto_113718 ?auto_113719 ) ) ( not ( = ?auto_113718 ?auto_113720 ) ) ( not ( = ?auto_113718 ?auto_113721 ) ) ( not ( = ?auto_113718 ?auto_113722 ) ) ( not ( = ?auto_113718 ?auto_113724 ) ) ( not ( = ?auto_113719 ?auto_113720 ) ) ( not ( = ?auto_113719 ?auto_113721 ) ) ( not ( = ?auto_113719 ?auto_113722 ) ) ( not ( = ?auto_113719 ?auto_113724 ) ) ( not ( = ?auto_113720 ?auto_113721 ) ) ( not ( = ?auto_113720 ?auto_113722 ) ) ( not ( = ?auto_113720 ?auto_113724 ) ) ( not ( = ?auto_113721 ?auto_113722 ) ) ( not ( = ?auto_113721 ?auto_113724 ) ) ( not ( = ?auto_113722 ?auto_113724 ) ) ( ON ?auto_113724 ?auto_113723 ) ( not ( = ?auto_113717 ?auto_113723 ) ) ( not ( = ?auto_113718 ?auto_113723 ) ) ( not ( = ?auto_113719 ?auto_113723 ) ) ( not ( = ?auto_113720 ?auto_113723 ) ) ( not ( = ?auto_113721 ?auto_113723 ) ) ( not ( = ?auto_113722 ?auto_113723 ) ) ( not ( = ?auto_113724 ?auto_113723 ) ) ( ON ?auto_113722 ?auto_113724 ) ( ON-TABLE ?auto_113723 ) ( ON ?auto_113721 ?auto_113722 ) ( ON ?auto_113720 ?auto_113721 ) ( CLEAR ?auto_113718 ) ( ON ?auto_113719 ?auto_113720 ) ( CLEAR ?auto_113719 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_113723 ?auto_113724 ?auto_113722 ?auto_113721 ?auto_113720 )
      ( MAKE-6PILE ?auto_113717 ?auto_113718 ?auto_113719 ?auto_113720 ?auto_113721 ?auto_113722 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_113725 - BLOCK
      ?auto_113726 - BLOCK
      ?auto_113727 - BLOCK
      ?auto_113728 - BLOCK
      ?auto_113729 - BLOCK
      ?auto_113730 - BLOCK
    )
    :vars
    (
      ?auto_113732 - BLOCK
      ?auto_113731 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_113725 ) ( not ( = ?auto_113725 ?auto_113726 ) ) ( not ( = ?auto_113725 ?auto_113727 ) ) ( not ( = ?auto_113725 ?auto_113728 ) ) ( not ( = ?auto_113725 ?auto_113729 ) ) ( not ( = ?auto_113725 ?auto_113730 ) ) ( not ( = ?auto_113725 ?auto_113732 ) ) ( not ( = ?auto_113726 ?auto_113727 ) ) ( not ( = ?auto_113726 ?auto_113728 ) ) ( not ( = ?auto_113726 ?auto_113729 ) ) ( not ( = ?auto_113726 ?auto_113730 ) ) ( not ( = ?auto_113726 ?auto_113732 ) ) ( not ( = ?auto_113727 ?auto_113728 ) ) ( not ( = ?auto_113727 ?auto_113729 ) ) ( not ( = ?auto_113727 ?auto_113730 ) ) ( not ( = ?auto_113727 ?auto_113732 ) ) ( not ( = ?auto_113728 ?auto_113729 ) ) ( not ( = ?auto_113728 ?auto_113730 ) ) ( not ( = ?auto_113728 ?auto_113732 ) ) ( not ( = ?auto_113729 ?auto_113730 ) ) ( not ( = ?auto_113729 ?auto_113732 ) ) ( not ( = ?auto_113730 ?auto_113732 ) ) ( ON ?auto_113732 ?auto_113731 ) ( not ( = ?auto_113725 ?auto_113731 ) ) ( not ( = ?auto_113726 ?auto_113731 ) ) ( not ( = ?auto_113727 ?auto_113731 ) ) ( not ( = ?auto_113728 ?auto_113731 ) ) ( not ( = ?auto_113729 ?auto_113731 ) ) ( not ( = ?auto_113730 ?auto_113731 ) ) ( not ( = ?auto_113732 ?auto_113731 ) ) ( ON ?auto_113730 ?auto_113732 ) ( ON-TABLE ?auto_113731 ) ( ON ?auto_113729 ?auto_113730 ) ( ON ?auto_113728 ?auto_113729 ) ( ON ?auto_113727 ?auto_113728 ) ( CLEAR ?auto_113727 ) ( HOLDING ?auto_113726 ) ( CLEAR ?auto_113725 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_113725 ?auto_113726 )
      ( MAKE-6PILE ?auto_113725 ?auto_113726 ?auto_113727 ?auto_113728 ?auto_113729 ?auto_113730 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_113733 - BLOCK
      ?auto_113734 - BLOCK
      ?auto_113735 - BLOCK
      ?auto_113736 - BLOCK
      ?auto_113737 - BLOCK
      ?auto_113738 - BLOCK
    )
    :vars
    (
      ?auto_113740 - BLOCK
      ?auto_113739 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_113733 ) ( not ( = ?auto_113733 ?auto_113734 ) ) ( not ( = ?auto_113733 ?auto_113735 ) ) ( not ( = ?auto_113733 ?auto_113736 ) ) ( not ( = ?auto_113733 ?auto_113737 ) ) ( not ( = ?auto_113733 ?auto_113738 ) ) ( not ( = ?auto_113733 ?auto_113740 ) ) ( not ( = ?auto_113734 ?auto_113735 ) ) ( not ( = ?auto_113734 ?auto_113736 ) ) ( not ( = ?auto_113734 ?auto_113737 ) ) ( not ( = ?auto_113734 ?auto_113738 ) ) ( not ( = ?auto_113734 ?auto_113740 ) ) ( not ( = ?auto_113735 ?auto_113736 ) ) ( not ( = ?auto_113735 ?auto_113737 ) ) ( not ( = ?auto_113735 ?auto_113738 ) ) ( not ( = ?auto_113735 ?auto_113740 ) ) ( not ( = ?auto_113736 ?auto_113737 ) ) ( not ( = ?auto_113736 ?auto_113738 ) ) ( not ( = ?auto_113736 ?auto_113740 ) ) ( not ( = ?auto_113737 ?auto_113738 ) ) ( not ( = ?auto_113737 ?auto_113740 ) ) ( not ( = ?auto_113738 ?auto_113740 ) ) ( ON ?auto_113740 ?auto_113739 ) ( not ( = ?auto_113733 ?auto_113739 ) ) ( not ( = ?auto_113734 ?auto_113739 ) ) ( not ( = ?auto_113735 ?auto_113739 ) ) ( not ( = ?auto_113736 ?auto_113739 ) ) ( not ( = ?auto_113737 ?auto_113739 ) ) ( not ( = ?auto_113738 ?auto_113739 ) ) ( not ( = ?auto_113740 ?auto_113739 ) ) ( ON ?auto_113738 ?auto_113740 ) ( ON-TABLE ?auto_113739 ) ( ON ?auto_113737 ?auto_113738 ) ( ON ?auto_113736 ?auto_113737 ) ( ON ?auto_113735 ?auto_113736 ) ( CLEAR ?auto_113733 ) ( ON ?auto_113734 ?auto_113735 ) ( CLEAR ?auto_113734 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_113739 ?auto_113740 ?auto_113738 ?auto_113737 ?auto_113736 ?auto_113735 )
      ( MAKE-6PILE ?auto_113733 ?auto_113734 ?auto_113735 ?auto_113736 ?auto_113737 ?auto_113738 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_113741 - BLOCK
      ?auto_113742 - BLOCK
      ?auto_113743 - BLOCK
      ?auto_113744 - BLOCK
      ?auto_113745 - BLOCK
      ?auto_113746 - BLOCK
    )
    :vars
    (
      ?auto_113748 - BLOCK
      ?auto_113747 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_113741 ?auto_113742 ) ) ( not ( = ?auto_113741 ?auto_113743 ) ) ( not ( = ?auto_113741 ?auto_113744 ) ) ( not ( = ?auto_113741 ?auto_113745 ) ) ( not ( = ?auto_113741 ?auto_113746 ) ) ( not ( = ?auto_113741 ?auto_113748 ) ) ( not ( = ?auto_113742 ?auto_113743 ) ) ( not ( = ?auto_113742 ?auto_113744 ) ) ( not ( = ?auto_113742 ?auto_113745 ) ) ( not ( = ?auto_113742 ?auto_113746 ) ) ( not ( = ?auto_113742 ?auto_113748 ) ) ( not ( = ?auto_113743 ?auto_113744 ) ) ( not ( = ?auto_113743 ?auto_113745 ) ) ( not ( = ?auto_113743 ?auto_113746 ) ) ( not ( = ?auto_113743 ?auto_113748 ) ) ( not ( = ?auto_113744 ?auto_113745 ) ) ( not ( = ?auto_113744 ?auto_113746 ) ) ( not ( = ?auto_113744 ?auto_113748 ) ) ( not ( = ?auto_113745 ?auto_113746 ) ) ( not ( = ?auto_113745 ?auto_113748 ) ) ( not ( = ?auto_113746 ?auto_113748 ) ) ( ON ?auto_113748 ?auto_113747 ) ( not ( = ?auto_113741 ?auto_113747 ) ) ( not ( = ?auto_113742 ?auto_113747 ) ) ( not ( = ?auto_113743 ?auto_113747 ) ) ( not ( = ?auto_113744 ?auto_113747 ) ) ( not ( = ?auto_113745 ?auto_113747 ) ) ( not ( = ?auto_113746 ?auto_113747 ) ) ( not ( = ?auto_113748 ?auto_113747 ) ) ( ON ?auto_113746 ?auto_113748 ) ( ON-TABLE ?auto_113747 ) ( ON ?auto_113745 ?auto_113746 ) ( ON ?auto_113744 ?auto_113745 ) ( ON ?auto_113743 ?auto_113744 ) ( ON ?auto_113742 ?auto_113743 ) ( CLEAR ?auto_113742 ) ( HOLDING ?auto_113741 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_113741 )
      ( MAKE-6PILE ?auto_113741 ?auto_113742 ?auto_113743 ?auto_113744 ?auto_113745 ?auto_113746 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_113749 - BLOCK
      ?auto_113750 - BLOCK
      ?auto_113751 - BLOCK
      ?auto_113752 - BLOCK
      ?auto_113753 - BLOCK
      ?auto_113754 - BLOCK
    )
    :vars
    (
      ?auto_113756 - BLOCK
      ?auto_113755 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_113749 ?auto_113750 ) ) ( not ( = ?auto_113749 ?auto_113751 ) ) ( not ( = ?auto_113749 ?auto_113752 ) ) ( not ( = ?auto_113749 ?auto_113753 ) ) ( not ( = ?auto_113749 ?auto_113754 ) ) ( not ( = ?auto_113749 ?auto_113756 ) ) ( not ( = ?auto_113750 ?auto_113751 ) ) ( not ( = ?auto_113750 ?auto_113752 ) ) ( not ( = ?auto_113750 ?auto_113753 ) ) ( not ( = ?auto_113750 ?auto_113754 ) ) ( not ( = ?auto_113750 ?auto_113756 ) ) ( not ( = ?auto_113751 ?auto_113752 ) ) ( not ( = ?auto_113751 ?auto_113753 ) ) ( not ( = ?auto_113751 ?auto_113754 ) ) ( not ( = ?auto_113751 ?auto_113756 ) ) ( not ( = ?auto_113752 ?auto_113753 ) ) ( not ( = ?auto_113752 ?auto_113754 ) ) ( not ( = ?auto_113752 ?auto_113756 ) ) ( not ( = ?auto_113753 ?auto_113754 ) ) ( not ( = ?auto_113753 ?auto_113756 ) ) ( not ( = ?auto_113754 ?auto_113756 ) ) ( ON ?auto_113756 ?auto_113755 ) ( not ( = ?auto_113749 ?auto_113755 ) ) ( not ( = ?auto_113750 ?auto_113755 ) ) ( not ( = ?auto_113751 ?auto_113755 ) ) ( not ( = ?auto_113752 ?auto_113755 ) ) ( not ( = ?auto_113753 ?auto_113755 ) ) ( not ( = ?auto_113754 ?auto_113755 ) ) ( not ( = ?auto_113756 ?auto_113755 ) ) ( ON ?auto_113754 ?auto_113756 ) ( ON-TABLE ?auto_113755 ) ( ON ?auto_113753 ?auto_113754 ) ( ON ?auto_113752 ?auto_113753 ) ( ON ?auto_113751 ?auto_113752 ) ( ON ?auto_113750 ?auto_113751 ) ( ON ?auto_113749 ?auto_113750 ) ( CLEAR ?auto_113749 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_113755 ?auto_113756 ?auto_113754 ?auto_113753 ?auto_113752 ?auto_113751 ?auto_113750 )
      ( MAKE-6PILE ?auto_113749 ?auto_113750 ?auto_113751 ?auto_113752 ?auto_113753 ?auto_113754 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_113758 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_113758 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_113758 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_113759 - BLOCK
    )
    :vars
    (
      ?auto_113760 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113759 ?auto_113760 ) ( CLEAR ?auto_113759 ) ( HAND-EMPTY ) ( not ( = ?auto_113759 ?auto_113760 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_113759 ?auto_113760 )
      ( MAKE-1PILE ?auto_113759 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_113761 - BLOCK
    )
    :vars
    (
      ?auto_113762 - BLOCK
      ?auto_113765 - BLOCK
      ?auto_113766 - BLOCK
      ?auto_113767 - BLOCK
      ?auto_113763 - BLOCK
      ?auto_113764 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_113761 ?auto_113762 ) ) ( HOLDING ?auto_113761 ) ( CLEAR ?auto_113762 ) ( ON-TABLE ?auto_113765 ) ( ON ?auto_113766 ?auto_113765 ) ( ON ?auto_113767 ?auto_113766 ) ( ON ?auto_113763 ?auto_113767 ) ( ON ?auto_113764 ?auto_113763 ) ( ON ?auto_113762 ?auto_113764 ) ( not ( = ?auto_113765 ?auto_113766 ) ) ( not ( = ?auto_113765 ?auto_113767 ) ) ( not ( = ?auto_113765 ?auto_113763 ) ) ( not ( = ?auto_113765 ?auto_113764 ) ) ( not ( = ?auto_113765 ?auto_113762 ) ) ( not ( = ?auto_113765 ?auto_113761 ) ) ( not ( = ?auto_113766 ?auto_113767 ) ) ( not ( = ?auto_113766 ?auto_113763 ) ) ( not ( = ?auto_113766 ?auto_113764 ) ) ( not ( = ?auto_113766 ?auto_113762 ) ) ( not ( = ?auto_113766 ?auto_113761 ) ) ( not ( = ?auto_113767 ?auto_113763 ) ) ( not ( = ?auto_113767 ?auto_113764 ) ) ( not ( = ?auto_113767 ?auto_113762 ) ) ( not ( = ?auto_113767 ?auto_113761 ) ) ( not ( = ?auto_113763 ?auto_113764 ) ) ( not ( = ?auto_113763 ?auto_113762 ) ) ( not ( = ?auto_113763 ?auto_113761 ) ) ( not ( = ?auto_113764 ?auto_113762 ) ) ( not ( = ?auto_113764 ?auto_113761 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_113765 ?auto_113766 ?auto_113767 ?auto_113763 ?auto_113764 ?auto_113762 ?auto_113761 )
      ( MAKE-1PILE ?auto_113761 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_113768 - BLOCK
    )
    :vars
    (
      ?auto_113772 - BLOCK
      ?auto_113769 - BLOCK
      ?auto_113771 - BLOCK
      ?auto_113773 - BLOCK
      ?auto_113774 - BLOCK
      ?auto_113770 - BLOCK
      ?auto_113775 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_113768 ?auto_113772 ) ) ( CLEAR ?auto_113772 ) ( ON-TABLE ?auto_113769 ) ( ON ?auto_113771 ?auto_113769 ) ( ON ?auto_113773 ?auto_113771 ) ( ON ?auto_113774 ?auto_113773 ) ( ON ?auto_113770 ?auto_113774 ) ( ON ?auto_113772 ?auto_113770 ) ( not ( = ?auto_113769 ?auto_113771 ) ) ( not ( = ?auto_113769 ?auto_113773 ) ) ( not ( = ?auto_113769 ?auto_113774 ) ) ( not ( = ?auto_113769 ?auto_113770 ) ) ( not ( = ?auto_113769 ?auto_113772 ) ) ( not ( = ?auto_113769 ?auto_113768 ) ) ( not ( = ?auto_113771 ?auto_113773 ) ) ( not ( = ?auto_113771 ?auto_113774 ) ) ( not ( = ?auto_113771 ?auto_113770 ) ) ( not ( = ?auto_113771 ?auto_113772 ) ) ( not ( = ?auto_113771 ?auto_113768 ) ) ( not ( = ?auto_113773 ?auto_113774 ) ) ( not ( = ?auto_113773 ?auto_113770 ) ) ( not ( = ?auto_113773 ?auto_113772 ) ) ( not ( = ?auto_113773 ?auto_113768 ) ) ( not ( = ?auto_113774 ?auto_113770 ) ) ( not ( = ?auto_113774 ?auto_113772 ) ) ( not ( = ?auto_113774 ?auto_113768 ) ) ( not ( = ?auto_113770 ?auto_113772 ) ) ( not ( = ?auto_113770 ?auto_113768 ) ) ( ON ?auto_113768 ?auto_113775 ) ( CLEAR ?auto_113768 ) ( HAND-EMPTY ) ( not ( = ?auto_113768 ?auto_113775 ) ) ( not ( = ?auto_113772 ?auto_113775 ) ) ( not ( = ?auto_113769 ?auto_113775 ) ) ( not ( = ?auto_113771 ?auto_113775 ) ) ( not ( = ?auto_113773 ?auto_113775 ) ) ( not ( = ?auto_113774 ?auto_113775 ) ) ( not ( = ?auto_113770 ?auto_113775 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_113768 ?auto_113775 )
      ( MAKE-1PILE ?auto_113768 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_113776 - BLOCK
    )
    :vars
    (
      ?auto_113777 - BLOCK
      ?auto_113778 - BLOCK
      ?auto_113780 - BLOCK
      ?auto_113779 - BLOCK
      ?auto_113782 - BLOCK
      ?auto_113783 - BLOCK
      ?auto_113781 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_113776 ?auto_113777 ) ) ( ON-TABLE ?auto_113778 ) ( ON ?auto_113780 ?auto_113778 ) ( ON ?auto_113779 ?auto_113780 ) ( ON ?auto_113782 ?auto_113779 ) ( ON ?auto_113783 ?auto_113782 ) ( not ( = ?auto_113778 ?auto_113780 ) ) ( not ( = ?auto_113778 ?auto_113779 ) ) ( not ( = ?auto_113778 ?auto_113782 ) ) ( not ( = ?auto_113778 ?auto_113783 ) ) ( not ( = ?auto_113778 ?auto_113777 ) ) ( not ( = ?auto_113778 ?auto_113776 ) ) ( not ( = ?auto_113780 ?auto_113779 ) ) ( not ( = ?auto_113780 ?auto_113782 ) ) ( not ( = ?auto_113780 ?auto_113783 ) ) ( not ( = ?auto_113780 ?auto_113777 ) ) ( not ( = ?auto_113780 ?auto_113776 ) ) ( not ( = ?auto_113779 ?auto_113782 ) ) ( not ( = ?auto_113779 ?auto_113783 ) ) ( not ( = ?auto_113779 ?auto_113777 ) ) ( not ( = ?auto_113779 ?auto_113776 ) ) ( not ( = ?auto_113782 ?auto_113783 ) ) ( not ( = ?auto_113782 ?auto_113777 ) ) ( not ( = ?auto_113782 ?auto_113776 ) ) ( not ( = ?auto_113783 ?auto_113777 ) ) ( not ( = ?auto_113783 ?auto_113776 ) ) ( ON ?auto_113776 ?auto_113781 ) ( CLEAR ?auto_113776 ) ( not ( = ?auto_113776 ?auto_113781 ) ) ( not ( = ?auto_113777 ?auto_113781 ) ) ( not ( = ?auto_113778 ?auto_113781 ) ) ( not ( = ?auto_113780 ?auto_113781 ) ) ( not ( = ?auto_113779 ?auto_113781 ) ) ( not ( = ?auto_113782 ?auto_113781 ) ) ( not ( = ?auto_113783 ?auto_113781 ) ) ( HOLDING ?auto_113777 ) ( CLEAR ?auto_113783 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_113778 ?auto_113780 ?auto_113779 ?auto_113782 ?auto_113783 ?auto_113777 )
      ( MAKE-1PILE ?auto_113776 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_113784 - BLOCK
    )
    :vars
    (
      ?auto_113786 - BLOCK
      ?auto_113789 - BLOCK
      ?auto_113785 - BLOCK
      ?auto_113787 - BLOCK
      ?auto_113790 - BLOCK
      ?auto_113788 - BLOCK
      ?auto_113791 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_113784 ?auto_113786 ) ) ( ON-TABLE ?auto_113789 ) ( ON ?auto_113785 ?auto_113789 ) ( ON ?auto_113787 ?auto_113785 ) ( ON ?auto_113790 ?auto_113787 ) ( ON ?auto_113788 ?auto_113790 ) ( not ( = ?auto_113789 ?auto_113785 ) ) ( not ( = ?auto_113789 ?auto_113787 ) ) ( not ( = ?auto_113789 ?auto_113790 ) ) ( not ( = ?auto_113789 ?auto_113788 ) ) ( not ( = ?auto_113789 ?auto_113786 ) ) ( not ( = ?auto_113789 ?auto_113784 ) ) ( not ( = ?auto_113785 ?auto_113787 ) ) ( not ( = ?auto_113785 ?auto_113790 ) ) ( not ( = ?auto_113785 ?auto_113788 ) ) ( not ( = ?auto_113785 ?auto_113786 ) ) ( not ( = ?auto_113785 ?auto_113784 ) ) ( not ( = ?auto_113787 ?auto_113790 ) ) ( not ( = ?auto_113787 ?auto_113788 ) ) ( not ( = ?auto_113787 ?auto_113786 ) ) ( not ( = ?auto_113787 ?auto_113784 ) ) ( not ( = ?auto_113790 ?auto_113788 ) ) ( not ( = ?auto_113790 ?auto_113786 ) ) ( not ( = ?auto_113790 ?auto_113784 ) ) ( not ( = ?auto_113788 ?auto_113786 ) ) ( not ( = ?auto_113788 ?auto_113784 ) ) ( ON ?auto_113784 ?auto_113791 ) ( not ( = ?auto_113784 ?auto_113791 ) ) ( not ( = ?auto_113786 ?auto_113791 ) ) ( not ( = ?auto_113789 ?auto_113791 ) ) ( not ( = ?auto_113785 ?auto_113791 ) ) ( not ( = ?auto_113787 ?auto_113791 ) ) ( not ( = ?auto_113790 ?auto_113791 ) ) ( not ( = ?auto_113788 ?auto_113791 ) ) ( CLEAR ?auto_113788 ) ( ON ?auto_113786 ?auto_113784 ) ( CLEAR ?auto_113786 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_113791 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_113791 ?auto_113784 )
      ( MAKE-1PILE ?auto_113784 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_113792 - BLOCK
    )
    :vars
    (
      ?auto_113797 - BLOCK
      ?auto_113795 - BLOCK
      ?auto_113796 - BLOCK
      ?auto_113799 - BLOCK
      ?auto_113794 - BLOCK
      ?auto_113793 - BLOCK
      ?auto_113798 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_113792 ?auto_113797 ) ) ( ON-TABLE ?auto_113795 ) ( ON ?auto_113796 ?auto_113795 ) ( ON ?auto_113799 ?auto_113796 ) ( ON ?auto_113794 ?auto_113799 ) ( not ( = ?auto_113795 ?auto_113796 ) ) ( not ( = ?auto_113795 ?auto_113799 ) ) ( not ( = ?auto_113795 ?auto_113794 ) ) ( not ( = ?auto_113795 ?auto_113793 ) ) ( not ( = ?auto_113795 ?auto_113797 ) ) ( not ( = ?auto_113795 ?auto_113792 ) ) ( not ( = ?auto_113796 ?auto_113799 ) ) ( not ( = ?auto_113796 ?auto_113794 ) ) ( not ( = ?auto_113796 ?auto_113793 ) ) ( not ( = ?auto_113796 ?auto_113797 ) ) ( not ( = ?auto_113796 ?auto_113792 ) ) ( not ( = ?auto_113799 ?auto_113794 ) ) ( not ( = ?auto_113799 ?auto_113793 ) ) ( not ( = ?auto_113799 ?auto_113797 ) ) ( not ( = ?auto_113799 ?auto_113792 ) ) ( not ( = ?auto_113794 ?auto_113793 ) ) ( not ( = ?auto_113794 ?auto_113797 ) ) ( not ( = ?auto_113794 ?auto_113792 ) ) ( not ( = ?auto_113793 ?auto_113797 ) ) ( not ( = ?auto_113793 ?auto_113792 ) ) ( ON ?auto_113792 ?auto_113798 ) ( not ( = ?auto_113792 ?auto_113798 ) ) ( not ( = ?auto_113797 ?auto_113798 ) ) ( not ( = ?auto_113795 ?auto_113798 ) ) ( not ( = ?auto_113796 ?auto_113798 ) ) ( not ( = ?auto_113799 ?auto_113798 ) ) ( not ( = ?auto_113794 ?auto_113798 ) ) ( not ( = ?auto_113793 ?auto_113798 ) ) ( ON ?auto_113797 ?auto_113792 ) ( CLEAR ?auto_113797 ) ( ON-TABLE ?auto_113798 ) ( HOLDING ?auto_113793 ) ( CLEAR ?auto_113794 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_113795 ?auto_113796 ?auto_113799 ?auto_113794 ?auto_113793 )
      ( MAKE-1PILE ?auto_113792 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_113800 - BLOCK
    )
    :vars
    (
      ?auto_113802 - BLOCK
      ?auto_113801 - BLOCK
      ?auto_113803 - BLOCK
      ?auto_113805 - BLOCK
      ?auto_113807 - BLOCK
      ?auto_113804 - BLOCK
      ?auto_113806 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_113800 ?auto_113802 ) ) ( ON-TABLE ?auto_113801 ) ( ON ?auto_113803 ?auto_113801 ) ( ON ?auto_113805 ?auto_113803 ) ( ON ?auto_113807 ?auto_113805 ) ( not ( = ?auto_113801 ?auto_113803 ) ) ( not ( = ?auto_113801 ?auto_113805 ) ) ( not ( = ?auto_113801 ?auto_113807 ) ) ( not ( = ?auto_113801 ?auto_113804 ) ) ( not ( = ?auto_113801 ?auto_113802 ) ) ( not ( = ?auto_113801 ?auto_113800 ) ) ( not ( = ?auto_113803 ?auto_113805 ) ) ( not ( = ?auto_113803 ?auto_113807 ) ) ( not ( = ?auto_113803 ?auto_113804 ) ) ( not ( = ?auto_113803 ?auto_113802 ) ) ( not ( = ?auto_113803 ?auto_113800 ) ) ( not ( = ?auto_113805 ?auto_113807 ) ) ( not ( = ?auto_113805 ?auto_113804 ) ) ( not ( = ?auto_113805 ?auto_113802 ) ) ( not ( = ?auto_113805 ?auto_113800 ) ) ( not ( = ?auto_113807 ?auto_113804 ) ) ( not ( = ?auto_113807 ?auto_113802 ) ) ( not ( = ?auto_113807 ?auto_113800 ) ) ( not ( = ?auto_113804 ?auto_113802 ) ) ( not ( = ?auto_113804 ?auto_113800 ) ) ( ON ?auto_113800 ?auto_113806 ) ( not ( = ?auto_113800 ?auto_113806 ) ) ( not ( = ?auto_113802 ?auto_113806 ) ) ( not ( = ?auto_113801 ?auto_113806 ) ) ( not ( = ?auto_113803 ?auto_113806 ) ) ( not ( = ?auto_113805 ?auto_113806 ) ) ( not ( = ?auto_113807 ?auto_113806 ) ) ( not ( = ?auto_113804 ?auto_113806 ) ) ( ON ?auto_113802 ?auto_113800 ) ( ON-TABLE ?auto_113806 ) ( CLEAR ?auto_113807 ) ( ON ?auto_113804 ?auto_113802 ) ( CLEAR ?auto_113804 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_113806 ?auto_113800 ?auto_113802 )
      ( MAKE-1PILE ?auto_113800 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_113808 - BLOCK
    )
    :vars
    (
      ?auto_113810 - BLOCK
      ?auto_113811 - BLOCK
      ?auto_113814 - BLOCK
      ?auto_113809 - BLOCK
      ?auto_113813 - BLOCK
      ?auto_113812 - BLOCK
      ?auto_113815 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_113808 ?auto_113810 ) ) ( ON-TABLE ?auto_113811 ) ( ON ?auto_113814 ?auto_113811 ) ( ON ?auto_113809 ?auto_113814 ) ( not ( = ?auto_113811 ?auto_113814 ) ) ( not ( = ?auto_113811 ?auto_113809 ) ) ( not ( = ?auto_113811 ?auto_113813 ) ) ( not ( = ?auto_113811 ?auto_113812 ) ) ( not ( = ?auto_113811 ?auto_113810 ) ) ( not ( = ?auto_113811 ?auto_113808 ) ) ( not ( = ?auto_113814 ?auto_113809 ) ) ( not ( = ?auto_113814 ?auto_113813 ) ) ( not ( = ?auto_113814 ?auto_113812 ) ) ( not ( = ?auto_113814 ?auto_113810 ) ) ( not ( = ?auto_113814 ?auto_113808 ) ) ( not ( = ?auto_113809 ?auto_113813 ) ) ( not ( = ?auto_113809 ?auto_113812 ) ) ( not ( = ?auto_113809 ?auto_113810 ) ) ( not ( = ?auto_113809 ?auto_113808 ) ) ( not ( = ?auto_113813 ?auto_113812 ) ) ( not ( = ?auto_113813 ?auto_113810 ) ) ( not ( = ?auto_113813 ?auto_113808 ) ) ( not ( = ?auto_113812 ?auto_113810 ) ) ( not ( = ?auto_113812 ?auto_113808 ) ) ( ON ?auto_113808 ?auto_113815 ) ( not ( = ?auto_113808 ?auto_113815 ) ) ( not ( = ?auto_113810 ?auto_113815 ) ) ( not ( = ?auto_113811 ?auto_113815 ) ) ( not ( = ?auto_113814 ?auto_113815 ) ) ( not ( = ?auto_113809 ?auto_113815 ) ) ( not ( = ?auto_113813 ?auto_113815 ) ) ( not ( = ?auto_113812 ?auto_113815 ) ) ( ON ?auto_113810 ?auto_113808 ) ( ON-TABLE ?auto_113815 ) ( ON ?auto_113812 ?auto_113810 ) ( CLEAR ?auto_113812 ) ( HOLDING ?auto_113813 ) ( CLEAR ?auto_113809 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_113811 ?auto_113814 ?auto_113809 ?auto_113813 )
      ( MAKE-1PILE ?auto_113808 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_113816 - BLOCK
    )
    :vars
    (
      ?auto_113820 - BLOCK
      ?auto_113817 - BLOCK
      ?auto_113823 - BLOCK
      ?auto_113818 - BLOCK
      ?auto_113822 - BLOCK
      ?auto_113819 - BLOCK
      ?auto_113821 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_113816 ?auto_113820 ) ) ( ON-TABLE ?auto_113817 ) ( ON ?auto_113823 ?auto_113817 ) ( ON ?auto_113818 ?auto_113823 ) ( not ( = ?auto_113817 ?auto_113823 ) ) ( not ( = ?auto_113817 ?auto_113818 ) ) ( not ( = ?auto_113817 ?auto_113822 ) ) ( not ( = ?auto_113817 ?auto_113819 ) ) ( not ( = ?auto_113817 ?auto_113820 ) ) ( not ( = ?auto_113817 ?auto_113816 ) ) ( not ( = ?auto_113823 ?auto_113818 ) ) ( not ( = ?auto_113823 ?auto_113822 ) ) ( not ( = ?auto_113823 ?auto_113819 ) ) ( not ( = ?auto_113823 ?auto_113820 ) ) ( not ( = ?auto_113823 ?auto_113816 ) ) ( not ( = ?auto_113818 ?auto_113822 ) ) ( not ( = ?auto_113818 ?auto_113819 ) ) ( not ( = ?auto_113818 ?auto_113820 ) ) ( not ( = ?auto_113818 ?auto_113816 ) ) ( not ( = ?auto_113822 ?auto_113819 ) ) ( not ( = ?auto_113822 ?auto_113820 ) ) ( not ( = ?auto_113822 ?auto_113816 ) ) ( not ( = ?auto_113819 ?auto_113820 ) ) ( not ( = ?auto_113819 ?auto_113816 ) ) ( ON ?auto_113816 ?auto_113821 ) ( not ( = ?auto_113816 ?auto_113821 ) ) ( not ( = ?auto_113820 ?auto_113821 ) ) ( not ( = ?auto_113817 ?auto_113821 ) ) ( not ( = ?auto_113823 ?auto_113821 ) ) ( not ( = ?auto_113818 ?auto_113821 ) ) ( not ( = ?auto_113822 ?auto_113821 ) ) ( not ( = ?auto_113819 ?auto_113821 ) ) ( ON ?auto_113820 ?auto_113816 ) ( ON-TABLE ?auto_113821 ) ( ON ?auto_113819 ?auto_113820 ) ( CLEAR ?auto_113818 ) ( ON ?auto_113822 ?auto_113819 ) ( CLEAR ?auto_113822 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_113821 ?auto_113816 ?auto_113820 ?auto_113819 )
      ( MAKE-1PILE ?auto_113816 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_113824 - BLOCK
    )
    :vars
    (
      ?auto_113827 - BLOCK
      ?auto_113828 - BLOCK
      ?auto_113830 - BLOCK
      ?auto_113831 - BLOCK
      ?auto_113825 - BLOCK
      ?auto_113829 - BLOCK
      ?auto_113826 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_113824 ?auto_113827 ) ) ( ON-TABLE ?auto_113828 ) ( ON ?auto_113830 ?auto_113828 ) ( not ( = ?auto_113828 ?auto_113830 ) ) ( not ( = ?auto_113828 ?auto_113831 ) ) ( not ( = ?auto_113828 ?auto_113825 ) ) ( not ( = ?auto_113828 ?auto_113829 ) ) ( not ( = ?auto_113828 ?auto_113827 ) ) ( not ( = ?auto_113828 ?auto_113824 ) ) ( not ( = ?auto_113830 ?auto_113831 ) ) ( not ( = ?auto_113830 ?auto_113825 ) ) ( not ( = ?auto_113830 ?auto_113829 ) ) ( not ( = ?auto_113830 ?auto_113827 ) ) ( not ( = ?auto_113830 ?auto_113824 ) ) ( not ( = ?auto_113831 ?auto_113825 ) ) ( not ( = ?auto_113831 ?auto_113829 ) ) ( not ( = ?auto_113831 ?auto_113827 ) ) ( not ( = ?auto_113831 ?auto_113824 ) ) ( not ( = ?auto_113825 ?auto_113829 ) ) ( not ( = ?auto_113825 ?auto_113827 ) ) ( not ( = ?auto_113825 ?auto_113824 ) ) ( not ( = ?auto_113829 ?auto_113827 ) ) ( not ( = ?auto_113829 ?auto_113824 ) ) ( ON ?auto_113824 ?auto_113826 ) ( not ( = ?auto_113824 ?auto_113826 ) ) ( not ( = ?auto_113827 ?auto_113826 ) ) ( not ( = ?auto_113828 ?auto_113826 ) ) ( not ( = ?auto_113830 ?auto_113826 ) ) ( not ( = ?auto_113831 ?auto_113826 ) ) ( not ( = ?auto_113825 ?auto_113826 ) ) ( not ( = ?auto_113829 ?auto_113826 ) ) ( ON ?auto_113827 ?auto_113824 ) ( ON-TABLE ?auto_113826 ) ( ON ?auto_113829 ?auto_113827 ) ( ON ?auto_113825 ?auto_113829 ) ( CLEAR ?auto_113825 ) ( HOLDING ?auto_113831 ) ( CLEAR ?auto_113830 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_113828 ?auto_113830 ?auto_113831 )
      ( MAKE-1PILE ?auto_113824 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_113832 - BLOCK
    )
    :vars
    (
      ?auto_113839 - BLOCK
      ?auto_113835 - BLOCK
      ?auto_113838 - BLOCK
      ?auto_113837 - BLOCK
      ?auto_113836 - BLOCK
      ?auto_113833 - BLOCK
      ?auto_113834 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_113832 ?auto_113839 ) ) ( ON-TABLE ?auto_113835 ) ( ON ?auto_113838 ?auto_113835 ) ( not ( = ?auto_113835 ?auto_113838 ) ) ( not ( = ?auto_113835 ?auto_113837 ) ) ( not ( = ?auto_113835 ?auto_113836 ) ) ( not ( = ?auto_113835 ?auto_113833 ) ) ( not ( = ?auto_113835 ?auto_113839 ) ) ( not ( = ?auto_113835 ?auto_113832 ) ) ( not ( = ?auto_113838 ?auto_113837 ) ) ( not ( = ?auto_113838 ?auto_113836 ) ) ( not ( = ?auto_113838 ?auto_113833 ) ) ( not ( = ?auto_113838 ?auto_113839 ) ) ( not ( = ?auto_113838 ?auto_113832 ) ) ( not ( = ?auto_113837 ?auto_113836 ) ) ( not ( = ?auto_113837 ?auto_113833 ) ) ( not ( = ?auto_113837 ?auto_113839 ) ) ( not ( = ?auto_113837 ?auto_113832 ) ) ( not ( = ?auto_113836 ?auto_113833 ) ) ( not ( = ?auto_113836 ?auto_113839 ) ) ( not ( = ?auto_113836 ?auto_113832 ) ) ( not ( = ?auto_113833 ?auto_113839 ) ) ( not ( = ?auto_113833 ?auto_113832 ) ) ( ON ?auto_113832 ?auto_113834 ) ( not ( = ?auto_113832 ?auto_113834 ) ) ( not ( = ?auto_113839 ?auto_113834 ) ) ( not ( = ?auto_113835 ?auto_113834 ) ) ( not ( = ?auto_113838 ?auto_113834 ) ) ( not ( = ?auto_113837 ?auto_113834 ) ) ( not ( = ?auto_113836 ?auto_113834 ) ) ( not ( = ?auto_113833 ?auto_113834 ) ) ( ON ?auto_113839 ?auto_113832 ) ( ON-TABLE ?auto_113834 ) ( ON ?auto_113833 ?auto_113839 ) ( ON ?auto_113836 ?auto_113833 ) ( CLEAR ?auto_113838 ) ( ON ?auto_113837 ?auto_113836 ) ( CLEAR ?auto_113837 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_113834 ?auto_113832 ?auto_113839 ?auto_113833 ?auto_113836 )
      ( MAKE-1PILE ?auto_113832 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_113840 - BLOCK
    )
    :vars
    (
      ?auto_113846 - BLOCK
      ?auto_113844 - BLOCK
      ?auto_113841 - BLOCK
      ?auto_113842 - BLOCK
      ?auto_113843 - BLOCK
      ?auto_113845 - BLOCK
      ?auto_113847 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_113840 ?auto_113846 ) ) ( ON-TABLE ?auto_113844 ) ( not ( = ?auto_113844 ?auto_113841 ) ) ( not ( = ?auto_113844 ?auto_113842 ) ) ( not ( = ?auto_113844 ?auto_113843 ) ) ( not ( = ?auto_113844 ?auto_113845 ) ) ( not ( = ?auto_113844 ?auto_113846 ) ) ( not ( = ?auto_113844 ?auto_113840 ) ) ( not ( = ?auto_113841 ?auto_113842 ) ) ( not ( = ?auto_113841 ?auto_113843 ) ) ( not ( = ?auto_113841 ?auto_113845 ) ) ( not ( = ?auto_113841 ?auto_113846 ) ) ( not ( = ?auto_113841 ?auto_113840 ) ) ( not ( = ?auto_113842 ?auto_113843 ) ) ( not ( = ?auto_113842 ?auto_113845 ) ) ( not ( = ?auto_113842 ?auto_113846 ) ) ( not ( = ?auto_113842 ?auto_113840 ) ) ( not ( = ?auto_113843 ?auto_113845 ) ) ( not ( = ?auto_113843 ?auto_113846 ) ) ( not ( = ?auto_113843 ?auto_113840 ) ) ( not ( = ?auto_113845 ?auto_113846 ) ) ( not ( = ?auto_113845 ?auto_113840 ) ) ( ON ?auto_113840 ?auto_113847 ) ( not ( = ?auto_113840 ?auto_113847 ) ) ( not ( = ?auto_113846 ?auto_113847 ) ) ( not ( = ?auto_113844 ?auto_113847 ) ) ( not ( = ?auto_113841 ?auto_113847 ) ) ( not ( = ?auto_113842 ?auto_113847 ) ) ( not ( = ?auto_113843 ?auto_113847 ) ) ( not ( = ?auto_113845 ?auto_113847 ) ) ( ON ?auto_113846 ?auto_113840 ) ( ON-TABLE ?auto_113847 ) ( ON ?auto_113845 ?auto_113846 ) ( ON ?auto_113843 ?auto_113845 ) ( ON ?auto_113842 ?auto_113843 ) ( CLEAR ?auto_113842 ) ( HOLDING ?auto_113841 ) ( CLEAR ?auto_113844 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_113844 ?auto_113841 )
      ( MAKE-1PILE ?auto_113840 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_113848 - BLOCK
    )
    :vars
    (
      ?auto_113854 - BLOCK
      ?auto_113852 - BLOCK
      ?auto_113851 - BLOCK
      ?auto_113855 - BLOCK
      ?auto_113850 - BLOCK
      ?auto_113849 - BLOCK
      ?auto_113853 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_113848 ?auto_113854 ) ) ( ON-TABLE ?auto_113852 ) ( not ( = ?auto_113852 ?auto_113851 ) ) ( not ( = ?auto_113852 ?auto_113855 ) ) ( not ( = ?auto_113852 ?auto_113850 ) ) ( not ( = ?auto_113852 ?auto_113849 ) ) ( not ( = ?auto_113852 ?auto_113854 ) ) ( not ( = ?auto_113852 ?auto_113848 ) ) ( not ( = ?auto_113851 ?auto_113855 ) ) ( not ( = ?auto_113851 ?auto_113850 ) ) ( not ( = ?auto_113851 ?auto_113849 ) ) ( not ( = ?auto_113851 ?auto_113854 ) ) ( not ( = ?auto_113851 ?auto_113848 ) ) ( not ( = ?auto_113855 ?auto_113850 ) ) ( not ( = ?auto_113855 ?auto_113849 ) ) ( not ( = ?auto_113855 ?auto_113854 ) ) ( not ( = ?auto_113855 ?auto_113848 ) ) ( not ( = ?auto_113850 ?auto_113849 ) ) ( not ( = ?auto_113850 ?auto_113854 ) ) ( not ( = ?auto_113850 ?auto_113848 ) ) ( not ( = ?auto_113849 ?auto_113854 ) ) ( not ( = ?auto_113849 ?auto_113848 ) ) ( ON ?auto_113848 ?auto_113853 ) ( not ( = ?auto_113848 ?auto_113853 ) ) ( not ( = ?auto_113854 ?auto_113853 ) ) ( not ( = ?auto_113852 ?auto_113853 ) ) ( not ( = ?auto_113851 ?auto_113853 ) ) ( not ( = ?auto_113855 ?auto_113853 ) ) ( not ( = ?auto_113850 ?auto_113853 ) ) ( not ( = ?auto_113849 ?auto_113853 ) ) ( ON ?auto_113854 ?auto_113848 ) ( ON-TABLE ?auto_113853 ) ( ON ?auto_113849 ?auto_113854 ) ( ON ?auto_113850 ?auto_113849 ) ( ON ?auto_113855 ?auto_113850 ) ( CLEAR ?auto_113852 ) ( ON ?auto_113851 ?auto_113855 ) ( CLEAR ?auto_113851 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_113853 ?auto_113848 ?auto_113854 ?auto_113849 ?auto_113850 ?auto_113855 )
      ( MAKE-1PILE ?auto_113848 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_113856 - BLOCK
    )
    :vars
    (
      ?auto_113861 - BLOCK
      ?auto_113862 - BLOCK
      ?auto_113859 - BLOCK
      ?auto_113860 - BLOCK
      ?auto_113857 - BLOCK
      ?auto_113858 - BLOCK
      ?auto_113863 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_113856 ?auto_113861 ) ) ( not ( = ?auto_113862 ?auto_113859 ) ) ( not ( = ?auto_113862 ?auto_113860 ) ) ( not ( = ?auto_113862 ?auto_113857 ) ) ( not ( = ?auto_113862 ?auto_113858 ) ) ( not ( = ?auto_113862 ?auto_113861 ) ) ( not ( = ?auto_113862 ?auto_113856 ) ) ( not ( = ?auto_113859 ?auto_113860 ) ) ( not ( = ?auto_113859 ?auto_113857 ) ) ( not ( = ?auto_113859 ?auto_113858 ) ) ( not ( = ?auto_113859 ?auto_113861 ) ) ( not ( = ?auto_113859 ?auto_113856 ) ) ( not ( = ?auto_113860 ?auto_113857 ) ) ( not ( = ?auto_113860 ?auto_113858 ) ) ( not ( = ?auto_113860 ?auto_113861 ) ) ( not ( = ?auto_113860 ?auto_113856 ) ) ( not ( = ?auto_113857 ?auto_113858 ) ) ( not ( = ?auto_113857 ?auto_113861 ) ) ( not ( = ?auto_113857 ?auto_113856 ) ) ( not ( = ?auto_113858 ?auto_113861 ) ) ( not ( = ?auto_113858 ?auto_113856 ) ) ( ON ?auto_113856 ?auto_113863 ) ( not ( = ?auto_113856 ?auto_113863 ) ) ( not ( = ?auto_113861 ?auto_113863 ) ) ( not ( = ?auto_113862 ?auto_113863 ) ) ( not ( = ?auto_113859 ?auto_113863 ) ) ( not ( = ?auto_113860 ?auto_113863 ) ) ( not ( = ?auto_113857 ?auto_113863 ) ) ( not ( = ?auto_113858 ?auto_113863 ) ) ( ON ?auto_113861 ?auto_113856 ) ( ON-TABLE ?auto_113863 ) ( ON ?auto_113858 ?auto_113861 ) ( ON ?auto_113857 ?auto_113858 ) ( ON ?auto_113860 ?auto_113857 ) ( ON ?auto_113859 ?auto_113860 ) ( CLEAR ?auto_113859 ) ( HOLDING ?auto_113862 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_113862 )
      ( MAKE-1PILE ?auto_113856 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_113864 - BLOCK
    )
    :vars
    (
      ?auto_113866 - BLOCK
      ?auto_113870 - BLOCK
      ?auto_113865 - BLOCK
      ?auto_113871 - BLOCK
      ?auto_113868 - BLOCK
      ?auto_113869 - BLOCK
      ?auto_113867 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_113864 ?auto_113866 ) ) ( not ( = ?auto_113870 ?auto_113865 ) ) ( not ( = ?auto_113870 ?auto_113871 ) ) ( not ( = ?auto_113870 ?auto_113868 ) ) ( not ( = ?auto_113870 ?auto_113869 ) ) ( not ( = ?auto_113870 ?auto_113866 ) ) ( not ( = ?auto_113870 ?auto_113864 ) ) ( not ( = ?auto_113865 ?auto_113871 ) ) ( not ( = ?auto_113865 ?auto_113868 ) ) ( not ( = ?auto_113865 ?auto_113869 ) ) ( not ( = ?auto_113865 ?auto_113866 ) ) ( not ( = ?auto_113865 ?auto_113864 ) ) ( not ( = ?auto_113871 ?auto_113868 ) ) ( not ( = ?auto_113871 ?auto_113869 ) ) ( not ( = ?auto_113871 ?auto_113866 ) ) ( not ( = ?auto_113871 ?auto_113864 ) ) ( not ( = ?auto_113868 ?auto_113869 ) ) ( not ( = ?auto_113868 ?auto_113866 ) ) ( not ( = ?auto_113868 ?auto_113864 ) ) ( not ( = ?auto_113869 ?auto_113866 ) ) ( not ( = ?auto_113869 ?auto_113864 ) ) ( ON ?auto_113864 ?auto_113867 ) ( not ( = ?auto_113864 ?auto_113867 ) ) ( not ( = ?auto_113866 ?auto_113867 ) ) ( not ( = ?auto_113870 ?auto_113867 ) ) ( not ( = ?auto_113865 ?auto_113867 ) ) ( not ( = ?auto_113871 ?auto_113867 ) ) ( not ( = ?auto_113868 ?auto_113867 ) ) ( not ( = ?auto_113869 ?auto_113867 ) ) ( ON ?auto_113866 ?auto_113864 ) ( ON-TABLE ?auto_113867 ) ( ON ?auto_113869 ?auto_113866 ) ( ON ?auto_113868 ?auto_113869 ) ( ON ?auto_113871 ?auto_113868 ) ( ON ?auto_113865 ?auto_113871 ) ( ON ?auto_113870 ?auto_113865 ) ( CLEAR ?auto_113870 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_113867 ?auto_113864 ?auto_113866 ?auto_113869 ?auto_113868 ?auto_113871 ?auto_113865 )
      ( MAKE-1PILE ?auto_113864 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_113877 - BLOCK
      ?auto_113878 - BLOCK
      ?auto_113879 - BLOCK
      ?auto_113880 - BLOCK
      ?auto_113881 - BLOCK
    )
    :vars
    (
      ?auto_113882 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113882 ?auto_113881 ) ( CLEAR ?auto_113882 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_113877 ) ( ON ?auto_113878 ?auto_113877 ) ( ON ?auto_113879 ?auto_113878 ) ( ON ?auto_113880 ?auto_113879 ) ( ON ?auto_113881 ?auto_113880 ) ( not ( = ?auto_113877 ?auto_113878 ) ) ( not ( = ?auto_113877 ?auto_113879 ) ) ( not ( = ?auto_113877 ?auto_113880 ) ) ( not ( = ?auto_113877 ?auto_113881 ) ) ( not ( = ?auto_113877 ?auto_113882 ) ) ( not ( = ?auto_113878 ?auto_113879 ) ) ( not ( = ?auto_113878 ?auto_113880 ) ) ( not ( = ?auto_113878 ?auto_113881 ) ) ( not ( = ?auto_113878 ?auto_113882 ) ) ( not ( = ?auto_113879 ?auto_113880 ) ) ( not ( = ?auto_113879 ?auto_113881 ) ) ( not ( = ?auto_113879 ?auto_113882 ) ) ( not ( = ?auto_113880 ?auto_113881 ) ) ( not ( = ?auto_113880 ?auto_113882 ) ) ( not ( = ?auto_113881 ?auto_113882 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_113882 ?auto_113881 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_113883 - BLOCK
      ?auto_113884 - BLOCK
      ?auto_113885 - BLOCK
      ?auto_113886 - BLOCK
      ?auto_113887 - BLOCK
    )
    :vars
    (
      ?auto_113888 - BLOCK
      ?auto_113889 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113888 ?auto_113887 ) ( CLEAR ?auto_113888 ) ( ON-TABLE ?auto_113883 ) ( ON ?auto_113884 ?auto_113883 ) ( ON ?auto_113885 ?auto_113884 ) ( ON ?auto_113886 ?auto_113885 ) ( ON ?auto_113887 ?auto_113886 ) ( not ( = ?auto_113883 ?auto_113884 ) ) ( not ( = ?auto_113883 ?auto_113885 ) ) ( not ( = ?auto_113883 ?auto_113886 ) ) ( not ( = ?auto_113883 ?auto_113887 ) ) ( not ( = ?auto_113883 ?auto_113888 ) ) ( not ( = ?auto_113884 ?auto_113885 ) ) ( not ( = ?auto_113884 ?auto_113886 ) ) ( not ( = ?auto_113884 ?auto_113887 ) ) ( not ( = ?auto_113884 ?auto_113888 ) ) ( not ( = ?auto_113885 ?auto_113886 ) ) ( not ( = ?auto_113885 ?auto_113887 ) ) ( not ( = ?auto_113885 ?auto_113888 ) ) ( not ( = ?auto_113886 ?auto_113887 ) ) ( not ( = ?auto_113886 ?auto_113888 ) ) ( not ( = ?auto_113887 ?auto_113888 ) ) ( HOLDING ?auto_113889 ) ( not ( = ?auto_113883 ?auto_113889 ) ) ( not ( = ?auto_113884 ?auto_113889 ) ) ( not ( = ?auto_113885 ?auto_113889 ) ) ( not ( = ?auto_113886 ?auto_113889 ) ) ( not ( = ?auto_113887 ?auto_113889 ) ) ( not ( = ?auto_113888 ?auto_113889 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_113889 )
      ( MAKE-5PILE ?auto_113883 ?auto_113884 ?auto_113885 ?auto_113886 ?auto_113887 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_113890 - BLOCK
      ?auto_113891 - BLOCK
      ?auto_113892 - BLOCK
      ?auto_113893 - BLOCK
      ?auto_113894 - BLOCK
    )
    :vars
    (
      ?auto_113895 - BLOCK
      ?auto_113896 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113895 ?auto_113894 ) ( ON-TABLE ?auto_113890 ) ( ON ?auto_113891 ?auto_113890 ) ( ON ?auto_113892 ?auto_113891 ) ( ON ?auto_113893 ?auto_113892 ) ( ON ?auto_113894 ?auto_113893 ) ( not ( = ?auto_113890 ?auto_113891 ) ) ( not ( = ?auto_113890 ?auto_113892 ) ) ( not ( = ?auto_113890 ?auto_113893 ) ) ( not ( = ?auto_113890 ?auto_113894 ) ) ( not ( = ?auto_113890 ?auto_113895 ) ) ( not ( = ?auto_113891 ?auto_113892 ) ) ( not ( = ?auto_113891 ?auto_113893 ) ) ( not ( = ?auto_113891 ?auto_113894 ) ) ( not ( = ?auto_113891 ?auto_113895 ) ) ( not ( = ?auto_113892 ?auto_113893 ) ) ( not ( = ?auto_113892 ?auto_113894 ) ) ( not ( = ?auto_113892 ?auto_113895 ) ) ( not ( = ?auto_113893 ?auto_113894 ) ) ( not ( = ?auto_113893 ?auto_113895 ) ) ( not ( = ?auto_113894 ?auto_113895 ) ) ( not ( = ?auto_113890 ?auto_113896 ) ) ( not ( = ?auto_113891 ?auto_113896 ) ) ( not ( = ?auto_113892 ?auto_113896 ) ) ( not ( = ?auto_113893 ?auto_113896 ) ) ( not ( = ?auto_113894 ?auto_113896 ) ) ( not ( = ?auto_113895 ?auto_113896 ) ) ( ON ?auto_113896 ?auto_113895 ) ( CLEAR ?auto_113896 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_113890 ?auto_113891 ?auto_113892 ?auto_113893 ?auto_113894 ?auto_113895 )
      ( MAKE-5PILE ?auto_113890 ?auto_113891 ?auto_113892 ?auto_113893 ?auto_113894 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_113897 - BLOCK
      ?auto_113898 - BLOCK
      ?auto_113899 - BLOCK
      ?auto_113900 - BLOCK
      ?auto_113901 - BLOCK
    )
    :vars
    (
      ?auto_113902 - BLOCK
      ?auto_113903 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113902 ?auto_113901 ) ( ON-TABLE ?auto_113897 ) ( ON ?auto_113898 ?auto_113897 ) ( ON ?auto_113899 ?auto_113898 ) ( ON ?auto_113900 ?auto_113899 ) ( ON ?auto_113901 ?auto_113900 ) ( not ( = ?auto_113897 ?auto_113898 ) ) ( not ( = ?auto_113897 ?auto_113899 ) ) ( not ( = ?auto_113897 ?auto_113900 ) ) ( not ( = ?auto_113897 ?auto_113901 ) ) ( not ( = ?auto_113897 ?auto_113902 ) ) ( not ( = ?auto_113898 ?auto_113899 ) ) ( not ( = ?auto_113898 ?auto_113900 ) ) ( not ( = ?auto_113898 ?auto_113901 ) ) ( not ( = ?auto_113898 ?auto_113902 ) ) ( not ( = ?auto_113899 ?auto_113900 ) ) ( not ( = ?auto_113899 ?auto_113901 ) ) ( not ( = ?auto_113899 ?auto_113902 ) ) ( not ( = ?auto_113900 ?auto_113901 ) ) ( not ( = ?auto_113900 ?auto_113902 ) ) ( not ( = ?auto_113901 ?auto_113902 ) ) ( not ( = ?auto_113897 ?auto_113903 ) ) ( not ( = ?auto_113898 ?auto_113903 ) ) ( not ( = ?auto_113899 ?auto_113903 ) ) ( not ( = ?auto_113900 ?auto_113903 ) ) ( not ( = ?auto_113901 ?auto_113903 ) ) ( not ( = ?auto_113902 ?auto_113903 ) ) ( HOLDING ?auto_113903 ) ( CLEAR ?auto_113902 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_113897 ?auto_113898 ?auto_113899 ?auto_113900 ?auto_113901 ?auto_113902 ?auto_113903 )
      ( MAKE-5PILE ?auto_113897 ?auto_113898 ?auto_113899 ?auto_113900 ?auto_113901 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_113904 - BLOCK
      ?auto_113905 - BLOCK
      ?auto_113906 - BLOCK
      ?auto_113907 - BLOCK
      ?auto_113908 - BLOCK
    )
    :vars
    (
      ?auto_113909 - BLOCK
      ?auto_113910 - BLOCK
      ?auto_113911 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_113909 ?auto_113908 ) ( ON-TABLE ?auto_113904 ) ( ON ?auto_113905 ?auto_113904 ) ( ON ?auto_113906 ?auto_113905 ) ( ON ?auto_113907 ?auto_113906 ) ( ON ?auto_113908 ?auto_113907 ) ( not ( = ?auto_113904 ?auto_113905 ) ) ( not ( = ?auto_113904 ?auto_113906 ) ) ( not ( = ?auto_113904 ?auto_113907 ) ) ( not ( = ?auto_113904 ?auto_113908 ) ) ( not ( = ?auto_113904 ?auto_113909 ) ) ( not ( = ?auto_113905 ?auto_113906 ) ) ( not ( = ?auto_113905 ?auto_113907 ) ) ( not ( = ?auto_113905 ?auto_113908 ) ) ( not ( = ?auto_113905 ?auto_113909 ) ) ( not ( = ?auto_113906 ?auto_113907 ) ) ( not ( = ?auto_113906 ?auto_113908 ) ) ( not ( = ?auto_113906 ?auto_113909 ) ) ( not ( = ?auto_113907 ?auto_113908 ) ) ( not ( = ?auto_113907 ?auto_113909 ) ) ( not ( = ?auto_113908 ?auto_113909 ) ) ( not ( = ?auto_113904 ?auto_113910 ) ) ( not ( = ?auto_113905 ?auto_113910 ) ) ( not ( = ?auto_113906 ?auto_113910 ) ) ( not ( = ?auto_113907 ?auto_113910 ) ) ( not ( = ?auto_113908 ?auto_113910 ) ) ( not ( = ?auto_113909 ?auto_113910 ) ) ( CLEAR ?auto_113909 ) ( ON ?auto_113910 ?auto_113911 ) ( CLEAR ?auto_113910 ) ( HAND-EMPTY ) ( not ( = ?auto_113904 ?auto_113911 ) ) ( not ( = ?auto_113905 ?auto_113911 ) ) ( not ( = ?auto_113906 ?auto_113911 ) ) ( not ( = ?auto_113907 ?auto_113911 ) ) ( not ( = ?auto_113908 ?auto_113911 ) ) ( not ( = ?auto_113909 ?auto_113911 ) ) ( not ( = ?auto_113910 ?auto_113911 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_113910 ?auto_113911 )
      ( MAKE-5PILE ?auto_113904 ?auto_113905 ?auto_113906 ?auto_113907 ?auto_113908 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_113928 - BLOCK
      ?auto_113929 - BLOCK
      ?auto_113930 - BLOCK
      ?auto_113931 - BLOCK
      ?auto_113932 - BLOCK
    )
    :vars
    (
      ?auto_113935 - BLOCK
      ?auto_113934 - BLOCK
      ?auto_113933 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_113928 ) ( ON ?auto_113929 ?auto_113928 ) ( ON ?auto_113930 ?auto_113929 ) ( ON ?auto_113931 ?auto_113930 ) ( not ( = ?auto_113928 ?auto_113929 ) ) ( not ( = ?auto_113928 ?auto_113930 ) ) ( not ( = ?auto_113928 ?auto_113931 ) ) ( not ( = ?auto_113928 ?auto_113932 ) ) ( not ( = ?auto_113928 ?auto_113935 ) ) ( not ( = ?auto_113929 ?auto_113930 ) ) ( not ( = ?auto_113929 ?auto_113931 ) ) ( not ( = ?auto_113929 ?auto_113932 ) ) ( not ( = ?auto_113929 ?auto_113935 ) ) ( not ( = ?auto_113930 ?auto_113931 ) ) ( not ( = ?auto_113930 ?auto_113932 ) ) ( not ( = ?auto_113930 ?auto_113935 ) ) ( not ( = ?auto_113931 ?auto_113932 ) ) ( not ( = ?auto_113931 ?auto_113935 ) ) ( not ( = ?auto_113932 ?auto_113935 ) ) ( not ( = ?auto_113928 ?auto_113934 ) ) ( not ( = ?auto_113929 ?auto_113934 ) ) ( not ( = ?auto_113930 ?auto_113934 ) ) ( not ( = ?auto_113931 ?auto_113934 ) ) ( not ( = ?auto_113932 ?auto_113934 ) ) ( not ( = ?auto_113935 ?auto_113934 ) ) ( ON ?auto_113934 ?auto_113933 ) ( not ( = ?auto_113928 ?auto_113933 ) ) ( not ( = ?auto_113929 ?auto_113933 ) ) ( not ( = ?auto_113930 ?auto_113933 ) ) ( not ( = ?auto_113931 ?auto_113933 ) ) ( not ( = ?auto_113932 ?auto_113933 ) ) ( not ( = ?auto_113935 ?auto_113933 ) ) ( not ( = ?auto_113934 ?auto_113933 ) ) ( ON ?auto_113935 ?auto_113934 ) ( CLEAR ?auto_113935 ) ( HOLDING ?auto_113932 ) ( CLEAR ?auto_113931 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_113928 ?auto_113929 ?auto_113930 ?auto_113931 ?auto_113932 ?auto_113935 )
      ( MAKE-5PILE ?auto_113928 ?auto_113929 ?auto_113930 ?auto_113931 ?auto_113932 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_113936 - BLOCK
      ?auto_113937 - BLOCK
      ?auto_113938 - BLOCK
      ?auto_113939 - BLOCK
      ?auto_113940 - BLOCK
    )
    :vars
    (
      ?auto_113942 - BLOCK
      ?auto_113941 - BLOCK
      ?auto_113943 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_113936 ) ( ON ?auto_113937 ?auto_113936 ) ( ON ?auto_113938 ?auto_113937 ) ( ON ?auto_113939 ?auto_113938 ) ( not ( = ?auto_113936 ?auto_113937 ) ) ( not ( = ?auto_113936 ?auto_113938 ) ) ( not ( = ?auto_113936 ?auto_113939 ) ) ( not ( = ?auto_113936 ?auto_113940 ) ) ( not ( = ?auto_113936 ?auto_113942 ) ) ( not ( = ?auto_113937 ?auto_113938 ) ) ( not ( = ?auto_113937 ?auto_113939 ) ) ( not ( = ?auto_113937 ?auto_113940 ) ) ( not ( = ?auto_113937 ?auto_113942 ) ) ( not ( = ?auto_113938 ?auto_113939 ) ) ( not ( = ?auto_113938 ?auto_113940 ) ) ( not ( = ?auto_113938 ?auto_113942 ) ) ( not ( = ?auto_113939 ?auto_113940 ) ) ( not ( = ?auto_113939 ?auto_113942 ) ) ( not ( = ?auto_113940 ?auto_113942 ) ) ( not ( = ?auto_113936 ?auto_113941 ) ) ( not ( = ?auto_113937 ?auto_113941 ) ) ( not ( = ?auto_113938 ?auto_113941 ) ) ( not ( = ?auto_113939 ?auto_113941 ) ) ( not ( = ?auto_113940 ?auto_113941 ) ) ( not ( = ?auto_113942 ?auto_113941 ) ) ( ON ?auto_113941 ?auto_113943 ) ( not ( = ?auto_113936 ?auto_113943 ) ) ( not ( = ?auto_113937 ?auto_113943 ) ) ( not ( = ?auto_113938 ?auto_113943 ) ) ( not ( = ?auto_113939 ?auto_113943 ) ) ( not ( = ?auto_113940 ?auto_113943 ) ) ( not ( = ?auto_113942 ?auto_113943 ) ) ( not ( = ?auto_113941 ?auto_113943 ) ) ( ON ?auto_113942 ?auto_113941 ) ( CLEAR ?auto_113939 ) ( ON ?auto_113940 ?auto_113942 ) ( CLEAR ?auto_113940 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_113943 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_113943 ?auto_113941 ?auto_113942 )
      ( MAKE-5PILE ?auto_113936 ?auto_113937 ?auto_113938 ?auto_113939 ?auto_113940 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_113944 - BLOCK
      ?auto_113945 - BLOCK
      ?auto_113946 - BLOCK
      ?auto_113947 - BLOCK
      ?auto_113948 - BLOCK
    )
    :vars
    (
      ?auto_113951 - BLOCK
      ?auto_113950 - BLOCK
      ?auto_113949 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_113944 ) ( ON ?auto_113945 ?auto_113944 ) ( ON ?auto_113946 ?auto_113945 ) ( not ( = ?auto_113944 ?auto_113945 ) ) ( not ( = ?auto_113944 ?auto_113946 ) ) ( not ( = ?auto_113944 ?auto_113947 ) ) ( not ( = ?auto_113944 ?auto_113948 ) ) ( not ( = ?auto_113944 ?auto_113951 ) ) ( not ( = ?auto_113945 ?auto_113946 ) ) ( not ( = ?auto_113945 ?auto_113947 ) ) ( not ( = ?auto_113945 ?auto_113948 ) ) ( not ( = ?auto_113945 ?auto_113951 ) ) ( not ( = ?auto_113946 ?auto_113947 ) ) ( not ( = ?auto_113946 ?auto_113948 ) ) ( not ( = ?auto_113946 ?auto_113951 ) ) ( not ( = ?auto_113947 ?auto_113948 ) ) ( not ( = ?auto_113947 ?auto_113951 ) ) ( not ( = ?auto_113948 ?auto_113951 ) ) ( not ( = ?auto_113944 ?auto_113950 ) ) ( not ( = ?auto_113945 ?auto_113950 ) ) ( not ( = ?auto_113946 ?auto_113950 ) ) ( not ( = ?auto_113947 ?auto_113950 ) ) ( not ( = ?auto_113948 ?auto_113950 ) ) ( not ( = ?auto_113951 ?auto_113950 ) ) ( ON ?auto_113950 ?auto_113949 ) ( not ( = ?auto_113944 ?auto_113949 ) ) ( not ( = ?auto_113945 ?auto_113949 ) ) ( not ( = ?auto_113946 ?auto_113949 ) ) ( not ( = ?auto_113947 ?auto_113949 ) ) ( not ( = ?auto_113948 ?auto_113949 ) ) ( not ( = ?auto_113951 ?auto_113949 ) ) ( not ( = ?auto_113950 ?auto_113949 ) ) ( ON ?auto_113951 ?auto_113950 ) ( ON ?auto_113948 ?auto_113951 ) ( CLEAR ?auto_113948 ) ( ON-TABLE ?auto_113949 ) ( HOLDING ?auto_113947 ) ( CLEAR ?auto_113946 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_113944 ?auto_113945 ?auto_113946 ?auto_113947 )
      ( MAKE-5PILE ?auto_113944 ?auto_113945 ?auto_113946 ?auto_113947 ?auto_113948 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_113952 - BLOCK
      ?auto_113953 - BLOCK
      ?auto_113954 - BLOCK
      ?auto_113955 - BLOCK
      ?auto_113956 - BLOCK
    )
    :vars
    (
      ?auto_113958 - BLOCK
      ?auto_113957 - BLOCK
      ?auto_113959 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_113952 ) ( ON ?auto_113953 ?auto_113952 ) ( ON ?auto_113954 ?auto_113953 ) ( not ( = ?auto_113952 ?auto_113953 ) ) ( not ( = ?auto_113952 ?auto_113954 ) ) ( not ( = ?auto_113952 ?auto_113955 ) ) ( not ( = ?auto_113952 ?auto_113956 ) ) ( not ( = ?auto_113952 ?auto_113958 ) ) ( not ( = ?auto_113953 ?auto_113954 ) ) ( not ( = ?auto_113953 ?auto_113955 ) ) ( not ( = ?auto_113953 ?auto_113956 ) ) ( not ( = ?auto_113953 ?auto_113958 ) ) ( not ( = ?auto_113954 ?auto_113955 ) ) ( not ( = ?auto_113954 ?auto_113956 ) ) ( not ( = ?auto_113954 ?auto_113958 ) ) ( not ( = ?auto_113955 ?auto_113956 ) ) ( not ( = ?auto_113955 ?auto_113958 ) ) ( not ( = ?auto_113956 ?auto_113958 ) ) ( not ( = ?auto_113952 ?auto_113957 ) ) ( not ( = ?auto_113953 ?auto_113957 ) ) ( not ( = ?auto_113954 ?auto_113957 ) ) ( not ( = ?auto_113955 ?auto_113957 ) ) ( not ( = ?auto_113956 ?auto_113957 ) ) ( not ( = ?auto_113958 ?auto_113957 ) ) ( ON ?auto_113957 ?auto_113959 ) ( not ( = ?auto_113952 ?auto_113959 ) ) ( not ( = ?auto_113953 ?auto_113959 ) ) ( not ( = ?auto_113954 ?auto_113959 ) ) ( not ( = ?auto_113955 ?auto_113959 ) ) ( not ( = ?auto_113956 ?auto_113959 ) ) ( not ( = ?auto_113958 ?auto_113959 ) ) ( not ( = ?auto_113957 ?auto_113959 ) ) ( ON ?auto_113958 ?auto_113957 ) ( ON ?auto_113956 ?auto_113958 ) ( ON-TABLE ?auto_113959 ) ( CLEAR ?auto_113954 ) ( ON ?auto_113955 ?auto_113956 ) ( CLEAR ?auto_113955 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_113959 ?auto_113957 ?auto_113958 ?auto_113956 )
      ( MAKE-5PILE ?auto_113952 ?auto_113953 ?auto_113954 ?auto_113955 ?auto_113956 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_113960 - BLOCK
      ?auto_113961 - BLOCK
      ?auto_113962 - BLOCK
      ?auto_113963 - BLOCK
      ?auto_113964 - BLOCK
    )
    :vars
    (
      ?auto_113966 - BLOCK
      ?auto_113965 - BLOCK
      ?auto_113967 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_113960 ) ( ON ?auto_113961 ?auto_113960 ) ( not ( = ?auto_113960 ?auto_113961 ) ) ( not ( = ?auto_113960 ?auto_113962 ) ) ( not ( = ?auto_113960 ?auto_113963 ) ) ( not ( = ?auto_113960 ?auto_113964 ) ) ( not ( = ?auto_113960 ?auto_113966 ) ) ( not ( = ?auto_113961 ?auto_113962 ) ) ( not ( = ?auto_113961 ?auto_113963 ) ) ( not ( = ?auto_113961 ?auto_113964 ) ) ( not ( = ?auto_113961 ?auto_113966 ) ) ( not ( = ?auto_113962 ?auto_113963 ) ) ( not ( = ?auto_113962 ?auto_113964 ) ) ( not ( = ?auto_113962 ?auto_113966 ) ) ( not ( = ?auto_113963 ?auto_113964 ) ) ( not ( = ?auto_113963 ?auto_113966 ) ) ( not ( = ?auto_113964 ?auto_113966 ) ) ( not ( = ?auto_113960 ?auto_113965 ) ) ( not ( = ?auto_113961 ?auto_113965 ) ) ( not ( = ?auto_113962 ?auto_113965 ) ) ( not ( = ?auto_113963 ?auto_113965 ) ) ( not ( = ?auto_113964 ?auto_113965 ) ) ( not ( = ?auto_113966 ?auto_113965 ) ) ( ON ?auto_113965 ?auto_113967 ) ( not ( = ?auto_113960 ?auto_113967 ) ) ( not ( = ?auto_113961 ?auto_113967 ) ) ( not ( = ?auto_113962 ?auto_113967 ) ) ( not ( = ?auto_113963 ?auto_113967 ) ) ( not ( = ?auto_113964 ?auto_113967 ) ) ( not ( = ?auto_113966 ?auto_113967 ) ) ( not ( = ?auto_113965 ?auto_113967 ) ) ( ON ?auto_113966 ?auto_113965 ) ( ON ?auto_113964 ?auto_113966 ) ( ON-TABLE ?auto_113967 ) ( ON ?auto_113963 ?auto_113964 ) ( CLEAR ?auto_113963 ) ( HOLDING ?auto_113962 ) ( CLEAR ?auto_113961 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_113960 ?auto_113961 ?auto_113962 )
      ( MAKE-5PILE ?auto_113960 ?auto_113961 ?auto_113962 ?auto_113963 ?auto_113964 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_113968 - BLOCK
      ?auto_113969 - BLOCK
      ?auto_113970 - BLOCK
      ?auto_113971 - BLOCK
      ?auto_113972 - BLOCK
    )
    :vars
    (
      ?auto_113974 - BLOCK
      ?auto_113973 - BLOCK
      ?auto_113975 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_113968 ) ( ON ?auto_113969 ?auto_113968 ) ( not ( = ?auto_113968 ?auto_113969 ) ) ( not ( = ?auto_113968 ?auto_113970 ) ) ( not ( = ?auto_113968 ?auto_113971 ) ) ( not ( = ?auto_113968 ?auto_113972 ) ) ( not ( = ?auto_113968 ?auto_113974 ) ) ( not ( = ?auto_113969 ?auto_113970 ) ) ( not ( = ?auto_113969 ?auto_113971 ) ) ( not ( = ?auto_113969 ?auto_113972 ) ) ( not ( = ?auto_113969 ?auto_113974 ) ) ( not ( = ?auto_113970 ?auto_113971 ) ) ( not ( = ?auto_113970 ?auto_113972 ) ) ( not ( = ?auto_113970 ?auto_113974 ) ) ( not ( = ?auto_113971 ?auto_113972 ) ) ( not ( = ?auto_113971 ?auto_113974 ) ) ( not ( = ?auto_113972 ?auto_113974 ) ) ( not ( = ?auto_113968 ?auto_113973 ) ) ( not ( = ?auto_113969 ?auto_113973 ) ) ( not ( = ?auto_113970 ?auto_113973 ) ) ( not ( = ?auto_113971 ?auto_113973 ) ) ( not ( = ?auto_113972 ?auto_113973 ) ) ( not ( = ?auto_113974 ?auto_113973 ) ) ( ON ?auto_113973 ?auto_113975 ) ( not ( = ?auto_113968 ?auto_113975 ) ) ( not ( = ?auto_113969 ?auto_113975 ) ) ( not ( = ?auto_113970 ?auto_113975 ) ) ( not ( = ?auto_113971 ?auto_113975 ) ) ( not ( = ?auto_113972 ?auto_113975 ) ) ( not ( = ?auto_113974 ?auto_113975 ) ) ( not ( = ?auto_113973 ?auto_113975 ) ) ( ON ?auto_113974 ?auto_113973 ) ( ON ?auto_113972 ?auto_113974 ) ( ON-TABLE ?auto_113975 ) ( ON ?auto_113971 ?auto_113972 ) ( CLEAR ?auto_113969 ) ( ON ?auto_113970 ?auto_113971 ) ( CLEAR ?auto_113970 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_113975 ?auto_113973 ?auto_113974 ?auto_113972 ?auto_113971 )
      ( MAKE-5PILE ?auto_113968 ?auto_113969 ?auto_113970 ?auto_113971 ?auto_113972 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_113976 - BLOCK
      ?auto_113977 - BLOCK
      ?auto_113978 - BLOCK
      ?auto_113979 - BLOCK
      ?auto_113980 - BLOCK
    )
    :vars
    (
      ?auto_113981 - BLOCK
      ?auto_113983 - BLOCK
      ?auto_113982 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_113976 ) ( not ( = ?auto_113976 ?auto_113977 ) ) ( not ( = ?auto_113976 ?auto_113978 ) ) ( not ( = ?auto_113976 ?auto_113979 ) ) ( not ( = ?auto_113976 ?auto_113980 ) ) ( not ( = ?auto_113976 ?auto_113981 ) ) ( not ( = ?auto_113977 ?auto_113978 ) ) ( not ( = ?auto_113977 ?auto_113979 ) ) ( not ( = ?auto_113977 ?auto_113980 ) ) ( not ( = ?auto_113977 ?auto_113981 ) ) ( not ( = ?auto_113978 ?auto_113979 ) ) ( not ( = ?auto_113978 ?auto_113980 ) ) ( not ( = ?auto_113978 ?auto_113981 ) ) ( not ( = ?auto_113979 ?auto_113980 ) ) ( not ( = ?auto_113979 ?auto_113981 ) ) ( not ( = ?auto_113980 ?auto_113981 ) ) ( not ( = ?auto_113976 ?auto_113983 ) ) ( not ( = ?auto_113977 ?auto_113983 ) ) ( not ( = ?auto_113978 ?auto_113983 ) ) ( not ( = ?auto_113979 ?auto_113983 ) ) ( not ( = ?auto_113980 ?auto_113983 ) ) ( not ( = ?auto_113981 ?auto_113983 ) ) ( ON ?auto_113983 ?auto_113982 ) ( not ( = ?auto_113976 ?auto_113982 ) ) ( not ( = ?auto_113977 ?auto_113982 ) ) ( not ( = ?auto_113978 ?auto_113982 ) ) ( not ( = ?auto_113979 ?auto_113982 ) ) ( not ( = ?auto_113980 ?auto_113982 ) ) ( not ( = ?auto_113981 ?auto_113982 ) ) ( not ( = ?auto_113983 ?auto_113982 ) ) ( ON ?auto_113981 ?auto_113983 ) ( ON ?auto_113980 ?auto_113981 ) ( ON-TABLE ?auto_113982 ) ( ON ?auto_113979 ?auto_113980 ) ( ON ?auto_113978 ?auto_113979 ) ( CLEAR ?auto_113978 ) ( HOLDING ?auto_113977 ) ( CLEAR ?auto_113976 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_113976 ?auto_113977 )
      ( MAKE-5PILE ?auto_113976 ?auto_113977 ?auto_113978 ?auto_113979 ?auto_113980 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_113984 - BLOCK
      ?auto_113985 - BLOCK
      ?auto_113986 - BLOCK
      ?auto_113987 - BLOCK
      ?auto_113988 - BLOCK
    )
    :vars
    (
      ?auto_113989 - BLOCK
      ?auto_113990 - BLOCK
      ?auto_113991 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_113984 ) ( not ( = ?auto_113984 ?auto_113985 ) ) ( not ( = ?auto_113984 ?auto_113986 ) ) ( not ( = ?auto_113984 ?auto_113987 ) ) ( not ( = ?auto_113984 ?auto_113988 ) ) ( not ( = ?auto_113984 ?auto_113989 ) ) ( not ( = ?auto_113985 ?auto_113986 ) ) ( not ( = ?auto_113985 ?auto_113987 ) ) ( not ( = ?auto_113985 ?auto_113988 ) ) ( not ( = ?auto_113985 ?auto_113989 ) ) ( not ( = ?auto_113986 ?auto_113987 ) ) ( not ( = ?auto_113986 ?auto_113988 ) ) ( not ( = ?auto_113986 ?auto_113989 ) ) ( not ( = ?auto_113987 ?auto_113988 ) ) ( not ( = ?auto_113987 ?auto_113989 ) ) ( not ( = ?auto_113988 ?auto_113989 ) ) ( not ( = ?auto_113984 ?auto_113990 ) ) ( not ( = ?auto_113985 ?auto_113990 ) ) ( not ( = ?auto_113986 ?auto_113990 ) ) ( not ( = ?auto_113987 ?auto_113990 ) ) ( not ( = ?auto_113988 ?auto_113990 ) ) ( not ( = ?auto_113989 ?auto_113990 ) ) ( ON ?auto_113990 ?auto_113991 ) ( not ( = ?auto_113984 ?auto_113991 ) ) ( not ( = ?auto_113985 ?auto_113991 ) ) ( not ( = ?auto_113986 ?auto_113991 ) ) ( not ( = ?auto_113987 ?auto_113991 ) ) ( not ( = ?auto_113988 ?auto_113991 ) ) ( not ( = ?auto_113989 ?auto_113991 ) ) ( not ( = ?auto_113990 ?auto_113991 ) ) ( ON ?auto_113989 ?auto_113990 ) ( ON ?auto_113988 ?auto_113989 ) ( ON-TABLE ?auto_113991 ) ( ON ?auto_113987 ?auto_113988 ) ( ON ?auto_113986 ?auto_113987 ) ( CLEAR ?auto_113984 ) ( ON ?auto_113985 ?auto_113986 ) ( CLEAR ?auto_113985 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_113991 ?auto_113990 ?auto_113989 ?auto_113988 ?auto_113987 ?auto_113986 )
      ( MAKE-5PILE ?auto_113984 ?auto_113985 ?auto_113986 ?auto_113987 ?auto_113988 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_113992 - BLOCK
      ?auto_113993 - BLOCK
      ?auto_113994 - BLOCK
      ?auto_113995 - BLOCK
      ?auto_113996 - BLOCK
    )
    :vars
    (
      ?auto_113998 - BLOCK
      ?auto_113997 - BLOCK
      ?auto_113999 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_113992 ?auto_113993 ) ) ( not ( = ?auto_113992 ?auto_113994 ) ) ( not ( = ?auto_113992 ?auto_113995 ) ) ( not ( = ?auto_113992 ?auto_113996 ) ) ( not ( = ?auto_113992 ?auto_113998 ) ) ( not ( = ?auto_113993 ?auto_113994 ) ) ( not ( = ?auto_113993 ?auto_113995 ) ) ( not ( = ?auto_113993 ?auto_113996 ) ) ( not ( = ?auto_113993 ?auto_113998 ) ) ( not ( = ?auto_113994 ?auto_113995 ) ) ( not ( = ?auto_113994 ?auto_113996 ) ) ( not ( = ?auto_113994 ?auto_113998 ) ) ( not ( = ?auto_113995 ?auto_113996 ) ) ( not ( = ?auto_113995 ?auto_113998 ) ) ( not ( = ?auto_113996 ?auto_113998 ) ) ( not ( = ?auto_113992 ?auto_113997 ) ) ( not ( = ?auto_113993 ?auto_113997 ) ) ( not ( = ?auto_113994 ?auto_113997 ) ) ( not ( = ?auto_113995 ?auto_113997 ) ) ( not ( = ?auto_113996 ?auto_113997 ) ) ( not ( = ?auto_113998 ?auto_113997 ) ) ( ON ?auto_113997 ?auto_113999 ) ( not ( = ?auto_113992 ?auto_113999 ) ) ( not ( = ?auto_113993 ?auto_113999 ) ) ( not ( = ?auto_113994 ?auto_113999 ) ) ( not ( = ?auto_113995 ?auto_113999 ) ) ( not ( = ?auto_113996 ?auto_113999 ) ) ( not ( = ?auto_113998 ?auto_113999 ) ) ( not ( = ?auto_113997 ?auto_113999 ) ) ( ON ?auto_113998 ?auto_113997 ) ( ON ?auto_113996 ?auto_113998 ) ( ON-TABLE ?auto_113999 ) ( ON ?auto_113995 ?auto_113996 ) ( ON ?auto_113994 ?auto_113995 ) ( ON ?auto_113993 ?auto_113994 ) ( CLEAR ?auto_113993 ) ( HOLDING ?auto_113992 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_113992 )
      ( MAKE-5PILE ?auto_113992 ?auto_113993 ?auto_113994 ?auto_113995 ?auto_113996 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_114000 - BLOCK
      ?auto_114001 - BLOCK
      ?auto_114002 - BLOCK
      ?auto_114003 - BLOCK
      ?auto_114004 - BLOCK
    )
    :vars
    (
      ?auto_114005 - BLOCK
      ?auto_114007 - BLOCK
      ?auto_114006 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114000 ?auto_114001 ) ) ( not ( = ?auto_114000 ?auto_114002 ) ) ( not ( = ?auto_114000 ?auto_114003 ) ) ( not ( = ?auto_114000 ?auto_114004 ) ) ( not ( = ?auto_114000 ?auto_114005 ) ) ( not ( = ?auto_114001 ?auto_114002 ) ) ( not ( = ?auto_114001 ?auto_114003 ) ) ( not ( = ?auto_114001 ?auto_114004 ) ) ( not ( = ?auto_114001 ?auto_114005 ) ) ( not ( = ?auto_114002 ?auto_114003 ) ) ( not ( = ?auto_114002 ?auto_114004 ) ) ( not ( = ?auto_114002 ?auto_114005 ) ) ( not ( = ?auto_114003 ?auto_114004 ) ) ( not ( = ?auto_114003 ?auto_114005 ) ) ( not ( = ?auto_114004 ?auto_114005 ) ) ( not ( = ?auto_114000 ?auto_114007 ) ) ( not ( = ?auto_114001 ?auto_114007 ) ) ( not ( = ?auto_114002 ?auto_114007 ) ) ( not ( = ?auto_114003 ?auto_114007 ) ) ( not ( = ?auto_114004 ?auto_114007 ) ) ( not ( = ?auto_114005 ?auto_114007 ) ) ( ON ?auto_114007 ?auto_114006 ) ( not ( = ?auto_114000 ?auto_114006 ) ) ( not ( = ?auto_114001 ?auto_114006 ) ) ( not ( = ?auto_114002 ?auto_114006 ) ) ( not ( = ?auto_114003 ?auto_114006 ) ) ( not ( = ?auto_114004 ?auto_114006 ) ) ( not ( = ?auto_114005 ?auto_114006 ) ) ( not ( = ?auto_114007 ?auto_114006 ) ) ( ON ?auto_114005 ?auto_114007 ) ( ON ?auto_114004 ?auto_114005 ) ( ON-TABLE ?auto_114006 ) ( ON ?auto_114003 ?auto_114004 ) ( ON ?auto_114002 ?auto_114003 ) ( ON ?auto_114001 ?auto_114002 ) ( ON ?auto_114000 ?auto_114001 ) ( CLEAR ?auto_114000 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_114006 ?auto_114007 ?auto_114005 ?auto_114004 ?auto_114003 ?auto_114002 ?auto_114001 )
      ( MAKE-5PILE ?auto_114000 ?auto_114001 ?auto_114002 ?auto_114003 ?auto_114004 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_114010 - BLOCK
      ?auto_114011 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_114011 ) ( CLEAR ?auto_114010 ) ( ON-TABLE ?auto_114010 ) ( not ( = ?auto_114010 ?auto_114011 ) ) )
    :subtasks
    ( ( !STACK ?auto_114011 ?auto_114010 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_114012 - BLOCK
      ?auto_114013 - BLOCK
    )
    :vars
    (
      ?auto_114014 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_114012 ) ( ON-TABLE ?auto_114012 ) ( not ( = ?auto_114012 ?auto_114013 ) ) ( ON ?auto_114013 ?auto_114014 ) ( CLEAR ?auto_114013 ) ( HAND-EMPTY ) ( not ( = ?auto_114012 ?auto_114014 ) ) ( not ( = ?auto_114013 ?auto_114014 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_114013 ?auto_114014 )
      ( MAKE-2PILE ?auto_114012 ?auto_114013 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_114015 - BLOCK
      ?auto_114016 - BLOCK
    )
    :vars
    (
      ?auto_114017 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114015 ?auto_114016 ) ) ( ON ?auto_114016 ?auto_114017 ) ( CLEAR ?auto_114016 ) ( not ( = ?auto_114015 ?auto_114017 ) ) ( not ( = ?auto_114016 ?auto_114017 ) ) ( HOLDING ?auto_114015 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_114015 )
      ( MAKE-2PILE ?auto_114015 ?auto_114016 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_114018 - BLOCK
      ?auto_114019 - BLOCK
    )
    :vars
    (
      ?auto_114020 - BLOCK
      ?auto_114022 - BLOCK
      ?auto_114023 - BLOCK
      ?auto_114024 - BLOCK
      ?auto_114021 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114018 ?auto_114019 ) ) ( ON ?auto_114019 ?auto_114020 ) ( not ( = ?auto_114018 ?auto_114020 ) ) ( not ( = ?auto_114019 ?auto_114020 ) ) ( ON ?auto_114018 ?auto_114019 ) ( CLEAR ?auto_114018 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_114022 ) ( ON ?auto_114023 ?auto_114022 ) ( ON ?auto_114024 ?auto_114023 ) ( ON ?auto_114021 ?auto_114024 ) ( ON ?auto_114020 ?auto_114021 ) ( not ( = ?auto_114022 ?auto_114023 ) ) ( not ( = ?auto_114022 ?auto_114024 ) ) ( not ( = ?auto_114022 ?auto_114021 ) ) ( not ( = ?auto_114022 ?auto_114020 ) ) ( not ( = ?auto_114022 ?auto_114019 ) ) ( not ( = ?auto_114022 ?auto_114018 ) ) ( not ( = ?auto_114023 ?auto_114024 ) ) ( not ( = ?auto_114023 ?auto_114021 ) ) ( not ( = ?auto_114023 ?auto_114020 ) ) ( not ( = ?auto_114023 ?auto_114019 ) ) ( not ( = ?auto_114023 ?auto_114018 ) ) ( not ( = ?auto_114024 ?auto_114021 ) ) ( not ( = ?auto_114024 ?auto_114020 ) ) ( not ( = ?auto_114024 ?auto_114019 ) ) ( not ( = ?auto_114024 ?auto_114018 ) ) ( not ( = ?auto_114021 ?auto_114020 ) ) ( not ( = ?auto_114021 ?auto_114019 ) ) ( not ( = ?auto_114021 ?auto_114018 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_114022 ?auto_114023 ?auto_114024 ?auto_114021 ?auto_114020 ?auto_114019 )
      ( MAKE-2PILE ?auto_114018 ?auto_114019 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_114025 - BLOCK
      ?auto_114026 - BLOCK
    )
    :vars
    (
      ?auto_114031 - BLOCK
      ?auto_114030 - BLOCK
      ?auto_114029 - BLOCK
      ?auto_114027 - BLOCK
      ?auto_114028 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114025 ?auto_114026 ) ) ( ON ?auto_114026 ?auto_114031 ) ( not ( = ?auto_114025 ?auto_114031 ) ) ( not ( = ?auto_114026 ?auto_114031 ) ) ( ON-TABLE ?auto_114030 ) ( ON ?auto_114029 ?auto_114030 ) ( ON ?auto_114027 ?auto_114029 ) ( ON ?auto_114028 ?auto_114027 ) ( ON ?auto_114031 ?auto_114028 ) ( not ( = ?auto_114030 ?auto_114029 ) ) ( not ( = ?auto_114030 ?auto_114027 ) ) ( not ( = ?auto_114030 ?auto_114028 ) ) ( not ( = ?auto_114030 ?auto_114031 ) ) ( not ( = ?auto_114030 ?auto_114026 ) ) ( not ( = ?auto_114030 ?auto_114025 ) ) ( not ( = ?auto_114029 ?auto_114027 ) ) ( not ( = ?auto_114029 ?auto_114028 ) ) ( not ( = ?auto_114029 ?auto_114031 ) ) ( not ( = ?auto_114029 ?auto_114026 ) ) ( not ( = ?auto_114029 ?auto_114025 ) ) ( not ( = ?auto_114027 ?auto_114028 ) ) ( not ( = ?auto_114027 ?auto_114031 ) ) ( not ( = ?auto_114027 ?auto_114026 ) ) ( not ( = ?auto_114027 ?auto_114025 ) ) ( not ( = ?auto_114028 ?auto_114031 ) ) ( not ( = ?auto_114028 ?auto_114026 ) ) ( not ( = ?auto_114028 ?auto_114025 ) ) ( HOLDING ?auto_114025 ) ( CLEAR ?auto_114026 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_114030 ?auto_114029 ?auto_114027 ?auto_114028 ?auto_114031 ?auto_114026 ?auto_114025 )
      ( MAKE-2PILE ?auto_114025 ?auto_114026 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_114032 - BLOCK
      ?auto_114033 - BLOCK
    )
    :vars
    (
      ?auto_114038 - BLOCK
      ?auto_114034 - BLOCK
      ?auto_114036 - BLOCK
      ?auto_114035 - BLOCK
      ?auto_114037 - BLOCK
      ?auto_114039 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114032 ?auto_114033 ) ) ( ON ?auto_114033 ?auto_114038 ) ( not ( = ?auto_114032 ?auto_114038 ) ) ( not ( = ?auto_114033 ?auto_114038 ) ) ( ON-TABLE ?auto_114034 ) ( ON ?auto_114036 ?auto_114034 ) ( ON ?auto_114035 ?auto_114036 ) ( ON ?auto_114037 ?auto_114035 ) ( ON ?auto_114038 ?auto_114037 ) ( not ( = ?auto_114034 ?auto_114036 ) ) ( not ( = ?auto_114034 ?auto_114035 ) ) ( not ( = ?auto_114034 ?auto_114037 ) ) ( not ( = ?auto_114034 ?auto_114038 ) ) ( not ( = ?auto_114034 ?auto_114033 ) ) ( not ( = ?auto_114034 ?auto_114032 ) ) ( not ( = ?auto_114036 ?auto_114035 ) ) ( not ( = ?auto_114036 ?auto_114037 ) ) ( not ( = ?auto_114036 ?auto_114038 ) ) ( not ( = ?auto_114036 ?auto_114033 ) ) ( not ( = ?auto_114036 ?auto_114032 ) ) ( not ( = ?auto_114035 ?auto_114037 ) ) ( not ( = ?auto_114035 ?auto_114038 ) ) ( not ( = ?auto_114035 ?auto_114033 ) ) ( not ( = ?auto_114035 ?auto_114032 ) ) ( not ( = ?auto_114037 ?auto_114038 ) ) ( not ( = ?auto_114037 ?auto_114033 ) ) ( not ( = ?auto_114037 ?auto_114032 ) ) ( CLEAR ?auto_114033 ) ( ON ?auto_114032 ?auto_114039 ) ( CLEAR ?auto_114032 ) ( HAND-EMPTY ) ( not ( = ?auto_114032 ?auto_114039 ) ) ( not ( = ?auto_114033 ?auto_114039 ) ) ( not ( = ?auto_114038 ?auto_114039 ) ) ( not ( = ?auto_114034 ?auto_114039 ) ) ( not ( = ?auto_114036 ?auto_114039 ) ) ( not ( = ?auto_114035 ?auto_114039 ) ) ( not ( = ?auto_114037 ?auto_114039 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_114032 ?auto_114039 )
      ( MAKE-2PILE ?auto_114032 ?auto_114033 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_114040 - BLOCK
      ?auto_114041 - BLOCK
    )
    :vars
    (
      ?auto_114044 - BLOCK
      ?auto_114047 - BLOCK
      ?auto_114045 - BLOCK
      ?auto_114042 - BLOCK
      ?auto_114046 - BLOCK
      ?auto_114043 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114040 ?auto_114041 ) ) ( not ( = ?auto_114040 ?auto_114044 ) ) ( not ( = ?auto_114041 ?auto_114044 ) ) ( ON-TABLE ?auto_114047 ) ( ON ?auto_114045 ?auto_114047 ) ( ON ?auto_114042 ?auto_114045 ) ( ON ?auto_114046 ?auto_114042 ) ( ON ?auto_114044 ?auto_114046 ) ( not ( = ?auto_114047 ?auto_114045 ) ) ( not ( = ?auto_114047 ?auto_114042 ) ) ( not ( = ?auto_114047 ?auto_114046 ) ) ( not ( = ?auto_114047 ?auto_114044 ) ) ( not ( = ?auto_114047 ?auto_114041 ) ) ( not ( = ?auto_114047 ?auto_114040 ) ) ( not ( = ?auto_114045 ?auto_114042 ) ) ( not ( = ?auto_114045 ?auto_114046 ) ) ( not ( = ?auto_114045 ?auto_114044 ) ) ( not ( = ?auto_114045 ?auto_114041 ) ) ( not ( = ?auto_114045 ?auto_114040 ) ) ( not ( = ?auto_114042 ?auto_114046 ) ) ( not ( = ?auto_114042 ?auto_114044 ) ) ( not ( = ?auto_114042 ?auto_114041 ) ) ( not ( = ?auto_114042 ?auto_114040 ) ) ( not ( = ?auto_114046 ?auto_114044 ) ) ( not ( = ?auto_114046 ?auto_114041 ) ) ( not ( = ?auto_114046 ?auto_114040 ) ) ( ON ?auto_114040 ?auto_114043 ) ( CLEAR ?auto_114040 ) ( not ( = ?auto_114040 ?auto_114043 ) ) ( not ( = ?auto_114041 ?auto_114043 ) ) ( not ( = ?auto_114044 ?auto_114043 ) ) ( not ( = ?auto_114047 ?auto_114043 ) ) ( not ( = ?auto_114045 ?auto_114043 ) ) ( not ( = ?auto_114042 ?auto_114043 ) ) ( not ( = ?auto_114046 ?auto_114043 ) ) ( HOLDING ?auto_114041 ) ( CLEAR ?auto_114044 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_114047 ?auto_114045 ?auto_114042 ?auto_114046 ?auto_114044 ?auto_114041 )
      ( MAKE-2PILE ?auto_114040 ?auto_114041 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_114048 - BLOCK
      ?auto_114049 - BLOCK
    )
    :vars
    (
      ?auto_114051 - BLOCK
      ?auto_114052 - BLOCK
      ?auto_114055 - BLOCK
      ?auto_114050 - BLOCK
      ?auto_114053 - BLOCK
      ?auto_114054 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114048 ?auto_114049 ) ) ( not ( = ?auto_114048 ?auto_114051 ) ) ( not ( = ?auto_114049 ?auto_114051 ) ) ( ON-TABLE ?auto_114052 ) ( ON ?auto_114055 ?auto_114052 ) ( ON ?auto_114050 ?auto_114055 ) ( ON ?auto_114053 ?auto_114050 ) ( ON ?auto_114051 ?auto_114053 ) ( not ( = ?auto_114052 ?auto_114055 ) ) ( not ( = ?auto_114052 ?auto_114050 ) ) ( not ( = ?auto_114052 ?auto_114053 ) ) ( not ( = ?auto_114052 ?auto_114051 ) ) ( not ( = ?auto_114052 ?auto_114049 ) ) ( not ( = ?auto_114052 ?auto_114048 ) ) ( not ( = ?auto_114055 ?auto_114050 ) ) ( not ( = ?auto_114055 ?auto_114053 ) ) ( not ( = ?auto_114055 ?auto_114051 ) ) ( not ( = ?auto_114055 ?auto_114049 ) ) ( not ( = ?auto_114055 ?auto_114048 ) ) ( not ( = ?auto_114050 ?auto_114053 ) ) ( not ( = ?auto_114050 ?auto_114051 ) ) ( not ( = ?auto_114050 ?auto_114049 ) ) ( not ( = ?auto_114050 ?auto_114048 ) ) ( not ( = ?auto_114053 ?auto_114051 ) ) ( not ( = ?auto_114053 ?auto_114049 ) ) ( not ( = ?auto_114053 ?auto_114048 ) ) ( ON ?auto_114048 ?auto_114054 ) ( not ( = ?auto_114048 ?auto_114054 ) ) ( not ( = ?auto_114049 ?auto_114054 ) ) ( not ( = ?auto_114051 ?auto_114054 ) ) ( not ( = ?auto_114052 ?auto_114054 ) ) ( not ( = ?auto_114055 ?auto_114054 ) ) ( not ( = ?auto_114050 ?auto_114054 ) ) ( not ( = ?auto_114053 ?auto_114054 ) ) ( CLEAR ?auto_114051 ) ( ON ?auto_114049 ?auto_114048 ) ( CLEAR ?auto_114049 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_114054 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_114054 ?auto_114048 )
      ( MAKE-2PILE ?auto_114048 ?auto_114049 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_114056 - BLOCK
      ?auto_114057 - BLOCK
    )
    :vars
    (
      ?auto_114060 - BLOCK
      ?auto_114063 - BLOCK
      ?auto_114058 - BLOCK
      ?auto_114062 - BLOCK
      ?auto_114061 - BLOCK
      ?auto_114059 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114056 ?auto_114057 ) ) ( not ( = ?auto_114056 ?auto_114060 ) ) ( not ( = ?auto_114057 ?auto_114060 ) ) ( ON-TABLE ?auto_114063 ) ( ON ?auto_114058 ?auto_114063 ) ( ON ?auto_114062 ?auto_114058 ) ( ON ?auto_114061 ?auto_114062 ) ( not ( = ?auto_114063 ?auto_114058 ) ) ( not ( = ?auto_114063 ?auto_114062 ) ) ( not ( = ?auto_114063 ?auto_114061 ) ) ( not ( = ?auto_114063 ?auto_114060 ) ) ( not ( = ?auto_114063 ?auto_114057 ) ) ( not ( = ?auto_114063 ?auto_114056 ) ) ( not ( = ?auto_114058 ?auto_114062 ) ) ( not ( = ?auto_114058 ?auto_114061 ) ) ( not ( = ?auto_114058 ?auto_114060 ) ) ( not ( = ?auto_114058 ?auto_114057 ) ) ( not ( = ?auto_114058 ?auto_114056 ) ) ( not ( = ?auto_114062 ?auto_114061 ) ) ( not ( = ?auto_114062 ?auto_114060 ) ) ( not ( = ?auto_114062 ?auto_114057 ) ) ( not ( = ?auto_114062 ?auto_114056 ) ) ( not ( = ?auto_114061 ?auto_114060 ) ) ( not ( = ?auto_114061 ?auto_114057 ) ) ( not ( = ?auto_114061 ?auto_114056 ) ) ( ON ?auto_114056 ?auto_114059 ) ( not ( = ?auto_114056 ?auto_114059 ) ) ( not ( = ?auto_114057 ?auto_114059 ) ) ( not ( = ?auto_114060 ?auto_114059 ) ) ( not ( = ?auto_114063 ?auto_114059 ) ) ( not ( = ?auto_114058 ?auto_114059 ) ) ( not ( = ?auto_114062 ?auto_114059 ) ) ( not ( = ?auto_114061 ?auto_114059 ) ) ( ON ?auto_114057 ?auto_114056 ) ( CLEAR ?auto_114057 ) ( ON-TABLE ?auto_114059 ) ( HOLDING ?auto_114060 ) ( CLEAR ?auto_114061 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_114063 ?auto_114058 ?auto_114062 ?auto_114061 ?auto_114060 )
      ( MAKE-2PILE ?auto_114056 ?auto_114057 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_114064 - BLOCK
      ?auto_114065 - BLOCK
    )
    :vars
    (
      ?auto_114066 - BLOCK
      ?auto_114068 - BLOCK
      ?auto_114071 - BLOCK
      ?auto_114067 - BLOCK
      ?auto_114070 - BLOCK
      ?auto_114069 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114064 ?auto_114065 ) ) ( not ( = ?auto_114064 ?auto_114066 ) ) ( not ( = ?auto_114065 ?auto_114066 ) ) ( ON-TABLE ?auto_114068 ) ( ON ?auto_114071 ?auto_114068 ) ( ON ?auto_114067 ?auto_114071 ) ( ON ?auto_114070 ?auto_114067 ) ( not ( = ?auto_114068 ?auto_114071 ) ) ( not ( = ?auto_114068 ?auto_114067 ) ) ( not ( = ?auto_114068 ?auto_114070 ) ) ( not ( = ?auto_114068 ?auto_114066 ) ) ( not ( = ?auto_114068 ?auto_114065 ) ) ( not ( = ?auto_114068 ?auto_114064 ) ) ( not ( = ?auto_114071 ?auto_114067 ) ) ( not ( = ?auto_114071 ?auto_114070 ) ) ( not ( = ?auto_114071 ?auto_114066 ) ) ( not ( = ?auto_114071 ?auto_114065 ) ) ( not ( = ?auto_114071 ?auto_114064 ) ) ( not ( = ?auto_114067 ?auto_114070 ) ) ( not ( = ?auto_114067 ?auto_114066 ) ) ( not ( = ?auto_114067 ?auto_114065 ) ) ( not ( = ?auto_114067 ?auto_114064 ) ) ( not ( = ?auto_114070 ?auto_114066 ) ) ( not ( = ?auto_114070 ?auto_114065 ) ) ( not ( = ?auto_114070 ?auto_114064 ) ) ( ON ?auto_114064 ?auto_114069 ) ( not ( = ?auto_114064 ?auto_114069 ) ) ( not ( = ?auto_114065 ?auto_114069 ) ) ( not ( = ?auto_114066 ?auto_114069 ) ) ( not ( = ?auto_114068 ?auto_114069 ) ) ( not ( = ?auto_114071 ?auto_114069 ) ) ( not ( = ?auto_114067 ?auto_114069 ) ) ( not ( = ?auto_114070 ?auto_114069 ) ) ( ON ?auto_114065 ?auto_114064 ) ( ON-TABLE ?auto_114069 ) ( CLEAR ?auto_114070 ) ( ON ?auto_114066 ?auto_114065 ) ( CLEAR ?auto_114066 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_114069 ?auto_114064 ?auto_114065 )
      ( MAKE-2PILE ?auto_114064 ?auto_114065 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_114072 - BLOCK
      ?auto_114073 - BLOCK
    )
    :vars
    (
      ?auto_114075 - BLOCK
      ?auto_114076 - BLOCK
      ?auto_114078 - BLOCK
      ?auto_114079 - BLOCK
      ?auto_114074 - BLOCK
      ?auto_114077 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114072 ?auto_114073 ) ) ( not ( = ?auto_114072 ?auto_114075 ) ) ( not ( = ?auto_114073 ?auto_114075 ) ) ( ON-TABLE ?auto_114076 ) ( ON ?auto_114078 ?auto_114076 ) ( ON ?auto_114079 ?auto_114078 ) ( not ( = ?auto_114076 ?auto_114078 ) ) ( not ( = ?auto_114076 ?auto_114079 ) ) ( not ( = ?auto_114076 ?auto_114074 ) ) ( not ( = ?auto_114076 ?auto_114075 ) ) ( not ( = ?auto_114076 ?auto_114073 ) ) ( not ( = ?auto_114076 ?auto_114072 ) ) ( not ( = ?auto_114078 ?auto_114079 ) ) ( not ( = ?auto_114078 ?auto_114074 ) ) ( not ( = ?auto_114078 ?auto_114075 ) ) ( not ( = ?auto_114078 ?auto_114073 ) ) ( not ( = ?auto_114078 ?auto_114072 ) ) ( not ( = ?auto_114079 ?auto_114074 ) ) ( not ( = ?auto_114079 ?auto_114075 ) ) ( not ( = ?auto_114079 ?auto_114073 ) ) ( not ( = ?auto_114079 ?auto_114072 ) ) ( not ( = ?auto_114074 ?auto_114075 ) ) ( not ( = ?auto_114074 ?auto_114073 ) ) ( not ( = ?auto_114074 ?auto_114072 ) ) ( ON ?auto_114072 ?auto_114077 ) ( not ( = ?auto_114072 ?auto_114077 ) ) ( not ( = ?auto_114073 ?auto_114077 ) ) ( not ( = ?auto_114075 ?auto_114077 ) ) ( not ( = ?auto_114076 ?auto_114077 ) ) ( not ( = ?auto_114078 ?auto_114077 ) ) ( not ( = ?auto_114079 ?auto_114077 ) ) ( not ( = ?auto_114074 ?auto_114077 ) ) ( ON ?auto_114073 ?auto_114072 ) ( ON-TABLE ?auto_114077 ) ( ON ?auto_114075 ?auto_114073 ) ( CLEAR ?auto_114075 ) ( HOLDING ?auto_114074 ) ( CLEAR ?auto_114079 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_114076 ?auto_114078 ?auto_114079 ?auto_114074 )
      ( MAKE-2PILE ?auto_114072 ?auto_114073 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_114080 - BLOCK
      ?auto_114081 - BLOCK
    )
    :vars
    (
      ?auto_114083 - BLOCK
      ?auto_114085 - BLOCK
      ?auto_114084 - BLOCK
      ?auto_114087 - BLOCK
      ?auto_114086 - BLOCK
      ?auto_114082 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114080 ?auto_114081 ) ) ( not ( = ?auto_114080 ?auto_114083 ) ) ( not ( = ?auto_114081 ?auto_114083 ) ) ( ON-TABLE ?auto_114085 ) ( ON ?auto_114084 ?auto_114085 ) ( ON ?auto_114087 ?auto_114084 ) ( not ( = ?auto_114085 ?auto_114084 ) ) ( not ( = ?auto_114085 ?auto_114087 ) ) ( not ( = ?auto_114085 ?auto_114086 ) ) ( not ( = ?auto_114085 ?auto_114083 ) ) ( not ( = ?auto_114085 ?auto_114081 ) ) ( not ( = ?auto_114085 ?auto_114080 ) ) ( not ( = ?auto_114084 ?auto_114087 ) ) ( not ( = ?auto_114084 ?auto_114086 ) ) ( not ( = ?auto_114084 ?auto_114083 ) ) ( not ( = ?auto_114084 ?auto_114081 ) ) ( not ( = ?auto_114084 ?auto_114080 ) ) ( not ( = ?auto_114087 ?auto_114086 ) ) ( not ( = ?auto_114087 ?auto_114083 ) ) ( not ( = ?auto_114087 ?auto_114081 ) ) ( not ( = ?auto_114087 ?auto_114080 ) ) ( not ( = ?auto_114086 ?auto_114083 ) ) ( not ( = ?auto_114086 ?auto_114081 ) ) ( not ( = ?auto_114086 ?auto_114080 ) ) ( ON ?auto_114080 ?auto_114082 ) ( not ( = ?auto_114080 ?auto_114082 ) ) ( not ( = ?auto_114081 ?auto_114082 ) ) ( not ( = ?auto_114083 ?auto_114082 ) ) ( not ( = ?auto_114085 ?auto_114082 ) ) ( not ( = ?auto_114084 ?auto_114082 ) ) ( not ( = ?auto_114087 ?auto_114082 ) ) ( not ( = ?auto_114086 ?auto_114082 ) ) ( ON ?auto_114081 ?auto_114080 ) ( ON-TABLE ?auto_114082 ) ( ON ?auto_114083 ?auto_114081 ) ( CLEAR ?auto_114087 ) ( ON ?auto_114086 ?auto_114083 ) ( CLEAR ?auto_114086 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_114082 ?auto_114080 ?auto_114081 ?auto_114083 )
      ( MAKE-2PILE ?auto_114080 ?auto_114081 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_114088 - BLOCK
      ?auto_114089 - BLOCK
    )
    :vars
    (
      ?auto_114091 - BLOCK
      ?auto_114092 - BLOCK
      ?auto_114093 - BLOCK
      ?auto_114095 - BLOCK
      ?auto_114090 - BLOCK
      ?auto_114094 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114088 ?auto_114089 ) ) ( not ( = ?auto_114088 ?auto_114091 ) ) ( not ( = ?auto_114089 ?auto_114091 ) ) ( ON-TABLE ?auto_114092 ) ( ON ?auto_114093 ?auto_114092 ) ( not ( = ?auto_114092 ?auto_114093 ) ) ( not ( = ?auto_114092 ?auto_114095 ) ) ( not ( = ?auto_114092 ?auto_114090 ) ) ( not ( = ?auto_114092 ?auto_114091 ) ) ( not ( = ?auto_114092 ?auto_114089 ) ) ( not ( = ?auto_114092 ?auto_114088 ) ) ( not ( = ?auto_114093 ?auto_114095 ) ) ( not ( = ?auto_114093 ?auto_114090 ) ) ( not ( = ?auto_114093 ?auto_114091 ) ) ( not ( = ?auto_114093 ?auto_114089 ) ) ( not ( = ?auto_114093 ?auto_114088 ) ) ( not ( = ?auto_114095 ?auto_114090 ) ) ( not ( = ?auto_114095 ?auto_114091 ) ) ( not ( = ?auto_114095 ?auto_114089 ) ) ( not ( = ?auto_114095 ?auto_114088 ) ) ( not ( = ?auto_114090 ?auto_114091 ) ) ( not ( = ?auto_114090 ?auto_114089 ) ) ( not ( = ?auto_114090 ?auto_114088 ) ) ( ON ?auto_114088 ?auto_114094 ) ( not ( = ?auto_114088 ?auto_114094 ) ) ( not ( = ?auto_114089 ?auto_114094 ) ) ( not ( = ?auto_114091 ?auto_114094 ) ) ( not ( = ?auto_114092 ?auto_114094 ) ) ( not ( = ?auto_114093 ?auto_114094 ) ) ( not ( = ?auto_114095 ?auto_114094 ) ) ( not ( = ?auto_114090 ?auto_114094 ) ) ( ON ?auto_114089 ?auto_114088 ) ( ON-TABLE ?auto_114094 ) ( ON ?auto_114091 ?auto_114089 ) ( ON ?auto_114090 ?auto_114091 ) ( CLEAR ?auto_114090 ) ( HOLDING ?auto_114095 ) ( CLEAR ?auto_114093 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_114092 ?auto_114093 ?auto_114095 )
      ( MAKE-2PILE ?auto_114088 ?auto_114089 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_114096 - BLOCK
      ?auto_114097 - BLOCK
    )
    :vars
    (
      ?auto_114100 - BLOCK
      ?auto_114099 - BLOCK
      ?auto_114098 - BLOCK
      ?auto_114103 - BLOCK
      ?auto_114101 - BLOCK
      ?auto_114102 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114096 ?auto_114097 ) ) ( not ( = ?auto_114096 ?auto_114100 ) ) ( not ( = ?auto_114097 ?auto_114100 ) ) ( ON-TABLE ?auto_114099 ) ( ON ?auto_114098 ?auto_114099 ) ( not ( = ?auto_114099 ?auto_114098 ) ) ( not ( = ?auto_114099 ?auto_114103 ) ) ( not ( = ?auto_114099 ?auto_114101 ) ) ( not ( = ?auto_114099 ?auto_114100 ) ) ( not ( = ?auto_114099 ?auto_114097 ) ) ( not ( = ?auto_114099 ?auto_114096 ) ) ( not ( = ?auto_114098 ?auto_114103 ) ) ( not ( = ?auto_114098 ?auto_114101 ) ) ( not ( = ?auto_114098 ?auto_114100 ) ) ( not ( = ?auto_114098 ?auto_114097 ) ) ( not ( = ?auto_114098 ?auto_114096 ) ) ( not ( = ?auto_114103 ?auto_114101 ) ) ( not ( = ?auto_114103 ?auto_114100 ) ) ( not ( = ?auto_114103 ?auto_114097 ) ) ( not ( = ?auto_114103 ?auto_114096 ) ) ( not ( = ?auto_114101 ?auto_114100 ) ) ( not ( = ?auto_114101 ?auto_114097 ) ) ( not ( = ?auto_114101 ?auto_114096 ) ) ( ON ?auto_114096 ?auto_114102 ) ( not ( = ?auto_114096 ?auto_114102 ) ) ( not ( = ?auto_114097 ?auto_114102 ) ) ( not ( = ?auto_114100 ?auto_114102 ) ) ( not ( = ?auto_114099 ?auto_114102 ) ) ( not ( = ?auto_114098 ?auto_114102 ) ) ( not ( = ?auto_114103 ?auto_114102 ) ) ( not ( = ?auto_114101 ?auto_114102 ) ) ( ON ?auto_114097 ?auto_114096 ) ( ON-TABLE ?auto_114102 ) ( ON ?auto_114100 ?auto_114097 ) ( ON ?auto_114101 ?auto_114100 ) ( CLEAR ?auto_114098 ) ( ON ?auto_114103 ?auto_114101 ) ( CLEAR ?auto_114103 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_114102 ?auto_114096 ?auto_114097 ?auto_114100 ?auto_114101 )
      ( MAKE-2PILE ?auto_114096 ?auto_114097 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_114104 - BLOCK
      ?auto_114105 - BLOCK
    )
    :vars
    (
      ?auto_114106 - BLOCK
      ?auto_114108 - BLOCK
      ?auto_114109 - BLOCK
      ?auto_114107 - BLOCK
      ?auto_114111 - BLOCK
      ?auto_114110 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114104 ?auto_114105 ) ) ( not ( = ?auto_114104 ?auto_114106 ) ) ( not ( = ?auto_114105 ?auto_114106 ) ) ( ON-TABLE ?auto_114108 ) ( not ( = ?auto_114108 ?auto_114109 ) ) ( not ( = ?auto_114108 ?auto_114107 ) ) ( not ( = ?auto_114108 ?auto_114111 ) ) ( not ( = ?auto_114108 ?auto_114106 ) ) ( not ( = ?auto_114108 ?auto_114105 ) ) ( not ( = ?auto_114108 ?auto_114104 ) ) ( not ( = ?auto_114109 ?auto_114107 ) ) ( not ( = ?auto_114109 ?auto_114111 ) ) ( not ( = ?auto_114109 ?auto_114106 ) ) ( not ( = ?auto_114109 ?auto_114105 ) ) ( not ( = ?auto_114109 ?auto_114104 ) ) ( not ( = ?auto_114107 ?auto_114111 ) ) ( not ( = ?auto_114107 ?auto_114106 ) ) ( not ( = ?auto_114107 ?auto_114105 ) ) ( not ( = ?auto_114107 ?auto_114104 ) ) ( not ( = ?auto_114111 ?auto_114106 ) ) ( not ( = ?auto_114111 ?auto_114105 ) ) ( not ( = ?auto_114111 ?auto_114104 ) ) ( ON ?auto_114104 ?auto_114110 ) ( not ( = ?auto_114104 ?auto_114110 ) ) ( not ( = ?auto_114105 ?auto_114110 ) ) ( not ( = ?auto_114106 ?auto_114110 ) ) ( not ( = ?auto_114108 ?auto_114110 ) ) ( not ( = ?auto_114109 ?auto_114110 ) ) ( not ( = ?auto_114107 ?auto_114110 ) ) ( not ( = ?auto_114111 ?auto_114110 ) ) ( ON ?auto_114105 ?auto_114104 ) ( ON-TABLE ?auto_114110 ) ( ON ?auto_114106 ?auto_114105 ) ( ON ?auto_114111 ?auto_114106 ) ( ON ?auto_114107 ?auto_114111 ) ( CLEAR ?auto_114107 ) ( HOLDING ?auto_114109 ) ( CLEAR ?auto_114108 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_114108 ?auto_114109 )
      ( MAKE-2PILE ?auto_114104 ?auto_114105 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_114112 - BLOCK
      ?auto_114113 - BLOCK
    )
    :vars
    (
      ?auto_114116 - BLOCK
      ?auto_114118 - BLOCK
      ?auto_114119 - BLOCK
      ?auto_114117 - BLOCK
      ?auto_114115 - BLOCK
      ?auto_114114 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114112 ?auto_114113 ) ) ( not ( = ?auto_114112 ?auto_114116 ) ) ( not ( = ?auto_114113 ?auto_114116 ) ) ( ON-TABLE ?auto_114118 ) ( not ( = ?auto_114118 ?auto_114119 ) ) ( not ( = ?auto_114118 ?auto_114117 ) ) ( not ( = ?auto_114118 ?auto_114115 ) ) ( not ( = ?auto_114118 ?auto_114116 ) ) ( not ( = ?auto_114118 ?auto_114113 ) ) ( not ( = ?auto_114118 ?auto_114112 ) ) ( not ( = ?auto_114119 ?auto_114117 ) ) ( not ( = ?auto_114119 ?auto_114115 ) ) ( not ( = ?auto_114119 ?auto_114116 ) ) ( not ( = ?auto_114119 ?auto_114113 ) ) ( not ( = ?auto_114119 ?auto_114112 ) ) ( not ( = ?auto_114117 ?auto_114115 ) ) ( not ( = ?auto_114117 ?auto_114116 ) ) ( not ( = ?auto_114117 ?auto_114113 ) ) ( not ( = ?auto_114117 ?auto_114112 ) ) ( not ( = ?auto_114115 ?auto_114116 ) ) ( not ( = ?auto_114115 ?auto_114113 ) ) ( not ( = ?auto_114115 ?auto_114112 ) ) ( ON ?auto_114112 ?auto_114114 ) ( not ( = ?auto_114112 ?auto_114114 ) ) ( not ( = ?auto_114113 ?auto_114114 ) ) ( not ( = ?auto_114116 ?auto_114114 ) ) ( not ( = ?auto_114118 ?auto_114114 ) ) ( not ( = ?auto_114119 ?auto_114114 ) ) ( not ( = ?auto_114117 ?auto_114114 ) ) ( not ( = ?auto_114115 ?auto_114114 ) ) ( ON ?auto_114113 ?auto_114112 ) ( ON-TABLE ?auto_114114 ) ( ON ?auto_114116 ?auto_114113 ) ( ON ?auto_114115 ?auto_114116 ) ( ON ?auto_114117 ?auto_114115 ) ( CLEAR ?auto_114118 ) ( ON ?auto_114119 ?auto_114117 ) ( CLEAR ?auto_114119 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_114114 ?auto_114112 ?auto_114113 ?auto_114116 ?auto_114115 ?auto_114117 )
      ( MAKE-2PILE ?auto_114112 ?auto_114113 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_114120 - BLOCK
      ?auto_114121 - BLOCK
    )
    :vars
    (
      ?auto_114124 - BLOCK
      ?auto_114123 - BLOCK
      ?auto_114126 - BLOCK
      ?auto_114127 - BLOCK
      ?auto_114125 - BLOCK
      ?auto_114122 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114120 ?auto_114121 ) ) ( not ( = ?auto_114120 ?auto_114124 ) ) ( not ( = ?auto_114121 ?auto_114124 ) ) ( not ( = ?auto_114123 ?auto_114126 ) ) ( not ( = ?auto_114123 ?auto_114127 ) ) ( not ( = ?auto_114123 ?auto_114125 ) ) ( not ( = ?auto_114123 ?auto_114124 ) ) ( not ( = ?auto_114123 ?auto_114121 ) ) ( not ( = ?auto_114123 ?auto_114120 ) ) ( not ( = ?auto_114126 ?auto_114127 ) ) ( not ( = ?auto_114126 ?auto_114125 ) ) ( not ( = ?auto_114126 ?auto_114124 ) ) ( not ( = ?auto_114126 ?auto_114121 ) ) ( not ( = ?auto_114126 ?auto_114120 ) ) ( not ( = ?auto_114127 ?auto_114125 ) ) ( not ( = ?auto_114127 ?auto_114124 ) ) ( not ( = ?auto_114127 ?auto_114121 ) ) ( not ( = ?auto_114127 ?auto_114120 ) ) ( not ( = ?auto_114125 ?auto_114124 ) ) ( not ( = ?auto_114125 ?auto_114121 ) ) ( not ( = ?auto_114125 ?auto_114120 ) ) ( ON ?auto_114120 ?auto_114122 ) ( not ( = ?auto_114120 ?auto_114122 ) ) ( not ( = ?auto_114121 ?auto_114122 ) ) ( not ( = ?auto_114124 ?auto_114122 ) ) ( not ( = ?auto_114123 ?auto_114122 ) ) ( not ( = ?auto_114126 ?auto_114122 ) ) ( not ( = ?auto_114127 ?auto_114122 ) ) ( not ( = ?auto_114125 ?auto_114122 ) ) ( ON ?auto_114121 ?auto_114120 ) ( ON-TABLE ?auto_114122 ) ( ON ?auto_114124 ?auto_114121 ) ( ON ?auto_114125 ?auto_114124 ) ( ON ?auto_114127 ?auto_114125 ) ( ON ?auto_114126 ?auto_114127 ) ( CLEAR ?auto_114126 ) ( HOLDING ?auto_114123 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_114123 )
      ( MAKE-2PILE ?auto_114120 ?auto_114121 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_114128 - BLOCK
      ?auto_114129 - BLOCK
    )
    :vars
    (
      ?auto_114130 - BLOCK
      ?auto_114134 - BLOCK
      ?auto_114135 - BLOCK
      ?auto_114133 - BLOCK
      ?auto_114132 - BLOCK
      ?auto_114131 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114128 ?auto_114129 ) ) ( not ( = ?auto_114128 ?auto_114130 ) ) ( not ( = ?auto_114129 ?auto_114130 ) ) ( not ( = ?auto_114134 ?auto_114135 ) ) ( not ( = ?auto_114134 ?auto_114133 ) ) ( not ( = ?auto_114134 ?auto_114132 ) ) ( not ( = ?auto_114134 ?auto_114130 ) ) ( not ( = ?auto_114134 ?auto_114129 ) ) ( not ( = ?auto_114134 ?auto_114128 ) ) ( not ( = ?auto_114135 ?auto_114133 ) ) ( not ( = ?auto_114135 ?auto_114132 ) ) ( not ( = ?auto_114135 ?auto_114130 ) ) ( not ( = ?auto_114135 ?auto_114129 ) ) ( not ( = ?auto_114135 ?auto_114128 ) ) ( not ( = ?auto_114133 ?auto_114132 ) ) ( not ( = ?auto_114133 ?auto_114130 ) ) ( not ( = ?auto_114133 ?auto_114129 ) ) ( not ( = ?auto_114133 ?auto_114128 ) ) ( not ( = ?auto_114132 ?auto_114130 ) ) ( not ( = ?auto_114132 ?auto_114129 ) ) ( not ( = ?auto_114132 ?auto_114128 ) ) ( ON ?auto_114128 ?auto_114131 ) ( not ( = ?auto_114128 ?auto_114131 ) ) ( not ( = ?auto_114129 ?auto_114131 ) ) ( not ( = ?auto_114130 ?auto_114131 ) ) ( not ( = ?auto_114134 ?auto_114131 ) ) ( not ( = ?auto_114135 ?auto_114131 ) ) ( not ( = ?auto_114133 ?auto_114131 ) ) ( not ( = ?auto_114132 ?auto_114131 ) ) ( ON ?auto_114129 ?auto_114128 ) ( ON-TABLE ?auto_114131 ) ( ON ?auto_114130 ?auto_114129 ) ( ON ?auto_114132 ?auto_114130 ) ( ON ?auto_114133 ?auto_114132 ) ( ON ?auto_114135 ?auto_114133 ) ( ON ?auto_114134 ?auto_114135 ) ( CLEAR ?auto_114134 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_114131 ?auto_114128 ?auto_114129 ?auto_114130 ?auto_114132 ?auto_114133 ?auto_114135 )
      ( MAKE-2PILE ?auto_114128 ?auto_114129 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_114140 - BLOCK
      ?auto_114141 - BLOCK
      ?auto_114142 - BLOCK
      ?auto_114143 - BLOCK
    )
    :vars
    (
      ?auto_114144 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114144 ?auto_114143 ) ( CLEAR ?auto_114144 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_114140 ) ( ON ?auto_114141 ?auto_114140 ) ( ON ?auto_114142 ?auto_114141 ) ( ON ?auto_114143 ?auto_114142 ) ( not ( = ?auto_114140 ?auto_114141 ) ) ( not ( = ?auto_114140 ?auto_114142 ) ) ( not ( = ?auto_114140 ?auto_114143 ) ) ( not ( = ?auto_114140 ?auto_114144 ) ) ( not ( = ?auto_114141 ?auto_114142 ) ) ( not ( = ?auto_114141 ?auto_114143 ) ) ( not ( = ?auto_114141 ?auto_114144 ) ) ( not ( = ?auto_114142 ?auto_114143 ) ) ( not ( = ?auto_114142 ?auto_114144 ) ) ( not ( = ?auto_114143 ?auto_114144 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_114144 ?auto_114143 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_114145 - BLOCK
      ?auto_114146 - BLOCK
      ?auto_114147 - BLOCK
      ?auto_114148 - BLOCK
    )
    :vars
    (
      ?auto_114149 - BLOCK
      ?auto_114150 - BLOCK
      ?auto_114151 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114149 ?auto_114148 ) ( CLEAR ?auto_114149 ) ( ON-TABLE ?auto_114145 ) ( ON ?auto_114146 ?auto_114145 ) ( ON ?auto_114147 ?auto_114146 ) ( ON ?auto_114148 ?auto_114147 ) ( not ( = ?auto_114145 ?auto_114146 ) ) ( not ( = ?auto_114145 ?auto_114147 ) ) ( not ( = ?auto_114145 ?auto_114148 ) ) ( not ( = ?auto_114145 ?auto_114149 ) ) ( not ( = ?auto_114146 ?auto_114147 ) ) ( not ( = ?auto_114146 ?auto_114148 ) ) ( not ( = ?auto_114146 ?auto_114149 ) ) ( not ( = ?auto_114147 ?auto_114148 ) ) ( not ( = ?auto_114147 ?auto_114149 ) ) ( not ( = ?auto_114148 ?auto_114149 ) ) ( HOLDING ?auto_114150 ) ( CLEAR ?auto_114151 ) ( not ( = ?auto_114145 ?auto_114150 ) ) ( not ( = ?auto_114145 ?auto_114151 ) ) ( not ( = ?auto_114146 ?auto_114150 ) ) ( not ( = ?auto_114146 ?auto_114151 ) ) ( not ( = ?auto_114147 ?auto_114150 ) ) ( not ( = ?auto_114147 ?auto_114151 ) ) ( not ( = ?auto_114148 ?auto_114150 ) ) ( not ( = ?auto_114148 ?auto_114151 ) ) ( not ( = ?auto_114149 ?auto_114150 ) ) ( not ( = ?auto_114149 ?auto_114151 ) ) ( not ( = ?auto_114150 ?auto_114151 ) ) )
    :subtasks
    ( ( !STACK ?auto_114150 ?auto_114151 )
      ( MAKE-4PILE ?auto_114145 ?auto_114146 ?auto_114147 ?auto_114148 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_114152 - BLOCK
      ?auto_114153 - BLOCK
      ?auto_114154 - BLOCK
      ?auto_114155 - BLOCK
    )
    :vars
    (
      ?auto_114158 - BLOCK
      ?auto_114156 - BLOCK
      ?auto_114157 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114158 ?auto_114155 ) ( ON-TABLE ?auto_114152 ) ( ON ?auto_114153 ?auto_114152 ) ( ON ?auto_114154 ?auto_114153 ) ( ON ?auto_114155 ?auto_114154 ) ( not ( = ?auto_114152 ?auto_114153 ) ) ( not ( = ?auto_114152 ?auto_114154 ) ) ( not ( = ?auto_114152 ?auto_114155 ) ) ( not ( = ?auto_114152 ?auto_114158 ) ) ( not ( = ?auto_114153 ?auto_114154 ) ) ( not ( = ?auto_114153 ?auto_114155 ) ) ( not ( = ?auto_114153 ?auto_114158 ) ) ( not ( = ?auto_114154 ?auto_114155 ) ) ( not ( = ?auto_114154 ?auto_114158 ) ) ( not ( = ?auto_114155 ?auto_114158 ) ) ( CLEAR ?auto_114156 ) ( not ( = ?auto_114152 ?auto_114157 ) ) ( not ( = ?auto_114152 ?auto_114156 ) ) ( not ( = ?auto_114153 ?auto_114157 ) ) ( not ( = ?auto_114153 ?auto_114156 ) ) ( not ( = ?auto_114154 ?auto_114157 ) ) ( not ( = ?auto_114154 ?auto_114156 ) ) ( not ( = ?auto_114155 ?auto_114157 ) ) ( not ( = ?auto_114155 ?auto_114156 ) ) ( not ( = ?auto_114158 ?auto_114157 ) ) ( not ( = ?auto_114158 ?auto_114156 ) ) ( not ( = ?auto_114157 ?auto_114156 ) ) ( ON ?auto_114157 ?auto_114158 ) ( CLEAR ?auto_114157 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_114152 ?auto_114153 ?auto_114154 ?auto_114155 ?auto_114158 )
      ( MAKE-4PILE ?auto_114152 ?auto_114153 ?auto_114154 ?auto_114155 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_114159 - BLOCK
      ?auto_114160 - BLOCK
      ?auto_114161 - BLOCK
      ?auto_114162 - BLOCK
    )
    :vars
    (
      ?auto_114163 - BLOCK
      ?auto_114164 - BLOCK
      ?auto_114165 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114163 ?auto_114162 ) ( ON-TABLE ?auto_114159 ) ( ON ?auto_114160 ?auto_114159 ) ( ON ?auto_114161 ?auto_114160 ) ( ON ?auto_114162 ?auto_114161 ) ( not ( = ?auto_114159 ?auto_114160 ) ) ( not ( = ?auto_114159 ?auto_114161 ) ) ( not ( = ?auto_114159 ?auto_114162 ) ) ( not ( = ?auto_114159 ?auto_114163 ) ) ( not ( = ?auto_114160 ?auto_114161 ) ) ( not ( = ?auto_114160 ?auto_114162 ) ) ( not ( = ?auto_114160 ?auto_114163 ) ) ( not ( = ?auto_114161 ?auto_114162 ) ) ( not ( = ?auto_114161 ?auto_114163 ) ) ( not ( = ?auto_114162 ?auto_114163 ) ) ( not ( = ?auto_114159 ?auto_114164 ) ) ( not ( = ?auto_114159 ?auto_114165 ) ) ( not ( = ?auto_114160 ?auto_114164 ) ) ( not ( = ?auto_114160 ?auto_114165 ) ) ( not ( = ?auto_114161 ?auto_114164 ) ) ( not ( = ?auto_114161 ?auto_114165 ) ) ( not ( = ?auto_114162 ?auto_114164 ) ) ( not ( = ?auto_114162 ?auto_114165 ) ) ( not ( = ?auto_114163 ?auto_114164 ) ) ( not ( = ?auto_114163 ?auto_114165 ) ) ( not ( = ?auto_114164 ?auto_114165 ) ) ( ON ?auto_114164 ?auto_114163 ) ( CLEAR ?auto_114164 ) ( HOLDING ?auto_114165 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_114165 )
      ( MAKE-4PILE ?auto_114159 ?auto_114160 ?auto_114161 ?auto_114162 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_114166 - BLOCK
      ?auto_114167 - BLOCK
      ?auto_114168 - BLOCK
      ?auto_114169 - BLOCK
    )
    :vars
    (
      ?auto_114172 - BLOCK
      ?auto_114171 - BLOCK
      ?auto_114170 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114172 ?auto_114169 ) ( ON-TABLE ?auto_114166 ) ( ON ?auto_114167 ?auto_114166 ) ( ON ?auto_114168 ?auto_114167 ) ( ON ?auto_114169 ?auto_114168 ) ( not ( = ?auto_114166 ?auto_114167 ) ) ( not ( = ?auto_114166 ?auto_114168 ) ) ( not ( = ?auto_114166 ?auto_114169 ) ) ( not ( = ?auto_114166 ?auto_114172 ) ) ( not ( = ?auto_114167 ?auto_114168 ) ) ( not ( = ?auto_114167 ?auto_114169 ) ) ( not ( = ?auto_114167 ?auto_114172 ) ) ( not ( = ?auto_114168 ?auto_114169 ) ) ( not ( = ?auto_114168 ?auto_114172 ) ) ( not ( = ?auto_114169 ?auto_114172 ) ) ( not ( = ?auto_114166 ?auto_114171 ) ) ( not ( = ?auto_114166 ?auto_114170 ) ) ( not ( = ?auto_114167 ?auto_114171 ) ) ( not ( = ?auto_114167 ?auto_114170 ) ) ( not ( = ?auto_114168 ?auto_114171 ) ) ( not ( = ?auto_114168 ?auto_114170 ) ) ( not ( = ?auto_114169 ?auto_114171 ) ) ( not ( = ?auto_114169 ?auto_114170 ) ) ( not ( = ?auto_114172 ?auto_114171 ) ) ( not ( = ?auto_114172 ?auto_114170 ) ) ( not ( = ?auto_114171 ?auto_114170 ) ) ( ON ?auto_114171 ?auto_114172 ) ( ON ?auto_114170 ?auto_114171 ) ( CLEAR ?auto_114170 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_114166 ?auto_114167 ?auto_114168 ?auto_114169 ?auto_114172 ?auto_114171 )
      ( MAKE-4PILE ?auto_114166 ?auto_114167 ?auto_114168 ?auto_114169 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_114173 - BLOCK
      ?auto_114174 - BLOCK
      ?auto_114175 - BLOCK
      ?auto_114176 - BLOCK
    )
    :vars
    (
      ?auto_114178 - BLOCK
      ?auto_114177 - BLOCK
      ?auto_114179 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114178 ?auto_114176 ) ( ON-TABLE ?auto_114173 ) ( ON ?auto_114174 ?auto_114173 ) ( ON ?auto_114175 ?auto_114174 ) ( ON ?auto_114176 ?auto_114175 ) ( not ( = ?auto_114173 ?auto_114174 ) ) ( not ( = ?auto_114173 ?auto_114175 ) ) ( not ( = ?auto_114173 ?auto_114176 ) ) ( not ( = ?auto_114173 ?auto_114178 ) ) ( not ( = ?auto_114174 ?auto_114175 ) ) ( not ( = ?auto_114174 ?auto_114176 ) ) ( not ( = ?auto_114174 ?auto_114178 ) ) ( not ( = ?auto_114175 ?auto_114176 ) ) ( not ( = ?auto_114175 ?auto_114178 ) ) ( not ( = ?auto_114176 ?auto_114178 ) ) ( not ( = ?auto_114173 ?auto_114177 ) ) ( not ( = ?auto_114173 ?auto_114179 ) ) ( not ( = ?auto_114174 ?auto_114177 ) ) ( not ( = ?auto_114174 ?auto_114179 ) ) ( not ( = ?auto_114175 ?auto_114177 ) ) ( not ( = ?auto_114175 ?auto_114179 ) ) ( not ( = ?auto_114176 ?auto_114177 ) ) ( not ( = ?auto_114176 ?auto_114179 ) ) ( not ( = ?auto_114178 ?auto_114177 ) ) ( not ( = ?auto_114178 ?auto_114179 ) ) ( not ( = ?auto_114177 ?auto_114179 ) ) ( ON ?auto_114177 ?auto_114178 ) ( HOLDING ?auto_114179 ) ( CLEAR ?auto_114177 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_114173 ?auto_114174 ?auto_114175 ?auto_114176 ?auto_114178 ?auto_114177 ?auto_114179 )
      ( MAKE-4PILE ?auto_114173 ?auto_114174 ?auto_114175 ?auto_114176 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_114180 - BLOCK
      ?auto_114181 - BLOCK
      ?auto_114182 - BLOCK
      ?auto_114183 - BLOCK
    )
    :vars
    (
      ?auto_114185 - BLOCK
      ?auto_114184 - BLOCK
      ?auto_114186 - BLOCK
      ?auto_114187 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114185 ?auto_114183 ) ( ON-TABLE ?auto_114180 ) ( ON ?auto_114181 ?auto_114180 ) ( ON ?auto_114182 ?auto_114181 ) ( ON ?auto_114183 ?auto_114182 ) ( not ( = ?auto_114180 ?auto_114181 ) ) ( not ( = ?auto_114180 ?auto_114182 ) ) ( not ( = ?auto_114180 ?auto_114183 ) ) ( not ( = ?auto_114180 ?auto_114185 ) ) ( not ( = ?auto_114181 ?auto_114182 ) ) ( not ( = ?auto_114181 ?auto_114183 ) ) ( not ( = ?auto_114181 ?auto_114185 ) ) ( not ( = ?auto_114182 ?auto_114183 ) ) ( not ( = ?auto_114182 ?auto_114185 ) ) ( not ( = ?auto_114183 ?auto_114185 ) ) ( not ( = ?auto_114180 ?auto_114184 ) ) ( not ( = ?auto_114180 ?auto_114186 ) ) ( not ( = ?auto_114181 ?auto_114184 ) ) ( not ( = ?auto_114181 ?auto_114186 ) ) ( not ( = ?auto_114182 ?auto_114184 ) ) ( not ( = ?auto_114182 ?auto_114186 ) ) ( not ( = ?auto_114183 ?auto_114184 ) ) ( not ( = ?auto_114183 ?auto_114186 ) ) ( not ( = ?auto_114185 ?auto_114184 ) ) ( not ( = ?auto_114185 ?auto_114186 ) ) ( not ( = ?auto_114184 ?auto_114186 ) ) ( ON ?auto_114184 ?auto_114185 ) ( CLEAR ?auto_114184 ) ( ON ?auto_114186 ?auto_114187 ) ( CLEAR ?auto_114186 ) ( HAND-EMPTY ) ( not ( = ?auto_114180 ?auto_114187 ) ) ( not ( = ?auto_114181 ?auto_114187 ) ) ( not ( = ?auto_114182 ?auto_114187 ) ) ( not ( = ?auto_114183 ?auto_114187 ) ) ( not ( = ?auto_114185 ?auto_114187 ) ) ( not ( = ?auto_114184 ?auto_114187 ) ) ( not ( = ?auto_114186 ?auto_114187 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_114186 ?auto_114187 )
      ( MAKE-4PILE ?auto_114180 ?auto_114181 ?auto_114182 ?auto_114183 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_114188 - BLOCK
      ?auto_114189 - BLOCK
      ?auto_114190 - BLOCK
      ?auto_114191 - BLOCK
    )
    :vars
    (
      ?auto_114194 - BLOCK
      ?auto_114192 - BLOCK
      ?auto_114193 - BLOCK
      ?auto_114195 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114194 ?auto_114191 ) ( ON-TABLE ?auto_114188 ) ( ON ?auto_114189 ?auto_114188 ) ( ON ?auto_114190 ?auto_114189 ) ( ON ?auto_114191 ?auto_114190 ) ( not ( = ?auto_114188 ?auto_114189 ) ) ( not ( = ?auto_114188 ?auto_114190 ) ) ( not ( = ?auto_114188 ?auto_114191 ) ) ( not ( = ?auto_114188 ?auto_114194 ) ) ( not ( = ?auto_114189 ?auto_114190 ) ) ( not ( = ?auto_114189 ?auto_114191 ) ) ( not ( = ?auto_114189 ?auto_114194 ) ) ( not ( = ?auto_114190 ?auto_114191 ) ) ( not ( = ?auto_114190 ?auto_114194 ) ) ( not ( = ?auto_114191 ?auto_114194 ) ) ( not ( = ?auto_114188 ?auto_114192 ) ) ( not ( = ?auto_114188 ?auto_114193 ) ) ( not ( = ?auto_114189 ?auto_114192 ) ) ( not ( = ?auto_114189 ?auto_114193 ) ) ( not ( = ?auto_114190 ?auto_114192 ) ) ( not ( = ?auto_114190 ?auto_114193 ) ) ( not ( = ?auto_114191 ?auto_114192 ) ) ( not ( = ?auto_114191 ?auto_114193 ) ) ( not ( = ?auto_114194 ?auto_114192 ) ) ( not ( = ?auto_114194 ?auto_114193 ) ) ( not ( = ?auto_114192 ?auto_114193 ) ) ( ON ?auto_114193 ?auto_114195 ) ( CLEAR ?auto_114193 ) ( not ( = ?auto_114188 ?auto_114195 ) ) ( not ( = ?auto_114189 ?auto_114195 ) ) ( not ( = ?auto_114190 ?auto_114195 ) ) ( not ( = ?auto_114191 ?auto_114195 ) ) ( not ( = ?auto_114194 ?auto_114195 ) ) ( not ( = ?auto_114192 ?auto_114195 ) ) ( not ( = ?auto_114193 ?auto_114195 ) ) ( HOLDING ?auto_114192 ) ( CLEAR ?auto_114194 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_114188 ?auto_114189 ?auto_114190 ?auto_114191 ?auto_114194 ?auto_114192 )
      ( MAKE-4PILE ?auto_114188 ?auto_114189 ?auto_114190 ?auto_114191 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_114196 - BLOCK
      ?auto_114197 - BLOCK
      ?auto_114198 - BLOCK
      ?auto_114199 - BLOCK
    )
    :vars
    (
      ?auto_114201 - BLOCK
      ?auto_114200 - BLOCK
      ?auto_114202 - BLOCK
      ?auto_114203 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114201 ?auto_114199 ) ( ON-TABLE ?auto_114196 ) ( ON ?auto_114197 ?auto_114196 ) ( ON ?auto_114198 ?auto_114197 ) ( ON ?auto_114199 ?auto_114198 ) ( not ( = ?auto_114196 ?auto_114197 ) ) ( not ( = ?auto_114196 ?auto_114198 ) ) ( not ( = ?auto_114196 ?auto_114199 ) ) ( not ( = ?auto_114196 ?auto_114201 ) ) ( not ( = ?auto_114197 ?auto_114198 ) ) ( not ( = ?auto_114197 ?auto_114199 ) ) ( not ( = ?auto_114197 ?auto_114201 ) ) ( not ( = ?auto_114198 ?auto_114199 ) ) ( not ( = ?auto_114198 ?auto_114201 ) ) ( not ( = ?auto_114199 ?auto_114201 ) ) ( not ( = ?auto_114196 ?auto_114200 ) ) ( not ( = ?auto_114196 ?auto_114202 ) ) ( not ( = ?auto_114197 ?auto_114200 ) ) ( not ( = ?auto_114197 ?auto_114202 ) ) ( not ( = ?auto_114198 ?auto_114200 ) ) ( not ( = ?auto_114198 ?auto_114202 ) ) ( not ( = ?auto_114199 ?auto_114200 ) ) ( not ( = ?auto_114199 ?auto_114202 ) ) ( not ( = ?auto_114201 ?auto_114200 ) ) ( not ( = ?auto_114201 ?auto_114202 ) ) ( not ( = ?auto_114200 ?auto_114202 ) ) ( ON ?auto_114202 ?auto_114203 ) ( not ( = ?auto_114196 ?auto_114203 ) ) ( not ( = ?auto_114197 ?auto_114203 ) ) ( not ( = ?auto_114198 ?auto_114203 ) ) ( not ( = ?auto_114199 ?auto_114203 ) ) ( not ( = ?auto_114201 ?auto_114203 ) ) ( not ( = ?auto_114200 ?auto_114203 ) ) ( not ( = ?auto_114202 ?auto_114203 ) ) ( CLEAR ?auto_114201 ) ( ON ?auto_114200 ?auto_114202 ) ( CLEAR ?auto_114200 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_114203 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_114203 ?auto_114202 )
      ( MAKE-4PILE ?auto_114196 ?auto_114197 ?auto_114198 ?auto_114199 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_114220 - BLOCK
      ?auto_114221 - BLOCK
      ?auto_114222 - BLOCK
      ?auto_114223 - BLOCK
    )
    :vars
    (
      ?auto_114224 - BLOCK
      ?auto_114225 - BLOCK
      ?auto_114226 - BLOCK
      ?auto_114227 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_114220 ) ( ON ?auto_114221 ?auto_114220 ) ( ON ?auto_114222 ?auto_114221 ) ( not ( = ?auto_114220 ?auto_114221 ) ) ( not ( = ?auto_114220 ?auto_114222 ) ) ( not ( = ?auto_114220 ?auto_114223 ) ) ( not ( = ?auto_114220 ?auto_114224 ) ) ( not ( = ?auto_114221 ?auto_114222 ) ) ( not ( = ?auto_114221 ?auto_114223 ) ) ( not ( = ?auto_114221 ?auto_114224 ) ) ( not ( = ?auto_114222 ?auto_114223 ) ) ( not ( = ?auto_114222 ?auto_114224 ) ) ( not ( = ?auto_114223 ?auto_114224 ) ) ( not ( = ?auto_114220 ?auto_114225 ) ) ( not ( = ?auto_114220 ?auto_114226 ) ) ( not ( = ?auto_114221 ?auto_114225 ) ) ( not ( = ?auto_114221 ?auto_114226 ) ) ( not ( = ?auto_114222 ?auto_114225 ) ) ( not ( = ?auto_114222 ?auto_114226 ) ) ( not ( = ?auto_114223 ?auto_114225 ) ) ( not ( = ?auto_114223 ?auto_114226 ) ) ( not ( = ?auto_114224 ?auto_114225 ) ) ( not ( = ?auto_114224 ?auto_114226 ) ) ( not ( = ?auto_114225 ?auto_114226 ) ) ( ON ?auto_114226 ?auto_114227 ) ( not ( = ?auto_114220 ?auto_114227 ) ) ( not ( = ?auto_114221 ?auto_114227 ) ) ( not ( = ?auto_114222 ?auto_114227 ) ) ( not ( = ?auto_114223 ?auto_114227 ) ) ( not ( = ?auto_114224 ?auto_114227 ) ) ( not ( = ?auto_114225 ?auto_114227 ) ) ( not ( = ?auto_114226 ?auto_114227 ) ) ( ON ?auto_114225 ?auto_114226 ) ( ON-TABLE ?auto_114227 ) ( ON ?auto_114224 ?auto_114225 ) ( CLEAR ?auto_114224 ) ( HOLDING ?auto_114223 ) ( CLEAR ?auto_114222 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_114220 ?auto_114221 ?auto_114222 ?auto_114223 ?auto_114224 )
      ( MAKE-4PILE ?auto_114220 ?auto_114221 ?auto_114222 ?auto_114223 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_114228 - BLOCK
      ?auto_114229 - BLOCK
      ?auto_114230 - BLOCK
      ?auto_114231 - BLOCK
    )
    :vars
    (
      ?auto_114233 - BLOCK
      ?auto_114235 - BLOCK
      ?auto_114232 - BLOCK
      ?auto_114234 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_114228 ) ( ON ?auto_114229 ?auto_114228 ) ( ON ?auto_114230 ?auto_114229 ) ( not ( = ?auto_114228 ?auto_114229 ) ) ( not ( = ?auto_114228 ?auto_114230 ) ) ( not ( = ?auto_114228 ?auto_114231 ) ) ( not ( = ?auto_114228 ?auto_114233 ) ) ( not ( = ?auto_114229 ?auto_114230 ) ) ( not ( = ?auto_114229 ?auto_114231 ) ) ( not ( = ?auto_114229 ?auto_114233 ) ) ( not ( = ?auto_114230 ?auto_114231 ) ) ( not ( = ?auto_114230 ?auto_114233 ) ) ( not ( = ?auto_114231 ?auto_114233 ) ) ( not ( = ?auto_114228 ?auto_114235 ) ) ( not ( = ?auto_114228 ?auto_114232 ) ) ( not ( = ?auto_114229 ?auto_114235 ) ) ( not ( = ?auto_114229 ?auto_114232 ) ) ( not ( = ?auto_114230 ?auto_114235 ) ) ( not ( = ?auto_114230 ?auto_114232 ) ) ( not ( = ?auto_114231 ?auto_114235 ) ) ( not ( = ?auto_114231 ?auto_114232 ) ) ( not ( = ?auto_114233 ?auto_114235 ) ) ( not ( = ?auto_114233 ?auto_114232 ) ) ( not ( = ?auto_114235 ?auto_114232 ) ) ( ON ?auto_114232 ?auto_114234 ) ( not ( = ?auto_114228 ?auto_114234 ) ) ( not ( = ?auto_114229 ?auto_114234 ) ) ( not ( = ?auto_114230 ?auto_114234 ) ) ( not ( = ?auto_114231 ?auto_114234 ) ) ( not ( = ?auto_114233 ?auto_114234 ) ) ( not ( = ?auto_114235 ?auto_114234 ) ) ( not ( = ?auto_114232 ?auto_114234 ) ) ( ON ?auto_114235 ?auto_114232 ) ( ON-TABLE ?auto_114234 ) ( ON ?auto_114233 ?auto_114235 ) ( CLEAR ?auto_114230 ) ( ON ?auto_114231 ?auto_114233 ) ( CLEAR ?auto_114231 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_114234 ?auto_114232 ?auto_114235 ?auto_114233 )
      ( MAKE-4PILE ?auto_114228 ?auto_114229 ?auto_114230 ?auto_114231 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_114236 - BLOCK
      ?auto_114237 - BLOCK
      ?auto_114238 - BLOCK
      ?auto_114239 - BLOCK
    )
    :vars
    (
      ?auto_114241 - BLOCK
      ?auto_114243 - BLOCK
      ?auto_114242 - BLOCK
      ?auto_114240 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_114236 ) ( ON ?auto_114237 ?auto_114236 ) ( not ( = ?auto_114236 ?auto_114237 ) ) ( not ( = ?auto_114236 ?auto_114238 ) ) ( not ( = ?auto_114236 ?auto_114239 ) ) ( not ( = ?auto_114236 ?auto_114241 ) ) ( not ( = ?auto_114237 ?auto_114238 ) ) ( not ( = ?auto_114237 ?auto_114239 ) ) ( not ( = ?auto_114237 ?auto_114241 ) ) ( not ( = ?auto_114238 ?auto_114239 ) ) ( not ( = ?auto_114238 ?auto_114241 ) ) ( not ( = ?auto_114239 ?auto_114241 ) ) ( not ( = ?auto_114236 ?auto_114243 ) ) ( not ( = ?auto_114236 ?auto_114242 ) ) ( not ( = ?auto_114237 ?auto_114243 ) ) ( not ( = ?auto_114237 ?auto_114242 ) ) ( not ( = ?auto_114238 ?auto_114243 ) ) ( not ( = ?auto_114238 ?auto_114242 ) ) ( not ( = ?auto_114239 ?auto_114243 ) ) ( not ( = ?auto_114239 ?auto_114242 ) ) ( not ( = ?auto_114241 ?auto_114243 ) ) ( not ( = ?auto_114241 ?auto_114242 ) ) ( not ( = ?auto_114243 ?auto_114242 ) ) ( ON ?auto_114242 ?auto_114240 ) ( not ( = ?auto_114236 ?auto_114240 ) ) ( not ( = ?auto_114237 ?auto_114240 ) ) ( not ( = ?auto_114238 ?auto_114240 ) ) ( not ( = ?auto_114239 ?auto_114240 ) ) ( not ( = ?auto_114241 ?auto_114240 ) ) ( not ( = ?auto_114243 ?auto_114240 ) ) ( not ( = ?auto_114242 ?auto_114240 ) ) ( ON ?auto_114243 ?auto_114242 ) ( ON-TABLE ?auto_114240 ) ( ON ?auto_114241 ?auto_114243 ) ( ON ?auto_114239 ?auto_114241 ) ( CLEAR ?auto_114239 ) ( HOLDING ?auto_114238 ) ( CLEAR ?auto_114237 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_114236 ?auto_114237 ?auto_114238 )
      ( MAKE-4PILE ?auto_114236 ?auto_114237 ?auto_114238 ?auto_114239 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_114244 - BLOCK
      ?auto_114245 - BLOCK
      ?auto_114246 - BLOCK
      ?auto_114247 - BLOCK
    )
    :vars
    (
      ?auto_114249 - BLOCK
      ?auto_114248 - BLOCK
      ?auto_114250 - BLOCK
      ?auto_114251 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_114244 ) ( ON ?auto_114245 ?auto_114244 ) ( not ( = ?auto_114244 ?auto_114245 ) ) ( not ( = ?auto_114244 ?auto_114246 ) ) ( not ( = ?auto_114244 ?auto_114247 ) ) ( not ( = ?auto_114244 ?auto_114249 ) ) ( not ( = ?auto_114245 ?auto_114246 ) ) ( not ( = ?auto_114245 ?auto_114247 ) ) ( not ( = ?auto_114245 ?auto_114249 ) ) ( not ( = ?auto_114246 ?auto_114247 ) ) ( not ( = ?auto_114246 ?auto_114249 ) ) ( not ( = ?auto_114247 ?auto_114249 ) ) ( not ( = ?auto_114244 ?auto_114248 ) ) ( not ( = ?auto_114244 ?auto_114250 ) ) ( not ( = ?auto_114245 ?auto_114248 ) ) ( not ( = ?auto_114245 ?auto_114250 ) ) ( not ( = ?auto_114246 ?auto_114248 ) ) ( not ( = ?auto_114246 ?auto_114250 ) ) ( not ( = ?auto_114247 ?auto_114248 ) ) ( not ( = ?auto_114247 ?auto_114250 ) ) ( not ( = ?auto_114249 ?auto_114248 ) ) ( not ( = ?auto_114249 ?auto_114250 ) ) ( not ( = ?auto_114248 ?auto_114250 ) ) ( ON ?auto_114250 ?auto_114251 ) ( not ( = ?auto_114244 ?auto_114251 ) ) ( not ( = ?auto_114245 ?auto_114251 ) ) ( not ( = ?auto_114246 ?auto_114251 ) ) ( not ( = ?auto_114247 ?auto_114251 ) ) ( not ( = ?auto_114249 ?auto_114251 ) ) ( not ( = ?auto_114248 ?auto_114251 ) ) ( not ( = ?auto_114250 ?auto_114251 ) ) ( ON ?auto_114248 ?auto_114250 ) ( ON-TABLE ?auto_114251 ) ( ON ?auto_114249 ?auto_114248 ) ( ON ?auto_114247 ?auto_114249 ) ( CLEAR ?auto_114245 ) ( ON ?auto_114246 ?auto_114247 ) ( CLEAR ?auto_114246 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_114251 ?auto_114250 ?auto_114248 ?auto_114249 ?auto_114247 )
      ( MAKE-4PILE ?auto_114244 ?auto_114245 ?auto_114246 ?auto_114247 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_114252 - BLOCK
      ?auto_114253 - BLOCK
      ?auto_114254 - BLOCK
      ?auto_114255 - BLOCK
    )
    :vars
    (
      ?auto_114257 - BLOCK
      ?auto_114256 - BLOCK
      ?auto_114258 - BLOCK
      ?auto_114259 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_114252 ) ( not ( = ?auto_114252 ?auto_114253 ) ) ( not ( = ?auto_114252 ?auto_114254 ) ) ( not ( = ?auto_114252 ?auto_114255 ) ) ( not ( = ?auto_114252 ?auto_114257 ) ) ( not ( = ?auto_114253 ?auto_114254 ) ) ( not ( = ?auto_114253 ?auto_114255 ) ) ( not ( = ?auto_114253 ?auto_114257 ) ) ( not ( = ?auto_114254 ?auto_114255 ) ) ( not ( = ?auto_114254 ?auto_114257 ) ) ( not ( = ?auto_114255 ?auto_114257 ) ) ( not ( = ?auto_114252 ?auto_114256 ) ) ( not ( = ?auto_114252 ?auto_114258 ) ) ( not ( = ?auto_114253 ?auto_114256 ) ) ( not ( = ?auto_114253 ?auto_114258 ) ) ( not ( = ?auto_114254 ?auto_114256 ) ) ( not ( = ?auto_114254 ?auto_114258 ) ) ( not ( = ?auto_114255 ?auto_114256 ) ) ( not ( = ?auto_114255 ?auto_114258 ) ) ( not ( = ?auto_114257 ?auto_114256 ) ) ( not ( = ?auto_114257 ?auto_114258 ) ) ( not ( = ?auto_114256 ?auto_114258 ) ) ( ON ?auto_114258 ?auto_114259 ) ( not ( = ?auto_114252 ?auto_114259 ) ) ( not ( = ?auto_114253 ?auto_114259 ) ) ( not ( = ?auto_114254 ?auto_114259 ) ) ( not ( = ?auto_114255 ?auto_114259 ) ) ( not ( = ?auto_114257 ?auto_114259 ) ) ( not ( = ?auto_114256 ?auto_114259 ) ) ( not ( = ?auto_114258 ?auto_114259 ) ) ( ON ?auto_114256 ?auto_114258 ) ( ON-TABLE ?auto_114259 ) ( ON ?auto_114257 ?auto_114256 ) ( ON ?auto_114255 ?auto_114257 ) ( ON ?auto_114254 ?auto_114255 ) ( CLEAR ?auto_114254 ) ( HOLDING ?auto_114253 ) ( CLEAR ?auto_114252 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_114252 ?auto_114253 )
      ( MAKE-4PILE ?auto_114252 ?auto_114253 ?auto_114254 ?auto_114255 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_114260 - BLOCK
      ?auto_114261 - BLOCK
      ?auto_114262 - BLOCK
      ?auto_114263 - BLOCK
    )
    :vars
    (
      ?auto_114267 - BLOCK
      ?auto_114264 - BLOCK
      ?auto_114266 - BLOCK
      ?auto_114265 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_114260 ) ( not ( = ?auto_114260 ?auto_114261 ) ) ( not ( = ?auto_114260 ?auto_114262 ) ) ( not ( = ?auto_114260 ?auto_114263 ) ) ( not ( = ?auto_114260 ?auto_114267 ) ) ( not ( = ?auto_114261 ?auto_114262 ) ) ( not ( = ?auto_114261 ?auto_114263 ) ) ( not ( = ?auto_114261 ?auto_114267 ) ) ( not ( = ?auto_114262 ?auto_114263 ) ) ( not ( = ?auto_114262 ?auto_114267 ) ) ( not ( = ?auto_114263 ?auto_114267 ) ) ( not ( = ?auto_114260 ?auto_114264 ) ) ( not ( = ?auto_114260 ?auto_114266 ) ) ( not ( = ?auto_114261 ?auto_114264 ) ) ( not ( = ?auto_114261 ?auto_114266 ) ) ( not ( = ?auto_114262 ?auto_114264 ) ) ( not ( = ?auto_114262 ?auto_114266 ) ) ( not ( = ?auto_114263 ?auto_114264 ) ) ( not ( = ?auto_114263 ?auto_114266 ) ) ( not ( = ?auto_114267 ?auto_114264 ) ) ( not ( = ?auto_114267 ?auto_114266 ) ) ( not ( = ?auto_114264 ?auto_114266 ) ) ( ON ?auto_114266 ?auto_114265 ) ( not ( = ?auto_114260 ?auto_114265 ) ) ( not ( = ?auto_114261 ?auto_114265 ) ) ( not ( = ?auto_114262 ?auto_114265 ) ) ( not ( = ?auto_114263 ?auto_114265 ) ) ( not ( = ?auto_114267 ?auto_114265 ) ) ( not ( = ?auto_114264 ?auto_114265 ) ) ( not ( = ?auto_114266 ?auto_114265 ) ) ( ON ?auto_114264 ?auto_114266 ) ( ON-TABLE ?auto_114265 ) ( ON ?auto_114267 ?auto_114264 ) ( ON ?auto_114263 ?auto_114267 ) ( ON ?auto_114262 ?auto_114263 ) ( CLEAR ?auto_114260 ) ( ON ?auto_114261 ?auto_114262 ) ( CLEAR ?auto_114261 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_114265 ?auto_114266 ?auto_114264 ?auto_114267 ?auto_114263 ?auto_114262 )
      ( MAKE-4PILE ?auto_114260 ?auto_114261 ?auto_114262 ?auto_114263 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_114268 - BLOCK
      ?auto_114269 - BLOCK
      ?auto_114270 - BLOCK
      ?auto_114271 - BLOCK
    )
    :vars
    (
      ?auto_114272 - BLOCK
      ?auto_114273 - BLOCK
      ?auto_114274 - BLOCK
      ?auto_114275 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114268 ?auto_114269 ) ) ( not ( = ?auto_114268 ?auto_114270 ) ) ( not ( = ?auto_114268 ?auto_114271 ) ) ( not ( = ?auto_114268 ?auto_114272 ) ) ( not ( = ?auto_114269 ?auto_114270 ) ) ( not ( = ?auto_114269 ?auto_114271 ) ) ( not ( = ?auto_114269 ?auto_114272 ) ) ( not ( = ?auto_114270 ?auto_114271 ) ) ( not ( = ?auto_114270 ?auto_114272 ) ) ( not ( = ?auto_114271 ?auto_114272 ) ) ( not ( = ?auto_114268 ?auto_114273 ) ) ( not ( = ?auto_114268 ?auto_114274 ) ) ( not ( = ?auto_114269 ?auto_114273 ) ) ( not ( = ?auto_114269 ?auto_114274 ) ) ( not ( = ?auto_114270 ?auto_114273 ) ) ( not ( = ?auto_114270 ?auto_114274 ) ) ( not ( = ?auto_114271 ?auto_114273 ) ) ( not ( = ?auto_114271 ?auto_114274 ) ) ( not ( = ?auto_114272 ?auto_114273 ) ) ( not ( = ?auto_114272 ?auto_114274 ) ) ( not ( = ?auto_114273 ?auto_114274 ) ) ( ON ?auto_114274 ?auto_114275 ) ( not ( = ?auto_114268 ?auto_114275 ) ) ( not ( = ?auto_114269 ?auto_114275 ) ) ( not ( = ?auto_114270 ?auto_114275 ) ) ( not ( = ?auto_114271 ?auto_114275 ) ) ( not ( = ?auto_114272 ?auto_114275 ) ) ( not ( = ?auto_114273 ?auto_114275 ) ) ( not ( = ?auto_114274 ?auto_114275 ) ) ( ON ?auto_114273 ?auto_114274 ) ( ON-TABLE ?auto_114275 ) ( ON ?auto_114272 ?auto_114273 ) ( ON ?auto_114271 ?auto_114272 ) ( ON ?auto_114270 ?auto_114271 ) ( ON ?auto_114269 ?auto_114270 ) ( CLEAR ?auto_114269 ) ( HOLDING ?auto_114268 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_114268 )
      ( MAKE-4PILE ?auto_114268 ?auto_114269 ?auto_114270 ?auto_114271 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_114276 - BLOCK
      ?auto_114277 - BLOCK
      ?auto_114278 - BLOCK
      ?auto_114279 - BLOCK
    )
    :vars
    (
      ?auto_114281 - BLOCK
      ?auto_114280 - BLOCK
      ?auto_114282 - BLOCK
      ?auto_114283 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114276 ?auto_114277 ) ) ( not ( = ?auto_114276 ?auto_114278 ) ) ( not ( = ?auto_114276 ?auto_114279 ) ) ( not ( = ?auto_114276 ?auto_114281 ) ) ( not ( = ?auto_114277 ?auto_114278 ) ) ( not ( = ?auto_114277 ?auto_114279 ) ) ( not ( = ?auto_114277 ?auto_114281 ) ) ( not ( = ?auto_114278 ?auto_114279 ) ) ( not ( = ?auto_114278 ?auto_114281 ) ) ( not ( = ?auto_114279 ?auto_114281 ) ) ( not ( = ?auto_114276 ?auto_114280 ) ) ( not ( = ?auto_114276 ?auto_114282 ) ) ( not ( = ?auto_114277 ?auto_114280 ) ) ( not ( = ?auto_114277 ?auto_114282 ) ) ( not ( = ?auto_114278 ?auto_114280 ) ) ( not ( = ?auto_114278 ?auto_114282 ) ) ( not ( = ?auto_114279 ?auto_114280 ) ) ( not ( = ?auto_114279 ?auto_114282 ) ) ( not ( = ?auto_114281 ?auto_114280 ) ) ( not ( = ?auto_114281 ?auto_114282 ) ) ( not ( = ?auto_114280 ?auto_114282 ) ) ( ON ?auto_114282 ?auto_114283 ) ( not ( = ?auto_114276 ?auto_114283 ) ) ( not ( = ?auto_114277 ?auto_114283 ) ) ( not ( = ?auto_114278 ?auto_114283 ) ) ( not ( = ?auto_114279 ?auto_114283 ) ) ( not ( = ?auto_114281 ?auto_114283 ) ) ( not ( = ?auto_114280 ?auto_114283 ) ) ( not ( = ?auto_114282 ?auto_114283 ) ) ( ON ?auto_114280 ?auto_114282 ) ( ON-TABLE ?auto_114283 ) ( ON ?auto_114281 ?auto_114280 ) ( ON ?auto_114279 ?auto_114281 ) ( ON ?auto_114278 ?auto_114279 ) ( ON ?auto_114277 ?auto_114278 ) ( ON ?auto_114276 ?auto_114277 ) ( CLEAR ?auto_114276 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_114283 ?auto_114282 ?auto_114280 ?auto_114281 ?auto_114279 ?auto_114278 ?auto_114277 )
      ( MAKE-4PILE ?auto_114276 ?auto_114277 ?auto_114278 ?auto_114279 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_114287 - BLOCK
      ?auto_114288 - BLOCK
      ?auto_114289 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_114289 ) ( CLEAR ?auto_114288 ) ( ON-TABLE ?auto_114287 ) ( ON ?auto_114288 ?auto_114287 ) ( not ( = ?auto_114287 ?auto_114288 ) ) ( not ( = ?auto_114287 ?auto_114289 ) ) ( not ( = ?auto_114288 ?auto_114289 ) ) )
    :subtasks
    ( ( !STACK ?auto_114289 ?auto_114288 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_114290 - BLOCK
      ?auto_114291 - BLOCK
      ?auto_114292 - BLOCK
    )
    :vars
    (
      ?auto_114293 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_114291 ) ( ON-TABLE ?auto_114290 ) ( ON ?auto_114291 ?auto_114290 ) ( not ( = ?auto_114290 ?auto_114291 ) ) ( not ( = ?auto_114290 ?auto_114292 ) ) ( not ( = ?auto_114291 ?auto_114292 ) ) ( ON ?auto_114292 ?auto_114293 ) ( CLEAR ?auto_114292 ) ( HAND-EMPTY ) ( not ( = ?auto_114290 ?auto_114293 ) ) ( not ( = ?auto_114291 ?auto_114293 ) ) ( not ( = ?auto_114292 ?auto_114293 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_114292 ?auto_114293 )
      ( MAKE-3PILE ?auto_114290 ?auto_114291 ?auto_114292 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_114294 - BLOCK
      ?auto_114295 - BLOCK
      ?auto_114296 - BLOCK
    )
    :vars
    (
      ?auto_114297 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_114294 ) ( not ( = ?auto_114294 ?auto_114295 ) ) ( not ( = ?auto_114294 ?auto_114296 ) ) ( not ( = ?auto_114295 ?auto_114296 ) ) ( ON ?auto_114296 ?auto_114297 ) ( CLEAR ?auto_114296 ) ( not ( = ?auto_114294 ?auto_114297 ) ) ( not ( = ?auto_114295 ?auto_114297 ) ) ( not ( = ?auto_114296 ?auto_114297 ) ) ( HOLDING ?auto_114295 ) ( CLEAR ?auto_114294 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_114294 ?auto_114295 )
      ( MAKE-3PILE ?auto_114294 ?auto_114295 ?auto_114296 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_114298 - BLOCK
      ?auto_114299 - BLOCK
      ?auto_114300 - BLOCK
    )
    :vars
    (
      ?auto_114301 - BLOCK
      ?auto_114302 - BLOCK
      ?auto_114304 - BLOCK
      ?auto_114303 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_114298 ) ( not ( = ?auto_114298 ?auto_114299 ) ) ( not ( = ?auto_114298 ?auto_114300 ) ) ( not ( = ?auto_114299 ?auto_114300 ) ) ( ON ?auto_114300 ?auto_114301 ) ( not ( = ?auto_114298 ?auto_114301 ) ) ( not ( = ?auto_114299 ?auto_114301 ) ) ( not ( = ?auto_114300 ?auto_114301 ) ) ( CLEAR ?auto_114298 ) ( ON ?auto_114299 ?auto_114300 ) ( CLEAR ?auto_114299 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_114302 ) ( ON ?auto_114304 ?auto_114302 ) ( ON ?auto_114303 ?auto_114304 ) ( ON ?auto_114301 ?auto_114303 ) ( not ( = ?auto_114302 ?auto_114304 ) ) ( not ( = ?auto_114302 ?auto_114303 ) ) ( not ( = ?auto_114302 ?auto_114301 ) ) ( not ( = ?auto_114302 ?auto_114300 ) ) ( not ( = ?auto_114302 ?auto_114299 ) ) ( not ( = ?auto_114304 ?auto_114303 ) ) ( not ( = ?auto_114304 ?auto_114301 ) ) ( not ( = ?auto_114304 ?auto_114300 ) ) ( not ( = ?auto_114304 ?auto_114299 ) ) ( not ( = ?auto_114303 ?auto_114301 ) ) ( not ( = ?auto_114303 ?auto_114300 ) ) ( not ( = ?auto_114303 ?auto_114299 ) ) ( not ( = ?auto_114298 ?auto_114302 ) ) ( not ( = ?auto_114298 ?auto_114304 ) ) ( not ( = ?auto_114298 ?auto_114303 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_114302 ?auto_114304 ?auto_114303 ?auto_114301 ?auto_114300 )
      ( MAKE-3PILE ?auto_114298 ?auto_114299 ?auto_114300 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_114305 - BLOCK
      ?auto_114306 - BLOCK
      ?auto_114307 - BLOCK
    )
    :vars
    (
      ?auto_114311 - BLOCK
      ?auto_114310 - BLOCK
      ?auto_114308 - BLOCK
      ?auto_114309 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114305 ?auto_114306 ) ) ( not ( = ?auto_114305 ?auto_114307 ) ) ( not ( = ?auto_114306 ?auto_114307 ) ) ( ON ?auto_114307 ?auto_114311 ) ( not ( = ?auto_114305 ?auto_114311 ) ) ( not ( = ?auto_114306 ?auto_114311 ) ) ( not ( = ?auto_114307 ?auto_114311 ) ) ( ON ?auto_114306 ?auto_114307 ) ( CLEAR ?auto_114306 ) ( ON-TABLE ?auto_114310 ) ( ON ?auto_114308 ?auto_114310 ) ( ON ?auto_114309 ?auto_114308 ) ( ON ?auto_114311 ?auto_114309 ) ( not ( = ?auto_114310 ?auto_114308 ) ) ( not ( = ?auto_114310 ?auto_114309 ) ) ( not ( = ?auto_114310 ?auto_114311 ) ) ( not ( = ?auto_114310 ?auto_114307 ) ) ( not ( = ?auto_114310 ?auto_114306 ) ) ( not ( = ?auto_114308 ?auto_114309 ) ) ( not ( = ?auto_114308 ?auto_114311 ) ) ( not ( = ?auto_114308 ?auto_114307 ) ) ( not ( = ?auto_114308 ?auto_114306 ) ) ( not ( = ?auto_114309 ?auto_114311 ) ) ( not ( = ?auto_114309 ?auto_114307 ) ) ( not ( = ?auto_114309 ?auto_114306 ) ) ( not ( = ?auto_114305 ?auto_114310 ) ) ( not ( = ?auto_114305 ?auto_114308 ) ) ( not ( = ?auto_114305 ?auto_114309 ) ) ( HOLDING ?auto_114305 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_114305 )
      ( MAKE-3PILE ?auto_114305 ?auto_114306 ?auto_114307 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_114312 - BLOCK
      ?auto_114313 - BLOCK
      ?auto_114314 - BLOCK
    )
    :vars
    (
      ?auto_114316 - BLOCK
      ?auto_114315 - BLOCK
      ?auto_114318 - BLOCK
      ?auto_114317 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114312 ?auto_114313 ) ) ( not ( = ?auto_114312 ?auto_114314 ) ) ( not ( = ?auto_114313 ?auto_114314 ) ) ( ON ?auto_114314 ?auto_114316 ) ( not ( = ?auto_114312 ?auto_114316 ) ) ( not ( = ?auto_114313 ?auto_114316 ) ) ( not ( = ?auto_114314 ?auto_114316 ) ) ( ON ?auto_114313 ?auto_114314 ) ( ON-TABLE ?auto_114315 ) ( ON ?auto_114318 ?auto_114315 ) ( ON ?auto_114317 ?auto_114318 ) ( ON ?auto_114316 ?auto_114317 ) ( not ( = ?auto_114315 ?auto_114318 ) ) ( not ( = ?auto_114315 ?auto_114317 ) ) ( not ( = ?auto_114315 ?auto_114316 ) ) ( not ( = ?auto_114315 ?auto_114314 ) ) ( not ( = ?auto_114315 ?auto_114313 ) ) ( not ( = ?auto_114318 ?auto_114317 ) ) ( not ( = ?auto_114318 ?auto_114316 ) ) ( not ( = ?auto_114318 ?auto_114314 ) ) ( not ( = ?auto_114318 ?auto_114313 ) ) ( not ( = ?auto_114317 ?auto_114316 ) ) ( not ( = ?auto_114317 ?auto_114314 ) ) ( not ( = ?auto_114317 ?auto_114313 ) ) ( not ( = ?auto_114312 ?auto_114315 ) ) ( not ( = ?auto_114312 ?auto_114318 ) ) ( not ( = ?auto_114312 ?auto_114317 ) ) ( ON ?auto_114312 ?auto_114313 ) ( CLEAR ?auto_114312 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_114315 ?auto_114318 ?auto_114317 ?auto_114316 ?auto_114314 ?auto_114313 )
      ( MAKE-3PILE ?auto_114312 ?auto_114313 ?auto_114314 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_114319 - BLOCK
      ?auto_114320 - BLOCK
      ?auto_114321 - BLOCK
    )
    :vars
    (
      ?auto_114325 - BLOCK
      ?auto_114323 - BLOCK
      ?auto_114322 - BLOCK
      ?auto_114324 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114319 ?auto_114320 ) ) ( not ( = ?auto_114319 ?auto_114321 ) ) ( not ( = ?auto_114320 ?auto_114321 ) ) ( ON ?auto_114321 ?auto_114325 ) ( not ( = ?auto_114319 ?auto_114325 ) ) ( not ( = ?auto_114320 ?auto_114325 ) ) ( not ( = ?auto_114321 ?auto_114325 ) ) ( ON ?auto_114320 ?auto_114321 ) ( ON-TABLE ?auto_114323 ) ( ON ?auto_114322 ?auto_114323 ) ( ON ?auto_114324 ?auto_114322 ) ( ON ?auto_114325 ?auto_114324 ) ( not ( = ?auto_114323 ?auto_114322 ) ) ( not ( = ?auto_114323 ?auto_114324 ) ) ( not ( = ?auto_114323 ?auto_114325 ) ) ( not ( = ?auto_114323 ?auto_114321 ) ) ( not ( = ?auto_114323 ?auto_114320 ) ) ( not ( = ?auto_114322 ?auto_114324 ) ) ( not ( = ?auto_114322 ?auto_114325 ) ) ( not ( = ?auto_114322 ?auto_114321 ) ) ( not ( = ?auto_114322 ?auto_114320 ) ) ( not ( = ?auto_114324 ?auto_114325 ) ) ( not ( = ?auto_114324 ?auto_114321 ) ) ( not ( = ?auto_114324 ?auto_114320 ) ) ( not ( = ?auto_114319 ?auto_114323 ) ) ( not ( = ?auto_114319 ?auto_114322 ) ) ( not ( = ?auto_114319 ?auto_114324 ) ) ( HOLDING ?auto_114319 ) ( CLEAR ?auto_114320 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_114323 ?auto_114322 ?auto_114324 ?auto_114325 ?auto_114321 ?auto_114320 ?auto_114319 )
      ( MAKE-3PILE ?auto_114319 ?auto_114320 ?auto_114321 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_114326 - BLOCK
      ?auto_114327 - BLOCK
      ?auto_114328 - BLOCK
    )
    :vars
    (
      ?auto_114330 - BLOCK
      ?auto_114329 - BLOCK
      ?auto_114331 - BLOCK
      ?auto_114332 - BLOCK
      ?auto_114333 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114326 ?auto_114327 ) ) ( not ( = ?auto_114326 ?auto_114328 ) ) ( not ( = ?auto_114327 ?auto_114328 ) ) ( ON ?auto_114328 ?auto_114330 ) ( not ( = ?auto_114326 ?auto_114330 ) ) ( not ( = ?auto_114327 ?auto_114330 ) ) ( not ( = ?auto_114328 ?auto_114330 ) ) ( ON ?auto_114327 ?auto_114328 ) ( ON-TABLE ?auto_114329 ) ( ON ?auto_114331 ?auto_114329 ) ( ON ?auto_114332 ?auto_114331 ) ( ON ?auto_114330 ?auto_114332 ) ( not ( = ?auto_114329 ?auto_114331 ) ) ( not ( = ?auto_114329 ?auto_114332 ) ) ( not ( = ?auto_114329 ?auto_114330 ) ) ( not ( = ?auto_114329 ?auto_114328 ) ) ( not ( = ?auto_114329 ?auto_114327 ) ) ( not ( = ?auto_114331 ?auto_114332 ) ) ( not ( = ?auto_114331 ?auto_114330 ) ) ( not ( = ?auto_114331 ?auto_114328 ) ) ( not ( = ?auto_114331 ?auto_114327 ) ) ( not ( = ?auto_114332 ?auto_114330 ) ) ( not ( = ?auto_114332 ?auto_114328 ) ) ( not ( = ?auto_114332 ?auto_114327 ) ) ( not ( = ?auto_114326 ?auto_114329 ) ) ( not ( = ?auto_114326 ?auto_114331 ) ) ( not ( = ?auto_114326 ?auto_114332 ) ) ( CLEAR ?auto_114327 ) ( ON ?auto_114326 ?auto_114333 ) ( CLEAR ?auto_114326 ) ( HAND-EMPTY ) ( not ( = ?auto_114326 ?auto_114333 ) ) ( not ( = ?auto_114327 ?auto_114333 ) ) ( not ( = ?auto_114328 ?auto_114333 ) ) ( not ( = ?auto_114330 ?auto_114333 ) ) ( not ( = ?auto_114329 ?auto_114333 ) ) ( not ( = ?auto_114331 ?auto_114333 ) ) ( not ( = ?auto_114332 ?auto_114333 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_114326 ?auto_114333 )
      ( MAKE-3PILE ?auto_114326 ?auto_114327 ?auto_114328 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_114334 - BLOCK
      ?auto_114335 - BLOCK
      ?auto_114336 - BLOCK
    )
    :vars
    (
      ?auto_114337 - BLOCK
      ?auto_114341 - BLOCK
      ?auto_114340 - BLOCK
      ?auto_114339 - BLOCK
      ?auto_114338 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114334 ?auto_114335 ) ) ( not ( = ?auto_114334 ?auto_114336 ) ) ( not ( = ?auto_114335 ?auto_114336 ) ) ( ON ?auto_114336 ?auto_114337 ) ( not ( = ?auto_114334 ?auto_114337 ) ) ( not ( = ?auto_114335 ?auto_114337 ) ) ( not ( = ?auto_114336 ?auto_114337 ) ) ( ON-TABLE ?auto_114341 ) ( ON ?auto_114340 ?auto_114341 ) ( ON ?auto_114339 ?auto_114340 ) ( ON ?auto_114337 ?auto_114339 ) ( not ( = ?auto_114341 ?auto_114340 ) ) ( not ( = ?auto_114341 ?auto_114339 ) ) ( not ( = ?auto_114341 ?auto_114337 ) ) ( not ( = ?auto_114341 ?auto_114336 ) ) ( not ( = ?auto_114341 ?auto_114335 ) ) ( not ( = ?auto_114340 ?auto_114339 ) ) ( not ( = ?auto_114340 ?auto_114337 ) ) ( not ( = ?auto_114340 ?auto_114336 ) ) ( not ( = ?auto_114340 ?auto_114335 ) ) ( not ( = ?auto_114339 ?auto_114337 ) ) ( not ( = ?auto_114339 ?auto_114336 ) ) ( not ( = ?auto_114339 ?auto_114335 ) ) ( not ( = ?auto_114334 ?auto_114341 ) ) ( not ( = ?auto_114334 ?auto_114340 ) ) ( not ( = ?auto_114334 ?auto_114339 ) ) ( ON ?auto_114334 ?auto_114338 ) ( CLEAR ?auto_114334 ) ( not ( = ?auto_114334 ?auto_114338 ) ) ( not ( = ?auto_114335 ?auto_114338 ) ) ( not ( = ?auto_114336 ?auto_114338 ) ) ( not ( = ?auto_114337 ?auto_114338 ) ) ( not ( = ?auto_114341 ?auto_114338 ) ) ( not ( = ?auto_114340 ?auto_114338 ) ) ( not ( = ?auto_114339 ?auto_114338 ) ) ( HOLDING ?auto_114335 ) ( CLEAR ?auto_114336 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_114341 ?auto_114340 ?auto_114339 ?auto_114337 ?auto_114336 ?auto_114335 )
      ( MAKE-3PILE ?auto_114334 ?auto_114335 ?auto_114336 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_114342 - BLOCK
      ?auto_114343 - BLOCK
      ?auto_114344 - BLOCK
    )
    :vars
    (
      ?auto_114348 - BLOCK
      ?auto_114345 - BLOCK
      ?auto_114346 - BLOCK
      ?auto_114349 - BLOCK
      ?auto_114347 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114342 ?auto_114343 ) ) ( not ( = ?auto_114342 ?auto_114344 ) ) ( not ( = ?auto_114343 ?auto_114344 ) ) ( ON ?auto_114344 ?auto_114348 ) ( not ( = ?auto_114342 ?auto_114348 ) ) ( not ( = ?auto_114343 ?auto_114348 ) ) ( not ( = ?auto_114344 ?auto_114348 ) ) ( ON-TABLE ?auto_114345 ) ( ON ?auto_114346 ?auto_114345 ) ( ON ?auto_114349 ?auto_114346 ) ( ON ?auto_114348 ?auto_114349 ) ( not ( = ?auto_114345 ?auto_114346 ) ) ( not ( = ?auto_114345 ?auto_114349 ) ) ( not ( = ?auto_114345 ?auto_114348 ) ) ( not ( = ?auto_114345 ?auto_114344 ) ) ( not ( = ?auto_114345 ?auto_114343 ) ) ( not ( = ?auto_114346 ?auto_114349 ) ) ( not ( = ?auto_114346 ?auto_114348 ) ) ( not ( = ?auto_114346 ?auto_114344 ) ) ( not ( = ?auto_114346 ?auto_114343 ) ) ( not ( = ?auto_114349 ?auto_114348 ) ) ( not ( = ?auto_114349 ?auto_114344 ) ) ( not ( = ?auto_114349 ?auto_114343 ) ) ( not ( = ?auto_114342 ?auto_114345 ) ) ( not ( = ?auto_114342 ?auto_114346 ) ) ( not ( = ?auto_114342 ?auto_114349 ) ) ( ON ?auto_114342 ?auto_114347 ) ( not ( = ?auto_114342 ?auto_114347 ) ) ( not ( = ?auto_114343 ?auto_114347 ) ) ( not ( = ?auto_114344 ?auto_114347 ) ) ( not ( = ?auto_114348 ?auto_114347 ) ) ( not ( = ?auto_114345 ?auto_114347 ) ) ( not ( = ?auto_114346 ?auto_114347 ) ) ( not ( = ?auto_114349 ?auto_114347 ) ) ( CLEAR ?auto_114344 ) ( ON ?auto_114343 ?auto_114342 ) ( CLEAR ?auto_114343 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_114347 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_114347 ?auto_114342 )
      ( MAKE-3PILE ?auto_114342 ?auto_114343 ?auto_114344 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_114350 - BLOCK
      ?auto_114351 - BLOCK
      ?auto_114352 - BLOCK
    )
    :vars
    (
      ?auto_114356 - BLOCK
      ?auto_114357 - BLOCK
      ?auto_114353 - BLOCK
      ?auto_114355 - BLOCK
      ?auto_114354 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114350 ?auto_114351 ) ) ( not ( = ?auto_114350 ?auto_114352 ) ) ( not ( = ?auto_114351 ?auto_114352 ) ) ( not ( = ?auto_114350 ?auto_114356 ) ) ( not ( = ?auto_114351 ?auto_114356 ) ) ( not ( = ?auto_114352 ?auto_114356 ) ) ( ON-TABLE ?auto_114357 ) ( ON ?auto_114353 ?auto_114357 ) ( ON ?auto_114355 ?auto_114353 ) ( ON ?auto_114356 ?auto_114355 ) ( not ( = ?auto_114357 ?auto_114353 ) ) ( not ( = ?auto_114357 ?auto_114355 ) ) ( not ( = ?auto_114357 ?auto_114356 ) ) ( not ( = ?auto_114357 ?auto_114352 ) ) ( not ( = ?auto_114357 ?auto_114351 ) ) ( not ( = ?auto_114353 ?auto_114355 ) ) ( not ( = ?auto_114353 ?auto_114356 ) ) ( not ( = ?auto_114353 ?auto_114352 ) ) ( not ( = ?auto_114353 ?auto_114351 ) ) ( not ( = ?auto_114355 ?auto_114356 ) ) ( not ( = ?auto_114355 ?auto_114352 ) ) ( not ( = ?auto_114355 ?auto_114351 ) ) ( not ( = ?auto_114350 ?auto_114357 ) ) ( not ( = ?auto_114350 ?auto_114353 ) ) ( not ( = ?auto_114350 ?auto_114355 ) ) ( ON ?auto_114350 ?auto_114354 ) ( not ( = ?auto_114350 ?auto_114354 ) ) ( not ( = ?auto_114351 ?auto_114354 ) ) ( not ( = ?auto_114352 ?auto_114354 ) ) ( not ( = ?auto_114356 ?auto_114354 ) ) ( not ( = ?auto_114357 ?auto_114354 ) ) ( not ( = ?auto_114353 ?auto_114354 ) ) ( not ( = ?auto_114355 ?auto_114354 ) ) ( ON ?auto_114351 ?auto_114350 ) ( CLEAR ?auto_114351 ) ( ON-TABLE ?auto_114354 ) ( HOLDING ?auto_114352 ) ( CLEAR ?auto_114356 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_114357 ?auto_114353 ?auto_114355 ?auto_114356 ?auto_114352 )
      ( MAKE-3PILE ?auto_114350 ?auto_114351 ?auto_114352 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_114358 - BLOCK
      ?auto_114359 - BLOCK
      ?auto_114360 - BLOCK
    )
    :vars
    (
      ?auto_114361 - BLOCK
      ?auto_114363 - BLOCK
      ?auto_114365 - BLOCK
      ?auto_114364 - BLOCK
      ?auto_114362 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114358 ?auto_114359 ) ) ( not ( = ?auto_114358 ?auto_114360 ) ) ( not ( = ?auto_114359 ?auto_114360 ) ) ( not ( = ?auto_114358 ?auto_114361 ) ) ( not ( = ?auto_114359 ?auto_114361 ) ) ( not ( = ?auto_114360 ?auto_114361 ) ) ( ON-TABLE ?auto_114363 ) ( ON ?auto_114365 ?auto_114363 ) ( ON ?auto_114364 ?auto_114365 ) ( ON ?auto_114361 ?auto_114364 ) ( not ( = ?auto_114363 ?auto_114365 ) ) ( not ( = ?auto_114363 ?auto_114364 ) ) ( not ( = ?auto_114363 ?auto_114361 ) ) ( not ( = ?auto_114363 ?auto_114360 ) ) ( not ( = ?auto_114363 ?auto_114359 ) ) ( not ( = ?auto_114365 ?auto_114364 ) ) ( not ( = ?auto_114365 ?auto_114361 ) ) ( not ( = ?auto_114365 ?auto_114360 ) ) ( not ( = ?auto_114365 ?auto_114359 ) ) ( not ( = ?auto_114364 ?auto_114361 ) ) ( not ( = ?auto_114364 ?auto_114360 ) ) ( not ( = ?auto_114364 ?auto_114359 ) ) ( not ( = ?auto_114358 ?auto_114363 ) ) ( not ( = ?auto_114358 ?auto_114365 ) ) ( not ( = ?auto_114358 ?auto_114364 ) ) ( ON ?auto_114358 ?auto_114362 ) ( not ( = ?auto_114358 ?auto_114362 ) ) ( not ( = ?auto_114359 ?auto_114362 ) ) ( not ( = ?auto_114360 ?auto_114362 ) ) ( not ( = ?auto_114361 ?auto_114362 ) ) ( not ( = ?auto_114363 ?auto_114362 ) ) ( not ( = ?auto_114365 ?auto_114362 ) ) ( not ( = ?auto_114364 ?auto_114362 ) ) ( ON ?auto_114359 ?auto_114358 ) ( ON-TABLE ?auto_114362 ) ( CLEAR ?auto_114361 ) ( ON ?auto_114360 ?auto_114359 ) ( CLEAR ?auto_114360 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_114362 ?auto_114358 ?auto_114359 )
      ( MAKE-3PILE ?auto_114358 ?auto_114359 ?auto_114360 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_114366 - BLOCK
      ?auto_114367 - BLOCK
      ?auto_114368 - BLOCK
    )
    :vars
    (
      ?auto_114369 - BLOCK
      ?auto_114372 - BLOCK
      ?auto_114371 - BLOCK
      ?auto_114373 - BLOCK
      ?auto_114370 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114366 ?auto_114367 ) ) ( not ( = ?auto_114366 ?auto_114368 ) ) ( not ( = ?auto_114367 ?auto_114368 ) ) ( not ( = ?auto_114366 ?auto_114369 ) ) ( not ( = ?auto_114367 ?auto_114369 ) ) ( not ( = ?auto_114368 ?auto_114369 ) ) ( ON-TABLE ?auto_114372 ) ( ON ?auto_114371 ?auto_114372 ) ( ON ?auto_114373 ?auto_114371 ) ( not ( = ?auto_114372 ?auto_114371 ) ) ( not ( = ?auto_114372 ?auto_114373 ) ) ( not ( = ?auto_114372 ?auto_114369 ) ) ( not ( = ?auto_114372 ?auto_114368 ) ) ( not ( = ?auto_114372 ?auto_114367 ) ) ( not ( = ?auto_114371 ?auto_114373 ) ) ( not ( = ?auto_114371 ?auto_114369 ) ) ( not ( = ?auto_114371 ?auto_114368 ) ) ( not ( = ?auto_114371 ?auto_114367 ) ) ( not ( = ?auto_114373 ?auto_114369 ) ) ( not ( = ?auto_114373 ?auto_114368 ) ) ( not ( = ?auto_114373 ?auto_114367 ) ) ( not ( = ?auto_114366 ?auto_114372 ) ) ( not ( = ?auto_114366 ?auto_114371 ) ) ( not ( = ?auto_114366 ?auto_114373 ) ) ( ON ?auto_114366 ?auto_114370 ) ( not ( = ?auto_114366 ?auto_114370 ) ) ( not ( = ?auto_114367 ?auto_114370 ) ) ( not ( = ?auto_114368 ?auto_114370 ) ) ( not ( = ?auto_114369 ?auto_114370 ) ) ( not ( = ?auto_114372 ?auto_114370 ) ) ( not ( = ?auto_114371 ?auto_114370 ) ) ( not ( = ?auto_114373 ?auto_114370 ) ) ( ON ?auto_114367 ?auto_114366 ) ( ON-TABLE ?auto_114370 ) ( ON ?auto_114368 ?auto_114367 ) ( CLEAR ?auto_114368 ) ( HOLDING ?auto_114369 ) ( CLEAR ?auto_114373 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_114372 ?auto_114371 ?auto_114373 ?auto_114369 )
      ( MAKE-3PILE ?auto_114366 ?auto_114367 ?auto_114368 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_114374 - BLOCK
      ?auto_114375 - BLOCK
      ?auto_114376 - BLOCK
    )
    :vars
    (
      ?auto_114378 - BLOCK
      ?auto_114380 - BLOCK
      ?auto_114377 - BLOCK
      ?auto_114381 - BLOCK
      ?auto_114379 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114374 ?auto_114375 ) ) ( not ( = ?auto_114374 ?auto_114376 ) ) ( not ( = ?auto_114375 ?auto_114376 ) ) ( not ( = ?auto_114374 ?auto_114378 ) ) ( not ( = ?auto_114375 ?auto_114378 ) ) ( not ( = ?auto_114376 ?auto_114378 ) ) ( ON-TABLE ?auto_114380 ) ( ON ?auto_114377 ?auto_114380 ) ( ON ?auto_114381 ?auto_114377 ) ( not ( = ?auto_114380 ?auto_114377 ) ) ( not ( = ?auto_114380 ?auto_114381 ) ) ( not ( = ?auto_114380 ?auto_114378 ) ) ( not ( = ?auto_114380 ?auto_114376 ) ) ( not ( = ?auto_114380 ?auto_114375 ) ) ( not ( = ?auto_114377 ?auto_114381 ) ) ( not ( = ?auto_114377 ?auto_114378 ) ) ( not ( = ?auto_114377 ?auto_114376 ) ) ( not ( = ?auto_114377 ?auto_114375 ) ) ( not ( = ?auto_114381 ?auto_114378 ) ) ( not ( = ?auto_114381 ?auto_114376 ) ) ( not ( = ?auto_114381 ?auto_114375 ) ) ( not ( = ?auto_114374 ?auto_114380 ) ) ( not ( = ?auto_114374 ?auto_114377 ) ) ( not ( = ?auto_114374 ?auto_114381 ) ) ( ON ?auto_114374 ?auto_114379 ) ( not ( = ?auto_114374 ?auto_114379 ) ) ( not ( = ?auto_114375 ?auto_114379 ) ) ( not ( = ?auto_114376 ?auto_114379 ) ) ( not ( = ?auto_114378 ?auto_114379 ) ) ( not ( = ?auto_114380 ?auto_114379 ) ) ( not ( = ?auto_114377 ?auto_114379 ) ) ( not ( = ?auto_114381 ?auto_114379 ) ) ( ON ?auto_114375 ?auto_114374 ) ( ON-TABLE ?auto_114379 ) ( ON ?auto_114376 ?auto_114375 ) ( CLEAR ?auto_114381 ) ( ON ?auto_114378 ?auto_114376 ) ( CLEAR ?auto_114378 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_114379 ?auto_114374 ?auto_114375 ?auto_114376 )
      ( MAKE-3PILE ?auto_114374 ?auto_114375 ?auto_114376 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_114382 - BLOCK
      ?auto_114383 - BLOCK
      ?auto_114384 - BLOCK
    )
    :vars
    (
      ?auto_114388 - BLOCK
      ?auto_114385 - BLOCK
      ?auto_114389 - BLOCK
      ?auto_114386 - BLOCK
      ?auto_114387 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114382 ?auto_114383 ) ) ( not ( = ?auto_114382 ?auto_114384 ) ) ( not ( = ?auto_114383 ?auto_114384 ) ) ( not ( = ?auto_114382 ?auto_114388 ) ) ( not ( = ?auto_114383 ?auto_114388 ) ) ( not ( = ?auto_114384 ?auto_114388 ) ) ( ON-TABLE ?auto_114385 ) ( ON ?auto_114389 ?auto_114385 ) ( not ( = ?auto_114385 ?auto_114389 ) ) ( not ( = ?auto_114385 ?auto_114386 ) ) ( not ( = ?auto_114385 ?auto_114388 ) ) ( not ( = ?auto_114385 ?auto_114384 ) ) ( not ( = ?auto_114385 ?auto_114383 ) ) ( not ( = ?auto_114389 ?auto_114386 ) ) ( not ( = ?auto_114389 ?auto_114388 ) ) ( not ( = ?auto_114389 ?auto_114384 ) ) ( not ( = ?auto_114389 ?auto_114383 ) ) ( not ( = ?auto_114386 ?auto_114388 ) ) ( not ( = ?auto_114386 ?auto_114384 ) ) ( not ( = ?auto_114386 ?auto_114383 ) ) ( not ( = ?auto_114382 ?auto_114385 ) ) ( not ( = ?auto_114382 ?auto_114389 ) ) ( not ( = ?auto_114382 ?auto_114386 ) ) ( ON ?auto_114382 ?auto_114387 ) ( not ( = ?auto_114382 ?auto_114387 ) ) ( not ( = ?auto_114383 ?auto_114387 ) ) ( not ( = ?auto_114384 ?auto_114387 ) ) ( not ( = ?auto_114388 ?auto_114387 ) ) ( not ( = ?auto_114385 ?auto_114387 ) ) ( not ( = ?auto_114389 ?auto_114387 ) ) ( not ( = ?auto_114386 ?auto_114387 ) ) ( ON ?auto_114383 ?auto_114382 ) ( ON-TABLE ?auto_114387 ) ( ON ?auto_114384 ?auto_114383 ) ( ON ?auto_114388 ?auto_114384 ) ( CLEAR ?auto_114388 ) ( HOLDING ?auto_114386 ) ( CLEAR ?auto_114389 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_114385 ?auto_114389 ?auto_114386 )
      ( MAKE-3PILE ?auto_114382 ?auto_114383 ?auto_114384 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_114390 - BLOCK
      ?auto_114391 - BLOCK
      ?auto_114392 - BLOCK
    )
    :vars
    (
      ?auto_114397 - BLOCK
      ?auto_114396 - BLOCK
      ?auto_114393 - BLOCK
      ?auto_114395 - BLOCK
      ?auto_114394 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114390 ?auto_114391 ) ) ( not ( = ?auto_114390 ?auto_114392 ) ) ( not ( = ?auto_114391 ?auto_114392 ) ) ( not ( = ?auto_114390 ?auto_114397 ) ) ( not ( = ?auto_114391 ?auto_114397 ) ) ( not ( = ?auto_114392 ?auto_114397 ) ) ( ON-TABLE ?auto_114396 ) ( ON ?auto_114393 ?auto_114396 ) ( not ( = ?auto_114396 ?auto_114393 ) ) ( not ( = ?auto_114396 ?auto_114395 ) ) ( not ( = ?auto_114396 ?auto_114397 ) ) ( not ( = ?auto_114396 ?auto_114392 ) ) ( not ( = ?auto_114396 ?auto_114391 ) ) ( not ( = ?auto_114393 ?auto_114395 ) ) ( not ( = ?auto_114393 ?auto_114397 ) ) ( not ( = ?auto_114393 ?auto_114392 ) ) ( not ( = ?auto_114393 ?auto_114391 ) ) ( not ( = ?auto_114395 ?auto_114397 ) ) ( not ( = ?auto_114395 ?auto_114392 ) ) ( not ( = ?auto_114395 ?auto_114391 ) ) ( not ( = ?auto_114390 ?auto_114396 ) ) ( not ( = ?auto_114390 ?auto_114393 ) ) ( not ( = ?auto_114390 ?auto_114395 ) ) ( ON ?auto_114390 ?auto_114394 ) ( not ( = ?auto_114390 ?auto_114394 ) ) ( not ( = ?auto_114391 ?auto_114394 ) ) ( not ( = ?auto_114392 ?auto_114394 ) ) ( not ( = ?auto_114397 ?auto_114394 ) ) ( not ( = ?auto_114396 ?auto_114394 ) ) ( not ( = ?auto_114393 ?auto_114394 ) ) ( not ( = ?auto_114395 ?auto_114394 ) ) ( ON ?auto_114391 ?auto_114390 ) ( ON-TABLE ?auto_114394 ) ( ON ?auto_114392 ?auto_114391 ) ( ON ?auto_114397 ?auto_114392 ) ( CLEAR ?auto_114393 ) ( ON ?auto_114395 ?auto_114397 ) ( CLEAR ?auto_114395 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_114394 ?auto_114390 ?auto_114391 ?auto_114392 ?auto_114397 )
      ( MAKE-3PILE ?auto_114390 ?auto_114391 ?auto_114392 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_114398 - BLOCK
      ?auto_114399 - BLOCK
      ?auto_114400 - BLOCK
    )
    :vars
    (
      ?auto_114402 - BLOCK
      ?auto_114403 - BLOCK
      ?auto_114405 - BLOCK
      ?auto_114401 - BLOCK
      ?auto_114404 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114398 ?auto_114399 ) ) ( not ( = ?auto_114398 ?auto_114400 ) ) ( not ( = ?auto_114399 ?auto_114400 ) ) ( not ( = ?auto_114398 ?auto_114402 ) ) ( not ( = ?auto_114399 ?auto_114402 ) ) ( not ( = ?auto_114400 ?auto_114402 ) ) ( ON-TABLE ?auto_114403 ) ( not ( = ?auto_114403 ?auto_114405 ) ) ( not ( = ?auto_114403 ?auto_114401 ) ) ( not ( = ?auto_114403 ?auto_114402 ) ) ( not ( = ?auto_114403 ?auto_114400 ) ) ( not ( = ?auto_114403 ?auto_114399 ) ) ( not ( = ?auto_114405 ?auto_114401 ) ) ( not ( = ?auto_114405 ?auto_114402 ) ) ( not ( = ?auto_114405 ?auto_114400 ) ) ( not ( = ?auto_114405 ?auto_114399 ) ) ( not ( = ?auto_114401 ?auto_114402 ) ) ( not ( = ?auto_114401 ?auto_114400 ) ) ( not ( = ?auto_114401 ?auto_114399 ) ) ( not ( = ?auto_114398 ?auto_114403 ) ) ( not ( = ?auto_114398 ?auto_114405 ) ) ( not ( = ?auto_114398 ?auto_114401 ) ) ( ON ?auto_114398 ?auto_114404 ) ( not ( = ?auto_114398 ?auto_114404 ) ) ( not ( = ?auto_114399 ?auto_114404 ) ) ( not ( = ?auto_114400 ?auto_114404 ) ) ( not ( = ?auto_114402 ?auto_114404 ) ) ( not ( = ?auto_114403 ?auto_114404 ) ) ( not ( = ?auto_114405 ?auto_114404 ) ) ( not ( = ?auto_114401 ?auto_114404 ) ) ( ON ?auto_114399 ?auto_114398 ) ( ON-TABLE ?auto_114404 ) ( ON ?auto_114400 ?auto_114399 ) ( ON ?auto_114402 ?auto_114400 ) ( ON ?auto_114401 ?auto_114402 ) ( CLEAR ?auto_114401 ) ( HOLDING ?auto_114405 ) ( CLEAR ?auto_114403 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_114403 ?auto_114405 )
      ( MAKE-3PILE ?auto_114398 ?auto_114399 ?auto_114400 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_114406 - BLOCK
      ?auto_114407 - BLOCK
      ?auto_114408 - BLOCK
    )
    :vars
    (
      ?auto_114410 - BLOCK
      ?auto_114413 - BLOCK
      ?auto_114411 - BLOCK
      ?auto_114409 - BLOCK
      ?auto_114412 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114406 ?auto_114407 ) ) ( not ( = ?auto_114406 ?auto_114408 ) ) ( not ( = ?auto_114407 ?auto_114408 ) ) ( not ( = ?auto_114406 ?auto_114410 ) ) ( not ( = ?auto_114407 ?auto_114410 ) ) ( not ( = ?auto_114408 ?auto_114410 ) ) ( ON-TABLE ?auto_114413 ) ( not ( = ?auto_114413 ?auto_114411 ) ) ( not ( = ?auto_114413 ?auto_114409 ) ) ( not ( = ?auto_114413 ?auto_114410 ) ) ( not ( = ?auto_114413 ?auto_114408 ) ) ( not ( = ?auto_114413 ?auto_114407 ) ) ( not ( = ?auto_114411 ?auto_114409 ) ) ( not ( = ?auto_114411 ?auto_114410 ) ) ( not ( = ?auto_114411 ?auto_114408 ) ) ( not ( = ?auto_114411 ?auto_114407 ) ) ( not ( = ?auto_114409 ?auto_114410 ) ) ( not ( = ?auto_114409 ?auto_114408 ) ) ( not ( = ?auto_114409 ?auto_114407 ) ) ( not ( = ?auto_114406 ?auto_114413 ) ) ( not ( = ?auto_114406 ?auto_114411 ) ) ( not ( = ?auto_114406 ?auto_114409 ) ) ( ON ?auto_114406 ?auto_114412 ) ( not ( = ?auto_114406 ?auto_114412 ) ) ( not ( = ?auto_114407 ?auto_114412 ) ) ( not ( = ?auto_114408 ?auto_114412 ) ) ( not ( = ?auto_114410 ?auto_114412 ) ) ( not ( = ?auto_114413 ?auto_114412 ) ) ( not ( = ?auto_114411 ?auto_114412 ) ) ( not ( = ?auto_114409 ?auto_114412 ) ) ( ON ?auto_114407 ?auto_114406 ) ( ON-TABLE ?auto_114412 ) ( ON ?auto_114408 ?auto_114407 ) ( ON ?auto_114410 ?auto_114408 ) ( ON ?auto_114409 ?auto_114410 ) ( CLEAR ?auto_114413 ) ( ON ?auto_114411 ?auto_114409 ) ( CLEAR ?auto_114411 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_114412 ?auto_114406 ?auto_114407 ?auto_114408 ?auto_114410 ?auto_114409 )
      ( MAKE-3PILE ?auto_114406 ?auto_114407 ?auto_114408 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_114414 - BLOCK
      ?auto_114415 - BLOCK
      ?auto_114416 - BLOCK
    )
    :vars
    (
      ?auto_114417 - BLOCK
      ?auto_114420 - BLOCK
      ?auto_114418 - BLOCK
      ?auto_114419 - BLOCK
      ?auto_114421 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114414 ?auto_114415 ) ) ( not ( = ?auto_114414 ?auto_114416 ) ) ( not ( = ?auto_114415 ?auto_114416 ) ) ( not ( = ?auto_114414 ?auto_114417 ) ) ( not ( = ?auto_114415 ?auto_114417 ) ) ( not ( = ?auto_114416 ?auto_114417 ) ) ( not ( = ?auto_114420 ?auto_114418 ) ) ( not ( = ?auto_114420 ?auto_114419 ) ) ( not ( = ?auto_114420 ?auto_114417 ) ) ( not ( = ?auto_114420 ?auto_114416 ) ) ( not ( = ?auto_114420 ?auto_114415 ) ) ( not ( = ?auto_114418 ?auto_114419 ) ) ( not ( = ?auto_114418 ?auto_114417 ) ) ( not ( = ?auto_114418 ?auto_114416 ) ) ( not ( = ?auto_114418 ?auto_114415 ) ) ( not ( = ?auto_114419 ?auto_114417 ) ) ( not ( = ?auto_114419 ?auto_114416 ) ) ( not ( = ?auto_114419 ?auto_114415 ) ) ( not ( = ?auto_114414 ?auto_114420 ) ) ( not ( = ?auto_114414 ?auto_114418 ) ) ( not ( = ?auto_114414 ?auto_114419 ) ) ( ON ?auto_114414 ?auto_114421 ) ( not ( = ?auto_114414 ?auto_114421 ) ) ( not ( = ?auto_114415 ?auto_114421 ) ) ( not ( = ?auto_114416 ?auto_114421 ) ) ( not ( = ?auto_114417 ?auto_114421 ) ) ( not ( = ?auto_114420 ?auto_114421 ) ) ( not ( = ?auto_114418 ?auto_114421 ) ) ( not ( = ?auto_114419 ?auto_114421 ) ) ( ON ?auto_114415 ?auto_114414 ) ( ON-TABLE ?auto_114421 ) ( ON ?auto_114416 ?auto_114415 ) ( ON ?auto_114417 ?auto_114416 ) ( ON ?auto_114419 ?auto_114417 ) ( ON ?auto_114418 ?auto_114419 ) ( CLEAR ?auto_114418 ) ( HOLDING ?auto_114420 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_114420 )
      ( MAKE-3PILE ?auto_114414 ?auto_114415 ?auto_114416 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_114422 - BLOCK
      ?auto_114423 - BLOCK
      ?auto_114424 - BLOCK
    )
    :vars
    (
      ?auto_114427 - BLOCK
      ?auto_114426 - BLOCK
      ?auto_114429 - BLOCK
      ?auto_114428 - BLOCK
      ?auto_114425 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114422 ?auto_114423 ) ) ( not ( = ?auto_114422 ?auto_114424 ) ) ( not ( = ?auto_114423 ?auto_114424 ) ) ( not ( = ?auto_114422 ?auto_114427 ) ) ( not ( = ?auto_114423 ?auto_114427 ) ) ( not ( = ?auto_114424 ?auto_114427 ) ) ( not ( = ?auto_114426 ?auto_114429 ) ) ( not ( = ?auto_114426 ?auto_114428 ) ) ( not ( = ?auto_114426 ?auto_114427 ) ) ( not ( = ?auto_114426 ?auto_114424 ) ) ( not ( = ?auto_114426 ?auto_114423 ) ) ( not ( = ?auto_114429 ?auto_114428 ) ) ( not ( = ?auto_114429 ?auto_114427 ) ) ( not ( = ?auto_114429 ?auto_114424 ) ) ( not ( = ?auto_114429 ?auto_114423 ) ) ( not ( = ?auto_114428 ?auto_114427 ) ) ( not ( = ?auto_114428 ?auto_114424 ) ) ( not ( = ?auto_114428 ?auto_114423 ) ) ( not ( = ?auto_114422 ?auto_114426 ) ) ( not ( = ?auto_114422 ?auto_114429 ) ) ( not ( = ?auto_114422 ?auto_114428 ) ) ( ON ?auto_114422 ?auto_114425 ) ( not ( = ?auto_114422 ?auto_114425 ) ) ( not ( = ?auto_114423 ?auto_114425 ) ) ( not ( = ?auto_114424 ?auto_114425 ) ) ( not ( = ?auto_114427 ?auto_114425 ) ) ( not ( = ?auto_114426 ?auto_114425 ) ) ( not ( = ?auto_114429 ?auto_114425 ) ) ( not ( = ?auto_114428 ?auto_114425 ) ) ( ON ?auto_114423 ?auto_114422 ) ( ON-TABLE ?auto_114425 ) ( ON ?auto_114424 ?auto_114423 ) ( ON ?auto_114427 ?auto_114424 ) ( ON ?auto_114428 ?auto_114427 ) ( ON ?auto_114429 ?auto_114428 ) ( ON ?auto_114426 ?auto_114429 ) ( CLEAR ?auto_114426 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_114425 ?auto_114422 ?auto_114423 ?auto_114424 ?auto_114427 ?auto_114428 ?auto_114429 )
      ( MAKE-3PILE ?auto_114422 ?auto_114423 ?auto_114424 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_114433 - BLOCK
      ?auto_114434 - BLOCK
      ?auto_114435 - BLOCK
    )
    :vars
    (
      ?auto_114436 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114436 ?auto_114435 ) ( CLEAR ?auto_114436 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_114433 ) ( ON ?auto_114434 ?auto_114433 ) ( ON ?auto_114435 ?auto_114434 ) ( not ( = ?auto_114433 ?auto_114434 ) ) ( not ( = ?auto_114433 ?auto_114435 ) ) ( not ( = ?auto_114433 ?auto_114436 ) ) ( not ( = ?auto_114434 ?auto_114435 ) ) ( not ( = ?auto_114434 ?auto_114436 ) ) ( not ( = ?auto_114435 ?auto_114436 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_114436 ?auto_114435 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_114437 - BLOCK
      ?auto_114438 - BLOCK
      ?auto_114439 - BLOCK
    )
    :vars
    (
      ?auto_114440 - BLOCK
      ?auto_114441 - BLOCK
      ?auto_114442 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114440 ?auto_114439 ) ( CLEAR ?auto_114440 ) ( ON-TABLE ?auto_114437 ) ( ON ?auto_114438 ?auto_114437 ) ( ON ?auto_114439 ?auto_114438 ) ( not ( = ?auto_114437 ?auto_114438 ) ) ( not ( = ?auto_114437 ?auto_114439 ) ) ( not ( = ?auto_114437 ?auto_114440 ) ) ( not ( = ?auto_114438 ?auto_114439 ) ) ( not ( = ?auto_114438 ?auto_114440 ) ) ( not ( = ?auto_114439 ?auto_114440 ) ) ( HOLDING ?auto_114441 ) ( CLEAR ?auto_114442 ) ( not ( = ?auto_114437 ?auto_114441 ) ) ( not ( = ?auto_114437 ?auto_114442 ) ) ( not ( = ?auto_114438 ?auto_114441 ) ) ( not ( = ?auto_114438 ?auto_114442 ) ) ( not ( = ?auto_114439 ?auto_114441 ) ) ( not ( = ?auto_114439 ?auto_114442 ) ) ( not ( = ?auto_114440 ?auto_114441 ) ) ( not ( = ?auto_114440 ?auto_114442 ) ) ( not ( = ?auto_114441 ?auto_114442 ) ) )
    :subtasks
    ( ( !STACK ?auto_114441 ?auto_114442 )
      ( MAKE-3PILE ?auto_114437 ?auto_114438 ?auto_114439 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_114443 - BLOCK
      ?auto_114444 - BLOCK
      ?auto_114445 - BLOCK
    )
    :vars
    (
      ?auto_114447 - BLOCK
      ?auto_114446 - BLOCK
      ?auto_114448 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114447 ?auto_114445 ) ( ON-TABLE ?auto_114443 ) ( ON ?auto_114444 ?auto_114443 ) ( ON ?auto_114445 ?auto_114444 ) ( not ( = ?auto_114443 ?auto_114444 ) ) ( not ( = ?auto_114443 ?auto_114445 ) ) ( not ( = ?auto_114443 ?auto_114447 ) ) ( not ( = ?auto_114444 ?auto_114445 ) ) ( not ( = ?auto_114444 ?auto_114447 ) ) ( not ( = ?auto_114445 ?auto_114447 ) ) ( CLEAR ?auto_114446 ) ( not ( = ?auto_114443 ?auto_114448 ) ) ( not ( = ?auto_114443 ?auto_114446 ) ) ( not ( = ?auto_114444 ?auto_114448 ) ) ( not ( = ?auto_114444 ?auto_114446 ) ) ( not ( = ?auto_114445 ?auto_114448 ) ) ( not ( = ?auto_114445 ?auto_114446 ) ) ( not ( = ?auto_114447 ?auto_114448 ) ) ( not ( = ?auto_114447 ?auto_114446 ) ) ( not ( = ?auto_114448 ?auto_114446 ) ) ( ON ?auto_114448 ?auto_114447 ) ( CLEAR ?auto_114448 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_114443 ?auto_114444 ?auto_114445 ?auto_114447 )
      ( MAKE-3PILE ?auto_114443 ?auto_114444 ?auto_114445 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_114449 - BLOCK
      ?auto_114450 - BLOCK
      ?auto_114451 - BLOCK
    )
    :vars
    (
      ?auto_114453 - BLOCK
      ?auto_114454 - BLOCK
      ?auto_114452 - BLOCK
      ?auto_114455 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114453 ?auto_114451 ) ( ON-TABLE ?auto_114449 ) ( ON ?auto_114450 ?auto_114449 ) ( ON ?auto_114451 ?auto_114450 ) ( not ( = ?auto_114449 ?auto_114450 ) ) ( not ( = ?auto_114449 ?auto_114451 ) ) ( not ( = ?auto_114449 ?auto_114453 ) ) ( not ( = ?auto_114450 ?auto_114451 ) ) ( not ( = ?auto_114450 ?auto_114453 ) ) ( not ( = ?auto_114451 ?auto_114453 ) ) ( not ( = ?auto_114449 ?auto_114454 ) ) ( not ( = ?auto_114449 ?auto_114452 ) ) ( not ( = ?auto_114450 ?auto_114454 ) ) ( not ( = ?auto_114450 ?auto_114452 ) ) ( not ( = ?auto_114451 ?auto_114454 ) ) ( not ( = ?auto_114451 ?auto_114452 ) ) ( not ( = ?auto_114453 ?auto_114454 ) ) ( not ( = ?auto_114453 ?auto_114452 ) ) ( not ( = ?auto_114454 ?auto_114452 ) ) ( ON ?auto_114454 ?auto_114453 ) ( CLEAR ?auto_114454 ) ( HOLDING ?auto_114452 ) ( CLEAR ?auto_114455 ) ( ON-TABLE ?auto_114455 ) ( not ( = ?auto_114455 ?auto_114452 ) ) ( not ( = ?auto_114449 ?auto_114455 ) ) ( not ( = ?auto_114450 ?auto_114455 ) ) ( not ( = ?auto_114451 ?auto_114455 ) ) ( not ( = ?auto_114453 ?auto_114455 ) ) ( not ( = ?auto_114454 ?auto_114455 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_114455 ?auto_114452 )
      ( MAKE-3PILE ?auto_114449 ?auto_114450 ?auto_114451 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_114456 - BLOCK
      ?auto_114457 - BLOCK
      ?auto_114458 - BLOCK
    )
    :vars
    (
      ?auto_114462 - BLOCK
      ?auto_114460 - BLOCK
      ?auto_114459 - BLOCK
      ?auto_114461 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114462 ?auto_114458 ) ( ON-TABLE ?auto_114456 ) ( ON ?auto_114457 ?auto_114456 ) ( ON ?auto_114458 ?auto_114457 ) ( not ( = ?auto_114456 ?auto_114457 ) ) ( not ( = ?auto_114456 ?auto_114458 ) ) ( not ( = ?auto_114456 ?auto_114462 ) ) ( not ( = ?auto_114457 ?auto_114458 ) ) ( not ( = ?auto_114457 ?auto_114462 ) ) ( not ( = ?auto_114458 ?auto_114462 ) ) ( not ( = ?auto_114456 ?auto_114460 ) ) ( not ( = ?auto_114456 ?auto_114459 ) ) ( not ( = ?auto_114457 ?auto_114460 ) ) ( not ( = ?auto_114457 ?auto_114459 ) ) ( not ( = ?auto_114458 ?auto_114460 ) ) ( not ( = ?auto_114458 ?auto_114459 ) ) ( not ( = ?auto_114462 ?auto_114460 ) ) ( not ( = ?auto_114462 ?auto_114459 ) ) ( not ( = ?auto_114460 ?auto_114459 ) ) ( ON ?auto_114460 ?auto_114462 ) ( CLEAR ?auto_114461 ) ( ON-TABLE ?auto_114461 ) ( not ( = ?auto_114461 ?auto_114459 ) ) ( not ( = ?auto_114456 ?auto_114461 ) ) ( not ( = ?auto_114457 ?auto_114461 ) ) ( not ( = ?auto_114458 ?auto_114461 ) ) ( not ( = ?auto_114462 ?auto_114461 ) ) ( not ( = ?auto_114460 ?auto_114461 ) ) ( ON ?auto_114459 ?auto_114460 ) ( CLEAR ?auto_114459 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_114456 ?auto_114457 ?auto_114458 ?auto_114462 ?auto_114460 )
      ( MAKE-3PILE ?auto_114456 ?auto_114457 ?auto_114458 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_114463 - BLOCK
      ?auto_114464 - BLOCK
      ?auto_114465 - BLOCK
    )
    :vars
    (
      ?auto_114466 - BLOCK
      ?auto_114469 - BLOCK
      ?auto_114467 - BLOCK
      ?auto_114468 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114466 ?auto_114465 ) ( ON-TABLE ?auto_114463 ) ( ON ?auto_114464 ?auto_114463 ) ( ON ?auto_114465 ?auto_114464 ) ( not ( = ?auto_114463 ?auto_114464 ) ) ( not ( = ?auto_114463 ?auto_114465 ) ) ( not ( = ?auto_114463 ?auto_114466 ) ) ( not ( = ?auto_114464 ?auto_114465 ) ) ( not ( = ?auto_114464 ?auto_114466 ) ) ( not ( = ?auto_114465 ?auto_114466 ) ) ( not ( = ?auto_114463 ?auto_114469 ) ) ( not ( = ?auto_114463 ?auto_114467 ) ) ( not ( = ?auto_114464 ?auto_114469 ) ) ( not ( = ?auto_114464 ?auto_114467 ) ) ( not ( = ?auto_114465 ?auto_114469 ) ) ( not ( = ?auto_114465 ?auto_114467 ) ) ( not ( = ?auto_114466 ?auto_114469 ) ) ( not ( = ?auto_114466 ?auto_114467 ) ) ( not ( = ?auto_114469 ?auto_114467 ) ) ( ON ?auto_114469 ?auto_114466 ) ( not ( = ?auto_114468 ?auto_114467 ) ) ( not ( = ?auto_114463 ?auto_114468 ) ) ( not ( = ?auto_114464 ?auto_114468 ) ) ( not ( = ?auto_114465 ?auto_114468 ) ) ( not ( = ?auto_114466 ?auto_114468 ) ) ( not ( = ?auto_114469 ?auto_114468 ) ) ( ON ?auto_114467 ?auto_114469 ) ( CLEAR ?auto_114467 ) ( HOLDING ?auto_114468 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_114468 )
      ( MAKE-3PILE ?auto_114463 ?auto_114464 ?auto_114465 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_114470 - BLOCK
      ?auto_114471 - BLOCK
      ?auto_114472 - BLOCK
    )
    :vars
    (
      ?auto_114476 - BLOCK
      ?auto_114474 - BLOCK
      ?auto_114473 - BLOCK
      ?auto_114475 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114476 ?auto_114472 ) ( ON-TABLE ?auto_114470 ) ( ON ?auto_114471 ?auto_114470 ) ( ON ?auto_114472 ?auto_114471 ) ( not ( = ?auto_114470 ?auto_114471 ) ) ( not ( = ?auto_114470 ?auto_114472 ) ) ( not ( = ?auto_114470 ?auto_114476 ) ) ( not ( = ?auto_114471 ?auto_114472 ) ) ( not ( = ?auto_114471 ?auto_114476 ) ) ( not ( = ?auto_114472 ?auto_114476 ) ) ( not ( = ?auto_114470 ?auto_114474 ) ) ( not ( = ?auto_114470 ?auto_114473 ) ) ( not ( = ?auto_114471 ?auto_114474 ) ) ( not ( = ?auto_114471 ?auto_114473 ) ) ( not ( = ?auto_114472 ?auto_114474 ) ) ( not ( = ?auto_114472 ?auto_114473 ) ) ( not ( = ?auto_114476 ?auto_114474 ) ) ( not ( = ?auto_114476 ?auto_114473 ) ) ( not ( = ?auto_114474 ?auto_114473 ) ) ( ON ?auto_114474 ?auto_114476 ) ( not ( = ?auto_114475 ?auto_114473 ) ) ( not ( = ?auto_114470 ?auto_114475 ) ) ( not ( = ?auto_114471 ?auto_114475 ) ) ( not ( = ?auto_114472 ?auto_114475 ) ) ( not ( = ?auto_114476 ?auto_114475 ) ) ( not ( = ?auto_114474 ?auto_114475 ) ) ( ON ?auto_114473 ?auto_114474 ) ( ON ?auto_114475 ?auto_114473 ) ( CLEAR ?auto_114475 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_114470 ?auto_114471 ?auto_114472 ?auto_114476 ?auto_114474 ?auto_114473 )
      ( MAKE-3PILE ?auto_114470 ?auto_114471 ?auto_114472 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_114477 - BLOCK
      ?auto_114478 - BLOCK
      ?auto_114479 - BLOCK
    )
    :vars
    (
      ?auto_114483 - BLOCK
      ?auto_114482 - BLOCK
      ?auto_114481 - BLOCK
      ?auto_114480 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114483 ?auto_114479 ) ( ON-TABLE ?auto_114477 ) ( ON ?auto_114478 ?auto_114477 ) ( ON ?auto_114479 ?auto_114478 ) ( not ( = ?auto_114477 ?auto_114478 ) ) ( not ( = ?auto_114477 ?auto_114479 ) ) ( not ( = ?auto_114477 ?auto_114483 ) ) ( not ( = ?auto_114478 ?auto_114479 ) ) ( not ( = ?auto_114478 ?auto_114483 ) ) ( not ( = ?auto_114479 ?auto_114483 ) ) ( not ( = ?auto_114477 ?auto_114482 ) ) ( not ( = ?auto_114477 ?auto_114481 ) ) ( not ( = ?auto_114478 ?auto_114482 ) ) ( not ( = ?auto_114478 ?auto_114481 ) ) ( not ( = ?auto_114479 ?auto_114482 ) ) ( not ( = ?auto_114479 ?auto_114481 ) ) ( not ( = ?auto_114483 ?auto_114482 ) ) ( not ( = ?auto_114483 ?auto_114481 ) ) ( not ( = ?auto_114482 ?auto_114481 ) ) ( ON ?auto_114482 ?auto_114483 ) ( not ( = ?auto_114480 ?auto_114481 ) ) ( not ( = ?auto_114477 ?auto_114480 ) ) ( not ( = ?auto_114478 ?auto_114480 ) ) ( not ( = ?auto_114479 ?auto_114480 ) ) ( not ( = ?auto_114483 ?auto_114480 ) ) ( not ( = ?auto_114482 ?auto_114480 ) ) ( ON ?auto_114481 ?auto_114482 ) ( HOLDING ?auto_114480 ) ( CLEAR ?auto_114481 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_114477 ?auto_114478 ?auto_114479 ?auto_114483 ?auto_114482 ?auto_114481 ?auto_114480 )
      ( MAKE-3PILE ?auto_114477 ?auto_114478 ?auto_114479 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_114484 - BLOCK
      ?auto_114485 - BLOCK
      ?auto_114486 - BLOCK
    )
    :vars
    (
      ?auto_114490 - BLOCK
      ?auto_114487 - BLOCK
      ?auto_114488 - BLOCK
      ?auto_114489 - BLOCK
      ?auto_114491 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114490 ?auto_114486 ) ( ON-TABLE ?auto_114484 ) ( ON ?auto_114485 ?auto_114484 ) ( ON ?auto_114486 ?auto_114485 ) ( not ( = ?auto_114484 ?auto_114485 ) ) ( not ( = ?auto_114484 ?auto_114486 ) ) ( not ( = ?auto_114484 ?auto_114490 ) ) ( not ( = ?auto_114485 ?auto_114486 ) ) ( not ( = ?auto_114485 ?auto_114490 ) ) ( not ( = ?auto_114486 ?auto_114490 ) ) ( not ( = ?auto_114484 ?auto_114487 ) ) ( not ( = ?auto_114484 ?auto_114488 ) ) ( not ( = ?auto_114485 ?auto_114487 ) ) ( not ( = ?auto_114485 ?auto_114488 ) ) ( not ( = ?auto_114486 ?auto_114487 ) ) ( not ( = ?auto_114486 ?auto_114488 ) ) ( not ( = ?auto_114490 ?auto_114487 ) ) ( not ( = ?auto_114490 ?auto_114488 ) ) ( not ( = ?auto_114487 ?auto_114488 ) ) ( ON ?auto_114487 ?auto_114490 ) ( not ( = ?auto_114489 ?auto_114488 ) ) ( not ( = ?auto_114484 ?auto_114489 ) ) ( not ( = ?auto_114485 ?auto_114489 ) ) ( not ( = ?auto_114486 ?auto_114489 ) ) ( not ( = ?auto_114490 ?auto_114489 ) ) ( not ( = ?auto_114487 ?auto_114489 ) ) ( ON ?auto_114488 ?auto_114487 ) ( CLEAR ?auto_114488 ) ( ON ?auto_114489 ?auto_114491 ) ( CLEAR ?auto_114489 ) ( HAND-EMPTY ) ( not ( = ?auto_114484 ?auto_114491 ) ) ( not ( = ?auto_114485 ?auto_114491 ) ) ( not ( = ?auto_114486 ?auto_114491 ) ) ( not ( = ?auto_114490 ?auto_114491 ) ) ( not ( = ?auto_114487 ?auto_114491 ) ) ( not ( = ?auto_114488 ?auto_114491 ) ) ( not ( = ?auto_114489 ?auto_114491 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_114489 ?auto_114491 )
      ( MAKE-3PILE ?auto_114484 ?auto_114485 ?auto_114486 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_114492 - BLOCK
      ?auto_114493 - BLOCK
      ?auto_114494 - BLOCK
    )
    :vars
    (
      ?auto_114499 - BLOCK
      ?auto_114498 - BLOCK
      ?auto_114495 - BLOCK
      ?auto_114497 - BLOCK
      ?auto_114496 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114499 ?auto_114494 ) ( ON-TABLE ?auto_114492 ) ( ON ?auto_114493 ?auto_114492 ) ( ON ?auto_114494 ?auto_114493 ) ( not ( = ?auto_114492 ?auto_114493 ) ) ( not ( = ?auto_114492 ?auto_114494 ) ) ( not ( = ?auto_114492 ?auto_114499 ) ) ( not ( = ?auto_114493 ?auto_114494 ) ) ( not ( = ?auto_114493 ?auto_114499 ) ) ( not ( = ?auto_114494 ?auto_114499 ) ) ( not ( = ?auto_114492 ?auto_114498 ) ) ( not ( = ?auto_114492 ?auto_114495 ) ) ( not ( = ?auto_114493 ?auto_114498 ) ) ( not ( = ?auto_114493 ?auto_114495 ) ) ( not ( = ?auto_114494 ?auto_114498 ) ) ( not ( = ?auto_114494 ?auto_114495 ) ) ( not ( = ?auto_114499 ?auto_114498 ) ) ( not ( = ?auto_114499 ?auto_114495 ) ) ( not ( = ?auto_114498 ?auto_114495 ) ) ( ON ?auto_114498 ?auto_114499 ) ( not ( = ?auto_114497 ?auto_114495 ) ) ( not ( = ?auto_114492 ?auto_114497 ) ) ( not ( = ?auto_114493 ?auto_114497 ) ) ( not ( = ?auto_114494 ?auto_114497 ) ) ( not ( = ?auto_114499 ?auto_114497 ) ) ( not ( = ?auto_114498 ?auto_114497 ) ) ( ON ?auto_114497 ?auto_114496 ) ( CLEAR ?auto_114497 ) ( not ( = ?auto_114492 ?auto_114496 ) ) ( not ( = ?auto_114493 ?auto_114496 ) ) ( not ( = ?auto_114494 ?auto_114496 ) ) ( not ( = ?auto_114499 ?auto_114496 ) ) ( not ( = ?auto_114498 ?auto_114496 ) ) ( not ( = ?auto_114495 ?auto_114496 ) ) ( not ( = ?auto_114497 ?auto_114496 ) ) ( HOLDING ?auto_114495 ) ( CLEAR ?auto_114498 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_114492 ?auto_114493 ?auto_114494 ?auto_114499 ?auto_114498 ?auto_114495 )
      ( MAKE-3PILE ?auto_114492 ?auto_114493 ?auto_114494 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_114500 - BLOCK
      ?auto_114501 - BLOCK
      ?auto_114502 - BLOCK
    )
    :vars
    (
      ?auto_114507 - BLOCK
      ?auto_114504 - BLOCK
      ?auto_114505 - BLOCK
      ?auto_114506 - BLOCK
      ?auto_114503 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114507 ?auto_114502 ) ( ON-TABLE ?auto_114500 ) ( ON ?auto_114501 ?auto_114500 ) ( ON ?auto_114502 ?auto_114501 ) ( not ( = ?auto_114500 ?auto_114501 ) ) ( not ( = ?auto_114500 ?auto_114502 ) ) ( not ( = ?auto_114500 ?auto_114507 ) ) ( not ( = ?auto_114501 ?auto_114502 ) ) ( not ( = ?auto_114501 ?auto_114507 ) ) ( not ( = ?auto_114502 ?auto_114507 ) ) ( not ( = ?auto_114500 ?auto_114504 ) ) ( not ( = ?auto_114500 ?auto_114505 ) ) ( not ( = ?auto_114501 ?auto_114504 ) ) ( not ( = ?auto_114501 ?auto_114505 ) ) ( not ( = ?auto_114502 ?auto_114504 ) ) ( not ( = ?auto_114502 ?auto_114505 ) ) ( not ( = ?auto_114507 ?auto_114504 ) ) ( not ( = ?auto_114507 ?auto_114505 ) ) ( not ( = ?auto_114504 ?auto_114505 ) ) ( ON ?auto_114504 ?auto_114507 ) ( not ( = ?auto_114506 ?auto_114505 ) ) ( not ( = ?auto_114500 ?auto_114506 ) ) ( not ( = ?auto_114501 ?auto_114506 ) ) ( not ( = ?auto_114502 ?auto_114506 ) ) ( not ( = ?auto_114507 ?auto_114506 ) ) ( not ( = ?auto_114504 ?auto_114506 ) ) ( ON ?auto_114506 ?auto_114503 ) ( not ( = ?auto_114500 ?auto_114503 ) ) ( not ( = ?auto_114501 ?auto_114503 ) ) ( not ( = ?auto_114502 ?auto_114503 ) ) ( not ( = ?auto_114507 ?auto_114503 ) ) ( not ( = ?auto_114504 ?auto_114503 ) ) ( not ( = ?auto_114505 ?auto_114503 ) ) ( not ( = ?auto_114506 ?auto_114503 ) ) ( CLEAR ?auto_114504 ) ( ON ?auto_114505 ?auto_114506 ) ( CLEAR ?auto_114505 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_114503 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_114503 ?auto_114506 )
      ( MAKE-3PILE ?auto_114500 ?auto_114501 ?auto_114502 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_114508 - BLOCK
      ?auto_114509 - BLOCK
      ?auto_114510 - BLOCK
    )
    :vars
    (
      ?auto_114513 - BLOCK
      ?auto_114512 - BLOCK
      ?auto_114511 - BLOCK
      ?auto_114515 - BLOCK
      ?auto_114514 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114513 ?auto_114510 ) ( ON-TABLE ?auto_114508 ) ( ON ?auto_114509 ?auto_114508 ) ( ON ?auto_114510 ?auto_114509 ) ( not ( = ?auto_114508 ?auto_114509 ) ) ( not ( = ?auto_114508 ?auto_114510 ) ) ( not ( = ?auto_114508 ?auto_114513 ) ) ( not ( = ?auto_114509 ?auto_114510 ) ) ( not ( = ?auto_114509 ?auto_114513 ) ) ( not ( = ?auto_114510 ?auto_114513 ) ) ( not ( = ?auto_114508 ?auto_114512 ) ) ( not ( = ?auto_114508 ?auto_114511 ) ) ( not ( = ?auto_114509 ?auto_114512 ) ) ( not ( = ?auto_114509 ?auto_114511 ) ) ( not ( = ?auto_114510 ?auto_114512 ) ) ( not ( = ?auto_114510 ?auto_114511 ) ) ( not ( = ?auto_114513 ?auto_114512 ) ) ( not ( = ?auto_114513 ?auto_114511 ) ) ( not ( = ?auto_114512 ?auto_114511 ) ) ( not ( = ?auto_114515 ?auto_114511 ) ) ( not ( = ?auto_114508 ?auto_114515 ) ) ( not ( = ?auto_114509 ?auto_114515 ) ) ( not ( = ?auto_114510 ?auto_114515 ) ) ( not ( = ?auto_114513 ?auto_114515 ) ) ( not ( = ?auto_114512 ?auto_114515 ) ) ( ON ?auto_114515 ?auto_114514 ) ( not ( = ?auto_114508 ?auto_114514 ) ) ( not ( = ?auto_114509 ?auto_114514 ) ) ( not ( = ?auto_114510 ?auto_114514 ) ) ( not ( = ?auto_114513 ?auto_114514 ) ) ( not ( = ?auto_114512 ?auto_114514 ) ) ( not ( = ?auto_114511 ?auto_114514 ) ) ( not ( = ?auto_114515 ?auto_114514 ) ) ( ON ?auto_114511 ?auto_114515 ) ( CLEAR ?auto_114511 ) ( ON-TABLE ?auto_114514 ) ( HOLDING ?auto_114512 ) ( CLEAR ?auto_114513 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_114508 ?auto_114509 ?auto_114510 ?auto_114513 ?auto_114512 )
      ( MAKE-3PILE ?auto_114508 ?auto_114509 ?auto_114510 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_114516 - BLOCK
      ?auto_114517 - BLOCK
      ?auto_114518 - BLOCK
    )
    :vars
    (
      ?auto_114519 - BLOCK
      ?auto_114523 - BLOCK
      ?auto_114520 - BLOCK
      ?auto_114522 - BLOCK
      ?auto_114521 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114519 ?auto_114518 ) ( ON-TABLE ?auto_114516 ) ( ON ?auto_114517 ?auto_114516 ) ( ON ?auto_114518 ?auto_114517 ) ( not ( = ?auto_114516 ?auto_114517 ) ) ( not ( = ?auto_114516 ?auto_114518 ) ) ( not ( = ?auto_114516 ?auto_114519 ) ) ( not ( = ?auto_114517 ?auto_114518 ) ) ( not ( = ?auto_114517 ?auto_114519 ) ) ( not ( = ?auto_114518 ?auto_114519 ) ) ( not ( = ?auto_114516 ?auto_114523 ) ) ( not ( = ?auto_114516 ?auto_114520 ) ) ( not ( = ?auto_114517 ?auto_114523 ) ) ( not ( = ?auto_114517 ?auto_114520 ) ) ( not ( = ?auto_114518 ?auto_114523 ) ) ( not ( = ?auto_114518 ?auto_114520 ) ) ( not ( = ?auto_114519 ?auto_114523 ) ) ( not ( = ?auto_114519 ?auto_114520 ) ) ( not ( = ?auto_114523 ?auto_114520 ) ) ( not ( = ?auto_114522 ?auto_114520 ) ) ( not ( = ?auto_114516 ?auto_114522 ) ) ( not ( = ?auto_114517 ?auto_114522 ) ) ( not ( = ?auto_114518 ?auto_114522 ) ) ( not ( = ?auto_114519 ?auto_114522 ) ) ( not ( = ?auto_114523 ?auto_114522 ) ) ( ON ?auto_114522 ?auto_114521 ) ( not ( = ?auto_114516 ?auto_114521 ) ) ( not ( = ?auto_114517 ?auto_114521 ) ) ( not ( = ?auto_114518 ?auto_114521 ) ) ( not ( = ?auto_114519 ?auto_114521 ) ) ( not ( = ?auto_114523 ?auto_114521 ) ) ( not ( = ?auto_114520 ?auto_114521 ) ) ( not ( = ?auto_114522 ?auto_114521 ) ) ( ON ?auto_114520 ?auto_114522 ) ( ON-TABLE ?auto_114521 ) ( CLEAR ?auto_114519 ) ( ON ?auto_114523 ?auto_114520 ) ( CLEAR ?auto_114523 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_114521 ?auto_114522 ?auto_114520 )
      ( MAKE-3PILE ?auto_114516 ?auto_114517 ?auto_114518 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_114540 - BLOCK
      ?auto_114541 - BLOCK
      ?auto_114542 - BLOCK
    )
    :vars
    (
      ?auto_114544 - BLOCK
      ?auto_114545 - BLOCK
      ?auto_114546 - BLOCK
      ?auto_114547 - BLOCK
      ?auto_114543 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_114540 ) ( ON ?auto_114541 ?auto_114540 ) ( not ( = ?auto_114540 ?auto_114541 ) ) ( not ( = ?auto_114540 ?auto_114542 ) ) ( not ( = ?auto_114540 ?auto_114544 ) ) ( not ( = ?auto_114541 ?auto_114542 ) ) ( not ( = ?auto_114541 ?auto_114544 ) ) ( not ( = ?auto_114542 ?auto_114544 ) ) ( not ( = ?auto_114540 ?auto_114545 ) ) ( not ( = ?auto_114540 ?auto_114546 ) ) ( not ( = ?auto_114541 ?auto_114545 ) ) ( not ( = ?auto_114541 ?auto_114546 ) ) ( not ( = ?auto_114542 ?auto_114545 ) ) ( not ( = ?auto_114542 ?auto_114546 ) ) ( not ( = ?auto_114544 ?auto_114545 ) ) ( not ( = ?auto_114544 ?auto_114546 ) ) ( not ( = ?auto_114545 ?auto_114546 ) ) ( not ( = ?auto_114547 ?auto_114546 ) ) ( not ( = ?auto_114540 ?auto_114547 ) ) ( not ( = ?auto_114541 ?auto_114547 ) ) ( not ( = ?auto_114542 ?auto_114547 ) ) ( not ( = ?auto_114544 ?auto_114547 ) ) ( not ( = ?auto_114545 ?auto_114547 ) ) ( ON ?auto_114547 ?auto_114543 ) ( not ( = ?auto_114540 ?auto_114543 ) ) ( not ( = ?auto_114541 ?auto_114543 ) ) ( not ( = ?auto_114542 ?auto_114543 ) ) ( not ( = ?auto_114544 ?auto_114543 ) ) ( not ( = ?auto_114545 ?auto_114543 ) ) ( not ( = ?auto_114546 ?auto_114543 ) ) ( not ( = ?auto_114547 ?auto_114543 ) ) ( ON ?auto_114546 ?auto_114547 ) ( ON-TABLE ?auto_114543 ) ( ON ?auto_114545 ?auto_114546 ) ( ON ?auto_114544 ?auto_114545 ) ( CLEAR ?auto_114544 ) ( HOLDING ?auto_114542 ) ( CLEAR ?auto_114541 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_114540 ?auto_114541 ?auto_114542 ?auto_114544 )
      ( MAKE-3PILE ?auto_114540 ?auto_114541 ?auto_114542 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_114548 - BLOCK
      ?auto_114549 - BLOCK
      ?auto_114550 - BLOCK
    )
    :vars
    (
      ?auto_114554 - BLOCK
      ?auto_114552 - BLOCK
      ?auto_114551 - BLOCK
      ?auto_114553 - BLOCK
      ?auto_114555 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_114548 ) ( ON ?auto_114549 ?auto_114548 ) ( not ( = ?auto_114548 ?auto_114549 ) ) ( not ( = ?auto_114548 ?auto_114550 ) ) ( not ( = ?auto_114548 ?auto_114554 ) ) ( not ( = ?auto_114549 ?auto_114550 ) ) ( not ( = ?auto_114549 ?auto_114554 ) ) ( not ( = ?auto_114550 ?auto_114554 ) ) ( not ( = ?auto_114548 ?auto_114552 ) ) ( not ( = ?auto_114548 ?auto_114551 ) ) ( not ( = ?auto_114549 ?auto_114552 ) ) ( not ( = ?auto_114549 ?auto_114551 ) ) ( not ( = ?auto_114550 ?auto_114552 ) ) ( not ( = ?auto_114550 ?auto_114551 ) ) ( not ( = ?auto_114554 ?auto_114552 ) ) ( not ( = ?auto_114554 ?auto_114551 ) ) ( not ( = ?auto_114552 ?auto_114551 ) ) ( not ( = ?auto_114553 ?auto_114551 ) ) ( not ( = ?auto_114548 ?auto_114553 ) ) ( not ( = ?auto_114549 ?auto_114553 ) ) ( not ( = ?auto_114550 ?auto_114553 ) ) ( not ( = ?auto_114554 ?auto_114553 ) ) ( not ( = ?auto_114552 ?auto_114553 ) ) ( ON ?auto_114553 ?auto_114555 ) ( not ( = ?auto_114548 ?auto_114555 ) ) ( not ( = ?auto_114549 ?auto_114555 ) ) ( not ( = ?auto_114550 ?auto_114555 ) ) ( not ( = ?auto_114554 ?auto_114555 ) ) ( not ( = ?auto_114552 ?auto_114555 ) ) ( not ( = ?auto_114551 ?auto_114555 ) ) ( not ( = ?auto_114553 ?auto_114555 ) ) ( ON ?auto_114551 ?auto_114553 ) ( ON-TABLE ?auto_114555 ) ( ON ?auto_114552 ?auto_114551 ) ( ON ?auto_114554 ?auto_114552 ) ( CLEAR ?auto_114549 ) ( ON ?auto_114550 ?auto_114554 ) ( CLEAR ?auto_114550 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_114555 ?auto_114553 ?auto_114551 ?auto_114552 ?auto_114554 )
      ( MAKE-3PILE ?auto_114548 ?auto_114549 ?auto_114550 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_114556 - BLOCK
      ?auto_114557 - BLOCK
      ?auto_114558 - BLOCK
    )
    :vars
    (
      ?auto_114562 - BLOCK
      ?auto_114561 - BLOCK
      ?auto_114563 - BLOCK
      ?auto_114559 - BLOCK
      ?auto_114560 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_114556 ) ( not ( = ?auto_114556 ?auto_114557 ) ) ( not ( = ?auto_114556 ?auto_114558 ) ) ( not ( = ?auto_114556 ?auto_114562 ) ) ( not ( = ?auto_114557 ?auto_114558 ) ) ( not ( = ?auto_114557 ?auto_114562 ) ) ( not ( = ?auto_114558 ?auto_114562 ) ) ( not ( = ?auto_114556 ?auto_114561 ) ) ( not ( = ?auto_114556 ?auto_114563 ) ) ( not ( = ?auto_114557 ?auto_114561 ) ) ( not ( = ?auto_114557 ?auto_114563 ) ) ( not ( = ?auto_114558 ?auto_114561 ) ) ( not ( = ?auto_114558 ?auto_114563 ) ) ( not ( = ?auto_114562 ?auto_114561 ) ) ( not ( = ?auto_114562 ?auto_114563 ) ) ( not ( = ?auto_114561 ?auto_114563 ) ) ( not ( = ?auto_114559 ?auto_114563 ) ) ( not ( = ?auto_114556 ?auto_114559 ) ) ( not ( = ?auto_114557 ?auto_114559 ) ) ( not ( = ?auto_114558 ?auto_114559 ) ) ( not ( = ?auto_114562 ?auto_114559 ) ) ( not ( = ?auto_114561 ?auto_114559 ) ) ( ON ?auto_114559 ?auto_114560 ) ( not ( = ?auto_114556 ?auto_114560 ) ) ( not ( = ?auto_114557 ?auto_114560 ) ) ( not ( = ?auto_114558 ?auto_114560 ) ) ( not ( = ?auto_114562 ?auto_114560 ) ) ( not ( = ?auto_114561 ?auto_114560 ) ) ( not ( = ?auto_114563 ?auto_114560 ) ) ( not ( = ?auto_114559 ?auto_114560 ) ) ( ON ?auto_114563 ?auto_114559 ) ( ON-TABLE ?auto_114560 ) ( ON ?auto_114561 ?auto_114563 ) ( ON ?auto_114562 ?auto_114561 ) ( ON ?auto_114558 ?auto_114562 ) ( CLEAR ?auto_114558 ) ( HOLDING ?auto_114557 ) ( CLEAR ?auto_114556 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_114556 ?auto_114557 )
      ( MAKE-3PILE ?auto_114556 ?auto_114557 ?auto_114558 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_114564 - BLOCK
      ?auto_114565 - BLOCK
      ?auto_114566 - BLOCK
    )
    :vars
    (
      ?auto_114569 - BLOCK
      ?auto_114571 - BLOCK
      ?auto_114570 - BLOCK
      ?auto_114567 - BLOCK
      ?auto_114568 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_114564 ) ( not ( = ?auto_114564 ?auto_114565 ) ) ( not ( = ?auto_114564 ?auto_114566 ) ) ( not ( = ?auto_114564 ?auto_114569 ) ) ( not ( = ?auto_114565 ?auto_114566 ) ) ( not ( = ?auto_114565 ?auto_114569 ) ) ( not ( = ?auto_114566 ?auto_114569 ) ) ( not ( = ?auto_114564 ?auto_114571 ) ) ( not ( = ?auto_114564 ?auto_114570 ) ) ( not ( = ?auto_114565 ?auto_114571 ) ) ( not ( = ?auto_114565 ?auto_114570 ) ) ( not ( = ?auto_114566 ?auto_114571 ) ) ( not ( = ?auto_114566 ?auto_114570 ) ) ( not ( = ?auto_114569 ?auto_114571 ) ) ( not ( = ?auto_114569 ?auto_114570 ) ) ( not ( = ?auto_114571 ?auto_114570 ) ) ( not ( = ?auto_114567 ?auto_114570 ) ) ( not ( = ?auto_114564 ?auto_114567 ) ) ( not ( = ?auto_114565 ?auto_114567 ) ) ( not ( = ?auto_114566 ?auto_114567 ) ) ( not ( = ?auto_114569 ?auto_114567 ) ) ( not ( = ?auto_114571 ?auto_114567 ) ) ( ON ?auto_114567 ?auto_114568 ) ( not ( = ?auto_114564 ?auto_114568 ) ) ( not ( = ?auto_114565 ?auto_114568 ) ) ( not ( = ?auto_114566 ?auto_114568 ) ) ( not ( = ?auto_114569 ?auto_114568 ) ) ( not ( = ?auto_114571 ?auto_114568 ) ) ( not ( = ?auto_114570 ?auto_114568 ) ) ( not ( = ?auto_114567 ?auto_114568 ) ) ( ON ?auto_114570 ?auto_114567 ) ( ON-TABLE ?auto_114568 ) ( ON ?auto_114571 ?auto_114570 ) ( ON ?auto_114569 ?auto_114571 ) ( ON ?auto_114566 ?auto_114569 ) ( CLEAR ?auto_114564 ) ( ON ?auto_114565 ?auto_114566 ) ( CLEAR ?auto_114565 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_114568 ?auto_114567 ?auto_114570 ?auto_114571 ?auto_114569 ?auto_114566 )
      ( MAKE-3PILE ?auto_114564 ?auto_114565 ?auto_114566 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_114572 - BLOCK
      ?auto_114573 - BLOCK
      ?auto_114574 - BLOCK
    )
    :vars
    (
      ?auto_114576 - BLOCK
      ?auto_114578 - BLOCK
      ?auto_114575 - BLOCK
      ?auto_114577 - BLOCK
      ?auto_114579 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114572 ?auto_114573 ) ) ( not ( = ?auto_114572 ?auto_114574 ) ) ( not ( = ?auto_114572 ?auto_114576 ) ) ( not ( = ?auto_114573 ?auto_114574 ) ) ( not ( = ?auto_114573 ?auto_114576 ) ) ( not ( = ?auto_114574 ?auto_114576 ) ) ( not ( = ?auto_114572 ?auto_114578 ) ) ( not ( = ?auto_114572 ?auto_114575 ) ) ( not ( = ?auto_114573 ?auto_114578 ) ) ( not ( = ?auto_114573 ?auto_114575 ) ) ( not ( = ?auto_114574 ?auto_114578 ) ) ( not ( = ?auto_114574 ?auto_114575 ) ) ( not ( = ?auto_114576 ?auto_114578 ) ) ( not ( = ?auto_114576 ?auto_114575 ) ) ( not ( = ?auto_114578 ?auto_114575 ) ) ( not ( = ?auto_114577 ?auto_114575 ) ) ( not ( = ?auto_114572 ?auto_114577 ) ) ( not ( = ?auto_114573 ?auto_114577 ) ) ( not ( = ?auto_114574 ?auto_114577 ) ) ( not ( = ?auto_114576 ?auto_114577 ) ) ( not ( = ?auto_114578 ?auto_114577 ) ) ( ON ?auto_114577 ?auto_114579 ) ( not ( = ?auto_114572 ?auto_114579 ) ) ( not ( = ?auto_114573 ?auto_114579 ) ) ( not ( = ?auto_114574 ?auto_114579 ) ) ( not ( = ?auto_114576 ?auto_114579 ) ) ( not ( = ?auto_114578 ?auto_114579 ) ) ( not ( = ?auto_114575 ?auto_114579 ) ) ( not ( = ?auto_114577 ?auto_114579 ) ) ( ON ?auto_114575 ?auto_114577 ) ( ON-TABLE ?auto_114579 ) ( ON ?auto_114578 ?auto_114575 ) ( ON ?auto_114576 ?auto_114578 ) ( ON ?auto_114574 ?auto_114576 ) ( ON ?auto_114573 ?auto_114574 ) ( CLEAR ?auto_114573 ) ( HOLDING ?auto_114572 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_114572 )
      ( MAKE-3PILE ?auto_114572 ?auto_114573 ?auto_114574 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_114580 - BLOCK
      ?auto_114581 - BLOCK
      ?auto_114582 - BLOCK
    )
    :vars
    (
      ?auto_114585 - BLOCK
      ?auto_114584 - BLOCK
      ?auto_114583 - BLOCK
      ?auto_114587 - BLOCK
      ?auto_114586 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114580 ?auto_114581 ) ) ( not ( = ?auto_114580 ?auto_114582 ) ) ( not ( = ?auto_114580 ?auto_114585 ) ) ( not ( = ?auto_114581 ?auto_114582 ) ) ( not ( = ?auto_114581 ?auto_114585 ) ) ( not ( = ?auto_114582 ?auto_114585 ) ) ( not ( = ?auto_114580 ?auto_114584 ) ) ( not ( = ?auto_114580 ?auto_114583 ) ) ( not ( = ?auto_114581 ?auto_114584 ) ) ( not ( = ?auto_114581 ?auto_114583 ) ) ( not ( = ?auto_114582 ?auto_114584 ) ) ( not ( = ?auto_114582 ?auto_114583 ) ) ( not ( = ?auto_114585 ?auto_114584 ) ) ( not ( = ?auto_114585 ?auto_114583 ) ) ( not ( = ?auto_114584 ?auto_114583 ) ) ( not ( = ?auto_114587 ?auto_114583 ) ) ( not ( = ?auto_114580 ?auto_114587 ) ) ( not ( = ?auto_114581 ?auto_114587 ) ) ( not ( = ?auto_114582 ?auto_114587 ) ) ( not ( = ?auto_114585 ?auto_114587 ) ) ( not ( = ?auto_114584 ?auto_114587 ) ) ( ON ?auto_114587 ?auto_114586 ) ( not ( = ?auto_114580 ?auto_114586 ) ) ( not ( = ?auto_114581 ?auto_114586 ) ) ( not ( = ?auto_114582 ?auto_114586 ) ) ( not ( = ?auto_114585 ?auto_114586 ) ) ( not ( = ?auto_114584 ?auto_114586 ) ) ( not ( = ?auto_114583 ?auto_114586 ) ) ( not ( = ?auto_114587 ?auto_114586 ) ) ( ON ?auto_114583 ?auto_114587 ) ( ON-TABLE ?auto_114586 ) ( ON ?auto_114584 ?auto_114583 ) ( ON ?auto_114585 ?auto_114584 ) ( ON ?auto_114582 ?auto_114585 ) ( ON ?auto_114581 ?auto_114582 ) ( ON ?auto_114580 ?auto_114581 ) ( CLEAR ?auto_114580 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_114586 ?auto_114587 ?auto_114583 ?auto_114584 ?auto_114585 ?auto_114582 ?auto_114581 )
      ( MAKE-3PILE ?auto_114580 ?auto_114581 ?auto_114582 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_114592 - BLOCK
      ?auto_114593 - BLOCK
      ?auto_114594 - BLOCK
      ?auto_114595 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_114595 ) ( CLEAR ?auto_114594 ) ( ON-TABLE ?auto_114592 ) ( ON ?auto_114593 ?auto_114592 ) ( ON ?auto_114594 ?auto_114593 ) ( not ( = ?auto_114592 ?auto_114593 ) ) ( not ( = ?auto_114592 ?auto_114594 ) ) ( not ( = ?auto_114592 ?auto_114595 ) ) ( not ( = ?auto_114593 ?auto_114594 ) ) ( not ( = ?auto_114593 ?auto_114595 ) ) ( not ( = ?auto_114594 ?auto_114595 ) ) )
    :subtasks
    ( ( !STACK ?auto_114595 ?auto_114594 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_114596 - BLOCK
      ?auto_114597 - BLOCK
      ?auto_114598 - BLOCK
      ?auto_114599 - BLOCK
    )
    :vars
    (
      ?auto_114600 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_114598 ) ( ON-TABLE ?auto_114596 ) ( ON ?auto_114597 ?auto_114596 ) ( ON ?auto_114598 ?auto_114597 ) ( not ( = ?auto_114596 ?auto_114597 ) ) ( not ( = ?auto_114596 ?auto_114598 ) ) ( not ( = ?auto_114596 ?auto_114599 ) ) ( not ( = ?auto_114597 ?auto_114598 ) ) ( not ( = ?auto_114597 ?auto_114599 ) ) ( not ( = ?auto_114598 ?auto_114599 ) ) ( ON ?auto_114599 ?auto_114600 ) ( CLEAR ?auto_114599 ) ( HAND-EMPTY ) ( not ( = ?auto_114596 ?auto_114600 ) ) ( not ( = ?auto_114597 ?auto_114600 ) ) ( not ( = ?auto_114598 ?auto_114600 ) ) ( not ( = ?auto_114599 ?auto_114600 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_114599 ?auto_114600 )
      ( MAKE-4PILE ?auto_114596 ?auto_114597 ?auto_114598 ?auto_114599 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_114601 - BLOCK
      ?auto_114602 - BLOCK
      ?auto_114603 - BLOCK
      ?auto_114604 - BLOCK
    )
    :vars
    (
      ?auto_114605 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_114601 ) ( ON ?auto_114602 ?auto_114601 ) ( not ( = ?auto_114601 ?auto_114602 ) ) ( not ( = ?auto_114601 ?auto_114603 ) ) ( not ( = ?auto_114601 ?auto_114604 ) ) ( not ( = ?auto_114602 ?auto_114603 ) ) ( not ( = ?auto_114602 ?auto_114604 ) ) ( not ( = ?auto_114603 ?auto_114604 ) ) ( ON ?auto_114604 ?auto_114605 ) ( CLEAR ?auto_114604 ) ( not ( = ?auto_114601 ?auto_114605 ) ) ( not ( = ?auto_114602 ?auto_114605 ) ) ( not ( = ?auto_114603 ?auto_114605 ) ) ( not ( = ?auto_114604 ?auto_114605 ) ) ( HOLDING ?auto_114603 ) ( CLEAR ?auto_114602 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_114601 ?auto_114602 ?auto_114603 )
      ( MAKE-4PILE ?auto_114601 ?auto_114602 ?auto_114603 ?auto_114604 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_114606 - BLOCK
      ?auto_114607 - BLOCK
      ?auto_114608 - BLOCK
      ?auto_114609 - BLOCK
    )
    :vars
    (
      ?auto_114610 - BLOCK
      ?auto_114612 - BLOCK
      ?auto_114611 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_114606 ) ( ON ?auto_114607 ?auto_114606 ) ( not ( = ?auto_114606 ?auto_114607 ) ) ( not ( = ?auto_114606 ?auto_114608 ) ) ( not ( = ?auto_114606 ?auto_114609 ) ) ( not ( = ?auto_114607 ?auto_114608 ) ) ( not ( = ?auto_114607 ?auto_114609 ) ) ( not ( = ?auto_114608 ?auto_114609 ) ) ( ON ?auto_114609 ?auto_114610 ) ( not ( = ?auto_114606 ?auto_114610 ) ) ( not ( = ?auto_114607 ?auto_114610 ) ) ( not ( = ?auto_114608 ?auto_114610 ) ) ( not ( = ?auto_114609 ?auto_114610 ) ) ( CLEAR ?auto_114607 ) ( ON ?auto_114608 ?auto_114609 ) ( CLEAR ?auto_114608 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_114612 ) ( ON ?auto_114611 ?auto_114612 ) ( ON ?auto_114610 ?auto_114611 ) ( not ( = ?auto_114612 ?auto_114611 ) ) ( not ( = ?auto_114612 ?auto_114610 ) ) ( not ( = ?auto_114612 ?auto_114609 ) ) ( not ( = ?auto_114612 ?auto_114608 ) ) ( not ( = ?auto_114611 ?auto_114610 ) ) ( not ( = ?auto_114611 ?auto_114609 ) ) ( not ( = ?auto_114611 ?auto_114608 ) ) ( not ( = ?auto_114606 ?auto_114612 ) ) ( not ( = ?auto_114606 ?auto_114611 ) ) ( not ( = ?auto_114607 ?auto_114612 ) ) ( not ( = ?auto_114607 ?auto_114611 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_114612 ?auto_114611 ?auto_114610 ?auto_114609 )
      ( MAKE-4PILE ?auto_114606 ?auto_114607 ?auto_114608 ?auto_114609 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_114613 - BLOCK
      ?auto_114614 - BLOCK
      ?auto_114615 - BLOCK
      ?auto_114616 - BLOCK
    )
    :vars
    (
      ?auto_114619 - BLOCK
      ?auto_114617 - BLOCK
      ?auto_114618 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_114613 ) ( not ( = ?auto_114613 ?auto_114614 ) ) ( not ( = ?auto_114613 ?auto_114615 ) ) ( not ( = ?auto_114613 ?auto_114616 ) ) ( not ( = ?auto_114614 ?auto_114615 ) ) ( not ( = ?auto_114614 ?auto_114616 ) ) ( not ( = ?auto_114615 ?auto_114616 ) ) ( ON ?auto_114616 ?auto_114619 ) ( not ( = ?auto_114613 ?auto_114619 ) ) ( not ( = ?auto_114614 ?auto_114619 ) ) ( not ( = ?auto_114615 ?auto_114619 ) ) ( not ( = ?auto_114616 ?auto_114619 ) ) ( ON ?auto_114615 ?auto_114616 ) ( CLEAR ?auto_114615 ) ( ON-TABLE ?auto_114617 ) ( ON ?auto_114618 ?auto_114617 ) ( ON ?auto_114619 ?auto_114618 ) ( not ( = ?auto_114617 ?auto_114618 ) ) ( not ( = ?auto_114617 ?auto_114619 ) ) ( not ( = ?auto_114617 ?auto_114616 ) ) ( not ( = ?auto_114617 ?auto_114615 ) ) ( not ( = ?auto_114618 ?auto_114619 ) ) ( not ( = ?auto_114618 ?auto_114616 ) ) ( not ( = ?auto_114618 ?auto_114615 ) ) ( not ( = ?auto_114613 ?auto_114617 ) ) ( not ( = ?auto_114613 ?auto_114618 ) ) ( not ( = ?auto_114614 ?auto_114617 ) ) ( not ( = ?auto_114614 ?auto_114618 ) ) ( HOLDING ?auto_114614 ) ( CLEAR ?auto_114613 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_114613 ?auto_114614 )
      ( MAKE-4PILE ?auto_114613 ?auto_114614 ?auto_114615 ?auto_114616 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_114620 - BLOCK
      ?auto_114621 - BLOCK
      ?auto_114622 - BLOCK
      ?auto_114623 - BLOCK
    )
    :vars
    (
      ?auto_114626 - BLOCK
      ?auto_114625 - BLOCK
      ?auto_114624 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_114620 ) ( not ( = ?auto_114620 ?auto_114621 ) ) ( not ( = ?auto_114620 ?auto_114622 ) ) ( not ( = ?auto_114620 ?auto_114623 ) ) ( not ( = ?auto_114621 ?auto_114622 ) ) ( not ( = ?auto_114621 ?auto_114623 ) ) ( not ( = ?auto_114622 ?auto_114623 ) ) ( ON ?auto_114623 ?auto_114626 ) ( not ( = ?auto_114620 ?auto_114626 ) ) ( not ( = ?auto_114621 ?auto_114626 ) ) ( not ( = ?auto_114622 ?auto_114626 ) ) ( not ( = ?auto_114623 ?auto_114626 ) ) ( ON ?auto_114622 ?auto_114623 ) ( ON-TABLE ?auto_114625 ) ( ON ?auto_114624 ?auto_114625 ) ( ON ?auto_114626 ?auto_114624 ) ( not ( = ?auto_114625 ?auto_114624 ) ) ( not ( = ?auto_114625 ?auto_114626 ) ) ( not ( = ?auto_114625 ?auto_114623 ) ) ( not ( = ?auto_114625 ?auto_114622 ) ) ( not ( = ?auto_114624 ?auto_114626 ) ) ( not ( = ?auto_114624 ?auto_114623 ) ) ( not ( = ?auto_114624 ?auto_114622 ) ) ( not ( = ?auto_114620 ?auto_114625 ) ) ( not ( = ?auto_114620 ?auto_114624 ) ) ( not ( = ?auto_114621 ?auto_114625 ) ) ( not ( = ?auto_114621 ?auto_114624 ) ) ( CLEAR ?auto_114620 ) ( ON ?auto_114621 ?auto_114622 ) ( CLEAR ?auto_114621 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_114625 ?auto_114624 ?auto_114626 ?auto_114623 ?auto_114622 )
      ( MAKE-4PILE ?auto_114620 ?auto_114621 ?auto_114622 ?auto_114623 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_114627 - BLOCK
      ?auto_114628 - BLOCK
      ?auto_114629 - BLOCK
      ?auto_114630 - BLOCK
    )
    :vars
    (
      ?auto_114631 - BLOCK
      ?auto_114633 - BLOCK
      ?auto_114632 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114627 ?auto_114628 ) ) ( not ( = ?auto_114627 ?auto_114629 ) ) ( not ( = ?auto_114627 ?auto_114630 ) ) ( not ( = ?auto_114628 ?auto_114629 ) ) ( not ( = ?auto_114628 ?auto_114630 ) ) ( not ( = ?auto_114629 ?auto_114630 ) ) ( ON ?auto_114630 ?auto_114631 ) ( not ( = ?auto_114627 ?auto_114631 ) ) ( not ( = ?auto_114628 ?auto_114631 ) ) ( not ( = ?auto_114629 ?auto_114631 ) ) ( not ( = ?auto_114630 ?auto_114631 ) ) ( ON ?auto_114629 ?auto_114630 ) ( ON-TABLE ?auto_114633 ) ( ON ?auto_114632 ?auto_114633 ) ( ON ?auto_114631 ?auto_114632 ) ( not ( = ?auto_114633 ?auto_114632 ) ) ( not ( = ?auto_114633 ?auto_114631 ) ) ( not ( = ?auto_114633 ?auto_114630 ) ) ( not ( = ?auto_114633 ?auto_114629 ) ) ( not ( = ?auto_114632 ?auto_114631 ) ) ( not ( = ?auto_114632 ?auto_114630 ) ) ( not ( = ?auto_114632 ?auto_114629 ) ) ( not ( = ?auto_114627 ?auto_114633 ) ) ( not ( = ?auto_114627 ?auto_114632 ) ) ( not ( = ?auto_114628 ?auto_114633 ) ) ( not ( = ?auto_114628 ?auto_114632 ) ) ( ON ?auto_114628 ?auto_114629 ) ( CLEAR ?auto_114628 ) ( HOLDING ?auto_114627 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_114627 )
      ( MAKE-4PILE ?auto_114627 ?auto_114628 ?auto_114629 ?auto_114630 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_114634 - BLOCK
      ?auto_114635 - BLOCK
      ?auto_114636 - BLOCK
      ?auto_114637 - BLOCK
    )
    :vars
    (
      ?auto_114640 - BLOCK
      ?auto_114639 - BLOCK
      ?auto_114638 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114634 ?auto_114635 ) ) ( not ( = ?auto_114634 ?auto_114636 ) ) ( not ( = ?auto_114634 ?auto_114637 ) ) ( not ( = ?auto_114635 ?auto_114636 ) ) ( not ( = ?auto_114635 ?auto_114637 ) ) ( not ( = ?auto_114636 ?auto_114637 ) ) ( ON ?auto_114637 ?auto_114640 ) ( not ( = ?auto_114634 ?auto_114640 ) ) ( not ( = ?auto_114635 ?auto_114640 ) ) ( not ( = ?auto_114636 ?auto_114640 ) ) ( not ( = ?auto_114637 ?auto_114640 ) ) ( ON ?auto_114636 ?auto_114637 ) ( ON-TABLE ?auto_114639 ) ( ON ?auto_114638 ?auto_114639 ) ( ON ?auto_114640 ?auto_114638 ) ( not ( = ?auto_114639 ?auto_114638 ) ) ( not ( = ?auto_114639 ?auto_114640 ) ) ( not ( = ?auto_114639 ?auto_114637 ) ) ( not ( = ?auto_114639 ?auto_114636 ) ) ( not ( = ?auto_114638 ?auto_114640 ) ) ( not ( = ?auto_114638 ?auto_114637 ) ) ( not ( = ?auto_114638 ?auto_114636 ) ) ( not ( = ?auto_114634 ?auto_114639 ) ) ( not ( = ?auto_114634 ?auto_114638 ) ) ( not ( = ?auto_114635 ?auto_114639 ) ) ( not ( = ?auto_114635 ?auto_114638 ) ) ( ON ?auto_114635 ?auto_114636 ) ( ON ?auto_114634 ?auto_114635 ) ( CLEAR ?auto_114634 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_114639 ?auto_114638 ?auto_114640 ?auto_114637 ?auto_114636 ?auto_114635 )
      ( MAKE-4PILE ?auto_114634 ?auto_114635 ?auto_114636 ?auto_114637 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_114641 - BLOCK
      ?auto_114642 - BLOCK
      ?auto_114643 - BLOCK
      ?auto_114644 - BLOCK
    )
    :vars
    (
      ?auto_114645 - BLOCK
      ?auto_114647 - BLOCK
      ?auto_114646 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114641 ?auto_114642 ) ) ( not ( = ?auto_114641 ?auto_114643 ) ) ( not ( = ?auto_114641 ?auto_114644 ) ) ( not ( = ?auto_114642 ?auto_114643 ) ) ( not ( = ?auto_114642 ?auto_114644 ) ) ( not ( = ?auto_114643 ?auto_114644 ) ) ( ON ?auto_114644 ?auto_114645 ) ( not ( = ?auto_114641 ?auto_114645 ) ) ( not ( = ?auto_114642 ?auto_114645 ) ) ( not ( = ?auto_114643 ?auto_114645 ) ) ( not ( = ?auto_114644 ?auto_114645 ) ) ( ON ?auto_114643 ?auto_114644 ) ( ON-TABLE ?auto_114647 ) ( ON ?auto_114646 ?auto_114647 ) ( ON ?auto_114645 ?auto_114646 ) ( not ( = ?auto_114647 ?auto_114646 ) ) ( not ( = ?auto_114647 ?auto_114645 ) ) ( not ( = ?auto_114647 ?auto_114644 ) ) ( not ( = ?auto_114647 ?auto_114643 ) ) ( not ( = ?auto_114646 ?auto_114645 ) ) ( not ( = ?auto_114646 ?auto_114644 ) ) ( not ( = ?auto_114646 ?auto_114643 ) ) ( not ( = ?auto_114641 ?auto_114647 ) ) ( not ( = ?auto_114641 ?auto_114646 ) ) ( not ( = ?auto_114642 ?auto_114647 ) ) ( not ( = ?auto_114642 ?auto_114646 ) ) ( ON ?auto_114642 ?auto_114643 ) ( HOLDING ?auto_114641 ) ( CLEAR ?auto_114642 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_114647 ?auto_114646 ?auto_114645 ?auto_114644 ?auto_114643 ?auto_114642 ?auto_114641 )
      ( MAKE-4PILE ?auto_114641 ?auto_114642 ?auto_114643 ?auto_114644 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_114648 - BLOCK
      ?auto_114649 - BLOCK
      ?auto_114650 - BLOCK
      ?auto_114651 - BLOCK
    )
    :vars
    (
      ?auto_114654 - BLOCK
      ?auto_114653 - BLOCK
      ?auto_114652 - BLOCK
      ?auto_114655 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114648 ?auto_114649 ) ) ( not ( = ?auto_114648 ?auto_114650 ) ) ( not ( = ?auto_114648 ?auto_114651 ) ) ( not ( = ?auto_114649 ?auto_114650 ) ) ( not ( = ?auto_114649 ?auto_114651 ) ) ( not ( = ?auto_114650 ?auto_114651 ) ) ( ON ?auto_114651 ?auto_114654 ) ( not ( = ?auto_114648 ?auto_114654 ) ) ( not ( = ?auto_114649 ?auto_114654 ) ) ( not ( = ?auto_114650 ?auto_114654 ) ) ( not ( = ?auto_114651 ?auto_114654 ) ) ( ON ?auto_114650 ?auto_114651 ) ( ON-TABLE ?auto_114653 ) ( ON ?auto_114652 ?auto_114653 ) ( ON ?auto_114654 ?auto_114652 ) ( not ( = ?auto_114653 ?auto_114652 ) ) ( not ( = ?auto_114653 ?auto_114654 ) ) ( not ( = ?auto_114653 ?auto_114651 ) ) ( not ( = ?auto_114653 ?auto_114650 ) ) ( not ( = ?auto_114652 ?auto_114654 ) ) ( not ( = ?auto_114652 ?auto_114651 ) ) ( not ( = ?auto_114652 ?auto_114650 ) ) ( not ( = ?auto_114648 ?auto_114653 ) ) ( not ( = ?auto_114648 ?auto_114652 ) ) ( not ( = ?auto_114649 ?auto_114653 ) ) ( not ( = ?auto_114649 ?auto_114652 ) ) ( ON ?auto_114649 ?auto_114650 ) ( CLEAR ?auto_114649 ) ( ON ?auto_114648 ?auto_114655 ) ( CLEAR ?auto_114648 ) ( HAND-EMPTY ) ( not ( = ?auto_114648 ?auto_114655 ) ) ( not ( = ?auto_114649 ?auto_114655 ) ) ( not ( = ?auto_114650 ?auto_114655 ) ) ( not ( = ?auto_114651 ?auto_114655 ) ) ( not ( = ?auto_114654 ?auto_114655 ) ) ( not ( = ?auto_114653 ?auto_114655 ) ) ( not ( = ?auto_114652 ?auto_114655 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_114648 ?auto_114655 )
      ( MAKE-4PILE ?auto_114648 ?auto_114649 ?auto_114650 ?auto_114651 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_114656 - BLOCK
      ?auto_114657 - BLOCK
      ?auto_114658 - BLOCK
      ?auto_114659 - BLOCK
    )
    :vars
    (
      ?auto_114663 - BLOCK
      ?auto_114661 - BLOCK
      ?auto_114662 - BLOCK
      ?auto_114660 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114656 ?auto_114657 ) ) ( not ( = ?auto_114656 ?auto_114658 ) ) ( not ( = ?auto_114656 ?auto_114659 ) ) ( not ( = ?auto_114657 ?auto_114658 ) ) ( not ( = ?auto_114657 ?auto_114659 ) ) ( not ( = ?auto_114658 ?auto_114659 ) ) ( ON ?auto_114659 ?auto_114663 ) ( not ( = ?auto_114656 ?auto_114663 ) ) ( not ( = ?auto_114657 ?auto_114663 ) ) ( not ( = ?auto_114658 ?auto_114663 ) ) ( not ( = ?auto_114659 ?auto_114663 ) ) ( ON ?auto_114658 ?auto_114659 ) ( ON-TABLE ?auto_114661 ) ( ON ?auto_114662 ?auto_114661 ) ( ON ?auto_114663 ?auto_114662 ) ( not ( = ?auto_114661 ?auto_114662 ) ) ( not ( = ?auto_114661 ?auto_114663 ) ) ( not ( = ?auto_114661 ?auto_114659 ) ) ( not ( = ?auto_114661 ?auto_114658 ) ) ( not ( = ?auto_114662 ?auto_114663 ) ) ( not ( = ?auto_114662 ?auto_114659 ) ) ( not ( = ?auto_114662 ?auto_114658 ) ) ( not ( = ?auto_114656 ?auto_114661 ) ) ( not ( = ?auto_114656 ?auto_114662 ) ) ( not ( = ?auto_114657 ?auto_114661 ) ) ( not ( = ?auto_114657 ?auto_114662 ) ) ( ON ?auto_114656 ?auto_114660 ) ( CLEAR ?auto_114656 ) ( not ( = ?auto_114656 ?auto_114660 ) ) ( not ( = ?auto_114657 ?auto_114660 ) ) ( not ( = ?auto_114658 ?auto_114660 ) ) ( not ( = ?auto_114659 ?auto_114660 ) ) ( not ( = ?auto_114663 ?auto_114660 ) ) ( not ( = ?auto_114661 ?auto_114660 ) ) ( not ( = ?auto_114662 ?auto_114660 ) ) ( HOLDING ?auto_114657 ) ( CLEAR ?auto_114658 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_114661 ?auto_114662 ?auto_114663 ?auto_114659 ?auto_114658 ?auto_114657 )
      ( MAKE-4PILE ?auto_114656 ?auto_114657 ?auto_114658 ?auto_114659 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_114664 - BLOCK
      ?auto_114665 - BLOCK
      ?auto_114666 - BLOCK
      ?auto_114667 - BLOCK
    )
    :vars
    (
      ?auto_114669 - BLOCK
      ?auto_114671 - BLOCK
      ?auto_114670 - BLOCK
      ?auto_114668 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114664 ?auto_114665 ) ) ( not ( = ?auto_114664 ?auto_114666 ) ) ( not ( = ?auto_114664 ?auto_114667 ) ) ( not ( = ?auto_114665 ?auto_114666 ) ) ( not ( = ?auto_114665 ?auto_114667 ) ) ( not ( = ?auto_114666 ?auto_114667 ) ) ( ON ?auto_114667 ?auto_114669 ) ( not ( = ?auto_114664 ?auto_114669 ) ) ( not ( = ?auto_114665 ?auto_114669 ) ) ( not ( = ?auto_114666 ?auto_114669 ) ) ( not ( = ?auto_114667 ?auto_114669 ) ) ( ON ?auto_114666 ?auto_114667 ) ( ON-TABLE ?auto_114671 ) ( ON ?auto_114670 ?auto_114671 ) ( ON ?auto_114669 ?auto_114670 ) ( not ( = ?auto_114671 ?auto_114670 ) ) ( not ( = ?auto_114671 ?auto_114669 ) ) ( not ( = ?auto_114671 ?auto_114667 ) ) ( not ( = ?auto_114671 ?auto_114666 ) ) ( not ( = ?auto_114670 ?auto_114669 ) ) ( not ( = ?auto_114670 ?auto_114667 ) ) ( not ( = ?auto_114670 ?auto_114666 ) ) ( not ( = ?auto_114664 ?auto_114671 ) ) ( not ( = ?auto_114664 ?auto_114670 ) ) ( not ( = ?auto_114665 ?auto_114671 ) ) ( not ( = ?auto_114665 ?auto_114670 ) ) ( ON ?auto_114664 ?auto_114668 ) ( not ( = ?auto_114664 ?auto_114668 ) ) ( not ( = ?auto_114665 ?auto_114668 ) ) ( not ( = ?auto_114666 ?auto_114668 ) ) ( not ( = ?auto_114667 ?auto_114668 ) ) ( not ( = ?auto_114669 ?auto_114668 ) ) ( not ( = ?auto_114671 ?auto_114668 ) ) ( not ( = ?auto_114670 ?auto_114668 ) ) ( CLEAR ?auto_114666 ) ( ON ?auto_114665 ?auto_114664 ) ( CLEAR ?auto_114665 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_114668 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_114668 ?auto_114664 )
      ( MAKE-4PILE ?auto_114664 ?auto_114665 ?auto_114666 ?auto_114667 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_114672 - BLOCK
      ?auto_114673 - BLOCK
      ?auto_114674 - BLOCK
      ?auto_114675 - BLOCK
    )
    :vars
    (
      ?auto_114676 - BLOCK
      ?auto_114678 - BLOCK
      ?auto_114679 - BLOCK
      ?auto_114677 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114672 ?auto_114673 ) ) ( not ( = ?auto_114672 ?auto_114674 ) ) ( not ( = ?auto_114672 ?auto_114675 ) ) ( not ( = ?auto_114673 ?auto_114674 ) ) ( not ( = ?auto_114673 ?auto_114675 ) ) ( not ( = ?auto_114674 ?auto_114675 ) ) ( ON ?auto_114675 ?auto_114676 ) ( not ( = ?auto_114672 ?auto_114676 ) ) ( not ( = ?auto_114673 ?auto_114676 ) ) ( not ( = ?auto_114674 ?auto_114676 ) ) ( not ( = ?auto_114675 ?auto_114676 ) ) ( ON-TABLE ?auto_114678 ) ( ON ?auto_114679 ?auto_114678 ) ( ON ?auto_114676 ?auto_114679 ) ( not ( = ?auto_114678 ?auto_114679 ) ) ( not ( = ?auto_114678 ?auto_114676 ) ) ( not ( = ?auto_114678 ?auto_114675 ) ) ( not ( = ?auto_114678 ?auto_114674 ) ) ( not ( = ?auto_114679 ?auto_114676 ) ) ( not ( = ?auto_114679 ?auto_114675 ) ) ( not ( = ?auto_114679 ?auto_114674 ) ) ( not ( = ?auto_114672 ?auto_114678 ) ) ( not ( = ?auto_114672 ?auto_114679 ) ) ( not ( = ?auto_114673 ?auto_114678 ) ) ( not ( = ?auto_114673 ?auto_114679 ) ) ( ON ?auto_114672 ?auto_114677 ) ( not ( = ?auto_114672 ?auto_114677 ) ) ( not ( = ?auto_114673 ?auto_114677 ) ) ( not ( = ?auto_114674 ?auto_114677 ) ) ( not ( = ?auto_114675 ?auto_114677 ) ) ( not ( = ?auto_114676 ?auto_114677 ) ) ( not ( = ?auto_114678 ?auto_114677 ) ) ( not ( = ?auto_114679 ?auto_114677 ) ) ( ON ?auto_114673 ?auto_114672 ) ( CLEAR ?auto_114673 ) ( ON-TABLE ?auto_114677 ) ( HOLDING ?auto_114674 ) ( CLEAR ?auto_114675 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_114678 ?auto_114679 ?auto_114676 ?auto_114675 ?auto_114674 )
      ( MAKE-4PILE ?auto_114672 ?auto_114673 ?auto_114674 ?auto_114675 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_114680 - BLOCK
      ?auto_114681 - BLOCK
      ?auto_114682 - BLOCK
      ?auto_114683 - BLOCK
    )
    :vars
    (
      ?auto_114686 - BLOCK
      ?auto_114685 - BLOCK
      ?auto_114684 - BLOCK
      ?auto_114687 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114680 ?auto_114681 ) ) ( not ( = ?auto_114680 ?auto_114682 ) ) ( not ( = ?auto_114680 ?auto_114683 ) ) ( not ( = ?auto_114681 ?auto_114682 ) ) ( not ( = ?auto_114681 ?auto_114683 ) ) ( not ( = ?auto_114682 ?auto_114683 ) ) ( ON ?auto_114683 ?auto_114686 ) ( not ( = ?auto_114680 ?auto_114686 ) ) ( not ( = ?auto_114681 ?auto_114686 ) ) ( not ( = ?auto_114682 ?auto_114686 ) ) ( not ( = ?auto_114683 ?auto_114686 ) ) ( ON-TABLE ?auto_114685 ) ( ON ?auto_114684 ?auto_114685 ) ( ON ?auto_114686 ?auto_114684 ) ( not ( = ?auto_114685 ?auto_114684 ) ) ( not ( = ?auto_114685 ?auto_114686 ) ) ( not ( = ?auto_114685 ?auto_114683 ) ) ( not ( = ?auto_114685 ?auto_114682 ) ) ( not ( = ?auto_114684 ?auto_114686 ) ) ( not ( = ?auto_114684 ?auto_114683 ) ) ( not ( = ?auto_114684 ?auto_114682 ) ) ( not ( = ?auto_114680 ?auto_114685 ) ) ( not ( = ?auto_114680 ?auto_114684 ) ) ( not ( = ?auto_114681 ?auto_114685 ) ) ( not ( = ?auto_114681 ?auto_114684 ) ) ( ON ?auto_114680 ?auto_114687 ) ( not ( = ?auto_114680 ?auto_114687 ) ) ( not ( = ?auto_114681 ?auto_114687 ) ) ( not ( = ?auto_114682 ?auto_114687 ) ) ( not ( = ?auto_114683 ?auto_114687 ) ) ( not ( = ?auto_114686 ?auto_114687 ) ) ( not ( = ?auto_114685 ?auto_114687 ) ) ( not ( = ?auto_114684 ?auto_114687 ) ) ( ON ?auto_114681 ?auto_114680 ) ( ON-TABLE ?auto_114687 ) ( CLEAR ?auto_114683 ) ( ON ?auto_114682 ?auto_114681 ) ( CLEAR ?auto_114682 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_114687 ?auto_114680 ?auto_114681 )
      ( MAKE-4PILE ?auto_114680 ?auto_114681 ?auto_114682 ?auto_114683 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_114688 - BLOCK
      ?auto_114689 - BLOCK
      ?auto_114690 - BLOCK
      ?auto_114691 - BLOCK
    )
    :vars
    (
      ?auto_114692 - BLOCK
      ?auto_114694 - BLOCK
      ?auto_114693 - BLOCK
      ?auto_114695 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114688 ?auto_114689 ) ) ( not ( = ?auto_114688 ?auto_114690 ) ) ( not ( = ?auto_114688 ?auto_114691 ) ) ( not ( = ?auto_114689 ?auto_114690 ) ) ( not ( = ?auto_114689 ?auto_114691 ) ) ( not ( = ?auto_114690 ?auto_114691 ) ) ( not ( = ?auto_114688 ?auto_114692 ) ) ( not ( = ?auto_114689 ?auto_114692 ) ) ( not ( = ?auto_114690 ?auto_114692 ) ) ( not ( = ?auto_114691 ?auto_114692 ) ) ( ON-TABLE ?auto_114694 ) ( ON ?auto_114693 ?auto_114694 ) ( ON ?auto_114692 ?auto_114693 ) ( not ( = ?auto_114694 ?auto_114693 ) ) ( not ( = ?auto_114694 ?auto_114692 ) ) ( not ( = ?auto_114694 ?auto_114691 ) ) ( not ( = ?auto_114694 ?auto_114690 ) ) ( not ( = ?auto_114693 ?auto_114692 ) ) ( not ( = ?auto_114693 ?auto_114691 ) ) ( not ( = ?auto_114693 ?auto_114690 ) ) ( not ( = ?auto_114688 ?auto_114694 ) ) ( not ( = ?auto_114688 ?auto_114693 ) ) ( not ( = ?auto_114689 ?auto_114694 ) ) ( not ( = ?auto_114689 ?auto_114693 ) ) ( ON ?auto_114688 ?auto_114695 ) ( not ( = ?auto_114688 ?auto_114695 ) ) ( not ( = ?auto_114689 ?auto_114695 ) ) ( not ( = ?auto_114690 ?auto_114695 ) ) ( not ( = ?auto_114691 ?auto_114695 ) ) ( not ( = ?auto_114692 ?auto_114695 ) ) ( not ( = ?auto_114694 ?auto_114695 ) ) ( not ( = ?auto_114693 ?auto_114695 ) ) ( ON ?auto_114689 ?auto_114688 ) ( ON-TABLE ?auto_114695 ) ( ON ?auto_114690 ?auto_114689 ) ( CLEAR ?auto_114690 ) ( HOLDING ?auto_114691 ) ( CLEAR ?auto_114692 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_114694 ?auto_114693 ?auto_114692 ?auto_114691 )
      ( MAKE-4PILE ?auto_114688 ?auto_114689 ?auto_114690 ?auto_114691 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_114696 - BLOCK
      ?auto_114697 - BLOCK
      ?auto_114698 - BLOCK
      ?auto_114699 - BLOCK
    )
    :vars
    (
      ?auto_114702 - BLOCK
      ?auto_114703 - BLOCK
      ?auto_114701 - BLOCK
      ?auto_114700 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114696 ?auto_114697 ) ) ( not ( = ?auto_114696 ?auto_114698 ) ) ( not ( = ?auto_114696 ?auto_114699 ) ) ( not ( = ?auto_114697 ?auto_114698 ) ) ( not ( = ?auto_114697 ?auto_114699 ) ) ( not ( = ?auto_114698 ?auto_114699 ) ) ( not ( = ?auto_114696 ?auto_114702 ) ) ( not ( = ?auto_114697 ?auto_114702 ) ) ( not ( = ?auto_114698 ?auto_114702 ) ) ( not ( = ?auto_114699 ?auto_114702 ) ) ( ON-TABLE ?auto_114703 ) ( ON ?auto_114701 ?auto_114703 ) ( ON ?auto_114702 ?auto_114701 ) ( not ( = ?auto_114703 ?auto_114701 ) ) ( not ( = ?auto_114703 ?auto_114702 ) ) ( not ( = ?auto_114703 ?auto_114699 ) ) ( not ( = ?auto_114703 ?auto_114698 ) ) ( not ( = ?auto_114701 ?auto_114702 ) ) ( not ( = ?auto_114701 ?auto_114699 ) ) ( not ( = ?auto_114701 ?auto_114698 ) ) ( not ( = ?auto_114696 ?auto_114703 ) ) ( not ( = ?auto_114696 ?auto_114701 ) ) ( not ( = ?auto_114697 ?auto_114703 ) ) ( not ( = ?auto_114697 ?auto_114701 ) ) ( ON ?auto_114696 ?auto_114700 ) ( not ( = ?auto_114696 ?auto_114700 ) ) ( not ( = ?auto_114697 ?auto_114700 ) ) ( not ( = ?auto_114698 ?auto_114700 ) ) ( not ( = ?auto_114699 ?auto_114700 ) ) ( not ( = ?auto_114702 ?auto_114700 ) ) ( not ( = ?auto_114703 ?auto_114700 ) ) ( not ( = ?auto_114701 ?auto_114700 ) ) ( ON ?auto_114697 ?auto_114696 ) ( ON-TABLE ?auto_114700 ) ( ON ?auto_114698 ?auto_114697 ) ( CLEAR ?auto_114702 ) ( ON ?auto_114699 ?auto_114698 ) ( CLEAR ?auto_114699 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_114700 ?auto_114696 ?auto_114697 ?auto_114698 )
      ( MAKE-4PILE ?auto_114696 ?auto_114697 ?auto_114698 ?auto_114699 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_114704 - BLOCK
      ?auto_114705 - BLOCK
      ?auto_114706 - BLOCK
      ?auto_114707 - BLOCK
    )
    :vars
    (
      ?auto_114710 - BLOCK
      ?auto_114708 - BLOCK
      ?auto_114709 - BLOCK
      ?auto_114711 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114704 ?auto_114705 ) ) ( not ( = ?auto_114704 ?auto_114706 ) ) ( not ( = ?auto_114704 ?auto_114707 ) ) ( not ( = ?auto_114705 ?auto_114706 ) ) ( not ( = ?auto_114705 ?auto_114707 ) ) ( not ( = ?auto_114706 ?auto_114707 ) ) ( not ( = ?auto_114704 ?auto_114710 ) ) ( not ( = ?auto_114705 ?auto_114710 ) ) ( not ( = ?auto_114706 ?auto_114710 ) ) ( not ( = ?auto_114707 ?auto_114710 ) ) ( ON-TABLE ?auto_114708 ) ( ON ?auto_114709 ?auto_114708 ) ( not ( = ?auto_114708 ?auto_114709 ) ) ( not ( = ?auto_114708 ?auto_114710 ) ) ( not ( = ?auto_114708 ?auto_114707 ) ) ( not ( = ?auto_114708 ?auto_114706 ) ) ( not ( = ?auto_114709 ?auto_114710 ) ) ( not ( = ?auto_114709 ?auto_114707 ) ) ( not ( = ?auto_114709 ?auto_114706 ) ) ( not ( = ?auto_114704 ?auto_114708 ) ) ( not ( = ?auto_114704 ?auto_114709 ) ) ( not ( = ?auto_114705 ?auto_114708 ) ) ( not ( = ?auto_114705 ?auto_114709 ) ) ( ON ?auto_114704 ?auto_114711 ) ( not ( = ?auto_114704 ?auto_114711 ) ) ( not ( = ?auto_114705 ?auto_114711 ) ) ( not ( = ?auto_114706 ?auto_114711 ) ) ( not ( = ?auto_114707 ?auto_114711 ) ) ( not ( = ?auto_114710 ?auto_114711 ) ) ( not ( = ?auto_114708 ?auto_114711 ) ) ( not ( = ?auto_114709 ?auto_114711 ) ) ( ON ?auto_114705 ?auto_114704 ) ( ON-TABLE ?auto_114711 ) ( ON ?auto_114706 ?auto_114705 ) ( ON ?auto_114707 ?auto_114706 ) ( CLEAR ?auto_114707 ) ( HOLDING ?auto_114710 ) ( CLEAR ?auto_114709 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_114708 ?auto_114709 ?auto_114710 )
      ( MAKE-4PILE ?auto_114704 ?auto_114705 ?auto_114706 ?auto_114707 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_114712 - BLOCK
      ?auto_114713 - BLOCK
      ?auto_114714 - BLOCK
      ?auto_114715 - BLOCK
    )
    :vars
    (
      ?auto_114717 - BLOCK
      ?auto_114716 - BLOCK
      ?auto_114718 - BLOCK
      ?auto_114719 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114712 ?auto_114713 ) ) ( not ( = ?auto_114712 ?auto_114714 ) ) ( not ( = ?auto_114712 ?auto_114715 ) ) ( not ( = ?auto_114713 ?auto_114714 ) ) ( not ( = ?auto_114713 ?auto_114715 ) ) ( not ( = ?auto_114714 ?auto_114715 ) ) ( not ( = ?auto_114712 ?auto_114717 ) ) ( not ( = ?auto_114713 ?auto_114717 ) ) ( not ( = ?auto_114714 ?auto_114717 ) ) ( not ( = ?auto_114715 ?auto_114717 ) ) ( ON-TABLE ?auto_114716 ) ( ON ?auto_114718 ?auto_114716 ) ( not ( = ?auto_114716 ?auto_114718 ) ) ( not ( = ?auto_114716 ?auto_114717 ) ) ( not ( = ?auto_114716 ?auto_114715 ) ) ( not ( = ?auto_114716 ?auto_114714 ) ) ( not ( = ?auto_114718 ?auto_114717 ) ) ( not ( = ?auto_114718 ?auto_114715 ) ) ( not ( = ?auto_114718 ?auto_114714 ) ) ( not ( = ?auto_114712 ?auto_114716 ) ) ( not ( = ?auto_114712 ?auto_114718 ) ) ( not ( = ?auto_114713 ?auto_114716 ) ) ( not ( = ?auto_114713 ?auto_114718 ) ) ( ON ?auto_114712 ?auto_114719 ) ( not ( = ?auto_114712 ?auto_114719 ) ) ( not ( = ?auto_114713 ?auto_114719 ) ) ( not ( = ?auto_114714 ?auto_114719 ) ) ( not ( = ?auto_114715 ?auto_114719 ) ) ( not ( = ?auto_114717 ?auto_114719 ) ) ( not ( = ?auto_114716 ?auto_114719 ) ) ( not ( = ?auto_114718 ?auto_114719 ) ) ( ON ?auto_114713 ?auto_114712 ) ( ON-TABLE ?auto_114719 ) ( ON ?auto_114714 ?auto_114713 ) ( ON ?auto_114715 ?auto_114714 ) ( CLEAR ?auto_114718 ) ( ON ?auto_114717 ?auto_114715 ) ( CLEAR ?auto_114717 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_114719 ?auto_114712 ?auto_114713 ?auto_114714 ?auto_114715 )
      ( MAKE-4PILE ?auto_114712 ?auto_114713 ?auto_114714 ?auto_114715 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_114720 - BLOCK
      ?auto_114721 - BLOCK
      ?auto_114722 - BLOCK
      ?auto_114723 - BLOCK
    )
    :vars
    (
      ?auto_114727 - BLOCK
      ?auto_114725 - BLOCK
      ?auto_114724 - BLOCK
      ?auto_114726 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114720 ?auto_114721 ) ) ( not ( = ?auto_114720 ?auto_114722 ) ) ( not ( = ?auto_114720 ?auto_114723 ) ) ( not ( = ?auto_114721 ?auto_114722 ) ) ( not ( = ?auto_114721 ?auto_114723 ) ) ( not ( = ?auto_114722 ?auto_114723 ) ) ( not ( = ?auto_114720 ?auto_114727 ) ) ( not ( = ?auto_114721 ?auto_114727 ) ) ( not ( = ?auto_114722 ?auto_114727 ) ) ( not ( = ?auto_114723 ?auto_114727 ) ) ( ON-TABLE ?auto_114725 ) ( not ( = ?auto_114725 ?auto_114724 ) ) ( not ( = ?auto_114725 ?auto_114727 ) ) ( not ( = ?auto_114725 ?auto_114723 ) ) ( not ( = ?auto_114725 ?auto_114722 ) ) ( not ( = ?auto_114724 ?auto_114727 ) ) ( not ( = ?auto_114724 ?auto_114723 ) ) ( not ( = ?auto_114724 ?auto_114722 ) ) ( not ( = ?auto_114720 ?auto_114725 ) ) ( not ( = ?auto_114720 ?auto_114724 ) ) ( not ( = ?auto_114721 ?auto_114725 ) ) ( not ( = ?auto_114721 ?auto_114724 ) ) ( ON ?auto_114720 ?auto_114726 ) ( not ( = ?auto_114720 ?auto_114726 ) ) ( not ( = ?auto_114721 ?auto_114726 ) ) ( not ( = ?auto_114722 ?auto_114726 ) ) ( not ( = ?auto_114723 ?auto_114726 ) ) ( not ( = ?auto_114727 ?auto_114726 ) ) ( not ( = ?auto_114725 ?auto_114726 ) ) ( not ( = ?auto_114724 ?auto_114726 ) ) ( ON ?auto_114721 ?auto_114720 ) ( ON-TABLE ?auto_114726 ) ( ON ?auto_114722 ?auto_114721 ) ( ON ?auto_114723 ?auto_114722 ) ( ON ?auto_114727 ?auto_114723 ) ( CLEAR ?auto_114727 ) ( HOLDING ?auto_114724 ) ( CLEAR ?auto_114725 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_114725 ?auto_114724 )
      ( MAKE-4PILE ?auto_114720 ?auto_114721 ?auto_114722 ?auto_114723 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_114728 - BLOCK
      ?auto_114729 - BLOCK
      ?auto_114730 - BLOCK
      ?auto_114731 - BLOCK
    )
    :vars
    (
      ?auto_114732 - BLOCK
      ?auto_114735 - BLOCK
      ?auto_114733 - BLOCK
      ?auto_114734 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114728 ?auto_114729 ) ) ( not ( = ?auto_114728 ?auto_114730 ) ) ( not ( = ?auto_114728 ?auto_114731 ) ) ( not ( = ?auto_114729 ?auto_114730 ) ) ( not ( = ?auto_114729 ?auto_114731 ) ) ( not ( = ?auto_114730 ?auto_114731 ) ) ( not ( = ?auto_114728 ?auto_114732 ) ) ( not ( = ?auto_114729 ?auto_114732 ) ) ( not ( = ?auto_114730 ?auto_114732 ) ) ( not ( = ?auto_114731 ?auto_114732 ) ) ( ON-TABLE ?auto_114735 ) ( not ( = ?auto_114735 ?auto_114733 ) ) ( not ( = ?auto_114735 ?auto_114732 ) ) ( not ( = ?auto_114735 ?auto_114731 ) ) ( not ( = ?auto_114735 ?auto_114730 ) ) ( not ( = ?auto_114733 ?auto_114732 ) ) ( not ( = ?auto_114733 ?auto_114731 ) ) ( not ( = ?auto_114733 ?auto_114730 ) ) ( not ( = ?auto_114728 ?auto_114735 ) ) ( not ( = ?auto_114728 ?auto_114733 ) ) ( not ( = ?auto_114729 ?auto_114735 ) ) ( not ( = ?auto_114729 ?auto_114733 ) ) ( ON ?auto_114728 ?auto_114734 ) ( not ( = ?auto_114728 ?auto_114734 ) ) ( not ( = ?auto_114729 ?auto_114734 ) ) ( not ( = ?auto_114730 ?auto_114734 ) ) ( not ( = ?auto_114731 ?auto_114734 ) ) ( not ( = ?auto_114732 ?auto_114734 ) ) ( not ( = ?auto_114735 ?auto_114734 ) ) ( not ( = ?auto_114733 ?auto_114734 ) ) ( ON ?auto_114729 ?auto_114728 ) ( ON-TABLE ?auto_114734 ) ( ON ?auto_114730 ?auto_114729 ) ( ON ?auto_114731 ?auto_114730 ) ( ON ?auto_114732 ?auto_114731 ) ( CLEAR ?auto_114735 ) ( ON ?auto_114733 ?auto_114732 ) ( CLEAR ?auto_114733 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_114734 ?auto_114728 ?auto_114729 ?auto_114730 ?auto_114731 ?auto_114732 )
      ( MAKE-4PILE ?auto_114728 ?auto_114729 ?auto_114730 ?auto_114731 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_114736 - BLOCK
      ?auto_114737 - BLOCK
      ?auto_114738 - BLOCK
      ?auto_114739 - BLOCK
    )
    :vars
    (
      ?auto_114743 - BLOCK
      ?auto_114740 - BLOCK
      ?auto_114741 - BLOCK
      ?auto_114742 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114736 ?auto_114737 ) ) ( not ( = ?auto_114736 ?auto_114738 ) ) ( not ( = ?auto_114736 ?auto_114739 ) ) ( not ( = ?auto_114737 ?auto_114738 ) ) ( not ( = ?auto_114737 ?auto_114739 ) ) ( not ( = ?auto_114738 ?auto_114739 ) ) ( not ( = ?auto_114736 ?auto_114743 ) ) ( not ( = ?auto_114737 ?auto_114743 ) ) ( not ( = ?auto_114738 ?auto_114743 ) ) ( not ( = ?auto_114739 ?auto_114743 ) ) ( not ( = ?auto_114740 ?auto_114741 ) ) ( not ( = ?auto_114740 ?auto_114743 ) ) ( not ( = ?auto_114740 ?auto_114739 ) ) ( not ( = ?auto_114740 ?auto_114738 ) ) ( not ( = ?auto_114741 ?auto_114743 ) ) ( not ( = ?auto_114741 ?auto_114739 ) ) ( not ( = ?auto_114741 ?auto_114738 ) ) ( not ( = ?auto_114736 ?auto_114740 ) ) ( not ( = ?auto_114736 ?auto_114741 ) ) ( not ( = ?auto_114737 ?auto_114740 ) ) ( not ( = ?auto_114737 ?auto_114741 ) ) ( ON ?auto_114736 ?auto_114742 ) ( not ( = ?auto_114736 ?auto_114742 ) ) ( not ( = ?auto_114737 ?auto_114742 ) ) ( not ( = ?auto_114738 ?auto_114742 ) ) ( not ( = ?auto_114739 ?auto_114742 ) ) ( not ( = ?auto_114743 ?auto_114742 ) ) ( not ( = ?auto_114740 ?auto_114742 ) ) ( not ( = ?auto_114741 ?auto_114742 ) ) ( ON ?auto_114737 ?auto_114736 ) ( ON-TABLE ?auto_114742 ) ( ON ?auto_114738 ?auto_114737 ) ( ON ?auto_114739 ?auto_114738 ) ( ON ?auto_114743 ?auto_114739 ) ( ON ?auto_114741 ?auto_114743 ) ( CLEAR ?auto_114741 ) ( HOLDING ?auto_114740 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_114740 )
      ( MAKE-4PILE ?auto_114736 ?auto_114737 ?auto_114738 ?auto_114739 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_114744 - BLOCK
      ?auto_114745 - BLOCK
      ?auto_114746 - BLOCK
      ?auto_114747 - BLOCK
    )
    :vars
    (
      ?auto_114749 - BLOCK
      ?auto_114751 - BLOCK
      ?auto_114750 - BLOCK
      ?auto_114748 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114744 ?auto_114745 ) ) ( not ( = ?auto_114744 ?auto_114746 ) ) ( not ( = ?auto_114744 ?auto_114747 ) ) ( not ( = ?auto_114745 ?auto_114746 ) ) ( not ( = ?auto_114745 ?auto_114747 ) ) ( not ( = ?auto_114746 ?auto_114747 ) ) ( not ( = ?auto_114744 ?auto_114749 ) ) ( not ( = ?auto_114745 ?auto_114749 ) ) ( not ( = ?auto_114746 ?auto_114749 ) ) ( not ( = ?auto_114747 ?auto_114749 ) ) ( not ( = ?auto_114751 ?auto_114750 ) ) ( not ( = ?auto_114751 ?auto_114749 ) ) ( not ( = ?auto_114751 ?auto_114747 ) ) ( not ( = ?auto_114751 ?auto_114746 ) ) ( not ( = ?auto_114750 ?auto_114749 ) ) ( not ( = ?auto_114750 ?auto_114747 ) ) ( not ( = ?auto_114750 ?auto_114746 ) ) ( not ( = ?auto_114744 ?auto_114751 ) ) ( not ( = ?auto_114744 ?auto_114750 ) ) ( not ( = ?auto_114745 ?auto_114751 ) ) ( not ( = ?auto_114745 ?auto_114750 ) ) ( ON ?auto_114744 ?auto_114748 ) ( not ( = ?auto_114744 ?auto_114748 ) ) ( not ( = ?auto_114745 ?auto_114748 ) ) ( not ( = ?auto_114746 ?auto_114748 ) ) ( not ( = ?auto_114747 ?auto_114748 ) ) ( not ( = ?auto_114749 ?auto_114748 ) ) ( not ( = ?auto_114751 ?auto_114748 ) ) ( not ( = ?auto_114750 ?auto_114748 ) ) ( ON ?auto_114745 ?auto_114744 ) ( ON-TABLE ?auto_114748 ) ( ON ?auto_114746 ?auto_114745 ) ( ON ?auto_114747 ?auto_114746 ) ( ON ?auto_114749 ?auto_114747 ) ( ON ?auto_114750 ?auto_114749 ) ( ON ?auto_114751 ?auto_114750 ) ( CLEAR ?auto_114751 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_114748 ?auto_114744 ?auto_114745 ?auto_114746 ?auto_114747 ?auto_114749 ?auto_114750 )
      ( MAKE-4PILE ?auto_114744 ?auto_114745 ?auto_114746 ?auto_114747 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_114754 - BLOCK
      ?auto_114755 - BLOCK
    )
    :vars
    (
      ?auto_114756 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114756 ?auto_114755 ) ( CLEAR ?auto_114756 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_114754 ) ( ON ?auto_114755 ?auto_114754 ) ( not ( = ?auto_114754 ?auto_114755 ) ) ( not ( = ?auto_114754 ?auto_114756 ) ) ( not ( = ?auto_114755 ?auto_114756 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_114756 ?auto_114755 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_114757 - BLOCK
      ?auto_114758 - BLOCK
    )
    :vars
    (
      ?auto_114759 - BLOCK
      ?auto_114760 - BLOCK
      ?auto_114761 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114759 ?auto_114758 ) ( CLEAR ?auto_114759 ) ( ON-TABLE ?auto_114757 ) ( ON ?auto_114758 ?auto_114757 ) ( not ( = ?auto_114757 ?auto_114758 ) ) ( not ( = ?auto_114757 ?auto_114759 ) ) ( not ( = ?auto_114758 ?auto_114759 ) ) ( HOLDING ?auto_114760 ) ( CLEAR ?auto_114761 ) ( not ( = ?auto_114757 ?auto_114760 ) ) ( not ( = ?auto_114757 ?auto_114761 ) ) ( not ( = ?auto_114758 ?auto_114760 ) ) ( not ( = ?auto_114758 ?auto_114761 ) ) ( not ( = ?auto_114759 ?auto_114760 ) ) ( not ( = ?auto_114759 ?auto_114761 ) ) ( not ( = ?auto_114760 ?auto_114761 ) ) )
    :subtasks
    ( ( !STACK ?auto_114760 ?auto_114761 )
      ( MAKE-2PILE ?auto_114757 ?auto_114758 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_114762 - BLOCK
      ?auto_114763 - BLOCK
    )
    :vars
    (
      ?auto_114766 - BLOCK
      ?auto_114764 - BLOCK
      ?auto_114765 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114766 ?auto_114763 ) ( ON-TABLE ?auto_114762 ) ( ON ?auto_114763 ?auto_114762 ) ( not ( = ?auto_114762 ?auto_114763 ) ) ( not ( = ?auto_114762 ?auto_114766 ) ) ( not ( = ?auto_114763 ?auto_114766 ) ) ( CLEAR ?auto_114764 ) ( not ( = ?auto_114762 ?auto_114765 ) ) ( not ( = ?auto_114762 ?auto_114764 ) ) ( not ( = ?auto_114763 ?auto_114765 ) ) ( not ( = ?auto_114763 ?auto_114764 ) ) ( not ( = ?auto_114766 ?auto_114765 ) ) ( not ( = ?auto_114766 ?auto_114764 ) ) ( not ( = ?auto_114765 ?auto_114764 ) ) ( ON ?auto_114765 ?auto_114766 ) ( CLEAR ?auto_114765 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_114762 ?auto_114763 ?auto_114766 )
      ( MAKE-2PILE ?auto_114762 ?auto_114763 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_114767 - BLOCK
      ?auto_114768 - BLOCK
    )
    :vars
    (
      ?auto_114771 - BLOCK
      ?auto_114770 - BLOCK
      ?auto_114769 - BLOCK
      ?auto_114773 - BLOCK
      ?auto_114772 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114771 ?auto_114768 ) ( ON-TABLE ?auto_114767 ) ( ON ?auto_114768 ?auto_114767 ) ( not ( = ?auto_114767 ?auto_114768 ) ) ( not ( = ?auto_114767 ?auto_114771 ) ) ( not ( = ?auto_114768 ?auto_114771 ) ) ( not ( = ?auto_114767 ?auto_114770 ) ) ( not ( = ?auto_114767 ?auto_114769 ) ) ( not ( = ?auto_114768 ?auto_114770 ) ) ( not ( = ?auto_114768 ?auto_114769 ) ) ( not ( = ?auto_114771 ?auto_114770 ) ) ( not ( = ?auto_114771 ?auto_114769 ) ) ( not ( = ?auto_114770 ?auto_114769 ) ) ( ON ?auto_114770 ?auto_114771 ) ( CLEAR ?auto_114770 ) ( HOLDING ?auto_114769 ) ( CLEAR ?auto_114773 ) ( ON-TABLE ?auto_114772 ) ( ON ?auto_114773 ?auto_114772 ) ( not ( = ?auto_114772 ?auto_114773 ) ) ( not ( = ?auto_114772 ?auto_114769 ) ) ( not ( = ?auto_114773 ?auto_114769 ) ) ( not ( = ?auto_114767 ?auto_114773 ) ) ( not ( = ?auto_114767 ?auto_114772 ) ) ( not ( = ?auto_114768 ?auto_114773 ) ) ( not ( = ?auto_114768 ?auto_114772 ) ) ( not ( = ?auto_114771 ?auto_114773 ) ) ( not ( = ?auto_114771 ?auto_114772 ) ) ( not ( = ?auto_114770 ?auto_114773 ) ) ( not ( = ?auto_114770 ?auto_114772 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_114772 ?auto_114773 ?auto_114769 )
      ( MAKE-2PILE ?auto_114767 ?auto_114768 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_114774 - BLOCK
      ?auto_114775 - BLOCK
    )
    :vars
    (
      ?auto_114780 - BLOCK
      ?auto_114776 - BLOCK
      ?auto_114779 - BLOCK
      ?auto_114777 - BLOCK
      ?auto_114778 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114780 ?auto_114775 ) ( ON-TABLE ?auto_114774 ) ( ON ?auto_114775 ?auto_114774 ) ( not ( = ?auto_114774 ?auto_114775 ) ) ( not ( = ?auto_114774 ?auto_114780 ) ) ( not ( = ?auto_114775 ?auto_114780 ) ) ( not ( = ?auto_114774 ?auto_114776 ) ) ( not ( = ?auto_114774 ?auto_114779 ) ) ( not ( = ?auto_114775 ?auto_114776 ) ) ( not ( = ?auto_114775 ?auto_114779 ) ) ( not ( = ?auto_114780 ?auto_114776 ) ) ( not ( = ?auto_114780 ?auto_114779 ) ) ( not ( = ?auto_114776 ?auto_114779 ) ) ( ON ?auto_114776 ?auto_114780 ) ( CLEAR ?auto_114777 ) ( ON-TABLE ?auto_114778 ) ( ON ?auto_114777 ?auto_114778 ) ( not ( = ?auto_114778 ?auto_114777 ) ) ( not ( = ?auto_114778 ?auto_114779 ) ) ( not ( = ?auto_114777 ?auto_114779 ) ) ( not ( = ?auto_114774 ?auto_114777 ) ) ( not ( = ?auto_114774 ?auto_114778 ) ) ( not ( = ?auto_114775 ?auto_114777 ) ) ( not ( = ?auto_114775 ?auto_114778 ) ) ( not ( = ?auto_114780 ?auto_114777 ) ) ( not ( = ?auto_114780 ?auto_114778 ) ) ( not ( = ?auto_114776 ?auto_114777 ) ) ( not ( = ?auto_114776 ?auto_114778 ) ) ( ON ?auto_114779 ?auto_114776 ) ( CLEAR ?auto_114779 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_114774 ?auto_114775 ?auto_114780 ?auto_114776 )
      ( MAKE-2PILE ?auto_114774 ?auto_114775 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_114781 - BLOCK
      ?auto_114782 - BLOCK
    )
    :vars
    (
      ?auto_114785 - BLOCK
      ?auto_114786 - BLOCK
      ?auto_114784 - BLOCK
      ?auto_114783 - BLOCK
      ?auto_114787 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114785 ?auto_114782 ) ( ON-TABLE ?auto_114781 ) ( ON ?auto_114782 ?auto_114781 ) ( not ( = ?auto_114781 ?auto_114782 ) ) ( not ( = ?auto_114781 ?auto_114785 ) ) ( not ( = ?auto_114782 ?auto_114785 ) ) ( not ( = ?auto_114781 ?auto_114786 ) ) ( not ( = ?auto_114781 ?auto_114784 ) ) ( not ( = ?auto_114782 ?auto_114786 ) ) ( not ( = ?auto_114782 ?auto_114784 ) ) ( not ( = ?auto_114785 ?auto_114786 ) ) ( not ( = ?auto_114785 ?auto_114784 ) ) ( not ( = ?auto_114786 ?auto_114784 ) ) ( ON ?auto_114786 ?auto_114785 ) ( ON-TABLE ?auto_114783 ) ( not ( = ?auto_114783 ?auto_114787 ) ) ( not ( = ?auto_114783 ?auto_114784 ) ) ( not ( = ?auto_114787 ?auto_114784 ) ) ( not ( = ?auto_114781 ?auto_114787 ) ) ( not ( = ?auto_114781 ?auto_114783 ) ) ( not ( = ?auto_114782 ?auto_114787 ) ) ( not ( = ?auto_114782 ?auto_114783 ) ) ( not ( = ?auto_114785 ?auto_114787 ) ) ( not ( = ?auto_114785 ?auto_114783 ) ) ( not ( = ?auto_114786 ?auto_114787 ) ) ( not ( = ?auto_114786 ?auto_114783 ) ) ( ON ?auto_114784 ?auto_114786 ) ( CLEAR ?auto_114784 ) ( HOLDING ?auto_114787 ) ( CLEAR ?auto_114783 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_114783 ?auto_114787 )
      ( MAKE-2PILE ?auto_114781 ?auto_114782 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_114788 - BLOCK
      ?auto_114789 - BLOCK
    )
    :vars
    (
      ?auto_114792 - BLOCK
      ?auto_114793 - BLOCK
      ?auto_114791 - BLOCK
      ?auto_114790 - BLOCK
      ?auto_114794 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114792 ?auto_114789 ) ( ON-TABLE ?auto_114788 ) ( ON ?auto_114789 ?auto_114788 ) ( not ( = ?auto_114788 ?auto_114789 ) ) ( not ( = ?auto_114788 ?auto_114792 ) ) ( not ( = ?auto_114789 ?auto_114792 ) ) ( not ( = ?auto_114788 ?auto_114793 ) ) ( not ( = ?auto_114788 ?auto_114791 ) ) ( not ( = ?auto_114789 ?auto_114793 ) ) ( not ( = ?auto_114789 ?auto_114791 ) ) ( not ( = ?auto_114792 ?auto_114793 ) ) ( not ( = ?auto_114792 ?auto_114791 ) ) ( not ( = ?auto_114793 ?auto_114791 ) ) ( ON ?auto_114793 ?auto_114792 ) ( ON-TABLE ?auto_114790 ) ( not ( = ?auto_114790 ?auto_114794 ) ) ( not ( = ?auto_114790 ?auto_114791 ) ) ( not ( = ?auto_114794 ?auto_114791 ) ) ( not ( = ?auto_114788 ?auto_114794 ) ) ( not ( = ?auto_114788 ?auto_114790 ) ) ( not ( = ?auto_114789 ?auto_114794 ) ) ( not ( = ?auto_114789 ?auto_114790 ) ) ( not ( = ?auto_114792 ?auto_114794 ) ) ( not ( = ?auto_114792 ?auto_114790 ) ) ( not ( = ?auto_114793 ?auto_114794 ) ) ( not ( = ?auto_114793 ?auto_114790 ) ) ( ON ?auto_114791 ?auto_114793 ) ( CLEAR ?auto_114790 ) ( ON ?auto_114794 ?auto_114791 ) ( CLEAR ?auto_114794 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_114788 ?auto_114789 ?auto_114792 ?auto_114793 ?auto_114791 )
      ( MAKE-2PILE ?auto_114788 ?auto_114789 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_114795 - BLOCK
      ?auto_114796 - BLOCK
    )
    :vars
    (
      ?auto_114798 - BLOCK
      ?auto_114800 - BLOCK
      ?auto_114801 - BLOCK
      ?auto_114799 - BLOCK
      ?auto_114797 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114798 ?auto_114796 ) ( ON-TABLE ?auto_114795 ) ( ON ?auto_114796 ?auto_114795 ) ( not ( = ?auto_114795 ?auto_114796 ) ) ( not ( = ?auto_114795 ?auto_114798 ) ) ( not ( = ?auto_114796 ?auto_114798 ) ) ( not ( = ?auto_114795 ?auto_114800 ) ) ( not ( = ?auto_114795 ?auto_114801 ) ) ( not ( = ?auto_114796 ?auto_114800 ) ) ( not ( = ?auto_114796 ?auto_114801 ) ) ( not ( = ?auto_114798 ?auto_114800 ) ) ( not ( = ?auto_114798 ?auto_114801 ) ) ( not ( = ?auto_114800 ?auto_114801 ) ) ( ON ?auto_114800 ?auto_114798 ) ( not ( = ?auto_114799 ?auto_114797 ) ) ( not ( = ?auto_114799 ?auto_114801 ) ) ( not ( = ?auto_114797 ?auto_114801 ) ) ( not ( = ?auto_114795 ?auto_114797 ) ) ( not ( = ?auto_114795 ?auto_114799 ) ) ( not ( = ?auto_114796 ?auto_114797 ) ) ( not ( = ?auto_114796 ?auto_114799 ) ) ( not ( = ?auto_114798 ?auto_114797 ) ) ( not ( = ?auto_114798 ?auto_114799 ) ) ( not ( = ?auto_114800 ?auto_114797 ) ) ( not ( = ?auto_114800 ?auto_114799 ) ) ( ON ?auto_114801 ?auto_114800 ) ( ON ?auto_114797 ?auto_114801 ) ( CLEAR ?auto_114797 ) ( HOLDING ?auto_114799 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_114799 )
      ( MAKE-2PILE ?auto_114795 ?auto_114796 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_114802 - BLOCK
      ?auto_114803 - BLOCK
    )
    :vars
    (
      ?auto_114804 - BLOCK
      ?auto_114807 - BLOCK
      ?auto_114806 - BLOCK
      ?auto_114808 - BLOCK
      ?auto_114805 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114804 ?auto_114803 ) ( ON-TABLE ?auto_114802 ) ( ON ?auto_114803 ?auto_114802 ) ( not ( = ?auto_114802 ?auto_114803 ) ) ( not ( = ?auto_114802 ?auto_114804 ) ) ( not ( = ?auto_114803 ?auto_114804 ) ) ( not ( = ?auto_114802 ?auto_114807 ) ) ( not ( = ?auto_114802 ?auto_114806 ) ) ( not ( = ?auto_114803 ?auto_114807 ) ) ( not ( = ?auto_114803 ?auto_114806 ) ) ( not ( = ?auto_114804 ?auto_114807 ) ) ( not ( = ?auto_114804 ?auto_114806 ) ) ( not ( = ?auto_114807 ?auto_114806 ) ) ( ON ?auto_114807 ?auto_114804 ) ( not ( = ?auto_114808 ?auto_114805 ) ) ( not ( = ?auto_114808 ?auto_114806 ) ) ( not ( = ?auto_114805 ?auto_114806 ) ) ( not ( = ?auto_114802 ?auto_114805 ) ) ( not ( = ?auto_114802 ?auto_114808 ) ) ( not ( = ?auto_114803 ?auto_114805 ) ) ( not ( = ?auto_114803 ?auto_114808 ) ) ( not ( = ?auto_114804 ?auto_114805 ) ) ( not ( = ?auto_114804 ?auto_114808 ) ) ( not ( = ?auto_114807 ?auto_114805 ) ) ( not ( = ?auto_114807 ?auto_114808 ) ) ( ON ?auto_114806 ?auto_114807 ) ( ON ?auto_114805 ?auto_114806 ) ( ON ?auto_114808 ?auto_114805 ) ( CLEAR ?auto_114808 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_114802 ?auto_114803 ?auto_114804 ?auto_114807 ?auto_114806 ?auto_114805 )
      ( MAKE-2PILE ?auto_114802 ?auto_114803 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_114809 - BLOCK
      ?auto_114810 - BLOCK
    )
    :vars
    (
      ?auto_114815 - BLOCK
      ?auto_114811 - BLOCK
      ?auto_114813 - BLOCK
      ?auto_114814 - BLOCK
      ?auto_114812 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114815 ?auto_114810 ) ( ON-TABLE ?auto_114809 ) ( ON ?auto_114810 ?auto_114809 ) ( not ( = ?auto_114809 ?auto_114810 ) ) ( not ( = ?auto_114809 ?auto_114815 ) ) ( not ( = ?auto_114810 ?auto_114815 ) ) ( not ( = ?auto_114809 ?auto_114811 ) ) ( not ( = ?auto_114809 ?auto_114813 ) ) ( not ( = ?auto_114810 ?auto_114811 ) ) ( not ( = ?auto_114810 ?auto_114813 ) ) ( not ( = ?auto_114815 ?auto_114811 ) ) ( not ( = ?auto_114815 ?auto_114813 ) ) ( not ( = ?auto_114811 ?auto_114813 ) ) ( ON ?auto_114811 ?auto_114815 ) ( not ( = ?auto_114814 ?auto_114812 ) ) ( not ( = ?auto_114814 ?auto_114813 ) ) ( not ( = ?auto_114812 ?auto_114813 ) ) ( not ( = ?auto_114809 ?auto_114812 ) ) ( not ( = ?auto_114809 ?auto_114814 ) ) ( not ( = ?auto_114810 ?auto_114812 ) ) ( not ( = ?auto_114810 ?auto_114814 ) ) ( not ( = ?auto_114815 ?auto_114812 ) ) ( not ( = ?auto_114815 ?auto_114814 ) ) ( not ( = ?auto_114811 ?auto_114812 ) ) ( not ( = ?auto_114811 ?auto_114814 ) ) ( ON ?auto_114813 ?auto_114811 ) ( ON ?auto_114812 ?auto_114813 ) ( HOLDING ?auto_114814 ) ( CLEAR ?auto_114812 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_114809 ?auto_114810 ?auto_114815 ?auto_114811 ?auto_114813 ?auto_114812 ?auto_114814 )
      ( MAKE-2PILE ?auto_114809 ?auto_114810 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_114816 - BLOCK
      ?auto_114817 - BLOCK
    )
    :vars
    (
      ?auto_114819 - BLOCK
      ?auto_114818 - BLOCK
      ?auto_114822 - BLOCK
      ?auto_114820 - BLOCK
      ?auto_114821 - BLOCK
      ?auto_114823 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114819 ?auto_114817 ) ( ON-TABLE ?auto_114816 ) ( ON ?auto_114817 ?auto_114816 ) ( not ( = ?auto_114816 ?auto_114817 ) ) ( not ( = ?auto_114816 ?auto_114819 ) ) ( not ( = ?auto_114817 ?auto_114819 ) ) ( not ( = ?auto_114816 ?auto_114818 ) ) ( not ( = ?auto_114816 ?auto_114822 ) ) ( not ( = ?auto_114817 ?auto_114818 ) ) ( not ( = ?auto_114817 ?auto_114822 ) ) ( not ( = ?auto_114819 ?auto_114818 ) ) ( not ( = ?auto_114819 ?auto_114822 ) ) ( not ( = ?auto_114818 ?auto_114822 ) ) ( ON ?auto_114818 ?auto_114819 ) ( not ( = ?auto_114820 ?auto_114821 ) ) ( not ( = ?auto_114820 ?auto_114822 ) ) ( not ( = ?auto_114821 ?auto_114822 ) ) ( not ( = ?auto_114816 ?auto_114821 ) ) ( not ( = ?auto_114816 ?auto_114820 ) ) ( not ( = ?auto_114817 ?auto_114821 ) ) ( not ( = ?auto_114817 ?auto_114820 ) ) ( not ( = ?auto_114819 ?auto_114821 ) ) ( not ( = ?auto_114819 ?auto_114820 ) ) ( not ( = ?auto_114818 ?auto_114821 ) ) ( not ( = ?auto_114818 ?auto_114820 ) ) ( ON ?auto_114822 ?auto_114818 ) ( ON ?auto_114821 ?auto_114822 ) ( CLEAR ?auto_114821 ) ( ON ?auto_114820 ?auto_114823 ) ( CLEAR ?auto_114820 ) ( HAND-EMPTY ) ( not ( = ?auto_114816 ?auto_114823 ) ) ( not ( = ?auto_114817 ?auto_114823 ) ) ( not ( = ?auto_114819 ?auto_114823 ) ) ( not ( = ?auto_114818 ?auto_114823 ) ) ( not ( = ?auto_114822 ?auto_114823 ) ) ( not ( = ?auto_114820 ?auto_114823 ) ) ( not ( = ?auto_114821 ?auto_114823 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_114820 ?auto_114823 )
      ( MAKE-2PILE ?auto_114816 ?auto_114817 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_114824 - BLOCK
      ?auto_114825 - BLOCK
    )
    :vars
    (
      ?auto_114829 - BLOCK
      ?auto_114831 - BLOCK
      ?auto_114830 - BLOCK
      ?auto_114826 - BLOCK
      ?auto_114828 - BLOCK
      ?auto_114827 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114829 ?auto_114825 ) ( ON-TABLE ?auto_114824 ) ( ON ?auto_114825 ?auto_114824 ) ( not ( = ?auto_114824 ?auto_114825 ) ) ( not ( = ?auto_114824 ?auto_114829 ) ) ( not ( = ?auto_114825 ?auto_114829 ) ) ( not ( = ?auto_114824 ?auto_114831 ) ) ( not ( = ?auto_114824 ?auto_114830 ) ) ( not ( = ?auto_114825 ?auto_114831 ) ) ( not ( = ?auto_114825 ?auto_114830 ) ) ( not ( = ?auto_114829 ?auto_114831 ) ) ( not ( = ?auto_114829 ?auto_114830 ) ) ( not ( = ?auto_114831 ?auto_114830 ) ) ( ON ?auto_114831 ?auto_114829 ) ( not ( = ?auto_114826 ?auto_114828 ) ) ( not ( = ?auto_114826 ?auto_114830 ) ) ( not ( = ?auto_114828 ?auto_114830 ) ) ( not ( = ?auto_114824 ?auto_114828 ) ) ( not ( = ?auto_114824 ?auto_114826 ) ) ( not ( = ?auto_114825 ?auto_114828 ) ) ( not ( = ?auto_114825 ?auto_114826 ) ) ( not ( = ?auto_114829 ?auto_114828 ) ) ( not ( = ?auto_114829 ?auto_114826 ) ) ( not ( = ?auto_114831 ?auto_114828 ) ) ( not ( = ?auto_114831 ?auto_114826 ) ) ( ON ?auto_114830 ?auto_114831 ) ( ON ?auto_114826 ?auto_114827 ) ( CLEAR ?auto_114826 ) ( not ( = ?auto_114824 ?auto_114827 ) ) ( not ( = ?auto_114825 ?auto_114827 ) ) ( not ( = ?auto_114829 ?auto_114827 ) ) ( not ( = ?auto_114831 ?auto_114827 ) ) ( not ( = ?auto_114830 ?auto_114827 ) ) ( not ( = ?auto_114826 ?auto_114827 ) ) ( not ( = ?auto_114828 ?auto_114827 ) ) ( HOLDING ?auto_114828 ) ( CLEAR ?auto_114830 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_114824 ?auto_114825 ?auto_114829 ?auto_114831 ?auto_114830 ?auto_114828 )
      ( MAKE-2PILE ?auto_114824 ?auto_114825 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_114832 - BLOCK
      ?auto_114833 - BLOCK
    )
    :vars
    (
      ?auto_114835 - BLOCK
      ?auto_114838 - BLOCK
      ?auto_114839 - BLOCK
      ?auto_114836 - BLOCK
      ?auto_114834 - BLOCK
      ?auto_114837 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114835 ?auto_114833 ) ( ON-TABLE ?auto_114832 ) ( ON ?auto_114833 ?auto_114832 ) ( not ( = ?auto_114832 ?auto_114833 ) ) ( not ( = ?auto_114832 ?auto_114835 ) ) ( not ( = ?auto_114833 ?auto_114835 ) ) ( not ( = ?auto_114832 ?auto_114838 ) ) ( not ( = ?auto_114832 ?auto_114839 ) ) ( not ( = ?auto_114833 ?auto_114838 ) ) ( not ( = ?auto_114833 ?auto_114839 ) ) ( not ( = ?auto_114835 ?auto_114838 ) ) ( not ( = ?auto_114835 ?auto_114839 ) ) ( not ( = ?auto_114838 ?auto_114839 ) ) ( ON ?auto_114838 ?auto_114835 ) ( not ( = ?auto_114836 ?auto_114834 ) ) ( not ( = ?auto_114836 ?auto_114839 ) ) ( not ( = ?auto_114834 ?auto_114839 ) ) ( not ( = ?auto_114832 ?auto_114834 ) ) ( not ( = ?auto_114832 ?auto_114836 ) ) ( not ( = ?auto_114833 ?auto_114834 ) ) ( not ( = ?auto_114833 ?auto_114836 ) ) ( not ( = ?auto_114835 ?auto_114834 ) ) ( not ( = ?auto_114835 ?auto_114836 ) ) ( not ( = ?auto_114838 ?auto_114834 ) ) ( not ( = ?auto_114838 ?auto_114836 ) ) ( ON ?auto_114839 ?auto_114838 ) ( ON ?auto_114836 ?auto_114837 ) ( not ( = ?auto_114832 ?auto_114837 ) ) ( not ( = ?auto_114833 ?auto_114837 ) ) ( not ( = ?auto_114835 ?auto_114837 ) ) ( not ( = ?auto_114838 ?auto_114837 ) ) ( not ( = ?auto_114839 ?auto_114837 ) ) ( not ( = ?auto_114836 ?auto_114837 ) ) ( not ( = ?auto_114834 ?auto_114837 ) ) ( CLEAR ?auto_114839 ) ( ON ?auto_114834 ?auto_114836 ) ( CLEAR ?auto_114834 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_114837 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_114837 ?auto_114836 )
      ( MAKE-2PILE ?auto_114832 ?auto_114833 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_114840 - BLOCK
      ?auto_114841 - BLOCK
    )
    :vars
    (
      ?auto_114842 - BLOCK
      ?auto_114846 - BLOCK
      ?auto_114844 - BLOCK
      ?auto_114845 - BLOCK
      ?auto_114843 - BLOCK
      ?auto_114847 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114842 ?auto_114841 ) ( ON-TABLE ?auto_114840 ) ( ON ?auto_114841 ?auto_114840 ) ( not ( = ?auto_114840 ?auto_114841 ) ) ( not ( = ?auto_114840 ?auto_114842 ) ) ( not ( = ?auto_114841 ?auto_114842 ) ) ( not ( = ?auto_114840 ?auto_114846 ) ) ( not ( = ?auto_114840 ?auto_114844 ) ) ( not ( = ?auto_114841 ?auto_114846 ) ) ( not ( = ?auto_114841 ?auto_114844 ) ) ( not ( = ?auto_114842 ?auto_114846 ) ) ( not ( = ?auto_114842 ?auto_114844 ) ) ( not ( = ?auto_114846 ?auto_114844 ) ) ( ON ?auto_114846 ?auto_114842 ) ( not ( = ?auto_114845 ?auto_114843 ) ) ( not ( = ?auto_114845 ?auto_114844 ) ) ( not ( = ?auto_114843 ?auto_114844 ) ) ( not ( = ?auto_114840 ?auto_114843 ) ) ( not ( = ?auto_114840 ?auto_114845 ) ) ( not ( = ?auto_114841 ?auto_114843 ) ) ( not ( = ?auto_114841 ?auto_114845 ) ) ( not ( = ?auto_114842 ?auto_114843 ) ) ( not ( = ?auto_114842 ?auto_114845 ) ) ( not ( = ?auto_114846 ?auto_114843 ) ) ( not ( = ?auto_114846 ?auto_114845 ) ) ( ON ?auto_114845 ?auto_114847 ) ( not ( = ?auto_114840 ?auto_114847 ) ) ( not ( = ?auto_114841 ?auto_114847 ) ) ( not ( = ?auto_114842 ?auto_114847 ) ) ( not ( = ?auto_114846 ?auto_114847 ) ) ( not ( = ?auto_114844 ?auto_114847 ) ) ( not ( = ?auto_114845 ?auto_114847 ) ) ( not ( = ?auto_114843 ?auto_114847 ) ) ( ON ?auto_114843 ?auto_114845 ) ( CLEAR ?auto_114843 ) ( ON-TABLE ?auto_114847 ) ( HOLDING ?auto_114844 ) ( CLEAR ?auto_114846 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_114840 ?auto_114841 ?auto_114842 ?auto_114846 ?auto_114844 )
      ( MAKE-2PILE ?auto_114840 ?auto_114841 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_114848 - BLOCK
      ?auto_114849 - BLOCK
    )
    :vars
    (
      ?auto_114855 - BLOCK
      ?auto_114851 - BLOCK
      ?auto_114850 - BLOCK
      ?auto_114853 - BLOCK
      ?auto_114854 - BLOCK
      ?auto_114852 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114855 ?auto_114849 ) ( ON-TABLE ?auto_114848 ) ( ON ?auto_114849 ?auto_114848 ) ( not ( = ?auto_114848 ?auto_114849 ) ) ( not ( = ?auto_114848 ?auto_114855 ) ) ( not ( = ?auto_114849 ?auto_114855 ) ) ( not ( = ?auto_114848 ?auto_114851 ) ) ( not ( = ?auto_114848 ?auto_114850 ) ) ( not ( = ?auto_114849 ?auto_114851 ) ) ( not ( = ?auto_114849 ?auto_114850 ) ) ( not ( = ?auto_114855 ?auto_114851 ) ) ( not ( = ?auto_114855 ?auto_114850 ) ) ( not ( = ?auto_114851 ?auto_114850 ) ) ( ON ?auto_114851 ?auto_114855 ) ( not ( = ?auto_114853 ?auto_114854 ) ) ( not ( = ?auto_114853 ?auto_114850 ) ) ( not ( = ?auto_114854 ?auto_114850 ) ) ( not ( = ?auto_114848 ?auto_114854 ) ) ( not ( = ?auto_114848 ?auto_114853 ) ) ( not ( = ?auto_114849 ?auto_114854 ) ) ( not ( = ?auto_114849 ?auto_114853 ) ) ( not ( = ?auto_114855 ?auto_114854 ) ) ( not ( = ?auto_114855 ?auto_114853 ) ) ( not ( = ?auto_114851 ?auto_114854 ) ) ( not ( = ?auto_114851 ?auto_114853 ) ) ( ON ?auto_114853 ?auto_114852 ) ( not ( = ?auto_114848 ?auto_114852 ) ) ( not ( = ?auto_114849 ?auto_114852 ) ) ( not ( = ?auto_114855 ?auto_114852 ) ) ( not ( = ?auto_114851 ?auto_114852 ) ) ( not ( = ?auto_114850 ?auto_114852 ) ) ( not ( = ?auto_114853 ?auto_114852 ) ) ( not ( = ?auto_114854 ?auto_114852 ) ) ( ON ?auto_114854 ?auto_114853 ) ( ON-TABLE ?auto_114852 ) ( CLEAR ?auto_114851 ) ( ON ?auto_114850 ?auto_114854 ) ( CLEAR ?auto_114850 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_114852 ?auto_114853 ?auto_114854 )
      ( MAKE-2PILE ?auto_114848 ?auto_114849 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_114856 - BLOCK
      ?auto_114857 - BLOCK
    )
    :vars
    (
      ?auto_114859 - BLOCK
      ?auto_114861 - BLOCK
      ?auto_114858 - BLOCK
      ?auto_114862 - BLOCK
      ?auto_114863 - BLOCK
      ?auto_114860 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114859 ?auto_114857 ) ( ON-TABLE ?auto_114856 ) ( ON ?auto_114857 ?auto_114856 ) ( not ( = ?auto_114856 ?auto_114857 ) ) ( not ( = ?auto_114856 ?auto_114859 ) ) ( not ( = ?auto_114857 ?auto_114859 ) ) ( not ( = ?auto_114856 ?auto_114861 ) ) ( not ( = ?auto_114856 ?auto_114858 ) ) ( not ( = ?auto_114857 ?auto_114861 ) ) ( not ( = ?auto_114857 ?auto_114858 ) ) ( not ( = ?auto_114859 ?auto_114861 ) ) ( not ( = ?auto_114859 ?auto_114858 ) ) ( not ( = ?auto_114861 ?auto_114858 ) ) ( not ( = ?auto_114862 ?auto_114863 ) ) ( not ( = ?auto_114862 ?auto_114858 ) ) ( not ( = ?auto_114863 ?auto_114858 ) ) ( not ( = ?auto_114856 ?auto_114863 ) ) ( not ( = ?auto_114856 ?auto_114862 ) ) ( not ( = ?auto_114857 ?auto_114863 ) ) ( not ( = ?auto_114857 ?auto_114862 ) ) ( not ( = ?auto_114859 ?auto_114863 ) ) ( not ( = ?auto_114859 ?auto_114862 ) ) ( not ( = ?auto_114861 ?auto_114863 ) ) ( not ( = ?auto_114861 ?auto_114862 ) ) ( ON ?auto_114862 ?auto_114860 ) ( not ( = ?auto_114856 ?auto_114860 ) ) ( not ( = ?auto_114857 ?auto_114860 ) ) ( not ( = ?auto_114859 ?auto_114860 ) ) ( not ( = ?auto_114861 ?auto_114860 ) ) ( not ( = ?auto_114858 ?auto_114860 ) ) ( not ( = ?auto_114862 ?auto_114860 ) ) ( not ( = ?auto_114863 ?auto_114860 ) ) ( ON ?auto_114863 ?auto_114862 ) ( ON-TABLE ?auto_114860 ) ( ON ?auto_114858 ?auto_114863 ) ( CLEAR ?auto_114858 ) ( HOLDING ?auto_114861 ) ( CLEAR ?auto_114859 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_114856 ?auto_114857 ?auto_114859 ?auto_114861 )
      ( MAKE-2PILE ?auto_114856 ?auto_114857 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_114864 - BLOCK
      ?auto_114865 - BLOCK
    )
    :vars
    (
      ?auto_114871 - BLOCK
      ?auto_114866 - BLOCK
      ?auto_114870 - BLOCK
      ?auto_114867 - BLOCK
      ?auto_114868 - BLOCK
      ?auto_114869 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114871 ?auto_114865 ) ( ON-TABLE ?auto_114864 ) ( ON ?auto_114865 ?auto_114864 ) ( not ( = ?auto_114864 ?auto_114865 ) ) ( not ( = ?auto_114864 ?auto_114871 ) ) ( not ( = ?auto_114865 ?auto_114871 ) ) ( not ( = ?auto_114864 ?auto_114866 ) ) ( not ( = ?auto_114864 ?auto_114870 ) ) ( not ( = ?auto_114865 ?auto_114866 ) ) ( not ( = ?auto_114865 ?auto_114870 ) ) ( not ( = ?auto_114871 ?auto_114866 ) ) ( not ( = ?auto_114871 ?auto_114870 ) ) ( not ( = ?auto_114866 ?auto_114870 ) ) ( not ( = ?auto_114867 ?auto_114868 ) ) ( not ( = ?auto_114867 ?auto_114870 ) ) ( not ( = ?auto_114868 ?auto_114870 ) ) ( not ( = ?auto_114864 ?auto_114868 ) ) ( not ( = ?auto_114864 ?auto_114867 ) ) ( not ( = ?auto_114865 ?auto_114868 ) ) ( not ( = ?auto_114865 ?auto_114867 ) ) ( not ( = ?auto_114871 ?auto_114868 ) ) ( not ( = ?auto_114871 ?auto_114867 ) ) ( not ( = ?auto_114866 ?auto_114868 ) ) ( not ( = ?auto_114866 ?auto_114867 ) ) ( ON ?auto_114867 ?auto_114869 ) ( not ( = ?auto_114864 ?auto_114869 ) ) ( not ( = ?auto_114865 ?auto_114869 ) ) ( not ( = ?auto_114871 ?auto_114869 ) ) ( not ( = ?auto_114866 ?auto_114869 ) ) ( not ( = ?auto_114870 ?auto_114869 ) ) ( not ( = ?auto_114867 ?auto_114869 ) ) ( not ( = ?auto_114868 ?auto_114869 ) ) ( ON ?auto_114868 ?auto_114867 ) ( ON-TABLE ?auto_114869 ) ( ON ?auto_114870 ?auto_114868 ) ( CLEAR ?auto_114871 ) ( ON ?auto_114866 ?auto_114870 ) ( CLEAR ?auto_114866 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_114869 ?auto_114867 ?auto_114868 ?auto_114870 )
      ( MAKE-2PILE ?auto_114864 ?auto_114865 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_114888 - BLOCK
      ?auto_114889 - BLOCK
    )
    :vars
    (
      ?auto_114893 - BLOCK
      ?auto_114894 - BLOCK
      ?auto_114891 - BLOCK
      ?auto_114892 - BLOCK
      ?auto_114890 - BLOCK
      ?auto_114895 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_114888 ) ( not ( = ?auto_114888 ?auto_114889 ) ) ( not ( = ?auto_114888 ?auto_114893 ) ) ( not ( = ?auto_114889 ?auto_114893 ) ) ( not ( = ?auto_114888 ?auto_114894 ) ) ( not ( = ?auto_114888 ?auto_114891 ) ) ( not ( = ?auto_114889 ?auto_114894 ) ) ( not ( = ?auto_114889 ?auto_114891 ) ) ( not ( = ?auto_114893 ?auto_114894 ) ) ( not ( = ?auto_114893 ?auto_114891 ) ) ( not ( = ?auto_114894 ?auto_114891 ) ) ( not ( = ?auto_114892 ?auto_114890 ) ) ( not ( = ?auto_114892 ?auto_114891 ) ) ( not ( = ?auto_114890 ?auto_114891 ) ) ( not ( = ?auto_114888 ?auto_114890 ) ) ( not ( = ?auto_114888 ?auto_114892 ) ) ( not ( = ?auto_114889 ?auto_114890 ) ) ( not ( = ?auto_114889 ?auto_114892 ) ) ( not ( = ?auto_114893 ?auto_114890 ) ) ( not ( = ?auto_114893 ?auto_114892 ) ) ( not ( = ?auto_114894 ?auto_114890 ) ) ( not ( = ?auto_114894 ?auto_114892 ) ) ( ON ?auto_114892 ?auto_114895 ) ( not ( = ?auto_114888 ?auto_114895 ) ) ( not ( = ?auto_114889 ?auto_114895 ) ) ( not ( = ?auto_114893 ?auto_114895 ) ) ( not ( = ?auto_114894 ?auto_114895 ) ) ( not ( = ?auto_114891 ?auto_114895 ) ) ( not ( = ?auto_114892 ?auto_114895 ) ) ( not ( = ?auto_114890 ?auto_114895 ) ) ( ON ?auto_114890 ?auto_114892 ) ( ON-TABLE ?auto_114895 ) ( ON ?auto_114891 ?auto_114890 ) ( ON ?auto_114894 ?auto_114891 ) ( ON ?auto_114893 ?auto_114894 ) ( CLEAR ?auto_114893 ) ( HOLDING ?auto_114889 ) ( CLEAR ?auto_114888 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_114888 ?auto_114889 ?auto_114893 )
      ( MAKE-2PILE ?auto_114888 ?auto_114889 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_114896 - BLOCK
      ?auto_114897 - BLOCK
    )
    :vars
    (
      ?auto_114900 - BLOCK
      ?auto_114903 - BLOCK
      ?auto_114898 - BLOCK
      ?auto_114899 - BLOCK
      ?auto_114901 - BLOCK
      ?auto_114902 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_114896 ) ( not ( = ?auto_114896 ?auto_114897 ) ) ( not ( = ?auto_114896 ?auto_114900 ) ) ( not ( = ?auto_114897 ?auto_114900 ) ) ( not ( = ?auto_114896 ?auto_114903 ) ) ( not ( = ?auto_114896 ?auto_114898 ) ) ( not ( = ?auto_114897 ?auto_114903 ) ) ( not ( = ?auto_114897 ?auto_114898 ) ) ( not ( = ?auto_114900 ?auto_114903 ) ) ( not ( = ?auto_114900 ?auto_114898 ) ) ( not ( = ?auto_114903 ?auto_114898 ) ) ( not ( = ?auto_114899 ?auto_114901 ) ) ( not ( = ?auto_114899 ?auto_114898 ) ) ( not ( = ?auto_114901 ?auto_114898 ) ) ( not ( = ?auto_114896 ?auto_114901 ) ) ( not ( = ?auto_114896 ?auto_114899 ) ) ( not ( = ?auto_114897 ?auto_114901 ) ) ( not ( = ?auto_114897 ?auto_114899 ) ) ( not ( = ?auto_114900 ?auto_114901 ) ) ( not ( = ?auto_114900 ?auto_114899 ) ) ( not ( = ?auto_114903 ?auto_114901 ) ) ( not ( = ?auto_114903 ?auto_114899 ) ) ( ON ?auto_114899 ?auto_114902 ) ( not ( = ?auto_114896 ?auto_114902 ) ) ( not ( = ?auto_114897 ?auto_114902 ) ) ( not ( = ?auto_114900 ?auto_114902 ) ) ( not ( = ?auto_114903 ?auto_114902 ) ) ( not ( = ?auto_114898 ?auto_114902 ) ) ( not ( = ?auto_114899 ?auto_114902 ) ) ( not ( = ?auto_114901 ?auto_114902 ) ) ( ON ?auto_114901 ?auto_114899 ) ( ON-TABLE ?auto_114902 ) ( ON ?auto_114898 ?auto_114901 ) ( ON ?auto_114903 ?auto_114898 ) ( ON ?auto_114900 ?auto_114903 ) ( CLEAR ?auto_114896 ) ( ON ?auto_114897 ?auto_114900 ) ( CLEAR ?auto_114897 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_114902 ?auto_114899 ?auto_114901 ?auto_114898 ?auto_114903 ?auto_114900 )
      ( MAKE-2PILE ?auto_114896 ?auto_114897 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_114904 - BLOCK
      ?auto_114905 - BLOCK
    )
    :vars
    (
      ?auto_114906 - BLOCK
      ?auto_114907 - BLOCK
      ?auto_114908 - BLOCK
      ?auto_114911 - BLOCK
      ?auto_114909 - BLOCK
      ?auto_114910 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114904 ?auto_114905 ) ) ( not ( = ?auto_114904 ?auto_114906 ) ) ( not ( = ?auto_114905 ?auto_114906 ) ) ( not ( = ?auto_114904 ?auto_114907 ) ) ( not ( = ?auto_114904 ?auto_114908 ) ) ( not ( = ?auto_114905 ?auto_114907 ) ) ( not ( = ?auto_114905 ?auto_114908 ) ) ( not ( = ?auto_114906 ?auto_114907 ) ) ( not ( = ?auto_114906 ?auto_114908 ) ) ( not ( = ?auto_114907 ?auto_114908 ) ) ( not ( = ?auto_114911 ?auto_114909 ) ) ( not ( = ?auto_114911 ?auto_114908 ) ) ( not ( = ?auto_114909 ?auto_114908 ) ) ( not ( = ?auto_114904 ?auto_114909 ) ) ( not ( = ?auto_114904 ?auto_114911 ) ) ( not ( = ?auto_114905 ?auto_114909 ) ) ( not ( = ?auto_114905 ?auto_114911 ) ) ( not ( = ?auto_114906 ?auto_114909 ) ) ( not ( = ?auto_114906 ?auto_114911 ) ) ( not ( = ?auto_114907 ?auto_114909 ) ) ( not ( = ?auto_114907 ?auto_114911 ) ) ( ON ?auto_114911 ?auto_114910 ) ( not ( = ?auto_114904 ?auto_114910 ) ) ( not ( = ?auto_114905 ?auto_114910 ) ) ( not ( = ?auto_114906 ?auto_114910 ) ) ( not ( = ?auto_114907 ?auto_114910 ) ) ( not ( = ?auto_114908 ?auto_114910 ) ) ( not ( = ?auto_114911 ?auto_114910 ) ) ( not ( = ?auto_114909 ?auto_114910 ) ) ( ON ?auto_114909 ?auto_114911 ) ( ON-TABLE ?auto_114910 ) ( ON ?auto_114908 ?auto_114909 ) ( ON ?auto_114907 ?auto_114908 ) ( ON ?auto_114906 ?auto_114907 ) ( ON ?auto_114905 ?auto_114906 ) ( CLEAR ?auto_114905 ) ( HOLDING ?auto_114904 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_114904 )
      ( MAKE-2PILE ?auto_114904 ?auto_114905 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_114912 - BLOCK
      ?auto_114913 - BLOCK
    )
    :vars
    (
      ?auto_114917 - BLOCK
      ?auto_114919 - BLOCK
      ?auto_114914 - BLOCK
      ?auto_114918 - BLOCK
      ?auto_114915 - BLOCK
      ?auto_114916 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114912 ?auto_114913 ) ) ( not ( = ?auto_114912 ?auto_114917 ) ) ( not ( = ?auto_114913 ?auto_114917 ) ) ( not ( = ?auto_114912 ?auto_114919 ) ) ( not ( = ?auto_114912 ?auto_114914 ) ) ( not ( = ?auto_114913 ?auto_114919 ) ) ( not ( = ?auto_114913 ?auto_114914 ) ) ( not ( = ?auto_114917 ?auto_114919 ) ) ( not ( = ?auto_114917 ?auto_114914 ) ) ( not ( = ?auto_114919 ?auto_114914 ) ) ( not ( = ?auto_114918 ?auto_114915 ) ) ( not ( = ?auto_114918 ?auto_114914 ) ) ( not ( = ?auto_114915 ?auto_114914 ) ) ( not ( = ?auto_114912 ?auto_114915 ) ) ( not ( = ?auto_114912 ?auto_114918 ) ) ( not ( = ?auto_114913 ?auto_114915 ) ) ( not ( = ?auto_114913 ?auto_114918 ) ) ( not ( = ?auto_114917 ?auto_114915 ) ) ( not ( = ?auto_114917 ?auto_114918 ) ) ( not ( = ?auto_114919 ?auto_114915 ) ) ( not ( = ?auto_114919 ?auto_114918 ) ) ( ON ?auto_114918 ?auto_114916 ) ( not ( = ?auto_114912 ?auto_114916 ) ) ( not ( = ?auto_114913 ?auto_114916 ) ) ( not ( = ?auto_114917 ?auto_114916 ) ) ( not ( = ?auto_114919 ?auto_114916 ) ) ( not ( = ?auto_114914 ?auto_114916 ) ) ( not ( = ?auto_114918 ?auto_114916 ) ) ( not ( = ?auto_114915 ?auto_114916 ) ) ( ON ?auto_114915 ?auto_114918 ) ( ON-TABLE ?auto_114916 ) ( ON ?auto_114914 ?auto_114915 ) ( ON ?auto_114919 ?auto_114914 ) ( ON ?auto_114917 ?auto_114919 ) ( ON ?auto_114913 ?auto_114917 ) ( ON ?auto_114912 ?auto_114913 ) ( CLEAR ?auto_114912 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_114916 ?auto_114918 ?auto_114915 ?auto_114914 ?auto_114919 ?auto_114917 ?auto_114913 )
      ( MAKE-2PILE ?auto_114912 ?auto_114913 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_114925 - BLOCK
      ?auto_114926 - BLOCK
      ?auto_114927 - BLOCK
      ?auto_114928 - BLOCK
      ?auto_114929 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_114929 ) ( CLEAR ?auto_114928 ) ( ON-TABLE ?auto_114925 ) ( ON ?auto_114926 ?auto_114925 ) ( ON ?auto_114927 ?auto_114926 ) ( ON ?auto_114928 ?auto_114927 ) ( not ( = ?auto_114925 ?auto_114926 ) ) ( not ( = ?auto_114925 ?auto_114927 ) ) ( not ( = ?auto_114925 ?auto_114928 ) ) ( not ( = ?auto_114925 ?auto_114929 ) ) ( not ( = ?auto_114926 ?auto_114927 ) ) ( not ( = ?auto_114926 ?auto_114928 ) ) ( not ( = ?auto_114926 ?auto_114929 ) ) ( not ( = ?auto_114927 ?auto_114928 ) ) ( not ( = ?auto_114927 ?auto_114929 ) ) ( not ( = ?auto_114928 ?auto_114929 ) ) )
    :subtasks
    ( ( !STACK ?auto_114929 ?auto_114928 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_114930 - BLOCK
      ?auto_114931 - BLOCK
      ?auto_114932 - BLOCK
      ?auto_114933 - BLOCK
      ?auto_114934 - BLOCK
    )
    :vars
    (
      ?auto_114935 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_114933 ) ( ON-TABLE ?auto_114930 ) ( ON ?auto_114931 ?auto_114930 ) ( ON ?auto_114932 ?auto_114931 ) ( ON ?auto_114933 ?auto_114932 ) ( not ( = ?auto_114930 ?auto_114931 ) ) ( not ( = ?auto_114930 ?auto_114932 ) ) ( not ( = ?auto_114930 ?auto_114933 ) ) ( not ( = ?auto_114930 ?auto_114934 ) ) ( not ( = ?auto_114931 ?auto_114932 ) ) ( not ( = ?auto_114931 ?auto_114933 ) ) ( not ( = ?auto_114931 ?auto_114934 ) ) ( not ( = ?auto_114932 ?auto_114933 ) ) ( not ( = ?auto_114932 ?auto_114934 ) ) ( not ( = ?auto_114933 ?auto_114934 ) ) ( ON ?auto_114934 ?auto_114935 ) ( CLEAR ?auto_114934 ) ( HAND-EMPTY ) ( not ( = ?auto_114930 ?auto_114935 ) ) ( not ( = ?auto_114931 ?auto_114935 ) ) ( not ( = ?auto_114932 ?auto_114935 ) ) ( not ( = ?auto_114933 ?auto_114935 ) ) ( not ( = ?auto_114934 ?auto_114935 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_114934 ?auto_114935 )
      ( MAKE-5PILE ?auto_114930 ?auto_114931 ?auto_114932 ?auto_114933 ?auto_114934 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_114936 - BLOCK
      ?auto_114937 - BLOCK
      ?auto_114938 - BLOCK
      ?auto_114939 - BLOCK
      ?auto_114940 - BLOCK
    )
    :vars
    (
      ?auto_114941 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_114936 ) ( ON ?auto_114937 ?auto_114936 ) ( ON ?auto_114938 ?auto_114937 ) ( not ( = ?auto_114936 ?auto_114937 ) ) ( not ( = ?auto_114936 ?auto_114938 ) ) ( not ( = ?auto_114936 ?auto_114939 ) ) ( not ( = ?auto_114936 ?auto_114940 ) ) ( not ( = ?auto_114937 ?auto_114938 ) ) ( not ( = ?auto_114937 ?auto_114939 ) ) ( not ( = ?auto_114937 ?auto_114940 ) ) ( not ( = ?auto_114938 ?auto_114939 ) ) ( not ( = ?auto_114938 ?auto_114940 ) ) ( not ( = ?auto_114939 ?auto_114940 ) ) ( ON ?auto_114940 ?auto_114941 ) ( CLEAR ?auto_114940 ) ( not ( = ?auto_114936 ?auto_114941 ) ) ( not ( = ?auto_114937 ?auto_114941 ) ) ( not ( = ?auto_114938 ?auto_114941 ) ) ( not ( = ?auto_114939 ?auto_114941 ) ) ( not ( = ?auto_114940 ?auto_114941 ) ) ( HOLDING ?auto_114939 ) ( CLEAR ?auto_114938 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_114936 ?auto_114937 ?auto_114938 ?auto_114939 )
      ( MAKE-5PILE ?auto_114936 ?auto_114937 ?auto_114938 ?auto_114939 ?auto_114940 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_114942 - BLOCK
      ?auto_114943 - BLOCK
      ?auto_114944 - BLOCK
      ?auto_114945 - BLOCK
      ?auto_114946 - BLOCK
    )
    :vars
    (
      ?auto_114947 - BLOCK
      ?auto_114948 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_114942 ) ( ON ?auto_114943 ?auto_114942 ) ( ON ?auto_114944 ?auto_114943 ) ( not ( = ?auto_114942 ?auto_114943 ) ) ( not ( = ?auto_114942 ?auto_114944 ) ) ( not ( = ?auto_114942 ?auto_114945 ) ) ( not ( = ?auto_114942 ?auto_114946 ) ) ( not ( = ?auto_114943 ?auto_114944 ) ) ( not ( = ?auto_114943 ?auto_114945 ) ) ( not ( = ?auto_114943 ?auto_114946 ) ) ( not ( = ?auto_114944 ?auto_114945 ) ) ( not ( = ?auto_114944 ?auto_114946 ) ) ( not ( = ?auto_114945 ?auto_114946 ) ) ( ON ?auto_114946 ?auto_114947 ) ( not ( = ?auto_114942 ?auto_114947 ) ) ( not ( = ?auto_114943 ?auto_114947 ) ) ( not ( = ?auto_114944 ?auto_114947 ) ) ( not ( = ?auto_114945 ?auto_114947 ) ) ( not ( = ?auto_114946 ?auto_114947 ) ) ( CLEAR ?auto_114944 ) ( ON ?auto_114945 ?auto_114946 ) ( CLEAR ?auto_114945 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_114948 ) ( ON ?auto_114947 ?auto_114948 ) ( not ( = ?auto_114948 ?auto_114947 ) ) ( not ( = ?auto_114948 ?auto_114946 ) ) ( not ( = ?auto_114948 ?auto_114945 ) ) ( not ( = ?auto_114942 ?auto_114948 ) ) ( not ( = ?auto_114943 ?auto_114948 ) ) ( not ( = ?auto_114944 ?auto_114948 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_114948 ?auto_114947 ?auto_114946 )
      ( MAKE-5PILE ?auto_114942 ?auto_114943 ?auto_114944 ?auto_114945 ?auto_114946 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_114949 - BLOCK
      ?auto_114950 - BLOCK
      ?auto_114951 - BLOCK
      ?auto_114952 - BLOCK
      ?auto_114953 - BLOCK
    )
    :vars
    (
      ?auto_114955 - BLOCK
      ?auto_114954 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_114949 ) ( ON ?auto_114950 ?auto_114949 ) ( not ( = ?auto_114949 ?auto_114950 ) ) ( not ( = ?auto_114949 ?auto_114951 ) ) ( not ( = ?auto_114949 ?auto_114952 ) ) ( not ( = ?auto_114949 ?auto_114953 ) ) ( not ( = ?auto_114950 ?auto_114951 ) ) ( not ( = ?auto_114950 ?auto_114952 ) ) ( not ( = ?auto_114950 ?auto_114953 ) ) ( not ( = ?auto_114951 ?auto_114952 ) ) ( not ( = ?auto_114951 ?auto_114953 ) ) ( not ( = ?auto_114952 ?auto_114953 ) ) ( ON ?auto_114953 ?auto_114955 ) ( not ( = ?auto_114949 ?auto_114955 ) ) ( not ( = ?auto_114950 ?auto_114955 ) ) ( not ( = ?auto_114951 ?auto_114955 ) ) ( not ( = ?auto_114952 ?auto_114955 ) ) ( not ( = ?auto_114953 ?auto_114955 ) ) ( ON ?auto_114952 ?auto_114953 ) ( CLEAR ?auto_114952 ) ( ON-TABLE ?auto_114954 ) ( ON ?auto_114955 ?auto_114954 ) ( not ( = ?auto_114954 ?auto_114955 ) ) ( not ( = ?auto_114954 ?auto_114953 ) ) ( not ( = ?auto_114954 ?auto_114952 ) ) ( not ( = ?auto_114949 ?auto_114954 ) ) ( not ( = ?auto_114950 ?auto_114954 ) ) ( not ( = ?auto_114951 ?auto_114954 ) ) ( HOLDING ?auto_114951 ) ( CLEAR ?auto_114950 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_114949 ?auto_114950 ?auto_114951 )
      ( MAKE-5PILE ?auto_114949 ?auto_114950 ?auto_114951 ?auto_114952 ?auto_114953 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_114956 - BLOCK
      ?auto_114957 - BLOCK
      ?auto_114958 - BLOCK
      ?auto_114959 - BLOCK
      ?auto_114960 - BLOCK
    )
    :vars
    (
      ?auto_114962 - BLOCK
      ?auto_114961 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_114956 ) ( ON ?auto_114957 ?auto_114956 ) ( not ( = ?auto_114956 ?auto_114957 ) ) ( not ( = ?auto_114956 ?auto_114958 ) ) ( not ( = ?auto_114956 ?auto_114959 ) ) ( not ( = ?auto_114956 ?auto_114960 ) ) ( not ( = ?auto_114957 ?auto_114958 ) ) ( not ( = ?auto_114957 ?auto_114959 ) ) ( not ( = ?auto_114957 ?auto_114960 ) ) ( not ( = ?auto_114958 ?auto_114959 ) ) ( not ( = ?auto_114958 ?auto_114960 ) ) ( not ( = ?auto_114959 ?auto_114960 ) ) ( ON ?auto_114960 ?auto_114962 ) ( not ( = ?auto_114956 ?auto_114962 ) ) ( not ( = ?auto_114957 ?auto_114962 ) ) ( not ( = ?auto_114958 ?auto_114962 ) ) ( not ( = ?auto_114959 ?auto_114962 ) ) ( not ( = ?auto_114960 ?auto_114962 ) ) ( ON ?auto_114959 ?auto_114960 ) ( ON-TABLE ?auto_114961 ) ( ON ?auto_114962 ?auto_114961 ) ( not ( = ?auto_114961 ?auto_114962 ) ) ( not ( = ?auto_114961 ?auto_114960 ) ) ( not ( = ?auto_114961 ?auto_114959 ) ) ( not ( = ?auto_114956 ?auto_114961 ) ) ( not ( = ?auto_114957 ?auto_114961 ) ) ( not ( = ?auto_114958 ?auto_114961 ) ) ( CLEAR ?auto_114957 ) ( ON ?auto_114958 ?auto_114959 ) ( CLEAR ?auto_114958 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_114961 ?auto_114962 ?auto_114960 ?auto_114959 )
      ( MAKE-5PILE ?auto_114956 ?auto_114957 ?auto_114958 ?auto_114959 ?auto_114960 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_114963 - BLOCK
      ?auto_114964 - BLOCK
      ?auto_114965 - BLOCK
      ?auto_114966 - BLOCK
      ?auto_114967 - BLOCK
    )
    :vars
    (
      ?auto_114968 - BLOCK
      ?auto_114969 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_114963 ) ( not ( = ?auto_114963 ?auto_114964 ) ) ( not ( = ?auto_114963 ?auto_114965 ) ) ( not ( = ?auto_114963 ?auto_114966 ) ) ( not ( = ?auto_114963 ?auto_114967 ) ) ( not ( = ?auto_114964 ?auto_114965 ) ) ( not ( = ?auto_114964 ?auto_114966 ) ) ( not ( = ?auto_114964 ?auto_114967 ) ) ( not ( = ?auto_114965 ?auto_114966 ) ) ( not ( = ?auto_114965 ?auto_114967 ) ) ( not ( = ?auto_114966 ?auto_114967 ) ) ( ON ?auto_114967 ?auto_114968 ) ( not ( = ?auto_114963 ?auto_114968 ) ) ( not ( = ?auto_114964 ?auto_114968 ) ) ( not ( = ?auto_114965 ?auto_114968 ) ) ( not ( = ?auto_114966 ?auto_114968 ) ) ( not ( = ?auto_114967 ?auto_114968 ) ) ( ON ?auto_114966 ?auto_114967 ) ( ON-TABLE ?auto_114969 ) ( ON ?auto_114968 ?auto_114969 ) ( not ( = ?auto_114969 ?auto_114968 ) ) ( not ( = ?auto_114969 ?auto_114967 ) ) ( not ( = ?auto_114969 ?auto_114966 ) ) ( not ( = ?auto_114963 ?auto_114969 ) ) ( not ( = ?auto_114964 ?auto_114969 ) ) ( not ( = ?auto_114965 ?auto_114969 ) ) ( ON ?auto_114965 ?auto_114966 ) ( CLEAR ?auto_114965 ) ( HOLDING ?auto_114964 ) ( CLEAR ?auto_114963 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_114963 ?auto_114964 )
      ( MAKE-5PILE ?auto_114963 ?auto_114964 ?auto_114965 ?auto_114966 ?auto_114967 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_114970 - BLOCK
      ?auto_114971 - BLOCK
      ?auto_114972 - BLOCK
      ?auto_114973 - BLOCK
      ?auto_114974 - BLOCK
    )
    :vars
    (
      ?auto_114975 - BLOCK
      ?auto_114976 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_114970 ) ( not ( = ?auto_114970 ?auto_114971 ) ) ( not ( = ?auto_114970 ?auto_114972 ) ) ( not ( = ?auto_114970 ?auto_114973 ) ) ( not ( = ?auto_114970 ?auto_114974 ) ) ( not ( = ?auto_114971 ?auto_114972 ) ) ( not ( = ?auto_114971 ?auto_114973 ) ) ( not ( = ?auto_114971 ?auto_114974 ) ) ( not ( = ?auto_114972 ?auto_114973 ) ) ( not ( = ?auto_114972 ?auto_114974 ) ) ( not ( = ?auto_114973 ?auto_114974 ) ) ( ON ?auto_114974 ?auto_114975 ) ( not ( = ?auto_114970 ?auto_114975 ) ) ( not ( = ?auto_114971 ?auto_114975 ) ) ( not ( = ?auto_114972 ?auto_114975 ) ) ( not ( = ?auto_114973 ?auto_114975 ) ) ( not ( = ?auto_114974 ?auto_114975 ) ) ( ON ?auto_114973 ?auto_114974 ) ( ON-TABLE ?auto_114976 ) ( ON ?auto_114975 ?auto_114976 ) ( not ( = ?auto_114976 ?auto_114975 ) ) ( not ( = ?auto_114976 ?auto_114974 ) ) ( not ( = ?auto_114976 ?auto_114973 ) ) ( not ( = ?auto_114970 ?auto_114976 ) ) ( not ( = ?auto_114971 ?auto_114976 ) ) ( not ( = ?auto_114972 ?auto_114976 ) ) ( ON ?auto_114972 ?auto_114973 ) ( CLEAR ?auto_114970 ) ( ON ?auto_114971 ?auto_114972 ) ( CLEAR ?auto_114971 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_114976 ?auto_114975 ?auto_114974 ?auto_114973 ?auto_114972 )
      ( MAKE-5PILE ?auto_114970 ?auto_114971 ?auto_114972 ?auto_114973 ?auto_114974 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_114977 - BLOCK
      ?auto_114978 - BLOCK
      ?auto_114979 - BLOCK
      ?auto_114980 - BLOCK
      ?auto_114981 - BLOCK
    )
    :vars
    (
      ?auto_114982 - BLOCK
      ?auto_114983 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114977 ?auto_114978 ) ) ( not ( = ?auto_114977 ?auto_114979 ) ) ( not ( = ?auto_114977 ?auto_114980 ) ) ( not ( = ?auto_114977 ?auto_114981 ) ) ( not ( = ?auto_114978 ?auto_114979 ) ) ( not ( = ?auto_114978 ?auto_114980 ) ) ( not ( = ?auto_114978 ?auto_114981 ) ) ( not ( = ?auto_114979 ?auto_114980 ) ) ( not ( = ?auto_114979 ?auto_114981 ) ) ( not ( = ?auto_114980 ?auto_114981 ) ) ( ON ?auto_114981 ?auto_114982 ) ( not ( = ?auto_114977 ?auto_114982 ) ) ( not ( = ?auto_114978 ?auto_114982 ) ) ( not ( = ?auto_114979 ?auto_114982 ) ) ( not ( = ?auto_114980 ?auto_114982 ) ) ( not ( = ?auto_114981 ?auto_114982 ) ) ( ON ?auto_114980 ?auto_114981 ) ( ON-TABLE ?auto_114983 ) ( ON ?auto_114982 ?auto_114983 ) ( not ( = ?auto_114983 ?auto_114982 ) ) ( not ( = ?auto_114983 ?auto_114981 ) ) ( not ( = ?auto_114983 ?auto_114980 ) ) ( not ( = ?auto_114977 ?auto_114983 ) ) ( not ( = ?auto_114978 ?auto_114983 ) ) ( not ( = ?auto_114979 ?auto_114983 ) ) ( ON ?auto_114979 ?auto_114980 ) ( ON ?auto_114978 ?auto_114979 ) ( CLEAR ?auto_114978 ) ( HOLDING ?auto_114977 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_114977 )
      ( MAKE-5PILE ?auto_114977 ?auto_114978 ?auto_114979 ?auto_114980 ?auto_114981 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_114984 - BLOCK
      ?auto_114985 - BLOCK
      ?auto_114986 - BLOCK
      ?auto_114987 - BLOCK
      ?auto_114988 - BLOCK
    )
    :vars
    (
      ?auto_114989 - BLOCK
      ?auto_114990 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114984 ?auto_114985 ) ) ( not ( = ?auto_114984 ?auto_114986 ) ) ( not ( = ?auto_114984 ?auto_114987 ) ) ( not ( = ?auto_114984 ?auto_114988 ) ) ( not ( = ?auto_114985 ?auto_114986 ) ) ( not ( = ?auto_114985 ?auto_114987 ) ) ( not ( = ?auto_114985 ?auto_114988 ) ) ( not ( = ?auto_114986 ?auto_114987 ) ) ( not ( = ?auto_114986 ?auto_114988 ) ) ( not ( = ?auto_114987 ?auto_114988 ) ) ( ON ?auto_114988 ?auto_114989 ) ( not ( = ?auto_114984 ?auto_114989 ) ) ( not ( = ?auto_114985 ?auto_114989 ) ) ( not ( = ?auto_114986 ?auto_114989 ) ) ( not ( = ?auto_114987 ?auto_114989 ) ) ( not ( = ?auto_114988 ?auto_114989 ) ) ( ON ?auto_114987 ?auto_114988 ) ( ON-TABLE ?auto_114990 ) ( ON ?auto_114989 ?auto_114990 ) ( not ( = ?auto_114990 ?auto_114989 ) ) ( not ( = ?auto_114990 ?auto_114988 ) ) ( not ( = ?auto_114990 ?auto_114987 ) ) ( not ( = ?auto_114984 ?auto_114990 ) ) ( not ( = ?auto_114985 ?auto_114990 ) ) ( not ( = ?auto_114986 ?auto_114990 ) ) ( ON ?auto_114986 ?auto_114987 ) ( ON ?auto_114985 ?auto_114986 ) ( ON ?auto_114984 ?auto_114985 ) ( CLEAR ?auto_114984 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_114990 ?auto_114989 ?auto_114988 ?auto_114987 ?auto_114986 ?auto_114985 )
      ( MAKE-5PILE ?auto_114984 ?auto_114985 ?auto_114986 ?auto_114987 ?auto_114988 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_114991 - BLOCK
      ?auto_114992 - BLOCK
      ?auto_114993 - BLOCK
      ?auto_114994 - BLOCK
      ?auto_114995 - BLOCK
    )
    :vars
    (
      ?auto_114996 - BLOCK
      ?auto_114997 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114991 ?auto_114992 ) ) ( not ( = ?auto_114991 ?auto_114993 ) ) ( not ( = ?auto_114991 ?auto_114994 ) ) ( not ( = ?auto_114991 ?auto_114995 ) ) ( not ( = ?auto_114992 ?auto_114993 ) ) ( not ( = ?auto_114992 ?auto_114994 ) ) ( not ( = ?auto_114992 ?auto_114995 ) ) ( not ( = ?auto_114993 ?auto_114994 ) ) ( not ( = ?auto_114993 ?auto_114995 ) ) ( not ( = ?auto_114994 ?auto_114995 ) ) ( ON ?auto_114995 ?auto_114996 ) ( not ( = ?auto_114991 ?auto_114996 ) ) ( not ( = ?auto_114992 ?auto_114996 ) ) ( not ( = ?auto_114993 ?auto_114996 ) ) ( not ( = ?auto_114994 ?auto_114996 ) ) ( not ( = ?auto_114995 ?auto_114996 ) ) ( ON ?auto_114994 ?auto_114995 ) ( ON-TABLE ?auto_114997 ) ( ON ?auto_114996 ?auto_114997 ) ( not ( = ?auto_114997 ?auto_114996 ) ) ( not ( = ?auto_114997 ?auto_114995 ) ) ( not ( = ?auto_114997 ?auto_114994 ) ) ( not ( = ?auto_114991 ?auto_114997 ) ) ( not ( = ?auto_114992 ?auto_114997 ) ) ( not ( = ?auto_114993 ?auto_114997 ) ) ( ON ?auto_114993 ?auto_114994 ) ( ON ?auto_114992 ?auto_114993 ) ( HOLDING ?auto_114991 ) ( CLEAR ?auto_114992 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_114997 ?auto_114996 ?auto_114995 ?auto_114994 ?auto_114993 ?auto_114992 ?auto_114991 )
      ( MAKE-5PILE ?auto_114991 ?auto_114992 ?auto_114993 ?auto_114994 ?auto_114995 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_114998 - BLOCK
      ?auto_114999 - BLOCK
      ?auto_115000 - BLOCK
      ?auto_115001 - BLOCK
      ?auto_115002 - BLOCK
    )
    :vars
    (
      ?auto_115003 - BLOCK
      ?auto_115004 - BLOCK
      ?auto_115005 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114998 ?auto_114999 ) ) ( not ( = ?auto_114998 ?auto_115000 ) ) ( not ( = ?auto_114998 ?auto_115001 ) ) ( not ( = ?auto_114998 ?auto_115002 ) ) ( not ( = ?auto_114999 ?auto_115000 ) ) ( not ( = ?auto_114999 ?auto_115001 ) ) ( not ( = ?auto_114999 ?auto_115002 ) ) ( not ( = ?auto_115000 ?auto_115001 ) ) ( not ( = ?auto_115000 ?auto_115002 ) ) ( not ( = ?auto_115001 ?auto_115002 ) ) ( ON ?auto_115002 ?auto_115003 ) ( not ( = ?auto_114998 ?auto_115003 ) ) ( not ( = ?auto_114999 ?auto_115003 ) ) ( not ( = ?auto_115000 ?auto_115003 ) ) ( not ( = ?auto_115001 ?auto_115003 ) ) ( not ( = ?auto_115002 ?auto_115003 ) ) ( ON ?auto_115001 ?auto_115002 ) ( ON-TABLE ?auto_115004 ) ( ON ?auto_115003 ?auto_115004 ) ( not ( = ?auto_115004 ?auto_115003 ) ) ( not ( = ?auto_115004 ?auto_115002 ) ) ( not ( = ?auto_115004 ?auto_115001 ) ) ( not ( = ?auto_114998 ?auto_115004 ) ) ( not ( = ?auto_114999 ?auto_115004 ) ) ( not ( = ?auto_115000 ?auto_115004 ) ) ( ON ?auto_115000 ?auto_115001 ) ( ON ?auto_114999 ?auto_115000 ) ( CLEAR ?auto_114999 ) ( ON ?auto_114998 ?auto_115005 ) ( CLEAR ?auto_114998 ) ( HAND-EMPTY ) ( not ( = ?auto_114998 ?auto_115005 ) ) ( not ( = ?auto_114999 ?auto_115005 ) ) ( not ( = ?auto_115000 ?auto_115005 ) ) ( not ( = ?auto_115001 ?auto_115005 ) ) ( not ( = ?auto_115002 ?auto_115005 ) ) ( not ( = ?auto_115003 ?auto_115005 ) ) ( not ( = ?auto_115004 ?auto_115005 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_114998 ?auto_115005 )
      ( MAKE-5PILE ?auto_114998 ?auto_114999 ?auto_115000 ?auto_115001 ?auto_115002 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_115006 - BLOCK
      ?auto_115007 - BLOCK
      ?auto_115008 - BLOCK
      ?auto_115009 - BLOCK
      ?auto_115010 - BLOCK
    )
    :vars
    (
      ?auto_115012 - BLOCK
      ?auto_115013 - BLOCK
      ?auto_115011 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115006 ?auto_115007 ) ) ( not ( = ?auto_115006 ?auto_115008 ) ) ( not ( = ?auto_115006 ?auto_115009 ) ) ( not ( = ?auto_115006 ?auto_115010 ) ) ( not ( = ?auto_115007 ?auto_115008 ) ) ( not ( = ?auto_115007 ?auto_115009 ) ) ( not ( = ?auto_115007 ?auto_115010 ) ) ( not ( = ?auto_115008 ?auto_115009 ) ) ( not ( = ?auto_115008 ?auto_115010 ) ) ( not ( = ?auto_115009 ?auto_115010 ) ) ( ON ?auto_115010 ?auto_115012 ) ( not ( = ?auto_115006 ?auto_115012 ) ) ( not ( = ?auto_115007 ?auto_115012 ) ) ( not ( = ?auto_115008 ?auto_115012 ) ) ( not ( = ?auto_115009 ?auto_115012 ) ) ( not ( = ?auto_115010 ?auto_115012 ) ) ( ON ?auto_115009 ?auto_115010 ) ( ON-TABLE ?auto_115013 ) ( ON ?auto_115012 ?auto_115013 ) ( not ( = ?auto_115013 ?auto_115012 ) ) ( not ( = ?auto_115013 ?auto_115010 ) ) ( not ( = ?auto_115013 ?auto_115009 ) ) ( not ( = ?auto_115006 ?auto_115013 ) ) ( not ( = ?auto_115007 ?auto_115013 ) ) ( not ( = ?auto_115008 ?auto_115013 ) ) ( ON ?auto_115008 ?auto_115009 ) ( ON ?auto_115006 ?auto_115011 ) ( CLEAR ?auto_115006 ) ( not ( = ?auto_115006 ?auto_115011 ) ) ( not ( = ?auto_115007 ?auto_115011 ) ) ( not ( = ?auto_115008 ?auto_115011 ) ) ( not ( = ?auto_115009 ?auto_115011 ) ) ( not ( = ?auto_115010 ?auto_115011 ) ) ( not ( = ?auto_115012 ?auto_115011 ) ) ( not ( = ?auto_115013 ?auto_115011 ) ) ( HOLDING ?auto_115007 ) ( CLEAR ?auto_115008 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_115013 ?auto_115012 ?auto_115010 ?auto_115009 ?auto_115008 ?auto_115007 )
      ( MAKE-5PILE ?auto_115006 ?auto_115007 ?auto_115008 ?auto_115009 ?auto_115010 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_115014 - BLOCK
      ?auto_115015 - BLOCK
      ?auto_115016 - BLOCK
      ?auto_115017 - BLOCK
      ?auto_115018 - BLOCK
    )
    :vars
    (
      ?auto_115021 - BLOCK
      ?auto_115019 - BLOCK
      ?auto_115020 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115014 ?auto_115015 ) ) ( not ( = ?auto_115014 ?auto_115016 ) ) ( not ( = ?auto_115014 ?auto_115017 ) ) ( not ( = ?auto_115014 ?auto_115018 ) ) ( not ( = ?auto_115015 ?auto_115016 ) ) ( not ( = ?auto_115015 ?auto_115017 ) ) ( not ( = ?auto_115015 ?auto_115018 ) ) ( not ( = ?auto_115016 ?auto_115017 ) ) ( not ( = ?auto_115016 ?auto_115018 ) ) ( not ( = ?auto_115017 ?auto_115018 ) ) ( ON ?auto_115018 ?auto_115021 ) ( not ( = ?auto_115014 ?auto_115021 ) ) ( not ( = ?auto_115015 ?auto_115021 ) ) ( not ( = ?auto_115016 ?auto_115021 ) ) ( not ( = ?auto_115017 ?auto_115021 ) ) ( not ( = ?auto_115018 ?auto_115021 ) ) ( ON ?auto_115017 ?auto_115018 ) ( ON-TABLE ?auto_115019 ) ( ON ?auto_115021 ?auto_115019 ) ( not ( = ?auto_115019 ?auto_115021 ) ) ( not ( = ?auto_115019 ?auto_115018 ) ) ( not ( = ?auto_115019 ?auto_115017 ) ) ( not ( = ?auto_115014 ?auto_115019 ) ) ( not ( = ?auto_115015 ?auto_115019 ) ) ( not ( = ?auto_115016 ?auto_115019 ) ) ( ON ?auto_115016 ?auto_115017 ) ( ON ?auto_115014 ?auto_115020 ) ( not ( = ?auto_115014 ?auto_115020 ) ) ( not ( = ?auto_115015 ?auto_115020 ) ) ( not ( = ?auto_115016 ?auto_115020 ) ) ( not ( = ?auto_115017 ?auto_115020 ) ) ( not ( = ?auto_115018 ?auto_115020 ) ) ( not ( = ?auto_115021 ?auto_115020 ) ) ( not ( = ?auto_115019 ?auto_115020 ) ) ( CLEAR ?auto_115016 ) ( ON ?auto_115015 ?auto_115014 ) ( CLEAR ?auto_115015 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_115020 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_115020 ?auto_115014 )
      ( MAKE-5PILE ?auto_115014 ?auto_115015 ?auto_115016 ?auto_115017 ?auto_115018 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_115022 - BLOCK
      ?auto_115023 - BLOCK
      ?auto_115024 - BLOCK
      ?auto_115025 - BLOCK
      ?auto_115026 - BLOCK
    )
    :vars
    (
      ?auto_115028 - BLOCK
      ?auto_115027 - BLOCK
      ?auto_115029 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115022 ?auto_115023 ) ) ( not ( = ?auto_115022 ?auto_115024 ) ) ( not ( = ?auto_115022 ?auto_115025 ) ) ( not ( = ?auto_115022 ?auto_115026 ) ) ( not ( = ?auto_115023 ?auto_115024 ) ) ( not ( = ?auto_115023 ?auto_115025 ) ) ( not ( = ?auto_115023 ?auto_115026 ) ) ( not ( = ?auto_115024 ?auto_115025 ) ) ( not ( = ?auto_115024 ?auto_115026 ) ) ( not ( = ?auto_115025 ?auto_115026 ) ) ( ON ?auto_115026 ?auto_115028 ) ( not ( = ?auto_115022 ?auto_115028 ) ) ( not ( = ?auto_115023 ?auto_115028 ) ) ( not ( = ?auto_115024 ?auto_115028 ) ) ( not ( = ?auto_115025 ?auto_115028 ) ) ( not ( = ?auto_115026 ?auto_115028 ) ) ( ON ?auto_115025 ?auto_115026 ) ( ON-TABLE ?auto_115027 ) ( ON ?auto_115028 ?auto_115027 ) ( not ( = ?auto_115027 ?auto_115028 ) ) ( not ( = ?auto_115027 ?auto_115026 ) ) ( not ( = ?auto_115027 ?auto_115025 ) ) ( not ( = ?auto_115022 ?auto_115027 ) ) ( not ( = ?auto_115023 ?auto_115027 ) ) ( not ( = ?auto_115024 ?auto_115027 ) ) ( ON ?auto_115022 ?auto_115029 ) ( not ( = ?auto_115022 ?auto_115029 ) ) ( not ( = ?auto_115023 ?auto_115029 ) ) ( not ( = ?auto_115024 ?auto_115029 ) ) ( not ( = ?auto_115025 ?auto_115029 ) ) ( not ( = ?auto_115026 ?auto_115029 ) ) ( not ( = ?auto_115028 ?auto_115029 ) ) ( not ( = ?auto_115027 ?auto_115029 ) ) ( ON ?auto_115023 ?auto_115022 ) ( CLEAR ?auto_115023 ) ( ON-TABLE ?auto_115029 ) ( HOLDING ?auto_115024 ) ( CLEAR ?auto_115025 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_115027 ?auto_115028 ?auto_115026 ?auto_115025 ?auto_115024 )
      ( MAKE-5PILE ?auto_115022 ?auto_115023 ?auto_115024 ?auto_115025 ?auto_115026 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_115030 - BLOCK
      ?auto_115031 - BLOCK
      ?auto_115032 - BLOCK
      ?auto_115033 - BLOCK
      ?auto_115034 - BLOCK
    )
    :vars
    (
      ?auto_115037 - BLOCK
      ?auto_115035 - BLOCK
      ?auto_115036 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115030 ?auto_115031 ) ) ( not ( = ?auto_115030 ?auto_115032 ) ) ( not ( = ?auto_115030 ?auto_115033 ) ) ( not ( = ?auto_115030 ?auto_115034 ) ) ( not ( = ?auto_115031 ?auto_115032 ) ) ( not ( = ?auto_115031 ?auto_115033 ) ) ( not ( = ?auto_115031 ?auto_115034 ) ) ( not ( = ?auto_115032 ?auto_115033 ) ) ( not ( = ?auto_115032 ?auto_115034 ) ) ( not ( = ?auto_115033 ?auto_115034 ) ) ( ON ?auto_115034 ?auto_115037 ) ( not ( = ?auto_115030 ?auto_115037 ) ) ( not ( = ?auto_115031 ?auto_115037 ) ) ( not ( = ?auto_115032 ?auto_115037 ) ) ( not ( = ?auto_115033 ?auto_115037 ) ) ( not ( = ?auto_115034 ?auto_115037 ) ) ( ON ?auto_115033 ?auto_115034 ) ( ON-TABLE ?auto_115035 ) ( ON ?auto_115037 ?auto_115035 ) ( not ( = ?auto_115035 ?auto_115037 ) ) ( not ( = ?auto_115035 ?auto_115034 ) ) ( not ( = ?auto_115035 ?auto_115033 ) ) ( not ( = ?auto_115030 ?auto_115035 ) ) ( not ( = ?auto_115031 ?auto_115035 ) ) ( not ( = ?auto_115032 ?auto_115035 ) ) ( ON ?auto_115030 ?auto_115036 ) ( not ( = ?auto_115030 ?auto_115036 ) ) ( not ( = ?auto_115031 ?auto_115036 ) ) ( not ( = ?auto_115032 ?auto_115036 ) ) ( not ( = ?auto_115033 ?auto_115036 ) ) ( not ( = ?auto_115034 ?auto_115036 ) ) ( not ( = ?auto_115037 ?auto_115036 ) ) ( not ( = ?auto_115035 ?auto_115036 ) ) ( ON ?auto_115031 ?auto_115030 ) ( ON-TABLE ?auto_115036 ) ( CLEAR ?auto_115033 ) ( ON ?auto_115032 ?auto_115031 ) ( CLEAR ?auto_115032 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_115036 ?auto_115030 ?auto_115031 )
      ( MAKE-5PILE ?auto_115030 ?auto_115031 ?auto_115032 ?auto_115033 ?auto_115034 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_115038 - BLOCK
      ?auto_115039 - BLOCK
      ?auto_115040 - BLOCK
      ?auto_115041 - BLOCK
      ?auto_115042 - BLOCK
    )
    :vars
    (
      ?auto_115043 - BLOCK
      ?auto_115044 - BLOCK
      ?auto_115045 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115038 ?auto_115039 ) ) ( not ( = ?auto_115038 ?auto_115040 ) ) ( not ( = ?auto_115038 ?auto_115041 ) ) ( not ( = ?auto_115038 ?auto_115042 ) ) ( not ( = ?auto_115039 ?auto_115040 ) ) ( not ( = ?auto_115039 ?auto_115041 ) ) ( not ( = ?auto_115039 ?auto_115042 ) ) ( not ( = ?auto_115040 ?auto_115041 ) ) ( not ( = ?auto_115040 ?auto_115042 ) ) ( not ( = ?auto_115041 ?auto_115042 ) ) ( ON ?auto_115042 ?auto_115043 ) ( not ( = ?auto_115038 ?auto_115043 ) ) ( not ( = ?auto_115039 ?auto_115043 ) ) ( not ( = ?auto_115040 ?auto_115043 ) ) ( not ( = ?auto_115041 ?auto_115043 ) ) ( not ( = ?auto_115042 ?auto_115043 ) ) ( ON-TABLE ?auto_115044 ) ( ON ?auto_115043 ?auto_115044 ) ( not ( = ?auto_115044 ?auto_115043 ) ) ( not ( = ?auto_115044 ?auto_115042 ) ) ( not ( = ?auto_115044 ?auto_115041 ) ) ( not ( = ?auto_115038 ?auto_115044 ) ) ( not ( = ?auto_115039 ?auto_115044 ) ) ( not ( = ?auto_115040 ?auto_115044 ) ) ( ON ?auto_115038 ?auto_115045 ) ( not ( = ?auto_115038 ?auto_115045 ) ) ( not ( = ?auto_115039 ?auto_115045 ) ) ( not ( = ?auto_115040 ?auto_115045 ) ) ( not ( = ?auto_115041 ?auto_115045 ) ) ( not ( = ?auto_115042 ?auto_115045 ) ) ( not ( = ?auto_115043 ?auto_115045 ) ) ( not ( = ?auto_115044 ?auto_115045 ) ) ( ON ?auto_115039 ?auto_115038 ) ( ON-TABLE ?auto_115045 ) ( ON ?auto_115040 ?auto_115039 ) ( CLEAR ?auto_115040 ) ( HOLDING ?auto_115041 ) ( CLEAR ?auto_115042 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_115044 ?auto_115043 ?auto_115042 ?auto_115041 )
      ( MAKE-5PILE ?auto_115038 ?auto_115039 ?auto_115040 ?auto_115041 ?auto_115042 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_115046 - BLOCK
      ?auto_115047 - BLOCK
      ?auto_115048 - BLOCK
      ?auto_115049 - BLOCK
      ?auto_115050 - BLOCK
    )
    :vars
    (
      ?auto_115051 - BLOCK
      ?auto_115053 - BLOCK
      ?auto_115052 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115046 ?auto_115047 ) ) ( not ( = ?auto_115046 ?auto_115048 ) ) ( not ( = ?auto_115046 ?auto_115049 ) ) ( not ( = ?auto_115046 ?auto_115050 ) ) ( not ( = ?auto_115047 ?auto_115048 ) ) ( not ( = ?auto_115047 ?auto_115049 ) ) ( not ( = ?auto_115047 ?auto_115050 ) ) ( not ( = ?auto_115048 ?auto_115049 ) ) ( not ( = ?auto_115048 ?auto_115050 ) ) ( not ( = ?auto_115049 ?auto_115050 ) ) ( ON ?auto_115050 ?auto_115051 ) ( not ( = ?auto_115046 ?auto_115051 ) ) ( not ( = ?auto_115047 ?auto_115051 ) ) ( not ( = ?auto_115048 ?auto_115051 ) ) ( not ( = ?auto_115049 ?auto_115051 ) ) ( not ( = ?auto_115050 ?auto_115051 ) ) ( ON-TABLE ?auto_115053 ) ( ON ?auto_115051 ?auto_115053 ) ( not ( = ?auto_115053 ?auto_115051 ) ) ( not ( = ?auto_115053 ?auto_115050 ) ) ( not ( = ?auto_115053 ?auto_115049 ) ) ( not ( = ?auto_115046 ?auto_115053 ) ) ( not ( = ?auto_115047 ?auto_115053 ) ) ( not ( = ?auto_115048 ?auto_115053 ) ) ( ON ?auto_115046 ?auto_115052 ) ( not ( = ?auto_115046 ?auto_115052 ) ) ( not ( = ?auto_115047 ?auto_115052 ) ) ( not ( = ?auto_115048 ?auto_115052 ) ) ( not ( = ?auto_115049 ?auto_115052 ) ) ( not ( = ?auto_115050 ?auto_115052 ) ) ( not ( = ?auto_115051 ?auto_115052 ) ) ( not ( = ?auto_115053 ?auto_115052 ) ) ( ON ?auto_115047 ?auto_115046 ) ( ON-TABLE ?auto_115052 ) ( ON ?auto_115048 ?auto_115047 ) ( CLEAR ?auto_115050 ) ( ON ?auto_115049 ?auto_115048 ) ( CLEAR ?auto_115049 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_115052 ?auto_115046 ?auto_115047 ?auto_115048 )
      ( MAKE-5PILE ?auto_115046 ?auto_115047 ?auto_115048 ?auto_115049 ?auto_115050 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_115054 - BLOCK
      ?auto_115055 - BLOCK
      ?auto_115056 - BLOCK
      ?auto_115057 - BLOCK
      ?auto_115058 - BLOCK
    )
    :vars
    (
      ?auto_115061 - BLOCK
      ?auto_115060 - BLOCK
      ?auto_115059 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115054 ?auto_115055 ) ) ( not ( = ?auto_115054 ?auto_115056 ) ) ( not ( = ?auto_115054 ?auto_115057 ) ) ( not ( = ?auto_115054 ?auto_115058 ) ) ( not ( = ?auto_115055 ?auto_115056 ) ) ( not ( = ?auto_115055 ?auto_115057 ) ) ( not ( = ?auto_115055 ?auto_115058 ) ) ( not ( = ?auto_115056 ?auto_115057 ) ) ( not ( = ?auto_115056 ?auto_115058 ) ) ( not ( = ?auto_115057 ?auto_115058 ) ) ( not ( = ?auto_115054 ?auto_115061 ) ) ( not ( = ?auto_115055 ?auto_115061 ) ) ( not ( = ?auto_115056 ?auto_115061 ) ) ( not ( = ?auto_115057 ?auto_115061 ) ) ( not ( = ?auto_115058 ?auto_115061 ) ) ( ON-TABLE ?auto_115060 ) ( ON ?auto_115061 ?auto_115060 ) ( not ( = ?auto_115060 ?auto_115061 ) ) ( not ( = ?auto_115060 ?auto_115058 ) ) ( not ( = ?auto_115060 ?auto_115057 ) ) ( not ( = ?auto_115054 ?auto_115060 ) ) ( not ( = ?auto_115055 ?auto_115060 ) ) ( not ( = ?auto_115056 ?auto_115060 ) ) ( ON ?auto_115054 ?auto_115059 ) ( not ( = ?auto_115054 ?auto_115059 ) ) ( not ( = ?auto_115055 ?auto_115059 ) ) ( not ( = ?auto_115056 ?auto_115059 ) ) ( not ( = ?auto_115057 ?auto_115059 ) ) ( not ( = ?auto_115058 ?auto_115059 ) ) ( not ( = ?auto_115061 ?auto_115059 ) ) ( not ( = ?auto_115060 ?auto_115059 ) ) ( ON ?auto_115055 ?auto_115054 ) ( ON-TABLE ?auto_115059 ) ( ON ?auto_115056 ?auto_115055 ) ( ON ?auto_115057 ?auto_115056 ) ( CLEAR ?auto_115057 ) ( HOLDING ?auto_115058 ) ( CLEAR ?auto_115061 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_115060 ?auto_115061 ?auto_115058 )
      ( MAKE-5PILE ?auto_115054 ?auto_115055 ?auto_115056 ?auto_115057 ?auto_115058 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_115062 - BLOCK
      ?auto_115063 - BLOCK
      ?auto_115064 - BLOCK
      ?auto_115065 - BLOCK
      ?auto_115066 - BLOCK
    )
    :vars
    (
      ?auto_115068 - BLOCK
      ?auto_115067 - BLOCK
      ?auto_115069 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115062 ?auto_115063 ) ) ( not ( = ?auto_115062 ?auto_115064 ) ) ( not ( = ?auto_115062 ?auto_115065 ) ) ( not ( = ?auto_115062 ?auto_115066 ) ) ( not ( = ?auto_115063 ?auto_115064 ) ) ( not ( = ?auto_115063 ?auto_115065 ) ) ( not ( = ?auto_115063 ?auto_115066 ) ) ( not ( = ?auto_115064 ?auto_115065 ) ) ( not ( = ?auto_115064 ?auto_115066 ) ) ( not ( = ?auto_115065 ?auto_115066 ) ) ( not ( = ?auto_115062 ?auto_115068 ) ) ( not ( = ?auto_115063 ?auto_115068 ) ) ( not ( = ?auto_115064 ?auto_115068 ) ) ( not ( = ?auto_115065 ?auto_115068 ) ) ( not ( = ?auto_115066 ?auto_115068 ) ) ( ON-TABLE ?auto_115067 ) ( ON ?auto_115068 ?auto_115067 ) ( not ( = ?auto_115067 ?auto_115068 ) ) ( not ( = ?auto_115067 ?auto_115066 ) ) ( not ( = ?auto_115067 ?auto_115065 ) ) ( not ( = ?auto_115062 ?auto_115067 ) ) ( not ( = ?auto_115063 ?auto_115067 ) ) ( not ( = ?auto_115064 ?auto_115067 ) ) ( ON ?auto_115062 ?auto_115069 ) ( not ( = ?auto_115062 ?auto_115069 ) ) ( not ( = ?auto_115063 ?auto_115069 ) ) ( not ( = ?auto_115064 ?auto_115069 ) ) ( not ( = ?auto_115065 ?auto_115069 ) ) ( not ( = ?auto_115066 ?auto_115069 ) ) ( not ( = ?auto_115068 ?auto_115069 ) ) ( not ( = ?auto_115067 ?auto_115069 ) ) ( ON ?auto_115063 ?auto_115062 ) ( ON-TABLE ?auto_115069 ) ( ON ?auto_115064 ?auto_115063 ) ( ON ?auto_115065 ?auto_115064 ) ( CLEAR ?auto_115068 ) ( ON ?auto_115066 ?auto_115065 ) ( CLEAR ?auto_115066 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_115069 ?auto_115062 ?auto_115063 ?auto_115064 ?auto_115065 )
      ( MAKE-5PILE ?auto_115062 ?auto_115063 ?auto_115064 ?auto_115065 ?auto_115066 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_115070 - BLOCK
      ?auto_115071 - BLOCK
      ?auto_115072 - BLOCK
      ?auto_115073 - BLOCK
      ?auto_115074 - BLOCK
    )
    :vars
    (
      ?auto_115075 - BLOCK
      ?auto_115076 - BLOCK
      ?auto_115077 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115070 ?auto_115071 ) ) ( not ( = ?auto_115070 ?auto_115072 ) ) ( not ( = ?auto_115070 ?auto_115073 ) ) ( not ( = ?auto_115070 ?auto_115074 ) ) ( not ( = ?auto_115071 ?auto_115072 ) ) ( not ( = ?auto_115071 ?auto_115073 ) ) ( not ( = ?auto_115071 ?auto_115074 ) ) ( not ( = ?auto_115072 ?auto_115073 ) ) ( not ( = ?auto_115072 ?auto_115074 ) ) ( not ( = ?auto_115073 ?auto_115074 ) ) ( not ( = ?auto_115070 ?auto_115075 ) ) ( not ( = ?auto_115071 ?auto_115075 ) ) ( not ( = ?auto_115072 ?auto_115075 ) ) ( not ( = ?auto_115073 ?auto_115075 ) ) ( not ( = ?auto_115074 ?auto_115075 ) ) ( ON-TABLE ?auto_115076 ) ( not ( = ?auto_115076 ?auto_115075 ) ) ( not ( = ?auto_115076 ?auto_115074 ) ) ( not ( = ?auto_115076 ?auto_115073 ) ) ( not ( = ?auto_115070 ?auto_115076 ) ) ( not ( = ?auto_115071 ?auto_115076 ) ) ( not ( = ?auto_115072 ?auto_115076 ) ) ( ON ?auto_115070 ?auto_115077 ) ( not ( = ?auto_115070 ?auto_115077 ) ) ( not ( = ?auto_115071 ?auto_115077 ) ) ( not ( = ?auto_115072 ?auto_115077 ) ) ( not ( = ?auto_115073 ?auto_115077 ) ) ( not ( = ?auto_115074 ?auto_115077 ) ) ( not ( = ?auto_115075 ?auto_115077 ) ) ( not ( = ?auto_115076 ?auto_115077 ) ) ( ON ?auto_115071 ?auto_115070 ) ( ON-TABLE ?auto_115077 ) ( ON ?auto_115072 ?auto_115071 ) ( ON ?auto_115073 ?auto_115072 ) ( ON ?auto_115074 ?auto_115073 ) ( CLEAR ?auto_115074 ) ( HOLDING ?auto_115075 ) ( CLEAR ?auto_115076 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_115076 ?auto_115075 )
      ( MAKE-5PILE ?auto_115070 ?auto_115071 ?auto_115072 ?auto_115073 ?auto_115074 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_115078 - BLOCK
      ?auto_115079 - BLOCK
      ?auto_115080 - BLOCK
      ?auto_115081 - BLOCK
      ?auto_115082 - BLOCK
    )
    :vars
    (
      ?auto_115085 - BLOCK
      ?auto_115083 - BLOCK
      ?auto_115084 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115078 ?auto_115079 ) ) ( not ( = ?auto_115078 ?auto_115080 ) ) ( not ( = ?auto_115078 ?auto_115081 ) ) ( not ( = ?auto_115078 ?auto_115082 ) ) ( not ( = ?auto_115079 ?auto_115080 ) ) ( not ( = ?auto_115079 ?auto_115081 ) ) ( not ( = ?auto_115079 ?auto_115082 ) ) ( not ( = ?auto_115080 ?auto_115081 ) ) ( not ( = ?auto_115080 ?auto_115082 ) ) ( not ( = ?auto_115081 ?auto_115082 ) ) ( not ( = ?auto_115078 ?auto_115085 ) ) ( not ( = ?auto_115079 ?auto_115085 ) ) ( not ( = ?auto_115080 ?auto_115085 ) ) ( not ( = ?auto_115081 ?auto_115085 ) ) ( not ( = ?auto_115082 ?auto_115085 ) ) ( ON-TABLE ?auto_115083 ) ( not ( = ?auto_115083 ?auto_115085 ) ) ( not ( = ?auto_115083 ?auto_115082 ) ) ( not ( = ?auto_115083 ?auto_115081 ) ) ( not ( = ?auto_115078 ?auto_115083 ) ) ( not ( = ?auto_115079 ?auto_115083 ) ) ( not ( = ?auto_115080 ?auto_115083 ) ) ( ON ?auto_115078 ?auto_115084 ) ( not ( = ?auto_115078 ?auto_115084 ) ) ( not ( = ?auto_115079 ?auto_115084 ) ) ( not ( = ?auto_115080 ?auto_115084 ) ) ( not ( = ?auto_115081 ?auto_115084 ) ) ( not ( = ?auto_115082 ?auto_115084 ) ) ( not ( = ?auto_115085 ?auto_115084 ) ) ( not ( = ?auto_115083 ?auto_115084 ) ) ( ON ?auto_115079 ?auto_115078 ) ( ON-TABLE ?auto_115084 ) ( ON ?auto_115080 ?auto_115079 ) ( ON ?auto_115081 ?auto_115080 ) ( ON ?auto_115082 ?auto_115081 ) ( CLEAR ?auto_115083 ) ( ON ?auto_115085 ?auto_115082 ) ( CLEAR ?auto_115085 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_115084 ?auto_115078 ?auto_115079 ?auto_115080 ?auto_115081 ?auto_115082 )
      ( MAKE-5PILE ?auto_115078 ?auto_115079 ?auto_115080 ?auto_115081 ?auto_115082 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_115086 - BLOCK
      ?auto_115087 - BLOCK
      ?auto_115088 - BLOCK
      ?auto_115089 - BLOCK
      ?auto_115090 - BLOCK
    )
    :vars
    (
      ?auto_115091 - BLOCK
      ?auto_115092 - BLOCK
      ?auto_115093 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115086 ?auto_115087 ) ) ( not ( = ?auto_115086 ?auto_115088 ) ) ( not ( = ?auto_115086 ?auto_115089 ) ) ( not ( = ?auto_115086 ?auto_115090 ) ) ( not ( = ?auto_115087 ?auto_115088 ) ) ( not ( = ?auto_115087 ?auto_115089 ) ) ( not ( = ?auto_115087 ?auto_115090 ) ) ( not ( = ?auto_115088 ?auto_115089 ) ) ( not ( = ?auto_115088 ?auto_115090 ) ) ( not ( = ?auto_115089 ?auto_115090 ) ) ( not ( = ?auto_115086 ?auto_115091 ) ) ( not ( = ?auto_115087 ?auto_115091 ) ) ( not ( = ?auto_115088 ?auto_115091 ) ) ( not ( = ?auto_115089 ?auto_115091 ) ) ( not ( = ?auto_115090 ?auto_115091 ) ) ( not ( = ?auto_115092 ?auto_115091 ) ) ( not ( = ?auto_115092 ?auto_115090 ) ) ( not ( = ?auto_115092 ?auto_115089 ) ) ( not ( = ?auto_115086 ?auto_115092 ) ) ( not ( = ?auto_115087 ?auto_115092 ) ) ( not ( = ?auto_115088 ?auto_115092 ) ) ( ON ?auto_115086 ?auto_115093 ) ( not ( = ?auto_115086 ?auto_115093 ) ) ( not ( = ?auto_115087 ?auto_115093 ) ) ( not ( = ?auto_115088 ?auto_115093 ) ) ( not ( = ?auto_115089 ?auto_115093 ) ) ( not ( = ?auto_115090 ?auto_115093 ) ) ( not ( = ?auto_115091 ?auto_115093 ) ) ( not ( = ?auto_115092 ?auto_115093 ) ) ( ON ?auto_115087 ?auto_115086 ) ( ON-TABLE ?auto_115093 ) ( ON ?auto_115088 ?auto_115087 ) ( ON ?auto_115089 ?auto_115088 ) ( ON ?auto_115090 ?auto_115089 ) ( ON ?auto_115091 ?auto_115090 ) ( CLEAR ?auto_115091 ) ( HOLDING ?auto_115092 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_115092 )
      ( MAKE-5PILE ?auto_115086 ?auto_115087 ?auto_115088 ?auto_115089 ?auto_115090 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_115094 - BLOCK
      ?auto_115095 - BLOCK
      ?auto_115096 - BLOCK
      ?auto_115097 - BLOCK
      ?auto_115098 - BLOCK
    )
    :vars
    (
      ?auto_115100 - BLOCK
      ?auto_115101 - BLOCK
      ?auto_115099 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115094 ?auto_115095 ) ) ( not ( = ?auto_115094 ?auto_115096 ) ) ( not ( = ?auto_115094 ?auto_115097 ) ) ( not ( = ?auto_115094 ?auto_115098 ) ) ( not ( = ?auto_115095 ?auto_115096 ) ) ( not ( = ?auto_115095 ?auto_115097 ) ) ( not ( = ?auto_115095 ?auto_115098 ) ) ( not ( = ?auto_115096 ?auto_115097 ) ) ( not ( = ?auto_115096 ?auto_115098 ) ) ( not ( = ?auto_115097 ?auto_115098 ) ) ( not ( = ?auto_115094 ?auto_115100 ) ) ( not ( = ?auto_115095 ?auto_115100 ) ) ( not ( = ?auto_115096 ?auto_115100 ) ) ( not ( = ?auto_115097 ?auto_115100 ) ) ( not ( = ?auto_115098 ?auto_115100 ) ) ( not ( = ?auto_115101 ?auto_115100 ) ) ( not ( = ?auto_115101 ?auto_115098 ) ) ( not ( = ?auto_115101 ?auto_115097 ) ) ( not ( = ?auto_115094 ?auto_115101 ) ) ( not ( = ?auto_115095 ?auto_115101 ) ) ( not ( = ?auto_115096 ?auto_115101 ) ) ( ON ?auto_115094 ?auto_115099 ) ( not ( = ?auto_115094 ?auto_115099 ) ) ( not ( = ?auto_115095 ?auto_115099 ) ) ( not ( = ?auto_115096 ?auto_115099 ) ) ( not ( = ?auto_115097 ?auto_115099 ) ) ( not ( = ?auto_115098 ?auto_115099 ) ) ( not ( = ?auto_115100 ?auto_115099 ) ) ( not ( = ?auto_115101 ?auto_115099 ) ) ( ON ?auto_115095 ?auto_115094 ) ( ON-TABLE ?auto_115099 ) ( ON ?auto_115096 ?auto_115095 ) ( ON ?auto_115097 ?auto_115096 ) ( ON ?auto_115098 ?auto_115097 ) ( ON ?auto_115100 ?auto_115098 ) ( ON ?auto_115101 ?auto_115100 ) ( CLEAR ?auto_115101 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_115099 ?auto_115094 ?auto_115095 ?auto_115096 ?auto_115097 ?auto_115098 ?auto_115100 )
      ( MAKE-5PILE ?auto_115094 ?auto_115095 ?auto_115096 ?auto_115097 ?auto_115098 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_115103 - BLOCK
    )
    :vars
    (
      ?auto_115104 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115104 ?auto_115103 ) ( CLEAR ?auto_115104 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_115103 ) ( not ( = ?auto_115103 ?auto_115104 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_115104 ?auto_115103 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_115105 - BLOCK
    )
    :vars
    (
      ?auto_115106 - BLOCK
      ?auto_115107 - BLOCK
      ?auto_115108 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115106 ?auto_115105 ) ( CLEAR ?auto_115106 ) ( ON-TABLE ?auto_115105 ) ( not ( = ?auto_115105 ?auto_115106 ) ) ( HOLDING ?auto_115107 ) ( CLEAR ?auto_115108 ) ( not ( = ?auto_115105 ?auto_115107 ) ) ( not ( = ?auto_115105 ?auto_115108 ) ) ( not ( = ?auto_115106 ?auto_115107 ) ) ( not ( = ?auto_115106 ?auto_115108 ) ) ( not ( = ?auto_115107 ?auto_115108 ) ) )
    :subtasks
    ( ( !STACK ?auto_115107 ?auto_115108 )
      ( MAKE-1PILE ?auto_115105 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_115109 - BLOCK
    )
    :vars
    (
      ?auto_115110 - BLOCK
      ?auto_115111 - BLOCK
      ?auto_115112 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115110 ?auto_115109 ) ( ON-TABLE ?auto_115109 ) ( not ( = ?auto_115109 ?auto_115110 ) ) ( CLEAR ?auto_115111 ) ( not ( = ?auto_115109 ?auto_115112 ) ) ( not ( = ?auto_115109 ?auto_115111 ) ) ( not ( = ?auto_115110 ?auto_115112 ) ) ( not ( = ?auto_115110 ?auto_115111 ) ) ( not ( = ?auto_115112 ?auto_115111 ) ) ( ON ?auto_115112 ?auto_115110 ) ( CLEAR ?auto_115112 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_115109 ?auto_115110 )
      ( MAKE-1PILE ?auto_115109 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_115113 - BLOCK
    )
    :vars
    (
      ?auto_115114 - BLOCK
      ?auto_115116 - BLOCK
      ?auto_115115 - BLOCK
      ?auto_115119 - BLOCK
      ?auto_115117 - BLOCK
      ?auto_115118 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115114 ?auto_115113 ) ( ON-TABLE ?auto_115113 ) ( not ( = ?auto_115113 ?auto_115114 ) ) ( not ( = ?auto_115113 ?auto_115116 ) ) ( not ( = ?auto_115113 ?auto_115115 ) ) ( not ( = ?auto_115114 ?auto_115116 ) ) ( not ( = ?auto_115114 ?auto_115115 ) ) ( not ( = ?auto_115116 ?auto_115115 ) ) ( ON ?auto_115116 ?auto_115114 ) ( CLEAR ?auto_115116 ) ( HOLDING ?auto_115115 ) ( CLEAR ?auto_115119 ) ( ON-TABLE ?auto_115117 ) ( ON ?auto_115118 ?auto_115117 ) ( ON ?auto_115119 ?auto_115118 ) ( not ( = ?auto_115117 ?auto_115118 ) ) ( not ( = ?auto_115117 ?auto_115119 ) ) ( not ( = ?auto_115117 ?auto_115115 ) ) ( not ( = ?auto_115118 ?auto_115119 ) ) ( not ( = ?auto_115118 ?auto_115115 ) ) ( not ( = ?auto_115119 ?auto_115115 ) ) ( not ( = ?auto_115113 ?auto_115119 ) ) ( not ( = ?auto_115113 ?auto_115117 ) ) ( not ( = ?auto_115113 ?auto_115118 ) ) ( not ( = ?auto_115114 ?auto_115119 ) ) ( not ( = ?auto_115114 ?auto_115117 ) ) ( not ( = ?auto_115114 ?auto_115118 ) ) ( not ( = ?auto_115116 ?auto_115119 ) ) ( not ( = ?auto_115116 ?auto_115117 ) ) ( not ( = ?auto_115116 ?auto_115118 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_115117 ?auto_115118 ?auto_115119 ?auto_115115 )
      ( MAKE-1PILE ?auto_115113 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_115120 - BLOCK
    )
    :vars
    (
      ?auto_115121 - BLOCK
      ?auto_115122 - BLOCK
      ?auto_115123 - BLOCK
      ?auto_115125 - BLOCK
      ?auto_115124 - BLOCK
      ?auto_115126 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115121 ?auto_115120 ) ( ON-TABLE ?auto_115120 ) ( not ( = ?auto_115120 ?auto_115121 ) ) ( not ( = ?auto_115120 ?auto_115122 ) ) ( not ( = ?auto_115120 ?auto_115123 ) ) ( not ( = ?auto_115121 ?auto_115122 ) ) ( not ( = ?auto_115121 ?auto_115123 ) ) ( not ( = ?auto_115122 ?auto_115123 ) ) ( ON ?auto_115122 ?auto_115121 ) ( CLEAR ?auto_115125 ) ( ON-TABLE ?auto_115124 ) ( ON ?auto_115126 ?auto_115124 ) ( ON ?auto_115125 ?auto_115126 ) ( not ( = ?auto_115124 ?auto_115126 ) ) ( not ( = ?auto_115124 ?auto_115125 ) ) ( not ( = ?auto_115124 ?auto_115123 ) ) ( not ( = ?auto_115126 ?auto_115125 ) ) ( not ( = ?auto_115126 ?auto_115123 ) ) ( not ( = ?auto_115125 ?auto_115123 ) ) ( not ( = ?auto_115120 ?auto_115125 ) ) ( not ( = ?auto_115120 ?auto_115124 ) ) ( not ( = ?auto_115120 ?auto_115126 ) ) ( not ( = ?auto_115121 ?auto_115125 ) ) ( not ( = ?auto_115121 ?auto_115124 ) ) ( not ( = ?auto_115121 ?auto_115126 ) ) ( not ( = ?auto_115122 ?auto_115125 ) ) ( not ( = ?auto_115122 ?auto_115124 ) ) ( not ( = ?auto_115122 ?auto_115126 ) ) ( ON ?auto_115123 ?auto_115122 ) ( CLEAR ?auto_115123 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_115120 ?auto_115121 ?auto_115122 )
      ( MAKE-1PILE ?auto_115120 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_115127 - BLOCK
    )
    :vars
    (
      ?auto_115133 - BLOCK
      ?auto_115129 - BLOCK
      ?auto_115128 - BLOCK
      ?auto_115130 - BLOCK
      ?auto_115131 - BLOCK
      ?auto_115132 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115133 ?auto_115127 ) ( ON-TABLE ?auto_115127 ) ( not ( = ?auto_115127 ?auto_115133 ) ) ( not ( = ?auto_115127 ?auto_115129 ) ) ( not ( = ?auto_115127 ?auto_115128 ) ) ( not ( = ?auto_115133 ?auto_115129 ) ) ( not ( = ?auto_115133 ?auto_115128 ) ) ( not ( = ?auto_115129 ?auto_115128 ) ) ( ON ?auto_115129 ?auto_115133 ) ( ON-TABLE ?auto_115130 ) ( ON ?auto_115131 ?auto_115130 ) ( not ( = ?auto_115130 ?auto_115131 ) ) ( not ( = ?auto_115130 ?auto_115132 ) ) ( not ( = ?auto_115130 ?auto_115128 ) ) ( not ( = ?auto_115131 ?auto_115132 ) ) ( not ( = ?auto_115131 ?auto_115128 ) ) ( not ( = ?auto_115132 ?auto_115128 ) ) ( not ( = ?auto_115127 ?auto_115132 ) ) ( not ( = ?auto_115127 ?auto_115130 ) ) ( not ( = ?auto_115127 ?auto_115131 ) ) ( not ( = ?auto_115133 ?auto_115132 ) ) ( not ( = ?auto_115133 ?auto_115130 ) ) ( not ( = ?auto_115133 ?auto_115131 ) ) ( not ( = ?auto_115129 ?auto_115132 ) ) ( not ( = ?auto_115129 ?auto_115130 ) ) ( not ( = ?auto_115129 ?auto_115131 ) ) ( ON ?auto_115128 ?auto_115129 ) ( CLEAR ?auto_115128 ) ( HOLDING ?auto_115132 ) ( CLEAR ?auto_115131 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_115130 ?auto_115131 ?auto_115132 )
      ( MAKE-1PILE ?auto_115127 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_115134 - BLOCK
    )
    :vars
    (
      ?auto_115136 - BLOCK
      ?auto_115138 - BLOCK
      ?auto_115137 - BLOCK
      ?auto_115139 - BLOCK
      ?auto_115140 - BLOCK
      ?auto_115135 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115136 ?auto_115134 ) ( ON-TABLE ?auto_115134 ) ( not ( = ?auto_115134 ?auto_115136 ) ) ( not ( = ?auto_115134 ?auto_115138 ) ) ( not ( = ?auto_115134 ?auto_115137 ) ) ( not ( = ?auto_115136 ?auto_115138 ) ) ( not ( = ?auto_115136 ?auto_115137 ) ) ( not ( = ?auto_115138 ?auto_115137 ) ) ( ON ?auto_115138 ?auto_115136 ) ( ON-TABLE ?auto_115139 ) ( ON ?auto_115140 ?auto_115139 ) ( not ( = ?auto_115139 ?auto_115140 ) ) ( not ( = ?auto_115139 ?auto_115135 ) ) ( not ( = ?auto_115139 ?auto_115137 ) ) ( not ( = ?auto_115140 ?auto_115135 ) ) ( not ( = ?auto_115140 ?auto_115137 ) ) ( not ( = ?auto_115135 ?auto_115137 ) ) ( not ( = ?auto_115134 ?auto_115135 ) ) ( not ( = ?auto_115134 ?auto_115139 ) ) ( not ( = ?auto_115134 ?auto_115140 ) ) ( not ( = ?auto_115136 ?auto_115135 ) ) ( not ( = ?auto_115136 ?auto_115139 ) ) ( not ( = ?auto_115136 ?auto_115140 ) ) ( not ( = ?auto_115138 ?auto_115135 ) ) ( not ( = ?auto_115138 ?auto_115139 ) ) ( not ( = ?auto_115138 ?auto_115140 ) ) ( ON ?auto_115137 ?auto_115138 ) ( CLEAR ?auto_115140 ) ( ON ?auto_115135 ?auto_115137 ) ( CLEAR ?auto_115135 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_115134 ?auto_115136 ?auto_115138 ?auto_115137 )
      ( MAKE-1PILE ?auto_115134 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_115141 - BLOCK
    )
    :vars
    (
      ?auto_115146 - BLOCK
      ?auto_115142 - BLOCK
      ?auto_115143 - BLOCK
      ?auto_115144 - BLOCK
      ?auto_115145 - BLOCK
      ?auto_115147 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115146 ?auto_115141 ) ( ON-TABLE ?auto_115141 ) ( not ( = ?auto_115141 ?auto_115146 ) ) ( not ( = ?auto_115141 ?auto_115142 ) ) ( not ( = ?auto_115141 ?auto_115143 ) ) ( not ( = ?auto_115146 ?auto_115142 ) ) ( not ( = ?auto_115146 ?auto_115143 ) ) ( not ( = ?auto_115142 ?auto_115143 ) ) ( ON ?auto_115142 ?auto_115146 ) ( ON-TABLE ?auto_115144 ) ( not ( = ?auto_115144 ?auto_115145 ) ) ( not ( = ?auto_115144 ?auto_115147 ) ) ( not ( = ?auto_115144 ?auto_115143 ) ) ( not ( = ?auto_115145 ?auto_115147 ) ) ( not ( = ?auto_115145 ?auto_115143 ) ) ( not ( = ?auto_115147 ?auto_115143 ) ) ( not ( = ?auto_115141 ?auto_115147 ) ) ( not ( = ?auto_115141 ?auto_115144 ) ) ( not ( = ?auto_115141 ?auto_115145 ) ) ( not ( = ?auto_115146 ?auto_115147 ) ) ( not ( = ?auto_115146 ?auto_115144 ) ) ( not ( = ?auto_115146 ?auto_115145 ) ) ( not ( = ?auto_115142 ?auto_115147 ) ) ( not ( = ?auto_115142 ?auto_115144 ) ) ( not ( = ?auto_115142 ?auto_115145 ) ) ( ON ?auto_115143 ?auto_115142 ) ( ON ?auto_115147 ?auto_115143 ) ( CLEAR ?auto_115147 ) ( HOLDING ?auto_115145 ) ( CLEAR ?auto_115144 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_115144 ?auto_115145 )
      ( MAKE-1PILE ?auto_115141 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_115148 - BLOCK
    )
    :vars
    (
      ?auto_115153 - BLOCK
      ?auto_115152 - BLOCK
      ?auto_115154 - BLOCK
      ?auto_115150 - BLOCK
      ?auto_115151 - BLOCK
      ?auto_115149 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115153 ?auto_115148 ) ( ON-TABLE ?auto_115148 ) ( not ( = ?auto_115148 ?auto_115153 ) ) ( not ( = ?auto_115148 ?auto_115152 ) ) ( not ( = ?auto_115148 ?auto_115154 ) ) ( not ( = ?auto_115153 ?auto_115152 ) ) ( not ( = ?auto_115153 ?auto_115154 ) ) ( not ( = ?auto_115152 ?auto_115154 ) ) ( ON ?auto_115152 ?auto_115153 ) ( ON-TABLE ?auto_115150 ) ( not ( = ?auto_115150 ?auto_115151 ) ) ( not ( = ?auto_115150 ?auto_115149 ) ) ( not ( = ?auto_115150 ?auto_115154 ) ) ( not ( = ?auto_115151 ?auto_115149 ) ) ( not ( = ?auto_115151 ?auto_115154 ) ) ( not ( = ?auto_115149 ?auto_115154 ) ) ( not ( = ?auto_115148 ?auto_115149 ) ) ( not ( = ?auto_115148 ?auto_115150 ) ) ( not ( = ?auto_115148 ?auto_115151 ) ) ( not ( = ?auto_115153 ?auto_115149 ) ) ( not ( = ?auto_115153 ?auto_115150 ) ) ( not ( = ?auto_115153 ?auto_115151 ) ) ( not ( = ?auto_115152 ?auto_115149 ) ) ( not ( = ?auto_115152 ?auto_115150 ) ) ( not ( = ?auto_115152 ?auto_115151 ) ) ( ON ?auto_115154 ?auto_115152 ) ( ON ?auto_115149 ?auto_115154 ) ( CLEAR ?auto_115150 ) ( ON ?auto_115151 ?auto_115149 ) ( CLEAR ?auto_115151 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_115148 ?auto_115153 ?auto_115152 ?auto_115154 ?auto_115149 )
      ( MAKE-1PILE ?auto_115148 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_115155 - BLOCK
    )
    :vars
    (
      ?auto_115156 - BLOCK
      ?auto_115159 - BLOCK
      ?auto_115161 - BLOCK
      ?auto_115157 - BLOCK
      ?auto_115158 - BLOCK
      ?auto_115160 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115156 ?auto_115155 ) ( ON-TABLE ?auto_115155 ) ( not ( = ?auto_115155 ?auto_115156 ) ) ( not ( = ?auto_115155 ?auto_115159 ) ) ( not ( = ?auto_115155 ?auto_115161 ) ) ( not ( = ?auto_115156 ?auto_115159 ) ) ( not ( = ?auto_115156 ?auto_115161 ) ) ( not ( = ?auto_115159 ?auto_115161 ) ) ( ON ?auto_115159 ?auto_115156 ) ( not ( = ?auto_115157 ?auto_115158 ) ) ( not ( = ?auto_115157 ?auto_115160 ) ) ( not ( = ?auto_115157 ?auto_115161 ) ) ( not ( = ?auto_115158 ?auto_115160 ) ) ( not ( = ?auto_115158 ?auto_115161 ) ) ( not ( = ?auto_115160 ?auto_115161 ) ) ( not ( = ?auto_115155 ?auto_115160 ) ) ( not ( = ?auto_115155 ?auto_115157 ) ) ( not ( = ?auto_115155 ?auto_115158 ) ) ( not ( = ?auto_115156 ?auto_115160 ) ) ( not ( = ?auto_115156 ?auto_115157 ) ) ( not ( = ?auto_115156 ?auto_115158 ) ) ( not ( = ?auto_115159 ?auto_115160 ) ) ( not ( = ?auto_115159 ?auto_115157 ) ) ( not ( = ?auto_115159 ?auto_115158 ) ) ( ON ?auto_115161 ?auto_115159 ) ( ON ?auto_115160 ?auto_115161 ) ( ON ?auto_115158 ?auto_115160 ) ( CLEAR ?auto_115158 ) ( HOLDING ?auto_115157 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_115157 )
      ( MAKE-1PILE ?auto_115155 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_115162 - BLOCK
    )
    :vars
    (
      ?auto_115163 - BLOCK
      ?auto_115167 - BLOCK
      ?auto_115168 - BLOCK
      ?auto_115164 - BLOCK
      ?auto_115165 - BLOCK
      ?auto_115166 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115163 ?auto_115162 ) ( ON-TABLE ?auto_115162 ) ( not ( = ?auto_115162 ?auto_115163 ) ) ( not ( = ?auto_115162 ?auto_115167 ) ) ( not ( = ?auto_115162 ?auto_115168 ) ) ( not ( = ?auto_115163 ?auto_115167 ) ) ( not ( = ?auto_115163 ?auto_115168 ) ) ( not ( = ?auto_115167 ?auto_115168 ) ) ( ON ?auto_115167 ?auto_115163 ) ( not ( = ?auto_115164 ?auto_115165 ) ) ( not ( = ?auto_115164 ?auto_115166 ) ) ( not ( = ?auto_115164 ?auto_115168 ) ) ( not ( = ?auto_115165 ?auto_115166 ) ) ( not ( = ?auto_115165 ?auto_115168 ) ) ( not ( = ?auto_115166 ?auto_115168 ) ) ( not ( = ?auto_115162 ?auto_115166 ) ) ( not ( = ?auto_115162 ?auto_115164 ) ) ( not ( = ?auto_115162 ?auto_115165 ) ) ( not ( = ?auto_115163 ?auto_115166 ) ) ( not ( = ?auto_115163 ?auto_115164 ) ) ( not ( = ?auto_115163 ?auto_115165 ) ) ( not ( = ?auto_115167 ?auto_115166 ) ) ( not ( = ?auto_115167 ?auto_115164 ) ) ( not ( = ?auto_115167 ?auto_115165 ) ) ( ON ?auto_115168 ?auto_115167 ) ( ON ?auto_115166 ?auto_115168 ) ( ON ?auto_115165 ?auto_115166 ) ( ON ?auto_115164 ?auto_115165 ) ( CLEAR ?auto_115164 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_115162 ?auto_115163 ?auto_115167 ?auto_115168 ?auto_115166 ?auto_115165 )
      ( MAKE-1PILE ?auto_115162 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_115169 - BLOCK
    )
    :vars
    (
      ?auto_115173 - BLOCK
      ?auto_115171 - BLOCK
      ?auto_115172 - BLOCK
      ?auto_115174 - BLOCK
      ?auto_115175 - BLOCK
      ?auto_115170 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115173 ?auto_115169 ) ( ON-TABLE ?auto_115169 ) ( not ( = ?auto_115169 ?auto_115173 ) ) ( not ( = ?auto_115169 ?auto_115171 ) ) ( not ( = ?auto_115169 ?auto_115172 ) ) ( not ( = ?auto_115173 ?auto_115171 ) ) ( not ( = ?auto_115173 ?auto_115172 ) ) ( not ( = ?auto_115171 ?auto_115172 ) ) ( ON ?auto_115171 ?auto_115173 ) ( not ( = ?auto_115174 ?auto_115175 ) ) ( not ( = ?auto_115174 ?auto_115170 ) ) ( not ( = ?auto_115174 ?auto_115172 ) ) ( not ( = ?auto_115175 ?auto_115170 ) ) ( not ( = ?auto_115175 ?auto_115172 ) ) ( not ( = ?auto_115170 ?auto_115172 ) ) ( not ( = ?auto_115169 ?auto_115170 ) ) ( not ( = ?auto_115169 ?auto_115174 ) ) ( not ( = ?auto_115169 ?auto_115175 ) ) ( not ( = ?auto_115173 ?auto_115170 ) ) ( not ( = ?auto_115173 ?auto_115174 ) ) ( not ( = ?auto_115173 ?auto_115175 ) ) ( not ( = ?auto_115171 ?auto_115170 ) ) ( not ( = ?auto_115171 ?auto_115174 ) ) ( not ( = ?auto_115171 ?auto_115175 ) ) ( ON ?auto_115172 ?auto_115171 ) ( ON ?auto_115170 ?auto_115172 ) ( ON ?auto_115175 ?auto_115170 ) ( HOLDING ?auto_115174 ) ( CLEAR ?auto_115175 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_115169 ?auto_115173 ?auto_115171 ?auto_115172 ?auto_115170 ?auto_115175 ?auto_115174 )
      ( MAKE-1PILE ?auto_115169 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_115176 - BLOCK
    )
    :vars
    (
      ?auto_115180 - BLOCK
      ?auto_115181 - BLOCK
      ?auto_115179 - BLOCK
      ?auto_115182 - BLOCK
      ?auto_115178 - BLOCK
      ?auto_115177 - BLOCK
      ?auto_115183 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115180 ?auto_115176 ) ( ON-TABLE ?auto_115176 ) ( not ( = ?auto_115176 ?auto_115180 ) ) ( not ( = ?auto_115176 ?auto_115181 ) ) ( not ( = ?auto_115176 ?auto_115179 ) ) ( not ( = ?auto_115180 ?auto_115181 ) ) ( not ( = ?auto_115180 ?auto_115179 ) ) ( not ( = ?auto_115181 ?auto_115179 ) ) ( ON ?auto_115181 ?auto_115180 ) ( not ( = ?auto_115182 ?auto_115178 ) ) ( not ( = ?auto_115182 ?auto_115177 ) ) ( not ( = ?auto_115182 ?auto_115179 ) ) ( not ( = ?auto_115178 ?auto_115177 ) ) ( not ( = ?auto_115178 ?auto_115179 ) ) ( not ( = ?auto_115177 ?auto_115179 ) ) ( not ( = ?auto_115176 ?auto_115177 ) ) ( not ( = ?auto_115176 ?auto_115182 ) ) ( not ( = ?auto_115176 ?auto_115178 ) ) ( not ( = ?auto_115180 ?auto_115177 ) ) ( not ( = ?auto_115180 ?auto_115182 ) ) ( not ( = ?auto_115180 ?auto_115178 ) ) ( not ( = ?auto_115181 ?auto_115177 ) ) ( not ( = ?auto_115181 ?auto_115182 ) ) ( not ( = ?auto_115181 ?auto_115178 ) ) ( ON ?auto_115179 ?auto_115181 ) ( ON ?auto_115177 ?auto_115179 ) ( ON ?auto_115178 ?auto_115177 ) ( CLEAR ?auto_115178 ) ( ON ?auto_115182 ?auto_115183 ) ( CLEAR ?auto_115182 ) ( HAND-EMPTY ) ( not ( = ?auto_115176 ?auto_115183 ) ) ( not ( = ?auto_115180 ?auto_115183 ) ) ( not ( = ?auto_115181 ?auto_115183 ) ) ( not ( = ?auto_115179 ?auto_115183 ) ) ( not ( = ?auto_115182 ?auto_115183 ) ) ( not ( = ?auto_115178 ?auto_115183 ) ) ( not ( = ?auto_115177 ?auto_115183 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_115182 ?auto_115183 )
      ( MAKE-1PILE ?auto_115176 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_115184 - BLOCK
    )
    :vars
    (
      ?auto_115191 - BLOCK
      ?auto_115190 - BLOCK
      ?auto_115188 - BLOCK
      ?auto_115186 - BLOCK
      ?auto_115189 - BLOCK
      ?auto_115187 - BLOCK
      ?auto_115185 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115191 ?auto_115184 ) ( ON-TABLE ?auto_115184 ) ( not ( = ?auto_115184 ?auto_115191 ) ) ( not ( = ?auto_115184 ?auto_115190 ) ) ( not ( = ?auto_115184 ?auto_115188 ) ) ( not ( = ?auto_115191 ?auto_115190 ) ) ( not ( = ?auto_115191 ?auto_115188 ) ) ( not ( = ?auto_115190 ?auto_115188 ) ) ( ON ?auto_115190 ?auto_115191 ) ( not ( = ?auto_115186 ?auto_115189 ) ) ( not ( = ?auto_115186 ?auto_115187 ) ) ( not ( = ?auto_115186 ?auto_115188 ) ) ( not ( = ?auto_115189 ?auto_115187 ) ) ( not ( = ?auto_115189 ?auto_115188 ) ) ( not ( = ?auto_115187 ?auto_115188 ) ) ( not ( = ?auto_115184 ?auto_115187 ) ) ( not ( = ?auto_115184 ?auto_115186 ) ) ( not ( = ?auto_115184 ?auto_115189 ) ) ( not ( = ?auto_115191 ?auto_115187 ) ) ( not ( = ?auto_115191 ?auto_115186 ) ) ( not ( = ?auto_115191 ?auto_115189 ) ) ( not ( = ?auto_115190 ?auto_115187 ) ) ( not ( = ?auto_115190 ?auto_115186 ) ) ( not ( = ?auto_115190 ?auto_115189 ) ) ( ON ?auto_115188 ?auto_115190 ) ( ON ?auto_115187 ?auto_115188 ) ( ON ?auto_115186 ?auto_115185 ) ( CLEAR ?auto_115186 ) ( not ( = ?auto_115184 ?auto_115185 ) ) ( not ( = ?auto_115191 ?auto_115185 ) ) ( not ( = ?auto_115190 ?auto_115185 ) ) ( not ( = ?auto_115188 ?auto_115185 ) ) ( not ( = ?auto_115186 ?auto_115185 ) ) ( not ( = ?auto_115189 ?auto_115185 ) ) ( not ( = ?auto_115187 ?auto_115185 ) ) ( HOLDING ?auto_115189 ) ( CLEAR ?auto_115187 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_115184 ?auto_115191 ?auto_115190 ?auto_115188 ?auto_115187 ?auto_115189 )
      ( MAKE-1PILE ?auto_115184 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_115192 - BLOCK
    )
    :vars
    (
      ?auto_115193 - BLOCK
      ?auto_115194 - BLOCK
      ?auto_115198 - BLOCK
      ?auto_115195 - BLOCK
      ?auto_115199 - BLOCK
      ?auto_115197 - BLOCK
      ?auto_115196 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115193 ?auto_115192 ) ( ON-TABLE ?auto_115192 ) ( not ( = ?auto_115192 ?auto_115193 ) ) ( not ( = ?auto_115192 ?auto_115194 ) ) ( not ( = ?auto_115192 ?auto_115198 ) ) ( not ( = ?auto_115193 ?auto_115194 ) ) ( not ( = ?auto_115193 ?auto_115198 ) ) ( not ( = ?auto_115194 ?auto_115198 ) ) ( ON ?auto_115194 ?auto_115193 ) ( not ( = ?auto_115195 ?auto_115199 ) ) ( not ( = ?auto_115195 ?auto_115197 ) ) ( not ( = ?auto_115195 ?auto_115198 ) ) ( not ( = ?auto_115199 ?auto_115197 ) ) ( not ( = ?auto_115199 ?auto_115198 ) ) ( not ( = ?auto_115197 ?auto_115198 ) ) ( not ( = ?auto_115192 ?auto_115197 ) ) ( not ( = ?auto_115192 ?auto_115195 ) ) ( not ( = ?auto_115192 ?auto_115199 ) ) ( not ( = ?auto_115193 ?auto_115197 ) ) ( not ( = ?auto_115193 ?auto_115195 ) ) ( not ( = ?auto_115193 ?auto_115199 ) ) ( not ( = ?auto_115194 ?auto_115197 ) ) ( not ( = ?auto_115194 ?auto_115195 ) ) ( not ( = ?auto_115194 ?auto_115199 ) ) ( ON ?auto_115198 ?auto_115194 ) ( ON ?auto_115197 ?auto_115198 ) ( ON ?auto_115195 ?auto_115196 ) ( not ( = ?auto_115192 ?auto_115196 ) ) ( not ( = ?auto_115193 ?auto_115196 ) ) ( not ( = ?auto_115194 ?auto_115196 ) ) ( not ( = ?auto_115198 ?auto_115196 ) ) ( not ( = ?auto_115195 ?auto_115196 ) ) ( not ( = ?auto_115199 ?auto_115196 ) ) ( not ( = ?auto_115197 ?auto_115196 ) ) ( CLEAR ?auto_115197 ) ( ON ?auto_115199 ?auto_115195 ) ( CLEAR ?auto_115199 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_115196 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_115196 ?auto_115195 )
      ( MAKE-1PILE ?auto_115192 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_115200 - BLOCK
    )
    :vars
    (
      ?auto_115205 - BLOCK
      ?auto_115204 - BLOCK
      ?auto_115206 - BLOCK
      ?auto_115202 - BLOCK
      ?auto_115203 - BLOCK
      ?auto_115207 - BLOCK
      ?auto_115201 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115205 ?auto_115200 ) ( ON-TABLE ?auto_115200 ) ( not ( = ?auto_115200 ?auto_115205 ) ) ( not ( = ?auto_115200 ?auto_115204 ) ) ( not ( = ?auto_115200 ?auto_115206 ) ) ( not ( = ?auto_115205 ?auto_115204 ) ) ( not ( = ?auto_115205 ?auto_115206 ) ) ( not ( = ?auto_115204 ?auto_115206 ) ) ( ON ?auto_115204 ?auto_115205 ) ( not ( = ?auto_115202 ?auto_115203 ) ) ( not ( = ?auto_115202 ?auto_115207 ) ) ( not ( = ?auto_115202 ?auto_115206 ) ) ( not ( = ?auto_115203 ?auto_115207 ) ) ( not ( = ?auto_115203 ?auto_115206 ) ) ( not ( = ?auto_115207 ?auto_115206 ) ) ( not ( = ?auto_115200 ?auto_115207 ) ) ( not ( = ?auto_115200 ?auto_115202 ) ) ( not ( = ?auto_115200 ?auto_115203 ) ) ( not ( = ?auto_115205 ?auto_115207 ) ) ( not ( = ?auto_115205 ?auto_115202 ) ) ( not ( = ?auto_115205 ?auto_115203 ) ) ( not ( = ?auto_115204 ?auto_115207 ) ) ( not ( = ?auto_115204 ?auto_115202 ) ) ( not ( = ?auto_115204 ?auto_115203 ) ) ( ON ?auto_115206 ?auto_115204 ) ( ON ?auto_115202 ?auto_115201 ) ( not ( = ?auto_115200 ?auto_115201 ) ) ( not ( = ?auto_115205 ?auto_115201 ) ) ( not ( = ?auto_115204 ?auto_115201 ) ) ( not ( = ?auto_115206 ?auto_115201 ) ) ( not ( = ?auto_115202 ?auto_115201 ) ) ( not ( = ?auto_115203 ?auto_115201 ) ) ( not ( = ?auto_115207 ?auto_115201 ) ) ( ON ?auto_115203 ?auto_115202 ) ( CLEAR ?auto_115203 ) ( ON-TABLE ?auto_115201 ) ( HOLDING ?auto_115207 ) ( CLEAR ?auto_115206 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_115200 ?auto_115205 ?auto_115204 ?auto_115206 ?auto_115207 )
      ( MAKE-1PILE ?auto_115200 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_115208 - BLOCK
    )
    :vars
    (
      ?auto_115210 - BLOCK
      ?auto_115213 - BLOCK
      ?auto_115211 - BLOCK
      ?auto_115214 - BLOCK
      ?auto_115212 - BLOCK
      ?auto_115215 - BLOCK
      ?auto_115209 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115210 ?auto_115208 ) ( ON-TABLE ?auto_115208 ) ( not ( = ?auto_115208 ?auto_115210 ) ) ( not ( = ?auto_115208 ?auto_115213 ) ) ( not ( = ?auto_115208 ?auto_115211 ) ) ( not ( = ?auto_115210 ?auto_115213 ) ) ( not ( = ?auto_115210 ?auto_115211 ) ) ( not ( = ?auto_115213 ?auto_115211 ) ) ( ON ?auto_115213 ?auto_115210 ) ( not ( = ?auto_115214 ?auto_115212 ) ) ( not ( = ?auto_115214 ?auto_115215 ) ) ( not ( = ?auto_115214 ?auto_115211 ) ) ( not ( = ?auto_115212 ?auto_115215 ) ) ( not ( = ?auto_115212 ?auto_115211 ) ) ( not ( = ?auto_115215 ?auto_115211 ) ) ( not ( = ?auto_115208 ?auto_115215 ) ) ( not ( = ?auto_115208 ?auto_115214 ) ) ( not ( = ?auto_115208 ?auto_115212 ) ) ( not ( = ?auto_115210 ?auto_115215 ) ) ( not ( = ?auto_115210 ?auto_115214 ) ) ( not ( = ?auto_115210 ?auto_115212 ) ) ( not ( = ?auto_115213 ?auto_115215 ) ) ( not ( = ?auto_115213 ?auto_115214 ) ) ( not ( = ?auto_115213 ?auto_115212 ) ) ( ON ?auto_115211 ?auto_115213 ) ( ON ?auto_115214 ?auto_115209 ) ( not ( = ?auto_115208 ?auto_115209 ) ) ( not ( = ?auto_115210 ?auto_115209 ) ) ( not ( = ?auto_115213 ?auto_115209 ) ) ( not ( = ?auto_115211 ?auto_115209 ) ) ( not ( = ?auto_115214 ?auto_115209 ) ) ( not ( = ?auto_115212 ?auto_115209 ) ) ( not ( = ?auto_115215 ?auto_115209 ) ) ( ON ?auto_115212 ?auto_115214 ) ( ON-TABLE ?auto_115209 ) ( CLEAR ?auto_115211 ) ( ON ?auto_115215 ?auto_115212 ) ( CLEAR ?auto_115215 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_115209 ?auto_115214 ?auto_115212 )
      ( MAKE-1PILE ?auto_115208 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_115216 - BLOCK
    )
    :vars
    (
      ?auto_115223 - BLOCK
      ?auto_115218 - BLOCK
      ?auto_115217 - BLOCK
      ?auto_115221 - BLOCK
      ?auto_115220 - BLOCK
      ?auto_115219 - BLOCK
      ?auto_115222 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115223 ?auto_115216 ) ( ON-TABLE ?auto_115216 ) ( not ( = ?auto_115216 ?auto_115223 ) ) ( not ( = ?auto_115216 ?auto_115218 ) ) ( not ( = ?auto_115216 ?auto_115217 ) ) ( not ( = ?auto_115223 ?auto_115218 ) ) ( not ( = ?auto_115223 ?auto_115217 ) ) ( not ( = ?auto_115218 ?auto_115217 ) ) ( ON ?auto_115218 ?auto_115223 ) ( not ( = ?auto_115221 ?auto_115220 ) ) ( not ( = ?auto_115221 ?auto_115219 ) ) ( not ( = ?auto_115221 ?auto_115217 ) ) ( not ( = ?auto_115220 ?auto_115219 ) ) ( not ( = ?auto_115220 ?auto_115217 ) ) ( not ( = ?auto_115219 ?auto_115217 ) ) ( not ( = ?auto_115216 ?auto_115219 ) ) ( not ( = ?auto_115216 ?auto_115221 ) ) ( not ( = ?auto_115216 ?auto_115220 ) ) ( not ( = ?auto_115223 ?auto_115219 ) ) ( not ( = ?auto_115223 ?auto_115221 ) ) ( not ( = ?auto_115223 ?auto_115220 ) ) ( not ( = ?auto_115218 ?auto_115219 ) ) ( not ( = ?auto_115218 ?auto_115221 ) ) ( not ( = ?auto_115218 ?auto_115220 ) ) ( ON ?auto_115221 ?auto_115222 ) ( not ( = ?auto_115216 ?auto_115222 ) ) ( not ( = ?auto_115223 ?auto_115222 ) ) ( not ( = ?auto_115218 ?auto_115222 ) ) ( not ( = ?auto_115217 ?auto_115222 ) ) ( not ( = ?auto_115221 ?auto_115222 ) ) ( not ( = ?auto_115220 ?auto_115222 ) ) ( not ( = ?auto_115219 ?auto_115222 ) ) ( ON ?auto_115220 ?auto_115221 ) ( ON-TABLE ?auto_115222 ) ( ON ?auto_115219 ?auto_115220 ) ( CLEAR ?auto_115219 ) ( HOLDING ?auto_115217 ) ( CLEAR ?auto_115218 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_115216 ?auto_115223 ?auto_115218 ?auto_115217 )
      ( MAKE-1PILE ?auto_115216 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_115224 - BLOCK
    )
    :vars
    (
      ?auto_115230 - BLOCK
      ?auto_115226 - BLOCK
      ?auto_115225 - BLOCK
      ?auto_115229 - BLOCK
      ?auto_115228 - BLOCK
      ?auto_115227 - BLOCK
      ?auto_115231 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115230 ?auto_115224 ) ( ON-TABLE ?auto_115224 ) ( not ( = ?auto_115224 ?auto_115230 ) ) ( not ( = ?auto_115224 ?auto_115226 ) ) ( not ( = ?auto_115224 ?auto_115225 ) ) ( not ( = ?auto_115230 ?auto_115226 ) ) ( not ( = ?auto_115230 ?auto_115225 ) ) ( not ( = ?auto_115226 ?auto_115225 ) ) ( ON ?auto_115226 ?auto_115230 ) ( not ( = ?auto_115229 ?auto_115228 ) ) ( not ( = ?auto_115229 ?auto_115227 ) ) ( not ( = ?auto_115229 ?auto_115225 ) ) ( not ( = ?auto_115228 ?auto_115227 ) ) ( not ( = ?auto_115228 ?auto_115225 ) ) ( not ( = ?auto_115227 ?auto_115225 ) ) ( not ( = ?auto_115224 ?auto_115227 ) ) ( not ( = ?auto_115224 ?auto_115229 ) ) ( not ( = ?auto_115224 ?auto_115228 ) ) ( not ( = ?auto_115230 ?auto_115227 ) ) ( not ( = ?auto_115230 ?auto_115229 ) ) ( not ( = ?auto_115230 ?auto_115228 ) ) ( not ( = ?auto_115226 ?auto_115227 ) ) ( not ( = ?auto_115226 ?auto_115229 ) ) ( not ( = ?auto_115226 ?auto_115228 ) ) ( ON ?auto_115229 ?auto_115231 ) ( not ( = ?auto_115224 ?auto_115231 ) ) ( not ( = ?auto_115230 ?auto_115231 ) ) ( not ( = ?auto_115226 ?auto_115231 ) ) ( not ( = ?auto_115225 ?auto_115231 ) ) ( not ( = ?auto_115229 ?auto_115231 ) ) ( not ( = ?auto_115228 ?auto_115231 ) ) ( not ( = ?auto_115227 ?auto_115231 ) ) ( ON ?auto_115228 ?auto_115229 ) ( ON-TABLE ?auto_115231 ) ( ON ?auto_115227 ?auto_115228 ) ( CLEAR ?auto_115226 ) ( ON ?auto_115225 ?auto_115227 ) ( CLEAR ?auto_115225 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_115231 ?auto_115229 ?auto_115228 ?auto_115227 )
      ( MAKE-1PILE ?auto_115224 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_115232 - BLOCK
    )
    :vars
    (
      ?auto_115234 - BLOCK
      ?auto_115237 - BLOCK
      ?auto_115236 - BLOCK
      ?auto_115239 - BLOCK
      ?auto_115235 - BLOCK
      ?auto_115238 - BLOCK
      ?auto_115233 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115234 ?auto_115232 ) ( ON-TABLE ?auto_115232 ) ( not ( = ?auto_115232 ?auto_115234 ) ) ( not ( = ?auto_115232 ?auto_115237 ) ) ( not ( = ?auto_115232 ?auto_115236 ) ) ( not ( = ?auto_115234 ?auto_115237 ) ) ( not ( = ?auto_115234 ?auto_115236 ) ) ( not ( = ?auto_115237 ?auto_115236 ) ) ( not ( = ?auto_115239 ?auto_115235 ) ) ( not ( = ?auto_115239 ?auto_115238 ) ) ( not ( = ?auto_115239 ?auto_115236 ) ) ( not ( = ?auto_115235 ?auto_115238 ) ) ( not ( = ?auto_115235 ?auto_115236 ) ) ( not ( = ?auto_115238 ?auto_115236 ) ) ( not ( = ?auto_115232 ?auto_115238 ) ) ( not ( = ?auto_115232 ?auto_115239 ) ) ( not ( = ?auto_115232 ?auto_115235 ) ) ( not ( = ?auto_115234 ?auto_115238 ) ) ( not ( = ?auto_115234 ?auto_115239 ) ) ( not ( = ?auto_115234 ?auto_115235 ) ) ( not ( = ?auto_115237 ?auto_115238 ) ) ( not ( = ?auto_115237 ?auto_115239 ) ) ( not ( = ?auto_115237 ?auto_115235 ) ) ( ON ?auto_115239 ?auto_115233 ) ( not ( = ?auto_115232 ?auto_115233 ) ) ( not ( = ?auto_115234 ?auto_115233 ) ) ( not ( = ?auto_115237 ?auto_115233 ) ) ( not ( = ?auto_115236 ?auto_115233 ) ) ( not ( = ?auto_115239 ?auto_115233 ) ) ( not ( = ?auto_115235 ?auto_115233 ) ) ( not ( = ?auto_115238 ?auto_115233 ) ) ( ON ?auto_115235 ?auto_115239 ) ( ON-TABLE ?auto_115233 ) ( ON ?auto_115238 ?auto_115235 ) ( ON ?auto_115236 ?auto_115238 ) ( CLEAR ?auto_115236 ) ( HOLDING ?auto_115237 ) ( CLEAR ?auto_115234 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_115232 ?auto_115234 ?auto_115237 )
      ( MAKE-1PILE ?auto_115232 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_115240 - BLOCK
    )
    :vars
    (
      ?auto_115243 - BLOCK
      ?auto_115247 - BLOCK
      ?auto_115244 - BLOCK
      ?auto_115241 - BLOCK
      ?auto_115245 - BLOCK
      ?auto_115242 - BLOCK
      ?auto_115246 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115243 ?auto_115240 ) ( ON-TABLE ?auto_115240 ) ( not ( = ?auto_115240 ?auto_115243 ) ) ( not ( = ?auto_115240 ?auto_115247 ) ) ( not ( = ?auto_115240 ?auto_115244 ) ) ( not ( = ?auto_115243 ?auto_115247 ) ) ( not ( = ?auto_115243 ?auto_115244 ) ) ( not ( = ?auto_115247 ?auto_115244 ) ) ( not ( = ?auto_115241 ?auto_115245 ) ) ( not ( = ?auto_115241 ?auto_115242 ) ) ( not ( = ?auto_115241 ?auto_115244 ) ) ( not ( = ?auto_115245 ?auto_115242 ) ) ( not ( = ?auto_115245 ?auto_115244 ) ) ( not ( = ?auto_115242 ?auto_115244 ) ) ( not ( = ?auto_115240 ?auto_115242 ) ) ( not ( = ?auto_115240 ?auto_115241 ) ) ( not ( = ?auto_115240 ?auto_115245 ) ) ( not ( = ?auto_115243 ?auto_115242 ) ) ( not ( = ?auto_115243 ?auto_115241 ) ) ( not ( = ?auto_115243 ?auto_115245 ) ) ( not ( = ?auto_115247 ?auto_115242 ) ) ( not ( = ?auto_115247 ?auto_115241 ) ) ( not ( = ?auto_115247 ?auto_115245 ) ) ( ON ?auto_115241 ?auto_115246 ) ( not ( = ?auto_115240 ?auto_115246 ) ) ( not ( = ?auto_115243 ?auto_115246 ) ) ( not ( = ?auto_115247 ?auto_115246 ) ) ( not ( = ?auto_115244 ?auto_115246 ) ) ( not ( = ?auto_115241 ?auto_115246 ) ) ( not ( = ?auto_115245 ?auto_115246 ) ) ( not ( = ?auto_115242 ?auto_115246 ) ) ( ON ?auto_115245 ?auto_115241 ) ( ON-TABLE ?auto_115246 ) ( ON ?auto_115242 ?auto_115245 ) ( ON ?auto_115244 ?auto_115242 ) ( CLEAR ?auto_115243 ) ( ON ?auto_115247 ?auto_115244 ) ( CLEAR ?auto_115247 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_115246 ?auto_115241 ?auto_115245 ?auto_115242 ?auto_115244 )
      ( MAKE-1PILE ?auto_115240 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_115264 - BLOCK
    )
    :vars
    (
      ?auto_115266 - BLOCK
      ?auto_115267 - BLOCK
      ?auto_115265 - BLOCK
      ?auto_115268 - BLOCK
      ?auto_115269 - BLOCK
      ?auto_115271 - BLOCK
      ?auto_115270 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115264 ?auto_115266 ) ) ( not ( = ?auto_115264 ?auto_115267 ) ) ( not ( = ?auto_115264 ?auto_115265 ) ) ( not ( = ?auto_115266 ?auto_115267 ) ) ( not ( = ?auto_115266 ?auto_115265 ) ) ( not ( = ?auto_115267 ?auto_115265 ) ) ( not ( = ?auto_115268 ?auto_115269 ) ) ( not ( = ?auto_115268 ?auto_115271 ) ) ( not ( = ?auto_115268 ?auto_115265 ) ) ( not ( = ?auto_115269 ?auto_115271 ) ) ( not ( = ?auto_115269 ?auto_115265 ) ) ( not ( = ?auto_115271 ?auto_115265 ) ) ( not ( = ?auto_115264 ?auto_115271 ) ) ( not ( = ?auto_115264 ?auto_115268 ) ) ( not ( = ?auto_115264 ?auto_115269 ) ) ( not ( = ?auto_115266 ?auto_115271 ) ) ( not ( = ?auto_115266 ?auto_115268 ) ) ( not ( = ?auto_115266 ?auto_115269 ) ) ( not ( = ?auto_115267 ?auto_115271 ) ) ( not ( = ?auto_115267 ?auto_115268 ) ) ( not ( = ?auto_115267 ?auto_115269 ) ) ( ON ?auto_115268 ?auto_115270 ) ( not ( = ?auto_115264 ?auto_115270 ) ) ( not ( = ?auto_115266 ?auto_115270 ) ) ( not ( = ?auto_115267 ?auto_115270 ) ) ( not ( = ?auto_115265 ?auto_115270 ) ) ( not ( = ?auto_115268 ?auto_115270 ) ) ( not ( = ?auto_115269 ?auto_115270 ) ) ( not ( = ?auto_115271 ?auto_115270 ) ) ( ON ?auto_115269 ?auto_115268 ) ( ON-TABLE ?auto_115270 ) ( ON ?auto_115271 ?auto_115269 ) ( ON ?auto_115265 ?auto_115271 ) ( ON ?auto_115267 ?auto_115265 ) ( ON ?auto_115266 ?auto_115267 ) ( CLEAR ?auto_115266 ) ( HOLDING ?auto_115264 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_115264 ?auto_115266 )
      ( MAKE-1PILE ?auto_115264 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_115272 - BLOCK
    )
    :vars
    (
      ?auto_115274 - BLOCK
      ?auto_115279 - BLOCK
      ?auto_115276 - BLOCK
      ?auto_115273 - BLOCK
      ?auto_115275 - BLOCK
      ?auto_115278 - BLOCK
      ?auto_115277 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115272 ?auto_115274 ) ) ( not ( = ?auto_115272 ?auto_115279 ) ) ( not ( = ?auto_115272 ?auto_115276 ) ) ( not ( = ?auto_115274 ?auto_115279 ) ) ( not ( = ?auto_115274 ?auto_115276 ) ) ( not ( = ?auto_115279 ?auto_115276 ) ) ( not ( = ?auto_115273 ?auto_115275 ) ) ( not ( = ?auto_115273 ?auto_115278 ) ) ( not ( = ?auto_115273 ?auto_115276 ) ) ( not ( = ?auto_115275 ?auto_115278 ) ) ( not ( = ?auto_115275 ?auto_115276 ) ) ( not ( = ?auto_115278 ?auto_115276 ) ) ( not ( = ?auto_115272 ?auto_115278 ) ) ( not ( = ?auto_115272 ?auto_115273 ) ) ( not ( = ?auto_115272 ?auto_115275 ) ) ( not ( = ?auto_115274 ?auto_115278 ) ) ( not ( = ?auto_115274 ?auto_115273 ) ) ( not ( = ?auto_115274 ?auto_115275 ) ) ( not ( = ?auto_115279 ?auto_115278 ) ) ( not ( = ?auto_115279 ?auto_115273 ) ) ( not ( = ?auto_115279 ?auto_115275 ) ) ( ON ?auto_115273 ?auto_115277 ) ( not ( = ?auto_115272 ?auto_115277 ) ) ( not ( = ?auto_115274 ?auto_115277 ) ) ( not ( = ?auto_115279 ?auto_115277 ) ) ( not ( = ?auto_115276 ?auto_115277 ) ) ( not ( = ?auto_115273 ?auto_115277 ) ) ( not ( = ?auto_115275 ?auto_115277 ) ) ( not ( = ?auto_115278 ?auto_115277 ) ) ( ON ?auto_115275 ?auto_115273 ) ( ON-TABLE ?auto_115277 ) ( ON ?auto_115278 ?auto_115275 ) ( ON ?auto_115276 ?auto_115278 ) ( ON ?auto_115279 ?auto_115276 ) ( ON ?auto_115274 ?auto_115279 ) ( ON ?auto_115272 ?auto_115274 ) ( CLEAR ?auto_115272 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_115277 ?auto_115273 ?auto_115275 ?auto_115278 ?auto_115276 ?auto_115279 ?auto_115274 )
      ( MAKE-1PILE ?auto_115272 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_115286 - BLOCK
      ?auto_115287 - BLOCK
      ?auto_115288 - BLOCK
      ?auto_115289 - BLOCK
      ?auto_115290 - BLOCK
      ?auto_115291 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_115291 ) ( CLEAR ?auto_115290 ) ( ON-TABLE ?auto_115286 ) ( ON ?auto_115287 ?auto_115286 ) ( ON ?auto_115288 ?auto_115287 ) ( ON ?auto_115289 ?auto_115288 ) ( ON ?auto_115290 ?auto_115289 ) ( not ( = ?auto_115286 ?auto_115287 ) ) ( not ( = ?auto_115286 ?auto_115288 ) ) ( not ( = ?auto_115286 ?auto_115289 ) ) ( not ( = ?auto_115286 ?auto_115290 ) ) ( not ( = ?auto_115286 ?auto_115291 ) ) ( not ( = ?auto_115287 ?auto_115288 ) ) ( not ( = ?auto_115287 ?auto_115289 ) ) ( not ( = ?auto_115287 ?auto_115290 ) ) ( not ( = ?auto_115287 ?auto_115291 ) ) ( not ( = ?auto_115288 ?auto_115289 ) ) ( not ( = ?auto_115288 ?auto_115290 ) ) ( not ( = ?auto_115288 ?auto_115291 ) ) ( not ( = ?auto_115289 ?auto_115290 ) ) ( not ( = ?auto_115289 ?auto_115291 ) ) ( not ( = ?auto_115290 ?auto_115291 ) ) )
    :subtasks
    ( ( !STACK ?auto_115291 ?auto_115290 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_115292 - BLOCK
      ?auto_115293 - BLOCK
      ?auto_115294 - BLOCK
      ?auto_115295 - BLOCK
      ?auto_115296 - BLOCK
      ?auto_115297 - BLOCK
    )
    :vars
    (
      ?auto_115298 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_115296 ) ( ON-TABLE ?auto_115292 ) ( ON ?auto_115293 ?auto_115292 ) ( ON ?auto_115294 ?auto_115293 ) ( ON ?auto_115295 ?auto_115294 ) ( ON ?auto_115296 ?auto_115295 ) ( not ( = ?auto_115292 ?auto_115293 ) ) ( not ( = ?auto_115292 ?auto_115294 ) ) ( not ( = ?auto_115292 ?auto_115295 ) ) ( not ( = ?auto_115292 ?auto_115296 ) ) ( not ( = ?auto_115292 ?auto_115297 ) ) ( not ( = ?auto_115293 ?auto_115294 ) ) ( not ( = ?auto_115293 ?auto_115295 ) ) ( not ( = ?auto_115293 ?auto_115296 ) ) ( not ( = ?auto_115293 ?auto_115297 ) ) ( not ( = ?auto_115294 ?auto_115295 ) ) ( not ( = ?auto_115294 ?auto_115296 ) ) ( not ( = ?auto_115294 ?auto_115297 ) ) ( not ( = ?auto_115295 ?auto_115296 ) ) ( not ( = ?auto_115295 ?auto_115297 ) ) ( not ( = ?auto_115296 ?auto_115297 ) ) ( ON ?auto_115297 ?auto_115298 ) ( CLEAR ?auto_115297 ) ( HAND-EMPTY ) ( not ( = ?auto_115292 ?auto_115298 ) ) ( not ( = ?auto_115293 ?auto_115298 ) ) ( not ( = ?auto_115294 ?auto_115298 ) ) ( not ( = ?auto_115295 ?auto_115298 ) ) ( not ( = ?auto_115296 ?auto_115298 ) ) ( not ( = ?auto_115297 ?auto_115298 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_115297 ?auto_115298 )
      ( MAKE-6PILE ?auto_115292 ?auto_115293 ?auto_115294 ?auto_115295 ?auto_115296 ?auto_115297 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_115299 - BLOCK
      ?auto_115300 - BLOCK
      ?auto_115301 - BLOCK
      ?auto_115302 - BLOCK
      ?auto_115303 - BLOCK
      ?auto_115304 - BLOCK
    )
    :vars
    (
      ?auto_115305 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_115299 ) ( ON ?auto_115300 ?auto_115299 ) ( ON ?auto_115301 ?auto_115300 ) ( ON ?auto_115302 ?auto_115301 ) ( not ( = ?auto_115299 ?auto_115300 ) ) ( not ( = ?auto_115299 ?auto_115301 ) ) ( not ( = ?auto_115299 ?auto_115302 ) ) ( not ( = ?auto_115299 ?auto_115303 ) ) ( not ( = ?auto_115299 ?auto_115304 ) ) ( not ( = ?auto_115300 ?auto_115301 ) ) ( not ( = ?auto_115300 ?auto_115302 ) ) ( not ( = ?auto_115300 ?auto_115303 ) ) ( not ( = ?auto_115300 ?auto_115304 ) ) ( not ( = ?auto_115301 ?auto_115302 ) ) ( not ( = ?auto_115301 ?auto_115303 ) ) ( not ( = ?auto_115301 ?auto_115304 ) ) ( not ( = ?auto_115302 ?auto_115303 ) ) ( not ( = ?auto_115302 ?auto_115304 ) ) ( not ( = ?auto_115303 ?auto_115304 ) ) ( ON ?auto_115304 ?auto_115305 ) ( CLEAR ?auto_115304 ) ( not ( = ?auto_115299 ?auto_115305 ) ) ( not ( = ?auto_115300 ?auto_115305 ) ) ( not ( = ?auto_115301 ?auto_115305 ) ) ( not ( = ?auto_115302 ?auto_115305 ) ) ( not ( = ?auto_115303 ?auto_115305 ) ) ( not ( = ?auto_115304 ?auto_115305 ) ) ( HOLDING ?auto_115303 ) ( CLEAR ?auto_115302 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_115299 ?auto_115300 ?auto_115301 ?auto_115302 ?auto_115303 )
      ( MAKE-6PILE ?auto_115299 ?auto_115300 ?auto_115301 ?auto_115302 ?auto_115303 ?auto_115304 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_115306 - BLOCK
      ?auto_115307 - BLOCK
      ?auto_115308 - BLOCK
      ?auto_115309 - BLOCK
      ?auto_115310 - BLOCK
      ?auto_115311 - BLOCK
    )
    :vars
    (
      ?auto_115312 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_115306 ) ( ON ?auto_115307 ?auto_115306 ) ( ON ?auto_115308 ?auto_115307 ) ( ON ?auto_115309 ?auto_115308 ) ( not ( = ?auto_115306 ?auto_115307 ) ) ( not ( = ?auto_115306 ?auto_115308 ) ) ( not ( = ?auto_115306 ?auto_115309 ) ) ( not ( = ?auto_115306 ?auto_115310 ) ) ( not ( = ?auto_115306 ?auto_115311 ) ) ( not ( = ?auto_115307 ?auto_115308 ) ) ( not ( = ?auto_115307 ?auto_115309 ) ) ( not ( = ?auto_115307 ?auto_115310 ) ) ( not ( = ?auto_115307 ?auto_115311 ) ) ( not ( = ?auto_115308 ?auto_115309 ) ) ( not ( = ?auto_115308 ?auto_115310 ) ) ( not ( = ?auto_115308 ?auto_115311 ) ) ( not ( = ?auto_115309 ?auto_115310 ) ) ( not ( = ?auto_115309 ?auto_115311 ) ) ( not ( = ?auto_115310 ?auto_115311 ) ) ( ON ?auto_115311 ?auto_115312 ) ( not ( = ?auto_115306 ?auto_115312 ) ) ( not ( = ?auto_115307 ?auto_115312 ) ) ( not ( = ?auto_115308 ?auto_115312 ) ) ( not ( = ?auto_115309 ?auto_115312 ) ) ( not ( = ?auto_115310 ?auto_115312 ) ) ( not ( = ?auto_115311 ?auto_115312 ) ) ( CLEAR ?auto_115309 ) ( ON ?auto_115310 ?auto_115311 ) ( CLEAR ?auto_115310 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_115312 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_115312 ?auto_115311 )
      ( MAKE-6PILE ?auto_115306 ?auto_115307 ?auto_115308 ?auto_115309 ?auto_115310 ?auto_115311 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_115313 - BLOCK
      ?auto_115314 - BLOCK
      ?auto_115315 - BLOCK
      ?auto_115316 - BLOCK
      ?auto_115317 - BLOCK
      ?auto_115318 - BLOCK
    )
    :vars
    (
      ?auto_115319 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_115313 ) ( ON ?auto_115314 ?auto_115313 ) ( ON ?auto_115315 ?auto_115314 ) ( not ( = ?auto_115313 ?auto_115314 ) ) ( not ( = ?auto_115313 ?auto_115315 ) ) ( not ( = ?auto_115313 ?auto_115316 ) ) ( not ( = ?auto_115313 ?auto_115317 ) ) ( not ( = ?auto_115313 ?auto_115318 ) ) ( not ( = ?auto_115314 ?auto_115315 ) ) ( not ( = ?auto_115314 ?auto_115316 ) ) ( not ( = ?auto_115314 ?auto_115317 ) ) ( not ( = ?auto_115314 ?auto_115318 ) ) ( not ( = ?auto_115315 ?auto_115316 ) ) ( not ( = ?auto_115315 ?auto_115317 ) ) ( not ( = ?auto_115315 ?auto_115318 ) ) ( not ( = ?auto_115316 ?auto_115317 ) ) ( not ( = ?auto_115316 ?auto_115318 ) ) ( not ( = ?auto_115317 ?auto_115318 ) ) ( ON ?auto_115318 ?auto_115319 ) ( not ( = ?auto_115313 ?auto_115319 ) ) ( not ( = ?auto_115314 ?auto_115319 ) ) ( not ( = ?auto_115315 ?auto_115319 ) ) ( not ( = ?auto_115316 ?auto_115319 ) ) ( not ( = ?auto_115317 ?auto_115319 ) ) ( not ( = ?auto_115318 ?auto_115319 ) ) ( ON ?auto_115317 ?auto_115318 ) ( CLEAR ?auto_115317 ) ( ON-TABLE ?auto_115319 ) ( HOLDING ?auto_115316 ) ( CLEAR ?auto_115315 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_115313 ?auto_115314 ?auto_115315 ?auto_115316 )
      ( MAKE-6PILE ?auto_115313 ?auto_115314 ?auto_115315 ?auto_115316 ?auto_115317 ?auto_115318 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_115320 - BLOCK
      ?auto_115321 - BLOCK
      ?auto_115322 - BLOCK
      ?auto_115323 - BLOCK
      ?auto_115324 - BLOCK
      ?auto_115325 - BLOCK
    )
    :vars
    (
      ?auto_115326 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_115320 ) ( ON ?auto_115321 ?auto_115320 ) ( ON ?auto_115322 ?auto_115321 ) ( not ( = ?auto_115320 ?auto_115321 ) ) ( not ( = ?auto_115320 ?auto_115322 ) ) ( not ( = ?auto_115320 ?auto_115323 ) ) ( not ( = ?auto_115320 ?auto_115324 ) ) ( not ( = ?auto_115320 ?auto_115325 ) ) ( not ( = ?auto_115321 ?auto_115322 ) ) ( not ( = ?auto_115321 ?auto_115323 ) ) ( not ( = ?auto_115321 ?auto_115324 ) ) ( not ( = ?auto_115321 ?auto_115325 ) ) ( not ( = ?auto_115322 ?auto_115323 ) ) ( not ( = ?auto_115322 ?auto_115324 ) ) ( not ( = ?auto_115322 ?auto_115325 ) ) ( not ( = ?auto_115323 ?auto_115324 ) ) ( not ( = ?auto_115323 ?auto_115325 ) ) ( not ( = ?auto_115324 ?auto_115325 ) ) ( ON ?auto_115325 ?auto_115326 ) ( not ( = ?auto_115320 ?auto_115326 ) ) ( not ( = ?auto_115321 ?auto_115326 ) ) ( not ( = ?auto_115322 ?auto_115326 ) ) ( not ( = ?auto_115323 ?auto_115326 ) ) ( not ( = ?auto_115324 ?auto_115326 ) ) ( not ( = ?auto_115325 ?auto_115326 ) ) ( ON ?auto_115324 ?auto_115325 ) ( ON-TABLE ?auto_115326 ) ( CLEAR ?auto_115322 ) ( ON ?auto_115323 ?auto_115324 ) ( CLEAR ?auto_115323 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_115326 ?auto_115325 ?auto_115324 )
      ( MAKE-6PILE ?auto_115320 ?auto_115321 ?auto_115322 ?auto_115323 ?auto_115324 ?auto_115325 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_115327 - BLOCK
      ?auto_115328 - BLOCK
      ?auto_115329 - BLOCK
      ?auto_115330 - BLOCK
      ?auto_115331 - BLOCK
      ?auto_115332 - BLOCK
    )
    :vars
    (
      ?auto_115333 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_115327 ) ( ON ?auto_115328 ?auto_115327 ) ( not ( = ?auto_115327 ?auto_115328 ) ) ( not ( = ?auto_115327 ?auto_115329 ) ) ( not ( = ?auto_115327 ?auto_115330 ) ) ( not ( = ?auto_115327 ?auto_115331 ) ) ( not ( = ?auto_115327 ?auto_115332 ) ) ( not ( = ?auto_115328 ?auto_115329 ) ) ( not ( = ?auto_115328 ?auto_115330 ) ) ( not ( = ?auto_115328 ?auto_115331 ) ) ( not ( = ?auto_115328 ?auto_115332 ) ) ( not ( = ?auto_115329 ?auto_115330 ) ) ( not ( = ?auto_115329 ?auto_115331 ) ) ( not ( = ?auto_115329 ?auto_115332 ) ) ( not ( = ?auto_115330 ?auto_115331 ) ) ( not ( = ?auto_115330 ?auto_115332 ) ) ( not ( = ?auto_115331 ?auto_115332 ) ) ( ON ?auto_115332 ?auto_115333 ) ( not ( = ?auto_115327 ?auto_115333 ) ) ( not ( = ?auto_115328 ?auto_115333 ) ) ( not ( = ?auto_115329 ?auto_115333 ) ) ( not ( = ?auto_115330 ?auto_115333 ) ) ( not ( = ?auto_115331 ?auto_115333 ) ) ( not ( = ?auto_115332 ?auto_115333 ) ) ( ON ?auto_115331 ?auto_115332 ) ( ON-TABLE ?auto_115333 ) ( ON ?auto_115330 ?auto_115331 ) ( CLEAR ?auto_115330 ) ( HOLDING ?auto_115329 ) ( CLEAR ?auto_115328 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_115327 ?auto_115328 ?auto_115329 )
      ( MAKE-6PILE ?auto_115327 ?auto_115328 ?auto_115329 ?auto_115330 ?auto_115331 ?auto_115332 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_115334 - BLOCK
      ?auto_115335 - BLOCK
      ?auto_115336 - BLOCK
      ?auto_115337 - BLOCK
      ?auto_115338 - BLOCK
      ?auto_115339 - BLOCK
    )
    :vars
    (
      ?auto_115340 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_115334 ) ( ON ?auto_115335 ?auto_115334 ) ( not ( = ?auto_115334 ?auto_115335 ) ) ( not ( = ?auto_115334 ?auto_115336 ) ) ( not ( = ?auto_115334 ?auto_115337 ) ) ( not ( = ?auto_115334 ?auto_115338 ) ) ( not ( = ?auto_115334 ?auto_115339 ) ) ( not ( = ?auto_115335 ?auto_115336 ) ) ( not ( = ?auto_115335 ?auto_115337 ) ) ( not ( = ?auto_115335 ?auto_115338 ) ) ( not ( = ?auto_115335 ?auto_115339 ) ) ( not ( = ?auto_115336 ?auto_115337 ) ) ( not ( = ?auto_115336 ?auto_115338 ) ) ( not ( = ?auto_115336 ?auto_115339 ) ) ( not ( = ?auto_115337 ?auto_115338 ) ) ( not ( = ?auto_115337 ?auto_115339 ) ) ( not ( = ?auto_115338 ?auto_115339 ) ) ( ON ?auto_115339 ?auto_115340 ) ( not ( = ?auto_115334 ?auto_115340 ) ) ( not ( = ?auto_115335 ?auto_115340 ) ) ( not ( = ?auto_115336 ?auto_115340 ) ) ( not ( = ?auto_115337 ?auto_115340 ) ) ( not ( = ?auto_115338 ?auto_115340 ) ) ( not ( = ?auto_115339 ?auto_115340 ) ) ( ON ?auto_115338 ?auto_115339 ) ( ON-TABLE ?auto_115340 ) ( ON ?auto_115337 ?auto_115338 ) ( CLEAR ?auto_115335 ) ( ON ?auto_115336 ?auto_115337 ) ( CLEAR ?auto_115336 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_115340 ?auto_115339 ?auto_115338 ?auto_115337 )
      ( MAKE-6PILE ?auto_115334 ?auto_115335 ?auto_115336 ?auto_115337 ?auto_115338 ?auto_115339 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_115341 - BLOCK
      ?auto_115342 - BLOCK
      ?auto_115343 - BLOCK
      ?auto_115344 - BLOCK
      ?auto_115345 - BLOCK
      ?auto_115346 - BLOCK
    )
    :vars
    (
      ?auto_115347 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_115341 ) ( not ( = ?auto_115341 ?auto_115342 ) ) ( not ( = ?auto_115341 ?auto_115343 ) ) ( not ( = ?auto_115341 ?auto_115344 ) ) ( not ( = ?auto_115341 ?auto_115345 ) ) ( not ( = ?auto_115341 ?auto_115346 ) ) ( not ( = ?auto_115342 ?auto_115343 ) ) ( not ( = ?auto_115342 ?auto_115344 ) ) ( not ( = ?auto_115342 ?auto_115345 ) ) ( not ( = ?auto_115342 ?auto_115346 ) ) ( not ( = ?auto_115343 ?auto_115344 ) ) ( not ( = ?auto_115343 ?auto_115345 ) ) ( not ( = ?auto_115343 ?auto_115346 ) ) ( not ( = ?auto_115344 ?auto_115345 ) ) ( not ( = ?auto_115344 ?auto_115346 ) ) ( not ( = ?auto_115345 ?auto_115346 ) ) ( ON ?auto_115346 ?auto_115347 ) ( not ( = ?auto_115341 ?auto_115347 ) ) ( not ( = ?auto_115342 ?auto_115347 ) ) ( not ( = ?auto_115343 ?auto_115347 ) ) ( not ( = ?auto_115344 ?auto_115347 ) ) ( not ( = ?auto_115345 ?auto_115347 ) ) ( not ( = ?auto_115346 ?auto_115347 ) ) ( ON ?auto_115345 ?auto_115346 ) ( ON-TABLE ?auto_115347 ) ( ON ?auto_115344 ?auto_115345 ) ( ON ?auto_115343 ?auto_115344 ) ( CLEAR ?auto_115343 ) ( HOLDING ?auto_115342 ) ( CLEAR ?auto_115341 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_115341 ?auto_115342 )
      ( MAKE-6PILE ?auto_115341 ?auto_115342 ?auto_115343 ?auto_115344 ?auto_115345 ?auto_115346 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_115348 - BLOCK
      ?auto_115349 - BLOCK
      ?auto_115350 - BLOCK
      ?auto_115351 - BLOCK
      ?auto_115352 - BLOCK
      ?auto_115353 - BLOCK
    )
    :vars
    (
      ?auto_115354 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_115348 ) ( not ( = ?auto_115348 ?auto_115349 ) ) ( not ( = ?auto_115348 ?auto_115350 ) ) ( not ( = ?auto_115348 ?auto_115351 ) ) ( not ( = ?auto_115348 ?auto_115352 ) ) ( not ( = ?auto_115348 ?auto_115353 ) ) ( not ( = ?auto_115349 ?auto_115350 ) ) ( not ( = ?auto_115349 ?auto_115351 ) ) ( not ( = ?auto_115349 ?auto_115352 ) ) ( not ( = ?auto_115349 ?auto_115353 ) ) ( not ( = ?auto_115350 ?auto_115351 ) ) ( not ( = ?auto_115350 ?auto_115352 ) ) ( not ( = ?auto_115350 ?auto_115353 ) ) ( not ( = ?auto_115351 ?auto_115352 ) ) ( not ( = ?auto_115351 ?auto_115353 ) ) ( not ( = ?auto_115352 ?auto_115353 ) ) ( ON ?auto_115353 ?auto_115354 ) ( not ( = ?auto_115348 ?auto_115354 ) ) ( not ( = ?auto_115349 ?auto_115354 ) ) ( not ( = ?auto_115350 ?auto_115354 ) ) ( not ( = ?auto_115351 ?auto_115354 ) ) ( not ( = ?auto_115352 ?auto_115354 ) ) ( not ( = ?auto_115353 ?auto_115354 ) ) ( ON ?auto_115352 ?auto_115353 ) ( ON-TABLE ?auto_115354 ) ( ON ?auto_115351 ?auto_115352 ) ( ON ?auto_115350 ?auto_115351 ) ( CLEAR ?auto_115348 ) ( ON ?auto_115349 ?auto_115350 ) ( CLEAR ?auto_115349 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_115354 ?auto_115353 ?auto_115352 ?auto_115351 ?auto_115350 )
      ( MAKE-6PILE ?auto_115348 ?auto_115349 ?auto_115350 ?auto_115351 ?auto_115352 ?auto_115353 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_115355 - BLOCK
      ?auto_115356 - BLOCK
      ?auto_115357 - BLOCK
      ?auto_115358 - BLOCK
      ?auto_115359 - BLOCK
      ?auto_115360 - BLOCK
    )
    :vars
    (
      ?auto_115361 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115355 ?auto_115356 ) ) ( not ( = ?auto_115355 ?auto_115357 ) ) ( not ( = ?auto_115355 ?auto_115358 ) ) ( not ( = ?auto_115355 ?auto_115359 ) ) ( not ( = ?auto_115355 ?auto_115360 ) ) ( not ( = ?auto_115356 ?auto_115357 ) ) ( not ( = ?auto_115356 ?auto_115358 ) ) ( not ( = ?auto_115356 ?auto_115359 ) ) ( not ( = ?auto_115356 ?auto_115360 ) ) ( not ( = ?auto_115357 ?auto_115358 ) ) ( not ( = ?auto_115357 ?auto_115359 ) ) ( not ( = ?auto_115357 ?auto_115360 ) ) ( not ( = ?auto_115358 ?auto_115359 ) ) ( not ( = ?auto_115358 ?auto_115360 ) ) ( not ( = ?auto_115359 ?auto_115360 ) ) ( ON ?auto_115360 ?auto_115361 ) ( not ( = ?auto_115355 ?auto_115361 ) ) ( not ( = ?auto_115356 ?auto_115361 ) ) ( not ( = ?auto_115357 ?auto_115361 ) ) ( not ( = ?auto_115358 ?auto_115361 ) ) ( not ( = ?auto_115359 ?auto_115361 ) ) ( not ( = ?auto_115360 ?auto_115361 ) ) ( ON ?auto_115359 ?auto_115360 ) ( ON-TABLE ?auto_115361 ) ( ON ?auto_115358 ?auto_115359 ) ( ON ?auto_115357 ?auto_115358 ) ( ON ?auto_115356 ?auto_115357 ) ( CLEAR ?auto_115356 ) ( HOLDING ?auto_115355 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_115355 )
      ( MAKE-6PILE ?auto_115355 ?auto_115356 ?auto_115357 ?auto_115358 ?auto_115359 ?auto_115360 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_115362 - BLOCK
      ?auto_115363 - BLOCK
      ?auto_115364 - BLOCK
      ?auto_115365 - BLOCK
      ?auto_115366 - BLOCK
      ?auto_115367 - BLOCK
    )
    :vars
    (
      ?auto_115368 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115362 ?auto_115363 ) ) ( not ( = ?auto_115362 ?auto_115364 ) ) ( not ( = ?auto_115362 ?auto_115365 ) ) ( not ( = ?auto_115362 ?auto_115366 ) ) ( not ( = ?auto_115362 ?auto_115367 ) ) ( not ( = ?auto_115363 ?auto_115364 ) ) ( not ( = ?auto_115363 ?auto_115365 ) ) ( not ( = ?auto_115363 ?auto_115366 ) ) ( not ( = ?auto_115363 ?auto_115367 ) ) ( not ( = ?auto_115364 ?auto_115365 ) ) ( not ( = ?auto_115364 ?auto_115366 ) ) ( not ( = ?auto_115364 ?auto_115367 ) ) ( not ( = ?auto_115365 ?auto_115366 ) ) ( not ( = ?auto_115365 ?auto_115367 ) ) ( not ( = ?auto_115366 ?auto_115367 ) ) ( ON ?auto_115367 ?auto_115368 ) ( not ( = ?auto_115362 ?auto_115368 ) ) ( not ( = ?auto_115363 ?auto_115368 ) ) ( not ( = ?auto_115364 ?auto_115368 ) ) ( not ( = ?auto_115365 ?auto_115368 ) ) ( not ( = ?auto_115366 ?auto_115368 ) ) ( not ( = ?auto_115367 ?auto_115368 ) ) ( ON ?auto_115366 ?auto_115367 ) ( ON-TABLE ?auto_115368 ) ( ON ?auto_115365 ?auto_115366 ) ( ON ?auto_115364 ?auto_115365 ) ( ON ?auto_115363 ?auto_115364 ) ( ON ?auto_115362 ?auto_115363 ) ( CLEAR ?auto_115362 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_115368 ?auto_115367 ?auto_115366 ?auto_115365 ?auto_115364 ?auto_115363 )
      ( MAKE-6PILE ?auto_115362 ?auto_115363 ?auto_115364 ?auto_115365 ?auto_115366 ?auto_115367 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_115369 - BLOCK
      ?auto_115370 - BLOCK
      ?auto_115371 - BLOCK
      ?auto_115372 - BLOCK
      ?auto_115373 - BLOCK
      ?auto_115374 - BLOCK
    )
    :vars
    (
      ?auto_115375 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115369 ?auto_115370 ) ) ( not ( = ?auto_115369 ?auto_115371 ) ) ( not ( = ?auto_115369 ?auto_115372 ) ) ( not ( = ?auto_115369 ?auto_115373 ) ) ( not ( = ?auto_115369 ?auto_115374 ) ) ( not ( = ?auto_115370 ?auto_115371 ) ) ( not ( = ?auto_115370 ?auto_115372 ) ) ( not ( = ?auto_115370 ?auto_115373 ) ) ( not ( = ?auto_115370 ?auto_115374 ) ) ( not ( = ?auto_115371 ?auto_115372 ) ) ( not ( = ?auto_115371 ?auto_115373 ) ) ( not ( = ?auto_115371 ?auto_115374 ) ) ( not ( = ?auto_115372 ?auto_115373 ) ) ( not ( = ?auto_115372 ?auto_115374 ) ) ( not ( = ?auto_115373 ?auto_115374 ) ) ( ON ?auto_115374 ?auto_115375 ) ( not ( = ?auto_115369 ?auto_115375 ) ) ( not ( = ?auto_115370 ?auto_115375 ) ) ( not ( = ?auto_115371 ?auto_115375 ) ) ( not ( = ?auto_115372 ?auto_115375 ) ) ( not ( = ?auto_115373 ?auto_115375 ) ) ( not ( = ?auto_115374 ?auto_115375 ) ) ( ON ?auto_115373 ?auto_115374 ) ( ON-TABLE ?auto_115375 ) ( ON ?auto_115372 ?auto_115373 ) ( ON ?auto_115371 ?auto_115372 ) ( ON ?auto_115370 ?auto_115371 ) ( HOLDING ?auto_115369 ) ( CLEAR ?auto_115370 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_115375 ?auto_115374 ?auto_115373 ?auto_115372 ?auto_115371 ?auto_115370 ?auto_115369 )
      ( MAKE-6PILE ?auto_115369 ?auto_115370 ?auto_115371 ?auto_115372 ?auto_115373 ?auto_115374 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_115376 - BLOCK
      ?auto_115377 - BLOCK
      ?auto_115378 - BLOCK
      ?auto_115379 - BLOCK
      ?auto_115380 - BLOCK
      ?auto_115381 - BLOCK
    )
    :vars
    (
      ?auto_115382 - BLOCK
      ?auto_115383 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115376 ?auto_115377 ) ) ( not ( = ?auto_115376 ?auto_115378 ) ) ( not ( = ?auto_115376 ?auto_115379 ) ) ( not ( = ?auto_115376 ?auto_115380 ) ) ( not ( = ?auto_115376 ?auto_115381 ) ) ( not ( = ?auto_115377 ?auto_115378 ) ) ( not ( = ?auto_115377 ?auto_115379 ) ) ( not ( = ?auto_115377 ?auto_115380 ) ) ( not ( = ?auto_115377 ?auto_115381 ) ) ( not ( = ?auto_115378 ?auto_115379 ) ) ( not ( = ?auto_115378 ?auto_115380 ) ) ( not ( = ?auto_115378 ?auto_115381 ) ) ( not ( = ?auto_115379 ?auto_115380 ) ) ( not ( = ?auto_115379 ?auto_115381 ) ) ( not ( = ?auto_115380 ?auto_115381 ) ) ( ON ?auto_115381 ?auto_115382 ) ( not ( = ?auto_115376 ?auto_115382 ) ) ( not ( = ?auto_115377 ?auto_115382 ) ) ( not ( = ?auto_115378 ?auto_115382 ) ) ( not ( = ?auto_115379 ?auto_115382 ) ) ( not ( = ?auto_115380 ?auto_115382 ) ) ( not ( = ?auto_115381 ?auto_115382 ) ) ( ON ?auto_115380 ?auto_115381 ) ( ON-TABLE ?auto_115382 ) ( ON ?auto_115379 ?auto_115380 ) ( ON ?auto_115378 ?auto_115379 ) ( ON ?auto_115377 ?auto_115378 ) ( CLEAR ?auto_115377 ) ( ON ?auto_115376 ?auto_115383 ) ( CLEAR ?auto_115376 ) ( HAND-EMPTY ) ( not ( = ?auto_115376 ?auto_115383 ) ) ( not ( = ?auto_115377 ?auto_115383 ) ) ( not ( = ?auto_115378 ?auto_115383 ) ) ( not ( = ?auto_115379 ?auto_115383 ) ) ( not ( = ?auto_115380 ?auto_115383 ) ) ( not ( = ?auto_115381 ?auto_115383 ) ) ( not ( = ?auto_115382 ?auto_115383 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_115376 ?auto_115383 )
      ( MAKE-6PILE ?auto_115376 ?auto_115377 ?auto_115378 ?auto_115379 ?auto_115380 ?auto_115381 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_115384 - BLOCK
      ?auto_115385 - BLOCK
      ?auto_115386 - BLOCK
      ?auto_115387 - BLOCK
      ?auto_115388 - BLOCK
      ?auto_115389 - BLOCK
    )
    :vars
    (
      ?auto_115391 - BLOCK
      ?auto_115390 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115384 ?auto_115385 ) ) ( not ( = ?auto_115384 ?auto_115386 ) ) ( not ( = ?auto_115384 ?auto_115387 ) ) ( not ( = ?auto_115384 ?auto_115388 ) ) ( not ( = ?auto_115384 ?auto_115389 ) ) ( not ( = ?auto_115385 ?auto_115386 ) ) ( not ( = ?auto_115385 ?auto_115387 ) ) ( not ( = ?auto_115385 ?auto_115388 ) ) ( not ( = ?auto_115385 ?auto_115389 ) ) ( not ( = ?auto_115386 ?auto_115387 ) ) ( not ( = ?auto_115386 ?auto_115388 ) ) ( not ( = ?auto_115386 ?auto_115389 ) ) ( not ( = ?auto_115387 ?auto_115388 ) ) ( not ( = ?auto_115387 ?auto_115389 ) ) ( not ( = ?auto_115388 ?auto_115389 ) ) ( ON ?auto_115389 ?auto_115391 ) ( not ( = ?auto_115384 ?auto_115391 ) ) ( not ( = ?auto_115385 ?auto_115391 ) ) ( not ( = ?auto_115386 ?auto_115391 ) ) ( not ( = ?auto_115387 ?auto_115391 ) ) ( not ( = ?auto_115388 ?auto_115391 ) ) ( not ( = ?auto_115389 ?auto_115391 ) ) ( ON ?auto_115388 ?auto_115389 ) ( ON-TABLE ?auto_115391 ) ( ON ?auto_115387 ?auto_115388 ) ( ON ?auto_115386 ?auto_115387 ) ( ON ?auto_115384 ?auto_115390 ) ( CLEAR ?auto_115384 ) ( not ( = ?auto_115384 ?auto_115390 ) ) ( not ( = ?auto_115385 ?auto_115390 ) ) ( not ( = ?auto_115386 ?auto_115390 ) ) ( not ( = ?auto_115387 ?auto_115390 ) ) ( not ( = ?auto_115388 ?auto_115390 ) ) ( not ( = ?auto_115389 ?auto_115390 ) ) ( not ( = ?auto_115391 ?auto_115390 ) ) ( HOLDING ?auto_115385 ) ( CLEAR ?auto_115386 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_115391 ?auto_115389 ?auto_115388 ?auto_115387 ?auto_115386 ?auto_115385 )
      ( MAKE-6PILE ?auto_115384 ?auto_115385 ?auto_115386 ?auto_115387 ?auto_115388 ?auto_115389 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_115392 - BLOCK
      ?auto_115393 - BLOCK
      ?auto_115394 - BLOCK
      ?auto_115395 - BLOCK
      ?auto_115396 - BLOCK
      ?auto_115397 - BLOCK
    )
    :vars
    (
      ?auto_115399 - BLOCK
      ?auto_115398 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115392 ?auto_115393 ) ) ( not ( = ?auto_115392 ?auto_115394 ) ) ( not ( = ?auto_115392 ?auto_115395 ) ) ( not ( = ?auto_115392 ?auto_115396 ) ) ( not ( = ?auto_115392 ?auto_115397 ) ) ( not ( = ?auto_115393 ?auto_115394 ) ) ( not ( = ?auto_115393 ?auto_115395 ) ) ( not ( = ?auto_115393 ?auto_115396 ) ) ( not ( = ?auto_115393 ?auto_115397 ) ) ( not ( = ?auto_115394 ?auto_115395 ) ) ( not ( = ?auto_115394 ?auto_115396 ) ) ( not ( = ?auto_115394 ?auto_115397 ) ) ( not ( = ?auto_115395 ?auto_115396 ) ) ( not ( = ?auto_115395 ?auto_115397 ) ) ( not ( = ?auto_115396 ?auto_115397 ) ) ( ON ?auto_115397 ?auto_115399 ) ( not ( = ?auto_115392 ?auto_115399 ) ) ( not ( = ?auto_115393 ?auto_115399 ) ) ( not ( = ?auto_115394 ?auto_115399 ) ) ( not ( = ?auto_115395 ?auto_115399 ) ) ( not ( = ?auto_115396 ?auto_115399 ) ) ( not ( = ?auto_115397 ?auto_115399 ) ) ( ON ?auto_115396 ?auto_115397 ) ( ON-TABLE ?auto_115399 ) ( ON ?auto_115395 ?auto_115396 ) ( ON ?auto_115394 ?auto_115395 ) ( ON ?auto_115392 ?auto_115398 ) ( not ( = ?auto_115392 ?auto_115398 ) ) ( not ( = ?auto_115393 ?auto_115398 ) ) ( not ( = ?auto_115394 ?auto_115398 ) ) ( not ( = ?auto_115395 ?auto_115398 ) ) ( not ( = ?auto_115396 ?auto_115398 ) ) ( not ( = ?auto_115397 ?auto_115398 ) ) ( not ( = ?auto_115399 ?auto_115398 ) ) ( CLEAR ?auto_115394 ) ( ON ?auto_115393 ?auto_115392 ) ( CLEAR ?auto_115393 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_115398 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_115398 ?auto_115392 )
      ( MAKE-6PILE ?auto_115392 ?auto_115393 ?auto_115394 ?auto_115395 ?auto_115396 ?auto_115397 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_115400 - BLOCK
      ?auto_115401 - BLOCK
      ?auto_115402 - BLOCK
      ?auto_115403 - BLOCK
      ?auto_115404 - BLOCK
      ?auto_115405 - BLOCK
    )
    :vars
    (
      ?auto_115407 - BLOCK
      ?auto_115406 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115400 ?auto_115401 ) ) ( not ( = ?auto_115400 ?auto_115402 ) ) ( not ( = ?auto_115400 ?auto_115403 ) ) ( not ( = ?auto_115400 ?auto_115404 ) ) ( not ( = ?auto_115400 ?auto_115405 ) ) ( not ( = ?auto_115401 ?auto_115402 ) ) ( not ( = ?auto_115401 ?auto_115403 ) ) ( not ( = ?auto_115401 ?auto_115404 ) ) ( not ( = ?auto_115401 ?auto_115405 ) ) ( not ( = ?auto_115402 ?auto_115403 ) ) ( not ( = ?auto_115402 ?auto_115404 ) ) ( not ( = ?auto_115402 ?auto_115405 ) ) ( not ( = ?auto_115403 ?auto_115404 ) ) ( not ( = ?auto_115403 ?auto_115405 ) ) ( not ( = ?auto_115404 ?auto_115405 ) ) ( ON ?auto_115405 ?auto_115407 ) ( not ( = ?auto_115400 ?auto_115407 ) ) ( not ( = ?auto_115401 ?auto_115407 ) ) ( not ( = ?auto_115402 ?auto_115407 ) ) ( not ( = ?auto_115403 ?auto_115407 ) ) ( not ( = ?auto_115404 ?auto_115407 ) ) ( not ( = ?auto_115405 ?auto_115407 ) ) ( ON ?auto_115404 ?auto_115405 ) ( ON-TABLE ?auto_115407 ) ( ON ?auto_115403 ?auto_115404 ) ( ON ?auto_115400 ?auto_115406 ) ( not ( = ?auto_115400 ?auto_115406 ) ) ( not ( = ?auto_115401 ?auto_115406 ) ) ( not ( = ?auto_115402 ?auto_115406 ) ) ( not ( = ?auto_115403 ?auto_115406 ) ) ( not ( = ?auto_115404 ?auto_115406 ) ) ( not ( = ?auto_115405 ?auto_115406 ) ) ( not ( = ?auto_115407 ?auto_115406 ) ) ( ON ?auto_115401 ?auto_115400 ) ( CLEAR ?auto_115401 ) ( ON-TABLE ?auto_115406 ) ( HOLDING ?auto_115402 ) ( CLEAR ?auto_115403 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_115407 ?auto_115405 ?auto_115404 ?auto_115403 ?auto_115402 )
      ( MAKE-6PILE ?auto_115400 ?auto_115401 ?auto_115402 ?auto_115403 ?auto_115404 ?auto_115405 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_115408 - BLOCK
      ?auto_115409 - BLOCK
      ?auto_115410 - BLOCK
      ?auto_115411 - BLOCK
      ?auto_115412 - BLOCK
      ?auto_115413 - BLOCK
    )
    :vars
    (
      ?auto_115415 - BLOCK
      ?auto_115414 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115408 ?auto_115409 ) ) ( not ( = ?auto_115408 ?auto_115410 ) ) ( not ( = ?auto_115408 ?auto_115411 ) ) ( not ( = ?auto_115408 ?auto_115412 ) ) ( not ( = ?auto_115408 ?auto_115413 ) ) ( not ( = ?auto_115409 ?auto_115410 ) ) ( not ( = ?auto_115409 ?auto_115411 ) ) ( not ( = ?auto_115409 ?auto_115412 ) ) ( not ( = ?auto_115409 ?auto_115413 ) ) ( not ( = ?auto_115410 ?auto_115411 ) ) ( not ( = ?auto_115410 ?auto_115412 ) ) ( not ( = ?auto_115410 ?auto_115413 ) ) ( not ( = ?auto_115411 ?auto_115412 ) ) ( not ( = ?auto_115411 ?auto_115413 ) ) ( not ( = ?auto_115412 ?auto_115413 ) ) ( ON ?auto_115413 ?auto_115415 ) ( not ( = ?auto_115408 ?auto_115415 ) ) ( not ( = ?auto_115409 ?auto_115415 ) ) ( not ( = ?auto_115410 ?auto_115415 ) ) ( not ( = ?auto_115411 ?auto_115415 ) ) ( not ( = ?auto_115412 ?auto_115415 ) ) ( not ( = ?auto_115413 ?auto_115415 ) ) ( ON ?auto_115412 ?auto_115413 ) ( ON-TABLE ?auto_115415 ) ( ON ?auto_115411 ?auto_115412 ) ( ON ?auto_115408 ?auto_115414 ) ( not ( = ?auto_115408 ?auto_115414 ) ) ( not ( = ?auto_115409 ?auto_115414 ) ) ( not ( = ?auto_115410 ?auto_115414 ) ) ( not ( = ?auto_115411 ?auto_115414 ) ) ( not ( = ?auto_115412 ?auto_115414 ) ) ( not ( = ?auto_115413 ?auto_115414 ) ) ( not ( = ?auto_115415 ?auto_115414 ) ) ( ON ?auto_115409 ?auto_115408 ) ( ON-TABLE ?auto_115414 ) ( CLEAR ?auto_115411 ) ( ON ?auto_115410 ?auto_115409 ) ( CLEAR ?auto_115410 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_115414 ?auto_115408 ?auto_115409 )
      ( MAKE-6PILE ?auto_115408 ?auto_115409 ?auto_115410 ?auto_115411 ?auto_115412 ?auto_115413 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_115416 - BLOCK
      ?auto_115417 - BLOCK
      ?auto_115418 - BLOCK
      ?auto_115419 - BLOCK
      ?auto_115420 - BLOCK
      ?auto_115421 - BLOCK
    )
    :vars
    (
      ?auto_115422 - BLOCK
      ?auto_115423 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115416 ?auto_115417 ) ) ( not ( = ?auto_115416 ?auto_115418 ) ) ( not ( = ?auto_115416 ?auto_115419 ) ) ( not ( = ?auto_115416 ?auto_115420 ) ) ( not ( = ?auto_115416 ?auto_115421 ) ) ( not ( = ?auto_115417 ?auto_115418 ) ) ( not ( = ?auto_115417 ?auto_115419 ) ) ( not ( = ?auto_115417 ?auto_115420 ) ) ( not ( = ?auto_115417 ?auto_115421 ) ) ( not ( = ?auto_115418 ?auto_115419 ) ) ( not ( = ?auto_115418 ?auto_115420 ) ) ( not ( = ?auto_115418 ?auto_115421 ) ) ( not ( = ?auto_115419 ?auto_115420 ) ) ( not ( = ?auto_115419 ?auto_115421 ) ) ( not ( = ?auto_115420 ?auto_115421 ) ) ( ON ?auto_115421 ?auto_115422 ) ( not ( = ?auto_115416 ?auto_115422 ) ) ( not ( = ?auto_115417 ?auto_115422 ) ) ( not ( = ?auto_115418 ?auto_115422 ) ) ( not ( = ?auto_115419 ?auto_115422 ) ) ( not ( = ?auto_115420 ?auto_115422 ) ) ( not ( = ?auto_115421 ?auto_115422 ) ) ( ON ?auto_115420 ?auto_115421 ) ( ON-TABLE ?auto_115422 ) ( ON ?auto_115416 ?auto_115423 ) ( not ( = ?auto_115416 ?auto_115423 ) ) ( not ( = ?auto_115417 ?auto_115423 ) ) ( not ( = ?auto_115418 ?auto_115423 ) ) ( not ( = ?auto_115419 ?auto_115423 ) ) ( not ( = ?auto_115420 ?auto_115423 ) ) ( not ( = ?auto_115421 ?auto_115423 ) ) ( not ( = ?auto_115422 ?auto_115423 ) ) ( ON ?auto_115417 ?auto_115416 ) ( ON-TABLE ?auto_115423 ) ( ON ?auto_115418 ?auto_115417 ) ( CLEAR ?auto_115418 ) ( HOLDING ?auto_115419 ) ( CLEAR ?auto_115420 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_115422 ?auto_115421 ?auto_115420 ?auto_115419 )
      ( MAKE-6PILE ?auto_115416 ?auto_115417 ?auto_115418 ?auto_115419 ?auto_115420 ?auto_115421 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_115424 - BLOCK
      ?auto_115425 - BLOCK
      ?auto_115426 - BLOCK
      ?auto_115427 - BLOCK
      ?auto_115428 - BLOCK
      ?auto_115429 - BLOCK
    )
    :vars
    (
      ?auto_115431 - BLOCK
      ?auto_115430 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115424 ?auto_115425 ) ) ( not ( = ?auto_115424 ?auto_115426 ) ) ( not ( = ?auto_115424 ?auto_115427 ) ) ( not ( = ?auto_115424 ?auto_115428 ) ) ( not ( = ?auto_115424 ?auto_115429 ) ) ( not ( = ?auto_115425 ?auto_115426 ) ) ( not ( = ?auto_115425 ?auto_115427 ) ) ( not ( = ?auto_115425 ?auto_115428 ) ) ( not ( = ?auto_115425 ?auto_115429 ) ) ( not ( = ?auto_115426 ?auto_115427 ) ) ( not ( = ?auto_115426 ?auto_115428 ) ) ( not ( = ?auto_115426 ?auto_115429 ) ) ( not ( = ?auto_115427 ?auto_115428 ) ) ( not ( = ?auto_115427 ?auto_115429 ) ) ( not ( = ?auto_115428 ?auto_115429 ) ) ( ON ?auto_115429 ?auto_115431 ) ( not ( = ?auto_115424 ?auto_115431 ) ) ( not ( = ?auto_115425 ?auto_115431 ) ) ( not ( = ?auto_115426 ?auto_115431 ) ) ( not ( = ?auto_115427 ?auto_115431 ) ) ( not ( = ?auto_115428 ?auto_115431 ) ) ( not ( = ?auto_115429 ?auto_115431 ) ) ( ON ?auto_115428 ?auto_115429 ) ( ON-TABLE ?auto_115431 ) ( ON ?auto_115424 ?auto_115430 ) ( not ( = ?auto_115424 ?auto_115430 ) ) ( not ( = ?auto_115425 ?auto_115430 ) ) ( not ( = ?auto_115426 ?auto_115430 ) ) ( not ( = ?auto_115427 ?auto_115430 ) ) ( not ( = ?auto_115428 ?auto_115430 ) ) ( not ( = ?auto_115429 ?auto_115430 ) ) ( not ( = ?auto_115431 ?auto_115430 ) ) ( ON ?auto_115425 ?auto_115424 ) ( ON-TABLE ?auto_115430 ) ( ON ?auto_115426 ?auto_115425 ) ( CLEAR ?auto_115428 ) ( ON ?auto_115427 ?auto_115426 ) ( CLEAR ?auto_115427 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_115430 ?auto_115424 ?auto_115425 ?auto_115426 )
      ( MAKE-6PILE ?auto_115424 ?auto_115425 ?auto_115426 ?auto_115427 ?auto_115428 ?auto_115429 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_115432 - BLOCK
      ?auto_115433 - BLOCK
      ?auto_115434 - BLOCK
      ?auto_115435 - BLOCK
      ?auto_115436 - BLOCK
      ?auto_115437 - BLOCK
    )
    :vars
    (
      ?auto_115439 - BLOCK
      ?auto_115438 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115432 ?auto_115433 ) ) ( not ( = ?auto_115432 ?auto_115434 ) ) ( not ( = ?auto_115432 ?auto_115435 ) ) ( not ( = ?auto_115432 ?auto_115436 ) ) ( not ( = ?auto_115432 ?auto_115437 ) ) ( not ( = ?auto_115433 ?auto_115434 ) ) ( not ( = ?auto_115433 ?auto_115435 ) ) ( not ( = ?auto_115433 ?auto_115436 ) ) ( not ( = ?auto_115433 ?auto_115437 ) ) ( not ( = ?auto_115434 ?auto_115435 ) ) ( not ( = ?auto_115434 ?auto_115436 ) ) ( not ( = ?auto_115434 ?auto_115437 ) ) ( not ( = ?auto_115435 ?auto_115436 ) ) ( not ( = ?auto_115435 ?auto_115437 ) ) ( not ( = ?auto_115436 ?auto_115437 ) ) ( ON ?auto_115437 ?auto_115439 ) ( not ( = ?auto_115432 ?auto_115439 ) ) ( not ( = ?auto_115433 ?auto_115439 ) ) ( not ( = ?auto_115434 ?auto_115439 ) ) ( not ( = ?auto_115435 ?auto_115439 ) ) ( not ( = ?auto_115436 ?auto_115439 ) ) ( not ( = ?auto_115437 ?auto_115439 ) ) ( ON-TABLE ?auto_115439 ) ( ON ?auto_115432 ?auto_115438 ) ( not ( = ?auto_115432 ?auto_115438 ) ) ( not ( = ?auto_115433 ?auto_115438 ) ) ( not ( = ?auto_115434 ?auto_115438 ) ) ( not ( = ?auto_115435 ?auto_115438 ) ) ( not ( = ?auto_115436 ?auto_115438 ) ) ( not ( = ?auto_115437 ?auto_115438 ) ) ( not ( = ?auto_115439 ?auto_115438 ) ) ( ON ?auto_115433 ?auto_115432 ) ( ON-TABLE ?auto_115438 ) ( ON ?auto_115434 ?auto_115433 ) ( ON ?auto_115435 ?auto_115434 ) ( CLEAR ?auto_115435 ) ( HOLDING ?auto_115436 ) ( CLEAR ?auto_115437 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_115439 ?auto_115437 ?auto_115436 )
      ( MAKE-6PILE ?auto_115432 ?auto_115433 ?auto_115434 ?auto_115435 ?auto_115436 ?auto_115437 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_115440 - BLOCK
      ?auto_115441 - BLOCK
      ?auto_115442 - BLOCK
      ?auto_115443 - BLOCK
      ?auto_115444 - BLOCK
      ?auto_115445 - BLOCK
    )
    :vars
    (
      ?auto_115447 - BLOCK
      ?auto_115446 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115440 ?auto_115441 ) ) ( not ( = ?auto_115440 ?auto_115442 ) ) ( not ( = ?auto_115440 ?auto_115443 ) ) ( not ( = ?auto_115440 ?auto_115444 ) ) ( not ( = ?auto_115440 ?auto_115445 ) ) ( not ( = ?auto_115441 ?auto_115442 ) ) ( not ( = ?auto_115441 ?auto_115443 ) ) ( not ( = ?auto_115441 ?auto_115444 ) ) ( not ( = ?auto_115441 ?auto_115445 ) ) ( not ( = ?auto_115442 ?auto_115443 ) ) ( not ( = ?auto_115442 ?auto_115444 ) ) ( not ( = ?auto_115442 ?auto_115445 ) ) ( not ( = ?auto_115443 ?auto_115444 ) ) ( not ( = ?auto_115443 ?auto_115445 ) ) ( not ( = ?auto_115444 ?auto_115445 ) ) ( ON ?auto_115445 ?auto_115447 ) ( not ( = ?auto_115440 ?auto_115447 ) ) ( not ( = ?auto_115441 ?auto_115447 ) ) ( not ( = ?auto_115442 ?auto_115447 ) ) ( not ( = ?auto_115443 ?auto_115447 ) ) ( not ( = ?auto_115444 ?auto_115447 ) ) ( not ( = ?auto_115445 ?auto_115447 ) ) ( ON-TABLE ?auto_115447 ) ( ON ?auto_115440 ?auto_115446 ) ( not ( = ?auto_115440 ?auto_115446 ) ) ( not ( = ?auto_115441 ?auto_115446 ) ) ( not ( = ?auto_115442 ?auto_115446 ) ) ( not ( = ?auto_115443 ?auto_115446 ) ) ( not ( = ?auto_115444 ?auto_115446 ) ) ( not ( = ?auto_115445 ?auto_115446 ) ) ( not ( = ?auto_115447 ?auto_115446 ) ) ( ON ?auto_115441 ?auto_115440 ) ( ON-TABLE ?auto_115446 ) ( ON ?auto_115442 ?auto_115441 ) ( ON ?auto_115443 ?auto_115442 ) ( CLEAR ?auto_115445 ) ( ON ?auto_115444 ?auto_115443 ) ( CLEAR ?auto_115444 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_115446 ?auto_115440 ?auto_115441 ?auto_115442 ?auto_115443 )
      ( MAKE-6PILE ?auto_115440 ?auto_115441 ?auto_115442 ?auto_115443 ?auto_115444 ?auto_115445 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_115448 - BLOCK
      ?auto_115449 - BLOCK
      ?auto_115450 - BLOCK
      ?auto_115451 - BLOCK
      ?auto_115452 - BLOCK
      ?auto_115453 - BLOCK
    )
    :vars
    (
      ?auto_115454 - BLOCK
      ?auto_115455 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115448 ?auto_115449 ) ) ( not ( = ?auto_115448 ?auto_115450 ) ) ( not ( = ?auto_115448 ?auto_115451 ) ) ( not ( = ?auto_115448 ?auto_115452 ) ) ( not ( = ?auto_115448 ?auto_115453 ) ) ( not ( = ?auto_115449 ?auto_115450 ) ) ( not ( = ?auto_115449 ?auto_115451 ) ) ( not ( = ?auto_115449 ?auto_115452 ) ) ( not ( = ?auto_115449 ?auto_115453 ) ) ( not ( = ?auto_115450 ?auto_115451 ) ) ( not ( = ?auto_115450 ?auto_115452 ) ) ( not ( = ?auto_115450 ?auto_115453 ) ) ( not ( = ?auto_115451 ?auto_115452 ) ) ( not ( = ?auto_115451 ?auto_115453 ) ) ( not ( = ?auto_115452 ?auto_115453 ) ) ( not ( = ?auto_115448 ?auto_115454 ) ) ( not ( = ?auto_115449 ?auto_115454 ) ) ( not ( = ?auto_115450 ?auto_115454 ) ) ( not ( = ?auto_115451 ?auto_115454 ) ) ( not ( = ?auto_115452 ?auto_115454 ) ) ( not ( = ?auto_115453 ?auto_115454 ) ) ( ON-TABLE ?auto_115454 ) ( ON ?auto_115448 ?auto_115455 ) ( not ( = ?auto_115448 ?auto_115455 ) ) ( not ( = ?auto_115449 ?auto_115455 ) ) ( not ( = ?auto_115450 ?auto_115455 ) ) ( not ( = ?auto_115451 ?auto_115455 ) ) ( not ( = ?auto_115452 ?auto_115455 ) ) ( not ( = ?auto_115453 ?auto_115455 ) ) ( not ( = ?auto_115454 ?auto_115455 ) ) ( ON ?auto_115449 ?auto_115448 ) ( ON-TABLE ?auto_115455 ) ( ON ?auto_115450 ?auto_115449 ) ( ON ?auto_115451 ?auto_115450 ) ( ON ?auto_115452 ?auto_115451 ) ( CLEAR ?auto_115452 ) ( HOLDING ?auto_115453 ) ( CLEAR ?auto_115454 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_115454 ?auto_115453 )
      ( MAKE-6PILE ?auto_115448 ?auto_115449 ?auto_115450 ?auto_115451 ?auto_115452 ?auto_115453 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_115456 - BLOCK
      ?auto_115457 - BLOCK
      ?auto_115458 - BLOCK
      ?auto_115459 - BLOCK
      ?auto_115460 - BLOCK
      ?auto_115461 - BLOCK
    )
    :vars
    (
      ?auto_115462 - BLOCK
      ?auto_115463 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115456 ?auto_115457 ) ) ( not ( = ?auto_115456 ?auto_115458 ) ) ( not ( = ?auto_115456 ?auto_115459 ) ) ( not ( = ?auto_115456 ?auto_115460 ) ) ( not ( = ?auto_115456 ?auto_115461 ) ) ( not ( = ?auto_115457 ?auto_115458 ) ) ( not ( = ?auto_115457 ?auto_115459 ) ) ( not ( = ?auto_115457 ?auto_115460 ) ) ( not ( = ?auto_115457 ?auto_115461 ) ) ( not ( = ?auto_115458 ?auto_115459 ) ) ( not ( = ?auto_115458 ?auto_115460 ) ) ( not ( = ?auto_115458 ?auto_115461 ) ) ( not ( = ?auto_115459 ?auto_115460 ) ) ( not ( = ?auto_115459 ?auto_115461 ) ) ( not ( = ?auto_115460 ?auto_115461 ) ) ( not ( = ?auto_115456 ?auto_115462 ) ) ( not ( = ?auto_115457 ?auto_115462 ) ) ( not ( = ?auto_115458 ?auto_115462 ) ) ( not ( = ?auto_115459 ?auto_115462 ) ) ( not ( = ?auto_115460 ?auto_115462 ) ) ( not ( = ?auto_115461 ?auto_115462 ) ) ( ON-TABLE ?auto_115462 ) ( ON ?auto_115456 ?auto_115463 ) ( not ( = ?auto_115456 ?auto_115463 ) ) ( not ( = ?auto_115457 ?auto_115463 ) ) ( not ( = ?auto_115458 ?auto_115463 ) ) ( not ( = ?auto_115459 ?auto_115463 ) ) ( not ( = ?auto_115460 ?auto_115463 ) ) ( not ( = ?auto_115461 ?auto_115463 ) ) ( not ( = ?auto_115462 ?auto_115463 ) ) ( ON ?auto_115457 ?auto_115456 ) ( ON-TABLE ?auto_115463 ) ( ON ?auto_115458 ?auto_115457 ) ( ON ?auto_115459 ?auto_115458 ) ( ON ?auto_115460 ?auto_115459 ) ( CLEAR ?auto_115462 ) ( ON ?auto_115461 ?auto_115460 ) ( CLEAR ?auto_115461 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_115463 ?auto_115456 ?auto_115457 ?auto_115458 ?auto_115459 ?auto_115460 )
      ( MAKE-6PILE ?auto_115456 ?auto_115457 ?auto_115458 ?auto_115459 ?auto_115460 ?auto_115461 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_115464 - BLOCK
      ?auto_115465 - BLOCK
      ?auto_115466 - BLOCK
      ?auto_115467 - BLOCK
      ?auto_115468 - BLOCK
      ?auto_115469 - BLOCK
    )
    :vars
    (
      ?auto_115470 - BLOCK
      ?auto_115471 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115464 ?auto_115465 ) ) ( not ( = ?auto_115464 ?auto_115466 ) ) ( not ( = ?auto_115464 ?auto_115467 ) ) ( not ( = ?auto_115464 ?auto_115468 ) ) ( not ( = ?auto_115464 ?auto_115469 ) ) ( not ( = ?auto_115465 ?auto_115466 ) ) ( not ( = ?auto_115465 ?auto_115467 ) ) ( not ( = ?auto_115465 ?auto_115468 ) ) ( not ( = ?auto_115465 ?auto_115469 ) ) ( not ( = ?auto_115466 ?auto_115467 ) ) ( not ( = ?auto_115466 ?auto_115468 ) ) ( not ( = ?auto_115466 ?auto_115469 ) ) ( not ( = ?auto_115467 ?auto_115468 ) ) ( not ( = ?auto_115467 ?auto_115469 ) ) ( not ( = ?auto_115468 ?auto_115469 ) ) ( not ( = ?auto_115464 ?auto_115470 ) ) ( not ( = ?auto_115465 ?auto_115470 ) ) ( not ( = ?auto_115466 ?auto_115470 ) ) ( not ( = ?auto_115467 ?auto_115470 ) ) ( not ( = ?auto_115468 ?auto_115470 ) ) ( not ( = ?auto_115469 ?auto_115470 ) ) ( ON ?auto_115464 ?auto_115471 ) ( not ( = ?auto_115464 ?auto_115471 ) ) ( not ( = ?auto_115465 ?auto_115471 ) ) ( not ( = ?auto_115466 ?auto_115471 ) ) ( not ( = ?auto_115467 ?auto_115471 ) ) ( not ( = ?auto_115468 ?auto_115471 ) ) ( not ( = ?auto_115469 ?auto_115471 ) ) ( not ( = ?auto_115470 ?auto_115471 ) ) ( ON ?auto_115465 ?auto_115464 ) ( ON-TABLE ?auto_115471 ) ( ON ?auto_115466 ?auto_115465 ) ( ON ?auto_115467 ?auto_115466 ) ( ON ?auto_115468 ?auto_115467 ) ( ON ?auto_115469 ?auto_115468 ) ( CLEAR ?auto_115469 ) ( HOLDING ?auto_115470 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_115470 )
      ( MAKE-6PILE ?auto_115464 ?auto_115465 ?auto_115466 ?auto_115467 ?auto_115468 ?auto_115469 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_115472 - BLOCK
      ?auto_115473 - BLOCK
      ?auto_115474 - BLOCK
      ?auto_115475 - BLOCK
      ?auto_115476 - BLOCK
      ?auto_115477 - BLOCK
    )
    :vars
    (
      ?auto_115478 - BLOCK
      ?auto_115479 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115472 ?auto_115473 ) ) ( not ( = ?auto_115472 ?auto_115474 ) ) ( not ( = ?auto_115472 ?auto_115475 ) ) ( not ( = ?auto_115472 ?auto_115476 ) ) ( not ( = ?auto_115472 ?auto_115477 ) ) ( not ( = ?auto_115473 ?auto_115474 ) ) ( not ( = ?auto_115473 ?auto_115475 ) ) ( not ( = ?auto_115473 ?auto_115476 ) ) ( not ( = ?auto_115473 ?auto_115477 ) ) ( not ( = ?auto_115474 ?auto_115475 ) ) ( not ( = ?auto_115474 ?auto_115476 ) ) ( not ( = ?auto_115474 ?auto_115477 ) ) ( not ( = ?auto_115475 ?auto_115476 ) ) ( not ( = ?auto_115475 ?auto_115477 ) ) ( not ( = ?auto_115476 ?auto_115477 ) ) ( not ( = ?auto_115472 ?auto_115478 ) ) ( not ( = ?auto_115473 ?auto_115478 ) ) ( not ( = ?auto_115474 ?auto_115478 ) ) ( not ( = ?auto_115475 ?auto_115478 ) ) ( not ( = ?auto_115476 ?auto_115478 ) ) ( not ( = ?auto_115477 ?auto_115478 ) ) ( ON ?auto_115472 ?auto_115479 ) ( not ( = ?auto_115472 ?auto_115479 ) ) ( not ( = ?auto_115473 ?auto_115479 ) ) ( not ( = ?auto_115474 ?auto_115479 ) ) ( not ( = ?auto_115475 ?auto_115479 ) ) ( not ( = ?auto_115476 ?auto_115479 ) ) ( not ( = ?auto_115477 ?auto_115479 ) ) ( not ( = ?auto_115478 ?auto_115479 ) ) ( ON ?auto_115473 ?auto_115472 ) ( ON-TABLE ?auto_115479 ) ( ON ?auto_115474 ?auto_115473 ) ( ON ?auto_115475 ?auto_115474 ) ( ON ?auto_115476 ?auto_115475 ) ( ON ?auto_115477 ?auto_115476 ) ( ON ?auto_115478 ?auto_115477 ) ( CLEAR ?auto_115478 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_115479 ?auto_115472 ?auto_115473 ?auto_115474 ?auto_115475 ?auto_115476 ?auto_115477 )
      ( MAKE-6PILE ?auto_115472 ?auto_115473 ?auto_115474 ?auto_115475 ?auto_115476 ?auto_115477 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_115487 - BLOCK
      ?auto_115488 - BLOCK
      ?auto_115489 - BLOCK
      ?auto_115490 - BLOCK
      ?auto_115491 - BLOCK
      ?auto_115492 - BLOCK
      ?auto_115493 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_115493 ) ( CLEAR ?auto_115492 ) ( ON-TABLE ?auto_115487 ) ( ON ?auto_115488 ?auto_115487 ) ( ON ?auto_115489 ?auto_115488 ) ( ON ?auto_115490 ?auto_115489 ) ( ON ?auto_115491 ?auto_115490 ) ( ON ?auto_115492 ?auto_115491 ) ( not ( = ?auto_115487 ?auto_115488 ) ) ( not ( = ?auto_115487 ?auto_115489 ) ) ( not ( = ?auto_115487 ?auto_115490 ) ) ( not ( = ?auto_115487 ?auto_115491 ) ) ( not ( = ?auto_115487 ?auto_115492 ) ) ( not ( = ?auto_115487 ?auto_115493 ) ) ( not ( = ?auto_115488 ?auto_115489 ) ) ( not ( = ?auto_115488 ?auto_115490 ) ) ( not ( = ?auto_115488 ?auto_115491 ) ) ( not ( = ?auto_115488 ?auto_115492 ) ) ( not ( = ?auto_115488 ?auto_115493 ) ) ( not ( = ?auto_115489 ?auto_115490 ) ) ( not ( = ?auto_115489 ?auto_115491 ) ) ( not ( = ?auto_115489 ?auto_115492 ) ) ( not ( = ?auto_115489 ?auto_115493 ) ) ( not ( = ?auto_115490 ?auto_115491 ) ) ( not ( = ?auto_115490 ?auto_115492 ) ) ( not ( = ?auto_115490 ?auto_115493 ) ) ( not ( = ?auto_115491 ?auto_115492 ) ) ( not ( = ?auto_115491 ?auto_115493 ) ) ( not ( = ?auto_115492 ?auto_115493 ) ) )
    :subtasks
    ( ( !STACK ?auto_115493 ?auto_115492 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_115494 - BLOCK
      ?auto_115495 - BLOCK
      ?auto_115496 - BLOCK
      ?auto_115497 - BLOCK
      ?auto_115498 - BLOCK
      ?auto_115499 - BLOCK
      ?auto_115500 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_115499 ) ( ON-TABLE ?auto_115494 ) ( ON ?auto_115495 ?auto_115494 ) ( ON ?auto_115496 ?auto_115495 ) ( ON ?auto_115497 ?auto_115496 ) ( ON ?auto_115498 ?auto_115497 ) ( ON ?auto_115499 ?auto_115498 ) ( not ( = ?auto_115494 ?auto_115495 ) ) ( not ( = ?auto_115494 ?auto_115496 ) ) ( not ( = ?auto_115494 ?auto_115497 ) ) ( not ( = ?auto_115494 ?auto_115498 ) ) ( not ( = ?auto_115494 ?auto_115499 ) ) ( not ( = ?auto_115494 ?auto_115500 ) ) ( not ( = ?auto_115495 ?auto_115496 ) ) ( not ( = ?auto_115495 ?auto_115497 ) ) ( not ( = ?auto_115495 ?auto_115498 ) ) ( not ( = ?auto_115495 ?auto_115499 ) ) ( not ( = ?auto_115495 ?auto_115500 ) ) ( not ( = ?auto_115496 ?auto_115497 ) ) ( not ( = ?auto_115496 ?auto_115498 ) ) ( not ( = ?auto_115496 ?auto_115499 ) ) ( not ( = ?auto_115496 ?auto_115500 ) ) ( not ( = ?auto_115497 ?auto_115498 ) ) ( not ( = ?auto_115497 ?auto_115499 ) ) ( not ( = ?auto_115497 ?auto_115500 ) ) ( not ( = ?auto_115498 ?auto_115499 ) ) ( not ( = ?auto_115498 ?auto_115500 ) ) ( not ( = ?auto_115499 ?auto_115500 ) ) ( ON-TABLE ?auto_115500 ) ( CLEAR ?auto_115500 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_115500 )
      ( MAKE-7PILE ?auto_115494 ?auto_115495 ?auto_115496 ?auto_115497 ?auto_115498 ?auto_115499 ?auto_115500 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_115501 - BLOCK
      ?auto_115502 - BLOCK
      ?auto_115503 - BLOCK
      ?auto_115504 - BLOCK
      ?auto_115505 - BLOCK
      ?auto_115506 - BLOCK
      ?auto_115507 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_115501 ) ( ON ?auto_115502 ?auto_115501 ) ( ON ?auto_115503 ?auto_115502 ) ( ON ?auto_115504 ?auto_115503 ) ( ON ?auto_115505 ?auto_115504 ) ( not ( = ?auto_115501 ?auto_115502 ) ) ( not ( = ?auto_115501 ?auto_115503 ) ) ( not ( = ?auto_115501 ?auto_115504 ) ) ( not ( = ?auto_115501 ?auto_115505 ) ) ( not ( = ?auto_115501 ?auto_115506 ) ) ( not ( = ?auto_115501 ?auto_115507 ) ) ( not ( = ?auto_115502 ?auto_115503 ) ) ( not ( = ?auto_115502 ?auto_115504 ) ) ( not ( = ?auto_115502 ?auto_115505 ) ) ( not ( = ?auto_115502 ?auto_115506 ) ) ( not ( = ?auto_115502 ?auto_115507 ) ) ( not ( = ?auto_115503 ?auto_115504 ) ) ( not ( = ?auto_115503 ?auto_115505 ) ) ( not ( = ?auto_115503 ?auto_115506 ) ) ( not ( = ?auto_115503 ?auto_115507 ) ) ( not ( = ?auto_115504 ?auto_115505 ) ) ( not ( = ?auto_115504 ?auto_115506 ) ) ( not ( = ?auto_115504 ?auto_115507 ) ) ( not ( = ?auto_115505 ?auto_115506 ) ) ( not ( = ?auto_115505 ?auto_115507 ) ) ( not ( = ?auto_115506 ?auto_115507 ) ) ( ON-TABLE ?auto_115507 ) ( CLEAR ?auto_115507 ) ( HOLDING ?auto_115506 ) ( CLEAR ?auto_115505 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_115501 ?auto_115502 ?auto_115503 ?auto_115504 ?auto_115505 ?auto_115506 )
      ( MAKE-7PILE ?auto_115501 ?auto_115502 ?auto_115503 ?auto_115504 ?auto_115505 ?auto_115506 ?auto_115507 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_115508 - BLOCK
      ?auto_115509 - BLOCK
      ?auto_115510 - BLOCK
      ?auto_115511 - BLOCK
      ?auto_115512 - BLOCK
      ?auto_115513 - BLOCK
      ?auto_115514 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_115508 ) ( ON ?auto_115509 ?auto_115508 ) ( ON ?auto_115510 ?auto_115509 ) ( ON ?auto_115511 ?auto_115510 ) ( ON ?auto_115512 ?auto_115511 ) ( not ( = ?auto_115508 ?auto_115509 ) ) ( not ( = ?auto_115508 ?auto_115510 ) ) ( not ( = ?auto_115508 ?auto_115511 ) ) ( not ( = ?auto_115508 ?auto_115512 ) ) ( not ( = ?auto_115508 ?auto_115513 ) ) ( not ( = ?auto_115508 ?auto_115514 ) ) ( not ( = ?auto_115509 ?auto_115510 ) ) ( not ( = ?auto_115509 ?auto_115511 ) ) ( not ( = ?auto_115509 ?auto_115512 ) ) ( not ( = ?auto_115509 ?auto_115513 ) ) ( not ( = ?auto_115509 ?auto_115514 ) ) ( not ( = ?auto_115510 ?auto_115511 ) ) ( not ( = ?auto_115510 ?auto_115512 ) ) ( not ( = ?auto_115510 ?auto_115513 ) ) ( not ( = ?auto_115510 ?auto_115514 ) ) ( not ( = ?auto_115511 ?auto_115512 ) ) ( not ( = ?auto_115511 ?auto_115513 ) ) ( not ( = ?auto_115511 ?auto_115514 ) ) ( not ( = ?auto_115512 ?auto_115513 ) ) ( not ( = ?auto_115512 ?auto_115514 ) ) ( not ( = ?auto_115513 ?auto_115514 ) ) ( ON-TABLE ?auto_115514 ) ( CLEAR ?auto_115512 ) ( ON ?auto_115513 ?auto_115514 ) ( CLEAR ?auto_115513 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_115514 )
      ( MAKE-7PILE ?auto_115508 ?auto_115509 ?auto_115510 ?auto_115511 ?auto_115512 ?auto_115513 ?auto_115514 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_115515 - BLOCK
      ?auto_115516 - BLOCK
      ?auto_115517 - BLOCK
      ?auto_115518 - BLOCK
      ?auto_115519 - BLOCK
      ?auto_115520 - BLOCK
      ?auto_115521 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_115515 ) ( ON ?auto_115516 ?auto_115515 ) ( ON ?auto_115517 ?auto_115516 ) ( ON ?auto_115518 ?auto_115517 ) ( not ( = ?auto_115515 ?auto_115516 ) ) ( not ( = ?auto_115515 ?auto_115517 ) ) ( not ( = ?auto_115515 ?auto_115518 ) ) ( not ( = ?auto_115515 ?auto_115519 ) ) ( not ( = ?auto_115515 ?auto_115520 ) ) ( not ( = ?auto_115515 ?auto_115521 ) ) ( not ( = ?auto_115516 ?auto_115517 ) ) ( not ( = ?auto_115516 ?auto_115518 ) ) ( not ( = ?auto_115516 ?auto_115519 ) ) ( not ( = ?auto_115516 ?auto_115520 ) ) ( not ( = ?auto_115516 ?auto_115521 ) ) ( not ( = ?auto_115517 ?auto_115518 ) ) ( not ( = ?auto_115517 ?auto_115519 ) ) ( not ( = ?auto_115517 ?auto_115520 ) ) ( not ( = ?auto_115517 ?auto_115521 ) ) ( not ( = ?auto_115518 ?auto_115519 ) ) ( not ( = ?auto_115518 ?auto_115520 ) ) ( not ( = ?auto_115518 ?auto_115521 ) ) ( not ( = ?auto_115519 ?auto_115520 ) ) ( not ( = ?auto_115519 ?auto_115521 ) ) ( not ( = ?auto_115520 ?auto_115521 ) ) ( ON-TABLE ?auto_115521 ) ( ON ?auto_115520 ?auto_115521 ) ( CLEAR ?auto_115520 ) ( HOLDING ?auto_115519 ) ( CLEAR ?auto_115518 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_115515 ?auto_115516 ?auto_115517 ?auto_115518 ?auto_115519 )
      ( MAKE-7PILE ?auto_115515 ?auto_115516 ?auto_115517 ?auto_115518 ?auto_115519 ?auto_115520 ?auto_115521 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_115522 - BLOCK
      ?auto_115523 - BLOCK
      ?auto_115524 - BLOCK
      ?auto_115525 - BLOCK
      ?auto_115526 - BLOCK
      ?auto_115527 - BLOCK
      ?auto_115528 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_115522 ) ( ON ?auto_115523 ?auto_115522 ) ( ON ?auto_115524 ?auto_115523 ) ( ON ?auto_115525 ?auto_115524 ) ( not ( = ?auto_115522 ?auto_115523 ) ) ( not ( = ?auto_115522 ?auto_115524 ) ) ( not ( = ?auto_115522 ?auto_115525 ) ) ( not ( = ?auto_115522 ?auto_115526 ) ) ( not ( = ?auto_115522 ?auto_115527 ) ) ( not ( = ?auto_115522 ?auto_115528 ) ) ( not ( = ?auto_115523 ?auto_115524 ) ) ( not ( = ?auto_115523 ?auto_115525 ) ) ( not ( = ?auto_115523 ?auto_115526 ) ) ( not ( = ?auto_115523 ?auto_115527 ) ) ( not ( = ?auto_115523 ?auto_115528 ) ) ( not ( = ?auto_115524 ?auto_115525 ) ) ( not ( = ?auto_115524 ?auto_115526 ) ) ( not ( = ?auto_115524 ?auto_115527 ) ) ( not ( = ?auto_115524 ?auto_115528 ) ) ( not ( = ?auto_115525 ?auto_115526 ) ) ( not ( = ?auto_115525 ?auto_115527 ) ) ( not ( = ?auto_115525 ?auto_115528 ) ) ( not ( = ?auto_115526 ?auto_115527 ) ) ( not ( = ?auto_115526 ?auto_115528 ) ) ( not ( = ?auto_115527 ?auto_115528 ) ) ( ON-TABLE ?auto_115528 ) ( ON ?auto_115527 ?auto_115528 ) ( CLEAR ?auto_115525 ) ( ON ?auto_115526 ?auto_115527 ) ( CLEAR ?auto_115526 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_115528 ?auto_115527 )
      ( MAKE-7PILE ?auto_115522 ?auto_115523 ?auto_115524 ?auto_115525 ?auto_115526 ?auto_115527 ?auto_115528 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_115529 - BLOCK
      ?auto_115530 - BLOCK
      ?auto_115531 - BLOCK
      ?auto_115532 - BLOCK
      ?auto_115533 - BLOCK
      ?auto_115534 - BLOCK
      ?auto_115535 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_115529 ) ( ON ?auto_115530 ?auto_115529 ) ( ON ?auto_115531 ?auto_115530 ) ( not ( = ?auto_115529 ?auto_115530 ) ) ( not ( = ?auto_115529 ?auto_115531 ) ) ( not ( = ?auto_115529 ?auto_115532 ) ) ( not ( = ?auto_115529 ?auto_115533 ) ) ( not ( = ?auto_115529 ?auto_115534 ) ) ( not ( = ?auto_115529 ?auto_115535 ) ) ( not ( = ?auto_115530 ?auto_115531 ) ) ( not ( = ?auto_115530 ?auto_115532 ) ) ( not ( = ?auto_115530 ?auto_115533 ) ) ( not ( = ?auto_115530 ?auto_115534 ) ) ( not ( = ?auto_115530 ?auto_115535 ) ) ( not ( = ?auto_115531 ?auto_115532 ) ) ( not ( = ?auto_115531 ?auto_115533 ) ) ( not ( = ?auto_115531 ?auto_115534 ) ) ( not ( = ?auto_115531 ?auto_115535 ) ) ( not ( = ?auto_115532 ?auto_115533 ) ) ( not ( = ?auto_115532 ?auto_115534 ) ) ( not ( = ?auto_115532 ?auto_115535 ) ) ( not ( = ?auto_115533 ?auto_115534 ) ) ( not ( = ?auto_115533 ?auto_115535 ) ) ( not ( = ?auto_115534 ?auto_115535 ) ) ( ON-TABLE ?auto_115535 ) ( ON ?auto_115534 ?auto_115535 ) ( ON ?auto_115533 ?auto_115534 ) ( CLEAR ?auto_115533 ) ( HOLDING ?auto_115532 ) ( CLEAR ?auto_115531 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_115529 ?auto_115530 ?auto_115531 ?auto_115532 )
      ( MAKE-7PILE ?auto_115529 ?auto_115530 ?auto_115531 ?auto_115532 ?auto_115533 ?auto_115534 ?auto_115535 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_115536 - BLOCK
      ?auto_115537 - BLOCK
      ?auto_115538 - BLOCK
      ?auto_115539 - BLOCK
      ?auto_115540 - BLOCK
      ?auto_115541 - BLOCK
      ?auto_115542 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_115536 ) ( ON ?auto_115537 ?auto_115536 ) ( ON ?auto_115538 ?auto_115537 ) ( not ( = ?auto_115536 ?auto_115537 ) ) ( not ( = ?auto_115536 ?auto_115538 ) ) ( not ( = ?auto_115536 ?auto_115539 ) ) ( not ( = ?auto_115536 ?auto_115540 ) ) ( not ( = ?auto_115536 ?auto_115541 ) ) ( not ( = ?auto_115536 ?auto_115542 ) ) ( not ( = ?auto_115537 ?auto_115538 ) ) ( not ( = ?auto_115537 ?auto_115539 ) ) ( not ( = ?auto_115537 ?auto_115540 ) ) ( not ( = ?auto_115537 ?auto_115541 ) ) ( not ( = ?auto_115537 ?auto_115542 ) ) ( not ( = ?auto_115538 ?auto_115539 ) ) ( not ( = ?auto_115538 ?auto_115540 ) ) ( not ( = ?auto_115538 ?auto_115541 ) ) ( not ( = ?auto_115538 ?auto_115542 ) ) ( not ( = ?auto_115539 ?auto_115540 ) ) ( not ( = ?auto_115539 ?auto_115541 ) ) ( not ( = ?auto_115539 ?auto_115542 ) ) ( not ( = ?auto_115540 ?auto_115541 ) ) ( not ( = ?auto_115540 ?auto_115542 ) ) ( not ( = ?auto_115541 ?auto_115542 ) ) ( ON-TABLE ?auto_115542 ) ( ON ?auto_115541 ?auto_115542 ) ( ON ?auto_115540 ?auto_115541 ) ( CLEAR ?auto_115538 ) ( ON ?auto_115539 ?auto_115540 ) ( CLEAR ?auto_115539 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_115542 ?auto_115541 ?auto_115540 )
      ( MAKE-7PILE ?auto_115536 ?auto_115537 ?auto_115538 ?auto_115539 ?auto_115540 ?auto_115541 ?auto_115542 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_115543 - BLOCK
      ?auto_115544 - BLOCK
      ?auto_115545 - BLOCK
      ?auto_115546 - BLOCK
      ?auto_115547 - BLOCK
      ?auto_115548 - BLOCK
      ?auto_115549 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_115543 ) ( ON ?auto_115544 ?auto_115543 ) ( not ( = ?auto_115543 ?auto_115544 ) ) ( not ( = ?auto_115543 ?auto_115545 ) ) ( not ( = ?auto_115543 ?auto_115546 ) ) ( not ( = ?auto_115543 ?auto_115547 ) ) ( not ( = ?auto_115543 ?auto_115548 ) ) ( not ( = ?auto_115543 ?auto_115549 ) ) ( not ( = ?auto_115544 ?auto_115545 ) ) ( not ( = ?auto_115544 ?auto_115546 ) ) ( not ( = ?auto_115544 ?auto_115547 ) ) ( not ( = ?auto_115544 ?auto_115548 ) ) ( not ( = ?auto_115544 ?auto_115549 ) ) ( not ( = ?auto_115545 ?auto_115546 ) ) ( not ( = ?auto_115545 ?auto_115547 ) ) ( not ( = ?auto_115545 ?auto_115548 ) ) ( not ( = ?auto_115545 ?auto_115549 ) ) ( not ( = ?auto_115546 ?auto_115547 ) ) ( not ( = ?auto_115546 ?auto_115548 ) ) ( not ( = ?auto_115546 ?auto_115549 ) ) ( not ( = ?auto_115547 ?auto_115548 ) ) ( not ( = ?auto_115547 ?auto_115549 ) ) ( not ( = ?auto_115548 ?auto_115549 ) ) ( ON-TABLE ?auto_115549 ) ( ON ?auto_115548 ?auto_115549 ) ( ON ?auto_115547 ?auto_115548 ) ( ON ?auto_115546 ?auto_115547 ) ( CLEAR ?auto_115546 ) ( HOLDING ?auto_115545 ) ( CLEAR ?auto_115544 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_115543 ?auto_115544 ?auto_115545 )
      ( MAKE-7PILE ?auto_115543 ?auto_115544 ?auto_115545 ?auto_115546 ?auto_115547 ?auto_115548 ?auto_115549 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_115550 - BLOCK
      ?auto_115551 - BLOCK
      ?auto_115552 - BLOCK
      ?auto_115553 - BLOCK
      ?auto_115554 - BLOCK
      ?auto_115555 - BLOCK
      ?auto_115556 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_115550 ) ( ON ?auto_115551 ?auto_115550 ) ( not ( = ?auto_115550 ?auto_115551 ) ) ( not ( = ?auto_115550 ?auto_115552 ) ) ( not ( = ?auto_115550 ?auto_115553 ) ) ( not ( = ?auto_115550 ?auto_115554 ) ) ( not ( = ?auto_115550 ?auto_115555 ) ) ( not ( = ?auto_115550 ?auto_115556 ) ) ( not ( = ?auto_115551 ?auto_115552 ) ) ( not ( = ?auto_115551 ?auto_115553 ) ) ( not ( = ?auto_115551 ?auto_115554 ) ) ( not ( = ?auto_115551 ?auto_115555 ) ) ( not ( = ?auto_115551 ?auto_115556 ) ) ( not ( = ?auto_115552 ?auto_115553 ) ) ( not ( = ?auto_115552 ?auto_115554 ) ) ( not ( = ?auto_115552 ?auto_115555 ) ) ( not ( = ?auto_115552 ?auto_115556 ) ) ( not ( = ?auto_115553 ?auto_115554 ) ) ( not ( = ?auto_115553 ?auto_115555 ) ) ( not ( = ?auto_115553 ?auto_115556 ) ) ( not ( = ?auto_115554 ?auto_115555 ) ) ( not ( = ?auto_115554 ?auto_115556 ) ) ( not ( = ?auto_115555 ?auto_115556 ) ) ( ON-TABLE ?auto_115556 ) ( ON ?auto_115555 ?auto_115556 ) ( ON ?auto_115554 ?auto_115555 ) ( ON ?auto_115553 ?auto_115554 ) ( CLEAR ?auto_115551 ) ( ON ?auto_115552 ?auto_115553 ) ( CLEAR ?auto_115552 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_115556 ?auto_115555 ?auto_115554 ?auto_115553 )
      ( MAKE-7PILE ?auto_115550 ?auto_115551 ?auto_115552 ?auto_115553 ?auto_115554 ?auto_115555 ?auto_115556 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_115557 - BLOCK
      ?auto_115558 - BLOCK
      ?auto_115559 - BLOCK
      ?auto_115560 - BLOCK
      ?auto_115561 - BLOCK
      ?auto_115562 - BLOCK
      ?auto_115563 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_115557 ) ( not ( = ?auto_115557 ?auto_115558 ) ) ( not ( = ?auto_115557 ?auto_115559 ) ) ( not ( = ?auto_115557 ?auto_115560 ) ) ( not ( = ?auto_115557 ?auto_115561 ) ) ( not ( = ?auto_115557 ?auto_115562 ) ) ( not ( = ?auto_115557 ?auto_115563 ) ) ( not ( = ?auto_115558 ?auto_115559 ) ) ( not ( = ?auto_115558 ?auto_115560 ) ) ( not ( = ?auto_115558 ?auto_115561 ) ) ( not ( = ?auto_115558 ?auto_115562 ) ) ( not ( = ?auto_115558 ?auto_115563 ) ) ( not ( = ?auto_115559 ?auto_115560 ) ) ( not ( = ?auto_115559 ?auto_115561 ) ) ( not ( = ?auto_115559 ?auto_115562 ) ) ( not ( = ?auto_115559 ?auto_115563 ) ) ( not ( = ?auto_115560 ?auto_115561 ) ) ( not ( = ?auto_115560 ?auto_115562 ) ) ( not ( = ?auto_115560 ?auto_115563 ) ) ( not ( = ?auto_115561 ?auto_115562 ) ) ( not ( = ?auto_115561 ?auto_115563 ) ) ( not ( = ?auto_115562 ?auto_115563 ) ) ( ON-TABLE ?auto_115563 ) ( ON ?auto_115562 ?auto_115563 ) ( ON ?auto_115561 ?auto_115562 ) ( ON ?auto_115560 ?auto_115561 ) ( ON ?auto_115559 ?auto_115560 ) ( CLEAR ?auto_115559 ) ( HOLDING ?auto_115558 ) ( CLEAR ?auto_115557 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_115557 ?auto_115558 )
      ( MAKE-7PILE ?auto_115557 ?auto_115558 ?auto_115559 ?auto_115560 ?auto_115561 ?auto_115562 ?auto_115563 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_115564 - BLOCK
      ?auto_115565 - BLOCK
      ?auto_115566 - BLOCK
      ?auto_115567 - BLOCK
      ?auto_115568 - BLOCK
      ?auto_115569 - BLOCK
      ?auto_115570 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_115564 ) ( not ( = ?auto_115564 ?auto_115565 ) ) ( not ( = ?auto_115564 ?auto_115566 ) ) ( not ( = ?auto_115564 ?auto_115567 ) ) ( not ( = ?auto_115564 ?auto_115568 ) ) ( not ( = ?auto_115564 ?auto_115569 ) ) ( not ( = ?auto_115564 ?auto_115570 ) ) ( not ( = ?auto_115565 ?auto_115566 ) ) ( not ( = ?auto_115565 ?auto_115567 ) ) ( not ( = ?auto_115565 ?auto_115568 ) ) ( not ( = ?auto_115565 ?auto_115569 ) ) ( not ( = ?auto_115565 ?auto_115570 ) ) ( not ( = ?auto_115566 ?auto_115567 ) ) ( not ( = ?auto_115566 ?auto_115568 ) ) ( not ( = ?auto_115566 ?auto_115569 ) ) ( not ( = ?auto_115566 ?auto_115570 ) ) ( not ( = ?auto_115567 ?auto_115568 ) ) ( not ( = ?auto_115567 ?auto_115569 ) ) ( not ( = ?auto_115567 ?auto_115570 ) ) ( not ( = ?auto_115568 ?auto_115569 ) ) ( not ( = ?auto_115568 ?auto_115570 ) ) ( not ( = ?auto_115569 ?auto_115570 ) ) ( ON-TABLE ?auto_115570 ) ( ON ?auto_115569 ?auto_115570 ) ( ON ?auto_115568 ?auto_115569 ) ( ON ?auto_115567 ?auto_115568 ) ( ON ?auto_115566 ?auto_115567 ) ( CLEAR ?auto_115564 ) ( ON ?auto_115565 ?auto_115566 ) ( CLEAR ?auto_115565 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_115570 ?auto_115569 ?auto_115568 ?auto_115567 ?auto_115566 )
      ( MAKE-7PILE ?auto_115564 ?auto_115565 ?auto_115566 ?auto_115567 ?auto_115568 ?auto_115569 ?auto_115570 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_115571 - BLOCK
      ?auto_115572 - BLOCK
      ?auto_115573 - BLOCK
      ?auto_115574 - BLOCK
      ?auto_115575 - BLOCK
      ?auto_115576 - BLOCK
      ?auto_115577 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115571 ?auto_115572 ) ) ( not ( = ?auto_115571 ?auto_115573 ) ) ( not ( = ?auto_115571 ?auto_115574 ) ) ( not ( = ?auto_115571 ?auto_115575 ) ) ( not ( = ?auto_115571 ?auto_115576 ) ) ( not ( = ?auto_115571 ?auto_115577 ) ) ( not ( = ?auto_115572 ?auto_115573 ) ) ( not ( = ?auto_115572 ?auto_115574 ) ) ( not ( = ?auto_115572 ?auto_115575 ) ) ( not ( = ?auto_115572 ?auto_115576 ) ) ( not ( = ?auto_115572 ?auto_115577 ) ) ( not ( = ?auto_115573 ?auto_115574 ) ) ( not ( = ?auto_115573 ?auto_115575 ) ) ( not ( = ?auto_115573 ?auto_115576 ) ) ( not ( = ?auto_115573 ?auto_115577 ) ) ( not ( = ?auto_115574 ?auto_115575 ) ) ( not ( = ?auto_115574 ?auto_115576 ) ) ( not ( = ?auto_115574 ?auto_115577 ) ) ( not ( = ?auto_115575 ?auto_115576 ) ) ( not ( = ?auto_115575 ?auto_115577 ) ) ( not ( = ?auto_115576 ?auto_115577 ) ) ( ON-TABLE ?auto_115577 ) ( ON ?auto_115576 ?auto_115577 ) ( ON ?auto_115575 ?auto_115576 ) ( ON ?auto_115574 ?auto_115575 ) ( ON ?auto_115573 ?auto_115574 ) ( ON ?auto_115572 ?auto_115573 ) ( CLEAR ?auto_115572 ) ( HOLDING ?auto_115571 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_115571 )
      ( MAKE-7PILE ?auto_115571 ?auto_115572 ?auto_115573 ?auto_115574 ?auto_115575 ?auto_115576 ?auto_115577 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_115578 - BLOCK
      ?auto_115579 - BLOCK
      ?auto_115580 - BLOCK
      ?auto_115581 - BLOCK
      ?auto_115582 - BLOCK
      ?auto_115583 - BLOCK
      ?auto_115584 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115578 ?auto_115579 ) ) ( not ( = ?auto_115578 ?auto_115580 ) ) ( not ( = ?auto_115578 ?auto_115581 ) ) ( not ( = ?auto_115578 ?auto_115582 ) ) ( not ( = ?auto_115578 ?auto_115583 ) ) ( not ( = ?auto_115578 ?auto_115584 ) ) ( not ( = ?auto_115579 ?auto_115580 ) ) ( not ( = ?auto_115579 ?auto_115581 ) ) ( not ( = ?auto_115579 ?auto_115582 ) ) ( not ( = ?auto_115579 ?auto_115583 ) ) ( not ( = ?auto_115579 ?auto_115584 ) ) ( not ( = ?auto_115580 ?auto_115581 ) ) ( not ( = ?auto_115580 ?auto_115582 ) ) ( not ( = ?auto_115580 ?auto_115583 ) ) ( not ( = ?auto_115580 ?auto_115584 ) ) ( not ( = ?auto_115581 ?auto_115582 ) ) ( not ( = ?auto_115581 ?auto_115583 ) ) ( not ( = ?auto_115581 ?auto_115584 ) ) ( not ( = ?auto_115582 ?auto_115583 ) ) ( not ( = ?auto_115582 ?auto_115584 ) ) ( not ( = ?auto_115583 ?auto_115584 ) ) ( ON-TABLE ?auto_115584 ) ( ON ?auto_115583 ?auto_115584 ) ( ON ?auto_115582 ?auto_115583 ) ( ON ?auto_115581 ?auto_115582 ) ( ON ?auto_115580 ?auto_115581 ) ( ON ?auto_115579 ?auto_115580 ) ( ON ?auto_115578 ?auto_115579 ) ( CLEAR ?auto_115578 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_115584 ?auto_115583 ?auto_115582 ?auto_115581 ?auto_115580 ?auto_115579 )
      ( MAKE-7PILE ?auto_115578 ?auto_115579 ?auto_115580 ?auto_115581 ?auto_115582 ?auto_115583 ?auto_115584 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_115585 - BLOCK
      ?auto_115586 - BLOCK
      ?auto_115587 - BLOCK
      ?auto_115588 - BLOCK
      ?auto_115589 - BLOCK
      ?auto_115590 - BLOCK
      ?auto_115591 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115585 ?auto_115586 ) ) ( not ( = ?auto_115585 ?auto_115587 ) ) ( not ( = ?auto_115585 ?auto_115588 ) ) ( not ( = ?auto_115585 ?auto_115589 ) ) ( not ( = ?auto_115585 ?auto_115590 ) ) ( not ( = ?auto_115585 ?auto_115591 ) ) ( not ( = ?auto_115586 ?auto_115587 ) ) ( not ( = ?auto_115586 ?auto_115588 ) ) ( not ( = ?auto_115586 ?auto_115589 ) ) ( not ( = ?auto_115586 ?auto_115590 ) ) ( not ( = ?auto_115586 ?auto_115591 ) ) ( not ( = ?auto_115587 ?auto_115588 ) ) ( not ( = ?auto_115587 ?auto_115589 ) ) ( not ( = ?auto_115587 ?auto_115590 ) ) ( not ( = ?auto_115587 ?auto_115591 ) ) ( not ( = ?auto_115588 ?auto_115589 ) ) ( not ( = ?auto_115588 ?auto_115590 ) ) ( not ( = ?auto_115588 ?auto_115591 ) ) ( not ( = ?auto_115589 ?auto_115590 ) ) ( not ( = ?auto_115589 ?auto_115591 ) ) ( not ( = ?auto_115590 ?auto_115591 ) ) ( ON-TABLE ?auto_115591 ) ( ON ?auto_115590 ?auto_115591 ) ( ON ?auto_115589 ?auto_115590 ) ( ON ?auto_115588 ?auto_115589 ) ( ON ?auto_115587 ?auto_115588 ) ( ON ?auto_115586 ?auto_115587 ) ( HOLDING ?auto_115585 ) ( CLEAR ?auto_115586 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_115591 ?auto_115590 ?auto_115589 ?auto_115588 ?auto_115587 ?auto_115586 ?auto_115585 )
      ( MAKE-7PILE ?auto_115585 ?auto_115586 ?auto_115587 ?auto_115588 ?auto_115589 ?auto_115590 ?auto_115591 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_115592 - BLOCK
      ?auto_115593 - BLOCK
      ?auto_115594 - BLOCK
      ?auto_115595 - BLOCK
      ?auto_115596 - BLOCK
      ?auto_115597 - BLOCK
      ?auto_115598 - BLOCK
    )
    :vars
    (
      ?auto_115599 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115592 ?auto_115593 ) ) ( not ( = ?auto_115592 ?auto_115594 ) ) ( not ( = ?auto_115592 ?auto_115595 ) ) ( not ( = ?auto_115592 ?auto_115596 ) ) ( not ( = ?auto_115592 ?auto_115597 ) ) ( not ( = ?auto_115592 ?auto_115598 ) ) ( not ( = ?auto_115593 ?auto_115594 ) ) ( not ( = ?auto_115593 ?auto_115595 ) ) ( not ( = ?auto_115593 ?auto_115596 ) ) ( not ( = ?auto_115593 ?auto_115597 ) ) ( not ( = ?auto_115593 ?auto_115598 ) ) ( not ( = ?auto_115594 ?auto_115595 ) ) ( not ( = ?auto_115594 ?auto_115596 ) ) ( not ( = ?auto_115594 ?auto_115597 ) ) ( not ( = ?auto_115594 ?auto_115598 ) ) ( not ( = ?auto_115595 ?auto_115596 ) ) ( not ( = ?auto_115595 ?auto_115597 ) ) ( not ( = ?auto_115595 ?auto_115598 ) ) ( not ( = ?auto_115596 ?auto_115597 ) ) ( not ( = ?auto_115596 ?auto_115598 ) ) ( not ( = ?auto_115597 ?auto_115598 ) ) ( ON-TABLE ?auto_115598 ) ( ON ?auto_115597 ?auto_115598 ) ( ON ?auto_115596 ?auto_115597 ) ( ON ?auto_115595 ?auto_115596 ) ( ON ?auto_115594 ?auto_115595 ) ( ON ?auto_115593 ?auto_115594 ) ( CLEAR ?auto_115593 ) ( ON ?auto_115592 ?auto_115599 ) ( CLEAR ?auto_115592 ) ( HAND-EMPTY ) ( not ( = ?auto_115592 ?auto_115599 ) ) ( not ( = ?auto_115593 ?auto_115599 ) ) ( not ( = ?auto_115594 ?auto_115599 ) ) ( not ( = ?auto_115595 ?auto_115599 ) ) ( not ( = ?auto_115596 ?auto_115599 ) ) ( not ( = ?auto_115597 ?auto_115599 ) ) ( not ( = ?auto_115598 ?auto_115599 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_115592 ?auto_115599 )
      ( MAKE-7PILE ?auto_115592 ?auto_115593 ?auto_115594 ?auto_115595 ?auto_115596 ?auto_115597 ?auto_115598 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_115600 - BLOCK
      ?auto_115601 - BLOCK
      ?auto_115602 - BLOCK
      ?auto_115603 - BLOCK
      ?auto_115604 - BLOCK
      ?auto_115605 - BLOCK
      ?auto_115606 - BLOCK
    )
    :vars
    (
      ?auto_115607 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115600 ?auto_115601 ) ) ( not ( = ?auto_115600 ?auto_115602 ) ) ( not ( = ?auto_115600 ?auto_115603 ) ) ( not ( = ?auto_115600 ?auto_115604 ) ) ( not ( = ?auto_115600 ?auto_115605 ) ) ( not ( = ?auto_115600 ?auto_115606 ) ) ( not ( = ?auto_115601 ?auto_115602 ) ) ( not ( = ?auto_115601 ?auto_115603 ) ) ( not ( = ?auto_115601 ?auto_115604 ) ) ( not ( = ?auto_115601 ?auto_115605 ) ) ( not ( = ?auto_115601 ?auto_115606 ) ) ( not ( = ?auto_115602 ?auto_115603 ) ) ( not ( = ?auto_115602 ?auto_115604 ) ) ( not ( = ?auto_115602 ?auto_115605 ) ) ( not ( = ?auto_115602 ?auto_115606 ) ) ( not ( = ?auto_115603 ?auto_115604 ) ) ( not ( = ?auto_115603 ?auto_115605 ) ) ( not ( = ?auto_115603 ?auto_115606 ) ) ( not ( = ?auto_115604 ?auto_115605 ) ) ( not ( = ?auto_115604 ?auto_115606 ) ) ( not ( = ?auto_115605 ?auto_115606 ) ) ( ON-TABLE ?auto_115606 ) ( ON ?auto_115605 ?auto_115606 ) ( ON ?auto_115604 ?auto_115605 ) ( ON ?auto_115603 ?auto_115604 ) ( ON ?auto_115602 ?auto_115603 ) ( ON ?auto_115600 ?auto_115607 ) ( CLEAR ?auto_115600 ) ( not ( = ?auto_115600 ?auto_115607 ) ) ( not ( = ?auto_115601 ?auto_115607 ) ) ( not ( = ?auto_115602 ?auto_115607 ) ) ( not ( = ?auto_115603 ?auto_115607 ) ) ( not ( = ?auto_115604 ?auto_115607 ) ) ( not ( = ?auto_115605 ?auto_115607 ) ) ( not ( = ?auto_115606 ?auto_115607 ) ) ( HOLDING ?auto_115601 ) ( CLEAR ?auto_115602 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_115606 ?auto_115605 ?auto_115604 ?auto_115603 ?auto_115602 ?auto_115601 )
      ( MAKE-7PILE ?auto_115600 ?auto_115601 ?auto_115602 ?auto_115603 ?auto_115604 ?auto_115605 ?auto_115606 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_115608 - BLOCK
      ?auto_115609 - BLOCK
      ?auto_115610 - BLOCK
      ?auto_115611 - BLOCK
      ?auto_115612 - BLOCK
      ?auto_115613 - BLOCK
      ?auto_115614 - BLOCK
    )
    :vars
    (
      ?auto_115615 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115608 ?auto_115609 ) ) ( not ( = ?auto_115608 ?auto_115610 ) ) ( not ( = ?auto_115608 ?auto_115611 ) ) ( not ( = ?auto_115608 ?auto_115612 ) ) ( not ( = ?auto_115608 ?auto_115613 ) ) ( not ( = ?auto_115608 ?auto_115614 ) ) ( not ( = ?auto_115609 ?auto_115610 ) ) ( not ( = ?auto_115609 ?auto_115611 ) ) ( not ( = ?auto_115609 ?auto_115612 ) ) ( not ( = ?auto_115609 ?auto_115613 ) ) ( not ( = ?auto_115609 ?auto_115614 ) ) ( not ( = ?auto_115610 ?auto_115611 ) ) ( not ( = ?auto_115610 ?auto_115612 ) ) ( not ( = ?auto_115610 ?auto_115613 ) ) ( not ( = ?auto_115610 ?auto_115614 ) ) ( not ( = ?auto_115611 ?auto_115612 ) ) ( not ( = ?auto_115611 ?auto_115613 ) ) ( not ( = ?auto_115611 ?auto_115614 ) ) ( not ( = ?auto_115612 ?auto_115613 ) ) ( not ( = ?auto_115612 ?auto_115614 ) ) ( not ( = ?auto_115613 ?auto_115614 ) ) ( ON-TABLE ?auto_115614 ) ( ON ?auto_115613 ?auto_115614 ) ( ON ?auto_115612 ?auto_115613 ) ( ON ?auto_115611 ?auto_115612 ) ( ON ?auto_115610 ?auto_115611 ) ( ON ?auto_115608 ?auto_115615 ) ( not ( = ?auto_115608 ?auto_115615 ) ) ( not ( = ?auto_115609 ?auto_115615 ) ) ( not ( = ?auto_115610 ?auto_115615 ) ) ( not ( = ?auto_115611 ?auto_115615 ) ) ( not ( = ?auto_115612 ?auto_115615 ) ) ( not ( = ?auto_115613 ?auto_115615 ) ) ( not ( = ?auto_115614 ?auto_115615 ) ) ( CLEAR ?auto_115610 ) ( ON ?auto_115609 ?auto_115608 ) ( CLEAR ?auto_115609 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_115615 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_115615 ?auto_115608 )
      ( MAKE-7PILE ?auto_115608 ?auto_115609 ?auto_115610 ?auto_115611 ?auto_115612 ?auto_115613 ?auto_115614 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_115616 - BLOCK
      ?auto_115617 - BLOCK
      ?auto_115618 - BLOCK
      ?auto_115619 - BLOCK
      ?auto_115620 - BLOCK
      ?auto_115621 - BLOCK
      ?auto_115622 - BLOCK
    )
    :vars
    (
      ?auto_115623 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115616 ?auto_115617 ) ) ( not ( = ?auto_115616 ?auto_115618 ) ) ( not ( = ?auto_115616 ?auto_115619 ) ) ( not ( = ?auto_115616 ?auto_115620 ) ) ( not ( = ?auto_115616 ?auto_115621 ) ) ( not ( = ?auto_115616 ?auto_115622 ) ) ( not ( = ?auto_115617 ?auto_115618 ) ) ( not ( = ?auto_115617 ?auto_115619 ) ) ( not ( = ?auto_115617 ?auto_115620 ) ) ( not ( = ?auto_115617 ?auto_115621 ) ) ( not ( = ?auto_115617 ?auto_115622 ) ) ( not ( = ?auto_115618 ?auto_115619 ) ) ( not ( = ?auto_115618 ?auto_115620 ) ) ( not ( = ?auto_115618 ?auto_115621 ) ) ( not ( = ?auto_115618 ?auto_115622 ) ) ( not ( = ?auto_115619 ?auto_115620 ) ) ( not ( = ?auto_115619 ?auto_115621 ) ) ( not ( = ?auto_115619 ?auto_115622 ) ) ( not ( = ?auto_115620 ?auto_115621 ) ) ( not ( = ?auto_115620 ?auto_115622 ) ) ( not ( = ?auto_115621 ?auto_115622 ) ) ( ON-TABLE ?auto_115622 ) ( ON ?auto_115621 ?auto_115622 ) ( ON ?auto_115620 ?auto_115621 ) ( ON ?auto_115619 ?auto_115620 ) ( ON ?auto_115616 ?auto_115623 ) ( not ( = ?auto_115616 ?auto_115623 ) ) ( not ( = ?auto_115617 ?auto_115623 ) ) ( not ( = ?auto_115618 ?auto_115623 ) ) ( not ( = ?auto_115619 ?auto_115623 ) ) ( not ( = ?auto_115620 ?auto_115623 ) ) ( not ( = ?auto_115621 ?auto_115623 ) ) ( not ( = ?auto_115622 ?auto_115623 ) ) ( ON ?auto_115617 ?auto_115616 ) ( CLEAR ?auto_115617 ) ( ON-TABLE ?auto_115623 ) ( HOLDING ?auto_115618 ) ( CLEAR ?auto_115619 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_115622 ?auto_115621 ?auto_115620 ?auto_115619 ?auto_115618 )
      ( MAKE-7PILE ?auto_115616 ?auto_115617 ?auto_115618 ?auto_115619 ?auto_115620 ?auto_115621 ?auto_115622 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_115624 - BLOCK
      ?auto_115625 - BLOCK
      ?auto_115626 - BLOCK
      ?auto_115627 - BLOCK
      ?auto_115628 - BLOCK
      ?auto_115629 - BLOCK
      ?auto_115630 - BLOCK
    )
    :vars
    (
      ?auto_115631 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115624 ?auto_115625 ) ) ( not ( = ?auto_115624 ?auto_115626 ) ) ( not ( = ?auto_115624 ?auto_115627 ) ) ( not ( = ?auto_115624 ?auto_115628 ) ) ( not ( = ?auto_115624 ?auto_115629 ) ) ( not ( = ?auto_115624 ?auto_115630 ) ) ( not ( = ?auto_115625 ?auto_115626 ) ) ( not ( = ?auto_115625 ?auto_115627 ) ) ( not ( = ?auto_115625 ?auto_115628 ) ) ( not ( = ?auto_115625 ?auto_115629 ) ) ( not ( = ?auto_115625 ?auto_115630 ) ) ( not ( = ?auto_115626 ?auto_115627 ) ) ( not ( = ?auto_115626 ?auto_115628 ) ) ( not ( = ?auto_115626 ?auto_115629 ) ) ( not ( = ?auto_115626 ?auto_115630 ) ) ( not ( = ?auto_115627 ?auto_115628 ) ) ( not ( = ?auto_115627 ?auto_115629 ) ) ( not ( = ?auto_115627 ?auto_115630 ) ) ( not ( = ?auto_115628 ?auto_115629 ) ) ( not ( = ?auto_115628 ?auto_115630 ) ) ( not ( = ?auto_115629 ?auto_115630 ) ) ( ON-TABLE ?auto_115630 ) ( ON ?auto_115629 ?auto_115630 ) ( ON ?auto_115628 ?auto_115629 ) ( ON ?auto_115627 ?auto_115628 ) ( ON ?auto_115624 ?auto_115631 ) ( not ( = ?auto_115624 ?auto_115631 ) ) ( not ( = ?auto_115625 ?auto_115631 ) ) ( not ( = ?auto_115626 ?auto_115631 ) ) ( not ( = ?auto_115627 ?auto_115631 ) ) ( not ( = ?auto_115628 ?auto_115631 ) ) ( not ( = ?auto_115629 ?auto_115631 ) ) ( not ( = ?auto_115630 ?auto_115631 ) ) ( ON ?auto_115625 ?auto_115624 ) ( ON-TABLE ?auto_115631 ) ( CLEAR ?auto_115627 ) ( ON ?auto_115626 ?auto_115625 ) ( CLEAR ?auto_115626 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_115631 ?auto_115624 ?auto_115625 )
      ( MAKE-7PILE ?auto_115624 ?auto_115625 ?auto_115626 ?auto_115627 ?auto_115628 ?auto_115629 ?auto_115630 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_115632 - BLOCK
      ?auto_115633 - BLOCK
      ?auto_115634 - BLOCK
      ?auto_115635 - BLOCK
      ?auto_115636 - BLOCK
      ?auto_115637 - BLOCK
      ?auto_115638 - BLOCK
    )
    :vars
    (
      ?auto_115639 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115632 ?auto_115633 ) ) ( not ( = ?auto_115632 ?auto_115634 ) ) ( not ( = ?auto_115632 ?auto_115635 ) ) ( not ( = ?auto_115632 ?auto_115636 ) ) ( not ( = ?auto_115632 ?auto_115637 ) ) ( not ( = ?auto_115632 ?auto_115638 ) ) ( not ( = ?auto_115633 ?auto_115634 ) ) ( not ( = ?auto_115633 ?auto_115635 ) ) ( not ( = ?auto_115633 ?auto_115636 ) ) ( not ( = ?auto_115633 ?auto_115637 ) ) ( not ( = ?auto_115633 ?auto_115638 ) ) ( not ( = ?auto_115634 ?auto_115635 ) ) ( not ( = ?auto_115634 ?auto_115636 ) ) ( not ( = ?auto_115634 ?auto_115637 ) ) ( not ( = ?auto_115634 ?auto_115638 ) ) ( not ( = ?auto_115635 ?auto_115636 ) ) ( not ( = ?auto_115635 ?auto_115637 ) ) ( not ( = ?auto_115635 ?auto_115638 ) ) ( not ( = ?auto_115636 ?auto_115637 ) ) ( not ( = ?auto_115636 ?auto_115638 ) ) ( not ( = ?auto_115637 ?auto_115638 ) ) ( ON-TABLE ?auto_115638 ) ( ON ?auto_115637 ?auto_115638 ) ( ON ?auto_115636 ?auto_115637 ) ( ON ?auto_115632 ?auto_115639 ) ( not ( = ?auto_115632 ?auto_115639 ) ) ( not ( = ?auto_115633 ?auto_115639 ) ) ( not ( = ?auto_115634 ?auto_115639 ) ) ( not ( = ?auto_115635 ?auto_115639 ) ) ( not ( = ?auto_115636 ?auto_115639 ) ) ( not ( = ?auto_115637 ?auto_115639 ) ) ( not ( = ?auto_115638 ?auto_115639 ) ) ( ON ?auto_115633 ?auto_115632 ) ( ON-TABLE ?auto_115639 ) ( ON ?auto_115634 ?auto_115633 ) ( CLEAR ?auto_115634 ) ( HOLDING ?auto_115635 ) ( CLEAR ?auto_115636 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_115638 ?auto_115637 ?auto_115636 ?auto_115635 )
      ( MAKE-7PILE ?auto_115632 ?auto_115633 ?auto_115634 ?auto_115635 ?auto_115636 ?auto_115637 ?auto_115638 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_115640 - BLOCK
      ?auto_115641 - BLOCK
      ?auto_115642 - BLOCK
      ?auto_115643 - BLOCK
      ?auto_115644 - BLOCK
      ?auto_115645 - BLOCK
      ?auto_115646 - BLOCK
    )
    :vars
    (
      ?auto_115647 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115640 ?auto_115641 ) ) ( not ( = ?auto_115640 ?auto_115642 ) ) ( not ( = ?auto_115640 ?auto_115643 ) ) ( not ( = ?auto_115640 ?auto_115644 ) ) ( not ( = ?auto_115640 ?auto_115645 ) ) ( not ( = ?auto_115640 ?auto_115646 ) ) ( not ( = ?auto_115641 ?auto_115642 ) ) ( not ( = ?auto_115641 ?auto_115643 ) ) ( not ( = ?auto_115641 ?auto_115644 ) ) ( not ( = ?auto_115641 ?auto_115645 ) ) ( not ( = ?auto_115641 ?auto_115646 ) ) ( not ( = ?auto_115642 ?auto_115643 ) ) ( not ( = ?auto_115642 ?auto_115644 ) ) ( not ( = ?auto_115642 ?auto_115645 ) ) ( not ( = ?auto_115642 ?auto_115646 ) ) ( not ( = ?auto_115643 ?auto_115644 ) ) ( not ( = ?auto_115643 ?auto_115645 ) ) ( not ( = ?auto_115643 ?auto_115646 ) ) ( not ( = ?auto_115644 ?auto_115645 ) ) ( not ( = ?auto_115644 ?auto_115646 ) ) ( not ( = ?auto_115645 ?auto_115646 ) ) ( ON-TABLE ?auto_115646 ) ( ON ?auto_115645 ?auto_115646 ) ( ON ?auto_115644 ?auto_115645 ) ( ON ?auto_115640 ?auto_115647 ) ( not ( = ?auto_115640 ?auto_115647 ) ) ( not ( = ?auto_115641 ?auto_115647 ) ) ( not ( = ?auto_115642 ?auto_115647 ) ) ( not ( = ?auto_115643 ?auto_115647 ) ) ( not ( = ?auto_115644 ?auto_115647 ) ) ( not ( = ?auto_115645 ?auto_115647 ) ) ( not ( = ?auto_115646 ?auto_115647 ) ) ( ON ?auto_115641 ?auto_115640 ) ( ON-TABLE ?auto_115647 ) ( ON ?auto_115642 ?auto_115641 ) ( CLEAR ?auto_115644 ) ( ON ?auto_115643 ?auto_115642 ) ( CLEAR ?auto_115643 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_115647 ?auto_115640 ?auto_115641 ?auto_115642 )
      ( MAKE-7PILE ?auto_115640 ?auto_115641 ?auto_115642 ?auto_115643 ?auto_115644 ?auto_115645 ?auto_115646 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_115648 - BLOCK
      ?auto_115649 - BLOCK
      ?auto_115650 - BLOCK
      ?auto_115651 - BLOCK
      ?auto_115652 - BLOCK
      ?auto_115653 - BLOCK
      ?auto_115654 - BLOCK
    )
    :vars
    (
      ?auto_115655 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115648 ?auto_115649 ) ) ( not ( = ?auto_115648 ?auto_115650 ) ) ( not ( = ?auto_115648 ?auto_115651 ) ) ( not ( = ?auto_115648 ?auto_115652 ) ) ( not ( = ?auto_115648 ?auto_115653 ) ) ( not ( = ?auto_115648 ?auto_115654 ) ) ( not ( = ?auto_115649 ?auto_115650 ) ) ( not ( = ?auto_115649 ?auto_115651 ) ) ( not ( = ?auto_115649 ?auto_115652 ) ) ( not ( = ?auto_115649 ?auto_115653 ) ) ( not ( = ?auto_115649 ?auto_115654 ) ) ( not ( = ?auto_115650 ?auto_115651 ) ) ( not ( = ?auto_115650 ?auto_115652 ) ) ( not ( = ?auto_115650 ?auto_115653 ) ) ( not ( = ?auto_115650 ?auto_115654 ) ) ( not ( = ?auto_115651 ?auto_115652 ) ) ( not ( = ?auto_115651 ?auto_115653 ) ) ( not ( = ?auto_115651 ?auto_115654 ) ) ( not ( = ?auto_115652 ?auto_115653 ) ) ( not ( = ?auto_115652 ?auto_115654 ) ) ( not ( = ?auto_115653 ?auto_115654 ) ) ( ON-TABLE ?auto_115654 ) ( ON ?auto_115653 ?auto_115654 ) ( ON ?auto_115648 ?auto_115655 ) ( not ( = ?auto_115648 ?auto_115655 ) ) ( not ( = ?auto_115649 ?auto_115655 ) ) ( not ( = ?auto_115650 ?auto_115655 ) ) ( not ( = ?auto_115651 ?auto_115655 ) ) ( not ( = ?auto_115652 ?auto_115655 ) ) ( not ( = ?auto_115653 ?auto_115655 ) ) ( not ( = ?auto_115654 ?auto_115655 ) ) ( ON ?auto_115649 ?auto_115648 ) ( ON-TABLE ?auto_115655 ) ( ON ?auto_115650 ?auto_115649 ) ( ON ?auto_115651 ?auto_115650 ) ( CLEAR ?auto_115651 ) ( HOLDING ?auto_115652 ) ( CLEAR ?auto_115653 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_115654 ?auto_115653 ?auto_115652 )
      ( MAKE-7PILE ?auto_115648 ?auto_115649 ?auto_115650 ?auto_115651 ?auto_115652 ?auto_115653 ?auto_115654 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_115656 - BLOCK
      ?auto_115657 - BLOCK
      ?auto_115658 - BLOCK
      ?auto_115659 - BLOCK
      ?auto_115660 - BLOCK
      ?auto_115661 - BLOCK
      ?auto_115662 - BLOCK
    )
    :vars
    (
      ?auto_115663 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115656 ?auto_115657 ) ) ( not ( = ?auto_115656 ?auto_115658 ) ) ( not ( = ?auto_115656 ?auto_115659 ) ) ( not ( = ?auto_115656 ?auto_115660 ) ) ( not ( = ?auto_115656 ?auto_115661 ) ) ( not ( = ?auto_115656 ?auto_115662 ) ) ( not ( = ?auto_115657 ?auto_115658 ) ) ( not ( = ?auto_115657 ?auto_115659 ) ) ( not ( = ?auto_115657 ?auto_115660 ) ) ( not ( = ?auto_115657 ?auto_115661 ) ) ( not ( = ?auto_115657 ?auto_115662 ) ) ( not ( = ?auto_115658 ?auto_115659 ) ) ( not ( = ?auto_115658 ?auto_115660 ) ) ( not ( = ?auto_115658 ?auto_115661 ) ) ( not ( = ?auto_115658 ?auto_115662 ) ) ( not ( = ?auto_115659 ?auto_115660 ) ) ( not ( = ?auto_115659 ?auto_115661 ) ) ( not ( = ?auto_115659 ?auto_115662 ) ) ( not ( = ?auto_115660 ?auto_115661 ) ) ( not ( = ?auto_115660 ?auto_115662 ) ) ( not ( = ?auto_115661 ?auto_115662 ) ) ( ON-TABLE ?auto_115662 ) ( ON ?auto_115661 ?auto_115662 ) ( ON ?auto_115656 ?auto_115663 ) ( not ( = ?auto_115656 ?auto_115663 ) ) ( not ( = ?auto_115657 ?auto_115663 ) ) ( not ( = ?auto_115658 ?auto_115663 ) ) ( not ( = ?auto_115659 ?auto_115663 ) ) ( not ( = ?auto_115660 ?auto_115663 ) ) ( not ( = ?auto_115661 ?auto_115663 ) ) ( not ( = ?auto_115662 ?auto_115663 ) ) ( ON ?auto_115657 ?auto_115656 ) ( ON-TABLE ?auto_115663 ) ( ON ?auto_115658 ?auto_115657 ) ( ON ?auto_115659 ?auto_115658 ) ( CLEAR ?auto_115661 ) ( ON ?auto_115660 ?auto_115659 ) ( CLEAR ?auto_115660 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_115663 ?auto_115656 ?auto_115657 ?auto_115658 ?auto_115659 )
      ( MAKE-7PILE ?auto_115656 ?auto_115657 ?auto_115658 ?auto_115659 ?auto_115660 ?auto_115661 ?auto_115662 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_115664 - BLOCK
      ?auto_115665 - BLOCK
      ?auto_115666 - BLOCK
      ?auto_115667 - BLOCK
      ?auto_115668 - BLOCK
      ?auto_115669 - BLOCK
      ?auto_115670 - BLOCK
    )
    :vars
    (
      ?auto_115671 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115664 ?auto_115665 ) ) ( not ( = ?auto_115664 ?auto_115666 ) ) ( not ( = ?auto_115664 ?auto_115667 ) ) ( not ( = ?auto_115664 ?auto_115668 ) ) ( not ( = ?auto_115664 ?auto_115669 ) ) ( not ( = ?auto_115664 ?auto_115670 ) ) ( not ( = ?auto_115665 ?auto_115666 ) ) ( not ( = ?auto_115665 ?auto_115667 ) ) ( not ( = ?auto_115665 ?auto_115668 ) ) ( not ( = ?auto_115665 ?auto_115669 ) ) ( not ( = ?auto_115665 ?auto_115670 ) ) ( not ( = ?auto_115666 ?auto_115667 ) ) ( not ( = ?auto_115666 ?auto_115668 ) ) ( not ( = ?auto_115666 ?auto_115669 ) ) ( not ( = ?auto_115666 ?auto_115670 ) ) ( not ( = ?auto_115667 ?auto_115668 ) ) ( not ( = ?auto_115667 ?auto_115669 ) ) ( not ( = ?auto_115667 ?auto_115670 ) ) ( not ( = ?auto_115668 ?auto_115669 ) ) ( not ( = ?auto_115668 ?auto_115670 ) ) ( not ( = ?auto_115669 ?auto_115670 ) ) ( ON-TABLE ?auto_115670 ) ( ON ?auto_115664 ?auto_115671 ) ( not ( = ?auto_115664 ?auto_115671 ) ) ( not ( = ?auto_115665 ?auto_115671 ) ) ( not ( = ?auto_115666 ?auto_115671 ) ) ( not ( = ?auto_115667 ?auto_115671 ) ) ( not ( = ?auto_115668 ?auto_115671 ) ) ( not ( = ?auto_115669 ?auto_115671 ) ) ( not ( = ?auto_115670 ?auto_115671 ) ) ( ON ?auto_115665 ?auto_115664 ) ( ON-TABLE ?auto_115671 ) ( ON ?auto_115666 ?auto_115665 ) ( ON ?auto_115667 ?auto_115666 ) ( ON ?auto_115668 ?auto_115667 ) ( CLEAR ?auto_115668 ) ( HOLDING ?auto_115669 ) ( CLEAR ?auto_115670 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_115670 ?auto_115669 )
      ( MAKE-7PILE ?auto_115664 ?auto_115665 ?auto_115666 ?auto_115667 ?auto_115668 ?auto_115669 ?auto_115670 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_115672 - BLOCK
      ?auto_115673 - BLOCK
      ?auto_115674 - BLOCK
      ?auto_115675 - BLOCK
      ?auto_115676 - BLOCK
      ?auto_115677 - BLOCK
      ?auto_115678 - BLOCK
    )
    :vars
    (
      ?auto_115679 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115672 ?auto_115673 ) ) ( not ( = ?auto_115672 ?auto_115674 ) ) ( not ( = ?auto_115672 ?auto_115675 ) ) ( not ( = ?auto_115672 ?auto_115676 ) ) ( not ( = ?auto_115672 ?auto_115677 ) ) ( not ( = ?auto_115672 ?auto_115678 ) ) ( not ( = ?auto_115673 ?auto_115674 ) ) ( not ( = ?auto_115673 ?auto_115675 ) ) ( not ( = ?auto_115673 ?auto_115676 ) ) ( not ( = ?auto_115673 ?auto_115677 ) ) ( not ( = ?auto_115673 ?auto_115678 ) ) ( not ( = ?auto_115674 ?auto_115675 ) ) ( not ( = ?auto_115674 ?auto_115676 ) ) ( not ( = ?auto_115674 ?auto_115677 ) ) ( not ( = ?auto_115674 ?auto_115678 ) ) ( not ( = ?auto_115675 ?auto_115676 ) ) ( not ( = ?auto_115675 ?auto_115677 ) ) ( not ( = ?auto_115675 ?auto_115678 ) ) ( not ( = ?auto_115676 ?auto_115677 ) ) ( not ( = ?auto_115676 ?auto_115678 ) ) ( not ( = ?auto_115677 ?auto_115678 ) ) ( ON-TABLE ?auto_115678 ) ( ON ?auto_115672 ?auto_115679 ) ( not ( = ?auto_115672 ?auto_115679 ) ) ( not ( = ?auto_115673 ?auto_115679 ) ) ( not ( = ?auto_115674 ?auto_115679 ) ) ( not ( = ?auto_115675 ?auto_115679 ) ) ( not ( = ?auto_115676 ?auto_115679 ) ) ( not ( = ?auto_115677 ?auto_115679 ) ) ( not ( = ?auto_115678 ?auto_115679 ) ) ( ON ?auto_115673 ?auto_115672 ) ( ON-TABLE ?auto_115679 ) ( ON ?auto_115674 ?auto_115673 ) ( ON ?auto_115675 ?auto_115674 ) ( ON ?auto_115676 ?auto_115675 ) ( CLEAR ?auto_115678 ) ( ON ?auto_115677 ?auto_115676 ) ( CLEAR ?auto_115677 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_115679 ?auto_115672 ?auto_115673 ?auto_115674 ?auto_115675 ?auto_115676 )
      ( MAKE-7PILE ?auto_115672 ?auto_115673 ?auto_115674 ?auto_115675 ?auto_115676 ?auto_115677 ?auto_115678 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_115680 - BLOCK
      ?auto_115681 - BLOCK
      ?auto_115682 - BLOCK
      ?auto_115683 - BLOCK
      ?auto_115684 - BLOCK
      ?auto_115685 - BLOCK
      ?auto_115686 - BLOCK
    )
    :vars
    (
      ?auto_115687 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115680 ?auto_115681 ) ) ( not ( = ?auto_115680 ?auto_115682 ) ) ( not ( = ?auto_115680 ?auto_115683 ) ) ( not ( = ?auto_115680 ?auto_115684 ) ) ( not ( = ?auto_115680 ?auto_115685 ) ) ( not ( = ?auto_115680 ?auto_115686 ) ) ( not ( = ?auto_115681 ?auto_115682 ) ) ( not ( = ?auto_115681 ?auto_115683 ) ) ( not ( = ?auto_115681 ?auto_115684 ) ) ( not ( = ?auto_115681 ?auto_115685 ) ) ( not ( = ?auto_115681 ?auto_115686 ) ) ( not ( = ?auto_115682 ?auto_115683 ) ) ( not ( = ?auto_115682 ?auto_115684 ) ) ( not ( = ?auto_115682 ?auto_115685 ) ) ( not ( = ?auto_115682 ?auto_115686 ) ) ( not ( = ?auto_115683 ?auto_115684 ) ) ( not ( = ?auto_115683 ?auto_115685 ) ) ( not ( = ?auto_115683 ?auto_115686 ) ) ( not ( = ?auto_115684 ?auto_115685 ) ) ( not ( = ?auto_115684 ?auto_115686 ) ) ( not ( = ?auto_115685 ?auto_115686 ) ) ( ON ?auto_115680 ?auto_115687 ) ( not ( = ?auto_115680 ?auto_115687 ) ) ( not ( = ?auto_115681 ?auto_115687 ) ) ( not ( = ?auto_115682 ?auto_115687 ) ) ( not ( = ?auto_115683 ?auto_115687 ) ) ( not ( = ?auto_115684 ?auto_115687 ) ) ( not ( = ?auto_115685 ?auto_115687 ) ) ( not ( = ?auto_115686 ?auto_115687 ) ) ( ON ?auto_115681 ?auto_115680 ) ( ON-TABLE ?auto_115687 ) ( ON ?auto_115682 ?auto_115681 ) ( ON ?auto_115683 ?auto_115682 ) ( ON ?auto_115684 ?auto_115683 ) ( ON ?auto_115685 ?auto_115684 ) ( CLEAR ?auto_115685 ) ( HOLDING ?auto_115686 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_115686 )
      ( MAKE-7PILE ?auto_115680 ?auto_115681 ?auto_115682 ?auto_115683 ?auto_115684 ?auto_115685 ?auto_115686 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_115688 - BLOCK
      ?auto_115689 - BLOCK
      ?auto_115690 - BLOCK
      ?auto_115691 - BLOCK
      ?auto_115692 - BLOCK
      ?auto_115693 - BLOCK
      ?auto_115694 - BLOCK
    )
    :vars
    (
      ?auto_115695 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115688 ?auto_115689 ) ) ( not ( = ?auto_115688 ?auto_115690 ) ) ( not ( = ?auto_115688 ?auto_115691 ) ) ( not ( = ?auto_115688 ?auto_115692 ) ) ( not ( = ?auto_115688 ?auto_115693 ) ) ( not ( = ?auto_115688 ?auto_115694 ) ) ( not ( = ?auto_115689 ?auto_115690 ) ) ( not ( = ?auto_115689 ?auto_115691 ) ) ( not ( = ?auto_115689 ?auto_115692 ) ) ( not ( = ?auto_115689 ?auto_115693 ) ) ( not ( = ?auto_115689 ?auto_115694 ) ) ( not ( = ?auto_115690 ?auto_115691 ) ) ( not ( = ?auto_115690 ?auto_115692 ) ) ( not ( = ?auto_115690 ?auto_115693 ) ) ( not ( = ?auto_115690 ?auto_115694 ) ) ( not ( = ?auto_115691 ?auto_115692 ) ) ( not ( = ?auto_115691 ?auto_115693 ) ) ( not ( = ?auto_115691 ?auto_115694 ) ) ( not ( = ?auto_115692 ?auto_115693 ) ) ( not ( = ?auto_115692 ?auto_115694 ) ) ( not ( = ?auto_115693 ?auto_115694 ) ) ( ON ?auto_115688 ?auto_115695 ) ( not ( = ?auto_115688 ?auto_115695 ) ) ( not ( = ?auto_115689 ?auto_115695 ) ) ( not ( = ?auto_115690 ?auto_115695 ) ) ( not ( = ?auto_115691 ?auto_115695 ) ) ( not ( = ?auto_115692 ?auto_115695 ) ) ( not ( = ?auto_115693 ?auto_115695 ) ) ( not ( = ?auto_115694 ?auto_115695 ) ) ( ON ?auto_115689 ?auto_115688 ) ( ON-TABLE ?auto_115695 ) ( ON ?auto_115690 ?auto_115689 ) ( ON ?auto_115691 ?auto_115690 ) ( ON ?auto_115692 ?auto_115691 ) ( ON ?auto_115693 ?auto_115692 ) ( ON ?auto_115694 ?auto_115693 ) ( CLEAR ?auto_115694 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_115695 ?auto_115688 ?auto_115689 ?auto_115690 ?auto_115691 ?auto_115692 ?auto_115693 )
      ( MAKE-7PILE ?auto_115688 ?auto_115689 ?auto_115690 ?auto_115691 ?auto_115692 ?auto_115693 ?auto_115694 ) )
  )

)

