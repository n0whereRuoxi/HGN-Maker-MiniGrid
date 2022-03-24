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
      ?auto_48879 - BLOCK
      ?auto_48880 - BLOCK
      ?auto_48881 - BLOCK
      ?auto_48882 - BLOCK
      ?auto_48883 - BLOCK
      ?auto_48884 - BLOCK
    )
    :vars
    (
      ?auto_48885 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48885 ?auto_48884 ) ( CLEAR ?auto_48885 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_48879 ) ( ON ?auto_48880 ?auto_48879 ) ( ON ?auto_48881 ?auto_48880 ) ( ON ?auto_48882 ?auto_48881 ) ( ON ?auto_48883 ?auto_48882 ) ( ON ?auto_48884 ?auto_48883 ) ( not ( = ?auto_48879 ?auto_48880 ) ) ( not ( = ?auto_48879 ?auto_48881 ) ) ( not ( = ?auto_48879 ?auto_48882 ) ) ( not ( = ?auto_48879 ?auto_48883 ) ) ( not ( = ?auto_48879 ?auto_48884 ) ) ( not ( = ?auto_48879 ?auto_48885 ) ) ( not ( = ?auto_48880 ?auto_48881 ) ) ( not ( = ?auto_48880 ?auto_48882 ) ) ( not ( = ?auto_48880 ?auto_48883 ) ) ( not ( = ?auto_48880 ?auto_48884 ) ) ( not ( = ?auto_48880 ?auto_48885 ) ) ( not ( = ?auto_48881 ?auto_48882 ) ) ( not ( = ?auto_48881 ?auto_48883 ) ) ( not ( = ?auto_48881 ?auto_48884 ) ) ( not ( = ?auto_48881 ?auto_48885 ) ) ( not ( = ?auto_48882 ?auto_48883 ) ) ( not ( = ?auto_48882 ?auto_48884 ) ) ( not ( = ?auto_48882 ?auto_48885 ) ) ( not ( = ?auto_48883 ?auto_48884 ) ) ( not ( = ?auto_48883 ?auto_48885 ) ) ( not ( = ?auto_48884 ?auto_48885 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_48885 ?auto_48884 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_48887 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_48887 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_48887 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_48888 - BLOCK
    )
    :vars
    (
      ?auto_48889 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48888 ?auto_48889 ) ( CLEAR ?auto_48888 ) ( HAND-EMPTY ) ( not ( = ?auto_48888 ?auto_48889 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_48888 ?auto_48889 )
      ( MAKE-1PILE ?auto_48888 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48895 - BLOCK
      ?auto_48896 - BLOCK
      ?auto_48897 - BLOCK
      ?auto_48898 - BLOCK
      ?auto_48899 - BLOCK
    )
    :vars
    (
      ?auto_48900 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48900 ?auto_48899 ) ( CLEAR ?auto_48900 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_48895 ) ( ON ?auto_48896 ?auto_48895 ) ( ON ?auto_48897 ?auto_48896 ) ( ON ?auto_48898 ?auto_48897 ) ( ON ?auto_48899 ?auto_48898 ) ( not ( = ?auto_48895 ?auto_48896 ) ) ( not ( = ?auto_48895 ?auto_48897 ) ) ( not ( = ?auto_48895 ?auto_48898 ) ) ( not ( = ?auto_48895 ?auto_48899 ) ) ( not ( = ?auto_48895 ?auto_48900 ) ) ( not ( = ?auto_48896 ?auto_48897 ) ) ( not ( = ?auto_48896 ?auto_48898 ) ) ( not ( = ?auto_48896 ?auto_48899 ) ) ( not ( = ?auto_48896 ?auto_48900 ) ) ( not ( = ?auto_48897 ?auto_48898 ) ) ( not ( = ?auto_48897 ?auto_48899 ) ) ( not ( = ?auto_48897 ?auto_48900 ) ) ( not ( = ?auto_48898 ?auto_48899 ) ) ( not ( = ?auto_48898 ?auto_48900 ) ) ( not ( = ?auto_48899 ?auto_48900 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_48900 ?auto_48899 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48901 - BLOCK
      ?auto_48902 - BLOCK
      ?auto_48903 - BLOCK
      ?auto_48904 - BLOCK
      ?auto_48905 - BLOCK
    )
    :vars
    (
      ?auto_48906 - BLOCK
      ?auto_48907 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48906 ?auto_48905 ) ( CLEAR ?auto_48906 ) ( ON-TABLE ?auto_48901 ) ( ON ?auto_48902 ?auto_48901 ) ( ON ?auto_48903 ?auto_48902 ) ( ON ?auto_48904 ?auto_48903 ) ( ON ?auto_48905 ?auto_48904 ) ( not ( = ?auto_48901 ?auto_48902 ) ) ( not ( = ?auto_48901 ?auto_48903 ) ) ( not ( = ?auto_48901 ?auto_48904 ) ) ( not ( = ?auto_48901 ?auto_48905 ) ) ( not ( = ?auto_48901 ?auto_48906 ) ) ( not ( = ?auto_48902 ?auto_48903 ) ) ( not ( = ?auto_48902 ?auto_48904 ) ) ( not ( = ?auto_48902 ?auto_48905 ) ) ( not ( = ?auto_48902 ?auto_48906 ) ) ( not ( = ?auto_48903 ?auto_48904 ) ) ( not ( = ?auto_48903 ?auto_48905 ) ) ( not ( = ?auto_48903 ?auto_48906 ) ) ( not ( = ?auto_48904 ?auto_48905 ) ) ( not ( = ?auto_48904 ?auto_48906 ) ) ( not ( = ?auto_48905 ?auto_48906 ) ) ( HOLDING ?auto_48907 ) ( not ( = ?auto_48901 ?auto_48907 ) ) ( not ( = ?auto_48902 ?auto_48907 ) ) ( not ( = ?auto_48903 ?auto_48907 ) ) ( not ( = ?auto_48904 ?auto_48907 ) ) ( not ( = ?auto_48905 ?auto_48907 ) ) ( not ( = ?auto_48906 ?auto_48907 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_48907 )
      ( MAKE-5PILE ?auto_48901 ?auto_48902 ?auto_48903 ?auto_48904 ?auto_48905 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48908 - BLOCK
      ?auto_48909 - BLOCK
      ?auto_48910 - BLOCK
      ?auto_48911 - BLOCK
      ?auto_48912 - BLOCK
    )
    :vars
    (
      ?auto_48913 - BLOCK
      ?auto_48914 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48913 ?auto_48912 ) ( ON-TABLE ?auto_48908 ) ( ON ?auto_48909 ?auto_48908 ) ( ON ?auto_48910 ?auto_48909 ) ( ON ?auto_48911 ?auto_48910 ) ( ON ?auto_48912 ?auto_48911 ) ( not ( = ?auto_48908 ?auto_48909 ) ) ( not ( = ?auto_48908 ?auto_48910 ) ) ( not ( = ?auto_48908 ?auto_48911 ) ) ( not ( = ?auto_48908 ?auto_48912 ) ) ( not ( = ?auto_48908 ?auto_48913 ) ) ( not ( = ?auto_48909 ?auto_48910 ) ) ( not ( = ?auto_48909 ?auto_48911 ) ) ( not ( = ?auto_48909 ?auto_48912 ) ) ( not ( = ?auto_48909 ?auto_48913 ) ) ( not ( = ?auto_48910 ?auto_48911 ) ) ( not ( = ?auto_48910 ?auto_48912 ) ) ( not ( = ?auto_48910 ?auto_48913 ) ) ( not ( = ?auto_48911 ?auto_48912 ) ) ( not ( = ?auto_48911 ?auto_48913 ) ) ( not ( = ?auto_48912 ?auto_48913 ) ) ( not ( = ?auto_48908 ?auto_48914 ) ) ( not ( = ?auto_48909 ?auto_48914 ) ) ( not ( = ?auto_48910 ?auto_48914 ) ) ( not ( = ?auto_48911 ?auto_48914 ) ) ( not ( = ?auto_48912 ?auto_48914 ) ) ( not ( = ?auto_48913 ?auto_48914 ) ) ( ON ?auto_48914 ?auto_48913 ) ( CLEAR ?auto_48914 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_48908 ?auto_48909 ?auto_48910 ?auto_48911 ?auto_48912 ?auto_48913 )
      ( MAKE-5PILE ?auto_48908 ?auto_48909 ?auto_48910 ?auto_48911 ?auto_48912 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_48917 - BLOCK
      ?auto_48918 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_48918 ) ( CLEAR ?auto_48917 ) ( ON-TABLE ?auto_48917 ) ( not ( = ?auto_48917 ?auto_48918 ) ) )
    :subtasks
    ( ( !STACK ?auto_48918 ?auto_48917 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_48919 - BLOCK
      ?auto_48920 - BLOCK
    )
    :vars
    (
      ?auto_48921 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_48919 ) ( ON-TABLE ?auto_48919 ) ( not ( = ?auto_48919 ?auto_48920 ) ) ( ON ?auto_48920 ?auto_48921 ) ( CLEAR ?auto_48920 ) ( HAND-EMPTY ) ( not ( = ?auto_48919 ?auto_48921 ) ) ( not ( = ?auto_48920 ?auto_48921 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_48920 ?auto_48921 )
      ( MAKE-2PILE ?auto_48919 ?auto_48920 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_48922 - BLOCK
      ?auto_48923 - BLOCK
    )
    :vars
    (
      ?auto_48924 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48922 ?auto_48923 ) ) ( ON ?auto_48923 ?auto_48924 ) ( CLEAR ?auto_48923 ) ( not ( = ?auto_48922 ?auto_48924 ) ) ( not ( = ?auto_48923 ?auto_48924 ) ) ( HOLDING ?auto_48922 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_48922 )
      ( MAKE-2PILE ?auto_48922 ?auto_48923 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_48925 - BLOCK
      ?auto_48926 - BLOCK
    )
    :vars
    (
      ?auto_48927 - BLOCK
      ?auto_48931 - BLOCK
      ?auto_48929 - BLOCK
      ?auto_48930 - BLOCK
      ?auto_48928 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48925 ?auto_48926 ) ) ( ON ?auto_48926 ?auto_48927 ) ( not ( = ?auto_48925 ?auto_48927 ) ) ( not ( = ?auto_48926 ?auto_48927 ) ) ( ON ?auto_48925 ?auto_48926 ) ( CLEAR ?auto_48925 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_48931 ) ( ON ?auto_48929 ?auto_48931 ) ( ON ?auto_48930 ?auto_48929 ) ( ON ?auto_48928 ?auto_48930 ) ( ON ?auto_48927 ?auto_48928 ) ( not ( = ?auto_48931 ?auto_48929 ) ) ( not ( = ?auto_48931 ?auto_48930 ) ) ( not ( = ?auto_48931 ?auto_48928 ) ) ( not ( = ?auto_48931 ?auto_48927 ) ) ( not ( = ?auto_48931 ?auto_48926 ) ) ( not ( = ?auto_48931 ?auto_48925 ) ) ( not ( = ?auto_48929 ?auto_48930 ) ) ( not ( = ?auto_48929 ?auto_48928 ) ) ( not ( = ?auto_48929 ?auto_48927 ) ) ( not ( = ?auto_48929 ?auto_48926 ) ) ( not ( = ?auto_48929 ?auto_48925 ) ) ( not ( = ?auto_48930 ?auto_48928 ) ) ( not ( = ?auto_48930 ?auto_48927 ) ) ( not ( = ?auto_48930 ?auto_48926 ) ) ( not ( = ?auto_48930 ?auto_48925 ) ) ( not ( = ?auto_48928 ?auto_48927 ) ) ( not ( = ?auto_48928 ?auto_48926 ) ) ( not ( = ?auto_48928 ?auto_48925 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_48931 ?auto_48929 ?auto_48930 ?auto_48928 ?auto_48927 ?auto_48926 )
      ( MAKE-2PILE ?auto_48925 ?auto_48926 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_48936 - BLOCK
      ?auto_48937 - BLOCK
      ?auto_48938 - BLOCK
      ?auto_48939 - BLOCK
    )
    :vars
    (
      ?auto_48940 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48940 ?auto_48939 ) ( CLEAR ?auto_48940 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_48936 ) ( ON ?auto_48937 ?auto_48936 ) ( ON ?auto_48938 ?auto_48937 ) ( ON ?auto_48939 ?auto_48938 ) ( not ( = ?auto_48936 ?auto_48937 ) ) ( not ( = ?auto_48936 ?auto_48938 ) ) ( not ( = ?auto_48936 ?auto_48939 ) ) ( not ( = ?auto_48936 ?auto_48940 ) ) ( not ( = ?auto_48937 ?auto_48938 ) ) ( not ( = ?auto_48937 ?auto_48939 ) ) ( not ( = ?auto_48937 ?auto_48940 ) ) ( not ( = ?auto_48938 ?auto_48939 ) ) ( not ( = ?auto_48938 ?auto_48940 ) ) ( not ( = ?auto_48939 ?auto_48940 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_48940 ?auto_48939 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_48941 - BLOCK
      ?auto_48942 - BLOCK
      ?auto_48943 - BLOCK
      ?auto_48944 - BLOCK
    )
    :vars
    (
      ?auto_48945 - BLOCK
      ?auto_48946 - BLOCK
      ?auto_48947 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48945 ?auto_48944 ) ( CLEAR ?auto_48945 ) ( ON-TABLE ?auto_48941 ) ( ON ?auto_48942 ?auto_48941 ) ( ON ?auto_48943 ?auto_48942 ) ( ON ?auto_48944 ?auto_48943 ) ( not ( = ?auto_48941 ?auto_48942 ) ) ( not ( = ?auto_48941 ?auto_48943 ) ) ( not ( = ?auto_48941 ?auto_48944 ) ) ( not ( = ?auto_48941 ?auto_48945 ) ) ( not ( = ?auto_48942 ?auto_48943 ) ) ( not ( = ?auto_48942 ?auto_48944 ) ) ( not ( = ?auto_48942 ?auto_48945 ) ) ( not ( = ?auto_48943 ?auto_48944 ) ) ( not ( = ?auto_48943 ?auto_48945 ) ) ( not ( = ?auto_48944 ?auto_48945 ) ) ( HOLDING ?auto_48946 ) ( CLEAR ?auto_48947 ) ( not ( = ?auto_48941 ?auto_48946 ) ) ( not ( = ?auto_48941 ?auto_48947 ) ) ( not ( = ?auto_48942 ?auto_48946 ) ) ( not ( = ?auto_48942 ?auto_48947 ) ) ( not ( = ?auto_48943 ?auto_48946 ) ) ( not ( = ?auto_48943 ?auto_48947 ) ) ( not ( = ?auto_48944 ?auto_48946 ) ) ( not ( = ?auto_48944 ?auto_48947 ) ) ( not ( = ?auto_48945 ?auto_48946 ) ) ( not ( = ?auto_48945 ?auto_48947 ) ) ( not ( = ?auto_48946 ?auto_48947 ) ) )
    :subtasks
    ( ( !STACK ?auto_48946 ?auto_48947 )
      ( MAKE-4PILE ?auto_48941 ?auto_48942 ?auto_48943 ?auto_48944 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_49547 - BLOCK
      ?auto_49548 - BLOCK
      ?auto_49549 - BLOCK
      ?auto_49550 - BLOCK
    )
    :vars
    (
      ?auto_49552 - BLOCK
      ?auto_49551 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49552 ?auto_49550 ) ( ON-TABLE ?auto_49547 ) ( ON ?auto_49548 ?auto_49547 ) ( ON ?auto_49549 ?auto_49548 ) ( ON ?auto_49550 ?auto_49549 ) ( not ( = ?auto_49547 ?auto_49548 ) ) ( not ( = ?auto_49547 ?auto_49549 ) ) ( not ( = ?auto_49547 ?auto_49550 ) ) ( not ( = ?auto_49547 ?auto_49552 ) ) ( not ( = ?auto_49548 ?auto_49549 ) ) ( not ( = ?auto_49548 ?auto_49550 ) ) ( not ( = ?auto_49548 ?auto_49552 ) ) ( not ( = ?auto_49549 ?auto_49550 ) ) ( not ( = ?auto_49549 ?auto_49552 ) ) ( not ( = ?auto_49550 ?auto_49552 ) ) ( not ( = ?auto_49547 ?auto_49551 ) ) ( not ( = ?auto_49548 ?auto_49551 ) ) ( not ( = ?auto_49549 ?auto_49551 ) ) ( not ( = ?auto_49550 ?auto_49551 ) ) ( not ( = ?auto_49552 ?auto_49551 ) ) ( ON ?auto_49551 ?auto_49552 ) ( CLEAR ?auto_49551 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_49547 ?auto_49548 ?auto_49549 ?auto_49550 ?auto_49552 )
      ( MAKE-4PILE ?auto_49547 ?auto_49548 ?auto_49549 ?auto_49550 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_48955 - BLOCK
      ?auto_48956 - BLOCK
      ?auto_48957 - BLOCK
      ?auto_48958 - BLOCK
    )
    :vars
    (
      ?auto_48961 - BLOCK
      ?auto_48960 - BLOCK
      ?auto_48959 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48961 ?auto_48958 ) ( ON-TABLE ?auto_48955 ) ( ON ?auto_48956 ?auto_48955 ) ( ON ?auto_48957 ?auto_48956 ) ( ON ?auto_48958 ?auto_48957 ) ( not ( = ?auto_48955 ?auto_48956 ) ) ( not ( = ?auto_48955 ?auto_48957 ) ) ( not ( = ?auto_48955 ?auto_48958 ) ) ( not ( = ?auto_48955 ?auto_48961 ) ) ( not ( = ?auto_48956 ?auto_48957 ) ) ( not ( = ?auto_48956 ?auto_48958 ) ) ( not ( = ?auto_48956 ?auto_48961 ) ) ( not ( = ?auto_48957 ?auto_48958 ) ) ( not ( = ?auto_48957 ?auto_48961 ) ) ( not ( = ?auto_48958 ?auto_48961 ) ) ( not ( = ?auto_48955 ?auto_48960 ) ) ( not ( = ?auto_48955 ?auto_48959 ) ) ( not ( = ?auto_48956 ?auto_48960 ) ) ( not ( = ?auto_48956 ?auto_48959 ) ) ( not ( = ?auto_48957 ?auto_48960 ) ) ( not ( = ?auto_48957 ?auto_48959 ) ) ( not ( = ?auto_48958 ?auto_48960 ) ) ( not ( = ?auto_48958 ?auto_48959 ) ) ( not ( = ?auto_48961 ?auto_48960 ) ) ( not ( = ?auto_48961 ?auto_48959 ) ) ( not ( = ?auto_48960 ?auto_48959 ) ) ( ON ?auto_48960 ?auto_48961 ) ( CLEAR ?auto_48960 ) ( HOLDING ?auto_48959 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_48959 )
      ( MAKE-4PILE ?auto_48955 ?auto_48956 ?auto_48957 ?auto_48958 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_48962 - BLOCK
      ?auto_48963 - BLOCK
      ?auto_48964 - BLOCK
      ?auto_48965 - BLOCK
    )
    :vars
    (
      ?auto_48968 - BLOCK
      ?auto_48967 - BLOCK
      ?auto_48966 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48968 ?auto_48965 ) ( ON-TABLE ?auto_48962 ) ( ON ?auto_48963 ?auto_48962 ) ( ON ?auto_48964 ?auto_48963 ) ( ON ?auto_48965 ?auto_48964 ) ( not ( = ?auto_48962 ?auto_48963 ) ) ( not ( = ?auto_48962 ?auto_48964 ) ) ( not ( = ?auto_48962 ?auto_48965 ) ) ( not ( = ?auto_48962 ?auto_48968 ) ) ( not ( = ?auto_48963 ?auto_48964 ) ) ( not ( = ?auto_48963 ?auto_48965 ) ) ( not ( = ?auto_48963 ?auto_48968 ) ) ( not ( = ?auto_48964 ?auto_48965 ) ) ( not ( = ?auto_48964 ?auto_48968 ) ) ( not ( = ?auto_48965 ?auto_48968 ) ) ( not ( = ?auto_48962 ?auto_48967 ) ) ( not ( = ?auto_48962 ?auto_48966 ) ) ( not ( = ?auto_48963 ?auto_48967 ) ) ( not ( = ?auto_48963 ?auto_48966 ) ) ( not ( = ?auto_48964 ?auto_48967 ) ) ( not ( = ?auto_48964 ?auto_48966 ) ) ( not ( = ?auto_48965 ?auto_48967 ) ) ( not ( = ?auto_48965 ?auto_48966 ) ) ( not ( = ?auto_48968 ?auto_48967 ) ) ( not ( = ?auto_48968 ?auto_48966 ) ) ( not ( = ?auto_48967 ?auto_48966 ) ) ( ON ?auto_48967 ?auto_48968 ) ( ON ?auto_48966 ?auto_48967 ) ( CLEAR ?auto_48966 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_48962 ?auto_48963 ?auto_48964 ?auto_48965 ?auto_48968 ?auto_48967 )
      ( MAKE-4PILE ?auto_48962 ?auto_48963 ?auto_48964 ?auto_48965 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_48972 - BLOCK
      ?auto_48973 - BLOCK
      ?auto_48974 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_48974 ) ( CLEAR ?auto_48973 ) ( ON-TABLE ?auto_48972 ) ( ON ?auto_48973 ?auto_48972 ) ( not ( = ?auto_48972 ?auto_48973 ) ) ( not ( = ?auto_48972 ?auto_48974 ) ) ( not ( = ?auto_48973 ?auto_48974 ) ) )
    :subtasks
    ( ( !STACK ?auto_48974 ?auto_48973 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_48975 - BLOCK
      ?auto_48976 - BLOCK
      ?auto_48977 - BLOCK
    )
    :vars
    (
      ?auto_48978 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_48976 ) ( ON-TABLE ?auto_48975 ) ( ON ?auto_48976 ?auto_48975 ) ( not ( = ?auto_48975 ?auto_48976 ) ) ( not ( = ?auto_48975 ?auto_48977 ) ) ( not ( = ?auto_48976 ?auto_48977 ) ) ( ON ?auto_48977 ?auto_48978 ) ( CLEAR ?auto_48977 ) ( HAND-EMPTY ) ( not ( = ?auto_48975 ?auto_48978 ) ) ( not ( = ?auto_48976 ?auto_48978 ) ) ( not ( = ?auto_48977 ?auto_48978 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_48977 ?auto_48978 )
      ( MAKE-3PILE ?auto_48975 ?auto_48976 ?auto_48977 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_48979 - BLOCK
      ?auto_48980 - BLOCK
      ?auto_48981 - BLOCK
    )
    :vars
    (
      ?auto_48982 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_48979 ) ( not ( = ?auto_48979 ?auto_48980 ) ) ( not ( = ?auto_48979 ?auto_48981 ) ) ( not ( = ?auto_48980 ?auto_48981 ) ) ( ON ?auto_48981 ?auto_48982 ) ( CLEAR ?auto_48981 ) ( not ( = ?auto_48979 ?auto_48982 ) ) ( not ( = ?auto_48980 ?auto_48982 ) ) ( not ( = ?auto_48981 ?auto_48982 ) ) ( HOLDING ?auto_48980 ) ( CLEAR ?auto_48979 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_48979 ?auto_48980 )
      ( MAKE-3PILE ?auto_48979 ?auto_48980 ?auto_48981 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_48983 - BLOCK
      ?auto_48984 - BLOCK
      ?auto_48985 - BLOCK
    )
    :vars
    (
      ?auto_48986 - BLOCK
      ?auto_48989 - BLOCK
      ?auto_48987 - BLOCK
      ?auto_48988 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_48983 ) ( not ( = ?auto_48983 ?auto_48984 ) ) ( not ( = ?auto_48983 ?auto_48985 ) ) ( not ( = ?auto_48984 ?auto_48985 ) ) ( ON ?auto_48985 ?auto_48986 ) ( not ( = ?auto_48983 ?auto_48986 ) ) ( not ( = ?auto_48984 ?auto_48986 ) ) ( not ( = ?auto_48985 ?auto_48986 ) ) ( CLEAR ?auto_48983 ) ( ON ?auto_48984 ?auto_48985 ) ( CLEAR ?auto_48984 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_48989 ) ( ON ?auto_48987 ?auto_48989 ) ( ON ?auto_48988 ?auto_48987 ) ( ON ?auto_48986 ?auto_48988 ) ( not ( = ?auto_48989 ?auto_48987 ) ) ( not ( = ?auto_48989 ?auto_48988 ) ) ( not ( = ?auto_48989 ?auto_48986 ) ) ( not ( = ?auto_48989 ?auto_48985 ) ) ( not ( = ?auto_48989 ?auto_48984 ) ) ( not ( = ?auto_48987 ?auto_48988 ) ) ( not ( = ?auto_48987 ?auto_48986 ) ) ( not ( = ?auto_48987 ?auto_48985 ) ) ( not ( = ?auto_48987 ?auto_48984 ) ) ( not ( = ?auto_48988 ?auto_48986 ) ) ( not ( = ?auto_48988 ?auto_48985 ) ) ( not ( = ?auto_48988 ?auto_48984 ) ) ( not ( = ?auto_48983 ?auto_48989 ) ) ( not ( = ?auto_48983 ?auto_48987 ) ) ( not ( = ?auto_48983 ?auto_48988 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_48989 ?auto_48987 ?auto_48988 ?auto_48986 ?auto_48985 )
      ( MAKE-3PILE ?auto_48983 ?auto_48984 ?auto_48985 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_48990 - BLOCK
      ?auto_48991 - BLOCK
      ?auto_48992 - BLOCK
    )
    :vars
    (
      ?auto_48996 - BLOCK
      ?auto_48993 - BLOCK
      ?auto_48995 - BLOCK
      ?auto_48994 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48990 ?auto_48991 ) ) ( not ( = ?auto_48990 ?auto_48992 ) ) ( not ( = ?auto_48991 ?auto_48992 ) ) ( ON ?auto_48992 ?auto_48996 ) ( not ( = ?auto_48990 ?auto_48996 ) ) ( not ( = ?auto_48991 ?auto_48996 ) ) ( not ( = ?auto_48992 ?auto_48996 ) ) ( ON ?auto_48991 ?auto_48992 ) ( CLEAR ?auto_48991 ) ( ON-TABLE ?auto_48993 ) ( ON ?auto_48995 ?auto_48993 ) ( ON ?auto_48994 ?auto_48995 ) ( ON ?auto_48996 ?auto_48994 ) ( not ( = ?auto_48993 ?auto_48995 ) ) ( not ( = ?auto_48993 ?auto_48994 ) ) ( not ( = ?auto_48993 ?auto_48996 ) ) ( not ( = ?auto_48993 ?auto_48992 ) ) ( not ( = ?auto_48993 ?auto_48991 ) ) ( not ( = ?auto_48995 ?auto_48994 ) ) ( not ( = ?auto_48995 ?auto_48996 ) ) ( not ( = ?auto_48995 ?auto_48992 ) ) ( not ( = ?auto_48995 ?auto_48991 ) ) ( not ( = ?auto_48994 ?auto_48996 ) ) ( not ( = ?auto_48994 ?auto_48992 ) ) ( not ( = ?auto_48994 ?auto_48991 ) ) ( not ( = ?auto_48990 ?auto_48993 ) ) ( not ( = ?auto_48990 ?auto_48995 ) ) ( not ( = ?auto_48990 ?auto_48994 ) ) ( HOLDING ?auto_48990 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_48990 )
      ( MAKE-3PILE ?auto_48990 ?auto_48991 ?auto_48992 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_48997 - BLOCK
      ?auto_48998 - BLOCK
      ?auto_48999 - BLOCK
    )
    :vars
    (
      ?auto_49002 - BLOCK
      ?auto_49003 - BLOCK
      ?auto_49000 - BLOCK
      ?auto_49001 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48997 ?auto_48998 ) ) ( not ( = ?auto_48997 ?auto_48999 ) ) ( not ( = ?auto_48998 ?auto_48999 ) ) ( ON ?auto_48999 ?auto_49002 ) ( not ( = ?auto_48997 ?auto_49002 ) ) ( not ( = ?auto_48998 ?auto_49002 ) ) ( not ( = ?auto_48999 ?auto_49002 ) ) ( ON ?auto_48998 ?auto_48999 ) ( ON-TABLE ?auto_49003 ) ( ON ?auto_49000 ?auto_49003 ) ( ON ?auto_49001 ?auto_49000 ) ( ON ?auto_49002 ?auto_49001 ) ( not ( = ?auto_49003 ?auto_49000 ) ) ( not ( = ?auto_49003 ?auto_49001 ) ) ( not ( = ?auto_49003 ?auto_49002 ) ) ( not ( = ?auto_49003 ?auto_48999 ) ) ( not ( = ?auto_49003 ?auto_48998 ) ) ( not ( = ?auto_49000 ?auto_49001 ) ) ( not ( = ?auto_49000 ?auto_49002 ) ) ( not ( = ?auto_49000 ?auto_48999 ) ) ( not ( = ?auto_49000 ?auto_48998 ) ) ( not ( = ?auto_49001 ?auto_49002 ) ) ( not ( = ?auto_49001 ?auto_48999 ) ) ( not ( = ?auto_49001 ?auto_48998 ) ) ( not ( = ?auto_48997 ?auto_49003 ) ) ( not ( = ?auto_48997 ?auto_49000 ) ) ( not ( = ?auto_48997 ?auto_49001 ) ) ( ON ?auto_48997 ?auto_48998 ) ( CLEAR ?auto_48997 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_49003 ?auto_49000 ?auto_49001 ?auto_49002 ?auto_48999 ?auto_48998 )
      ( MAKE-3PILE ?auto_48997 ?auto_48998 ?auto_48999 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_49007 - BLOCK
      ?auto_49008 - BLOCK
      ?auto_49009 - BLOCK
    )
    :vars
    (
      ?auto_49010 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49010 ?auto_49009 ) ( CLEAR ?auto_49010 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_49007 ) ( ON ?auto_49008 ?auto_49007 ) ( ON ?auto_49009 ?auto_49008 ) ( not ( = ?auto_49007 ?auto_49008 ) ) ( not ( = ?auto_49007 ?auto_49009 ) ) ( not ( = ?auto_49007 ?auto_49010 ) ) ( not ( = ?auto_49008 ?auto_49009 ) ) ( not ( = ?auto_49008 ?auto_49010 ) ) ( not ( = ?auto_49009 ?auto_49010 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_49010 ?auto_49009 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_49011 - BLOCK
      ?auto_49012 - BLOCK
      ?auto_49013 - BLOCK
    )
    :vars
    (
      ?auto_49014 - BLOCK
      ?auto_49015 - BLOCK
      ?auto_49016 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49014 ?auto_49013 ) ( CLEAR ?auto_49014 ) ( ON-TABLE ?auto_49011 ) ( ON ?auto_49012 ?auto_49011 ) ( ON ?auto_49013 ?auto_49012 ) ( not ( = ?auto_49011 ?auto_49012 ) ) ( not ( = ?auto_49011 ?auto_49013 ) ) ( not ( = ?auto_49011 ?auto_49014 ) ) ( not ( = ?auto_49012 ?auto_49013 ) ) ( not ( = ?auto_49012 ?auto_49014 ) ) ( not ( = ?auto_49013 ?auto_49014 ) ) ( HOLDING ?auto_49015 ) ( CLEAR ?auto_49016 ) ( not ( = ?auto_49011 ?auto_49015 ) ) ( not ( = ?auto_49011 ?auto_49016 ) ) ( not ( = ?auto_49012 ?auto_49015 ) ) ( not ( = ?auto_49012 ?auto_49016 ) ) ( not ( = ?auto_49013 ?auto_49015 ) ) ( not ( = ?auto_49013 ?auto_49016 ) ) ( not ( = ?auto_49014 ?auto_49015 ) ) ( not ( = ?auto_49014 ?auto_49016 ) ) ( not ( = ?auto_49015 ?auto_49016 ) ) )
    :subtasks
    ( ( !STACK ?auto_49015 ?auto_49016 )
      ( MAKE-3PILE ?auto_49011 ?auto_49012 ?auto_49013 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_49017 - BLOCK
      ?auto_49018 - BLOCK
      ?auto_49019 - BLOCK
    )
    :vars
    (
      ?auto_49022 - BLOCK
      ?auto_49020 - BLOCK
      ?auto_49021 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49022 ?auto_49019 ) ( ON-TABLE ?auto_49017 ) ( ON ?auto_49018 ?auto_49017 ) ( ON ?auto_49019 ?auto_49018 ) ( not ( = ?auto_49017 ?auto_49018 ) ) ( not ( = ?auto_49017 ?auto_49019 ) ) ( not ( = ?auto_49017 ?auto_49022 ) ) ( not ( = ?auto_49018 ?auto_49019 ) ) ( not ( = ?auto_49018 ?auto_49022 ) ) ( not ( = ?auto_49019 ?auto_49022 ) ) ( CLEAR ?auto_49020 ) ( not ( = ?auto_49017 ?auto_49021 ) ) ( not ( = ?auto_49017 ?auto_49020 ) ) ( not ( = ?auto_49018 ?auto_49021 ) ) ( not ( = ?auto_49018 ?auto_49020 ) ) ( not ( = ?auto_49019 ?auto_49021 ) ) ( not ( = ?auto_49019 ?auto_49020 ) ) ( not ( = ?auto_49022 ?auto_49021 ) ) ( not ( = ?auto_49022 ?auto_49020 ) ) ( not ( = ?auto_49021 ?auto_49020 ) ) ( ON ?auto_49021 ?auto_49022 ) ( CLEAR ?auto_49021 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_49017 ?auto_49018 ?auto_49019 ?auto_49022 )
      ( MAKE-3PILE ?auto_49017 ?auto_49018 ?auto_49019 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_49023 - BLOCK
      ?auto_49024 - BLOCK
      ?auto_49025 - BLOCK
    )
    :vars
    (
      ?auto_49027 - BLOCK
      ?auto_49026 - BLOCK
      ?auto_49028 - BLOCK
      ?auto_49029 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49027 ?auto_49025 ) ( ON-TABLE ?auto_49023 ) ( ON ?auto_49024 ?auto_49023 ) ( ON ?auto_49025 ?auto_49024 ) ( not ( = ?auto_49023 ?auto_49024 ) ) ( not ( = ?auto_49023 ?auto_49025 ) ) ( not ( = ?auto_49023 ?auto_49027 ) ) ( not ( = ?auto_49024 ?auto_49025 ) ) ( not ( = ?auto_49024 ?auto_49027 ) ) ( not ( = ?auto_49025 ?auto_49027 ) ) ( not ( = ?auto_49023 ?auto_49026 ) ) ( not ( = ?auto_49023 ?auto_49028 ) ) ( not ( = ?auto_49024 ?auto_49026 ) ) ( not ( = ?auto_49024 ?auto_49028 ) ) ( not ( = ?auto_49025 ?auto_49026 ) ) ( not ( = ?auto_49025 ?auto_49028 ) ) ( not ( = ?auto_49027 ?auto_49026 ) ) ( not ( = ?auto_49027 ?auto_49028 ) ) ( not ( = ?auto_49026 ?auto_49028 ) ) ( ON ?auto_49026 ?auto_49027 ) ( CLEAR ?auto_49026 ) ( HOLDING ?auto_49028 ) ( CLEAR ?auto_49029 ) ( ON-TABLE ?auto_49029 ) ( not ( = ?auto_49029 ?auto_49028 ) ) ( not ( = ?auto_49023 ?auto_49029 ) ) ( not ( = ?auto_49024 ?auto_49029 ) ) ( not ( = ?auto_49025 ?auto_49029 ) ) ( not ( = ?auto_49027 ?auto_49029 ) ) ( not ( = ?auto_49026 ?auto_49029 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_49029 ?auto_49028 )
      ( MAKE-3PILE ?auto_49023 ?auto_49024 ?auto_49025 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_49721 - BLOCK
      ?auto_49722 - BLOCK
      ?auto_49723 - BLOCK
    )
    :vars
    (
      ?auto_49724 - BLOCK
      ?auto_49726 - BLOCK
      ?auto_49725 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49724 ?auto_49723 ) ( ON-TABLE ?auto_49721 ) ( ON ?auto_49722 ?auto_49721 ) ( ON ?auto_49723 ?auto_49722 ) ( not ( = ?auto_49721 ?auto_49722 ) ) ( not ( = ?auto_49721 ?auto_49723 ) ) ( not ( = ?auto_49721 ?auto_49724 ) ) ( not ( = ?auto_49722 ?auto_49723 ) ) ( not ( = ?auto_49722 ?auto_49724 ) ) ( not ( = ?auto_49723 ?auto_49724 ) ) ( not ( = ?auto_49721 ?auto_49726 ) ) ( not ( = ?auto_49721 ?auto_49725 ) ) ( not ( = ?auto_49722 ?auto_49726 ) ) ( not ( = ?auto_49722 ?auto_49725 ) ) ( not ( = ?auto_49723 ?auto_49726 ) ) ( not ( = ?auto_49723 ?auto_49725 ) ) ( not ( = ?auto_49724 ?auto_49726 ) ) ( not ( = ?auto_49724 ?auto_49725 ) ) ( not ( = ?auto_49726 ?auto_49725 ) ) ( ON ?auto_49726 ?auto_49724 ) ( ON ?auto_49725 ?auto_49726 ) ( CLEAR ?auto_49725 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_49721 ?auto_49722 ?auto_49723 ?auto_49724 ?auto_49726 )
      ( MAKE-3PILE ?auto_49721 ?auto_49722 ?auto_49723 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_49037 - BLOCK
      ?auto_49038 - BLOCK
      ?auto_49039 - BLOCK
    )
    :vars
    (
      ?auto_49041 - BLOCK
      ?auto_49043 - BLOCK
      ?auto_49040 - BLOCK
      ?auto_49042 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49041 ?auto_49039 ) ( ON-TABLE ?auto_49037 ) ( ON ?auto_49038 ?auto_49037 ) ( ON ?auto_49039 ?auto_49038 ) ( not ( = ?auto_49037 ?auto_49038 ) ) ( not ( = ?auto_49037 ?auto_49039 ) ) ( not ( = ?auto_49037 ?auto_49041 ) ) ( not ( = ?auto_49038 ?auto_49039 ) ) ( not ( = ?auto_49038 ?auto_49041 ) ) ( not ( = ?auto_49039 ?auto_49041 ) ) ( not ( = ?auto_49037 ?auto_49043 ) ) ( not ( = ?auto_49037 ?auto_49040 ) ) ( not ( = ?auto_49038 ?auto_49043 ) ) ( not ( = ?auto_49038 ?auto_49040 ) ) ( not ( = ?auto_49039 ?auto_49043 ) ) ( not ( = ?auto_49039 ?auto_49040 ) ) ( not ( = ?auto_49041 ?auto_49043 ) ) ( not ( = ?auto_49041 ?auto_49040 ) ) ( not ( = ?auto_49043 ?auto_49040 ) ) ( ON ?auto_49043 ?auto_49041 ) ( not ( = ?auto_49042 ?auto_49040 ) ) ( not ( = ?auto_49037 ?auto_49042 ) ) ( not ( = ?auto_49038 ?auto_49042 ) ) ( not ( = ?auto_49039 ?auto_49042 ) ) ( not ( = ?auto_49041 ?auto_49042 ) ) ( not ( = ?auto_49043 ?auto_49042 ) ) ( ON ?auto_49040 ?auto_49043 ) ( CLEAR ?auto_49040 ) ( HOLDING ?auto_49042 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_49042 )
      ( MAKE-3PILE ?auto_49037 ?auto_49038 ?auto_49039 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_49044 - BLOCK
      ?auto_49045 - BLOCK
      ?auto_49046 - BLOCK
    )
    :vars
    (
      ?auto_49047 - BLOCK
      ?auto_49049 - BLOCK
      ?auto_49050 - BLOCK
      ?auto_49048 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49047 ?auto_49046 ) ( ON-TABLE ?auto_49044 ) ( ON ?auto_49045 ?auto_49044 ) ( ON ?auto_49046 ?auto_49045 ) ( not ( = ?auto_49044 ?auto_49045 ) ) ( not ( = ?auto_49044 ?auto_49046 ) ) ( not ( = ?auto_49044 ?auto_49047 ) ) ( not ( = ?auto_49045 ?auto_49046 ) ) ( not ( = ?auto_49045 ?auto_49047 ) ) ( not ( = ?auto_49046 ?auto_49047 ) ) ( not ( = ?auto_49044 ?auto_49049 ) ) ( not ( = ?auto_49044 ?auto_49050 ) ) ( not ( = ?auto_49045 ?auto_49049 ) ) ( not ( = ?auto_49045 ?auto_49050 ) ) ( not ( = ?auto_49046 ?auto_49049 ) ) ( not ( = ?auto_49046 ?auto_49050 ) ) ( not ( = ?auto_49047 ?auto_49049 ) ) ( not ( = ?auto_49047 ?auto_49050 ) ) ( not ( = ?auto_49049 ?auto_49050 ) ) ( ON ?auto_49049 ?auto_49047 ) ( not ( = ?auto_49048 ?auto_49050 ) ) ( not ( = ?auto_49044 ?auto_49048 ) ) ( not ( = ?auto_49045 ?auto_49048 ) ) ( not ( = ?auto_49046 ?auto_49048 ) ) ( not ( = ?auto_49047 ?auto_49048 ) ) ( not ( = ?auto_49049 ?auto_49048 ) ) ( ON ?auto_49050 ?auto_49049 ) ( ON ?auto_49048 ?auto_49050 ) ( CLEAR ?auto_49048 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_49044 ?auto_49045 ?auto_49046 ?auto_49047 ?auto_49049 ?auto_49050 )
      ( MAKE-3PILE ?auto_49044 ?auto_49045 ?auto_49046 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_49055 - BLOCK
      ?auto_49056 - BLOCK
      ?auto_49057 - BLOCK
      ?auto_49058 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_49058 ) ( CLEAR ?auto_49057 ) ( ON-TABLE ?auto_49055 ) ( ON ?auto_49056 ?auto_49055 ) ( ON ?auto_49057 ?auto_49056 ) ( not ( = ?auto_49055 ?auto_49056 ) ) ( not ( = ?auto_49055 ?auto_49057 ) ) ( not ( = ?auto_49055 ?auto_49058 ) ) ( not ( = ?auto_49056 ?auto_49057 ) ) ( not ( = ?auto_49056 ?auto_49058 ) ) ( not ( = ?auto_49057 ?auto_49058 ) ) )
    :subtasks
    ( ( !STACK ?auto_49058 ?auto_49057 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_49059 - BLOCK
      ?auto_49060 - BLOCK
      ?auto_49061 - BLOCK
      ?auto_49062 - BLOCK
    )
    :vars
    (
      ?auto_49063 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_49061 ) ( ON-TABLE ?auto_49059 ) ( ON ?auto_49060 ?auto_49059 ) ( ON ?auto_49061 ?auto_49060 ) ( not ( = ?auto_49059 ?auto_49060 ) ) ( not ( = ?auto_49059 ?auto_49061 ) ) ( not ( = ?auto_49059 ?auto_49062 ) ) ( not ( = ?auto_49060 ?auto_49061 ) ) ( not ( = ?auto_49060 ?auto_49062 ) ) ( not ( = ?auto_49061 ?auto_49062 ) ) ( ON ?auto_49062 ?auto_49063 ) ( CLEAR ?auto_49062 ) ( HAND-EMPTY ) ( not ( = ?auto_49059 ?auto_49063 ) ) ( not ( = ?auto_49060 ?auto_49063 ) ) ( not ( = ?auto_49061 ?auto_49063 ) ) ( not ( = ?auto_49062 ?auto_49063 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_49062 ?auto_49063 )
      ( MAKE-4PILE ?auto_49059 ?auto_49060 ?auto_49061 ?auto_49062 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_49064 - BLOCK
      ?auto_49065 - BLOCK
      ?auto_49066 - BLOCK
      ?auto_49067 - BLOCK
    )
    :vars
    (
      ?auto_49068 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_49064 ) ( ON ?auto_49065 ?auto_49064 ) ( not ( = ?auto_49064 ?auto_49065 ) ) ( not ( = ?auto_49064 ?auto_49066 ) ) ( not ( = ?auto_49064 ?auto_49067 ) ) ( not ( = ?auto_49065 ?auto_49066 ) ) ( not ( = ?auto_49065 ?auto_49067 ) ) ( not ( = ?auto_49066 ?auto_49067 ) ) ( ON ?auto_49067 ?auto_49068 ) ( CLEAR ?auto_49067 ) ( not ( = ?auto_49064 ?auto_49068 ) ) ( not ( = ?auto_49065 ?auto_49068 ) ) ( not ( = ?auto_49066 ?auto_49068 ) ) ( not ( = ?auto_49067 ?auto_49068 ) ) ( HOLDING ?auto_49066 ) ( CLEAR ?auto_49065 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_49064 ?auto_49065 ?auto_49066 )
      ( MAKE-4PILE ?auto_49064 ?auto_49065 ?auto_49066 ?auto_49067 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_49069 - BLOCK
      ?auto_49070 - BLOCK
      ?auto_49071 - BLOCK
      ?auto_49072 - BLOCK
    )
    :vars
    (
      ?auto_49073 - BLOCK
      ?auto_49075 - BLOCK
      ?auto_49074 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_49069 ) ( ON ?auto_49070 ?auto_49069 ) ( not ( = ?auto_49069 ?auto_49070 ) ) ( not ( = ?auto_49069 ?auto_49071 ) ) ( not ( = ?auto_49069 ?auto_49072 ) ) ( not ( = ?auto_49070 ?auto_49071 ) ) ( not ( = ?auto_49070 ?auto_49072 ) ) ( not ( = ?auto_49071 ?auto_49072 ) ) ( ON ?auto_49072 ?auto_49073 ) ( not ( = ?auto_49069 ?auto_49073 ) ) ( not ( = ?auto_49070 ?auto_49073 ) ) ( not ( = ?auto_49071 ?auto_49073 ) ) ( not ( = ?auto_49072 ?auto_49073 ) ) ( CLEAR ?auto_49070 ) ( ON ?auto_49071 ?auto_49072 ) ( CLEAR ?auto_49071 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_49075 ) ( ON ?auto_49074 ?auto_49075 ) ( ON ?auto_49073 ?auto_49074 ) ( not ( = ?auto_49075 ?auto_49074 ) ) ( not ( = ?auto_49075 ?auto_49073 ) ) ( not ( = ?auto_49075 ?auto_49072 ) ) ( not ( = ?auto_49075 ?auto_49071 ) ) ( not ( = ?auto_49074 ?auto_49073 ) ) ( not ( = ?auto_49074 ?auto_49072 ) ) ( not ( = ?auto_49074 ?auto_49071 ) ) ( not ( = ?auto_49069 ?auto_49075 ) ) ( not ( = ?auto_49069 ?auto_49074 ) ) ( not ( = ?auto_49070 ?auto_49075 ) ) ( not ( = ?auto_49070 ?auto_49074 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_49075 ?auto_49074 ?auto_49073 ?auto_49072 )
      ( MAKE-4PILE ?auto_49069 ?auto_49070 ?auto_49071 ?auto_49072 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_49076 - BLOCK
      ?auto_49077 - BLOCK
      ?auto_49078 - BLOCK
      ?auto_49079 - BLOCK
    )
    :vars
    (
      ?auto_49082 - BLOCK
      ?auto_49081 - BLOCK
      ?auto_49080 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_49076 ) ( not ( = ?auto_49076 ?auto_49077 ) ) ( not ( = ?auto_49076 ?auto_49078 ) ) ( not ( = ?auto_49076 ?auto_49079 ) ) ( not ( = ?auto_49077 ?auto_49078 ) ) ( not ( = ?auto_49077 ?auto_49079 ) ) ( not ( = ?auto_49078 ?auto_49079 ) ) ( ON ?auto_49079 ?auto_49082 ) ( not ( = ?auto_49076 ?auto_49082 ) ) ( not ( = ?auto_49077 ?auto_49082 ) ) ( not ( = ?auto_49078 ?auto_49082 ) ) ( not ( = ?auto_49079 ?auto_49082 ) ) ( ON ?auto_49078 ?auto_49079 ) ( CLEAR ?auto_49078 ) ( ON-TABLE ?auto_49081 ) ( ON ?auto_49080 ?auto_49081 ) ( ON ?auto_49082 ?auto_49080 ) ( not ( = ?auto_49081 ?auto_49080 ) ) ( not ( = ?auto_49081 ?auto_49082 ) ) ( not ( = ?auto_49081 ?auto_49079 ) ) ( not ( = ?auto_49081 ?auto_49078 ) ) ( not ( = ?auto_49080 ?auto_49082 ) ) ( not ( = ?auto_49080 ?auto_49079 ) ) ( not ( = ?auto_49080 ?auto_49078 ) ) ( not ( = ?auto_49076 ?auto_49081 ) ) ( not ( = ?auto_49076 ?auto_49080 ) ) ( not ( = ?auto_49077 ?auto_49081 ) ) ( not ( = ?auto_49077 ?auto_49080 ) ) ( HOLDING ?auto_49077 ) ( CLEAR ?auto_49076 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_49076 ?auto_49077 )
      ( MAKE-4PILE ?auto_49076 ?auto_49077 ?auto_49078 ?auto_49079 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_49083 - BLOCK
      ?auto_49084 - BLOCK
      ?auto_49085 - BLOCK
      ?auto_49086 - BLOCK
    )
    :vars
    (
      ?auto_49087 - BLOCK
      ?auto_49088 - BLOCK
      ?auto_49089 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_49083 ) ( not ( = ?auto_49083 ?auto_49084 ) ) ( not ( = ?auto_49083 ?auto_49085 ) ) ( not ( = ?auto_49083 ?auto_49086 ) ) ( not ( = ?auto_49084 ?auto_49085 ) ) ( not ( = ?auto_49084 ?auto_49086 ) ) ( not ( = ?auto_49085 ?auto_49086 ) ) ( ON ?auto_49086 ?auto_49087 ) ( not ( = ?auto_49083 ?auto_49087 ) ) ( not ( = ?auto_49084 ?auto_49087 ) ) ( not ( = ?auto_49085 ?auto_49087 ) ) ( not ( = ?auto_49086 ?auto_49087 ) ) ( ON ?auto_49085 ?auto_49086 ) ( ON-TABLE ?auto_49088 ) ( ON ?auto_49089 ?auto_49088 ) ( ON ?auto_49087 ?auto_49089 ) ( not ( = ?auto_49088 ?auto_49089 ) ) ( not ( = ?auto_49088 ?auto_49087 ) ) ( not ( = ?auto_49088 ?auto_49086 ) ) ( not ( = ?auto_49088 ?auto_49085 ) ) ( not ( = ?auto_49089 ?auto_49087 ) ) ( not ( = ?auto_49089 ?auto_49086 ) ) ( not ( = ?auto_49089 ?auto_49085 ) ) ( not ( = ?auto_49083 ?auto_49088 ) ) ( not ( = ?auto_49083 ?auto_49089 ) ) ( not ( = ?auto_49084 ?auto_49088 ) ) ( not ( = ?auto_49084 ?auto_49089 ) ) ( CLEAR ?auto_49083 ) ( ON ?auto_49084 ?auto_49085 ) ( CLEAR ?auto_49084 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_49088 ?auto_49089 ?auto_49087 ?auto_49086 ?auto_49085 )
      ( MAKE-4PILE ?auto_49083 ?auto_49084 ?auto_49085 ?auto_49086 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_49090 - BLOCK
      ?auto_49091 - BLOCK
      ?auto_49092 - BLOCK
      ?auto_49093 - BLOCK
    )
    :vars
    (
      ?auto_49094 - BLOCK
      ?auto_49095 - BLOCK
      ?auto_49096 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49090 ?auto_49091 ) ) ( not ( = ?auto_49090 ?auto_49092 ) ) ( not ( = ?auto_49090 ?auto_49093 ) ) ( not ( = ?auto_49091 ?auto_49092 ) ) ( not ( = ?auto_49091 ?auto_49093 ) ) ( not ( = ?auto_49092 ?auto_49093 ) ) ( ON ?auto_49093 ?auto_49094 ) ( not ( = ?auto_49090 ?auto_49094 ) ) ( not ( = ?auto_49091 ?auto_49094 ) ) ( not ( = ?auto_49092 ?auto_49094 ) ) ( not ( = ?auto_49093 ?auto_49094 ) ) ( ON ?auto_49092 ?auto_49093 ) ( ON-TABLE ?auto_49095 ) ( ON ?auto_49096 ?auto_49095 ) ( ON ?auto_49094 ?auto_49096 ) ( not ( = ?auto_49095 ?auto_49096 ) ) ( not ( = ?auto_49095 ?auto_49094 ) ) ( not ( = ?auto_49095 ?auto_49093 ) ) ( not ( = ?auto_49095 ?auto_49092 ) ) ( not ( = ?auto_49096 ?auto_49094 ) ) ( not ( = ?auto_49096 ?auto_49093 ) ) ( not ( = ?auto_49096 ?auto_49092 ) ) ( not ( = ?auto_49090 ?auto_49095 ) ) ( not ( = ?auto_49090 ?auto_49096 ) ) ( not ( = ?auto_49091 ?auto_49095 ) ) ( not ( = ?auto_49091 ?auto_49096 ) ) ( ON ?auto_49091 ?auto_49092 ) ( CLEAR ?auto_49091 ) ( HOLDING ?auto_49090 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_49090 )
      ( MAKE-4PILE ?auto_49090 ?auto_49091 ?auto_49092 ?auto_49093 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_49097 - BLOCK
      ?auto_49098 - BLOCK
      ?auto_49099 - BLOCK
      ?auto_49100 - BLOCK
    )
    :vars
    (
      ?auto_49101 - BLOCK
      ?auto_49103 - BLOCK
      ?auto_49102 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49097 ?auto_49098 ) ) ( not ( = ?auto_49097 ?auto_49099 ) ) ( not ( = ?auto_49097 ?auto_49100 ) ) ( not ( = ?auto_49098 ?auto_49099 ) ) ( not ( = ?auto_49098 ?auto_49100 ) ) ( not ( = ?auto_49099 ?auto_49100 ) ) ( ON ?auto_49100 ?auto_49101 ) ( not ( = ?auto_49097 ?auto_49101 ) ) ( not ( = ?auto_49098 ?auto_49101 ) ) ( not ( = ?auto_49099 ?auto_49101 ) ) ( not ( = ?auto_49100 ?auto_49101 ) ) ( ON ?auto_49099 ?auto_49100 ) ( ON-TABLE ?auto_49103 ) ( ON ?auto_49102 ?auto_49103 ) ( ON ?auto_49101 ?auto_49102 ) ( not ( = ?auto_49103 ?auto_49102 ) ) ( not ( = ?auto_49103 ?auto_49101 ) ) ( not ( = ?auto_49103 ?auto_49100 ) ) ( not ( = ?auto_49103 ?auto_49099 ) ) ( not ( = ?auto_49102 ?auto_49101 ) ) ( not ( = ?auto_49102 ?auto_49100 ) ) ( not ( = ?auto_49102 ?auto_49099 ) ) ( not ( = ?auto_49097 ?auto_49103 ) ) ( not ( = ?auto_49097 ?auto_49102 ) ) ( not ( = ?auto_49098 ?auto_49103 ) ) ( not ( = ?auto_49098 ?auto_49102 ) ) ( ON ?auto_49098 ?auto_49099 ) ( ON ?auto_49097 ?auto_49098 ) ( CLEAR ?auto_49097 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_49103 ?auto_49102 ?auto_49101 ?auto_49100 ?auto_49099 ?auto_49098 )
      ( MAKE-4PILE ?auto_49097 ?auto_49098 ?auto_49099 ?auto_49100 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_49106 - BLOCK
      ?auto_49107 - BLOCK
    )
    :vars
    (
      ?auto_49108 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49108 ?auto_49107 ) ( CLEAR ?auto_49108 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_49106 ) ( ON ?auto_49107 ?auto_49106 ) ( not ( = ?auto_49106 ?auto_49107 ) ) ( not ( = ?auto_49106 ?auto_49108 ) ) ( not ( = ?auto_49107 ?auto_49108 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_49108 ?auto_49107 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_49109 - BLOCK
      ?auto_49110 - BLOCK
    )
    :vars
    (
      ?auto_49111 - BLOCK
      ?auto_49112 - BLOCK
      ?auto_49113 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49111 ?auto_49110 ) ( CLEAR ?auto_49111 ) ( ON-TABLE ?auto_49109 ) ( ON ?auto_49110 ?auto_49109 ) ( not ( = ?auto_49109 ?auto_49110 ) ) ( not ( = ?auto_49109 ?auto_49111 ) ) ( not ( = ?auto_49110 ?auto_49111 ) ) ( HOLDING ?auto_49112 ) ( CLEAR ?auto_49113 ) ( not ( = ?auto_49109 ?auto_49112 ) ) ( not ( = ?auto_49109 ?auto_49113 ) ) ( not ( = ?auto_49110 ?auto_49112 ) ) ( not ( = ?auto_49110 ?auto_49113 ) ) ( not ( = ?auto_49111 ?auto_49112 ) ) ( not ( = ?auto_49111 ?auto_49113 ) ) ( not ( = ?auto_49112 ?auto_49113 ) ) )
    :subtasks
    ( ( !STACK ?auto_49112 ?auto_49113 )
      ( MAKE-2PILE ?auto_49109 ?auto_49110 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_49114 - BLOCK
      ?auto_49115 - BLOCK
    )
    :vars
    (
      ?auto_49118 - BLOCK
      ?auto_49117 - BLOCK
      ?auto_49116 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49118 ?auto_49115 ) ( ON-TABLE ?auto_49114 ) ( ON ?auto_49115 ?auto_49114 ) ( not ( = ?auto_49114 ?auto_49115 ) ) ( not ( = ?auto_49114 ?auto_49118 ) ) ( not ( = ?auto_49115 ?auto_49118 ) ) ( CLEAR ?auto_49117 ) ( not ( = ?auto_49114 ?auto_49116 ) ) ( not ( = ?auto_49114 ?auto_49117 ) ) ( not ( = ?auto_49115 ?auto_49116 ) ) ( not ( = ?auto_49115 ?auto_49117 ) ) ( not ( = ?auto_49118 ?auto_49116 ) ) ( not ( = ?auto_49118 ?auto_49117 ) ) ( not ( = ?auto_49116 ?auto_49117 ) ) ( ON ?auto_49116 ?auto_49118 ) ( CLEAR ?auto_49116 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_49114 ?auto_49115 ?auto_49118 )
      ( MAKE-2PILE ?auto_49114 ?auto_49115 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_49119 - BLOCK
      ?auto_49120 - BLOCK
    )
    :vars
    (
      ?auto_49121 - BLOCK
      ?auto_49123 - BLOCK
      ?auto_49122 - BLOCK
      ?auto_49125 - BLOCK
      ?auto_49124 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49121 ?auto_49120 ) ( ON-TABLE ?auto_49119 ) ( ON ?auto_49120 ?auto_49119 ) ( not ( = ?auto_49119 ?auto_49120 ) ) ( not ( = ?auto_49119 ?auto_49121 ) ) ( not ( = ?auto_49120 ?auto_49121 ) ) ( not ( = ?auto_49119 ?auto_49123 ) ) ( not ( = ?auto_49119 ?auto_49122 ) ) ( not ( = ?auto_49120 ?auto_49123 ) ) ( not ( = ?auto_49120 ?auto_49122 ) ) ( not ( = ?auto_49121 ?auto_49123 ) ) ( not ( = ?auto_49121 ?auto_49122 ) ) ( not ( = ?auto_49123 ?auto_49122 ) ) ( ON ?auto_49123 ?auto_49121 ) ( CLEAR ?auto_49123 ) ( HOLDING ?auto_49122 ) ( CLEAR ?auto_49125 ) ( ON-TABLE ?auto_49124 ) ( ON ?auto_49125 ?auto_49124 ) ( not ( = ?auto_49124 ?auto_49125 ) ) ( not ( = ?auto_49124 ?auto_49122 ) ) ( not ( = ?auto_49125 ?auto_49122 ) ) ( not ( = ?auto_49119 ?auto_49125 ) ) ( not ( = ?auto_49119 ?auto_49124 ) ) ( not ( = ?auto_49120 ?auto_49125 ) ) ( not ( = ?auto_49120 ?auto_49124 ) ) ( not ( = ?auto_49121 ?auto_49125 ) ) ( not ( = ?auto_49121 ?auto_49124 ) ) ( not ( = ?auto_49123 ?auto_49125 ) ) ( not ( = ?auto_49123 ?auto_49124 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_49124 ?auto_49125 ?auto_49122 )
      ( MAKE-2PILE ?auto_49119 ?auto_49120 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_49126 - BLOCK
      ?auto_49127 - BLOCK
    )
    :vars
    (
      ?auto_49128 - BLOCK
      ?auto_49132 - BLOCK
      ?auto_49130 - BLOCK
      ?auto_49131 - BLOCK
      ?auto_49129 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49128 ?auto_49127 ) ( ON-TABLE ?auto_49126 ) ( ON ?auto_49127 ?auto_49126 ) ( not ( = ?auto_49126 ?auto_49127 ) ) ( not ( = ?auto_49126 ?auto_49128 ) ) ( not ( = ?auto_49127 ?auto_49128 ) ) ( not ( = ?auto_49126 ?auto_49132 ) ) ( not ( = ?auto_49126 ?auto_49130 ) ) ( not ( = ?auto_49127 ?auto_49132 ) ) ( not ( = ?auto_49127 ?auto_49130 ) ) ( not ( = ?auto_49128 ?auto_49132 ) ) ( not ( = ?auto_49128 ?auto_49130 ) ) ( not ( = ?auto_49132 ?auto_49130 ) ) ( ON ?auto_49132 ?auto_49128 ) ( CLEAR ?auto_49131 ) ( ON-TABLE ?auto_49129 ) ( ON ?auto_49131 ?auto_49129 ) ( not ( = ?auto_49129 ?auto_49131 ) ) ( not ( = ?auto_49129 ?auto_49130 ) ) ( not ( = ?auto_49131 ?auto_49130 ) ) ( not ( = ?auto_49126 ?auto_49131 ) ) ( not ( = ?auto_49126 ?auto_49129 ) ) ( not ( = ?auto_49127 ?auto_49131 ) ) ( not ( = ?auto_49127 ?auto_49129 ) ) ( not ( = ?auto_49128 ?auto_49131 ) ) ( not ( = ?auto_49128 ?auto_49129 ) ) ( not ( = ?auto_49132 ?auto_49131 ) ) ( not ( = ?auto_49132 ?auto_49129 ) ) ( ON ?auto_49130 ?auto_49132 ) ( CLEAR ?auto_49130 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_49126 ?auto_49127 ?auto_49128 ?auto_49132 )
      ( MAKE-2PILE ?auto_49126 ?auto_49127 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_49133 - BLOCK
      ?auto_49134 - BLOCK
    )
    :vars
    (
      ?auto_49136 - BLOCK
      ?auto_49137 - BLOCK
      ?auto_49135 - BLOCK
      ?auto_49138 - BLOCK
      ?auto_49139 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49136 ?auto_49134 ) ( ON-TABLE ?auto_49133 ) ( ON ?auto_49134 ?auto_49133 ) ( not ( = ?auto_49133 ?auto_49134 ) ) ( not ( = ?auto_49133 ?auto_49136 ) ) ( not ( = ?auto_49134 ?auto_49136 ) ) ( not ( = ?auto_49133 ?auto_49137 ) ) ( not ( = ?auto_49133 ?auto_49135 ) ) ( not ( = ?auto_49134 ?auto_49137 ) ) ( not ( = ?auto_49134 ?auto_49135 ) ) ( not ( = ?auto_49136 ?auto_49137 ) ) ( not ( = ?auto_49136 ?auto_49135 ) ) ( not ( = ?auto_49137 ?auto_49135 ) ) ( ON ?auto_49137 ?auto_49136 ) ( ON-TABLE ?auto_49138 ) ( not ( = ?auto_49138 ?auto_49139 ) ) ( not ( = ?auto_49138 ?auto_49135 ) ) ( not ( = ?auto_49139 ?auto_49135 ) ) ( not ( = ?auto_49133 ?auto_49139 ) ) ( not ( = ?auto_49133 ?auto_49138 ) ) ( not ( = ?auto_49134 ?auto_49139 ) ) ( not ( = ?auto_49134 ?auto_49138 ) ) ( not ( = ?auto_49136 ?auto_49139 ) ) ( not ( = ?auto_49136 ?auto_49138 ) ) ( not ( = ?auto_49137 ?auto_49139 ) ) ( not ( = ?auto_49137 ?auto_49138 ) ) ( ON ?auto_49135 ?auto_49137 ) ( CLEAR ?auto_49135 ) ( HOLDING ?auto_49139 ) ( CLEAR ?auto_49138 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_49138 ?auto_49139 )
      ( MAKE-2PILE ?auto_49133 ?auto_49134 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_49911 - BLOCK
      ?auto_49912 - BLOCK
    )
    :vars
    (
      ?auto_49916 - BLOCK
      ?auto_49915 - BLOCK
      ?auto_49914 - BLOCK
      ?auto_49913 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49916 ?auto_49912 ) ( ON-TABLE ?auto_49911 ) ( ON ?auto_49912 ?auto_49911 ) ( not ( = ?auto_49911 ?auto_49912 ) ) ( not ( = ?auto_49911 ?auto_49916 ) ) ( not ( = ?auto_49912 ?auto_49916 ) ) ( not ( = ?auto_49911 ?auto_49915 ) ) ( not ( = ?auto_49911 ?auto_49914 ) ) ( not ( = ?auto_49912 ?auto_49915 ) ) ( not ( = ?auto_49912 ?auto_49914 ) ) ( not ( = ?auto_49916 ?auto_49915 ) ) ( not ( = ?auto_49916 ?auto_49914 ) ) ( not ( = ?auto_49915 ?auto_49914 ) ) ( ON ?auto_49915 ?auto_49916 ) ( not ( = ?auto_49913 ?auto_49914 ) ) ( not ( = ?auto_49911 ?auto_49913 ) ) ( not ( = ?auto_49912 ?auto_49913 ) ) ( not ( = ?auto_49916 ?auto_49913 ) ) ( not ( = ?auto_49915 ?auto_49913 ) ) ( ON ?auto_49914 ?auto_49915 ) ( ON ?auto_49913 ?auto_49914 ) ( CLEAR ?auto_49913 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_49911 ?auto_49912 ?auto_49916 ?auto_49915 ?auto_49914 )
      ( MAKE-2PILE ?auto_49911 ?auto_49912 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_49147 - BLOCK
      ?auto_49148 - BLOCK
    )
    :vars
    (
      ?auto_49152 - BLOCK
      ?auto_49149 - BLOCK
      ?auto_49151 - BLOCK
      ?auto_49153 - BLOCK
      ?auto_49150 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49152 ?auto_49148 ) ( ON-TABLE ?auto_49147 ) ( ON ?auto_49148 ?auto_49147 ) ( not ( = ?auto_49147 ?auto_49148 ) ) ( not ( = ?auto_49147 ?auto_49152 ) ) ( not ( = ?auto_49148 ?auto_49152 ) ) ( not ( = ?auto_49147 ?auto_49149 ) ) ( not ( = ?auto_49147 ?auto_49151 ) ) ( not ( = ?auto_49148 ?auto_49149 ) ) ( not ( = ?auto_49148 ?auto_49151 ) ) ( not ( = ?auto_49152 ?auto_49149 ) ) ( not ( = ?auto_49152 ?auto_49151 ) ) ( not ( = ?auto_49149 ?auto_49151 ) ) ( ON ?auto_49149 ?auto_49152 ) ( not ( = ?auto_49153 ?auto_49150 ) ) ( not ( = ?auto_49153 ?auto_49151 ) ) ( not ( = ?auto_49150 ?auto_49151 ) ) ( not ( = ?auto_49147 ?auto_49150 ) ) ( not ( = ?auto_49147 ?auto_49153 ) ) ( not ( = ?auto_49148 ?auto_49150 ) ) ( not ( = ?auto_49148 ?auto_49153 ) ) ( not ( = ?auto_49152 ?auto_49150 ) ) ( not ( = ?auto_49152 ?auto_49153 ) ) ( not ( = ?auto_49149 ?auto_49150 ) ) ( not ( = ?auto_49149 ?auto_49153 ) ) ( ON ?auto_49151 ?auto_49149 ) ( ON ?auto_49150 ?auto_49151 ) ( CLEAR ?auto_49150 ) ( HOLDING ?auto_49153 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_49153 )
      ( MAKE-2PILE ?auto_49147 ?auto_49148 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_49154 - BLOCK
      ?auto_49155 - BLOCK
    )
    :vars
    (
      ?auto_49159 - BLOCK
      ?auto_49157 - BLOCK
      ?auto_49156 - BLOCK
      ?auto_49160 - BLOCK
      ?auto_49158 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49159 ?auto_49155 ) ( ON-TABLE ?auto_49154 ) ( ON ?auto_49155 ?auto_49154 ) ( not ( = ?auto_49154 ?auto_49155 ) ) ( not ( = ?auto_49154 ?auto_49159 ) ) ( not ( = ?auto_49155 ?auto_49159 ) ) ( not ( = ?auto_49154 ?auto_49157 ) ) ( not ( = ?auto_49154 ?auto_49156 ) ) ( not ( = ?auto_49155 ?auto_49157 ) ) ( not ( = ?auto_49155 ?auto_49156 ) ) ( not ( = ?auto_49159 ?auto_49157 ) ) ( not ( = ?auto_49159 ?auto_49156 ) ) ( not ( = ?auto_49157 ?auto_49156 ) ) ( ON ?auto_49157 ?auto_49159 ) ( not ( = ?auto_49160 ?auto_49158 ) ) ( not ( = ?auto_49160 ?auto_49156 ) ) ( not ( = ?auto_49158 ?auto_49156 ) ) ( not ( = ?auto_49154 ?auto_49158 ) ) ( not ( = ?auto_49154 ?auto_49160 ) ) ( not ( = ?auto_49155 ?auto_49158 ) ) ( not ( = ?auto_49155 ?auto_49160 ) ) ( not ( = ?auto_49159 ?auto_49158 ) ) ( not ( = ?auto_49159 ?auto_49160 ) ) ( not ( = ?auto_49157 ?auto_49158 ) ) ( not ( = ?auto_49157 ?auto_49160 ) ) ( ON ?auto_49156 ?auto_49157 ) ( ON ?auto_49158 ?auto_49156 ) ( ON ?auto_49160 ?auto_49158 ) ( CLEAR ?auto_49160 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_49154 ?auto_49155 ?auto_49159 ?auto_49157 ?auto_49156 ?auto_49158 )
      ( MAKE-2PILE ?auto_49154 ?auto_49155 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_49166 - BLOCK
      ?auto_49167 - BLOCK
      ?auto_49168 - BLOCK
      ?auto_49169 - BLOCK
      ?auto_49170 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_49170 ) ( CLEAR ?auto_49169 ) ( ON-TABLE ?auto_49166 ) ( ON ?auto_49167 ?auto_49166 ) ( ON ?auto_49168 ?auto_49167 ) ( ON ?auto_49169 ?auto_49168 ) ( not ( = ?auto_49166 ?auto_49167 ) ) ( not ( = ?auto_49166 ?auto_49168 ) ) ( not ( = ?auto_49166 ?auto_49169 ) ) ( not ( = ?auto_49166 ?auto_49170 ) ) ( not ( = ?auto_49167 ?auto_49168 ) ) ( not ( = ?auto_49167 ?auto_49169 ) ) ( not ( = ?auto_49167 ?auto_49170 ) ) ( not ( = ?auto_49168 ?auto_49169 ) ) ( not ( = ?auto_49168 ?auto_49170 ) ) ( not ( = ?auto_49169 ?auto_49170 ) ) )
    :subtasks
    ( ( !STACK ?auto_49170 ?auto_49169 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_49171 - BLOCK
      ?auto_49172 - BLOCK
      ?auto_49173 - BLOCK
      ?auto_49174 - BLOCK
      ?auto_49175 - BLOCK
    )
    :vars
    (
      ?auto_49176 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_49174 ) ( ON-TABLE ?auto_49171 ) ( ON ?auto_49172 ?auto_49171 ) ( ON ?auto_49173 ?auto_49172 ) ( ON ?auto_49174 ?auto_49173 ) ( not ( = ?auto_49171 ?auto_49172 ) ) ( not ( = ?auto_49171 ?auto_49173 ) ) ( not ( = ?auto_49171 ?auto_49174 ) ) ( not ( = ?auto_49171 ?auto_49175 ) ) ( not ( = ?auto_49172 ?auto_49173 ) ) ( not ( = ?auto_49172 ?auto_49174 ) ) ( not ( = ?auto_49172 ?auto_49175 ) ) ( not ( = ?auto_49173 ?auto_49174 ) ) ( not ( = ?auto_49173 ?auto_49175 ) ) ( not ( = ?auto_49174 ?auto_49175 ) ) ( ON ?auto_49175 ?auto_49176 ) ( CLEAR ?auto_49175 ) ( HAND-EMPTY ) ( not ( = ?auto_49171 ?auto_49176 ) ) ( not ( = ?auto_49172 ?auto_49176 ) ) ( not ( = ?auto_49173 ?auto_49176 ) ) ( not ( = ?auto_49174 ?auto_49176 ) ) ( not ( = ?auto_49175 ?auto_49176 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_49175 ?auto_49176 )
      ( MAKE-5PILE ?auto_49171 ?auto_49172 ?auto_49173 ?auto_49174 ?auto_49175 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_49177 - BLOCK
      ?auto_49178 - BLOCK
      ?auto_49179 - BLOCK
      ?auto_49180 - BLOCK
      ?auto_49181 - BLOCK
    )
    :vars
    (
      ?auto_49182 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_49177 ) ( ON ?auto_49178 ?auto_49177 ) ( ON ?auto_49179 ?auto_49178 ) ( not ( = ?auto_49177 ?auto_49178 ) ) ( not ( = ?auto_49177 ?auto_49179 ) ) ( not ( = ?auto_49177 ?auto_49180 ) ) ( not ( = ?auto_49177 ?auto_49181 ) ) ( not ( = ?auto_49178 ?auto_49179 ) ) ( not ( = ?auto_49178 ?auto_49180 ) ) ( not ( = ?auto_49178 ?auto_49181 ) ) ( not ( = ?auto_49179 ?auto_49180 ) ) ( not ( = ?auto_49179 ?auto_49181 ) ) ( not ( = ?auto_49180 ?auto_49181 ) ) ( ON ?auto_49181 ?auto_49182 ) ( CLEAR ?auto_49181 ) ( not ( = ?auto_49177 ?auto_49182 ) ) ( not ( = ?auto_49178 ?auto_49182 ) ) ( not ( = ?auto_49179 ?auto_49182 ) ) ( not ( = ?auto_49180 ?auto_49182 ) ) ( not ( = ?auto_49181 ?auto_49182 ) ) ( HOLDING ?auto_49180 ) ( CLEAR ?auto_49179 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_49177 ?auto_49178 ?auto_49179 ?auto_49180 )
      ( MAKE-5PILE ?auto_49177 ?auto_49178 ?auto_49179 ?auto_49180 ?auto_49181 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_49183 - BLOCK
      ?auto_49184 - BLOCK
      ?auto_49185 - BLOCK
      ?auto_49186 - BLOCK
      ?auto_49187 - BLOCK
    )
    :vars
    (
      ?auto_49188 - BLOCK
      ?auto_49189 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_49183 ) ( ON ?auto_49184 ?auto_49183 ) ( ON ?auto_49185 ?auto_49184 ) ( not ( = ?auto_49183 ?auto_49184 ) ) ( not ( = ?auto_49183 ?auto_49185 ) ) ( not ( = ?auto_49183 ?auto_49186 ) ) ( not ( = ?auto_49183 ?auto_49187 ) ) ( not ( = ?auto_49184 ?auto_49185 ) ) ( not ( = ?auto_49184 ?auto_49186 ) ) ( not ( = ?auto_49184 ?auto_49187 ) ) ( not ( = ?auto_49185 ?auto_49186 ) ) ( not ( = ?auto_49185 ?auto_49187 ) ) ( not ( = ?auto_49186 ?auto_49187 ) ) ( ON ?auto_49187 ?auto_49188 ) ( not ( = ?auto_49183 ?auto_49188 ) ) ( not ( = ?auto_49184 ?auto_49188 ) ) ( not ( = ?auto_49185 ?auto_49188 ) ) ( not ( = ?auto_49186 ?auto_49188 ) ) ( not ( = ?auto_49187 ?auto_49188 ) ) ( CLEAR ?auto_49185 ) ( ON ?auto_49186 ?auto_49187 ) ( CLEAR ?auto_49186 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_49189 ) ( ON ?auto_49188 ?auto_49189 ) ( not ( = ?auto_49189 ?auto_49188 ) ) ( not ( = ?auto_49189 ?auto_49187 ) ) ( not ( = ?auto_49189 ?auto_49186 ) ) ( not ( = ?auto_49183 ?auto_49189 ) ) ( not ( = ?auto_49184 ?auto_49189 ) ) ( not ( = ?auto_49185 ?auto_49189 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_49189 ?auto_49188 ?auto_49187 )
      ( MAKE-5PILE ?auto_49183 ?auto_49184 ?auto_49185 ?auto_49186 ?auto_49187 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_49190 - BLOCK
      ?auto_49191 - BLOCK
      ?auto_49192 - BLOCK
      ?auto_49193 - BLOCK
      ?auto_49194 - BLOCK
    )
    :vars
    (
      ?auto_49195 - BLOCK
      ?auto_49196 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_49190 ) ( ON ?auto_49191 ?auto_49190 ) ( not ( = ?auto_49190 ?auto_49191 ) ) ( not ( = ?auto_49190 ?auto_49192 ) ) ( not ( = ?auto_49190 ?auto_49193 ) ) ( not ( = ?auto_49190 ?auto_49194 ) ) ( not ( = ?auto_49191 ?auto_49192 ) ) ( not ( = ?auto_49191 ?auto_49193 ) ) ( not ( = ?auto_49191 ?auto_49194 ) ) ( not ( = ?auto_49192 ?auto_49193 ) ) ( not ( = ?auto_49192 ?auto_49194 ) ) ( not ( = ?auto_49193 ?auto_49194 ) ) ( ON ?auto_49194 ?auto_49195 ) ( not ( = ?auto_49190 ?auto_49195 ) ) ( not ( = ?auto_49191 ?auto_49195 ) ) ( not ( = ?auto_49192 ?auto_49195 ) ) ( not ( = ?auto_49193 ?auto_49195 ) ) ( not ( = ?auto_49194 ?auto_49195 ) ) ( ON ?auto_49193 ?auto_49194 ) ( CLEAR ?auto_49193 ) ( ON-TABLE ?auto_49196 ) ( ON ?auto_49195 ?auto_49196 ) ( not ( = ?auto_49196 ?auto_49195 ) ) ( not ( = ?auto_49196 ?auto_49194 ) ) ( not ( = ?auto_49196 ?auto_49193 ) ) ( not ( = ?auto_49190 ?auto_49196 ) ) ( not ( = ?auto_49191 ?auto_49196 ) ) ( not ( = ?auto_49192 ?auto_49196 ) ) ( HOLDING ?auto_49192 ) ( CLEAR ?auto_49191 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_49190 ?auto_49191 ?auto_49192 )
      ( MAKE-5PILE ?auto_49190 ?auto_49191 ?auto_49192 ?auto_49193 ?auto_49194 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_49197 - BLOCK
      ?auto_49198 - BLOCK
      ?auto_49199 - BLOCK
      ?auto_49200 - BLOCK
      ?auto_49201 - BLOCK
    )
    :vars
    (
      ?auto_49203 - BLOCK
      ?auto_49202 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_49197 ) ( ON ?auto_49198 ?auto_49197 ) ( not ( = ?auto_49197 ?auto_49198 ) ) ( not ( = ?auto_49197 ?auto_49199 ) ) ( not ( = ?auto_49197 ?auto_49200 ) ) ( not ( = ?auto_49197 ?auto_49201 ) ) ( not ( = ?auto_49198 ?auto_49199 ) ) ( not ( = ?auto_49198 ?auto_49200 ) ) ( not ( = ?auto_49198 ?auto_49201 ) ) ( not ( = ?auto_49199 ?auto_49200 ) ) ( not ( = ?auto_49199 ?auto_49201 ) ) ( not ( = ?auto_49200 ?auto_49201 ) ) ( ON ?auto_49201 ?auto_49203 ) ( not ( = ?auto_49197 ?auto_49203 ) ) ( not ( = ?auto_49198 ?auto_49203 ) ) ( not ( = ?auto_49199 ?auto_49203 ) ) ( not ( = ?auto_49200 ?auto_49203 ) ) ( not ( = ?auto_49201 ?auto_49203 ) ) ( ON ?auto_49200 ?auto_49201 ) ( ON-TABLE ?auto_49202 ) ( ON ?auto_49203 ?auto_49202 ) ( not ( = ?auto_49202 ?auto_49203 ) ) ( not ( = ?auto_49202 ?auto_49201 ) ) ( not ( = ?auto_49202 ?auto_49200 ) ) ( not ( = ?auto_49197 ?auto_49202 ) ) ( not ( = ?auto_49198 ?auto_49202 ) ) ( not ( = ?auto_49199 ?auto_49202 ) ) ( CLEAR ?auto_49198 ) ( ON ?auto_49199 ?auto_49200 ) ( CLEAR ?auto_49199 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_49202 ?auto_49203 ?auto_49201 ?auto_49200 )
      ( MAKE-5PILE ?auto_49197 ?auto_49198 ?auto_49199 ?auto_49200 ?auto_49201 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_49204 - BLOCK
      ?auto_49205 - BLOCK
      ?auto_49206 - BLOCK
      ?auto_49207 - BLOCK
      ?auto_49208 - BLOCK
    )
    :vars
    (
      ?auto_49210 - BLOCK
      ?auto_49209 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_49204 ) ( not ( = ?auto_49204 ?auto_49205 ) ) ( not ( = ?auto_49204 ?auto_49206 ) ) ( not ( = ?auto_49204 ?auto_49207 ) ) ( not ( = ?auto_49204 ?auto_49208 ) ) ( not ( = ?auto_49205 ?auto_49206 ) ) ( not ( = ?auto_49205 ?auto_49207 ) ) ( not ( = ?auto_49205 ?auto_49208 ) ) ( not ( = ?auto_49206 ?auto_49207 ) ) ( not ( = ?auto_49206 ?auto_49208 ) ) ( not ( = ?auto_49207 ?auto_49208 ) ) ( ON ?auto_49208 ?auto_49210 ) ( not ( = ?auto_49204 ?auto_49210 ) ) ( not ( = ?auto_49205 ?auto_49210 ) ) ( not ( = ?auto_49206 ?auto_49210 ) ) ( not ( = ?auto_49207 ?auto_49210 ) ) ( not ( = ?auto_49208 ?auto_49210 ) ) ( ON ?auto_49207 ?auto_49208 ) ( ON-TABLE ?auto_49209 ) ( ON ?auto_49210 ?auto_49209 ) ( not ( = ?auto_49209 ?auto_49210 ) ) ( not ( = ?auto_49209 ?auto_49208 ) ) ( not ( = ?auto_49209 ?auto_49207 ) ) ( not ( = ?auto_49204 ?auto_49209 ) ) ( not ( = ?auto_49205 ?auto_49209 ) ) ( not ( = ?auto_49206 ?auto_49209 ) ) ( ON ?auto_49206 ?auto_49207 ) ( CLEAR ?auto_49206 ) ( HOLDING ?auto_49205 ) ( CLEAR ?auto_49204 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_49204 ?auto_49205 )
      ( MAKE-5PILE ?auto_49204 ?auto_49205 ?auto_49206 ?auto_49207 ?auto_49208 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_49211 - BLOCK
      ?auto_49212 - BLOCK
      ?auto_49213 - BLOCK
      ?auto_49214 - BLOCK
      ?auto_49215 - BLOCK
    )
    :vars
    (
      ?auto_49216 - BLOCK
      ?auto_49217 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_49211 ) ( not ( = ?auto_49211 ?auto_49212 ) ) ( not ( = ?auto_49211 ?auto_49213 ) ) ( not ( = ?auto_49211 ?auto_49214 ) ) ( not ( = ?auto_49211 ?auto_49215 ) ) ( not ( = ?auto_49212 ?auto_49213 ) ) ( not ( = ?auto_49212 ?auto_49214 ) ) ( not ( = ?auto_49212 ?auto_49215 ) ) ( not ( = ?auto_49213 ?auto_49214 ) ) ( not ( = ?auto_49213 ?auto_49215 ) ) ( not ( = ?auto_49214 ?auto_49215 ) ) ( ON ?auto_49215 ?auto_49216 ) ( not ( = ?auto_49211 ?auto_49216 ) ) ( not ( = ?auto_49212 ?auto_49216 ) ) ( not ( = ?auto_49213 ?auto_49216 ) ) ( not ( = ?auto_49214 ?auto_49216 ) ) ( not ( = ?auto_49215 ?auto_49216 ) ) ( ON ?auto_49214 ?auto_49215 ) ( ON-TABLE ?auto_49217 ) ( ON ?auto_49216 ?auto_49217 ) ( not ( = ?auto_49217 ?auto_49216 ) ) ( not ( = ?auto_49217 ?auto_49215 ) ) ( not ( = ?auto_49217 ?auto_49214 ) ) ( not ( = ?auto_49211 ?auto_49217 ) ) ( not ( = ?auto_49212 ?auto_49217 ) ) ( not ( = ?auto_49213 ?auto_49217 ) ) ( ON ?auto_49213 ?auto_49214 ) ( CLEAR ?auto_49211 ) ( ON ?auto_49212 ?auto_49213 ) ( CLEAR ?auto_49212 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_49217 ?auto_49216 ?auto_49215 ?auto_49214 ?auto_49213 )
      ( MAKE-5PILE ?auto_49211 ?auto_49212 ?auto_49213 ?auto_49214 ?auto_49215 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_49218 - BLOCK
      ?auto_49219 - BLOCK
      ?auto_49220 - BLOCK
      ?auto_49221 - BLOCK
      ?auto_49222 - BLOCK
    )
    :vars
    (
      ?auto_49224 - BLOCK
      ?auto_49223 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49218 ?auto_49219 ) ) ( not ( = ?auto_49218 ?auto_49220 ) ) ( not ( = ?auto_49218 ?auto_49221 ) ) ( not ( = ?auto_49218 ?auto_49222 ) ) ( not ( = ?auto_49219 ?auto_49220 ) ) ( not ( = ?auto_49219 ?auto_49221 ) ) ( not ( = ?auto_49219 ?auto_49222 ) ) ( not ( = ?auto_49220 ?auto_49221 ) ) ( not ( = ?auto_49220 ?auto_49222 ) ) ( not ( = ?auto_49221 ?auto_49222 ) ) ( ON ?auto_49222 ?auto_49224 ) ( not ( = ?auto_49218 ?auto_49224 ) ) ( not ( = ?auto_49219 ?auto_49224 ) ) ( not ( = ?auto_49220 ?auto_49224 ) ) ( not ( = ?auto_49221 ?auto_49224 ) ) ( not ( = ?auto_49222 ?auto_49224 ) ) ( ON ?auto_49221 ?auto_49222 ) ( ON-TABLE ?auto_49223 ) ( ON ?auto_49224 ?auto_49223 ) ( not ( = ?auto_49223 ?auto_49224 ) ) ( not ( = ?auto_49223 ?auto_49222 ) ) ( not ( = ?auto_49223 ?auto_49221 ) ) ( not ( = ?auto_49218 ?auto_49223 ) ) ( not ( = ?auto_49219 ?auto_49223 ) ) ( not ( = ?auto_49220 ?auto_49223 ) ) ( ON ?auto_49220 ?auto_49221 ) ( ON ?auto_49219 ?auto_49220 ) ( CLEAR ?auto_49219 ) ( HOLDING ?auto_49218 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_49218 )
      ( MAKE-5PILE ?auto_49218 ?auto_49219 ?auto_49220 ?auto_49221 ?auto_49222 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_49225 - BLOCK
      ?auto_49226 - BLOCK
      ?auto_49227 - BLOCK
      ?auto_49228 - BLOCK
      ?auto_49229 - BLOCK
    )
    :vars
    (
      ?auto_49230 - BLOCK
      ?auto_49231 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49225 ?auto_49226 ) ) ( not ( = ?auto_49225 ?auto_49227 ) ) ( not ( = ?auto_49225 ?auto_49228 ) ) ( not ( = ?auto_49225 ?auto_49229 ) ) ( not ( = ?auto_49226 ?auto_49227 ) ) ( not ( = ?auto_49226 ?auto_49228 ) ) ( not ( = ?auto_49226 ?auto_49229 ) ) ( not ( = ?auto_49227 ?auto_49228 ) ) ( not ( = ?auto_49227 ?auto_49229 ) ) ( not ( = ?auto_49228 ?auto_49229 ) ) ( ON ?auto_49229 ?auto_49230 ) ( not ( = ?auto_49225 ?auto_49230 ) ) ( not ( = ?auto_49226 ?auto_49230 ) ) ( not ( = ?auto_49227 ?auto_49230 ) ) ( not ( = ?auto_49228 ?auto_49230 ) ) ( not ( = ?auto_49229 ?auto_49230 ) ) ( ON ?auto_49228 ?auto_49229 ) ( ON-TABLE ?auto_49231 ) ( ON ?auto_49230 ?auto_49231 ) ( not ( = ?auto_49231 ?auto_49230 ) ) ( not ( = ?auto_49231 ?auto_49229 ) ) ( not ( = ?auto_49231 ?auto_49228 ) ) ( not ( = ?auto_49225 ?auto_49231 ) ) ( not ( = ?auto_49226 ?auto_49231 ) ) ( not ( = ?auto_49227 ?auto_49231 ) ) ( ON ?auto_49227 ?auto_49228 ) ( ON ?auto_49226 ?auto_49227 ) ( ON ?auto_49225 ?auto_49226 ) ( CLEAR ?auto_49225 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_49231 ?auto_49230 ?auto_49229 ?auto_49228 ?auto_49227 ?auto_49226 )
      ( MAKE-5PILE ?auto_49225 ?auto_49226 ?auto_49227 ?auto_49228 ?auto_49229 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_49233 - BLOCK
    )
    :vars
    (
      ?auto_49234 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49234 ?auto_49233 ) ( CLEAR ?auto_49234 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_49233 ) ( not ( = ?auto_49233 ?auto_49234 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_49234 ?auto_49233 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_49235 - BLOCK
    )
    :vars
    (
      ?auto_49236 - BLOCK
      ?auto_49237 - BLOCK
      ?auto_49238 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49236 ?auto_49235 ) ( CLEAR ?auto_49236 ) ( ON-TABLE ?auto_49235 ) ( not ( = ?auto_49235 ?auto_49236 ) ) ( HOLDING ?auto_49237 ) ( CLEAR ?auto_49238 ) ( not ( = ?auto_49235 ?auto_49237 ) ) ( not ( = ?auto_49235 ?auto_49238 ) ) ( not ( = ?auto_49236 ?auto_49237 ) ) ( not ( = ?auto_49236 ?auto_49238 ) ) ( not ( = ?auto_49237 ?auto_49238 ) ) )
    :subtasks
    ( ( !STACK ?auto_49237 ?auto_49238 )
      ( MAKE-1PILE ?auto_49235 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_49239 - BLOCK
    )
    :vars
    (
      ?auto_49240 - BLOCK
      ?auto_49241 - BLOCK
      ?auto_49242 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49240 ?auto_49239 ) ( ON-TABLE ?auto_49239 ) ( not ( = ?auto_49239 ?auto_49240 ) ) ( CLEAR ?auto_49241 ) ( not ( = ?auto_49239 ?auto_49242 ) ) ( not ( = ?auto_49239 ?auto_49241 ) ) ( not ( = ?auto_49240 ?auto_49242 ) ) ( not ( = ?auto_49240 ?auto_49241 ) ) ( not ( = ?auto_49242 ?auto_49241 ) ) ( ON ?auto_49242 ?auto_49240 ) ( CLEAR ?auto_49242 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_49239 ?auto_49240 )
      ( MAKE-1PILE ?auto_49239 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_49243 - BLOCK
    )
    :vars
    (
      ?auto_49246 - BLOCK
      ?auto_49244 - BLOCK
      ?auto_49245 - BLOCK
      ?auto_49249 - BLOCK
      ?auto_49247 - BLOCK
      ?auto_49248 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49246 ?auto_49243 ) ( ON-TABLE ?auto_49243 ) ( not ( = ?auto_49243 ?auto_49246 ) ) ( not ( = ?auto_49243 ?auto_49244 ) ) ( not ( = ?auto_49243 ?auto_49245 ) ) ( not ( = ?auto_49246 ?auto_49244 ) ) ( not ( = ?auto_49246 ?auto_49245 ) ) ( not ( = ?auto_49244 ?auto_49245 ) ) ( ON ?auto_49244 ?auto_49246 ) ( CLEAR ?auto_49244 ) ( HOLDING ?auto_49245 ) ( CLEAR ?auto_49249 ) ( ON-TABLE ?auto_49247 ) ( ON ?auto_49248 ?auto_49247 ) ( ON ?auto_49249 ?auto_49248 ) ( not ( = ?auto_49247 ?auto_49248 ) ) ( not ( = ?auto_49247 ?auto_49249 ) ) ( not ( = ?auto_49247 ?auto_49245 ) ) ( not ( = ?auto_49248 ?auto_49249 ) ) ( not ( = ?auto_49248 ?auto_49245 ) ) ( not ( = ?auto_49249 ?auto_49245 ) ) ( not ( = ?auto_49243 ?auto_49249 ) ) ( not ( = ?auto_49243 ?auto_49247 ) ) ( not ( = ?auto_49243 ?auto_49248 ) ) ( not ( = ?auto_49246 ?auto_49249 ) ) ( not ( = ?auto_49246 ?auto_49247 ) ) ( not ( = ?auto_49246 ?auto_49248 ) ) ( not ( = ?auto_49244 ?auto_49249 ) ) ( not ( = ?auto_49244 ?auto_49247 ) ) ( not ( = ?auto_49244 ?auto_49248 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_49247 ?auto_49248 ?auto_49249 ?auto_49245 )
      ( MAKE-1PILE ?auto_49243 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_49250 - BLOCK
    )
    :vars
    (
      ?auto_49251 - BLOCK
      ?auto_49256 - BLOCK
      ?auto_49255 - BLOCK
      ?auto_49254 - BLOCK
      ?auto_49253 - BLOCK
      ?auto_49252 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49251 ?auto_49250 ) ( ON-TABLE ?auto_49250 ) ( not ( = ?auto_49250 ?auto_49251 ) ) ( not ( = ?auto_49250 ?auto_49256 ) ) ( not ( = ?auto_49250 ?auto_49255 ) ) ( not ( = ?auto_49251 ?auto_49256 ) ) ( not ( = ?auto_49251 ?auto_49255 ) ) ( not ( = ?auto_49256 ?auto_49255 ) ) ( ON ?auto_49256 ?auto_49251 ) ( CLEAR ?auto_49254 ) ( ON-TABLE ?auto_49253 ) ( ON ?auto_49252 ?auto_49253 ) ( ON ?auto_49254 ?auto_49252 ) ( not ( = ?auto_49253 ?auto_49252 ) ) ( not ( = ?auto_49253 ?auto_49254 ) ) ( not ( = ?auto_49253 ?auto_49255 ) ) ( not ( = ?auto_49252 ?auto_49254 ) ) ( not ( = ?auto_49252 ?auto_49255 ) ) ( not ( = ?auto_49254 ?auto_49255 ) ) ( not ( = ?auto_49250 ?auto_49254 ) ) ( not ( = ?auto_49250 ?auto_49253 ) ) ( not ( = ?auto_49250 ?auto_49252 ) ) ( not ( = ?auto_49251 ?auto_49254 ) ) ( not ( = ?auto_49251 ?auto_49253 ) ) ( not ( = ?auto_49251 ?auto_49252 ) ) ( not ( = ?auto_49256 ?auto_49254 ) ) ( not ( = ?auto_49256 ?auto_49253 ) ) ( not ( = ?auto_49256 ?auto_49252 ) ) ( ON ?auto_49255 ?auto_49256 ) ( CLEAR ?auto_49255 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_49250 ?auto_49251 ?auto_49256 )
      ( MAKE-1PILE ?auto_49250 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_49257 - BLOCK
    )
    :vars
    (
      ?auto_49260 - BLOCK
      ?auto_49259 - BLOCK
      ?auto_49262 - BLOCK
      ?auto_49258 - BLOCK
      ?auto_49263 - BLOCK
      ?auto_49261 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49260 ?auto_49257 ) ( ON-TABLE ?auto_49257 ) ( not ( = ?auto_49257 ?auto_49260 ) ) ( not ( = ?auto_49257 ?auto_49259 ) ) ( not ( = ?auto_49257 ?auto_49262 ) ) ( not ( = ?auto_49260 ?auto_49259 ) ) ( not ( = ?auto_49260 ?auto_49262 ) ) ( not ( = ?auto_49259 ?auto_49262 ) ) ( ON ?auto_49259 ?auto_49260 ) ( ON-TABLE ?auto_49258 ) ( ON ?auto_49263 ?auto_49258 ) ( not ( = ?auto_49258 ?auto_49263 ) ) ( not ( = ?auto_49258 ?auto_49261 ) ) ( not ( = ?auto_49258 ?auto_49262 ) ) ( not ( = ?auto_49263 ?auto_49261 ) ) ( not ( = ?auto_49263 ?auto_49262 ) ) ( not ( = ?auto_49261 ?auto_49262 ) ) ( not ( = ?auto_49257 ?auto_49261 ) ) ( not ( = ?auto_49257 ?auto_49258 ) ) ( not ( = ?auto_49257 ?auto_49263 ) ) ( not ( = ?auto_49260 ?auto_49261 ) ) ( not ( = ?auto_49260 ?auto_49258 ) ) ( not ( = ?auto_49260 ?auto_49263 ) ) ( not ( = ?auto_49259 ?auto_49261 ) ) ( not ( = ?auto_49259 ?auto_49258 ) ) ( not ( = ?auto_49259 ?auto_49263 ) ) ( ON ?auto_49262 ?auto_49259 ) ( CLEAR ?auto_49262 ) ( HOLDING ?auto_49261 ) ( CLEAR ?auto_49263 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_49258 ?auto_49263 ?auto_49261 )
      ( MAKE-1PILE ?auto_49257 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_49264 - BLOCK
    )
    :vars
    (
      ?auto_49266 - BLOCK
      ?auto_49269 - BLOCK
      ?auto_49268 - BLOCK
      ?auto_49270 - BLOCK
      ?auto_49267 - BLOCK
      ?auto_49265 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49266 ?auto_49264 ) ( ON-TABLE ?auto_49264 ) ( not ( = ?auto_49264 ?auto_49266 ) ) ( not ( = ?auto_49264 ?auto_49269 ) ) ( not ( = ?auto_49264 ?auto_49268 ) ) ( not ( = ?auto_49266 ?auto_49269 ) ) ( not ( = ?auto_49266 ?auto_49268 ) ) ( not ( = ?auto_49269 ?auto_49268 ) ) ( ON ?auto_49269 ?auto_49266 ) ( ON-TABLE ?auto_49270 ) ( ON ?auto_49267 ?auto_49270 ) ( not ( = ?auto_49270 ?auto_49267 ) ) ( not ( = ?auto_49270 ?auto_49265 ) ) ( not ( = ?auto_49270 ?auto_49268 ) ) ( not ( = ?auto_49267 ?auto_49265 ) ) ( not ( = ?auto_49267 ?auto_49268 ) ) ( not ( = ?auto_49265 ?auto_49268 ) ) ( not ( = ?auto_49264 ?auto_49265 ) ) ( not ( = ?auto_49264 ?auto_49270 ) ) ( not ( = ?auto_49264 ?auto_49267 ) ) ( not ( = ?auto_49266 ?auto_49265 ) ) ( not ( = ?auto_49266 ?auto_49270 ) ) ( not ( = ?auto_49266 ?auto_49267 ) ) ( not ( = ?auto_49269 ?auto_49265 ) ) ( not ( = ?auto_49269 ?auto_49270 ) ) ( not ( = ?auto_49269 ?auto_49267 ) ) ( ON ?auto_49268 ?auto_49269 ) ( CLEAR ?auto_49267 ) ( ON ?auto_49265 ?auto_49268 ) ( CLEAR ?auto_49265 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_49264 ?auto_49266 ?auto_49269 ?auto_49268 )
      ( MAKE-1PILE ?auto_49264 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_49271 - BLOCK
    )
    :vars
    (
      ?auto_49275 - BLOCK
      ?auto_49274 - BLOCK
      ?auto_49276 - BLOCK
      ?auto_49273 - BLOCK
      ?auto_49272 - BLOCK
      ?auto_49277 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49275 ?auto_49271 ) ( ON-TABLE ?auto_49271 ) ( not ( = ?auto_49271 ?auto_49275 ) ) ( not ( = ?auto_49271 ?auto_49274 ) ) ( not ( = ?auto_49271 ?auto_49276 ) ) ( not ( = ?auto_49275 ?auto_49274 ) ) ( not ( = ?auto_49275 ?auto_49276 ) ) ( not ( = ?auto_49274 ?auto_49276 ) ) ( ON ?auto_49274 ?auto_49275 ) ( ON-TABLE ?auto_49273 ) ( not ( = ?auto_49273 ?auto_49272 ) ) ( not ( = ?auto_49273 ?auto_49277 ) ) ( not ( = ?auto_49273 ?auto_49276 ) ) ( not ( = ?auto_49272 ?auto_49277 ) ) ( not ( = ?auto_49272 ?auto_49276 ) ) ( not ( = ?auto_49277 ?auto_49276 ) ) ( not ( = ?auto_49271 ?auto_49277 ) ) ( not ( = ?auto_49271 ?auto_49273 ) ) ( not ( = ?auto_49271 ?auto_49272 ) ) ( not ( = ?auto_49275 ?auto_49277 ) ) ( not ( = ?auto_49275 ?auto_49273 ) ) ( not ( = ?auto_49275 ?auto_49272 ) ) ( not ( = ?auto_49274 ?auto_49277 ) ) ( not ( = ?auto_49274 ?auto_49273 ) ) ( not ( = ?auto_49274 ?auto_49272 ) ) ( ON ?auto_49276 ?auto_49274 ) ( ON ?auto_49277 ?auto_49276 ) ( CLEAR ?auto_49277 ) ( HOLDING ?auto_49272 ) ( CLEAR ?auto_49273 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_49273 ?auto_49272 )
      ( MAKE-1PILE ?auto_49271 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_50124 - BLOCK
    )
    :vars
    (
      ?auto_50129 - BLOCK
      ?auto_50128 - BLOCK
      ?auto_50127 - BLOCK
      ?auto_50126 - BLOCK
      ?auto_50125 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50129 ?auto_50124 ) ( ON-TABLE ?auto_50124 ) ( not ( = ?auto_50124 ?auto_50129 ) ) ( not ( = ?auto_50124 ?auto_50128 ) ) ( not ( = ?auto_50124 ?auto_50127 ) ) ( not ( = ?auto_50129 ?auto_50128 ) ) ( not ( = ?auto_50129 ?auto_50127 ) ) ( not ( = ?auto_50128 ?auto_50127 ) ) ( ON ?auto_50128 ?auto_50129 ) ( not ( = ?auto_50126 ?auto_50125 ) ) ( not ( = ?auto_50126 ?auto_50127 ) ) ( not ( = ?auto_50125 ?auto_50127 ) ) ( not ( = ?auto_50124 ?auto_50125 ) ) ( not ( = ?auto_50124 ?auto_50126 ) ) ( not ( = ?auto_50129 ?auto_50125 ) ) ( not ( = ?auto_50129 ?auto_50126 ) ) ( not ( = ?auto_50128 ?auto_50125 ) ) ( not ( = ?auto_50128 ?auto_50126 ) ) ( ON ?auto_50127 ?auto_50128 ) ( ON ?auto_50125 ?auto_50127 ) ( ON ?auto_50126 ?auto_50125 ) ( CLEAR ?auto_50126 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_50124 ?auto_50129 ?auto_50128 ?auto_50127 ?auto_50125 )
      ( MAKE-1PILE ?auto_50124 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_49285 - BLOCK
    )
    :vars
    (
      ?auto_49290 - BLOCK
      ?auto_49287 - BLOCK
      ?auto_49288 - BLOCK
      ?auto_49286 - BLOCK
      ?auto_49289 - BLOCK
      ?auto_49291 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49290 ?auto_49285 ) ( ON-TABLE ?auto_49285 ) ( not ( = ?auto_49285 ?auto_49290 ) ) ( not ( = ?auto_49285 ?auto_49287 ) ) ( not ( = ?auto_49285 ?auto_49288 ) ) ( not ( = ?auto_49290 ?auto_49287 ) ) ( not ( = ?auto_49290 ?auto_49288 ) ) ( not ( = ?auto_49287 ?auto_49288 ) ) ( ON ?auto_49287 ?auto_49290 ) ( not ( = ?auto_49286 ?auto_49289 ) ) ( not ( = ?auto_49286 ?auto_49291 ) ) ( not ( = ?auto_49286 ?auto_49288 ) ) ( not ( = ?auto_49289 ?auto_49291 ) ) ( not ( = ?auto_49289 ?auto_49288 ) ) ( not ( = ?auto_49291 ?auto_49288 ) ) ( not ( = ?auto_49285 ?auto_49291 ) ) ( not ( = ?auto_49285 ?auto_49286 ) ) ( not ( = ?auto_49285 ?auto_49289 ) ) ( not ( = ?auto_49290 ?auto_49291 ) ) ( not ( = ?auto_49290 ?auto_49286 ) ) ( not ( = ?auto_49290 ?auto_49289 ) ) ( not ( = ?auto_49287 ?auto_49291 ) ) ( not ( = ?auto_49287 ?auto_49286 ) ) ( not ( = ?auto_49287 ?auto_49289 ) ) ( ON ?auto_49288 ?auto_49287 ) ( ON ?auto_49291 ?auto_49288 ) ( ON ?auto_49289 ?auto_49291 ) ( CLEAR ?auto_49289 ) ( HOLDING ?auto_49286 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_49286 )
      ( MAKE-1PILE ?auto_49285 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_49292 - BLOCK
    )
    :vars
    (
      ?auto_49294 - BLOCK
      ?auto_49293 - BLOCK
      ?auto_49295 - BLOCK
      ?auto_49297 - BLOCK
      ?auto_49296 - BLOCK
      ?auto_49298 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49294 ?auto_49292 ) ( ON-TABLE ?auto_49292 ) ( not ( = ?auto_49292 ?auto_49294 ) ) ( not ( = ?auto_49292 ?auto_49293 ) ) ( not ( = ?auto_49292 ?auto_49295 ) ) ( not ( = ?auto_49294 ?auto_49293 ) ) ( not ( = ?auto_49294 ?auto_49295 ) ) ( not ( = ?auto_49293 ?auto_49295 ) ) ( ON ?auto_49293 ?auto_49294 ) ( not ( = ?auto_49297 ?auto_49296 ) ) ( not ( = ?auto_49297 ?auto_49298 ) ) ( not ( = ?auto_49297 ?auto_49295 ) ) ( not ( = ?auto_49296 ?auto_49298 ) ) ( not ( = ?auto_49296 ?auto_49295 ) ) ( not ( = ?auto_49298 ?auto_49295 ) ) ( not ( = ?auto_49292 ?auto_49298 ) ) ( not ( = ?auto_49292 ?auto_49297 ) ) ( not ( = ?auto_49292 ?auto_49296 ) ) ( not ( = ?auto_49294 ?auto_49298 ) ) ( not ( = ?auto_49294 ?auto_49297 ) ) ( not ( = ?auto_49294 ?auto_49296 ) ) ( not ( = ?auto_49293 ?auto_49298 ) ) ( not ( = ?auto_49293 ?auto_49297 ) ) ( not ( = ?auto_49293 ?auto_49296 ) ) ( ON ?auto_49295 ?auto_49293 ) ( ON ?auto_49298 ?auto_49295 ) ( ON ?auto_49296 ?auto_49298 ) ( ON ?auto_49297 ?auto_49296 ) ( CLEAR ?auto_49297 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_49292 ?auto_49294 ?auto_49293 ?auto_49295 ?auto_49298 ?auto_49296 )
      ( MAKE-1PILE ?auto_49292 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_49305 - BLOCK
      ?auto_49306 - BLOCK
      ?auto_49307 - BLOCK
      ?auto_49308 - BLOCK
      ?auto_49309 - BLOCK
      ?auto_49310 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_49310 ) ( CLEAR ?auto_49309 ) ( ON-TABLE ?auto_49305 ) ( ON ?auto_49306 ?auto_49305 ) ( ON ?auto_49307 ?auto_49306 ) ( ON ?auto_49308 ?auto_49307 ) ( ON ?auto_49309 ?auto_49308 ) ( not ( = ?auto_49305 ?auto_49306 ) ) ( not ( = ?auto_49305 ?auto_49307 ) ) ( not ( = ?auto_49305 ?auto_49308 ) ) ( not ( = ?auto_49305 ?auto_49309 ) ) ( not ( = ?auto_49305 ?auto_49310 ) ) ( not ( = ?auto_49306 ?auto_49307 ) ) ( not ( = ?auto_49306 ?auto_49308 ) ) ( not ( = ?auto_49306 ?auto_49309 ) ) ( not ( = ?auto_49306 ?auto_49310 ) ) ( not ( = ?auto_49307 ?auto_49308 ) ) ( not ( = ?auto_49307 ?auto_49309 ) ) ( not ( = ?auto_49307 ?auto_49310 ) ) ( not ( = ?auto_49308 ?auto_49309 ) ) ( not ( = ?auto_49308 ?auto_49310 ) ) ( not ( = ?auto_49309 ?auto_49310 ) ) )
    :subtasks
    ( ( !STACK ?auto_49310 ?auto_49309 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_49311 - BLOCK
      ?auto_49312 - BLOCK
      ?auto_49313 - BLOCK
      ?auto_49314 - BLOCK
      ?auto_49315 - BLOCK
      ?auto_49316 - BLOCK
    )
    :vars
    (
      ?auto_49317 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_49315 ) ( ON-TABLE ?auto_49311 ) ( ON ?auto_49312 ?auto_49311 ) ( ON ?auto_49313 ?auto_49312 ) ( ON ?auto_49314 ?auto_49313 ) ( ON ?auto_49315 ?auto_49314 ) ( not ( = ?auto_49311 ?auto_49312 ) ) ( not ( = ?auto_49311 ?auto_49313 ) ) ( not ( = ?auto_49311 ?auto_49314 ) ) ( not ( = ?auto_49311 ?auto_49315 ) ) ( not ( = ?auto_49311 ?auto_49316 ) ) ( not ( = ?auto_49312 ?auto_49313 ) ) ( not ( = ?auto_49312 ?auto_49314 ) ) ( not ( = ?auto_49312 ?auto_49315 ) ) ( not ( = ?auto_49312 ?auto_49316 ) ) ( not ( = ?auto_49313 ?auto_49314 ) ) ( not ( = ?auto_49313 ?auto_49315 ) ) ( not ( = ?auto_49313 ?auto_49316 ) ) ( not ( = ?auto_49314 ?auto_49315 ) ) ( not ( = ?auto_49314 ?auto_49316 ) ) ( not ( = ?auto_49315 ?auto_49316 ) ) ( ON ?auto_49316 ?auto_49317 ) ( CLEAR ?auto_49316 ) ( HAND-EMPTY ) ( not ( = ?auto_49311 ?auto_49317 ) ) ( not ( = ?auto_49312 ?auto_49317 ) ) ( not ( = ?auto_49313 ?auto_49317 ) ) ( not ( = ?auto_49314 ?auto_49317 ) ) ( not ( = ?auto_49315 ?auto_49317 ) ) ( not ( = ?auto_49316 ?auto_49317 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_49316 ?auto_49317 )
      ( MAKE-6PILE ?auto_49311 ?auto_49312 ?auto_49313 ?auto_49314 ?auto_49315 ?auto_49316 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_49318 - BLOCK
      ?auto_49319 - BLOCK
      ?auto_49320 - BLOCK
      ?auto_49321 - BLOCK
      ?auto_49322 - BLOCK
      ?auto_49323 - BLOCK
    )
    :vars
    (
      ?auto_49324 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_49318 ) ( ON ?auto_49319 ?auto_49318 ) ( ON ?auto_49320 ?auto_49319 ) ( ON ?auto_49321 ?auto_49320 ) ( not ( = ?auto_49318 ?auto_49319 ) ) ( not ( = ?auto_49318 ?auto_49320 ) ) ( not ( = ?auto_49318 ?auto_49321 ) ) ( not ( = ?auto_49318 ?auto_49322 ) ) ( not ( = ?auto_49318 ?auto_49323 ) ) ( not ( = ?auto_49319 ?auto_49320 ) ) ( not ( = ?auto_49319 ?auto_49321 ) ) ( not ( = ?auto_49319 ?auto_49322 ) ) ( not ( = ?auto_49319 ?auto_49323 ) ) ( not ( = ?auto_49320 ?auto_49321 ) ) ( not ( = ?auto_49320 ?auto_49322 ) ) ( not ( = ?auto_49320 ?auto_49323 ) ) ( not ( = ?auto_49321 ?auto_49322 ) ) ( not ( = ?auto_49321 ?auto_49323 ) ) ( not ( = ?auto_49322 ?auto_49323 ) ) ( ON ?auto_49323 ?auto_49324 ) ( CLEAR ?auto_49323 ) ( not ( = ?auto_49318 ?auto_49324 ) ) ( not ( = ?auto_49319 ?auto_49324 ) ) ( not ( = ?auto_49320 ?auto_49324 ) ) ( not ( = ?auto_49321 ?auto_49324 ) ) ( not ( = ?auto_49322 ?auto_49324 ) ) ( not ( = ?auto_49323 ?auto_49324 ) ) ( HOLDING ?auto_49322 ) ( CLEAR ?auto_49321 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_49318 ?auto_49319 ?auto_49320 ?auto_49321 ?auto_49322 )
      ( MAKE-6PILE ?auto_49318 ?auto_49319 ?auto_49320 ?auto_49321 ?auto_49322 ?auto_49323 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_49325 - BLOCK
      ?auto_49326 - BLOCK
      ?auto_49327 - BLOCK
      ?auto_49328 - BLOCK
      ?auto_49329 - BLOCK
      ?auto_49330 - BLOCK
    )
    :vars
    (
      ?auto_49331 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_49325 ) ( ON ?auto_49326 ?auto_49325 ) ( ON ?auto_49327 ?auto_49326 ) ( ON ?auto_49328 ?auto_49327 ) ( not ( = ?auto_49325 ?auto_49326 ) ) ( not ( = ?auto_49325 ?auto_49327 ) ) ( not ( = ?auto_49325 ?auto_49328 ) ) ( not ( = ?auto_49325 ?auto_49329 ) ) ( not ( = ?auto_49325 ?auto_49330 ) ) ( not ( = ?auto_49326 ?auto_49327 ) ) ( not ( = ?auto_49326 ?auto_49328 ) ) ( not ( = ?auto_49326 ?auto_49329 ) ) ( not ( = ?auto_49326 ?auto_49330 ) ) ( not ( = ?auto_49327 ?auto_49328 ) ) ( not ( = ?auto_49327 ?auto_49329 ) ) ( not ( = ?auto_49327 ?auto_49330 ) ) ( not ( = ?auto_49328 ?auto_49329 ) ) ( not ( = ?auto_49328 ?auto_49330 ) ) ( not ( = ?auto_49329 ?auto_49330 ) ) ( ON ?auto_49330 ?auto_49331 ) ( not ( = ?auto_49325 ?auto_49331 ) ) ( not ( = ?auto_49326 ?auto_49331 ) ) ( not ( = ?auto_49327 ?auto_49331 ) ) ( not ( = ?auto_49328 ?auto_49331 ) ) ( not ( = ?auto_49329 ?auto_49331 ) ) ( not ( = ?auto_49330 ?auto_49331 ) ) ( CLEAR ?auto_49328 ) ( ON ?auto_49329 ?auto_49330 ) ( CLEAR ?auto_49329 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_49331 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_49331 ?auto_49330 )
      ( MAKE-6PILE ?auto_49325 ?auto_49326 ?auto_49327 ?auto_49328 ?auto_49329 ?auto_49330 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_49332 - BLOCK
      ?auto_49333 - BLOCK
      ?auto_49334 - BLOCK
      ?auto_49335 - BLOCK
      ?auto_49336 - BLOCK
      ?auto_49337 - BLOCK
    )
    :vars
    (
      ?auto_49338 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_49332 ) ( ON ?auto_49333 ?auto_49332 ) ( ON ?auto_49334 ?auto_49333 ) ( not ( = ?auto_49332 ?auto_49333 ) ) ( not ( = ?auto_49332 ?auto_49334 ) ) ( not ( = ?auto_49332 ?auto_49335 ) ) ( not ( = ?auto_49332 ?auto_49336 ) ) ( not ( = ?auto_49332 ?auto_49337 ) ) ( not ( = ?auto_49333 ?auto_49334 ) ) ( not ( = ?auto_49333 ?auto_49335 ) ) ( not ( = ?auto_49333 ?auto_49336 ) ) ( not ( = ?auto_49333 ?auto_49337 ) ) ( not ( = ?auto_49334 ?auto_49335 ) ) ( not ( = ?auto_49334 ?auto_49336 ) ) ( not ( = ?auto_49334 ?auto_49337 ) ) ( not ( = ?auto_49335 ?auto_49336 ) ) ( not ( = ?auto_49335 ?auto_49337 ) ) ( not ( = ?auto_49336 ?auto_49337 ) ) ( ON ?auto_49337 ?auto_49338 ) ( not ( = ?auto_49332 ?auto_49338 ) ) ( not ( = ?auto_49333 ?auto_49338 ) ) ( not ( = ?auto_49334 ?auto_49338 ) ) ( not ( = ?auto_49335 ?auto_49338 ) ) ( not ( = ?auto_49336 ?auto_49338 ) ) ( not ( = ?auto_49337 ?auto_49338 ) ) ( ON ?auto_49336 ?auto_49337 ) ( CLEAR ?auto_49336 ) ( ON-TABLE ?auto_49338 ) ( HOLDING ?auto_49335 ) ( CLEAR ?auto_49334 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_49332 ?auto_49333 ?auto_49334 ?auto_49335 )
      ( MAKE-6PILE ?auto_49332 ?auto_49333 ?auto_49334 ?auto_49335 ?auto_49336 ?auto_49337 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_49339 - BLOCK
      ?auto_49340 - BLOCK
      ?auto_49341 - BLOCK
      ?auto_49342 - BLOCK
      ?auto_49343 - BLOCK
      ?auto_49344 - BLOCK
    )
    :vars
    (
      ?auto_49345 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_49339 ) ( ON ?auto_49340 ?auto_49339 ) ( ON ?auto_49341 ?auto_49340 ) ( not ( = ?auto_49339 ?auto_49340 ) ) ( not ( = ?auto_49339 ?auto_49341 ) ) ( not ( = ?auto_49339 ?auto_49342 ) ) ( not ( = ?auto_49339 ?auto_49343 ) ) ( not ( = ?auto_49339 ?auto_49344 ) ) ( not ( = ?auto_49340 ?auto_49341 ) ) ( not ( = ?auto_49340 ?auto_49342 ) ) ( not ( = ?auto_49340 ?auto_49343 ) ) ( not ( = ?auto_49340 ?auto_49344 ) ) ( not ( = ?auto_49341 ?auto_49342 ) ) ( not ( = ?auto_49341 ?auto_49343 ) ) ( not ( = ?auto_49341 ?auto_49344 ) ) ( not ( = ?auto_49342 ?auto_49343 ) ) ( not ( = ?auto_49342 ?auto_49344 ) ) ( not ( = ?auto_49343 ?auto_49344 ) ) ( ON ?auto_49344 ?auto_49345 ) ( not ( = ?auto_49339 ?auto_49345 ) ) ( not ( = ?auto_49340 ?auto_49345 ) ) ( not ( = ?auto_49341 ?auto_49345 ) ) ( not ( = ?auto_49342 ?auto_49345 ) ) ( not ( = ?auto_49343 ?auto_49345 ) ) ( not ( = ?auto_49344 ?auto_49345 ) ) ( ON ?auto_49343 ?auto_49344 ) ( ON-TABLE ?auto_49345 ) ( CLEAR ?auto_49341 ) ( ON ?auto_49342 ?auto_49343 ) ( CLEAR ?auto_49342 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_49345 ?auto_49344 ?auto_49343 )
      ( MAKE-6PILE ?auto_49339 ?auto_49340 ?auto_49341 ?auto_49342 ?auto_49343 ?auto_49344 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_49346 - BLOCK
      ?auto_49347 - BLOCK
      ?auto_49348 - BLOCK
      ?auto_49349 - BLOCK
      ?auto_49350 - BLOCK
      ?auto_49351 - BLOCK
    )
    :vars
    (
      ?auto_49352 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_49346 ) ( ON ?auto_49347 ?auto_49346 ) ( not ( = ?auto_49346 ?auto_49347 ) ) ( not ( = ?auto_49346 ?auto_49348 ) ) ( not ( = ?auto_49346 ?auto_49349 ) ) ( not ( = ?auto_49346 ?auto_49350 ) ) ( not ( = ?auto_49346 ?auto_49351 ) ) ( not ( = ?auto_49347 ?auto_49348 ) ) ( not ( = ?auto_49347 ?auto_49349 ) ) ( not ( = ?auto_49347 ?auto_49350 ) ) ( not ( = ?auto_49347 ?auto_49351 ) ) ( not ( = ?auto_49348 ?auto_49349 ) ) ( not ( = ?auto_49348 ?auto_49350 ) ) ( not ( = ?auto_49348 ?auto_49351 ) ) ( not ( = ?auto_49349 ?auto_49350 ) ) ( not ( = ?auto_49349 ?auto_49351 ) ) ( not ( = ?auto_49350 ?auto_49351 ) ) ( ON ?auto_49351 ?auto_49352 ) ( not ( = ?auto_49346 ?auto_49352 ) ) ( not ( = ?auto_49347 ?auto_49352 ) ) ( not ( = ?auto_49348 ?auto_49352 ) ) ( not ( = ?auto_49349 ?auto_49352 ) ) ( not ( = ?auto_49350 ?auto_49352 ) ) ( not ( = ?auto_49351 ?auto_49352 ) ) ( ON ?auto_49350 ?auto_49351 ) ( ON-TABLE ?auto_49352 ) ( ON ?auto_49349 ?auto_49350 ) ( CLEAR ?auto_49349 ) ( HOLDING ?auto_49348 ) ( CLEAR ?auto_49347 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_49346 ?auto_49347 ?auto_49348 )
      ( MAKE-6PILE ?auto_49346 ?auto_49347 ?auto_49348 ?auto_49349 ?auto_49350 ?auto_49351 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_49353 - BLOCK
      ?auto_49354 - BLOCK
      ?auto_49355 - BLOCK
      ?auto_49356 - BLOCK
      ?auto_49357 - BLOCK
      ?auto_49358 - BLOCK
    )
    :vars
    (
      ?auto_49359 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_49353 ) ( ON ?auto_49354 ?auto_49353 ) ( not ( = ?auto_49353 ?auto_49354 ) ) ( not ( = ?auto_49353 ?auto_49355 ) ) ( not ( = ?auto_49353 ?auto_49356 ) ) ( not ( = ?auto_49353 ?auto_49357 ) ) ( not ( = ?auto_49353 ?auto_49358 ) ) ( not ( = ?auto_49354 ?auto_49355 ) ) ( not ( = ?auto_49354 ?auto_49356 ) ) ( not ( = ?auto_49354 ?auto_49357 ) ) ( not ( = ?auto_49354 ?auto_49358 ) ) ( not ( = ?auto_49355 ?auto_49356 ) ) ( not ( = ?auto_49355 ?auto_49357 ) ) ( not ( = ?auto_49355 ?auto_49358 ) ) ( not ( = ?auto_49356 ?auto_49357 ) ) ( not ( = ?auto_49356 ?auto_49358 ) ) ( not ( = ?auto_49357 ?auto_49358 ) ) ( ON ?auto_49358 ?auto_49359 ) ( not ( = ?auto_49353 ?auto_49359 ) ) ( not ( = ?auto_49354 ?auto_49359 ) ) ( not ( = ?auto_49355 ?auto_49359 ) ) ( not ( = ?auto_49356 ?auto_49359 ) ) ( not ( = ?auto_49357 ?auto_49359 ) ) ( not ( = ?auto_49358 ?auto_49359 ) ) ( ON ?auto_49357 ?auto_49358 ) ( ON-TABLE ?auto_49359 ) ( ON ?auto_49356 ?auto_49357 ) ( CLEAR ?auto_49354 ) ( ON ?auto_49355 ?auto_49356 ) ( CLEAR ?auto_49355 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_49359 ?auto_49358 ?auto_49357 ?auto_49356 )
      ( MAKE-6PILE ?auto_49353 ?auto_49354 ?auto_49355 ?auto_49356 ?auto_49357 ?auto_49358 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_49360 - BLOCK
      ?auto_49361 - BLOCK
      ?auto_49362 - BLOCK
      ?auto_49363 - BLOCK
      ?auto_49364 - BLOCK
      ?auto_49365 - BLOCK
    )
    :vars
    (
      ?auto_49366 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_49360 ) ( not ( = ?auto_49360 ?auto_49361 ) ) ( not ( = ?auto_49360 ?auto_49362 ) ) ( not ( = ?auto_49360 ?auto_49363 ) ) ( not ( = ?auto_49360 ?auto_49364 ) ) ( not ( = ?auto_49360 ?auto_49365 ) ) ( not ( = ?auto_49361 ?auto_49362 ) ) ( not ( = ?auto_49361 ?auto_49363 ) ) ( not ( = ?auto_49361 ?auto_49364 ) ) ( not ( = ?auto_49361 ?auto_49365 ) ) ( not ( = ?auto_49362 ?auto_49363 ) ) ( not ( = ?auto_49362 ?auto_49364 ) ) ( not ( = ?auto_49362 ?auto_49365 ) ) ( not ( = ?auto_49363 ?auto_49364 ) ) ( not ( = ?auto_49363 ?auto_49365 ) ) ( not ( = ?auto_49364 ?auto_49365 ) ) ( ON ?auto_49365 ?auto_49366 ) ( not ( = ?auto_49360 ?auto_49366 ) ) ( not ( = ?auto_49361 ?auto_49366 ) ) ( not ( = ?auto_49362 ?auto_49366 ) ) ( not ( = ?auto_49363 ?auto_49366 ) ) ( not ( = ?auto_49364 ?auto_49366 ) ) ( not ( = ?auto_49365 ?auto_49366 ) ) ( ON ?auto_49364 ?auto_49365 ) ( ON-TABLE ?auto_49366 ) ( ON ?auto_49363 ?auto_49364 ) ( ON ?auto_49362 ?auto_49363 ) ( CLEAR ?auto_49362 ) ( HOLDING ?auto_49361 ) ( CLEAR ?auto_49360 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_49360 ?auto_49361 )
      ( MAKE-6PILE ?auto_49360 ?auto_49361 ?auto_49362 ?auto_49363 ?auto_49364 ?auto_49365 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_49367 - BLOCK
      ?auto_49368 - BLOCK
      ?auto_49369 - BLOCK
      ?auto_49370 - BLOCK
      ?auto_49371 - BLOCK
      ?auto_49372 - BLOCK
    )
    :vars
    (
      ?auto_49373 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_49367 ) ( not ( = ?auto_49367 ?auto_49368 ) ) ( not ( = ?auto_49367 ?auto_49369 ) ) ( not ( = ?auto_49367 ?auto_49370 ) ) ( not ( = ?auto_49367 ?auto_49371 ) ) ( not ( = ?auto_49367 ?auto_49372 ) ) ( not ( = ?auto_49368 ?auto_49369 ) ) ( not ( = ?auto_49368 ?auto_49370 ) ) ( not ( = ?auto_49368 ?auto_49371 ) ) ( not ( = ?auto_49368 ?auto_49372 ) ) ( not ( = ?auto_49369 ?auto_49370 ) ) ( not ( = ?auto_49369 ?auto_49371 ) ) ( not ( = ?auto_49369 ?auto_49372 ) ) ( not ( = ?auto_49370 ?auto_49371 ) ) ( not ( = ?auto_49370 ?auto_49372 ) ) ( not ( = ?auto_49371 ?auto_49372 ) ) ( ON ?auto_49372 ?auto_49373 ) ( not ( = ?auto_49367 ?auto_49373 ) ) ( not ( = ?auto_49368 ?auto_49373 ) ) ( not ( = ?auto_49369 ?auto_49373 ) ) ( not ( = ?auto_49370 ?auto_49373 ) ) ( not ( = ?auto_49371 ?auto_49373 ) ) ( not ( = ?auto_49372 ?auto_49373 ) ) ( ON ?auto_49371 ?auto_49372 ) ( ON-TABLE ?auto_49373 ) ( ON ?auto_49370 ?auto_49371 ) ( ON ?auto_49369 ?auto_49370 ) ( CLEAR ?auto_49367 ) ( ON ?auto_49368 ?auto_49369 ) ( CLEAR ?auto_49368 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_49373 ?auto_49372 ?auto_49371 ?auto_49370 ?auto_49369 )
      ( MAKE-6PILE ?auto_49367 ?auto_49368 ?auto_49369 ?auto_49370 ?auto_49371 ?auto_49372 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_49374 - BLOCK
      ?auto_49375 - BLOCK
      ?auto_49376 - BLOCK
      ?auto_49377 - BLOCK
      ?auto_49378 - BLOCK
      ?auto_49379 - BLOCK
    )
    :vars
    (
      ?auto_49380 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49374 ?auto_49375 ) ) ( not ( = ?auto_49374 ?auto_49376 ) ) ( not ( = ?auto_49374 ?auto_49377 ) ) ( not ( = ?auto_49374 ?auto_49378 ) ) ( not ( = ?auto_49374 ?auto_49379 ) ) ( not ( = ?auto_49375 ?auto_49376 ) ) ( not ( = ?auto_49375 ?auto_49377 ) ) ( not ( = ?auto_49375 ?auto_49378 ) ) ( not ( = ?auto_49375 ?auto_49379 ) ) ( not ( = ?auto_49376 ?auto_49377 ) ) ( not ( = ?auto_49376 ?auto_49378 ) ) ( not ( = ?auto_49376 ?auto_49379 ) ) ( not ( = ?auto_49377 ?auto_49378 ) ) ( not ( = ?auto_49377 ?auto_49379 ) ) ( not ( = ?auto_49378 ?auto_49379 ) ) ( ON ?auto_49379 ?auto_49380 ) ( not ( = ?auto_49374 ?auto_49380 ) ) ( not ( = ?auto_49375 ?auto_49380 ) ) ( not ( = ?auto_49376 ?auto_49380 ) ) ( not ( = ?auto_49377 ?auto_49380 ) ) ( not ( = ?auto_49378 ?auto_49380 ) ) ( not ( = ?auto_49379 ?auto_49380 ) ) ( ON ?auto_49378 ?auto_49379 ) ( ON-TABLE ?auto_49380 ) ( ON ?auto_49377 ?auto_49378 ) ( ON ?auto_49376 ?auto_49377 ) ( ON ?auto_49375 ?auto_49376 ) ( CLEAR ?auto_49375 ) ( HOLDING ?auto_49374 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_49374 )
      ( MAKE-6PILE ?auto_49374 ?auto_49375 ?auto_49376 ?auto_49377 ?auto_49378 ?auto_49379 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_49381 - BLOCK
      ?auto_49382 - BLOCK
      ?auto_49383 - BLOCK
      ?auto_49384 - BLOCK
      ?auto_49385 - BLOCK
      ?auto_49386 - BLOCK
    )
    :vars
    (
      ?auto_49387 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49381 ?auto_49382 ) ) ( not ( = ?auto_49381 ?auto_49383 ) ) ( not ( = ?auto_49381 ?auto_49384 ) ) ( not ( = ?auto_49381 ?auto_49385 ) ) ( not ( = ?auto_49381 ?auto_49386 ) ) ( not ( = ?auto_49382 ?auto_49383 ) ) ( not ( = ?auto_49382 ?auto_49384 ) ) ( not ( = ?auto_49382 ?auto_49385 ) ) ( not ( = ?auto_49382 ?auto_49386 ) ) ( not ( = ?auto_49383 ?auto_49384 ) ) ( not ( = ?auto_49383 ?auto_49385 ) ) ( not ( = ?auto_49383 ?auto_49386 ) ) ( not ( = ?auto_49384 ?auto_49385 ) ) ( not ( = ?auto_49384 ?auto_49386 ) ) ( not ( = ?auto_49385 ?auto_49386 ) ) ( ON ?auto_49386 ?auto_49387 ) ( not ( = ?auto_49381 ?auto_49387 ) ) ( not ( = ?auto_49382 ?auto_49387 ) ) ( not ( = ?auto_49383 ?auto_49387 ) ) ( not ( = ?auto_49384 ?auto_49387 ) ) ( not ( = ?auto_49385 ?auto_49387 ) ) ( not ( = ?auto_49386 ?auto_49387 ) ) ( ON ?auto_49385 ?auto_49386 ) ( ON-TABLE ?auto_49387 ) ( ON ?auto_49384 ?auto_49385 ) ( ON ?auto_49383 ?auto_49384 ) ( ON ?auto_49382 ?auto_49383 ) ( ON ?auto_49381 ?auto_49382 ) ( CLEAR ?auto_49381 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_49387 ?auto_49386 ?auto_49385 ?auto_49384 ?auto_49383 ?auto_49382 )
      ( MAKE-6PILE ?auto_49381 ?auto_49382 ?auto_49383 ?auto_49384 ?auto_49385 ?auto_49386 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_49468 - BLOCK
    )
    :vars
    (
      ?auto_49469 - BLOCK
      ?auto_49470 - BLOCK
      ?auto_49471 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49468 ?auto_49469 ) ( CLEAR ?auto_49468 ) ( not ( = ?auto_49468 ?auto_49469 ) ) ( HOLDING ?auto_49470 ) ( CLEAR ?auto_49471 ) ( not ( = ?auto_49468 ?auto_49470 ) ) ( not ( = ?auto_49468 ?auto_49471 ) ) ( not ( = ?auto_49469 ?auto_49470 ) ) ( not ( = ?auto_49469 ?auto_49471 ) ) ( not ( = ?auto_49470 ?auto_49471 ) ) )
    :subtasks
    ( ( !STACK ?auto_49470 ?auto_49471 )
      ( MAKE-1PILE ?auto_49468 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_49472 - BLOCK
    )
    :vars
    (
      ?auto_49474 - BLOCK
      ?auto_49473 - BLOCK
      ?auto_49475 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49472 ?auto_49474 ) ( not ( = ?auto_49472 ?auto_49474 ) ) ( CLEAR ?auto_49473 ) ( not ( = ?auto_49472 ?auto_49475 ) ) ( not ( = ?auto_49472 ?auto_49473 ) ) ( not ( = ?auto_49474 ?auto_49475 ) ) ( not ( = ?auto_49474 ?auto_49473 ) ) ( not ( = ?auto_49475 ?auto_49473 ) ) ( ON ?auto_49475 ?auto_49472 ) ( CLEAR ?auto_49475 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_49474 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_49474 ?auto_49472 )
      ( MAKE-1PILE ?auto_49472 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_49476 - BLOCK
    )
    :vars
    (
      ?auto_49478 - BLOCK
      ?auto_49477 - BLOCK
      ?auto_49479 - BLOCK
      ?auto_49482 - BLOCK
      ?auto_49480 - BLOCK
      ?auto_49481 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49476 ?auto_49478 ) ( not ( = ?auto_49476 ?auto_49478 ) ) ( not ( = ?auto_49476 ?auto_49477 ) ) ( not ( = ?auto_49476 ?auto_49479 ) ) ( not ( = ?auto_49478 ?auto_49477 ) ) ( not ( = ?auto_49478 ?auto_49479 ) ) ( not ( = ?auto_49477 ?auto_49479 ) ) ( ON ?auto_49477 ?auto_49476 ) ( CLEAR ?auto_49477 ) ( ON-TABLE ?auto_49478 ) ( HOLDING ?auto_49479 ) ( CLEAR ?auto_49482 ) ( ON-TABLE ?auto_49480 ) ( ON ?auto_49481 ?auto_49480 ) ( ON ?auto_49482 ?auto_49481 ) ( not ( = ?auto_49480 ?auto_49481 ) ) ( not ( = ?auto_49480 ?auto_49482 ) ) ( not ( = ?auto_49480 ?auto_49479 ) ) ( not ( = ?auto_49481 ?auto_49482 ) ) ( not ( = ?auto_49481 ?auto_49479 ) ) ( not ( = ?auto_49482 ?auto_49479 ) ) ( not ( = ?auto_49476 ?auto_49482 ) ) ( not ( = ?auto_49476 ?auto_49480 ) ) ( not ( = ?auto_49476 ?auto_49481 ) ) ( not ( = ?auto_49478 ?auto_49482 ) ) ( not ( = ?auto_49478 ?auto_49480 ) ) ( not ( = ?auto_49478 ?auto_49481 ) ) ( not ( = ?auto_49477 ?auto_49482 ) ) ( not ( = ?auto_49477 ?auto_49480 ) ) ( not ( = ?auto_49477 ?auto_49481 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_49480 ?auto_49481 ?auto_49482 ?auto_49479 )
      ( MAKE-1PILE ?auto_49476 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_49483 - BLOCK
    )
    :vars
    (
      ?auto_49485 - BLOCK
      ?auto_49488 - BLOCK
      ?auto_49486 - BLOCK
      ?auto_49487 - BLOCK
      ?auto_49484 - BLOCK
      ?auto_49489 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49483 ?auto_49485 ) ( not ( = ?auto_49483 ?auto_49485 ) ) ( not ( = ?auto_49483 ?auto_49488 ) ) ( not ( = ?auto_49483 ?auto_49486 ) ) ( not ( = ?auto_49485 ?auto_49488 ) ) ( not ( = ?auto_49485 ?auto_49486 ) ) ( not ( = ?auto_49488 ?auto_49486 ) ) ( ON ?auto_49488 ?auto_49483 ) ( ON-TABLE ?auto_49485 ) ( CLEAR ?auto_49487 ) ( ON-TABLE ?auto_49484 ) ( ON ?auto_49489 ?auto_49484 ) ( ON ?auto_49487 ?auto_49489 ) ( not ( = ?auto_49484 ?auto_49489 ) ) ( not ( = ?auto_49484 ?auto_49487 ) ) ( not ( = ?auto_49484 ?auto_49486 ) ) ( not ( = ?auto_49489 ?auto_49487 ) ) ( not ( = ?auto_49489 ?auto_49486 ) ) ( not ( = ?auto_49487 ?auto_49486 ) ) ( not ( = ?auto_49483 ?auto_49487 ) ) ( not ( = ?auto_49483 ?auto_49484 ) ) ( not ( = ?auto_49483 ?auto_49489 ) ) ( not ( = ?auto_49485 ?auto_49487 ) ) ( not ( = ?auto_49485 ?auto_49484 ) ) ( not ( = ?auto_49485 ?auto_49489 ) ) ( not ( = ?auto_49488 ?auto_49487 ) ) ( not ( = ?auto_49488 ?auto_49484 ) ) ( not ( = ?auto_49488 ?auto_49489 ) ) ( ON ?auto_49486 ?auto_49488 ) ( CLEAR ?auto_49486 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_49485 ?auto_49483 ?auto_49488 )
      ( MAKE-1PILE ?auto_49483 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_49490 - BLOCK
    )
    :vars
    (
      ?auto_49495 - BLOCK
      ?auto_49494 - BLOCK
      ?auto_49493 - BLOCK
      ?auto_49492 - BLOCK
      ?auto_49491 - BLOCK
      ?auto_49496 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49490 ?auto_49495 ) ( not ( = ?auto_49490 ?auto_49495 ) ) ( not ( = ?auto_49490 ?auto_49494 ) ) ( not ( = ?auto_49490 ?auto_49493 ) ) ( not ( = ?auto_49495 ?auto_49494 ) ) ( not ( = ?auto_49495 ?auto_49493 ) ) ( not ( = ?auto_49494 ?auto_49493 ) ) ( ON ?auto_49494 ?auto_49490 ) ( ON-TABLE ?auto_49495 ) ( ON-TABLE ?auto_49492 ) ( ON ?auto_49491 ?auto_49492 ) ( not ( = ?auto_49492 ?auto_49491 ) ) ( not ( = ?auto_49492 ?auto_49496 ) ) ( not ( = ?auto_49492 ?auto_49493 ) ) ( not ( = ?auto_49491 ?auto_49496 ) ) ( not ( = ?auto_49491 ?auto_49493 ) ) ( not ( = ?auto_49496 ?auto_49493 ) ) ( not ( = ?auto_49490 ?auto_49496 ) ) ( not ( = ?auto_49490 ?auto_49492 ) ) ( not ( = ?auto_49490 ?auto_49491 ) ) ( not ( = ?auto_49495 ?auto_49496 ) ) ( not ( = ?auto_49495 ?auto_49492 ) ) ( not ( = ?auto_49495 ?auto_49491 ) ) ( not ( = ?auto_49494 ?auto_49496 ) ) ( not ( = ?auto_49494 ?auto_49492 ) ) ( not ( = ?auto_49494 ?auto_49491 ) ) ( ON ?auto_49493 ?auto_49494 ) ( CLEAR ?auto_49493 ) ( HOLDING ?auto_49496 ) ( CLEAR ?auto_49491 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_49492 ?auto_49491 ?auto_49496 )
      ( MAKE-1PILE ?auto_49490 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_49497 - BLOCK
    )
    :vars
    (
      ?auto_49499 - BLOCK
      ?auto_49502 - BLOCK
      ?auto_49501 - BLOCK
      ?auto_49503 - BLOCK
      ?auto_49500 - BLOCK
      ?auto_49498 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49497 ?auto_49499 ) ( not ( = ?auto_49497 ?auto_49499 ) ) ( not ( = ?auto_49497 ?auto_49502 ) ) ( not ( = ?auto_49497 ?auto_49501 ) ) ( not ( = ?auto_49499 ?auto_49502 ) ) ( not ( = ?auto_49499 ?auto_49501 ) ) ( not ( = ?auto_49502 ?auto_49501 ) ) ( ON ?auto_49502 ?auto_49497 ) ( ON-TABLE ?auto_49499 ) ( ON-TABLE ?auto_49503 ) ( ON ?auto_49500 ?auto_49503 ) ( not ( = ?auto_49503 ?auto_49500 ) ) ( not ( = ?auto_49503 ?auto_49498 ) ) ( not ( = ?auto_49503 ?auto_49501 ) ) ( not ( = ?auto_49500 ?auto_49498 ) ) ( not ( = ?auto_49500 ?auto_49501 ) ) ( not ( = ?auto_49498 ?auto_49501 ) ) ( not ( = ?auto_49497 ?auto_49498 ) ) ( not ( = ?auto_49497 ?auto_49503 ) ) ( not ( = ?auto_49497 ?auto_49500 ) ) ( not ( = ?auto_49499 ?auto_49498 ) ) ( not ( = ?auto_49499 ?auto_49503 ) ) ( not ( = ?auto_49499 ?auto_49500 ) ) ( not ( = ?auto_49502 ?auto_49498 ) ) ( not ( = ?auto_49502 ?auto_49503 ) ) ( not ( = ?auto_49502 ?auto_49500 ) ) ( ON ?auto_49501 ?auto_49502 ) ( CLEAR ?auto_49500 ) ( ON ?auto_49498 ?auto_49501 ) ( CLEAR ?auto_49498 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_49499 ?auto_49497 ?auto_49502 ?auto_49501 )
      ( MAKE-1PILE ?auto_49497 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_49504 - BLOCK
    )
    :vars
    (
      ?auto_49509 - BLOCK
      ?auto_49506 - BLOCK
      ?auto_49510 - BLOCK
      ?auto_49507 - BLOCK
      ?auto_49505 - BLOCK
      ?auto_49508 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49504 ?auto_49509 ) ( not ( = ?auto_49504 ?auto_49509 ) ) ( not ( = ?auto_49504 ?auto_49506 ) ) ( not ( = ?auto_49504 ?auto_49510 ) ) ( not ( = ?auto_49509 ?auto_49506 ) ) ( not ( = ?auto_49509 ?auto_49510 ) ) ( not ( = ?auto_49506 ?auto_49510 ) ) ( ON ?auto_49506 ?auto_49504 ) ( ON-TABLE ?auto_49509 ) ( ON-TABLE ?auto_49507 ) ( not ( = ?auto_49507 ?auto_49505 ) ) ( not ( = ?auto_49507 ?auto_49508 ) ) ( not ( = ?auto_49507 ?auto_49510 ) ) ( not ( = ?auto_49505 ?auto_49508 ) ) ( not ( = ?auto_49505 ?auto_49510 ) ) ( not ( = ?auto_49508 ?auto_49510 ) ) ( not ( = ?auto_49504 ?auto_49508 ) ) ( not ( = ?auto_49504 ?auto_49507 ) ) ( not ( = ?auto_49504 ?auto_49505 ) ) ( not ( = ?auto_49509 ?auto_49508 ) ) ( not ( = ?auto_49509 ?auto_49507 ) ) ( not ( = ?auto_49509 ?auto_49505 ) ) ( not ( = ?auto_49506 ?auto_49508 ) ) ( not ( = ?auto_49506 ?auto_49507 ) ) ( not ( = ?auto_49506 ?auto_49505 ) ) ( ON ?auto_49510 ?auto_49506 ) ( ON ?auto_49508 ?auto_49510 ) ( CLEAR ?auto_49508 ) ( HOLDING ?auto_49505 ) ( CLEAR ?auto_49507 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_49507 ?auto_49505 )
      ( MAKE-1PILE ?auto_49504 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_49511 - BLOCK
    )
    :vars
    (
      ?auto_49516 - BLOCK
      ?auto_49514 - BLOCK
      ?auto_49513 - BLOCK
      ?auto_49512 - BLOCK
      ?auto_49517 - BLOCK
      ?auto_49515 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49511 ?auto_49516 ) ( not ( = ?auto_49511 ?auto_49516 ) ) ( not ( = ?auto_49511 ?auto_49514 ) ) ( not ( = ?auto_49511 ?auto_49513 ) ) ( not ( = ?auto_49516 ?auto_49514 ) ) ( not ( = ?auto_49516 ?auto_49513 ) ) ( not ( = ?auto_49514 ?auto_49513 ) ) ( ON ?auto_49514 ?auto_49511 ) ( ON-TABLE ?auto_49516 ) ( ON-TABLE ?auto_49512 ) ( not ( = ?auto_49512 ?auto_49517 ) ) ( not ( = ?auto_49512 ?auto_49515 ) ) ( not ( = ?auto_49512 ?auto_49513 ) ) ( not ( = ?auto_49517 ?auto_49515 ) ) ( not ( = ?auto_49517 ?auto_49513 ) ) ( not ( = ?auto_49515 ?auto_49513 ) ) ( not ( = ?auto_49511 ?auto_49515 ) ) ( not ( = ?auto_49511 ?auto_49512 ) ) ( not ( = ?auto_49511 ?auto_49517 ) ) ( not ( = ?auto_49516 ?auto_49515 ) ) ( not ( = ?auto_49516 ?auto_49512 ) ) ( not ( = ?auto_49516 ?auto_49517 ) ) ( not ( = ?auto_49514 ?auto_49515 ) ) ( not ( = ?auto_49514 ?auto_49512 ) ) ( not ( = ?auto_49514 ?auto_49517 ) ) ( ON ?auto_49513 ?auto_49514 ) ( ON ?auto_49515 ?auto_49513 ) ( CLEAR ?auto_49512 ) ( ON ?auto_49517 ?auto_49515 ) ( CLEAR ?auto_49517 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_49516 ?auto_49511 ?auto_49514 ?auto_49513 ?auto_49515 )
      ( MAKE-1PILE ?auto_49511 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_49518 - BLOCK
    )
    :vars
    (
      ?auto_49520 - BLOCK
      ?auto_49519 - BLOCK
      ?auto_49521 - BLOCK
      ?auto_49523 - BLOCK
      ?auto_49522 - BLOCK
      ?auto_49524 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49518 ?auto_49520 ) ( not ( = ?auto_49518 ?auto_49520 ) ) ( not ( = ?auto_49518 ?auto_49519 ) ) ( not ( = ?auto_49518 ?auto_49521 ) ) ( not ( = ?auto_49520 ?auto_49519 ) ) ( not ( = ?auto_49520 ?auto_49521 ) ) ( not ( = ?auto_49519 ?auto_49521 ) ) ( ON ?auto_49519 ?auto_49518 ) ( ON-TABLE ?auto_49520 ) ( not ( = ?auto_49523 ?auto_49522 ) ) ( not ( = ?auto_49523 ?auto_49524 ) ) ( not ( = ?auto_49523 ?auto_49521 ) ) ( not ( = ?auto_49522 ?auto_49524 ) ) ( not ( = ?auto_49522 ?auto_49521 ) ) ( not ( = ?auto_49524 ?auto_49521 ) ) ( not ( = ?auto_49518 ?auto_49524 ) ) ( not ( = ?auto_49518 ?auto_49523 ) ) ( not ( = ?auto_49518 ?auto_49522 ) ) ( not ( = ?auto_49520 ?auto_49524 ) ) ( not ( = ?auto_49520 ?auto_49523 ) ) ( not ( = ?auto_49520 ?auto_49522 ) ) ( not ( = ?auto_49519 ?auto_49524 ) ) ( not ( = ?auto_49519 ?auto_49523 ) ) ( not ( = ?auto_49519 ?auto_49522 ) ) ( ON ?auto_49521 ?auto_49519 ) ( ON ?auto_49524 ?auto_49521 ) ( ON ?auto_49522 ?auto_49524 ) ( CLEAR ?auto_49522 ) ( HOLDING ?auto_49523 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_49523 )
      ( MAKE-1PILE ?auto_49518 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_49525 - BLOCK
    )
    :vars
    (
      ?auto_49530 - BLOCK
      ?auto_49531 - BLOCK
      ?auto_49527 - BLOCK
      ?auto_49529 - BLOCK
      ?auto_49526 - BLOCK
      ?auto_49528 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49525 ?auto_49530 ) ( not ( = ?auto_49525 ?auto_49530 ) ) ( not ( = ?auto_49525 ?auto_49531 ) ) ( not ( = ?auto_49525 ?auto_49527 ) ) ( not ( = ?auto_49530 ?auto_49531 ) ) ( not ( = ?auto_49530 ?auto_49527 ) ) ( not ( = ?auto_49531 ?auto_49527 ) ) ( ON ?auto_49531 ?auto_49525 ) ( ON-TABLE ?auto_49530 ) ( not ( = ?auto_49529 ?auto_49526 ) ) ( not ( = ?auto_49529 ?auto_49528 ) ) ( not ( = ?auto_49529 ?auto_49527 ) ) ( not ( = ?auto_49526 ?auto_49528 ) ) ( not ( = ?auto_49526 ?auto_49527 ) ) ( not ( = ?auto_49528 ?auto_49527 ) ) ( not ( = ?auto_49525 ?auto_49528 ) ) ( not ( = ?auto_49525 ?auto_49529 ) ) ( not ( = ?auto_49525 ?auto_49526 ) ) ( not ( = ?auto_49530 ?auto_49528 ) ) ( not ( = ?auto_49530 ?auto_49529 ) ) ( not ( = ?auto_49530 ?auto_49526 ) ) ( not ( = ?auto_49531 ?auto_49528 ) ) ( not ( = ?auto_49531 ?auto_49529 ) ) ( not ( = ?auto_49531 ?auto_49526 ) ) ( ON ?auto_49527 ?auto_49531 ) ( ON ?auto_49528 ?auto_49527 ) ( ON ?auto_49526 ?auto_49528 ) ( ON ?auto_49529 ?auto_49526 ) ( CLEAR ?auto_49529 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_49530 ?auto_49525 ?auto_49531 ?auto_49527 ?auto_49528 ?auto_49526 )
      ( MAKE-1PILE ?auto_49525 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_49541 - BLOCK
      ?auto_49542 - BLOCK
      ?auto_49543 - BLOCK
      ?auto_49544 - BLOCK
    )
    :vars
    (
      ?auto_49545 - BLOCK
      ?auto_49546 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49545 ?auto_49544 ) ( CLEAR ?auto_49545 ) ( ON-TABLE ?auto_49541 ) ( ON ?auto_49542 ?auto_49541 ) ( ON ?auto_49543 ?auto_49542 ) ( ON ?auto_49544 ?auto_49543 ) ( not ( = ?auto_49541 ?auto_49542 ) ) ( not ( = ?auto_49541 ?auto_49543 ) ) ( not ( = ?auto_49541 ?auto_49544 ) ) ( not ( = ?auto_49541 ?auto_49545 ) ) ( not ( = ?auto_49542 ?auto_49543 ) ) ( not ( = ?auto_49542 ?auto_49544 ) ) ( not ( = ?auto_49542 ?auto_49545 ) ) ( not ( = ?auto_49543 ?auto_49544 ) ) ( not ( = ?auto_49543 ?auto_49545 ) ) ( not ( = ?auto_49544 ?auto_49545 ) ) ( HOLDING ?auto_49546 ) ( not ( = ?auto_49541 ?auto_49546 ) ) ( not ( = ?auto_49542 ?auto_49546 ) ) ( not ( = ?auto_49543 ?auto_49546 ) ) ( not ( = ?auto_49544 ?auto_49546 ) ) ( not ( = ?auto_49545 ?auto_49546 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_49546 )
      ( MAKE-4PILE ?auto_49541 ?auto_49542 ?auto_49543 ?auto_49544 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_49614 - BLOCK
      ?auto_49615 - BLOCK
    )
    :vars
    (
      ?auto_49616 - BLOCK
      ?auto_49619 - BLOCK
      ?auto_49617 - BLOCK
      ?auto_49618 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49614 ?auto_49615 ) ) ( ON ?auto_49615 ?auto_49616 ) ( not ( = ?auto_49614 ?auto_49616 ) ) ( not ( = ?auto_49615 ?auto_49616 ) ) ( ON ?auto_49614 ?auto_49615 ) ( CLEAR ?auto_49614 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_49619 ) ( ON ?auto_49617 ?auto_49619 ) ( ON ?auto_49618 ?auto_49617 ) ( ON ?auto_49616 ?auto_49618 ) ( not ( = ?auto_49619 ?auto_49617 ) ) ( not ( = ?auto_49619 ?auto_49618 ) ) ( not ( = ?auto_49619 ?auto_49616 ) ) ( not ( = ?auto_49619 ?auto_49615 ) ) ( not ( = ?auto_49619 ?auto_49614 ) ) ( not ( = ?auto_49617 ?auto_49618 ) ) ( not ( = ?auto_49617 ?auto_49616 ) ) ( not ( = ?auto_49617 ?auto_49615 ) ) ( not ( = ?auto_49617 ?auto_49614 ) ) ( not ( = ?auto_49618 ?auto_49616 ) ) ( not ( = ?auto_49618 ?auto_49615 ) ) ( not ( = ?auto_49618 ?auto_49614 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_49619 ?auto_49617 ?auto_49618 ?auto_49616 ?auto_49615 )
      ( MAKE-2PILE ?auto_49614 ?auto_49615 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_49622 - BLOCK
      ?auto_49623 - BLOCK
    )
    :vars
    (
      ?auto_49624 - BLOCK
      ?auto_49625 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49622 ?auto_49623 ) ) ( ON ?auto_49623 ?auto_49624 ) ( CLEAR ?auto_49623 ) ( not ( = ?auto_49622 ?auto_49624 ) ) ( not ( = ?auto_49623 ?auto_49624 ) ) ( ON ?auto_49622 ?auto_49625 ) ( CLEAR ?auto_49622 ) ( HAND-EMPTY ) ( not ( = ?auto_49622 ?auto_49625 ) ) ( not ( = ?auto_49623 ?auto_49625 ) ) ( not ( = ?auto_49624 ?auto_49625 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_49622 ?auto_49625 )
      ( MAKE-2PILE ?auto_49622 ?auto_49623 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_49626 - BLOCK
      ?auto_49627 - BLOCK
    )
    :vars
    (
      ?auto_49628 - BLOCK
      ?auto_49629 - BLOCK
      ?auto_49632 - BLOCK
      ?auto_49631 - BLOCK
      ?auto_49630 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49626 ?auto_49627 ) ) ( not ( = ?auto_49626 ?auto_49628 ) ) ( not ( = ?auto_49627 ?auto_49628 ) ) ( ON ?auto_49626 ?auto_49629 ) ( CLEAR ?auto_49626 ) ( not ( = ?auto_49626 ?auto_49629 ) ) ( not ( = ?auto_49627 ?auto_49629 ) ) ( not ( = ?auto_49628 ?auto_49629 ) ) ( HOLDING ?auto_49627 ) ( CLEAR ?auto_49628 ) ( ON-TABLE ?auto_49632 ) ( ON ?auto_49631 ?auto_49632 ) ( ON ?auto_49630 ?auto_49631 ) ( ON ?auto_49628 ?auto_49630 ) ( not ( = ?auto_49632 ?auto_49631 ) ) ( not ( = ?auto_49632 ?auto_49630 ) ) ( not ( = ?auto_49632 ?auto_49628 ) ) ( not ( = ?auto_49632 ?auto_49627 ) ) ( not ( = ?auto_49631 ?auto_49630 ) ) ( not ( = ?auto_49631 ?auto_49628 ) ) ( not ( = ?auto_49631 ?auto_49627 ) ) ( not ( = ?auto_49630 ?auto_49628 ) ) ( not ( = ?auto_49630 ?auto_49627 ) ) ( not ( = ?auto_49626 ?auto_49632 ) ) ( not ( = ?auto_49626 ?auto_49631 ) ) ( not ( = ?auto_49626 ?auto_49630 ) ) ( not ( = ?auto_49629 ?auto_49632 ) ) ( not ( = ?auto_49629 ?auto_49631 ) ) ( not ( = ?auto_49629 ?auto_49630 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_49632 ?auto_49631 ?auto_49630 ?auto_49628 ?auto_49627 )
      ( MAKE-2PILE ?auto_49626 ?auto_49627 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_49633 - BLOCK
      ?auto_49634 - BLOCK
    )
    :vars
    (
      ?auto_49638 - BLOCK
      ?auto_49635 - BLOCK
      ?auto_49636 - BLOCK
      ?auto_49639 - BLOCK
      ?auto_49637 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49633 ?auto_49634 ) ) ( not ( = ?auto_49633 ?auto_49638 ) ) ( not ( = ?auto_49634 ?auto_49638 ) ) ( ON ?auto_49633 ?auto_49635 ) ( not ( = ?auto_49633 ?auto_49635 ) ) ( not ( = ?auto_49634 ?auto_49635 ) ) ( not ( = ?auto_49638 ?auto_49635 ) ) ( CLEAR ?auto_49638 ) ( ON-TABLE ?auto_49636 ) ( ON ?auto_49639 ?auto_49636 ) ( ON ?auto_49637 ?auto_49639 ) ( ON ?auto_49638 ?auto_49637 ) ( not ( = ?auto_49636 ?auto_49639 ) ) ( not ( = ?auto_49636 ?auto_49637 ) ) ( not ( = ?auto_49636 ?auto_49638 ) ) ( not ( = ?auto_49636 ?auto_49634 ) ) ( not ( = ?auto_49639 ?auto_49637 ) ) ( not ( = ?auto_49639 ?auto_49638 ) ) ( not ( = ?auto_49639 ?auto_49634 ) ) ( not ( = ?auto_49637 ?auto_49638 ) ) ( not ( = ?auto_49637 ?auto_49634 ) ) ( not ( = ?auto_49633 ?auto_49636 ) ) ( not ( = ?auto_49633 ?auto_49639 ) ) ( not ( = ?auto_49633 ?auto_49637 ) ) ( not ( = ?auto_49635 ?auto_49636 ) ) ( not ( = ?auto_49635 ?auto_49639 ) ) ( not ( = ?auto_49635 ?auto_49637 ) ) ( ON ?auto_49634 ?auto_49633 ) ( CLEAR ?auto_49634 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_49635 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_49635 ?auto_49633 )
      ( MAKE-2PILE ?auto_49633 ?auto_49634 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_49640 - BLOCK
      ?auto_49641 - BLOCK
    )
    :vars
    (
      ?auto_49645 - BLOCK
      ?auto_49642 - BLOCK
      ?auto_49643 - BLOCK
      ?auto_49646 - BLOCK
      ?auto_49644 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49640 ?auto_49641 ) ) ( not ( = ?auto_49640 ?auto_49645 ) ) ( not ( = ?auto_49641 ?auto_49645 ) ) ( ON ?auto_49640 ?auto_49642 ) ( not ( = ?auto_49640 ?auto_49642 ) ) ( not ( = ?auto_49641 ?auto_49642 ) ) ( not ( = ?auto_49645 ?auto_49642 ) ) ( ON-TABLE ?auto_49643 ) ( ON ?auto_49646 ?auto_49643 ) ( ON ?auto_49644 ?auto_49646 ) ( not ( = ?auto_49643 ?auto_49646 ) ) ( not ( = ?auto_49643 ?auto_49644 ) ) ( not ( = ?auto_49643 ?auto_49645 ) ) ( not ( = ?auto_49643 ?auto_49641 ) ) ( not ( = ?auto_49646 ?auto_49644 ) ) ( not ( = ?auto_49646 ?auto_49645 ) ) ( not ( = ?auto_49646 ?auto_49641 ) ) ( not ( = ?auto_49644 ?auto_49645 ) ) ( not ( = ?auto_49644 ?auto_49641 ) ) ( not ( = ?auto_49640 ?auto_49643 ) ) ( not ( = ?auto_49640 ?auto_49646 ) ) ( not ( = ?auto_49640 ?auto_49644 ) ) ( not ( = ?auto_49642 ?auto_49643 ) ) ( not ( = ?auto_49642 ?auto_49646 ) ) ( not ( = ?auto_49642 ?auto_49644 ) ) ( ON ?auto_49641 ?auto_49640 ) ( CLEAR ?auto_49641 ) ( ON-TABLE ?auto_49642 ) ( HOLDING ?auto_49645 ) ( CLEAR ?auto_49644 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_49643 ?auto_49646 ?auto_49644 ?auto_49645 )
      ( MAKE-2PILE ?auto_49640 ?auto_49641 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_49647 - BLOCK
      ?auto_49648 - BLOCK
    )
    :vars
    (
      ?auto_49649 - BLOCK
      ?auto_49653 - BLOCK
      ?auto_49652 - BLOCK
      ?auto_49650 - BLOCK
      ?auto_49651 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49647 ?auto_49648 ) ) ( not ( = ?auto_49647 ?auto_49649 ) ) ( not ( = ?auto_49648 ?auto_49649 ) ) ( ON ?auto_49647 ?auto_49653 ) ( not ( = ?auto_49647 ?auto_49653 ) ) ( not ( = ?auto_49648 ?auto_49653 ) ) ( not ( = ?auto_49649 ?auto_49653 ) ) ( ON-TABLE ?auto_49652 ) ( ON ?auto_49650 ?auto_49652 ) ( ON ?auto_49651 ?auto_49650 ) ( not ( = ?auto_49652 ?auto_49650 ) ) ( not ( = ?auto_49652 ?auto_49651 ) ) ( not ( = ?auto_49652 ?auto_49649 ) ) ( not ( = ?auto_49652 ?auto_49648 ) ) ( not ( = ?auto_49650 ?auto_49651 ) ) ( not ( = ?auto_49650 ?auto_49649 ) ) ( not ( = ?auto_49650 ?auto_49648 ) ) ( not ( = ?auto_49651 ?auto_49649 ) ) ( not ( = ?auto_49651 ?auto_49648 ) ) ( not ( = ?auto_49647 ?auto_49652 ) ) ( not ( = ?auto_49647 ?auto_49650 ) ) ( not ( = ?auto_49647 ?auto_49651 ) ) ( not ( = ?auto_49653 ?auto_49652 ) ) ( not ( = ?auto_49653 ?auto_49650 ) ) ( not ( = ?auto_49653 ?auto_49651 ) ) ( ON ?auto_49648 ?auto_49647 ) ( ON-TABLE ?auto_49653 ) ( CLEAR ?auto_49651 ) ( ON ?auto_49649 ?auto_49648 ) ( CLEAR ?auto_49649 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_49653 ?auto_49647 ?auto_49648 )
      ( MAKE-2PILE ?auto_49647 ?auto_49648 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_49654 - BLOCK
      ?auto_49655 - BLOCK
    )
    :vars
    (
      ?auto_49660 - BLOCK
      ?auto_49656 - BLOCK
      ?auto_49659 - BLOCK
      ?auto_49658 - BLOCK
      ?auto_49657 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49654 ?auto_49655 ) ) ( not ( = ?auto_49654 ?auto_49660 ) ) ( not ( = ?auto_49655 ?auto_49660 ) ) ( ON ?auto_49654 ?auto_49656 ) ( not ( = ?auto_49654 ?auto_49656 ) ) ( not ( = ?auto_49655 ?auto_49656 ) ) ( not ( = ?auto_49660 ?auto_49656 ) ) ( ON-TABLE ?auto_49659 ) ( ON ?auto_49658 ?auto_49659 ) ( not ( = ?auto_49659 ?auto_49658 ) ) ( not ( = ?auto_49659 ?auto_49657 ) ) ( not ( = ?auto_49659 ?auto_49660 ) ) ( not ( = ?auto_49659 ?auto_49655 ) ) ( not ( = ?auto_49658 ?auto_49657 ) ) ( not ( = ?auto_49658 ?auto_49660 ) ) ( not ( = ?auto_49658 ?auto_49655 ) ) ( not ( = ?auto_49657 ?auto_49660 ) ) ( not ( = ?auto_49657 ?auto_49655 ) ) ( not ( = ?auto_49654 ?auto_49659 ) ) ( not ( = ?auto_49654 ?auto_49658 ) ) ( not ( = ?auto_49654 ?auto_49657 ) ) ( not ( = ?auto_49656 ?auto_49659 ) ) ( not ( = ?auto_49656 ?auto_49658 ) ) ( not ( = ?auto_49656 ?auto_49657 ) ) ( ON ?auto_49655 ?auto_49654 ) ( ON-TABLE ?auto_49656 ) ( ON ?auto_49660 ?auto_49655 ) ( CLEAR ?auto_49660 ) ( HOLDING ?auto_49657 ) ( CLEAR ?auto_49658 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_49659 ?auto_49658 ?auto_49657 )
      ( MAKE-2PILE ?auto_49654 ?auto_49655 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_49661 - BLOCK
      ?auto_49662 - BLOCK
    )
    :vars
    (
      ?auto_49664 - BLOCK
      ?auto_49667 - BLOCK
      ?auto_49663 - BLOCK
      ?auto_49665 - BLOCK
      ?auto_49666 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49661 ?auto_49662 ) ) ( not ( = ?auto_49661 ?auto_49664 ) ) ( not ( = ?auto_49662 ?auto_49664 ) ) ( ON ?auto_49661 ?auto_49667 ) ( not ( = ?auto_49661 ?auto_49667 ) ) ( not ( = ?auto_49662 ?auto_49667 ) ) ( not ( = ?auto_49664 ?auto_49667 ) ) ( ON-TABLE ?auto_49663 ) ( ON ?auto_49665 ?auto_49663 ) ( not ( = ?auto_49663 ?auto_49665 ) ) ( not ( = ?auto_49663 ?auto_49666 ) ) ( not ( = ?auto_49663 ?auto_49664 ) ) ( not ( = ?auto_49663 ?auto_49662 ) ) ( not ( = ?auto_49665 ?auto_49666 ) ) ( not ( = ?auto_49665 ?auto_49664 ) ) ( not ( = ?auto_49665 ?auto_49662 ) ) ( not ( = ?auto_49666 ?auto_49664 ) ) ( not ( = ?auto_49666 ?auto_49662 ) ) ( not ( = ?auto_49661 ?auto_49663 ) ) ( not ( = ?auto_49661 ?auto_49665 ) ) ( not ( = ?auto_49661 ?auto_49666 ) ) ( not ( = ?auto_49667 ?auto_49663 ) ) ( not ( = ?auto_49667 ?auto_49665 ) ) ( not ( = ?auto_49667 ?auto_49666 ) ) ( ON ?auto_49662 ?auto_49661 ) ( ON-TABLE ?auto_49667 ) ( ON ?auto_49664 ?auto_49662 ) ( CLEAR ?auto_49665 ) ( ON ?auto_49666 ?auto_49664 ) ( CLEAR ?auto_49666 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_49667 ?auto_49661 ?auto_49662 ?auto_49664 )
      ( MAKE-2PILE ?auto_49661 ?auto_49662 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_49668 - BLOCK
      ?auto_49669 - BLOCK
    )
    :vars
    (
      ?auto_49674 - BLOCK
      ?auto_49670 - BLOCK
      ?auto_49673 - BLOCK
      ?auto_49672 - BLOCK
      ?auto_49671 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49668 ?auto_49669 ) ) ( not ( = ?auto_49668 ?auto_49674 ) ) ( not ( = ?auto_49669 ?auto_49674 ) ) ( ON ?auto_49668 ?auto_49670 ) ( not ( = ?auto_49668 ?auto_49670 ) ) ( not ( = ?auto_49669 ?auto_49670 ) ) ( not ( = ?auto_49674 ?auto_49670 ) ) ( ON-TABLE ?auto_49673 ) ( not ( = ?auto_49673 ?auto_49672 ) ) ( not ( = ?auto_49673 ?auto_49671 ) ) ( not ( = ?auto_49673 ?auto_49674 ) ) ( not ( = ?auto_49673 ?auto_49669 ) ) ( not ( = ?auto_49672 ?auto_49671 ) ) ( not ( = ?auto_49672 ?auto_49674 ) ) ( not ( = ?auto_49672 ?auto_49669 ) ) ( not ( = ?auto_49671 ?auto_49674 ) ) ( not ( = ?auto_49671 ?auto_49669 ) ) ( not ( = ?auto_49668 ?auto_49673 ) ) ( not ( = ?auto_49668 ?auto_49672 ) ) ( not ( = ?auto_49668 ?auto_49671 ) ) ( not ( = ?auto_49670 ?auto_49673 ) ) ( not ( = ?auto_49670 ?auto_49672 ) ) ( not ( = ?auto_49670 ?auto_49671 ) ) ( ON ?auto_49669 ?auto_49668 ) ( ON-TABLE ?auto_49670 ) ( ON ?auto_49674 ?auto_49669 ) ( ON ?auto_49671 ?auto_49674 ) ( CLEAR ?auto_49671 ) ( HOLDING ?auto_49672 ) ( CLEAR ?auto_49673 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_49673 ?auto_49672 )
      ( MAKE-2PILE ?auto_49668 ?auto_49669 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_49675 - BLOCK
      ?auto_49676 - BLOCK
    )
    :vars
    (
      ?auto_49679 - BLOCK
      ?auto_49678 - BLOCK
      ?auto_49680 - BLOCK
      ?auto_49677 - BLOCK
      ?auto_49681 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49675 ?auto_49676 ) ) ( not ( = ?auto_49675 ?auto_49679 ) ) ( not ( = ?auto_49676 ?auto_49679 ) ) ( ON ?auto_49675 ?auto_49678 ) ( not ( = ?auto_49675 ?auto_49678 ) ) ( not ( = ?auto_49676 ?auto_49678 ) ) ( not ( = ?auto_49679 ?auto_49678 ) ) ( ON-TABLE ?auto_49680 ) ( not ( = ?auto_49680 ?auto_49677 ) ) ( not ( = ?auto_49680 ?auto_49681 ) ) ( not ( = ?auto_49680 ?auto_49679 ) ) ( not ( = ?auto_49680 ?auto_49676 ) ) ( not ( = ?auto_49677 ?auto_49681 ) ) ( not ( = ?auto_49677 ?auto_49679 ) ) ( not ( = ?auto_49677 ?auto_49676 ) ) ( not ( = ?auto_49681 ?auto_49679 ) ) ( not ( = ?auto_49681 ?auto_49676 ) ) ( not ( = ?auto_49675 ?auto_49680 ) ) ( not ( = ?auto_49675 ?auto_49677 ) ) ( not ( = ?auto_49675 ?auto_49681 ) ) ( not ( = ?auto_49678 ?auto_49680 ) ) ( not ( = ?auto_49678 ?auto_49677 ) ) ( not ( = ?auto_49678 ?auto_49681 ) ) ( ON ?auto_49676 ?auto_49675 ) ( ON-TABLE ?auto_49678 ) ( ON ?auto_49679 ?auto_49676 ) ( ON ?auto_49681 ?auto_49679 ) ( CLEAR ?auto_49680 ) ( ON ?auto_49677 ?auto_49681 ) ( CLEAR ?auto_49677 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_49678 ?auto_49675 ?auto_49676 ?auto_49679 ?auto_49681 )
      ( MAKE-2PILE ?auto_49675 ?auto_49676 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_49682 - BLOCK
      ?auto_49683 - BLOCK
    )
    :vars
    (
      ?auto_49688 - BLOCK
      ?auto_49684 - BLOCK
      ?auto_49687 - BLOCK
      ?auto_49686 - BLOCK
      ?auto_49685 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49682 ?auto_49683 ) ) ( not ( = ?auto_49682 ?auto_49688 ) ) ( not ( = ?auto_49683 ?auto_49688 ) ) ( ON ?auto_49682 ?auto_49684 ) ( not ( = ?auto_49682 ?auto_49684 ) ) ( not ( = ?auto_49683 ?auto_49684 ) ) ( not ( = ?auto_49688 ?auto_49684 ) ) ( not ( = ?auto_49687 ?auto_49686 ) ) ( not ( = ?auto_49687 ?auto_49685 ) ) ( not ( = ?auto_49687 ?auto_49688 ) ) ( not ( = ?auto_49687 ?auto_49683 ) ) ( not ( = ?auto_49686 ?auto_49685 ) ) ( not ( = ?auto_49686 ?auto_49688 ) ) ( not ( = ?auto_49686 ?auto_49683 ) ) ( not ( = ?auto_49685 ?auto_49688 ) ) ( not ( = ?auto_49685 ?auto_49683 ) ) ( not ( = ?auto_49682 ?auto_49687 ) ) ( not ( = ?auto_49682 ?auto_49686 ) ) ( not ( = ?auto_49682 ?auto_49685 ) ) ( not ( = ?auto_49684 ?auto_49687 ) ) ( not ( = ?auto_49684 ?auto_49686 ) ) ( not ( = ?auto_49684 ?auto_49685 ) ) ( ON ?auto_49683 ?auto_49682 ) ( ON-TABLE ?auto_49684 ) ( ON ?auto_49688 ?auto_49683 ) ( ON ?auto_49685 ?auto_49688 ) ( ON ?auto_49686 ?auto_49685 ) ( CLEAR ?auto_49686 ) ( HOLDING ?auto_49687 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_49687 )
      ( MAKE-2PILE ?auto_49682 ?auto_49683 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_49689 - BLOCK
      ?auto_49690 - BLOCK
    )
    :vars
    (
      ?auto_49694 - BLOCK
      ?auto_49691 - BLOCK
      ?auto_49695 - BLOCK
      ?auto_49692 - BLOCK
      ?auto_49693 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49689 ?auto_49690 ) ) ( not ( = ?auto_49689 ?auto_49694 ) ) ( not ( = ?auto_49690 ?auto_49694 ) ) ( ON ?auto_49689 ?auto_49691 ) ( not ( = ?auto_49689 ?auto_49691 ) ) ( not ( = ?auto_49690 ?auto_49691 ) ) ( not ( = ?auto_49694 ?auto_49691 ) ) ( not ( = ?auto_49695 ?auto_49692 ) ) ( not ( = ?auto_49695 ?auto_49693 ) ) ( not ( = ?auto_49695 ?auto_49694 ) ) ( not ( = ?auto_49695 ?auto_49690 ) ) ( not ( = ?auto_49692 ?auto_49693 ) ) ( not ( = ?auto_49692 ?auto_49694 ) ) ( not ( = ?auto_49692 ?auto_49690 ) ) ( not ( = ?auto_49693 ?auto_49694 ) ) ( not ( = ?auto_49693 ?auto_49690 ) ) ( not ( = ?auto_49689 ?auto_49695 ) ) ( not ( = ?auto_49689 ?auto_49692 ) ) ( not ( = ?auto_49689 ?auto_49693 ) ) ( not ( = ?auto_49691 ?auto_49695 ) ) ( not ( = ?auto_49691 ?auto_49692 ) ) ( not ( = ?auto_49691 ?auto_49693 ) ) ( ON ?auto_49690 ?auto_49689 ) ( ON-TABLE ?auto_49691 ) ( ON ?auto_49694 ?auto_49690 ) ( ON ?auto_49693 ?auto_49694 ) ( ON ?auto_49692 ?auto_49693 ) ( ON ?auto_49695 ?auto_49692 ) ( CLEAR ?auto_49695 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_49691 ?auto_49689 ?auto_49690 ?auto_49694 ?auto_49693 ?auto_49692 )
      ( MAKE-2PILE ?auto_49689 ?auto_49690 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_49715 - BLOCK
      ?auto_49716 - BLOCK
      ?auto_49717 - BLOCK
    )
    :vars
    (
      ?auto_49720 - BLOCK
      ?auto_49719 - BLOCK
      ?auto_49718 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49720 ?auto_49717 ) ( ON-TABLE ?auto_49715 ) ( ON ?auto_49716 ?auto_49715 ) ( ON ?auto_49717 ?auto_49716 ) ( not ( = ?auto_49715 ?auto_49716 ) ) ( not ( = ?auto_49715 ?auto_49717 ) ) ( not ( = ?auto_49715 ?auto_49720 ) ) ( not ( = ?auto_49716 ?auto_49717 ) ) ( not ( = ?auto_49716 ?auto_49720 ) ) ( not ( = ?auto_49717 ?auto_49720 ) ) ( not ( = ?auto_49715 ?auto_49719 ) ) ( not ( = ?auto_49715 ?auto_49718 ) ) ( not ( = ?auto_49716 ?auto_49719 ) ) ( not ( = ?auto_49716 ?auto_49718 ) ) ( not ( = ?auto_49717 ?auto_49719 ) ) ( not ( = ?auto_49717 ?auto_49718 ) ) ( not ( = ?auto_49720 ?auto_49719 ) ) ( not ( = ?auto_49720 ?auto_49718 ) ) ( not ( = ?auto_49719 ?auto_49718 ) ) ( ON ?auto_49719 ?auto_49720 ) ( CLEAR ?auto_49719 ) ( HOLDING ?auto_49718 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_49718 )
      ( MAKE-3PILE ?auto_49715 ?auto_49716 ?auto_49717 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_49780 - BLOCK
      ?auto_49781 - BLOCK
      ?auto_49782 - BLOCK
    )
    :vars
    (
      ?auto_49783 - BLOCK
      ?auto_49784 - BLOCK
      ?auto_49785 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_49780 ) ( not ( = ?auto_49780 ?auto_49781 ) ) ( not ( = ?auto_49780 ?auto_49782 ) ) ( not ( = ?auto_49781 ?auto_49782 ) ) ( ON ?auto_49782 ?auto_49783 ) ( not ( = ?auto_49780 ?auto_49783 ) ) ( not ( = ?auto_49781 ?auto_49783 ) ) ( not ( = ?auto_49782 ?auto_49783 ) ) ( CLEAR ?auto_49780 ) ( ON ?auto_49781 ?auto_49782 ) ( CLEAR ?auto_49781 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_49784 ) ( ON ?auto_49785 ?auto_49784 ) ( ON ?auto_49783 ?auto_49785 ) ( not ( = ?auto_49784 ?auto_49785 ) ) ( not ( = ?auto_49784 ?auto_49783 ) ) ( not ( = ?auto_49784 ?auto_49782 ) ) ( not ( = ?auto_49784 ?auto_49781 ) ) ( not ( = ?auto_49785 ?auto_49783 ) ) ( not ( = ?auto_49785 ?auto_49782 ) ) ( not ( = ?auto_49785 ?auto_49781 ) ) ( not ( = ?auto_49780 ?auto_49784 ) ) ( not ( = ?auto_49780 ?auto_49785 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_49784 ?auto_49785 ?auto_49783 ?auto_49782 )
      ( MAKE-3PILE ?auto_49780 ?auto_49781 ?auto_49782 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_49786 - BLOCK
      ?auto_49787 - BLOCK
      ?auto_49788 - BLOCK
    )
    :vars
    (
      ?auto_49790 - BLOCK
      ?auto_49789 - BLOCK
      ?auto_49791 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49786 ?auto_49787 ) ) ( not ( = ?auto_49786 ?auto_49788 ) ) ( not ( = ?auto_49787 ?auto_49788 ) ) ( ON ?auto_49788 ?auto_49790 ) ( not ( = ?auto_49786 ?auto_49790 ) ) ( not ( = ?auto_49787 ?auto_49790 ) ) ( not ( = ?auto_49788 ?auto_49790 ) ) ( ON ?auto_49787 ?auto_49788 ) ( CLEAR ?auto_49787 ) ( ON-TABLE ?auto_49789 ) ( ON ?auto_49791 ?auto_49789 ) ( ON ?auto_49790 ?auto_49791 ) ( not ( = ?auto_49789 ?auto_49791 ) ) ( not ( = ?auto_49789 ?auto_49790 ) ) ( not ( = ?auto_49789 ?auto_49788 ) ) ( not ( = ?auto_49789 ?auto_49787 ) ) ( not ( = ?auto_49791 ?auto_49790 ) ) ( not ( = ?auto_49791 ?auto_49788 ) ) ( not ( = ?auto_49791 ?auto_49787 ) ) ( not ( = ?auto_49786 ?auto_49789 ) ) ( not ( = ?auto_49786 ?auto_49791 ) ) ( HOLDING ?auto_49786 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_49786 )
      ( MAKE-3PILE ?auto_49786 ?auto_49787 ?auto_49788 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_49792 - BLOCK
      ?auto_49793 - BLOCK
      ?auto_49794 - BLOCK
    )
    :vars
    (
      ?auto_49796 - BLOCK
      ?auto_49795 - BLOCK
      ?auto_49797 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49792 ?auto_49793 ) ) ( not ( = ?auto_49792 ?auto_49794 ) ) ( not ( = ?auto_49793 ?auto_49794 ) ) ( ON ?auto_49794 ?auto_49796 ) ( not ( = ?auto_49792 ?auto_49796 ) ) ( not ( = ?auto_49793 ?auto_49796 ) ) ( not ( = ?auto_49794 ?auto_49796 ) ) ( ON ?auto_49793 ?auto_49794 ) ( ON-TABLE ?auto_49795 ) ( ON ?auto_49797 ?auto_49795 ) ( ON ?auto_49796 ?auto_49797 ) ( not ( = ?auto_49795 ?auto_49797 ) ) ( not ( = ?auto_49795 ?auto_49796 ) ) ( not ( = ?auto_49795 ?auto_49794 ) ) ( not ( = ?auto_49795 ?auto_49793 ) ) ( not ( = ?auto_49797 ?auto_49796 ) ) ( not ( = ?auto_49797 ?auto_49794 ) ) ( not ( = ?auto_49797 ?auto_49793 ) ) ( not ( = ?auto_49792 ?auto_49795 ) ) ( not ( = ?auto_49792 ?auto_49797 ) ) ( ON ?auto_49792 ?auto_49793 ) ( CLEAR ?auto_49792 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_49795 ?auto_49797 ?auto_49796 ?auto_49794 ?auto_49793 )
      ( MAKE-3PILE ?auto_49792 ?auto_49793 ?auto_49794 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_49801 - BLOCK
      ?auto_49802 - BLOCK
      ?auto_49803 - BLOCK
    )
    :vars
    (
      ?auto_49805 - BLOCK
      ?auto_49804 - BLOCK
      ?auto_49806 - BLOCK
      ?auto_49807 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49801 ?auto_49802 ) ) ( not ( = ?auto_49801 ?auto_49803 ) ) ( not ( = ?auto_49802 ?auto_49803 ) ) ( ON ?auto_49803 ?auto_49805 ) ( not ( = ?auto_49801 ?auto_49805 ) ) ( not ( = ?auto_49802 ?auto_49805 ) ) ( not ( = ?auto_49803 ?auto_49805 ) ) ( ON ?auto_49802 ?auto_49803 ) ( CLEAR ?auto_49802 ) ( ON-TABLE ?auto_49804 ) ( ON ?auto_49806 ?auto_49804 ) ( ON ?auto_49805 ?auto_49806 ) ( not ( = ?auto_49804 ?auto_49806 ) ) ( not ( = ?auto_49804 ?auto_49805 ) ) ( not ( = ?auto_49804 ?auto_49803 ) ) ( not ( = ?auto_49804 ?auto_49802 ) ) ( not ( = ?auto_49806 ?auto_49805 ) ) ( not ( = ?auto_49806 ?auto_49803 ) ) ( not ( = ?auto_49806 ?auto_49802 ) ) ( not ( = ?auto_49801 ?auto_49804 ) ) ( not ( = ?auto_49801 ?auto_49806 ) ) ( ON ?auto_49801 ?auto_49807 ) ( CLEAR ?auto_49801 ) ( HAND-EMPTY ) ( not ( = ?auto_49801 ?auto_49807 ) ) ( not ( = ?auto_49802 ?auto_49807 ) ) ( not ( = ?auto_49803 ?auto_49807 ) ) ( not ( = ?auto_49805 ?auto_49807 ) ) ( not ( = ?auto_49804 ?auto_49807 ) ) ( not ( = ?auto_49806 ?auto_49807 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_49801 ?auto_49807 )
      ( MAKE-3PILE ?auto_49801 ?auto_49802 ?auto_49803 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_49808 - BLOCK
      ?auto_49809 - BLOCK
      ?auto_49810 - BLOCK
    )
    :vars
    (
      ?auto_49811 - BLOCK
      ?auto_49814 - BLOCK
      ?auto_49813 - BLOCK
      ?auto_49812 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49808 ?auto_49809 ) ) ( not ( = ?auto_49808 ?auto_49810 ) ) ( not ( = ?auto_49809 ?auto_49810 ) ) ( ON ?auto_49810 ?auto_49811 ) ( not ( = ?auto_49808 ?auto_49811 ) ) ( not ( = ?auto_49809 ?auto_49811 ) ) ( not ( = ?auto_49810 ?auto_49811 ) ) ( ON-TABLE ?auto_49814 ) ( ON ?auto_49813 ?auto_49814 ) ( ON ?auto_49811 ?auto_49813 ) ( not ( = ?auto_49814 ?auto_49813 ) ) ( not ( = ?auto_49814 ?auto_49811 ) ) ( not ( = ?auto_49814 ?auto_49810 ) ) ( not ( = ?auto_49814 ?auto_49809 ) ) ( not ( = ?auto_49813 ?auto_49811 ) ) ( not ( = ?auto_49813 ?auto_49810 ) ) ( not ( = ?auto_49813 ?auto_49809 ) ) ( not ( = ?auto_49808 ?auto_49814 ) ) ( not ( = ?auto_49808 ?auto_49813 ) ) ( ON ?auto_49808 ?auto_49812 ) ( CLEAR ?auto_49808 ) ( not ( = ?auto_49808 ?auto_49812 ) ) ( not ( = ?auto_49809 ?auto_49812 ) ) ( not ( = ?auto_49810 ?auto_49812 ) ) ( not ( = ?auto_49811 ?auto_49812 ) ) ( not ( = ?auto_49814 ?auto_49812 ) ) ( not ( = ?auto_49813 ?auto_49812 ) ) ( HOLDING ?auto_49809 ) ( CLEAR ?auto_49810 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_49814 ?auto_49813 ?auto_49811 ?auto_49810 ?auto_49809 )
      ( MAKE-3PILE ?auto_49808 ?auto_49809 ?auto_49810 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_49815 - BLOCK
      ?auto_49816 - BLOCK
      ?auto_49817 - BLOCK
    )
    :vars
    (
      ?auto_49818 - BLOCK
      ?auto_49820 - BLOCK
      ?auto_49819 - BLOCK
      ?auto_49821 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49815 ?auto_49816 ) ) ( not ( = ?auto_49815 ?auto_49817 ) ) ( not ( = ?auto_49816 ?auto_49817 ) ) ( ON ?auto_49817 ?auto_49818 ) ( not ( = ?auto_49815 ?auto_49818 ) ) ( not ( = ?auto_49816 ?auto_49818 ) ) ( not ( = ?auto_49817 ?auto_49818 ) ) ( ON-TABLE ?auto_49820 ) ( ON ?auto_49819 ?auto_49820 ) ( ON ?auto_49818 ?auto_49819 ) ( not ( = ?auto_49820 ?auto_49819 ) ) ( not ( = ?auto_49820 ?auto_49818 ) ) ( not ( = ?auto_49820 ?auto_49817 ) ) ( not ( = ?auto_49820 ?auto_49816 ) ) ( not ( = ?auto_49819 ?auto_49818 ) ) ( not ( = ?auto_49819 ?auto_49817 ) ) ( not ( = ?auto_49819 ?auto_49816 ) ) ( not ( = ?auto_49815 ?auto_49820 ) ) ( not ( = ?auto_49815 ?auto_49819 ) ) ( ON ?auto_49815 ?auto_49821 ) ( not ( = ?auto_49815 ?auto_49821 ) ) ( not ( = ?auto_49816 ?auto_49821 ) ) ( not ( = ?auto_49817 ?auto_49821 ) ) ( not ( = ?auto_49818 ?auto_49821 ) ) ( not ( = ?auto_49820 ?auto_49821 ) ) ( not ( = ?auto_49819 ?auto_49821 ) ) ( CLEAR ?auto_49817 ) ( ON ?auto_49816 ?auto_49815 ) ( CLEAR ?auto_49816 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_49821 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_49821 ?auto_49815 )
      ( MAKE-3PILE ?auto_49815 ?auto_49816 ?auto_49817 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_49822 - BLOCK
      ?auto_49823 - BLOCK
      ?auto_49824 - BLOCK
    )
    :vars
    (
      ?auto_49827 - BLOCK
      ?auto_49826 - BLOCK
      ?auto_49828 - BLOCK
      ?auto_49825 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49822 ?auto_49823 ) ) ( not ( = ?auto_49822 ?auto_49824 ) ) ( not ( = ?auto_49823 ?auto_49824 ) ) ( not ( = ?auto_49822 ?auto_49827 ) ) ( not ( = ?auto_49823 ?auto_49827 ) ) ( not ( = ?auto_49824 ?auto_49827 ) ) ( ON-TABLE ?auto_49826 ) ( ON ?auto_49828 ?auto_49826 ) ( ON ?auto_49827 ?auto_49828 ) ( not ( = ?auto_49826 ?auto_49828 ) ) ( not ( = ?auto_49826 ?auto_49827 ) ) ( not ( = ?auto_49826 ?auto_49824 ) ) ( not ( = ?auto_49826 ?auto_49823 ) ) ( not ( = ?auto_49828 ?auto_49827 ) ) ( not ( = ?auto_49828 ?auto_49824 ) ) ( not ( = ?auto_49828 ?auto_49823 ) ) ( not ( = ?auto_49822 ?auto_49826 ) ) ( not ( = ?auto_49822 ?auto_49828 ) ) ( ON ?auto_49822 ?auto_49825 ) ( not ( = ?auto_49822 ?auto_49825 ) ) ( not ( = ?auto_49823 ?auto_49825 ) ) ( not ( = ?auto_49824 ?auto_49825 ) ) ( not ( = ?auto_49827 ?auto_49825 ) ) ( not ( = ?auto_49826 ?auto_49825 ) ) ( not ( = ?auto_49828 ?auto_49825 ) ) ( ON ?auto_49823 ?auto_49822 ) ( CLEAR ?auto_49823 ) ( ON-TABLE ?auto_49825 ) ( HOLDING ?auto_49824 ) ( CLEAR ?auto_49827 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_49826 ?auto_49828 ?auto_49827 ?auto_49824 )
      ( MAKE-3PILE ?auto_49822 ?auto_49823 ?auto_49824 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_49829 - BLOCK
      ?auto_49830 - BLOCK
      ?auto_49831 - BLOCK
    )
    :vars
    (
      ?auto_49835 - BLOCK
      ?auto_49832 - BLOCK
      ?auto_49833 - BLOCK
      ?auto_49834 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49829 ?auto_49830 ) ) ( not ( = ?auto_49829 ?auto_49831 ) ) ( not ( = ?auto_49830 ?auto_49831 ) ) ( not ( = ?auto_49829 ?auto_49835 ) ) ( not ( = ?auto_49830 ?auto_49835 ) ) ( not ( = ?auto_49831 ?auto_49835 ) ) ( ON-TABLE ?auto_49832 ) ( ON ?auto_49833 ?auto_49832 ) ( ON ?auto_49835 ?auto_49833 ) ( not ( = ?auto_49832 ?auto_49833 ) ) ( not ( = ?auto_49832 ?auto_49835 ) ) ( not ( = ?auto_49832 ?auto_49831 ) ) ( not ( = ?auto_49832 ?auto_49830 ) ) ( not ( = ?auto_49833 ?auto_49835 ) ) ( not ( = ?auto_49833 ?auto_49831 ) ) ( not ( = ?auto_49833 ?auto_49830 ) ) ( not ( = ?auto_49829 ?auto_49832 ) ) ( not ( = ?auto_49829 ?auto_49833 ) ) ( ON ?auto_49829 ?auto_49834 ) ( not ( = ?auto_49829 ?auto_49834 ) ) ( not ( = ?auto_49830 ?auto_49834 ) ) ( not ( = ?auto_49831 ?auto_49834 ) ) ( not ( = ?auto_49835 ?auto_49834 ) ) ( not ( = ?auto_49832 ?auto_49834 ) ) ( not ( = ?auto_49833 ?auto_49834 ) ) ( ON ?auto_49830 ?auto_49829 ) ( ON-TABLE ?auto_49834 ) ( CLEAR ?auto_49835 ) ( ON ?auto_49831 ?auto_49830 ) ( CLEAR ?auto_49831 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_49834 ?auto_49829 ?auto_49830 )
      ( MAKE-3PILE ?auto_49829 ?auto_49830 ?auto_49831 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_49836 - BLOCK
      ?auto_49837 - BLOCK
      ?auto_49838 - BLOCK
    )
    :vars
    (
      ?auto_49840 - BLOCK
      ?auto_49842 - BLOCK
      ?auto_49841 - BLOCK
      ?auto_49839 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49836 ?auto_49837 ) ) ( not ( = ?auto_49836 ?auto_49838 ) ) ( not ( = ?auto_49837 ?auto_49838 ) ) ( not ( = ?auto_49836 ?auto_49840 ) ) ( not ( = ?auto_49837 ?auto_49840 ) ) ( not ( = ?auto_49838 ?auto_49840 ) ) ( ON-TABLE ?auto_49842 ) ( ON ?auto_49841 ?auto_49842 ) ( not ( = ?auto_49842 ?auto_49841 ) ) ( not ( = ?auto_49842 ?auto_49840 ) ) ( not ( = ?auto_49842 ?auto_49838 ) ) ( not ( = ?auto_49842 ?auto_49837 ) ) ( not ( = ?auto_49841 ?auto_49840 ) ) ( not ( = ?auto_49841 ?auto_49838 ) ) ( not ( = ?auto_49841 ?auto_49837 ) ) ( not ( = ?auto_49836 ?auto_49842 ) ) ( not ( = ?auto_49836 ?auto_49841 ) ) ( ON ?auto_49836 ?auto_49839 ) ( not ( = ?auto_49836 ?auto_49839 ) ) ( not ( = ?auto_49837 ?auto_49839 ) ) ( not ( = ?auto_49838 ?auto_49839 ) ) ( not ( = ?auto_49840 ?auto_49839 ) ) ( not ( = ?auto_49842 ?auto_49839 ) ) ( not ( = ?auto_49841 ?auto_49839 ) ) ( ON ?auto_49837 ?auto_49836 ) ( ON-TABLE ?auto_49839 ) ( ON ?auto_49838 ?auto_49837 ) ( CLEAR ?auto_49838 ) ( HOLDING ?auto_49840 ) ( CLEAR ?auto_49841 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_49842 ?auto_49841 ?auto_49840 )
      ( MAKE-3PILE ?auto_49836 ?auto_49837 ?auto_49838 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_49843 - BLOCK
      ?auto_49844 - BLOCK
      ?auto_49845 - BLOCK
    )
    :vars
    (
      ?auto_49848 - BLOCK
      ?auto_49846 - BLOCK
      ?auto_49849 - BLOCK
      ?auto_49847 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49843 ?auto_49844 ) ) ( not ( = ?auto_49843 ?auto_49845 ) ) ( not ( = ?auto_49844 ?auto_49845 ) ) ( not ( = ?auto_49843 ?auto_49848 ) ) ( not ( = ?auto_49844 ?auto_49848 ) ) ( not ( = ?auto_49845 ?auto_49848 ) ) ( ON-TABLE ?auto_49846 ) ( ON ?auto_49849 ?auto_49846 ) ( not ( = ?auto_49846 ?auto_49849 ) ) ( not ( = ?auto_49846 ?auto_49848 ) ) ( not ( = ?auto_49846 ?auto_49845 ) ) ( not ( = ?auto_49846 ?auto_49844 ) ) ( not ( = ?auto_49849 ?auto_49848 ) ) ( not ( = ?auto_49849 ?auto_49845 ) ) ( not ( = ?auto_49849 ?auto_49844 ) ) ( not ( = ?auto_49843 ?auto_49846 ) ) ( not ( = ?auto_49843 ?auto_49849 ) ) ( ON ?auto_49843 ?auto_49847 ) ( not ( = ?auto_49843 ?auto_49847 ) ) ( not ( = ?auto_49844 ?auto_49847 ) ) ( not ( = ?auto_49845 ?auto_49847 ) ) ( not ( = ?auto_49848 ?auto_49847 ) ) ( not ( = ?auto_49846 ?auto_49847 ) ) ( not ( = ?auto_49849 ?auto_49847 ) ) ( ON ?auto_49844 ?auto_49843 ) ( ON-TABLE ?auto_49847 ) ( ON ?auto_49845 ?auto_49844 ) ( CLEAR ?auto_49849 ) ( ON ?auto_49848 ?auto_49845 ) ( CLEAR ?auto_49848 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_49847 ?auto_49843 ?auto_49844 ?auto_49845 )
      ( MAKE-3PILE ?auto_49843 ?auto_49844 ?auto_49845 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_49850 - BLOCK
      ?auto_49851 - BLOCK
      ?auto_49852 - BLOCK
    )
    :vars
    (
      ?auto_49853 - BLOCK
      ?auto_49856 - BLOCK
      ?auto_49855 - BLOCK
      ?auto_49854 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49850 ?auto_49851 ) ) ( not ( = ?auto_49850 ?auto_49852 ) ) ( not ( = ?auto_49851 ?auto_49852 ) ) ( not ( = ?auto_49850 ?auto_49853 ) ) ( not ( = ?auto_49851 ?auto_49853 ) ) ( not ( = ?auto_49852 ?auto_49853 ) ) ( ON-TABLE ?auto_49856 ) ( not ( = ?auto_49856 ?auto_49855 ) ) ( not ( = ?auto_49856 ?auto_49853 ) ) ( not ( = ?auto_49856 ?auto_49852 ) ) ( not ( = ?auto_49856 ?auto_49851 ) ) ( not ( = ?auto_49855 ?auto_49853 ) ) ( not ( = ?auto_49855 ?auto_49852 ) ) ( not ( = ?auto_49855 ?auto_49851 ) ) ( not ( = ?auto_49850 ?auto_49856 ) ) ( not ( = ?auto_49850 ?auto_49855 ) ) ( ON ?auto_49850 ?auto_49854 ) ( not ( = ?auto_49850 ?auto_49854 ) ) ( not ( = ?auto_49851 ?auto_49854 ) ) ( not ( = ?auto_49852 ?auto_49854 ) ) ( not ( = ?auto_49853 ?auto_49854 ) ) ( not ( = ?auto_49856 ?auto_49854 ) ) ( not ( = ?auto_49855 ?auto_49854 ) ) ( ON ?auto_49851 ?auto_49850 ) ( ON-TABLE ?auto_49854 ) ( ON ?auto_49852 ?auto_49851 ) ( ON ?auto_49853 ?auto_49852 ) ( CLEAR ?auto_49853 ) ( HOLDING ?auto_49855 ) ( CLEAR ?auto_49856 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_49856 ?auto_49855 )
      ( MAKE-3PILE ?auto_49850 ?auto_49851 ?auto_49852 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_49857 - BLOCK
      ?auto_49858 - BLOCK
      ?auto_49859 - BLOCK
    )
    :vars
    (
      ?auto_49862 - BLOCK
      ?auto_49861 - BLOCK
      ?auto_49860 - BLOCK
      ?auto_49863 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49857 ?auto_49858 ) ) ( not ( = ?auto_49857 ?auto_49859 ) ) ( not ( = ?auto_49858 ?auto_49859 ) ) ( not ( = ?auto_49857 ?auto_49862 ) ) ( not ( = ?auto_49858 ?auto_49862 ) ) ( not ( = ?auto_49859 ?auto_49862 ) ) ( ON-TABLE ?auto_49861 ) ( not ( = ?auto_49861 ?auto_49860 ) ) ( not ( = ?auto_49861 ?auto_49862 ) ) ( not ( = ?auto_49861 ?auto_49859 ) ) ( not ( = ?auto_49861 ?auto_49858 ) ) ( not ( = ?auto_49860 ?auto_49862 ) ) ( not ( = ?auto_49860 ?auto_49859 ) ) ( not ( = ?auto_49860 ?auto_49858 ) ) ( not ( = ?auto_49857 ?auto_49861 ) ) ( not ( = ?auto_49857 ?auto_49860 ) ) ( ON ?auto_49857 ?auto_49863 ) ( not ( = ?auto_49857 ?auto_49863 ) ) ( not ( = ?auto_49858 ?auto_49863 ) ) ( not ( = ?auto_49859 ?auto_49863 ) ) ( not ( = ?auto_49862 ?auto_49863 ) ) ( not ( = ?auto_49861 ?auto_49863 ) ) ( not ( = ?auto_49860 ?auto_49863 ) ) ( ON ?auto_49858 ?auto_49857 ) ( ON-TABLE ?auto_49863 ) ( ON ?auto_49859 ?auto_49858 ) ( ON ?auto_49862 ?auto_49859 ) ( CLEAR ?auto_49861 ) ( ON ?auto_49860 ?auto_49862 ) ( CLEAR ?auto_49860 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_49863 ?auto_49857 ?auto_49858 ?auto_49859 ?auto_49862 )
      ( MAKE-3PILE ?auto_49857 ?auto_49858 ?auto_49859 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_49864 - BLOCK
      ?auto_49865 - BLOCK
      ?auto_49866 - BLOCK
    )
    :vars
    (
      ?auto_49868 - BLOCK
      ?auto_49869 - BLOCK
      ?auto_49870 - BLOCK
      ?auto_49867 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49864 ?auto_49865 ) ) ( not ( = ?auto_49864 ?auto_49866 ) ) ( not ( = ?auto_49865 ?auto_49866 ) ) ( not ( = ?auto_49864 ?auto_49868 ) ) ( not ( = ?auto_49865 ?auto_49868 ) ) ( not ( = ?auto_49866 ?auto_49868 ) ) ( not ( = ?auto_49869 ?auto_49870 ) ) ( not ( = ?auto_49869 ?auto_49868 ) ) ( not ( = ?auto_49869 ?auto_49866 ) ) ( not ( = ?auto_49869 ?auto_49865 ) ) ( not ( = ?auto_49870 ?auto_49868 ) ) ( not ( = ?auto_49870 ?auto_49866 ) ) ( not ( = ?auto_49870 ?auto_49865 ) ) ( not ( = ?auto_49864 ?auto_49869 ) ) ( not ( = ?auto_49864 ?auto_49870 ) ) ( ON ?auto_49864 ?auto_49867 ) ( not ( = ?auto_49864 ?auto_49867 ) ) ( not ( = ?auto_49865 ?auto_49867 ) ) ( not ( = ?auto_49866 ?auto_49867 ) ) ( not ( = ?auto_49868 ?auto_49867 ) ) ( not ( = ?auto_49869 ?auto_49867 ) ) ( not ( = ?auto_49870 ?auto_49867 ) ) ( ON ?auto_49865 ?auto_49864 ) ( ON-TABLE ?auto_49867 ) ( ON ?auto_49866 ?auto_49865 ) ( ON ?auto_49868 ?auto_49866 ) ( ON ?auto_49870 ?auto_49868 ) ( CLEAR ?auto_49870 ) ( HOLDING ?auto_49869 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_49869 )
      ( MAKE-3PILE ?auto_49864 ?auto_49865 ?auto_49866 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_49871 - BLOCK
      ?auto_49872 - BLOCK
      ?auto_49873 - BLOCK
    )
    :vars
    (
      ?auto_49876 - BLOCK
      ?auto_49877 - BLOCK
      ?auto_49875 - BLOCK
      ?auto_49874 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49871 ?auto_49872 ) ) ( not ( = ?auto_49871 ?auto_49873 ) ) ( not ( = ?auto_49872 ?auto_49873 ) ) ( not ( = ?auto_49871 ?auto_49876 ) ) ( not ( = ?auto_49872 ?auto_49876 ) ) ( not ( = ?auto_49873 ?auto_49876 ) ) ( not ( = ?auto_49877 ?auto_49875 ) ) ( not ( = ?auto_49877 ?auto_49876 ) ) ( not ( = ?auto_49877 ?auto_49873 ) ) ( not ( = ?auto_49877 ?auto_49872 ) ) ( not ( = ?auto_49875 ?auto_49876 ) ) ( not ( = ?auto_49875 ?auto_49873 ) ) ( not ( = ?auto_49875 ?auto_49872 ) ) ( not ( = ?auto_49871 ?auto_49877 ) ) ( not ( = ?auto_49871 ?auto_49875 ) ) ( ON ?auto_49871 ?auto_49874 ) ( not ( = ?auto_49871 ?auto_49874 ) ) ( not ( = ?auto_49872 ?auto_49874 ) ) ( not ( = ?auto_49873 ?auto_49874 ) ) ( not ( = ?auto_49876 ?auto_49874 ) ) ( not ( = ?auto_49877 ?auto_49874 ) ) ( not ( = ?auto_49875 ?auto_49874 ) ) ( ON ?auto_49872 ?auto_49871 ) ( ON-TABLE ?auto_49874 ) ( ON ?auto_49873 ?auto_49872 ) ( ON ?auto_49876 ?auto_49873 ) ( ON ?auto_49875 ?auto_49876 ) ( ON ?auto_49877 ?auto_49875 ) ( CLEAR ?auto_49877 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_49874 ?auto_49871 ?auto_49872 ?auto_49873 ?auto_49876 ?auto_49875 )
      ( MAKE-3PILE ?auto_49871 ?auto_49872 ?auto_49873 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_49893 - BLOCK
      ?auto_49894 - BLOCK
    )
    :vars
    (
      ?auto_49896 - BLOCK
      ?auto_49895 - BLOCK
      ?auto_49897 - BLOCK
      ?auto_49898 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49896 ?auto_49894 ) ( ON-TABLE ?auto_49893 ) ( ON ?auto_49894 ?auto_49893 ) ( not ( = ?auto_49893 ?auto_49894 ) ) ( not ( = ?auto_49893 ?auto_49896 ) ) ( not ( = ?auto_49894 ?auto_49896 ) ) ( not ( = ?auto_49893 ?auto_49895 ) ) ( not ( = ?auto_49893 ?auto_49897 ) ) ( not ( = ?auto_49894 ?auto_49895 ) ) ( not ( = ?auto_49894 ?auto_49897 ) ) ( not ( = ?auto_49896 ?auto_49895 ) ) ( not ( = ?auto_49896 ?auto_49897 ) ) ( not ( = ?auto_49895 ?auto_49897 ) ) ( ON ?auto_49895 ?auto_49896 ) ( CLEAR ?auto_49895 ) ( HOLDING ?auto_49897 ) ( CLEAR ?auto_49898 ) ( ON-TABLE ?auto_49898 ) ( not ( = ?auto_49898 ?auto_49897 ) ) ( not ( = ?auto_49893 ?auto_49898 ) ) ( not ( = ?auto_49894 ?auto_49898 ) ) ( not ( = ?auto_49896 ?auto_49898 ) ) ( not ( = ?auto_49895 ?auto_49898 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_49898 ?auto_49897 )
      ( MAKE-2PILE ?auto_49893 ?auto_49894 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_49899 - BLOCK
      ?auto_49900 - BLOCK
    )
    :vars
    (
      ?auto_49901 - BLOCK
      ?auto_49903 - BLOCK
      ?auto_49902 - BLOCK
      ?auto_49904 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49901 ?auto_49900 ) ( ON-TABLE ?auto_49899 ) ( ON ?auto_49900 ?auto_49899 ) ( not ( = ?auto_49899 ?auto_49900 ) ) ( not ( = ?auto_49899 ?auto_49901 ) ) ( not ( = ?auto_49900 ?auto_49901 ) ) ( not ( = ?auto_49899 ?auto_49903 ) ) ( not ( = ?auto_49899 ?auto_49902 ) ) ( not ( = ?auto_49900 ?auto_49903 ) ) ( not ( = ?auto_49900 ?auto_49902 ) ) ( not ( = ?auto_49901 ?auto_49903 ) ) ( not ( = ?auto_49901 ?auto_49902 ) ) ( not ( = ?auto_49903 ?auto_49902 ) ) ( ON ?auto_49903 ?auto_49901 ) ( CLEAR ?auto_49904 ) ( ON-TABLE ?auto_49904 ) ( not ( = ?auto_49904 ?auto_49902 ) ) ( not ( = ?auto_49899 ?auto_49904 ) ) ( not ( = ?auto_49900 ?auto_49904 ) ) ( not ( = ?auto_49901 ?auto_49904 ) ) ( not ( = ?auto_49903 ?auto_49904 ) ) ( ON ?auto_49902 ?auto_49903 ) ( CLEAR ?auto_49902 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_49899 ?auto_49900 ?auto_49901 ?auto_49903 )
      ( MAKE-2PILE ?auto_49899 ?auto_49900 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_49905 - BLOCK
      ?auto_49906 - BLOCK
    )
    :vars
    (
      ?auto_49907 - BLOCK
      ?auto_49909 - BLOCK
      ?auto_49908 - BLOCK
      ?auto_49910 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49907 ?auto_49906 ) ( ON-TABLE ?auto_49905 ) ( ON ?auto_49906 ?auto_49905 ) ( not ( = ?auto_49905 ?auto_49906 ) ) ( not ( = ?auto_49905 ?auto_49907 ) ) ( not ( = ?auto_49906 ?auto_49907 ) ) ( not ( = ?auto_49905 ?auto_49909 ) ) ( not ( = ?auto_49905 ?auto_49908 ) ) ( not ( = ?auto_49906 ?auto_49909 ) ) ( not ( = ?auto_49906 ?auto_49908 ) ) ( not ( = ?auto_49907 ?auto_49909 ) ) ( not ( = ?auto_49907 ?auto_49908 ) ) ( not ( = ?auto_49909 ?auto_49908 ) ) ( ON ?auto_49909 ?auto_49907 ) ( not ( = ?auto_49910 ?auto_49908 ) ) ( not ( = ?auto_49905 ?auto_49910 ) ) ( not ( = ?auto_49906 ?auto_49910 ) ) ( not ( = ?auto_49907 ?auto_49910 ) ) ( not ( = ?auto_49909 ?auto_49910 ) ) ( ON ?auto_49908 ?auto_49909 ) ( CLEAR ?auto_49908 ) ( HOLDING ?auto_49910 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_49910 )
      ( MAKE-2PILE ?auto_49905 ?auto_49906 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_49919 - BLOCK
      ?auto_49920 - BLOCK
    )
    :vars
    (
      ?auto_49922 - BLOCK
      ?auto_49923 - BLOCK
      ?auto_49924 - BLOCK
      ?auto_49921 - BLOCK
      ?auto_49925 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49922 ?auto_49920 ) ( ON-TABLE ?auto_49919 ) ( ON ?auto_49920 ?auto_49919 ) ( not ( = ?auto_49919 ?auto_49920 ) ) ( not ( = ?auto_49919 ?auto_49922 ) ) ( not ( = ?auto_49920 ?auto_49922 ) ) ( not ( = ?auto_49919 ?auto_49923 ) ) ( not ( = ?auto_49919 ?auto_49924 ) ) ( not ( = ?auto_49920 ?auto_49923 ) ) ( not ( = ?auto_49920 ?auto_49924 ) ) ( not ( = ?auto_49922 ?auto_49923 ) ) ( not ( = ?auto_49922 ?auto_49924 ) ) ( not ( = ?auto_49923 ?auto_49924 ) ) ( ON ?auto_49923 ?auto_49922 ) ( not ( = ?auto_49921 ?auto_49924 ) ) ( not ( = ?auto_49919 ?auto_49921 ) ) ( not ( = ?auto_49920 ?auto_49921 ) ) ( not ( = ?auto_49922 ?auto_49921 ) ) ( not ( = ?auto_49923 ?auto_49921 ) ) ( ON ?auto_49924 ?auto_49923 ) ( CLEAR ?auto_49924 ) ( ON ?auto_49921 ?auto_49925 ) ( CLEAR ?auto_49921 ) ( HAND-EMPTY ) ( not ( = ?auto_49919 ?auto_49925 ) ) ( not ( = ?auto_49920 ?auto_49925 ) ) ( not ( = ?auto_49922 ?auto_49925 ) ) ( not ( = ?auto_49923 ?auto_49925 ) ) ( not ( = ?auto_49924 ?auto_49925 ) ) ( not ( = ?auto_49921 ?auto_49925 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_49921 ?auto_49925 )
      ( MAKE-2PILE ?auto_49919 ?auto_49920 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_49926 - BLOCK
      ?auto_49927 - BLOCK
    )
    :vars
    (
      ?auto_49929 - BLOCK
      ?auto_49928 - BLOCK
      ?auto_49932 - BLOCK
      ?auto_49930 - BLOCK
      ?auto_49931 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49929 ?auto_49927 ) ( ON-TABLE ?auto_49926 ) ( ON ?auto_49927 ?auto_49926 ) ( not ( = ?auto_49926 ?auto_49927 ) ) ( not ( = ?auto_49926 ?auto_49929 ) ) ( not ( = ?auto_49927 ?auto_49929 ) ) ( not ( = ?auto_49926 ?auto_49928 ) ) ( not ( = ?auto_49926 ?auto_49932 ) ) ( not ( = ?auto_49927 ?auto_49928 ) ) ( not ( = ?auto_49927 ?auto_49932 ) ) ( not ( = ?auto_49929 ?auto_49928 ) ) ( not ( = ?auto_49929 ?auto_49932 ) ) ( not ( = ?auto_49928 ?auto_49932 ) ) ( ON ?auto_49928 ?auto_49929 ) ( not ( = ?auto_49930 ?auto_49932 ) ) ( not ( = ?auto_49926 ?auto_49930 ) ) ( not ( = ?auto_49927 ?auto_49930 ) ) ( not ( = ?auto_49929 ?auto_49930 ) ) ( not ( = ?auto_49928 ?auto_49930 ) ) ( ON ?auto_49930 ?auto_49931 ) ( CLEAR ?auto_49930 ) ( not ( = ?auto_49926 ?auto_49931 ) ) ( not ( = ?auto_49927 ?auto_49931 ) ) ( not ( = ?auto_49929 ?auto_49931 ) ) ( not ( = ?auto_49928 ?auto_49931 ) ) ( not ( = ?auto_49932 ?auto_49931 ) ) ( not ( = ?auto_49930 ?auto_49931 ) ) ( HOLDING ?auto_49932 ) ( CLEAR ?auto_49928 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_49926 ?auto_49927 ?auto_49929 ?auto_49928 ?auto_49932 )
      ( MAKE-2PILE ?auto_49926 ?auto_49927 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_49972 - BLOCK
      ?auto_49973 - BLOCK
      ?auto_49974 - BLOCK
      ?auto_49975 - BLOCK
    )
    :vars
    (
      ?auto_49976 - BLOCK
      ?auto_49977 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_49972 ) ( ON ?auto_49973 ?auto_49972 ) ( not ( = ?auto_49972 ?auto_49973 ) ) ( not ( = ?auto_49972 ?auto_49974 ) ) ( not ( = ?auto_49972 ?auto_49975 ) ) ( not ( = ?auto_49973 ?auto_49974 ) ) ( not ( = ?auto_49973 ?auto_49975 ) ) ( not ( = ?auto_49974 ?auto_49975 ) ) ( ON ?auto_49975 ?auto_49976 ) ( not ( = ?auto_49972 ?auto_49976 ) ) ( not ( = ?auto_49973 ?auto_49976 ) ) ( not ( = ?auto_49974 ?auto_49976 ) ) ( not ( = ?auto_49975 ?auto_49976 ) ) ( CLEAR ?auto_49973 ) ( ON ?auto_49974 ?auto_49975 ) ( CLEAR ?auto_49974 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_49977 ) ( ON ?auto_49976 ?auto_49977 ) ( not ( = ?auto_49977 ?auto_49976 ) ) ( not ( = ?auto_49977 ?auto_49975 ) ) ( not ( = ?auto_49977 ?auto_49974 ) ) ( not ( = ?auto_49972 ?auto_49977 ) ) ( not ( = ?auto_49973 ?auto_49977 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_49977 ?auto_49976 ?auto_49975 )
      ( MAKE-4PILE ?auto_49972 ?auto_49973 ?auto_49974 ?auto_49975 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_49978 - BLOCK
      ?auto_49979 - BLOCK
      ?auto_49980 - BLOCK
      ?auto_49981 - BLOCK
    )
    :vars
    (
      ?auto_49983 - BLOCK
      ?auto_49982 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_49978 ) ( not ( = ?auto_49978 ?auto_49979 ) ) ( not ( = ?auto_49978 ?auto_49980 ) ) ( not ( = ?auto_49978 ?auto_49981 ) ) ( not ( = ?auto_49979 ?auto_49980 ) ) ( not ( = ?auto_49979 ?auto_49981 ) ) ( not ( = ?auto_49980 ?auto_49981 ) ) ( ON ?auto_49981 ?auto_49983 ) ( not ( = ?auto_49978 ?auto_49983 ) ) ( not ( = ?auto_49979 ?auto_49983 ) ) ( not ( = ?auto_49980 ?auto_49983 ) ) ( not ( = ?auto_49981 ?auto_49983 ) ) ( ON ?auto_49980 ?auto_49981 ) ( CLEAR ?auto_49980 ) ( ON-TABLE ?auto_49982 ) ( ON ?auto_49983 ?auto_49982 ) ( not ( = ?auto_49982 ?auto_49983 ) ) ( not ( = ?auto_49982 ?auto_49981 ) ) ( not ( = ?auto_49982 ?auto_49980 ) ) ( not ( = ?auto_49978 ?auto_49982 ) ) ( not ( = ?auto_49979 ?auto_49982 ) ) ( HOLDING ?auto_49979 ) ( CLEAR ?auto_49978 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_49978 ?auto_49979 )
      ( MAKE-4PILE ?auto_49978 ?auto_49979 ?auto_49980 ?auto_49981 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_49984 - BLOCK
      ?auto_49985 - BLOCK
      ?auto_49986 - BLOCK
      ?auto_49987 - BLOCK
    )
    :vars
    (
      ?auto_49989 - BLOCK
      ?auto_49988 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_49984 ) ( not ( = ?auto_49984 ?auto_49985 ) ) ( not ( = ?auto_49984 ?auto_49986 ) ) ( not ( = ?auto_49984 ?auto_49987 ) ) ( not ( = ?auto_49985 ?auto_49986 ) ) ( not ( = ?auto_49985 ?auto_49987 ) ) ( not ( = ?auto_49986 ?auto_49987 ) ) ( ON ?auto_49987 ?auto_49989 ) ( not ( = ?auto_49984 ?auto_49989 ) ) ( not ( = ?auto_49985 ?auto_49989 ) ) ( not ( = ?auto_49986 ?auto_49989 ) ) ( not ( = ?auto_49987 ?auto_49989 ) ) ( ON ?auto_49986 ?auto_49987 ) ( ON-TABLE ?auto_49988 ) ( ON ?auto_49989 ?auto_49988 ) ( not ( = ?auto_49988 ?auto_49989 ) ) ( not ( = ?auto_49988 ?auto_49987 ) ) ( not ( = ?auto_49988 ?auto_49986 ) ) ( not ( = ?auto_49984 ?auto_49988 ) ) ( not ( = ?auto_49985 ?auto_49988 ) ) ( CLEAR ?auto_49984 ) ( ON ?auto_49985 ?auto_49986 ) ( CLEAR ?auto_49985 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_49988 ?auto_49989 ?auto_49987 ?auto_49986 )
      ( MAKE-4PILE ?auto_49984 ?auto_49985 ?auto_49986 ?auto_49987 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_49990 - BLOCK
      ?auto_49991 - BLOCK
      ?auto_49992 - BLOCK
      ?auto_49993 - BLOCK
    )
    :vars
    (
      ?auto_49995 - BLOCK
      ?auto_49994 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49990 ?auto_49991 ) ) ( not ( = ?auto_49990 ?auto_49992 ) ) ( not ( = ?auto_49990 ?auto_49993 ) ) ( not ( = ?auto_49991 ?auto_49992 ) ) ( not ( = ?auto_49991 ?auto_49993 ) ) ( not ( = ?auto_49992 ?auto_49993 ) ) ( ON ?auto_49993 ?auto_49995 ) ( not ( = ?auto_49990 ?auto_49995 ) ) ( not ( = ?auto_49991 ?auto_49995 ) ) ( not ( = ?auto_49992 ?auto_49995 ) ) ( not ( = ?auto_49993 ?auto_49995 ) ) ( ON ?auto_49992 ?auto_49993 ) ( ON-TABLE ?auto_49994 ) ( ON ?auto_49995 ?auto_49994 ) ( not ( = ?auto_49994 ?auto_49995 ) ) ( not ( = ?auto_49994 ?auto_49993 ) ) ( not ( = ?auto_49994 ?auto_49992 ) ) ( not ( = ?auto_49990 ?auto_49994 ) ) ( not ( = ?auto_49991 ?auto_49994 ) ) ( ON ?auto_49991 ?auto_49992 ) ( CLEAR ?auto_49991 ) ( HOLDING ?auto_49990 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_49990 )
      ( MAKE-4PILE ?auto_49990 ?auto_49991 ?auto_49992 ?auto_49993 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_49996 - BLOCK
      ?auto_49997 - BLOCK
      ?auto_49998 - BLOCK
      ?auto_49999 - BLOCK
    )
    :vars
    (
      ?auto_50001 - BLOCK
      ?auto_50000 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49996 ?auto_49997 ) ) ( not ( = ?auto_49996 ?auto_49998 ) ) ( not ( = ?auto_49996 ?auto_49999 ) ) ( not ( = ?auto_49997 ?auto_49998 ) ) ( not ( = ?auto_49997 ?auto_49999 ) ) ( not ( = ?auto_49998 ?auto_49999 ) ) ( ON ?auto_49999 ?auto_50001 ) ( not ( = ?auto_49996 ?auto_50001 ) ) ( not ( = ?auto_49997 ?auto_50001 ) ) ( not ( = ?auto_49998 ?auto_50001 ) ) ( not ( = ?auto_49999 ?auto_50001 ) ) ( ON ?auto_49998 ?auto_49999 ) ( ON-TABLE ?auto_50000 ) ( ON ?auto_50001 ?auto_50000 ) ( not ( = ?auto_50000 ?auto_50001 ) ) ( not ( = ?auto_50000 ?auto_49999 ) ) ( not ( = ?auto_50000 ?auto_49998 ) ) ( not ( = ?auto_49996 ?auto_50000 ) ) ( not ( = ?auto_49997 ?auto_50000 ) ) ( ON ?auto_49997 ?auto_49998 ) ( ON ?auto_49996 ?auto_49997 ) ( CLEAR ?auto_49996 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_50000 ?auto_50001 ?auto_49999 ?auto_49998 ?auto_49997 )
      ( MAKE-4PILE ?auto_49996 ?auto_49997 ?auto_49998 ?auto_49999 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_50006 - BLOCK
      ?auto_50007 - BLOCK
      ?auto_50008 - BLOCK
      ?auto_50009 - BLOCK
    )
    :vars
    (
      ?auto_50010 - BLOCK
      ?auto_50011 - BLOCK
      ?auto_50012 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50006 ?auto_50007 ) ) ( not ( = ?auto_50006 ?auto_50008 ) ) ( not ( = ?auto_50006 ?auto_50009 ) ) ( not ( = ?auto_50007 ?auto_50008 ) ) ( not ( = ?auto_50007 ?auto_50009 ) ) ( not ( = ?auto_50008 ?auto_50009 ) ) ( ON ?auto_50009 ?auto_50010 ) ( not ( = ?auto_50006 ?auto_50010 ) ) ( not ( = ?auto_50007 ?auto_50010 ) ) ( not ( = ?auto_50008 ?auto_50010 ) ) ( not ( = ?auto_50009 ?auto_50010 ) ) ( ON ?auto_50008 ?auto_50009 ) ( ON-TABLE ?auto_50011 ) ( ON ?auto_50010 ?auto_50011 ) ( not ( = ?auto_50011 ?auto_50010 ) ) ( not ( = ?auto_50011 ?auto_50009 ) ) ( not ( = ?auto_50011 ?auto_50008 ) ) ( not ( = ?auto_50006 ?auto_50011 ) ) ( not ( = ?auto_50007 ?auto_50011 ) ) ( ON ?auto_50007 ?auto_50008 ) ( CLEAR ?auto_50007 ) ( ON ?auto_50006 ?auto_50012 ) ( CLEAR ?auto_50006 ) ( HAND-EMPTY ) ( not ( = ?auto_50006 ?auto_50012 ) ) ( not ( = ?auto_50007 ?auto_50012 ) ) ( not ( = ?auto_50008 ?auto_50012 ) ) ( not ( = ?auto_50009 ?auto_50012 ) ) ( not ( = ?auto_50010 ?auto_50012 ) ) ( not ( = ?auto_50011 ?auto_50012 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_50006 ?auto_50012 )
      ( MAKE-4PILE ?auto_50006 ?auto_50007 ?auto_50008 ?auto_50009 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_50013 - BLOCK
      ?auto_50014 - BLOCK
      ?auto_50015 - BLOCK
      ?auto_50016 - BLOCK
    )
    :vars
    (
      ?auto_50019 - BLOCK
      ?auto_50017 - BLOCK
      ?auto_50018 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50013 ?auto_50014 ) ) ( not ( = ?auto_50013 ?auto_50015 ) ) ( not ( = ?auto_50013 ?auto_50016 ) ) ( not ( = ?auto_50014 ?auto_50015 ) ) ( not ( = ?auto_50014 ?auto_50016 ) ) ( not ( = ?auto_50015 ?auto_50016 ) ) ( ON ?auto_50016 ?auto_50019 ) ( not ( = ?auto_50013 ?auto_50019 ) ) ( not ( = ?auto_50014 ?auto_50019 ) ) ( not ( = ?auto_50015 ?auto_50019 ) ) ( not ( = ?auto_50016 ?auto_50019 ) ) ( ON ?auto_50015 ?auto_50016 ) ( ON-TABLE ?auto_50017 ) ( ON ?auto_50019 ?auto_50017 ) ( not ( = ?auto_50017 ?auto_50019 ) ) ( not ( = ?auto_50017 ?auto_50016 ) ) ( not ( = ?auto_50017 ?auto_50015 ) ) ( not ( = ?auto_50013 ?auto_50017 ) ) ( not ( = ?auto_50014 ?auto_50017 ) ) ( ON ?auto_50013 ?auto_50018 ) ( CLEAR ?auto_50013 ) ( not ( = ?auto_50013 ?auto_50018 ) ) ( not ( = ?auto_50014 ?auto_50018 ) ) ( not ( = ?auto_50015 ?auto_50018 ) ) ( not ( = ?auto_50016 ?auto_50018 ) ) ( not ( = ?auto_50019 ?auto_50018 ) ) ( not ( = ?auto_50017 ?auto_50018 ) ) ( HOLDING ?auto_50014 ) ( CLEAR ?auto_50015 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_50017 ?auto_50019 ?auto_50016 ?auto_50015 ?auto_50014 )
      ( MAKE-4PILE ?auto_50013 ?auto_50014 ?auto_50015 ?auto_50016 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_50020 - BLOCK
      ?auto_50021 - BLOCK
      ?auto_50022 - BLOCK
      ?auto_50023 - BLOCK
    )
    :vars
    (
      ?auto_50025 - BLOCK
      ?auto_50024 - BLOCK
      ?auto_50026 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50020 ?auto_50021 ) ) ( not ( = ?auto_50020 ?auto_50022 ) ) ( not ( = ?auto_50020 ?auto_50023 ) ) ( not ( = ?auto_50021 ?auto_50022 ) ) ( not ( = ?auto_50021 ?auto_50023 ) ) ( not ( = ?auto_50022 ?auto_50023 ) ) ( ON ?auto_50023 ?auto_50025 ) ( not ( = ?auto_50020 ?auto_50025 ) ) ( not ( = ?auto_50021 ?auto_50025 ) ) ( not ( = ?auto_50022 ?auto_50025 ) ) ( not ( = ?auto_50023 ?auto_50025 ) ) ( ON ?auto_50022 ?auto_50023 ) ( ON-TABLE ?auto_50024 ) ( ON ?auto_50025 ?auto_50024 ) ( not ( = ?auto_50024 ?auto_50025 ) ) ( not ( = ?auto_50024 ?auto_50023 ) ) ( not ( = ?auto_50024 ?auto_50022 ) ) ( not ( = ?auto_50020 ?auto_50024 ) ) ( not ( = ?auto_50021 ?auto_50024 ) ) ( ON ?auto_50020 ?auto_50026 ) ( not ( = ?auto_50020 ?auto_50026 ) ) ( not ( = ?auto_50021 ?auto_50026 ) ) ( not ( = ?auto_50022 ?auto_50026 ) ) ( not ( = ?auto_50023 ?auto_50026 ) ) ( not ( = ?auto_50025 ?auto_50026 ) ) ( not ( = ?auto_50024 ?auto_50026 ) ) ( CLEAR ?auto_50022 ) ( ON ?auto_50021 ?auto_50020 ) ( CLEAR ?auto_50021 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_50026 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_50026 ?auto_50020 )
      ( MAKE-4PILE ?auto_50020 ?auto_50021 ?auto_50022 ?auto_50023 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_50027 - BLOCK
      ?auto_50028 - BLOCK
      ?auto_50029 - BLOCK
      ?auto_50030 - BLOCK
    )
    :vars
    (
      ?auto_50033 - BLOCK
      ?auto_50032 - BLOCK
      ?auto_50031 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50027 ?auto_50028 ) ) ( not ( = ?auto_50027 ?auto_50029 ) ) ( not ( = ?auto_50027 ?auto_50030 ) ) ( not ( = ?auto_50028 ?auto_50029 ) ) ( not ( = ?auto_50028 ?auto_50030 ) ) ( not ( = ?auto_50029 ?auto_50030 ) ) ( ON ?auto_50030 ?auto_50033 ) ( not ( = ?auto_50027 ?auto_50033 ) ) ( not ( = ?auto_50028 ?auto_50033 ) ) ( not ( = ?auto_50029 ?auto_50033 ) ) ( not ( = ?auto_50030 ?auto_50033 ) ) ( ON-TABLE ?auto_50032 ) ( ON ?auto_50033 ?auto_50032 ) ( not ( = ?auto_50032 ?auto_50033 ) ) ( not ( = ?auto_50032 ?auto_50030 ) ) ( not ( = ?auto_50032 ?auto_50029 ) ) ( not ( = ?auto_50027 ?auto_50032 ) ) ( not ( = ?auto_50028 ?auto_50032 ) ) ( ON ?auto_50027 ?auto_50031 ) ( not ( = ?auto_50027 ?auto_50031 ) ) ( not ( = ?auto_50028 ?auto_50031 ) ) ( not ( = ?auto_50029 ?auto_50031 ) ) ( not ( = ?auto_50030 ?auto_50031 ) ) ( not ( = ?auto_50033 ?auto_50031 ) ) ( not ( = ?auto_50032 ?auto_50031 ) ) ( ON ?auto_50028 ?auto_50027 ) ( CLEAR ?auto_50028 ) ( ON-TABLE ?auto_50031 ) ( HOLDING ?auto_50029 ) ( CLEAR ?auto_50030 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_50032 ?auto_50033 ?auto_50030 ?auto_50029 )
      ( MAKE-4PILE ?auto_50027 ?auto_50028 ?auto_50029 ?auto_50030 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_50034 - BLOCK
      ?auto_50035 - BLOCK
      ?auto_50036 - BLOCK
      ?auto_50037 - BLOCK
    )
    :vars
    (
      ?auto_50040 - BLOCK
      ?auto_50038 - BLOCK
      ?auto_50039 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50034 ?auto_50035 ) ) ( not ( = ?auto_50034 ?auto_50036 ) ) ( not ( = ?auto_50034 ?auto_50037 ) ) ( not ( = ?auto_50035 ?auto_50036 ) ) ( not ( = ?auto_50035 ?auto_50037 ) ) ( not ( = ?auto_50036 ?auto_50037 ) ) ( ON ?auto_50037 ?auto_50040 ) ( not ( = ?auto_50034 ?auto_50040 ) ) ( not ( = ?auto_50035 ?auto_50040 ) ) ( not ( = ?auto_50036 ?auto_50040 ) ) ( not ( = ?auto_50037 ?auto_50040 ) ) ( ON-TABLE ?auto_50038 ) ( ON ?auto_50040 ?auto_50038 ) ( not ( = ?auto_50038 ?auto_50040 ) ) ( not ( = ?auto_50038 ?auto_50037 ) ) ( not ( = ?auto_50038 ?auto_50036 ) ) ( not ( = ?auto_50034 ?auto_50038 ) ) ( not ( = ?auto_50035 ?auto_50038 ) ) ( ON ?auto_50034 ?auto_50039 ) ( not ( = ?auto_50034 ?auto_50039 ) ) ( not ( = ?auto_50035 ?auto_50039 ) ) ( not ( = ?auto_50036 ?auto_50039 ) ) ( not ( = ?auto_50037 ?auto_50039 ) ) ( not ( = ?auto_50040 ?auto_50039 ) ) ( not ( = ?auto_50038 ?auto_50039 ) ) ( ON ?auto_50035 ?auto_50034 ) ( ON-TABLE ?auto_50039 ) ( CLEAR ?auto_50037 ) ( ON ?auto_50036 ?auto_50035 ) ( CLEAR ?auto_50036 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_50039 ?auto_50034 ?auto_50035 )
      ( MAKE-4PILE ?auto_50034 ?auto_50035 ?auto_50036 ?auto_50037 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_50041 - BLOCK
      ?auto_50042 - BLOCK
      ?auto_50043 - BLOCK
      ?auto_50044 - BLOCK
    )
    :vars
    (
      ?auto_50047 - BLOCK
      ?auto_50045 - BLOCK
      ?auto_50046 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50041 ?auto_50042 ) ) ( not ( = ?auto_50041 ?auto_50043 ) ) ( not ( = ?auto_50041 ?auto_50044 ) ) ( not ( = ?auto_50042 ?auto_50043 ) ) ( not ( = ?auto_50042 ?auto_50044 ) ) ( not ( = ?auto_50043 ?auto_50044 ) ) ( not ( = ?auto_50041 ?auto_50047 ) ) ( not ( = ?auto_50042 ?auto_50047 ) ) ( not ( = ?auto_50043 ?auto_50047 ) ) ( not ( = ?auto_50044 ?auto_50047 ) ) ( ON-TABLE ?auto_50045 ) ( ON ?auto_50047 ?auto_50045 ) ( not ( = ?auto_50045 ?auto_50047 ) ) ( not ( = ?auto_50045 ?auto_50044 ) ) ( not ( = ?auto_50045 ?auto_50043 ) ) ( not ( = ?auto_50041 ?auto_50045 ) ) ( not ( = ?auto_50042 ?auto_50045 ) ) ( ON ?auto_50041 ?auto_50046 ) ( not ( = ?auto_50041 ?auto_50046 ) ) ( not ( = ?auto_50042 ?auto_50046 ) ) ( not ( = ?auto_50043 ?auto_50046 ) ) ( not ( = ?auto_50044 ?auto_50046 ) ) ( not ( = ?auto_50047 ?auto_50046 ) ) ( not ( = ?auto_50045 ?auto_50046 ) ) ( ON ?auto_50042 ?auto_50041 ) ( ON-TABLE ?auto_50046 ) ( ON ?auto_50043 ?auto_50042 ) ( CLEAR ?auto_50043 ) ( HOLDING ?auto_50044 ) ( CLEAR ?auto_50047 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_50045 ?auto_50047 ?auto_50044 )
      ( MAKE-4PILE ?auto_50041 ?auto_50042 ?auto_50043 ?auto_50044 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_50048 - BLOCK
      ?auto_50049 - BLOCK
      ?auto_50050 - BLOCK
      ?auto_50051 - BLOCK
    )
    :vars
    (
      ?auto_50053 - BLOCK
      ?auto_50052 - BLOCK
      ?auto_50054 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50048 ?auto_50049 ) ) ( not ( = ?auto_50048 ?auto_50050 ) ) ( not ( = ?auto_50048 ?auto_50051 ) ) ( not ( = ?auto_50049 ?auto_50050 ) ) ( not ( = ?auto_50049 ?auto_50051 ) ) ( not ( = ?auto_50050 ?auto_50051 ) ) ( not ( = ?auto_50048 ?auto_50053 ) ) ( not ( = ?auto_50049 ?auto_50053 ) ) ( not ( = ?auto_50050 ?auto_50053 ) ) ( not ( = ?auto_50051 ?auto_50053 ) ) ( ON-TABLE ?auto_50052 ) ( ON ?auto_50053 ?auto_50052 ) ( not ( = ?auto_50052 ?auto_50053 ) ) ( not ( = ?auto_50052 ?auto_50051 ) ) ( not ( = ?auto_50052 ?auto_50050 ) ) ( not ( = ?auto_50048 ?auto_50052 ) ) ( not ( = ?auto_50049 ?auto_50052 ) ) ( ON ?auto_50048 ?auto_50054 ) ( not ( = ?auto_50048 ?auto_50054 ) ) ( not ( = ?auto_50049 ?auto_50054 ) ) ( not ( = ?auto_50050 ?auto_50054 ) ) ( not ( = ?auto_50051 ?auto_50054 ) ) ( not ( = ?auto_50053 ?auto_50054 ) ) ( not ( = ?auto_50052 ?auto_50054 ) ) ( ON ?auto_50049 ?auto_50048 ) ( ON-TABLE ?auto_50054 ) ( ON ?auto_50050 ?auto_50049 ) ( CLEAR ?auto_50053 ) ( ON ?auto_50051 ?auto_50050 ) ( CLEAR ?auto_50051 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_50054 ?auto_50048 ?auto_50049 ?auto_50050 )
      ( MAKE-4PILE ?auto_50048 ?auto_50049 ?auto_50050 ?auto_50051 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_50055 - BLOCK
      ?auto_50056 - BLOCK
      ?auto_50057 - BLOCK
      ?auto_50058 - BLOCK
    )
    :vars
    (
      ?auto_50060 - BLOCK
      ?auto_50061 - BLOCK
      ?auto_50059 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50055 ?auto_50056 ) ) ( not ( = ?auto_50055 ?auto_50057 ) ) ( not ( = ?auto_50055 ?auto_50058 ) ) ( not ( = ?auto_50056 ?auto_50057 ) ) ( not ( = ?auto_50056 ?auto_50058 ) ) ( not ( = ?auto_50057 ?auto_50058 ) ) ( not ( = ?auto_50055 ?auto_50060 ) ) ( not ( = ?auto_50056 ?auto_50060 ) ) ( not ( = ?auto_50057 ?auto_50060 ) ) ( not ( = ?auto_50058 ?auto_50060 ) ) ( ON-TABLE ?auto_50061 ) ( not ( = ?auto_50061 ?auto_50060 ) ) ( not ( = ?auto_50061 ?auto_50058 ) ) ( not ( = ?auto_50061 ?auto_50057 ) ) ( not ( = ?auto_50055 ?auto_50061 ) ) ( not ( = ?auto_50056 ?auto_50061 ) ) ( ON ?auto_50055 ?auto_50059 ) ( not ( = ?auto_50055 ?auto_50059 ) ) ( not ( = ?auto_50056 ?auto_50059 ) ) ( not ( = ?auto_50057 ?auto_50059 ) ) ( not ( = ?auto_50058 ?auto_50059 ) ) ( not ( = ?auto_50060 ?auto_50059 ) ) ( not ( = ?auto_50061 ?auto_50059 ) ) ( ON ?auto_50056 ?auto_50055 ) ( ON-TABLE ?auto_50059 ) ( ON ?auto_50057 ?auto_50056 ) ( ON ?auto_50058 ?auto_50057 ) ( CLEAR ?auto_50058 ) ( HOLDING ?auto_50060 ) ( CLEAR ?auto_50061 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_50061 ?auto_50060 )
      ( MAKE-4PILE ?auto_50055 ?auto_50056 ?auto_50057 ?auto_50058 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_50062 - BLOCK
      ?auto_50063 - BLOCK
      ?auto_50064 - BLOCK
      ?auto_50065 - BLOCK
    )
    :vars
    (
      ?auto_50068 - BLOCK
      ?auto_50067 - BLOCK
      ?auto_50066 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50062 ?auto_50063 ) ) ( not ( = ?auto_50062 ?auto_50064 ) ) ( not ( = ?auto_50062 ?auto_50065 ) ) ( not ( = ?auto_50063 ?auto_50064 ) ) ( not ( = ?auto_50063 ?auto_50065 ) ) ( not ( = ?auto_50064 ?auto_50065 ) ) ( not ( = ?auto_50062 ?auto_50068 ) ) ( not ( = ?auto_50063 ?auto_50068 ) ) ( not ( = ?auto_50064 ?auto_50068 ) ) ( not ( = ?auto_50065 ?auto_50068 ) ) ( ON-TABLE ?auto_50067 ) ( not ( = ?auto_50067 ?auto_50068 ) ) ( not ( = ?auto_50067 ?auto_50065 ) ) ( not ( = ?auto_50067 ?auto_50064 ) ) ( not ( = ?auto_50062 ?auto_50067 ) ) ( not ( = ?auto_50063 ?auto_50067 ) ) ( ON ?auto_50062 ?auto_50066 ) ( not ( = ?auto_50062 ?auto_50066 ) ) ( not ( = ?auto_50063 ?auto_50066 ) ) ( not ( = ?auto_50064 ?auto_50066 ) ) ( not ( = ?auto_50065 ?auto_50066 ) ) ( not ( = ?auto_50068 ?auto_50066 ) ) ( not ( = ?auto_50067 ?auto_50066 ) ) ( ON ?auto_50063 ?auto_50062 ) ( ON-TABLE ?auto_50066 ) ( ON ?auto_50064 ?auto_50063 ) ( ON ?auto_50065 ?auto_50064 ) ( CLEAR ?auto_50067 ) ( ON ?auto_50068 ?auto_50065 ) ( CLEAR ?auto_50068 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_50066 ?auto_50062 ?auto_50063 ?auto_50064 ?auto_50065 )
      ( MAKE-4PILE ?auto_50062 ?auto_50063 ?auto_50064 ?auto_50065 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_50069 - BLOCK
      ?auto_50070 - BLOCK
      ?auto_50071 - BLOCK
      ?auto_50072 - BLOCK
    )
    :vars
    (
      ?auto_50075 - BLOCK
      ?auto_50073 - BLOCK
      ?auto_50074 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50069 ?auto_50070 ) ) ( not ( = ?auto_50069 ?auto_50071 ) ) ( not ( = ?auto_50069 ?auto_50072 ) ) ( not ( = ?auto_50070 ?auto_50071 ) ) ( not ( = ?auto_50070 ?auto_50072 ) ) ( not ( = ?auto_50071 ?auto_50072 ) ) ( not ( = ?auto_50069 ?auto_50075 ) ) ( not ( = ?auto_50070 ?auto_50075 ) ) ( not ( = ?auto_50071 ?auto_50075 ) ) ( not ( = ?auto_50072 ?auto_50075 ) ) ( not ( = ?auto_50073 ?auto_50075 ) ) ( not ( = ?auto_50073 ?auto_50072 ) ) ( not ( = ?auto_50073 ?auto_50071 ) ) ( not ( = ?auto_50069 ?auto_50073 ) ) ( not ( = ?auto_50070 ?auto_50073 ) ) ( ON ?auto_50069 ?auto_50074 ) ( not ( = ?auto_50069 ?auto_50074 ) ) ( not ( = ?auto_50070 ?auto_50074 ) ) ( not ( = ?auto_50071 ?auto_50074 ) ) ( not ( = ?auto_50072 ?auto_50074 ) ) ( not ( = ?auto_50075 ?auto_50074 ) ) ( not ( = ?auto_50073 ?auto_50074 ) ) ( ON ?auto_50070 ?auto_50069 ) ( ON-TABLE ?auto_50074 ) ( ON ?auto_50071 ?auto_50070 ) ( ON ?auto_50072 ?auto_50071 ) ( ON ?auto_50075 ?auto_50072 ) ( CLEAR ?auto_50075 ) ( HOLDING ?auto_50073 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_50073 )
      ( MAKE-4PILE ?auto_50069 ?auto_50070 ?auto_50071 ?auto_50072 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_50076 - BLOCK
      ?auto_50077 - BLOCK
      ?auto_50078 - BLOCK
      ?auto_50079 - BLOCK
    )
    :vars
    (
      ?auto_50082 - BLOCK
      ?auto_50081 - BLOCK
      ?auto_50080 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50076 ?auto_50077 ) ) ( not ( = ?auto_50076 ?auto_50078 ) ) ( not ( = ?auto_50076 ?auto_50079 ) ) ( not ( = ?auto_50077 ?auto_50078 ) ) ( not ( = ?auto_50077 ?auto_50079 ) ) ( not ( = ?auto_50078 ?auto_50079 ) ) ( not ( = ?auto_50076 ?auto_50082 ) ) ( not ( = ?auto_50077 ?auto_50082 ) ) ( not ( = ?auto_50078 ?auto_50082 ) ) ( not ( = ?auto_50079 ?auto_50082 ) ) ( not ( = ?auto_50081 ?auto_50082 ) ) ( not ( = ?auto_50081 ?auto_50079 ) ) ( not ( = ?auto_50081 ?auto_50078 ) ) ( not ( = ?auto_50076 ?auto_50081 ) ) ( not ( = ?auto_50077 ?auto_50081 ) ) ( ON ?auto_50076 ?auto_50080 ) ( not ( = ?auto_50076 ?auto_50080 ) ) ( not ( = ?auto_50077 ?auto_50080 ) ) ( not ( = ?auto_50078 ?auto_50080 ) ) ( not ( = ?auto_50079 ?auto_50080 ) ) ( not ( = ?auto_50082 ?auto_50080 ) ) ( not ( = ?auto_50081 ?auto_50080 ) ) ( ON ?auto_50077 ?auto_50076 ) ( ON-TABLE ?auto_50080 ) ( ON ?auto_50078 ?auto_50077 ) ( ON ?auto_50079 ?auto_50078 ) ( ON ?auto_50082 ?auto_50079 ) ( ON ?auto_50081 ?auto_50082 ) ( CLEAR ?auto_50081 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_50080 ?auto_50076 ?auto_50077 ?auto_50078 ?auto_50079 ?auto_50082 )
      ( MAKE-4PILE ?auto_50076 ?auto_50077 ?auto_50078 ?auto_50079 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_50094 - BLOCK
    )
    :vars
    (
      ?auto_50097 - BLOCK
      ?auto_50095 - BLOCK
      ?auto_50096 - BLOCK
      ?auto_50099 - BLOCK
      ?auto_50098 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50097 ?auto_50094 ) ( ON-TABLE ?auto_50094 ) ( not ( = ?auto_50094 ?auto_50097 ) ) ( not ( = ?auto_50094 ?auto_50095 ) ) ( not ( = ?auto_50094 ?auto_50096 ) ) ( not ( = ?auto_50097 ?auto_50095 ) ) ( not ( = ?auto_50097 ?auto_50096 ) ) ( not ( = ?auto_50095 ?auto_50096 ) ) ( ON ?auto_50095 ?auto_50097 ) ( CLEAR ?auto_50095 ) ( HOLDING ?auto_50096 ) ( CLEAR ?auto_50099 ) ( ON-TABLE ?auto_50098 ) ( ON ?auto_50099 ?auto_50098 ) ( not ( = ?auto_50098 ?auto_50099 ) ) ( not ( = ?auto_50098 ?auto_50096 ) ) ( not ( = ?auto_50099 ?auto_50096 ) ) ( not ( = ?auto_50094 ?auto_50099 ) ) ( not ( = ?auto_50094 ?auto_50098 ) ) ( not ( = ?auto_50097 ?auto_50099 ) ) ( not ( = ?auto_50097 ?auto_50098 ) ) ( not ( = ?auto_50095 ?auto_50099 ) ) ( not ( = ?auto_50095 ?auto_50098 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_50098 ?auto_50099 ?auto_50096 )
      ( MAKE-1PILE ?auto_50094 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_50100 - BLOCK
    )
    :vars
    (
      ?auto_50103 - BLOCK
      ?auto_50101 - BLOCK
      ?auto_50102 - BLOCK
      ?auto_50105 - BLOCK
      ?auto_50104 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50103 ?auto_50100 ) ( ON-TABLE ?auto_50100 ) ( not ( = ?auto_50100 ?auto_50103 ) ) ( not ( = ?auto_50100 ?auto_50101 ) ) ( not ( = ?auto_50100 ?auto_50102 ) ) ( not ( = ?auto_50103 ?auto_50101 ) ) ( not ( = ?auto_50103 ?auto_50102 ) ) ( not ( = ?auto_50101 ?auto_50102 ) ) ( ON ?auto_50101 ?auto_50103 ) ( CLEAR ?auto_50105 ) ( ON-TABLE ?auto_50104 ) ( ON ?auto_50105 ?auto_50104 ) ( not ( = ?auto_50104 ?auto_50105 ) ) ( not ( = ?auto_50104 ?auto_50102 ) ) ( not ( = ?auto_50105 ?auto_50102 ) ) ( not ( = ?auto_50100 ?auto_50105 ) ) ( not ( = ?auto_50100 ?auto_50104 ) ) ( not ( = ?auto_50103 ?auto_50105 ) ) ( not ( = ?auto_50103 ?auto_50104 ) ) ( not ( = ?auto_50101 ?auto_50105 ) ) ( not ( = ?auto_50101 ?auto_50104 ) ) ( ON ?auto_50102 ?auto_50101 ) ( CLEAR ?auto_50102 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_50100 ?auto_50103 ?auto_50101 )
      ( MAKE-1PILE ?auto_50100 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_50106 - BLOCK
    )
    :vars
    (
      ?auto_50110 - BLOCK
      ?auto_50108 - BLOCK
      ?auto_50111 - BLOCK
      ?auto_50109 - BLOCK
      ?auto_50107 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50110 ?auto_50106 ) ( ON-TABLE ?auto_50106 ) ( not ( = ?auto_50106 ?auto_50110 ) ) ( not ( = ?auto_50106 ?auto_50108 ) ) ( not ( = ?auto_50106 ?auto_50111 ) ) ( not ( = ?auto_50110 ?auto_50108 ) ) ( not ( = ?auto_50110 ?auto_50111 ) ) ( not ( = ?auto_50108 ?auto_50111 ) ) ( ON ?auto_50108 ?auto_50110 ) ( ON-TABLE ?auto_50109 ) ( not ( = ?auto_50109 ?auto_50107 ) ) ( not ( = ?auto_50109 ?auto_50111 ) ) ( not ( = ?auto_50107 ?auto_50111 ) ) ( not ( = ?auto_50106 ?auto_50107 ) ) ( not ( = ?auto_50106 ?auto_50109 ) ) ( not ( = ?auto_50110 ?auto_50107 ) ) ( not ( = ?auto_50110 ?auto_50109 ) ) ( not ( = ?auto_50108 ?auto_50107 ) ) ( not ( = ?auto_50108 ?auto_50109 ) ) ( ON ?auto_50111 ?auto_50108 ) ( CLEAR ?auto_50111 ) ( HOLDING ?auto_50107 ) ( CLEAR ?auto_50109 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_50109 ?auto_50107 )
      ( MAKE-1PILE ?auto_50106 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_50112 - BLOCK
    )
    :vars
    (
      ?auto_50113 - BLOCK
      ?auto_50115 - BLOCK
      ?auto_50117 - BLOCK
      ?auto_50114 - BLOCK
      ?auto_50116 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50113 ?auto_50112 ) ( ON-TABLE ?auto_50112 ) ( not ( = ?auto_50112 ?auto_50113 ) ) ( not ( = ?auto_50112 ?auto_50115 ) ) ( not ( = ?auto_50112 ?auto_50117 ) ) ( not ( = ?auto_50113 ?auto_50115 ) ) ( not ( = ?auto_50113 ?auto_50117 ) ) ( not ( = ?auto_50115 ?auto_50117 ) ) ( ON ?auto_50115 ?auto_50113 ) ( ON-TABLE ?auto_50114 ) ( not ( = ?auto_50114 ?auto_50116 ) ) ( not ( = ?auto_50114 ?auto_50117 ) ) ( not ( = ?auto_50116 ?auto_50117 ) ) ( not ( = ?auto_50112 ?auto_50116 ) ) ( not ( = ?auto_50112 ?auto_50114 ) ) ( not ( = ?auto_50113 ?auto_50116 ) ) ( not ( = ?auto_50113 ?auto_50114 ) ) ( not ( = ?auto_50115 ?auto_50116 ) ) ( not ( = ?auto_50115 ?auto_50114 ) ) ( ON ?auto_50117 ?auto_50115 ) ( CLEAR ?auto_50114 ) ( ON ?auto_50116 ?auto_50117 ) ( CLEAR ?auto_50116 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_50112 ?auto_50113 ?auto_50115 ?auto_50117 )
      ( MAKE-1PILE ?auto_50112 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_50118 - BLOCK
    )
    :vars
    (
      ?auto_50119 - BLOCK
      ?auto_50121 - BLOCK
      ?auto_50123 - BLOCK
      ?auto_50122 - BLOCK
      ?auto_50120 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50119 ?auto_50118 ) ( ON-TABLE ?auto_50118 ) ( not ( = ?auto_50118 ?auto_50119 ) ) ( not ( = ?auto_50118 ?auto_50121 ) ) ( not ( = ?auto_50118 ?auto_50123 ) ) ( not ( = ?auto_50119 ?auto_50121 ) ) ( not ( = ?auto_50119 ?auto_50123 ) ) ( not ( = ?auto_50121 ?auto_50123 ) ) ( ON ?auto_50121 ?auto_50119 ) ( not ( = ?auto_50122 ?auto_50120 ) ) ( not ( = ?auto_50122 ?auto_50123 ) ) ( not ( = ?auto_50120 ?auto_50123 ) ) ( not ( = ?auto_50118 ?auto_50120 ) ) ( not ( = ?auto_50118 ?auto_50122 ) ) ( not ( = ?auto_50119 ?auto_50120 ) ) ( not ( = ?auto_50119 ?auto_50122 ) ) ( not ( = ?auto_50121 ?auto_50120 ) ) ( not ( = ?auto_50121 ?auto_50122 ) ) ( ON ?auto_50123 ?auto_50121 ) ( ON ?auto_50120 ?auto_50123 ) ( CLEAR ?auto_50120 ) ( HOLDING ?auto_50122 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_50122 )
      ( MAKE-1PILE ?auto_50118 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_50131 - BLOCK
    )
    :vars
    (
      ?auto_50136 - BLOCK
      ?auto_50133 - BLOCK
      ?auto_50135 - BLOCK
      ?auto_50134 - BLOCK
      ?auto_50132 - BLOCK
      ?auto_50137 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50136 ?auto_50131 ) ( ON-TABLE ?auto_50131 ) ( not ( = ?auto_50131 ?auto_50136 ) ) ( not ( = ?auto_50131 ?auto_50133 ) ) ( not ( = ?auto_50131 ?auto_50135 ) ) ( not ( = ?auto_50136 ?auto_50133 ) ) ( not ( = ?auto_50136 ?auto_50135 ) ) ( not ( = ?auto_50133 ?auto_50135 ) ) ( ON ?auto_50133 ?auto_50136 ) ( not ( = ?auto_50134 ?auto_50132 ) ) ( not ( = ?auto_50134 ?auto_50135 ) ) ( not ( = ?auto_50132 ?auto_50135 ) ) ( not ( = ?auto_50131 ?auto_50132 ) ) ( not ( = ?auto_50131 ?auto_50134 ) ) ( not ( = ?auto_50136 ?auto_50132 ) ) ( not ( = ?auto_50136 ?auto_50134 ) ) ( not ( = ?auto_50133 ?auto_50132 ) ) ( not ( = ?auto_50133 ?auto_50134 ) ) ( ON ?auto_50135 ?auto_50133 ) ( ON ?auto_50132 ?auto_50135 ) ( CLEAR ?auto_50132 ) ( ON ?auto_50134 ?auto_50137 ) ( CLEAR ?auto_50134 ) ( HAND-EMPTY ) ( not ( = ?auto_50131 ?auto_50137 ) ) ( not ( = ?auto_50136 ?auto_50137 ) ) ( not ( = ?auto_50133 ?auto_50137 ) ) ( not ( = ?auto_50135 ?auto_50137 ) ) ( not ( = ?auto_50134 ?auto_50137 ) ) ( not ( = ?auto_50132 ?auto_50137 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_50134 ?auto_50137 )
      ( MAKE-1PILE ?auto_50131 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_50138 - BLOCK
    )
    :vars
    (
      ?auto_50140 - BLOCK
      ?auto_50144 - BLOCK
      ?auto_50143 - BLOCK
      ?auto_50142 - BLOCK
      ?auto_50141 - BLOCK
      ?auto_50139 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50140 ?auto_50138 ) ( ON-TABLE ?auto_50138 ) ( not ( = ?auto_50138 ?auto_50140 ) ) ( not ( = ?auto_50138 ?auto_50144 ) ) ( not ( = ?auto_50138 ?auto_50143 ) ) ( not ( = ?auto_50140 ?auto_50144 ) ) ( not ( = ?auto_50140 ?auto_50143 ) ) ( not ( = ?auto_50144 ?auto_50143 ) ) ( ON ?auto_50144 ?auto_50140 ) ( not ( = ?auto_50142 ?auto_50141 ) ) ( not ( = ?auto_50142 ?auto_50143 ) ) ( not ( = ?auto_50141 ?auto_50143 ) ) ( not ( = ?auto_50138 ?auto_50141 ) ) ( not ( = ?auto_50138 ?auto_50142 ) ) ( not ( = ?auto_50140 ?auto_50141 ) ) ( not ( = ?auto_50140 ?auto_50142 ) ) ( not ( = ?auto_50144 ?auto_50141 ) ) ( not ( = ?auto_50144 ?auto_50142 ) ) ( ON ?auto_50143 ?auto_50144 ) ( ON ?auto_50142 ?auto_50139 ) ( CLEAR ?auto_50142 ) ( not ( = ?auto_50138 ?auto_50139 ) ) ( not ( = ?auto_50140 ?auto_50139 ) ) ( not ( = ?auto_50144 ?auto_50139 ) ) ( not ( = ?auto_50143 ?auto_50139 ) ) ( not ( = ?auto_50142 ?auto_50139 ) ) ( not ( = ?auto_50141 ?auto_50139 ) ) ( HOLDING ?auto_50141 ) ( CLEAR ?auto_50143 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_50138 ?auto_50140 ?auto_50144 ?auto_50143 ?auto_50141 )
      ( MAKE-1PILE ?auto_50138 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_50145 - BLOCK
    )
    :vars
    (
      ?auto_50148 - BLOCK
      ?auto_50147 - BLOCK
      ?auto_50151 - BLOCK
      ?auto_50149 - BLOCK
      ?auto_50146 - BLOCK
      ?auto_50150 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50148 ?auto_50145 ) ( ON-TABLE ?auto_50145 ) ( not ( = ?auto_50145 ?auto_50148 ) ) ( not ( = ?auto_50145 ?auto_50147 ) ) ( not ( = ?auto_50145 ?auto_50151 ) ) ( not ( = ?auto_50148 ?auto_50147 ) ) ( not ( = ?auto_50148 ?auto_50151 ) ) ( not ( = ?auto_50147 ?auto_50151 ) ) ( ON ?auto_50147 ?auto_50148 ) ( not ( = ?auto_50149 ?auto_50146 ) ) ( not ( = ?auto_50149 ?auto_50151 ) ) ( not ( = ?auto_50146 ?auto_50151 ) ) ( not ( = ?auto_50145 ?auto_50146 ) ) ( not ( = ?auto_50145 ?auto_50149 ) ) ( not ( = ?auto_50148 ?auto_50146 ) ) ( not ( = ?auto_50148 ?auto_50149 ) ) ( not ( = ?auto_50147 ?auto_50146 ) ) ( not ( = ?auto_50147 ?auto_50149 ) ) ( ON ?auto_50151 ?auto_50147 ) ( ON ?auto_50149 ?auto_50150 ) ( not ( = ?auto_50145 ?auto_50150 ) ) ( not ( = ?auto_50148 ?auto_50150 ) ) ( not ( = ?auto_50147 ?auto_50150 ) ) ( not ( = ?auto_50151 ?auto_50150 ) ) ( not ( = ?auto_50149 ?auto_50150 ) ) ( not ( = ?auto_50146 ?auto_50150 ) ) ( CLEAR ?auto_50151 ) ( ON ?auto_50146 ?auto_50149 ) ( CLEAR ?auto_50146 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_50150 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_50150 ?auto_50149 )
      ( MAKE-1PILE ?auto_50145 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50185 - BLOCK
      ?auto_50186 - BLOCK
      ?auto_50187 - BLOCK
      ?auto_50188 - BLOCK
      ?auto_50189 - BLOCK
    )
    :vars
    (
      ?auto_50190 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_50185 ) ( ON ?auto_50186 ?auto_50185 ) ( ON ?auto_50187 ?auto_50186 ) ( not ( = ?auto_50185 ?auto_50186 ) ) ( not ( = ?auto_50185 ?auto_50187 ) ) ( not ( = ?auto_50185 ?auto_50188 ) ) ( not ( = ?auto_50185 ?auto_50189 ) ) ( not ( = ?auto_50186 ?auto_50187 ) ) ( not ( = ?auto_50186 ?auto_50188 ) ) ( not ( = ?auto_50186 ?auto_50189 ) ) ( not ( = ?auto_50187 ?auto_50188 ) ) ( not ( = ?auto_50187 ?auto_50189 ) ) ( not ( = ?auto_50188 ?auto_50189 ) ) ( ON ?auto_50189 ?auto_50190 ) ( not ( = ?auto_50185 ?auto_50190 ) ) ( not ( = ?auto_50186 ?auto_50190 ) ) ( not ( = ?auto_50187 ?auto_50190 ) ) ( not ( = ?auto_50188 ?auto_50190 ) ) ( not ( = ?auto_50189 ?auto_50190 ) ) ( CLEAR ?auto_50187 ) ( ON ?auto_50188 ?auto_50189 ) ( CLEAR ?auto_50188 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_50190 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_50190 ?auto_50189 )
      ( MAKE-5PILE ?auto_50185 ?auto_50186 ?auto_50187 ?auto_50188 ?auto_50189 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50191 - BLOCK
      ?auto_50192 - BLOCK
      ?auto_50193 - BLOCK
      ?auto_50194 - BLOCK
      ?auto_50195 - BLOCK
    )
    :vars
    (
      ?auto_50196 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_50191 ) ( ON ?auto_50192 ?auto_50191 ) ( not ( = ?auto_50191 ?auto_50192 ) ) ( not ( = ?auto_50191 ?auto_50193 ) ) ( not ( = ?auto_50191 ?auto_50194 ) ) ( not ( = ?auto_50191 ?auto_50195 ) ) ( not ( = ?auto_50192 ?auto_50193 ) ) ( not ( = ?auto_50192 ?auto_50194 ) ) ( not ( = ?auto_50192 ?auto_50195 ) ) ( not ( = ?auto_50193 ?auto_50194 ) ) ( not ( = ?auto_50193 ?auto_50195 ) ) ( not ( = ?auto_50194 ?auto_50195 ) ) ( ON ?auto_50195 ?auto_50196 ) ( not ( = ?auto_50191 ?auto_50196 ) ) ( not ( = ?auto_50192 ?auto_50196 ) ) ( not ( = ?auto_50193 ?auto_50196 ) ) ( not ( = ?auto_50194 ?auto_50196 ) ) ( not ( = ?auto_50195 ?auto_50196 ) ) ( ON ?auto_50194 ?auto_50195 ) ( CLEAR ?auto_50194 ) ( ON-TABLE ?auto_50196 ) ( HOLDING ?auto_50193 ) ( CLEAR ?auto_50192 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_50191 ?auto_50192 ?auto_50193 )
      ( MAKE-5PILE ?auto_50191 ?auto_50192 ?auto_50193 ?auto_50194 ?auto_50195 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50197 - BLOCK
      ?auto_50198 - BLOCK
      ?auto_50199 - BLOCK
      ?auto_50200 - BLOCK
      ?auto_50201 - BLOCK
    )
    :vars
    (
      ?auto_50202 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_50197 ) ( ON ?auto_50198 ?auto_50197 ) ( not ( = ?auto_50197 ?auto_50198 ) ) ( not ( = ?auto_50197 ?auto_50199 ) ) ( not ( = ?auto_50197 ?auto_50200 ) ) ( not ( = ?auto_50197 ?auto_50201 ) ) ( not ( = ?auto_50198 ?auto_50199 ) ) ( not ( = ?auto_50198 ?auto_50200 ) ) ( not ( = ?auto_50198 ?auto_50201 ) ) ( not ( = ?auto_50199 ?auto_50200 ) ) ( not ( = ?auto_50199 ?auto_50201 ) ) ( not ( = ?auto_50200 ?auto_50201 ) ) ( ON ?auto_50201 ?auto_50202 ) ( not ( = ?auto_50197 ?auto_50202 ) ) ( not ( = ?auto_50198 ?auto_50202 ) ) ( not ( = ?auto_50199 ?auto_50202 ) ) ( not ( = ?auto_50200 ?auto_50202 ) ) ( not ( = ?auto_50201 ?auto_50202 ) ) ( ON ?auto_50200 ?auto_50201 ) ( ON-TABLE ?auto_50202 ) ( CLEAR ?auto_50198 ) ( ON ?auto_50199 ?auto_50200 ) ( CLEAR ?auto_50199 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_50202 ?auto_50201 ?auto_50200 )
      ( MAKE-5PILE ?auto_50197 ?auto_50198 ?auto_50199 ?auto_50200 ?auto_50201 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50203 - BLOCK
      ?auto_50204 - BLOCK
      ?auto_50205 - BLOCK
      ?auto_50206 - BLOCK
      ?auto_50207 - BLOCK
    )
    :vars
    (
      ?auto_50208 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_50203 ) ( not ( = ?auto_50203 ?auto_50204 ) ) ( not ( = ?auto_50203 ?auto_50205 ) ) ( not ( = ?auto_50203 ?auto_50206 ) ) ( not ( = ?auto_50203 ?auto_50207 ) ) ( not ( = ?auto_50204 ?auto_50205 ) ) ( not ( = ?auto_50204 ?auto_50206 ) ) ( not ( = ?auto_50204 ?auto_50207 ) ) ( not ( = ?auto_50205 ?auto_50206 ) ) ( not ( = ?auto_50205 ?auto_50207 ) ) ( not ( = ?auto_50206 ?auto_50207 ) ) ( ON ?auto_50207 ?auto_50208 ) ( not ( = ?auto_50203 ?auto_50208 ) ) ( not ( = ?auto_50204 ?auto_50208 ) ) ( not ( = ?auto_50205 ?auto_50208 ) ) ( not ( = ?auto_50206 ?auto_50208 ) ) ( not ( = ?auto_50207 ?auto_50208 ) ) ( ON ?auto_50206 ?auto_50207 ) ( ON-TABLE ?auto_50208 ) ( ON ?auto_50205 ?auto_50206 ) ( CLEAR ?auto_50205 ) ( HOLDING ?auto_50204 ) ( CLEAR ?auto_50203 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_50203 ?auto_50204 )
      ( MAKE-5PILE ?auto_50203 ?auto_50204 ?auto_50205 ?auto_50206 ?auto_50207 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50209 - BLOCK
      ?auto_50210 - BLOCK
      ?auto_50211 - BLOCK
      ?auto_50212 - BLOCK
      ?auto_50213 - BLOCK
    )
    :vars
    (
      ?auto_50214 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_50209 ) ( not ( = ?auto_50209 ?auto_50210 ) ) ( not ( = ?auto_50209 ?auto_50211 ) ) ( not ( = ?auto_50209 ?auto_50212 ) ) ( not ( = ?auto_50209 ?auto_50213 ) ) ( not ( = ?auto_50210 ?auto_50211 ) ) ( not ( = ?auto_50210 ?auto_50212 ) ) ( not ( = ?auto_50210 ?auto_50213 ) ) ( not ( = ?auto_50211 ?auto_50212 ) ) ( not ( = ?auto_50211 ?auto_50213 ) ) ( not ( = ?auto_50212 ?auto_50213 ) ) ( ON ?auto_50213 ?auto_50214 ) ( not ( = ?auto_50209 ?auto_50214 ) ) ( not ( = ?auto_50210 ?auto_50214 ) ) ( not ( = ?auto_50211 ?auto_50214 ) ) ( not ( = ?auto_50212 ?auto_50214 ) ) ( not ( = ?auto_50213 ?auto_50214 ) ) ( ON ?auto_50212 ?auto_50213 ) ( ON-TABLE ?auto_50214 ) ( ON ?auto_50211 ?auto_50212 ) ( CLEAR ?auto_50209 ) ( ON ?auto_50210 ?auto_50211 ) ( CLEAR ?auto_50210 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_50214 ?auto_50213 ?auto_50212 ?auto_50211 )
      ( MAKE-5PILE ?auto_50209 ?auto_50210 ?auto_50211 ?auto_50212 ?auto_50213 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50215 - BLOCK
      ?auto_50216 - BLOCK
      ?auto_50217 - BLOCK
      ?auto_50218 - BLOCK
      ?auto_50219 - BLOCK
    )
    :vars
    (
      ?auto_50220 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50215 ?auto_50216 ) ) ( not ( = ?auto_50215 ?auto_50217 ) ) ( not ( = ?auto_50215 ?auto_50218 ) ) ( not ( = ?auto_50215 ?auto_50219 ) ) ( not ( = ?auto_50216 ?auto_50217 ) ) ( not ( = ?auto_50216 ?auto_50218 ) ) ( not ( = ?auto_50216 ?auto_50219 ) ) ( not ( = ?auto_50217 ?auto_50218 ) ) ( not ( = ?auto_50217 ?auto_50219 ) ) ( not ( = ?auto_50218 ?auto_50219 ) ) ( ON ?auto_50219 ?auto_50220 ) ( not ( = ?auto_50215 ?auto_50220 ) ) ( not ( = ?auto_50216 ?auto_50220 ) ) ( not ( = ?auto_50217 ?auto_50220 ) ) ( not ( = ?auto_50218 ?auto_50220 ) ) ( not ( = ?auto_50219 ?auto_50220 ) ) ( ON ?auto_50218 ?auto_50219 ) ( ON-TABLE ?auto_50220 ) ( ON ?auto_50217 ?auto_50218 ) ( ON ?auto_50216 ?auto_50217 ) ( CLEAR ?auto_50216 ) ( HOLDING ?auto_50215 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_50215 )
      ( MAKE-5PILE ?auto_50215 ?auto_50216 ?auto_50217 ?auto_50218 ?auto_50219 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50221 - BLOCK
      ?auto_50222 - BLOCK
      ?auto_50223 - BLOCK
      ?auto_50224 - BLOCK
      ?auto_50225 - BLOCK
    )
    :vars
    (
      ?auto_50226 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50221 ?auto_50222 ) ) ( not ( = ?auto_50221 ?auto_50223 ) ) ( not ( = ?auto_50221 ?auto_50224 ) ) ( not ( = ?auto_50221 ?auto_50225 ) ) ( not ( = ?auto_50222 ?auto_50223 ) ) ( not ( = ?auto_50222 ?auto_50224 ) ) ( not ( = ?auto_50222 ?auto_50225 ) ) ( not ( = ?auto_50223 ?auto_50224 ) ) ( not ( = ?auto_50223 ?auto_50225 ) ) ( not ( = ?auto_50224 ?auto_50225 ) ) ( ON ?auto_50225 ?auto_50226 ) ( not ( = ?auto_50221 ?auto_50226 ) ) ( not ( = ?auto_50222 ?auto_50226 ) ) ( not ( = ?auto_50223 ?auto_50226 ) ) ( not ( = ?auto_50224 ?auto_50226 ) ) ( not ( = ?auto_50225 ?auto_50226 ) ) ( ON ?auto_50224 ?auto_50225 ) ( ON-TABLE ?auto_50226 ) ( ON ?auto_50223 ?auto_50224 ) ( ON ?auto_50222 ?auto_50223 ) ( ON ?auto_50221 ?auto_50222 ) ( CLEAR ?auto_50221 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_50226 ?auto_50225 ?auto_50224 ?auto_50223 ?auto_50222 )
      ( MAKE-5PILE ?auto_50221 ?auto_50222 ?auto_50223 ?auto_50224 ?auto_50225 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50232 - BLOCK
      ?auto_50233 - BLOCK
      ?auto_50234 - BLOCK
      ?auto_50235 - BLOCK
      ?auto_50236 - BLOCK
    )
    :vars
    (
      ?auto_50237 - BLOCK
      ?auto_50238 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50232 ?auto_50233 ) ) ( not ( = ?auto_50232 ?auto_50234 ) ) ( not ( = ?auto_50232 ?auto_50235 ) ) ( not ( = ?auto_50232 ?auto_50236 ) ) ( not ( = ?auto_50233 ?auto_50234 ) ) ( not ( = ?auto_50233 ?auto_50235 ) ) ( not ( = ?auto_50233 ?auto_50236 ) ) ( not ( = ?auto_50234 ?auto_50235 ) ) ( not ( = ?auto_50234 ?auto_50236 ) ) ( not ( = ?auto_50235 ?auto_50236 ) ) ( ON ?auto_50236 ?auto_50237 ) ( not ( = ?auto_50232 ?auto_50237 ) ) ( not ( = ?auto_50233 ?auto_50237 ) ) ( not ( = ?auto_50234 ?auto_50237 ) ) ( not ( = ?auto_50235 ?auto_50237 ) ) ( not ( = ?auto_50236 ?auto_50237 ) ) ( ON ?auto_50235 ?auto_50236 ) ( ON-TABLE ?auto_50237 ) ( ON ?auto_50234 ?auto_50235 ) ( ON ?auto_50233 ?auto_50234 ) ( CLEAR ?auto_50233 ) ( ON ?auto_50232 ?auto_50238 ) ( CLEAR ?auto_50232 ) ( HAND-EMPTY ) ( not ( = ?auto_50232 ?auto_50238 ) ) ( not ( = ?auto_50233 ?auto_50238 ) ) ( not ( = ?auto_50234 ?auto_50238 ) ) ( not ( = ?auto_50235 ?auto_50238 ) ) ( not ( = ?auto_50236 ?auto_50238 ) ) ( not ( = ?auto_50237 ?auto_50238 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_50232 ?auto_50238 )
      ( MAKE-5PILE ?auto_50232 ?auto_50233 ?auto_50234 ?auto_50235 ?auto_50236 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50239 - BLOCK
      ?auto_50240 - BLOCK
      ?auto_50241 - BLOCK
      ?auto_50242 - BLOCK
      ?auto_50243 - BLOCK
    )
    :vars
    (
      ?auto_50245 - BLOCK
      ?auto_50244 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50239 ?auto_50240 ) ) ( not ( = ?auto_50239 ?auto_50241 ) ) ( not ( = ?auto_50239 ?auto_50242 ) ) ( not ( = ?auto_50239 ?auto_50243 ) ) ( not ( = ?auto_50240 ?auto_50241 ) ) ( not ( = ?auto_50240 ?auto_50242 ) ) ( not ( = ?auto_50240 ?auto_50243 ) ) ( not ( = ?auto_50241 ?auto_50242 ) ) ( not ( = ?auto_50241 ?auto_50243 ) ) ( not ( = ?auto_50242 ?auto_50243 ) ) ( ON ?auto_50243 ?auto_50245 ) ( not ( = ?auto_50239 ?auto_50245 ) ) ( not ( = ?auto_50240 ?auto_50245 ) ) ( not ( = ?auto_50241 ?auto_50245 ) ) ( not ( = ?auto_50242 ?auto_50245 ) ) ( not ( = ?auto_50243 ?auto_50245 ) ) ( ON ?auto_50242 ?auto_50243 ) ( ON-TABLE ?auto_50245 ) ( ON ?auto_50241 ?auto_50242 ) ( ON ?auto_50239 ?auto_50244 ) ( CLEAR ?auto_50239 ) ( not ( = ?auto_50239 ?auto_50244 ) ) ( not ( = ?auto_50240 ?auto_50244 ) ) ( not ( = ?auto_50241 ?auto_50244 ) ) ( not ( = ?auto_50242 ?auto_50244 ) ) ( not ( = ?auto_50243 ?auto_50244 ) ) ( not ( = ?auto_50245 ?auto_50244 ) ) ( HOLDING ?auto_50240 ) ( CLEAR ?auto_50241 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_50245 ?auto_50243 ?auto_50242 ?auto_50241 ?auto_50240 )
      ( MAKE-5PILE ?auto_50239 ?auto_50240 ?auto_50241 ?auto_50242 ?auto_50243 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50246 - BLOCK
      ?auto_50247 - BLOCK
      ?auto_50248 - BLOCK
      ?auto_50249 - BLOCK
      ?auto_50250 - BLOCK
    )
    :vars
    (
      ?auto_50251 - BLOCK
      ?auto_50252 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50246 ?auto_50247 ) ) ( not ( = ?auto_50246 ?auto_50248 ) ) ( not ( = ?auto_50246 ?auto_50249 ) ) ( not ( = ?auto_50246 ?auto_50250 ) ) ( not ( = ?auto_50247 ?auto_50248 ) ) ( not ( = ?auto_50247 ?auto_50249 ) ) ( not ( = ?auto_50247 ?auto_50250 ) ) ( not ( = ?auto_50248 ?auto_50249 ) ) ( not ( = ?auto_50248 ?auto_50250 ) ) ( not ( = ?auto_50249 ?auto_50250 ) ) ( ON ?auto_50250 ?auto_50251 ) ( not ( = ?auto_50246 ?auto_50251 ) ) ( not ( = ?auto_50247 ?auto_50251 ) ) ( not ( = ?auto_50248 ?auto_50251 ) ) ( not ( = ?auto_50249 ?auto_50251 ) ) ( not ( = ?auto_50250 ?auto_50251 ) ) ( ON ?auto_50249 ?auto_50250 ) ( ON-TABLE ?auto_50251 ) ( ON ?auto_50248 ?auto_50249 ) ( ON ?auto_50246 ?auto_50252 ) ( not ( = ?auto_50246 ?auto_50252 ) ) ( not ( = ?auto_50247 ?auto_50252 ) ) ( not ( = ?auto_50248 ?auto_50252 ) ) ( not ( = ?auto_50249 ?auto_50252 ) ) ( not ( = ?auto_50250 ?auto_50252 ) ) ( not ( = ?auto_50251 ?auto_50252 ) ) ( CLEAR ?auto_50248 ) ( ON ?auto_50247 ?auto_50246 ) ( CLEAR ?auto_50247 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_50252 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_50252 ?auto_50246 )
      ( MAKE-5PILE ?auto_50246 ?auto_50247 ?auto_50248 ?auto_50249 ?auto_50250 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50253 - BLOCK
      ?auto_50254 - BLOCK
      ?auto_50255 - BLOCK
      ?auto_50256 - BLOCK
      ?auto_50257 - BLOCK
    )
    :vars
    (
      ?auto_50259 - BLOCK
      ?auto_50258 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50253 ?auto_50254 ) ) ( not ( = ?auto_50253 ?auto_50255 ) ) ( not ( = ?auto_50253 ?auto_50256 ) ) ( not ( = ?auto_50253 ?auto_50257 ) ) ( not ( = ?auto_50254 ?auto_50255 ) ) ( not ( = ?auto_50254 ?auto_50256 ) ) ( not ( = ?auto_50254 ?auto_50257 ) ) ( not ( = ?auto_50255 ?auto_50256 ) ) ( not ( = ?auto_50255 ?auto_50257 ) ) ( not ( = ?auto_50256 ?auto_50257 ) ) ( ON ?auto_50257 ?auto_50259 ) ( not ( = ?auto_50253 ?auto_50259 ) ) ( not ( = ?auto_50254 ?auto_50259 ) ) ( not ( = ?auto_50255 ?auto_50259 ) ) ( not ( = ?auto_50256 ?auto_50259 ) ) ( not ( = ?auto_50257 ?auto_50259 ) ) ( ON ?auto_50256 ?auto_50257 ) ( ON-TABLE ?auto_50259 ) ( ON ?auto_50253 ?auto_50258 ) ( not ( = ?auto_50253 ?auto_50258 ) ) ( not ( = ?auto_50254 ?auto_50258 ) ) ( not ( = ?auto_50255 ?auto_50258 ) ) ( not ( = ?auto_50256 ?auto_50258 ) ) ( not ( = ?auto_50257 ?auto_50258 ) ) ( not ( = ?auto_50259 ?auto_50258 ) ) ( ON ?auto_50254 ?auto_50253 ) ( CLEAR ?auto_50254 ) ( ON-TABLE ?auto_50258 ) ( HOLDING ?auto_50255 ) ( CLEAR ?auto_50256 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_50259 ?auto_50257 ?auto_50256 ?auto_50255 )
      ( MAKE-5PILE ?auto_50253 ?auto_50254 ?auto_50255 ?auto_50256 ?auto_50257 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50260 - BLOCK
      ?auto_50261 - BLOCK
      ?auto_50262 - BLOCK
      ?auto_50263 - BLOCK
      ?auto_50264 - BLOCK
    )
    :vars
    (
      ?auto_50265 - BLOCK
      ?auto_50266 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50260 ?auto_50261 ) ) ( not ( = ?auto_50260 ?auto_50262 ) ) ( not ( = ?auto_50260 ?auto_50263 ) ) ( not ( = ?auto_50260 ?auto_50264 ) ) ( not ( = ?auto_50261 ?auto_50262 ) ) ( not ( = ?auto_50261 ?auto_50263 ) ) ( not ( = ?auto_50261 ?auto_50264 ) ) ( not ( = ?auto_50262 ?auto_50263 ) ) ( not ( = ?auto_50262 ?auto_50264 ) ) ( not ( = ?auto_50263 ?auto_50264 ) ) ( ON ?auto_50264 ?auto_50265 ) ( not ( = ?auto_50260 ?auto_50265 ) ) ( not ( = ?auto_50261 ?auto_50265 ) ) ( not ( = ?auto_50262 ?auto_50265 ) ) ( not ( = ?auto_50263 ?auto_50265 ) ) ( not ( = ?auto_50264 ?auto_50265 ) ) ( ON ?auto_50263 ?auto_50264 ) ( ON-TABLE ?auto_50265 ) ( ON ?auto_50260 ?auto_50266 ) ( not ( = ?auto_50260 ?auto_50266 ) ) ( not ( = ?auto_50261 ?auto_50266 ) ) ( not ( = ?auto_50262 ?auto_50266 ) ) ( not ( = ?auto_50263 ?auto_50266 ) ) ( not ( = ?auto_50264 ?auto_50266 ) ) ( not ( = ?auto_50265 ?auto_50266 ) ) ( ON ?auto_50261 ?auto_50260 ) ( ON-TABLE ?auto_50266 ) ( CLEAR ?auto_50263 ) ( ON ?auto_50262 ?auto_50261 ) ( CLEAR ?auto_50262 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_50266 ?auto_50260 ?auto_50261 )
      ( MAKE-5PILE ?auto_50260 ?auto_50261 ?auto_50262 ?auto_50263 ?auto_50264 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50267 - BLOCK
      ?auto_50268 - BLOCK
      ?auto_50269 - BLOCK
      ?auto_50270 - BLOCK
      ?auto_50271 - BLOCK
    )
    :vars
    (
      ?auto_50273 - BLOCK
      ?auto_50272 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50267 ?auto_50268 ) ) ( not ( = ?auto_50267 ?auto_50269 ) ) ( not ( = ?auto_50267 ?auto_50270 ) ) ( not ( = ?auto_50267 ?auto_50271 ) ) ( not ( = ?auto_50268 ?auto_50269 ) ) ( not ( = ?auto_50268 ?auto_50270 ) ) ( not ( = ?auto_50268 ?auto_50271 ) ) ( not ( = ?auto_50269 ?auto_50270 ) ) ( not ( = ?auto_50269 ?auto_50271 ) ) ( not ( = ?auto_50270 ?auto_50271 ) ) ( ON ?auto_50271 ?auto_50273 ) ( not ( = ?auto_50267 ?auto_50273 ) ) ( not ( = ?auto_50268 ?auto_50273 ) ) ( not ( = ?auto_50269 ?auto_50273 ) ) ( not ( = ?auto_50270 ?auto_50273 ) ) ( not ( = ?auto_50271 ?auto_50273 ) ) ( ON-TABLE ?auto_50273 ) ( ON ?auto_50267 ?auto_50272 ) ( not ( = ?auto_50267 ?auto_50272 ) ) ( not ( = ?auto_50268 ?auto_50272 ) ) ( not ( = ?auto_50269 ?auto_50272 ) ) ( not ( = ?auto_50270 ?auto_50272 ) ) ( not ( = ?auto_50271 ?auto_50272 ) ) ( not ( = ?auto_50273 ?auto_50272 ) ) ( ON ?auto_50268 ?auto_50267 ) ( ON-TABLE ?auto_50272 ) ( ON ?auto_50269 ?auto_50268 ) ( CLEAR ?auto_50269 ) ( HOLDING ?auto_50270 ) ( CLEAR ?auto_50271 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_50273 ?auto_50271 ?auto_50270 )
      ( MAKE-5PILE ?auto_50267 ?auto_50268 ?auto_50269 ?auto_50270 ?auto_50271 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50274 - BLOCK
      ?auto_50275 - BLOCK
      ?auto_50276 - BLOCK
      ?auto_50277 - BLOCK
      ?auto_50278 - BLOCK
    )
    :vars
    (
      ?auto_50280 - BLOCK
      ?auto_50279 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50274 ?auto_50275 ) ) ( not ( = ?auto_50274 ?auto_50276 ) ) ( not ( = ?auto_50274 ?auto_50277 ) ) ( not ( = ?auto_50274 ?auto_50278 ) ) ( not ( = ?auto_50275 ?auto_50276 ) ) ( not ( = ?auto_50275 ?auto_50277 ) ) ( not ( = ?auto_50275 ?auto_50278 ) ) ( not ( = ?auto_50276 ?auto_50277 ) ) ( not ( = ?auto_50276 ?auto_50278 ) ) ( not ( = ?auto_50277 ?auto_50278 ) ) ( ON ?auto_50278 ?auto_50280 ) ( not ( = ?auto_50274 ?auto_50280 ) ) ( not ( = ?auto_50275 ?auto_50280 ) ) ( not ( = ?auto_50276 ?auto_50280 ) ) ( not ( = ?auto_50277 ?auto_50280 ) ) ( not ( = ?auto_50278 ?auto_50280 ) ) ( ON-TABLE ?auto_50280 ) ( ON ?auto_50274 ?auto_50279 ) ( not ( = ?auto_50274 ?auto_50279 ) ) ( not ( = ?auto_50275 ?auto_50279 ) ) ( not ( = ?auto_50276 ?auto_50279 ) ) ( not ( = ?auto_50277 ?auto_50279 ) ) ( not ( = ?auto_50278 ?auto_50279 ) ) ( not ( = ?auto_50280 ?auto_50279 ) ) ( ON ?auto_50275 ?auto_50274 ) ( ON-TABLE ?auto_50279 ) ( ON ?auto_50276 ?auto_50275 ) ( CLEAR ?auto_50278 ) ( ON ?auto_50277 ?auto_50276 ) ( CLEAR ?auto_50277 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_50279 ?auto_50274 ?auto_50275 ?auto_50276 )
      ( MAKE-5PILE ?auto_50274 ?auto_50275 ?auto_50276 ?auto_50277 ?auto_50278 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50281 - BLOCK
      ?auto_50282 - BLOCK
      ?auto_50283 - BLOCK
      ?auto_50284 - BLOCK
      ?auto_50285 - BLOCK
    )
    :vars
    (
      ?auto_50287 - BLOCK
      ?auto_50286 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50281 ?auto_50282 ) ) ( not ( = ?auto_50281 ?auto_50283 ) ) ( not ( = ?auto_50281 ?auto_50284 ) ) ( not ( = ?auto_50281 ?auto_50285 ) ) ( not ( = ?auto_50282 ?auto_50283 ) ) ( not ( = ?auto_50282 ?auto_50284 ) ) ( not ( = ?auto_50282 ?auto_50285 ) ) ( not ( = ?auto_50283 ?auto_50284 ) ) ( not ( = ?auto_50283 ?auto_50285 ) ) ( not ( = ?auto_50284 ?auto_50285 ) ) ( not ( = ?auto_50281 ?auto_50287 ) ) ( not ( = ?auto_50282 ?auto_50287 ) ) ( not ( = ?auto_50283 ?auto_50287 ) ) ( not ( = ?auto_50284 ?auto_50287 ) ) ( not ( = ?auto_50285 ?auto_50287 ) ) ( ON-TABLE ?auto_50287 ) ( ON ?auto_50281 ?auto_50286 ) ( not ( = ?auto_50281 ?auto_50286 ) ) ( not ( = ?auto_50282 ?auto_50286 ) ) ( not ( = ?auto_50283 ?auto_50286 ) ) ( not ( = ?auto_50284 ?auto_50286 ) ) ( not ( = ?auto_50285 ?auto_50286 ) ) ( not ( = ?auto_50287 ?auto_50286 ) ) ( ON ?auto_50282 ?auto_50281 ) ( ON-TABLE ?auto_50286 ) ( ON ?auto_50283 ?auto_50282 ) ( ON ?auto_50284 ?auto_50283 ) ( CLEAR ?auto_50284 ) ( HOLDING ?auto_50285 ) ( CLEAR ?auto_50287 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_50287 ?auto_50285 )
      ( MAKE-5PILE ?auto_50281 ?auto_50282 ?auto_50283 ?auto_50284 ?auto_50285 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50288 - BLOCK
      ?auto_50289 - BLOCK
      ?auto_50290 - BLOCK
      ?auto_50291 - BLOCK
      ?auto_50292 - BLOCK
    )
    :vars
    (
      ?auto_50293 - BLOCK
      ?auto_50294 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50288 ?auto_50289 ) ) ( not ( = ?auto_50288 ?auto_50290 ) ) ( not ( = ?auto_50288 ?auto_50291 ) ) ( not ( = ?auto_50288 ?auto_50292 ) ) ( not ( = ?auto_50289 ?auto_50290 ) ) ( not ( = ?auto_50289 ?auto_50291 ) ) ( not ( = ?auto_50289 ?auto_50292 ) ) ( not ( = ?auto_50290 ?auto_50291 ) ) ( not ( = ?auto_50290 ?auto_50292 ) ) ( not ( = ?auto_50291 ?auto_50292 ) ) ( not ( = ?auto_50288 ?auto_50293 ) ) ( not ( = ?auto_50289 ?auto_50293 ) ) ( not ( = ?auto_50290 ?auto_50293 ) ) ( not ( = ?auto_50291 ?auto_50293 ) ) ( not ( = ?auto_50292 ?auto_50293 ) ) ( ON-TABLE ?auto_50293 ) ( ON ?auto_50288 ?auto_50294 ) ( not ( = ?auto_50288 ?auto_50294 ) ) ( not ( = ?auto_50289 ?auto_50294 ) ) ( not ( = ?auto_50290 ?auto_50294 ) ) ( not ( = ?auto_50291 ?auto_50294 ) ) ( not ( = ?auto_50292 ?auto_50294 ) ) ( not ( = ?auto_50293 ?auto_50294 ) ) ( ON ?auto_50289 ?auto_50288 ) ( ON-TABLE ?auto_50294 ) ( ON ?auto_50290 ?auto_50289 ) ( ON ?auto_50291 ?auto_50290 ) ( CLEAR ?auto_50293 ) ( ON ?auto_50292 ?auto_50291 ) ( CLEAR ?auto_50292 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_50294 ?auto_50288 ?auto_50289 ?auto_50290 ?auto_50291 )
      ( MAKE-5PILE ?auto_50288 ?auto_50289 ?auto_50290 ?auto_50291 ?auto_50292 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50295 - BLOCK
      ?auto_50296 - BLOCK
      ?auto_50297 - BLOCK
      ?auto_50298 - BLOCK
      ?auto_50299 - BLOCK
    )
    :vars
    (
      ?auto_50300 - BLOCK
      ?auto_50301 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50295 ?auto_50296 ) ) ( not ( = ?auto_50295 ?auto_50297 ) ) ( not ( = ?auto_50295 ?auto_50298 ) ) ( not ( = ?auto_50295 ?auto_50299 ) ) ( not ( = ?auto_50296 ?auto_50297 ) ) ( not ( = ?auto_50296 ?auto_50298 ) ) ( not ( = ?auto_50296 ?auto_50299 ) ) ( not ( = ?auto_50297 ?auto_50298 ) ) ( not ( = ?auto_50297 ?auto_50299 ) ) ( not ( = ?auto_50298 ?auto_50299 ) ) ( not ( = ?auto_50295 ?auto_50300 ) ) ( not ( = ?auto_50296 ?auto_50300 ) ) ( not ( = ?auto_50297 ?auto_50300 ) ) ( not ( = ?auto_50298 ?auto_50300 ) ) ( not ( = ?auto_50299 ?auto_50300 ) ) ( ON ?auto_50295 ?auto_50301 ) ( not ( = ?auto_50295 ?auto_50301 ) ) ( not ( = ?auto_50296 ?auto_50301 ) ) ( not ( = ?auto_50297 ?auto_50301 ) ) ( not ( = ?auto_50298 ?auto_50301 ) ) ( not ( = ?auto_50299 ?auto_50301 ) ) ( not ( = ?auto_50300 ?auto_50301 ) ) ( ON ?auto_50296 ?auto_50295 ) ( ON-TABLE ?auto_50301 ) ( ON ?auto_50297 ?auto_50296 ) ( ON ?auto_50298 ?auto_50297 ) ( ON ?auto_50299 ?auto_50298 ) ( CLEAR ?auto_50299 ) ( HOLDING ?auto_50300 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_50300 )
      ( MAKE-5PILE ?auto_50295 ?auto_50296 ?auto_50297 ?auto_50298 ?auto_50299 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50302 - BLOCK
      ?auto_50303 - BLOCK
      ?auto_50304 - BLOCK
      ?auto_50305 - BLOCK
      ?auto_50306 - BLOCK
    )
    :vars
    (
      ?auto_50307 - BLOCK
      ?auto_50308 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50302 ?auto_50303 ) ) ( not ( = ?auto_50302 ?auto_50304 ) ) ( not ( = ?auto_50302 ?auto_50305 ) ) ( not ( = ?auto_50302 ?auto_50306 ) ) ( not ( = ?auto_50303 ?auto_50304 ) ) ( not ( = ?auto_50303 ?auto_50305 ) ) ( not ( = ?auto_50303 ?auto_50306 ) ) ( not ( = ?auto_50304 ?auto_50305 ) ) ( not ( = ?auto_50304 ?auto_50306 ) ) ( not ( = ?auto_50305 ?auto_50306 ) ) ( not ( = ?auto_50302 ?auto_50307 ) ) ( not ( = ?auto_50303 ?auto_50307 ) ) ( not ( = ?auto_50304 ?auto_50307 ) ) ( not ( = ?auto_50305 ?auto_50307 ) ) ( not ( = ?auto_50306 ?auto_50307 ) ) ( ON ?auto_50302 ?auto_50308 ) ( not ( = ?auto_50302 ?auto_50308 ) ) ( not ( = ?auto_50303 ?auto_50308 ) ) ( not ( = ?auto_50304 ?auto_50308 ) ) ( not ( = ?auto_50305 ?auto_50308 ) ) ( not ( = ?auto_50306 ?auto_50308 ) ) ( not ( = ?auto_50307 ?auto_50308 ) ) ( ON ?auto_50303 ?auto_50302 ) ( ON-TABLE ?auto_50308 ) ( ON ?auto_50304 ?auto_50303 ) ( ON ?auto_50305 ?auto_50304 ) ( ON ?auto_50306 ?auto_50305 ) ( ON ?auto_50307 ?auto_50306 ) ( CLEAR ?auto_50307 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_50308 ?auto_50302 ?auto_50303 ?auto_50304 ?auto_50305 ?auto_50306 )
      ( MAKE-5PILE ?auto_50302 ?auto_50303 ?auto_50304 ?auto_50305 ?auto_50306 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50321 - BLOCK
      ?auto_50322 - BLOCK
      ?auto_50323 - BLOCK
      ?auto_50324 - BLOCK
      ?auto_50325 - BLOCK
      ?auto_50326 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_50325 ) ( ON-TABLE ?auto_50321 ) ( ON ?auto_50322 ?auto_50321 ) ( ON ?auto_50323 ?auto_50322 ) ( ON ?auto_50324 ?auto_50323 ) ( ON ?auto_50325 ?auto_50324 ) ( not ( = ?auto_50321 ?auto_50322 ) ) ( not ( = ?auto_50321 ?auto_50323 ) ) ( not ( = ?auto_50321 ?auto_50324 ) ) ( not ( = ?auto_50321 ?auto_50325 ) ) ( not ( = ?auto_50321 ?auto_50326 ) ) ( not ( = ?auto_50322 ?auto_50323 ) ) ( not ( = ?auto_50322 ?auto_50324 ) ) ( not ( = ?auto_50322 ?auto_50325 ) ) ( not ( = ?auto_50322 ?auto_50326 ) ) ( not ( = ?auto_50323 ?auto_50324 ) ) ( not ( = ?auto_50323 ?auto_50325 ) ) ( not ( = ?auto_50323 ?auto_50326 ) ) ( not ( = ?auto_50324 ?auto_50325 ) ) ( not ( = ?auto_50324 ?auto_50326 ) ) ( not ( = ?auto_50325 ?auto_50326 ) ) ( ON-TABLE ?auto_50326 ) ( CLEAR ?auto_50326 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_50326 )
      ( MAKE-6PILE ?auto_50321 ?auto_50322 ?auto_50323 ?auto_50324 ?auto_50325 ?auto_50326 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50327 - BLOCK
      ?auto_50328 - BLOCK
      ?auto_50329 - BLOCK
      ?auto_50330 - BLOCK
      ?auto_50331 - BLOCK
      ?auto_50332 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_50327 ) ( ON ?auto_50328 ?auto_50327 ) ( ON ?auto_50329 ?auto_50328 ) ( ON ?auto_50330 ?auto_50329 ) ( not ( = ?auto_50327 ?auto_50328 ) ) ( not ( = ?auto_50327 ?auto_50329 ) ) ( not ( = ?auto_50327 ?auto_50330 ) ) ( not ( = ?auto_50327 ?auto_50331 ) ) ( not ( = ?auto_50327 ?auto_50332 ) ) ( not ( = ?auto_50328 ?auto_50329 ) ) ( not ( = ?auto_50328 ?auto_50330 ) ) ( not ( = ?auto_50328 ?auto_50331 ) ) ( not ( = ?auto_50328 ?auto_50332 ) ) ( not ( = ?auto_50329 ?auto_50330 ) ) ( not ( = ?auto_50329 ?auto_50331 ) ) ( not ( = ?auto_50329 ?auto_50332 ) ) ( not ( = ?auto_50330 ?auto_50331 ) ) ( not ( = ?auto_50330 ?auto_50332 ) ) ( not ( = ?auto_50331 ?auto_50332 ) ) ( ON-TABLE ?auto_50332 ) ( CLEAR ?auto_50332 ) ( HOLDING ?auto_50331 ) ( CLEAR ?auto_50330 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_50327 ?auto_50328 ?auto_50329 ?auto_50330 ?auto_50331 )
      ( MAKE-6PILE ?auto_50327 ?auto_50328 ?auto_50329 ?auto_50330 ?auto_50331 ?auto_50332 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50333 - BLOCK
      ?auto_50334 - BLOCK
      ?auto_50335 - BLOCK
      ?auto_50336 - BLOCK
      ?auto_50337 - BLOCK
      ?auto_50338 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_50333 ) ( ON ?auto_50334 ?auto_50333 ) ( ON ?auto_50335 ?auto_50334 ) ( ON ?auto_50336 ?auto_50335 ) ( not ( = ?auto_50333 ?auto_50334 ) ) ( not ( = ?auto_50333 ?auto_50335 ) ) ( not ( = ?auto_50333 ?auto_50336 ) ) ( not ( = ?auto_50333 ?auto_50337 ) ) ( not ( = ?auto_50333 ?auto_50338 ) ) ( not ( = ?auto_50334 ?auto_50335 ) ) ( not ( = ?auto_50334 ?auto_50336 ) ) ( not ( = ?auto_50334 ?auto_50337 ) ) ( not ( = ?auto_50334 ?auto_50338 ) ) ( not ( = ?auto_50335 ?auto_50336 ) ) ( not ( = ?auto_50335 ?auto_50337 ) ) ( not ( = ?auto_50335 ?auto_50338 ) ) ( not ( = ?auto_50336 ?auto_50337 ) ) ( not ( = ?auto_50336 ?auto_50338 ) ) ( not ( = ?auto_50337 ?auto_50338 ) ) ( ON-TABLE ?auto_50338 ) ( CLEAR ?auto_50336 ) ( ON ?auto_50337 ?auto_50338 ) ( CLEAR ?auto_50337 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_50338 )
      ( MAKE-6PILE ?auto_50333 ?auto_50334 ?auto_50335 ?auto_50336 ?auto_50337 ?auto_50338 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50339 - BLOCK
      ?auto_50340 - BLOCK
      ?auto_50341 - BLOCK
      ?auto_50342 - BLOCK
      ?auto_50343 - BLOCK
      ?auto_50344 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_50339 ) ( ON ?auto_50340 ?auto_50339 ) ( ON ?auto_50341 ?auto_50340 ) ( not ( = ?auto_50339 ?auto_50340 ) ) ( not ( = ?auto_50339 ?auto_50341 ) ) ( not ( = ?auto_50339 ?auto_50342 ) ) ( not ( = ?auto_50339 ?auto_50343 ) ) ( not ( = ?auto_50339 ?auto_50344 ) ) ( not ( = ?auto_50340 ?auto_50341 ) ) ( not ( = ?auto_50340 ?auto_50342 ) ) ( not ( = ?auto_50340 ?auto_50343 ) ) ( not ( = ?auto_50340 ?auto_50344 ) ) ( not ( = ?auto_50341 ?auto_50342 ) ) ( not ( = ?auto_50341 ?auto_50343 ) ) ( not ( = ?auto_50341 ?auto_50344 ) ) ( not ( = ?auto_50342 ?auto_50343 ) ) ( not ( = ?auto_50342 ?auto_50344 ) ) ( not ( = ?auto_50343 ?auto_50344 ) ) ( ON-TABLE ?auto_50344 ) ( ON ?auto_50343 ?auto_50344 ) ( CLEAR ?auto_50343 ) ( HOLDING ?auto_50342 ) ( CLEAR ?auto_50341 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_50339 ?auto_50340 ?auto_50341 ?auto_50342 )
      ( MAKE-6PILE ?auto_50339 ?auto_50340 ?auto_50341 ?auto_50342 ?auto_50343 ?auto_50344 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50345 - BLOCK
      ?auto_50346 - BLOCK
      ?auto_50347 - BLOCK
      ?auto_50348 - BLOCK
      ?auto_50349 - BLOCK
      ?auto_50350 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_50345 ) ( ON ?auto_50346 ?auto_50345 ) ( ON ?auto_50347 ?auto_50346 ) ( not ( = ?auto_50345 ?auto_50346 ) ) ( not ( = ?auto_50345 ?auto_50347 ) ) ( not ( = ?auto_50345 ?auto_50348 ) ) ( not ( = ?auto_50345 ?auto_50349 ) ) ( not ( = ?auto_50345 ?auto_50350 ) ) ( not ( = ?auto_50346 ?auto_50347 ) ) ( not ( = ?auto_50346 ?auto_50348 ) ) ( not ( = ?auto_50346 ?auto_50349 ) ) ( not ( = ?auto_50346 ?auto_50350 ) ) ( not ( = ?auto_50347 ?auto_50348 ) ) ( not ( = ?auto_50347 ?auto_50349 ) ) ( not ( = ?auto_50347 ?auto_50350 ) ) ( not ( = ?auto_50348 ?auto_50349 ) ) ( not ( = ?auto_50348 ?auto_50350 ) ) ( not ( = ?auto_50349 ?auto_50350 ) ) ( ON-TABLE ?auto_50350 ) ( ON ?auto_50349 ?auto_50350 ) ( CLEAR ?auto_50347 ) ( ON ?auto_50348 ?auto_50349 ) ( CLEAR ?auto_50348 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_50350 ?auto_50349 )
      ( MAKE-6PILE ?auto_50345 ?auto_50346 ?auto_50347 ?auto_50348 ?auto_50349 ?auto_50350 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50351 - BLOCK
      ?auto_50352 - BLOCK
      ?auto_50353 - BLOCK
      ?auto_50354 - BLOCK
      ?auto_50355 - BLOCK
      ?auto_50356 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_50351 ) ( ON ?auto_50352 ?auto_50351 ) ( not ( = ?auto_50351 ?auto_50352 ) ) ( not ( = ?auto_50351 ?auto_50353 ) ) ( not ( = ?auto_50351 ?auto_50354 ) ) ( not ( = ?auto_50351 ?auto_50355 ) ) ( not ( = ?auto_50351 ?auto_50356 ) ) ( not ( = ?auto_50352 ?auto_50353 ) ) ( not ( = ?auto_50352 ?auto_50354 ) ) ( not ( = ?auto_50352 ?auto_50355 ) ) ( not ( = ?auto_50352 ?auto_50356 ) ) ( not ( = ?auto_50353 ?auto_50354 ) ) ( not ( = ?auto_50353 ?auto_50355 ) ) ( not ( = ?auto_50353 ?auto_50356 ) ) ( not ( = ?auto_50354 ?auto_50355 ) ) ( not ( = ?auto_50354 ?auto_50356 ) ) ( not ( = ?auto_50355 ?auto_50356 ) ) ( ON-TABLE ?auto_50356 ) ( ON ?auto_50355 ?auto_50356 ) ( ON ?auto_50354 ?auto_50355 ) ( CLEAR ?auto_50354 ) ( HOLDING ?auto_50353 ) ( CLEAR ?auto_50352 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_50351 ?auto_50352 ?auto_50353 )
      ( MAKE-6PILE ?auto_50351 ?auto_50352 ?auto_50353 ?auto_50354 ?auto_50355 ?auto_50356 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50357 - BLOCK
      ?auto_50358 - BLOCK
      ?auto_50359 - BLOCK
      ?auto_50360 - BLOCK
      ?auto_50361 - BLOCK
      ?auto_50362 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_50357 ) ( ON ?auto_50358 ?auto_50357 ) ( not ( = ?auto_50357 ?auto_50358 ) ) ( not ( = ?auto_50357 ?auto_50359 ) ) ( not ( = ?auto_50357 ?auto_50360 ) ) ( not ( = ?auto_50357 ?auto_50361 ) ) ( not ( = ?auto_50357 ?auto_50362 ) ) ( not ( = ?auto_50358 ?auto_50359 ) ) ( not ( = ?auto_50358 ?auto_50360 ) ) ( not ( = ?auto_50358 ?auto_50361 ) ) ( not ( = ?auto_50358 ?auto_50362 ) ) ( not ( = ?auto_50359 ?auto_50360 ) ) ( not ( = ?auto_50359 ?auto_50361 ) ) ( not ( = ?auto_50359 ?auto_50362 ) ) ( not ( = ?auto_50360 ?auto_50361 ) ) ( not ( = ?auto_50360 ?auto_50362 ) ) ( not ( = ?auto_50361 ?auto_50362 ) ) ( ON-TABLE ?auto_50362 ) ( ON ?auto_50361 ?auto_50362 ) ( ON ?auto_50360 ?auto_50361 ) ( CLEAR ?auto_50358 ) ( ON ?auto_50359 ?auto_50360 ) ( CLEAR ?auto_50359 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_50362 ?auto_50361 ?auto_50360 )
      ( MAKE-6PILE ?auto_50357 ?auto_50358 ?auto_50359 ?auto_50360 ?auto_50361 ?auto_50362 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50363 - BLOCK
      ?auto_50364 - BLOCK
      ?auto_50365 - BLOCK
      ?auto_50366 - BLOCK
      ?auto_50367 - BLOCK
      ?auto_50368 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_50363 ) ( not ( = ?auto_50363 ?auto_50364 ) ) ( not ( = ?auto_50363 ?auto_50365 ) ) ( not ( = ?auto_50363 ?auto_50366 ) ) ( not ( = ?auto_50363 ?auto_50367 ) ) ( not ( = ?auto_50363 ?auto_50368 ) ) ( not ( = ?auto_50364 ?auto_50365 ) ) ( not ( = ?auto_50364 ?auto_50366 ) ) ( not ( = ?auto_50364 ?auto_50367 ) ) ( not ( = ?auto_50364 ?auto_50368 ) ) ( not ( = ?auto_50365 ?auto_50366 ) ) ( not ( = ?auto_50365 ?auto_50367 ) ) ( not ( = ?auto_50365 ?auto_50368 ) ) ( not ( = ?auto_50366 ?auto_50367 ) ) ( not ( = ?auto_50366 ?auto_50368 ) ) ( not ( = ?auto_50367 ?auto_50368 ) ) ( ON-TABLE ?auto_50368 ) ( ON ?auto_50367 ?auto_50368 ) ( ON ?auto_50366 ?auto_50367 ) ( ON ?auto_50365 ?auto_50366 ) ( CLEAR ?auto_50365 ) ( HOLDING ?auto_50364 ) ( CLEAR ?auto_50363 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_50363 ?auto_50364 )
      ( MAKE-6PILE ?auto_50363 ?auto_50364 ?auto_50365 ?auto_50366 ?auto_50367 ?auto_50368 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50369 - BLOCK
      ?auto_50370 - BLOCK
      ?auto_50371 - BLOCK
      ?auto_50372 - BLOCK
      ?auto_50373 - BLOCK
      ?auto_50374 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_50369 ) ( not ( = ?auto_50369 ?auto_50370 ) ) ( not ( = ?auto_50369 ?auto_50371 ) ) ( not ( = ?auto_50369 ?auto_50372 ) ) ( not ( = ?auto_50369 ?auto_50373 ) ) ( not ( = ?auto_50369 ?auto_50374 ) ) ( not ( = ?auto_50370 ?auto_50371 ) ) ( not ( = ?auto_50370 ?auto_50372 ) ) ( not ( = ?auto_50370 ?auto_50373 ) ) ( not ( = ?auto_50370 ?auto_50374 ) ) ( not ( = ?auto_50371 ?auto_50372 ) ) ( not ( = ?auto_50371 ?auto_50373 ) ) ( not ( = ?auto_50371 ?auto_50374 ) ) ( not ( = ?auto_50372 ?auto_50373 ) ) ( not ( = ?auto_50372 ?auto_50374 ) ) ( not ( = ?auto_50373 ?auto_50374 ) ) ( ON-TABLE ?auto_50374 ) ( ON ?auto_50373 ?auto_50374 ) ( ON ?auto_50372 ?auto_50373 ) ( ON ?auto_50371 ?auto_50372 ) ( CLEAR ?auto_50369 ) ( ON ?auto_50370 ?auto_50371 ) ( CLEAR ?auto_50370 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_50374 ?auto_50373 ?auto_50372 ?auto_50371 )
      ( MAKE-6PILE ?auto_50369 ?auto_50370 ?auto_50371 ?auto_50372 ?auto_50373 ?auto_50374 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50375 - BLOCK
      ?auto_50376 - BLOCK
      ?auto_50377 - BLOCK
      ?auto_50378 - BLOCK
      ?auto_50379 - BLOCK
      ?auto_50380 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50375 ?auto_50376 ) ) ( not ( = ?auto_50375 ?auto_50377 ) ) ( not ( = ?auto_50375 ?auto_50378 ) ) ( not ( = ?auto_50375 ?auto_50379 ) ) ( not ( = ?auto_50375 ?auto_50380 ) ) ( not ( = ?auto_50376 ?auto_50377 ) ) ( not ( = ?auto_50376 ?auto_50378 ) ) ( not ( = ?auto_50376 ?auto_50379 ) ) ( not ( = ?auto_50376 ?auto_50380 ) ) ( not ( = ?auto_50377 ?auto_50378 ) ) ( not ( = ?auto_50377 ?auto_50379 ) ) ( not ( = ?auto_50377 ?auto_50380 ) ) ( not ( = ?auto_50378 ?auto_50379 ) ) ( not ( = ?auto_50378 ?auto_50380 ) ) ( not ( = ?auto_50379 ?auto_50380 ) ) ( ON-TABLE ?auto_50380 ) ( ON ?auto_50379 ?auto_50380 ) ( ON ?auto_50378 ?auto_50379 ) ( ON ?auto_50377 ?auto_50378 ) ( ON ?auto_50376 ?auto_50377 ) ( CLEAR ?auto_50376 ) ( HOLDING ?auto_50375 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_50375 )
      ( MAKE-6PILE ?auto_50375 ?auto_50376 ?auto_50377 ?auto_50378 ?auto_50379 ?auto_50380 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50381 - BLOCK
      ?auto_50382 - BLOCK
      ?auto_50383 - BLOCK
      ?auto_50384 - BLOCK
      ?auto_50385 - BLOCK
      ?auto_50386 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50381 ?auto_50382 ) ) ( not ( = ?auto_50381 ?auto_50383 ) ) ( not ( = ?auto_50381 ?auto_50384 ) ) ( not ( = ?auto_50381 ?auto_50385 ) ) ( not ( = ?auto_50381 ?auto_50386 ) ) ( not ( = ?auto_50382 ?auto_50383 ) ) ( not ( = ?auto_50382 ?auto_50384 ) ) ( not ( = ?auto_50382 ?auto_50385 ) ) ( not ( = ?auto_50382 ?auto_50386 ) ) ( not ( = ?auto_50383 ?auto_50384 ) ) ( not ( = ?auto_50383 ?auto_50385 ) ) ( not ( = ?auto_50383 ?auto_50386 ) ) ( not ( = ?auto_50384 ?auto_50385 ) ) ( not ( = ?auto_50384 ?auto_50386 ) ) ( not ( = ?auto_50385 ?auto_50386 ) ) ( ON-TABLE ?auto_50386 ) ( ON ?auto_50385 ?auto_50386 ) ( ON ?auto_50384 ?auto_50385 ) ( ON ?auto_50383 ?auto_50384 ) ( ON ?auto_50382 ?auto_50383 ) ( ON ?auto_50381 ?auto_50382 ) ( CLEAR ?auto_50381 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_50386 ?auto_50385 ?auto_50384 ?auto_50383 ?auto_50382 )
      ( MAKE-6PILE ?auto_50381 ?auto_50382 ?auto_50383 ?auto_50384 ?auto_50385 ?auto_50386 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50393 - BLOCK
      ?auto_50394 - BLOCK
      ?auto_50395 - BLOCK
      ?auto_50396 - BLOCK
      ?auto_50397 - BLOCK
      ?auto_50398 - BLOCK
    )
    :vars
    (
      ?auto_50399 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50393 ?auto_50394 ) ) ( not ( = ?auto_50393 ?auto_50395 ) ) ( not ( = ?auto_50393 ?auto_50396 ) ) ( not ( = ?auto_50393 ?auto_50397 ) ) ( not ( = ?auto_50393 ?auto_50398 ) ) ( not ( = ?auto_50394 ?auto_50395 ) ) ( not ( = ?auto_50394 ?auto_50396 ) ) ( not ( = ?auto_50394 ?auto_50397 ) ) ( not ( = ?auto_50394 ?auto_50398 ) ) ( not ( = ?auto_50395 ?auto_50396 ) ) ( not ( = ?auto_50395 ?auto_50397 ) ) ( not ( = ?auto_50395 ?auto_50398 ) ) ( not ( = ?auto_50396 ?auto_50397 ) ) ( not ( = ?auto_50396 ?auto_50398 ) ) ( not ( = ?auto_50397 ?auto_50398 ) ) ( ON-TABLE ?auto_50398 ) ( ON ?auto_50397 ?auto_50398 ) ( ON ?auto_50396 ?auto_50397 ) ( ON ?auto_50395 ?auto_50396 ) ( ON ?auto_50394 ?auto_50395 ) ( CLEAR ?auto_50394 ) ( ON ?auto_50393 ?auto_50399 ) ( CLEAR ?auto_50393 ) ( HAND-EMPTY ) ( not ( = ?auto_50393 ?auto_50399 ) ) ( not ( = ?auto_50394 ?auto_50399 ) ) ( not ( = ?auto_50395 ?auto_50399 ) ) ( not ( = ?auto_50396 ?auto_50399 ) ) ( not ( = ?auto_50397 ?auto_50399 ) ) ( not ( = ?auto_50398 ?auto_50399 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_50393 ?auto_50399 )
      ( MAKE-6PILE ?auto_50393 ?auto_50394 ?auto_50395 ?auto_50396 ?auto_50397 ?auto_50398 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50400 - BLOCK
      ?auto_50401 - BLOCK
      ?auto_50402 - BLOCK
      ?auto_50403 - BLOCK
      ?auto_50404 - BLOCK
      ?auto_50405 - BLOCK
    )
    :vars
    (
      ?auto_50406 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50400 ?auto_50401 ) ) ( not ( = ?auto_50400 ?auto_50402 ) ) ( not ( = ?auto_50400 ?auto_50403 ) ) ( not ( = ?auto_50400 ?auto_50404 ) ) ( not ( = ?auto_50400 ?auto_50405 ) ) ( not ( = ?auto_50401 ?auto_50402 ) ) ( not ( = ?auto_50401 ?auto_50403 ) ) ( not ( = ?auto_50401 ?auto_50404 ) ) ( not ( = ?auto_50401 ?auto_50405 ) ) ( not ( = ?auto_50402 ?auto_50403 ) ) ( not ( = ?auto_50402 ?auto_50404 ) ) ( not ( = ?auto_50402 ?auto_50405 ) ) ( not ( = ?auto_50403 ?auto_50404 ) ) ( not ( = ?auto_50403 ?auto_50405 ) ) ( not ( = ?auto_50404 ?auto_50405 ) ) ( ON-TABLE ?auto_50405 ) ( ON ?auto_50404 ?auto_50405 ) ( ON ?auto_50403 ?auto_50404 ) ( ON ?auto_50402 ?auto_50403 ) ( ON ?auto_50400 ?auto_50406 ) ( CLEAR ?auto_50400 ) ( not ( = ?auto_50400 ?auto_50406 ) ) ( not ( = ?auto_50401 ?auto_50406 ) ) ( not ( = ?auto_50402 ?auto_50406 ) ) ( not ( = ?auto_50403 ?auto_50406 ) ) ( not ( = ?auto_50404 ?auto_50406 ) ) ( not ( = ?auto_50405 ?auto_50406 ) ) ( HOLDING ?auto_50401 ) ( CLEAR ?auto_50402 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_50405 ?auto_50404 ?auto_50403 ?auto_50402 ?auto_50401 )
      ( MAKE-6PILE ?auto_50400 ?auto_50401 ?auto_50402 ?auto_50403 ?auto_50404 ?auto_50405 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50407 - BLOCK
      ?auto_50408 - BLOCK
      ?auto_50409 - BLOCK
      ?auto_50410 - BLOCK
      ?auto_50411 - BLOCK
      ?auto_50412 - BLOCK
    )
    :vars
    (
      ?auto_50413 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50407 ?auto_50408 ) ) ( not ( = ?auto_50407 ?auto_50409 ) ) ( not ( = ?auto_50407 ?auto_50410 ) ) ( not ( = ?auto_50407 ?auto_50411 ) ) ( not ( = ?auto_50407 ?auto_50412 ) ) ( not ( = ?auto_50408 ?auto_50409 ) ) ( not ( = ?auto_50408 ?auto_50410 ) ) ( not ( = ?auto_50408 ?auto_50411 ) ) ( not ( = ?auto_50408 ?auto_50412 ) ) ( not ( = ?auto_50409 ?auto_50410 ) ) ( not ( = ?auto_50409 ?auto_50411 ) ) ( not ( = ?auto_50409 ?auto_50412 ) ) ( not ( = ?auto_50410 ?auto_50411 ) ) ( not ( = ?auto_50410 ?auto_50412 ) ) ( not ( = ?auto_50411 ?auto_50412 ) ) ( ON-TABLE ?auto_50412 ) ( ON ?auto_50411 ?auto_50412 ) ( ON ?auto_50410 ?auto_50411 ) ( ON ?auto_50409 ?auto_50410 ) ( ON ?auto_50407 ?auto_50413 ) ( not ( = ?auto_50407 ?auto_50413 ) ) ( not ( = ?auto_50408 ?auto_50413 ) ) ( not ( = ?auto_50409 ?auto_50413 ) ) ( not ( = ?auto_50410 ?auto_50413 ) ) ( not ( = ?auto_50411 ?auto_50413 ) ) ( not ( = ?auto_50412 ?auto_50413 ) ) ( CLEAR ?auto_50409 ) ( ON ?auto_50408 ?auto_50407 ) ( CLEAR ?auto_50408 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_50413 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_50413 ?auto_50407 )
      ( MAKE-6PILE ?auto_50407 ?auto_50408 ?auto_50409 ?auto_50410 ?auto_50411 ?auto_50412 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50414 - BLOCK
      ?auto_50415 - BLOCK
      ?auto_50416 - BLOCK
      ?auto_50417 - BLOCK
      ?auto_50418 - BLOCK
      ?auto_50419 - BLOCK
    )
    :vars
    (
      ?auto_50420 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50414 ?auto_50415 ) ) ( not ( = ?auto_50414 ?auto_50416 ) ) ( not ( = ?auto_50414 ?auto_50417 ) ) ( not ( = ?auto_50414 ?auto_50418 ) ) ( not ( = ?auto_50414 ?auto_50419 ) ) ( not ( = ?auto_50415 ?auto_50416 ) ) ( not ( = ?auto_50415 ?auto_50417 ) ) ( not ( = ?auto_50415 ?auto_50418 ) ) ( not ( = ?auto_50415 ?auto_50419 ) ) ( not ( = ?auto_50416 ?auto_50417 ) ) ( not ( = ?auto_50416 ?auto_50418 ) ) ( not ( = ?auto_50416 ?auto_50419 ) ) ( not ( = ?auto_50417 ?auto_50418 ) ) ( not ( = ?auto_50417 ?auto_50419 ) ) ( not ( = ?auto_50418 ?auto_50419 ) ) ( ON-TABLE ?auto_50419 ) ( ON ?auto_50418 ?auto_50419 ) ( ON ?auto_50417 ?auto_50418 ) ( ON ?auto_50414 ?auto_50420 ) ( not ( = ?auto_50414 ?auto_50420 ) ) ( not ( = ?auto_50415 ?auto_50420 ) ) ( not ( = ?auto_50416 ?auto_50420 ) ) ( not ( = ?auto_50417 ?auto_50420 ) ) ( not ( = ?auto_50418 ?auto_50420 ) ) ( not ( = ?auto_50419 ?auto_50420 ) ) ( ON ?auto_50415 ?auto_50414 ) ( CLEAR ?auto_50415 ) ( ON-TABLE ?auto_50420 ) ( HOLDING ?auto_50416 ) ( CLEAR ?auto_50417 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_50419 ?auto_50418 ?auto_50417 ?auto_50416 )
      ( MAKE-6PILE ?auto_50414 ?auto_50415 ?auto_50416 ?auto_50417 ?auto_50418 ?auto_50419 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50421 - BLOCK
      ?auto_50422 - BLOCK
      ?auto_50423 - BLOCK
      ?auto_50424 - BLOCK
      ?auto_50425 - BLOCK
      ?auto_50426 - BLOCK
    )
    :vars
    (
      ?auto_50427 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50421 ?auto_50422 ) ) ( not ( = ?auto_50421 ?auto_50423 ) ) ( not ( = ?auto_50421 ?auto_50424 ) ) ( not ( = ?auto_50421 ?auto_50425 ) ) ( not ( = ?auto_50421 ?auto_50426 ) ) ( not ( = ?auto_50422 ?auto_50423 ) ) ( not ( = ?auto_50422 ?auto_50424 ) ) ( not ( = ?auto_50422 ?auto_50425 ) ) ( not ( = ?auto_50422 ?auto_50426 ) ) ( not ( = ?auto_50423 ?auto_50424 ) ) ( not ( = ?auto_50423 ?auto_50425 ) ) ( not ( = ?auto_50423 ?auto_50426 ) ) ( not ( = ?auto_50424 ?auto_50425 ) ) ( not ( = ?auto_50424 ?auto_50426 ) ) ( not ( = ?auto_50425 ?auto_50426 ) ) ( ON-TABLE ?auto_50426 ) ( ON ?auto_50425 ?auto_50426 ) ( ON ?auto_50424 ?auto_50425 ) ( ON ?auto_50421 ?auto_50427 ) ( not ( = ?auto_50421 ?auto_50427 ) ) ( not ( = ?auto_50422 ?auto_50427 ) ) ( not ( = ?auto_50423 ?auto_50427 ) ) ( not ( = ?auto_50424 ?auto_50427 ) ) ( not ( = ?auto_50425 ?auto_50427 ) ) ( not ( = ?auto_50426 ?auto_50427 ) ) ( ON ?auto_50422 ?auto_50421 ) ( ON-TABLE ?auto_50427 ) ( CLEAR ?auto_50424 ) ( ON ?auto_50423 ?auto_50422 ) ( CLEAR ?auto_50423 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_50427 ?auto_50421 ?auto_50422 )
      ( MAKE-6PILE ?auto_50421 ?auto_50422 ?auto_50423 ?auto_50424 ?auto_50425 ?auto_50426 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50428 - BLOCK
      ?auto_50429 - BLOCK
      ?auto_50430 - BLOCK
      ?auto_50431 - BLOCK
      ?auto_50432 - BLOCK
      ?auto_50433 - BLOCK
    )
    :vars
    (
      ?auto_50434 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50428 ?auto_50429 ) ) ( not ( = ?auto_50428 ?auto_50430 ) ) ( not ( = ?auto_50428 ?auto_50431 ) ) ( not ( = ?auto_50428 ?auto_50432 ) ) ( not ( = ?auto_50428 ?auto_50433 ) ) ( not ( = ?auto_50429 ?auto_50430 ) ) ( not ( = ?auto_50429 ?auto_50431 ) ) ( not ( = ?auto_50429 ?auto_50432 ) ) ( not ( = ?auto_50429 ?auto_50433 ) ) ( not ( = ?auto_50430 ?auto_50431 ) ) ( not ( = ?auto_50430 ?auto_50432 ) ) ( not ( = ?auto_50430 ?auto_50433 ) ) ( not ( = ?auto_50431 ?auto_50432 ) ) ( not ( = ?auto_50431 ?auto_50433 ) ) ( not ( = ?auto_50432 ?auto_50433 ) ) ( ON-TABLE ?auto_50433 ) ( ON ?auto_50432 ?auto_50433 ) ( ON ?auto_50428 ?auto_50434 ) ( not ( = ?auto_50428 ?auto_50434 ) ) ( not ( = ?auto_50429 ?auto_50434 ) ) ( not ( = ?auto_50430 ?auto_50434 ) ) ( not ( = ?auto_50431 ?auto_50434 ) ) ( not ( = ?auto_50432 ?auto_50434 ) ) ( not ( = ?auto_50433 ?auto_50434 ) ) ( ON ?auto_50429 ?auto_50428 ) ( ON-TABLE ?auto_50434 ) ( ON ?auto_50430 ?auto_50429 ) ( CLEAR ?auto_50430 ) ( HOLDING ?auto_50431 ) ( CLEAR ?auto_50432 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_50433 ?auto_50432 ?auto_50431 )
      ( MAKE-6PILE ?auto_50428 ?auto_50429 ?auto_50430 ?auto_50431 ?auto_50432 ?auto_50433 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50435 - BLOCK
      ?auto_50436 - BLOCK
      ?auto_50437 - BLOCK
      ?auto_50438 - BLOCK
      ?auto_50439 - BLOCK
      ?auto_50440 - BLOCK
    )
    :vars
    (
      ?auto_50441 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50435 ?auto_50436 ) ) ( not ( = ?auto_50435 ?auto_50437 ) ) ( not ( = ?auto_50435 ?auto_50438 ) ) ( not ( = ?auto_50435 ?auto_50439 ) ) ( not ( = ?auto_50435 ?auto_50440 ) ) ( not ( = ?auto_50436 ?auto_50437 ) ) ( not ( = ?auto_50436 ?auto_50438 ) ) ( not ( = ?auto_50436 ?auto_50439 ) ) ( not ( = ?auto_50436 ?auto_50440 ) ) ( not ( = ?auto_50437 ?auto_50438 ) ) ( not ( = ?auto_50437 ?auto_50439 ) ) ( not ( = ?auto_50437 ?auto_50440 ) ) ( not ( = ?auto_50438 ?auto_50439 ) ) ( not ( = ?auto_50438 ?auto_50440 ) ) ( not ( = ?auto_50439 ?auto_50440 ) ) ( ON-TABLE ?auto_50440 ) ( ON ?auto_50439 ?auto_50440 ) ( ON ?auto_50435 ?auto_50441 ) ( not ( = ?auto_50435 ?auto_50441 ) ) ( not ( = ?auto_50436 ?auto_50441 ) ) ( not ( = ?auto_50437 ?auto_50441 ) ) ( not ( = ?auto_50438 ?auto_50441 ) ) ( not ( = ?auto_50439 ?auto_50441 ) ) ( not ( = ?auto_50440 ?auto_50441 ) ) ( ON ?auto_50436 ?auto_50435 ) ( ON-TABLE ?auto_50441 ) ( ON ?auto_50437 ?auto_50436 ) ( CLEAR ?auto_50439 ) ( ON ?auto_50438 ?auto_50437 ) ( CLEAR ?auto_50438 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_50441 ?auto_50435 ?auto_50436 ?auto_50437 )
      ( MAKE-6PILE ?auto_50435 ?auto_50436 ?auto_50437 ?auto_50438 ?auto_50439 ?auto_50440 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50442 - BLOCK
      ?auto_50443 - BLOCK
      ?auto_50444 - BLOCK
      ?auto_50445 - BLOCK
      ?auto_50446 - BLOCK
      ?auto_50447 - BLOCK
    )
    :vars
    (
      ?auto_50448 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50442 ?auto_50443 ) ) ( not ( = ?auto_50442 ?auto_50444 ) ) ( not ( = ?auto_50442 ?auto_50445 ) ) ( not ( = ?auto_50442 ?auto_50446 ) ) ( not ( = ?auto_50442 ?auto_50447 ) ) ( not ( = ?auto_50443 ?auto_50444 ) ) ( not ( = ?auto_50443 ?auto_50445 ) ) ( not ( = ?auto_50443 ?auto_50446 ) ) ( not ( = ?auto_50443 ?auto_50447 ) ) ( not ( = ?auto_50444 ?auto_50445 ) ) ( not ( = ?auto_50444 ?auto_50446 ) ) ( not ( = ?auto_50444 ?auto_50447 ) ) ( not ( = ?auto_50445 ?auto_50446 ) ) ( not ( = ?auto_50445 ?auto_50447 ) ) ( not ( = ?auto_50446 ?auto_50447 ) ) ( ON-TABLE ?auto_50447 ) ( ON ?auto_50442 ?auto_50448 ) ( not ( = ?auto_50442 ?auto_50448 ) ) ( not ( = ?auto_50443 ?auto_50448 ) ) ( not ( = ?auto_50444 ?auto_50448 ) ) ( not ( = ?auto_50445 ?auto_50448 ) ) ( not ( = ?auto_50446 ?auto_50448 ) ) ( not ( = ?auto_50447 ?auto_50448 ) ) ( ON ?auto_50443 ?auto_50442 ) ( ON-TABLE ?auto_50448 ) ( ON ?auto_50444 ?auto_50443 ) ( ON ?auto_50445 ?auto_50444 ) ( CLEAR ?auto_50445 ) ( HOLDING ?auto_50446 ) ( CLEAR ?auto_50447 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_50447 ?auto_50446 )
      ( MAKE-6PILE ?auto_50442 ?auto_50443 ?auto_50444 ?auto_50445 ?auto_50446 ?auto_50447 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50449 - BLOCK
      ?auto_50450 - BLOCK
      ?auto_50451 - BLOCK
      ?auto_50452 - BLOCK
      ?auto_50453 - BLOCK
      ?auto_50454 - BLOCK
    )
    :vars
    (
      ?auto_50455 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50449 ?auto_50450 ) ) ( not ( = ?auto_50449 ?auto_50451 ) ) ( not ( = ?auto_50449 ?auto_50452 ) ) ( not ( = ?auto_50449 ?auto_50453 ) ) ( not ( = ?auto_50449 ?auto_50454 ) ) ( not ( = ?auto_50450 ?auto_50451 ) ) ( not ( = ?auto_50450 ?auto_50452 ) ) ( not ( = ?auto_50450 ?auto_50453 ) ) ( not ( = ?auto_50450 ?auto_50454 ) ) ( not ( = ?auto_50451 ?auto_50452 ) ) ( not ( = ?auto_50451 ?auto_50453 ) ) ( not ( = ?auto_50451 ?auto_50454 ) ) ( not ( = ?auto_50452 ?auto_50453 ) ) ( not ( = ?auto_50452 ?auto_50454 ) ) ( not ( = ?auto_50453 ?auto_50454 ) ) ( ON-TABLE ?auto_50454 ) ( ON ?auto_50449 ?auto_50455 ) ( not ( = ?auto_50449 ?auto_50455 ) ) ( not ( = ?auto_50450 ?auto_50455 ) ) ( not ( = ?auto_50451 ?auto_50455 ) ) ( not ( = ?auto_50452 ?auto_50455 ) ) ( not ( = ?auto_50453 ?auto_50455 ) ) ( not ( = ?auto_50454 ?auto_50455 ) ) ( ON ?auto_50450 ?auto_50449 ) ( ON-TABLE ?auto_50455 ) ( ON ?auto_50451 ?auto_50450 ) ( ON ?auto_50452 ?auto_50451 ) ( CLEAR ?auto_50454 ) ( ON ?auto_50453 ?auto_50452 ) ( CLEAR ?auto_50453 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_50455 ?auto_50449 ?auto_50450 ?auto_50451 ?auto_50452 )
      ( MAKE-6PILE ?auto_50449 ?auto_50450 ?auto_50451 ?auto_50452 ?auto_50453 ?auto_50454 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50456 - BLOCK
      ?auto_50457 - BLOCK
      ?auto_50458 - BLOCK
      ?auto_50459 - BLOCK
      ?auto_50460 - BLOCK
      ?auto_50461 - BLOCK
    )
    :vars
    (
      ?auto_50462 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50456 ?auto_50457 ) ) ( not ( = ?auto_50456 ?auto_50458 ) ) ( not ( = ?auto_50456 ?auto_50459 ) ) ( not ( = ?auto_50456 ?auto_50460 ) ) ( not ( = ?auto_50456 ?auto_50461 ) ) ( not ( = ?auto_50457 ?auto_50458 ) ) ( not ( = ?auto_50457 ?auto_50459 ) ) ( not ( = ?auto_50457 ?auto_50460 ) ) ( not ( = ?auto_50457 ?auto_50461 ) ) ( not ( = ?auto_50458 ?auto_50459 ) ) ( not ( = ?auto_50458 ?auto_50460 ) ) ( not ( = ?auto_50458 ?auto_50461 ) ) ( not ( = ?auto_50459 ?auto_50460 ) ) ( not ( = ?auto_50459 ?auto_50461 ) ) ( not ( = ?auto_50460 ?auto_50461 ) ) ( ON ?auto_50456 ?auto_50462 ) ( not ( = ?auto_50456 ?auto_50462 ) ) ( not ( = ?auto_50457 ?auto_50462 ) ) ( not ( = ?auto_50458 ?auto_50462 ) ) ( not ( = ?auto_50459 ?auto_50462 ) ) ( not ( = ?auto_50460 ?auto_50462 ) ) ( not ( = ?auto_50461 ?auto_50462 ) ) ( ON ?auto_50457 ?auto_50456 ) ( ON-TABLE ?auto_50462 ) ( ON ?auto_50458 ?auto_50457 ) ( ON ?auto_50459 ?auto_50458 ) ( ON ?auto_50460 ?auto_50459 ) ( CLEAR ?auto_50460 ) ( HOLDING ?auto_50461 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_50461 )
      ( MAKE-6PILE ?auto_50456 ?auto_50457 ?auto_50458 ?auto_50459 ?auto_50460 ?auto_50461 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50463 - BLOCK
      ?auto_50464 - BLOCK
      ?auto_50465 - BLOCK
      ?auto_50466 - BLOCK
      ?auto_50467 - BLOCK
      ?auto_50468 - BLOCK
    )
    :vars
    (
      ?auto_50469 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50463 ?auto_50464 ) ) ( not ( = ?auto_50463 ?auto_50465 ) ) ( not ( = ?auto_50463 ?auto_50466 ) ) ( not ( = ?auto_50463 ?auto_50467 ) ) ( not ( = ?auto_50463 ?auto_50468 ) ) ( not ( = ?auto_50464 ?auto_50465 ) ) ( not ( = ?auto_50464 ?auto_50466 ) ) ( not ( = ?auto_50464 ?auto_50467 ) ) ( not ( = ?auto_50464 ?auto_50468 ) ) ( not ( = ?auto_50465 ?auto_50466 ) ) ( not ( = ?auto_50465 ?auto_50467 ) ) ( not ( = ?auto_50465 ?auto_50468 ) ) ( not ( = ?auto_50466 ?auto_50467 ) ) ( not ( = ?auto_50466 ?auto_50468 ) ) ( not ( = ?auto_50467 ?auto_50468 ) ) ( ON ?auto_50463 ?auto_50469 ) ( not ( = ?auto_50463 ?auto_50469 ) ) ( not ( = ?auto_50464 ?auto_50469 ) ) ( not ( = ?auto_50465 ?auto_50469 ) ) ( not ( = ?auto_50466 ?auto_50469 ) ) ( not ( = ?auto_50467 ?auto_50469 ) ) ( not ( = ?auto_50468 ?auto_50469 ) ) ( ON ?auto_50464 ?auto_50463 ) ( ON-TABLE ?auto_50469 ) ( ON ?auto_50465 ?auto_50464 ) ( ON ?auto_50466 ?auto_50465 ) ( ON ?auto_50467 ?auto_50466 ) ( ON ?auto_50468 ?auto_50467 ) ( CLEAR ?auto_50468 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_50469 ?auto_50463 ?auto_50464 ?auto_50465 ?auto_50466 ?auto_50467 )
      ( MAKE-6PILE ?auto_50463 ?auto_50464 ?auto_50465 ?auto_50466 ?auto_50467 ?auto_50468 ) )
  )

)

