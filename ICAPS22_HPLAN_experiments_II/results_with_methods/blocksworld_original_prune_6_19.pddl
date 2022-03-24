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

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_64849 - BLOCK
      ?auto_64850 - BLOCK
      ?auto_64851 - BLOCK
      ?auto_64852 - BLOCK
      ?auto_64853 - BLOCK
      ?auto_64854 - BLOCK
    )
    :vars
    (
      ?auto_64855 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64855 ?auto_64854 ) ( CLEAR ?auto_64855 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_64849 ) ( ON ?auto_64850 ?auto_64849 ) ( ON ?auto_64851 ?auto_64850 ) ( ON ?auto_64852 ?auto_64851 ) ( ON ?auto_64853 ?auto_64852 ) ( ON ?auto_64854 ?auto_64853 ) ( not ( = ?auto_64849 ?auto_64850 ) ) ( not ( = ?auto_64849 ?auto_64851 ) ) ( not ( = ?auto_64849 ?auto_64852 ) ) ( not ( = ?auto_64849 ?auto_64853 ) ) ( not ( = ?auto_64849 ?auto_64854 ) ) ( not ( = ?auto_64849 ?auto_64855 ) ) ( not ( = ?auto_64850 ?auto_64851 ) ) ( not ( = ?auto_64850 ?auto_64852 ) ) ( not ( = ?auto_64850 ?auto_64853 ) ) ( not ( = ?auto_64850 ?auto_64854 ) ) ( not ( = ?auto_64850 ?auto_64855 ) ) ( not ( = ?auto_64851 ?auto_64852 ) ) ( not ( = ?auto_64851 ?auto_64853 ) ) ( not ( = ?auto_64851 ?auto_64854 ) ) ( not ( = ?auto_64851 ?auto_64855 ) ) ( not ( = ?auto_64852 ?auto_64853 ) ) ( not ( = ?auto_64852 ?auto_64854 ) ) ( not ( = ?auto_64852 ?auto_64855 ) ) ( not ( = ?auto_64853 ?auto_64854 ) ) ( not ( = ?auto_64853 ?auto_64855 ) ) ( not ( = ?auto_64854 ?auto_64855 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_64855 ?auto_64854 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_64857 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_64857 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_64857 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_64858 - BLOCK
    )
    :vars
    (
      ?auto_64859 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64858 ?auto_64859 ) ( CLEAR ?auto_64858 ) ( HAND-EMPTY ) ( not ( = ?auto_64858 ?auto_64859 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_64858 ?auto_64859 )
      ( MAKE-1PILE ?auto_64858 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_64865 - BLOCK
      ?auto_64866 - BLOCK
      ?auto_64867 - BLOCK
      ?auto_64868 - BLOCK
      ?auto_64869 - BLOCK
    )
    :vars
    (
      ?auto_64870 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64870 ?auto_64869 ) ( CLEAR ?auto_64870 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_64865 ) ( ON ?auto_64866 ?auto_64865 ) ( ON ?auto_64867 ?auto_64866 ) ( ON ?auto_64868 ?auto_64867 ) ( ON ?auto_64869 ?auto_64868 ) ( not ( = ?auto_64865 ?auto_64866 ) ) ( not ( = ?auto_64865 ?auto_64867 ) ) ( not ( = ?auto_64865 ?auto_64868 ) ) ( not ( = ?auto_64865 ?auto_64869 ) ) ( not ( = ?auto_64865 ?auto_64870 ) ) ( not ( = ?auto_64866 ?auto_64867 ) ) ( not ( = ?auto_64866 ?auto_64868 ) ) ( not ( = ?auto_64866 ?auto_64869 ) ) ( not ( = ?auto_64866 ?auto_64870 ) ) ( not ( = ?auto_64867 ?auto_64868 ) ) ( not ( = ?auto_64867 ?auto_64869 ) ) ( not ( = ?auto_64867 ?auto_64870 ) ) ( not ( = ?auto_64868 ?auto_64869 ) ) ( not ( = ?auto_64868 ?auto_64870 ) ) ( not ( = ?auto_64869 ?auto_64870 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_64870 ?auto_64869 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_64871 - BLOCK
      ?auto_64872 - BLOCK
      ?auto_64873 - BLOCK
      ?auto_64874 - BLOCK
      ?auto_64875 - BLOCK
    )
    :vars
    (
      ?auto_64876 - BLOCK
      ?auto_64877 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64876 ?auto_64875 ) ( CLEAR ?auto_64876 ) ( ON-TABLE ?auto_64871 ) ( ON ?auto_64872 ?auto_64871 ) ( ON ?auto_64873 ?auto_64872 ) ( ON ?auto_64874 ?auto_64873 ) ( ON ?auto_64875 ?auto_64874 ) ( not ( = ?auto_64871 ?auto_64872 ) ) ( not ( = ?auto_64871 ?auto_64873 ) ) ( not ( = ?auto_64871 ?auto_64874 ) ) ( not ( = ?auto_64871 ?auto_64875 ) ) ( not ( = ?auto_64871 ?auto_64876 ) ) ( not ( = ?auto_64872 ?auto_64873 ) ) ( not ( = ?auto_64872 ?auto_64874 ) ) ( not ( = ?auto_64872 ?auto_64875 ) ) ( not ( = ?auto_64872 ?auto_64876 ) ) ( not ( = ?auto_64873 ?auto_64874 ) ) ( not ( = ?auto_64873 ?auto_64875 ) ) ( not ( = ?auto_64873 ?auto_64876 ) ) ( not ( = ?auto_64874 ?auto_64875 ) ) ( not ( = ?auto_64874 ?auto_64876 ) ) ( not ( = ?auto_64875 ?auto_64876 ) ) ( HOLDING ?auto_64877 ) ( not ( = ?auto_64871 ?auto_64877 ) ) ( not ( = ?auto_64872 ?auto_64877 ) ) ( not ( = ?auto_64873 ?auto_64877 ) ) ( not ( = ?auto_64874 ?auto_64877 ) ) ( not ( = ?auto_64875 ?auto_64877 ) ) ( not ( = ?auto_64876 ?auto_64877 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_64877 )
      ( MAKE-5PILE ?auto_64871 ?auto_64872 ?auto_64873 ?auto_64874 ?auto_64875 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_64878 - BLOCK
      ?auto_64879 - BLOCK
      ?auto_64880 - BLOCK
      ?auto_64881 - BLOCK
      ?auto_64882 - BLOCK
    )
    :vars
    (
      ?auto_64883 - BLOCK
      ?auto_64884 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64883 ?auto_64882 ) ( ON-TABLE ?auto_64878 ) ( ON ?auto_64879 ?auto_64878 ) ( ON ?auto_64880 ?auto_64879 ) ( ON ?auto_64881 ?auto_64880 ) ( ON ?auto_64882 ?auto_64881 ) ( not ( = ?auto_64878 ?auto_64879 ) ) ( not ( = ?auto_64878 ?auto_64880 ) ) ( not ( = ?auto_64878 ?auto_64881 ) ) ( not ( = ?auto_64878 ?auto_64882 ) ) ( not ( = ?auto_64878 ?auto_64883 ) ) ( not ( = ?auto_64879 ?auto_64880 ) ) ( not ( = ?auto_64879 ?auto_64881 ) ) ( not ( = ?auto_64879 ?auto_64882 ) ) ( not ( = ?auto_64879 ?auto_64883 ) ) ( not ( = ?auto_64880 ?auto_64881 ) ) ( not ( = ?auto_64880 ?auto_64882 ) ) ( not ( = ?auto_64880 ?auto_64883 ) ) ( not ( = ?auto_64881 ?auto_64882 ) ) ( not ( = ?auto_64881 ?auto_64883 ) ) ( not ( = ?auto_64882 ?auto_64883 ) ) ( not ( = ?auto_64878 ?auto_64884 ) ) ( not ( = ?auto_64879 ?auto_64884 ) ) ( not ( = ?auto_64880 ?auto_64884 ) ) ( not ( = ?auto_64881 ?auto_64884 ) ) ( not ( = ?auto_64882 ?auto_64884 ) ) ( not ( = ?auto_64883 ?auto_64884 ) ) ( ON ?auto_64884 ?auto_64883 ) ( CLEAR ?auto_64884 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_64878 ?auto_64879 ?auto_64880 ?auto_64881 ?auto_64882 ?auto_64883 )
      ( MAKE-5PILE ?auto_64878 ?auto_64879 ?auto_64880 ?auto_64881 ?auto_64882 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_64887 - BLOCK
      ?auto_64888 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_64888 ) ( CLEAR ?auto_64887 ) ( ON-TABLE ?auto_64887 ) ( not ( = ?auto_64887 ?auto_64888 ) ) )
    :subtasks
    ( ( !STACK ?auto_64888 ?auto_64887 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_64889 - BLOCK
      ?auto_64890 - BLOCK
    )
    :vars
    (
      ?auto_64891 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_64889 ) ( ON-TABLE ?auto_64889 ) ( not ( = ?auto_64889 ?auto_64890 ) ) ( ON ?auto_64890 ?auto_64891 ) ( CLEAR ?auto_64890 ) ( HAND-EMPTY ) ( not ( = ?auto_64889 ?auto_64891 ) ) ( not ( = ?auto_64890 ?auto_64891 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_64890 ?auto_64891 )
      ( MAKE-2PILE ?auto_64889 ?auto_64890 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_64892 - BLOCK
      ?auto_64893 - BLOCK
    )
    :vars
    (
      ?auto_64894 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64892 ?auto_64893 ) ) ( ON ?auto_64893 ?auto_64894 ) ( CLEAR ?auto_64893 ) ( not ( = ?auto_64892 ?auto_64894 ) ) ( not ( = ?auto_64893 ?auto_64894 ) ) ( HOLDING ?auto_64892 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_64892 )
      ( MAKE-2PILE ?auto_64892 ?auto_64893 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_64895 - BLOCK
      ?auto_64896 - BLOCK
    )
    :vars
    (
      ?auto_64897 - BLOCK
      ?auto_64900 - BLOCK
      ?auto_64901 - BLOCK
      ?auto_64899 - BLOCK
      ?auto_64898 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64895 ?auto_64896 ) ) ( ON ?auto_64896 ?auto_64897 ) ( not ( = ?auto_64895 ?auto_64897 ) ) ( not ( = ?auto_64896 ?auto_64897 ) ) ( ON ?auto_64895 ?auto_64896 ) ( CLEAR ?auto_64895 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_64900 ) ( ON ?auto_64901 ?auto_64900 ) ( ON ?auto_64899 ?auto_64901 ) ( ON ?auto_64898 ?auto_64899 ) ( ON ?auto_64897 ?auto_64898 ) ( not ( = ?auto_64900 ?auto_64901 ) ) ( not ( = ?auto_64900 ?auto_64899 ) ) ( not ( = ?auto_64900 ?auto_64898 ) ) ( not ( = ?auto_64900 ?auto_64897 ) ) ( not ( = ?auto_64900 ?auto_64896 ) ) ( not ( = ?auto_64900 ?auto_64895 ) ) ( not ( = ?auto_64901 ?auto_64899 ) ) ( not ( = ?auto_64901 ?auto_64898 ) ) ( not ( = ?auto_64901 ?auto_64897 ) ) ( not ( = ?auto_64901 ?auto_64896 ) ) ( not ( = ?auto_64901 ?auto_64895 ) ) ( not ( = ?auto_64899 ?auto_64898 ) ) ( not ( = ?auto_64899 ?auto_64897 ) ) ( not ( = ?auto_64899 ?auto_64896 ) ) ( not ( = ?auto_64899 ?auto_64895 ) ) ( not ( = ?auto_64898 ?auto_64897 ) ) ( not ( = ?auto_64898 ?auto_64896 ) ) ( not ( = ?auto_64898 ?auto_64895 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_64900 ?auto_64901 ?auto_64899 ?auto_64898 ?auto_64897 ?auto_64896 )
      ( MAKE-2PILE ?auto_64895 ?auto_64896 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_64906 - BLOCK
      ?auto_64907 - BLOCK
      ?auto_64908 - BLOCK
      ?auto_64909 - BLOCK
    )
    :vars
    (
      ?auto_64910 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64910 ?auto_64909 ) ( CLEAR ?auto_64910 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_64906 ) ( ON ?auto_64907 ?auto_64906 ) ( ON ?auto_64908 ?auto_64907 ) ( ON ?auto_64909 ?auto_64908 ) ( not ( = ?auto_64906 ?auto_64907 ) ) ( not ( = ?auto_64906 ?auto_64908 ) ) ( not ( = ?auto_64906 ?auto_64909 ) ) ( not ( = ?auto_64906 ?auto_64910 ) ) ( not ( = ?auto_64907 ?auto_64908 ) ) ( not ( = ?auto_64907 ?auto_64909 ) ) ( not ( = ?auto_64907 ?auto_64910 ) ) ( not ( = ?auto_64908 ?auto_64909 ) ) ( not ( = ?auto_64908 ?auto_64910 ) ) ( not ( = ?auto_64909 ?auto_64910 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_64910 ?auto_64909 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_64911 - BLOCK
      ?auto_64912 - BLOCK
      ?auto_64913 - BLOCK
      ?auto_64914 - BLOCK
    )
    :vars
    (
      ?auto_64915 - BLOCK
      ?auto_64916 - BLOCK
      ?auto_64917 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64915 ?auto_64914 ) ( CLEAR ?auto_64915 ) ( ON-TABLE ?auto_64911 ) ( ON ?auto_64912 ?auto_64911 ) ( ON ?auto_64913 ?auto_64912 ) ( ON ?auto_64914 ?auto_64913 ) ( not ( = ?auto_64911 ?auto_64912 ) ) ( not ( = ?auto_64911 ?auto_64913 ) ) ( not ( = ?auto_64911 ?auto_64914 ) ) ( not ( = ?auto_64911 ?auto_64915 ) ) ( not ( = ?auto_64912 ?auto_64913 ) ) ( not ( = ?auto_64912 ?auto_64914 ) ) ( not ( = ?auto_64912 ?auto_64915 ) ) ( not ( = ?auto_64913 ?auto_64914 ) ) ( not ( = ?auto_64913 ?auto_64915 ) ) ( not ( = ?auto_64914 ?auto_64915 ) ) ( HOLDING ?auto_64916 ) ( CLEAR ?auto_64917 ) ( not ( = ?auto_64911 ?auto_64916 ) ) ( not ( = ?auto_64911 ?auto_64917 ) ) ( not ( = ?auto_64912 ?auto_64916 ) ) ( not ( = ?auto_64912 ?auto_64917 ) ) ( not ( = ?auto_64913 ?auto_64916 ) ) ( not ( = ?auto_64913 ?auto_64917 ) ) ( not ( = ?auto_64914 ?auto_64916 ) ) ( not ( = ?auto_64914 ?auto_64917 ) ) ( not ( = ?auto_64915 ?auto_64916 ) ) ( not ( = ?auto_64915 ?auto_64917 ) ) ( not ( = ?auto_64916 ?auto_64917 ) ) )
    :subtasks
    ( ( !STACK ?auto_64916 ?auto_64917 )
      ( MAKE-4PILE ?auto_64911 ?auto_64912 ?auto_64913 ?auto_64914 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_65517 - BLOCK
      ?auto_65518 - BLOCK
      ?auto_65519 - BLOCK
      ?auto_65520 - BLOCK
    )
    :vars
    (
      ?auto_65521 - BLOCK
      ?auto_65522 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65521 ?auto_65520 ) ( ON-TABLE ?auto_65517 ) ( ON ?auto_65518 ?auto_65517 ) ( ON ?auto_65519 ?auto_65518 ) ( ON ?auto_65520 ?auto_65519 ) ( not ( = ?auto_65517 ?auto_65518 ) ) ( not ( = ?auto_65517 ?auto_65519 ) ) ( not ( = ?auto_65517 ?auto_65520 ) ) ( not ( = ?auto_65517 ?auto_65521 ) ) ( not ( = ?auto_65518 ?auto_65519 ) ) ( not ( = ?auto_65518 ?auto_65520 ) ) ( not ( = ?auto_65518 ?auto_65521 ) ) ( not ( = ?auto_65519 ?auto_65520 ) ) ( not ( = ?auto_65519 ?auto_65521 ) ) ( not ( = ?auto_65520 ?auto_65521 ) ) ( not ( = ?auto_65517 ?auto_65522 ) ) ( not ( = ?auto_65518 ?auto_65522 ) ) ( not ( = ?auto_65519 ?auto_65522 ) ) ( not ( = ?auto_65520 ?auto_65522 ) ) ( not ( = ?auto_65521 ?auto_65522 ) ) ( ON ?auto_65522 ?auto_65521 ) ( CLEAR ?auto_65522 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_65517 ?auto_65518 ?auto_65519 ?auto_65520 ?auto_65521 )
      ( MAKE-4PILE ?auto_65517 ?auto_65518 ?auto_65519 ?auto_65520 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_64925 - BLOCK
      ?auto_64926 - BLOCK
      ?auto_64927 - BLOCK
      ?auto_64928 - BLOCK
    )
    :vars
    (
      ?auto_64931 - BLOCK
      ?auto_64929 - BLOCK
      ?auto_64930 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64931 ?auto_64928 ) ( ON-TABLE ?auto_64925 ) ( ON ?auto_64926 ?auto_64925 ) ( ON ?auto_64927 ?auto_64926 ) ( ON ?auto_64928 ?auto_64927 ) ( not ( = ?auto_64925 ?auto_64926 ) ) ( not ( = ?auto_64925 ?auto_64927 ) ) ( not ( = ?auto_64925 ?auto_64928 ) ) ( not ( = ?auto_64925 ?auto_64931 ) ) ( not ( = ?auto_64926 ?auto_64927 ) ) ( not ( = ?auto_64926 ?auto_64928 ) ) ( not ( = ?auto_64926 ?auto_64931 ) ) ( not ( = ?auto_64927 ?auto_64928 ) ) ( not ( = ?auto_64927 ?auto_64931 ) ) ( not ( = ?auto_64928 ?auto_64931 ) ) ( not ( = ?auto_64925 ?auto_64929 ) ) ( not ( = ?auto_64925 ?auto_64930 ) ) ( not ( = ?auto_64926 ?auto_64929 ) ) ( not ( = ?auto_64926 ?auto_64930 ) ) ( not ( = ?auto_64927 ?auto_64929 ) ) ( not ( = ?auto_64927 ?auto_64930 ) ) ( not ( = ?auto_64928 ?auto_64929 ) ) ( not ( = ?auto_64928 ?auto_64930 ) ) ( not ( = ?auto_64931 ?auto_64929 ) ) ( not ( = ?auto_64931 ?auto_64930 ) ) ( not ( = ?auto_64929 ?auto_64930 ) ) ( ON ?auto_64929 ?auto_64931 ) ( CLEAR ?auto_64929 ) ( HOLDING ?auto_64930 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_64930 )
      ( MAKE-4PILE ?auto_64925 ?auto_64926 ?auto_64927 ?auto_64928 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_64932 - BLOCK
      ?auto_64933 - BLOCK
      ?auto_64934 - BLOCK
      ?auto_64935 - BLOCK
    )
    :vars
    (
      ?auto_64936 - BLOCK
      ?auto_64938 - BLOCK
      ?auto_64937 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64936 ?auto_64935 ) ( ON-TABLE ?auto_64932 ) ( ON ?auto_64933 ?auto_64932 ) ( ON ?auto_64934 ?auto_64933 ) ( ON ?auto_64935 ?auto_64934 ) ( not ( = ?auto_64932 ?auto_64933 ) ) ( not ( = ?auto_64932 ?auto_64934 ) ) ( not ( = ?auto_64932 ?auto_64935 ) ) ( not ( = ?auto_64932 ?auto_64936 ) ) ( not ( = ?auto_64933 ?auto_64934 ) ) ( not ( = ?auto_64933 ?auto_64935 ) ) ( not ( = ?auto_64933 ?auto_64936 ) ) ( not ( = ?auto_64934 ?auto_64935 ) ) ( not ( = ?auto_64934 ?auto_64936 ) ) ( not ( = ?auto_64935 ?auto_64936 ) ) ( not ( = ?auto_64932 ?auto_64938 ) ) ( not ( = ?auto_64932 ?auto_64937 ) ) ( not ( = ?auto_64933 ?auto_64938 ) ) ( not ( = ?auto_64933 ?auto_64937 ) ) ( not ( = ?auto_64934 ?auto_64938 ) ) ( not ( = ?auto_64934 ?auto_64937 ) ) ( not ( = ?auto_64935 ?auto_64938 ) ) ( not ( = ?auto_64935 ?auto_64937 ) ) ( not ( = ?auto_64936 ?auto_64938 ) ) ( not ( = ?auto_64936 ?auto_64937 ) ) ( not ( = ?auto_64938 ?auto_64937 ) ) ( ON ?auto_64938 ?auto_64936 ) ( ON ?auto_64937 ?auto_64938 ) ( CLEAR ?auto_64937 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_64932 ?auto_64933 ?auto_64934 ?auto_64935 ?auto_64936 ?auto_64938 )
      ( MAKE-4PILE ?auto_64932 ?auto_64933 ?auto_64934 ?auto_64935 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_64942 - BLOCK
      ?auto_64943 - BLOCK
      ?auto_64944 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_64944 ) ( CLEAR ?auto_64943 ) ( ON-TABLE ?auto_64942 ) ( ON ?auto_64943 ?auto_64942 ) ( not ( = ?auto_64942 ?auto_64943 ) ) ( not ( = ?auto_64942 ?auto_64944 ) ) ( not ( = ?auto_64943 ?auto_64944 ) ) )
    :subtasks
    ( ( !STACK ?auto_64944 ?auto_64943 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_64945 - BLOCK
      ?auto_64946 - BLOCK
      ?auto_64947 - BLOCK
    )
    :vars
    (
      ?auto_64948 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_64946 ) ( ON-TABLE ?auto_64945 ) ( ON ?auto_64946 ?auto_64945 ) ( not ( = ?auto_64945 ?auto_64946 ) ) ( not ( = ?auto_64945 ?auto_64947 ) ) ( not ( = ?auto_64946 ?auto_64947 ) ) ( ON ?auto_64947 ?auto_64948 ) ( CLEAR ?auto_64947 ) ( HAND-EMPTY ) ( not ( = ?auto_64945 ?auto_64948 ) ) ( not ( = ?auto_64946 ?auto_64948 ) ) ( not ( = ?auto_64947 ?auto_64948 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_64947 ?auto_64948 )
      ( MAKE-3PILE ?auto_64945 ?auto_64946 ?auto_64947 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_64949 - BLOCK
      ?auto_64950 - BLOCK
      ?auto_64951 - BLOCK
    )
    :vars
    (
      ?auto_64952 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_64949 ) ( not ( = ?auto_64949 ?auto_64950 ) ) ( not ( = ?auto_64949 ?auto_64951 ) ) ( not ( = ?auto_64950 ?auto_64951 ) ) ( ON ?auto_64951 ?auto_64952 ) ( CLEAR ?auto_64951 ) ( not ( = ?auto_64949 ?auto_64952 ) ) ( not ( = ?auto_64950 ?auto_64952 ) ) ( not ( = ?auto_64951 ?auto_64952 ) ) ( HOLDING ?auto_64950 ) ( CLEAR ?auto_64949 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_64949 ?auto_64950 )
      ( MAKE-3PILE ?auto_64949 ?auto_64950 ?auto_64951 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_64953 - BLOCK
      ?auto_64954 - BLOCK
      ?auto_64955 - BLOCK
    )
    :vars
    (
      ?auto_64956 - BLOCK
      ?auto_64959 - BLOCK
      ?auto_64957 - BLOCK
      ?auto_64958 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_64953 ) ( not ( = ?auto_64953 ?auto_64954 ) ) ( not ( = ?auto_64953 ?auto_64955 ) ) ( not ( = ?auto_64954 ?auto_64955 ) ) ( ON ?auto_64955 ?auto_64956 ) ( not ( = ?auto_64953 ?auto_64956 ) ) ( not ( = ?auto_64954 ?auto_64956 ) ) ( not ( = ?auto_64955 ?auto_64956 ) ) ( CLEAR ?auto_64953 ) ( ON ?auto_64954 ?auto_64955 ) ( CLEAR ?auto_64954 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_64959 ) ( ON ?auto_64957 ?auto_64959 ) ( ON ?auto_64958 ?auto_64957 ) ( ON ?auto_64956 ?auto_64958 ) ( not ( = ?auto_64959 ?auto_64957 ) ) ( not ( = ?auto_64959 ?auto_64958 ) ) ( not ( = ?auto_64959 ?auto_64956 ) ) ( not ( = ?auto_64959 ?auto_64955 ) ) ( not ( = ?auto_64959 ?auto_64954 ) ) ( not ( = ?auto_64957 ?auto_64958 ) ) ( not ( = ?auto_64957 ?auto_64956 ) ) ( not ( = ?auto_64957 ?auto_64955 ) ) ( not ( = ?auto_64957 ?auto_64954 ) ) ( not ( = ?auto_64958 ?auto_64956 ) ) ( not ( = ?auto_64958 ?auto_64955 ) ) ( not ( = ?auto_64958 ?auto_64954 ) ) ( not ( = ?auto_64953 ?auto_64959 ) ) ( not ( = ?auto_64953 ?auto_64957 ) ) ( not ( = ?auto_64953 ?auto_64958 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_64959 ?auto_64957 ?auto_64958 ?auto_64956 ?auto_64955 )
      ( MAKE-3PILE ?auto_64953 ?auto_64954 ?auto_64955 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_64960 - BLOCK
      ?auto_64961 - BLOCK
      ?auto_64962 - BLOCK
    )
    :vars
    (
      ?auto_64965 - BLOCK
      ?auto_64964 - BLOCK
      ?auto_64963 - BLOCK
      ?auto_64966 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64960 ?auto_64961 ) ) ( not ( = ?auto_64960 ?auto_64962 ) ) ( not ( = ?auto_64961 ?auto_64962 ) ) ( ON ?auto_64962 ?auto_64965 ) ( not ( = ?auto_64960 ?auto_64965 ) ) ( not ( = ?auto_64961 ?auto_64965 ) ) ( not ( = ?auto_64962 ?auto_64965 ) ) ( ON ?auto_64961 ?auto_64962 ) ( CLEAR ?auto_64961 ) ( ON-TABLE ?auto_64964 ) ( ON ?auto_64963 ?auto_64964 ) ( ON ?auto_64966 ?auto_64963 ) ( ON ?auto_64965 ?auto_64966 ) ( not ( = ?auto_64964 ?auto_64963 ) ) ( not ( = ?auto_64964 ?auto_64966 ) ) ( not ( = ?auto_64964 ?auto_64965 ) ) ( not ( = ?auto_64964 ?auto_64962 ) ) ( not ( = ?auto_64964 ?auto_64961 ) ) ( not ( = ?auto_64963 ?auto_64966 ) ) ( not ( = ?auto_64963 ?auto_64965 ) ) ( not ( = ?auto_64963 ?auto_64962 ) ) ( not ( = ?auto_64963 ?auto_64961 ) ) ( not ( = ?auto_64966 ?auto_64965 ) ) ( not ( = ?auto_64966 ?auto_64962 ) ) ( not ( = ?auto_64966 ?auto_64961 ) ) ( not ( = ?auto_64960 ?auto_64964 ) ) ( not ( = ?auto_64960 ?auto_64963 ) ) ( not ( = ?auto_64960 ?auto_64966 ) ) ( HOLDING ?auto_64960 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_64960 )
      ( MAKE-3PILE ?auto_64960 ?auto_64961 ?auto_64962 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_64967 - BLOCK
      ?auto_64968 - BLOCK
      ?auto_64969 - BLOCK
    )
    :vars
    (
      ?auto_64971 - BLOCK
      ?auto_64972 - BLOCK
      ?auto_64973 - BLOCK
      ?auto_64970 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64967 ?auto_64968 ) ) ( not ( = ?auto_64967 ?auto_64969 ) ) ( not ( = ?auto_64968 ?auto_64969 ) ) ( ON ?auto_64969 ?auto_64971 ) ( not ( = ?auto_64967 ?auto_64971 ) ) ( not ( = ?auto_64968 ?auto_64971 ) ) ( not ( = ?auto_64969 ?auto_64971 ) ) ( ON ?auto_64968 ?auto_64969 ) ( ON-TABLE ?auto_64972 ) ( ON ?auto_64973 ?auto_64972 ) ( ON ?auto_64970 ?auto_64973 ) ( ON ?auto_64971 ?auto_64970 ) ( not ( = ?auto_64972 ?auto_64973 ) ) ( not ( = ?auto_64972 ?auto_64970 ) ) ( not ( = ?auto_64972 ?auto_64971 ) ) ( not ( = ?auto_64972 ?auto_64969 ) ) ( not ( = ?auto_64972 ?auto_64968 ) ) ( not ( = ?auto_64973 ?auto_64970 ) ) ( not ( = ?auto_64973 ?auto_64971 ) ) ( not ( = ?auto_64973 ?auto_64969 ) ) ( not ( = ?auto_64973 ?auto_64968 ) ) ( not ( = ?auto_64970 ?auto_64971 ) ) ( not ( = ?auto_64970 ?auto_64969 ) ) ( not ( = ?auto_64970 ?auto_64968 ) ) ( not ( = ?auto_64967 ?auto_64972 ) ) ( not ( = ?auto_64967 ?auto_64973 ) ) ( not ( = ?auto_64967 ?auto_64970 ) ) ( ON ?auto_64967 ?auto_64968 ) ( CLEAR ?auto_64967 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_64972 ?auto_64973 ?auto_64970 ?auto_64971 ?auto_64969 ?auto_64968 )
      ( MAKE-3PILE ?auto_64967 ?auto_64968 ?auto_64969 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_64977 - BLOCK
      ?auto_64978 - BLOCK
      ?auto_64979 - BLOCK
    )
    :vars
    (
      ?auto_64980 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64980 ?auto_64979 ) ( CLEAR ?auto_64980 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_64977 ) ( ON ?auto_64978 ?auto_64977 ) ( ON ?auto_64979 ?auto_64978 ) ( not ( = ?auto_64977 ?auto_64978 ) ) ( not ( = ?auto_64977 ?auto_64979 ) ) ( not ( = ?auto_64977 ?auto_64980 ) ) ( not ( = ?auto_64978 ?auto_64979 ) ) ( not ( = ?auto_64978 ?auto_64980 ) ) ( not ( = ?auto_64979 ?auto_64980 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_64980 ?auto_64979 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_64981 - BLOCK
      ?auto_64982 - BLOCK
      ?auto_64983 - BLOCK
    )
    :vars
    (
      ?auto_64984 - BLOCK
      ?auto_64985 - BLOCK
      ?auto_64986 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64984 ?auto_64983 ) ( CLEAR ?auto_64984 ) ( ON-TABLE ?auto_64981 ) ( ON ?auto_64982 ?auto_64981 ) ( ON ?auto_64983 ?auto_64982 ) ( not ( = ?auto_64981 ?auto_64982 ) ) ( not ( = ?auto_64981 ?auto_64983 ) ) ( not ( = ?auto_64981 ?auto_64984 ) ) ( not ( = ?auto_64982 ?auto_64983 ) ) ( not ( = ?auto_64982 ?auto_64984 ) ) ( not ( = ?auto_64983 ?auto_64984 ) ) ( HOLDING ?auto_64985 ) ( CLEAR ?auto_64986 ) ( not ( = ?auto_64981 ?auto_64985 ) ) ( not ( = ?auto_64981 ?auto_64986 ) ) ( not ( = ?auto_64982 ?auto_64985 ) ) ( not ( = ?auto_64982 ?auto_64986 ) ) ( not ( = ?auto_64983 ?auto_64985 ) ) ( not ( = ?auto_64983 ?auto_64986 ) ) ( not ( = ?auto_64984 ?auto_64985 ) ) ( not ( = ?auto_64984 ?auto_64986 ) ) ( not ( = ?auto_64985 ?auto_64986 ) ) )
    :subtasks
    ( ( !STACK ?auto_64985 ?auto_64986 )
      ( MAKE-3PILE ?auto_64981 ?auto_64982 ?auto_64983 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_64987 - BLOCK
      ?auto_64988 - BLOCK
      ?auto_64989 - BLOCK
    )
    :vars
    (
      ?auto_64992 - BLOCK
      ?auto_64991 - BLOCK
      ?auto_64990 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64992 ?auto_64989 ) ( ON-TABLE ?auto_64987 ) ( ON ?auto_64988 ?auto_64987 ) ( ON ?auto_64989 ?auto_64988 ) ( not ( = ?auto_64987 ?auto_64988 ) ) ( not ( = ?auto_64987 ?auto_64989 ) ) ( not ( = ?auto_64987 ?auto_64992 ) ) ( not ( = ?auto_64988 ?auto_64989 ) ) ( not ( = ?auto_64988 ?auto_64992 ) ) ( not ( = ?auto_64989 ?auto_64992 ) ) ( CLEAR ?auto_64991 ) ( not ( = ?auto_64987 ?auto_64990 ) ) ( not ( = ?auto_64987 ?auto_64991 ) ) ( not ( = ?auto_64988 ?auto_64990 ) ) ( not ( = ?auto_64988 ?auto_64991 ) ) ( not ( = ?auto_64989 ?auto_64990 ) ) ( not ( = ?auto_64989 ?auto_64991 ) ) ( not ( = ?auto_64992 ?auto_64990 ) ) ( not ( = ?auto_64992 ?auto_64991 ) ) ( not ( = ?auto_64990 ?auto_64991 ) ) ( ON ?auto_64990 ?auto_64992 ) ( CLEAR ?auto_64990 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_64987 ?auto_64988 ?auto_64989 ?auto_64992 )
      ( MAKE-3PILE ?auto_64987 ?auto_64988 ?auto_64989 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_64993 - BLOCK
      ?auto_64994 - BLOCK
      ?auto_64995 - BLOCK
    )
    :vars
    (
      ?auto_64997 - BLOCK
      ?auto_64996 - BLOCK
      ?auto_64998 - BLOCK
      ?auto_64999 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64997 ?auto_64995 ) ( ON-TABLE ?auto_64993 ) ( ON ?auto_64994 ?auto_64993 ) ( ON ?auto_64995 ?auto_64994 ) ( not ( = ?auto_64993 ?auto_64994 ) ) ( not ( = ?auto_64993 ?auto_64995 ) ) ( not ( = ?auto_64993 ?auto_64997 ) ) ( not ( = ?auto_64994 ?auto_64995 ) ) ( not ( = ?auto_64994 ?auto_64997 ) ) ( not ( = ?auto_64995 ?auto_64997 ) ) ( not ( = ?auto_64993 ?auto_64996 ) ) ( not ( = ?auto_64993 ?auto_64998 ) ) ( not ( = ?auto_64994 ?auto_64996 ) ) ( not ( = ?auto_64994 ?auto_64998 ) ) ( not ( = ?auto_64995 ?auto_64996 ) ) ( not ( = ?auto_64995 ?auto_64998 ) ) ( not ( = ?auto_64997 ?auto_64996 ) ) ( not ( = ?auto_64997 ?auto_64998 ) ) ( not ( = ?auto_64996 ?auto_64998 ) ) ( ON ?auto_64996 ?auto_64997 ) ( CLEAR ?auto_64996 ) ( HOLDING ?auto_64998 ) ( CLEAR ?auto_64999 ) ( ON-TABLE ?auto_64999 ) ( not ( = ?auto_64999 ?auto_64998 ) ) ( not ( = ?auto_64993 ?auto_64999 ) ) ( not ( = ?auto_64994 ?auto_64999 ) ) ( not ( = ?auto_64995 ?auto_64999 ) ) ( not ( = ?auto_64997 ?auto_64999 ) ) ( not ( = ?auto_64996 ?auto_64999 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_64999 ?auto_64998 )
      ( MAKE-3PILE ?auto_64993 ?auto_64994 ?auto_64995 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_65691 - BLOCK
      ?auto_65692 - BLOCK
      ?auto_65693 - BLOCK
    )
    :vars
    (
      ?auto_65694 - BLOCK
      ?auto_65696 - BLOCK
      ?auto_65695 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65694 ?auto_65693 ) ( ON-TABLE ?auto_65691 ) ( ON ?auto_65692 ?auto_65691 ) ( ON ?auto_65693 ?auto_65692 ) ( not ( = ?auto_65691 ?auto_65692 ) ) ( not ( = ?auto_65691 ?auto_65693 ) ) ( not ( = ?auto_65691 ?auto_65694 ) ) ( not ( = ?auto_65692 ?auto_65693 ) ) ( not ( = ?auto_65692 ?auto_65694 ) ) ( not ( = ?auto_65693 ?auto_65694 ) ) ( not ( = ?auto_65691 ?auto_65696 ) ) ( not ( = ?auto_65691 ?auto_65695 ) ) ( not ( = ?auto_65692 ?auto_65696 ) ) ( not ( = ?auto_65692 ?auto_65695 ) ) ( not ( = ?auto_65693 ?auto_65696 ) ) ( not ( = ?auto_65693 ?auto_65695 ) ) ( not ( = ?auto_65694 ?auto_65696 ) ) ( not ( = ?auto_65694 ?auto_65695 ) ) ( not ( = ?auto_65696 ?auto_65695 ) ) ( ON ?auto_65696 ?auto_65694 ) ( ON ?auto_65695 ?auto_65696 ) ( CLEAR ?auto_65695 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_65691 ?auto_65692 ?auto_65693 ?auto_65694 ?auto_65696 )
      ( MAKE-3PILE ?auto_65691 ?auto_65692 ?auto_65693 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_65007 - BLOCK
      ?auto_65008 - BLOCK
      ?auto_65009 - BLOCK
    )
    :vars
    (
      ?auto_65011 - BLOCK
      ?auto_65010 - BLOCK
      ?auto_65013 - BLOCK
      ?auto_65012 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65011 ?auto_65009 ) ( ON-TABLE ?auto_65007 ) ( ON ?auto_65008 ?auto_65007 ) ( ON ?auto_65009 ?auto_65008 ) ( not ( = ?auto_65007 ?auto_65008 ) ) ( not ( = ?auto_65007 ?auto_65009 ) ) ( not ( = ?auto_65007 ?auto_65011 ) ) ( not ( = ?auto_65008 ?auto_65009 ) ) ( not ( = ?auto_65008 ?auto_65011 ) ) ( not ( = ?auto_65009 ?auto_65011 ) ) ( not ( = ?auto_65007 ?auto_65010 ) ) ( not ( = ?auto_65007 ?auto_65013 ) ) ( not ( = ?auto_65008 ?auto_65010 ) ) ( not ( = ?auto_65008 ?auto_65013 ) ) ( not ( = ?auto_65009 ?auto_65010 ) ) ( not ( = ?auto_65009 ?auto_65013 ) ) ( not ( = ?auto_65011 ?auto_65010 ) ) ( not ( = ?auto_65011 ?auto_65013 ) ) ( not ( = ?auto_65010 ?auto_65013 ) ) ( ON ?auto_65010 ?auto_65011 ) ( not ( = ?auto_65012 ?auto_65013 ) ) ( not ( = ?auto_65007 ?auto_65012 ) ) ( not ( = ?auto_65008 ?auto_65012 ) ) ( not ( = ?auto_65009 ?auto_65012 ) ) ( not ( = ?auto_65011 ?auto_65012 ) ) ( not ( = ?auto_65010 ?auto_65012 ) ) ( ON ?auto_65013 ?auto_65010 ) ( CLEAR ?auto_65013 ) ( HOLDING ?auto_65012 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_65012 )
      ( MAKE-3PILE ?auto_65007 ?auto_65008 ?auto_65009 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_65014 - BLOCK
      ?auto_65015 - BLOCK
      ?auto_65016 - BLOCK
    )
    :vars
    (
      ?auto_65018 - BLOCK
      ?auto_65019 - BLOCK
      ?auto_65020 - BLOCK
      ?auto_65017 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65018 ?auto_65016 ) ( ON-TABLE ?auto_65014 ) ( ON ?auto_65015 ?auto_65014 ) ( ON ?auto_65016 ?auto_65015 ) ( not ( = ?auto_65014 ?auto_65015 ) ) ( not ( = ?auto_65014 ?auto_65016 ) ) ( not ( = ?auto_65014 ?auto_65018 ) ) ( not ( = ?auto_65015 ?auto_65016 ) ) ( not ( = ?auto_65015 ?auto_65018 ) ) ( not ( = ?auto_65016 ?auto_65018 ) ) ( not ( = ?auto_65014 ?auto_65019 ) ) ( not ( = ?auto_65014 ?auto_65020 ) ) ( not ( = ?auto_65015 ?auto_65019 ) ) ( not ( = ?auto_65015 ?auto_65020 ) ) ( not ( = ?auto_65016 ?auto_65019 ) ) ( not ( = ?auto_65016 ?auto_65020 ) ) ( not ( = ?auto_65018 ?auto_65019 ) ) ( not ( = ?auto_65018 ?auto_65020 ) ) ( not ( = ?auto_65019 ?auto_65020 ) ) ( ON ?auto_65019 ?auto_65018 ) ( not ( = ?auto_65017 ?auto_65020 ) ) ( not ( = ?auto_65014 ?auto_65017 ) ) ( not ( = ?auto_65015 ?auto_65017 ) ) ( not ( = ?auto_65016 ?auto_65017 ) ) ( not ( = ?auto_65018 ?auto_65017 ) ) ( not ( = ?auto_65019 ?auto_65017 ) ) ( ON ?auto_65020 ?auto_65019 ) ( ON ?auto_65017 ?auto_65020 ) ( CLEAR ?auto_65017 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_65014 ?auto_65015 ?auto_65016 ?auto_65018 ?auto_65019 ?auto_65020 )
      ( MAKE-3PILE ?auto_65014 ?auto_65015 ?auto_65016 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_65025 - BLOCK
      ?auto_65026 - BLOCK
      ?auto_65027 - BLOCK
      ?auto_65028 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_65028 ) ( CLEAR ?auto_65027 ) ( ON-TABLE ?auto_65025 ) ( ON ?auto_65026 ?auto_65025 ) ( ON ?auto_65027 ?auto_65026 ) ( not ( = ?auto_65025 ?auto_65026 ) ) ( not ( = ?auto_65025 ?auto_65027 ) ) ( not ( = ?auto_65025 ?auto_65028 ) ) ( not ( = ?auto_65026 ?auto_65027 ) ) ( not ( = ?auto_65026 ?auto_65028 ) ) ( not ( = ?auto_65027 ?auto_65028 ) ) )
    :subtasks
    ( ( !STACK ?auto_65028 ?auto_65027 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_65029 - BLOCK
      ?auto_65030 - BLOCK
      ?auto_65031 - BLOCK
      ?auto_65032 - BLOCK
    )
    :vars
    (
      ?auto_65033 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_65031 ) ( ON-TABLE ?auto_65029 ) ( ON ?auto_65030 ?auto_65029 ) ( ON ?auto_65031 ?auto_65030 ) ( not ( = ?auto_65029 ?auto_65030 ) ) ( not ( = ?auto_65029 ?auto_65031 ) ) ( not ( = ?auto_65029 ?auto_65032 ) ) ( not ( = ?auto_65030 ?auto_65031 ) ) ( not ( = ?auto_65030 ?auto_65032 ) ) ( not ( = ?auto_65031 ?auto_65032 ) ) ( ON ?auto_65032 ?auto_65033 ) ( CLEAR ?auto_65032 ) ( HAND-EMPTY ) ( not ( = ?auto_65029 ?auto_65033 ) ) ( not ( = ?auto_65030 ?auto_65033 ) ) ( not ( = ?auto_65031 ?auto_65033 ) ) ( not ( = ?auto_65032 ?auto_65033 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_65032 ?auto_65033 )
      ( MAKE-4PILE ?auto_65029 ?auto_65030 ?auto_65031 ?auto_65032 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_65034 - BLOCK
      ?auto_65035 - BLOCK
      ?auto_65036 - BLOCK
      ?auto_65037 - BLOCK
    )
    :vars
    (
      ?auto_65038 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_65034 ) ( ON ?auto_65035 ?auto_65034 ) ( not ( = ?auto_65034 ?auto_65035 ) ) ( not ( = ?auto_65034 ?auto_65036 ) ) ( not ( = ?auto_65034 ?auto_65037 ) ) ( not ( = ?auto_65035 ?auto_65036 ) ) ( not ( = ?auto_65035 ?auto_65037 ) ) ( not ( = ?auto_65036 ?auto_65037 ) ) ( ON ?auto_65037 ?auto_65038 ) ( CLEAR ?auto_65037 ) ( not ( = ?auto_65034 ?auto_65038 ) ) ( not ( = ?auto_65035 ?auto_65038 ) ) ( not ( = ?auto_65036 ?auto_65038 ) ) ( not ( = ?auto_65037 ?auto_65038 ) ) ( HOLDING ?auto_65036 ) ( CLEAR ?auto_65035 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_65034 ?auto_65035 ?auto_65036 )
      ( MAKE-4PILE ?auto_65034 ?auto_65035 ?auto_65036 ?auto_65037 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_65039 - BLOCK
      ?auto_65040 - BLOCK
      ?auto_65041 - BLOCK
      ?auto_65042 - BLOCK
    )
    :vars
    (
      ?auto_65043 - BLOCK
      ?auto_65044 - BLOCK
      ?auto_65045 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_65039 ) ( ON ?auto_65040 ?auto_65039 ) ( not ( = ?auto_65039 ?auto_65040 ) ) ( not ( = ?auto_65039 ?auto_65041 ) ) ( not ( = ?auto_65039 ?auto_65042 ) ) ( not ( = ?auto_65040 ?auto_65041 ) ) ( not ( = ?auto_65040 ?auto_65042 ) ) ( not ( = ?auto_65041 ?auto_65042 ) ) ( ON ?auto_65042 ?auto_65043 ) ( not ( = ?auto_65039 ?auto_65043 ) ) ( not ( = ?auto_65040 ?auto_65043 ) ) ( not ( = ?auto_65041 ?auto_65043 ) ) ( not ( = ?auto_65042 ?auto_65043 ) ) ( CLEAR ?auto_65040 ) ( ON ?auto_65041 ?auto_65042 ) ( CLEAR ?auto_65041 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_65044 ) ( ON ?auto_65045 ?auto_65044 ) ( ON ?auto_65043 ?auto_65045 ) ( not ( = ?auto_65044 ?auto_65045 ) ) ( not ( = ?auto_65044 ?auto_65043 ) ) ( not ( = ?auto_65044 ?auto_65042 ) ) ( not ( = ?auto_65044 ?auto_65041 ) ) ( not ( = ?auto_65045 ?auto_65043 ) ) ( not ( = ?auto_65045 ?auto_65042 ) ) ( not ( = ?auto_65045 ?auto_65041 ) ) ( not ( = ?auto_65039 ?auto_65044 ) ) ( not ( = ?auto_65039 ?auto_65045 ) ) ( not ( = ?auto_65040 ?auto_65044 ) ) ( not ( = ?auto_65040 ?auto_65045 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_65044 ?auto_65045 ?auto_65043 ?auto_65042 )
      ( MAKE-4PILE ?auto_65039 ?auto_65040 ?auto_65041 ?auto_65042 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_65046 - BLOCK
      ?auto_65047 - BLOCK
      ?auto_65048 - BLOCK
      ?auto_65049 - BLOCK
    )
    :vars
    (
      ?auto_65052 - BLOCK
      ?auto_65050 - BLOCK
      ?auto_65051 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_65046 ) ( not ( = ?auto_65046 ?auto_65047 ) ) ( not ( = ?auto_65046 ?auto_65048 ) ) ( not ( = ?auto_65046 ?auto_65049 ) ) ( not ( = ?auto_65047 ?auto_65048 ) ) ( not ( = ?auto_65047 ?auto_65049 ) ) ( not ( = ?auto_65048 ?auto_65049 ) ) ( ON ?auto_65049 ?auto_65052 ) ( not ( = ?auto_65046 ?auto_65052 ) ) ( not ( = ?auto_65047 ?auto_65052 ) ) ( not ( = ?auto_65048 ?auto_65052 ) ) ( not ( = ?auto_65049 ?auto_65052 ) ) ( ON ?auto_65048 ?auto_65049 ) ( CLEAR ?auto_65048 ) ( ON-TABLE ?auto_65050 ) ( ON ?auto_65051 ?auto_65050 ) ( ON ?auto_65052 ?auto_65051 ) ( not ( = ?auto_65050 ?auto_65051 ) ) ( not ( = ?auto_65050 ?auto_65052 ) ) ( not ( = ?auto_65050 ?auto_65049 ) ) ( not ( = ?auto_65050 ?auto_65048 ) ) ( not ( = ?auto_65051 ?auto_65052 ) ) ( not ( = ?auto_65051 ?auto_65049 ) ) ( not ( = ?auto_65051 ?auto_65048 ) ) ( not ( = ?auto_65046 ?auto_65050 ) ) ( not ( = ?auto_65046 ?auto_65051 ) ) ( not ( = ?auto_65047 ?auto_65050 ) ) ( not ( = ?auto_65047 ?auto_65051 ) ) ( HOLDING ?auto_65047 ) ( CLEAR ?auto_65046 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_65046 ?auto_65047 )
      ( MAKE-4PILE ?auto_65046 ?auto_65047 ?auto_65048 ?auto_65049 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_65053 - BLOCK
      ?auto_65054 - BLOCK
      ?auto_65055 - BLOCK
      ?auto_65056 - BLOCK
    )
    :vars
    (
      ?auto_65058 - BLOCK
      ?auto_65059 - BLOCK
      ?auto_65057 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_65053 ) ( not ( = ?auto_65053 ?auto_65054 ) ) ( not ( = ?auto_65053 ?auto_65055 ) ) ( not ( = ?auto_65053 ?auto_65056 ) ) ( not ( = ?auto_65054 ?auto_65055 ) ) ( not ( = ?auto_65054 ?auto_65056 ) ) ( not ( = ?auto_65055 ?auto_65056 ) ) ( ON ?auto_65056 ?auto_65058 ) ( not ( = ?auto_65053 ?auto_65058 ) ) ( not ( = ?auto_65054 ?auto_65058 ) ) ( not ( = ?auto_65055 ?auto_65058 ) ) ( not ( = ?auto_65056 ?auto_65058 ) ) ( ON ?auto_65055 ?auto_65056 ) ( ON-TABLE ?auto_65059 ) ( ON ?auto_65057 ?auto_65059 ) ( ON ?auto_65058 ?auto_65057 ) ( not ( = ?auto_65059 ?auto_65057 ) ) ( not ( = ?auto_65059 ?auto_65058 ) ) ( not ( = ?auto_65059 ?auto_65056 ) ) ( not ( = ?auto_65059 ?auto_65055 ) ) ( not ( = ?auto_65057 ?auto_65058 ) ) ( not ( = ?auto_65057 ?auto_65056 ) ) ( not ( = ?auto_65057 ?auto_65055 ) ) ( not ( = ?auto_65053 ?auto_65059 ) ) ( not ( = ?auto_65053 ?auto_65057 ) ) ( not ( = ?auto_65054 ?auto_65059 ) ) ( not ( = ?auto_65054 ?auto_65057 ) ) ( CLEAR ?auto_65053 ) ( ON ?auto_65054 ?auto_65055 ) ( CLEAR ?auto_65054 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_65059 ?auto_65057 ?auto_65058 ?auto_65056 ?auto_65055 )
      ( MAKE-4PILE ?auto_65053 ?auto_65054 ?auto_65055 ?auto_65056 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_65060 - BLOCK
      ?auto_65061 - BLOCK
      ?auto_65062 - BLOCK
      ?auto_65063 - BLOCK
    )
    :vars
    (
      ?auto_65064 - BLOCK
      ?auto_65065 - BLOCK
      ?auto_65066 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65060 ?auto_65061 ) ) ( not ( = ?auto_65060 ?auto_65062 ) ) ( not ( = ?auto_65060 ?auto_65063 ) ) ( not ( = ?auto_65061 ?auto_65062 ) ) ( not ( = ?auto_65061 ?auto_65063 ) ) ( not ( = ?auto_65062 ?auto_65063 ) ) ( ON ?auto_65063 ?auto_65064 ) ( not ( = ?auto_65060 ?auto_65064 ) ) ( not ( = ?auto_65061 ?auto_65064 ) ) ( not ( = ?auto_65062 ?auto_65064 ) ) ( not ( = ?auto_65063 ?auto_65064 ) ) ( ON ?auto_65062 ?auto_65063 ) ( ON-TABLE ?auto_65065 ) ( ON ?auto_65066 ?auto_65065 ) ( ON ?auto_65064 ?auto_65066 ) ( not ( = ?auto_65065 ?auto_65066 ) ) ( not ( = ?auto_65065 ?auto_65064 ) ) ( not ( = ?auto_65065 ?auto_65063 ) ) ( not ( = ?auto_65065 ?auto_65062 ) ) ( not ( = ?auto_65066 ?auto_65064 ) ) ( not ( = ?auto_65066 ?auto_65063 ) ) ( not ( = ?auto_65066 ?auto_65062 ) ) ( not ( = ?auto_65060 ?auto_65065 ) ) ( not ( = ?auto_65060 ?auto_65066 ) ) ( not ( = ?auto_65061 ?auto_65065 ) ) ( not ( = ?auto_65061 ?auto_65066 ) ) ( ON ?auto_65061 ?auto_65062 ) ( CLEAR ?auto_65061 ) ( HOLDING ?auto_65060 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_65060 )
      ( MAKE-4PILE ?auto_65060 ?auto_65061 ?auto_65062 ?auto_65063 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_65067 - BLOCK
      ?auto_65068 - BLOCK
      ?auto_65069 - BLOCK
      ?auto_65070 - BLOCK
    )
    :vars
    (
      ?auto_65072 - BLOCK
      ?auto_65071 - BLOCK
      ?auto_65073 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65067 ?auto_65068 ) ) ( not ( = ?auto_65067 ?auto_65069 ) ) ( not ( = ?auto_65067 ?auto_65070 ) ) ( not ( = ?auto_65068 ?auto_65069 ) ) ( not ( = ?auto_65068 ?auto_65070 ) ) ( not ( = ?auto_65069 ?auto_65070 ) ) ( ON ?auto_65070 ?auto_65072 ) ( not ( = ?auto_65067 ?auto_65072 ) ) ( not ( = ?auto_65068 ?auto_65072 ) ) ( not ( = ?auto_65069 ?auto_65072 ) ) ( not ( = ?auto_65070 ?auto_65072 ) ) ( ON ?auto_65069 ?auto_65070 ) ( ON-TABLE ?auto_65071 ) ( ON ?auto_65073 ?auto_65071 ) ( ON ?auto_65072 ?auto_65073 ) ( not ( = ?auto_65071 ?auto_65073 ) ) ( not ( = ?auto_65071 ?auto_65072 ) ) ( not ( = ?auto_65071 ?auto_65070 ) ) ( not ( = ?auto_65071 ?auto_65069 ) ) ( not ( = ?auto_65073 ?auto_65072 ) ) ( not ( = ?auto_65073 ?auto_65070 ) ) ( not ( = ?auto_65073 ?auto_65069 ) ) ( not ( = ?auto_65067 ?auto_65071 ) ) ( not ( = ?auto_65067 ?auto_65073 ) ) ( not ( = ?auto_65068 ?auto_65071 ) ) ( not ( = ?auto_65068 ?auto_65073 ) ) ( ON ?auto_65068 ?auto_65069 ) ( ON ?auto_65067 ?auto_65068 ) ( CLEAR ?auto_65067 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_65071 ?auto_65073 ?auto_65072 ?auto_65070 ?auto_65069 ?auto_65068 )
      ( MAKE-4PILE ?auto_65067 ?auto_65068 ?auto_65069 ?auto_65070 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_65076 - BLOCK
      ?auto_65077 - BLOCK
    )
    :vars
    (
      ?auto_65078 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65078 ?auto_65077 ) ( CLEAR ?auto_65078 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_65076 ) ( ON ?auto_65077 ?auto_65076 ) ( not ( = ?auto_65076 ?auto_65077 ) ) ( not ( = ?auto_65076 ?auto_65078 ) ) ( not ( = ?auto_65077 ?auto_65078 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_65078 ?auto_65077 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_65079 - BLOCK
      ?auto_65080 - BLOCK
    )
    :vars
    (
      ?auto_65081 - BLOCK
      ?auto_65082 - BLOCK
      ?auto_65083 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65081 ?auto_65080 ) ( CLEAR ?auto_65081 ) ( ON-TABLE ?auto_65079 ) ( ON ?auto_65080 ?auto_65079 ) ( not ( = ?auto_65079 ?auto_65080 ) ) ( not ( = ?auto_65079 ?auto_65081 ) ) ( not ( = ?auto_65080 ?auto_65081 ) ) ( HOLDING ?auto_65082 ) ( CLEAR ?auto_65083 ) ( not ( = ?auto_65079 ?auto_65082 ) ) ( not ( = ?auto_65079 ?auto_65083 ) ) ( not ( = ?auto_65080 ?auto_65082 ) ) ( not ( = ?auto_65080 ?auto_65083 ) ) ( not ( = ?auto_65081 ?auto_65082 ) ) ( not ( = ?auto_65081 ?auto_65083 ) ) ( not ( = ?auto_65082 ?auto_65083 ) ) )
    :subtasks
    ( ( !STACK ?auto_65082 ?auto_65083 )
      ( MAKE-2PILE ?auto_65079 ?auto_65080 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_65084 - BLOCK
      ?auto_65085 - BLOCK
    )
    :vars
    (
      ?auto_65086 - BLOCK
      ?auto_65087 - BLOCK
      ?auto_65088 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65086 ?auto_65085 ) ( ON-TABLE ?auto_65084 ) ( ON ?auto_65085 ?auto_65084 ) ( not ( = ?auto_65084 ?auto_65085 ) ) ( not ( = ?auto_65084 ?auto_65086 ) ) ( not ( = ?auto_65085 ?auto_65086 ) ) ( CLEAR ?auto_65087 ) ( not ( = ?auto_65084 ?auto_65088 ) ) ( not ( = ?auto_65084 ?auto_65087 ) ) ( not ( = ?auto_65085 ?auto_65088 ) ) ( not ( = ?auto_65085 ?auto_65087 ) ) ( not ( = ?auto_65086 ?auto_65088 ) ) ( not ( = ?auto_65086 ?auto_65087 ) ) ( not ( = ?auto_65088 ?auto_65087 ) ) ( ON ?auto_65088 ?auto_65086 ) ( CLEAR ?auto_65088 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_65084 ?auto_65085 ?auto_65086 )
      ( MAKE-2PILE ?auto_65084 ?auto_65085 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_65089 - BLOCK
      ?auto_65090 - BLOCK
    )
    :vars
    (
      ?auto_65093 - BLOCK
      ?auto_65091 - BLOCK
      ?auto_65092 - BLOCK
      ?auto_65095 - BLOCK
      ?auto_65094 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65093 ?auto_65090 ) ( ON-TABLE ?auto_65089 ) ( ON ?auto_65090 ?auto_65089 ) ( not ( = ?auto_65089 ?auto_65090 ) ) ( not ( = ?auto_65089 ?auto_65093 ) ) ( not ( = ?auto_65090 ?auto_65093 ) ) ( not ( = ?auto_65089 ?auto_65091 ) ) ( not ( = ?auto_65089 ?auto_65092 ) ) ( not ( = ?auto_65090 ?auto_65091 ) ) ( not ( = ?auto_65090 ?auto_65092 ) ) ( not ( = ?auto_65093 ?auto_65091 ) ) ( not ( = ?auto_65093 ?auto_65092 ) ) ( not ( = ?auto_65091 ?auto_65092 ) ) ( ON ?auto_65091 ?auto_65093 ) ( CLEAR ?auto_65091 ) ( HOLDING ?auto_65092 ) ( CLEAR ?auto_65095 ) ( ON-TABLE ?auto_65094 ) ( ON ?auto_65095 ?auto_65094 ) ( not ( = ?auto_65094 ?auto_65095 ) ) ( not ( = ?auto_65094 ?auto_65092 ) ) ( not ( = ?auto_65095 ?auto_65092 ) ) ( not ( = ?auto_65089 ?auto_65095 ) ) ( not ( = ?auto_65089 ?auto_65094 ) ) ( not ( = ?auto_65090 ?auto_65095 ) ) ( not ( = ?auto_65090 ?auto_65094 ) ) ( not ( = ?auto_65093 ?auto_65095 ) ) ( not ( = ?auto_65093 ?auto_65094 ) ) ( not ( = ?auto_65091 ?auto_65095 ) ) ( not ( = ?auto_65091 ?auto_65094 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_65094 ?auto_65095 ?auto_65092 )
      ( MAKE-2PILE ?auto_65089 ?auto_65090 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_65096 - BLOCK
      ?auto_65097 - BLOCK
    )
    :vars
    (
      ?auto_65100 - BLOCK
      ?auto_65101 - BLOCK
      ?auto_65098 - BLOCK
      ?auto_65102 - BLOCK
      ?auto_65099 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65100 ?auto_65097 ) ( ON-TABLE ?auto_65096 ) ( ON ?auto_65097 ?auto_65096 ) ( not ( = ?auto_65096 ?auto_65097 ) ) ( not ( = ?auto_65096 ?auto_65100 ) ) ( not ( = ?auto_65097 ?auto_65100 ) ) ( not ( = ?auto_65096 ?auto_65101 ) ) ( not ( = ?auto_65096 ?auto_65098 ) ) ( not ( = ?auto_65097 ?auto_65101 ) ) ( not ( = ?auto_65097 ?auto_65098 ) ) ( not ( = ?auto_65100 ?auto_65101 ) ) ( not ( = ?auto_65100 ?auto_65098 ) ) ( not ( = ?auto_65101 ?auto_65098 ) ) ( ON ?auto_65101 ?auto_65100 ) ( CLEAR ?auto_65102 ) ( ON-TABLE ?auto_65099 ) ( ON ?auto_65102 ?auto_65099 ) ( not ( = ?auto_65099 ?auto_65102 ) ) ( not ( = ?auto_65099 ?auto_65098 ) ) ( not ( = ?auto_65102 ?auto_65098 ) ) ( not ( = ?auto_65096 ?auto_65102 ) ) ( not ( = ?auto_65096 ?auto_65099 ) ) ( not ( = ?auto_65097 ?auto_65102 ) ) ( not ( = ?auto_65097 ?auto_65099 ) ) ( not ( = ?auto_65100 ?auto_65102 ) ) ( not ( = ?auto_65100 ?auto_65099 ) ) ( not ( = ?auto_65101 ?auto_65102 ) ) ( not ( = ?auto_65101 ?auto_65099 ) ) ( ON ?auto_65098 ?auto_65101 ) ( CLEAR ?auto_65098 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_65096 ?auto_65097 ?auto_65100 ?auto_65101 )
      ( MAKE-2PILE ?auto_65096 ?auto_65097 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_65103 - BLOCK
      ?auto_65104 - BLOCK
    )
    :vars
    (
      ?auto_65107 - BLOCK
      ?auto_65105 - BLOCK
      ?auto_65108 - BLOCK
      ?auto_65106 - BLOCK
      ?auto_65109 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65107 ?auto_65104 ) ( ON-TABLE ?auto_65103 ) ( ON ?auto_65104 ?auto_65103 ) ( not ( = ?auto_65103 ?auto_65104 ) ) ( not ( = ?auto_65103 ?auto_65107 ) ) ( not ( = ?auto_65104 ?auto_65107 ) ) ( not ( = ?auto_65103 ?auto_65105 ) ) ( not ( = ?auto_65103 ?auto_65108 ) ) ( not ( = ?auto_65104 ?auto_65105 ) ) ( not ( = ?auto_65104 ?auto_65108 ) ) ( not ( = ?auto_65107 ?auto_65105 ) ) ( not ( = ?auto_65107 ?auto_65108 ) ) ( not ( = ?auto_65105 ?auto_65108 ) ) ( ON ?auto_65105 ?auto_65107 ) ( ON-TABLE ?auto_65106 ) ( not ( = ?auto_65106 ?auto_65109 ) ) ( not ( = ?auto_65106 ?auto_65108 ) ) ( not ( = ?auto_65109 ?auto_65108 ) ) ( not ( = ?auto_65103 ?auto_65109 ) ) ( not ( = ?auto_65103 ?auto_65106 ) ) ( not ( = ?auto_65104 ?auto_65109 ) ) ( not ( = ?auto_65104 ?auto_65106 ) ) ( not ( = ?auto_65107 ?auto_65109 ) ) ( not ( = ?auto_65107 ?auto_65106 ) ) ( not ( = ?auto_65105 ?auto_65109 ) ) ( not ( = ?auto_65105 ?auto_65106 ) ) ( ON ?auto_65108 ?auto_65105 ) ( CLEAR ?auto_65108 ) ( HOLDING ?auto_65109 ) ( CLEAR ?auto_65106 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_65106 ?auto_65109 )
      ( MAKE-2PILE ?auto_65103 ?auto_65104 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_65881 - BLOCK
      ?auto_65882 - BLOCK
    )
    :vars
    (
      ?auto_65886 - BLOCK
      ?auto_65883 - BLOCK
      ?auto_65885 - BLOCK
      ?auto_65884 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65886 ?auto_65882 ) ( ON-TABLE ?auto_65881 ) ( ON ?auto_65882 ?auto_65881 ) ( not ( = ?auto_65881 ?auto_65882 ) ) ( not ( = ?auto_65881 ?auto_65886 ) ) ( not ( = ?auto_65882 ?auto_65886 ) ) ( not ( = ?auto_65881 ?auto_65883 ) ) ( not ( = ?auto_65881 ?auto_65885 ) ) ( not ( = ?auto_65882 ?auto_65883 ) ) ( not ( = ?auto_65882 ?auto_65885 ) ) ( not ( = ?auto_65886 ?auto_65883 ) ) ( not ( = ?auto_65886 ?auto_65885 ) ) ( not ( = ?auto_65883 ?auto_65885 ) ) ( ON ?auto_65883 ?auto_65886 ) ( not ( = ?auto_65884 ?auto_65885 ) ) ( not ( = ?auto_65881 ?auto_65884 ) ) ( not ( = ?auto_65882 ?auto_65884 ) ) ( not ( = ?auto_65886 ?auto_65884 ) ) ( not ( = ?auto_65883 ?auto_65884 ) ) ( ON ?auto_65885 ?auto_65883 ) ( ON ?auto_65884 ?auto_65885 ) ( CLEAR ?auto_65884 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_65881 ?auto_65882 ?auto_65886 ?auto_65883 ?auto_65885 )
      ( MAKE-2PILE ?auto_65881 ?auto_65882 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_65117 - BLOCK
      ?auto_65118 - BLOCK
    )
    :vars
    (
      ?auto_65122 - BLOCK
      ?auto_65123 - BLOCK
      ?auto_65119 - BLOCK
      ?auto_65121 - BLOCK
      ?auto_65120 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65122 ?auto_65118 ) ( ON-TABLE ?auto_65117 ) ( ON ?auto_65118 ?auto_65117 ) ( not ( = ?auto_65117 ?auto_65118 ) ) ( not ( = ?auto_65117 ?auto_65122 ) ) ( not ( = ?auto_65118 ?auto_65122 ) ) ( not ( = ?auto_65117 ?auto_65123 ) ) ( not ( = ?auto_65117 ?auto_65119 ) ) ( not ( = ?auto_65118 ?auto_65123 ) ) ( not ( = ?auto_65118 ?auto_65119 ) ) ( not ( = ?auto_65122 ?auto_65123 ) ) ( not ( = ?auto_65122 ?auto_65119 ) ) ( not ( = ?auto_65123 ?auto_65119 ) ) ( ON ?auto_65123 ?auto_65122 ) ( not ( = ?auto_65121 ?auto_65120 ) ) ( not ( = ?auto_65121 ?auto_65119 ) ) ( not ( = ?auto_65120 ?auto_65119 ) ) ( not ( = ?auto_65117 ?auto_65120 ) ) ( not ( = ?auto_65117 ?auto_65121 ) ) ( not ( = ?auto_65118 ?auto_65120 ) ) ( not ( = ?auto_65118 ?auto_65121 ) ) ( not ( = ?auto_65122 ?auto_65120 ) ) ( not ( = ?auto_65122 ?auto_65121 ) ) ( not ( = ?auto_65123 ?auto_65120 ) ) ( not ( = ?auto_65123 ?auto_65121 ) ) ( ON ?auto_65119 ?auto_65123 ) ( ON ?auto_65120 ?auto_65119 ) ( CLEAR ?auto_65120 ) ( HOLDING ?auto_65121 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_65121 )
      ( MAKE-2PILE ?auto_65117 ?auto_65118 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_65124 - BLOCK
      ?auto_65125 - BLOCK
    )
    :vars
    (
      ?auto_65127 - BLOCK
      ?auto_65130 - BLOCK
      ?auto_65129 - BLOCK
      ?auto_65128 - BLOCK
      ?auto_65126 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65127 ?auto_65125 ) ( ON-TABLE ?auto_65124 ) ( ON ?auto_65125 ?auto_65124 ) ( not ( = ?auto_65124 ?auto_65125 ) ) ( not ( = ?auto_65124 ?auto_65127 ) ) ( not ( = ?auto_65125 ?auto_65127 ) ) ( not ( = ?auto_65124 ?auto_65130 ) ) ( not ( = ?auto_65124 ?auto_65129 ) ) ( not ( = ?auto_65125 ?auto_65130 ) ) ( not ( = ?auto_65125 ?auto_65129 ) ) ( not ( = ?auto_65127 ?auto_65130 ) ) ( not ( = ?auto_65127 ?auto_65129 ) ) ( not ( = ?auto_65130 ?auto_65129 ) ) ( ON ?auto_65130 ?auto_65127 ) ( not ( = ?auto_65128 ?auto_65126 ) ) ( not ( = ?auto_65128 ?auto_65129 ) ) ( not ( = ?auto_65126 ?auto_65129 ) ) ( not ( = ?auto_65124 ?auto_65126 ) ) ( not ( = ?auto_65124 ?auto_65128 ) ) ( not ( = ?auto_65125 ?auto_65126 ) ) ( not ( = ?auto_65125 ?auto_65128 ) ) ( not ( = ?auto_65127 ?auto_65126 ) ) ( not ( = ?auto_65127 ?auto_65128 ) ) ( not ( = ?auto_65130 ?auto_65126 ) ) ( not ( = ?auto_65130 ?auto_65128 ) ) ( ON ?auto_65129 ?auto_65130 ) ( ON ?auto_65126 ?auto_65129 ) ( ON ?auto_65128 ?auto_65126 ) ( CLEAR ?auto_65128 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_65124 ?auto_65125 ?auto_65127 ?auto_65130 ?auto_65129 ?auto_65126 )
      ( MAKE-2PILE ?auto_65124 ?auto_65125 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_65136 - BLOCK
      ?auto_65137 - BLOCK
      ?auto_65138 - BLOCK
      ?auto_65139 - BLOCK
      ?auto_65140 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_65140 ) ( CLEAR ?auto_65139 ) ( ON-TABLE ?auto_65136 ) ( ON ?auto_65137 ?auto_65136 ) ( ON ?auto_65138 ?auto_65137 ) ( ON ?auto_65139 ?auto_65138 ) ( not ( = ?auto_65136 ?auto_65137 ) ) ( not ( = ?auto_65136 ?auto_65138 ) ) ( not ( = ?auto_65136 ?auto_65139 ) ) ( not ( = ?auto_65136 ?auto_65140 ) ) ( not ( = ?auto_65137 ?auto_65138 ) ) ( not ( = ?auto_65137 ?auto_65139 ) ) ( not ( = ?auto_65137 ?auto_65140 ) ) ( not ( = ?auto_65138 ?auto_65139 ) ) ( not ( = ?auto_65138 ?auto_65140 ) ) ( not ( = ?auto_65139 ?auto_65140 ) ) )
    :subtasks
    ( ( !STACK ?auto_65140 ?auto_65139 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_65141 - BLOCK
      ?auto_65142 - BLOCK
      ?auto_65143 - BLOCK
      ?auto_65144 - BLOCK
      ?auto_65145 - BLOCK
    )
    :vars
    (
      ?auto_65146 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_65144 ) ( ON-TABLE ?auto_65141 ) ( ON ?auto_65142 ?auto_65141 ) ( ON ?auto_65143 ?auto_65142 ) ( ON ?auto_65144 ?auto_65143 ) ( not ( = ?auto_65141 ?auto_65142 ) ) ( not ( = ?auto_65141 ?auto_65143 ) ) ( not ( = ?auto_65141 ?auto_65144 ) ) ( not ( = ?auto_65141 ?auto_65145 ) ) ( not ( = ?auto_65142 ?auto_65143 ) ) ( not ( = ?auto_65142 ?auto_65144 ) ) ( not ( = ?auto_65142 ?auto_65145 ) ) ( not ( = ?auto_65143 ?auto_65144 ) ) ( not ( = ?auto_65143 ?auto_65145 ) ) ( not ( = ?auto_65144 ?auto_65145 ) ) ( ON ?auto_65145 ?auto_65146 ) ( CLEAR ?auto_65145 ) ( HAND-EMPTY ) ( not ( = ?auto_65141 ?auto_65146 ) ) ( not ( = ?auto_65142 ?auto_65146 ) ) ( not ( = ?auto_65143 ?auto_65146 ) ) ( not ( = ?auto_65144 ?auto_65146 ) ) ( not ( = ?auto_65145 ?auto_65146 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_65145 ?auto_65146 )
      ( MAKE-5PILE ?auto_65141 ?auto_65142 ?auto_65143 ?auto_65144 ?auto_65145 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_65147 - BLOCK
      ?auto_65148 - BLOCK
      ?auto_65149 - BLOCK
      ?auto_65150 - BLOCK
      ?auto_65151 - BLOCK
    )
    :vars
    (
      ?auto_65152 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_65147 ) ( ON ?auto_65148 ?auto_65147 ) ( ON ?auto_65149 ?auto_65148 ) ( not ( = ?auto_65147 ?auto_65148 ) ) ( not ( = ?auto_65147 ?auto_65149 ) ) ( not ( = ?auto_65147 ?auto_65150 ) ) ( not ( = ?auto_65147 ?auto_65151 ) ) ( not ( = ?auto_65148 ?auto_65149 ) ) ( not ( = ?auto_65148 ?auto_65150 ) ) ( not ( = ?auto_65148 ?auto_65151 ) ) ( not ( = ?auto_65149 ?auto_65150 ) ) ( not ( = ?auto_65149 ?auto_65151 ) ) ( not ( = ?auto_65150 ?auto_65151 ) ) ( ON ?auto_65151 ?auto_65152 ) ( CLEAR ?auto_65151 ) ( not ( = ?auto_65147 ?auto_65152 ) ) ( not ( = ?auto_65148 ?auto_65152 ) ) ( not ( = ?auto_65149 ?auto_65152 ) ) ( not ( = ?auto_65150 ?auto_65152 ) ) ( not ( = ?auto_65151 ?auto_65152 ) ) ( HOLDING ?auto_65150 ) ( CLEAR ?auto_65149 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_65147 ?auto_65148 ?auto_65149 ?auto_65150 )
      ( MAKE-5PILE ?auto_65147 ?auto_65148 ?auto_65149 ?auto_65150 ?auto_65151 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_65153 - BLOCK
      ?auto_65154 - BLOCK
      ?auto_65155 - BLOCK
      ?auto_65156 - BLOCK
      ?auto_65157 - BLOCK
    )
    :vars
    (
      ?auto_65158 - BLOCK
      ?auto_65159 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_65153 ) ( ON ?auto_65154 ?auto_65153 ) ( ON ?auto_65155 ?auto_65154 ) ( not ( = ?auto_65153 ?auto_65154 ) ) ( not ( = ?auto_65153 ?auto_65155 ) ) ( not ( = ?auto_65153 ?auto_65156 ) ) ( not ( = ?auto_65153 ?auto_65157 ) ) ( not ( = ?auto_65154 ?auto_65155 ) ) ( not ( = ?auto_65154 ?auto_65156 ) ) ( not ( = ?auto_65154 ?auto_65157 ) ) ( not ( = ?auto_65155 ?auto_65156 ) ) ( not ( = ?auto_65155 ?auto_65157 ) ) ( not ( = ?auto_65156 ?auto_65157 ) ) ( ON ?auto_65157 ?auto_65158 ) ( not ( = ?auto_65153 ?auto_65158 ) ) ( not ( = ?auto_65154 ?auto_65158 ) ) ( not ( = ?auto_65155 ?auto_65158 ) ) ( not ( = ?auto_65156 ?auto_65158 ) ) ( not ( = ?auto_65157 ?auto_65158 ) ) ( CLEAR ?auto_65155 ) ( ON ?auto_65156 ?auto_65157 ) ( CLEAR ?auto_65156 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_65159 ) ( ON ?auto_65158 ?auto_65159 ) ( not ( = ?auto_65159 ?auto_65158 ) ) ( not ( = ?auto_65159 ?auto_65157 ) ) ( not ( = ?auto_65159 ?auto_65156 ) ) ( not ( = ?auto_65153 ?auto_65159 ) ) ( not ( = ?auto_65154 ?auto_65159 ) ) ( not ( = ?auto_65155 ?auto_65159 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_65159 ?auto_65158 ?auto_65157 )
      ( MAKE-5PILE ?auto_65153 ?auto_65154 ?auto_65155 ?auto_65156 ?auto_65157 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_65160 - BLOCK
      ?auto_65161 - BLOCK
      ?auto_65162 - BLOCK
      ?auto_65163 - BLOCK
      ?auto_65164 - BLOCK
    )
    :vars
    (
      ?auto_65165 - BLOCK
      ?auto_65166 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_65160 ) ( ON ?auto_65161 ?auto_65160 ) ( not ( = ?auto_65160 ?auto_65161 ) ) ( not ( = ?auto_65160 ?auto_65162 ) ) ( not ( = ?auto_65160 ?auto_65163 ) ) ( not ( = ?auto_65160 ?auto_65164 ) ) ( not ( = ?auto_65161 ?auto_65162 ) ) ( not ( = ?auto_65161 ?auto_65163 ) ) ( not ( = ?auto_65161 ?auto_65164 ) ) ( not ( = ?auto_65162 ?auto_65163 ) ) ( not ( = ?auto_65162 ?auto_65164 ) ) ( not ( = ?auto_65163 ?auto_65164 ) ) ( ON ?auto_65164 ?auto_65165 ) ( not ( = ?auto_65160 ?auto_65165 ) ) ( not ( = ?auto_65161 ?auto_65165 ) ) ( not ( = ?auto_65162 ?auto_65165 ) ) ( not ( = ?auto_65163 ?auto_65165 ) ) ( not ( = ?auto_65164 ?auto_65165 ) ) ( ON ?auto_65163 ?auto_65164 ) ( CLEAR ?auto_65163 ) ( ON-TABLE ?auto_65166 ) ( ON ?auto_65165 ?auto_65166 ) ( not ( = ?auto_65166 ?auto_65165 ) ) ( not ( = ?auto_65166 ?auto_65164 ) ) ( not ( = ?auto_65166 ?auto_65163 ) ) ( not ( = ?auto_65160 ?auto_65166 ) ) ( not ( = ?auto_65161 ?auto_65166 ) ) ( not ( = ?auto_65162 ?auto_65166 ) ) ( HOLDING ?auto_65162 ) ( CLEAR ?auto_65161 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_65160 ?auto_65161 ?auto_65162 )
      ( MAKE-5PILE ?auto_65160 ?auto_65161 ?auto_65162 ?auto_65163 ?auto_65164 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_65167 - BLOCK
      ?auto_65168 - BLOCK
      ?auto_65169 - BLOCK
      ?auto_65170 - BLOCK
      ?auto_65171 - BLOCK
    )
    :vars
    (
      ?auto_65173 - BLOCK
      ?auto_65172 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_65167 ) ( ON ?auto_65168 ?auto_65167 ) ( not ( = ?auto_65167 ?auto_65168 ) ) ( not ( = ?auto_65167 ?auto_65169 ) ) ( not ( = ?auto_65167 ?auto_65170 ) ) ( not ( = ?auto_65167 ?auto_65171 ) ) ( not ( = ?auto_65168 ?auto_65169 ) ) ( not ( = ?auto_65168 ?auto_65170 ) ) ( not ( = ?auto_65168 ?auto_65171 ) ) ( not ( = ?auto_65169 ?auto_65170 ) ) ( not ( = ?auto_65169 ?auto_65171 ) ) ( not ( = ?auto_65170 ?auto_65171 ) ) ( ON ?auto_65171 ?auto_65173 ) ( not ( = ?auto_65167 ?auto_65173 ) ) ( not ( = ?auto_65168 ?auto_65173 ) ) ( not ( = ?auto_65169 ?auto_65173 ) ) ( not ( = ?auto_65170 ?auto_65173 ) ) ( not ( = ?auto_65171 ?auto_65173 ) ) ( ON ?auto_65170 ?auto_65171 ) ( ON-TABLE ?auto_65172 ) ( ON ?auto_65173 ?auto_65172 ) ( not ( = ?auto_65172 ?auto_65173 ) ) ( not ( = ?auto_65172 ?auto_65171 ) ) ( not ( = ?auto_65172 ?auto_65170 ) ) ( not ( = ?auto_65167 ?auto_65172 ) ) ( not ( = ?auto_65168 ?auto_65172 ) ) ( not ( = ?auto_65169 ?auto_65172 ) ) ( CLEAR ?auto_65168 ) ( ON ?auto_65169 ?auto_65170 ) ( CLEAR ?auto_65169 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_65172 ?auto_65173 ?auto_65171 ?auto_65170 )
      ( MAKE-5PILE ?auto_65167 ?auto_65168 ?auto_65169 ?auto_65170 ?auto_65171 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_65174 - BLOCK
      ?auto_65175 - BLOCK
      ?auto_65176 - BLOCK
      ?auto_65177 - BLOCK
      ?auto_65178 - BLOCK
    )
    :vars
    (
      ?auto_65179 - BLOCK
      ?auto_65180 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_65174 ) ( not ( = ?auto_65174 ?auto_65175 ) ) ( not ( = ?auto_65174 ?auto_65176 ) ) ( not ( = ?auto_65174 ?auto_65177 ) ) ( not ( = ?auto_65174 ?auto_65178 ) ) ( not ( = ?auto_65175 ?auto_65176 ) ) ( not ( = ?auto_65175 ?auto_65177 ) ) ( not ( = ?auto_65175 ?auto_65178 ) ) ( not ( = ?auto_65176 ?auto_65177 ) ) ( not ( = ?auto_65176 ?auto_65178 ) ) ( not ( = ?auto_65177 ?auto_65178 ) ) ( ON ?auto_65178 ?auto_65179 ) ( not ( = ?auto_65174 ?auto_65179 ) ) ( not ( = ?auto_65175 ?auto_65179 ) ) ( not ( = ?auto_65176 ?auto_65179 ) ) ( not ( = ?auto_65177 ?auto_65179 ) ) ( not ( = ?auto_65178 ?auto_65179 ) ) ( ON ?auto_65177 ?auto_65178 ) ( ON-TABLE ?auto_65180 ) ( ON ?auto_65179 ?auto_65180 ) ( not ( = ?auto_65180 ?auto_65179 ) ) ( not ( = ?auto_65180 ?auto_65178 ) ) ( not ( = ?auto_65180 ?auto_65177 ) ) ( not ( = ?auto_65174 ?auto_65180 ) ) ( not ( = ?auto_65175 ?auto_65180 ) ) ( not ( = ?auto_65176 ?auto_65180 ) ) ( ON ?auto_65176 ?auto_65177 ) ( CLEAR ?auto_65176 ) ( HOLDING ?auto_65175 ) ( CLEAR ?auto_65174 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_65174 ?auto_65175 )
      ( MAKE-5PILE ?auto_65174 ?auto_65175 ?auto_65176 ?auto_65177 ?auto_65178 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_65181 - BLOCK
      ?auto_65182 - BLOCK
      ?auto_65183 - BLOCK
      ?auto_65184 - BLOCK
      ?auto_65185 - BLOCK
    )
    :vars
    (
      ?auto_65186 - BLOCK
      ?auto_65187 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_65181 ) ( not ( = ?auto_65181 ?auto_65182 ) ) ( not ( = ?auto_65181 ?auto_65183 ) ) ( not ( = ?auto_65181 ?auto_65184 ) ) ( not ( = ?auto_65181 ?auto_65185 ) ) ( not ( = ?auto_65182 ?auto_65183 ) ) ( not ( = ?auto_65182 ?auto_65184 ) ) ( not ( = ?auto_65182 ?auto_65185 ) ) ( not ( = ?auto_65183 ?auto_65184 ) ) ( not ( = ?auto_65183 ?auto_65185 ) ) ( not ( = ?auto_65184 ?auto_65185 ) ) ( ON ?auto_65185 ?auto_65186 ) ( not ( = ?auto_65181 ?auto_65186 ) ) ( not ( = ?auto_65182 ?auto_65186 ) ) ( not ( = ?auto_65183 ?auto_65186 ) ) ( not ( = ?auto_65184 ?auto_65186 ) ) ( not ( = ?auto_65185 ?auto_65186 ) ) ( ON ?auto_65184 ?auto_65185 ) ( ON-TABLE ?auto_65187 ) ( ON ?auto_65186 ?auto_65187 ) ( not ( = ?auto_65187 ?auto_65186 ) ) ( not ( = ?auto_65187 ?auto_65185 ) ) ( not ( = ?auto_65187 ?auto_65184 ) ) ( not ( = ?auto_65181 ?auto_65187 ) ) ( not ( = ?auto_65182 ?auto_65187 ) ) ( not ( = ?auto_65183 ?auto_65187 ) ) ( ON ?auto_65183 ?auto_65184 ) ( CLEAR ?auto_65181 ) ( ON ?auto_65182 ?auto_65183 ) ( CLEAR ?auto_65182 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_65187 ?auto_65186 ?auto_65185 ?auto_65184 ?auto_65183 )
      ( MAKE-5PILE ?auto_65181 ?auto_65182 ?auto_65183 ?auto_65184 ?auto_65185 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_65188 - BLOCK
      ?auto_65189 - BLOCK
      ?auto_65190 - BLOCK
      ?auto_65191 - BLOCK
      ?auto_65192 - BLOCK
    )
    :vars
    (
      ?auto_65193 - BLOCK
      ?auto_65194 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65188 ?auto_65189 ) ) ( not ( = ?auto_65188 ?auto_65190 ) ) ( not ( = ?auto_65188 ?auto_65191 ) ) ( not ( = ?auto_65188 ?auto_65192 ) ) ( not ( = ?auto_65189 ?auto_65190 ) ) ( not ( = ?auto_65189 ?auto_65191 ) ) ( not ( = ?auto_65189 ?auto_65192 ) ) ( not ( = ?auto_65190 ?auto_65191 ) ) ( not ( = ?auto_65190 ?auto_65192 ) ) ( not ( = ?auto_65191 ?auto_65192 ) ) ( ON ?auto_65192 ?auto_65193 ) ( not ( = ?auto_65188 ?auto_65193 ) ) ( not ( = ?auto_65189 ?auto_65193 ) ) ( not ( = ?auto_65190 ?auto_65193 ) ) ( not ( = ?auto_65191 ?auto_65193 ) ) ( not ( = ?auto_65192 ?auto_65193 ) ) ( ON ?auto_65191 ?auto_65192 ) ( ON-TABLE ?auto_65194 ) ( ON ?auto_65193 ?auto_65194 ) ( not ( = ?auto_65194 ?auto_65193 ) ) ( not ( = ?auto_65194 ?auto_65192 ) ) ( not ( = ?auto_65194 ?auto_65191 ) ) ( not ( = ?auto_65188 ?auto_65194 ) ) ( not ( = ?auto_65189 ?auto_65194 ) ) ( not ( = ?auto_65190 ?auto_65194 ) ) ( ON ?auto_65190 ?auto_65191 ) ( ON ?auto_65189 ?auto_65190 ) ( CLEAR ?auto_65189 ) ( HOLDING ?auto_65188 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_65188 )
      ( MAKE-5PILE ?auto_65188 ?auto_65189 ?auto_65190 ?auto_65191 ?auto_65192 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_65195 - BLOCK
      ?auto_65196 - BLOCK
      ?auto_65197 - BLOCK
      ?auto_65198 - BLOCK
      ?auto_65199 - BLOCK
    )
    :vars
    (
      ?auto_65200 - BLOCK
      ?auto_65201 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65195 ?auto_65196 ) ) ( not ( = ?auto_65195 ?auto_65197 ) ) ( not ( = ?auto_65195 ?auto_65198 ) ) ( not ( = ?auto_65195 ?auto_65199 ) ) ( not ( = ?auto_65196 ?auto_65197 ) ) ( not ( = ?auto_65196 ?auto_65198 ) ) ( not ( = ?auto_65196 ?auto_65199 ) ) ( not ( = ?auto_65197 ?auto_65198 ) ) ( not ( = ?auto_65197 ?auto_65199 ) ) ( not ( = ?auto_65198 ?auto_65199 ) ) ( ON ?auto_65199 ?auto_65200 ) ( not ( = ?auto_65195 ?auto_65200 ) ) ( not ( = ?auto_65196 ?auto_65200 ) ) ( not ( = ?auto_65197 ?auto_65200 ) ) ( not ( = ?auto_65198 ?auto_65200 ) ) ( not ( = ?auto_65199 ?auto_65200 ) ) ( ON ?auto_65198 ?auto_65199 ) ( ON-TABLE ?auto_65201 ) ( ON ?auto_65200 ?auto_65201 ) ( not ( = ?auto_65201 ?auto_65200 ) ) ( not ( = ?auto_65201 ?auto_65199 ) ) ( not ( = ?auto_65201 ?auto_65198 ) ) ( not ( = ?auto_65195 ?auto_65201 ) ) ( not ( = ?auto_65196 ?auto_65201 ) ) ( not ( = ?auto_65197 ?auto_65201 ) ) ( ON ?auto_65197 ?auto_65198 ) ( ON ?auto_65196 ?auto_65197 ) ( ON ?auto_65195 ?auto_65196 ) ( CLEAR ?auto_65195 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_65201 ?auto_65200 ?auto_65199 ?auto_65198 ?auto_65197 ?auto_65196 )
      ( MAKE-5PILE ?auto_65195 ?auto_65196 ?auto_65197 ?auto_65198 ?auto_65199 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_65203 - BLOCK
    )
    :vars
    (
      ?auto_65204 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65204 ?auto_65203 ) ( CLEAR ?auto_65204 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_65203 ) ( not ( = ?auto_65203 ?auto_65204 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_65204 ?auto_65203 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_65205 - BLOCK
    )
    :vars
    (
      ?auto_65206 - BLOCK
      ?auto_65207 - BLOCK
      ?auto_65208 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65206 ?auto_65205 ) ( CLEAR ?auto_65206 ) ( ON-TABLE ?auto_65205 ) ( not ( = ?auto_65205 ?auto_65206 ) ) ( HOLDING ?auto_65207 ) ( CLEAR ?auto_65208 ) ( not ( = ?auto_65205 ?auto_65207 ) ) ( not ( = ?auto_65205 ?auto_65208 ) ) ( not ( = ?auto_65206 ?auto_65207 ) ) ( not ( = ?auto_65206 ?auto_65208 ) ) ( not ( = ?auto_65207 ?auto_65208 ) ) )
    :subtasks
    ( ( !STACK ?auto_65207 ?auto_65208 )
      ( MAKE-1PILE ?auto_65205 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_65209 - BLOCK
    )
    :vars
    (
      ?auto_65210 - BLOCK
      ?auto_65212 - BLOCK
      ?auto_65211 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65210 ?auto_65209 ) ( ON-TABLE ?auto_65209 ) ( not ( = ?auto_65209 ?auto_65210 ) ) ( CLEAR ?auto_65212 ) ( not ( = ?auto_65209 ?auto_65211 ) ) ( not ( = ?auto_65209 ?auto_65212 ) ) ( not ( = ?auto_65210 ?auto_65211 ) ) ( not ( = ?auto_65210 ?auto_65212 ) ) ( not ( = ?auto_65211 ?auto_65212 ) ) ( ON ?auto_65211 ?auto_65210 ) ( CLEAR ?auto_65211 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_65209 ?auto_65210 )
      ( MAKE-1PILE ?auto_65209 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_65213 - BLOCK
    )
    :vars
    (
      ?auto_65215 - BLOCK
      ?auto_65214 - BLOCK
      ?auto_65216 - BLOCK
      ?auto_65219 - BLOCK
      ?auto_65218 - BLOCK
      ?auto_65217 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65215 ?auto_65213 ) ( ON-TABLE ?auto_65213 ) ( not ( = ?auto_65213 ?auto_65215 ) ) ( not ( = ?auto_65213 ?auto_65214 ) ) ( not ( = ?auto_65213 ?auto_65216 ) ) ( not ( = ?auto_65215 ?auto_65214 ) ) ( not ( = ?auto_65215 ?auto_65216 ) ) ( not ( = ?auto_65214 ?auto_65216 ) ) ( ON ?auto_65214 ?auto_65215 ) ( CLEAR ?auto_65214 ) ( HOLDING ?auto_65216 ) ( CLEAR ?auto_65219 ) ( ON-TABLE ?auto_65218 ) ( ON ?auto_65217 ?auto_65218 ) ( ON ?auto_65219 ?auto_65217 ) ( not ( = ?auto_65218 ?auto_65217 ) ) ( not ( = ?auto_65218 ?auto_65219 ) ) ( not ( = ?auto_65218 ?auto_65216 ) ) ( not ( = ?auto_65217 ?auto_65219 ) ) ( not ( = ?auto_65217 ?auto_65216 ) ) ( not ( = ?auto_65219 ?auto_65216 ) ) ( not ( = ?auto_65213 ?auto_65219 ) ) ( not ( = ?auto_65213 ?auto_65218 ) ) ( not ( = ?auto_65213 ?auto_65217 ) ) ( not ( = ?auto_65215 ?auto_65219 ) ) ( not ( = ?auto_65215 ?auto_65218 ) ) ( not ( = ?auto_65215 ?auto_65217 ) ) ( not ( = ?auto_65214 ?auto_65219 ) ) ( not ( = ?auto_65214 ?auto_65218 ) ) ( not ( = ?auto_65214 ?auto_65217 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_65218 ?auto_65217 ?auto_65219 ?auto_65216 )
      ( MAKE-1PILE ?auto_65213 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_65220 - BLOCK
    )
    :vars
    (
      ?auto_65226 - BLOCK
      ?auto_65222 - BLOCK
      ?auto_65224 - BLOCK
      ?auto_65221 - BLOCK
      ?auto_65225 - BLOCK
      ?auto_65223 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65226 ?auto_65220 ) ( ON-TABLE ?auto_65220 ) ( not ( = ?auto_65220 ?auto_65226 ) ) ( not ( = ?auto_65220 ?auto_65222 ) ) ( not ( = ?auto_65220 ?auto_65224 ) ) ( not ( = ?auto_65226 ?auto_65222 ) ) ( not ( = ?auto_65226 ?auto_65224 ) ) ( not ( = ?auto_65222 ?auto_65224 ) ) ( ON ?auto_65222 ?auto_65226 ) ( CLEAR ?auto_65221 ) ( ON-TABLE ?auto_65225 ) ( ON ?auto_65223 ?auto_65225 ) ( ON ?auto_65221 ?auto_65223 ) ( not ( = ?auto_65225 ?auto_65223 ) ) ( not ( = ?auto_65225 ?auto_65221 ) ) ( not ( = ?auto_65225 ?auto_65224 ) ) ( not ( = ?auto_65223 ?auto_65221 ) ) ( not ( = ?auto_65223 ?auto_65224 ) ) ( not ( = ?auto_65221 ?auto_65224 ) ) ( not ( = ?auto_65220 ?auto_65221 ) ) ( not ( = ?auto_65220 ?auto_65225 ) ) ( not ( = ?auto_65220 ?auto_65223 ) ) ( not ( = ?auto_65226 ?auto_65221 ) ) ( not ( = ?auto_65226 ?auto_65225 ) ) ( not ( = ?auto_65226 ?auto_65223 ) ) ( not ( = ?auto_65222 ?auto_65221 ) ) ( not ( = ?auto_65222 ?auto_65225 ) ) ( not ( = ?auto_65222 ?auto_65223 ) ) ( ON ?auto_65224 ?auto_65222 ) ( CLEAR ?auto_65224 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_65220 ?auto_65226 ?auto_65222 )
      ( MAKE-1PILE ?auto_65220 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_65227 - BLOCK
    )
    :vars
    (
      ?auto_65231 - BLOCK
      ?auto_65233 - BLOCK
      ?auto_65228 - BLOCK
      ?auto_65229 - BLOCK
      ?auto_65230 - BLOCK
      ?auto_65232 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65231 ?auto_65227 ) ( ON-TABLE ?auto_65227 ) ( not ( = ?auto_65227 ?auto_65231 ) ) ( not ( = ?auto_65227 ?auto_65233 ) ) ( not ( = ?auto_65227 ?auto_65228 ) ) ( not ( = ?auto_65231 ?auto_65233 ) ) ( not ( = ?auto_65231 ?auto_65228 ) ) ( not ( = ?auto_65233 ?auto_65228 ) ) ( ON ?auto_65233 ?auto_65231 ) ( ON-TABLE ?auto_65229 ) ( ON ?auto_65230 ?auto_65229 ) ( not ( = ?auto_65229 ?auto_65230 ) ) ( not ( = ?auto_65229 ?auto_65232 ) ) ( not ( = ?auto_65229 ?auto_65228 ) ) ( not ( = ?auto_65230 ?auto_65232 ) ) ( not ( = ?auto_65230 ?auto_65228 ) ) ( not ( = ?auto_65232 ?auto_65228 ) ) ( not ( = ?auto_65227 ?auto_65232 ) ) ( not ( = ?auto_65227 ?auto_65229 ) ) ( not ( = ?auto_65227 ?auto_65230 ) ) ( not ( = ?auto_65231 ?auto_65232 ) ) ( not ( = ?auto_65231 ?auto_65229 ) ) ( not ( = ?auto_65231 ?auto_65230 ) ) ( not ( = ?auto_65233 ?auto_65232 ) ) ( not ( = ?auto_65233 ?auto_65229 ) ) ( not ( = ?auto_65233 ?auto_65230 ) ) ( ON ?auto_65228 ?auto_65233 ) ( CLEAR ?auto_65228 ) ( HOLDING ?auto_65232 ) ( CLEAR ?auto_65230 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_65229 ?auto_65230 ?auto_65232 )
      ( MAKE-1PILE ?auto_65227 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_65234 - BLOCK
    )
    :vars
    (
      ?auto_65237 - BLOCK
      ?auto_65235 - BLOCK
      ?auto_65239 - BLOCK
      ?auto_65240 - BLOCK
      ?auto_65238 - BLOCK
      ?auto_65236 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65237 ?auto_65234 ) ( ON-TABLE ?auto_65234 ) ( not ( = ?auto_65234 ?auto_65237 ) ) ( not ( = ?auto_65234 ?auto_65235 ) ) ( not ( = ?auto_65234 ?auto_65239 ) ) ( not ( = ?auto_65237 ?auto_65235 ) ) ( not ( = ?auto_65237 ?auto_65239 ) ) ( not ( = ?auto_65235 ?auto_65239 ) ) ( ON ?auto_65235 ?auto_65237 ) ( ON-TABLE ?auto_65240 ) ( ON ?auto_65238 ?auto_65240 ) ( not ( = ?auto_65240 ?auto_65238 ) ) ( not ( = ?auto_65240 ?auto_65236 ) ) ( not ( = ?auto_65240 ?auto_65239 ) ) ( not ( = ?auto_65238 ?auto_65236 ) ) ( not ( = ?auto_65238 ?auto_65239 ) ) ( not ( = ?auto_65236 ?auto_65239 ) ) ( not ( = ?auto_65234 ?auto_65236 ) ) ( not ( = ?auto_65234 ?auto_65240 ) ) ( not ( = ?auto_65234 ?auto_65238 ) ) ( not ( = ?auto_65237 ?auto_65236 ) ) ( not ( = ?auto_65237 ?auto_65240 ) ) ( not ( = ?auto_65237 ?auto_65238 ) ) ( not ( = ?auto_65235 ?auto_65236 ) ) ( not ( = ?auto_65235 ?auto_65240 ) ) ( not ( = ?auto_65235 ?auto_65238 ) ) ( ON ?auto_65239 ?auto_65235 ) ( CLEAR ?auto_65238 ) ( ON ?auto_65236 ?auto_65239 ) ( CLEAR ?auto_65236 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_65234 ?auto_65237 ?auto_65235 ?auto_65239 )
      ( MAKE-1PILE ?auto_65234 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_65241 - BLOCK
    )
    :vars
    (
      ?auto_65245 - BLOCK
      ?auto_65246 - BLOCK
      ?auto_65247 - BLOCK
      ?auto_65242 - BLOCK
      ?auto_65244 - BLOCK
      ?auto_65243 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65245 ?auto_65241 ) ( ON-TABLE ?auto_65241 ) ( not ( = ?auto_65241 ?auto_65245 ) ) ( not ( = ?auto_65241 ?auto_65246 ) ) ( not ( = ?auto_65241 ?auto_65247 ) ) ( not ( = ?auto_65245 ?auto_65246 ) ) ( not ( = ?auto_65245 ?auto_65247 ) ) ( not ( = ?auto_65246 ?auto_65247 ) ) ( ON ?auto_65246 ?auto_65245 ) ( ON-TABLE ?auto_65242 ) ( not ( = ?auto_65242 ?auto_65244 ) ) ( not ( = ?auto_65242 ?auto_65243 ) ) ( not ( = ?auto_65242 ?auto_65247 ) ) ( not ( = ?auto_65244 ?auto_65243 ) ) ( not ( = ?auto_65244 ?auto_65247 ) ) ( not ( = ?auto_65243 ?auto_65247 ) ) ( not ( = ?auto_65241 ?auto_65243 ) ) ( not ( = ?auto_65241 ?auto_65242 ) ) ( not ( = ?auto_65241 ?auto_65244 ) ) ( not ( = ?auto_65245 ?auto_65243 ) ) ( not ( = ?auto_65245 ?auto_65242 ) ) ( not ( = ?auto_65245 ?auto_65244 ) ) ( not ( = ?auto_65246 ?auto_65243 ) ) ( not ( = ?auto_65246 ?auto_65242 ) ) ( not ( = ?auto_65246 ?auto_65244 ) ) ( ON ?auto_65247 ?auto_65246 ) ( ON ?auto_65243 ?auto_65247 ) ( CLEAR ?auto_65243 ) ( HOLDING ?auto_65244 ) ( CLEAR ?auto_65242 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_65242 ?auto_65244 )
      ( MAKE-1PILE ?auto_65241 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_66094 - BLOCK
    )
    :vars
    (
      ?auto_66095 - BLOCK
      ?auto_66097 - BLOCK
      ?auto_66099 - BLOCK
      ?auto_66096 - BLOCK
      ?auto_66098 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66095 ?auto_66094 ) ( ON-TABLE ?auto_66094 ) ( not ( = ?auto_66094 ?auto_66095 ) ) ( not ( = ?auto_66094 ?auto_66097 ) ) ( not ( = ?auto_66094 ?auto_66099 ) ) ( not ( = ?auto_66095 ?auto_66097 ) ) ( not ( = ?auto_66095 ?auto_66099 ) ) ( not ( = ?auto_66097 ?auto_66099 ) ) ( ON ?auto_66097 ?auto_66095 ) ( not ( = ?auto_66096 ?auto_66098 ) ) ( not ( = ?auto_66096 ?auto_66099 ) ) ( not ( = ?auto_66098 ?auto_66099 ) ) ( not ( = ?auto_66094 ?auto_66098 ) ) ( not ( = ?auto_66094 ?auto_66096 ) ) ( not ( = ?auto_66095 ?auto_66098 ) ) ( not ( = ?auto_66095 ?auto_66096 ) ) ( not ( = ?auto_66097 ?auto_66098 ) ) ( not ( = ?auto_66097 ?auto_66096 ) ) ( ON ?auto_66099 ?auto_66097 ) ( ON ?auto_66098 ?auto_66099 ) ( ON ?auto_66096 ?auto_66098 ) ( CLEAR ?auto_66096 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_66094 ?auto_66095 ?auto_66097 ?auto_66099 ?auto_66098 )
      ( MAKE-1PILE ?auto_66094 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_65255 - BLOCK
    )
    :vars
    (
      ?auto_65258 - BLOCK
      ?auto_65257 - BLOCK
      ?auto_65261 - BLOCK
      ?auto_65256 - BLOCK
      ?auto_65260 - BLOCK
      ?auto_65259 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65258 ?auto_65255 ) ( ON-TABLE ?auto_65255 ) ( not ( = ?auto_65255 ?auto_65258 ) ) ( not ( = ?auto_65255 ?auto_65257 ) ) ( not ( = ?auto_65255 ?auto_65261 ) ) ( not ( = ?auto_65258 ?auto_65257 ) ) ( not ( = ?auto_65258 ?auto_65261 ) ) ( not ( = ?auto_65257 ?auto_65261 ) ) ( ON ?auto_65257 ?auto_65258 ) ( not ( = ?auto_65256 ?auto_65260 ) ) ( not ( = ?auto_65256 ?auto_65259 ) ) ( not ( = ?auto_65256 ?auto_65261 ) ) ( not ( = ?auto_65260 ?auto_65259 ) ) ( not ( = ?auto_65260 ?auto_65261 ) ) ( not ( = ?auto_65259 ?auto_65261 ) ) ( not ( = ?auto_65255 ?auto_65259 ) ) ( not ( = ?auto_65255 ?auto_65256 ) ) ( not ( = ?auto_65255 ?auto_65260 ) ) ( not ( = ?auto_65258 ?auto_65259 ) ) ( not ( = ?auto_65258 ?auto_65256 ) ) ( not ( = ?auto_65258 ?auto_65260 ) ) ( not ( = ?auto_65257 ?auto_65259 ) ) ( not ( = ?auto_65257 ?auto_65256 ) ) ( not ( = ?auto_65257 ?auto_65260 ) ) ( ON ?auto_65261 ?auto_65257 ) ( ON ?auto_65259 ?auto_65261 ) ( ON ?auto_65260 ?auto_65259 ) ( CLEAR ?auto_65260 ) ( HOLDING ?auto_65256 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_65256 )
      ( MAKE-1PILE ?auto_65255 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_65262 - BLOCK
    )
    :vars
    (
      ?auto_65263 - BLOCK
      ?auto_65266 - BLOCK
      ?auto_65264 - BLOCK
      ?auto_65268 - BLOCK
      ?auto_65265 - BLOCK
      ?auto_65267 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65263 ?auto_65262 ) ( ON-TABLE ?auto_65262 ) ( not ( = ?auto_65262 ?auto_65263 ) ) ( not ( = ?auto_65262 ?auto_65266 ) ) ( not ( = ?auto_65262 ?auto_65264 ) ) ( not ( = ?auto_65263 ?auto_65266 ) ) ( not ( = ?auto_65263 ?auto_65264 ) ) ( not ( = ?auto_65266 ?auto_65264 ) ) ( ON ?auto_65266 ?auto_65263 ) ( not ( = ?auto_65268 ?auto_65265 ) ) ( not ( = ?auto_65268 ?auto_65267 ) ) ( not ( = ?auto_65268 ?auto_65264 ) ) ( not ( = ?auto_65265 ?auto_65267 ) ) ( not ( = ?auto_65265 ?auto_65264 ) ) ( not ( = ?auto_65267 ?auto_65264 ) ) ( not ( = ?auto_65262 ?auto_65267 ) ) ( not ( = ?auto_65262 ?auto_65268 ) ) ( not ( = ?auto_65262 ?auto_65265 ) ) ( not ( = ?auto_65263 ?auto_65267 ) ) ( not ( = ?auto_65263 ?auto_65268 ) ) ( not ( = ?auto_65263 ?auto_65265 ) ) ( not ( = ?auto_65266 ?auto_65267 ) ) ( not ( = ?auto_65266 ?auto_65268 ) ) ( not ( = ?auto_65266 ?auto_65265 ) ) ( ON ?auto_65264 ?auto_65266 ) ( ON ?auto_65267 ?auto_65264 ) ( ON ?auto_65265 ?auto_65267 ) ( ON ?auto_65268 ?auto_65265 ) ( CLEAR ?auto_65268 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_65262 ?auto_65263 ?auto_65266 ?auto_65264 ?auto_65267 ?auto_65265 )
      ( MAKE-1PILE ?auto_65262 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_65275 - BLOCK
      ?auto_65276 - BLOCK
      ?auto_65277 - BLOCK
      ?auto_65278 - BLOCK
      ?auto_65279 - BLOCK
      ?auto_65280 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_65280 ) ( CLEAR ?auto_65279 ) ( ON-TABLE ?auto_65275 ) ( ON ?auto_65276 ?auto_65275 ) ( ON ?auto_65277 ?auto_65276 ) ( ON ?auto_65278 ?auto_65277 ) ( ON ?auto_65279 ?auto_65278 ) ( not ( = ?auto_65275 ?auto_65276 ) ) ( not ( = ?auto_65275 ?auto_65277 ) ) ( not ( = ?auto_65275 ?auto_65278 ) ) ( not ( = ?auto_65275 ?auto_65279 ) ) ( not ( = ?auto_65275 ?auto_65280 ) ) ( not ( = ?auto_65276 ?auto_65277 ) ) ( not ( = ?auto_65276 ?auto_65278 ) ) ( not ( = ?auto_65276 ?auto_65279 ) ) ( not ( = ?auto_65276 ?auto_65280 ) ) ( not ( = ?auto_65277 ?auto_65278 ) ) ( not ( = ?auto_65277 ?auto_65279 ) ) ( not ( = ?auto_65277 ?auto_65280 ) ) ( not ( = ?auto_65278 ?auto_65279 ) ) ( not ( = ?auto_65278 ?auto_65280 ) ) ( not ( = ?auto_65279 ?auto_65280 ) ) )
    :subtasks
    ( ( !STACK ?auto_65280 ?auto_65279 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_65281 - BLOCK
      ?auto_65282 - BLOCK
      ?auto_65283 - BLOCK
      ?auto_65284 - BLOCK
      ?auto_65285 - BLOCK
      ?auto_65286 - BLOCK
    )
    :vars
    (
      ?auto_65287 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_65285 ) ( ON-TABLE ?auto_65281 ) ( ON ?auto_65282 ?auto_65281 ) ( ON ?auto_65283 ?auto_65282 ) ( ON ?auto_65284 ?auto_65283 ) ( ON ?auto_65285 ?auto_65284 ) ( not ( = ?auto_65281 ?auto_65282 ) ) ( not ( = ?auto_65281 ?auto_65283 ) ) ( not ( = ?auto_65281 ?auto_65284 ) ) ( not ( = ?auto_65281 ?auto_65285 ) ) ( not ( = ?auto_65281 ?auto_65286 ) ) ( not ( = ?auto_65282 ?auto_65283 ) ) ( not ( = ?auto_65282 ?auto_65284 ) ) ( not ( = ?auto_65282 ?auto_65285 ) ) ( not ( = ?auto_65282 ?auto_65286 ) ) ( not ( = ?auto_65283 ?auto_65284 ) ) ( not ( = ?auto_65283 ?auto_65285 ) ) ( not ( = ?auto_65283 ?auto_65286 ) ) ( not ( = ?auto_65284 ?auto_65285 ) ) ( not ( = ?auto_65284 ?auto_65286 ) ) ( not ( = ?auto_65285 ?auto_65286 ) ) ( ON ?auto_65286 ?auto_65287 ) ( CLEAR ?auto_65286 ) ( HAND-EMPTY ) ( not ( = ?auto_65281 ?auto_65287 ) ) ( not ( = ?auto_65282 ?auto_65287 ) ) ( not ( = ?auto_65283 ?auto_65287 ) ) ( not ( = ?auto_65284 ?auto_65287 ) ) ( not ( = ?auto_65285 ?auto_65287 ) ) ( not ( = ?auto_65286 ?auto_65287 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_65286 ?auto_65287 )
      ( MAKE-6PILE ?auto_65281 ?auto_65282 ?auto_65283 ?auto_65284 ?auto_65285 ?auto_65286 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_65288 - BLOCK
      ?auto_65289 - BLOCK
      ?auto_65290 - BLOCK
      ?auto_65291 - BLOCK
      ?auto_65292 - BLOCK
      ?auto_65293 - BLOCK
    )
    :vars
    (
      ?auto_65294 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_65288 ) ( ON ?auto_65289 ?auto_65288 ) ( ON ?auto_65290 ?auto_65289 ) ( ON ?auto_65291 ?auto_65290 ) ( not ( = ?auto_65288 ?auto_65289 ) ) ( not ( = ?auto_65288 ?auto_65290 ) ) ( not ( = ?auto_65288 ?auto_65291 ) ) ( not ( = ?auto_65288 ?auto_65292 ) ) ( not ( = ?auto_65288 ?auto_65293 ) ) ( not ( = ?auto_65289 ?auto_65290 ) ) ( not ( = ?auto_65289 ?auto_65291 ) ) ( not ( = ?auto_65289 ?auto_65292 ) ) ( not ( = ?auto_65289 ?auto_65293 ) ) ( not ( = ?auto_65290 ?auto_65291 ) ) ( not ( = ?auto_65290 ?auto_65292 ) ) ( not ( = ?auto_65290 ?auto_65293 ) ) ( not ( = ?auto_65291 ?auto_65292 ) ) ( not ( = ?auto_65291 ?auto_65293 ) ) ( not ( = ?auto_65292 ?auto_65293 ) ) ( ON ?auto_65293 ?auto_65294 ) ( CLEAR ?auto_65293 ) ( not ( = ?auto_65288 ?auto_65294 ) ) ( not ( = ?auto_65289 ?auto_65294 ) ) ( not ( = ?auto_65290 ?auto_65294 ) ) ( not ( = ?auto_65291 ?auto_65294 ) ) ( not ( = ?auto_65292 ?auto_65294 ) ) ( not ( = ?auto_65293 ?auto_65294 ) ) ( HOLDING ?auto_65292 ) ( CLEAR ?auto_65291 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_65288 ?auto_65289 ?auto_65290 ?auto_65291 ?auto_65292 )
      ( MAKE-6PILE ?auto_65288 ?auto_65289 ?auto_65290 ?auto_65291 ?auto_65292 ?auto_65293 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_65295 - BLOCK
      ?auto_65296 - BLOCK
      ?auto_65297 - BLOCK
      ?auto_65298 - BLOCK
      ?auto_65299 - BLOCK
      ?auto_65300 - BLOCK
    )
    :vars
    (
      ?auto_65301 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_65295 ) ( ON ?auto_65296 ?auto_65295 ) ( ON ?auto_65297 ?auto_65296 ) ( ON ?auto_65298 ?auto_65297 ) ( not ( = ?auto_65295 ?auto_65296 ) ) ( not ( = ?auto_65295 ?auto_65297 ) ) ( not ( = ?auto_65295 ?auto_65298 ) ) ( not ( = ?auto_65295 ?auto_65299 ) ) ( not ( = ?auto_65295 ?auto_65300 ) ) ( not ( = ?auto_65296 ?auto_65297 ) ) ( not ( = ?auto_65296 ?auto_65298 ) ) ( not ( = ?auto_65296 ?auto_65299 ) ) ( not ( = ?auto_65296 ?auto_65300 ) ) ( not ( = ?auto_65297 ?auto_65298 ) ) ( not ( = ?auto_65297 ?auto_65299 ) ) ( not ( = ?auto_65297 ?auto_65300 ) ) ( not ( = ?auto_65298 ?auto_65299 ) ) ( not ( = ?auto_65298 ?auto_65300 ) ) ( not ( = ?auto_65299 ?auto_65300 ) ) ( ON ?auto_65300 ?auto_65301 ) ( not ( = ?auto_65295 ?auto_65301 ) ) ( not ( = ?auto_65296 ?auto_65301 ) ) ( not ( = ?auto_65297 ?auto_65301 ) ) ( not ( = ?auto_65298 ?auto_65301 ) ) ( not ( = ?auto_65299 ?auto_65301 ) ) ( not ( = ?auto_65300 ?auto_65301 ) ) ( CLEAR ?auto_65298 ) ( ON ?auto_65299 ?auto_65300 ) ( CLEAR ?auto_65299 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_65301 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_65301 ?auto_65300 )
      ( MAKE-6PILE ?auto_65295 ?auto_65296 ?auto_65297 ?auto_65298 ?auto_65299 ?auto_65300 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_65302 - BLOCK
      ?auto_65303 - BLOCK
      ?auto_65304 - BLOCK
      ?auto_65305 - BLOCK
      ?auto_65306 - BLOCK
      ?auto_65307 - BLOCK
    )
    :vars
    (
      ?auto_65308 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_65302 ) ( ON ?auto_65303 ?auto_65302 ) ( ON ?auto_65304 ?auto_65303 ) ( not ( = ?auto_65302 ?auto_65303 ) ) ( not ( = ?auto_65302 ?auto_65304 ) ) ( not ( = ?auto_65302 ?auto_65305 ) ) ( not ( = ?auto_65302 ?auto_65306 ) ) ( not ( = ?auto_65302 ?auto_65307 ) ) ( not ( = ?auto_65303 ?auto_65304 ) ) ( not ( = ?auto_65303 ?auto_65305 ) ) ( not ( = ?auto_65303 ?auto_65306 ) ) ( not ( = ?auto_65303 ?auto_65307 ) ) ( not ( = ?auto_65304 ?auto_65305 ) ) ( not ( = ?auto_65304 ?auto_65306 ) ) ( not ( = ?auto_65304 ?auto_65307 ) ) ( not ( = ?auto_65305 ?auto_65306 ) ) ( not ( = ?auto_65305 ?auto_65307 ) ) ( not ( = ?auto_65306 ?auto_65307 ) ) ( ON ?auto_65307 ?auto_65308 ) ( not ( = ?auto_65302 ?auto_65308 ) ) ( not ( = ?auto_65303 ?auto_65308 ) ) ( not ( = ?auto_65304 ?auto_65308 ) ) ( not ( = ?auto_65305 ?auto_65308 ) ) ( not ( = ?auto_65306 ?auto_65308 ) ) ( not ( = ?auto_65307 ?auto_65308 ) ) ( ON ?auto_65306 ?auto_65307 ) ( CLEAR ?auto_65306 ) ( ON-TABLE ?auto_65308 ) ( HOLDING ?auto_65305 ) ( CLEAR ?auto_65304 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_65302 ?auto_65303 ?auto_65304 ?auto_65305 )
      ( MAKE-6PILE ?auto_65302 ?auto_65303 ?auto_65304 ?auto_65305 ?auto_65306 ?auto_65307 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_65309 - BLOCK
      ?auto_65310 - BLOCK
      ?auto_65311 - BLOCK
      ?auto_65312 - BLOCK
      ?auto_65313 - BLOCK
      ?auto_65314 - BLOCK
    )
    :vars
    (
      ?auto_65315 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_65309 ) ( ON ?auto_65310 ?auto_65309 ) ( ON ?auto_65311 ?auto_65310 ) ( not ( = ?auto_65309 ?auto_65310 ) ) ( not ( = ?auto_65309 ?auto_65311 ) ) ( not ( = ?auto_65309 ?auto_65312 ) ) ( not ( = ?auto_65309 ?auto_65313 ) ) ( not ( = ?auto_65309 ?auto_65314 ) ) ( not ( = ?auto_65310 ?auto_65311 ) ) ( not ( = ?auto_65310 ?auto_65312 ) ) ( not ( = ?auto_65310 ?auto_65313 ) ) ( not ( = ?auto_65310 ?auto_65314 ) ) ( not ( = ?auto_65311 ?auto_65312 ) ) ( not ( = ?auto_65311 ?auto_65313 ) ) ( not ( = ?auto_65311 ?auto_65314 ) ) ( not ( = ?auto_65312 ?auto_65313 ) ) ( not ( = ?auto_65312 ?auto_65314 ) ) ( not ( = ?auto_65313 ?auto_65314 ) ) ( ON ?auto_65314 ?auto_65315 ) ( not ( = ?auto_65309 ?auto_65315 ) ) ( not ( = ?auto_65310 ?auto_65315 ) ) ( not ( = ?auto_65311 ?auto_65315 ) ) ( not ( = ?auto_65312 ?auto_65315 ) ) ( not ( = ?auto_65313 ?auto_65315 ) ) ( not ( = ?auto_65314 ?auto_65315 ) ) ( ON ?auto_65313 ?auto_65314 ) ( ON-TABLE ?auto_65315 ) ( CLEAR ?auto_65311 ) ( ON ?auto_65312 ?auto_65313 ) ( CLEAR ?auto_65312 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_65315 ?auto_65314 ?auto_65313 )
      ( MAKE-6PILE ?auto_65309 ?auto_65310 ?auto_65311 ?auto_65312 ?auto_65313 ?auto_65314 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_65316 - BLOCK
      ?auto_65317 - BLOCK
      ?auto_65318 - BLOCK
      ?auto_65319 - BLOCK
      ?auto_65320 - BLOCK
      ?auto_65321 - BLOCK
    )
    :vars
    (
      ?auto_65322 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_65316 ) ( ON ?auto_65317 ?auto_65316 ) ( not ( = ?auto_65316 ?auto_65317 ) ) ( not ( = ?auto_65316 ?auto_65318 ) ) ( not ( = ?auto_65316 ?auto_65319 ) ) ( not ( = ?auto_65316 ?auto_65320 ) ) ( not ( = ?auto_65316 ?auto_65321 ) ) ( not ( = ?auto_65317 ?auto_65318 ) ) ( not ( = ?auto_65317 ?auto_65319 ) ) ( not ( = ?auto_65317 ?auto_65320 ) ) ( not ( = ?auto_65317 ?auto_65321 ) ) ( not ( = ?auto_65318 ?auto_65319 ) ) ( not ( = ?auto_65318 ?auto_65320 ) ) ( not ( = ?auto_65318 ?auto_65321 ) ) ( not ( = ?auto_65319 ?auto_65320 ) ) ( not ( = ?auto_65319 ?auto_65321 ) ) ( not ( = ?auto_65320 ?auto_65321 ) ) ( ON ?auto_65321 ?auto_65322 ) ( not ( = ?auto_65316 ?auto_65322 ) ) ( not ( = ?auto_65317 ?auto_65322 ) ) ( not ( = ?auto_65318 ?auto_65322 ) ) ( not ( = ?auto_65319 ?auto_65322 ) ) ( not ( = ?auto_65320 ?auto_65322 ) ) ( not ( = ?auto_65321 ?auto_65322 ) ) ( ON ?auto_65320 ?auto_65321 ) ( ON-TABLE ?auto_65322 ) ( ON ?auto_65319 ?auto_65320 ) ( CLEAR ?auto_65319 ) ( HOLDING ?auto_65318 ) ( CLEAR ?auto_65317 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_65316 ?auto_65317 ?auto_65318 )
      ( MAKE-6PILE ?auto_65316 ?auto_65317 ?auto_65318 ?auto_65319 ?auto_65320 ?auto_65321 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_65323 - BLOCK
      ?auto_65324 - BLOCK
      ?auto_65325 - BLOCK
      ?auto_65326 - BLOCK
      ?auto_65327 - BLOCK
      ?auto_65328 - BLOCK
    )
    :vars
    (
      ?auto_65329 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_65323 ) ( ON ?auto_65324 ?auto_65323 ) ( not ( = ?auto_65323 ?auto_65324 ) ) ( not ( = ?auto_65323 ?auto_65325 ) ) ( not ( = ?auto_65323 ?auto_65326 ) ) ( not ( = ?auto_65323 ?auto_65327 ) ) ( not ( = ?auto_65323 ?auto_65328 ) ) ( not ( = ?auto_65324 ?auto_65325 ) ) ( not ( = ?auto_65324 ?auto_65326 ) ) ( not ( = ?auto_65324 ?auto_65327 ) ) ( not ( = ?auto_65324 ?auto_65328 ) ) ( not ( = ?auto_65325 ?auto_65326 ) ) ( not ( = ?auto_65325 ?auto_65327 ) ) ( not ( = ?auto_65325 ?auto_65328 ) ) ( not ( = ?auto_65326 ?auto_65327 ) ) ( not ( = ?auto_65326 ?auto_65328 ) ) ( not ( = ?auto_65327 ?auto_65328 ) ) ( ON ?auto_65328 ?auto_65329 ) ( not ( = ?auto_65323 ?auto_65329 ) ) ( not ( = ?auto_65324 ?auto_65329 ) ) ( not ( = ?auto_65325 ?auto_65329 ) ) ( not ( = ?auto_65326 ?auto_65329 ) ) ( not ( = ?auto_65327 ?auto_65329 ) ) ( not ( = ?auto_65328 ?auto_65329 ) ) ( ON ?auto_65327 ?auto_65328 ) ( ON-TABLE ?auto_65329 ) ( ON ?auto_65326 ?auto_65327 ) ( CLEAR ?auto_65324 ) ( ON ?auto_65325 ?auto_65326 ) ( CLEAR ?auto_65325 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_65329 ?auto_65328 ?auto_65327 ?auto_65326 )
      ( MAKE-6PILE ?auto_65323 ?auto_65324 ?auto_65325 ?auto_65326 ?auto_65327 ?auto_65328 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_65330 - BLOCK
      ?auto_65331 - BLOCK
      ?auto_65332 - BLOCK
      ?auto_65333 - BLOCK
      ?auto_65334 - BLOCK
      ?auto_65335 - BLOCK
    )
    :vars
    (
      ?auto_65336 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_65330 ) ( not ( = ?auto_65330 ?auto_65331 ) ) ( not ( = ?auto_65330 ?auto_65332 ) ) ( not ( = ?auto_65330 ?auto_65333 ) ) ( not ( = ?auto_65330 ?auto_65334 ) ) ( not ( = ?auto_65330 ?auto_65335 ) ) ( not ( = ?auto_65331 ?auto_65332 ) ) ( not ( = ?auto_65331 ?auto_65333 ) ) ( not ( = ?auto_65331 ?auto_65334 ) ) ( not ( = ?auto_65331 ?auto_65335 ) ) ( not ( = ?auto_65332 ?auto_65333 ) ) ( not ( = ?auto_65332 ?auto_65334 ) ) ( not ( = ?auto_65332 ?auto_65335 ) ) ( not ( = ?auto_65333 ?auto_65334 ) ) ( not ( = ?auto_65333 ?auto_65335 ) ) ( not ( = ?auto_65334 ?auto_65335 ) ) ( ON ?auto_65335 ?auto_65336 ) ( not ( = ?auto_65330 ?auto_65336 ) ) ( not ( = ?auto_65331 ?auto_65336 ) ) ( not ( = ?auto_65332 ?auto_65336 ) ) ( not ( = ?auto_65333 ?auto_65336 ) ) ( not ( = ?auto_65334 ?auto_65336 ) ) ( not ( = ?auto_65335 ?auto_65336 ) ) ( ON ?auto_65334 ?auto_65335 ) ( ON-TABLE ?auto_65336 ) ( ON ?auto_65333 ?auto_65334 ) ( ON ?auto_65332 ?auto_65333 ) ( CLEAR ?auto_65332 ) ( HOLDING ?auto_65331 ) ( CLEAR ?auto_65330 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_65330 ?auto_65331 )
      ( MAKE-6PILE ?auto_65330 ?auto_65331 ?auto_65332 ?auto_65333 ?auto_65334 ?auto_65335 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_65337 - BLOCK
      ?auto_65338 - BLOCK
      ?auto_65339 - BLOCK
      ?auto_65340 - BLOCK
      ?auto_65341 - BLOCK
      ?auto_65342 - BLOCK
    )
    :vars
    (
      ?auto_65343 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_65337 ) ( not ( = ?auto_65337 ?auto_65338 ) ) ( not ( = ?auto_65337 ?auto_65339 ) ) ( not ( = ?auto_65337 ?auto_65340 ) ) ( not ( = ?auto_65337 ?auto_65341 ) ) ( not ( = ?auto_65337 ?auto_65342 ) ) ( not ( = ?auto_65338 ?auto_65339 ) ) ( not ( = ?auto_65338 ?auto_65340 ) ) ( not ( = ?auto_65338 ?auto_65341 ) ) ( not ( = ?auto_65338 ?auto_65342 ) ) ( not ( = ?auto_65339 ?auto_65340 ) ) ( not ( = ?auto_65339 ?auto_65341 ) ) ( not ( = ?auto_65339 ?auto_65342 ) ) ( not ( = ?auto_65340 ?auto_65341 ) ) ( not ( = ?auto_65340 ?auto_65342 ) ) ( not ( = ?auto_65341 ?auto_65342 ) ) ( ON ?auto_65342 ?auto_65343 ) ( not ( = ?auto_65337 ?auto_65343 ) ) ( not ( = ?auto_65338 ?auto_65343 ) ) ( not ( = ?auto_65339 ?auto_65343 ) ) ( not ( = ?auto_65340 ?auto_65343 ) ) ( not ( = ?auto_65341 ?auto_65343 ) ) ( not ( = ?auto_65342 ?auto_65343 ) ) ( ON ?auto_65341 ?auto_65342 ) ( ON-TABLE ?auto_65343 ) ( ON ?auto_65340 ?auto_65341 ) ( ON ?auto_65339 ?auto_65340 ) ( CLEAR ?auto_65337 ) ( ON ?auto_65338 ?auto_65339 ) ( CLEAR ?auto_65338 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_65343 ?auto_65342 ?auto_65341 ?auto_65340 ?auto_65339 )
      ( MAKE-6PILE ?auto_65337 ?auto_65338 ?auto_65339 ?auto_65340 ?auto_65341 ?auto_65342 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
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
    ( and ( not ( = ?auto_65344 ?auto_65345 ) ) ( not ( = ?auto_65344 ?auto_65346 ) ) ( not ( = ?auto_65344 ?auto_65347 ) ) ( not ( = ?auto_65344 ?auto_65348 ) ) ( not ( = ?auto_65344 ?auto_65349 ) ) ( not ( = ?auto_65345 ?auto_65346 ) ) ( not ( = ?auto_65345 ?auto_65347 ) ) ( not ( = ?auto_65345 ?auto_65348 ) ) ( not ( = ?auto_65345 ?auto_65349 ) ) ( not ( = ?auto_65346 ?auto_65347 ) ) ( not ( = ?auto_65346 ?auto_65348 ) ) ( not ( = ?auto_65346 ?auto_65349 ) ) ( not ( = ?auto_65347 ?auto_65348 ) ) ( not ( = ?auto_65347 ?auto_65349 ) ) ( not ( = ?auto_65348 ?auto_65349 ) ) ( ON ?auto_65349 ?auto_65350 ) ( not ( = ?auto_65344 ?auto_65350 ) ) ( not ( = ?auto_65345 ?auto_65350 ) ) ( not ( = ?auto_65346 ?auto_65350 ) ) ( not ( = ?auto_65347 ?auto_65350 ) ) ( not ( = ?auto_65348 ?auto_65350 ) ) ( not ( = ?auto_65349 ?auto_65350 ) ) ( ON ?auto_65348 ?auto_65349 ) ( ON-TABLE ?auto_65350 ) ( ON ?auto_65347 ?auto_65348 ) ( ON ?auto_65346 ?auto_65347 ) ( ON ?auto_65345 ?auto_65346 ) ( CLEAR ?auto_65345 ) ( HOLDING ?auto_65344 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_65344 )
      ( MAKE-6PILE ?auto_65344 ?auto_65345 ?auto_65346 ?auto_65347 ?auto_65348 ?auto_65349 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_65351 - BLOCK
      ?auto_65352 - BLOCK
      ?auto_65353 - BLOCK
      ?auto_65354 - BLOCK
      ?auto_65355 - BLOCK
      ?auto_65356 - BLOCK
    )
    :vars
    (
      ?auto_65357 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65351 ?auto_65352 ) ) ( not ( = ?auto_65351 ?auto_65353 ) ) ( not ( = ?auto_65351 ?auto_65354 ) ) ( not ( = ?auto_65351 ?auto_65355 ) ) ( not ( = ?auto_65351 ?auto_65356 ) ) ( not ( = ?auto_65352 ?auto_65353 ) ) ( not ( = ?auto_65352 ?auto_65354 ) ) ( not ( = ?auto_65352 ?auto_65355 ) ) ( not ( = ?auto_65352 ?auto_65356 ) ) ( not ( = ?auto_65353 ?auto_65354 ) ) ( not ( = ?auto_65353 ?auto_65355 ) ) ( not ( = ?auto_65353 ?auto_65356 ) ) ( not ( = ?auto_65354 ?auto_65355 ) ) ( not ( = ?auto_65354 ?auto_65356 ) ) ( not ( = ?auto_65355 ?auto_65356 ) ) ( ON ?auto_65356 ?auto_65357 ) ( not ( = ?auto_65351 ?auto_65357 ) ) ( not ( = ?auto_65352 ?auto_65357 ) ) ( not ( = ?auto_65353 ?auto_65357 ) ) ( not ( = ?auto_65354 ?auto_65357 ) ) ( not ( = ?auto_65355 ?auto_65357 ) ) ( not ( = ?auto_65356 ?auto_65357 ) ) ( ON ?auto_65355 ?auto_65356 ) ( ON-TABLE ?auto_65357 ) ( ON ?auto_65354 ?auto_65355 ) ( ON ?auto_65353 ?auto_65354 ) ( ON ?auto_65352 ?auto_65353 ) ( ON ?auto_65351 ?auto_65352 ) ( CLEAR ?auto_65351 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_65357 ?auto_65356 ?auto_65355 ?auto_65354 ?auto_65353 ?auto_65352 )
      ( MAKE-6PILE ?auto_65351 ?auto_65352 ?auto_65353 ?auto_65354 ?auto_65355 ?auto_65356 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_65438 - BLOCK
    )
    :vars
    (
      ?auto_65439 - BLOCK
      ?auto_65440 - BLOCK
      ?auto_65441 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65438 ?auto_65439 ) ( CLEAR ?auto_65438 ) ( not ( = ?auto_65438 ?auto_65439 ) ) ( HOLDING ?auto_65440 ) ( CLEAR ?auto_65441 ) ( not ( = ?auto_65438 ?auto_65440 ) ) ( not ( = ?auto_65438 ?auto_65441 ) ) ( not ( = ?auto_65439 ?auto_65440 ) ) ( not ( = ?auto_65439 ?auto_65441 ) ) ( not ( = ?auto_65440 ?auto_65441 ) ) )
    :subtasks
    ( ( !STACK ?auto_65440 ?auto_65441 )
      ( MAKE-1PILE ?auto_65438 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_65442 - BLOCK
    )
    :vars
    (
      ?auto_65445 - BLOCK
      ?auto_65444 - BLOCK
      ?auto_65443 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65442 ?auto_65445 ) ( not ( = ?auto_65442 ?auto_65445 ) ) ( CLEAR ?auto_65444 ) ( not ( = ?auto_65442 ?auto_65443 ) ) ( not ( = ?auto_65442 ?auto_65444 ) ) ( not ( = ?auto_65445 ?auto_65443 ) ) ( not ( = ?auto_65445 ?auto_65444 ) ) ( not ( = ?auto_65443 ?auto_65444 ) ) ( ON ?auto_65443 ?auto_65442 ) ( CLEAR ?auto_65443 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_65445 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_65445 ?auto_65442 )
      ( MAKE-1PILE ?auto_65442 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_65446 - BLOCK
    )
    :vars
    (
      ?auto_65448 - BLOCK
      ?auto_65447 - BLOCK
      ?auto_65449 - BLOCK
      ?auto_65452 - BLOCK
      ?auto_65451 - BLOCK
      ?auto_65450 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65446 ?auto_65448 ) ( not ( = ?auto_65446 ?auto_65448 ) ) ( not ( = ?auto_65446 ?auto_65447 ) ) ( not ( = ?auto_65446 ?auto_65449 ) ) ( not ( = ?auto_65448 ?auto_65447 ) ) ( not ( = ?auto_65448 ?auto_65449 ) ) ( not ( = ?auto_65447 ?auto_65449 ) ) ( ON ?auto_65447 ?auto_65446 ) ( CLEAR ?auto_65447 ) ( ON-TABLE ?auto_65448 ) ( HOLDING ?auto_65449 ) ( CLEAR ?auto_65452 ) ( ON-TABLE ?auto_65451 ) ( ON ?auto_65450 ?auto_65451 ) ( ON ?auto_65452 ?auto_65450 ) ( not ( = ?auto_65451 ?auto_65450 ) ) ( not ( = ?auto_65451 ?auto_65452 ) ) ( not ( = ?auto_65451 ?auto_65449 ) ) ( not ( = ?auto_65450 ?auto_65452 ) ) ( not ( = ?auto_65450 ?auto_65449 ) ) ( not ( = ?auto_65452 ?auto_65449 ) ) ( not ( = ?auto_65446 ?auto_65452 ) ) ( not ( = ?auto_65446 ?auto_65451 ) ) ( not ( = ?auto_65446 ?auto_65450 ) ) ( not ( = ?auto_65448 ?auto_65452 ) ) ( not ( = ?auto_65448 ?auto_65451 ) ) ( not ( = ?auto_65448 ?auto_65450 ) ) ( not ( = ?auto_65447 ?auto_65452 ) ) ( not ( = ?auto_65447 ?auto_65451 ) ) ( not ( = ?auto_65447 ?auto_65450 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_65451 ?auto_65450 ?auto_65452 ?auto_65449 )
      ( MAKE-1PILE ?auto_65446 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_65453 - BLOCK
    )
    :vars
    (
      ?auto_65454 - BLOCK
      ?auto_65455 - BLOCK
      ?auto_65457 - BLOCK
      ?auto_65458 - BLOCK
      ?auto_65459 - BLOCK
      ?auto_65456 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65453 ?auto_65454 ) ( not ( = ?auto_65453 ?auto_65454 ) ) ( not ( = ?auto_65453 ?auto_65455 ) ) ( not ( = ?auto_65453 ?auto_65457 ) ) ( not ( = ?auto_65454 ?auto_65455 ) ) ( not ( = ?auto_65454 ?auto_65457 ) ) ( not ( = ?auto_65455 ?auto_65457 ) ) ( ON ?auto_65455 ?auto_65453 ) ( ON-TABLE ?auto_65454 ) ( CLEAR ?auto_65458 ) ( ON-TABLE ?auto_65459 ) ( ON ?auto_65456 ?auto_65459 ) ( ON ?auto_65458 ?auto_65456 ) ( not ( = ?auto_65459 ?auto_65456 ) ) ( not ( = ?auto_65459 ?auto_65458 ) ) ( not ( = ?auto_65459 ?auto_65457 ) ) ( not ( = ?auto_65456 ?auto_65458 ) ) ( not ( = ?auto_65456 ?auto_65457 ) ) ( not ( = ?auto_65458 ?auto_65457 ) ) ( not ( = ?auto_65453 ?auto_65458 ) ) ( not ( = ?auto_65453 ?auto_65459 ) ) ( not ( = ?auto_65453 ?auto_65456 ) ) ( not ( = ?auto_65454 ?auto_65458 ) ) ( not ( = ?auto_65454 ?auto_65459 ) ) ( not ( = ?auto_65454 ?auto_65456 ) ) ( not ( = ?auto_65455 ?auto_65458 ) ) ( not ( = ?auto_65455 ?auto_65459 ) ) ( not ( = ?auto_65455 ?auto_65456 ) ) ( ON ?auto_65457 ?auto_65455 ) ( CLEAR ?auto_65457 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_65454 ?auto_65453 ?auto_65455 )
      ( MAKE-1PILE ?auto_65453 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_65460 - BLOCK
    )
    :vars
    (
      ?auto_65461 - BLOCK
      ?auto_65462 - BLOCK
      ?auto_65464 - BLOCK
      ?auto_65466 - BLOCK
      ?auto_65463 - BLOCK
      ?auto_65465 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65460 ?auto_65461 ) ( not ( = ?auto_65460 ?auto_65461 ) ) ( not ( = ?auto_65460 ?auto_65462 ) ) ( not ( = ?auto_65460 ?auto_65464 ) ) ( not ( = ?auto_65461 ?auto_65462 ) ) ( not ( = ?auto_65461 ?auto_65464 ) ) ( not ( = ?auto_65462 ?auto_65464 ) ) ( ON ?auto_65462 ?auto_65460 ) ( ON-TABLE ?auto_65461 ) ( ON-TABLE ?auto_65466 ) ( ON ?auto_65463 ?auto_65466 ) ( not ( = ?auto_65466 ?auto_65463 ) ) ( not ( = ?auto_65466 ?auto_65465 ) ) ( not ( = ?auto_65466 ?auto_65464 ) ) ( not ( = ?auto_65463 ?auto_65465 ) ) ( not ( = ?auto_65463 ?auto_65464 ) ) ( not ( = ?auto_65465 ?auto_65464 ) ) ( not ( = ?auto_65460 ?auto_65465 ) ) ( not ( = ?auto_65460 ?auto_65466 ) ) ( not ( = ?auto_65460 ?auto_65463 ) ) ( not ( = ?auto_65461 ?auto_65465 ) ) ( not ( = ?auto_65461 ?auto_65466 ) ) ( not ( = ?auto_65461 ?auto_65463 ) ) ( not ( = ?auto_65462 ?auto_65465 ) ) ( not ( = ?auto_65462 ?auto_65466 ) ) ( not ( = ?auto_65462 ?auto_65463 ) ) ( ON ?auto_65464 ?auto_65462 ) ( CLEAR ?auto_65464 ) ( HOLDING ?auto_65465 ) ( CLEAR ?auto_65463 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_65466 ?auto_65463 ?auto_65465 )
      ( MAKE-1PILE ?auto_65460 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_65467 - BLOCK
    )
    :vars
    (
      ?auto_65471 - BLOCK
      ?auto_65472 - BLOCK
      ?auto_65469 - BLOCK
      ?auto_65473 - BLOCK
      ?auto_65468 - BLOCK
      ?auto_65470 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65467 ?auto_65471 ) ( not ( = ?auto_65467 ?auto_65471 ) ) ( not ( = ?auto_65467 ?auto_65472 ) ) ( not ( = ?auto_65467 ?auto_65469 ) ) ( not ( = ?auto_65471 ?auto_65472 ) ) ( not ( = ?auto_65471 ?auto_65469 ) ) ( not ( = ?auto_65472 ?auto_65469 ) ) ( ON ?auto_65472 ?auto_65467 ) ( ON-TABLE ?auto_65471 ) ( ON-TABLE ?auto_65473 ) ( ON ?auto_65468 ?auto_65473 ) ( not ( = ?auto_65473 ?auto_65468 ) ) ( not ( = ?auto_65473 ?auto_65470 ) ) ( not ( = ?auto_65473 ?auto_65469 ) ) ( not ( = ?auto_65468 ?auto_65470 ) ) ( not ( = ?auto_65468 ?auto_65469 ) ) ( not ( = ?auto_65470 ?auto_65469 ) ) ( not ( = ?auto_65467 ?auto_65470 ) ) ( not ( = ?auto_65467 ?auto_65473 ) ) ( not ( = ?auto_65467 ?auto_65468 ) ) ( not ( = ?auto_65471 ?auto_65470 ) ) ( not ( = ?auto_65471 ?auto_65473 ) ) ( not ( = ?auto_65471 ?auto_65468 ) ) ( not ( = ?auto_65472 ?auto_65470 ) ) ( not ( = ?auto_65472 ?auto_65473 ) ) ( not ( = ?auto_65472 ?auto_65468 ) ) ( ON ?auto_65469 ?auto_65472 ) ( CLEAR ?auto_65468 ) ( ON ?auto_65470 ?auto_65469 ) ( CLEAR ?auto_65470 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_65471 ?auto_65467 ?auto_65472 ?auto_65469 )
      ( MAKE-1PILE ?auto_65467 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_65474 - BLOCK
    )
    :vars
    (
      ?auto_65479 - BLOCK
      ?auto_65480 - BLOCK
      ?auto_65475 - BLOCK
      ?auto_65477 - BLOCK
      ?auto_65478 - BLOCK
      ?auto_65476 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65474 ?auto_65479 ) ( not ( = ?auto_65474 ?auto_65479 ) ) ( not ( = ?auto_65474 ?auto_65480 ) ) ( not ( = ?auto_65474 ?auto_65475 ) ) ( not ( = ?auto_65479 ?auto_65480 ) ) ( not ( = ?auto_65479 ?auto_65475 ) ) ( not ( = ?auto_65480 ?auto_65475 ) ) ( ON ?auto_65480 ?auto_65474 ) ( ON-TABLE ?auto_65479 ) ( ON-TABLE ?auto_65477 ) ( not ( = ?auto_65477 ?auto_65478 ) ) ( not ( = ?auto_65477 ?auto_65476 ) ) ( not ( = ?auto_65477 ?auto_65475 ) ) ( not ( = ?auto_65478 ?auto_65476 ) ) ( not ( = ?auto_65478 ?auto_65475 ) ) ( not ( = ?auto_65476 ?auto_65475 ) ) ( not ( = ?auto_65474 ?auto_65476 ) ) ( not ( = ?auto_65474 ?auto_65477 ) ) ( not ( = ?auto_65474 ?auto_65478 ) ) ( not ( = ?auto_65479 ?auto_65476 ) ) ( not ( = ?auto_65479 ?auto_65477 ) ) ( not ( = ?auto_65479 ?auto_65478 ) ) ( not ( = ?auto_65480 ?auto_65476 ) ) ( not ( = ?auto_65480 ?auto_65477 ) ) ( not ( = ?auto_65480 ?auto_65478 ) ) ( ON ?auto_65475 ?auto_65480 ) ( ON ?auto_65476 ?auto_65475 ) ( CLEAR ?auto_65476 ) ( HOLDING ?auto_65478 ) ( CLEAR ?auto_65477 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_65477 ?auto_65478 )
      ( MAKE-1PILE ?auto_65474 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_65481 - BLOCK
    )
    :vars
    (
      ?auto_65486 - BLOCK
      ?auto_65485 - BLOCK
      ?auto_65487 - BLOCK
      ?auto_65483 - BLOCK
      ?auto_65484 - BLOCK
      ?auto_65482 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65481 ?auto_65486 ) ( not ( = ?auto_65481 ?auto_65486 ) ) ( not ( = ?auto_65481 ?auto_65485 ) ) ( not ( = ?auto_65481 ?auto_65487 ) ) ( not ( = ?auto_65486 ?auto_65485 ) ) ( not ( = ?auto_65486 ?auto_65487 ) ) ( not ( = ?auto_65485 ?auto_65487 ) ) ( ON ?auto_65485 ?auto_65481 ) ( ON-TABLE ?auto_65486 ) ( ON-TABLE ?auto_65483 ) ( not ( = ?auto_65483 ?auto_65484 ) ) ( not ( = ?auto_65483 ?auto_65482 ) ) ( not ( = ?auto_65483 ?auto_65487 ) ) ( not ( = ?auto_65484 ?auto_65482 ) ) ( not ( = ?auto_65484 ?auto_65487 ) ) ( not ( = ?auto_65482 ?auto_65487 ) ) ( not ( = ?auto_65481 ?auto_65482 ) ) ( not ( = ?auto_65481 ?auto_65483 ) ) ( not ( = ?auto_65481 ?auto_65484 ) ) ( not ( = ?auto_65486 ?auto_65482 ) ) ( not ( = ?auto_65486 ?auto_65483 ) ) ( not ( = ?auto_65486 ?auto_65484 ) ) ( not ( = ?auto_65485 ?auto_65482 ) ) ( not ( = ?auto_65485 ?auto_65483 ) ) ( not ( = ?auto_65485 ?auto_65484 ) ) ( ON ?auto_65487 ?auto_65485 ) ( ON ?auto_65482 ?auto_65487 ) ( CLEAR ?auto_65483 ) ( ON ?auto_65484 ?auto_65482 ) ( CLEAR ?auto_65484 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_65486 ?auto_65481 ?auto_65485 ?auto_65487 ?auto_65482 )
      ( MAKE-1PILE ?auto_65481 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_65488 - BLOCK
    )
    :vars
    (
      ?auto_65492 - BLOCK
      ?auto_65490 - BLOCK
      ?auto_65494 - BLOCK
      ?auto_65489 - BLOCK
      ?auto_65491 - BLOCK
      ?auto_65493 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65488 ?auto_65492 ) ( not ( = ?auto_65488 ?auto_65492 ) ) ( not ( = ?auto_65488 ?auto_65490 ) ) ( not ( = ?auto_65488 ?auto_65494 ) ) ( not ( = ?auto_65492 ?auto_65490 ) ) ( not ( = ?auto_65492 ?auto_65494 ) ) ( not ( = ?auto_65490 ?auto_65494 ) ) ( ON ?auto_65490 ?auto_65488 ) ( ON-TABLE ?auto_65492 ) ( not ( = ?auto_65489 ?auto_65491 ) ) ( not ( = ?auto_65489 ?auto_65493 ) ) ( not ( = ?auto_65489 ?auto_65494 ) ) ( not ( = ?auto_65491 ?auto_65493 ) ) ( not ( = ?auto_65491 ?auto_65494 ) ) ( not ( = ?auto_65493 ?auto_65494 ) ) ( not ( = ?auto_65488 ?auto_65493 ) ) ( not ( = ?auto_65488 ?auto_65489 ) ) ( not ( = ?auto_65488 ?auto_65491 ) ) ( not ( = ?auto_65492 ?auto_65493 ) ) ( not ( = ?auto_65492 ?auto_65489 ) ) ( not ( = ?auto_65492 ?auto_65491 ) ) ( not ( = ?auto_65490 ?auto_65493 ) ) ( not ( = ?auto_65490 ?auto_65489 ) ) ( not ( = ?auto_65490 ?auto_65491 ) ) ( ON ?auto_65494 ?auto_65490 ) ( ON ?auto_65493 ?auto_65494 ) ( ON ?auto_65491 ?auto_65493 ) ( CLEAR ?auto_65491 ) ( HOLDING ?auto_65489 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_65489 )
      ( MAKE-1PILE ?auto_65488 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_65495 - BLOCK
    )
    :vars
    (
      ?auto_65500 - BLOCK
      ?auto_65496 - BLOCK
      ?auto_65499 - BLOCK
      ?auto_65497 - BLOCK
      ?auto_65501 - BLOCK
      ?auto_65498 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65495 ?auto_65500 ) ( not ( = ?auto_65495 ?auto_65500 ) ) ( not ( = ?auto_65495 ?auto_65496 ) ) ( not ( = ?auto_65495 ?auto_65499 ) ) ( not ( = ?auto_65500 ?auto_65496 ) ) ( not ( = ?auto_65500 ?auto_65499 ) ) ( not ( = ?auto_65496 ?auto_65499 ) ) ( ON ?auto_65496 ?auto_65495 ) ( ON-TABLE ?auto_65500 ) ( not ( = ?auto_65497 ?auto_65501 ) ) ( not ( = ?auto_65497 ?auto_65498 ) ) ( not ( = ?auto_65497 ?auto_65499 ) ) ( not ( = ?auto_65501 ?auto_65498 ) ) ( not ( = ?auto_65501 ?auto_65499 ) ) ( not ( = ?auto_65498 ?auto_65499 ) ) ( not ( = ?auto_65495 ?auto_65498 ) ) ( not ( = ?auto_65495 ?auto_65497 ) ) ( not ( = ?auto_65495 ?auto_65501 ) ) ( not ( = ?auto_65500 ?auto_65498 ) ) ( not ( = ?auto_65500 ?auto_65497 ) ) ( not ( = ?auto_65500 ?auto_65501 ) ) ( not ( = ?auto_65496 ?auto_65498 ) ) ( not ( = ?auto_65496 ?auto_65497 ) ) ( not ( = ?auto_65496 ?auto_65501 ) ) ( ON ?auto_65499 ?auto_65496 ) ( ON ?auto_65498 ?auto_65499 ) ( ON ?auto_65501 ?auto_65498 ) ( ON ?auto_65497 ?auto_65501 ) ( CLEAR ?auto_65497 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_65500 ?auto_65495 ?auto_65496 ?auto_65499 ?auto_65498 ?auto_65501 )
      ( MAKE-1PILE ?auto_65495 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_65511 - BLOCK
      ?auto_65512 - BLOCK
      ?auto_65513 - BLOCK
      ?auto_65514 - BLOCK
    )
    :vars
    (
      ?auto_65515 - BLOCK
      ?auto_65516 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65515 ?auto_65514 ) ( CLEAR ?auto_65515 ) ( ON-TABLE ?auto_65511 ) ( ON ?auto_65512 ?auto_65511 ) ( ON ?auto_65513 ?auto_65512 ) ( ON ?auto_65514 ?auto_65513 ) ( not ( = ?auto_65511 ?auto_65512 ) ) ( not ( = ?auto_65511 ?auto_65513 ) ) ( not ( = ?auto_65511 ?auto_65514 ) ) ( not ( = ?auto_65511 ?auto_65515 ) ) ( not ( = ?auto_65512 ?auto_65513 ) ) ( not ( = ?auto_65512 ?auto_65514 ) ) ( not ( = ?auto_65512 ?auto_65515 ) ) ( not ( = ?auto_65513 ?auto_65514 ) ) ( not ( = ?auto_65513 ?auto_65515 ) ) ( not ( = ?auto_65514 ?auto_65515 ) ) ( HOLDING ?auto_65516 ) ( not ( = ?auto_65511 ?auto_65516 ) ) ( not ( = ?auto_65512 ?auto_65516 ) ) ( not ( = ?auto_65513 ?auto_65516 ) ) ( not ( = ?auto_65514 ?auto_65516 ) ) ( not ( = ?auto_65515 ?auto_65516 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_65516 )
      ( MAKE-4PILE ?auto_65511 ?auto_65512 ?auto_65513 ?auto_65514 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_65584 - BLOCK
      ?auto_65585 - BLOCK
    )
    :vars
    (
      ?auto_65586 - BLOCK
      ?auto_65587 - BLOCK
      ?auto_65589 - BLOCK
      ?auto_65588 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65584 ?auto_65585 ) ) ( ON ?auto_65585 ?auto_65586 ) ( not ( = ?auto_65584 ?auto_65586 ) ) ( not ( = ?auto_65585 ?auto_65586 ) ) ( ON ?auto_65584 ?auto_65585 ) ( CLEAR ?auto_65584 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_65587 ) ( ON ?auto_65589 ?auto_65587 ) ( ON ?auto_65588 ?auto_65589 ) ( ON ?auto_65586 ?auto_65588 ) ( not ( = ?auto_65587 ?auto_65589 ) ) ( not ( = ?auto_65587 ?auto_65588 ) ) ( not ( = ?auto_65587 ?auto_65586 ) ) ( not ( = ?auto_65587 ?auto_65585 ) ) ( not ( = ?auto_65587 ?auto_65584 ) ) ( not ( = ?auto_65589 ?auto_65588 ) ) ( not ( = ?auto_65589 ?auto_65586 ) ) ( not ( = ?auto_65589 ?auto_65585 ) ) ( not ( = ?auto_65589 ?auto_65584 ) ) ( not ( = ?auto_65588 ?auto_65586 ) ) ( not ( = ?auto_65588 ?auto_65585 ) ) ( not ( = ?auto_65588 ?auto_65584 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_65587 ?auto_65589 ?auto_65588 ?auto_65586 ?auto_65585 )
      ( MAKE-2PILE ?auto_65584 ?auto_65585 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_65592 - BLOCK
      ?auto_65593 - BLOCK
    )
    :vars
    (
      ?auto_65594 - BLOCK
      ?auto_65595 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65592 ?auto_65593 ) ) ( ON ?auto_65593 ?auto_65594 ) ( CLEAR ?auto_65593 ) ( not ( = ?auto_65592 ?auto_65594 ) ) ( not ( = ?auto_65593 ?auto_65594 ) ) ( ON ?auto_65592 ?auto_65595 ) ( CLEAR ?auto_65592 ) ( HAND-EMPTY ) ( not ( = ?auto_65592 ?auto_65595 ) ) ( not ( = ?auto_65593 ?auto_65595 ) ) ( not ( = ?auto_65594 ?auto_65595 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_65592 ?auto_65595 )
      ( MAKE-2PILE ?auto_65592 ?auto_65593 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_65596 - BLOCK
      ?auto_65597 - BLOCK
    )
    :vars
    (
      ?auto_65599 - BLOCK
      ?auto_65598 - BLOCK
      ?auto_65600 - BLOCK
      ?auto_65602 - BLOCK
      ?auto_65601 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65596 ?auto_65597 ) ) ( not ( = ?auto_65596 ?auto_65599 ) ) ( not ( = ?auto_65597 ?auto_65599 ) ) ( ON ?auto_65596 ?auto_65598 ) ( CLEAR ?auto_65596 ) ( not ( = ?auto_65596 ?auto_65598 ) ) ( not ( = ?auto_65597 ?auto_65598 ) ) ( not ( = ?auto_65599 ?auto_65598 ) ) ( HOLDING ?auto_65597 ) ( CLEAR ?auto_65599 ) ( ON-TABLE ?auto_65600 ) ( ON ?auto_65602 ?auto_65600 ) ( ON ?auto_65601 ?auto_65602 ) ( ON ?auto_65599 ?auto_65601 ) ( not ( = ?auto_65600 ?auto_65602 ) ) ( not ( = ?auto_65600 ?auto_65601 ) ) ( not ( = ?auto_65600 ?auto_65599 ) ) ( not ( = ?auto_65600 ?auto_65597 ) ) ( not ( = ?auto_65602 ?auto_65601 ) ) ( not ( = ?auto_65602 ?auto_65599 ) ) ( not ( = ?auto_65602 ?auto_65597 ) ) ( not ( = ?auto_65601 ?auto_65599 ) ) ( not ( = ?auto_65601 ?auto_65597 ) ) ( not ( = ?auto_65596 ?auto_65600 ) ) ( not ( = ?auto_65596 ?auto_65602 ) ) ( not ( = ?auto_65596 ?auto_65601 ) ) ( not ( = ?auto_65598 ?auto_65600 ) ) ( not ( = ?auto_65598 ?auto_65602 ) ) ( not ( = ?auto_65598 ?auto_65601 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_65600 ?auto_65602 ?auto_65601 ?auto_65599 ?auto_65597 )
      ( MAKE-2PILE ?auto_65596 ?auto_65597 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_65603 - BLOCK
      ?auto_65604 - BLOCK
    )
    :vars
    (
      ?auto_65608 - BLOCK
      ?auto_65606 - BLOCK
      ?auto_65609 - BLOCK
      ?auto_65607 - BLOCK
      ?auto_65605 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65603 ?auto_65604 ) ) ( not ( = ?auto_65603 ?auto_65608 ) ) ( not ( = ?auto_65604 ?auto_65608 ) ) ( ON ?auto_65603 ?auto_65606 ) ( not ( = ?auto_65603 ?auto_65606 ) ) ( not ( = ?auto_65604 ?auto_65606 ) ) ( not ( = ?auto_65608 ?auto_65606 ) ) ( CLEAR ?auto_65608 ) ( ON-TABLE ?auto_65609 ) ( ON ?auto_65607 ?auto_65609 ) ( ON ?auto_65605 ?auto_65607 ) ( ON ?auto_65608 ?auto_65605 ) ( not ( = ?auto_65609 ?auto_65607 ) ) ( not ( = ?auto_65609 ?auto_65605 ) ) ( not ( = ?auto_65609 ?auto_65608 ) ) ( not ( = ?auto_65609 ?auto_65604 ) ) ( not ( = ?auto_65607 ?auto_65605 ) ) ( not ( = ?auto_65607 ?auto_65608 ) ) ( not ( = ?auto_65607 ?auto_65604 ) ) ( not ( = ?auto_65605 ?auto_65608 ) ) ( not ( = ?auto_65605 ?auto_65604 ) ) ( not ( = ?auto_65603 ?auto_65609 ) ) ( not ( = ?auto_65603 ?auto_65607 ) ) ( not ( = ?auto_65603 ?auto_65605 ) ) ( not ( = ?auto_65606 ?auto_65609 ) ) ( not ( = ?auto_65606 ?auto_65607 ) ) ( not ( = ?auto_65606 ?auto_65605 ) ) ( ON ?auto_65604 ?auto_65603 ) ( CLEAR ?auto_65604 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_65606 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_65606 ?auto_65603 )
      ( MAKE-2PILE ?auto_65603 ?auto_65604 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_65610 - BLOCK
      ?auto_65611 - BLOCK
    )
    :vars
    (
      ?auto_65613 - BLOCK
      ?auto_65616 - BLOCK
      ?auto_65612 - BLOCK
      ?auto_65615 - BLOCK
      ?auto_65614 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65610 ?auto_65611 ) ) ( not ( = ?auto_65610 ?auto_65613 ) ) ( not ( = ?auto_65611 ?auto_65613 ) ) ( ON ?auto_65610 ?auto_65616 ) ( not ( = ?auto_65610 ?auto_65616 ) ) ( not ( = ?auto_65611 ?auto_65616 ) ) ( not ( = ?auto_65613 ?auto_65616 ) ) ( ON-TABLE ?auto_65612 ) ( ON ?auto_65615 ?auto_65612 ) ( ON ?auto_65614 ?auto_65615 ) ( not ( = ?auto_65612 ?auto_65615 ) ) ( not ( = ?auto_65612 ?auto_65614 ) ) ( not ( = ?auto_65612 ?auto_65613 ) ) ( not ( = ?auto_65612 ?auto_65611 ) ) ( not ( = ?auto_65615 ?auto_65614 ) ) ( not ( = ?auto_65615 ?auto_65613 ) ) ( not ( = ?auto_65615 ?auto_65611 ) ) ( not ( = ?auto_65614 ?auto_65613 ) ) ( not ( = ?auto_65614 ?auto_65611 ) ) ( not ( = ?auto_65610 ?auto_65612 ) ) ( not ( = ?auto_65610 ?auto_65615 ) ) ( not ( = ?auto_65610 ?auto_65614 ) ) ( not ( = ?auto_65616 ?auto_65612 ) ) ( not ( = ?auto_65616 ?auto_65615 ) ) ( not ( = ?auto_65616 ?auto_65614 ) ) ( ON ?auto_65611 ?auto_65610 ) ( CLEAR ?auto_65611 ) ( ON-TABLE ?auto_65616 ) ( HOLDING ?auto_65613 ) ( CLEAR ?auto_65614 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_65612 ?auto_65615 ?auto_65614 ?auto_65613 )
      ( MAKE-2PILE ?auto_65610 ?auto_65611 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_65617 - BLOCK
      ?auto_65618 - BLOCK
    )
    :vars
    (
      ?auto_65621 - BLOCK
      ?auto_65619 - BLOCK
      ?auto_65620 - BLOCK
      ?auto_65623 - BLOCK
      ?auto_65622 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65617 ?auto_65618 ) ) ( not ( = ?auto_65617 ?auto_65621 ) ) ( not ( = ?auto_65618 ?auto_65621 ) ) ( ON ?auto_65617 ?auto_65619 ) ( not ( = ?auto_65617 ?auto_65619 ) ) ( not ( = ?auto_65618 ?auto_65619 ) ) ( not ( = ?auto_65621 ?auto_65619 ) ) ( ON-TABLE ?auto_65620 ) ( ON ?auto_65623 ?auto_65620 ) ( ON ?auto_65622 ?auto_65623 ) ( not ( = ?auto_65620 ?auto_65623 ) ) ( not ( = ?auto_65620 ?auto_65622 ) ) ( not ( = ?auto_65620 ?auto_65621 ) ) ( not ( = ?auto_65620 ?auto_65618 ) ) ( not ( = ?auto_65623 ?auto_65622 ) ) ( not ( = ?auto_65623 ?auto_65621 ) ) ( not ( = ?auto_65623 ?auto_65618 ) ) ( not ( = ?auto_65622 ?auto_65621 ) ) ( not ( = ?auto_65622 ?auto_65618 ) ) ( not ( = ?auto_65617 ?auto_65620 ) ) ( not ( = ?auto_65617 ?auto_65623 ) ) ( not ( = ?auto_65617 ?auto_65622 ) ) ( not ( = ?auto_65619 ?auto_65620 ) ) ( not ( = ?auto_65619 ?auto_65623 ) ) ( not ( = ?auto_65619 ?auto_65622 ) ) ( ON ?auto_65618 ?auto_65617 ) ( ON-TABLE ?auto_65619 ) ( CLEAR ?auto_65622 ) ( ON ?auto_65621 ?auto_65618 ) ( CLEAR ?auto_65621 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_65619 ?auto_65617 ?auto_65618 )
      ( MAKE-2PILE ?auto_65617 ?auto_65618 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_65624 - BLOCK
      ?auto_65625 - BLOCK
    )
    :vars
    (
      ?auto_65630 - BLOCK
      ?auto_65626 - BLOCK
      ?auto_65629 - BLOCK
      ?auto_65628 - BLOCK
      ?auto_65627 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65624 ?auto_65625 ) ) ( not ( = ?auto_65624 ?auto_65630 ) ) ( not ( = ?auto_65625 ?auto_65630 ) ) ( ON ?auto_65624 ?auto_65626 ) ( not ( = ?auto_65624 ?auto_65626 ) ) ( not ( = ?auto_65625 ?auto_65626 ) ) ( not ( = ?auto_65630 ?auto_65626 ) ) ( ON-TABLE ?auto_65629 ) ( ON ?auto_65628 ?auto_65629 ) ( not ( = ?auto_65629 ?auto_65628 ) ) ( not ( = ?auto_65629 ?auto_65627 ) ) ( not ( = ?auto_65629 ?auto_65630 ) ) ( not ( = ?auto_65629 ?auto_65625 ) ) ( not ( = ?auto_65628 ?auto_65627 ) ) ( not ( = ?auto_65628 ?auto_65630 ) ) ( not ( = ?auto_65628 ?auto_65625 ) ) ( not ( = ?auto_65627 ?auto_65630 ) ) ( not ( = ?auto_65627 ?auto_65625 ) ) ( not ( = ?auto_65624 ?auto_65629 ) ) ( not ( = ?auto_65624 ?auto_65628 ) ) ( not ( = ?auto_65624 ?auto_65627 ) ) ( not ( = ?auto_65626 ?auto_65629 ) ) ( not ( = ?auto_65626 ?auto_65628 ) ) ( not ( = ?auto_65626 ?auto_65627 ) ) ( ON ?auto_65625 ?auto_65624 ) ( ON-TABLE ?auto_65626 ) ( ON ?auto_65630 ?auto_65625 ) ( CLEAR ?auto_65630 ) ( HOLDING ?auto_65627 ) ( CLEAR ?auto_65628 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_65629 ?auto_65628 ?auto_65627 )
      ( MAKE-2PILE ?auto_65624 ?auto_65625 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_65631 - BLOCK
      ?auto_65632 - BLOCK
    )
    :vars
    (
      ?auto_65633 - BLOCK
      ?auto_65637 - BLOCK
      ?auto_65635 - BLOCK
      ?auto_65634 - BLOCK
      ?auto_65636 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65631 ?auto_65632 ) ) ( not ( = ?auto_65631 ?auto_65633 ) ) ( not ( = ?auto_65632 ?auto_65633 ) ) ( ON ?auto_65631 ?auto_65637 ) ( not ( = ?auto_65631 ?auto_65637 ) ) ( not ( = ?auto_65632 ?auto_65637 ) ) ( not ( = ?auto_65633 ?auto_65637 ) ) ( ON-TABLE ?auto_65635 ) ( ON ?auto_65634 ?auto_65635 ) ( not ( = ?auto_65635 ?auto_65634 ) ) ( not ( = ?auto_65635 ?auto_65636 ) ) ( not ( = ?auto_65635 ?auto_65633 ) ) ( not ( = ?auto_65635 ?auto_65632 ) ) ( not ( = ?auto_65634 ?auto_65636 ) ) ( not ( = ?auto_65634 ?auto_65633 ) ) ( not ( = ?auto_65634 ?auto_65632 ) ) ( not ( = ?auto_65636 ?auto_65633 ) ) ( not ( = ?auto_65636 ?auto_65632 ) ) ( not ( = ?auto_65631 ?auto_65635 ) ) ( not ( = ?auto_65631 ?auto_65634 ) ) ( not ( = ?auto_65631 ?auto_65636 ) ) ( not ( = ?auto_65637 ?auto_65635 ) ) ( not ( = ?auto_65637 ?auto_65634 ) ) ( not ( = ?auto_65637 ?auto_65636 ) ) ( ON ?auto_65632 ?auto_65631 ) ( ON-TABLE ?auto_65637 ) ( ON ?auto_65633 ?auto_65632 ) ( CLEAR ?auto_65634 ) ( ON ?auto_65636 ?auto_65633 ) ( CLEAR ?auto_65636 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_65637 ?auto_65631 ?auto_65632 ?auto_65633 )
      ( MAKE-2PILE ?auto_65631 ?auto_65632 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_65638 - BLOCK
      ?auto_65639 - BLOCK
    )
    :vars
    (
      ?auto_65643 - BLOCK
      ?auto_65641 - BLOCK
      ?auto_65640 - BLOCK
      ?auto_65642 - BLOCK
      ?auto_65644 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65638 ?auto_65639 ) ) ( not ( = ?auto_65638 ?auto_65643 ) ) ( not ( = ?auto_65639 ?auto_65643 ) ) ( ON ?auto_65638 ?auto_65641 ) ( not ( = ?auto_65638 ?auto_65641 ) ) ( not ( = ?auto_65639 ?auto_65641 ) ) ( not ( = ?auto_65643 ?auto_65641 ) ) ( ON-TABLE ?auto_65640 ) ( not ( = ?auto_65640 ?auto_65642 ) ) ( not ( = ?auto_65640 ?auto_65644 ) ) ( not ( = ?auto_65640 ?auto_65643 ) ) ( not ( = ?auto_65640 ?auto_65639 ) ) ( not ( = ?auto_65642 ?auto_65644 ) ) ( not ( = ?auto_65642 ?auto_65643 ) ) ( not ( = ?auto_65642 ?auto_65639 ) ) ( not ( = ?auto_65644 ?auto_65643 ) ) ( not ( = ?auto_65644 ?auto_65639 ) ) ( not ( = ?auto_65638 ?auto_65640 ) ) ( not ( = ?auto_65638 ?auto_65642 ) ) ( not ( = ?auto_65638 ?auto_65644 ) ) ( not ( = ?auto_65641 ?auto_65640 ) ) ( not ( = ?auto_65641 ?auto_65642 ) ) ( not ( = ?auto_65641 ?auto_65644 ) ) ( ON ?auto_65639 ?auto_65638 ) ( ON-TABLE ?auto_65641 ) ( ON ?auto_65643 ?auto_65639 ) ( ON ?auto_65644 ?auto_65643 ) ( CLEAR ?auto_65644 ) ( HOLDING ?auto_65642 ) ( CLEAR ?auto_65640 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_65640 ?auto_65642 )
      ( MAKE-2PILE ?auto_65638 ?auto_65639 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_65645 - BLOCK
      ?auto_65646 - BLOCK
    )
    :vars
    (
      ?auto_65648 - BLOCK
      ?auto_65647 - BLOCK
      ?auto_65651 - BLOCK
      ?auto_65650 - BLOCK
      ?auto_65649 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65645 ?auto_65646 ) ) ( not ( = ?auto_65645 ?auto_65648 ) ) ( not ( = ?auto_65646 ?auto_65648 ) ) ( ON ?auto_65645 ?auto_65647 ) ( not ( = ?auto_65645 ?auto_65647 ) ) ( not ( = ?auto_65646 ?auto_65647 ) ) ( not ( = ?auto_65648 ?auto_65647 ) ) ( ON-TABLE ?auto_65651 ) ( not ( = ?auto_65651 ?auto_65650 ) ) ( not ( = ?auto_65651 ?auto_65649 ) ) ( not ( = ?auto_65651 ?auto_65648 ) ) ( not ( = ?auto_65651 ?auto_65646 ) ) ( not ( = ?auto_65650 ?auto_65649 ) ) ( not ( = ?auto_65650 ?auto_65648 ) ) ( not ( = ?auto_65650 ?auto_65646 ) ) ( not ( = ?auto_65649 ?auto_65648 ) ) ( not ( = ?auto_65649 ?auto_65646 ) ) ( not ( = ?auto_65645 ?auto_65651 ) ) ( not ( = ?auto_65645 ?auto_65650 ) ) ( not ( = ?auto_65645 ?auto_65649 ) ) ( not ( = ?auto_65647 ?auto_65651 ) ) ( not ( = ?auto_65647 ?auto_65650 ) ) ( not ( = ?auto_65647 ?auto_65649 ) ) ( ON ?auto_65646 ?auto_65645 ) ( ON-TABLE ?auto_65647 ) ( ON ?auto_65648 ?auto_65646 ) ( ON ?auto_65649 ?auto_65648 ) ( CLEAR ?auto_65651 ) ( ON ?auto_65650 ?auto_65649 ) ( CLEAR ?auto_65650 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_65647 ?auto_65645 ?auto_65646 ?auto_65648 ?auto_65649 )
      ( MAKE-2PILE ?auto_65645 ?auto_65646 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_65652 - BLOCK
      ?auto_65653 - BLOCK
    )
    :vars
    (
      ?auto_65658 - BLOCK
      ?auto_65655 - BLOCK
      ?auto_65656 - BLOCK
      ?auto_65657 - BLOCK
      ?auto_65654 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65652 ?auto_65653 ) ) ( not ( = ?auto_65652 ?auto_65658 ) ) ( not ( = ?auto_65653 ?auto_65658 ) ) ( ON ?auto_65652 ?auto_65655 ) ( not ( = ?auto_65652 ?auto_65655 ) ) ( not ( = ?auto_65653 ?auto_65655 ) ) ( not ( = ?auto_65658 ?auto_65655 ) ) ( not ( = ?auto_65656 ?auto_65657 ) ) ( not ( = ?auto_65656 ?auto_65654 ) ) ( not ( = ?auto_65656 ?auto_65658 ) ) ( not ( = ?auto_65656 ?auto_65653 ) ) ( not ( = ?auto_65657 ?auto_65654 ) ) ( not ( = ?auto_65657 ?auto_65658 ) ) ( not ( = ?auto_65657 ?auto_65653 ) ) ( not ( = ?auto_65654 ?auto_65658 ) ) ( not ( = ?auto_65654 ?auto_65653 ) ) ( not ( = ?auto_65652 ?auto_65656 ) ) ( not ( = ?auto_65652 ?auto_65657 ) ) ( not ( = ?auto_65652 ?auto_65654 ) ) ( not ( = ?auto_65655 ?auto_65656 ) ) ( not ( = ?auto_65655 ?auto_65657 ) ) ( not ( = ?auto_65655 ?auto_65654 ) ) ( ON ?auto_65653 ?auto_65652 ) ( ON-TABLE ?auto_65655 ) ( ON ?auto_65658 ?auto_65653 ) ( ON ?auto_65654 ?auto_65658 ) ( ON ?auto_65657 ?auto_65654 ) ( CLEAR ?auto_65657 ) ( HOLDING ?auto_65656 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_65656 )
      ( MAKE-2PILE ?auto_65652 ?auto_65653 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_65659 - BLOCK
      ?auto_65660 - BLOCK
    )
    :vars
    (
      ?auto_65664 - BLOCK
      ?auto_65665 - BLOCK
      ?auto_65662 - BLOCK
      ?auto_65663 - BLOCK
      ?auto_65661 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65659 ?auto_65660 ) ) ( not ( = ?auto_65659 ?auto_65664 ) ) ( not ( = ?auto_65660 ?auto_65664 ) ) ( ON ?auto_65659 ?auto_65665 ) ( not ( = ?auto_65659 ?auto_65665 ) ) ( not ( = ?auto_65660 ?auto_65665 ) ) ( not ( = ?auto_65664 ?auto_65665 ) ) ( not ( = ?auto_65662 ?auto_65663 ) ) ( not ( = ?auto_65662 ?auto_65661 ) ) ( not ( = ?auto_65662 ?auto_65664 ) ) ( not ( = ?auto_65662 ?auto_65660 ) ) ( not ( = ?auto_65663 ?auto_65661 ) ) ( not ( = ?auto_65663 ?auto_65664 ) ) ( not ( = ?auto_65663 ?auto_65660 ) ) ( not ( = ?auto_65661 ?auto_65664 ) ) ( not ( = ?auto_65661 ?auto_65660 ) ) ( not ( = ?auto_65659 ?auto_65662 ) ) ( not ( = ?auto_65659 ?auto_65663 ) ) ( not ( = ?auto_65659 ?auto_65661 ) ) ( not ( = ?auto_65665 ?auto_65662 ) ) ( not ( = ?auto_65665 ?auto_65663 ) ) ( not ( = ?auto_65665 ?auto_65661 ) ) ( ON ?auto_65660 ?auto_65659 ) ( ON-TABLE ?auto_65665 ) ( ON ?auto_65664 ?auto_65660 ) ( ON ?auto_65661 ?auto_65664 ) ( ON ?auto_65663 ?auto_65661 ) ( ON ?auto_65662 ?auto_65663 ) ( CLEAR ?auto_65662 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_65665 ?auto_65659 ?auto_65660 ?auto_65664 ?auto_65661 ?auto_65663 )
      ( MAKE-2PILE ?auto_65659 ?auto_65660 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_65685 - BLOCK
      ?auto_65686 - BLOCK
      ?auto_65687 - BLOCK
    )
    :vars
    (
      ?auto_65690 - BLOCK
      ?auto_65689 - BLOCK
      ?auto_65688 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65690 ?auto_65687 ) ( ON-TABLE ?auto_65685 ) ( ON ?auto_65686 ?auto_65685 ) ( ON ?auto_65687 ?auto_65686 ) ( not ( = ?auto_65685 ?auto_65686 ) ) ( not ( = ?auto_65685 ?auto_65687 ) ) ( not ( = ?auto_65685 ?auto_65690 ) ) ( not ( = ?auto_65686 ?auto_65687 ) ) ( not ( = ?auto_65686 ?auto_65690 ) ) ( not ( = ?auto_65687 ?auto_65690 ) ) ( not ( = ?auto_65685 ?auto_65689 ) ) ( not ( = ?auto_65685 ?auto_65688 ) ) ( not ( = ?auto_65686 ?auto_65689 ) ) ( not ( = ?auto_65686 ?auto_65688 ) ) ( not ( = ?auto_65687 ?auto_65689 ) ) ( not ( = ?auto_65687 ?auto_65688 ) ) ( not ( = ?auto_65690 ?auto_65689 ) ) ( not ( = ?auto_65690 ?auto_65688 ) ) ( not ( = ?auto_65689 ?auto_65688 ) ) ( ON ?auto_65689 ?auto_65690 ) ( CLEAR ?auto_65689 ) ( HOLDING ?auto_65688 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_65688 )
      ( MAKE-3PILE ?auto_65685 ?auto_65686 ?auto_65687 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_65750 - BLOCK
      ?auto_65751 - BLOCK
      ?auto_65752 - BLOCK
    )
    :vars
    (
      ?auto_65753 - BLOCK
      ?auto_65755 - BLOCK
      ?auto_65754 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_65750 ) ( not ( = ?auto_65750 ?auto_65751 ) ) ( not ( = ?auto_65750 ?auto_65752 ) ) ( not ( = ?auto_65751 ?auto_65752 ) ) ( ON ?auto_65752 ?auto_65753 ) ( not ( = ?auto_65750 ?auto_65753 ) ) ( not ( = ?auto_65751 ?auto_65753 ) ) ( not ( = ?auto_65752 ?auto_65753 ) ) ( CLEAR ?auto_65750 ) ( ON ?auto_65751 ?auto_65752 ) ( CLEAR ?auto_65751 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_65755 ) ( ON ?auto_65754 ?auto_65755 ) ( ON ?auto_65753 ?auto_65754 ) ( not ( = ?auto_65755 ?auto_65754 ) ) ( not ( = ?auto_65755 ?auto_65753 ) ) ( not ( = ?auto_65755 ?auto_65752 ) ) ( not ( = ?auto_65755 ?auto_65751 ) ) ( not ( = ?auto_65754 ?auto_65753 ) ) ( not ( = ?auto_65754 ?auto_65752 ) ) ( not ( = ?auto_65754 ?auto_65751 ) ) ( not ( = ?auto_65750 ?auto_65755 ) ) ( not ( = ?auto_65750 ?auto_65754 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_65755 ?auto_65754 ?auto_65753 ?auto_65752 )
      ( MAKE-3PILE ?auto_65750 ?auto_65751 ?auto_65752 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_65756 - BLOCK
      ?auto_65757 - BLOCK
      ?auto_65758 - BLOCK
    )
    :vars
    (
      ?auto_65759 - BLOCK
      ?auto_65760 - BLOCK
      ?auto_65761 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65756 ?auto_65757 ) ) ( not ( = ?auto_65756 ?auto_65758 ) ) ( not ( = ?auto_65757 ?auto_65758 ) ) ( ON ?auto_65758 ?auto_65759 ) ( not ( = ?auto_65756 ?auto_65759 ) ) ( not ( = ?auto_65757 ?auto_65759 ) ) ( not ( = ?auto_65758 ?auto_65759 ) ) ( ON ?auto_65757 ?auto_65758 ) ( CLEAR ?auto_65757 ) ( ON-TABLE ?auto_65760 ) ( ON ?auto_65761 ?auto_65760 ) ( ON ?auto_65759 ?auto_65761 ) ( not ( = ?auto_65760 ?auto_65761 ) ) ( not ( = ?auto_65760 ?auto_65759 ) ) ( not ( = ?auto_65760 ?auto_65758 ) ) ( not ( = ?auto_65760 ?auto_65757 ) ) ( not ( = ?auto_65761 ?auto_65759 ) ) ( not ( = ?auto_65761 ?auto_65758 ) ) ( not ( = ?auto_65761 ?auto_65757 ) ) ( not ( = ?auto_65756 ?auto_65760 ) ) ( not ( = ?auto_65756 ?auto_65761 ) ) ( HOLDING ?auto_65756 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_65756 )
      ( MAKE-3PILE ?auto_65756 ?auto_65757 ?auto_65758 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_65762 - BLOCK
      ?auto_65763 - BLOCK
      ?auto_65764 - BLOCK
    )
    :vars
    (
      ?auto_65767 - BLOCK
      ?auto_65765 - BLOCK
      ?auto_65766 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65762 ?auto_65763 ) ) ( not ( = ?auto_65762 ?auto_65764 ) ) ( not ( = ?auto_65763 ?auto_65764 ) ) ( ON ?auto_65764 ?auto_65767 ) ( not ( = ?auto_65762 ?auto_65767 ) ) ( not ( = ?auto_65763 ?auto_65767 ) ) ( not ( = ?auto_65764 ?auto_65767 ) ) ( ON ?auto_65763 ?auto_65764 ) ( ON-TABLE ?auto_65765 ) ( ON ?auto_65766 ?auto_65765 ) ( ON ?auto_65767 ?auto_65766 ) ( not ( = ?auto_65765 ?auto_65766 ) ) ( not ( = ?auto_65765 ?auto_65767 ) ) ( not ( = ?auto_65765 ?auto_65764 ) ) ( not ( = ?auto_65765 ?auto_65763 ) ) ( not ( = ?auto_65766 ?auto_65767 ) ) ( not ( = ?auto_65766 ?auto_65764 ) ) ( not ( = ?auto_65766 ?auto_65763 ) ) ( not ( = ?auto_65762 ?auto_65765 ) ) ( not ( = ?auto_65762 ?auto_65766 ) ) ( ON ?auto_65762 ?auto_65763 ) ( CLEAR ?auto_65762 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_65765 ?auto_65766 ?auto_65767 ?auto_65764 ?auto_65763 )
      ( MAKE-3PILE ?auto_65762 ?auto_65763 ?auto_65764 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_65771 - BLOCK
      ?auto_65772 - BLOCK
      ?auto_65773 - BLOCK
    )
    :vars
    (
      ?auto_65776 - BLOCK
      ?auto_65774 - BLOCK
      ?auto_65775 - BLOCK
      ?auto_65777 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65771 ?auto_65772 ) ) ( not ( = ?auto_65771 ?auto_65773 ) ) ( not ( = ?auto_65772 ?auto_65773 ) ) ( ON ?auto_65773 ?auto_65776 ) ( not ( = ?auto_65771 ?auto_65776 ) ) ( not ( = ?auto_65772 ?auto_65776 ) ) ( not ( = ?auto_65773 ?auto_65776 ) ) ( ON ?auto_65772 ?auto_65773 ) ( CLEAR ?auto_65772 ) ( ON-TABLE ?auto_65774 ) ( ON ?auto_65775 ?auto_65774 ) ( ON ?auto_65776 ?auto_65775 ) ( not ( = ?auto_65774 ?auto_65775 ) ) ( not ( = ?auto_65774 ?auto_65776 ) ) ( not ( = ?auto_65774 ?auto_65773 ) ) ( not ( = ?auto_65774 ?auto_65772 ) ) ( not ( = ?auto_65775 ?auto_65776 ) ) ( not ( = ?auto_65775 ?auto_65773 ) ) ( not ( = ?auto_65775 ?auto_65772 ) ) ( not ( = ?auto_65771 ?auto_65774 ) ) ( not ( = ?auto_65771 ?auto_65775 ) ) ( ON ?auto_65771 ?auto_65777 ) ( CLEAR ?auto_65771 ) ( HAND-EMPTY ) ( not ( = ?auto_65771 ?auto_65777 ) ) ( not ( = ?auto_65772 ?auto_65777 ) ) ( not ( = ?auto_65773 ?auto_65777 ) ) ( not ( = ?auto_65776 ?auto_65777 ) ) ( not ( = ?auto_65774 ?auto_65777 ) ) ( not ( = ?auto_65775 ?auto_65777 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_65771 ?auto_65777 )
      ( MAKE-3PILE ?auto_65771 ?auto_65772 ?auto_65773 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_65778 - BLOCK
      ?auto_65779 - BLOCK
      ?auto_65780 - BLOCK
    )
    :vars
    (
      ?auto_65784 - BLOCK
      ?auto_65782 - BLOCK
      ?auto_65781 - BLOCK
      ?auto_65783 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65778 ?auto_65779 ) ) ( not ( = ?auto_65778 ?auto_65780 ) ) ( not ( = ?auto_65779 ?auto_65780 ) ) ( ON ?auto_65780 ?auto_65784 ) ( not ( = ?auto_65778 ?auto_65784 ) ) ( not ( = ?auto_65779 ?auto_65784 ) ) ( not ( = ?auto_65780 ?auto_65784 ) ) ( ON-TABLE ?auto_65782 ) ( ON ?auto_65781 ?auto_65782 ) ( ON ?auto_65784 ?auto_65781 ) ( not ( = ?auto_65782 ?auto_65781 ) ) ( not ( = ?auto_65782 ?auto_65784 ) ) ( not ( = ?auto_65782 ?auto_65780 ) ) ( not ( = ?auto_65782 ?auto_65779 ) ) ( not ( = ?auto_65781 ?auto_65784 ) ) ( not ( = ?auto_65781 ?auto_65780 ) ) ( not ( = ?auto_65781 ?auto_65779 ) ) ( not ( = ?auto_65778 ?auto_65782 ) ) ( not ( = ?auto_65778 ?auto_65781 ) ) ( ON ?auto_65778 ?auto_65783 ) ( CLEAR ?auto_65778 ) ( not ( = ?auto_65778 ?auto_65783 ) ) ( not ( = ?auto_65779 ?auto_65783 ) ) ( not ( = ?auto_65780 ?auto_65783 ) ) ( not ( = ?auto_65784 ?auto_65783 ) ) ( not ( = ?auto_65782 ?auto_65783 ) ) ( not ( = ?auto_65781 ?auto_65783 ) ) ( HOLDING ?auto_65779 ) ( CLEAR ?auto_65780 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_65782 ?auto_65781 ?auto_65784 ?auto_65780 ?auto_65779 )
      ( MAKE-3PILE ?auto_65778 ?auto_65779 ?auto_65780 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_65785 - BLOCK
      ?auto_65786 - BLOCK
      ?auto_65787 - BLOCK
    )
    :vars
    (
      ?auto_65791 - BLOCK
      ?auto_65789 - BLOCK
      ?auto_65788 - BLOCK
      ?auto_65790 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65785 ?auto_65786 ) ) ( not ( = ?auto_65785 ?auto_65787 ) ) ( not ( = ?auto_65786 ?auto_65787 ) ) ( ON ?auto_65787 ?auto_65791 ) ( not ( = ?auto_65785 ?auto_65791 ) ) ( not ( = ?auto_65786 ?auto_65791 ) ) ( not ( = ?auto_65787 ?auto_65791 ) ) ( ON-TABLE ?auto_65789 ) ( ON ?auto_65788 ?auto_65789 ) ( ON ?auto_65791 ?auto_65788 ) ( not ( = ?auto_65789 ?auto_65788 ) ) ( not ( = ?auto_65789 ?auto_65791 ) ) ( not ( = ?auto_65789 ?auto_65787 ) ) ( not ( = ?auto_65789 ?auto_65786 ) ) ( not ( = ?auto_65788 ?auto_65791 ) ) ( not ( = ?auto_65788 ?auto_65787 ) ) ( not ( = ?auto_65788 ?auto_65786 ) ) ( not ( = ?auto_65785 ?auto_65789 ) ) ( not ( = ?auto_65785 ?auto_65788 ) ) ( ON ?auto_65785 ?auto_65790 ) ( not ( = ?auto_65785 ?auto_65790 ) ) ( not ( = ?auto_65786 ?auto_65790 ) ) ( not ( = ?auto_65787 ?auto_65790 ) ) ( not ( = ?auto_65791 ?auto_65790 ) ) ( not ( = ?auto_65789 ?auto_65790 ) ) ( not ( = ?auto_65788 ?auto_65790 ) ) ( CLEAR ?auto_65787 ) ( ON ?auto_65786 ?auto_65785 ) ( CLEAR ?auto_65786 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_65790 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_65790 ?auto_65785 )
      ( MAKE-3PILE ?auto_65785 ?auto_65786 ?auto_65787 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_65792 - BLOCK
      ?auto_65793 - BLOCK
      ?auto_65794 - BLOCK
    )
    :vars
    (
      ?auto_65797 - BLOCK
      ?auto_65796 - BLOCK
      ?auto_65795 - BLOCK
      ?auto_65798 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65792 ?auto_65793 ) ) ( not ( = ?auto_65792 ?auto_65794 ) ) ( not ( = ?auto_65793 ?auto_65794 ) ) ( not ( = ?auto_65792 ?auto_65797 ) ) ( not ( = ?auto_65793 ?auto_65797 ) ) ( not ( = ?auto_65794 ?auto_65797 ) ) ( ON-TABLE ?auto_65796 ) ( ON ?auto_65795 ?auto_65796 ) ( ON ?auto_65797 ?auto_65795 ) ( not ( = ?auto_65796 ?auto_65795 ) ) ( not ( = ?auto_65796 ?auto_65797 ) ) ( not ( = ?auto_65796 ?auto_65794 ) ) ( not ( = ?auto_65796 ?auto_65793 ) ) ( not ( = ?auto_65795 ?auto_65797 ) ) ( not ( = ?auto_65795 ?auto_65794 ) ) ( not ( = ?auto_65795 ?auto_65793 ) ) ( not ( = ?auto_65792 ?auto_65796 ) ) ( not ( = ?auto_65792 ?auto_65795 ) ) ( ON ?auto_65792 ?auto_65798 ) ( not ( = ?auto_65792 ?auto_65798 ) ) ( not ( = ?auto_65793 ?auto_65798 ) ) ( not ( = ?auto_65794 ?auto_65798 ) ) ( not ( = ?auto_65797 ?auto_65798 ) ) ( not ( = ?auto_65796 ?auto_65798 ) ) ( not ( = ?auto_65795 ?auto_65798 ) ) ( ON ?auto_65793 ?auto_65792 ) ( CLEAR ?auto_65793 ) ( ON-TABLE ?auto_65798 ) ( HOLDING ?auto_65794 ) ( CLEAR ?auto_65797 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_65796 ?auto_65795 ?auto_65797 ?auto_65794 )
      ( MAKE-3PILE ?auto_65792 ?auto_65793 ?auto_65794 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_65799 - BLOCK
      ?auto_65800 - BLOCK
      ?auto_65801 - BLOCK
    )
    :vars
    (
      ?auto_65802 - BLOCK
      ?auto_65803 - BLOCK
      ?auto_65805 - BLOCK
      ?auto_65804 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65799 ?auto_65800 ) ) ( not ( = ?auto_65799 ?auto_65801 ) ) ( not ( = ?auto_65800 ?auto_65801 ) ) ( not ( = ?auto_65799 ?auto_65802 ) ) ( not ( = ?auto_65800 ?auto_65802 ) ) ( not ( = ?auto_65801 ?auto_65802 ) ) ( ON-TABLE ?auto_65803 ) ( ON ?auto_65805 ?auto_65803 ) ( ON ?auto_65802 ?auto_65805 ) ( not ( = ?auto_65803 ?auto_65805 ) ) ( not ( = ?auto_65803 ?auto_65802 ) ) ( not ( = ?auto_65803 ?auto_65801 ) ) ( not ( = ?auto_65803 ?auto_65800 ) ) ( not ( = ?auto_65805 ?auto_65802 ) ) ( not ( = ?auto_65805 ?auto_65801 ) ) ( not ( = ?auto_65805 ?auto_65800 ) ) ( not ( = ?auto_65799 ?auto_65803 ) ) ( not ( = ?auto_65799 ?auto_65805 ) ) ( ON ?auto_65799 ?auto_65804 ) ( not ( = ?auto_65799 ?auto_65804 ) ) ( not ( = ?auto_65800 ?auto_65804 ) ) ( not ( = ?auto_65801 ?auto_65804 ) ) ( not ( = ?auto_65802 ?auto_65804 ) ) ( not ( = ?auto_65803 ?auto_65804 ) ) ( not ( = ?auto_65805 ?auto_65804 ) ) ( ON ?auto_65800 ?auto_65799 ) ( ON-TABLE ?auto_65804 ) ( CLEAR ?auto_65802 ) ( ON ?auto_65801 ?auto_65800 ) ( CLEAR ?auto_65801 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_65804 ?auto_65799 ?auto_65800 )
      ( MAKE-3PILE ?auto_65799 ?auto_65800 ?auto_65801 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_65806 - BLOCK
      ?auto_65807 - BLOCK
      ?auto_65808 - BLOCK
    )
    :vars
    (
      ?auto_65810 - BLOCK
      ?auto_65811 - BLOCK
      ?auto_65812 - BLOCK
      ?auto_65809 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65806 ?auto_65807 ) ) ( not ( = ?auto_65806 ?auto_65808 ) ) ( not ( = ?auto_65807 ?auto_65808 ) ) ( not ( = ?auto_65806 ?auto_65810 ) ) ( not ( = ?auto_65807 ?auto_65810 ) ) ( not ( = ?auto_65808 ?auto_65810 ) ) ( ON-TABLE ?auto_65811 ) ( ON ?auto_65812 ?auto_65811 ) ( not ( = ?auto_65811 ?auto_65812 ) ) ( not ( = ?auto_65811 ?auto_65810 ) ) ( not ( = ?auto_65811 ?auto_65808 ) ) ( not ( = ?auto_65811 ?auto_65807 ) ) ( not ( = ?auto_65812 ?auto_65810 ) ) ( not ( = ?auto_65812 ?auto_65808 ) ) ( not ( = ?auto_65812 ?auto_65807 ) ) ( not ( = ?auto_65806 ?auto_65811 ) ) ( not ( = ?auto_65806 ?auto_65812 ) ) ( ON ?auto_65806 ?auto_65809 ) ( not ( = ?auto_65806 ?auto_65809 ) ) ( not ( = ?auto_65807 ?auto_65809 ) ) ( not ( = ?auto_65808 ?auto_65809 ) ) ( not ( = ?auto_65810 ?auto_65809 ) ) ( not ( = ?auto_65811 ?auto_65809 ) ) ( not ( = ?auto_65812 ?auto_65809 ) ) ( ON ?auto_65807 ?auto_65806 ) ( ON-TABLE ?auto_65809 ) ( ON ?auto_65808 ?auto_65807 ) ( CLEAR ?auto_65808 ) ( HOLDING ?auto_65810 ) ( CLEAR ?auto_65812 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_65811 ?auto_65812 ?auto_65810 )
      ( MAKE-3PILE ?auto_65806 ?auto_65807 ?auto_65808 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_65813 - BLOCK
      ?auto_65814 - BLOCK
      ?auto_65815 - BLOCK
    )
    :vars
    (
      ?auto_65817 - BLOCK
      ?auto_65816 - BLOCK
      ?auto_65819 - BLOCK
      ?auto_65818 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65813 ?auto_65814 ) ) ( not ( = ?auto_65813 ?auto_65815 ) ) ( not ( = ?auto_65814 ?auto_65815 ) ) ( not ( = ?auto_65813 ?auto_65817 ) ) ( not ( = ?auto_65814 ?auto_65817 ) ) ( not ( = ?auto_65815 ?auto_65817 ) ) ( ON-TABLE ?auto_65816 ) ( ON ?auto_65819 ?auto_65816 ) ( not ( = ?auto_65816 ?auto_65819 ) ) ( not ( = ?auto_65816 ?auto_65817 ) ) ( not ( = ?auto_65816 ?auto_65815 ) ) ( not ( = ?auto_65816 ?auto_65814 ) ) ( not ( = ?auto_65819 ?auto_65817 ) ) ( not ( = ?auto_65819 ?auto_65815 ) ) ( not ( = ?auto_65819 ?auto_65814 ) ) ( not ( = ?auto_65813 ?auto_65816 ) ) ( not ( = ?auto_65813 ?auto_65819 ) ) ( ON ?auto_65813 ?auto_65818 ) ( not ( = ?auto_65813 ?auto_65818 ) ) ( not ( = ?auto_65814 ?auto_65818 ) ) ( not ( = ?auto_65815 ?auto_65818 ) ) ( not ( = ?auto_65817 ?auto_65818 ) ) ( not ( = ?auto_65816 ?auto_65818 ) ) ( not ( = ?auto_65819 ?auto_65818 ) ) ( ON ?auto_65814 ?auto_65813 ) ( ON-TABLE ?auto_65818 ) ( ON ?auto_65815 ?auto_65814 ) ( CLEAR ?auto_65819 ) ( ON ?auto_65817 ?auto_65815 ) ( CLEAR ?auto_65817 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_65818 ?auto_65813 ?auto_65814 ?auto_65815 )
      ( MAKE-3PILE ?auto_65813 ?auto_65814 ?auto_65815 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_65820 - BLOCK
      ?auto_65821 - BLOCK
      ?auto_65822 - BLOCK
    )
    :vars
    (
      ?auto_65823 - BLOCK
      ?auto_65824 - BLOCK
      ?auto_65826 - BLOCK
      ?auto_65825 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65820 ?auto_65821 ) ) ( not ( = ?auto_65820 ?auto_65822 ) ) ( not ( = ?auto_65821 ?auto_65822 ) ) ( not ( = ?auto_65820 ?auto_65823 ) ) ( not ( = ?auto_65821 ?auto_65823 ) ) ( not ( = ?auto_65822 ?auto_65823 ) ) ( ON-TABLE ?auto_65824 ) ( not ( = ?auto_65824 ?auto_65826 ) ) ( not ( = ?auto_65824 ?auto_65823 ) ) ( not ( = ?auto_65824 ?auto_65822 ) ) ( not ( = ?auto_65824 ?auto_65821 ) ) ( not ( = ?auto_65826 ?auto_65823 ) ) ( not ( = ?auto_65826 ?auto_65822 ) ) ( not ( = ?auto_65826 ?auto_65821 ) ) ( not ( = ?auto_65820 ?auto_65824 ) ) ( not ( = ?auto_65820 ?auto_65826 ) ) ( ON ?auto_65820 ?auto_65825 ) ( not ( = ?auto_65820 ?auto_65825 ) ) ( not ( = ?auto_65821 ?auto_65825 ) ) ( not ( = ?auto_65822 ?auto_65825 ) ) ( not ( = ?auto_65823 ?auto_65825 ) ) ( not ( = ?auto_65824 ?auto_65825 ) ) ( not ( = ?auto_65826 ?auto_65825 ) ) ( ON ?auto_65821 ?auto_65820 ) ( ON-TABLE ?auto_65825 ) ( ON ?auto_65822 ?auto_65821 ) ( ON ?auto_65823 ?auto_65822 ) ( CLEAR ?auto_65823 ) ( HOLDING ?auto_65826 ) ( CLEAR ?auto_65824 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_65824 ?auto_65826 )
      ( MAKE-3PILE ?auto_65820 ?auto_65821 ?auto_65822 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_65827 - BLOCK
      ?auto_65828 - BLOCK
      ?auto_65829 - BLOCK
    )
    :vars
    (
      ?auto_65831 - BLOCK
      ?auto_65833 - BLOCK
      ?auto_65830 - BLOCK
      ?auto_65832 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65827 ?auto_65828 ) ) ( not ( = ?auto_65827 ?auto_65829 ) ) ( not ( = ?auto_65828 ?auto_65829 ) ) ( not ( = ?auto_65827 ?auto_65831 ) ) ( not ( = ?auto_65828 ?auto_65831 ) ) ( not ( = ?auto_65829 ?auto_65831 ) ) ( ON-TABLE ?auto_65833 ) ( not ( = ?auto_65833 ?auto_65830 ) ) ( not ( = ?auto_65833 ?auto_65831 ) ) ( not ( = ?auto_65833 ?auto_65829 ) ) ( not ( = ?auto_65833 ?auto_65828 ) ) ( not ( = ?auto_65830 ?auto_65831 ) ) ( not ( = ?auto_65830 ?auto_65829 ) ) ( not ( = ?auto_65830 ?auto_65828 ) ) ( not ( = ?auto_65827 ?auto_65833 ) ) ( not ( = ?auto_65827 ?auto_65830 ) ) ( ON ?auto_65827 ?auto_65832 ) ( not ( = ?auto_65827 ?auto_65832 ) ) ( not ( = ?auto_65828 ?auto_65832 ) ) ( not ( = ?auto_65829 ?auto_65832 ) ) ( not ( = ?auto_65831 ?auto_65832 ) ) ( not ( = ?auto_65833 ?auto_65832 ) ) ( not ( = ?auto_65830 ?auto_65832 ) ) ( ON ?auto_65828 ?auto_65827 ) ( ON-TABLE ?auto_65832 ) ( ON ?auto_65829 ?auto_65828 ) ( ON ?auto_65831 ?auto_65829 ) ( CLEAR ?auto_65833 ) ( ON ?auto_65830 ?auto_65831 ) ( CLEAR ?auto_65830 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_65832 ?auto_65827 ?auto_65828 ?auto_65829 ?auto_65831 )
      ( MAKE-3PILE ?auto_65827 ?auto_65828 ?auto_65829 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_65834 - BLOCK
      ?auto_65835 - BLOCK
      ?auto_65836 - BLOCK
    )
    :vars
    (
      ?auto_65840 - BLOCK
      ?auto_65838 - BLOCK
      ?auto_65839 - BLOCK
      ?auto_65837 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65834 ?auto_65835 ) ) ( not ( = ?auto_65834 ?auto_65836 ) ) ( not ( = ?auto_65835 ?auto_65836 ) ) ( not ( = ?auto_65834 ?auto_65840 ) ) ( not ( = ?auto_65835 ?auto_65840 ) ) ( not ( = ?auto_65836 ?auto_65840 ) ) ( not ( = ?auto_65838 ?auto_65839 ) ) ( not ( = ?auto_65838 ?auto_65840 ) ) ( not ( = ?auto_65838 ?auto_65836 ) ) ( not ( = ?auto_65838 ?auto_65835 ) ) ( not ( = ?auto_65839 ?auto_65840 ) ) ( not ( = ?auto_65839 ?auto_65836 ) ) ( not ( = ?auto_65839 ?auto_65835 ) ) ( not ( = ?auto_65834 ?auto_65838 ) ) ( not ( = ?auto_65834 ?auto_65839 ) ) ( ON ?auto_65834 ?auto_65837 ) ( not ( = ?auto_65834 ?auto_65837 ) ) ( not ( = ?auto_65835 ?auto_65837 ) ) ( not ( = ?auto_65836 ?auto_65837 ) ) ( not ( = ?auto_65840 ?auto_65837 ) ) ( not ( = ?auto_65838 ?auto_65837 ) ) ( not ( = ?auto_65839 ?auto_65837 ) ) ( ON ?auto_65835 ?auto_65834 ) ( ON-TABLE ?auto_65837 ) ( ON ?auto_65836 ?auto_65835 ) ( ON ?auto_65840 ?auto_65836 ) ( ON ?auto_65839 ?auto_65840 ) ( CLEAR ?auto_65839 ) ( HOLDING ?auto_65838 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_65838 )
      ( MAKE-3PILE ?auto_65834 ?auto_65835 ?auto_65836 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_65841 - BLOCK
      ?auto_65842 - BLOCK
      ?auto_65843 - BLOCK
    )
    :vars
    (
      ?auto_65847 - BLOCK
      ?auto_65846 - BLOCK
      ?auto_65844 - BLOCK
      ?auto_65845 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65841 ?auto_65842 ) ) ( not ( = ?auto_65841 ?auto_65843 ) ) ( not ( = ?auto_65842 ?auto_65843 ) ) ( not ( = ?auto_65841 ?auto_65847 ) ) ( not ( = ?auto_65842 ?auto_65847 ) ) ( not ( = ?auto_65843 ?auto_65847 ) ) ( not ( = ?auto_65846 ?auto_65844 ) ) ( not ( = ?auto_65846 ?auto_65847 ) ) ( not ( = ?auto_65846 ?auto_65843 ) ) ( not ( = ?auto_65846 ?auto_65842 ) ) ( not ( = ?auto_65844 ?auto_65847 ) ) ( not ( = ?auto_65844 ?auto_65843 ) ) ( not ( = ?auto_65844 ?auto_65842 ) ) ( not ( = ?auto_65841 ?auto_65846 ) ) ( not ( = ?auto_65841 ?auto_65844 ) ) ( ON ?auto_65841 ?auto_65845 ) ( not ( = ?auto_65841 ?auto_65845 ) ) ( not ( = ?auto_65842 ?auto_65845 ) ) ( not ( = ?auto_65843 ?auto_65845 ) ) ( not ( = ?auto_65847 ?auto_65845 ) ) ( not ( = ?auto_65846 ?auto_65845 ) ) ( not ( = ?auto_65844 ?auto_65845 ) ) ( ON ?auto_65842 ?auto_65841 ) ( ON-TABLE ?auto_65845 ) ( ON ?auto_65843 ?auto_65842 ) ( ON ?auto_65847 ?auto_65843 ) ( ON ?auto_65844 ?auto_65847 ) ( ON ?auto_65846 ?auto_65844 ) ( CLEAR ?auto_65846 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_65845 ?auto_65841 ?auto_65842 ?auto_65843 ?auto_65847 ?auto_65844 )
      ( MAKE-3PILE ?auto_65841 ?auto_65842 ?auto_65843 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_65863 - BLOCK
      ?auto_65864 - BLOCK
    )
    :vars
    (
      ?auto_65865 - BLOCK
      ?auto_65866 - BLOCK
      ?auto_65867 - BLOCK
      ?auto_65868 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65865 ?auto_65864 ) ( ON-TABLE ?auto_65863 ) ( ON ?auto_65864 ?auto_65863 ) ( not ( = ?auto_65863 ?auto_65864 ) ) ( not ( = ?auto_65863 ?auto_65865 ) ) ( not ( = ?auto_65864 ?auto_65865 ) ) ( not ( = ?auto_65863 ?auto_65866 ) ) ( not ( = ?auto_65863 ?auto_65867 ) ) ( not ( = ?auto_65864 ?auto_65866 ) ) ( not ( = ?auto_65864 ?auto_65867 ) ) ( not ( = ?auto_65865 ?auto_65866 ) ) ( not ( = ?auto_65865 ?auto_65867 ) ) ( not ( = ?auto_65866 ?auto_65867 ) ) ( ON ?auto_65866 ?auto_65865 ) ( CLEAR ?auto_65866 ) ( HOLDING ?auto_65867 ) ( CLEAR ?auto_65868 ) ( ON-TABLE ?auto_65868 ) ( not ( = ?auto_65868 ?auto_65867 ) ) ( not ( = ?auto_65863 ?auto_65868 ) ) ( not ( = ?auto_65864 ?auto_65868 ) ) ( not ( = ?auto_65865 ?auto_65868 ) ) ( not ( = ?auto_65866 ?auto_65868 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_65868 ?auto_65867 )
      ( MAKE-2PILE ?auto_65863 ?auto_65864 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_65869 - BLOCK
      ?auto_65870 - BLOCK
    )
    :vars
    (
      ?auto_65874 - BLOCK
      ?auto_65871 - BLOCK
      ?auto_65872 - BLOCK
      ?auto_65873 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65874 ?auto_65870 ) ( ON-TABLE ?auto_65869 ) ( ON ?auto_65870 ?auto_65869 ) ( not ( = ?auto_65869 ?auto_65870 ) ) ( not ( = ?auto_65869 ?auto_65874 ) ) ( not ( = ?auto_65870 ?auto_65874 ) ) ( not ( = ?auto_65869 ?auto_65871 ) ) ( not ( = ?auto_65869 ?auto_65872 ) ) ( not ( = ?auto_65870 ?auto_65871 ) ) ( not ( = ?auto_65870 ?auto_65872 ) ) ( not ( = ?auto_65874 ?auto_65871 ) ) ( not ( = ?auto_65874 ?auto_65872 ) ) ( not ( = ?auto_65871 ?auto_65872 ) ) ( ON ?auto_65871 ?auto_65874 ) ( CLEAR ?auto_65873 ) ( ON-TABLE ?auto_65873 ) ( not ( = ?auto_65873 ?auto_65872 ) ) ( not ( = ?auto_65869 ?auto_65873 ) ) ( not ( = ?auto_65870 ?auto_65873 ) ) ( not ( = ?auto_65874 ?auto_65873 ) ) ( not ( = ?auto_65871 ?auto_65873 ) ) ( ON ?auto_65872 ?auto_65871 ) ( CLEAR ?auto_65872 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_65869 ?auto_65870 ?auto_65874 ?auto_65871 )
      ( MAKE-2PILE ?auto_65869 ?auto_65870 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_65875 - BLOCK
      ?auto_65876 - BLOCK
    )
    :vars
    (
      ?auto_65879 - BLOCK
      ?auto_65877 - BLOCK
      ?auto_65878 - BLOCK
      ?auto_65880 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65879 ?auto_65876 ) ( ON-TABLE ?auto_65875 ) ( ON ?auto_65876 ?auto_65875 ) ( not ( = ?auto_65875 ?auto_65876 ) ) ( not ( = ?auto_65875 ?auto_65879 ) ) ( not ( = ?auto_65876 ?auto_65879 ) ) ( not ( = ?auto_65875 ?auto_65877 ) ) ( not ( = ?auto_65875 ?auto_65878 ) ) ( not ( = ?auto_65876 ?auto_65877 ) ) ( not ( = ?auto_65876 ?auto_65878 ) ) ( not ( = ?auto_65879 ?auto_65877 ) ) ( not ( = ?auto_65879 ?auto_65878 ) ) ( not ( = ?auto_65877 ?auto_65878 ) ) ( ON ?auto_65877 ?auto_65879 ) ( not ( = ?auto_65880 ?auto_65878 ) ) ( not ( = ?auto_65875 ?auto_65880 ) ) ( not ( = ?auto_65876 ?auto_65880 ) ) ( not ( = ?auto_65879 ?auto_65880 ) ) ( not ( = ?auto_65877 ?auto_65880 ) ) ( ON ?auto_65878 ?auto_65877 ) ( CLEAR ?auto_65878 ) ( HOLDING ?auto_65880 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_65880 )
      ( MAKE-2PILE ?auto_65875 ?auto_65876 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_65889 - BLOCK
      ?auto_65890 - BLOCK
    )
    :vars
    (
      ?auto_65892 - BLOCK
      ?auto_65891 - BLOCK
      ?auto_65894 - BLOCK
      ?auto_65893 - BLOCK
      ?auto_65895 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65892 ?auto_65890 ) ( ON-TABLE ?auto_65889 ) ( ON ?auto_65890 ?auto_65889 ) ( not ( = ?auto_65889 ?auto_65890 ) ) ( not ( = ?auto_65889 ?auto_65892 ) ) ( not ( = ?auto_65890 ?auto_65892 ) ) ( not ( = ?auto_65889 ?auto_65891 ) ) ( not ( = ?auto_65889 ?auto_65894 ) ) ( not ( = ?auto_65890 ?auto_65891 ) ) ( not ( = ?auto_65890 ?auto_65894 ) ) ( not ( = ?auto_65892 ?auto_65891 ) ) ( not ( = ?auto_65892 ?auto_65894 ) ) ( not ( = ?auto_65891 ?auto_65894 ) ) ( ON ?auto_65891 ?auto_65892 ) ( not ( = ?auto_65893 ?auto_65894 ) ) ( not ( = ?auto_65889 ?auto_65893 ) ) ( not ( = ?auto_65890 ?auto_65893 ) ) ( not ( = ?auto_65892 ?auto_65893 ) ) ( not ( = ?auto_65891 ?auto_65893 ) ) ( ON ?auto_65894 ?auto_65891 ) ( CLEAR ?auto_65894 ) ( ON ?auto_65893 ?auto_65895 ) ( CLEAR ?auto_65893 ) ( HAND-EMPTY ) ( not ( = ?auto_65889 ?auto_65895 ) ) ( not ( = ?auto_65890 ?auto_65895 ) ) ( not ( = ?auto_65892 ?auto_65895 ) ) ( not ( = ?auto_65891 ?auto_65895 ) ) ( not ( = ?auto_65894 ?auto_65895 ) ) ( not ( = ?auto_65893 ?auto_65895 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_65893 ?auto_65895 )
      ( MAKE-2PILE ?auto_65889 ?auto_65890 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_65896 - BLOCK
      ?auto_65897 - BLOCK
    )
    :vars
    (
      ?auto_65899 - BLOCK
      ?auto_65901 - BLOCK
      ?auto_65900 - BLOCK
      ?auto_65902 - BLOCK
      ?auto_65898 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65899 ?auto_65897 ) ( ON-TABLE ?auto_65896 ) ( ON ?auto_65897 ?auto_65896 ) ( not ( = ?auto_65896 ?auto_65897 ) ) ( not ( = ?auto_65896 ?auto_65899 ) ) ( not ( = ?auto_65897 ?auto_65899 ) ) ( not ( = ?auto_65896 ?auto_65901 ) ) ( not ( = ?auto_65896 ?auto_65900 ) ) ( not ( = ?auto_65897 ?auto_65901 ) ) ( not ( = ?auto_65897 ?auto_65900 ) ) ( not ( = ?auto_65899 ?auto_65901 ) ) ( not ( = ?auto_65899 ?auto_65900 ) ) ( not ( = ?auto_65901 ?auto_65900 ) ) ( ON ?auto_65901 ?auto_65899 ) ( not ( = ?auto_65902 ?auto_65900 ) ) ( not ( = ?auto_65896 ?auto_65902 ) ) ( not ( = ?auto_65897 ?auto_65902 ) ) ( not ( = ?auto_65899 ?auto_65902 ) ) ( not ( = ?auto_65901 ?auto_65902 ) ) ( ON ?auto_65902 ?auto_65898 ) ( CLEAR ?auto_65902 ) ( not ( = ?auto_65896 ?auto_65898 ) ) ( not ( = ?auto_65897 ?auto_65898 ) ) ( not ( = ?auto_65899 ?auto_65898 ) ) ( not ( = ?auto_65901 ?auto_65898 ) ) ( not ( = ?auto_65900 ?auto_65898 ) ) ( not ( = ?auto_65902 ?auto_65898 ) ) ( HOLDING ?auto_65900 ) ( CLEAR ?auto_65901 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_65896 ?auto_65897 ?auto_65899 ?auto_65901 ?auto_65900 )
      ( MAKE-2PILE ?auto_65896 ?auto_65897 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_65942 - BLOCK
      ?auto_65943 - BLOCK
      ?auto_65944 - BLOCK
      ?auto_65945 - BLOCK
    )
    :vars
    (
      ?auto_65946 - BLOCK
      ?auto_65947 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_65942 ) ( ON ?auto_65943 ?auto_65942 ) ( not ( = ?auto_65942 ?auto_65943 ) ) ( not ( = ?auto_65942 ?auto_65944 ) ) ( not ( = ?auto_65942 ?auto_65945 ) ) ( not ( = ?auto_65943 ?auto_65944 ) ) ( not ( = ?auto_65943 ?auto_65945 ) ) ( not ( = ?auto_65944 ?auto_65945 ) ) ( ON ?auto_65945 ?auto_65946 ) ( not ( = ?auto_65942 ?auto_65946 ) ) ( not ( = ?auto_65943 ?auto_65946 ) ) ( not ( = ?auto_65944 ?auto_65946 ) ) ( not ( = ?auto_65945 ?auto_65946 ) ) ( CLEAR ?auto_65943 ) ( ON ?auto_65944 ?auto_65945 ) ( CLEAR ?auto_65944 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_65947 ) ( ON ?auto_65946 ?auto_65947 ) ( not ( = ?auto_65947 ?auto_65946 ) ) ( not ( = ?auto_65947 ?auto_65945 ) ) ( not ( = ?auto_65947 ?auto_65944 ) ) ( not ( = ?auto_65942 ?auto_65947 ) ) ( not ( = ?auto_65943 ?auto_65947 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_65947 ?auto_65946 ?auto_65945 )
      ( MAKE-4PILE ?auto_65942 ?auto_65943 ?auto_65944 ?auto_65945 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_65948 - BLOCK
      ?auto_65949 - BLOCK
      ?auto_65950 - BLOCK
      ?auto_65951 - BLOCK
    )
    :vars
    (
      ?auto_65952 - BLOCK
      ?auto_65953 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_65948 ) ( not ( = ?auto_65948 ?auto_65949 ) ) ( not ( = ?auto_65948 ?auto_65950 ) ) ( not ( = ?auto_65948 ?auto_65951 ) ) ( not ( = ?auto_65949 ?auto_65950 ) ) ( not ( = ?auto_65949 ?auto_65951 ) ) ( not ( = ?auto_65950 ?auto_65951 ) ) ( ON ?auto_65951 ?auto_65952 ) ( not ( = ?auto_65948 ?auto_65952 ) ) ( not ( = ?auto_65949 ?auto_65952 ) ) ( not ( = ?auto_65950 ?auto_65952 ) ) ( not ( = ?auto_65951 ?auto_65952 ) ) ( ON ?auto_65950 ?auto_65951 ) ( CLEAR ?auto_65950 ) ( ON-TABLE ?auto_65953 ) ( ON ?auto_65952 ?auto_65953 ) ( not ( = ?auto_65953 ?auto_65952 ) ) ( not ( = ?auto_65953 ?auto_65951 ) ) ( not ( = ?auto_65953 ?auto_65950 ) ) ( not ( = ?auto_65948 ?auto_65953 ) ) ( not ( = ?auto_65949 ?auto_65953 ) ) ( HOLDING ?auto_65949 ) ( CLEAR ?auto_65948 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_65948 ?auto_65949 )
      ( MAKE-4PILE ?auto_65948 ?auto_65949 ?auto_65950 ?auto_65951 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_65954 - BLOCK
      ?auto_65955 - BLOCK
      ?auto_65956 - BLOCK
      ?auto_65957 - BLOCK
    )
    :vars
    (
      ?auto_65959 - BLOCK
      ?auto_65958 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_65954 ) ( not ( = ?auto_65954 ?auto_65955 ) ) ( not ( = ?auto_65954 ?auto_65956 ) ) ( not ( = ?auto_65954 ?auto_65957 ) ) ( not ( = ?auto_65955 ?auto_65956 ) ) ( not ( = ?auto_65955 ?auto_65957 ) ) ( not ( = ?auto_65956 ?auto_65957 ) ) ( ON ?auto_65957 ?auto_65959 ) ( not ( = ?auto_65954 ?auto_65959 ) ) ( not ( = ?auto_65955 ?auto_65959 ) ) ( not ( = ?auto_65956 ?auto_65959 ) ) ( not ( = ?auto_65957 ?auto_65959 ) ) ( ON ?auto_65956 ?auto_65957 ) ( ON-TABLE ?auto_65958 ) ( ON ?auto_65959 ?auto_65958 ) ( not ( = ?auto_65958 ?auto_65959 ) ) ( not ( = ?auto_65958 ?auto_65957 ) ) ( not ( = ?auto_65958 ?auto_65956 ) ) ( not ( = ?auto_65954 ?auto_65958 ) ) ( not ( = ?auto_65955 ?auto_65958 ) ) ( CLEAR ?auto_65954 ) ( ON ?auto_65955 ?auto_65956 ) ( CLEAR ?auto_65955 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_65958 ?auto_65959 ?auto_65957 ?auto_65956 )
      ( MAKE-4PILE ?auto_65954 ?auto_65955 ?auto_65956 ?auto_65957 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_65960 - BLOCK
      ?auto_65961 - BLOCK
      ?auto_65962 - BLOCK
      ?auto_65963 - BLOCK
    )
    :vars
    (
      ?auto_65964 - BLOCK
      ?auto_65965 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65960 ?auto_65961 ) ) ( not ( = ?auto_65960 ?auto_65962 ) ) ( not ( = ?auto_65960 ?auto_65963 ) ) ( not ( = ?auto_65961 ?auto_65962 ) ) ( not ( = ?auto_65961 ?auto_65963 ) ) ( not ( = ?auto_65962 ?auto_65963 ) ) ( ON ?auto_65963 ?auto_65964 ) ( not ( = ?auto_65960 ?auto_65964 ) ) ( not ( = ?auto_65961 ?auto_65964 ) ) ( not ( = ?auto_65962 ?auto_65964 ) ) ( not ( = ?auto_65963 ?auto_65964 ) ) ( ON ?auto_65962 ?auto_65963 ) ( ON-TABLE ?auto_65965 ) ( ON ?auto_65964 ?auto_65965 ) ( not ( = ?auto_65965 ?auto_65964 ) ) ( not ( = ?auto_65965 ?auto_65963 ) ) ( not ( = ?auto_65965 ?auto_65962 ) ) ( not ( = ?auto_65960 ?auto_65965 ) ) ( not ( = ?auto_65961 ?auto_65965 ) ) ( ON ?auto_65961 ?auto_65962 ) ( CLEAR ?auto_65961 ) ( HOLDING ?auto_65960 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_65960 )
      ( MAKE-4PILE ?auto_65960 ?auto_65961 ?auto_65962 ?auto_65963 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_65966 - BLOCK
      ?auto_65967 - BLOCK
      ?auto_65968 - BLOCK
      ?auto_65969 - BLOCK
    )
    :vars
    (
      ?auto_65971 - BLOCK
      ?auto_65970 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65966 ?auto_65967 ) ) ( not ( = ?auto_65966 ?auto_65968 ) ) ( not ( = ?auto_65966 ?auto_65969 ) ) ( not ( = ?auto_65967 ?auto_65968 ) ) ( not ( = ?auto_65967 ?auto_65969 ) ) ( not ( = ?auto_65968 ?auto_65969 ) ) ( ON ?auto_65969 ?auto_65971 ) ( not ( = ?auto_65966 ?auto_65971 ) ) ( not ( = ?auto_65967 ?auto_65971 ) ) ( not ( = ?auto_65968 ?auto_65971 ) ) ( not ( = ?auto_65969 ?auto_65971 ) ) ( ON ?auto_65968 ?auto_65969 ) ( ON-TABLE ?auto_65970 ) ( ON ?auto_65971 ?auto_65970 ) ( not ( = ?auto_65970 ?auto_65971 ) ) ( not ( = ?auto_65970 ?auto_65969 ) ) ( not ( = ?auto_65970 ?auto_65968 ) ) ( not ( = ?auto_65966 ?auto_65970 ) ) ( not ( = ?auto_65967 ?auto_65970 ) ) ( ON ?auto_65967 ?auto_65968 ) ( ON ?auto_65966 ?auto_65967 ) ( CLEAR ?auto_65966 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_65970 ?auto_65971 ?auto_65969 ?auto_65968 ?auto_65967 )
      ( MAKE-4PILE ?auto_65966 ?auto_65967 ?auto_65968 ?auto_65969 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_65976 - BLOCK
      ?auto_65977 - BLOCK
      ?auto_65978 - BLOCK
      ?auto_65979 - BLOCK
    )
    :vars
    (
      ?auto_65981 - BLOCK
      ?auto_65980 - BLOCK
      ?auto_65982 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65976 ?auto_65977 ) ) ( not ( = ?auto_65976 ?auto_65978 ) ) ( not ( = ?auto_65976 ?auto_65979 ) ) ( not ( = ?auto_65977 ?auto_65978 ) ) ( not ( = ?auto_65977 ?auto_65979 ) ) ( not ( = ?auto_65978 ?auto_65979 ) ) ( ON ?auto_65979 ?auto_65981 ) ( not ( = ?auto_65976 ?auto_65981 ) ) ( not ( = ?auto_65977 ?auto_65981 ) ) ( not ( = ?auto_65978 ?auto_65981 ) ) ( not ( = ?auto_65979 ?auto_65981 ) ) ( ON ?auto_65978 ?auto_65979 ) ( ON-TABLE ?auto_65980 ) ( ON ?auto_65981 ?auto_65980 ) ( not ( = ?auto_65980 ?auto_65981 ) ) ( not ( = ?auto_65980 ?auto_65979 ) ) ( not ( = ?auto_65980 ?auto_65978 ) ) ( not ( = ?auto_65976 ?auto_65980 ) ) ( not ( = ?auto_65977 ?auto_65980 ) ) ( ON ?auto_65977 ?auto_65978 ) ( CLEAR ?auto_65977 ) ( ON ?auto_65976 ?auto_65982 ) ( CLEAR ?auto_65976 ) ( HAND-EMPTY ) ( not ( = ?auto_65976 ?auto_65982 ) ) ( not ( = ?auto_65977 ?auto_65982 ) ) ( not ( = ?auto_65978 ?auto_65982 ) ) ( not ( = ?auto_65979 ?auto_65982 ) ) ( not ( = ?auto_65981 ?auto_65982 ) ) ( not ( = ?auto_65980 ?auto_65982 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_65976 ?auto_65982 )
      ( MAKE-4PILE ?auto_65976 ?auto_65977 ?auto_65978 ?auto_65979 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_65983 - BLOCK
      ?auto_65984 - BLOCK
      ?auto_65985 - BLOCK
      ?auto_65986 - BLOCK
    )
    :vars
    (
      ?auto_65987 - BLOCK
      ?auto_65989 - BLOCK
      ?auto_65988 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65983 ?auto_65984 ) ) ( not ( = ?auto_65983 ?auto_65985 ) ) ( not ( = ?auto_65983 ?auto_65986 ) ) ( not ( = ?auto_65984 ?auto_65985 ) ) ( not ( = ?auto_65984 ?auto_65986 ) ) ( not ( = ?auto_65985 ?auto_65986 ) ) ( ON ?auto_65986 ?auto_65987 ) ( not ( = ?auto_65983 ?auto_65987 ) ) ( not ( = ?auto_65984 ?auto_65987 ) ) ( not ( = ?auto_65985 ?auto_65987 ) ) ( not ( = ?auto_65986 ?auto_65987 ) ) ( ON ?auto_65985 ?auto_65986 ) ( ON-TABLE ?auto_65989 ) ( ON ?auto_65987 ?auto_65989 ) ( not ( = ?auto_65989 ?auto_65987 ) ) ( not ( = ?auto_65989 ?auto_65986 ) ) ( not ( = ?auto_65989 ?auto_65985 ) ) ( not ( = ?auto_65983 ?auto_65989 ) ) ( not ( = ?auto_65984 ?auto_65989 ) ) ( ON ?auto_65983 ?auto_65988 ) ( CLEAR ?auto_65983 ) ( not ( = ?auto_65983 ?auto_65988 ) ) ( not ( = ?auto_65984 ?auto_65988 ) ) ( not ( = ?auto_65985 ?auto_65988 ) ) ( not ( = ?auto_65986 ?auto_65988 ) ) ( not ( = ?auto_65987 ?auto_65988 ) ) ( not ( = ?auto_65989 ?auto_65988 ) ) ( HOLDING ?auto_65984 ) ( CLEAR ?auto_65985 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_65989 ?auto_65987 ?auto_65986 ?auto_65985 ?auto_65984 )
      ( MAKE-4PILE ?auto_65983 ?auto_65984 ?auto_65985 ?auto_65986 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_65990 - BLOCK
      ?auto_65991 - BLOCK
      ?auto_65992 - BLOCK
      ?auto_65993 - BLOCK
    )
    :vars
    (
      ?auto_65994 - BLOCK
      ?auto_65995 - BLOCK
      ?auto_65996 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65990 ?auto_65991 ) ) ( not ( = ?auto_65990 ?auto_65992 ) ) ( not ( = ?auto_65990 ?auto_65993 ) ) ( not ( = ?auto_65991 ?auto_65992 ) ) ( not ( = ?auto_65991 ?auto_65993 ) ) ( not ( = ?auto_65992 ?auto_65993 ) ) ( ON ?auto_65993 ?auto_65994 ) ( not ( = ?auto_65990 ?auto_65994 ) ) ( not ( = ?auto_65991 ?auto_65994 ) ) ( not ( = ?auto_65992 ?auto_65994 ) ) ( not ( = ?auto_65993 ?auto_65994 ) ) ( ON ?auto_65992 ?auto_65993 ) ( ON-TABLE ?auto_65995 ) ( ON ?auto_65994 ?auto_65995 ) ( not ( = ?auto_65995 ?auto_65994 ) ) ( not ( = ?auto_65995 ?auto_65993 ) ) ( not ( = ?auto_65995 ?auto_65992 ) ) ( not ( = ?auto_65990 ?auto_65995 ) ) ( not ( = ?auto_65991 ?auto_65995 ) ) ( ON ?auto_65990 ?auto_65996 ) ( not ( = ?auto_65990 ?auto_65996 ) ) ( not ( = ?auto_65991 ?auto_65996 ) ) ( not ( = ?auto_65992 ?auto_65996 ) ) ( not ( = ?auto_65993 ?auto_65996 ) ) ( not ( = ?auto_65994 ?auto_65996 ) ) ( not ( = ?auto_65995 ?auto_65996 ) ) ( CLEAR ?auto_65992 ) ( ON ?auto_65991 ?auto_65990 ) ( CLEAR ?auto_65991 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_65996 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_65996 ?auto_65990 )
      ( MAKE-4PILE ?auto_65990 ?auto_65991 ?auto_65992 ?auto_65993 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_65997 - BLOCK
      ?auto_65998 - BLOCK
      ?auto_65999 - BLOCK
      ?auto_66000 - BLOCK
    )
    :vars
    (
      ?auto_66002 - BLOCK
      ?auto_66003 - BLOCK
      ?auto_66001 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65997 ?auto_65998 ) ) ( not ( = ?auto_65997 ?auto_65999 ) ) ( not ( = ?auto_65997 ?auto_66000 ) ) ( not ( = ?auto_65998 ?auto_65999 ) ) ( not ( = ?auto_65998 ?auto_66000 ) ) ( not ( = ?auto_65999 ?auto_66000 ) ) ( ON ?auto_66000 ?auto_66002 ) ( not ( = ?auto_65997 ?auto_66002 ) ) ( not ( = ?auto_65998 ?auto_66002 ) ) ( not ( = ?auto_65999 ?auto_66002 ) ) ( not ( = ?auto_66000 ?auto_66002 ) ) ( ON-TABLE ?auto_66003 ) ( ON ?auto_66002 ?auto_66003 ) ( not ( = ?auto_66003 ?auto_66002 ) ) ( not ( = ?auto_66003 ?auto_66000 ) ) ( not ( = ?auto_66003 ?auto_65999 ) ) ( not ( = ?auto_65997 ?auto_66003 ) ) ( not ( = ?auto_65998 ?auto_66003 ) ) ( ON ?auto_65997 ?auto_66001 ) ( not ( = ?auto_65997 ?auto_66001 ) ) ( not ( = ?auto_65998 ?auto_66001 ) ) ( not ( = ?auto_65999 ?auto_66001 ) ) ( not ( = ?auto_66000 ?auto_66001 ) ) ( not ( = ?auto_66002 ?auto_66001 ) ) ( not ( = ?auto_66003 ?auto_66001 ) ) ( ON ?auto_65998 ?auto_65997 ) ( CLEAR ?auto_65998 ) ( ON-TABLE ?auto_66001 ) ( HOLDING ?auto_65999 ) ( CLEAR ?auto_66000 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_66003 ?auto_66002 ?auto_66000 ?auto_65999 )
      ( MAKE-4PILE ?auto_65997 ?auto_65998 ?auto_65999 ?auto_66000 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_66004 - BLOCK
      ?auto_66005 - BLOCK
      ?auto_66006 - BLOCK
      ?auto_66007 - BLOCK
    )
    :vars
    (
      ?auto_66008 - BLOCK
      ?auto_66010 - BLOCK
      ?auto_66009 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66004 ?auto_66005 ) ) ( not ( = ?auto_66004 ?auto_66006 ) ) ( not ( = ?auto_66004 ?auto_66007 ) ) ( not ( = ?auto_66005 ?auto_66006 ) ) ( not ( = ?auto_66005 ?auto_66007 ) ) ( not ( = ?auto_66006 ?auto_66007 ) ) ( ON ?auto_66007 ?auto_66008 ) ( not ( = ?auto_66004 ?auto_66008 ) ) ( not ( = ?auto_66005 ?auto_66008 ) ) ( not ( = ?auto_66006 ?auto_66008 ) ) ( not ( = ?auto_66007 ?auto_66008 ) ) ( ON-TABLE ?auto_66010 ) ( ON ?auto_66008 ?auto_66010 ) ( not ( = ?auto_66010 ?auto_66008 ) ) ( not ( = ?auto_66010 ?auto_66007 ) ) ( not ( = ?auto_66010 ?auto_66006 ) ) ( not ( = ?auto_66004 ?auto_66010 ) ) ( not ( = ?auto_66005 ?auto_66010 ) ) ( ON ?auto_66004 ?auto_66009 ) ( not ( = ?auto_66004 ?auto_66009 ) ) ( not ( = ?auto_66005 ?auto_66009 ) ) ( not ( = ?auto_66006 ?auto_66009 ) ) ( not ( = ?auto_66007 ?auto_66009 ) ) ( not ( = ?auto_66008 ?auto_66009 ) ) ( not ( = ?auto_66010 ?auto_66009 ) ) ( ON ?auto_66005 ?auto_66004 ) ( ON-TABLE ?auto_66009 ) ( CLEAR ?auto_66007 ) ( ON ?auto_66006 ?auto_66005 ) ( CLEAR ?auto_66006 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_66009 ?auto_66004 ?auto_66005 )
      ( MAKE-4PILE ?auto_66004 ?auto_66005 ?auto_66006 ?auto_66007 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_66011 - BLOCK
      ?auto_66012 - BLOCK
      ?auto_66013 - BLOCK
      ?auto_66014 - BLOCK
    )
    :vars
    (
      ?auto_66015 - BLOCK
      ?auto_66017 - BLOCK
      ?auto_66016 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66011 ?auto_66012 ) ) ( not ( = ?auto_66011 ?auto_66013 ) ) ( not ( = ?auto_66011 ?auto_66014 ) ) ( not ( = ?auto_66012 ?auto_66013 ) ) ( not ( = ?auto_66012 ?auto_66014 ) ) ( not ( = ?auto_66013 ?auto_66014 ) ) ( not ( = ?auto_66011 ?auto_66015 ) ) ( not ( = ?auto_66012 ?auto_66015 ) ) ( not ( = ?auto_66013 ?auto_66015 ) ) ( not ( = ?auto_66014 ?auto_66015 ) ) ( ON-TABLE ?auto_66017 ) ( ON ?auto_66015 ?auto_66017 ) ( not ( = ?auto_66017 ?auto_66015 ) ) ( not ( = ?auto_66017 ?auto_66014 ) ) ( not ( = ?auto_66017 ?auto_66013 ) ) ( not ( = ?auto_66011 ?auto_66017 ) ) ( not ( = ?auto_66012 ?auto_66017 ) ) ( ON ?auto_66011 ?auto_66016 ) ( not ( = ?auto_66011 ?auto_66016 ) ) ( not ( = ?auto_66012 ?auto_66016 ) ) ( not ( = ?auto_66013 ?auto_66016 ) ) ( not ( = ?auto_66014 ?auto_66016 ) ) ( not ( = ?auto_66015 ?auto_66016 ) ) ( not ( = ?auto_66017 ?auto_66016 ) ) ( ON ?auto_66012 ?auto_66011 ) ( ON-TABLE ?auto_66016 ) ( ON ?auto_66013 ?auto_66012 ) ( CLEAR ?auto_66013 ) ( HOLDING ?auto_66014 ) ( CLEAR ?auto_66015 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_66017 ?auto_66015 ?auto_66014 )
      ( MAKE-4PILE ?auto_66011 ?auto_66012 ?auto_66013 ?auto_66014 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_66018 - BLOCK
      ?auto_66019 - BLOCK
      ?auto_66020 - BLOCK
      ?auto_66021 - BLOCK
    )
    :vars
    (
      ?auto_66022 - BLOCK
      ?auto_66023 - BLOCK
      ?auto_66024 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66018 ?auto_66019 ) ) ( not ( = ?auto_66018 ?auto_66020 ) ) ( not ( = ?auto_66018 ?auto_66021 ) ) ( not ( = ?auto_66019 ?auto_66020 ) ) ( not ( = ?auto_66019 ?auto_66021 ) ) ( not ( = ?auto_66020 ?auto_66021 ) ) ( not ( = ?auto_66018 ?auto_66022 ) ) ( not ( = ?auto_66019 ?auto_66022 ) ) ( not ( = ?auto_66020 ?auto_66022 ) ) ( not ( = ?auto_66021 ?auto_66022 ) ) ( ON-TABLE ?auto_66023 ) ( ON ?auto_66022 ?auto_66023 ) ( not ( = ?auto_66023 ?auto_66022 ) ) ( not ( = ?auto_66023 ?auto_66021 ) ) ( not ( = ?auto_66023 ?auto_66020 ) ) ( not ( = ?auto_66018 ?auto_66023 ) ) ( not ( = ?auto_66019 ?auto_66023 ) ) ( ON ?auto_66018 ?auto_66024 ) ( not ( = ?auto_66018 ?auto_66024 ) ) ( not ( = ?auto_66019 ?auto_66024 ) ) ( not ( = ?auto_66020 ?auto_66024 ) ) ( not ( = ?auto_66021 ?auto_66024 ) ) ( not ( = ?auto_66022 ?auto_66024 ) ) ( not ( = ?auto_66023 ?auto_66024 ) ) ( ON ?auto_66019 ?auto_66018 ) ( ON-TABLE ?auto_66024 ) ( ON ?auto_66020 ?auto_66019 ) ( CLEAR ?auto_66022 ) ( ON ?auto_66021 ?auto_66020 ) ( CLEAR ?auto_66021 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_66024 ?auto_66018 ?auto_66019 ?auto_66020 )
      ( MAKE-4PILE ?auto_66018 ?auto_66019 ?auto_66020 ?auto_66021 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_66025 - BLOCK
      ?auto_66026 - BLOCK
      ?auto_66027 - BLOCK
      ?auto_66028 - BLOCK
    )
    :vars
    (
      ?auto_66029 - BLOCK
      ?auto_66031 - BLOCK
      ?auto_66030 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66025 ?auto_66026 ) ) ( not ( = ?auto_66025 ?auto_66027 ) ) ( not ( = ?auto_66025 ?auto_66028 ) ) ( not ( = ?auto_66026 ?auto_66027 ) ) ( not ( = ?auto_66026 ?auto_66028 ) ) ( not ( = ?auto_66027 ?auto_66028 ) ) ( not ( = ?auto_66025 ?auto_66029 ) ) ( not ( = ?auto_66026 ?auto_66029 ) ) ( not ( = ?auto_66027 ?auto_66029 ) ) ( not ( = ?auto_66028 ?auto_66029 ) ) ( ON-TABLE ?auto_66031 ) ( not ( = ?auto_66031 ?auto_66029 ) ) ( not ( = ?auto_66031 ?auto_66028 ) ) ( not ( = ?auto_66031 ?auto_66027 ) ) ( not ( = ?auto_66025 ?auto_66031 ) ) ( not ( = ?auto_66026 ?auto_66031 ) ) ( ON ?auto_66025 ?auto_66030 ) ( not ( = ?auto_66025 ?auto_66030 ) ) ( not ( = ?auto_66026 ?auto_66030 ) ) ( not ( = ?auto_66027 ?auto_66030 ) ) ( not ( = ?auto_66028 ?auto_66030 ) ) ( not ( = ?auto_66029 ?auto_66030 ) ) ( not ( = ?auto_66031 ?auto_66030 ) ) ( ON ?auto_66026 ?auto_66025 ) ( ON-TABLE ?auto_66030 ) ( ON ?auto_66027 ?auto_66026 ) ( ON ?auto_66028 ?auto_66027 ) ( CLEAR ?auto_66028 ) ( HOLDING ?auto_66029 ) ( CLEAR ?auto_66031 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_66031 ?auto_66029 )
      ( MAKE-4PILE ?auto_66025 ?auto_66026 ?auto_66027 ?auto_66028 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_66032 - BLOCK
      ?auto_66033 - BLOCK
      ?auto_66034 - BLOCK
      ?auto_66035 - BLOCK
    )
    :vars
    (
      ?auto_66036 - BLOCK
      ?auto_66037 - BLOCK
      ?auto_66038 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66032 ?auto_66033 ) ) ( not ( = ?auto_66032 ?auto_66034 ) ) ( not ( = ?auto_66032 ?auto_66035 ) ) ( not ( = ?auto_66033 ?auto_66034 ) ) ( not ( = ?auto_66033 ?auto_66035 ) ) ( not ( = ?auto_66034 ?auto_66035 ) ) ( not ( = ?auto_66032 ?auto_66036 ) ) ( not ( = ?auto_66033 ?auto_66036 ) ) ( not ( = ?auto_66034 ?auto_66036 ) ) ( not ( = ?auto_66035 ?auto_66036 ) ) ( ON-TABLE ?auto_66037 ) ( not ( = ?auto_66037 ?auto_66036 ) ) ( not ( = ?auto_66037 ?auto_66035 ) ) ( not ( = ?auto_66037 ?auto_66034 ) ) ( not ( = ?auto_66032 ?auto_66037 ) ) ( not ( = ?auto_66033 ?auto_66037 ) ) ( ON ?auto_66032 ?auto_66038 ) ( not ( = ?auto_66032 ?auto_66038 ) ) ( not ( = ?auto_66033 ?auto_66038 ) ) ( not ( = ?auto_66034 ?auto_66038 ) ) ( not ( = ?auto_66035 ?auto_66038 ) ) ( not ( = ?auto_66036 ?auto_66038 ) ) ( not ( = ?auto_66037 ?auto_66038 ) ) ( ON ?auto_66033 ?auto_66032 ) ( ON-TABLE ?auto_66038 ) ( ON ?auto_66034 ?auto_66033 ) ( ON ?auto_66035 ?auto_66034 ) ( CLEAR ?auto_66037 ) ( ON ?auto_66036 ?auto_66035 ) ( CLEAR ?auto_66036 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_66038 ?auto_66032 ?auto_66033 ?auto_66034 ?auto_66035 )
      ( MAKE-4PILE ?auto_66032 ?auto_66033 ?auto_66034 ?auto_66035 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_66039 - BLOCK
      ?auto_66040 - BLOCK
      ?auto_66041 - BLOCK
      ?auto_66042 - BLOCK
    )
    :vars
    (
      ?auto_66044 - BLOCK
      ?auto_66043 - BLOCK
      ?auto_66045 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66039 ?auto_66040 ) ) ( not ( = ?auto_66039 ?auto_66041 ) ) ( not ( = ?auto_66039 ?auto_66042 ) ) ( not ( = ?auto_66040 ?auto_66041 ) ) ( not ( = ?auto_66040 ?auto_66042 ) ) ( not ( = ?auto_66041 ?auto_66042 ) ) ( not ( = ?auto_66039 ?auto_66044 ) ) ( not ( = ?auto_66040 ?auto_66044 ) ) ( not ( = ?auto_66041 ?auto_66044 ) ) ( not ( = ?auto_66042 ?auto_66044 ) ) ( not ( = ?auto_66043 ?auto_66044 ) ) ( not ( = ?auto_66043 ?auto_66042 ) ) ( not ( = ?auto_66043 ?auto_66041 ) ) ( not ( = ?auto_66039 ?auto_66043 ) ) ( not ( = ?auto_66040 ?auto_66043 ) ) ( ON ?auto_66039 ?auto_66045 ) ( not ( = ?auto_66039 ?auto_66045 ) ) ( not ( = ?auto_66040 ?auto_66045 ) ) ( not ( = ?auto_66041 ?auto_66045 ) ) ( not ( = ?auto_66042 ?auto_66045 ) ) ( not ( = ?auto_66044 ?auto_66045 ) ) ( not ( = ?auto_66043 ?auto_66045 ) ) ( ON ?auto_66040 ?auto_66039 ) ( ON-TABLE ?auto_66045 ) ( ON ?auto_66041 ?auto_66040 ) ( ON ?auto_66042 ?auto_66041 ) ( ON ?auto_66044 ?auto_66042 ) ( CLEAR ?auto_66044 ) ( HOLDING ?auto_66043 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_66043 )
      ( MAKE-4PILE ?auto_66039 ?auto_66040 ?auto_66041 ?auto_66042 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_66046 - BLOCK
      ?auto_66047 - BLOCK
      ?auto_66048 - BLOCK
      ?auto_66049 - BLOCK
    )
    :vars
    (
      ?auto_66050 - BLOCK
      ?auto_66051 - BLOCK
      ?auto_66052 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66046 ?auto_66047 ) ) ( not ( = ?auto_66046 ?auto_66048 ) ) ( not ( = ?auto_66046 ?auto_66049 ) ) ( not ( = ?auto_66047 ?auto_66048 ) ) ( not ( = ?auto_66047 ?auto_66049 ) ) ( not ( = ?auto_66048 ?auto_66049 ) ) ( not ( = ?auto_66046 ?auto_66050 ) ) ( not ( = ?auto_66047 ?auto_66050 ) ) ( not ( = ?auto_66048 ?auto_66050 ) ) ( not ( = ?auto_66049 ?auto_66050 ) ) ( not ( = ?auto_66051 ?auto_66050 ) ) ( not ( = ?auto_66051 ?auto_66049 ) ) ( not ( = ?auto_66051 ?auto_66048 ) ) ( not ( = ?auto_66046 ?auto_66051 ) ) ( not ( = ?auto_66047 ?auto_66051 ) ) ( ON ?auto_66046 ?auto_66052 ) ( not ( = ?auto_66046 ?auto_66052 ) ) ( not ( = ?auto_66047 ?auto_66052 ) ) ( not ( = ?auto_66048 ?auto_66052 ) ) ( not ( = ?auto_66049 ?auto_66052 ) ) ( not ( = ?auto_66050 ?auto_66052 ) ) ( not ( = ?auto_66051 ?auto_66052 ) ) ( ON ?auto_66047 ?auto_66046 ) ( ON-TABLE ?auto_66052 ) ( ON ?auto_66048 ?auto_66047 ) ( ON ?auto_66049 ?auto_66048 ) ( ON ?auto_66050 ?auto_66049 ) ( ON ?auto_66051 ?auto_66050 ) ( CLEAR ?auto_66051 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_66052 ?auto_66046 ?auto_66047 ?auto_66048 ?auto_66049 ?auto_66050 )
      ( MAKE-4PILE ?auto_66046 ?auto_66047 ?auto_66048 ?auto_66049 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_66064 - BLOCK
    )
    :vars
    (
      ?auto_66065 - BLOCK
      ?auto_66067 - BLOCK
      ?auto_66066 - BLOCK
      ?auto_66068 - BLOCK
      ?auto_66069 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66065 ?auto_66064 ) ( ON-TABLE ?auto_66064 ) ( not ( = ?auto_66064 ?auto_66065 ) ) ( not ( = ?auto_66064 ?auto_66067 ) ) ( not ( = ?auto_66064 ?auto_66066 ) ) ( not ( = ?auto_66065 ?auto_66067 ) ) ( not ( = ?auto_66065 ?auto_66066 ) ) ( not ( = ?auto_66067 ?auto_66066 ) ) ( ON ?auto_66067 ?auto_66065 ) ( CLEAR ?auto_66067 ) ( HOLDING ?auto_66066 ) ( CLEAR ?auto_66068 ) ( ON-TABLE ?auto_66069 ) ( ON ?auto_66068 ?auto_66069 ) ( not ( = ?auto_66069 ?auto_66068 ) ) ( not ( = ?auto_66069 ?auto_66066 ) ) ( not ( = ?auto_66068 ?auto_66066 ) ) ( not ( = ?auto_66064 ?auto_66068 ) ) ( not ( = ?auto_66064 ?auto_66069 ) ) ( not ( = ?auto_66065 ?auto_66068 ) ) ( not ( = ?auto_66065 ?auto_66069 ) ) ( not ( = ?auto_66067 ?auto_66068 ) ) ( not ( = ?auto_66067 ?auto_66069 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_66069 ?auto_66068 ?auto_66066 )
      ( MAKE-1PILE ?auto_66064 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_66070 - BLOCK
    )
    :vars
    (
      ?auto_66071 - BLOCK
      ?auto_66072 - BLOCK
      ?auto_66075 - BLOCK
      ?auto_66074 - BLOCK
      ?auto_66073 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66071 ?auto_66070 ) ( ON-TABLE ?auto_66070 ) ( not ( = ?auto_66070 ?auto_66071 ) ) ( not ( = ?auto_66070 ?auto_66072 ) ) ( not ( = ?auto_66070 ?auto_66075 ) ) ( not ( = ?auto_66071 ?auto_66072 ) ) ( not ( = ?auto_66071 ?auto_66075 ) ) ( not ( = ?auto_66072 ?auto_66075 ) ) ( ON ?auto_66072 ?auto_66071 ) ( CLEAR ?auto_66074 ) ( ON-TABLE ?auto_66073 ) ( ON ?auto_66074 ?auto_66073 ) ( not ( = ?auto_66073 ?auto_66074 ) ) ( not ( = ?auto_66073 ?auto_66075 ) ) ( not ( = ?auto_66074 ?auto_66075 ) ) ( not ( = ?auto_66070 ?auto_66074 ) ) ( not ( = ?auto_66070 ?auto_66073 ) ) ( not ( = ?auto_66071 ?auto_66074 ) ) ( not ( = ?auto_66071 ?auto_66073 ) ) ( not ( = ?auto_66072 ?auto_66074 ) ) ( not ( = ?auto_66072 ?auto_66073 ) ) ( ON ?auto_66075 ?auto_66072 ) ( CLEAR ?auto_66075 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_66070 ?auto_66071 ?auto_66072 )
      ( MAKE-1PILE ?auto_66070 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_66076 - BLOCK
    )
    :vars
    (
      ?auto_66081 - BLOCK
      ?auto_66079 - BLOCK
      ?auto_66080 - BLOCK
      ?auto_66077 - BLOCK
      ?auto_66078 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66081 ?auto_66076 ) ( ON-TABLE ?auto_66076 ) ( not ( = ?auto_66076 ?auto_66081 ) ) ( not ( = ?auto_66076 ?auto_66079 ) ) ( not ( = ?auto_66076 ?auto_66080 ) ) ( not ( = ?auto_66081 ?auto_66079 ) ) ( not ( = ?auto_66081 ?auto_66080 ) ) ( not ( = ?auto_66079 ?auto_66080 ) ) ( ON ?auto_66079 ?auto_66081 ) ( ON-TABLE ?auto_66077 ) ( not ( = ?auto_66077 ?auto_66078 ) ) ( not ( = ?auto_66077 ?auto_66080 ) ) ( not ( = ?auto_66078 ?auto_66080 ) ) ( not ( = ?auto_66076 ?auto_66078 ) ) ( not ( = ?auto_66076 ?auto_66077 ) ) ( not ( = ?auto_66081 ?auto_66078 ) ) ( not ( = ?auto_66081 ?auto_66077 ) ) ( not ( = ?auto_66079 ?auto_66078 ) ) ( not ( = ?auto_66079 ?auto_66077 ) ) ( ON ?auto_66080 ?auto_66079 ) ( CLEAR ?auto_66080 ) ( HOLDING ?auto_66078 ) ( CLEAR ?auto_66077 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_66077 ?auto_66078 )
      ( MAKE-1PILE ?auto_66076 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_66082 - BLOCK
    )
    :vars
    (
      ?auto_66084 - BLOCK
      ?auto_66086 - BLOCK
      ?auto_66083 - BLOCK
      ?auto_66085 - BLOCK
      ?auto_66087 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66084 ?auto_66082 ) ( ON-TABLE ?auto_66082 ) ( not ( = ?auto_66082 ?auto_66084 ) ) ( not ( = ?auto_66082 ?auto_66086 ) ) ( not ( = ?auto_66082 ?auto_66083 ) ) ( not ( = ?auto_66084 ?auto_66086 ) ) ( not ( = ?auto_66084 ?auto_66083 ) ) ( not ( = ?auto_66086 ?auto_66083 ) ) ( ON ?auto_66086 ?auto_66084 ) ( ON-TABLE ?auto_66085 ) ( not ( = ?auto_66085 ?auto_66087 ) ) ( not ( = ?auto_66085 ?auto_66083 ) ) ( not ( = ?auto_66087 ?auto_66083 ) ) ( not ( = ?auto_66082 ?auto_66087 ) ) ( not ( = ?auto_66082 ?auto_66085 ) ) ( not ( = ?auto_66084 ?auto_66087 ) ) ( not ( = ?auto_66084 ?auto_66085 ) ) ( not ( = ?auto_66086 ?auto_66087 ) ) ( not ( = ?auto_66086 ?auto_66085 ) ) ( ON ?auto_66083 ?auto_66086 ) ( CLEAR ?auto_66085 ) ( ON ?auto_66087 ?auto_66083 ) ( CLEAR ?auto_66087 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_66082 ?auto_66084 ?auto_66086 ?auto_66083 )
      ( MAKE-1PILE ?auto_66082 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_66088 - BLOCK
    )
    :vars
    (
      ?auto_66093 - BLOCK
      ?auto_66089 - BLOCK
      ?auto_66091 - BLOCK
      ?auto_66092 - BLOCK
      ?auto_66090 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66093 ?auto_66088 ) ( ON-TABLE ?auto_66088 ) ( not ( = ?auto_66088 ?auto_66093 ) ) ( not ( = ?auto_66088 ?auto_66089 ) ) ( not ( = ?auto_66088 ?auto_66091 ) ) ( not ( = ?auto_66093 ?auto_66089 ) ) ( not ( = ?auto_66093 ?auto_66091 ) ) ( not ( = ?auto_66089 ?auto_66091 ) ) ( ON ?auto_66089 ?auto_66093 ) ( not ( = ?auto_66092 ?auto_66090 ) ) ( not ( = ?auto_66092 ?auto_66091 ) ) ( not ( = ?auto_66090 ?auto_66091 ) ) ( not ( = ?auto_66088 ?auto_66090 ) ) ( not ( = ?auto_66088 ?auto_66092 ) ) ( not ( = ?auto_66093 ?auto_66090 ) ) ( not ( = ?auto_66093 ?auto_66092 ) ) ( not ( = ?auto_66089 ?auto_66090 ) ) ( not ( = ?auto_66089 ?auto_66092 ) ) ( ON ?auto_66091 ?auto_66089 ) ( ON ?auto_66090 ?auto_66091 ) ( CLEAR ?auto_66090 ) ( HOLDING ?auto_66092 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_66092 )
      ( MAKE-1PILE ?auto_66088 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_66101 - BLOCK
    )
    :vars
    (
      ?auto_66104 - BLOCK
      ?auto_66103 - BLOCK
      ?auto_66102 - BLOCK
      ?auto_66105 - BLOCK
      ?auto_66106 - BLOCK
      ?auto_66107 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66104 ?auto_66101 ) ( ON-TABLE ?auto_66101 ) ( not ( = ?auto_66101 ?auto_66104 ) ) ( not ( = ?auto_66101 ?auto_66103 ) ) ( not ( = ?auto_66101 ?auto_66102 ) ) ( not ( = ?auto_66104 ?auto_66103 ) ) ( not ( = ?auto_66104 ?auto_66102 ) ) ( not ( = ?auto_66103 ?auto_66102 ) ) ( ON ?auto_66103 ?auto_66104 ) ( not ( = ?auto_66105 ?auto_66106 ) ) ( not ( = ?auto_66105 ?auto_66102 ) ) ( not ( = ?auto_66106 ?auto_66102 ) ) ( not ( = ?auto_66101 ?auto_66106 ) ) ( not ( = ?auto_66101 ?auto_66105 ) ) ( not ( = ?auto_66104 ?auto_66106 ) ) ( not ( = ?auto_66104 ?auto_66105 ) ) ( not ( = ?auto_66103 ?auto_66106 ) ) ( not ( = ?auto_66103 ?auto_66105 ) ) ( ON ?auto_66102 ?auto_66103 ) ( ON ?auto_66106 ?auto_66102 ) ( CLEAR ?auto_66106 ) ( ON ?auto_66105 ?auto_66107 ) ( CLEAR ?auto_66105 ) ( HAND-EMPTY ) ( not ( = ?auto_66101 ?auto_66107 ) ) ( not ( = ?auto_66104 ?auto_66107 ) ) ( not ( = ?auto_66103 ?auto_66107 ) ) ( not ( = ?auto_66102 ?auto_66107 ) ) ( not ( = ?auto_66105 ?auto_66107 ) ) ( not ( = ?auto_66106 ?auto_66107 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_66105 ?auto_66107 )
      ( MAKE-1PILE ?auto_66101 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_66108 - BLOCK
    )
    :vars
    (
      ?auto_66111 - BLOCK
      ?auto_66113 - BLOCK
      ?auto_66110 - BLOCK
      ?auto_66114 - BLOCK
      ?auto_66112 - BLOCK
      ?auto_66109 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66111 ?auto_66108 ) ( ON-TABLE ?auto_66108 ) ( not ( = ?auto_66108 ?auto_66111 ) ) ( not ( = ?auto_66108 ?auto_66113 ) ) ( not ( = ?auto_66108 ?auto_66110 ) ) ( not ( = ?auto_66111 ?auto_66113 ) ) ( not ( = ?auto_66111 ?auto_66110 ) ) ( not ( = ?auto_66113 ?auto_66110 ) ) ( ON ?auto_66113 ?auto_66111 ) ( not ( = ?auto_66114 ?auto_66112 ) ) ( not ( = ?auto_66114 ?auto_66110 ) ) ( not ( = ?auto_66112 ?auto_66110 ) ) ( not ( = ?auto_66108 ?auto_66112 ) ) ( not ( = ?auto_66108 ?auto_66114 ) ) ( not ( = ?auto_66111 ?auto_66112 ) ) ( not ( = ?auto_66111 ?auto_66114 ) ) ( not ( = ?auto_66113 ?auto_66112 ) ) ( not ( = ?auto_66113 ?auto_66114 ) ) ( ON ?auto_66110 ?auto_66113 ) ( ON ?auto_66114 ?auto_66109 ) ( CLEAR ?auto_66114 ) ( not ( = ?auto_66108 ?auto_66109 ) ) ( not ( = ?auto_66111 ?auto_66109 ) ) ( not ( = ?auto_66113 ?auto_66109 ) ) ( not ( = ?auto_66110 ?auto_66109 ) ) ( not ( = ?auto_66114 ?auto_66109 ) ) ( not ( = ?auto_66112 ?auto_66109 ) ) ( HOLDING ?auto_66112 ) ( CLEAR ?auto_66110 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_66108 ?auto_66111 ?auto_66113 ?auto_66110 ?auto_66112 )
      ( MAKE-1PILE ?auto_66108 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_66115 - BLOCK
    )
    :vars
    (
      ?auto_66116 - BLOCK
      ?auto_66121 - BLOCK
      ?auto_66119 - BLOCK
      ?auto_66118 - BLOCK
      ?auto_66117 - BLOCK
      ?auto_66120 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66116 ?auto_66115 ) ( ON-TABLE ?auto_66115 ) ( not ( = ?auto_66115 ?auto_66116 ) ) ( not ( = ?auto_66115 ?auto_66121 ) ) ( not ( = ?auto_66115 ?auto_66119 ) ) ( not ( = ?auto_66116 ?auto_66121 ) ) ( not ( = ?auto_66116 ?auto_66119 ) ) ( not ( = ?auto_66121 ?auto_66119 ) ) ( ON ?auto_66121 ?auto_66116 ) ( not ( = ?auto_66118 ?auto_66117 ) ) ( not ( = ?auto_66118 ?auto_66119 ) ) ( not ( = ?auto_66117 ?auto_66119 ) ) ( not ( = ?auto_66115 ?auto_66117 ) ) ( not ( = ?auto_66115 ?auto_66118 ) ) ( not ( = ?auto_66116 ?auto_66117 ) ) ( not ( = ?auto_66116 ?auto_66118 ) ) ( not ( = ?auto_66121 ?auto_66117 ) ) ( not ( = ?auto_66121 ?auto_66118 ) ) ( ON ?auto_66119 ?auto_66121 ) ( ON ?auto_66118 ?auto_66120 ) ( not ( = ?auto_66115 ?auto_66120 ) ) ( not ( = ?auto_66116 ?auto_66120 ) ) ( not ( = ?auto_66121 ?auto_66120 ) ) ( not ( = ?auto_66119 ?auto_66120 ) ) ( not ( = ?auto_66118 ?auto_66120 ) ) ( not ( = ?auto_66117 ?auto_66120 ) ) ( CLEAR ?auto_66119 ) ( ON ?auto_66117 ?auto_66118 ) ( CLEAR ?auto_66117 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_66120 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_66120 ?auto_66118 )
      ( MAKE-1PILE ?auto_66115 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_66155 - BLOCK
      ?auto_66156 - BLOCK
      ?auto_66157 - BLOCK
      ?auto_66158 - BLOCK
      ?auto_66159 - BLOCK
    )
    :vars
    (
      ?auto_66160 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_66155 ) ( ON ?auto_66156 ?auto_66155 ) ( ON ?auto_66157 ?auto_66156 ) ( not ( = ?auto_66155 ?auto_66156 ) ) ( not ( = ?auto_66155 ?auto_66157 ) ) ( not ( = ?auto_66155 ?auto_66158 ) ) ( not ( = ?auto_66155 ?auto_66159 ) ) ( not ( = ?auto_66156 ?auto_66157 ) ) ( not ( = ?auto_66156 ?auto_66158 ) ) ( not ( = ?auto_66156 ?auto_66159 ) ) ( not ( = ?auto_66157 ?auto_66158 ) ) ( not ( = ?auto_66157 ?auto_66159 ) ) ( not ( = ?auto_66158 ?auto_66159 ) ) ( ON ?auto_66159 ?auto_66160 ) ( not ( = ?auto_66155 ?auto_66160 ) ) ( not ( = ?auto_66156 ?auto_66160 ) ) ( not ( = ?auto_66157 ?auto_66160 ) ) ( not ( = ?auto_66158 ?auto_66160 ) ) ( not ( = ?auto_66159 ?auto_66160 ) ) ( CLEAR ?auto_66157 ) ( ON ?auto_66158 ?auto_66159 ) ( CLEAR ?auto_66158 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_66160 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_66160 ?auto_66159 )
      ( MAKE-5PILE ?auto_66155 ?auto_66156 ?auto_66157 ?auto_66158 ?auto_66159 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_66161 - BLOCK
      ?auto_66162 - BLOCK
      ?auto_66163 - BLOCK
      ?auto_66164 - BLOCK
      ?auto_66165 - BLOCK
    )
    :vars
    (
      ?auto_66166 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_66161 ) ( ON ?auto_66162 ?auto_66161 ) ( not ( = ?auto_66161 ?auto_66162 ) ) ( not ( = ?auto_66161 ?auto_66163 ) ) ( not ( = ?auto_66161 ?auto_66164 ) ) ( not ( = ?auto_66161 ?auto_66165 ) ) ( not ( = ?auto_66162 ?auto_66163 ) ) ( not ( = ?auto_66162 ?auto_66164 ) ) ( not ( = ?auto_66162 ?auto_66165 ) ) ( not ( = ?auto_66163 ?auto_66164 ) ) ( not ( = ?auto_66163 ?auto_66165 ) ) ( not ( = ?auto_66164 ?auto_66165 ) ) ( ON ?auto_66165 ?auto_66166 ) ( not ( = ?auto_66161 ?auto_66166 ) ) ( not ( = ?auto_66162 ?auto_66166 ) ) ( not ( = ?auto_66163 ?auto_66166 ) ) ( not ( = ?auto_66164 ?auto_66166 ) ) ( not ( = ?auto_66165 ?auto_66166 ) ) ( ON ?auto_66164 ?auto_66165 ) ( CLEAR ?auto_66164 ) ( ON-TABLE ?auto_66166 ) ( HOLDING ?auto_66163 ) ( CLEAR ?auto_66162 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_66161 ?auto_66162 ?auto_66163 )
      ( MAKE-5PILE ?auto_66161 ?auto_66162 ?auto_66163 ?auto_66164 ?auto_66165 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_66167 - BLOCK
      ?auto_66168 - BLOCK
      ?auto_66169 - BLOCK
      ?auto_66170 - BLOCK
      ?auto_66171 - BLOCK
    )
    :vars
    (
      ?auto_66172 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_66167 ) ( ON ?auto_66168 ?auto_66167 ) ( not ( = ?auto_66167 ?auto_66168 ) ) ( not ( = ?auto_66167 ?auto_66169 ) ) ( not ( = ?auto_66167 ?auto_66170 ) ) ( not ( = ?auto_66167 ?auto_66171 ) ) ( not ( = ?auto_66168 ?auto_66169 ) ) ( not ( = ?auto_66168 ?auto_66170 ) ) ( not ( = ?auto_66168 ?auto_66171 ) ) ( not ( = ?auto_66169 ?auto_66170 ) ) ( not ( = ?auto_66169 ?auto_66171 ) ) ( not ( = ?auto_66170 ?auto_66171 ) ) ( ON ?auto_66171 ?auto_66172 ) ( not ( = ?auto_66167 ?auto_66172 ) ) ( not ( = ?auto_66168 ?auto_66172 ) ) ( not ( = ?auto_66169 ?auto_66172 ) ) ( not ( = ?auto_66170 ?auto_66172 ) ) ( not ( = ?auto_66171 ?auto_66172 ) ) ( ON ?auto_66170 ?auto_66171 ) ( ON-TABLE ?auto_66172 ) ( CLEAR ?auto_66168 ) ( ON ?auto_66169 ?auto_66170 ) ( CLEAR ?auto_66169 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_66172 ?auto_66171 ?auto_66170 )
      ( MAKE-5PILE ?auto_66167 ?auto_66168 ?auto_66169 ?auto_66170 ?auto_66171 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_66173 - BLOCK
      ?auto_66174 - BLOCK
      ?auto_66175 - BLOCK
      ?auto_66176 - BLOCK
      ?auto_66177 - BLOCK
    )
    :vars
    (
      ?auto_66178 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_66173 ) ( not ( = ?auto_66173 ?auto_66174 ) ) ( not ( = ?auto_66173 ?auto_66175 ) ) ( not ( = ?auto_66173 ?auto_66176 ) ) ( not ( = ?auto_66173 ?auto_66177 ) ) ( not ( = ?auto_66174 ?auto_66175 ) ) ( not ( = ?auto_66174 ?auto_66176 ) ) ( not ( = ?auto_66174 ?auto_66177 ) ) ( not ( = ?auto_66175 ?auto_66176 ) ) ( not ( = ?auto_66175 ?auto_66177 ) ) ( not ( = ?auto_66176 ?auto_66177 ) ) ( ON ?auto_66177 ?auto_66178 ) ( not ( = ?auto_66173 ?auto_66178 ) ) ( not ( = ?auto_66174 ?auto_66178 ) ) ( not ( = ?auto_66175 ?auto_66178 ) ) ( not ( = ?auto_66176 ?auto_66178 ) ) ( not ( = ?auto_66177 ?auto_66178 ) ) ( ON ?auto_66176 ?auto_66177 ) ( ON-TABLE ?auto_66178 ) ( ON ?auto_66175 ?auto_66176 ) ( CLEAR ?auto_66175 ) ( HOLDING ?auto_66174 ) ( CLEAR ?auto_66173 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_66173 ?auto_66174 )
      ( MAKE-5PILE ?auto_66173 ?auto_66174 ?auto_66175 ?auto_66176 ?auto_66177 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_66179 - BLOCK
      ?auto_66180 - BLOCK
      ?auto_66181 - BLOCK
      ?auto_66182 - BLOCK
      ?auto_66183 - BLOCK
    )
    :vars
    (
      ?auto_66184 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_66179 ) ( not ( = ?auto_66179 ?auto_66180 ) ) ( not ( = ?auto_66179 ?auto_66181 ) ) ( not ( = ?auto_66179 ?auto_66182 ) ) ( not ( = ?auto_66179 ?auto_66183 ) ) ( not ( = ?auto_66180 ?auto_66181 ) ) ( not ( = ?auto_66180 ?auto_66182 ) ) ( not ( = ?auto_66180 ?auto_66183 ) ) ( not ( = ?auto_66181 ?auto_66182 ) ) ( not ( = ?auto_66181 ?auto_66183 ) ) ( not ( = ?auto_66182 ?auto_66183 ) ) ( ON ?auto_66183 ?auto_66184 ) ( not ( = ?auto_66179 ?auto_66184 ) ) ( not ( = ?auto_66180 ?auto_66184 ) ) ( not ( = ?auto_66181 ?auto_66184 ) ) ( not ( = ?auto_66182 ?auto_66184 ) ) ( not ( = ?auto_66183 ?auto_66184 ) ) ( ON ?auto_66182 ?auto_66183 ) ( ON-TABLE ?auto_66184 ) ( ON ?auto_66181 ?auto_66182 ) ( CLEAR ?auto_66179 ) ( ON ?auto_66180 ?auto_66181 ) ( CLEAR ?auto_66180 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_66184 ?auto_66183 ?auto_66182 ?auto_66181 )
      ( MAKE-5PILE ?auto_66179 ?auto_66180 ?auto_66181 ?auto_66182 ?auto_66183 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_66185 - BLOCK
      ?auto_66186 - BLOCK
      ?auto_66187 - BLOCK
      ?auto_66188 - BLOCK
      ?auto_66189 - BLOCK
    )
    :vars
    (
      ?auto_66190 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66185 ?auto_66186 ) ) ( not ( = ?auto_66185 ?auto_66187 ) ) ( not ( = ?auto_66185 ?auto_66188 ) ) ( not ( = ?auto_66185 ?auto_66189 ) ) ( not ( = ?auto_66186 ?auto_66187 ) ) ( not ( = ?auto_66186 ?auto_66188 ) ) ( not ( = ?auto_66186 ?auto_66189 ) ) ( not ( = ?auto_66187 ?auto_66188 ) ) ( not ( = ?auto_66187 ?auto_66189 ) ) ( not ( = ?auto_66188 ?auto_66189 ) ) ( ON ?auto_66189 ?auto_66190 ) ( not ( = ?auto_66185 ?auto_66190 ) ) ( not ( = ?auto_66186 ?auto_66190 ) ) ( not ( = ?auto_66187 ?auto_66190 ) ) ( not ( = ?auto_66188 ?auto_66190 ) ) ( not ( = ?auto_66189 ?auto_66190 ) ) ( ON ?auto_66188 ?auto_66189 ) ( ON-TABLE ?auto_66190 ) ( ON ?auto_66187 ?auto_66188 ) ( ON ?auto_66186 ?auto_66187 ) ( CLEAR ?auto_66186 ) ( HOLDING ?auto_66185 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_66185 )
      ( MAKE-5PILE ?auto_66185 ?auto_66186 ?auto_66187 ?auto_66188 ?auto_66189 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_66191 - BLOCK
      ?auto_66192 - BLOCK
      ?auto_66193 - BLOCK
      ?auto_66194 - BLOCK
      ?auto_66195 - BLOCK
    )
    :vars
    (
      ?auto_66196 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66191 ?auto_66192 ) ) ( not ( = ?auto_66191 ?auto_66193 ) ) ( not ( = ?auto_66191 ?auto_66194 ) ) ( not ( = ?auto_66191 ?auto_66195 ) ) ( not ( = ?auto_66192 ?auto_66193 ) ) ( not ( = ?auto_66192 ?auto_66194 ) ) ( not ( = ?auto_66192 ?auto_66195 ) ) ( not ( = ?auto_66193 ?auto_66194 ) ) ( not ( = ?auto_66193 ?auto_66195 ) ) ( not ( = ?auto_66194 ?auto_66195 ) ) ( ON ?auto_66195 ?auto_66196 ) ( not ( = ?auto_66191 ?auto_66196 ) ) ( not ( = ?auto_66192 ?auto_66196 ) ) ( not ( = ?auto_66193 ?auto_66196 ) ) ( not ( = ?auto_66194 ?auto_66196 ) ) ( not ( = ?auto_66195 ?auto_66196 ) ) ( ON ?auto_66194 ?auto_66195 ) ( ON-TABLE ?auto_66196 ) ( ON ?auto_66193 ?auto_66194 ) ( ON ?auto_66192 ?auto_66193 ) ( ON ?auto_66191 ?auto_66192 ) ( CLEAR ?auto_66191 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_66196 ?auto_66195 ?auto_66194 ?auto_66193 ?auto_66192 )
      ( MAKE-5PILE ?auto_66191 ?auto_66192 ?auto_66193 ?auto_66194 ?auto_66195 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_66202 - BLOCK
      ?auto_66203 - BLOCK
      ?auto_66204 - BLOCK
      ?auto_66205 - BLOCK
      ?auto_66206 - BLOCK
    )
    :vars
    (
      ?auto_66207 - BLOCK
      ?auto_66208 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66202 ?auto_66203 ) ) ( not ( = ?auto_66202 ?auto_66204 ) ) ( not ( = ?auto_66202 ?auto_66205 ) ) ( not ( = ?auto_66202 ?auto_66206 ) ) ( not ( = ?auto_66203 ?auto_66204 ) ) ( not ( = ?auto_66203 ?auto_66205 ) ) ( not ( = ?auto_66203 ?auto_66206 ) ) ( not ( = ?auto_66204 ?auto_66205 ) ) ( not ( = ?auto_66204 ?auto_66206 ) ) ( not ( = ?auto_66205 ?auto_66206 ) ) ( ON ?auto_66206 ?auto_66207 ) ( not ( = ?auto_66202 ?auto_66207 ) ) ( not ( = ?auto_66203 ?auto_66207 ) ) ( not ( = ?auto_66204 ?auto_66207 ) ) ( not ( = ?auto_66205 ?auto_66207 ) ) ( not ( = ?auto_66206 ?auto_66207 ) ) ( ON ?auto_66205 ?auto_66206 ) ( ON-TABLE ?auto_66207 ) ( ON ?auto_66204 ?auto_66205 ) ( ON ?auto_66203 ?auto_66204 ) ( CLEAR ?auto_66203 ) ( ON ?auto_66202 ?auto_66208 ) ( CLEAR ?auto_66202 ) ( HAND-EMPTY ) ( not ( = ?auto_66202 ?auto_66208 ) ) ( not ( = ?auto_66203 ?auto_66208 ) ) ( not ( = ?auto_66204 ?auto_66208 ) ) ( not ( = ?auto_66205 ?auto_66208 ) ) ( not ( = ?auto_66206 ?auto_66208 ) ) ( not ( = ?auto_66207 ?auto_66208 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_66202 ?auto_66208 )
      ( MAKE-5PILE ?auto_66202 ?auto_66203 ?auto_66204 ?auto_66205 ?auto_66206 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_66209 - BLOCK
      ?auto_66210 - BLOCK
      ?auto_66211 - BLOCK
      ?auto_66212 - BLOCK
      ?auto_66213 - BLOCK
    )
    :vars
    (
      ?auto_66215 - BLOCK
      ?auto_66214 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66209 ?auto_66210 ) ) ( not ( = ?auto_66209 ?auto_66211 ) ) ( not ( = ?auto_66209 ?auto_66212 ) ) ( not ( = ?auto_66209 ?auto_66213 ) ) ( not ( = ?auto_66210 ?auto_66211 ) ) ( not ( = ?auto_66210 ?auto_66212 ) ) ( not ( = ?auto_66210 ?auto_66213 ) ) ( not ( = ?auto_66211 ?auto_66212 ) ) ( not ( = ?auto_66211 ?auto_66213 ) ) ( not ( = ?auto_66212 ?auto_66213 ) ) ( ON ?auto_66213 ?auto_66215 ) ( not ( = ?auto_66209 ?auto_66215 ) ) ( not ( = ?auto_66210 ?auto_66215 ) ) ( not ( = ?auto_66211 ?auto_66215 ) ) ( not ( = ?auto_66212 ?auto_66215 ) ) ( not ( = ?auto_66213 ?auto_66215 ) ) ( ON ?auto_66212 ?auto_66213 ) ( ON-TABLE ?auto_66215 ) ( ON ?auto_66211 ?auto_66212 ) ( ON ?auto_66209 ?auto_66214 ) ( CLEAR ?auto_66209 ) ( not ( = ?auto_66209 ?auto_66214 ) ) ( not ( = ?auto_66210 ?auto_66214 ) ) ( not ( = ?auto_66211 ?auto_66214 ) ) ( not ( = ?auto_66212 ?auto_66214 ) ) ( not ( = ?auto_66213 ?auto_66214 ) ) ( not ( = ?auto_66215 ?auto_66214 ) ) ( HOLDING ?auto_66210 ) ( CLEAR ?auto_66211 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_66215 ?auto_66213 ?auto_66212 ?auto_66211 ?auto_66210 )
      ( MAKE-5PILE ?auto_66209 ?auto_66210 ?auto_66211 ?auto_66212 ?auto_66213 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_66216 - BLOCK
      ?auto_66217 - BLOCK
      ?auto_66218 - BLOCK
      ?auto_66219 - BLOCK
      ?auto_66220 - BLOCK
    )
    :vars
    (
      ?auto_66221 - BLOCK
      ?auto_66222 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66216 ?auto_66217 ) ) ( not ( = ?auto_66216 ?auto_66218 ) ) ( not ( = ?auto_66216 ?auto_66219 ) ) ( not ( = ?auto_66216 ?auto_66220 ) ) ( not ( = ?auto_66217 ?auto_66218 ) ) ( not ( = ?auto_66217 ?auto_66219 ) ) ( not ( = ?auto_66217 ?auto_66220 ) ) ( not ( = ?auto_66218 ?auto_66219 ) ) ( not ( = ?auto_66218 ?auto_66220 ) ) ( not ( = ?auto_66219 ?auto_66220 ) ) ( ON ?auto_66220 ?auto_66221 ) ( not ( = ?auto_66216 ?auto_66221 ) ) ( not ( = ?auto_66217 ?auto_66221 ) ) ( not ( = ?auto_66218 ?auto_66221 ) ) ( not ( = ?auto_66219 ?auto_66221 ) ) ( not ( = ?auto_66220 ?auto_66221 ) ) ( ON ?auto_66219 ?auto_66220 ) ( ON-TABLE ?auto_66221 ) ( ON ?auto_66218 ?auto_66219 ) ( ON ?auto_66216 ?auto_66222 ) ( not ( = ?auto_66216 ?auto_66222 ) ) ( not ( = ?auto_66217 ?auto_66222 ) ) ( not ( = ?auto_66218 ?auto_66222 ) ) ( not ( = ?auto_66219 ?auto_66222 ) ) ( not ( = ?auto_66220 ?auto_66222 ) ) ( not ( = ?auto_66221 ?auto_66222 ) ) ( CLEAR ?auto_66218 ) ( ON ?auto_66217 ?auto_66216 ) ( CLEAR ?auto_66217 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_66222 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_66222 ?auto_66216 )
      ( MAKE-5PILE ?auto_66216 ?auto_66217 ?auto_66218 ?auto_66219 ?auto_66220 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_66223 - BLOCK
      ?auto_66224 - BLOCK
      ?auto_66225 - BLOCK
      ?auto_66226 - BLOCK
      ?auto_66227 - BLOCK
    )
    :vars
    (
      ?auto_66229 - BLOCK
      ?auto_66228 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66223 ?auto_66224 ) ) ( not ( = ?auto_66223 ?auto_66225 ) ) ( not ( = ?auto_66223 ?auto_66226 ) ) ( not ( = ?auto_66223 ?auto_66227 ) ) ( not ( = ?auto_66224 ?auto_66225 ) ) ( not ( = ?auto_66224 ?auto_66226 ) ) ( not ( = ?auto_66224 ?auto_66227 ) ) ( not ( = ?auto_66225 ?auto_66226 ) ) ( not ( = ?auto_66225 ?auto_66227 ) ) ( not ( = ?auto_66226 ?auto_66227 ) ) ( ON ?auto_66227 ?auto_66229 ) ( not ( = ?auto_66223 ?auto_66229 ) ) ( not ( = ?auto_66224 ?auto_66229 ) ) ( not ( = ?auto_66225 ?auto_66229 ) ) ( not ( = ?auto_66226 ?auto_66229 ) ) ( not ( = ?auto_66227 ?auto_66229 ) ) ( ON ?auto_66226 ?auto_66227 ) ( ON-TABLE ?auto_66229 ) ( ON ?auto_66223 ?auto_66228 ) ( not ( = ?auto_66223 ?auto_66228 ) ) ( not ( = ?auto_66224 ?auto_66228 ) ) ( not ( = ?auto_66225 ?auto_66228 ) ) ( not ( = ?auto_66226 ?auto_66228 ) ) ( not ( = ?auto_66227 ?auto_66228 ) ) ( not ( = ?auto_66229 ?auto_66228 ) ) ( ON ?auto_66224 ?auto_66223 ) ( CLEAR ?auto_66224 ) ( ON-TABLE ?auto_66228 ) ( HOLDING ?auto_66225 ) ( CLEAR ?auto_66226 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_66229 ?auto_66227 ?auto_66226 ?auto_66225 )
      ( MAKE-5PILE ?auto_66223 ?auto_66224 ?auto_66225 ?auto_66226 ?auto_66227 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_66230 - BLOCK
      ?auto_66231 - BLOCK
      ?auto_66232 - BLOCK
      ?auto_66233 - BLOCK
      ?auto_66234 - BLOCK
    )
    :vars
    (
      ?auto_66235 - BLOCK
      ?auto_66236 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66230 ?auto_66231 ) ) ( not ( = ?auto_66230 ?auto_66232 ) ) ( not ( = ?auto_66230 ?auto_66233 ) ) ( not ( = ?auto_66230 ?auto_66234 ) ) ( not ( = ?auto_66231 ?auto_66232 ) ) ( not ( = ?auto_66231 ?auto_66233 ) ) ( not ( = ?auto_66231 ?auto_66234 ) ) ( not ( = ?auto_66232 ?auto_66233 ) ) ( not ( = ?auto_66232 ?auto_66234 ) ) ( not ( = ?auto_66233 ?auto_66234 ) ) ( ON ?auto_66234 ?auto_66235 ) ( not ( = ?auto_66230 ?auto_66235 ) ) ( not ( = ?auto_66231 ?auto_66235 ) ) ( not ( = ?auto_66232 ?auto_66235 ) ) ( not ( = ?auto_66233 ?auto_66235 ) ) ( not ( = ?auto_66234 ?auto_66235 ) ) ( ON ?auto_66233 ?auto_66234 ) ( ON-TABLE ?auto_66235 ) ( ON ?auto_66230 ?auto_66236 ) ( not ( = ?auto_66230 ?auto_66236 ) ) ( not ( = ?auto_66231 ?auto_66236 ) ) ( not ( = ?auto_66232 ?auto_66236 ) ) ( not ( = ?auto_66233 ?auto_66236 ) ) ( not ( = ?auto_66234 ?auto_66236 ) ) ( not ( = ?auto_66235 ?auto_66236 ) ) ( ON ?auto_66231 ?auto_66230 ) ( ON-TABLE ?auto_66236 ) ( CLEAR ?auto_66233 ) ( ON ?auto_66232 ?auto_66231 ) ( CLEAR ?auto_66232 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_66236 ?auto_66230 ?auto_66231 )
      ( MAKE-5PILE ?auto_66230 ?auto_66231 ?auto_66232 ?auto_66233 ?auto_66234 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_66237 - BLOCK
      ?auto_66238 - BLOCK
      ?auto_66239 - BLOCK
      ?auto_66240 - BLOCK
      ?auto_66241 - BLOCK
    )
    :vars
    (
      ?auto_66243 - BLOCK
      ?auto_66242 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66237 ?auto_66238 ) ) ( not ( = ?auto_66237 ?auto_66239 ) ) ( not ( = ?auto_66237 ?auto_66240 ) ) ( not ( = ?auto_66237 ?auto_66241 ) ) ( not ( = ?auto_66238 ?auto_66239 ) ) ( not ( = ?auto_66238 ?auto_66240 ) ) ( not ( = ?auto_66238 ?auto_66241 ) ) ( not ( = ?auto_66239 ?auto_66240 ) ) ( not ( = ?auto_66239 ?auto_66241 ) ) ( not ( = ?auto_66240 ?auto_66241 ) ) ( ON ?auto_66241 ?auto_66243 ) ( not ( = ?auto_66237 ?auto_66243 ) ) ( not ( = ?auto_66238 ?auto_66243 ) ) ( not ( = ?auto_66239 ?auto_66243 ) ) ( not ( = ?auto_66240 ?auto_66243 ) ) ( not ( = ?auto_66241 ?auto_66243 ) ) ( ON-TABLE ?auto_66243 ) ( ON ?auto_66237 ?auto_66242 ) ( not ( = ?auto_66237 ?auto_66242 ) ) ( not ( = ?auto_66238 ?auto_66242 ) ) ( not ( = ?auto_66239 ?auto_66242 ) ) ( not ( = ?auto_66240 ?auto_66242 ) ) ( not ( = ?auto_66241 ?auto_66242 ) ) ( not ( = ?auto_66243 ?auto_66242 ) ) ( ON ?auto_66238 ?auto_66237 ) ( ON-TABLE ?auto_66242 ) ( ON ?auto_66239 ?auto_66238 ) ( CLEAR ?auto_66239 ) ( HOLDING ?auto_66240 ) ( CLEAR ?auto_66241 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_66243 ?auto_66241 ?auto_66240 )
      ( MAKE-5PILE ?auto_66237 ?auto_66238 ?auto_66239 ?auto_66240 ?auto_66241 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_66244 - BLOCK
      ?auto_66245 - BLOCK
      ?auto_66246 - BLOCK
      ?auto_66247 - BLOCK
      ?auto_66248 - BLOCK
    )
    :vars
    (
      ?auto_66250 - BLOCK
      ?auto_66249 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66244 ?auto_66245 ) ) ( not ( = ?auto_66244 ?auto_66246 ) ) ( not ( = ?auto_66244 ?auto_66247 ) ) ( not ( = ?auto_66244 ?auto_66248 ) ) ( not ( = ?auto_66245 ?auto_66246 ) ) ( not ( = ?auto_66245 ?auto_66247 ) ) ( not ( = ?auto_66245 ?auto_66248 ) ) ( not ( = ?auto_66246 ?auto_66247 ) ) ( not ( = ?auto_66246 ?auto_66248 ) ) ( not ( = ?auto_66247 ?auto_66248 ) ) ( ON ?auto_66248 ?auto_66250 ) ( not ( = ?auto_66244 ?auto_66250 ) ) ( not ( = ?auto_66245 ?auto_66250 ) ) ( not ( = ?auto_66246 ?auto_66250 ) ) ( not ( = ?auto_66247 ?auto_66250 ) ) ( not ( = ?auto_66248 ?auto_66250 ) ) ( ON-TABLE ?auto_66250 ) ( ON ?auto_66244 ?auto_66249 ) ( not ( = ?auto_66244 ?auto_66249 ) ) ( not ( = ?auto_66245 ?auto_66249 ) ) ( not ( = ?auto_66246 ?auto_66249 ) ) ( not ( = ?auto_66247 ?auto_66249 ) ) ( not ( = ?auto_66248 ?auto_66249 ) ) ( not ( = ?auto_66250 ?auto_66249 ) ) ( ON ?auto_66245 ?auto_66244 ) ( ON-TABLE ?auto_66249 ) ( ON ?auto_66246 ?auto_66245 ) ( CLEAR ?auto_66248 ) ( ON ?auto_66247 ?auto_66246 ) ( CLEAR ?auto_66247 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_66249 ?auto_66244 ?auto_66245 ?auto_66246 )
      ( MAKE-5PILE ?auto_66244 ?auto_66245 ?auto_66246 ?auto_66247 ?auto_66248 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_66251 - BLOCK
      ?auto_66252 - BLOCK
      ?auto_66253 - BLOCK
      ?auto_66254 - BLOCK
      ?auto_66255 - BLOCK
    )
    :vars
    (
      ?auto_66257 - BLOCK
      ?auto_66256 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66251 ?auto_66252 ) ) ( not ( = ?auto_66251 ?auto_66253 ) ) ( not ( = ?auto_66251 ?auto_66254 ) ) ( not ( = ?auto_66251 ?auto_66255 ) ) ( not ( = ?auto_66252 ?auto_66253 ) ) ( not ( = ?auto_66252 ?auto_66254 ) ) ( not ( = ?auto_66252 ?auto_66255 ) ) ( not ( = ?auto_66253 ?auto_66254 ) ) ( not ( = ?auto_66253 ?auto_66255 ) ) ( not ( = ?auto_66254 ?auto_66255 ) ) ( not ( = ?auto_66251 ?auto_66257 ) ) ( not ( = ?auto_66252 ?auto_66257 ) ) ( not ( = ?auto_66253 ?auto_66257 ) ) ( not ( = ?auto_66254 ?auto_66257 ) ) ( not ( = ?auto_66255 ?auto_66257 ) ) ( ON-TABLE ?auto_66257 ) ( ON ?auto_66251 ?auto_66256 ) ( not ( = ?auto_66251 ?auto_66256 ) ) ( not ( = ?auto_66252 ?auto_66256 ) ) ( not ( = ?auto_66253 ?auto_66256 ) ) ( not ( = ?auto_66254 ?auto_66256 ) ) ( not ( = ?auto_66255 ?auto_66256 ) ) ( not ( = ?auto_66257 ?auto_66256 ) ) ( ON ?auto_66252 ?auto_66251 ) ( ON-TABLE ?auto_66256 ) ( ON ?auto_66253 ?auto_66252 ) ( ON ?auto_66254 ?auto_66253 ) ( CLEAR ?auto_66254 ) ( HOLDING ?auto_66255 ) ( CLEAR ?auto_66257 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_66257 ?auto_66255 )
      ( MAKE-5PILE ?auto_66251 ?auto_66252 ?auto_66253 ?auto_66254 ?auto_66255 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_66258 - BLOCK
      ?auto_66259 - BLOCK
      ?auto_66260 - BLOCK
      ?auto_66261 - BLOCK
      ?auto_66262 - BLOCK
    )
    :vars
    (
      ?auto_66263 - BLOCK
      ?auto_66264 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66258 ?auto_66259 ) ) ( not ( = ?auto_66258 ?auto_66260 ) ) ( not ( = ?auto_66258 ?auto_66261 ) ) ( not ( = ?auto_66258 ?auto_66262 ) ) ( not ( = ?auto_66259 ?auto_66260 ) ) ( not ( = ?auto_66259 ?auto_66261 ) ) ( not ( = ?auto_66259 ?auto_66262 ) ) ( not ( = ?auto_66260 ?auto_66261 ) ) ( not ( = ?auto_66260 ?auto_66262 ) ) ( not ( = ?auto_66261 ?auto_66262 ) ) ( not ( = ?auto_66258 ?auto_66263 ) ) ( not ( = ?auto_66259 ?auto_66263 ) ) ( not ( = ?auto_66260 ?auto_66263 ) ) ( not ( = ?auto_66261 ?auto_66263 ) ) ( not ( = ?auto_66262 ?auto_66263 ) ) ( ON-TABLE ?auto_66263 ) ( ON ?auto_66258 ?auto_66264 ) ( not ( = ?auto_66258 ?auto_66264 ) ) ( not ( = ?auto_66259 ?auto_66264 ) ) ( not ( = ?auto_66260 ?auto_66264 ) ) ( not ( = ?auto_66261 ?auto_66264 ) ) ( not ( = ?auto_66262 ?auto_66264 ) ) ( not ( = ?auto_66263 ?auto_66264 ) ) ( ON ?auto_66259 ?auto_66258 ) ( ON-TABLE ?auto_66264 ) ( ON ?auto_66260 ?auto_66259 ) ( ON ?auto_66261 ?auto_66260 ) ( CLEAR ?auto_66263 ) ( ON ?auto_66262 ?auto_66261 ) ( CLEAR ?auto_66262 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_66264 ?auto_66258 ?auto_66259 ?auto_66260 ?auto_66261 )
      ( MAKE-5PILE ?auto_66258 ?auto_66259 ?auto_66260 ?auto_66261 ?auto_66262 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_66265 - BLOCK
      ?auto_66266 - BLOCK
      ?auto_66267 - BLOCK
      ?auto_66268 - BLOCK
      ?auto_66269 - BLOCK
    )
    :vars
    (
      ?auto_66270 - BLOCK
      ?auto_66271 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66265 ?auto_66266 ) ) ( not ( = ?auto_66265 ?auto_66267 ) ) ( not ( = ?auto_66265 ?auto_66268 ) ) ( not ( = ?auto_66265 ?auto_66269 ) ) ( not ( = ?auto_66266 ?auto_66267 ) ) ( not ( = ?auto_66266 ?auto_66268 ) ) ( not ( = ?auto_66266 ?auto_66269 ) ) ( not ( = ?auto_66267 ?auto_66268 ) ) ( not ( = ?auto_66267 ?auto_66269 ) ) ( not ( = ?auto_66268 ?auto_66269 ) ) ( not ( = ?auto_66265 ?auto_66270 ) ) ( not ( = ?auto_66266 ?auto_66270 ) ) ( not ( = ?auto_66267 ?auto_66270 ) ) ( not ( = ?auto_66268 ?auto_66270 ) ) ( not ( = ?auto_66269 ?auto_66270 ) ) ( ON ?auto_66265 ?auto_66271 ) ( not ( = ?auto_66265 ?auto_66271 ) ) ( not ( = ?auto_66266 ?auto_66271 ) ) ( not ( = ?auto_66267 ?auto_66271 ) ) ( not ( = ?auto_66268 ?auto_66271 ) ) ( not ( = ?auto_66269 ?auto_66271 ) ) ( not ( = ?auto_66270 ?auto_66271 ) ) ( ON ?auto_66266 ?auto_66265 ) ( ON-TABLE ?auto_66271 ) ( ON ?auto_66267 ?auto_66266 ) ( ON ?auto_66268 ?auto_66267 ) ( ON ?auto_66269 ?auto_66268 ) ( CLEAR ?auto_66269 ) ( HOLDING ?auto_66270 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_66270 )
      ( MAKE-5PILE ?auto_66265 ?auto_66266 ?auto_66267 ?auto_66268 ?auto_66269 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_66272 - BLOCK
      ?auto_66273 - BLOCK
      ?auto_66274 - BLOCK
      ?auto_66275 - BLOCK
      ?auto_66276 - BLOCK
    )
    :vars
    (
      ?auto_66277 - BLOCK
      ?auto_66278 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66272 ?auto_66273 ) ) ( not ( = ?auto_66272 ?auto_66274 ) ) ( not ( = ?auto_66272 ?auto_66275 ) ) ( not ( = ?auto_66272 ?auto_66276 ) ) ( not ( = ?auto_66273 ?auto_66274 ) ) ( not ( = ?auto_66273 ?auto_66275 ) ) ( not ( = ?auto_66273 ?auto_66276 ) ) ( not ( = ?auto_66274 ?auto_66275 ) ) ( not ( = ?auto_66274 ?auto_66276 ) ) ( not ( = ?auto_66275 ?auto_66276 ) ) ( not ( = ?auto_66272 ?auto_66277 ) ) ( not ( = ?auto_66273 ?auto_66277 ) ) ( not ( = ?auto_66274 ?auto_66277 ) ) ( not ( = ?auto_66275 ?auto_66277 ) ) ( not ( = ?auto_66276 ?auto_66277 ) ) ( ON ?auto_66272 ?auto_66278 ) ( not ( = ?auto_66272 ?auto_66278 ) ) ( not ( = ?auto_66273 ?auto_66278 ) ) ( not ( = ?auto_66274 ?auto_66278 ) ) ( not ( = ?auto_66275 ?auto_66278 ) ) ( not ( = ?auto_66276 ?auto_66278 ) ) ( not ( = ?auto_66277 ?auto_66278 ) ) ( ON ?auto_66273 ?auto_66272 ) ( ON-TABLE ?auto_66278 ) ( ON ?auto_66274 ?auto_66273 ) ( ON ?auto_66275 ?auto_66274 ) ( ON ?auto_66276 ?auto_66275 ) ( ON ?auto_66277 ?auto_66276 ) ( CLEAR ?auto_66277 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_66278 ?auto_66272 ?auto_66273 ?auto_66274 ?auto_66275 ?auto_66276 )
      ( MAKE-5PILE ?auto_66272 ?auto_66273 ?auto_66274 ?auto_66275 ?auto_66276 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_66291 - BLOCK
      ?auto_66292 - BLOCK
      ?auto_66293 - BLOCK
      ?auto_66294 - BLOCK
      ?auto_66295 - BLOCK
      ?auto_66296 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_66295 ) ( ON-TABLE ?auto_66291 ) ( ON ?auto_66292 ?auto_66291 ) ( ON ?auto_66293 ?auto_66292 ) ( ON ?auto_66294 ?auto_66293 ) ( ON ?auto_66295 ?auto_66294 ) ( not ( = ?auto_66291 ?auto_66292 ) ) ( not ( = ?auto_66291 ?auto_66293 ) ) ( not ( = ?auto_66291 ?auto_66294 ) ) ( not ( = ?auto_66291 ?auto_66295 ) ) ( not ( = ?auto_66291 ?auto_66296 ) ) ( not ( = ?auto_66292 ?auto_66293 ) ) ( not ( = ?auto_66292 ?auto_66294 ) ) ( not ( = ?auto_66292 ?auto_66295 ) ) ( not ( = ?auto_66292 ?auto_66296 ) ) ( not ( = ?auto_66293 ?auto_66294 ) ) ( not ( = ?auto_66293 ?auto_66295 ) ) ( not ( = ?auto_66293 ?auto_66296 ) ) ( not ( = ?auto_66294 ?auto_66295 ) ) ( not ( = ?auto_66294 ?auto_66296 ) ) ( not ( = ?auto_66295 ?auto_66296 ) ) ( ON-TABLE ?auto_66296 ) ( CLEAR ?auto_66296 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_66296 )
      ( MAKE-6PILE ?auto_66291 ?auto_66292 ?auto_66293 ?auto_66294 ?auto_66295 ?auto_66296 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_66297 - BLOCK
      ?auto_66298 - BLOCK
      ?auto_66299 - BLOCK
      ?auto_66300 - BLOCK
      ?auto_66301 - BLOCK
      ?auto_66302 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_66297 ) ( ON ?auto_66298 ?auto_66297 ) ( ON ?auto_66299 ?auto_66298 ) ( ON ?auto_66300 ?auto_66299 ) ( not ( = ?auto_66297 ?auto_66298 ) ) ( not ( = ?auto_66297 ?auto_66299 ) ) ( not ( = ?auto_66297 ?auto_66300 ) ) ( not ( = ?auto_66297 ?auto_66301 ) ) ( not ( = ?auto_66297 ?auto_66302 ) ) ( not ( = ?auto_66298 ?auto_66299 ) ) ( not ( = ?auto_66298 ?auto_66300 ) ) ( not ( = ?auto_66298 ?auto_66301 ) ) ( not ( = ?auto_66298 ?auto_66302 ) ) ( not ( = ?auto_66299 ?auto_66300 ) ) ( not ( = ?auto_66299 ?auto_66301 ) ) ( not ( = ?auto_66299 ?auto_66302 ) ) ( not ( = ?auto_66300 ?auto_66301 ) ) ( not ( = ?auto_66300 ?auto_66302 ) ) ( not ( = ?auto_66301 ?auto_66302 ) ) ( ON-TABLE ?auto_66302 ) ( CLEAR ?auto_66302 ) ( HOLDING ?auto_66301 ) ( CLEAR ?auto_66300 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_66297 ?auto_66298 ?auto_66299 ?auto_66300 ?auto_66301 )
      ( MAKE-6PILE ?auto_66297 ?auto_66298 ?auto_66299 ?auto_66300 ?auto_66301 ?auto_66302 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_66303 - BLOCK
      ?auto_66304 - BLOCK
      ?auto_66305 - BLOCK
      ?auto_66306 - BLOCK
      ?auto_66307 - BLOCK
      ?auto_66308 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_66303 ) ( ON ?auto_66304 ?auto_66303 ) ( ON ?auto_66305 ?auto_66304 ) ( ON ?auto_66306 ?auto_66305 ) ( not ( = ?auto_66303 ?auto_66304 ) ) ( not ( = ?auto_66303 ?auto_66305 ) ) ( not ( = ?auto_66303 ?auto_66306 ) ) ( not ( = ?auto_66303 ?auto_66307 ) ) ( not ( = ?auto_66303 ?auto_66308 ) ) ( not ( = ?auto_66304 ?auto_66305 ) ) ( not ( = ?auto_66304 ?auto_66306 ) ) ( not ( = ?auto_66304 ?auto_66307 ) ) ( not ( = ?auto_66304 ?auto_66308 ) ) ( not ( = ?auto_66305 ?auto_66306 ) ) ( not ( = ?auto_66305 ?auto_66307 ) ) ( not ( = ?auto_66305 ?auto_66308 ) ) ( not ( = ?auto_66306 ?auto_66307 ) ) ( not ( = ?auto_66306 ?auto_66308 ) ) ( not ( = ?auto_66307 ?auto_66308 ) ) ( ON-TABLE ?auto_66308 ) ( CLEAR ?auto_66306 ) ( ON ?auto_66307 ?auto_66308 ) ( CLEAR ?auto_66307 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_66308 )
      ( MAKE-6PILE ?auto_66303 ?auto_66304 ?auto_66305 ?auto_66306 ?auto_66307 ?auto_66308 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_66309 - BLOCK
      ?auto_66310 - BLOCK
      ?auto_66311 - BLOCK
      ?auto_66312 - BLOCK
      ?auto_66313 - BLOCK
      ?auto_66314 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_66309 ) ( ON ?auto_66310 ?auto_66309 ) ( ON ?auto_66311 ?auto_66310 ) ( not ( = ?auto_66309 ?auto_66310 ) ) ( not ( = ?auto_66309 ?auto_66311 ) ) ( not ( = ?auto_66309 ?auto_66312 ) ) ( not ( = ?auto_66309 ?auto_66313 ) ) ( not ( = ?auto_66309 ?auto_66314 ) ) ( not ( = ?auto_66310 ?auto_66311 ) ) ( not ( = ?auto_66310 ?auto_66312 ) ) ( not ( = ?auto_66310 ?auto_66313 ) ) ( not ( = ?auto_66310 ?auto_66314 ) ) ( not ( = ?auto_66311 ?auto_66312 ) ) ( not ( = ?auto_66311 ?auto_66313 ) ) ( not ( = ?auto_66311 ?auto_66314 ) ) ( not ( = ?auto_66312 ?auto_66313 ) ) ( not ( = ?auto_66312 ?auto_66314 ) ) ( not ( = ?auto_66313 ?auto_66314 ) ) ( ON-TABLE ?auto_66314 ) ( ON ?auto_66313 ?auto_66314 ) ( CLEAR ?auto_66313 ) ( HOLDING ?auto_66312 ) ( CLEAR ?auto_66311 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_66309 ?auto_66310 ?auto_66311 ?auto_66312 )
      ( MAKE-6PILE ?auto_66309 ?auto_66310 ?auto_66311 ?auto_66312 ?auto_66313 ?auto_66314 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_66315 - BLOCK
      ?auto_66316 - BLOCK
      ?auto_66317 - BLOCK
      ?auto_66318 - BLOCK
      ?auto_66319 - BLOCK
      ?auto_66320 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_66315 ) ( ON ?auto_66316 ?auto_66315 ) ( ON ?auto_66317 ?auto_66316 ) ( not ( = ?auto_66315 ?auto_66316 ) ) ( not ( = ?auto_66315 ?auto_66317 ) ) ( not ( = ?auto_66315 ?auto_66318 ) ) ( not ( = ?auto_66315 ?auto_66319 ) ) ( not ( = ?auto_66315 ?auto_66320 ) ) ( not ( = ?auto_66316 ?auto_66317 ) ) ( not ( = ?auto_66316 ?auto_66318 ) ) ( not ( = ?auto_66316 ?auto_66319 ) ) ( not ( = ?auto_66316 ?auto_66320 ) ) ( not ( = ?auto_66317 ?auto_66318 ) ) ( not ( = ?auto_66317 ?auto_66319 ) ) ( not ( = ?auto_66317 ?auto_66320 ) ) ( not ( = ?auto_66318 ?auto_66319 ) ) ( not ( = ?auto_66318 ?auto_66320 ) ) ( not ( = ?auto_66319 ?auto_66320 ) ) ( ON-TABLE ?auto_66320 ) ( ON ?auto_66319 ?auto_66320 ) ( CLEAR ?auto_66317 ) ( ON ?auto_66318 ?auto_66319 ) ( CLEAR ?auto_66318 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_66320 ?auto_66319 )
      ( MAKE-6PILE ?auto_66315 ?auto_66316 ?auto_66317 ?auto_66318 ?auto_66319 ?auto_66320 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_66321 - BLOCK
      ?auto_66322 - BLOCK
      ?auto_66323 - BLOCK
      ?auto_66324 - BLOCK
      ?auto_66325 - BLOCK
      ?auto_66326 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_66321 ) ( ON ?auto_66322 ?auto_66321 ) ( not ( = ?auto_66321 ?auto_66322 ) ) ( not ( = ?auto_66321 ?auto_66323 ) ) ( not ( = ?auto_66321 ?auto_66324 ) ) ( not ( = ?auto_66321 ?auto_66325 ) ) ( not ( = ?auto_66321 ?auto_66326 ) ) ( not ( = ?auto_66322 ?auto_66323 ) ) ( not ( = ?auto_66322 ?auto_66324 ) ) ( not ( = ?auto_66322 ?auto_66325 ) ) ( not ( = ?auto_66322 ?auto_66326 ) ) ( not ( = ?auto_66323 ?auto_66324 ) ) ( not ( = ?auto_66323 ?auto_66325 ) ) ( not ( = ?auto_66323 ?auto_66326 ) ) ( not ( = ?auto_66324 ?auto_66325 ) ) ( not ( = ?auto_66324 ?auto_66326 ) ) ( not ( = ?auto_66325 ?auto_66326 ) ) ( ON-TABLE ?auto_66326 ) ( ON ?auto_66325 ?auto_66326 ) ( ON ?auto_66324 ?auto_66325 ) ( CLEAR ?auto_66324 ) ( HOLDING ?auto_66323 ) ( CLEAR ?auto_66322 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_66321 ?auto_66322 ?auto_66323 )
      ( MAKE-6PILE ?auto_66321 ?auto_66322 ?auto_66323 ?auto_66324 ?auto_66325 ?auto_66326 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_66327 - BLOCK
      ?auto_66328 - BLOCK
      ?auto_66329 - BLOCK
      ?auto_66330 - BLOCK
      ?auto_66331 - BLOCK
      ?auto_66332 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_66327 ) ( ON ?auto_66328 ?auto_66327 ) ( not ( = ?auto_66327 ?auto_66328 ) ) ( not ( = ?auto_66327 ?auto_66329 ) ) ( not ( = ?auto_66327 ?auto_66330 ) ) ( not ( = ?auto_66327 ?auto_66331 ) ) ( not ( = ?auto_66327 ?auto_66332 ) ) ( not ( = ?auto_66328 ?auto_66329 ) ) ( not ( = ?auto_66328 ?auto_66330 ) ) ( not ( = ?auto_66328 ?auto_66331 ) ) ( not ( = ?auto_66328 ?auto_66332 ) ) ( not ( = ?auto_66329 ?auto_66330 ) ) ( not ( = ?auto_66329 ?auto_66331 ) ) ( not ( = ?auto_66329 ?auto_66332 ) ) ( not ( = ?auto_66330 ?auto_66331 ) ) ( not ( = ?auto_66330 ?auto_66332 ) ) ( not ( = ?auto_66331 ?auto_66332 ) ) ( ON-TABLE ?auto_66332 ) ( ON ?auto_66331 ?auto_66332 ) ( ON ?auto_66330 ?auto_66331 ) ( CLEAR ?auto_66328 ) ( ON ?auto_66329 ?auto_66330 ) ( CLEAR ?auto_66329 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_66332 ?auto_66331 ?auto_66330 )
      ( MAKE-6PILE ?auto_66327 ?auto_66328 ?auto_66329 ?auto_66330 ?auto_66331 ?auto_66332 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_66333 - BLOCK
      ?auto_66334 - BLOCK
      ?auto_66335 - BLOCK
      ?auto_66336 - BLOCK
      ?auto_66337 - BLOCK
      ?auto_66338 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_66333 ) ( not ( = ?auto_66333 ?auto_66334 ) ) ( not ( = ?auto_66333 ?auto_66335 ) ) ( not ( = ?auto_66333 ?auto_66336 ) ) ( not ( = ?auto_66333 ?auto_66337 ) ) ( not ( = ?auto_66333 ?auto_66338 ) ) ( not ( = ?auto_66334 ?auto_66335 ) ) ( not ( = ?auto_66334 ?auto_66336 ) ) ( not ( = ?auto_66334 ?auto_66337 ) ) ( not ( = ?auto_66334 ?auto_66338 ) ) ( not ( = ?auto_66335 ?auto_66336 ) ) ( not ( = ?auto_66335 ?auto_66337 ) ) ( not ( = ?auto_66335 ?auto_66338 ) ) ( not ( = ?auto_66336 ?auto_66337 ) ) ( not ( = ?auto_66336 ?auto_66338 ) ) ( not ( = ?auto_66337 ?auto_66338 ) ) ( ON-TABLE ?auto_66338 ) ( ON ?auto_66337 ?auto_66338 ) ( ON ?auto_66336 ?auto_66337 ) ( ON ?auto_66335 ?auto_66336 ) ( CLEAR ?auto_66335 ) ( HOLDING ?auto_66334 ) ( CLEAR ?auto_66333 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_66333 ?auto_66334 )
      ( MAKE-6PILE ?auto_66333 ?auto_66334 ?auto_66335 ?auto_66336 ?auto_66337 ?auto_66338 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_66339 - BLOCK
      ?auto_66340 - BLOCK
      ?auto_66341 - BLOCK
      ?auto_66342 - BLOCK
      ?auto_66343 - BLOCK
      ?auto_66344 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_66339 ) ( not ( = ?auto_66339 ?auto_66340 ) ) ( not ( = ?auto_66339 ?auto_66341 ) ) ( not ( = ?auto_66339 ?auto_66342 ) ) ( not ( = ?auto_66339 ?auto_66343 ) ) ( not ( = ?auto_66339 ?auto_66344 ) ) ( not ( = ?auto_66340 ?auto_66341 ) ) ( not ( = ?auto_66340 ?auto_66342 ) ) ( not ( = ?auto_66340 ?auto_66343 ) ) ( not ( = ?auto_66340 ?auto_66344 ) ) ( not ( = ?auto_66341 ?auto_66342 ) ) ( not ( = ?auto_66341 ?auto_66343 ) ) ( not ( = ?auto_66341 ?auto_66344 ) ) ( not ( = ?auto_66342 ?auto_66343 ) ) ( not ( = ?auto_66342 ?auto_66344 ) ) ( not ( = ?auto_66343 ?auto_66344 ) ) ( ON-TABLE ?auto_66344 ) ( ON ?auto_66343 ?auto_66344 ) ( ON ?auto_66342 ?auto_66343 ) ( ON ?auto_66341 ?auto_66342 ) ( CLEAR ?auto_66339 ) ( ON ?auto_66340 ?auto_66341 ) ( CLEAR ?auto_66340 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_66344 ?auto_66343 ?auto_66342 ?auto_66341 )
      ( MAKE-6PILE ?auto_66339 ?auto_66340 ?auto_66341 ?auto_66342 ?auto_66343 ?auto_66344 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_66345 - BLOCK
      ?auto_66346 - BLOCK
      ?auto_66347 - BLOCK
      ?auto_66348 - BLOCK
      ?auto_66349 - BLOCK
      ?auto_66350 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66345 ?auto_66346 ) ) ( not ( = ?auto_66345 ?auto_66347 ) ) ( not ( = ?auto_66345 ?auto_66348 ) ) ( not ( = ?auto_66345 ?auto_66349 ) ) ( not ( = ?auto_66345 ?auto_66350 ) ) ( not ( = ?auto_66346 ?auto_66347 ) ) ( not ( = ?auto_66346 ?auto_66348 ) ) ( not ( = ?auto_66346 ?auto_66349 ) ) ( not ( = ?auto_66346 ?auto_66350 ) ) ( not ( = ?auto_66347 ?auto_66348 ) ) ( not ( = ?auto_66347 ?auto_66349 ) ) ( not ( = ?auto_66347 ?auto_66350 ) ) ( not ( = ?auto_66348 ?auto_66349 ) ) ( not ( = ?auto_66348 ?auto_66350 ) ) ( not ( = ?auto_66349 ?auto_66350 ) ) ( ON-TABLE ?auto_66350 ) ( ON ?auto_66349 ?auto_66350 ) ( ON ?auto_66348 ?auto_66349 ) ( ON ?auto_66347 ?auto_66348 ) ( ON ?auto_66346 ?auto_66347 ) ( CLEAR ?auto_66346 ) ( HOLDING ?auto_66345 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_66345 )
      ( MAKE-6PILE ?auto_66345 ?auto_66346 ?auto_66347 ?auto_66348 ?auto_66349 ?auto_66350 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_66351 - BLOCK
      ?auto_66352 - BLOCK
      ?auto_66353 - BLOCK
      ?auto_66354 - BLOCK
      ?auto_66355 - BLOCK
      ?auto_66356 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66351 ?auto_66352 ) ) ( not ( = ?auto_66351 ?auto_66353 ) ) ( not ( = ?auto_66351 ?auto_66354 ) ) ( not ( = ?auto_66351 ?auto_66355 ) ) ( not ( = ?auto_66351 ?auto_66356 ) ) ( not ( = ?auto_66352 ?auto_66353 ) ) ( not ( = ?auto_66352 ?auto_66354 ) ) ( not ( = ?auto_66352 ?auto_66355 ) ) ( not ( = ?auto_66352 ?auto_66356 ) ) ( not ( = ?auto_66353 ?auto_66354 ) ) ( not ( = ?auto_66353 ?auto_66355 ) ) ( not ( = ?auto_66353 ?auto_66356 ) ) ( not ( = ?auto_66354 ?auto_66355 ) ) ( not ( = ?auto_66354 ?auto_66356 ) ) ( not ( = ?auto_66355 ?auto_66356 ) ) ( ON-TABLE ?auto_66356 ) ( ON ?auto_66355 ?auto_66356 ) ( ON ?auto_66354 ?auto_66355 ) ( ON ?auto_66353 ?auto_66354 ) ( ON ?auto_66352 ?auto_66353 ) ( ON ?auto_66351 ?auto_66352 ) ( CLEAR ?auto_66351 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_66356 ?auto_66355 ?auto_66354 ?auto_66353 ?auto_66352 )
      ( MAKE-6PILE ?auto_66351 ?auto_66352 ?auto_66353 ?auto_66354 ?auto_66355 ?auto_66356 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_66363 - BLOCK
      ?auto_66364 - BLOCK
      ?auto_66365 - BLOCK
      ?auto_66366 - BLOCK
      ?auto_66367 - BLOCK
      ?auto_66368 - BLOCK
    )
    :vars
    (
      ?auto_66369 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66363 ?auto_66364 ) ) ( not ( = ?auto_66363 ?auto_66365 ) ) ( not ( = ?auto_66363 ?auto_66366 ) ) ( not ( = ?auto_66363 ?auto_66367 ) ) ( not ( = ?auto_66363 ?auto_66368 ) ) ( not ( = ?auto_66364 ?auto_66365 ) ) ( not ( = ?auto_66364 ?auto_66366 ) ) ( not ( = ?auto_66364 ?auto_66367 ) ) ( not ( = ?auto_66364 ?auto_66368 ) ) ( not ( = ?auto_66365 ?auto_66366 ) ) ( not ( = ?auto_66365 ?auto_66367 ) ) ( not ( = ?auto_66365 ?auto_66368 ) ) ( not ( = ?auto_66366 ?auto_66367 ) ) ( not ( = ?auto_66366 ?auto_66368 ) ) ( not ( = ?auto_66367 ?auto_66368 ) ) ( ON-TABLE ?auto_66368 ) ( ON ?auto_66367 ?auto_66368 ) ( ON ?auto_66366 ?auto_66367 ) ( ON ?auto_66365 ?auto_66366 ) ( ON ?auto_66364 ?auto_66365 ) ( CLEAR ?auto_66364 ) ( ON ?auto_66363 ?auto_66369 ) ( CLEAR ?auto_66363 ) ( HAND-EMPTY ) ( not ( = ?auto_66363 ?auto_66369 ) ) ( not ( = ?auto_66364 ?auto_66369 ) ) ( not ( = ?auto_66365 ?auto_66369 ) ) ( not ( = ?auto_66366 ?auto_66369 ) ) ( not ( = ?auto_66367 ?auto_66369 ) ) ( not ( = ?auto_66368 ?auto_66369 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_66363 ?auto_66369 )
      ( MAKE-6PILE ?auto_66363 ?auto_66364 ?auto_66365 ?auto_66366 ?auto_66367 ?auto_66368 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_66370 - BLOCK
      ?auto_66371 - BLOCK
      ?auto_66372 - BLOCK
      ?auto_66373 - BLOCK
      ?auto_66374 - BLOCK
      ?auto_66375 - BLOCK
    )
    :vars
    (
      ?auto_66376 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66370 ?auto_66371 ) ) ( not ( = ?auto_66370 ?auto_66372 ) ) ( not ( = ?auto_66370 ?auto_66373 ) ) ( not ( = ?auto_66370 ?auto_66374 ) ) ( not ( = ?auto_66370 ?auto_66375 ) ) ( not ( = ?auto_66371 ?auto_66372 ) ) ( not ( = ?auto_66371 ?auto_66373 ) ) ( not ( = ?auto_66371 ?auto_66374 ) ) ( not ( = ?auto_66371 ?auto_66375 ) ) ( not ( = ?auto_66372 ?auto_66373 ) ) ( not ( = ?auto_66372 ?auto_66374 ) ) ( not ( = ?auto_66372 ?auto_66375 ) ) ( not ( = ?auto_66373 ?auto_66374 ) ) ( not ( = ?auto_66373 ?auto_66375 ) ) ( not ( = ?auto_66374 ?auto_66375 ) ) ( ON-TABLE ?auto_66375 ) ( ON ?auto_66374 ?auto_66375 ) ( ON ?auto_66373 ?auto_66374 ) ( ON ?auto_66372 ?auto_66373 ) ( ON ?auto_66370 ?auto_66376 ) ( CLEAR ?auto_66370 ) ( not ( = ?auto_66370 ?auto_66376 ) ) ( not ( = ?auto_66371 ?auto_66376 ) ) ( not ( = ?auto_66372 ?auto_66376 ) ) ( not ( = ?auto_66373 ?auto_66376 ) ) ( not ( = ?auto_66374 ?auto_66376 ) ) ( not ( = ?auto_66375 ?auto_66376 ) ) ( HOLDING ?auto_66371 ) ( CLEAR ?auto_66372 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_66375 ?auto_66374 ?auto_66373 ?auto_66372 ?auto_66371 )
      ( MAKE-6PILE ?auto_66370 ?auto_66371 ?auto_66372 ?auto_66373 ?auto_66374 ?auto_66375 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_66377 - BLOCK
      ?auto_66378 - BLOCK
      ?auto_66379 - BLOCK
      ?auto_66380 - BLOCK
      ?auto_66381 - BLOCK
      ?auto_66382 - BLOCK
    )
    :vars
    (
      ?auto_66383 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66377 ?auto_66378 ) ) ( not ( = ?auto_66377 ?auto_66379 ) ) ( not ( = ?auto_66377 ?auto_66380 ) ) ( not ( = ?auto_66377 ?auto_66381 ) ) ( not ( = ?auto_66377 ?auto_66382 ) ) ( not ( = ?auto_66378 ?auto_66379 ) ) ( not ( = ?auto_66378 ?auto_66380 ) ) ( not ( = ?auto_66378 ?auto_66381 ) ) ( not ( = ?auto_66378 ?auto_66382 ) ) ( not ( = ?auto_66379 ?auto_66380 ) ) ( not ( = ?auto_66379 ?auto_66381 ) ) ( not ( = ?auto_66379 ?auto_66382 ) ) ( not ( = ?auto_66380 ?auto_66381 ) ) ( not ( = ?auto_66380 ?auto_66382 ) ) ( not ( = ?auto_66381 ?auto_66382 ) ) ( ON-TABLE ?auto_66382 ) ( ON ?auto_66381 ?auto_66382 ) ( ON ?auto_66380 ?auto_66381 ) ( ON ?auto_66379 ?auto_66380 ) ( ON ?auto_66377 ?auto_66383 ) ( not ( = ?auto_66377 ?auto_66383 ) ) ( not ( = ?auto_66378 ?auto_66383 ) ) ( not ( = ?auto_66379 ?auto_66383 ) ) ( not ( = ?auto_66380 ?auto_66383 ) ) ( not ( = ?auto_66381 ?auto_66383 ) ) ( not ( = ?auto_66382 ?auto_66383 ) ) ( CLEAR ?auto_66379 ) ( ON ?auto_66378 ?auto_66377 ) ( CLEAR ?auto_66378 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_66383 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_66383 ?auto_66377 )
      ( MAKE-6PILE ?auto_66377 ?auto_66378 ?auto_66379 ?auto_66380 ?auto_66381 ?auto_66382 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_66384 - BLOCK
      ?auto_66385 - BLOCK
      ?auto_66386 - BLOCK
      ?auto_66387 - BLOCK
      ?auto_66388 - BLOCK
      ?auto_66389 - BLOCK
    )
    :vars
    (
      ?auto_66390 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66384 ?auto_66385 ) ) ( not ( = ?auto_66384 ?auto_66386 ) ) ( not ( = ?auto_66384 ?auto_66387 ) ) ( not ( = ?auto_66384 ?auto_66388 ) ) ( not ( = ?auto_66384 ?auto_66389 ) ) ( not ( = ?auto_66385 ?auto_66386 ) ) ( not ( = ?auto_66385 ?auto_66387 ) ) ( not ( = ?auto_66385 ?auto_66388 ) ) ( not ( = ?auto_66385 ?auto_66389 ) ) ( not ( = ?auto_66386 ?auto_66387 ) ) ( not ( = ?auto_66386 ?auto_66388 ) ) ( not ( = ?auto_66386 ?auto_66389 ) ) ( not ( = ?auto_66387 ?auto_66388 ) ) ( not ( = ?auto_66387 ?auto_66389 ) ) ( not ( = ?auto_66388 ?auto_66389 ) ) ( ON-TABLE ?auto_66389 ) ( ON ?auto_66388 ?auto_66389 ) ( ON ?auto_66387 ?auto_66388 ) ( ON ?auto_66384 ?auto_66390 ) ( not ( = ?auto_66384 ?auto_66390 ) ) ( not ( = ?auto_66385 ?auto_66390 ) ) ( not ( = ?auto_66386 ?auto_66390 ) ) ( not ( = ?auto_66387 ?auto_66390 ) ) ( not ( = ?auto_66388 ?auto_66390 ) ) ( not ( = ?auto_66389 ?auto_66390 ) ) ( ON ?auto_66385 ?auto_66384 ) ( CLEAR ?auto_66385 ) ( ON-TABLE ?auto_66390 ) ( HOLDING ?auto_66386 ) ( CLEAR ?auto_66387 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_66389 ?auto_66388 ?auto_66387 ?auto_66386 )
      ( MAKE-6PILE ?auto_66384 ?auto_66385 ?auto_66386 ?auto_66387 ?auto_66388 ?auto_66389 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_66391 - BLOCK
      ?auto_66392 - BLOCK
      ?auto_66393 - BLOCK
      ?auto_66394 - BLOCK
      ?auto_66395 - BLOCK
      ?auto_66396 - BLOCK
    )
    :vars
    (
      ?auto_66397 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66391 ?auto_66392 ) ) ( not ( = ?auto_66391 ?auto_66393 ) ) ( not ( = ?auto_66391 ?auto_66394 ) ) ( not ( = ?auto_66391 ?auto_66395 ) ) ( not ( = ?auto_66391 ?auto_66396 ) ) ( not ( = ?auto_66392 ?auto_66393 ) ) ( not ( = ?auto_66392 ?auto_66394 ) ) ( not ( = ?auto_66392 ?auto_66395 ) ) ( not ( = ?auto_66392 ?auto_66396 ) ) ( not ( = ?auto_66393 ?auto_66394 ) ) ( not ( = ?auto_66393 ?auto_66395 ) ) ( not ( = ?auto_66393 ?auto_66396 ) ) ( not ( = ?auto_66394 ?auto_66395 ) ) ( not ( = ?auto_66394 ?auto_66396 ) ) ( not ( = ?auto_66395 ?auto_66396 ) ) ( ON-TABLE ?auto_66396 ) ( ON ?auto_66395 ?auto_66396 ) ( ON ?auto_66394 ?auto_66395 ) ( ON ?auto_66391 ?auto_66397 ) ( not ( = ?auto_66391 ?auto_66397 ) ) ( not ( = ?auto_66392 ?auto_66397 ) ) ( not ( = ?auto_66393 ?auto_66397 ) ) ( not ( = ?auto_66394 ?auto_66397 ) ) ( not ( = ?auto_66395 ?auto_66397 ) ) ( not ( = ?auto_66396 ?auto_66397 ) ) ( ON ?auto_66392 ?auto_66391 ) ( ON-TABLE ?auto_66397 ) ( CLEAR ?auto_66394 ) ( ON ?auto_66393 ?auto_66392 ) ( CLEAR ?auto_66393 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_66397 ?auto_66391 ?auto_66392 )
      ( MAKE-6PILE ?auto_66391 ?auto_66392 ?auto_66393 ?auto_66394 ?auto_66395 ?auto_66396 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_66398 - BLOCK
      ?auto_66399 - BLOCK
      ?auto_66400 - BLOCK
      ?auto_66401 - BLOCK
      ?auto_66402 - BLOCK
      ?auto_66403 - BLOCK
    )
    :vars
    (
      ?auto_66404 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66398 ?auto_66399 ) ) ( not ( = ?auto_66398 ?auto_66400 ) ) ( not ( = ?auto_66398 ?auto_66401 ) ) ( not ( = ?auto_66398 ?auto_66402 ) ) ( not ( = ?auto_66398 ?auto_66403 ) ) ( not ( = ?auto_66399 ?auto_66400 ) ) ( not ( = ?auto_66399 ?auto_66401 ) ) ( not ( = ?auto_66399 ?auto_66402 ) ) ( not ( = ?auto_66399 ?auto_66403 ) ) ( not ( = ?auto_66400 ?auto_66401 ) ) ( not ( = ?auto_66400 ?auto_66402 ) ) ( not ( = ?auto_66400 ?auto_66403 ) ) ( not ( = ?auto_66401 ?auto_66402 ) ) ( not ( = ?auto_66401 ?auto_66403 ) ) ( not ( = ?auto_66402 ?auto_66403 ) ) ( ON-TABLE ?auto_66403 ) ( ON ?auto_66402 ?auto_66403 ) ( ON ?auto_66398 ?auto_66404 ) ( not ( = ?auto_66398 ?auto_66404 ) ) ( not ( = ?auto_66399 ?auto_66404 ) ) ( not ( = ?auto_66400 ?auto_66404 ) ) ( not ( = ?auto_66401 ?auto_66404 ) ) ( not ( = ?auto_66402 ?auto_66404 ) ) ( not ( = ?auto_66403 ?auto_66404 ) ) ( ON ?auto_66399 ?auto_66398 ) ( ON-TABLE ?auto_66404 ) ( ON ?auto_66400 ?auto_66399 ) ( CLEAR ?auto_66400 ) ( HOLDING ?auto_66401 ) ( CLEAR ?auto_66402 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_66403 ?auto_66402 ?auto_66401 )
      ( MAKE-6PILE ?auto_66398 ?auto_66399 ?auto_66400 ?auto_66401 ?auto_66402 ?auto_66403 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_66405 - BLOCK
      ?auto_66406 - BLOCK
      ?auto_66407 - BLOCK
      ?auto_66408 - BLOCK
      ?auto_66409 - BLOCK
      ?auto_66410 - BLOCK
    )
    :vars
    (
      ?auto_66411 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66405 ?auto_66406 ) ) ( not ( = ?auto_66405 ?auto_66407 ) ) ( not ( = ?auto_66405 ?auto_66408 ) ) ( not ( = ?auto_66405 ?auto_66409 ) ) ( not ( = ?auto_66405 ?auto_66410 ) ) ( not ( = ?auto_66406 ?auto_66407 ) ) ( not ( = ?auto_66406 ?auto_66408 ) ) ( not ( = ?auto_66406 ?auto_66409 ) ) ( not ( = ?auto_66406 ?auto_66410 ) ) ( not ( = ?auto_66407 ?auto_66408 ) ) ( not ( = ?auto_66407 ?auto_66409 ) ) ( not ( = ?auto_66407 ?auto_66410 ) ) ( not ( = ?auto_66408 ?auto_66409 ) ) ( not ( = ?auto_66408 ?auto_66410 ) ) ( not ( = ?auto_66409 ?auto_66410 ) ) ( ON-TABLE ?auto_66410 ) ( ON ?auto_66409 ?auto_66410 ) ( ON ?auto_66405 ?auto_66411 ) ( not ( = ?auto_66405 ?auto_66411 ) ) ( not ( = ?auto_66406 ?auto_66411 ) ) ( not ( = ?auto_66407 ?auto_66411 ) ) ( not ( = ?auto_66408 ?auto_66411 ) ) ( not ( = ?auto_66409 ?auto_66411 ) ) ( not ( = ?auto_66410 ?auto_66411 ) ) ( ON ?auto_66406 ?auto_66405 ) ( ON-TABLE ?auto_66411 ) ( ON ?auto_66407 ?auto_66406 ) ( CLEAR ?auto_66409 ) ( ON ?auto_66408 ?auto_66407 ) ( CLEAR ?auto_66408 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_66411 ?auto_66405 ?auto_66406 ?auto_66407 )
      ( MAKE-6PILE ?auto_66405 ?auto_66406 ?auto_66407 ?auto_66408 ?auto_66409 ?auto_66410 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_66412 - BLOCK
      ?auto_66413 - BLOCK
      ?auto_66414 - BLOCK
      ?auto_66415 - BLOCK
      ?auto_66416 - BLOCK
      ?auto_66417 - BLOCK
    )
    :vars
    (
      ?auto_66418 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66412 ?auto_66413 ) ) ( not ( = ?auto_66412 ?auto_66414 ) ) ( not ( = ?auto_66412 ?auto_66415 ) ) ( not ( = ?auto_66412 ?auto_66416 ) ) ( not ( = ?auto_66412 ?auto_66417 ) ) ( not ( = ?auto_66413 ?auto_66414 ) ) ( not ( = ?auto_66413 ?auto_66415 ) ) ( not ( = ?auto_66413 ?auto_66416 ) ) ( not ( = ?auto_66413 ?auto_66417 ) ) ( not ( = ?auto_66414 ?auto_66415 ) ) ( not ( = ?auto_66414 ?auto_66416 ) ) ( not ( = ?auto_66414 ?auto_66417 ) ) ( not ( = ?auto_66415 ?auto_66416 ) ) ( not ( = ?auto_66415 ?auto_66417 ) ) ( not ( = ?auto_66416 ?auto_66417 ) ) ( ON-TABLE ?auto_66417 ) ( ON ?auto_66412 ?auto_66418 ) ( not ( = ?auto_66412 ?auto_66418 ) ) ( not ( = ?auto_66413 ?auto_66418 ) ) ( not ( = ?auto_66414 ?auto_66418 ) ) ( not ( = ?auto_66415 ?auto_66418 ) ) ( not ( = ?auto_66416 ?auto_66418 ) ) ( not ( = ?auto_66417 ?auto_66418 ) ) ( ON ?auto_66413 ?auto_66412 ) ( ON-TABLE ?auto_66418 ) ( ON ?auto_66414 ?auto_66413 ) ( ON ?auto_66415 ?auto_66414 ) ( CLEAR ?auto_66415 ) ( HOLDING ?auto_66416 ) ( CLEAR ?auto_66417 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_66417 ?auto_66416 )
      ( MAKE-6PILE ?auto_66412 ?auto_66413 ?auto_66414 ?auto_66415 ?auto_66416 ?auto_66417 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_66419 - BLOCK
      ?auto_66420 - BLOCK
      ?auto_66421 - BLOCK
      ?auto_66422 - BLOCK
      ?auto_66423 - BLOCK
      ?auto_66424 - BLOCK
    )
    :vars
    (
      ?auto_66425 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66419 ?auto_66420 ) ) ( not ( = ?auto_66419 ?auto_66421 ) ) ( not ( = ?auto_66419 ?auto_66422 ) ) ( not ( = ?auto_66419 ?auto_66423 ) ) ( not ( = ?auto_66419 ?auto_66424 ) ) ( not ( = ?auto_66420 ?auto_66421 ) ) ( not ( = ?auto_66420 ?auto_66422 ) ) ( not ( = ?auto_66420 ?auto_66423 ) ) ( not ( = ?auto_66420 ?auto_66424 ) ) ( not ( = ?auto_66421 ?auto_66422 ) ) ( not ( = ?auto_66421 ?auto_66423 ) ) ( not ( = ?auto_66421 ?auto_66424 ) ) ( not ( = ?auto_66422 ?auto_66423 ) ) ( not ( = ?auto_66422 ?auto_66424 ) ) ( not ( = ?auto_66423 ?auto_66424 ) ) ( ON-TABLE ?auto_66424 ) ( ON ?auto_66419 ?auto_66425 ) ( not ( = ?auto_66419 ?auto_66425 ) ) ( not ( = ?auto_66420 ?auto_66425 ) ) ( not ( = ?auto_66421 ?auto_66425 ) ) ( not ( = ?auto_66422 ?auto_66425 ) ) ( not ( = ?auto_66423 ?auto_66425 ) ) ( not ( = ?auto_66424 ?auto_66425 ) ) ( ON ?auto_66420 ?auto_66419 ) ( ON-TABLE ?auto_66425 ) ( ON ?auto_66421 ?auto_66420 ) ( ON ?auto_66422 ?auto_66421 ) ( CLEAR ?auto_66424 ) ( ON ?auto_66423 ?auto_66422 ) ( CLEAR ?auto_66423 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_66425 ?auto_66419 ?auto_66420 ?auto_66421 ?auto_66422 )
      ( MAKE-6PILE ?auto_66419 ?auto_66420 ?auto_66421 ?auto_66422 ?auto_66423 ?auto_66424 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_66426 - BLOCK
      ?auto_66427 - BLOCK
      ?auto_66428 - BLOCK
      ?auto_66429 - BLOCK
      ?auto_66430 - BLOCK
      ?auto_66431 - BLOCK
    )
    :vars
    (
      ?auto_66432 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66426 ?auto_66427 ) ) ( not ( = ?auto_66426 ?auto_66428 ) ) ( not ( = ?auto_66426 ?auto_66429 ) ) ( not ( = ?auto_66426 ?auto_66430 ) ) ( not ( = ?auto_66426 ?auto_66431 ) ) ( not ( = ?auto_66427 ?auto_66428 ) ) ( not ( = ?auto_66427 ?auto_66429 ) ) ( not ( = ?auto_66427 ?auto_66430 ) ) ( not ( = ?auto_66427 ?auto_66431 ) ) ( not ( = ?auto_66428 ?auto_66429 ) ) ( not ( = ?auto_66428 ?auto_66430 ) ) ( not ( = ?auto_66428 ?auto_66431 ) ) ( not ( = ?auto_66429 ?auto_66430 ) ) ( not ( = ?auto_66429 ?auto_66431 ) ) ( not ( = ?auto_66430 ?auto_66431 ) ) ( ON ?auto_66426 ?auto_66432 ) ( not ( = ?auto_66426 ?auto_66432 ) ) ( not ( = ?auto_66427 ?auto_66432 ) ) ( not ( = ?auto_66428 ?auto_66432 ) ) ( not ( = ?auto_66429 ?auto_66432 ) ) ( not ( = ?auto_66430 ?auto_66432 ) ) ( not ( = ?auto_66431 ?auto_66432 ) ) ( ON ?auto_66427 ?auto_66426 ) ( ON-TABLE ?auto_66432 ) ( ON ?auto_66428 ?auto_66427 ) ( ON ?auto_66429 ?auto_66428 ) ( ON ?auto_66430 ?auto_66429 ) ( CLEAR ?auto_66430 ) ( HOLDING ?auto_66431 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_66431 )
      ( MAKE-6PILE ?auto_66426 ?auto_66427 ?auto_66428 ?auto_66429 ?auto_66430 ?auto_66431 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_66433 - BLOCK
      ?auto_66434 - BLOCK
      ?auto_66435 - BLOCK
      ?auto_66436 - BLOCK
      ?auto_66437 - BLOCK
      ?auto_66438 - BLOCK
    )
    :vars
    (
      ?auto_66439 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66433 ?auto_66434 ) ) ( not ( = ?auto_66433 ?auto_66435 ) ) ( not ( = ?auto_66433 ?auto_66436 ) ) ( not ( = ?auto_66433 ?auto_66437 ) ) ( not ( = ?auto_66433 ?auto_66438 ) ) ( not ( = ?auto_66434 ?auto_66435 ) ) ( not ( = ?auto_66434 ?auto_66436 ) ) ( not ( = ?auto_66434 ?auto_66437 ) ) ( not ( = ?auto_66434 ?auto_66438 ) ) ( not ( = ?auto_66435 ?auto_66436 ) ) ( not ( = ?auto_66435 ?auto_66437 ) ) ( not ( = ?auto_66435 ?auto_66438 ) ) ( not ( = ?auto_66436 ?auto_66437 ) ) ( not ( = ?auto_66436 ?auto_66438 ) ) ( not ( = ?auto_66437 ?auto_66438 ) ) ( ON ?auto_66433 ?auto_66439 ) ( not ( = ?auto_66433 ?auto_66439 ) ) ( not ( = ?auto_66434 ?auto_66439 ) ) ( not ( = ?auto_66435 ?auto_66439 ) ) ( not ( = ?auto_66436 ?auto_66439 ) ) ( not ( = ?auto_66437 ?auto_66439 ) ) ( not ( = ?auto_66438 ?auto_66439 ) ) ( ON ?auto_66434 ?auto_66433 ) ( ON-TABLE ?auto_66439 ) ( ON ?auto_66435 ?auto_66434 ) ( ON ?auto_66436 ?auto_66435 ) ( ON ?auto_66437 ?auto_66436 ) ( ON ?auto_66438 ?auto_66437 ) ( CLEAR ?auto_66438 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_66439 ?auto_66433 ?auto_66434 ?auto_66435 ?auto_66436 ?auto_66437 )
      ( MAKE-6PILE ?auto_66433 ?auto_66434 ?auto_66435 ?auto_66436 ?auto_66437 ?auto_66438 ) )
  )

)

